**Fantasy Voxel Civilisation Sandbox**

**12 - Structures**

*Version 0.1 - Detailed Design Bible Draft*

A database-ready structure system for villages, roads, ruins, dungeons, camps, shrines, portals, ownership, dynamic states, blueprints, rewards, map discovery, worldgen placement, and proof-of-concept structure loops.

| **Field**                 | **Locked Direction**                                                                                                                                                                                                                                                                                     |
|---------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Document Scope**        | Full design-bible document covering structure identity, categories, procedural placement, POC structures, villages, roads, ruins, dungeons, camps, shrines, portals, faction ownership, rewards, damage states, blueprints, UI, world settings, data fields, registry entries, and POC success criteria. |
| **Core Philosophy**       | Structures are not scenery or loot boxes only. They are physical evidence of civilisation, history, danger, magic, culture, resource flow, faction control, and player consequence.                                                                                                                      |
| **POC Direction**         | Prove one village-adjacent valley with a forest hamlet, cave/mine, old rune ruin, goblin camp, trails/roads, bridge or crossing, village warehouse, and staged watchtower project that changes raid outcome.                                                                                             |
| **Data Direction**        | Use database/spreadsheet-ready IDs, categories, size tiers, biome rules, faction/culture tags, generation rules, states, rewards, ownership, NPC use, magic links, automation links, difficulty fields, simulation LOD, and planning status.                                                             |
| **Worldgen Direction**    | Structures use layered density: common minor POIs, medium structures, major landmarks, rare megastructures, dynamic camps, culture/faction structures, road networks, and progression-critical fallback generation.                                                                                      |
| **Dynamic Direction**     | Structures can be discovered, damaged, burned, corrupted, occupied, abandoned, repaired, restored, claimed, conquered, cleansed, warded, activated, or transformed by player, NPC, faction, creature, magic, and disaster systems.                                                                       |
| **Performance Direction** | Nearby structures use visible block states, NPC work, item movement, creatures, and construction stages. Distant dynamic structures use abstract ownership, danger, damage, supply, repair, and event summaries.                                                                                         |

# Document Purpose

This document defines how structures work across the Fantasy Voxel Civilisation Sandbox. It turns villages, ruins, camps, roads, bridges, shrines, dungeons, mines, portals, abandoned settlements, landmarks, and megastructures into a unified gameplay system instead of isolated worldgen decorations.

Structures are where many major systems become visible at once: blocks form the physical shell, items and recipes supply construction and repair, resources decide placement and value, NPCs live and work inside them, automation supplies them, magic powers and corrupts them, creatures threaten or occupy them, and biomes decide where they belong.

This document does not replace the NPC Village System, Biomes and World Generation document, Magic System, Creatures and Monsters document, Automation System, future Combat and Defence document, future Economy document, future Races/Cultures/Factions document, Dimensions document, or Player Settlement System. Instead, it defines the structure-facing rules those systems must support.

# Design Source

| **Source Document**               | **Relevant Direction**                                                                                                                 | **How This Structure Document Uses It**                                                                                                                                   |
|-----------------------------------|----------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 00 - Master Game Design Bible     | Locks the main hook: magic and factories build civilisations, unlock stories, power settlements, and reshape the world.                | Structures become the physical stage where civilisations, factories, magic, stories, danger, and world-state changes are seen.                                            |
| 01 - Core Gameplay Loop           | Primary loop: explore -\> gather -\> craft -\> build -\> interact -\> automate -\> defend -\> upgrade -\> expand.                      | Structures provide exploration goals, gathering clues, crafting unlocks, village interaction, automation endpoints, defence targets, and expansion routes.                |
| 02 - Player Progression System    | Progression is hybrid across tools, materials, skills, knowledge, magic, automation, villages, reputation, bosses, and dimensions.     | Structures unlock recipes, knowledge, reputation, roads, settlement stages, boss paths, and dimension access without becoming the only progression track.                 |
| 03 - Blocks Registry              | Blocks form terrain, buildings, machines, magic networks, villages, damage states, and world-state evidence.                           | Structures are built from tagged blocks, shape families, damaged states, repair scaffolds, warehouses, defence blocks, magic blocks, and culture material variants.       |
| 04 - Items Registry               | Items include resources, tools, trade goods, maps, keys, relics, trophies, lore, and quest-state objects.                              | Structure rewards include loot, maps, keys, lore items, relics, repair materials, culture goods, and construction supply objects.                                         |
| 05 - Crafting and Recipe Registry | Recipes include project recipes, station recipes, NPC/village builds, repairs, magic rituals, culture recipes, and dimension recipes.  | Village structures and restoration projects use ProjectRecipe entries with stages, reserved resources, build time, NPC jobs, and consequences.                            |
| 06 - Resource Progression         | Resources are survival supplies, machine parts, village needs, magic catalysts, strategic assets, and dimension keys.                  | Structure placement, construction, restoration, claims, trade value, and conflict can depend on nearby resources, exact stored materials, and strategic material access.  |
| 07 - NPC Village System           | Villages are living social and economic systems with named NPCs, jobs, warehouses, projects, repairs, raids, reputation, and memories. | A village is defined as both a structure cluster and a simulation state. Warehouses, homes, job sites, roads, defences, shrines, and growth projects are structure rules. |
| 08 - Automation System            | Automation supplies villages through miners, transport, furnaces, storage, warehouses, power, magic machines, and simulation LOD.      | Structures define machine sites, routes, bridges, warehouses, large deposits, power sites, and raidable logistics networks.                                               |
| 09 - Magic System                 | Magic is practical infrastructure using mana, runes, wards, conduits, rituals, shrines, portals, and forbidden consequences.           | Shrines, rune ruins, ward stones, ritual circles, mana conduits, portal frames, cursed sites, and magic-altered structures are first-class structure families.            |
| 10 - Creatures and Monsters       | Creatures affect villages, raids, camps, nests, spawns, magic, automation, drops, and world-state consequences.                        | Enemy camps, monster nests, occupied ruins, dungeon spawns, raid sources, and creature clues are structural gameplay anchors.                                             |
| 11 - Biomes and World Generation  | Worldgen places regions, biomes, resources, villages, roads, ruins, camps, leylines, corruption, landmarks, and dynamic state.         | Structure generation uses biome, culture, faction, road, water, terrain, resource, danger, leyline, and fallback progression rules.                                       |

# Static Table of Contents

- 1\. Locked Structure System Identity

- 2\. Player Answer Decision Summary

- 3\. Structure System Architecture

- 4\. Parent Structure Data Model

- 5\. Structure Categories, Families, and Tags

- 6\. Generation, Placement, Discovery, and Readability

- 7\. Proof-of-Concept Structure Scope

- 8\. Villages and Civilisation Structures

- 9\. Player Claimable and Restorable Structures

- 10\. Roads, Bridges, Routes, and Infrastructure

- 11\. Ruins and Ancient Structures

- 12\. Dungeons, Caves, Mines, and Underground Structures

- 13\. Enemy Camps, Faction Outposts, and Monster Nests

- 14\. Shrines, Ritual Sites, and Magic Structures

- 15\. Portals, Realm Gates, and Dimension Structures

- 16\. Factions, Culture, and Ownership

- 17\. Loot, Rewards, Knowledge, and Progression

- 18\. Destruction, Repair, Restoration, and Dynamic States

- 19\. Blueprints, Modular Pieces, and Material Variation

- 20\. UI, Map, Feedback, Difficulty, and World Settings

- 21\. Detailed Structure Registry v0.1

- 22\. Sample Detailed Structure Entries

- 23\. Core POC Scenario: Forest Hamlet Structure Loop

- 24\. Balancing Rules

- 25\. Open Questions for Later Documents

- Appendix A. POC Structure Checklist

- Appendix B. Structure Database Field Template

- Appendix C. Cross-System Use Matrix

- Appendix D. Future Structure Family Backlog

- Appendix E. POC Success Criteria

# 1. Locked Structure System Identity

The Structure System is the physical world-memory layer of the game. It includes small points of interest, villages, buildings, roads, bridges, shrines, ruins, dungeons, mines, camps, nests, outposts, portals, landmarks, megastructures, and player-claimed sites. Structures should make the world feel old, inhabited, dangerous, useful, damaged, repairable, and worth exploring.

| **Locked Rule**                                                                                                                                                                                                                                                     |
|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| A structure should never exist only as scenery. Every meaningful structure should answer at least one gameplay question: what does it reveal, supply, shelter, threaten, teach, unlock, protect, connect, corrupt, remember, or allow the player or NPCs to change? |

| **Identity Layer**      | **Design Meaning**                                                                                                                          | **Player-Facing Result**                                                                             |
|-------------------------|---------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------|
| Exploration Anchor      | Structures give players visible reasons to travel: roads, smoke, lights, silhouettes, ruins, caves, towers, bridges, and distant landmarks. | The player naturally follows curiosity instead of only following UI markers.                         |
| Civilisation Body       | Villages, warehouses, roads, workshops, farms, shrines, walls, markets, and gates make NPC society visible and functional.                  | Settlements feel like built places with needs, resources, jobs, history, and risks.                  |
| History and Lore        | Ruins, abandoned mines, old towers, collapsed roads, broken portals, graves, and ancient megastructures show past civilisations.            | The player learns the world through architecture, damage, books, puzzles, and recoverable knowledge. |
| Threat Source           | Camps, nests, occupied ruins, cursed shrines, dungeon entrances, and unstable portals create local pressure.                                | Raids, spawns, patrols, creature ecology, theft, and danger have visible sources.                    |
| Magic Infrastructure    | Shrines, wards, rune stones, conduits, ritual circles, mana wells, portals, and corrupted sites make magic physical.                        | Magic becomes buildable, damageable, repairable, discoverable, and socially meaningful.              |
| Progression Gateway     | Structures can unlock recipes, NPC teaching, maps, routes, materials, bosses, faction arcs, and dimensions.                                 | Exploration and settlement growth become progression paths.                                          |
| World-State Evidence    | Structures can be built, damaged, burned, abandoned, occupied, cleansed, repaired, restored, claimed, conquered, warded, or activated.      | The world visibly remembers what happened.                                                           |
| Data-Driven Scalability | Structures use parent classes, tags, blueprints, variants, states, generation rules, and simulation LOD.                                    | The registry can grow into a large final game without every site being a one-off.                    |

## 1.1 Structure Design Promise

A player should be able to read a structure before entering it. A goblin camp should show smoke, traps, scrap walls, stolen crates, patrols, and raid supplies. A shrine should show culture, faith, ward range, damage state, and mana flow. A ruin should show age, architecture, puzzle clues, and whether it is dormant, cursed, occupied, or worth restoring.

The system can be deep, but it must remain readable: silhouettes, material palettes, banners, lights, sounds, path networks, environmental clues, and UI labels should help players understand what a structure is and why it matters.

## 1.2 What Structures Are Not

- Structures are not only random loot rooms.

- Structures are not only visual decoration pasted onto terrain.

- Villages are not only structure templates; they are structure clusters plus simulation state.

- Dungeons are not only combat corridors; they should connect to culture, biome, enemies, loot, lore, bosses, or progression.

- Roads and bridges are not only decoration; they connect travel, trade, raids, patrols, faction control, and settlement growth.

- The POC does not need every final structure category, but it must prove that structures connect exploration, village growth, automation, magic, and threat.

# 2. Player Answer Decision Summary

The selected answers lock the deep interconnected structure model. Nearly every category chooses the version where structures connect worldgen, NPCs, automation, magic, factions, rewards, dynamic states, and player consequence. Question 31 is the main special case: claimed structures keep name, memory, NPC reactions, faction history, and possible bonuses rather than being only visual.

| **Area**                      | **Locked Decision**                                                                                                                                                                                                                    |
|-------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Core Identity**             | Structures support loot, lore, quests, faction infrastructure, world-state change, culture, progression, magic, automation, and NPC systems. Small structures can be simple; major structures should be dynamic and meaningful.        |
| **Categories**                | Use overlapping tags: civilised, hostile, ancient, magical, natural, dimensional, minor POI, medium structure, major landmark, megastructure, generated, dynamic, handcrafted, player-built, and NPC-built.                            |
| **POC Scope**                 | POC includes village, cave/mine, ruin, enemy camp, road/bridge or crossing, village warehouse, staged watchtower project, damaged/unfinished states, mana/rune hints, and a camp that drives raid pressure.                            |
| **Village Structures**        | Villages are both physical structure clusters and simulation states. Layouts use culture, terrain, roads, water, jobs, growth stage, storage, and defence. NPCs visibly build and repair important projects.                           |
| **Storage and Permissions**   | Warehouses are real structures consumed by NPC projects. Key buildings can hold inventories. Reputation and permissions control access, automation import, building, theft, and official project support.                              |
| **Claiming and Restoration**  | Players can claim abandoned structures, restore ruins, conquer hostile sites, convert camps, and reuse the same foundation as player settlement systems, with history and consequences preserved.                                      |
| **Roads and Bridges**         | Roads are a core civilisation layer for navigation, NPC travel, trade, raids, structure placement, settlement growth, and faction control. Bridges can be damaged, repaired, occupied, tolled, or strategically important.             |
| **Ruins and Ancient Sites**   | Ruins provide loot, lore, recipe clues, magic knowledge, puzzles, dimension hints, former civilisation evidence, and multiple states such as dormant, cursed, cleansed, restored, activated, or occupied.                              |
| **Dungeons and Underground**  | Use procedural modular dungeons plus handcrafted landmarks. Mines, caves, supports, nests, ruins, collapsed paths, hazards, machines, and depth progression are structure layers.                                                      |
| **Enemy Camps and Nests**     | Camps and nests are dynamic raid/spawn sources with supplies, patrols, theft, occupation, escalation, clearing consequences, non-combat solutions, and simulation LOD.                                                                 |
| **Magic Structures**          | Shrines, ritual sites, wards, portals, conduits, corrupted sites, and magical ruins are player-usable, culture-linked, mana-powered, stateful, and able to affect danger, villages, and progression.                                   |
| **Portals and Dimensions**    | Generated portals introduce realms while player-built portals expand late-game logistics. Dormant portal frames can appear early as clear teaser objects without full functionality.                                                   |
| **Factions and Ownership**    | Structures track faction/culture ownership. Ownership can change through conquest, trade, abandonment, restoration, claiming, donation, betrayal, or faction events. Culture-specific styles and wonders exist.                        |
| **Rewards and Progression**   | Structure rewards mix loot, resources, recipes, lore, NPCs, reputation, access, world-state changes, and key authored rewards with random secondary loot.                                                                              |
| **Damage and Dynamic State**  | Structures can be intact, damaged, ruined, burned, corrupted, abandoned, repaired, restored, occupied, claimed, cleansed, warded, or activated. NPC memories and world events respond to these states.                                 |
| **Blueprints and Generation** | Generated and NPC-built structures use hybrid blueprints: modular shells, block-level details, culture material swaps, engine-driven variation, and terrain validation/adaptation.                                                     |
| **Data and Simulation**       | Structure entries use full registry fields with IDs, tags, generation rules, variants, states, NPC use, magic, automation, loot, quests, ownership, and planning metadata. Dynamic structures use near/far simulation LOD.             |
| **Map, UI, and Settings**     | Structure discovery appears through proximity, scouting, NPC rumours, maps, magic, and settings. UI can show state, faction, danger, claim, and cleared/restored status. Density, damage, corruption, and difficulty are configurable. |

# 3. Structure System Architecture

The Structure System should be data-driven from the beginning. The player sees villages, bridges, ruins, shrines, dungeons, camps, roads, and landmarks. The game internally tracks structure definitions, placement rules, blueprint pieces, runtime state, ownership, rewards, spawns, quests, and simulation level of detail.

| **Layer**                 | **Purpose**                                             | **Examples**                                                                                                           |
|---------------------------|---------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------|
| Base Structure Definition | The parent record every structure inherits from.        | ID, display name, category, size tier, tags, biome rules, danger tier, rarity, and scope.                              |
| Generation Rule           | Defines where and how a structure can spawn.            | Biome, region, road, water, slope, cave depth, resource, faction, leyline, distance, and fallback rules.               |
| Blueprint/Layout Layer    | Defines the physical build form.                        | Block layout, modular pieces, anchor points, sockets, decoration rules, material substitutions, and variants.          |
| Placement Solver          | Adapts structures to terrain and world context.         | Foundations, stairs, bridges, tunnels, retaining walls, water crossing, road alignment, cave openings.                 |
| Runtime State             | Mutable state stored in save data.                      | Discovered, cleared, occupied, damaged, burned, corrupted, repaired, restored, claimed, warded, activated.             |
| Ownership/Faction Layer   | Tracks who controls or remembers the structure.         | Village, culture, faction, player, hostile camp, monster nest, abandoned, contested, protected, illegal.               |
| Encounter/Spawn Layer     | Connects structures to creatures and events.            | Camp patrols, nest pressure, dungeon rooms, raid sources, boss arenas, wildlife clues, spawn suppression.              |
| Reward/Knowledge Layer    | Controls loot, lore, unlocks, recipes, and quest state. | Chests, relics, books, recipe fragments, NPC teaching, ritual clues, maps, keys, reputation, access.                   |
| System Connection Layer   | Links structures to other game systems.                 | NPC jobs, warehouses, automation ports, magic networks, roads, block states, project recipes, raids.                   |
| Simulation LOD            | Controls near and distant behaviour.                    | Local block/NPC/creature detail near player; abstract daily danger, repair, occupation, and supply summaries far away. |
| Planning Metadata         | Documentation-only project tracking.                    | POC Required, Alpha, Beta, Final Game, Placeholder, Deferred, balance draft notes.                                     |

| **Important Data Rule**                                                                                                                                                                             |
|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| POC status, Alpha/Beta/Final status, and balance-draft comments are planning metadata. Shipped structure data should remain clean, reusable, moddable, and independent of project planning columns. |

# 4. Parent Structure Data Model

| **Parent Class**         | **Inherits / Controls**                                                                                                        | **Example Children**                                                      |
|--------------------------|--------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------|
| BaseStructure            | Core identity, category, size tier, tags, generation restrictions, danger, rarity, visible name, map rules, base reward hooks. | All structures.                                                           |
| MinorPOIStructure        | Small footprint, low complexity, environmental clue, small reward, optional event hook.                                        | Fallen cart, old grave, broken well, hunter camp, tiny shrine.            |
| VillageClusterStructure  | Settlement centre, district anchors, building sockets, road graph, warehouse link, growth stage, culture style.                | Forest hamlet, dwarven hold, river village, fortified village.            |
| VillageBuildingStructure | Job-site rules, NPC use, inventory type, project role, ownership, repair state.                                                | Warehouse, blacksmith, farm barn, guard tower, mage hut.                  |
| RoadNetworkStructure     | Path graph, travel speed, safety rating, upgrade tier, faction control, trade route support.                                   | Dirt trail, gravel road, stone road, warded road.                         |
| BridgeStructure          | Span rules, water/ravine crossing, strategic control, damage state, route dependency.                                          | Wood bridge, stone bridge, dwarven viaduct, toll bridge.                  |
| RuinStructure            | Ancient/culture origin, puzzle state, knowledge rewards, restoration path, dimension link, damage state.                       | Old rune tower, collapsed temple, buried archive.                         |
| DungeonStructure         | Room graph, encounter tables, boss locks, puzzle locks, loot tiers, reset/respawn rules.                                       | Crypt, spider den, ancient vault, fortress dungeon.                       |
| CaveMineStructure        | Entrance, depth band, supports, hazards, ore nodes, abandoned tools, cave creatures, mine rails.                               | Abandoned copper mine, crystal cave, collapsed iron shaft.                |
| CampOutpostStructure     | Hostile faction ownership, supply inventory, patrols, raid pressure, escalation, clearing/claiming rules.                      | Goblin camp, bandit watchpost, orc siege camp.                            |
| NestStructure            | Creature ecology, spawn pressure, spreading threat, harvestable materials, destruction/relocation rules.                       | Spider nest, crystal crawler clutch, corruption mound.                    |
| ShrineRitualStructure    | Culture/faith, blessing, ward support, ritual sockets, mana source, cleansing/corruption state.                                | Roadside shrine, ancestor shrine, ward circle, moon ritual site.          |
| PortalGateStructure      | Dormant/active states, realm target, stabilisation requirements, danger warnings, logistics permissions.                       | Dormant portal frame, ruined gate, player-built portal anchor.            |
| Megastructure            | Region-scale identity, landmark silhouette, phased access, boss/story hook, unique materials, high worldgen rarity.            | Sky fortress, ancient machine city, dragon-bone bridge, giant mana spire. |
| ClaimableStructure       | Repair requirements, claim permissions, owner transition, history memory, conversion options.                                  | Abandoned tower, cleared camp, restored ruin, old village hall.           |

# 5. Structure Categories, Families, and Tags

Structures should be organised through multiple overlapping labels rather than one rigid category. A single structure may be a minor POI, ancient, magical, forest-biome, faction-neutral, claimable, puzzle-bearing, and POC-required all at once.

| **Category**             | **Purpose**                                                                                                | **Examples**                                                                     |
|--------------------------|------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------|
| Minor Points of Interest | Small discoveries that create texture, clues, loot, or tiny events.                                        | Fallen cart, ruined hut, hunter camp, broken well, old grave, roadside sign.     |
| Civilised Structures     | NPC or player-facing infrastructure for settlements, routes, trade, storage, work, and defence.            | Village, warehouse, farm, market, wall, gate, road, bridge, watchtower.          |
| Hostile Structures       | Enemy-owned or creature-owned sites that create danger, raids, patrols, theft, nests, and escalation.      | Goblin camp, bandit fort, monster nest, occupied tower, raider outpost.          |
| Ancient Structures       | Ruins and old architecture that reveal history, recipes, magic, puzzles, and restoration paths.            | Rune tower, buried archive, collapsed temple, ancient road, old portal frame.    |
| Magical Structures       | Sites that hold or manipulate mana, wards, rituals, shrines, spirits, corruption, and portals.             | Ward stone, shrine, leyline well, ritual circle, corrupted altar, portal gate.   |
| Naturalised Structures   | Non-civilised structure-like sites created by terrain, ecology, creatures, or old environmental processes. | Giant hollow tree, crystal grove, spider den, bone field, beaver-like dam.       |
| Dungeon Structures       | Explorable challenge spaces with rooms, enemies, hazards, puzzles, rewards, and state persistence.         | Crypt, mine dungeon, cave vault, fortress basement, cult lair.                   |
| Dimensional Structures   | Realm-linked structures that unlock, stabilise, leak, or respond to dimension systems.                     | Fae gate, dream mirror, void rift frame, infernal seal, celestial anchor.        |
| Major Landmarks          | Region-defining silhouettes and navigation anchors.                                                        | Mage spire, giant tree city, broken colossus, sky island ruin.                   |
| Megastructures           | Rare or unique massive structures that define late-game regions or world arcs.                             | Ancient machine city, dragon-bone bridge, ruined sky fortress, giant mana spire. |

## 5.1 Core Tags

- Size: tiny, small, medium, large, landmark, megastructure.

- Origin: natural, village, culture, faction, ancient, magical, dimensional, player, hostile, creature.

- Biome: meadow, forest, swamp, mountain, cave, river, desert, snow, corrupted, magical, realm-specific.

- Danger: safe, low, moderate, high, extreme, boss, variable.

- State: intact, damaged, ruined, burned, corrupted, abandoned, occupied, repaired, restored, claimed, cleansed, warded, activated.

- Systems: NPC, warehouse, road, automation, magic, combat, stealth, puzzle, recipe unlock, trade, raid source, quest, dimension, boss.

- Planning: POC Required, Alpha, Beta, Final Game, Placeholder, Deferred.

## 5.2 Size Tiers

| **Size Tier**    | **Scale Meaning**                                           | **Examples**                                            |
|------------------|-------------------------------------------------------------|---------------------------------------------------------|
| Tiny POI         | 1-8 blocks or small decoration cluster.                     | Grave marker, small shrine, signpost, abandoned crate.  |
| Small POI        | A small usable site, often one room or one outdoor feature. | Hunter camp, ruined hut, broken well, campfire site.    |
| Medium Structure | Multiple rooms or functional elements.                      | Watchtower, mine entrance, shrine, bridge, goblin camp. |
| Large Structure  | Major multi-zone location or settlement cluster.            | Village, dungeon, bandit fort, temple ruin.             |
| Landmark         | Visible regional identity structure.                        | Mage tower, colossal tree, old fortress, mana spire.    |
| Megastructure    | Massive rare late-game or story-scale location.             | Ancient machine city, sky fortress, dragon-bone bridge. |

# 6. Generation, Placement, Discovery, and Readability

Structure generation should feel authored even when procedural. The system should use modular blueprints, culture palettes, biome rules, road graphs, terrain validation, and dynamic state selection rather than dropping the same structure anywhere.

## 6.1 Placement Rules

- Major structures validate terrain, slope, water, cave depth, road access, resources, biome tags, danger level, faction territory, and magic density before spawning.

- Structures can adapt with foundations, stilts, retaining walls, stairs, tunnels, bridges, ramps, docks, and road approaches instead of requiring perfectly flat terrain.

- Village structures use terrain, water, resources, roads, jobs, culture, and growth stage to decide layout.

- Hostile camps prefer believable positions such as road choke points, ruined towers, cave mouths, ridge lines, forest clearings, or abandoned sites.

- Progression-critical structures have fallback placement so key recipes, bosses, portals, or story gates are not lost to bad random generation.

## 6.2 Discovery Rules

| **Clue Type** | **Examples**                                                                                             | **Purpose**                                         |
|---------------|----------------------------------------------------------------------------------------------------------|-----------------------------------------------------|
| Visual Clues  | Silhouettes, smoke, lights, banners, unusual trees, stonework, ruins, bridges, roads, and magical glows. | Encourages natural exploration.                     |
| Sound Clues   | Hammering, chanting, horns, cave echoes, water wheels, monsters, bells, crackling portals.               | Warns or attracts the player before contact.        |
| Terrain Clues | Roads, paths, clearings, scorched ground, collapsed cliffs, tracks, broken fences, cave mouths.          | Makes structures feel embedded in the world.        |
| NPC Clues     | Rumours, request boards, scouts, merchants, maps, warnings, quest lines, village event history.          | Connects structures to civilisation.                |
| Magic Clues   | Mana particles, compass reactions, survey lens readings, rune echoes, ward pulses, dream visions.        | Supports magical discovery tools.                   |
| Map Discovery | Structures appear when discovered, scouted, bought from NPCs, revealed by magic, or recorded by maps.    | Gives adjustable guidance without removing mystery. |

# 7. Proof-of-Concept Structure Scope

The POC must prove the structure system through a compact valley rather than a huge generated world. The test must show that structures are connected: a village has a warehouse and watchtower project, the ruin teaches mana/rune clues, the cave provides resources, the road guides navigation, the camp creates raid pressure, and the watchtower changes the raid outcome.

| **POC Structure**        | **Role**                                       | **Implementation Notes**                                                                                                                                                 |
|--------------------------|------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Forest Hamlet            | Main NPC settlement and civilisation anchor.   | Contains elder, builder, farmer, guard, merchant, mage, miner/lumberjack support, homes, shared warehouse, request board, farms, and damaged/unfinished building states. |
| Village Warehouse        | Physical storage and project supply interface. | Accepts player deliveries and later automation input after trust/permission. Reserves resources for the watchtower.                                                      |
| Watchtower Project       | Main staged construction proof.                | Starts unfinished/damaged, requires wood, stone, iron components, and maybe mana ward support. Changes goblin raid outcome.                                              |
| Cave/Mine Entrance       | Resource and danger site.                      | Contains stone, copper, iron, mana hints, cave creature pressure, and simple underground structure pieces.                                                               |
| Old Rune Ruin            | Magic discovery site.                          | Provides mana crystal discovery, old rune note, ward clue, dormant portal teaser, and maybe a simple puzzle/inspection object.                                           |
| Goblin Scavenger Camp    | Raid source and hostile dynamic structure.     | Sends scouts, stores stolen goods, grows if ignored, and triggers/strengthens the POC raid.                                                                              |
| Trail/Road Network       | Navigation and civilisation infrastructure.    | Connects spawn, village, cave, ruin, and camp through partial roads/trails without removing exploration.                                                                 |
| Bridge or River Crossing | Route structure and repair teaser.             | Shows infrastructure damage/repair potential and gives a future route-control hook.                                                                                      |

## 7.1 POC Structure Success Criteria

1.  The player can visually identify the village, road, cave, ruin, and enemy camp without relying only on UI markers.

2.  The village warehouse stores real delivered resources and reserves them for the watchtower project.

3.  NPC builders visibly progress the watchtower through stages rather than instantly spawning it.

4.  The old rune ruin provides a clear magic discovery path toward mana, rune crafting, ward support, or portal foreshadowing.

5.  The goblin camp creates visible pressure through scouts, stolen goods, patrols, or raid preparation.

6.  The completed or upgraded watchtower changes the raid outcome in a visible way: fewer deaths, less damage, stronger guards, better warnings, or higher reputation.

# 8. Villages and Civilisation Structures

A village is both a structure cluster and a simulation state. The Structures document defines physical layout, building roles, roads, districts, warehouses, project sites, damage states, and claim boundaries. The NPC Village System defines people, needs, jobs, schedules, memories, reputation, and social simulation.

## 8.1 Village Layout Rules

- Village placement uses culture, terrain, water, resources, roads, danger, magic level, faction territory, wealth, and history.

- The centre should be culture-specific: hearth, elder hall, warehouse, shrine, longhouse, town square, mage stone, clan hall, or market tree.

- Larger settlements can form districts: housing, farms, market, industry, defence, sacred/magic, storage, and roads.

- Districts should affect jobs, storage, pathing, quests, growth, and visual identity rather than being visual only.

- Villages can include damaged, burned, abandoned, repaired, upgraded, or culture-swapped variants to show history.

| **Structure**      | **Gameplay Role**                                                                                               | **Scope**          |
|--------------------|-----------------------------------------------------------------------------------------------------------------|--------------------|
| Village Centre     | Leadership, announcements, reputation, request board anchor, local history.                                     | POC Required       |
| Shared Warehouse   | Stores food, construction, fuel, tools, guard supply, magic stock, trade goods, and reserved project resources. | POC Required       |
| Homes              | NPC beds, households, morale, family identity, population capacity.                                             | POC Required       |
| Farm Plots/Barn    | Food production, livestock/fantasy animal hooks, village food stability.                                        | POC Required/Alpha |
| Guard Post         | Defence, patrol routes, raid response, guard equipment storage.                                                 | POC Required       |
| Watchtower         | Early defence project, warning range, archer/guard advantage, visible growth.                                   | POC Required       |
| Blacksmith         | Tool repair, guard equipment, metal recipes, construction parts.                                                | Alpha              |
| Mage Hut or Shrine | Rune teaching, ward support, mana requests, magical law/reputation hooks.                                       | POC/Alpha          |
| Market Stall       | Trade, culture goods, supply/demand visibility, reputation pricing.                                             | Alpha              |
| Road Gate/Wall     | Settlement boundary, raid defence, permissions, guard posts.                                                    | Alpha              |

## 8.2 Construction, Repair, and Permissions

NPCs should physically build important projects over time using staged blueprints, scaffolds, supply crates, and visible construction states. Far-away projects can use abstract progress ticks. Villages repair damaged structures if they have builders, tools, and resources, with difficulty/world settings controlling harshness.

Village ownership and permissions matter. Players can break/use freely in permissive worlds, but the default design should support reputation-based access, theft consequences, protected areas, warehouse import permissions, official blueprint acceptance, and future law systems.

# 9. Player Claimable and Restorable Structures

Abandoned structures should be opportunities, not just ruins. The player can eventually claim abandoned houses, towers, outposts, mines, shrines, ruins, and hostile camps after clearing, repairing, cleansing, or earning legal/faction permission.

| **Claim Step**     | **Meaning**                                                                                                                       |
|--------------------|-----------------------------------------------------------------------------------------------------------------------------------|
| Discover           | The player finds an abandoned, ruined, hostile, or ownerless site.                                                                |
| Secure             | Threats are cleared, negotiated with, scared off, or contained.                                                                   |
| Inspect            | The player identifies damage, ownership, curse/corruption, missing blocks, and restoration potential.                             |
| Resolve Claim      | Claiming may require repair, cleansing, reputation, payment, faction permission, conquest, or settlement law.                     |
| Restore or Convert | The site becomes a base, shrine, outpost, warehouse, portal anchor, village district, player settlement structure, or trade post. |
| Remember History   | The structure keeps memory such as Restored Goblin Watchtower, Cleansed Rune Shrine, or Reclaimed Old Mine.                       |

## 9.1 Conquest and Conversion

Hostile camps and faction outposts can be cleared, claimed, repaired, and converted, but this should create consequences. A conquered camp may reduce local raid pressure, anger the owning faction, attract retaliation, create refugees, open a trade route, or become a player outpost. Non-combat paths such as sabotage, bargaining, intimidation, bribery, diplomacy, or redirecting enemies should exist where the faction logic supports it.

# 10. Roads, Bridges, Routes, and Infrastructure

Roads are a core civilisation layer, not simple ground textures. They shape exploration, NPC travel, trade, raids, caravans, patrols, village growth, structure placement, faction borders, and player automation routes. Roads also help players read the world.

| **Route Type**      | **Progression Role**                                                   | **Gameplay Effect**                                                     |
|---------------------|------------------------------------------------------------------------|-------------------------------------------------------------------------|
| Foot Trail          | Earliest route, often generated by wildlife, villagers, or old travel. | Low speed, subtle navigation, can lead to POIs.                         |
| Dirt Road           | Basic village route.                                                   | NPC pathing, cart access, road signs, basic trade.                      |
| Gravel Road         | Improved settlement or regional route.                                 | Higher safety, better carts, more trade traffic.                        |
| Stone Road          | Established town/city infrastructure.                                  | Trade reliability, patrol support, culture style, better map clarity.   |
| Warded Road         | Magic-supported road segment.                                          | Suppresses magical/corruption threats, requires mana or shrine network. |
| Rail/Minecart Route | Industrial or mining route.                                            | Bulk transport, resource supply, high strategic value.                  |
| Portal Route        | Late-game logistics route.                                             | High cost, high risk, permission rules, dimensional infrastructure.     |

## 10.1 Bridge Rules

Bridges should be important because water, ravines, cliffs, and swamp gaps matter to travel and trade. Bridges can be decorative in simple cases, but major bridges can be damaged, repaired, occupied, tolled, guarded, sabotaged, cursed, or turned into conflict points. Control of a bridge can affect local economy and war.

# 11. Ruins and Ancient Structures

Ruins are the main structure family for history, recipes, magic clues, puzzles, restoration, and dimension foreshadowing. They should not always explain themselves immediately. Architecture, block palette, damage pattern, symbols, traps, and loot should reveal fragments of former cultures.

| **Ruin Family**      | **Primary Role**                                                                | **Scope**    |
|----------------------|---------------------------------------------------------------------------------|--------------|
| Old Rune Ruin        | Early magic discovery, rune note, mana clue, simple puzzle, ward/portal teaser. | POC Required |
| Collapsed Watchtower | Repair/claim opportunity, bandit or goblin occupation hook, regional lookout.   | Alpha        |
| Buried Archive       | Knowledge books, recipe fragments, culture lore, scholar NPC interest.          | Alpha/Beta   |
| Ancient Road Segment | Lost route, old faction history, hidden travel shortcut, restoration project.   | Alpha        |
| Broken Temple        | Shrine restoration, spirit/divine magic, corruption or blessing state.          | Beta         |
| Ruined Portal Hall   | Dimension lore, dormant portal frame, boss key/research gate.                   | Beta/Final   |
| Fallen Machine Works | Automation archaeology, old components, machine blueprints, instability risk.   | Beta/Final   |

## 11.1 Ruin States

- Dormant: inactive, quiet, safely inspectable, may need power or knowledge.

- Damaged: missing blocks, rubble, broken puzzle pieces, repair potential.

- Cursed/Corrupted: spawns danger, affects blocks/creatures, requires cleansing or careful containment.

- Occupied: controlled by goblins, bandits, undead, cultists, creatures, or faction scouts.

- Cleansed: danger removed and magic stabilised, often unlocking reputation or blessings.

- Restored: usable as base, shrine, tower, portal anchor, or village district.

- Activated: functional magic/portal/ward/mechanism state with ongoing costs or risks.

# 12. Dungeons, Caves, Mines, and Underground Structures

Natural caves become structure content when they contain ruins, nests, camps, supports, mineworks, hazards, doors, rooms, ritual sites, or faction evidence. Abandoned mines should be common enough to support exploration and resource history, but their density depends on biome, culture, resource richness, and region history.

| **Underground Structure** | **Role**                                                                             | **Scope**    |
|---------------------------|--------------------------------------------------------------------------------------|--------------|
| Shallow Cave              | Early resources, basic danger, natural routes, simple darkness threats.              | POC Required |
| Abandoned Mine            | Supports, carts, storage, old notes, ore clues, collapsed paths, cave creatures.     | POC/Alpha    |
| Crystal Pocket            | Mana hints, wisp/crystal crawler spawns, purity variation, magic clue.               | POC Required |
| Deep Mineworks            | Steel/advanced resources, machine remnants, stronger threats, environmental hazards. | Beta         |
| Dungeon Crypt             | Undead, traps, relics, divine/spirit hooks, boss or mini-boss.                       | Beta         |
| Ancient Underground City  | Culture story, underground faction, large resource economy, megastructure scale.     | Final        |

## 12.1 Reset and Respawn Rules

Major loot, bosses, quest state, puzzles, and structural changes should not reset by default. Minor creatures may respawn if nests, corruption, faction pressure, or dungeon ecology remain. Cleared dungeons stay remembered, but new occupation or corruption can return through world events or difficulty settings.

# 13. Enemy Camps, Faction Outposts, and Monster Nests

Enemy camps and monster nests provide visible sources of threat. They should not be invisible spawn logic only. Players should be able to scout a camp, see supplies, infer raid preparation, identify patrol routes, steal or sabotage resources, negotiate when possible, or clear and claim the site.

| **Camp/Nest State** | **Meaning**                                                         | **Gameplay Result**                                                  |
|---------------------|---------------------------------------------------------------------|----------------------------------------------------------------------|
| Hidden              | Small, low-pressure site not yet discovered.                        | Scouts, tracks, smoke, missing livestock, rumours.                   |
| Active              | Normal camp/nest with patrols and supplies.                         | Raids, theft, spawns, loot, local danger.                            |
| Preparing Raid      | Visible escalation state.                                           | Horns, cages, stolen goods, siege piles, scouts, village warnings.   |
| Strengthened        | Ignored or supplied camp becomes tougher.                           | Better gear, more enemies, traps, stronger raid captain.             |
| Defeated            | Leader killed or supplies destroyed.                                | Reduced local pressure, loot, reputation, possible retaliation.      |
| Occupied Structure  | Hostiles take over ruin, tower, mine, bridge, or abandoned village. | Changes loot, spawns, map state, and quest options.                  |
| Claimed/Converted   | Player or village takes over after clearing.                        | Outpost, repair project, trade post, guard tower, warehouse, shrine. |

## 13.1 Supply Inventories and Raid Pressure

Humanoid camps should have supply inventories: food, weapons, stolen goods, scrap, fuel, prisoners, maps, or ritual components. Supplies can affect camp strength and raid size. Raiders may steal from villages, caravans, roads, exposed storage, player bases, or warehouses if undefended. Clearing a camp should reduce local raid pressure, but new camps may form later from broader faction pressure.

# 14. Shrines, Ritual Sites, and Magic Structures

Magic structures make the magic system visible in the world. Shrines can heal, bless, cleanse, ward, teach, unlock reputation, or tie to culture. Ritual sites can change weather, cleanse corruption, open portals, stabilise machines, summon threats, or alter world state. These effects require clear costs, risks, and readable warnings.

| **Magic Structure** | **Role**                                                                            | **Scope**          |
|---------------------|-------------------------------------------------------------------------------------|--------------------|
| Roadside Shrine     | Small culture site, blessing, map clue, minor rest or morale effect.                | Alpha              |
| Village Shrine      | Culture identity, festival hook, spirit/divine magic, morale, ward anchor.          | Alpha/Beta         |
| Ward Stone/Lantern  | Protects roads, homes, warehouses, crops, or gates from basic magical threats.      | POC Required/Alpha |
| Rune Circle         | Ritual socket, school teaching, puzzle mechanic, craft/repair gate.                 | POC/Alpha          |
| Mana Well           | Mana source or high purity clue, potential corruption/spawn risk.                   | Beta               |
| Corrupted Altar     | Danger source, monster spawns, block corruption, cleansing path, forbidden rewards. | Beta               |
| Leyline Anchor      | Late-game city/portal/magic automation infrastructure.                              | Final              |

## 14.1 Magical Operating States

- Dormant: visible but not functional yet.

- Active: powered and performing its intended function.

- Damaged: output reduced, unstable, or partially broken.

- Unstable: warns the player before overload, corruption, or creature events.

- Corrupted: spreads danger slowly and visibly, scaled by difficulty.

- Cleansed: restored to safe or holy use.

- Overcharged: stronger output with higher risk and possible faction concern.

# 15. Portals, Realm Gates, and Dimension Structures

Portals should be both generated and eventually player-built. Generated portal structures introduce dimensions through mystery, ruins, boss keys, faction knowledge, and stabilisation requirements. Player-built portals should arrive later as logistics and settlement infrastructure, not as early fast travel that skips world exploration.

Dormant portal frames can appear before dimensions are fully implemented. In the POC, a dormant frame or broken gate inside the old rune ruin should be clearly labelled as inactive, inspectable, and future-facing rather than usable.

| **Portal Structure**    | **Role**                                                                         | **Scope**  |
|-------------------------|----------------------------------------------------------------------------------|------------|
| Dormant Portal Frame    | Teaser, lore, future recipe hint, inspection text.                               | POC Teaser |
| Ruined Realm Gate       | Quest/research gate requiring repair, stabilisation, and knowledge.              | Beta       |
| Active Portal Structure | Dimension entry point with danger warnings and clear target rules.               | Beta/Final |
| Player Portal Anchor    | Late-game logistics and settlement route structure.                              | Final      |
| Unstable Rift Site      | Danger event, creature spawns, corruption, temporary access, ritual containment. | Final      |

# 16. Factions, Culture, and Ownership

Structure style is one of the strongest ways to make culture visible. Every culture should eventually have unique shapes, materials, roofs, decoration, layout logic, job buildings, storage norms, defence style, religion/magic structures, and economy structures. Reusable modular rules should keep this scalable.

| **Ownership State** | **Meaning**                                                         | **Gameplay Effect**                                                                        |
|---------------------|---------------------------------------------------------------------|--------------------------------------------------------------------------------------------|
| Neutral / Unowned   | No current owner; may still have history.                           | Player can inspect, salvage, or claim depending on laws and danger.                        |
| Village Owned       | Belongs to a settlement.                                            | Reputation and permissions control access, theft, building, automation input, and repairs. |
| Faction Owned       | Controlled by a kingdom, guild, clan, cult, order, or raider group. | Diplomacy, war, trade, crime, or conquest consequences apply.                              |
| Hostile Occupied    | Held by enemies or creatures.                                       | Clearing changes danger, loot, reputation, and ownership opportunities.                    |
| Player Claimed      | Recognised as player-owned or player-controlled.                    | Can support base, outpost, settlement, warehouse, or conversion systems.                   |
| Contested           | Multiple groups have claims or active conflict.                     | Quest, diplomacy, battle, betrayal, or mediation hooks.                                    |
| Protected / Sacred  | Has law, culture, or magic protection.                              | Breaking or stealing creates strong reputation, curse, or faction consequences.            |

## 16.1 Territory and Wonders

Structures should make faction borders readable. Roads, banners, shrines, watchtowers, farms, patrol camps, forts, ruins, graves, and market posts show who controls a region. Cultures can also create rare wonder structures such as grand temples, rune forges, sky gardens, giant libraries, mountain gates, sacred groves, or city-scale mana spires.

# 17. Loot, Rewards, Knowledge, and Progression

Structure rewards should be mixed. Loot is useful, but structures should also reward knowledge, access, reputation, NPCs, restored services, safe routes, new recipes, map information, and world-state change.

| **Reward Type**       | **Examples**                                                                        | **Purpose**                                                          |
|-----------------------|-------------------------------------------------------------------------------------|----------------------------------------------------------------------|
| Material Loot         | Blocks, ores, food, tools, machine parts, magic components, trade goods.            | Supports crafting, building, repair, trade, and automation.          |
| Authored Key Reward   | Unique note, recipe fragment, relic, map, key, boss item, ritual pattern.           | Prevents important progression from feeling random.                  |
| Random Secondary Loot | Structure-tagged loot tables by biome, culture, danger, and state.                  | Keeps replayability without breaking progression.                    |
| Knowledge Reward      | Books, runes, NPC teaching, clues, diagrams, survey data.                           | Unlocks recipes, magic, enemy weaknesses, structures, or dimensions. |
| Reputation Reward     | Village/faction trust, fear, gratitude, contracts, rights, titles.                  | Changes social progression and permissions.                          |
| World-State Reward    | Cleared camp, repaired bridge, restored shrine, safe road, claimed outpost.         | Makes the world visibly better, worse, or different.                 |
| Access Reward         | New route, mine, portal, district, trade path, dungeon wing, settlement permission. | Expands the sandbox.                                                 |

## 17.1 Hazard Readability

Most structure hazards should have readable clues before they hurt the player: webs before spiders, scorch marks before fire traps, cracked floors before collapses, smoke before camps, humming before unstable magic, dead plants before corruption, and missing villagers before raids. This is especially important in early game and POC content.

# 18. Destruction, Repair, Restoration, and Dynamic States

Because the game is a voxel sandbox, players should be able to break many structure blocks. However, important quest objects, ownership rules, protected cultural sites, puzzle anchors, and critical progression pieces need safeguards. Destruction should be possible, but it should create consequences rather than silently breaking the game.

| **State**        | **Meaning**                                         | **Gameplay Result**                                                |
|------------------|-----------------------------------------------------|--------------------------------------------------------------------|
| Intact           | Normal usable state.                                | Full function, normal loot, normal ownership.                      |
| Damaged          | Partially broken but repairable.                    | Reduced function, repair project, visible cracks/scaffolds/rubble. |
| Ruined           | Major loss of function.                             | Restoration opportunity, salvage, danger, history clues.           |
| Burned           | Fire damage state.                                  | Charred blocks, morale impact, resource loss, repair costs.        |
| Abandoned        | No active owner or residents.                       | Claim/restoration, occupation risk, scavenging.                    |
| Occupied         | Taken by enemies, creatures, refugees, or factions. | Changes spawns, loot, ownership, map marker, and quests.           |
| Corrupted/Cursed | Magical danger state.                               | Slow spread, monster spawns, cleansing project, forbidden rewards. |
| Repaired         | Functional again but may show history.              | Restores use, reputation, safety, route, or project status.        |
| Restored         | Upgraded from ruin to active site.                  | Can become base, shrine, outpost, district, or special service.    |
| Claimed          | Player or faction ownership established.            | Permissions, storage, building rights, trade or defence value.     |
| Warded/Cleansed  | Protected or purified state.                        | Reduced magical threat, village morale, faith/magic effects.       |
| Activated        | Functional magic/mechanical state.                  | Portal, ritual, ward, machine, or puzzle system is active.         |

## 18.1 NPC Memory and Event History

NPCs and factions should remember major structure events: restored shrine, destroyed bridge, defended tower, cleared camp, corrupted farm, conquered outpost, rebuilt village, or destroyed warehouse. These memories can affect dialogue, reputation, prices, migration, fear, future quests, faction hostility, and story paths.

# 19. Blueprints, Modular Pieces, and Material Variation

Generated structures, village projects, NPC construction, and player settlement systems should share a blueprint foundation. The best model is hybrid: modular shells and rooms for layout, with block-level details for voxel readability, decoration, damage, material swaps, and player interaction.

| **System Piece**        | **Definition**                                                                              | **Purpose**                                                            |
|-------------------------|---------------------------------------------------------------------------------------------|------------------------------------------------------------------------|
| Blueprint Definition    | High-level structure plan, sockets, required footprint, build stages, and variants.         | Watchtower blueprint, small shrine blueprint, mine entrance blueprint. |
| Module Library          | Reusable rooms, walls, roofs, stairs, bridges, camps, towers, ruin pieces.                  | Keeps procedural structures authored-feeling and scalable.             |
| Material Substitution   | Biome/culture/resource swaps for wood, stone, roofs, metals, banners, lights.               | Same watchtower can feel forest, desert, dwarven, or mage-built.       |
| Damage Overlay          | Applies broken walls, rubble, missing roof, burn marks, corruption patches, scaffolds.      | World history without needing unique models for every version.         |
| Engine-Driven Variation | Age, weathering, rarity, culture, corruption, magic charge, damage, biome, village history. | Block textures and materials vary in-engine while staying readable.    |
| Terrain Adaptation      | Foundations, stilts, ramps, stairs, retaining walls, bridge segments, cave cuts.            | Structures fit dramatic terrain instead of forcing flat maps.          |

# 20. UI, Map, Feedback, Difficulty, and World Settings

The player should be able to understand discovered structures without needing a spreadsheet. Map markers, inspection text, request boards, warnings, rumours, state icons, faction banners, danger ratings, and optional codex entries should present only the level of detail the player has earned or chosen through settings.

| **UI / Setting**      | **Content**                                                                                                      | **Purpose**                                                                              |
|-----------------------|------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------|
| Map Marker State      | Unknown, hinted, discovered, scouted, cleared, occupied, damaged, restored, claimed, active.                     | Shows progress without revealing everything immediately.                                 |
| Faction/Owner Display | Village, player, faction, hostile, abandoned, contested, sacred.                                                 | Clarifies permissions and consequences.                                                  |
| Danger Rating         | Safe, low, moderate, high, extreme, boss, unknown.                                                               | Helps players avoid unfair surprises.                                                    |
| Request Board Links   | Rumours, monster sightings, repair requests, road warnings, resource needs, structure quests.                    | Connects villages to nearby structures.                                                  |
| Alerts                | Raids, fires, camp growth, bridge collapse, corruption spread, shrine failure, warehouse attack.                 | Configurable notification intensity.                                                     |
| World Settings        | Structure density, village density, ruins/camps/dungeons/roads, damage, corruption, fire, raids, map strictness. | Supports peaceful builders, dense civilisation, wild frontier, and harsh survival saves. |

# 21. Detailed Structure Registry v0.1

The v0.1 registry below is a design draft. It is not a final content list, but it gives the project a database-ready starting point. Entries marked POC Required are needed for the proof-of-concept loop. Alpha entries are the most natural expansion after the POC. Final entries can remain future-facing until the core systems exist.

| **ID**                           | **Structure**             | **Type**                | **Gameplay Role**                                                                                           | **Scope**          |
|----------------------------------|---------------------------|-------------------------|-------------------------------------------------------------------------------------------------------------|--------------------|
| str.village.forest_hamlet        | Forest Hamlet             | Village Cluster         | Main POC village with homes, centre, warehouse, farms, guard post, mage hint, and watchtower project.       | POC Required       |
| str.village.warehouse_basic      | Shared Village Warehouse  | Village Building        | Physical store for food, construction, tools, guard supply, magic stock, trade goods, and project reserves. | POC Required       |
| str.village.watchtower_wooden    | Wooden Watchtower Project | Defence Project         | Staged construction that improves warning range and raid defence.                                           | POC Required       |
| str.village.request_board        | Village Request Board     | Civilisation Utility    | Shows delivery needs, structure projects, rumours, warnings, and event hooks.                               | POC Required       |
| str.village.guard_post_basic     | Basic Guard Post          | Defence Building        | Guard gathering point, patrol anchor, weapon storage, raid response.                                        | POC Required       |
| str.village.farm_plots_basic     | Village Farm Plots        | Food Building           | Food supply, NPC job site, crop damage target, village growth hook.                                         | POC Required       |
| str.road.dirt_trail              | Dirt Trail Network        | Road                    | Partial trails connecting spawn, village, cave, ruin, and camp.                                             | POC Required       |
| str.bridge.wooden_crossing       | Wooden River Crossing     | Bridge                  | Small traversal/infrastructure structure with damage/repair teaser.                                         | POC Required/Alpha |
| str.cave.starter_cave            | Starter Cave Entrance     | Cave Structure          | Early stone/copper/iron access with darkness and creature pressure.                                         | POC Required       |
| str.mine.abandoned_copper_mine   | Abandoned Copper Mine     | Mine                    | Supports, storage, old tools, copper clues, cave threat, restoration or claim path.                         | POC/Alpha          |
| str.cave.mana_crystal_pocket     | Mana Crystal Pocket       | Magical Cave            | Mana hint, wisp/crystal creature spawn, old rune clue, purity teaching.                                     | POC Required       |
| str.ruin.old_rune_site           | Old Rune Ruin             | Ancient Magical Ruin    | Magic discovery, rune note, ward clue, dormant portal teaser.                                               | POC Required       |
| str.ruin.dormant_portal_frame    | Dormant Portal Frame      | Portal Teaser           | Inactive inspection object that foreshadows dimensions and ritual restoration.                              | POC Teaser         |
| str.camp.goblin_scavenger        | Goblin Scavenger Camp     | Hostile Camp            | Raid source with scouts, stolen goods, supplies, and escalation if ignored.                                 | POC Required       |
| str.camp.goblin_raid_pile        | Goblin Raid Supply Pile   | Camp Substructure       | Visible evidence of upcoming raid strength and target intent.                                               | POC Required       |
| str.poi.fallen_cart              | Fallen Cart               | Minor POI               | Small loot, road clue, bandit/goblin warning, trade route flavour.                                          | Alpha              |
| str.poi.broken_well              | Broken Well               | Minor POI               | Village history, repair request, water access clue, possible underground link.                              | Alpha              |
| str.poi.old_grave_cluster        | Old Grave Cluster         | Minor POI               | Lore, spirit clue, possible undead hook, respectful/looting consequence.                                    | Alpha              |
| str.poi.hunter_camp              | Hunter Camp               | Minor POI               | Wildlife clue, food/trap loot, NPC traveller encounter, tracking tutorial.                                  | Alpha              |
| str.village.blacksmith_basic     | Basic Blacksmith          | Village Industry        | Tool repair, metal parts, guard equipment, culture recipes.                                                 | Alpha              |
| str.village.mage_hut             | Mage Hut                  | Village Magic           | Mage teaching, mana requests, rune table hook, ward maintenance.                                            | Alpha              |
| str.village.market_stalls        | Market Stalls             | Village Economy         | Trade, supply/demand visibility, culture goods, caravans.                                                   | Alpha              |
| str.village.palisade_wall        | Palisade Wall             | Defence Project         | Village perimeter defence using staged construction and repair.                                             | Alpha              |
| str.village.gate_basic           | Village Gate              | Defence/Permission      | Access, guard checks, raids, reputation permissions, route control.                                         | Alpha              |
| str.road.gravel_road             | Gravel Road               | Road Upgrade            | Improved travel, trade, patrols, player/NPC-built road recognition.                                         | Alpha              |
| str.road.warded_road_marker      | Warded Road Marker        | Magic Road              | Road safety with mana/ward support against magical/corruption threats.                                      | Beta               |
| str.bridge.stone_bridge          | Stone Bridge              | Bridge Upgrade          | Durable trade route and strategic control point.                                                            | Alpha/Beta         |
| str.outpost.watchtower_abandoned | Abandoned Watchtower      | Claimable Structure     | Repairable lookout, bandit/goblin occupation candidate, player outpost.                                     | Alpha              |
| str.ruin.collapsed_temple        | Collapsed Temple          | Ancient Shrine Ruin     | Spirit/divine magic, cleansing, cultural reputation, restoration project.                                   | Beta               |
| str.ruin.buried_archive          | Buried Archive            | Knowledge Ruin          | Books, recipe fragments, maps, scholar quests, hidden lore.                                                 | Beta               |
| str.ruin.fallen_machine_works    | Fallen Machine Works      | Ancient Automation Ruin | Old machine components, unstable automation, recipe unlocks.                                                | Beta/Final         |
| str.dungeon.crypt_small          | Small Crypt               | Dungeon                 | Undead, traps, relics, spirit/divine hooks, non-reset key rewards.                                          | Beta               |
| str.dungeon.spider_den           | Spider Den                | Creature Dungeon        | Web clues, silk resource, cave pressure, nest destruction.                                                  | Alpha/Beta         |
| str.nest.crystal_crawler_clutch  | Crystal Crawler Clutch    | Monster Nest            | Magical cave spawn source, crystal resource, ward interaction.                                              | POC/Alpha          |
| str.nest.corruption_mound        | Corruption Mound          | Corrupted Nest          | Slow corruption spread, cleansing project, monster pressure.                                                | Beta               |
| str.camp.bandit_watchpost        | Bandit Watchpost          | Hostile Outpost         | Road tolls, caravan raids, stealth/diplomacy/combat options.                                                | Alpha/Beta         |
| str.camp.orc_siege_camp          | Orc Siege Camp            | Hostile Camp            | Large raid preparation, siege engines, faction war pressure.                                                | Final              |
| str.shrine.roadside_basic        | Roadside Shrine           | Minor Shrine            | Blessing, rest, culture clue, small reputation/magic effect.                                                | Alpha              |
| str.shrine.village_ancestor      | Village Ancestor Shrine   | Village Shrine          | Morale, culture story, spirit magic, blessing, social reaction.                                             | Beta               |
| str.magic.ward_stone_basic       | Basic Ward Stone          | Magic Defence           | Protects small radius against magical/corruption threats; mana-powered.                                     | POC/Alpha          |
| str.magic.ritual_circle_basic    | Basic Ritual Circle       | Ritual Site             | Rune/magic progression, world-state rituals, risk/cost tutorial.                                            | Alpha              |
| str.magic.mana_well              | Mana Well                 | Magic Resource Site     | Mana source with purity, instability, creature, and faction hooks.                                          | Beta               |
| str.portal.ruined_realm_gate     | Ruined Realm Gate         | Portal Structure        | Repair/stabilisation path to dimension entry.                                                               | Beta/Final         |
| str.portal.player_anchor         | Player Portal Anchor      | Player-Built Portal     | Late-game logistics and realm travel infrastructure.                                                        | Final              |
| str.landmark.mage_spire          | Distant Mage Spire        | Major Landmark          | Visible regional identity, magic faction, quests, recipes.                                                  | Beta/Final         |
| str.landmark.giant_tree_city     | Giant Tree City           | Major Landmark          | Culture settlement, vertical village, nature magic, trade hub.                                              | Final              |
| str.mega.sky_fortress_ruin       | Ruined Sky Fortress       | Megastructure           | Late-game exploration, bosses, flight/portal hooks, ancient lore.                                           | Final              |
| str.mega.ancient_machine_city    | Ancient Machine City      | Megastructure           | Automation/civilisation story, unique machines, high danger, major unlocks.                                 | Final              |
| str.mega.dragon_bone_bridge      | Dragon-Bone Bridge        | Megastructure           | Regional crossing, cultural wonder, boss/lore/faction value.                                                | Final              |
| str.mega.giant_mana_spire        | Giant Mana Spire          | Megastructure           | Leyline anchor, city-scale magic, corruption risk, realm-scale projects.                                    | Final              |

# 22. Sample Detailed Structure Entries

The sample entries below show the desired field depth for future spreadsheet or database entries. Values are design draft and should be balanced later after implementation testing.

## str.village.forest_hamlet

| **Field**               | **Draft Value**                                                                                                         |
|-------------------------|-------------------------------------------------------------------------------------------------------------------------|
| **Display Name**        | Forest Hamlet                                                                                                           |
| **Category**            | Village Cluster / Civilised Structure                                                                                   |
| **Size Tier**           | Large structure cluster                                                                                                 |
| **Placement**           | Starter meadow/forest edge near water, road/trail access, buildable terrain, nearby cave and ruin within POC valley.    |
| **Core Systems**        | NPC homes, village centre, warehouse, request board, farms, guard post, watchtower project, reputation, raids, repairs. |
| **Generation Variants** | Calm forest hamlet, damaged hamlet, river hamlet, partially fortified hamlet.                                           |
| **Runtime States**      | Discovered, damaged, growing, under threat, repaired, fortified, abandoned, conquered, player-allied.                   |
| **POC Role**            | Main civilisation anchor and teaching path for village delivery, warehouse supply, construction, and raid outcome.      |

## str.village.warehouse_basic

| **Field**                | **Draft Value**                                                                                                                        |
|--------------------------|----------------------------------------------------------------------------------------------------------------------------------------|
| **Display Name**         | Shared Village Warehouse                                                                                                               |
| **Category**             | Village Building / Storage Structure                                                                                                   |
| **Inventory Categories** | Food, construction, fuel, tools, guard supply, magic stock, trade goods, reserved project stock.                                       |
| **Permissions**          | Player can deliver early. Automation input unlocks after trust/permission. Withdrawal/export requires trade, law, or settlement rules. |
| **NPC Use**              | Builders reserve project materials; guards pull equipment; farmers and workers draw daily supplies depending on simulation rules.      |
| **Automation Link**      | Accepts input from chutes/conveyors/pipes after permission; ledger tracks deliveries and project contributions.                        |
| **States**               | Functional, damaged, looted, burning, full, low supply, locked, player-permitted.                                                      |
| **POC Role**             | Proves real resource storage and watchtower project reservation.                                                                       |

## str.village.watchtower_wooden

| **Field**           | **Draft Value**                                                                                              |
|---------------------|--------------------------------------------------------------------------------------------------------------|
| **Display Name**    | Wooden Watchtower Project                                                                                    |
| **Category**        | Village Defence Project                                                                                      |
| **Project Recipe**  | Uses staged ProjectRecipe: foundation, frame, platform, roof, ladder, guard post, optional ward lantern.     |
| **Resources**       | Logs/planks, stone, rope/fibre, iron nails/components, torch or lantern, optional mana ward component.       |
| **NPC Use**         | Builder carries/uses reserved resources; guard uses tower after completion; elder/request board tracks need. |
| **Gameplay Effect** | Improves raid warning, archer/guard effectiveness, village morale, and raid outcome.                         |
| **States**          | Unbuilt, foundation, frame, platform, completed, damaged, burned, repaired, warded.                          |
| **POC Role**        | Primary proof that structures, NPC projects, automation supply, and raids connect.                           |

## str.ruin.old_rune_site

| **Field**        | **Draft Value**                                                                                                              |
|------------------|------------------------------------------------------------------------------------------------------------------------------|
| **Display Name** | Old Rune Ruin                                                                                                                |
| **Category**     | Ancient Magical Ruin                                                                                                         |
| **Placement**    | Near starter valley but not inside village. Signposted by unusual stone, faint glow, broken path, or NPC rumour.             |
| **Contents**     | Broken rune stones, mana crystal clue, old note, simple inspection puzzle, dormant portal frame teaser, possible wisp spawn. |
| **Rewards**      | Basic rune clue, mana/rune lore, recipe hint, map marker, magic codex entry.                                                 |
| **Risks**        | Low magical instability, wisp/cave creature nearby, optional trap or unstable block state later.                             |
| **States**       | Dormant, inspected, partially restored, activated teaser, corrupted variant later.                                           |
| **POC Role**     | Introduces magic as infrastructure and foreshadows wards/portals.                                                            |

## str.camp.goblin_scavenger

| **Field**              | **Draft Value**                                                                                                                |
|------------------------|--------------------------------------------------------------------------------------------------------------------------------|
| **Display Name**       | Goblin Scavenger Camp                                                                                                          |
| **Category**           | Hostile Camp / Raid Source                                                                                                     |
| **Placement**          | Forest clearing, old ruin edge, road bend, cave approach, or hill overlooking village route.                                   |
| **Camp Contents**      | Scrap walls, crude tents, stolen crates, cooking fire, raid pile, traps, lookout perch, possible prisoners or livestock later. |
| **Behaviour**          | Spawns scouts and raiders. Strength grows if ignored. Camp supplies affect raid intensity.                                     |
| **Rewards**            | Stolen goods, crude weapons, scrap, food, coins, map clue, reputation with village.                                            |
| **Non-Combat Options** | Sneak, sabotage supplies, scare scouts, negotiate with special leaders, redirect threat in later systems.                      |
| **POC Role**           | Visible source of goblin raid pressure.                                                                                        |

## str.cave.starter_cave

| **Field**            | **Draft Value**                                                                                                       |
|----------------------|-----------------------------------------------------------------------------------------------------------------------|
| **Display Name**     | Starter Cave Entrance                                                                                                 |
| **Category**         | Cave / Underground Structure                                                                                          |
| **Placement**        | Within POC valley, close enough for early mining but dangerous enough to require light, tools, and basic preparation. |
| **Resources**        | Stone, coal, copper, iron, mana crystal hint, possible clay/sand nearby depending on terrain.                         |
| **Threats**          | Cave spider, crystal crawler, darkness pressure, falls, collapsed paths.                                              |
| **Structure Pieces** | Supports, broken carts, abandoned crates, old note, blocked side tunnel.                                              |
| **States**           | Unexplored, partially cleared, mined, unstable, occupied by nest, secured with lights/wards.                          |
| **POC Role**         | Resource and danger site that feeds tools, automation, watchtower supply, and magic discovery.                        |

## str.road.dirt_trail

| **Field**         | **Draft Value**                                                                                          |
|-------------------|----------------------------------------------------------------------------------------------------------|
| **Display Name**  | Dirt Trail Network                                                                                       |
| **Category**      | Road / Route Structure                                                                                   |
| **Placement**     | Connects spawn, village, cave, ruin, river crossing, and camp through partial readable routes.           |
| **Gameplay Role** | Navigation, NPC pathing, cart/trade route foundation, raid approach, map clue.                           |
| **Upgrade Path**  | Dirt trail -\> dirt road -\> gravel road -\> stone road -\> warded road.                                 |
| **Risks**         | Roads can attract merchants, patrols, bandits, goblins, and raid routes depending on control and safety. |
| **States**        | Clear, overgrown, damaged, occupied, patrolled, warded, official trade route.                            |
| **POC Role**      | Teaches environmental navigation without over-revealing the map.                                         |

## str.portal.dormant_portal_frame

| **Field**         | **Draft Value**                                                                                                     |
|-------------------|---------------------------------------------------------------------------------------------------------------------|
| **Display Name**  | Dormant Portal Frame                                                                                                |
| **Category**      | Portal Teaser / Ancient Structure                                                                                   |
| **Placement**     | Inside or near old rune ruin, clearly inactive in POC.                                                              |
| **Interaction**   | Inspect text explains that the frame is dormant, missing stabilising components, and tied to future realm research. |
| **Gameplay Role** | Foreshadows dimensions, ritual structures, and late-game portal logistics.                                          |
| **Restrictions**  | Cannot activate in POC. No accidental travel or incomplete dimension dependency.                                    |
| **States**        | Dormant, cracked, studied, repaired teaser, active in future content.                                               |
| **POC Role**      | Safe future-facing object that shows long-term scope.                                                               |

# 23. Core POC Scenario: Forest Hamlet Structure Loop

The POC structure loop should be simple enough to build but connected enough to prove the game identity.

7.  Player spawns in a compact valley with visible terrain clues, partial roads, a nearby forest hamlet, cave entrance, old rune ruin, and hidden/partly visible goblin camp.

8.  The village request board and elder explain that the watchtower is unfinished and the village needs construction resources.

9.  The player gathers wood and stone, explores the starter cave for copper/iron, and discovers mana hints in a crystal pocket or old rune ruin.

10. The player delivers resources to the village warehouse. The warehouse ledger reserves required items for the watchtower project.

11. NPC builders visibly work through staged construction: foundation, frame, platform, roof, guard use, optional ward upgrade.

12. The goblin camp shows growing raid pressure through scouts, smoke, stolen goods, or raid supply piles. If ignored, the raid is stronger.

13. The player can disrupt the camp, finish the tower, automate part of the iron/resource chain, or prepare magic/wards before the raid.

14. During the raid, the village outcome changes based on structure state: no tower means greater damage; tower means earlier warning and stronger defence; warded tower improves magical or morale defence.

15. After the raid, NPC dialogue, reputation, damage states, repairs, warehouse supplies, and request board entries update based on what happened.

# 24. Balancing Rules

- Structures should create goals, not chores. Repair and supply needs must be meaningful but not constant babysitting.

- Early structures must be readable from silhouette, materials, lighting, and path context.

- POC structure count should stay small; depth comes from interconnection, not quantity.

- Major structures should have one or more clear gameplay roles: resource, danger, knowledge, route, defence, NPC service, magic, or progression.

- Dynamic structures should use simulation LOD so distant changes are believable without heavy processing.

- Rewards should combine authored key rewards with random secondary loot so progression remains reliable and exploration remains replayable.

- Destruction should respect sandbox freedom but use protection, warning, ownership, repair, and consequence systems to prevent accidental progression breaks.

- Magic/corruption spread, village damage, road decay, fire, raid frequency, and structure density should be world-setting controlled.

- Every POC structure should be useful to at least two systems. For example, the old rune ruin supports exploration, magic, recipes, and future dimension foreshadowing.

# 25. Open Questions for Later Documents

- How much block-level structural damage should be simulated in Combat and Defence compared with simplified damage states?

- How detailed should player-founded settlement zoning, laws, districts, and official blueprint approval become?

- Should large structures have internal temperature, lighting, morale, or comfort ratings?

- How should faction war claim structures such as bridges, forts, towers, and roads over time?

- How many culture-specific architecture sets are realistic for the first playable alpha?

- Should restored ruins grant permanent passive bonuses, services, unique NPCs, or mostly access/story rewards?

- How will multiplayer ownership, contribution credit, theft, warehouse access, and shared structure claims be displayed?

- Which major landmarks and megastructures should belong to the first full-game region after the POC?

# Appendix A. POC Structure Checklist

| **Structure**            | **Status**           | **POC Notes**                                                                        |
|--------------------------|----------------------|--------------------------------------------------------------------------------------|
| Forest Hamlet            | Required             | Village centre, homes, warehouse, request board, farms, guard post, watchtower site. |
| Shared Village Warehouse | Required             | Real storage, project reservation, ledger, manual delivery, future automation input. |
| Watchtower Project       | Required             | Staged blueprint with visible build progress and raid outcome effect.                |
| Starter Cave/Mine        | Required             | Stone/copper/iron, danger, simple supports, route to mana hint.                      |
| Mana Crystal Pocket      | Required             | Mana discovery, wisp or crystal creature, magic resource clue.                       |
| Old Rune Ruin            | Required             | Rune note, ward clue, dormant portal teaser, lore.                                   |
| Goblin Scavenger Camp    | Required             | Raid source, supplies, scouts, escalation, clear/reduce pressure.                    |
| Dirt Trail Network       | Required             | Partial navigation between structures, raid route, NPC pathing.                      |
| Bridge/Crossing          | Strongly Recommended | Small traversal/repair teaser and future route-control system.                       |
| Minor POI                | Optional             | Fallen cart, hunter camp, or broken well to test small structure reward logic.       |

# Appendix B. Structure Database Field Template

| **Field**              | **Purpose**                                                                                                       |
|------------------------|-------------------------------------------------------------------------------------------------------------------|
| **structure_id**       | Unique internal ID such as str.ruin.old_rune_site.                                                                |
| **display_name**       | Player-facing name.                                                                                               |
| **category_primary**   | Village, road, ruin, camp, shrine, dungeon, portal, POI, landmark, etc.                                           |
| **category_secondary** | Optional subcategory such as defence project, magical ruin, hostile camp.                                         |
| **size_tier**          | Tiny, small, medium, large, landmark, megastructure.                                                              |
| **origin_tags**        | Natural, village, faction, ancient, magical, dimensional, creature, player, hostile.                              |
| **biome_rules**        | Allowed/blocked biomes, sub-biomes, cave/depth, water, terrain, climate, magic, corruption.                       |
| **placement_rules**    | Slope, flatness, road access, water access, resource proximity, distance from spawn/villages, terrain adaptation. |
| **rarity**             | Common, uncommon, rare, legendary, unique, fallback-required.                                                     |
| **danger_tier**        | Safe, low, moderate, high, extreme, boss, variable.                                                               |
| **faction_culture**    | Owning or origin faction/culture tags.                                                                            |
| **blueprint_id**       | Physical blueprint or modular layout reference.                                                                   |
| **material_palette**   | Default and alternate culture/biome material sets.                                                                |
| **states_supported**   | Intact, damaged, ruined, occupied, corrupted, restored, claimed, active, etc.                                     |
| **npc_use**            | Jobs, schedules, inventories, project roles, request board links, settlement use.                                 |
| **automation_use**     | Warehouse input, ports, power sites, rails, roads, machine anchors, logistics.                                    |
| **magic_use**          | Mana, wards, rituals, shrines, corruption, portal, rune/puzzle state.                                             |
| **creature_use**       | Spawns, nests, camps, raid source, patrols, boss, ecology.                                                        |
| **reward_rules**       | Loot table, authored rewards, recipe fragments, reputation, world-state changes.                                  |
| **map_discovery**      | Hidden, hinted, proximity reveal, NPC map, magic reveal, quest marker.                                            |
| **simulation_lod**     | Near simulation, far summary, daily tick behaviour, event triggers.                                               |
| **planning_status**    | POC Required, Alpha, Beta, Final Game, Placeholder, Deferred.                                                     |

# Appendix C. Cross-System Use Matrix

| **System**             | **Structure Connection**                                                                                                                  |
|------------------------|-------------------------------------------------------------------------------------------------------------------------------------------|
| Blocks Registry        | Structure blueprints use block IDs, shapes, material families, damage states, scaffolds, repair blocks, magic blocks, and village blocks. |
| Items Registry         | Structure rewards and repairs use items: maps, keys, relics, lore, machine parts, mana components, food, tools, stolen goods.             |
| Recipe Registry        | Village builds, repairs, restorations, rituals, and portal stabilisation use ProjectRecipe and RitualRecipe entries.                      |
| Resource Progression   | Structures consume exact resources for construction, repairs, upgrades, roads, bridges, shrines, and automation infrastructure.           |
| NPC Village System     | Villages, warehouses, homes, job sites, districts, repairs, permissions, raids, memories, and growth all require structure support.       |
| Automation System      | Structures define machine sites, warehouse inputs, roads, rails, power/water/wind sites, logistics routes, and sabotage targets.          |
| Magic System           | Ruins, shrines, wards, ritual circles, mana wells, conduits, portal frames, and corrupted sites create magical infrastructure.            |
| Creatures and Monsters | Camps, nests, dungeons, caves, occupied ruins, and raid routes give creatures visible sources and consequences.                           |
| Biomes and Worldgen    | Worldgen places structures based on biome, terrain, water, roads, resources, leylines, danger, faction territory, and history.            |
| Future Economy         | Roads, bridges, markets, outposts, mines, caravans, warehouses, and faction territories shape trade and supply/demand.                    |
| Future Combat/Defence  | Walls, gates, towers, traps, raids, siege units, damage states, and repair priorities need structure rules.                               |
| Future Dimensions      | Portal gates, realm anchors, dimension settlements, realm ruins, and overworld effects need structure families.                           |

# Appendix D. Future Structure Family Backlog

| **Family**                   | **Examples**                                                                                                     |
|------------------------------|------------------------------------------------------------------------------------------------------------------|
| Culture Villages             | Dwarven hold, elven grove-town, orc stronghold, goblin scrap-town, fae village, undead settlement, mage enclave. |
| Roadside Civilisation        | Taverns, toll gates, caravan stops, patrol posts, sign towers, road shrines, border markers.                     |
| Production Sites             | Quarries, lumber camps, farms, windmills, watermills, forges, mana refineries, minehead stations.                |
| Faction Fortifications       | Forts, castles, palisade camps, watch chains, siege camps, border walls, keeps.                                  |
| Ancient Knowledge Sites      | Libraries, observatories, laboratories, archive vaults, rune schools, map rooms.                                 |
| Magic and Faith Sites        | Grand shrines, temples, spirit groves, ritual basins, leyline towers, ward networks.                             |
| Dimensional Sites            | Fae gates, dream mirrors, void breaches, infernal seals, celestial landing platforms, realm harbours.            |
| Megastructures               | Sky fortress, ancient machine city, giant mana spire, dragon-bone bridge, world tree city, sunken capital.       |
| Abandoned History            | Burned villages, plague towns, ruined trade roads, collapsed bridges, lost forts, haunted farms.                 |
| Player Settlement Structures | Town hall, law board, official warehouse, district markers, ruler hall, tax office, city walls, public works.    |

# Appendix E. POC Success Criteria

| **Criterion**         | **Pass Condition**                                                                                                                   |
|-----------------------|--------------------------------------------------------------------------------------------------------------------------------------|
| Exploration           | Player finds the village, cave, ruin, road, and camp through readable environmental clues.                                           |
| Village Function      | Warehouse, request board, NPC builders, and watchtower project work together with real resources.                                    |
| Automation Connection | At least one resource path can support village supply, even if basic automation is limited to miner/chute/furnace/storage/warehouse. |
| Magic Connection      | Old rune ruin and mana crystal hint explain basic rune/ward/mana infrastructure without requiring full magic trees.                  |
| Threat Connection     | Goblin camp visibly causes or strengthens the raid, and clearing/sabotage/preparation changes pressure.                              |
| World-State Change    | After the raid, the village, watchtower, camp, warehouse, NPC dialogue, and reputation reflect the outcome.                          |
| Performance           | Nearby structures show visible states. Distant/dormant structures can run on simple summary state.                                   |
| Replayability         | The same POC valley can use seed variation for minor layout, path, resource, and camp placement without breaking the learning loop.  |
