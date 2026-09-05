**Fantasy Voxel Civilisation Sandbox**

**11 - Biomes and World Generation**

Version 0.1 - Detailed Design Bible Draft

*A database-ready world generation system for layered procedural terrain, biomes, regions, climate, leylines, resources, structures, villages, corruption, seasons, roads, landmarks, and proof-of-concept valley generation.*

| **Field**             | **Locked Direction**                                                                                                                                                                                                                                                                                   |
|-----------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Document Scope        | Full design-bible document covering world structure, seeds, regions, biome families, sub-biomes, terrain layers, resources, ores, caves, rivers, structures, NPC villages, roads, corruption, seasons, leylines, dynamic world state, visual block variation, performance, data fields, and POC scope. |
| Core Philosophy       | World generation is not just terrain decoration. It is the foundation that decides where survival, villages, resources, magic, automation, danger, culture, structures, and progression appear.                                                                                                        |
| World Shape           | Default worlds are very large and can behave like infinite or semi-infinite voxel worlds, with configurable world-size and worldgen presets. A stable central region can be used for progression pacing while outer regions extend procedurally.                                                       |
| Biome Direction       | Start with a natural fantasy world, then increase magical, ancient, corrupted, civilisation-influenced, underground, and dimensional biomes as the player explores farther, deeper, higher, and closer to strong leylines.                                                                             |
| Dynamic Direction     | Biomes can change through seasons, corruption, blessing, disasters, civilisation growth, player automation, resource extraction, magic rituals, and cleansing systems.                                                                                                                                 |
| POC Direction         | The POC uses a compact procedural valley with controlled spawn rules: two surface biomes, one cave biome, one village, one river/lake, one ruin, one enemy camp, starter resources, mana hints, and terrain suitable for basic building and automation.                                                |
| Data Direction        | Use database/spreadsheet-ready IDs, categories, biome families, sub-biomes, generation layers, spawn rules, resource rules, structure rules, village rules, dynamic-state fields, tags, and planning status.                                                                                           |
| Performance Direction | Use layered generation and simulation LOD: detailed terrain, spawns, machines, and village effects near the player; abstracted region state, danger, resources, and events far away.                                                                                                                   |

# Document Purpose

This document defines how biomes and world generation work across the Fantasy Voxel Civilisation Sandbox. It translates the high-level promise of a living fantasy voxel world into concrete rules for terrain, regions, resources, villages, structures, roads, magic density, corruption, seasons, caves, water systems, creature spawns, and the proof-of-concept test valley.

This document does not replace the Blocks Registry, Items Registry, Crafting and Recipe Registry, Resource Progression document, NPC Village System, Automation System, Magic System, Creatures and Monsters document, Dimensions document, Structures document, Combat document, Economy document, or technical worldgen implementation plan. Instead, it creates the worldgen-facing rules those systems must support.

# Design Source

| **Source Document**               | **Relevant Direction**                                                                                                                                    | **How This Biome Document Uses It**                                                                                                                                |
|-----------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 00 - Master Game Design Bible     | The core hook is that magic and factories build civilisations, unlock stories, power settlements, and reshape the world.                                  | Biomes must create the physical conditions for that hook: resources, villages, magic density, roads, structures, danger, and world-state changes.                  |
| 01 - Core Gameplay Loop           | The primary loop is explore -\> gather -\> craft -\> build -\> interact -\> automate -\> defend -\> upgrade -\> expand.                                   | Worldgen must provide readable places to explore, resources to gather, villages to help, threats to defend against, and expansion routes.                          |
| 02 - Player Progression System    | Progression is hybrid across tools, materials, skills, knowledge, magic, automation, villages, reputation, bosses, and dimensions.                        | Biomes become progression gates through tool-tier resources, depth, danger, ruins, climate, leylines, cultures, bosses, and dimension access.                      |
| 03 - Blocks Registry              | Blocks are terrain, building materials, machines, magic infrastructure, hazards, and world-state evidence.                                                | Biome generation defines terrain block palettes, ore placement, block variants, hazard blocks, damaged states, corruption states, and cultural material variation. |
| 04 - Items Registry               | Items support survival, crafting, building, automation, NPC economies, quests, loot, knowledge, and dimensions.                                           | Biome entries define item sources such as food, herbs, wood families, ore families, monster resources, knowledge items, maps, and realm materials.                 |
| 05 - Crafting and Recipe Registry | Recipes transform gathered resources into tools, blocks, stations, machines, food, magic components, village supplies, and world-state effects.           | Biome resource distribution determines which recipe chains become available locally and which require travel, trade, or culture access.                            |
| 06 - Resource Progression         | Resources are survival supplies, construction inputs, machine parts, village needs, trade goods, magical catalysts, strategic assets, and dimension keys. | Worldgen places hand-mined veins, large automation deposits, surface clues, grades, magical purity, and biome-specific resources.                                  |
| 07 - NPC Village System           | Villages are living social and economic systems with needs, warehouses, projects, raids, growth, and consequences.                                        | Village placement uses culture, biome, water, roads, resources, danger, faction territory, and civilisation influence layers.                                      |
| 08 - Automation System            | Automation supplies villages and physically exists through machines, logistics, power, storage, and infrastructure.                                       | Worldgen must create buildable terrain, transport challenges, water/wind power opportunities, large deposits, roads, and permissions for warehouse supply.         |
| 09 - Magic System                 | Magic is practical infrastructure using mana, runes, wards, conduits, rituals, villages, machines, portals, and world-state change.                       | Leylines, mana density, magical biomes, mana weather, warded villages, and magic-altered terrain become core worldgen layers.                                      |
| 10 - Creatures and Monsters       | Creatures affect survival, villages, magic, automation, exploration, economy, story, and world-state consequences.                                        | Biome spawn rules control wildlife, livestock suitability, hostile pressure, nests, camps, magical creatures, raid sources, and boss territories.                  |

# Static Table of Contents

- 1\. Locked Biome and Worldgen Identity

- 2\. Player Answer Decision Summary

- 3\. Worldgen System Architecture

- 4\. Parent Biome, Region, and Worldgen Data Model

- 5\. World Structure, Seeds, Regions, and Difficulty

- 6\. Biome Categories, Families, Sub-biomes, and Tags

- 7\. Biome Layer Model

- 8\. Starter Region and POC Valley

- 9\. Natural Biomes

- 10\. Magical, Ancient, Corrupted, and Hybrid Biomes

- 11\. Caves and Underground Biomes

- 12\. Water, Rivers, Coasts, and Terrain Landmarks

- 13\. Resources, Ores, Deposits, and Prospecting

- 14\. Structures, Landmarks, Camps, Ruins, and Roads

- 15\. NPC Villages, Culture, Territory, and Civilisation Influence

- 16\. Climate, Weather, Seasons, and Disasters

- 17\. Leylines, Mana Density, and Magical Weather

- 18\. Dynamic Biomes, Corruption, Cleansing, and Player Alteration

- 19\. Building, Automation, Roads, and Terrain Practicality

- 20\. Visual Style, Block Variation, and Material Rules

- 21\. Spawning, Ecology, Creature, and Threat Rules

- 22\. Simulation LOD, Performance, Multiplayer, and World Settings

- 23\. Proof-of-Concept Worldgen Scope

- 24\. Detailed Biome Registry v0.1

- 25\. Core POC Scenario: Forest Hamlet Valley

- 26\. Balancing Rules

- 27\. Open Questions for Later Documents

- Appendix A. POC Worldgen Checklist

- Appendix B. Biome Database Field Template

- Appendix C. Cross-System Use Matrix

- Appendix D. Future Biome Family Backlog

- Appendix E. POC Success Criteria

# 1. Locked Biome and Worldgen Identity

The Biomes and World Generation system is the physical foundation of the game. It decides what the player sees, where they travel, what they gather, which villages can exist, what dangers emerge, what magic leaks into the land, how automation can be built, and how the world records long-term consequences.

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr class="header">
<th><p><strong>Locked Rule</strong></p>
<p>A biome should never be only a visual skin. Every major biome should answer at least one gameplay question: what does it provide, hide, threaten, teach, unlock, corrupt, protect, transform, or make possible for survival, villages, automation, magic, exploration, creatures, structures, culture, or progression?</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

| **Identity Layer**      | **Design Meaning**                                                                                                   | **Player-Facing Result**                                                                                          |
|-------------------------|----------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------|
| Exploration Landscape   | Terrain, climate, landmarks, roads, caves, water, and silhouettes create curiosity and navigation.                   | Players learn to read the world through mountains, rivers, smoke, ruins, glows, roads, cliffs, caves, and biomes. |
| Resource Map            | Biomes influence wood families, ores, food, herbs, magical resources, large deposits, and rare materials.            | Travel, trade, prospecting, and settlement location matter.                                                       |
| Civilisation Foundation | Culture, water, resources, roads, danger, and magic shape village placement and development.                         | Villages feel like they belong to their biome instead of being pasted onto flat land.                             |
| Magic Field             | Leylines, mana density, corruption, blessing, ancient ruins, and dimension leaks alter terrain and ecology.          | The player sees magic in the land, not only in spell menus.                                                       |
| Threat Ecology          | Spawn rules depend on time, light, biome, structures, camps, corruption, magic density, weather, and village safety. | Caves, forests, camps, roads, and magical pockets feel meaningfully different.                                    |
| Automation Terrain      | Worldgen creates build zones, transport problems, water/wind power sites, large deposits, and routes.                | Factories, roads, bridges, tunnels, and warehouses become part of the landscape.                                  |
| World-State Evidence    | Biomes can be damaged, cleansed, civilised, corrupted, overharvested, warded, blessed, or transformed.               | The world visually remembers player, NPC, and faction actions.                                                    |

## 1.1 Worldgen Design Promise

A player should be able to look across a region and make useful guesses: where water flows, where villages might be, which hills may hide ore, where magic is strongest, where raids may come from, which roads are safe, and which terrain is suitable for building or automation. The system can be deep underneath, but the result must feel readable.

## 1.2 What Worldgen Is Not

- It is not random terrain noise with resources sprinkled on top.

- It is not a purely realistic simulation if that hurts gameplay readability.

- It is not a list of pretty biomes that do not affect progression.

- It is not a punishment system where every terrain feature blocks building or logistics.

- It is not a POC requirement to generate every final biome, ocean, dimension, megastructure, or climate system.

# 2. Player Answer Decision Summary

The following table converts the selected multiple-choice answers into locked biome and world generation decisions. Where multiple answers were selected, the document uses a hybrid rule rather than treating them as contradictions.

| **Area**                   | **Locked Decision**                                                                                                                                                                               |
|----------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Overall Feel               | Natural fantasy world first; magical, ancient, corrupted, and surreal regions become more common as the player explores farther, deeper, and closer to leylines.                                  |
| World Size                 | Worlds should feel very large and support adjustable world size settings. Default experience can be very large or effectively infinite, while smaller/dense saves remain possible.                |
| Infinite Generation        | Use configurable infinite or semi-infinite generation. A stable central world can support progression and settlements, while outer regions extend procedurally.                                   |
| Beauty vs Gameplay         | Balance beautiful, readable terrain with gameplay function, and allow configurable worldgen presets for players who prefer denser, flatter, harsher, or more dramatic worlds.                     |
| Terrain Drama              | Terrain shape depends heavily on biome: calm meadows, dense forests, harsh swamps, dramatic mountains, deep ravines, magical arches, floating fragments, and corrupted scars can coexist.         |
| Regions                    | Use a combination of named regions, faction territories, climate bands, and biome patches. Biomes are local; regions and cultures provide larger-scale identity.                                  |
| Starting Region            | Default start is wilderness near but not inside civilisation. POC uses a village-adjacent start to teach the core village loop.                                                                   |
| Difficulty Scaling         | Difficulty uses distance, biome, depth, magic intensity, corruption, faction territory, structure type, and world events.                                                                         |
| Continents and Oceans      | Final game supports continents, islands, oceans, coasts, rivers, and coastal civilisations. POC uses rivers/lakes only; oceans are later.                                                         |
| Long-Distance Travel       | Roads, mounts, boats, carts, rails, caravans, waystones, portals, and NPC trade routes are major progression layers.                                                                              |
| Biome Count                | Final game supports 20-30+ biome families, with the system designed to expand far beyond the POC. Version 0.1 maps a broad full-game family list.                                                 |
| Sub-biomes                 | Sub-biomes are generated from temperature, moisture, magic, corruption, altitude, depth, water, ruins, civilisation influence, and faction territory.                                             |
| Rarity and Danger          | Biomes have rarity and danger tiers: common, uncommon, rare, legendary, with magical/corrupted/ancient regions often more dangerous or progression-linked.                                        |
| Biome Families             | Use all major families: natural, magical, corrupted, ancient, underground, dimensional, civilisation-influenced, factional, climate, water, cave, and hybrid biomes.                              |
| Biome Blending             | Biomes blend through layered values rather than hard borders: temperature, moisture, altitude, magic, corruption, civilisation, resource richness, and danger.                                    |
| Starter Biome              | Ideal start is a meadow/plains near forest, river, cave, and village, with clear resources and visible points of interest.                                                                        |
| Starter Resources          | Starter region includes wood, stone, food, copper, iron, and mana crystal hints, without giving the player full magic or automation instantly.                                                    |
| Magical Pockets Near Spawn | Small magical pockets can appear near spawn for mystery and foreshadowing, but dangerous magical regions should remain limited or signposted.                                                     |
| POC Biome Layout           | POC uses a compact valley: two surface biomes and one cave biome, plus river/lake, village, ruin, enemy camp, starter resources, and terrain for automation.                                      |
| Natural Biomes             | Natural biomes are simple in POC but deep in final, with seasons, NPC use, sub-biomes, resource rules, structures, and creature ecology.                                                          |
| Magical Biomes             | Magical biomes are shaped by leylines, ruins, rituals, corruption, gods, ancient machines, dimension leaks, and player action. They affect resources, creatures, villages, machines, and weather. |
| Dynamic Biomes             | Corruption, blessing, civilisation, seasons, disasters, extraction, magic rituals, and player action can change local biome state.                                                                |
| Caves                      | Underground worldgen is a major layered system with cave biomes, depth progression, resources, ruins, monsters, underground cultures, and ancient activity.                                       |
| Water Systems              | Rivers, lakes, waterfalls, coasts, and wetlands affect settlement placement, farming, travel, resources, hydropower, trade, ecology, and landmarks.                                               |
| Resources                  | Resource distribution uses biome, depth, region, magic level, tool gates, NPC trade, large automation deposits, surface clues, grade, and magical purity.                                         |
| Structures                 | Use layered structure density: common minor structures, rare major landmarks, unique biome/culture structures, ruins, faction camps, and dynamic camps.                                           |
| Villages                   | Villages generate from culture, resources, water, roads, danger, faction territory, magic, biome, wealth, and history. Civilisation influence can modify terrain over time.                       |
| Climate and Weather        | Seasons, weather, temperature, disasters, and magical weather should be meaningful but configurable and not annoying.                                                                             |
| Leylines                   | Leylines are a major worldgen and progression system affecting biomes, resources, structures, villages, magic, automation, corruption, and creature spawns.                                       |
| Building and Automation    | Worldgen should balance beautiful terrain with buildable zones, roads, clear deposit locations, transport challenges, bridges, tunnels, supports, and later magic transport.                      |
| Visual Variation           | Use the engine-driven material variation system: block visuals can vary by biome, rarity, state, age, corruption, magic charge, weathering, culture, and village history.                         |
| POC Generation             | POC should use a small procedural valley with controlled spawn rules, not a flat test world or fully chaotic infinite map.                                                                        |
| POC Proof                  | POC must prove that worldgen supports survival, village growth, automation, magic, and threat in useful positions.                                                                                |

# 3. Worldgen System Architecture

World generation should be data-driven from the beginning. The player sees landscapes and landmarks, while the game internally combines seed rules, region layers, biome definitions, sub-biomes, resource rules, structure rules, village rules, creature spawns, dynamic states, and performance LOD.

| **Layer**                 | **Purpose**                                                                                                  | **Examples**                                                                                             |
|---------------------------|--------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------|
| World Profile             | Defines the overall save/world settings and generation preset.                                               | World size, infinite/semi-infinite mode, climate spread, biome density, structure density, danger scale. |
| Region Layer              | Groups multiple biomes into large named zones with identity, danger, factions, climate, and story hooks.     | Greenvale Marches, Ashen Frontier, Frosthold Range, Crystal Borderlands.                                 |
| Climate Layer             | Controls broad temperature and moisture distribution.                                                        | Temperate meadow, dry desert, snowy highlands, humid swamp, coastal wetland.                             |
| Terrain Layer             | Controls altitude, slope, erosion-like shapes, caves, rivers, cliffs, valleys, and landmarks.                | Mountains, river valleys, plateaus, ravines, arches, waterfalls.                                         |
| Biome Layer               | Chooses local terrain, vegetation, palette, animals, resources, and ambience.                                | Riverwood Forest Edge, Hearthplain Meadow, Shimmercap Grotto.                                            |
| Magic Layer               | Tracks mana density, leyline intensity, magical stability, purity, and magical weather potential.            | Leyline nodes, mana crystal pockets, ward-friendly zones, unstable rifts.                                |
| Corruption/Blessing Layer | Tracks dark corruption, divine blessing, cleansing pressure, and spreading hazards.                          | Cursed ground, blighted trees, holy groves, purified ruins.                                              |
| Civilisation Layer        | Tracks villages, roads, farms, outposts, faction territory, trade routes, cleared land, and abandoned sites. | Forest hamlet, dwarven road, goblin camp, ruined village, watchtower road.                               |
| Resource Layer            | Places local resources, hand veins, rich deposits, large automation nodes, surface clues, and purity grades. | Copper seams, iron veins, mana crystals, clay banks, coal pockets, rich iron deposit.                    |
| Structure Layer           | Places ruins, caves, camps, shrines, towers, dungeons, villages, bridges, roads, and landmarks.              | Abandoned rune tower, goblin camp, village well, ruined shrine, cave entrance.                           |
| Creature Spawn Layer      | Defines passive, hostile, magical, raid, cave, nest, and boss spawns.                                        | Herd paths, cave spiders, goblin raid source, wisps near mana pocket.                                    |
| Dynamic State Layer       | Stores what has changed after generation.                                                                    | Burned forest, warded road, corrupted farm, mined deposit, repaired shrine, abandoned village.           |

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr class="header">
<th><p><strong>Important Data Rule</strong></p>
<p>Planning metadata such as POC Required, Alpha, Final Game, Placeholder, and Deferred should remain a design and spreadsheet layer. Shipped worldgen data should stay clean and reusable.</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

# 4. Parent Biome, Region, and Worldgen Data Model

The parent model prevents the biome catalogue from becoming unmanageable. A temperate meadow inherits from BaseBiome, NaturalBiome, TemperateFamily, and MeadowVariant. A corrupted swamp inherits swamp terrain and moisture rules, then adds corruption spread, poison hazards, cursed creature spawns, and cleansing hooks.

| **Parent Class / Data Layer** | **Inherits / Controls**                                                                                               | **Example Children**                                                                   |
|-------------------------------|-----------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------|
| BaseWorldProfile              | Seed settings, world size, generation mode, density sliders, difficulty links, biome weighting, structure weighting.  | Default Survival World, Dense Village World, Harsh Wilderness, Creative Builder World. |
| BaseRegion                    | Name, climate, danger, factions, civilisation density, structure density, magic/corruption weighting, resource rules. | Greenvale Marches, Northfall Range, Sunken Marshlands.                                 |
| BaseBiome                     | Display name, internal ID, category, terrain palette, vegetation, weather, spawns, resources, structures, tags.       | Hearthplain Meadow, Riverwood Forest, Stoneback Highlands.                             |
| NaturalBiome                  | Temperature, moisture, altitude, soil fertility, vegetation families, natural structures, wildlife.                   | Plains, forest, swamp, desert, snowfield.                                              |
| MagicalBiome                  | Mana density, leyline affinity, magical weather, spell/resource interactions, magical creature spawns.                | Crystal Glade, Leyline Meadow, Starfall Grove.                                         |
| CorruptedBiome                | Corruption source, spread rules, cleansing rules, hazards, hostile spawns, village impact.                            | Blightwood, Cursed Fen, Ashrot Plain.                                                  |
| AncientBiome                  | Ruins, relic density, old machines, buried roads, lore fragments, puzzle/gate structures.                             | Ancient Battlefield, Broken Runefield, Lost Roadlands.                                 |
| CaveBiome                     | Depth band, rock layers, cave shape, ore weighting, underground water/lava, cave creatures, ruins.                    | Shallow Stone Caves, Crystal Caves, Deepstone Halls.                                   |
| CivilisedBiome                | Farms, roads, cleared land, walls, outposts, warehouses, culture palette, safety rules.                               | Village Farmland, Warded Road, Fortified Hamlet Zone.                                  |
| DynamicBiomeState             | Runtime change flags, spread values, damage, restoration, overharvesting, extraction, warding, season state.          | Recently Burned, Overharvested, Warded, Cleansed, Corrupted, Reclaimed.                |
| PlanningMetadata              | Document-only fields for planning and scope.                                                                          | POC Required, Alpha, Final Game, Placeholder, Deferred, Balance Draft.                 |

## 4.1 Example Inheritance Chains

| **Example**           | **Inheritance Chain**                                                            | **What It Gains Automatically**                                                                                           |
|-----------------------|----------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------|
| Hearthplain Meadow    | BaseBiome -\> NaturalBiome -\> TemperateFamily -\> MeadowVariant                 | Soft terrain, grasses, low danger, starter herbs, fertile soil, sheep-like fantasy wildlife, village suitability.         |
| Riverwood Forest Edge | BaseBiome -\> NaturalBiome -\> ForestFamily -\> RiverAdjacentVariant             | Tree density, wood families, mushrooms, herbs, wildlife, hidden ruins, river humidity, early lumber resources.            |
| Shallow Stone Cave    | BaseBiome -\> CaveBiome -\> ShallowDepthFamily -\> StoneCaveVariant              | Stone palette, coal/copper/iron weighting, cave entrances, darkness threat, cave spider spawn rules.                      |
| Leyline Crystal Glade | BaseBiome -\> MagicalBiome -\> LeylineFamily -\> CrystalVariant                  | Mana density, mana crystal nodes, wisp spawns, magical weather chance, mana machine boost and instability rules.          |
| Blighted Forest       | BaseBiome -\> NaturalBiome -\> ForestFamily -\> CorruptedBiome -\> BlightVariant | Forest terrain plus corruption spread, hostile spawns, cursed roots, cleansing hooks, village fear and migration effects. |

# 5. World Structure, Seeds, Regions, and Difficulty

The final game should support very large or effectively infinite worlds while still maintaining progression readability. The recommended approach is a layered region system: the world can extend outward procedurally, but starting and central regions use controlled weights so early resources, villages, caves, magic hints, and threats appear in sensible ranges.

## 5.1 Generation Modes

| **Mode**                 | **Purpose**                                | **Notes**                                                                                                 |
|--------------------------|--------------------------------------------|-----------------------------------------------------------------------------------------------------------|
| Standard Living World    | Default survival experience.               | Very large world with controlled central region and procedural extension outward.                         |
| Infinite Frontier        | Minecraft-like long-term exploration.      | Outer regions continue generating with increasing rarity, danger, and strange biomes.                     |
| Large Bounded World      | Performance or story-friendly option.      | Finite map with strong region identity, oceans, faction territories, and complete world-state simulation. |
| Dense Civilisation World | More villages and roads.                   | Good for players who want more NPC interaction and less long-distance wilderness.                         |
| Wild Frontier World      | Fewer villages and harsher travel.         | Good for survival/exploration-focused saves.                                                              |
| Creative Builder World   | Build-friendly terrain and reduced threat. | Useful for relaxed play, testing, or creative construction.                                               |

## 5.2 Difficulty and Danger Layers

Danger should not be controlled by distance alone. Distance from spawn is useful, but biome type, depth, time of day, structures, corruption, faction hostility, world events, weather, and magic density should all matter.

| **Danger Source**   | **Effect**                                                                                              | **Player Counterplay**                                               |
|---------------------|---------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------|
| Distance from Start | Farther regions can unlock rarer biomes, stronger enemies, and more valuable resources.                 | Better gear, travel systems, roads, mounts, maps, caravans.          |
| Biome Type          | Swamps, mountains, deserts, snowfields, and magical zones have different survival and combat pressures. | Preparation, clothing, food, magic, tools, route planning.           |
| Depth               | Deeper caves contain rarer resources and stronger cave threats.                                         | Tool progression, lighting, wards, ropes, elevators, mine supports.  |
| Magic Intensity     | High mana zones improve magic resources but attract magical creatures and instability.                  | Ward lanterns, rune tools, mage support, careful extraction.         |
| Corruption          | Corrupted areas spread hazards, monsters, fear, and village risk.                                       | Cleansing, containment, wards, faction support, reduced overuse.     |
| Faction Territory   | Bandit, goblin, cult, or hostile kingdom territories add raids and patrols.                             | Diplomacy, stealth, military strength, roads, watchtowers, conquest. |
| World Events        | Raids, magical storms, migrations, disasters, caravans, and festivals change local safety.              | Alerts, preparation, defences, storage, quest response.              |

# 6. Biome Categories, Families, Sub-biomes, and Tags

Version 0.1 should map more biome families than the POC can implement. The POC only needs a few, but the data model should already support natural, magical, corrupted, ancient, underground, dimensional, civilisation-influenced, and hybrid biomes.

| **Top-Level Family**    | **Purpose**                                                                        | **Example Biomes**                                                           |
|-------------------------|------------------------------------------------------------------------------------|------------------------------------------------------------------------------|
| Natural Surface         | Readable survival foundation and resource identity.                                | Meadow, plains, forest, mountains, swamp, desert, snowfield, coast.          |
| Magical Surface         | Mana, leylines, magical crops, wisps, magical resources, magical weather.          | Crystal glade, leyline meadow, starfall grove, luminous wetlands.            |
| Corrupted Surface       | World threat, dark magic, hostile spawns, cleansing quests, moral consequences.    | Blightwood, cursed fen, ashrot field, shadow scar.                           |
| Ancient Surface         | Ruins, lost machines, lore, old roads, relics, progression gates.                  | Broken runefield, ancient battlefield, buried city plain.                    |
| Underground             | Mining, cave exploration, depth progression, underground cultures, cave creatures. | Shallow caves, crystal caverns, mushroom caves, lava caves, deepstone halls. |
| Water and Coast         | Travel, fishing, water power, coastal villages, ocean ruins later.                 | River valley, lake basin, marsh edge, coast, reef, ocean shelf.              |
| Civilisation-Influenced | Village growth, farms, roads, walls, trade routes, outposts, faction safety.       | Village farmland, fortified road, mining camp, dwarven road, ruined hamlet.  |
| Dimensional             | Realm-specific terrain, resources, hazards, creatures, and progression.            | Fae realm grove, void wastes, dream shores, infernal basalt fields.          |
| Hybrid                  | Layered combinations generated by magic, culture, corruption, climate, or events.  | Warded forest, corrupted meadow, frozen leyline, civilised swamp edge.       |

## 6.1 Biome Tags

Biome tags should be used heavily. They let resources, creatures, structures, quests, magic, NPC cultures, and automation rules target groups without hardcoding every biome.

| **Tag Type** | **Example Tags**                                                                  | **Used By**                                                    |
|--------------|-----------------------------------------------------------------------------------|----------------------------------------------------------------|
| Climate      | temperate, hot, cold, arid, humid, coastal, alpine                                | Weather, crops, clothing, village preference, creature spawns. |
| Terrain      | flat, rolling, steep, cliff, river, cave, deep, wetland, open                     | Building, villages, roads, automation, structures.             |
| Magic        | low_mana, mana_rich, leyline, unstable, wardable, ritual_site                     | Magic system, mana machines, wards, wisps, rituals.            |
| Danger       | safe_day, dangerous_night, raid_source, corrupted, monster_dense, boss_region     | Creatures, villages, alerts, difficulty.                       |
| Civilisation | village_suitable, road_suitable, farmland, mining_camp, faction_border, abandoned | Village system, structures, NPC trade routes.                  |
| Resources    | copper_common, iron_deep, clay_bank, mana_hint, crystal_node, rich_deposit        | Resource generation, prospecting, automation deposits.         |
| Structure    | ruin_common, shrine_possible, cave_entrance, goblin_camp_possible, ancient_road   | Landmark and POI placement.                                    |
| Visual       | mossy, snowy, dusty, corrupted, glowing, aged, culture_variant                    | Engine-driven block and material variation.                    |

# 7. Biome Layer Model

Biomes should emerge from overlapping values rather than a single random pick. This keeps borders natural, supports hybrid areas, and allows magic, corruption, civilisation, and player action to mutate the world without regenerating it from scratch.

| **Layer Value**        | **Meaning**                                                           | **Gameplay Use**                                                             |
|------------------------|-----------------------------------------------------------------------|------------------------------------------------------------------------------|
| Temperature            | Cold, temperate, warm, hot.                                           | Snow, desert, crop types, clothing, weather, creature families.              |
| Moisture               | Dry, normal, wet, flooded.                                            | Forests, swamps, rivers, crops, mud, herbs, disease, water power.            |
| Altitude               | Lowlands, hills, highlands, peaks.                                    | Mountains, ore exposure, snowline, cliffs, wind power, structure visibility. |
| Slope and Buildability | Flatness, cliffs, ravines, valleys, terraces.                         | Villages, player builds, roads, automation lines, bridges, tunnels.          |
| Depth                  | Surface, shallow cave, deep cave, abyssal/realm-adjacent.             | Ore tiers, cave monsters, ancient ruins, underground settlements.            |
| Magic Density          | Ambient mana value and local mana saturation.                         | Mana resources, magical spawns, machine boosts, instability, magic crops.    |
| Leyline Intensity      | Static world energy paths and nodes.                                  | Leyline biomes, rituals, late-game machines, portals, city-scale magic.      |
| Corruption             | Dark or unstable world-state pressure.                                | Spread, hostile spawns, village fear, cleansing, forbidden resource risk.    |
| Blessing/Purity        | Protective or divine stabilising pressure.                            | Safe zones, shrines, healing, spirit events, morale, crop protection.        |
| Civilisation Influence | Cleared land, roads, farms, walls, patrols, industry, culture style.  | Village growth, safety, trade, visual changes, structure expansion.          |
| Resource Richness      | Local deposit quality and extraction potential.                       | Mining, trade, settlement type, automation, faction interest.                |
| Danger Pressure        | Combined threat from creatures, camps, corruption, events, and depth. | Spawn rate, raids, NPC migration, difficulty, rewards.                       |

# 8. Starter Region and POC Valley

The starting experience must be readable without being sterile. The ideal final-game start is a meadow or plains near forest, water, cave access, and signs of civilisation, but not always inside a village. The POC should be more controlled so the core loop can be tested reliably.

| **Starter Requirement** | **Final Game Rule**                                                                 | **POC Rule**                                                                   |
|-------------------------|-------------------------------------------------------------------------------------|--------------------------------------------------------------------------------|
| Spawn Location          | Wilderness near civilisation, with optional village-start setting.                  | Spawn within walking distance of the forest hamlet.                            |
| Surface Biomes          | Safe or moderate starter biomes with clear resources.                               | Hearthplain Meadow plus Riverwood Forest Edge.                                 |
| Cave Access             | Nearby but not forced; visible clues guide the player.                              | One Shallow Stone Cave with copper, iron, coal, crystal hints.                 |
| Water                   | River, lake, pond, or coast depending on world seed.                                | Small river or lake supports village, farms, future waterwheel power.          |
| Resources               | Wood, stone, food, copper, iron, coal/clay/sand, and mana hints within early reach. | All core POC resources within the valley or shallow cave.                      |
| Village                 | Nearby, distant, hidden, or optional depending on setting.                          | One forest hamlet with warehouse, request board, watchtower project.           |
| Magic Foreshadowing     | Small magical pocket or ruin may appear near spawn.                                 | One magical ruin and small mana crystal pocket/wisp area.                      |
| Threat                  | Night threats and local camps scale with difficulty.                                | One goblin camp positioned as raid source against the hamlet.                  |
| Build Space             | Terrain should offer buildable spaces without being flat everywhere.                | Meadow terraces and riverbank clearing support first base and automation line. |

## 8.1 POC Valley Topology

The POC valley should be compact enough for testing but shaped enough to prove terrain decisions. It should contain a readable path from spawn to village, from village to cave, from cave to mana hint/ruin, and from goblin camp to raid approach.

- Central meadow: safe starter space, village farmland, basic food, clay/sand pockets, building area.

- Forest edge: wood, herbs, mushrooms, wildlife, hidden ruin approach, early danger at night.

- River/lake: water source, fishing, future waterwheel site, village placement logic.

- Shallow cave: stone, coal, copper, iron, crystal hint, cave spider/crystal crawler pressure.

- Mana pocket: small glowing side chamber or ruin-adjacent glade with mana crystals and wisp spawn.

- Goblin camp: visible but separated by terrain; source for the POC raid event.

- Village road/path: connects village, forest, cave, and camp approach, proving roads and AI pathing.

# 9. Natural Biomes

Natural biomes should remain important throughout the game. Magical zones are exciting, but the grounded natural world makes survival, villages, resource identity, farms, roads, hunting, and exploration readable.

| **Biome Family**        | **Role**                                                                         | **System Links**                                                                |
|-------------------------|----------------------------------------------------------------------------------|---------------------------------------------------------------------------------|
| Meadows and Plains      | Safest starter and farming terrain, strong buildability, village suitability.    | Food, livestock, villages, farms, roads, early building, raids at night.        |
| Forests                 | Wood, herbs, wildlife, hidden ruins, mushrooms, ambush danger, culture identity. | Lumber, hunting, nature magic, forest hamlets, bandits/goblins, hidden shrines. |
| Deep Forests            | Denser, darker, more magical or dangerous forest variant.                        | Fae events, monster nests, rare herbs, lost ruins, nature cultures.             |
| Mountains and Highlands | Ore, stone, cliffs, weather danger, caves, dwarven/fortress hooks.               | Mining, wind power, rare metals, vertical travel, roads, tunnels, watchtowers.  |
| Deserts and Drylands    | Harsh survival, glass/sand, ruins, trade routes, nomad cultures.                 | Heat, water planning, buried ruins, caravans, rare salts, ancient cities.       |
| Swamps and Wetlands     | Alchemy, disease/poison, spirits, monster nests, hidden settlements.             | Herbs, mud, peat, witch/shaman magic, water routes, corruption risk.            |
| Snowfields and Tundra   | Cold survival, frost magic, isolated settlements, rare creatures.                | Temperature gear, ice, snow blocks, fur, mountain forts, winter events.         |
| Coasts and Islands      | Fishing, ship travel, coastal villages, sea ruins, ocean expansion later.        | Food, trade, boats, weather, coastal culture, ocean dungeons.                   |
| Rivers and Lakes        | Settlement placement, farming, fishing, travel, water power, landmarks.          | Waterwheels, irrigation, village wells, bridge projects, water creatures.       |
| Volcanic Lands          | Heat, lava, rare minerals, danger, forge culture, infernal hints.                | High-tier ores, fire magic, obsidian, lava hazards, forge rituals.              |

## 9.1 Natural Biome Rules

- Natural biomes can have magical variants, but their base version should remain readable and useful.

- Each natural biome should support at least one resource identity, one structure identity, one creature identity, and one village/culture possibility.

- Common natural biomes should not all feel safe. Safety depends on light, roads, patrols, weather, camps, and time of day.

- Natural biomes should produce many of the resources older materials need to stay useful: wood, stone, clay, fibre, food, herbs, hides, coal, sand, and basic ores.

# 10. Magical, Ancient, Corrupted, and Hybrid Biomes

Magical and corrupted biomes should be memorable because they change how the game behaves. They should affect resources, creature spawns, village behaviour, machine performance, magical weather, rituals, corruption, and structure placement.

| **Biome Type**          | **Creation Sources**                                                     | **Gameplay Effects**                                                                                 |
|-------------------------|--------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------|
| Leyline Biome           | Strong leyline path or node.                                             | Mana resources, mana machine boost, wisp spawns, ritual sites, instability if overused.              |
| Crystal Biome           | Mana-rich stone, ancient crystal growth, underground/surface seepage.    | Mana crystals, crystal crawlers, magical light, purity grades, mana furnace chain.                   |
| Fae-Touched Biome       | Fae realm leak, ancient grove, nature magic concentration.               | Living wood, trickster events, illusion hazards, unusual crops, fae structures.                      |
| Spirit/Blessed Biome    | Shrines, divine/spirit magic, ancestor sites, restored land.             | Safe zones, morale boosts, healing, spirit NPCs, sacred resources, anti-corruption pressure.         |
| Corrupted Biome         | Dark ritual, cursed ruin, void leak, necromancy, monster nest, overuse.  | Hostile spawns, spread, village fear, corrupted resources, cleansing quests.                         |
| Ancient Biome           | Lost civilisation, old roads, buried machines, war scars, rune collapse. | Ruins, relics, research notes, ancient machines, puzzles, structure-linked recipes.                  |
| Dimensional Leak Biome  | Unstable portal, realm tear, failed ritual, boss event.                  | Realm materials, unique hazards, portal quests, stronger creatures, temporary or permanent mutation. |
| Civilised Magical Biome | Villages, wards, shrines, mage towers, mana infrastructure.              | Warded roads, safer farms, magic economy, mage NPC jobs, magical building palettes.                  |
| Hybrid Transition Biome | Border between climate/magic/corruption/civilisation layers.             | Mixed resources, unusual spawns, visual variation, small anomalies, player warning zones.            |

## 10.1 Magical Biome Spread and Player Alteration

Not all magical biomes should spread. Some are stable, some shrink if resources are drained, some spread through events, and corrupted biomes can become major world threats. Player rituals, machines, settlements, and cleansing projects can create or alter magical biome states, but this should require major investment and have consequences.

| **State**            | **Spread Rule**                                                         | **Counterplay / Use**                                                         |
|----------------------|-------------------------------------------------------------------------|-------------------------------------------------------------------------------|
| Stable Magic         | Does not spread; tied to a fixed leyline, shrine, or crystal formation. | Safe resource extraction, ritual site, village magic support.                 |
| Unstable Magic       | May fluctuate during storms, overuse, or rituals.                       | Stabilisers, wards, mage support, reduced extraction.                         |
| Corruption           | Can spread through monsters, cursed structures, rituals, or events.     | Cleansing, containment walls, wards, firebreaks, faction quests.              |
| Blessing             | Spreads slowly around shrines, restored ruins, or strong village faith. | Protects villages, reduces corruption, improves morale and healing.           |
| Drained Magic        | Magic-rich area weakens if heavily extracted without renewal.           | Leyline regulators, ritual renewal, lower machine draw.                       |
| Player-Created Biome | Created by late-game rituals or machines.                               | Powerful but expensive; affects factions, creatures, resources, and villages. |

# 11. Caves and Underground Biomes

Caves should be more than mining tunnels. They are the deep exploration layer: resource gates, monster pressure, ruins, hidden cultures, magical pockets, underground rivers, and ancient machine sites.

| **Depth Band**        | **Expected Content**                                                                  | **Progression Role**                                |
|-----------------------|---------------------------------------------------------------------------------------|-----------------------------------------------------|
| Surface and Sinkholes | Visible cave mouths, exposed stone, copper hints, small creature nests.               | Teaches cave danger and prospecting.                |
| Shallow Caves         | Stone, coal, copper, early iron, mushrooms, underground water, cave spiders.          | POC cave layer and early mining.                    |
| Mid Caves             | Richer iron, gems, underground ruins, larger creatures, lava pockets, fungal forests. | Mid-game mining and dungeon access.                 |
| Deepstone             | Steel-tier resources, dangerous creatures, ancient roads, underground settlements.    | Mid/late progression and faction hooks.             |
| Crystal Caverns       | Mana crystals, magical purity grades, wisps, crystal crawlers, rune ruins.            | Magic infrastructure and mana resource progression. |
| Mushroom Caverns      | Food, spores, alchemy, strange livestock, underground villages.                       | Sustainability and alchemy branch.                  |
| Lava and Forge Depths | Heat, rare minerals, obsidian, forge ruins, fire creatures.                           | High-tier smelting, fire magic, forge culture.      |
| Realm-Adjacent Depths | Void cracks, dream stone, ancient portals, unstable gravity or reality.               | Late-game dimension progression.                    |

## 11.1 Underground Civilisations

Underground settlements are not required for the POC, but the worldgen system should support them. Dwarven holds, goblin warrens, buried cities, mushroomfolk colonies, ancient machine vaults, and necromancer catacombs can all use cave biome rules plus culture/faction placement rules.

# 12. Water, Rivers, Coasts, and Terrain Landmarks

Water should be a worldgen backbone. Rivers and lakes guide settlement placement, farming, trade routes, fishing, hydropower, erosion-style terrain, bridges, roads, and creature ecology. Oceans and coasts become major expansion systems later.

| **Feature**       | **Gameplay Role**                                                               | **POC Status**             |
|-------------------|---------------------------------------------------------------------------------|----------------------------|
| River             | Guides travel, supports farms, water wheels, bridges, fishing, villages, roads. | Required.                  |
| Lake or Pond      | Fishing, reeds, clay/sand banks, herbs, small shrine/ruin, wildlife.            | Recommended.               |
| Waterfall         | Landmark, hydropower site, cave entrance clue, scenic identity.                 | Optional POC landmark.     |
| Wetland Edge      | Alchemy herbs, mud/clay, insects, poison risk, hidden paths.                    | Deferred unless simple.    |
| Coast             | Fishing, boats, coastal settlements, ship travel, ocean ruins.                  | Alpha/final, not POC.      |
| Ocean             | Long-distance travel, islands, sea monsters, ocean biomes, trade, ship systems. | Later expansion.           |
| Underground River | Cave navigation, hidden routes, rare resources, cave settlements.               | Alpha/final.               |
| Magical Spring    | Mana water, healing, shrine, spirit event, ritual resource.                     | Optional POC magical hint. |

## 12.1 Memorable Landmarks

Worldgen should intentionally create memorable landmarks. They help navigation, make worlds shareable, and give players natural goals. Landmarks should be biome-dependent rather than randomly spammed everywhere.

- Natural landmarks: cliffs, waterfalls, arches, giant trees, ravines, hot springs, peaks, lakes, canyons.

- Magical landmarks: glowing crystal spires, leyline scars, floating stones, mana springs, shimmering groves.

- Civilisation landmarks: roads, bridges, watchtowers, old walls, shrines, mills, abandoned farms.

- Threat landmarks: goblin banners, monster nests, bone fields, corrupted trees, smoke from raider camps.

- Progression landmarks: cave entrances, ancient doors, rune towers, old mines, portal ruins.

# 13. Resources, Ores, Deposits, and Prospecting

Resources should be placed through a structured progression system. Random ore pockets are useful, but the final game also needs biome-specific resources, depth rules, large automation deposits, surface clues, grades, magical purity, and trade alternatives.

| **Resource Rule**        | **Locked Direction**                                                                     | **Example**                                                                         |
|--------------------------|------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------|
| Biome and Depth          | Resources depend on biome, depth, region, and magic level.                               | Copper in hills and shallow caves; iron deeper or in mountain foothills.            |
| Surface Clues            | Players can learn to prospect from environmental hints.                                  | Rust stains for iron, green mineral streaks for copper, glowing moss for mana.      |
| Ore Grades               | Poor, normal, and rich grades affect yield and by-products.                              | Rich iron vein gives more raw ore and higher chance of useful slag.                 |
| Magical Purity           | Mana resources track purity and instability.                                             | Pure mana crystal improves wards; unstable crystal risks corruption or overload.    |
| Hand Veins               | Small veins support manual mining and early progression.                                 | Starter copper and iron in shallow cave.                                            |
| Automation Deposits      | Large deposits support long-term machine extraction.                                     | Large iron node near mountain foothills, requiring trust/route/defence.             |
| Biome-Specific Materials | Many resources have preferred biomes, but alternatives should exist.                     | Swamp herbs from swamps, but village trade can substitute later.                    |
| Trade Bypass             | NPCs and trade routes can provide distant biome resources.                               | Desert glass, dwarven steel, forest herbs, coastal salt.                            |
| Resource Depletion       | Local depletion can affect villages slowly and abstractly.                               | A hamlet runs low on nearby timber and requests player lumber or trade access.      |
| Renewable Magic          | Some magical resources are finite, some renewable through leylines or rituals but risky. | Mana crystals are finite; leyline extraction is renewable but can destabilise land. |

## 13.1 POC Resource Placement

| **Resource**      | **Biome / Location**                        | **Purpose**                                                     |
|-------------------|---------------------------------------------|-----------------------------------------------------------------|
| Wood              | Riverwood Forest Edge                       | Tools, planks, chests, village repairs, early crafting.         |
| Stone             | Meadow outcrops and shallow cave            | Tools, furnace, building blocks, village watchtower foundation. |
| Clay              | Riverbank/lake edge                         | Bricks, pottery, simple building, future pipes.                 |
| Sand              | Riverbank/lake edge                         | Glass and construction support.                                 |
| Coal              | Shallow cave                                | Fuel for furnace, torch production, early industry.             |
| Copper            | Shallow cave and hillside clue              | Early mechanisms, chutes, basic automation parts.               |
| Iron              | Deeper shallow cave pocket                  | First settlement support chain and watchtower/guard supply.     |
| Mana Crystal Hint | Small crystal pocket or ruin-adjacent glade | Basic rune, mana furnace, ward lantern/stone, magic tutorial.   |
| Food/Fibre        | Meadow, forest edge, village farms          | Survival, NPC needs, basic crafting, livestock/farming hook.    |

# 14. Structures, Landmarks, Camps, Ruins, and Roads

Structures should be placed through biome, culture, faction, terrain, and danger rules. The world should contain common minor discoveries, rare major landmarks, dynamic enemy camps, ruins that unlock knowledge, and roads that reveal civilisation.

| **Structure Type**       | **Worldgen Rule**                                                               | **Gameplay Role**                                                                     |
|--------------------------|---------------------------------------------------------------------------------|---------------------------------------------------------------------------------------|
| Minor Natural POI        | Common; biome-specific.                                                         | Foraging, small loot, navigation, ambience.                                           |
| Ruins                    | Moderate/rare; linked to ancient, magical, or civilisation layers.              | Lore, recipe hints, magic unlocks, puzzles, danger, relics.                           |
| Enemy Camps              | Generated near roads, villages, caves, or faction territory.                    | Raid source, loot site, threat pressure, village safety target.                       |
| Villages                 | Generated from water, resources, roads, culture, danger, and faction territory. | Civilisation hub, quests, storage, trade, growth.                                     |
| Roads                    | Connect villages, outposts, bridges, mines, and trade sites.                    | Navigation, trade routes, NPC travel, raid routes, infrastructure.                    |
| Shrines and Ritual Sites | Linked to magic, culture, leylines, spirits, or ancient ruins.                  | Blessing, healing, magic unlocks, cleansing, events.                                  |
| Caves and Mines          | Placed by terrain/resource rules and civilisation history.                      | Mining, monsters, lost workers, dwarven/goblin hooks.                                 |
| Major Landmarks          | Rare; region-defining.                                                          | Long-term goals, story anchors, bosses, faction identity, screenshots.                |
| Abandoned Settlements    | Generated initially or produced by world events.                                | Rebuild quests, ruins, refugees, haunted sites, faction history.                      |
| Dynamic Structures       | Change through simulation.                                                      | Camps grow, roads break, villages expand, ruins are restored, outposts are conquered. |

## 14.1 Structure Density Rule

Use layered density: common minor POIs keep exploration rewarding, while rare major landmarks remain special. Biomes and regions should strongly affect density so a ruined kingdom feels different from untouched wilderness or a trade-road corridor.

# 15. NPC Villages, Culture, Territory, and Civilisation Influence

Village generation should be part of world simulation rather than random placement. A culture chooses where it can survive, what it can build with, what resources it values, and what dangers it must handle.

| **Village Placement Factor** | **Effect on Generation**                                                           | **Example**                                                |
|------------------------------|------------------------------------------------------------------------------------|------------------------------------------------------------|
| Culture/Race                 | Determines preferred biomes, building materials, layout, jobs, magic, and economy. | Forest hamlet uses timber, herbs, hunting, nature shrines. |
| Water Access                 | Supports farms, wells, animals, cooking, trade, and hygiene.                       | Village near river bend or spring.                         |
| Local Resources              | Shapes jobs, projects, trade goods, and settlement wealth.                         | Iron-rich hills produce mining outposts and blacksmiths.   |
| Flat/Buildable Terrain       | Affects building footprint, roads, walls, farms, and blueprint placement.          | Meadow terraces support farms and watchtower.              |
| Road Access                  | Improves trade, migration, defence, faction control, and discovery.                | Old road between hamlet and mine.                          |
| Danger Pressure              | High danger reduces villages or increases fortification.                           | Goblin territory creates palisades and watchtowers.        |
| Magic Density                | Affects mage buildings, wards, rituals, culture stories, and magical economy.      | Leyline village has ward lanterns and mana requests.       |
| Faction Territory            | Controls style, laws, enemies, trade access, and conflict.                         | Border hamlet requests guard supplies and road patrols.    |
| History                      | Adds ruins, abandoned districts, old walls, shrines, or previous destruction.      | Abandoned watchtower near current hamlet.                  |

## 15.1 Civilisation Influence Layer

Civilisation influence should gradually modify terrain: roads appear, forest edges are cleared, farms expand, mines open, walls are built, wards light roads, warehouses are added, and damaged areas are repaired. This layer should be visible but not instantly overwrite the natural biome.

| **Influence Level** | **Visible Changes**                                                 | **System Changes**                                                          |
|---------------------|---------------------------------------------------------------------|-----------------------------------------------------------------------------|
| Wild                | No roads, dense vegetation, unclaimed resources.                    | Higher wildlife/monster presence, low NPC safety.                           |
| Visited             | Footpaths, camps, signs, small clearings.                           | Travellers, hunters, minor trade, rumours.                                  |
| Settled             | Farms, wells, houses, small roads, storage.                         | NPC jobs, resource consumption, village needs.                              |
| Fortified           | Walls, watchtowers, patrols, lit roads, repaired bridges.           | Lower local spawns, stronger raid defence, trade stability.                 |
| Industrial/Magical  | Mines, mills, chutes, mana conduits, ward stones, warehouses.       | Automation supply, magic infrastructure, resource strain, faction interest. |
| Ruined/Abandoned    | Damaged buildings, overgrowth, rubble, burned fields, broken roads. | Loot, ghosts/monsters, rebuild quests, refugee history.                     |

# 16. Climate, Weather, Seasons, and Disasters

Weather and seasons should make the world feel alive without becoming constant irritation. They can affect crops, travel, combat, machines, magic, mobs, NPC behaviour, and resources, but difficulty/world settings should control intensity.

| **System**        | **Normal Gameplay Role**                                                       | **Difficulty / Setting Notes**                                             |
|-------------------|--------------------------------------------------------------------------------|----------------------------------------------------------------------------|
| Seasons           | Affect crops, wildlife, festivals, weather, some resources, and village needs. | Full seasonal system in final; simplified or visual-only settings allowed. |
| Rain              | Helps crops, affects visibility, water collection, some mobs, some machines.   | Reduced annoyance through clear feedback and settings.                     |
| Storms            | Danger, wind power boost, lightning risk, travel penalty, creature behaviour.  | Harsh settings add structure damage or more intense danger.                |
| Snow              | Cold pressure, visual change, tracks, ice resources, blocked routes.           | Temperature impact configurable.                                           |
| Heatwaves         | Desert/dryland pressure, water/food spoilage, crop stress.                     | Mostly biome-specific, not constant global punishment.                     |
| Magical Weather   | Leyline surges, mana rain, corruption fog, spirit aurora, dream mist.          | Tied to leylines, corruption, dimensions, rituals, and major events.       |
| Natural Disasters | Rare world events: flood, wildfire, cave-in, blizzard, sandstorm.              | Mostly quest/event-driven; not random griefing.                            |
| Magical Disasters | Rift storm, mana overload, corruption bloom, cursed fog.                       | Linked to risky magic, ancient sites, bosses, or world state.              |

## 16.1 Temperature Rule

Temperature should matter mainly in extreme biomes and should be solved through gear, shelter, food, magic, roads, and preparation. It should add planning, not punish casual exploration every few seconds.

# 17. Leylines, Mana Density, and Magical Weather

Leylines are a major worldgen and progression system. They are static world-energy paths that influence biomes, resources, structures, villages, magic, automation, corruption, and creature spawns.

| **Leyline Feature**    | **Effect**                                                                         | **Risk / Constraint**                                       |
|------------------------|------------------------------------------------------------------------------------|-------------------------------------------------------------|
| Leyline Path           | Raises mana density along a hidden or partially visible world path.                | May attract magical creatures or unstable weather.          |
| Leyline Node           | Major power point for rituals, villages, machines, portals, and rare structures.   | Highly contested by factions and dangerous events.          |
| Mana Pocket            | Small local mana concentration.                                                    | Good POC magic hint; limited power and resources.           |
| Visible Signs          | Glowing grass, crystal veins, floating motes, strange vegetation, hum, aurora.     | Should be readable without revealing all data instantly.    |
| Magic Tool Reveal      | Survey lens, rune tool, mage spell, or map reveals precise leyline values.         | Mid/late progression utility.                               |
| Machine Interaction    | Boosts mana machines, furnaces, wards, batteries, and conduits.                    | Overuse can destabilise the area.                           |
| Village Interaction    | Supports mage buildings, warded roads, rituals, magical economy, cultural stories. | May attract raids, cults, or magical storms.                |
| Corruption Interaction | High magic can feed or resist corruption depending on purity and stabilisation.    | Requires cleansing, warding, and careful extraction.        |
| Portal Interaction     | Late-game portals and dimension gates prefer strong leyline nodes.                 | Portal logistics are powerful but risky and late-game only. |

## 17.1 Leyline Visibility

Leylines should be both visible as landmarks and hidden as values. Early players can notice strange terrain, while later tools reveal exact paths, intensities, and stability levels.

# 18. Dynamic Biomes, Corruption, Cleansing, and Player Alteration

Worldgen does not end after the seed creates the map. The world should store local biome state changes caused by seasons, events, villages, player extraction, magic, corruption, blessing, war, raids, fire, and restoration.

| **Dynamic State** | **Cause**                                                         | **Gameplay Consequence**                                                         |
|-------------------|-------------------------------------------------------------------|----------------------------------------------------------------------------------|
| Overharvested     | Too much wood/herb/animal resource extraction.                    | Lower resource regrowth, village concern, trade demand, visual thinning.         |
| Mined Out         | Hand mining or automated extraction depletes local veins.         | Need deeper mining, trade, large deposits, or new region.                        |
| Industrialised    | Machines, roads, warehouses, mills, extraction sites.             | Higher output, lower natural feel, faction attention, possible instability.      |
| Mana-Drained      | Heavy mana extraction without renewal.                            | Reduced magic resources, weaker wards, unstable creatures, village mage concern. |
| Corrupted         | Dark events, forbidden magic, monsters, cursed ruins, void leaks. | Hostile spawns, spreading hazards, fear, migration, cleansing quests.            |
| Cleansed          | Player/NPC rituals, shrines, wards, restoration projects.         | Reduced corruption, safer roads, better morale, spirit events.                   |
| Blessed/Warded    | Shrines, ward stones, divine/spirit magic, village projects.      | Safer zone, reduced magical threats, improved NPC morale.                        |
| Burned/Damaged    | Fire, raids, disaster, dragon/fire creature event later.          | Rubble, ash resources, rebuilding, reduced wood, dangerous visibility.           |
| Reclaimed         | NPCs or player rebuild ruined/abandoned site.                     | New settlement, restored trade route, reputation gain, story unlock.             |
| Seasonal          | Time of year.                                                     | Crop availability, snow cover, animal migration, weather, festivals.             |

## 18.1 Automation Consequences

Player automation can alter biomes through fantasy-themed consequences such as noise, terrain scars, mana drain, leyline stress, smoke, waste, corruption risk, water diversion, and faction concern. These consequences should be configurable and carefully balanced so automation remains satisfying rather than annoying.

# 19. Building, Automation, Roads, and Terrain Practicality

Worldgen should support large player builds and automation without making the world flat and boring. The ideal terrain creates choices: build in a safe meadow, carve into hills, bridge across rivers, tunnel through mountains, or later solve logistics with magic.

| **Need**             | **Worldgen Support**                                                      | **Player Tools / Progression**                                            |
|----------------------|---------------------------------------------------------------------------|---------------------------------------------------------------------------|
| Starter Building     | Meadows, village edges, river terraces, forest clearings.                 | Block-by-block building, simple flattening, basic tools.                  |
| Village Expansion    | Buildable plots, roads, farms, walls, clear project sites.                | NPC builders, blueprints, supply crates, staged construction.             |
| Automation Lines     | Resource nodes placed near routeable terrain but not always trivial.      | Chutes, belts, supports, bridges, tunnels, roads, rails, conduits.        |
| Roads and Trade      | Natural passes, river crossings, low-slope corridors, old roads.          | Road building, bridge projects, patrols, waystones, carts.                |
| Water/Wind Power     | Rivers, waterfalls, windy ridges, open plains.                            | Water wheels, windmills, shafts, power transmission.                      |
| Large Deposits       | Strategic deposit sites with build space and danger trade-offs.           | Mining camps, defences, warehouse permissions, transport planning.        |
| Late Magic Logistics | Leyline nodes, ritual sites, portal-compatible landmarks.                 | Mana conduits, waystones, portals, golem hauling, leyline infrastructure. |
| Creative Builds      | World setting can increase flat land, lower threat, and simplify terrain. | Configurable builder-friendly generation.                                 |

## 19.1 Blueprint and NPC Construction Support

Biome and terrain data should expose buildability values so blueprint placement and NPC-assisted construction can make useful decisions. NPC builders can clear small vegetation, place scaffolds, reserve resources, prepare sites, and gradually build project stages.

# 20. Visual Style, Block Variation, and Material Rules

Biome visuals should use the locked engine-driven, data-driven material variation approach. A block remains readable as itself, but its appearance can shift based on biome, rarity, state, magic, corruption, weathering, age, damage, and culture.

| **Variation Source** | **Visual Effect**                                                             | **Gameplay Use**                                               |
|----------------------|-------------------------------------------------------------------------------|----------------------------------------------------------------|
| Biome                | Colour tint, moss, dryness, snow, dust, local stone pattern, grass tone.      | Makes regions readable while preserving block identity.        |
| Rarity               | Subtle glow, sparkle, richer veins, icon/border variation for rare materials. | Helps identify rare materials without visual noise.            |
| State                | Wet, dry, cracked, powered, lit, blocked, active, overloaded.                 | Immediate feedback for machines, weather, and hazards.         |
| Age/Weathering       | Moss, erosion, soot, rust, faded wood, cracked stone.                         | World history, old roads, ruins, abandoned settlements.        |
| Corruption           | Dark veins, sickly glow, thorns, ash, warped texture, particles.              | Warning, threat identity, cleansing feedback.                  |
| Magic Charge         | Rune pulse, mana glow, floating motes, crystal shine.                         | Mana networks, wards, leyline intensity, magic infrastructure. |
| Culture              | Local palette, carved patterns, banners, roof colour, trim materials.         | Village identity, faction territory, resource availability.    |
| Damage/Repair        | Scorch marks, rubble, broken walls, scaffold, fresh repair patches.           | Raid consequences, village recovery, construction progress.    |

## 20.1 Readability Rule

Visual variation should never make a block impossible to identify. A mossy stone block, snowy stone block, and corrupted stone block should still read as stone. Inventory icons may show base identity first, with tags or overlays showing biome/state variation where needed.

# 21. Spawning, Ecology, Creature, and Threat Rules

Creature spawns should be biome-aware and world-state-aware. A forest edge should have different wildlife and threats than a cave, swamp, leyline glade, goblin camp, or corrupted ruin. Village safety should modify local spawns, but not erase all danger.

| **Spawn Factor**  | **Effect**                                                                                              |
|-------------------|---------------------------------------------------------------------------------------------------------|
| Biome Family      | Controls base wildlife, livestock suitability, hostile types, magical creatures, ambient life.          |
| Time and Light    | Day/night changes, torch safety for basic threats, wards for magical/corruption threats.                |
| Structure Source  | Camps, nests, ruins, caves, dungeons, shrines, and portals can act as local spawn sources.              |
| Village Safety    | Lights, guards, walls, towers, patrols, wards, and cleanliness reduce local danger.                     |
| Faction Territory | Goblins, bandits, cults, undead, or other enemies spawn through territory/camp logic.                   |
| Magic Density     | Wisps, elementals, magical variants, and mutated creatures appear in high-magic areas.                  |
| Corruption        | Increases corrupted creatures, undead, blight beasts, fear, and village risk.                           |
| Weather/Season    | Migration, storm creatures, winter predators, spring livestock, magical weather spawns.                 |
| Player Activity   | Noise, wealth, machines, mana leakage, raids, overharvesting, or forbidden magic can attract threats.   |
| Difficulty        | Controls spawn rate, aggression, raid size, block damage, NPC death, boss mechanics, corruption spread. |

# 22. Simulation LOD, Performance, Multiplayer, and World Settings

The world should feel alive without simulating every block, creature, machine, and village at full detail everywhere. The answer is layered simulation LOD.

| **LOD Level**        | **Simulation Detail**                                                                  | **Examples**                                                      |
|----------------------|----------------------------------------------------------------------------------------|-------------------------------------------------------------------|
| Local Detailed       | Full terrain, block states, visible items, NPC movement, creatures, machines, combat.  | Player near village, cave, factory, raid, or building site.       |
| Nearby Simplified    | Reduced tick rate, summarised item movement, basic NPC schedules, local danger checks. | Nearby village while player explores forest edge.                 |
| Regional Abstract    | Resource totals, threat values, event rolls, project progress, trade route state.      | Distant villages, faction regions, large deposits.                |
| Dormant Stored State | No active sim; stores last state, timers, and pending events.                          | Far-away unloaded cave or structure.                              |
| Event Catch-Up       | When revisited, resolves elapsed events with readable summaries.                       | Village grew, road was damaged, camp expanded, harvest completed. |

## 22.1 World Settings

| **Setting**            | **Options / Range**                        | **Purpose**                                                           |
|------------------------|--------------------------------------------|-----------------------------------------------------------------------|
| World Size             | Small, medium, large, infinite/frontier.   | Supports different hardware and playstyles.                           |
| Biome Density          | Sparse, normal, dense, chaotic, realistic. | Controls how often biome families change.                             |
| Village Density        | None, rare, normal, dense.                 | Supports wilderness or civilisation-heavy games.                      |
| Structure Density      | Low, normal, high.                         | Controls exploration frequency.                                       |
| Threat Intensity       | Peaceful, relaxed, normal, harsh.          | Scales spawns, raids, damage, corruption.                             |
| Biome Consequences     | Off, light, normal, harsh.                 | Controls overharvesting, pollution, mana drain, spread.               |
| Season Impact          | Visual, light, normal, harsh.              | Controls weather/crop/temperature pressure.                           |
| Magic Intensity        | Low fantasy, normal, high magic, chaotic.  | Controls magical biome and mana pocket frequency.                     |
| Build-Friendly Terrain | Normal, more flats, dramatic, creative.    | Improves experience for builders without changing core game identity. |
| POC/Test Profile       | Controlled valley.                         | For prototype and regression testing.                                 |

# 23. Proof-of-Concept Worldgen Scope

The POC should not attempt to prove the whole world. It should prove that one compact procedurally generated valley can reliably place the core systems in useful positions.

| **POC Feature**            | **Required?**     | **Purpose**                                                                                    |
|----------------------------|-------------------|------------------------------------------------------------------------------------------------|
| Procedural Valley Profile  | Yes               | Tests seed-based terrain with controlled landmark placement.                                   |
| Two Surface Biomes         | Yes               | Hearthplain Meadow and Riverwood Forest Edge support starter play and wood/food/herb identity. |
| One Cave Biome             | Yes               | Shallow Stone Cave supports mining, danger, copper/iron/coal, and mana hint.                   |
| River/Lake                 | Yes               | Supports village placement, farms, water resource, future hydropower, bridge/road logic.       |
| NPC Hamlet                 | Yes               | Central POC civilisation target with warehouse and watchtower project.                         |
| Cave Entrance              | Yes               | Connects starter terrain to resource progression.                                              |
| Magical Ruin / Mana Pocket | Yes               | Introduces magic resource, wisp, rune/mana furnace/ward loop.                                  |
| Goblin Camp                | Yes               | Acts as raid source and threat landmark.                                                       |
| Buildable Terrain          | Yes               | Supports first base and basic automation line.                                                 |
| POC Roads/Paths            | Yes               | Connect village, cave, forest, and camp approach.                                              |
| Large Automation Deposit   | Optional          | Can be a small prototype node or deferred; POC chain can use simple mined ore.                 |
| Seasons                    | Optional/Deferred | Visual placeholder only in POC unless easy.                                                    |
| Dynamic Corruption         | Optional/Deferred | Small static corrupted patch can foreshadow final dynamic systems.                             |
| Ocean/Coast                | No                | Deferred to Alpha/final.                                                                       |
| Full Infinite Generation   | No                | POC uses controlled local generation first.                                                    |

## 23.1 POC Worldgen Success Conditions

- A new POC seed reliably places spawn, village, river/lake, cave, ruin, and goblin camp within playable distance.

- The player can locate wood, stone, food, copper, iron, coal, and mana hints without needing external knowledge.

- The village can request and consume resources tied to the generated terrain.

- The cave and goblin camp create readable danger, not random harassment.

- A simple automation route from mine/furnace/storage to village warehouse is possible without completely flat terrain.

- Worldgen visibly supports the core identity: survival, village growth, automation, magic, and threat.

# 24. Detailed Biome Registry v0.1

The following registry is a design and database foundation. Only a small subset is POC Required. The rest maps future full-game biome families so later documents can reference stable names and IDs.

| **ID**                              | **Biome Name**         | **Family**              | **Description**                                                                                                     | **Rarity** | **Status**   |
|-------------------------------------|------------------------|-------------------------|---------------------------------------------------------------------------------------------------------------------|------------|--------------|
| biome.natural.hearthplain_meadow    | Hearthplain Meadow     | Natural Surface         | Temperate meadow/plains starter biome with soft grass, flowers, small outcrops, fertile soil, and good build space. | Common     | POC Required |
| biome.natural.riverwood_forest_edge | Riverwood Forest Edge  | Natural Surface         | Moderate forest border near water with starter timber, herbs, mushrooms, wildlife, and hidden paths.                | Common     | POC Required |
| biome.cave.shallow_stone_cave       | Shallow Stone Cave     | Underground             | Early cave biome with stone, coal, copper, iron, darkness pressure, cave spiders, and crystal hints.                | Common     | POC Required |
| biome.water.greenvale_river         | Greenvale River        | Water                   | Starter river system supporting village placement, farming, fishing, bridge logic, and future waterwheel power.     | Common     | POC Required |
| biome.magic.mana_crystal_pocket     | Mana Crystal Pocket    | Magical / Cave          | Small mana-rich side pocket with faint glow, mana crystals, wisp spawn, and basic rune/mana tutorial purpose.       | Uncommon   | POC Required |
| biome.civilised.forest_hamlet_zone  | Forest Hamlet Zone     | Civilisation-Influenced | Cleared land, farms, paths, warehouse, work sites, village homes, and watchtower project area.                      | Common     | POC Required |
| biome.threat.goblin_camp_edge       | Goblin Camp Edge       | Faction / Threat        | A rough woodland fringe with crude banners, cleared camp space, raid source logic, and scavenged resources.         | Uncommon   | POC Required |
| biome.ruin.old_rune_clearing        | Old Rune Clearing      | Ancient / Magical       | Small ancient ruin clearing with broken stones, lore hint, mana traces, and one early magic unlock clue.            | Uncommon   | POC Required |
| biome.natural.greenwood_forest      | Greenwood Forest       | Natural Surface         | Standard temperate forest with wood families, animals, herbs, hidden shrines, and forest village suitability.       | Common     | Alpha        |
| biome.natural.deepwood              | Deepwood               | Natural Surface         | Dense, darker forest with rare herbs, stronger predators, fae hints, and hidden ruins.                              | Uncommon   | Alpha        |
| biome.natural.stoneback_highlands   | Stoneback Highlands    | Natural Surface         | Rolling rocky hills with exposed stone, copper, iron clues, wind power potential, and watchtower sites.             | Common     | Alpha        |
| biome.natural.northfall_mountains   | Northfall Mountains    | Natural Surface         | High mountains with steep cliffs, caves, snowline, rich ore, harsh weather, and fortress culture hooks.             | Uncommon   | Final Game   |
| biome.natural.sunreach_drylands     | Sunreach Drylands      | Natural Surface         | Dry grassland/desert transition with heat pressure, hardy crops, trade roads, and ruined wells.                     | Uncommon   | Final Game   |
| biome.natural.goldglass_desert      | Goldglass Desert       | Natural Surface         | Harsh desert with sand/glass resources, buried ruins, caravans, rare salts, and ancient civilisation sites.         | Rare       | Final Game   |
| biome.natural.murkfen_swamp         | Murkfen Swamp          | Natural Surface         | Wet alchemy biome with mud, poison plants, spirits, disease pressure, hidden settlements, and monster nests.        | Uncommon   | Final Game   |
| biome.natural.frostmere_tundra      | Frostmere Tundra       | Natural Surface         | Cold biome with snow, ice, fur animals, frost magic hints, isolated settlements, and temperature planning.          | Uncommon   | Final Game   |
| biome.natural.ashen_volcanic_fields | Ashen Volcanic Fields  | Natural Surface         | Heat/lava terrain with obsidian, rare minerals, forge ruins, fire creatures, and high-tier smelting hooks.          | Rare       | Final Game   |
| biome.water.silverlake_basin        | Silverlake Basin       | Water                   | Large freshwater basin with fishing, reeds, clay, water spirits, lakeside villages, and shrine placements.          | Common     | Alpha        |
| biome.water.coastal_lowlands        | Coastal Lowlands       | Water / Coast           | Coastal terrain with fishing, boats, salt, coastal villages, sea caves, and later ocean trade.                      | Common     | Final Game   |
| biome.water.stormreef_coast         | Stormreef Coast        | Water / Coast           | Dangerous coast with storms, reefs, wrecks, sea monsters, and rare coastal resources.                               | Rare       | Final Game   |
| biome.cave.crystal_caverns          | Crystal Caverns        | Underground / Magical   | Glowing cave biome with mana crystals, purity grades, crystal crawlers, wisps, and rune ruins.                      | Uncommon   | Alpha        |
| biome.cave.shimmercap_grotto        | Shimmercap Grotto      | Underground             | Mushroom cave biome with edible fungi, spores, alchemy, underground farming, and strange livestock.                 | Uncommon   | Final Game   |
| biome.cave.deepstone_halls          | Deepstone Halls        | Underground             | Deep underground biome with rare ores, ancient roads, dwarven/goblin hooks, and stronger threats.                   | Rare       | Final Game   |
| biome.cave.lava_forge_depths        | Lava Forge Depths      | Underground / Volcanic  | Deep heat biome with lava, obsidian, forge embers, fire creatures, and advanced smelting resources.                 | Rare       | Final Game   |
| biome.cave.buried_city              | Buried City            | Ancient / Underground   | Subterranean ruins of a lost civilisation with relics, lore, puzzle gates, and hidden machines.                     | Legendary  | Final Game   |
| biome.magic.leyline_meadow          | Leyline Meadow         | Magical Surface         | Grassland crossed by a visible or hidden leyline, improving mana resources and ritual potential.                    | Uncommon   | Alpha        |
| biome.magic.crystal_glade           | Crystal Glade          | Magical Surface         | Surface crystal formation with mana flowers, wisps, magical light, and machine boost/instability rules.             | Rare       | Alpha        |
| biome.magic.starfall_grove          | Starfall Grove         | Magical Surface         | Rare grove created by celestial fragments, with strange plants, relic metal hints, and spirit/mana events.          | Legendary  | Final Game   |
| biome.magic.luminous_wetlands       | Luminous Wetlands      | Magical / Swamp         | Glowing swamp with alchemy resources, spirit lights, rare herbs, and magical fog.                                   | Rare       | Final Game   |
| biome.magic.fae_touched_wood        | Fae-Touched Wood       | Magical / Forest        | Forest changed by fae realm leaks, living wood, illusions, unusual wildlife, and trickster events.                  | Rare       | Final Game   |
| biome.magic.dreammist_vale          | Dreammist Vale         | Magical / Dream         | Soft dream-influenced valley with illusion, memory, sleep, prophecy, and dream realm foreshadowing.                 | Legendary  | Final Game   |
| biome.spirit.ancestor_grove         | Ancestor Grove         | Spirit / Blessed        | Sacred grove tied to spirits, ancestors, shrines, healing, morale, and anti-corruption pressure.                    | Rare       | Final Game   |
| biome.ancient.broken_runefield      | Broken Runefield       | Ancient / Magical       | Old rune battlefield with shattered glyph stones, unstable mana, research notes, and repairable sites.              | Rare       | Alpha        |
| biome.ancient.old_roadlands         | Old Roadlands          | Ancient / Civilisation  | Ruined roads, milestones, watchtower remnants, abandoned camps, and travel-route history.                           | Uncommon   | Alpha        |
| biome.ancient.sunken_ruin_fen       | Sunken Ruin Fen        | Ancient / Swamp         | Partly submerged ruins with alchemy plants, spirits, disease risk, and hidden chambers.                             | Rare       | Final Game   |
| biome.ancient.machine_grave         | Ancient Machine Grave  | Ancient / Magitech      | Scattered remnants of old machines, gears, conduits, strange fuels, and automation research hooks.                  | Legendary  | Final Game   |
| biome.corrupt.blightwood            | Blightwood             | Corrupted Surface       | Corrupted forest with warped trees, cursed roots, hostile creatures, fear, and cleansing quests.                    | Rare       | Final Game   |
| biome.corrupt.cursed_fen            | Cursed Fen             | Corrupted / Swamp       | Poisonous swamp corruption with disease, undead, cursed herbs, and high cleansing difficulty.                       | Rare       | Final Game   |
| biome.corrupt.ashrot_field          | Ashrot Field           | Corrupted / Wasteland   | Burned and cursed open terrain with ash, bone, hostile patrols, and dark ritual remains.                            | Rare       | Final Game   |
| biome.corrupt.voidscar              | Voidscar               | Corrupted / Dimensional | Dangerous void-touched terrain with reality cracks, unstable resources, and void creature pressure.                 | Legendary  | Final Game   |
| biome.civilised.village_farmland    | Village Farmland       | Civilisation-Influenced | Cultivated fields, fences, paths, barns, livestock, irrigation, NPC work routes, and food supply.                   | Common     | Alpha        |
| biome.civilised.warded_road         | Warded Road            | Civilisation / Magical  | Road protected by lights, patrols, ward stones, waymarkers, and trade-route safety logic.                           | Uncommon   | Final Game   |
| biome.civilised.mining_camp         | Mining Camp            | Civilisation / Industry | Small industrialised site near ore deposits with storage, rails, machines, guards, and danger attraction.           | Uncommon   | Alpha        |
| biome.civilised.abandoned_hamlet    | Abandoned Hamlet       | Ruined Civilisation     | Former settlement with damaged homes, overgrowth, loot, ghosts/monsters, refugees, and rebuild potential.           | Uncommon   | Alpha        |
| biome.dimension.fae_grove           | Fae Realm Grove        | Dimensional             | Realm biome of living wood, colour shifts, illusions, fae resources, and nature magic progression.                  | Legendary  | Final Game   |
| biome.dimension.infernal_basalt     | Infernal Basalt Fields | Dimensional             | Infernal realm terrain with basalt, ash, fire hazards, infernal fuel, and demon threats.                            | Legendary  | Final Game   |
| biome.dimension.void_wastes         | Void Wastes            | Dimensional             | Void realm terrain with unstable gravity, voidstone, dangerous magic, and high-risk automation resources.           | Legendary  | Final Game   |
| biome.dimension.celestial_isles     | Celestial Isles        | Dimensional / Sky       | Floating celestial terrain with rare metals, sky ruins, wind magic, and endgame civilisation projects.              | Legendary  | Final Game   |
| biome.dimension.dream_shore         | Dream Shore            | Dimensional / Dream     | Dream realm coastline of memory, illusion, prophecy, and dream glass resources.                                     | Legendary  | Final Game   |

# 25. Core POC Scenario: Forest Hamlet Valley

The POC worldgen scenario is designed to prove the main game hook in one compact location.

| **Step** | **Worldgen Element**                                           | **Player Experience**                                                                           |
|----------|----------------------------------------------------------------|-------------------------------------------------------------------------------------------------|
| 1        | Spawn on Hearthplain Meadow near Riverwood Forest Edge.        | Player sees safe build space, trees, river, village smoke/path, and distant cave/ruin clues.    |
| 2        | Discover forest hamlet beside river/lake.                      | Elder/request board explains watchtower project and missing resources.                          |
| 3        | Gather wood, stone, fibre, food, clay/sand.                    | Starter terrain supports survival, first tools, furnace, basic village delivery.                |
| 4        | Follow path or mineral clues to Shallow Stone Cave.            | Player finds coal, copper, iron, cave creature pressure, and a side mana hint.                  |
| 5        | Find mana pocket or old rune clearing.                         | Player discovers mana crystal, wisp/magic clue, and first rune/mana furnace path.               |
| 6        | Craft basic automation and smelting chain.                     | World layout supports miner/transport/furnace/storage route with terrain planning.              |
| 7        | Deliver or automate supply into village warehouse after trust. | Village project reserves iron/stone/wood and begins staged watchtower construction.             |
| 8        | Goblin camp triggers raid.                                     | Raid approach uses generated path/terrain. Watchtower completion changes outcome.               |
| 9        | World state updates.                                           | Village damage, repairs, reputation, resources, and future requests reflect player preparation. |

## 25.1 POC Valley Layout Requirements

- Spawn, village, cave, ruin, and camp should be close enough to test in one short play session.

- The goblin camp should be visible or discoverable, but not so close that the village is instantly overwhelmed.

- The cave should have a safe entrance zone, then escalate into deeper danger and better resources.

- The mana pocket should be optional at first but strongly useful for village defence and mana furnace progression.

- The river/lake should justify the village location and provide a future hydropower route.

- The terrain should support basic automation but still require at least one bridge, slope, support, tunnel, or route decision.

# 26. Balancing Rules

| **Rule**                                    | **Design Reason**                                                                                                  |
|---------------------------------------------|--------------------------------------------------------------------------------------------------------------------|
| Readable first, deep second.                | Players should understand terrain and resources without needing to study generation math.                          |
| POC generation should be controlled.        | The first prototype must test core loops reliably rather than randomly failing from bad seeds.                     |
| Every major biome needs a purpose.          | A biome should support resources, creatures, structures, culture, magic, progression, or world state.              |
| Do not over-punish building.                | Terrain challenges are good, but players need buildable space and tools to solve terrain problems.                 |
| Magic should be visible but not everywhere. | Small magical hints near spawn create wonder; strong magical regions should feel special.                          |
| Corruption must have counterplay.           | Spreading danger is only fun if the player can understand, contain, cleanse, or strategically ignore it.           |
| Old regions stay useful.                    | Starter biomes should remain relevant through farms, villages, trade, roads, aesthetics, and support resources.    |
| Travel should unlock meaning.               | Long-distance travel is worthwhile when new biomes offer new resources, cultures, threats, and stories.            |
| Resources should avoid dead ends.           | Biome-specific resources are good, but trade, substitutions, NPCs, or alternate routes should prevent frustration. |
| Visual variation must preserve identity.    | Engine-driven texture variation should enrich blocks, not make the world unreadable.                               |

# 27. Open Questions for Later Documents

- Exact number of final major regions per world and whether region names are procedurally generated or curated lists.

- Exact biome noise/placement algorithm and whether worldgen uses chunks, regions, climate maps, or hybrid authored templates.

- Full ocean, ship, island, and underwater biome rules.

- Exact culture-to-biome preference matrix for all races and factions.

- Full structure placement rules for dungeons, castles, towers, ruins, megastructures, and wonders.

- Detailed weather and season calendar, crop compatibility, and climate difficulty values.

- Exact corruption spread/cleansing math and difficulty settings.

- How much terrain deformation NPCs can perform during village expansion.

- Final technical approach for infinite/semi-infinite generation, save data, chunk streaming, and multiplayer sync.

- Exact art pipeline for engine-driven material variation across biome, rarity, state, magic, corruption, culture, and weathering.

# Appendix A. POC Worldgen Checklist

| **Checklist Item** | **Requirement**                                                                        |
|--------------------|----------------------------------------------------------------------------------------|
| World Profile      | Controlled POC Valley profile exists.                                                  |
| Spawn              | Player spawns in readable starter meadow near forest and village clues.                |
| Surface Biome 1    | Hearthplain Meadow generates with buildable space and starter resources.               |
| Surface Biome 2    | Riverwood Forest Edge generates with wood, herbs, wildlife, and paths.                 |
| Cave Biome         | Shallow Stone Cave generates with coal, copper, iron, stone, and cave threat.          |
| Water              | River or lake generates near village and supports future waterwheel site.              |
| Village            | Forest hamlet generates with warehouse, farms, roads, and watchtower project site.     |
| Ruin               | Old rune clearing or small magical ruin generates with mana hint.                      |
| Mana Pocket        | Small mana crystal area exists and can support wisp/magic discovery.                   |
| Enemy Camp         | Goblin camp generates as raid source and is discoverable.                              |
| Roads/Paths        | Paths connect village, cave, forest, water, and camp approach.                         |
| Resources          | Wood, stone, fibre, food, clay, sand, coal, copper, iron, and mana hint are reachable. |
| Buildability       | At least one clear site for player base and one route for basic automation line.       |
| Threat Route       | Goblin raid path can reach village and be affected by tower/guards/wards.              |
| Dynamic State      | Village damage/repair and project progress can update generated area.                  |
| Performance        | POC world can run detailed local simulation without requiring final LOD system.        |

# Appendix B. Biome Database Field Template

| **Field**              | **Description**                                                                       |
|------------------------|---------------------------------------------------------------------------------------|
| biome_id               | Unique internal ID, e.g. biome.natural.hearthplain_meadow.                            |
| display_name           | Player-facing biome name.                                                             |
| category               | Natural, magical, corrupted, ancient, cave, water, civilised, dimensional, hybrid.    |
| family                 | Biome family such as meadow, forest, swamp, cave, leyline, corrupted, coast.          |
| sub_biome_of           | Optional parent biome ID.                                                             |
| rarity                 | Common, Uncommon, Rare, Legendary.                                                    |
| danger_tier            | Safe, Low, Medium, High, Extreme, Boss/Realm.                                         |
| progression_band       | Starter, Early, Mid, Late, Endgame, Realm.                                            |
| temperature_range      | Cold/temperate/warm/hot values or numerical range.                                    |
| moisture_range         | Dry/normal/wet/flooded values or numerical range.                                     |
| altitude_range         | Lowland/hill/highland/mountain/depth rules.                                           |
| depth_band             | Surface, shallow cave, mid cave, deep cave, realm-adjacent.                           |
| terrain_shape_tags     | flat, rolling, cliff, river, cave, ravine, buildable, steep.                          |
| block_palette_ids      | Terrain and visual block families used by the biome.                                  |
| vegetation_rules       | Trees, plants, crops, herbs, mushrooms, density, regrowth.                            |
| resource_rules         | Ore, deposits, nodes, surface clues, grades, purity, renewable rules.                 |
| structure_rules        | Village, ruin, camp, shrine, road, dungeon, landmark weights.                         |
| village_rules          | Village suitability, culture preferences, resources, danger, road/water requirements. |
| creature_spawn_rules   | Passive, hostile, magical, cave, raid, boss, seasonal, event spawns.                  |
| magic_density          | Ambient mana value, mana pocket chance, leyline weight.                               |
| corruption_rules       | Corruption resistance/spread/cleansing rules.                                         |
| weather_rules          | Rain, storm, snow, heat, magical weather, disaster possibilities.                     |
| automation_rules       | Buildability, hydropower, wind, deposit, transport, terrain challenge values.         |
| dynamic_state_support  | Can be burned, warded, corrupted, cleansed, overharvested, industrialised, reclaimed. |
| visual_variation_rules | Biome tint, rarity, culture, age, magic, corruption, weathering, damage.              |
| poc_status             | POC Required, Alpha, Beta, Final Game, Placeholder, Deferred.                         |
| notes                  | Design notes, balance notes, dependencies, future questions.                          |

# Appendix C. Cross-System Use Matrix

| **System**               | **What It Needs From Biomes / Worldgen**                                                                                            |
|--------------------------|-------------------------------------------------------------------------------------------------------------------------------------|
| Blocks Registry          | Terrain palettes, block variants, generation rules, block states, hazards, weathering, corruption, magic charge, culture variation. |
| Items Registry           | Resource sources, forage items, wood families, ore items, herbs, monster drops, knowledge items, maps, culture goods.               |
| Recipe Registry          | Resource availability, station material sources, biome-specific substitutions, culture recipes, project resource access.            |
| Resource Progression     | Biome/depth/region resource rules, deposits, nodes, surface clues, grades, purity, depletion and renewal.                           |
| NPC Village System       | Village placement, culture-biome identity, roads, farms, water, resources, danger, growth space, civilised biome states.            |
| Automation System        | Large deposits, buildable terrain, water/wind power, logistics routes, infrastructure impact, warehouse supply paths.               |
| Magic System             | Mana density, leylines, magical biomes, corruption, blessing, magical weather, ritual sites, mana resources.                        |
| Creatures and Monsters   | Spawn rules, ecology, nests, camps, raids, corruption creatures, magical creatures, boss territories.                               |
| Structures and Landmarks | Placement rules, biome-specific POIs, roads, ruins, camps, dungeons, rare landmarks, dynamic structures.                            |
| Dimensions               | Realm biome families, dimension leaks, portal-compatible sites, realm resources, overworld utility.                                 |
| Combat and Defence       | Visibility, terrain cover, village walls/towers, raid routes, hazard terrain, cave danger, weather effects.                         |
| Economy and Trade        | Biome resources, scarcity, village exports, caravan routes, faction territories, strategic resource sites.                          |
| UI/UX                    | Biome names, map colours, danger overlays, resource hints, leyline overlays, world setting descriptions.                            |
| Technical Implementation | Chunk generation, seeds, LOD, save-state deltas, runtime dynamic state, multiplayer sync, performance budgets.                      |

# Appendix D. Future Biome Family Backlog

- Natural: meadow, plains, forest, deep forest, jungle, swamp, desert, dryland, snowfield, tundra, mountain, volcanic, coast, island, ocean, reef.

- Underground: shallow caves, deepstone, crystal caverns, mushroom caverns, lava depths, underground rivers, buried cities, ancient vaults, abyssal cracks.

- Magical: leyline meadow, crystal glade, fae wood, luminous wetland, starfall grove, dreammist vale, spirit grove, elemental scars.

- Corrupted: blightwood, cursed fen, ashrot field, voidscar, necrotic gravefield, blood bog, shadow valley.

- Ancient: broken runefield, old roadlands, buried city, ancient battlefield, machine grave, ruined aqueduct, shattered portal plain.

- Civilisation-influenced: village farmland, warded road, mining camp, fortified border, trade town outskirts, abandoned hamlet, conquered settlement, player city district.

- Dimensional: fae grove, infernal basalt, void wastes, celestial isles, dream shore, spirit realm crossing, elemental planes, ancient machine realm.

# Appendix E. POC Success Criteria

| **Success Test** | **Pass Condition**                                                                                                              |
|------------------|---------------------------------------------------------------------------------------------------------------------------------|
| Navigation       | New player can visually identify village, forest, cave direction, river, and at least one mystery landmark.                     |
| Resource Flow    | POC world reliably provides materials for first tools, furnace, copper mechanism, iron chain, mana hint, and watchtower supply. |
| Village Loop     | Village location, warehouse, request board, project site, and resources all connect logically to the generated terrain.         |
| Automation Loop  | Player can create a simple mining/smelting/storage/village supply route using generated terrain.                                |
| Magic Loop       | Mana pocket/ruin supports basic rune, mana furnace, ward/defence, and wisp/magic discovery.                                     |
| Threat Loop      | Goblin camp and raid route work, and village preparation changes the outcome.                                                   |
| Readability      | Biomes are visually distinct and gameplay meaning is understandable without debug tools.                                        |
| Replayability    | Controlled procedural variation changes exact layout while preserving required POC relationships.                               |
| Performance      | The compact valley runs smoothly with local NPCs, creatures, machines, and block interactions.                                  |
| Extensibility    | The same data model can expand into larger worlds, more biomes, more structures, and dynamic region simulation.                 |
