-- Generated APIDefinitions for namespace: C_BattleNet
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_BattleNet.AreFriendTagsEnabled"] = {
    key = "C_BattleNet.AreFriendTagsEnabled",
    name = "AreFriendTagsEnabled",
    category = "social",
    subcategory = "c_battlenet",
    funcPath = "C_BattleNet.AreFriendTagsEnabled",
    params = {  },
    returns = { { name = "areFriendTagsEnabled", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
}

APIDefs["C_BattleNet.AreHighResTexturesInstalled"] = {
    key = "C_BattleNet.AreHighResTexturesInstalled",
    name = "AreHighResTexturesInstalled",
    category = "social",
    subcategory = "c_battlenet",
    funcPath = "C_BattleNet.AreHighResTexturesInstalled",
    params = {  },
    returns = { { name = "installed", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "forever" },
}

APIDefs["C_BattleNet.AreRealIDFriendsEnabled"] = {
    key = "C_BattleNet.AreRealIDFriendsEnabled",
    name = "AreRealIDFriendsEnabled",
    category = "social",
    subcategory = "c_battlenet",
    funcPath = "C_BattleNet.AreRealIDFriendsEnabled",
    params = {  },
    returns = { { name = "areRealIDFriendsEnabled", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "forever" },
}

APIDefs["C_BattleNet.AreTitleFriendCustomNamesEnabled"] = {
    key = "C_BattleNet.AreTitleFriendCustomNamesEnabled",
    name = "AreTitleFriendCustomNamesEnabled",
    category = "social",
    subcategory = "c_battlenet",
    funcPath = "C_BattleNet.AreTitleFriendCustomNamesEnabled",
    params = {  },
    returns = { { name = "areTitleFriendCustomNamesEnabled", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
}

APIDefs["C_BattleNet.AreTitleFriendsEnabled"] = {
    key = "C_BattleNet.AreTitleFriendsEnabled",
    name = "AreTitleFriendsEnabled",
    category = "social",
    subcategory = "c_battlenet",
    funcPath = "C_BattleNet.AreTitleFriendsEnabled",
    params = {  },
    returns = { { name = "areTitleFriendsEnabled", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
}

APIDefs["C_BattleNet.BNCheckBattleTagInviteToRecentAlly"] = {
    key = "C_BattleNet.BNCheckBattleTagInviteToRecentAlly",
    name = "BNCheckBattleTagInviteToRecentAlly",
    category = "social",
    subcategory = "c_battlenet",
    funcPath = "C_BattleNet.BNCheckBattleTagInviteToRecentAlly",
    params = { { name = "recentAllyGUID", type = "WOWGUID", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_BattleNet.BNCheckTitleFriendInviteToUnit"] = {
    key = "C_BattleNet.BNCheckTitleFriendInviteToUnit",
    name = "BNCheckTitleFriendInviteToUnit",
    category = "social",
    subcategory = "c_battlenet",
    funcPath = "C_BattleNet.BNCheckTitleFriendInviteToUnit",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = {  },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_BattleNet.CanToggleHighResTexturesWithoutClientReload"] = {
    key = "C_BattleNet.CanToggleHighResTexturesWithoutClientReload",
    name = "CanToggleHighResTexturesWithoutClientReload",
    category = "social",
    subcategory = "c_battlenet",
    funcPath = "C_BattleNet.CanToggleHighResTexturesWithoutClientReload",
    params = {  },
    returns = { { name = "canToggle", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
}

APIDefs["C_BattleNet.GetAccountInfoByGUID"] = {
    key = "C_BattleNet.GetAccountInfoByGUID",
    name = "GetAccountInfoByGUID",
    category = "social",
    subcategory = "c_battlenet",
    funcPath = "C_BattleNet.GetAccountInfoByGUID",
    params = { { name = "guid", type = "WOWGUID", default = nil } },
    returns = { { name = "accountInfo", type = "BNetAccountInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_BattleNet.GetAccountInfoByID"] = {
    key = "C_BattleNet.GetAccountInfoByID",
    name = "GetAccountInfoByID",
    category = "social",
    subcategory = "c_battlenet",
    funcPath = "C_BattleNet.GetAccountInfoByID",
    params = { { name = "id", type = "number", default = nil }, { name = "wowAccountGUID", type = "WOWGUID", default = nil } },
    returns = { { name = "accountInfo", type = "BNetAccountInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_BattleNet.GetCustomTitleFriendName"] = {
    key = "C_BattleNet.GetCustomTitleFriendName",
    name = "GetCustomTitleFriendName",
    category = "social",
    subcategory = "c_battlenet",
    funcPath = "C_BattleNet.GetCustomTitleFriendName",
    params = { { name = "id", type = "number", default = nil } },
    returns = { { name = "customName", type = "string", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_BattleNet.GetFriendAccountInfo"] = {
    key = "C_BattleNet.GetFriendAccountInfo",
    name = "GetFriendAccountInfo",
    category = "social",
    subcategory = "c_battlenet",
    funcPath = "C_BattleNet.GetFriendAccountInfo",
    params = { { name = "friendIndex", type = "luaIndex", default = nil }, { name = "wowAccountGUID", type = "WOWGUID", default = nil } },
    returns = { { name = "accountInfo", type = "BNetAccountInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_BattleNet.GetFriendGameAccountInfo"] = {
    key = "C_BattleNet.GetFriendGameAccountInfo",
    name = "GetFriendGameAccountInfo",
    category = "social",
    subcategory = "c_battlenet",
    funcPath = "C_BattleNet.GetFriendGameAccountInfo",
    params = { { name = "friendIndex", type = "luaIndex", default = nil }, { name = "accountIndex", type = "luaIndex", default = nil } },
    returns = { { name = "gameAccountInfo", type = "BNetGameAccountInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_BattleNet.GetFriendInviteInfo"] = {
    key = "C_BattleNet.GetFriendInviteInfo",
    name = "GetFriendInviteInfo",
    category = "social",
    subcategory = "c_battlenet",
    funcPath = "C_BattleNet.GetFriendInviteInfo",
    params = { { name = "inviteIndex", type = "luaIndex", default = nil } },
    returns = { { name = "inviteInfo", type = "BNetFriendInviteInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_BattleNet.GetFriendLevelFromInviteText"] = {
    key = "C_BattleNet.GetFriendLevelFromInviteText",
    name = "GetFriendLevelFromInviteText",
    category = "social",
    subcategory = "c_battlenet",
    funcPath = "C_BattleNet.GetFriendLevelFromInviteText",
    params = { { name = "inviteText", type = "cstring", default = nil } },
    returns = { { name = "friendLevel", type = "BattleNetFriendLevel", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_BattleNet.GetFriendNumGameAccounts"] = {
    key = "C_BattleNet.GetFriendNumGameAccounts",
    name = "GetFriendNumGameAccounts",
    category = "social",
    subcategory = "c_battlenet",
    funcPath = "C_BattleNet.GetFriendNumGameAccounts",
    params = { { name = "friendIndex", type = "luaIndex", default = nil } },
    returns = { { name = "numGameAccounts", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_BattleNet.GetGameAccountInfoByGUID"] = {
    key = "C_BattleNet.GetGameAccountInfoByGUID",
    name = "GetGameAccountInfoByGUID",
    category = "social",
    subcategory = "c_battlenet",
    funcPath = "C_BattleNet.GetGameAccountInfoByGUID",
    params = { { name = "guid", type = "WOWGUID", default = nil } },
    returns = { { name = "gameAccountInfo", type = "BNetGameAccountInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_BattleNet.GetGameAccountInfoByID"] = {
    key = "C_BattleNet.GetGameAccountInfoByID",
    name = "GetGameAccountInfoByID",
    category = "social",
    subcategory = "c_battlenet",
    funcPath = "C_BattleNet.GetGameAccountInfoByID",
    params = { { name = "id", type = "number", default = nil } },
    returns = { { name = "gameAccountInfo", type = "BNetGameAccountInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_BattleNet.InstallHighResTextures"] = {
    key = "C_BattleNet.InstallHighResTextures",
    name = "InstallHighResTextures",
    category = "social",
    subcategory = "c_battlenet",
    funcPath = "C_BattleNet.InstallHighResTextures",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
}

APIDefs["C_BattleNet.InviteFriend"] = {
    key = "C_BattleNet.InviteFriend",
    name = "InviteFriend",
    category = "social",
    subcategory = "c_battlenet",
    funcPath = "C_BattleNet.InviteFriend",
    params = { { name = "gameAccountID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_BattleNet.IsBattleNetFriendsListEnabled"] = {
    key = "C_BattleNet.IsBattleNetFriendsListEnabled",
    name = "IsBattleNetFriendsListEnabled",
    category = "social",
    subcategory = "c_battlenet",
    funcPath = "C_BattleNet.IsBattleNetFriendsListEnabled",
    params = {  },
    returns = { { name = "isBattleNetFriendsListEnabled", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
}

APIDefs["C_BattleNet.IsBattleNetFriendsListSupported"] = {
    key = "C_BattleNet.IsBattleNetFriendsListSupported",
    name = "IsBattleNetFriendsListSupported",
    category = "social",
    subcategory = "c_battlenet",
    funcPath = "C_BattleNet.IsBattleNetFriendsListSupported",
    params = {  },
    returns = { { name = "isBattleNetFriendsListSupported", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
}

APIDefs["C_BattleNet.IsFriendTagSupportedForCurrentGameType"] = {
    key = "C_BattleNet.IsFriendTagSupportedForCurrentGameType",
    name = "IsFriendTagSupportedForCurrentGameType",
    category = "social",
    subcategory = "c_battlenet",
    funcPath = "C_BattleNet.IsFriendTagSupportedForCurrentGameType",
    params = { { name = "friendTag", type = "BattleNetFriendTag", default = nil } },
    returns = { { name = "isFriendTagSupportedForCurrentGameType", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_BattleNet.SearchFriends"] = {
    key = "C_BattleNet.SearchFriends",
    name = "SearchFriends",
    category = "social",
    subcategory = "c_battlenet",
    funcPath = "C_BattleNet.SearchFriends",
    params = { { name = "searchInfo", type = "AuroraFriendsSearchInfo", default = nil } },
    returns = { { name = "friendsData", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_BattleNet.SendGameData"] = {
    key = "C_BattleNet.SendGameData",
    name = "SendGameData",
    category = "social",
    subcategory = "c_battlenet",
    funcPath = "C_BattleNet.SendGameData",
    params = { { name = "gameAccountID", type = "number", default = nil }, { name = "prefix", type = "stringView", default = nil }, { name = "data", type = "stringView", default = nil } },
    returns = { { name = "result", type = "SendAddonMessageResult", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_BattleNet.SendTitleFriendInviteByName"] = {
    key = "C_BattleNet.SendTitleFriendInviteByName",
    name = "SendTitleFriendInviteByName",
    category = "social",
    subcategory = "c_battlenet",
    funcPath = "C_BattleNet.SendTitleFriendInviteByName",
    params = { { name = "name", type = "cstring", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_BattleNet.SendVerifiedBattleNetFriendInvite"] = {
    key = "C_BattleNet.SendVerifiedBattleNetFriendInvite",
    name = "SendVerifiedBattleNetFriendInvite",
    category = "social",
    subcategory = "c_battlenet",
    funcPath = "C_BattleNet.SendVerifiedBattleNetFriendInvite",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
}

APIDefs["C_BattleNet.SendWhisper"] = {
    key = "C_BattleNet.SendWhisper",
    name = "SendWhisper",
    category = "social",
    subcategory = "c_battlenet",
    funcPath = "C_BattleNet.SendWhisper",
    params = { { name = "bnetAccountID", type = "number", default = nil }, { name = "text", type = "stringView", default = nil } },
    returns = { { name = "success", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_BattleNet.SetAFK"] = {
    key = "C_BattleNet.SetAFK",
    name = "SetAFK",
    category = "social",
    subcategory = "c_battlenet",
    funcPath = "C_BattleNet.SetAFK",
    params = { { name = "isAFK", type = "bool", default = true } },
    returns = {  },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_BattleNet.SetAppearOffline"] = {
    key = "C_BattleNet.SetAppearOffline",
    name = "SetAppearOffline",
    category = "social",
    subcategory = "c_battlenet",
    funcPath = "C_BattleNet.SetAppearOffline",
    params = { { name = "isAppearOffline", type = "bool", default = true } },
    returns = {  },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_BattleNet.SetBlocked"] = {
    key = "C_BattleNet.SetBlocked",
    name = "SetBlocked",
    category = "social",
    subcategory = "c_battlenet",
    funcPath = "C_BattleNet.SetBlocked",
    params = { { name = "bnetAccountID", type = "number", default = nil }, { name = "block", type = "bool", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    games = { "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_BattleNet.SetCustomMessage"] = {
    key = "C_BattleNet.SetCustomMessage",
    name = "SetCustomMessage",
    category = "social",
    subcategory = "c_battlenet",
    funcPath = "C_BattleNet.SetCustomMessage",
    params = { { name = "text", type = "cstring", default = nil } },
    returns = { { name = "success", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_BattleNet.SetCustomTitleFriendName"] = {
    key = "C_BattleNet.SetCustomTitleFriendName",
    name = "SetCustomTitleFriendName",
    category = "social",
    subcategory = "c_battlenet",
    funcPath = "C_BattleNet.SetCustomTitleFriendName",
    params = { { name = "id", type = "number", default = nil }, { name = "customName", type = "cstring", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_BattleNet.SetDND"] = {
    key = "C_BattleNet.SetDND",
    name = "SetDND",
    category = "social",
    subcategory = "c_battlenet",
    funcPath = "C_BattleNet.SetDND",
    params = { { name = "isDND", type = "bool", default = true } },
    returns = {  },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_BattleNet.SetFriendTags"] = {
    key = "C_BattleNet.SetFriendTags",
    name = "SetFriendTags",
    category = "social",
    subcategory = "c_battlenet",
    funcPath = "C_BattleNet.SetFriendTags",
    params = { { name = "id", type = "number", default = nil }, { name = "friendTags", type = "table", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
