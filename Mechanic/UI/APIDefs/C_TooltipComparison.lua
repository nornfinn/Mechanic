-- Generated APIDefinitions for namespace: C_TooltipComparison
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_TooltipComparison.CompareItem"] = {
    key = "C_TooltipComparison.CompareItem",
    name = "CompareItem",
    category = "ui",
    subcategory = "c_tooltipcomparison",
    funcPath = "C_TooltipComparison.CompareItem",
    params = { { name = "comparisonItem", type = "TooltipComparisonItem", default = nil }, { name = "tooltip", type = "Tooltip", default = nil }, { name = "anchorFrame", type = "SimpleFrame", default = nil } },
    returns = {  },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TooltipComparison.GetItemComparisonDelta"] = {
    key = "C_TooltipComparison.GetItemComparisonDelta",
    name = "GetItemComparisonDelta",
    category = "ui",
    subcategory = "c_tooltipcomparison",
    funcPath = "C_TooltipComparison.GetItemComparisonDelta",
    params = { { name = "comparisonItem", type = "TooltipComparisonItem", default = nil }, { name = "equippedItem", type = "TooltipComparisonItem", default = nil }, { name = "pairedItem", type = "TooltipComparisonItem", default = nil }, { name = "addPairedStats", type = "bool", default = nil } },
    returns = { { name = "lines", type = "table", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}

APIDefs["C_TooltipComparison.GetItemComparisonInfo"] = {
    key = "C_TooltipComparison.GetItemComparisonInfo",
    name = "GetItemComparisonInfo",
    category = "ui",
    subcategory = "c_tooltipcomparison",
    funcPath = "C_TooltipComparison.GetItemComparisonInfo",
    params = { { name = "comparisonItem", type = "TooltipComparisonItem", default = nil } },
    returns = { { name = "info", type = "TooltipItemComparisonInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
    midnightNote = "Secret behavior: SecretArguments=AllowedWhenUntainted",
}
