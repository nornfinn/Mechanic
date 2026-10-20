-- Generated APIDefinitions for namespace: C_VideoOptions
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_VideoOptions.AreHighResTexturesAvailable"] = {
    key = "C_VideoOptions.AreHighResTexturesAvailable",
    name = "AreHighResTexturesAvailable",
    category = "general",
    subcategory = "c_videooptions",
    funcPath = "C_VideoOptions.AreHighResTexturesAvailable",
    params = {  },
    returns = { { name = "areAvailable", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "forever" },
}

APIDefs["C_VideoOptions.GetCurrentGameWindowSize"] = {
    key = "C_VideoOptions.GetCurrentGameWindowSize",
    name = "GetCurrentGameWindowSize",
    category = "general",
    subcategory = "c_videooptions",
    funcPath = "C_VideoOptions.GetCurrentGameWindowSize",
    params = {  },
    returns = { { name = "size", type = "vector2", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
}

APIDefs["C_VideoOptions.GetDefaultGameWindowSize"] = {
    key = "C_VideoOptions.GetDefaultGameWindowSize",
    name = "GetDefaultGameWindowSize",
    category = "general",
    subcategory = "c_videooptions",
    funcPath = "C_VideoOptions.GetDefaultGameWindowSize",
    params = { { name = "monitor", type = "number", default = nil } },
    returns = { { name = "size", type = "vector2", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_VideoOptions.GetGameWindowSizes"] = {
    key = "C_VideoOptions.GetGameWindowSizes",
    name = "GetGameWindowSizes",
    category = "general",
    subcategory = "c_videooptions",
    funcPath = "C_VideoOptions.GetGameWindowSizes",
    params = { { name = "monitor", type = "number", default = nil }, { name = "fullscreen", type = "bool", default = nil } },
    returns = { { name = "sizes", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_VideoOptions.GetGxAdapterInfo"] = {
    key = "C_VideoOptions.GetGxAdapterInfo",
    name = "GetGxAdapterInfo",
    category = "general",
    subcategory = "c_videooptions",
    funcPath = "C_VideoOptions.GetGxAdapterInfo",
    params = {  },
    returns = { { name = "adapters", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
}

APIDefs["C_VideoOptions.IsLinearEnabledOnStart"] = {
    key = "C_VideoOptions.IsLinearEnabledOnStart",
    name = "IsLinearEnabledOnStart",
    category = "general",
    subcategory = "c_videooptions",
    funcPath = "C_VideoOptions.IsLinearEnabledOnStart",
    params = {  },
    returns = { { name = "isEnabled", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "forever" },
}

APIDefs["C_VideoOptions.IsOutlineModeSupported"] = {
    key = "C_VideoOptions.IsOutlineModeSupported",
    name = "IsOutlineModeSupported",
    category = "general",
    subcategory = "c_videooptions",
    funcPath = "C_VideoOptions.IsOutlineModeSupported",
    params = {  },
    returns = { { name = "isSupported", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "forever" },
}

APIDefs["C_VideoOptions.IsPBRWaterSupported"] = {
    key = "C_VideoOptions.IsPBRWaterSupported",
    name = "IsPBRWaterSupported",
    category = "general",
    subcategory = "c_videooptions",
    funcPath = "C_VideoOptions.IsPBRWaterSupported",
    params = {  },
    returns = { { name = "isSupported", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "forever" },
}

APIDefs["C_VideoOptions.IsSecondaryLightingSupported"] = {
    key = "C_VideoOptions.IsSecondaryLightingSupported",
    name = "IsSecondaryLightingSupported",
    category = "general",
    subcategory = "c_videooptions",
    funcPath = "C_VideoOptions.IsSecondaryLightingSupported",
    params = {  },
    returns = { { name = "isSupported", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "forever" },
}

APIDefs["C_VideoOptions.IsSpellVisualDensitySystemSupported"] = {
    key = "C_VideoOptions.IsSpellVisualDensitySystemSupported",
    name = "IsSpellVisualDensitySystemSupported",
    category = "general",
    subcategory = "c_videooptions",
    funcPath = "C_VideoOptions.IsSpellVisualDensitySystemSupported",
    params = {  },
    returns = { { name = "isSupported", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
}

APIDefs["C_VideoOptions.SetGameWindowSize"] = {
    key = "C_VideoOptions.SetGameWindowSize",
    name = "SetGameWindowSize",
    category = "general",
    subcategory = "c_videooptions",
    funcPath = "C_VideoOptions.SetGameWindowSize",
    params = { { name = "x", type = "number", default = nil }, { name = "y", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
