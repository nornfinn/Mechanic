-- Generated APIDefinitions for namespace: C_Ping
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_Ping.GetCooldownInfo"] = {
    key = "C_Ping.GetCooldownInfo",
    name = "GetCooldownInfo",
    category = "general",
    subcategory = "c_ping",
    funcPath = "C_Ping.GetCooldownInfo",
    params = {  },
    returns = { { name = "cooldownInfo", type = "PingCooldownInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
}

APIDefs["C_Ping.GetDefaultPingOptions"] = {
    key = "C_Ping.GetDefaultPingOptions",
    name = "GetDefaultPingOptions",
    category = "general",
    subcategory = "c_ping",
    funcPath = "C_Ping.GetDefaultPingOptions",
    params = {  },
    returns = { { name = "pingTypes", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
}

APIDefs["C_Ping.GetTextureKitForType"] = {
    key = "C_Ping.GetTextureKitForType",
    name = "GetTextureKitForType",
    category = "general",
    subcategory = "c_ping",
    funcPath = "C_Ping.GetTextureKitForType",
    params = { { name = "type", type = "PingSubjectType", default = nil } },
    returns = { { name = "uiTextureKitID", type = "textureKit", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Ping.IsPingSystemEnabled"] = {
    key = "C_Ping.IsPingSystemEnabled",
    name = "IsPingSystemEnabled",
    category = "general",
    subcategory = "c_ping",
    funcPath = "C_Ping.IsPingSystemEnabled",
    params = {  },
    returns = { { name = "isEnabled", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
}

APIDefs["C_Ping.SendMacroPing"] = {
    key = "C_Ping.SendMacroPing",
    name = "SendMacroPing",
    category = "general",
    subcategory = "c_ping",
    funcPath = "C_Ping.SendMacroPing",
    params = { { name = "macroInfo", type = "PingMacroInfo", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Ping.TogglePingListener"] = {
    key = "C_Ping.TogglePingListener",
    name = "TogglePingListener",
    category = "general",
    subcategory = "c_ping",
    funcPath = "C_Ping.TogglePingListener",
    params = { { name = "down", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
