-- Generated APIDefinitions for namespace: C_GuildInfo
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_GuildInfo.AreGuildEventsEnabled"] = {
    key = "C_GuildInfo.AreGuildEventsEnabled",
    name = "AreGuildEventsEnabled",
    category = "social",
    subcategory = "c_guildinfo",
    funcPath = "C_GuildInfo.AreGuildEventsEnabled",
    params = {  },
    returns = { { name = "enabled", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
}

APIDefs["C_GuildInfo.CanEditOfficerNote"] = {
    key = "C_GuildInfo.CanEditOfficerNote",
    name = "CanEditOfficerNote",
    category = "social",
    subcategory = "c_guildinfo",
    funcPath = "C_GuildInfo.CanEditOfficerNote",
    params = {  },
    returns = { { name = "canEditOfficerNote", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
}

APIDefs["C_GuildInfo.CanSpeakInGuildChat"] = {
    key = "C_GuildInfo.CanSpeakInGuildChat",
    name = "CanSpeakInGuildChat",
    category = "social",
    subcategory = "c_guildinfo",
    funcPath = "C_GuildInfo.CanSpeakInGuildChat",
    params = {  },
    returns = { { name = "canSpeakInGuildChat", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
}

APIDefs["C_GuildInfo.CanViewOfficerNote"] = {
    key = "C_GuildInfo.CanViewOfficerNote",
    name = "CanViewOfficerNote",
    category = "social",
    subcategory = "c_guildinfo",
    funcPath = "C_GuildInfo.CanViewOfficerNote",
    params = {  },
    returns = { { name = "canViewOfficerNote", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
}

APIDefs["C_GuildInfo.Demote"] = {
    key = "C_GuildInfo.Demote",
    name = "Demote",
    category = "social",
    subcategory = "c_guildinfo",
    funcPath = "C_GuildInfo.Demote",
    params = { { name = "name", type = "cstring", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_GuildInfo.Disband"] = {
    key = "C_GuildInfo.Disband",
    name = "Disband",
    category = "social",
    subcategory = "c_guildinfo",
    funcPath = "C_GuildInfo.Disband",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
}

APIDefs["C_GuildInfo.GetGuildNewsInfo"] = {
    key = "C_GuildInfo.GetGuildNewsInfo",
    name = "GetGuildNewsInfo",
    category = "social",
    subcategory = "c_guildinfo",
    funcPath = "C_GuildInfo.GetGuildNewsInfo",
    params = { { name = "index", type = "luaIndex", default = nil } },
    returns = { { name = "newsInfo", type = "GuildNewsInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_GuildInfo.GetGuildRankOrder"] = {
    key = "C_GuildInfo.GetGuildRankOrder",
    name = "GetGuildRankOrder",
    category = "social",
    subcategory = "c_guildinfo",
    funcPath = "C_GuildInfo.GetGuildRankOrder",
    params = { { name = "guid", type = "WOWGUID", default = nil } },
    returns = { { name = "rankOrder", type = "luaIndex", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_GuildInfo.GetGuildTabardInfo"] = {
    key = "C_GuildInfo.GetGuildTabardInfo",
    name = "GetGuildTabardInfo",
    category = "social",
    subcategory = "c_guildinfo",
    funcPath = "C_GuildInfo.GetGuildTabardInfo",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "tabardInfo", type = "GuildTabardInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_GuildInfo.GetInfoText"] = {
    key = "C_GuildInfo.GetInfoText",
    name = "GetInfoText",
    category = "social",
    subcategory = "c_guildinfo",
    funcPath = "C_GuildInfo.GetInfoText",
    params = {  },
    returns = { { name = "infoText", type = "string", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
}

APIDefs["C_GuildInfo.GetMOTD"] = {
    key = "C_GuildInfo.GetMOTD",
    name = "GetMOTD",
    category = "social",
    subcategory = "c_guildinfo",
    funcPath = "C_GuildInfo.GetMOTD",
    params = {  },
    returns = { { name = "motd", type = "string", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
}

APIDefs["C_GuildInfo.GetPreferredPlaySettings"] = {
    key = "C_GuildInfo.GetPreferredPlaySettings",
    name = "GetPreferredPlaySettings",
    category = "social",
    subcategory = "c_guildinfo",
    funcPath = "C_GuildInfo.GetPreferredPlaySettings",
    params = {  },
    returns = { { name = "loaded", type = "bool", canBeSecret = false }, { name = "preferredLocaleID", type = "number", canBeSecret = false }, { name = "preferredDatacenterLocalityID", type = "number", canBeSecret = false }, { name = "lastPreferredLocaleChangeDate", type = "time_t", canBeSecret = false }, { name = "lastPreferredDatacenterLocalityChangeDate", type = "time_t", canBeSecret = false }, { name = "changeCooldownDays", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "forever" },
}

APIDefs["C_GuildInfo.GetPreferredPlaySettingsFeatures"] = {
    key = "C_GuildInfo.GetPreferredPlaySettingsFeatures",
    name = "GetPreferredPlaySettingsFeatures",
    category = "social",
    subcategory = "c_guildinfo",
    funcPath = "C_GuildInfo.GetPreferredPlaySettingsFeatures",
    params = {  },
    returns = { { name = "canChangeLocale", type = "bool", canBeSecret = false }, { name = "canChangeDatacenterLocality", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "forever" },
}

APIDefs["C_GuildInfo.GuildControlGetRankFlags"] = {
    key = "C_GuildInfo.GuildControlGetRankFlags",
    name = "GuildControlGetRankFlags",
    category = "social",
    subcategory = "c_guildinfo",
    funcPath = "C_GuildInfo.GuildControlGetRankFlags",
    params = { { name = "rankOrder", type = "luaIndex", default = nil } },
    returns = { { name = "permissions", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_GuildInfo.GuildRoster"] = {
    key = "C_GuildInfo.GuildRoster",
    name = "GuildRoster",
    category = "social",
    subcategory = "c_guildinfo",
    funcPath = "C_GuildInfo.GuildRoster",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
}

APIDefs["C_GuildInfo.Invite"] = {
    key = "C_GuildInfo.Invite",
    name = "Invite",
    category = "social",
    subcategory = "c_guildinfo",
    funcPath = "C_GuildInfo.Invite",
    params = { { name = "name", type = "cstring", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_GuildInfo.IsDiscordStreamSeparate"] = {
    key = "C_GuildInfo.IsDiscordStreamSeparate",
    name = "IsDiscordStreamSeparate",
    category = "social",
    subcategory = "c_guildinfo",
    funcPath = "C_GuildInfo.IsDiscordStreamSeparate",
    params = {  },
    returns = { { name = "separateStream", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
}

APIDefs["C_GuildInfo.IsEncounterGuildNewsEnabled"] = {
    key = "C_GuildInfo.IsEncounterGuildNewsEnabled",
    name = "IsEncounterGuildNewsEnabled",
    category = "social",
    subcategory = "c_guildinfo",
    funcPath = "C_GuildInfo.IsEncounterGuildNewsEnabled",
    params = {  },
    returns = { { name = "enabled", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
}

APIDefs["C_GuildInfo.IsGuildOfficer"] = {
    key = "C_GuildInfo.IsGuildOfficer",
    name = "IsGuildOfficer",
    category = "social",
    subcategory = "c_guildinfo",
    funcPath = "C_GuildInfo.IsGuildOfficer",
    params = {  },
    returns = { { name = "isOfficer", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
}

APIDefs["C_GuildInfo.IsGuildRankAssignmentAllowed"] = {
    key = "C_GuildInfo.IsGuildRankAssignmentAllowed",
    name = "IsGuildRankAssignmentAllowed",
    category = "social",
    subcategory = "c_guildinfo",
    funcPath = "C_GuildInfo.IsGuildRankAssignmentAllowed",
    params = { { name = "guid", type = "WOWGUID", default = nil }, { name = "rankOrder", type = "luaIndex", default = nil } },
    returns = { { name = "isGuildRankAssignmentAllowed", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_GuildInfo.IsGuildReputationEnabled"] = {
    key = "C_GuildInfo.IsGuildReputationEnabled",
    name = "IsGuildReputationEnabled",
    category = "social",
    subcategory = "c_guildinfo",
    funcPath = "C_GuildInfo.IsGuildReputationEnabled",
    params = {  },
    returns = { { name = "enabled", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
}

APIDefs["C_GuildInfo.Leave"] = {
    key = "C_GuildInfo.Leave",
    name = "Leave",
    category = "social",
    subcategory = "c_guildinfo",
    funcPath = "C_GuildInfo.Leave",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
}

APIDefs["C_GuildInfo.MemberExistsByName"] = {
    key = "C_GuildInfo.MemberExistsByName",
    name = "MemberExistsByName",
    category = "social",
    subcategory = "c_guildinfo",
    funcPath = "C_GuildInfo.MemberExistsByName",
    params = { { name = "name", type = "cstring", default = nil } },
    returns = { { name = "exists", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_GuildInfo.Promote"] = {
    key = "C_GuildInfo.Promote",
    name = "Promote",
    category = "social",
    subcategory = "c_guildinfo",
    funcPath = "C_GuildInfo.Promote",
    params = { { name = "name", type = "cstring", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_GuildInfo.QueryGuildMemberRecipes"] = {
    key = "C_GuildInfo.QueryGuildMemberRecipes",
    name = "QueryGuildMemberRecipes",
    category = "social",
    subcategory = "c_guildinfo",
    funcPath = "C_GuildInfo.QueryGuildMemberRecipes",
    params = { { name = "guildMemberGUID", type = "WOWGUID", default = nil }, { name = "skillLineID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_GuildInfo.QueryGuildMembersForRecipe"] = {
    key = "C_GuildInfo.QueryGuildMembersForRecipe",
    name = "QueryGuildMembersForRecipe",
    category = "social",
    subcategory = "c_guildinfo",
    funcPath = "C_GuildInfo.QueryGuildMembersForRecipe",
    params = { { name = "skillLineID", type = "number", default = nil }, { name = "recipeSpellID", type = "number", default = nil }, { name = "recipeLevel", type = "luaIndex", default = nil } },
    returns = { { name = "updatedRecipeSpellID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_GuildInfo.RemoveFromGuild"] = {
    key = "C_GuildInfo.RemoveFromGuild",
    name = "RemoveFromGuild",
    category = "social",
    subcategory = "c_guildinfo",
    funcPath = "C_GuildInfo.RemoveFromGuild",
    params = { { name = "guid", type = "WOWGUID", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_GuildInfo.RequestGuildRename"] = {
    key = "C_GuildInfo.RequestGuildRename",
    name = "RequestGuildRename",
    category = "social",
    subcategory = "c_guildinfo",
    funcPath = "C_GuildInfo.RequestGuildRename",
    params = { { name = "desiredName", type = "cstring", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_GuildInfo.RequestGuildRenameRefund"] = {
    key = "C_GuildInfo.RequestGuildRenameRefund",
    name = "RequestGuildRenameRefund",
    category = "social",
    subcategory = "c_guildinfo",
    funcPath = "C_GuildInfo.RequestGuildRenameRefund",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
}

APIDefs["C_GuildInfo.RequestPreferredPlaySettings"] = {
    key = "C_GuildInfo.RequestPreferredPlaySettings",
    name = "RequestPreferredPlaySettings",
    category = "social",
    subcategory = "c_guildinfo",
    funcPath = "C_GuildInfo.RequestPreferredPlaySettings",
    params = {  },
    returns = { { name = "startedSuccessfully", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "forever" },
}

APIDefs["C_GuildInfo.RequestRenameNameCheck"] = {
    key = "C_GuildInfo.RequestRenameNameCheck",
    name = "RequestRenameNameCheck",
    category = "social",
    subcategory = "c_guildinfo",
    funcPath = "C_GuildInfo.RequestRenameNameCheck",
    params = { { name = "desiredName", type = "cstring", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_GuildInfo.RequestRenameStatus"] = {
    key = "C_GuildInfo.RequestRenameStatus",
    name = "RequestRenameStatus",
    category = "social",
    subcategory = "c_guildinfo",
    funcPath = "C_GuildInfo.RequestRenameStatus",
    params = {  },
    returns = { { name = "ableToRequest", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
}

APIDefs["C_GuildInfo.SetGuildRankOrder"] = {
    key = "C_GuildInfo.SetGuildRankOrder",
    name = "SetGuildRankOrder",
    category = "social",
    subcategory = "c_guildinfo",
    funcPath = "C_GuildInfo.SetGuildRankOrder",
    params = { { name = "guid", type = "WOWGUID", default = nil }, { name = "rankOrder", type = "luaIndex", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_GuildInfo.SetInfoText"] = {
    key = "C_GuildInfo.SetInfoText",
    name = "SetInfoText",
    category = "social",
    subcategory = "c_guildinfo",
    funcPath = "C_GuildInfo.SetInfoText",
    params = { { name = "infoText", type = "cstring", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_GuildInfo.SetLeader"] = {
    key = "C_GuildInfo.SetLeader",
    name = "SetLeader",
    category = "social",
    subcategory = "c_guildinfo",
    funcPath = "C_GuildInfo.SetLeader",
    params = { { name = "name", type = "cstring", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_GuildInfo.SetMOTD"] = {
    key = "C_GuildInfo.SetMOTD",
    name = "SetMOTD",
    category = "social",
    subcategory = "c_guildinfo",
    funcPath = "C_GuildInfo.SetMOTD",
    params = { { name = "motd", type = "cstring", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_GuildInfo.SetNote"] = {
    key = "C_GuildInfo.SetNote",
    name = "SetNote",
    category = "social",
    subcategory = "c_guildinfo",
    funcPath = "C_GuildInfo.SetNote",
    params = { { name = "guid", type = "WOWGUID", default = nil }, { name = "note", type = "cstring", default = nil }, { name = "isPublic", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_GuildInfo.SetPreferredPlaySettings"] = {
    key = "C_GuildInfo.SetPreferredPlaySettings",
    name = "SetPreferredPlaySettings",
    category = "social",
    subcategory = "c_guildinfo",
    funcPath = "C_GuildInfo.SetPreferredPlaySettings",
    params = { { name = "preferredLocaleID", type = "number", default = 0 }, { name = "preferredDatacenterLocalityID", type = "number", default = 0 } },
    returns = { { name = "startedSuccessfully", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_GuildInfo.Uninvite"] = {
    key = "C_GuildInfo.Uninvite",
    name = "Uninvite",
    category = "social",
    subcategory = "c_guildinfo",
    funcPath = "C_GuildInfo.Uninvite",
    params = { { name = "name", type = "cstring", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
