---
title: 24I — Structures, Landmarks, Routes, Wonders and World Infrastructure Atlas
document_set: 24
document: 24I
aliases:
- 24I
- Document 24I
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
- 24i
---

# 24I — Structures, Landmarks, Routes, Wonders and World Infrastructure Atlas

> [!NOTE]
> Obsidian-ready Markdown conversion of the approved Set 24 source document. Source wording and structure have been preserved wherever possible.

**Fantasy Voxel Civilisation Sandbox**

**24I - World Content Atlas: Structures, Landmarks, Routes, Wonders and World Infrastructure Atlas**

Version 0.1 - Post-POC Production Content Draft

A database-ready Atlas for settlement structures, roads, trails, bridges, tunnels, ports, railways, skyways, realm gates, public works, defence networks, magical and automated infrastructure, landmarks, wonders, megastructures, dynamic ownership, restoration, navigation, and deterministic seed-derived world connectivity.

| **Structures, Landmarks, Routes, Wonders and World Infrastructure Atlas Statement**                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Production worlds must not contain the retired Forest Hamlet, fixed watchtower, guaranteed bridge, old rune clearing, scripted goblin camp, POC warehouse chain, or any site placed solely to demonstrate the proof of concept. Every structure, route, landmark, public work, wonder, and megastructure is selected through deterministic seed-derived geography, history, culture, faction, ecology, resources, technology, magic, dimensions, accessibility, progression, and world-state rules. Structures are functional world actors: they shelter, connect, supply, govern, defend, teach, trade, remember, transform, or fail - not decorative shells pasted onto terrain. |

| **Field**                | **Locked Direction**                                                                                                                                                                                                                                                                                                                                                                               |
|--------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Document Scope           | Full post-POC Atlas covering structure taxonomy, hierarchy, placement, authorship, ownership, procedural assembly, settlement buildings, public services, routes, crossings, ports, rails, skyways, realm gates, magic and automation infrastructure, landmarks, wonders, megastructures, dynamic states, restoration, discovery, simulation, data registries, validation, and production budgets. |
| POC Status               | All POC-only buildings, named sites, valley arrangements, fixed routes, tutorial landmarks, guaranteed watchtower projects, and scenario-specific infrastructure are retired from normal production generation.                                                                                                                                                                                    |
| Core Philosophy          | Every meaningful structure must perform or communicate a world function. A site that changes only the skyline or loot table is incomplete unless it is intentionally ambient and budgeted as such.                                                                                                                                                                                                 |
| Procedural Direction     | Seeds select compatible foundations, culture kits, materials, histories, states, functions, route roles, sockets, ownership, damage, inhabitants, and surroundings through validated deterministic definitions.                                                                                                                                                                                    |
| Network Direction        | Roads, waterways, rails, skyways, deepways, conduit corridors, and realm routes form traversable graphs with origins, destinations, maintenance, ownership, hazards, redundancy, and persistent disruption.                                                                                                                                                                                        |
| Player-Freedom Direction | Players may discover, use, bypass, repair, supply, claim, restore, expand, reroute, automate, fortify, repurpose, dismantle, conquer, abandon, protect, or destroy structures where world rules allow.                                                                                                                                                                                             |
| Persistence Direction    | Ownership, damage, construction, occupation, route access, storage, power, warding, ecological effects, settlement service, restoration, and wonder outcomes remain save-safe.                                                                                                                                                                                                                     |
| Implementation Direction | Use stable registry IDs, Godot resources and scenes, modular blueprint grammars, marker/socket contracts, chunk-aware placement, simulation LOD, authoritative transactions, migration-safe saves, and Summer Engine-assisted production tooling.                                                                                                                                                  |

# Document Purpose

This document is the structure, navigation, landmark, and infrastructure-facing volume of Document Set 24, the World Content Atlas. It expands the foundations established by Documents 24A through 24H into the places and networks that make generated worlds readable, inhabited, traversable, defensible, productive, memorable, and historically layered.

The Atlas owns what a structure means in the world, which definitions can be selected together, where it may appear, what functions and route sockets it provides, who built and controls it, how it changes, and how it connects to settlements, ecosystems, dungeons, bosses, dimensions, magic, automation, quests, and persistent world state. Exact block recipes, final asset production, numerical throughput, AI implementation, construction code, and economy values remain with their specialist systems.

This volume formally supersedes structure arrangements created only for the Forest Hamlet proof of concept. Reusable mechanics such as watchtowers, warehouses, roads, bridges, ruins, enemy camps, rune sites, staged construction, damage, repair, and ownership remain valid as generic families, but no POC name, coordinate, sequence, population, or fixed relationship survives as production truth.

# Design Source and Supersession Rules

| **Source**                                | **Direction retained, expanded, or superseded**                                                                                                                                                                                                   |
|-------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 00 - Master Game Design Bible             | Retains living civilisations, voxel construction, villages, automation, magic, ancient mysteries, dimensional travel, large projects, player freedom, and visible world consequences.                                                             |
| 01-02 - Core Loop and Progression         | Retains explore -\> gather -\> craft -\> build -\> interact -\> automate -\> defend -\> upgrade -\> expand. Removes fixed opening structures and one mandatory route through progression.                                                         |
| 03-06 - Blocks, Items, Recipes, Resources | Structures reference exact construction families, functional blocks, storage, damage states, resources, project recipes, repairs, fuels, components, and realm materials without duplicating those registries.                                    |
| 07 - NPC Village System                   | Retains homes, job sites, warehouses, public services, projects, repairs, defence, ownership, permissions, settlement growth, and simulation LOD while retiring POC-specific residents and village geometry.                                      |
| 08-09 - Automation and Magic              | Retains machine sites, logistics, roads, rails, power, mana, wards, conduits, ritual sites, portals, maintenance, risks, and public infrastructure relationships.                                                                                 |
| 10 and 24F - Creatures and Ecology        | Structures provide nests, shelters, migration barriers, livestock facilities, monster pressure, ecological corridors, invasive sites, and environmental aftermath.                                                                                |
| 11 and 24A-24C - Worldgen and Biomes      | Retains deterministic regions, biome mosaics, geology, rivers, coasts, skylands, underground layers, anomalies, terrain practicality, placement constraints, and seed validation.                                                                 |
| 12 - Structures                           | Retains categories, blueprints, dynamic states, roads, ownership, restoration, rewards, map discovery, and LOD. This Atlas supersedes its POC scope and expands it into production registries.                                                    |
| 13 and 24E - Civilisations                | Cultures, factions, governments, settlements, laws, professions, ownership, migration, warfare, architecture, and civic services determine structure identity and use.                                                                            |
| 14 and 24D - Dimensions                   | Realm laws, native societies, route sovereignty, biome families, portal rules, hazards, resources, and settlement adaptation determine dimensional structures and infrastructure.                                                                 |
| 15-17 - Quests, Combat, UI                | Structures provide objectives, state evidence, siege targets, safe routes, map symbols, rumours, access rules, restoration projects, ownership feedback, and navigation support.                                                                  |
| 18 replacement technical plan             | Retains stable IDs, registries, deterministic generation, persistence, authority, LOD, validation, and migration principles while translating implementation to Godot/Summer Engine.                                                              |
| 24G - Dungeons                            | Owns procedural interior encounter grammar, hazards, puzzles, room networks, dungeon persistence, and megadungeon exploration. 24I owns exterior sites, functional world structures, approach networks, services, and world-scale infrastructure. |
| 24H - Bosses                              | Structures supply territories, arenas, evidence sites, siege targets, containment works, guardian stations, aftermath states, and world-scale entity interfaces.                                                                                  |
| 24J-24L                                   | Consume structure-linked resources, loot, relics, histories, events, registry schemas, asset budgets, and production sequencing.                                                                                                                  |

# Static Table of Contents

1\. Locked Structure, Landmark, Route, Wonder and Infrastructure Atlas Identity

2\. Post-POC Production Decisions

3\. Authority and Cross-Document Ownership

4\. Structure Taxonomy, Hierarchy, Scale, and Terminology

5\. World Function, Service Roles, and Player-Facing Purpose

6\. Historical Origin, Builder, Ownership, Legitimacy, and Cultural Interpretation

7\. Deterministic Seed Placement, Suitability, Density, Rarity, and Exclusion

8\. Modular Structure Grammar, Blueprints, Variants, and Assembly

9\. Functional Zones, Markers, Sockets, Ports, and Interaction Contracts

10\. Settlement Buildings, Districts, Civic Services, and Public Works

11\. Housing, Households, Hospitality, Refuge, and Social Space

12\. Agriculture, Water, Food Storage, Forestry, and Land Management

13\. Extraction, Industry, Workshops, Automation Sites, and Resource Infrastructure

14\. Trade, Markets, Warehouses, Customs, Finance, and Logistics Hubs

15\. Roads, Trails, Causeways, Pilgrim Ways, and Surface Route Networks

16\. Bridges, Fords, Ferries, Tunnels, Passes, Stairs, and Vertical Crossings

17\. Ports, Harbours, Canals, Waterways, Lighthouses, and Marine Infrastructure

18\. Rails, Minecarts, Deepways, Lifts, Conveyors, and Underground Transit

19\. Skyways, Aerial Docks, Wind Routes, Floating Anchors, and High-Altitude Infrastructure

20\. Realm Gates, Portal Networks, Cross-Dimensional Corridors, and Route Sovereignty

21\. Magic, Mana, Wards, Ritual, Research, and Arcane Infrastructure

22\. Defence, Borders, Forts, Watch Networks, Refuges, and Siege Works

23\. Shrines, Temples, Memorials, Cemeteries, Sacred Landscapes, and Pilgrimage

24\. Knowledge, Communication, Surveying, Mapping, Archives, and Signal Networks

25\. Ruins, Abandoned Sites, Restoration, Reuse, and Archaeological Layers

26\. Landmarks, Silhouettes, Environmental Evidence, and World Navigation

27\. Wonders, Monuments, Great Works, and Civilisation-Scale Projects

28\. Megastructures, World Machines, Living Architecture, and Regional Systems

29\. Mobile, Transforming, Seasonal, and Reality-Altering Structures

30\. Construction, Supply, Maintenance, Damage, Decay, Repair, and Resilience

31\. Claiming, Ownership, Permissions, Occupation, Conquest, and Repurposing

32\. Dynamic Structure States, Settlement Change, Faction Control, and Persistent Aftermath

33\. Ecology, Creatures, Dungeons, Bosses, Hazards, and World-System Integration

34\. Discovery, Rumours, Names, Maps, Codex Certainty, and Player Guidance

35\. Traversal, Accessibility, Safety, Comfort, and Multiplayer Use

36\. Detailed Overworld Structure and Landmark Foundation Registry v0.1

37\. Detailed Route and Infrastructure Foundation Registry v0.1

38\. Detailed Realm Structure Foundation Registry v0.1

39\. Detailed Wonder and Megastructure Foundation Registry v0.1

40\. Structure Grammar, Route, Landmark, State, and Socket Module Libraries

41\. Presentation, Forge, Materials, Animation, Audio, VFX, and Environmental Readability

42\. Simulation LOD, Saves, Performance, Authority, and Godot/Summer Engine Direction

43\. Data Models, Stable IDs, Registries, Validation, and Seed Testing

44\. Content Completeness Contracts and Production Budgets

45\. Balancing, Representation, Ethics, and Quality Rules

46\. Cross-Document Update Plan

47\. Open Questions

Appendix A. Structure Foundation Definition Template

Appendix B. Route and Network Definition Template

Appendix C. Wonder and Megastructure Definition Template

Appendix D. Dynamic State, Ownership, Restoration, and Service Template

Appendix E. Minimum Completeness and Validation Matrix

Appendix F. Acceptance Criteria

# 1. Locked Structure, Landmark, Route, Wonder and Infrastructure Atlas Identity

The Structure Atlas is the physical civilisation, navigation, and world-memory layer of the game. It turns terrain into places, settlements into functioning communities, routes into persistent networks, infrastructure into visible capability, landmarks into readable orientation, and wonders into civilisation-scale stories. Structures exist before the player arrives, respond while the player acts, and remain changed afterward.

| **Locked Rule**                                                                                                                                                                                                                                                                                                                                             |
|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Every meaningful structure must answer at least one world question: what does it shelter, connect, supply, store, govern, teach, defend, signal, transform, remember, regulate, produce, worship, repair, reveal, or make possible? If removing it changes only decoration, it is not ready for production unless explicitly classified as ambient scenery. |

| **Identity Layer**    | **Design Meaning**                                                                                                          | **Player-Facing Result**                                                                 |
|-----------------------|-----------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------|
| Functional Place      | Buildings and sites provide services, jobs, storage, shelter, research, production, ritual, defence, travel, or governance. | Players understand why the place exists and how it affects nearby life.                  |
| Network Node          | Routes and infrastructure connect settlements, resources, dungeons, ports, regions, dimensions, and safe travel.            | The world becomes navigable through physical relationships rather than isolated markers. |
| Civilisation Evidence | Architecture, materials, maintenance, laws, ownership, and public works communicate culture and political power.            | Settlements feel built by people with histories and priorities.                          |
| Historical Layer      | Ruins, repairs, additions, occupations, disasters, and restorations remain visible.                                         | Players read the world through accumulated evidence and competing claims.                |
| Progression Interface | Structures unlock services, routes, specialists, recipes, portals, projects, safe zones, trade, and knowledge.              | Progression emerges from discovery and world participation, not one fixed sequence.      |
| Dynamic State         | Sites can grow, fail, burn, flood, corrupt, be occupied, restored, repurposed, dismantled, or transformed.                  | The world remembers actions and continues changing.                                      |
| World Landmark        | Silhouette, light, sound, terrain relationship, roads, and cultural markers support orientation.                            | Players navigate by reading the landscape and remembering places.                        |
| Production Contract   | Definitions specify modular parts, sockets, assets, LOD, state variants, validation, and reuse.                             | Content can scale without every structure becoming a bespoke technical exception.        |

## 1.1 What this Atlas prevents

- Fixed POC locations, scripted valley relationships, or tutorial-only landmarks appearing in normal seeds.

- Roads that begin and end nowhere, bridges without route demand, ports without water networks, or gates without destinations.

- Settlements made from decorative houses while food, storage, work, sanitation, defence, transport, and public services are abstract or missing.

- Every culture using the same building silhouettes with only a colour swap.

- Ruins and wonders spawning without builders, history, ownership claims, ecology, maintenance, or consequences.

- Portal structures functioning as menu doors rather than physical, political, hazardous, and maintainable infrastructure.

- Megastructures that are visually large but mechanically empty.

- Player claiming acting as an instant ownership flag without law, inhabitants, repair, supply, reputation, occupation, or resistance.

- Procedural assembly producing blocked entrances, inaccessible services, route collisions, unsupported structures, or impossible terrain joins.

- Engine-specific scene logic becoming the only source of content truth; definitions remain registry-driven and migration-safe.

# 2. Post-POC Production Decisions

| **Area**                   | **Locked Production Decision**                                                                                                                                                                    |
|----------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| POC retirement             | Archive Forest Hamlet, the staged watchtower, fixed warehouse delivery, old rune clearing, guaranteed goblin camp, scripted bridge/crossing, fixed cave entrance, and all coordinate assumptions. |
| Reusable families          | Retain watchtowers, warehouses, roads, bridges, ruins, camps, shrines, ports, mines, project construction, damage, repair, ownership, and raid targets only as generic authored foundations.      |
| No canonical opening       | No guaranteed first village, road, ruin, port, dungeon, gate, wonder, or civilisation. Accessibility presets influence density and reachability without selecting a canonical site.               |
| Structure hierarchy        | Separate placeable object, room/module, building, structure cluster, district, settlement, route node, route segment, landmark, wonder, megastructure, and regional infrastructure.               |
| Functional completeness    | Major settlements require coherent service coverage; isolated structures require an origin, users, inputs, outputs, access, maintenance, and current state.                                       |
| Procedural assembly        | Use authored grammars and compatibility constraints, not unrestricted random block placement. Critical entrances, service sockets, navigation, support, and state transitions must validate.      |
| Route realism              | Networks respond to geography, trade, population, hazards, factions, resources, history, technology, and dimensions, while prioritising readable gameplay over full real-world simulation.        |
| Culture variation          | Architecture uses shared structural systems with culture, environment, material, technology, magic, class, era, and state variants. Ancestry never determines architecture alone.                 |
| Dynamic ownership          | Control can be public, private, communal, factional, sacred, abandoned, contested, occupied, player-held, realm-governed, or disputed.                                                            |
| Restoration                | Repair and restoration are first-class progression paths that can reopen routes, return services, resettle populations, revive ecosystems, or expose political disputes.                          |
| Wonders                    | Wonders are rare systems with regional identity, discovery, access, maintenance, history, factions, events, and persistent outcomes; they are not oversized decorations.                          |
| Infrastructure consequence | Roads, dams, mines, ports, walls, factories, portals, wards, and sky anchors can improve civilisation while changing ecology, politics, safety, resources, and regional pressure.                 |
| Engine direction           | Godot/Summer Engine implementation uses modular scenes and resources generated from stable data, with validators, previews, state variants, and chunk-aware placement.                            |

# 3. Authority and Cross-Document Ownership

| **Question**                      | **Primary Owner**    | **24I Responsibility**                                                                                                                                                      |
|-----------------------------------|----------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Structure identity and world role | 24I                  | Foundation, category, scale, function, construction grammar, placement relationships, ownership, state, discovery, route sockets, restoration, and production requirements. |
| World position and environment    | 24A-24D              | World topology, region, biome, terrain, climate, geology, water, sky, underground, realm, anomaly, rarity, adjacency, exclusion, and seed guarantees.                       |
| Settlement and society            | 24E / 07             | Population, culture, government, law, services, districts, professions, household demand, ownership, faction control, settlement growth, and NPC use.                       |
| Ecology and creatures             | 24F                  | Nests, habitats, migration, livestock, pests, invasive species, structure use, ecological corridors, and environmental effects.                                             |
| Dungeon interior                  | 24G                  | Exploration layout, room grammar, hazards, puzzles, encounter progression, dungeon state, loot spaces, and megadungeon interior.                                            |
| Boss and siege use                | 24H                  | Territories, arenas, evidence, siege targets, containment, guardian interfaces, titan paths, and aftermath.                                                                 |
| Blocks, items, recipes, resources | 03-06 / 24J          | Exact construction materials, block states, placeables, inventories, project recipes, maintenance supplies, fuels, relics, trade goods, and costs.                          |
| Automation and magic              | 08-09                | Power networks, machines, logistics, mana, wards, conduits, rituals, portals, risks, throughput, maintenance, and specialist interfaces.                                    |
| Quests, events, history           | 15 / 24K             | Discovery, claims, restoration, construction, wars, disasters, ownership, rumours, pilgrimages, route events, wonder arcs, and persistent world evidence.                   |
| Combat and defence                | 16                   | Cover, fortification, siege, structure damage, breach, traps, evacuation, patrols, safe zones, and encounter interaction.                                                   |
| UI and mapping                    | 17                   | Map layers, icons, route status, ownership, service views, rumours, certainty, construction, repair, power, access, navigation, and accessibility.                          |
| Implementation and production     | 24L / replacement 18 | Schemas, scene generation, streaming, navigation, LOD, saves, authority, validation, asset budgets, build pipeline, and migration.                                          |

# 4. Structure Taxonomy, Hierarchy, Scale, and Terminology

Structure terminology separates physical scale from social scale and gameplay function. A settlement is a population and political entity from 24E; its physical buildings, districts, utilities, roads, walls, and public works are structure records from 24I. A dungeon may occupy a structure exterior from 24I while its encounter interior is generated by 24G.

| **Term**               | **Definition**                                                                                                             | **Examples**                                                      |
|------------------------|----------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------|
| Placeable              | Single block or small object with interaction and optional state.                                                          | Door, sign, lamp, bed, bench, lever, ward stone, machine port.    |
| Module                 | Reusable authored spatial piece that connects through sockets.                                                             | Room, roof section, tower tier, bridge span, dock pier, gate bay. |
| Building               | One coherent structure with function and ownership.                                                                        | House, mill, archive, workshop, shrine, warehouse, watchtower.    |
| Cluster                | Several buildings and shared exterior spaces acting together.                                                              | Farmstead, mine complex, caravan station, harbour quarter.        |
| District               | Settlement-scale zone with services, streets, plots, law, and population links.                                            | Market district, forge ward, temple quarter, docklands.           |
| Route node             | Place where one or more networks begin, end, branch, transfer, rest, pay, inspect, or change mode.                         | Crossroads, ferry landing, station, gate, lift, portal hub.       |
| Route segment          | Traversable connection between nodes with condition and ownership.                                                         | Road, trail, bridge, tunnel, canal, rail, sky lane, gate link.    |
| Landmark               | Readable point, line, silhouette, sound, light, or terrain feature used for orientation and identity.                      | Beacon, giant tree, obelisk, cliff stair, colossal remains.       |
| Wonder                 | Rare authored or generated great work with regional history, function, politics, and persistent state.                     | Great tidewall, singing mountain observatory, worldroot crown.    |
| Megastructure          | World-scale built, living, geological, or mechanical system spanning many chunks or regions.                               | Floating city frame, world engine, deepway, continental aqueduct. |
| Infrastructure network | Persistent graph of nodes, segments, capacity, state, ownership, maintenance, hazards, and users.                          | Road system, waterworks, rail line, mana grid, beacon chain.      |
| Site record            | Save-level identity linking structures, terrain, inhabitants, ownership, events, services, damage, discovery, and history. | A specific generated port, ruin, fort, wonder, or route junction. |

# 5. World Function, Service Roles, and Player-Facing Purpose

| **Service Role**         | **Structure Questions**                                                                                                          |
|--------------------------|----------------------------------------------------------------------------------------------------------------------------------|
| Shelter and residence    | Housing, inns, refuges, barracks, camps, sanctuaries, climate protection, privacy, and household life.                           |
| Food and water           | Farms, fisheries, kitchens, granaries, wells, aqueducts, irrigation, water treatment, preservation, and emergency stores.        |
| Production and repair    | Workshops, mills, mines, foundries, laboratories, rune works, maintenance depots, and construction yards.                        |
| Storage and logistics    | Warehouses, silos, armories, cold stores, vaults, depots, docks, stations, sorters, and route transfer.                          |
| Trade and administration | Markets, customs, guildhalls, courts, tax offices, councils, embassies, archives, and public notice systems.                     |
| Defence and safety       | Walls, gates, towers, beacons, refuges, patrol lodges, barriers, wards, hospitals, evacuation routes, and containment.           |
| Knowledge and culture    | Schools, libraries, theatres, museums, observatories, memorials, language houses, research centres, and festivals.               |
| Faith and ritual         | Temples, shrines, cemeteries, pilgrimage routes, ritual courts, cleansing houses, ancestor halls, and sacred landscapes.         |
| Travel and navigation    | Roads, signs, bridges, ferries, ports, rails, lifts, sky docks, gates, survey towers, maps, and rest stops.                      |
| Magic and automation     | Mana wells, conduits, power stations, batteries, machine halls, logic sites, ritual anchors, portal frames, and ward grids.      |
| Ecological management    | Forestry posts, wildlife crossings, hatcheries, seed vaults, flood controls, terracing, reclamation works, and quarantine sites. |
| World transformation     | Dams, canals, floating anchors, weather towers, realm stabilisers, deep forges, megaprojects, and wonders.                       |

# 6. Historical Origin, Builder, Ownership, Legitimacy, and Cultural Interpretation

A structure is generated from an origin record, not only a visual kit. Origin defines why it was built, who supplied labour and materials, what law or belief justified it, how it was used, which later groups altered it, and why its current ownership may be accepted or contested.

| **Historical Field**    | **Required Possibilities**                                                                                                                       |
|-------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------|
| Founder                 | Culture, faction, settlement, sovereign, guild, faith, army, household, construct collective, unknown precursor, or natural/living origin.       |
| Purpose at construction | Residence, public service, trade, extraction, defence, research, ritual, commemoration, containment, travel, colonisation, or prestige.          |
| Labour history          | Voluntary, household, guild, communal, paid, military, machine-supported, golem-assisted, ritual, coerced, enslaved, necromantic, or disputed.   |
| Material history        | Local, imported, salvaged, realm-derived, boss-derived, recycled, magically grown, living, unstable, forbidden, or culturally restricted.        |
| Ownership history       | Continuous, inherited, sold, granted, seized, occupied, abandoned, sacred trust, communal, public, privatised, contested, or unknown.            |
| Alteration layers       | Expansion, repair, fortification, cultural conversion, industrialisation, warding, corruption, disaster repair, occupation, and restoration.     |
| Legitimacy claims       | Law, ancestry, citizenship, conquest, treaty, faith, stewardship, use, discovery, restoration investment, or player claim.                       |
| Cultural names          | Official name, local nickname, faction title, old-language name, scholar label, map abbreviation, insult, prophecy name, or unknown designation. |
| Truth and uncertainty   | Objective construction record may differ from rumours, propaganda, myths, faction claims, archaeological interpretation, and player knowledge.   |

# 7. Deterministic Seed Placement, Suitability, Density, Rarity, and Exclusion

Placement uses layered suitability followed by validation and repair. The generator chooses definitions compatible with terrain, water, climate, geology, biome, resources, culture, settlement demand, routes, danger, realm law, history, technology, magic, and current world state. It does not roll a structure name and force terrain to accept it without context.

| **Placement Stage** | **Required Checks**                                                                                                                                                                           |
|---------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| World layer         | Realm, continent, region, climate band, historical province, faction territory, civilisation density, and global rarity budget.                                                               |
| Landscape layer     | Biome, sub-biome, slope, elevation, depth, water, coast, river, cave, sky island, geology, soil, wind, pressure, and hazards.                                                                 |
| Civilisation layer  | Population, settlement form, culture kits, government, economy, profession demand, law, territory, routes, conflict, and migration.                                                           |
| Functional layer    | Inputs, outputs, service radius, customers, workforce, maintenance, storage, power, water, mana, safety, and route demand.                                                                    |
| Historical layer    | Founder, era, war, trade, disaster, migration, faith, colonisation, abandonment, restoration, and archaeological continuity.                                                                  |
| Content spacing     | Minimum separation, cluster rules, uniqueness, landmark sightline, wonder budget, route-node density, and repetition limits.                                                                  |
| Exclusions          | Terrain collision, inaccessible entrance, unsafe spawn, incompatible realm law, blocked route, duplicate wonder, protected biome, cultural conflict without history, and unsupported service. |
| Fallback            | Move, rotate, choose another grammar, reduce scale, use alternate material/route profile, create transition terrain, defer site, or select another compatible foundation.                     |
| Validation          | Entrances reachable, supports valid, services connected, route graph complete, no critical overlap, required inhabitants/resources available, and save IDs stable.                            |

# 8. Modular Structure Grammar, Blueprints, Variants, and Assembly

Structure foundations are authored grammars. They describe required cores, optional wings, sockets, footprint rules, vertical limits, circulation, services, cultural variants, material palettes, state substitutions, and LOD forms. They are not fixed block copies unless the content intentionally requires a unique authored monument.

| **Grammar Layer**   | **Definition**                                                                                                                               |
|---------------------|----------------------------------------------------------------------------------------------------------------------------------------------|
| Required core       | Minimum functional rooms, exterior spaces, supports, entrances, service blocks, route sockets, and identity silhouette.                      |
| Optional modules    | Capacity, wealth, profession, culture, climate, defence, magic, automation, damage, and historical layers add compatible pieces.             |
| Footprint grammar   | Cluster, courtyard, linear, ring, spine, terrace, tower, bridge, buried, cliff, floating, radial, organic, or hybrid form.                   |
| Circulation         | Public, private, service, livestock, freight, defence, ritual, emergency, accessibility, and vertical routes remain distinct where needed.   |
| Material palette    | Foundation, structure, roof, trim, glazing, floor, path, machine, magical, damaged, cultural, and realm-specific materials.                  |
| State substitution  | Active, damaged, burned, flooded, frozen, corrupted, abandoned, occupied, restored, repurposed, and under-construction modules.              |
| Culture variant     | Shape language, privacy, household form, ornament, public space, labour organisation, law, faith, magic, technology, and class.              |
| Environment variant | Snow load, heat, rain, flooding, wind, pressure, buoyancy, roots, cave support, floating anchors, realm physics, and local materials.        |
| Unique override     | Named wonders and story-critical sites may use authored geometry while retaining state, route, ownership, accessibility, and save contracts. |
| LOD representation  | Full blocks and actors nearby; simplified geometry and service simulation at medium range; site and network records at distance.             |

# 9. Functional Zones, Markers, Sockets, Ports, and Interaction Contracts

| **Socket Family**        | **Examples and Requirements**                                                                                                                     |
|--------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------|
| Entrance markers         | Main, service, emergency, freight, ritual, guarded, hidden, underwater, aerial, underground, portal, and accessibility entrances.                 |
| Route sockets            | Road, trail, bridge, ferry, dock, canal, rail, minecart, lift, conveyor, skyway, conduit, and realm-gate connections.                             |
| NPC markers              | Homes, beds, households, jobs, queues, social spaces, worship, guard posts, patrols, evacuation, teaching, trading, and maintenance.              |
| Inventory ports          | Donation, sale, contract, project reserve, machine input/output, warehouse category, armory, cold store, vault, and faction ownership.            |
| Power and mana ports     | Mechanical, fuel, water, wind, steam, electric, mana, leyline, ritual, portal, battery, safety cutoff, and maintenance access.                    |
| Construction markers     | Blueprint anchor, project boundary, supply crate, scaffold, builder path, demolition area, upgrade socket, repair priority, and inspection point. |
| Defence sockets          | Wall join, gate, tower, trap, ward, beacon, siege engine, cover, breach, rally point, refuge, and evacuation route.                               |
| Dungeon and boss sockets | Interior entrance, boss arena, lair, evidence site, commitment point, retreat, containment, siege target, titan path, and aftermath transform.    |
| Presentation sockets     | Ambient sound, music zone, VFX anchor, light source, banner, sign, map icon, camera reveal, lore object, and environmental animation.             |
| Validation contracts     | Clearance, orientation, reachability, ownership, service dependency, terrain support, network continuity, safety, LOD, and save identity.         |

# 10. Settlement Buildings, Districts, Civic Services, and Public Works

24I supplies physical building and infrastructure families for settlements generated by 24E. Settlement scale does not dictate one layout. Population, culture, environment, government, wealth, law, history, services, threats, technology, magic, and route role select compatible districts and projects.

| **Design Area**   | **Production Requirement**                                                                                                                                       |
|-------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Service coverage  | Housing, food, water, sanitation, storage, work, health, safety, education, governance, culture, faith, transport, trade, communication, and emergency capacity. |
| District grammar  | Residential, civic, market, industrial, dock, temple, university, military, agricultural, foreign, poor, elite, magical, automation, and mixed districts.        |
| Growth            | New plots, infill, vertical expansion, suburbs, walls, roads, utilities, public works, annexation, restoration, and realm adaptation.                            |
| Decline           | Vacancy, service failure, damaged utilities, abandoned districts, informal housing, occupation, ruins, reclamation, and partial continuity.                      |
| Player connection | Supply projects, design permissions, public contracts, repairs, services, law, reputation, taxation, ownership, and settlement planning.                         |

# 11. Housing, Households, Hospitality, Refuge, and Social Space

Housing must support households, privacy, climate, culture, class, work, storage, accessibility, guests, children, elders, migration, and emergency refuge. A settlement should not be populated by decorative beds disconnected from residents and schedules.

| **Design Area**    | **Production Requirement**                                                                                                                           |
|--------------------|------------------------------------------------------------------------------------------------------------------------------------------------------|
| Housing forms      | Detached, attached, courtyard, longhouse, apartment, tower, cave dwelling, floating home, ship-home, communal hall, mobile home, and pocket habitat. |
| Household function | Sleep, cooking, storage, craft, care, socialising, worship, pets, livestock, sanitation, heating/cooling, and personal ownership.                    |
| Hospitality        | Inn, hostel, guesthouse, caravanserai, pilgrim hall, embassy lodging, refugee shelter, barracks, and emergency refuge.                               |
| Dynamic use        | Birth, death, marriage, migration, eviction, damage, occupation, wealth change, conversion, abandonment, and restoration alter occupancy.            |
| Player use         | Rent, buy, build, claim, share, recruit, host, shelter refugees, operate businesses, or convert structures under law and permissions.                |

# 12. Agriculture, Water, Food Storage, Forestry, and Land Management

Food and land infrastructure links biome productivity, culture, seasons, labour, water, storage, livestock, trade, ecology, magic, and automation. Farms are structure clusters and managed landscapes rather than one crop block repeated across every culture.

| **Design Area** | **Production Requirement**                                                                                                                           |
|-----------------|------------------------------------------------------------------------------------------------------------------------------------------------------|
| Agriculture     | Fields, terraces, orchards, vineyards, paddies, gardens, greenhouses, fungus beds, floating beds, underground farms, and realm-specific cultivation. |
| Water           | Wells, cisterns, aqueducts, canals, irrigation gates, pumps, reservoirs, drainage, flood control, purification, and drought reserves.                |
| Storage         | Granaries, silos, root cellars, smokehouses, icehouses, cold stores, seed vaults, fodder barns, and emergency reserves.                              |
| Forestry        | Managed woods, coppice, nurseries, logging roads, saw sites, firebreaks, replanting, sacred groves, and wildlife corridors.                          |
| Consequences    | Erosion, salinity, pests, disease, overgrazing, deforestation, wetland loss, pollution, famine risk, abundance, and restoration.                     |

# 13. Extraction, Industry, Workshops, Automation Sites, and Resource Infrastructure

Industrial sites exist because resources, labour, power, transport, markets, regulation, and maintenance align. They may be household-scale, guild-scale, settlement-scale, regional, magical, realm-linked, or abandoned.

| **Design Area** | **Production Requirement**                                                                                                                          |
|-----------------|-----------------------------------------------------------------------------------------------------------------------------------------------------|
| Extraction      | Mineheads, shafts, quarries, clay pits, saltworks, logging camps, fisheries, salvage yards, mana wells, and dimensional harvest sites.              |
| Processing      | Mills, sawmills, kilns, smelteries, forges, tanneries, textile halls, alchemy works, rune works, refineries, and food processing.                   |
| Automation      | Machine halls, power stations, waterwheels, wind farms, steam works, mana plants, battery houses, control rooms, conveyors, and maintenance depots. |
| Support         | Worker housing, storage, waste, water, repair, safety, roads, rails, lifts, guards, clinics, offices, and emergency systems.                        |
| World effects   | Noise, traffic, jobs, wealth, pollution, instability, corruption, resource depletion, faction interest, sabotage, and settlement growth.            |

# 14. Trade, Markets, Warehouses, Customs, Finance, and Logistics Hubs

Trade structures connect real goods, routes, storage, permissions, taxes, contracts, reputation, faction law, security, and supply. A market should have origins for its goods and destinations for its surplus.

| **Design Area** | **Production Requirement**                                                                                                          |
|-----------------|-------------------------------------------------------------------------------------------------------------------------------------|
| Exchange        | Market squares, covered markets, auction yards, specialised bazaars, docks, caravan yards, trade halls, and travelling markets.     |
| Storage         | Warehouses, bonded stores, granaries, armories, cold stores, magical vaults, hazardous stores, project reserves, and customs holds. |
| Administration  | Customs posts, weigh houses, counting houses, contract boards, guildhalls, banks, insurers, tax offices, and dispute courts.        |
| Logistics       | Depots, sorting yards, freight stations, pack-animal facilities, carts, cranes, conveyors, portals, and warehouse ledgers.          |
| Disruption      | Embargo, blockade, theft, spoilage, route closure, war, tariffs, corruption, shortage, strike, disaster, and player intervention.   |

# 15. Roads, Trails, Causeways, Pilgrim Ways, and Surface Route Networks

Surface routes are generated as graphs serving demand and history. Major roads connect important populations and resources; minor tracks emerge from local use; abandoned routes remain as archaeology. Routes should be readable, repairable, reroutable, and capable of failure.

| **Design Area**  | **Production Requirement**                                                                                                                     |
|------------------|------------------------------------------------------------------------------------------------------------------------------------------------|
| Hierarchy        | Desire path, local trail, farm lane, village street, regional road, trunk road, military road, pilgrim way, trade road, and ceremonial avenue. |
| Route data       | Width, surface, slope, speed, users, ownership, maintenance, safety, seasonality, bridges, rest nodes, tolls, patrols, and current state.      |
| Terrain response | Contours, valleys, passes, ridges, wetlands, rivers, snow, dunes, forests, ruins, borders, danger, and cultural engineering.                   |
| Evidence         | Ruts, stones, signs, camps, shrines, milestones, bridges, cuttings, drainage, litter, patrols, caravans, and vegetation change.                |
| Dynamic state    | Busy, maintained, muddy, snowbound, flooded, collapsed, blocked, haunted, bandit-held, war-damaged, rerouted, restored, or forgotten.          |

# 16. Bridges, Fords, Ferries, Tunnels, Passes, Stairs, and Vertical Crossings

Crossings are network solutions with load, clearance, maintenance, defence, hazards, ownership, and alternatives. The generator must validate both ends and preserve a fallback route where critical progression depends on crossing.

| **Design Area**   | **Production Requirement**                                                                                                             |
|-------------------|----------------------------------------------------------------------------------------------------------------------------------------|
| Bridge forms      | Log, rope, stone arch, beam, suspension, covered, drawbridge, aqueduct bridge, rail bridge, living root, floating, and realm-specific. |
| Water crossings   | Ford, stepping stones, ferry, pontoon, barge, seasonal ice road, tide crossing, canal lock, and submerged passage.                     |
| Terrain crossings | Mountain pass, switchback, tunnel, cliff stair, elevator, cableway, ladder network, cave breach, and gravity path.                     |
| Control           | Gatehouse, toll, customs, patrol, refuge, signal, demolition point, ward, siege defence, and inspection.                               |
| Failure           | Washout, collapse, landslide, fire, ice, overload, sabotage, siege, monster occupation, portal instability, and repair project.        |

# 17. Ports, Harbours, Canals, Waterways, Lighthouses, and Marine Infrastructure

Marine infrastructure depends on coast shape, depth, tides, currents, weather, fisheries, trade, naval power, settlement form, and underwater hazards. Ports connect land routes, river systems, islands, open seas, and realm crossings.

| **Design Area** | **Production Requirement**                                                                                                              |
|-----------------|-----------------------------------------------------------------------------------------------------------------------------------------|
| Port scale      | Landing, fishing pier, river wharf, ferry port, trade harbour, naval base, shipyard, floating port, underwater dock, and realm harbour. |
| Components      | Breakwater, quay, jetty, crane, warehouse, customs, drydock, lighthouse, pilot station, market, repair yard, and rescue station.        |
| Waterways       | Navigable river, canal, lock, towpath, flood channel, barge lane, delta route, coastal route, island chain, and submerged corridor.     |
| Hazards         | Storm, tide, reef, silt, ice, piracy, sea monster, blockade, pollution, realm leak, shipwreck, and failing beacon.                      |
| Dynamic role    | Trade boom, migration, invasion, quarantine, evacuation, fishing collapse, naval conflict, reconstruction, and cultural exchange.       |

# 18. Rails, Minecarts, Deepways, Lifts, Conveyors, and Underground Transit

Underground and industrial transit supports mines, deep settlements, factories, freight, evacuation, and long-distance civilisation. It must account for ventilation, pressure, support, power, drainage, maintenance, and monsters.

| **Design Area** | **Production Requirement**                                                                                                                              |
|-----------------|---------------------------------------------------------------------------------------------------------------------------------------------------------|
| Transit forms   | Handcart track, minecart rail, freight rail, passenger rail, deepway road, conveyor corridor, pipeway, lift shaft, funicular, and portal-assisted line. |
| Stations        | Loading point, switch, depot, transfer yard, maintenance bay, refuge, customs, ventilation node, power station, and emergency exit.                     |
| Environment     | Cave stability, flooding, gas, heat, pressure, magma, roots, machine strata, buried ruins, and settlement connections.                                  |
| Ownership       | Mine, guild, settlement, government, military, construct collective, ancient network, player company, or disputed corridor.                             |
| Failure         | Cave-in, derailment, power loss, blockage, sabotage, monster nest, pressure breach, flood, corruption, and route abandonment.                           |

# 19. Skyways, Aerial Docks, Wind Routes, Floating Anchors, and High-Altitude Infrastructure

Aerial routes are physical world networks shaped by wind, altitude, weather, floating terrain, flying creatures, technology, magic, and realm law. They require safe mooring, navigation, rescue, and fallback landing plans.

| **Design Area** | **Production Requirement**                                                                                                                              |
|-----------------|---------------------------------------------------------------------------------------------------------------------------------------------------------|
| Travel          | Glider route, balloon lane, skyship corridor, winged caravan route, floating stepping chain, storm tunnel, gravity current, and portal-assisted skyway. |
| Nodes           | Cliff launch, aerie, wind tower, sky dock, mooring mast, floating anchor, weather station, rescue platform, and customs aerodrome.                      |
| Safety          | Wind forecast, beacons, lightning protection, pressure shelter, emergency landing, anti-fall systems, creature warning, and route closure.              |
| Uses            | Trade, migration, exploration, military patrol, pilgrimage, resource transport, realm access, rescue, and settlement supply.                            |
| Dynamic state   | Calm, seasonal, stormbound, contested, beaconless, anchor-damaged, creature-infested, blockaded, or rerouted.                                           |

# 20. Realm Gates, Portal Networks, Cross-Dimensional Corridors, and Route Sovereignty

Dimensional travel requires structures, anchors, permissions, maintenance, power, stabilisation, destination records, safe return, and political context. Realm gates are not anonymous teleporters.

| **Design Area** | **Production Requirement**                                                                                                                           |
|-----------------|------------------------------------------------------------------------------------------------------------------------------------------------------|
| Gate families   | Natural crossing, ancient gate, ritual gate, engineered portal, sovereign corridor, emergency breach, one-way exile gate, and pocket-realm door.     |
| Infrastructure  | Approach road, customs, quarantine, warding, stabiliser, power, destination registry, recall anchor, cargo transfer, refuge, and emergency shutdown. |
| Sovereignty     | Public, private, faction, realm sovereign, sacred, military, illegal, neutral, contested, treaty-controlled, or player-owned.                        |
| Hazards         | Misroute, time shift, contamination, invasive species, memory loss, instability, hostile destination, overload, and route collapse.                  |
| Persistence     | Gate state, paired destination, ownership, discoveries, treaties, tolls, damage, realm law, cargo rules, and closure remain saved.                   |

# 21. Magic, Mana, Wards, Ritual, Research, and Arcane Infrastructure

Magical infrastructure makes magic visible and practical. Structures control, store, transmit, teach, stabilise, regulate, or risk mana and realm forces while remaining understandable through light, sound, inscriptions, flow, and state.

| **Design Area** | **Production Requirement**                                                                                                             |
|-----------------|----------------------------------------------------------------------------------------------------------------------------------------|
| Mana            | Wells, collectors, batteries, conduits, substations, furnaces, distribution rooms, safety cutoffs, and public mana services.           |
| Wards           | Village grids, road wards, border seals, quarantine fields, anti-undead barriers, storm wards, containment, and maintenance stations.  |
| Ritual          | Circles, courts, towers, altars, participant stations, offering stores, alignment markers, observation rooms, and failure containment. |
| Research        | Mage towers, libraries, rune labs, alchemy halls, observatories, test chambers, archive vaults, and teaching institutions.             |
| Risk            | Leakage, overload, corruption, resonance, faction law, forbidden practice, public fear, maintenance debt, and ecological change.       |

# 22. Defence, Borders, Forts, Watch Networks, Refuges, and Siege Works

Defence infrastructure protects people, routes, resources, borders, services, and strategic sites. It is selected by threat, wealth, terrain, culture, law, technology, magic, faction relations, and history rather than placed around every settlement identically.

| **Design Area**  | **Production Requirement**                                                                                                                   |
|------------------|----------------------------------------------------------------------------------------------------------------------------------------------|
| Local defence    | Fence, palisade, ditch, gate, watch post, refuge, armory, alarm, patrol lodge, safe room, and ward.                                          |
| Regional defence | Fort, border keep, beacon chain, wall, pass gate, naval station, sky bastion, deepway checkpoint, and realm-gate citadel.                    |
| Siege works      | Bastion, artillery platform, supply depot, field hospital, trench, barricade, counter-mine, evacuation route, and repair yard.               |
| Border function  | Customs, quarantine, migration, treaty marker, patrol, toll, sanctuary, disputed line, smuggling route, and demilitarised zone.              |
| Aftermath        | Breach, occupation, burned district, displaced population, abandoned weapon, war memorial, minefield, reconstruction, and changed ownership. |

# 23. Shrines, Temples, Memorials, Cemeteries, Sacred Landscapes, and Pilgrimage

Sacred structures connect beliefs, communities, ancestors, realm entities, rituals, law, charity, conflict, memory, and landscape. Real supernatural effects may exist without forcing one universal interpretation.

| **Design Area** | **Production Requirement**                                                                                                                   |
|-----------------|----------------------------------------------------------------------------------------------------------------------------------------------|
| Sacred scale    | Household shrine, roadside shrine, chapel, temple, monastery, ancestor hall, cemetery, pilgrimage complex, sacred city, and realm sanctuary. |
| Services        | Worship, mourning, healing, charity, teaching, mediation, oath, burial, festival, prophecy, cleansing, and protection.                       |
| Landscape       | Sacred spring, grove, mountain, cave, battlefield, starfall site, river, giant remains, realm crossing, and worldroot.                       |
| Politics        | State religion, plural sanctuary, forbidden cult, contested holy site, pilgrimage toll, treaty ground, refuge, iconoclasm, and reform.       |
| Dynamic state   | Active, neglected, desecrated, occupied, syncretic, corrupted, restored, repurposed, disputed, or revealed as something else.                |

# 24. Knowledge, Communication, Surveying, Mapping, Archives, and Signal Networks

Knowledge infrastructure lets societies remember, coordinate, teach, map, warn, and govern. It also creates targets for theft, censorship, propaganda, disaster, restoration, and discovery.

| **Design Area**   | **Production Requirement**                                                                                                                        |
|-------------------|---------------------------------------------------------------------------------------------------------------------------------------------------|
| Knowledge sites   | School, library, archive, scriptorium, university, museum, observatory, survey office, map room, and research institute.                          |
| Communication     | Notice board, courier station, signal fire, semaphore, bell tower, rune relay, messenger roost, beacon chain, and portal message node.            |
| Mapping           | Survey tower, milestone, triangulation marker, lighthouse, star observatory, cave marker, current station, sky beacon, and realm anchor registry. |
| Information state | Public, restricted, sacred, classified, censored, lost, damaged, forged, disputed, translated, or incomplete.                                     |
| Player role       | Discover routes, restore archives, buy maps, expose lies, repair beacons, translate signs, establish surveys, or control information networks.    |

# 25. Ruins, Abandoned Sites, Restoration, Reuse, and Archaeological Layers

Ruins are previous structures in changed states, not a separate visual category. Their original function, builders, damage, occupations, ecology, remaining systems, ownership claims, and restoration potential remain traceable.

| **Design Area**    | **Production Requirement**                                                                                                                      |
|--------------------|-------------------------------------------------------------------------------------------------------------------------------------------------|
| Abandonment causes | War, famine, plague, disaster, resource exhaustion, route loss, political collapse, realm closure, monster pressure, corruption, or migration.  |
| Survival layers    | Foundations, walls, storage, signs, machines, wards, graves, roads, gardens, waste, repairs, graffiti, and later occupation.                    |
| Current use        | Empty, shelter, monster nest, bandit camp, sacred site, quarry, farm, dungeon entrance, research site, contested claim, or settlement seed.     |
| Restoration paths  | Preserve, repair, rebuild, modernise, culturally restore, repurpose, resettle, dismantle, cleanse, stabilise, or leave as memorial.             |
| Conflict           | Descendant claims, local law, archaeology, sacred status, faction occupation, private salvage, player investment, and environmental protection. |

# 26. Landmarks, Silhouettes, Environmental Evidence, and World Navigation

Landmarks support orientation before map UI. They may be built, natural, living, ruined, magical, mobile, or audible, but each has recognition distance, approach evidence, map role, cultural names, and state changes.

| **Design Area**     | **Production Requirement**                                                                                                                |
|---------------------|-------------------------------------------------------------------------------------------------------------------------------------------|
| Visual language     | Silhouette, height, colour, material, light, smoke, banners, motion, water, vegetation, weather, and terrain framing.                     |
| Auditory language   | Bells, horns, machines, falls, wind organs, creature calls, ritual tones, rail noise, harbour sounds, and distant collapse.               |
| Approach evidence   | Road quality, signs, fields, patrols, debris, footprints, trade traffic, ward markers, boats, sky beacons, and rumours.                   |
| Map role            | Local marker, regional orientation, route node, boundary, hazard, destination, wonder, safe refuge, gate, or world-scale reference.       |
| Dynamic readability | Damage, fog, storm, occupation, light failure, seasonal foliage, corruption, construction, restoration, or movement can alter visibility. |

# 27. Wonders, Monuments, Great Works, and Civilisation-Scale Projects

Wonders are rare, persistent, authored systems that combine architecture, history, function, identity, routes, resources, politics, ecology, discovery, and world effects. Some are complete, some unfinished, some ruined, and some still under construction.

| **Design Area**    | **Production Requirement**                                                                                                                       |
|--------------------|--------------------------------------------------------------------------------------------------------------------------------------------------|
| Wonder roles       | Navigation, defence, water, climate, agriculture, travel, memory, faith, research, power, realm access, prestige, containment, or world repair.  |
| Generation         | Unique or near-unique per seed; require compatible history, region, route, civilisation capability, materials, and long-term consequences.       |
| Player interaction | Visit, study, supply, repair, activate, finish, alter, claim, negotiate, defend, disable, preserve, or destroy where fiction permits.            |
| Political meaning  | National symbol, sacred trust, disputed heritage, occupied asset, public utility, private monopoly, ancient mystery, or realm treaty.            |
| Aftermath          | Opening or closing routes, changing climate, restoring water, shifting factions, attracting migration, awakening bosses, or transforming biomes. |

# 28. Megastructures, World Machines, Living Architecture, and Regional Systems

Megastructures span many chunks or regions and use hierarchical representation. Their full geometry is not always active, but their functions, ownership, damage, route effects, environmental influence, and major components persist.

| **Design Area**      | **Production Requirement**                                                                                                                                   |
|----------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Built megastructures | Continental walls, deepways, aqueduct systems, floating-city frames, world bridges, giant ports, weather towers, realm networks, and capital complexes.      |
| Living architecture  | Worldroots, grown cities, coral citadels, fungal networks, titan-shell settlements, migratory habitats, and symbiotic infrastructure.                        |
| World machines       | Climate regulators, gravity anchors, archive lattices, forge hearts, portal matrices, flood controls, and ancient automation systems.                        |
| Simulation           | Local component scenes, medium-range simplified segments, distant network records, scheduled state ticks, and explicit promotion/demotion.                   |
| Failure              | Regional service loss, disaster, route closure, migration, faction conflict, ecological change, dungeon exposure, boss awakening, and restoration campaigns. |

# 29. Mobile, Transforming, Seasonal, and Reality-Altering Structures

Not all structures are stationary. Some move, unfold, migrate, grow, phase, submerge, emerge seasonally, or reconfigure under realm laws. Their path, anchor points, inhabitants, services, collision, route impact, and save state must remain deterministic.

| **Design Area**    | **Production Requirement**                                                                                                                               |
|--------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------|
| Mobile forms       | Caravan city, walking fortress, drifting island port, migratory leviathan settlement, war train, moving market, and floating monastery.                  |
| Transforming forms | Telescoping tower, flood-season village, rotating observatory, living root gate, folding pocket complex, and machine reconfiguration.                    |
| Seasonal forms     | Ice road stations, flood markets, pilgrimage camps, harvest towns, storm refuges, migratory docks, and dormant ritual sites.                             |
| Reality-altering   | Dream architecture, void-shifted rooms, time-phased bridges, elemental terrain works, ancestral memory halls, and created-pocket structures.             |
| Safety             | Anchor validation, player relocation, multiplayer authority, vehicle/path prediction, unloaded movement, blocked-destination repair, and recovery saves. |

# 30. Construction, Supply, Maintenance, Damage, Decay, Repair, and Resilience

Structures use construction and maintenance records where their function depends on real resources and labour. The system should show visible progress and deterioration without forcing tedious upkeep on every decorative object.

| **Design Area** | **Production Requirement**                                                                                                                 |
|-----------------|--------------------------------------------------------------------------------------------------------------------------------------------|
| Construction    | Survey, claim, blueprint, site preparation, foundations, structure, services, finish, inspection, staffing, and activation.                |
| Supply          | Exact project resources, substitute tags, labour, machines, mana, tools, transport, storage, reservations, contracts, and contributions.   |
| Maintenance     | Routine, seasonal, hazard-specific, machine, magical, structural, route, sanitation, and emergency maintenance profiles.                   |
| Damage          | Wear, fire, flood, frost, heat, storm, siege, sabotage, monster, corruption, overload, subsidence, pressure, and realm instability.        |
| Resilience      | Redundancy, firebreak, drainage, shutoff, refuge, repair access, spare parts, warding, evacuation, alternate route, and disaster recovery. |

# 31. Claiming, Ownership, Permissions, Occupation, Conquest, and Repurposing

Ownership is a relationship graph, not an interact prompt. Structures may have legal owner, operator, resident, sacred custodian, military controller, claimant, tenant, occupier, public user, and maintenance authority as separate records.

| **Design Area**     | **Production Requirement**                                                                                                                          |
|---------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------|
| Claim methods       | Purchase, lease, grant, inheritance, discovery, restoration contract, settlement charter, faction reward, conquest, occupation, or illegal seizure. |
| Permissions         | Enter, reside, store, build, demolish, repair, operate, trade, automate, use magic, tax, recruit, defend, and change public access.                 |
| Occupation          | Garrison, law, supply, resistance, legitimacy, civilian use, repair, propaganda, refugees, sabotage, outside reaction, and transfer of control.     |
| Repurposing         | Home, workshop, farm, fort, museum, shrine, warehouse, school, research site, dungeon entrance, habitat, or public utility.                         |
| Conflict resolution | Law, negotiation, compensation, arbitration, revolt, siege, treaty, shared stewardship, historical proof, or abandonment.                           |

# 32. Dynamic Structure States, Settlement Change, Faction Control, and Persistent Aftermath

A structure foundation and its runtime site state remain separate. The same foundation can be active, damaged, occupied, corrupted, restored, or repurposed while retaining identity and history. State changes propagate to services, routes, NPCs, quests, ecology, economy, and presentation.

| **Design Area** | **Production Requirement**                                                                                                         |
|-----------------|------------------------------------------------------------------------------------------------------------------------------------|
| Operational     | Planned, under construction, active, undersupplied, over capacity, closed, dormant, decommissioned, or dismantled.                 |
| Physical        | Intact, worn, damaged, breached, burned, flooded, frozen, collapsed, overgrown, buried, airborne, or fragmented.                   |
| Political       | Public, private, communal, sacred, faction-held, player-held, occupied, contested, besieged, autonomous, or abandoned.             |
| Magical         | Warded, blessed, cursed, corrupted, unstable, silenced, sealed, awakened, realm-shifted, or cleansed.                              |
| Aftermath       | Repaired, restored, memorialised, modernised, resettled, converted, looted, quarantined, reclaimed by nature, or permanently lost. |

# 33. Ecology, Creatures, Dungeons, Bosses, Hazards, and World-System Integration

Structures alter habitat and threats. Roads fragment or connect ecosystems; ports spread species; ruins become nests; farms attract pests; wards redirect monsters; mines expose caverns; dams change wetlands; wonders create new biomes; and bosses may inhabit, protect, attack, or embody infrastructure.

| **Design Area**   | **Production Requirement**                                                                                                                           |
|-------------------|------------------------------------------------------------------------------------------------------------------------------------------------------|
| Ecology           | Shelter, nesting, roosting, migration corridor, barrier, artificial habitat, livestock, pests, scavengers, pollution, noise, light, and restoration. |
| Dungeon interface | Exterior identity, approach, entrance sockets, service spaces, owners, history, restoration, and route network; 24G owns encounter interior.         |
| Boss interface    | Arena sockets, siege targets, evidence structures, containment, guardian stations, titan paths, refuge, preparation works, and aftermath transforms. |
| Hazards           | Fire, flood, collapse, pressure, toxic waste, mana leak, curse, disease, structural instability, traffic, siege, and realm contamination.            |
| World response    | Settlement needs, faction goals, quests, trade, migration, law, ecology, routes, resources, map knowledge, and dynamic events update.                |

# 34. Discovery, Rumours, Names, Maps, Codex Certainty, and Player Guidance

The player can discover structures through sight, sound, roads, maps, rumours, contracts, NPC knowledge, archaeology, magical detection, trade records, or accidents. The Atlas distinguishes objective site truth from current player knowledge and cultural interpretation.

| **Design Area**  | **Production Requirement**                                                                                                                                          |
|------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Discovery levels | Unknown, rumoured, approximate, sighted, visited, entered, surveyed, understood, owned, restored, and historically resolved.                                        |
| Names            | Builder name, current official name, local name, old name, faction name, map label, scholarly designation, secret name, and player rename where allowed.            |
| Map data         | Position certainty, footprint, entrances, services, routes, ownership, danger, access, state, vertical layers, realm link, and date of information.                 |
| Rumours          | True, outdated, partial, biased, mythic, propaganda, misidentified, deliberately false, or generated from observed events.                                          |
| Guidance         | Environmental signs, route markers, skyline, lights, traffic, NPC directions, Codex, accessibility cues, and optional objective support without fixed markers only. |

# 35. Traversal, Accessibility, Safety, Comfort, and Multiplayer Use

Structures and routes must support readable traversal, alternative access, controller use, split-screen, comfort settings, varied movement abilities, and recovery. Accessibility is designed into grammar and validation rather than added after construction.

| **Design Area** | **Production Requirement**                                                                                                                                 |
|-----------------|------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Physical access | Door widths, slopes, stairs, ramps, lifts, clearances, handholds, rest points, swimming alternatives, glider landings, and vehicle paths.                  |
| Readability     | Contrast, lighting, signs, sound cues, map symbols, colour-independent states, landmark silhouettes, route hierarchy, and hazard warnings.                 |
| Safety          | Spawn exclusion, fall protection, breathable refuges, emergency exits, retreat routes, safe loading, portal recovery, and blocked-path repair.             |
| Comfort         | Camera clearance, motion reduction, screen effects, flashing limits, audio alternatives, height/fall settings, route assist, and simplified navigation.    |
| Multiplayer     | Shared discovery with individual knowledge, ownership permissions, contribution, construction authority, route use, local-player UI, and reconnect safety. |

# 36. Detailed Overworld Structure and Landmark Foundation Registry v0.1

The following 96 authored foundations are production content families rather than guaranteed sites. Seeds select compatible entries, apply culture, environment, history, and state variants, and may omit or repeat non-unique families within density and repetition budgets. Stable IDs are preliminary and should be finalised in 24L.

| **Preliminary Stable ID**                             | **Foundation**        | **Family**  | **World Role and Key Connections**                                                                        |
|-------------------------------------------------------|-----------------------|-------------|-----------------------------------------------------------------------------------------------------------|
| structure.overworld.civic.assembly_house              | Assembly House        | Civic       | Government, meetings, public notices, disputes, projects, and crisis coordination.                        |
| structure.overworld.civic.public_granary              | Public Granary        | Civic       | Food reserve, tax storage, famine response, project supply, and trade stabilisation.                      |
| structure.overworld.civic.communal_kitchen            | Communal Kitchen      | Civic       | Meals, festivals, relief, household overflow, cultural recipes, and emergency feeding.                    |
| structure.overworld.civic.infirmary                   | Civic Infirmary       | Civic       | Treatment, medicine storage, triage, public health, training, and disaster response.                      |
| structure.overworld.civic.schoolhouse                 | Schoolhouse           | Civic       | Children and adult teaching, apprenticeships, literacy, local history, and civic events.                  |
| structure.overworld.civic.public_bathhouse            | Public Bathhouse      | Civic       | Hygiene, social life, heating, water infrastructure, and culture-specific ritual use.                     |
| structure.overworld.civic.archive_hall                | Archive Hall          | Civic       | Records, maps, law, genealogy, projects, ownership, and historical evidence.                              |
| structure.overworld.civic.refuge_hall                 | Refuge Hall           | Civic       | Evacuation, disaster shelter, travellers, refugees, emergency stores, and public safety.                  |
| structure.overworld.agriculture.fieldstead            | Fieldstead            | Agriculture | Mixed farm cluster with house, barns, storage, water, tools, and seasonal labour.                         |
| structure.overworld.agriculture.terrace_farm          | Terrace Farm          | Agriculture | Slope agriculture with retaining walls, irrigation, stairs, erosion control, and crop variants.           |
| structure.overworld.agriculture.orchard_house         | Orchard House         | Agriculture | Fruit or nut production, grafting, storage, pollinator habitat, and seasonal festivals.                   |
| structure.overworld.agriculture.irrigation_station    | Irrigation Station    | Agriculture | Canal control, pumps, gates, water rights, maintenance, and drought or flood management.                  |
| structure.overworld.agriculture.pasture_station       | Pasture Station       | Agriculture | Herd management, shelter, feed, veterinary care, migration, fencing, and trade.                           |
| structure.overworld.agriculture.greenhouse_complex    | Greenhouse Complex    | Agriculture | Climate-controlled crops, rare plants, magic and automation hooks, and high maintenance.                  |
| structure.overworld.agriculture.seed_vault            | Seed Vault            | Agriculture | Crop diversity, disaster recovery, research, cultural heritage, and protected storage.                    |
| structure.overworld.agriculture.forest_steward_lodge  | Forest Steward Lodge  | Agriculture | Nursery, firebreaks, coppice, logging regulation, wildlife corridors, and replanting.                     |
| structure.overworld.industry.logging_camp             | Logging Camp          | Industry    | Timber extraction, temporary housing, saw storage, routes, replanting, and forest pressure.               |
| structure.overworld.industry.quarry_complex           | Quarry Complex        | Industry    | Stone extraction, lifts, spoil, cutting yard, roads, safety, and later restoration.                       |
| structure.overworld.industry.minehead_complex         | Minehead Complex      | Industry    | Shaft access, hoists, rails, storage, drainage, guards, and dungeon or deepway sockets.                   |
| structure.overworld.industry.smeltery                 | Smeltery              | Industry    | Ore processing, fuel, slag, ventilation, workers, transport, pollution, and repair.                       |
| structure.overworld.industry.sawmill                  | Sawmill               | Industry    | Water, wind, or mechanical wood processing, timber storage, sawdust, routes, and fire risk.               |
| structure.overworld.industry.clayworks                | Clayworks             | Industry    | Clay pit, settling, kiln, brick and tile production, water use, and trade.                                |
| structure.overworld.industry.saltworks                | Saltworks             | Industry    | Evaporation, mining, boiling, preservation economy, hazardous labour, and strategic trade.                |
| structure.overworld.industry.mana_refinery            | Mana Refinery         | Industry    | Crystal processing, purity control, dust and cores, conduits, overload, regulation, and mage industry.    |
| structure.overworld.commerce.market_square            | Market Square         | Commerce    | Daily exchange, stalls, notices, performances, shortages, festivals, and faction presence.                |
| structure.overworld.commerce.covered_bazaar           | Covered Bazaar        | Commerce    | Weather-protected specialised trade, guilds, culture goods, security, and social space.                   |
| structure.overworld.commerce.caravanserai             | Caravanserai          | Commerce    | Travellers, animals, wagons, lodging, trade, repair, customs, and route knowledge.                        |
| structure.overworld.commerce.regional_warehouse       | Regional Warehouse    | Commerce    | Bulk storage, categories, permissions, automation ports, ledgers, and project reserves.                   |
| structure.overworld.commerce.customs_post             | Customs Post          | Commerce    | Border or port inspection, tax, quarantine, contraband, law, and faction authority.                       |
| structure.overworld.commerce.counting_house           | Counting House        | Commerce    | Contracts, currency, credit, insurance, records, and trade-faction quests.                                |
| structure.overworld.commerce.auction_yard             | Auction Yard          | Commerce    | Bulk goods, livestock, salvage, relic disputes, public price discovery, and crime risks.                  |
| structure.overworld.commerce.bonded_vault             | Bonded Vault          | Commerce    | High-security goods, relics, taxes, faction seals, magical storage, and heist hooks.                      |
| structure.overworld.navigation.wayhouse               | Wayhouse              | Navigation  | Road shelter, food, stables, repair, rumours, maps, and emergency refuge.                                 |
| structure.overworld.navigation.milestone_chain        | Milestone Chain       | Navigation  | Distance, direction, authority, maintenance, historical names, and route readability.                     |
| structure.overworld.navigation.toll_gate              | Toll Gate             | Navigation  | Road control, fees, inspection, law, traffic counting, and political conflict.                            |
| structure.overworld.navigation.roadside_shrine        | Roadside Shrine       | Navigation  | Rest, safety, offerings, local faith, traveller rumours, and route identity.                              |
| structure.overworld.navigation.switchback_station     | Switchback Station    | Navigation  | Mountain route rest, animals, repairs, avalanche warning, and freight transfer.                           |
| structure.overworld.navigation.ferry_landing          | Ferry Landing         | Navigation  | Boat transfer, waiting, storage, toll, water-level adaptation, and route continuity.                      |
| structure.overworld.navigation.bridgehouse            | Bridgehouse           | Navigation  | Crossing control, maintenance, toll, refuge, defence, and flood monitoring.                               |
| structure.overworld.navigation.survey_tower           | Survey Tower          | Navigation  | Mapping, triangulation, weather, signals, route planning, and landmark visibility.                        |
| structure.overworld.defence.watchtower                | Watchtower            | Defence     | Observation, warning, patrol, shelter, signal, local defence, and route oversight.                        |
| structure.overworld.defence.gatehouse                 | Gatehouse             | Defence     | Settlement or border access, law, inspection, defence, traffic, and siege interaction.                    |
| structure.overworld.defence.palisade_fort             | Palisade Fort         | Defence     | Frontier garrison, refuge, stores, patrols, construction growth, and faction pressure.                    |
| structure.overworld.defence.border_keep               | Border Keep           | Defence     | Regional military, customs, diplomacy, prisons, signals, and contested control.                           |
| structure.overworld.defence.beacon_station            | Beacon Station        | Defence     | Visible warning chain, communication, navigation, maintenance, and event response.                        |
| structure.overworld.defence.patrol_lodge              | Patrol Lodge          | Defence     | Guards, rangers, scouts, mounts, supplies, maps, and route safety.                                        |
| structure.overworld.defence.civic_armory              | Civic Armory          | Defence     | Guard equipment, emergency issue, repair, training, law, and raid readiness.                              |
| structure.overworld.defence.refuge_bastion            | Refuge Bastion        | Defence     | Civilian shelter, stores, healing, wards, evacuation, and disaster or siege endurance.                    |
| structure.overworld.magic.wardstone_circle            | Wardstone Circle      | Magic       | Area protection, maintenance, mana supply, ritual access, threat redirection, and failure states.         |
| structure.overworld.magic.mana_well                   | Mana Well             | Magic       | Natural or engineered mana access, purification, public supply, law, ecology, and overload.               |
| structure.overworld.magic.rune_workshop               | Rune Workshop         | Magic       | Rune crafting, teaching, machine control, repairs, storage, and cultural variation.                       |
| structure.overworld.magic.leyline_observatory         | Leyline Observatory   | Magic       | Mana mapping, forecasts, research, route planning, rituals, and anomaly warnings.                         |
| structure.overworld.magic.ritual_court                | Ritual Court          | Magic       | Public or restricted ceremonies, participants, offerings, world effects, and containment.                 |
| structure.overworld.magic.cleansing_house             | Cleansing House       | Magic       | Corruption treatment, quarantine, ritual, medicine, reputation, and public fear.                          |
| structure.overworld.magic.portal_sanctuary            | Portal Sanctuary      | Magic       | Small gate, stabilisation, travellers, warding, destination records, and safe return.                     |
| structure.overworld.magic.spell_archive               | Spell Archive         | Magic       | Books, tablets, research, teaching, restricted knowledge, preservation, and theft.                        |
| structure.overworld.culture.public_library            | Public Library        | Culture     | Books, maps, local knowledge, teaching, quests, and information access.                                   |
| structure.overworld.culture.scriptorium               | Scriptorium           | Culture     | Copying, translation, records, illuminated texts, employment, and cultural exchange.                      |
| structure.overworld.culture.theatre_house             | Theatre House         | Culture     | Performance, politics, festivals, propaganda, leisure, and cultural identity.                             |
| structure.overworld.culture.festival_ground           | Festival Ground       | Culture     | Markets, games, rituals, gatherings, seasonal structures, and emergency assembly.                         |
| structure.overworld.culture.monument_plaza            | Monument Plaza        | Culture     | Memory, legitimacy, protest, ceremony, orientation, and contested history.                                |
| structure.overworld.culture.local_museum              | Local Museum          | Culture     | Artifacts, archaeology, education, ownership disputes, and tourism.                                       |
| structure.overworld.culture.conservatory              | Conservatory          | Culture     | Music, art, botanical display, magical performance, teaching, and prestige.                               |
| structure.overworld.culture.language_house            | Language House        | Culture     | Translation, teaching, diplomacy, archives, migrant support, and naming records.                          |
| structure.overworld.marine.fishing_pier               | Fishing Pier          | Marine      | Small boats, catches, storage, repair, weather, local trade, and marine ecology.                          |
| structure.overworld.marine.trade_harbour              | Trade Harbour         | Marine      | Quays, cranes, warehouses, customs, markets, routes, and regional commerce.                               |
| structure.overworld.marine.lighthouse                 | Lighthouse            | Marine      | Navigation, warning, weather, signals, route ownership, and landmark identity.                            |
| structure.overworld.marine.drydock                    | Drydock               | Marine      | Ship construction and repair, timber and metal demand, labour, pollution, and military hooks.             |
| structure.overworld.marine.canal_lock                 | Canal Lock            | Marine      | Water-level transfer, maintenance, tolls, freight, sabotage, and flood control.                           |
| structure.overworld.marine.floodgate                  | Floodgate             | Marine      | Settlement defence, irrigation, navigation, emergency management, and ecological consequences.            |
| structure.overworld.marine.watermill                  | Watermill             | Marine      | Mechanical power, grain or timber processing, river rights, maintenance, and route landmark.              |
| structure.overworld.marine.reef_station               | Reef Station          | Marine      | Navigation, fishing, research, rescue, underwater access, and coral protection or conflict.               |
| structure.overworld.sky.cliff_lift                    | Cliff Lift            | Sky         | Vertical freight and passenger movement, power, maintenance, emergency stairs, and defence.               |
| structure.overworld.sky.sky_dock                      | Sky Dock              | Sky         | Gliders and airships, cargo, customs, weather, mooring, rescue, and aerial route links.                   |
| structure.overworld.sky.wind_tower                    | Wind Tower            | Sky         | Power, weather observation, navigation, communication, and regional silhouette.                           |
| structure.overworld.sky.glider_station                | Glider Station        | Sky         | Launch, landing, repairs, training, route maps, safety, and mountain access.                              |
| structure.overworld.sky.mountain_cableway             | Mountain Cableway     | Sky         | Freight and passenger baskets, stations, support towers, power, and avalanche hazards.                    |
| structure.overworld.sky.floating_anchor               | Floating Anchor       | Sky         | Stabilises island, dock, bridge, or structure; power, realm law, damage, and major consequences.          |
| structure.overworld.sky.storm_shelter                 | High Storm Shelter    | Sky         | Pressure and lightning refuge, emergency stores, route safety, and weather events.                        |
| structure.overworld.sky.observation_aerie             | Observation Aerie     | Sky         | Sky survey, creature tracking, signals, research, patrols, and landmark use.                              |
| structure.overworld.underground.deepway_station       | Deepway Station       | Underground | Road and rail transfer, rest, storage, maps, guards, ventilation, and regional connection.                |
| structure.overworld.underground.cavern_market         | Cavern Market         | Underground | Underground trade, light, water, security, cultural exchange, and route activity.                         |
| structure.overworld.underground.underground_reservoir | Underground Reservoir | Underground | Water storage, pressure, purification, settlement supply, and flood risk.                                 |
| structure.overworld.underground.ventilation_tower     | Ventilation Tower     | Underground | Air exchange, smoke and gas control, surface landmark, maintenance, and sabotage risk.                    |
| structure.overworld.underground.rail_depot            | Deep Rail Depot       | Underground | Freight, passengers, repairs, switches, power, ownership, and mine or settlement service.                 |
| structure.overworld.underground.forge_hall            | Deep Forge Hall       | Underground | Heat, metal, industry, culture, power, ventilation, and magma or deep resource links.                     |
| structure.overworld.underground.root_bridge           | Worldroot Bridge      | Underground | Living crossing, ecology, maintenance, sacred claims, growth, and damage states.                          |
| structure.overworld.underground.pressure_refuge       | Deep Pressure Refuge  | Underground | Safe air and pressure, emergency stores, medical aid, route recovery, and deep exploration.               |
| structure.overworld.special.standing_stone_field      | Standing Stone Field  | Special     | Ancient boundary, calendar, ritual, archaeology, route marker, and disputed interpretation.               |
| structure.overworld.special.titan_ribway              | Titan Ribway          | Special     | Colossal remains used as road, shelter, shrine, resource, ecology, and landmark.                          |
| structure.overworld.special.machine_obelisk           | Machine Obelisk       | Special     | Ancient signal, control node, map marker, puzzle, threat, and world-machine interface.                    |
| structure.overworld.special.starfall_beacon           | Starfall Beacon       | Special     | Meteor site navigation, magical research, rare resources, pilgrimage, and hazard.                         |
| structure.overworld.special.ruined_aqueduct           | Ruined Aqueduct       | Special     | Historical water network, route landmark, restoration project, dungeon sockets, and settlement potential. |
| structure.overworld.special.sealed_observatory        | Sealed Observatory    | Special     | Ancient research, maps, sky and realm knowledge, locked systems, and restoration.                         |
| structure.overworld.special.memory_monument           | Memory Monument       | Special     | Names, history, ancestral or magical recording, political conflict, and Codex discovery.                  |
| structure.overworld.special.realm_scar_marker         | Realm Scar Marker     | Special     | Warns of dimensional instability, records events, anchors monitoring, and guides containment.             |

# 37. Detailed Route and Infrastructure Foundation Registry v0.1

These 48 route foundations define network behaviour and presentation. A generated route receives endpoints, users, ownership, surface or medium, capacity, maintenance, hazards, signs, state, and history. It is not a free-floating spline.

| **Preliminary Stable ID**             | **Route Foundation**    | **Family** | **Function and State Hooks**                                                              |
|---------------------------------------|-------------------------|------------|-------------------------------------------------------------------------------------------|
| route.surface.desire_path             | Desire Path             | Surface    | Unplanned local foot traffic; evolves, fades, and reveals daily movement.                 |
| route.surface.local_trail             | Local Trail             | Surface    | Walking and pack route between nearby homes, farms, woods, and minor sites.               |
| route.surface.farm_lane               | Farm Lane               | Surface    | Carts, livestock, drainage, fields, storage, and seasonal mud.                            |
| route.surface.village_street          | Village Street          | Surface    | Public frontage, services, drainage, traffic, markets, lighting, and law.                 |
| route.surface.regional_road           | Regional Road           | Surface    | Settlements, trade, patrols, maintenance, bridges, wayhouses, and danger.                 |
| route.surface.paved_trunk_road        | Paved Trunk Road        | Surface    | High-capacity long-distance route with milestones, stations, taxes, and state power.      |
| route.surface.pilgrim_way             | Pilgrim Way             | Surface    | Sacred destinations, shrines, hospitality, festivals, and cultural traffic.               |
| route.surface.military_road           | Military Road           | Surface    | Fast troop and supply movement, forts, depots, strategic control, and war aftermath.      |
| route.crossing.seasonal_ford          | Seasonal Ford           | Crossing   | Low-water crossing with flood closures and nearby alternatives.                           |
| route.crossing.stone_arch_bridge      | Stone Arch Bridge       | Crossing   | Durable public crossing, maintenance, toll, defence, and historic layers.                 |
| route.crossing.rope_suspension_bridge | Rope Suspension Bridge  | Crossing   | Light mountain or jungle crossing with wind, load, and repair risk.                       |
| route.crossing.drawbridge_crossing    | Drawbridge Crossing     | Crossing   | Fortified route with access control, siege use, and water or ditch interface.             |
| route.crossing.switchback_pass        | Switchback Pass         | Crossing   | Mountain road with rest nodes, hazards, views, and seasonal closure.                      |
| route.crossing.road_tunnel            | Road Tunnel             | Crossing   | Terrain shortcut with ventilation, lighting, maintenance, collapse, and ambush risk.      |
| route.crossing.cliff_stair            | Cliff Stair             | Crossing   | Pedestrian vertical route, landings, refuges, cultural engineering, and fall safety.      |
| route.crossing.public_ferry_route     | Public Ferry Route      | Crossing   | Scheduled water transfer with boats, landings, toll, weather, and capacity.               |
| route.water.river_barge_lane          | River Barge Lane        | Water      | Freight and passenger corridor using currents, towpaths, docks, and seasonal depth.       |
| route.water.canal_route               | Canal Route             | Water      | Engineered freight and water corridor with locks, maintenance, rights, and ecology.       |
| route.water.delta_channel_route       | Delta Channel Route     | Water      | Branching local water network with pilots, silt, tides, and settlements.                  |
| route.water.coastal_shipping_lane     | Coastal Shipping Lane   | Water      | Port-to-port route using landmarks, weather windows, rescue, and piracy risk.             |
| route.water.island_hop_route          | Island-Hop Route        | Water      | Short open-water legs with anchorages, ferries, trade, and cultural exchange.             |
| route.water.open_sea_route            | Open-Sea Route          | Water      | Long-distance navigation by stars, magic, charts, currents, and high danger.              |
| route.water.submerged_corridor        | Submerged Corridor      | Water      | Underwater passage for diving, aquatic peoples, vessels, or magic infrastructure.         |
| route.water.ice_road                  | Seasonal Ice Road       | Water      | Temporary winter route requiring monitoring, markers, shelters, and closure logic.        |
| route.industrial.minecart_line        | Minecart Line           | Industrial | Early ore and worker transport between mine, processing, storage, and settlement.         |
| route.industrial.freight_rail         | Freight Rail            | Industrial | Heavy regional goods movement, stations, switches, maintenance, and strategic value.      |
| route.industrial.passenger_rail       | Passenger Rail          | Industrial | Scheduled civilian travel with stations, tickets, safety, and settlement growth.          |
| route.industrial.conveyor_causeway    | Conveyor Causeway       | Industrial | Visible item transport across terrain with power, supports, filters, and raid risk.       |
| route.industrial.pipeline_corridor    | Pipeline Corridor       | Industrial | Fluid or gas movement, valves, pressure, maintenance, leakage, and regulation.            |
| route.industrial.mana_conduit_way     | Mana Conduit Way        | Industrial | Power transmission corridor with substations, warding, overload, and public impact.       |
| route.industrial.deepway              | Deepway                 | Industrial | Long underground road or rail spine connecting deep settlements, mines, and ruins.        |
| route.industrial.golem_road           | Golem Road              | Industrial | Reinforced logistics route designed for construct labour, freight, charging, and control. |
| route.sky.ridge_glider_route          | Ridge Glider Route      | Sky        | Wind-assisted travel between high points with launch and landing stations.                |
| route.sky.balloon_lane                | Balloon Lane            | Sky        | Slow buoyant cargo or passenger corridor with moorings and weather limits.                |
| route.sky.skyship_corridor            | Skyship Corridor        | Sky        | Long-distance aerial trade with beacons, customs, rescue, and storm routing.              |
| route.sky.winged_caravan_route        | Winged Caravan Route    | Sky        | Migration and trade path for flying travellers, mounts, and rest aeries.                  |
| route.sky.floating_step_chain         | Floating Step Chain     | Sky        | Short hops between stable floating fragments, bridges, and anchor points.                 |
| route.sky.storm_tunnel                | Storm Tunnel            | Sky        | Rare safe current through dangerous weather controlled by forecast and infrastructure.    |
| route.sky.gravity_current             | Gravity Current Route   | Sky        | Realm or magic-assisted movement following mapped directional forces.                     |
| route.sky.aerial_military_lane        | Aerial Military Lane    | Sky        | Patrolled strategic route linking forts, warning towers, and supply bases.                |
| route.realm.stabilised_gate_link      | Stabilised Gate Link    | Realm      | Paired engineered portals with power, customs, safe return, and maintenance.              |
| route.realm.ritual_pilgrim_corridor   | Ritual Pilgrim Corridor | Realm      | Timed or ceremonial realm travel controlled by rites and sacred sites.                    |
| route.realm.dream_bridge              | Dream Bridge            | Realm      | Somnolent route tied to sleep, memory, anchors, and shifting destination certainty.       |
| route.realm.ancestral_ferry           | Ancestral Ferry         | Realm      | Veil route using guides, names, offerings, memory, and return obligations.                |
| route.realm.void_anchor_chain         | Void Anchor Chain       | Realm      | Spatial route between protected anchors with severe failure consequences.                 |
| route.realm.elemental_transit_ring    | Elemental Transit Ring  | Realm      | Confluence route cycling through stabilised elemental states and stations.                |
| route.realm.pocket_recall_link        | Pocket Recall Link      | Realm      | Created-pocket access with owner permissions, recall, boundaries, and recovery.           |
| route.realm.sovereign_corridor        | Sovereign Corridor      | Realm      | Realm-authority route governed by treaty, guardian, law, toll, or judgement.              |

# 38. Detailed Realm Structure Foundation Registry v0.1

Each major realm receives at least five distinct structural foundations linked to its laws, societies, routes, ecology, dungeons, guardians, and overworld utility. These 60 entries are foundations, not the complete final realm asset list.

| **Preliminary Stable ID**                                | **Realm**             | **Foundation**             | **Realm Function and Connections**                                                            |
|----------------------------------------------------------|-----------------------|----------------------------|-----------------------------------------------------------------------------------------------|
| structure.realm.verdant_covenant.living_court            | Verdant Covenant      | Living Court               | Civic and diplomatic structure grown from responsive plants and seasonal law.                 |
| structure.realm.verdant_covenant.seed_library            | Verdant Covenant      | Seed Library               | Ecological archive, crop knowledge, restoration, and protected living collections.            |
| structure.realm.verdant_covenant.thorn_gate              | Verdant Covenant      | Thorn Gate                 | Defensive and ceremonial crossing that grows, recognises permissions, and can wound invaders. |
| structure.realm.verdant_covenant.rootway_station         | Verdant Covenant      | Rootway Station            | Travel, freight, and communication through living root networks.                              |
| structure.realm.verdant_covenant.seasonal_confluence     | Verdant Covenant      | Seasonal Confluence        | Ritual and public-works site that shifts services and form with seasonal authority.           |
| structure.realm.ancestral_veil.memory_hall               | Ancestral Veil        | Memory Hall                | Records names, testimony, lineage, oaths, and disputed histories.                             |
| structure.realm.ancestral_veil.lantern_ferry             | Ancestral Veil        | Lantern Ferry              | Guided crossing for travellers, spirits, and messages through safe memory routes.             |
| structure.realm.ancestral_veil.oath_cairn                | Ancestral Veil        | Oath Cairn                 | Law, treaty, remembrance, binding, and consequence site.                                      |
| structure.realm.ancestral_veil.mourning_archive          | Ancestral Veil        | Mourning Archive           | Grief, records, reconciliation, ancestor knowledge, and missing-person quests.                |
| structure.realm.ancestral_veil.veil_gate                 | Ancestral Veil        | Veil Gate                  | Protected route anchor controlling passage between living and ancestral spaces.               |
| structure.realm.somnolent_expanse.dream_hostel           | Somnolent Expanse     | Dream Hostel               | Safe sleep, shared dream travel, memory care, and traveller recovery.                         |
| structure.realm.somnolent_expanse.lucid_beacon           | Somnolent Expanse     | Lucid Beacon               | Navigation and rescue landmark stabilising local dream geography.                             |
| structure.realm.somnolent_expanse.nightmare_quarantine   | Somnolent Expanse     | Nightmare Quarantine House | Containment, treatment, research, and public fear around invasive nightmares.                 |
| structure.realm.somnolent_expanse.memory_theatre         | Somnolent Expanse     | Memory Theatre             | Shared performance, testimony, training, propaganda, and altered-history puzzles.             |
| structure.realm.somnolent_expanse.sleeproad_junction     | Somnolent Expanse     | Sleeproad Junction         | Transfer station between dream routes, anchors, travellers, and shifting destinations.        |
| structure.realm.aetheric_reach.cloud_dock                | Aetheric Reach        | Cloud Dock                 | Skyship and winged-traveller port with weather, mooring, freight, and rescue.                 |
| structure.realm.aetheric_reach.wind_spire                | Aetheric Reach        | Wind Spire                 | Power, navigation, weather control, communication, and landmark.                              |
| structure.realm.aetheric_reach.stormbreak_citadel        | Aetheric Reach        | Stormbreak Citadel         | Fortress and refuge protecting routes and settlements from storm entities.                    |
| structure.realm.aetheric_reach.floating_farm             | Aetheric Reach        | Floating Farm              | High-altitude cultivation, water capture, anchors, and trade.                                 |
| structure.realm.aetheric_reach.sky_anchor_foundry        | Aetheric Reach        | Sky Anchor Foundry         | Builds and repairs gravity anchors, docks, bridges, and floating infrastructure.              |
| structure.realm.impossible_deep.pressure_refuge          | Impossible Deep       | Pressure Refuge            | Safe pressure, air, medicine, emergency stores, and route recovery.                           |
| structure.realm.impossible_deep.seismic_forge            | Impossible Deep       | Seismic Forge              | Uses controlled deep vibration and heat for rare materials and infrastructure.                |
| structure.realm.impossible_deep.abyssal_lift             | Impossible Deep       | Abyssal Lift               | Long vertical transit with pressure stages, freight, safety, and failure risk.                |
| structure.realm.impossible_deep.deep_current_port        | Impossible Deep       | Deep Current Port          | Marine and deep transit, cargo, rescue, and pressure-adapted settlement service.              |
| structure.realm.impossible_deep.resonance_observatory    | Impossible Deep       | Resonance Observatory      | Maps seismic, acoustic, creature, and world-depth conditions.                                 |
| structure.realm.world_engine.logic_depot                 | World-Engine          | Logic Depot                | Transit, maintenance, task assignment, machine authority, and route control.                  |
| structure.realm.world_engine.gear_cathedral              | World-Engine          | Gear Cathedral             | Civic and ritual machine space embodying local systems and ideology.                          |
| structure.realm.world_engine.archive_node                | World-Engine          | Archive Node               | Data, maps, identity records, procedures, and corrupted knowledge.                            |
| structure.realm.world_engine.repair_foundry              | World-Engine          | Repair Foundry             | Construct and infrastructure maintenance, salvage, fabrication, and labour politics.          |
| structure.realm.world_engine.transit_lattice             | World-Engine          | Transit Lattice Hub        | Multi-mode machine route junction connecting belts, rails, lifts, and portals.                |
| structure.realm.ashen_lower_realms.ember_customs         | Ashen Lower Realms    | Ember Customs House        | Gate law, contracts, tariffs, quarantine, and political entry.                                |
| structure.realm.ashen_lower_realms.contract_hall         | Ashen Lower Realms    | Contract Hall              | Negotiation, binding agreements, disputes, loopholes, and faction power.                      |
| structure.realm.ashen_lower_realms.furnace_citadel       | Ashen Lower Realms    | Furnace Citadel            | Industry, defence, heat management, population, and strategic fuel.                           |
| structure.realm.ashen_lower_realms.ash_road_station      | Ashen Lower Realms    | Ash Road Station           | Safe travel, cooling, supplies, escorts, and route maintenance.                               |
| structure.realm.ashen_lower_realms.cooling_sanctuary     | Ashen Lower Realms    | Cooling Sanctuary          | Recovery, medicine, water, truce, and protection from extreme heat.                           |
| structure.realm.void_between.anchor_bastion              | Void Between          | Anchor Bastion             | Stabilises local space, shelters travellers, and defends route anchors.                       |
| structure.realm.void_between.rift_observatory            | Void Between          | Rift Observatory           | Maps spatial change, predicts collapse, and supports safe navigation.                         |
| structure.realm.void_between.null_shelter                | Void Between          | Null Shelter               | Protected refuge against memory, magic, pressure, and reality loss.                           |
| structure.realm.void_between.memory_vault                | Void Between          | Memory Vault               | Preserves identity, maps, names, contracts, and recovery data.                                |
| structure.realm.void_between.shardway_dock               | Void Between          | Shardway Dock              | Transfer node between anchored fragments, vessels, and portal routes.                         |
| structure.realm.divine_concords.pilgrim_terrace          | Divine Concords       | Pilgrim Terrace            | Hospitality, ritual, judgement, trade, and gathering for multiple traditions.                 |
| structure.realm.divine_concords.concord_court            | Divine Concords       | Concord Court              | Treaty, law, mediation, divine interpretation, and sovereign politics.                        |
| structure.realm.divine_concords.relic_treasury           | Divine Concords       | Relic Treasury             | Custody, research, display, conflict, and public legitimacy.                                  |
| structure.realm.divine_concords.trial_gate               | Divine Concords       | Trial Gate                 | Conditional access structure with tests, witnesses, alternate outcomes, and appeals.          |
| structure.realm.divine_concords.blessing_aqueduct        | Divine Concords       | Blessing Aqueduct          | Water and public utility carrying regulated beneficial effects and political control.         |
| structure.realm.necropolis_domains.mausoleum_district    | Necropolis Domains    | Mausoleum District         | Housing, memory, burial, citizenship, and social continuity for death-linked societies.       |
| structure.realm.necropolis_domains.soul_registry         | Necropolis Domains    | Soul Registry              | Identity, consent, inheritance, legal status, and anti-exploitation records.                  |
| structure.realm.necropolis_domains.boneway_station       | Necropolis Domains    | Boneway Station            | Transit and freight through necropolis routes with maintenance and ritual safeguards.         |
| structure.realm.necropolis_domains.quietus_garden        | Necropolis Domains    | Quietus Garden             | Rest, mourning, ecology, reconciliation, and peaceful transition.                             |
| structure.realm.necropolis_domains.mortuary_foundry      | Necropolis Domains    | Mortuary Foundry           | Ethically regulated preservation, construct work, repair, and forbidden-practice conflict.    |
| structure.realm.elemental_confluences.confluence_station | Elemental Confluences | Confluence Station         | Safe transfer between elemental zones, routes, workers, and materials.                        |
| structure.realm.elemental_confluences.flame_reservoir    | Elemental Confluences | Flame Reservoir            | Stores and regulates heat or fire power for settlement and industry.                          |
| structure.realm.elemental_confluences.tidal_stair        | Elemental Confluences | Tidal Stair                | Water-level route and civic work shifting with elemental currents.                            |
| structure.realm.elemental_confluences.storm_harvester    | Elemental Confluences | Storm Harvester            | Captures wind and lightning energy with major risk and environmental effect.                  |
| structure.realm.elemental_confluences.stoneheart_hall    | Elemental Confluences | Stoneheart Hall            | Stable civic, storage, refuge, and diplomatic centre within shifting elements.                |
| structure.realm.created_pockets.control_nexus            | Created Pockets       | Pocket Control Nexus       | Owner permissions, environment rules, safety, expansion, and shutdown.                        |
| structure.realm.created_pockets.boundary_anchor          | Created Pockets       | Boundary Anchor            | Defines pocket limits, stability, access, and failure recovery.                               |
| structure.realm.created_pockets.modular_habitat          | Created Pockets       | Modular Habitat            | Reconfigurable residence, work, storage, and experimentation.                                 |
| structure.realm.created_pockets.recall_gate              | Created Pockets       | Recall Gate                | Return safety, emergency extraction, permissions, and destination records.                    |
| structure.realm.created_pockets.scenario_workshop        | Created Pockets       | Scenario Workshop          | Builds tests, farms, vaults, prisons, simulations, or sanctuaries under explicit rules.       |

# 39. Detailed Wonder and Megastructure Foundation Registry v0.1

The following 24 foundations establish wonder-scale variety. Seeds should normally select a small subset, attach histories and owners, and validate regional function, routes, visibility, consequences, and uniqueness. Several may exist only as ruins, unfinished works, dormant systems, or long-term construction projects.

| **Preliminary Stable ID**                         | **Foundation**                 | **Environment**              | **World Function and Persistent Consequences**                                                                           |
|---------------------------------------------------|--------------------------------|------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| wonder.overworld.worldroot_crown                  | Worldroot Crown                | Overworld / living           | A colossal root-and-canopy infrastructure regulating water, travel, settlement, ecology, and realm contact.              |
| wonder.overworld.thousand_arch_skybridge          | Skybridge of a Thousand Arches | Overworld / aerial           | A regional high bridge linking mountains or floating terrain, with stations, weather control, and contested maintenance. |
| wonder.overworld.great_tidewall                   | Great Tidewall                 | Overworld / coastal          | Massive flood and storm defence supporting ports, farms, cities, ecology, and political legitimacy.                      |
| wonder.overworld.singing_mountain                 | Singing Mountain Observatory   | Overworld / highland         | Resonant mountain-scale observatory and beacon revealing weather, leylines, deep events, and realm routes.               |
| wonder.overworld.atlas_observatory                | Atlas Observatory              | Overworld / knowledge        | World-mapping complex combining stars, routes, realms, history, and disputed knowledge.                                  |
| wonder.overworld.wandering_city                   | Wandering City                 | Overworld / mobile           | A moving settlement and trade network with route rights, migration, maintenance, and political consequences.             |
| wonder.overworld.deepway_grand_junction           | Deepway Grand Junction         | Overworld / underground      | Regional underground transit hub linking mines, cities, ruins, dungeons, and realm depths.                               |
| wonder.overworld.sunken_library                   | Sunken Library                 | Overworld / marine           | Flooded knowledge city accessed by diving, restoration, diplomacy, and water-control projects.                           |
| wonder.overworld.titans_cradle                    | Titan’s Cradle                 | Overworld / colossal remains | Ancient containment, nursery, tomb, or repair site tied to titan ecology and boss outcomes.                              |
| wonder.overworld.crown_of_beacons                 | Crown of Beacons               | Overworld / network          | Mountain and tower signal network enabling navigation, warnings, weather prediction, and regional unity.                 |
| wonder.overworld.eternal_orchard                  | Eternal Orchard                | Overworld / agriculture      | Civilisation-scale living food and seed system with seasons, caretakers, biodiversity, and political control.            |
| wonder.overworld.colossus_foundry                 | Colossus Foundry               | Overworld / industry         | Ancient or modern facility capable of building, repairing, or dismantling world-scale constructs.                        |
| wonder.realm.verdant.seasonal_throne              | Seasonal Throne                | Verdant Covenant             | Realm civic and ecological regulator whose authority changes with seasons and negotiated stewardship.                    |
| wonder.realm.veil.archive_last_names              | Archive of Last Names          | Ancestral Veil               | World-scale memory institution preserving identities and resolving lost-history crises.                                  |
| wonder.realm.somnolent.unfinished_dream_cathedral | Cathedral of Unfinished Dreams | Somnolent Expanse            | Living dream megastructure shaped by collective hopes, fear, memory, and player outcomes.                                |
| wonder.realm.aetheric.stormwheel_citadel          | Stormwheel Citadel             | Aetheric Reach               | Rotating aerial fortress, power station, city, and weather-route controller.                                             |
| wonder.realm.deep.heart_below_pressure            | Heart Below Pressure           | Impossible Deep              | Planetary-depth refuge and machine regulating pressure, currents, and deep civilisation survival.                        |
| wonder.realm.engine.central_orchestrator          | Central Orchestrator           | World-Engine                 | System-scale intelligence and infrastructure authority coordinating transit, repair, law, and conflict.                  |
| wonder.realm.ashen.furnace_of_contracts           | Furnace of Contracts           | Ashen Lower Realms           | Great forge where agreements, fuels, laws, and infrastructure are literally bound and contested.                         |
| wonder.realm.void.black_star_anchor               | Black Star Anchor              | Void Between                 | Massive stabiliser holding routes, settlements, memory, and fragments against spatial collapse.                          |
| wonder.realm.divine.concordant_stair              | Concordant Stair               | Divine Concords              | Pilgrimage and diplomatic megastructure connecting domains through trials, treaties, and public service.                 |
| wonder.realm.necropolis.city_quiet_bells          | City of Quiet Bells            | Necropolis Domains           | Vast memorial city coordinating identity, mourning, citizenship, transit, and ethical death practices.                   |
| wonder.realm.elemental.world_loom                 | Elemental World-Loom           | Elemental Confluences        | Regional infrastructure weaving elemental flows into climate, power, routes, and habitable zones.                        |
| wonder.realm.pocket.infinite_palace               | Infinite Pocket Palace         | Created Pockets              | Nested pocket-realm complex whose boundaries, ownership, rooms, and purpose can be reconfigured or fail.                 |

# 40. Structure Grammar, Function, State, and Connection Module Libraries

The Atlas uses reusable modules so structures can vary without losing readability, function, history, or data integrity. A module is not a complete building. It is a controlled grammar component that may be combined with culture kits, material palettes, environmental adaptations, ownership, service requirements, damage states, and local history. The generator must validate that every selected module has compatible access, support, navigation, services, and sockets.

| **Preliminary Stable ID**                | **Module Family** | **Module**              | **Contract**                                                                                                                            |
|------------------------------------------|-------------------|-------------------------|-----------------------------------------------------------------------------------------------------------------------------------------|
| module.structure.footprint.courtyard     | Footprint         | Courtyard               | Organises public or private space around a shared yard, well, garden, market, work area, ritual focus, or defensive core.               |
| module.structure.footprint.linear_spine  | Footprint         | Linear Spine            | Places functions along a road, ridge, riverbank, cave passage, rail line, wall, or service corridor.                                    |
| module.structure.footprint.cluster       | Footprint         | Cluster                 | Combines independent buildings through shared yards, routes, storage, utilities, and service spaces.                                    |
| module.structure.footprint.ring          | Footprint         | Ring                    | Encloses a sacred, civic, defensive, mechanical, ecological, or natural centre with controlled access and circulation.                  |
| module.structure.footprint.terrace       | Footprint         | Terrace                 | Uses stepped levels to adapt to slopes, water edges, views, agriculture, retaining walls, and vertical circulation.                     |
| module.structure.footprint.tower         | Footprint         | Tower                   | Stacks functions vertically and requires stairs, ramps, ladders, lifts, silhouette logic, refuge points, and fall-safety support.       |
| module.structure.footprint.bridge        | Footprint         | Bridge Structure        | Creates habitable or functional architecture that spans a gap while preserving load, clearance, navigation, and maintenance access.     |
| module.structure.footprint.buried        | Footprint         | Buried Structure        | Places primary functions below ground and requires support, drainage, ventilation, access, surface evidence, and collapse rules.        |
| module.structure.function.residential    | Function          | Residential             | Provides valid sleeping, privacy, storage, warmth, household access, and culture-specific domestic services.                            |
| module.structure.function.storage        | Function          | Storage                 | Provides protected capacity, categories, ownership, spoilage or environmental controls, reservation, and logistics ports.               |
| module.structure.function.production     | Function          | Production              | Provides workstations, inputs, outputs, labour positions, power or mana, hazards, maintenance, and waste handling.                      |
| module.structure.function.civic          | Function          | Civic                   | Supports administration, assembly, law, records, public services, dispute resolution, and settlement identity.                          |
| module.structure.function.defence        | Function          | Defence                 | Supports observation, controlled entry, patrol, shelter, resupply, siege response, repair, and evacuation.                              |
| module.structure.function.ritual         | Function          | Ritual                  | Supports sacred or magical practice through participants, orientation, offerings, safety, acoustics, mana, and social permissions.      |
| module.structure.function.transport      | Function          | Transport               | Supports boarding, loading, transfer, routing, schedules, waiting, storage, repair, signalling, and alternative access.                 |
| module.structure.function.research       | Function          | Research                | Supports archives, observation, experimentation, teaching, containment, specialist work, and knowledge security.                        |
| module.structure.state.active            | State             | Active                  | Functions normally, has valid users and services, and participates in local networks.                                                   |
| module.structure.state.construction      | State             | Under Construction      | Uses staged foundations, scaffolds, reserved resources, labour, hazards, and visible progress.                                          |
| module.structure.state.damaged           | State             | Damaged                 | Retains partial function while exposing repair needs, hazards, reduced capacity, and visual evidence.                                   |
| module.structure.state.abandoned         | State             | Abandoned               | Lacks normal owners or services and may accumulate decay, ecology, salvage, rumours, or new occupants.                                  |
| module.structure.state.occupied          | State             | Occupied                | Has been taken over by a faction, creature group, refugees, military force, cult, or other users with altered permissions and function. |
| module.structure.state.corrupted         | State             | Corrupted               | Has altered materials, services, ecology, magic, access, danger, and cleansing requirements.                                            |
| module.structure.state.flooded           | State             | Flooded                 | Has water-obstructed spaces, changed routes, structural risks, aquatic ecology, and drainage or adaptation possibilities.               |
| module.structure.state.restored          | State             | Restored                | Returns a damaged or lost site to a chosen function while retaining historical evidence and persistent consequences.                    |
| module.structure.connection.road_node    | Connection        | Road Node               | Connects to route hierarchy, signs, traffic, maintenance, patrol, trade, and emergency access.                                          |
| module.structure.connection.port_node    | Connection        | Port Node               | Connects water transport, docking, cargo transfer, weather shelter, navigation, and rescue services.                                    |
| module.structure.connection.rail_node    | Connection        | Rail Node               | Connects vehicles, tracks, schedules, switches, loading, power, maintenance, and safe platform access.                                  |
| module.structure.connection.mana_node    | Connection        | Mana Node               | Connects mana production, storage, distribution, wards, ritual systems, machines, metering, and overload protection.                    |
| module.structure.connection.sky_anchor   | Connection        | Sky Anchor              | Connects aerial routes, docking, lift, weather protection, signalling, rescue, and gravity or wind systems.                             |
| module.structure.connection.realm_gate   | Connection        | Realm Gate              | Connects realm routes, stabilisation, customs or permissions, quarantine, return safety, and route-state records.                       |
| module.structure.connection.dungeon_link | Connection        | Dungeon Link            | Connects a world structure to a 24G dungeon site, service route, sealed entrance, occupation state, or restoration consequence.         |
| module.structure.connection.boss_link    | Connection        | Boss or Guardian Socket | Connects territory evidence, arena support, awakening conditions, siege logic, alternate outcomes, and persistent aftermath from 24H.   |

## 40.1 Dynamic Structure-State Profile Library

Runtime sites store state separately from immutable structure definitions. States may be combined when compatible, but every transition must define cause, visual evidence, service changes, ownership response, simulation behaviour, repair or recovery paths, and save migration.

| **Stable State ID**           | **Profile**   | **Runtime Meaning**                                                                                                                                                 |
|-------------------------------|---------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| state.structure.planned       | Planned       | Surveyed footprint, blueprint, approvals, reservations, and intended services exist before construction begins.                                                     |
| state.structure.construction  | Construction  | Work stages, labour, scaffolds, supply crates, incomplete services, and construction hazards are active.                                                            |
| state.structure.active        | Active        | The structure is supplied, staffed or usable, connected to required networks, and performing its intended function.                                                 |
| state.structure.undersupplied | Undersupplied | Fuel, materials, labour, food, water, mana, maintenance, or access is below operating requirements.                                                                 |
| state.structure.overcapacity  | Overcapacity  | Population, traffic, storage, production, power, or service demand exceeds safe design limits.                                                                      |
| state.structure.damaged       | Damaged       | One or more components have reduced integrity, capacity, safety, or service coverage.                                                                               |
| state.structure.breached      | Breached      | Defensive or containment boundaries have failed and access, hazards, invasion, or escape behaviour changes.                                                         |
| state.structure.burned        | Burned        | Fire has altered materials, services, air quality, ecology, salvage, and repair requirements.                                                                       |
| state.structure.flooded       | Flooded       | Water has entered spaces or networks and changes access, buoyancy, power safety, ecology, and restoration.                                                          |
| state.structure.collapsed     | Collapsed     | Critical volumes or supports have failed, creating rubble, blocked routes, rescue needs, salvage, and rebuilding stages.                                            |
| state.structure.abandoned     | Abandoned     | Normal users and maintenance are absent; decay, overgrowth, occupation, rumours, and archaeological evidence accumulate.                                            |
| state.structure.occupied      | Occupied      | A new group uses the site without necessarily holding recognised ownership or preserving its original function.                                                     |
| state.structure.contested     | Contested     | Multiple parties claim or fight over the site, producing permissions, patrols, sabotage, negotiations, and instability.                                             |
| state.structure.besieged      | Besieged      | Routes, supplies, defences, shelters, morale, damage, and relief actions are evaluated under organised external pressure.                                           |
| state.structure.corrupted     | Corrupted     | A hostile magical, dimensional, biological, or ideological condition alters the site and its connected systems.                                                     |
| state.structure.warded        | Warded        | Protective magic changes access, creature behaviour, damage resistance, detection, mana demand, and legal permissions.                                              |
| state.structure.restored      | Restored      | The site has been returned to a selected function through visible work, resources, decisions, and stakeholder consequences.                                         |
| state.structure.repurposed    | Repurposed    | The structure retains part of its physical history but now serves a different civic, industrial, residential, military, sacred, ecological, or player-defined role. |

| **Module Rule**                                                                                                                                                                                                                                                                        |
|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| A generated structure must remain understandable as a place. Procedural variation may alter footprint, materials, history, occupants, and state, but it may not remove valid entrances, required services, critical navigation, state readability, or the reason the structure exists. |

# 41. Presentation, Forge, Materials, Animation, Audio, and VFX Requirements

Structures are large content assemblies. Their identity must be readable from distance, at entry, during use, and after state changes. The Atlas defines the content contract; Forge documents and production tools create the models, voxel kits, materials, animations, sounds, VFX, signs, sockets, and variants that satisfy it.

| **Presentation Layer** | **Required Contract**                                                                                                                                                                         |
|------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Silhouette             | Every major family defines distant massing, roofline, vertical landmarks, entrances, route relationship, and state-readable damage. Large sites require impostor or simplified distant forms. |
| Material Kit           | Defines structural, roof, floor, trim, window, door, road, foundation, damaged, wet, burned, corrupted, repaired, and culture/environment variants using registry-linked materials.           |
| Modularity             | Walls, corners, roofs, stairs, supports, doors, windows, service pieces, signs, props, sockets, and damage modules align to shared grids and placement rules.                                 |
| Animation              | Doors, gates, lifts, cranes, mills, pumps, bridges, switches, docks, vehicles, ritual apparatus, machinery, flags, vegetation, and workers expose named animation states and event sockets.   |
| Audio                  | Each family requires ambience, material impacts, doors, machinery, crowds or wildlife, power or mana, weather response, warnings, damage, construction, and state transitions.                |
| VFX                    | Smoke, dust, water, sparks, mana flow, wards, heat, cold, corruption, leaks, construction, collapse, repair, traffic, beacons, and realm effects attach through documented sockets.           |
| Signs and Language     | Wayfinding, ownership, warnings, laws, services, schedules, faction marks, cultural scripts, and accessible icons are data-driven and localisable.                                            |
| State Readability      | Construction, damage, closure, occupation, siege, abandonment, corruption, flooding, restoration, and repurposing must be visible without relying only on UI text or colour.                  |
| Environmental Evidence | Tracks, smoke, lights, sound, roads, waste, gardens, livestock, traffic, patrols, scaffolds, erosion, debris, repairs, and ecological change communicate current use.                         |
| Budget Tiers           | Minor, standard, major, landmark, wonder, and megastructure tiers define geometry, materials, lights, animation, AI, collision, audio, VFX, navigation, and simulation budgets.               |

## 41.1 Structure Kit Production Rules

- Create reusable kit families before authoring large quantities of unique buildings.

- Separate structural geometry, decorative dressing, functional service objects, runtime state modules, and cultural variants.

- Keep all gameplay sockets named, versioned, visible in Forge tooling, and validated against the registry.

- Use material and decal variation to increase authored breadth without hiding important function, ownership, damage, or navigation.

- Provide simplified collision and navigation geometry instead of deriving all gameplay collision from visual meshes.

- Ensure signs, lights, beacons, warnings, and route symbols remain legible under colour-blind modes, low effects, reduced motion, and split-screen.

- Treat sound and VFX attachment points as first-class asset metadata so later production does not require structure redesign.

- Maintain construction, intact, damaged, ruined, repaired, restored, and repurposed compatibility for any family expected to change persistently.

# 42. Simulation LOD, Saves, Performance, Authority, and Godot/Summer Engine Direction

World infrastructure must remain persistent without forcing every building, road, machine, resident, vehicle, or effect to simulate at full detail. Immutable Atlas definitions are resolved into runtime site records. Nearby presentation may use scenes, voxel volumes, actors, navigation, audio, VFX, and detailed transactions; distant regions preserve compact state, services, ownership, route capacity, damage, construction, and history.

| **Technical Layer**    | **Locked Direction**                                                                                                                                                                                           |
|------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Immutable Definition   | Godot Resource or imported registry entry containing stable ID, category, grammar, eligibility, services, sockets, states, presentation references, and validation rules.                                      |
| Runtime Site Record    | Save-owned record containing generated instance ID, seed lineage, transform, ownership, occupants, construction, integrity, services, inventories, route links, discoveries, events, and current state.        |
| Nearby Simulation      | Instantiates interactive scenes, voxel edits, doors, machines, NPC work, vehicles, item flow, damage, construction, navigation, sound, VFX, and authoritative transactions.                                    |
| Medium Simulation      | Uses simplified actors or scheduled summaries for occupancy, service output, traffic, patrol, damage, repair, production, hazards, and visible state.                                                          |
| Distant Simulation     | Uses compact regional ticks for capacity, supply, ownership, route throughput, maintenance, construction, siege, occupation, abandonment, restoration, and event outcomes.                                     |
| Promotion and Demotion | Explicit rules reconstruct nearby state from records and safely compact it again without duplicating inventories, losing workers, resetting doors, or erasing damage and history.                              |
| Chunk Integration      | Structure volumes and route segments reference generated chunks through stable instance records; cross-chunk boundaries preserve sockets, roads, utilities, ownership, and edits.                              |
| Navigation             | Structures provide hierarchical navigation data, doors, ladders, ramps, lifts, restricted zones, vehicle paths, evacuation paths, fallback links, and rebuild notifications.                                   |
| Authority              | The authoritative world simulation validates placement, construction, ownership, inventory movement, network changes, damage, repair, occupation, discovery, and persistent outcomes in solo and multiplayer.  |
| Summer Engine Tooling  | Summer Engine workflows should generate, inspect, validate, diff, batch-place, profile, and document Godot Resources, scenes, sockets, route graphs, state modules, seed galleries, and registry dependencies. |
| Save Recovery          | Construction and network transactions use journals or atomic stages; broken references, interrupted streaming, failed upgrades, and removed content packs receive deterministic recovery or migration paths.   |
| Performance Gates      | Each scale tier has budgets for geometry, materials, lights, collision, navigation, actors, audio, VFX, network replication, save size, generation time, and promotion cost.                                   |

## 42.1 Structure Runtime Ownership Boundaries

| **System**                        | **Owns**                                                                                                                                 | **Does Not Own**                                                                                       |
|-----------------------------------|------------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------|
| Atlas Registry                    | Immutable definitions, tags, eligibility, grammar, service contracts, sockets, allowed states, presentation references.                  | Save-specific owner, damage, inventory, workers, discoveries, construction progress, or event history. |
| World Generation                  | Seed-derived placement, initial history, initial ownership, route graph, environment adaptation, and guaranteed relationship validation. | Permanent runtime truth after the world has been created.                                              |
| Structure Runtime                 | Instance state, physical components, local services, interaction endpoints, integrity, permissions, and presentation promotion.          | Global faction truth, complete regional economy, or independent item creation.                         |
| Settlement and Faction Simulation | Population demand, ownership claims, laws, staffing, projects, services, defence priorities, occupation, and political response.         | Voxel geometry or visual-only placement details.                                                       |
| Route and Network Services        | Connectivity, capacity, direction, cost, closures, traffic summaries, transfer permissions, and route-state propagation.                 | Unvalidated resource ownership or structure history.                                                   |
| Save and Migration                | Persistent records, journals, versioning, references, recovery, and compatibility transitions.                                           | Creative definitions that should remain in source registries.                                          |

# 43. Data Models, Stable IDs, Validation, and Seed Testing

[[24I - Structures, Landmarks, Routes, Wonders and World Infrastructure Atlas]] provides preliminary IDs and schema requirements. [[24L - Content Registry, Cross-Link Matrix, Budgets and Production Roadmap]] will reconcile final namespaces, counts, dependencies, asset budgets, and migration status across the complete Atlas set. Every generated site must be reproducible from its world seed and generation version, while runtime changes persist as save deltas.

| **Field Group**  | **Required Data**                                                                                                                                              |
|------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Identity         | Stable definition ID, family, category, scale tier, display name key, aliases, scope, version, and planning status.                                            |
| Creative Summary | Purpose, player-facing fantasy, silhouette, historical origin, common users, cultural interpretations, and design boundaries.                                  |
| Eligibility      | Realm, region, biome, climate, geology, water, altitude, depth, terrain, settlement, faction, history, magic, route, rarity, exclusion, and adjacency rules.   |
| Grammar          | Footprints, modules, mandatory spaces, optional spaces, entrances, circulation, foundations, supports, verticality, sockets, variants, and size ranges.        |
| Function         | Services, users, labour, inputs, outputs, capacities, storage, power, mana, water, waste, hazards, maintenance, and progression connections.                   |
| Ownership        | Builder, recognised owner, operator, residents, legal authority, claimants, permissions, crime rules, transfer, occupation, and dispute behaviour.             |
| Networks         | Road, path, port, waterway, rail, conveyor, utility, mana, skyway, portal, communication, trade, patrol, and emergency links.                                  |
| Runtime State    | Construction, integrity, damage, supply, staffing, occupancy, hazards, closure, corruption, restoration, discovery, and simulation LOD.                        |
| History          | Founding era, builders, former owners, destruction, repairs, cultural layers, archaeology, rumours, quests, and world events.                                  |
| Presentation     | Scene or voxel kit, materials, props, signs, sounds, VFX, animation, lighting, map icon, Codex art, sockets, and budget tier.                                  |
| Validation       | Placement tests, graph tests, navigation, service completeness, accessibility, authority, persistence, performance, content dependencies, and migration rules. |

## 43.1 Automated Seed and Content Validation Families

| **Test Family**                   | **Validation Contract**                                                                                                                                                                  |
|-----------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Placement Integrity               | Detect overlap, unsupported geometry, invalid slopes, submerged entrances, blocked foundations, impossible terrain adaptation, and forbidden adjacency.                                  |
| Network Integrity                 | Verify endpoints, route continuity, bridges, ports, rails, utilities, gates, fallback connections, capacity, direction, closures, and cross-chunk persistence.                           |
| Functional Integrity              | Verify required rooms, services, staff positions, storage, power, mana, water, access, maintenance, evacuation, and valid interaction sockets.                                           |
| Culture and Environment Integrity | Confirm adaptation follows culture and site conditions without ancestry essentialism, copy-paste palettes, climate contradictions, or inaccessible services.                             |
| Settlement Completeness           | Check housing, food, water, work, storage, safety, governance, morale, infrastructure, routes, emergency support, and growth capacity against settlement scale.                          |
| Wonder Uniqueness                 | Verify rarity, separation, duplicate rules, regional visibility, access, world function, histories, outcomes, and performance representation.                                            |
| Dynamic-State Integrity           | Transition every allowed state and confirm visuals, services, navigation, ownership, quests, networks, save records, and recovery remain coherent.                                       |
| LOD Integrity                     | Promote and demote sites repeatedly while comparing inventory, workers, integrity, services, route links, state, discoveries, events, and visual reconstruction.                         |
| Accessibility Integrity           | Validate entrances, alternative routes, interaction reach, signage, non-colour cues, reduced-motion modes, camera safety, rescue, and multiplayer joining.                               |
| Regression Library                | Maintain named seeds and save fixtures covering crowded settlements, sparse regions, coastal ports, deep networks, sky routes, realm gates, wonders, disasters, sieges, and restoration. |

# 44. Content Completeness Contracts, Budgets, and Production Sequence

Completeness contracts prevent the Atlas from producing visually impressive but functionally empty structures, settlements, routes, or wonders. They are target requirements for content packs and validation rather than a demand that every seed place every entry.

| **Content Package**           | **Minimum Contract**                                                                                                                                                                                                                        |
|-------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Major Settlement Culture Pack | At least 12 building families; 3 housing; 3 civic or service; 3 work or industry; 2 trade or storage; 2 culture or faith; 2 defence; route kit; signs; dynamic states; environment variants; Forge references.                              |
| Minor Settlement              | Housing, food and water access, storage, work, safety, route access, governance or social centre, culture identity, waste or maintenance, and emergency response.                                                                           |
| Overworld Region              | At least 4 minor landmark families, 2 route-node families, 1 rest or safety site, 1 resource or industry site, 1 ruin or restoration site, and a validated rare-wonder opportunity.                                                         |
| Coastal Region                | Port hierarchy, navigation aids, weather shelter or rescue, land-water transfer, storage and trade, maintenance, marine hazards, ownership, and route fallback.                                                                             |
| Underground Region            | Entrances, vertical transit, support, ventilation, water management, refuge, storage, regional route graph, hazard response, and surface relationship.                                                                                      |
| Sky Region                    | Launch and landing, anchors, weather protection, rescue, beacons, passenger and freight transfer, maintenance, fall recovery, and at least one alternative access method where progression allows.                                          |
| Major Realm                   | At least 5 realm-structure foundations, 3 route families, 1 gate or crossing family, 1 wonder foundation, settlement compatibility, realm-law infrastructure, dungeon and boss sockets, and overworld utility.                              |
| Route Network                 | Valid demand and endpoints, hierarchy, signs, rest or transfer nodes, crossings, ownership, maintenance, hazards, dynamic states, capacity, emergency use, and deterministic fallback.                                                      |
| Wonder                        | Unique identity, history, regional function, route access, at least 3 discovery channels, 2 or more meaningful outcomes, dynamic states, stakeholder factions, ecology links, presentation identity, and performance fallback.              |
| Restorable Site               | Original function, damage cause, claims, exact resources, work stages, alternative restoration approaches, service benefits, ecological effects, political response, persistent result, and failure or abandonment states.                  |
| Asset Budget                  | Declared geometry, material, texture, collision, navigation, lighting, animation, audio, VFX, interaction, actor, replication, save, and generation budgets before content lock.                                                            |
| Production Sequence           | Definition and dependencies -\> compatibility rules -\> grammar -\> greybox -\> seed validation -\> culture and environment variants -\> states -\> services and networks -\> presentation -\> save and performance tests -\> content lock. |

## 44.1 Registry Foundation Count Summary

| **Registry**                                 | **Foundation Count** | **Location** | **Coverage**                                                                                                                   |
|----------------------------------------------|----------------------|--------------|--------------------------------------------------------------------------------------------------------------------------------|
| Overworld Structure and Landmark Foundations | 96                   | Section 36   | Settlement, agriculture, industry, commerce, navigation, defence, magic, culture, marine, sky, underground, and special sites. |
| Route and Infrastructure Foundations         | 48                   | Section 37   | Surface, crossing, water, industrial, sky, and realm route families.                                                           |
| Realm Structure Foundations                  | 60                   | Section 38   | Five foundations for each of twelve major realm families.                                                                      |
| Wonder and Megastructure Foundations         | 24                   | Section 39   | Overworld, mobile, underground, marine, sky, and realm-scale wonders.                                                          |
| Reusable Structure Modules                   | 32                   | Section 40   | Footprint, function, state, and connection modules.                                                                            |
| Dynamic Structure-State Profiles             | 18                   | Section 40.1 | Construction, operation, shortage, damage, disaster, occupation, corruption, restoration, and repurposing.                     |

| **Scope Rule**                                                                                                                                                                                                                                                    |
|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| These counts are planning foundations, not a promise that every entry is production-ready or that every world contains all entries. [[24L - Content Registry, Cross-Link Matrix, Budgets and Production Roadmap]] must classify each foundation by prototype, alpha, beta, final-game, expansion, placeholder, or deferred status. |

# 45. Quality, Representation, Safety, and Player-Trust Rules

| **Quality Rule**                  | **Required Standard**                                                                                                                                                                               |
|-----------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| No Architecture Essentialism      | Ancestry does not dictate architecture. Culture, environment, economy, history, government, resources, technology, magic, and individual choice shape structures.                                   |
| No Primitive-to-Civilised Ladder  | Settlement forms are adaptations with different strengths and constraints, not a moral ranking from primitive camps to superior cities.                                                             |
| Coerced Labour Visibility         | Prisons, tribute works, necromantic labour, debt systems, conquest projects, and exploitative infrastructure must expose social consequences rather than functioning as neutral efficiency bonuses. |
| Sacred and Funerary Respect       | Sacred, ancestral, burial, and memorial sites define ownership, access, cultural interpretation, disturbance consequences, restoration options, and alternatives to looting.                        |
| Accessibility by Design           | Critical structures and routes provide readable entrances, interaction reach, non-colour information, movement alternatives or assistance, camera safety, rescue, and configurable comfort.         |
| No Empty Scale                    | Large structures require useful functions, navigation anchors, services, inhabitants or evidence, state behaviour, and meaningful player choices rather than volume for spectacle alone.            |
| Consequences                      | Construction, destruction, extraction, occupation, abandonment, restoration, and wonder activation affect routes, ecology, settlements, factions, resources, danger, and history.                   |
| Early Readability                 | Players should recognise likely function, entrance, ownership, danger, services, route relation, and state before reading deep UI or Codex text.                                                    |
| Old Infrastructure Remains Useful | Paths, wells, bridges, mills, canals, watch posts, warehouses, and mechanical systems retain roles after advanced magic, rail, sky, or portal systems appear.                                       |
| Performance Honesty               | Designs must declare simulation and presentation budgets. A site that cannot meet stable generation, save, streaming, navigation, multiplayer, or frame budgets is simplified before content lock.  |
| No Soft Locks                     | Critical routes, gates, lifts, puzzles, occupation states, disasters, and construction transitions require fallback, repair, retreat, rescue, or alternative progression rules.                     |
| World Memory                      | Major sites preserve builders, owners, damage, repairs, occupations, discoveries, contributions, renamed states, and outcomes instead of silently resetting.                                        |

## 45.1 Player Construction and World Freedom Boundary

Atlas structures establish authored world content, procedural settlements, public works, faction projects, and reusable grammars. They do not prohibit free voxel building. The player may build outside approved blueprints, alter terrain, create personal routes, connect machines, claim sites where rules permit, or redesign settlements. Structured projects exist to make NPC labour, service coverage, large construction, restoration, law, multiplayer permissions, and world simulation manageable.

- Freeform building remains the maximum-creativity layer.

- Modular pieces improve shape, readability, collision, animation, and service integration.

- Blueprints communicate resources, services, permissions, stages, sockets, and NPC labour.

- NPC projects use validated grammars but may select variants, sites, materials, stages, and priorities procedurally.

- Player-founded settlements may override or combine culture kits without creating ancestry restrictions.

- World settings may reduce ownership, damage, maintenance, crime, route, service, or construction requirements for relaxed play.

# 46. Cross-Document Update and Supersession Plan

[[24I - Structures, Landmarks, Routes, Wonders and World Infrastructure Atlas]] is additive to the Atlas set but supersedes POC-era structure, route, settlement-placement, and fixed-world assumptions. The following revisions should be applied when the main design set is next consolidated.

| **Document**                               | **Required Revision**                                                                                                                                                                                                        |
|--------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 00 - Master Game Design Bible              | Retire Forest Hamlet structure assumptions. Add Atlas structure identity, route networks, public works, wonders, restoration, occupation, and persistent infrastructure change.                                              |
| 01 - Core Gameplay Loop                    | Expand structure play into discover -\> use or build -\> connect -\> maintain or defend -\> repair or transform -\> integrate with settlements, routes, and realms.                                                          |
| 02 - Player Progression                    | Add surveying, route knowledge, public works, restoration, construction leadership, infrastructure permissions, service planning, and wonder-scale progression.                                                              |
| 03 - Blocks Registry                       | Expand construction families, roads, roofs, signs, modular pieces, damage and repair states, ports, rails, utilities, gates, realm materials, and named gameplay sockets.                                                    |
| 04 - Items Registry                        | Add surveys, maps, deeds, permits, maintenance parts, signs, route equipment, port, rail and sky gear, relics, construction kits, restoration tools, and wonder components.                                                  |
| 05 - Crafting and Recipe Registry          | Add construction families, public works, routes, repairs, upgrades, maintenance, restoration, infrastructure commissioning, and staged wonder or megaproject recipes.                                                        |
| 06 - Resource Progression                  | Map materials to construction kits, roads, utilities, maintenance, ports, rails, realm gates, restoration, public works, and wonders while keeping old materials useful.                                                     |
| 07 - NPC Village System                    | Replace fixed hamlet assumptions with service coverage, districts, infrastructure, housing, public works, route dependence, occupation, disaster, abandonment, restoration, and settlement-scale rules.                      |
| 08 - Automation System                     | Integrate logistics corridors, stations, power sites, conveyors, rails, warehouses, public utilities, ports, route capacity, maintenance, damage, ownership, and distant network simulation.                                 |
| 09 - Magic System                          | Integrate mana grids, wards, ritual infrastructure, gates, realm routes, magical public works, containment, restoration, and wonder-scale systems.                                                                           |
| 10 - Creatures and Monsters                | Connect structures to habitats, nests, livestock, pests, invasive transport, migration barriers, ruins, roads, ports, canals, dams, mines, occupation, and ecological restoration.                                           |
| 11 - Biomes and World Generation           | Adopt 24I placement, history, route graph, network, settlement completeness, landmark, wonder, dynamic-state, validation, and deterministic fallback requirements.                                                           |
| 12 - Structures                            | Retire POC structure scope and treat 24I as the production world-structure Atlas. Keep 24G responsible for dungeon interiors, room grammar, traps, puzzles, lairs, and megadungeon logic.                                    |
| 13 - Races, Peoples, Cultures and Factions | Use 24E for identity, culture, faction, and settlement logic and 24I for physical kits, services, routes, districts, public works, signs, states, and wonders.                                                               |
| 14 - Dimensions                            | Adopt realm structures, gates, route sovereignty, environmental adaptation, public works, cross-realm infrastructure, realm wonders, and route-state persistence.                                                            |
| 15 - Quest and Event System                | Add construction, maintenance, disaster, route, closure, restoration, claim, occupation, pilgrimage, infrastructure, wonder, evacuation, and megaproject event families.                                                     |
| 16 - Combat, Gear and Defence              | Integrate fortifications, siege services, structural damage, breaches, shelters, route control, evacuation, repairs, occupation, and persistent aftermath.                                                                   |
| 17 - UI and UX                             | Expose services, routes, ownership, permissions, damage, construction, maintenance, restoration, public works, maps, landmarks, closures, power, mana, and contribution records.                                             |
| 18 - Technical Implementation Plan         | Replace outdated engine-specific structure architecture with Godot Resources, scenes, voxel volumes, chunk placement, route graphs, state records, LOD, authority, saves, migrations, validators, and Summer Engine tooling. |
| 24J-24L                                    | Use 24I structures and routes as consumers and producers for materials, loot, trade, history, events, schemas, budgets, dependencies, production sequencing, and final stable-ID reconciliation.                             |

# 47. Open Questions for Production Planning

| **Question Area**        | **Decision Required**                                                                                                                                                                                                      |
|--------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Final Production Scope   | Which registry foundations ship in first public release, later milestones, expansions, or remain procedural-kit research?                                                                                                  |
| Construction Granularity | Which building families use voxel blocks, modular scenes, hybrid assemblies, prefabricated functional modules, or large streamed volumes?                                                                                  |
| Settlement Simulation    | How many service categories, districts, structures, residents, projects, and route nodes can nearby and distant settlements support within target hardware budgets?                                                        |
| Route Generation         | Which graph solver, terrain-cost model, bridge or tunnel fallback, and post-generation repair rules best preserve readable routes across editable voxel terrain?                                                           |
| Vehicles                 | Which carts, ships, trains, lifts, sky craft, mounts, and portal freight systems are required at each milestone?                                                                                                           |
| Destruction              | Which structural components support local voxel damage, modular damage swaps, partial collapse, full collapse, fire spread, flooding, and abstract distant damage?                                                         |
| Water Engineering        | How deeply should canals, dams, locks, drainage, irrigation, pumps, tides, erosion, and flooding affect terrain and settlement simulation?                                                                                 |
| Ownership and Law        | How do deeds, public access, easements, trespass, eminent authority, heritage claims, sacred restrictions, occupation, conquest, and multiplayer ownership interact?                                                       |
| Wonders                  | How many wonders may generate per world or realm, which are unique, which migrate, which may be player-built, and how are missing progression functions guaranteed elsewhere?                                              |
| Megastructure Streaming  | Which large sites require hierarchical cells, distant proxies, interior instances, portal-separated spaces, or region-scale simulation?                                                                                    |
| Realm Gates              | How are customs, quarantine, route fees, diplomacy, siege, closure, instability, rescue, and alternate-return rules represented?                                                                                           |
| Player-Founded Cities    | Which planning, district, law, service, taxation, NPC construction, infrastructure, route, and wonder tools belong in the future settlement-control set?                                                                   |
| Accessibility            | Which automatic route assistance, lift alternatives, climbing aids, motion reductions, camera options, rescue tools, signage modes, and simplified construction settings ship by default?                                  |
| Modding                  | Which structure grammars, modules, route families, state transitions, culture kits, wonders, and validation rules may content packs extend without breaking saves?                                                         |
| Atlas-to-Forge Pipeline  | What exact export schemas, socket naming, preview scenes, variant matrices, thumbnails, collision tests, animation events, audio events, VFX events, and acceptance checks connect Atlas definitions to production assets? |

# Appendix A. Structure Definition Template

Every production structure definition should complete the following fields or explicitly mark a field as not applicable with a reason.

| **Field Group**   | **Required Entry**                                                                                                                                              |
|-------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Stable Identity   | Definition ID, display name key, aliases, family, category, scale, version, namespace, rarity, scope, and production status.                                    |
| Creative Identity | Purpose, fantasy, silhouette, typical users, historical origin, cultural interpretations, player opportunities, and prohibited assumptions.                     |
| Eligibility       | Realm, region, biome, climate, geology, water, height or depth, terrain, settlement, faction, history, magic, adjacency, density, exclusion, and fallback.      |
| Grammar           | Footprints, dimensions, mandatory and optional modules, entrances, foundations, supports, circulation, vertical movement, sockets, orientation, and variants.   |
| Function          | Services, inhabitants, labour, interactions, capacities, storage, power, mana, water, waste, hazards, maintenance, production, trade, defence, and progression. |
| Ownership         | Builder, legal owner, operator, residents, public access, restricted zones, claims, permissions, transfer, occupation, conquest, crime, and dispute response.   |
| State             | Allowed states, transitions, triggers, visual modules, functional changes, damage, repair, abandonment, restoration, repurposing, and migration rules.          |
| History           | Era, builders, prior owners, events, damage, repairs, occupation, cultural layers, archaeology, rumours, Codex certainty, and quest hooks.                      |
| Presentation      | Voxel kit, scenes, meshes, materials, props, signs, animation, audio, VFX, lighting, map icon, Codex assets, sockets, and budget tier.                          |
| Validation        | Placement, navigation, service, graph, accessibility, authority, LOD, performance, persistence, migration, content-pack dependency, and regression tests.       |

# Appendix B. Route and Network Definition Template

| **Field Group** | **Required Entry**                                                                                                                                         |
|-----------------|------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Identity        | Stable route-family ID, display name, route medium, hierarchy, version, scope, and compatible node types.                                                  |
| Endpoints       | Valid origins and destinations, demand, ownership, permissions, transfer nodes, route chaining, and deterministic fallback.                                |
| Geometry        | Width, grade, clearance, curvature, support, bridges, tunnels, foundations, platforms, docks, track or channel rules, signs, and terrain adaptation.       |
| Use             | Pedestrians, animals, carts, ships, trains, conveyors, fluids, mana, sky craft, portals, freight, patrols, pilgrims, refugees, or emergency services.      |
| State           | Construction, open, congested, undersupplied, damaged, blocked, flooded, frozen, besieged, corrupted, unsafe, abandoned, repaired, and upgraded behaviour. |
| Network         | Capacity, direction, schedule, cost, speed, priority, reservations, ownership, customs, tolls, storage, switching, queues, and rerouting.                  |
| World Links     | Settlements, ports, stations, mines, farms, dungeons, boss territories, gates, wonders, trade regions, migration, and ecology interactions.                |
| Simulation      | Nearby presentation, medium traffic, distant throughput, event propagation, promotion or demotion, save records, multiplayer authority, and validation.    |

# Appendix C. Wonder and Megastructure Definition Template

| **Field Group**          | **Required Entry**                                                                                                                                             |
|--------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Identity                 | Stable ID, name key, aliases, wonder class, realm or region, uniqueness, rarity, scale, and production tier.                                                   |
| World Function           | What the wonder provides, threatens, reveals, connects, stabilises, transforms, protects, consumes, produces, or prevents.                                     |
| Scale and Representation | Regional footprint, visible silhouette, interior strategy, distant proxy, streamed cells, route connections, simulation layers, and performance budgets.       |
| History and Claims       | Builders, era, purpose, disasters, owners, faiths, factions, legal or sacred claims, disputed interpretations, and archaeological evidence.                    |
| Access and Discovery     | Routes, keys, permissions, environmental requirements, three or more discovery channels, map behaviour, rumours, and return safety.                            |
| Interaction              | Services, exploration, construction, restoration, ritual, automation, diplomacy, ecology, combat, puzzle, boss, settlement, or realm-law systems.              |
| Dependencies             | Required resources, blocks, assets, modules, routes, NPCs, factions, creatures, dungeons, bosses, magic, events, UI, audio, VFX, and save schema.              |
| Outcomes                 | At least two meaningful resolution paths, stakeholder responses, dynamic states, persistent world effects, recurrence or uniqueness, and failure recovery.     |
| Production               | Greybox, seed placement, streaming, navigation, state transitions, save fixtures, multiplayer, accessibility, performance, Forge assets, and acceptance gates. |

# Appendix D. Dynamic State, Ownership, and Restoration Runtime Template

| **Record Group**             | **Persistent Fields**                                                                                                                                                               |
|------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Runtime Identity             | Site instance ID, definition ID, generation version, seed lineage, transform, chunk or region references, realm, and creation reason.                                               |
| Ownership Graph              | Builder, recognised owner, operator, residents, tenants, public authority, claimants, occupier, faction, access groups, permissions, and dispute status.                            |
| Service State                | Housing, food, water, storage, work, trade, safety, health, infrastructure, morale, power, mana, transport, communication, and emergency coverage.                                  |
| Physical State               | Integrity by component, damage, fire, water, contamination, corruption, collapse, block edits, doors, machines, utilities, hazards, and closures.                                   |
| Construction and Restoration | Project ID, blueprint, stage, reserved resources, deliveries, labour, permissions, alternatives, interruptions, repair priorities, and completion outcome.                          |
| Discovery and History        | Known name, map status, discovered entrances, Codex certainty, rumours, events, owners, damage, repairs, occupations, contributions, and renamed states.                            |
| Transition                   | Trigger, prerequisites, authority, transaction record, world effects, route effects, faction response, ecology response, presentation update, LOD handling, and migration fallback. |

# Appendix E. Minimum Completeness Matrix

The matrix is split into two tables for readability. A production entry may exceed these requirements but should not omit them silently.

| **Content Type**    | **Identity**                       | **Placement**                                               | **Function**                                                              | **Networks**                                                |
|---------------------|------------------------------------|-------------------------------------------------------------|---------------------------------------------------------------------------|-------------------------------------------------------------|
| Minor Structure     | Stable family and readable purpose | Compatible terrain and context                              | At least one real use                                                     | Entrance and local access                                   |
| Major Building      | Culture and function identity      | Settlement, district, services, and terrain                 | Multiple services or specialised function                                 | Road plus utilities or logistics as required                |
| Route Node          | Node and medium identity           | Valid endpoint context                                      | Transfer, rest, control, service, or navigation                           | At least two compatible route links or a justified terminus |
| Settlement District | District role and local identity   | Population, culture, terrain, routes, and service demand    | Housing, work, civic, trade, defence, culture, or infrastructure coverage | Internal circulation plus regional connection               |
| Wonder              | Unique or rare world identity      | Regional history, terrain, routes, and rarity rules         | World-level function and choices                                          | Validated access and at least one wider network effect      |
| Megastructure       | Scale identity and system role     | Regional or realm topology and streaming                    | Multiple integrated systems                                               | Hierarchical routes, utilities, and fallback access         |
| Realm Structure     | Realm-law and society identity     | Realm biome, route, faction, and physical-law compatibility | Realm-specific function with overworld or cross-realm relevance           | Realm route, gate, utility, or local network                |

| **Content Type**    | **States**                                                              | **History and Society**                                                | **Presentation**                                                | **Technical**                                                                   |
|---------------------|-------------------------------------------------------------------------|------------------------------------------------------------------------|-----------------------------------------------------------------|---------------------------------------------------------------------------------|
| Minor Structure     | Active plus at least one changed state                                  | Owner or historical origin                                             | Material, silhouette, signs, state evidence                     | Definition, site record, placement, navigation, save                            |
| Major Building      | Construction, active, damaged, restored or repurposed as applicable     | Owner, users, labour, laws, and history                                | Full kit, services, animation, audio, VFX, signage              | LOD, authority, service simulation, network integration                         |
| Route Node          | Open, blocked, damaged, repaired, congested, or abandoned as applicable | Builder, operator, owner, users, and events                            | Wayfinding, platforms or docks, hazards, signals                | Graph, capacity, traffic LOD, route-state persistence                           |
| Settlement District | Growth, shortage, damage, occupation, abandonment, restoration          | Residents, government, factions, migration, and cultural change        | District silhouette, street kit, services, crowds, signs        | Settlement LOD, service coverage, permissions, performance                      |
| Wonder              | Dormant or active plus transformed outcomes                             | Builders, claims, interpretations, factions, and archaeology           | Distinct silhouette, effects, audio identity, map and Codex     | Uniqueness, streaming, saves, migration, multiplayer outcomes                   |
| Megastructure       | Multiple component states and regional aftermath                        | Civilisations, labour, owners, disasters, occupations, and restoration | Hierarchical visual LOD, interior language, system feedback     | Cells, route graph, promotion, save partitioning, failure recovery              |
| Realm Structure     | Realm-law states, instability, occupation, closure, restoration         | Native and migrant societies, sovereignty, customs, and history        | Realm materials, law-readable VFX and audio, gate or route cues | Realm instance records, crossing safety, shared registries, inactive simulation |

# Appendix F. Acceptance Criteria

- No production rule depends on the Forest Hamlet, fixed POC valley, named POC residents, fixed goblin camp, fixed rune ruin, watchtower project, or scripted POC raid.

- Every structure foundation defines purpose, eligibility, grammar, function, history, ownership, states, connections, presentation, and validation requirements.

- Every critical route has valid endpoints, capacity, ownership, maintenance, state propagation, cross-chunk persistence, and a deterministic fallback or explicit reason it may fail.

- Generated settlements pass service-completeness checks appropriate to population, environment, culture, danger, technology, magic, and world settings.

- Culture and architecture remain separate from ancestry; mixed, migrant, conquered, restored, and hybrid settlements are supported.

- Ports, sky docks, underground stations, rails, utilities, mana nodes, and realm gates connect to actual network records rather than existing as scenery only.

- Ruins retain original function, historical layers, claims, occupation possibilities, salvage rules, restoration paths, and persistent outcomes.

- Wonders and megastructures define world function, history, access, outcomes, dynamic states, performance representation, save behaviour, and multiplayer authority.

- Construction, damage, closure, occupation, abandonment, restoration, and repurposing update services, routes, ecology, factions, quests, presentation, and saved history.

- Godot and Summer Engine tooling can generate, inspect, validate, diff, profile, migrate, and regression-test structure definitions, runtime records, route graphs, state modules, and named seeds.

- Accessibility validation covers entrances, circulation, signs, interaction reach, movement alternatives, rescue, camera comfort, reduced motion, non-colour cues, and multiplayer joining.

- [[24L - Content Registry, Cross-Link Matrix, Budgets and Production Roadmap]] reconciles final stable IDs, counts, dependencies, production status, asset budgets, schema versions, and cross-document update tracking before content lock.

# Document Completion Summary

[[24I - Structures, Landmarks, Routes, Wonders and World Infrastructure Atlas]] establishes the production Atlas for structures, landmarks, routes, roads, ports, stations, utilities, settlement infrastructure, ruins, wonders, and megastructures after retirement of the POC world. It defines deterministic placement, functional services, modular grammars, ownership, construction, damage, restoration, dynamic states, network graphs, realm infrastructure, presentation contracts, Godot/Summer Engine data direction, validation, and minimum completeness requirements.

The foundation registries introduce 96 Overworld structure and landmark families, 48 route and infrastructure families, 60 realm-structure families, 24 wonders and megastructures, 32 reusable modules, and 18 dynamic state profiles. These are authored foundations for later production classification and are not guarantees that every seed places every entry.

| **Next Atlas Volume**                                                                                                                                                                                                                                                                              |
|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 24J - Resources, Loot, Relics, Trade and Material Ecology Atlas will define how natural, cultural, creature, dungeon, boss, structure, and realm resources move through extraction, crafting, settlements, trade, ownership, scarcity, relic discovery, loot, restoration, and world-state change. |

---
## Navigation
- Previous: [[24H - Bosses, Titans, Siege Threats and Realm Guardians Atlas|24H]]
- Next: [[24J - Resources, Loot, Relics, Trade and Material Ecology Atlas|24J]]
- Index: [[00 - Document Set 24 Index]]
