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
static uint8 _maxQuality = 5;

// Legendary configuration
static bool _legendaryEnabled = true;
static float _legendaryChancePerPoint = 0.0001f;
static float _legendaryMaxChance = 0.01f;

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

    _legendaryEnabled = sConfigMgr->GetOption<bool>("ParagonLoot.Legendary.Enable", true);
    _legendaryChancePerPoint = sConfigMgr->GetOption<float>("ParagonLoot.Legendary.ChancePerPoint", 0.0001f);
    _legendaryMaxChance = sConfigMgr->GetOption<float>("ParagonLoot.Legendary.MaxChance", 0.01f);
}

ParagonLootScript::ParagonLootScript()
    : MiscScript("ParagonLootScript")
{
}

uint32 ParagonLootScript::FindHigherQualityItem(uint32 itemId, uint8 currentQuality, uint8 playerLevel, uint8 mobLevel)
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

    if (_generalizeUpgrade)
    {
        QueryResult result = WorldDatabase.Query(
            "SELECT entry FROM item_template "
            "WHERE Quality = {} AND {} BETWEEN {} AND {} "
            "AND entry != {} "
            "ORDER BY RAND() "
            "LIMIT 1",
            targetQuality, levelColumn,
            searchLevel - _itemLevelTolerance, searchLevel + _itemLevelTolerance,
            itemId
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
            "ORDER BY ABS({} - {}) ASC "
            "LIMIT 1",
            targetQuality, itemClass, itemSubClass, inventoryType,
            levelColumn, searchLevel - _itemLevelTolerance, searchLevel + _itemLevelTolerance,
            itemId, levelColumn, searchLevel
        );

        if (result)
            return result->Fetch()->Get<uint32>();
    }

    return 0;
}

uint32 ParagonLootScript::FindRandomLegendary(uint32 itemId, uint8 playerLevel, uint8 mobLevel)
{
    ItemTemplate const* itemTemplate = sObjectMgr->GetItemTemplate(itemId);
    if (!itemTemplate)
        return 0;

    uint32 searchLevel = _usePlayerLevel ? playerLevel :
                         (_useMobLevel ? mobLevel :
                         (_useRequiredLevel ? itemTemplate->RequiredLevel : itemTemplate->ItemLevel));

    const char* levelColumn = (_usePlayerLevel || _useMobLevel) ? "RequiredLevel" :
                              (_useRequiredLevel ? "RequiredLevel" : "ItemLevel");

    if (_generalizeUpgrade)
    {
        QueryResult result = WorldDatabase.Query(
            "SELECT entry FROM item_template "
            "WHERE Quality = 5 AND {} BETWEEN {} AND {} "
            "ORDER BY RAND() "
            "LIMIT 1",
            levelColumn,
            searchLevel - _itemLevelTolerance, searchLevel + _itemLevelTolerance
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
            "WHERE Quality = 5 AND class = {} AND subclass = {} "
            "AND InventoryType = {} AND {} BETWEEN {} AND {} "
            "ORDER BY RAND() "
            "LIMIT 1",
            itemClass, itemSubClass, inventoryType,
            levelColumn, searchLevel - _itemLevelTolerance, searchLevel + _itemLevelTolerance
        );

        if (result)
            return result->Fetch()->Get<uint32>();

        // Fallback: try matching only class
        result = WorldDatabase.Query(
            "SELECT entry FROM item_template "
            "WHERE Quality = 5 AND class = {} AND {} BETWEEN {} AND {} "
            "ORDER BY RAND() "
            "LIMIT 1",
            itemClass,
            levelColumn, searchLevel - _itemLevelTolerance, searchLevel + _itemLevelTolerance
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
    float legendaryChance = _legendaryEnabled ? std::min(lootStatValue * _legendaryChancePerPoint, _legendaryMaxChance) : 0.0f;

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
                    float actualSkipChance = std::min(lootStatValue * _skipQualityChance, _skipQualityMaxChance);
                    while (targetQuality + 1 <= _maxQuality)
                    {
                        float skipRoll = static_cast<float>(urand(1, 10000)) / 10000.0f;
                        if (skipRoll >= actualSkipChance)
                            break;
                        targetQuality++;
                    }
                }

                uint32 newItemId = FindHigherQualityItem(item.itemid, targetQuality, playerLevel, mobLevel);
                if (newItemId != 0)
                {
                    ItemTemplate const* newTemplate = sObjectMgr->GetItemTemplate(newItemId);
                    uint32 oldItemId = item.itemid;
                    item.itemid = newItemId;
                    currentTemplate = newTemplate ? newTemplate : currentTemplate;
                }
            }
        }

        // --- Legendary roll (epics only) ---
        if (_legendaryEnabled && currentTemplate && currentTemplate->Quality == 4)
        {
            uint32 legRoll = urand(1, 100);
            uint32 legThreshold = static_cast<uint32>(legendaryChance * 10000);

            if (legRoll <= legThreshold)
            {
                uint32 legendaryId = FindRandomLegendary(item.itemid, playerLevel, mobLevel);
                if (legendaryId != 0)
                {
                    ItemTemplate const* legTemplate = sObjectMgr->GetItemTemplate(legendaryId);
                    uint32 oldItemId = item.itemid;
                    item.itemid = legendaryId;
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
