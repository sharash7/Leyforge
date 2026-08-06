---
title: 24A — Foundations, World Topology and Procedural Content Rules
document_set: 24
document: 24A
aliases:
- 24A
- Document 24A
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
- 24a
---

# 24A — Foundations, World Topology and Procedural Content Rules

> [!NOTE]
> Obsidian-ready Markdown conversion of the approved Set 24 source document. Source wording and structure have been preserved wherever possible.

**Fantasy Voxel Civilisation Sandbox**

**24A - World Content Atlas Foundations, World Topology and Procedural Content Rules**

Version 0.1 - Post-POC Production Foundation Draft

A database-ready atlas foundation for seed-derived worlds, procedural history, regions, biomes, civilisations, ecology, dungeons, bosses, dimensions, dynamic world states, content validation, and the retirement of all hardcoded proof-of-concept world content.

| **World Content Atlas Statement**                                                                                                                                                                                                                                                                                                                                                                                                                        |
|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| The Atlas is the master relationship and procedural-content authority for Leyforge. It defines how authored content families are selected, combined, placed, connected, transformed, validated, and remembered by a world seed. It does not prescribe one fixed world. Every normal production world must emerge from deterministic seed-derived rules and runtime consequences rather than from the retired Forest Hamlet proof-of-concept arrangement. |

| **Field**              | **Locked Direction**                                                                                                                                                                                                                                         |
|------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Document Set**       | This document begins Document Set 24. The set is the post-POC World Content Atlas and production content foundation.                                                                                                                                         |
| **Document Scope**     | Atlas authority, world topology, seed hierarchy, procedural history, content relationship graph, placement rules, progression guarantees, dynamic-state contracts, content budgets, validation, migration, and production workflow.                          |
| **Post-POC Direction** | All Forest Hamlet POC names, NPCs, structures, encounter placements, scripted relationships, and guaranteed raid/tutorial arrangements are removed from normal production content.                                                                           |
| **World Direction**    | Worlds are assembled deterministically from authored content families using a seed. Randomisation is constrained by compatibility, ecology, culture, history, progression, terrain, and realm rules.                                                         |
| **Atlas Direction**    | The Atlas records not only what exists, but where it belongs, what it connects to, what it produces or threatens, and how it can change.                                                                                                                     |
| **Content Expansion**  | Expand overworld biomes, oceans, skylands, underground layers, peoples, cultures, factions, wildlife, monsters, dungeons, dimension dungeons, regional bosses, world bosses, realm guardians, resources, events, structures, history, and discovery systems. |
| **Data Direction**     | Use stable namespaced IDs, parent families, tags, weighted rules, negative constraints, cross-links, deterministic seed derivation, content hashes, schema versions, and save-safe runtime records.                                                          |
| **Engine Boundary**    | This is engine-neutral gameplay and content architecture. Current implementation work targets Godot with Summer Engine; outdated engine-specific assumptions in Document 18 are not carried forward here.                                                    |

# Document Purpose

This document establishes the shared foundation for the entire World Content Atlas. It converts the project from a validated proof-of-concept into a production-scale, seed-driven fantasy world where continents, regions, biomes, cultures, settlements, structures, dungeons, creatures, bosses, dimensions, resources, histories, and events are procedurally assembled from authored content families.

The Atlas is not a replacement for the existing detailed system documents. Documents 10 through 15 still define creature, worldgen, structure, civilisation, dimension, quest, and event behaviour. Document Set 24 expands their content scope, removes POC-specific assumptions, and adds the cross-document rules required to generate coherent worlds without hardcoded regions or mandatory named content.

The central production challenge is not simply to create more entries. It is to ensure that every entry participates in a relationship web. A biome must support resources, ecology, structures, cultures, events, and progression. A creature must belong to an ecology and create meaningful consequences. A dungeon must have an origin, inhabitants, hazards, rewards, and a future state. A boss must affect a territory before and after confrontation. A dimension must operate as a world rather than as a recoloured biome package.

# Design Source and Supersession Rules

| **Source Document**                        | **Direction Retained**                                                                                                                                           | **24A Expansion or Supersession**                                                                                                                                                     |
|--------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 00 - Master Game Design Bible              | Living NPC civilisations, survival, magic, automation, story, dimensions, player freedom, and world consequences remain the central identity.                    | The Atlas becomes the master map connecting those pillars across generated content.                                                                                                   |
| 01 - Core Gameplay Loop                    | Explore -\> gather -\> craft -\> build -\> interact -\> automate -\> defend -\> upgrade -\> expand remains the broad sandbox loop.                               | The fixed POC relationship chain is retired. Any seed must produce multiple valid ways to enter and continue the loop.                                                                |
| 07 - NPC Village System                    | Persistent NPC identity, jobs, needs, settlements, reputation, migration, and simulation LOD remain required.                                                    | POC villagers and the fixed Forest Hamlet roster are removed. NPCs are generated from culture, settlement, household, profession, and history records.                                |
| 10 - Creatures and Monsters                | Creatures are ecology, resources, threats, factions, magical evidence, and progression rather than generic health bars.                                          | Creature families receive atlas habitats, food webs, variants, nest rules, dungeon roles, regional pressure, and boss relationships.                                                  |
| 11 - Biomes and World Generation           | Layered seeds, regions, climates, terrain, magic, civilisation, resources, structures, ecology, and dynamic states remain foundational.                          | The controlled POC valley and guaranteed POC arrangement are removed from production. Category-based progression guarantees replace fixed placements.                                 |
| 12 - Structures                            | Structures are dynamic evidence of history, ownership, danger, magic, civilisation, restoration, and world state.                                                | Dungeons, wonders, boss sites, realm structures, mobile sites, megadungeons, and procedural origin/history records are expanded.                                                      |
| 13 - Races, Peoples, Cultures and Factions | Ancestry, culture, faction, language, government, religion, territory, and history remain separate layered identities.                                           | The Atlas connects them to regional variants, migrations, settlements, ecologies, resources, architecture, realm ties, and generated historical claims.                               |
| 14 - Dimensions                            | Major realms are persistent worlds with regions, biomes, societies, routes, survival rules, resources, dungeons, and outcomes.                                   | Each realm receives a multi-biome content contract, native ecology, dungeon taxonomy, boss hierarchy, cross-realm effects, and procedural topology.                                   |
| 15 - Quest and Event System                | Authored and simulation-driven quests/events bind to stable world facts and leave persistent evidence.                                                           | Atlas entries expose event hooks, rumours, history claims, boss pressure, dungeon state transitions, migrations, disasters, and discovery paths.                                      |
| 18 - Technical Implementation Plan         | Stable IDs, definitions versus runtime records, deterministic generation, registries, seed-plus-delta saves, LOD, validation, and content packs remain valuable. | Only engine-neutral contracts are retained. Unreal-specific implementation direction is superseded by the current Godot/Summer Engine project direction and later technical rewrites. |

# Static Table of Contents

- 1\. Locked World Content Atlas Identity

- 2\. Player Direction and Locked Decisions

- 3\. Document Set 24 Map

- 4\. Atlas Authority, Boundaries, and Source-of-Truth Rules

- 5\. POC Retirement and Production Migration

- 6\. Authored Randomness and Deterministic Seed Philosophy

- 7\. World, Realm, Region, and Local Topology

- 8\. Seed Derivation and Generation Identity

- 9\. World Generation and Content Assembly Pipeline

- 10\. Procedural History and Archaeology

- 11\. Atlas Relationship Graph

- 12\. Content Families, Inheritance, Tags, and Constraints

- 13\. Region Identity and Biome Mosaic Rules

- 14\. Civilisation, Territory, Settlement, and Route Generation

- 15\. Ecology, Creature, Monster, and Boss Placement

- 16\. Structures, Dungeons, Wonders, and Megadungeons

- 17\. Dimensions, Realm Networks, and Dimension Content

- 18\. Progression Guarantees Without Hardcoded Content

- 19\. Rarity, Density, Uniqueness, and Repetition Control

- 20\. Dynamic World States and Long-Term Transformation

- 21\. Discovery, Rumours, Names, Maps, and Codex Truth

- 22\. Simulation LOD and Off-Screen World Continuity

- 23\. Saves, Versioning, Regeneration, and Existing-World Safety

- 24\. Content Packs, Modding, and Dependency Rules

- 25\. Content Budgets and Minimum Completeness Contracts

- 26\. Atlas Authoring and Production Workflow

- 27\. Validation, Testing, Debugging, and Seed QA

- 28\. Cross-Document Requirements and Update Plan

- 29\. Example Seed-Derived Region Assembly

- 30\. Balancing and Design Rules

- 31\. Open Questions for Later Atlas Documents

- Appendix A. POC Retirement Checklist

- Appendix B. Atlas Stable ID and Tag Conventions

- Appendix C. Atlas Entry Relationship Template

- Appendix D. Generation Validation Matrix

- Appendix E. [[24A - Foundations, World Topology and Procedural Content Rules]] Acceptance Criteria

# 1. Locked World Content Atlas Identity

The World Content Atlas is the organisational and generative layer that connects the game’s authored content. The player experiences a world, not a spreadsheet: mountain chains lead into valleys, rivers shape trade routes, cultures settle where they can survive, ruins reflect earlier civilisations, predators follow prey, dungeons emerge from history and geology, bosses affect entire territories, and portals connect realms with consequences on both sides.

| **Locked Rule**                                                                                                                                                                                                                                                                                                                                                                   |
|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| A normal production world must not depend on a fixed named region, mandatory POC settlement, predetermined NPC roster, hardcoded dungeon, scripted raid source, or exact coordinate arrangement. All world-facing content must be selected through seed-derived, data-driven, validated relationship rules. Authored uniqueness is allowed; hardcoded universal placement is not. |

| **Identity Layer**     | **Design Meaning**                                                                                                                       | **Player-Facing Result**                                                                                             |
|------------------------|------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------|
| Procedural Coherence   | Seeded systems choose compatible content through geography, ecology, history, culture, magic, and progression rules.                     | Worlds feel intentionally formed rather than randomly scattered.                                                     |
| Authored Depth         | Designers author strong biome, creature, culture, dungeon, boss, and realm families.                                                     | Procedural worlds still contain memorable lore, mechanics, architecture, and encounters.                             |
| Relationship Authority | The Atlas records connections and constraints between content registries.                                                                | Creatures, resources, settlements, dungeons, and stories belong to their environments.                               |
| World Memory           | Generated history and runtime consequences remain visible through states, ruins, ownership, migration, damage, restoration, and stories. | Each save develops a distinct identity and timeline.                                                                 |
| Production Scale       | Parent families, tags, content packs, budgets, and validation support large content growth.                                              | The game can expand without becoming inconsistent or impossible to maintain.                                         |
| Player Freedom         | The seed creates opportunities and problems, not a mandatory route.                                                                      | Players can survive, build, trade, explore, automate, help, conquer, restore, or ignore content in different orders. |

## 1.1 Atlas Design Promise

A player should be able to inspect a region and infer useful relationships: where water flows, which people may settle there, what resources are likely, which roads are safe, why a ruin exists, what creature left nearby tracks, which faction claims the valley, what boss is disturbing the ecology, and how local events may change the area. The underlying generation can be deep, but its results must remain readable through terrain, architecture, sound, signs, rumours, maps, NPC behaviour, and world-state evidence.

## 1.2 What the Atlas Is Not

- It is not a giant list of disconnected content names.

- It is not unrestricted random placement or noise-driven terrain with loot sprinkled on top.

- It is not a requirement that every seed contain every culture, biome, dungeon, boss, or dimension in equal quantities.

- It is not a linear campaign map hidden behind procedural terrain.

- It is not permission to generate incoherent combinations simply because they are technically possible.

- It is not a replacement for detailed registries, Forge asset documents, balance tables, or implementation specifications.

# 2. Player Direction and Locked Decisions

| **Area**                   | **Locked Decision**                                                                                                                                                                          |
|----------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Numbering**              | This is [[24A - Foundations, World Topology and Procedural Content Rules]] and the first document in World Content Atlas Document Set 24.                                                                                                          |
| **POC Status**             | The proof-of-concept has completed its purpose. POC world content is retired from the shipping game and may survive only in non-shipping archives or automated regression fixtures.          |
| **World Start**            | No fixed Forest Hamlet, fixed valley, guaranteed goblin raid, fixed rune clearing, or mandatory named villager arrangement.                                                                  |
| **Randomisation**          | Every normal world is deterministic from a seed and assembled from authored families. “Random” means seed-selected and rule-constrained, not arbitrary.                                      |
| **Overworld Expansion**    | Add many more surface, water, ocean, sky, underground, magical, ancient, corrupted, civilisation-altered, and transition biomes.                                                             |
| **Dimension Expansion**    | Every major realm receives multiple biome families, native ecology, settlements or societies where appropriate, dungeon families, bosses, resources, routes, and persistent outcomes.        |
| **Creature Expansion**     | Expand ambient fauna, prey, predators, apex species, livestock, mounts, work beasts, magical wildlife, faction enemies, dungeon creatures, invasives, titans, and variants.                  |
| **Dungeon Expansion**      | Add micro-dungeons, lairs, ruins, mines, crypts, temples, towers, fortresses, grand dungeons, living dungeons, mobile sites, megadungeons, realm dungeons, and cross-dimensional labyrinths. |
| **Boss Expansion**         | Use elites, lair bosses, dungeon bosses, faction champions, regional bosses, wandering bosses, siege threats, overworld titans, realm guardians, sovereigns, and multi-realm world threats.  |
| **Civilisation Expansion** | Connect peoples to cultures, factions, languages, settlement forms, architecture, food, trade, magic, technology, histories, migrations, ecologies, and realm relationships.                 |
| **Dynamic World**          | Biomes, structures, settlements, factions, dungeons, boss territories, and realm conditions can change during play and remain changed.                                                       |
| **Atlas Purpose**          | Record why content exists, where it belongs, what it connects to, what it changes, and which production assets and registries it requires.                                                   |

# 3. Document Set 24 Map

Document Set 24 is intentionally divided into focused volumes. A single Atlas document would become too large to author, review, validate, and update safely. [[24A - Foundations, World Topology and Procedural Content Rules]] defines the shared rules consumed by every later volume.

| **Document**                                                     | **Primary Scope**                                                                                                       | **Key Output**                                    |
|------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------|
| 24A - Atlas Foundations                                          | World topology, seeds, procedural history, relationship graph, placement, validation, POC retirement, production rules. | Shared generation and content-authoring contract. |
| 24B - Overworld Regions and Surface Biomes                       | Continents, climates, terrain families, surface biomes, transitions, seasons, disasters.                                | Overworld region and surface-biome atlas.         |
| 24C - Oceans, Skylands, Underground and Special Overworld Biomes | Coasts, oceans, underwater, caves, deep layers, skylands, magical, corrupted, ancient, and hybrid zones.                | Non-standard Overworld topology and biome atlas.  |
| 24D - Dimensions, Realm Structure and Realm Biome Index          | Cosmology, realm maps, physical laws, biomes, societies, ecology, routes, realm states.                                 | Master realm atlas and expansion index.           |
| 24E - Peoples, Cultures, Factions and Settlements                | Ancestries, cultures, governments, languages, factions, settlements, architecture, histories, migration.                | Civilisation content atlas.                       |
| 24F - Wildlife, Creatures, Monsters and Ecology                  | Ecological roles, creature families, habitats, behaviour, variants, taming, monster societies.                          | Creature and ecology atlas.                       |
| 24G - Dungeons, Ruins, Lairs and Megadungeons                    | Dungeon taxonomy, procedural grammar, origin, state, hazards, puzzles, inhabitants, rewards, restoration.               | Dungeon content atlas.                            |
| 24H - Bosses, Titans, Siege Threats and Realm Guardians          | Boss hierarchy, territories, mechanics, alternatives, world effects, rewards, recurrence.                               | Boss and major-threat atlas.                      |
| 24I - Structures, Landmarks, Routes, Wonders and Infrastructure  | Settlement structures, roads, ports, forts, shrines, portals, wonders, megastructures.                                  | World structure and navigation atlas.             |
| 24J - Resources, Loot, Relics, Trade and Material Ecology        | Natural, cultural, creature, dungeon, boss, magical, dimensional, strategic resources and trade webs.                   | Material and reward atlas.                        |
| 24K - World History, Story Arcs, Events and Dynamic States       | Generated history, wars, disasters, myths, regional arcs, realm outcomes, event families, persistent evidence.          | History and living-world atlas.                   |
| 24L - Content Registry, Cross-Link Matrix and Production Roadmap | Stable IDs, templates, dependency graph, completeness, asset requirements, staging, implementation readiness.           | Production control and master content matrix.     |

# 4. Atlas Authority, Boundaries, and Source-of-Truth Rules

The Atlas owns cross-content relationships and procedural eligibility. Detailed system documents own behaviour; content registries own individual definitions; runtime records own what happened in a specific save; Forge documents own how assets are authored and assembled; implementation documents own engine architecture.

| **Question**                               | **Authoritative Source**                                           | **Example**                                                                    |
|--------------------------------------------|--------------------------------------------------------------------|--------------------------------------------------------------------------------|
| What is a creature capable of?             | Creature System and Creature Registry.                             | Movement, senses, attacks, morale, drops, taming support.                      |
| Where may that creature appear?            | Atlas relationship and habitat records.                            | Temperate forest edge, nocturnal, near prey, excluded from warded urban cores. |
| What happened to this creature population? | Runtime region/ecology state.                                      | Population reduced, migrated, corrupted, domesticated, locally extinct.        |
| What does a dungeon mechanically support?  | Structure/Dungeon system and dungeon definition.                   | Room grammar, reset rules, hazards, ownership, restoration.                    |
| Why and where does that dungeon exist?     | Atlas origin, history, region, faction, geology, and rarity links. | Collapsed ancestral mine beneath former trade road in iron-rich highlands.     |
| How is it built in the engine?             | Current technical implementation documentation.                    | Godot resources, generation services, voxel data, scenes, save records.        |

| **Source-of-Truth Rule**                                                                                                                                                                                                                              |
|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| A field should have one authoritative owner. Other documents reference it by stable ID rather than duplicating editable truth. The Atlas may summarise behaviour for readability, but it must not silently redefine system mechanics owned elsewhere. |

# 5. POC Retirement and Production Migration

The POC proved the connected loop and therefore should no longer shape the final game’s world content. Retirement does not mean losing the learning. It means separating development evidence from production content so the finished game is not permanently constrained by a test scenario.

## 5.1 Content Removed from Normal Production

- Forest Hamlet as a guaranteed or canonical starter settlement.

- The fixed valley arrangement and any exact POC region graph.

- Hardcoded POC villagers, their homes, jobs, placement, and scripted identities.

- The guaranteed watchtower supply project and mandatory goblin raid outcome.

- The exact goblin camp, old rune clearing, mana pocket, cave, bridge, or road arrangement.

- POC-only spawn weights, resource guarantees, quest stages, tutorial prompts, and timing assumptions.

- Any world-generation code that checks for a POC name, coordinate, region ID, or fixed progression path.

## 5.2 Content That May Survive as General Families

A POC concept may survive only after it is stripped of POC identity and rebuilt as a reusable family. A forest hamlet becomes one possible settlement archetype. A wooden watchtower becomes one defence blueprint. A goblin raid becomes one event family. A rune ruin becomes one ancient magical structure family. None of them retains universal placement or mandatory story status.

| **POC Asset or Idea** | **Production Conversion**                                                                  | **Shipping Rule**                                                                                   |
|-----------------------|--------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------|
| Forest Hamlet         | Generic forest/rural settlement family with culture and biome variants.                    | May appear only through settlement selection rules.                                                 |
| Named POC Villagers   | Generated NPCs from culture, household, profession, age, trait, and history pools.         | No fixed names or identities in production seeds unless later authored as optional lore characters. |
| Watchtower Project    | Defence project family with timber, stone, culture, magical, and industrial variants.      | Generated from local threat, law, resources, settlement goals, and player action.                   |
| Goblin Raid           | Raid event family usable by suitable hostile factions and territorial conditions.          | Not guaranteed and not restricted to goblins.                                                       |
| Old Rune Clearing     | Ancient magic-site family with multiple origins, states, owners, puzzles, and realm links. | Selected by history, leyline, biome, structure density, and progression needs.                      |
| POC Valley            | Developer-only regression map or seed fixture.                                             | Excluded from shipping world presets and production registry pools.                                 |

## 5.3 Non-Shipping Test Preservation

The team may retain automated regression fixtures that reproduce equivalent mechanics, but these fixtures must live in developer/test packages. They should use test namespaces and synthetic content, not production-facing POC lore. This preserves repeatable system tests without allowing the POC to spawn in player worlds.

# 6. Authored Randomness and Deterministic Seed Philosophy

The final world is not hand-authored as one map, but neither is it generated from unrestricted randomness. Designers author meaningful families, rules, dependencies, and constraints. The seed chooses among valid possibilities and produces a reproducible result.

| **Principle**          | **Rule**                                                                                                                   | **Reason**                                                                         |
|------------------------|----------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------|
| Determinism            | The same world seed, world profile, content set, and generation version produce the same untouched base world.             | Supports saves, multiplayer, debugging, sharing, and reproducibility.              |
| Derived Random Streams | Each generation domain uses a namespaced derived seed rather than one global random sequence.                              | Adding a creature should not unexpectedly move rivers or rewrite every settlement. |
| Authored Families      | Biomes, structures, creatures, cultures, dungeons, and bosses come from curated definitions.                               | Quality and identity remain intentionally designed.                                |
| Weighted Eligibility   | Content is selected only after hard constraints pass, then weighted by soft preferences and world history.                 | Prevents incoherent combinations while preserving variety.                         |
| Runtime Delta          | Generation creates an immutable conceptual base; player and simulation changes are stored as deltas and historical events. | The world can change without losing seed reproducibility.                          |
| World-Specific Absence | A valid seed may omit optional content and produce different dominant cultures or ecologies.                               | Saves develop distinct identities rather than containing the same checklist.       |

| **Clarification**                                                                                                                                                                                                                                                                                 |
|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| “100% randomised from a seed” means that normal world content is selected and arranged by deterministic generation rules. It does not mean that every texture, sentence, boss mechanic, or building is invented at runtime. The quality comes from authored parts combined in seed-specific ways. |

# 7. World, Realm, Region, and Local Topology

The Atlas uses nested topology so systems can reason at the correct scale. A world contains one or more persistent realms. A realm contains macro-regions and route networks. Regions contain biome mosaics, territories, settlements, structures, dungeon networks, ecologies, and event state. Local chunks contain voxel terrain and active entities.

| **Topology Layer**    | **Owns or Describes**                                                                                             | **Typical Examples**                                        |
|-----------------------|-------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------|
| World Save            | World identity, profile, calendar, realm network, global history, content hashes, generation version.             | One Leyforge save and its connected realities.              |
| Realm                 | Global laws, major topology, sky/time/gravity, realm seed, access rules, realm-wide states.                       | Overworld, Verdant Covenant, World-Engine, pocket realms.   |
| Macro-Region          | Climate identity, terrain form, history, dominant cultures, major threats, route graph, rarity band.              | Highland kingdom basin, storm coast, blighted frontier.     |
| Region                | Named local identity, biome set, faction pressure, settlements, dungeons, resources, boss territory, event state. | A river valley, plateau, island chain, root-depth province. |
| Biome Patch/Sub-Biome | Local terrain palette, vegetation, ecology, weather, resource and structure weights.                              | Fen margin, crystal glade, alpine pass, kelp shelf.         |
| Site/Anchor           | A persistent structure, settlement, dungeon, wonder, portal, lair, or unique landmark.                            | City, ancient vault, titan den, realm gate.                 |
| Local Voxel Area      | Blocks, fluids, damage, construction, entities, pathfinding, active simulation.                                   | Chunks currently loaded around players.                     |

## 7.1 Overworld Vertical and Environmental Layers

| **Layer**                | **Atlas Scope**                                                                           | **Examples**                                       |
|--------------------------|-------------------------------------------------------------------------------------------|----------------------------------------------------|
| Sky and Upper Atmosphere | Weather, celestial events, flying ecology, skylands, aerial routes, floating structures.  | Storm fronts, migration corridors, floating ruins. |
| Surface                  | Continents, islands, rivers, roads, settlements, surface biomes, agriculture, territory.  | Forests, plains, cities, deserts, coasts.          |
| Water and Ocean          | Rivers, lakes, deltas, reefs, open seas, trenches, submerged structures and societies.    | Kelp forests, island chains, abyssal ruins.        |
| Shallow Underground      | Caves, mines, roots, aquifers, early resources, local ruins.                              | Limestone caves, fungal pockets, abandoned shafts. |
| Deep World               | Deepstone, subterranean oceans, buried civilisations, magma networks, impossible geology. | Machine strata, crystal seas, under-cities.        |
| Realm Interface          | Rifts, leylines, portals, echo zones, breach sites, world scars.                          | Void scar, spirit crossing, ancient gate network.  |

# 8. Seed Derivation and Generation Identity

Each domain receives a deterministic derived seed created from the world seed plus stable namespace and identity inputs. Exact implementation is owned by the current technical plan, but the content contract must preserve isolation and reproducibility.

| **Seed Scope**     | **Recommended Inputs**                               | **Must Control**                                                                   |
|--------------------|------------------------------------------------------|------------------------------------------------------------------------------------|
| World Identity     | world_seed + world_profile_id + generation_version   | Realm network, world name options, global history parameters, calendar offsets.    |
| Realm              | world_seed + realm_definition_id                     | Realm terrain, region graph, anchor distribution, native content selection.        |
| Macro-Region       | realm_seed + macro_coordinate or region_guid         | Climate basin, terrain family, dominant history, cultural and danger weighting.    |
| Region             | macro_seed + region_index                            | Biome mosaic, routes, settlements, resource fields, dungeon and boss eligibility.  |
| Site               | region_seed + site_slot + site_family_id             | Structure variant, layout grammar, occupants, loot families, state, local history. |
| Encounter/Ecology  | region_seed + ecology_cell + time band               | Population baselines, migrations, nests, ambient spawns, variant chances.          |
| Cosmetic Variation | definition_id + location + state + variation_channel | Material, age, culture, weathering, magic, corruption, damage variation.           |

## 8.1 Stable Generation Identity

- Generated regions, settlements, unique structures, portals, major dungeons, bosses, and named NPCs receive persistent runtime IDs.

- Coordinate alone is not sufficient identity for moving, restored, conquered, or cross-realm entities.

- Generation records store the definition IDs and seed/version inputs required to explain how an instance was created.

- Aliases and deprecation maps preserve save compatibility when definitions are renamed.

- A content hash identifies which atlas and registry set produced a world.

# 9. World Generation and Content Assembly Pipeline

World generation should be staged. Each stage consumes stable outputs from earlier stages and emits validation data. This makes errors visible and allows repair passes without turning generation into an opaque monolith.

| **Stage**                         | **Primary Work**                                                                                                    | **Key Validation**                                                               |
|-----------------------------------|---------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------|
| 1\. World Profile                 | Resolve size, density, threat, magic, civilisation, biome, realm, and accessibility settings.                       | Profile is internally compatible and required content packs are present.         |
| 2\. Realm Network                 | Select enabled realms, derive seeds, generate access relationships and latent breach possibilities.                 | No circular dependency blocks all access; optional realms are clearly marked.    |
| 3\. Macro Terrain                 | Generate landmasses, ocean basins, elevation, plate-like forms, sky/deep topology.                                  | Playable land/water distribution and route possibilities exist.                  |
| 4\. Climate and Hydrology         | Temperature, moisture, wind, rain shadows, rivers, lakes, coasts, currents, aquifers.                               | Rivers have sources/outlets; climates form plausible transitions.                |
| 5\. Geological and Magical Fields | Rock strata, ores, large deposits, faults, leylines, mana density, corruption susceptibility.                       | Resource and magic distribution supports progression alternatives.               |
| 6\. Procedural History            | Generate ages, civilisations, migrations, wars, disasters, ruins, abandoned routes, claims, myths.                  | History events reference valid peoples, places, and causes.                      |
| 7\. Regions and Biome Mosaics     | Partition macro terrain, assign region identity, choose biome families and transitions.                             | Adjacency, climate, terrain, and realm-law constraints pass.                     |
| 8\. Civilisation and Territory    | Place cultural homelands, diasporas, settlements, faction territories, borders, roads, trade and pilgrimage routes. | Settlements have water/resources/access; territory is not impossibly fragmented. |
| 9\. Structures and Dungeons       | Place POIs, ruins, shrines, camps, mines, dungeons, wonders, portals, megadungeon entrances.                        | Density, uniqueness, history, progression, and spatial constraints pass.         |
| 10\. Ecology and Threats          | Build food webs, populations, nests, faction pressure, boss territories, migration routes, invasives.               | Habitats and prey/resources support resident populations.                        |
| 11\. Progression Repair           | Check survival, discovery, tool/resource paths, settlement access, portal paths, and alternative progression.       | No seed is soft-locked by missing categories or unreachable anchors.             |
| 12\. Local Detail                 | Generate voxel palettes, vegetation, micro-structures, loot seeds, ambient life, visual clues.                      | Local detail reflects region, history, culture, state, and performance budgets.  |
| 13\. Runtime Initial State        | Create initial regional summaries, settlement records, populations, faction relations, dormant events, world facts. | Persistent IDs and source definitions are valid and saveable.                    |

# 10. Procedural History and Archaeology

A generated world should have causes. Procedural history explains why roads lead nowhere, why a dungeon is buried, why two cultures dispute a shrine, why a monster species is invasive, why a portal was sealed, and why an abandoned city uses architecture different from its current occupiers.

## 10.1 Historical Layer Model

| **Layer**             | **Purpose**                                                                               | **Possible Evidence**                                                            |
|-----------------------|-------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------|
| Primordial            | Establish geology, realm fractures, ancient beings, original leylines, world-scale scars. | Titan remains, impossible strata, primordial shrines, shattered moons.           |
| Precursor/Ancient     | Create old civilisations, machine networks, sealed realms, lost languages, world wonders. | Buried cities, portal grids, ancient roads, relic industries.                    |
| Intermediate Kingdoms | Generate expansions, trade networks, wars, cultural mixing, colonisation, collapse.       | Border forts, hybrid architecture, battlefield ruins, disputed tombs.            |
| Recent History        | Explain current settlements, migrations, disasters, faction borders, abandoned sites.     | Refugee villages, burned farms, broken bridges, fresh graves.                    |
| Living Timeline       | Record everything caused during play.                                                     | Conquests, restored routes, slain or allied bosses, new cities, cleansed biomes. |

## 10.2 Historical Event Families

| **Event Family**                  | **Atlas Effects**                                                                        | **World Evidence**                                                       |
|-----------------------------------|------------------------------------------------------------------------------------------|--------------------------------------------------------------------------|
| Migration or Diaspora             | Culture distribution, language mixing, settlement founding, territorial claims.          | Roadside shrines, mixed foods, displaced architecture, family histories. |
| War or Occupation                 | Fortifications, ruins, borders, faction hostility, captured structures, boss awakenings. | Siege damage, graves, banners, weapon caches, rebuilt walls.             |
| Trade Boom or Collapse            | Road quality, market settlements, resource depletion, abandoned warehouses.              | Caravanserais, coin hoards, toll bridges, derelict ports.                |
| Magical Catastrophe               | Corruption, realm leaks, altered ecology, forbidden ruins, magical weather.              | Crystal scars, warped species, sealed towers, cleansing cults.           |
| Ecological Shift                  | Species migration, famine, overgrowth, desertification, invasive creatures.              | Empty villages, predator nests, reclaimed roads, changed farming.        |
| Religious or Philosophical Schism | New factions, shrine ownership, pilgrimage routes, laws, relic disputes.                 | Defaced icons, rival temples, contested holy dungeons.                   |
| Machine Awakening or Failure      | Automation ruins, construct societies, pollution, new resources and threats.             | Dormant factories, moving structures, logic storms, scrap fields.        |

| **History Truth Rule**                                                                                                                                                                                   |
|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| The Atlas stores an internal generated truth, but cultures and factions may possess incomplete, biased, mythical, or deliberately false interpretations. Codex entries distinguish evidence from belief. |

# 11. Atlas Relationship Graph

The Atlas should be representable as a graph. Entries are nodes; typed links describe how content depends on or affects other content. This allows validation, procedural selection, UI discovery, quest generation, and production planning to share the same relationships.

| **Node Family**       | **Important Outgoing Relationships**                                                                                               |
|-----------------------|------------------------------------------------------------------------------------------------------------------------------------|
| **Realm**             | contains regions; modifies physics; permits biomes; connects portals; influences magic; exports resources; hosts societies.        |
| **Region/Biome**      | contains resources; supports species; permits settlements; weights structures; creates hazards; transforms into states.            |
| **People/Culture**    | prefers regions; builds structures; domesticates creatures; produces goods; speaks languages; joins factions; claims history.      |
| **Faction**           | controls territory; owns structures; trades resources; fights or allies; generates events; employs creatures or constructs.        |
| **Settlement**        | belongs to culture/faction; consumes resources; supports jobs; produces goods; controls routes; faces threats; grows or fails.     |
| **Creature**          | inhabits biomes; hunts prey; fears predators; consumes resources; damages or assists settlements; drops materials; forms variants. |
| **Dungeon/Structure** | belongs to origin/history; occupies terrain; houses factions/creatures; contains resources; unlocks knowledge; changes state.      |
| **Boss**              | controls territory; pressures ecology/factions; guards resources or routes; causes events; has alternatives and aftermath.         |
| **Resource**          | appears in geology/ecology; enables recipes; attracts factions; supports settlements; causes risks; enters trade networks.         |
| **Quest/Event**       | queries world facts; binds stable targets; changes states; records consequences; creates evidence and rumours.                     |

## 11.1 Core Relationship Types

- contains / contained_by

- requires / required_by

- supports / supported_by

- inhabits / habitat_for

- hunts / prey_of

- produces / produced_by

- consumes / consumed_by

- controls / controlled_by

- builds / built_by

- trades_with / trade_route

- fears / threatens

- allies_with / hostile_to / rivals

- guards / unlocks

- corrupts / cleanses

- migrates_to / invades

- transforms_into / restored_as

- believes / disputes / remembers

- spawns_event / resolves_event

## 11.2 Relationship Quality Rules

- Relationships may be required, preferred, possible, forbidden, historical, or runtime-generated.

- Each relationship has scope: local site, biome, region, realm, culture, faction, world, or save instance.

- Weights are not used to bypass hard incompatibilities.

- Circular relationships are valid only when explicitly supported, such as predator-prey cycles or mutual trade.

- Every major content entry should expose enough relationships to justify its presence in the world.

# 12. Content Families, Inheritance, Tags, and Constraints

Parent families allow the Atlas to scale. A specific biome, creature, structure, or dungeon inherits broad rules and overrides only its unique identity. Composition is preferred over copying entire definitions.

| **Data Layer**       | **Role**                                                                                        | **Example**                                                            |
|----------------------|-------------------------------------------------------------------------------------------------|------------------------------------------------------------------------|
| Base Definition      | Universal stable identity, display, tags, rarity, localisation, source pack.                    | BaseBiome, BaseCreature, BaseDungeon.                                  |
| Family               | Shared gameplay and thematic behaviour.                                                         | TemperateForest, BurrowingPredator, AncestralCrypt.                    |
| Variant/Composition  | Regional, cultural, magical, age, state, or difficulty modifiers.                               | Autumn, corrupted, moonlit, dwarven-built, flooded.                    |
| Placement Profile    | Hard constraints, soft preferences, density, spacing, adjacency, uniqueness scope.              | Highland only, prefers river headwaters, one per macro-region.         |
| Relationship Profile | Habitats, prey, owners, resources, events, rivals, unlocks, transformations.                    | Feeds on crystal mites; hunted by local culture; attracts storm event. |
| Runtime State        | Instance-specific damage, population, ownership, activation, discovery, depletion, restoration. | Collapsed, occupied, mapped, cleansed, boss defeated.                  |
| Planning Metadata    | Production status, asset dependencies, review owner, target milestone.                          | Concept, Atlas Ready, Forge Ready, Implemented.                        |

## 12.1 Hard Constraints

- Realm compatibility and physical-law requirements.

- Temperature, moisture, altitude, depth, water, terrain slope, soil, geology, atmosphere, and light requirements.

- Required prey, food, resource, host, settlement, structure, portal, or historical origin.

- Forbidden adjacency, protected zones, sacred law, civilisation safety, or spawn exclusions.

- Minimum and maximum region size, clearance, vertical volume, route access, and performance footprint.

## 12.2 Soft Preferences

- Preferred climate, terrain, magic intensity, corruption level, culture, faction, resource richness, road distance, and danger band.

- Synergy with neighbouring biomes or sub-biomes.

- Narrative contrast, such as safe valleys beside dangerous highlands.

- World uniqueness and repetition cooldown.

- Player-selected world profile and difficulty preferences.

## 12.3 Negative and Exclusion Tags

Negative constraints are first-class data. Examples include no_surface_spawn, excludes_dense_civilisation, incompatible_low_mana, forbidden_sacred_ground, no_ocean, no_underground, unique_per_world, cannot_coexist_with, and requires_unclaimed_territory. Explicit exclusions prevent accidental incoherence and reduce hidden procedural exceptions.

# 13. Region Identity and Biome Mosaic Rules

A region is more than a biome container. It combines terrain, climate, history, culture, magic, ecology, resources, routes, danger, and dynamic states into a recognisable identity. Biomes form mosaics with transition zones rather than isolated patches.

| **Region Component**        | **Required Questions**                                                                                          |
|-----------------------------|-----------------------------------------------------------------------------------------------------------------|
| **Physical Form**           | What is the dominant landform? Where does water flow? What are the vertical layers and travel barriers?         |
| **Climate and Season**      | What temperature, moisture, wind, weather, and seasonal behaviour shape survival and ecology?                   |
| **Biome Mosaic**            | Which core, secondary, rare, transition, and transformed biomes may appear?                                     |
| **Geology and Resources**   | Which strata, deposits, soils, fuels, magical resources, and strategic materials exist?                         |
| **History**                 | Who lived here, what changed, which ruins or claims remain, and what evidence survives?                         |
| **Civilisation**            | Which cultures can settle, which factions claim territory, where are roads, towns, farms, ports, and frontiers? |
| **Ecology**                 | Which producers, prey, predators, scavengers, parasites, magical beings, invasives, and boss pressures exist?   |
| **Structures and Dungeons** | Which site families fit geology, history, culture, danger, and progression?                                     |
| **Dynamic Pressure**        | Which corruption, war, industrialisation, blessing, disaster, migration, or realm-leak states may transform it? |

## 13.1 Biome Adjacency

| **Adjacency Type**      | **Rule**                                                                                           | **Example**                                            |
|-------------------------|----------------------------------------------------------------------------------------------------|--------------------------------------------------------|
| Natural Transition      | Use ecotones, foothills, floodplains, treelines, deltas, rain shadows, or depth gradients.         | Meadow -\> forest edge -\> deep forest.                |
| Geological Transition   | Rock, fault, erosion, altitude, or volcanic history explains the boundary.                         | Highland -\> canyon -\> badland basin.                 |
| Civilisation Transition | Farms, cleared land, roads, walls, irrigation, mining, or wards reshape natural biomes.            | Wild forest -\> managed woodland -\> village farmland. |
| Magical Transition      | Leyline, corruption, blessing, realm leak, ritual, or ancient machine creates a readable boundary. | Marsh -\> luminous mana fen -\> unstable rift scar.    |
| Catastrophic Transition | Fire, flood, war, impact, titan movement, or dimensional collapse creates abrupt scars.            | Grassland -\> glassed battlefield.                     |

## 13.2 Region Naming and Identity

Region names may be generated from geography, culture, faction, history, myth, resource, danger, or discovery. Multiple cultures may use different names for the same region. The Atlas stores an internal region ID, generated canonical fallback name, aliases, language sources, and player-known names.

# 14. Civilisation, Territory, Settlement, and Route Generation

Civilisations should emerge from suitability and history rather than random village scattering. Ancestry, culture, faction, settlement citizenship, language, government, religion, and territory remain separate records. The Atlas combines them when generating societies and local populations.

| **Generation Layer**            | **Atlas Rules**                                                                                                                                                         |
|---------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **People and Culture Presence** | Use homelands, migrations, diaspora, trade, conquest, refugees, colonisation, mixed settlements, and realm travel.                                                      |
| **Settlement Suitability**      | Water, food, shelter, resources, terrain, route access, defence, culture, magic, law, and historical ownership.                                                         |
| **Settlement Type**             | Farmstead, camp, hamlet, village, town, city, capital, fortress, monastery, port, underground hold, sky settlement, realm outpost.                                      |
| **Territory**                   | Core land, frontier, claimed wilderness, disputed border, occupied zone, sacred site, trade corridor, raiding range, ungoverned gap.                                    |
| **Routes**                      | Roads, trails, rivers, sea lanes, sky currents, tunnels, spirit roads, portal routes, pilgrimages, caravan circuits, migration paths.                                   |
| **Population Composition**      | Households, professions, age bands, ancestry, culture, citizenship, visitors, minorities, slaves only if world content and policy explicitly support such dark systems. |
| **Settlement History**          | Founding reason, previous owners, disasters, growth, abandoned districts, renovations, cultural layers, current projects.                                               |

## 14.1 Settlement Generation Must Avoid

- Identical settlement layouts repeated with only palette swaps.

- Treating ancestry as a mandatory culture, profession, alignment, or biome.

- Placing settlements without viable water, food, access, labour, or historical explanation.

- Making every settlement friendly, hostile, or dependent on the player.

- Generating populations without homes, jobs, supplies, relationships, laws, and local risks.

- Using roads only as decoration rather than routes for trade, migration, raids, patrols, rumours, and discovery.

# 15. Ecology, Creature, Monster, and Boss Placement

Ecology is generated at region scale and expressed locally. Creature definitions provide capabilities; Atlas ecology records provide habitat, diet, population, migration, nest, settlement, dungeon, magic, and world-state relationships.

| **Ecological Role**            | **Atlas Requirements**                                                                                         |
|--------------------------------|----------------------------------------------------------------------------------------------------------------|
| **Ambient/Microfauna**         | Habitat clues, sound or visual atmosphere, pollination, decomposition, minor resources, magical indicators.    |
| **Producer/Forage Base**       | Plants, fungi, algae, mana growths, mineral feeders, or artificial energy sources supporting the web.          |
| **Prey and Herd Species**      | Food source, migration, breeding, village pressure, domestication potential, predator support.                 |
| **Predators and Apex Species** | Territory size, prey density, den sites, competition, village conflict, population control.                    |
| **Scavengers/Parasites**       | Carcass, waste, disease, dungeon, settlement, or magical-energy relationships.                                 |
| **Livestock/Work Beasts**      | Culture use, feed, housing, breeding, products, ownership, disease, predators, transport or labour.            |
| **Magical/Construct Ecology**  | Mana, rune, spirit, dream, machine, corruption, or realm-law energy source and environmental effects.          |
| **Intelligent Hostiles**       | Territory, economy, camps, logistics, goals, diplomacy, raids, families or social structure where appropriate. |
| **Dungeon-Adapted Species**    | Origin, isolation, food source, room use, boss relationship, reset or repopulation rules.                      |
| **Boss/Titan Pressure**        | Territory, signs, ecology changes, faction reactions, resource control, event generation, aftermath.           |

## 15.1 Population and Spawn Rules

- Population baselines are regional summaries; visible spawns are local representations of that state.

- Nests, dens, camps, breeding grounds, structures, portals, weather, seasons, corruption, mana, and player activity create local spawn sources.

- Killing creatures can reduce populations, alter food webs, create migration, increase prey, attract scavengers, or trigger faction responses.

- Not every ecology system needs full scientific simulation; changes should be bounded, readable, and gameplay-relevant.

- Rare variants inherit from families and use region, state, age, magic, corruption, weather, and difficulty modifiers.

## 15.2 Boss Placement Contract

| **Boss Scale**           | **Placement Scope**                    | **Required Relationship**                                                                                   |
|--------------------------|----------------------------------------|-------------------------------------------------------------------------------------------------------------|
| Lair Boss                | One site or local cluster.             | Owns or protects a den, nest, mine, ruin, resource, or route.                                               |
| Dungeon Boss             | Dungeon climax or systemic controller. | Connected to dungeon origin, rooms, inhabitants, hazards, and state.                                        |
| Regional Boss            | Multiple biomes or settlements.        | Creates signs, ecology pressure, faction responses, events, and long-term aftermath.                        |
| Wandering/Siege Boss     | Route or event driven.                 | Moves through territories, attacks objectives, can be diverted, tracked, trapped, or bargained with.        |
| Overworld Titan          | Macro-region or world significance.    | Changes climate, terrain, migration, resources, politics, or realm stability.                               |
| Realm Guardian/Sovereign | Realm region or global system.         | May be ruler, protector, prisoner, machine administrator, natural law, or ally rather than automatic enemy. |
| Multi-Realm Threat       | World/realm network.                   | Uses portals, invasions, corruption, history, and coordinated world events.                                 |

# 16. Structures, Dungeons, Wonders, and Megadungeons

Site generation combines terrain suitability, historical origin, culture, faction, resource, route, ecology, magic, danger, rarity, and progression. A structure should be readable before entry and should remain meaningful after discovery.

## 16.1 Structure and Dungeon Origin Taxonomy

| **Origin Family**        | **Examples**                                                                           | **Atlas Consequences**                                                           |
|--------------------------|----------------------------------------------------------------------------------------|----------------------------------------------------------------------------------|
| Natural                  | Cave, sinkhole, giant tree interior, volcanic tube, glacier hollow, leviathan remains. | Geology/ecology determines shape, resources, inhabitants, collapse and flooding. |
| Civilisation             | Home, mine, road, fort, temple, tomb, archive, city district, sewer, palace.           | Culture, law, architecture, history, ownership and restoration matter.           |
| Military                 | Fortress, bunker, siege tunnel, battlefield, watch network, prison.                    | Defence grammar, traps, supply stores, occupation and faction conflict.          |
| Magical/Religious        | Shrine, ritual complex, mage tower, sealed vault, divine trial, leyline station.       | Mana laws, beliefs, promises, curses, wards, relics and alternative resolutions. |
| Industrial/Artificial    | Factory, quarry, machine world node, alchemy plant, automation vault.                  | Power routing, production, pollution, constructs, repair and reactivation.       |
| Biological/Living        | Hive, living dungeon, world-root, parasite colony, dream organism.                     | Growing rooms, lifecycle, ecology, healing, infection or negotiation.            |
| Dimensional/Catastrophic | Breach, folded labyrinth, echo ruin, void fracture, impact site.                       | Unstable topology, realm rules, cross-realm inhabitants and containment.         |

## 16.2 Dungeon State Model

- Dormant, active, occupied, contested, abandoned, partially looted, collapsed, flooded, frozen, burning, cursed, corrupted, mechanically active, reclaimed by nature, conquered, cleansed, restored, claimed, converted, or destroyed.

- State changes alter layout access, inhabitants, hazards, rewards, quests, map symbols, faction value, and regional pressure.

- Reset rules are explicit by family. Important dungeons should normally preserve major changes rather than magically returning to untouched state.

- A cleared dungeon may be reoccupied by a faction, ecology, refugees, researchers, miners, cultists, or the player.

- Megadungeons may contain persistent districts with independent states, entrances, factions, ecology, and progression.

## 16.3 Procedural Grammar

| **Grammar Layer**      | **Controls**                                                                                                             |
|------------------------|--------------------------------------------------------------------------------------------------------------------------|
| **Macro Layout**       | Linear, branching, hub, ring, vertical shaft, network, layered city, moving islands, folded space.                       |
| **Room Families**      | Entrance, transition, combat, social, puzzle, hazard, resource, lore, rest, shortcut, boss, secret, infrastructure.      |
| **Connectivity**       | Locks, keys, power, water level, collapses, rituals, faction permissions, destructible paths, portals, alternate routes. |
| **Thematic Motifs**    | Architecture, materials, symbols, lighting, sound, cultural traces, age, damage, realm laws.                             |
| **Occupation Overlay** | Current inhabitants add camps, barricades, nests, traps, repairs, storage, graffiti, altars, machines, patrols.          |
| **History Overlay**    | Previous builders and events add ruins, blocked districts, remains, relics, records, structural scars.                   |

# 17. Dimensions, Realm Networks, and Dimension Content

Dimensions are persistent connected worlds or bounded realities, not one-biome reward rooms. Major realms use the same Atlas foundation as the Overworld while adding realm-specific laws, topology, ecology, civilisations, resources, dungeons, bosses, routes, and outcomes.

| **Realm Content Layer** | **Major Realm Requirement**                                                                                                          |
|-------------------------|--------------------------------------------------------------------------------------------------------------------------------------|
| **Topology**            | Continental, island, vertical, enclosed, fragmented, networked, folded, oceanic, artificial, or interstitial identity.               |
| **Biome Diversity**     | Normally six or more major biome families for a major realm, with sub-biomes, transitions, rare zones, and transformed states.       |
| **Ecology**             | Native producers, ambient life, prey, predators, magical beings, dungeon species, invasives, migrations, and regional threats.       |
| **Civilisation**        | One or more societies, factions, nomads, constructs, spirits, wild regions, colonial fronts, or deliberate absence of settled life.  |
| **Dungeons**            | Three to six or more major dungeon families over production, using realm physics and history rather than palette swaps.              |
| **Bosses**              | Regional bosses, guardian/sovereign possibilities, dungeon bosses, world events, and at least one realm-scale climax path over time. |
| **Resources**           | Terrain, construction, magic, hazard, creature, cultural, strategic, and export resources with Overworld utility.                    |
| **Infrastructure**      | Portals, anchors, routes, settlements, storage, power, automation compatibility, communication, and emergency return.                |
| **Outcomes**            | Faction, ecology, ruler, portal, industrialisation, corruption, restoration, migration, and cross-realm consequences.                |

## 17.1 Realm Network Generation

- The world seed derives each enabled realm and its anchor network.

- Major realms may exist from world creation but remain unknown or inaccessible until discovered.

- Natural breaches, rituals, ancient gates, faction routes, dreams, divine access, and constructed portals are separate access families.

- Critical realm access uses category-based fallback anchors, not one hardcoded gate.

- Portal routes have ownership, stability, power, security, throughput, discovery, and failure states.

- Optional realms can be disabled by world profile only when dependency validation confirms that no required progression path is lost.

## 17.2 Dimension Dungeon Rule

| **Realm Mechanic Rule**                                                                                                                                                                                                                                  |
|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| A dimension dungeon must use at least one navigation, survival, puzzle, ecology, law, or infrastructure mechanic that would not function identically in an ordinary Overworld dungeon. Different textures alone do not qualify as realm-specific design. |

# 18. Progression Guarantees Without Hardcoded Content

A seed-driven sandbox still requires reliable starts and long-term progression. Guarantees should describe capabilities and categories rather than exact named places. The generator validates the world and repairs missing relationships before the save becomes playable.

| **Guarantee Category** | **Production Rule**                                                                                                                     | **Not Allowed**                                                             |
|------------------------|-----------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------|
| Safe Start Envelope    | Spawn in a survivable region with accessible basic materials, food options, shelter opportunities, escape routes, and readable hazards. | Always spawning beside one fixed village or tutorial ruin.                  |
| Early Tool Path        | At least one valid route to early tools and processing through local materials, salvage, trade, NPC teaching, or alternate recipes.     | Exact ore vein or chest at fixed coordinates.                               |
| Civilisation Discovery | The world provides discoverable signs, routes, travellers, rumours, maps, or settlements within profile-appropriate ranges.             | Mandatory Forest Hamlet placement.                                          |
| Magic Discovery        | At least one category-based path through resources, ruins, NPCs, creatures, books, events, or experimentation.                          | Fixed mana pocket and fixed mage NPC.                                       |
| Automation Discovery   | Copper/iron or equivalent mechanisms, knowledge, components, and power opportunities exist through multiple paths.                      | One scripted mine-to-watchtower chain.                                      |
| Threat and Defence     | Threats arise from ecology, factions, dungeons, events, wealth, corruption, or territory; preparation changes outcomes.                 | Guaranteed goblin raid on a fixed day.                                      |
| Dimension Access       | At least one valid chain of knowledge, anchor, materials, ritual, faction route, boss outcome, or structure restoration.                | One universal portal frame in the starter region.                           |
| Recovery               | Critical content loss has replacement, alternate, migration, restoration, research, or fallback generation rules where appropriate.     | Unrecoverable soft lock because one generated NPC died or structure failed. |

## 18.1 Validation and Repair Strategy

1.  Generate the world normally using content rules.

2.  Run capability queries such as can_start_survival, has_early_tool_path, has_magic_discovery_path, and has_realm_access_chain.

3.  Report missing capability and the exact broken relationship.

4.  Apply the least intrusive repair: adjust weights, add a category-equivalent site, connect a route, expose a clue, enable an alternate recipe, or select a different regional candidate.

5.  Revalidate until the profile’s required capability set passes or generation fails with a precise developer error.

6.  Record repair decisions in generation diagnostics so seed issues can be reproduced.

# 19. Rarity, Density, Uniqueness, and Repetition Control

Large procedural worlds become boring when content repeats too quickly or rare content clusters without meaning. The Atlas defines rarity, spacing, uniqueness scope, motif cooldown, and regional saturation.

| **Control**            | **Purpose**                                                                   | **Example**                                                                     |
|------------------------|-------------------------------------------------------------------------------|---------------------------------------------------------------------------------|
| Spawn/Placement Rarity | Base likelihood after eligibility.                                            | Common cave, rare divine observatory, mythic world-engine fragment.             |
| Density Budget         | Maximum or target count by area and site category.                            | Minor POIs per region, major dungeon per macro-region.                          |
| Minimum Spacing        | Prevents near-duplicates and visual clutter.                                  | Two identical fortress families cannot appear within adjacent regions.          |
| Uniqueness Scope       | Local, region, macro-region, realm, world, culture, faction, or save.         | One world wonder per world; one culture capital per polity.                     |
| Motif Cooldown         | Reduces repeating architecture, puzzle, creature, or boss mechanics.          | Avoid three crypt dungeons in a row even if all are eligible.                   |
| Regional Saturation    | Limits overuse of magic, corruption, ruins, civilisation, or extreme terrain. | High-magic pockets remain special in a normal-fantasy profile.                  |
| Replacement Pool       | Provides compatible alternatives when a candidate is blocked.                 | Choose shrine, ruined observatory, or spirit grove for the same discovery role. |
| Discovery Pacing       | Controls when clues reveal rare sites or bosses.                              | Titan signs appear before the titan is directly encountered.                    |

## 19.1 World Uniqueness versus Guaranteed Content

Required capability does not require identical content. One seed may teach magic through a moonlit shrine, another through an exiled mage, another through a crystal creature migration, and another through a damaged machine archive. The capability is guaranteed; the expression is seed-specific.

# 20. Dynamic World States and Long-Term Transformation

World generation establishes a starting state, not a frozen world. Runtime layers record seasons, civilisation, extraction, ecology, corruption, blessing, war, damage, ownership, restoration, boss pressure, and realm influence. These layers must be queryable by worldgen, events, NPCs, quests, UI, and save systems.

| **State Layer**     | **Examples**                                                                    | **Atlas Consequences**                                               |
|---------------------|---------------------------------------------------------------------------------|----------------------------------------------------------------------|
| Season and Weather  | Snow, flood, drought, monsoon, storm season, magical aurora.                    | Biome appearance, travel, crops, migrations, events, hazards.        |
| Civilisation        | Settled, fortified, urbanised, industrialised, magical, abandoned, occupied.    | Roads, spawns, structures, jobs, trade, law, pollution, safety.      |
| Ecology             | Healthy, overhunted, invasive, predator collapse, migration, domesticated.      | Population, crops, village needs, creature encounters, quests.       |
| Extraction          | Rich, depleted, mined out, mana-drained, polluted, unstable.                    | Resource availability, faction interest, hazards, restoration work.  |
| Corruption/Blessing | Blighted, cursed, void-touched, warded, sacred, cleansed.                       | Blocks, spawns, magic, morale, settlement viability, realm access.   |
| Damage/Disaster     | Burned, flooded, collapsed, besieged, shattered, reclaimed.                     | Structure states, refugees, routes, loot, rebuilding, history.       |
| Faction/Ownership   | Claimed, disputed, conquered, liberated, neutralised, treaty zone.              | Law, patrols, trade, dialogue, raids, flags, architecture.           |
| Boss/Threat         | Dormant, awakened, wounded, migrating, allied, sealed, dead, replaced.          | Regional pressure, ecology, resources, weather, events, progression. |
| Realm Influence     | Breach, overlap, stabilised portal, invasion, sealed border, dimensional bleed. | Biomes, creatures, resources, physics, structures, stories.          |

## 20.1 State Composition and Precedence

Visual and gameplay results may combine several state layers. A winter forest can also be occupied, mana-drained, partially burned, and under a realm breach. The Atlas defines compatible combinations, precedence for conflicting material states, and which systems own each layer. No system should overwrite unrelated evidence merely to display its own state.

# 21. Discovery, Rumours, Names, Maps, and Codex Truth

Procedural content needs strong discovery. Players should learn the world through observation, maps, travellers, signs, tracks, ruins, languages, research, divination, trade, and stories rather than receiving complete generator data.

| **Knowledge Layer** | **Meaning**                                                                                   | **Presentation**                                               |
|---------------------|-----------------------------------------------------------------------------------------------|----------------------------------------------------------------|
| Unknown             | The player has no reliable awareness.                                                         | No map entry, or only environmental signs.                     |
| Rumoured            | A source claims the content exists, but location or truth is uncertain.                       | Approximate region, confidence, source, possible bias.         |
| Sighted             | Player or trusted agent directly observed evidence.                                           | Map silhouette, tracks, distant structure, creature sign.      |
| Located             | The site, route, settlement, boss territory, or portal anchor is mapped.                      | Navigation entry and route planning.                           |
| Studied             | Important properties, inhabitants, hazards, resources, history, or weaknesses are understood. | Expanded Codex and planning information.                       |
| Resolved/Changed    | The player knows the current outcome and historical consequence.                              | State history, faction reaction, restoration or defeat record. |

## 21.1 Objective Truth and Cultural Belief

| **Record Type**           | **Stores**                                                                                                                      |
|---------------------------|---------------------------------------------------------------------------------------------------------------------------------|
| **Developer/Atlas Truth** | Generated origins, actual event links, real entity identity, mechanical rules, unresolved mysteries intentionally left unknown. |
| **Cultural Account**      | What a culture teaches, names, fears, venerates, denies, or misunderstands.                                                     |
| **Faction Claim**         | Political ownership, propaganda, legal narrative, blame, legitimacy, secrecy.                                                   |
| **Witness Rumour**        | Source, reliability, date, region, distortion, personal knowledge.                                                              |
| **Player Codex**          | Evidence and interpretations actually discovered by the player or shared group.                                                 |

## 21.2 Generated Names

Names should be generated through culture, language, geography, history, ownership, creature, resource, and event patterns. The same site may carry an ancient name, local nickname, faction title, scholarly catalogue name, and player label. Stable identity never depends on display text.

# 22. Simulation LOD and Off-Screen World Continuity

Atlas metadata supports the existing layered simulation direction. Distant regions do not need full actors, voxel interactions, or individual AI ticks, but they preserve identity, population, ownership, projects, routes, threats, events, ecology, and history.

| **LOD**                 | **Representation**                                                                                    | **Atlas Data Used**                                                          |
|-------------------------|-------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------|
| L0 - Full Interactive   | Loaded voxel area, actors, detailed AI, combat, construction, visible items and effects.              | Local spawn profiles, site layout, active state, exact entities.             |
| L1 - Reduced Local      | Lower update rates, simplified AI and perception, local task summaries.                               | Population groups, schedules, habitat cells, nearby routes.                  |
| L2 - Chunk/Site Summary | Compact site, settlement, machine, ecology, and dungeon district records.                             | Production, occupancy, damage, resource, nest, route and project state.      |
| L3 - Regional Abstract  | Bounded event rolls and totals for factions, settlements, trade, ecology, bosses, and realm pressure. | Region relationships, event hooks, danger, migration, territory and history. |
| L4 - Dormant Archive    | Persistent identity, last state, wake conditions, critical scheduled events.                          | Unique sites, resolved history, sealed portals, inactive realm areas.        |

## 22.1 Atlas Simulation Profile Fields

- near_sim_priority, far_sim_interval, dormant_conditions, event_budget, population_summary_model, route_summary_model, dungeon_reoccupation_model, boss_pressure_model, realm_inactive_model, catch_up_summary_profile.

- Every generated persistent site records which definition and simulation profile own its off-screen behaviour.

- Promotion reconstructs valid local state from persistent summaries; demotion commits local results before actors are released.

# 23. Saves, Versioning, Regeneration, and Existing-World Safety

A production Atlas must support years of content expansion without casually destroying player worlds. The seed explains untouched base generation; saved deltas and generated-instance records explain discovered or changed content.

| **Concern**            | **Locked Direction**                                                                                                                                        |
|------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **World Manifest**     | Store world seed, world profile, generation version, enabled content packs, registry/content hashes, realms, and migration history.                         |
| **Explored Areas**     | Do not regenerate explored chunks, sites, settlements, NPCs, dungeons, or region identities merely because weights changed.                                 |
| **Ungenerated Areas**  | May use updated content rules according to compatibility policy, producing frontier expansion without rewriting established regions.                        |
| **Retrofit Content**   | New systems may add bounded overlays, discoveries, events, or sites only through explicit validated migration rules and player/world settings.              |
| **Definition Removal** | Preserve original stable IDs and missing-content placeholders; use aliases, deprecation, or conversion rather than silent deletion.                         |
| **Generated History**  | Persistent historical facts and world-state evidence remain stable after save creation unless a migration explicitly transforms them.                       |
| **POC Removal**        | Because POC content is pre-production, remove it before production save compatibility is promised. No migration should perpetuate POC lore into new worlds. |

## 23.1 Generation Versioning

Generation versions are explicit. A world continues using its original base-generation contract for existing areas. Major worldgen changes may create a new generation version for new saves. Compatibility modes can be offered, but the project should not promise that every generation algorithm change produces identical unexplored terrain forever.

# 24. Content Packs, Modding, and Dependency Rules

The Atlas should be content-pack aware from the beginning. Official expansions and data mods can add biome, creature, culture, dungeon, boss, structure, resource, event, or realm families without colliding with core IDs or silently breaking generation.

| **Pack Requirement**   | **Rule**                                                                                                                |
|------------------------|-------------------------------------------------------------------------------------------------------------------------|
| **Namespace**          | Every pack owns a unique namespace for definitions, localisation, assets, and generated IDs.                            |
| **Schema and Version** | Pack declares supported Atlas/registry schema versions and game compatibility.                                          |
| **Dependencies**       | Required packs, optional integrations, load order, and realm/content prerequisites are explicit.                        |
| **Placement Rights**   | Pack declares which families, biomes, realms, histories, or world profiles it may extend or patch.                      |
| **Validation**         | All relationships, references, constraints, weights, assets, localisation, and progression contributions are validated. |
| **Removal Safety**     | Missing definitions preserve placeholders and source IDs; saves warn before destructive removal.                        |
| **Multiplayer Hash**   | World and clients agree on enabled content and hashes before authoritative play.                                        |
| **Security Boundary**  | Data-driven extension first; scripting remains constrained and permission-aware in later technical design.              |

## 24.1 Additive Content Policy

New content should normally extend pools and relationships rather than directly overriding unrelated core definitions. Explicit patches are allowed only when declared. Invisible last-file-wins behaviour is not acceptable for world generation, progression guarantees, or save-critical content.

# 25. Content Budgets and Minimum Completeness Contracts

Targets prevent empty biomes, shallow dimensions, isolated cultures, and bosses with no world role. They are production ranges, not rigid quotas. Content may ship below a target only when the missing depth is an intentional scope decision rather than an overlooked dependency.

| **Content Package**              | **Target Completeness Contract**                                                                                                                                                                                                                                       |
|----------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Major Overworld Biome Family** | 3-6 sub-biomes; transition rules; 6-12 ordinary creature families over time; 2-4 unusual/magical families; resources; structures; 2-4 dungeon/lair families; settlement suitability; seasonal and transformed states; regional boss possibilities.                     |
| **Macro-Region Family**          | Several biome families; terrain/hydrology identity; history pools; culture/faction suitability; routes; major landmarks; resource strategy; ecology; event pressures; at least one distinctive threat or wonder path.                                                  |
| **Major Dimension**              | 6+ major biome families; transitions and hidden layers; multiple societies or deliberate wild-realm design; 12-25 creature families over time; 3-6 dungeon families; regional bosses; realm guardian/sovereign paths; resources; infrastructure; cross-realm outcomes. |
| **Culture**                      | Language/name rules; architecture; settlement types; food; clothing; laws; religion/philosophy; magic/technology attitudes; professions; trade; creature relationships; historical variants; factions; migration and realm ties.                                       |
| **Creature Family**              | Habitat, diet, lifecycle, senses, movement, social behaviour, nest/den, ecology links, village/automation interaction, resources, variants, discovery clues, population and state rules.                                                                               |
| **Dungeon Family**               | Origin, region/realm eligibility, macro grammar, room families, hazards, puzzles, inhabitants, state model, loot, history evidence, boss possibilities, alternate resolutions, reoccupation/restoration rules.                                                         |
| **Regional Boss**                | Territory, signs, ecology/faction pressure, mechanics, preparation routes, non-combat alternatives where suitable, rewards, aftermath, recurrence/replacement rule, event and Codex hooks.                                                                             |

## 25.1 Production Status Gates

| **Status**               | **Minimum Meaning**                                                                                           |
|--------------------------|---------------------------------------------------------------------------------------------------------------|
| **Concept**              | Name, purpose, core fantasy, rough connections.                                                               |
| **Atlas Draft**          | Relationships, placement, origin, role, states, dependencies, target document identified.                     |
| **Atlas Ready**          | Validated cross-links, content contract met or exceptions approved, no unresolved foundational contradiction. |
| **Registry Ready**       | Stable IDs, fields, tags, parent families, balance placeholders, localisation keys prepared.                  |
| **Forge Ready**          | Model, texture, animation, socket, VFX, audio, icon, and structure-piece requirements specified.              |
| **Implementation Ready** | Runtime behaviour, generation, save, LOD, UI, test, and performance requirements accepted.                    |
| **Active Production**    | Assets/data/code in progress with dependency tracking.                                                        |
| **Validated**            | In-engine test, procedural placement, save/load, state change, and integration pass.                          |
| **Deprecated/Archived**  | Removed from active pools with aliases, migration or test-only handling.                                      |

# 26. Atlas Authoring and Production Workflow

7.  Define the content fantasy and player-facing purpose.

8.  Choose the authoritative registry family and parent definitions.

9.  Define topology, habitat, culture, history, structure, resource, event, and progression relationships.

10. Add hard constraints, soft preferences, negative constraints, density, rarity, spacing, uniqueness, and world-profile behaviour.

11. Define dynamic states, transformation paths, persistence, LOD, and off-screen simulation requirements.

12. Specify discovery clues, names, rumours, cultural beliefs, map and Codex behaviour.

13. Identify dependencies on blocks, items, recipes, NPCs, magic, automation, combat, quests, UI, Forge assets, and implementation systems.

14. Run cross-link and seed-placement validation.

15. Promote the entry through Atlas Ready, Registry Ready, Forge Ready, Implementation Ready, and Validated gates.

16. Record deprecation or migration decisions rather than deleting identity silently.

## 26.1 Recommended Authoring Order

| **Order** | **Content Focus**                                                       | **Reason**                                                                        |
|-----------|-------------------------------------------------------------------------|-----------------------------------------------------------------------------------|
| 1         | Atlas foundations, world profiles, topology, tags, relationship schema. | All later content depends on shared rules.                                        |
| 2         | Overworld and realm biome families.                                     | Biomes establish habitats, resources, structures, travel and culture suitability. |
| 3         | Peoples, cultures, factions and settlement archetypes.                  | Civilisation content must belong to environments and histories.                   |
| 4         | Ecology and creature families.                                          | Food webs and threats depend on biome and civilisation context.                   |
| 5         | Structures, dungeons and routes.                                        | Sites combine terrain, culture, history, ecology and progression.                 |
| 6         | Bosses, titans and major threats.                                       | Bosses require territories, signs, factions, ecology and sites.                   |
| 7         | Resources, loot, relics and trade webs.                                 | Rewards connect content to crafting, villages, magic and automation.              |
| 8         | History, story arcs, events and dynamic transformations.                | Events can then reference stable world content relationships.                     |
| 9         | Master cross-link matrix and production roadmap.                        | Finalises scope, dependencies, budgets and implementation sequence.               |

# 27. Validation, Testing, Debugging, and Seed QA

Procedural quality cannot be judged from one favourite seed. The Atlas requires automated distribution checks, deterministic tests, visual map reviews, gameplay validation, and long-running simulation tests across a representative seed corpus.

| **Validation Layer**      | **Required Checks**                                                                                                                             |
|---------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------|
| **Schema and Reference**  | Unique IDs, required fields, parent resolution, aliases, localisation, valid relationships, no forbidden circular dependencies.                 |
| **Placement Eligibility** | Hard constraints, negative constraints, terrain fit, clearances, route access, realm law, habitat and history compatibility.                    |
| **Distribution**          | Counts, density, spacing, rarity, uniqueness, motif repetition, biome proportions, civilisation and threat distribution.                        |
| **Progression**           | Start survival, early tools, food, shelter, magic discovery, automation route, civilisation access, dungeon/realm paths, recovery alternatives. |
| **Ecology**               | Producers/prey/predators, population viability, nest sources, migrations, settlement pressure, boss territory, invasive bounds.                 |
| **Civilisation**          | Settlement viability, population/jobs/housing, routes, resources, law, territory connectivity, faction relationships.                           |
| **Dungeons and Bosses**   | Reachability, layout validity, state transitions, inhabitants, reward links, aftermath, no impossible lock combinations.                        |
| **Persistence**           | Seed reproducibility, stable IDs, save/load, explored-area safety, migration, missing content, dynamic-state preservation.                      |
| **Performance**           | Generation time, memory, chunk/site budgets, actor promotion, LOD, event processing, registry scale.                                            |
| **Presentation**          | Map readability, silhouette, landmarks, visual transitions, clues, naming, Codex and rumour consistency.                                        |

## 27.1 Required Seed Test Sets

- Golden deterministic seeds used for regression comparison.

- Random broad-distribution seed batches measured statistically.

- Adversarial seeds near constraint boundaries.

- Minimal-content-pack seeds and maximal-content-pack seeds.

- Small, medium, large, infinite/frontier, civilisation-dense, wilderness, low-magic, high-magic, peaceful, and harsh world profiles.

- Long-running simulated worlds used to test migration, faction change, ecology, settlement growth, dungeon reoccupation, boss pressure, and realm events.

## 27.2 Debug Views

- Region, climate, biome, hydrology, geology, resource, leyline, corruption, civilisation, territory, route, structure, dungeon, ecology, boss, event, and progression-capability overlays.

- Generation trace showing why a candidate passed, failed, was replaced, or triggered repair.

- Relationship inspector for any Atlas entry or generated instance.

- World manifest and content-hash viewer.

- Seed comparison and distribution dashboard.

- POC-content detector that fails production validation if retired IDs or names enter shipping pools.

# 28. Cross-Document Requirements and Update Plan

Document Set 24 will reveal assumptions in earlier documents that must be revised. Updates should distinguish system mechanics that remain valid from POC-specific examples, scopes, and registries that must be retired.

| **Document**                       | **Required Update After Atlas Foundation**                                                                                                                |
|------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------|
| **00 Master Bible**                | Add post-POC production phase and Atlas authority; remove POC as active target while preserving historical project record.                                |
| **01 Core Gameplay Loop**          | Replace fixed POC loop section with seed-adaptive new-world onboarding, alternative progression paths, and category-based guarantees.                     |
| **02 Progression**                 | Remove POC milestones as current scope; connect progression to Atlas capability queries and alternative world paths.                                      |
| **03-06 Registries and Resources** | Expand biome, culture, creature, dungeon, boss, and realm references; remove POC planning tags from production entries.                                   |
| **07 NPC Village**                 | Replace fixed village roster with generated population templates, culture settlement profiles, regional histories, and post-POC production scope.         |
| **08-09 Automation and Magic**     | Remove fixed watchtower/mana-furnace proof scenario; add Atlas placement, region consequence, realm, culture, and site integration.                       |
| **10 Creatures**                   | Expand registry through 24F/24H; archive POC creatures or convert reusable families; add food webs, regional populations and boss links.                  |
| **11 Worldgen**                    | Major post-POC rewrite: remove controlled valley and hardcoded relation graph; adopt 24A pipeline, history, topology, validation and repair.              |
| **12 Structures**                  | Expand dungeon, wonder, mobile, megadungeon, realm-site and state rules through 24G/24I.                                                                  |
| **13 Civilisations**               | Expand cultures, factions, settlements, migration, historical generation and realm relationships through 24E.                                             |
| **14 Dimensions**                  | Expand each realm into multi-biome content with dungeon, ecology, boss and persistent outcome contracts through 24D.                                      |
| **15 Quests/Events**               | Use Atlas query modules for generated history, region states, dungeon states, bosses, realm events and rumours.                                           |
| **16 Combat/Defence**              | Add boss scale, siege threats, titan interaction, dungeon hazards, realm combat laws and non-combat resolution support.                                   |
| **17 UI/UX**                       | Add Atlas map layers, rumours, confidence, regional history, multi-name sites, realm maps and procedural discovery presentation.                          |
| **18 Technical Plan**              | Rewrite for Godot/Summer Engine and post-POC architecture; retain stable IDs, registries, deterministic generation, LOD, saves and validation principles. |

# 29. Example Seed-Derived Region Assembly

The following is a non-canonical illustrative generation trace. It demonstrates how Atlas layers create a coherent region without hardcoding a final-game location.

| **Generation Layer**     | **Example Result**                                                                                                                                                                    |
|--------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **World Profile**        | Large living world; normal civilisation; high biome diversity; moderate magic; normal threat; all major realm families enabled.                                                       |
| **Macro Terrain**        | Rain-shadow highland basin beside a navigable river cutting through an older volcanic plateau.                                                                                        |
| **Climate/Hydrology**    | Cool wet western slopes, dry eastern grassland, seasonal flooding in the central basin, geothermal springs near faults.                                                               |
| **Geology/Magic**        | Iron-rich metamorphic ridges, clay floodplain, weak leyline crossing, deep sealed realm fracture beneath the plateau.                                                                 |
| **Ancient History**      | A precursor transit complex was built around the fracture, then abandoned after a containment failure.                                                                                |
| **Intermediate History** | A mountain culture mined the western ridge; a later pastoral confederacy occupied the basin and reused parts of the old road.                                                         |
| **Recent History**       | A border war destroyed the main bridge, splitting trade and leaving two fortified settlements with competing claims.                                                                  |
| **Biome Mosaic**         | Cloud forest slopes, alpine meadow, river fen, dry steppe, geothermal grove, crystal fault scar, abandoned terraced farmland.                                                         |
| **Civilisation**         | Mixed mining town in the west, mobile pastoral camps in the east, refugee farmstead clusters, disputed shrine district.                                                               |
| **Routes**               | Damaged stone road, seasonal ford, mountain tunnel, caravan detour, sealed precursor gate, predator migration corridor.                                                               |
| **Ecology**              | Mountain grazers, steppe herd animals, cliff predators, carrion moths, geothermal elementals, fracture-born scavengers.                                                               |
| **Dungeons**             | Collapsed mine complex, flooded border fort, precursor transit labyrinth, geothermal spirit grotto, living predator lair.                                                             |
| **Regional Boss**        | A wounded fault titan whose movement causes tremors, opens ore seams, redirects springs, and destabilises the sealed fracture.                                                        |
| **Possible Outcomes**    | Kill, heal, bind, relocate, ally with, or exploit the titan; repair or militarise the bridge; reopen or permanently seal the precursor route; reconcile or intensify cultural claims. |

This example contains no guaranteed final lore. Another seed may produce entirely different cultures, geology, dungeons, ecology, boss roles, history, routes, and realm relationships while still satisfying the same capability and completeness rules.

# 30. Balancing and Design Rules

| **Rule**                            | **Direction**                                                                                                                                              |
|-------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Coherence Before Novelty**        | A surprising combination is valuable only when its geography, magic, history, culture, ecology, or catastrophe explains it.                                |
| **Capability Before Exact Content** | Guarantee player capabilities and alternative paths, not one named site, creature, NPC, or structure.                                                      |
| **World Absence Is Valuable**       | Not every seed needs every optional entry. Scarcity and absence create world identity, trade, exploration, and replayability.                              |
| **No Empty Spectacle**              | Large biomes, dimensions, dungeons, and bosses require ecosystem, resource, civilisation, event, and aftermath connections.                                |
| **Readable Causality**              | Players should see signs of danger, history, ownership, magic, ecology, and transformation before or after major events.                                   |
| **Bounded Simulation**              | The world may be deep without simulating every detail continuously. Use regional summaries and meaningful state changes.                                   |
| **Respect Player Construction**     | World events and dynamic systems must not casually erase major player builds without warnings, settings, counterplay, and recovery.                        |
| **Old Content Remains Useful**      | Earlier materials, regions, creatures, settlements, and dungeons can gain new relationships through trade, events, restoration, realms, and later systems. |
| **Culture Is Not Species**          | Ancestry never automatically determines culture, morality, government, profession, biome, or faction.                                                      |
| **Bosses Are World Actors**         | Bosses should have roles, signs, alternatives, consequences, and persistent aftermath rather than being large isolated health bars.                        |
| **Dimensions Are Worlds**           | Major realms require multiple biomes, routes, ecology, societies or deliberate wild design, dungeons, resources, bosses, and outcomes.                     |
| **No Hidden Hardcoding**            | Production validation must identify fixed coordinates, POC names, one-off relation graphs, and special-case seed checks.                                   |

# 31. Open Questions for Later Atlas Documents

The following questions are intentionally deferred to the specialised Atlas volumes. [[24A - Foundations, World Topology and Procedural Content Rules]] establishes the framework but does not lock every content roster or launch quantity.

| **Question**                                                                                                               | **Primary Owner**                   |
|----------------------------------------------------------------------------------------------------------------------------|-------------------------------------|
| How many continent and macro-region families should the first production milestone support?                                | 24B/24C and production roadmap.     |
| Which surface, ocean, sky, underground, magical, corrupted, ancient, and hybrid biome families are launch-critical?        | 24B/24C.                            |
| Which major realms are launch, expansion, teaser, or disabled-by-default content?                                          | 24D.                                |
| Which peoples, cultures, factions, languages, religions, and settlement families form the first complete civilisation set? | 24E.                                |
| What creature counts, model-sharing families, regional variants, livestock, mounts, and monster societies are feasible?    | 24F plus Forge production planning. |
| Which dungeon grammars and megadungeon structures are required for initial variety?                                        | 24G.                                |
| Which bosses are fixed authored unique beings versus generated members of a boss family?                                   | 24H.                                |
| Which wonders, roads, ports, realm gates, and world infrastructure need unique assets?                                     | 24I.                                |
| How large should resource, relic, loot, boss-drop, and trade families become before implementation?                        | 24J.                                |
| How deep should generated history, rumours, wars, disasters, archaeology, and event simulation be at each LOD?             | 24K.                                |
| What are the exact registry schemas, asset budgets, content milestones, and implementation sequence?                       | 24L and rewritten technical plan.   |

# Appendix A. POC Retirement Checklist

| **Check**                 | **Acceptance Condition**                                                                                                                                       |
|---------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Production Registries** | No POC-specific settlement, NPC, quest, event, structure, region, or encounter is marked active production solely because it appeared in the proof-of-concept. |
| **Worldgen**              | No generation stage references Forest Hamlet, the POC valley, fixed POC coordinates, or a mandatory relation graph.                                            |
| **NPCs**                  | No fixed POC names or roster are spawned in normal worlds.                                                                                                     |
| **Quests/Events**         | No mandatory watchtower chain or fixed-day goblin raid exists in normal production profiles.                                                                   |
| **Resources/Magic**       | No fixed mana pocket, rune ruin, resource vein, or mage teacher is required by identity; capability alternatives exist.                                        |
| **Structures**            | POC structures are either archived or converted into generic families with new stable IDs and placement rules.                                                 |
| **Testing**               | Any retained regression scenario is developer-only, excluded from shipping pools, and uses test namespace/content.                                             |
| **UI/Codex**              | No POC lore appears as universal canonical world information.                                                                                                  |
| **Saves**                 | Production save compatibility begins after POC removal; no migration promise requires preserving POC world content.                                            |
| **Validation**            | Automated scan fails builds when retired IDs, names, test namespaces, or POC-specific generation hooks enter shipping packages.                                |

# Appendix B. Atlas Stable ID and Tag Conventions

| **Family**    | **Example Pattern**                                                            | **Notes**                                                                   |
|---------------|--------------------------------------------------------------------------------|-----------------------------------------------------------------------------|
| Realm         | realm.verdant_covenant                                                         | Stable definition, not display name.                                        |
| Region Family | region.highland_river_basin                                                    | Generated instance receives separate persistent ID.                         |
| Biome         | biome.overworld.temperate.cloud_forest                                         | Realm and family hierarchy where useful.                                    |
| Culture       | culture.moonroot_court.low_canopy                                              | Culture separate from ancestry/species.                                     |
| Faction       | faction.emberhold.seventh_foundry                                              | Political organisation with runtime state.                                  |
| Settlement    | settlement.archetype.river_port_town                                           | Generated town instance has runtime GUID.                                   |
| Creature      | creature.family.crystal_crawler                                                | Variants compose through tags or variant definitions.                       |
| Dungeon       | dungeon.family.ancestral_mine                                                  | Layout seed and generated site ID stored separately.                        |
| Boss          | boss.family.fault_titan                                                        | Unique individuals may receive authored definition plus runtime ID.         |
| Structure     | structure.family.realm_gate_precursor                                          | Blueprint, state and owner remain separate.                                 |
| Event         | event.family.realm_breach_migration                                            | Definition spawns runtime event instances.                                  |
| Tags          | climate.temperate; terrain.karst; ecology.apex; state.corrupted; rarity.mythic | Hierarchical tags are extensible; enums remain for closed technical states. |

# Appendix C. Atlas Entry Relationship Template

| **Field Group**         | **Required Fields**                                                                                               |
|-------------------------|-------------------------------------------------------------------------------------------------------------------|
| **Identity**            | atlas_id, definition_id, display_name_key, aliases, content_family, source_pack, schema_version, planning_status. |
| **Purpose**             | player_fantasy, world_role, core_hook, provides, threatens, reveals, unlocks, transforms.                         |
| **Topology**            | realm_ids, region_families, biome_families, altitude_depth, terrain, water, climate, route, site requirements.    |
| **Placement**           | hard_constraints, soft_preferences, exclusions, rarity, density, spacing, uniqueness_scope, replacement_pool.     |
| **History**             | origin_families, builder/creator, age bands, historical events, previous owners, claims, myths, evidence.         |
| **Civilisation**        | peoples, cultures, factions, settlements, jobs, laws, trade, religion, architecture, migration.                   |
| **Ecology**             | habitats, food sources, prey, predators, nests, populations, migrations, domestication, invasives, corruption.    |
| **Structures/Dungeons** | site families, room/structure grammar, states, ownership, restoration, reoccupation, boss links.                  |
| **Resources**           | inputs, outputs, drops, harvests, deposits, strategic value, renewability, trade, crafting, risks.                |
| **Magic/Automation**    | mana, leylines, schools, rituals, wards, power, machines, infrastructure, instability, realm law.                 |
| **Threat/Boss**         | danger band, signs, pressure, objectives, alternatives, aftermath, recurrence/replacement, regional effects.      |
| **Discovery**           | environmental clues, rumours, maps, language names, Codex layers, knowledge thresholds, misinformation.           |
| **Dynamic State**       | state machine, compatible layers, transformations, event hooks, visual evidence, persistence, recovery.           |
| **Simulation**          | LOD profile, far-sim variables, wake conditions, event budget, population/site summary, catch-up.                 |
| **Production**          | registry dependencies, block/item/recipe links, Forge assets, UI, audio/VFX, implementation, tests, owner.        |

# Appendix D. Generation Validation Matrix

| **Validation Query**     | **Pass Condition**                                                                                         | **Possible Repair**                                                                    |
|--------------------------|------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------|
| spawn.survivable         | Basic gathering, shelter, food or equivalent, hazard escape, and buildable area exist.                     | Move spawn candidate, adjust local biome, expose resource equivalence, add safe route. |
| progress.early_tools     | At least one accessible material/trade/salvage/teaching route.                                             | Add equivalent resource/site, alternate recipe, traveller or route clue.               |
| progress.magic_discovery | At least one discoverable magic path compatible with profile.                                              | Place category-equivalent ruin/resource/creature/NPC/event in eligible region.         |
| progress.automation      | Mechanism materials, knowledge and power opportunity exist through at least one path.                      | Enable equivalent deposits, trade, salvage, water/wind site, culture teaching.         |
| civilisation.viable      | Profile-required settlement access exists and settlements have water, food, jobs, routes and safety model. | Reposition settlement, connect route, alter suitability, choose different archetype.   |
| ecology.viable           | Major creature populations have habitat and energy/food relationships.                                     | Reduce population, add prey/producer, move nest, select alternative creature.          |
| dungeon.reachable        | Entrances and required routes are valid; no impossible lock combination.                                   | Open alternate entrance, adjust terrain, replace lock module, add clue or tool path.   |
| boss.coherent            | Boss territory, signs, pressure, objective, aftermath and rewards connect to region.                       | Select different boss, add supporting ecology/site/event, lower scope.                 |
| realm.accessible         | At least one valid anchor/access chain when realm is required.                                             | Generate alternate anchor, enable faction/ritual route, restore progression site.      |
| distribution.healthy     | Counts, spacing, rarity and motif cooldown stay within profile ranges.                                     | Reroll candidate slots, replace family, reduce density, move unique content.           |
| poc.absent               | No retired POC IDs, names or shipping generation hooks detected.                                           | Fail build; remove or move content to test-only namespace.                             |

# Appendix E. [[24A - Foundations, World Topology and Procedural Content Rules]] Acceptance Criteria

| **Criterion**           | **Definition of Done**                                                                                                                                            |
|-------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Numbering and Scope** | Document is formally identified as 24A and defines the shared foundation for Document Set 24.                                                                     |
| **POC Retirement**      | Shipping-content removal, reusable-family conversion, and developer-only regression boundaries are explicit.                                                      |
| **Seed Foundation**     | Authored randomness, derived seeds, determinism, identity, and seed-plus-delta principles are defined.                                                            |
| **Topology**            | World, realm, region, biome, site, ocean, sky, underground, deep and realm-interface layers are defined.                                                          |
| **Generation Pipeline** | Staged macro terrain, climate, geology, history, civilisation, structures, ecology, validation and local detail pipeline is defined.                              |
| **Relationships**       | Atlas node families, relationship types, constraints, tags, inheritance, placement and source-of-truth rules are defined.                                         |
| **Content Expansion**   | Biomes, dimensions, creatures, dungeons, dimension dungeons, bosses, civilisations, resources, events and world history are included in the production framework. |
| **Progression Safety**  | Category-based capability guarantees and repair rules replace hardcoded POC content.                                                                              |
| **Persistence**         | Runtime states, LOD, save/versioning, explored-area safety, content packs and migration boundaries are defined.                                                   |
| **Production**          | Content budgets, status gates, authoring order, cross-document updates, QA, debug views and follow-on documents are defined.                                      |
| **Engine Alignment**    | Document remains engine-neutral while acknowledging the current Godot/Summer Engine direction and the need to rewrite outdated technical documentation.           |

**End of [[24A - Foundations, World Topology and Procedural Content Rules]] - World Content Atlas Foundations v0.1**

---
## Navigation
- Next: [[24B - Overworld Regions, Climate and Surface Biomes|24B]]
- Index: [[00 - Document Set 24 Index]]
