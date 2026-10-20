-- Generated APIDefinitions for namespace: C_NamePlate
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_NamePlate.GetNamePlateForUnit"] = {
    key = "C_NamePlate.GetNamePlateForUnit",
    name = "GetNamePlateForUnit",
    category = "general",
    subcategory = "c_nameplate",
    funcPath = "C_NamePlate.GetNamePlateForUnit",
    params = { { name = "unitToken", type = "UnitTokenNamePlate", default = nil }, { name = "includeForbidden", type = "bool", default = false } },
    returns = { { name = "nameplate", type = "NamePlateFrame", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_NamePlate.GetNamePlateSize"] = {
    key = "C_NamePlate.GetNamePlateSize",
    name = "GetNamePlateSize",
    category = "general",
    subcategory = "c_nameplate",
    funcPath = "C_NamePlate.GetNamePlateSize",
    params = {  },
    returns = { { name = "width", type = "uiUnit", canBeSecret = false }, { name = "height", type = "uiUnit", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
}

APIDefs["C_NamePlate.GetNamePlates"] = {
    key = "C_NamePlate.GetNamePlates",
    name = "GetNamePlates",
    category = "general",
    subcategory = "c_nameplate",
    funcPath = "C_NamePlate.GetNamePlates",
    params = {  },
    returns = { { name = "nameplates", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
}

APIDefs["C_NamePlate.SetNamePlateSize"] = {
    key = "C_NamePlate.SetNamePlateSize",
    name = "SetNamePlateSize",
    category = "general",
    subcategory = "c_nameplate",
    funcPath = "C_NamePlate.SetNamePlateSize",
    params = { { name = "width", type = "uiUnit", default = nil }, { name = "height", type = "uiUnit", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
