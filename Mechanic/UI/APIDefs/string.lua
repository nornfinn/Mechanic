-- Generated APIDefinitions for namespace: string
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["string.contains"] = {
    key = "string.contains",
    name = "contains",
    category = "general",
    subcategory = "string",
    funcPath = "string.contains",
    params = { { name = "str", type = "stringView", default = nil }, { name = "substring", type = "stringView", default = nil } },
    returns = { { name = "contains", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["string.endswith"] = {
    key = "string.endswith",
    name = "endswith",
    category = "general",
    subcategory = "string",
    funcPath = "string.endswith",
    params = { { name = "str", type = "stringView", default = nil }, { name = "suffix", type = "stringView", default = nil } },
    returns = { { name = "endsWith", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["string.ltrim"] = {
    key = "string.ltrim",
    name = "ltrim",
    category = "general",
    subcategory = "string",
    funcPath = "string.ltrim",
    params = { { name = "str", type = "stringView", default = nil }, { name = "characters", type = "stringView", default = " \\r\\n\\t" } },
    returns = { { name = "trimmed", type = "stringView", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["string.rtrim"] = {
    key = "string.rtrim",
    name = "rtrim",
    category = "general",
    subcategory = "string",
    funcPath = "string.rtrim",
    params = { { name = "str", type = "stringView", default = nil }, { name = "characters", type = "stringView", default = " \\r\\n\\t" } },
    returns = { { name = "trimmed", type = "stringView", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["string.startswith"] = {
    key = "string.startswith",
    name = "startswith",
    category = "general",
    subcategory = "string",
    funcPath = "string.startswith",
    params = { { name = "str", type = "stringView", default = nil }, { name = "prefix", type = "stringView", default = nil } },
    returns = { { name = "startsWith", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["string.trim"] = {
    key = "string.trim",
    name = "trim",
    category = "general",
    subcategory = "string",
    funcPath = "string.trim",
    params = { { name = "str", type = "stringView", default = nil }, { name = "characters", type = "stringView", default = " \\r\\n\\t" } },
    returns = { { name = "trimmed", type = "stringView", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
