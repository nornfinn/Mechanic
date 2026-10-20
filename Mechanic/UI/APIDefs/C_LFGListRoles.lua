-- Generated APIDefinitions for namespace: C_LFGListRoles
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_LFGListRoles.GetRoles"] = {
    key = "C_LFGListRoles.GetRoles",
    name = "GetRoles",
    category = "general",
    subcategory = "c_lfglistroles",
    funcPath = "C_LFGListRoles.GetRoles",
    params = {  },
    returns = { { name = "roles", type = "LFGRoles", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "forever" },
}

APIDefs["C_LFGListRoles.GetSavedRoles"] = {
    key = "C_LFGListRoles.GetSavedRoles",
    name = "GetSavedRoles",
    category = "general",
    subcategory = "c_lfglistroles",
    funcPath = "C_LFGListRoles.GetSavedRoles",
    params = {  },
    returns = { { name = "roles", type = "LFGRoles", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "forever" },
}

APIDefs["C_LFGListRoles.SetRoles"] = {
    key = "C_LFGListRoles.SetRoles",
    name = "SetRoles",
    category = "general",
    subcategory = "c_lfglistroles",
    funcPath = "C_LFGListRoles.SetRoles",
    params = { { name = "roles", type = "LFGRoles", default = nil }, { name = "limitToClassRoles", type = "bool", default = false } },
    returns = { { name = "success", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
