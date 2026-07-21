**Fantasy Voxel Civilisation Sandbox**

**03 - Blocks Registry**

*Version 0.1 - Detailed Design Bible Draft*

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr class="header">
<th><strong>Block Registry Statement</strong><br />
A spreadsheet-ready and design-bible-ready block system for a high-fidelity fantasy voxel civilisation sandbox, where blocks are not only terrain or decoration: they are building materials, machine parts, village resources, magic infrastructure, automation endpoints, story gates, defence pieces, hazards, and realm-specific progression objects.</th>
</tr>
</thead>
<tbody>
</tbody>
</table>

| **Field**            | **Locked Direction**                                                                                                                                                                |
|----------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Document Scope       | Full block system design document, registry framework, POC block list, future full-game category map, sample entries, category matrix, appendices, and spreadsheet-ready structure. |
| Core Philosophy      | Balance Minecraft-like readability, fantasy visual depth, automation compatibility, village usefulness, magic integration, and long-term content scalability.                       |
| Default Block Size   | One cubic metre style block as the default world/grid unit.                                                                                                                         |
| Shapes               | Full cubes plus slabs, stairs, slopes, beams, posts, pillars, fences, walls, railings, arches, windows, roof pieces, and furniture-sized placeables.                                |
| POC Direction        | Expanded POC block set that can test terrain, building, automation, magic, defence, village supply, and cosy presentation.                                                          |
| Registry Size Target | Version 0.1 defines 80-120 block entries in usable detail, with future families mapped for expansion.                                                                               |
| Parent Data Model    | Use a parent/base block definition so new blocks inherit common physical, visual, interaction, inventory, generation, and system-connection data.                                   |

# Document Purpose

This document defines the block system for the Fantasy Voxel Civilisation Sandbox. It explains what blocks are, how they are categorised, how they connect to player progression, how they support NPC villages, how they interact with automation and magic, and how they should be stored in a future database or spreadsheet.

It does not replace the future Items Registry, Recipe Registry, Automation System, Magic System, NPC/Village System, Biomes and World Generation document, or Dimensions document. Instead, it creates the block-facing rules those future systems can reference.

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr class="header">
<th><strong>Design Source</strong><br />
This document follows the locked direction from 00 - Master Game Design Bible, 01 - Core Gameplay Loop, and 02 - Player Progression System. The source documents establish that resources and blocks should support survival, building, automation, village supply, magic, exploration, progression, NPC construction, and world consequences.</th>
</tr>
</thead>
<tbody>
</tbody>
</table>

# Static Table of Contents

- 1\. Locked Block Registry Identity

- 2\. Player Answer Decision Summary

- 3\. Block System Architecture

- 4\. Parent Block Data Model

- 5\. Registry Categories, Families, and Tags

- 6\. Block Shape, Placement, Rotation, and States

- 7\. Mining, Damage, Hardness, Drops, and Repair

- 8\. Gravity, Support, and Structural Rules

- 9\. Terrain and Natural Block Rules

- 10\. Resource, Ore, Deposit, and Node Rules

- 11\. Construction and Decorative Block Rules

- 12\. Functional, Crafting, and Storage Block Rules

- 13\. Automation and Logistics Block Rules

- 14\. Magic Block Rules

- 15\. Village, NPC, and Civilisation Block Rules

- 16\. Defence, Hazard, Weather, and Risk Block Rules

- 17\. Fluid Block Rules

- 18\. Dimension and Realm Block Rules

- 19\. Unlocks, Progression, Rarity, Stack Sizes, and Naming

- 20\. Relationships With Other Documents

- 21\. Proof-of-Concept Block Scope

- 22\. Full Game Block Category Matrix

- 23\. Detailed Block Registry v0.1

- 24\. Sample Detailed Block Entries

- 25\. Balancing Rules

- 26\. Open Questions for Later Documents

- Appendix A. POC Block Checklist

- Appendix B. Block Category Matrix

- Appendix C. Registry Field Template

- Appendix D. Future Block Family Backlog

- Appendix E. Cross-System Use Matrix

# 1. Locked Block Registry Identity

The block system is a core layer of the game rather than a background technical detail. Blocks form terrain, buildings, villages, machines, magic networks, roads, farms, storage, defences, hazards, dimensions, and construction projects. Because the game is a voxel sandbox, blocks are the most common way the player physically changes the world.

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr class="header">
<th><strong>Locked Rule</strong><br />
Blocks should remain readable, placeable, mineable, and satisfying like a classic voxel sandbox, but important blocks should also connect to civilisation growth, automation, magic, progression, trade, defence, quests, or dimensions wherever practical.</th>
</tr>
</thead>
<tbody>
</tbody>
</table>

| **Identity Layer**    | **Design Meaning**                                                                                            | **Player-Facing Result**                                                      |
|-----------------------|---------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------|
| Voxel Sandbox         | Blocks are mined, placed, crafted, shaped, and stored.                                                        | The player understands the world physically and can build freely.             |
| Civilisation Resource | Villages consume exact blocks for construction, repair, storage, trade, and defence.                          | Stone, wood, metal, glass, mana, and culture blocks visibly grow settlements. |
| Automation Object     | Machines, logistics, storage, power, and warehouse blocks move and transform resources.                       | Factories and magic infrastructure have physical presence.                    |
| Magic Infrastructure  | Mana, runes, wards, conduits, portals, ritual stones, and corruption blocks are placeable and functional.     | Magic becomes a technology layer, not only a spell list.                      |
| Progression Gate      | Blocks can require tool tiers, research, NPC teaching, faction trust, bosses, dimensions, or magic knowledge. | New block families mark meaningful growth.                                    |
| World-State Evidence  | Damaged, ruined, burnt, corrupted, repaired, powered, or constructed block states show consequences.          | The world visibly reacts to player and NPC actions.                           |

# 2. Player Answer Decision Summary

| **Area**            | **Locked Decision**                                                                                                                                                           |
|---------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Document Scope      | Create a full design-bible style document plus registry framework, POC block list, future category map, detailed entries, appendices, and spreadsheet-ready tables.           |
| Block Philosophy    | Balance readability, fantasy detail, automation, village construction, magic, and final-game scalability. Important blocks should usually connect to multiple systems.        |
| Progression Role    | Functional blocks are the main progression-linked block type, while terrain, resources, construction, village, magic, and automation blocks still support progression.        |
| Material Use        | Earlier materials remain useful late-game. Use both direct tier upgrades and unique-function materials.                                                                       |
| Shape System        | Default grid is one cubic metre. Support full cubes, slabs, stairs, slopes, beams, posts, pillars, fences, walls, railings, arches, windows, roofs, and furniture placeables. |
| Damage and Repair   | Use mining cracks, raid/fire/damage states, damaged variants, ruined versions, rubble, and repair scaffolds.                                                                  |
| Physics             | Minecraft-style floating blocks by default. Gravity applies only to sand/gravel-like loose blocks. No full structural integrity system by default.                            |
| Categories and Tags | Use all major categories and tag every block for technical and player-facing filters. Also use material families.                                                             |
| POC Scope           | Expand POC enough to test terrain, building, automation, magic, defence, village supply, and cosy presentation.                                                               |
| Terrain and Nature  | Use basic soils plus deeper fertility/temperature/moisture properties. Include many stone variants and tree families.                                                         |
| Ores and Deposits   | Use simple veins, biome/depth logic, large automation deposits, surface clues, rich/poor grades, magical purity, raw drops, and by-products.                                  |
| Construction        | Every main material can eventually get a full construction set. Roof blocks use both stair/slab construction and dedicated roof pieces.                                       |
| Functional Blocks   | All major stations exist as blocks. Stations can have material upgrades, add-ons, NPC specialist upgrades, and magic/rune upgrades.                                           |
| Automation          | Early transport uses multiple options over progression. Machines require power. Moving items should be visible, with close-range performance rules.                           |
| Magic               | All magic block categories exist. Magic blocks generally require discovered knowledge through ruins, books, research, or NPCs.                                                |
| Villages            | NPCs can physically place, remove, repair, farm, mine, and cut blocks. Construction uses both blueprints and small dynamic repairs.                                           |
| Ownership           | Default free building/breaking can exist, but protection, permissions, theft, and reputation effects are world-setting controlled.                                            |
| Hazards             | Fire, weather, raids, traps, cursed terrain, poison, lava, thorn vines, quicksand, ice, and magical storms can all interact with blocks.                                      |
| Dimensions          | Each major dimension should introduce terrain, construction, resource, magic, and hazard block families that remain useful in the overworld.                                  |
| Data Model          | Use display names plus internal IDs, rarity labels, default stack size of 100, special lower stacks, and complete technical/system fields.                                    |

# 3. Block System Architecture

The block system should be designed as a layered data architecture. The player sees simple, readable names and block behaviour. The game internally treats blocks as data-driven objects that can inherit behaviour from parent definitions and add only the unique properties needed for each block.

| **Layer**             | **Purpose**                                                       | **Examples**                                                                                                        |
|-----------------------|-------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------|
| Base Block Definition | The parent object all blocks inherit from.                        | Collision, size, stack size, hardness, tags, transparency, light, rotation, placement, mining, inventory behaviour. |
| Material Family       | A reusable family that gives related blocks shared properties.    | Oak wood, iron, stone, mana crystal, voidstone, fae living wood.                                                    |
| Category/Subcategory  | A registry organisation layer for filtering and documentation.    | Terrain \> Soil, Functional \> Crafting Station, Automation \> Logistics.                                           |
| Block Variant         | A specific placed block with unique ID and display name.          | stone.basic, stone.brick, stone.slab, stone.stair, stone.wall.                                                      |
| Block State           | A runtime state on a block instance.                              | Facing north, lit, powered, damaged, cracked, wet, active, corrupted.                                               |
| Connected Systems     | Links the block to external gameplay systems.                     | Crafting, villages, automation, magic, farming, quests, dimensions, weather.                                        |
| Planning Metadata     | A documentation/project layer not required in shipped block data. | POC Required, Alpha, Final Game, Placeholder, Deferred.                                                             |

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr class="header">
<th><strong>Important Data Rule</strong><br />
POC status should not be a hard gameplay property inherited by the block itself. It is a planning/status column in design documents and spreadsheets. The shipped block data should remain clean and reusable.</th>
</tr>
</thead>
<tbody>
</tbody>
</table>

# 4. Parent Block Data Model

The parent block model is critical for keeping the project manageable. Instead of hand-building every block as a unique object, new blocks should inherit from parent definitions and material families. This lets a stone stair automatically inherit stone sounds, mining tool rules, hardness class, default stack size, texture family, and destruction behaviour unless overridden.

| **Parent Class / Data Layer** | **Inherits / Controls**                                                                                           | **Example Children**                                       |
|-------------------------------|-------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------|
| BaseBlock                     | Grid size, placement type, inventory form, collision, selection outline, default stack size, tags, state support. | All blocks.                                                |
| TerrainBlock                  | Natural generation, shovel/pick tool classes, biome rules, footstep sound, natural surface states.                | Grass, dirt, mud, sand, snow, stone, deepstone.            |
| ConstructionBlock             | Material family, shape variants, rotation, cosmetic variants, crafting source, blast/fire values.                 | Stone brick, plank wall, roof tile, pillar, arch.          |
| FunctionalBlock               | UI interaction, inventory slots, recipe hooks, activation states, output slots, automation ports.                 | Workbench, furnace, anvil, rune table.                     |
| StorageBlock                  | Inventory capacity, access rules, ownership flags, automation import/export, NPC permissions.                     | Chest, crate, barrel, village warehouse.                   |
| MachineBlock                  | Power use, throughput, input/output sides, maintenance, active/idle/blockage states.                              | Miner, crusher, arcane furnace, farm processor.            |
| MagicBlock                    | Mana storage/flow, ritual roles, ward radius, discovered knowledge requirement, magical visual states.            | Mana conduit, ward lantern, portal frame, ritual anchor.   |
| VillageBlock                  | Ownership, blueprint role, NPC job interaction, construction stage, repair state, reputation rules.               | Blueprint marker, scaffold, job-site marker, market stall. |
| HazardBlock                   | Damage type, spread behaviour, environmental rules, difficulty scaling, weather interaction.                      | Lava, poison sludge, cursed ground, thorn vine.            |
| RealmBlock                    | Dimension source, special realm rules, overworld utility, instability/corruption interaction.                     | Voidstone, fae grass, dream glass, infernal brick.         |

## 4.1 Example Parent Inheritance

| **Example**       | **Inheritance Chain**                                                                         | **What It Gains Automatically**                                                                       |
|-------------------|-----------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------|
| Oak Stair         | BaseBlock -\> ConstructionBlock -\> WoodFamily -\> OakFamily -\> StairVariant                 | Wood sounds, flammability, axe harvesting, 100 stack default, stair collision, rotation, oak visuals. |
| Mana Conduit      | BaseBlock -\> MagicBlock -\> ManaNetworkBlock -\> ConduitVariant                              | Mana flow states, glow pulse, network connection, knowledge unlock, magic tags, overload visuals.     |
| Village Warehouse | BaseBlock -\> StorageBlock -\> VillageBlock -\> WarehouseVariant                              | Inventory, NPC access, ownership flags, automation input rules, reputation/permission hooks.          |
| Copper Ore Rich   | BaseBlock -\> TerrainBlock -\> ResourceBlock -\> OreBlock -\> CopperFamily -\> RichOreVariant | Pickaxe requirement, copper drops, by-products, generation rules, rich deposit tag.                   |

# 5. Registry Categories, Families, and Tags

Every block should have a primary category, optional subcategory, material family, and multiple tags. Categories help players and designers navigate the registry. Tags help technical systems, recipes, villages, automation, search filters, and UI screens identify compatible blocks.

| **Top-Level Category**      | **Purpose**                                                                 | **Example Blocks**                                          |
|-----------------------------|-----------------------------------------------------------------------------|-------------------------------------------------------------|
| Terrain Blocks              | World ground, underground layers, soils, loose materials, natural surfaces. | Grass, dirt, stone, sand, mud, deepstone.                   |
| Natural Blocks              | Trees, leaves, plants, mushrooms, harvestables, natural decorations.        | Logs, leaves, berries, reeds, flowers, fungi.               |
| Resource/Ore Blocks         | Mineable materials, crystal clusters, deposits, and automation nodes.       | Copper ore, iron ore, mana crystal ore, coal ore.           |
| Construction Blocks         | Player and NPC building materials and shape variants.                       | Planks, bricks, walls, pillars, stairs, roofs.              |
| Decorative Blocks           | Cosy, cultural, aesthetic, and furniture blocks.                            | Tables, banners, carpets, shelves, shutters.                |
| Functional/Crafting Blocks  | Blocks that unlock or perform crafting and processing.                      | Workbench, furnace, forge, rune table, research desk.       |
| Storage Blocks              | Player, NPC, village, machine, and logistics inventories.                   | Chest, crate, silo, village warehouse.                      |
| Automation/Logistics Blocks | Machines, transport, power, filtering, routing, processing.                 | Miner, conveyor, pipe, splitter, water wheel, mana battery. |
| Magic Blocks                | Mana, runes, rituals, wards, portals, enchanting, corruption.               | Mana conduit, ward lantern, portal frame, ritual anchor.    |
| Village/Civilisation Blocks | NPC construction, blueprints, jobs, ownership, settlement services.         | Blueprint marker, scaffold, market stall, job marker.       |
| Defence Blocks              | Protection, raid response, guard logic, traps, walls, alarm blocks.         | Gate, watchtower, palisade, guard post, alarm bell.         |
| Hazard Blocks               | Environmental danger, corruption, poison, fire, realm hazards.              | Lava, poison sludge, cursed ground, thorn vines.            |
| Fluid Blocks                | Liquids and fluid-like world blocks.                                        | Water, lava, mana fluid, sludge.                            |
| Dimension/Realm Blocks      | Realm terrain, resources, construction, magic, and hazards.                 | Voidstone, fae grass, dream glass, infernal brick.          |

| **Tag Type** | **Example Tags**                                                                       | **Used By**                                    |
|--------------|----------------------------------------------------------------------------------------|------------------------------------------------|
| Physical     | solid, transparent, liquid, gas, attachable, gravity, climbable, rotatable             | Placement, physics, collision, rendering.      |
| Tool         | pickaxe, axe, shovel, sickle, hammer, wrench, magic-tool                               | Mining, harvesting, durability, skill XP.      |
| Material     | wood, stone, metal, soil, crystal, glass, organic, cloth, rune, corrupted              | Recipes, variants, families, village requests. |
| System       | crafting, automation, magic, village-use, npc-build, defence, farming, storage         | Cross-system filters and logic.                |
| Risk         | flammable, explosive, burning, poisonous, cursed, slippery, hot, freezing, spreading   | Weather, hazards, combat, environment.         |
| Generation   | surface, cave, deep, biome-forest, biome-desert, ruin, village, dimension              | World generation and structure placement.      |
| Progression  | starter, copper-tier, iron-tier, mana-tier, researched, npc-taught, faction, dimension | Unlock and progression views.                  |

# 6. Block Shape, Placement, Rotation, and States

The default block is a full one cubic metre voxel. However, the final block system should support a rich shape library for high-fidelity voxel building and NPC architecture. Terrain should remain mostly cube-based for readability. Functional blocks can use more detailed models than terrain blocks.

| **Shape Type**                 | **Locked Direction**                             | **Notes**                                                                |
|--------------------------------|--------------------------------------------------|--------------------------------------------------------------------------|
| Full Cube                      | Core terrain and construction shape.             | Default for terrain, ores, bricks, storage foundations, resource blocks. |
| Slab / Half Block              | Supported.                                       | Useful for floors, platforms, detailed building, paths, roofs.           |
| Stairs                         | Supported.                                       | Core building and roof option.                                           |
| Slopes / Ramps                 | Supported for build pieces, not default terrain. | Useful for roads, roofs, bridges, and modular pieces.                    |
| Beams / Posts / Pillars        | Supported.                                       | Important for fantasy architecture and structural visuals.               |
| Fences / Walls / Railings      | Supported.                                       | Defence, farms, roads, balconies, village style.                         |
| Arches / Windows / Roof Pieces | Supported.                                       | High-fidelity fantasy style and culture-specific architecture.           |
| Furniture Placeables           | Supported as block entries.                      | Beds, tables, chairs, shelves, counters, signs, decorations.             |
| Microblocks/Chiselling         | Limited decorative chiselling only.              | Avoid full microblock complexity for early builds.                       |

| **State Type**   | **Examples**                                                            | **Default Scope**                                        |
|------------------|-------------------------------------------------------------------------|----------------------------------------------------------|
| Placement State  | Facing, rotation, waterlogged, attached side, upside down, open/closed. | Most placeable and functional blocks.                    |
| Mining State     | Cracked stages while breaking.                                          | All mineable blocks.                                     |
| Damage State     | Damaged, burnt, broken, ruined, rubble, repairable.                     | Village, structure, defence, and optional player blocks. |
| Functional State | Idle, active, blocked, powered, unpowered, full, empty, locked.         | Stations, machines, storage, automation.                 |
| Magic State      | Charged, depleted, pulsing, overloaded, warded, corrupted, unstable.    | Magic blocks and mana networks.                          |
| Weather State    | Wet, snow-covered, frozen, muddy, storm-disrupted.                      | Terrain, machines, crops, mana blocks.                   |

# 7. Mining, Damage, Hardness, Drops, and Repair

Mining should be readable and satisfying. Low-level blocks break quickly; hard stone, ores, reinforced blocks, and dimension blocks require better tools, magic, automation, or special knowledge. Ores should generally drop raw ore plus possible by-products, rather than always dropping the block itself.

| **Rule Area**    | **Locked Direction**                                                                                                                       |
|------------------|--------------------------------------------------------------------------------------------------------------------------------------------|
| Hardness         | Define hardness for every block. Use simple categories in design docs, then numeric values in implementation.                              |
| Tool Requirement | Most resource and terrain blocks require an appropriate tool for good drops. Some blocks can be broken by hand but drop less or slowly.    |
| Drops            | Use raw drops, block drops, by-products, quality grades, and magic-modified drops where appropriate.                                       |
| Damage Visuals   | Mining cracks are universal. Raid, fire, ruined, rubble, and repair states exist for relevant blocks.                                      |
| Repair           | Damaged blocks can be repaired through normal crafting stations, village repair markers, repair benches, and machine maintenance stations. |
| NPC Interaction  | NPC builders repair and replace blocks using exact resource requirements or project-defined block lists.                                   |
| Fire Damage      | Flammable blocks can burn and spread fire on normal/hard settings. Fire spread can be reduced or disabled by world settings.               |

# 8. Gravity, Support, and Structural Rules

The default world should preserve classic voxel freedom. Full structural integrity is not a core default system. This means players can build freely and should not have their creativity punished by constant collapse simulation. Gravity and support rules apply only to special block classes.

| **System**           | **Default Rule**                                                             | **Examples**                                                           |
|----------------------|------------------------------------------------------------------------------|------------------------------------------------------------------------|
| Floating Blocks      | Allowed by default.                                                          | Minecraft-style creative/survival freedom.                             |
| Gravity Blocks       | Only loose material blocks fall.                                             | Sand, gravel, loose rubble, unstable ash, quicksand.                   |
| Support Rules        | Attachments and surface-specific blocks require valid surfaces.              | Torches, ladders, vines, pipes, furniture, machines, transport blocks. |
| Blueprint Support    | Blueprints and NPC buildings can require valid placement and terrain checks. | Watchtower, wall, bridge, market, warehouse.                           |
| Structural Integrity | No full structural integrity by default.                                     | Can be revisited as an optional advanced setting later.                |

# 9. Terrain and Natural Block Rules

Terrain blocks must remain visually readable and fast to understand. Natural variety should support world generation, farming, building, and biome identity without overwhelming the first-time player.

| **Terrain Area**    | **Locked Rule**                                                                                                                                   |
|---------------------|---------------------------------------------------------------------------------------------------------------------------------------------------|
| Soils               | Use dirt, grass, mud, clay, sand, and gravel as basic soil types. Later add fertility, temperature, and moisture properties.                      |
| Farming Interaction | Soil type should affect crops. Special soils matter most, while tilled farmland remains the readable farming surface.                             |
| Stone Variety       | Use many regional stone types with some crafting and building differences, not only cosmetic variants.                                            |
| Cave Families       | Caves can include deepstone, crystal stone, mossy stone, ore veins, cave fungi, and rare special variants.                                        |
| Trees               | Each tree can have logs, planks, leaves, stairs, slabs, fences, beams, doors, and roof/trim where appropriate. Shared pieces can reduce workload. |
| Leaves              | Natural leaves decay when unsupported. Player-placed leaves should be protected by placement flag.                                                |
| Harvestables        | Include berries, mushrooms, herbs, reeds, flowers, fibre plants, food plants, and crafting plants.                                                |
| Water               | Use Minecraft-like block-based flowing fluids for water and early fluid logic.                                                                    |

# 10. Resource, Ore, Deposit, and Node Rules

Ore and resource blocks should support both manual mining and automation. The registry should include normal mineable blocks and long-term resource nodes for machine miners. A miner can use actual blocks in the world, a resource node, or both depending on machine type and balance.

| **Resource Rule** | **Locked Direction**                                                                                                         |
|-------------------|------------------------------------------------------------------------------------------------------------------------------|
| Generation        | Use simple underground veins, biome/depth-based veins, large deposits for automation, and surface clues leading to deposits. |
| Drops             | Ores can drop raw ore, rare by-products, crystals, fragments, or the block itself depending on tool, magic, and enchantment. |
| Grades            | Use poor/normal/rich variants plus magical purity levels for special ores and crystals.                                      |
| Mana Crystals     | Mana crystals can be ore blocks, crystal clusters, magical fuel blocks, decorative lights, and machine/magic components.     |
| Resource Nodes    | Use both resource nodes and actual block mining. Nodes are especially useful for long-term automation deposits.              |
| Rare Materials    | Gate rare materials through biome, depth, boss, dimension, research, magic, village, and faction requirements.               |

# 11. Construction and Decorative Block Rules

Construction blocks should support both player creativity and NPC architecture. Every main material can eventually have a full construction set: block, brick, slab, stair, wall, pillar, beam, fence, door, roof, trim, and culture variants. This does not mean every set is needed for the POC.

| **Construction Rule** | **Locked Direction**                                                                                                     |
|-----------------------|--------------------------------------------------------------------------------------------------------------------------|
| Full Material Sets    | Every main material can eventually receive a full construction set. POC can use a limited version.                       |
| Roof Blocks           | Use both simple stair/slab roofs and dedicated fantasy roof pieces.                                                      |
| Doors/Windows/Fences  | All are block entries, not only item entries.                                                                            |
| Furniture             | Furniture is part of the Blocks Registry. Functional and decorative furniture can both be placeable.                     |
| Lighting              | Lighting reduces monster spawns and improves village safety. Magical lights can provide stronger safety functions.       |
| Roads/Paths           | Roads affect player speed, NPC pathfinding preference, and trade route quality.                                          |
| Culture Blocks        | Each culture can have unique block families and decorative/architecture pieces, while shared core materials still exist. |

# 12. Functional, Crafting, and Storage Block Rules

| **Functional Rule** | **Locked Direction**                                                                                                                                                                              |
|---------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Stations            | Final registry should include workbench, furnace, sawmill, anvil/forge, loom, alchemy table, rune table, enchanting station, machine assembler, research desk/lab, and culture-specific stations. |
| Station Upgrades    | Stations can upgrade through material tiers, add-on modules, NPC specialists, and magic/rune upgrades.                                                                                            |
| Inventories         | Most functional blocks have internal input/output slots.                                                                                                                                          |
| Automation Ports    | Crafting stations can connect to automation. Input/output sides matter for machines; hand stations may need upgrades or machine variants.                                                         |
| Project Blocks      | NPC construction can use blueprint markers, scaffolds, construction supply crates, and job-site markers.                                                                                          |
| Repair Blocks       | Repair bench, village repair marker, and maintenance station for machines should exist.                                                                                                           |

# 13. Automation and Logistics Block Rules

| **Automation Rule**   | **Locked Direction**                                                                                                                                   |
|-----------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------|
| Early Transport       | Use multiple transport options over progression: wooden chutes, conveyors, carts, item pipes, magical conduits, and golem hauling.                     |
| Visible Items         | Transport should show moving items. To protect performance, close-range detailed rendering can be used while distant networks abstract visuals.        |
| Power                 | Automation blocks require power. Early machines can use manual, fuel, water, or wind; later machines use mana, steam, runes, leylines, and portals.    |
| Power Blocks          | Plan for crank, water wheel, windmill, fuel engine, mana battery, mana conduit, rune engine, steam engine, leyline/portal power blocks.                |
| Physical Power        | Power conduits, wires, shafts, and mana conduits should be placeable. Some systems may also support hidden routing inside machines or building pieces. |
| Machine Damage        | No routine random damage. Major raids, magical storms, sieges, or harsh difficulty settings can damage or disrupt machines.                            |
| Warehouse Integration | Village warehouses accept direct automation input through transport blocks, with permission/settings hooks as needed.                                  |

# 14. Magic Block Rules

| **Magic Rule**  | **Locked Direction**                                                                                                                                                 |
|-----------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Categories      | Mana crystal blocks, rune crafting blocks, mana storage, conduits, wards, ritual structures, portals, enchanting blocks, spell turrets, and corruption blocks exist. |
| Knowledge       | Magic blocks usually require discovered knowledge through ruins, books, research, NPC teaching, or faction/culture progression.                                      |
| Village Use     | Wards protect villages, magic lights improve safety, mana blocks power projects, and mages use magic workstations.                                                   |
| Mana Visibility | Mana flow should be visible through pulsing conduits, inspection mode, and overload/failure visuals.                                                                 |
| Corruption      | Corrupted/dark blocks can spread slowly by default, with world settings and magic/dimensions rules controlling severity.                                             |
| Balance         | Magic blocks should be powerful but not invalidate tools, machines, or NPC labour.                                                                                   |

# 15. Village, NPC, and Civilisation Block Rules

| **Village Rule**      | **Locked Direction**                                                                                                                                                                                                                  |
|-----------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Warehouse Baseline    | The source design requires village storage, resource requests, player delivery, NPC withdrawal, construction use, and automation supply. The selected answer adds ownership and reputation tracking as a mandatory warehouse feature. |
| Exact Materials       | Villages consume exact block types for construction. Later systems may allow substitution recipes, but project requirements should be explicit by default.                                                                            |
| NPC Block Interaction | Builders place blocks, farmers place/remove crops, miners mine resources, lumberjacks cut trees, and repair workers replace damaged blocks.                                                                                           |
| Construction Logic    | Use a mix of blueprint construction and small dynamic repairs.                                                                                                                                                                        |
| Culture Blocks        | Each culture can have unique block families, architecture pieces, functional blocks, and decorative identity.                                                                                                                         |
| Protection            | Default can allow free breaking/placing, but ownership, permissions, theft, and reputation effects are controlled by world settings.                                                                                                  |
| Ruins and Damage      | Damaged village buildings can become damaged variants, rubble, debris, and repair scaffold/project blocks.                                                                                                                            |

# 16. Defence, Hazard, Weather, and Risk Block Rules

| **Risk Area**  | **Locked Direction**                                                                                                   |
|----------------|------------------------------------------------------------------------------------------------------------------------|
| Defence Blocks | Walls, gates, watchtowers, guard posts, traps, barricades, wards, alarm bells, and safety lighting all exist.          |
| Fire           | Flammable blocks burn and fire can spread. Fire spread is affected by difficulty/world settings.                       |
| Weather        | Weather affects crops/soil, machines, mana blocks, snow/ice accumulation, and magical storm disruption.                |
| Raid Damage    | Raids can damage doors, gates, walls, village structures, and player structures. Difficulty settings control severity. |
| Traps          | Mechanical traps, spike/pit traps, rune traps, and magic traps are placeable blocks.                                   |
| Hazards        | Lava, poison sludge, thorn vines, cursed ground, slippery ice, quicksand, and mud hazards exist.                       |

# 17. Fluid Block Rules

Fluids should begin with water as a block-based flowing system. Later fluids can use shared parent behaviour with unique hazards, machine interactions, or magical effects.

| **Fluid**                 | **Role**                                                                                           |
|---------------------------|----------------------------------------------------------------------------------------------------|
| Water                     | POC and final core fluid: irrigation, travel, machines, farming, cooling, environmental logic.     |
| Lava/Magma                | High-damage hazard, smelting fantasy, volcanic biomes, endgame forging.                            |
| Oil/Tar                   | Fuel, sticky hazard, industrial fantasy processing.                                                |
| Sludge/Poison             | Hazard, alchemy source, corrupted swamps, monster biomes.                                          |
| Mana Fluid/Arcane Essence | Magic fuel, ritual pools, conduits, arcane machines, realm resources.                              |
| Blood/Shadow Fluid        | Forbidden magic, dark rituals, cursed biomes, evil/conqueror paths.                                |
| Steam/Gas                 | Non-placeable or semi-fluid hazard/power effect. Used for machines, vents, traps, and environment. |

# 18. Dimension and Realm Block Rules

| **Realm Rule** | **Locked Direction**                                                                                                                         |
|----------------|----------------------------------------------------------------------------------------------------------------------------------------------|
| Block Families | Every major dimension should introduce terrain, construction, resource, magic, and hazard block families.                                    |
| Overworld Use  | Dimension blocks should remain useful back in the overworld for machines, magic, village upgrades, building, and decoration.                 |
| Portals        | Portal access can use player-crafted blocks, multi-block rituals, ancient generated portals, village/culture-built portals, or all of these. |
| Teaser Blocks  | Broken portals, strange ruins, dream/fae/void fragments, and unstable rift blocks should appear before full dimensions.                      |
| Design Rule    | Dimension blocks should never exist only as recoloured terrain. They should unlock gameplay, lore, progression, or world-state change.       |

# 19. Unlocks, Progression, Rarity, Stack Sizes, and Naming

| **Field**             | **Locked Direction**                                                                                                                                         |
|-----------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Unlock Method         | Every block can define unlock method: known at start, discovered, crafted, researched, NPC-taught, faction, culture, boss, dimension, or event.              |
| Rarity                | Blocks use rarity labels: Common, Uncommon, Rare, Epic, Legendary. Rarity describes access, special function, lore, magic, or generation, not only strength. |
| Stack Size            | Default inventory stack size is 100 for standard blocks. Large, functional, dangerous, or special blocks can stack lower.                                    |
| Naming                | Use both display names and internal IDs. Internal IDs should be clear and database-friendly, e.g. terrain.grass.basic.                                       |
| Variant Relationships | Track both family relationships and individual block entries, e.g. log -\> planks -\> stairs/slabs/fence/door.                                               |
| Lore                  | Every block can have a short flavour line. Special, magic, culture, and dimension blocks should use this strongly.                                           |

# 20. Relationships With Other Documents

| **Related Document**              | **What Blocks Registry Defines**                                             | **What Later Document Defines**                                                              |
|-----------------------------------|------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------|
| 04 - Items Registry               | Names expected drops and inventory-placeable block forms.                    | Full item stats, stack rules, tool properties, consumables, equipment, item lore.            |
| 05 - Crafting and Recipe Registry | Recipe references and block unlock hooks only.                               | Full recipes, station inputs, output quantities, crafting trees, costs.                      |
| Automation System                 | Machine block registry properties and block-facing requirements.             | Throughput, power simulation, logistics algorithms, UI, balancing.                           |
| Magic System                      | Magic block registry properties and block-facing requirements.               | Schools, spell logic, mana rules, rituals, corruption mechanics, magic balance.              |
| NPC/Village System                | Village block roles, warehouse hooks, ownership fields, project block types. | NPC schedules, jobs, AI, construction logic, reputation, economy, settlement simulation.     |
| Biomes/World Generation           | Found/generated-in fields and simple placement notes.                        | Full generation algorithms, biome distributions, noise parameters, structure placement.      |
| Dimensions                        | Realm block placeholders and design requirements.                            | Full realm rules, bosses, progression gates, blocks, hazards, structures, overworld effects. |

# 21. Proof-of-Concept Block Scope

The POC block scope is intentionally larger than the source baseline because it must test terrain, building, automation, magic, defence, village supply, and cosy presentation. The POC does not need full final-game depth, but it needs enough variety to prove the integrated loop.

| **POC Category** | **Required Blocks / Block Families**                                                                  | **Purpose**                                                                                   |
|------------------|-------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------|
| Terrain          | Grass, dirt, stone, sand, gravel, clay, water, mud.                                                   | Basic generated world, digging, mining, farming, caves, paths, and environmental readability. |
| Plants/Natural   | Logs, leaves, planks, stick/branch, tall grass, bushes, crop, flowers.                                | Wood chain, early gathering, decorative village life, farming proof.                          |
| Resources/Ores   | Copper ore, iron ore, mana crystal ore, coal ore, clay deposit, surface boulders.                     | Tool progression, fuel, machine path, magic path, building.                                   |
| Functional       | Workbench, furnace, mana furnace, chest, village warehouse, basic miner, transport block, rune table. | Crafting, storage, village supply, automation, magic utility.                                 |
| Construction     | Planks, stone bricks, cobblestone, beams, stairs/slabs, roof blocks, door, fence, window/glass.       | Player shelter, village buildings, cosy readability, tower construction.                      |
| Defence          | Watchtower set, palisade, gate, torch/lantern, basic trap, guard post marker.                         | Raid test and village survival outcome.                                                       |
| Magic            | Mana crystal ore, mana furnace, rune table, ward lantern, mana conduit.                               | Magic production, defence, infrastructure, visible mana flow.                                 |
| Automation       | Basic miner, mana furnace, transport, storage, village warehouse.                                     | Iron/mana chain supplying construction and village defence.                                   |
| Decorative       | Basic village decor, furniture, lights, market/house details.                                         | Cosy identity and readable inhabited space.                                                   |

# 22. Full Game Block Category Matrix

This matrix is a high-level map of block families the final game should plan for. It is intentionally broad so later documents can drill down into exact entries, generation rules, recipes, and balance values.

| **Category** | **Family**          | **Examples**                                                                                      | **System Role**                                             |
|--------------|---------------------|---------------------------------------------------------------------------------------------------|-------------------------------------------------------------|
| Terrain      | Soils               | Grass, dirt, mud, clay, sand, gravel, snow, ash, fertile soil, cursed soil                        | World generation, farming, digging, hazards, biome identity |
| Terrain      | Stone Layers        | Stone, deepstone, limestone, basalt, granite, marble, slate, crystal stone                        | Mining, construction, caves, depth progression              |
| Natural      | Trees/Wood          | Oak, pine, birch, darkwood, living wood, emberwood, fungal wood                                   | Building, fuel, village projects, culture architecture      |
| Natural      | Plants              | Grass, bushes, reeds, herbs, flowers, fungi, vines, crop blocks                                   | Food, alchemy, farming, ecology, decoration                 |
| Resources    | Ores                | Coal, copper, tin, iron, silver, gold, mythril, mana, void, celestial                             | Tools, machines, magic, trade, progression                  |
| Resources    | Deposits/Nodes      | Rich ore deposits, boulders, crystal clusters, clay pits, oil seep, leyline nodes                 | Manual mining plus automation extraction                    |
| Construction | Wood Sets           | Logs, planks, slabs, stairs, beams, fences, doors, roofs, shutters                                | Player building and village architecture                    |
| Construction | Stone Sets          | Cobble, brick, cut stone, pillar, wall, arch, tile, carved stone                                  | Roads, walls, towers, towns, ruins                          |
| Construction | Metal Sets          | Iron grating, steel beam, copper trim, bronze plate, mythic metal frame                           | Machines, defences, advanced architecture                   |
| Decorative   | Cosy/Village        | Tables, chairs, beds, shelves, banners, rugs, signs, lanterns                                     | Cosy fantasy, NPC homes, markets, culture                   |
| Functional   | Crafting Stations   | Workbench, furnace, sawmill, forge, loom, alchemy, rune, enchanting, assembler, research desk     | Recipe unlocks and production                               |
| Storage      | Inventories         | Chest, crate, barrel, silo, warehouse, linked warehouse, vault                                    | Player/NPC storage, automation, economy                     |
| Automation   | Transport           | Chute, conveyor, cart rail, item pipe, sorter, splitter, merger, conduit                          | Production chains and village supply                        |
| Automation   | Machines            | Miner, smelter, crusher, sawmill, farm processor, assembler, pump, rune miner                     | Bulk resource conversion and scaling                        |
| Automation   | Power               | Crank, water wheel, windmill, fuel engine, steam engine, mana battery, rune engine, leyline block | Machine operation and infrastructure                        |
| Magic        | Mana Network        | Mana crystal block, conduit, battery, relay, stabiliser, overload vent                            | Magic-powered automation and settlements                    |
| Magic        | Ritual/Portal       | Rune stones, ritual anchors, portal frame, broken portal, rift stabiliser                         | Dimensions, story, high-tier magic                          |
| Magic        | Wards/Defence       | Ward lantern, ward obelisk, spell turret, rune trap, anti-monster light                           | Village defence and magical security                        |
| Magic        | Corruption          | Cursed ground, bloodstone, shadow vine, corrupted crystal, tainted soil                           | Dark magic, hazards, world events                           |
| Village      | Construction System | Blueprint marker, scaffold, supply crate, job marker, repair marker                               | NPC building and repair                                     |
| Village      | Services            | Market stall, shrine, bell, town board, guard post, training dummy                                | NPC jobs, requests, defence, trade                          |
| Defence      | Physical Defence    | Palisade, gate, wall, barricade, spikes, watchtower, alarm bell                                   | Raid outcomes and settlement safety                         |
| Hazard       | Environmental       | Lava, poison sludge, thorn vines, quicksand, slippery ice, steam vent                             | Exploration danger and biome identity                       |
| Fluids       | Liquids/Gases       | Water, lava, oil, sludge, mana fluid, blood/shadow fluid, steam/gas                               | Farming, machines, hazards, magic                           |
| Dimensions   | Realm Families      | Fae grass, voidstone, dream glass, infernal brick, deep forge stone, celestial tile               | Realm identity and overworld utility                        |

# 23. Detailed Block Registry v0.1

The following 112 entries define the v0.1 registry target. These are not final balance values, but each entry is detailed enough to guide design, spreadsheet creation, and later implementation. Scope is a planning field, not core block data.

| **ID**                             | **Display Name**          | **Category**                   | **Rarity** | **Description**                                                            | **Key Connections**                                                     | **Unlock**            | **Scope**    |
|------------------------------------|---------------------------|--------------------------------|------------|----------------------------------------------------------------------------|-------------------------------------------------------------------------|-----------------------|--------------|
| terrain.grass.basic                | Grass Block               | Terrain / Soil                 | Common     | Natural surface block for plains and village land.                         | Farming surface, path conversion, village landscaping, animal grazing.  | Start/Generated       | POC Required |
| terrain.dirt.basic                 | Dirt Block                | Terrain / Soil                 | Common     | Basic diggable earth beneath grass and many biomes.                        | Building filler, farming base, village projects, terrain edits.         | Start/Generated       | POC Required |
| terrain.stone.basic                | Stone Block               | Terrain / Stone                | Common     | Default mineable stone layer and cave wall block.                          | Tools, furnace, stone bricks, village construction, roads.              | Start/Generated       | POC Required |
| terrain.sand.basic                 | Sand Block                | Terrain / Loose                | Common     | Loose gravity-affected desert, river, and beach material.                  | Glass, mortar, roads, falling-block proof.                              | Generated             | POC Required |
| terrain.gravel.basic               | Gravel Block              | Terrain / Loose                | Common     | Loose stone fragments that fall when unsupported.                          | Flint, road base, rubble behaviour, concrete/mortar later.              | Generated             | POC Required |
| terrain.clay.basic                 | Clay Block                | Terrain / Soil                 | Common     | Wet earthy deposit found near water and lowlands.                          | Bricks, pottery, roof tiles, village building needs.                    | Generated             | POC Required |
| fluid.water.flowing                | Water Block               | Fluid                          | Common     | Block-based flowing water for rivers, lakes, irrigation, and machines.     | Farming, water wheels, travel, cooling, NPC needs.                      | Generated             | POC Required |
| terrain.mud.basic                  | Mud Block                 | Terrain / Soil                 | Common     | Wet slow terrain found after rain, near rivers, and in swamps.             | Farming, footprints, hazards, brick/clay conversion later.              | Generated             | POC Required |
| natural.log.oak                    | Oak Log                   | Natural / Wood                 | Common     | Core tree trunk block and first wood source.                               | Chopping, planks, fuel, beams, village requests.                        | Start/Generated       | POC Required |
| natural.leaves.oak                 | Oak Leaves                | Natural / Foliage              | Common     | Leaf canopy block with decay rules when unsupported.                       | Tree identity, fruit/seed drops, decoration, hiding wildlife.           | Generated             | POC Required |
| construction.planks.oak            | Oak Planks                | Construction / Wood            | Common     | First processed building block from logs.                                  | Shelter, village buildings, crafting stations, floors.                  | Crafted               | POC Required |
| natural.branch.stick               | Branch / Stick Block      | Natural / Harvestable          | Common     | Small breakable branch pile or stick source.                               | Early tools, torches, fences, starter crafting.                         | Generated             | POC Required |
| natural.grass.tall                 | Tall Grass                | Natural / Plant                | Common     | Short harvestable vegetation on grass blocks.                              | Seeds, fibre, ambience, animal forage.                                  | Generated             | POC Required |
| natural.bush.basic                 | Bush Block                | Natural / Plant                | Common     | Small foliage block that may drop berries or fibre.                        | Food, decoration, hiding, early village landscaping.                    | Generated             | POC Required |
| farm.crop.basic                    | Basic Crop Block          | Natural / Crop                 | Common     | Starter crop growth block with stages.                                     | Food loop, village food needs, farming proof.                           | Planted               | POC Required |
| natural.flower.basic               | Wildflower Block          | Natural / Plant                | Common     | Decorative and alchemy-supporting flower block.                            | Dyes, village decor, bees later, alchemy.                               | Generated             | POC Required |
| ore.coal.basic                     | Coal Ore                  | Resource / Ore                 | Common     | Fuel ore embedded in stone.                                                | Furnaces, torches, early machines, trade.                               | Generated             | POC Required |
| ore.copper.basic                   | Copper Ore                | Resource / Ore                 | Common     | First technical ore for early mechanisms and power parts.                  | Automation, wires, chutes, machine parts, tools.                        | Generated             | POC Required |
| ore.iron.basic                     | Iron Ore                  | Resource / Ore                 | Common     | Major early metal ore for tools, weapons, machines, and guards.            | Watchtower, weapons, machines, village projects.                        | Generated             | POC Required |
| ore.mana_crystal.basic             | Mana Crystal Ore          | Resource / Magical Ore         | Uncommon   | Glowing crystal-bearing ore that unlocks early magic infrastructure.       | Mana furnace, rune table, wards, magic fuel, mage requests.             | Discovered            | POC Required |
| deposit.clay.pit                   | Clay Deposit              | Resource / Deposit             | Common     | Surface or riverbank deposit for repeat clay extraction.                   | Bricks, roof tiles, pottery, construction economy.                      | Generated             | POC Required |
| resource.boulder.stone             | Surface Stone Boulder     | Resource / Surface Node        | Common     | Above-ground stone source for early gathering.                             | Starter stone, village repairs, surface clues.                          | Generated             | POC Required |
| functional.workbench.basic         | Workbench                 | Functional / Crafting          | Common     | Starter crafting station for blocks, tools, and simple components.         | Recipes, early progression, player shelter, village use.                | Crafted               | POC Required |
| functional.furnace.stone           | Stone Furnace             | Functional / Smelting          | Common     | Fuel-based smelting station for ore to ingot conversion.                   | Iron chain, coal use, basic processing, village supply.                 | Crafted               | POC Required |
| magic.furnace.mana                 | Mana Furnace              | Magic / Processing             | Uncommon   | Magical furnace using mana crystals or mana flow for advanced smelting.    | Magic utility, automation, faster/refined smelting, POC identity.       | Crafted/Researched    | POC Required |
| storage.chest.wood                 | Wooden Chest              | Storage                        | Common     | Basic player storage block with internal inventory.                        | Inventory management, automation output, player base.                   | Crafted               | POC Required |
| village.warehouse.basic            | Village Warehouse         | Village / Storage              | Uncommon   | Settlement storage and request hub with ownership and reputation tracking. | NPC withdrawal, player delivery, automation input, construction supply. | Village/Blueprint     | POC Required |
| automation.miner.basic_mana        | Basic Mana Miner          | Automation / Machine           | Uncommon   | Early powered miner that extracts from ore nodes or marked deposits.       | Automation chain, mana fuel, village supply, resource scaling.          | Crafted/Researched    | POC Required |
| automation.transport.chute         | Basic Item Chute          | Automation / Logistics         | Common     | Simple visible item transport block for gravity or powered routing.        | Miner to furnace to storage, village warehouse input.                   | Crafted               | POC Required |
| magic.rune_table.basic             | Rune Table                | Magic / Crafting               | Uncommon   | Starter magical workstation for runes, wards, and mana logic.              | Magic unlock, mana conduit, ward lantern, rune recipes.                 | Discovered/Crafted    | POC Required |
| construction.brick.stone           | Stone Brick               | Construction / Stone           | Common     | Processed stone building block for durable structures.                     | Watchtower, walls, village projects, player builds.                     | Crafted               | POC Required |
| construction.cobble.stone          | Cobblestone               | Construction / Stone           | Common     | Rough stone building block from mined stone.                               | Early shelter, roads, furnace recipes, repairs.                         | Mined/Crafted         | POC Required |
| construction.beam.oak              | Oak Beam                  | Construction / Wood            | Common     | Structural-looking wood beam and pillar block.                             | Roofs, watchtower, village architecture, scaffolds.                     | Crafted               | POC Required |
| construction.stair.oak             | Oak Stair                 | Construction / Wood Shape      | Common     | Stair and simple roof shape for wood buildings.                            | Movement, roofs, decoration, detailed building.                         | Crafted               | POC Required |
| construction.slab.oak              | Oak Slab                  | Construction / Wood Shape      | Common     | Half-height wooden building piece.                                         | Floors, roofs, bridges, compact builds.                                 | Crafted               | POC Required |
| construction.roof.thatch           | Thatch Roof Block         | Construction / Roof            | Common     | Dedicated fantasy roof piece made from straw/reeds/fibre.                  | Village homes, cosy style, weather shelter.                             | Crafted               | POC Required |
| construction.door.oak              | Oak Door                  | Construction / Door            | Common     | Opening/closing entry block with facing and ownership hooks.               | Shelter, NPC homes, raids, pathfinding.                                 | Crafted               | POC Required |
| construction.fence.oak             | Oak Fence                 | Construction / Fence           | Common     | Low barrier and animal/farm boundary block.                                | Farms, paths, defence, village detail.                                  | Crafted               | POC Required |
| construction.window.glass          | Glass Window              | Construction / Window          | Common     | Transparent building block/pane for homes and towers.                      | Shelter light, village homes, decoration.                               | Crafted               | POC Required |
| defence.watchtower.core            | Watchtower Core           | Defence / Blueprint Piece      | Uncommon   | Key block or blueprint anchor for the POC watchtower project.              | Raid detection, guard response, village construction goal.              | Village Project       | POC Required |
| defence.palisade.wood              | Wooden Palisade           | Defence / Wall                 | Common     | Early sharpened wooden wall for village defence.                           | Raid pathing, settlement boundaries, construction projects.             | Crafted/Project       | POC Required |
| defence.gate.wood                  | Wooden Gate               | Defence / Gate                 | Common     | Large openable defensive gate with pathfinding and raid logic.             | Village safety, walls, player bases.                                    | Crafted/Project       | POC Required |
| light.torch.basic                  | Torch                     | Lighting / Safety              | Common     | Starter light block that reduces basic monster spawning.                   | Caves, village safety, roads, player shelter.                           | Crafted               | POC Required |
| defence.trap.spike_basic           | Basic Spike Trap          | Defence / Trap                 | Common     | Simple mechanical trap block that damages enemies.                         | Raid defence, dungeon design, player setup.                             | Crafted               | POC Required |
| village.guard_post.marker          | Guard Post Marker         | Village / Defence              | Common     | Assigns or guides guards to patrol/defend a location.                      | NPC schedules, raid response, watchtower defence.                       | Crafted/Project       | POC Required |
| magic.ward_lantern.basic           | Ward Lantern              | Magic / Defence                | Uncommon   | Magical light that improves village safety beyond normal torches.          | Anti-monster zone, mage role, mana use, POC defence.                    | Rune Table            | POC Required |
| magic.conduit.mana_basic           | Basic Mana Conduit        | Magic / Network                | Uncommon   | Visible mana-flow block connecting mana machines and wards.                | Mana furnace, ward lantern, mana battery later.                         | Rune Table            | POC Required |
| terrain.deepstone.basic            | Deepstone                 | Terrain / Deep Stone           | Uncommon   | Harder underground stone layer for deeper caves.                           | Depth progression, stronger building, ore context.                      | Generated             | Alpha        |
| terrain.limestone.basic            | Limestone                 | Terrain / Stone Variant        | Common     | Light regional stone useful for bright towns and lime recipes.             | Construction, mortar, culture architecture.                             | Generated             | Alpha        |
| terrain.basalt.basic               | Basalt                    | Terrain / Volcanic Stone       | Uncommon   | Dark volcanic stone with high heat resistance.                             | Lava biomes, strong roads, fireproof builds.                            | Generated             | Alpha        |
| terrain.granite.basic              | Granite                   | Terrain / Stone Variant        | Common     | Hard speckled stone for durable construction.                              | Roads, walls, pillars, village projects.                                | Generated             | Alpha        |
| terrain.mossy_stone.cave           | Mossy Cave Stone          | Terrain / Cave Variant         | Common     | Damp cave stone with moss overlay.                                         | Cave ambience, ruins, nature/alchemy drops.                             | Generated             | Alpha        |
| terrain.crystal_stone.basic        | Crystal Stone             | Terrain / Magical Stone        | Uncommon   | Stone laced with minor crystal veins.                                      | Magic caves, mana clues, decorative builds.                             | Generated             | Alpha        |
| terrain.snow.basic                 | Snow Block                | Terrain / Cold                 | Common     | Cold biome terrain and accumulation block.                                 | Temperature, snow builds, weather states.                               | Generated             | Alpha        |
| terrain.ice.basic                  | Ice Block                 | Terrain / Hazard               | Common     | Slippery frozen water block.                                               | Cold biomes, hazards, storage/cooling later.                            | Generated             | Alpha        |
| terrain.soil.fertile               | Fertile Soil              | Terrain / Farming              | Uncommon   | High-quality soil improving crop growth.                                   | Farming, village food, trade, farming skill.                            | Generated/Prepared    | Alpha        |
| farm.farmland.tilled               | Tilled Farmland           | Farming                        | Common     | Prepared soil block for crops with moisture state.                         | Crop growth, irrigation, NPC farmers.                                   | Crafted/Tool          | Alpha        |
| natural.reed.basic                 | Reed Block                | Natural / Plant                | Common     | Water-edge plant used for thatch, fibre, paper, and early crafting.        | Roofs, books, alchemy, village roofs.                                   | Generated             | Alpha        |
| natural.mushroom.cave              | Cave Mushroom             | Natural / Fungi                | Common     | Underground harvestable fungus block.                                      | Food, alchemy, cave identity, mushroom cultures.                        | Generated             | Alpha        |
| construction.brick.clay            | Clay Brick Block          | Construction / Brick           | Common     | Fired clay building block for homes, chimneys, and roads.                  | Village housing, ovens, decorative towns.                               | Furnace/Crafted       | Alpha        |
| construction.roof.tile_clay        | Clay Roof Tile            | Construction / Roof            | Common     | Dedicated roof block from fired clay.                                      | Village roofs, culture architecture, cosy style.                        | Crafted               | Alpha        |
| construction.pillar.stone          | Stone Pillar              | Construction / Stone Shape     | Common     | Vertical decorative/architectural stone support.                           | Temples, towers, halls, ruins.                                          | Crafted               | Alpha        |
| construction.wall.stone            | Stone Wall                | Construction / Wall            | Common     | Low/connected wall variant for roads and defences.                         | Farms, villages, boundaries, raids.                                     | Crafted               | Alpha        |
| construction.arch.stone            | Stone Arch                | Construction / Modular         | Common     | Curved arch building piece for fantasy architecture.                       | Villages, ruins, bridges, gateways.                                     | Crafted               | Alpha        |
| construction.shutter.wood          | Wooden Shutter            | Construction / Window Detail   | Common     | Window cover block with open/closed state.                                 | Homes, village detail, culture variants.                                | Crafted               | Alpha        |
| utility.ladder.wood                | Wooden Ladder             | Utility / Climbable            | Common     | Attachable climbable block requiring support.                              | Mines, towers, roofs, caves.                                            | Crafted               | Alpha        |
| construction.trapdoor.wood         | Wooden Trapdoor           | Construction / Door            | Common     | Horizontal/vertical hinged block for floors and hatches.                   | Cellars, towers, roofs, machines.                                       | Crafted               | Alpha        |
| furniture.bed.simple               | Simple Bed                | Furniture / Functional         | Common     | Sleep/respawn furniture block and NPC home requirement.                    | Shelter, NPC housing, schedules.                                        | Crafted               | Alpha        |
| furniture.table.wood               | Wooden Table              | Furniture / Decorative         | Common     | Placeable table for homes, markets, and workrooms.                         | Cosy villages, NPC rooms, decor.                                        | Crafted               | Alpha        |
| furniture.chair.wood               | Wooden Chair              | Furniture / Decorative         | Common     | Placeable chair for homes and social spaces.                               | NPC homes, taverns, cosy identity.                                      | Crafted               | Alpha        |
| furniture.bookshelf.basic          | Bookshelf                 | Furniture / Functional         | Common     | Storage/decor block for books and research rooms.                          | Lore, research, mage homes, libraries.                                  | Crafted               | Alpha        |
| road.path.dirt                     | Dirt Path                 | Road / Movement                | Common     | Flattened path block improving movement and pathfinding preference.        | Village roads, trade route quality, player navigation.                  | Tool/Generated        | Alpha        |
| functional.sawmill.basic           | Sawmill                   | Functional / Processing        | Common     | Station that converts logs into planks, beams, and boards efficiently.     | Wood chain, builder supply, automation later.                           | Crafted               | Alpha        |
| functional.forge.anvil             | Forge and Anvil           | Functional / Smithing          | Uncommon   | Metalworking station for tools, weapons, armour, and machine parts.        | Iron progression, guards, blacksmith NPC.                               | Crafted/NPC Taught    | Alpha        |
| functional.loom.basic              | Loom                      | Functional / Crafting          | Common     | Crafting station for cloth, banners, rugs, and clothing materials.         | Decor, NPC needs, culture textiles.                                     | Crafted               | Alpha        |
| functional.alchemy_table.basic     | Alchemy Table             | Functional / Magic Crafting    | Uncommon   | Station for potions, catalysts, medicines, and fuels.                      | Farming, medicine, magic, machine inputs.                               | Researched/NPC Taught | Alpha        |
| magic.enchanting_station.basic     | Enchanting Station        | Magic / Crafting               | Uncommon   | Station for imbuing tools, gear, machines, and blocks.                     | Progression, magic utility, rare materials.                             | Researched            | Alpha        |
| automation.assembler.basic         | Machine Assembler         | Automation / Crafting          | Uncommon   | Station for crafting machines and automation components.                   | Factory progression, gears, frames, upgrades.                           | Researched            | Alpha        |
| functional.research_desk.basic     | Research Desk             | Functional / Research          | Uncommon   | Station for studying samples, books, fragments, and prototypes.            | Recipe unlocks, ancient tech, magic research.                           | Crafted               | Alpha        |
| storage.crate.wood                 | Wooden Crate              | Storage                        | Common     | Smaller stack-focused storage block for bulk goods.                        | Automation buffers, NPC jobs, markets.                                  | Crafted               | Alpha        |
| storage.barrel.wood                | Wooden Barrel             | Storage / Fluid or Food        | Common     | Storage for food, liquids, brewing, or bulk goods.                         | Village food, trade, alchemy, kitchens.                                 | Crafted               | Alpha        |
| storage.silo.basic                 | Grain Silo                | Storage / Village Food         | Common     | Bulk storage for crops and animal feed.                                    | Village food security, farms, trade.                                    | Village Project       | Alpha        |
| storage.warehouse.linked           | Linked Warehouse          | Storage / Magic Logistics      | Rare       | Advanced warehouse linked by magic or portal networks.                     | Dimensional logistics, large settlements, trade hubs.                   | Late Research         | Final Game   |
| automation.cart_depot.basic        | Cart Depot                | Automation / Logistics         | Common     | Station for carts or haulers to move goods along routes.                   | Trade routes, village supply, road networks.                            | Crafted               | Alpha        |
| automation.conveyor.basic          | Conveyor Belt             | Automation / Logistics         | Uncommon   | Powered visible item transport block for factories.                        | Production lines, sorting, machine chains.                              | Researched            | Alpha        |
| automation.pipe.item_basic         | Item Pipe                 | Automation / Logistics         | Uncommon   | Enclosed transport block for item routing through builds.                  | Compact logistics, protected transport.                                 | Researched            | Alpha        |
| automation.splitter.basic          | Splitter                  | Automation / Logistics         | Uncommon   | Splits incoming items into multiple outputs.                               | Factory routing, village supply balancing.                              | Researched            | Alpha        |
| automation.sorter.basic            | Sorter / Filter           | Automation / Logistics         | Uncommon   | Filters or routes items based on type and settings.                        | Warehouse import, production control, NPC stock.                        | Researched            | Alpha        |
| automation.merger.basic            | Merger                    | Automation / Logistics         | Uncommon   | Combines multiple inputs into one output line.                             | Factory simplification, belt/chute logic.                               | Researched            | Alpha        |
| automation.crusher.basic           | Crusher                   | Automation / Machine           | Uncommon   | Breaks stone and ore into gravel, dust, or improved smelting input.        | Ore processing, by-products, construction materials.                    | Researched            | Alpha        |
| automation.grinder.basic           | Grinder                   | Automation / Machine           | Uncommon   | Processes plants, grains, minerals, or reagents into powders.              | Food, alchemy, automation, farming.                                     | Researched            | Alpha        |
| automation.pump.basic              | Pump                      | Automation / Fluid             | Uncommon   | Moves water or other fluids through pipes.                                 | Irrigation, machines, fluid processing.                                 | Researched            | Alpha        |
| automation.pipe.fluid_basic        | Fluid Pipe                | Automation / Fluid             | Uncommon   | Physical pipe for fluid logistics.                                         | Irrigation, alchemy, steam, machines.                                   | Researched            | Alpha        |
| power.water_wheel.basic            | Water Wheel               | Automation / Power             | Common     | Medieval power block driven by flowing water.                              | Mills, early machines, settlement industry.                             | Crafted               | Alpha        |
| power.windmill.basic               | Windmill                  | Automation / Power             | Common     | Surface power block for farms and light industry.                          | Sawmills, grinders, farms, village identity.                            | Crafted               | Alpha        |
| power.crank.basic                  | Manual Crank              | Automation / Power             | Common     | Hand-powered input block for primitive machines.                           | Tutorial automation, emergency power.                                   | Crafted               | Alpha        |
| power.engine.fuel                  | Fuel Engine               | Automation / Power             | Uncommon   | Burns fuel to power machines.                                              | Early industry, reliable factory power.                                 | Researched            | Alpha        |
| magic.battery.mana                 | Mana Battery              | Magic / Power Storage          | Uncommon   | Stores external mana for machines, wards, and rituals.                     | Mana networks, night operation, magic automation.                       | Rune Table            | Alpha        |
| magic.engine.rune                  | Rune Engine               | Magic / Power                  | Rare       | Advanced magical power block using runes and mana crystals.                | Arcane machinery, city infrastructure.                                  | Research/Mage         | Final Game   |
| automation.arcane_furnace.advanced | Arcane Furnace            | Automation / Magic Machine     | Rare       | High-tier smelter integrating automation and mana logic.                   | Advanced alloys, magic components, settlements.                         | Research              | Final Game   |
| automation.rune_miner.basic        | Rune Miner                | Automation / Magic Machine     | Rare       | Magically enhanced miner for special ores and stable extraction.           | Mana deposits, dimension materials, magical nodes.                      | Research              | Final Game   |
| automation.golem_workstation.basic | Golem Workstation         | Automation / Labour            | Rare       | Command/workstation block for golem tasks.                                 | Hauling, mining, building, guarding, farming.                           | Golemancy Research    | Final Game   |
| automation.processor.farm          | Farm Processor            | Automation / Agriculture       | Uncommon   | Processes crops into food, seeds, or animal feed.                          | Village food chain, automation supply.                                  | Researched            | Alpha        |
| automation.plank_maker.basic       | Plank Maker               | Automation / Wood Processing   | Uncommon   | Machine version of sawmill for automated logs-to-planks chain.             | Builder supply, village projects, factory wood line.                    | Researched            | Alpha        |
| automation.assembler.arcane        | Arcane Assembler          | Automation / Magic Crafting    | Rare       | Automated station for complex machine and magic block recipes.             | Late machines, portals, mana devices.                                   | Research              | Final Game   |
| magic.crystal_block.mana           | Mana Crystal Block        | Magic / Resource Block         | Uncommon   | Compressed or grown mana crystal used for storage, light, and decoration.  | Mana fuel, trade, mage buildings, conduits.                             | Crafted/Generated     | Alpha        |
| magic.ritual_anchor.basic          | Ritual Anchor             | Magic / Ritual                 | Rare       | Multi-block ritual component used for large spells and portals.            | Dimensions, wards, story gates, village rituals.                        | Research              | Final Game   |
| magic.portal_frame.ancient         | Ancient Portal Frame      | Magic / Portal                 | Epic       | Generated or repaired portal block tied to old civilisations.              | Dimensions, ruins, race stories.                                        | Generated/Repaired    | Final Game   |
| magic.corruption.ground            | Corrupted Ground          | Magic / Corruption             | Uncommon   | Dark spreading terrain affected by forbidden magic or realm influence.     | Hazard, cleansing quests, evil path, world risk.                        | Event/Generated       | Final Game   |
| magic.trap.rune                    | Rune Trap                 | Defence / Magic Trap           | Uncommon   | Hidden or visible magical trap block triggered by enemies.                 | Village defence, dungeons, player traps.                                | Rune Table            | Alpha        |
| magic.turret.spell_basic           | Spell Turret              | Defence / Magic Machine        | Rare       | Automated magical defence block requiring mana.                            | Settlement defence, raids, mana networks.                               | Research              | Final Game   |
| magic.pillar.enchantment           | Enchantment Pillar        | Magic / Structure              | Rare       | Structure component that improves enchanting or ritual stability.          | Magic rooms, schools, high-tier crafting.                               | Research              | Final Game   |
| magic.obelisk.ward                 | Ward Obelisk              | Magic / Village Defence        | Rare       | Large ward block protecting an area or settlement.                         | City defence, anti-corruption, raid mitigation.                         | Research/Village      | Final Game   |
| village.blueprint_marker.basic     | Blueprint Marker          | Village / Construction         | Common     | Defines planned construction area and resource requirements.               | NPC building, player settlement planning.                               | Crafted/Tool          | Alpha        |
| village.scaffold.wood              | Scaffold Block            | Village / Construction         | Common     | Temporary climbable construction block used by players and NPCs.           | Building stages, repair visuals, safe construction.                     | Crafted               | Alpha        |
| village.supply_crate.construction  | Construction Supply Crate | Village / Construction Storage | Common     | Stores exact project materials near a build site.                          | NPC construction, player delivery, automation import later.             | Project               | Alpha        |
| village.job_marker.basic           | Job-Site Marker           | Village / NPC Logic            | Common     | Assigns functional work locations for NPCs.                                | Builders, farmers, guards, merchants, specialists.                      | Crafted/Project       | Alpha        |
| village.repair_marker.basic        | Repair Marker             | Village / Repair               | Common     | Defines repair project and needed materials after damage.                  | Raid recovery, NPC repair, player help.                                 | Project               | Alpha        |
| village.market_stall.basic         | Market Stall              | Village / Trade                | Common     | Trade-facing block for merchants and village economy.                      | NPC trading, stock display, reputation.                                 | Village Project       | Alpha        |
| village.bell.alarm                 | Village Alarm Bell        | Defence / Alert                | Common     | Rings during raids or danger to trigger NPC response.                      | Raid warnings, guard response, evacuation.                              | Crafted/Project       | Alpha        |
| village.shrine.basic               | Village Shrine            | Village / Culture Magic        | Uncommon   | Culture or faith block tied to morale, rituals, and story.                 | Village identity, buffs, magic, quests.                                 | Village Project       | Alpha        |
| defence.wall.stone                 | Stone Defensive Wall      | Defence / Wall                 | Common     | Durable wall block for villages and player bases.                          | Raid pathing, siege resistance, boundaries.                             | Crafted/Project       | Alpha        |
| defence.gate.iron                  | Iron Gate                 | Defence / Gate                 | Uncommon   | Stronger gate with better raid resistance.                                 | Fortified villages, guard logic, iron progression.                      | Crafted/Project       | Alpha        |
| defence.barricade.wood             | Wooden Barricade          | Defence / Temporary            | Common     | Quick defensive obstacle block.                                            | Emergency raids, roads, siege staging.                                  | Crafted               | Alpha        |
| hazard.lava.flowing                | Lava / Magma              | Fluid / Hazard                 | Uncommon   | Damaging hot fluid block in volcanic areas and deep caves.                 | Danger, smelting fantasy, obsidian-like blocks later.                   | Generated             | Alpha        |
| hazard.sludge.poison               | Poison Sludge             | Fluid / Hazard                 | Uncommon   | Damaging swamp or corruption fluid.                                        | Alchemy, hazards, monsters, cleansing.                                  | Generated/Event       | Final Game   |
| hazard.vine.thorn                  | Thorn Vine                | Hazard / Plant                 | Common     | Damaging plant block that can block paths.                                 | Forests, traps, nature magic, farming hazards.                          | Generated             | Alpha        |
| hazard.ground.cursed               | Cursed Ground             | Hazard / Magic                 | Uncommon   | Dangerous ground created by dark magic or dimensional influence.           | Corruption, forbidden magic, cleansing quests.                          | Event/Generated       | Final Game   |
| hazard.quicksand.basic             | Quicksand                 | Terrain / Hazard               | Uncommon   | Loose sinking terrain in deserts or swamps.                                | Travel risk, traps, biome identity.                                     | Generated             | Alpha        |
| hazard.snow_layer                  | Snow Layer                | Weather / Terrain              | Common     | Accumulated snow layer from weather.                                       | Cold biomes, weather feedback, path clearing.                           | Weather               | Alpha        |
| fluid.mana.arcane                  | Arcane Mana Fluid         | Fluid / Magic                  | Rare       | Liquid magical essence for rituals, machines, and realm pools.             | Mana machines, magic crafting, dimension hazards.                       | Generated/Research    | Final Game   |
| hazard.steam_vent.basic            | Steam Vent                | Hazard / Gas                   | Uncommon   | Non-solid vent emitting steam, pressure, or heat.                          | Machines, caves, traps, hot biomes.                                     | Generated             | Alpha        |
| realm.voidstone.basic              | Voidstone                 | Dimension / Terrain            | Rare       | Dark realm stone used for portals and dimensional machines.                | Portals, void tools, endgame automation.                                | Dimension             | Final Game   |
| realm.celestial_stone.basic        | Celestial Stone           | Dimension / Terrain            | Rare       | Bright realm stone tied to sky/celestial magic.                            | Floating structures, rituals, magic buildings.                          | Dimension             | Final Game   |
| realm.fae_grass.basic              | Fae Grass                 | Dimension / Terrain            | Rare       | Living magical grass from a fae or forest realm.                           | Nature magic, farming upgrades, village story.                          | Dimension             | Final Game   |
| realm.dream_glass.basic            | Dream Glass               | Dimension / Construction       | Epic       | Strange transparent block from dream realms.                               | Windows, portals, illusions, story structures.                          | Dimension             | Final Game   |
| realm.infernal_brick.basic         | Infernal Brick            | Dimension / Construction       | Rare       | Heat-resistant brick from infernal realms.                                 | Fireproof builds, high-tier furnaces, dark structures.                  | Dimension             | Final Game   |
| realm.deep_forge_stone.basic       | Deep Forge Stone          | Dimension / Stone              | Rare       | Ancient forge realm stone used for high-tier smithing structures.          | Dwarven-style arcs, mythic metals, endgame forge.                       | Dimension             | Final Game   |
| magic.portal.broken                | Broken Portal Block       | Dimension / Teaser             | Rare       | Damaged portal piece found in ruins before full dimension access.          | Lore, repair quests, realm teaser, research.                            | Generated             | Alpha        |
| magic.rift.unstable                | Unstable Rift Block       | Dimension / Teaser             | Epic       | Dangerous rift block that leaks realm effects.                             | World events, corruption, rare materials, dimension hook.               | Event/Generated       | Final Game   |
| ore.dimension.unknown              | Strange Realm Ore         | Dimension / Resource           | Epic       | Placeholder ore family for dimension-specific resources.                   | Machines, magic, village upgrades, boss gates.                          | Dimension             | Final Game   |

# 24. Sample Detailed Block Entries

These examples show how full registry entries should look when converted into a spreadsheet or implementation database. They include design-facing and technical-facing fields. Exact numeric values remain provisional.

| **Field**             | **Value**                                                                                              |
|-----------------------|--------------------------------------------------------------------------------------------------------|
| Block ID              | terrain.grass.basic                                                                                    |
| Display Name          | Grass Block                                                                                            |
| Category              | Terrain \> Soil                                                                                        |
| Material Family       | Dirt/Grass                                                                                             |
| Rarity                | Common                                                                                                 |
| Default Stack Size    | 100                                                                                                    |
| Shape/Model           | Full cube                                                                                              |
| Collision/Interaction | Solid                                                                                                  |
| Tool Required         | None; shovel improves speed                                                                            |
| Drops                 | Dirt block; seeds/grass fibre chance if harvested with sickle                                          |
| Unlock Method         | Start/Generated                                                                                        |
| Found/Generated In    | Surface biomes: plains, forest, village land                                                           |
| Crafting/Player Use   | Farming base, animal grazing, path conversion                                                          |
| Village/NPC Use       | Can be requested for landscaping only; not a major project resource                                    |
| Automation Use        | None direct                                                                                            |
| Magic Use             | None direct                                                                                            |
| Tags                  | grass, soil, surface, diggable, farming, village-land                                                  |
| Design Note           | Soft natural surface layer. Villages are built on this, paths cut through it, and crops begin near it. |

| **Field**             | **Value**                                                                       |
|-----------------------|---------------------------------------------------------------------------------|
| Block ID              | terrain.stone.basic                                                             |
| Display Name          | Stone Block                                                                     |
| Category              | Terrain \> Stone                                                                |
| Material Family       | Stone                                                                           |
| Rarity                | Common                                                                          |
| Default Stack Size    | 100                                                                             |
| Shape/Model           | Full cube                                                                       |
| Collision/Interaction | Solid                                                                           |
| Tool Required         | Pickaxe; hand break slow/no useful drop                                         |
| Drops                 | Cobblestone or stone, depending on tool/magic                                   |
| Unlock Method         | Start/Generated                                                                 |
| Found/Generated In    | Underground, cliffs, caves, mountains                                           |
| Crafting/Player Use   | Basic furnace, stone brick, walls, roads                                        |
| Village/NPC Use       | Major village project resource for walls, towers, repairs                       |
| Automation Use        | Can be mined manually or by basic/rune miner                                    |
| Magic Use             | Earth magic and mining pulse can crack/expose it                                |
| Tags                  | stone, terrain, mineable, pickaxe, village-use, construction                    |
| Design Note           | The default hard body of the world and the first serious construction material. |

| **Field**             | **Value**                                                                               |
|-----------------------|-----------------------------------------------------------------------------------------|
| Block ID              | ore.copper.basic                                                                        |
| Display Name          | Copper Ore                                                                              |
| Category              | Resource \> Ore                                                                         |
| Material Family       | Copper                                                                                  |
| Rarity                | Common                                                                                  |
| Default Stack Size    | 100                                                                                     |
| Shape/Model           | Full cube with ore texture                                                              |
| Collision/Interaction | Solid                                                                                   |
| Tool Required         | Stone pickaxe or better                                                                 |
| Drops                 | Raw copper ore plus stone fragments; rich variants may add by-products                  |
| Unlock Method         | Generated/Discovered                                                                    |
| Found/Generated In    | Shallow caves, hills, exposed veins, surface clues                                      |
| Crafting/Player Use   | Copper ingots, mechanisms, wires, early machines                                        |
| Village/NPC Use       | Requested by engineers and early mechanism projects                                     |
| Automation Use        | Basic miner can extract from copper deposits                                            |
| Magic Use             | Can conduct early mana/rune experiments after research                                  |
| Tags                  | ore, copper, mineable, pickaxe, automation, machine-part                                |
| Design Note           | The first technical ore; copper should mean machines and wiring, not just better tools. |

| **Field**             | **Value**                                                                                    |
|-----------------------|----------------------------------------------------------------------------------------------|
| Block ID              | ore.mana_crystal.basic                                                                       |
| Display Name          | Mana Crystal Ore                                                                             |
| Category              | Resource \> Magical Ore                                                                      |
| Material Family       | Mana Crystal                                                                                 |
| Rarity                | Uncommon                                                                                     |
| Default Stack Size    | 64                                                                                           |
| Shape/Model           | Ore/crystal cluster variant                                                                  |
| Collision/Interaction | Solid / Light-emitting                                                                       |
| Tool Required         | Iron pickaxe or magic-compatible tool preferred                                              |
| Drops                 | Mana crystal shards, occasional pure crystal, arcane dust by-product                         |
| Unlock Method         | Discovered through cave, ruin, mage, or research                                             |
| Found/Generated In    | Crystal caves, magical ruins, mana-dense deposits                                            |
| Crafting/Player Use   | Mana furnace, rune table, mana conduits, wards, magic fuel                                   |
| Village/NPC Use       | Requested by village mages, ward projects, rituals                                           |
| Automation Use        | Rune miner can stabilise extraction later                                                    |
| Magic Use             | Core early magic material and mana network starter                                           |
| Tags                  | ore, crystal, magic, mana, light, mineable, fuel                                             |
| Design Note           | The first block that tells the player magic is physical, useful, and part of infrastructure. |

| **Field**             | **Value**                                                                                    |
|-----------------------|----------------------------------------------------------------------------------------------|
| Block ID              | functional.workbench.basic                                                                   |
| Display Name          | Workbench                                                                                    |
| Category              | Functional \> Crafting                                                                       |
| Material Family       | Wood                                                                                         |
| Rarity                | Common                                                                                       |
| Default Stack Size    | 1                                                                                            |
| Shape/Model           | Detailed model / workstation                                                                 |
| Collision/Interaction | Solid / Interactive                                                                          |
| Tool Required         | Axe or hand                                                                                  |
| Drops                 | Workbench block                                                                              |
| Unlock Method         | Crafted from planks                                                                          |
| Found/Generated In    | Player crafted; may appear in village workshops                                              |
| Crafting/Player Use   | Starter crafting recipes, tools, basic construction pieces                                   |
| Village/NPC Use       | Used by NPC builders/carpenters if assigned                                                  |
| Automation Use        | No direct automation until upgraded or machine equivalent exists                             |
| Magic Use             | Can craft early rune components after discovery if recipe allows                             |
| Tags                  | crafting, station, interactive, wood, starter                                                |
| Design Note           | The first real crafting station and the start of the player turning raw blocks into systems. |

| **Field**             | **Value**                                                                                    |
|-----------------------|----------------------------------------------------------------------------------------------|
| Block ID              | functional.furnace.stone                                                                     |
| Display Name          | Stone Furnace                                                                                |
| Category              | Functional \> Smelting                                                                       |
| Material Family       | Stone                                                                                        |
| Rarity                | Common                                                                                       |
| Default Stack Size    | 1                                                                                            |
| Shape/Model           | Detailed model / station                                                                     |
| Collision/Interaction | Solid / Interactive / Heat source                                                            |
| Tool Required         | Pickaxe                                                                                      |
| Drops                 | Furnace block; may drop damaged furnace if broken badly                                      |
| Unlock Method         | Crafted from stone/cobble                                                                    |
| Found/Generated In    | Player crafted; village blacksmiths may have one                                             |
| Crafting/Player Use   | Smelts ore, cooks food, processes clay into bricks                                           |
| Village/NPC Use       | Village blacksmith, food prep, construction material production                              |
| Automation Use        | Can accept automation input/output if configured or upgraded                                 |
| Magic Use             | Fire magic can boost or replace fuel in later upgrades                                       |
| Tags                  | smelting, station, heat, fuel, automation-port                                               |
| Design Note           | The first resource transformation station, turning mining into tool and village progression. |

| **Field**             | **Value**                                                                                               |
|-----------------------|---------------------------------------------------------------------------------------------------------|
| Block ID              | village.warehouse.basic                                                                                 |
| Display Name          | Village Warehouse                                                                                       |
| Category              | Village \> Storage                                                                                      |
| Material Family       | Wood/Stone                                                                                              |
| Rarity                | Uncommon                                                                                                |
| Default Stack Size    | 1                                                                                                       |
| Shape/Model           | Large functional building block or core marker                                                          |
| Collision/Interaction | Solid / Interactive / Owned                                                                             |
| Tool Required         | Tool depends on material; protected by settings                                                         |
| Drops                 | Warehouse core block; may drop materials if broken depending on rules                                   |
| Unlock Method         | Village project or player settlement project                                                            |
| Found/Generated In    | Village centre, warehouse building, player-founded settlements                                          |
| Crafting/Player Use   | Resource requests, stock display, construction supply, delivery tasks                                   |
| Village/NPC Use       | NPCs withdraw exact project resources; ownership and reputation tracking apply                          |
| Automation Use        | Accepts direct input from transport blocks and import sides                                             |
| Magic Use             | Can link to wards, settlement rituals, mana logistics later                                             |
| Tags                  | storage, village, npc-use, owned, automation-input, project-core                                        |
| Design Note           | The main bridge between player resources, NPC labour, automation supply, and visible settlement growth. |

# 25. Balancing Rules

- Every important block should have at least one clear player-facing reason to exist.

- Common blocks can stay simple, but strategic blocks should connect to multiple systems where practical.

- Old materials should stay useful through construction, repairs, village needs, recipes, culture variants, and automation inputs.

- Functional blocks should unlock new behaviour, not only improve numbers.

- Ore progression should mix direct upgrades and unique material roles.

- Villages should consume exact project blocks by default so construction goals feel concrete.

- Automation blocks should physically exist and should visibly connect production to storage and villages.

- Magic blocks should feel like infrastructure: conduits, wards, rituals, portals, machines, and corruption should be visible in the world.

- POC blocks should prove systems, not provide final-game breadth.

- Block data should be spreadsheet-ready, but the design document should remain readable by humans.

# 26. Open Questions for Later Documents

| **Question**                                                                         | **Deferred To**                            |
|--------------------------------------------------------------------------------------|--------------------------------------------|
| Exact numeric hardness, mining speed, and tool tier values for every block.          | Technical implementation / balancing.      |
| Exact recipes for every craftable block and variant.                                 | 05 - Crafting and Recipe Registry.         |
| Detailed machine throughput, power draw, and inventory side behaviour.               | Automation System.                         |
| Detailed mana flow math, ward radius, ritual stability, and corruption spread rules. | Magic System and Dimensions.               |
| Exact NPC construction AI, blueprint parsing, pathfinding, and job assignment.       | NPC/Village Simulation.                    |
| Biome-specific generation rules, ore distributions, deposits, and surface clues.     | Biomes and World Generation.               |
| Culture-specific full block sets for every race.                                     | Races, Cultures, and Structures documents. |
| Dimension-specific block families and realm hazards.                                 | Dimensions and Realms Registry.            |
| Whether optional structural integrity becomes a future advanced world setting.       | Technical/World Settings document.         |

# Appendix A. POC Block Checklist

| **Group**         | **Blocks**                                                                   | **Status**               | **Reason**                                                       |
|-------------------|------------------------------------------------------------------------------|--------------------------|------------------------------------------------------------------|
| Terrain           | Grass, dirt, stone, sand, gravel, clay, water, mud                           | Required                 | Tests basic world, digging, terrain, water, and farming base.    |
| Natural           | Logs, leaves, planks, branch/stick, tall grass, bushes, crop, flowers        | Required                 | Tests wood chain, harvesting, crop blocks, village presentation. |
| Resources         | Coal, copper, iron, mana crystal, clay deposit, surface boulders             | Required                 | Tests fuel, tools, automation, magic, and surface gathering.     |
| Functional        | Workbench, furnace, mana furnace, chest, rune table                          | Required                 | Tests crafting, smelting, storage, and magic unlock.             |
| Village           | Village warehouse, guard post marker, blueprint/project anchor               | Required                 | Tests NPC resource consumption and construction.                 |
| Automation        | Basic mana miner, chute/transport, storage import to warehouse               | Required                 | Tests production chain and village supply.                       |
| Construction      | Planks, cobble, stone brick, beams, slabs, stairs, roof, door, fence, window | Required                 | Tests player shelter and village buildings.                      |
| Defence           | Watchtower core/set, palisade, gate, torch/lantern, spike trap               | Required                 | Tests raid outcome changes.                                      |
| Magic             | Mana ore, mana furnace, rune table, ward lantern, mana conduit               | Required                 | Tests magic as infrastructure.                                   |
| Decor             | Furniture, market details, basic village props                               | Optional but recommended | Supports cosy identity and readable NPC settlement.              |
| Advanced Machines | Splitters, filters, crushers, assemblers                                     | Deferred                 | Not needed to prove first POC loop.                              |
| Dimensions        | Broken portal/rift teaser only                                               | Optional teaser          | Shows future direction without full realm implementation.        |

# Appendix B. Block Category Matrix

| **Category** | **Primary Player Use**               | **NPC/Village Use**           | **Automation Use**         | **Magic Use**                    | **POC?**     |
|--------------|--------------------------------------|-------------------------------|----------------------------|----------------------------------|--------------|
| Terrain      | Mining, digging, building foundation | Building sites, roads, farms  | Resource source            | Realm/corruption/weather effects | Yes          |
| Natural      | Wood, food, fibre, decor             | Farming, lumber, homes        | Wood/farm chains           | Nature magic, alchemy            | Yes          |
| Resource/Ore | Mining and progression               | Village projects, trade       | Mining/smelting chains     | Mana materials, rituals          | Yes          |
| Construction | Building and decoration              | NPC blueprints, repairs       | Factory structures         | Runed blocks, wards              | Yes          |
| Functional   | Crafting and refining                | Specialist jobs               | Inputs/outputs if upgraded | Magic stations                   | Yes          |
| Storage      | Inventory management                 | Warehouse, stock, needs       | Buffers/import/export      | Linked storage later             | Yes          |
| Automation   | Scaling production                   | Supplying projects            | Core purpose               | Mana/rune upgrades               | Yes          |
| Magic        | Utility and infrastructure           | Wards, mages, rituals         | Mana-powered machines      | Core purpose                     | Yes          |
| Village      | Settlement planning                  | Core purpose                  | Warehouse import           | Shrines/wards                    | Yes          |
| Defence      | Protect base/village                 | Raid response                 | Automated defence later    | Wards/spell traps                | Yes          |
| Hazard       | Danger and challenge                 | Raid/world event consequences | Machine disruption         | Corruption/dark magic            | Some         |
| Fluid        | Water, lava, travel, hazards         | Irrigation, needs             | Pipes, pumps, water wheels | Mana fluid, rituals              | Water only   |
| Dimension    | Exploration rewards                  | Culture story upgrades        | Endgame machines           | Realm magic                      | Teasers only |

# Appendix C. Registry Field Template

| **Field**           | **Purpose**                                                        | **Requirement**      |
|---------------------|--------------------------------------------------------------------|----------------------|
| block_id            | Internal stable ID, e.g. terrain.stone.basic.                      | Required             |
| display_name        | Player-facing name.                                                | Required             |
| parent_id           | Parent/base block definition to inherit from.                      | Required             |
| category            | Primary registry category.                                         | Required             |
| subcategory         | Secondary grouping.                                                | Required             |
| material_family     | Stone, oak, copper, mana crystal, voidstone, etc.                  | Required             |
| tags                | Search, logic, system, tool, risk, generation tags.                | Required             |
| description         | Design description.                                                | Required             |
| lore_line           | Short flavour text.                                                | Required for v0.1    |
| rarity              | Common, Uncommon, Rare, Epic, Legendary.                           | Required             |
| default_stack_size  | Default 100 unless overridden.                                     | Required             |
| shape_type          | Cube, slab, stair, model, fluid, attachment, etc.                  | Required             |
| collision_type      | Solid, partial, none, fluid, climbable, hazard.                    | Required             |
| transparency        | Opaque, cutout, transparent, fluid, emissive.                      | Required             |
| light_emission      | Numeric or category value.                                         | Required             |
| rotation_states     | None, facing, full rotation, attached side.                        | Required             |
| placement_rules     | Surface/support/water/biome restrictions.                          | Required             |
| gravity_rules       | Static, falling, fluid, spreading, unsupported.                    | Required             |
| hardness            | Design category and later numeric value.                           | Required             |
| blast_resistance    | Design category and later numeric value.                           | Required             |
| flammability        | None/low/medium/high and spread setting.                           | Required             |
| tool_required       | Tool class and harvest tier.                                       | Required             |
| drops               | Simple drop reference; item details deferred.                      | Required             |
| found_generated_in  | Biomes, depths, structures, dimensions.                            | Required             |
| crafting_recipe_ref | Reference to Recipe Registry only.                                 | Optional/Ref         |
| unlock_method       | Start/discovered/crafted/researched/NPC/faction/dimension.         | Required             |
| npc_village_use     | Construction, storage, job, request, ownership.                    | Required if relevant |
| automation_use      | Input/output, transport, machine, power, storage.                  | Required if relevant |
| magic_use           | Mana, ritual, ward, portal, corruption, enchanting.                | Required if relevant |
| weather_risk_use    | Fire, rain, snow, storm, temperature, raid damage.                 | Required if relevant |
| technical_notes     | Implementation notes and edge cases.                               | Optional             |
| planning_scope      | POC, Alpha, Final Game, Placeholder, Deferred. Documentation only. | Planning only        |

# Appendix D. Future Block Family Backlog

| **Family Group**   | **Backlog Examples**                                                                                 |
|--------------------|------------------------------------------------------------------------------------------------------|
| Wood Families      | Oak, pine, birch, darkwood, living wood, fungal wood, emberwood, skywood.                            |
| Stone Families     | Stone, deepstone, limestone, basalt, granite, marble, slate, crystal stone, ancient stone.           |
| Metal Construction | Copper trim, bronze fitting, iron grating, steel beam, mythril frame, celestial alloy.               |
| Culture Sets       | Human, dwarven, elven, orc, goblin, beastfolk, fae, undead, machine-cult, original race sets.        |
| Magic Sets         | Mana crystal, rune stone, wardstone, ritual stone, portal frame, enchanted glass, corruption blocks. |
| Automation Sets    | Wooden chutes, belts, pipes, gears, shafts, sorters, power conduits, machine casings.                |
| Village Sets       | Warehouse, market, shrine, town board, school, guard post, barracks, farm, blacksmith, mage tower.   |
| Dimension Sets     | Fae realm, Deep Forge realm, Void realm, Dream realm, Infernal realm, Sky realm, Machine realm.      |
| Hazard Sets        | Lava, poison sludge, cursed ground, thorn vines, quicksand, slippery ice, mana storm residue.        |

# Appendix E. Cross-System Use Matrix

| **Block**         | **Primary Role**  | **Village Link**                       | **Automation Link**          | **Magic Link**                      | **Other Use**         |
|-------------------|-------------------|----------------------------------------|------------------------------|-------------------------------------|-----------------------|
| Stone Brick       | Construction      | Village watchtower, walls, repairs     | Crusher/stone chain later    | Rune-carved variant later           | Roads/walls trade     |
| Oak Planks        | Construction      | Homes, scaffolds, roofs, storage       | Plank maker output           | Living wood variant later           | Core village need     |
| Copper Ore        | Resource          | Engineer projects, mechanisms          | Miner -\> furnace -\> ingots | Conductive rune parts               | Trade good            |
| Iron Ore          | Resource          | Guards, weapons, watchtower fittings   | Miner -\> furnace -\> ingots | Enchanted iron later                | Major settlement need |
| Mana Crystal Ore  | Magic Resource    | Mage requests, ward projects           | Rune miner later             | Mana fuel, conduits, rituals        | High-value trade      |
| Village Warehouse | Village Block     | Core storage, requests, project supply | Direct automation input      | Linked storage/wards later          | Reputation/ownership  |
| Ward Lantern      | Magic Defence     | Improves village safety                | Consumes mana network input  | Ward radius and anti-monster effect | Village upgrade       |
| Water             | Fluid             | Irrigation, NPC needs                  | Water wheel, pump, pipes     | Water magic, rituals                | Farms/travel          |
| Road Path         | Construction/Road | NPC pathfinding, trade routes          | Cart routes later            | Runed roads later                   | Movement speed        |
| Broken Portal     | Dimension Teaser  | Race story and village ritual hook     | Portal logistics later       | Portal repair/research              | Exploration goal      |

# End of Document

This v0.1 Blocks Registry establishes the rules, data model, categories, POC scope, full-game category matrix, detailed starter registry, sample entries, and appendices required to move into the next content registries. Future revisions should convert this into a spreadsheet/database and then split final-game families into separate tables as the block count grows.
