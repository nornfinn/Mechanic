-- Generated APIDefinitions for namespace: C_GamepadTargeting
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_GamepadTargeting.Disable"] = {
    key = "C_GamepadTargeting.Disable",
    name = "Disable",
    category = "general",
    subcategory = "c_gamepadtargeting",
    funcPath = "C_GamepadTargeting.Disable",
    params = {  },
    returns = { { name = "targetAlreadySelected", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "forever" },
}

APIDefs["C_GamepadTargeting.Enable"] = {
    key = "C_GamepadTargeting.Enable",
    name = "Enable",
    category = "general",
    subcategory = "c_gamepadtargeting",
    funcPath = "C_GamepadTargeting.Enable",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
    games = { "forever" },
}

APIDefs["C_GamepadTargeting.SetFilter"] = {
    key = "C_GamepadTargeting.SetFilter",
    name = "SetFilter",
    category = "general",
    subcategory = "c_gamepadtargeting",
    funcPath = "C_GamepadTargeting.SetFilter",
    params = { { name = "filter", type = "GamepadTargetingFilters", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    games = { "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
