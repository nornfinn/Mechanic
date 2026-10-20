"""Generate ``resources/deprecated_apis.json`` from Blizzard's UI source.

Usage::

    python -m mechanic.deprecations_builder <wow-ui-source-dir> [output.json]
        [--compare [game=]<other-source-dir>] ...

With ``--compare`` the sources are merged and every sourced entry lists the
game types (``standard``, ``forever``, ...) whose UI ships its shim; the game
type is read from each source's ``version.txt`` unless given as ``game=path``.

Entries in the existing output file that the new source no longer contains
are kept with ``"origin": "removed"`` and severity ``error`` (Blizzard deleted
the shim, so the old name no longer exists); pass ``--drop-removed`` to omit them.

Sources (read-only):

* ``Blizzard_Deprecated*/Deprecated*.lua`` - the shims behind
  ``loadDeprecationFallbacks``. They alias a removed global to its replacement
  (``GetAddOnInfo = C_AddOns.GetAddOnInfo``) or re-implement it in a function
  whose body calls the replacement. A leading ``-- Use X instead`` comment is
  honoured.
* ``*TransitionGuide.lua`` - the "Converted Functions" lines of Blizzard's
  migration guides (``IsUsableSpell(spellID/name) = C_Spell.IsSpellUsable(...)``).

A few well-known moves whose shims no longer exist in the source are listed in
``CURATED`` and marked ``"origin": "curated"``.
"""

import json
import re
import subprocess
import sys
from datetime import date
from pathlib import Path
from typing import Dict, List, Optional, Tuple

from .resources import resource_path
from .toc_flavors import GAME_SUFFIXES, game_for_version

_NAME = r"[A-Za-z_]\w*(?:\.[A-Za-z_]\w*)*"
_ALIAS = re.compile(rf"^\t?({_NAME})\s*=\s*({_NAME})\s*;?\s*(?:--.*)?$")
_FUNCTION = re.compile(rf"^\t?function\s+({_NAME})\s*\(")
_ASSIGN_FUNCTION = re.compile(rf"^\t?({_NAME})\s*=\s*function\s*\(")
_USE_INSTEAD = re.compile(rf"\bUse\s+({_NAME})\s+instead", re.IGNORECASE)
_C_CALL = re.compile(r"\b(C_[A-Za-z0-9_]+\.[A-Za-z0-9_]+)\s*\(")
_RETURN_CALL = re.compile(rf"^\s*return\s+({_NAME})\s*\(")
_FIRST_CALL = re.compile(r"^\s*([A-Za-z_]\w*(?:[.:][A-Za-z_]\w*)+)\s*\(")
_GUIDE_LINE = re.compile(
    rf"^({_NAME})\([^)]*\)\s*=\s*(C_[A-Za-z0-9_]+\.[A-Za-z0-9_]+)\("
)
_VERSION_IN_NAME = re.compile(r"(\d+)_(\d+)_(\d+)")
_VERSION_IN_TEXT = re.compile(r"deprecated in (\d+\.\d+\.\d+)", re.IGNORECASE)
_LITERALS = {"nil", "true", "false"}

CATEGORY_BY_NAMESPACE = {
    "C_AddOns": "addons",
    "C_Spell": "spells",
    "C_SpellBook": "spells",
    "C_SpecializationInfo": "specialization",
    "C_Item": "items",
    "C_ItemSocketInfo": "items",
    "C_Container": "containers",
    "C_ChatInfo": "chat",
    "C_PvP": "pvp",
    "C_PetInfo": "pets",
}
CATEGORY_BY_FOLDER = {
    "chatinfo": "chat",
    "currencyscript": "currency",
    "guildscript": "guild",
    "itemscript": "items",
    "itemsocketinfo": "items",
    "lfg": "lfg",
    "petinfo": "pets",
    "pvpscript": "pvp",
    "soundscript": "sound",
    "specialization": "specialization",
    "spellbook": "spells",
    "spellscript": "spells",
    "tradeinfo": "trade",
    "unitscript": "units",
}

# Moves that are well known but whose shims are no longer in the source. The
# replacements exist in Blizzard_APIDocumentationGenerated.
CURATED = [
    ("GetSpellInfo", "C_Spell.GetSpellInfo", "spells", "11.0.0"),
    ("GetAddOnInfo", "C_AddOns.GetAddOnInfo", "addons", "10.2.0"),
    ("IsAddOnLoaded", "C_AddOns.IsAddOnLoaded", "addons", "10.2.0"),
    ("LoadAddOn", "C_AddOns.LoadAddOn", "addons", "10.2.0"),
]


def _category(old: str, new: str, folder: str = "") -> str:
    for name in (new, old):
        namespace = name.split(".", 1)[0]
        if namespace.startswith("C_") and "." in name:
            return CATEGORY_BY_NAMESPACE.get(
                namespace, namespace.removeprefix("C_").lower()
            )
    key = folder.removeprefix("Blizzard_Deprecated").strip("_").lower()
    return CATEGORY_BY_FOLDER.get(key, "general")


def _entry(old: str, new: str, since: str, folder: str, origin: str, notes: str = ""):
    return {
        "old": old,
        "new": new,
        "severity": "warning",
        "category": _category(old, new, folder),
        "since": since,
        "notes": notes,
        "origin": origin,
    }


def _too_generic(old: str) -> bool:
    """Plain lowercase words (``message``) would flag every addon local of that name."""
    return old.islower() and "." not in old


def _since(text: str, source_name: str) -> str:
    match = _VERSION_IN_TEXT.search(text)
    if match:
        return match.group(1)
    match = _VERSION_IN_NAME.search(source_name)
    return ".".join(match.groups()) if match else ""


def _block_end(lines: List[str], start: int, indent: str) -> int:
    """Index of the ``end`` closing the function opened at ``lines[start]``."""
    for index in range(start + 1, len(lines)):
        if (
            lines[index].startswith(indent + "end")
            and not lines[index][len(indent) + 3 : len(indent) + 4].isalnum()
        ):
            return index
    return len(lines) - 1


def _leading_comment(lines: List[str], index: int) -> str:
    collected: List[str] = []
    while index > 0 and lines[index - 1].strip().startswith("--"):
        index -= 1
        collected.insert(0, lines[index].strip().lstrip("-").strip())
    return " ".join(c for c in collected if c)[:200]


def parse_deprecated_lua(
    text: str, source_name: str = "", folder: str = ""
) -> List[dict]:
    """Extract deprecation entries from one ``Deprecated*.lua`` file."""
    since = _since(text, source_name)
    lines = text.splitlines()
    entries: Dict[str, dict] = {}

    def add(old: str, new: str, notes: str) -> None:
        if _too_generic(old):
            return
        if old != new and ":" not in old and old not in entries:
            entries[old] = _entry(old, new, since, folder, "blizzard-deprecated", notes)

    index = 0
    while index < len(lines):
        line = lines[index]
        function = _FUNCTION.match(line) or _ASSIGN_FUNCTION.match(line)
        if function:
            indent = "\t" if line.startswith("\t") else ""
            one_liner = re.search(r"\)\s.*\bend\s*;?\s*(?:--.*)?$", line)
            end = index if one_liner else _block_end(lines, index, indent)
            body = [line] if one_liner else lines[index + 1 : end]
            comment = _leading_comment(lines, index)
            hint = _USE_INSTEAD.search(comment) or next(
                (m for m in map(_USE_INSTEAD.search, body) if m), None
            )
            replacement = hint.group(1) if hint else ""
            if not replacement:
                for body_line in body:
                    call = _C_CALL.search(body_line)
                    if call:
                        replacement = call.group(1)
                        break
            if not replacement:
                for body_line in body:
                    ret = _RETURN_CALL.match(body_line)
                    if ret and ret.group(1) != function.group(1):
                        replacement = ret.group(1)
                        break
            if not replacement:
                for body_line in body:
                    first = _FIRST_CALL.match(body_line)
                    if first:
                        replacement = first.group(1)
                        break
            if not replacement:
                comment = (
                    comment + " No direct replacement; Blizzard re-implements it."
                ).strip()
            add(function.group(1), replacement, comment)
            index = end + 1
            continue
        alias = _ALIAS.match(line)
        if alias and alias.group(2) not in _LITERALS:
            add(alias.group(1), alias.group(2), _leading_comment(lines, index))
        index += 1
    return list(entries.values())


def parse_transition_guide(text: str, source_name: str = "") -> List[dict]:
    """``Old(args) = C_X.New(args)`` lines of a Blizzard migration guide."""
    since = _since("", source_name)
    entries: Dict[str, dict] = {}
    for line in text.splitlines():
        match = _GUIDE_LINE.match(line)
        if not match:
            continue
        old, new = match.groups()
        if old in entries:
            if new != entries[old]["new"] and new not in entries[old]["notes"]:
                entries[old]["notes"] = f"{entries[old]['notes']} Also: {new}".strip()
            continue
        entries[old] = _entry(old, new, since, "", "transition-guide")
    return list(entries.values())


def _source_version(source_dir: Path) -> Optional[str]:
    for candidate in (source_dir, *source_dir.glob("*")):
        version = candidate / "version.txt"
        if version.is_file():
            return version.read_text(encoding="utf-8", errors="replace").strip()
    return None


def build_database(source_dir: Path, source_commit: Optional[str] = None) -> dict:
    source_dir = Path(source_dir)
    apis: Dict[str, dict] = {}
    deprecated = sorted(
        p
        for p in source_dir.rglob("Deprecated*.lua")
        if p.parent.name.startswith("Blizzard_Deprecated")
    )
    guides = sorted(source_dir.rglob("*TransitionGuide.lua"))
    for path in deprecated:
        text = path.read_text(encoding="utf-8", errors="replace")
        for entry in parse_deprecated_lua(text, path.name, path.parent.name):
            apis.setdefault(entry["old"], entry)
    for path in guides:
        text = path.read_text(encoding="utf-8", errors="replace")
        for entry in parse_transition_guide(text, path.name):
            apis.setdefault(entry["old"], entry)
    sourced = len(apis)
    for old, new, category, since in CURATED:
        apis.setdefault(
            old, _entry(old, new, since, "", "curated") | {"category": category}
        )

    ui_version = _source_version(source_dir)
    return {
        "version": date.today().isoformat()
        + (f"+ui-{ui_version}" if ui_version else "")
        + (f"+{source_commit[:10]}" if source_commit else ""),
        "complete": sourced > 0,
        "source": {
            "path": source_dir.name,
            "ui_version": ui_version,
            "commit": source_commit,
            "files": [p.name for p in deprecated + guides],
            "from_source": sourced,
            "curated": len(apis) - sourced,
        },
        "apis": sorted(apis.values(), key=lambda e: e["old"]),
    }


def _git_commit(directory: Path) -> Optional[str]:
    try:
        out = subprocess.run(
            ["git", "-C", str(directory), "rev-parse", "HEAD"],
            capture_output=True,
            text=True,
            timeout=10,
        )
    except (OSError, subprocess.TimeoutExpired):
        return None
    return out.stdout.strip() if out.returncode == 0 else None


def render(database: dict) -> str:
    """JSON with one API per line so regenerated files diff cleanly."""
    header = {k: v for k, v in database.items() if k != "apis"}
    head = json.dumps(header, indent=2)[:-2]  # drop the closing "\n}"
    rows = ",\n".join(
        "    " + json.dumps(entry, ensure_ascii=False) for entry in database["apis"]
    )
    return f'{head},\n  "apis": [\n{rows}\n  ]\n}}\n'


def build_game_database(sources: List[Tuple[str, Path, Optional[str]]]) -> dict:
    """Merge per-game databases; each sourced entry lists the games shipping its shim.

    ``sources`` is ``[(game, source_dir, commit), ...]``; the first is primary
    and supplies the header. Curated entries carry no ``games`` (they apply to
    every client).
    """
    merged: Optional[dict] = None
    games: Dict[str, Optional[str]] = {}
    by_old: Dict[str, dict] = {}
    for game, source_dir, commit in sources:
        database = build_database(source_dir, commit)
        games[game] = database["source"]["ui_version"]
        if merged is None:
            merged = database
        for entry in database["apis"]:
            if entry.get("origin") == "curated":
                by_old.setdefault(entry["old"], entry)
                continue
            existing = by_old.get(entry["old"])
            if existing is None or existing.get("origin") == "curated":
                by_old[entry["old"]] = dict(entry, games=[game])
            elif game not in existing.setdefault("games", []):
                existing["games"].append(game)
    assert merged is not None
    merged["games"] = games
    merged["apis"] = sorted(by_old.values(), key=lambda e: e["old"])
    merged["source"]["from_source"] = sum(
        1 for e in merged["apis"] if e.get("origin") != "curated"
    )
    merged["source"]["curated"] = len(merged["apis"]) - merged["source"]["from_source"]
    return merged


REMOVED_NOTE = (
    "Blizzard removed this compatibility shim in {version}; the old name no "
    "longer exists there, so calling it errors"
)


def carry_removed(database: dict, previous: dict) -> int:
    """Keep entries the new source dropped, marked ``"origin": "removed"``.

    A shim disappearing from ``Blizzard_Deprecated`` means the old global was
    deleted, which is worse than deprecated, so the entry stays (as an error)
    instead of silently leaving the scan. Returns the number carried over.
    """
    present = {entry["old"] for entry in database["apis"]}
    version = database["source"].get("ui_version") or "the current UI"
    carried = 0
    for entry in previous.get("apis", []):
        old = entry.get("old")
        if not old or old in present or entry.get("origin") == "curated":
            continue
        kept = dict(entry)
        if kept.get("origin") != "removed":
            kept["origin"] = "removed"
            kept["severity"] = "error"
            kept["removed_in"] = version
            kept["notes"] = REMOVED_NOTE.format(version=version)
        kept.pop("games", None)
        database["apis"].append(kept)
        present.add(old)
        carried += 1
    database["apis"].sort(key=lambda e: e["old"])
    database["source"]["removed"] = carried
    return carried


def _parse_args(argv: List[str]) -> Tuple[List[str], List[str], bool]:
    positional, compare, drop_removed = [], [], False
    items = iter(argv)
    for item in items:
        if item == "--compare":
            compare.append(next(items, ""))
        elif item == "--drop-removed":
            drop_removed = True
        else:
            positional.append(item)
    return positional, [c for c in compare if c], drop_removed


def _game_source(spec: str) -> Tuple[Optional[str], Path]:
    name, sep, path = spec.partition("=")
    if sep and name.strip().lower() in GAME_SUFFIXES:
        return name.strip().lower(), Path(path.strip())
    return None, Path(spec)


def main(argv: List[str]) -> int:
    positional, compare, drop_removed = _parse_args(argv)
    if not positional:
        print(__doc__)
        return 2
    source = Path(positional[0])
    target = (
        Path(positional[1])
        if len(positional) > 1
        else resource_path("deprecated_apis.json")
    )
    if compare:
        specs = [(None, source)] + [_game_source(c) for c in compare]
        sources = []
        for game, path in specs:
            game = game or game_for_version(_source_version(path) or "")
            if not game:
                print(
                    f"Cannot tell which game {path} is for; use --compare game=path",
                    file=sys.stderr,
                )
                return 2
            sources.append((game, path, _git_commit(path)))
        database = build_game_database(sources)
    else:
        database = build_database(source, _git_commit(source))
    if not database["source"]["from_source"]:
        print(f"No deprecated API shims found under {source}", file=sys.stderr)
        return 1
    carried = 0
    if not drop_removed and target.is_file():
        try:
            previous = json.loads(target.read_text(encoding="utf-8"))
        except (OSError, ValueError):
            previous = {}
        carried = carry_removed(database, previous)
    target.write_text(render(database), encoding="utf-8")
    print(
        f"Wrote {len(database['apis'])} APIs to {target} "
        f"({database['source']['from_source']} from source, "
        f"{database['source']['curated']} curated, {carried} removed)"
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main(sys.argv[1:]))
