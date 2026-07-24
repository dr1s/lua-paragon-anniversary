#include "paragon_loot.h"
#include "Config.h"
#include "Log.h"
#include "ObjectMgr.h"
#include "ObjectAccessor.h"
#include "DatabaseEnv.h"

// Configuration variables
static bool _enabled = true;
static std::string _dbName = "acore_ale";
static float _chancePerPoint = 0.002f;
static float _maxChance = 0.50f;
static int32 _itemLevelTolerance = 5;
static bool _useRequiredLevel = false;
static bool _generalizeUpgrade = false;
static bool _usePlayerLevel = false;
static bool _useMobLevel = false;
static float _skipQualityChance = 0.0f;
static float _skipQualityMaxChance = 0.50f;
static bool _limitLegendarySkipChance = false;
static float _legendarySkipMaxChance = 0.10f;
static uint8 _maxQuality = 5;

void LoadParagonLootConfig()
{
    _enabled = sConfigMgr->GetOption<bool>("ParagonLoot.Enable", true);
    _dbName = sConfigMgr->GetOption<std::string>("ParagonLoot.Database", "acore_paragon");
    _chancePerPoint = sConfigMgr->GetOption<float>("ParagonLoot.ChancePerPoint", 0.002f);
    _maxChance = sConfigMgr->GetOption<float>("ParagonLoot.MaxChance", 0.50f);
    _itemLevelTolerance = sConfigMgr->GetOption<int32>("ParagonLoot.ItemLevelTolerance", 5);
    _maxQuality = sConfigMgr->GetOption<uint8>("ParagonLoot.MaxQuality", 5);
    _useRequiredLevel = sConfigMgr->GetOption<bool>("ParagonLoot.UseRequiredLevel", false);
    _generalizeUpgrade = sConfigMgr->GetOption<bool>("ParagonLoot.GeneralizeUpgrade", false);
    _usePlayerLevel = sConfigMgr->GetOption<bool>("ParagonLoot.UsePlayerLevel", false);
    _useMobLevel = sConfigMgr->GetOption<bool>("ParagonLoot.UseMobLevel", false);
    _skipQualityChance = sConfigMgr->GetOption<float>("ParagonLoot.SkipQualityChance", 0.0f);
    _skipQualityMaxChance = sConfigMgr->GetOption<float>("ParagonLoot.SkipQualityMaxChance", 0.50f);
    _limitLegendarySkipChance = sConfigMgr->GetOption<bool>("ParagonLoot.LimitLegendarySkipChance", false);
    _legendarySkipMaxChance = sConfigMgr->GetOption<float>("ParagonLoot.LegendarySkipMaxChance", 0.10f);
}

ParagonLootScript::ParagonLootScript()
    : MiscScript("ParagonLootScript")
{
}

uint32 ParagonLootScript::FindHigherQualityItem(uint32 itemId, uint8 currentQuality, uint8 playerLevel, uint8 mobLevel, uint32 playerClass)
{
    uint8 targetQuality = currentQuality + 1;
    if (targetQuality > _maxQuality)
        return 0;

    ItemTemplate const* itemTemplate = sObjectMgr->GetItemTemplate(itemId);
    if (!itemTemplate)
        return 0;

    uint32 searchLevel = _usePlayerLevel ? playerLevel :
                         (_useMobLevel ? mobLevel :
                         (_useRequiredLevel ? itemTemplate->RequiredLevel : itemTemplate->ItemLevel));

    const char* levelColumn = (_usePlayerLevel || _useMobLevel) ? "RequiredLevel" :
                              (_useRequiredLevel ? "RequiredLevel" : "ItemLevel");

    uint32 classMask = (1u << (playerClass - 1));

    if (_generalizeUpgrade)
    {
        QueryResult result = WorldDatabase.Query(
            "SELECT entry FROM item_template "
            "WHERE Quality = {} AND {} BETWEEN {} AND {} "
            "AND entry != {} "
            "AND (AllowableClass = 0 OR AllowableClass & {}) "
            "ORDER BY RAND() "
            "LIMIT 1",
            targetQuality, levelColumn,
            searchLevel - _itemLevelTolerance, searchLevel + _itemLevelTolerance,
            itemId, classMask
        );

        if (result)
            return result->Fetch()->Get<uint32>();
    }
    else
    {
        uint32 itemClass = itemTemplate->Class;
        uint32 itemSubClass = itemTemplate->SubClass;
        int32 inventoryType = itemTemplate->InventoryType;

        QueryResult result = WorldDatabase.Query(
            "SELECT entry FROM item_template "
            "WHERE Quality = {} AND class = {} AND subclass = {} "
            "AND InventoryType = {} AND {} BETWEEN {} AND {} "
            "AND entry != {} "
            "AND (AllowableClass = 0 OR AllowableClass & {}) "
            "ORDER BY ABS({} - {}) ASC "
            "LIMIT 1",
            targetQuality, itemClass, itemSubClass, inventoryType,
            levelColumn, searchLevel - _itemLevelTolerance, searchLevel + _itemLevelTolerance,
            itemId, classMask, levelColumn, searchLevel
        );

        if (result)
            return result->Fetch()->Get<uint32>();
    }

    return 0;
}

void ParagonLootScript::OnAfterLootTemplateProcess(Loot* loot, LootTemplate const* /*tab*/, LootStore const& /*store*/, Player* lootOwner, bool /*personal*/, bool /*noEmptyError*/, uint16 /*lootMode*/)
{
    if (!_enabled || !loot || !lootOwner)
        return;

    uint32 playerGuid = lootOwner->GetGUID().GetCounter();
    QueryResult result = CharacterDatabase.Query(
        "SELECT stat_value FROM {}.character_paragon_stats WHERE guid = {} AND stat_id = 17",
        _dbName, playerGuid
    );

    uint32 lootStatValue = 0;
    if (result)
        lootStatValue = result->Fetch()->Get<uint32>();

    if (lootStatValue == 0)
        return;

    float upgradeChance = std::min(lootStatValue * _chancePerPoint, _maxChance);

    uint8 playerLevel = lootOwner->GetLevel();
    uint8 mobLevel = 0;

    if (_useMobLevel && loot->sourceWorldObjectGUID.IsCreature())
    {
        if (Creature* creature = ObjectAccessor::GetCreature(*lootOwner, loot->sourceWorldObjectGUID))
            mobLevel = creature->GetLevel();
    }

    for (LootItem& item : loot->items)
    {
        if (item.is_looted)
            continue;

        if (item.itemid <= 0)
            continue;

        ItemTemplate const* currentTemplate = sObjectMgr->GetItemTemplate(item.itemid);
        if (!currentTemplate)
            continue;

        // --- Normal quality upgrade path ---
        if (currentTemplate->Quality < _maxQuality)
        {
            uint32 roll = urand(1, 100);
            uint32 threshold = static_cast<uint32>(upgradeChance * 100);

            if (roll <= threshold)
            {
                uint8 targetQuality = currentTemplate->Quality + 1;
                if (_skipQualityChance > 0.0f)
                {
                    while (targetQuality + 1 <= _maxQuality)
                    {
                        float effectiveMaxChance = (_limitLegendarySkipChance && targetQuality + 1 >= _maxQuality)
                            ? _legendarySkipMaxChance : _skipQualityMaxChance;
                        float effectiveSkipChance = std::min(lootStatValue * _skipQualityChance, effectiveMaxChance);
                        float skipRoll = static_cast<float>(urand(1, 10000)) / 10000.0f;
                        if (skipRoll >= effectiveSkipChance)
                            break;
                        targetQuality++;
                    }
                }

                uint32 newItemId = FindHigherQualityItem(item.itemid, targetQuality, playerLevel, mobLevel, lootOwner->getClass());
                if (newItemId != 0)
                {
                    ItemTemplate const* newTemplate = sObjectMgr->GetItemTemplate(newItemId);
                    uint32 oldItemId = item.itemid;
                    item.itemid = newItemId;
                    currentTemplate = newTemplate ? newTemplate : currentTemplate;
                }
            }
        }
    }
}

void Addmod_paragon_lootScripts()
{
    LoadParagonLootConfig();
    new ParagonLootScript();
    LOG_INFO("server.loading", "Loading Paragon Loot module...");
}
