-- Generated APIDefinitions for namespace: C_Flyout
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_Flyout.FlyoutHasSpell"] = {
    key = "C_Flyout.FlyoutHasSpell",
    name = "FlyoutHasSpell",
    category = "general",
    subcategory = "c_flyout",
    funcPath = "C_Flyout.FlyoutHasSpell",
    params = { { name = "flyoutID", type = "number", default = nil }, { name = "spellID", type = "number", default = nil } },
    returns = { { name = "hasSpell", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_Flyout.GetFlyoutID"] = {
    key = "C_Flyout.GetFlyoutID",
    name = "GetFlyoutID",
    category = "general",
    subcategory = "c_flyout",
    funcPath = "C_Flyout.GetFlyoutID",
    params = { { name = "index", type = "luaIndex", default = nil } },
    returns = { { name = "flyoutID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_Flyout.GetFlyoutInfo"] = {
    key = "C_Flyout.GetFlyoutInfo",
    name = "GetFlyoutInfo",
    category = "general",
    subcategory = "c_flyout",
    funcPath = "C_Flyout.GetFlyoutInfo",
    params = { { name = "flyoutID", type = "number", default = nil } },
    returns = { { name = "info", type = "FlyoutInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_Flyout.GetFlyoutSlotInfo"] = {
    key = "C_Flyout.GetFlyoutSlotInfo",
    name = "GetFlyoutSlotInfo",
    category = "general",
    subcategory = "c_flyout",
    funcPath = "C_Flyout.GetFlyoutSlotInfo",
    params = { { name = "flyoutID", type = "number", default = nil }, { name = "slotIndex", type = "luaIndex", default = nil } },
    returns = { { name = "slotInfo", type = "FlyoutSlotInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_Flyout.GetFlyoutTexture"] = {
    key = "C_Flyout.GetFlyoutTexture",
    name = "GetFlyoutTexture",
    category = "general",
    subcategory = "c_flyout",
    funcPath = "C_Flyout.GetFlyoutTexture",
    params = { { name = "flyoutID", type = "number", default = nil } },
    returns = { { name = "textureID", type = "fileID", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_Flyout.GetNumFlyouts"] = {
    key = "C_Flyout.GetNumFlyouts",
    name = "GetNumFlyouts",
    category = "general",
    subcategory = "c_flyout",
    funcPath = "C_Flyout.GetNumFlyouts",
    params = {  },
    returns = { { name = "numFlyouts", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "forever" },
}
