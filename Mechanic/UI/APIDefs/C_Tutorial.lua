-- Generated APIDefinitions for namespace: C_Tutorial
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_Tutorial.AbandonTutorialArea"] = {
    key = "C_Tutorial.AbandonTutorialArea",
    name = "AbandonTutorialArea",
    category = "general",
    subcategory = "c_tutorial",
    funcPath = "C_Tutorial.AbandonTutorialArea",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
}

APIDefs["C_Tutorial.GetCombatEventInfo"] = {
    key = "C_Tutorial.GetCombatEventInfo",
    name = "GetCombatEventInfo",
    category = "general",
    subcategory = "c_tutorial",
    funcPath = "C_Tutorial.GetCombatEventInfo",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
}

APIDefs["C_Tutorial.ReturnToTutorialArea"] = {
    key = "C_Tutorial.ReturnToTutorialArea",
    name = "ReturnToTutorialArea",
    category = "general",
    subcategory = "c_tutorial",
    funcPath = "C_Tutorial.ReturnToTutorialArea",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
}

APIDefs["C_Tutorial.SendTutorialStartButtonTelem"] = {
    key = "C_Tutorial.SendTutorialStartButtonTelem",
    name = "SendTutorialStartButtonTelem",
    category = "general",
    subcategory = "c_tutorial",
    funcPath = "C_Tutorial.SendTutorialStartButtonTelem",
    params = { { name = "skipTutorial", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    games = { "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
