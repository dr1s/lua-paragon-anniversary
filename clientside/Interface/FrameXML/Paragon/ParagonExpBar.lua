--[[
    ParagonExpBar.lua
    Paragon Experience Bar display on MainMenuBar

    This module manages a Paragon XP bar positioned above the player's main XP bar.
    It handles positioning relative to ReputationWatchBar (if visible) and updates
    the display based on server data.

    Positioning rules:
    - If ReputationWatchBar is NOT visible: Replaces it (BOTTOM->TOP of MainMenuBar, offset -3)
    - If ReputationWatchBar IS visible: Positioned above it (BOTTOM->TOP of ReputationWatchBar, offset -2)

    @module ParagonExpBar
    @author Paragon Team
]]

--- Current Paragon XP values
-- @field currentXP number Current experience points
-- @field maxXP number Maximum experience points needed for next level
ParagonExpData = {
    currentXP = 0,
    maxXP = 150  -- Default max XP
}

--- Initialize ParagonExpBar on load
-- Sets up initial state and registers for text display
-- @param self Frame The ParagonExpBar frame
function ParagonExpBar_OnLoad(self)
    self.textLocked = false
    self.characterHooksInstalled = false

    if ParagonExpBarOverlayFrameText then
        ParagonExpBarOverlayFrameText:Hide()
    end

    ParagonExpBar_SetupCharacterHooks()

    -- Initial update
    ParagonExpBar_Update()
end

--- Handle events for ParagonExpBar
-- @param self Frame The ParagonExpBar frame
-- @param event string Event name
-- @param ... any Event arguments
function ParagonExpBar_OnEvent(self, event, ...)
    if (event == "PLAYER_ENTERING_WORLD") then
        ParagonExpBar_SetupCharacterHooks()
        ParagonExpBar_Update()
    elseif (event == "PLAYER_LEVEL_UP") then
        ParagonExpBar_Update()
    elseif (event == "UPDATE_FACTION") then
        ParagonExpBar_UpdatePosition()
        ParagonExpBar_SyncTextVisibility()
    end

end

--- Update the ParagonExpBar position based on ReputationWatchBar visibility
-- This function implements the positioning logic:
-- - If ReputationWatchBar is visible: stack above it
-- - If ReputationWatchBar is hidden: take its place above MainMenuBar
function ParagonExpBar_UpdatePosition()
    if (not ParagonExpBar) then
        return
    end

    ParagonExpBar:ClearAllPoints()

    if (ReputationWatchBar and ReputationWatchBar:IsShown()) then
        ParagonExpBar:SetPoint("BOTTOM", "ReputationWatchBar", "TOP", 0, -2)
    else
        ParagonExpBar:SetPoint("BOTTOM", "MainMenuBar", "TOP", 0, -2)
    end

    ParagonExpBar_UpdateDependentBars()
end

--- Update the ParagonExpBar display with current XP values
-- Updates the StatusBar value and text display
-- Also checks if the bar should be visible based on player level and user settings
function ParagonExpBar_Update()
    if (not ParagonExpBar or not ParagonExpBar.StatusBar) then
        return
    end

    local currentXP = ParagonExpData.currentXP
    local maxXP = ParagonExpData.maxXP

    ParagonExpBar.StatusBar:SetMinMaxValues(0, maxXP)
    ParagonExpBar.StatusBar:SetValue(currentXP)

    ParagonExpBar_UpdateText()
    ParagonExpBar_UpdatePosition()

    local isEnabled = ParagonSaved and ParagonSaved.showMainMenuXP == true

    if not isEnabled then
        if ParagonExpBar:IsShown() then
            ParagonExpBar:Hide()
        end
    else
        ParagonExpBar:Show()
    end

    ParagonExpBar_UpdateDependentBars()
    ParagonExpBar_SyncTextVisibility()
end

--- Update the text display on the Paragon XP bar
-- Shows current/max XP and percentage
function ParagonExpBar_UpdateText()
    if (not ParagonExpBarOverlayFrameText) then return end

    local currentXP = ParagonExpData.currentXP
    local maxXP = ParagonExpData.maxXP

    -- Get localized text
    local Locales = GetLocaleTable()
    local experienceText = Locales and Locales.PARAGON_EXPERIENCE_TEXT or "Paragon %d / %d (%d%%)"

    -- Format: "Paragon 75 / 150 (50%)"
    local percentage = 0
    if (maxXP > 0) then
        percentage = math.floor((currentXP / maxXP) * 100)
    end

    local text = string.format(experienceText, currentXP, maxXP, percentage)
    ParagonExpBarOverlayFrameText:SetText(text)
end

--- Set Paragon experience values and update display
-- This function is called by the network layer when server sends XP data
-- @param current number Current Paragon XP
-- @param max number Maximum Paragon XP for current level
function ParagonExpBar_SetExperience(current, max)
    ParagonExpData.currentXP = current or 0
    ParagonExpData.maxXP = max or 150

    ParagonExpBar_Update()
end

--- Show the Paragon XP bar text
-- Can be locked to always show, or unlocked to only show on hover
-- @param lock string If "lock", text will always show; otherwise unlocked
function ShowParagonExpBarText(lock)
    if (not ParagonExpBar) then return end

    if (lock) then
        ParagonExpBar.textLocked = true
    end

    ParagonExpBar_SyncTextVisibility()
end

--- Hide the Paragon XP bar text
-- @param unlock string If "unlock", removes the lock; text will hide on mouse leave
function HideParagonExpBarText(unlock)
    if (not ParagonExpBar) then return end

    if (unlock) then
        ParagonExpBar.textLocked = false
    end

    ParagonExpBar_SyncTextVisibility()
end

function ParagonExpBar_UpdateDependentBars()
	if ParagonExpBar and ParagonExpBar:IsShown() then
		local anchorFrame = MainMenuBar
		local anchorYOffset = -3

		if ParagonExpBar and ParagonExpBar:IsShown() then
			anchorFrame = ParagonExpBar
			anchorYOffset = 0
		end

		if MultiBarBottomLeft and MultiBarBottomLeft:IsShown() then
            MultiBarBottomLeft:ClearAllPoints()
            MultiBarBottomLeft:SetPoint("BOTTOMLEFT", anchorFrame, "TOPLEFT", 8, 5)
        end

		if MultiBarBottomRight and MultiBarBottomRight:IsShown() then
            MultiBarBottomLeft:ClearAllPoints()
            MultiBarBottomLeft:SetPoint("BOTTOMLEFT", anchorFrame, "TOPLEFT", 8, 5)
        end

		if ShapeshiftBarFrame then
			ShapeshiftBarFrame:ClearAllPoints()
			if MultiBarBottomLeft and MultiBarBottomLeft:IsShown() then
				ShapeshiftBarFrame:SetPoint("BOTTOMLEFT", anchorFrame, "TOPLEFT", 30, 45)
			else
				ShapeshiftBarFrame:SetPoint("BOTTOMLEFT", anchorFrame, "TOPLEFT", 30, 0)
			end
		end

		if PetActionBarFrame then
			PetActionBarFrame:ClearAllPoints()
			PetActionBarFrame:SetPoint("BOTTOMLEFT", anchorFrame, "TOPLEFT", 36, anchorYOffset)
		end

		if PossessBarFrame then
			PossessBarFrame:ClearAllPoints()
			PossessBarFrame:SetPoint("BOTTOMLEFT", anchorFrame, "TOPLEFT", 36, anchorYOffset)
		end
	end
end

function ParagonExpBar_ShouldShowText()
    if not ParagonExpBar then
        return false
    end

    if ParagonExpBar.textLocked then
        return true
    end

    if CharacterFrame and CharacterFrame:IsShown() then
        return true
    end

    return false
end

function ParagonExpBar_SyncTextVisibility()
    if not ParagonExpBarOverlayFrameText then
        return
    end

    if ParagonExpBar_ShouldShowText() then
        ParagonExpBarOverlayFrameText:Show()
    else
        ParagonExpBarOverlayFrameText:Hide()
    end
end

function ParagonExpBar_SetupCharacterHooks()
    if not ParagonExpBar or ParagonExpBar.characterHooksInstalled then
        return
    end

    if CharacterFrame then
        CharacterFrame:HookScript("OnShow", function()
            ParagonExpBar_SyncTextVisibility()
        end)

        CharacterFrame:HookScript("OnHide", function()
            ParagonExpBar_SyncTextVisibility()
        end)

		hooksecurefunc("UIParent_ManageFramePositions", function()
			ParagonExpBar_UpdateDependentBars()
		end)

        ParagonExpBar.characterHooksInstalled = true
    end
end