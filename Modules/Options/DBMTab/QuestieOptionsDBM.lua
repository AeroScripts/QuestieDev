-------------------------
--Import modules.
-------------------------
---@type QuestieQuest
local QuestieQuest = QuestieLoader:ImportModule("QuestieQuest");
---@type QuestieOptions
local QuestieOptions = QuestieLoader:ImportModule("QuestieOptions");
---@type QuestieOptionsDefaults
local QuestieOptionsDefaults = QuestieLoader:ImportModule("QuestieOptionsDefaults");
---@type QuestieOptionsUtils
local QuestieOptionsUtils = QuestieLoader:ImportModule("QuestieOptionsUtils");
---@type QuestieDBMIntegration
local QuestieDBMIntegration = QuestieLoader:ImportModule("QuestieDBMIntegration");

QuestieOptions.tabs.dbm = {...}
local optionsDefaults = QuestieOptionsDefaults:Load()


--TODO, hid hud tab if DBMHudMap global doesn't exist? Or at very least gray out options?
--dbmHUDEnable, dbmHUDShowAlert, DBMHUDZoom, dbmHUDRadius, dbmHUDShowQuest, dbmHUDShowSlay, dbmHUDShowLoot, dbmHUDShowInteract
function QuestieOptions.tabs.dbm:Initialize()
    return {
        name = function() return l10n('DBM HUD'); end,
        type = "group",
        disabled = function() if DBM and DBM.HudMap then return false else return true end end,
        order = 15,
        args = {
            hud_options = {
                type = "header",
                order = 1,
                name = function() return l10n('DBM HUD'); end,
            },
            dbmHUDEnable = {
                type = "toggle",
                order = 1.1,
                name = function() return l10n('Show DBM HUD'); end,
                desc = function() return l10n('Enable or disable the DBM Heads Up Display (HUD) overlay for showing map objects.'); end,
                width = "full",
                get = function(info) return QuestieOptions:GetGlobalOptionValue(info); end,
                set = function (info, value)
                    QuestieOptions:SetGlobalOptionValue(info, value)

                    if value then
                        QuestieDBMIntegration:EnableHUD()
                        --Hud Integration is completely innert when disabled, so QuestieDBMIntegration:SoftReset() cannot be used since it has no local tables
                        --Questies SmoothReset must be used after enabling hud so that HUD can build it's own tables when initial icons get added
                        QuestieQuest:SmoothReset()
                    else
                        QuestieDBMIntegration:ClearAll(true)--Passing true unregisters events and completely disables HUD activity after the ClearAll
                    end
                end,
            },
            dbmHUDShowAlert = {
                type = "toggle",
                order = 1.2,
                name = function() return l10n('Enable proximity visual for HUD icons'); end,
                desc = function() return l10n('Changes the color of a HUD icon to red when you are near it.'); end,
                width = "full",
                get = function(info) return QuestieOptions:GetGlobalOptionValue(info); end,
                set = function (info, value)
                    QuestieOptions:SetGlobalOptionValue(info, value)
                    QuestieDBMIntegration:SoftReset()
                end,
            },
            DBMHUDRefresh = {
                type = "range",
                disabled = function() if DBM and DBM.HudMap and not DBM.HudMap.Version then return true else return false end end,
                order = 1.3,
                name = function() return l10n('Refresh rate for HUD (Requires turning HUD off/on)'); end,
                desc = function() return l10n('Adjusts the fresh rate for HUD Icons which affects how often UI refreshes their position. ( Default: %s )', optionsDefaults.global.DBMHUDRefresh); end,
                width = "double",
                min = 0.01,
                max = 0.05,
                step = 0.01,
                get = function(info) return QuestieOptions:GetGlobalOptionValue(info); end,
                set = function (info, value)
                    QuestieOptions:SetGlobalOptionValue(info, value)
                    QuestieDBMIntegration:ChangeRefreshRate(value)
                end,
            },
            Spacer_A = QuestieOptionsUtils:Spacer(1.9),
            mapnote_options = {
                type = "header",
                order = 2,
                name = function() return l10n('Size & Scale Options'); end,
            },
            Spacer_B = QuestieOptionsUtils:Spacer(2.1),
            DBMHUDZoom = {
                type = "range",
                order = 2.2,
                name = function() return l10n('Global zoom level for HUD Icons'); end,
                desc = function() return l10n('Adjusts the zoom level for HUD Icons which affects how close in or how far out you see them. ( Default: %s )', optionsDefaults.global.DBMHUDZoom); end,
                width = "double",
                min = 40,
                max = 200,
                step = 20,
                get = function(info) return QuestieOptions:GetGlobalOptionValue(info); end,
                set = function (info, value)
                    QuestieOptions:SetGlobalOptionValue(info, value)
                    QuestieDBMIntegration:ChangeZoomLevel(value)
                end,
            },
            dbmHUDRadius = {
                type = "range",
                order = 2.3,
                name = function() return l10n('Global radius/size for HUD Icons'); end,
                desc = function() return l10n('Adjusts the size of the icons that appear on the HUD. ( Default: %s )', optionsDefaults.global.dbmHUDRadius); end,
                width = "double",
                min = 1,
                max = 5,
                step = 0.5,
                get = function(info) return QuestieOptions:GetGlobalOptionValue(info); end,
                set = function (info, value)
                    QuestieOptions:SetGlobalOptionValue(info, value)
                    QuestieDBMIntegration:SoftReset()
                end,
            },
            Spacer_C = QuestieOptionsUtils:Spacer(2.9),
            fade_options = {
                type = "header",
                order = 3,
                name = function() return l10n('Filter Options'); end,
            },
            dbmHUDShowQuest = {
                type = "toggle",
                order = 3.1,
                name = function() return l10n('Show quest giver icons'); end,
                desc = function() return l10n('Toggles whether or not available/complete quest icons appear on HUD. ( Default: %s )', optionsDefaults.global.dbmHUDShowQuest); end,
                width = "full",
                get = function(info) return QuestieOptions:GetGlobalOptionValue(info); end,
                set = function (info, value)
                    QuestieOptions:SetGlobalOptionValue(info, value)
                    QuestieDBMIntegration:SoftReset()
                end,
            },
            dbmHUDShowSlay = {
                type = "toggle",
                order = 3.2,
                name = function() return l10n('Show quest slay icons'); end,
                desc = function() return l10n('Toggles whether or not slay icons appear on HUD. ( Default: %s )', optionsDefaults.global.dbmHUDShowSlay); end,
                width = "full",
                get = function(info) return QuestieOptions:GetGlobalOptionValue(info); end,
                set = function (info, value)
                    QuestieOptions:SetGlobalOptionValue(info, value)
                    QuestieDBMIntegration:SoftReset()
                end,
            },
            dbmHUDShowLoot = {
                type = "toggle",
                order = 3.3,
                name = function() return l10n('Show quest loot icons'); end,
                desc = function() return l10n('Toggles whether or not loot icons appear on HUD. ( Default: %s )', optionsDefaults.global.dbmHUDShowLoot); end,
                width = "full",
                get = function(info) return QuestieOptions:GetGlobalOptionValue(info); end,
                set = function (info, value)
                    QuestieOptions:SetGlobalOptionValue(info, value)
                    QuestieDBMIntegration:SoftReset()
                end,
            },
            dbmHUDShowInteract = {
                type = "toggle",
                order = 3.4,
                name = function() return l10n('Show quest objective icons'); end,
                desc = function() return l10n('Toggles whether or not objective icons appear on HUD ( Default: %s )', optionsDefaults.global.dbmHUDShowInteract); end,
                width = "full",
                get = function(info) return QuestieOptions:GetGlobalOptionValue(info); end,
                set = function (info, value)
                    QuestieOptions:SetGlobalOptionValue(info, value)
                    QuestieDBMIntegration:SoftReset()
                end,
            },
        },
    }
end