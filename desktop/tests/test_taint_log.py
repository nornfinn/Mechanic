"""taint.log parsing, filtering and addon.output blocked actions."""

from pathlib import Path

import pytest

from mechanic.commands import output, taint
from mechanic.commands.core import get_server
from mechanic.targets import SelectedTarget

LOG = r"""
4/23 23:37:50.364 An action was blocked in combat because of taint from fSuite - ActionButton9:Show()
4/23 23:37:50.364 Interface\FrameXML\ActionButton.lua:301
4/23 23:37:50.364 ActionButton_Update()
4/23 23:37:50.364 Interface\AddOns\fSuite\Skins\Bars.lua:88 SkinButton()
8/24 15:43:55.084 Global variable stringHeight tainted by !Aurora_RealUI
8/24 15:43:55.084 Interface\AddOns\Blizzard_ObjectiveTracker\Blizzard_QuestObjectiveTracker.lua:71 SetBlockHeader()
8/24 15:44:01.000 Execution tainted by fSuite while reading ChatFrame1Tab - Interface\AddOns\fSuite\Chat.lua:12 Restyle()
8/24 15:44:02.000 An action was forbidden because of taint from fSuite - CastSpellByName()
not a log line
"""


def test_parse_entries_and_frames():
    entries = taint.parse_taint_log(LOG)

    assert [e["kind"] for e in entries] == ["blocked", "global", "execution", "blocked"]
    blocked = entries[0]
    assert blocked["addon"] == "fSuite" and blocked["detail"] == "ActionButton9:Show()"
    assert blocked["in_combat"] and not blocked["forbidden"]
    assert blocked["frames"][0] == {
        "text": r"Interface\FrameXML\ActionButton.lua:301",
        "file": r"Interface\FrameXML\ActionButton.lua",
        "line": 301,
    }
    assert blocked["addon_frame"]["function"] == "SkinButton()"
    assert entries[1]["detail"] == "stringHeight" and "addon_frame" not in entries[1]
    execution = entries[2]
    assert execution["detail"] == "reading ChatFrame1Tab"
    assert execution["addon_frame"]["line"] == 12
    assert entries[3]["forbidden"] and not entries[3]["in_combat"]


@pytest.mark.asyncio
async def test_command_filters_and_groups(tmp_path):
    log = tmp_path / "diagnostic.taint"
    log.write_text(LOG, encoding="utf-8")
    server = get_server()

    everything = await server.execute("diagnostic.taint", {"log_path": str(log)})
    assert everything.success, everything.error
    assert everything.data.total == 4
    assert everything.data.by_addon == {"fSuite": 3, "!Aurora_RealUI": 1}
    assert everything.data.entries[0]["detail"] == "CastSpellByName()"  # newest first

    mine = await server.execute(
        "diagnostic.taint", {"log_path": str(log), "addon": "fsuite", "kind": "blocked"}
    )
    assert mine.data.total == 2


@pytest.mark.asyncio
async def test_missing_log_explains_how_to_enable(tmp_path):
    result = await get_server().execute(
        "diagnostic.taint", {"log_path": str(tmp_path / "nope.log")}
    )

    assert not result.success
    assert result.error.code == "TAINT_LOG_NOT_FOUND"
    assert "taintLog 1" in result.error.suggestion


@pytest.mark.asyncio
async def test_target_resolves_client_logs_folder(tmp_path, monkeypatch):
    client = tmp_path / "_classic_beta_"
    (client / "Logs").mkdir(parents=True)
    (client / "Logs" / "diagnostic.taint").write_text(LOG, encoding="utf-8")
    candidates = [
        SelectedTarget(
            client=str(client),
            account="A",
            character=name,
            profile="Default",
            sv_path=str(client / "WTF" / "sv.lua"),
            addon_path=str(client / "Interface" / "AddOns" / "!Mechanic"),
        )
        for name in ("One - Realm", "Two - Realm")
    ]
    monkeypatch.setattr(taint, "discover_targets", lambda: candidates)

    result = await get_server().execute("diagnostic.taint", {})
    assert result.success, result.error
    assert Path(result.data.log_file) == client / "Logs" / "diagnostic.taint"


def test_tail_read_is_bounded(tmp_path, monkeypatch):
    monkeypatch.setattr(taint, "MAX_LOG_BYTES", 200)
    log = tmp_path / "diagnostic.taint"
    log.write_text("filler line\n" * 100 + LOG, encoding="utf-8")

    text, truncated = taint._read_tail(log)
    assert truncated and len(text.encode()) <= 200


def test_addon_output_reports_latest_session_blocked_actions():
    profile = {
        "blockedActions": [
            {
                "event": "ADDON_ACTION_BLOCKED",
                "addon": "Old",
                "function": "X()",
                "session": 1,
            },
            {
                "event": "ADDON_ACTION_BLOCKED",
                "addon": "fSuite",
                "function": "ActionButton9:Show()",
                "count": 3,
                "inCombat": True,
                "session": 2,
            },
            {
                "event": "ADDON_ACTION_FORBIDDEN",
                "addon": "fSuite",
                "function": "Cast()",
                "session": 2,
            },
        ]
    }
    blocked = output.parse_blocked_actions_from_mechanic_db(profile)

    assert [b["addon"] for b in blocked] == ["fSuite", "fSuite"]
    assert blocked[0]["count"] == 3 and blocked[0]["in_combat"]
    section = "\n".join(output._blocked_actions_section(blocked))
    assert "Blocked Actions (4)" in section
    assert "**fSuite** blocked in combat: `ActionButton9:Show()` x3" in section
    assert "**fSuite** forbidden: `Cast()`" in section
