--[[
    Paragon_Locales.lua
    Localization system for the Paragon Anniversary addon

    This module provides multi-language support for all UI text, tooltips, and descriptions.
    Supports 9 languages: frFR, enUS, deDE, esES, ruRU, ptBR, itIT, koKR, zhCN, zhTW

    @module Paragon_Locales
    @author Paragon Team
]]

--- Localization strings table indexed by locale code
-- Contains all translatable strings for the addon organized by language
-- @field [string] Locale code (e.g., "frFR", "enUS")
-- @return table Translation strings for the specified locale
local Locales = {
    ["frFR"] = {
        EXPERIENCE_TEXT = "Exp??rience %d / %d",
        PARAGON_EXPERIENCE_TEXT = "Paragon %d / %d (%d%%)",
        STATISTICS_TEXT = "Statistiques",
        SHOW_MAINMENU_XP_LABEL = "Afficher la barre XP sur l'interface principale",
        SHOW_MAINMENU_XP_TOOLTIP = "Si coch??, affiche la barre d'exp??rience Paragon au-dessus de la barre XP de votre personnage en bas de l'??cran.",

        -- ========================================================================
        -- CATEGORY NAMES
        -- ========================================================================
        DEFENSE_TEXT = "D??fense",
        ATTACK_TEXT = "Attaque",
        MAGIC_TEXT = "Magie",
        OTHER_TEXT = "Autres",

        -- ========================================================================
        -- TOOLTIPS
        -- ========================================================================
        TOOLTIP_INSTRUCTIONS = "Clic gauche/droit pour ajouter/retirer un point.\nMolette haut/bas pour ajouter/retirer plusieurs.\nClic molette pour attribution rapide.",
        TOOLTIP_LIMIT = "Limite : %d",

        -- ========================================================================
        -- POINTS DISPLAY
        -- ========================================================================
        POINTS_TO_SPEND = "(%d %s ?? d??penser)",
        POINTS_SINGULAR = "point",
        POINTS_PLURAL = "points",

        -- ========================================================================
        -- POPUP DIALOGS
        -- ========================================================================
        POPUP_CHOOSE_ACTION = "Voulez-vous ajouter ou retirer des points ?",
        POPUP_BUTTON_ADD = "Ajouter",
        POPUP_BUTTON_REMOVE = "Retirer",
        POPUP_ENTER_AMOUNT = "Combien de points voulez-vous %s dans %s ?",
        POPUP_ACTION_ADD = "ajouter",
        POPUP_ACTION_REMOVE = "retirer",
        POPUP_BUTTON_CONFIRM = "Confirmer",
        POPUP_BUTTON_CANCEL = "Annuler",

        -- ========================================================================
        -- APPLY BUTTON
        -- ========================================================================
        APPLY_BUTTON_TEXT = "Appliquer",

        -- ========================================================================
        -- NOTIFICATION BADGE
        -- ========================================================================
        NOTIFICATION_TITLE = "Points Paragon non distribu??s",
        NOTIFICATION_MESSAGE = "Vous avez des points Paragon non distribu??s !",
        NOTIFICATION_DISMISS = "Cliquer pour masquer cette notification.",

        -- ========================================================================
        -- TUTORIAL MODE
        -- ========================================================================
        BUTTON_HELP = "?",
        TUTORIAL_TITLE = "Aide - Interface Paragon",
        TUTORIAL_BUTTON_NEXT = "Suivant",
        TUTORIAL_BUTTON_PREVIOUS = "Pr??c??dent",
        TUTORIAL_BUTTON_CLOSE = "Fermer",
        TUTORIAL_BUTTON_FINISH = "Terminer",
        TUTORIAL_STEP_COUNTER = "??tape %d/%d",
        TUTORIAL_COMPLETE = "Tutoriel termin?? !",
        TUTORIAL_LEVEL = "Niveau Paragon|nAffiche votre niveau actuel dans le syst??me Paragon.",
        TUTORIAL_XP_BAR = "Barre d'exp??rience Paragon|nMontre votre progression vers le prochain niveau.|nSurvole pour voir les d??tails XP.",
        TUTORIAL_POINTS = "Points disponibles|nPoints que vous pouvez d??penser dans les statistiques.|nGagn??s en montant de niveau.",
        TUTORIAL_HELP_BUTTON = "Bouton d'aide|nRelance ce tutoriel ?? tout moment.|nClic pour afficher cette aide.",
        TUTORIAL_CATEGORIES = "Cat??gories de statistiques|nGroupes th??matiques : D??fense, Attaque, Magie, Autres.|nChaque cat??gorie contient des stats sp??cifiques.",
        TUTORIAL_STATS = "Interaction avec les statistiques|n|n- Clic gauche : +1 point|n- Clic droit : -1 point|n- Molette haut : +5 points|n- Molette bas : -5 points|n- Clic molette : Attribution rapide|n|nSurvole une stat pour voir sa description.",

        -- ========================================================================
        -- STATISTICS
        -- ========================================================================
        STATISTICS = {
            -- Combat Rating Statistics
            COMBAT_RATING = {
                WEAPON_SKILL            = { name = "Comp??tence d'armes", description = "Augmente votre comp??tence avec toutes les armes." },
                DEFENSE_SKILL           = { name = "Comp??tence de d??fense", description = "Augmente votre comp??tence de d??fense contre les attaques." },
                DODGE                   = { name = "Esquive", description = "Augmente votre score d'esquive." },
                PARRY                   = { name = "Parade", description = "Augmente votre score de parade." },
                BLOCK                   = { name = "Blocage", description = "Augmente votre score de blocage." },
                HIT_MELEE               = { name = "Pr??cision (m??l??e)", description = "Augmente votre chance de toucher en m??l??e." },
                HIT_RANGED              = { name = "Pr??cision (distance)", description = "Augmente votre chance de toucher ?? distance." },
                HIT_SPELL               = { name = "Pr??cision (sorts)", description = "Augmente votre chance de toucher avec les sorts." },
                CRIT_MELEE              = { name = "Critique (m??l??e)", description = "Augmente votre chance de critique en m??l??e." },
                CRIT_RANGED             = { name = "Critique (distance)", description = "Augmente votre chance de critique ?? distance." },
                CRIT_SPELL              = { name = "Critique (sorts)", description = "Augmente votre chance de critique avec les sorts." },
                HIT_TAKEN_MELEE         = { name = "Touch?? (m??l??e)", description = "Augmente la chance d'??tre touch?? en m??l??e." },
                HIT_TAKEN_RANGED        = { name = "Touch?? (distance)", description = "Augmente la chance d'??tre touch?? ?? distance." },
                HIT_TAKEN_SPELL         = { name = "Touch?? (sorts)", description = "Augmente la chance d'??tre touch?? par les sorts." },
                CRIT_TAKEN_MELEE        = { name = "Critique re??u (m??l??e)", description = "Augmente la chance de recevoir un critique en m??l??e." },
                CRIT_TAKEN_RANGED       = { name = "Critique re??u (distance)", description = "Augmente la chance de recevoir un critique ?? distance." },
                CRIT_TAKEN_SPELL        = { name = "Critique re??u (sorts)", description = "Augmente la chance de recevoir un critique des sorts." },
                HASTE_MELEE             = { name = "H??te (m??l??e)", description = "Augmente votre vitesse d'attaque en m??l??e." },
                HASTE_RANGED            = { name = "H??te (distance)", description = "Augmente votre vitesse d'attaque ?? distance." },
                HASTE_SPELL             = { name = "H??te (sorts)", description = "Augmente votre vitesse de lancement de sorts." },
                WEAPON_SKILL_MAINHAND   = { name = "Comp??tence (main principale)", description = "Augmente votre comp??tence avec l'arme de main principale." },
                WEAPON_SKILL_OFFHAND    = { name = "Comp??tence (main secondaire)", description = "Augmente votre comp??tence avec l'arme de main secondaire." },
                WEAPON_SKILL_RANGED     = { name = "Comp??tence (distance)", description = "Augmente votre comp??tence avec les armes ?? distance." },
                EXPERTISE               = { name = "Expertise", description = "R??duit les chances de parade et d'esquive de la cible." },
                ARMOR_PENETRATION       = { name = "P??n??tration d'armure", description = "Ignore un pourcentage de l'armure de la cible." },
            },

            -- Unit Modifier Statistics
            UNIT_MODS = {
                STAT_STRENGTH           = { name = "Force", description = "Augmente votre Force, ce qui am??liore votre puissance d'attaque en m??l??e." },
                STAT_AGILITY            = { name = "Agilit??", description = "Augmente votre Agilit??, ce qui am??liore votre puissance d'attaque ?? distance, votre esquive et vos chances de coup critique." },
                STAT_STAMINA            = { name = "Endurance", description = "Augmente votre Endurance, ce qui am??liore votre total de points de vie." },
                STAT_INTELLECT          = { name = "Intelligence", description = "Augmente votre Intelligence, ce qui am??liore votre puissance des sorts et votre total de mana." },
                STAT_SPIRIT             = { name = "Esprit", description = "Augmente votre Esprit, ce qui am??liore votre r??g??n??ration de mana et de sant??." },
                HEALTH                  = { name = "Sant??", description = "Augmente votre total de points de vie." },
                MANA                    = { name = "Mana", description = "Augmente votre total de mana." },
                RAGE                    = { name = "Rage", description = "Augmente votre g??n??ration de rage (guerriers et druides)." },
                FOCUS                   = { name = "Concentration", description = "Augmente votre r??serve de concentration (chasseurs)." },
                ENERGY                  = { name = "??nergie", description = "Augmente votre r??g??n??ration d'??nergie (voleurs et druides)." },
                HAPPINESS               = { name = "Bonheur", description = "Augmente le bonheur de votre familier (chasseurs)." },
                RUNE                    = { name = "Runes", description = "Augmente la r??g??n??ration des runes (chevaliers de la mort)." },
                RUNIC_POWER             = { name = "Puissance runique", description = "Augmente votre r??serve de puissance runique (chevaliers de la mort)." },
                ARMOR                   = { name = "Armure", description = "Augmente votre valeur d'armure, ce qui r??duit les d??g??ts physiques re??us." },
                RESISTANCE_HOLY         = { name = "R??sistance sacr??", description = "Augmente votre r??sistance contre les d??g??ts sacr??s." },
                RESISTANCE_FIRE         = { name = "R??sistance feu", description = "Augmente votre r??sistance contre les d??g??ts de feu." },
                RESISTANCE_NATURE       = { name = "R??sistance nature", description = "Augmente votre r??sistance contre les d??g??ts de nature." },
                RESISTANCE_FROST        = { name = "R??sistance givre", description = "Augmente votre r??sistance contre les d??g??ts de givre." },
                RESISTANCE_SHADOW       = { name = "R??sistance ombre", description = "Augmente votre r??sistance contre les d??g??ts d'ombre." },
                RESISTANCE_ARCANE       = { name = "R??sistance arcanes", description = "Augmente votre r??sistance contre les d??g??ts des arcanes." },
                ATTACK_POWER            = { name = "Puissance d'attaque (m??l??e)", description = "Augmente les d??g??ts inflig??s avec des armes de m??l??e." },
                ATTACK_POWER_RANGED     = { name = "Puissance d'attaque (distance)", description = "Augmente les d??g??ts inflig??s avec des armes ?? distance." },
                DAMAGE_MAINHAND         = { name = "D??g??ts (main principale)", description = "Augmente les d??g??ts de l'arme en main principale." },
                DAMAGE_OFFHAND          = { name = "D??g??ts (main secondaire)", description = "Augmente les d??g??ts de l'arme en main secondaire." },
                DAMAGE_RANGED           = { name = "D??g??ts (distance)", description = "Augmente les d??g??ts de l'arme ?? distance." },
            },

            -- Aura Bonuses
            AURA = {
                LOOT                    = { name = "Bonus de butin", description = "Augmente vos chances d'obtenir du butin de meilleure qualit??." },
                REPUTATION              = { name = "Bonus de r??putation", description = "Augmente les points de r??putation gagn??s aupr??s des factions." },
                EXPERIENCE              = { name = "Bonus d'exp??rience", description = "Multiplie les points d'exp??rience gagn??s." },
                GOLD                    = { name = "Bonus d'or", description = "Augmente la quantit?? d'or obtenue des ennemis." },
                MOVE_SPEED              = { name = "Bonus de vitesse", description = "Augmente votre vitesse de d??placement." },
            }
        }
    },
    ["enUS"] = {
        EXPERIENCE_TEXT = "Experience %d / %d",
        PARAGON_EXPERIENCE_TEXT = "Paragon %d / %d (%d%%)",
        STATISTICS_TEXT = "Statistics",
        SHOW_MAINMENU_XP_LABEL = "Show XP bar on main interface",
        SHOW_MAINMENU_XP_TOOLTIP = "If checked, displays the Paragon experience bar above your character's XP bar at the bottom of the screen.",

        -- ========================================================================
        -- CATEGORY NAMES
        -- ========================================================================
        DEFENSE_TEXT = "Defense",
        ATTACK_TEXT = "Attack",
        MAGIC_TEXT = "Magic",
        OTHER_TEXT = "Other",

        -- ========================================================================
        -- TOOLTIPS
        -- ========================================================================
        TOOLTIP_INSTRUCTIONS = "Left/Right click to add/remove one point.\nScroll up/down to add/remove several.\nMiddle click for quick assignment.",
        TOOLTIP_LIMIT = "Limit: %d",

        -- ========================================================================
        -- POINTS DISPLAY
        -- ========================================================================
        POINTS_TO_SPEND = "(%d %s to spend)",
        POINTS_SINGULAR = "point",
        POINTS_PLURAL = "points",

        -- ========================================================================
        -- POPUP DIALOGS
        -- ========================================================================
        POPUP_CHOOSE_ACTION = "Do you want to add or remove points?",
        POPUP_BUTTON_ADD = "Add",
        POPUP_BUTTON_REMOVE = "Remove",
        POPUP_ENTER_AMOUNT = "How many points do you want to %s in %s?",
        POPUP_ACTION_ADD = "add",
        POPUP_ACTION_REMOVE = "remove",
        POPUP_BUTTON_CONFIRM = "Confirm",
        POPUP_BUTTON_CANCEL = "Cancel",

        -- ========================================================================
        -- APPLY BUTTON
        -- ========================================================================
        APPLY_BUTTON_TEXT = "Apply",

        -- ========================================================================
        -- NOTIFICATION BADGE
        -- ========================================================================
        NOTIFICATION_TITLE = "Unspent Paragon Points",
        NOTIFICATION_MESSAGE = "You have unspent Paragon points!",
        NOTIFICATION_DISMISS = "Click to dismiss this notification.",

        -- ========================================================================
        -- TUTORIAL MODE
        -- ========================================================================
        BUTTON_HELP = "?",
        TUTORIAL_TITLE = "Help - Paragon Interface",
        TUTORIAL_BUTTON_NEXT = "Next",
        TUTORIAL_BUTTON_PREVIOUS = "Previous",
        TUTORIAL_BUTTON_CLOSE = "Close",
        TUTORIAL_BUTTON_FINISH = "Finish",
        TUTORIAL_STEP_COUNTER = "Step %d/%d",
        TUTORIAL_COMPLETE = "Tutorial complete!",
        TUTORIAL_LEVEL = "Paragon Level|nDisplays your current level in the Paragon system.",
        TUTORIAL_XP_BAR = "Paragon Experience Bar|nShows your progress to the next level.|nHover to see XP details.",
        TUTORIAL_POINTS = "Available Points|nPoints you can spend on statistics.|nEarned by leveling up.",
        TUTORIAL_HELP_BUTTON = "Help Button|nRestarts this tutorial at any time.|nClick to show this help.",
        TUTORIAL_CATEGORIES = "Stat Categories|nThematic groups: Defense, Attack, Magic, Other.|nEach category contains specific stats.",
        TUTORIAL_STATS = "Stat Interactions|n|nLeft click: +1 point|nRight click: -1 point|nScroll up: +5 points|nScroll down: -5 points|nMiddle click: Quick assignment|n|nHover a stat to see its description.",

        -- ========================================================================
        -- STATISTICS
        -- ========================================================================
        STATISTICS = {
            -- Combat Rating Statistics
            COMBAT_RATING = {
                WEAPON_SKILL            = { name = "Weapon Skill", description = "Increases your skill with all weapons." },
                DEFENSE_SKILL           = { name = "Defense Skill", description = "Increases your defense skill against attacks." },
                DODGE                   = { name = "Dodge", description = "Increases your dodge rating." },
                PARRY                   = { name = "Parry", description = "Increases your parry rating." },
                BLOCK                   = { name = "Block", description = "Increases your block rating." },
                HIT_MELEE               = { name = "Hit (Melee)", description = "Increases your melee hit chance." },
                HIT_RANGED              = { name = "Hit (Ranged)", description = "Increases your ranged hit chance." },
                HIT_SPELL               = { name = "Hit (Spell)", description = "Increases your spell hit chance." },
                CRIT_MELEE              = { name = "Critical (Melee)", description = "Increases your melee critical chance." },
                CRIT_RANGED             = { name = "Critical (Ranged)", description = "Increases your ranged critical chance." },
                CRIT_SPELL              = { name = "Critical (Spell)", description = "Increases your spell critical chance." },
                HIT_TAKEN_MELEE         = { name = "Hit Taken (Melee)", description = "Increases chance to be hit by melee attacks." },
                HIT_TAKEN_RANGED        = { name = "Hit Taken (Ranged)", description = "Increases chance to be hit by ranged attacks." },
                HIT_TAKEN_SPELL         = { name = "Hit Taken (Spell)", description = "Increases chance to be hit by spells." },
                CRIT_TAKEN_MELEE        = { name = "Critical Taken (Melee)", description = "Increases chance to receive melee criticals." },
                CRIT_TAKEN_RANGED       = { name = "Critical Taken (Ranged)", description = "Increases chance to receive ranged criticals." },
                CRIT_TAKEN_SPELL        = { name = "Critical Taken (Spell)", description = "Increases chance to receive spell criticals." },
                HASTE_MELEE             = { name = "Haste (Melee)", description = "Increases your melee attack speed." },
                HASTE_RANGED            = { name = "Haste (Ranged)", description = "Increases your ranged attack speed." },
                HASTE_SPELL             = { name = "Haste (Spell)", description = "Increases your spell casting speed." },
                WEAPON_SKILL_MAINHAND   = { name = "Skill (Main Hand)", description = "Increases your main hand weapon skill." },
                WEAPON_SKILL_OFFHAND    = { name = "Skill (Off Hand)", description = "Increases your off hand weapon skill." },
                WEAPON_SKILL_RANGED     = { name = "Skill (Ranged)", description = "Increases your ranged weapon skill." },
                EXPERTISE               = { name = "Expertise", description = "Reduces target's dodge and parry chances." },
                ARMOR_PENETRATION       = { name = "Armor Penetration", description = "Ignores a percentage of the target's armor." },
            },

            -- Unit Modifier Statistics
            UNIT_MODS = {
                STAT_STRENGTH           = { name = "Strength", description = "Increases your Strength, improving melee attack power." },
                STAT_AGILITY            = { name = "Agility", description = "Increases your Agility, improving ranged attack power, dodge, and critical chance." },
                STAT_STAMINA            = { name = "Stamina", description = "Increases your Stamina, improving health pool." },
                STAT_INTELLECT          = { name = "Intellect", description = "Increases your Intellect, improving spell power and mana pool." },
                STAT_SPIRIT             = { name = "Spirit", description = "Increases your Spirit, improving mana and health regeneration." },
                HEALTH                  = { name = "Health", description = "Increases your health pool." },
                MANA                    = { name = "Mana", description = "Increases your mana pool." },
                RAGE                    = { name = "Rage", description = "Increases your rage generation (warriors and druids)." },
                FOCUS                   = { name = "Focus", description = "Increases your focus pool (hunters)." },
                ENERGY                  = { name = "Energy", description = "Increases your energy regeneration (rogues and druids)." },
                HAPPINESS               = { name = "Happiness", description = "Increases your pet's happiness (hunters)." },
                RUNE                    = { name = "Runes", description = "Increases rune regeneration (death knights)." },
                RUNIC_POWER             = { name = "Runic Power", description = "Increases your runic power pool (death knights)." },
                ARMOR                   = { name = "Armor", description = "Increases your armor value, reducing physical damage taken." },
                RESISTANCE_HOLY         = { name = "Holy Resistance", description = "Increases your resistance to holy damage." },
                RESISTANCE_FIRE         = { name = "Fire Resistance", description = "Increases your resistance to fire damage." },
                RESISTANCE_NATURE       = { name = "Nature Resistance", description = "Increases your resistance to nature damage." },
                RESISTANCE_FROST        = { name = "Frost Resistance", description = "Increases your resistance to frost damage." },
                RESISTANCE_SHADOW       = { name = "Shadow Resistance", description = "Increases your resistance to shadow damage." },
                RESISTANCE_ARCANE       = { name = "Arcane Resistance", description = "Increases your resistance to arcane damage." },
                ATTACK_POWER            = { name = "Attack Power (Melee)", description = "Increases damage dealt with melee weapons." },
                ATTACK_POWER_RANGED     = { name = "Attack Power (Ranged)", description = "Increases damage dealt with ranged weapons." },
                DAMAGE_MAINHAND         = { name = "Damage (Main Hand)", description = "Increases main hand weapon damage." },
                DAMAGE_OFFHAND          = { name = "Damage (Off Hand)", description = "Increases off hand weapon damage." },
                DAMAGE_RANGED           = { name = "Damage (Ranged)", description = "Increases ranged weapon damage." },
            },

            -- Aura Bonuses
            AURA = {
                LOOT                    = { name = "Loot Bonus", description = "Increases your chances to obtain better quality loot." },
                REPUTATION              = { name = "Reputation Bonus", description = "Increases reputation points gained with factions." },
                EXPERIENCE              = { name = "Experience Bonus", description = "Multiplies experience points gained." },
                GOLD                    = { name = "Gold Bonus", description = "Increases the amount of gold obtained from enemies." },
                MOVE_SPEED              = { name = "Speed Bonus", description = "Increases your movement speed." },
            }
        }
    },
    ["deDE"] = {
        EXPERIENCE_TEXT = "Experience %d / %d",
        PARAGON_EXPERIENCE_TEXT = "Paragon %d / %d (%d%%)",
        STATISTICS_TEXT = "Statistics",
        SHOW_MAINMENU_XP_LABEL = "XP-Leiste auf Hauptinterface anzeigen",
        SHOW_MAINMENU_XP_TOOLTIP = "Wenn aktiviert, wird die Paragon-Erfahrungsleiste ??ber der Charakterleiste am unteren Bildschirmrand angezeigt.",

        -- ========================================================================
        -- CATEGORY NAMES (Custom translations)
        -- ========================================================================
        DEFENSE_TEXT = "Defense",
        ATTACK_TEXT = "Attack",
        MAGIC_TEXT = "Magic",
        OTHER_TEXT = "Other",

        -- Tooltip instructions
        TOOLTIP_INSTRUCTIONS = "Left/Right click to add/remove one point.\nScroll up/down to add/remove several.\nMiddle click for quick assignment.",
        TOOLTIP_LIMIT = "Limit: %d",

        -- Points display
        POINTS_TO_SPEND = "(%d %s to spend)",
        POINTS_SINGULAR = "point",
        POINTS_PLURAL = "points",

        -- Popup dialogs
        POPUP_CHOOSE_ACTION = "Do you want to add or remove points?",
        POPUP_BUTTON_ADD = "Add",
        POPUP_BUTTON_REMOVE = "Remove",
        POPUP_ENTER_AMOUNT = "How many points do you want to %s in %s?",
        POPUP_ACTION_ADD = "add",
        POPUP_ACTION_REMOVE = "remove",
        POPUP_BUTTON_CONFIRM = "Confirm",
        POPUP_BUTTON_CANCEL = "Cancel",

        -- ========================================================================
        -- TUTORIAL MODE
        -- ========================================================================
        BUTTON_HELP = "?",
        TUTORIAL_TITLE = "Help - Paragon Interface",
        TUTORIAL_BUTTON_NEXT = "Next",
        TUTORIAL_BUTTON_PREVIOUS = "Previous",
        TUTORIAL_BUTTON_CLOSE = "Close",
        TUTORIAL_BUTTON_FINISH = "Finish",
        TUTORIAL_STEP_COUNTER = "Step %d/%d",
        TUTORIAL_COMPLETE = "Tutorial complete!",
        TUTORIAL_LEVEL = "Paragon Level|nDisplays your current level in the Paragon system.",
        TUTORIAL_XP_BAR = "Paragon Experience Bar|nShows your progress to the next level.|nHover to see XP details.",
        TUTORIAL_POINTS = "Available Points|nPoints you can spend on statistics.|nEarned by leveling up.",
        TUTORIAL_HELP_BUTTON = "Help Button|nRestarts this tutorial at any time.|nClick to show this help.",
        TUTORIAL_CATEGORIES = "Stat Categories|nThematic groups: Defense, Attack, Magic, Other.|nEach category contains specific stats.",
        TUTORIAL_STATS = "Stat Interactions|n|nLeft click: +1 point|nRight click: -1 point|nScroll up: +5 points|nScroll down: -5 points|nMiddle click: Quick assignment|n|nHover a stat to see its description.",

        -- ========================================================================
        -- STATISTICS
        -- ========================================================================
        STATISTICS = {
            -- Combat Rating Statistics
            COMBAT_RATING = {
                WEAPON_SKILL            = { name = "Weapon Skill", description = "Increases your skill with all weapons." },
                DEFENSE_SKILL           = { name = "Defense Skill", description = "Increases your defense skill against attacks." },
                DODGE                   = { name = "Dodge", description = "Increases your dodge rating." },
                PARRY                   = { name = "Parry", description = "Increases your parry rating." },
                BLOCK                   = { name = "Block", description = "Increases your block rating." },
                HIT_MELEE               = { name = "Hit (Melee)", description = "Increases your melee hit chance." },
                HIT_RANGED              = { name = "Hit (Ranged)", description = "Increases your ranged hit chance." },
                HIT_SPELL               = { name = "Hit (Spell)", description = "Increases your spell hit chance." },
                CRIT_MELEE              = { name = "Critical (Melee)", description = "Increases your melee critical chance." },
                CRIT_RANGED             = { name = "Critical (Ranged)", description = "Increases your ranged critical chance." },
                CRIT_SPELL              = { name = "Critical (Spell)", description = "Increases your spell critical chance." },
                HIT_TAKEN_MELEE         = { name = "Hit Taken (Melee)", description = "Increases chance to be hit by melee attacks." },
                HIT_TAKEN_RANGED        = { name = "Hit Taken (Ranged)", description = "Increases chance to be hit by ranged attacks." },
                HIT_TAKEN_SPELL         = { name = "Hit Taken (Spell)", description = "Increases chance to be hit by spells." },
                CRIT_TAKEN_MELEE        = { name = "Critical Taken (Melee)", description = "Increases chance to receive melee criticals." },
                CRIT_TAKEN_RANGED       = { name = "Critical Taken (Ranged)", description = "Increases chance to receive ranged criticals." },
                CRIT_TAKEN_SPELL        = { name = "Critical Taken (Spell)", description = "Increases chance to receive spell criticals." },
                HASTE_MELEE             = { name = "Haste (Melee)", description = "Increases your melee attack speed." },
                HASTE_RANGED            = { name = "Haste (Ranged)", description = "Increases your ranged attack speed." },
                HASTE_SPELL             = { name = "Haste (Spell)", description = "Increases your spell casting speed." },
                WEAPON_SKILL_MAINHAND   = { name = "Skill (Main Hand)", description = "Increases your main hand weapon skill." },
                WEAPON_SKILL_OFFHAND    = { name = "Skill (Off Hand)", description = "Increases your off hand weapon skill." },
                WEAPON_SKILL_RANGED     = { name = "Skill (Ranged)", description = "Increases your ranged weapon skill." },
                EXPERTISE               = { name = "Expertise", description = "Reduces target's dodge and parry chances." },
                ARMOR_PENETRATION       = { name = "Armor Penetration", description = "Ignores a percentage of the target's armor." },
            },

            -- Unit Modifier Statistics
            UNIT_MODS = {
                STAT_STRENGTH           = { name = "Strength", description = "Increases your Strength, improving melee attack power." },
                STAT_AGILITY            = { name = "Agility", description = "Increases your Agility, improving ranged attack power, dodge, and critical chance." },
                STAT_STAMINA            = { name = "Stamina", description = "Increases your Stamina, improving health pool." },
                STAT_INTELLECT          = { name = "Intellect", description = "Increases your Intellect, improving spell power and mana pool." },
                STAT_SPIRIT             = { name = "Spirit", description = "Increases your Spirit, improving mana and health regeneration." },
                HEALTH                  = { name = "Health", description = "Increases your health pool." },
                MANA                    = { name = "Mana", description = "Increases your mana pool." },
                RAGE                    = { name = "Rage", description = "Increases your rage generation (warriors and druids)." },
                FOCUS                   = { name = "Focus", description = "Increases your focus pool (hunters)." },
                ENERGY                  = { name = "Energy", description = "Increases your energy regeneration (rogues and druids)." },
                HAPPINESS               = { name = "Happiness", description = "Increases your pet's happiness (hunters)." },
                RUNE                    = { name = "Runes", description = "Increases rune regeneration (death knights)." },
                RUNIC_POWER             = { name = "Runic Power", description = "Increases your runic power pool (death knights)." },
                ARMOR                   = { name = "Armor", description = "Increases your armor value, reducing physical damage taken." },
                RESISTANCE_HOLY         = { name = "Holy Resistance", description = "Increases your resistance to holy damage." },
                RESISTANCE_FIRE         = { name = "Fire Resistance", description = "Increases your resistance to fire damage." },
                RESISTANCE_NATURE       = { name = "Nature Resistance", description = "Increases your resistance to nature damage." },
                RESISTANCE_FROST        = { name = "Frost Resistance", description = "Increases your resistance to frost damage." },
                RESISTANCE_SHADOW       = { name = "Shadow Resistance", description = "Increases your resistance to shadow damage." },
                RESISTANCE_ARCANE       = { name = "Arcane Resistance", description = "Increases your resistance to arcane damage." },
                ATTACK_POWER            = { name = "Attack Power (Melee)", description = "Increases damage dealt with melee weapons." },
                ATTACK_POWER_RANGED     = { name = "Attack Power (Ranged)", description = "Increases damage dealt with ranged weapons." },
                DAMAGE_MAINHAND         = { name = "Damage (Main Hand)", description = "Increases main hand weapon damage." },
                DAMAGE_OFFHAND          = { name = "Damage (Off Hand)", description = "Increases off hand weapon damage." },
                DAMAGE_RANGED           = { name = "Damage (Ranged)", description = "Increases ranged weapon damage." },
            },

            -- Aura Bonuses
            AURA = {
                LOOT                    = { name = "Beutebonus", description = "Erh??ht Ihre Chancen, bessere Beute zu erhalten." },
                REPUTATION              = { name = "Rufbonus", description = "Erh??ht die gewonnenen Rufpunkte bei Fraktionen." },
                EXPERIENCE              = { name = "Erfahrungsbonus", description = "Multipliziert gewonnene Erfahrungspunkte." },
                GOLD                    = { name = "Goldbonus", description = "Erh??ht die Menge an Gold, die von Gegnern erhalten wird." },
                MOVE_SPEED              = { name = "Geschwindigkeitsbonus", description = "Erh??ht Ihre Bewegungsgeschwindigkeit." },
            }
        }
    },
    ["esES"] = {
        EXPERIENCE_TEXT = "Experience %d / %d",
        PARAGON_EXPERIENCE_TEXT = "Paragon %d / %d (%d%%)",
        SHOW_MAINMENU_XP_LABEL = "Mostrar barra de XP en interfaz principal",
        SHOW_MAINMENU_XP_TOOLTIP = "Si est?? marcado, muestra la barra de experiencia de Paragon encima de la barra de XP de tu personaje en la parte inferior de la pantalla.",
        STATISTICS_TEXT = "Statistics",

        -- ========================================================================
        -- CATEGORY NAMES (Custom translations)
        -- ========================================================================
        DEFENSE_TEXT = "Defense",
        ATTACK_TEXT = "Attack",
        MAGIC_TEXT = "Magic",
        OTHER_TEXT = "Other",

        -- Tooltip instructions
        TOOLTIP_INSTRUCTIONS = "Left/Right click to add/remove one point.\nScroll up/down to add/remove several.\nMiddle click for quick assignment.",
        TOOLTIP_LIMIT = "Limit: %d",

        -- Points display
        POINTS_TO_SPEND = "(%d %s to spend)",
        POINTS_SINGULAR = "point",
        POINTS_PLURAL = "points",

        -- Popup dialogs
        POPUP_CHOOSE_ACTION = "Do you want to add or remove points?",
        POPUP_BUTTON_ADD = "Add",
        POPUP_BUTTON_REMOVE = "Remove",
        POPUP_ENTER_AMOUNT = "How many points do you want to %s in %s?",
        POPUP_ACTION_ADD = "add",
        POPUP_ACTION_REMOVE = "remove",
        POPUP_BUTTON_CONFIRM = "Confirm",
        POPUP_BUTTON_CANCEL = "Cancel",

        -- ========================================================================
        -- TUTORIAL MODE
        -- ========================================================================
        BUTTON_HELP = "?",
        TUTORIAL_TITLE = "Help - Paragon Interface",
        TUTORIAL_BUTTON_NEXT = "Next",
        TUTORIAL_BUTTON_PREVIOUS = "Previous",
        TUTORIAL_BUTTON_CLOSE = "Close",
        TUTORIAL_BUTTON_FINISH = "Finish",
        TUTORIAL_STEP_COUNTER = "Step %d/%d",
        TUTORIAL_COMPLETE = "Tutorial complete!",
        TUTORIAL_LEVEL = "Paragon Level|nDisplays your current level in the Paragon system.",
        TUTORIAL_XP_BAR = "Paragon Experience Bar|nShows your progress to the next level.|nHover to see XP details.",
        TUTORIAL_POINTS = "Available Points|nPoints you can spend on statistics.|nEarned by leveling up.",
        TUTORIAL_HELP_BUTTON = "Help Button|nRestarts this tutorial at any time.|nClick to show this help.",
        TUTORIAL_CATEGORIES = "Stat Categories|nThematic groups: Defense, Attack, Magic, Other.|nEach category contains specific stats.",
        TUTORIAL_STATS = "Stat Interactions|n|nLeft click: +1 point|nRight click: -1 point|nScroll up: +5 points|nScroll down: -5 points|nMiddle click: Quick assignment|n|nHover a stat to see its description.",

        -- ========================================================================
        -- STATISTICS
        -- ========================================================================
        STATISTICS = {
            -- Combat Rating Statistics
            COMBAT_RATING = {
                WEAPON_SKILL            = { name = "Weapon Skill", description = "Increases your skill with all weapons." },
                DEFENSE_SKILL           = { name = "Defense Skill", description = "Increases your defense skill against attacks." },
                DODGE                   = { name = "Dodge", description = "Increases your dodge rating." },
                PARRY                   = { name = "Parry", description = "Increases your parry rating." },
                BLOCK                   = { name = "Block", description = "Increases your block rating." },
                HIT_MELEE               = { name = "Hit (Melee)", description = "Increases your melee hit chance." },
                HIT_RANGED              = { name = "Hit (Ranged)", description = "Increases your ranged hit chance." },
                HIT_SPELL               = { name = "Hit (Spell)", description = "Increases your spell hit chance." },
                CRIT_MELEE              = { name = "Critical (Melee)", description = "Increases your melee critical chance." },
                CRIT_RANGED             = { name = "Critical (Ranged)", description = "Increases your ranged critical chance." },
                CRIT_SPELL              = { name = "Critical (Spell)", description = "Increases your spell critical chance." },
                HIT_TAKEN_MELEE         = { name = "Hit Taken (Melee)", description = "Increases chance to be hit by melee attacks." },
                HIT_TAKEN_RANGED        = { name = "Hit Taken (Ranged)", description = "Increases chance to be hit by ranged attacks." },
                HIT_TAKEN_SPELL         = { name = "Hit Taken (Spell)", description = "Increases chance to be hit by spells." },
                CRIT_TAKEN_MELEE        = { name = "Critical Taken (Melee)", description = "Increases chance to receive melee criticals." },
                CRIT_TAKEN_RANGED       = { name = "Critical Taken (Ranged)", description = "Increases chance to receive ranged criticals." },
                CRIT_TAKEN_SPELL        = { name = "Critical Taken (Spell)", description = "Increases chance to receive spell criticals." },
                HASTE_MELEE             = { name = "Haste (Melee)", description = "Increases your melee attack speed." },
                HASTE_RANGED            = { name = "Haste (Ranged)", description = "Increases your ranged attack speed." },
                HASTE_SPELL             = { name = "Haste (Spell)", description = "Increases your spell casting speed." },
                WEAPON_SKILL_MAINHAND   = { name = "Skill (Main Hand)", description = "Increases your main hand weapon skill." },
                WEAPON_SKILL_OFFHAND    = { name = "Skill (Off Hand)", description = "Increases your off hand weapon skill." },
                WEAPON_SKILL_RANGED     = { name = "Skill (Ranged)", description = "Increases your ranged weapon skill." },
                EXPERTISE               = { name = "Expertise", description = "Reduces target's dodge and parry chances." },
                ARMOR_PENETRATION       = { name = "Armor Penetration", description = "Ignores a percentage of the target's armor." },
            },

            -- Unit Modifier Statistics
            UNIT_MODS = {
                STAT_STRENGTH           = { name = "Strength", description = "Increases your Strength, improving melee attack power." },
                STAT_AGILITY            = { name = "Agility", description = "Increases your Agility, improving ranged attack power, dodge, and critical chance." },
                STAT_STAMINA            = { name = "Stamina", description = "Increases your Stamina, improving health pool." },
                STAT_INTELLECT          = { name = "Intellect", description = "Increases your Intellect, improving spell power and mana pool." },
                STAT_SPIRIT             = { name = "Spirit", description = "Increases your Spirit, improving mana and health regeneration." },
                HEALTH                  = { name = "Health", description = "Increases your health pool." },
                MANA                    = { name = "Mana", description = "Increases your mana pool." },
                RAGE                    = { name = "Rage", description = "Increases your rage generation (warriors and druids)." },
                FOCUS                   = { name = "Focus", description = "Increases your focus pool (hunters)." },
                ENERGY                  = { name = "Energy", description = "Increases your energy regeneration (rogues and druids)." },
                HAPPINESS               = { name = "Happiness", description = "Increases your pet's happiness (hunters)." },
                RUNE                    = { name = "Runes", description = "Increases rune regeneration (death knights)." },
                RUNIC_POWER             = { name = "Runic Power", description = "Increases your runic power pool (death knights)." },
                ARMOR                   = { name = "Armor", description = "Increases your armor value, reducing physical damage taken." },
                RESISTANCE_HOLY         = { name = "Holy Resistance", description = "Increases your resistance to holy damage." },
                RESISTANCE_FIRE         = { name = "Fire Resistance", description = "Increases your resistance to fire damage." },
                RESISTANCE_NATURE       = { name = "Nature Resistance", description = "Increases your resistance to nature damage." },
                RESISTANCE_FROST        = { name = "Frost Resistance", description = "Increases your resistance to frost damage." },
                RESISTANCE_SHADOW       = { name = "Shadow Resistance", description = "Increases your resistance to shadow damage." },
                RESISTANCE_ARCANE       = { name = "Arcane Resistance", description = "Increases your resistance to arcane damage." },
                ATTACK_POWER            = { name = "Attack Power (Melee)", description = "Increases damage dealt with melee weapons." },
                ATTACK_POWER_RANGED     = { name = "Attack Power (Ranged)", description = "Increases damage dealt with ranged weapons." },
                DAMAGE_MAINHAND         = { name = "Damage (Main Hand)", description = "Increases main hand weapon damage." },
                DAMAGE_OFFHAND          = { name = "Damage (Off Hand)", description = "Increases off hand weapon damage." },
                DAMAGE_RANGED           = { name = "Damage (Ranged)", description = "Increases ranged weapon damage." },
            },

            -- Aura Bonuses
            AURA = {
                LOOT                    = { name = "Bonus de bot??n", description = "Aumenta tus posibilidades de obtener bot??n de mejor calidad." },
                REPUTATION              = { name = "Bonus de reputaci??n", description = "Aumenta los puntos de reputaci??n ganados con facciones." },
                EXPERIENCE              = { name = "Bonus de experiencia", description = "Multiplica los puntos de experiencia ganados." },
                GOLD                    = { name = "Bonus de oro", description = "Aumenta la cantidad de oro obtenido de enemigos." },
                MOVE_SPEED              = { name = "Bonus de velocidad", description = "Aumenta tu velocidad de movimiento." },
            }
        }
    },
    ["ruRU"] = {
        EXPERIENCE_TEXT = "Experience %d / %d",
        PARAGON_EXPERIENCE_TEXT = "Paragon %d / %d (%d%%)",
        SHOW_MAINMENU_XP_LABEL = "???????????????? ???????????? ?????????? ???? ???????????????? ????????????????????",
        SHOW_MAINMENU_XP_TOOLTIP = "???????? ????????????????, ???????????????????? ???????????? ?????????? ???????????????? ?????? ?????????????? ?????????? ???????????? ?????????????????? ?? ???????????? ?????????? ????????????.",
        STATISTICS_TEXT = "Statistics",

        -- ========================================================================
        -- CATEGORY NAMES (Custom translations)
        -- ========================================================================
        DEFENSE_TEXT = "Defense",
        ATTACK_TEXT = "Attack",
        MAGIC_TEXT = "Magic",
        OTHER_TEXT = "Other",

        -- Tooltip instructions
        TOOLTIP_INSTRUCTIONS = "Left/Right click to add/remove one point.\nScroll up/down to add/remove several.\nMiddle click for quick assignment.",
        TOOLTIP_LIMIT = "Limit: %d",

        -- Points display
        POINTS_TO_SPEND = "(%d %s to spend)",
        POINTS_SINGULAR = "point",
        POINTS_PLURAL = "points",

        -- Popup dialogs
        POPUP_CHOOSE_ACTION = "Do you want to add or remove points?",
        POPUP_BUTTON_ADD = "Add",
        POPUP_BUTTON_REMOVE = "Remove",
        POPUP_ENTER_AMOUNT = "How many points do you want to %s in %s?",
        POPUP_ACTION_ADD = "add",
        POPUP_ACTION_REMOVE = "remove",
        POPUP_BUTTON_CONFIRM = "Confirm",
        POPUP_BUTTON_CANCEL = "Cancel",

        -- ========================================================================
        -- TUTORIAL MODE
        -- ========================================================================
        BUTTON_HELP = "?",
        TUTORIAL_TITLE = "Help - Paragon Interface",
        TUTORIAL_BUTTON_NEXT = "Next",
        TUTORIAL_BUTTON_PREVIOUS = "Previous",
        TUTORIAL_BUTTON_CLOSE = "Close",
        TUTORIAL_BUTTON_FINISH = "Finish",
        TUTORIAL_STEP_COUNTER = "Step %d/%d",
        TUTORIAL_COMPLETE = "Tutorial complete!",
        TUTORIAL_LEVEL = "Paragon Level|nDisplays your current level in the Paragon system.",
        TUTORIAL_XP_BAR = "Paragon Experience Bar|nShows your progress to the next level.|nHover to see XP details.",
        TUTORIAL_POINTS = "Available Points|nPoints you can spend on statistics.|nEarned by leveling up.",
        TUTORIAL_HELP_BUTTON = "Help Button|nRestarts this tutorial at any time.|nClick to show this help.",
        TUTORIAL_CATEGORIES = "Stat Categories|nThematic groups: Defense, Attack, Magic, Other.|nEach category contains specific stats.",
        TUTORIAL_STATS = "Stat Interactions|n|nLeft click: +1 point|nRight click: -1 point|nScroll up: +5 points|nScroll down: -5 points|nMiddle click: Quick assignment|n|nHover a stat to see its description.",

        -- ========================================================================
        -- STATISTICS
        -- ========================================================================
        STATISTICS = {
            -- Combat Rating Statistics
            COMBAT_RATING = {
                WEAPON_SKILL            = { name = "Weapon Skill", description = "Increases your skill with all weapons." },
                DEFENSE_SKILL           = { name = "Defense Skill", description = "Increases your defense skill against attacks." },
                DODGE                   = { name = "Dodge", description = "Increases your dodge rating." },
                PARRY                   = { name = "Parry", description = "Increases your parry rating." },
                BLOCK                   = { name = "Block", description = "Increases your block rating." },
                HIT_MELEE               = { name = "Hit (Melee)", description = "Increases your melee hit chance." },
                HIT_RANGED              = { name = "Hit (Ranged)", description = "Increases your ranged hit chance." },
                HIT_SPELL               = { name = "Hit (Spell)", description = "Increases your spell hit chance." },
                CRIT_MELEE              = { name = "Critical (Melee)", description = "Increases your melee critical chance." },
                CRIT_RANGED             = { name = "Critical (Ranged)", description = "Increases your ranged critical chance." },
                CRIT_SPELL              = { name = "Critical (Spell)", description = "Increases your spell critical chance." },
                HIT_TAKEN_MELEE         = { name = "Hit Taken (Melee)", description = "Increases chance to be hit by melee attacks." },
                HIT_TAKEN_RANGED        = { name = "Hit Taken (Ranged)", description = "Increases chance to be hit by ranged attacks." },
                HIT_TAKEN_SPELL         = { name = "Hit Taken (Spell)", description = "Increases chance to be hit by spells." },
                CRIT_TAKEN_MELEE        = { name = "Critical Taken (Melee)", description = "Increases chance to receive melee criticals." },
                CRIT_TAKEN_RANGED       = { name = "Critical Taken (Ranged)", description = "Increases chance to receive ranged criticals." },
                CRIT_TAKEN_SPELL        = { name = "Critical Taken (Spell)", description = "Increases chance to receive spell criticals." },
                HASTE_MELEE             = { name = "Haste (Melee)", description = "Increases your melee attack speed." },
                HASTE_RANGED            = { name = "Haste (Ranged)", description = "Increases your ranged attack speed." },
                HASTE_SPELL             = { name = "Haste (Spell)", description = "Increases your spell casting speed." },
                WEAPON_SKILL_MAINHAND   = { name = "Skill (Main Hand)", description = "Increases your main hand weapon skill." },
                WEAPON_SKILL_OFFHAND    = { name = "Skill (Off Hand)", description = "Increases your off hand weapon skill." },
                WEAPON_SKILL_RANGED     = { name = "Skill (Ranged)", description = "Increases your ranged weapon skill." },
                EXPERTISE               = { name = "Expertise", description = "Reduces target's dodge and parry chances." },
                ARMOR_PENETRATION       = { name = "Armor Penetration", description = "Ignores a percentage of the target's armor." },
            },

            -- Unit Modifier Statistics
            UNIT_MODS = {
                STAT_STRENGTH           = { name = "Strength", description = "Increases your Strength, improving melee attack power." },
                STAT_AGILITY            = { name = "Agility", description = "Increases your Agility, improving ranged attack power, dodge, and critical chance." },
                STAT_STAMINA            = { name = "Stamina", description = "Increases your Stamina, improving health pool." },
                STAT_INTELLECT          = { name = "Intellect", description = "Increases your Intellect, improving spell power and mana pool." },
                STAT_SPIRIT             = { name = "Spirit", description = "Increases your Spirit, improving mana and health regeneration." },
                HEALTH                  = { name = "Health", description = "Increases your health pool." },
                MANA                    = { name = "Mana", description = "Increases your mana pool." },
                RAGE                    = { name = "Rage", description = "Increases your rage generation (warriors and druids)." },
                FOCUS                   = { name = "Focus", description = "Increases your focus pool (hunters)." },
                ENERGY                  = { name = "Energy", description = "Increases your energy regeneration (rogues and druids)." },
                HAPPINESS               = { name = "Happiness", description = "Increases your pet's happiness (hunters)." },
                RUNE                    = { name = "Runes", description = "Increases rune regeneration (death knights)." },
                RUNIC_POWER             = { name = "Runic Power", description = "Increases your runic power pool (death knights)." },
                ARMOR                   = { name = "Armor", description = "Increases your armor value, reducing physical damage taken." },
                RESISTANCE_HOLY         = { name = "Holy Resistance", description = "Increases your resistance to holy damage." },
                RESISTANCE_FIRE         = { name = "Fire Resistance", description = "Increases your resistance to fire damage." },
                RESISTANCE_NATURE       = { name = "Nature Resistance", description = "Increases your resistance to nature damage." },
                RESISTANCE_FROST        = { name = "Frost Resistance", description = "Increases your resistance to frost damage." },
                RESISTANCE_SHADOW       = { name = "Shadow Resistance", description = "Increases your resistance to shadow damage." },
                RESISTANCE_ARCANE       = { name = "Arcane Resistance", description = "Increases your resistance to arcane damage." },
                ATTACK_POWER            = { name = "Attack Power (Melee)", description = "Increases damage dealt with melee weapons." },
                ATTACK_POWER_RANGED     = { name = "Attack Power (Ranged)", description = "Increases damage dealt with ranged weapons." },
                DAMAGE_MAINHAND         = { name = "Damage (Main Hand)", description = "Increases main hand weapon damage." },
                DAMAGE_OFFHAND          = { name = "Damage (Off Hand)", description = "Increases off hand weapon damage." },
                DAMAGE_RANGED           = { name = "Damage (Ranged)", description = "Increases ranged weapon damage." },
            },

            -- Aura Bonuses
            AURA = {
                LOOT                    = { name = "?????????? ????????????", description = "?????????????????????? ???????? ?????????? ???????????????? ???????????? ?????????????? ????????????????." },
                REPUTATION              = { name = "?????????? ??????????????????", description = "?????????????????????? ???????? ??????????????????, ???????????????????? ???? ??????????????." },
                EXPERIENCE              = { name = "?????????? ??????????", description = "???????????????? ???????????????????? ???????? ??????????." },
                GOLD                    = { name = "?????????? ????????????", description = "?????????????????????? ???????????????????? ????????????, ?????????????????????? ?? ????????????." },
                MOVE_SPEED              = { name = "?????????? ????????????????", description = "?????????????????????? ???????? ???????????????? ????????????????????????." },
            }
        }
    },
    ["ptBR"] = {
        EXPERIENCE_TEXT = "Experience %d / %d",
        PARAGON_EXPERIENCE_TEXT = "Paragon %d / %d (%d%%)",
        SHOW_MAINMENU_XP_LABEL = "Mostrar barra de XP na interface principal",
        SHOW_MAINMENU_XP_TOOLTIP = "Se marcado, exibe a barra de experi??ncia Paragon acima da barra de XP do seu personagem na parte inferior da tela.",
        STATISTICS_TEXT = "Statistics",

        -- ========================================================================
        -- CATEGORY NAMES (Custom translations)
        -- ========================================================================
        DEFENSE_TEXT = "Defense",
        ATTACK_TEXT = "Attack",
        MAGIC_TEXT = "Magic",
        OTHER_TEXT = "Other",

        -- Tooltip instructions
        TOOLTIP_INSTRUCTIONS = "Left/Right click to add/remove one point.\nScroll up/down to add/remove several.\nMiddle click for quick assignment.",
        TOOLTIP_LIMIT = "Limit: %d",

        -- Points display
        POINTS_TO_SPEND = "(%d %s to spend)",
        POINTS_SINGULAR = "point",
        POINTS_PLURAL = "points",

        -- Popup dialogs
        POPUP_CHOOSE_ACTION = "Do you want to add or remove points?",
        POPUP_BUTTON_ADD = "Add",
        POPUP_BUTTON_REMOVE = "Remove",
        POPUP_ENTER_AMOUNT = "How many points do you want to %s in %s?",
        POPUP_ACTION_ADD = "add",
        POPUP_ACTION_REMOVE = "remove",
        POPUP_BUTTON_CONFIRM = "Confirm",
        POPUP_BUTTON_CANCEL = "Cancel",

        -- ========================================================================
        -- TUTORIAL MODE
        -- ========================================================================
        BUTTON_HELP = "?",
        TUTORIAL_TITLE = "Help - Paragon Interface",
        TUTORIAL_BUTTON_NEXT = "Next",
        TUTORIAL_BUTTON_PREVIOUS = "Previous",
        TUTORIAL_BUTTON_CLOSE = "Close",
        TUTORIAL_BUTTON_FINISH = "Finish",
        TUTORIAL_STEP_COUNTER = "Step %d/%d",
        TUTORIAL_COMPLETE = "Tutorial complete!",
        TUTORIAL_LEVEL = "Paragon Level|nDisplays your current level in the Paragon system.",
        TUTORIAL_XP_BAR = "Paragon Experience Bar|nShows your progress to the next level.|nHover to see XP details.",
        TUTORIAL_POINTS = "Available Points|nPoints you can spend on statistics.|nEarned by leveling up.",
        TUTORIAL_HELP_BUTTON = "Help Button|nRestarts this tutorial at any time.|nClick to show this help.",
        TUTORIAL_CATEGORIES = "Stat Categories|nThematic groups: Defense, Attack, Magic, Other.|nEach category contains specific stats.",
        TUTORIAL_STATS = "Stat Interactions|n|nLeft click: +1 point|nRight click: -1 point|nScroll up: +5 points|nScroll down: -5 points|nMiddle click: Quick assignment|n|nHover a stat to see its description.",

        -- ========================================================================
        -- STATISTICS
        -- ========================================================================
        STATISTICS = {
            -- Combat Rating Statistics
            COMBAT_RATING = {
                WEAPON_SKILL            = { name = "Weapon Skill", description = "Increases your skill with all weapons." },
                DEFENSE_SKILL           = { name = "Defense Skill", description = "Increases your defense skill against attacks." },
                DODGE                   = { name = "Dodge", description = "Increases your dodge rating." },
                PARRY                   = { name = "Parry", description = "Increases your parry rating." },
                BLOCK                   = { name = "Block", description = "Increases your block rating." },
                HIT_MELEE               = { name = "Hit (Melee)", description = "Increases your melee hit chance." },
                HIT_RANGED              = { name = "Hit (Ranged)", description = "Increases your ranged hit chance." },
                HIT_SPELL               = { name = "Hit (Spell)", description = "Increases your spell hit chance." },
                CRIT_MELEE              = { name = "Critical (Melee)", description = "Increases your melee critical chance." },
                CRIT_RANGED             = { name = "Critical (Ranged)", description = "Increases your ranged critical chance." },
                CRIT_SPELL              = { name = "Critical (Spell)", description = "Increases your spell critical chance." },
                HIT_TAKEN_MELEE         = { name = "Hit Taken (Melee)", description = "Increases chance to be hit by melee attacks." },
                HIT_TAKEN_RANGED        = { name = "Hit Taken (Ranged)", description = "Increases chance to be hit by ranged attacks." },
                HIT_TAKEN_SPELL         = { name = "Hit Taken (Spell)", description = "Increases chance to be hit by spells." },
                CRIT_TAKEN_MELEE        = { name = "Critical Taken (Melee)", description = "Increases chance to receive melee criticals." },
                CRIT_TAKEN_RANGED       = { name = "Critical Taken (Ranged)", description = "Increases chance to receive ranged criticals." },
                CRIT_TAKEN_SPELL        = { name = "Critical Taken (Spell)", description = "Increases chance to receive spell criticals." },
                HASTE_MELEE             = { name = "Haste (Melee)", description = "Increases your melee attack speed." },
                HASTE_RANGED            = { name = "Haste (Ranged)", description = "Increases your ranged attack speed." },
                HASTE_SPELL             = { name = "Haste (Spell)", description = "Increases your spell casting speed." },
                WEAPON_SKILL_MAINHAND   = { name = "Skill (Main Hand)", description = "Increases your main hand weapon skill." },
                WEAPON_SKILL_OFFHAND    = { name = "Skill (Off Hand)", description = "Increases your off hand weapon skill." },
                WEAPON_SKILL_RANGED     = { name = "Skill (Ranged)", description = "Increases your ranged weapon skill." },
                EXPERTISE               = { name = "Expertise", description = "Reduces target's dodge and parry chances." },
                ARMOR_PENETRATION       = { name = "Armor Penetration", description = "Ignores a percentage of the target's armor." },
            },

            -- Unit Modifier Statistics
            UNIT_MODS = {
                STAT_STRENGTH           = { name = "Strength", description = "Increases your Strength, improving melee attack power." },
                STAT_AGILITY            = { name = "Agility", description = "Increases your Agility, improving ranged attack power, dodge, and critical chance." },
                STAT_STAMINA            = { name = "Stamina", description = "Increases your Stamina, improving health pool." },
                STAT_INTELLECT          = { name = "Intellect", description = "Increases your Intellect, improving spell power and mana pool." },
                STAT_SPIRIT             = { name = "Spirit", description = "Increases your Spirit, improving mana and health regeneration." },
                HEALTH                  = { name = "Health", description = "Increases your health pool." },
                MANA                    = { name = "Mana", description = "Increases your mana pool." },
                RAGE                    = { name = "Rage", description = "Increases your rage generation (warriors and druids)." },
                FOCUS                   = { name = "Focus", description = "Increases your focus pool (hunters)." },
                ENERGY                  = { name = "Energy", description = "Increases your energy regeneration (rogues and druids)." },
                HAPPINESS               = { name = "Happiness", description = "Increases your pet's happiness (hunters)." },
                RUNE                    = { name = "Runes", description = "Increases rune regeneration (death knights)." },
                RUNIC_POWER             = { name = "Runic Power", description = "Increases your runic power pool (death knights)." },
                ARMOR                   = { name = "Armor", description = "Increases your armor value, reducing physical damage taken." },
                RESISTANCE_HOLY         = { name = "Holy Resistance", description = "Increases your resistance to holy damage." },
                RESISTANCE_FIRE         = { name = "Fire Resistance", description = "Increases your resistance to fire damage." },
                RESISTANCE_NATURE       = { name = "Nature Resistance", description = "Increases your resistance to nature damage." },
                RESISTANCE_FROST        = { name = "Frost Resistance", description = "Increases your resistance to frost damage." },
                RESISTANCE_SHADOW       = { name = "Shadow Resistance", description = "Increases your resistance to shadow damage." },
                RESISTANCE_ARCANE       = { name = "Arcane Resistance", description = "Increases your resistance to arcane damage." },
                ATTACK_POWER            = { name = "Attack Power (Melee)", description = "Increases damage dealt with melee weapons." },
                ATTACK_POWER_RANGED     = { name = "Attack Power (Ranged)", description = "Increases damage dealt with ranged weapons." },
                DAMAGE_MAINHAND         = { name = "Damage (Main Hand)", description = "Increases main hand weapon damage." },
                DAMAGE_OFFHAND          = { name = "Damage (Off Hand)", description = "Increases off hand weapon damage." },
                DAMAGE_RANGED           = { name = "Damage (Ranged)", description = "Increases ranged weapon damage." },
            },

            -- Aura Bonuses
            AURA = {
                LOOT                    = { name = "B??nus de saque", description = "Aumenta suas chances de obter saque de melhor qualidade." },
                REPUTATION              = { name = "B??nus de reputa????o", description = "Aumenta os pontos de reputa????o ganhos com fac????es." },
                EXPERIENCE              = { name = "B??nus de experi??ncia", description = "Multiplica os pontos de experi??ncia ganhos." },
                GOLD                    = { name = "B??nus de ouro", description = "Aumenta a quantidade de ouro obtido de inimigos." },
                MOVE_SPEED              = { name = "B??nus de velocidade", description = "Aumenta sua velocidade de movimento." },
            }
        }
    },
    ["itIT"] = {
        EXPERIENCE_TEXT = "Experience %d / %d",
        PARAGON_EXPERIENCE_TEXT = "Paragon %d / %d (%d%%)",
        SHOW_MAINMENU_XP_LABEL = "Mostra barra XP sull'interfaccia principale",
        SHOW_MAINMENU_XP_TOOLTIP = "Se selezionato, visualizza la barra esperienza Paragon sopra la barra XP del tuo personaggio nella parte inferiore dello schermo.",
        STATISTICS_TEXT = "Statistics",

        -- ========================================================================
        -- CATEGORY NAMES (Custom translations)
        -- ========================================================================
        DEFENSE_TEXT = "Defense",
        ATTACK_TEXT = "Attack",
        MAGIC_TEXT = "Magic",
        OTHER_TEXT = "Other",

        -- Tooltip instructions
        TOOLTIP_INSTRUCTIONS = "Left/Right click to add/remove one point.\nScroll up/down to add/remove several.\nMiddle click for quick assignment.",
        TOOLTIP_LIMIT = "Limit: %d",

        -- Points display
        POINTS_TO_SPEND = "(%d %s to spend)",
        POINTS_SINGULAR = "point",
        POINTS_PLURAL = "points",

        -- Popup dialogs
        POPUP_CHOOSE_ACTION = "Do you want to add or remove points?",
        POPUP_BUTTON_ADD = "Add",
        POPUP_BUTTON_REMOVE = "Remove",
        POPUP_ENTER_AMOUNT = "How many points do you want to %s in %s?",
        POPUP_ACTION_ADD = "add",
        POPUP_ACTION_REMOVE = "remove",
        POPUP_BUTTON_CONFIRM = "Confirm",
        POPUP_BUTTON_CANCEL = "Cancel",

        -- ========================================================================
        -- TUTORIAL MODE
        -- ========================================================================
        BUTTON_HELP = "?",
        TUTORIAL_TITLE = "Help - Paragon Interface",
        TUTORIAL_BUTTON_NEXT = "Next",
        TUTORIAL_BUTTON_PREVIOUS = "Previous",
        TUTORIAL_BUTTON_CLOSE = "Close",
        TUTORIAL_BUTTON_FINISH = "Finish",
        TUTORIAL_STEP_COUNTER = "Step %d/%d",
        TUTORIAL_COMPLETE = "Tutorial complete!",
        TUTORIAL_LEVEL = "Paragon Level|nDisplays your current level in the Paragon system.",
        TUTORIAL_XP_BAR = "Paragon Experience Bar|nShows your progress to the next level.|nHover to see XP details.",
        TUTORIAL_POINTS = "Available Points|nPoints you can spend on statistics.|nEarned by leveling up.",
        TUTORIAL_HELP_BUTTON = "Help Button|nRestarts this tutorial at any time.|nClick to show this help.",
        TUTORIAL_CATEGORIES = "Stat Categories|nThematic groups: Defense, Attack, Magic, Other.|nEach category contains specific stats.",
        TUTORIAL_STATS = "Stat Interactions|n|nLeft click: +1 point|nRight click: -1 point|nScroll up: +5 points|nScroll down: -5 points|nMiddle click: Quick assignment|n|nHover a stat to see its description.",

        -- ========================================================================
        -- STATISTICS
        -- ========================================================================
        STATISTICS = {
            -- Combat Rating Statistics
            COMBAT_RATING = {
                WEAPON_SKILL            = { name = "Weapon Skill", description = "Increases your skill with all weapons." },
                DEFENSE_SKILL           = { name = "Defense Skill", description = "Increases your defense skill against attacks." },
                DODGE                   = { name = "Dodge", description = "Increases your dodge rating." },
                PARRY                   = { name = "Parry", description = "Increases your parry rating." },
                BLOCK                   = { name = "Block", description = "Increases your block rating." },
                HIT_MELEE               = { name = "Hit (Melee)", description = "Increases your melee hit chance." },
                HIT_RANGED              = { name = "Hit (Ranged)", description = "Increases your ranged hit chance." },
                HIT_SPELL               = { name = "Hit (Spell)", description = "Increases your spell hit chance." },
                CRIT_MELEE              = { name = "Critical (Melee)", description = "Increases your melee critical chance." },
                CRIT_RANGED             = { name = "Critical (Ranged)", description = "Increases your ranged critical chance." },
                CRIT_SPELL              = { name = "Critical (Spell)", description = "Increases your spell critical chance." },
                HIT_TAKEN_MELEE         = { name = "Hit Taken (Melee)", description = "Increases chance to be hit by melee attacks." },
                HIT_TAKEN_RANGED        = { name = "Hit Taken (Ranged)", description = "Increases chance to be hit by ranged attacks." },
                HIT_TAKEN_SPELL         = { name = "Hit Taken (Spell)", description = "Increases chance to be hit by spells." },
                CRIT_TAKEN_MELEE        = { name = "Critical Taken (Melee)", description = "Increases chance to receive melee criticals." },
                CRIT_TAKEN_RANGED       = { name = "Critical Taken (Ranged)", description = "Increases chance to receive ranged criticals." },
                CRIT_TAKEN_SPELL        = { name = "Critical Taken (Spell)", description = "Increases chance to receive spell criticals." },
                HASTE_MELEE             = { name = "Haste (Melee)", description = "Increases your melee attack speed." },
                HASTE_RANGED            = { name = "Haste (Ranged)", description = "Increases your ranged attack speed." },
                HASTE_SPELL             = { name = "Haste (Spell)", description = "Increases your spell casting speed." },
                WEAPON_SKILL_MAINHAND   = { name = "Skill (Main Hand)", description = "Increases your main hand weapon skill." },
                WEAPON_SKILL_OFFHAND    = { name = "Skill (Off Hand)", description = "Increases your off hand weapon skill." },
                WEAPON_SKILL_RANGED     = { name = "Skill (Ranged)", description = "Increases your ranged weapon skill." },
                EXPERTISE               = { name = "Expertise", description = "Reduces target's dodge and parry chances." },
                ARMOR_PENETRATION       = { name = "Armor Penetration", description = "Ignores a percentage of the target's armor." },
            },

            -- Unit Modifier Statistics
            UNIT_MODS = {
                STAT_STRENGTH           = { name = "Strength", description = "Increases your Strength, improving melee attack power." },
                STAT_AGILITY            = { name = "Agility", description = "Increases your Agility, improving ranged attack power, dodge, and critical chance." },
                STAT_STAMINA            = { name = "Stamina", description = "Increases your Stamina, improving health pool." },
                STAT_INTELLECT          = { name = "Intellect", description = "Increases your Intellect, improving spell power and mana pool." },
                STAT_SPIRIT             = { name = "Spirit", description = "Increases your Spirit, improving mana and health regeneration." },
                HEALTH                  = { name = "Health", description = "Increases your health pool." },
                MANA                    = { name = "Mana", description = "Increases your mana pool." },
                RAGE                    = { name = "Rage", description = "Increases your rage generation (warriors and druids)." },
                FOCUS                   = { name = "Focus", description = "Increases your focus pool (hunters)." },
                ENERGY                  = { name = "Energy", description = "Increases your energy regeneration (rogues and druids)." },
                HAPPINESS               = { name = "Happiness", description = "Increases your pet's happiness (hunters)." },
                RUNE                    = { name = "Runes", description = "Increases rune regeneration (death knights)." },
                RUNIC_POWER             = { name = "Runic Power", description = "Increases your runic power pool (death knights)." },
                ARMOR                   = { name = "Armor", description = "Increases your armor value, reducing physical damage taken." },
                RESISTANCE_HOLY         = { name = "Holy Resistance", description = "Increases your resistance to holy damage." },
                RESISTANCE_FIRE         = { name = "Fire Resistance", description = "Increases your resistance to fire damage." },
                RESISTANCE_NATURE       = { name = "Nature Resistance", description = "Increases your resistance to nature damage." },
                RESISTANCE_FROST        = { name = "Frost Resistance", description = "Increases your resistance to frost damage." },
                RESISTANCE_SHADOW       = { name = "Shadow Resistance", description = "Increases your resistance to shadow damage." },
                RESISTANCE_ARCANE       = { name = "Arcane Resistance", description = "Increases your resistance to arcane damage." },
                ATTACK_POWER            = { name = "Attack Power (Melee)", description = "Increases damage dealt with melee weapons." },
                ATTACK_POWER_RANGED     = { name = "Attack Power (Ranged)", description = "Increases damage dealt with ranged weapons." },
                DAMAGE_MAINHAND         = { name = "Damage (Main Hand)", description = "Increases main hand weapon damage." },
                DAMAGE_OFFHAND          = { name = "Damage (Off Hand)", description = "Increases off hand weapon damage." },
                DAMAGE_RANGED           = { name = "Damage (Ranged)", description = "Increases ranged weapon damage." },
            },

            -- Aura Bonuses
            AURA = {
                LOOT                    = { name = "Bonus bottino", description = "Aumenta le tue possibilit?? di ottenere bottino di qualit?? migliore." },
                REPUTATION              = { name = "Bonus reputazione", description = "Aumenta i punti reputazione guadagnati con le fazioni." },
                EXPERIENCE              = { name = "Bonus esperienza", description = "Moltiplica i punti esperienza guadagnati." },
                GOLD                    = { name = "Bonus oro", description = "Aumenta la quantit?? di oro ottenuto dai nemici." },
                MOVE_SPEED              = { name = "Bonus velocit??", description = "Aumenta la tua velocit?? di movimento." },
            }
        }
    },
    ["koKR"] = {
        EXPERIENCE_TEXT = "Experience %d / %d",
        PARAGON_EXPERIENCE_TEXT = "Paragon %d / %d (%d%%)",
        SHOW_MAINMENU_XP_LABEL = "?????? ?????????????????? ????????? ??? ??????",
        SHOW_MAINMENU_XP_TOOLTIP = "???????????? ?????? ????????? ????????? ????????? ??? ?????? ????????? ????????? ?????? ???????????????.",
        STATISTICS_TEXT = "Statistics",

        -- ========================================================================
        -- CATEGORY NAMES (Custom translations)
        -- ========================================================================
        DEFENSE_TEXT = "Defense",
        ATTACK_TEXT = "Attack",
        MAGIC_TEXT = "Magic",
        OTHER_TEXT = "Other",

        -- Tooltip instructions
        TOOLTIP_INSTRUCTIONS = "Left/Right click to add/remove one point.\nScroll up/down to add/remove several.\nMiddle click for quick assignment.",
        TOOLTIP_LIMIT = "Limit: %d",

        -- Points display
        POINTS_TO_SPEND = "(%d %s to spend)",
        POINTS_SINGULAR = "point",
        POINTS_PLURAL = "points",

        -- Popup dialogs
        POPUP_CHOOSE_ACTION = "Do you want to add or remove points?",
        POPUP_BUTTON_ADD = "Add",
        POPUP_BUTTON_REMOVE = "Remove",
        POPUP_ENTER_AMOUNT = "How many points do you want to %s in %s?",
        POPUP_ACTION_ADD = "add",
        POPUP_ACTION_REMOVE = "remove",
        POPUP_BUTTON_CONFIRM = "Confirm",
        POPUP_BUTTON_CANCEL = "Cancel",

        -- ========================================================================
        -- TUTORIAL MODE
        -- ========================================================================
        BUTTON_HELP = "?",
        TUTORIAL_TITLE = "Help - Paragon Interface",
        TUTORIAL_BUTTON_NEXT = "Next",
        TUTORIAL_BUTTON_PREVIOUS = "Previous",
        TUTORIAL_BUTTON_CLOSE = "Close",
        TUTORIAL_BUTTON_FINISH = "Finish",
        TUTORIAL_STEP_COUNTER = "Step %d/%d",
        TUTORIAL_COMPLETE = "Tutorial complete!",
        TUTORIAL_LEVEL = "Paragon Level|nDisplays your current level in the Paragon system.",
        TUTORIAL_XP_BAR = "Paragon Experience Bar|nShows your progress to the next level.|nHover to see XP details.",
        TUTORIAL_POINTS = "Available Points|nPoints you can spend on statistics.|nEarned by leveling up.",
        TUTORIAL_HELP_BUTTON = "Help Button|nRestarts this tutorial at any time.|nClick to show this help.",
        TUTORIAL_CATEGORIES = "Stat Categories|nThematic groups: Defense, Attack, Magic, Other.|nEach category contains specific stats.",
        TUTORIAL_STATS = "Stat Interactions|n|nLeft click: +1 point|nRight click: -1 point|nScroll up: +5 points|nScroll down: -5 points|nMiddle click: Quick assignment|n|nHover a stat to see its description.",

        -- ========================================================================
        -- STATISTICS
        -- ========================================================================
        STATISTICS = {
            -- Combat Rating Statistics
            COMBAT_RATING = {
                WEAPON_SKILL            = { name = "Weapon Skill", description = "Increases your skill with all weapons." },
                DEFENSE_SKILL           = { name = "Defense Skill", description = "Increases your defense skill against attacks." },
                DODGE                   = { name = "Dodge", description = "Increases your dodge rating." },
                PARRY                   = { name = "Parry", description = "Increases your parry rating." },
                BLOCK                   = { name = "Block", description = "Increases your block rating." },
                HIT_MELEE               = { name = "Hit (Melee)", description = "Increases your melee hit chance." },
                HIT_RANGED              = { name = "Hit (Ranged)", description = "Increases your ranged hit chance." },
                HIT_SPELL               = { name = "Hit (Spell)", description = "Increases your spell hit chance." },
                CRIT_MELEE              = { name = "Critical (Melee)", description = "Increases your melee critical chance." },
                CRIT_RANGED             = { name = "Critical (Ranged)", description = "Increases your ranged critical chance." },
                CRIT_SPELL              = { name = "Critical (Spell)", description = "Increases your spell critical chance." },
                HIT_TAKEN_MELEE         = { name = "Hit Taken (Melee)", description = "Increases chance to be hit by melee attacks." },
                HIT_TAKEN_RANGED        = { name = "Hit Taken (Ranged)", description = "Increases chance to be hit by ranged attacks." },
                HIT_TAKEN_SPELL         = { name = "Hit Taken (Spell)", description = "Increases chance to be hit by spells." },
                CRIT_TAKEN_MELEE        = { name = "Critical Taken (Melee)", description = "Increases chance to receive melee criticals." },
                CRIT_TAKEN_RANGED       = { name = "Critical Taken (Ranged)", description = "Increases chance to receive ranged criticals." },
                CRIT_TAKEN_SPELL        = { name = "Critical Taken (Spell)", description = "Increases chance to receive spell criticals." },
                HASTE_MELEE             = { name = "Haste (Melee)", description = "Increases your melee attack speed." },
                HASTE_RANGED            = { name = "Haste (Ranged)", description = "Increases your ranged attack speed." },
                HASTE_SPELL             = { name = "Haste (Spell)", description = "Increases your spell casting speed." },
                WEAPON_SKILL_MAINHAND   = { name = "Skill (Main Hand)", description = "Increases your main hand weapon skill." },
                WEAPON_SKILL_OFFHAND    = { name = "Skill (Off Hand)", description = "Increases your off hand weapon skill." },
                WEAPON_SKILL_RANGED     = { name = "Skill (Ranged)", description = "Increases your ranged weapon skill." },
                EXPERTISE               = { name = "Expertise", description = "Reduces target's dodge and parry chances." },
                ARMOR_PENETRATION       = { name = "Armor Penetration", description = "Ignores a percentage of the target's armor." },
            },

            -- Unit Modifier Statistics
            UNIT_MODS = {
                STAT_STRENGTH           = { name = "Strength", description = "Increases your Strength, improving melee attack power." },
                STAT_AGILITY            = { name = "Agility", description = "Increases your Agility, improving ranged attack power, dodge, and critical chance." },
                STAT_STAMINA            = { name = "Stamina", description = "Increases your Stamina, improving health pool." },
                STAT_INTELLECT          = { name = "Intellect", description = "Increases your Intellect, improving spell power and mana pool." },
                STAT_SPIRIT             = { name = "Spirit", description = "Increases your Spirit, improving mana and health regeneration." },
                HEALTH                  = { name = "Health", description = "Increases your health pool." },
                MANA                    = { name = "Mana", description = "Increases your mana pool." },
                RAGE                    = { name = "Rage", description = "Increases your rage generation (warriors and druids)." },
                FOCUS                   = { name = "Focus", description = "Increases your focus pool (hunters)." },
                ENERGY                  = { name = "Energy", description = "Increases your energy regeneration (rogues and druids)." },
                HAPPINESS               = { name = "Happiness", description = "Increases your pet's happiness (hunters)." },
                RUNE                    = { name = "Runes", description = "Increases rune regeneration (death knights)." },
                RUNIC_POWER             = { name = "Runic Power", description = "Increases your runic power pool (death knights)." },
                ARMOR                   = { name = "Armor", description = "Increases your armor value, reducing physical damage taken." },
                RESISTANCE_HOLY         = { name = "Holy Resistance", description = "Increases your resistance to holy damage." },
                RESISTANCE_FIRE         = { name = "Fire Resistance", description = "Increases your resistance to fire damage." },
                RESISTANCE_NATURE       = { name = "Nature Resistance", description = "Increases your resistance to nature damage." },
                RESISTANCE_FROST        = { name = "Frost Resistance", description = "Increases your resistance to frost damage." },
                RESISTANCE_SHADOW       = { name = "Shadow Resistance", description = "Increases your resistance to shadow damage." },
                RESISTANCE_ARCANE       = { name = "Arcane Resistance", description = "Increases your resistance to arcane damage." },
                ATTACK_POWER            = { name = "Attack Power (Melee)", description = "Increases damage dealt with melee weapons." },
                ATTACK_POWER_RANGED     = { name = "Attack Power (Ranged)", description = "Increases damage dealt with ranged weapons." },
                DAMAGE_MAINHAND         = { name = "Damage (Main Hand)", description = "Increases main hand weapon damage." },
                DAMAGE_OFFHAND          = { name = "Damage (Off Hand)", description = "Increases off hand weapon damage." },
                DAMAGE_RANGED           = { name = "Damage (Ranged)", description = "Increases ranged weapon damage." },
            },

            -- Aura Bonuses
            AURA = {
                LOOT                    = { name = "????????? ?????????", description = "??? ?????? ????????? ???????????? ?????? ????????? ??????????????????." },
                REPUTATION              = { name = "?????? ?????????", description = "???????????? ?????? ?????? ????????? ??????????????????." },
                EXPERIENCE              = { name = "????????? ?????????", description = "???????????? ????????? ????????? ??????????????????." },
                GOLD                    = { name = "?????? ?????????", description = "???????????? ?????? ???????????? ??????????????????." },
                MOVE_SPEED              = { name = "?????? ?????????", description = "?????? ????????? ??????????????????." },
            }
        }
    },
    ["zhCN"] = {
    EXPERIENCE_TEXT = "?????? %d / %d",
    PARAGON_EXPERIENCE_TEXT = "???????????? %d / %d???%d%%???",
    SHOW_MAINMENU_XP_LABEL = "??????????????????????????????????????????",
    SHOW_MAINMENU_XP_TOOLTIP = "???????????????????????????????????????????????????????????????????????????",
    STATISTICS_TEXT = "????????????",

    -- ========================================================================
    -- CATEGORY NAMES (Custom translations)
    -- ========================================================================
    DEFENSE_TEXT = "??????",
    ATTACK_TEXT = "??????",
    MAGIC_TEXT = "??????",
    OTHER_TEXT = "??????",

    -- Tooltip instructions
    TOOLTIP_INSTRUCTIONS = "??????/????????????/??????1??????\n?????????/????????????????????????\n?????????????????????",
    TOOLTIP_LIMIT = "?????????%d",

    -- Points display
    POINTS_TO_SPEND = "?????????%d???????????????",
    POINTS_SINGULAR = "??????",
    POINTS_PLURAL = "??????",

    -- ========================================================================
    -- POPUP DIALOGS
    -- ========================================================================
    POPUP_CHOOSE_ACTION = "??????????????????????????????",
    POPUP_BUTTON_ADD = "??????",
    POPUP_BUTTON_REMOVE = "??????",
    POPUP_ENTER_AMOUNT = "?????????%s???%s???????????????",
    POPUP_ACTION_ADD = "??????",
    POPUP_ACTION_REMOVE = "??????",
    POPUP_BUTTON_CONFIRM = "??????",
    POPUP_BUTTON_CANCEL = "??????",

    -- ========================================================================
    -- APPLY BUTTON
    -- ========================================================================
    APPLY_BUTTON_TEXT = "??????",

    -- ========================================================================
    -- TUTORIAL MODE
    -- ========================================================================
    BUTTON_HELP = "??????",
    TUTORIAL_TITLE = "?????? - ??????????????????",
    TUTORIAL_BUTTON_NEXT = "?????????",
    TUTORIAL_BUTTON_PREVIOUS = "?????????",
    TUTORIAL_BUTTON_CLOSE = "??????",
    TUTORIAL_BUTTON_FINISH = "??????",
    TUTORIAL_STEP_COUNTER = "???%d/%d???",
    TUTORIAL_COMPLETE = "???????????????",
    TUTORIAL_LEVEL = "????????????|n???????????????????????????",
    TUTORIAL_XP_BAR = "???????????????|n?????????????????????|n???????????????????????????",
    TUTORIAL_POINTS = "????????????|n????????????????????????????????????",
    TUTORIAL_HELP_BUTTON = "????????????|n???????????????????????????",
    TUTORIAL_CATEGORIES = "????????????|n????????????????????????????????????????????????",
    TUTORIAL_STATS = "????????????|n|n??????:+1|n??????:-1|n?????????:+5|n?????????:-5|n??????:????????????|n|n???????????????????????????",

    -- ========================================================================
    -- STATISTICS
    -- ========================================================================
    STATISTICS = {
        -- Combat Rating Statistics
        COMBAT_RATING = {
            WEAPON_SKILL            = { name = "???????????????", description = "????????????????????????????????????" },
            DEFENSE_SKILL           = { name = "????????????", description = "???????????????????????????" },
            DODGE                   = { name = "????????????", description = "?????????????????????" },
            PARRY                   = { name = "????????????", description = "?????????????????????" },
            BLOCK                   = { name = "????????????", description = "???????????????????????????" },
            HIT_MELEE               = { name = "??????????????????", description = "???????????????????????????" },
            HIT_RANGED              = { name = "??????????????????", description = "???????????????????????????" },
            HIT_SPELL               = { name = "??????????????????", description = "???????????????????????????" },
            CRIT_MELEE              = { name = "??????????????????", description = "???????????????????????????" },
            CRIT_RANGED             = { name = "??????????????????", description = "???????????????????????????" },
            CRIT_SPELL              = { name = "??????????????????", description = "???????????????????????????" },
            HIT_TAKEN_MELEE         = { name = "??????????????????", description = "??????????????????????????????????????????" },       -- NOTE: Does this increase OR decrease damage taken
            HIT_TAKEN_RANGED        = { name = "??????????????????", description = "??????????????????????????????????????????" },
            HIT_TAKEN_SPELL         = { name = "??????????????????", description = "????????????????????????????????????" },
            CRIT_TAKEN_MELEE        = { name = "??????????????????", description = "????????????????????????????????????" },
            CRIT_TAKEN_RANGED       = { name = "??????????????????", description = "????????????????????????????????????" },
            CRIT_TAKEN_SPELL        = { name = "??????????????????", description = "????????????????????????????????????" },
            HASTE_MELEE             = { name = "??????????????????", description = "???????????????????????????" },
            HASTE_RANGED            = { name = "??????????????????", description = "???????????????????????????" },
            HASTE_SPELL             = { name = "??????????????????", description = "???????????????????????????" },
            WEAPON_SKILL_MAINHAND   = { name = "??????????????????", description = "???????????????????????????" },
            WEAPON_SKILL_OFFHAND    = { name = "??????????????????", description = "???????????????????????????" },
            WEAPON_SKILL_RANGED     = { name = "??????????????????", description = "???????????????????????????" },
            EXPERTISE               = { name = "????????????", description = "???????????????????????????????????????????????????" },
            ARMOR_PENETRATION       = { name = "??????????????????", description = "???????????????????????????????????????" },
        },

        -- Unit Modifier Statistics
        UNIT_MODS = {
            STAT_STRENGTH           = { name = "??????", description = "????????????????????????????????????????????????" },
            STAT_AGILITY            = { name = "??????", description = "??????????????????????????????????????????????????????????????????" },
            STAT_STAMINA            = { name = "??????", description = "?????????????????????????????????????????????" },
            STAT_INTELLECT          = { name = "??????", description = "?????????????????????????????????????????????????????????" },
            STAT_SPIRIT             = { name = "??????", description = "?????????????????????????????????????????????????????????" },
            HEALTH                  = { name = "???????????????", description = "????????????????????????" },
            MANA                    = { name = "???????????????", description = "????????????????????????" },
            RAGE                    = { name = "????????????", description = "???????????????????????????????????????????????????" },
            FOCUS                   = { name = "???????????????", description = "????????????????????????????????????" },
            ENERGY                  = { name = "????????????", description = "???????????????????????????????????????????????????" },
            HAPPINESS               = { name = "???????????????", description = "????????????????????????????????????" },
            RUNE                    = { name = "????????????", description = "?????????????????????????????????????????????" },
            RUNIC_POWER             = { name = "??????????????????", description = "?????????????????????????????????????????????" },
            ARMOR                   = { name = "?????????", description = "???????????????????????????????????????????????????" },
            RESISTANCE_HOLY         = { name = "????????????", description = "???????????????????????????" },
            RESISTANCE_FIRE         = { name = "????????????", description = "???????????????????????????" },
            RESISTANCE_NATURE       = { name = "????????????", description = "???????????????????????????" },
            RESISTANCE_FROST        = { name = "????????????", description = "???????????????????????????" },
            RESISTANCE_SHADOW       = { name = "????????????", description = "???????????????????????????" },
            RESISTANCE_ARCANE       = { name = "????????????", description = "???????????????????????????" },
            ATTACK_POWER            = { name = "??????????????????", description = "????????????????????????????????????" },
            ATTACK_POWER_RANGED     = { name = "??????????????????", description = "????????????????????????????????????" },
            DAMAGE_MAINHAND         = { name = "??????????????????", description = "???????????????????????????" },
            DAMAGE_OFFHAND          = { name = "??????????????????", description = "???????????????????????????" },
            DAMAGE_RANGED           = { name = "??????????????????", description = "???????????????????????????" },
        },

        -- Aura Bonuses
        AURA = {
            LOOT                    = { name = "???????????????", description = "?????????????????????????????????????????????" },
            REPUTATION              = { name = "????????????", description = "???????????????????????????????????????" },
            EXPERIENCE              = { name = "????????????", description = "???????????????????????????" },
            GOLD                    = { name = "????????????", description = "?????????????????????????????????????????????" },
            MOVE_SPEED              = { name = "????????????", description = "?????????????????????" },
        }
    }
},
    ["zhTW"] = {
        EXPERIENCE_TEXT = "Experience %d / %d",
        PARAGON_EXPERIENCE_TEXT = "Paragon %d / %d (%d%%)",
        SHOW_MAINMENU_XP_LABEL = "??????????????????????????????",
        SHOW_MAINMENU_XP_TOOLTIP = "??????????????????????????????????????????????????????????????????????????????",
        STATISTICS_TEXT = "Statistics",

        -- ========================================================================
        -- CATEGORY NAMES (Custom translations)
        -- ========================================================================
        DEFENSE_TEXT = "Defense",
        ATTACK_TEXT = "Attack",
        MAGIC_TEXT = "Magic",
        OTHER_TEXT = "Other",

        -- Tooltip instructions
        TOOLTIP_INSTRUCTIONS = "Left/Right click to add/remove one point.\nScroll up/down to add/remove several.\nMiddle click for quick assignment.",
        TOOLTIP_LIMIT = "Limit: %d",

        -- Points display
        POINTS_TO_SPEND = "(%d %s to spend)",
        POINTS_SINGULAR = "point",
        POINTS_PLURAL = "points",

        -- Popup dialogs
        POPUP_CHOOSE_ACTION = "Do you want to add or remove points?",
        POPUP_BUTTON_ADD = "Add",
        POPUP_BUTTON_REMOVE = "Remove",
        POPUP_ENTER_AMOUNT = "How many points do you want to %s in %s?",
        POPUP_ACTION_ADD = "add",
        POPUP_ACTION_REMOVE = "remove",
        POPUP_BUTTON_CONFIRM = "Confirm",
        POPUP_BUTTON_CANCEL = "Cancel",

        -- ========================================================================
        -- TUTORIAL MODE
        -- ========================================================================
        BUTTON_HELP = "?",
        TUTORIAL_TITLE = "Help - Paragon Interface",
        TUTORIAL_BUTTON_NEXT = "Next",
        TUTORIAL_BUTTON_PREVIOUS = "Previous",
        TUTORIAL_BUTTON_CLOSE = "Close",
        TUTORIAL_BUTTON_FINISH = "Finish",
        TUTORIAL_STEP_COUNTER = "Step %d/%d",
        TUTORIAL_COMPLETE = "Tutorial complete!",
        TUTORIAL_LEVEL = "Paragon Level|nDisplays your current level in the Paragon system.",
        TUTORIAL_XP_BAR = "Paragon Experience Bar|nShows your progress to the next level.|nHover to see XP details.",
        TUTORIAL_POINTS = "Available Points|nPoints you can spend on statistics.|nEarned by leveling up.",
        TUTORIAL_HELP_BUTTON = "Help Button|nRestarts this tutorial at any time.|nClick to show this help.",
        TUTORIAL_CATEGORIES = "Stat Categories|nThematic groups: Defense, Attack, Magic, Other.|nEach category contains specific stats.",
        TUTORIAL_STATS = "Stat Interactions|n|nLeft click: +1 point|nRight click: -1 point|nScroll up: +5 points|nScroll down: -5 points|nMiddle click: Quick assignment|n|nHover a stat to see its description.",

        -- ========================================================================
        -- STATISTICS
        -- ========================================================================
        STATISTICS = {
            -- Combat Rating Statistics
            COMBAT_RATING = {
                WEAPON_SKILL            = { name = "Weapon Skill", description = "Increases your skill with all weapons." },
                DEFENSE_SKILL           = { name = "Defense Skill", description = "Increases your defense skill against attacks." },
                DODGE                   = { name = "Dodge", description = "Increases your dodge rating." },
                PARRY                   = { name = "Parry", description = "Increases your parry rating." },
                BLOCK                   = { name = "Block", description = "Increases your block rating." },
                HIT_MELEE               = { name = "Hit (Melee)", description = "Increases your melee hit chance." },
                HIT_RANGED              = { name = "Hit (Ranged)", description = "Increases your ranged hit chance." },
                HIT_SPELL               = { name = "Hit (Spell)", description = "Increases your spell hit chance." },
                CRIT_MELEE              = { name = "Critical (Melee)", description = "Increases your melee critical chance." },
                CRIT_RANGED             = { name = "Critical (Ranged)", description = "Increases your ranged critical chance." },
                CRIT_SPELL              = { name = "Critical (Spell)", description = "Increases your spell critical chance." },
                HIT_TAKEN_MELEE         = { name = "Hit Taken (Melee)", description = "Increases chance to be hit by melee attacks." },
                HIT_TAKEN_RANGED        = { name = "Hit Taken (Ranged)", description = "Increases chance to be hit by ranged attacks." },
                HIT_TAKEN_SPELL         = { name = "Hit Taken (Spell)", description = "Increases chance to be hit by spells." },
                CRIT_TAKEN_MELEE        = { name = "Critical Taken (Melee)", description = "Increases chance to receive melee criticals." },
                CRIT_TAKEN_RANGED       = { name = "Critical Taken (Ranged)", description = "Increases chance to receive ranged criticals." },
                CRIT_TAKEN_SPELL        = { name = "Critical Taken (Spell)", description = "Increases chance to receive spell criticals." },
                HASTE_MELEE             = { name = "Haste (Melee)", description = "Increases your melee attack speed." },
                HASTE_RANGED            = { name = "Haste (Ranged)", description = "Increases your ranged attack speed." },
                HASTE_SPELL             = { name = "Haste (Spell)", description = "Increases your spell casting speed." },
                WEAPON_SKILL_MAINHAND   = { name = "Skill (Main Hand)", description = "Increases your main hand weapon skill." },
                WEAPON_SKILL_OFFHAND    = { name = "Skill (Off Hand)", description = "Increases your off hand weapon skill." },
                WEAPON_SKILL_RANGED     = { name = "Skill (Ranged)", description = "Increases your ranged weapon skill." },
                EXPERTISE               = { name = "Expertise", description = "Reduces target's dodge and parry chances." },
                ARMOR_PENETRATION       = { name = "Armor Penetration", description = "Ignores a percentage of the target's armor." },
            },

            -- Unit Modifier Statistics
            UNIT_MODS = {
                STAT_STRENGTH           = { name = "Strength", description = "Increases your Strength, improving melee attack power." },
                STAT_AGILITY            = { name = "Agility", description = "Increases your Agility, improving ranged attack power, dodge, and critical chance." },
                STAT_STAMINA            = { name = "Stamina", description = "Increases your Stamina, improving health pool." },
                STAT_INTELLECT          = { name = "Intellect", description = "Increases your Intellect, improving spell power and mana pool." },
                STAT_SPIRIT             = { name = "Spirit", description = "Increases your Spirit, improving mana and health regeneration." },
                HEALTH                  = { name = "Health", description = "Increases your health pool." },
                MANA                    = { name = "Mana", description = "Increases your mana pool." },
                RAGE                    = { name = "Rage", description = "Increases your rage generation (warriors and druids)." },
                FOCUS                   = { name = "Focus", description = "Increases your focus pool (hunters)." },
                ENERGY                  = { name = "Energy", description = "Increases your energy regeneration (rogues and druids)." },
                HAPPINESS               = { name = "Happiness", description = "Increases your pet's happiness (hunters)." },
                RUNE                    = { name = "Runes", description = "Increases rune regeneration (death knights)." },
                RUNIC_POWER             = { name = "Runic Power", description = "Increases your runic power pool (death knights)." },
                ARMOR                   = { name = "Armor", description = "Increases your armor value, reducing physical damage taken." },
                RESISTANCE_HOLY         = { name = "Holy Resistance", description = "Increases your resistance to holy damage." },
                RESISTANCE_FIRE         = { name = "Fire Resistance", description = "Increases your resistance to fire damage." },
                RESISTANCE_NATURE       = { name = "Nature Resistance", description = "Increases your resistance to nature damage." },
                RESISTANCE_FROST        = { name = "Frost Resistance", description = "Increases your resistance to frost damage." },
                RESISTANCE_SHADOW       = { name = "Shadow Resistance", description = "Increases your resistance to shadow damage." },
                RESISTANCE_ARCANE       = { name = "Arcane Resistance", description = "Increases your resistance to arcane damage." },
                ATTACK_POWER            = { name = "Attack Power (Melee)", description = "Increases damage dealt with melee weapons." },
                ATTACK_POWER_RANGED     = { name = "Attack Power (Ranged)", description = "Increases damage dealt with ranged weapons." },
                DAMAGE_MAINHAND         = { name = "Damage (Main Hand)", description = "Increases main hand weapon damage." },
                DAMAGE_OFFHAND          = { name = "Damage (Off Hand)", description = "Increases off hand weapon damage." },
                DAMAGE_RANGED           = { name = "Damage (Ranged)", description = "Increases ranged weapon damage." },
            },

            -- Aura Bonuses
            AURA = {
                LOOT                    = { name = "???????????????", description = "?????????????????????????????????????????????" },
                REPUTATION              = { name = "????????????", description = "???????????????????????????????????????" },
                EXPERIENCE              = { name = "????????????", description = "???????????????????????????" },
                GOLD                    = { name = "????????????", description = "?????????????????????????????????????????????" },
                MOVE_SPEED              = { name = "????????????", description = "?????????????????????" },
            }
        }
    }
}

--- Regional variant aliases
-- Maps regional variants to their base locale
Locales["enGB"] = Locales["enUS"]
Locales["esMX"] = Locales["esES"]

--- Retrieves the localization table for the current client locale
-- Falls back to English (enUS) if the current locale is not supported
-- @return table The locale strings table for the current or default locale
-- @usage local L = GetLocaleTable(); print(L.EXPERIENCE_TEXT)
function GetLocaleTable()
    local locale = GetLocale()
    return Locales[locale] or Locales["enUS"]
end
