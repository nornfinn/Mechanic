-- Generated APIDefinitions for namespace: C_HousingBlueprint
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_HousingBlueprint.CanExportRoom"] = {
    key = "C_HousingBlueprint.CanExportRoom",
    name = "CanExportRoom",
    category = "general",
    subcategory = "c_housingblueprint",
    funcPath = "C_HousingBlueprint.CanExportRoom",
    params = { { name = "roomGUID", type = "WOWGUID", default = nil } },
    returns = { { name = "canExport", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingBlueprint.CanExportTypeFromCurrentLocation"] = {
    key = "C_HousingBlueprint.CanExportTypeFromCurrentLocation",
    name = "CanExportTypeFromCurrentLocation",
    category = "general",
    subcategory = "c_housingblueprint",
    funcPath = "C_HousingBlueprint.CanExportTypeFromCurrentLocation",
    params = { { name = "type", type = "HousingBlueprintType", default = nil } },
    returns = { { name = "locationValid", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingBlueprint.CanImportTypeFromCurrentLocation"] = {
    key = "C_HousingBlueprint.CanImportTypeFromCurrentLocation",
    name = "CanImportTypeFromCurrentLocation",
    category = "general",
    subcategory = "c_housingblueprint",
    funcPath = "C_HousingBlueprint.CanImportTypeFromCurrentLocation",
    params = { { name = "type", type = "HousingBlueprintType", default = nil } },
    returns = { { name = "locationValid", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingBlueprint.DeleteBlueprint"] = {
    key = "C_HousingBlueprint.DeleteBlueprint",
    name = "DeleteBlueprint",
    category = "general",
    subcategory = "c_housingblueprint",
    funcPath = "C_HousingBlueprint.DeleteBlueprint",
    params = { { name = "blueprintID", type = "BigUInteger", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingBlueprint.ExportBlueprint"] = {
    key = "C_HousingBlueprint.ExportBlueprint",
    name = "ExportBlueprint",
    category = "general",
    subcategory = "c_housingblueprint",
    funcPath = "C_HousingBlueprint.ExportBlueprint",
    params = { { name = "type", type = "HousingBlueprintType", default = nil }, { name = "name", type = "cstring", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingBlueprint.ExportRoomBlueprint"] = {
    key = "C_HousingBlueprint.ExportRoomBlueprint",
    name = "ExportRoomBlueprint",
    category = "general",
    subcategory = "c_housingblueprint",
    funcPath = "C_HousingBlueprint.ExportRoomBlueprint",
    params = { { name = "name", type = "cstring", default = nil }, { name = "roomGUID", type = "WOWGUID", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingBlueprint.GetBlueprintHyperlink"] = {
    key = "C_HousingBlueprint.GetBlueprintHyperlink",
    name = "GetBlueprintHyperlink",
    category = "general",
    subcategory = "c_housingblueprint",
    funcPath = "C_HousingBlueprint.GetBlueprintHyperlink",
    params = { { name = "blueprintShareCode", type = "cstring", default = nil } },
    returns = { { name = "hyperLink", type = "string", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingBlueprint.GetBlueprintTypeForCode"] = {
    key = "C_HousingBlueprint.GetBlueprintTypeForCode",
    name = "GetBlueprintTypeForCode",
    category = "general",
    subcategory = "c_housingblueprint",
    funcPath = "C_HousingBlueprint.GetBlueprintTypeForCode",
    params = { { name = "shareCode", type = "cstring", default = nil } },
    returns = { { name = "type", type = "HousingBlueprintType", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingBlueprint.GetExportAvailability"] = {
    key = "C_HousingBlueprint.GetExportAvailability",
    name = "GetExportAvailability",
    category = "general",
    subcategory = "c_housingblueprint",
    funcPath = "C_HousingBlueprint.GetExportAvailability",
    params = {  },
    returns = { { name = "availability", type = "HousingResult", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
}

APIDefs["C_HousingBlueprint.GetFeatureAvailability"] = {
    key = "C_HousingBlueprint.GetFeatureAvailability",
    name = "GetFeatureAvailability",
    category = "general",
    subcategory = "c_housingblueprint",
    funcPath = "C_HousingBlueprint.GetFeatureAvailability",
    params = {  },
    returns = { { name = "blueprintsAvailability", type = "HousingResult", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
}

APIDefs["C_HousingBlueprint.GetImportAvailability"] = {
    key = "C_HousingBlueprint.GetImportAvailability",
    name = "GetImportAvailability",
    category = "general",
    subcategory = "c_housingblueprint",
    funcPath = "C_HousingBlueprint.GetImportAvailability",
    params = {  },
    returns = { { name = "availability", type = "HousingResult", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
}

APIDefs["C_HousingBlueprint.ImportBlueprint"] = {
    key = "C_HousingBlueprint.ImportBlueprint",
    name = "ImportBlueprint",
    category = "general",
    subcategory = "c_housingblueprint",
    funcPath = "C_HousingBlueprint.ImportBlueprint",
    params = { { name = "shareCode", type = "cstring", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingBlueprint.IsShareCodeValid"] = {
    key = "C_HousingBlueprint.IsShareCodeValid",
    name = "IsShareCodeValid",
    category = "general",
    subcategory = "c_housingblueprint",
    funcPath = "C_HousingBlueprint.IsShareCodeValid",
    params = { { name = "shareCode", type = "cstring", default = nil } },
    returns = { { name = "isValid", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingBlueprint.RenameBlueprint"] = {
    key = "C_HousingBlueprint.RenameBlueprint",
    name = "RenameBlueprint",
    category = "general",
    subcategory = "c_housingblueprint",
    funcPath = "C_HousingBlueprint.RenameBlueprint",
    params = { { name = "blueprintID", type = "BigUInteger", default = nil }, { name = "newName", type = "cstring", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingBlueprint.RequestBlueprintCollection"] = {
    key = "C_HousingBlueprint.RequestBlueprintCollection",
    name = "RequestBlueprintCollection",
    category = "general",
    subcategory = "c_housingblueprint",
    funcPath = "C_HousingBlueprint.RequestBlueprintCollection",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
}

APIDefs["C_HousingBlueprint.RequestBlueprintContents"] = {
    key = "C_HousingBlueprint.RequestBlueprintContents",
    name = "RequestBlueprintContents",
    category = "general",
    subcategory = "c_housingblueprint",
    funcPath = "C_HousingBlueprint.RequestBlueprintContents",
    params = { { name = "shareCode", type = "cstring", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingBlueprint.RequestBlueprintContentsForContext"] = {
    key = "C_HousingBlueprint.RequestBlueprintContentsForContext",
    name = "RequestBlueprintContentsForContext",
    category = "general",
    subcategory = "c_housingblueprint",
    funcPath = "C_HousingBlueprint.RequestBlueprintContentsForContext",
    params = { { name = "shareCode", type = "cstring", default = nil }, { name = "optionalHouseGUID", type = "WOWGUID", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingBlueprint.StartImportRoomBlueprint"] = {
    key = "C_HousingBlueprint.StartImportRoomBlueprint",
    name = "StartImportRoomBlueprint",
    category = "general",
    subcategory = "c_housingblueprint",
    funcPath = "C_HousingBlueprint.StartImportRoomBlueprint",
    params = { { name = "shareCode", type = "cstring", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_HousingBlueprint.UpdateBlueprintStringFromInput"] = {
    key = "C_HousingBlueprint.UpdateBlueprintStringFromInput",
    name = "UpdateBlueprintStringFromInput",
    category = "general",
    subcategory = "c_housingblueprint",
    funcPath = "C_HousingBlueprint.UpdateBlueprintStringFromInput",
    params = { { name = "inputShareCode", type = "cstring", default = nil } },
    returns = { { name = "updatedShareCode", type = "string", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
