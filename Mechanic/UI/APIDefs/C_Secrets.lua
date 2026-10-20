-- Generated APIDefinitions for namespace: C_Secrets
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_Secrets.CanCompareUnitTokens"] = {
    key = "C_Secrets.CanCompareUnitTokens",
    name = "CanCompareUnitTokens",
    category = "general",
    subcategory = "c_secrets",
    funcPath = "C_Secrets.CanCompareUnitTokens",
    params = { { name = "unit1", type = "UnitToken", default = "player" }, { name = "unit2", type = "UnitToken", default = "player" } },
    returns = { { name = "isUnitComparisonPermitted", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Secrets.GetPowerTypeSecrecy"] = {
    key = "C_Secrets.GetPowerTypeSecrecy",
    name = "GetPowerTypeSecrecy",
    category = "general",
    subcategory = "c_secrets",
    funcPath = "C_Secrets.GetPowerTypeSecrecy",
    params = { { name = "powerType", type = "PowerType", default = nil } },
    returns = { { name = "secrecy", type = "SecrecyLevel", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Secrets.GetSpellAuraSecrecy"] = {
    key = "C_Secrets.GetSpellAuraSecrecy",
    name = "GetSpellAuraSecrecy",
    category = "general",
    subcategory = "c_secrets",
    funcPath = "C_Secrets.GetSpellAuraSecrecy",
    params = { { name = "spellIdentifier", type = "SpellIdentifier", default = nil } },
    returns = { { name = "secrecy", type = "SecrecyLevel", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Secrets.GetSpellCastSecrecy"] = {
    key = "C_Secrets.GetSpellCastSecrecy",
    name = "GetSpellCastSecrecy",
    category = "general",
    subcategory = "c_secrets",
    funcPath = "C_Secrets.GetSpellCastSecrecy",
    params = { { name = "spellIdentifier", type = "SpellIdentifier", default = nil } },
    returns = { { name = "secrecy", type = "SecrecyLevel", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Secrets.GetSpellCooldownSecrecy"] = {
    key = "C_Secrets.GetSpellCooldownSecrecy",
    name = "GetSpellCooldownSecrecy",
    category = "general",
    subcategory = "c_secrets",
    funcPath = "C_Secrets.GetSpellCooldownSecrecy",
    params = { { name = "spellIdentifier", type = "SpellIdentifier", default = nil } },
    returns = { { name = "secrecy", type = "SecrecyLevel", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Secrets.HasSecretRestrictions"] = {
    key = "C_Secrets.HasSecretRestrictions",
    name = "HasSecretRestrictions",
    category = "general",
    subcategory = "c_secrets",
    funcPath = "C_Secrets.HasSecretRestrictions",
    params = {  },
    returns = { { name = "hasSecretRestrictions", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
}

APIDefs["C_Secrets.ShouldActionCooldownBeSecret"] = {
    key = "C_Secrets.ShouldActionCooldownBeSecret",
    name = "ShouldActionCooldownBeSecret",
    category = "general",
    subcategory = "c_secrets",
    funcPath = "C_Secrets.ShouldActionCooldownBeSecret",
    params = { { name = "actionID", type = "luaIndex", default = nil } },
    returns = { { name = "isCooldownSecret", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Secrets.ShouldAurasBeSecret"] = {
    key = "C_Secrets.ShouldAurasBeSecret",
    name = "ShouldAurasBeSecret",
    category = "general",
    subcategory = "c_secrets",
    funcPath = "C_Secrets.ShouldAurasBeSecret",
    params = {  },
    returns = { { name = "hasSecretAuras", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
}

APIDefs["C_Secrets.ShouldCooldownsBeSecret"] = {
    key = "C_Secrets.ShouldCooldownsBeSecret",
    name = "ShouldCooldownsBeSecret",
    category = "general",
    subcategory = "c_secrets",
    funcPath = "C_Secrets.ShouldCooldownsBeSecret",
    params = {  },
    returns = { { name = "hasSecretCooldowns", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
}

APIDefs["C_Secrets.ShouldSpellAuraBeSecret"] = {
    key = "C_Secrets.ShouldSpellAuraBeSecret",
    name = "ShouldSpellAuraBeSecret",
    category = "general",
    subcategory = "c_secrets",
    funcPath = "C_Secrets.ShouldSpellAuraBeSecret",
    params = { { name = "spellIdentifier", type = "SpellIdentifier", default = nil } },
    returns = { { name = "isAuraSecret", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Secrets.ShouldSpellBookItemCooldownBeSecret"] = {
    key = "C_Secrets.ShouldSpellBookItemCooldownBeSecret",
    name = "ShouldSpellBookItemCooldownBeSecret",
    category = "general",
    subcategory = "c_secrets",
    funcPath = "C_Secrets.ShouldSpellBookItemCooldownBeSecret",
    params = { { name = "spellBookItemSlotIndex", type = "luaIndex", default = nil }, { name = "spellBookItemSpellBank", type = "SpellBookSpellBank", default = nil } },
    returns = { { name = "isCooldownSecret", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Secrets.ShouldSpellCooldownBeSecret"] = {
    key = "C_Secrets.ShouldSpellCooldownBeSecret",
    name = "ShouldSpellCooldownBeSecret",
    category = "general",
    subcategory = "c_secrets",
    funcPath = "C_Secrets.ShouldSpellCooldownBeSecret",
    params = { { name = "spellIdentifier", type = "SpellIdentifier", default = nil } },
    returns = { { name = "isCooldownSecret", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Secrets.ShouldTotemSlotBeSecret"] = {
    key = "C_Secrets.ShouldTotemSlotBeSecret",
    name = "ShouldTotemSlotBeSecret",
    category = "general",
    subcategory = "c_secrets",
    funcPath = "C_Secrets.ShouldTotemSlotBeSecret",
    params = { { name = "slot", type = "luaIndex", default = nil } },
    returns = { { name = "isTotemSecret", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Secrets.ShouldTotemSpellBeSecret"] = {
    key = "C_Secrets.ShouldTotemSpellBeSecret",
    name = "ShouldTotemSpellBeSecret",
    category = "general",
    subcategory = "c_secrets",
    funcPath = "C_Secrets.ShouldTotemSpellBeSecret",
    params = { { name = "spellID", type = "number", default = nil } },
    returns = { { name = "isTotemSecret", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Secrets.ShouldUnitAuraIndexBeSecret"] = {
    key = "C_Secrets.ShouldUnitAuraIndexBeSecret",
    name = "ShouldUnitAuraIndexBeSecret",
    category = "general",
    subcategory = "c_secrets",
    funcPath = "C_Secrets.ShouldUnitAuraIndexBeSecret",
    params = { { name = "unit", type = "UnitToken", default = "player" }, { name = "index", type = "luaIndex", default = nil }, { name = "filter", type = "AuraFilters", default = nil } },
    returns = { { name = "isAuraSecret", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Secrets.ShouldUnitAuraInstanceBeSecret"] = {
    key = "C_Secrets.ShouldUnitAuraInstanceBeSecret",
    name = "ShouldUnitAuraInstanceBeSecret",
    category = "general",
    subcategory = "c_secrets",
    funcPath = "C_Secrets.ShouldUnitAuraInstanceBeSecret",
    params = { { name = "unit", type = "UnitToken", default = "player" }, { name = "auraInstanceID", type = "number", default = nil } },
    returns = { { name = "isAuraSecret", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Secrets.ShouldUnitAuraSlotBeSecret"] = {
    key = "C_Secrets.ShouldUnitAuraSlotBeSecret",
    name = "ShouldUnitAuraSlotBeSecret",
    category = "general",
    subcategory = "c_secrets",
    funcPath = "C_Secrets.ShouldUnitAuraSlotBeSecret",
    params = { { name = "unit", type = "UnitToken", default = "player" }, { name = "slot", type = "number", default = nil } },
    returns = { { name = "isAuraSecret", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Secrets.ShouldUnitComparisonBeSecret"] = {
    key = "C_Secrets.ShouldUnitComparisonBeSecret",
    name = "ShouldUnitComparisonBeSecret",
    category = "general",
    subcategory = "c_secrets",
    funcPath = "C_Secrets.ShouldUnitComparisonBeSecret",
    params = { { name = "unit1", type = "UnitToken", default = "player" }, { name = "unit2", type = "UnitToken", default = "player" } },
    returns = { { name = "isUnitComparisonSecret", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Secrets.ShouldUnitHealthMaxBeSecret"] = {
    key = "C_Secrets.ShouldUnitHealthMaxBeSecret",
    name = "ShouldUnitHealthMaxBeSecret",
    category = "general",
    subcategory = "c_secrets",
    funcPath = "C_Secrets.ShouldUnitHealthMaxBeSecret",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "isUnitHealthMaxSecret", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Secrets.ShouldUnitIdentityBeSecret"] = {
    key = "C_Secrets.ShouldUnitIdentityBeSecret",
    name = "ShouldUnitIdentityBeSecret",
    category = "general",
    subcategory = "c_secrets",
    funcPath = "C_Secrets.ShouldUnitIdentityBeSecret",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "isUnitIdentitySecret", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Secrets.ShouldUnitPowerBeSecret"] = {
    key = "C_Secrets.ShouldUnitPowerBeSecret",
    name = "ShouldUnitPowerBeSecret",
    category = "general",
    subcategory = "c_secrets",
    funcPath = "C_Secrets.ShouldUnitPowerBeSecret",
    params = { { name = "unit", type = "UnitToken", default = "player" }, { name = "powerType", type = "PowerType", default = nil } },
    returns = { { name = "isUnitPowerSecret", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Secrets.ShouldUnitPowerMaxBeSecret"] = {
    key = "C_Secrets.ShouldUnitPowerMaxBeSecret",
    name = "ShouldUnitPowerMaxBeSecret",
    category = "general",
    subcategory = "c_secrets",
    funcPath = "C_Secrets.ShouldUnitPowerMaxBeSecret",
    params = { { name = "unit", type = "UnitToken", default = "player" }, { name = "powerType", type = "PowerType", default = nil } },
    returns = { { name = "isUnitPowerMaxSecret", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Secrets.ShouldUnitSpellCastBeSecret"] = {
    key = "C_Secrets.ShouldUnitSpellCastBeSecret",
    name = "ShouldUnitSpellCastBeSecret",
    category = "general",
    subcategory = "c_secrets",
    funcPath = "C_Secrets.ShouldUnitSpellCastBeSecret",
    params = { { name = "unit", type = "UnitToken", default = "player" }, { name = "spellIdentifier", type = "SpellIdentifier", default = nil } },
    returns = { { name = "isSpellCastSecret", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Secrets.ShouldUnitSpellCastingBeSecret"] = {
    key = "C_Secrets.ShouldUnitSpellCastingBeSecret",
    name = "ShouldUnitSpellCastingBeSecret",
    category = "general",
    subcategory = "c_secrets",
    funcPath = "C_Secrets.ShouldUnitSpellCastingBeSecret",
    params = { { name = "unit", type = "UnitToken", default = "player" } },
    returns = { { name = "isSpellCastingSecret", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Secrets.ShouldUnitStatsBeSecret"] = {
    key = "C_Secrets.ShouldUnitStatsBeSecret",
    name = "ShouldUnitStatsBeSecret",
    category = "general",
    subcategory = "c_secrets",
    funcPath = "C_Secrets.ShouldUnitStatsBeSecret",
    params = {  },
    returns = { { name = "hasSecretStats", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
}

APIDefs["C_Secrets.ShouldUnitThreatStateBeSecret"] = {
    key = "C_Secrets.ShouldUnitThreatStateBeSecret",
    name = "ShouldUnitThreatStateBeSecret",
    category = "general",
    subcategory = "c_secrets",
    funcPath = "C_Secrets.ShouldUnitThreatStateBeSecret",
    params = { { name = "unit", type = "UnitToken", default = "player" }, { name = "mobUnit", type = "UnitToken", default = "player" } },
    returns = { { name = "isUnitThreatSecret", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_Secrets.ShouldUnitThreatValuesBeSecret"] = {
    key = "C_Secrets.ShouldUnitThreatValuesBeSecret",
    name = "ShouldUnitThreatValuesBeSecret",
    category = "general",
    subcategory = "c_secrets",
    funcPath = "C_Secrets.ShouldUnitThreatValuesBeSecret",
    params = { { name = "unit", type = "UnitToken", default = "player" }, { name = "mobUnit", type = "UnitToken", default = "player" } },
    returns = { { name = "isUnitThreatSecret", type = "bool", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
