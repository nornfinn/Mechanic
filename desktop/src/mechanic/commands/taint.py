"""diagnostic.taint: read the client's taint log and group what tainted what.

The client writes ``<client>/Logs/taint.log`` when the ``taintLog`` console
variable is set (``/console taintLog 1``; ``2`` is more verbose). Every line
starts with a ``M/D HH:MM:SS.mmm`` timestamp. An event line names the addon
blamed, and the stack lines that follow show the code path, for example::

    4/23 23:37:50.364 An action was blocked in combat because of taint from sUI - ActionButton9:Show()
    4/23 23:37:50.364 Interface\\FrameXML\\ActionButton.lua:301
    8/24 15:43:55.084 Global variable stringHeight tainted by !Aurora_RealUI
    8/24 15:43:55.084 Interface\\AddOns\\Blizzard_ObjectiveTracker\\Blizzard_QuestObjectiveTracker.lua:71 SetBlockHeader()

The log is a per-client file, so only the target's client is used.
"""

import asyncio
import re
from collections import Counter
from pathlib import Path
from typing import Any, Dict, List, Optional

from afd import CommandResult, error, success
from afd.core.metadata import create_source
from pydantic import BaseModel, Field

from ..targets import (
    DiagnosticTarget,
    TargetError,
    canonical_client,
    discover_targets,
    matches_target,
)

MAX_LOG_BYTES = 4 * 1024 * 1024
MAX_FRAMES = 20

_TIMESTAMP = re.compile(r"^(\d{1,2}/\d{1,2} \d{1,2}:\d{2}:\d{2}(?:\.\d+)?)\s+(.*)$")
_EVENTS = [
    (
        "blocked",
        re.compile(
            r"^An action was (?P<verb>blocked|forbidden)(?P<combat> in combat)? because "
            r"of taint from (?P<addon>.+?) - (?P<detail>.+)$",
            re.IGNORECASE,
        ),
    ),
    (
        "global",
        re.compile(
            r"^Global variable (?P<detail>\S+) tainted by (?P<addon>.+?)(?: - (?P<loc>.+))?$",
            re.IGNORECASE,
        ),
    ),
    (
        "execution",
        re.compile(
            r"^Execution tainted by (?P<addon>.+?) while (?P<detail>.+?)(?: - (?P<loc>.+))?$",
            re.IGNORECASE,
        ),
    ),
    (
        "other",
        re.compile(r"^(?P<detail>.*?) tainted by (?P<addon>\S+)", re.IGNORECASE),
    ),
]
_FRAME = re.compile(
    r"^(?P<file>[^\s:][^:]*\.(?:lua|xml)):(?P<line>\d+)(?:\s+(?P<func>.+))?$",
    re.IGNORECASE,
)


class TaintLogInput(BaseModel):
    target: Optional[DiagnosticTarget] = Field(
        None, description="Diagnostic target; only its client folder is used"
    )
    log_path: Optional[str] = Field(
        None, description="Read this taint.log instead of <client>/Logs/taint.log"
    )
    addon: Optional[str] = Field(
        None, description="Only entries blamed on this addon (case-insensitive)"
    )
    kind: Optional[str] = Field(
        None, description="Only this kind: blocked, global, execution or other"
    )
    limit: int = Field(50, ge=1, le=500, description="Max entries to return")


class TaintLogResult(BaseModel):
    log_file: str
    total: int = Field(..., description="Matching entries in the log")
    truncated: bool = Field(
        False, description="Only the last 4 MB of a larger log was read"
    )
    by_addon: Dict[str, int] = {}
    by_kind: Dict[str, int] = {}
    entries: List[Dict[str, Any]] = Field(
        default_factory=list, description="Newest first"
    )


def parse_frame(text: str) -> Dict[str, Any]:
    match = _FRAME.match(text.strip())
    if not match:
        return {"text": text.strip()}
    frame: Dict[str, Any] = {
        "text": text.strip(),
        "file": match.group("file"),
        "line": int(match.group("line")),
    }
    if match.group("func"):
        frame["function"] = match.group("func").strip()
    return frame


def _in_addon(frame: Dict[str, Any], addon: str) -> bool:
    path = frame.get("file", "").replace("\\", "/").lower()
    return f"addons/{addon.lower()}/" in path


def parse_taint_log(text: str) -> List[Dict[str, Any]]:
    """Parse taint.log text into entries (oldest first)."""
    entries: List[Dict[str, Any]] = []
    current: Optional[Dict[str, Any]] = None
    for raw in text.splitlines():
        match = _TIMESTAMP.match(raw.strip())
        if not match:
            continue
        stamp, message = match.group(1), match.group(2).strip()
        if not message:
            continue
        event = None
        for kind, pattern in _EVENTS:
            found = pattern.match(message)
            if found:
                event = (kind, found)
                break
        if event:
            kind, found = event
            groups = found.groupdict()
            current = {
                "time": stamp,
                "kind": kind,
                "addon": groups["addon"].strip(),
                "detail": (groups.get("detail") or "").strip(),
                "message": message,
                "frames": [],
            }
            if kind == "blocked":
                current["forbidden"] = groups["verb"].lower() == "forbidden"
                current["in_combat"] = bool(groups.get("combat"))
            if groups.get("loc"):
                current["frames"].append(parse_frame(groups["loc"]))
            entries.append(current)
        elif current is not None and len(current["frames"]) < MAX_FRAMES:
            current["frames"].append(parse_frame(message))

    for entry in entries:
        origin = next(
            (
                f
                for f in entry["frames"]
                if "file" in f and _in_addon(f, entry["addon"])
            ),
            None,
        )
        if origin:
            entry["addon_frame"] = origin
    return entries


def _read_tail(path: Path) -> tuple:
    size = path.stat().st_size
    with path.open("rb") as handle:
        if size > MAX_LOG_BYTES:
            handle.seek(size - MAX_LOG_BYTES)
            handle.readline()  # drop the partial first line
        data = handle.read()
    return data.decode("utf-8", errors="replace"), size > MAX_LOG_BYTES


def _resolve_log(input: TaintLogInput) -> Path:
    if input.log_path:
        return Path(input.log_path)
    selector = input.target or DiagnosticTarget()
    candidates = [c for c in discover_targets() if matches_target(c, selector)]
    clients = {canonical_client(c.client): c for c in candidates if c.client}
    if len(clients) != 1:
        raise TargetError(
            "TARGET_AMBIGUOUS" if clients else "TARGET_NOT_FOUND",
            "Several clients match; pass target.client."
            if clients
            else "No diagnostic target matches.",
            candidates or discover_targets(),
        )
    chosen = next(iter(clients.values()))
    return Path(chosen.client) / "Logs" / "diagnostic.taint"


def build_taint_report(input: TaintLogInput) -> TaintLogResult:
    path = _resolve_log(input)
    text, truncated = _read_tail(path)
    entries = parse_taint_log(text)
    if input.addon:
        wanted = input.addon.lower()
        entries = [e for e in entries if e["addon"].lower() == wanted]
    if input.kind:
        entries = [e for e in entries if e["kind"] == input.kind.lower()]
    return TaintLogResult(
        log_file=str(path),
        total=len(entries),
        truncated=truncated,
        by_addon=dict(Counter(e["addon"] for e in entries).most_common()),
        by_kind=dict(Counter(e["kind"] for e in entries).most_common()),
        entries=list(reversed(entries))[: input.limit],
    )


def register_commands(server):
    @server.command(
        name="diagnostic.taint",
        description=(
            "Read the client's Logs/taint.log (enable with /console taintLog 1) and "
            "group blocked actions and tainted variables by the addon blamed"
        ),
        input_schema=TaintLogInput,
        output_schema=TaintLogResult,
    )
    async def taint_log(
        input: TaintLogInput, context: Any = None
    ) -> CommandResult[TaintLogResult]:
        try:
            result = await asyncio.to_thread(build_taint_report, input)
        except TargetError as exc:
            return exc.result()
        except FileNotFoundError as exc:
            return error(
                code="TAINT_LOG_NOT_FOUND",
                message=f"No taint log at {exc.filename}",
                suggestion=(
                    "Run /console taintLog 1 in game (2 for more detail), /reload, "
                    "reproduce the problem, then call diagnostic.taint again"
                ),
            )
        except OSError as exc:
            return error(
                code="TAINT_LOG_UNREADABLE",
                message=f"Could not read the taint log: {exc}",
                suggestion="Check that the file is not locked and is readable",
            )

        top = ", ".join(f"{a} ({n})" for a, n in list(result.by_addon.items())[:3])
        reasoning = f"{result.total} taint entries" + (
            f"; most from {top}" if top else ""
        )
        if result.truncated:
            reasoning += "; only the last 4 MB of the log was read"
        return success(
            data=result,
            reasoning=reasoning,
            sources=[
                create_source(
                    type="file",
                    id="taint-log",
                    title="diagnostic.taint",
                    location=result.log_file,
                )
            ],
        )
