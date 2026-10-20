-- Generated APIDefinitions for namespace: C_Intl
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_Intl.CompareStrings"] = {
    key = "C_Intl.CompareStrings",
    name = "CompareStrings",
    category = "general",
    subcategory = "c_intl",
    funcPath = "C_Intl.CompareStrings",
    params = { { name = "left", type = "cstring", default = nil }, { name = "right", type = "cstring", default = nil }, { name = "strength", type = "CollationStrength", default = nil } },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_Intl.CreateLocaleContext"] = {
    key = "C_Intl.CreateLocaleContext",
    name = "CreateLocaleContext",
    category = "general",
    subcategory = "c_intl",
    funcPath = "C_Intl.CreateLocaleContext",
    params = { { name = "locale", type = "cstring", default = nil } },
    returns = { { name = "context", type = "LuaLocaleContext", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Intl.FindBreaks"] = {
    key = "C_Intl.FindBreaks",
    name = "FindBreaks",
    category = "general",
    subcategory = "c_intl",
    funcPath = "C_Intl.FindBreaks",
    params = { { name = "text", type = "cstring", default = nil }, { name = "breakType", type = "BreakType", default = nil } },
    returns = { { name = "byteOffsets", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_Intl.FindStringMatches"] = {
    key = "C_Intl.FindStringMatches",
    name = "FindStringMatches",
    category = "general",
    subcategory = "c_intl",
    funcPath = "C_Intl.FindStringMatches",
    params = { { name = "text", type = "cstring", default = nil }, { name = "pattern", type = "cstring", default = nil }, { name = "strength", type = "CollationStrength", default = nil } },
    returns = { { name = "byteOffsets", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_Intl.FoldCase"] = {
    key = "C_Intl.FoldCase",
    name = "FoldCase",
    category = "general",
    subcategory = "c_intl",
    funcPath = "C_Intl.FoldCase",
    params = { { name = "text", type = "cstring", default = nil } },
    returns = { { name = "result", type = "string", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_Intl.FormatCurrency"] = {
    key = "C_Intl.FormatCurrency",
    name = "FormatCurrency",
    category = "general",
    subcategory = "c_intl",
    funcPath = "C_Intl.FormatCurrency",
    params = { { name = "number", type = "number", default = nil }, { name = "currencyCode", type = "cstring", default = nil } },
    returns = { { name = "result", type = "string", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_Intl.FormatDate"] = {
    key = "C_Intl.FormatDate",
    name = "FormatDate",
    category = "general",
    subcategory = "c_intl",
    funcPath = "C_Intl.FormatDate",
    params = { { name = "unixTimeSeconds", type = "number", default = nil }, { name = "style", type = "DateTimeStyle", default = nil }, { name = "timeZone", type = "cstring", default = nil } },
    returns = { { name = "result", type = "string", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_Intl.FormatDateTime"] = {
    key = "C_Intl.FormatDateTime",
    name = "FormatDateTime",
    category = "general",
    subcategory = "c_intl",
    funcPath = "C_Intl.FormatDateTime",
    params = { { name = "unixTimeSeconds", type = "number", default = nil }, { name = "dateStyle", type = "DateTimeStyle", default = nil }, { name = "timeStyle", type = "DateTimeStyle", default = nil }, { name = "timeZone", type = "cstring", default = nil } },
    returns = { { name = "result", type = "string", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_Intl.FormatNumber"] = {
    key = "C_Intl.FormatNumber",
    name = "FormatNumber",
    category = "general",
    subcategory = "c_intl",
    funcPath = "C_Intl.FormatNumber",
    params = { { name = "number", type = "number", default = nil }, { name = "style", type = "NumberStyle", default = nil } },
    returns = { { name = "result", type = "string", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_Intl.FormatTime"] = {
    key = "C_Intl.FormatTime",
    name = "FormatTime",
    category = "general",
    subcategory = "c_intl",
    funcPath = "C_Intl.FormatTime",
    params = { { name = "unixTimeSeconds", type = "number", default = nil }, { name = "style", type = "DateTimeStyle", default = nil }, { name = "timeZone", type = "cstring", default = nil } },
    returns = { { name = "result", type = "string", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_Intl.GetCharacterProperties"] = {
    key = "C_Intl.GetCharacterProperties",
    name = "GetCharacterProperties",
    category = "general",
    subcategory = "c_intl",
    funcPath = "C_Intl.GetCharacterProperties",
    params = { { name = "text", type = "cstring", default = nil } },
    returns = { { name = "result", type = "CharacterProperties", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_Intl.GetCurrencyFractionDigits"] = {
    key = "C_Intl.GetCurrencyFractionDigits",
    name = "GetCurrencyFractionDigits",
    category = "general",
    subcategory = "c_intl",
    funcPath = "C_Intl.GetCurrencyFractionDigits",
    params = { { name = "currencyCode", type = "cstring", default = nil } },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_Intl.GetCurrencyName"] = {
    key = "C_Intl.GetCurrencyName",
    name = "GetCurrencyName",
    category = "general",
    subcategory = "c_intl",
    funcPath = "C_Intl.GetCurrencyName",
    params = { { name = "currencyCode", type = "cstring", default = nil }, { name = "nameStyle", type = "CurrencyNameStyle", default = nil } },
    returns = { { name = "result", type = "string", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_Intl.GetCurrentLocale"] = {
    key = "C_Intl.GetCurrentLocale",
    name = "GetCurrentLocale",
    category = "general",
    subcategory = "c_intl",
    funcPath = "C_Intl.GetCurrentLocale",
    params = {  },
    returns = { { name = "result", type = "cstring", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
}

APIDefs["C_Intl.GetDisplayName"] = {
    key = "C_Intl.GetDisplayName",
    name = "GetDisplayName",
    category = "general",
    subcategory = "c_intl",
    funcPath = "C_Intl.GetDisplayName",
    params = { { name = "displayLocale", type = "cstring", default = nil } },
    returns = { { name = "result", type = "string", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_Intl.GetSortKey"] = {
    key = "C_Intl.GetSortKey",
    name = "GetSortKey",
    category = "general",
    subcategory = "c_intl",
    funcPath = "C_Intl.GetSortKey",
    params = { { name = "text", type = "cstring", default = nil }, { name = "strength", type = "CollationStrength", default = nil } },
    returns = { { name = "sortKey", type = "string", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_Intl.IsNormalized"] = {
    key = "C_Intl.IsNormalized",
    name = "IsNormalized",
    category = "general",
    subcategory = "c_intl",
    funcPath = "C_Intl.IsNormalized",
    params = { { name = "text", type = "cstring", default = nil }, { name = "form", type = "NormalizationForm", default = nil } },
    returns = { { name = "isNormalized", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_Intl.Length"] = {
    key = "C_Intl.Length",
    name = "Length",
    category = "general",
    subcategory = "c_intl",
    funcPath = "C_Intl.Length",
    params = { { name = "text", type = "cstring", default = nil } },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_Intl.Normalize"] = {
    key = "C_Intl.Normalize",
    name = "Normalize",
    category = "general",
    subcategory = "c_intl",
    funcPath = "C_Intl.Normalize",
    params = { { name = "text", type = "cstring", default = nil }, { name = "form", type = "NormalizationForm", default = nil } },
    returns = { { name = "result", type = "string", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_Intl.ParseCurrency"] = {
    key = "C_Intl.ParseCurrency",
    name = "ParseCurrency",
    category = "general",
    subcategory = "c_intl",
    funcPath = "C_Intl.ParseCurrency",
    params = { { name = "text", type = "cstring", default = nil } },
    returns = { { name = "result", type = "CurrencyParseResult", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_Intl.ParseNumber"] = {
    key = "C_Intl.ParseNumber",
    name = "ParseNumber",
    category = "general",
    subcategory = "c_intl",
    funcPath = "C_Intl.ParseNumber",
    params = { { name = "text", type = "cstring", default = nil }, { name = "style", type = "NumberStyle", default = nil } },
    returns = { { name = "result", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_Intl.SelectPlural"] = {
    key = "C_Intl.SelectPlural",
    name = "SelectPlural",
    category = "general",
    subcategory = "c_intl",
    funcPath = "C_Intl.SelectPlural",
    params = { { name = "number", type = "number", default = nil }, { name = "pluralType", type = "PluralType", default = nil } },
    returns = { { name = "result", type = "string", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_Intl.ToLower"] = {
    key = "C_Intl.ToLower",
    name = "ToLower",
    category = "general",
    subcategory = "c_intl",
    funcPath = "C_Intl.ToLower",
    params = { { name = "text", type = "cstring", default = nil } },
    returns = { { name = "result", type = "string", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_Intl.ToTitle"] = {
    key = "C_Intl.ToTitle",
    name = "ToTitle",
    category = "general",
    subcategory = "c_intl",
    funcPath = "C_Intl.ToTitle",
    params = { { name = "text", type = "cstring", default = nil } },
    returns = { { name = "result", type = "string", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_Intl.ToUpper"] = {
    key = "C_Intl.ToUpper",
    name = "ToUpper",
    category = "general",
    subcategory = "c_intl",
    funcPath = "C_Intl.ToUpper",
    params = { { name = "text", type = "cstring", default = nil } },
    returns = { { name = "result", type = "string", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_Intl.TransformLocale"] = {
    key = "C_Intl.TransformLocale",
    name = "TransformLocale",
    category = "general",
    subcategory = "c_intl",
    funcPath = "C_Intl.TransformLocale",
    params = { { name = "transform", type = "LocaleTransform", default = nil } },
    returns = { { name = "result", type = "string", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_Intl.Transliterate"] = {
    key = "C_Intl.Transliterate",
    name = "Transliterate",
    category = "general",
    subcategory = "c_intl",
    funcPath = "C_Intl.Transliterate",
    params = { { name = "text", type = "cstring", default = nil }, { name = "transliteratorID", type = "cstring", default = nil } },
    returns = { { name = "result", type = "string", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}
