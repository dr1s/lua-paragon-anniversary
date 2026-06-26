local function Paragon_LoadMicroButtonTextures(button, name)
    button:RegisterForClicks("LeftButtonUp", "RightButtonUp")
    local prefix = "Interface\\Buttons\\UI-MicroButton-"
    button:SetNormalTexture(prefix .. name .. "-Up")
    button:SetPushedTexture(prefix .. name .. "-Down")
    button:SetDisabledTexture(prefix .. name .. "-Disabled")
    button:SetHighlightTexture("Interface\\Buttons\\UI-MicroButton-Hilight")
end

local function Paragon_MicroButtonTooltipText(text, action)
    if action and GetBindingKey(action) then
        return text .. " " .. NORMAL_FONT_COLOR_CODE .. "(" .. GetBindingText(GetBindingKey(action), "KEY_") .. ")" .. FONT_COLOR_CODE_CLOSE
    end

    return text
end

function ParagonMicroButton_SetPushed()
    if ParagonMicroButton then
        ParagonMicroButton:SetButtonState("PUSHED", 1)
    end
end

function ParagonMicroButton_SetNormal()
    if ParagonMicroButton then
        ParagonMicroButton:SetButtonState("NORMAL")
    end
end

function ToggleParagonFrame()
    if not UIParagon then
        return
    end

    if UIParagon:IsShown() then
        UIParagon:Hide()
        ParagonMicroButton_SetNormal()

        if ParagonMicroButton and ParagonMicroButton.Notification then
            ParagonMicroButton.Notification.dismissed = false
        end

        if ParagonMicroButton_UpdateNotification then
            ParagonMicroButton_UpdateNotification()
        end
    else
        UIParagon:Show()
        ParagonMicroButton_SetPushed()

        if ParagonMicroButton and ParagonMicroButton.Notification then
            ParagonMicroButton.Notification:Hide()
        end
    end
end

function ParagonMicroButton_OnLoad(self)
    Paragon_LoadMicroButtonTextures(self, "Abilities")
    self.tooltipText = Paragon_MicroButtonTooltipText("Paragon Anniversary")
end

function ParagonMicroButton_OnEnter(self)
    self.tooltipText = Paragon_MicroButtonTooltipText("Paragon Anniversary")
    GameTooltip_AddNewbieTip(
        self,
        self.tooltipText,
        1.0,
        1.0,
        1.0,
        "View and manage your Paragon Anniversary statistics and rewards."
    )
end

function ParagonMicroButton_Notification_OnLoad(self)
    self.dismissed = false
    self.pulseTime = 0
end

function ParagonMicroButton_Notification_OnUpdate(self, elapsed)
    self.pulseTime = (self.pulseTime or 0) + elapsed
    local alpha = 0.55 + (math.sin(self.pulseTime * 4) + 1) * 0.225

    if self.Glow then
        self.Glow:SetAlpha(alpha)
    end
end

function ParagonMicroButton_Notification_OnClick(self)
    self.dismissed = true
    ToggleParagonFrame()
    PlaySound("igMainMenuOptionCheckBoxOn")
end

function ParagonMicroButton_Notification_OnEnter(self)
    GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
    local title = Locales and Locales.NOTIFICATION_TITLE or "Unspent Paragon Points"
    local message = Locales and Locales.NOTIFICATION_MESSAGE or "You have unspent Paragon points!"
    GameTooltip:SetText(title, 1, 0.82, 0)
    GameTooltip:AddLine(message, 1, 1, 1, true)
    GameTooltip:Show()
end

function ParagonMicroButton_UpdateNotification()
    if not ParagonMicroButton or not ParagonMicroButton.Notification then
        return
    end

    local notification = ParagonMicroButton.Notification
    local hasUnspentPoints = ParagonData and ParagonData.availablePoints and ParagonData.availablePoints > 0
    local frameNotOpen = not (UIParagon and UIParagon:IsShown())

    if hasUnspentPoints and frameNotOpen and not notification.dismissed then
        notification:Show()
    else
        notification:Hide()
    end
end

function ParagonMicroButton_OnLevelUp()
    if ParagonMicroButton and ParagonMicroButton.Notification then
        ParagonMicroButton.Notification.dismissed = false
        ParagonMicroButton_UpdateNotification()
    end
end

SLASH_PARAGONANNIVERSARY1 = "/paragon"
SLASH_PARAGONANNIVERSARY2 = "/pa"
SlashCmdList.PARAGONANNIVERSARY = ToggleParagonFrame
