"""Secret-value emulation in the restricted sandbox."""

import pytest
import pytest_asyncio

from mechanic.commands import sandbox
from mechanic.commands.core import get_server
from mechanic.pipeline_paths import find_lua_exe

pytestmark = [
    pytest.mark.asyncio,
    pytest.mark.skipif(find_lua_exe() is None, reason="no Lua 5.1 (set MECHANIC_LUA)"),
]

APIDEFS = """local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["UnitHealth"] = {
    key = "UnitHealth", name = "UnitHealth", category = "unit", subcategory = "global",
    funcPath = "UnitHealth", params = {  },
    returns = { { name = "health", type = "number", canBeSecret = true } },
    midnightImpact = "HIGH",
}
APIDefs["UnitName"] = {
    key = "UnitName", name = "UnitName", category = "unit", subcategory = "global",
    funcPath = "UnitName", params = {  },
    returns = { { name = "name", type = "string", canBeSecret = false } },
    midnightImpact = "CONDITIONAL",
}
APIDefs["UnitLevel"] = {
    key = "UnitLevel", name = "UnitLevel", category = "unit", subcategory = "global",
    funcPath = "UnitLevel", params = {  },
    returns = { { name = "level", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
}
"""


@pytest_asyncio.fixture
async def stubs(tmp_path, monkeypatch):
    apidefs = tmp_path / "APIDefs"
    apidefs.mkdir()
    (apidefs / "Global.lua").write_text(APIDEFS, encoding="utf-8")
    monkeypatch.setattr(sandbox, "get_apidefs_dir", lambda: apidefs)
    monkeypatch.setattr(sandbox, "find_sandbox_folder", lambda: tmp_path / "sandbox")
    result = await get_server().execute("sandbox.generate", {"force": True})
    assert result.success, result.error


async def run(code, **payload):
    result = await get_server().execute("sandbox.exec", {"code": code, **payload})
    assert result.success, result.error
    return result.data


@pytest.mark.parametrize(
    "expression,fragment",
    [
        ("s + 1", "perform arithmetic on a secret number"),
        ("1 + s", "perform arithmetic on a secret number"),
        ("-s", "perform arithmetic on a secret number"),
        ("s < s", "compare a secret number"),
        ("#s", "get the length of a secret number"),
        ("s.x", "index a secret number"),
        ("s()", "call a secret number"),
    ],
)
async def test_forbidden_operations_error(stubs, expression, fragment):
    data = await run(f"local s = Sandbox.Secret(5); return {expression}")

    assert data.exit_code != 0
    assert fragment in data.error


async def test_allowed_operations_produce_secrets(stubs):
    data = await run(
        "local s = Sandbox.Secret(42)\n"
        "local joined = 'HP: ' .. s\n"
        "local formatted = string.format('%d hp', s)\n"
        "local text = tostring(s)\n"
        "return table.concat({\n"
        "  type(s), type(joined), tostring(issecretvalue(joined)),\n"
        "  tostring(issecretvalue(formatted)), Sandbox.Reveal(formatted),\n"
        "  tostring(issecretvalue(text)), tostring(canaccessvalue(s)),\n"
        "  tostring(canaccessvalue(1)), tostring(s ~= nil),\n"
        "}, ',')"
    )

    assert data.error is None, data.error
    assert data.result == "number,string,true,true,42 hp,true,false,true,true"


async def test_mock_follows_documented_secret_policy(stubs):
    data = await run(
        "Sandbox.Mock('UnitHealth', 900)\n"
        "Sandbox.Mock('UnitName', function() return 'Thrall' end)\n"
        "Sandbox.Mock('UnitLevel', 60)\n"
        "local out = {}\n"
        "local function snap()\n"
        "  out[#out + 1] = tostring(issecretvalue(UnitHealth('target')))\n"
        "  out[#out + 1] = tostring(issecretvalue(UnitName('target')))\n"
        "  out[#out + 1] = tostring(issecretvalue(UnitLevel('target')))\n"
        "  out[#out + 1] = tostring(InCombatLockdown())\n"
        "end\n"
        "snap(); Sandbox.SetRestricted(true); snap()\n"
        "return table.concat(out, ',')"
    )

    assert data.error is None, data.error
    assert data.result == "true,false,false,false,true,true,false,true"


async def test_secret_guarded_code_passes(stubs):
    data = await run(
        "Sandbox.Mock('UnitHealth', 900)\n"
        "local h = UnitHealth('target')\n"
        "if issecretvalue(h) then return 'skipped' end\n"
        "return h * 2"
    )

    assert data.result == "skipped"


async def test_secrets_can_be_disabled(stubs):
    data = await run("return tostring(issecretvalue)", secrets=False)

    assert data.result == "nil"


async def test_stub_tables_are_not_left_in_the_environment(stubs):
    data = await run("return tostring(__MechanicStubSecrets == nil)")

    assert data.result == "true"
