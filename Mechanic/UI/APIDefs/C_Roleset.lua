-- Generated APIDefinitions for namespace: C_Roleset
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_Roleset.ApplyRolesetFilters"] = {
    key = "C_Roleset.ApplyRolesetFilters",
    name = "ApplyRolesetFilters",
    category = "general",
    subcategory = "c_roleset",
    funcPath = "C_Roleset.ApplyRolesetFilters",
    params = { { name = "blockedRolesets", type = "table", default = nil }, { name = "allowedRolesets", type = "table", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Roleset.GetActiveAllowedRolesets"] = {
    key = "C_Roleset.GetActiveAllowedRolesets",
    name = "GetActiveAllowedRolesets",
    category = "general",
    subcategory = "c_roleset",
    funcPath = "C_Roleset.GetActiveAllowedRolesets",
    params = {  },
    returns = { { name = "allowedRolesets", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
}

APIDefs["C_Roleset.GetActiveBlockedRolesets"] = {
    key = "C_Roleset.GetActiveBlockedRolesets",
    name = "GetActiveBlockedRolesets",
    category = "general",
    subcategory = "c_roleset",
    funcPath = "C_Roleset.GetActiveBlockedRolesets",
    params = {  },
    returns = { { name = "blockedRolesets", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
}
