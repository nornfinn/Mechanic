"""Game-tagged API data: merging retail and WoW: Forever sources, filters, stubs."""

import asyncio
from pathlib import Path

import pytest

from mechanic.commands import api, apidefs, sandbox
from mechanic.commands.core import get_server
from mechanic.pipeline_paths import find_lua_exe

LUA = find_lua_exe()
needs_lua = pytest.mark.skipif(LUA is None, reason="no Lua 5.1 (set MECHANIC_LUA)")


def _doc(namespace: str, names) -> str:
    functions = "".join(
        f'        {{ Name = "{name}", Type = "Function", '
        'Returns = { { Name = "x", Type = "number", Nilable = false } } },\n'
        for name in names
    )
    return (
        "local Doc = {\n"
        '    Name = "Doc",\n'
        '    Type = "System",\n'
        f'    Namespace = "{namespace}",\n'
        f"    Functions = {{\n{functions}    }},\n"
        "}\n"
        "APIDocumentation:AddDocumentationTable(Doc)\n"
    )


def _source(root: Path, name: str, version, names) -> Path:
    source = root / name
    doc_dir = source / "Interface" / "AddOns" / "Blizzard_APIDocumentationGenerated"
    doc_dir.mkdir(parents=True)
    (doc_dir / "TestDocumentation.lua").write_text(_doc("C_Test", names), "utf-8")
    if version:
        (source / "version.txt").write_text(version + "\n", encoding="utf-8")
    return source


def _populate(source, db, **kwargs):
    return asyncio.run(
        apidefs._api_populate(
            apidefs.APIPopulateInput(
                source_path=str(source), output_path=str(db), **kwargs
            )
        )
    )


@pytest.mark.parametrize(
    "version,game",
    [
        ("12.1.5.70448", "standard"),
        ("1.60.1.70450", "forever"),
        ("1.15.8.66000", "vanilla"),
        ("5.5.2.65000", "mists"),
        ("unknown", None),
    ],
)
def test_detect_game(version, game):
    assert apidefs.detect_game(version) == game


@pytest.fixture
def merged(tmp_path):
    live = _source(tmp_path, "live", "12.1.5.70448", ["Shared", "RetailOnly"])
    forever = _source(tmp_path, "forever", "1.60.1.70450", ["Shared", "ForeverOnly"])
    db = tmp_path / "api_database.json"
    result = _populate(live, db, compare_sources=[str(forever)])
    assert result.success, result.error
    out = tmp_path / "APIDefs"
    generated = asyncio.run(
        apidefs._api_generate(
            apidefs.APIGenerateInput(database_path=str(db), output_path=str(out))
        )
    )
    assert generated.success, generated.error
    return result.data, out


def test_populate_tags_each_api_with_the_games_that_document_it(merged):
    data, out = merged

    assert data.games == {"standard": "12.1.5.70448", "forever": "1.60.1.70450"}
    assert data.game_counts == {"standard": 2, "forever": 2}
    assert data.api_count == 3
    apis = api.parse_lua_table_simple((out / "C_Test.lua").read_text("utf-8"))
    assert apis["C_Test.Shared"]["games"] == ["standard", "forever"]
    assert apis["C_Test.RetailOnly"]["games"] == ["standard"]
    assert apis["C_Test.ForeverOnly"]["games"] == ["forever"]


def test_populate_requires_known_games_when_comparing(tmp_path):
    live = _source(tmp_path, "live", "12.1.5.70448", ["A"])
    mystery = _source(tmp_path, "mystery", None, ["B"])
    db = tmp_path / "db.json"

    unknown = _populate(live, db, compare_sources=[str(mystery)])
    assert not unknown.success and unknown.error.code == "GAME_UNKNOWN"

    named = _populate(live, db, compare_sources=[f"forever={mystery}"])
    assert named.success, named.error
    assert named.data.games == {"standard": "12.1.5.70448", "forever": "unknown"}

    twice = _populate(live, db, compare_sources=[f"standard={mystery}"])
    assert not twice.success and twice.error.code == "GAME_DUPLICATE"


def test_single_untagged_source_still_works(tmp_path):
    source = _source(tmp_path, "extract", None, ["A"])
    result = _populate(source, tmp_path / "db.json")

    assert result.success, result.error
    assert result.data.games == {} and result.data.game_counts == {}


@pytest.mark.asyncio
async def test_search_and_list_filter_by_game(merged, monkeypatch):
    _, out = merged
    monkeypatch.setattr(api, "get_apidefs_path", lambda: out)
    server = get_server()

    found = await server.execute("api.search", {"query": "C_Test.*", "game": "forever"})
    assert found.success, found.error
    assert [a["key"] for a in found.data.apis] == [
        "C_Test.ForeverOnly",
        "C_Test.Shared",
    ]
    assert found.data.apis[1]["games"] == ["standard", "forever"]

    listed = await server.execute(
        "api.list", {"namespace": "C_Test", "game": "standard"}
    )
    assert [a["key"] for a in listed.data.apis] == [
        "C_Test.RetailOnly",
        "C_Test.Shared",
    ]


@needs_lua
@pytest.mark.asyncio
async def test_sandbox_game_filter_removes_missing_stubs(merged, tmp_path, monkeypatch):
    _, out = merged
    monkeypatch.setattr(sandbox, "get_apidefs_dir", lambda: out)
    monkeypatch.setattr(sandbox, "find_sandbox_folder", lambda: tmp_path / "sandbox")
    server = get_server()
    assert (await server.execute("sandbox.generate", {"force": True})).success

    code = (
        "return tostring(C_Test.Shared ~= nil) .. ',' .. "
        "tostring(C_Test.RetailOnly ~= nil) .. ',' .. "
        "tostring(C_Test.ForeverOnly ~= nil) .. ',' .. "
        "tostring(__MechanicStubGames == nil)"
    )
    forever = await server.execute("sandbox.exec", {"code": code, "game": "forever"})
    assert forever.success, forever.error
    assert forever.data.result == "true,false,true,true"

    everything = await server.execute("sandbox.exec", {"code": code})
    assert everything.data.result == "true,true,true,true"


# ── deprecations ──────────────────────────────────────────────────────────────


def _deprecated_source(root: Path, name: str, version: str, aliases) -> Path:
    source = root / name
    folder = source / "Interface" / "AddOns" / "Blizzard_Deprecated"
    folder.mkdir(parents=True)
    body = "".join(f"{old} = {new}\n" for old, new in aliases)
    (folder / "Deprecated_Test.lua").write_text(body, encoding="utf-8")
    (source / "version.txt").write_text(version + "\n", encoding="utf-8")
    return source


def test_deprecation_builder_tags_games(tmp_path):
    from mechanic import deprecations_builder as builder

    live = _deprecated_source(
        tmp_path,
        "live",
        "12.1.5.70448",
        [
            ("GetSharedThing", "C_Thing.GetShared"),
            ("GetRetailThing", "C_Thing.GetRetail"),
        ],
    )
    forever = _deprecated_source(
        tmp_path,
        "forever",
        "1.60.1.70450",
        [
            ("GetSharedThing", "C_Thing.GetShared"),
            ("GetForeverThing", "C_Thing.GetForever"),
        ],
    )
    out = tmp_path / "deprecated.json"

    assert builder.main([str(live), str(out), "--compare", str(forever)]) == 0
    import json

    data = json.loads(out.read_text("utf-8"))
    by_old = {e["old"]: e for e in data["apis"]}
    assert data["games"] == {"standard": "12.1.5.70448", "forever": "1.60.1.70450"}
    assert by_old["GetSharedThing"]["games"] == ["standard", "forever"]
    assert by_old["GetRetailThing"]["games"] == ["standard"]
    assert by_old["GetForeverThing"]["games"] == ["forever"]
    assert all("games" not in e for e in data["apis"] if e.get("origin") == "curated")


def test_deprecation_scan_filters_by_game(tmp_path):
    from mechanic.commands import development

    addon = tmp_path / "Demo"
    addon.mkdir()
    (addon / "Core.lua").write_text(
        "GetRetailThing()\nGetForeverThing()\nGetEverywhere()\n", encoding="utf-8"
    )
    apis = {
        "GetRetailThing": {"new": "C_A.R", "games": ["standard"]},
        "GetForeverThing": {"new": "C_A.F", "games": ["forever"]},
        "GetEverywhere": {"new": "C_A.E", "games": []},
    }

    issues, _ = development.scan_addon_deprecations(
        addon, apis, None, "info", "forever"
    )
    assert sorted(i["old_api"] for i in issues) == ["GetEverywhere", "GetForeverThing"]
    everything, _ = development.scan_addon_deprecations(addon, apis, None, "info")
    assert len(everything) == 3


def test_rebuild_keeps_removed_shims_as_errors(tmp_path):
    import json

    from mechanic import deprecations_builder as builder

    out = tmp_path / "deprecated.json"
    first = _deprecated_source(
        tmp_path, "old", "12.0.1.64914", [("GetGoneThing", "C_Thing.GetGone")]
    )
    assert builder.main([str(first), str(out)]) == 0
    second = _deprecated_source(
        tmp_path, "new", "12.1.5.70448", [("GetKeptThing", "C_Thing.GetKept")]
    )

    assert builder.main([str(second), str(out)]) == 0
    by_old = {e["old"]: e for e in json.loads(out.read_text("utf-8"))["apis"]}
    gone = by_old["GetGoneThing"]
    assert gone["origin"] == "removed" and gone["severity"] == "error"
    assert gone["removed_in"] == "12.1.5.70448" and "12.1.5.70448" in gone["notes"]
    assert by_old["GetKeptThing"]["origin"] != "removed"

    assert builder.main([str(second), str(out), "--drop-removed"]) == 0
    assert "GetGoneThing" not in {
        e["old"] for e in json.loads(out.read_text("utf-8"))["apis"]
    }
