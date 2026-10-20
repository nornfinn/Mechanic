-- Generated APIDefinitions for namespace: C_AutoComplete
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_AutoComplete.GetAutoCompletePresenceID"] = {
    key = "C_AutoComplete.GetAutoCompletePresenceID",
    name = "GetAutoCompletePresenceID",
    category = "general",
    subcategory = "c_autocomplete",
    funcPath = "C_AutoComplete.GetAutoCompletePresenceID",
    params = { { name = "name", type = "cstring", default = nil } },
    returns = { { name = "presenceID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AutoComplete.GetAutoCompleteRealms"] = {
    key = "C_AutoComplete.GetAutoCompleteRealms",
    name = "GetAutoCompleteRealms",
    category = "general",
    subcategory = "c_autocomplete",
    funcPath = "C_AutoComplete.GetAutoCompleteRealms",
    params = {  },
    returns = { { name = "realms", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
}

APIDefs["C_AutoComplete.GetAutoCompleteResults"] = {
    key = "C_AutoComplete.GetAutoCompleteResults",
    name = "GetAutoCompleteResults",
    category = "general",
    subcategory = "c_autocomplete",
    funcPath = "C_AutoComplete.GetAutoCompleteResults",
    params = { { name = "name", type = "cstring", default = nil }, { name = "numResults", type = "number", default = nil }, { name = "cursorPosition", type = "number", default = nil }, { name = "allowFullMatch", type = "bool", default = nil }, { name = "includeFlags", type = "number", default = nil }, { name = "excludeFlags", type = "number", default = nil } },
    returns = { { name = "results", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_AutoComplete.IsRecognizedName"] = {
    key = "C_AutoComplete.IsRecognizedName",
    name = "IsRecognizedName",
    category = "general",
    subcategory = "c_autocomplete",
    funcPath = "C_AutoComplete.IsRecognizedName",
    params = { { name = "name", type = "cstring", default = nil }, { name = "includeFlags", type = "number", default = nil }, { name = "excludeFlags", type = "number", default = nil } },
    returns = { { name = "isRecognizedName", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
