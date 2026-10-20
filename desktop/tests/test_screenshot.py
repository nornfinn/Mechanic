"""screenshot.queue writes a loadable queue; screenshot.results matches files."""

import os
import subprocess
from datetime import datetime

import pytest

from mechanic import targets
from mechanic.commands.core import get_server
from mechanic.pipeline_paths import find_lua_exe

pytestmark = pytest.mark.asyncio

SV = """MechanicDB = {
    ["profileKeys"] = { ["Hero - Realm"] = "Default" },
    ["profiles"] = {
        ["Default"] = {
            ["screenshotResults"] = {
                ["requestedAt"] = "2026-10-20 09:00:00",
                ["lastRun"] = "2026-10-20 09:00:10",
                ["results"] = {
                    { ["label"] = "character", ["status"] = "taken", ["takenAt"] = "2026-10-20 09:00:05" },
                    { ["label"] = "broken", ["status"] = "setup_failed", ["error"] = "boom" },
                },
            },
        },
    },
}
"""


@pytest.fixture
def client(tmp_path, monkeypatch):
    client = tmp_path / "_classic_beta_"
    addon = client / "Interface" / "AddOns" / "!Mechanic"
    addon.mkdir(parents=True)
    sv_dir = client / "WTF" / "Account" / "ACC" / "SavedVariables"
    sv_dir.mkdir(parents=True)
    (sv_dir / "!Mechanic.lua").write_text(SV, encoding="utf-8")
    selected = targets.SelectedTarget(
        client=str(client),
        account="ACC",
        character="Hero - Realm",
        profile="Default",
        sv_path=str(sv_dir / "!Mechanic.lua"),
        addon_path=str(addon),
    )
    monkeypatch.setattr(targets, "discover_targets", lambda: [selected])
    return client


@pytest.mark.skipif(find_lua_exe() is None, reason="no Lua 5.1 (set MECHANIC_LUA)")
async def test_queue_writes_a_lua_queue_with_target(client):
    result = await get_server().execute(
        "screenshot.queue",
        {
            "shots": [
                {
                    "label": "character",
                    "setup": 'ToggleCharacter("PaperDollFrame")',
                    "teardown": "HideUIPanel(CharacterFrame)",
                    "delay": 1.5,
                },
                {"label": "plain"},
            ]
        },
    )
    assert result.success, result.error
    queue_file = client / "Interface" / "AddOns" / "!Mechanic" / "MechanicQueue.lua"
    assert result.data.queue_file == str(queue_file)
    probe = (
        f"dofile({str(queue_file)!r})\n"
        "local q = MECHANIC_SCREENSHOT_QUEUE\n"
        "print(#q, q[1].label, q[1].setup, q[1].teardown, q[1].delay, q[2].setup, "
        "MECHANIC_DIAGNOSTIC_TARGET.character)\n"
    )
    out = subprocess.run(
        [str(find_lua_exe()), "-e", probe], capture_output=True, text=True, check=True
    ).stdout.strip()
    assert out == (
        '2\tcharacter\tToggleCharacter("PaperDollFrame")\t'
        "HideUIPanel(CharacterFrame)\t1.5\tnil\tHero - Realm"
    )


async def test_queue_rejects_bad_input(client):
    empty = await get_server().execute("screenshot.queue", {"shots": []})
    assert not empty.success
    slow = await get_server().execute(
        "screenshot.queue", {"shots": [{"label": "x", "delay": 99}]}
    )
    assert not slow.success


async def test_results_match_files_by_time(client):
    shots = client / "Screenshots"
    shots.mkdir()

    def make(name, when):
        path = shots / name
        path.write_bytes(b"img")
        stamp = datetime.strptime(when, "%Y-%m-%d %H:%M:%S").timestamp()
        os.utime(path, (stamp, stamp))
        return path

    make("WoWScrnShot_102026_085000.jpg", "2026-10-20 08:50:00")
    match = make("WoWScrnShot_102026_090006.jpg", "2026-10-20 09:00:06")
    make("notes.txt", "2026-10-20 09:00:06")

    result = await get_server().execute("screenshot.results", {"recent": 5})
    assert result.success, result.error
    data = result.data
    assert data.requested_at == "2026-10-20 09:00:00"
    assert data.results[0]["file"] == str(match)
    assert "file" not in data.results[1] and data.results[1]["error"] == "boom"
    assert [f["path"] for f in data.recent_files][0] == str(match)
    assert len(data.recent_files) == 2  # images only
