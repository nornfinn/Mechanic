-- Generated APIDefinitions for namespace: C_ClientScene
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_ClientScene.IsSceneTypeActive"] = {
    key = "C_ClientScene.IsSceneTypeActive",
    name = "IsSceneTypeActive",
    category = "general",
    subcategory = "c_clientscene",
    funcPath = "C_ClientScene.IsSceneTypeActive",
    params = { { name = "desiredSceneType", type = "ClientSceneType", default = nil } },
    returns = { { name = "isPlaying", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
