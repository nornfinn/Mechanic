-- Generated APIDefinitions for namespace: C_SocialUI
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_SocialUI.IsSystemEnabled"] = {
    key = "C_SocialUI.IsSystemEnabled",
    name = "IsSystemEnabled",
    category = "general",
    subcategory = "c_socialui",
    funcPath = "C_SocialUI.IsSystemEnabled",
    params = {  },
    returns = { { name = "isSocialUISystemEnabled", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
}
