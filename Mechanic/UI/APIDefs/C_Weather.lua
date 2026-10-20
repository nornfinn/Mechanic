-- Generated APIDefinitions for namespace: C_Weather
local _, ns = ...
local APIDefs = ns.APIDefinitions

APIDefs["C_Weather.GetCurrentWeather"] = {
    key = "C_Weather.GetCurrentWeather",
    name = "GetCurrentWeather",
    category = "general",
    subcategory = "c_weather",
    funcPath = "C_Weather.GetCurrentWeather",
    params = {  },
    returns = { { name = "info", type = "WeatherInfo", canBeSecret = false } },
    midnightImpact = "NORMAL",
    games = { "standard", "forever" },
}
