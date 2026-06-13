# mod-paragon-loot

AzerothCore C++ module that enables paragon LOOT stat to upgrade creature loot quality and randomly drop legendary items.

## Features

- Hooks into the loot generation pipeline for all creatures
- Upgrades loot items based on the player's paragon LOOT stat
- 0.2% upgrade chance per stat point (51% at 255 points)
- Replaces dropped items with higher-quality equivalents from the database
- Epic-to-legendary random drop system (configurable chance)
- Works with any creature that drops loot

## Why This Module?

The paragon LOOT stat requires modifying creature loot after generation but before the player picks it up. mod-ale (ALE) does not expose any hooks or API methods that allow Lua scripts to intercept or modify loot tables. This C++ module hooks into `MiscScript::OnAfterLootTemplateProcess`, which fires after the loot table is processed for any creature, allowing it to query the player's paragon stats and upgrade dropped items before they become lootable.

## Installation

1. Copy this module into your AzerothCore modules directory:
   ```bash
   cd <azerothcore-path>/modules
   cp -r <path-to>/mod-paragon-loot .
   ```

2. Rebuild AzerothCore

3. Copy the config file:
   ```bash
   cp etc/mod-paragon-loot.conf.dist etc/mod-paragon-loot.conf
   ```

4. Restart your server.

## Configuration

Edit `etc/mod-paragon-loot.conf`:

| Setting | Default | Description |
|---------|---------|-------------|
| `ParagonLoot.Enable` | 1 | Enable/disable the module |
| `ParagonLoot.Database` | "acore_ale" | Database name for paragon stats |
| `ParagonLoot.ChancePerPoint` | 0.002 | Upgrade chance per stat point (0.2%) |
| `ParagonLoot.MaxChance` | 0.51 | Maximum upgrade chance (51%) |
| `ParagonLoot.ItemLevelTolerance` | 5 | Item level range for upgrade search (+/-) |
| `ParagonLoot.MaxQuality` | 5 | Max quality (5 = Legendary) |
| `ParagonLoot.Legendary.Enable` | 1 | Enable epic-to-legendary drops |
| `ParagonLoot.Legendary.ChancePerPoint` | 0.0001 | Legendary chance per stat point (0.01%) |
| `ParagonLoot.Legendary.MaxChance` | 0.0255 | Maximum legendary chance (2.55%) |

## How It Works

1. Creature dies → loot table is processed
2. `OnAfterLootTemplateProcess` fires with the generated loot
3. Module queries the player's paragon LOOT stat from the database
4. For each loot item, rolls for quality upgrade:
   - Matches by `class`, `subclass`, `InventoryType`
   - Finds item with `Quality = current + 1`
   - Picks closest `ItemLevel` (+/- tolerance)
5. If the item is epic (Quality 4), a separate legendary roll triggers:
   - Searches for a random legendary matching the same slot
   - Falls back to class-only match if no exact match exists
6. Replaces the dropped itemid with the upgraded version

Example: A common sword (itemid 12345, quality 1) might be replaced with an uncommon sword (itemid 67890, quality 2) of similar item level. With enough LOOT stat points, an epic item could even be upgraded to a legendary.

## Requirements

- AzerothCore
- Paragon system database with `character_paragon_stats` table
- Stat ID 17 (LOOT) must exist in `paragon_config_statistic`

## License

AGPL v3.0
