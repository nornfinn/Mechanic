"""Client-flavor rules for addon TOC files.

The WoW client picks one TOC per addon by suffix: a game-type suffix that
matches the running client (``Addon_Forever.toc``), then a family suffix
(``Addon_Mainline.toc``), then the unsuffixed ``Addon.toc``. TOC file lines may
also contain variables such as ``[Game]`` that the client expands at load time.

WoW: Forever (game type ``camelot``, aliased ``forever`` from 1.60.1 beta 4) is
a game type in the Mainline family, so a Forever client falls back to
``_Mainline.toc`` when an addon ships no Forever-specific TOC.

Reference: https://warcraft.wiki.gg/wiki/TOC_format
"""

from __future__ import annotations

import re
from dataclasses import dataclass, field
from pathlib import Path
from typing import Dict, Iterable, List, Optional, Sequence, Tuple

# Game-type suffixes (highest priority), keyed by game type, in client spelling.
GAME_SUFFIXES: Dict[str, Tuple[str, ...]] = {
    "standard": ("Standard",),
    "forever": ("Forever", "Camelot"),
    "mists": ("Mists",),
    "cata": ("Cata",),
    "wrath": ("Wrath",),
    "tbc": ("TBC",),
    "vanilla": ("Vanilla",),
    "plunderstorm": ("Plunderstorm", "WoWLabs"),
    "wowhack": ("WoWHack",),
}

# Family suffixes (lower priority than game types).
FAMILY_SUFFIXES: Dict[str, Tuple[str, ...]] = {
    "mainline": ("standard", "forever", "plunderstorm", "wowhack"),
    "classic": ("vanilla", "tbc", "wrath", "cata", "mists"),
}
FAMILY_SPELLING = {"mainline": "Mainline", "classic": "Classic"}

# Values accepted by ## AllowLoadGameType / ## ExcludeLoadGameType (case-insensitive).
LOAD_GAME_TYPES = frozenset(
    {
        "standard",
        "forever",
        "camelot",
        "mists",
        "cata",
        "wrath",
        "tbc",
        "vanilla",
        "plunderstorm",
        "wowhack",
        "mainline",
        "classic",
    }
)

# Interface numbers used by WoW: Forever builds.
FOREVER_INTERFACES = frozenset({"16001"})
FOREVER_LABEL = "WoW: Forever"

TEXT_LOCALES = (
    "enUS",
    "deDE",
    "esES",
    "esMX",
    "frFR",
    "itIT",
    "koKR",
    "ptBR",
    "ruRU",
    "zhCN",
    "zhTW",
)

# Expansions the client may substitute for each TOC file-line variable.
TOC_VARIABLES: Dict[str, Tuple[str, ...]] = {
    "Family": ("Mainline", "Classic"),
    "Game": tuple(
        spelling for spellings in GAME_SUFFIXES.values() for spelling in spellings
    ),
    "TextLocale": TEXT_LOCALES,
    "RegionalTextLocale": TEXT_LOCALES + ("enGB", "ptPT"),
}
_VARIABLE_RE = re.compile(r"\[(" + "|".join(TOC_VARIABLES) + r")\]")

_SUFFIX_TO_GAMES: Dict[str, Tuple[str, ...]] = {}
for _game, _spellings in GAME_SUFFIXES.items():
    for _spelling in _spellings:
        _SUFFIX_TO_GAMES[_spelling.lower()] = (_game,)
for _family, _games in FAMILY_SUFFIXES.items():
    _SUFFIX_TO_GAMES[_family] = _games


def game_for_version(wow_version: str) -> Optional[str]:
    """Game type for a client version: 12.x -> standard, 1.60.x -> forever, ...

    WoW: Forever numbers its builds 1.60+, above Classic Era's 1.15.
    """
    match = re.match(r"^(\d+)\.(\d+)", wow_version or "")
    if not match:
        return None
    major, minor = int(match.group(1)), int(match.group(2))
    if major >= 10:
        return "standard"
    if major == 1:
        return "forever" if minor >= 60 else "vanilla"
    return {2: "tbc", 3: "wrath", 4: "cata", 5: "mists"}.get(major)


@dataclass
class TocFlavor:
    """Which clients a TOC file is written for."""

    path: Path
    suffix: Optional[str]  # e.g. "Forever", "Mainline"; None when unsuffixed
    kind: str  # "game", "family", "default" or "unrelated"
    games: Tuple[str, ...] = field(default_factory=tuple)


def classify_toc(toc_path: Path, addon_name: str) -> TocFlavor:
    """Classify a TOC by its file-name suffix relative to the addon folder name."""
    stem = toc_path.stem
    if stem.lower() == addon_name.lower():
        return TocFlavor(toc_path, None, "default", tuple(GAME_SUFFIXES))
    prefix = addon_name.lower() + "_"
    if stem.lower().startswith(prefix):
        suffix = stem[len(prefix) :]
        games = _SUFFIX_TO_GAMES.get(suffix.lower())
        if games is not None:
            kind = "family" if suffix.lower() in FAMILY_SUFFIXES else "game"
            return TocFlavor(toc_path, suffix, kind, games)
    return TocFlavor(toc_path, None, "unrelated")


def toc_for_game(
    toc_paths: Iterable[Path], addon_name: str, game: str
) -> Optional[Path]:
    """Return the TOC the given game type's client would load, or None.

    Order: game-type suffix, then family suffix, then the unsuffixed TOC.
    """
    flavors = [classify_toc(p, addon_name) for p in toc_paths]
    for kind in ("game", "family", "default"):
        for flavor in sorted(flavors, key=lambda f: f.path.name.lower()):
            if flavor.kind == kind and game in flavor.games:
                return flavor.path
    return None


def expand_toc_path(path_text: str) -> List[str]:
    """Expand TOC variables such as ``[Game]`` into every possible file path.

    A path without variables is returned unchanged as a one-item list.
    """
    names = _VARIABLE_RE.findall(path_text)
    if not names:
        return [path_text]
    results = [path_text]
    for name in dict.fromkeys(names):
        token = f"[{name}]"
        results = [
            candidate.replace(token, value)
            for candidate in results
            for value in TOC_VARIABLES[name]
        ]
    return list(dict.fromkeys(results))


def has_toc_variable(text: str) -> bool:
    return bool(_VARIABLE_RE.search(text))


def lint_toc_lines(lines: Sequence[str]) -> List[str]:
    """Return warnings for TOC line patterns that the client mishandles."""
    warnings: List[str] = []

    first = next((line for line in lines if line.strip()), "")
    has_interface = any(
        re.match(r"^\s*##\s*Interface\s*:", line, re.IGNORECASE) for line in lines
    )
    if (
        has_interface
        and first.lstrip().startswith("#")
        and not first.lstrip().startswith("##")
    ):
        warnings.append(
            "First line is a '#' comment before '## Interface:'; clients have been "
            "reported to skip such TOCs entirely. Put '## Interface:' on the first line"
        )

    for number, line in enumerate(lines, 1):
        if line[:1] in (" ", "\t") and line.strip().startswith("#"):
            warnings.append(
                f"Line {number}: whitespace before '#' makes the client read it as a "
                "file name, not a comment or directive"
            )
            continue

        match = re.match(r"^##\s*([^:]+?)\s*:\s*(.*)$", line.strip())
        if not match:
            continue
        key, value = match.group(1), match.group(2)
        if has_toc_variable(key):
            value = key + value
        if key.lower() in ("allowloadgametype", "excludeloadgametype"):
            unknown = [
                v
                for v in (part.strip() for part in value.split(","))
                if v and v.lower() not in LOAD_GAME_TYPES
            ]
            if unknown:
                warnings.append(
                    f"Line {number}: unknown {key} value(s) {', '.join(unknown)}; "
                    "when no listed game type is recognised the condition is treated "
                    "as met and the addon loads anyway"
                )
        if has_toc_variable(value):
            warnings.append(
                f"Line {number}: '## {key}' uses a TOC variable; patch 12.1.7 "
                "disallows variables in directives, so use them only on file lines"
            )
    return warnings
