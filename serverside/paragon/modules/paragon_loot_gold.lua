--[[
    Paragon Loot & Gold Bonus Module

    Handles the LOOT and GOLD paragon bonuses by hooking into loot events.
    Reads stat values directly from the player's paragon data instead of relying on auras.

    Registered events:
    - PLAYER_EVENT_ON_LOOT_MONEY (34): Modifies gold loot based on GOLD stat value
    - PLAYER_EVENT_ON_LOOT_ITEM (33): Placeholder for loot quality bonus

    @module paragon_loot_gold
    @author dr1s
    @license AGL v3
]]

local Hook = require("paragon_hook")
local Config = require("paragon_config")

-- Stat IDs from paragon_config_statistic table
local STAT_ID_GOLD = 18
local STAT_ID_LOOT = 17

-- ============================================================================
-- GOLD BONUS
-- ============================================================================

---
--- Handles gold loot event and applies bonus based on GOLD paragon stat.
---
--- @param event The event ID (34 = PLAYER_EVENT_ON_LOOT_MONEY)
--- @param player The player object looting the gold
--- @param gold The amount of gold being looted
---
local function OnLootMoney(event, player, gold)
    if not player or not gold or gold <= 0 then
        return
    end

    local paragon = Hook.GetParagonData(player)
    if not paragon then
        return
    end

    local gold_stat = paragon:GetStatValue(STAT_ID_GOLD)
    if not gold_stat or gold_stat <= 0 then
        return
    end

    -- Calculate bonus gold (1% per point)
    local bonus_gold = math.floor(gold * gold_stat / 100)
    if bonus_gold > 0 then
        player:ModifyMoney(bonus_gold)
    end
end

-- ============================================================================
-- LOOT BONUS
-- ============================================================================

---
--- Handles item loot event. LOOT stat is a placeholder for quality upgrades.
---
--- Note: Eluna cannot modify already-looted item quality. Full implementation
--- requires core-level loot table modification.
---
--- @param event The event ID (33 = PLAYER_EVENT_ON_LOOT_ITEM)
--- @param player The player object looting the item
--- @param item The item object being looted
--- @param count The quantity of items looted
---
local function OnLootItem(event, player, item, count)
    if not player or not item then
        return
    end

    local paragon = Hook.GetParagonData(player)
    if not paragon then
        return
    end

    local loot_stat = paragon:GetStatValue(STAT_ID_LOOT)
    if not loot_stat or loot_stat <= 0 then
        return
    end

    -- Quality upgrade is a placeholder - requires core modification to implement fully.
    -- Alternative: grant bonus currency or items based on loot_stat value.
end

-- ============================================================================
-- EVENT REGISTRATION
-- ============================================================================

RegisterPlayerEvent(34, OnLootMoney)
RegisterPlayerEvent(33, OnLootItem)

print("[Paragon] Loot & Gold Bonus module loaded")
