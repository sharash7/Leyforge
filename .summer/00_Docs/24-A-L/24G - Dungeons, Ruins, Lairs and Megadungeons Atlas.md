---
title: 24G — Dungeons, Ruins, Lairs and Megadungeons Atlas
document_set: 24
document: 24G
aliases:
- 24G
- Document 24G
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
- 24g
---

# 24G — Dungeons, Ruins, Lairs and Megadungeons Atlas

> [!NOTE]
> Obsidian-ready Markdown conversion of the approved Set 24 source document. Source wording and structure have been preserved wherever possible.

**Fantasy Voxel Civilisation Sandbox**

**24G - World Content Atlas: Dungeons, Ruins, Lairs and Megadungeons Atlas**

Version 0.1 - Post-POC Production Content Draft

A database-ready Atlas for procedural dungeons, ruins, lairs, mines, crypts, temples, towers, fortresses, cities, living sites, mobile dungeons, dimension dungeons, megadungeons, room grammars, puzzles, hazards, ownership, restoration, rewards, and persistent world consequences.

| **Dungeons, Ruins, Lairs and Megadungeons Atlas Statement**                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Production worlds must not contain the retired Forest Hamlet cave, old rune clearing, goblin camp, watchtower chain, or any fixed POC dungeon arrangement. Every dungeon, ruin, lair, mine, fortress, realm site, and megadungeon is selected and assembled through deterministic seed-derived geology, history, culture, faction, ecology, magic, realm law, accessibility, and world-state rules. Sites are persistent places with origins, inhabitants, purposes, routes, transformations, and aftermath - not disposable rooms wrapped around loot.** |

| **Field**                | **Locked Direction**                                                                                                                                                                                                                                                                                                                                                   |
|--------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Document Scope**       | Full post-POC Atlas covering dungeon taxonomy, origins, scale, procedural grammar, rooms, zones, entrances, traversal, hazards, traps, puzzles, ecology, ownership, ruins, lairs, mines, crypts, temples, towers, fortresses, cities, living and mobile sites, dimension dungeons, megadungeons, restoration, rewards, registries, validation, and production budgets. |
| **POC Status**           | All valley-specific caves, rune ruins, goblin camps, fixed raid sites, tutorial locks, and POC-only dungeon relationships are archived and excluded from production generation.                                                                                                                                                                                        |
| **Core Philosophy**      | A dungeon must reveal history, support ecology or faction activity, provide meaningful traversal and decisions, and leave persistent consequences. It cannot exist only as a corridor of enemies and chests.                                                                                                                                                           |
| **Procedural Direction** | Authored families and modular grammars are combined deterministically. Layout variation must preserve identity, logic, accessibility, solvability, return routes, and readable environmental storytelling.                                                                                                                                                             |
| **Content Direction**    | Define 72 Overworld site-family foundations, 60 realm-dungeon foundations, 12 megadungeon foundations, 24 room modules, 20 hazard/trap modules, 16 puzzle grammars, and completeness contracts for biome and realm coverage.                                                                                                                                           |
| **Boss Boundary**        | 24G defines boss slots, arenas, site dependencies, alternate-resolution support, and aftermath sockets. 24H owns named boss families, full mechanics, phases, rewards, and world-boss production entries.                                                                                                                                                              |
| **Technical Direction**  | Use stable namespace IDs, deterministic layout seeds, persistent site-instance records, near/far simulation, save-safe state transitions, validation passes, and Godot/Summer Engine-aligned data registries.                                                                                                                                                          |

# Document Purpose

This document is the dungeon- and site-facing volume of Document Set 24, the World Content Atlas. It expands the structure foundation established in Document 12 and converts it into a post-POC production framework connected to the deterministic topology and history rules in 24A, the Overworld biome atlases in 24B and 24C, the realm laws and biome packages in 24D, the peoples and faction atlas in 24E, and the ecology atlas in 24F.

The Atlas owns dungeon identity, origin, topology, compatible room grammar, site state, ownership, ecology slots, realm-law interaction, placement, restoration possibilities, registry structure, and minimum content contracts. It does not replace final encounter scripting, combat movesets, individual boss design, final loot balance, quest writing, Forge asset specifications, or technical navigation implementation.

This volume formally supersedes every dungeon assumption created only to prove the POC. Production worlds receive no guaranteed cave, ruin, enemy camp, watchtower defence site, tutorial mana chamber, fixed first dungeon, fixed boss, or mandatory sequence of sites. Progression is protected through category-equivalent generation and validation rather than hardcoded content.

# Design Source and Supersession Rules

| **Source**                                     | **Atlas Requirement and 24G Use**                                                                                                                                                 |
|------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **00 - Master Game Design Bible**              | Dungeons must connect survival, civilisation, automation, magic, story, dimensions, danger, and world consequence rather than operate as isolated combat spaces.                  |
| **01 - Core Gameplay Loop**                    | Sites support explore -\> gather -\> craft -\> build -\> interact -\> automate -\> defend -\> upgrade -\> expand, but no fixed POC route survives.                                |
| **02 - Player Progression**                    | Dungeons provide knowledge, materials, faction access, bosses, realm routes, tools, alternate solutions, and settlement opportunities without becoming the only progression path. |
| **03-06 - Blocks, Items, Recipes, Resources**  | Dungeon grammars reference stable blocks, hazards, machines, locks, resources, loot families, repair recipes, construction materials, and realm-specific production chains.       |
| **07-10 - NPCs, Automation, Magic, Creatures** | Sites can house settlements, factions, workers, machines, wards, spirits, creatures, infestations, guardians, supply lines, and active simulation.                                |
| **11 - Biomes and World Generation**           | Site placement derives from geology, climate, terrain, water, routes, resource provinces, danger, civilisation, mana, and dynamic biome state.                                    |
| **12 - Structures**                            | 24G supersedes POC structure scope for dungeon families, procedural grammar, state transitions, restoration, ownership, and production registries.                                |
| **13-15 - Peoples, Dimensions, Quests/Events** | Builders, occupiers, cultural claims, realm laws, access routes, political consequences, authored stories, and simulation-driven events connect to every major site family.       |
| **16 - Combat, Gear and Defence**              | Rooms expose encounter spaces, cover, hazards, siege interactions, destructibility, retreat routes, and boss-arena sockets; combat tuning remains externally owned.               |
| **24A-24F - World Content Atlas**              | All site placement, history, biomes, realms, societies, ecology, personhood, and content-completeness rules are binding source layers.                                            |
| **24H-24L - Later Atlas Volumes**              | Bosses, infrastructure, loot, history/events, registry budgets, and production planning consume the site contracts defined here.                                                  |

# Static Table of Contents

1\. Locked Dungeon, Ruin, Lair and Megadungeon Atlas Identity

2\. Post-POC Production Decisions

3\. Authority and Cross-Document Ownership

4\. Site Taxonomy, Scale, Terminology, and Identity

5\. Origin, Builder, Purpose, Age, and Historical Layering

6\. Placement, Topology, Geological Fit, and World Relationships

7\. Site Hierarchy, Zones, Floors, Wings, and Subsites

8\. Authored Procedural Grammar and Deterministic Layout Assembly

9\. Entrances, Exits, Routes, Shortcuts, Return Safety, and Connectivity

10\. Traversal, Verticality, Water, Air, Pressure, Gravity, and Mobility

11\. Room, Chamber, Corridor, Node, and Set-Piece Module Library

12\. Environmental Systems, Hazards, Traps, and Counterplay

13\. Puzzle Grammars, Clues, Failure, Reset, and Accessibility

14\. Ecology, Population Layers, Nests, Guardians, and Invasives

15\. Ownership, Factions, Settlements, Occupation, and Conflict

16\. Ruins, Archaeology, Evidence, and Recoverable History

17\. Natural Lairs, Nests, Burrows, Hives, and Creature-Built Sites

18\. Mines, Quarries, Excavations, Workshops, and Industrial Sites

19\. Crypts, Tombs, Necropolises, Memorials, and Death Sites

20\. Shrines, Temples, Monasteries, Ritual Sites, and Sacred Trials

21\. Towers, Libraries, Archives, Laboratories, and Research Sites

22\. Fortresses, Castles, Prisons, Siegeworks, and Military Complexes

23\. Urban Ruins, Buried Cities, Drowned Settlements, and Civic Complexes

24\. Machine, Construct, Automation, and Ancient Infrastructure Sites

25\. Living, Organic, Shifting, Recursive, and Reality-Altering Dungeons

26\. Mobile, Roaming, Migrating, and Event-Bound Dungeons

27\. Megadungeons, Regional Complexes, and Multi-Session Expeditions

28\. Dimension Dungeon Laws and Realm-Specific Mechanics

29\. Detailed Overworld Dungeon and Site-Family Registry v0.1

30\. Detailed Realm Dungeon Registry v0.1

31\. Megadungeon Foundation Registry v0.1

32\. Boss, Guardian, Champion, and Sovereign Integration

33\. Loot, Resources, Relics, Knowledge, Salvage, and Reward Logic

34\. Quests, Events, Contracts, Rumours, and Dynamic Site Stories

35\. Site States, Persistence, Reoccupation, Reset, and Long-Term Change

36\. Claiming, Cleansing, Restoring, Converting, and Settlement Use

37\. Discovery, Mapping, Codex Truth, Names, Signs, and Foreshadowing

38\. Difficulty, Scaling, Multiplayer, Retreat, Recovery, and Fairness

39\. Presentation, Forge, Audio, VFX, Readability, and Environmental Storytelling

40\. Simulation LOD, Navigation, Saves, Performance, and Godot/Summer Engine Direction

41\. Data Models, Stable IDs, Registries, Validation, and Seed Testing

42\. Content Completeness Contracts and Production Budgets

43\. Balancing, Accessibility, Representation, and Player-Freedom Rules

44\. Cross-Document Update Plan

45\. Open Questions

Appendix A. Dungeon Family Definition Template

Appendix B. Room, Hazard, Trap, and Puzzle Module Templates

Appendix C. Site-State and Restoration Template

Appendix D. Dimension Dungeon Package Template

Appendix E. Completeness and Validation Matrix

Appendix F. Acceptance Criteria

# 1. Locked Dungeon, Ruin, Lair and Megadungeon Atlas Identity

The Dungeon Atlas is the explorable-site, archaeology, interior topology, and persistent-place layer of the world. It defines why a site exists, who created or occupied it, how it fits terrain and history, how it is entered and traversed, what systems operate inside it, what can claim or change it, and how its resolution affects the wider world.

| **Locked Rule**                                                                                                                                                                                                                                                                                                                                                        |
|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Every meaningful dungeon, ruin, lair, or megadungeon must answer at least one world question: what built it, inhabited it, damaged it, feeds it, protects it, uses it, remembers it, claims it, reveals it, unlocks it, restores it, or changes when the player intervenes? A site that cannot answer this is a decorative structure, not an Atlas dungeon family.** |

| **Identity Layer**         | **Design Meaning**                                                                                          | **Player-Facing Result**                                                               |
|----------------------------|-------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------|
| **Exploration Place**      | Sites have readable entrances, topology, routes, landmarks, hazards, secrets, and return paths.             | Exploration is spatial and memorable rather than a sequence of random rooms.           |
| **History Evidence**       | Architecture, damage, ownership, tools, graves, records, repairs, and reused spaces reveal layered history. | Players discover what happened through the world, not only through exposition.         |
| **Living Territory**       | Creatures, factions, settlers, machines, spirits, and ecosystems use rooms for real purposes.               | Clearing one room can change patrols, food chains, production, trade, or local danger. |
| **System Challenge**       | Traversal, combat, puzzles, environment, magic, automation, negotiation, and preparation can all matter.    | Different playstyles receive viable approaches and meaningful counterplay.             |
| **Progression and Reward** | Sites reveal knowledge, materials, allies, routes, relics, bosses, cultures, and realm access.              | Rewards expand possibility instead of only increasing numerical power.                 |
| **Persistent World State** | Sites can be occupied, damaged, looted, sealed, restored, claimed, repurposed, reoccupied, or transformed.  | The world remembers what the player and factions did.                                  |
| **Data-Driven Variety**    | Families inherit grammars, modules, constraints, state machines, and presentation rules.                    | Seeds create variety without losing authored identity or becoming incoherent.          |

## 1.1 What this Atlas prevents

- Random corridors that do not match architecture, geology, creator, age, or purpose.

- Locked doors with missing keys, circular dependencies, impossible jumps, or no recovery path.

- Identical dungeon layouts recoloured for different biomes or dimensions.

- Rooms filled with enemies that have no food, route, nest, faction, supply, or reason to be present.

- Ancient ruins that contain modern production lines without a historical explanation.

- Megadungeons that are only larger ordinary dungeons with inflated health and loot.

- Permanent soft-locks caused by collapsing entrances, portal failure, multiplayer separation, or realm-law changes.

- Automatic classification of a settlement, culture, undead society, goblin enclave, or awakened construct community as a monster dungeon.

# 2. Post-POC Production Decisions

| **Area**              | **Locked Production Decision**                                                                                                                                              |
|-----------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **POC Retirement**    | Archive all POC caves, rune clearing, goblin camp, watchtower defence site, fixed raid route, tutorial locks, and scenario-specific layout bindings.                        |
| **Site Families**     | Use authored families with coherent origin, builder, purpose, topology, room grammar, state, ecology, reward, and presentation rules.                                       |
| **Procedural Layout** | Generate layouts from bounded grammars and required logical relationships; do not use unconstrained room shuffling.                                                         |
| **World History**     | Every major site receives at least an origin layer, one historical transition, and a current-state explanation.                                                             |
| **Solvability**       | Generation validates entrances, critical path, alternate route policy, lock/key order, puzzle dependency, boss access, return safety, and multiplayer joins.                |
| **Dimensions**        | Every major realm receives multiple dungeon families whose navigation and puzzles use realm laws rather than only different materials.                                      |
| **Megadungeons**      | Megadungeons persist across many expeditions, contain districts and factions, support shortcuts and logistics, and produce regional consequences.                           |
| **Ecology**           | 24F population and dungeon-ecology modules govern inhabitants; unexplained point spawning is a fallback, not the default.                                                   |
| **Bosses**            | 24G creates encounter sockets and site consequences; 24H owns complete boss entries.                                                                                        |
| **Restoration**       | Suitable sites can be cleansed, repaired, claimed, settled, industrialised, studied, sealed, or handed to factions.                                                         |
| **Reset Policy**      | Ordinary site state persists. Limited replenishment, migration, faction reoccupation, realm recursion, or world-setting resets are explicit family rules.                   |
| **Technical**         | Generated site identity, layout seed, revealed map, destroyed blocks, opened locks, solved puzzles, owners, populations, loot state, and restoration are save-safe records. |

# 3. Authority and Cross-Document Ownership

| **Question**                               | **Primary Owner**              | **24G Responsibility**                                                                                                       |
|--------------------------------------------|--------------------------------|------------------------------------------------------------------------------------------------------------------------------|
| **Where can a site appear?**               | 24A-24D                        | Defines site constraints, spacing, topology, entrances, biome/realm compatibility, and local repair rules.                   |
| **Who built, claims, or occupies it?**     | 24E / 24K                      | Stores compatible creators, owners, occupiers, claims, cultural meanings, and state transitions.                             |
| **What lives there?**                      | 24F                            | Consumes ecology packages and defines room habitats, population sockets, refuges, routes, and reoccupation capacity.         |
| **What boss appears?**                     | 24H                            | Provides arena constraints, guardian slots, awakening links, alternate resolution support, and aftermath sockets.            |
| **What structures and routes connect it?** | 24I                            | Defines site-internal topology and connection requirements consumed by roads, ports, gates, lifts, and world infrastructure. |
| **What rewards exist?**                    | 24J                            | Defines reward positions, rarity bands, source logic, salvage states, ownership, and depletion without final item lists.     |
| **What happened and what can happen?**     | 24K                            | Defines evidence slots, historical layers, event hooks, quest states, rumours, and dynamic stories.                          |
| **How is it implemented and budgeted?**    | 24L / rewritten technical plan | Defines stable data contracts, validation expectations, simulation state, and performance-sensitive boundaries.              |

# 4. Site Taxonomy, Scale, Terminology, and Identity

| **Term**              | **Atlas Meaning**                                                                                                    | **Typical Scope**                                                           |
|-----------------------|----------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------|
| **Point of Interest** | Small discoverable site with one primary interaction or clue.                                                        | One room, chamber, camp, shrine, cache, or environmental puzzle.            |
| **Micro-dungeon**     | Short authored/procedural site with a compact loop and climax.                                                       | 3-8 modules; 5-20 minutes.                                                  |
| **Lair / Nest**       | Creature-created or creature-adapted territory organised around ecology.                                             | Den, hive, burrow, roost, spawning ground, feeding route, guardian chamber. |
| **Ruin**              | Built site whose original function is damaged, abandoned, buried, flooded, reclaimed, or reoccupied.                 | Any scale; history and state are central.                                   |
| **Dungeon**           | Bounded explorable site with coherent topology, challenges, state, and resolution.                                   | Small to large; one or more zones.                                          |
| **Complex**           | Several linked structures, wings, levels, routes, or functions under one site identity.                              | Mine network, fortress, academy, industrial district, necropolis.           |
| **Megadungeon**       | Regional, multi-district, persistent expedition space with many entrances, factions, states, and progression layers. | Many sessions; logistics, shortcuts, settlements, and regional effects.     |
| **Mobile Dungeon**    | Site whose location or topology moves through migration, vehicle, creature, weather, dream, or event logic.          | Roaming fortress, living leviathan, walking city, storm citadel.            |
| **Realm Dungeon**     | Site whose topology, permissions, puzzles, and hazards require dimension-specific laws.                              | Any scale inside or between realms.                                         |

## 4.1 Scale bands

| **Scale**             | **Module Target**          | **Expected Features**                                                                                                            |
|-----------------------|----------------------------|----------------------------------------------------------------------------------------------------------------------------------|
| **S0 - Site Feature** | 1-2                        | Single clue, resource, hazard, shrine, den, chamber, or route obstruction.                                                       |
| **S1 - Micro**        | 3-8                        | Entrance, short loop, one special room, one resolution, limited return value.                                                    |
| **S2 - Small**        | 8-18                       | Two route choices, shortcut, environmental identity, several encounters, minor climax.                                           |
| **S3 - Standard**     | 18-40                      | Multiple zones, locks/puzzles, ecology layers, history, faction or guardian, persistent state.                                   |
| **S4 - Large**        | 40-90                      | Several wings/floors, service routes, faction control, major set-pieces, boss slot, restoration potential.                       |
| **S5 - Complex**      | 90-180                     | Districts, multiple entrances, settlement/industry functions, route network, evolving ownership.                                 |
| **S6 - Megadungeon**  | 180+ or streamed districts | Regional topology, expedition logistics, many factions, deep progression, persistent macro-state, no single-session expectation. |

# 5. Origin, Builder, Purpose, Age, and Historical Layering

Site identity begins before layout. The generator first selects why the site exists, who or what created it, what the original functions required, how time and events changed it, and why it is currently explorable. Rooms are consequences of purpose and history, not interchangeable shapes.

| **Layer**                      | **Required Questions**                                                                                          | **Examples**                                                                                       |
|--------------------------------|-----------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------|
| **Natural Foundation**         | What geology, water, organism, pressure, root, ice, or realm process formed the space?                          | Cavern, lava tube, root hollow, coral labyrinth, gravity fracture, fossil body.                    |
| **Original Builder / Creator** | Who designed, grew, excavated, dreamed, assembled, or bound it?                                                 | Kingdom, guild, cult, machine intelligence, creature colony, realm sovereign.                      |
| **Original Purpose**           | What activities required rooms, routes, storage, defence, ritual, labour, ventilation, water, power, or access? | Mine, archive, prison, sanctuary, workshop, transit hub, palace, research site.                    |
| **Historical Transition**      | What changed ownership, function, structure, or law?                                                            | War, abandonment, collapse, plague, flood, coup, realm breach, resource exhaustion.                |
| **Current Occupation**         | Who uses it now, and how have they adapted it?                                                                  | Refugees, raiders, spirits, wildlife, miners, scholars, machines, invasive fauna.                  |
| **Current Pressure**           | Why does the site matter now?                                                                                   | Threat source, strategic route, relic, settlement need, boss awakening, resource, political claim. |
| **Potential Future**           | What state changes can player/faction action cause?                                                             | Restore, seal, conquer, cleanse, industrialise, relocate occupants, reopen route.                  |

# 6. Placement, Topology, Geological Fit, and World Relationships

| **Placement Input**            | **Dungeon Requirement**                                                                                                                          |
|--------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------|
| **Terrain and Geology**        | Entrances, volume, depth, supports, materials, collapse profile, water table, heat, pressure, and extraction history must fit the local terrain. |
| **Climate and Water**          | Flooding, erosion, ice, vegetation, corrosion, ventilation, tides, storms, and seasonal access can change routes.                                |
| **Region History**             | Builders, trade routes, wars, migrations, disasters, religion, resources, and previous settlements shape site family and age.                    |
| **Civilisation and Territory** | Current factions need plausible access, supply, claims, patrols, labour, law, and diplomatic relationships.                                      |
| **Ecology**                    | Food, water, refuge, nesting, prey, waste, mana, heat, and migration determine viable inhabitants.                                               |
| **Magic and Realm Law**        | Leylines, corruption, spirits, vows, dream coherence, gravity, pressure, contract law, or machine protocols can alter topology.                  |
| **Progression**                | Sites may offer capability routes, but no single named site is required. Validation places category-equivalent opportunities.                    |
| **Spacing and Repetition**     | Family cooldown, motif reuse, rarity, uniqueness scope, route density, and landmark visibility prevent clustering and monotony.                  |

# 7. Site Hierarchy, Zones, Floors, Wings, and Subsites

| **Hierarchy Level**   | **Purpose**                                                                                                          | **Persistent Identity**                                  |
|-----------------------|----------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------|
| **Site Instance**     | Owns stable runtime identity, world position, layout seed, discovery, owners, history, macro-state, and save record. | site_instance.\<ULID\>                                   |
| **District / Region** | Large functional or thematic portion that can stream and simulate separately.                                        | Foundry district, royal crypt, lower mine, fungal basin. |
| **Zone / Wing**       | Owns local rule set, encounter pool, ecology, puzzle chain, state, and map landmark.                                 | Archive wing, flooded ward, prison block.                |
| **Module / Room**     | Authored spatial unit with entrances, sockets, tags, variants, hazards, props, and state hooks.                      | Hall, shaft, shrine chamber, nest room.                  |
| **Feature / Socket**  | Small placement point for doors, loot, clues, machines, creatures, traps, routes, or set-pieces.                     | Lock socket, ambush ledge, ventilation grate.            |
| **Subsite**           | Nested dungeon or pocket with its own identity and rules, linked to the parent.                                      | Sealed vault, dream memory, tomb below a fortress.       |

# 8. Authored Procedural Grammar and Deterministic Layout Assembly

1.  Select site family from placement constraints, history, progression role, rarity, and local content budgets.

2.  Resolve origin, builder, purpose, age, transitions, current state, owner, ecology package, and realm-law profile.

3.  Choose scale band, required zones, critical functions, entrances, exits, boss/guardian slot policy, and restoration possibilities.

4.  Build a logical adjacency graph before geometry: public/service, clean/dirty, living/industrial, sacred/profane, secure/insecure, dry/flooded, powered/unpowered.

5.  Assign authored room modules and connector variants to graph nodes using hard constraints, soft preferences, motif cooldown, silhouette, and traversal policy.

6.  Generate geometry, terrain integration, destruction, collapse, water, vegetation, machines, runes, props, signs, clues, inhabitants, and loot sockets.

7.  Validate pathing, lock/key order, puzzle dependencies, reachable rewards, alternate-route policy, retreat, return, multiplayer joins, and accessibility settings.

8.  Persist layout seed and state; runtime changes become deltas and never silently regenerate explored space.

## 8.1 Grammar principles

| **Principle**                  | **Locked Rule**                                                                                                                     |
|--------------------------------|-------------------------------------------------------------------------------------------------------------------------------------|
| **Identity First**             | Family grammar limits shapes, proportions, materials, route styles, room purposes, and signature set-pieces.                        |
| **Function Before Decoration** | A mine needs extraction faces, hauling, supports, waste, power, ventilation, storage, and worker access before decorative dressing. |
| **Critical Path Clarity**      | Primary progression path is readable through architecture, light, sound, signs, damage, faction behaviour, or map evidence.         |
| **Optional Depth**             | Secrets, loops, bypasses, lore, resources, and risks branch from the critical path without making mandatory progression obscure.    |
| **No Impossible Dependencies** | A key, tool, clue, power source, NPC, or realm state cannot be required before the player can reasonably obtain or understand it.   |
| **Controlled Surprise**        | Rare room modules and topology changes are selected from compatible pools; novelty never overrides coherence or solvability.        |

# 9. Entrances, Exits, Routes, Shortcuts, Return Safety, and Connectivity

| **Route Element**       | **Requirements**                                                                                                                                         |
|-------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Primary Entrance**    | Readable approach, arrival safety band, identity reveal, route back, and no unavoidable immediate lethal encounter unless explicitly telegraphed.        |
| **Alternate Entrance**  | Supports exploration, faction access, tools, ecology routes, water, collapse, climbing, diplomacy, or later shortcuts.                                   |
| **Service Route**       | Explains movement of workers, goods, waste, prisoners, power, water, creatures, or machinery.                                                            |
| **Emergency Exit**      | Provides evacuation, collapse recovery, realm failure, boss aftermath, or multiplayer rescue where the family requires it.                               |
| **Shortcut**            | Unlocks persistent return efficiency through door, lift, bridge, tunnel, gate, portal, cleared hazard, restored machine, or faction permission.          |
| **One-Way Drop**        | Must be telegraphed, provide safe landing, and guarantee an eventual route or recovery method.                                                           |
| **World Connection**    | Road, cave network, river, coast, skyway, rail, rootway, leyline, portal, procession, or faction route links the site to the region.                     |
| **Return Failure Rule** | If the original entrance collapses or moves, a validated alternate exit, rescue state, realm anchor, or deliberate high-consequence warning is required. |

# 10. Traversal, Verticality, Water, Air, Pressure, Gravity, and Mobility

| **Traversal Family**         | **Dungeon Uses**                                                                    | **Counterplay / Access**                                                |
|------------------------------|-------------------------------------------------------------------------------------|-------------------------------------------------------------------------|
| **Ground and Block Editing** | Stairs, slopes, rubble, tunnels, bridges, destructible barriers, construction gaps. | Tools, blocks, braces, ramps, repair, digging permissions.              |
| **Climb and Grapple**        | Shafts, towers, roots, walls, chains, scaffolds, cliff interiors.                   | Ladders, ropes, grapples, mounts, spells, restored lifts.               |
| **Water and Flooding**       | Canals, drowned halls, tides, currents, valves, buoyancy, submerged routes.         | Breathing, boats, pumps, seals, drainage, water magic.                  |
| **Air and Wind**             | Sky ruins, ventilation, updrafts, storm corridors, gliding, moving islands.         | Glider, anchors, wind control, tether paths, shelters.                  |
| **Heat and Pressure**        | Deep mines, magma works, Impossible Deep, sealed industrial sites.                  | Cooling, pressure suits, reinforcement, safe chambers, timed exposure.  |
| **Gravity and Orientation**  | Aetheric, Void, ancient magic, rotating machine sectors.                            | Anchors, orientation cues, gravity controls, tethering, map modes.      |
| **Portal and Spatial**       | Shortcuts, disjoint rooms, realm overlaps, recursion, gate networks.                | Stable anchors, sequence clues, map memory, route permissions.          |
| **Social / Legal**           | Guarded gates, sacred thresholds, contracts, citizenship, faction passages.         | Reputation, disguise, dialogue, law, bribery, quests, alternate routes. |

# 11. Room, Chamber, Corridor, Node, and Set-Piece Module Library

| **Module**                   | **Required Function**                                                                                   |
|------------------------------|---------------------------------------------------------------------------------------------------------|
| **Entrance Threshold**       | Introduces site identity, state, danger, owner, route back, and first landmark.                         |
| **Orientation Hall**         | Central landmark with maps, signs, sightlines, branching routes, or vertical overview.                  |
| **Transit Corridor**         | Connects functions; width, defence, wear, traffic, service access, and materials reflect purpose.       |
| **Service Passage**          | Maintenance, ventilation, waste, supply, staff, creature, or secret bypass route.                       |
| **Vertical Shaft**           | Lift, ladder, chain, roots, water, rubble, gliding, climbing, or falling traversal.                     |
| **Resource Chamber**         | Ore, crystal, fungus, water, relic salvage, workshop stock, biological harvest, or strategic deposit.   |
| **Storage / Treasury**       | Goods organised by original and current owners; locks, records, traps, depletion, and claims apply.     |
| **Workshop / Production**    | Machines, tools, power, inputs, outputs, hazards, repair, automation, and operator routes.              |
| **Living Quarters**          | Beds, food, family, hierarchy, sanitation, belongings, schedules, and evidence of occupants.            |
| **Guard / Control Post**     | Surveillance, alarm, gates, cover, weapon storage, patrol routes, and command visibility.               |
| **Ritual / Sacred Chamber**  | Threshold rules, offerings, symbols, acoustics, alignment, vows, spirits, and consequences.             |
| **Archive / Knowledge Room** | Books, memory, records, diagrams, machine data, maps, translation, and authenticity.                    |
| **Prison / Containment**     | Cells, restraints, observation, feeding, law, escape, ethics, and what was contained.                   |
| **Water / Utility Node**     | Well, cistern, drain, pump, canal, coolant, sewage, pressure, irrigation, or flood control.             |
| **Power / Mana Node**        | Fuel, shaft, battery, conduit, leyline, core, ward, control, overload, and shutdown.                    |
| **Ecology Refuge**           | Nest, roost, nursery, feeding ground, fungus bed, carrion zone, safe den, or invasive pocket.           |
| **Puzzle Chamber**           | Clue network, state machine, feedback, reset, bypass policy, and reward.                                |
| **Hazard Set-Piece**         | Large environmental challenge with preparation, safe observations, counterplay, and persistent outcome. |
| **Faction Commons**          | Trade, negotiation, social life, command, worship, labour, or settlement functions.                     |
| **Boss / Guardian Arena**    | Readable mechanics, phase support, escape policy, terrain sockets, alternate resolution, aftermath.     |
| **Secret / Hidden Room**     | Discoverable through evidence, tool, route, lore, perception, faction knowledge, or environment.        |
| **Rest / Safe Chamber**      | Bounded safety, recovery, expedition logistics, map update, multiplayer regroup, or checkpoint policy.  |
| **Exit / Transition Node**   | Returns to world, changes district, enters subsite, crosses realm, or reveals future route.             |
| **Signature Family Room**    | Unique motif that makes the site family recognisable and worth revisiting.                              |

# 12. Environmental Systems, Hazards, Traps, and Counterplay

Hazards are world systems with evidence, rules, counterplay, and state. Traps are intentionally placed or evolved hazards with an owner, builder, creature, machine, or historical explanation. Difficulty can shorten warnings or increase consequences, but normal settings must not rely on invisible instant punishment.

| **Hazard / Trap Module**        | **Readable Evidence**                                                 | **Counterplay**                                                             |
|---------------------------------|-----------------------------------------------------------------------|-----------------------------------------------------------------------------|
| **Collapse and Falling Debris** | Cracks, dust, strained supports, sound, recent movement.              | Brace, reroute, lighten load, repair, trigger safely, use magic.            |
| **Flood and Current**           | Water marks, drains, roar, pressure doors, tide signs.                | Pump, valve, swim, boat, seal, wait for tide, water magic.                  |
| **Fire, Heat, Magma**           | Glow, smoke, heat shimmer, burnt material, ventilation.               | Cooling, insulation, route timing, shut fuel, redirect flow.                |
| **Cold, Ice, Avalanche**        | Frost, wind, cracking ice, snow load, frozen mechanisms.              | Heat, traction, shelter, braces, melt or reroute.                           |
| **Gas, Smoke, Spores**          | Dead fauna, colour, smell cues, masks, vents, fungal growth.          | Ventilate, filter, burn carefully, seal, cleanse, time exposure.            |
| **Pressure and Vacuum**         | Warning gauges, sealed doors, deformation, air loss.                  | Pressure gear, equalise, reinforce, restore seals, emergency chambers.      |
| **Electric and Storm**          | Charged surfaces, sparks, hair rise, thunder, conductive paths.       | Ground, insulate, reroute, discharge, disable power.                        |
| **Mana Instability**            | Rune flicker, gravity shifts, sound distortion, corrupted blocks.     | Stabilise, cleanse, tune, drain, shield, use alternate route.               |
| **Corruption / Blight**         | Mutated matter, residue, hostile growth, sickness, altered creatures. | Ward, cleanse, contain, remove source, negotiate with custodian.            |
| **Spirit / Memory Hazard**      | Whispers, missing names, repeated scenes, cold zones.                 | Remember, identify, perform rites, anchor, reconcile, avoid exploitation.   |
| **Mechanical Trap**             | Visible seams, trip systems, wear, maintenance access.                | Disarm, jam, reroute power, use shield, find operator route.                |
| **Rune / Magical Trap**         | Glyphs, mana flow, ward boundary, catalyst residue.                   | Decode, drain, counter-rune, permission, sacrifice alternative.             |
| **Biological Trap**             | Camouflage, feeding remains, disturbed substrate, colony signals.     | Observe, lure, calm, smoke, repel, avoid nursery.                           |
| **Security Alarm**              | Bells, runes, sensors, patrol response, sealed sectors.               | Disable, spoof, gain permission, silence witnesses, accept response.        |
| **Spatial Loop**                | Repeated landmarks, map inconsistencies, anchor loss.                 | Sequence, mark route, restore anchor, break rule, use realm knowledge.      |
| **Time Distortion**             | Accelerated decay, repeated motions, clocks, age gradients.           | Synchronise, limit exposure, stabilise, choose temporal route.              |
| **Contract / Legal Trap**       | Inscribed terms, witnesses, thresholds, ownership marks.              | Read, negotiate, refuse, satisfy, exploit lawful alternate route.           |
| **Destructible Defence**        | Barricades, murder holes, gates, towers, siege points.                | Assault, undermine, negotiate, sabotage supply, build counterworks.         |
| **Moving Architecture**         | Gears, roots, tides, shifting walls, migrating chambers.              | Time movement, control system, anchor rooms, map cycles.                    |
| **Resource Extraction Risk**    | Unstable vein, pressure pocket, dormant guardian, contamination.      | Survey, stabilise, harvest sustainably, leave resource, accept consequence. |

# 13. Puzzle Grammars, Clues, Failure, Reset, and Accessibility

| **Puzzle Grammar**           | **Core Interaction**                                                                                      |
|------------------------------|-----------------------------------------------------------------------------------------------------------|
| **Power Routing**            | Connect or balance mechanical, mana, elemental, coolant, or pressure networks.                            |
| **Spatial Sequence**         | Traverse rooms, symbols, doors, portals, or landmarks in a discoverable order.                            |
| **Environmental State**      | Change water, fire, ice, light, wind, growth, gravity, season, or corruption to open routes.              |
| **Language and Translation** | Combine inscriptions, dialects, symbols, diagrams, context, and NPC knowledge.                            |
| **History Reconstruction**   | Place events, owners, names, remains, artefacts, or memories into a coherent account.                     |
| **Sound and Rhythm**         | Use audible patterns, echoes, instruments, machine cadence, creature calls, or ritual response.           |
| **Light and Shadow**         | Redirect, block, colour, reflect, or time light across architecture and symbols.                          |
| **Weight and Balance**       | Move blocks, water, counterweights, creatures, cargo, or players to stabilise mechanisms.                 |
| **Logic and Protocol**       | Set permissions, conditions, priorities, production orders, or machine-state rules.                       |
| **Social Permission**        | Obtain trust, title, testimony, oath, contract, disguise, invitation, or lawful authority.                |
| **Ecology Understanding**    | Follow migration, feeding, nesting, pollination, symbiosis, fear, or territory rules.                     |
| **Memory / Dream Logic**     | Use remembered names, emotions, repeated scenes, lucidity, expectation, or waking anchors.                |
| **Realm-Law Trial**          | Act according to promises, taboo, truth, ownership, elemental balance, or pocket rules.                   |
| **Cooperative Mechanism**    | Supports solo substitution and multiplayer simultaneous roles without requiring another player.           |
| **Construction / Repair**    | Rebuild bridge, brace shaft, restore conduit, assemble device, redirect route, or supply exact materials. |
| **Optional Master Puzzle**   | Long-form cross-zone mystery whose reward is powerful but never required for basic exit safety.           |

| **Puzzle Rule**     | **Locked Requirement**                                                                                                                        |
|---------------------|-----------------------------------------------------------------------------------------------------------------------------------------------|
| **Clue Redundancy** | Critical puzzles have at least two clue channels where practical: visual, audio, text, environment, NPC, item, or system feedback.            |
| **State Feedback**  | Every interaction visibly or audibly communicates whether the site accepted, rejected, partially advanced, reset, or changed state.           |
| **Failure**         | Failure creates bounded cost, alternate state, encounter, delay, damage, or route change; it does not silently destroy essential progression. |
| **Reset**           | Manual reset, cycle reset, alternate bypass, external repair, or persistent solved state is defined per puzzle.                               |
| **Accessibility**   | Colour is never the only signal; timing windows, memory load, audio-only cues, precision, and simultaneous input can be adjusted.             |
| **Bypass Policy**   | Combat, tool, magic, faction, construction, resource, knowledge, or difficulty-based bypasses are defined where compatible.                   |

# 14. Ecology, Population Layers, Nests, Guardians, and Invasives

| **Population Layer**         | **Dungeon Function**                                                                                               |
|------------------------------|--------------------------------------------------------------------------------------------------------------------|
| **Ambient**                  | Small life, insects, spores, sounds, tracks, or spirits indicate environmental condition.                          |
| **Producer / Energy Source** | Fungus, plants, algae, mana seep, heat, waste, carrion, memory, soul residue, or machine by-product supports life. |
| **Prey / Grazer**            | Feeds predators and demonstrates routes, water, safe pockets, and disturbance.                                     |
| **Predator / Territorial**   | Controls passages, hunts inhabitants, creates danger zones, and may be displaced rather than killed.               |
| **Scavenger / Parasite**     | Follows battles, waste, machinery, corpses, storage, or settlement activity.                                       |
| **Guardian**                 | Bound, trained, constructed, spiritual, legal, ecological, or faction-aligned protector.                           |
| **Invasive**                 | Entered through breach, trade, migration, occupation, or player action and destabilises existing layers.           |
| **Boss Ecology**             | Controls territory, route, population, resource, law, or site state; 24H expands full encounter.                   |
| **Captive / Managed**        | Farmed, studied, imprisoned, worshipped, exploited, rescued, or protected by occupants.                            |

# 15. Ownership, Factions, Settlements, Occupation, and Conflict

| **State**                      | **Meaning and Gameplay**                                                                                                                        |
|--------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------|
| **Unclaimed**                  | No recognised owner; may still contain ecology, spirits, law, traps, or historical claims.                                                      |
| **Ancestral / Cultural Claim** | A people or culture considers the site sacred, stolen, inherited, taboo, or part of identity even if absent.                                    |
| **Faction-Controlled**         | Patrols, supply, law, production, taxation, access, prisoners, trade, and reinforcement are simulated.                                          |
| **Settled**                    | Residents have homes, work, needs, storage, families, sanitation, safety, and political relationships; not automatically a dungeon enemy space. |
| **Occupied / Reused**          | Current inhabitants adapt rooms and systems without controlling the whole complex.                                                              |
| **Contested**                  | Several owners, creatures, factions, or site intelligences control different zones and routes.                                                  |
| **Besieged**                   | Supply, gates, morale, civilians, breaches, artillery, relief routes, and aftermath matter.                                                     |
| **Quarantined**                | Disease, corruption, unstable magic, invasive species, forbidden research, or realm breach limits access.                                       |
| **Player / Allied Claim**      | Permissions, upkeep, residents, restoration, automation, defence, and faction reactions become active.                                          |

# 16. Ruins, Archaeology, Evidence, and Recoverable History

Ruin generation preserves evidence of original function and each major transition. Damage is directional and causal: siege breaches face attackers, flood residue follows water, fire spreads from fuel and ventilation, collapse follows supports, looting targets valuable and portable goods, and later occupants alter only the spaces they use.

| **Evidence Channel**      | **Examples**                                                                     | **Reliability**                                                        |
|---------------------------|----------------------------------------------------------------------------------|------------------------------------------------------------------------|
| **Architecture**          | Room proportions, hierarchy, access, service routes, materials, symbols.         | Usually strong for original function; later reuse can obscure it.      |
| **Damage and Repair**     | Breaches, burns, patched walls, braces, blocked doors, collapsed shafts.         | Strong for events but interpretation may remain disputed.              |
| **Objects and Waste**     | Tools, food, containers, toys, weapons, production scraps, ritual residue.       | Strong for daily use and current occupation.                           |
| **Bodies and Remains**    | Position, injury, burial, species, equipment, missing parts, memorial treatment. | Sensitive; cultural and legal rules apply.                             |
| **Records and Maps**      | Books, ledgers, machine logs, carvings, memories, testimony, contracts.          | May be incomplete, biased, forged, translated, or corrupted.           |
| **Ecology**               | Succession, nest age, invasive spread, fungus, roots, scavenger patterns.        | Useful for time and disturbance.                                       |
| **Magic / Realm Imprint** | Wards, oaths, spirits, echoes, dream residue, void erosion, divine law.          | Requires knowledge and may reflect belief rather than objective truth. |

# 17. Natural Lairs, Nests, Burrows, Hives, and Creature-Built Sites

| **Family Rule**        | **Requirement**                                                                                                                                             |
|------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Formation**          | Creature scale, locomotion, material handling, lifecycle, group structure, nesting, feeding, waste, and defence shape topology.                             |
| **Ecological Source**  | Food, water, shelter, heat, mana, breeding conditions, prey routes, or settlement waste explains location.                                                  |
| **Readable Zones**     | Entrance tracks, feeding zone, refuse, nursery, resting area, defensive choke, escape route, and apex/queen chamber where relevant.                         |
| **Non-Combat Options** | Observe, avoid, repel, relocate, tame, rescue, cleanse, seal, negotiate through handlers, or alter food source.                                             |
| **Persistence**        | Removing inhabitants does not erase the site. Other species, poachers, settlers, factions, or restored ecology may reuse it.                                |
| **Personhood**         | A settlement built by sapient beings remains a settlement or faction site, even when hostile. Creature-built classification applies only where appropriate. |

# 18. Mines, Quarries, Excavations, Workshops, and Industrial Sites

| **Functional Zone**        | **Required Logic**                                                                                                  |
|----------------------------|---------------------------------------------------------------------------------------------------------------------|
| **Extraction Face**        | Material source, survey evidence, tool marks, instability, purity/grade, remaining deposit, and hazard.             |
| **Haulage**                | Carts, chutes, roads, lifts, rails, ramps, conveyors, golems, water, or manual routes connect face to processing.   |
| **Processing**             | Crusher, wash, furnace, saw, forge, refinery, mana furnace, waste, fuel, coolant, power, and operator access.       |
| **Support and Safety**     | Bracing, ventilation, drainage, firebreaks, pressure doors, shelters, inspections, and failure evidence.            |
| **Worker Life**            | Housing, food, storage, sanitation, medicine, worship, recreation, hierarchy, and labour conditions.                |
| **Security and Ownership** | Claims, contracts, guards, taxes, smuggling, sabotage, strikes, occupation, and faction competition.                |
| **Restoration / Reuse**    | Restart production, convert to settlement, seal hazard, create transit route, research site, or ecological reserve. |

# 19. Crypts, Tombs, Necropolises, Memorials, and Death Sites

Death sites are cultural and legal places before they are combat spaces. Their treatment depends on burial tradition, ancestry, faith, soul law, remains ownership, memory, mourning, necromancy, ancestor relationships, and whether the dead retain personhood or citizenship.

| **Site Concern**         | **Locked Rule**                                                                                                                                                 |
|--------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Burial Logic**         | Placement, procession, grave goods, memorial hierarchy, family, profession, status, cause of death, and maintenance reflect culture.                            |
| **Undead Presence**      | Undead are not automatically hostile or mindless. Identity, consent, law, faction, condition, and current objective determine classification.                   |
| **Desecration**          | Looting remains, breaking seals, moving bodies, using soul resources, or disturbing memory can create reputation, legal, spiritual, or ecological consequences. |
| **Alternate Resolution** | Rites, identification, reconciliation, repair, memorial restoration, diplomacy, exorcism, cleansing, lawful transfer, or containment may replace combat.        |
| **Reward**               | Knowledge, inheritance, permission, recovered identity, cultural trust, route access, relic stewardship, and ethical resources are valid rewards.               |

# 20. Shrines, Temples, Monasteries, Ritual Sites, and Sacred Trials

| **Element**            | **Requirement**                                                                                                                                       |
|------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Sacred Geometry**    | Orientation, procession, thresholds, acoustics, light, water, offerings, celestial or leyline alignment, and congregation shape layout.               |
| **Law and Permission** | Taboo, invitation, role, vow, purity, pilgrimage, truth, hospitality, ownership, and ritual competence can control access.                            |
| **Current Use**        | Active worship, abandoned faith, disputed ownership, occupation, corruption, reform, pilgrimage, refuge, research, or tourism.                        |
| **Trial Design**       | Tests can involve conduct, knowledge, sacrifice alternatives, protection, construction, compassion, truth, restraint, or realm law - not only combat. |
| **World Outcome**      | Restoration can affect blessings, roads, settlement morale, spirit safety, weather, faction legitimacy, realm routes, or religious politics.          |

# 21. Towers, Libraries, Archives, Laboratories, and Research Sites

| **Family**                 | **Topology and Systems**                                                                                                               |
|----------------------------|----------------------------------------------------------------------------------------------------------------------------------------|
| **Watch / Signal Tower**   | Vertical sightlines, signal chain, guard spaces, weather exposure, stairs/lifts, storage, and regional communication.                  |
| **Mage Tower**             | Mana intake, laboratories, libraries, ritual rooms, containment, living spaces, apprentices, experiments, and ward failure.            |
| **Archive / Library**      | Public/restricted stacks, cataloguing, climate control, reading, translation, security, records, hidden collections, and preservation. |
| **Observatory**            | Sky access, instruments, alignment, weather, lenses, rotating structures, prophecy, starfall, or dimensional observation.              |
| **Alchemy / Research Lab** | Inputs, waste, ventilation, safety, specimens, records, containment, power, failed experiments, and ethics.                            |
| **Machine Research Site**  | Protocol access, testing bays, assembly, coolant, logic, archives, shutdown, runaway processes, and construct rights.                  |

# 22. Fortresses, Castles, Prisons, Siegeworks, and Military Complexes

| **Layer**                | **Required Features**                                                                                                            |
|--------------------------|----------------------------------------------------------------------------------------------------------------------------------|
| **Approach Defence**     | Terrain, roads, kill zones, walls, towers, patrols, supply, civilian routes, siege evidence, and alternate infiltration.         |
| **Defence in Depth**     | Gates, courtyards, barracks, armouries, command, water, food, workshops, hospitals, escape, and fallback positions.              |
| **Prison / Containment** | Legal authority, prisoner categories, guards, food, sanitation, labour, records, abuse, escape, and what cannot be released.     |
| **Active Siege**         | Morale, breaches, artillery, sabotage, starvation, civilians, relief, negotiation, surrender, evacuation, and persistent damage. |
| **Post-War State**       | Occupation, refugees, ruins, war graves, stolen property, trials, rebuilding, faction claims, and memorials.                     |
| **Player Outcomes**      | Conquer, infiltrate, negotiate, free captives, defend, restore, transfer ownership, dismantle, or convert.                       |

# 23. Urban Ruins, Buried Cities, Drowned Settlements, and Civic Complexes

Urban sites use districts, roads, utilities, class and profession patterns, public services, markets, housing, government, worship, production, waste, transport, and population history. A city ruin cannot be represented by repeated generic rooms.

| **District**             | **Dungeon Contribution**                                                                                                         |
|--------------------------|----------------------------------------------------------------------------------------------------------------------------------|
| **Residential**          | Homes, households, personal evidence, gardens, storage, local shrines, escape routes, and civilian danger.                       |
| **Market / Trade**       | Stalls, warehouses, guilds, currency, transport, taxes, smuggling, shortages, and faction control.                               |
| **Craft / Industrial**   | Workshops, power, inputs, outputs, pollution, labour, machines, hazards, and valuable salvage.                                   |
| **Government / Civic**   | Records, courts, assembly, treasury, administration, law, legitimacy, and political claims.                                      |
| **Religious / Cultural** | Temples, theatres, schools, monuments, cemeteries, festivals, identity, and disputed heritage.                                   |
| **Infrastructure**       | Water, sewage, roads, transit, walls, gates, ports, lifts, tunnels, power, mana, and emergency systems.                          |
| **Ruin Transformation**  | Flooding, burial, fire, occupation, vegetation, corruption, realm overlap, scavenging, and partial restoration vary by district. |

# 24. Machine, Construct, Automation, and Ancient Infrastructure Sites

| **System**               | **Dungeon Use**                                                                                                                     |
|--------------------------|-------------------------------------------------------------------------------------------------------------------------------------|
| **Power Network**        | Shafts, wires, conduits, pressure, batteries, furnaces, cores, leylines, and shutdown paths.                                        |
| **Production Graph**     | Inputs, machines, buffers, outputs, waste, transport, quality, ownership, maintenance, and dangerous backlogs.                      |
| **Permissions / Logic**  | Operator roles, protocols, locks, priorities, emergency states, machine language, hostile reprogramming, and lawful ownership.      |
| **Construct Population** | Workers, custodians, security, awakened persons, damaged units, rogue assemblies, spare bodies, and rights.                         |
| **Failure State**        | Overload, coolant loss, recursive order, sabotage, corrosion, infestation, corrupted mana, trapped process, or owner death.         |
| **Restoration**          | Repair sector, safely restart, reassign purpose, liberate constructs, dismantle, quarantine, or connect to regional infrastructure. |

# 25. Living, Organic, Shifting, Recursive, and Reality-Altering Dungeons

| **Dungeon Type**        | **Identity Rule**                                                                           | **Runtime Change**                                                                              |
|-------------------------|---------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------|
| **Living Organism**     | Rooms are organs, tissues, bones, vessels, symbionts, wounds, senses, and immune responses. | Grows, heals, digests, sleeps, migrates, becomes ill, or communicates.                          |
| **Living Architecture** | Constructed/grown place with maintenance ecology and memory.                                | Regrows walls, responds to residents, season, oath, damage, or nourishment.                     |
| **Shifting Mechanism**  | Topology changes through gears, tides, roots, gravity, or scheduled systems.                | Predictable cycles, player controls, damage, or power state alter connections.                  |
| **Dream / Memory Site** | Space derives from perception, memory, emotion, identity, or repeated narratives.           | Lucidity, truth, fear, witnesses, waking state, or recovered names change rooms.                |
| **Recursive Pocket**    | Rooms repeat, nest, reset, branch, or simulate alternatives under explicit rules.           | Capacity, creator logic, completion, instability, or recursion depth changes topology.          |
| **Reality Breach**      | Overworld and realm laws overlap.                                                           | Stabilisation, breach growth, faction action, boss state, or portal network changes local laws. |

# 26. Mobile, Roaming, Migrating, and Event-Bound Dungeons

| **Family**                       | **Movement Model**                                                                          | **Discovery and Persistence**                                                               |
|----------------------------------|---------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------|
| **Walking Fortress**             | Construct legs, golem body, titan shell, or moving city.                                    | Tracked through routes, footprints, signals, faction intelligence; interior state persists. |
| **Living Leviathan**             | Dungeon exists within/on a colossal creature.                                               | Migration, health, ecology, taming, death, or realm crossing changes location and rooms.    |
| **Drifting Sky Citadel**         | Wind, buoyancy, storm, or floating-island routes.                                           | Visible from afar, requires aerial interception, tethers, forecast, or portal.              |
| **Submersible / Drowned Vessel** | Currents, pressure, tides, or autonomous navigation.                                        | Sonar, wreck trail, ports, salvage charts, or surfacing events reveal access.               |
| **Caravan / War Train**          | Faction logistics, rails, roads, portals, or siege migration.                               | Schedule, sabotage, diplomacy, contracts, raids, and route control matter.                  |
| **Dream / Event Site**           | Appears during sleep, eclipse, storm, season, memory event, pilgrimage, or realm alignment. | Entry windows are telegraphed; unresolved state persists across appearances where intended. |

# 27. Megadungeons, Regional Complexes, and Multi-Session Expeditions

| **Megadungeon Requirement**  | **Locked Direction**                                                                                                                             |
|------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------|
| **Regional Identity**        | The complex changes roads, settlements, ecology, trade, politics, resources, weather, magic, or realm access before the player enters.           |
| **Multiple Entrances**       | Entrances unlock through geography, factions, tools, repairs, bosses, seasons, water, portals, or internal shortcuts.                            |
| **District Structure**       | Districts have distinct functions, factions, ecology, hazards, resources, landmarks, and state; they stream and persist separately.              |
| **Expedition Logistics**     | Rest, storage, supply, transport, rescue, maps, companions, camps, repair, and retreat matter without forcing tedious micromanagement.           |
| **Factions and Settlements** | Friendly, neutral, hostile, trapped, or emergent communities can live inside; personhood and law remain active.                                  |
| **Long-Term Progress**       | Shortcuts, restored systems, safe routes, captured outposts, solved macro-puzzles, faction agreements, and defeated guardians persist.           |
| **No Single Correct Order**  | Several routes and district orders are valid; hard gates are rare, telegraphed, and category-based.                                              |
| **End State**                | Megadungeon may remain active after a climax through settlement, restoration, resource conflict, deeper sealed layers, or changed regional role. |

# 28. Dimension Dungeon Laws and Realm-Specific Mechanics

Every realm dungeon must use the realm as a mechanical system. A realm dungeon that could be moved unchanged to the Overworld with only a palette swap fails the completeness contract.

| **Realm**                 | **Required Dungeon-Law Interaction**                                                                                              |
|---------------------------|-----------------------------------------------------------------------------------------------------------------------------------|
| **Verdant Covenant**      | Living rooms regrow, remember oaths, respond to court permission, nourishment, blight, and migrating seasons.                     |
| **Ancestral Veil**        | Names, remembrance, relationships, funerary truth, and recovered memory determine solidity, routes, inhabitants, and permissions. |
| **Somnolent Expanse**     | Lucidity, expectation, fear, waking-body safety, coherence, dream time, and personal memory reshape layout.                       |
| **Aetheric Reach**        | Gravity, buoyancy, windways, storm charge, moving islands, altitude, tethering, and falling define traversal.                     |
| **Impossible Deep**       | Pressure, flooding, heat, seismic movement, reinforcement, vertical supply, and deep ecology change rooms over time.              |
| **World-Engine**          | Power, permissions, coolant, maintenance, production orders, machine language, and reprogramming reconfigure sectors.             |
| **Ashen Lower Realms**    | Contracts, ownership, debt, hunger, heat, war, declared authority, and coercive law constrain actions and exits.                  |
| **Void Between**          | Anchors, observation, memory, sequence, spatial links, null erosion, and route stability determine whether rooms persist.         |
| **Divine Concords**       | Vows, taboo, intent, truth, legitimacy, pilgrimage, judgement, and domain law create nonphysical permissions.                     |
| **Necropolis Domains**    | Body, spirit, memory, remains ownership, citizenship, soul infrastructure, and reanimation law form separate layers.              |
| **Elemental Confluences** | Flow, phase, conductivity, pressure, temperature, balance, transformation, and terrain reaction are core puzzle systems.          |
| **Created Pockets**       | Capacity, creator rules, recursion, reset, ownership, boundary stability, purpose, and exit conditions define the whole site.     |

# 29. Detailed Overworld Dungeon and Site-Family Registry v0.1

The following entries are production foundations, not final launch commitments. Each family will later receive block palettes, room graphs, ecology packages, loot links, cultural variants, Forge requirements, and implementation status. Stable IDs are canonical; display names may vary by culture and generated history.

## 29.1 Natural Caverns, Lairs, and Ecological Sites

| **Dungeon / Site Family**     | **Stable ID**                                 | **Production Identity**                                                                                           |
|-------------------------------|-----------------------------------------------|-------------------------------------------------------------------------------------------------------------------|
| **Echo Limestone Caverns**    | dungeon.overworld.natural.echo_limestone      | Karst cave network with sinkholes, underground streams, echo navigation, fossil beds, and seasonal flooding.      |
| **Worldroot Galleries**       | dungeon.overworld.natural.worldroot_galleries | Ancient root tunnels with living walls, sap flows, symbiotic fauna, buried ruins, and growth-controlled routes.   |
| **Basalt Lava Tubes**         | dungeon.overworld.natural.basalt_lava_tubes   | Volcanic tubes with heat gradients, collapse skylights, mineral vents, ash fauna, and dormant magma hazards.      |
| **Glacier Vein Caves**        | dungeon.overworld.natural.glacier_veins       | Blue-ice tunnels, meltwater chambers, trapped air, moving cracks, preserved remains, and seasonal route change.   |
| **Coral Hollow Labyrinth**    | dungeon.overworld.natural.coral_hollow        | Reef-grown chambers with tides, water flow, nursery zones, predators, wreckage, and living structural damage.     |
| **Colossal Remains Interior** | dungeon.overworld.natural.colossal_remains    | Cavities within titan bones, shells, petrified organs, or fossil bodies reused by ecology, cults, and scavengers. |

## 29.2 Roadside, Rural, Frontier, and Settlement Ruins

| **Dungeon / Site Family**    | **Stable ID**                         | **Production Identity**                                                                                              |
|------------------------------|---------------------------------------|----------------------------------------------------------------------------------------------------------------------|
| **Abandoned Waystation**     | dungeon.overworld.ruin.waystation     | Road shelter, stable, storehouse, signal room, and cellar reflecting trade collapse, bandit use, or haunting.        |
| **Collapsed Hill Hamlet**    | dungeon.overworld.ruin.hill_hamlet    | Small settlement layered by landslide, abandonment, occupation, households, wells, and recoverable civic life.       |
| **Burned Border Manor**      | dungeon.overworld.ruin.border_manor   | Fortified estate with family history, servants, stores, siege/fire evidence, claims, and hidden escape routes.       |
| **Flooded River Village**    | dungeon.overworld.ruin.river_village  | Homes, docks, mill, shrine, warehouse, and submerged streets shaped by flood cycles and displaced residents.         |
| **Overgrown Orchard Estate** | dungeon.overworld.ruin.orchard_estate | Agricultural manor with cellars, presses, irrigation, living hedges, feral crops, workers, and inheritance disputes. |
| **Deserted Caravanserai**    | dungeon.overworld.ruin.caravanserai   | Courtyard trade fort with wells, stores, animal yards, contracts, travellers, sand burial, and route politics.       |

## 29.3 Mines, Quarries, Excavations, and Industrial Ruins

| **Dungeon / Site Family**       | **Stable ID**                                | **Production Identity**                                                                                                       |
|---------------------------------|----------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------|
| **Layered Copper Mine**         | dungeon.overworld.mine.copper_layers         | Early industrial mine with extraction faces, timber supports, carts, drainage, smelting, worker quarters, and claim conflict. |
| **Deep Ironworks**              | dungeon.overworld.mine.deep_ironworks        | Iron mine and furnace complex with rails, ventilation, slag, water power, collapsed districts, and production restoration.    |
| **Crystal Purity Excavation**   | dungeon.overworld.mine.crystal_purity        | Mana-crystal operation with purity zones, stabilisation, research, corruption risk, and magical wildlife.                     |
| **Marble Quarry Labyrinth**     | dungeon.overworld.quarry.marble_labyrinth    | Terraced quarry, crane routes, cut galleries, hidden older temple, worker camp, and dangerous unsupported voids.              |
| **Salt Cathedral Works**        | dungeon.overworld.mine.salt_cathedral        | Salt mine shaped into vast pillars, brine channels, preservation stores, echoes, trade claims, and fragile roofs.             |
| **Abandoned Mechanist Foundry** | dungeon.overworld.industry.mechanist_foundry | Frames, shafts, water/steam power, assembly, archives, workers, sabotage, dormant machines, and restart consequences.         |

## 29.4 Crypts, Tombs, Necropolises, and Memorial Sites

| **Dungeon / Site Family**    | **Stable ID**                                   | **Production Identity**                                                                                                 |
|------------------------------|-------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------|
| **Clan Barrow Complex**      | dungeon.overworld.tomb.clan_barrows             | Interlinked family mounds with processional routes, generations, grave goods, ancestor claims, and territorial spirits. |
| **Royal Processional Tomb**  | dungeon.overworld.tomb.royal_procession         | Monumental route of legitimacy, guards, servants, records, false chambers, succession conflict, and ritual permissions. |
| **Catacomb Aqueduct**        | dungeon.overworld.tomb.catacomb_aqueduct        | Burial galleries integrated with water system, maintenance routes, flood risk, civic history, and remains law.          |
| **Battlefield Ossuary**      | dungeon.overworld.tomb.battlefield_ossuary      | Mass memorial and bone archive with identification, disputed armies, restless memory, relic claims, and reconciliation. |
| **Plague-Sealed Necropolis** | dungeon.overworld.tomb.plague_necropolis        | Quarantined burial district with medical records, containment, disease ecology, survivors, stigma, and seal decisions.  |
| **Ancestral Mountain Vault** | dungeon.overworld.tomb.mountain_ancestral_vault | Deep lineage repository with names, craft legacies, oath doors, memorial workshops, and living descendants.             |

## 29.5 Shrines, Temples, Monasteries, and Ritual Sites

| **Dungeon / Site Family**     | **Stable ID**                                  | **Production Identity**                                                                                                     |
|-------------------------------|------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------|
| **Leyline Pilgrimage Shrine** | dungeon.overworld.sacred.leyline_pilgrimage    | Processional site with mana alignment, offerings, travellers, ward network, competing interpretations, and seasonal access. |
| **Storm-Cliff Monastery**     | dungeon.overworld.sacred.storm_cliff_monastery | Vertical retreat using wind, bells, bridges, archives, meditation cells, storm power, and isolated community history.       |
| **Sunken River Temple**       | dungeon.overworld.sacred.sunken_river_temple   | Flooded sacred complex with tide rites, water gates, fish ecology, drowned records, and upstream consequences.              |
| **Moon Garden Sanctuary**     | dungeon.overworld.sacred.moon_garden           | Living night garden with lunar cycles, pollinators, dream access, sacred flora, and nonviolent trials.                      |
| **Broken Covenant Circle**    | dungeon.overworld.sacred.broken_covenant       | Ruined treaty and ritual site where promises, witnesses, boundary stones, and faction claims still alter access.            |
| **Ash Pilgrim Basilica**      | dungeon.overworld.sacred.ash_basilica          | Volcanic pilgrimage complex with heat, penitential routes, shelters, relic custody, and reform or corruption conflict.      |

## 29.6 Towers, Archives, Observatories, and Laboratories

| **Dungeon / Site Family**         | **Stable ID**                             | **Production Identity**                                                                                                      |
|-----------------------------------|-------------------------------------------|------------------------------------------------------------------------------------------------------------------------------|
| **Ruined Surveyor Tower**         | dungeon.overworld.tower.surveyor          | Regional maps, instruments, signal system, hidden caches, weather exposure, route restoration, and cartographic knowledge.   |
| **Sealed Mage Observatory**       | dungeon.overworld.tower.mage_observatory  | Astral instruments, mana lens, experiments, library, containment, rotating rooms, and dimensional foreshadowing.             |
| **Fungal Apothecary Spire**       | dungeon.overworld.tower.fungal_apothecary | Living vertical greenhouse, alchemy, spores, water, patient records, escaped specimens, and medicinal restoration.           |
| **Archive of Broken Roads**       | dungeon.overworld.archive.broken_roads    | Maps, tolls, route histories, portal records, bridge plans, caravans, and knowledge that can reopen regional travel.         |
| **Timeworn Weather Station**      | dungeon.overworld.lab.weather_station     | Ancient climate machinery, storm data, pressure, maintenance, weather alteration, and dangerous restart choices.             |
| **Forbidden Transmutation House** | dungeon.overworld.lab.transmutation_house | Urban laboratory with materials, failed transformations, victims/volunteers, legal evidence, containment, and moral choices. |

## 29.7 Fortresses, Prisons, Siegeworks, and Military Complexes

| **Dungeon / Site Family** | **Stable ID**                                   | **Production Identity**                                                                                                  |
|---------------------------|-------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| **Frontier Hillfort**     | dungeon.overworld.military.frontier_hillfort    | Layered walls, wells, barracks, stores, signal towers, civilians, siege damage, and current territorial claim.           |
| **Pass-Gate Fortress**    | dungeon.overworld.military.pass_gate            | Mountain choke point with gates, tunnels, lifts, avalanche control, toll records, patrol routes, and trade consequences. |
| **Island Prison Keep**    | dungeon.overworld.military.island_prison        | Sea approach, cells, workshops, guards, escape tunnels, records, storms, prisoners, and ownership law.                   |
| **Collapsed Siegeworks**  | dungeon.overworld.military.collapsed_siegeworks | Trenches, engines, mines, camps, supply roads, mass graves, unexploded magic, and war-history evidence.                  |
| **Border Watch Network**  | dungeon.overworld.military.watch_network        | Linked towers, hidden paths, signal mechanisms, supply caches, patrol posts, and region-wide restoration objective.      |
| **Occupied River Castle** | dungeon.overworld.military.river_castle         | Bridge, port, walls, granary, keep, civilian quarter, current faction, infiltration, siege, and diplomatic routes.       |

## 29.8 Urban, Civic, and Buried-City Sites

| **Dungeon / Site Family**    | **Stable ID**                               | **Production Identity**                                                                                                |
|------------------------------|---------------------------------------------|------------------------------------------------------------------------------------------------------------------------|
| **Buried Market Quarter**    | dungeon.overworld.urban.buried_market       | Streets, guild halls, shops, warehouses, homes, civic records, sinkholes, and salvage ownership.                       |
| **Drowned Canal District**   | dungeon.overworld.urban.drowned_canals      | Canals, homes, workshops, locks, boats, submerged routes, air pockets, tide ecology, and resettlement potential.       |
| **Ash-Covered Civic Forum**  | dungeon.overworld.urban.ash_forum           | Government, court, archives, monuments, shelters, volcanic burial, political legitimacy, and trapped districts.        |
| **Undercity Utility Maze**   | dungeon.overworld.urban.utility_maze        | Sewers, aqueducts, service tunnels, cisterns, maintenance rooms, pests, smuggling, and city infrastructure.            |
| **Abandoned Academy Campus** | dungeon.overworld.urban.academy_campus      | Dormitories, classrooms, libraries, laboratories, workshops, gardens, factions, experiments, and recoverable teaching. |
| **Lost Port Warehouse City** | dungeon.overworld.urban.port_warehouse_city | Docks, cranes, warehouses, customs, worker housing, trade records, wrecks, tides, and competing salvage claims.        |

## 29.9 Marine, Coastal, Island, and Submerged Sites

| **Dungeon / Site Family**   | **Stable ID**                                | **Production Identity**                                                                                           |
|-----------------------------|----------------------------------------------|-------------------------------------------------------------------------------------------------------------------|
| **Stormreef Wreck Field**   | dungeon.overworld.marine.stormreef_wrecks    | Multiple wrecks linked by reef, currents, air pockets, cargo, survivors, predators, storms, and salvage law.      |
| **Tidal Sea Cave Temple**   | dungeon.overworld.marine.tidal_temple        | Entrance cycles, water level, ritual chambers, marine life, hidden dry routes, and coastal faith.                 |
| **Sunken Observatory**      | dungeon.overworld.marine.sunken_observatory  | Submerged lenses, pressure, sealed archives, star maps, strange fauna, and restored surface link.                 |
| **Abyssal Mining Platform** | dungeon.overworld.marine.abyssal_platform    | Pressure station, lifts, drills, power, crew quarters, resource claim, breach hazards, and deep ecology.          |
| **Mangrove Smuggler Maze**  | dungeon.overworld.marine.mangrove_smuggler   | Root channels, tide paths, caches, boats, lookouts, local communities, law, and environmental damage.             |
| **Living Reef Citadel**     | dungeon.overworld.marine.living_reef_citadel | Cultivated coral architecture, aquatic residents, defence fauna, currents, nurseries, diplomacy, and reef health. |

## 29.10 Aerial, Skyland, Mountain, and High-Altitude Sites

| **Dungeon / Site Family**    | **Stable ID**                             | **Production Identity**                                                                                                    |
|------------------------------|-------------------------------------------|----------------------------------------------------------------------------------------------------------------------------|
| **Fallen Skyship Graveyard** | dungeon.overworld.sky.skyship_graveyard   | Interlocked wrecks, wind, unstable decks, cargo, crew records, scavengers, and recoverable flight systems.                 |
| **Cloud Monastery Chain**    | dungeon.overworld.sky.cloud_monastery     | Floating sanctuaries linked by windways, bridges, bells, gliding, pilgrims, storms, and lost teachings.                    |
| **Thunderhead Citadel**      | dungeon.overworld.sky.thunderhead_citadel | Storm-bound fortress with charge paths, aerial defence, weather machinery, moving approach, and sky politics.              |
| **Cliffside Liftworks**      | dungeon.overworld.sky.cliff_liftworks     | Vertical industrial transit, counterweights, cables, worker stations, mines, settlements, sabotage, and route restoration. |
| **Gravity-Scar Observatory** | dungeon.overworld.sky.gravity_observatory | Inverted rooms, floating debris, anchors, research, spatial anomalies, and realm-leak evidence.                            |
| **Roc-Nest Mesa**            | dungeon.overworld.sky.roc_nest_mesa       | Apex aerial lair with thermal routes, prey remains, nursery, weather exposure, taming/relocation, and migration effects.   |

## 29.11 Underground, Deepstone, Magma, and Subterranean Sites

| **Dungeon / Site Family**        | **Stable ID**                               | **Production Identity**                                                                                            |
|----------------------------------|---------------------------------------------|--------------------------------------------------------------------------------------------------------------------|
| **Deepstone Trade Road**         | dungeon.overworld.deep.deepstone_trade_road | Long tunnel network with waystations, bridges, tolls, caravans, collapses, settlements, and regional connectivity. |
| **Fungal Basin Settlement Ruin** | dungeon.overworld.deep.fungal_basin_ruin    | Underground farms, homes, water, spores, trade, collapse, descendants, and ecological restoration.                 |
| **Magma Forge Complex**          | dungeon.overworld.deep.magma_forge          | Heat industry, lava channels, cooling, ore, workers, machines, fire ecology, and dangerous restart.                |
| **Buried Machine Stratum**       | dungeon.overworld.deep.machine_stratum      | Ancient artificial layer with sectors, power, construct populations, archives, and unknown world function.         |
| **Blackwater Citadel**           | dungeon.overworld.deep.blackwater_citadel   | Subterranean sea fortress with pressure, docks, water gates, aquatic inhabitants, prisoners, and hidden routes.    |
| **Abyssal Fracture Camp**        | dungeon.overworld.deep.abyssal_fracture     | Expedition outpost around bottomless rift, unstable bridges, research, void leakage, rescue, and containment.      |

## 29.12 Magical, Ancient, Corrupted, and Special Sites

| **Dungeon / Site Family**     | **Stable ID**                                | **Production Identity**                                                                                          |
|-------------------------------|----------------------------------------------|------------------------------------------------------------------------------------------------------------------|
| **Leyline Convergence Vault** | dungeon.overworld.special.leyline_vault      | Mana flows, regulators, ritual chambers, ancient custodians, overload, regional magic, and restoration.          |
| **Dream-Leak Manor**          | dungeon.overworld.special.dream_leak_manor   | House and memory overlap, personal histories reshape rooms, sleepers, nightmares, and waking anchors matter.     |
| **Void-Scar Anchor Maze**     | dungeon.overworld.special.void_anchor_maze   | Spatially unstable site with anchors, erased rooms, portal wreckage, route memory, and containment.              |
| **Blightheart Sanctuary**     | dungeon.overworld.special.blightheart        | Former healing site transformed by corruption, living growth, trapped caretakers, cleansing, and biome recovery. |
| **Starfall Glass Labyrinth**  | dungeon.overworld.special.starfall_glass     | Crater glass, reflected routes, strange gravity, cosmic material, researchers, cults, and guardian ecology.      |
| **Ancient World-Node**        | dungeon.overworld.special.ancient_world_node | Precursor infrastructure connecting terrain, weather, leylines, roads, or realms; activation changes the region. |

# 30. Detailed Realm Dungeon Registry v0.1

## 30.1 Verdant Covenant

| **Realm Dungeon Family**    | **Stable ID**                                 | **Realm-Specific Production Identity**                                                                                      |
|-----------------------------|-----------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------|
| **Living Palace Roots**     | dungeon.realm.verdant.living_palace_roots     | Court-grown root palace whose rooms remember hospitality, rank, promises, nourishment, and seasonal law.                    |
| **Broken Covenant Gardens** | dungeon.realm.verdant.broken_covenant_gardens | Treaty garden split by betrayal; paths respond to witnesses, boundary stones, repair, and competing courts.                 |
| **Thorn-Hunt Labyrinth**    | dungeon.realm.verdant.thorn_hunt              | Moving hedge wilderness used for ritual hunt, punishment, initiation, predator ecology, and contested rules.                |
| **Rot-Heart Grove**         | dungeon.realm.verdant.rot_heart               | Blighted living dungeon with immune responses, rot ecology, trapped caretakers, cleansing, bargaining, or controlled decay. |
| **Seasonal Vaults**         | dungeon.realm.verdant.seasonal_vaults         | Vault network whose entrances, rooms, resources, and guardians migrate with realm seasons and court permission.             |

## 30.2 Ancestral Veil

| **Realm Dungeon Family**      | **Stable ID**                                   | **Realm-Specific Production Identity**                                                                              |
|-------------------------------|-------------------------------------------------|---------------------------------------------------------------------------------------------------------------------|
| **Processional Necropolis**   | dungeon.realm.ancestral.processional_necropolis | Routes become solid through names, lineage, funeral rites, witnesses, and recovered relationships.                  |
| **Memory Archive**            | dungeon.realm.ancestral.memory_archive          | Stored experiences form rooms; truth, bias, identity, missing memories, and respectful access determine navigation. |
| **Spirit Court**              | dungeon.realm.ancestral.spirit_court            | Judicial and diplomatic site where testimony, legitimacy, obligations, and ancestor factions control thresholds.    |
| **Drowned Remembrance Halls** | dungeon.realm.ancestral.drowned_remembrance     | Forgotten memories flood a city of echoes; recovered names lower water and reveal lost histories.                   |
| **Devouring Silence Zone**    | dungeon.realm.ancestral.devouring_silence       | Predatory absence erases names, sound, maps, and relationships unless anchored by remembrance and community.        |

## 30.3 Somnolent Expanse

| **Realm Dungeon Family** | **Stable ID**                         | **Realm-Specific Production Identity**                                                                                                 |
|--------------------------|---------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------|
| **Lucid Observatory**    | dungeon.realm.dream.lucid_observatory | Dream navigation and prophecy site stabilised by lucidity, shared symbols, waking-body safety, and observation.                        |
| **Nightmare Nest**       | dungeon.realm.dream.nightmare_nest    | Fear-fed living maze whose ecology and topology amplify repeated reactions but weaken through understanding or courage.                |
| **Memory Theatre**       | dungeon.realm.dream.memory_theatre    | Scenes replay with roles, omissions, and alternative outcomes; players reconstruct truth without being forced into one interpretation. |
| **Waking Labyrinth**     | dungeon.realm.dream.waking_labyrinth  | Rooms bridge sleepers and waking sites; exits depend on time, body safety, anchors, and coordinated awakening.                         |
| **Prophecy Engine**      | dungeon.realm.dream.prophecy_engine   | Machine-dream complex producing possible futures, false certainty, political pressure, and timeline-sensitive puzzles.                 |

## 30.4 Aetheric Reach

| **Realm Dungeon Family**     | **Stable ID**                              | **Realm-Specific Production Identity**                                                                               |
|------------------------------|--------------------------------------------|----------------------------------------------------------------------------------------------------------------------|
| **Skyfort**                  | dungeon.realm.aetheric.skyfort             | Aerial military complex with windways, tethers, buoyancy, storm power, moving patrol routes, and falling hazards.    |
| **Storm Temple**             | dungeon.realm.aetheric.storm_temple        | Sacred weather engine using charge, altitude, bells, conductors, vows, and regional storm balance.                   |
| **Fallen Airship Graveyard** | dungeon.realm.aetheric.airship_graveyard   | Wrecks drift through moving islands, carrying crews, cargo, histories, scavengers, and recoverable flight systems.   |
| **Thunderhead Citadel**      | dungeon.realm.aetheric.thunderhead_citadel | Fortress inside living storm layers; approach, rooms, power, and combat change with charge and wind cycles.          |
| **Underside Vaults**         | dungeon.realm.aetheric.underside_vaults    | Inverted ruins beneath floating continents with gravity transitions, mineral roots, tethers, and hidden settlements. |

## 30.5 Impossible Deep

| **Realm Dungeon Family** | **Stable ID**                         | **Realm-Specific Production Identity**                                                                                          |
|--------------------------|---------------------------------------|---------------------------------------------------------------------------------------------------------------------------------|
| **Pressure Vault**       | dungeon.realm.deep.pressure_vault     | Sealed archive/treasury requiring pressure equalisation, reinforcement, pumps, safe chambers, and legal ownership.              |
| **Inverted Mine**        | dungeon.realm.deep.inverted_mine      | Extraction site descending upward through gravity and pressure layers, with lifts, water, seismic movement, and deep resources. |
| **Fossil City**          | dungeon.realm.deep.fossil_city        | Civilisation grown within colossal remains, with inhabited districts, ancient layers, pressure ecology, and disputed heritage.  |
| **Seismic Forge**        | dungeon.realm.deep.seismic_forge      | Forge harnessing tectonic motion, heat, pressure, and resonance; production and instability change regional routes.             |
| **Blackwater Citadel**   | dungeon.realm.deep.blackwater_citadel | Deep-ocean fortress with pressure locks, docks, currents, politics, prisoners, and abyssal guardians.                           |

## 30.6 World-Engine

| **Realm Dungeon Family** | **Stable ID**                          | **Realm-Specific Production Identity**                                                                                     |
|--------------------------|----------------------------------------|----------------------------------------------------------------------------------------------------------------------------|
| **Logic Vault**          | dungeon.realm.engine.logic_vault       | Permission and protocol dungeon where rules, identities, priorities, and emergency states unlock physical routes.          |
| **Foundry Spine**        | dungeon.realm.engine.foundry_spine     | Vertical production backbone with power, coolant, assembly, waste, workers, machine rights, and runaway orders.            |
| **Archive Sector**       | dungeon.realm.engine.archive_sector    | World records, schematics, identities, maintenance history, corrupted indexes, and custodian factions shape access.        |
| **Rogue Assembly**       | dungeon.realm.engine.rogue_assembly    | Self-modifying factory society with awakened constructs, hostile directives, diplomacy, sabotage, and production conflict. |
| **Coolant Labyrinth**    | dungeon.realm.engine.coolant_labyrinth | Flow-control network whose temperature, pressure, corrosion, contamination, and rerouting reconfigure sectors.             |

## 30.7 Ashen Lower Realms

| **Realm Dungeon Family** | **Stable ID**                         | **Realm-Specific Production Identity**                                                                                 |
|--------------------------|---------------------------------------|------------------------------------------------------------------------------------------------------------------------|
| **Contract Fortress**    | dungeon.realm.ashen.contract_fortress | Every threshold, service, weapon, shelter, and exit is governed by explicit or hidden contract and declared ownership. |
| **War Furnace**          | dungeon.realm.ashen.war_furnace       | Siege-industrial complex producing weapons, soldiers, heat, smoke, debt, and regional conflict.                        |
| **Hunger Basilica**      | dungeon.realm.ashen.hunger_basilica   | Living sacred economy of appetite, offerings, scarcity, consumption, and restraint with multiple moral resolutions.    |
| **Chain Citadel**        | dungeon.realm.ashen.chain_citadel     | Prison-fortress using law, debt, labour, chains, gates, hierarchy, revolt, and liberation logistics.                   |
| **Ash-Sea Prison**       | dungeon.realm.ashen.ash_sea_prison    | Remote prison among ash currents; access windows, heat, ships, inmates, wardens, and contractual exits matter.         |

## 30.8 Void Between

| **Realm Dungeon Family** | **Stable ID**                       | **Realm-Specific Production Identity**                                                                                  |
|--------------------------|-------------------------------------|-------------------------------------------------------------------------------------------------------------------------|
| **Anchor Maze**          | dungeon.realm.void.anchor_maze      | Rooms persist only while linked to stable anchors, observation, sequence, and memory; abandoned paths erode.            |
| **Rift Shipwreck**       | dungeon.realm.void.rift_shipwreck   | Fragments of vessels and worlds connected by unstable spatial routes, survivors, cargo, and route-devouring fauna.      |
| **Null Cathedral**       | dungeon.realm.void.null_cathedral   | Monument to absence where sound, magic, identity, and matter diminish under discoverable rules.                         |
| **Dead-Star Vault**      | dungeon.realm.void.dead_star_vault  | Collapsed stellar relic with gravity, cold, radiation-like mana, ancient custody, and catastrophic resource temptation. |
| **Portal Graveyard**     | dungeon.realm.void.portal_graveyard | Broken gates lead to partial rooms, lost expeditions, invasive species, maps, anchors, and dangerous shortcuts.         |

## 30.9 Divine Concords

| **Realm Dungeon Family** | **Stable ID**                             | **Realm-Specific Production Identity**                                                                                  |
|--------------------------|-------------------------------------------|-------------------------------------------------------------------------------------------------------------------------|
| **Trial Domain**         | dungeon.realm.divine.trial_domain         | A bounded world tests declared principles through conduct, restraint, truth, protection, and alternate interpretations. |
| **Pilgrimage Labyrinth** | dungeon.realm.divine.pilgrimage_labyrinth | Route shaped by vows, hospitality, taboo, companions, offerings, intent, and lawful shortcuts.                          |
| **Abandoned Sanctuary**  | dungeon.realm.divine.abandoned_sanctuary  | Domain left by patron or worshippers; blessings, caretakers, refugees, rival claims, and failing law remain.            |
| **Law Engine**           | dungeon.realm.divine.law_engine           | Infrastructure that compiles domain rules into reality; permissions, legitimacy, exceptions, and reform alter rooms.    |
| **Celestial Archive**    | dungeon.realm.divine.celestial_archive    | Records of oaths, miracles, judgements, histories, and erased doctrine protected by truth-sensitive access.             |

## 30.10 Necropolis Domains

| **Realm Dungeon Family**       | **Stable ID**                             | **Realm-Specific Production Identity**                                                                                   |
|--------------------------------|-------------------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| **Boneworks**                  | dungeon.realm.necropolis.boneworks        | Industrial remains-processing site with consent, ownership, labour, spare bodies, waste, law, and construct-like undead. |
| **Soul Reservoir**             | dungeon.realm.necropolis.soul_reservoir   | Energy and identity infrastructure with channels, rights, taxes, leakage, trapped persons, and liberation choices.       |
| **Sepulchral Court**           | dungeon.realm.necropolis.sepulchral_court | Administrative palace where living, dead, body, spirit, memory, citizenship, and inheritance are separately judged.      |
| **Dead-Empire Transit System** | dungeon.realm.necropolis.dead_transit     | Mortuary roads, soul ferries, stations, cargo, workers, lost routes, and reactivation across domains.                    |
| **Sealed Sovereign Crypt**     | dungeon.realm.necropolis.sovereign_crypt  | Political tomb-prison whose occupant, heirs, laws, guardians, and release consequences affect whole domains.             |

## 30.11 Elemental Confluences

| **Realm Dungeon Family**     | **Stable ID**                               | **Realm-Specific Production Identity**                                                                            |
|------------------------------|---------------------------------------------|-------------------------------------------------------------------------------------------------------------------|
| **Confluence Crucible**      | dungeon.realm.elemental.confluence_crucible | Mixed-flow industrial/ritual site where temperature, phase, pressure, conductivity, and balance reshape topology. |
| **Stormroot Temple**         | dungeon.realm.elemental.stormroot_temple    | Living lightning and root network linking sky, earth, water, and growth through charge and grounding puzzles.     |
| **Frostfire Caldera**        | dungeon.realm.elemental.frostfire_caldera   | Opposed hot/cold flows create changing terrain, steam, brittle matter, creatures, and unstable resources.         |
| **Pressure Reef**            | dungeon.realm.elemental.pressure_reef       | Water, air, crystal, and earth form a living deep reef whose routes react to pressure and current.                |
| **Elemental Balance Engine** | dungeon.realm.elemental.balance_engine      | Ancient regulator whose settings alter regional climate, resources, migrations, disasters, and faction politics.  |

## 30.12 Created Pockets

| **Realm Dungeon Family** | **Stable ID**                            | **Realm-Specific Production Identity**                                                                              |
|--------------------------|------------------------------------------|---------------------------------------------------------------------------------------------------------------------|
| **Trial Pocket**         | dungeon.realm.pocket.trial               | Finite authored challenge with explicit creator, purpose, rules, reset, capacity, rewards, and safe-exit contract.  |
| **Failed Laboratory**    | dungeon.realm.pocket.failed_laboratory   | Experiment pocket whose unstable rules, abandoned staff, prototypes, records, and boundary damage persist.          |
| **Prison Loop**          | dungeon.realm.pocket.prison_loop         | Recursive confinement with owner permissions, memory, reset, escape conditions, inmates, and ethical implications.  |
| **Vault Network**        | dungeon.realm.pocket.vault_network       | Series of bounded storage worlds with ownership, keys, capacity, indexing, security, and collapsed links.           |
| **Recursive Prototype**  | dungeon.realm.pocket.recursive_prototype | Self-copying unfinished pocket that nests variants, consumes capacity, and can be stabilised, pruned, or destroyed. |

# 31. Megadungeon Foundation Registry v0.1

| **Megadungeon Foundation**           | **Stable ID**                                | **World Role and Identity**                                                                                                                       |
|--------------------------------------|----------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------|
| **The Crownless Imperial Undercity** | megadungeon.overworld.crownless_undercity    | Buried capital beneath later cities; districts, heirs, civic systems, refugees, factions, infrastructure, and legitimacy evolve across campaigns. |
| **Worldspine Deep Road**             | megadungeon.overworld.worldspine_deep_road   | Continental underground route with waystations, mines, cities, bridges, collapses, trade, creatures, wars, and many surface entrances.            |
| **The Drowned Meridian**             | megadungeon.overworld.drowned_meridian       | Submerged coastal metropolis and canal network whose tides, islands, ports, survivors, reef ecology, and restored gates affect ocean travel.      |
| **Skychain Citadel Network**         | megadungeon.overworld.skychain_citadels      | Chain of moving sky forts, docks, wrecks, monasteries, storm engines, and aerial factions linked by windways.                                     |
| **The Glass Epoch Vaults**           | megadungeon.overworld.glass_epoch            | Starfall and ancient-magic complex of mirrored districts, gravity scars, archives, resource temptation, and reality breaches.                     |
| **The Wandering Iron Basilica**      | megadungeon.mobile.iron_basilica             | Walking machine-city with districts, construct society, foundries, archives, pilgrims, hostile directives, and changing regional route.           |
| **Root-Below Kingdoms**              | megadungeon.overworld.root_below_kingdoms    | Worldroot network containing living cities, fungal basins, buried ruins, ancient pacts, blight fronts, and realm crossings.                       |
| **The Endless Siegeworks**           | megadungeon.overworld.endless_siegeworks     | Regional battlefield-fortress system where old armies, trenches, prisons, supply lines, engines, refugees, and unresolved war continue.           |
| **Black Archive of Lost Realms**     | megadungeon.crossrealm.black_archive         | Cross-realm archive preserving worlds, routes, peoples, laws, and dangerous records; each wing follows a different realm grammar.                 |
| **Gatebreaker Nexus**                | megadungeon.crossrealm.gatebreaker_nexus     | Collapsed portal megastructure connecting unstable realm sites, invasions, lost expeditions, route politics, and restoration choices.             |
| **The Twelvefold Pilgrimage**        | megadungeon.crossrealm.twelvefold_pilgrimage | Multi-realm sacred route with twelve law-specific districts, rival faiths, pilgrims, shelters, trials, and contested final meaning.               |
| **The Hollow Colossus**              | megadungeon.mobile.hollow_colossus           | Interior of a colossal migrating being containing ecology, settlements, ruins, organs, parasites, machines, and world-changing lifecycle states.  |

# 32. Boss, Guardian, Champion, and Sovereign Integration

| **Integration Field**           | **24G Requirement**                                                                                                                                            |
|---------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Territory and Site Function** | Define what room, district, route, resource, law, population, machine, prison, settlement, or regional process the entity controls.                            |
| **Evidence and Foreshadowing**  | Tracks, damage, weather, missing populations, records, worship, supply, architecture, sound, corpses, warnings, and faction behaviour appear before the arena. |
| **Arena Grammar**               | Provide readable boundaries, movement, cover, verticality, hazards, destructibility, phase sockets, spectator/civilian safety, retreat, and re-entry policy.   |
| **Alternate Resolution**        | Site supports compatible kill, cleanse, seal, bargain, expose, relocate, tame, bind, repair, protect, liberate, or succession outcomes.                        |
| **Failure and Retreat**         | Retreat route, boss persistence, partial damage, changed patrols, resources, healing, reset, or escalation are explicit.                                       |
| **Aftermath**                   | Doors, ecology, faction ownership, settlement safety, resources, region law, weather, route access, restoration, and recurring threats update.                 |
| **Replacement / Recurrence**    | Permanent unique, successor, faction replacement, migration, rematch, seasonal return, realm recursion, or settings-based respawn is defined by 24H.           |

# 33. Loot, Resources, Relics, Knowledge, Salvage, and Reward Logic

| **Reward Layer**         | **Dungeon Rule**                                                                                                                                         |
|--------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Ordinary Supplies**    | Food, medicine, tools, repair, ammunition, fuel, and expedition supplies reflect occupants and site function.                                            |
| **Resource Source**      | Deposits, crops, creature materials, mana, machine components, salvage, water, biological harvest, and strategic materials have depletion/renewal rules. |
| **Knowledge**            | Maps, recipes, languages, rituals, machine protocols, history, enemy weaknesses, cultural teaching, and realm routes are major rewards.                  |
| **Relics and Artefacts** | Ownership, authenticity, culture, stewardship, curses, faction claims, display, research, and world consequences accompany power.                        |
| **Faction / Social**     | Reputation, citizenship, prisoners, allies, teachers, settlements, contracts, titles, and political legitimacy can exceed material value.                |
| **Infrastructure**       | Restored road, lift, mine, forge, portal, ward, water system, archive, settlement, or safe route is a persistent regional reward.                        |
| **Boss / Unique**        | 24J and 24H define final entries; 24G supplies sockets, ownership, access, alternate outcomes, and aftermath dependencies.                               |
| **Anti-Farming**         | Loot state, supply, ecology, ownership, replenishment, migration, salvage, and reset policy prevent unexplained infinite chests.                         |

# 34. Quests, Events, Contracts, Rumours, and Dynamic Site Stories

| **Story Source**         | **Examples**                                                                                                                        |
|--------------------------|-------------------------------------------------------------------------------------------------------------------------------------|
| **Discovery**            | Map fragment, smoke, lights, sounds, tracks, road, missing caravan, weather, rumour, strange resource, displaced creature.          |
| **Current Need**         | Rescue, survey, delivery, repair, cleansing, containment, negotiation, prisoner exchange, resource shortage, pilgrimage, evidence.  |
| **Faction Conflict**     | Competing claims, occupation, siege, archaeology dispute, sacred law, salvage rights, labour, refugees, succession, smuggling.      |
| **Ecology Event**        | Migration, infestation, breeding season, invasive spread, boss awakening, food collapse, sanctuary, poaching, disease.              |
| **Infrastructure Event** | Mine collapse, pump failure, portal instability, power overload, bridge loss, water contamination, machine restart.                 |
| **Historical Mystery**   | Builder identity, betrayal, catastrophe, missing population, erased archive, forged claim, hidden subsite, cultural interpretation. |
| **World Transformation** | Restoration, settlement, renewed trade, realm opening, corruption spread, faction takeover, boss aftermath, disaster response.      |

# 35. Site States, Persistence, Reoccupation, Reset, and Long-Term Change

| **State**                         | **Meaning**                                                                                                  |
|-----------------------------------|--------------------------------------------------------------------------------------------------------------|
| **Unrevealed**                    | Exists in generated world but is not known to player; far simulation may still alter owners and inhabitants. |
| **Rumoured / Located**            | Approximate or exact map knowledge exists without room discovery.                                            |
| **Dormant**                       | Systems, guardians, portals, machines, or curses are inactive but may awaken.                                |
| **Active**                        | Original or restored function operates.                                                                      |
| **Occupied**                      | Current inhabitants control some or all zones.                                                               |
| **Contested**                     | Multiple populations or factions control different zones and routes.                                         |
| **Abandoned**                     | No organised owner; ecology, spirits, hazards, or autonomous systems remain.                                 |
| **Collapsed / Buried**            | Topology changed by structural failure, sediment, landslide, ice, roots, or disaster.                        |
| **Flooded / Frozen / Burning**    | Environmental overlay changes routes, ecology, resources, hazards, and restoration.                          |
| **Cursed / Corrupted / Breached** | Magic or realm state alters rules, occupants, rewards, and regional pressure.                                |
| **Cleared**                       | Immediate hostile objective resolved; not equivalent to permanently empty.                                   |
| **Looted / Salvaged**             | Portable rewards reduced; infrastructure, history, ecology, resources, and ownership persist.                |
| **Quarantined / Sealed**          | Access deliberately limited; failure, politics, law, ecology, or danger continues off-screen.                |
| **Claimed / Settled**             | Player or faction manages permissions, residents, storage, jobs, safety, upkeep, and diplomacy.              |
| **Restored / Converted**          | New function operates while evidence and legacy state remain.                                                |
| **Reoccupied**                    | New faction, ecology, refugees, cult, miners, scholars, or creatures use the changed site.                   |
| **Destroyed**                     | Major structure is irrecoverable or transformed into rubble/terrain; history and regional effects remain.    |

| **Reset Category**            | **Policy**                                                                                                                                      |
|-------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------|
| **Persistent by Default**     | Exploration, doors, shortcuts, locks, puzzles, destroyed blocks, ownership, boss outcome, and major loot persist.                               |
| **Ecological Replenishment**  | Wildlife, prey, scavengers, plants, fungus, and nests return according to habitat and population rules, not timers alone.                       |
| **Faction Reoccupation**      | Vacant sites may be claimed based on territory, routes, need, danger, reputation, and event simulation.                                         |
| **Operational Replenishment** | Active settlements, mines, workshops, stores, and machines produce or receive goods through real systems.                                       |
| **Realm Recursion**           | Dream, pocket, divine trial, or other family may reset selected topology under explicit laws while preserving player knowledge and macro-state. |
| **World Setting**             | Optional dungeon reset profiles can soften persistence, but unique history, claims, major outcomes, and player builds require protection.       |

# 36. Claiming, Cleansing, Restoring, Converting, and Settlement Use

| **Conversion**                  | **Requirements and Consequences**                                                                                                 |
|---------------------------------|-----------------------------------------------------------------------------------------------------------------------------------|
| **Safe Camp / Expedition Base** | Clear bounded hazards, establish access, storage, light, rest, rescue, permissions, and supply.                                   |
| **Settlement**                  | Water/food or equivalent, housing, sanitation, work, safety, routes, law, ownership, culture, families, and long-term simulation. |
| **Mine / Industry**             | Resource, power, labour, processing, waste, safety, transport, claim, ecology, faction, and depletion consequences.               |
| **Research / Archive**          | Security, preservation, experts, translation, containment, funding/supply, ethics, and knowledge ownership.                       |
| **Fortress / Defence**          | Strategic value, garrison, supply, walls, routes, civilians, siege, diplomacy, and upkeep.                                        |
| **Sanctuary / Conservation**    | Habitat, population, access restrictions, caretakers, law, funding, community relationships, and invasive control.                |
| **Portal / Transit Hub**        | Stable anchors, destination, power, permissions, defence, traffic, rescue, customs, realm law, and failure plan.                  |
| **Seal / Quarantine**           | Monitoring, durability, warning, authority, alternate routes, maintenance, and future breach conditions.                          |

# 37. Discovery, Mapping, Codex Truth, Names, Signs, and Foreshadowing

| **Knowledge Layer**           | **Player-Facing Treatment**                                                                                                                     |
|-------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------|
| **Objective Site Definition** | Developer truth: family, instance, layout, history, owners, states, and systems. Not automatically shown.                                       |
| **Generated Local Name**      | Derived from builder, region, landmark, event, owner, culture, or rumour.                                                                       |
| **Cultural Names**            | Different peoples may use different names, claims, translations, taboos, or stories for the same site.                                          |
| **Rumour**                    | Unverified location, danger, treasure, history, or interpretation with source and confidence.                                                   |
| **Map Knowledge**             | Unknown, approximate, entrance known, partial rooms, surveyed zones, routes, hazards, notes, and shared multiplayer map states.                 |
| **Codex Truth**               | Observed facts, hypotheses, cultural accounts, contested claims, falsehoods, and resolved evidence remain distinct.                             |
| **Foreshadowing**             | Roads, ruins, tracks, weather, missing people, altered ecology, lights, sound, maps, trade, architecture, and regional changes reveal presence. |

# 38. Difficulty, Scaling, Multiplayer, Retreat, Recovery, and Fairness

| **Area**             | **Locked Rule**                                                                                                                                                                         |
|----------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Difficulty**       | Adjust enemy pressure, hazard speed, resource scarcity, puzzle assistance, trap warning, recovery, map support, and state consequences independently where practical.                   |
| **Scaling**          | Do not scale every inhabitant to player level. Use region danger, site state, faction strength, ecology, depth, realm law, events, and selected world profile.                          |
| **Retreat**          | Normal sites allow retreat or a clearly telegraphed commitment point. Boss and realm transitions define escape policy before entry.                                                     |
| **Death / Recovery** | Tombstone, rescue, safe recovery route, companion retrieval, faction help, or world-setting options prevent inaccessible permanent loss.                                                |
| **Multiplayer Join** | Late joiners spawn at valid party anchor, entrance, safe room, checkpoint, or reachable route; never inside sealed geometry or lethal hazard.                                           |
| **Separation**       | Doors, lifts, portals, moving rooms, dreams, and boss phases include regroup, consent, teleport, rescue, or split-party rules.                                                          |
| **Ownership**        | Loot, doors, puzzles, builds, claims, quest contribution, map knowledge, and restoration use authoritative permissions and contribution records.                                        |
| **Accessibility**    | Navigation cues, high contrast, non-colour signals, audio captions, timing assists, puzzle memory aids, reduced motion, safe teleport, and input remapping are planned at family level. |

# 39. Presentation, Forge, Audio, VFX, Readability, and Environmental Storytelling

| **Presentation Layer**          | **Required Atlas Attachments**                                                                                                                     |
|---------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------|
| **Architecture and Silhouette** | Family shapes, proportions, landmarks, entrances, supports, damage language, room hierarchy, and distant readability.                              |
| **Material Palette**            | Original builder materials, repairs, age, moisture, heat, corruption, realm state, culture, occupation, and block variants.                        |
| **Lighting**                    | Natural openings, lamps, mana, fire, machines, bioluminescence, darkness, hazard warnings, owner changes, and safe areas.                          |
| **Audio**                       | Regional ambience, room acoustics, machinery, water, wind, creatures, occupants, alarms, structural stress, hidden routes, and boss signs.         |
| **VFX**                         | Dust, spores, water, heat, mana, spirits, storm, gravity, void, corruption, power flow, traps, puzzles, and state transition.                      |
| **Props and Evidence**          | Tools, furniture, storage, remains, signs, maps, personal objects, production waste, ritual items, and repair work.                                |
| **Sockets and Markers**         | Doors, routes, loot, encounters, ecology, patrol, audio, VFX, puzzle, hazard, boss, camera, navigation, and construction sockets.                  |
| **Forge Production**            | Modules must expose collision, pivots, grid rules, variants, damage states, animation hooks, attachment points, material slots, LOD, and metadata. |

# 40. Simulation LOD, Navigation, Saves, Performance, and Godot/Summer Engine Direction

| **Simulation Range**              | **Dungeon Behaviour**                                                                                                                |
|-----------------------------------|--------------------------------------------------------------------------------------------------------------------------------------|
| **Loaded / Interactive**          | Full voxel/block state, actors, navigation, physics, traps, puzzles, machines, doors, audio, VFX, combat, ecology, and construction. |
| **Nearby Unloaded**               | Zone-level populations, patrol plans, ownership, production, hazards, power, water, doors, events, and scheduled changes.            |
| **Regional Abstract**             | Site macro-state, owner, danger, ecology totals, boss state, settlement, production, route access, damage, and event summary.        |
| **Dormant Realm / Distant World** | Bounded elapsed-time updates, no hidden lethal precision simulation, deterministic reconciliation when promoted.                     |

Implementation guidance remains data-driven and engine-neutral at the Atlas level while recognising the project has moved to Godot using Summer Engine. The outdated Unreal-specific technical plan must be rewritten. Recommended runtime ownership includes SiteDefinition resources, RoomModule resources, layout graphs, generated SiteInstance records, streamed zone scenes/chunks, voxel deltas, navigation regions, deterministic random streams, authoritative interaction transactions, and explicit promotion/demotion between detailed and abstract simulation.

# 41. Data Models, Stable IDs, Registries, Validation, and Seed Testing

| **Definition Type**         | **Stable ID Pattern**                                | **Example**                                     |
|-----------------------------|------------------------------------------------------|-------------------------------------------------|
| **Dungeon Family**          | dungeon.\<realm_or_overworld\>.\<category\>.\<name\> | dungeon.overworld.mine.deep_ironworks           |
| **Megadungeon**             | megadungeon.\<scope\>.\<name\>                       | megadungeon.crossrealm.gatebreaker_nexus        |
| **Room Module**             | room.\<family\>.\<function\>.\<variant\>             | room.mine.haulage.switchback_a                  |
| **Connector**               | connector.\<type\>.\<variant\>                       | connector.vertical.lift_ruined                  |
| **Hazard / Trap**           | hazard.\<domain\>.\<name\> / trap.\<owner\>.\<name\> | hazard.pressure.breach; trap.rune.silence_field |
| **Puzzle Grammar**          | puzzle.\<domain\>.\<name\>                           | puzzle.power.balance_three_flows                |
| **Site State**              | site_state.\<name\>                                  | site_state.contested                            |
| **Generated Site Instance** | site_instance.\<ULID\>                               | site_instance.01J...                            |
| **Generated Zone Instance** | site_zone.\<site_ulid\>.\<index\>                    | site_zone.01J...03                              |
| **Layout Seed**             | Derived numeric/hash field, not display ID           | world seed + site identity + layout version.    |

| **Validation Query**      | **Pass Condition**                                                                                                        | **Repair / Failure**                                                        |
|---------------------------|---------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------|
| **site.placement_valid**  | Volume, entrances, biome/realm, geology, routes, water, history, owner, and spacing are compatible.                       | Move candidate, select variant/family, alter entrance, or reject placement. |
| **site.critical_path**    | Primary objective, exit, required zones, and mandatory interactions are reachable.                                        | Reconnect graph, replace connector, open fallback, reject layout.           |
| **site.lock_order**       | Every mandatory key, tool, power, permission, clue, or puzzle is obtainable before use.                                   | Move dependency, add alternate route, substitute lock, reject layout.       |
| **site.return_safe**      | Player can leave after drops, boss states, portal changes, moving architecture, and multiplayer joins.                    | Add exit, rescue, anchor, reset, or reject layout.                          |
| **site.navigation**       | Required actor sizes, movement types, NPC work, creatures, mounts, and accessibility options can navigate.                | Replace module, widen route, add alternate path, reject layout.             |
| **site.ecology_viable**   | Populations have habitat, energy, water, refuge, movement, and capacity.                                                  | Change package, reduce population, add source/refuge, reject.               |
| **site.history_coherent** | Builder, purpose, materials, damage, occupation, objects, and records do not contradict without explanation.              | Replace dressing/state or add transition layer.                             |
| **site.realm_mechanic**   | Realm site uses at least one meaningful law-specific traversal, puzzle, permission, ecology, or state mechanic.           | Add mechanic module or fail completeness.                                   |
| **site.loot_reachable**   | Rewards are reachable under intended routes and ownership rules; no essential progression is trapped by optional failure. | Move reward, add bypass, change dependency.                                 |
| **site.performance**      | Module count, actors, navigation, lights, VFX, fluids, machines, and destructibility fit budget.                          | Reduce detail, split zones, abstract systems, select lower-cost variant.    |
| **site.poc_absent**       | No retired POC IDs, names, fixed coordinates, or scenario bindings appear in shipping pools.                              | Fail build and remove/archive content.                                      |

# 42. Content Completeness Contracts and Production Budgets

| **Content Package**                    | **Minimum v0.1 Contract**                                                                                                                                      |
|----------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Major Overworld Biome Family**       | At least 2 compatible minor sites/lairs, 1 standard dungeon family, 1 rare or cross-biome family, and explicit exclusions.                                     |
| **Major Overworld Region Archetype**   | At least 4 dungeon/site families across different origins, 1 faction/settlement site, 1 ecology/lair package, and 1 boss territory hook.                       |
| **Ocean / Sky / Underground Province** | At least 4 environment-specific families that use traversal and hazards unique to the layer.                                                                   |
| **Major Culture**                      | At least 3 structure/dungeon families showing daily life, sacred practice, industry, defence, history, and non-hostile occupation.                             |
| **Major Faction**                      | At least 2 active site profiles, 1 occupied/reused profile, supply logic, access law, and defeat/transfer/reoccupation states.                                 |
| **Major Realm**                        | At least 5 dungeon families, 3 ecology modules, 1 realm-law puzzle grammar, 1 restoration or political outcome, and 1 boss/guardian hook.                      |
| **Megadungeon**                        | At least 5 districts, 3 entrances, 2 factions/settlements, 2 ecology layers, 1 macro-puzzle, expedition logistics, and regional aftermath.                     |
| **Launch Milestone**                   | A balanced selection across natural, civilisation, sacred, industrial, military, urban, magical, lair, realm, and megadungeon content - not only combat ruins. |

| **Registry Foundation**     | **v0.1 Target**                                                                                            |
|-----------------------------|------------------------------------------------------------------------------------------------------------|
| **Overworld Site Families** | 72 foundations across 12 categories.                                                                       |
| **Realm Dungeon Families**  | 60 foundations: 5 for each of 12 realm families.                                                           |
| **Megadungeon Foundations** | 12 cross-system concepts.                                                                                  |
| **Room Modules**            | 24 universal functional foundations, expanding into family-specific variants.                              |
| **Hazard / Trap Modules**   | 20 system foundations.                                                                                     |
| **Puzzle Grammars**         | 16 foundations with accessibility and bypass policy.                                                       |
| **State Profiles**          | 17 common site states plus family-specific additions.                                                      |
| **Production Status**       | Concept -\> Atlas Defined -\> Registry Ready -\> Greybox -\> Content Complete -\> Validated -\> Shippable. |

# 43. Balancing, Accessibility, Representation, and Player-Freedom Rules

- Dungeon length, combat density, puzzle frequency, darkness, traps, resource pressure, navigation assistance, and persistence are configurable separately where practical.

- A site should contain quiet observation, decision, recovery, social, traversal, or environmental spaces; constant combat is not the default rhythm.

- No ancestry, culture, species, undead state, construct body, faith, or settlement type is automatically hostile or valid loot territory.

- Children, civilians, prisoners, refugees, domestic animals, sacred remains, awakened constructs, and noncombatants require explicit safety, law, and consequence rules.

- Colour, hearing, memory, timing, precision movement, motion, text density, and spatial orientation cannot be assumed as universal player capabilities.

- Procedural generation may vary challenge and route but may not hide essential accessibility behind random chance.

- Players can often solve sites through combat, stealth, diplomacy, construction, tools, magic, automation, ecology, law, knowledge, trade, rescue, or withdrawal.

- Rare rewards do not justify incoherent layouts, unfair traps, permanent soft-locks, or erasure of world consequences.

# 44. Cross-Document Update Plan

| **Document**                                         | **Required Revision**                                                                                                                                                  |
|------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **00 Master Bible**                                  | Replace POC dungeon examples with post-POC procedural sites, realm dungeons, megadungeons, restoration, and persistent aftermath.                                      |
| **01 Core Gameplay Loop**                            | Remove fixed cave/rune/goblin-camp routes; use seed-derived discovery, site states, faction conflict, ecology, and category-equivalent progression.                    |
| **02 Player Progression**                            | Attach dungeon knowledge, routes, tools, reputation, restoration, realm laws, alternate solutions, and megadungeon expedition progression.                             |
| **03 Blocks / 04 Items / 05 Recipes / 06 Resources** | Add module blocks, damage states, locks, traps, puzzle parts, keys, maps, salvage, repair, restoration, site resources, and stable Atlas links.                        |
| **07 NPC Village System**                            | Support dungeon settlements, expeditions, prisoners, refugees, workers, claims, restoration, ownership, and reoccupation.                                              |
| **08 Automation**                                    | Add dungeon power, pumps, lifts, rails, ventilation, foundries, logistics, sensors, shutdowns, restoration, and captured infrastructure.                               |
| **09 Magic**                                         | Add realm-law puzzles, wards, spirit sites, living architecture, portals, corruption, cleansing, memory, dream, contract, and divine permissions.                      |
| **10 Creatures / 24F**                               | Consume dungeon ecology packages, lair grammar, migration, nests, invasive species, guardians, and boss ecology.                                                       |
| **11 Biomes / 24B-24C**                              | Replace POC structures with site suitability slots, entrances, route integration, dungeon density, layer-specific hazards, and repair validation.                      |
| **12 Structures**                                    | Supersede POC structure registry with 24G taxonomy, grammars, states, detailed families, restoration, and megadungeon contracts.                                       |
| **13 Peoples / 24E**                                 | Attach builders, architecture, sacred practice, settlements, claims, laws, occupation, heritage, and non-hostile dungeon residents.                                    |
| **14 Dimensions / 24D**                              | Attach 60 realm dungeon families, law-specific mechanics, realm ecology, route safety, and realm-state aftermath.                                                      |
| **15 Quests / Events**                               | Add surveys, rescues, expeditions, claims, archaeology, sieges, restoration, containment, rumours, recurring site stories, and event-bound dungeons.                   |
| **16 Combat / Defence**                              | Support modular arenas, hazards, destructibility, retreat, siege, civilians, traps, multi-route encounters, and boss aftermath.                                        |
| **17 UI/UX**                                         | Add map layers, dungeon notes, floor/zone views, uncertainty, party pings, puzzle feedback, accessibility, ownership, restoration, and expedition UI.                  |
| **18 Technical Plan**                                | Rewrite for Godot/Summer Engine with deterministic site graphs, streamed zones, voxel deltas, navigation, persistence, validation, multiplayer authority, and budgets. |
| **24H-24L**                                          | Consume boss sockets, structure/infrastructure links, rewards, history/events, stable registries, asset budgets, and production milestones.                            |

# 45. Open Questions

| **Question**                                                                                                    | **Primary Follow-On Owner**                       |
|-----------------------------------------------------------------------------------------------------------------|---------------------------------------------------|
| Which 72 Overworld site foundations are launch-critical, expansion-ready, or backlog only?                      | 24L production roadmap.                           |
| Which megadungeons are unique world features, rare families, or optional content packs?                         | 24K/24L.                                          |
| How much voxel destruction and reconstruction can large dungeon modules afford?                                 | Rewritten technical plan and performance testing. |
| Which puzzle grammars require bespoke code versus reusable data/state machines?                                 | 24L and technical implementation.                 |
| What is the target ratio of combat, traversal, social, puzzle, ecology, restoration, and quiet rooms by family? | Balance passes and playtesting.                   |
| How many active settlements can exist inside megadungeons at each simulation LOD?                               | NPC/settlement rewrite and technical budgets.     |
| Which realm dungeons require unique traversal systems, and when are those systems introduced?                   | 24D/24L progression and production planning.      |
| How are player-built edits protected when sites reoccupy, shift, recurse, or receive content updates?           | Save/versioning architecture.                     |
| What world settings govern dungeon reset, resource renewal, boss recurrence, and faction reoccupation?          | World settings/UI and simulation design.          |
| Which sites require handcrafted signature layouts rather than fully modular assembly?                           | 24L content and asset budget.                     |

# Appendix A. Dungeon Family Definition Template

| **Field Group**         | **Required Fields**                                                                                                                        |
|-------------------------|--------------------------------------------------------------------------------------------------------------------------------------------|
| **Identity**            | atlas_id, definition_id, display_name_key, aliases, category, scale_band, source_pack, schema_version, production_status.                  |
| **Purpose and Fantasy** | core_fantasy, world_role, player_fantasy, provides, threatens, reveals, unlocks, transforms, non_goals.                                    |
| **Placement**           | realm_ids, region/biome families, terrain, depth/altitude, water, geology, route, settlement, faction, magic, rarity, spacing, exclusions. |
| **History**             | origin, creator/builder, original_purpose, age, transitions, previous_owners, catastrophe, claims, myths, evidence.                        |
| **Topology**            | scale, required_zones, optional_zones, entrances, exits, critical_graph, connectors, verticality, shortcuts, subsite policy.               |
| **Modules**             | room pools, signature_rooms, connector pools, hazards, traps, puzzles, set_pieces, dressing, destruction, variants.                        |
| **Population**          | ecology_package, factions, settlers, guardians, boss_slots, patrols, safe_zones, reoccupation_capacity.                                    |
| **Systems**             | power, mana, water, weather, pressure, gravity, machines, portals, law, permissions, alarms, restoration.                                  |
| **Rewards**             | resource sources, loot sockets, knowledge, relics, salvage, social rewards, infrastructure, boss rewards, ownership.                       |
| **States**              | initial_state_pool, runtime_states, transitions, reset_policy, persistence, recurrence, regional_aftermath.                                |
| **Presentation**        | palette, silhouette, lighting, soundscape, VFX, props, signs, map icon, Forge assets, accessibility cues.                                  |
| **Technical**           | layout_version, layout_seed, streaming_profile, navigation_profile, LOD, save_record, validation_suite, performance_budget.                |

# Appendix B. Room, Hazard, Trap, and Puzzle Module Templates

| **Module Field**     | **Required Content**                                                                                            |
|----------------------|-----------------------------------------------------------------------------------------------------------------|
| **Identity**         | stable_id, family, function, variant, size, shape, grid, source_pack, status.                                   |
| **Connections**      | connector types, count ranges, orientation, level change, lock compatibility, one-way policy, visibility.       |
| **Placement**        | required/forbidden neighbours, zone roles, depth, terrain, water, structure, creator, state, realm law.         |
| **Gameplay Sockets** | encounter, ecology, patrol, NPC, loot, clue, puzzle, trap, hazard, boss, rest, construction, audio, VFX.        |
| **State**            | intact, damaged, powered, flooded, sealed, corrupted, occupied, restored, destroyed, moving, seasonal variants. |
| **Navigation**       | player, NPC, creature sizes, mounts, swimming, flying, climbing, accessibility alternate route, regroup anchor. |
| **Readability**      | landmark, light, colour-independent signal, audio caption, signage, sightline, hazard warning, clue channels.   |
| **Performance**      | mesh/block budget, collision, navigation cost, actors, lights, fluids, VFX, simulation, LOD, occlusion.         |

# Appendix C. Site-State and Restoration Template

| **Field**                  | **Required Content**                                                                                                   |
|----------------------------|------------------------------------------------------------------------------------------------------------------------|
| **Current State**          | owner, occupiers, population, danger, environment, damage, power, water, locks, boss, resources, loot, discovery.      |
| **Transition Trigger**     | player action, faction event, ecology, season, disaster, time, boss outcome, resource extraction, realm change.        |
| **Requirements**           | materials, workers, knowledge, tools, permissions, power, route, safety, diplomacy, ritual, ecology.                   |
| **Visible Work**           | scaffolds, cleared rubble, pumps, repairs, builders, machines, wards, routes, stores, camps, signage.                  |
| **Result**                 | new owner/function, routes, settlement, production, ecology, safety, trade, law, story, realm access, regional effect. |
| **Failure / Interruption** | reserved resources, partial progress, danger, damage, theft, faction response, repair, resume policy.                  |
| **Persistence**            | save fields, player builds, voxel deltas, residents, inventories, map, quest/event links, content-version safety.      |

# Appendix D. Dimension Dungeon Package Template

| **Package Requirement**   | **Minimum Content**                                                                                      |
|---------------------------|----------------------------------------------------------------------------------------------------------|
| **Realm Identity**        | realm_id, realm laws, biome compatibility, societies, ecology, resources, route, survival, presentation. |
| **Dungeon Families**      | At least five authored families with different origins/functions and no palette-swap duplication.        |
| **Law Mechanics**         | At least one traversal, one puzzle/permission, one hazard, and one state transition using realm laws.    |
| **Ecology**               | At least three compatible dungeon ecology modules and one invasive/cross-realm relationship.             |
| **Civilisation**          | At least two society/faction relationships, including non-hostile occupation or cultural claim.          |
| **Boss / Guardian**       | At least one boss ecology/guardian hook with alternate resolution and realm aftermath socket.            |
| **Restoration / Outcome** | At least one site can change route, politics, ecology, infrastructure, law, or realm stability.          |
| **Validation**            | Access, return, law clarity, solvability, save safety, multiplayer, performance, and completeness tests. |

# Appendix E. Completeness and Validation Matrix

| **Check**             | **Acceptance Condition**                                                                                                               |
|-----------------------|----------------------------------------------------------------------------------------------------------------------------------------|
| **POC Retirement**    | No Forest Hamlet cave, rune clearing, goblin camp, watchtower, fixed raid route, or POC-only site binding remains in shipping pools.   |
| **World Fit**         | Every site family defines compatible realms, regions, biomes, terrain, history, factions, ecology, routes, rarity, and exclusions.     |
| **Identity**          | Origin, builder/creator, purpose, age, transition, current state, world role, and signature grammar are defined.                       |
| **Layout**            | Required zones, graph rules, modules, connectors, entrances, exits, shortcuts, locks, hazards, puzzles, and return policy are defined. |
| **Solvability**       | Critical path, dependency order, navigation, accessibility, multiplayer joins, retreat, and recovery pass automated validation.        |
| **Population**        | Inhabitants have habitat, supplies/energy, movement, ownership, law, and reoccupation logic.                                           |
| **Dimension Quality** | Each major realm has five families and law-specific traversal/puzzle/state mechanics.                                                  |
| **Persistence**       | Discovery, map, blocks, doors, puzzles, bosses, owners, populations, loot, restoration, and player edits are save-safe.                |
| **Consequences**      | Clearing, killing, bargaining, restoring, claiming, sealing, or destroying a site changes appropriate world state.                     |
| **Production**        | Stable IDs, registry fields, Forge attachments, simulation profiles, budgets, test seeds, and content status are assigned.             |

# Appendix F. Acceptance Criteria

| **Criterion**                | **Definition of Done**                                                                                                                                       |
|------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Numbering and Scope**      | Document is formally identified as 24G and owns post-POC dungeons, ruins, lairs, dimension dungeons, and megadungeon Atlas content.                          |
| **POC Retirement**           | All fixed POC site assumptions are explicitly archived and excluded from production.                                                                         |
| **Dungeon Foundation**       | Taxonomy, scale, origin, topology, layout grammar, modules, routes, traversal, hazards, traps, puzzles, ecology, ownership, history, and states are defined. |
| **Content Expansion**        | 72 Overworld site families, 60 realm dungeon families, and 12 megadungeon foundations are documented.                                                        |
| **Dimension Quality**        | All twelve realms have five dungeon families with realm-law mechanics and no cosmetic-only treatment.                                                        |
| **Persistence and Outcomes** | Reoccupation, restoration, claiming, settlement, reset, loot, boss aftermath, and long-term world change are defined.                                        |
| **Production Readiness**     | Stable IDs, templates, budgets, validation queries, completeness contracts, Forge hooks, and cross-document updates are included.                            |
| **Player Trust**             | Solvability, return safety, multiplayer joins, accessibility, personhood, alternate solutions, and fair hazard communication are explicit.                   |
| **Engine Alignment**         | Atlas remains engine-neutral while recognising Godot/Summer Engine and requiring an updated technical plan.                                                  |

**End of [[24G - Dungeons, Ruins, Lairs and Megadungeons Atlas]] - Dungeons, Ruins, Lairs and Megadungeons Atlas v0.1**

---
## Navigation
- Previous: [[24F - Wildlife, Creatures, Monsters and Ecology Atlas|24F]]
- Next: [[24H - Bosses, Titans, Siege Threats and Realm Guardians Atlas|24H]]
- Index: [[00 - Document Set 24 Index]]
