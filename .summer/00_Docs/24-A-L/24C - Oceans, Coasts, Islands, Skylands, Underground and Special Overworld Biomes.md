---
title: 24C — Oceans, Coasts, Islands, Skylands, Underground and Special Overworld Biomes
  Biomes
document_set: 24
document: 24C
aliases:
- 24C
- Document 24C
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
- 24c
---

# 24C — Oceans, Coasts, Islands, Skylands, Underground and Special Overworld Biomes

> [!NOTE]
> Obsidian-ready Markdown conversion of the approved Set 24 source document. Source wording and structure have been preserved wherever possible.

**Fantasy Voxel Civilisation Sandbox**

**24C - World Content Atlas: Oceans, Coasts, Islands, Skylands, Underground and Special Overworld Biomes**

Version 0.1 - Post-POC Production Content Draft

A database-ready atlas for seed-derived marine worlds, coastal interfaces, island chains, aerial terrain, layered cave networks, deep strata, magical overlays, corrupted regions, realm leaks, special hazards, ecology, resources, settlements, dungeons, bosses, and persistent world transformation.

| **Oceans, Vertical Worlds, and Special Overworld Atlas Statement**                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| The Overworld must continue beyond ordinary land surfaces. Seas, coasts, islands, skylands, caves, deep strata, magical fields, ancient scars, corrupted regions, and realm leaks must form coherent, traversable, exploitable, inhabitable, and transformable world systems. None of these spaces may exist as decorative edges, disconnected resource rooms, or recoloured variants. Each must connect to ecology, civilisations, structures, dungeons, bosses, resources, magic, automation, travel, history, and long-term world state. |

| **Field**               | **Locked Direction**                                                                                                                                                                                                                                      |
|-------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Document Set            | This is [[24C - Oceans, Coasts, Islands, Skylands, Underground and Special Overworld Biomes]] in World Content Atlas Document Set 24.                                                                                                                                                                                              |
| Document Scope          | Oceans, coasts, islands, underwater regions, skylands, cave systems, deep strata, and special Overworld biome families, including magical, ancient, corrupted, blessed, realm-leaking, dream-touched, gravity-altered, and machine-influenced landscapes. |
| Post-POC Direction      | No fixed POC valley, cave, river, mana pocket, rune clearing, or guaranteed portal arrangement remains. All relevant content is selected, placed, named, connected, and versioned from world seed plus authored constraints.                              |
| World Shape             | The Overworld is a layered three-dimensional planet-scale space: surface land, coastal interfaces, ocean volume, islands, sky volume, cave networks, deep layers, and special-state overlays share one topology.                                          |
| Ocean Direction         | Oceans are navigable regions with currents, depth bands, ecosystems, structures, hazards, settlements, resources, dungeons, and bosses rather than empty map boundaries.                                                                                  |
| Skyland Direction       | Skylands are generated aerial provinces with altitude bands, wind routes, cloud layers, floating terrain, aerial ecology, settlements, dungeons, and resource logic.                                                                                      |
| Underground Direction   | The underground is a connected vertical world with shallow caves, regional cave provinces, deep strata, water systems, civilisations, megadungeons, geological resources, and world-history layers.                                                       |
| Special Biome Direction | Strong magical, ancient, corrupted, blessed, dream-touched, gravity-altered, machine-altered, and realm-leak states use base-biome plus overlay or dedicated-biome rules according to how deeply they change generation.                                  |
| Production Boundary     | 24C defines biome-facing world content and placement requirements. Detailed creature rosters, dungeon grammars, boss encounters, cultures, and dimension-native content are expanded by Documents 24E through 24H.                                        |
| Technical Direction     | All definitions use stable IDs, deterministic seed derivation, explicit tags, generated relationships, simulation LOD, save-safe state transitions, and Godot/Summer Engine data-driven implementation boundaries.                                        |

# Document Purpose

This document expands the World Content Atlas beyond ordinary terrestrial surface biomes. It defines the world-facing rules that make coasts, oceans, island chains, skylands, caves, deep strata, magical zones, historical scars, corrupted territories, and realm-leak regions feel like connected parts of one living Overworld.

[[24B - Overworld Regions, Climate and Surface Biomes]] established continental assembly, macro-regions, climate, watersheds, landforms, natural surface biome families, ecotones, seasons, and ordinary surface ecology. [[24C - Oceans, Coasts, Islands, Skylands, Underground and Special Overworld Biomes]] continues that hierarchy into the horizontal edges, vertical layers, unusual physical spaces, and transformative overlays that make Leyforge a high-fantasy world rather than a conventional terrain generator.

This document does not assign final creature rosters, civilisation lore, full dungeon room grammars, boss movesets, or dimension-native biome catalogues. Instead, it defines the environmental contracts those later Atlas documents must satisfy. It also establishes generation and validation rules so rare or spectacular content remains discoverable without becoming repetitive, incoherent, or progression-breaking.

# Design Source and Supersession Rules

| **Source**                                  | **Direction Retained**                                                                                                                                      | **24C Expansion or Supersession**                                                                                                                                                |
|---------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 24A - Atlas Foundations                     | Deterministic authored randomness, nested topology, procedural history, relationship graphs, uniqueness controls, dynamic states, and save-safe generation. | 24C applies those rules to marine, aerial, subterranean, and special-state content.                                                                                              |
| 24B - Overworld Regions and Surface Biomes  | Continents, climate, hydrology, geology, landform grammar, natural biome mosaics, and ecotones.                                                             | 24C consumes land-region boundaries, watersheds, terrain provinces, climate fields, and history layers to generate coasts, seas, islands, caves, skylands, and special overlays. |
| 00 - Master Game Design Bible               | Living civilisations, survival, magic, automation, dimensions, danger, wonder, and visible world consequence.                                               | Every non-standard biome must support several pillars instead of functioning as scenery or isolated adventure content.                                                           |
| 01 - Core Gameplay Loop                     | Explore -\> gather -\> craft -\> build -\> interact -\> automate -\> defend -\> upgrade -\> expand.                                                         | Marine, aerial, subterranean, and special spaces must support the whole loop through travel, resources, settlements, threats, structures, production, and expansion.             |
| 03-06 - Blocks, Items, Recipes, Resources   | World materials have physical, inventory, transformation, strategic, magical, and civilisation uses.                                                        | 24C assigns environmental source families, extraction conditions, hazards, renewable status, stabilisation needs, and biome utility.                                             |
| 07-09 - NPCs, Automation, Magic             | Settlements consume real supplies; infrastructure is physical; magic is practical and risky.                                                                | Coasts, skylands, caves, and magical regions must support habitation, routes, power opportunities, logistics constraints, wards, mana flow, and extraction consequences.         |
| 10 - Creatures and Monsters                 | Creatures form ecology, threat, resource, and world-state systems.                                                                                          | 24C supplies habitat slots, vertical movement rules, marine/aerial/subterranean roles, migration paths, boss territories, and transformed variants.                              |
| 11 - Biomes and World Generation            | Biomes control resources, settlements, structures, creatures, magic, threats, and dynamic states.                                                           | POC-specific biome entries and fixed spatial relationships are retired. This Atlas becomes the production-facing biome source of truth.                                          |
| 12 - Structures                             | Structures have origins, ownership, dynamic states, rewards, restoration, and procedural placement.                                                         | 24C defines marine, aerial, cave, deep-world, and special-biome placement anchors, access rules, route connections, and structural adaptation requirements.                      |
| 13-16 - Peoples, Dimensions, Quests, Combat | Cultures, realms, story, encounters, and consequences connect to place.                                                                                     | 24C reserves environmental slots and constraints while later Atlas documents provide final authored content.                                                                     |
| 18 - Technical Plan                         | Stable IDs, deterministic worldgen, registries, LOD, validation, save safety, and data-driven systems.                                                      | Outdated engine-specific language is not carried forward; implementation guidance aligns with the current Godot/Summer Engine direction.                                         |

# Static Table of Contents

- 1\. Locked Vertical and Special Overworld Atlas Identity

- 2\. Post-POC Production Decisions

- 3\. Authority, Boundaries, and Cross-Document Ownership

- 4\. Layered Overworld Topology

- 5\. Ocean Basin, Sea, Coast, and Island Assembly

- 6\. Marine Climate, Currents, Tides, Salinity, and Water States

- 7\. Coastal Morphology, Littoral Interfaces, and Shoreline Change

- 8\. Island Chains, Archipelagos, and Isolated Landmasses

- 9\. Marine Depth Bands and Traversal Progression

- 10\. Coastal and Marine Biome Family Architecture

- 11\. Rocky Coasts, Cliffs, Shingle Shores, and Sea Caves

- 12\. Sandy Coasts, Dunes, Barrier Islands, and Lagoons

- 13\. Salt Marshes, Mangroves, Mudflats, Estuaries, and Deltas

- 14\. Shallow Seas, Seagrass Meadows, Kelp Forests, and Shelf Waters

- 15\. Coral Reefs, Atolls, Warm Shoals, and Living Ridges

- 16\. Open Ocean, Pelagic Routes, Gyres, and Storm Seas

- 17\. Deep Ocean, Abyssal Plains, Trenches, Vents, and Hadal Zones

- 18\. Polar Coasts, Sea Ice, Ice Shelves, and Glacial Seas

- 19\. Marine Settlements, Routes, Structures, Dungeons, and Boss Territories

- 20\. Island Region and Island Biome Registry

- 21\. Skyland Topology, Altitude Bands, and Aerial Connectivity

- 22\. Floating Islands, Cloud Seas, Wind Corridors, and Storm Provinces

- 23\. Aerial Ecology, Resources, Settlements, Dungeons, and Boss Territories

- 24\. Underground Spatial Hierarchy and Geological Provinces

- 25\. Cave Connectivity, Entrances, Vertical Shafts, and Subterranean Routes

- 26\. Shallow Caves, Karst, Tunnels, and Surface-Linked Caverns

- 27\. Fungal, Root, Crystal, Mana, Ice, Salt, and Mineral Caverns

- 28\. Underground Rivers, Lakes, Seas, Aquifers, and Flooded Systems

- 29\. Deepstone, Magma, Forge Depths, Machine Strata, and Abyssal Fractures

- 30\. Underground Civilisations, Infrastructure, Dungeons, and Boss Territories

- 31\. Special Overworld Biome and Overlay Architecture

- 32\. Leyline, Mana-Saturated, Spirit, Dream, Gravity, Time, and Realm-Leak Regions

- 33\. Ancient, Haunted, Battlefield, Machine, Catastrophe, and Colossal-Remains Regions

- 34\. Corruption, Blight, Void Scars, Blessing, Warding, Cleansing, and Restoration

- 35\. Ecology, Migration, Food Webs, and Environmental Pressure

- 36\. Resources, Extraction, Farming, Power, Automation, and Environmental Consequences

- 37\. Civilisations, Settlements, Trade, Roads, Ports, Sky Routes, and Deep Routes

- 38\. Structures, Lairs, Dungeons, Megadungeons, Wonders, and World Boss Placement

- 39\. Spawn Suitability and Progression Guarantees Without Fixed Content

- 40\. Dynamic States, Disasters, Seasonal Change, and Long-Term Transformation

- 41\. Discovery, Mapping, Naming, Rumours, Codex, and Environmental Readability

- 42\. Visual, Audio, Weather, Lighting, and Forge Asset Requirements

- 43\. Simulation LOD, Performance, Streaming, and Multiplayer Continuity

- 44\. Data Models, Registries, Validation, Seed Testing, and Production Gates

- Appendix A. Biome and Overlay Registry Field Templates

- Appendix B. World-Layer Adjacency and Transition Matrix

- Appendix C. Minimum Completeness Contracts

- Appendix D. Cross-Document Dependency and Update Register

# 1. Locked Vertical and Special Overworld Atlas Identity

| **Locked Rule**                                                                                                                                                                                                                                                                                                                                                          |
|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Every ocean, coast, island, skyland, cave province, deep layer, and special Overworld biome must answer multiple connected gameplay questions: what does it provide, conceal, threaten, teach, connect, transform, enable, or remember for survival, ecology, civilisations, routes, structures, dungeons, bosses, resources, magic, automation, story, and world state? |

| **Identity Layer**            | **Design Meaning**                                                                                                                    | **Player-Facing Result**                                                                       |
|-------------------------------|---------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------|
| Whole-World Continuity        | Land, sea, sky, underground, and special states share seed, climate, geology, history, ecology, and route logic.                      | The world feels like one place rather than separate generators stitched together.              |
| Three-Dimensional Exploration | Altitude, depth, pressure, light, currents, wind, cave connectivity, and portal influence create meaningful vertical geography.       | Going upward, downward, offshore, or into altered regions changes preparation and opportunity. |
| Living Ecology                | Marine, aerial, surface, and subterranean food webs respond to seasons, migration, settlement, extraction, corruption, and bosses.    | Creatures belong to habitats and world changes have visible ecological effects.                |
| Civilisation Space            | Ports, island settlements, sky enclaves, cave cities, deep industries, routes, outposts, and realm-border communities can emerge.     | Civilisation is not restricted to ordinary surface villages.                                   |
| Adventure Network             | Lairs, ruins, wrecks, caverns, trench sites, sky fortresses, buried cities, megadungeons, and world bosses use environmental context. | Adventure locations feel discovered and historically grounded.                                 |
| Resource and Industry Layer   | Sea resources, wind sites, geothermal power, deep deposits, rare reagents, and dangerous extraction support production.               | Exploration can unlock new industries without turning regions into simple ore rooms.           |
| Magic in the Landscape        | Leylines, spirit zones, dream fields, gravity scars, ancient machinery, corruption, and realm leaks alter rules physically.           | High fantasy is readable in terrain, ecology, structures, weather, and hazards.                |
| Persistent Consequence        | Coasts erode, reefs recover, caves flood, sky routes destabilise, corruption spreads, and sites can be cleansed or industrialised.    | The world records player and faction choices over time.                                        |

## 1.1 What This Atlas Must Prevent

- Oceans that are empty travel barriers with no ecology, routes, structures, or reasons to explore.

- Caves that are disconnected tunnels filled with interchangeable ore and enemies.

- Floating islands that exist only as visual landmarks without wind, altitude, settlement, resource, or access logic.

- Magical biomes that are ordinary biomes with a colour filter and stronger monsters.

- Corruption that appears randomly without source, spread rules, counterplay, or lasting consequence.

- Rare spectacular content repeated so often that it stops feeling rare or becomes required on every seed.

- Biome-specific progression that can permanently fail because one exact site or species did not generate.

# 2. Post-POC Production Decisions

| **Area**             | **Locked Production Decision**                                                                                                                                                                            |
|----------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| POC Content          | Forest Hamlet, fixed POC valley zones, fixed mana pocket, fixed rune clearing, fixed cave threat mix, fixed goblin camp, and fixed watchtower relationships are removed from production world generation. |
| Procedural Guarantee | Required capabilities are guaranteed by content categories and fallback placement, never by one named location, biome, creature, structure, or NPC.                                                       |
| Ocean Scale          | Large worlds may contain multiple ocean basins and inland seas. Smaller presets can compress them while preserving depth-band, coastal, route, and progression functions.                                 |
| Coast Change         | Coastlines can shift through tides, storms, erosion, accretion, volcanism, glacial change, settlement engineering, corruption, and magical events within bounded simulation rules.                        |
| Island Diversity     | Island generation includes continental fragments, volcanic chains, reef islands, barrier islands, river islands, glacial islands, uplifted plateaus, magical islands, and floating landmasses.            |
| Underwater Access    | Players can interact with shore and shallow water early. Sustained deep-water and abyssal exploration requires equipment, magic, vehicles, infrastructure, species adaptations, or allied support.        |
| Skyland Access       | Skylands may be visible early but require climbing, gliding, mounts, airships, portals, wind lifts, magic, constructed routes, or regional structures according to altitude and world settings.           |
| Underground Scale    | Caves are generated as regional networks with geology, hydrology, entrances, depth bands, route hierarchy, settlements, dungeons, and deep-world transitions.                                             |
| Special Biomes       | Use overlays where the base biome remains structurally important; use dedicated biome definitions where physical laws, terrain, ecology, resource web, and settlement logic change substantially.         |
| Difficulty           | Depth, altitude, pressure, darkness, isolation, navigation, weather, magic intensity, hostile ecology, and infrastructure dependency scale independently rather than through one global danger number.    |
| Player Alteration    | Players and civilisations can build ports, drain or flood sites, bridge gaps, stabilise sky routes, tunnel, ward, cleanse, restore, exploit, pollute, or corrupt regions.                                 |
| Regeneration         | Ordinary ecology can recover through managed rules. Unique structures, boss states, historical evidence, major terrain changes, and player construction remain persistent.                                |

# 3. Authority, Boundaries, and Cross-Document Ownership

| **Content Question**                                                                        | **Primary Authority** | **24C Responsibility**                                                                                            |
|---------------------------------------------------------------------------------------------|-----------------------|-------------------------------------------------------------------------------------------------------------------|
| How land climate and ordinary surface biomes are formed                                     | 24B                   | Consumes climate, hydrology, terrain, geology, and history outputs.                                               |
| How oceans, coasts, islands, skylands, caves, deep layers, and special biomes are generated | 24C                   | Primary Atlas authority.                                                                                          |
| Which peoples, cultures, and factions inhabit them                                          | 24E                   | 24C defines habitat, adaptation, route, settlement, and resource slots.                                           |
| Which creatures and monsters occupy them                                                    | 24F                   | 24C defines ecology roles, spawn envelopes, migration routes, and transformation tags.                            |
| How dungeons are built internally                                                           | 24G                   | 24C defines environmental families, entrances, origin, scale, state, and placement anchors.                       |
| How bosses fight and progress                                                               | 24H                   | 24C defines territory, environmental signs, awakening constraints, route impact, and world-state effects.         |
| Which structures and wonders appear                                                         | 24I                   | 24C defines placement compatibility, adaptation requirements, access, environmental risks, and route connections. |
| Which resources and loot are assigned                                                       | 24J                   | 24C defines source conditions, renewability, extraction risks, biome roles, and scarcity envelopes.               |
| How history, events, and world-state narratives develop                                     | 24K                   | 24C defines environmental causes, evidence, disaster possibilities, and transformation states.                    |
| How IDs, registries, dependencies, and production budgets are managed                       | 24L                   | 24C supplies field requirements, category tags, validation rules, and content-count targets.                      |

Boundary rule: 24C may name provisional example content to make environmental contracts concrete, but later Atlas documents own final rosters and narrative canon.

# 4. Layered Overworld Topology

The Overworld is generated as interdependent vertical and horizontal layers. These layers are not separate maps. They share coordinates, seed ancestry, geology, hydrology, history, ownership, magical fields, and persistent state.

| **Layer**           | **Typical Contents**                                                                             | **Primary Connections**                                                                   |
|---------------------|--------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------|
| Upper Sky           | High cloud fields, storm crowns, rare floating masses, upper wind routes, atmospheric anomalies. | Aetheric weather, sky bosses, airship routes, portal phenomena, high-altitude resources.  |
| Lower Sky           | Cloud seas, floating islands, wind corridors, aerial settlements, suspended ruins.               | Surface visibility, mountain peaks, launch sites, migration, weather, trade.              |
| Surface Land        | Natural biomes and regions defined by 24B.                                                       | Coasts, river mouths, cave entrances, mountains, sky anchors, special overlays.           |
| Littoral Interface  | Beaches, cliffs, tidal zones, marshes, mangroves, reefs, estuaries, sea caves.                   | Land climate, ocean basin, tides, settlement, ports, erosion.                             |
| Shallow Ocean       | Shelves, seagrass, kelp, reefs, sand banks, islands, coastal ruins.                              | Sunlight, nutrient flow, fishing, navigation, early diving, storms.                       |
| Open Ocean          | Pelagic water, gyres, currents, deep crossings, mobile encounters, isolated structures.          | Trade routes, migrations, weather, naval threats, island chains.                          |
| Deep Ocean          | Slopes, abyssal plains, trenches, vents, submerged mountains, rifts.                             | Pressure progression, deep ecology, dimensional leaks, rare resources, ancient sites.     |
| Shallow Underground | Caves, mines, karst, root networks, aquifers, ruins, settlements.                                | Surface entrances, groundwater, resource veins, local dungeons.                           |
| Middle Depths       | Large caverns, fungal forests, crystal provinces, underground rivers and cities.                 | Regional routes, deep trade, major dungeons, industrial extraction.                       |
| Deep Strata         | Deepstone, magma, machine layers, ancient vaults, abyssal fractures.                             | Geothermal power, mythic materials, world history, realm boundaries, titans.              |
| Special-State Field | Leylines, corruption, blessing, dream, gravity, time, ancient influence, realm leaks.            | Can overlay several physical layers and create transformed variants or dedicated regions. |

## 4.1 Coordinate and Seed Relationship

1.  Generate world-scale plates, ocean basins, mountain chains, mantle hotspots, climate fields, and major magical fields from the root world seed.

2.  Derive continental and regional seeds, then generate coastlines, island chains, watersheds, cave provinces, skyland provinces, and special-state candidates.

3.  Resolve adjacency and connection constraints before placing detailed biome mosaics, structures, settlements, dungeons, and encounter content.

4.  Record every generated relationship with stable IDs so later simulation and save migrations refer to persistent world entities rather than regenerated guesses.

# 5. Ocean Basin, Sea, Coast, and Island Assembly

Marine generation begins at the same world scale as continental generation. Ocean basins have tectonic, volcanic, climatic, hydrological, magical, and historical identities. A coastline is the meeting of a land region and a marine region, not a standalone strip selected from a random list.

| **Assembly Stage** | **Generated Result**                                                                                 | **Key Constraints**                                                              |
|--------------------|------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------|
| Basin Skeleton     | Major oceans, inland seas, marginal seas, ridges, trenches, shelves, and deep plains.                | World size, plate layout, water level, geology, climate, and realm preset.       |
| Sea Regions        | Named marine macro-regions with currents, temperature, salinity, storm regime, ecology, and history. | Must connect to neighbouring basins and continental climates.                    |
| Shelf and Slope    | Continental shelf width, banks, canyons, drop-offs, seamounts, and trenches.                         | Controls shallow biome space, fishing, reefs, deep access, and naval risk.       |
| Coast Segments     | Cliffs, beaches, deltas, marshes, mangroves, fjords, ice shelves, volcanic shores.                   | Landform, wave exposure, sediment, river input, temperature, and sea level.      |
| Island Provinces   | Arcs, archipelagos, isolated islands, barrier chains, atolls, continental fragments.                 | Plate edge, hotspot, shelf, reef growth, glaciation, river deposition, or magic. |
| Marine Routes      | Currents, seasonal passages, safe coasts, island hops, deep crossings, storm belts.                  | Support trade, migration, exploration, and procedural civilisations.             |
| History Layer      | Drowned coasts, old ports, wreck fields, submerged cities, naval borders, sacred seas.               | Derived from procedural history and sea-level/catastrophe events.                |

# 6. Marine Climate, Currents, Tides, Salinity, and Water States

| **Marine Field**     | **Gameplay Meaning**                                                                             | **Generation and Simulation Rule**                                                             |
|----------------------|--------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------|
| Temperature          | Controls ice, reefs, species, storms, diving exposure, and settlement technology.                | Derived from latitude, current, depth, season, volcanism, and magic.                           |
| Salinity             | Separates open ocean, brackish estuary, hypersaline basin, freshwater lens, and magical water.   | Affects ecology, resources, corrosion, farming, alchemy, and purification.                     |
| Currents             | Create travel lanes, nutrient zones, migration routes, drifting hazards, and climate influence.  | World-scale currents are deterministic; local eddies and seasonal shifts are bounded variants. |
| Tides                | Expose and flood shore content, alter caves, change harvesting windows, and affect ports.        | Use readable regional ranges rather than full fluid simulation everywhere.                     |
| Wave Exposure        | Distinguishes sheltered lagoons from storm coasts and shapes erosion, structures, and traversal. | Calculated from fetch, prevailing wind, coast orientation, barriers, and storms.               |
| Turbidity            | Changes visibility, plant growth, ambush risk, navigation, and resource clues.                   | Driven by sediment, storms, river input, plankton, corruption, and industry.                   |
| Oxygen and Nutrients | Support reefs, fisheries, dead zones, vents, and creature density.                               | Abstract regional values with local presentation and event-driven change.                      |
| Pressure             | Gates deep traversal, construction, creatures, vehicles, and salvage.                            | Depth-band thresholds are explicit, inspectable, and mitigated by gear or infrastructure.      |
| Magical Charge       | Allows mana tides, spirit currents, void contamination, dream waters, or blessed springs.        | Uses special-state overlays with source, intensity, spread, and stabilisation rules.           |

## 6.1 Water-State Tags

| **Tag Family** | **Examples**                                                             | **System Use**                                            |
|----------------|--------------------------------------------------------------------------|-----------------------------------------------------------|
| Thermal        | frozen, frigid, cold, temperate, warm, hot, scalding                     | Survival, ecology, materials, VFX, structures.            |
| Chemical       | fresh, brackish, saline, hypersaline, acidic, alkaline, mineral-rich     | Farming, corrosion, alchemy, purification, species.       |
| Clarity        | clear, silty, tannin-dark, plankton-rich, ash-clouded, corrupted         | Visibility, sonar, ambush, harvesting, presentation.      |
| Motion         | still, tidal, current, turbulent, whirlpool, surge, undertow             | Navigation, power, hazards, drifting items, AI.           |
| Magical        | mana-charged, spirit-bound, dream-reflective, void-thin, blessed, cursed | Magic, creatures, rituals, dimension links, world events. |

# 7. Coastal Morphology, Littoral Interfaces, and Shoreline Change

Coasts are generated as interfaces between a specific land region and a specific sea region. They inherit both identities and add wave, tide, sediment, river, vegetation, settlement, and historical layers.

| **Coast Driver**               | **Likely Forms**                                                         | **Gameplay Effects**                                                             |
|--------------------------------|--------------------------------------------------------------------------|----------------------------------------------------------------------------------|
| Hard Rock and High Relief      | Sea cliffs, stacks, arches, wave-cut platforms, narrow coves.            | Difficult ports, seabird colonies, sea caves, climbing, exposed ruins.           |
| Loose Sediment and Low Relief  | Beaches, dunes, spits, barrier islands, lagoons.                         | Accessible landings, shifting routes, farming behind dunes, storm vulnerability. |
| Major River Input              | Deltas, mudflats, estuaries, distributaries, marsh islands.              | Fertile settlement, trade hubs, flooding, silt, brackish ecology.                |
| Glaciation                     | Fjords, skerries, U-shaped valleys, ice shelves, deep nearshore water.   | Protected harbours, steep routes, cold resources, avalanche and ice hazards.     |
| Volcanism                      | Black-sand beaches, lava cliffs, caldera bays, new islands, vents.       | Geothermal power, unstable terrain, rare minerals, sudden land growth.           |
| Reef Growth                    | Atolls, reef shelves, lagoons, coral cays, living barriers.              | Navigation hazards, rich ecology, living resources, storm protection.            |
| Magical or Catastrophic Change | Floating shore fragments, glass beaches, drowned forests, void-cut bays. | Special traversal, rare resources, altered ecology, story evidence.              |

## 7.1 Shoreline Persistence Rules

- Daily tides and ordinary waves change presentation and local accessibility without rewriting large terrain volumes.

- Storm erosion, deposition, landslides, volcanic growth, glacial retreat, magical events, and player engineering can create persistent shoreline deltas.

- Player ports, sea walls, dredging, canals, drainage, and land reclamation require project-scale actions, resources, maintenance, permissions, and ecological consequences.

- Unique ruins, settlements, dungeons, and portal anchors use protection, relocation, collapse, or state-transition rules rather than accidental deletion by ordinary erosion.

# 8. Island Chains, Archipelagos, and Isolated Landmasses

| **Island Origin**         | **Generation Identity**                                                            | **Typical Content Direction**                                          |
|---------------------------|------------------------------------------------------------------------------------|------------------------------------------------------------------------|
| Continental Fragment      | Old rock, diverse geology, broad soil, endemic species, large settlement capacity. | Regional civilisations, ruins, mines, forests, interior dungeons.      |
| Volcanic Hotspot Chain    | Age progression along chain, young volcanic peaks, older eroded islands, vents.    | Geothermal industry, ash soils, calderas, fire creatures, forge sites. |
| Subduction Arc            | Mountainous island crescent, earthquakes, volcanoes, deep trenches.                | Fortified ports, storm routes, rare metals, sea and mountain bosses.   |
| Coral Atoll               | Low ring islands around lagoon, porous freshwater, living reef foundation.         | Fishing cultures, reef dungeons, storm risk, fragile resources.        |
| Barrier Island Chain      | Low mobile sand islands parallel to coast.                                         | Navigation, marshes, seasonal settlements, storm breaches.             |
| River or Delta Island     | Sediment-built, flood-prone, fertile, channel-linked.                              | Trade towns, farms, bridges, flood events, contested control.          |
| Glacial Skerries          | Rocky island field carved by ice.                                                  | Cold routes, hidden coves, wrecks, sea caves, isolated communities.    |
| Uplifted Plateau Island   | High cliffs and flat interior, old marine terraces.                                | Difficult access, endemic ecology, sky links, cliff settlements.       |
| Magical Emergence         | Raised, transported, grown, crystallised, dreamed, or realm-leaked land.           | Special biomes, unstable resources, ritual sites, unique dungeons.     |
| Artificial or Constructed | World-engine platform, ancient breakwater, colossal remains, city-island.          | Machine ecology, strategic infrastructure, salvage, faction conflict.  |

## 8.1 Island Uniqueness and Repetition Control

Small islands may use repeated geological families, but named islands and archipelagos combine origin, age, climate, elevation, ecology, history, ownership, structure density, hazard, and special-state modifiers. Large worlds must avoid repeating the same silhouette, settlement role, dungeon family, and resource package across neighbouring island chains.

# 9. Marine Depth Bands and Traversal Progression

| **Depth Band**     | **Environmental Identity**                                              | **Default Access and Progression**                                                 |
|--------------------|-------------------------------------------------------------------------|------------------------------------------------------------------------------------|
| Intertidal         | Alternately exposed and submerged; waves, pools, mud, reefs, caves.     | Early access with timing, footwear, light, and weather awareness.                  |
| Shallows           | Sunlit shelf water, seagrass, kelp edge, reefs, sand bars.              | Swimming, simple boats, breath management, basic diving, shore infrastructure.     |
| Shelf Depths       | Reduced light, stronger currents, shelf reefs, wrecks, canyons.         | Diving gear, water magic, mounts, submersibles, air pockets, or allied adaptation. |
| Slope and Twilight | Steep terrain, low light, pressure, migrating creatures.                | Advanced pressure protection, navigation, lighting, supply planning.               |
| Abyssal Plain      | Dark, cold, high pressure, sparse but specialised ecology.              | Late-game expedition infrastructure, vehicles, portals, or specialised cultures.   |
| Trench and Hadal   | Extreme pressure, tectonic instability, vents, realm-thin zones.        | High-risk endgame content; not required for ordinary progression.                  |
| Submerged Cavern   | Flooded cave systems linked to coasts, aquifers, ruins, or deep strata. | Access varies from early sea caves to late deep-world labyrinths.                  |

| **Accessibility Rule**                                                                                                                                                                                                                                                   |
|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| No ancestry or playstyle is permanently excluded from marine content. Natural adaptations may provide advantages, but equipment, magic, vehicles, infrastructure, companions, settlement services, and alternate routes must provide equivalent access over progression. |

# 10. Coastal and Marine Biome Family Architecture

| **Family**         | **Core Variables**                                                              | **Required Connections**                                                      |
|--------------------|---------------------------------------------------------------------------------|-------------------------------------------------------------------------------|
| Coastal Interface  | Substrate, slope, tide range, wave exposure, sediment, vegetation, river input. | Land biome, sea region, settlements, ports, caves, storms, erosion.           |
| Shallow Marine     | Light, temperature, salinity, substrate, nutrients, current, shelter.           | Fisheries, early diving, reefs, kelp, wrecks, coastal cultures.               |
| Pelagic            | Current, temperature, productivity, storm regime, distance from land.           | Routes, migration, ships, mobile encounters, weather, islands.                |
| Deep Marine        | Depth, pressure, slope, vent activity, oxygen, sediment, rift influence.        | Rare ecology, deep structures, dungeons, resources, bosses.                   |
| Island Surface     | Origin, age, relief, climate, soil, isolation, freshwater, history.             | Surface biome mosaics, ports, endemic ecology, civilisations, sky/sea routes. |
| Transformed Marine | Corruption, mana, dream, void, ancient machinery, catastrophe, blessing.        | Source, intensity, spread, counterplay, transformed ecology and loot.         |

# 11. Rocky Coasts, Cliffs, Shingle Shores, and Sea Caves

| **ID**                         | **Biome**            | **Identity**                                                                                | **Content Hooks**                                              |
|--------------------------------|----------------------|---------------------------------------------------------------------------------------------|----------------------------------------------------------------|
| coast.rocky.wave_cut_cliff     | Wave-Cut Cliffs      | Hard exposed coast with narrow shelves, arches, stacks, nesting ledges, and dangerous surf. | Sea caves; cliff ruins; seabird colonies; climbing routes.     |
| coast.rocky.sheltered_cove     | Sheltered Stone Cove | Protected inlet behind headlands with calmer water and natural landing sites.               | Fishing hamlets; smuggler sites; small ports; wreck salvage.   |
| coast.rocky.shingle_shore      | Shingle Shore        | Rounded stone beach shaped by strong waves and storm berms.                                 | Stone resources; temporary camps; drift goods; storm events.   |
| coast.rocky.basalt_columns     | Basalt Column Coast  | Geometric volcanic cliffs, tidal channels, black stone, and echoing caverns.                | Rare building stone; elemental nests; ritual acoustics.        |
| coast.rocky.fjord              | Fjord Coast          | Deep glacial inlet with steep walls, waterfalls, cold water, and long sheltered route.      | Ports; cliff settlements; deep nearshore dungeons; avalanches. |
| coast.rocky.skerry_field       | Skerry Field         | Dense low rocky islands and channels difficult to navigate in poor weather.                 | Hidden routes; wrecks; raider coves; seabird resources.        |
| coast.rocky.sea_cave_labyrinth | Sea-Cave Labyrinth   | Tidal cave network entering cliffs and linking to shallow underground systems.              | Micro-dungeons; smugglers; tide puzzles; coastal creatures.    |

# 12. Sandy Coasts, Dunes, Barrier Islands, and Lagoons

| **ID**                    | **Biome**        | **Identity**                                                                            | **Content Hooks**                                                |
|---------------------------|------------------|-----------------------------------------------------------------------------------------|------------------------------------------------------------------|
| coast.sand.open_beach     | Open Sand Beach  | Broad exposed beach with dunes, wrack line, nesting grounds, and surf channels.         | Early landing; salvage; storms; dune farming behind coast.       |
| coast.sand.dune_sea       | Coastal Dune Sea | Mobile dunes driven inland by prevailing wind, with buried ruins and sparse vegetation. | Shifting routes; glass resources; buried structures; wind power. |
| coast.sand.barrier_island | Barrier Island   | Long narrow island sheltering a lagoon or marsh from open waves.                        | Seasonal settlements; breaches; ferry routes; storm defence.     |
| coast.sand.lagoon         | Coastal Lagoon   | Shallow sheltered water separated from ocean by bars, reef, or island.                  | Aquaculture; ports; nurseries; brackish resources.               |
| coast.sand.shell_bank     | Shell Bank       | Pale beach and shallow bar built from shells and biological fragments.                  | Lime; pigments; nesting; fragile harvesting limits.              |
| coast.sand.black_beach    | Black-Sand Beach | Volcanic mineral sand beneath young cliffs or lava fields.                              | Heavy minerals; geothermal clues; fire-water ecology.            |
| coast.sand.glass_shore    | Glass Shore      | Catastrophe- or magic-fused beach of glassy grains and sharp formations.                | Rare catalysts; heat history; hazards; ancient evidence.         |

# 13. Salt Marshes, Mangroves, Mudflats, Estuaries, and Deltas

| **ID**                     | **Biome**              | **Identity**                                                                           | **Content Hooks**                                                  |
|----------------------------|------------------------|----------------------------------------------------------------------------------------|--------------------------------------------------------------------|
| coast.wet.salt_marsh       | Salt Marsh             | Tidal grassland crossed by creeks, flooded on high tides, rich in birds and shellfish. | Fisheries; salt plants; flood routes; raised settlements.          |
| coast.wet.mangrove         | Mangrove Labyrinth     | Warm tidal forest with tangled roots, dark channels, nurseries, and difficult ground.  | Boat routes; medicines; ambush ecology; root structures.           |
| coast.wet.mudflat          | Tidal Mudflat          | Wide exposed sediment flat changing rapidly with tide and weather.                     | Shell gathering; sinking hazard; hidden channels; migratory fauna. |
| coast.wet.estuary          | Broad Estuary          | River-sea mixing zone with brackish channels, islands, ports, and nutrient-rich water. | Trade cities; fisheries; navigation; pollution consequences.       |
| coast.wet.delta            | Distributary Delta     | River splits across fertile lowlands into channels, marshes, and sediment islands.     | Dense settlement; farming; floods; contested routes.               |
| coast.wet.tannin_swamp     | Tannin Coast Swamp     | Dark organic water where forest wetland meets tidal sea.                               | Alchemy; hidden ruins; disease risk; spirit ecology.               |
| coast.wet.hypersaline_flat | Hypersaline Tidal Flat | Evaporative coastal basin with salt crusts, brine pools, and specialised life.         | Salt industry; rare microbes; corrosion; heat exposure.            |

# 14. Shallow Seas, Seagrass Meadows, Kelp Forests, and Shelf Waters

| **ID**                      | **Biome**              | **Identity**                                                                                       | **Content Hooks**                                                  |
|-----------------------------|------------------------|----------------------------------------------------------------------------------------------------|--------------------------------------------------------------------|
| sea.shallow.sand_shelf      | Sunlit Sand Shelf      | Clear shallow seafloor with ripples, burrowing life, scattered rock, and strong storm change.      | Early diving; shell resources; wrecks; nursery creatures.          |
| sea.shallow.seagrass        | Seagrass Meadow        | Dense submerged grass supporting juvenile creatures, grazing, sediment stability, and clear water. | Food web; aquaculture; gentle mounts; restoration projects.        |
| sea.shallow.kelp_forest     | Kelp Forest            | Tall cold-water kelp canopy with vertical habitat, currents, and low-light floor.                  | Fibres; food; predators; hidden structures; underwater routes.     |
| sea.shallow.rocky_reef      | Rocky Reef             | Rugged shelf outcrops covered in algae, shell life, crevices, and wave energy.                     | Fishing; mineral clues; lairs; navigation hazard.                  |
| sea.shallow.shell_bed       | Shell Bed              | Dense mollusc reef or shell plain filtering water and building habitat.                            | Food; lime; pearls; fragile renewable resource.                    |
| sea.shallow.freshwater_lens | Island Freshwater Lens | Subsurface and nearshore fresh water held inside porous island sediments.                          | Settlement viability; wells; contamination risk; exploration clue. |
| sea.shallow.mana_tide_pool  | Mana Tide Pools        | Shallow pools periodically charged by leyline tides or realm resonance.                            | Runes; magical ecology; ritual timing; ward materials.             |

# 15. Coral Reefs, Atolls, Warm Shoals, and Living Ridges

| **ID**                | **Biome**               | **Identity**                                                                            | **Content Hooks**                                                 |
|-----------------------|-------------------------|-----------------------------------------------------------------------------------------|-------------------------------------------------------------------|
| sea.reef.fringing     | Fringing Reef           | Reef directly bordering island or coast, creating shallow channels and wave protection. | Fishing; coral resources; reef passages; settlement defence.      |
| sea.reef.barrier      | Barrier Reef            | Large offshore living wall separated from land by lagoon.                               | Navigation gates; lagoon culture; reef dungeons; storm shelter.   |
| sea.reef.atoll        | Atoll Ring              | Low coral islands and reef encircle deep lagoon above old volcano.                      | Isolated settlement; freshwater limits; deep central mystery.     |
| sea.reef.patch        | Patch Reef Field        | Mosaic of small reef towers and sand channels across warm shelf.                        | Exploration maze; treasure; nurseries; boat hazards.              |
| sea.reef.coldwater    | Cold-Water Coral Garden | Deep dim reef formed without sunlight on slope and shelf edge.                          | Advanced diving; rare reagents; fragile ecology.                  |
| sea.reef.living_ridge | Living Reef Ridge       | Massive magical or ancient reef structure that grows architecture-like forms.           | Living dungeon; symbiotic settlement; realm leak; boss territory. |
| sea.reef.bleached     | Bleached Reef           | Stressed or dead reef caused by heat, pollution, curse, disease, or mana imbalance.     | Restoration arc; scavengers; exposed ruins; ecological warning.   |

# 16. Open Ocean, Pelagic Routes, Gyres, and Storm Seas

| **ID**                      | **Biome**          | **Identity**                                                                                       | **Content Hooks**                                             |
|-----------------------------|--------------------|----------------------------------------------------------------------------------------------------|---------------------------------------------------------------|
| sea.open.bluewater          | Bluewater Expanse  | Deep clear open sea with long sight lines, sparse landmarks, migrating life, and route dependence. | Navigation; caravans; mobile encounters; weather planning.    |
| sea.open.productive_current | Productive Current | Cool nutrient-rich current supporting dense fish, predators, and seasonal fleets.                  | Migration; fishing economy; boss following; trade routes.     |
| sea.open.subtropical_gyre   | Subtropical Gyre   | Warm rotating basin with calm zones, drifting debris, sparse nutrients, and strange accumulation.  | Salvage; doldrums; floating structures; waste consequences.   |
| sea.open.storm_belt         | Storm Belt         | Persistent or seasonal high-energy sea with towering waves, lightning, and route closures.         | Storm power; air-sea threats; ship upgrades; rare events.     |
| sea.open.fog_sea            | Fog Sea            | Cool current boundary or magical region with persistent low visibility and muted sound.            | Navigation puzzles; ghost ships; hidden islands; ambush.      |
| sea.open.sargassum          | Driftweed Sea      | Floating weed mats and debris islands creating shelter, life, and navigation friction.             | Harvesting; floating camps; nursery ecology; fire risk.       |
| sea.open.mana_current       | Mana Current       | Visible or instrument-detectable magical flow crossing the sea and connecting leyline nodes.       | Faster magic travel; ritual sites; mana storms; portal clues. |

# 17. Deep Ocean, Abyssal Plains, Trenches, Vents, and Hadal Zones

| **ID**                     | **Biome**               | **Identity**                                                                             | **Content Hooks**                                                 |
|----------------------------|-------------------------|------------------------------------------------------------------------------------------|-------------------------------------------------------------------|
| sea.deep.twilight_slope    | Twilight Slope          | Continental slope where light fades, canyons cut downward, and migrating creatures pass. | Transition progression; wrecks; slope settlements; predators.     |
| sea.deep.abyssal_plain     | Abyssal Plain           | Cold dark sediment plain with sparse specialised ecology and isolated hard structures.   | Long expeditions; rare nodules; ancient sites; stealth threats.   |
| sea.deep.seamount          | Seamount Province       | Submerged volcanic mountains rising through depth bands and concentrating life.          | Vertical exploration; currents; ruins; lairs; resource zoning.    |
| sea.deep.hydrothermal_vent | Hydrothermal Vent Field | Mineral-rich hot vents supporting chemosynthetic ecology in darkness.                    | Geothermal extraction; rare compounds; heat and toxicity.         |
| sea.deep.cold_seep         | Cold Seep Basin         | Chemical-rich seafloor leaks supporting unusual organisms and mineral crusts.            | Alchemy resources; slow ecology; ancient fuel clues.              |
| sea.deep.trench            | Ocean Trench            | Long narrow tectonic depression with extreme pressure, quakes, and isolated ecosystems.  | Endgame route; realm-thin zones; titans; deep dungeons.           |
| sea.deep.void_fissure      | Void-Fissure Hadal Zone | Spatially unstable trench or rift where water, gravity, and distance behave incorrectly. | Voidstone; portal risk; multi-realm threat; containment projects. |

# 18. Polar Coasts, Sea Ice, Ice Shelves, and Glacial Seas

| **ID**                    | **Biome**           | **Identity**                                                                          | **Content Hooks**                                              |
|---------------------------|---------------------|---------------------------------------------------------------------------------------|----------------------------------------------------------------|
| sea.polar.seasonal_ice    | Seasonal Sea Ice    | Freezes and breaks annually, opening migration routes and temporary travel corridors. | Seasonal access; hunting; ice hazards; climate clues.          |
| sea.polar.pack_ice        | Pack-Ice Maze       | Mobile broken ice compressed by wind and currents into shifting channels.             | Navigation; crush hazard; camps; predators; rescue events.     |
| sea.polar.ice_shelf       | Ice Shelf Edge      | Floating glacial platform over ocean, riddled with crevasses and under-ice caverns.   | Hidden caves; research outposts; collapse events; deep access. |
| sea.polar.polynya         | Open-Water Polynya  | Persistent open water surrounded by ice due to current, wind, or geothermal heat.     | Ecology hotspot; settlement anchor; resource concentration.    |
| sea.polar.glacial_fjord   | Glacial Fjord       | Cold deep inlet receiving glacier flow, icebergs, sediment, and meltwater.            | Ports; glacier dungeons; floods; ice resources.                |
| sea.polar.blue_ice_cavern | Blue-Ice Sea Cavern | Coastal or under-shelf ice cave with luminous layers and trapped history.             | Ancient remains; cryogenic resources; collapse puzzles.        |

# 19. Marine Settlements, Routes, Structures, Dungeons, and Boss Territories

| **Content Family**    | **Environmental Contract**                                                                                       | **Examples of Valid Placement Logic**                                     |
|-----------------------|------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------|
| Coastal Settlement    | Fresh water, landing or harbour access, food web, buildable ground, storm strategy, route connection.            | Cove port, delta city, cliff harbour, mangrove stilt village, fjord hold. |
| Island Settlement     | Freshwater budget, soil or imported food, harbour, route purpose, defence, disaster resilience.                  | Atoll community, volcanic forge town, monastery isle, naval fortress.     |
| Underwater Settlement | Pressure band, breathable habitat, food and energy, material adaptation, access route, emergency state.          | Reef enclave, shelf dome, trench outpost, flooded ancestral city.         |
| Marine Route          | Current, wind, seasonal weather, safe stops, navigation landmarks, patrol and threat envelope.                   | Coastal lane, island-hopping route, deep crossing, mana current.          |
| Wreck or Ruin         | Historical route, storm, battle, sea-level change, collapse, or realm event explains origin.                     | Wreck field, drowned port, collapsed lighthouse, submerged temple.        |
| Marine Dungeon        | Entrance remains discoverable; layout responds to water, pressure, tide, current, ecology, and structure origin. | Tidal caves, reef hive, drowned archive, trench vault.                    |
| Marine Boss Territory | Environmental signs, prey changes, wrecks, currents, storms, or taboo routes precede encounter.                  | Leviathan migration lane, reef guardian, trench titan, storm serpent.     |

# 20. Island Region and Island Biome Registry

| **ID**                   | **Island Archetype**       | **Identity**                                                                                    | **Atlas Connections**                                                |
|--------------------------|----------------------------|-------------------------------------------------------------------------------------------------|----------------------------------------------------------------------|
| island.continental_green | Green Continental Fragment | Large old island with mixed forests, hills, rivers, and several settlement zones.               | Regional civilisation; interior dungeon network; endemic wildlife.   |
| island.volcanic_young    | Young Volcanic Isle        | Steep active cone, lava coast, ash slopes, sparse pioneer ecology.                              | Geothermal power; rare ores; eruption events; fire boss.             |
| island.volcanic_old      | Eroded Volcanic Isle       | Older weathered volcano with fertile soils, radial valleys, reefs, and caldera lake.            | Dense farming; ruins; caldera dungeon; route hub.                    |
| island.atoll_low         | Low Atoll Chain            | Coral ring islands barely above sea level with central lagoon and limited fresh water.          | Fishing society; storm vulnerability; reef labyrinth.                |
| island.fjorded_cold      | Cold Fjord Island          | Mountainous glacial island cut by fjords and ice valleys.                                       | Cliff ports; mines; cold forests; sea caves.                         |
| island.dune_barrier      | Dune Barrier Chain         | Mobile sandy islands, marsh backs, channels, and seasonal breaches.                             | Migratory camps; lighthouse network; storm event content.            |
| island.mangrove_delta    | Mangrove Delta Isles       | Low river-built islands tangled by tidal forest and shifting channels.                          | Trade delta; boats; medicines; hidden ruins.                         |
| island.uplifted_table    | Uplifted Table Isle        | High plateau with sheer marine cliffs and isolated interior ecosystem.                          | Endemic creatures; sky access; difficult siege; ancient observatory. |
| island.crystal_rise      | Crystal-Rise Island        | Geological or magical uplift containing exposed crystal ridges and mana weather.                | Mage enclave; unstable extraction; crystal dungeon.                  |
| island.colossal_remain   | Colossal-Remain Island     | Land and ecology formed around the skeleton, shell, root mass, or dormant body of a titan.      | Biological resources; cults; living dungeon; awakening risk.         |
| island.machine_platform  | Ancient Machine Isle       | Artificial island or exposed world-engine platform with internal machinery and coolant systems. | Salvage; construct society; power restoration; machine boss.         |
| island.dream_drift       | Dream-Drift Isle           | Island whose coastline, weather, or interior rearranges through dream influence.                | Memory quests; unreliable maps; dream creatures; realm gate.         |

# 21. Skyland Topology, Altitude Bands, and Aerial Connectivity

Skylands are not placed as isolated decorative rocks. They belong to aerial provinces generated from mountain uplift, magical fields, gravity anomalies, ancient structures, realm influence, weather systems, and procedural history. Aerial provinces contain vertical routes and altitude bands comparable to ocean depth bands.

| **Altitude Band**    | **Identity**                                                                       | **Primary Access and Risks**                                                                |
|----------------------|------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------|
| Canopy and Ridge Air | Air directly above forests, cliffs, mountains, and tall structures.                | Climbing, gliding, mounts, towers; turbulence and terrain collision.                        |
| Lower Sky            | Cloud bases, common floating islands, wind corridors, waterfalls, aerial wildlife. | Gliders, lifts, mounts, airships, portals; storms and falling.                              |
| Middle Sky           | Large skyland provinces, cloud seas, persistent winds, aerial settlements.         | Sustained vehicles, route infrastructure, weather forecasting, oxygen support where needed. |
| High Sky             | Thin air, cold, intense radiation or mana, rare islands, storm crowns.             | Advanced equipment, magic, specialist craft; limited shelter and recovery.                  |
| Upper Anomaly        | Realm-thin atmosphere, orbit-like darkness, impossible gravity, ancient platforms. | Endgame exploration, portals, world bosses, unique materials.                               |

## 21.1 Aerial Connection Types

| **Connection**        | **Use**                                                                    | **Failure or Change State**                                                 |
|-----------------------|----------------------------------------------------------------------------|-----------------------------------------------------------------------------|
| Wind Corridor         | Predictable current supporting gliding, migration, and airship efficiency. | Seasonal reversal, storm closure, corruption, redirected by infrastructure. |
| Updraft Column        | Thermal, waterfall, magical, or volcanic lift between altitude bands.      | Weakens, shifts, overloads, or becomes dangerous during weather.            |
| Sky Bridge            | Natural arch, living root, ancient span, chain, or constructed route.      | Damage, collapse, repair, ownership, siege.                                 |
| Floating Debris Chain | Small fragments form stepping or grapple route.                            | Drift, fragmentation, gravity change, harvest depletion.                    |
| Portal or Gate        | Stable point-to-point link for high or isolated content.                   | Requires power, permission, stabilisation, or repair.                       |
| Aerial Dock Network   | Civilisation-built route with towers, beacons, moorings, fuel, and rescue. | Trade disruption, maintenance, faction control, raids.                      |

# 22. Floating Islands, Cloud Seas, Wind Corridors, and Storm Provinces

| **ID**             | **Sky Biome**          | **Identity**                                                                                     | **Content Hooks**                                                   |
|--------------------|------------------------|--------------------------------------------------------------------------------------------------|---------------------------------------------------------------------|
| sky.island.verdant | Verdant Sky Isle       | Soil-bearing floating island with forests, streams, hanging roots, and waterfalls.               | Farms; aerial ecology; settlements; root caverns.                   |
| sky.island.stone   | Bare Stone Skyland     | Rocky floating mass with thin soils, caves, mineral veins, and strong wind exposure.             | Mining; fortresses; nests; wind power.                              |
| sky.island.crystal | Crystal Buoyancy Isle  | Crystalline or mana-saturated island held aloft by magical field.                                | Mana extraction; instability; mage structures; crystal boss.        |
| sky.island.ruin    | Ruined Citadel Skyland | Floating architecture or city fragment with little natural terrain.                              | Restoration; faction control; dungeon-city; portal network.         |
| sky.cloud.sea      | Cloud Sea              | Dense persistent cloud layer hiding lower terrain and creating an apparent ocean.                | Navigation; hidden islands; weather; cloud creatures.               |
| sky.cloud.garden   | Cloud Garden           | Moist cloud bank supporting magical vegetation, floating spores, and condensed-water ecosystems. | Rare herbs; water collection; fae influence; gentle hazards.        |
| sky.wind.corridor  | Great Windway          | Stable high-speed air current connecting distant provinces.                                      | Trade; migration; racing; route control; wind machines.             |
| sky.wind.doldrum   | Aerial Doldrum         | Low-wind pocket where craft stall and floating debris accumulates.                               | Salvage; stranded structures; ambush; unusual ecology.              |
| sky.storm.crown    | Storm Crown            | Persistent electrical storm around peak, island cluster, or magical source.                      | Lightning resources; storm dungeon; route hazard; boss territory.   |
| sky.gravity.scar   | Gravity-Scar Field     | Broken vectors, drifting rock, inverted waterfalls, and unpredictable movement.                  | Spatial puzzles; rare ore; construct ruins; realm leak.             |
| sky.ice.halo       | High Ice Halo          | Cold high-altitude ring of ice fragments, snow clouds, and frozen ruins.                         | Ice resources; thin air; hidden archives; sky predators.            |
| sky.ash.plume      | Volcanic Ash Sky       | Aerial region above eruptions with ash clouds, embers, toxic air, and lightning.                 | Fire-air ecology; airship filtration; ash harvest; disaster events. |

# 23. Aerial Ecology, Resources, Settlements, Dungeons, and Boss Territories

| **System**  | **Aerial Requirement**                                                                                                                          | **Design Outcome**                                                                    |
|-------------|-------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------|
| Ecology     | Include gliders, flyers, ballooning organisms, cliff nesters, cloud feeders, scavengers, and predators across altitude bands.                   | Aerial food webs, migration, and breeding sites replace random sky spawns.            |
| Resources   | Distinguish renewable atmospheric resources, island materials, storm energy, aerial plants, creature products, and rare high-altitude deposits. | Sky exploration supports industry, magic, medicine, transport, and trade.             |
| Settlements | Require stable ground or platform, water, food, shelter, route, rescue, waste, and defence.                                                     | Sky settlements feel viable and culturally adapted.                                   |
| Automation  | Use wind, waterfall, lightning, mana flow, aerial logistics, docking, lifts, and fall-safe storage.                                             | Aerial industry has advantages and constraints rather than copying surface factories. |
| Dungeons    | Use vertical exposure, moving platforms, wind, weather, altitude, fragmented rooms, and route restoration.                                      | Sky dungeons change navigation and preparation.                                       |
| Bosses      | Use weather signs, migration disruption, falling debris, route closure, or island instability.                                                  | Boss presence affects the province before the encounter.                              |

# 24. Underground Spatial Hierarchy and Geological Provinces

The underground is generated from geology, water, roots, volcanism, tectonics, resources, ancient construction, and magical fields. It is divided into connected provinces and route hierarchies rather than one uniform cave noise volume.

| **Underground Scale** | **Contents**                                                                                                    | **Persistence and Simulation**                                            |
|-----------------------|-----------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------|
| Local Feature         | Small cave, burrow, cellar, sinkhole, mine face, sea cave, lava tube.                                           | Detailed only near players; tied to regional province and surface anchor. |
| Cave System           | Connected rooms and passages with one or more entrances and ecological identity.                                | Stable topology; local resource and creature state.                       |
| Cave Province         | Large geological area containing several cave systems, routes, water, resources, structures, and biome mosaics. | Named region-level record; abstract simulation when distant.              |
| Deep Route            | Major tunnel, river, fault, mine, road, rail, rootway, or ancient conduit connecting provinces.                 | Persistent strategic infrastructure and navigation spine.                 |
| Subterranean Region   | Large deep-world territory with settlements, major caverns, dungeons, and distinct geology or magic.            | Regional ownership, economy, history, hazards, and events.                |
| Abyssal Boundary      | Mantle fracture, void rift, impossible depth, realm boundary, or world-engine interface.                        | Rare endgame site with special safety and generation rules.               |

# 25. Cave Connectivity, Entrances, Vertical Shafts, and Subterranean Routes

| **Route Type**         | **World Function**                                                        | **Validation Rule**                                                                               |
|------------------------|---------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------|
| Natural Entrance       | Cave mouth, sinkhole, fissure, waterfall cave, sea cave, ice cave.        | Major cave province needs multiple discoverable access possibilities unless intentionally sealed. |
| Vertical Shaft         | Pit, chimney, root gap, collapsed well, mine shaft, vent.                 | Provide warning, recoverability, alternate path, or deliberate high-risk classification.          |
| Horizontal Passage     | Tube, bedding plane, fault tunnel, ancient road, mine gallery.            | Connects chambers and route hierarchy without endless dead-end noise.                             |
| Underground River      | Navigable or hazardous water route through provinces.                     | Must resolve source, gradient, sinks, flooding, and connection to surface or deep water.          |
| Civilisation Route     | Road, rail, aqueduct, conduit, gate, bridge, lift, or portal.             | Ownership, maintenance, damage, permissions, and historical origin are tracked.                   |
| Creature Route         | Burrow, hive tunnel, migration corridor, nesting shaft.                   | Scale and material match creature ecology; can change or spread.                                  |
| Secret or Sealed Route | Hidden door, collapsed tunnel, rune seal, pressure lock, dream threshold. | Must have clues, alternate progression, or optional status.                                       |

## 25.1 Connectivity Guarantees

- No required resource family may depend on one inaccessible cave entrance.

- Major subterranean settlements need at least two route classes or a strong historical reason for isolation.

- Deep progression must include recoverable staging areas, supply points, shortcuts, or player-buildable infrastructure.

- Flooding, collapse, faction closure, or boss occupation may alter routes, but world state must retain alternative or repairable paths where progression is affected.

# 26. Shallow Caves, Karst, Tunnels, and Surface-Linked Caverns

| **ID**                           | **Biome**          | **Identity**                                                                        | **Content Hooks**                                        |
|----------------------------------|--------------------|-------------------------------------------------------------------------------------|----------------------------------------------------------|
| underground.shallow.rock_shelter | Rock Shelter       | Wide shallow overhang or cave beneath cliff with daylight and surface ecology.      | Early shelter; archaeology; small lair; weather refuge.  |
| underground.shallow.limestone    | Limestone Cave     | Dissolved passages, chambers, stalactites, streams, and sinkholes.                  | Karst resources; hidden routes; flooded sections; ruins. |
| underground.shallow.lava_tube    | Lava Tube          | Smooth volcanic tunnel with skylights, collapsed roofs, and heat remnants.          | Fast route; geothermal clues; fire creatures; obsidian.  |
| underground.shallow.sandstone    | Sandstone Caverns  | Layered eroded chambers, fragile pillars, dry pockets, and buried channels.         | Collapse risk; tombs; salt; desert access.               |
| underground.shallow.root_cave    | Rootbound Cavern   | Cave dominated by giant roots, soil pockets, insects, and surface forest influence. | Wood resources; living bridges; nature magic; burrows.   |
| underground.shallow.glacial      | Glacial Cave       | Ice tunnel beneath glacier or snowfield with meltwater and moving walls.            | Seasonal topology; ancient remains; cold hazards.        |
| underground.shallow.minework     | Abandoned Minework | Civilisation-cut tunnels intersecting natural caves and ore zones.                  | History; salvage; collapse; faction reuse; mine dungeon. |
| underground.shallow.sea_cave     | Tidal Sea Cave     | Coastal cave alternately flooded, wave-cut, and linked to underground passages.     | Tide puzzles; wrecks; smuggling; marine predators.       |

# 27. Fungal, Root, Crystal, Mana, Ice, Salt, and Mineral Caverns

| **ID**                       | **Biome**              | **Identity**                                                                              | **Content Hooks**                                               |
|------------------------------|------------------------|-------------------------------------------------------------------------------------------|-----------------------------------------------------------------|
| underground.cavern.fungal    | Fungal Forest Cavern   | Large humid cavern with giant fungi, spores, decomposers, and luminous ecology.           | Food and medicine; spore hazards; settlements; fungal boss.     |
| underground.cavern.rootworld | Worldroot Galleries    | Deep living root network carrying water, mana, organisms, and memories.                   | Nature routes; living structures; spirit ecology; realm hints.  |
| underground.cavern.crystal   | Crystal Cathedral      | Large mineral chamber with crystal columns, reflections, resonance, and purity gradients. | Mana and gems; sound puzzles; unstable extraction; mage sites.  |
| underground.cavern.mana      | Mana Saturation Cavern | Rock, water, flora, and creatures strongly altered by local mana source.                  | Runes; mutations; magical weather underground; ward need.       |
| underground.cavern.ice       | Deep Ice Cavern        | Ancient buried ice with trapped gases, organisms, ruins, and blue light.                  | Preserved history; cold resources; collapse; awakening threats. |
| underground.cavern.salt      | Salt Cathedral         | Dry or brine-filled cavern with massive salt crystals and carved chambers.                | Food preservation; alchemy; corrosion; ancient storage.         |
| underground.cavern.geode     | Titan Geode            | Enormous geode chamber lined with crystals and internal pools.                            | Rare minerals; unique dungeon shell; resonance boss.            |
| underground.cavern.metallic  | Metallic Vein Maze     | Dense folded ore body forming conductive walls, magnetic anomalies, and narrow passages.  | Strategic mining; machine effects; faction conflict.            |

# 28. Underground Rivers, Lakes, Seas, Aquifers, and Flooded Systems

| **ID**                         | **Biome**               | **Identity**                                                                            | **Content Hooks**                                                    |
|--------------------------------|-------------------------|-----------------------------------------------------------------------------------------|----------------------------------------------------------------------|
| underground.water.stream       | Cave Stream Network     | Fast shallow water linking chambers and carrying sediment, life, and sound.             | Navigation clue; water power; flooding; aquatic creatures.           |
| underground.water.river        | Great Underground River | Navigable regional route through caverns, settlements, and deep passages.               | Trade; boats; ports; dams; river boss.                               |
| underground.water.lake         | Subterranean Lake       | Large still water body fed by aquifer or river, often with isolated shores and islands. | Fishing; hidden structures; diving; settlement anchor.               |
| underground.water.aquifer      | Aquifer Maze            | Water-filled pores and passages supplying wells, springs, and cave wetlands.            | Surface dependency; contamination; engineering; resource conflict.   |
| underground.water.brine        | Deep Brine Basin        | Dense saline water trapped at depth, chemically distinct and hazardous.                 | Salt and alchemy; corrosion; preserved remains; specialised ecology. |
| underground.water.sea          | Underworld Sea          | Vast enclosed deep water region with shores, islands, currents, and its own climate.    | Subterranean navigation; civilisations; sea dungeons; world boss.    |
| underground.water.flooded_ruin | Flooded Ruin Province   | Collapsed city, mine, temple, or machine complex filled by water.                       | Drainage project; salvage; underwater dungeon; historical event.     |
| underground.water.mana_spring  | Mana Spring Basin       | Groundwater rises through magical source, altering caves and feeding surface leylines.  | Magic resource; healing or corruption; ritual site; faction claim.   |

# 29. Deepstone, Magma, Forge Depths, Machine Strata, and Abyssal Fractures

| **ID**                          | **Biome**              | **Identity**                                                                                       | **Content Hooks**                                                     |
|---------------------------------|------------------------|----------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------|
| underground.deep.deepstone      | Deepstone Expanse      | Ancient dense rock under high pressure with vast fractures and sparse ecology.                     | Mythic resources; long routes; deep settlements; titans.              |
| underground.deep.magma_sea      | Magma Sea              | Regional molten body with crust rafts, vents, ash chambers, and extreme heat.                      | Forge power; rare metals; fire ecology; eruption linkage.             |
| underground.deep.forge_depths   | Natural Forge Depths   | High-temperature mineral and gas province suited to advanced smelting and elemental industry.      | Civilisation industry; forge dungeons; heat management.               |
| underground.deep.obsidian_maze  | Obsidian Fracture Maze | Sharp glassy tunnels formed by rapid cooling and tectonic breakage.                                | Cutting resources; brittle hazards; reflection puzzles.               |
| underground.deep.machine_strata | Machine Strata         | Ancient artificial layer of conduits, chambers, supports, and dormant systems embedded in geology. | World-engine lore; construct ecology; power restoration; megadungeon. |
| underground.deep.buried_city    | Buried City Region     | Large civilisation layer swallowed by collapse, ash, sediment, magic, or time.                     | Archaeology; factions; restoration; political claims.                 |
| underground.deep.abyssal_fault  | Abyssal Fault          | Seemingly bottomless tectonic or magical rift crossing several depth bands.                        | Vertical routes; void influence; boss migration; bridge projects.     |
| underground.deep.realm_boundary | Realm-Boundary Cavern  | Deep space where Overworld rules thin and another dimension presses against stone.                 | Portal resources; altered physics; dimension dungeon; containment.    |

# 30. Underground Civilisations, Infrastructure, Dungeons, and Boss Territories

| **System**          | **Required Environmental Logic**                                                                                                      | **Atlas Result**                                                  |
|---------------------|---------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------|
| Settlement Location | Air, water, food, waste, temperature, structural stability, routes, resources, defence, and light strategy.                           | Cave cities and deep outposts are believable living places.       |
| Architecture        | Uses cave volume, columns, bridges, carved rooms, built platforms, supports, drainage, ventilation, and culturally adapted materials. | Underground construction is not surface houses placed in caverns. |
| Agriculture         | Fungi, root crops, cave animals, hydroponics, trade, magical light, geothermal heat, or surface supply.                               | Food webs and settlement needs become gameplay.                   |
| Industry            | Mining, smelting, water, geothermal, machine strata, mana, transport, waste, and collapse risk.                                       | Deep industry offers power with visible consequences.             |
| Routes              | Roads, rivers, lifts, rails, tunnels, portals, shafts, bridges, and waystations.                                                      | Regional trade and exploration have legible infrastructure.       |
| Dungeons            | Origin and room grammar respond to geology, water, collapse, civilisation, creature excavation, and magical fields.                   | Subterranean dungeons vary beyond corridor caves.                 |
| Boss Territory      | Signs include tremors, prey absence, altered water, collapsed routes, heat, spores, machine activation, or faction taboo.             | Deep bosses shape provinces before combat.                        |

# 31. Special Overworld Biome and Overlay Architecture

Special content uses two related models. An overlay modifies an existing base biome while preserving most of its climate, landform, ecology, and settlement logic. A dedicated special biome replaces enough foundational rules that it requires its own terrain, ecology, resource, hazard, structure, and progression definition.

| **Model**               | **Use When**                                                                                                                            | **Example**                                                               |
|-------------------------|-----------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------|
| Light Overlay           | Presentation and several spawn/resource/state values change, but base terrain and ecology remain recognisable.                          | Blessed meadow, haunted road, weak leyline forest.                        |
| Strong Overlay          | Base biome remains identifiable, but magic, corruption, history, weather, ecology, and structures are substantially transformed.        | Blightwood, battlefield marsh, machine-overgrown desert.                  |
| Dedicated Special Biome | Terrain formation, physical laws, water, ecology, resources, settlement, and traversal change enough to require independent definition. | Gravity-scar badlands, dream shore, void waste, living crystal forest.    |
| Cross-Layer Field       | One source affects surface, underground, ocean, and sky in related ways.                                                                | Major leyline nexus, realm breach, titan corpse, world-engine activation. |

## 31.1 Required Overlay Fields

| **Field Group** | **Required Data**                                                                                          |
|-----------------|------------------------------------------------------------------------------------------------------------|
| Source          | Natural, historical, magical, dimensional, creature, faction, player, machine, divine, or unknown.         |
| Intensity       | Trace, local, regional, severe, catastrophic, world-scale.                                                 |
| Footprint       | Point, corridor, patch, watershed, biome, region, vertical column, moving front.                           |
| Spread          | None, seasonal, resource-driven, creature-carried, waterborne, route-following, event-driven.              |
| Persistence     | Temporary, cyclical, recoverable, stabilised, permanent unless major project, irreversible.                |
| Transformation  | Terrain, blocks, water, weather, light, ecology, spawns, resources, structures, NPC behaviour, magic, UI.  |
| Counterplay     | Avoidance, wards, cleansing, diplomacy, research, boss resolution, infrastructure, sacrifice, coexistence. |
| Outcome         | Restored, adapted, contained, exploited, worsened, converted, hybridised, or left unresolved.              |

# 32. Leyline, Mana-Saturated, Spirit, Dream, Gravity, Time, and Realm-Leak Regions

| **ID**                      | **Special Region**    | **Identity**                                                                                        | **Content Hooks**                                                          |
|-----------------------------|-----------------------|-----------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------|
| special.leyline.meadow      | Leyline Meadow        | Natural surface biome crossed by visible mana flow, altered plants, and ritual-compatible ground.   | Mana gathering; mage routes; storms; settlement wards.                     |
| special.leyline.nexus       | Leyline Nexus         | Intersection of several magical currents across surface and underground.                            | Major structures; portals; faction conflict; instability.                  |
| special.mana.crystal_forest | Crystal Forest        | Living or geological crystal growth forms forest-like terrain and resonant ecology.                 | Rare resources; reflections; magic creatures; extraction risk.             |
| special.spirit.grove        | Spirit Grove          | Place where memory, ancestors, or local spirits strongly overlap physical ecology.                  | Dialogue; rituals; haunting; cultural claims; noncombat outcomes.          |
| special.dream.shore         | Dream Shore           | Coast or lake edge reflecting memories and shifting between waking and dream states.                | Changing routes; dream dungeons; prophecy; false landmarks.                |
| special.gravity.badlands    | Gravity-Scar Badlands | Broken gravity produces floating debris, sideways falls, inverted water, and unstable construction. | Traversal puzzles; sky links; rare resources; spatial threats.             |
| special.time.stillwood      | Stillwood             | Forest or ruin where time moves irregularly, preserving, accelerating, or repeating local states.   | Season anomalies; ancient evidence; temporal hazards; research.            |
| special.realm.verdant_leak  | Verdant Realm Leak    | Overworld region invaded by living growth, seasonal magic, and foreign ecology.                     | Dimension clues; hybrid biome; living structures; containment or alliance. |
| special.realm.infernal_leak | Infernal Heat Leak    | Rift emits heat, ash, contracts, infernal creatures, and dangerous fuels.                           | Industry temptation; faction law; invasion; sealing project.               |
| special.realm.void_thin     | Void-Thin Zone        | Distance, light, storage, sound, and creature behaviour become unstable near void boundary.         | Void resources; navigation risk; portal content; existential threat.       |

# 33. Ancient, Haunted, Battlefield, Machine, Catastrophe, and Colossal-Remains Regions

| **ID**                        | **Special Region**   | **Identity**                                                                                | **Content Hooks**                                                 |
|-------------------------------|----------------------|---------------------------------------------------------------------------------------------|-------------------------------------------------------------------|
| special.ancient.roadland      | Ancient Roadland     | Region structured by old roads, bridges, milestones, waystations, and buried route layers.  | Trade restoration; ruins; bandit control; archaeology.            |
| special.ancient.ruinfield     | Ruinfield            | Dense remains of settlement or civilisation spread across a biome rather than one site.     | Salvage; claims; hazards; settlement rebuilding; lore.            |
| special.haunted.battlefield   | Haunted Battlefield  | Old conflict landscape with graves, weapons, spirits, altered soil, and contested memory.   | Undead; diplomacy; relics; memorial projects; false history.      |
| special.haunted.drowned       | Drowned Memory Coast | Submerged settlement and shoreline haunted by disaster or unresolved ritual.                | Tides; spirits; salvage; cleansing; restoration choices.          |
| special.machine.wilderness    | Machine Wilderness   | Ancient systems, conduits, moving structures, and construct ecology overtake natural land.  | Automation research; machine faction; power hazards; megadungeon. |
| special.catastrophe.glassland | Glassland            | Terrain fused by magical war, impact, heat, or ritual failure into glass plains and shards. | Catalysts; heat; reflection; buried history; hostile weather.     |
| special.catastrophe.sink      | Great Sink           | Regional collapse creates vast basin, exposed strata, cliffs, caves, and destroyed routes.  | Vertical world; settlement ruins; new resources; boss nest.       |
| special.colossal.bonefield    | Titan Bonefield      | Landscape built around colossal bones, armour, shell, or petrified organs.                  | Biological materials; cults; lairs; awakening or decomposition.   |
| special.colossal.rootgrave    | Worldroot Grave      | Dead or severed giant root system shapes canyons, bridges, caves, and decaying magic.       | Nature history; fungi; spirit conflict; restoration.              |
| special.impact.crater         | Starfall Crater      | Impact basin with unusual metals, radiation or mana, shocked stone, and altered ecology.    | Rare resources; research; factions; dormant object or boss.       |

# 34. Corruption, Blight, Void Scars, Blessing, Warding, Cleansing, and Restoration

| **State Family**       | **Cause and Behaviour**                                                                                    | **Player and World Responses**                                                    |
|------------------------|------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------|
| Blight                 | Biological or magical disease spreads through roots, water, spores, creatures, crops, and waste.           | Quarantine, medicine, predators, cleansing, adapted farming, or exploitation.     |
| Corruption             | Unstable magic rewrites blocks, creatures, weather, resources, structures, and minds.                      | Wards, research, source removal, ritual, faction law, dark progression.           |
| Void Scar              | Spatial damage erodes terrain, distance, light, storage, and identity.                                     | Containment, stabilisation, portal engineering, evacuation, or controlled use.    |
| Necromantic Saturation | Death energy preserves, animates, drains, or binds life and memory.                                        | Rites, dialogue, cleansing, ethical labour choices, treaties, or war.             |
| Infernal Influence     | Heat, ash, contracts, desire, sacrifice, and hostile ecology expand from source.                           | Sealing, bargaining, industry, law, resistance, or alliance.                      |
| Blessing               | Protective or life-enhancing state improves growth, healing, safety, or weather but may impose conditions. | Maintain shrine, fulfil covenant, balance ecology, or challenge authority.        |
| Warding                | Constructed defence field suppresses threats, stabilises magic, protects routes, or changes spawns.        | Consumes power/resources; can fail, be sabotaged, upgraded, or politicised.       |
| Cleansing              | Process reduces harmful state but may expose history, displace adapted creatures, or alter resources.      | Multi-stage projects with ecological and faction consequences.                    |
| Restoration            | Returns function or life without necessarily recreating the original state.                                | Supports hybrid outcomes, new cultures, rebuilt structures, and lasting evidence. |

| **No Automatic Moral Answer**                                                                                                                                                                                                                                |
|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Cleansing is not always universally correct, and adaptation is not always corruption acceptance. Atlas entries must describe who benefits, who loses, what evidence exists, and what long-term states are possible without forcing one moral interpretation. |

# 35. Ecology, Migration, Food Webs, and Environmental Pressure

| **Ecology Layer**       | **Required Roles**                                                                            | **Cross-Layer Behaviour**                                                 |
|-------------------------|-----------------------------------------------------------------------------------------------|---------------------------------------------------------------------------|
| Primary Producers       | Algae, seagrass, kelp, plankton, fungi, roots, cave bacteria, cloud flora, magical producers. | Support food webs, oxygen, soil, resources, and seasonal cycles.          |
| Small Consumers         | Grazers, filter feeders, insects, cave scavengers, cloud feeders, burrowers.                  | Transfer energy, provide resources, signal environmental change.          |
| Mid Predators           | Fish, reptiles, birds, cave hunters, aerial pack creatures, reef predators.                   | Control populations and create ordinary threats.                          |
| Apex Predators          | Leviathans, sky hunters, deep beasts, cavern rulers, regional magical predators.              | Shape routes, settlement defence, migration, and boss candidates.         |
| Decomposers             | Fungi, scavengers, microbes, necrophages, machine recyclers.                                  | Recycle resources and respond to deaths, pollution, ruins, and disasters. |
| Ecosystem Engineers     | Reef builders, burrowers, root giants, dam builders, crystal growers, construct swarms.       | Create or transform terrain and structure placement.                      |
| Migrants                | Seasonal marine schools, birds, sky herds, deep migrations, spawning runs.                    | Connect regions and create timed opportunities and risks.                 |
| Invasive or Leaked Life | Realm species, transported pests, corrupted organisms, released constructs.                   | Spread through routes, trade, water, wind, portals, and player action.    |

## 35.1 Ecological Change Rules

- Population simulation uses regional abundance, habitat condition, migration, pressure, and event summaries at distance; it does not simulate every creature globally.

- Bosses, settlements, pollution, wards, extraction, restoration, and realm leaks can alter ecological roles and spawn envelopes.

- Removing a predator, draining a wetland, clearing a reef, sealing a cave, or industrialising a sky route may create secondary effects rather than only immediate rewards.

- Difficulty settings can reduce ecological penalties without deleting habitat identity or visual world response.

# 36. Resources, Extraction, Farming, Power, Automation, and Environmental Consequences

| **Environment**     | **Opportunity**                                                                        | **Constraint and Consequence**                                         |
|---------------------|----------------------------------------------------------------------------------------|------------------------------------------------------------------------|
| Coasts              | Salt, shells, fish, sea plants, clay, drift goods, ports, tide power, wind.            | Storms, erosion, salinity, habitat damage, route conflict.             |
| Shallow Seas        | Kelp, seagrass, reef materials, shellfish, pearls, salvage, current power.             | Breath, waves, fragile ecology, ownership, visibility.                 |
| Open Ocean          | Migration harvest, route trade, storm energy, floating salvage, rare mobile resources. | Distance, weather, storage, navigation, overharvest.                   |
| Deep Ocean          | Vents, nodules, rare compounds, ancient wrecks, realm materials, geothermal energy.    | Pressure, darkness, toxicity, slow recovery, high infrastructure cost. |
| Islands             | Special soils, endemic plants, volcanic minerals, fisheries, strategic ports.          | Freshwater, land limits, storms, isolation, invasive species.          |
| Skylands            | Wind, lightning, cloud water, aerial plants, buoyancy minerals, rare creatures.        | Falling, thin air, route maintenance, unstable terrain, weather.       |
| Shallow Underground | Stone, ore, water, shelter, fungi, archaeology, local transport.                       | Collapse, darkness, ventilation, flooding, ecosystem disturbance.      |
| Deep Underground    | Mythic minerals, geothermal power, machine strata, deep mana, rare organisms.          | Heat, pressure, waste, seismic risk, faction claims, corruption.       |
| Special Regions     | Catalysts, relics, altered crops, unique power, boss materials, dimension resources.   | Instability, law, morality, spread, containment, irreversible change.  |

## 36.1 Extraction State Model

| **State**              | **Meaning**                                                                                |
|------------------------|--------------------------------------------------------------------------------------------|
| Untouched              | Natural abundance and ecology; may include cultural protection or unknown hazard.          |
| Surveyed               | Resources known; ownership, purity, danger, and access assessed.                           |
| Hand-Harvested         | Small-scale extraction with limited terrain and ecological effect.                         |
| Managed                | Renewable harvest, restoration, quotas, rotation, aquaculture, or controlled mining.       |
| Industrialised         | Large infrastructure, higher output, visible route and environmental effects.              |
| Depleted or Damaged    | Yield falls; ecology, stability, water, weather, or faction response changes.              |
| Restored or Repurposed | Site stabilised, habitat rebuilt, settlement created, dungeon exposed, or new use adopted. |

# 37. Civilisations, Settlements, Trade, Roads, Ports, Sky Routes, and Deep Routes

No ancestry is hard-locked to one environment. Cultures develop adaptations, preferences, special knowledge, and historical claims, but migration, mixed settlements, conquest, trade, magic, technology, and player action can create many valid habitation patterns.

| **Environment**   | **Settlement Requirements**                                                                | **Typical Infrastructure**                                                               |
|-------------------|--------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------|
| Coast and Estuary | Fresh water, storm protection, landing, food, flood strategy, trade access.                | Ports, docks, sea walls, raised roads, lighthouses, warehouses, canals.                  |
| Island            | Water, food, soil or imports, harbour, route role, disaster response.                      | Cisterns, terraces, ferries, beacons, wind power, reef passages.                         |
| Underwater        | Breathable habitat, pressure, energy, food, waste, visibility, emergency ascent or refuge. | Domes, air locks, pressure gates, kelp farms, current turbines, portal buoys.            |
| Skyland           | Stable platform, water capture, food, shelter, route, rescue, fall safety.                 | Aerial docks, moorings, windmills, cloud collectors, lifts, beacons, bridges.            |
| Cave and Deep     | Air, water, food, light, waste, structure, routes, heat and flood control.                 | Ventilation, cisterns, fungus farms, supports, lifts, rails, geothermal works.           |
| Special Region    | Adaptation to magic, corruption, realm rules, history, law, and transformed ecology.       | Wards, stabilisers, ritual sites, sealed storage, observation towers, evacuation routes. |

## 37.1 Route Hierarchy

| **Route Scale** | **Marine**                                             | **Aerial**                                                | **Underground**                                      |
|-----------------|--------------------------------------------------------|-----------------------------------------------------------|------------------------------------------------------|
| Local           | Footpath, dock, channel marker, ferry.                 | Ladder, glide line, lift, short bridge.                   | Trail, stair, rope, mine cart, stream path.          |
| Regional        | Coastal road, river-sea port, island hop, patrol lane. | Windway, sky bridge, beacon chain, airship lane.          | Road, rail, river, lift network, waystation.         |
| Interregional   | Ocean current route, deep crossing, major canal.       | Great wind corridor, portal route, high-altitude passage. | Deep road, ancient conduit, major river, realm gate. |

# 38. Structures, Lairs, Dungeons, Megadungeons, Wonders, and World Boss Placement

| **Site Type**        | **Placement Contract**                                                                                            | **Dynamic Possibilities**                                                            |
|----------------------|-------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------|
| Minor Landmark       | Readable silhouette or environmental clue; connects to route, resource, ecology, history, or navigation.          | Weathered, occupied, repaired, claimed, collapsed, cleansed.                         |
| Creature Lair        | Habitat, prey, nesting, scale, access, and territorial signs match creature family.                               | Abandoned, expanded, rival-occupied, domesticated, destroyed.                        |
| Small Dungeon        | Origin and entrance fit biome; compact procedural grammar; optional reward or local unlock.                       | Flooded, cursed, inhabited, looted, restored, repurposed.                            |
| Grand Dungeon        | Regional history, multiple access routes, ecology, factions, resource web, stages, and major climax.              | Ownership war, partial clearing, route opening, settlement conversion.               |
| Megadungeon          | World-history scale, several biome layers, persistent internal regions, settlements or factions, long-term state. | Evolves across campaigns; cannot reset as generic loot room.                         |
| Wonder               | Rare world-readable feature with unique topology, history, ecology, and progression role.                         | Protected, activated, repaired, exploited, damaged, transformed.                     |
| World Boss Territory | Large environmental footprint and signs; encounter is not required to be a closed arena.                          | Migration, awakening, diplomacy, sealing, death, replacement, ecological succession. |

## 38.1 Environment-Specific Dungeon Families Reserved for 24G

| **Environment**  | **Dungeon Families**                                                                                                  |
|------------------|-----------------------------------------------------------------------------------------------------------------------|
| Coast and Marine | Tidal cave, drowned temple, reef hive, wreck labyrinth, abyssal vault, vent foundry, sea-fortress.                    |
| Island           | Caldera complex, cliff monastery, atoll catacomb, lighthouse network, buried pirate city, living-island interior.     |
| Sky              | Floating citadel, storm tower, cloud garden maze, broken skybridge complex, aerial ship graveyard, gravity labyrinth. |
| Underground      | Karst labyrinth, fungal hive, crystal cathedral, deep mine, buried city, machine strata, magma forge, abyssal rift.   |
| Special          | Dream maze, time loop, haunted battlefield vault, corruption heart, realm-breach complex, titan-body dungeon.         |

# 39. Spawn Suitability and Progression Guarantees Without Fixed Content

| **Guarantee**            | **Production Rule**                                                                                                                                                                                      |
|--------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Safe Initial Survival    | Every seed provides a valid start region with accessible shelter materials, food or trade path, basic tool resources, and avoidable immediate lethal hazards. It need not be inland or village-adjacent. |
| First Metal and Industry | Accessible material families and station paths exist within bounded exploration, trade, salvage, or alternative recipes; no fixed cave or ore vein is required.                                          |
| Magic Discovery          | At least one early-to-mid discovery path exists through ruin, NPC, resource, creature, event, research, or biome clue. No fixed mana pocket or rune clearing is used.                                    |
| Marine Access            | Worlds with significant seas provide shore, craft, route, settlement, or knowledge paths before marine content becomes progression-critical.                                                             |
| Vertical Access          | Sky and deep content remain visible or discoverable before access, with several later access methods rather than one mandatory item.                                                                     |
| Dimension Discovery      | Realm access can arise from several categories of gates, rituals, structures, factions, bosses, anomalies, or research; exact locations vary by seed.                                                    |
| Recovery                 | Players cannot be permanently trapped by ordinary procedural topology. Emergency placement, route repair, recall, rescue, or world-setting safeguards exist.                                             |

## 39.1 Starting Environment Suitability

| **Start Category**  | **Allowed Conditions**                                                                                           | **Disallowed Default Conditions**                                                         |
|---------------------|------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------|
| Coastal Start       | Fresh water or clear acquisition path, shelter material, safe shore zone, inland route, ordinary weather window. | Tiny isolated island with no water, unavoidable storm, immediate deep predator territory. |
| Island Start        | Enough basic resources or immediate settlement/trade access; escape or growth path discoverable.                 | Single-biome barren rock with no progression alternatives.                                |
| Cave-Adjacent Start | Surface or daylight access, food path, clear exit, low early threat, basic resources.                            | Sealed deep cavern, flooded shaft, lethal gas, high-tier faction territory.               |
| Sky-Adjacent Start  | Surface grounding or safe low-altitude access; sky content is aspiration rather than trap.                       | Spawning on isolated high skyland without recovery.                                       |
| Special-Biome Start | Only where intensity is low, readable, survivable, and provides ordinary progression or nearby ecotone.          | Strong corruption, void scar, severe time field, realm breach, boss territory.            |

# 40. Dynamic States, Disasters, Seasonal Change, and Long-Term Transformation

| **Environment** | **Dynamic Events**                                                                        | **Persistent Outcomes**                                                                |
|-----------------|-------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------|
| Coast           | Storm surge, erosion, dune migration, flood, algal bloom, reef recovery, sea-level event. | Changed channels, damaged ports, new beaches, drowned ruins exposed, restored habitat. |
| Ocean           | Current shift, migration, storm season, sea ice change, mana tide, bloom, invasion.       | Route value changes, fishing changes, boss movement, new special-state front.          |
| Island          | Eruption, drought, cyclone, invasive species, collapse, uplift, realm event.              | New land, abandoned settlement, ash fertility, altered ecology, evacuation or rebuild. |
| Skyland         | Wind reversal, storm crown, island drift, fragment fall, gravity change, cloud drought.   | Route closure, new connection, falling debris field, settlement relocation.            |
| Underground     | Flood, cave-in, quake, gas release, magma intrusion, fungal bloom, machine awakening.     | New passages, lost routes, exposed ruins, evacuation, industrial opportunity.          |
| Special Region  | Spread, intensification, stabilisation, cleansing, hybridisation, source awakening.       | Biome conversion, faction conflict, new resources, permanent historical scar.          |

## 40.1 State Transition Rule

State transitions must preserve evidence. A cleansed blightwood may retain dead trunks, memorials, altered species, new soil chemistry, and faction claims. A repaired sky bridge may retain patched materials and ownership markers. A drained ruin may show waterlines and aquatic growth. The world should not silently snap back to a pristine default.

# 41. Discovery, Mapping, Naming, Rumours, Codex, and Environmental Readability

| **Discovery Layer** | **Player Information**                                                                           | **Reliability**                                                 |
|---------------------|--------------------------------------------------------------------------------------------------|-----------------------------------------------------------------|
| Visible Geography   | Coast shape, islands, cliffs, clouds, sky silhouettes, cave mouths, smoke, glows, storms.        | Direct observation; may be obscured by weather or distance.     |
| Environmental Clues | Currents, tracks, wrecks, bones, spores, damaged trees, crystals, machinery, ritual marks.       | Strong inference, not always full truth.                        |
| Local Knowledge     | Fisher routes, cave warnings, skyway names, sacred sites, seasonal hazards, monster territories. | Culture- and faction-dependent; can be incomplete or biased.    |
| Maps and Charts     | Coastlines, depth clues, currents, caves, routes, structures, ownership.                         | Age, scale, author, and world changes affect accuracy.          |
| Survey Tools        | Depth, pressure, air, magic, ore, stability, current, wind, corruption.                          | Measured data with equipment limits.                            |
| Codex Truth         | Player-confirmed facts, specimens, research, translated records, encounter results.              | Distinguishes observation, theory, rumour, and developer truth. |

## 41.1 Naming Layers

- Generator identity uses stable internal IDs and deterministic seed-derived records.

- World display names can be procedural, historical, cultural, factional, translated, disputed, or player-renamed according to ownership and discovery.

- One sea, cave province, island, sky route, boss, or ruin may have several names used by different cultures.

- Map UI must show uncertainty, outdated information, depth/altitude, route status, hazard, and ownership without revealing undiscovered truth.

# 42. Visual, Audio, Weather, Lighting, and Forge Asset Requirements

| **Content Family** | **Visual Identity Requirements**                                                                                         | **Audio and Effects Hooks**                                                                 |
|--------------------|--------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------|
| Coasts             | Shore profile, substrate, wetness, tide line, foam, vegetation, debris, erosion, settlement adaptation.                  | Wave exposure, pebbles, wind, seabirds, tide, storm, cave echo.                             |
| Oceans             | Water colour and clarity by depth/chemistry, current cues, surface state, underwater light, particles, silhouettes.      | Hull, current, underwater pressure, distant calls, sonar-like cues, storm.                  |
| Islands            | Readable origin, age, silhouette, freshwater clues, harbour shape, interior relief, endemic palette.                     | Surf direction, wind exposure, fauna identity, settlement signals.                          |
| Skylands           | Buoyancy source, underside form, roots or fractures, cloud interaction, waterfalls, wind streamers, altitude haze.       | Wind layers, creaks, distant thunder, falling debris, aerial calls.                         |
| Underground        | Geology, moisture, scale, air, dust, bioluminescence, water, supports, depth, navigation landmarks.                      | Reverb, drips, tremors, airflow, creature echoes, machine hum, magma.                       |
| Special Regions    | Source must be visually legible through terrain, light, weather, creatures, structures, particles, and state boundaries. | Distinct ambience, warning layers, magical rhythm, corruption source, cleansing transition. |

## 42.1 Forge Production Links

- Biome definitions provide material palettes, texture families, block variation, vegetation sets, prop families, sockets, animation hooks, and LOD categories for the Entity/Asset Forge.

- They provide event names, emitter anchors, density envelopes, state transitions, weather hooks, and readability requirements for the later VFX/Particle Forge.

- They provide ambience zones, surface classes, reverb profiles, creature-call slots, machinery loops, hazard warnings, and music-state tags for the later Audio Forge.

- 24C does not design production software; it defines the environmental contracts those Forge systems must consume without requiring world-system redesign.

# 43. Simulation LOD, Performance, Streaming, and Multiplayer Continuity

| **Simulation Range** | **Detailed State**                                                                                                                      | **Abstract State**                                                                                                               |
|----------------------|-----------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------|
| Immediate            | Visible fluids, tides where relevant, creatures, NPCs, machines, block changes, weather, hazards, particles, audio, route interactions. | None; authoritative local simulation.                                                                                            |
| Local Region         | Simplified ecology, currents, weather fronts, route traffic, settlement tasks, dungeon state, boss influence.                           | Aggregated ticks and scheduled events.                                                                                           |
| Distant Region       | No individual actors or moving items required.                                                                                          | Population abundance, habitat condition, resource totals, route status, ownership, danger, special-state intensity, event queue. |
| Unloaded Layer       | No geometry or actor simulation.                                                                                                        | Persistent records for generated topology, settlements, structures, bosses, history, and state deltas.                           |

## 43.1 Performance Rules

- Ocean surfaces, underwater volumes, skylands, and cave meshes stream by spatial cells and visibility, not as one global scene.

- Currents, tides, ecology, and corruption use regional fields with local visualisation; the game does not solve full planetary fluid or population simulation each frame.

- Cave navigation uses hierarchical region graphs plus local voxel navigation. Aerial and marine navigation use route volumes, avoidance, and local movement profiles.

- Multiplayer authority owns persistent terrain, resource, ecology, settlement, route, dungeon, boss, and special-state changes. Clients request validated actions and render derived presentation.

- Promotion from abstract to detailed simulation must preserve entity identity, inventory totals, damage, schedules, ownership, and event outcomes.

# 44. Data Models, Registries, Validation, Seed Testing, and Production Gates

## 44.1 Core Registry Families

| **Registry**    | **Primary Records**                                                                                                       |
|-----------------|---------------------------------------------------------------------------------------------------------------------------|
| MarineRegion    | Basin, sea, current, temperature, salinity, storm, depth, ecology, routes, history, state.                                |
| CoastSegment    | Land region, marine region, morphology, substrate, tide, exposure, sediment, river, structures, change state.             |
| IslandRegion    | Origin, age, relief, climate, freshwater, biomes, ecology, settlements, routes, hazards, history.                         |
| SkyProvince     | Altitude, buoyancy, wind, cloud, weather, skylands, routes, ecology, structures, hazards.                                 |
| CaveProvince    | Geology, depth, connectivity, entrances, water, air, temperature, resources, ecology, settlements, structures.            |
| SpecialBiome    | Base biome or dedicated biome, source, intensity, footprint, spread, persistence, transformations, counterplay, outcomes. |
| WorldLayerRoute | Origin, endpoints, route type, capacity, seasonality, owner, danger, maintenance, current state.                          |
| BiomeStateDelta | Terrain, resource, ecology, structure, ownership, magic, hazard, event, and presentation changes.                         |

## 44.2 Stable ID Examples

| **Record Type** | **Pattern**                              | **Example**                                 |
|-----------------|------------------------------------------|---------------------------------------------|
| Marine Region   | world.\<world\>.marine.\<region\>        | world.seed_42.marine.sapphire_gyre          |
| Coast Segment   | world.\<world\>.coast.\<segment\>        | world.seed_42.coast.northglass_fjord_03     |
| Island          | world.\<world\>.island.\<island\>        | world.seed_42.island.cinderwake             |
| Sky Province    | world.\<world\>.sky.\<province\>         | world.seed_42.sky.stormcrown_reach          |
| Cave Province   | world.\<world\>.underground.\<province\> | world.seed_42.underground.moonroot_depths   |
| Special State   | world.\<world\>.state.\<state\>          | world.seed_42.state.void_scar_eastern_march |

## 44.3 Generation Validation Gates

| **Gate**        | **Pass Condition**                                                                                                                   |
|-----------------|--------------------------------------------------------------------------------------------------------------------------------------|
| Topology        | No invalid isolated progression region, impossible overlap, broken vertical connection, or contradictory water/terrain relationship. |
| Biome Coherence | Marine, island, sky, cave, and special biomes satisfy climate, geology, hydrology, magical source, and adjacency constraints.        |
| Traversal       | Required regions have discoverable access, alternate route, or clear deferred-access classification.                                 |
| Ecology         | Every major biome has producer, consumer, threat, resource, and transformation slots or a justified sparse-ecology rule.             |
| Civilisation    | Settlement candidates have water, food, shelter, route, resource, defence, and adaptation viability.                                 |
| Adventure       | Dungeons, lairs, ruins, and boss territories have valid environmental origin, clues, access, and world-state effects.                |
| Progression     | Required capabilities are reachable through multiple categories and do not rely on one named generated site.                         |
| Uniqueness      | Rare wonders, special regions, dungeon families, island silhouettes, and boss territories respect density and repetition budgets.    |
| Save Safety     | Generated records have stable IDs, version fields, regeneration policy, migration path, and delta ownership.                         |
| Performance     | Worst-case coast, ocean, skyland, cave, and special-state scenes remain inside content and simulation budgets in packaged builds.    |

## 44.4 Seed Test Matrix

| **Test Class**        | **Required Coverage**                                                                                               |
|-----------------------|---------------------------------------------------------------------------------------------------------------------|
| Small World           | Compressed oceans, islands, cave provinces, and special content remain meaningful without overcrowding.             |
| Large World           | Multiple basins, archipelagos, sky provinces, deep regions, and rare content remain diverse and connected.          |
| Dry World Preset      | Reduced sea area still provides coasts, underground water, special marine options, and progression alternatives.    |
| Oceanic World Preset  | Island and marine progression supports survival, settlement, resources, routes, dungeons, and dimensions.           |
| High-Magic Preset     | Special overlays remain legible, sourced, bounded, and not visually or mechanically homogeneous.                    |
| Low-Magic Preset      | Magic remains discoverable through sparse but guaranteed categories without every biome becoming ordinary.          |
| Harsh Vertical Preset | Sky and deep content increase challenge while retaining recoverability and alternate access.                        |
| Modded Content Pack   | Added families integrate through tags and dependencies without invalidating old saves or replacing core guarantees. |

## 44.5 Production Priority

5.  Implement world-layer records, stable IDs, generation graphs, validation reports, and debug overlays before producing large content rosters.

6.  Complete a minimal but production-quality coast, shallow ocean, island, skyland, cave, deep-layer, and special-overlay family that can generate in many arrangements.

7.  Validate traversal, ecology, settlements, structures, dungeons, bosses, resources, and dynamic-state attachment through seed batches rather than one showcase map.

8.  Expand family breadth only after repetition, adjacency, save migration, streaming, and performance gates pass.

9.  Feed final environmental contracts into Documents 24E through 24L and the Forge production documents.

# Appendix A. Biome and Overlay Registry Field Templates

## A.1 Biome Definition Template

| **Field Group** | **Fields**                                                                                                           |
|-----------------|----------------------------------------------------------------------------------------------------------------------|
| Identity        | biome_id, display_name_key, family_id, parent_id, scope, planning_status, version.                                   |
| Topology        | realm_id, world_layer, region_tags, altitude_band, depth_band, adjacency_tags, transition_profiles.                  |
| Environment     | temperature, moisture, salinity, pressure, light, air, wind, current, tide, substrate, geology, water_state.         |
| Generation      | noise profiles, masks, density, rarity, size range, placement constraints, fallback rules, seed salt.                |
| Ecology         | producer_slots, prey_slots, predator_slots, apex_slots, decomposer_slots, migration_routes, carrying_capacity.       |
| Resources       | renewable resources, deposits, purity, grades, harvest rules, extraction risks, recovery.                            |
| Civilisation    | settlement suitability, agriculture, infrastructure, route, defence, cultural adaptation, ownership.                 |
| Adventure       | structure families, lairs, dungeon anchors, boss territory tags, hazards, clues, discovery.                          |
| Magic and State | mana density, leyline relation, overlay compatibility, corruption resistance, dynamic states, cleansing/restoration. |
| Presentation    | palette, materials, vegetation, props, weather, lighting, particles, ambience, music, map symbol.                    |
| Technical       | streaming class, simulation LOD, navigation profile, spawn budget, asset budget, validation flags.                   |

## A.2 Special Overlay Template

| **Field**                           | **Purpose**                                                               |
|-------------------------------------|---------------------------------------------------------------------------|
| overlay_id and source_id            | Stable identity and causal source.                                        |
| compatible_base_tags and exclusions | Where it may and may not appear.                                          |
| intensity_profile                   | Magnitude, gradient, thresholds, and presentation.                        |
| footprint_profile                   | Point, corridor, patch, watershed, vertical column, moving front, region. |
| spread_profile                      | Carrier, rate, season, route affinity, blockers, acceleration.            |
| transform_rules                     | Blocks, water, weather, ecology, resources, structures, NPCs, magic, UI.  |
| counterplay and project hooks       | Avoid, contain, cleanse, bargain, adapt, exploit, restore.                |
| state outcomes                      | Resolved, contained, hybrid, worsened, dormant, permanent.                |

# Appendix B. World-Layer Adjacency and Transition Matrix

| **From**            | **To**              | **Valid Transition Examples**                                               | **Invalid Without Special Explanation**                                        |
|---------------------|---------------------|-----------------------------------------------------------------------------|--------------------------------------------------------------------------------|
| Surface Land        | Coast               | Dune, cliff, marsh, delta, mangrove, fjord, volcanic shore.                 | Abrupt deep ocean touching ordinary flat land without shelf/cliff/fault logic. |
| Coast               | Shallow Ocean       | Beach to sand shelf, cliff to rocky reef, marsh to estuary, reef lagoon.    | Warm coral reef beside glacial coast without current/magic explanation.        |
| Shallow Ocean       | Open Ocean          | Shelf break, bank edge, reef outer slope, island passage.                   | Immediate abyss everywhere along ordinary coast.                               |
| Open Ocean          | Deep Ocean          | Continental slope, canyon, seamount, trench, rift.                          | Deep content with no basin geometry or access progression.                     |
| Surface             | Skyland             | Mountain lift, wind corridor, floating debris, tower, portal, gravity scar. | High isolated skyland required for progression with no access category.        |
| Surface             | Shallow Underground | Cave mouth, sinkhole, mine, root gap, sea cave, ruin entrance.              | Sealed mandatory cave with no clue or alternate.                               |
| Shallow Underground | Deep Strata         | Fault, shaft, river, mine, ancient route, magma tube, portal.               | Uniform noise passage ignoring geology and depth hazards.                      |
| Any Base Biome      | Special Overlay     | Source, gradient, boundary, transformed ecology, clues, counterplay.        | Random colour-swap patch with no source or system effect.                      |

# Appendix C. Minimum Completeness Contracts

| **Content Package**       | **Minimum Contract Before Production Approval**                                                                                          |
|---------------------------|------------------------------------------------------------------------------------------------------------------------------------------|
| Major Coast Family        | 3-6 variants; land/sea adjacency; tide/wave/sediment rules; ecology; resources; settlement and structure hooks; storm and change states. |
| Major Marine Biome        | Depth and water fields; ecology roles; resource web; traversal; structure/dungeon/boss slots; dynamic states; presentation.              |
| Island Archetype          | Origin; age; climate; freshwater; biome mosaic; ecology; settlement viability; routes; disaster; dungeon and boss potential.             |
| Skyland Province          | Altitude; buoyancy; wind; cloud/weather; route network; ecology; resources; settlement; dungeon; boss; fall/recovery rules.              |
| Cave Province             | Geology; depth; entrances; connectivity; water; air; ecology; resources; routes; structures; settlements; dungeon; boss; hazards.        |
| Special Biome or Overlay  | Source; footprint; intensity; spread; persistence; transformed systems; clues; counterplay; outcomes; cross-layer effects.               |
| Regional Boss Territory   | Habitat; signs; prey/ecology effect; route or settlement impact; awakening; alternate resolutions; aftermath.                            |
| Grand Dungeon Environment | Origin; entrance; room grammar hooks; water/air/gravity/weather; ecology/factions; resources; climax; persistent state.                  |

# Appendix D. Cross-Document Dependency and Update Register

| **Document**                     | **Required Update or Dependency**                                                                                                                                    |
|----------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 00 - Master Bible                | Retain vision; remove any remaining implication that POC locations are production canon.                                                                             |
| 01 - Core Gameplay Loop          | Replace fixed opening and Forest Hamlet examples with category-based procedural examples and multiple starting environments.                                         |
| 03-06 - Registries and Resources | Add marine, aerial, subterranean, and special-state tags, sources, hazards, stabilisation, and extraction states.                                                    |
| 07-09 - NPC, Automation, Magic   | Support ports, sky/deep settlements, route infrastructure, water/wind/geothermal power, pressure, wards, and cross-layer logistics.                                  |
| 10 - Creatures                   | Revise after 24F with marine, aerial, cave, deep, and transformed ecology roster.                                                                                    |
| 11 - Biomes and Worldgen         | Supersede POC valley requirements with 24A-24D production Atlas topology and biome registries.                                                                       |
| 12 - Structures                  | Add marine, sky, cave, deep, and special-biome structure anchors, adaptation, and state rules.                                                                       |
| 13 - Races and Cultures          | Revise after 24E; no ancestry-biome lock, but include environmental adaptation and routes.                                                                           |
| 14 - Dimensions                  | Revise after 24D; distinguish Overworld realm leaks from full dimension generation.                                                                                  |
| 15 - Quests and Events           | Revise after 24K; events consume generated world records and environmental states.                                                                                   |
| 16 - Combat and Defence          | Add pressure, drowning, altitude, falling, currents, wind, darkness, gas, heat, collapse, corruption, and environment-aware bosses.                                  |
| 17 - UI/UX                       | Add depth/altitude maps, marine charts, cave layers, route status, hazard uncertainty, survey overlays, and special-state readability.                               |
| 18 - Technical Plan              | Replace obsolete Unreal-specific implementation with current Godot/Summer Engine architecture while retaining data, authority, save, LOD, and validation principles. |
| 24D-24L                          | Use 24C environmental contracts as placement and completeness requirements.                                                                                          |
| Forge Document Sets              | Generate environment assets, variants, sockets, state hooks, VFX event hooks, ambience zones, and LOD metadata from Atlas records.                                   |

| **[[24C - Oceans, Coasts, Islands, Skylands, Underground and Special Overworld Biomes]] Acceptance Statement**                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [[24C - Oceans, Coasts, Islands, Skylands, Underground and Special Overworld Biomes]] is complete when the Overworld can be generated and reasoned about as a coherent land-sea-sky-underground system with special high-fantasy states; when no production rule depends on the retired POC; when environmental content has stable data contracts, traversal and progression safeguards, ecology and civilisation hooks, dynamic transformation, dungeon and boss placement rules, and validation gates; and when Documents 24D through 24L can expand content without redesigning world topology. |

---
## Navigation
- Previous: [[24B - Overworld Regions, Climate and Surface Biomes|24B]]
- Next: [[24D - Dimensions, Realm Structure and Realm Biome Atlas|24D]]
- Index: [[00 - Document Set 24 Index]]
