-- Generated APIDefinitions for namespace: C_NameUtil
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_NameUtil.ReplaceSurnameSeparatorWithLinkSeparator"] = {
    key = "C_NameUtil.ReplaceSurnameSeparatorWithLinkSeparator",
    name = "ReplaceSurnameSeparatorWithLinkSeparator",
    category = "general",
    subcategory = "c_nameutil",
    funcPath = "C_NameUtil.ReplaceSurnameSeparatorWithLinkSeparator",
    params = { { name = "fullName", type = "cstring", default = nil } },
    returns = { { name = "result", type = "string", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
