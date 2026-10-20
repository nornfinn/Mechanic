-- Generated APIDefinitions for namespace: C_UIFileAsset
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_UIFileAsset.GetFileID"] = {
    key = "C_UIFileAsset.GetFileID",
    name = "GetFileID",
    category = "general",
    subcategory = "c_uifileasset",
    funcPath = "C_UIFileAsset.GetFileID",
    params = { { name = "asset", type = "FileAsset", default = nil } },
    returns = { { name = "assetFileID", type = "fileID", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_UIFileAsset.IsKnownFile"] = {
    key = "C_UIFileAsset.IsKnownFile",
    name = "IsKnownFile",
    category = "general",
    subcategory = "c_uifileasset",
    funcPath = "C_UIFileAsset.IsKnownFile",
    params = { { name = "asset", type = "FileAsset", default = nil } },
    returns = { { name = "isValid", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_UIFileAsset.IsLooseFile"] = {
    key = "C_UIFileAsset.IsLooseFile",
    name = "IsLooseFile",
    category = "general",
    subcategory = "c_uifileasset",
    funcPath = "C_UIFileAsset.IsLooseFile",
    params = { { name = "asset", type = "FileAsset", default = nil } },
    returns = { { name = "isLooseFile", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
