-- Generated APIDefinitions for namespace: C_Trainer
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_Trainer.GetCategorizeTrainerUI"] = {
    key = "C_Trainer.GetCategorizeTrainerUI",
    name = "GetCategorizeTrainerUI",
    category = "general",
    subcategory = "c_trainer",
    funcPath = "C_Trainer.GetCategorizeTrainerUI",
    params = {  },
    returns = { { name = "value", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "forever" },
}

APIDefs["C_Trainer.GetTrainerType"] = {
    key = "C_Trainer.GetTrainerType",
    name = "GetTrainerType",
    category = "general",
    subcategory = "c_trainer",
    funcPath = "C_Trainer.GetTrainerType",
    params = {  },
    returns = { { name = "trainerType", type = "TrainerType", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "forever" },
}

APIDefs["C_Trainer.SetCategorizeTrainerUI"] = {
    key = "C_Trainer.SetCategorizeTrainerUI",
    name = "SetCategorizeTrainerUI",
    category = "general",
    subcategory = "c_trainer",
    funcPath = "C_Trainer.SetCategorizeTrainerUI",
    params = { { name = "value", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    games = { "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
