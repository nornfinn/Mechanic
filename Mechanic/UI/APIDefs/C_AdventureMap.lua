-- Generated APIDefinitions for namespace: C_AdventureMap
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_AdventureMap.GetAdventureMapTextureKit"] = {
    key = "C_AdventureMap.GetAdventureMapTextureKit",
    name = "GetAdventureMapTextureKit",
    category = "map",
    subcategory = "c_adventuremap",
    funcPath = "C_AdventureMap.GetAdventureMapTextureKit",
    params = {  },
    returns = { { name = "adventureMapTextureKit", type = "textureKit", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
}

APIDefs["C_AdventureMap.GetNumMapInsets"] = {
    key = "C_AdventureMap.GetNumMapInsets",
    name = "GetNumMapInsets",
    category = "map",
    subcategory = "c_adventuremap",
    funcPath = "C_AdventureMap.GetNumMapInsets",
    params = {  },
    returns = { { name = "numMapInsets", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
}

APIDefs["C_AdventureMap.GetNumQuestOffers"] = {
    key = "C_AdventureMap.GetNumQuestOffers",
    name = "GetNumQuestOffers",
    category = "map",
    subcategory = "c_adventuremap",
    funcPath = "C_AdventureMap.GetNumQuestOffers",
    params = {  },
    returns = { { name = "numQuestOffers", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
}

APIDefs["C_AdventureMap.GetNumZoneChoices"] = {
    key = "C_AdventureMap.GetNumZoneChoices",
    name = "GetNumZoneChoices",
    category = "map",
    subcategory = "c_adventuremap",
    funcPath = "C_AdventureMap.GetNumZoneChoices",
    params = {  },
    returns = { { name = "numZoneChoices", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
}

APIDefs["C_AdventureMap.GetQuestPortraitInfo"] = {
    key = "C_AdventureMap.GetQuestPortraitInfo",
    name = "GetQuestPortraitInfo",
    category = "map",
    subcategory = "c_adventuremap",
    funcPath = "C_AdventureMap.GetQuestPortraitInfo",
    params = { { name = "questID", type = "number", default = nil } },
    returns = { { name = "info", type = "AdventureMapQuestPortraitInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
