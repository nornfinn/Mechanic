-- Generated APIDefinitions for namespace: C_AutoLoot
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_AutoLoot.SetUseAutoLootToggle"] = {
    key = "C_AutoLoot.SetUseAutoLootToggle",
    name = "SetUseAutoLootToggle",
    category = "item",
    subcategory = "c_autoloot",
    funcPath = "C_AutoLoot.SetUseAutoLootToggle",
    params = { { name = "useAutoLootToggle", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    games = { "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
