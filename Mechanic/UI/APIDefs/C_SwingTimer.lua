-- Generated APIDefinitions for namespace: C_SwingTimer
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_SwingTimer.EnableRangeCheck"] = {
    key = "C_SwingTimer.EnableRangeCheck",
    name = "EnableRangeCheck",
    category = "general",
    subcategory = "c_swingtimer",
    funcPath = "C_SwingTimer.EnableRangeCheck",
    params = { { name = "swingType", type = "PlayerSwingType", default = nil }, { name = "enable", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    games = { "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_SwingTimer.IsTargetWithinSwingRange"] = {
    key = "C_SwingTimer.IsTargetWithinSwingRange",
    name = "IsTargetWithinSwingRange",
    category = "general",
    subcategory = "c_swingtimer",
    funcPath = "C_SwingTimer.IsTargetWithinSwingRange",
    params = { { name = "swingType", type = "PlayerSwingType", default = nil } },
    returns = { { name = "isInRange", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
