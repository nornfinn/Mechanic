-- Generated APIDefinitions for namespace: math
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["math.clamp"] = {
    key = "math.clamp",
    name = "clamp",
    category = "general",
    subcategory = "math",
    funcPath = "math.clamp",
    params = { { name = "value", type = "number", default = nil }, { name = "minimum", type = "number", default = nil }, { name = "maximum", type = "number", default = nil } },
    returns = { { name = "clampedValue", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["math.isfinite"] = {
    key = "math.isfinite",
    name = "isfinite",
    category = "general",
    subcategory = "math",
    funcPath = "math.isfinite",
    params = { { name = "value", type = "number", default = nil } },
    returns = { { name = "finite", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["math.isinf"] = {
    key = "math.isinf",
    name = "isinf",
    category = "general",
    subcategory = "math",
    funcPath = "math.isinf",
    params = { { name = "value", type = "number", default = nil } },
    returns = { { name = "infinite", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["math.isnan"] = {
    key = "math.isnan",
    name = "isnan",
    category = "general",
    subcategory = "math",
    funcPath = "math.isnan",
    params = { { name = "value", type = "number", default = nil } },
    returns = { { name = "nan", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["math.lerp"] = {
    key = "math.lerp",
    name = "lerp",
    category = "general",
    subcategory = "math",
    funcPath = "math.lerp",
    params = { { name = "startValue", type = "number", default = nil }, { name = "endValue", type = "number", default = nil }, { name = "amount", type = "number", default = nil } },
    returns = { { name = "interpolatedValue", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["math.normalize"] = {
    key = "math.normalize",
    name = "normalize",
    category = "general",
    subcategory = "math",
    funcPath = "math.normalize",
    params = { { name = "value", type = "number", default = nil }, { name = "minimum", type = "number", default = nil }, { name = "maximum", type = "number", default = nil } },
    returns = { { name = "normalizedValue", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["math.remap"] = {
    key = "math.remap",
    name = "remap",
    category = "general",
    subcategory = "math",
    funcPath = "math.remap",
    params = { { name = "value", type = "number", default = nil }, { name = "sourceMinimum", type = "number", default = nil }, { name = "sourceMaximum", type = "number", default = nil }, { name = "destinationMinimum", type = "number", default = nil }, { name = "destinationMaximum", type = "number", default = nil } },
    returns = { { name = "remappedValue", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["math.round"] = {
    key = "math.round",
    name = "round",
    category = "general",
    subcategory = "math",
    funcPath = "math.round",
    params = { { name = "value", type = "number", default = nil }, { name = "decimalPlaces", type = "number", default = 0 } },
    returns = { { name = "roundedValue", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["math.saturate"] = {
    key = "math.saturate",
    name = "saturate",
    category = "general",
    subcategory = "math",
    funcPath = "math.saturate",
    params = { { name = "value", type = "number", default = nil } },
    returns = { { name = "saturatedValue", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["math.sign"] = {
    key = "math.sign",
    name = "sign",
    category = "general",
    subcategory = "math",
    funcPath = "math.sign",
    params = { { name = "value", type = "number", default = nil } },
    returns = { { name = "sign", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["math.wrap"] = {
    key = "math.wrap",
    name = "wrap",
    category = "general",
    subcategory = "math",
    funcPath = "math.wrap",
    params = { { name = "value", type = "number", default = nil }, { name = "minimum", type = "number", default = nil }, { name = "maximum", type = "number", default = nil } },
    returns = { { name = "wrapped", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
