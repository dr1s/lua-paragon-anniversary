--[[
    Paragon Gold Bonus Module

    Handles the GOLD paragon bonus by hooking into the money loot event.
    Reads stat values directly from the player's paragon data.

    Registered events:
    - PLAYER_EVENT_ON_LOOT_MONEY (34): Modifies gold loot based on GOLD stat value

    Dependencies:
    - paragon_hook

    @module paragon_gold
    @author dr1s
    @license AGL v3
]]

local Hook = require("paragon_hook")

-- Stat ID from paragon_config_statistic table
local STAT_ID_GOLD = 18

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
-- EVENT REGISTRATION
-- ============================================================================

RegisterPlayerEvent(34, OnLootMoney)

print("[Paragon] Gold Bonus module loaded")
