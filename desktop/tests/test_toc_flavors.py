"""Client-flavor TOC rules: suffix resolution, variables and Forever coverage."""

from pathlib import Path

import pytest

from mechanic import toc_flavors
from mechanic.commands.deadcode import get_loaded_files
from mechanic.commands.development import validate_toc

HEADER = "## Title: Demo\n## Version: 1.0.0\n## Notes: n\n## Author: a\n"


def make_addon(tmp_path: Path, tocs: dict, files=("Core.lua",)) -> Path:
    root = tmp_path / "Demo"
    root.mkdir()
    for name, body in tocs.items():
        (root / name).write_text(body, encoding="utf-8")
    for name in files:
        target = root / name
        target.parent.mkdir(parents=True, exist_ok=True)
        target.write_text("local _ = 1\n", encoding="utf-8")
    return root


def toc(interface: str, *lines: str) -> str:
    return f"## Interface: {interface}\n{HEADER}" + "".join(
        f"{line}\n" for line in lines
    )


# ── suffix resolution ─────────────────────────────────────────────────────────


@pytest.mark.parametrize(
    "names,game,expected",
    [
        (
            ["Demo.toc", "Demo_Mainline.toc", "Demo_Forever.toc"],
            "forever",
            "Demo_Forever.toc",
        ),
        (["Demo.toc", "Demo_Camelot.toc"], "forever", "Demo_Camelot.toc"),
        (["Demo.toc", "Demo_Mainline.toc"], "forever", "Demo_Mainline.toc"),
        (["Demo.toc", "Demo_Vanilla.toc"], "forever", "Demo.toc"),
        (["Demo_Vanilla.toc", "Demo_Mists.toc"], "forever", None),
        (["Demo_Standard.toc", "Demo_Mainline.toc"], "standard", "Demo_Standard.toc"),
        (["Demo_Standard.toc", "Demo_Mainline.toc"], "forever", "Demo_Mainline.toc"),
        (["Demo_Classic.toc", "Demo_Mists.toc"], "tbc", "Demo_Classic.toc"),
    ],
)
def test_toc_for_game_follows_client_priority(names, game, expected):
    paths = [Path(n) for n in names]
    found = toc_flavors.toc_for_game(paths, "Demo", game)
    assert (found.name if found else None) == expected


def test_classify_ignores_unrelated_and_unknown_suffixes():
    assert toc_flavors.classify_toc(Path("Other.toc"), "Demo").kind == "unrelated"
    assert toc_flavors.classify_toc(Path("Demo_Beta.toc"), "Demo").kind == "unrelated"
    flavor = toc_flavors.classify_toc(Path("demo_forever.toc"), "Demo")
    assert flavor.kind == "game" and flavor.games == ("forever",)


def test_expand_toc_path_variables():
    assert toc_flavors.expand_toc_path("Core.lua") == ["Core.lua"]
    game = toc_flavors.expand_toc_path("Core_[Game].lua")
    assert "Core_Forever.lua" in game and "Core_Camelot.lua" in game
    both = toc_flavors.expand_toc_path("[Family]\\[TextLocale].lua")
    assert "Mainline\\enUS.lua" in both and "Classic\\zhTW.lua" in both
    assert len(both) == 2 * len(toc_flavors.TEXT_LOCALES)


# ── line linting ──────────────────────────────────────────────────────────────


def test_comment_before_interface_is_flagged():
    warnings = toc_flavors.lint_toc_lines(["# My addon", "## Interface: 16001"])
    assert any("before '## Interface:'" in w for w in warnings)
    assert toc_flavors.lint_toc_lines(["## Interface: 16001", "# note"]) == []


def test_indented_comment_and_bad_game_types_are_flagged():
    warnings = toc_flavors.lint_toc_lines(
        [
            "## Interface: 16001",
            "## AllowLoadGameType: forever, retail",
            "   # indented",
            "## Notes-[TextLocale]: x",
        ]
    )
    assert any("unknown AllowLoadGameType value(s) retail" in w for w in warnings)
    assert any("Line 3" in w and "file name" in w for w in warnings)
    assert any("Line 4" in w and "TOC variable" in w for w in warnings)


# ── addon.validate ────────────────────────────────────────────────────────────


def test_forever_toc_reported_and_current(tmp_path):
    addon = make_addon(
        tmp_path,
        {
            "Demo.toc": toc("120100", "Core.lua"),
            "Demo_Camelot.toc": toc("16001", "Core.lua"),
        },
    )
    result = validate_toc(addon, "Demo")

    assert result.valid, result.errors
    assert result.forever_toc == "Demo_Camelot.toc"
    assert not any("out of date" in w for w in result.warnings)
    assert {t.file for t in result.tocs} == {"Demo.toc", "Demo_Camelot.toc"}


def test_mainline_fallback_without_forever_interface_warns(tmp_path):
    addon = make_addon(tmp_path, {"Demo_Mainline.toc": toc("120100", "Core.lua")})
    result = validate_toc(addon, "Demo")

    assert result.valid, result.errors
    assert result.forever_toc == "Demo_Mainline.toc"
    assert any("lacks 16001" in w for w in result.warnings)


def test_forever_suffix_alone_notes_beta4_requirement(tmp_path):
    addon = make_addon(
        tmp_path,
        {
            "Demo.toc": toc("120100", "Core.lua"),
            "Demo_Forever.toc": toc("16001", "Core.lua"),
        },
    )
    result = validate_toc(addon, "Demo")

    assert any("beta 4" in i for i in result.info)


def test_secondary_toc_classic_interface_is_not_called_outdated(tmp_path):
    addon = make_addon(
        tmp_path,
        {
            "Demo.toc": toc("120100, 16001", "Core.lua"),
            "Demo_Mists.toc": toc("50504", "Core.lua"),
        },
    )
    result = validate_toc(addon, "Demo")

    assert result.valid, result.errors


def test_secondary_toc_missing_files_are_errors(tmp_path):
    addon = make_addon(
        tmp_path,
        {
            "Demo.toc": toc("120100", "Core.lua"),
            "Demo_Camelot.toc": toc("16001", "Gone.lua"),
        },
    )
    result = validate_toc(addon, "Demo")

    assert not result.valid
    assert "Demo_Camelot.toc: Missing files: Gone.lua" in result.errors


def test_game_variable_file_lines_are_not_missing(tmp_path):
    addon = make_addon(
        tmp_path,
        {"Demo.toc": toc("120100, 16001", "Core.lua", "Flavor_[Game].lua")},
        files=("Core.lua", "Flavor_Camelot.lua"),
    )
    result = validate_toc(addon, "Demo")

    assert result.valid, result.errors


def test_deadcode_counts_variable_expansions_as_loaded(tmp_path):
    addon = make_addon(
        tmp_path,
        {"Demo.toc": toc("16001", "Core.lua", "Flavor_[Game].lua")},
        files=("Core.lua", "Flavor_Camelot.lua"),
    )
    loaded = get_loaded_files(addon, "Demo")

    assert (addon / "Flavor_Camelot.lua").resolve() in loaded
