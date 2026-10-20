-- Bootstrap.lua
-- !Mechanic Bootstrap - Minimal early loader
--
-- This addon loads FIRST (via ! prefix) to provide:
-- 1. MechanicLib registration API for other addons
-- 2. Global Mechanic namespace
-- 3. CLI queue processing (lua.queue, api.queue)
-- 4. SavedVariables initialization
--
-- The main Mechanic addon loads later with all UI and features.

local ADDON_NAME, ns = ...

--------------------------------------------------------------------------------
-- Global Namespace (Available immediately for other addons)
--------------------------------------------------------------------------------

local Mechanic = {}
_G.Mechanic = Mechanic
_G.MechanicNS = ns  -- Shared namespace for main addon

-- Version from metadata
Mechanic.version = C_AddOns.GetAddOnMetadata(ADDON_NAME, "Version") or "unknown"
Mechanic.isBootstrap = true  -- Flag indicating main addon not yet loaded

-- Placeholder for main addon to populate
Mechanic.db = nil
Mechanic.API = nil
Mechanic.Console = nil

--------------------------------------------------------------------------------
-- SavedVariables Initialization
--------------------------------------------------------------------------------

-- Database defaults (minimal - main addon extends these)
local defaults = {
    profile = {
        -- Core settings preserved across sessions
        position = { point = "CENTER", x = 0, y = 0 },
        size = { width = 1000, height = 650 },
        activeTab = "inspect",
        
        -- Diagnostic Hub data (persisted for desktop sync)
        addonData = {},
        lastSync = 0,
        
        -- API/Lua queue results (written by in-game, read by desktop)
        apiTests = {},
        apiNotes = {},
        luaEvalResults = {},
        
        -- Console buffer for desktop
        consoleBuffer = {},
        consoleBufferMax = 100,
        
        -- Health log for agent auditing
        healthLog = {},
        
        -- Test results
        testResults = {},

        -- ADDON_ACTION_BLOCKED / ADDON_ACTION_FORBIDDEN, newest last (bounded)
        blockedActions = {},
    },
}

local BLOCKED_ACTIONS_MAX = 50

--------------------------------------------------------------------------------
-- Event Frame
--------------------------------------------------------------------------------

local frame = CreateFrame("Frame")
frame:RegisterEvent("ADDON_LOADED")
frame:RegisterEvent("ADDON_ACTION_BLOCKED")
frame:RegisterEvent("ADDON_ACTION_FORBIDDEN")

frame:SetScript("OnEvent", function(self, event, arg1, arg2)
    if event == "ADDON_ACTION_BLOCKED" or event == "ADDON_ACTION_FORBIDDEN" then
        Mechanic:RecordBlockedAction(event, arg1, arg2)
    elseif event == "ADDON_LOADED" and arg1 == ADDON_NAME then
        -- Initialize minimal database for queue results
        -- Main addon will use same SavedVariables and extend it
        if not MechanicDB then
            MechanicDB = {}
        end
        if not MechanicDB.profiles then
            MechanicDB.profiles = {}
        end
        local name = UnitName and UnitName("player")
        local realm = GetRealmName and GetRealmName()
        local character = name and realm and (name .. " - " .. realm)
        MechanicDB.profileKeys = MechanicDB.profileKeys or {}
        local profile = character and MechanicDB.profileKeys[character] or "Default"
        local target = _G.MECHANIC_DIAGNOSTIC_TARGET
        -- Queue files are shared by every account on this client. Never execute
        -- a character-bound request on another character or unknown identity.
        -- A malformed (non-table) target fails closed, matching Core.
        local matches = target == nil or type(target) == "table"
        if matches and target then
            if target.character and target.character ~= character then
                matches = false
            elseif target.profile and target.profile ~= profile then
                matches = false
            end
        end
        if not matches then
            _G.MECHANIC_LUA_QUEUE = nil
            _G.MECHANIC_API_QUEUE = nil
        end
        MechanicDB.profiles[profile] = MechanicDB.profiles[profile] or {}
        ns.rawDB = MechanicDB.profiles[profile]
        ns.profileName = profile
        if character then
            MechanicDB.profileKeys[character] = profile
        end

        -- Apply defaults for keys we need
        for key, value in pairs(defaults.profile) do
            if ns.rawDB[key] == nil then
                if type(value) == "table" then
                    ns.rawDB[key] = {}
                else
                    ns.rawDB[key] = value
                end
            end
        end
        
        -- Blocked actions are kept per session; earlier sessions stay until the cap
        ns.blockedSession = time and time() or 0
        if type(ns.rawDB.blockedActions) ~= "table" then
            ns.rawDB.blockedActions = {}
        end
        Mechanic:FlushBlockedActions()

        -- Process queues immediately (before main addon loads)
        Mechanic:ProcessLuaEvalQueue()
        Mechanic:ProcessAPITestQueue()
        
        self:UnregisterEvent("ADDON_LOADED")
    end
end)

--------------------------------------------------------------------------------
-- Blocked / forbidden actions (independent of !BugGrabber)
--------------------------------------------------------------------------------
-- The client fires ADDON_ACTION_BLOCKED (protected call from tainted code, e.g.
-- in combat) and ADDON_ACTION_FORBIDDEN (always-forbidden call) with the addon
-- blamed and the function. Recording them here means skin and UI addons get
-- taint evidence in addon.output even without an error-capture addon.

local pendingBlocked = {}

local function plain(value)
    if issecretvalue and issecretvalue(value) then
        return "[secret]"
    end
    if value == nil then
        return nil
    end
    local ok, text = pcall(tostring, value)
    return ok and text or "[unprintable]"
end

local function storeBlocked(record)
    local list = ns.rawDB.blockedActions
    local last = list[#list]
    if last and last.session == record.session and last.event == record.event
        and last.addon == record.addon and last["function"] == record["function"] then
        last.count = (last.count or 1) + 1
        last.lastAt = record.at
        last.inCombat = last.inCombat or record.inCombat
        return
    end
    list[#list + 1] = record
    while #list > BLOCKED_ACTIONS_MAX do
        table.remove(list, 1)
    end
end

function Mechanic:FlushBlockedActions()
    if not ns.rawDB then
        return
    end
    for i = 1, #pendingBlocked do
        pendingBlocked[i].session = ns.blockedSession
        storeBlocked(pendingBlocked[i])
    end
    pendingBlocked = {}
end

function Mechanic:RecordBlockedAction(event, addonName, functionName)
    local record = {
        event = event,
        addon = plain(addonName) or "?",
        ["function"] = plain(functionName) or "?",
        at = date("%Y-%m-%d %H:%M:%S"),
        inCombat = (InCombatLockdown and InCombatLockdown()) and true or false,
        count = 1,
        session = ns.blockedSession,
    }
    if ns.rawDB then
        storeBlocked(record)
    else
        pendingBlocked[#pendingBlocked + 1] = record
    end
end

--- Blocked actions recorded in this session (newest last).
function Mechanic:GetBlockedActions()
    local current = {}
    if ns.rawDB and ns.rawDB.blockedActions then
        for _, record in ipairs(ns.rawDB.blockedActions) do
            if record.session == ns.blockedSession then
                current[#current + 1] = record
            end
        end
    end
    return current
end

--------------------------------------------------------------------------------
-- Lua Eval Queue Processing
--------------------------------------------------------------------------------
--
-- SECURITY NOTE: This feature uses loadstring() to execute arbitrary Lua code.
-- This is an INTENTIONAL DEVELOPMENT TOOL for addon developers to:
--   - Test API calls in-game via the Mechanic CLI (lua.queue command)
--   - Inspect runtime values during development
--   - Debug addon behavior without modifying source files
--
-- The code queue is populated ONLY by the local Mechanic desktop tool via
-- SavedVariables, not by any network or external source. The feature is
-- sandboxed within WoW's addon environment which already restricts dangerous
-- operations (file I/O, network access, etc.).
--
-- If distributing Mechanic to end users, consider disabling this feature
-- by removing or commenting out this function.
--------------------------------------------------------------------------------

function Mechanic:ProcessLuaEvalQueue()
    local queue = _G.MECHANIC_LUA_QUEUE
    
    if not queue or #queue == 0 then
        return
    end
    
    -- Clear global immediately
    _G.MECHANIC_LUA_QUEUE = nil
    
    local results = {}
    local lastRun = date("%Y-%m-%d %H:%M:%S")

    -- SavedVariables cannot safely store arbitrary return values (functions,
    -- frames, or cyclic tables). Keep the same textual result contract as Core.
    local function describe(value)
        if issecretvalue and issecretvalue(value) then
            return "[secret]"
        end
        local ok, text = pcall(tostring, value)
        return ok and text or "[unprintable]"
    end

    local function serialize(value)
        if issecretvalue and issecretvalue(value) then
            return "[secret]"
        end
        if type(value) ~= "table" then
            return describe(value)
        end
        local parts, count = {}, 0
        for key, entry in pairs(value) do
            count = count + 1
            if count > 10 then
                table.insert(parts, "...")
                break
            end
            table.insert(parts, describe(key) .. "=" .. describe(entry))
        end
        return "{" .. table.concat(parts, ", ") .. "}"
    end
    
    for i, item in ipairs(queue) do
        local code = item.code
        local label = item.label or ("snippet_" .. i)
        
        -- Execute the code
        local fn, loadErr
        if type(code) ~= "string" or code == "" then
            loadErr = "Empty or invalid code snippet"
        else
            fn, loadErr = loadstring("return " .. code, label)
        end
        if not fn and type(code) == "string" and code ~= "" then
            -- Try without return wrapper
            fn, loadErr = loadstring(code, label)
        end

        local entry = { label = label, code = code, executedAt = lastRun }
        
        if fn then
            local success, result = pcall(fn)
            if success then
                entry.success = true
                entry.result = serialize(result)
                entry.resultType = type(result)
            else
                entry.success = false
                entry.error = describe(result)
            end
        else
            entry.success = false
            entry.error = "Load error: " .. describe(loadErr)
        end
        table.insert(results, entry)
    end
    
    -- Store results in SavedVariables for desktop to read
    ns.rawDB.luaEvalResults = { results = results, lastRun = lastRun }
    
    -- Print summary
    local passed, failed = 0, 0
    for _, r in pairs(results) do
        if r.success then passed = passed + 1 else failed = failed + 1 end
    end
    print(string.format("|cFF00FFFF[!Mechanic] Lua Eval: %d passed, %d failed|r", passed, failed))
end

--------------------------------------------------------------------------------
-- API Test Queue Processing
--------------------------------------------------------------------------------

function Mechanic:ProcessAPITestQueue()
    local queue = _G.MECHANIC_API_QUEUE
    
    if not queue or #queue == 0 then
        return
    end
    
    -- Clear global immediately
    _G.MECHANIC_API_QUEUE = nil
    
    -- Store queue for main addon to process (needs APIDefs)
    ns.pendingAPIQueue = queue
    
    print(string.format("|cFF00FFFF[!Mechanic] API Queue: %d test(s) queued for main addon|r", #queue))
end

--------------------------------------------------------------------------------
-- Registration Callbacks (for main addon)
--------------------------------------------------------------------------------

function Mechanic:OnAddonRegistered(addonName, capabilities)
    -- Called by MechanicLib when an addon registers
    -- Main addon will override this
    if not ns.pendingRegistrations then
        ns.pendingRegistrations = {}
    end
    ns.pendingRegistrations[addonName] = capabilities
end

function Mechanic:OnAddonUnregistered(addonName)
    if ns.pendingRegistrations then
        ns.pendingRegistrations[addonName] = nil
    end
end

--------------------------------------------------------------------------------
-- Utility: Print (available early)
--------------------------------------------------------------------------------

function Mechanic:Print(msg)
    print("|cFF00FF00[Mechanic]|r " .. tostring(msg))
end

--------------------------------------------------------------------------------
-- Main Addon Integration
--------------------------------------------------------------------------------

--- Called by main Mechanic addon when it loads
--- Transfers control and pending data
---@param mainAddon table The main Mechanic addon object
function Mechanic:OnMainAddonLoaded(mainAddon)
    -- Transfer pending registrations
    if ns.pendingRegistrations then
        for addonName, capabilities in pairs(ns.pendingRegistrations) do
            if mainAddon.OnAddonRegistered then
                mainAddon:OnAddonRegistered(addonName, capabilities)
            end
        end
        ns.pendingRegistrations = nil
    end
    
    -- Mark bootstrap complete
    Mechanic.isBootstrap = false
    
    print("|cFF00FF00[!Mechanic] Bootstrap complete, main addon loaded.|r")
end
