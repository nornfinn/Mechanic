-- Generated APIDefinitions for namespace: C_StringUtil
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_StringUtil.CreateAbbreviatedNumberFormatter"] = {
    key = "C_StringUtil.CreateAbbreviatedNumberFormatter",
    name = "CreateAbbreviatedNumberFormatter",
    category = "general",
    subcategory = "c_stringutil",
    funcPath = "C_StringUtil.CreateAbbreviatedNumberFormatter",
    params = {  },
    returns = { { name = "formatter", type = "AbbreviatedNumberFormatter", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
}

APIDefs["C_StringUtil.CreateNumericRuleFormatter"] = {
    key = "C_StringUtil.CreateNumericRuleFormatter",
    name = "CreateNumericRuleFormatter",
    category = "general",
    subcategory = "c_stringutil",
    funcPath = "C_StringUtil.CreateNumericRuleFormatter",
    params = {  },
    returns = { { name = "formatter", type = "NumericRuleFormatter", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
}

APIDefs["C_StringUtil.CreateSecondsFormatter"] = {
    key = "C_StringUtil.CreateSecondsFormatter",
    name = "CreateSecondsFormatter",
    category = "general",
    subcategory = "c_stringutil",
    funcPath = "C_StringUtil.CreateSecondsFormatter",
    params = {  },
    returns = { { name = "formatter", type = "SecondsFormatter", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
}

APIDefs["C_StringUtil.EscapeDecimalNonPrintables"] = {
    key = "C_StringUtil.EscapeDecimalNonPrintables",
    name = "EscapeDecimalNonPrintables",
    category = "general",
    subcategory = "c_stringutil",
    funcPath = "C_StringUtil.EscapeDecimalNonPrintables",
    params = { { name = "text", type = "stringView", default = nil } },
    returns = { { name = "escapedText", type = "string", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_StringUtil.EscapeLuaFormatString"] = {
    key = "C_StringUtil.EscapeLuaFormatString",
    name = "EscapeLuaFormatString",
    category = "general",
    subcategory = "c_stringutil",
    funcPath = "C_StringUtil.EscapeLuaFormatString",
    params = { { name = "text", type = "string", default = nil } },
    returns = { { name = "escapedText", type = "stringView", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_StringUtil.EscapeLuaPatterns"] = {
    key = "C_StringUtil.EscapeLuaPatterns",
    name = "EscapeLuaPatterns",
    category = "general",
    subcategory = "c_stringutil",
    funcPath = "C_StringUtil.EscapeLuaPatterns",
    params = { { name = "text", type = "stringView", default = nil } },
    returns = { { name = "escapedText", type = "string", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_StringUtil.EscapeQuotedCodes"] = {
    key = "C_StringUtil.EscapeQuotedCodes",
    name = "EscapeQuotedCodes",
    category = "general",
    subcategory = "c_stringutil",
    funcPath = "C_StringUtil.EscapeQuotedCodes",
    params = { { name = "text", type = "string", default = nil } },
    returns = { { name = "escaped", type = "stringView", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_StringUtil.FloorToNearestString"] = {
    key = "C_StringUtil.FloorToNearestString",
    name = "FloorToNearestString",
    category = "general",
    subcategory = "c_stringutil",
    funcPath = "C_StringUtil.FloorToNearestString",
    params = { { name = "number", type = "number", default = nil } },
    returns = { { name = "text", type = "string", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_StringUtil.RemoveContiguousSpaces"] = {
    key = "C_StringUtil.RemoveContiguousSpaces",
    name = "RemoveContiguousSpaces",
    category = "general",
    subcategory = "c_stringutil",
    funcPath = "C_StringUtil.RemoveContiguousSpaces",
    params = { { name = "text", type = "stringView", default = nil }, { name = "maxAllowedSpaces", type = "number", default = nil } },
    returns = { { name = "trimmedText", type = "string", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_StringUtil.RoundToNearestString"] = {
    key = "C_StringUtil.RoundToNearestString",
    name = "RoundToNearestString",
    category = "general",
    subcategory = "c_stringutil",
    funcPath = "C_StringUtil.RoundToNearestString",
    params = { { name = "number", type = "number", default = nil } },
    returns = { { name = "text", type = "string", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_StringUtil.StripHyperlinks"] = {
    key = "C_StringUtil.StripHyperlinks",
    name = "StripHyperlinks",
    category = "general",
    subcategory = "c_stringutil",
    funcPath = "C_StringUtil.StripHyperlinks",
    params = { { name = "text", type = "string", default = nil }, { name = "maintainColor", type = "bool", default = false }, { name = "maintainBrackets", type = "bool", default = false }, { name = "stripNewlines", type = "bool", default = false }, { name = "maintainAtlases", type = "bool", default = false }, { name = "maintainTextures", type = "bool", default = false } },
    returns = { { name = "stripped", type = "stringView", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_StringUtil.StripTextureMarkupForLooseFiles"] = {
    key = "C_StringUtil.StripTextureMarkupForLooseFiles",
    name = "StripTextureMarkupForLooseFiles",
    category = "general",
    subcategory = "c_stringutil",
    funcPath = "C_StringUtil.StripTextureMarkupForLooseFiles",
    params = { { name = "text", type = "string", default = nil } },
    returns = { { name = "stripped", type = "stringView", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_StringUtil.TruncateWhenZero"] = {
    key = "C_StringUtil.TruncateWhenZero",
    name = "TruncateWhenZero",
    category = "general",
    subcategory = "c_stringutil",
    funcPath = "C_StringUtil.TruncateWhenZero",
    params = { { name = "number", type = "number", default = nil } },
    returns = { { name = "text", type = "string", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_StringUtil.WrapString"] = {
    key = "C_StringUtil.WrapString",
    name = "WrapString",
    category = "general",
    subcategory = "c_stringutil",
    funcPath = "C_StringUtil.WrapString",
    params = { { name = "infix", type = "stringView", default = nil }, { name = "prefix", type = "stringView", default = nil }, { name = "suffix", type = "stringView", default = nil } },
    returns = { { name = "text", type = "string", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}
