---
title: 24B — Overworld Regions, Climate and Surface Biomes
document_set: 24
document: 24B
aliases:
- 24B
- Document 24B
project: Leyforge
version: '0.1'
status: Draft
format: Obsidian Markdown
engine: Godot / Summer Engine
source_format: DOCX
tags:
- leyforge
- world-content-atlas
- document-set-24
- 24b
---

# 24B — Overworld Regions, Climate and Surface Biomes

> [!NOTE]
> Obsidian-ready Markdown conversion of the approved Set 24 source document. Source wording and structure have been preserved wherever possible.

**Fantasy Voxel Civilisation Sandbox**

**24B - World Content Atlas: Overworld Regions, Climate and Surface Biomes**

Version 0.1 - Post-POC Production Content Draft

A database-ready atlas for seed-derived continents, macro-regions, climate fields, watersheds, landforms, natural surface biome families, transition zones, seasons, ecology, settlement suitability, dungeon placement, and Overworld boss territories.

| **Overworld Region and Surface Biome Atlas Statement**                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| The Overworld must feel like a coherent living planet rather than a sequence of random terrain skins. Climate, elevation, water, geology, ecology, history, civilisation, magic, danger, and player action combine to create regions with readable identity. No production world depends on the retired Forest Hamlet valley or any fixed proof-of-concept arrangement. Every world is assembled from authored region and biome families through deterministic seed rules, compatibility constraints, progression guarantees, and long-term dynamic state. |

| **Field**                   | **Locked Direction**                                                                                                                                                                                                                             |
|-----------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Document Set**            | This is [[24B - Overworld Regions, Climate and Surface Biomes]] in World Content Atlas Document Set 24.                                                                                                                                                                                     |
| **Document Scope**          | Overworld continental assembly, macro-regions, climate, terrain, hydrology, natural surface biome families, ecotones, seasons, disasters, ecology, resources, settlement suitability, adventure placement, registries, and production contracts. |
| **Post-POC Direction**      | All fixed Forest Hamlet, POC valley, starter meadow, fixed cave, fixed mana pocket, fixed goblin camp, and scripted raid placement assumptions are retired from the shipping game.                                                               |
| **Region Direction**        | Worlds are built from nested continents, macro-regions, watersheds, terrain provinces, biome mosaics, territories, sites, and dynamic local states.                                                                                              |
| **Climate Direction**       | Use deterministic multi-field climate: temperature, moisture, seasonality, continentality, altitude, exposure, storm pressure, hydrology, and justified magical influence.                                                                       |
| **Surface Biome Direction** | Version 0.1 defines twelve major natural surface-biome families and ninety-six initial biome entries, with extensible sub-biomes and transition states.                                                                                          |
| **Boundary**                | Oceans, coasts, islands, skylands, underground biomes, strongly magical/corrupted/ancient zones, and other special Overworld environments are expanded in 24C. Dimension biomes are expanded in 24D.                                             |
| **Civilisation Direction**  | No ancestry or culture is biologically locked to one biome. Cultures have preferences, adaptations, histories, and infrastructure requirements, but migration and hybrid settlements remain possible.                                            |
| **Adventure Direction**     | Biomes help place structures, lairs, dungeons, roaming threats, regional bosses, resources, routes, rumours, and dynamic events. Detailed dungeon and boss content belongs to 24G and 24H.                                                       |
| **Data Direction**          | Use stable IDs, parent families, climate ranges, terrain tags, adjacency rules, cross-system links, dynamic-state support, completeness fields, and clean planning metadata.                                                                     |

# Document Purpose

This document expands the World Content Atlas into the natural land surface of the Overworld. It defines how continents and regions gain climate, shape, water, ecological character, resource identity, settlement potential, danger, and adventure content before local chunks are generated. The goal is not to simulate a real planet perfectly. The goal is to create believable, readable, varied, and gameplay-useful terrain that can support survival, civilisation, automation, magic, exploration, dungeons, bosses, trade, and long-term transformation.

[[24B - Overworld Regions, Climate and Surface Biomes]] replaces the retired POC-centred surface-biome assumptions with production rules. A new world may begin in temperate grassland, cold woodland, dry scrub, tropical upland, wetland edge, mountain valley, or another valid cluster depending on world settings and seed validation. A village may be nearby or distant. The player is guaranteed capability and meaningful choices, not a specific story set-piece.

This document does not fully define oceans, coasts, islands, underwater regions, skylands, caves, deep layers, strongly magical biomes, corruption zones, ancient machine wilderness, or dimension terrain. Those environments are deliberately separated into Documents 24C and 24D so they can receive equal depth without making this volume unmanageable.

# Design Source and Supersession Rules

| **Source**                              | **Direction Retained**                                                                                                                                             | **24B Expansion or Supersession**                                                                                                                   |
|-----------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------|
| **24A - Atlas Foundations**             | Deterministic authored randomness, nested topology, procedural history, relationship graph, POC retirement, progression guarantees, versioning, content contracts. | 24B applies those rules to continents, land regions, natural climate, surface terrain, biome mosaics, and biome-linked world content.               |
| **00 - Master Game Design Bible**       | Living civilisations, survival, magic, automation, dimensions, danger, mystery, and player freedom remain the core identity.                                       | Surface regions must support all pillars and visibly change through civilisation, damage, extraction, magic, restoration, and ecology.              |
| **01 - Core Gameplay Loop**             | Explore -\> gather -\> craft -\> build -\> interact -\> automate -\> defend -\> upgrade -\> expand remains the broad loop.                                         | No fixed opening chain is retained. Region generation must provide multiple local routes into the loop.                                             |
| **06 - Resource Progression**           | Resources are survival supplies, construction inputs, machine feedstock, village needs, magical catalysts, strategic assets, and dimension keys.                   | Biome records define natural sources, renewability, grades, extraction suitability, agricultural potential, and trade scarcity.                     |
| **07 - NPC Village System**             | Settlements require water, housing, food, safety, work access, routes, materials, culture, projects, and distant simulation.                                       | Region and biome suitability records guide settlement placement, growth constraints, migration, agriculture, and infrastructure.                    |
| **10 - Creatures and Monsters**         | Creatures are ecology, danger, resources, faction pressure, magic evidence, taming opportunities, and boss progression.                                            | Biome habitat slots, migration corridors, predator pressure, lairs, and regional boss territories are defined here; creature detail remains in 24F. |
| **11 - Biomes and World Generation**    | Layered worldgen, climate, terrain, resources, villages, structures, leylines, dynamic states, and biome registries remain valid foundations.                      | 24B supersedes its POC valley and starter-biome sections and expands the natural surface atlas into a production-scale registry.                    |
| **12 - Structures**                     | Structures are civilisation, history, danger, magic, routes, dungeons, ownership, repair, and world-state evidence.                                                | Biomes provide eligibility, density, terrain fit, material palette, access routes, and environmental states; 24G and 24I own detailed entries.      |
| **13 - Peoples, Cultures and Factions** | Ancestry, culture, faction, government, language, religion, territory, and settlement citizenship remain separate.                                                 | Biomes provide opportunities and constraints without equating a people with a habitat.                                                              |
| **14 - Dimensions**                     | Realms have their own generation, physical laws, societies, ecosystems, resources, and dungeons.                                                                   | 24B covers only the natural Overworld land surface. Realm biome design is owned by 24D.                                                             |

# Static Table of Contents

- 1\. Locked Overworld Region and Surface Biome Atlas Identity

- 2\. Post-POC Production Decisions

- 3\. Authority, Boundaries, and Cross-Document Ownership

- 4\. Overworld Spatial Hierarchy

- 5\. Continental and Macro-Region Assembly

- 6\. Climate Simulation Foundation

- 7\. Temperature, Moisture, Seasonality, and Exposure Bands

- 8\. Hydrology, Watersheds, Rivers, Lakes, and Wetland Formation

- 9\. Elevation, Slope, Rain Shadows, and Terrain Provinces

- 10\. Landform Grammar and Region Readability

- 11\. Region Identity, Naming, History, and Procedural Lore

- 12\. Biome Family Architecture, Inheritance, and Tags

- 13\. Biome Mosaics, Adjacency, Ecotones, and Transition Rules

- 14\. Spawn and Starting-Area Suitability Without Fixed Content

- 15\. Temperate Plains, Meadows, Heaths, and Steppes

- 16\. Temperate Forests and Woodlands

- 17\. Boreal Forests, Taiga, and Cold Woodlands

- 18\. Tundra, Polar, and Glacial Surface Biomes

- 19\. Tropical and Subtropical Forests

- 20\. Savannas, Seasonal Grasslands, and Warm Scrub

- 21\. Deserts, Drylands, Badlands, and Salt Basins

- 22\. Wetlands, Marshes, Bogs, Fens, and Floodplains

- 23\. Highlands, Mountains, Alpine, and Plateau Biomes

- 24\. Volcanic, Geothermal, and Young-Land Biomes

- 25\. Karst, Limestone, Canyon, and Eroded-Stone Biomes

- 26\. Rivers, Lakes, Springs, and Inland-Water Interfaces

- 27\. Seasonal States, Weather, and Natural Disasters

- 28\. Resources, Soil, Vegetation, Agriculture, and Extraction

- 29\. Ecology, Creature Habitats, Monster Pressure, and Migration

- 30\. Civilisations, Settlements, Territories, Roads, and Trade

- 31\. Structures, Dungeons, Lairs, Ruins, and Overworld Boss Territories

- 32\. Mana Density, Leylines, and Natural-Fantasy Overlays

- 33\. Dynamic Change, Degradation, Restoration, and Player Impact

- 34\. Discovery, Maps, Rumours, Codex, and Visual Readability

- 35\. Detailed Overworld Region Archetype Registry v0.1

- 36\. Detailed Surface Biome Registry v0.1

- 37\. Content Completeness Contracts and Production Budgets

- 38\. Balancing and Design Rules

- 39\. Cross-Document Requirements and Update Plan

- 40\. Open Questions for Later Atlas Documents

- Appendix A. Overworld Region Database Field Template

- Appendix B. Surface Biome Database Field Template

- Appendix C. Biome Adjacency and Transition Matrix

- Appendix D. Production Authoring Checklist

- Appendix E. [[24B - Overworld Regions, Climate and Surface Biomes]] Acceptance Criteria

# 1. Locked Overworld Region and Surface Biome Atlas Identity

The Overworld surface is the primary physical stage for survival, settlement growth, roads, trade, farming, warfare, exploration, ruins, dungeons, wildlife, regional monsters, and the first signs of dimensional and magical activity. Regions provide large-scale identity. Biomes provide local ecological and terrain identity. Neither should exist only to change colours or vegetation.

| **Locked Rule**                                                                                                                                                                                                                                                                                                                                                                                                                         |
|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Every generated land region and major surface biome must answer several connected questions: what climate formed it, what water and landforms define it, what can live there, what resources and livelihoods it supports, which settlements and routes are plausible, what dangers and adventure sites belong there, how it changes through seasons and events, and what the player can build, restore, exploit, protect, or transform. |

| **Identity Layer**      | **Design Meaning**                                                                                                                | **Player-Facing Result**                                                                                    |
|-------------------------|-----------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------|
| Readable Planet         | Climate, watersheds, mountain chains, plains, forests, wetlands, and deserts form understandable regional patterns.               | Players can read terrain and make informed travel, settlement, farming, prospecting, and defence decisions. |
| Procedural Identity     | Every region combines stable seed choices for landform, climate, ecology, history, culture, resources, and danger.                | Different seeds feel authored without repeating one canonical map.                                          |
| Living Ecology          | Vegetation, prey, predators, monsters, migration, fire, flood, disease, and civilisation pressure interact.                       | Biomes feel alive rather than serving only as spawn lists.                                                  |
| Civilisation Foundation | Water, soil, routes, materials, climate, danger, and history shape settlements and territories.                                   | Cities, villages, camps, roads, farms, mines, and ruins feel geographically grounded.                       |
| Adventure Landscape     | Dungeons, lairs, shrines, ruins, bosses, camps, and rare resources use biome and region logic.                                    | Exploration reveals content that belongs to its environment.                                                |
| Buildable Sandbox       | Terrain remains visually dramatic while providing build sites, transport problems, power opportunities, and terraformable spaces. | Building and automation interact with the land instead of being blocked by it.                              |
| World Memory            | Seasons, disasters, extraction, settlement growth, wars, magic, cleansing, and abandonment alter local state.                     | The Overworld visibly remembers what happened.                                                              |

## 1.1 Design Promise

From a high viewpoint, the player should be able to identify watersheds, mountain barriers, travel corridors, settlement-friendly valleys, storm-prone ridges, forest belts, dry basins, wetland lowlands, and unusual regional landmarks. From ground level, each biome should still provide readable vegetation, soil, light, sound, creatures, resources, structures, weather, and terrain interactions.

## 1.2 What This Atlas Is Not

- It is not a one-to-one copy of Earth climate simulation or real geography.

- It is not a rigid rule that latitude alone determines climate.

- It is not a list of ninety-six palette swaps with identical gameplay.

- It is not permission for every biome to contain every resource, settlement, dungeon, and creature.

- It is not a mandatory temperate start or a hidden reconstruction of the POC valley.

- It is not the detailed creature, dungeon, boss, culture, structure, or technical implementation registry.

# 2. Post-POC Production Decisions

| **Area**                  | **Locked Decision**                                                                                                                                                                 |
|---------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **POC Removal**           | Forest Hamlet, its named residents, fixed valley, watchtower project, exact cave, mana pocket, goblin camp, and raid arrangement are not production world content.                  |
| **Legacy Concepts**       | A POC idea may survive only as a renamed, generalised, data-driven family with no guaranteed location or story role.                                                                |
| **World Start**           | World starts are validated capability clusters, not fixed scenes. The seed may select among many climates and terrain families.                                                     |
| **Biome Roster**          | Version 0.1 establishes ninety-six natural surface biome entries across twelve major families. More can be added through content packs.                                             |
| **Region Roster**         | Version 0.1 establishes twenty-four macro-region archetypes used as procedural assembly templates, not fixed canonical provinces.                                                   |
| **Natural Fantasy First** | Most of the normal Overworld is recognisably natural fantasy. Strongly magical, corrupted, ancient, sky, oceanic, and underground areas remain meaningful rarities expanded in 24C. |
| **No Culture Lock**       | Cultures may prefer or adapt to biomes, but ancestry never dictates habitat, morality, technology, or profession.                                                                   |
| **Adventure Density**     | Every region receives compatible adventure slots, but no world must contain every dungeon or boss family.                                                                           |
| **Boss Presence**         | Regional bosses and wandering titans are seeded as territories and world pressures with signs, effects, and alternatives to simple killing.                                         |
| **Dynamic State**         | Natural biomes support seasonal, damaged, civilised, overharvested, restored, burned, flooded, drought, warded, corrupted, and reclaimed states where relevant.                     |
| **Determinism**           | Worldgen outputs are reproducible from world seed, content version, region identity, and stable generation stages.                                                                  |
| **Existing-World Safety** | New biome content should expand unexplored space or explicitly migrate compatible records rather than silently rewriting explored terrain.                                          |

# 3. Authority, Boundaries, and Cross-Document Ownership

| **Question / Layer** | **Authoritative Source**                                                                                                                                                                          |
|----------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **24B owns**         | Natural land-region archetypes, climate and landform eligibility, natural surface biome families, adjacency, surface hydrology interfaces, settlement suitability, and biome-level content slots. |
| **24C owns**         | Oceans, coasts, islands, underwater terrain, skylands, caves, deep layers, strongly magical/corrupted/ancient/hybrid Overworld biomes, and exceptional spatial environments.                      |
| **24D owns**         | Dimensions, realm topology, realm biomes, realm physical laws, realm ecology, and dimension-specific region assembly.                                                                             |
| **24E owns**         | Peoples, cultures, factions, governments, settlements, architecture, territory, migration, and cultural relationships.                                                                            |
| **24F owns**         | Creature families, ecology records, behaviour, drops, variants, taming, spawning detail, and monster societies.                                                                                   |
| **24G owns**         | Dungeon, ruin, lair, megadungeon, room grammar, hazard, puzzle, ownership, reset, and restoration detail.                                                                                         |
| **24H owns**         | Bosses, titans, siege threats, realm guardians, phases, arenas, world effects, outcomes, and rewards.                                                                                             |
| **24I owns**         | Structures, roads, landmarks, wonders, infrastructure, settlement forms, ownership states, and placement detail.                                                                                  |
| **24J owns**         | Resources, loot, relics, trade goods, renewability, rarity, processing, and material ecology detail.                                                                                              |
| **Runtime owns**     | The generated instance, explored state, current season, local damage, populations, ownership, depletion, restoration, weather, and player-caused changes.                                         |

24B may name example creature, dungeon, boss, settlement, and resource hooks to prove relationships. Those names remain provisional until their owning Atlas volumes define stable entries.

# 4. Overworld Spatial Hierarchy

| **Scale**                      | **Purpose**                                                                                                                                             | **Examples**                                                                             |
|--------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------|
| **World Profile**              | Controls overall size, land-to-water ratio, climate spread, terrain drama, civilisation density, magic level, danger, season length, and content packs. | Balanced, Wild Frontier, Dense Civilisation, Gentle Builder, Harsh Climate.              |
| **Continent / Major Landmass** | Large coherent land body with plate-scale shape, mountain systems, drainage, climate belts, route potential, and historical identity.                   | One large continent, several continents, fragmented landmasses; islands expanded in 24C. |
| **Macro-Region**               | Named large zone made from several connected biome mosaics and one or more terrain provinces.                                                           | River basin, mountain range, desert basin, highland belt, taiga shield.                  |
| **Terrain Province**           | Landform-dominant area controlling slope, elevation, geology, drainage, and traversal.                                                                  | Plateau, escarpment, rolling plain, canyon system, volcanic arc.                         |
| **Watershed / Drainage Basin** | Hydrological area linking springs, rivers, tributaries, lakes, wetlands, and floodplains.                                                               | Alpine watershed feeding lowland farms and marshes.                                      |
| **Biome Mosaic**               | Local group of compatible primary biomes, sub-biomes, transition zones, and corridors.                                                                  | Broadleaf forest, meadow clearings, riparian woodland, foothills.                        |
| **Territory / Influence Zone** | Current or historical area claimed, patrolled, used, feared, or remembered by a culture, faction, creature, boss, or settlement.                        | Trade road safety zone, clan hunting grounds, titan territory.                           |
| **Site / Landmark**            | Discrete settlement, dungeon, ruin, lair, wonder, resource site, boss arena, pass, or route node.                                                       | Hill fort, barrow field, quarry, ruined observatory, ancient tree.                       |
| **Local Cell / Chunk Group**   | Runtime generation and simulation unit holding blocks, spawns, local states, and detailed interactions.                                                 | Player-visible terrain and active ecology.                                               |

## 4.1 Nested Identity Rule

A biome instance never stands alone. It inherits its continent, macro-region, watershed, terrain province, history, culture influence, danger, mana, and dynamic state. Two Mixed Broadleaf Forest instances can therefore feel different because one belongs to a peaceful river kingdom while another grows over a fallen fortress frontier under drought and predator pressure.

# 5. Continental and Macro-Region Assembly

Continents are generated in stages. The system first creates broad landmass shape and elevation tendencies, then mountain chains and basins, then drainage, climate, terrain provinces, biome mosaics, history, civilisation, routes, resources, and adventure sites. This ordering prevents rivers from climbing ridges, deserts from ignoring rain shadows, or cities from appearing without water, routes, or economic reason.

| **Stage**                       | **Primary Work**                                                                                                                         | **Validation**                                                                  |
|---------------------------------|------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------|
| **1. World Profile**            | Resolve world size, land distribution, climate spread, terrain drama, civilisation density, magic pressure, danger, and enabled content. | Profile combinations are valid and do not create impossible progression.        |
| **2. Landmass Skeleton**        | Generate major land bodies, broad coast boundary placeholders, continental interiors, and macro elevation fields.                        | No disconnected slivers or unplayable land dominance unless preset requests it. |
| **3. Mountain and Basin Pass**  | Place mountain chains, uplifts, plateaus, rifts, volcanic arcs, basins, and major passes.                                                | Landforms form readable barriers and corridors.                                 |
| **4. Watershed Pass**           | Derive drainage, springs, tributaries, rivers, lakes, wetlands, floodplains, and end basins.                                             | Water flows downhill and produces useful settlement and travel geography.       |
| **5. Climate Pass**             | Resolve temperature, moisture, seasonality, continentality, exposure, storm tracks, rain shadows, and local anomalies.                   | Climate fields are smooth, varied, and explainable.                             |
| **6. Region Partition**         | Divide land into macro-regions and terrain provinces using ridges, watersheds, ecological thresholds, and historical boundaries.         | Regions have distinct identities without hard biome borders.                    |
| **7. Biome Mosaic**             | Select primary biomes, sub-biomes, ecotones, river corridors, treelines, snowlines, and rare patches.                                    | Adjacency rules and minimum patch sizes pass.                                   |
| **8. History and Civilisation** | Generate past occupations, roads, ruins, current territories, settlements, farms, mines, borders, and abandoned sites.                   | Geography and history agree.                                                    |
| **9. Adventure and Ecology**    | Place creature habitats, migration, lairs, dungeons, resource landmarks, bosses, world events, and rumours.                              | Content has compatible habitat, access, and signposting.                        |
| **10. Validation and Repair**   | Test traversal, spawn suitability, resource access, route connectivity, repetition, content budgets, and progression alternatives.       | No fixed POC anchor is required to repair the seed.                             |

## 5.1 World Profile Presets

| **Preset**                | **World Effect**                                                                                                                     |
|---------------------------|--------------------------------------------------------------------------------------------------------------------------------------|
| **Balanced Realms**       | Broad climate spread, moderate terrain, normal civilisation, natural fantasy first, standard biome rarity.                           |
| **Wild Frontier**         | Lower settlement density, larger wilderness regions, stronger ecology, more lairs, longer routes, higher regional danger.            |
| **Dense Civilisation**    | More roads, farms, towns, borders, trade corridors, reclaimed land, ruins, politics, and contested resources.                        |
| **Gentle Builder**        | More buildable valleys and plains, softer hazards, accessible resources, reduced disaster intensity, wider safe-start eligibility.   |
| **Dramatic Terrain**      | Larger mountains, deeper valleys, stronger cliffs, plateaus, canyons, waterfalls, and route-engineering challenges.                  |
| **Harsh Climate**         | Stronger temperature, drought, storm, snow, seasonal food, clothing, shelter, and travel pressure.                                   |
| **Long Seasons**          | Longer seasonal states and agricultural planning; migration and snow/flood cycles become more important.                             |
| **High Wilderness Magic** | Natural regions remain dominant but mana anomalies, leyline effects, magical wildlife, and special-biome gateways are more frequent. |
| **Sparse Magic**          | Magic remains present through rare sites and dimensions, but normal surface regions have lower ambient mana.                         |
| **Custom Profile**        | Player-adjustable sliders with compatibility warnings and seed-preview summaries.                                                    |

# 6. Climate Simulation Foundation

Climate is represented by overlapping deterministic fields instead of one biome lookup. These fields do not need to be physically exact, but they must produce consistent consequences for vegetation, water, snow, soil, settlement, farming, creatures, weather, fire, travel, and resources.

| **Climate Field**              | **Meaning**                                                                  | **Gameplay Consequences**                                                                          |
|--------------------------------|------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------|
| **Mean Temperature**           | Long-term warmth before local modifiers.                                     | Vegetation family, snow likelihood, crop suitability, creature ranges, clothing and shelter needs. |
| **Seasonal Temperature Range** | Difference between warm and cold seasons.                                    | Growing season, freeze-thaw, migration, rivers, food storage, winter access.                       |
| **Moisture Supply**            | Rain, snow, groundwater, river influence, and atmospheric humidity.          | Forest density, grass height, wetlands, fire risk, agriculture, water availability.                |
| **Seasonality of Rain**        | Whether moisture is steady, monsoon, wet/dry, winter-dominant, or irregular. | Floods, droughts, crop calendars, migration, road conditions.                                      |
| **Continentality**             | Distance and separation from large water influences.                         | Temperature extremes, dryness, storm moderation, inland basins.                                    |
| **Altitude**                   | Height above regional baseline.                                              | Cooling, snowline, tree line, slope, visibility, wind, oxygen/pressure if enabled.                 |
| **Wind Exposure**              | Prevailing winds, ridge exposure, shelter, and funnel effects.               | Wind power, storm damage, vegetation form, travel, sound and particle ambience.                    |
| **Storm Pressure**             | Frequency and intensity of normal severe weather.                            | Lightning, hail, blizzard, dust storm, flood, forest fire ignition.                                |
| **Hydrological Saturation**    | Groundwater, drainage, flood frequency, and soil saturation.                 | Marsh, fen, bog, floodplain, farming drainage, foundations.                                        |
| **Mana Influence**             | Low-level magical modification that still preserves natural readability.     | Unusual growth, rare resources, magical fauna, weather anomalies; strong cases transition to 24C.  |

## 6.1 Climate Coherence Rules

- Climate changes gradually across ordinary terrain unless mountains, rifts, elevation, water, or explicit magical causes explain a sharp boundary.

- High mountains can create cold islands and rain shadows inside warm regions.

- Large inland basins may become arid even when surrounding highlands are wetter.

- Rivers and groundwater can create green corridors through dry regions.

- Volcanic heat can create local warm pockets, snowmelt, fertile soils, ash hazards, or geothermal wetlands.

- Magical influence may bend climate, but the player should see signs explaining why.

# 7. Temperature, Moisture, Seasonality, and Exposure Bands

| **Band**           | **Definition**                                                    | **Typical Surface Results**                     |
|--------------------|-------------------------------------------------------------------|-------------------------------------------------|
| **Polar**          | Permanent or near-permanent ice and extreme cold.                 | Snow desert, blue-ice flats, polar plateau.     |
| **Subpolar**       | Very short growing season; tundra and sparse cold woodland.       | Open tundra, lichen moor, frost meadow.         |
| **Cold**           | Long winter, short summer, strong freeze-thaw.                    | Taiga, snow pine, cold meadow.                  |
| **Cool Temperate** | Cool summers, frequent rain or snow, moderate forests and moors.  | Misty woodland, heath, lake districts.          |
| **Temperate**      | Broad four-season range and high ecological diversity.            | Meadows, broadleaf forest, farmland, steppe.    |
| **Warm Temperate** | Mild winters, hot summers, scrub, dry forest, productive valleys. | Warm steppe, dry woodland, river plains.        |
| **Subtropical**    | Warm year-round with seasonal rainfall or dry periods.            | Monsoon forest, warm scrub, savanna.            |
| **Tropical**       | Warm and humid or strongly wet/dry year-round.                    | Rainforest, flooded jungle, seasonal grassland. |
| **Extreme Heat**   | Persistent high heat, often arid or geothermal.                   | Dune seas, salt basins, lavafield margins.      |

| **Moisture Band** | **Definition**                                                                                                  |
|-------------------|-----------------------------------------------------------------------------------------------------------------|
| **Hyperarid**     | Almost no reliable precipitation; water survives through deep aquifers, rare storms, snowmelt, magic, or trade. |
| **Arid**          | Sparse vegetation, episodic water, high evaporation, drought-adapted ecology.                                   |
| **Semi-Arid**     | Grass, scrub, seasonal streams, grazing, fire cycles, drought risk.                                             |
| **Seasonal**      | Alternating wet and dry periods; flood and migration rhythms matter.                                            |
| **Mesic**         | Moderate reliable moisture supporting diverse grassland and woodland.                                           |
| **Humid**         | Frequent rain, dense vegetation, fungal growth, erosion, muddy travel.                                          |
| **Saturated**     | Waterlogged soils, marshes, fens, swamps, peat, difficult foundations.                                          |
| **Flooded**       | Permanent or seasonal standing water, channels, islands, aquatic travel, flood hazards.                         |

| **Seasonality Regime**  | **Gameplay Identity**                                                                                     |
|-------------------------|-----------------------------------------------------------------------------------------------------------|
| **Aseasonal**           | Little temperature change; rainfall or events provide the main rhythm.                                    |
| **Four-Season Mild**    | Recognisable spring, summer, autumn, and winter without severe extremes.                                  |
| **Continental Extreme** | Hot or warm summer, severe winter, strong freeze-thaw and storage pressure.                               |
| **Wet / Dry**           | Rainfall, rivers, vegetation, migration, farming, and fire shift between two major seasons.               |
| **Monsoon**             | Intense rain period, flood risk, landslides, road failure, rapid growth.                                  |
| **Polar Light Cycle**   | Long winter darkness and short productive summer; configurable for playability.                           |
| **Storm Season**        | Regular period of severe storms, lightning, hail, tornado-like winds, or dust.                            |
| **Anomalous**           | Magically or historically altered seasons; ordinary cases remain in 24B, strong cases become 24C content. |

# 8. Hydrology, Watersheds, Rivers, Lakes, and Wetland Formation

Water should be generated as a connected system rather than isolated decorative pools. Mountains and uplands create catchments; catchments feed streams; streams join rivers; rivers cut valleys, cross plains, fill lakes, spread into wetlands, or exit toward coasts handled in 24C. Water affects settlement, agriculture, transport, power, ecology, disease, defence, weather, and resource placement.

| **Hydrology Element**   | **Generation Role**                                                                        | **World Content**                                                           |
|-------------------------|--------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------|
| **Spring / Seep**       | Groundwater emergence, snowmelt, geothermal source, or magical leak.                       | Fresh water, herbs, small shrines, settlement seed, cave clue.              |
| **Headwater Stream**    | Narrow highland flow with rapids and seasonal change.                                      | Crossings, mills, trout-like fauna, erosion, hidden paths.                  |
| **Tributary**           | Secondary river joining a larger system.                                                   | Valleys, farms, roads, local trade, bridge sites.                           |
| **Main River**          | Major navigation and civilisation corridor.                                                | Ports, ferries, irrigation, trade towns, flood defence, river monsters.     |
| **Braided River**       | Multiple shifting channels carrying sediment.                                              | Difficult roads, rich gravel resources, seasonal islands, flood risk.       |
| **Lake Basin**          | Standing inland water fed by rivers, groundwater, glacier, crater, or tectonic depression. | Fishing, settlements, fog, storms, freshwater trade, ruins.                 |
| **Oxbow / Backwater**   | Abandoned or slow river channels.                                                          | Wetlands, herbs, ambushes, disease, hidden structures.                      |
| **Floodplain**          | Lowland regularly inundated by rivers.                                                     | Fertile farms, flood disasters, levees, raised roads, migration.            |
| **Marsh / Fen / Swamp** | Saturated lowland differentiated by water source, vegetation, soil, and acidity.           | Special resources, difficult construction, unique ecology, hidden dungeons. |
| **Endorheic Basin**     | Closed drainage with salt or seasonal lake.                                                | Salt, minerals, caravan routes, drought, mirages, buried settlements.       |

## 8.1 Water Validation Rules

- Rivers must follow local drainage and should not terminate without a lake, wetland, underground sink, evaporation basin, or coast connection.

- Major settlements require a plausible water source, storage solution, trade supply, or magical infrastructure.

- Floodplains must have visible high-water evidence and compatible roads, farms, architecture, and hazards.

- Wetland generation must preserve traversable routes, boat or bridge opportunities, and dry settlement islands where appropriate.

- Waterfalls occur at meaningful elevation changes and can support landmarks, power, hidden entrances, or sacred sites.

# 9. Elevation, Slope, Rain Shadows, and Terrain Provinces

| **Terrain Province**  | **Character**                                                                   | **Gameplay Consequences**                                                      |
|-----------------------|---------------------------------------------------------------------------------|--------------------------------------------------------------------------------|
| **Lowland Plain**     | Low relief, broad rivers, deep soil, high settlement and agriculture potential. | Flood, invasion corridors, limited stone exposure.                             |
| **Rolling Upland**    | Gentle hills, mixed farms and woods, good roads with local ridges.              | Moderate buildability and strong visual variety.                               |
| **Plateau**           | High flat or rolling surface with escarpment boundaries.                        | Wind power, grazing, exposed resources, difficult access.                      |
| **Foothill Belt**     | Transition between lowlands and mountain chains.                                | Mining, forests, passes, springs, hill forts, landslides.                      |
| **Mountain Chain**    | High relief, snowline, valleys, ridges, passes, glaciers, rain shadows.         | Rare resources, defensive sites, difficult logistics, apex threats.            |
| **Basin**             | Enclosed or semi-enclosed low area.                                             | Lakes, wetlands, cities, fog, heat, aridity, salt, or flood depending climate. |
| **Escarpment**        | Long steep boundary between elevations.                                         | Cliff roads, waterfalls, caves, fortresses, route chokepoints.                 |
| **Rift Valley**       | Linear depression with faults, lakes, volcanoes, geothermal activity.           | Minerals, fertile soils, hazards, ancient structures.                          |
| **Canyon Province**   | Deeply incised rivers and dry channels.                                         | Vertical exploration, hidden settlements, bridges, lairs, exposed strata.      |
| **Karst Province**    | Soluble stone with sinkholes, towers, springs, disappearing rivers.             | Caves, hidden water, monasteries, collapse risk, unusual agriculture.          |
| **Volcanic Province** | Calderas, lava plateaus, cones, ash soils, geothermal zones.                    | Metal, glass, heat, fertile recovery, eruptions, forge cultures.               |
| **Glacial Province**  | Ice-shaped valleys, moraines, lakes, cirques, outwash plains.                   | Cold travel, meltwater, exposed ore, ice dungeons, seasonal flooding.          |

## 9.1 Rain Shadow Rule

Prevailing moisture crossing a mountain chain should create a wetter windward side and a drier leeward side when region scale permits. This provides natural sequences such as coastal or lake-fed forest -\> mountain woodland -\> alpine ridge -\> dry steppe -\> desert basin. Sharp exceptions require geothermal, magical, hydrological, or historical explanation.

# 10. Landform Grammar and Region Readability

| **Grammar Element**             | **Purpose**                                                                           | **Examples**                                                                       |
|---------------------------------|---------------------------------------------------------------------------------------|------------------------------------------------------------------------------------|
| **Anchor Silhouette**           | One or more visible forms identify the region at long range.                          | Mountain crown, mesa wall, giant valley, crater rim, plateau edge.                 |
| **Primary Corridor**            | A major travel and settlement axis.                                                   | River valley, mountain pass, old road, ridge route, canyon floor.                  |
| **Secondary Network**           | Smaller routes and exploration branches.                                              | Tributaries, animal trails, dry gullies, forest clearings, foothill paths.         |
| **Buildable Pockets**           | Deliberate areas suited to bases, farms, villages, and machinery.                     | Terraces, valley floors, plateaus, clearings, river benches.                       |
| **Traversal Challenge**         | Terrain requiring bridges, stairs, tunnels, roads, boats, mounts, climbing, or magic. | Ravine, scree, marsh, cliff, dense jungle, dune field.                             |
| **Resource Expression**         | Visible geology and ecology hint at useful materials.                                 | Ore staining, clay banks, exposed strata, mineral plants, old quarries.            |
| **Adventure Depth**             | Landform hides or frames dungeons, ruins, lairs, and bosses.                          | Cave mouths, crater temples, root mazes, cliff monasteries.                        |
| **Safe and Dangerous Contrast** | Readable refuge and risk zones coexist.                                               | Open meadow beside dense predator forest; valley settlement beneath haunted ridge. |

# 11. Region Identity, Naming, History, and Procedural Lore

Macro-regions should receive identity from a small set of dominant anchors rather than a random name alone. A region may be defined by its watershed, mountain wall, dominant forest, exposed mineral, seasonal wind, old empire road, current faction border, migrating titan, or persistent disaster. These anchors influence names, rumours, maps, architecture, resources, quests, and visual motifs.

| **Identity Channel** | **Examples**                                                                   |
|----------------------|--------------------------------------------------------------------------------|
| **Climate Anchor**   | Frost, monsoon, drought, mist, wind, long autumn, storm season.                |
| **Landform Anchor**  | Basin, range, marches, plateau, gorge, vale, steppe, moor, caldera.            |
| **Ecology Anchor**   | Redwood, giant fern, herd migration, predator range, fire-adapted grass.       |
| **Material Anchor**  | Copper hills, salt flats, black glass, white chalk, amber clay.                |
| **History Anchor**   | Fallen road, battlefield, abandoned canal, old border, drowned kingdom.        |
| **Culture Anchor**   | Current or former people, architecture, farming pattern, shrine network, law.  |
| **Danger Anchor**    | Boss territory, raider route, plague marsh, avalanche pass, wildfire corridor. |
| **Magic Anchor**     | Low leyline hum, seasonal spirit migration, harmless aurora, unstable spring.  |

## 11.1 Procedural Name Construction

Names can combine a descriptive root, landform term, cultural language layer, and historical modifier. Examples such as Amberwind March, Frostglass Basin, Redbough Vale, Whitecap Reach, Broken Crown Range, Reedshadow Fen, or Copperstep Uplands are illustrative only. They are not fixed canonical regions and should be generated through culture-aware naming sets.

# 12. Biome Family Architecture, Inheritance, and Tags

| **Data Layer**         | **Controls**                                                                                                                                                             | **Examples**                                                 |
|------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------|
| **BaseSurfaceBiome**   | Stable ID, family, climate ranges, terrain compatibility, palette, vegetation, soil, resource, ecology, structure, settlement, adventure, map, and dynamic-state fields. | All natural land-surface biomes.                             |
| **Climate Family**     | Shared temperature, moisture, seasonality, weather, fire, snow, and agricultural rules.                                                                                  | Temperate, boreal, tropical, arid, polar.                    |
| **Landform Variant**   | Slope, elevation, drainage, erosion, rock exposure, buildability, and traversal.                                                                                         | Lowland, upland, plateau, valley, ridge, basin.              |
| **Vegetation Variant** | Canopy, density, dominant plant families, regrowth, fuel load, and visibility.                                                                                           | Open woodland, old-growth, scrub, tallgrass, mossy.          |
| **Hydrology Modifier** | River, spring, floodplain, lake edge, groundwater, saturation, or drought influence.                                                                                     | Riparian forest, wet meadow, dry steppe, bog woodland.       |
| **Regional Overlay**   | Geology, history, culture, mana, resource, danger, or route identity inherited from region.                                                                              | Copper-rich hills, old road forest, warded border grassland. |
| **Dynamic State**      | Runtime season, fire, flood, drought, infestation, overharvest, settlement, restoration, corruption, or abandonment.                                                     | Burned, spring bloom, snowbound, reclaimed, industrialised.  |

| **Tag Family**   | **Examples**                                                                                             |
|------------------|----------------------------------------------------------------------------------------------------------|
| **Climate**      | temp_polar, temp_temperate, temp_tropical, moisture_arid, moisture_humid, monsoon, continental.          |
| **Terrain**      | flat, rolling, steep, plateau, basin, canyon, karst, volcanic, glacial, riverine, buildable.             |
| **Vegetation**   | grassland, broadleaf, needleleaf, rainforest, scrub, reeds, moss, sparse, old_growth.                    |
| **Hydrology**    | river, lake, spring, floodplain, saturated, seasonal_water, groundwater, endorheic.                      |
| **Civilisation** | farmable, grazing, timber, mining, trade_corridor, hidden_settlement, road_difficult, fortress_site.     |
| **Ecology**      | herd, apex_predator, burrower, migratory, pollinator, aquatic_edge, fire_cycle, winter_dormancy.         |
| **Adventure**    | lair, ruin, dungeon, boss_territory, caravan_risk, ambush, hidden_valley, landmark_dense.                |
| **Dynamic**      | burnable, floodable, droughtable, overharvestable, reclaimable, wardable, corruptible, seasonal_palette. |
| **Planning**     | foundation, production_priority, content_complete, art_ready, audio_ready, balance_draft.                |

# 13. Biome Mosaics, Adjacency, Ecotones, and Transition Rules

Biomes form mosaics rather than perfect solid zones. A macro-region usually contains one or two dominant biome families, several common secondary biomes, transition corridors, and rare local patches. Rivers, elevation, soil, fire, settlement, and history create internal variety.

| **Transition Type**       | **Typical Sequence**                                                                            | **Gameplay Purpose**                                                 |
|---------------------------|-------------------------------------------------------------------------------------------------|----------------------------------------------------------------------|
| **Forest Edge**           | Dense forest -\> open woodland -\> shrub/fern edge -\> meadow or farmland.                      | Visibility, hunting, settlement expansion, fire spread, ambush risk. |
| **Treeline**              | Mountain forest -\> stunted woodland -\> alpine scrub -\> alpine meadow -\> bare ridge or snow. | Altitude progression, shelter loss, rare herbs, wind and cold.       |
| **Rain Shadow**           | Wet forest -\> foothill woodland -\> dry upland -\> steppe -\> desert.                          | Regional travel, farming change, culture routes, resource contrast.  |
| **Riparian Corridor**     | Any dry or moderate biome -\> riverbank grass/reeds -\> riparian woodland -\> floodplain.       | Water access, settlement chain, creature migration, road crossing.   |
| **Wetland Fringe**        | Meadow/forest -\> wet meadow -\> fen/marsh -\> open water or swamp.                             | Foundation risk, herbs, fishing, disease, hidden paths.              |
| **Snowline**              | Cold grass/forest -\> persistent snow patches -\> icefield margin -\> glacier.                  | Seasonal access, avalanche, meltwater, boss signs.                   |
| **Volcanic Succession**   | Fresh lava/pumice -\> ash scrub -\> pioneer grass -\> fertile woodland or farm.                 | Time-since-eruption states, rare materials, fertile recovery.        |
| **Drought Gradient**      | Humid grassland -\> seasonal grassland -\> thorn scrub -\> semi-desert -\> arid core.           | Migration, fire, water logistics, settlement adaptation.             |
| **Civilisation Gradient** | Wilderness -\> managed woodland/pasture -\> farms -\> settlement edge -\> urban district.       | NPC work, roads, safety, theft, resources, ecological displacement.  |
| **Damage/Recovery**       | Intact -\> burned/flooded/war-torn -\> early regrowth -\> restored or transformed.              | World memory and player restoration.                                 |

## 13.1 Invalid Adjacency Repair

When climate or terrain fields would create an implausible adjacency, generation inserts an ecotone, changes elevation, adds a river or basin, reduces patch size, or invokes an explicit magical/historical cause. A hot dune sea should not touch a glacier across a flat ordinary plain. It may touch a glacier across a towering magical rift, volcanic winter boundary, or high mountain wall if the world visibly explains it.

# 14. Spawn and Starting-Area Suitability Without Fixed Content

The starting area is selected after region and biome generation. It is not generated first as a special valley. The system searches for a locally viable cluster, validates multiple survival routes, and rejects areas that rely on exact POC content.

| **Requirement**               | **Production Rule**                                                                                                                   |
|-------------------------------|---------------------------------------------------------------------------------------------------------------------------------------|
| **Immediate Safety**          | A small radius without unavoidable boss, raid, extreme climate, lethal terrain, or hostile settlement pressure.                       |
| **Basic Materials**           | Wood or substitute, stone, fibre, food, and light/fuel access within reasonable exploration range.                                    |
| **Fresh Water or Substitute** | Reachable water, snowmelt, spring, reliable food moisture, trade, or world-setting-approved survival alternative.                     |
| **Shelter Potential**         | Cave, overhang, trees, terrain pocket, abandoned minor shelter, or easily buildable ground.                                           |
| **Early Metal Path**          | At least one discoverable copper/iron route through prospecting, trade, salvage, shallow mining, or culture access.                   |
| **Magic Foreshadowing**       | Optional low-risk clue through ruins, NPC knowledge, ambient phenomena, resource hints, or distant landmark; not a fixed mana pocket. |
| **Expansion Choices**         | At least two meaningful directions leading to different resources, terrain, civilisation, or adventure content.                       |
| **Settlement Independence**   | A settlement may be nearby, distant, hostile, hidden, or absent. The player is not blocked from survival or progress.                 |
| **Buildability**              | At least one local area supports a first base and simple machine/logistics layout, or offers clear terraforming solutions.            |
| **Validation Escape**         | If the cluster fails, the spawn search moves to another compatible region rather than rewriting the world around a fixed start.       |

## 14.1 Start Preference Settings

| **Setting**                | **Options**                                                                   |
|----------------------------|-------------------------------------------------------------------------------|
| **Climate Preference**     | Any viable, temperate-biased, cold, warm, arid, wet, highland, random harsh.  |
| **Civilisation Proximity** | Nearby clues, moderate distance, remote wilderness, random.                   |
| **Threat**                 | Gentle, normal, harsh, hostile frontier.                                      |
| **Guidance**               | Full tutorial hints, light environmental guidance, discovery-only.            |
| **Resource Generosity**    | Abundant, normal, scarce; still validated for at least one progression route. |

# 15. Temperate Plains, Meadows, Heaths, and Steppes

Open to semi-open temperate landscapes support farming, grazing, roads, caravans, settlements, wind power, burrowing creatures, herd migration, exposed ruins, and weather visibility. Variation comes from soil, moisture, grazing, fire, elevation, and seasonality.

| **Core Biome**        | **Primary Hooks**                                       |
|-----------------------|---------------------------------------------------------|
| **Lowland Meadow**    | fertile, buildable, village-friendly, flood-aware       |
| **Wildflower Meadow** | pollinators, herbs, colour seasons, fae rumours         |
| **Rolling Pasture**   | grazing, fences, farmsteads, windmills                  |
| **River Prairie**     | tall grasses, fertile sediment, floods, herds           |
| **Tallgrass Plain**   | low visibility, fire cycles, predators, grain           |
| **Windsteppe**        | dry grass, strong wind, caravan routes, storms          |
| **Heather Moor**      | acid soil, peat, fog, barrows, sheep-like livestock     |
| **Chalk Downland**    | white cliffs and slopes, herbs, springs, ancient tracks |

# 16. Temperate Forests and Woodlands

Temperate forests range from open managed woodland to dense old-growth. They provide timber, food, medicine, concealment, wildlife, ruins, logging conflicts, spirit traditions, and fire or storm damage. Canopy, age, soil, moisture, season, and management create distinct play.

| **Core Biome**             | **Primary Hooks**                                   |
|----------------------------|-----------------------------------------------------|
| **Mixed Broadleaf Forest** | balanced timber, forage, villages, deer-like herds  |
| **Ancient Oakwood**        | old trees, sacred sites, root dungeons, apex beasts |
| **Beechwood Hollow**       | smooth trunks, deep leaf litter, hidden roads       |
| **Redbark Forest**         | durable timber, red soils, fire resistance          |
| **Silver Birch Grove**     | pioneer woodland, light canopy, regrowth            |
| **Autumn Maplewood**       | seasonal colour, syrup-like resources, festivals    |
| **Evergreen Pinewood**     | resin, straight timber, snow tolerance, fire        |
| **Mistwood**               | fog, moss, fungi, spirits, low visibility           |

# 17. Boreal Forests, Taiga, and Cold Woodlands

Cold woodland regions provide timber, resin, fur, fish, peat, iron, winter routes, seasonal isolation, large predators, and strong settlement preparation. Snow depth, permafrost, fire, bogs, and short summers create distinct rhythms.

| **Core Biome**           | **Primary Hooks**                              |
|--------------------------|------------------------------------------------|
| **Boreal Sprucewood**    | dense needleleaf, snow, wolves, timber         |
| **Larch Taiga**          | seasonally bare conifers, wetlands, cold roads |
| **Snow Pine Forest**     | deep snow, mountain edge, resin, ambush        |
| **Muskeg Taiga**         | boggy forest, peat, insects, hidden water      |
| **Frost Birch Woodland** | open cold forest, regrowth, browse animals     |
| **Cold Meadow**          | short summer bloom, grazing, frost hazards     |
| **Permafrost Scrub**     | low shrubs, frozen soil, scarce timber         |
| **Needleleaf Highlands** | windy ridges, snowpack, ore exposure           |

# 18. Tundra, Polar, and Glacial Surface Biomes

Treeless cold surfaces emphasise wind, visibility, seasonal access, scarce fuel, migration, ice, exposed geology, and dangerous weather. They support rare cold resources, ancient preservation, glacial dungeons, and large roaming threats.

| **Core Biome**      | **Primary Hooks**                                    |
|---------------------|------------------------------------------------------|
| **Open Tundra**     | low plants, herds, long sightlines, permafrost       |
| **Lichen Moor**     | rocky ground, lichens, medicinal moss, ruins         |
| **Frost Meadow**    | summer flowers, meltwater, migratory wildlife        |
| **Icefield Margin** | snow and exposed ice, crevasses, melt streams        |
| **Glacial Valley**  | U-shaped valley, moraines, caves, waterfalls         |
| **Snow Desert**     | windblown snow, low life, navigation risk            |
| **Polar Plateau**   | high cold flatland, storms, rare minerals            |
| **Blue-Ice Flats**  | dense ancient ice, reflections, preserved structures |

# 19. Tropical and Subtropical Forests

Warm forests provide dense vertical exploration, rapid growth, abundant food and medicine, disease and poison pressure, powerful rivers, canopy settlements, hidden ruins, and specialised agriculture. Rainfall rhythm and elevation separate rainforest, monsoon, dry forest, and cloud forest.

| **Core Biome**          | **Primary Hooks**                              |
|-------------------------|------------------------------------------------|
| **Lowland Rainforest**  | dense canopy, rivers, biodiversity, ruins      |
| **Cloud Forest**        | misty high elevation, epiphytes, rare herbs    |
| **Monsoon Forest**      | flood/dry seasons, deciduous canopy, storms    |
| **Giant Fernwood**      | fern towers, damp soil, prehistoric fauna      |
| **Bamboo Wilds**        | fast regrowth, building material, dense paths  |
| **Flooded Jungle**      | channels, boat travel, tree islands, predators |
| **Dry Tropical Forest** | seasonal leaf loss, fire, hardwood             |
| **Highland Jungle**     | steep warm forest, waterfalls, mineral slopes  |

# 20. Savannas, Seasonal Grasslands, and Warm Scrub

Warm open regions are shaped by wet/dry seasons, fire, grazing, migration, waterholes, thorn vegetation, caravan routes, pastoral cultures, termites or burrowers, and large predators. They provide strong seasonal world events.

| **Core Biome**         | **Primary Hooks**                                 |
|------------------------|---------------------------------------------------|
| **Golden Savanna**     | tall grass, herd migration, scattered trees       |
| **Acacia Woodland**    | open tree cover, grazing, hardwood, shade         |
| **Seasonal Grassland** | green wet season, dry fire season                 |
| **Baobab Plain**       | water-storing giant trees, landmarks, settlements |
| **Thorn Scrub**        | dense thorn, goats, raiders, hidden ruins         |
| **Warm Steppe**        | dry grass, horses or mounts, trade routes         |
| **Sunbaked Bushland**  | rocky scrub, heat, medicinal plants               |
| **Redgrass Upland**    | iron-rich soil, wind, grazing, hill forts         |

# 21. Deserts, Drylands, Badlands, and Salt Basins

Arid regions depend on water logic, temperature timing, shade, navigation, trade, deep storage, oasis or river corridors, and episodic storms. They provide exposed geology, salts, glass, rare plants, buried structures, and large territorial monsters.

| **Core Biome**         | **Primary Hooks**                              |
|------------------------|------------------------------------------------|
| **Sand Dune Sea**      | moving dunes, buried ruins, sand travel        |
| **Gravel Desert**      | open stony plain, caravan routes, meteorites   |
| **Stone Desert**       | bare rock, caves, heat storage, minerals       |
| **Red Mesa Badlands**  | layered cliffs, canyons, fossils, outlaws      |
| **Canyon Drylands**    | deep shade, rivers, cliff settlements          |
| **Saltpan Basin**      | evaporites, mirages, seasonal water, corrosion |
| **Dry Wadi Network**   | flash floods, hidden wells, route corridors    |
| **Desert Bloom Basin** | rare rain bloom, migration, harvest events     |

# 22. Wetlands, Marshes, Bogs, Fens, and Floodplains

Wetlands are resource-rich but difficult to build and travel through. Water chemistry, peat, trees, reeds, flood frequency, channels, disease, fog, fire, and seasonal drying create different families. They support boats, raised roads, hidden ruins, alchemy, fishing, and enormous aquatic or amphibious threats.

| **Core Biome**         | **Primary Hooks**                          |
|------------------------|--------------------------------------------|
| **Reed Marsh**         | shallow water, reeds, birds, fishing, fire |
| **Peat Bog**           | acid water, peat fuel, preserved remains   |
| **Sedge Fen**          | mineral-fed wetland, herbs, grazing edges  |
| **Cypress Swamp**      | wooded water, roots, boats, ambush         |
| **Floodplain Wetland** | seasonal inundation, fertile farms, levees |
| **Oxbow Lakes**        | backwaters, fish, reeds, hidden camps      |
| **Mist Moor**          | wet heath, fog, barrows, poor roads        |
| **Quaking Mire**       | floating mats, sink risk, rare reagents    |

# 23. Highlands, Mountains, Alpine, and Plateau Biomes

High terrain creates vertical climate, rain shadows, springs, ore exposure, defensive sites, passes, avalanches, cliffs, isolated cultures, wind power, rare herbs, and flying or climbing creatures. Valleys and plateaus preserve buildability within dramatic terrain.

| **Core Biome**              | **Primary Hooks**                           |
|-----------------------------|---------------------------------------------|
| **Foothill Woodland**       | forest-to-mountain transition, mines, farms |
| **Rolling Highland**        | grazing, stone, wind, hill settlements      |
| **Rocky Upland**            | exposed rock, scrub, quarries, forts        |
| **Alpine Meadow**           | summer pasture, rare herbs, snowmelt        |
| **Scree Slopes**            | loose rock, slides, ore, difficult travel   |
| **Mountain Conifer Forest** | steep timberland, snow, predators           |
| **Clouded Peaks**           | fog, cliffs, storms, flying threats         |
| **High Plateau**            | cold open upland, wind, caravan roads       |

# 24. Volcanic, Geothermal, and Young-Land Biomes

Volcanic regions provide heat, ash, fertile recovery, metal and glass resources, unstable terrain, geothermal power, hot springs, toxic gas, eruption events, and ancient forge or ritual sites. They should include living landscapes, not only lava hazards.

| **Core Biome**            | **Primary Hooks**                           |
|---------------------------|---------------------------------------------|
| **Basaltic Plateau**      | dark columns, thin soil, wind, quarries     |
| **Ashen Caldera**         | fertile inner basin, eruption history, lake |
| **Lavafield Margin**      | cooling flows, caves, pioneer plants        |
| **Geothermal Springs**    | hot pools, steam, healing, mineral deposits |
| **Obsidian Ridge**        | glass resource, sharp terrain, lightning    |
| **Pumice Barrens**        | light stone, ash wind, sparse life          |
| **Sulfur Flats**          | toxic vents, alchemy, masks, instability    |
| **Volcanic Cloud Forest** | warm wet slope, ash soil, dense life        |

# 25. Karst, Limestone, Canyon, and Eroded-Stone Biomes

Soluble and heavily eroded landscapes create sinkholes, arches, cliffs, hidden rivers, springs, towers, caves, vertical settlements, monasteries, mines, and ambush terrain. Surface and underground content must connect without moving full cave ownership out of 24C.

| **Core Biome**          | **Primary Hooks**                           |
|-------------------------|---------------------------------------------|
| **Limestone Karst**     | sinkholes, springs, caves, fertile pockets  |
| **Sinkhole Plain**      | closed depressions, farms, collapse risk    |
| **Tower Karst**         | isolated stone towers, jungle or scrub      |
| **Canyon Labyrinth**    | branching gorges, hidden roads, lairs       |
| **Stone Archlands**     | natural bridges, wind, shrines, routes      |
| **Hoodoo Valley**       | eroded spires, bandits, fossils             |
| **Travertine Terraces** | mineral springs, stepped pools, settlements |
| **Chalk Ravines**       | white slopes, herbs, fossils, ancient roads |

# 26. Rivers, Lakes, Springs, and Inland-Water Interfaces

These biomes occupy the land-water edge and connect broader surface families. They support settlement, fishing, transport, mills, irrigation, floods, river monsters, ferries, bridges, sacred springs, and water-linked dungeons. Ocean and coastal interfaces are expanded in 24C.

| **Core Biome**             | **Primary Hooks**                            |
|----------------------------|----------------------------------------------|
| **Riverbank Woodland**     | riparian trees, shade, bridges, wildlife     |
| **Braided River Plain**    | gravel bars, shifting channels, floods       |
| **Lake Meadow**            | open inland shore, fishing, farms, fog       |
| **Inland Shore**           | beaches, reeds, storms, settlement ports     |
| **River Gorge**            | cliffs, rapids, bridges, hidden entrances    |
| **Waterfall Basin**        | spray ecology, power, shrine, cavern clue    |
| **Springs and Seepfields** | fresh water, herbs, sacred or village sites  |
| **Riparian Forest**        | linear dense forest through dry or open land |

# 27. Seasonal States, Weather, and Natural Disasters

| **State / Event**         | **World and Gameplay Effects**                                                                   |
|---------------------------|--------------------------------------------------------------------------------------------------|
| **Spring Thaw**           | Snowmelt, mud, floods, road damage, fish runs, planting, avalanche risk.                         |
| **Summer Growth**         | High productivity, long travel days, insects, storms, drought or fire depending climate.         |
| **Autumn Harvest**        | Crop and forage abundance, animal migration, storms, leaf cover, food preservation.              |
| **Winter Snowbound**      | Reduced farming, frozen water, deep snow, cold danger, new routes across ice, predator pressure. |
| **Wet Season**            | Flooded channels, rapid plant growth, road closure, disease, boat travel, spawning events.       |
| **Dry Season**            | Water scarcity, migration, fire, exposed ruins, easier wetland travel, dust.                     |
| **Drought**               | Crop failure, low rivers, conflict over water, boss migration, wildfire, trade price changes.    |
| **Flood**                 | Settlement damage, new channels, fertile deposits, displaced creatures, repair projects.         |
| **Wildfire**              | Vegetation loss, smoke, fleeing wildlife, burned structures, pioneer succession, ash resources.  |
| **Blizzard**              | Visibility loss, snow accumulation, stranded caravans, frozen machines, rescue events.           |
| **Dust / Sand Storm**     | Navigation risk, exposed or buried structures, machine wear, caravan disruption.                 |
| **Landslide / Avalanche** | Blocked routes, destroyed structures, exposed resources, new dungeon entrances.                  |
| **Severe Thunderstorm**   | Lightning, fire ignition, power opportunities, flash flood, flying creature behaviour.           |
| **Volcanic Event**        | Ashfall, lava, gas, evacuation, new rock, fertile later state, awakened threats.                 |

## 27.1 Disaster Fairness

Disasters should be signposted, configurable, spatially limited, and consequential rather than arbitrary. Settlements, NPCs, roads, farms, wildlife, machines, and structures react through preparation, damage, evacuation, repair, migration, shortages, and long-term state. Peaceful settings may reduce destructive effects while preserving visual and ecological change.

# 28. Resources, Soil, Vegetation, Agriculture, and Extraction

| **Resource Layer**       | **Atlas Rule**                                                                                                                             | **System Connections**                                   |
|--------------------------|--------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------|
| **Soil Fertility**       | Derived from climate, sediment, ash, organic matter, drainage, salinity, history, and management.                                          | Crop yield, settlement suitability, erosion, trade.      |
| **Timber Identity**      | Tree families differ in growth, hardness, shape, resin, fibre, colour, magic affinity, and construction use.                               | Building palettes, fuel, tools, culture goods, forestry. |
| **Forage and Medicine**  | Plants use climate, soil, season, shade, moisture, disturbance, and rarity.                                                                | Food, alchemy, medicine, dyes, quests, trade.            |
| **Surface Stone**        | Exposed geology affects stone families, clay, sand, gravel, chalk, basalt, limestone, obsidian, salt, and decorative materials.            | Construction, roads, tools, architecture, prospecting.   |
| **Ore Clues**            | Surface staining, mineral plants, scree, old workings, hot springs, river gravels, and exposed strata hint at deeper resources.            | Exploration and prospecting before automation.           |
| **Agriculture**          | Crop suitability is preference-based, not hard locked; irrigation, greenhouses, soil work, magic, trade, and culture can overcome limits.  | Settlement strategy and regional identity.               |
| **Grazing**              | Grass productivity, winter feed, water, predators, disease, and migration affect livestock.                                                | Pastoral economies, fences, routes, raids.               |
| **Forestry Consequence** | Cutting changes canopy, erosion, fire, creature habitat, settlement safety, and regrowth.                                                  | Visible world change and sustainable management.         |
| **Bulk Extraction**      | Large deposits use geology and access; transport, power, water, terrain, pollution, noise, faction claims, and boss attraction may matter. | Automation and civilisation-scale industry.              |
| **Renewability**         | Resources explicitly track renewable, seasonal, slow-regrowing, finite, relocatable, farmable, or restored status.                         | Prevents unclear depletion and supports economy.         |

# 29. Ecology, Creature Habitats, Monster Pressure, and Migration

| **Ecology Slot**             | **Requirement**                                                                                                      |
|------------------------------|----------------------------------------------------------------------------------------------------------------------|
| **Ambient Life**             | Insects, birds, small reptiles, fish-edge life, glow life, seasonal sounds, tracks, and clues.                       |
| **Primary Producers**        | Grasses, trees, shrubs, reeds, fungi, crops, and magical low-intensity flora.                                        |
| **Herbivores / Grazers**     | Small prey, herd animals, browsers, burrowers, and livestock relatives.                                              |
| **Predators**                | Small predators, pack hunters, ambush predators, climbers, flyers, and water-edge hunters.                           |
| **Scavengers / Decomposers** | Carrion feeders, fungi, insects, bone pickers, corruption warning species.                                           |
| **Magical Wildlife Slot**    | Low-intensity spirit, elemental, or mana-adapted life where region mana permits.                                     |
| **Hostile Monster Slot**     | Nocturnal, territorial, nest, raid, corrupted, or structure-linked monsters compatible with the biome.               |
| **Apex / Regional Threat**   | Large predator, titan, sovereign beast, faction champion, roaming monster, or environmental boss.                    |
| **Migration Corridor**       | Seasonal movement linking water, food, breeding, climate, and safety.                                                |
| **Civilisation Interaction** | Hunting, domestication, crop damage, livestock predation, sacred species, trade, defence, or extermination pressure. |

## 29.1 Ecological Consequence Rules

- Removing predators may increase herbivores, crop damage, disease, or smaller predators.

- Overhunting may reduce food and trade while changing predator behaviour or forcing migration.

- New roads, lights, wards, farms, mines, and machines alter habitat and spawn pressure.

- Fire, flood, drought, winter, corruption, cleansing, and settlement abandonment change population states.

- Creature populations may recover, migrate, become domesticated, be locally extinct, or return through events.

# 30. Civilisations, Settlements, Territories, Roads, and Trade

| **Placement Factor**   | **Atlas Requirement**                                                                                                       |
|------------------------|-----------------------------------------------------------------------------------------------------------------------------|
| **Water and Food**     | Reliable water, agriculture, grazing, fishing, hunting, trade, preservation, or magical infrastructure.                     |
| **Buildable Terrain**  | Enough safe ground or culturally appropriate engineering for homes, roads, farms, walls, industry, and expansion.           |
| **Materials**          | Timber, stone, clay, fibre, metal, fuel, food, rare goods, and repair access.                                               |
| **Routes**             | Rivers, passes, plains, ridge roads, old roads, ferries, bridges, caravan stops, and later rail/portal links.               |
| **Defence**            | Visibility, walls, chokepoints, escape routes, wards, nearby threats, flood/fire risk, and siege access.                    |
| **Livelihood**         | Farming, herding, forestry, mining, trade, fishing, craft, magic, scholarship, pilgrimage, or military role.                |
| **Culture Fit**        | Architecture, clothing, crops, festivals, taboos, magic, technology, and historical claims; preference not biological lock. |
| **Territory Pressure** | Neighbours, faction borders, boss territory, monster migration, sacred land, disputed resources, and war history.           |
| **Growth Space**       | Room for homes, districts, industry, farms, roads, ports, defences, and megaprojects.                                       |
| **Resilience**         | Food storage, alternate routes, wells, flood levels, firebreaks, winter fuel, medicine, and repair materials.               |

## 30.1 Biome Adaptation Examples

| **Environment**           | **Adaptation Toolkit**                                                                                    |
|---------------------------|-----------------------------------------------------------------------------------------------------------|
| **Wetland Settlement**    | Raised walkways, boats, stilt foundations, drainage, reed building, disease control, flood storage.       |
| **Desert Settlement**     | Oasis, cisterns, shade streets, underground storage, caravan trade, night schedules, wind towers.         |
| **Mountain Settlement**   | Terraces, switchback roads, tunnels, avalanche control, mining, fortifications, rope or lift logistics.   |
| **Tundra Settlement**     | Insulation, compact layout, preserved food, seasonal hunting, snow routes, windbreaks, fuel strategy.     |
| **Rainforest Settlement** | Raised floors, canopy paths, drainage, rot-resistant materials, river travel, disease and insect control. |
| **Grassland Settlement**  | Open farms, grazing, roads, wind power, defensive visibility, exposure to storms and raids.               |

# 31. Structures, Dungeons, Lairs, Ruins, and Overworld Boss Territories

24B does not define complete dungeon or boss entries, but it must reserve compatible environmental roles. Adventure content should grow from geology, ecology, history, culture, resource extraction, magic, and current ownership rather than being scattered by generic rarity alone.

| **Adventure Slot**          | **Biome / Region Role**                                                                                                     |
|-----------------------------|-----------------------------------------------------------------------------------------------------------------------------|
| **Minor Landmark**          | Stone circle, giant tree, waterfall, fossil bed, abandoned cart, unusual spring, crater, viewpoint.                         |
| **Resource Site**           | Quarry, clay bank, salt pit, grove, herb field, river gravel, old mine, geothermal vent.                                    |
| **Creature Lair**           | Den, nest, burrow colony, webbed ravine, herd breeding ground, fungal mound, flooded cave mouth.                            |
| **Small Dungeon**           | Barrow, cellar ruin, collapsed mine, shrine, watchtower, sinkhole chambers, canyon hideout.                                 |
| **Major Dungeon**           | Fortress, temple complex, deep mine, root labyrinth, glacier vault, volcanic foundry, river necropolis.                     |
| **Faction Site**            | Camp, outpost, toll fort, hunting lodge, monastery, caravanserai, frontier wall, occupied ruin.                             |
| **Regional Boss Territory** | Large area with tracks, changed ecology, weather signs, destroyed structures, tribute, avoidance routes, and a climax site. |
| **Wandering Boss Route**    | Seasonal or event-driven path crossing several biomes and affecting settlements and wildlife.                               |
| **World Wonder**            | Colossal natural or civilisation landmark influencing maps, myths, trade, pilgrimage, danger, and regional names.           |

## 31.1 Provisional Overworld Boss Archetype Hooks

| **Environment**       | **Provisional Boss Roles**                                                            |
|-----------------------|---------------------------------------------------------------------------------------|
| **Grasslands**        | Migrating horned titan, thunder herd sovereign, burrowing colossus, raider war-beast. |
| **Temperate Forest**  | Ancient root guardian, giant stag predator, walking grove, fungal monarch.            |
| **Boreal / Tundra**   | Frost mammoth, white wyrm, glacier giant, aurora hunter.                              |
| **Tropical Forest**   | Canopy serpent, river leviathan, colossal insect queen, storm-feather roc.            |
| **Savanna**           | Pride sovereign, plated grazer titan, drought spirit, termite fortress queen.         |
| **Desert / Badlands** | Sand wyrm, glass scorpion monarch, mesa drake, salt colossus.                         |
| **Wetlands**          | Bog leviathan, mire witch-beast, giant amphibian sovereign, drowned tree titan.       |
| **Mountains**         | Peak roc, stone giant, avalanche beast, ancient mountain dragon.                      |
| **Volcanic**          | Magma golem, caldera serpent, ash titan, awakened forge construct.                    |
| **Karst / Canyon**    | Many-headed gorge predator, cave-mouth titan, arch guardian, echo serpent.            |
| **Rivers / Lakes**    | River dragon, flood spirit, giant armored fish, waterfall guardian.                   |

These are relationship hooks only. [[24H - Bosses, Titans, Siege Threats and Realm Guardians Atlas]] will decide final names, lore, mechanics, arenas, outcomes, and rewards. Bosses may be killed, cleansed, bargained with, relocated, tamed, sealed, or integrated into regional life where the final design supports it.

# 32. Mana Density, Leylines, and Natural-Fantasy Overlays

Ordinary surface biomes may have low or moderate magical influence without becoming separate magical biomes. Mana can affect plant colour, creature behaviour, weather, resource purity, shrine placement, migration, or seasonal events. Once magic fundamentally changes physics, terrain, ecology, or normal settlement rules, the area becomes special Overworld content owned by 24C.

| **Mana Band**            | **Surface-Biome Treatment**                                                                                                       |
|--------------------------|-----------------------------------------------------------------------------------------------------------------------------------|
| **Dormant**              | Magic is difficult to sense; normal ecology dominates. Rare relics or NPC knowledge may still exist.                              |
| **Low**                  | Subtle mana resources, occasional magical fauna, weak ritual affinity, rare anomalous weather.                                    |
| **Ambient**              | Magic is known and usable; shrines, mages, wards, magical crops, and mana-adapted species are plausible.                          |
| **Strong Natural**       | Visible but stable effects such as luminous flowers, unusual growth, charged storms, leyline springs. Still recognisably natural. |
| **Threshold to Special** | Terrain, gravity, time, corruption, dream, ancient machinery, or realm leakage dominates. Hand off to 24C classification.         |

# 33. Dynamic Change, Degradation, Restoration, and Player Impact

| **Dynamic State**       | **Effects**                                                                                                          |
|-------------------------|----------------------------------------------------------------------------------------------------------------------|
| **Seasonal**            | Leaf colour, snow, water level, bloom, migration, crop state, storm frequency, daylight and ambience.                |
| **Burned**              | Vegetation loss, ash, displaced wildlife, exposed ruins, fire quests, pioneer regrowth.                              |
| **Flooded**             | Changed channels, damaged roads, fertile sediment, stranded NPCs, new fish and monsters.                             |
| **Drought**             | Low water, dead crops, fire risk, migration, conflict, exposed structures and salt.                                  |
| **Overharvested**       | Reduced timber, herbs, prey, soil stability, morale, trade output, and habitat quality.                              |
| **Industrialised**      | Roads, mines, machines, smoke, noise, worker settlements, extraction pits, altered spawns.                           |
| **Civilised / Managed** | Farms, managed woods, grazing, patrols, safe roads, fences, canals, reduced predators.                               |
| **War-Torn**            | Burned farms, trenches, abandoned homes, scavengers, refugees, mines, contested roads.                               |
| **Abandoned**           | Overgrowth, broken infrastructure, returning wildlife, monsters, ruins, salvage, haunting.                           |
| **Restored**            | Repaired water, replanted forests, cleared hazards, revived settlements, improved ecology and routes.                |
| **Warded / Blessed**    | Reduced hostile spawns, changed magical ecology, safer roads, cultural or faction claim.                             |
| **Corrupted**           | Handled through 24C overlays and corruption rules; natural base biome remains referenced for cleansing and recovery. |

## 33.1 Transformation Rule

Dynamic states should modify a stable base biome record rather than replacing identity whenever practical. A burned Ancient Oakwood remains an Ancient Oakwood with burned state, history, changed populations, and recovery potential. This preserves map memory, saves, quests, culture claims, and ecological continuity.

# 34. Discovery, Maps, Rumours, Codex, and Visual Readability

| **Readability Channel**   | **Requirement**                                                                                                |
|---------------------------|----------------------------------------------------------------------------------------------------------------|
| **Distant Silhouette**    | Mountain crowns, tree line, mesa walls, giant trees, fog basin, smoke, waterfalls, towers, storms.             |
| **Ground Palette**        | Soil, stone, vegetation, water, lighting, weathering, seasonal colour, cultural modifications.                 |
| **Soundscape**            | Wind, insects, birds, water, tree movement, thunder, creature calls, settlement noise, silence.                |
| **Particle / Atmosphere** | Pollen, dust, snow, rain, mist, ash, leaves, insects, steam, low-level mana motes.                             |
| **Navigation Clues**      | Rivers, ridges, sun, stars, roads, animal trails, smoke, waystones, ruins, settlement fields.                  |
| **Map Discovery**         | Region name, biome family, danger estimate, routes, water, landmarks, rumours, resource clues, ownership.      |
| **Codex Truth**           | Separates observed facts, local belief, faction claims, rumours, research, and developer truth.                |
| **Cultural Naming**       | The same landform, creature, dungeon, or boss may have different names across languages and factions.          |
| **Accessibility**         | High-contrast map options, pattern overlays, reduced particle density, audio cues, readable hazard telegraphs. |

# 35. Detailed Overworld Region Archetype Registry v0.1

Region archetypes are reusable assembly templates. They define dominant geography and content relationships, not fixed canonical provinces. Generated regions inherit one archetype, then gain seed-derived names, climate values, histories, cultures, territories, biome mosaics, resources, dungeons, and threats.

<table>
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr class="header">
<th><strong>ID / Name</strong></th>
<th><strong>Climate</strong></th>
<th><strong>Landform</strong></th>
<th><strong>World Content</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><strong>region.temperate.river_basin<br />
Temperate River Basin</strong></td>
<td>Temperate, mesic, mild seasons</td>
<td>Broad river, tributaries, floodplain, rolling lowland</td>
<td>Farms, trade towns, bridges, barrows, flood boss routes</td>
</tr>
<tr class="even">
<td><strong>region.temperate.broadleaf_heartland<br />
Broadleaf Heartland</strong></td>
<td>Temperate, humid</td>
<td>Old forest mosaic, meadows, low hills</td>
<td>Timber, herbs, hidden villages, root ruins, forest guardians</td>
</tr>
<tr class="odd">
<td><strong>region.temperate.moorland_marches<br />
Moorland Marches</strong></td>
<td>Cool temperate, wet, windy</td>
<td>Heath, peat, low ridges, fog basins</td>
<td>Pastoral settlements, barrows, border forts, storm threats</td>
</tr>
<tr class="even">
<td><strong>region.temperate.chalk_uplands<br />
Chalk Uplands</strong></td>
<td>Cool-temperate to warm, moderate rain</td>
<td>Downland, white escarpments, springs, dry valleys</td>
<td>Ancient roads, hill forts, herbs, sinkholes, cavalry routes</td>
</tr>
<tr class="odd">
<td><strong>region.boreal.lake_shield<br />
Northern Lake Shield</strong></td>
<td>Cold, humid, continental</td>
<td>Rocky shield, lakes, spruce forest, bogs</td>
<td>Fishing, timber, fur, mines, winter roads, lake monsters</td>
</tr>
<tr class="even">
<td><strong>region.boreal.taiga_frontier<br />
Taiga Frontier</strong></td>
<td>Cold, seasonal, moderate moisture</td>
<td>Endless conifer, muskeg, rivers, low mountains</td>
<td>Logging camps, isolated forts, predators, abandoned mines</td>
</tr>
<tr class="odd">
<td><strong>region.polar.glacial_valleys<br />
Glacial Valley System</strong></td>
<td>Subpolar to polar</td>
<td>Glaciers, U-valleys, moraines, meltwater lakes</td>
<td>Rare ore, preserved ruins, seasonal passage, frost titans</td>
</tr>
<tr class="even">
<td><strong>region.polar.high_plateau<br />
Frostbound Plateau</strong></td>
<td>Polar, dry, high wind</td>
<td>High flatland, snow desert, blue ice, cliff edges</td>
<td>Sparse settlements, observatories, ancient vaults, aurora threats</td>
</tr>
</tbody>
</table>

<table>
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr class="header">
<th><strong>ID / Name</strong></th>
<th><strong>Climate</strong></th>
<th><strong>Landform</strong></th>
<th><strong>World Content</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><strong>region.tropical.riverlands<br />
Tropical Riverlands</strong></td>
<td>Tropical, humid</td>
<td>Large rivers, rainforest, floodplains, oxbows</td>
<td>River trade, canopy villages, temples, leviathans, rare medicine</td>
</tr>
<tr class="even">
<td><strong>region.tropical.monsoon_uplands<br />
Monsoon Uplands</strong></td>
<td>Warm, seasonal rain</td>
<td>Forested hills, waterfalls, landslides, fertile valleys</td>
<td>Terrace farms, storm shrines, cliff ruins, seasonal road failure</td>
</tr>
<tr class="odd">
<td><strong>region.tropical.cloud_range<br />
Cloud Forest Range</strong></td>
<td>Subtropical highland, wet</td>
<td>Mist mountains, cloud forest, steep ravines</td>
<td>Rare herbs, hidden monasteries, flying threats, waterfalls</td>
</tr>
<tr class="even">
<td><strong>region.savanna.migration_belt<br />
Great Migration Belt</strong></td>
<td>Warm, wet/dry</td>
<td>Savanna, seasonal rivers, kopje-like rocks, grass sea</td>
<td>Pastoral cultures, caravans, herd events, apex predator bosses</td>
</tr>
<tr class="odd">
<td><strong>region.savanna.thorn_frontier<br />
Thorn Frontier</strong></td>
<td>Warm, semi-arid</td>
<td>Thorn scrub, dry rivers, rocky uplands</td>
<td>Fortified wells, raiders, grazing, hidden ruins, fire events</td>
</tr>
<tr class="even">
<td><strong>region.arid.dune_basin<br />
Dune Basin</strong></td>
<td>Hot, hyperarid</td>
<td>Dune seas, oasis chains, salt margins</td>
<td>Caravans, buried cities, sand wyrms, glass resources</td>
</tr>
<tr class="odd">
<td><strong>region.arid.mesa_escarpment<br />
Mesa Escarpment</strong></td>
<td>Hot, arid</td>
<td>Layered plateaus, canyons, dry rivers, arches</td>
<td>Cliff settlements, mines, outlaws, fossils, drakes</td>
</tr>
<tr class="even">
<td><strong>region.arid.salt_depression<br />
Saltpan Depression</strong></td>
<td>Hot or cold arid</td>
<td>Closed basin, salt flats, seasonal lakes, badlands</td>
<td>Salt trade, mirages, corrosion, buried shrines, migration</td>
</tr>
</tbody>
</table>

<table>
<colgroup>
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
<col style="width: 25%" />
</colgroup>
<thead>
<tr class="header">
<th><strong>ID / Name</strong></th>
<th><strong>Climate</strong></th>
<th><strong>Landform</strong></th>
<th><strong>World Content</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><strong>region.wetland.flood_basin<br />
Flood Basin</strong></td>
<td>Warm-temperate to tropical, saturated</td>
<td>Marshes, channels, floodplain islands, slow rivers</td>
<td>Stilt settlements, boats, alchemy, disease, bog leviathans</td>
</tr>
<tr class="even">
<td><strong>region.wetland.peat_marches<br />
Peatland Marches</strong></td>
<td>Cool, wet</td>
<td>Bogs, fens, moors, blackwater streams</td>
<td>Peat, herbs, barrows, poor roads, spirits, borderland politics</td>
</tr>
<tr class="odd">
<td><strong>region.highland.alpine_watershed<br />
Alpine Watershed</strong></td>
<td>Cold highland with wet windward slopes</td>
<td>Mountain chain, passes, glaciers, headwaters, alpine meadows</td>
<td>Mines, forts, pilgrimage, avalanches, peak bosses</td>
</tr>
<tr class="even">
<td><strong>region.highland.high_plateau<br />
High Plateau</strong></td>
<td>Cool to cold, dry-windy</td>
<td>Broad upland, cliffs, grass, rocky ridges</td>
<td>Grazing, wind power, long roads, sky threats, ancient observatory</td>
</tr>
<tr class="odd">
<td><strong>region.volcanic.caldera_arc<br />
Caldera Arc</strong></td>
<td>Variable warmth, volcanic moisture patterns</td>
<td>Cones, calderas, lava plateaus, ash valleys</td>
<td>Forge settlements, metals, hot springs, eruptions, magma bosses</td>
</tr>
<tr class="even">
<td><strong>region.geothermal.riftlands<br />
Geothermal Riftlands</strong></td>
<td>Temperate to hot local anomalies</td>
<td>Rift valley, springs, steam fields, lakes, fault scarps</td>
<td>Power, alchemy, unstable ruins, toxic vents, earth elementals</td>
</tr>
<tr class="odd">
<td><strong>region.karst.tower_plateau<br />
Tower Karst Plateau</strong></td>
<td>Humid or seasonal warm</td>
<td>Limestone towers, sinkholes, hidden rivers, caves</td>
<td>Cliff villages, monasteries, lost roads, cave-mouth threats</td>
</tr>
<tr class="even">
<td><strong>region.canyon.labyrinth<br />
Canyon Labyrinth</strong></td>
<td>Dry to semi-arid</td>
<td>Deep branching gorges, mesas, arches, river refuges</td>
<td>Hidden factions, bridges, tombs, ambushes, gorge hydras</td>
</tr>
</tbody>
</table>

# 36. Detailed Surface Biome Registry v0.1

The registry below defines the first ninety-six natural land-surface biome entries for production planning. They are not all required for the first production milestone, and each may later receive sub-biomes, cultural variants, seasonal states, magical overlays, art packs, creature sets, dungeons, and boss links. Strongly magical, corrupted, ancient, coastal, oceanic, sky, and underground variants remain in 24C.

## Temperate Plains, Meadows, Heaths, and Steppes

<table>
<colgroup>
<col style="width: 20%" />
<col style="width: 20%" />
<col style="width: 20%" />
<col style="width: 20%" />
<col style="width: 20%" />
</colgroup>
<thead>
<tr class="header">
<th><strong>ID / Name</strong></th>
<th><strong>Climate and Terrain</strong></th>
<th><strong>Resources and Vegetation</strong></th>
<th><strong>Ecology and Threat</strong></th>
<th><strong>Civilisation and Adventure</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><strong>biome.surface.temperate.lowland_meadow<br />
Lowland Meadow</strong></td>
<td>Temperate / mesic / flat</td>
<td>Rich soil, grasses, flowers, clay edges</td>
<td>Pollinators, grazers, fox-like predators; low-normal threat</td>
<td>Farms, villages, roads, barrows; foundation priority</td>
</tr>
<tr class="even">
<td><strong>biome.surface.temperate.wildflower_meadow<br />
Wildflower Meadow</strong></td>
<td>Cool-temperate / seasonal / rolling</td>
<td>Herbs, dyes, honey, soft timber edges</td>
<td>Dense pollinators, small grazers, seasonal magical wildlife</td>
<td>Festivals, apothecaries, shrines, hidden burrows</td>
</tr>
<tr class="odd">
<td><strong>biome.surface.temperate.rolling_pasture<br />
Rolling Pasture</strong></td>
<td>Temperate / moderate moisture / hills</td>
<td>Grass, stone, streams, grazing plants</td>
<td>Herds, livestock relatives, pack predators</td>
<td>Farmsteads, mills, hill forts, caravan roads</td>
</tr>
<tr class="even">
<td><strong>biome.surface.temperate.river_prairie<br />
River Prairie</strong></td>
<td>Temperate / humid corridor / floodplain</td>
<td>Tall grass, rich sediment, reeds, river gravel</td>
<td>Large herds, nesting birds, river-edge predators</td>
<td>Farms, bridges, flood ruins, migrating boss route</td>
</tr>
<tr class="odd">
<td><strong>biome.surface.temperate.tallgrass_plain<br />
Tallgrass Plain</strong></td>
<td>Warm-temperate / seasonal / broad plain</td>
<td>Grain relatives, fibre grass, fertile dark soil</td>
<td>Low visibility, herd migration, ambush predators, fire cycle</td>
<td>Road beacons, settlements, fire events, buried structures</td>
</tr>
<tr class="even">
<td><strong>biome.surface.temperate.windsteppe<br />
Windsteppe</strong></td>
<td>Temperate / semi-arid / exposed</td>
<td>Dry grasses, hardy herbs, surface stone</td>
<td>Mount herds, burrowers, raptors, dust-storm monsters</td>
<td>Caravan corridors, windmills, nomad camps, tumuli</td>
</tr>
<tr class="odd">
<td><strong>biome.surface.temperate.heather_moor<br />
Heather Moor</strong></td>
<td>Cool / wet / upland</td>
<td>Heather, peat, berries, bog iron pockets</td>
<td>Ground birds, grazers, fog predators, spirits at rare sites</td>
<td>Pastoral villages, barrows, peat works, border forts</td>
</tr>
<tr class="even">
<td><strong>biome.surface.temperate.chalk_downland<br />
Chalk Downland</strong></td>
<td>Cool-temperate / moderate / slopes</td>
<td>Chalk, flint, herbs, short grass, springs</td>
<td>Rabbits, grazers, cliff birds, burrowing monsters</td>
<td>Ancient tracks, hill forts, sinkholes, ritual figures</td>
</tr>
</tbody>
</table>

## Temperate Forests and Woodlands

<table>
<colgroup>
<col style="width: 20%" />
<col style="width: 20%" />
<col style="width: 20%" />
<col style="width: 20%" />
<col style="width: 20%" />
</colgroup>
<thead>
<tr class="header">
<th><strong>ID / Name</strong></th>
<th><strong>Climate and Terrain</strong></th>
<th><strong>Resources and Vegetation</strong></th>
<th><strong>Ecology and Threat</strong></th>
<th><strong>Civilisation and Adventure</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><strong>biome.surface.forest.mixed_broadleaf<br />
Mixed Broadleaf Forest</strong></td>
<td>Temperate / mesic / rolling</td>
<td>Oak-like and mixed timber, nuts, fungi, herbs</td>
<td>Deer-like grazers, boar-like foragers, wolves, owls</td>
<td>Forestry villages, ruins, hunting lodges, root lairs</td>
</tr>
<tr class="even">
<td><strong>biome.surface.forest.ancient_oakwood<br />
Ancient Oakwood</strong></td>
<td>Temperate / humid / old-growth</td>
<td>Massive hardwood, acorns, rare fungi, spirit herbs</td>
<td>Apex predators, ancient guardians, dense small life</td>
<td>Sacred groves, root labyrinths, lost courts, regional guardian</td>
</tr>
<tr class="odd">
<td><strong>biome.surface.forest.beech_hollow<br />
Beechwood Hollow</strong></td>
<td>Cool-temperate / humid / basin</td>
<td>Smooth pale timber, deep leaf litter, springs</td>
<td>Ground foragers, deer, silent ambush predators</td>
<td>Hidden roads, woodland villages, buried cellars, fog events</td>
</tr>
<tr class="even">
<td><strong>biome.surface.forest.redbark<br />
Redbark Forest</strong></td>
<td>Warm-temperate / seasonal / red soil</td>
<td>Fire-tolerant hardwood, resin, red clay</td>
<td>Grazers, climbing predators, fire-adapted creatures</td>
<td>Lumber towns, kilns, fire shrines, old watch routes</td>
</tr>
<tr class="odd">
<td><strong>biome.surface.forest.silver_birch<br />
Silver Birch Grove</strong></td>
<td>Cool-temperate / disturbed / light canopy</td>
<td>Fast timber, bark fibre, sap, pioneer herbs</td>
<td>Small grazers, birds, regrowth fauna</td>
<td>Reclaimed ruins, young settlements, charcoal sites</td>
</tr>
<tr class="even">
<td><strong>biome.surface.forest.autumn_maple<br />
Autumn Maplewood</strong></td>
<td>Temperate / strong seasons / rolling</td>
<td>Colourful hardwood, sweet sap, mushrooms</td>
<td>Seasonal migration, pollinators, forest cats</td>
<td>Festivals, syrup trade, manor ruins, leaf-hidden paths</td>
</tr>
<tr class="odd">
<td><strong>biome.surface.forest.evergreen_pine<br />
Evergreen Pinewood</strong></td>
<td>Cool-temperate / moderate / upland</td>
<td>Pine timber, resin, needles, cones, stone</td>
<td>Deer, bears, pack hunters, fire risk</td>
<td>Logging camps, mountain roads, mines, ranger towers</td>
</tr>
<tr class="even">
<td><strong>biome.surface.forest.mistwood<br />
Mistwood</strong></td>
<td>Cool / humid / fog basin</td>
<td>Moss, fungi, wet timber, medicinal shade plants</td>
<td>Low-visibility predators, amphibians, spirits</td>
<td>Hidden shrines, haunted roads, bog edges, mystery dungeons</td>
</tr>
</tbody>
</table>

## Boreal Forests, Taiga, and Cold Woodlands

<table>
<colgroup>
<col style="width: 20%" />
<col style="width: 20%" />
<col style="width: 20%" />
<col style="width: 20%" />
<col style="width: 20%" />
</colgroup>
<thead>
<tr class="header">
<th><strong>ID / Name</strong></th>
<th><strong>Climate and Terrain</strong></th>
<th><strong>Resources and Vegetation</strong></th>
<th><strong>Ecology and Threat</strong></th>
<th><strong>Civilisation and Adventure</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><strong>biome.surface.boreal.sprucewood<br />
Boreal Sprucewood</strong></td>
<td>Cold / mesic / lowland</td>
<td>Spruce timber, resin, berries, moss</td>
<td>Moose-like browsers, wolves, bears, winter spirits</td>
<td>Timber camps, fur trade, frozen ruins, winter raids</td>
</tr>
<tr class="even">
<td><strong>biome.surface.boreal.larch_taiga<br />
Larch Taiga</strong></td>
<td>Cold continental / seasonal / rolling</td>
<td>Deciduous conifer timber, peat, mushrooms</td>
<td>Migratory herds, lynx-like predators, insects</td>
<td>Seasonal roads, hunting villages, old mines</td>
</tr>
<tr class="odd">
<td><strong>biome.surface.boreal.snow_pine<br />
Snow Pine Forest</strong></td>
<td>Cold / snowy / foothill</td>
<td>Pine, resin, snow herbs, exposed ore</td>
<td>Mountain grazers, pack hunters, snow burrowers</td>
<td>Pass forts, logging, cave entrances, avalanche events</td>
</tr>
<tr class="even">
<td><strong>biome.surface.boreal.muskeg_taiga<br />
Muskeg Taiga</strong></td>
<td>Cold / saturated / flat</td>
<td>Peat, blackwater, stunted conifers, bog iron</td>
<td>Insects, amphibians, elk-like grazers, mire monsters</td>
<td>Raised roads, trapper camps, bog tombs, lost wagons</td>
</tr>
<tr class="odd">
<td><strong>biome.surface.boreal.frost_birch<br />
Frost Birch Woodland</strong></td>
<td>Subpolar / moderate / open</td>
<td>Pale timber, bark, lichens, berries</td>
<td>Hares, browsing herds, foxes, snowy owls</td>
<td>Small settlements, charcoal, ancestor groves</td>
</tr>
<tr class="even">
<td><strong>biome.surface.boreal.cold_meadow<br />
Cold Meadow</strong></td>
<td>Cold / short summer / valley</td>
<td>Summer flowers, grasses, meltwater, herbs</td>
<td>Migratory grazers, nesting birds, seasonal predators</td>
<td>Summer camps, hay harvest, standing stones, flood risk</td>
</tr>
<tr class="odd">
<td><strong>biome.surface.boreal.permafrost_scrub<br />
Permafrost Scrub</strong></td>
<td>Subpolar / dry / exposed</td>
<td>Low shrubs, lichens, frozen soil, surface stone</td>
<td>Burrowers, caribou-like herds, frost predators</td>
<td>Sparse outposts, prospecting, preserved ruins</td>
</tr>
<tr class="even">
<td><strong>biome.surface.boreal.needle_highlands<br />
Needleleaf Highlands</strong></td>
<td>Cold / windy / upland</td>
<td>Stunted conifers, stone, resin, ore clues</td>
<td>Cliff grazers, raptors, cold elementals</td>
<td>Mines, watchtowers, pass roads, peak lairs</td>
</tr>
</tbody>
</table>

## Tundra, Polar, and Glacial Surface Biomes

<table>
<colgroup>
<col style="width: 20%" />
<col style="width: 20%" />
<col style="width: 20%" />
<col style="width: 20%" />
<col style="width: 20%" />
</colgroup>
<thead>
<tr class="header">
<th><strong>ID / Name</strong></th>
<th><strong>Climate and Terrain</strong></th>
<th><strong>Resources and Vegetation</strong></th>
<th><strong>Ecology and Threat</strong></th>
<th><strong>Civilisation and Adventure</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><strong>biome.surface.polar.open_tundra<br />
Open Tundra</strong></td>
<td>Subpolar / dry-mesic / flat</td>
<td>Lichens, moss, dwarf shrubs, permafrost</td>
<td>Migratory herds, foxes, burrowers, white predators</td>
<td>Seasonal camps, bone sites, ancient tracks</td>
</tr>
<tr class="even">
<td><strong>biome.surface.polar.lichen_moor<br />
Lichen Moor</strong></td>
<td>Subpolar / wet-cold / rocky</td>
<td>Lichen mats, moss, peat pockets, exposed stone</td>
<td>Ground birds, small grazers, spirit lights</td>
<td>Barrows, weather stations, sacred stones</td>
</tr>
<tr class="odd">
<td><strong>biome.surface.polar.frost_meadow<br />
Frost Meadow</strong></td>
<td>Subpolar / summer wet / valley</td>
<td>Short-lived flowers, grasses, meltwater herbs</td>
<td>Summer pollinators, herd calving, predators</td>
<td>Seasonal settlements, herb harvest, migration events</td>
</tr>
<tr class="even">
<td><strong>biome.surface.polar.icefield_margin<br />
Icefield Margin</strong></td>
<td>Polar / frozen / sloped</td>
<td>Snow, ice, moraine stone, melt streams</td>
<td>Ice burrowers, scavengers, frost elementals</td>
<td>Glacial caves, lost expeditions, rare ore exposure</td>
</tr>
<tr class="odd">
<td><strong>biome.surface.polar.glacial_valley<br />
Glacial Valley</strong></td>
<td>Cold / meltwater / high relief</td>
<td>Moraines, lakes, gravel, alpine plants</td>
<td>Herd corridors, cliff predators, river life</td>
<td>Pass routes, mines, glacier vaults, avalanche boss signs</td>
</tr>
<tr class="even">
<td><strong>biome.surface.polar.snow_desert<br />
Snow Desert</strong></td>
<td>Polar / hyperdry / open</td>
<td>Wind-packed snow, ice, scarce lichen</td>
<td>Sparse scavengers, roaming titans, storm spirits</td>
<td>Navigation beacons, buried ruins, extreme expeditions</td>
</tr>
<tr class="odd">
<td><strong>biome.surface.polar.high_plateau<br />
Polar Plateau</strong></td>
<td>Polar / windy / high altitude</td>
<td>Bare rock, snowfields, rare mineral veins</td>
<td>Raptors, cold constructs, migrating giants</td>
<td>Observatories, shrines, world-edge vistas, boss territory</td>
</tr>
<tr class="even">
<td><strong>biome.surface.polar.blue_ice_flats<br />
Blue-Ice Flats</strong></td>
<td>Polar / ancient ice / basin</td>
<td>Dense blue ice, trapped gases, preserved remains</td>
<td>Ice fish pockets, crystal insects, void-sensitive fauna</td>
<td>Preserved cities, mirror puzzles, dangerous cracks</td>
</tr>
</tbody>
</table>

## Tropical and Subtropical Forests

<table>
<colgroup>
<col style="width: 20%" />
<col style="width: 20%" />
<col style="width: 20%" />
<col style="width: 20%" />
<col style="width: 20%" />
</colgroup>
<thead>
<tr class="header">
<th><strong>ID / Name</strong></th>
<th><strong>Climate and Terrain</strong></th>
<th><strong>Resources and Vegetation</strong></th>
<th><strong>Ecology and Threat</strong></th>
<th><strong>Civilisation and Adventure</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><strong>biome.surface.tropical.lowland_rainforest<br />
Lowland Rainforest</strong></td>
<td>Tropical / humid / lowland</td>
<td>Hardwoods, fruit, vines, herbs, clay, rivers</td>
<td>Dense biodiversity, big cats, snakes, insects</td>
<td>River settlements, temples, canopy ruins, disease pressure</td>
</tr>
<tr class="even">
<td><strong>biome.surface.tropical.cloud_forest<br />
Cloud Forest</strong></td>
<td>Subtropical highland / saturated</td>
<td>Mossy trees, epiphytes, rare herbs, springs</td>
<td>Small primates, birds, amphibians, mist spirits</td>
<td>Monasteries, hidden roads, waterfall dungeons</td>
</tr>
<tr class="odd">
<td><strong>biome.surface.tropical.monsoon_forest<br />
Monsoon Forest</strong></td>
<td>Warm / wet-dry / rolling</td>
<td>Seasonal hardwood, fruit, bamboo, flood soil</td>
<td>Migratory fauna, insects, predators, fire in dry season</td>
<td>Terrace farms, storm shrines, ruined palaces</td>
</tr>
<tr class="even">
<td><strong>biome.surface.tropical.giant_fernwood<br />
Giant Fernwood</strong></td>
<td>Warm / humid / basin</td>
<td>Giant ferns, spores, soft wood, medicinal fronds</td>
<td>Large insects, amphibians, old-world predators</td>
<td>Research camps, prehistoric ruins, nest dungeons</td>
</tr>
<tr class="odd">
<td><strong>biome.surface.tropical.bamboo_wilds<br />
Bamboo Wilds</strong></td>
<td>Warm / seasonal / upland</td>
<td>Fast bamboo, shoots, fibre, water pockets</td>
<td>Bamboo grazers, climbing predators, swarms</td>
<td>Villages, scaffolding industry, hidden monasteries</td>
</tr>
<tr class="even">
<td><strong>biome.surface.tropical.flooded_jungle<br />
Flooded Jungle</strong></td>
<td>Tropical / flooded / lowland</td>
<td>Water timber, vines, fruit, fish, reeds</td>
<td>Aquatic predators, tree dwellers, insects</td>
<td>Boat routes, stilt towns, drowned temples, leviathan signs</td>
</tr>
<tr class="odd">
<td><strong>biome.surface.tropical.dry_forest<br />
Dry Tropical Forest</strong></td>
<td>Warm / seasonal dry / lowland</td>
<td>Hardwood, thorn plants, resin, seasonal fruit</td>
<td>Grazers, monkeys, big predators, fire-adapted species</td>
<td>Pastoral edges, timber trade, old forts</td>
</tr>
<tr class="even">
<td><strong>biome.surface.tropical.highland_jungle<br />
Highland Jungle</strong></td>
<td>Warm / wet / steep</td>
<td>Hardwood, waterfalls, herbs, exposed minerals</td>
<td>Climbers, raptors, cats, storm creatures</td>
<td>Cliff villages, mines, hanging ruins, peak routes</td>
</tr>
</tbody>
</table>

## Savannas, Seasonal Grasslands, and Warm Scrub

<table>
<colgroup>
<col style="width: 20%" />
<col style="width: 20%" />
<col style="width: 20%" />
<col style="width: 20%" />
<col style="width: 20%" />
</colgroup>
<thead>
<tr class="header">
<th><strong>ID / Name</strong></th>
<th><strong>Climate and Terrain</strong></th>
<th><strong>Resources and Vegetation</strong></th>
<th><strong>Ecology and Threat</strong></th>
<th><strong>Civilisation and Adventure</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><strong>biome.surface.savanna.golden<br />
Golden Savanna</strong></td>
<td>Warm / wet-dry / broad plain</td>
<td>Tall grass, scattered trees, rich seasonal soil</td>
<td>Large herds, pack hunters, scavengers</td>
<td>Pastoral cultures, migration events, titan routes</td>
</tr>
<tr class="even">
<td><strong>biome.surface.savanna.acacia_woodland<br />
Acacia Woodland</strong></td>
<td>Warm / semi-arid / rolling</td>
<td>Hard thorn wood, pods, grass, shade herbs</td>
<td>Browsers, elephants-like giants, cats, birds</td>
<td>Grazing towns, wells, hunting lodges, giant tree landmarks</td>
</tr>
<tr class="odd">
<td><strong>biome.surface.savanna.seasonal_grassland<br />
Seasonal Grassland</strong></td>
<td>Warm / monsoonal / lowland</td>
<td>Green wet-season grass, dry hay, flood channels</td>
<td>Herd migration, insects, fire, predators</td>
<td>Crop-grazing mix, flood camps, fire events</td>
</tr>
<tr class="even">
<td><strong>biome.surface.savanna.baobab_plain<br />
Baobab Plain</strong></td>
<td>Warm / semi-arid / plain</td>
<td>Water-storing giant trees, fruit, fibre</td>
<td>Nest colonies, grazers, shade predators</td>
<td>Landmark villages, sacred trees, caravan stops</td>
</tr>
<tr class="odd">
<td><strong>biome.surface.savanna.thorn_scrub<br />
Thorn Scrub</strong></td>
<td>Hot-warm / arid-seasonal / rough</td>
<td>Thorn bushes, resin, hardy tubers, stone</td>
<td>Goat-like grazers, ambush predators, raiders</td>
<td>Fortified wells, hidden ruins, bandit routes</td>
</tr>
<tr class="even">
<td><strong>biome.surface.savanna.warm_steppe<br />
Warm Steppe</strong></td>
<td>Warm-temperate / semi-arid / open</td>
<td>Dry grass, herbs, salt pockets, wind</td>
<td>Mount herds, burrowers, raptors</td>
<td>Caravan roads, nomad camps, wind power</td>
</tr>
<tr class="odd">
<td><strong>biome.surface.savanna.sunbaked_bushland<br />
Sunbaked Bushland</strong></td>
<td>Hot / semi-arid / rocky</td>
<td>Scrub, medicinal oils, hard wood, exposed stone</td>
<td>Reptiles, small grazers, scavengers, venomous monsters</td>
<td>Prospector camps, shrines, canyon entrances</td>
</tr>
<tr class="even">
<td><strong>biome.surface.savanna.redgrass_upland<br />
Redgrass Upland</strong></td>
<td>Warm / seasonal / upland</td>
<td>Iron-rich soil, red grass, stone, hardy crops</td>
<td>Cliff grazers, raptors, pack hunters</td>
<td>Hill forts, mines, pastoral towns, storm beacons</td>
</tr>
</tbody>
</table>

## Deserts, Drylands, Badlands, and Salt Basins

<table>
<colgroup>
<col style="width: 20%" />
<col style="width: 20%" />
<col style="width: 20%" />
<col style="width: 20%" />
<col style="width: 20%" />
</colgroup>
<thead>
<tr class="header">
<th><strong>ID / Name</strong></th>
<th><strong>Climate and Terrain</strong></th>
<th><strong>Resources and Vegetation</strong></th>
<th><strong>Ecology and Threat</strong></th>
<th><strong>Civilisation and Adventure</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><strong>biome.surface.arid.dune_sea<br />
Sand Dune Sea</strong></td>
<td>Hot / hyperarid / dunes</td>
<td>Sand, glass minerals, rare oasis plants</td>
<td>Burrowers, sand predators, migratory flyers</td>
<td>Buried ruins, caravans, sand wyrm territory</td>
</tr>
<tr class="even">
<td><strong>biome.surface.arid.gravel_desert<br />
Gravel Desert</strong></td>
<td>Hot or cold / arid / flat</td>
<td>Gravel, meteorite fragments, sparse shrubs</td>
<td>Fast runners, scavengers, raptors</td>
<td>Long roads, camps, impact craters, exposed relics</td>
</tr>
<tr class="odd">
<td><strong>biome.surface.arid.stone_desert<br />
Stone Desert</strong></td>
<td>Hot / arid / rocky</td>
<td>Stone plates, ore clues, cave shade, lichen</td>
<td>Reptiles, cliff predators, stone elementals</td>
<td>Quarries, hidden cisterns, ruined forts</td>
</tr>
<tr class="even">
<td><strong>biome.surface.arid.red_mesa<br />
Red Mesa Badlands</strong></td>
<td>Hot / arid / escarpment</td>
<td>Layered clay, fossils, copper clues, stone</td>
<td>Raptors, burrowers, drakes, raider mounts</td>
<td>Cliff towns, mines, tombs, bridge routes</td>
</tr>
<tr class="odd">
<td><strong>biome.surface.arid.canyon_drylands<br />
Canyon Drylands</strong></td>
<td>Hot / arid / canyon</td>
<td>River refuges, shade plants, exposed strata</td>
<td>Goats, cats, snakes, cave creatures</td>
<td>Hidden settlements, fortress dungeons, gorge bosses</td>
</tr>
<tr class="even">
<td><strong>biome.surface.arid.saltpan<br />
Saltpan Basin</strong></td>
<td>Arid / closed basin / flat</td>
<td>Salt, gypsum, brine, seasonal algae</td>
<td>Brine insects, migratory birds, salt beasts</td>
<td>Salt trade, mirages, drowned roads, corrosion hazards</td>
</tr>
<tr class="odd">
<td><strong>biome.surface.arid.wadi_network<br />
Dry Wadi Network</strong></td>
<td>Hot / episodic rain / dissected</td>
<td>Flash-flood channels, gravel, hidden water</td>
<td>Burrowers, oasis fauna, flood-spawn creatures</td>
<td>Caravan routes, wells, ambushes, exposed chambers</td>
</tr>
<tr class="even">
<td><strong>biome.surface.arid.desert_bloom<br />
Desert Bloom Basin</strong></td>
<td>Arid / rare storm / basin</td>
<td>Ephemeral flowers, seeds, herbs, clay</td>
<td>Explosive pollinator and herd events, predators follow</td>
<td>Seasonal harvest, festivals, temporary camps, boss migration</td>
</tr>
</tbody>
</table>

## Wetlands, Marshes, Bogs, Fens, and Floodplains

<table>
<colgroup>
<col style="width: 20%" />
<col style="width: 20%" />
<col style="width: 20%" />
<col style="width: 20%" />
<col style="width: 20%" />
</colgroup>
<thead>
<tr class="header">
<th><strong>ID / Name</strong></th>
<th><strong>Climate and Terrain</strong></th>
<th><strong>Resources and Vegetation</strong></th>
<th><strong>Ecology and Threat</strong></th>
<th><strong>Civilisation and Adventure</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><strong>biome.surface.wetland.reed_marsh<br />
Reed Marsh</strong></td>
<td>Temperate-warm / saturated / shallow</td>
<td>Reeds, fish, clay, peat, water herbs</td>
<td>Birds, amphibians, insects, marsh predators</td>
<td>Raised roads, fishing villages, hidden shrines</td>
</tr>
<tr class="even">
<td><strong>biome.surface.wetland.peat_bog<br />
Peat Bog</strong></td>
<td>Cool / acidic / waterlogged</td>
<td>Peat, berries, moss, preserved wood and remains</td>
<td>Insects, bog grazers, spirits, mire monsters</td>
<td>Peat works, barrows, preserved ruins, fire risk</td>
</tr>
<tr class="odd">
<td><strong>biome.surface.wetland.sedge_fen<br />
Sedge Fen</strong></td>
<td>Cool-temperate / mineral-fed / flat</td>
<td>Sedges, medicinal herbs, clean springs, peat</td>
<td>Waders, grazers, amphibians, water spirits</td>
<td>Hay fields, herb trade, monasteries, channels</td>
</tr>
<tr class="even">
<td><strong>biome.surface.wetland.cypress_swamp<br />
Cypress Swamp</strong></td>
<td>Warm / flooded / forested</td>
<td>Water timber, moss, fish, vines, alchemy plants</td>
<td>Reptiles, amphibians, insects, ambush predators</td>
<td>Stilt towns, boat routes, drowned tombs, leviathan signs</td>
</tr>
<tr class="odd">
<td><strong>biome.surface.wetland.floodplain<br />
Floodplain Wetland</strong></td>
<td>Temperate-tropical / seasonal flood</td>
<td>Rich silt, reeds, fish, clay, grasses</td>
<td>Migratory birds, fish runs, grazers, flood monsters</td>
<td>Farms, levees, ports, flood ruins, repair events</td>
</tr>
<tr class="even">
<td><strong>biome.surface.wetland.oxbow<br />
Oxbow Lakes</strong></td>
<td>Temperate-warm / backwater</td>
<td>Fish, reeds, softwood, mud, herbs</td>
<td>Aquatic life, insects, predators, nesting colonies</td>
<td>Fishing camps, hidden smugglers, abandoned river towns</td>
</tr>
<tr class="odd">
<td><strong>biome.surface.wetland.mist_moor<br />
Mist Moor</strong></td>
<td>Cool / wet / upland</td>
<td>Heather, peat, bog cotton, stone</td>
<td>Ground birds, sheep-like grazers, fog predators</td>
<td>Pastoral tracks, barrows, border towers, haunted valleys</td>
</tr>
<tr class="even">
<td><strong>biome.surface.wetland.quaking_mire<br />
Quaking Mire</strong></td>
<td>Cool-warm / saturated / unstable</td>
<td>Floating moss, rare reagents, peat gas, hidden pools</td>
<td>Amphibians, insects, sink hunters, spirits</td>
<td>Boardwalks, alchemy expeditions, swallowed ruins</td>
</tr>
</tbody>
</table>

## Highlands, Mountains, Alpine, and Plateau Biomes

<table>
<colgroup>
<col style="width: 20%" />
<col style="width: 20%" />
<col style="width: 20%" />
<col style="width: 20%" />
<col style="width: 20%" />
</colgroup>
<thead>
<tr class="header">
<th><strong>ID / Name</strong></th>
<th><strong>Climate and Terrain</strong></th>
<th><strong>Resources and Vegetation</strong></th>
<th><strong>Ecology and Threat</strong></th>
<th><strong>Civilisation and Adventure</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><strong>biome.surface.mountain.foothill_woodland<br />
Foothill Woodland</strong></td>
<td>Temperate-cold / moderate / sloped</td>
<td>Timber, springs, stone, ore clues, herbs</td>
<td>Deer, boar, wolves, mountain predators</td>
<td>Mining villages, forts, road passes, cave dungeons</td>
</tr>
<tr class="even">
<td><strong>biome.surface.mountain.rolling_highland<br />
Rolling Highland</strong></td>
<td>Cool / windy / broad hills</td>
<td>Grass, stone, peat, sheep-like grazing</td>
<td>Herds, raptors, foxes, storm creatures</td>
<td>Pastoral towns, wind power, hill forts</td>
</tr>
<tr class="odd">
<td><strong>biome.surface.mountain.rocky_upland<br />
Rocky Upland</strong></td>
<td>Cool-dry / exposed / rough</td>
<td>Stone, ore, scrub, rare herbs</td>
<td>Goats, raptors, burrowers, stone monsters</td>
<td>Quarries, forts, ruins, prospecting camps</td>
</tr>
<tr class="even">
<td><strong>biome.surface.mountain.alpine_meadow<br />
Alpine Meadow</strong></td>
<td>Cold highland / summer wet</td>
<td>Rare flowers, short grass, meltwater, herbs</td>
<td>Summer grazers, pollinators, eagles, snow predators</td>
<td>Seasonal camps, shrines, passes, titan grazing ground</td>
</tr>
<tr class="odd">
<td><strong>biome.surface.mountain.scree<br />
Scree Slopes</strong></td>
<td>Cold / exposed / steep</td>
<td>Loose rock, ore fragments, sparse scrub</td>
<td>Cliff grazers, burrowers, ambush predators</td>
<td>Mine entrances, landslides, dangerous shortcuts</td>
</tr>
<tr class="even">
<td><strong>biome.surface.mountain.conifer_forest<br />
Mountain Conifer Forest</strong></td>
<td>Cold / snowy / steep</td>
<td>Pine timber, resin, stone, herbs</td>
<td>Bears, wolves, deer, climbing monsters</td>
<td>Logging, mountain roads, towers, ruined monasteries</td>
</tr>
<tr class="odd">
<td><strong>biome.surface.mountain.clouded_peaks<br />
Clouded Peaks</strong></td>
<td>Cold-wet / high / cliffed</td>
<td>Bare rock, snow, rare herbs, storm crystals</td>
<td>Raptors, flying monsters, storm elementals</td>
<td>Observatories, temples, flying boss territory</td>
</tr>
<tr class="even">
<td><strong>biome.surface.mountain.high_plateau<br />
High Plateau</strong></td>
<td>Cool-cold / dry-windy / flat highland</td>
<td>Grass, stone, salt pockets, wind resources</td>
<td>Herds, raptors, giants, roaming constructs</td>
<td>Long roads, caravan towns, ancient observatories</td>
</tr>
</tbody>
</table>

## Volcanic, Geothermal, and Young-Land Biomes

<table>
<colgroup>
<col style="width: 20%" />
<col style="width: 20%" />
<col style="width: 20%" />
<col style="width: 20%" />
<col style="width: 20%" />
</colgroup>
<thead>
<tr class="header">
<th><strong>ID / Name</strong></th>
<th><strong>Climate and Terrain</strong></th>
<th><strong>Resources and Vegetation</strong></th>
<th><strong>Ecology and Threat</strong></th>
<th><strong>Civilisation and Adventure</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><strong>biome.surface.volcanic.basalt_plateau<br />
Basaltic Plateau</strong></td>
<td>Variable / windy / plateau</td>
<td>Basalt, iron, sparse grass, column stone</td>
<td>Cliff birds, hardy grazers, stone elementals</td>
<td>Quarries, forts, ancient causeways</td>
</tr>
<tr class="even">
<td><strong>biome.surface.volcanic.ashen_caldera<br />
Ashen Caldera</strong></td>
<td>Temperate-warm / basin / fertile ash</td>
<td>Rich soil, ash, hot springs, metal clues</td>
<td>Grazers, birds, heat creatures, eruption refugees</td>
<td>Farms, forge towns, crater temples, caldera boss</td>
</tr>
<tr class="odd">
<td><strong>biome.surface.volcanic.lavafield_margin<br />
Lavafield Margin</strong></td>
<td>Hot local / dry / broken flows</td>
<td>Basalt, pumice, obsidian, pioneer plants</td>
<td>Heat insects, reptiles, fire elementals</td>
<td>Lava caves, mines, new-land expeditions</td>
</tr>
<tr class="even">
<td><strong>biome.surface.volcanic.geothermal_springs<br />
Geothermal Springs</strong></td>
<td>Cool-hot local / wet / terraced</td>
<td>Mineral water, sulfur, travertine, herbs</td>
<td>Steam insects, amphibians, healing fauna</td>
<td>Bath settlements, alchemy, shrines, unstable vents</td>
</tr>
<tr class="odd">
<td><strong>biome.surface.volcanic.obsidian_ridge<br />
Obsidian Ridge</strong></td>
<td>Arid to cold / exposed ridge</td>
<td>Obsidian, volcanic glass, metal traces</td>
<td>Raptors, glass insects, lightning elementals</td>
<td>Weapon resources, storm towers, shard dungeons</td>
</tr>
<tr class="even">
<td><strong>biome.surface.volcanic.pumice_barrens<br />
Pumice Barrens</strong></td>
<td>Dry / ash-windy / rolling</td>
<td>Pumice, ash, sparse shrubs, light stone</td>
<td>Burrowers, scavengers, ash spirits</td>
<td>Extraction camps, buried towns, ash storms</td>
</tr>
<tr class="odd">
<td><strong>biome.surface.volcanic.sulfur_flats<br />
Sulfur Flats</strong></td>
<td>Hot / toxic / flat</td>
<td>Sulfur, brine, alchemy minerals, vents</td>
<td>Toxic insects, fire creatures, gas-adapted predators</td>
<td>Masked expeditions, forbidden labs, vent boss territory</td>
</tr>
<tr class="even">
<td><strong>biome.surface.volcanic.cloud_forest<br />
Volcanic Cloud Forest</strong></td>
<td>Warm / humid / steep volcanic slope</td>
<td>Fertile ash soil, hardwood, fruit, rare herbs</td>
<td>Dense wildlife, climbers, storm creatures</td>
<td>Terrace settlements, ruins, waterfalls, volcanic shrines</td>
</tr>
</tbody>
</table>

## Karst, Limestone, Canyon, and Eroded-Stone Biomes

<table>
<colgroup>
<col style="width: 20%" />
<col style="width: 20%" />
<col style="width: 20%" />
<col style="width: 20%" />
<col style="width: 20%" />
</colgroup>
<thead>
<tr class="header">
<th><strong>ID / Name</strong></th>
<th><strong>Climate and Terrain</strong></th>
<th><strong>Resources and Vegetation</strong></th>
<th><strong>Ecology and Threat</strong></th>
<th><strong>Civilisation and Adventure</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><strong>biome.surface.karst.limestone<br />
Limestone Karst</strong></td>
<td>Temperate-warm / moderate / broken</td>
<td>Limestone, springs, fertile pockets, clay</td>
<td>Cave bats, goats, ambush predators, sink creatures</td>
<td>Cave-linked towns, monasteries, sinkhole dungeons</td>
</tr>
<tr class="even">
<td><strong>biome.surface.karst.sinkhole_plain<br />
Sinkhole Plain</strong></td>
<td>Temperate / mesic / rolling depressions</td>
<td>Deep soil pockets, limestone, hidden water</td>
<td>Grazers, burrowers, cave predators</td>
<td>Farms, collapse events, hidden cellars, lost roads</td>
</tr>
<tr class="odd">
<td><strong>biome.surface.karst.tower<br />
Tower Karst</strong></td>
<td>Warm-humid / steep towers</td>
<td>Limestone, jungle/scrub plants, springs</td>
<td>Climbers, flyers, cave fauna</td>
<td>Cliff villages, rope routes, temples, sky bridges</td>
</tr>
<tr class="even">
<td><strong>biome.surface.canyon.labyrinth<br />
Canyon Labyrinth</strong></td>
<td>Dry / incised / maze-like</td>
<td>Layered stone, hidden water, ore, fossils</td>
<td>Raptors, snakes, cliff grazers, gorge monsters</td>
<td>Hidden factions, tombs, bridges, ambush routes</td>
</tr>
<tr class="odd">
<td><strong>biome.surface.karst.archlands<br />
Stone Archlands</strong></td>
<td>Dry-temperate / windy / eroded</td>
<td>Stone arches, sand, hardy scrub, minerals</td>
<td>Raptors, burrowers, wind spirits</td>
<td>Road landmarks, shrines, caravan camps, arch guardian</td>
</tr>
<tr class="even">
<td><strong>biome.surface.karst.hoodoo_valley<br />
Hoodoo Valley</strong></td>
<td>Arid / eroded / spired</td>
<td>Claystone, fossils, pigments, sparse shrubs</td>
<td>Burrowers, cliff birds, ambush predators</td>
<td>Bandit camps, fossil sites, hidden ruins</td>
</tr>
<tr class="odd">
<td><strong>biome.surface.karst.travertine<br />
Travertine Terraces</strong></td>
<td>Temperate-warm / spring-fed / stepped</td>
<td>Mineral pools, travertine, herbs, clean water</td>
<td>Amphibians, birds, spring spirits</td>
<td>Bath towns, sacred sites, water puzzles</td>
</tr>
<tr class="even">
<td><strong>biome.surface.karst.chalk_ravines<br />
Chalk Ravines</strong></td>
<td>Cool-temperate / dry valleys / white slopes</td>
<td>Chalk, flint, herbs, springs, fossils</td>
<td>Rabbits, birds, burrowers, pale predators</td>
<td>Ancient roads, hill figures, tombs, quarry towns</td>
</tr>
</tbody>
</table>

## Rivers, Lakes, Springs, and Inland-Water Interfaces

<table>
<colgroup>
<col style="width: 20%" />
<col style="width: 20%" />
<col style="width: 20%" />
<col style="width: 20%" />
<col style="width: 20%" />
</colgroup>
<thead>
<tr class="header">
<th><strong>ID / Name</strong></th>
<th><strong>Climate and Terrain</strong></th>
<th><strong>Resources and Vegetation</strong></th>
<th><strong>Ecology and Threat</strong></th>
<th><strong>Civilisation and Adventure</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><strong>biome.surface.inland.riverbank_woodland<br />
Riverbank Woodland</strong></td>
<td>Varied / humid corridor / low terrace</td>
<td>Riparian timber, reeds, fish, herbs, clay</td>
<td>Birds, beavers-like builders, predators, insects</td>
<td>Bridges, mills, villages, river ruins</td>
</tr>
<tr class="even">
<td><strong>biome.surface.inland.braided_river<br />
Braided River Plain</strong></td>
<td>Cold-temperate / sediment-rich / shifting</td>
<td>Gravel, sand, fish, willow-like shrubs</td>
<td>Migratory birds, fish, grazers, flood predators</td>
<td>Seasonal crossings, extraction, camps, flood events</td>
</tr>
<tr class="odd">
<td><strong>biome.surface.inland.lake_meadow<br />
Lake Meadow</strong></td>
<td>Temperate-cold / humid shore / flat</td>
<td>Grass, fish, reeds, clay, fresh water</td>
<td>Water birds, grazers, fish predators</td>
<td>Fishing villages, farms, fog, lake boss rumours</td>
</tr>
<tr class="even">
<td><strong>biome.surface.inland.inland_shore<br />
Inland Shore</strong></td>
<td>Varied / wave-exposed / beach or rock</td>
<td>Sand, gravel, reeds, driftwood, fish</td>
<td>Birds, amphibians, shoreline predators</td>
<td>Ports, ferries, ruins, storms, trade routes</td>
</tr>
<tr class="odd">
<td><strong>biome.surface.inland.river_gorge<br />
River Gorge</strong></td>
<td>Varied / steep / fast water</td>
<td>Stone, fish, herbs, waterfall resources</td>
<td>Cliff birds, goats, aquatic predators</td>
<td>Bridges, forts, hidden caves, gorge dungeons</td>
</tr>
<tr class="even">
<td><strong>biome.surface.inland.waterfall_basin<br />
Waterfall Basin</strong></td>
<td>Humid / elevation break / spray zone</td>
<td>Fresh water, moss, herbs, stone, power</td>
<td>Amphibians, birds, water spirits</td>
<td>Mills, shrines, hidden entrances, guardian boss</td>
</tr>
<tr class="odd">
<td><strong>biome.surface.inland.spring_fields<br />
Springs and Seepfields</strong></td>
<td>Varied / groundwater-fed / gentle</td>
<td>Clean water, herbs, clay, wet grass</td>
<td>Pollinators, small grazers, amphibians</td>
<td>Village sites, sacred springs, healing trade</td>
</tr>
<tr class="even">
<td><strong>biome.surface.inland.riparian_forest<br />
Riparian Forest</strong></td>
<td>Dry to temperate / linear / flood-influenced</td>
<td>Dense water timber, fruit, reeds, fish</td>
<td>High biodiversity, predators, migration corridor</td>
<td>River towns, ambushes, irrigation, old roads</td>
</tr>
</tbody>
</table>

# 37. Content Completeness Contracts and Production Budgets

The registry is only the structural beginning. A biome should not be marked content-complete because it has terrain and a texture palette. Completion requires connected ecology, resources, structures, settlements, dungeons, events, presentation, and dynamic states appropriate to its production priority.

| **Content Layer**              | **Minimum Contract**                                                                                                                                                           |
|--------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Major Surface Biome Family** | 6-12 biome entries or meaningful sub-biomes over time; at least two distinct terrain forms and transition set.                                                                 |
| **Biome Entry**                | Climate, landform, palette, soil, vegetation, hydrology, resources, traversal, buildability, season, dynamic states, map identity.                                             |
| **Ecology**                    | 6-12 compatible ordinary creature-family placements across the family, 2-4 hostile or unusual families, migration or lifecycle links, and at least one ecological consequence. |
| **Civilisation**               | At least two settlement or livelihood adaptations across the family; road and trade logic; cultural preference links without ancestry lock.                                    |
| **Adventure**                  | 2-4 minor structure or landmark families, 1-3 dungeon/lair families, compatible faction sites, and regional boss eligibility.                                                  |
| **Resources**                  | Common survival, construction, food/medicine, trade, strategic, and rare resources with renewal and extraction rules.                                                          |
| **Presentation**               | Terrain and vegetation silhouettes, material palette, weather, particles, soundscape, map treatment, seasonal variation, accessibility cues.                                   |
| **Dynamic State**              | At least four relevant states chosen from seasonal, burned, flooded, drought, overharvested, civilised, industrialised, abandoned, restored, warded, corrupted.                |
| **Production Validation**      | Seed tests, adjacency tests, traversal, spawn suitability, settlement placement, resource access, repetition, performance, and save compatibility.                             |

| **Milestone**           | **Target**                                                                                                                               |
|-------------------------|------------------------------------------------------------------------------------------------------------------------------------------|
| **Foundation Set**      | 24-32 biomes proving all climate and terrain families, transitions, settlement adaptation, ecology slots, dungeons, and regional bosses. |
| **Production Alpha**    | 48-64 biomes with multiple complete regions, seasons, events, cultures, creature sets, structures, and adventure content.                |
| **Full v1 Target**      | All ninety-six entries available or deliberately merged/deferred after content review; each major family feels mechanically distinct.    |
| **Post-Launch / Packs** | Additional region and biome families may extend the Atlas without changing stable world identity or rewriting explored terrain.          |

# 38. Balancing and Design Rules

| **Rule**                           | **Design Reason**                                                                                                                                                  |
|------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Natural Readability**            | The normal Overworld is recognisably natural fantasy. Exceptional magic is rarer and explained.                                                                    |
| **No Empty Beauty**                | Every biome provides practical resources, ecology, traversal, settlement, adventure, or world-state value.                                                         |
| **No Universal Best Biome**        | Every biome offers advantages and constraints. Safe fertile lowlands trade defence and rarity for convenience; harsh regions offer strategic rewards and identity. |
| **Travel Has Meaning**             | Regional scarcity, climate, routes, mountains, rivers, seasons, factions, and danger create reasons to travel, trade, build roads, and use transport.              |
| **Older Regions Stay Useful**      | Starting and common regions remain valuable through settlement, farming, culture, trade, restoration, construction, and infrastructure.                            |
| **Difficulty Is Layered**          | Danger depends on biome, time, weather, depth, territory, wealth, events, boss pressure, magic, and player settings rather than distance alone.                    |
| **Terrain Supports Building**      | Dramatic terrain includes buildable pockets and clear engineering solutions; flatness is not the only valid buildability.                                          |
| **Ecology Is Legible**             | Creature presence has tracks, sounds, nests, prey, damage, migration, and environmental clues.                                                                     |
| **Disasters Are Fair**             | Major disasters warn, allow preparation, scale with settings, and create recovery gameplay.                                                                        |
| **Procedural Does Not Mean Equal** | Every seed need not contain every biome, but enabled content and progression promises must remain reachable through alternatives.                                  |
| **Culture Is Layered**             | Culture preferences and architecture respond to climate, but people can migrate, adapt, mix, trade, and build elsewhere.                                           |
| **World Memory Persists**          | Fire, flood, extraction, war, settlement, restoration, and boss outcomes leave visible and systemic evidence.                                                      |

# 39. Cross-Document Requirements and Update Plan

| **Document / System**                   | **Required Update**                                                                                                                                                                                                      |
|-----------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **11 - Biomes and World Generation**    | Mark POC valley, starter biome, fixed village, fixed cave, fixed camp, and exact starting arrangement sections as archived validation content. Reference 24A and 24B for production topology and natural surface biomes. |
| **06 - Resource Progression**           | Link resources to 24B biome IDs, region geology, renewal, farming, prospecting, and extraction suitability.                                                                                                              |
| **07 - NPC Village System**             | Replace POC roster and forest-hamlet placement assumptions with culture, household, profession, settlement archetype, climate adaptation, and region suitability.                                                        |
| **10 - Creatures and Monsters**         | Retire POC creature set as production requirement. Link creature habitats, migration, nest eligibility, and boss territory to 24B and later 24F/24H.                                                                     |
| **12 - Structures**                     | Retire fixed POC structure loop. Link placement to 24B terrain, hydrology, biome, history, culture, routes, and dynamic states.                                                                                          |
| **13 - Peoples, Cultures and Factions** | Replace POC Riverward/Briarhook production assumptions with Atlas cultures and faction packages; link settlement adaptations to 24B.                                                                                     |
| **14 - Dimensions**                     | Keep realm system but move realm biome expansion to 24D; overworld portal suitability can reference 24B and 24C.                                                                                                         |
| **15 - Quest and Event System**         | Generated events and quests should bind to region climate, season, ecology, settlements, structures, dungeons, bosses, disasters, and dynamic states.                                                                    |
| **18 - Technical Implementation Plan**  | Its Unreal-specific engine direction is obsolete. Current Godot/Summer Engine implementation documents must implement equivalent deterministic region, climate, biome, state, save, debug, and validation contracts.     |
| **Forge Document Sets**                 | Biome entries should link required block palettes, vegetation models, creature assets, particles, sounds, ambient loops, weather, landmarks, and map icons.                                                              |

# 40. Open Questions for Later Atlas Documents

1.  How many continents and macro-regions should typical world-size presets target?

2.  Which twenty-four to thirty-two biome entries form the first production foundation set?

3.  How detailed should season-driven crop, wildlife, snow, water, and road simulation be at normal difficulty?

4.  Which natural biome families receive full cultural building packs first?

5.  How many regional boss territories should a typical macro-region support before the world feels overcrowded?

6.  Which dungeons and lairs are natural-biome staples, and which remain rare history-driven exceptions?

7.  How aggressively may forests regrow, wetlands shift, rivers flood, dunes move, or glaciers change during a long save?

8.  Which climate variables are exposed to players in world creation versus kept under named presets?

9.  How are regional names localised and made culture-aware without generating unreadable combinations?

10. Which biome transformations require permanent block edits, region-state overlays, or abstract distant simulation?

11. How will content-pack additions affect unexplored region generation while preserving existing-world compatibility?

12. Which surface environments should connect most often to oceans, skylands, underground systems, and dimensions in 24C and 24D?

# Appendix A. Overworld Region Database Field Template

| **Field**                       | **Description**                                                                            |
|---------------------------------|--------------------------------------------------------------------------------------------|
| **region_archetype_id**         | Stable definition ID for the reusable region template.                                     |
| **display_name_key**            | Localisable archetype display name; generated instances receive culture-aware names.       |
| **world_profile_tags**          | Compatible world presets and density settings.                                             |
| **landmass_role**               | Interior, margin, basin, range, plateau, watershed, rift, canyon, volcanic, glacial.       |
| **climate_ranges**              | Temperature, moisture, seasonality, continentality, altitude, exposure, storm pressure.    |
| **terrain_province_weights**    | Dominant and secondary landform families.                                                  |
| **hydrology_rules**             | Watersheds, rivers, lakes, wetlands, springs, closed basins, flood likelihood.             |
| **biome_family_weights**        | Dominant, common, uncommon, rare, and excluded surface biome families.                     |
| **adjacency_rules**             | Required, preferred, allowed, discouraged, and forbidden neighbouring region types.        |
| **geology_rules**               | Stone, soil, ore, clay, salt, volcanic, karst, glacial, sediment and prospecting identity. |
| **resource_profile_links**      | Common, strategic, scarce, renewable, seasonal and bulk-extraction resources.              |
| **ecology_profile_links**       | Habitat slots, migration corridors, predator pressure, monster and boss eligibility.       |
| **civilisation_suitability**    | Settlement, agriculture, roads, trade, defence, industry and cultural preference fields.   |
| **history_weights**             | Likely past events, ruins, roads, wars, abandonment, sacred sites and ownership changes.   |
| **structure_and_dungeon_slots** | Density and eligibility for landmarks, settlements, ruins, lairs, dungeons and wonders.    |
| **boss_territory_rules**        | Regional, wandering, dormant, awakened and event boss slots.                               |
| **magic_and_leyline_rules**     | Ambient mana, natural anomalies, threshold to special-biome conversion.                    |
| **dynamic_state_support**       | Disaster, war, extraction, civilisation, restoration, corruption and seasonal states.      |
| **naming_profile_links**        | Language, landform, climate, history, ecology and culture naming sets.                     |
| **production_status**           | Foundation, Alpha, Beta, Full Game, Deferred, Placeholder, Balance Draft.                  |

# Appendix B. Surface Biome Database Field Template

| **Field**                  | **Description**                                                                                 |
|----------------------------|-------------------------------------------------------------------------------------------------|
| **biome_id**               | Stable unique ID.                                                                               |
| **display_name_key**       | Localisable biome name.                                                                         |
| **family_id**              | Major surface-biome family.                                                                     |
| **parent_biome_id**        | Optional parent or sub-biome relationship.                                                      |
| **rarity**                 | Common, Uncommon, Rare, Legendary or content-pack-specific.                                     |
| **production_priority**    | Foundation, Alpha, Full v1, Later.                                                              |
| **temperature_range**      | Allowed mean and seasonal temperature values.                                                   |
| **moisture_range**         | Allowed moisture and saturation values.                                                         |
| **seasonality_rules**      | Four-season, wet/dry, monsoon, polar, aseasonal, storm season.                                  |
| **altitude_and_slope**     | Elevation, relief, slope, exposure and terrain constraints.                                     |
| **terrain_shape_tags**     | Flat, rolling, ridge, plateau, basin, canyon, karst, volcanic, glacial, riverine.               |
| **hydrology_rules**        | River, lake, spring, flood, groundwater, drainage and wetland influence.                        |
| **block_palette_ids**      | Terrain, soil, stone, surface and state palettes.                                               |
| **vegetation_profile_ids** | Canopy, trees, shrubs, grasses, herbs, fungi, regrowth and fuel load.                           |
| **soil_profile**           | Fertility, drainage, salinity, acidity, erosion and agriculture.                                |
| **resource_profile_ids**   | Forage, timber, stone, ore clues, bulk deposits, strategic and rare resources.                  |
| **ecology_slot_profile**   | Ambient, herbivore, predator, scavenger, monster, magical wildlife, migration and apex slots.   |
| **settlement_suitability** | Water, food, buildability, agriculture, routes, defence, growth and adaptation.                 |
| **structure_slot_profile** | Landmarks, roads, settlements, ruins, faction sites, lairs, dungeons and wonders.               |
| **boss_territory_tags**    | Compatible regional or wandering boss roles.                                                    |
| **weather_profile**        | Normal weather, severe weather and disaster eligibility.                                        |
| **mana_band**              | Dormant, Low, Ambient, Strong Natural, Special Threshold.                                       |
| **adjacency_profile**      | Required and allowed ecotones, exclusions and transition rules.                                 |
| **dynamic_state_support**  | Seasonal, burned, flooded, drought, overharvested, civilised, abandoned, restored and overlays. |
| **map_and_codex_profile**  | Map palette, icon, discovery text, rumours, cultural names and hazard cues.                     |
| **asset_requirements**     | Blocks, vegetation, creatures, structures, particles, sounds, music, weather, UI.               |
| **dependencies**           | Owning registry and Atlas links.                                                                |
| **notes**                  | Balance, lore, implementation and migration notes.                                              |

# Appendix C. Biome Adjacency and Transition Matrix

| **Biome Family**      | **Preferred Neighbours**                                                              | **Repair / Exclusion Notes**                                                   |
|-----------------------|---------------------------------------------------------------------------------------|--------------------------------------------------------------------------------|
| **Temperate Meadow**  | Broadleaf forest, pasture, river corridor, foothill, wet meadow, farmland.            | Dune sea or glacier without dry/cold transition or elevation cause.            |
| **Temperate Forest**  | Meadow, river woodland, foothill, moor, boreal transition, managed land.              | Hyperarid desert without steppe/scrub or rain-shadow sequence.                 |
| **Boreal Forest**     | Cold meadow, muskeg, tundra, mountain conifer, lake edge.                             | Tropical rainforest without major magical or altitude explanation.             |
| **Tundra**            | Boreal edge, frost meadow, glacier, polar plateau, cold coast in 24C.                 | Hot savanna or rainforest without exceptional boundary.                        |
| **Tropical Forest**   | Monsoon forest, savanna, flooded jungle, cloud forest, riverlands.                    | Polar plateau without mountain or magical cause.                               |
| **Savanna**           | Warm scrub, dry forest, seasonal grassland, river corridor, semi-desert.              | Glacier without high mountain transition.                                      |
| **Desert**            | Semi-desert, thorn scrub, badlands, salt basin, river oasis, volcanic barren.         | Humid old-growth forest without water corridor or sharp explained barrier.     |
| **Wetland**           | River, lake edge, meadow, forest, floodplain, coastal transition in 24C.              | High exposed ridge unless hanging wetland or plateau basin explains it.        |
| **Mountain**          | Foothills, alpine, plateau, glacial, canyon, volcanic, forest variants.               | Any climate may occur by elevation, but vertical sequence must be coherent.    |
| **Volcanic**          | Mountain, plateau, ash scrub, fertile recovery, geothermal wetland, special 24C zone. | No hard exclusion if geology explains it; hazard gradients required.           |
| **Karst / Canyon**    | Forest, scrub, desert, meadow, river gorge, mountain foothill.                        | Biome depends on climate overlay; karst is a landform family, not one climate. |
| **Inland Water Edge** | Compatible adjacent land biome, floodplain, wetland, river woodland.                  | Must connect to actual water geometry and hydrology.                           |

# Appendix D. Production Authoring Checklist

| **Checklist Area** | **Pass Requirement**                                                                                                             |
|--------------------|----------------------------------------------------------------------------------------------------------------------------------|
| **Identity**       | Biome has a unique gameplay identity beyond palette and vegetation.                                                              |
| **Climate**        | Temperature, moisture, seasonality, altitude, exposure, and weather are defined.                                                 |
| **Terrain**        | Landform, slope, buildability, traversal, hydrology, and transitions are defined.                                                |
| **Resources**      | Food, timber/plant, stone/soil, strategic, rare, renewal, agriculture, and extraction rules exist.                               |
| **Ecology**        | Ambient, prey, predator, scavenger, monster, migration, civilisation, and apex slots are linked.                                 |
| **Civilisation**   | Settlement adaptations, roads, trade, territory, agriculture, defence, and culture preferences exist.                            |
| **Adventure**      | Landmarks, lairs, ruins, dungeons, faction sites, boss eligibility, rumours, and rewards are linked.                             |
| **Dynamic State**  | Seasonal and at least three relevant disturbance or recovery states are supported.                                               |
| **Presentation**   | Silhouette, palette, lighting, weather, particles, soundscape, map, codex, and accessibility cues exist.                         |
| **Forge Assets**   | Required blocks, plants, structures, creatures, particles, sounds, ambient loops, and map icons are listed.                      |
| **Validation**     | Adjacency, seed variety, traversal, start suitability, settlement placement, resource access, performance, and saves are tested. |
| **Ownership**      | Every linked field points to an authoritative Atlas or registry source.                                                          |

# Appendix E. [[24B - Overworld Regions, Climate and Surface Biomes]] Acceptance Criteria

| **Acceptance Test**             | **Pass Condition**                                                                                                                       |
|---------------------------------|------------------------------------------------------------------------------------------------------------------------------------------|
| **POC Retirement**              | No production rule requires Forest Hamlet, fixed villagers, watchtower, goblin raid, fixed cave, mana pocket, or valley topology.        |
| **Atlas Alignment**             | All region and biome rules follow 24A deterministic topology, authored randomness, relationship, validation, and save-safety principles. |
| **Boundary Clarity**            | 24B natural surface scope is distinct from 24C special/ocean/sky/underground scope and 24D dimension scope.                              |
| **Region Depth**                | At least twenty-four reusable region archetypes cover major climate and terrain combinations.                                            |
| **Biome Depth**                 | Ninety-six natural surface biome entries are defined across twelve major families.                                                       |
| **Climate Coherence**           | Temperature, moisture, seasonality, altitude, hydrology, exposure, and rain-shadow rules create explainable geography.                   |
| **Start Freedom**               | Starting-area validation supports multiple climates and does not require a settlement or fixed encounter.                                |
| **Cross-System Use**            | Biomes support resources, ecology, settlements, structures, dungeons, bosses, magic, automation, events, maps, and dynamic states.       |
| **Civilisation Representation** | Cultures may prefer and adapt to biomes without ancestry lock or biological determinism.                                                 |
| **Adventure Expansion**         | Dungeon, lair, ruin, regional boss, wandering boss, and world-wonder slots are part of region and biome planning.                        |
| **Production Usability**        | Database field templates, authoring checklist, content contracts, priorities, adjacency rules, and update requirements are included.     |
| **Visual QA**                   | Document renders without clipped text, broken tables, missing headers, or unreadable registry pages.                                     |

| **End of [[24B - Overworld Regions, Climate and Surface Biomes]]**                                                                                                                                                                                                                                 |
|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| This document establishes the production atlas for Overworld land regions, climate, hydrology, terrain, and natural surface biomes. The next document in the set is 24C - Oceans, Coasts, Islands, Skylands, Underground, and Special Overworld Biomes. |

---
## Navigation
- Previous: [[24A - Foundations, World Topology and Procedural Content Rules|24A]]
- Next: [[24C - Oceans, Coasts, Islands, Skylands, Underground and Special Overworld Biomes|24C]]
- Index: [[00 - Document Set 24 Index]]
