#ifndef PARAGON_LOOT_H
#define PARAGON_LOOT_H

#include "ScriptMgr.h"
#include "LootMgr.h"
#include "Player.h"

class ParagonLootScript : public MiscScript
{
public:
    ParagonLootScript();

    void OnAfterLootTemplateProcess(Loot* loot, LootTemplate const* tab, LootStore const& store, Player* lootOwner, bool personal, bool noEmptyError, uint16 lootMode) override;

private:
    uint32 FindHigherQualityItem(uint32 itemId, uint8 currentQuality);
    uint32 FindRandomLegendary(uint32 itemId);
};

#endif // PARAGON_LOOT_H
