-- Generated APIDefinitions for namespace: C_Discord
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_Discord.Authorize"] = {
    key = "C_Discord.Authorize",
    name = "Authorize",
    category = "general",
    subcategory = "c_discord",
    funcPath = "C_Discord.Authorize",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
}

APIDefs["C_Discord.GetDiscordChannelName"] = {
    key = "C_Discord.GetDiscordChannelName",
    name = "GetDiscordChannelName",
    category = "general",
    subcategory = "c_discord",
    funcPath = "C_Discord.GetDiscordChannelName",
    params = { { name = "serverIndex", type = "luaIndex", default = nil }, { name = "channelIndex", type = "luaIndex", default = nil } },
    returns = { { name = "name", type = "string", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Discord.GetDiscordUserID"] = {
    key = "C_Discord.GetDiscordUserID",
    name = "GetDiscordUserID",
    category = "general",
    subcategory = "c_discord",
    funcPath = "C_Discord.GetDiscordUserID",
    params = {  },
    returns = { { name = "userID", type = "DiscordID", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
}

APIDefs["C_Discord.GetDiscordUserName"] = {
    key = "C_Discord.GetDiscordUserName",
    name = "GetDiscordUserName",
    category = "general",
    subcategory = "c_discord",
    funcPath = "C_Discord.GetDiscordUserName",
    params = { { name = "userID", type = "DiscordID", default = nil } },
    returns = { { name = "userName", type = "KStringDiscordUserName", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Discord.GetDisplayNameType"] = {
    key = "C_Discord.GetDisplayNameType",
    name = "GetDisplayNameType",
    category = "general",
    subcategory = "c_discord",
    funcPath = "C_Discord.GetDisplayNameType",
    params = {  },
    returns = { { name = "type", type = "DiscordDisplayNameType", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
}

APIDefs["C_Discord.GetGuildLinkStatus"] = {
    key = "C_Discord.GetGuildLinkStatus",
    name = "GetGuildLinkStatus",
    category = "general",
    subcategory = "c_discord",
    funcPath = "C_Discord.GetGuildLinkStatus",
    params = {  },
    returns = { { name = "isFullyLinked", type = "bool", canBeSecret = false }, { name = "linkedChannelName", type = "string", canBeSecret = false }, { name = "linkedServerName", type = "string", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
}

APIDefs["C_Discord.GetNumDiscordChannels"] = {
    key = "C_Discord.GetNumDiscordChannels",
    name = "GetNumDiscordChannels",
    category = "general",
    subcategory = "c_discord",
    funcPath = "C_Discord.GetNumDiscordChannels",
    params = { { name = "serverIndex", type = "luaIndex", default = nil } },
    returns = { { name = "count", type = "number", canBeSecret = false }, { name = "valid", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Discord.GetNumDiscordServers"] = {
    key = "C_Discord.GetNumDiscordServers",
    name = "GetNumDiscordServers",
    category = "general",
    subcategory = "c_discord",
    funcPath = "C_Discord.GetNumDiscordServers",
    params = {  },
    returns = { { name = "count", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
}

APIDefs["C_Discord.GetServerLinkableChannels"] = {
    key = "C_Discord.GetServerLinkableChannels",
    name = "GetServerLinkableChannels",
    category = "general",
    subcategory = "c_discord",
    funcPath = "C_Discord.GetServerLinkableChannels",
    params = { { name = "index", type = "luaIndex", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Discord.GetServerName"] = {
    key = "C_Discord.GetServerName",
    name = "GetServerName",
    category = "general",
    subcategory = "c_discord",
    funcPath = "C_Discord.GetServerName",
    params = { { name = "index", type = "luaIndex", default = nil } },
    returns = { { name = "name", type = "string", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Discord.GuildLink"] = {
    key = "C_Discord.GuildLink",
    name = "GuildLink",
    category = "general",
    subcategory = "c_discord",
    funcPath = "C_Discord.GuildLink",
    params = { { name = "serverIndex", type = "luaIndex", default = nil }, { name = "channelIndex", type = "luaIndex", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Discord.GuildUnlink"] = {
    key = "C_Discord.GuildUnlink",
    name = "GuildUnlink",
    category = "general",
    subcategory = "c_discord",
    funcPath = "C_Discord.GuildUnlink",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
}

APIDefs["C_Discord.IsEnabled"] = {
    key = "C_Discord.IsEnabled",
    name = "IsEnabled",
    category = "general",
    subcategory = "c_discord",
    funcPath = "C_Discord.IsEnabled",
    params = {  },
    returns = { { name = "enabled", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
}

APIDefs["C_Discord.IsGuildChannelLinked"] = {
    key = "C_Discord.IsGuildChannelLinked",
    name = "IsGuildChannelLinked",
    category = "general",
    subcategory = "c_discord",
    funcPath = "C_Discord.IsGuildChannelLinked",
    params = {  },
    returns = { { name = "isLinked", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
}

APIDefs["C_Discord.IsGuildSettingSet"] = {
    key = "C_Discord.IsGuildSettingSet",
    name = "IsGuildSettingSet",
    category = "general",
    subcategory = "c_discord",
    funcPath = "C_Discord.IsGuildSettingSet",
    params = { { name = "setting", type = "DiscordGuildSettings", default = nil } },
    returns = { { name = "isSet", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Discord.IsUserOAuthed"] = {
    key = "C_Discord.IsUserOAuthed",
    name = "IsUserOAuthed",
    category = "general",
    subcategory = "c_discord",
    funcPath = "C_Discord.IsUserOAuthed",
    params = {  },
    returns = { { name = "hasOAuth", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
}

APIDefs["C_Discord.IsVoiceEnabled"] = {
    key = "C_Discord.IsVoiceEnabled",
    name = "IsVoiceEnabled",
    category = "general",
    subcategory = "c_discord",
    funcPath = "C_Discord.IsVoiceEnabled",
    params = {  },
    returns = { { name = "enabled", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "forever" },
}

APIDefs["C_Discord.RefreshAuth"] = {
    key = "C_Discord.RefreshAuth",
    name = "RefreshAuth",
    category = "general",
    subcategory = "c_discord",
    funcPath = "C_Discord.RefreshAuth",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
}

APIDefs["C_Discord.SetGuildSetting"] = {
    key = "C_Discord.SetGuildSetting",
    name = "SetGuildSetting",
    category = "general",
    subcategory = "c_discord",
    funcPath = "C_Discord.SetGuildSetting",
    params = { { name = "setting", type = "DiscordGuildSettings", default = nil }, { name = "set", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Discord.UpdateDiscordServers"] = {
    key = "C_Discord.UpdateDiscordServers",
    name = "UpdateDiscordServers",
    category = "general",
    subcategory = "c_discord",
    funcPath = "C_Discord.UpdateDiscordServers",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
}

APIDefs["C_Discord.UpdateGuildLobby"] = {
    key = "C_Discord.UpdateGuildLobby",
    name = "UpdateGuildLobby",
    category = "general",
    subcategory = "c_discord",
    funcPath = "C_Discord.UpdateGuildLobby",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
}
