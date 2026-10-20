-- Generated APIDefinitions for namespace: C_ExternalEventURL
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_ExternalEventURL.CanShow"] = {
    key = "C_ExternalEventURL.CanShow",
    name = "CanShow",
    category = "general",
    subcategory = "c_externaleventurl",
    funcPath = "C_ExternalEventURL.CanShow",
    params = {  },
    returns = { { name = "canShow", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "forever" },
}

APIDefs["C_ExternalEventURL.HasURL"] = {
    key = "C_ExternalEventURL.HasURL",
    name = "HasURL",
    category = "general",
    subcategory = "c_externaleventurl",
    funcPath = "C_ExternalEventURL.HasURL",
    params = {  },
    returns = { { name = "hasURL", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
}

APIDefs["C_ExternalEventURL.IsNew"] = {
    key = "C_ExternalEventURL.IsNew",
    name = "IsNew",
    category = "general",
    subcategory = "c_externaleventurl",
    funcPath = "C_ExternalEventURL.IsNew",
    params = {  },
    returns = { { name = "isNew", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
}

APIDefs["C_ExternalEventURL.LaunchURL"] = {
    key = "C_ExternalEventURL.LaunchURL",
    name = "LaunchURL",
    category = "general",
    subcategory = "c_externaleventurl",
    funcPath = "C_ExternalEventURL.LaunchURL",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
}
