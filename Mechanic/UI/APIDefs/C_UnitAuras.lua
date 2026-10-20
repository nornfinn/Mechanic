-- Generated APIDefinitions for namespace: C_UnitAuras
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_UnitAuras.AddAuraSound"] = {
    key = "C_UnitAuras.AddAuraSound",
    name = "AddAuraSound",
    category = "unit",
    subcategory = "c_unitauras",
    funcPath = "C_UnitAuras.AddAuraSound",
    params = { { name = "trigger", type = "UnitAuraSoundTrigger", default = nil }, { name = "sound", type = "UnitAuraSoundInfo", default = nil } },
    returns = { { name = "auraSoundID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_UnitAuras.AddBlockedAura"] = {
    key = "C_UnitAuras.AddBlockedAura",
    name = "AddBlockedAura",
    category = "unit",
    subcategory = "c_unitauras",
    funcPath = "C_UnitAuras.AddBlockedAura",
    params = { { name = "unit", type = "UnitTokenRestrictedForAddOns", default = nil }, { name = "auraInstanceID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_UnitAuras.AddPrivateAuraAnchor"] = {
    key = "C_UnitAuras.AddPrivateAuraAnchor",
    name = "AddPrivateAuraAnchor",
    category = "unit",
    subcategory = "c_unitauras",
    funcPath = "C_UnitAuras.AddPrivateAuraAnchor",
    params = { { name = "args", type = "AddPrivateAuraAnchorArgs", default = nil } },
    returns = { { name = "anchorID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_UnitAuras.AuraIsBigDefensive"] = {
    key = "C_UnitAuras.AuraIsBigDefensive",
    name = "AuraIsBigDefensive",
    category = "unit",
    subcategory = "c_unitauras",
    funcPath = "C_UnitAuras.AuraIsBigDefensive",
    params = { { name = "spellID", type = "SpellIdentifier", default = nil } },
    returns = { { name = "isBigDefensive", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_UnitAuras.AuraIsPrivate"] = {
    key = "C_UnitAuras.AuraIsPrivate",
    name = "AuraIsPrivate",
    category = "unit",
    subcategory = "c_unitauras",
    funcPath = "C_UnitAuras.AuraIsPrivate",
    params = { { name = "spellID", type = "SpellIdentifier", default = nil } },
    returns = { { name = "isPrivate", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_UnitAuras.CancelAuraByInstanceID"] = {
    key = "C_UnitAuras.CancelAuraByInstanceID",
    name = "CancelAuraByInstanceID",
    category = "unit",
    subcategory = "c_unitauras",
    funcPath = "C_UnitAuras.CancelAuraByInstanceID",
    params = { { name = "unit", type = "UnitTokenRestrictedForAddOns", default = nil }, { name = "auraInstanceID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_UnitAuras.ClearBlockedAuras"] = {
    key = "C_UnitAuras.ClearBlockedAuras",
    name = "ClearBlockedAuras",
    category = "unit",
    subcategory = "c_unitauras",
    funcPath = "C_UnitAuras.ClearBlockedAuras",
    params = { { name = "unit", type = "UnitTokenRestrictedForAddOns", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_UnitAuras.DoesAuraHaveExpirationTime"] = {
    key = "C_UnitAuras.DoesAuraHaveExpirationTime",
    name = "DoesAuraHaveExpirationTime",
    category = "combat_midnight",
    subcategory = "c_unitauras",
    funcPath = "C_UnitAuras.DoesAuraHaveExpirationTime",
    params = { { name = "auraInstanceUnit", type = "UnitToken", default = "player" }, { name = "auraInstanceID", type = "number", default = nil } },
    returns = { { name = "hasExpirationTime", type = "bool", canBeSecret = false } },
    midnightImpact = "CONDITIONAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted, SecretWhenUnitAuraRestricted",
}

APIDefs["C_UnitAuras.GetAuraApplicationDisplayCount"] = {
    key = "C_UnitAuras.GetAuraApplicationDisplayCount",
    name = "GetAuraApplicationDisplayCount",
    category = "combat_midnight",
    subcategory = "c_unitauras",
    funcPath = "C_UnitAuras.GetAuraApplicationDisplayCount",
    params = { { name = "auraInstanceUnit", type = "UnitToken", default = "player" }, { name = "auraInstanceID", type = "number", default = nil }, { name = "minDisplayCount", type = "number", default = 2 }, { name = "maxDisplayCount", type = "number", default = nil } },
    returns = { { name = "count", type = "string", canBeSecret = false } },
    midnightImpact = "CONDITIONAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted, SecretWhenUnitAuraRestricted",
}

APIDefs["C_UnitAuras.GetAuraBaseDuration"] = {
    key = "C_UnitAuras.GetAuraBaseDuration",
    name = "GetAuraBaseDuration",
    category = "combat_midnight",
    subcategory = "c_unitauras",
    funcPath = "C_UnitAuras.GetAuraBaseDuration",
    params = { { name = "auraInstanceUnit", type = "UnitToken", default = "player" }, { name = "auraInstanceID", type = "number", default = nil }, { name = "spellID", type = "SpellIdentifier", default = nil } },
    returns = { { name = "newDuration", type = "number", canBeSecret = false } },
    midnightImpact = "CONDITIONAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted, SecretWhenUnitAuraRestricted",
}

APIDefs["C_UnitAuras.GetAuraCasterGUID"] = {
    key = "C_UnitAuras.GetAuraCasterGUID",
    name = "GetAuraCasterGUID",
    category = "combat_midnight",
    subcategory = "c_unitauras",
    funcPath = "C_UnitAuras.GetAuraCasterGUID",
    params = { { name = "auraInstanceUnit", type = "UnitToken", default = "player" }, { name = "auraInstanceID", type = "number", default = nil } },
    returns = { { name = "casterGUID", type = "WOWGUID", canBeSecret = false } },
    midnightImpact = "CONDITIONAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted, SecretWhenUnitAuraRestricted",
}

APIDefs["C_UnitAuras.GetAuraDataByAuraInstanceID"] = {
    key = "C_UnitAuras.GetAuraDataByAuraInstanceID",
    name = "GetAuraDataByAuraInstanceID",
    category = "combat_midnight",
    subcategory = "c_unitauras",
    funcPath = "C_UnitAuras.GetAuraDataByAuraInstanceID",
    params = { { name = "unit", type = "UnitTokenRestrictedForAddOns", default = nil }, { name = "auraInstanceID", type = "number", default = nil } },
    returns = { { name = "aura", type = "AuraData", canBeSecret = false } },
    midnightImpact = "CONDITIONAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted, SecretWhenUnitAuraRestricted",
}

APIDefs["C_UnitAuras.GetAuraDataByIndex"] = {
    key = "C_UnitAuras.GetAuraDataByIndex",
    name = "GetAuraDataByIndex",
    category = "combat_midnight",
    subcategory = "c_unitauras",
    funcPath = "C_UnitAuras.GetAuraDataByIndex",
    params = { { name = "unit", type = "UnitTokenRestrictedForAddOns", default = nil }, { name = "index", type = "luaIndex", default = nil }, { name = "filter", type = "AuraFilters", default = nil } },
    returns = { { name = "aura", type = "AuraData", canBeSecret = false } },
    midnightImpact = "CONDITIONAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted, SecretWhenUnitAuraRestricted",
}

APIDefs["C_UnitAuras.GetAuraDataBySlot"] = {
    key = "C_UnitAuras.GetAuraDataBySlot",
    name = "GetAuraDataBySlot",
    category = "combat_midnight",
    subcategory = "c_unitauras",
    funcPath = "C_UnitAuras.GetAuraDataBySlot",
    params = { { name = "unit", type = "UnitTokenRestrictedForAddOns", default = nil }, { name = "slot", type = "number", default = nil } },
    returns = { { name = "aura", type = "AuraData", canBeSecret = false } },
    midnightImpact = "CONDITIONAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted, SecretWhenUnitAuraRestricted",
}

APIDefs["C_UnitAuras.GetAuraDataBySpellName"] = {
    key = "C_UnitAuras.GetAuraDataBySpellName",
    name = "GetAuraDataBySpellName",
    category = "combat_midnight",
    subcategory = "c_unitauras",
    funcPath = "C_UnitAuras.GetAuraDataBySpellName",
    params = { { name = "unit", type = "UnitTokenRestrictedForAddOns", default = nil }, { name = "spellName", type = "cstring", default = nil }, { name = "filter", type = "AuraFilters", default = nil } },
    returns = { { name = "aura", type = "AuraData", canBeSecret = false } },
    midnightImpact = "CONDITIONAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted, SecretWhenUnitAuraRestricted",
}

APIDefs["C_UnitAuras.GetAuraDispelTypeColor"] = {
    key = "C_UnitAuras.GetAuraDispelTypeColor",
    name = "GetAuraDispelTypeColor",
    category = "combat_midnight",
    subcategory = "c_unitauras",
    funcPath = "C_UnitAuras.GetAuraDispelTypeColor",
    params = { { name = "auraInstanceUnit", type = "UnitToken", default = "player" }, { name = "auraInstanceID", type = "number", default = nil }, { name = "curve", type = "LuaColorCurveObject", default = nil } },
    returns = { { name = "dispelTypeColor", type = "colorRGBA", canBeSecret = false } },
    midnightImpact = "CONDITIONAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted, SecretWhenCurveSecret, SecretWhenUnitAuraRestricted",
}

APIDefs["C_UnitAuras.GetAuraDuration"] = {
    key = "C_UnitAuras.GetAuraDuration",
    name = "GetAuraDuration",
    category = "unit",
    subcategory = "c_unitauras",
    funcPath = "C_UnitAuras.GetAuraDuration",
    params = { { name = "auraInstanceUnit", type = "UnitToken", default = "player" }, { name = "auraInstanceID", type = "number", default = nil } },
    returns = { { name = "duration", type = "LuaDurationObject", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_UnitAuras.GetAuraSlots"] = {
    key = "C_UnitAuras.GetAuraSlots",
    name = "GetAuraSlots",
    category = "unit",
    subcategory = "c_unitauras",
    funcPath = "C_UnitAuras.GetAuraSlots",
    params = { { name = "unit", type = "UnitTokenRestrictedForAddOns", default = nil }, { name = "filter", type = "AuraFilters", default = nil }, { name = "maxSlots", type = "number", default = nil }, { name = "continuationToken", type = "number", default = nil } },
    returns = { { name = "outContinuationToken", type = "number", canBeSecret = false }, { name = "slots", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_UnitAuras.GetBuffDataByIndex"] = {
    key = "C_UnitAuras.GetBuffDataByIndex",
    name = "GetBuffDataByIndex",
    category = "combat_midnight",
    subcategory = "c_unitauras",
    funcPath = "C_UnitAuras.GetBuffDataByIndex",
    params = { { name = "unit", type = "UnitTokenRestrictedForAddOns", default = nil }, { name = "index", type = "luaIndex", default = nil }, { name = "filter", type = "AuraFilters", default = nil } },
    returns = { { name = "aura", type = "AuraData", canBeSecret = false } },
    midnightImpact = "CONDITIONAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted, SecretWhenUnitAuraRestricted",
}

APIDefs["C_UnitAuras.GetCooldownAuraBySpellID"] = {
    key = "C_UnitAuras.GetCooldownAuraBySpellID",
    name = "GetCooldownAuraBySpellID",
    category = "unit",
    subcategory = "c_unitauras",
    funcPath = "C_UnitAuras.GetCooldownAuraBySpellID",
    params = { { name = "spellID", type = "SpellIdentifier", default = nil } },
    returns = { { name = "cooldownSpellID", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted",
}

APIDefs["C_UnitAuras.GetDebuffDataByIndex"] = {
    key = "C_UnitAuras.GetDebuffDataByIndex",
    name = "GetDebuffDataByIndex",
    category = "combat_midnight",
    subcategory = "c_unitauras",
    funcPath = "C_UnitAuras.GetDebuffDataByIndex",
    params = { { name = "unit", type = "UnitTokenRestrictedForAddOns", default = nil }, { name = "index", type = "luaIndex", default = nil }, { name = "filter", type = "AuraFilters", default = nil } },
    returns = { { name = "aura", type = "AuraData", canBeSecret = false } },
    midnightImpact = "CONDITIONAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted, SecretWhenUnitAuraRestricted",
}

APIDefs["C_UnitAuras.GetGroupBuffVisualAlerts"] = {
    key = "C_UnitAuras.GetGroupBuffVisualAlerts",
    name = "GetGroupBuffVisualAlerts",
    category = "unit",
    subcategory = "c_unitauras",
    funcPath = "C_UnitAuras.GetGroupBuffVisualAlerts",
    params = {  },
    returns = { { name = "visualAlerts", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
}

APIDefs["C_UnitAuras.GetHiddenGroupBuffs"] = {
    key = "C_UnitAuras.GetHiddenGroupBuffs",
    name = "GetHiddenGroupBuffs",
    category = "unit",
    subcategory = "c_unitauras",
    funcPath = "C_UnitAuras.GetHiddenGroupBuffs",
    params = {  },
    returns = { { name = "spellIDs", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
}

APIDefs["C_UnitAuras.GetPlayerAuraBySpellID"] = {
    key = "C_UnitAuras.GetPlayerAuraBySpellID",
    name = "GetPlayerAuraBySpellID",
    category = "combat_midnight",
    subcategory = "c_unitauras",
    funcPath = "C_UnitAuras.GetPlayerAuraBySpellID",
    params = { { name = "spellID", type = "SpellIdentifier", default = nil } },
    returns = { { name = "aura", type = "AuraData", canBeSecret = false } },
    midnightImpact = "CONDITIONAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted, SecretWhenUnitAuraRestricted",
}

APIDefs["C_UnitAuras.GetRefreshCarryOverDuration"] = {
    key = "C_UnitAuras.GetRefreshCarryOverDuration",
    name = "GetRefreshCarryOverDuration",
    category = "combat_midnight",
    subcategory = "c_unitauras",
    funcPath = "C_UnitAuras.GetRefreshCarryOverDuration",
    params = { { name = "auraInstanceUnit", type = "UnitToken", default = "player" }, { name = "auraInstanceID", type = "number", default = nil }, { name = "spellID", type = "SpellIdentifier", default = nil } },
    returns = { { name = "newDuration", type = "number", canBeSecret = false } },
    midnightImpact = "CONDITIONAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted, SecretWhenUnitAuraRestricted",
}

APIDefs["C_UnitAuras.GetRefreshExtendedDuration"] = {
    key = "C_UnitAuras.GetRefreshExtendedDuration",
    name = "GetRefreshExtendedDuration",
    category = "combat_midnight",
    subcategory = "c_unitauras",
    funcPath = "C_UnitAuras.GetRefreshExtendedDuration",
    params = { { name = "auraInstanceUnit", type = "UnitToken", default = "player" }, { name = "auraInstanceID", type = "number", default = nil }, { name = "spellID", type = "SpellIdentifier", default = nil } },
    returns = { { name = "newDuration", type = "number", canBeSecret = false } },
    midnightImpact = "CONDITIONAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted, SecretWhenUnitAuraRestricted",
}

APIDefs["C_UnitAuras.GetUnitAuraBySpellID"] = {
    key = "C_UnitAuras.GetUnitAuraBySpellID",
    name = "GetUnitAuraBySpellID",
    category = "combat_midnight",
    subcategory = "c_unitauras",
    funcPath = "C_UnitAuras.GetUnitAuraBySpellID",
    params = { { name = "unit", type = "UnitTokenRestrictedForAddOns", default = nil }, { name = "spellID", type = "SpellIdentifier", default = nil } },
    returns = { { name = "aura", type = "AuraData", canBeSecret = false } },
    midnightImpact = "CONDITIONAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenTainted, SecretWhenUnitAuraRestricted",
}

APIDefs["C_UnitAuras.GetUnitAuraInstanceIDs"] = {
    key = "C_UnitAuras.GetUnitAuraInstanceIDs",
    name = "GetUnitAuraInstanceIDs",
    category = "unit",
    subcategory = "c_unitauras",
    funcPath = "C_UnitAuras.GetUnitAuraInstanceIDs",
    params = { { name = "unit", type = "UnitTokenRestrictedForAddOns", default = nil }, { name = "filter", type = "AuraFilters", default = nil }, { name = "maxCount", type = "number", default = nil }, { name = "sortRule", type = "UnitAuraSortRule", default = "Unsorted" }, { name = "sortDirection", type = "UnitAuraSortDirection", default = "Normal" } },
    returns = { { name = "auraInstanceIDs", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_UnitAuras.GetUnitAuras"] = {
    key = "C_UnitAuras.GetUnitAuras",
    name = "GetUnitAuras",
    category = "unit",
    subcategory = "c_unitauras",
    funcPath = "C_UnitAuras.GetUnitAuras",
    params = { { name = "unit", type = "UnitTokenRestrictedForAddOns", default = nil }, { name = "filter", type = "AuraFilters", default = nil }, { name = "maxCount", type = "number", default = nil }, { name = "sortRule", type = "UnitAuraSortRule", default = "Unsorted" }, { name = "sortDirection", type = "UnitAuraSortDirection", default = "Normal" } },
    returns = { { name = "auras", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_UnitAuras.IsAuraFilteredOutByInstanceID"] = {
    key = "C_UnitAuras.IsAuraFilteredOutByInstanceID",
    name = "IsAuraFilteredOutByInstanceID",
    category = "unit",
    subcategory = "c_unitauras",
    funcPath = "C_UnitAuras.IsAuraFilteredOutByInstanceID",
    params = { { name = "unit", type = "UnitTokenRestrictedForAddOns", default = nil }, { name = "auraInstanceID", type = "number", default = nil }, { name = "filter", type = "AuraFilters", default = nil } },
    returns = { { name = "isFiltered", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_UnitAuras.RemoveAuraSound"] = {
    key = "C_UnitAuras.RemoveAuraSound",
    name = "RemoveAuraSound",
    category = "unit",
    subcategory = "c_unitauras",
    funcPath = "C_UnitAuras.RemoveAuraSound",
    params = { { name = "auraSoundID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_UnitAuras.RemovePrivateAuraAnchor"] = {
    key = "C_UnitAuras.RemovePrivateAuraAnchor",
    name = "RemovePrivateAuraAnchor",
    category = "unit",
    subcategory = "c_unitauras",
    funcPath = "C_UnitAuras.RemovePrivateAuraAnchor",
    params = { { name = "anchorID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_UnitAuras.ResetAuraDataProvider"] = {
    key = "C_UnitAuras.ResetAuraDataProvider",
    name = "ResetAuraDataProvider",
    category = "unit",
    subcategory = "c_unitauras",
    funcPath = "C_UnitAuras.ResetAuraDataProvider",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
}

APIDefs["C_UnitAuras.SetGroupBuffVisualAlerts"] = {
    key = "C_UnitAuras.SetGroupBuffVisualAlerts",
    name = "SetGroupBuffVisualAlerts",
    category = "unit",
    subcategory = "c_unitauras",
    funcPath = "C_UnitAuras.SetGroupBuffVisualAlerts",
    params = { { name = "visualAlerts", type = "table", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_UnitAuras.SetHiddenGroupBuffs"] = {
    key = "C_UnitAuras.SetHiddenGroupBuffs",
    name = "SetHiddenGroupBuffs",
    category = "unit",
    subcategory = "c_unitauras",
    funcPath = "C_UnitAuras.SetHiddenGroupBuffs",
    params = { { name = "spellIDs", type = "table", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_UnitAuras.SetPrivateWarningTextAnchor"] = {
    key = "C_UnitAuras.SetPrivateWarningTextAnchor",
    name = "SetPrivateWarningTextAnchor",
    category = "unit",
    subcategory = "c_unitauras",
    funcPath = "C_UnitAuras.SetPrivateWarningTextAnchor",
    params = { { name = "parent", type = "SimpleFrame", default = nil }, { name = "anchor", type = "AnchorBinding", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_UnitAuras.SwitchAuraDataProvider"] = {
    key = "C_UnitAuras.SwitchAuraDataProvider",
    name = "SwitchAuraDataProvider",
    category = "unit",
    subcategory = "c_unitauras",
    funcPath = "C_UnitAuras.SwitchAuraDataProvider",
    params = {  },
    returns = {  },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
}

APIDefs["C_UnitAuras.WantsAlteredForm"] = {
    key = "C_UnitAuras.WantsAlteredForm",
    name = "WantsAlteredForm",
    category = "unit",
    subcategory = "c_unitauras",
    funcPath = "C_UnitAuras.WantsAlteredForm",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "wantsAlteredForm", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
