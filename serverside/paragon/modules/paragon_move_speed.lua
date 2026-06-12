--[[
    Paragon Movement Speed Bonus Module

    Handles the MOVE_SPEED paragon bonus by hooking into the statistics update cycle.
    Reads stat values directly from the player's paragon data instead of relying on auras.

    Registered mediator events:
    - OnAfterUpdatePlayerStatistics: Applies or resets movement speed based on stat value

    Dependencies:
    - paragon_hook

    @module paragon_move_speed
    @author dr1s
    @license AGL v3
]]

local Hook = require("paragon_hook")

-- Stat ID from paragon_config_statistic table
local STAT_ID_MOVE_SPEED = 16

-- Speed type constant (SPEED_RUN)
local SPEED_RUN = 1

-- ============================================================================
-- MOVEMENT SPEED HANDLER
-- ============================================================================

---
--- Applies or resets movement speed after paragon statistics are updated.
---
--- @param player The player object
--- @param paragon The paragon instance
--- @param apply Boolean indicating whether to apply (true) or remove (false) the bonuses
--- @return The apply flag (unchanged)
---
local function OnAfterUpdatePlayerStatistics(player, paragon, apply)
    if not player or not paragon then
        return apply
    end

    local move_speed_stat = paragon:GetStatValue(STAT_ID_MOVE_SPEED)

    if apply then
        if move_speed_stat and move_speed_stat > 0 then
            -- 1% speed increase per point invested (rate multiplier)
            local rate = 1.0 + (move_speed_stat * 0.01)
            player:SetSpeed(SPEED_RUN, rate, true)
        end
    else
        -- Reset to base speed on logout/stat removal
        player:SetSpeed(SPEED_RUN, 1.0, true)
    end

    return apply
end

-- ============================================================================
-- MODULE REGISTRATION
-- ============================================================================

RegisterMediatorEvent("OnAfterUpdatePlayerStatistics", OnAfterUpdatePlayerStatistics)

print("[Paragon] Movement Speed Bonus module loaded")
