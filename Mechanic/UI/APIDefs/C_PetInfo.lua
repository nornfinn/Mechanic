-- Generated APIDefinitions for namespace: C_PetInfo
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_PetInfo.CanPetEatItem"] = {
    key = "C_PetInfo.CanPetEatItem",
    name = "CanPetEatItem",
    category = "general",
    subcategory = "c_petinfo",
    funcPath = "C_PetInfo.CanPetEatItem",
    params = { { name = "itemID", type = "number", default = nil } },
    returns = { { name = "canEat", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PetInfo.GetPetFoodTypes"] = {
    key = "C_PetInfo.GetPetFoodTypes",
    name = "GetPetFoodTypes",
    category = "general",
    subcategory = "c_petinfo",
    funcPath = "C_PetInfo.GetPetFoodTypes",
    params = {  },
    returns = { { name = "foodTypes", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "forever" },
}

APIDefs["C_PetInfo.GetPetHappiness"] = {
    key = "C_PetInfo.GetPetHappiness",
    name = "GetPetHappiness",
    category = "general",
    subcategory = "c_petinfo",
    funcPath = "C_PetInfo.GetPetHappiness",
    params = {  },
    returns = { { name = "happiness", type = "number", canBeSecret = false }, { name = "damagePercentage", type = "number", canBeSecret = false }, { name = "loyaltyRate", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "forever" },
}

APIDefs["C_PetInfo.GetPetLoyalty"] = {
    key = "C_PetInfo.GetPetLoyalty",
    name = "GetPetLoyalty",
    category = "general",
    subcategory = "c_petinfo",
    funcPath = "C_PetInfo.GetPetLoyalty",
    params = {  },
    returns = { { name = "loyaltyName", type = "string", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "forever" },
}

APIDefs["C_PetInfo.GetPetTalentTree"] = {
    key = "C_PetInfo.GetPetTalentTree",
    name = "GetPetTalentTree",
    category = "general",
    subcategory = "c_petinfo",
    funcPath = "C_PetInfo.GetPetTalentTree",
    params = {  },
    returns = { { name = "talentTreeName", type = "stringView", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
}

APIDefs["C_PetInfo.GetPetTamersForMap"] = {
    key = "C_PetInfo.GetPetTamersForMap",
    name = "GetPetTamersForMap",
    category = "general",
    subcategory = "c_petinfo",
    funcPath = "C_PetInfo.GetPetTamersForMap",
    params = { { name = "uiMapID", type = "number", default = nil } },
    returns = { { name = "petTamers", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PetInfo.GetPetTrainingPoints"] = {
    key = "C_PetInfo.GetPetTrainingPoints",
    name = "GetPetTrainingPoints",
    category = "general",
    subcategory = "c_petinfo",
    funcPath = "C_PetInfo.GetPetTrainingPoints",
    params = {  },
    returns = { { name = "totalPoints", type = "number", canBeSecret = false }, { name = "usedPoints", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "forever" },
}

APIDefs["C_PetInfo.GetPetUIModelSceneID"] = {
    key = "C_PetInfo.GetPetUIModelSceneID",
    name = "GetPetUIModelSceneID",
    category = "general",
    subcategory = "c_petinfo",
    funcPath = "C_PetInfo.GetPetUIModelSceneID",
    params = {  },
    returns = { { name = "modelSceneID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "forever" },
}

APIDefs["C_PetInfo.GetSpellForPetAction"] = {
    key = "C_PetInfo.GetSpellForPetAction",
    name = "GetSpellForPetAction",
    category = "general",
    subcategory = "c_petinfo",
    funcPath = "C_PetInfo.GetSpellForPetAction",
    params = { { name = "actionID", type = "number", default = nil } },
    returns = { { name = "spellID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PetInfo.IsPetActionPassive"] = {
    key = "C_PetInfo.IsPetActionPassive",
    name = "IsPetActionPassive",
    category = "general",
    subcategory = "c_petinfo",
    funcPath = "C_PetInfo.IsPetActionPassive",
    params = { { name = "actionID", type = "number", default = nil } },
    returns = { { name = "isPassive", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PetInfo.PetAbandon"] = {
    key = "C_PetInfo.PetAbandon",
    name = "PetAbandon",
    category = "general",
    subcategory = "c_petinfo",
    funcPath = "C_PetInfo.PetAbandon",
    params = { { name = "petNumber", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_PetInfo.PetAssistMode"] = {
    key = "C_PetInfo.PetAssistMode",
    name = "PetAssistMode",
    category = "general",
    subcategory = "c_petinfo",
    funcPath = "C_PetInfo.PetAssistMode",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
}

APIDefs["C_PetInfo.PetRename"] = {
    key = "C_PetInfo.PetRename",
    name = "PetRename",
    category = "general",
    subcategory = "c_petinfo",
    funcPath = "C_PetInfo.PetRename",
    params = { { name = "name", type = "cstring", default = nil }, { name = "petNumber", type = "number", default = nil }, { name = "declensions", type = "table", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
