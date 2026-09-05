# Fantasy Voxel Civilisation Sandbox

## 19 - Settlement Growth, District Planning and Player Voxel Blueprint System

*Version 0.1 - Detailed Design Bible Draft*

A database-ready settlement growth and voxel blueprint system for player-designed buildings, custom town styles, autonomous NPC construction, district planning, staged resource requirements, cultural variants, city-scale growth, sharing, and Godot implementation.

| **Field**                     | **Locked Direction**                                                                                                                                                                                                                                                                                                                                       |
|-------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Document Scope**            | Full settlement and player-blueprint design document covering two player creation modes, blueprint composition, construction stages, material palettes, functional markers, roads, districts, settlement growth, autonomous projects, NPC labour, permissions, sharing, persistence, Godot architecture, registries, POC scope, and implementation stages. |
| **Core Philosophy**           | The same blueprint foundation should serve players, NPC villages, developers, world generation, repairs, upgrades, and mods. Players can design in the active world or from the main-menu Blueprint Workshop, then use approved designs to build custom settlements or expand existing towns.                                                              |
| **Player Creation Direction** | Provide two first-class blueprint creators: an in-world designer that understands live terrain, ownership, warehouses, and construction; and a world-independent main-menu Blueprint Workshop for unrestricted planning, testing, library management, import/export, and style-pack creation.                                                              |
| **Settlement Direction**      | Settlements grow as dynamic networks of parcels, roads, buildings, clusters, districts, utilities, defences, and projects rather than one fixed city model. Growth progresses from Camp to Magical Metropolis through needs, resources, population, safety, jobs, culture, stories, infrastructure, and player influence.                                  |
| **Construction Direction**    | Blueprints use visible stages, exact resource requirements, supply reservations, scaffolds, builders, activation gates, damage states, repair plans, and upgrade paths. Nearby projects place real voxel blocks; distant projects progress through deterministic summaries and reconcile when loaded.                                                      |
| **Engine Direction**          | Implement in Godot using shared data and editor modules that power both player-facing creation modes. Summer Engine supports AI-assisted development. Document 18 remains useful for architecture principles, but its Unreal-specific direction must be revised separately.                                                                                |
| **POC Direction**             | Prove a Forest Hamlet watchtower plus one player-designed cottage: create the cottage in the main-menu Workshop, place it in-world, resolve a culture palette, calculate staged materials, supply it through storage, have NPC builders construct it, save/reload it, and make the completed building affect housing and village growth.                   |
| **Data Direction**            | Use stable IDs, versioned definitions, palette tokens, compressed voxel volumes, stage masks, markers, sockets, dependencies, validation rules, runtime project records, save migrations, script-free sharing packages, and clean separation between shipped gameplay data and planning metadata.                                                          |

# Document Purpose

This document defines how Leyforge settlements are planned, built, expanded, customised, damaged, repaired, and transformed from temporary camps into towns, cities, capitals, and magical metropolises. It also defines the player-facing voxel blueprint system that lets players create their own buildings, construction stages, style packs, districts, and settlement plans.

The blueprint tools are not developer-only utilities. The shipped game contains two connected creation experiences. The in-world designer plans against live terrain, roads, warehouses, permissions, and village needs. The main-menu Blueprint Workshop lets a player create and organise designs without loading a world, test material palettes and construction stages, assemble town packs, and import or export safe blueprint files.

This document expands the Master Game Design Bible, NPC Village System, Structures, Crafting and Recipe Registry, Biomes and World Generation, UI/UX System, Automation System, and Technical Implementation Plan. It becomes the source of truth for settlement growth, district planning, player-created blueprint content, and the boundary between creative freedom and simulation requirements.

# Design Source

| **Source Document**                            | **Relevant Direction**                                                                              | **How Document 19 Uses It**                                                        |
|------------------------------------------------|-----------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------|
| **00 - Master Game Design Bible**              | Living civilisations; block building, modular pieces, blueprints, NPC labour, and village projects. | Player creativity and NPC civilisation growth share one readable voxel foundation. |
| **01 - Core Gameplay Loop**                    | Explore, gather, craft, build, interact, automate, defend, upgrade, expand.                         | Settlement projects become visible loop milestones.                                |
| **03 - Blocks Registry**                       | One-metre grid, shape/material families, functional blocks, damage and repair states.               | Blueprint cells use IDs/tokens, shapes, rotations, states, and stages.             |
| **04 - Items Registry**                        | Villages consume real blocks, components, tools, magic stock, and culture goods.                    | Stages calculate exact items and tagged substitutions.                             |
| **05 - Crafting and Recipe Registry**          | ProjectRecipe stages, reservations, time, labour, consequences, automation.                         | Construction reuses authoritative recipe transactions.                             |
| **06 - Resource Progression**                  | Old materials stay useful; exact village consumption; automation scales supply.                     | Palettes preserve long-term demand for core materials.                             |
| **07 - NPC Village System**                    | Visible stages, Camp to Magical Metropolis, builders, warehouses, repairs, LOD.                     | Defines growth, project lifecycle, labour, influence, and simulation.              |
| **08 - Automation System**                     | Permissioned warehouse supply, reservations, distant summaries.                                     | Projects expose delivery, power, mana, and warehouse endpoints.                    |
| **09 - Magic System**                          | Wards, construction, portals, golems, mana networks, city infrastructure.                           | Blueprints include magic sockets, risks, and magical stages.                       |
| **11 - Biomes and World Generation**           | Terrain, roads, water, resources, culture, danger, and leylines shape settlements.                  | Site solvers and settlement plans adapt to world conditions.                       |
| **12 - Structures**                            | Generated structures, NPC projects, and player settlements share a blueprint foundation.            | Extends it into player creators, styles, districts, and city growth.               |
| **13 - Races, Peoples, Cultures and Factions** | Distinct materials, architecture, laws, traditions, stories, and identity.                          | Culture style kits alter palettes, forms, projects, and acceptance.                |
| **17 - UI/UX System**                          | World and planner blueprints show stages, conflicts, workers, variants, and permissions.            | Defines creation modes, feedback, controls, and dashboards.                        |
| **18 - Technical Implementation Plan**         | Stable IDs, persistent records, LOD, deterministic structures, migrations, validation.              | Retains principles while translating this system to Godot.                         |

# Static Table of Contents

- 1\. Locked Settlement and Blueprint System Identity

- 2\. Locked Decision Summary

- 3\. System Architecture

- 4\. Parent Definitions and Runtime Data Model

- 5\. Blueprint Taxonomy and Composition

- 6\. Dual Player Blueprint Creation Modes

- 7\. Blueprint Editing Tools and Interaction Grammar

- 8\. Voxel Blueprint Storage, Bounds, Layers, and Compression

- 9\. Material Tokens, Palettes, Style Kits, and Cultural Identity

- 10\. Construction Stages, Resource Requirements, and Project Recipes

- 11\. Functional Markers, Rooms, Jobs, Sockets, and Utilities

- 12\. Terrain Adaptation, Site Validation, and Foundations

- 13\. Roads, Parcels, Building Clusters, Districts, and Settlement Plans

- 14\. Settlement Growth Ladder and Stage Gates

- 15\. Autonomous Project Selection and Growth Planning

- 16\. NPC Construction, Labour, Logistics, and Activation

- 17\. Player Influence, Permissions, and Existing-Town Integration

- 18\. Player-Founded Settlements and Custom Town Styles

- 19\. Blueprint Libraries, Packs, Dependencies, and Versioning

- 20\. Import, Export, Sharing, Mods, and Safety

- 21\. Damage, Repair, Renovation, Upgrades, and Replacement

- 22\. Automation, Magic, Defence, and Megaproject Integration

- 23\. Persistence, Simulation LOD, Determinism, and Multiplayer Authority

- 24\. Godot and Summer Engine Technical Architecture

- 25\. UI/UX Screens, Flows, Feedback, and Accessibility

- 26\. Content Production Strategy and Blueprint Scale Targets

- 27\. Proof-of-Concept Scope and Explicit Deferrals

- 28\. Staged Implementation Plan

- 29\. Detailed Blueprint and Settlement Registry v0.1

- 30\. Sample Detailed Blueprint Entries

- 31\. Sample Settlement Stage Definitions

- 32\. Core POC Scenario: Player Cottage and Forest Hamlet Growth Loop

- 33\. Balancing and Player-Freedom Rules

- 34\. Open Questions and Deferred Production Decisions

- Appendix A. POC Checklist

- Appendix B. Database Field Templates

- Appendix C. Blueprint Validation Rule Set

- Appendix D. Initial Blueprint Production Backlog

- Appendix E. Cross-System Requirement Matrix

- Appendix F. POC Success Criteria

- Appendix G. Naming, Folder, and Package Conventions

# 1. Locked Settlement and Blueprint System Identity

The Settlement Growth and Player Voxel Blueprint System is the civilisation-building layer that connects voxel creativity with a living world. It controls how buildings are designed, how materials and stages are calculated, how NPCs construct them, how roads and districts emerge, how settlements choose projects, and how players create custom architectural identities without breaking simulation rules.

> **Locked Rule**
>
> Any building or settlement plan used by NPCs must remain editable, inspectable, stage-based, resource-conserving, and compatible with the voxel world. Any player blueprint that enters simulation must declare enough functional information for NPCs, roads, navigation, storage, safety, jobs, utilities, damage, and future upgrades to understand it.

| **Identity Layer**           | **Design Meaning**                                                                                          | **Player-Facing Result**                                         |
|------------------------------|-------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------|
| **Player Creativity**        | Players design buildings, modules, districts, and complete town styles in-world or from the main menu.      | Custom settlements feel authored rather than limited to presets. |
| **Living Construction**      | Blueprints become staged projects that reserve resources and employ visible NPC builders.                   | A building is earned through supply and labour.                  |
| **Settlement Intelligence**  | Villages evaluate needs, terrain, roads, costs, culture, danger, and growth gates.                          | NPC settlements feel semi-autonomous and responsive.             |
| **Civilisation Progression** | Camp through Magical Metropolis use distinct requirements and project pools.                                | Growth has readable milestones and increasing complexity.        |
| **Cultural Identity**        | Palettes, shapes, decoration, layouts, laws, and signature structures create culture-specific settlements.  | Different peoples create distinct silhouettes and behaviours.    |
| **System Interconnection**   | Blueprints expose jobs, storage, automation, mana, defence, roads, rooms, and story markers.                | Buildings unlock real functions.                                 |
| **World Memory**             | Projects can be delayed, damaged, burned, corrupted, repaired, renovated, occupied, abandoned, or upgraded. | Settlements visibly remember events.                             |
| **Scalable Simulation**      | Nearby construction places real blocks; distant construction uses deterministic summaries.                  | Large worlds can contain growing civilisations.                  |

## 1.1 Design Promise

A player should be able to create a cottage, save it as a reusable blueprint, define how it is built, assign a cultural style, place it inside a custom settlement, submit it to an existing village, watch builders consume the listed materials, and later see it damaged, repaired, occupied, upgraded, and connected to roads and utilities. The same foundation must scale from a market stall to a district, castle, portal complex, floating city, or civilisation wonder.

## 1.2 What This System Is Not

- It is not a developer-only Godot editor that players never see.

- It is not a single fixed town blueprint that replaces the settlement whenever a stage advances.

- It is not unrestricted voxel paste that ignores resources, terrain, navigation, ownership, or progression.

- It does not require a unique hand-built copy of every structure for every material, biome, culture, and damage state.

- It is not a city simulator that removes block-by-block building freedom.

- It does not assume every imported blueprint is trusted, balanced, buildable, or multiplayer-safe.

# 2. Locked Decision Summary

| **Area**                       | **Locked Decision**                                                                                                                                                   |
|--------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Core Model**                 | One shared blueprint foundation for player designs, NPC projects, world structures, repairs, upgrades, and developer content.                                         |
| **Player Creation Modes**      | Both an in-world designer and a main-menu Blueprint Workshop are first-class features.                                                                                |
| **Tool Parity**                | Both modes use the same editing, validation, stage, marker, palette, and serialisation services.                                                                      |
| **In-World Strength**          | Live terrain, structures, roads, warehouses, permissions, stock, village needs, and real conflicts.                                                                   |
| **Main-Menu Strength**         | World-independent test plots, unrestricted iteration, libraries, batch variants, style packs, and import/export.                                                      |
| **Design Cost**                | Drafting costs no resources. Placement and construction in survival consume real materials and respect unlocks.                                                       |
| **Unknown Content**            | Locked references remain unresolved until unlocked; spoiler-sensitive content is hidden by default.                                                                   |
| **Blueprint Scale**            | Micro objects, rooms, buildings, clusters, infrastructure, districts, settlement plans, fortifications, megaprojects, and wonders.                                    |
| **Settlement Form**            | Cities grow from roads, parcels, project pools, districts, utilities, and upgrade chains rather than one rigid paste.                                                 |
| **Growth Ladder**              | Camp -\> Hamlet -\> Village -\> Fortified Village -\> Town -\> City -\> Capital -\> Magical Metropolis.                                                               |
| **Independent Growth**         | NPC settlements progress without the player, but slowly and with resource, specialist, risk, and story limits.                                                        |
| **Player Acceleration**        | Supply, automation, trade, protection, specialists, research, roads, magic, and submitted blueprints accelerate growth.                                               |
| **Existing Town Integration**  | Players can propose designs, add them to project pools, reserve plots, supply projects, or replace eligible families under local rules.                               |
| **Player-Founded Settlements** | Broader control over packs, districts, priorities, permissions, style blending, and approvals.                                                                        |
| **Construction**               | Visible stage masks, exact costs, reservations, scaffolds, worker tasks, activation gates, finish stages, and maintenance.                                            |
| **Resource Calculation**       | Count cells/components, resolve tokens through a palette, then apply terrain, waste, quality, difficulty, and substitution rules.                                     |
| **Material System**            | Semantic tokens such as wall_primary and roof_primary avoid hard-coding every material.                                                                               |
| **Culture System**             | Style kits control palettes, shapes, decorations, roads, density, landmarks, approval tolerance, and signature projects.                                              |
| **Terrain**                    | Blueprints declare flat, levelled, stepped, stilted, retained, carved, bridge, floating, underwater, or reject-site rules.                                            |
| **Functional Data**            | Doors, beds, workstations, inventories, rooms, jobs, navigation, guards, interactions, automation, power, mana, water, and road sockets.                              |
| **Sharing**                    | Data-only script-free packages with manifests, versions, hashes, limits, content flags, and server approval.                                                          |
| **Damage and Upgrades**        | Masks and transitions support damage, repair, renovation, replacement, vertical growth, and footprint expansion.                                                      |
| **Simulation LOD**             | Detailed nearby; project summaries at medium distance; settlement/district aggregates at long range.                                                                  |
| **Persistence**                | Definitions are versioned; saves store IDs, transforms, palette, progress, substitutions, damage, ownership, and deltas.                                              |
| **Godot Direction**            | Shared runtime/editor modules in the shipped Godot game; internal mode adds diagnostics rather than exclusive capabilities.                                           |
| **POC**                        | Main-menu cottage design -\> in-world placement -\> palette -\> stage costs -\> warehouse -\> NPC build -\> housing effect -\> save/reload, plus the watchtower loop. |

# 3. System Architecture

The system is divided into definition data, runtime world records, editing services, construction services, settlement planning, and presentation. Definitions describe what a blueprint means; runtime records describe what is happening in a save; services validate and transform data; the voxel world remains authoritative for placed blocks.

| **Layer**                      | **Purpose**                                                                                                                   | **Examples**                                       |
|--------------------------------|-------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------|
| **Blueprint Definition Layer** | Immutable cells, stages, markers, sockets, palettes, tags, dependencies, validation, and upgrades.                            | Cottage, tower, road, city gate.                   |
| **Style and Palette Layer**    | Material tokens, culture kits, biome variants, roofs, trims, decoration, and substitutions.                                   | Forest timber, dwarven stone, fae livingwood.      |
| **Settlement Planning Layer**  | Stage definitions, district templates, parcel rules, road graphs, project pools, scoring, and growth gates.                   | Hamlet plan, market district, fortified perimeter. |
| **Project Runtime Layer**      | Site, stage progress, reservations, workers, blockers, activation, damage, and history.                                       | Cottage project at parcel A-12.                    |
| **Editor Core**                | Shared commands for placement, selection, copy, fill, layers, stages, markers, undo, validation, preview, import, and export. | Used by both player creation modes.                |
| **Construction Service**       | Turns stages into reservations, worker batches, voxel transactions, scaffolds, and completion events.                         | Foundation, frame, roof, furniture.                |
| **Settlement Simulation**      | Evaluates population, needs, jobs, safety, roads, culture, resources, threats, stories, and project choices.                  | Granary before monument during shortage.           |
| **Voxel World Adapter**        | Reads terrain, validates support, writes blocks, records deltas, crosses chunks, and reconciles distant progress.             | Applies completed stage cells.                     |
| **UI / View Models**           | Expose conflicts, costs, permissions, workers, effects, and history without owning state.                                     | Workshop, planner, project screen.                 |
| **Sharing / Package Layer**    | Serialises data-only packages, manifests, previews, dependencies, compatibility, and security validation.                     | Local library, server pack, content pack.          |

## 3.1 Core State Ownership

- The Blueprint Registry owns validated immutable definitions and version mappings.

- The Settlement Record owns stage, population, districts, project pools, laws, and culture state.

- The Project Record owns one active construction, repair, upgrade, relocation, or demolition project.

- Warehouse and Inventory systems own real resources and reservations.

- The Voxel World owns placed blocks and terrain changes.

- NPC runtime records own builder identity, tasks, tools, skills, and carried items.

- The host/server validates all persistent edits, reservations, placements, and imported packages in multiplayer.

## 3.2 Shared Editor Core Requirement

> **Non-Negotiable Architecture Rule**
>
> The in-world designer and main-menu Blueprint Workshop must call the same edit-command, validation, stage, palette, marker, and serialisation services. Two unrelated editors would create inconsistent files and duplicated maintenance.

# 4. Parent Definitions and Runtime Data Model

| **Definition / Record**         | **Role**                                          | **Core Contents**                                                                                 |
|---------------------------------|---------------------------------------------------|---------------------------------------------------------------------------------------------------|
| **BlueprintDefinition**         | Base record for every reusable design.            | ID, category, bounds, pivot, cells, stages, tokens, markers, tags, rules, variants, dependencies. |
| **BlueprintCellVolume**         | Compact voxel and shape data.                     | Palette index, coordinate, shape, rotation, state, stage, optional flags.                         |
| **ConstructionStageDefinition** | One visible project phase.                        | Order, cells/components, resources, labour, tools, activation, scaffold rules.                    |
| **MaterialTokenDefinition**     | Semantic construction role.                       | wall_primary, beam_structural, roof_primary, foundation_primary.                                  |
| **MaterialPaletteDefinition**   | Resolves tokens to block/item IDs or tags.        | Oak/fieldstone/thatch; granite/iron/slate.                                                        |
| **CultureStyleKit**             | Architecture and settlement identity rules.       | Palettes, shapes, density, roofs, roads, ornaments, project preferences.                          |
| **MarkerDefinition**            | Functional point, area, room, route, or socket.   | Door, bed, workstation, road socket, guard post, mana input.                                      |
| **DistrictTemplateDefinition**  | Project pool and layout logic for a district.     | Residential, agricultural, market, military, magical.                                             |
| **SettlementStageDefinition**   | Growth gate and unlocked systems.                 | Population, housing, food, safety, specialists, projects, trade, utilities.                       |
| **SettlementPlanDefinition**    | High-level dynamic town plan.                     | Centre, roads, districts, perimeter, expansion sectors, landmarks, style.                         |
| **ProjectDefinition**           | Construction-facing recipe and consequence layer. | Blueprint, stages, inputs, labour, time, ownership, risks, activation.                            |
| **BlueprintPackageManifest**    | Import/export and dependency metadata.            | Package, version, game/schema, dependencies, hashes, flags, previews.                             |
| **RuntimeProjectRecord**        | Mutable save data for one project.                | Site, orientation, palette, stage, reservations, workers, blockers, damage.                       |
| **RuntimeStructureRecord**      | Mutable completed-structure state.                | Owner, occupants, jobs, utilities, condition, upgrades, history, deltas.                          |
| **RuntimeSettlementRecord**     | Mutable civilisation state.                       | Stage, population, districts, roads, needs, projects, style, laws, history.                       |

## 4.1 Definitions Versus Save Data

Definitions are reusable and mostly immutable. Saves should not duplicate an entire blueprint for every placed building. They store the stable ID and version, transform, selected palette, resolved substitutions, construction state, damage, ownership, and a compact delta for player modifications.

## 4.2 Planning Metadata

POC Required, Alpha, Beta, Final Game, Placeholder, Deprecated, Internal Test, Player-Created, Imported, Approved, and Server-Allowed are planning or library states rather than permanent gameplay properties unless explicitly required at runtime.

# 5. Blueprint Taxonomy and Composition

| **Type**                     | **Typical Scale**                   | **Examples**                                                   | **Composition Rule**                         |
|------------------------------|-------------------------------------|----------------------------------------------------------------|----------------------------------------------|
| **Micro Blueprint**          | 1-5 m footprint                     | Furniture groups, stalls, lamps, wells, machines, decorations. | Placed directly or nested.                   |
| **Room Module**              | Small interior volume               | Bedroom, forge bay, shopfront, storage room, stair core.       | Nested, rotated, mirrored, palette-resolved. |
| **Building Blueprint**       | One functional structure            | Cottage, workshop, barn, inn, tower, warehouse.                | Primary construction project unit.           |
| **Building Family**          | Related upgrade/variant set         | Small/medium/large cottage; wooden/stone tower.                | Shared markers and upgrade links.            |
| **Cluster Blueprint**        | Several buildings and shared space  | Farmstead, market square, guard compound.                      | Creates parcels, paths, and project order.   |
| **Infrastructure Blueprint** | Linear or networked construction    | Road, bridge, wall, aqueduct, sewer, rail, conduit.            | Segment and socket rules.                    |
| **District Template**        | Neighbourhood-scale rules           | Residential, agricultural, market, military, magical.          | Project pools, density, roads, services.     |
| **Settlement Plan**          | Whole-settlement planning logic     | Custom town, forest village, dwarven hold, river city.         | Dynamic framework, not rigid paste.          |
| **Fortification Plan**       | Perimeter and defence system        | Palisade, wall, gates, towers, trenches, wards.                | Fits terrain and threat approaches.          |
| **Megaproject**              | Multi-site or multi-stage project   | Castle, cathedral, portal complex, floating district.          | Dependencies, districts, supply, politics.   |
| **Wonder**                   | Unique civilisation-scale structure | World tree city, celestial engine, sky citadel.                | Endgame world-state project.                 |

## 5.1 Nested Composition

A large blueprint can reference smaller blueprints rather than flattening everything immediately. A town hall may contain a stair-core module, council chamber, archive room, banner set, and roof family. Validation resolves these references deterministically and rejects circular dependencies.

## 5.2 Optional and Weighted Parts

Blueprints can contain optional modules or weighted choices such as chimney side, roof dormer, garden, culture banner, rear storage lean-to, or defensive shutters. Variation must never block required doors, paths, jobs, rooms, utilities, or upgrade space.

# 6. Dual Player Blueprint Creation Modes

Players receive two ways to create and design blueprints. They are different entry points into the same system rather than separate file formats.

| **Mode**                         | **Access**                                           | **Context Strengths**                                                                                                                | **Primary Uses**                                                                                            |
|----------------------------------|------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------|
| **In-World Blueprint Designer**  | While a world is loaded.                             | Reads live terrain, buildings, parcels, ownership, roads, utilities, warehouses, stock, laws, and NPC needs.                         | Place a project, scan a structure, redesign a plot, propose a village build, repair or upgrade a live site. |
| **Main-Menu Blueprint Workshop** | From the main menu without loading a survival world. | Clean test plots, terrain presets, lighting, palette and stage simulation, libraries, variants, import/export, linked-world filters. | Create libraries, style packs, districts, settlement plans, or shareable packages.                          |

## 6.1 In-World Blueprint Designer

- Enter Draft Mode from the build menu, drafting table, settlement planner, or authorised project board.

- Choose an empty site, parcel, selected structure, or scanned block volume.

- Design with ghost blocks and markers without consuming materials.

- Preview levelling, foundations, roads, utilities, obstruction, ownership, stock, and village approval.

- Show known and available materials first; locked references remain visible with warnings.

- Save as a personal draft, place a project, submit to a village, attach to a district, or export.

- Convert a player-built structure into a blueprint after selecting bounds, pivot, stages, tokens, and markers.

## 6.2 Main-Menu Blueprint Workshop

- Open from Main Menu -\> Blueprint Workshop without selecting a world.

- Create or load a blueprint, room, cluster, district, style kit, or settlement-plan project.

- Use flat, hillside, riverbank, swamp, cave, cliff, floating, underwater, and custom test plots.

- Preview day/night, weather, seasons, biome lighting, culture palettes, damage states, and construction stages.

- Run support, entrance, path, room, job, bed, utility, upgrade, and dependency checks.

- Link a world profile to filter discovered content or use design-all mode with spoiler controls.

- Create collections and custom town packs, then choose which designs NPC planners may use.

## 6.3 Mode Parity and Differences

| **Capability**                                                  | **In-World**   | **Main-Menu Workshop**  |
|-----------------------------------------------------------------|----------------|-------------------------|
| **Voxel placement, shapes, rotation, fill, mirror, copy, undo** | Yes            | Yes                     |
| **Stage painting and resource calculation**                     | Yes            | Yes                     |
| **Markers, sockets, rooms, path tests**                         | Yes            | Yes                     |
| **Palette and culture preview**                                 | Yes            | Yes                     |
| **Live terrain and settlement laws**                            | Yes            | Test profiles only      |
| **Actual warehouse availability**                               | Yes            | Simulated               |
| **Immediate project placement**                                 | Yes            | No                      |
| **Batch variants and library administration**                   | Limited        | Full                    |
| **Package import/export and dependency repair**                 | Library access | Primary workflow        |
| **Large settlement-plan editing**                               | Planning map   | Full overhead workspace |

# 7. Blueprint Editing Tools and Interaction Grammar

| **Tool**                   | **Purpose**                                                                                          |
|----------------------------|------------------------------------------------------------------------------------------------------|
| **Place / Paint**          | Place one voxel, shape, marker, or token; use line, plane, and volume brushes.                       |
| **Erase**                  | Remove draft cells without touching the world unless an authorised live renovation is active.        |
| **Select**                 | Box, lasso, connected-material, room, stage, layer, or token selection.                              |
| **Move / Rotate / Mirror** | Transform selected cells while preserving stage and marker relationships.                            |
| **Copy / Paste**           | Duplicate regions or modules with dependency and overlap validation.                                 |
| **Fill / Replace**         | Fill volumes and replace by block, token, material family, stage, or condition.                      |
| **Shape Cycle**            | Cube, slab, stair, slope, beam, post, pillar, wall, arch, window, roof, furniture-sized piece.       |
| **Layer Slice**            | Hide above/below, isolate floors, cut away walls, show structure, decoration, or utilities.          |
| **Stage Paint**            | Assign cells and components to construction, repair, upgrade, or demolition stages.                  |
| **Token Paint**            | Convert exact materials into semantic palette roles.                                                 |
| **Marker Tool**            | Place doors, beds, workstations, rooms, storage, roads, guards, utilities, spawns, and interactions. |
| **Scaffold Preview**       | Show worker positions, ladders, platforms, supply crates, and stage access.                          |
| **Cost Preview**           | Show exact and tagged requirements by stage, substitutions, stock, and locked materials.             |
| **Path Test**              | Simulate entrances, workstations, beds, storage, patrol, evacuation, and deliveries.                 |
| **Terrain Test**           | Apply the design to slopes, rivers, caves, stilts, retaining walls, carving, and foundations.        |
| **Variant Generator**      | Create mirrored, rotated, roof, palette, culture, damage, and size variants from approved rules.     |
| **Simulation Play**        | Fast-forward stages, occupancy, schedules, utility flow, raid approach, and damage.                  |
| **Validation**             | Run errors, warnings, recommendations, compatibility, and package readiness.                         |

## 7.1 Undo, History, and Safety

Every edit is a reversible command. The Workshop keeps named versions and autosave recovery. In-world renovation requires confirmation for occupied beds, active workstations, owned storage, utility disconnection, structural traps, or irreversible terrain removal. Multiplayer projects show author, approver, contributors, and history.

## 7.2 Creative Freedom Versus Validity

A draft may be saved while incomplete or invalid. It cannot be approved for NPC use, settlement project pools, or public server sharing until blocking errors are resolved. Decorative blueprints use a lighter validation profile than housing, workshops, roads, or defences.

# 8. Voxel Blueprint Storage, Bounds, Layers, and Compression

Blueprint data must remain compact enough for thousands of definitions and player libraries. The canonical data stores local coordinates, a local palette of block or token references, shape and rotation, stage assignment, and sparse metadata. Empty space is not stored.

| **Data Element**        | **Rule**                                                                                                |
|-------------------------|---------------------------------------------------------------------------------------------------------|
| **Bounds**              | Integer min/max coordinates, pivot, orientation rules, optional expansion envelope.                     |
| **Cell Palette**        | Local indexes to exact block IDs, material tokens, modules, or state templates.                         |
| **Cell Data**           | Coordinate/index, shape, rotation, state, stage, optional/variant flags.                                |
| **Layer Groups**        | Foundation, structure, shell, roof, interior, function, decoration, utilities, terrain, scaffolding.    |
| **Compression**         | Sparse chunk sections, run-length encoding, palette compression, repeated modules, procedural segments. |
| **Stage Masks**         | Cells grouped by stage index or compact ranges.                                                         |
| **Marker Volumes**      | Points, lines, boxes, room volumes, route edges, and socket transforms stored separately.               |
| **Thumbnail / Preview** | Generated image and optional preview mesh; never source of truth.                                       |
| **Delta Variants**      | Variants store changes against a parent when smaller than a full duplicate.                             |
| **Limits**              | Configurable cell, dimension, marker, nesting, dependency, and package limits.                          |

## 8.1 Blueprint Coordinate Rules

- Use integer local voxel coordinates with a one-metre default grid.

- Every blueprint has a pivot for rotation, placement, parcel alignment, and upgrades.

- Doors and road sockets declare outward-facing directions.

- Blueprints declare allowed 90-degree rotations, mirroring, or fixed orientation.

- Nested modules resolve transforms deterministically and cannot form circular references.

## 8.2 Player Edits After Completion

Completed buildings remain editable block by block. Their record tracks Blueprint-Exact, Blueprint-Compatible, Player-Modified, Functionally Broken, or Detached. Decoration and compatible material changes need not invalidate function; removing beds, blocking the only entrance, or destroying a workstation can.

# 9. Material Tokens, Palettes, Style Kits, and Cultural Identity

Semantic material tokens separate structure logic from appearance. A building can retain layout, stages, entrances, jobs, and utility logic while changing materials and cultural details. Exact materials remain available for iconic or mechanically required parts.

| **Token**              | **Meaning**                | **Example Resolutions**                                   |
|------------------------|----------------------------|-----------------------------------------------------------|
| **foundation_primary** | Load-bearing foundation    | Fieldstone brick, granite, clay foundation, living roots. |
| **wall_primary**       | Main external wall         | Oak plank, limestone, adobe, livingwood, darkstone.       |
| **wall_secondary**     | Internal or accent wall    | Plaster, wattle, carved stone, coloured clay.             |
| **beam_structural**    | Visible frame/support      | Oak beam, ironwood, steel frame, crystal rib.             |
| **floor_primary**      | Main floor                 | Plank, stone tile, packed earth, polished crystal.        |
| **roof_primary**       | Weatherproof roof          | Thatch, shingle, slate, tile, leaf canopy, metal plate.   |
| **roof_trim**          | Ridge/eave/gutter/ornament | Wood, copper, carved stone, fae vine.                     |
| **opening_window**     | Window family              | Glass pane, shutter, lattice, crystal window.             |
| **opening_door**       | Door family                | Timber door, iron gate, rune door, curtain.               |
| **trim_culture**       | Culture decoration         | Banner, carving, mosaic, rune strip, bone charm.          |
| **utility_mechanical** | Mechanical components      | Gearbox, shaft, pipe, cable, chute.                       |
| **utility_mana**       | Magical infrastructure     | Conduit, rune plate, mana socket.                         |

## 9.1 Palette Resolution Order

1.  Resolve exact non-substitutable requirements.

2.  Apply blueprint overrides.

3.  Apply culture style kit.

4.  Apply allowed biome and climate adaptation.

5.  Apply settlement tier and prosperity variants.

6.  Apply player custom overrides.

7.  Check unlocks, availability, law, server rules, and substitutions.

8.  Freeze resolved materials when construction begins unless a revision is approved.

## 9.2 Custom Town Style Packs

A player-created style pack can contain palettes, roof families, road materials, doors/windows, trims, banners, vegetation, furniture groups, density, district themes, signature buildings, and approval rules. A settlement can use it as a full identity, blend it with a local culture, or accept selected designs. Cultural blending may affect morale, tourism, trade, identity, faction response, and story.

# 10. Construction Stages, Resource Requirements, and Project Recipes

Blueprint construction is represented by ordered stages. Stage count is flexible, but shared vocabulary improves UI, NPC logic, forecasting, and production. Small structures may merge stages; megaprojects split them into independent subprojects.

| **Shared Stage**                 | **Visible Work**                                                         | **Typical Requirements**                                       |
|----------------------------------|--------------------------------------------------------------------------|----------------------------------------------------------------|
| **0. Planning**                  | Project anchor, footprint, approvals, survey markers, ghost preview.     | Usually no permanent blocks; optional survey or permit costs.  |
| **1. Site Preparation**          | Clear vegetation, debris, level or carve, temporary access.              | Labour, tools, fill, hauling, demolition, excavation.          |
| **2. Foundations**               | Footings, stilts, retaining walls, drainage, basement shell.             | Stone, timber piles, mortar, fittings, waterproofing.          |
| **3. Structural Frame**          | Beams, pillars, floors, primary stairs, supports.                        | Beams, nails, rods, brackets, scaffolding.                     |
| **4. Main Shell**                | Walls, floors, partitions, arches, stairs, openings.                     | Wall materials, plaster, masonry, framing.                     |
| **5. Weatherproofing**           | Roof, doors, windows, shutters, gutters, exterior finish.                | Roof materials, glass, hinges, sealants, trim.                 |
| **6. Functional Installation**   | Beds, workstations, storage, machines, utilities, mana, water, lighting. | Furniture, station components, pipes, conduits, cores.         |
| **7. Furnishing and Culture**    | Furniture, signs, banners, plants, decoration, art.                      | Culture goods, cloth, paint, carvings, luxury goods.           |
| **8. Inspection and Activation** | Path, safety, room, worker, utility, ownership, and job validation.      | Labour or specialist approval.                                 |
| **9. Prestige Finish**           | Optional landscaping, ornament, warding, ceremonial upgrade.             | Rare materials, specialists, culture goods, mana, story items. |

## 10.1 Automatic Cost Calculation

The editor counts exact cells and components in each stage. Tokens resolve through the selected palette. The project service adds non-block components, scaffolding, tools, labour, waste, quality, terrain work, difficulty, specialists, and substitutions. Costs remain transparent down to source cells.

| **Cost Source**           | **Calculation Role**                                                                  |
|---------------------------|---------------------------------------------------------------------------------------|
| **Voxel cells**           | Resolved block-item requirements by stage.                                            |
| **Functional components** | Doors, beds, workstations, machines, chests, lamps, runes, banners.                   |
| **Terrain work**          | Excavation, fill, retaining walls, stilts, bridge supports, drainage.                 |
| **Temporary works**       | Scaffolds, ladders, braces, supply crates; some are returned.                         |
| **Waste / efficiency**    | Builder skill, tools, station/material quality, settings, damage, and rework.         |
| **Substitution**          | Allowed tags, culture alternatives, quality equivalents, approvals.                   |
| **Labour and time**       | Complexity, height, travel, hauling, weather, skill, hazards, power/magic assistance. |

## 10.2 Resource Reservation

Projects reserve stock by stage and priority. Early stages can begin while later finish materials are missing. Emergency food, medicine, defence, and repair policies may override reservations according to settlement law. Player-founded settlements can choose full-project, stage-by-stage, or manual reservation.

## 10.3 Activation Gates

A structure may become partially functional before cosmetic completion. A watchtower activates when the platform, access, railing, and guard marker pass inspection. A house activates when weatherproof, reachable, and fitted with valid beds. Decoration can continue afterward.

# 11. Functional Markers, Rooms, Jobs, Sockets, and Utilities

| **Marker / Socket**   | **Examples**                                                           | **System Use**                              |
|-----------------------|------------------------------------------------------------------------|---------------------------------------------|
| **Entrance / Exit**   | Doorway, gate, hatch, ladder, stair portal, emergency exit.            | Navigation and occupancy.                   |
| **Room Volume**       | Bedroom, kitchen, workshop, storage, hall, shop, shrine, classroom.    | Need, job, safety, ownership, ambience, UI. |
| **Bed / Household**   | Adult, child, guest, barracks bed, household anchor.                   | Housing and population capacity.            |
| **Workstation**       | Forge, saw, loom, desk, altar, rune table, stall, guard post.          | Jobs, production, services, schedules.      |
| **Storage**           | Chest, warehouse input, pantry, armory, silo, fuel store, magic vault. | Inventory permissions and logistics.        |
| **Road Socket**       | Primary, secondary, path, service, cart, rail, bridge, gate.           | Settlement graph and access.                |
| **Delivery Socket**   | Builder supply, warehouse delivery, machine input, market unloading.   | Hauling and automation.                     |
| **Power Socket**      | Mechanical shaft, wire, pipe, steam, water, wind, fuel.                | Automation and machine activation.          |
| **Mana Socket**       | Conduit, battery, ward, ritual link, leyline anchor.                   | Magic infrastructure.                       |
| **Water / Waste**     | Well, intake, drain, irrigation, sewer, bath, fire-water point.        | Services and health.                        |
| **Guard / Defence**   | Patrol node, lookout, firing point, gate control, rally, shelter.      | Raid AI and safety.                         |
| **Interaction**       | Dialogue point, board, counter, bell, lever, portal control.           | Player and NPC interaction.                 |
| **Spawn / Occupancy** | Resident, worker, customer, livestock, visitor, defender.              | Safe population and events.                 |
| **Upgrade Socket**    | Reserved connection/volume for annex, floor, tower, or utility.        | Non-destructive progression.                |

## 11.1 Validation Profiles

| **Profile**        | **Blocking Requirements**                                                                  |
|--------------------|--------------------------------------------------------------------------------------------|
| **Decorative**     | Bounds, dependencies, placement legality, and no impossible states.                        |
| **Housing**        | Reachable entrance, valid room, beds, weatherproofing, light/safety, household capacity.   |
| **Workshop**       | Workstation, worker route, input/output storage, safety clearance, power/fuel if required. |
| **Public Service** | Public route, service point, queue/capacity, accessibility, ownership, operating hours.    |
| **Defence**        | Guard access, safe platform, cover/railings, approach visibility, evacuation, and supply.  |
| **Infrastructure** | Socket continuity, slope/turn limits, support, clearance, and network compatibility.       |
| **Megaproject**    | Subproject graph, district access, workforce, logistics, utilities, political/story gates. |

# 12. Terrain Adaptation, Site Validation, and Foundations

| **Foundation Policy**   | **Behaviour**                                                     | **Typical Uses**                               |
|-------------------------|-------------------------------------------------------------------|------------------------------------------------|
| **Require Flat**        | Reject if slope exceeds tolerance.                                | Markets, plazas, large workshops, civic halls. |
| **Minor Levelling**     | Cut/fill small height differences and clear obstacles.            | Homes, barns, small shops.                     |
| **Stepped Foundation**  | Terraced floors or stepped foundation bands.                      | Hillside and mountain settlements.             |
| **Stilted**             | Support columns to stable ground or waterbed.                     | Swamp, river, coast, floodplain.               |
| **Retaining Wall**      | Build walls and fill terraces around the footprint.               | Dense towns, roads, fortifications.            |
| **Carve Terrain**       | Excavate declared volumes and support ceilings.                   | Dwarven halls, caves, cellars, mines.          |
| **Bridge / Span**       | Find banks/supports and generate deck/support segments.           | Rivers, ravines, raised roads.                 |
| **Floating / Anchored** | Require magic/technology anchors and clear air.                   | Sky districts, floating towers.                |
| **Underwater / Sealed** | Require seal, access lock, and water displacement.                | Aquatic structures and domes.                  |
| **Conform Surface**     | Repeat eligible path/wall/fence segments along terrain.           | Roads, walls, farms, canals.                   |
| **Reject Site**         | Fail clearly when cost, damage, law, or constraints are exceeded. | All blueprints.                                |

## 12.1 Site Validation Order

9.  Check settlement, faction, parcel, ownership, law, and player permissions.

10. Check bounds, rotation, world height, chunk availability, and protected objects.

11. Check slope, support, water, caves, vegetation, hazards, roads, utilities, and upgrade space.

12. Check overlaps with structures, projects, claims, paths, spawns, resources, and story anchors.

13. Calculate adaptation plan and added cost.

14. Check entrances, delivery access, builder reachability, NPC navigation, evacuation, and service routes.

15. Check district suitability, culture rules, stage requirements, and expected settlement effects.

16. Present valid placement or exact blocking reasons with suggested fixes.

## 12.2 Player Override

Player-founded settlements and creative settings can override non-critical warnings. Out-of-world bounds, unresolved dependencies, protected terrain, absent authority, or impossible navigation for required functions cannot be silently ignored in normal survival play.

# 13. Roads, Parcels, Building Clusters, Districts, and Settlement Plans

A settlement is a graph and collection of projects, not a single model. The planner represents centres, roads, parcels, districts, services, utilities, defences, terrain constraints, expansion sectors, and landmark anchors. Buildings occupy parcels and connect through sockets.

| **Planning Element**  | **Role**                                                                          | **Examples**                                           |
|-----------------------|-----------------------------------------------------------------------------------|--------------------------------------------------------|
| **Settlement Centre** | Primary civic/social anchor and local coordinate reference.                       | Campfire, elder hall, market square, keep, world tree. |
| **Road Graph**        | Primary, secondary, path, service, cart, rail, bridge, gate, tunnel.              | Access, trade, patrol, expansion, district boundaries. |
| **Parcel**            | Buildable plot with frontage, depth, height, owner, uses, and expansion envelope. | House lot, workshop, farm plot, tower site.            |
| **Building Cluster**  | Several structures sharing courtyard, service, or project sequence.               | Farmstead, artisan yard, guard compound.               |
| **District**          | Zone with role, density, services, project pool, style, risk, and population.     | Residential, market, military, magical.                |
| **Perimeter**         | Wall, palisade, wards, trenches, gates, patrol route, safe zone.                  | Fortified Village and above.                           |
| **Utility Graph**     | Water, waste, power, mana, logistics, lighting, fire response.                    | Town and city infrastructure.                          |
| **Expansion Sector**  | Reserved direction or region for future growth.                                   | Riverfront, hill district, outer farms, industry.      |
| **Landmark Anchor**   | Unique or story-critical project site.                                            | Town hall, temple, mage tower, castle, portal.         |

## 13.1 District Types

| **District**                | **Typical Content**                                      | **Planning Concerns**                            |
|-----------------------------|----------------------------------------------------------|--------------------------------------------------|
| **Residential**             | Housing, wells, small shops, gardens, social spaces.     | Quality, safety, services, distance to work.     |
| **Agricultural**            | Fields, barns, mills, irrigation, livestock, storage.    | Soil, water, hauling, raids, seasons.            |
| **Artisan**                 | Smiths, carpenters, weavers, potters, repair yards.      | Fuel, noise, fire, storage, delivery.            |
| **Market / Civic**          | Market, inn, guild, town hall, square, court.            | Road centrality, visitors, law, prestige, trade. |
| **Military**                | Barracks, armory, towers, walls, training, command.      | Threat approaches, supply, patrol, civilians.    |
| **Magical**                 | Mage towers, rune halls, mana stores, wards, rituals.    | Mana, risk, laws, conduits, specialists.         |
| **Industrial / Automation** | Machines, furnaces, warehouses, power, rails, logistics. | Noise, pollution/risk, throughput, transport.    |
| **Religious / Cultural**    | Shrines, temples, festivals, archives, monuments.        | Culture, story, morale, law, pilgrimage.         |
| **Noble / Administrative**  | Palaces, estates, embassies, administration, gardens.    | Politics, security, prestige, inequality.        |
| **Harbour / River**         | Docks, fishery, shipyard, warehouses, floodworks.        | Depth, trade routes, flood risk.                 |
| **Underground / Vertical**  | Mines, tunnels, terraces, towers, cliff homes.           | Support, lifts, ventilation, navigation, light.  |

## 13.2 Settlement Plan Is a Rule Set

A custom town plan defines road hierarchy, district proportions, centre type, wall timing, expansion directions, density, building pools, landmark rules, style pack, and approval logic. It does not pre-place every house, so the same plan can adapt to different seeds and terrain while retaining identity.

# 14. Settlement Growth Ladder and Stage Gates

| **Stage**              | **Identity**                        | **Core Gates**                                                                               | **Typical Projects**                                               |
|------------------------|-------------------------------------|----------------------------------------------------------------------------------------------|--------------------------------------------------------------------|
| **Camp**               | Temporary survival foothold.        | Shelter, fire, food access, basic storage, safe sleep.                                       | Tents, lean-tos, campfire, cache, temporary fence.                 |
| **Hamlet**             | Small permanent community.          | Permanent homes, food, water, shared storage, basic jobs and path.                           | Cottages, farm, well, warehouse, resource site, guard post.        |
| **Village**            | Self-sustaining local settlement.   | Housing reserve, job diversity, workshops, trade, defence, services.                         | Blacksmith, market, shrine, inn, healer/school, roads, tower.      |
| **Fortified Village**  | Prepared for sustained threat.      | Perimeter, gates, patrols, armory, food reserve, repairs, threat intelligence.               | Walls, towers, barracks, ward stones, refuge.                      |
| **Town**               | Regional service and trade centre.  | Multiple districts, specialists, administration, caravans, utilities, roads.                 | Town hall, guilds, market, schools, temples, industry.             |
| **City**               | Large complex civilisation centre.  | District governance, logistics, public services, layered defence, advanced magic/automation. | City walls, hospitals, universities, mana grid, sewers, port/rail. |
| **Capital**            | Culture/faction seat of power.      | Government, diplomacy, command, archives, signature projects, major trade.                   | Palace/council, grand temple, fortress, embassy, monuments.        |
| **Magical Metropolis** | World-shaping endgame civilisation. | High-tier mana, portals, golems, realm logistics, wonders, floating/vertical districts.      | Portal nexus, leyline engine, sky district, wonder, realm embassy. |

## 14.1 Growth Gate Categories

- Population and household stability.

- Housing capacity, quality, privacy, and spare beds.

- Food, water, fuel, medicine, and seasonal resilience.

- Safety, guards, walls, lighting, wards, evacuation, repairs, and threat pressure.

- Job diversity, tools, workstations, specialists, education, and succession.

- Storage, roads, trade, logistics, power, mana, sanitation, and services.

- Culture, morale, festivals, identity, monuments, laws, and conflict.

- Required projects, story chapters, faction status, discoveries, and world events.

## 14.2 Stage Does Not Force Uniform Appearance

Two Town-stage settlements can be physically different: a dense walled river town, a spread-out forest trade town, or an underground hold. Stage describes capability and complexity; style, terrain, culture, project history, player choices, and threats determine form.

# 15. Autonomous Project Selection and Growth Planning

Semi-autonomous settlements periodically evaluate needs and opportunities. They build only from eligible project pools: developer blueprints, culture packs, generated variants, faction content, approved player submissions, and settlement-specific designs.

| **Scoring Factor**        | **Meaning**                                                             |
|---------------------------|-------------------------------------------------------------------------|
| **Stage Requirement**     | Projects required to reach or stabilise the next stage.                 |
| **Critical Need**         | Food, housing, water, medicine, fuel, storage, safety, repairs.         |
| **Population Pressure**   | Overcrowding, migration, families, refugees, specialist arrival.        |
| **Job and Economy**       | Missing production, bottleneck, trade opportunity, unemployment.        |
| **Defence and Threat**    | Raid routes, damage, wall gaps, guards, corruption, creature pressure.  |
| **Culture and Story**     | Traditions, festivals, faith, leadership, archives, faction arcs.       |
| **Infrastructure**        | Roads, bridge, warehouse, power, mana, sanitation, logistics, services. |
| **Player Proposal**       | Reputation, contribution, authority, contract, law, or vote.            |
| **Cost and Feasibility**  | Resources, workers, terrain, sites, dependencies, travel, risk.         |
| **Strategic Opportunity** | Trade route, rare resource, border, alliance, tourism, military goal.   |
| **Redundancy Penalty**    | Existing capacity, duplicate services, maintenance, empty buildings.    |
| **Disruption Penalty**    | Demolition, relocation, cultural conflict, law, ecological damage.      |

## 15.1 Project Selection Flow

17. Simulation creates needs, opportunities, stage targets, and emergencies.

18. Filter the project pool by culture, stage, unlocks, law, dependencies, specialists, terrain, and permissions.

19. Score eligible projects and expected settlement effects.

20. Evaluate parcels, roads, utilities, hazards, expansion space, and cost.

21. Use automatic, proposal, vote, contract, leader, or player approval according to governance.

22. Reserve resources and labour by priority.

23. Begin when the first stage is supplied and safe.

24. Completion updates jobs, housing, services, culture, defence, story, maintenance, and future eligibility.

## 15.2 Avoiding Village Spam

Settlements should not fill every empty space or build endlessly without purpose. Structures have capacity, maintenance, staffing, and redundancy values. Growth is limited by population, demand, services, land, culture, risk, and cooldowns. Empty buildings can be repurposed, rented, mothballed, dismantled, ruined, or offered to new residents.

# 16. NPC Construction, Labour, Logistics, and Activation

Nearby construction is physically visible. Builders collect tools and reserved resources, travel to the site, work from valid positions, place coherent block batches, and react to interruptions. The system should feel physical without requiring one pathfind and inventory transaction per voxel.

| **Construction Role**    | **Primary Tasks**                                                    |
|--------------------------|----------------------------------------------------------------------|
| **Surveyor / Planner**   | Confirms site, footprint, levels, roads, markers, and stage plan.    |
| **Labourer**             | Clearing, hauling, excavation, fill, scaffolding, simple placement.  |
| **Builder / Carpenter**  | Wood frame, floors, walls, roofs, doors, furniture.                  |
| **Mason**                | Stone foundations, walls, arches, roads, retaining walls.            |
| **Smith / Mechanic**     | Fasteners, metal parts, gates, machines, power connections.          |
| **Mage / Rune Worker**   | Conduits, wards, runes, ritual alignment, magical stabilisation.     |
| **Engineer / Architect** | Large spans, utilities, districts, and megaproject coordination.     |
| **Hauler / Courier**     | Moves supplies from warehouses, carts, chutes, roads, or automation. |
| **Inspector / Leader**   | Checks activation, safety, law, function, and handover.              |

## 16.1 Block Placement Batching

A work action can consume and place a small coherent batch such as a beam section, wall course, roof strip, furniture set, or stage subregion. Sounds, carried bundles, scaffolds, dust, and partial geometry preserve the construction fantasy.

## 16.2 Builder Task Ordering

25. Prepare work zones and temporary storage.

26. Build lowest and load-bearing cells first.

27. Complete access, ladders, floors, and scaffolds needed for later work.

28. Place shell and weatherproofing before vulnerable furniture and machinery.

29. Install utilities and functional markers in dependency order.

30. Run path, room, safety, ownership, power, mana, and job validation.

31. Activate when the functional stage passes.

32. Complete decoration and prestige work if supplied.

## 16.3 Interruptions and Failure

Weather, raids, injury, tool breakage, missing resources, blocked routes, ownership change, terrain collapse, corruption, utility failure, or leadership decisions can pause or alter a project. The project screen states the exact blocker and preserves placed work. Cancellation uses transparent refund, salvage, demolition, or abandoned-site rules.

# 17. Player Influence, Permissions, and Existing-Town Integration

Players can contribute custom architecture to existing NPC settlements, but the settlement remains a social and political entity. Authority depends on reputation, trust, ownership, leadership, contracts, laws, culture, and project type.

| **Integration Route**     | **Player Action**                                                           | **Rules**                                                                     |
|---------------------------|-----------------------------------------------------------------------------|-------------------------------------------------------------------------------|
| **Public Suggestion**     | Submit a blueprint proposal to a request board.                             | Settlement evaluates need, style, cost, plot, dependencies, and law.          |
| **Contracted Project**    | Village requests a function; player selects or supplies an eligible design. | Must satisfy required markers/capacity; rewards and reputation apply.         |
| **Granted Plot**          | Player receives permission to build on a defined parcel.                    | Design freedom within height, use, road, safety, and culture rules.           |
| **Project-Pool Addition** | Approved design becomes eligible for future autonomous construction.        | Settlement-only, culture pack, faction pack, or player-founded pack.          |
| **Template Replacement**  | Replace a default building family.                                          | Requires compatibility, upgrades, resident/job relocation, and approval.      |
| **Direct Governance**     | Founder, ruler, mayor, conqueror, or authorised architect.                  | Broad control; morale, law, faction response, and rebellion still matter.     |
| **Unauthorised Build**    | Build without permission in protected land.                                 | Crime, removal, fines, hostility, confiscation, or tolerated informal growth. |

## 17.1 Cultural Fit

Existing towns can use Strict, Guided, Blended, Open, Occupied, or Player-Ruled architecture policies. A strict settlement may require local palettes and roof forms; a blended settlement accepts foreign designs with local materials; an open trade city celebrates mixed styles. Conquered settlements may comply while accumulating fear, resistance, identity loss, or rebellion pressure.

## 17.2 Adding Designs to Existing Town Blueprints

The player can add a design to a district project pool, assign it to specific parcels, create a new building family, replace an optional project, or define an upgrade path from an existing building. Core story landmarks, protected graves, unique culture structures, and critical roads require stronger authority or cannot be replaced.

# 18. Player-Founded Settlements and Custom Town Styles

Player-founded settlements reuse the same residents, jobs, storage, projects, growth, law, economy, threat, and simulation systems as NPC villages. Their difference is broader planning authority and control over libraries, styles, districts, and approvals.

| **Control Area**       | **Player-Founded Settlement Options**                                                           |
|------------------------|-------------------------------------------------------------------------------------------------|
| **Blueprint Library**  | Choose allowed, preferred, banned, emergency, and signature designs.                            |
| **Town Style**         | Select or create palettes, roofs, roads, trims, banners, furniture, density, and landmarks.     |
| **Settlement Plan**    | Set centre, roads, districts, perimeter, expansion sectors, landmarks, utilities.               |
| **Project Governance** | Automatic, advisory, vote-based, leader approval, player approval, emergency override.          |
| **Resource Policy**    | Donation, taxation, trade purchase, reserves, budgets, rationing, automation input.             |
| **Land Policy**        | Public, household, guild, player, faction, leased, protected, sacred, industrial, agricultural. |
| **Style Policy**       | Strict custom style, culture blend, free build, district rules, preservation.                   |
| **NPC Freedom**        | Residents can request, propose, decorate, repair, improve, or resist under law/settings.        |

## 18.1 Custom Town Creation Flow

33. Create or select a style pack in the main-menu Workshop.

34. Create a settlement plan with centre, roads, districts, project pools, and growth preferences.

35. Found a camp in-world and claim or negotiate land.

36. Place the centre, storage, shelters, and access route.

37. Recruit residents and assign governance rules.

38. Allow the planner to propose projects from the custom library.

39. Approve, prioritise, supply, automate, or directly build projects.

40. Revise the plan as terrain, population, stories, threats, and technology change.

# 19. Blueprint Libraries, Packs, Dependencies, and Versioning

| **Library / Pack**          | **Purpose**                                                                                     |
|-----------------------------|-------------------------------------------------------------------------------------------------|
| **Personal Drafts**         | Private works in progress; may be invalid or unresolved.                                        |
| **World Library**           | Blueprints available to one save, settlement, server, or campaign.                              |
| **Approved Player Library** | Validated designs allowed for survival placement and NPC use.                                   |
| **Culture Pack**            | Buildings, palettes, decorations, districts, roads, landmarks, and preferences for one culture. |
| **Town Pack**               | Settlement plan plus compatible families, districts, roads, utilities, and style.               |
| **Server Pack**             | Curated allowlisted blueprints and versions distributed by a host.                              |
| **Mod / Content Pack**      | Versioned registry content installed with dependencies and compatibility.                       |
| **Legacy / Archived**       | Older versions retained for existing saves and migration.                                       |

## 19.1 Dependency Rules

- A blueprint declares required blocks, items, markers, nested blueprints, style kits, and minimum versions.

- Normal blueprint packages prohibit scripts.

- Optional dependencies can add variants without blocking the base.

- Circular references are invalid.

- Missing exact blocks need a declared fallback or migration.

- Imported content never silently substitutes mechanically different blocks.

## 19.2 Versioning and Migration

Editing a library design creates a new version rather than mutating every placed structure. Existing structures can stay on the old version, migrate automatically when safe, request approval, or receive a renovation project. Save data preserves the version actually used.

# 20. Import, Export, Sharing, Mods, and Safety

Player creativity benefits from sharing, but blueprint packages must remain safe, inspectable, and compatible with persistent worlds. The default format contains data and preview media only and executes no arbitrary code.

| **Safety Area**         | **Rule**                                                                                                   |
|-------------------------|------------------------------------------------------------------------------------------------------------|
| **Script-Free Default** | No executable scripts, shaders, native libraries, or arbitrary file access in normal packages.             |
| **Manifest**            | Package ID, author label, version, game/schema version, dependencies, hashes, dimensions, cells, flags.    |
| **Validation Sandbox**  | Imported data is parsed with limits before entering registries or world state.                             |
| **Size Limits**         | Maximum package bytes, cells, dimensions, nesting, markers, images, and variants.                          |
| **Content Review**      | Show thumbnail, description, tags, dependencies, unknown content, warnings, and validation before install. |
| **Server Authority**    | Host controls allowed packages, versions, upload rights, placement, and NPC project-pool use.              |
| **Ownership**           | Metadata may credit creators, but game logic does not trust unverifiable ownership claims.                 |
| **Updates**             | Never overwrite a world-required version without keeping compatibility or migration.                       |
| **Reporting / Hiding**  | Future services can moderate; local files remain removable, hideable, and quarantinable.                   |

## 20.1 Sharing Scope

Initial versions support local export/import and server pack distribution. Online browsing, ratings, cloud sync, creator profiles, or Steam Workshop can be added later. The file format and validation must not depend on a specific service.

# 21. Damage, Repair, Renovation, Upgrades, and Replacement

| **State / Project**              | **Meaning**                                                                          |
|----------------------------------|--------------------------------------------------------------------------------------|
| **Planned**                      | Approved footprint and stages; no permanent construction.                            |
| **Under Construction**           | Partial stages, scaffolds, supplies, workers, blockers.                              |
| **Functional Incomplete**        | Core use active; finish or prestige work remains.                                    |
| **Complete**                     | All required stages complete and validated.                                          |
| **Damaged**                      | Function reduced by missing blocks, utilities, markers, or access.                   |
| **Burned / Flooded / Corrupted** | Special damage with hazards, cleansing, contamination, or material loss.             |
| **Ruined**                       | Major failure; may be occupied, salvaged, restored, memorialised, or replaced.       |
| **Repair Project**               | Compares current state with a compatible target and requests missing work.           |
| **Renovation**                   | Changes rooms, materials, function, style, or capacity while preserving history.     |
| **Upgrade**                      | Moves through a declared family link, annex, extra floor, expansion, or replacement. |
| **Repurposed**                   | Changes functional markers and identity while retaining much of the structure.       |
| **Demolition / Salvage**         | Controlled removal with ownership, relocation, waste, heritage, and safety rules.    |

## 21.1 Repair Masks

Repair should not blindly overwrite player modifications. Comparison categorises cells as required missing, required damaged, acceptable substitution, player-added, blocked, obsolete, or protected. Repair plans target function and declared preservation policy, then allow exact restoration or compatible repair.

## 21.2 Upgrade Safety

Upgrade definitions declare preserved, removed, and new cells, relocation needs, occupancy impact, closure time, expansion envelope, and fallback when space is unavailable. A cottage must not erase a neighbour or road when becoming a townhouse.

# 22. Automation, Magic, Defence, and Megaproject Integration

| **Connected System**        | **Blueprint Requirements**                                                                          |
|-----------------------------|-----------------------------------------------------------------------------------------------------|
| **Automation**              | Input/output ports, storage, power, filters, maintenance, logistics, clearance, throughput.         |
| **Village Warehouse**       | Delivery socket, reservation categories, priorities, contribution ledger, overflow, ownership.      |
| **Power**                   | Mechanical, fuel, water, wind, steam, wires, pressure, and realm-specific networks.                 |
| **Mana**                    | Conduits, batteries, runes, wards, rituals, purity, stability, overload, leyline anchors.           |
| **Defence**                 | Walls, gates, towers, patrols, firing points, cover, traps, wards, refuge, repair access.           |
| **Roads and Trade**         | Cart width, bridge load, caravan turns, unloading, gate control, tolls, safe routes.                |
| **Golems / Special Labour** | Golem access, charging, job zones, inventories, repair bays, culture/law.                           |
| **Portals / Dimensions**    | Footprint, stabilisers, exclusion zone, destination, logistics, quarantine, return route.           |
| **Megaprojects**            | Subproject graph, districts, workforce, politics, specialists, contracts, power/mana, risks, story. |

## 22.1 Megaproject Construction

Megaprojects are graphs of sites and stages, not one giant cell list and progress bar. They can require quarry and road upgrades, worker housing, foundations, utilities, main wings, defences, ceremonial finish, and activation. Each subproject can provide partial benefits or fail independently.

# 23. Persistence, Simulation LOD, Determinism, and Multiplayer Authority

| **LOD**                | **Simulation**                                                                                                | **Update Scale**                         |
|------------------------|---------------------------------------------------------------------------------------------------------------|------------------------------------------|
| **Near**               | Visible NPCs, hauling, scaffolds, block batches, tools, sounds, hazards, exact navigation, machine/mana flow. | Seconds or event-driven.                 |
| **Medium**             | Stage tasks, worker groups, transfers, simplified routes, block batch summaries.                              | Minutes or bounded ticks.                |
| **Far**                | Settlement resources, labour points, project progress, risks, damage summaries, migration, growth gates.      | Hourly/daily steps.                      |
| **Unloaded / Dormant** | Compact settlement and regional summaries with capped catch-up.                                               | Scheduled ticks and load reconciliation. |

## 23.1 Deterministic Reconciliation

Distant progress stores stage completion and deterministic placement batches, not an unverified claim that a building exists. When chunks load, the system checks terrain and deltas, applies expected stages through authoritative voxel transactions, resolves conflicts, and records migration or repair needs. It never duplicates resources or silently deletes player changes.

## 23.2 Multiplayer Authority

- Clients submit edit commands and project proposals; the host/server validates persistent changes.

- Drafts can be private or shared without granting world-edit authority.

- Project placement, reservations, project-pool changes, demolition, and upgrades require permissions.

- Contribution ledgers record materials, labour, design authorship, approvals, and refunds.

- Server packs pin allowed package versions and prevent unresolved definitions.

# 24. Godot and Summer Engine Technical Architecture

The system is implemented as data-driven Godot modules. The player-facing editor is part of the shipped application. Internal developer tools expose the same services with additional diagnostics, batch generation, registry maintenance, and tests. Summer Engine can build the system through small, validated tasks.

| **Module / Data Type**           | **Responsibility**                                                                                  |
|----------------------------------|-----------------------------------------------------------------------------------------------------|
| **BlueprintDefinition Resource** | Custom Resource for metadata and references; heavy cell data may use a compact binary payload.      |
| **Editor Command Model**         | Place, erase, transform, stage, token, marker, palette, and package actions as reversible commands. |
| **BlueprintEditorCore**          | Shared service independent of world or menu scene.                                                  |
| **InWorldBlueprintMode**         | Adapter for live terrain, permissions, warehouses, settlements, navigation, and placement.          |
| **BlueprintWorkshopMode**        | Adapter for test plots, libraries, batch variants, packages, and simulated profiles.                |
| **BlueprintPreviewRenderer**     | Efficient preview voxel/mesh rendering, slicing, ghosts, conflicts, and stage animation.            |
| **BlueprintValidationService**   | Bounded checks returning errors, warnings, suggestions, coordinates, and repair actions.            |
| **BlueprintCostService**         | Token resolution, cell counting, components, terrain work, labour, and substitutions.               |
| **SettlementPlanner**            | Need scoring, project filtering, sites, roads, parcels, districts, and growth gates.                |
| **ConstructionService**          | Reservations, worker batches, voxel transactions, activation, cancellation, and history.            |
| **BlueprintPackageService**      | Import/export, versions, hashes, dependencies, limits, quarantine, previews, migration.             |
| **Runtime Records**              | Save-safe projects, structures, settlements, roads, districts, and blueprint deltas.                |
| **Debug Tools**                  | Cell/stage/marker overlays, scores, sites, LOD state, transactions, and migration reports.          |

## 24.1 Suggested Godot Scene Boundaries

- BlueprintWorkshopScreen: library, project browser, viewport, inspector, validation, and package panels.

- BlueprintEditorViewport: camera, grid, slicing, selection, preview renderer, gizmos, and input.

- InWorldBlueprintOverlay: ghost, parcel/site data, warehouse stock, permissions, and project placement.

- SettlementPlannerScreen: map, roads, parcels, districts, project pools, gates, utilities, and effects.

- ProjectManagementScreen: stages, costs, reservations, workers, blockers, contributions, approvals, and history.

## 24.2 Technical Principles Retained from Document 18

Stable IDs, authoritative transactions, event-driven modules, definitions separated from runtime state, deterministic world changes, simulation LOD, migrations, validation, save recovery, permissions, debug overlays, and automated tests remain valid. Unreal-specific modules, Blueprints, Actors, and ownership assumptions are superseded for this system by Godot.

# 25. UI/UX Screens, Flows, Feedback, and Accessibility

| **Screen**                        | **Primary Information**                                                                                     |
|-----------------------------------|-------------------------------------------------------------------------------------------------------------|
| **Blueprint Library**             | Search, filters, collections, versions, compatibility, dependencies, validation, world/server availability. |
| **Blueprint Workshop**            | 3D editing, layers, palette, stages, markers, inspector, cost, validation, preview, save/export.            |
| **Style Kit Editor**              | Tokens, mappings, roofs, trims, roads, furniture, density, culture rules, preview set.                      |
| **District / Settlement Planner** | Road graph, parcels, districts, pools, growth gates, utilities, perimeter, expansion.                       |
| **In-World Draft Overlay**        | Ghosts, live terrain, conflicts, ownership, roads/utilities, stock, build/submit actions.                   |
| **Project Screen**                | Stage progress, costs, reserved/available/missing stock, workers, blockers, effects, history.               |
| **Village Proposal Screen**       | Need, options, cultural fit, plot, cost, benefit, law, vote/approval, reputation.                           |
| **Import Review**                 | Manifest, preview, dimensions, dependencies, unknown content, warnings, validation, permissions.            |
| **Blueprint Compare / Migration** | Old/new versions, cell and marker changes, affected structures, migration choice.                           |

## 25.1 Feedback Priority

- Blocking error: colour plus icon, shape, and text; states why approval or placement fails.

- Warning: permits draft/save but highlights risk, cost, culture, path, or upgrade concern.

- Recommendation: offers improvement without implying failure.

- Valid: gives a reasoned success state, not only green colour.

- Unknown: unresolved dependency, hidden content, unloaded terrain, stale server state, or estimate is labelled honestly.

## 25.2 Input and Accessibility

Keyboard/mouse is the primary dense editing input, but controller support uses radial tools, snapping, focusable inspectors, layer cycling, camera controls, and history. Support scalable text, non-colour conflict cues, reduced motion, configurable ghost contrast, narration labels, hold/toggle options, remapping, camera comfort, and simplified editor presets.

# 26. Content Production Strategy and Blueprint Scale Targets

The project should not hand-create every material, culture, biome, damage state, and settlement stage as a separate structure. Content scales through archetypes, modules, tokens, palettes, style kits, optional parts, upgrade families, and district rules.

| **Multiplier**            | **Contribution**                                                |
|---------------------------|-----------------------------------------------------------------|
| **Structural Archetype**  | Functional shape and marker layout.                             |
| **Size / Upgrade Family** | Small, medium, large, vertical, fortified, specialised.         |
| **Culture Style Kit**     | Materials, roofs, trim, openings, decoration, roads, density.   |
| **Biome Adaptation**      | Climate, foundations, stilts, insulation, drainage, vegetation. |
| **Prosperity / Tier**     | Crude, standard, prosperous, elite, magical, ruined.            |
| **Damage / History**      | Burned, raided, flooded, corrupted, abandoned, restored.        |
| **Optional Modules**      | Chimney, garden, annex, balcony, shopfront, ward, machine bay.  |

| **Milestone**                 | **Planning Target**                                                                                           |
|-------------------------------|---------------------------------------------------------------------------------------------------------------|
| **POC**                       | 10-15 structures, 2 palettes, 1 style kit, 1 cluster, 1 road family, 1 simple settlement plan.                |
| **Camp -\> Hamlet Prototype** | 25-35 archetypes covering homes, food, storage, jobs, roads, water, defence, shrine, and repair.              |
| **Village Alpha**             | 60-90 archetypes, 3-4 style kits, project pools, small districts, walls, markets, workshops.                  |
| **Town System**               | 100-140 reusable archetypes, districts, civic services, utilities, fortifications, culture signatures.        |
| **City Beta**                 | Expanded districts, infrastructure, vertical/underground, large civic, magic/automation, megaproject modules. |
| **Full Game**                 | Reusable archetypes multiplied through culture, biome, tier, history, dimensions, and player packs.           |

## 26.1 Production Workflow

41. Define function, footprint, rooms, jobs, roads, utilities, stage availability, and upgrades.

42. Build the structural archetype in the shared Workshop.

43. Convert materials to semantic tokens and create a default palette.

44. Paint construction stages and generate initial costs.

45. Add markers, rooms, pathing, scaffolds, sockets, and activation rules.

46. Run validation and terrain test suites.

47. Create optional modules, variants, damage masks, and culture resolutions.

48. Test construction, occupation, repair, upgrades, saves, LOD, and authority.

49. Add to project pools and record balance status.

## 26.2 AI-Assisted Production

Summer Engine and other AI tools can draft Godot Resources, generate variants, calculate stage masks, produce registry entries, suggest palettes, create tests, and identify missing markers or dependencies. AI output must pass the same visual, gameplay, pathing, resource, save, and performance review as manual content.

# 27. Proof-of-Concept Scope and Explicit Deferrals

| **POC Area**           | **Included**                                                                                                        |
|------------------------|---------------------------------------------------------------------------------------------------------------------|
| **Blueprint Workshop** | Create, save, load, rotate, mirror, slice, stage-paint, token-paint, mark doors/beds/road, validate, preview costs. |
| **In-World Designer**  | Place the cottage on live terrain, show conflicts, choose palette, inspect stock, create project.                   |
| **Blueprints**         | Player cottage, watchtower, warehouse, road segment, simple farm plot, crate/scaffold helpers.                      |
| **Palettes**           | Forest timber/fieldstone/thatch and alternate stone/slate.                                                          |
| **Stages**             | Planning, preparation, foundation, frame/shell, roof, functional interior, activation.                              |
| **NPC Construction**   | One builder plus hauling, batched placement, scaffolds, pause/resume, activation.                                   |
| **Settlement Effect**  | Cottage adds housing; watchtower adds defence; both affect village state.                                           |
| **Persistence**        | Save definitions, library, project progress, reservations, blocks, palette, completion, and effects.                |
| **Simulation LOD**     | Detailed near construction plus one distant-progress test.                                                          |
| **Permissions**        | Player-owned project and one trusted village proposal route.                                                        |

## 27.1 Explicitly Deferred Beyond POC

- Full district editor and procedural city growth.

- Online marketplace, ratings, moderation, cloud sync, or Steam Workshop.

- Every culture, biome, dimension, and architectural style.

- Complex roads, sewers, rail, portal logistics, floating cities, and wonders.

- Full upgrades, renovation AI, heritage, politics, voting, and architectural rebellion.

- Advanced collaborative multiplayer editing and large server governance.

- AI generation of production-ready cities without human review.

# 28. Staged Implementation Plan

| **Implementation Stage**              | **Work**                                                                                             | **Exit Result**                              |
|---------------------------------------|------------------------------------------------------------------------------------------------------|----------------------------------------------|
| **Stage 0 - Engine Alignment**        | Update assumptions for Godot; define IDs, registries, saves, voxel adapter, command/event contracts. | System skeleton and tests.                   |
| **Stage 1 - Blueprint Data Spike**    | Compact cells, bounds, palette, stages, markers, serialisation, versions, preview.                   | Render hard-coded cottage and tower.         |
| **Stage 2 - Shared Editor Core**      | Place, erase, select, transform, undo, layers, stage/token paint, markers.                           | One core usable by a test harness.           |
| **Stage 3 - Main-Menu Workshop**      | Library, project files, plot, camera, inspector, validation, cost, save/load.                        | Player creates and exports cottage.          |
| **Stage 4 - In-World Placement**      | Terrain, ghost, permissions, obstruction, foundation, orientation, road socket.                      | Place cottage project in Forest Hamlet.      |
| **Stage 5 - Costs and Reservations**  | Palette resolution, counts, stage costs, warehouse reserves, missing-material UI.                    | Accurate conserved supplies.                 |
| **Stage 6 - NPC Construction**        | Builder batches, hauling, scaffolds, voxel transactions, interruption, activation.                   | Cottage and tower visibly built.             |
| **Stage 7 - Settlement Effects**      | Housing, guard position, growth checks, project pool, proposal permission.                           | Cottage affects housing; tower affects raid. |
| **Stage 8 - Persistence and LOD**     | Save/load, versions, runtime project, deltas, distant progress, reconciliation.                      | No duplication or lost state.                |
| **Stage 9 - Player Pack Integration** | Collections, culture palette, town pack shell, import/export limits, server allowlist.               | Custom style pack usable by a settlement.    |
| **Stage 10 - Post-POC Expansion**     | Road graphs, parcels, clusters, districts, autonomous scoring, upgrades/repair.                      | Camp-to-Hamlet vertical slice.               |

## 28.1 Redesign Triggers

- Preview/editing cannot handle POC cell counts interactively.

- The same file cannot open consistently in both creation modes.

- Displayed costs disagree with placed blocks or allow duplication.

- NPC construction requires one full pathfind/transaction per cell.

- Save/load or version updates lose project, palette, marker, reservation, or delta state.

- Distant reconciliation overwrites live terrain or duplicates stages.

- Player content can execute code, bypass permissions, exceed limits, or corrupt registries.

# 29. Detailed Blueprint and Settlement Registry v0.1

| **ID**                                | **Display Name**                 | **Type**        | **Earliest Stage** | **Role**             | **Scope**    |
|---------------------------------------|----------------------------------|-----------------|--------------------|----------------------|--------------|
| bp.micro.campfire_basic               | Basic Campfire                   | Micro           | Camp               | Survival/Centre      | POC Required |
| bp.micro.supply_crate_project         | Project Supply Crate             | Micro           | Camp               | Construction/Storage | POC Required |
| bp.micro.scaffold_wood                | Wood Scaffold Set                | Micro           | Camp               | Construction         | POC Required |
| bp.micro.well_shallow                 | Shallow Village Well             | Micro           | Hamlet             | Water/Public         | Alpha        |
| bp.building.tent_family               | Traveller Tent Family            | Building Family | Camp               | Housing              | Alpha        |
| bp.building.cottage_forest_small      | Small Forest Cottage             | Building        | Hamlet             | Housing              | POC Required |
| bp.building.cottage_forest_medium     | Medium Forest Cottage            | Building        | Village            | Housing              | Alpha        |
| bp.building.longhouse_basic           | Basic Longhouse                  | Building        | Hamlet             | Housing/Social       | Alpha        |
| bp.building.warehouse_shared_small    | Shared Village Warehouse         | Building        | Hamlet             | Storage/Logistics    | POC Required |
| bp.building.barn_small                | Small Barn                       | Building        | Hamlet             | Agriculture/Storage  | Alpha        |
| bp.building.farmhouse_small           | Small Farmhouse                  | Building        | Hamlet             | Housing/Agriculture  | Alpha        |
| bp.building.lumber_camp               | Lumber Camp                      | Building        | Hamlet             | Forestry/Production  | Alpha        |
| bp.building.mine_office_small         | Small Mine Office                | Building        | Hamlet             | Mining/Storage       | Alpha        |
| bp.building.guard_post_basic          | Basic Guard Post                 | Building        | Hamlet             | Defence              | Alpha        |
| bp.building.watchtower_wood           | Wooden Watchtower                | Building        | Village            | Defence              | POC Required |
| bp.building.blacksmith_basic          | Village Blacksmith               | Building        | Village            | Artisan/Service      | Alpha        |
| bp.building.market_stall_set          | Market Stall Set                 | Cluster         | Village            | Trade                | Alpha        |
| bp.building.inn_small                 | Small Village Inn                | Building        | Village            | Hospitality/Trade    | Alpha        |
| bp.building.shrine_local              | Local Culture Shrine             | Building        | Village            | Culture/Magic        | Alpha        |
| bp.building.healer_hut                | Healer Hut                       | Building        | Village            | Health/Service       | Alpha        |
| bp.building.school_small              | Small School                     | Building        | Village            | Education            | Beta         |
| bp.building.mage_house_basic          | Village Mage House               | Building        | Village            | Magic/Service        | Alpha        |
| bp.infrastructure.road_dirt           | Dirt Road Family                 | Infrastructure  | Camp               | Road                 | POC Required |
| bp.infrastructure.road_stone          | Stone Road Family                | Infrastructure  | Town               | Road                 | Beta         |
| bp.infrastructure.bridge_timber_small | Small Timber Bridge              | Infrastructure  | Hamlet             | Road/Water           | Alpha        |
| bp.infrastructure.palisade_family     | Palisade Family                  | Infrastructure  | Fortified Village  | Defence              | Alpha        |
| bp.infrastructure.gate_palisade       | Palisade Gate                    | Building        | Fortified Village  | Defence/Road         | Alpha        |
| bp.infrastructure.ward_stone_ring     | Basic Ward Stone Ring            | Cluster         | Fortified Village  | Magic/Defence        | Alpha        |
| bp.cluster.farmstead_basic            | Basic Farmstead                  | Cluster         | Hamlet             | Agriculture          | Alpha        |
| bp.cluster.market_square_small        | Small Market Square              | Cluster         | Village            | Trade/Civic          | Alpha        |
| bp.cluster.guard_compound             | Guard Compound                   | Cluster         | Fortified Village  | Defence              | Beta         |
| bp.cluster.artisan_yard               | Artisan Yard                     | Cluster         | Town               | Production           | Beta         |
| bp.district.residential_low           | Low-Density Residential District | District        | Town               | Housing              | Beta         |
| bp.district.agricultural_basic        | Agricultural District            | District        | Town               | Agriculture          | Beta         |
| bp.district.market_civic              | Market and Civic District        | District        | Town               | Trade/Civic          | Beta         |
| bp.district.military_basic            | Military District                | District        | City               | Defence              | Final Game   |
| bp.district.magical_basic             | Magical District                 | District        | City               | Magic                | Final Game   |
| bp.district.industrial_basic          | Industrial District              | District        | City               | Automation           | Final Game   |
| bp.settlement.forest_hamlet           | Forest Hamlet Plan               | Settlement Plan | Hamlet             | Settlement           | POC Required |
| bp.settlement.river_town              | River Trade Town Plan            | Settlement Plan | Town               | Settlement/Trade     | Beta         |
| bp.settlement.dwarven_hold            | Dwarven Hold Plan                | Settlement Plan | Town               | Underground/Culture  | Final Game   |
| bp.fortification.stone_city_wall      | Stone City Wall Plan             | Fortification   | City               | Defence              | Final Game   |
| bp.megaproject.castle_civic           | Civic Castle Complex             | Megaproject     | Capital            | Government/Defence   | Final Game   |
| bp.megaproject.portal_nexus           | Portal Nexus                     | Megaproject     | Magical Metropolis | Magic/Dimensions     | Final Game   |
| bp.wonder.leyline_crown               | Leyline Crown                    | Wonder          | Magical Metropolis | World-Shaping        | Deferred     |

# 30. Sample Detailed Blueprint Entries

## 30.1 Small Forest Cottage

| **Field**              | **Definition**                                                                                                              |
|------------------------|-----------------------------------------------------------------------------------------------------------------------------|
| **Blueprint ID**       | bp.building.cottage_forest_small                                                                                            |
| **Category / Role**    | Building / Housing                                                                                                          |
| **Bounds**             | Suggested 7 x 5 x 6 metres plus service clearance and optional annex socket.                                                |
| **Earliest Stage**     | Hamlet                                                                                                                      |
| **Validation Profile** | Housing                                                                                                                     |
| **Required Markers**   | 1 entrance, 2 beds, household anchor, hearth, storage, road socket.                                                         |
| **Optional Markers**   | Garden, chimney, bench, third bed, culture decoration.                                                                      |
| **Material Tokens**    | foundation_primary, wall_primary, beam_structural, floor_primary, roof_primary, opening_door, opening_window, trim_culture. |
| **Stages**             | Planning; preparation; foundation/floor; frame/walls; roof/openings; interior; activation.                                  |
| **Activation**         | Reachable weatherproof room, entrance, 2 valid beds, safe hearth, no blocking errors.                                       |
| **Settlement Effects** | Housing for a small household; morale/warmth; maintenance demand.                                                           |
| **Upgrade Links**      | Medium Cottage; Shopfront Cottage; Reinforced Cottage; culture variants.                                                    |
| **POC Use**            | Player-created in Workshop, placed in Forest Hamlet, constructed by NPC builder.                                            |

## 30.2 Wooden Watchtower

| **Field**              | **Definition**                                                                                         |
|------------------------|--------------------------------------------------------------------------------------------------------|
| **Blueprint ID**       | bp.building.watchtower_wood                                                                            |
| **Category / Role**    | Building / Defence                                                                                     |
| **Bounds**             | Suggested 5 x 5 footprint and 10-12 metres tall with access/sight envelope.                            |
| **Required Markers**   | Entrance, ladder/stairs, guard post, lookout/firing points, supply point, path socket.                 |
| **Stages**             | Survey; foundations; frame; platform/access; railing/roof; guard equipment; inspection; optional ward. |
| **Key Materials**      | Foundation stone, beams, planks, iron fittings, railing, access, roof.                                 |
| **Activation**         | Reachable platform, guard marker, safe railing, path, assigned/equipped guard.                         |
| **Settlement Effects** | Detection, response, raid readiness, visibility, morale, optional ward coverage.                       |
| **Failure**            | Fire, support loss, blocked access, missing guard, supply shortage, ward failure.                      |
| **POC Use**            | Village project whose completion changes the goblin raid outcome.                                      |

## 30.3 Small Market Square Cluster

| **Field**              | **Definition**                                                                                             |
|------------------------|------------------------------------------------------------------------------------------------------------|
| **Blueprint ID**       | bp.cluster.market_square_small                                                                             |
| **Composition**        | Central plaza, 4-8 stall sockets, noticeboard, optional well/fountain, lighting, storage/unloading, roads. |
| **Site Rule**          | Mostly flat or terraced; primary-road frontage; pedestrian, fire, and raid access.                         |
| **Stages**             | Road/plaza; drainage/foundation; stalls/storage; lighting/signage; activation; festival decoration.        |
| **Markers**            | Merchant slots, customer zones, delivery, public interaction, event anchor, guard patrol, cleanup.         |
| **Settlement Effects** | Trade capacity, visitors, prices, request board, events, congestion risk.                                  |
| **Player Integration** | Custom stall variants, palette pack, statue/fountain module, and shopfront families.                       |

## 30.4 Player Custom Town Pack

| **Field**              | **Definition**                                                                                                          |
|------------------------|-------------------------------------------------------------------------------------------------------------------------|
| **Package ID**         | pack.player.custom_town.example                                                                                         |
| **Contents**           | Settlement plan, style kit, roads, housing families, warehouse, farmstead, workshop, market, guard post, tower, shrine. |
| **Growth Coverage**    | Camp through Village; later stages may use fallback packs.                                                              |
| **Project Pool Rules** | Required/optional sets, emergency housing/food/defence, signature projects.                                             |
| **Style Rules**        | Palette, roofs, roads, trim, banners, density, gardens, landmark silhouette.                                            |
| **Compatibility**      | Base-game blocks, no scripts, schema version, validated markers/paths, server-safe size.                                |
| **World Use**          | Select at founding, apply to a district, or propose as a blended style in an existing town.                             |

# 31. Sample Settlement Stage Definitions

## 31.1 Camp to Hamlet Gate

| **Gate**           | **Requirement**                                                                               |
|--------------------|-----------------------------------------------------------------------------------------------|
| **Population**     | At least 4 persistent residents or configurable equivalent.                                   |
| **Housing**        | Permanent weatherproof beds for current residents plus a small reserve.                       |
| **Food**           | Stable local or traded food flow and minimum reserve days.                                    |
| **Water**          | Valid water access or well service.                                                           |
| **Storage**        | Shared construction/food storage with project reservation.                                    |
| **Jobs**           | Food production plus one resource/production role and one builder-capable worker.             |
| **Safety**         | Basic lighting, safe sleep, threat response, no critical damage.                              |
| **Infrastructure** | Settlement centre and basic path/road between core sites.                                     |
| **Projects**       | Permanent housing, food site, shared storage, and water access.                               |
| **Player Role**    | Not mandatory; deliveries, custom cottage, automation, defence, or trade accelerate the gate. |

## 31.2 Village to Fortified Village Gate

| **Gate**                   | **Requirement**                                                                |
|----------------------------|--------------------------------------------------------------------------------|
| **Population and Housing** | Stable population without severe overcrowding and with guard/builder capacity. |
| **Threat**                 | Sustained raids, strategic border need, player choice, or faction requirement. |
| **Defence Projects**       | Perimeter, gates, towers/posts, patrol, armory/supply, refuge/evacuation.      |
| **Supply**                 | Food reserve, repair materials, guard equipment, fuel/mana if used.            |
| **Specialists**            | Guard leadership and builders; mage if magical defence is selected.            |
| **Road and Access**        | Defensible entries without blocking trade, farms, water, or escape.            |
| **Maintenance**            | Capacity to repair walls/towers and replace defence supplies.                  |

## 31.3 City to Capital Gate

| **Gate**               | **Requirement**                                                                                  |
|------------------------|--------------------------------------------------------------------------------------------------|
| **Governance**         | Recognised authority, laws, administration, succession or leadership stability.                  |
| **Regional Influence** | Trade routes, allied/subject settlements, diplomacy, military or cultural recognition.           |
| **Districts**          | Multiple functioning districts with services, logistics, utilities, housing, safety, governance. |
| **Signature Projects** | Capital hall/palace/council, archive, major culture site, defence command, monument.             |
| **Economy**            | Regional surplus, strategic resources, resilient logistics, skilled specialists.                 |
| **Story and Faction**  | Required culture/faction arc or sandbox political conditions.                                    |
| **Player Paths**       | Peaceful leadership, alliance, restoration, election, conquest, or alternative outcomes.         |

# 32. Core POC Scenario: Player Cottage and Forest Hamlet Growth Loop

50. From the main menu, the player opens Blueprint Workshop and creates a small cottage with ghost voxel blocks.

51. The player assigns semantic tokens, paints stages, and places an entrance, two beds, a hearth, storage, and a road socket.

52. Validation identifies blocked beds, missing entrance, unsafe hearth, unsupported roof, or unresolved token.

53. The player previews Forest Timber and Stone/Slate palettes and saves the design to a personal library.

54. In Forest Hamlet, the player earns trust to propose housing or uses a player-founded plot.

55. The in-world designer previews live terrain, levelling, road connection, footprint, and exact stage costs.

56. The settlement approves and reserves the plot; the player confirms the local palette.

57. The warehouse reserves stage-one resources; the player delivers them or connects permitted automation.

58. A builder clears, lays foundations, raises frame/walls, adds roof/openings, installs function, and completes inspection.

59. The cottage activates before optional decoration, adding housing and Hamlet growth readiness.

60. The settlement also constructs the watchtower, improving the goblin raid result.

61. Save, exit, reload, leave the region, return, and verify versions, history, occupants, effects, tower state, and resource conservation.

## 32.1 POC Cause-and-Effect Proof

> **POC Proof**
>
> A player-created design becomes a validated, resource-conserving, NPC-built, persistent piece of a living settlement. It changes housing and growth rather than acting only as a cosmetic paste. The watchtower proves the same system affects defence and raids.

# 33. Balancing and Player-Freedom Rules

| **Rule**                            | **Meaning**                                                                                                       |
|-------------------------------------|-------------------------------------------------------------------------------------------------------------------|
| **Creative Drafting Is Free**       | Designing and saving blueprints costs no resources; survival construction does.                                   |
| **Large Costs Need Scaling Paths**  | Village, district, and megaproject costs require automation, NPC production, trade, contracts, or batch crafting. |
| **Old Materials Remain Useful**     | Wood, stone, clay, glass, fibre, copper, iron, and culture materials remain important.                            |
| **Function Before Decoration**      | Core services can activate before optional prestige finish.                                                       |
| **No Instant City Paste**           | Normal survival requires land, stages, resources, labour, permissions, utilities, and growth gates.               |
| **Player Freedom With Consequence** | Foreign, ugly, inefficient, exploitative, or militarised designs are possible, but people and factions react.     |
| **No Mandatory Perfect Efficiency** | Charming irregular designs are valid if required function and safety pass.                                        |
| **Cultural Rules Are Contextual**   | Architecture preference creates identity and response, not a universal style ranking.                             |
| **Autonomy Is Configurable**        | Independent growth, approvals, private NPC building, style enforcement, and governance are world settings.        |
| **Readable Complexity**             | Early projects use simple stages; districts, utilities, politics, and dependencies appear gradually.              |
| **Performance Is a Game Rule**      | Cell, project, worker, library, and settlement limits are transparent and scalable.                               |
| **Failure Leaves Evidence**         | Cancelled, damaged, abandoned, or ruined projects leave salvage, history, needs, and repair opportunities.        |

# 34. Open Questions and Deferred Production Decisions

- Final package extension, compression, and human-readable versus binary split.

- Maximum dimensions and cell counts by single-player, server, and hardware preset.

- Whether design-all mode exposes all non-secret blocks or discovered content by default.

- Rules for scanning other players, protected structures, rare landmarks, and faction architecture.

- Exact culture acceptance, voting, heritage, and rebellion formulas.

- How much NPC decoration and renovation occurs without player approval.

- Final road authoring method: voxel segments, spline-assisted, graph-first, or hybrid.

- Whether eligible rooms can stretch procedurally without harming player authorship.

- Official online sharing, moderation, creator credit, reporting, and curation.

- Commercial/mod licensing policy for player-created packs and imported assets.

- Full city performance budgets, district caps, and catch-up limits.

- Migration when mods, blocks, style kits, or nested dependencies are removed.

# Appendix A. Proof-of-Concept Blueprint and Settlement Checklist

- Shared BlueprintEditorCore is used by both the main-menu Workshop and the in-world designer.

- Workshop can create, save, load, rename, duplicate, organise, version, and delete personal blueprints.

- Placement, erase, selection, move, rotation, mirror, copy/paste, fill, replace, layers, slicing, and undo/redo operate predictably.

- Cells can be painted with semantic material tokens and assigned to construction stages.

- Door, bed, hearth, storage, road, supply, work, guard, and utility markers can be placed and inspected.

- Validation reports blocking errors and warnings with exact coordinates and understandable repair suggestions.

- The cottage resolves through at least two palettes without changing its functional layout.

- Displayed block/component requirements exactly match authoritative construction transactions.

- In-world placement checks terrain, bounds, ownership, permissions, roads, utilities, existing structures, and warehouse stock.

- Project reservations prevent daily consumption or another project from duplicating reserved resources.

- NPC builder and hauler tasks use reachable work positions, stage order, scaffolds, and bounded block batches.

- The cottage activates housing only after required markers, rooms, access, and functional cells pass inspection.

- The watchtower activates defence and visibly changes the Forest Hamlet raid result.

- Save/reload preserves blueprint identity, version, palette, project stage, stock reservations, placed cells, workers, occupants, history, and settlement effects.

- Distant construction advances through summary simulation and reconciles without duplicating or losing resources.

- Imported POC packages contain no executable scripts and are rejected when limits, IDs, dependencies, or validation fail.

- Keyboard/mouse flow is complete and basic controller navigation works for the core creation loop.

- Debug overlays expose cell IDs, tokens, stages, markers, validation, project state, reservations, LOD mode, and settlement effects.

# Appendix B. Database and Godot Resource Field Templates

## Appendix B.1 Blueprint Definition Fields

| **Field Group**         | **Fields**                                                                                                                  |
|-------------------------|-----------------------------------------------------------------------------------------------------------------------------|
| **Identity**            | blueprint_id; schema_version; content_version; display_name_key; description_key; author/provenance; package_id.            |
| **Classification**      | category; subcategory; role_tags; size_tier; scope_status; style_tags; culture_tags; biome_tags.                            |
| **Spatial**             | bounds; pivot; footprint; height; allowed_transforms; orientation rules; clearance envelope; nested origin rules.           |
| **Voxel Payload**       | compressed cells; block/token reference; shape; rotation; state; stage membership; optional/required flags.                 |
| **Composition**         | nested_blueprints; module sockets; optional groups; variant groups; procedural-safe parameters.                             |
| **Construction**        | construction_stages; component requirements; labour profile; scaffolds; activation point; cancellation/salvage rules.       |
| **Materials and Style** | material_tokens; default_palette_id; allowed_palette_ids; style_kit_ids; substitution constraints; unresolved-token policy. |
| **Function**            | markers; room definitions; job slots; storage; interaction points; occupancy; path requirements; activation rules.          |
| **Connections**         | road sockets; path sockets; water/drainage; power; mechanical; mana; logistics; defence; portal/transport sockets.          |
| **Placement**           | terrain_policy; slope limits; foundation policy; parcel rules; frontage; neighbour rules; clearance; exclusion zones.       |
| **Settlement**          | allowed settlement stages; project tags; need effects; capacity effects; culture acceptance; law/permission requirements.   |
| **Lifecycle**           | upgrade_from; upgrade_to; renovation links; damage masks; repair masks; ruin state; restoration links; maintenance profile. |
| **Dependencies**        | required block/item/recipe/marker/style IDs; optional dependencies; fallback content; minimum game/content version.         |
| **Presentation**        | thumbnail; preview camera; icon; silhouette tags; player notes; tutorial hint; warning text.                                |
| **Safety and Limits**   | cell count; nested depth; dimensions; unknown-ID policy; package permissions; validation profile; content flags.            |

## Appendix B.2 Construction Stage Fields

| **Field Group**              | **Fields**                                                                                              |
|------------------------------|---------------------------------------------------------------------------------------------------------|
| **Identity**                 | stage_id; blueprint_id; stage_order; display_name_key; description_key.                                 |
| **Selection**                | cell selector/mask; nested module selector; marker selector; optional finish selector.                  |
| **Requirements**             | exact items; token-derived blocks; tagged substitutions; components; tools; station; fuel/power/mana.   |
| **Labour**                   | allowed roles; labour points; skill effects; worker cap; batching; work positions; haul profile.        |
| **Prerequisites**            | previous stages; terrain work; permission; weather; safety; utilities; project/event conditions.        |
| **Scaffolds and Ghosts**     | scaffold rules; supply crates; collision; preview style; restricted zones; temporary pathing.           |
| **Runtime**                  | progress; reserved/available/missing stock; active workers; blockers; interruptions; rollback boundary. |
| **Activation**               | partial services; navigation update; room activation; job slots; settlement effects; completion events. |
| **Failure and Cancellation** | salvage rate; damaged partial state; abandoned state; refunds; reputation/event effects.                |

## Appendix B.3 Settlement Stage Definition Fields

| **Field Group**             | **Fields**                                                                                               |
|-----------------------------|----------------------------------------------------------------------------------------------------------|
| **Identity**                | settlement_stage_id; order; display_name_key; culture/faction overrides; world-setting overrides.        |
| **Population and Housing**  | population band; household capacity; reserve housing; overcrowding tolerance; migration rules.           |
| **Needs**                   | food stability; water access; safety; medicine; tools; fuel; clothing; culture goods; morale thresholds. |
| **Jobs and Services**       | required job families; specialist count; service coverage; training; leadership; emergency roles.        |
| **Infrastructure**          | roads; storage; utilities; farms; workshops; markets; defence; governance; magic/automation thresholds.  |
| **Projects**                | required project tags; minimum counts; optional project pools; signature projects; emergency fallbacks.  |
| **Territory and Districts** | parcel capacity; district count/types; perimeter; expansion space; route/region links.                   |
| **Economy and Politics**    | trade volume; surplus; caravan access; laws; faction recognition; government; taxation/tribute.          |
| **Story and Culture**       | culture milestones; faction arcs; rituals; archives; leaders; dimension/story gates.                     |
| **Unlocks and Effects**     | new project pools; population cap; jobs; services; UI; laws; trade; faction/world effects.               |
| **Regression and Failure**  | shortage grace; damage; abandonment; downgrade policy; refugee state; conquest; ruin transition.         |

# Appendix C. Blueprint Validation Rule Set

| **Validation Family**    | **Core Checks**                                                                                                                    |
|--------------------------|------------------------------------------------------------------------------------------------------------------------------------|
| **Data Integrity**       | Valid stable IDs, schema/version, unique stage order, legal coordinates, valid rotations/shapes, no corrupt payload.               |
| **Dependencies**         | All required blocks, items, recipes, markers, palettes, style kits, and nested blueprints resolve or have approved fallbacks.      |
| **Limits**               | Bounds, cell count, nested depth, package size, marker count, optional variants, and runtime budgets remain within profile limits. |
| **Structural Support**   | Required support surfaces exist; gravity/support-sensitive pieces are legal; no isolated required cells.                           |
| **Entrances and Egress** | Required entrances connect exterior to interior; no sealed occupied rooms; emergency exits where profile requires them.            |
| **Navigation**           | NPC paths reach work, bed, storage, service, guard, and interaction markers with required clearance.                               |
| **Rooms**                | Room envelopes are closed/open as intended, have valid height/volume, and contain required markers.                                |
| **Jobs**                 | Job markers have stations, access, storage/supply relationships, safety clearance, and role-compatible activation.                 |
| **Housing**              | Beds, privacy/household rules, warmth/hearth, light, storage, weatherproofing, and access meet the selected housing tier.          |
| **Defence**              | Guard positions, firing arcs, railings, ladders/stairs, gates, patrol links, refuge and supply points are usable.                  |
| **Utilities**            | Power, mana, water, drainage, logistics, smoke/heat, waste, portal, and ward connections are complete and non-conflicting.         |
| **Terrain**              | Foundation policy, slope, clearance, excavation, retaining walls, stilts, waterline, vegetation, and protected terrain are valid.  |
| **Settlement Fit**       | Parcel role, frontage, roads, district, stage, culture, laws, density, service range, and neighbour restrictions are satisfied.    |
| **Construction**         | Every required cell/component belongs to a legal stage; stage order is buildable; work positions and supply access exist.          |
| **Upgrade Safety**       | Upgrade keeps or deliberately migrates occupants, inventories, utilities, roads, ownership, rooms, and project history.            |
| **Sharing Safety**       | No executable content; manifest, hashes, namespace, dependencies, limits, prohibited references, and permissions pass.             |

> **Validation Severity Rule**
>
> Errors prevent approval, placement, activation, or import. Warnings allow continuation but explain the risk. Recommendations are optional improvements. Unknown states must never be presented as valid until the relevant dependency, terrain, or server state is resolved.

# Appendix D. Initial Blueprint Production Backlog

| **Backlog Group**       | **Initial Content**                                                                                                             |
|-------------------------|---------------------------------------------------------------------------------------------------------------------------------|
| **POC Core**            | Small cottage; wooden watchtower; village warehouse; farm plot; road/path segment; scaffolds; supply crate; test terrain plots. |
| **Camp**                | Tent; bedroll shelter; fire circle; temporary store; palisade segment; crude gate; latrine/waste marker; animal tether.         |
| **Hamlet Housing**      | Small cottage; medium cottage; farmhouse; worker bunkhouse; elder house; healer cottage; culture variants.                      |
| **Hamlet Production**   | Lumber camp; mine office/entrance; smith shelter; pottery kiln; mill; bakery; fishery/hunter lodge; simple workshop.            |
| **Hamlet Services**     | Well; granary; barn; request board; shrine; small market; guard post; medicine garden; communal hall.                           |
| **Village Housing**     | Large house; townhouse; shop-house; artisan house; inn; dormitory; specialist housing; visitor lodging.                         |
| **Village Production**  | Blacksmith; sawmill; masonry yard; brewery; tailor; tannery; alchemy hut; rune workshop; mana furnace house.                    |
| **Village Services**    | Market square; school; clinic; temple/shrine; bathhouse; guild hall; caravan yard; archive; jail/law post.                      |
| **Defence**             | Palisade; stone wall; gates; corner/road towers; barracks; armoury; refuge; trench; ward stone; alarm network.                  |
| **Roads and Water**     | Dirt/cobbled roads; intersections; steps; bridges; culverts; docks; canals; drainage; retaining walls; street lighting.         |
| **Town Civic**          | Town hall; courthouse; tax/customs; large warehouse; hospital; college; temple complex; theatre/festival square.                |
| **Town Districts**      | Residential block; artisan quarter; market district; military compound; magical precinct; industrial yard; harbour cluster.     |
| **City Infrastructure** | City walls/gates; aqueduct; sewer; transit; mana grid; rail/portal terminals; fire service; major logistics hubs.               |
| **Culture Kits**        | Forest human; mountain/dwarven; fae/living wood; desert/clay; coastal; snow; corrupted/forbidden; dimensional styles.           |
| **Megaprojects**        | Castle; palace/council citadel; grand academy; portal complex; wonder; floating platform; realm gate; civilisation machine.     |

# Appendix E. Cross-System Requirement Matrix

| **Connected System**  | **Blueprint / Settlement Requirement**                                                                                                             |
|-----------------------|----------------------------------------------------------------------------------------------------------------------------------------------------|
| **Blocks**            | Blueprint cells resolve stable block IDs/tokens, shapes, states, support, damage, repair, collision, light, and block entities.                    |
| **Items**             | Construction consumes block item forms, components, tools, furnishings, supplies, culture goods, and maintenance materials.                        |
| **Recipes**           | Project stages use authoritative inputs, substitutions, time, labour, by-products, fuel/power, activation, and cancellation.                       |
| **Resources**         | Material tiers, local availability, scarcity, trade, automation deposits, purity, and strategic resources affect palettes and costs.               |
| **NPC/Village**       | Named workers, jobs, schedules, needs, storage, reservations, permissions, trust, migration, deaths, and settlement history drive projects.        |
| **Automation**        | Warehouses, logistics, power, mana, throughput, permissions, delivery ownership, construction supply, maintenance, and LOD connect.                |
| **Magic**             | Wards, conduits, runes, rituals, portals, golems, corruption, magical construction, and culture laws require markers and sockets.                  |
| **Creatures/Combat**  | Raids, sabotage, fire, monsters, guards, patrols, evacuation, defence coverage, damage, ruins, and repair alter structures.                        |
| **Worldgen/Biomes**   | Terrain, slope, water, roads, resources, climate, leylines, danger, culture territory, and expansion space constrain sites.                        |
| **Structures**        | Worldgen sites, restoration, player designs, NPC projects, upgrades, states, markers, ownership, and rewards share the blueprint foundation.       |
| **Cultures/Factions** | Architecture, palettes, density, law, acceptance, specialists, project pools, symbols, story, and political control vary.                          |
| **Quests/Events**     | Projects can be objectives, contributions, emergencies, failures, story gates, festivals, reconstruction, conquest, or world evidence.             |
| **UI/UX**             | Creation, validation, costs, stock, permissions, proposals, projects, stages, districts, growth gates, history, and migration must be inspectable. |
| **Technical/Save**    | Stable IDs, versioning, compressed payloads, authority, deterministic transactions, LOD, migrations, backups, limits, and tests are mandatory.     |

# Appendix F. Proof-of-Concept Success Criteria

| **Criterion**          | **Definition of Success**                                                                                                            |
|------------------------|--------------------------------------------------------------------------------------------------------------------------------------|
| **Creation**           | A player creates a functional cottage entirely inside the shipped main-menu Blueprint Workshop.                                      |
| **Mode Parity**        | The same definition opens in-world without conversion and retains cells, tokens, stages, markers, palette support, and version.      |
| **Validation**         | Invalid entrances, beds, supports, hearth clearance, road socket, and unresolved tokens are identified precisely.                    |
| **Cost Accuracy**      | Previewed requirements equal reserved and consumed resources; cancellation/salvage does not duplicate stock.                         |
| **Terrain Fit**        | At least two terrain placements produce clear valid/invalid results and a deterministic foundation/levelling estimate.               |
| **Construction**       | NPCs visibly haul and build the cottage in stages with scaffolds, pause/resume, and reachable work positions.                        |
| **Function**           | The completed cottage registers rooms, two beds, household capacity, road access, ownership, maintenance, and settlement effects.    |
| **Watchtower**         | The staged watchtower activates a guard post and changes raid detection, response, damage, or survival.                              |
| **Persistence**        | World reload and blueprint-library reload preserve every required definition and runtime record.                                     |
| **LOD**                | A distant project advances under bounded summary simulation and reconciles to the correct world state on return.                     |
| **Player Integration** | A trusted player can propose the design to the Forest Hamlet and receive a clear approval/rejection reason.                          |
| **Safety**             | A malformed, oversized, missing-dependency, or executable import is rejected without corrupting the library or world.                |
| **Performance**        | Creation, preview, validation, placement, stage building, save/load, and reconciliation meet the POC budgets on target hardware.     |
| **Player Trust**       | The UI never hides missing resources, unknown dependencies, permission limits, estimated costs, or reasons a project cannot proceed. |

# Appendix G. Naming, Folder, and Package Conventions

| **Convention**               | **Format / Rule**                                                                                                     |
|------------------------------|-----------------------------------------------------------------------------------------------------------------------|
| **Blueprint ID**             | bp.\<category\>.\<family_or_name\>.\<variant\> \| Example: bp.building.cottage_small.forest                           |
| **Stage ID**                 | stage.\<blueprint_id\>.\<order\>.\<name\> \| Example: stage.bp.building.cottage_small.03.shell                        |
| **Palette ID**               | palette.\<culture_or_theme\>.\<name\>.\<tier\>                                                                        |
| **Style Kit ID**             | style.\<culture_or_theme\>.\<name\>                                                                                   |
| **Cluster ID**               | cluster.\<role\>.\<name\>.\<size\>                                                                                    |
| **District ID**              | district.\<role\>.\<culture_or_theme\>.\<variant\>                                                                    |
| **Settlement Plan ID**       | settlement_plan.\<culture_or_theme\>.\<growth_range\>.\<variant\>                                                     |
| **Project ID**               | project.\<settlement_id\>.\<generated_unique_id\>                                                                     |
| **Package ID**               | pack.\<namespace\>.\<package_name\>.\<major_version\>                                                                 |
| **Suggested Project Folder** | res://game/settlements/{blueprints,palettes,styles,clusters,districts,plans,projects,validation,ui,tests}/            |
| **Player Library**           | Stored under Godot user data, separated from shipped content and quarantined until import validation succeeds.        |
| **World Save Reference**     | stable blueprint ID + content version + package ID/hash + palette/style IDs + runtime project/structure delta.        |
| **Planning Status**          | POC Required; Alpha; Beta; Final Game; Placeholder; Deferred. Planning status must not become shipped gameplay state. |

> **Final Locked Rule**
>
> Players, NPCs, developers, world generation, and mods should not require separate building languages. One shared, validated voxel blueprint foundation should let a player imagine a structure, a settlement approve it, a warehouse supply it, NPCs construct it, the world damage it, and civilisation grow around it.
