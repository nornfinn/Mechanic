-- Generated APIDefinitions for namespace: C_SkillInfo
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_SkillInfo.AbandonSkill"] = {
    key = "C_SkillInfo.AbandonSkill",
    name = "AbandonSkill",
    category = "general",
    subcategory = "c_skillinfo",
    funcPath = "C_SkillInfo.AbandonSkill",
    params = { { name = "skillLineID", type = "number", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    games = { "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_SkillInfo.CollapseSkillHeader"] = {
    key = "C_SkillInfo.CollapseSkillHeader",
    name = "CollapseSkillHeader",
    category = "general",
    subcategory = "c_skillinfo",
    funcPath = "C_SkillInfo.CollapseSkillHeader",
    params = { { name = "index", type = "luaIndex", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    games = { "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_SkillInfo.ExpandSkillHeader"] = {
    key = "C_SkillInfo.ExpandSkillHeader",
    name = "ExpandSkillHeader",
    category = "general",
    subcategory = "c_skillinfo",
    funcPath = "C_SkillInfo.ExpandSkillHeader",
    params = { { name = "index", type = "luaIndex", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    games = { "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_SkillInfo.GetNumSkillLines"] = {
    key = "C_SkillInfo.GetNumSkillLines",
    name = "GetNumSkillLines",
    category = "general",
    subcategory = "c_skillinfo",
    funcPath = "C_SkillInfo.GetNumSkillLines",
    params = {  },
    returns = { { name = "numSkillLines", type = "number", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "forever" },
}

APIDefs["C_SkillInfo.GetSelectedSkill"] = {
    key = "C_SkillInfo.GetSelectedSkill",
    name = "GetSelectedSkill",
    category = "general",
    subcategory = "c_skillinfo",
    funcPath = "C_SkillInfo.GetSelectedSkill",
    params = {  },
    returns = { { name = "index", type = "luaIndex", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "forever" },
}

APIDefs["C_SkillInfo.GetSkillLineInfo"] = {
    key = "C_SkillInfo.GetSkillLineInfo",
    name = "GetSkillLineInfo",
    category = "general",
    subcategory = "c_skillinfo",
    funcPath = "C_SkillInfo.GetSkillLineInfo",
    params = { { name = "index", type = "luaIndex", default = nil } },
    returns = { { name = "skillLineAttributes", type = "SkillLineAttributes", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_SkillInfo.GetSkillLineInfoByID"] = {
    key = "C_SkillInfo.GetSkillLineInfoByID",
    name = "GetSkillLineInfoByID",
    category = "general",
    subcategory = "c_skillinfo",
    funcPath = "C_SkillInfo.GetSkillLineInfoByID",
    params = { { name = "ID", type = "number", default = nil } },
    returns = { { name = "skillLineAttributes", type = "SkillLineAttributes", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_SkillInfo.SetSelectedSkill"] = {
    key = "C_SkillInfo.SetSelectedSkill",
    name = "SetSelectedSkill",
    category = "general",
    subcategory = "c_skillinfo",
    funcPath = "C_SkillInfo.SetSelectedSkill",
    params = { { name = "index", type = "luaIndex", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    games = { "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
