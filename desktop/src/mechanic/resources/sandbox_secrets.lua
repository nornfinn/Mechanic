-- sandbox_secrets.lua
-- Secret-value emulation for the restricted sandbox (WoW 12.x and WoW: Forever).
--
-- Loaded by sandbox_runner.lua with the real globals; it installs helpers into
-- the sandbox environment passed as the first argument:
--
--   issecretvalue(v), canaccessvalue(v), issecrettable(t), canaccesstable(t)
--   Sandbox.Secret(v)              wrap a value as a secret (v must not be nil)
--   Sandbox.Reveal(v)              the plain value behind a secret (for assertions)
--   Sandbox.SetRestricted(bool)    simulate combat/encounter restrictions
--   Sandbox.IsRestricted()
--   Sandbox.Mock(path, impl)       replace an API stub ("C_X.Name" or "Name");
--                                  impl is a function or a value to return.
--                                  Returns become secrets when the API always
--                                  returns secrets (SecretReturns), or returns
--                                  conditional secrets while restricted.
--
-- Following the documented rules for tainted code, a secret errors on
-- arithmetic, ordering comparisons, the length operator, indexing, assignment
-- and calls. Concatenation, string.format and tostring are allowed and produce
-- secrets; type() reports the real type. Lua 5.1 cannot intercept truth tests
-- (a secret boolean is always truthy here) or the use of a secret as a table
-- key, so those mistakes are not caught. The in-game error wording differs.
-- Reference: https://warcraft.wiki.gg/wiki/Secret_values

local env, stub_secrets = ...

local real_type = type
local real_tostring = tostring
local real_format = string.format
local real_select = select
local real_unpack = unpack
local real_error = error
local real_rawget = rawget

local inner = setmetatable({}, { __mode = "k" }) -- proxy -> plain value
local prototype = newproxy(true)
local meta = getmetatable(prototype)

local function is_secret(value)
	return real_type(value) == "userdata" and inner[value] ~= nil
end

local function reveal(value)
	if is_secret(value) then
		return inner[value]
	end
	return value
end

local function make_secret(value)
	if value == nil then
		real_error("Sandbox.Secret: nil cannot be a secret value", 2)
	end
	if is_secret(value) then
		return value
	end
	local proxy = newproxy(prototype)
	inner[proxy] = value
	return proxy
end

local function deny(what)
	return function(a, b)
		local value
		if is_secret(a) then
			value = inner[a]
		elseif is_secret(b) then
			value = inner[b]
		end
		real_error(
			real_format("attempt to %s a secret %s value", what, real_type(value)),
			2
		)
	end
end

for _, event in ipairs({ "__add", "__sub", "__mul", "__div", "__mod", "__pow", "__unm" }) do
	meta[event] = deny("perform arithmetic on")
end
meta.__lt = deny("compare")
meta.__le = deny("compare")
meta.__len = deny("get the length of")
meta.__index = deny("index")
meta.__newindex = deny("assign into")
meta.__call = deny("call")
meta.__concat = function(a, b)
	local left, right = reveal(a), reveal(b)
	for _, part in ipairs({ left, right }) do
		local kind = real_type(part)
		if kind ~= "string" and kind ~= "number" then
			real_error("attempt to concatenate a " .. kind .. " value", 2)
		end
	end
	return make_secret(left .. right)
end
meta.__tostring = function(value)
	return "<secret " .. real_type(inner[value]) .. ">"
end
meta.__metatable = false

local function reveal_all(...)
	local count = real_select("#", ...)
	local args, any = {}, false
	for i = 1, count do
		local value = real_select(i, ...)
		if is_secret(value) then
			any = true
			value = inner[value]
		end
		args[i] = value
	end
	return args, count, any
end

env.type = function(value)
	if is_secret(value) then
		return real_type(inner[value])
	end
	return real_type(value)
end

env.tostring = function(value)
	if is_secret(value) then
		return make_secret(real_tostring(inner[value]))
	end
	return real_tostring(value)
end

local real_tonumber = tonumber
env.tonumber = function(value, base)
	if is_secret(value) then
		real_error("tonumber on a secret value is not modelled by the sandbox", 2)
	end
	return real_tonumber(value, base)
end

local function secret_aware_format(fmt, ...)
	local args, count, any = reveal_all(fmt, ...)
	local text = real_format(real_unpack(args, 1, count))
	if any then
		return make_secret(text)
	end
	return text
end
env.string.format = secret_aware_format
if real_rawget(env, "format") ~= nil then
	env.format = secret_aware_format
end

env.issecretvalue = is_secret
env.canaccessvalue = function(value)
	return not is_secret(value)
end
env.issecrettable = function()
	return false
end
env.canaccesstable = function()
	return true
end

local restricted = false
local sandbox = real_rawget(env, "Sandbox") or {}
env.Sandbox = sandbox

sandbox.Secret = make_secret
sandbox.Reveal = reveal
sandbox.SetRestricted = function(state)
	restricted = state and true or false
end
sandbox.IsRestricted = function()
	return restricted
end

env.InCombatLockdown = function()
	return restricted
end

local function resolve(path)
	local namespace, name = path:match("^([%w_]+)%.([%w_]+)$")
	if namespace then
		local container = real_rawget(env, namespace)
		if real_type(container) ~= "table" then
			container = {}
			env[namespace] = container
		end
		return container, name
	end
	if not path:match("^[%w_]+$") then
		real_error("Sandbox.Mock: not an API path: " .. real_tostring(path), 3)
	end
	return env, path
end

sandbox.Mock = function(path, impl)
	if real_type(path) ~= "string" then
		real_error("Sandbox.Mock: path must be a string", 2)
	end
	local policy = stub_secrets and stub_secrets[path]
	local call = impl
	if real_type(impl) ~= "function" then
		call = function()
			return impl
		end
	end
	local container, name = resolve(path)
	container[name] = function(...)
		local results = { call(...) }
		local count = table.maxn(results)
		if policy == "always" or (policy == "conditional" and restricted) then
			for i = 1, count do
				if results[i] ~= nil then
					results[i] = make_secret(results[i])
				end
			end
		end
		return real_unpack(results, 1, count)
	end
end
