--[[
    Paragon Reputation & Experience Bonus Module

    Handles the REPUTATION and EXPERIENCE paragon bonuses by hooking into
    relevant events. Reads stat values directly from the player's paragon data
    instead of relying on auras.

    Registered events:
    - PLAYER_EVENT_ON_GAIN_REPUTATION (38): Modifies reputation gain based on REPUTATION stat
    - PLAYER_EVENT_ON_GAIN_XP (12): Modifies XP gain based on EXPERIENCE stat

    Dependencies:
    - paragon_hook

    @module paragon_reputation_exp
    @author dr1s
    @license AGL v3
]]

local Hook = require("paragon_hook")

-- Stat IDs from paragon_config_statistic table
local STAT_ID_REPUTATION = 19
local STAT_ID_EXPERIENCE = 15

-- ============================================================================
-- REPUTATION BONUS
-- ============================================================================

---
--- Handles reputation gain event and applies bonus based on REPUTATION paragon stat.
---
--- @param event The event ID (38 = PLAYER_EVENT_ON_GAIN_REPUTATION)
--- @param player The player object gaining reputation
--- @param faction_id The faction ID
--- @param amount The base reputation amount
---
local function OnGainReputation(event, player, faction_id, amount)
    if not player or not amount or amount <= 0 then
        return
    end

    local paragon = Hook.GetParagonData(player)
    if not paragon then
        return
    end

    local rep_stat = paragon:GetStatValue(STAT_ID_REPUTATION)
    if not rep_stat or rep_stat <= 0 then
        return
    end

    -- Calculate bonus reputation (1% per point)
    local bonus_rep = math.floor(amount * rep_stat / 100)
    if bonus_rep > 0 then
        player:ModifyReputation(faction_id, bonus_rep)
    end
end

-- ============================================================================
-- EXPERIENCE BONUS
-- ============================================================================

---
--- Handles XP gain event and applies bonus based on EXPERIENCE paragon stat.
---
--- Note: This hook fires AFTER the paragon system's own XP calculation.
--- The EXPERIENCE stat here applies to regular character XP, not paragon XP.
---
--- @param event The event ID (12 = PLAYER_EVENT_ON_GAIN_XP)
--- @param player The player object gaining XP
--- @param amount The base XP amount
---
local function OnGainXP(event, player, amount)
    if not player or not amount or amount <= 0 then
        return
    end

    local paragon = Hook.GetParagonData(player)
    if not paragon then
        return
    end

    local exp_stat = paragon:GetStatValue(STAT_ID_EXPERIENCE)
    if not exp_stat or exp_stat <= 0 then
        return
    end

    -- Calculate bonus XP (1% per point)
    local bonus_xp = math.floor(amount * exp_stat / 100)
    if bonus_xp > 0 then
        player:GiveXP(bonus_xp)
    end
end

-- ============================================================================
-- EVENT REGISTRATION
-- ============================================================================

RegisterPlayerEvent(38, OnGainReputation)
RegisterPlayerEvent(12, OnGainXP)

print("[Paragon] Reputation & Experience Bonus module loaded")
