---
title: 24L — Content Registry, Cross-Link Matrix, Budgets and Production Roadmap
document_set: 24
document: 24L
aliases:
- 24L
- Document 24L
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
- 24l
---

# 24L — Content Registry, Cross-Link Matrix, Budgets and Production Roadmap

> [!NOTE]
> Obsidian-ready Markdown conversion of the approved Set 24 source document. Source wording and structure have been preserved wherever possible.

**Fantasy Voxel Civilisation Sandbox**

**24L - World Content Atlas: Content Registry, Cross-Link Matrix,  
Budgets and Production Roadmap**

Version 0.1 - Post-POC Production Integration Draft

The master integration volume for Atlas definitions, stable IDs, relationships, completeness contracts, production tiers, validation, migration, implementation sequencing, and the route from planning foundations to a coherent seed-generated game.

| **World Content Integration Statement** A content entry is not production-ready because it has a name, model, texture, or isolated mechanic. It is production-ready when its stable identity, world role, relationships, assets, simulation behaviour, progression use, presentation, fallback rules, validation results, and persistent consequences are all defined and can be selected safely by a world seed. |
|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

| **Field**                    | **Locked Direction**                                                                                                                                                                                                                                                                                  |
|------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Document Scope**           | Final integration volume for Document Set 24. Defines registry ownership, stable IDs, cross-links, completeness contracts, content budgets, production tiers, validation gates, post-POC migration, Godot/Summer Engine implementation order, and the revision roadmap for the main design documents. |
| **Core Philosophy**          | Coherence before quantity. Every major content family must participate in a validated relationship graph rather than exist as an isolated list or decorative asset.                                                                                                                                   |
| **Post-POC Direction**       | All Forest Hamlet names, placements, fixed encounters, mandatory tutorial relationships, and demonstration-only content remain archived. Production registries contain reusable families only.                                                                                                        |
| **Data Direction**           | Immutable definitions use namespaced stable IDs and versioned schemas. Runtime worlds store seed lineage, definition references, generated variants, instance state, provenance, ownership, and migration history.                                                                                    |
| **Production Direction**     | Classify every foundation as Core Production, Early Access, Full Release, Later Expansion, Tooling Research, or Archived. Planning counts do not automatically become shipping commitments.                                                                                                           |
| **Validation Direction**     | Schema, references, semantic links, content completeness, seed generation, progression, performance, accessibility, presentation, save migration, and multiplayer authority all require explicit gates.                                                                                               |
| **Implementation Direction** | Use Godot and Summer Engine with data-driven resources, generated registries, deterministic seed services, validation tools, Forge-produced assets, and staged integration rather than hardcoded world content.                                                                                       |
| **Primary Outcome**          | A buildable production roadmap that converts Documents 24A-24K from rich design foundations into a maintainable, testable, expandable world-content library.                                                                                                                                          |

# Document Purpose

This document closes Document Set 24 by defining how every Atlas volume becomes one coherent production system. Documents 24A-24K establish topology, biomes, realms, peoples, ecology, dungeons, bosses, structures, resources, history, events, and dynamic states. [[24L - Content Registry, Cross-Link Matrix, Budgets and Production Roadmap]] defines the shared registry architecture, cross-link rules, completeness contracts, budgets, status lifecycle, validation pipeline, migration plan, and production sequence that bind those definitions together.

The document is deliberately both creative and technical. It is not executable code, a final balance spreadsheet, or a replacement for Forge, block, item, recipe, NPC, combat, quest, UI, or implementation documents. It tells those systems which content definitions exist, which relationships must be valid, what minimum package each content family needs, how content progresses from concept to shipped status, and how the project avoids returning to hardcoded POC assumptions.

The immediate production consequence is significant: the Atlas is now broad enough that the next major content pass should not begin by adding more disconnected names. It should begin by creating the canonical registry schemas, selecting the first shipping content slice, updating Blocks and Items after Atlas dependencies are known, and implementing automated validation before large-scale asset production.

# Design Source and Supersession Rules

| **Source**                                  | **Authority Used by 24L**                                                                                                                                                                                        |
|---------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **00-02 Vision, Loop, and Progression**     | Preserve the survival, civilisation, automation, magic, RPG, exploration, and player-freedom pillars. Progression remains multi-track and seed-adaptive.                                                         |
| **03-06 Blocks, Items, Recipes, Resources** | Provide physical forms, inventory definitions, transformations, and progression. These registries require a major Atlas-aligned expansion after the content classification pass.                                 |
| **07-09 NPC, Automation, and Magic**        | Execute social simulation, production networks, mana infrastructure, settlement support, permission, risk, and specialised labour attached to Atlas content.                                                     |
| **10-17 Creatures through UI/UX**           | Own detailed system behaviour and presentation. Atlas definitions reference their capabilities without duplicating their implementation rules.                                                                   |
| **18 Technical Implementation Plan**        | The older Unreal-specific plan is superseded in engine choice. Its stable-ID, data, persistence, LOD, validation, authority, and testing principles remain useful and must be rewritten for Godot/Summer Engine. |
| **24A-24K World Content Atlas**             | Primary source for all world-content families, relationship contracts, registries, completeness rules, and post-POC production direction.                                                                        |
| **Forge, Audio, and VFX Document Sets**     | Own creation workflows and detailed asset schemas. 24L defines required attachment points, production status, asset manifests, and validation handoffs.                                                          |

| **Supersession Rule** When an older document requires a named POC character, location, biome, structure, raid, quest, reward, resource chain, dungeon, boss, or portal arrangement, archive the named content and retain only reusable mechanics. No production definition may depend on a POC ID, coordinate, sequence, or guaranteed relationship. |
|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

# Static Table of Contents

1\. Locked Content Registry and Production Integration Identity

2\. Post-POC Production Decisions

3\. Authority, Ownership, and Source-of-Truth Rules

4\. Document Set 24 Completion Map

5\. Registry Taxonomy and Content Domains

6\. Stable IDs, Namespaces, Aliases, and Localisation Keys

7\. Definitions, Parents, Variants, Generated Instances, and Runtime States

8\. Universal Atlas Metadata and Provenance

9\. Relationship Graph and Cross-Link Architecture

10\. Relationship Types, Cardinality, Direction, and Strength

11\. Hard References, Soft References, Queries, and Generated Bindings

12\. Tags, Capability Interfaces, Suitability, and Exclusion

13\. Inheritance, Composition, Regional Variants, and Content Reuse

14\. Content Packs, Dependencies, Overrides, and Mod Boundaries

15\. Master Atlas Registry Inventory

16\. Counted Foundation and Module Summary

17\. Cross-Link Matrix: Atlas Volumes

18\. Cross-Link Matrix: Gameplay Systems

19\. World, Region, Biome, and Special-Environment Package Contract

20\. Dimension and Realm Package Contract

21\. People, Culture, Faction, and Settlement Package Contract

22\. Wildlife, Creature, Monster, and Ecology Package Contract

23\. Dungeon, Ruin, Lair, and Megadungeon Package Contract

24\. Boss, Titan, Siege, and Realm-Guardian Package Contract

25\. Structure, Landmark, Route, Wonder, and Infrastructure Package Contract

26\. Resource, Loot, Relic, Trade, and Material-Ecology Package Contract

27\. History, Story, Event, Rumour, and Dynamic-State Package Contract

28\. Blocks, Items, Recipes, and Resource-Progression Integration

29\. NPC, Settlement, Automation, Magic, Combat, Quest, and UI Integration

30\. Forge, Animation, Audio, VFX, Icon, and Presentation Integration

31\. Universal Completeness Contracts

32\. Production Status Lifecycle

33\. Production Tiers and Shipping Classification

34\. Content Budget Philosophy and Scope Controls

35\. First Production Milestone Content Budget

36\. Early Access and Full Release Content Budgets

37\. Expansion, Mod, and Long-Term Content Budgets

38\. Production Roadmap and Milestone Sequence

39\. Registry Authoring Workflow

40\. AI-Assisted Production, Review, and Human Authority

41\. Validation Architecture and Automated Gates

42\. Schema, Reference, Namespace, and Dependency Validation

43\. Semantic, Relationship, Completeness, and Representation Validation

44\. Seed, Worldgen, Progression, and Fallback Validation

45\. Performance, Simulation LOD, Streaming, and Persistence Budgets

46\. Asset, Variant, Animation, Audio, and VFX Budgets

47\. Localisation, Accessibility, Safety, and Player-Trust Requirements

48\. Save Versioning, Content Migration, and Removed-Content Recovery

49\. POC Retirement and Legacy Cleanup Plan

50\. Main Document Revision Roadmap

51\. Godot/Summer Engine Implementation Roadmap

52\. Risk Register and Redesign Triggers

53\. Release Gates and Definition of Done

54\. Open Questions for Production Planning

Appendix A. Universal Atlas Definition Template

Appendix B. Relationship and Capability Type Library

Appendix C. Master Cross-Link Matrix

Appendix D. Production Status and Gate Checklist

Appendix E. Example Content-Pack Manifest

Appendix F. Atlas Set 24 Acceptance Criteria

# 1. Locked Content Registry and Production Integration Identity

[[24L - Content Registry, Cross-Link Matrix, Budgets and Production Roadmap]] is the integration, production-control, and content-governance layer of the World Content Atlas. It converts hundreds of authored foundations into a graph that world generation, simulation, progression, presentation, and tooling can safely consume. The registry is not a giant flat list. It is a set of versioned definition domains joined through explicit capabilities, suitability queries, ownership rules, and validated relationships.

| **Locked Rule** No major content entry may move to Integrated or Release Candidate status while its required relationships are missing, contradictory, POC-bound, unvalidated, or represented only by placeholder prose. Content quantity never overrides coherence, accessibility, player choice, data safety, or world-generation reliability. |
|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

| **Identity Layer**        | **Design Meaning**                                                                                                  | **Production Result**                                                                             |
|---------------------------|---------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------|
| **Canonical Registry**    | Every authored definition has a stable identity, owner document, schema, namespace, status, and source pack.        | Tools, saves, mods, localisation, and systems resolve the same content without duplicate truth.   |
| **Relationship Graph**    | Definitions declare what they require, support, exclude, produce, threaten, inhabit, control, transform, or unlock. | World generation selects coherent packages instead of assembling random isolated entries.         |
| **Completeness Contract** | Each content family has minimum ecology, economy, progression, presentation, and state requirements.                | Biomes, dimensions, cultures, dungeons, and bosses cannot ship empty or disconnected.             |
| **Production Lifecycle**  | Concepts pass through design, data, prototype, asset, integration, validation, and release gates.                   | The team can see what is genuinely playable rather than mistaking planning volume for completion. |
| **Budget and Roadmap**    | Content targets are grouped by milestone, reusable kits, and dependency order.                                      | Scope grows deliberately without overwhelming implementation or asset production.                 |
| **Validation and Trust**  | Automated and human checks cover data, seeds, gameplay, representation, accessibility, performance, and saves.      | Players receive coherent worlds and updates without silent breakage or manipulative design.       |

## 1.1 What This Registry Is Not

- It is not a promise that every foundation listed in 24A-24K ships in the first public build.

- It is not a replacement for detailed block, item, recipe, combat, AI, quest, UI, Forge, audio, VFX, or code schemas.

- It is not a single spreadsheet that owns all truth; it defines canonical domains that may be edited through specialised tools and exported into validated runtime data.

- It is not permission to generate incoherent combinations merely because individual tags match.

- It is not a return to fixed tutorial content, fixed coordinates, mandatory villages, or hardcoded story sequences.

# 2. Post-POC Production Decisions

| **Area**                     | **Locked Production Decision**                                                                                                                                                                           |
|------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **POC Status**               | The proof of concept is complete and archived. Its content identities are not production canon and must not remain active registry dependencies.                                                         |
| **World Generation**         | All normal worlds derive placements, histories, ecologies, societies, structures, resources, dungeons, bosses, and realm links from seed plus enabled content packs.                                     |
| **Content Creation**         | Prioritise complete relationship packages over isolated roster expansion. A smaller connected content slice is more valuable than hundreds of unintegrated names.                                        |
| **Registry Strategy**        | Use separate domain registries with shared ID, tag, capability, relationship, status, and validation contracts.                                                                                          |
| **Shipping Scope**           | Classify foundations by milestone. Core Production proves the complete final-game identity without requiring the entire Atlas inventory.                                                                 |
| **Asset Strategy**           | Use reusable culture kits, material families, creature body plans, structure grammars, animation sets, effects, and sound families while protecting signature identities.                                |
| **Block and Item Expansion** | Perform the planned major Blocks and Items revision after Atlas priorities are classified, because biome, culture, realm, creature, dungeon, boss, structure, and resource dependencies are now visible. |
| **Engine Direction**         | Rewrite technical implementation for Godot/Summer Engine; do not carry forward Unreal-specific module or asset assumptions.                                                                              |
| **Testing Direction**        | Build automated registry and seed validators before scaling production content.                                                                                                                          |
| **Player Freedom**           | Every content package supports multiple approaches where appropriate: combat, trade, restoration, avoidance, negotiation, automation, settlement support, research, or non-lethal resolution.            |

# 3. Authority, Ownership, and Source-of-Truth Rules

Each field must have one canonical owner. Other documents and tools may reference, extend, or present the field, but should not silently redefine it. This prevents ancestry, culture, faction, settlement, creature, dungeon, boss, item, and story data from drifting into contradictory copies.

| **Concern**                                       | **Canonical Owner** | **24L Integration Rule**                                                                                                                                      |
|---------------------------------------------------|---------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **World topology and generation hierarchy**       | 24A-24D             | References region, biome, layer, realm, route, and site capabilities; does not duplicate noise, terrain, or placement algorithms.                             |
| **People, culture, faction, settlement identity** | 24E                 | Other content stores stable references and relationship roles, never ancestry-based assumptions.                                                              |
| **Creature and ecology identity**                 | 24F                 | Combat or item systems attach behaviours and drops to creature IDs; they do not rename or reclassify personhood.                                              |
| **Dungeons and site grammar**                     | 24G                 | Structures and quests reference site definitions, room sockets, states, ownership, and outcomes.                                                              |
| **Bosses and major threats**                      | 24H                 | Combat owns exact numbers and actions; Atlas owns identity, role, territory, outcomes, aftermath, and recurrence.                                             |
| **Structures, routes, and wonders**               | 24I                 | Blocks and blueprints realise the physical form; Atlas owns function, placement, history, ownership, connections, and states.                                 |
| **Resources, loot, relics, and trade**            | 24J                 | Blocks/items/recipes own physical and transformation data; Atlas owns material ecology, provenance, scarcity, distribution, social value, and reward context. |
| **History, arcs, events, and dynamic states**     | 24K                 | Quest/event runtime executes objectives and timing; Atlas owns authored foundations, suitability, participants, evidence, branches, and aftermath.            |
| **Registry status, IDs, links, budgets, gates**   | 24L                 | This document is canonical for integration policy and production classification.                                                                              |

# 4. Document Set 24 Completion Map

| **Volume** | **Primary Domain**                                                                                          | **Production Handoff**                                                                                             |
|------------|-------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------|
| **24A**    | Atlas foundations, topology, procedural content rules, seed hierarchy, supersession, validation principles. | Defines contracts consumed by every later volume and the technical world manifest.                                 |
| **24B**    | Continents, regions, climate, hydrology, landforms, surface biome registry.                                 | Feeds worldgen, ecology, settlements, structures, resources, dungeons, and regional threat selection.              |
| **24C**    | Oceans, coasts, islands, skylands, underground, special Overworld environments.                             | Feeds vertical worldgen, marine/aerial/subterranean content, special hazards, overlays, routes, and accessibility. |
| **24D**    | Dimensions, realm networks, laws, biomes, portals, realm societies, dungeons, guardians.                    | Feeds realm instances, portal systems, cross-realm ecology, progression, and persistent simulation.                |
| **24E**    | Peoples, cultures, governments, factions, settlements, migration, diplomacy.                                | Feeds NPC identity, architecture kits, economy, reputation, quests, conflict, and civilisation simulation.         |
| **24F**    | Wildlife, monsters, ecology, lifecycle, migration, taming, invasion, disease.                               | Feeds spawning, AI profiles, farming, combat, drops, environment, settlements, dungeons, and bosses.               |
| **24G**    | Dungeons, ruins, lairs, megadungeons, room grammars, hazards, puzzles, states.                              | Feeds procedural site assembly, encounter sockets, loot, history, restoration, claiming, and persistence.          |
| **24H**    | Bosses, titans, siege threats, realm guardians, mechanics, outcomes, aftermath.                             | Feeds combat encounters, territories, world pressure, faction response, loot, events, and world-state change.      |
| **24I**    | Structures, landmarks, routes, wonders, infrastructure, modules, state profiles.                            | Feeds blueprints, block registries, settlement services, navigation, logistics, construction, and restoration.     |
| **24J**    | Resources, material ecology, loot, relics, trade, scarcity, markets, provenance.                            | Feeds Blocks, Items, Recipes, economy, automation, magic, quests, rewards, and settlement needs.                   |
| **24K**    | History, story arcs, events, rumours, evidence, dynamic states, aftermath.                                  | Feeds world history generation, quests, event simulation, Codex, journal, map, and persistence.                    |
| **24L**    | Registry integration, cross-links, budgets, production tiers, validation, migration, roadmap.               | Feeds implementation planning, content tools, production boards, test suites, and release gates.                   |

# 5. Registry Taxonomy and Content Domains

The Atlas uses domain registries rather than one monolithic file. Domain separation keeps schemas readable and allows specialised editors, but every registry implements the same core identity, lifecycle, reference, localisation, source-pack, and validation interfaces.

| **Registry Domain**       | **Examples**                                                                       | **Canonical Prefix**                                            |
|---------------------------|------------------------------------------------------------------------------------|-----------------------------------------------------------------|
| **World and Region**      | World profiles, continents, macro-regions, climate regions, special zones.         | world., region.                                                 |
| **Biome and Environment** | Surface, marine, aerial, underground, special overlays, realm biomes.              | biome., env., overlay.                                          |
| **Realm and Portal**      | Major realms, pocket realms, realm laws, routes, portal families.                  | realm., portal., route.realm.                                   |
| **Civilisation**          | Ancestries, cultures, languages, faiths, governments, factions, settlements.       | ancestry., culture., lang., faith., gov., faction., settlement. |
| **Creature and Ecology**  | Creature families, habitat profiles, nests, migrations, diseases, ecology modules. | creature., ecology., nest., disease.                            |
| **Site and Threat**       | Dungeons, ruins, lairs, room modules, hazards, puzzles, bosses, sieges, titans.    | site., room., hazard., puzzle., boss., siege., titan.           |
| **Structure and Network** | Structures, landmarks, wonders, route families, service modules, states.           | structure., landmark., wonder., route., service.                |
| **Material and Economy**  | Resources, materials, loot grammars, relics, goods, scarcity and market states.    | res., material., loot., relic., goods., market.                 |
| **Narrative and State**   | History incidents, story arcs, events, rumours, state profiles, aftermath modules. | history., arc., event., rumour., state., aftermath.             |
| **Physical Gameplay**     | Blocks, items, recipes, machines, spells, effects, sounds, icons.                  | block., item., recipe., machine., spell., vfx., sfx., icon.     |

# 6. Stable IDs, Namespaces, Aliases, and Localisation Keys

| **Stable-ID Rule** A stable ID identifies a definition, not its display name, location, owner, current state, or generated variant. Renaming presentation never changes the ID. Removing an ID requires an alias, replacement, migration, or explicit tombstone policy. |
|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

| **Element**                 | **Pattern**                                            | **Example**                                         |
|-----------------------------|--------------------------------------------------------|-----------------------------------------------------|
| **Core definition**         | \<namespace\>.\<domain\>.\<family\>.\<name\>           | core.biome.surface.temperate_meadow                 |
| **Realm-scoped definition** | \<namespace\>.\<domain\>.\<realm\>.\<family\>.\<name\> | core.creature.verdant_covenant.predator.thornmane   |
| **Culture variant**         | \<base_id\> + variant profile reference                | core.structure.house.longhall + culture.riverward   |
| **Generated instance**      | Save-scoped ULID or deterministic instance key         | 01J... or world.seed42.site.003182                  |
| **Runtime state**           | Instance ID + state profile + cause record             | site.003182 / state.occupied / faction.ash_covenant |
| **Localisation key**        | loc.\<domain\>.\<id\>.\<field\>                        | loc.biome.temperate_meadow.name                     |
| **Alias**                   | old ID mapped to current ID with version and reason    | poc.structure.watchtower -\> archived tombstone     |
| **Content-pack namespace**  | Reverse-domain or unique project namespace             | leyforge.core, studio.pack_name, mod.author.pack    |

- IDs use lowercase ASCII, periods for hierarchy, and underscores inside tokens.

- Display names, titles, cultural names, rumours, and translations are data, not identifiers.

- Generated worlds store the content-pack manifest and definition hashes required for safe reload and migration.

- POC IDs remain resolvable only in archived test saves or migration tools; normal world generation must exclude them.

# 7. Definitions, Parents, Variants, Generated Instances, and Runtime States

| **Layer**               | **Purpose**                                                                                    | **Mutable?**            | **Example**                                                           |
|-------------------------|------------------------------------------------------------------------------------------------|-------------------------|-----------------------------------------------------------------------|
| **Parent Definition**   | Shared capability, schema, defaults, and validation.                                           | No at runtime           | Base temperate biome, quadruped creature, civic structure.            |
| **Authored Definition** | Named reusable production foundation selected by suitability.                                  | No at runtime           | Autumn oak woodland, archive citadel, river-clan culture.             |
| **Variant Profile**     | Composes regional, cultural, material, seasonal, difficulty, or realm changes.                 | Definition-side         | Cold-season variant, basalt material kit, corrupted ecology profile.  |
| **Generated Instance**  | World-specific place, person, group, object, route, or event bound to definitions.             | Yes through record      | The Marrowfen March, a generated citadel, a relic with provenance.    |
| **Runtime State**       | Current damage, ownership, activity, population, supply, corruption, knowledge, or transition. | Yes                     | Abandoned, occupied, flooded, restored, hostile, dormant.             |
| **Historical Record**   | Why the instance exists and how it changed.                                                    | Append-only or migrated | Built in Era 3, captured, burned, repaired, culturally reinterpreted. |

# 8. Universal Atlas Metadata and Provenance

| **Field Group**       | **Required Fields**                                                                                             |
|-----------------------|-----------------------------------------------------------------------------------------------------------------|
| **Identity**          | definition_id, parent_id, family_id, domain, namespace, schema_version, display_name_key, aliases.              |
| **Ownership**         | canonical_document, source_pack, authoring_owner, review_owner, production_status, production_tier.             |
| **Selection**         | rarity, weight, scope, world presets, biome/realm tags, suitability query, exclusion query, uniqueness.         |
| **Relationships**     | required_links, optional_links, produced_links, reverse_links, capability requirements, fallback group.         |
| **Gameplay**          | world role, player-facing uses, progression bands, difficulty bands, settlement/economy/magic/automation hooks. |
| **Presentation**      | model kit, material family, animation family, icon, audio family, VFX family, map symbol, UI descriptors.       |
| **State and History** | allowed states, transition profiles, provenance requirements, generated-history hooks, aftermath hooks.         |
| **Technical**         | runtime resource type, streaming class, simulation LOD, save record, replication class, performance budget.     |
| **Validation**        | schema tests, semantic tests, seed tests, accessibility checks, content completeness, last validated build.     |
| **Lifecycle**         | created_version, deprecated_version, replacement_id, migration_rule, archive_reason, release notes.             |

# 9. Relationship Graph and Cross-Link Architecture

The relationship graph is the core of the Atlas. It stores authored truths such as a creature inhabiting a biome, a culture using a structure kit, a dungeon requiring a geological condition, a boss controlling a route, or a relic originating from a historical incident. Runtime generation resolves those relationships into specific world instances and records the binding.

| **Graph Element**          | **Meaning**                                                                                 | **Example**                                                    |
|----------------------------|---------------------------------------------------------------------------------------------|----------------------------------------------------------------|
| **Node**                   | A stable definition or generated instance.                                                  | biome, culture, creature, site, boss, resource, event.         |
| **Directed Edge**          | Source performs or requires a relationship toward target.                                   | creature inhabits biome; faction controls settlement.          |
| **Undirected Association** | Mutual compatibility without ownership direction.                                           | two biomes are valid neighbours.                               |
| **Capability Edge**        | Source requires a service or interface rather than a named target.                          | settlement requires fresh_water_source.                        |
| **Conditional Edge**       | Relationship applies only under state, era, difficulty, season, realm law, or world preset. | predator migrates during winter if route remains open.         |
| **Generated Binding**      | Seed selects compatible instances and stores the result.                                    | a generated culture claims a generated ruin.                   |
| **Historical Edge**        | Past relationship remains evidence even after current state changes.                        | former owner, destroyed route, extinct species, sealed portal. |

# 10. Relationship Types, Cardinality, Direction, and Strength

| **Relationship Family** | **Common Verbs**                                                                       | **Cardinality and Strength**                                             |
|-------------------------|----------------------------------------------------------------------------------------|--------------------------------------------------------------------------|
| **Spatial**             | contains, borders, overlays, connects, routes_to, beneath, above, leaks_into           | Usually many-to-many; hard geometry links may be required.               |
| **Ecological**          | inhabits, hunts, pollinates, parasitises, migrates_through, avoids, threatens          | Many-to-many with habitat and population suitability.                    |
| **Civilisation**        | founded_by, inhabited_by, governed_by, allied_with, rivals, trades_with, worshipped_by | Many-to-many; current and historical edges stored separately.            |
| **Functional**          | provides, consumes, produces, stores, powers, protects, teaches, repairs               | Capability or definition edges; often minimum completeness requirements. |
| **Progression**         | unlocks, hints_at, requires_knowledge, gates, substitutes_for, rewards                 | Prefer multiple eligible paths and fallback groups.                      |
| **Narrative**           | caused_by, evidence_of, participant_in, target_of, resolves_into, remembered_by        | Can bind authored roles to generated instances.                          |
| **Ownership and Law**   | owns, controls, claims, permits, forbids, taxes, protects                              | Runtime mutable; authority and witness rules required.                   |
| **Presentation**        | uses_model_kit, uses_material, uses_animation, emits_vfx, emits_audio, displays_icon   | Asset references must validate and support fallbacks.                    |
| **Technical**           | streams_with, simulates_as, saves_as, replicates_as, depends_on_pack                   | Hard implementation links; failure blocks integration.                   |

# 11. Hard References, Soft References, Queries, and Generated Bindings

| **Reference Type**             | **Use**                                                            | **Failure Behaviour**                                                          |
|--------------------------------|--------------------------------------------------------------------|--------------------------------------------------------------------------------|
| **Hard Definition Reference**  | Identity-critical dependency that must always resolve.             | Block build or content-pack load; migration or tombstone required.             |
| **Soft Definition Reference**  | Optional authored enrichment.                                      | Warn, omit feature, or use declared fallback without corrupting save.          |
| **Capability Query**           | Request any compatible provider rather than a fixed ID.            | Generation selects substitute; world fails only if no valid provider exists.   |
| **Tag Query**                  | Broad suitability or exclusion filter.                             | Used before semantic validation; never sufficient alone for complex selection. |
| **Weighted Candidate Set**     | Several authored alternatives with rarity and world-state weights. | Choose deterministically from valid set; log fallback if preferred set empty.  |
| **Generated Instance Binding** | Runtime relationship stored between selected world entities.       | Persists through save; migration preserves or repairs the relationship.        |
| **Historical Tombstone**       | Removed or destroyed entity retained as evidence.                  | References resolve to historical record rather than silently disappearing.     |

# 12. Tags, Capability Interfaces, Suitability, and Exclusion

Tags support fast filtering, but final selection must combine tags with typed fields, capabilities, world-state rules, and semantic validators. A tag such as forest or magical cannot prove that a settlement has water, a dungeon has a valid entrance, or a boss has enough territory.

| **Interface Family** | **Example Capabilities**                                                                                          |
|----------------------|-------------------------------------------------------------------------------------------------------------------|
| **Survival**         | food_source, shelter_material, potable_water, breathable_air, temperature_protection, safe_rest.                  |
| **Civilisation**     | housing, storage, governance, trade, healing, education, worship, defence, transport, communication.              |
| **Ecology**          | primary_producer, pollinator, prey, predator, scavenger, decomposer, nest_site, migration_corridor.               |
| **Industry**         | mineable_stock, renewable_feedstock, power_source, processing_station, waste_sink, maintenance_service.           |
| **Magic**            | mana_source, conduit, ward_anchor, ritual_site, spell_teacher, stabiliser, cleansing_service, portal_anchor.      |
| **Adventure**        | dungeon_entrance, encounter_space, puzzle_interface, boss_territory, clue_source, retreat_route, reward_context.  |
| **World State**      | corruptible, restorable, occupiable, destructible, claimable, floodable, seasonally_active, historically_layered. |
| **Presentation**     | silhouette_family, material_kit, animation_set, soundscape, VFX_socket_set, map_symbol, codex_portrait.           |

# 13. Inheritance, Composition, Regional Variants, and Content Reuse

| **Reuse Method**        | **Appropriate Use**                                                                    | **Boundary**                                                                   |
|-------------------------|----------------------------------------------------------------------------------------|--------------------------------------------------------------------------------|
| **Parent Inheritance**  | Shared physical or systemic defaults.                                                  | Avoid deep fragile chains; specific identity remains in child definition.      |
| **Composition Modules** | Structure rooms, boss mechanics, ecology roles, material processing, state behaviours. | Modules must declare compatibility and cannot erase required identity.         |
| **Regional Variant**    | Climate, geology, local resources, naming, palette, scale, behaviour.                  | Do not duplicate the base entry solely for cosmetic colour changes.            |
| **Cultural Variant**    | Architecture, goods, rituals, clothing, governance, use, interpretation.               | Culture is not ancestry and must not be locked by species.                     |
| **State Variant**       | Seasonal, damaged, occupied, corrupted, restored, dormant.                             | Runtime state remains separate from immutable identity.                        |
| **Generated Detail**    | Names, history, ownership, relationships, provenance, local measurements.              | Generation may fill declared slots but cannot invent unsupported capabilities. |
| **Signature Override**  | Unique boss, relic, wonder, culture, or realm identity.                                | Use where strong authorship matters; still implement common interfaces.        |

# 14. Content Packs, Dependencies, Overrides, and Mod Boundaries

| **Pack Requirement**    | **Rule**                                                                                                                                           |
|-------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------|
| **Manifest**            | Pack ID, namespace, version, schema range, dependencies, conflicts, load order, optional features, localisation, asset bundles, migration scripts. |
| **Namespace Ownership** | A pack may create definitions only inside its namespace unless an explicit extension point permits child variants or patches.                      |
| **Dependencies**        | Hard dependencies block load; soft dependencies enable optional relationships or fallbacks. Circular hard dependencies are forbidden.              |
| **Overrides**           | Core IDs are not silently replaced. Patches declare target version, fields changed, priority, compatibility, and uninstall behaviour.              |
| **Removal**             | Uninstall must preserve saves through fallback definitions, tombstones, conversion, or a clear incompatibility warning before world load.          |
| **World Manifest**      | Each save records enabled packs, versions, hashes, selected definitions, generation version, migrations, and unresolved warnings.                  |
| **Multiplayer**         | Server or host owns authoritative pack manifest; clients validate compatible presentation and logic content before joining.                        |
| **Mod Safety**          | Mods may extend content without changing protected authority, security, save, transaction, or personhood rules.                                    |

# 15. Master Atlas Registry Inventory

The current Atlas contains a large planning inventory. Counts below describe v0.1 authored foundations and modules, not finished assets or a commitment that every entry ships immediately. [[24C - Oceans, Coasts, Islands, Skylands, Underground and Special Overworld Biomes]] contributes extensive environment families and contracts but does not use one consolidated count in the same way as the count-explicit registries.

| **Volume** | **Count-Explicit Primary Foundations**                                                                | **Reusable Modules / Profiles / Hooks**                          | **Production Meaning**                                        |
|------------|-------------------------------------------------------------------------------------------------------|------------------------------------------------------------------|---------------------------------------------------------------|
| **24B**    | 24 region archetypes + 96 surface biomes = 120                                                        | Transition and completeness contracts                            | Natural surface-world planning base.                          |
| **24C**    | Environment-family registries and overlays; count governed per family                                 | Adjacency, overlay, vertical, hazard, and completeness contracts | Marine, island, sky, underground, and special Overworld base. |
| **24D**    | 12 realms + 96 realm biomes = 108                                                                     | Realm laws, route, state, and completeness contracts             | Full dimensional-world planning base.                         |
| **24E**    | 112 across ancestry/personhood, culture, government, faction, settlement, realm-civilisation profiles | Variant and completeness profiles                                | Civilisation identity and settlement base.                    |
| **24F**    | 132 creature families                                                                                 | 16 dungeon-ecology modules + 24 boss-ecology hooks               | Overworld and dimensional ecology base.                       |
| **24G**    | 144 site foundations                                                                                  | 24 rooms + 20 hazards + 16 puzzles + 17 states = 77              | Dungeon, ruin, lair, and megadungeon base.                    |
| **24H**    | 126 major-threat foundations                                                                          | At least 24 mechanics + 12 evidence + 10 aftermath = at least 46 | Boss, siege, titan, and realm-climax base.                    |
| **24I**    | 228 structure, route, realm-structure, and wonder foundations                                         | 32 structure modules + 18 state profiles = 50                    | Built-world and infrastructure base.                          |
| **24J**    | 300 resource, realm-resource, loot, relic, and goods foundations                                      | 24 material/loot modules + 18 dynamic states = 42                | Material ecology, reward, and trade base.                     |
| **24K**    | 204 history, arc, event, and state foundations                                                        | 24 rumour/chronicle modules + 18 aftermath modules = 42          | Living history, narrative, and consequence base.              |

# 16. Counted Foundation and Module Summary

| **Planning Inventory Summary** The count-explicit primary registries contain 1,474 foundations across Documents 24B and 24D-24K. They also contain at least 297 reusable modules, profiles, and hooks, before counting the extensive 24C environment-family taxonomies and cross-document schemas. These numbers prove breadth of planning; they do not prove implementation, balance, art completion, or shipping readiness. |
|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

| **Inventory Class**                       | **Count**                             | **Interpretation**                                                                                                                     |
|-------------------------------------------|---------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------|
| **Primary count-explicit foundations**    | 1,474                                 | Authored region, biome, realm, civilisation, creature, site, boss, structure, material, reward, history, event, and state foundations. |
| **Known reusable modules/profiles/hooks** | At least 297                          | Room, hazard, puzzle, ecology, boss, structure, material, rumour, aftermath, and state components.                                     |
| **24C environmental registry content**    | Tracked by family, not included above | Oceans, coasts, islands, skylands, underground layers, special biomes, overlays, transitions, and hazards.                             |
| **POC production identities**             | 0                                     | POC names and guaranteed arrangements remain archived only.                                                                            |
| **Release-ready entries**                 | Not yet implied by count              | Every entry still requires classification, physical registries, assets, implementation, integration, and validation.                   |

# 17. Cross-Link Matrix: Atlas Volumes

| **Source Volume**        | **Must Link To**                  | **Minimum Relationship Outcome**                                                                                                                    |
|--------------------------|-----------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------|
| **24B/24C Environments** | 24E, 24F, 24G, 24H, 24I, 24J, 24K | Each environment supports ecology, resources, civilisation suitability, sites, threats, structures/routes, events, and transformed states.          |
| **24D Realms**           | 24E-24K                           | Each major realm has biomes, societies, ecology, dungeons, guardians, structures, resources, histories, events, routes, and Overworld consequences. |
| **24E Civilisations**    | 24B-24D, 24F-24K                  | Cultures occupy compatible places, use resources and structures, relate to creatures, create sites and history, and respond to bosses/events.       |
| **24F Ecology**          | 24B-24E, 24G-24K                  | Creatures inhabit valid environments, affect societies and resources, occupy sites, connect to bosses, and participate in history/events.           |
| **24G Sites**            | 24B-24F, 24H-24K                  | Sites have origin, environment, inhabitants, routes, rewards, history, states, and encounter sockets.                                               |
| **24H Threats**          | 24B-24G, 24I-24K                  | Threats have territory, ecology or society role, sites/routes, resources, discovery evidence, outcomes, and persistent aftermath.                   |
| **24I Structures**       | 24B-24H, 24J-24K                  | Structures fit terrain and culture, consume/provide resources, support networks, carry history, and change through events/states.                   |
| **24J Materials**        | 24B-24I, 24K                      | Materials have sources, transformations, users, trade routes, rewards, provenance, scarcity, and story consequences.                                |
| **24K History/Events**   | 24B-24J                           | Every incident and event binds real compatible actors, places, resources, structures, threats, causes, evidence, and aftermath.                     |

# 18. Cross-Link Matrix: Gameplay Systems

| **System**               | **Atlas Inputs**                                                                             | **Required Runtime Output**                                                                                       |
|--------------------------|----------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------|
| **World Generation**     | World profiles, topology, biomes, realms, placement constraints, history seeds.              | Deterministic coherent world manifest, instances, relationships, fallback record, and validation report.          |
| **NPC and Settlement**   | Civilisation, settlement, structure, resource, service, faction, history, event definitions. | Named persistent people, households, jobs, ownership, needs, projects, reputation, migration, and memory.         |
| **Automation**           | Resources, structures, routes, power conditions, settlement demand, realm laws, hazards.     | Physical networks, authoritative transactions, throughput, maintenance, permissions, risk, and distant summaries. |
| **Magic**                | Realm laws, mana ecology, resources, cultures, sites, relics, bosses, states.                | Spells, rituals, infrastructure, teaching, corruption, portals, wards, and world transformations.                 |
| **Combat and Defence**   | Creatures, bosses, factions, sites, terrain, structures, settlement stakes, outcomes.        | Readable encounters, damage, retreat, non-lethal options, defence contribution, loot context, and aftermath.      |
| **Quest and Event**      | History, arcs, events, rumours, participants, locations, resources, states.                  | Objectives, negotiation, contribution, failure, branching, evidence, journal, and persistent resolution.          |
| **Blocks/Items/Recipes** | Materials, structures, biomes, cultures, creatures, dungeons, bosses, realms.                | Physical blocks, item forms, crafting/processing chains, drops, construction, trade, and repair.                  |
| **UI/UX and Codex**      | All definition metadata, knowledge state, uncertainty, relationships, map symbols, alerts.   | World-first presentation, search, filters, explanations, accessibility, provenance, and player-trust feedback.    |
| **Forge/Audio/VFX**      | Presentation manifests and attachment points.                                                | Models, voxel kits, textures, animations, sockets, icons, sounds, effects, variants, and previews.                |

# 19. World, Region, Biome, and Special-Environment Package Contract

| **Layer**                    | **Minimum Production Contract**                                                                                                              |
|------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------|
| **Identity**                 | Stable ID, family, scale, climate/environment laws, terrain identity, player-facing fantasy, rarity, and world-profile eligibility.          |
| **Topology**                 | Valid parents, neighbours, transitions, vertical links, water/air/subsurface relationships, route opportunities, and exclusions.             |
| **Survival and Progression** | Basic survival suitability or explicit hazard gate, resource substitutions, buildability, navigation, progression opportunities, and escape. |
| **Ecology**                  | Producer, prey, predator/scavenger, ambient life, unusual creature slots, migration or seasonal behaviour, and population limits.            |
| **Civilisation**             | Settlement suitability, adaptation requirements, resource economy, route logic, cultural use, law/territory implications.                    |
| **Adventure**                | Minor structures, at least two site/lair families over time, boss or regional threat suitability, history/evidence, and events.              |
| **Presentation**             | Terrain palette, vegetation/feature kit, ambience, weather, soundscape, VFX, map readability, state variants.                                |
| **Validation**               | Adjacency, spawn safety, content density, traversal, performance, transformed states, and seed diversity tests.                              |

# 20. Dimension and Realm Package Contract

| **Layer**             | **Minimum Production Contract**                                                                                                     |
|-----------------------|-------------------------------------------------------------------------------------------------------------------------------------|
| **Realm Identity**    | Stable laws, topology, survival conditions, safe-return model, navigation, world role, and cross-realm relationship.                |
| **Biome Coverage**    | Multiple major biome families plus transitions, hidden layers, regional mosaics, hazards, resources, ecology, and settlements.      |
| **Societies**         | At least two meaningful social or political interests over time; migration, sovereignty, trade, conflict, and player relationship.  |
| **Adventure**         | Several dungeon families, regional threats, guardian or sovereign paths, discovery, alternative outcomes, and persistent aftermath. |
| **Infrastructure**    | Portal routes, local transport, construction adaptations, power/magic rules, repair, storage, settlement and automation viability.  |
| **Overworld Utility** | Resources, knowledge, allies, structures, magic, trade, or state changes that matter after leaving the realm.                       |
| **Technical**         | Derived seed, independent chunk/world data, inactive simulation, portal anchoring, save/recovery, multiplayer transition authority. |
| **Release Gate**      | No single-biome reskin, one-resource excursion, unavoidable soft lock, or realm whose only purpose is a boss arena.                 |

# 21. People, Culture, Faction, and Settlement Package Contract

| **Layer**                      | **Minimum Production Contract**                                                                                                    |
|--------------------------------|------------------------------------------------------------------------------------------------------------------------------------|
| **Identity Stack**             | Ancestry/personhood separate from culture, language, faith, government, faction, citizenship, profession, and personal values.     |
| **Daily Life**                 | Names, households, food, clothing, art, traditions, schedules, labour, services, education, care, and accessibility.               |
| **Economy and Infrastructure** | Sources, goods, needs, industries, trade, transport, storage, construction, maintenance, automation and magic attitudes.           |
| **Politics**                   | Leadership, law, rights, crime, diplomacy, internal factions, rivals, allies, migration, succession, conflict, and reform.         |
| **Settlement Kit**             | Housing, civic, work, trade/storage, culture/faith, defence, route, signage, damaged/restored states, and biome adaptation.        |
| **World Relationships**        | Home and diaspora suitability, creatures, resources, sites, bosses, realms, histories, events, stories, and player paths.          |
| **Representation**             | No ancestry determinism, no monoculture, no inherent hostility, no personhood denial by appearance, and no forced moral alignment. |

# 22. Wildlife, Creature, Monster, and Ecology Package Contract

| **Layer**                       | **Minimum Production Contract**                                                                                                        |
|---------------------------------|----------------------------------------------------------------------------------------------------------------------------------------|
| **Identity and Classification** | Stable family, personhood status, body plan, habitat, trophic role, activity cycle, rarity, threat and interaction class.              |
| **Ecology**                     | Diet, prey/predators, reproduction/lifecycle, nests, territory, migration, environmental effects, population limits, and disturbances. |
| **Behaviour**                   | Senses, locomotion, social rules, morale, terrain use, settlement/machine reaction, taming or diplomacy where appropriate.             |
| **Gameplay**                    | Readable counterplay, rewards or non-combat value, harvesting ethics, drops linked to 24J, codex clues, and difficulty scaling.        |
| **Variants**                    | Regional, seasonal, magical, corrupted, realm, age, sex where relevant, domesticated, injured, and state presentation.                 |
| **Assets**                      | Silhouette, model/body kit, texture/material family, animation set, audio calls, effects, tracks, nest/den evidence, icon.             |
| **Simulation**                  | Near AI, distant population, persistence, migration, extinction/invasion, save state, multiplayer authority, and performance budget.   |

# 23. Dungeon, Ruin, Lair, and Megadungeon Package Contract

| **Layer**              | **Minimum Production Contract**                                                                                                            |
|------------------------|--------------------------------------------------------------------------------------------------------------------------------------------|
| **Origin and Purpose** | Builder/creator, age, original function, historical layers, current occupant, world role, environment suitability.                         |
| **Topology**           | Entrance rules, critical path, optional branches, loops, shortcuts, exits, retreat safety, vertical structure, accessibility alternatives. |
| **Modules**            | Room grammar, hazards, puzzles, ecology, faction spaces, services, boss sockets, loot contexts, secrets, state transitions.                |
| **Dynamic State**      | Dormant, occupied, contested, collapsed, flooded, cursed, corrupted, looted, restored, claimed, repurposed, or other valid states.         |
| **World Links**        | Routes, settlements, factions, resources, creatures, bosses, history, rumours, events, realm rules, restoration and ownership.             |
| **Persistence**        | Reset/repopulation policy, generated layout record, unique objects, cleared state, reoccupation, conversion, simulation LOD.               |
| **Validation**         | Solvable path, no blocked exit, readable hazards, valid rewards, ownership, save/reload, multiplayer join/leave, and seed tests.           |

# 24. Boss, Titan, Siege, and Realm-Guardian Package Contract

| **Layer**                  | **Minimum Production Contract**                                                                                                         |
|----------------------------|-----------------------------------------------------------------------------------------------------------------------------------------|
| **World Role**             | Territory, ecology/society/infrastructure effect, current pressure, history, discovery evidence, reason encounter matters.              |
| **Encounter**              | Mechanic modules, phases, goals, weak points, arena or roaming rules, terrain interaction, warning, retreat and recovery.               |
| **Preparation**            | Research, gear, settlement support, routes, automation, wards, allies, diplomacy, timing, and environmental counterplay.                |
| **Outcomes**               | Kill where appropriate plus non-lethal, political, ecological, restorative, binding, relocation, pact, or containment paths.            |
| **Aftermath**              | Biome, ecology, faction, settlement, route, dungeon, resource, realm-law, memorial, succession, recurrence and story changes.           |
| **Rewards**                | Contextual materials, knowledge, rights, alliances, infrastructure, relics, access, reputation, world services; not only stronger gear. |
| **Readability and Access** | Telegraphs, audio cues, colour-independent signals, comfort settings, difficulty modifiers, multiplayer contribution.                   |

# 25. Structure, Landmark, Route, Wonder, and Infrastructure Package Contract

| **Layer**                  | **Minimum Production Contract**                                                                                                  |
|----------------------------|----------------------------------------------------------------------------------------------------------------------------------|
| **Identity and Function**  | Stable family, scale, services, users, builder/culture compatibility, terrain and route requirements, maintenance.               |
| **Physical Kit**           | Footprint grammar, block/material requirements, modules, entrances, sockets, damage states, construction stages, blueprint data. |
| **Networks**               | Route, power, mana, water, storage, logistics, communication, defence, portal, ownership and permission interfaces.              |
| **History and Society**    | Builder, owner, occupants, laws, labour, cultural meaning, economy, conflict, abandoned/occupied/restored interpretation.        |
| **Dynamic States**         | Planned, building, active, under-supplied, damaged, besieged, abandoned, occupied, corrupted, restored, repurposed.              |
| **World Generation**       | Terrain adaptation, density, uniqueness, visibility, route endpoints, settlement integration, overlap and fallback rules.        |
| **Assets and Performance** | Modular models, material variants, interaction markers, audio/VFX sockets, LOD, collision, nav, chunk and save budgets.          |

# 26. Resource, Loot, Relic, Trade, and Material-Ecology Package Contract

| **Layer**                   | **Minimum Production Contract**                                                                                                       |
|-----------------------------|---------------------------------------------------------------------------------------------------------------------------------------|
| **Origin and Distribution** | Biome/realm/geology/ecology/culture source, node form, rarity, grade, purity, renewal, depletion and discovery clues.                 |
| **Physical Forms**          | Block/node, raw item, refined item, component, placeable, storage, transport, quality, condition, icon and presentation.              |
| **Transformation**          | Gathering tools, recipes, stations, machines, by-products, waste, recycling, purification, stabilisation, repair and substitution.    |
| **Uses**                    | Survival, building, tools, gear, automation, magic, settlements, trade, culture, quests, dungeons, bosses, realm access, restoration. |
| **Economy**                 | Producers, consumers, strategic control, legality, sacred claims, ownership, prices, contracts, routes, shortages, markets.           |
| **Rewards and Provenance**  | Loot grammar, source context, ownership, history, relic custody, uniqueness, non-lethal rewards and persistent loss.                  |
| **Validation**              | No orphan item, empty recipe path, duplicate role, impossible access, useless old material, unbounded economy or missing fallback.    |

# 27. History, Story, Event, Rumour, and Dynamic-State Package Contract

| **Layer**                | **Minimum Production Contract**                                                                                                             |
|--------------------------|---------------------------------------------------------------------------------------------------------------------------------------------|
| **History**              | Cause, actors, places, capabilities, era, outcomes, evidence, competing interpretations, present consequences and validity.                 |
| **Story Arc**            | Scale, roles, eligibility, tensions, discovery, branches, replacement/fallback, multiple solutions, failure, aftermath and closure.         |
| **Event**                | Real cause, phase lifecycle, warning, participants, location, severity, intervention space, cooldown, resolution and propagation.           |
| **Rumour and Knowledge** | Source, reliability, bias, uncertainty, map/codex effects, verification, contradiction, propaganda and expiration.                          |
| **Dynamic State**        | Target, cause, start, owner, modifiers, presentation evidence, transitions, propagation, duration, persistence and reversal.                |
| **Player Trust**         | No fake urgency, hidden unavoidable punishment, ancestry determinism, false choice, silently rewritten history or unexplained state change. |

# 28. Blocks, Items, Recipes, and Resource-Progression Integration

The Atlas makes a major revision of Documents 03-06 unavoidable. Their system architecture remains valuable, but the production registries must expand from POC-era lists into comprehensive physical support for the selected biomes, cultures, realms, creatures, dungeons, bosses, structures, resources, and states.

| **Registry**             | **Required Atlas-Aligned Expansion**                                                                                                                                                                                                                                                                         |
|--------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Blocks**               | Terrain palettes for selected biomes and realms; culture material kits; structure modules; dungeon/hazard blocks; creature-created blocks; boss arena and aftermath blocks; route/infrastructure families; resource nodes; dynamic damage, corruption, restoration, season, age, ownership and power states. |
| **Items**                | Every selected resource form; tools, gear, food, medicine, culture goods, machine parts, magic components, creature materials, keys, maps, books, relics, trophies, trade packages, quest evidence, repair parts and realm stabilisation objects.                                                            |
| **Recipes**              | Survival, construction, culture, food, medicine, processing, automation, magic, dungeon restoration, boss preparation, relic repair, settlement projects, realm travel and state-change recipes.                                                                                                             |
| **Resource Progression** | Replace one mostly linear material ladder with multiple equivalent regional paths, side branches, culture access, trade, salvage, creature resources, realm materials, substitutes, recycling and civilisation-scale supply.                                                                                 |
| **Data Cross-Links**     | Every block/item/recipe references Atlas origin, users, biomes/realms, cultures, structures, resources, progression band, states, assets and fallback groups.                                                                                                                                                |
| **Production Order**     | Classify Atlas Core Production first; then generate the exact block/item/recipe backlog. Do not attempt to fully enumerate all 1,474 foundations immediately.                                                                                                                                                |

# 29. NPC, Settlement, Automation, Magic, Combat, Quest, and UI Integration

| **System**             | **Required Integration**                                                                                                                                                                    |
|------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **NPC and Settlement** | Generated identity stack, households, jobs, skills, culture, faction, settlement services, needs, inventory, memory, law, reputation, migration, construction and world-state response.     |
| **Automation**         | Atlas materials and structures expose machine interfaces, routes, storage, power, mana, permissions, maintenance, hazards, supply contracts, distant summaries and settlement demand.       |
| **Magic**              | Schools, resources, cultures, realms, creatures, sites, relics, bosses, states, rituals, wards, portals, corruption and infrastructure bind through stable Atlas IDs.                       |
| **Combat and Defence** | Creature/boss/faction definitions bind actions and balance profiles; sites and terrain bind encounter spaces; structures and settlements bind defence objectives and aftermath.             |
| **Quest and Event**    | 24K arc/event definitions bind generated actors and places, while the system owns objectives, tracking, contribution, dialogue, timing, failure, rewards and journal state.                 |
| **UI/UX**              | Every definition exposes player-facing name, description, knowledge level, uncertainty, relationships, icon, map symbol, warnings, accessibility metadata and provenance where appropriate. |

# 30. Forge, Animation, Audio, VFX, Icon, and Presentation Integration

| **Asset Layer**            | **Manifest Requirement**                                                                                                                                |
|----------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Voxel and Model Kit**    | Asset ID, source definition, body/structure/material kit, scale, pivots, collision, LOD, attachment points, variants and Forge project source.          |
| **Textures and Materials** | 32x32 base textures where applicable, palette family, biome/culture/realm variation, state masks, emissive/charge/corruption/damage/age channels.       |
| **Animation**              | Skeleton/body plan, clips, state machine tags, action events, locomotion, jobs, combat, interaction, damage, death, social and ambient sets.            |
| **Audio**                  | Ambient family, footsteps, impacts, loops, creature calls, machinery, magic, UI cue, event cue, spatial rules, priority and accessibility alternatives. |
| **VFX**                    | Effect family, sockets, scale, duration, colour-independent shape/motion cues, intensity, LOD, performance class, gameplay readability.                 |
| **Icons and UI**           | Inventory icon, Codex portrait, map symbol, status/state icon, rarity/quality frame, tooltips, localisation and accessibility description.              |
| **Validation**             | No Integrated content with missing required asset family unless a declared shared fallback is approved and visually coherent.                           |

# 31. Universal Completeness Contracts

| **Contract**              | **Pass Requirement**                                                                                                          |
|---------------------------|-------------------------------------------------------------------------------------------------------------------------------|
| **Identity Complete**     | Stable ID, schema, source, owner, display/localisation keys, description, category, status and version.                       |
| **Relationship Complete** | All hard references resolve; required capabilities have providers; reverse links and exclusions validate.                     |
| **World Complete**        | Placement/suitability, history, environment, ownership, states, fallback and seed behaviour are defined.                      |
| **Gameplay Complete**     | At least one meaningful purpose, progression connection, player interaction, consequence, and recovery/failure behaviour.     |
| **Presentation Complete** | Required models, textures, animation, audio, VFX, icons, map/codex metadata, state evidence and accessibility cues.           |
| **Technical Complete**    | Runtime resource, save record, simulation/streaming class, authority, LOD, performance budget and migration rule.             |
| **Quality Complete**      | Human review, automated tests, representative seed suite, no POC dependencies, no unsafe stereotypes, no unresolved blockers. |

# 32. Production Status Lifecycle

| **Status**            | **Minimum Meaning**                                                                                            | **May Ship?**            |
|-----------------------|----------------------------------------------------------------------------------------------------------------|--------------------------|
| **Concept**           | Fantasy, purpose, rough role, owner, and candidate links.                                                      | No                       |
| **Foundation**        | Stable draft ID, schema class, relationship intent, scope and initial completeness contract.                   | No                       |
| **Specified**         | All required fields, references, capabilities, variants, states, asset manifest and test plan documented.      | No                       |
| **Data Ready**        | Machine-readable definition passes schema, namespace and reference validation.                                 | No                       |
| **Prototype Ready**   | Placeholder or early assets and system bindings prove the complete interaction loop.                           | Internal only            |
| **Asset Ready**       | Approved production assets, animations, icons, audio/VFX hooks and source files exist.                         | Not alone                |
| **Integrated**        | Data, systems, assets, saves, worldgen, UI and multiplayer authority work together.                            | Internal/preview         |
| **Validated**         | Completeness, seed, gameplay, performance, accessibility, representation, migration and regression gates pass. | Candidate                |
| **Release Candidate** | Locked for target milestone with no unresolved blocker; localisation and packaging complete.                   | Yes after release review |
| **Released**          | Shipped and versioned; telemetry/feedback and compatibility monitored.                                         | Yes                      |
| **Deprecated**        | Still resolvable; replacement and migration published.                                                         | Legacy only              |
| **Archived**          | Not selected by normal generation; retained for history, tests, or old saves.                                  | No new generation        |

# 33. Production Tiers and Shipping Classification

| **Tier**                | **Purpose**                                                                                                                                                                                               | **Selection Rule**                                                 |
|-------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------|
| **Core Production**     | Smallest content set that proves the complete production identity: random world, multiple biomes, cultures, settlements, ecology, dungeons, bosses, automation, magic, events and at least one dimension. | Highest priority; every dependency must be complete and tested.    |
| **Early Access**        | Broadens replayability, world sizes, cultures, dungeons, bosses, realm access, building and progression after the core is stable.                                                                         | Only add packages that meet full completeness and migration rules. |
| **Full Release**        | Meets intended breadth for the first complete commercial version, including several dimensions and mature civilisation/world-state systems.                                                               | Scope selected through capacity and quality, not Atlas count.      |
| **Later Expansion**     | New realms, cultures, ecology, megadungeons, world-scale threats, systems or themed packs.                                                                                                                | Must use stable extension points and avoid breaking old seeds.     |
| **Tooling Research**    | Promising concepts blocked by Forge, AI, rendering, simulation, networking or authoring-tool maturity.                                                                                                    | Do not promise to players until feasibility is proven.             |
| **Archived Validation** | POC content and retired experiments.                                                                                                                                                                      | Excluded from normal generation and release registries.            |

# 34. Content Budget Philosophy and Scope Controls

Budgets are targets for planning and validation, not quotas that force filler. The first production milestone should use a deliberately selected subset of Atlas foundations, but each selected package must be deep enough to prove the final game rather than recreating a narrow POC.

| **Budget Principle**      | **Locked Direction**                                                                                                                          |
|---------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------|
| **Vertical Completeness** | Finish several fully connected packages before opening dozens of partial families.                                                            |
| **Reusable Kits**         | Invest early in high-leverage material, culture, creature-body, room, structure, animation, audio and VFX kits.                               |
| **Signature Content**     | Reserve bespoke production for experiences where uniqueness is player-visible: realms, cultures, bosses, wonders, relics, key dungeons.       |
| **Calm Space**            | Content density budgets preserve wilderness, building space, travel, recovery and player-authored landscapes.                                 |
| **World Diversity**       | Seed diversity comes from relationships, variants, history and states as well as raw entry count.                                             |
| **Performance Budget**    | Every content family declares simulation, rendering, memory, save, streaming and network cost.                                                |
| **Scope Freeze**          | A milestone freezes new foundation intake before asset completion and integration; exceptions require replacing or deferring equivalent work. |

# 35. First Production Milestone Content Budget

This milestone is the first post-POC production slice. It should prove that a new seed can create a natural but varied world with no fixed tutorial region, while supporting the game’s complete identity. The exact entries are selected later, but the following budget is recommended.

| **Content Family**                                      | **Recommended Core Production Target** | **Notes**                                                                                                                           |
|---------------------------------------------------------|----------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------|
| **World profiles**                                      | 3                                      | Balanced, relaxed/building-focused, and harsher frontier presets with adjustable parameters.                                        |
| **Overworld macro-region archetypes**                   | 6-8                                    | Cover temperate, cold, dry, wet, highland, coastal, and special variation.                                                          |
| **Surface biome families**                              | 18-24                                  | Enough transitions and regional identity without producing an impossible block/asset backlog.                                       |
| **Ocean/coast/island/sky/underground/special families** | 12-18 combined                         | At least one meaningful route through each vertical/environment class; underground receives strongest early depth.                  |
| **Major dimensions**                                    | 1 fully playable + 1 teaser route      | The playable realm needs multiple biomes, society, ecology, dungeons, resources and guardian paths; teaser cannot trap progression. |
| **Cultures**                                            | 4-6                                    | At least two ancestries/personhood foundations represented across multiple cultures; mixed settlements supported.                   |
| **Faction archetype instances**                         | 8-12 per representative world          | Generated from a smaller reusable archetype set; includes civic, trade, research, religious, rival and hostile interests.           |
| **Settlement archetypes**                               | 8-10                                   | Hamlet through town plus mobile, underground/coastal or realm-adapted forms where selected.                                         |
| **Creature families**                                   | 35-50 Overworld + 10-15 realm          | Ambient, prey, livestock, predators, monsters, magical beings, dungeon ecology and regional threats.                                |
| **Dungeon/site families**                               | 18-24 Overworld + 4-6 realm            | Includes micro-sites, ruins, mines, lairs, crypt/temple, fortress/lab, one megadungeon seed family.                                 |
| **Boss/major threats**                                  | 8-12 Overworld + 3-4 realm             | Lair, dungeon, roaming, siege/regional and guardian roles with alternative outcomes.                                                |
| **Structure/route foundations**                         | 40-60 selected                         | Settlement, work, trade, defence, magic, infrastructure, route, special and restoration coverage.                                   |
| **Resource/material families**                          | 45-65 selected                         | All survival, building, automation, magic, culture, creature, dungeon, boss and realm chains used by selected content.              |
| **Loot/relic/goods foundations**                        | 30-45 selected                         | Contextual rewards and trade diversity without flooding inventories.                                                                |
| **Historical incidents/arcs/events/states**             | 20-30 / 12-18 / 30-45 / 16-24          | Enough generated history and living events to avoid one scripted story.                                                             |

# 36. Early Access and Full Release Content Budgets

| **Milestone**                 | **Breadth Goal**                                                           | **Primary Expansion**                                                                                                                                                 |
|-------------------------------|----------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Early Access Foundation**   | Approximately double Core Production world variety after stability.        | More climates, coasts, sky/underground routes, cultures, settlements, creature families, site grammars, bosses, materials and event families; second full realm.      |
| **Early Access Maturity**     | System depth before raw count.                                             | Settlement stages, trade routes, automation scaling, magic schools, dungeon restoration, boss aftermath, migration, faction change, world chronicle and robust saves. |
| **Full Release Overworld**    | Broad natural and magical Overworld with strong seed diversity.            | A curated portion of 24B/24C registry, not necessarily all 96 surface biomes or all special families.                                                                 |
| **Full Release Realms**       | Several complete major dimensions.                                         | Each selected realm meets full biome, society, ecology, dungeon, resource, guardian and infrastructure contract.                                                      |
| **Full Release Civilisation** | Multiple ancestries/personhood types across many cultures and governments. | Meaningful mixed settlements, diaspora, diplomacy, war, law, religion, labour and player settlement paths.                                                            |
| **Full Release Adventure**    | Regional, dungeon, siege, titan and realm threats.                         | Bosses and dungeons create persistent world change and multiple resolution paths.                                                                                     |
| **Full Release Creation**     | Forge-supported content pipeline and stable data packs.                    | Players and developers can safely add blueprints, assets and later content without redesigning the core registries.                                                   |

# 37. Expansion, Mod, and Long-Term Content Budgets

- Each major expansion should introduce one complete relationship theme rather than a loose bundle: for example a realm plus its cultures, ecology, dungeons, resources, structures, bosses, history and events.

- Minor packs may add regional variants, culture kits, creature families, dungeon grammars, structures, goods, events or blueprints when they use existing capabilities and pass compatibility tests.

- Mods may exceed official content budgets but must publish dependencies, performance classes, migration rules and relationship completeness.

- Old worlds should receive new content through unexplored regions, generated routes, migrations, events, pocket realms, archaeology, trader inventories or explicit world-upgrade operations rather than silent rewriting of explored land.

- Annual roadmap planning should measure validated playable packages, not raw registry row count.

# 38. Production Roadmap and Milestone Sequence

| **Phase**                                    | **Primary Deliverables**                                                                                                       | **Exit Gate**                                                                                |
|----------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------|
| **0. Archive and Baseline**                  | Freeze POC branch, tag last validating build, archive content IDs, capture regression tests, inventory hardcoded assumptions.  | Production branch loads without selecting POC content; archived test saves remain available. |
| **1. Registry Kernel**                       | Universal schemas, namespaces, status fields, relationship graph, content-pack manifest, import/export, validation CLI/editor. | Representative definitions from every domain load and cross-link in Godot.                   |
| **2. Core Classification**                   | Assign every 24A-24K foundation a production tier, owner, dependencies and backlog status.                                     | Core Production set is scope-locked and dependency-complete on paper.                        |
| **3. Blocks/Items/Recipes Revision**         | Generate Atlas-aligned physical registry backlog and implement selected Core forms.                                            | Every selected content package has valid physical inputs/outputs and recipe paths.           |
| **4. Seed World Kernel**                     | Deterministic world/region/biome/structure/site/settlement selection with manifests and repair fallbacks.                      | Large seed suite produces no POC content, invalid worlds or progression dead ends.           |
| **5. Living World Integration**              | NPC/faction/settlement, ecology, resources/trade, automation/magic, history/events, states and LOD.                            | World continues coherently near and far, saves safely, and creates persistent consequences.  |
| **6. Asset Production Pipeline**             | Forge manifests, reusable kits, icons, animation, audio/VFX attachments, automated asset validation.                           | Core Production entries reach Asset Ready with consistent style and performance.             |
| **7. Adventure Integration**                 | Dungeons, bosses, sieges, realm routes, alternative outcomes, rewards and aftermath.                                           | Selected content loops from discovery through consequence without scripted POC sequence.     |
| **8. UI, Accessibility, Multiplayer, Saves** | Codex/journal/map, settings, controller/touch, authority, reconnect, migration and recovery.                                   | Representative full-world playthrough and update cycle pass.                                 |
| **9. Core Production Release Gate**          | Balance, performance, seed diversity, regression, localisation and packaging.                                                  | Definition of Done in Section 53 passes.                                                     |

# 39. Registry Authoring Workflow

1.  Create or select a production brief defining fantasy, world role, player experience, scope, owner and intended milestone.

2.  Choose the canonical domain schema and parent definition; reserve a stable namespace ID.

3.  Fill identity, selection, capabilities, relationships, states, presentation manifest and technical budget fields.

4.  Link required providers through stable IDs or capability queries; declare exclusions and fallback groups.

5.  Run schema/reference validation before prose review to prevent designing around invalid data.

6.  Review relationship completeness with neighbouring Atlas domains and affected gameplay-system owners.

7.  Prototype the complete loop with placeholder assets; record runtime bindings, seed behaviour and failure cases.

8.  Produce and validate assets through Forge/audio/VFX pipelines; preserve source project references.

9.  Integrate UI, save, LOD, authority, accessibility, localisation and migration behaviour.

10. Run seed, performance, gameplay, representation and regression suites; advance status only when all gates pass.

# 40. AI-Assisted Production, Review, and Human Authority

| **AI Role**                   | **Permitted High-Value Work**                                                                                                    | **Required Human Control**                                                                                   |
|-------------------------------|----------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------|
| **Registry Drafting**         | Generate candidate entries, variants, field completion, cross-link suggestions, summaries and gap reports from approved schemas. | Human approves identity, lore, representation, scope, production tier and final relationships.               |
| **Validation**                | Detect missing fields, broken IDs, duplicate roles, empty capability slots, inconsistent tags, POC references and coverage gaps. | Human reviews false positives, design exceptions and quality implications.                                   |
| **Asset Assistance**          | Generate references, texture drafts, naming candidates, animation/effect plans and batch metadata.                               | Human art direction, licensing/provenance, final assets, style and accessibility approval.                   |
| **Implementation Assistance** | Draft Godot resources, importers, validators, tests, editor plugins and migration scripts.                                       | Human code review, security, performance, architecture and release authority.                                |
| **Simulation Testing**        | Run seed batches, playtest agents, economy/ecology checks and report unusual worlds.                                             | Human evaluates fun, readability, ethics, player freedom and whether repair rules preserve intended fantasy. |
| **Documentation**             | Maintain cross-document indexes, change logs, registry snapshots and update proposals.                                           | Human decides source-of-truth changes and version releases.                                                  |

| **Human Authority Rule** AI may accelerate content production and verification, but it must not silently change canon, moral framing, personhood classification, production scope, player-facing promises, legal/licensing status, or release decisions. Ash retains final project authority. |
|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

# 41. Validation Architecture and Automated Gates

| **Validation Layer** | **Required Checks**                                                                               | **Failure Severity**                              |
|----------------------|---------------------------------------------------------------------------------------------------|---------------------------------------------------|
| **Schema**           | Types, required fields, enums, versions, ranges, templates.                                       | Error                                             |
| **Identity**         | Unique IDs, namespace ownership, aliases, localisation keys, deprecation.                         | Error                                             |
| **Reference**        | Hard/soft links, capability providers, reverse links, pack dependencies, cycles.                  | Error or warning by reference type                |
| **Semantic**         | World-role consistency, personhood, suitability, exclusions, cardinality, states, progression.    | Error for contradictions; warning for design gaps |
| **Completeness**     | Family-specific contract, assets, presentation, gameplay, technical, migration, status gates.     | Blocks status advancement                         |
| **Generation**       | Seed determinism, density, adjacency, placement, routes, spawn, progression, fallback, diversity. | Error for invalid world; report for quality       |
| **Runtime**          | Save/load, simulation LOD, authority, transactions, event/state transitions, recovery.            | Release blocker                                   |
| **Quality**          | Performance, accessibility, representation, localisation, player trust, fun and balance.          | Human and automated release gate                  |

# 42. Schema, Reference, Namespace, and Dependency Validation

- Every definition validates against an explicit schema version and registered parent type.

- No duplicate IDs, localisation keys, aliases, protected namespace writes, or unresolved hard references.

- Content-pack dependency graphs must be acyclic for hard dependencies and deterministic in load order.

- Every capability requirement resolves to at least one eligible provider in each supported world preset or to a declared fallback.

- Deprecated definitions provide replacement, conversion, tombstone or explicit incompatibility policy.

- Reverse-reference reports show which content, saves and packs will be affected before deletion or schema change.

- POC namespaces are blocked from Core Production and normal world-generation manifests.

# 43. Semantic, Relationship, Completeness, and Representation Validation

| **Test Family**             | **Example Failure**                                                                                                                  |
|-----------------------------|--------------------------------------------------------------------------------------------------------------------------------------|
| **World Coherence**         | Desert glacier adjacency without climate, altitude, magic or catastrophe explanation.                                                |
| **Capability Completeness** | Settlement has no water access, storage, housing, route or alternative survival model.                                               |
| **Ecology Coherence**       | Predator spawns without prey or substitute food; pollination-dependent flora lacks pollinator.                                       |
| **Civilisation Coherence**  | Culture exports a good with no material source or production structure.                                                              |
| **Dungeon Coherence**       | Site has builder and loot but no valid entrance, route, occupants, purpose or state behaviour.                                       |
| **Boss Coherence**          | Boss has arena and drops but no territory, discovery, world role, aftermath or alternative outcomes.                                 |
| **Narrative Coherence**     | Event targets a destroyed settlement, unavailable resource or faction that never existed.                                            |
| **Representation**          | An ancestry is automatically hostile, primitive, criminal, biologically restricted to a culture, or denied personhood by appearance. |
| **Player Trust**            | Irreversible punishment occurs without warning, cause, agency, settings or recovery path.                                            |

# 44. Seed, Worldgen, Progression, and Fallback Validation

| **Test Suite**               | **Minimum Coverage**                                                                                                                                   |
|------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Determinism**              | Same seed, world profile, generation version and pack manifest produce identical definition selections and stable world relationships.                 |
| **Diversity**                | Large seed batches show meaningful regional, cultural, ecological, dungeon, boss, history and realm variation without invalid rarity clustering.       |
| **Spawn and Early Survival** | Every eligible start has readable shelter/resource routes, hazard escape, building area, and at least one discoverable progression direction.          |
| **Progression Reachability** | Tools, materials, knowledge, settlements, magic, automation, dungeons, bosses and realm access have valid paths or substitutes.                        |
| **Route Connectivity**       | Settlements, key resources, dungeons, portals and regional services are not isolated by impossible topology.                                           |
| **Content Density**          | Worlds preserve wilderness and building space while meeting minimum discovery and civilisation distribution.                                           |
| **Fallback Repair**          | Missing preferred content selects compatible substitutes, relocates optional sites, generates clues/trade routes, or reports a controlled world error. |
| **World Upgrade**            | Adding a content pack does not rewrite explored land silently and provides valid discovery routes for new content.                                     |

# 45. Performance, Simulation LOD, Streaming, and Persistence Budgets

| **Budget Area**             | **Direction**                                                                                                                              |
|-----------------------------|--------------------------------------------------------------------------------------------------------------------------------------------|
| **Definition Memory**       | Load compact immutable registries; stream heavy assets and optional descriptive data by domain/region.                                     |
| **Active Actors**           | Budget creatures, NPCs, projectiles, effects and interactive structures per player vicinity; ecology and settlement managers enforce caps. |
| **Distant Simulation**      | Use region, settlement, route, ecology, dungeon, boss and realm summaries with bounded ticks and explicit promotion/demotion.              |
| **Worldgen Work**           | Stage deterministic generation asynchronously, cache validated manifests, limit per-frame work, and surface diagnostic progress.           |
| **Structures and Dungeons** | Store compact blueprints/modules and state deltas rather than permanent actors for every block or room.                                    |
| **Automation and Magic**    | Use network graphs and integer transactions; render visible movement locally and aggregate at distance.                                    |
| **Saves**                   | Seed plus delta with journals, backups, migrations, content manifest, unresolved reference report and recovery snapshots.                  |
| **Multiplayer**             | Server/host authoritative content manifest, generated bindings, inventory transactions, combat, events, ownership and state changes.       |
| **Budgets as Data**         | Every major definition declares simulation class, expected density, rendering cost, memory class, save size and network relevance.         |

# 46. Asset, Variant, Animation, Audio, and VFX Budgets

| **Asset Family**            | **Budget Strategy**                                                                                                                                                     |
|-----------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Terrain/Block Materials** | Build palette families and state masks that generate slabs/stairs/shapes and regional variants without unique textures for every block.                                 |
| **Culture Architecture**    | Reusable structural kits plus culture/environment/material modifiers; signature civic, sacred and wonder pieces remain bespoke.                                         |
| **Creatures**               | Body-plan families, shared skeletons and locomotion sets; reserve unique rigs for signature species, bosses and physically different beings.                            |
| **Dungeons**                | Room and prop kits with strong origin/culture/state identity; avoid random kitbashing that removes readability.                                                         |
| **Bosses**                  | High presentation budget with reusable mechanic/effect modules; each still requires distinctive silhouette, telegraphs, audio, territory evidence and aftermath assets. |
| **Animation**               | Prioritise locomotion, interaction, jobs, combat readability and state transitions before cosmetic emote breadth.                                                       |
| **Audio/VFX**               | Use layered families with sockets and scalable intensity; never rely on colour or loudness alone for gameplay-critical information.                                     |
| **Icons/UI**                | Generate consistent icon families from Forge snapshots where possible, then review silhouettes and readability at target sizes.                                         |
| **Source Control**          | Every shipped asset records source project, licence/provenance, dependencies, export settings, version and owning definition.                                           |

# 47. Localisation, Accessibility, Safety, and Player-Trust Requirements

- All player-facing text uses localisation keys; generated names support grammar, culture rules, fallback fonts and pronunciation metadata where practical.

- Content cannot require colour perception, precise audio recognition, rapid repetitive input, unreadable particle density, or one control scheme without alternatives.

- Bosses, hazards, portals and irreversible state changes provide readable warnings, configurable difficulty and recovery where compatible with the world fantasy.

- Generated history and cultures must not produce demeaning real-world analogues through careless trait combinations; sensitive templates require review.

- Codex and rumours distinguish developer truth, character belief, propaganda, uncertainty and player discovery.

- Dynamic events avoid deceptive urgency, dark-pattern engagement loops, forced daily attendance or punishment for normal breaks from play.

- Multiplayer ownership, consent, permissions, contribution and destructive actions are visible and authoritative.

# 48. Save Versioning, Content Migration, and Removed-Content Recovery

| **Migration Concern**      | **Required Behaviour**                                                                                                                  |
|----------------------------|-----------------------------------------------------------------------------------------------------------------------------------------|
| **Definition Rename**      | Alias old ID to new ID without changing instance history or player-facing provenance.                                                   |
| **Definition Split/Merge** | Migration script maps old instances, inventory, structures, history and relationships to compatible replacements.                       |
| **Pack Removal**           | Warn before load; convert to fallback/tombstone where safe; preserve unknown payload for potential reinstall.                           |
| **Schema Change**          | Versioned migration transforms definitions and runtime records; never silently discard fields.                                          |
| **Worldgen Version**       | Explored chunks remain stable; unexplored generation may use new version under manifest rules; routes to new content are explicit.      |
| **Removed Unique Content** | Preserve historical record, memorial, placeholder object or recovery quest according to design; never duplicate unique rewards.         |
| **Failed Migration**       | Do not overwrite the last good save; create report, backup, recovery option and diagnostic package.                                     |
| **Multiplayer**            | Host migration completes before clients join; clients use compatible registry/assets and cannot authoritatively invent missing content. |

# 49. POC Retirement and Legacy Cleanup Plan

| **Cleanup Area**  | **Required Action**                                                                                                                                                             |
|-------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Content IDs**   | Mark all Forest Hamlet NPCs, local factions, POC valley biomes, fixed cave, rune clearing, goblin camp, watchtower project, raid captain and related named rewards as Archived. |
| **Worldgen**      | Remove coordinates, guaranteed proximity, fixed relationship anchors, scripted day counts, fixed spawn resources and tutorial-only placement rules.                             |
| **Quests/Events** | Remove mandatory watchtower and goblin-raid chain; retain request, project, warning, raid, ward, defence and aftermath mechanics as generic systems.                            |
| **Registries**    | Replace POC Required planning tags with production tier/status fields; block archived IDs from normal content packs.                                                            |
| **Assets**        | Retain useful generic models/textures only after renaming and relinking to production families; delete no source asset required by archived regression tests.                   |
| **Code**          | Search for literals, enum branches, coordinates, names, resource IDs, timing, spawn counts and fallback assumptions tied to POC.                                                |
| **Tests**         | Preserve the POC as a regression scenario in an archive/test pack, while adding production seed suites that prove no dependency on it.                                          |
| **Documentation** | Mark POC examples as historical validation examples and point active production sections to Document Set 24.                                                                    |

# 50. Main Document Revision Roadmap

| **Document**                           | **Priority Revision**                                                                                                                                                         |
|----------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **00 Master Game Design Bible**        | Add post-POC production phase, Atlas authority, random seed world promise, content relationship rule, and remove POC as active scope.                                         |
| **01 Core Gameplay Loop**              | Replace fixed opening/village examples with seed-adaptive discovery, generated settlements, substitute progression and dynamic threats.                                       |
| **02 Player Progression**              | Map progression to Atlas capabilities, regional substitutes, culture/faction learning, multiple dimensions and world-state outcomes.                                          |
| **03 Blocks Registry**                 | Massive Atlas-driven expansion after Core Production classification; add full environment, culture, realm, structure, dungeon, resource and state families.                   |
| **04 Items Registry**                  | Massive Atlas-driven expansion paired with Blocks; include all selected resources, culture goods, creature materials, loot, relics, tools, gear, knowledge and realm content. |
| **05 Crafting/Recipe Registry**        | Generate complete selected production chains, substitutions, culture recipes, settlement projects, dungeon restoration, boss preparation and realm systems.                   |
| **06 Resource Progression**            | Replace predominantly fixed ladder with branched regional, trade, salvage, magic, creature, automation and realm pathways.                                                    |
| **07 NPC Village System**              | Remove named Forest Hamlet roster; integrate 24E cultures/factions/settlements and the later settlement-needs/staging documents.                                              |
| **08 Automation**                      | Replace POC iron-watchtower chain with generic capability-based production and settlement contracts across cultures/realms.                                                   |
| **09 Magic**                           | Replace POC mana-furnace/ward path with selected schools, cultures, resources, sites, realms and infrastructure packages.                                                     |
| **10 Creatures and Monsters**          | Use 24F as roster/ecology authority; remove fixed POC creature set and update AI/drop/biome links.                                                                            |
| **11 Biomes and World Generation**     | Use 24A-24D; remove POC valley and guaranteed relationships; rewrite worldgen for seed-derived production worlds.                                                             |
| **12 Structures**                      | Use 24G/24I; remove fixed valley structures; integrate modules, routes, wonders, states, ownership and restoration.                                                           |
| **13 Races/Peoples/Cultures/Factions** | Use 24E identity stack and representation rules; expand final cultures after production classification.                                                                       |
| **14 Dimensions**                      | Use 24D and selected release realm packages; remove POC teaser assumptions from production progression.                                                                       |
| **15 Quest/Event**                     | Use 24K arc/event/state registries and generated participant binding.                                                                                                         |
| **16 Combat/Gear/Defence**             | Bind 24F/24H encounters, terrain, settlements, alternative outcomes and aftermath.                                                                                            |
| **17 UI/UX**                           | Add Atlas browser/Codex, knowledge certainty, world chronicle, registry diagnostics for development, realm maps, event/state presentation.                                    |
| **18 Technical Plan**                  | Complete rewrite for Godot/Summer Engine using 24L schemas, importers, validators, world manifests, saves, LOD, authority and roadmap.                                        |

# 51. Godot/Summer Engine Implementation Roadmap

| **Implementation Layer**   | **Recommended Direction**                                                                                                                                           |
|----------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Definition Resources**   | Typed Godot Resource or validated external data definitions generated from schemas; immutable at runtime.                                                           |
| **Registry Service**       | Central service resolves IDs, aliases, parent/composition, tags, capabilities, localisation, pack ownership and production status.                                  |
| **Relationship Graph**     | Indexed typed edges and query API; supports reverse lookup, suitability, exclusion, generated binding and diagnostics.                                              |
| **World Manifest**         | Seed, profile, generation version, pack list/hashes, selected definitions, realm graph, world history summary and migration chain.                                  |
| **Generation Pipeline**    | Deterministic staged jobs for topology, climate, biomes, regions, history, societies, ecology, routes, structures, sites, threats, resources and validation repair. |
| **Runtime Records**        | Compact save records for world instances and state; actors/nodes are presentations of persistent records rather than source of truth.                               |
| **Simulation LOD**         | Managers for regions, settlements, ecology, routes, automation, dungeons, bosses, events and realms; explicit detail promotion/demotion.                            |
| **Editor Tooling**         | Registry browser, graph inspector, definition editor, content-pack manager, seed viewer, validation report, migration preview and POC-reference scanner.            |
| **Summer Engine Workflow** | Break implementation into bounded tasks with source documents, acceptance tests, changed files, validation commands and rollback notes.                             |
| **CI and Testing**         | Schema/reference validation, deterministic seed snapshots, save migrations, unit/integration tests, performance baselines and packaged-build smoke tests.           |

# 52. Risk Register and Redesign Triggers

| **Risk**                  | **Early Warning**                                                       | **Mitigation / Redesign Trigger**                                                                |
|---------------------------|-------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------|
| **Atlas Scope Explosion** | Many foundations stay Foundation status while few become Integrated.    | Freeze new entries; select smaller vertical packages; measure validated completion.              |
| **Registry Duplication**  | Same truth appears in multiple files with different values.             | Enforce canonical ownership, generated references and lint duplicate fields.                     |
| **Tag-Only Generation**   | Worlds are technically valid but causally incoherent.                   | Add typed capabilities, semantic rules, history explanations and seed review.                    |
| **Asset Backlog**         | Selected content requires too many unique models/textures/animations.   | Reduce milestone scope, invest in reusable kits, or redesign content family for composition.     |
| **Worldgen Dead Ends**    | Seeds lack progression, routes or survival providers.                   | Capability-based fallback, substitute paths, repair generation, block release on failures.       |
| **Simulation Overload**   | NPCs, ecology, automation and events exceed frame/save budgets.         | Tighten density, LOD, tick schedules, aggregation and persistence records.                       |
| **Save Fragility**        | Content updates break IDs or rewrite generated worlds.                  | Versioned manifests, aliases, migrations, backups, unexplored-region rules and recovery.         |
| **POC Leakage**           | Fixed names/locations or assumptions reappear in production code.       | Automated scan, namespace block, test worlds, code review and archive isolation.                 |
| **Shallow Dimensions**    | Realm is one biome, resource and boss.                                  | Do not classify as playable major realm until full package contract passes.                      |
| **Procedural Blandness**  | Variants feel like recolours and repeated kits.                         | Strengthen history, culture, ecology, mechanics, signatures, rarity and state combinations.      |
| **Representation Harm**   | Generated societies produce stereotyping or personhood errors.          | Protected constraints, sensitive-template review, counterexample seed tests and human authority. |
| **AI Hallucinated Links** | Automated authoring creates unsupported or contradictory relationships. | Schema-grounded prompts, source citation, validators and human review before status advancement. |

# 53. Release Gates and Definition of Done

| **Gate**                      | **Required Result**                                                                                                                              |
|-------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------|
| **POC Removal**               | No production seed, registry, quest, event, worldgen rule, asset manifest or code branch depends on POC identities or fixed arrangements.        |
| **Registry Integrity**        | All Core Production definitions pass schema, namespace, reference, dependency, alias and pack validation.                                        |
| **Relationship Completeness** | Every selected biome, realm, culture, creature, site, boss, structure, material and event meets its package contract.                            |
| **World Generation**          | Representative seed suites are deterministic, diverse, traversable, progression-valid, performant and free of blocking repairs.                  |
| **Physical Content**          | Selected blocks, items, recipes, resources, structures, drops, loot and rewards exist and connect to real systems.                               |
| **Living Simulation**         | NPCs, settlements, ecology, automation, magic, threats, events and world states persist near and far.                                            |
| **Adventure**                 | Dungeons and bosses support discovery, preparation, multiple outcomes, rewards and persistent aftermath.                                         |
| **Presentation**              | Required Forge assets, animation, audio, VFX, icons, UI, map, Codex and accessibility metadata are integrated.                                   |
| **Technical Quality**         | Packaged Godot build meets performance, save, migration, crash recovery, authority, controller/touch and multiplayer requirements for milestone. |
| **Documentation**             | Source documents, registry snapshots, schemas, roadmap, change logs and known deferrals match the shipped build.                                 |
| **Human Approval**            | Ash approves milestone scope, creative direction, major design decisions and release readiness.                                                  |

# 54. Open Questions for Production Planning

- Which specific foundations from each Atlas registry form the Core Production slice?

- Which major dimension should be the first fully playable realm after classification, and which second realm receives teaser-only infrastructure?

- What hardware targets and active simulation budgets should the rewritten Technical Plan lock for Godot?

- How many content creators, AI agents, review roles and asset pipelines are realistically available per milestone?

- Which registries should be edited in spreadsheets, JSON/YAML, Godot Resources, custom Forge tools, or generated from one source schema?

- How much modding support belongs in the first public release versus later production?

- Which world settings may alter content density, danger, survival, permanent death, settlement consequence, invasions, event urgency and dimension accessibility?

- Which Atlas foundations remain concept-only until advanced water, sky, creature, physics, portal or large-world tooling is proven?

- What licensing and provenance policy will govern AI-assisted textures, sound, music, models, writing and code?

- What exact revision sequence should follow 24L: Atlas classification, Godot Technical Plan rewrite, Blocks Registry expansion, Items Registry expansion, or a dedicated production backlog document?

# Appendix A. Universal Atlas Definition Template

| **Field Group**   | **Template Fields**                                                                                                     |
|-------------------|-------------------------------------------------------------------------------------------------------------------------|
| **Identity**      | definition_id; display_name_key; aliases; domain; family; parent; namespace; source_pack; schema_version.               |
| **Planning**      | canonical_document; owner; production_tier; production_status; milestone; priority; risk; estimated effort.             |
| **Selection**     | scope; world_presets; rarity; weight; suitability; exclusions; uniqueness; density; fallback_group.                     |
| **Capabilities**  | provides; requires; consumes; produces; protects; threatens; teaches; unlocks; transforms.                              |
| **Relationships** | hard_links; soft_links; historical_links; generated_roles; reverse-link expectations; cardinality.                      |
| **Gameplay**      | world_role; player_interactions; progression_band; difficulty; rewards; failure; recovery; alternative outcomes.        |
| **Presentation**  | model/material/animation/audio/VFX/icon/map/codex manifests; accessibility metadata; state evidence.                    |
| **Runtime**       | resource_type; instance_record; allowed_states; transitions; LOD; streaming; authority; save; replication; budget.      |
| **Validation**    | schema_tests; semantic_tests; completeness_contract; seed_tests; performance; accessibility; representation; migration. |
| **Lifecycle**     | created; revised; deprecated; replacement; aliases; migration; archive_reason; release_notes.                           |

# Appendix B. Relationship and Capability Type Library

| **Type**                      | **Direction**                | **Typical Domains**                              | **Validation**                                               |
|-------------------------------|------------------------------|--------------------------------------------------|--------------------------------------------------------------|
| **contains / part_of**        | Directed inverse             | World, region, biome, site, structure            | No cycles where hierarchy forbids; geometry and scope valid. |
| **borders / transitions_to**  | Usually symmetric            | Biomes, regions, realms                          | Adjacency and transition explanation.                        |
| **inhabits / habitat_for**    | Directed inverse             | Creatures, cultures, biomes, dungeons            | Suitability, population, environment, personhood.            |
| **controls / controlled_by**  | Directed inverse             | Factions, settlements, sites, routes, resources  | Runtime mutable; law, territory, history and conflict hooks. |
| **produces / produced_by**    | Directed inverse             | Resources, structures, creatures, cultures       | Physical source, recipe/process, capacity and by-products.   |
| **consumes / consumed_by**    | Directed inverse             | Settlements, machines, recipes, creatures        | Supply, rate, substitution, shortage and economy.            |
| **requires_capability**       | Directed query               | All domains                                      | Provider exists in supported presets or fallback.            |
| **unlocks / unlocked_by**     | Directed inverse             | Progression, knowledge, realms, recipes          | Multiple routes where required; no dead end.                 |
| **threatens / threatened_by** | Directed inverse             | Creatures, bosses, factions, events, settlements | Motivation, warning, counterplay and aftermath.              |
| **evidence_of**               | Directed                     | History, rumours, sites, relics, states          | Evidence exists in world and respects knowledge uncertainty. |
| **uses_asset_family**         | Directed                     | All presented content                            | Asset resolves, licence/provenance valid, fallback approved. |
| **transforms_into**           | Directed state or definition | Biomes, structures, resources, creatures, events | Cause, conditions, persistence, migration and presentation.  |

# Appendix C. Master Cross-Link Matrix

| **Atlas Entry**         | **Environment**   | **Civilisation**      | **Ecology**          | **Site/Threat**        | **Structure/Route**    | **Material/Economy**  | **History/Event**      |
|-------------------------|-------------------|-----------------------|----------------------|------------------------|------------------------|-----------------------|------------------------|
| **Biome / Realm**       | Self/topology     | Suitability           | Habitat              | Placement/territory    | Build/network          | Sources/scarcity      | Past/state             |
| **Culture / Faction**   | Homeland/diaspora | Self/politics         | Use/fear/domesticate | Build/occupy/fight     | Architecture/routes    | Produce/consume/trade | Memory/arcs/events     |
| **Creature**            | Habitat           | Settlement relation   | Self/food web        | Nest/dungeon/boss hook | Damage/use/avoid       | Drops/needs           | Migration/outbreak     |
| **Dungeon / Site**      | Terrain/realm     | Builder/owner         | Occupants            | Self/boss              | Entrance/route/service | Loot/resources        | Origin/state/events    |
| **Boss / Threat**       | Territory         | Political/social role | Ecological role      | Lair/arena             | Siege/route effects    | Rewards/scarcity      | Discovery/aftermath    |
| **Structure / Route**   | Placement         | Builder/users         | Habitat/barrier      | Site/defence           | Self/network           | Costs/services/trade  | History/damage/rebuild |
| **Resource / Relic**    | Distribution      | Claims/value          | Biological source    | Loot/site source       | Extraction/storage     | Self/market           | Provenance/events      |
| **Arc / Event / State** | Location          | Participants          | Ecological cause     | Targets/encounters     | Damage/repair          | Shortage/reward       | Self/propagation       |

# Appendix D. Production Status and Gate Checklist

| **Gate Area**   | **Checklist**                                                                                                       |
|-----------------|---------------------------------------------------------------------------------------------------------------------|
| **Planning**    | Owner, tier, milestone, fantasy, world role, player experience, scope, dependencies and deferrals approved.         |
| **Data**        | Stable ID, schema, parent, tags, capabilities, relationships, states, localisation, content pack and aliases valid. |
| **Prototype**   | Complete interaction loop works with placeholder assets; failure, fallback, save, LOD and authority tested.         |
| **Assets**      | Models/voxels, textures/materials, animations, audio, VFX, icons, UI and source/provenance complete.                |
| **Integration** | Worldgen, systems, physical registries, economy, progression, quests/events, UI and persistence connected.          |
| **Validation**  | Automated tests, representative seeds, performance, accessibility, representation, migration and regression pass.   |
| **Release**     | Scope freeze, localisation, packaging, documentation, known issues, backups, rollback and Ash approval complete.    |

# Appendix E. Example Content-Pack Manifest

| **Manifest Field**    | **Example / Requirement**                                                       |
|-----------------------|---------------------------------------------------------------------------------|
| **pack_id**           | leyforge.core.production_01                                                     |
| **version**           | 0.1.0                                                                           |
| **schema_range**      | atlas \>= 1.0 \< 2.0                                                            |
| **namespaces**        | leyforge.core                                                                   |
| **hard_dependencies** | registry_kernel, blocks_core, items_core, recipes_core                          |
| **soft_dependencies** | forge_asset_pack_01, audio_pack_01, vfx_pack_01                                 |
| **definitions**       | Manifest lists domain files, hashes, counts, production tiers and status.       |
| **assets**            | Bundle paths, source manifests, licences/provenance, platforms, memory classes. |
| **localisation**      | Locales, fallback locale, generated-name rules and font coverage.               |
| **migrations**        | Supported previous versions, scripts, aliases, tombstones and rollback.         |
| **validation**        | Required validator version, passed suites, seed sample, performance baseline.   |
| **multiplayer**       | Authority compatibility, client presentation requirements and join validation.  |

# Appendix F. Atlas Set 24 Acceptance Criteria

| **Acceptance Area**          | **Pass Condition**                                                                                                                                                                      |
|------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Set Completion**           | Documents 24A-24L exist, are numbered correctly, and define a coherent post-POC production Atlas.                                                                                       |
| **POC Supersession**         | All volumes clearly archive demonstration content and prohibit normal generation dependencies on it.                                                                                    |
| **World Breadth**            | Overworld, special environments, dimensions, civilisations, ecology, dungeons, bosses, structures, resources, history and events are covered.                                           |
| **Registry Foundation**      | Stable IDs, domains, relationships, capabilities, statuses, packs, completeness and validation rules are defined.                                                                       |
| **Production Control**       | Budgets, milestone tiers, workflow, implementation sequence, risks and release gates are actionable.                                                                                    |
| **Cross-System Integration** | Blocks, items, recipes, NPCs, automation, magic, combat, quests, UI, Forge, audio, VFX, saves and Godot direction are mapped.                                                           |
| **Next-Step Readiness**      | The project can now classify the Core Production slice, rewrite the Godot Technical Plan, and begin the Atlas-driven Blocks and Items expansion without returning to fixed POC content. |

| **Document Set 24 Completion Statement** The World Content Atlas is now structurally complete at version 0.1. The next phase is not another broad Atlas volume. It is production classification, technical implementation planning for Godot/Summer Engine, automated registry tooling, and the deliberate conversion of selected Atlas foundations into blocks, items, recipes, assets, world generation, simulation, and tested playable content. |
|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

End of [[24L - Content Registry, Cross-Link Matrix, Budgets and Production Roadmap]] - World Content Atlas: Content Registry, Cross-Link Matrix, Budgets and Production Roadmap v0.1

---
## Navigation
- Previous: [[24K - World History, Story Arcs, Events and Dynamic World States Atlas|24K]]
- Index: [[00 - Document Set 24 Index]]
