-- Generated APIDefinitions for namespace: table
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["table.contains"] = {
    key = "table.contains",
    name = "contains",
    category = "general",
    subcategory = "table",
    funcPath = "table.contains",
    params = { { name = "table", type = "table", default = nil }, { name = "value", type = "any", default = nil } },
    returns = { { name = "containsValue", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["table.count"] = {
    key = "table.count",
    name = "count",
    category = "combat_midnight",
    subcategory = "table",
    funcPath = "table.count",
    params = { { name = "table", type = "table", default = nil } },
    returns = { { name = "count", type = "number", canBeSecret = false } },
    midnightImpact = "CONDITIONAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted, SecretWhenLuaTableHasSecretKeys",
}

APIDefs["table.create"] = {
    key = "table.create",
    name = "create",
    category = "general",
    subcategory = "table",
    funcPath = "table.create",
    params = { { name = "arraySizeHint", type = "number", default = nil }, { name = "nodeSizeHint", type = "number", default = 0 } },
    returns = { { name = "table", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["table.freeze"] = {
    key = "table.freeze",
    name = "freeze",
    category = "general",
    subcategory = "table",
    funcPath = "table.freeze",
    params = { { name = "table", type = "table", default = nil } },
    returns = { { name = "frozen", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["table.getcountinfo"] = {
    key = "table.getcountinfo",
    name = "getcountinfo",
    category = "combat_midnight",
    subcategory = "table",
    funcPath = "table.getcountinfo",
    params = { { name = "table", type = "table", default = nil } },
    returns = { { name = "numEntries", type = "number", canBeSecret = false }, { name = "numPositiveIntegerKeys", type = "number", canBeSecret = false }, { name = "maxPositiveIntegerKey", type = "number", canBeSecret = false } },
    midnightImpact = "CONDITIONAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted, SecretWhenLuaTableHasSecretKeys",
}

APIDefs["table.indexof"] = {
    key = "table.indexof",
    name = "indexof",
    category = "general",
    subcategory = "table",
    funcPath = "table.indexof",
    params = { { name = "table", type = "table", default = nil }, { name = "value", type = "any", default = nil } },
    returns = { { name = "index", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["table.isempty"] = {
    key = "table.isempty",
    name = "isempty",
    category = "combat_midnight",
    subcategory = "table",
    funcPath = "table.isempty",
    params = { { name = "table", type = "table", default = nil } },
    returns = { { name = "empty", type = "bool", canBeSecret = false } },
    midnightImpact = "CONDITIONAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted, SecretWhenLuaTableHasSecretKeys",
}

APIDefs["table.isfrozen"] = {
    key = "table.isfrozen",
    name = "isfrozen",
    category = "general",
    subcategory = "table",
    funcPath = "table.isfrozen",
    params = { { name = "table", type = "table", default = nil } },
    returns = { { name = "frozen", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["table.keys"] = {
    key = "table.keys",
    name = "keys",
    category = "general",
    subcategory = "table",
    funcPath = "table.keys",
    params = { { name = "table", type = "table", default = nil } },
    returns = { { name = "keys", type = "any", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["table.removeunordered"] = {
    key = "table.removeunordered",
    name = "removeunordered",
    category = "general",
    subcategory = "table",
    funcPath = "table.removeunordered",
    params = { { name = "table", type = "table", default = nil }, { name = "index", type = "number", default = nil } },
    returns = { { name = "value", type = "any", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["table.removevalue"] = {
    key = "table.removevalue",
    name = "removevalue",
    category = "general",
    subcategory = "table",
    funcPath = "table.removevalue",
    params = { { name = "table", type = "table", default = nil }, { name = "value", type = "any", default = nil } },
    returns = { { name = "removedCount", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["table.values"] = {
    key = "table.values",
    name = "values",
    category = "general",
    subcategory = "table",
    funcPath = "table.values",
    params = { { name = "table", type = "table", default = nil } },
    returns = { { name = "values", type = "any", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
