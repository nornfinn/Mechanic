-- Generated APIDefinitions for namespace: C_ScenarioInfo
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_ScenarioInfo.GetCriteriaInfo"] = {
    key = "C_ScenarioInfo.GetCriteriaInfo",
    name = "GetCriteriaInfo",
    category = "general",
    subcategory = "c_scenarioinfo",
    funcPath = "C_ScenarioInfo.GetCriteriaInfo",
    params = { { name = "criteriaIndex", type = "number", default = nil } },
    returns = { { name = "scenarioCriteriaInfo", type = "ScenarioCriteriaInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ScenarioInfo.GetCriteriaInfoByStep"] = {
    key = "C_ScenarioInfo.GetCriteriaInfoByStep",
    name = "GetCriteriaInfoByStep",
    category = "general",
    subcategory = "c_scenarioinfo",
    funcPath = "C_ScenarioInfo.GetCriteriaInfoByStep",
    params = { { name = "stepID", type = "number", default = nil }, { name = "criteriaIndex", type = "number", default = nil } },
    returns = { { name = "scenarioCriteriaInfo", type = "ScenarioCriteriaInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ScenarioInfo.GetDisplayInfo"] = {
    key = "C_ScenarioInfo.GetDisplayInfo",
    name = "GetDisplayInfo",
    category = "general",
    subcategory = "c_scenarioinfo",
    funcPath = "C_ScenarioInfo.GetDisplayInfo",
    params = {  },
    returns = { { name = "info", type = "ScenarioDisplayInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
}

APIDefs["C_ScenarioInfo.GetJailersTowerTypeString"] = {
    key = "C_ScenarioInfo.GetJailersTowerTypeString",
    name = "GetJailersTowerTypeString",
    category = "general",
    subcategory = "c_scenarioinfo",
    funcPath = "C_ScenarioInfo.GetJailersTowerTypeString",
    params = { { name = "runType", type = "JailersTowerType", default = nil } },
    returns = { { name = "typeString", type = "cstring", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ScenarioInfo.GetScenarioIconInfo"] = {
    key = "C_ScenarioInfo.GetScenarioIconInfo",
    name = "GetScenarioIconInfo",
    category = "general",
    subcategory = "c_scenarioinfo",
    funcPath = "C_ScenarioInfo.GetScenarioIconInfo",
    params = { { name = "uiMapID", type = "number", default = nil } },
    returns = { { name = "scenarioInfos", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ScenarioInfo.GetScenarioInfo"] = {
    key = "C_ScenarioInfo.GetScenarioInfo",
    name = "GetScenarioInfo",
    category = "general",
    subcategory = "c_scenarioinfo",
    funcPath = "C_ScenarioInfo.GetScenarioInfo",
    params = {  },
    returns = { { name = "scenarioInfo", type = "ScenarioInformation", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
}

APIDefs["C_ScenarioInfo.GetScenarioStepInfo"] = {
    key = "C_ScenarioInfo.GetScenarioStepInfo",
    name = "GetScenarioStepInfo",
    category = "general",
    subcategory = "c_scenarioinfo",
    funcPath = "C_ScenarioInfo.GetScenarioStepInfo",
    params = { { name = "scenarioStepID", type = "number", default = nil } },
    returns = { { name = "scenarioStepInfo", type = "ScenarioStepInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_ScenarioInfo.GetTieredEntranceActiveSpells"] = {
    key = "C_ScenarioInfo.GetTieredEntranceActiveSpells",
    name = "GetTieredEntranceActiveSpells",
    category = "general",
    subcategory = "c_scenarioinfo",
    funcPath = "C_ScenarioInfo.GetTieredEntranceActiveSpells",
    params = {  },
    returns = { { name = "spellIDs", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
}

APIDefs["C_ScenarioInfo.GetUnitCriteriaProgressValues"] = {
    key = "C_ScenarioInfo.GetUnitCriteriaProgressValues",
    name = "GetUnitCriteriaProgressValues",
    category = "combat_midnight",
    subcategory = "c_scenarioinfo",
    funcPath = "C_ScenarioInfo.GetUnitCriteriaProgressValues",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "actualValue", type = "number", canBeSecret = false }, { name = "percentValue", type = "number", canBeSecret = false }, { name = "percentValueString", type = "string", canBeSecret = false } },
    midnightImpact = "CONDITIONAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted, SecretWhenUnitIdentityRestricted",
}

APIDefs["C_ScenarioInfo.IsTieredEntranceScenario"] = {
    key = "C_ScenarioInfo.IsTieredEntranceScenario",
    name = "IsTieredEntranceScenario",
    category = "general",
    subcategory = "c_scenarioinfo",
    funcPath = "C_ScenarioInfo.IsTieredEntranceScenario",
    params = {  },
    returns = { { name = "isTieredEntrance", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
}
