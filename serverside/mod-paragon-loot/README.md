# mod-paragon-loot

AzerothCore C++ module that enables paragon LOOT stat to upgrade creature loot quality and randomly drop legendary items.

## Features

- Hooks into the loot generation pipeline for all creatures
- Upgrades loot items based on the player's paragon LOOT stat
- Configurable upgrade chance per stat point
- Flexible item matching: by type/slot, any item, or level-based
- Skip quality tiers (e.g., green → epic) with configurable chance
- Epic-to-legendary random drop system
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

### Core Settings

| Setting | Default | Description |
|---------|---------|-------------|
| `ParagonLoot.Enable` | 1 | Enable/disable the module |
| `ParagonLoot.Database` | "acore_ale" | Database name for paragon stats |
| `ParagonLoot.ChancePerPoint` | 0.002 | Upgrade chance per stat point (0.2%) |
| `ParagonLoot.MaxChance` | 0.51 | Maximum upgrade chance (51%) |
| `ParagonLoot.ItemLevelTolerance` | 5 | Level range for upgrade search (+/-) |
| `ParagonLoot.MaxQuality` | 5 | Max quality (5 = Legendary) |

### Search Level Mode

These options control what level is used as the base for the upgrade search range. Priority: `UsePlayerLevel` > `UseMobLevel` > `UseRequiredLevel` > default (`ItemLevel`).

| Setting | Default | Description |
|---------|---------|-------------|
| `ParagonLoot.UsePlayerLevel` | 0 | Use player level as search base (ensures equippable upgrades) |
| `ParagonLoot.UseMobLevel` | 0 | Use killed mob's level as search base (scales with content) |
| `ParagonLoot.UseRequiredLevel` | 0 | Use `RequiredLevel` instead of `ItemLevel` for matching |

### Matching Mode

| Setting | Default | Description |
|---------|---------|-------------|
| `ParagonLoot.GeneralizeUpgrade` | 0 | Ignore item type/slot, upgrade to any higher quality item |

### Skip Quality System

| Setting | Default | Description |
|---------|---------|-------------|
| `ParagonLoot.SkipQualityChance` | 0.0 | Chance per point to skip a quality tier (scales with LOOT stat) |
| `ParagonLoot.SkipQualityMaxChance` | 0.50 | Maximum skip chance cap |

### Legendary Drops

| Setting | Default | Description |
|---------|---------|-------------|
| `ParagonLoot.Legendary.Enable` | 1 | Enable epic-to-legendary drops |
| `ParagonLoot.Legendary.ChancePerPoint` | 0.0001 | Legendary chance per stat point (0.01%) |
| `ParagonLoot.Legendary.MaxChance` | 0.0255 | Maximum legendary chance (2.55%) |

## How It Works

1. Creature dies → loot table is processed
2. `OnAfterLootTemplateProcess` fires with the generated loot
3. Module queries the player's paragon LOOT stat from the database
4. For each loot item, rolls for quality upgrade:
   - If the roll succeeds, determines the target quality tier
   - **Skip Quality System**: Each consecutive skip requires passing another roll. With a 20% skip chance, skipping 2 tiers has a 4% probability (0.20²), 3 tiers has 0.8% (0.20³)
   - Searches the database for a replacement item matching the target quality
   - **Default mode**: Same `class`, `subclass`, `InventoryType`
   - **GeneralizeUpgrade mode**: Any item of the target quality within the level range
   - Level range is determined by the active search level mode (player level, mob level, required level, or item level)
5. If the item is epic (Quality 4), a separate legendary roll triggers:
   - Uses the same search level and matching mode settings
   - Searches for a random legendary within the level range
6. Replaces the dropped itemid with the upgraded version

### Search Level Priority

When determining what level to use as the base for the search range:

1. **`UsePlayerLevel = 1`**: Uses the player's level. Ensures all upgrades are equippable.
2. **`UseMobLevel = 1`**: Uses the killed creature's level. Scales upgrades with content difficulty.
3. **`UseRequiredLevel = 1`**: Uses the original item's `RequiredLevel` instead of `ItemLevel`.
4. **Default**: Uses the original item's `ItemLevel`.

When `UsePlayerLevel` or `UseMobLevel` is active, the database queries use `RequiredLevel` as the column (since player/mob levels map to equip requirements, not item levels).

### Example Scenarios

**Default behavior**: A level 60 player kills a level 60 mob, loots a green sword (ilvl 55). The upgrade searches for a blue sword with ilvl 50-60.

**UsePlayerLevel**: A level 80 player loots a green sword from a level 60 mob. The upgrade searches for a blue sword with RequiredLevel 75-85, ensuring the upgrade is equippable.

**UseMobLevel + GeneralizeUpgrade**: A level 80 player kills a level 70 elite. The upgrade searches for any item (any type) with RequiredLevel 65-75 of the next quality tier.

**SkipQualityChance**: With 100 LOOT stat points and `SkipQualityChance = 0.002`, the skip chance is 20%. A green item has a 20% chance to become blue, a 4% chance to become epic, and a 0.8% chance to become legendary directly.

## Requirements

- AzerothCore
- Paragon system database with `character_paragon_stats` table
- Stat ID 17 (LOOT) must exist in `paragon_config_statistic`

## License

AGPL v3.0
