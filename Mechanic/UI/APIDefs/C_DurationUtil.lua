-- Generated APIDefinitions for namespace: C_DurationUtil
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_DurationUtil.CreateDuration"] = {
    key = "C_DurationUtil.CreateDuration",
    name = "CreateDuration",
    category = "general",
    subcategory = "c_durationutil",
    funcPath = "C_DurationUtil.CreateDuration",
    params = {  },
    returns = { { name = "duration", type = "LuaDurationObject", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
}

APIDefs["C_DurationUtil.CreateDurationTextBinding"] = {
    key = "C_DurationUtil.CreateDurationTextBinding",
    name = "CreateDurationTextBinding",
    category = "general",
    subcategory = "c_durationutil",
    funcPath = "C_DurationUtil.CreateDurationTextBinding",
    params = {  },
    returns = { { name = "binding", type = "DurationTextBinding", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
}

APIDefs["C_DurationUtil.CreateManualClock"] = {
    key = "C_DurationUtil.CreateManualClock",
    name = "CreateManualClock",
    category = "general",
    subcategory = "c_durationutil",
    funcPath = "C_DurationUtil.CreateManualClock",
    params = {  },
    returns = { { name = "clock", type = "LuaDurationManualClock", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
}
