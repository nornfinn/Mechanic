-- Generated APIDefinitions for namespace: C_BlizzCon2026
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_BlizzCon2026.GetExperience"] = {
    key = "C_BlizzCon2026.GetExperience",
    name = "GetExperience",
    category = "general",
    subcategory = "c_blizzcon2026",
    funcPath = "C_BlizzCon2026.GetExperience",
    params = {  },
    returns = { { name = "experience", type = "Bc26Experience", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "forever" },
}

APIDefs["C_BlizzCon2026.IsActive"] = {
    key = "C_BlizzCon2026.IsActive",
    name = "IsActive",
    category = "general",
    subcategory = "c_blizzcon2026",
    funcPath = "C_BlizzCon2026.IsActive",
    params = {  },
    returns = { { name = "isActive", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "forever" },
}

APIDefs["C_BlizzCon2026.IsColdSwapFeatureEnabled"] = {
    key = "C_BlizzCon2026.IsColdSwapFeatureEnabled",
    name = "IsColdSwapFeatureEnabled",
    category = "general",
    subcategory = "c_blizzcon2026",
    funcPath = "C_BlizzCon2026.IsColdSwapFeatureEnabled",
    params = {  },
    returns = { { name = "isEnabled", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "forever" },
}

APIDefs["C_BlizzCon2026.SetExperience"] = {
    key = "C_BlizzCon2026.SetExperience",
    name = "SetExperience",
    category = "general",
    subcategory = "c_blizzcon2026",
    funcPath = "C_BlizzCon2026.SetExperience",
    params = { { name = "experience", type = "Bc26Experience", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    games = { "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
