**Fantasy Voxel Civilisation Sandbox**

**05 - Items Registry**

*Version 0.1 - Detailed Design Bible Draft*

**A database-ready item system for survival, crafting, blocks, automation, magic, NPC economies, quests, loot, knowledge, and dimensions.**

Working design document - item system and database registry

# Document Purpose

This document defines the item system for the Fantasy Voxel Civilisation Sandbox. It explains what counts as an item, how items are categorised, how they link to blocks and recipes, how they support player progression, and how they connect to NPC villages, automation, magic, trade, combat, exploration, story, and dimensions.

The Items Registry is designed as both a readable design-bible document and a future database/spreadsheet foundation. It does not replace the future Recipe Registry, Automation System, Magic System, Economy System, NPC/Village System, Combat System, or Dimensions document. Instead, it creates the item-facing rules those later documents can reference.

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr class="header">
<th><strong>Numbering Note</strong><br />
The existing Blocks Registry source document refers to a future "04 - Items Registry" and "05 - Crafting and Recipe Registry". This working branch currently uses the title "05 - Items Registry" because that is the active document name requested for this stage. Later, the master index can be renumbered cleanly if needed.</th>
</tr>
</thead>
<tbody>
</tbody>
</table>

## Design Source

This document uses the four existing source documents as alignment anchors. Their shared rule is that resources, blocks, items, machines, magic, NPCs, villages, story, and dimensions should interconnect wherever practical.

| **Source Document**            | **Relevant Direction**                                                                                                                                                         | **How This Items Registry Uses It**                                                                                                      |
|--------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------|
| 00 - Master Game Design Bible  | Items must connect to the main hook: magic and factories feed villages, grow settlements, unlock stories, power civilisations, and reshape the world.                          | Item entries track connected systems, NPC use, village need, magic role, automation role, story role, and progression tier.              |
| 01 - Core Gameplay Loop        | The primary loop is explore -\> gather -\> craft -\> build -\> interact -\> automate -\> defend -\> upgrade -\> expand.                                                        | Items are sorted by how they support each loop step and include source/use fields.                                                       |
| 02 - Player Progression System | Progression is multi-track: materials, tools, skills, magic, automation, villages, reputation, exploration, dimensions, and morality.                                          | Tier is separate from rarity and item unlocks can come from gathering, crafting stations, NPCs, research, books, bosses, and dimensions. |
| 03 - Blocks Registry           | Blocks and items remain separate but linked. Blocks define physical placement and world behaviour; items define inventory, use, equipment, consumables, components, and trade. | Every block item form references a block entry. Standard item entries use their own item data model.                                     |

# Static Table of Contents

- 1\. Locked Item Registry Identity

- 2\. Player Answer Decision Summary

- 3\. Item System Architecture

- 4\. Parent Item Data Model

- 5\. Item Categories, Families, and Tags

- 6\. Block Item Forms and Block Registry Links

- 7\. Rarity, Quality, Tier, and Progression

- 8\. Inventory, Stack Size, Storage, and Backpacks

- 9\. Durability, Repair, Condition, and Maintenance

- 10\. Raw Resources and Refined Materials

- 11\. Tools and System Interaction Items

- 12\. Weapons, Armour, Equipment, and Accessories

- 13\. Food, Farming, Consumables, and Spoilage

- 14\. Magic Components and Magical Items

- 15\. Automation and Machine Components

- 16\. NPC Economy, Trade Goods, and Village Consumption

- 17\. Loot, Monster Drops, Treasure, Relics, and Trophies

- 18\. Books, Maps, Keys, Lore, and Knowledge Items

- 19\. Quest Items and Story State Items

- 20\. Dimension and Realm Items

- 21\. Unlocks, Research, Discovery, and Recipe Links

- 22\. Item Interactions With Blocks, NPCs, Magic, and Automation

- 23\. Proof-of-Concept Item Scope

- 24\. Full Game Item Category Matrix

- 25\. Detailed Item Registry v0.1

- 26\. Sample Detailed Item Entries

- 27\. Balancing Rules

- 28\. Open Questions for Later Documents

- Appendix A. POC Item Checklist

- Appendix B. Item Database Field Template

- Appendix C. Cross-System Use Matrix

- Appendix D. Future Item Family Backlog

# 1. Locked Item Registry Identity

Items are the inventory-facing layer of the game. They are what the player gathers, carries, crafts, equips, consumes, trades, studies, delivers, loots, repairs, and uses to trigger progression. Blocks define the world-facing physical object; items define the held, carried, traded, equipped, consumed, or recipe-facing object.

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr class="header">
<th><strong>Locked Rule</strong><br />
An item should never exist only because a list needed more content. Every item should support survival, crafting, building, automation, magic, NPC civilisation, combat, trade, exploration, story, progression, or world-state change.</th>
</tr>
</thead>
<tbody>
</tbody>
</table>

| **Identity Layer**    | **Design Meaning**                                                                          | **Player-Facing Result**                                                         |
|-----------------------|---------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------|
| Survival Object       | Food, tools, weapons, armour, torches, materials, water, medicine, backpacks.               | The player can live, gather, explore, fight, and recover.                        |
| Crafting Ingredient   | Raw resources, refined materials, components, runes, monster drops, lore recipes.           | Every production path has clear inputs and outputs.                              |
| Civilisation Resource | Village supply items, food, tools, guard equipment, cultural goods, construction materials. | NPCs consume real items for needs, growth, defence, morale, and trade.           |
| Automation Part       | Machine frames, gears, belts, pipes, cores, mana coils, batteries, filters.                 | Factories become buildable from visible components rather than abstract unlocks. |
| Magic Component       | Mana crystals, dust, runes, glyphs, essences, catalysts, ritual items.                      | Magic becomes practical infrastructure and craftable technology.                 |
| Progression Gate      | Keys, books, research pages, boss drops, dimension materials, faction seals.                | Discovery and achievement unlock new systems naturally.                          |
| Story Evidence        | Trophies, relics, quest items, damaged artifacts, faction goods, ancient coins.             | The world remembers what the player has done or found.                           |

# 2. Player Answer Decision Summary

| **Area**           | **Locked Decision**                                                                                                                                                                       |
|--------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Registry Scope     | All inventory objects, crafting inputs, tools, gear, food, machine parts, magic components, NPC goods, quest items, lore items, monster drops, dimension materials, and block item forms. |
| Block Relationship | Blocks and items stay separate but linked. Every placeable block has an item form that references the Blocks Registry.                                                                    |
| Planning Status    | Use POC Required, Alpha, Beta, Final Game, Placeholder, and Deferred status tags.                                                                                                         |
| Detail Level       | Full gameplay detail for every item over time, with v0.1 entries detailed enough for design and database planning.                                                                        |
| Rarity             | All items have rarity: Common, Uncommon, Rare, Epic, Legendary, Mythic, Relic.                                                                                                            |
| Visual Rarity      | Rarity can affect name colour, icon border, glow/VFX, texture/material variation, stats, durability, value, and special traits.                                                           |
| Progression Tier   | Progression tier is separate from rarity. Tier describes when and how the item enters the game.                                                                                           |
| Material Ladder    | Wood -\> Stone -\> Copper -\> Iron -\> Steel -\> Mana Crystal -\> Arcane Alloy -\> Mythril -\> Voidstone -\> Celestial Metal.                                                             |
| Inventory          | Slot-count inventory with craftable backpacks and inventory upgrades. Transport/storage uses slots, capacities, filters, and throughput rather than a default weight system.              |
| Stacking           | Category-based stacks. Non-block common items default to 64; block item forms may inherit the Blocks Registry stack default unless overridden.                                            |
| Durability         | Tools, weapons, and armour have durability, but repair is accessible through materials and stations.                                                                                      |
| Quality            | Crafted and loot gear can use Crude, Standard, Refined, Masterwork, and Legendary quality.                                                                                                |
| Food               | Food supports survival, buffs, NPC needs, cooking, farming, trade, and culture identity. Fresh food can spoil; cooked meals are more valuable.                                            |
| Magic Items        | Magic uses both physical components and mana. Runes can be item forms, placed blocks, and machine/item upgrades.                                                                          |
| Automation         | Machine items split into mechanical, magical, and hybrid magitech branches. Basic parts can be hand-crafted; advanced parts require stations/machines.                                    |
| NPC Economy        | Cultures produce unique trade goods, NPCs consume real items over time, prices can vary by supply, demand, and culture preference.                                                        |
| Loot               | Monster drops, dungeon loot, maps, keys, relics, trophies, and treasure all exist and can feed crafting, reputation, rituals, or trade.                                                   |
| Knowledge          | Books, scrolls, research notes, cultural texts, maps, and NPC teaching can unlock recipes, locations, dimensions, and enemy weaknesses.                                                   |
| POC Scope          | The POC registry should start at roughly 40-75 functional items, centred on survival basics, the first iron chain, village construction delivery, basic magic, and automation.            |
| Format             | Design document plus spreadsheet/database-ready fields. Use universal item fields with category-specific extensions.                                                                      |

# 3. Item System Architecture

The item system should be data-driven from the beginning. Items inherit shared behaviour from parent classes and category-specific templates rather than being hand-built as isolated one-off objects. This supports modding, spreadsheet import/export, balancing, UI filters, recipe searches, NPC requests, machine inventories, and future database storage.

| **Layer**            | **Purpose**                                                                          | **Examples**                                                                          |
|----------------------|--------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------|
| Base Item Definition | The parent object all inventory entries inherit from.                                | ID, display name, category, rarity, tier, stack size, icon, description, value, tags. |
| Category/Subcategory | Readable organisation and gameplay rules.                                            | Tool / Pickaxe, Magic Component / Rune, Food / Meal.                                  |
| Material Family      | Shared material behaviour and recipe compatibility.                                  | Wood, stone, copper, iron, mana, arcane alloy, mythril, voidstone.                    |
| Item Variant         | Specific item entry with unique ID.                                                  | item.tool.iron_pickaxe, item.material.iron_ingot.                                     |
| Runtime State        | Per-item instance state where needed.                                                | Durability, quality, charge, spoilage, owner, quest binding, enchantments.            |
| Connected Systems    | Links item to recipes, blocks, NPCs, automation, magic, economy, quests, dimensions. | Recipe inputs/outputs, village needs, machine fuel, magic charge, trade value.        |
| Planning Metadata    | Documentation layer not required in shipped item data.                               | POC Required, Alpha, Beta, Final Game, Placeholder, Deferred.                         |

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr class="header">
<th><strong>Important Data Rule</strong><br />
POC status, Alpha status, and Placeholder status are planning columns. They should not be hard gameplay properties inherited by an item. Shipped item data should remain clean and reusable.</th>
</tr>
</thead>
<tbody>
</tbody>
</table>

# 4. Parent Item Data Model

The parent item model prevents the registry from becoming unmanageable. A new pickaxe inherits from ToolItem, which inherits from BaseItem. A mana rune inherits from MagicComponentItem. A placeable block item inherits from BlockItemForm and references its block ID.

| **Parent Class / Data Layer** | **Inherits / Controls**                                                                                                       | **Example Children**                                |
|-------------------------------|-------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------|
| BaseItem                      | Core identity, display name, internal ID, icon, stack size, rarity, tags, value, unlock method, scope, and database metadata. | Every item.                                         |
| BlockItemForm                 | References block ID, placement rules, shape, rotation, state inheritance, and block stack overrides.                          | Oak Planks Item, Workbench Item, Ward Lantern Item. |
| ResourceItem                  | Gather source, raw/refined state, by-products, tool gates, biome/depth source, automation extraction compatibility.           | Raw Iron Ore, Plant Fibre, Mana Crystal.            |
| MaterialItem                  | Refining station, material family, tier, quality compatibility, recipe roles, trade use, NPC consumption.                     | Iron Ingot, Copper Wire, Leather, Cloth.            |
| ToolItem                      | Tool class, harvest level, durability, repair material, block interactions, secondary use, upgrade sockets.                   | Pickaxe, Axe, Hammer, Wrench, Rune Chisel.          |
| WeaponItem                    | Damage profile, attack speed, range, handedness, durability, quality, enchantment sockets, combat style.                      | Iron Sword, Spear, Bow, Staff.                      |
| ArmourItem                    | Slot, defence, movement impact, durability, set link, elemental/magic properties, repair material.                            | Leather Tunic, Iron Helmet, Mage Robe.              |
| ConsumableItem                | Use action, effects, duration, spoilage, cooldown, stack behaviour, NPC value, recipe link.                                   | Bread, Simple Stew, Healing Potion, Scroll.         |
| MagicComponentItem            | Mana charge, school affinity, ritual role, purity, corruption risk, fuel value, rune/slot compatibility.                      | Mana Dust, Basic Rune, Wisp Core.                   |
| MachinePartItem               | Mechanical/magical branch, component role, tier, station requirement, automation unlock, maintenance use.                     | Machine Frame, Gear, Sorter Core, Mana Coil.        |
| TradeGoodItem                 | Culture preference, supply/demand behaviour, NPC consumption, export/import role, reputation hooks.                           | Dwarven Tools, Grain Sack, Festival Goods.          |
| QuestItem                     | Quest binding, trophy state, usage restrictions, unlock triggers, post-quest conversion rules.                                | Builder Request Slip, Old Key, Broken Seal.         |
| KnowledgeItem                 | Readable content type, codex unlock, recipe unlock, map reveal, research value, cultural knowledge.                           | Recipe Scroll, Research Note, Map Fragment.         |
| DimensionItem                 | Realm source, portal role, overworld utility, hazard/corruption rules, rarity, story significance.                            | Voidstone Shard, Dream Glass, Fae Seed.             |

# 5. Item Categories, Families, and Tags

Every item should have a primary category, subcategory, material family where applicable, and tags. Categories help the player and designers browse the registry. Tags help recipes, NPCs, machines, magic systems, loot tables, UI filters, searches, and save data.

| **Top-Level Category** | **Purpose**                                                                                        | **Examples**                                                   | **System Role**                                |
|------------------------|----------------------------------------------------------------------------------------------------|----------------------------------------------------------------|------------------------------------------------|
| Block Item Forms       | Inventory representations of placeable blocks, generated from or linked to block entries.          | Oak Log Block Item, Stone Furnace Item, Village Warehouse Item | Building, placement, storage, village projects |
| Raw Resources          | Unprocessed materials gathered, mined, harvested, hunted, or looted.                               | Raw Iron Ore, Oak Log, Plant Fibre, Mana Crystal               | Gathering, crafting, trade, village needs      |
| Refined Materials      | Processed outputs used in recipes, construction, equipment, machines, and trade.                   | Iron Ingot, Copper Wire, Stone Brick, Leather, Cloth           | Crafting, gear, machines, construction         |
| Machine Components     | Mechanical, magical, and hybrid parts used for stations, machines, logistics, power, and upgrades. | Machine Frame, Gear, Mana Coil, Filter Screen                  | Automation, factories, village infrastructure  |
| Tools                  | Items that break blocks, interact with systems, shape terrain, build, repair, or tune machines.    | Pickaxe, Axe, Wrench, Rune Tuner, Blueprint Tool               | Mining, building, farming, automation, repair  |
| Weapons                | Combat items for melee, ranged, magic, and hybrid playstyles.                                      | Sword, Spear, Bow, Staff, Wand, Spellbook                      | Combat, defence, raids, dungeons               |
| Armour and Equipment   | Wearable defensive gear, shields, robes, backpacks, accessories, and utility equipment.            | Leather Tunic, Iron Helm, Mage Robe, Backpack, Ring            | Survival, combat, magic, carrying capacity     |
| Food and Consumables   | Food, drink, potions, elixirs, scrolls, traps, throwables, and single-use items.                   | Bread, Stew, Healing Potion, Scroll, Bomb                      | Survival, buffs, NPC needs, combat             |
| Magic Components       | Physical magical ingredients, runes, glyphs, essences, catalysts, and charge items.                | Basic Rune, Mana Dust, Wisp Core, Elemental Shard              | Magic crafting, rituals, machines, spells      |
| NPC Trade Goods        | Economy-facing items produced, requested, consumed, or culturally valued by villages and factions. | Tool Bundle, Grain Sack, Festival Goods, Religious Icon        | Trade, reputation, culture, village needs      |
| Quest and Story Items  | Items used for quests, trophies, proof of completion, story gates, or world-state triggers.        | Builder Request Slip, Old Key, Broken Seal, Trophy Fang        | Quests, events, story, NPC reactions           |
| Knowledge Items        | Readable or studyable items that teach recipes, lore, maps, culture, dimensions, or weaknesses.    | Recipe Scroll, Research Page, Map Fragment, Lore Book          | Unlocks, codex, research, exploration          |
| Loot and Treasure      | Items found in dungeons, ruins, chests, bosses, monsters, and special events.                      | Ancient Coin, Relic Gem, Rusted Artifact, Boss Core            | Rewards, trade, crafting, reputation, rituals  |
| Dimension Items        | Realm-specific materials and artifacts that remain useful in the overworld.                        | Voidstone Shard, Fae Seed, Dream Glass, Celestial Fragment     | Dimensions, high-tier magic, endgame machines  |

| **Tag Type**    | **Example Tags**                                                                       | **Used By**                                                 |
|-----------------|----------------------------------------------------------------------------------------|-------------------------------------------------------------|
| Physical        | small, bulky, fragile, heavy-object, liquid-container, edible, wearable, placeable     | Inventory, storage, UI, equipment, carrying upgrades.       |
| Material        | wood, stone, metal, fibre, cloth, leather, crystal, rune, organic, corrupted           | Recipes, substitutions, village requests, crafting filters. |
| System          | crafting, automation, magic, village-use, npc-consumed, quest, research, trade, combat | Cross-system logic and search filters.                      |
| Tool/Equipment  | pickaxe, axe, shovel, hoe, wrench, rune-tool, weapon, armour, accessory                | Tool behaviour, durability, equipment slots.                |
| Food/Consumable | food, drink, potion, spoilable, buff, healing, throwable, scroll                       | Use effects, spoilage, NPC food systems.                    |
| Economy         | currency, trade-good, culture-good, high-value, luxury, shortage-sensitive             | Village economy and price rules.                            |
| Unlock          | starter, crafted, researched, npc-taught, faction, boss, dimension, hidden             | Progression, recipe book, discovery UI.                     |
| Risk            | flammable, cursed, unstable, explosive, poisonous, forbidden, corrupting               | Hazards, legality, faction reaction, dark magic risk.       |

# 6. Block Item Forms and Block Registry Links

Every placeable block has an inventory item form. However, the Blocks Registry remains the source of truth for physical placement, collision, shape, block states, mining behaviour, and world generation. The Items Registry stores the carried form, stack behaviour, value, inventory tags, trading behaviour, and link back to the block ID.

Block item forms should be generated automatically from block data where possible, with overrides for special cases such as functional blocks, hazards, magical blocks, village ownership blocks, and dimension blocks.

| **Block Registry Field** | **Item Registry Field** | **Rule**                                                                   |
|--------------------------|-------------------------|----------------------------------------------------------------------------|
| Block ID                 | block_ref_id            | Every placeable block item stores the source block ID.                     |
| Display Name             | display_name            | Usually inherited, but item form may be named differently if useful.       |
| Block Category           | category/subcategory    | Item form may use Block Item / Construction, Block Item / Functional, etc. |
| Stack Size               | stack_size              | Can inherit block default or override with item category rules.            |
| Placement Rules          | placeable_component     | Handled by block system, exposed through item use action.                  |
| Mining Drops             | source/drops            | Block drops can create item entries or reference existing resource items.  |
| Rarity/Unlock            | rarity/unlock_method    | Shared if the block itself is progression-gated.                           |

# 7. Rarity, Quality, Tier, and Progression

Rarity describes access, value, special function, lore weight, visual treatment, and possible power. Tier describes progression timing and system unlocks. Quality describes the workmanship or condition of an item instance. These three concepts must stay separate.

Example: an Iron Sword is Tier 3 Iron and Common rarity by default, but an Iron Sword can be Crude, Standard, Refined, Masterwork, or Legendary quality. A Relic Copper Gear could be low material tier but high rarity because it is ancient and story-important.

## 7.1 Rarity Scale

| **Rarity** | **Typical Use**                                                                     | **Visual Direction**                               | **Progression Role**                      |
|------------|-------------------------------------------------------------------------------------|----------------------------------------------------|-------------------------------------------|
| Common     | Regular resources, simple tools, basic materials, early food, starter components.   | White/neutral icon border; no glow.                | Core survival and POC items.              |
| Uncommon   | Mana basics, quality components, special resources, early magic, specialised tools. | Green/blue border; subtle highlight if magical.    | Early-mid progression.                    |
| Rare       | Advanced magic, strong loot, specialised culture goods, high-tier machine cores.    | Distinct border; mild glow or shimmer.             | Mid-game and story/quest rewards.         |
| Epic       | Major artifacts, powerful gear, boss drops, dimension keys, rare research outputs.  | Strong border and visual effects.                  | Late-game or major arcs.                  |
| Legendary  | Named relics, masterwork gear, civilisation-scale keys, unique boss rewards.        | Major icon treatment and lore panel.               | Endgame and major story outcomes.         |
| Mythic     | World-shaping items, realm-scale artifacts, divine/ancient technology.              | Unique VFX and audio identity.                     | Very late/endgame.                        |
| Relic      | Ancient one-of-a-kind items with historical, magical, or story weight.              | Unique icon frame, lore styling, display priority. | Ruins, dimensions, major faction stories. |

## 7.2 Quality Scale

| **Quality** | **Gameplay Meaning**                                                          | **Where It Appears**                                      |
|-------------|-------------------------------------------------------------------------------|-----------------------------------------------------------|
| Crude       | Improvised, low durability, lower value, slightly worse stats.                | Starter survival, goblin/bandit gear, emergency crafting. |
| Standard    | Default crafted baseline.                                                     | Most hand-crafted or NPC basic goods.                     |
| Refined     | Improved durability, value, precision, or efficiency.                         | Better stations, higher-quality materials, trained NPCs.  |
| Masterwork  | High stat/value item with strong durability and possible trait slot.          | Specialist NPCs, high crafting skill, rare components.    |
| Legendary   | Exceptional quality state usually tied to named gear, relics, or major feats. | Bosses, major stories, ancient forges, endgame crafting.  |

## 7.3 Material and Progression Tier Ladder

| **Tier**                         | **Representative Items**                                                      | **Player Meaning**                                    |
|----------------------------------|-------------------------------------------------------------------------------|-------------------------------------------------------|
| Tier 0 - Primitive Survival      | Sticks, fibre, berries, crude tools, stone chunks, basic torch materials.     | Survive first day, basic gathering, first shelter.    |
| Tier 1 - Wood and Stone          | Wood planks, stone tools, cobblestone, clay, simple food, basic storage.      | Classic sandbox start and first village help.         |
| Tier 2 - Copper Mechanisms       | Copper ingots, wire, plates, gears, machine frame, chutes, crank parts.       | First automation and machine crafting.                |
| Tier 3 - Iron Settlement Support | Iron tools, weapons, plates, rods, nails, guard equipment, watchtower supply. | Village defence, stronger tools, POC raid loop.       |
| Tier 4 - Steel and Industry      | Steel ingots, reinforced frames, advanced machinery, stronger armour.         | Regional production and larger village projects.      |
| Tier 5 - Mana Infrastructure     | Mana crystals, runes, mana dust, conduits, ward cores, mana batteries.        | Magic utility, wards, mana machines.                  |
| Tier 6 - Arcane Alloy            | Hybrid magitech materials, arcane circuits, advanced machine cores.           | Industrial fantasy and advanced automation.           |
| Tier 7 - Mythril                 | High-tier magical metal, advanced gear, enchantment-focused materials.        | Late adventure, high magic, specialised equipment.    |
| Tier 8 - Voidstone               | Dimensional ore, portal materials, void shards, unstable catalysts.           | Dimension logistics and high-risk magic.              |
| Tier 9 - Celestial Metal         | Endgame civilisation materials, world-shaping components.                     | Endgame construction, artifacts, realm-scale systems. |

# 8. Inventory, Stack Size, Storage, and Backpacks

The default player inventory uses slot count with craftable backpacks and upgrade items. This keeps the game readable like a voxel sandbox while still allowing progression through bags, tool belts, satchels, linked storage, and late-game magic storage.

Weight is not a default player inventory rule for v0.1. Transport and storage systems instead use stack counts, slots, throughput, input/output rules, permissions, filters, and container capacities.

| **Item Type**                   | **Default Stack**                                                                                          | **Notes**                                                                 |
|---------------------------------|------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------|
| Block item forms                | 100 by default if inheriting Blocks Registry rules; may be 64 if inventory consistency is preferred later. | Large, functional, dangerous, magical, or special blocks can stack lower. |
| Basic resources                 | 64                                                                                                         | Logs, sticks, fibre, stone chunks, raw ores, common drops.                |
| Refined materials               | 64                                                                                                         | Ingots, plates, rods, wires, bricks, planks, cloth, leather.              |
| Small machine components        | 64                                                                                                         | Gears, rods, wires, bolts, nails, chute segments.                         |
| Large machine components        | 16 or 32                                                                                                   | Frames, cores, miner heads, batteries, engine housings.                   |
| Tools, weapons, armour, shields | 1                                                                                                          | Durability and quality prevent stacking.                                  |
| Food ingredients                | 64                                                                                                         | Grain, berries, mushrooms, raw crops.                                     |
| Cooked meals                    | 8 or 16                                                                                                    | Meals are more valuable and can spoil.                                    |
| Potions, scrolls, bombs, traps  | 8 or 16                                                                                                    | Balance depends on power and inventory pressure.                          |
| Quest, key, relic, trophy items | 1                                                                                                          | Usually unique or story-bound.                                            |
| Currency and tokens             | 999 or currency wallet                                                                                     | Final UI may abstract currency away from physical slots.                  |

# 9. Durability, Repair, Condition, and Maintenance

Tools, weapons, armour, shields, and some magical equipment use durability. Repair exists and should be accessible through materials and stations so durability adds consequence without becoming annoying. Machines do not randomly decay by default, but overloaded machines, magical storms, sieges, harsh difficulty, or incorrect use can create maintenance needs.

Quality and durability interact: better quality generally improves durability, efficiency, value, and sometimes trait slots. Crude items break quickly, standard items are baseline, refined items are dependable, masterwork items are valuable, and legendary quality is exceptional.

# 10. Raw Resources and Refined Materials

Raw resources are gathered from the world. Refined materials are created through crafting stations, smelting, milling, alchemy, magic processing, NPC workshops, or automation. Both should remain useful beyond their first tier. Copper remains useful for wiring and mechanisms. Stone remains useful for construction and village projects. Mana crystals remain useful for machines, wards, research, and portals.

Ores should generally convert into raw ore items and then refined ingots/materials. This keeps item processing clear and lets machines, enchantments, skills, and by-products matter.

# 11. Tools and System Interaction Items

Tools are not only speed upgrades. They unlock interactions: pickaxes mine harder blocks, axes chop trees, hoes till farmland, hammers craft plates and repair structures, wrenches configure machines, rune tuners configure mana networks, rune chisels inscribe magic, and blueprint tools plan construction.

Every major system should have one or more interaction tools so complex systems remain readable to the player.

# 12. Weapons, Armour, Equipment, and Accessories

Combat equipment supports melee, ranged, magic, and hybrid playstyles. Armour supports light, medium, heavy, magical robes, cultural armour, and specialist gear. Accessories such as rings, amulets, belts, cloaks, trinkets, charms, and backpacks give long-term progression without replacing the core tool/material ladder.

Tools can be used as weapons, but most tools are worse than dedicated weapons unless specifically designed as combat tools, such as axes and hammers.

# 13. Food, Farming, Consumables, and Spoilage

Food supports survival, buffs, NPC needs, cooking, farming, trade, and culture identity. Fresh food can spoil; cooked meals and preserved foods have better value and usefulness. Spoilage should apply primarily to fresh food, with relaxed settings able to reduce or disable it.

Consumables include food, drink, potions, elixirs, scrolls, spell consumables, bombs, traps, and throwables. Cooked meals should be more useful than raw ingredients and more valuable to NPCs.

# 14. Magic Components and Magical Items

Magic uses both mana and physical components. Mana crystals, mana shards, mana dust, monster essence, runes, glyphs, elemental shards, and ritual catalysts make magic feel grounded in the world economy. Runes can exist as items, placed blocks, and upgrades attached to items or machines.

Magical items may have active abilities, passive effects, mana charges, durability-like magical charge, or fuel requirements. Powerful items usually require mana charge or components so magic remains strong without invalidating tools, machines, or NPC labour.

# 15. Automation and Machine Components

Automation items include frames, gears, shafts, rods, pipes, wires, conveyor parts, sorters, filters, mana conduits, rune circuits, batteries, machine cores, miner heads, and power components. The system has mechanical, magical, and hybrid magitech branches.

Basic machine parts can be hand-crafted so the player can enter automation early. Advanced parts require specialised stations, machines, NPC knowledge, research, magic, or dimension materials.

# 16. NPC Economy, Trade Goods, and Village Consumption

NPC cultures produce unique trade goods and consume real items over time. Villages can require food, fuel, tools, materials, medicine, luxury goods, religious/cultural goods, machine parts, and guard equipment. This makes the item economy feed directly into village growth and world consequences.

Item value can vary by supply, demand, location, culture, reputation, and quality. NPCs should prefer to buy what they need rather than acting like infinite generic shops.

# 17. Loot, Monster Drops, Treasure, Relics, and Trophies

Monster drops should usually make sense by creature type. Humanoid enemies can drop gear, coins, badges, scraps, and tools. Magical creatures can drop essence, cores, shards, and reagents. Bosses and dungeons can drop unique items, relics, books, rare crafting materials, and maps.

Treasure should not only be sellable. Some treasure is decorative, some is ritual material, some improves reputation when donated, and some unlocks story or research.

# 18. Books, Maps, Keys, Lore, and Knowledge Items

Books and lore exist as both physical items and codex/journal unlocks. Recipe scrolls, NPC teaching notes, research pages, maps, cultural books, religious texts, and old manuals can unlock recipes, reveal locations, expose enemy weaknesses, teach language/culture rules, or point toward dimensions.

Knowledge items are especially important because they let exploration, NPCs, and ruins unlock gameplay without relying only on level gates.

# 19. Quest Items and Story State Items

Quest items should often become trophies, lore items, keys, reputation proof, or usable components after their quest ends. This prevents important items from feeling like dead inventory. Some quest items remain locked to quests, but many should have a later purpose.

Examples include builder request slips, warehouse manifests, old keys, broken seals, faction seals, captured banners, boss trophies, map fragments, and restored relics.

# 20. Dimension and Realm Items

Dimension items are mid-to-end-game resources and story objects. They should never exist only as recoloured materials. They should unlock new machines, magic, settlement upgrades, tools, hazards, bosses, rituals, portals, or world-state choices.

Voidstone, fae seeds, dream glass, infernal ash, deep forge embers, and celestial metal should remain useful in the overworld through machines, magic, construction, village upgrades, and high-tier recipes.

# 21. Unlocks, Research, Discovery, and Recipe Links

Items unlock through gathering, crafting stations, NPC teaching, trade, research, books, ruins, bosses, dimensions, faction reputation, and events. Hidden recipes should encourage exploration, with silhouettes or unknown entries where useful.

Every item entry should eventually list unlock requirements, source links, output recipes, input recipes, NPC uses, automation uses, magic uses, and related blocks.

# 22. Item Interactions With Blocks, NPCs, Magic, and Automation

Items can plant crops, repair blocks, fuel machines, charge magic, unlock portals, display as decoration, satisfy NPC needs, trigger rituals, route through automation, or become block item forms. Dropped items should appear physically in the world, use despawn timers, and be collectable by NPCs or machines where appropriate.

Display/decor rules should allow books, trophies, relics, armour, weapons, tools, and many special items to be shown in homes, halls, museums, shrines, or player bases.

# 23. Proof-of-Concept Item Scope

The POC item set should contain roughly 40-75 functional items. The purpose is not to create hundreds of content entries immediately, but to prove the core identity: gather resources, craft tools, automate part of production, deliver items to the village warehouse, let NPCs consume real items, and change the raid outcome.

The main POC chain is Iron Ore -\> Iron Ingots -\> Watchtower/Village Defence, supported by wood, stone, copper mechanisms, mana crystals, basic runes, village requests, simple food, and goblin raid drops.

| **POC Item Family**   | **Representative Items**                                                     | **Purpose**                                                |
|-----------------------|------------------------------------------------------------------------------|------------------------------------------------------------|
| Survival Basics       | Sticks, fibre, berries, water flask, crude tools, stone chunks, coal.        | First 5-15 minutes and basic survival.                     |
| Wood/Stone Building   | Oak logs, planks, beams, cobblestone, stone brick, thatch, glass.            | Shelter, village watchtower, cosy village visuals.         |
| Copper Mechanisms     | Copper ore, ingots, wire, plates, gears, machine frame.                      | Entry into automation and machine recipes.                 |
| Iron Defence Chain    | Raw iron ore, iron ingot, iron plate, iron rod, iron nails, iron sword.      | Main POC chain for watchtower and guard defence.           |
| Magic Utility         | Mana crystal, mana shard, mana dust, blank rune, basic rune, ward core.      | Mana furnace, ward lantern, rune table, mage tutorial.     |
| Automation Components | Machine core, miner head, chute segment, furnace core, mana furnace core.    | Basic miner -\> furnace -\> storage -\> village warehouse. |
| Village Economy       | Trade coin, supply token, builder request slip, warehouse manifest.          | Delivery tracking, reputation, project visibility.         |
| Combat/Loot           | Goblin scrap, crude goblin blade, weak monster essence, arrows, bow, shield. | Raid rewards and combat proof.                             |
| Knowledge Hooks       | Torn research page, basic rune note, local map fragment.                     | Tutorial, magic unlock, first ruin/cave/camp direction.    |

# 24. Full Game Item Category Matrix

This matrix maps the full item family space. Later documents can drill into exact recipes, prices, station requirements, loot tables, culture-specific goods, progression gates, and balancing values.

| **Category**      | **Family**                 | **Examples**                                                    | **System Role**                                             |
|-------------------|----------------------------|-----------------------------------------------------------------|-------------------------------------------------------------|
| Block Forms       | Terrain/Construction       | Grass item, planks item, stone brick item, roof item            | Placement, building, village construction, inventory.       |
| Block Forms       | Functional/Magic           | Workbench item, mana furnace item, ward lantern item            | Station placement, magic infrastructure, automation.        |
| Raw Resources     | Natural                    | Logs, sticks, fibre, herbs, reeds, mushrooms, berries           | Gathering, farming, food, alchemy, early crafting.          |
| Raw Resources     | Ores/Crystals              | Raw copper ore, raw iron ore, mana crystal, voidstone shard     | Smelting, magic fuel, progression, machine input.           |
| Refined Materials | Wood/Stone/Clay            | Planks, beams, stone brick, clay brick, roof tiles, glass       | Construction, village projects, crafting.                   |
| Refined Materials | Metals                     | Copper ingot, iron ingot, steel plate, arcane alloy, mythril    | Tools, gear, machines, defences, trade.                     |
| Components        | Mechanical                 | Gears, rods, shafts, belts, pipes, frames, cores                | Automation, machines, power, repairs.                       |
| Components        | Magical/Magitech           | Runes, mana coils, mana battery cores, portal stabilisers       | Mana machines, wards, portals, advanced automation.         |
| Tools             | Gathering                  | Pickaxe, axe, shovel, hoe, sickle                               | Mining, chopping, digging, farming, harvesting.             |
| Tools             | System Tools               | Hammer, wrench, rune tuner, rune chisel, blueprint tool         | Repair, automation config, magic config, planning.          |
| Weapons           | Melee/Ranged               | Sword, spear, axe, mace, bow, crossbow, arrows, bolts           | Combat, hunting, village defence.                           |
| Weapons           | Magic/Hybrid               | Wand, staff, spellbook, rune blade, spell focus                 | Magic combat, utility, hybrid playstyles.                   |
| Armour/Equipment  | Armour/Shields             | Leather tunic, iron plate, robes, shields                       | Defence, magic bonuses, cultural gear.                      |
| Armour/Equipment  | Accessories/Carry          | Backpack, tool belt, ring, amulet, cloak, charm                 | Inventory, utility, identity, long-term progression.        |
| Food/Consumables  | Food/Drink                 | Berries, bread, cooked meat, stew, water flask, tea             | Survival, buffs, NPC needs, trade.                          |
| Food/Consumables  | Potions/Scrolls/Throwables | Healing potion, recall scroll, bombs, traps                     | Combat, exploration, utility, magic.                        |
| Economy           | Currency/Trade Goods       | Coins, grain sacks, tool bundles, festival goods, culture goods | Village economy, trade routes, reputation, NPC consumption. |
| Loot/Treasure     | Monster Drops              | Goblin scrap, fang, pelt, wisp core, essence                    | Crafting, alchemy, trophies, quests.                        |
| Loot/Treasure     | Dungeon/Relics             | Ancient coins, relic gems, machine cores, artifacts             | Rewards, research, story, rituals.                          |
| Knowledge         | Books/Maps/Recipes         | Research pages, recipe scrolls, maps, cultural books            | Unlocks, guidance, codex, exploration.                      |
| Quest/Story       | Keys/Trophies/Seals        | Old key, broken seal, faction seal, captured banner             | Story gates, proof, reputation, world state.                |
| Dimensions        | Realm Materials            | Fae seed, dream glass, infernal ash, celestial fragment         | Realms, endgame machines, magic, world-state choices.       |

# 25. Detailed Item Registry v0.1

The following 167 entries define the v0.1 item registry target. They are not final balance values, but each row is detailed enough to guide design, spreadsheet creation, future database structure, and POC planning. Scope is a planning field, not core item data.

## 25.1 POC Required Items

<table>
<colgroup>
<col style="width: 12%" />
<col style="width: 12%" />
<col style="width: 12%" />
<col style="width: 12%" />
<col style="width: 12%" />
<col style="width: 12%" />
<col style="width: 12%" />
<col style="width: 12%" />
</colgroup>
<thead>
<tr class="header">
<th><strong>ID</strong></th>
<th><strong>Display Name</strong></th>
<th><strong>Category</strong></th>
<th><strong>Rarity / Tier</strong></th>
<th><strong>Stack</strong></th>
<th><strong>Source</strong></th>
<th><strong>Main Uses / Connections</strong></th>
<th><strong>Scope</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>item.resource.log_oak</td>
<td>Oak Log</td>
<td>Raw Resource / Wood</td>
<td>Common<br />
T1 Wood</td>
<td>64</td>
<td>Chopped from oak trees or bought from village lumber workers.</td>
<td>Planks, beams, fuel, workbench, village building projects; linked to block natural.log.oak.</td>
<td>POC Required</td>
</tr>
<tr class="even">
<td>item.resource.stick</td>
<td>Stick</td>
<td>Raw Resource / Plant</td>
<td>Common<br />
T0 Survival</td>
<td>64</td>
<td>Branches, leaf decay, bushes, or crude crafting.</td>
<td>Crude tools, torches, arrows, fences, early machines.</td>
<td>POC Required</td>
</tr>
<tr class="odd">
<td>item.resource.plant_fibre</td>
<td>Plant Fibre</td>
<td>Raw Resource / Fibre</td>
<td>Common<br />
T0 Survival</td>
<td>64</td>
<td>Tall grass, reeds, bushes, crop waste.</td>
<td>Rope, thatch, simple tools, cloth path, starter repairs.</td>
<td>POC Required</td>
</tr>
<tr class="even">
<td>item.resource.thatch_bundle</td>
<td>Thatch Bundle</td>
<td>Processed Material / Fibre</td>
<td>Common<br />
T1 Wood</td>
<td>64</td>
<td>Crafted from fibre, reeds, or straw.</td>
<td>Thatch roof blocks, bedding, village homes, temporary insulation.</td>
<td>POC Required</td>
</tr>
<tr class="odd">
<td>item.resource.stone_chunk</td>
<td>Stone Chunk</td>
<td>Raw Resource / Stone</td>
<td>Common<br />
T1 Stone</td>
<td>64</td>
<td>Mining stone, surface boulders, cave rubble.</td>
<td>Stone tools, furnace, cobblestone, roads, village repairs.</td>
<td>POC Required</td>
</tr>
<tr class="even">
<td>item.resource.flint</td>
<td>Flint</td>
<td>Raw Resource / Stone</td>
<td>Common<br />
T0 Survival</td>
<td>64</td>
<td>Gravel drops and surface pebble nodes.</td>
<td>Starter blades, arrows, fire-starting, crude tools.</td>
<td>POC Required</td>
</tr>
<tr class="odd">
<td>item.resource.clay_lump</td>
<td>Clay Lump</td>
<td>Raw Resource / Clay</td>
<td>Common<br />
T1 Stone</td>
<td>64</td>
<td>Clay blocks, riverbanks, clay pits.</td>
<td>Clay bricks, pottery, roof tiles, alchemy containers.</td>
<td>POC Required</td>
</tr>
<tr class="even">
<td>item.resource.sand</td>
<td>Sand</td>
<td>Raw Resource / Loose</td>
<td>Common<br />
T1 Stone</td>
<td>64</td>
<td>Sand blocks near rivers, beaches, deserts.</td>
<td>Glass, mortar, construction, alchemy later.</td>
<td>POC Required</td>
</tr>
<tr class="odd">
<td>item.resource.coal_chunk</td>
<td>Coal Chunk</td>
<td>Raw Resource / Fuel</td>
<td>Common<br />
T1 Stone</td>
<td>64</td>
<td>Coal ore, trader stock, cave deposits.</td>
<td>Fuel for furnace, torches, early engines, trade.</td>
<td>POC Required</td>
</tr>
<tr class="even">
<td>item.resource.raw_copper_ore</td>
<td>Raw Copper Ore</td>
<td>Raw Resource / Ore</td>
<td>Common<br />
T2 Copper</td>
<td>64</td>
<td>Copper ore blocks and basic miner extraction.</td>
<td>Smelts to copper ingots; early mechanisms, wires, machine parts.</td>
<td>POC Required</td>
</tr>
<tr class="odd">
<td>item.material.copper_ingot</td>
<td>Copper Ingot</td>
<td>Refined Material / Metal</td>
<td>Common<br />
T2 Copper</td>
<td>64</td>
<td>Smelt raw copper ore in furnace or mana furnace.</td>
<td>Wires, plates, gears, machine frames, early tools, trade.</td>
<td>POC Required</td>
</tr>
<tr class="even">
<td>item.material.copper_wire</td>
<td>Copper Wire</td>
<td>Machine Material / Metal</td>
<td>Common<br />
T2 Copper</td>
<td>64</td>
<td>Crafted from copper ingots at workbench/forge.</td>
<td>Basic machines, power links, mana hybrid circuits later.</td>
<td>POC Required</td>
</tr>
<tr class="odd">
<td>item.material.copper_plate</td>
<td>Copper Plate</td>
<td>Machine Material / Metal</td>
<td>Common<br />
T2 Copper</td>
<td>64</td>
<td>Hammered or crafted from copper ingots.</td>
<td>Machine frames, chutes, panels, village workshop upgrades.</td>
<td>POC Required</td>
</tr>
<tr class="even">
<td>item.component.gear_copper</td>
<td>Copper Gear</td>
<td>Machine Component / Mechanical</td>
<td>Common<br />
T2 Copper</td>
<td>64</td>
<td>Crafted from copper ingots/plates.</td>
<td>Basic miner, water wheel parts, machine assembler recipes.</td>
<td>POC Required</td>
</tr>
<tr class="odd">
<td>item.resource.raw_iron_ore</td>
<td>Raw Iron Ore</td>
<td>Raw Resource / Ore</td>
<td>Common<br />
T3 Iron</td>
<td>64</td>
<td>Iron ore blocks and basic miner extraction.</td>
<td>Smelts to iron ingots; main POC village defence chain.</td>
<td>POC Required</td>
</tr>
<tr class="even">
<td>item.material.iron_ingot</td>
<td>Iron Ingot</td>
<td>Refined Material / Metal</td>
<td>Common<br />
T3 Iron</td>
<td>64</td>
<td>Smelt raw iron ore in furnace or mana furnace.</td>
<td>Tools, weapons, guard gear, watchtower, machine parts, trade.</td>
<td>POC Required</td>
</tr>
<tr class="odd">
<td>item.material.iron_plate</td>
<td>Iron Plate</td>
<td>Machine Material / Metal</td>
<td>Common<br />
T3 Iron</td>
<td>64</td>
<td>Forge or workbench processing from iron ingots.</td>
<td>Watchtower fittings, machine frames, armour, stronger blocks.</td>
<td>POC Required</td>
</tr>
<tr class="even">
<td>item.material.iron_rod</td>
<td>Iron Rod</td>
<td>Machine Material / Metal</td>
<td>Common<br />
T3 Iron</td>
<td>64</td>
<td>Crafted from iron ingots at forge/anvil.</td>
<td>Tools, weapons, miner head, hinges, machine shafts.</td>
<td>POC Required</td>
</tr>
<tr class="odd">
<td>item.material.iron_nails</td>
<td>Iron Nails</td>
<td>Construction Material / Metal</td>
<td>Common<br />
T3 Iron</td>
<td>64</td>
<td>Crafted from iron rods or ingots.</td>
<td>Watchtower build costs, doors, furniture, village repair projects.</td>
<td>POC Required</td>
</tr>
<tr class="even">
<td>item.resource.raw_mana_crystal</td>
<td>Raw Mana Crystal</td>
<td>Raw Resource / Magic</td>
<td>Uncommon<br />
T5 Mana</td>
<td>64</td>
<td>Mined from mana crystal ore or found in ruins.</td>
<td>Mana furnace fuel, rune table, ward lantern, mage requests, magic unlock.</td>
<td>POC Required</td>
</tr>
<tr class="odd">
<td>item.resource.mana_shard</td>
<td>Mana Shard</td>
<td>Magic Component / Crystal</td>
<td>Uncommon<br />
T5 Mana</td>
<td>64</td>
<td>By-product from mana crystal mining or crystal breaking.</td>
<td>Basic runes, mana dust, small machine charges, early magic recipes.</td>
<td>POC Required</td>
</tr>
<tr class="even">
<td>item.resource.mana_dust</td>
<td>Mana Dust</td>
<td>Magic Component / Powder</td>
<td>Uncommon<br />
T5 Mana</td>
<td>64</td>
<td>Ground from mana shards or alchemy processing.</td>
<td>Runes, ward cores, spell fuel, magic crafting, research.</td>
<td>POC Required</td>
</tr>
<tr class="odd">
<td>item.material.blank_rune_stone</td>
<td>Blank Rune Stone</td>
<td>Magic Component / Rune Base</td>
<td>Common<br />
T5 Mana</td>
<td>64</td>
<td>Crafted from stone brick, mana dust, and clay binder.</td>
<td>Inscribed into basic runes for machines, wards, and spells.</td>
<td>POC Required</td>
</tr>
<tr class="even">
<td>item.magic.rune.basic</td>
<td>Basic Rune</td>
<td>Magic Component / Rune</td>
<td>Uncommon<br />
T5 Mana</td>
<td>64</td>
<td>Inscribed at the rune table using blank rune stone and mana dust.</td>
<td>Mana furnace upgrade, ward lantern, mana conduit, rune tutorial.</td>
<td>POC Required</td>
</tr>
<tr class="odd">
<td>item.magic.core.ward_basic</td>
<td>Basic Ward Core</td>
<td>Magic Component / Ward</td>
<td>Uncommon<br />
T5 Mana</td>
<td>16</td>
<td>Crafted at rune table from basic runes and mana crystals.</td>
<td>Ward lanterns, village defence, anti-monster safety, mage role.</td>
<td>POC Required</td>
</tr>
<tr class="even">
<td>item.material.plank_oak</td>
<td>Oak Plank</td>
<td>Processed Material / Wood</td>
<td>Common<br />
T1 Wood</td>
<td>64</td>
<td>Crafted from oak logs by hand or sawmill.</td>
<td>Shelter, workbench, village buildings, machine frames.</td>
<td>POC Required</td>
</tr>
<tr class="odd">
<td>item.material.beam_oak</td>
<td>Oak Beam</td>
<td>Construction Material / Wood</td>
<td>Common<br />
T1 Wood</td>
<td>64</td>
<td>Crafted from logs or sawmill output.</td>
<td>Watchtower, roofs, scaffolds, furniture, NPC projects.</td>
<td>POC Required</td>
</tr>
<tr class="even">
<td>item.material.cobblestone</td>
<td>Cobblestone</td>
<td>Construction Material / Stone</td>
<td>Common<br />
T1 Stone</td>
<td>64</td>
<td>Mining stone or crafting from stone chunks.</td>
<td>Furnaces, roads, early shelters, village repairs.</td>
<td>POC Required</td>
</tr>
<tr class="odd">
<td>item.material.stone_brick</td>
<td>Stone Brick</td>
<td>Construction Material / Stone</td>
<td>Common<br />
T1 Stone</td>
<td>64</td>
<td>Crafted from stone chunks/cobblestone at workbench or furnace.</td>
<td>Watchtower, walls, village upgrades, durable buildings.</td>
<td>POC Required</td>
</tr>
<tr class="even">
<td>item.material.glass_piece</td>
<td>Glass Piece</td>
<td>Processed Material / Glass</td>
<td>Common<br />
T1 Stone</td>
<td>64</td>
<td>Smelt sand in furnace.</td>
<td>Windows, bottles, ward lantern casing, decorative blocks.</td>
<td>POC Required</td>
</tr>
<tr class="odd">
<td>item.food.wild_berries</td>
<td>Wild Berries</td>
<td>Food / Ingredient</td>
<td>Common<br />
T0 Survival</td>
<td>64</td>
<td>Harvested from bushes and forest plants.</td>
<td>Starter food, simple meals, NPC food requests.</td>
<td>POC Required</td>
</tr>
<tr class="even">
<td>item.seed.wheat_basic</td>
<td>Wheat Seed</td>
<td>Seed / Crop</td>
<td>Common<br />
T1 Farming</td>
<td>64</td>
<td>Tall grass, farming, village traders.</td>
<td>Planting, village food economy, crop proof.</td>
<td>POC Required</td>
</tr>
<tr class="odd">
<td>item.crop.wheat</td>
<td>Wheat</td>
<td>Food / Crop</td>
<td>Common<br />
T1 Farming</td>
<td>64</td>
<td>Harvested from wheat crops or traded from farmers.</td>
<td>Bread, animal feed, grain sacks, village food storage.</td>
<td>POC Required</td>
</tr>
<tr class="even">
<td>item.food.bread</td>
<td>Bread</td>
<td>Food / Meal</td>
<td>Common<br />
T1 Farming</td>
<td>16</td>
<td>Crafted/baked from wheat.</td>
<td>Better food, NPC meals, travel ration, trade.</td>
<td>POC Required</td>
</tr>
<tr class="odd">
<td>item.food.raw_meat</td>
<td>Raw Meat</td>
<td>Food / Ingredient</td>
<td>Common<br />
T1 Survival</td>
<td>32</td>
<td>Hunting animals or village butcher stock.</td>
<td>Cooked meat, stew, animal/monster food chain later.</td>
<td>POC Required</td>
</tr>
<tr class="even">
<td>item.food.cooked_meat</td>
<td>Cooked Meat</td>
<td>Food / Meal</td>
<td>Common<br />
T1 Survival</td>
<td>16</td>
<td>Cook raw meat in furnace/campfire.</td>
<td>Strong early food, guard rations, trade.</td>
<td>POC Required</td>
</tr>
<tr class="odd">
<td>item.food.simple_stew</td>
<td>Simple Stew</td>
<td>Food / Meal</td>
<td>Common<br />
T1 Farming</td>
<td>8</td>
<td>Cook berries/crops/meat/mushrooms in cooking station or pot.</td>
<td>Buff food, NPC value, village food economy proof.</td>
<td>POC Required</td>
</tr>
<tr class="even">
<td>item.drink.water_flask</td>
<td>Water Flask</td>
<td>Drink / Utility</td>
<td>Common<br />
T0 Survival</td>
<td>16</td>
<td>Filled from clean water sources or wells.</td>
<td>Hydration if enabled, alchemy base, travel, NPC needs.</td>
<td>POC Required</td>
</tr>
<tr class="odd">
<td>item.tool.crude_pickaxe</td>
<td>Crude Pickaxe</td>
<td>Tool / Pickaxe</td>
<td>Common<br />
T0 Survival</td>
<td>1</td>
<td>Crafted from sticks, fibre, and stone/flint.</td>
<td>Starter mining; low durability; mines stone slowly.</td>
<td>POC Required</td>
</tr>
<tr class="even">
<td>item.tool.crude_axe</td>
<td>Crude Axe</td>
<td>Tool / Axe</td>
<td>Common<br />
T0 Survival</td>
<td>1</td>
<td>Crafted from sticks, fibre, and flint/stone.</td>
<td>Starter tree chopping and emergency weapon.</td>
<td>POC Required</td>
</tr>
<tr class="odd">
<td>item.tool.stone_pickaxe</td>
<td>Stone Pickaxe</td>
<td>Tool / Pickaxe</td>
<td>Common<br />
T1 Stone</td>
<td>1</td>
<td>Crafted from sticks and stone chunks.</td>
<td>Mines stone and early ores; bridge from survival to copper.</td>
<td>POC Required</td>
</tr>
<tr class="even">
<td>item.tool.stone_axe</td>
<td>Stone Axe</td>
<td>Tool / Axe</td>
<td>Common<br />
T1 Stone</td>
<td>1</td>
<td>Crafted from sticks and stone chunks.</td>
<td>Improved wood harvesting; weak combat backup.</td>
<td>POC Required</td>
</tr>
<tr class="odd">
<td>item.tool.iron_pickaxe</td>
<td>Iron Pickaxe</td>
<td>Tool / Pickaxe</td>
<td>Common<br />
T3 Iron</td>
<td>1</td>
<td>Crafted from iron ingots and rods.</td>
<td>Mines harder blocks, mana crystal ore, faster progression.</td>
<td>POC Required</td>
</tr>
<tr class="even">
<td>item.tool.iron_axe</td>
<td>Iron Axe</td>
<td>Tool / Axe</td>
<td>Common<br />
T3 Iron</td>
<td>1</td>
<td>Crafted from iron ingots and rods.</td>
<td>Fast logging, village lumber production, usable weapon.</td>
<td>POC Required</td>
</tr>
<tr class="odd">
<td>item.tool.hammer_basic</td>
<td>Basic Hammer</td>
<td>Tool / Building</td>
<td>Common<br />
T2 Copper</td>
<td>1</td>
<td>Crafted from copper/iron and wood.</td>
<td>Crafting plates, repairs, building interactions, furniture.</td>
<td>POC Required</td>
</tr>
<tr class="even">
<td>item.tool.wrench_basic</td>
<td>Basic Wrench</td>
<td>Tool / Automation</td>
<td>Uncommon<br />
T2 Copper</td>
<td>1</td>
<td>Crafted from copper plates, gears, and iron rod.</td>
<td>Rotates/configures machines, chutes, output sides, automation UI.</td>
<td>POC Required</td>
</tr>
<tr class="odd">
<td>item.tool.rune_tuner_basic</td>
<td>Basic Rune Tuner</td>
<td>Tool / Magic Automation</td>
<td>Uncommon<br />
T5 Mana</td>
<td>1</td>
<td>Crafted at rune table from copper wire, basic rune, and mana shard.</td>
<td>Configures mana conduits, ward lanterns, mana furnace links.</td>
<td>POC Required</td>
</tr>
<tr class="even">
<td>item.tool.rune_chisel</td>
<td>Rune Chisel</td>
<td>Tool / Magic Crafting</td>
<td>Uncommon<br />
T5 Mana</td>
<td>1</td>
<td>Crafted from iron rod, mana shard, and stone.</td>
<td>Inscribe runes, repair rune blocks, create magic components.</td>
<td>POC Required</td>
</tr>
<tr class="odd">
<td>item.tool.blueprint_tool</td>
<td>Blueprint Tool</td>
<td>Tool / Planning</td>
<td>Uncommon<br />
T3 Iron</td>
<td>1</td>
<td>Crafted from paper, glass, iron fittings, and copper wire.</td>
<td>Places/reads village project blueprints and construction requirements.</td>
<td>POC Required</td>
</tr>
<tr class="even">
<td>item.weapon.iron_sword</td>
<td>Iron Sword</td>
<td>Weapon / Melee</td>
<td>Common<br />
T3 Iron</td>
<td>1</td>
<td>Crafted from iron ingot, iron rod, and grip material.</td>
<td>Primary early combat weapon; village guard supply.</td>
<td>POC Required</td>
</tr>
<tr class="odd">
<td>item.weapon.wooden_bow</td>
<td>Wooden Bow</td>
<td>Weapon / Ranged</td>
<td>Common<br />
T1 Wood</td>
<td>1</td>
<td>Crafted from wood, fibre/cord, and stick.</td>
<td>Ranged combat, hunting, guard equipment.</td>
<td>POC Required</td>
</tr>
<tr class="even">
<td>item.ammo.arrow_bundle</td>
<td>Arrow Bundle</td>
<td>Ammo / Ranged</td>
<td>Common<br />
T1 Wood</td>
<td>64</td>
<td>Crafted from sticks, flint, and fibre/feathers later.</td>
<td>Bow ammunition; guard supply; dungeon preparation.</td>
<td>POC Required</td>
</tr>
<tr class="odd">
<td>item.weapon.apprentice_staff</td>
<td>Apprentice Staff</td>
<td>Weapon / Magic Focus</td>
<td>Uncommon<br />
T5 Mana</td>
<td>1</td>
<td>Crafted from oak beam, mana crystal, and basic rune.</td>
<td>Basic spell focus, mage tutorial, early magic combat/utility.</td>
<td>POC Required</td>
</tr>
<tr class="even">
<td>item.equipment.wooden_shield</td>
<td>Wooden Shield</td>
<td>Equipment / Shield</td>
<td>Common<br />
T1 Wood</td>
<td>1</td>
<td>Crafted from planks, leather/fibre, and iron nails later.</td>
<td>Early defence, guard supply, raid survival.</td>
<td>POC Required</td>
</tr>
<tr class="odd">
<td>item.armor.leather_tunic</td>
<td>Leather Tunic</td>
<td>Armour / Light</td>
<td>Common<br />
T1 Survival</td>
<td>1</td>
<td>Crafted from leather or bought from villagers.</td>
<td>Starter armour, cold/weather buffer later.</td>
<td>POC Required</td>
</tr>
<tr class="even">
<td>item.equipment.small_backpack</td>
<td>Small Backpack</td>
<td>Equipment / Carrying</td>
<td>Common<br />
T1 Survival</td>
<td>1</td>
<td>Crafted from leather, cloth, and fibre.</td>
<td>Adds inventory slots; first inventory upgrade.</td>
<td>POC Required</td>
</tr>
<tr class="odd">
<td>item.component.machine_frame_wood</td>
<td>Wooden Machine Frame</td>
<td>Machine Component / Frame</td>
<td>Common<br />
T2 Copper</td>
<td>32</td>
<td>Crafted from planks, beams, and copper nails/wire.</td>
<td>Basic miner, chute systems, manual crank, early machines.</td>
<td>POC Required</td>
</tr>
<tr class="even">
<td>item.component.machine_frame_copper</td>
<td>Copper Machine Frame</td>
<td>Machine Component / Frame</td>
<td>Common<br />
T2 Copper</td>
<td>32</td>
<td>Crafted from copper plates, gears, and wooden frame.</td>
<td>Basic automation machines and early power systems.</td>
<td>POC Required</td>
</tr>
<tr class="odd">
<td>item.component.machine_core_basic</td>
<td>Basic Machine Core</td>
<td>Machine Component / Core</td>
<td>Uncommon<br />
T2 Copper</td>
<td>16</td>
<td>Crafted from copper gear, copper wire, and iron rod.</td>
<td>Basic miner, furnace automation, machine assembler recipes.</td>
<td>POC Required</td>
</tr>
<tr class="even">
<td>item.component.chute_segment</td>
<td>Item Chute Segment</td>
<td>Machine Component / Logistics</td>
<td>Common<br />
T2 Copper</td>
<td>64</td>
<td>Crafted from planks, copper plate, and nails.</td>
<td>Places basic item chute blocks; POC item transport.</td>
<td>POC Required</td>
</tr>
<tr class="odd">
<td>item.component.miner_head_iron</td>
<td>Iron Miner Head</td>
<td>Machine Component / Mining</td>
<td>Common<br />
T3 Iron</td>
<td>16</td>
<td>Crafted from iron plates, rods, and pickaxe head.</td>
<td>Basic mana miner, mechanical miner upgrades.</td>
<td>POC Required</td>
</tr>
<tr class="even">
<td>item.component.furnace_core_stone</td>
<td>Stone Furnace Core</td>
<td>Machine Component / Processing</td>
<td>Common<br />
T1 Stone</td>
<td>16</td>
<td>Crafted from stone brick, clay, and coal.</td>
<td>Stone furnace block, repair, smelting station upgrades.</td>
<td>POC Required</td>
</tr>
<tr class="odd">
<td>item.component.mana_furnace_core</td>
<td>Mana Furnace Core</td>
<td>Machine Component / Magic Processing</td>
<td>Uncommon<br />
T5 Mana</td>
<td>16</td>
<td>Crafted from ward core, mana crystal, stone furnace core, and copper wire.</td>
<td>Mana furnace block, magic automation, POC identity.</td>
<td>POC Required</td>
</tr>
<tr class="even">
<td>item.component.ward_lantern_core</td>
<td>Ward Lantern Core</td>
<td>Magic Component / Defence</td>
<td>Uncommon<br />
T5 Mana</td>
<td>16</td>
<td>Crafted from glass, basic ward core, and mana dust.</td>
<td>Ward lantern block, village defence, anti-monster safety.</td>
<td>POC Required</td>
</tr>
<tr class="odd">
<td>item.economy.trade_coin_copper</td>
<td>Copper Trade Coin</td>
<td>Currency / Economy</td>
<td>Common<br />
T2 Copper</td>
<td>999</td>
<td>Minted, traded, quest reward, village economy.</td>
<td>Small purchases, quest payments, NPC trade, value benchmark.</td>
<td>POC Required</td>
</tr>
<tr class="even">
<td>item.economy.village_supply_token</td>
<td>Village Supply Token</td>
<td>Economy / Village</td>
<td>Common<br />
T1 Village</td>
<td>64</td>
<td>Issued by a village warehouse/request board for tracked deliveries.</td>
<td>Marks contribution, reputation, village project accounting.</td>
<td>POC Required</td>
</tr>
<tr class="odd">
<td>item.quest.builder_request_slip</td>
<td>Builder Request Slip</td>
<td>Quest Item / Village</td>
<td>Common<br />
T1 Village</td>
<td>1</td>
<td>Generated by a village construction project.</td>
<td>Shows required materials, links player to watchtower project.</td>
<td>POC Required</td>
</tr>
<tr class="even">
<td>item.quest.warehouse_manifest</td>
<td>Warehouse Crate Manifest</td>
<td>Quest Item / Logistics</td>
<td>Common<br />
T1 Village</td>
<td>1</td>
<td>Generated when a village warehouse accepts deliveries.</td>
<td>Tracks stored resources, automation input, project supply proof.</td>
<td>POC Required</td>
</tr>
<tr class="odd">
<td>item.loot.goblin_scrap</td>
<td>Goblin Scrap</td>
<td>Monster Drop / Material</td>
<td>Common<br />
T1 Combat</td>
<td>64</td>
<td>Dropped by goblin raiders and camps.</td>
<td>Low-tier trade, crude repairs, intimidation/faction paths later.</td>
<td>POC Required</td>
</tr>
<tr class="even">
<td>item.loot.crude_goblin_blade</td>
<td>Crude Goblin Blade</td>
<td>Monster Drop / Weapon</td>
<td>Common<br />
T1 Combat</td>
<td>1</td>
<td>Dropped by goblin raiders.</td>
<td>Emergency weapon, smelt/salvage, quest proof.</td>
<td>POC Required</td>
</tr>
<tr class="odd">
<td>item.loot.monster_essence_low</td>
<td>Weak Monster Essence</td>
<td>Monster Drop / Magic</td>
<td>Uncommon<br />
T5 Mana</td>
<td>64</td>
<td>Dropped by magical or raid enemies.</td>
<td>Basic runes, alchemy, wards, mage requests.</td>
<td>POC Required</td>
</tr>
<tr class="even">
<td>item.knowledge.torn_research_page</td>
<td>Torn Research Page</td>
<td>Knowledge / Research</td>
<td>Uncommon<br />
T5 Mana</td>
<td>16</td>
<td>Found in ruins, mage homes, or dungeon loot.</td>
<td>Unlocks/reveals mana furnace and rune table concepts.</td>
<td>POC Required</td>
</tr>
<tr class="odd">
<td>item.knowledge.basic_rune_note</td>
<td>Basic Rune Note</td>
<td>Knowledge / Recipe</td>
<td>Uncommon<br />
T5 Mana</td>
<td>1</td>
<td>Found in the first ruin or taught by village mage.</td>
<td>Unlocks Basic Rune recipe and rune table tutorial.</td>
<td>POC Required</td>
</tr>
<tr class="even">
<td>item.knowledge.map_fragment_local</td>
<td>Local Map Fragment</td>
<td>Knowledge / Map</td>
<td>Common<br />
T1 Exploration</td>
<td>16</td>
<td>Found in chests, bought from merchants, or rewards.</td>
<td>Reveals cave, ruin, village, or enemy camp hints.</td>
<td>POC Required</td>
</tr>
</tbody>
</table>

## 25.2 Alpha Items

<table>
<colgroup>
<col style="width: 12%" />
<col style="width: 12%" />
<col style="width: 12%" />
<col style="width: 12%" />
<col style="width: 12%" />
<col style="width: 12%" />
<col style="width: 12%" />
<col style="width: 12%" />
</colgroup>
<thead>
<tr class="header">
<th><strong>ID</strong></th>
<th><strong>Display Name</strong></th>
<th><strong>Category</strong></th>
<th><strong>Rarity / Tier</strong></th>
<th><strong>Stack</strong></th>
<th><strong>Source</strong></th>
<th><strong>Main Uses / Connections</strong></th>
<th><strong>Scope</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>item.resource.gravel</td>
<td>Gravel</td>
<td>Raw Resource / Loose</td>
<td>Common<br />
T1 Stone</td>
<td>64</td>
<td>Mining gravel blocks or cave deposits.</td>
<td>Flint, road base, concrete/mortar later, rubble behaviour.</td>
<td>Alpha</td>
</tr>
<tr class="even">
<td>item.resource.herb_common</td>
<td>Common Herb</td>
<td>Raw Resource / Alchemy</td>
<td>Common<br />
T1 Farming</td>
<td>64</td>
<td>Harvested from wild plants or farms.</td>
<td>Poultices, tea, alchemy recipes, NPC medicine requests.</td>
<td>Alpha</td>
</tr>
<tr class="odd">
<td>item.resource.cave_mushroom</td>
<td>Cave Mushroom</td>
<td>Food / Alchemy Ingredient</td>
<td>Common<br />
T1 Exploration</td>
<td>64</td>
<td>Harvested in caves.</td>
<td>Food, alchemy, cave recipes, mushroom cultures later.</td>
<td>Alpha</td>
</tr>
<tr class="even">
<td>item.resource.reed</td>
<td>Reed</td>
<td>Raw Resource / Plant</td>
<td>Common<br />
T1 Farming</td>
<td>64</td>
<td>Water-edge plants and wetlands.</td>
<td>Thatch, paper, fibre, early writing items.</td>
<td>Alpha</td>
</tr>
<tr class="odd">
<td>item.material.paper</td>
<td>Paper</td>
<td>Processed Material / Knowledge</td>
<td>Common<br />
T1 Farming</td>
<td>64</td>
<td>Crafted from reeds or fibre pulp.</td>
<td>Maps, research notes, recipe scrolls, books, blueprints.</td>
<td>Alpha</td>
</tr>
<tr class="even">
<td>item.material.ink_basic</td>
<td>Basic Ink</td>
<td>Processed Material / Writing</td>
<td>Common<br />
T1 Farming</td>
<td>64</td>
<td>Crafted from soot, berries, or alchemy ingredients.</td>
<td>Books, maps, scrolls, labels, NPC records.</td>
<td>Alpha</td>
</tr>
<tr class="odd">
<td>item.material.charcoal</td>
<td>Charcoal</td>
<td>Processed Material / Fuel</td>
<td>Common<br />
T1 Wood</td>
<td>64</td>
<td>Burn logs in furnace/kiln.</td>
<td>Fuel, torches, ink, early industry.</td>
<td>Alpha</td>
</tr>
<tr class="even">
<td>item.material.clay_brick</td>
<td>Clay Brick</td>
<td>Construction Material / Brick</td>
<td>Common<br />
T1 Stone</td>
<td>64</td>
<td>Fire clay lumps in furnace.</td>
<td>Clay brick blocks, ovens, chimneys, roofs, village housing.</td>
<td>Alpha</td>
</tr>
<tr class="odd">
<td>item.material.roof_tile_clay</td>
<td>Clay Roof Tile</td>
<td>Construction Material / Roof</td>
<td>Common<br />
T1 Stone</td>
<td>64</td>
<td>Crafted/fired from clay.</td>
<td>Roof blocks, town identity, NPC housing projects.</td>
<td>Alpha</td>
</tr>
<tr class="even">
<td>item.material.rope</td>
<td>Rope</td>
<td>Processed Material / Fibre</td>
<td>Common<br />
T1 Wood</td>
<td>64</td>
<td>Crafted from plant fibre or cloth strips.</td>
<td>Ladders, bows, backpacks, wells, carts, machines.</td>
<td>Alpha</td>
</tr>
<tr class="odd">
<td>item.material.cloth_basic</td>
<td>Basic Cloth</td>
<td>Processed Material / Textile</td>
<td>Common<br />
T1 Farming</td>
<td>64</td>
<td>Loom from fibre, wool, or flax later.</td>
<td>Clothing, beds, banners, backpacks, culture goods.</td>
<td>Alpha</td>
</tr>
<tr class="even">
<td>item.material.leather</td>
<td>Leather</td>
<td>Processed Material / Hide</td>
<td>Common<br />
T1 Survival</td>
<td>64</td>
<td>Tanned hide or bought from villages.</td>
<td>Armour, backpacks, belts, tools, trade goods.</td>
<td>Alpha</td>
</tr>
<tr class="odd">
<td>item.material.steel_ingot</td>
<td>Steel Ingot</td>
<td>Refined Material / Metal</td>
<td>Uncommon<br />
T4 Steel</td>
<td>64</td>
<td>Refined from iron and carbon/fuel in forge.</td>
<td>Advanced tools, machines, stronger defences.</td>
<td>Alpha</td>
</tr>
<tr class="even">
<td>item.material.steel_plate</td>
<td>Steel Plate</td>
<td>Machine Material / Metal</td>
<td>Uncommon<br />
T4 Steel</td>
<td>64</td>
<td>Forged from steel ingots.</td>
<td>Reinforced frames, machines, gates, armour.</td>
<td>Alpha</td>
</tr>
<tr class="odd">
<td>item.component.iron_gear</td>
<td>Iron Gear</td>
<td>Machine Component / Mechanical</td>
<td>Common<br />
T3 Iron</td>
<td>64</td>
<td>Crafted at forge/anvil.</td>
<td>Stronger machines, conveyors, crushers, windmills.</td>
<td>Alpha</td>
</tr>
<tr class="even">
<td>item.component.wooden_gear</td>
<td>Wooden Gear</td>
<td>Machine Component / Mechanical</td>
<td>Common<br />
T1 Wood</td>
<td>64</td>
<td>Crafted from planks and sticks.</td>
<td>Manual crank, water wheel, low-tier mechanisms.</td>
<td>Alpha</td>
</tr>
<tr class="odd">
<td>item.component.shaft_wood</td>
<td>Wooden Shaft</td>
<td>Machine Component / Power</td>
<td>Common<br />
T1 Wood</td>
<td>64</td>
<td>Crafted from beams and rods.</td>
<td>Water wheels, windmills, grinders, primitive automation.</td>
<td>Alpha</td>
</tr>
<tr class="even">
<td>item.component.shaft_iron</td>
<td>Iron Shaft</td>
<td>Machine Component / Power</td>
<td>Common<br />
T3 Iron</td>
<td>64</td>
<td>Forged from iron rods.</td>
<td>Powered machines, conveyors, crusher, grinder.</td>
<td>Alpha</td>
</tr>
<tr class="odd">
<td>item.component.belt_roll</td>
<td>Belt Roll</td>
<td>Machine Component / Logistics</td>
<td>Uncommon<br />
T3 Iron</td>
<td>32</td>
<td>Crafted from leather/cloth and iron fittings.</td>
<td>Conveyor belt blocks, factory lines.</td>
<td>Alpha</td>
</tr>
<tr class="even">
<td>item.component.item_pipe_section</td>
<td>Item Pipe Section</td>
<td>Machine Component / Logistics</td>
<td>Uncommon<br />
T3 Iron</td>
<td>64</td>
<td>Crafted from copper/iron plates.</td>
<td>Item pipe blocks, protected routing, compact factories.</td>
<td>Alpha</td>
</tr>
<tr class="odd">
<td>item.component.fluid_pipe_section</td>
<td>Fluid Pipe Section</td>
<td>Machine Component / Fluid</td>
<td>Uncommon<br />
T3 Iron</td>
<td>64</td>
<td>Crafted from copper/iron and sealant.</td>
<td>Pumps, irrigation, alchemy, steam systems.</td>
<td>Alpha</td>
</tr>
<tr class="even">
<td>item.component.filter_screen</td>
<td>Filter Screen</td>
<td>Machine Component / Sorting</td>
<td>Uncommon<br />
T3 Iron</td>
<td>32</td>
<td>Crafted from wire mesh, cloth, and frame.</td>
<td>Sorters, filters, warehouse imports, machine UIs.</td>
<td>Alpha</td>
</tr>
<tr class="odd">
<td>item.component.sorter_core</td>
<td>Sorter Core</td>
<td>Machine Component / Logic</td>
<td>Uncommon<br />
T3 Iron</td>
<td>16</td>
<td>Crafted from copper wire, filter screen, and basic machine core.</td>
<td>Sorter/filter block, factory routing.</td>
<td>Alpha</td>
</tr>
<tr class="even">
<td>item.component.water_wheel_axle</td>
<td>Water Wheel Axle</td>
<td>Machine Component / Power</td>
<td>Common<br />
T1 Wood</td>
<td>16</td>
<td>Crafted from beams, shafts, and iron nails.</td>
<td>Water wheel block, mills, early power.</td>
<td>Alpha</td>
</tr>
<tr class="odd">
<td>item.component.windmill_sail</td>
<td>Windmill Sail</td>
<td>Machine Component / Power</td>
<td>Common<br />
T1 Farming</td>
<td>16</td>
<td>Crafted from cloth, planks, and rope.</td>
<td>Windmill block, farm machines, village identity.</td>
<td>Alpha</td>
</tr>
<tr class="even">
<td>item.component.mana_coil</td>
<td>Mana Coil</td>
<td>Magic Machine Component / Power</td>
<td>Uncommon<br />
T5 Mana</td>
<td>32</td>
<td>Crafted from copper wire, mana dust, and basic rune.</td>
<td>Mana battery, rune engine, arcane machines.</td>
<td>Alpha</td>
</tr>
<tr class="odd">
<td>item.magic.mana_battery_core</td>
<td>Mana Battery Core</td>
<td>Magic Machine Component / Storage</td>
<td>Uncommon<br />
T5 Mana</td>
<td>16</td>
<td>Crafted from mana crystal, mana coil, and copper plate.</td>
<td>Mana battery block, ward night power, machine buffering.</td>
<td>Alpha</td>
</tr>
<tr class="even">
<td>item.tool.shovel_iron</td>
<td>Iron Shovel</td>
<td>Tool / Shovel</td>
<td>Common<br />
T3 Iron</td>
<td>1</td>
<td>Crafted from iron ingot and rod.</td>
<td>Fast digging, farmland/paths, clay/sand gathering.</td>
<td>Alpha</td>
</tr>
<tr class="odd">
<td>item.tool.hoe_basic</td>
<td>Basic Hoe</td>
<td>Tool / Farming</td>
<td>Common<br />
T1 Wood</td>
<td>1</td>
<td>Crafted from sticks and stone/copper.</td>
<td>Tills farmland, farming tutorial, NPC farm work.</td>
<td>Alpha</td>
</tr>
<tr class="even">
<td>item.tool.sickle_basic</td>
<td>Basic Sickle</td>
<td>Tool / Harvesting</td>
<td>Common<br />
T1 Farming</td>
<td>1</td>
<td>Crafted from copper/iron and wood.</td>
<td>Harvest grass, crops, herbs, reeds, fibre efficiently.</td>
<td>Alpha</td>
</tr>
<tr class="odd">
<td>item.tool.saw_basic</td>
<td>Basic Saw</td>
<td>Tool / Woodworking</td>
<td>Common<br />
T2 Copper</td>
<td>1</td>
<td>Crafted from copper/iron and wood.</td>
<td>Improves plank/beam crafting; sawmill support.</td>
<td>Alpha</td>
</tr>
<tr class="even">
<td>item.tool.measuring_rope</td>
<td>Measuring Rope</td>
<td>Tool / Planning</td>
<td>Common<br />
T1 Building</td>
<td>1</td>
<td>Crafted from rope and markers.</td>
<td>Layout planning, building measurements, blueprint support.</td>
<td>Alpha</td>
</tr>
<tr class="odd">
<td>item.weapon.stone_spear</td>
<td>Stone Spear</td>
<td>Weapon / Melee</td>
<td>Common<br />
T1 Stone</td>
<td>1</td>
<td>Crafted from stick, fibre, and flint/stone.</td>
<td>Early reach weapon, hunting, guard backup.</td>
<td>Alpha</td>
</tr>
<tr class="even">
<td>item.weapon.iron_spear</td>
<td>Iron Spear</td>
<td>Weapon / Melee</td>
<td>Common<br />
T3 Iron</td>
<td>1</td>
<td>Crafted at forge/anvil.</td>
<td>Guard equipment, reach combat, anti-raider defence.</td>
<td>Alpha</td>
</tr>
<tr class="odd">
<td>item.weapon.crossbow_basic</td>
<td>Basic Crossbow</td>
<td>Weapon / Ranged</td>
<td>Uncommon<br />
T3 Iron</td>
<td>1</td>
<td>Crafted from wood, iron, rope, and gear.</td>
<td>Stronger ranged defence for guards and players.</td>
<td>Alpha</td>
</tr>
<tr class="even">
<td>item.ammo.bolt_bundle</td>
<td>Bolt Bundle</td>
<td>Ammo / Ranged</td>
<td>Common<br />
T3 Iron</td>
<td>64</td>
<td>Crafted from wood and iron/flint tips.</td>
<td>Crossbow ammunition, guard supply.</td>
<td>Alpha</td>
</tr>
<tr class="odd">
<td>item.weapon.wand_spark</td>
<td>Spark Wand</td>
<td>Weapon / Magic Focus</td>
<td>Uncommon<br />
T5 Mana</td>
<td>1</td>
<td>Crafted from mana crystal, wood, and basic rune.</td>
<td>Light combat spell focus, magic tutorial upgrade.</td>
<td>Alpha</td>
</tr>
<tr class="even">
<td>item.weapon.spellbook_blank</td>
<td>Blank Spellbook</td>
<td>Magic Equipment / Spellbook</td>
<td>Uncommon<br />
T5 Mana</td>
<td>1</td>
<td>Crafted from paper, leather, ink, and mana dust.</td>
<td>Stores spells, research, mage progression.</td>
<td>Alpha</td>
</tr>
<tr class="odd">
<td>item.armor.iron_helmet</td>
<td>Iron Helmet</td>
<td>Armour / Heavy</td>
<td>Common<br />
T3 Iron</td>
<td>1</td>
<td>Crafted at forge/anvil.</td>
<td>Combat defence, guard equipment, raid preparation.</td>
<td>Alpha</td>
</tr>
<tr class="even">
<td>item.armor.iron_chestplate</td>
<td>Iron Chestplate</td>
<td>Armour / Heavy</td>
<td>Common<br />
T3 Iron</td>
<td>1</td>
<td>Crafted at forge/anvil.</td>
<td>Strong early-mid defence, guard upgrades.</td>
<td>Alpha</td>
</tr>
<tr class="odd">
<td>item.armor.mage_robe_apprentice</td>
<td>Apprentice Mage Robe</td>
<td>Armour / Magic Cloth</td>
<td>Uncommon<br />
T5 Mana</td>
<td>1</td>
<td>Crafted from cloth, mana dust, and basic rune.</td>
<td>Magic efficiency, low defence, mage identity.</td>
<td>Alpha</td>
</tr>
<tr class="even">
<td>item.equipment.iron_shield</td>
<td>Iron Shield</td>
<td>Equipment / Shield</td>
<td>Common<br />
T3 Iron</td>
<td>1</td>
<td>Crafted from iron plates and leather grip.</td>
<td>Strong blocking, guard supply, raid defence.</td>
<td>Alpha</td>
</tr>
<tr class="odd">
<td>item.equipment.tool_belt</td>
<td>Tool Belt</td>
<td>Equipment / Utility</td>
<td>Common<br />
T2 Copper</td>
<td>1</td>
<td>Crafted from leather, copper fittings, and cloth.</td>
<td>Adds quick-access/tool slots, builder/engineer identity.</td>
<td>Alpha</td>
</tr>
<tr class="even">
<td>item.food.roasted_mushroom</td>
<td>Roasted Mushroom</td>
<td>Food / Meal</td>
<td>Common<br />
T1 Exploration</td>
<td>16</td>
<td>Cook cave mushroom.</td>
<td>Cave food, alchemy side effects later, NPC food.</td>
<td>Alpha</td>
</tr>
<tr class="odd">
<td>item.food.village_meal_pack</td>
<td>Village Meal Pack</td>
<td>Food / Ration</td>
<td>Common<br />
T1 Village</td>
<td>16</td>
<td>Crafted or bought from cooks/farmers.</td>
<td>Travel food, delivery reward, guard ration.</td>
<td>Alpha</td>
</tr>
<tr class="even">
<td>item.drink.herbal_tea</td>
<td>Herbal Tea</td>
<td>Drink / Buff</td>
<td>Common<br />
T1 Farming</td>
<td>16</td>
<td>Cook herbs and water.</td>
<td>Minor recovery/buff, NPC medicine, cosy village life.</td>
<td>Alpha</td>
</tr>
<tr class="odd">
<td>item.consumable.healing_poultice</td>
<td>Healing Poultice</td>
<td>Consumable / Medicine</td>
<td>Common<br />
T1 Farming</td>
<td>16</td>
<td>Crafted from herbs, cloth, and water.</td>
<td>Basic healing, NPC injury treatment, raid recovery.</td>
<td>Alpha</td>
</tr>
<tr class="even">
<td>item.consumable.healing_potion_basic</td>
<td>Basic Healing Potion</td>
<td>Consumable / Potion</td>
<td>Uncommon<br />
T5 Mana</td>
<td>16</td>
<td>Alchemy table with herbs and mana dust.</td>
<td>Healing, dungeon prep, trade, healer NPC.</td>
<td>Alpha</td>
</tr>
<tr class="odd">
<td>item.consumable.scroll_recall_minor</td>
<td>Minor Recall Scroll</td>
<td>Consumable / Scroll</td>
<td>Rare<br />
T5 Mana</td>
<td>8</td>
<td>Crafted from paper, ink, mana dust, and rune.</td>
<td>Emergency travel, magic convenience, exploration reward.</td>
<td>Alpha</td>
</tr>
<tr class="even">
<td>item.economy.trade_coin_silver</td>
<td>Silver Trade Coin</td>
<td>Currency / Economy</td>
<td>Uncommon<br />
T3 Iron</td>
<td>999</td>
<td>Minted, traded, quest reward, regional trade.</td>
<td>Medium purchases, contracts, reputation rewards.</td>
<td>Alpha</td>
</tr>
<tr class="odd">
<td>item.economy.grain_sack</td>
<td>Grain Sack</td>
<td>Trade Good / Food</td>
<td>Common<br />
T1 Farming</td>
<td>32</td>
<td>Crafted from wheat and cloth sack or produced by farms.</td>
<td>Village food security, trade routes, famine events.</td>
<td>Alpha</td>
</tr>
<tr class="even">
<td>item.economy.tool_bundle</td>
<td>Tool Bundle</td>
<td>Trade Good / Tools</td>
<td>Common<br />
T3 Iron</td>
<td>16</td>
<td>Packed from tools, nails, rods, and materials.</td>
<td>Village labour needs, construction quests, trade value.</td>
<td>Alpha</td>
</tr>
<tr class="odd">
<td>item.economy.guard_weapon_bundle</td>
<td>Guard Weapon Bundle</td>
<td>Trade Good / Defence</td>
<td>Uncommon<br />
T3 Iron</td>
<td>16</td>
<td>Packed iron weapons, arrows, shields, and repair kits.</td>
<td>Village defence upgrades, raid readiness, faction contracts.</td>
<td>Alpha</td>
</tr>
<tr class="even">
<td>item.economy.medical_bundle</td>
<td>Medical Bundle</td>
<td>Trade Good / Medicine</td>
<td>Uncommon<br />
T1 Farming</td>
<td>16</td>
<td>Packed poultices, herbs, cloth, and potions.</td>
<td>NPC injury recovery, plague events, healer requests.</td>
<td>Alpha</td>
</tr>
<tr class="odd">
<td>item.economy.festival_goods</td>
<td>Festival Goods</td>
<td>Trade Good / Culture</td>
<td>Common<br />
T1 Village</td>
<td>16</td>
<td>Food, cloth, flowers, candles, and decoration packed for festivals.</td>
<td>Morale, cultural events, reputation, trade.</td>
<td>Alpha</td>
</tr>
<tr class="even">
<td>item.loot.wolf_pelt</td>
<td>Wolf Pelt</td>
<td>Loot / Hide</td>
<td>Common<br />
T1 Survival</td>
<td>32</td>
<td>Dropped by wolf-like wildlife or bought from hunters.</td>
<td>Leather, clothing, trade, cold gear later.</td>
<td>Alpha</td>
</tr>
<tr class="odd">
<td>item.loot.beast_fang</td>
<td>Beast Fang</td>
<td>Loot / Trophy Component</td>
<td>Common<br />
T1 Combat</td>
<td>64</td>
<td>Dropped by beasts.</td>
<td>Arrows, alchemy, trophies, hunter quests.</td>
<td>Alpha</td>
</tr>
<tr class="even">
<td>item.loot.wisp_core_weak</td>
<td>Weak Wisp Core</td>
<td>Magic Loot / Core</td>
<td>Uncommon<br />
T5 Mana</td>
<td>32</td>
<td>Dropped by wisps and magical cave enemies.</td>
<td>Mana battery, wards, enchanting, mage requests.</td>
<td>Alpha</td>
</tr>
<tr class="odd">
<td>item.loot.bandit_badge</td>
<td>Bandit Badge</td>
<td>Loot / Proof</td>
<td>Common<br />
T2 Combat</td>
<td>64</td>
<td>Dropped by bandits or found in camps.</td>
<td>Bounty proof, faction reputation, guard captain quests.</td>
<td>Alpha</td>
</tr>
<tr class="even">
<td>item.treasure.ancient_coin</td>
<td>Ancient Coin</td>
<td>Treasure / Relic Currency</td>
<td>Rare<br />
T5 Mana</td>
<td>64</td>
<td>Ruins, chests, old roads, dungeons.</td>
<td>Sell, donate to scholars, ritual/research value.</td>
<td>Alpha</td>
</tr>
<tr class="odd">
<td>item.knowledge.recipe_scroll_blank</td>
<td>Blank Recipe Scroll</td>
<td>Knowledge / Writable</td>
<td>Common<br />
T1 Knowledge</td>
<td>16</td>
<td>Crafted from paper and ink.</td>
<td>Stores recipes, trade, NPC teaching interface later.</td>
<td>Alpha</td>
</tr>
<tr class="even">
<td>item.knowledge.village_construction_plan</td>
<td>Village Construction Plan</td>
<td>Knowledge / Blueprint</td>
<td>Uncommon<br />
T1 Village</td>
<td>1</td>
<td>Generated by elders/builders or blueprint table.</td>
<td>Shows staged materials and block requirements for buildings.</td>
<td>Alpha</td>
</tr>
<tr class="odd">
<td>item.knowledge.culture_customs_book</td>
<td>Culture Customs Book</td>
<td>Knowledge / Culture</td>
<td>Uncommon<br />
T1 Village</td>
<td>1</td>
<td>Bought, gifted, or found through reputation.</td>
<td>Trade preferences, diplomacy, unique recipes, social rules.</td>
<td>Alpha</td>
</tr>
<tr class="even">
<td>item.key.rusted_old_key</td>
<td>Rusted Old Key</td>
<td>Key / Dungeon</td>
<td>Uncommon<br />
T1 Exploration</td>
<td>1</td>
<td>Found in ruins, camps, or buried chests.</td>
<td>Opens locked ruin doors or chests; may become trophy after use.</td>
<td>Alpha</td>
</tr>
<tr class="odd">
<td>item.key.broken_seal_fragment</td>
<td>Broken Seal Fragment</td>
<td>Key / Story</td>
<td>Rare<br />
T5 Mana</td>
<td>1</td>
<td>Found in early magical ruins or mini-boss loot.</td>
<td>Teases portals, rituals, ancient civilisation story.</td>
<td>Alpha</td>
</tr>
</tbody>
</table>

## 25.3 Final Game Items

<table>
<colgroup>
<col style="width: 12%" />
<col style="width: 12%" />
<col style="width: 12%" />
<col style="width: 12%" />
<col style="width: 12%" />
<col style="width: 12%" />
<col style="width: 12%" />
<col style="width: 12%" />
</colgroup>
<thead>
<tr class="header">
<th><strong>ID</strong></th>
<th><strong>Display Name</strong></th>
<th><strong>Category</strong></th>
<th><strong>Rarity / Tier</strong></th>
<th><strong>Stack</strong></th>
<th><strong>Source</strong></th>
<th><strong>Main Uses / Connections</strong></th>
<th><strong>Scope</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>item.material.arcane_alloy_ingot</td>
<td>Arcane Alloy Ingot</td>
<td>Refined Material / Magitech</td>
<td>Rare<br />
T6 Arcane Alloy</td>
<td>64</td>
<td>Advanced smelting of steel, mana crystal, and catalysts.</td>
<td>Hybrid machines, arcane tools, portals, high-tier village wards.</td>
<td>Final Game</td>
</tr>
<tr class="even">
<td>item.material.mythril_ingot</td>
<td>Mythril Ingot</td>
<td>Refined Material / Magical Metal</td>
<td>Epic<br />
T7 Mythril</td>
<td>64</td>
<td>Rare ore, dimension source, or ancient forge output.</td>
<td>High-tier magic gear, enchantment, lightweight machines.</td>
<td>Final Game</td>
</tr>
<tr class="odd">
<td>item.realm.fae_seed</td>
<td>Fae Seed</td>
<td>Dimension Item / Nature</td>
<td>Rare<br />
T6 Realm</td>
<td>16</td>
<td>Fae realm trees, living forest shrines, race story rewards.</td>
<td>Living wood, nature magic, crop miracles, village growth.</td>
<td>Final Game</td>
</tr>
<tr class="even">
<td>item.realm.infernal_ash</td>
<td>Infernal Ash</td>
<td>Dimension Item / Infernal</td>
<td>Rare<br />
T7 Realm</td>
<td>64</td>
<td>Infernal realm terrain, volcanic bosses, dangerous rituals.</td>
<td>Fire magic, high heat smelting, cursed crafting.</td>
<td>Final Game</td>
</tr>
<tr class="odd">
<td>item.realm.deep_forge_ember</td>
<td>Deep Forge Ember</td>
<td>Dimension Item / Deep Forge</td>
<td>Epic<br />
T7 Realm</td>
<td>16</td>
<td>Deep Forge realm, dwarven/forge story arc, boss reward.</td>
<td>Ancient forging, rune engines, advanced steel/arcane alloy.</td>
<td>Final Game</td>
</tr>
<tr class="even">
<td>item.magic.essence_shadow</td>
<td>Shadow Essence</td>
<td>Forbidden Magic Component</td>
<td>Rare<br />
T6 Shadow</td>
<td>32</td>
<td>Dark creatures, corruption zones, forbidden rituals.</td>
<td>Curses, stealth magic, evil paths, corruption risk.</td>
<td>Final Game</td>
</tr>
<tr class="odd">
<td>item.magic.heart_golem_clay</td>
<td>Clay Golem Heart</td>
<td>Golemancy Component</td>
<td>Rare<br />
T6 Golemancy</td>
<td>16</td>
<td>Golemancy research, clay/stone/mana ritual crafting.</td>
<td>Creates first golem workers, haulers, repairers.</td>
<td>Final Game</td>
</tr>
<tr class="even">
<td>item.component.rune_engine_core</td>
<td>Rune Engine Core</td>
<td>Magic Machine Component / Power</td>
<td>Rare<br />
T6 Arcane Alloy</td>
<td>16</td>
<td>Arcane assembler using mana coil, runes, and alloy.</td>
<td>Rune engine block, city infrastructure, high-tier automation.</td>
<td>Final Game</td>
</tr>
<tr class="odd">
<td>item.component.portal_stabiliser</td>
<td>Portal Stabiliser</td>
<td>Magic Machine Component / Portal</td>
<td>Epic<br />
T8 Voidstone</td>
<td>8</td>
<td>Crafted from voidstone, arcane alloy, and ancient knowledge.</td>
<td>Portal frames, linked warehouses, dimension logistics.</td>
<td>Final Game</td>
</tr>
<tr class="even">
<td>item.component.golem_command_glyph</td>
<td>Golem Command Glyph</td>
<td>Golemancy Component / Logic</td>
<td>Rare<br />
T6 Golemancy</td>
<td>16</td>
<td>Rune table/arcane assembler after golemancy research.</td>
<td>Golem workstation, task assignment, labour automation.</td>
<td>Final Game</td>
</tr>
<tr class="odd">
<td>item.artifact.ancient_machine_core</td>
<td>Ancient Machine Core</td>
<td>Relic / Ancient Tech</td>
<td>Relic<br />
T8 Ancient</td>
<td>1</td>
<td>Major ruin, ancient machine dungeon, boss reward.</td>
<td>Unlocks ancient tech, arcane assembler upgrades, story gates.</td>
<td>Final Game</td>
</tr>
<tr class="even">
<td>item.artifact.living_crown_seed</td>
<td>Living Crown Seed</td>
<td>Relic / Nature</td>
<td>Legendary<br />
T7 Realm</td>
<td>1</td>
<td>Major forest/Fae race story reward.</td>
<td>World tree growth, settlement morale, nature magic.</td>
<td>Final Game</td>
</tr>
<tr class="odd">
<td>item.artifact.void_compass</td>
<td>Void Compass</td>
<td>Relic / Navigation</td>
<td>Legendary<br />
T8 Voidstone</td>
<td>1</td>
<td>Void story arc, ancient navigator, boss chest.</td>
<td>Reveals rifts, stabilises portals, tracks dimension hazards.</td>
<td>Final Game</td>
</tr>
<tr class="even">
<td>item.weapon.mythril_spellblade</td>
<td>Mythril Spellblade</td>
<td>Weapon / Hybrid</td>
<td>Epic<br />
T7 Mythril</td>
<td>1</td>
<td>Crafted at advanced forge with mythril and runes.</td>
<td>Hybrid melee/magic weapon, late combat identity.</td>
<td>Final Game</td>
</tr>
<tr class="odd">
<td>item.weapon.rune_staff_master</td>
<td>Master Rune Staff</td>
<td>Weapon / Magic Focus</td>
<td>Legendary<br />
T7 Mythril</td>
<td>1</td>
<td>Masterwork magic crafting, rune schools, rare components.</td>
<td>Advanced spells, machine tuning, ritual stability.</td>
<td>Final Game</td>
</tr>
<tr class="even">
<td>item.armor.arcane_engineer_coat</td>
<td>Arcane Engineer Coat</td>
<td>Armour / Utility Magic</td>
<td>Rare<br />
T6 Arcane Alloy</td>
<td>1</td>
<td>Crafted from cloth, leather, mana circuits, alloy fittings.</td>
<td>Automation bonuses, machine repair, magitech identity.</td>
<td>Final Game</td>
</tr>
<tr class="odd">
<td>item.equipment.linked_satchel</td>
<td>Linked Satchel</td>
<td>Equipment / Magic Storage</td>
<td>Rare<br />
T6 Arcane Alloy</td>
<td>1</td>
<td>Mana storage, linked warehouse research, rare components.</td>
<td>Advanced inventory upgrade connected to storage network.</td>
<td>Final Game</td>
</tr>
<tr class="even">
<td>item.economy.dwarven_gearwork</td>
<td>Dwarven Gearwork</td>
<td>Culture Trade Good / Dwarf</td>
<td>Uncommon<br />
T3 Iron</td>
<td>32</td>
<td>Produced by developed dwarven workshops.</td>
<td>Trade, machine recipes, faction reputation, village identity.</td>
<td>Final Game</td>
</tr>
<tr class="odd">
<td>item.economy.elven_living_thread</td>
<td>Elven Living Thread</td>
<td>Culture Trade Good / Elf</td>
<td>Rare<br />
T6 Realm</td>
<td>32</td>
<td>Produced by forest/elf cultures and living wood systems.</td>
<td>Clothing, nature magic, cultural trade, enchantment.</td>
<td>Final Game</td>
</tr>
<tr class="even">
<td>item.economy.goblin_clockwork_junk</td>
<td>Goblin Clockwork Junk</td>
<td>Culture Trade Good / Goblin</td>
<td>Uncommon<br />
T2 Copper</td>
<td>64</td>
<td>Produced by goblin tinkerers or scavenged camps.</td>
<td>Chaotic machines, trade, repairs, goblin faction access.</td>
<td>Final Game</td>
</tr>
<tr class="odd">
<td>item.knowledge.portal_rubbing</td>
<td>Ancient Portal Rubbing</td>
<td>Knowledge / Dimension</td>
<td>Rare<br />
T6 Arcane</td>
<td>1</td>
<td>Copied from broken portal frames in ruins.</td>
<td>Portal research, race story hints, dimension unlock chain.</td>
<td>Final Game</td>
</tr>
<tr class="even">
<td>item.knowledge.boss_weakness_codex</td>
<td>Boss Weakness Codex</td>
<td>Knowledge / Combat</td>
<td>Epic<br />
T7 Adventure</td>
<td>1</td>
<td>Recovered from libraries, bosses, or scholars.</td>
<td>Reveals boss weaknesses, crafting counters, quest strategy.</td>
<td>Final Game</td>
</tr>
<tr class="odd">
<td>item.trophy.raider_banner</td>
<td>Captured Raider Banner</td>
<td>Trophy / Faction</td>
<td>Uncommon<br />
T2 Combat</td>
<td>1</td>
<td>Taken from raider camps after clearing them.</td>
<td>Decor, reputation reward, intimidation, faction response.</td>
<td>Final Game</td>
</tr>
<tr class="even">
<td>item.trophy.drake_scale</td>
<td>Drake Scale</td>
<td>Monster Drop / Rare Trophy</td>
<td>Rare<br />
T5 Adventure</td>
<td>32</td>
<td>Dropped by drakes or major beasts.</td>
<td>Fire resistance gear, trophies, alchemy, village prestige.</td>
<td>Final Game</td>
</tr>
<tr class="odd">
<td>item.quest.faction_seal</td>
<td>Faction Seal</td>
<td>Quest Item / Diplomacy</td>
<td>Rare<br />
T4 Faction</td>
<td>1</td>
<td>Given by faction leaders through reputation/story arcs.</td>
<td>Diplomacy, faction gates, alliance/contracts, legal access.</td>
<td>Final Game</td>
</tr>
</tbody>
</table>

## 25.4 Placeholder Items

<table>
<colgroup>
<col style="width: 12%" />
<col style="width: 12%" />
<col style="width: 12%" />
<col style="width: 12%" />
<col style="width: 12%" />
<col style="width: 12%" />
<col style="width: 12%" />
<col style="width: 12%" />
</colgroup>
<thead>
<tr class="header">
<th><strong>ID</strong></th>
<th><strong>Display Name</strong></th>
<th><strong>Category</strong></th>
<th><strong>Rarity / Tier</strong></th>
<th><strong>Stack</strong></th>
<th><strong>Source</strong></th>
<th><strong>Main Uses / Connections</strong></th>
<th><strong>Scope</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>item.material.voidstone_shard</td>
<td>Voidstone Shard</td>
<td>Dimension Material / Void</td>
<td>Epic<br />
T8 Voidstone</td>
<td>64</td>
<td>Void realm deposits, rifts, bosses, dangerous rituals.</td>
<td>Portals, dimensional logistics, forbidden machines.</td>
<td>Placeholder</td>
</tr>
<tr class="even">
<td>item.material.celestial_fragment</td>
<td>Celestial Metal Fragment</td>
<td>Dimension Material / Celestial</td>
<td>Mythic<br />
T9 Celestial</td>
<td>16</td>
<td>Sky/celestial realm, endgame bosses, rare events.</td>
<td>World-shaping artifacts, floating cities, endgame devices.</td>
<td>Placeholder</td>
</tr>
<tr class="odd">
<td>item.realm.dream_glass_shard</td>
<td>Dream Glass Shard</td>
<td>Dimension Item / Dream</td>
<td>Epic<br />
T8 Realm</td>
<td>32</td>
<td>Dream realm structures, memory ruins, rare creatures.</td>
<td>Illusion, prophecy, dream portals, unique windows/wards.</td>
<td>Placeholder</td>
</tr>
</tbody>
</table>

# 26. Sample Detailed Item Entries

These sample entries show how individual items should be represented when the registry is expanded into a full database, spreadsheet, or data asset system.

## Raw Mana Crystal

| **Field**             | **Value**                                                                                                                                                   |
|-----------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Internal ID           | item.resource.raw_mana_crystal                                                                                                                              |
| Category              | Raw Resource / Magic                                                                                                                                        |
| Rarity                | Uncommon                                                                                                                                                    |
| Progression Tier      | T5 Mana Infrastructure                                                                                                                                      |
| Default Stack         | 64                                                                                                                                                          |
| Source                | Mined from mana crystal ore, found in ruins, bought from mages, or extracted from magical deposits.                                                         |
| Primary Uses          | Mana furnace fuel, rune table recipes, ward cores, mage requests, mana batteries, magic research.                                                           |
| Progression Role      | Unlocks early utility magic and mana-processing systems.                                                                                                    |
| Notes / Tags / Visual | Tags: magic, crystal, fuel, village-use, research, mana-tier, npc-request. Visual: glowing blue-violet crystal fragments with 32x32 icon and rarity border. |

## Mana Furnace Core

| **Field**             | **Value**                                                                                                                |
|-----------------------|--------------------------------------------------------------------------------------------------------------------------|
| Internal ID           | item.component.mana_furnace_core                                                                                         |
| Category              | Machine Component / Magic Processing                                                                                     |
| Rarity                | Uncommon                                                                                                                 |
| Progression Tier      | T5 Mana Infrastructure                                                                                                   |
| Default Stack         | 16                                                                                                                       |
| Source                | Crafted from a stone furnace core, raw mana crystal, basic rune, copper wire, and ward core.                             |
| Primary Uses          | Required for Mana Furnace block; links smelting, magic, automation, and village supply.                                  |
| Progression Role      | POC identity item because it proves magic is practical infrastructure, not only combat.                                  |
| Notes / Tags / Visual | Tags: machine-part, magic, processing, mana, automation, poc-critical. Visual: stone/metal core with pulsing rune seams. |

## Builder Request Slip

| **Field**             | **Value**                                                                                                                                    |
|-----------------------|----------------------------------------------------------------------------------------------------------------------------------------------|
| Internal ID           | item.quest.builder_request_slip                                                                                                              |
| Category              | Quest Item / Village                                                                                                                         |
| Rarity                | Common                                                                                                                                       |
| Progression Tier      | T1 Village                                                                                                                                   |
| Default Stack         | 1                                                                                                                                            |
| Source                | Generated by the village builder, elder, request board, or watchtower blueprint project.                                                     |
| Primary Uses          | Lists required materials and delivery targets for an NPC construction project.                                                               |
| Progression Role      | Teaches that villages consume real resources and lets the player track progress without a full settlement UI.                                |
| Notes / Tags / Visual | Tags: quest, village-use, construction, npc-request, poc-critical. Converts into a completed project record or trophy note after completion. |

## Basic Wrench

| **Field**             | **Value**                                                                                                                 |
|-----------------------|---------------------------------------------------------------------------------------------------------------------------|
| Internal ID           | item.tool.wrench_basic                                                                                                    |
| Category              | Tool / Automation                                                                                                         |
| Rarity                | Uncommon                                                                                                                  |
| Progression Tier      | T2 Copper                                                                                                                 |
| Default Stack         | 1                                                                                                                         |
| Source                | Crafted from copper plates, copper gear, iron rod, and wood grip.                                                         |
| Primary Uses          | Rotates machines, opens configuration UI, sets input/output sides, clears simple blockages, repairs basic machine damage. |
| Progression Role      | Separates automation interaction from normal block interaction and gives factory players a clear tool identity.           |
| Notes / Tags / Visual | Tags: tool, automation, repair, config, copper-tier. Durability: medium; repair material: copper plate or iron rod.       |

## Simple Stew

| **Field**             | **Value**                                                                                                              |
|-----------------------|------------------------------------------------------------------------------------------------------------------------|
| Internal ID           | item.food.simple_stew                                                                                                  |
| Category              | Food / Meal                                                                                                            |
| Rarity                | Common                                                                                                                 |
| Progression Tier      | T1 Farming                                                                                                             |
| Default Stack         | 8                                                                                                                      |
| Source                | Cooked from basic crops, berries, mushrooms, meat, or water depending on recipe variant.                               |
| Primary Uses          | Restores more than raw ingredients, gives minor comfort/buff, and has higher NPC value.                                |
| Progression Role      | Supports survival, settlement economy, cooking progression, and cosy village tone.                                     |
| Notes / Tags / Visual | Tags: food, meal, npc-consumed, spoilable, buff, village-use. Spoilage: yes, unless preserved or disabled by settings. |

## Basic Rune Note

| **Field**             | **Value**                                                                                                            |
|-----------------------|----------------------------------------------------------------------------------------------------------------------|
| Internal ID           | item.knowledge.basic_rune_note                                                                                       |
| Category              | Knowledge / Recipe                                                                                                   |
| Rarity                | Uncommon                                                                                                             |
| Progression Tier      | T5 Mana                                                                                                              |
| Default Stack         | 1                                                                                                                    |
| Source                | Found in a ruin, given by a village mage, or rewarded after bringing mana crystals.                                  |
| Primary Uses          | Unlocks Basic Rune recipe and explains that runes can power machines and wards.                                      |
| Progression Role      | Bridges exploration, NPC teaching, magic, and automation in the POC.                                                 |
| Notes / Tags / Visual | Tags: knowledge, recipe-unlock, magic, research, npc-taught, hidden-until-found. After reading: unlocks codex entry. |

# 27. Balancing Rules

| **Rule**                               | **Meaning**                                                                                                                   |
|----------------------------------------|-------------------------------------------------------------------------------------------------------------------------------|
| Multi-use but readable                 | Important items can connect to several systems, but the UI must show the most important uses first.                           |
| No dead progression materials          | Earlier materials should stay useful through repairs, construction, recipes, trade, and machine parts.                        |
| Tier is not rarity                     | A low-tier item can be rare because it is ancient or story-important. A high-tier item can be common within its dimension.    |
| NPC consumption must be paced          | Villages should consume enough items to matter but not so much that the player feels permanently taxed.                       |
| Automation reduces grind               | If a village requires large quantities, automation or NPC production should become available to support it.                   |
| Magic costs should be meaningful       | Magic items should use mana charge, components, cooldown, durability, corruption risk, or faction reaction where appropriate. |
| Food supports playstyle settings       | Survival and spoilage should scale with difficulty/world settings.                                                            |
| Quest items should not clutter forever | Many quest items should convert into trophies, lore notes, keys, decorations, or codex unlocks after completion.              |
| Trade value depends on context         | Base value exists, but location, quality, scarcity, culture preference, and reputation can modify price.                      |
| POC first                              | The POC must prove iron, mana, village supply, and basic automation before the registry expands into hundreds of items.       |

# 28. Open Questions for Later Documents

- Exact numeric durability values for each tool, weapon, armour piece, and machine component.

- Whether block item forms retain the Blocks Registry stack default of 100 or are standardised to item stack default of 64 for player inventory consistency.

- Exact food values, spoilage timers, buffs, and preservation mechanics.

- Whether currency is always physical inventory or moves into a wallet/currency UI after early game.

- How much item substitution villages allow for construction projects, such as any stone brick versus a specific culture stone brick.

- How item quality is generated from player crafting skill, NPC specialist skill, station tier, material quality, and magic modifiers.

- How many accessory slots exist by default and whether backpacks occupy an equipment slot or separate inventory upgrade slot.

- How magic charge is stored: per item, external mana battery, player resource, or a combination.

- How illegal/forbidden items affect reputation, guards, factions, trade, and NPC fear.

- How modding/import/export should structure item IDs, tags, localised names, and recipe references.

# Appendix A. POC Item Checklist

| **Item**                 | **Category**                         | **Rarity / Tier**       | **Scope**    |
|--------------------------|--------------------------------------|-------------------------|--------------|
| Oak Log                  | Raw Resource / Wood                  | Common / T1 Wood        | POC Required |
| Stick                    | Raw Resource / Plant                 | Common / T0 Survival    | POC Required |
| Plant Fibre              | Raw Resource / Fibre                 | Common / T0 Survival    | POC Required |
| Thatch Bundle            | Processed Material / Fibre           | Common / T1 Wood        | POC Required |
| Stone Chunk              | Raw Resource / Stone                 | Common / T1 Stone       | POC Required |
| Flint                    | Raw Resource / Stone                 | Common / T0 Survival    | POC Required |
| Clay Lump                | Raw Resource / Clay                  | Common / T1 Stone       | POC Required |
| Sand                     | Raw Resource / Loose                 | Common / T1 Stone       | POC Required |
| Coal Chunk               | Raw Resource / Fuel                  | Common / T1 Stone       | POC Required |
| Raw Copper Ore           | Raw Resource / Ore                   | Common / T2 Copper      | POC Required |
| Copper Ingot             | Refined Material / Metal             | Common / T2 Copper      | POC Required |
| Copper Wire              | Machine Material / Metal             | Common / T2 Copper      | POC Required |
| Copper Plate             | Machine Material / Metal             | Common / T2 Copper      | POC Required |
| Copper Gear              | Machine Component / Mechanical       | Common / T2 Copper      | POC Required |
| Raw Iron Ore             | Raw Resource / Ore                   | Common / T3 Iron        | POC Required |
| Iron Ingot               | Refined Material / Metal             | Common / T3 Iron        | POC Required |
| Iron Plate               | Machine Material / Metal             | Common / T3 Iron        | POC Required |
| Iron Rod                 | Machine Material / Metal             | Common / T3 Iron        | POC Required |
| Iron Nails               | Construction Material / Metal        | Common / T3 Iron        | POC Required |
| Raw Mana Crystal         | Raw Resource / Magic                 | Uncommon / T5 Mana      | POC Required |
| Mana Shard               | Magic Component / Crystal            | Uncommon / T5 Mana      | POC Required |
| Mana Dust                | Magic Component / Powder             | Uncommon / T5 Mana      | POC Required |
| Blank Rune Stone         | Magic Component / Rune Base          | Common / T5 Mana        | POC Required |
| Basic Rune               | Magic Component / Rune               | Uncommon / T5 Mana      | POC Required |
| Basic Ward Core          | Magic Component / Ward               | Uncommon / T5 Mana      | POC Required |
| Oak Plank                | Processed Material / Wood            | Common / T1 Wood        | POC Required |
| Oak Beam                 | Construction Material / Wood         | Common / T1 Wood        | POC Required |
| Cobblestone              | Construction Material / Stone        | Common / T1 Stone       | POC Required |
| Stone Brick              | Construction Material / Stone        | Common / T1 Stone       | POC Required |
| Glass Piece              | Processed Material / Glass           | Common / T1 Stone       | POC Required |
| Wild Berries             | Food / Ingredient                    | Common / T0 Survival    | POC Required |
| Wheat Seed               | Seed / Crop                          | Common / T1 Farming     | POC Required |
| Wheat                    | Food / Crop                          | Common / T1 Farming     | POC Required |
| Bread                    | Food / Meal                          | Common / T1 Farming     | POC Required |
| Raw Meat                 | Food / Ingredient                    | Common / T1 Survival    | POC Required |
| Cooked Meat              | Food / Meal                          | Common / T1 Survival    | POC Required |
| Simple Stew              | Food / Meal                          | Common / T1 Farming     | POC Required |
| Water Flask              | Drink / Utility                      | Common / T0 Survival    | POC Required |
| Crude Pickaxe            | Tool / Pickaxe                       | Common / T0 Survival    | POC Required |
| Crude Axe                | Tool / Axe                           | Common / T0 Survival    | POC Required |
| Stone Pickaxe            | Tool / Pickaxe                       | Common / T1 Stone       | POC Required |
| Stone Axe                | Tool / Axe                           | Common / T1 Stone       | POC Required |
| Iron Pickaxe             | Tool / Pickaxe                       | Common / T3 Iron        | POC Required |
| Iron Axe                 | Tool / Axe                           | Common / T3 Iron        | POC Required |
| Basic Hammer             | Tool / Building                      | Common / T2 Copper      | POC Required |
| Basic Wrench             | Tool / Automation                    | Uncommon / T2 Copper    | POC Required |
| Basic Rune Tuner         | Tool / Magic Automation              | Uncommon / T5 Mana      | POC Required |
| Rune Chisel              | Tool / Magic Crafting                | Uncommon / T5 Mana      | POC Required |
| Blueprint Tool           | Tool / Planning                      | Uncommon / T3 Iron      | POC Required |
| Iron Sword               | Weapon / Melee                       | Common / T3 Iron        | POC Required |
| Wooden Bow               | Weapon / Ranged                      | Common / T1 Wood        | POC Required |
| Arrow Bundle             | Ammo / Ranged                        | Common / T1 Wood        | POC Required |
| Apprentice Staff         | Weapon / Magic Focus                 | Uncommon / T5 Mana      | POC Required |
| Wooden Shield            | Equipment / Shield                   | Common / T1 Wood        | POC Required |
| Leather Tunic            | Armour / Light                       | Common / T1 Survival    | POC Required |
| Small Backpack           | Equipment / Carrying                 | Common / T1 Survival    | POC Required |
| Wooden Machine Frame     | Machine Component / Frame            | Common / T2 Copper      | POC Required |
| Copper Machine Frame     | Machine Component / Frame            | Common / T2 Copper      | POC Required |
| Basic Machine Core       | Machine Component / Core             | Uncommon / T2 Copper    | POC Required |
| Item Chute Segment       | Machine Component / Logistics        | Common / T2 Copper      | POC Required |
| Iron Miner Head          | Machine Component / Mining           | Common / T3 Iron        | POC Required |
| Stone Furnace Core       | Machine Component / Processing       | Common / T1 Stone       | POC Required |
| Mana Furnace Core        | Machine Component / Magic Processing | Uncommon / T5 Mana      | POC Required |
| Ward Lantern Core        | Magic Component / Defence            | Uncommon / T5 Mana      | POC Required |
| Copper Trade Coin        | Currency / Economy                   | Common / T2 Copper      | POC Required |
| Village Supply Token     | Economy / Village                    | Common / T1 Village     | POC Required |
| Builder Request Slip     | Quest Item / Village                 | Common / T1 Village     | POC Required |
| Warehouse Crate Manifest | Quest Item / Logistics               | Common / T1 Village     | POC Required |
| Goblin Scrap             | Monster Drop / Material              | Common / T1 Combat      | POC Required |
| Crude Goblin Blade       | Monster Drop / Weapon                | Common / T1 Combat      | POC Required |
| Weak Monster Essence     | Monster Drop / Magic                 | Uncommon / T5 Mana      | POC Required |
| Torn Research Page       | Knowledge / Research                 | Uncommon / T5 Mana      | POC Required |
| Basic Rune Note          | Knowledge / Recipe                   | Uncommon / T5 Mana      | POC Required |
| Local Map Fragment       | Knowledge / Map                      | Common / T1 Exploration | POC Required |

# Appendix B. Item Database Field Template

| **Field**               | **Purpose**                                                         | **Use**               |
|-------------------------|---------------------------------------------------------------------|-----------------------|
| item_id                 | Readable unique internal ID, e.g. item.material.iron_ingot.         | Required              |
| display_name            | Player-facing item name.                                            | Required              |
| common_name / lore_name | Optional split between practical and lore naming for special items. | Optional              |
| category                | Top-level item category.                                            | Required              |
| subcategory             | More precise family/type.                                           | Required              |
| parent_class            | BaseItem, ToolItem, MagicComponentItem, etc.                        | Required              |
| material_family         | Wood, iron, mana, voidstone, cloth, food, etc.                      | If applicable         |
| rarity                  | Common, Uncommon, Rare, Epic, Legendary, Mythic, Relic.             | Required              |
| progression_tier        | T0-T9 or named tier.                                                | Required              |
| quality_enabled         | Whether this item can have quality states.                          | Optional              |
| default_stack_size      | Category-based default stack size.                                  | Required              |
| base_value              | Base trade value before modifiers.                                  | Later balance         |
| description_gameplay    | Clear practical description.                                        | Required              |
| flavour_text            | Lore/flavour text for special items.                                | Optional              |
| source_methods          | How the item is obtained.                                           | Required              |
| recipe_input_links      | Recipes where item is input.                                        | Later recipe registry |
| recipe_output_links     | Recipes where item is output.                                       | Later recipe registry |
| block_ref_id            | Linked block ID if this is a block item form.                       | If applicable         |
| tool_class              | Pickaxe, axe, wrench, rune tuner, etc.                              | If applicable         |
| equipment_slot          | Weapon, shield, head, chest, ring, backpack, etc.                   | If applicable         |
| durability              | Max durability and repair rules.                                    | If applicable         |
| charge / fuel_value     | Mana or machine fuel data.                                          | If applicable         |
| food_values             | Hunger, buffs, spoilage, NPC meal value.                            | If applicable         |
| npc_use                 | Village need, NPC consumption, trade preference.                    | If applicable         |
| automation_use          | Machine input, component, transportable, filterable.                | If applicable         |
| magic_use               | Rune, ritual, spell, mana, corruption, school affinity.             | If applicable         |
| unlock_method           | Start, crafted, researched, NPC-taught, boss, dimension, event.     | Required              |
| tags                    | Search/system tags.                                                 | Required              |
| visual_notes            | Icon/model/material notes, rarity treatment.                        | Recommended           |
| implementation_notes    | Technical notes, data-asset notes, TODOs.                           | Planning              |
| scope_status            | POC Required, Alpha, Beta, Final Game, Placeholder, Deferred.       | Planning              |

# Appendix C. Cross-System Use Matrix

| **Item / Family**    | **Connected Systems**                                         | **Design Purpose**                                                         |
|----------------------|---------------------------------------------------------------|----------------------------------------------------------------------------|
| Iron Ingot           | Crafting, gear, machines, village defence, trade              | Tools, sword, guard gear, watchtower, machine components.                  |
| Mana Crystal         | Magic, machines, NPC requests, research, trade, portals later | Mana furnace, runes, ward lantern, mana batteries, mage quests.            |
| Plant Fibre          | Survival, farming, building, tools, textiles                  | Rope, thatch, simple tools, cloth path, backpacks.                         |
| Goblin Scrap         | Combat loot, trade, quests, faction response                  | Sell, salvage, proof of raid defence, goblin faction hooks.                |
| Builder Request Slip | Village, quests, UI, construction                             | Shows exact resources needed and turns a village need into player action.  |
| Torn Research Page   | Exploration, magic, research, recipe unlock                   | Found in ruins and turns discovery into usable magic/automation knowledge. |
| Machine Frame        | Automation, crafting, village industry                        | Core machine part linking copper/iron processing to factory growth.        |
| Grain Sack           | Food economy, NPC needs, trade routes, events                 | Village food security, famine prevention, caravan trade.                   |

# Appendix D. Future Item Family Backlog

- Full culture-specific trade goods for each race/civilisation.

- Full food/cooking families: meals, preserved foods, cultural dishes, drinks, festival foods.

- Complete potion and alchemy reagent list.

- Full weapon family with material variants and special moves.

- Full armour family with light, medium, heavy, robes, cultural sets, and set bonuses.

- Accessory families: rings, amulets, cloaks, belts, charms, trinkets, backpacks, satchels.

- Machine component families for each automation tier.

- Rune/glyph families tied to magic schools and machine logic.

- Monster drop tables by creature category.

- Dungeon treasure/relic families by structure type.

- Dimension-specific resource and artifact families.

- Illegal/forbidden item list for dark magic and conqueror paths.

- NPC profession supply crates: farmer, miner, builder, guard, mage, alchemist, blacksmith, courier.

- Book/lore item taxonomy: journals, research notes, culture texts, recipe scrolls, maps, prophecy fragments.

- Full block item form export generated from the Blocks Registry.
