-- Generated APIDefinitions for namespace: C_QuestHub
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_QuestHub.IsAreaPOICurrentlyRelatedToHub"] = {
    key = "C_QuestHub.IsAreaPOICurrentlyRelatedToHub",
    name = "IsAreaPOICurrentlyRelatedToHub",
    category = "achievement",
    subcategory = "c_questhub",
    funcPath = "C_QuestHub.IsAreaPOICurrentlyRelatedToHub",
    params = { { name = "areaPoiID", type = "number", default = nil }, { name = "hubAreaPoiID", type = "number", default = nil } },
    returns = { { name = "isRelated", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_QuestHub.IsQuestCurrentlyRelatedToHub"] = {
    key = "C_QuestHub.IsQuestCurrentlyRelatedToHub",
    name = "IsQuestCurrentlyRelatedToHub",
    category = "achievement",
    subcategory = "c_questhub",
    funcPath = "C_QuestHub.IsQuestCurrentlyRelatedToHub",
    params = { { name = "questID", type = "number", default = nil }, { name = "hubAreaPoiID", type = "number", default = nil } },
    returns = { { name = "isRelated", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
