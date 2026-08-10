**Fantasy Voxel Civilisation Sandbox**

**18 - Technical Implementation Plan**

*Version 0.1 - Detailed Design Bible and Engineering Foundation Draft*

A staged technical architecture for a high-fidelity fantasy voxel civilisation sandbox, covering Unreal Engine 5, custom voxel terrain, data registries, persistent living-world simulation, automation, magic infrastructure, NPC AI, save systems, multiplayer authority, responsive UI, performance, testing, tooling, and the Forest Hamlet proof-of-concept.

*Working design document - engineering architecture, implementation sequence, risk controls, and proof-of-concept definition*

| **Technical Implementation Plan Statement**                                                                                                                                                                                                                                                                                                                      |
|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Build the smallest architecture that can prove the complete game identity without creating foundations that must be discarded. The proof-of-concept must connect editable voxel terrain, real inventory transactions, village simulation, automation, mana infrastructure, construction, combat, raids, and persistent aftermath inside one authoritative world. |

| **Field**                | **Locked Direction**                                                                                                                                                                                                                                                 |
|--------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Document Scope**       | Full technical plan covering engine, architecture, voxel systems, world generation, registries, saves, simulation LOD, AI, automation, magic, quests, combat, UI, networking, performance, testing, security, tooling, POC stages, risks, and post-POC scaling.      |
| **Engine Direction**     | Unreal Engine 5 on a stable production release, locked per milestone. Use C++ for stable and performance-critical systems, with Blueprints for orchestration, content assembly, UI flows, audiovisual hooks, and rapid iteration.                                    |
| **Platform Direction**   | Windows PC first. Maintain controller, split-screen, networking, memory, input, save, and platform boundaries that do not unnecessarily block later console or Linux/Steam Deck evaluation.                                                                          |
| **World Direction**      | Custom one-metre voxel subsystem using chunked storage, palette compression, merged-face meshing, block entities, deterministic staged world generation, asynchronous streaming, and seed-plus-delta persistence.                                                    |
| **Data Direction**       | Versioned external schemas imported into validated Unreal runtime registries. Use stable namespace IDs, gameplay tags, parent templates, localisation keys, migration rules, spreadsheet round-tripping, content packs, and safe mod boundaries.                     |
| **Simulation Direction** | Full interactive actors near players, reduced local simulation at medium range, compact settlement and regional summaries at distance, and explicit promotion/demotion rules preserving identity and consequence.                                                    |
| **Authority Direction**  | One authoritative world simulation in solo and multiplayer. The local host owns authority in solo; a listen or dedicated server owns it in multiplayer. Clients and UI request validated changes rather than owning persistent state.                                |
| **POC Direction**        | Build in strict stages around the Forest Hamlet cause-and-effect loop. Spike the voxel foundation first, then resource-conserving automation and persistent NPC simulation. Defer full realms and full online co-op while preserving their architectural boundaries. |
| **Quality Direction**    | Define measurable performance budgets early, profile packaged builds, automate core flows and migrations, protect saves and resource transactions, include controller/accessibility/localisation foundations, and block release on data-loss or authority defects.   |

# Document Purpose

This document converts Documents 00 through 17 from gameplay design into an actionable engineering architecture. It defines what technical systems own each type of state, how data moves between systems, how the world is generated and saved, how nearby and distant simulation differ, how multiplayer authority is preserved, and how the proof-of-concept should be built in stages without losing the final game vision.

The document is intentionally broader than a coding checklist. The project combines an editable voxel world, living NPC societies, resource-conserving automation, magic infrastructure, dynamic structures, branching quests, combat and raids, dimensions, mod-ready content, responsive UI, split-screen, and online co-op. Those requirements create architectural risks that must be addressed before large-scale content production.

All 240 questionnaire answers were locked to option E. This creates a consistent direction: deep but readable systems, stable data and save foundations, event-driven modular code, asynchronous bounded work, authoritative transactions, explicit simulation LOD, responsive and accessible presentation, and staged proof rather than a premature attempt at the full game.

# Design Source

| **Source Document**                        | **Relevant Direction**                                                                                                                                                     | **How This Technical Plan Uses It**                                                                                                                         |
|--------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 00 - Master Game Design Bible              | The game is a living fantasy voxel survival, civilisation, automation, and RPG sandbox. Solo, co-op, LAN, and split-screen are final requirements.                         | Architecture keeps the four pillars connected and treats multiplayer, persistence, world consequence, and scalability as foundation concerns.               |
| 01 - Core Gameplay Loop                    | Primary loop: explore -\> gather -\> craft -\> build -\> interact -\> automate -\> defend -\> upgrade -\> expand. POC proves village supply and changed threat outcome.    | POC milestones are ordered around one connected cause-and-effect chain instead of isolated technical demos.                                                 |
| 02 - Player Progression                    | Progression spans materials, skills, perks, knowledge, magic, automation, villages, reputation, bosses, and dimensions.                                                    | Definitions and runtime state remain modular; no single level system owns unlocks or progression truth.                                                     |
| 03 - Blocks Registry                       | One-metre grid, many shapes, block states, material families, functional blocks, magic blocks, village blocks, damage, and data inheritance.                               | Custom voxel chunks store compact IDs and state; complex blocks use block-entity records; shapes and materials are generated from reusable definitions.     |
| 04 - Items Registry                        | Blocks and items are separate but linked. Item instances may hold durability, quality, charge, spoilage, ownership, and enchantments.                                      | Immutable item definitions are resolved by stable IDs; runtime stacks store only quantity and required instance state.                                      |
| 05 - Crafting and Recipe Registry          | Hand, station, machine, project, rune, ritual, and dimension recipes share one registry with time, power, by-products, failure, and unlock fields.                         | A unified recipe service supports deterministic transactions, reservations, timed work, automation, NPC projects, and save-safe progress.                   |
| 06 - Resource Progression                  | Resources are survival supplies, machine feedstock, village needs, magic catalysts, strategic assets, and realm keys.                                                      | Resource conservation, tags, grades, purity, by-products, deposits, and exact village consumption are first-class technical requirements.                   |
| 07 - NPC Village System                    | Named NPCs have homes, jobs, needs, inventories, memories, schedules, projects, and permanent consequences. Nearby simulation is detailed; distant simulation is abstract. | Persistent NPC and village records are separate from temporary actors. Simulation LOD preserves identity, resources, projects, danger, and history.         |
| 08 - Automation System                     | Automation uses visible machines, logistics, power, mana, warehouses, NPC labour, permissions, risk, and near/far simulation.                                              | Typed network graphs and authoritative integer transactions preserve flow, ownership, reservations, and cross-chunk behaviour.                              |
| 09 - Magic System                          | Mana, runes, wards, conduits, spells, rituals, magitech, villages, and corruption form practical infrastructure.                                                           | Power and mana share common network contracts but retain distinct storage, transmission, purity, risk, and presentation rules.                              |
| 10 - Creatures and Monsters                | Creature AI spans ecology, senses, factions, raids, bosses, village targets, drops, wards, and world pressure.                                                             | Reusable AI profiles, hierarchical navigation, group planning, threat objectives, and simulation budgets support the creature registry.                     |
| 11 - Biomes and World Generation           | Very large seed-generated worlds use regions, layered biomes, caves, roads, resources, settlements, leylines, dynamic states, and LOD.                                     | World generation is deterministic, staged, validated, asynchronous, and capable of guaranteed relational anchors for the POC valley.                        |
| 12 - Structures                            | Structures are dynamic blueprints with materials, states, ownership, NPC use, rewards, roads, damage, restoration, and simulation LOD.                                     | Structure definitions store block volumes, markers, sockets, rules, variants, and state transitions rather than relying only on level actors.               |
| 13 - Races, Peoples, Cultures and Factions | Ancestry, culture, faction, language, government, territory, law, religion, and history are separate layered records.                                                      | Stable identity and relationship records prevent culture, species, settlement, and political ownership from becoming one hard-coded field.                  |
| 14 - Dimensions                            | Major dimensions are persistent connected worlds with their own generation, rules, societies, routes, infrastructure, and bounded inactive simulation.                     | Each realm is a world instance with derived seed, chunk storage, portal anchors, regional summaries, save data, and shared registry services.               |
| 15 - Quest and Event System                | Authored and simulation-driven quests/events use stages, objectives, conditions, contributions, failure, persistent evidence, ownership, and LOD.                          | Quest graphs and event records persist authoritative state, bind to stable entity IDs, and define fallback rules when the world changes.                    |
| 16 - Combat, Gear and Defence              | Combat supports first/third person action, damage packets, status, gear, guards, structures, raids, multiplayer, accessibility, and persistent aftermath.                  | Server-authoritative combat state, reusable action definitions, damage records, raid plans, and defence contributions integrate with world state.           |
| 17 - UI/UX System                          | Adaptive UI must be world-first, inspectable, controller-ready, split-screen-aware, accessible, localisable, knowledge-aware, and consistent with authority.               | UI consumes view models and sends commands; it never invents state. Input, local-player roots, accessibility metadata, and localisation exist from the POC. |

# Static Table of Contents

- 1\. Locked Technical Implementation Identity

- 2\. Player Answer Decision Summary

- 3\. Technical Goals, Principles, and Non-Goals

- 4\. Engine, Platform, Toolchain, and Dependency Strategy

- 5\. Project Architecture, Modules, Ownership, and Communication

- 6\. Stable IDs, Definitions, Runtime Records, and Core Data Contracts

- 7\. Content Registry, Schema, Import, Localisation, and Content-Pack Pipeline

- 8\. Voxel World Data Model, Chunks, Blocks, States, and Block Entities

- 9\. Voxel Meshing, Collision, Lighting, Fluids, and Editing Pipeline

- 10\. Rendering, 32x32 Material Variation, Visual LOD, and Asset Budgets

- 11\. World Generation, Streaming, Regions, Roads, Structures, and Dynamic State

- 12\. Save Games, Persistence, Journals, Migration, and Recovery

- 13\. Simulation LOD, Time, Scheduling, and Unloaded-World Processing

- 14\. NPC, Creature, Navigation, Construction, and Raid AI

- 15\. Automation, Logistics, Storage, Power, Mana, Wards, and Transactions

- 16\. Quest, Event, Reputation, Faction, and World-State Architecture

- 17\. Combat, Damage, Gear, Defence, and Aftermath Architecture

- 18\. UI, Input, Accessibility, Localisation, and Player-Trust Architecture

- 19\. Multiplayer, LAN, Split-Screen, Authority, Replication, and Reconnection

- 20\. Modding, Extensibility, Compatibility, and Security Boundaries

- 21\. Performance Budgets, Profiling, Scalability, and Hardware Targets

- 22\. Testing, Validation, Continuous Integration, and Release Gates

- 23\. Developer Tools, Debug Overlays, Logging, Analytics, and Crash Reporting

- 24\. Project Workflow, Version Control, Coding Rules, and Decision Records

- 25\. Proof-of-Concept Technical Scope and Explicit Deferrals

- 26\. Proof-of-Concept Staged Implementation Plan

- 27\. Technical Spikes, Risk Register, and Redesign Triggers

- 28\. Proof-of-Concept Definition of Done and Acceptance Matrix

- 29\. Post-POC Architecture Roadmap

- 30\. Open Questions for Production Planning

- Appendix A. Recommended Unreal Module and Plugin Map

- Appendix B. Stable ID, Tag, Command, Event, and Record Naming Conventions

- Appendix C. Core Runtime and Save Record Templates

- Appendix D. First-Pass Performance and Simulation Budgets

- Appendix E. POC Engineering Checklist

- Appendix F. Player Answer Lock 1-240

- Appendix G. Cross-System Technical Requirement Matrix

- Appendix H. Architecture Decision Record Template

- Appendix I. Source Document and Dependency Register

# 1. Locked Technical Implementation Identity

The Technical Implementation Plan is the reliability, scalability, and integration layer of the project. Its purpose is not to make every final system now. Its purpose is to establish data, authority, persistence, simulation, and tooling foundations that let the POC prove the game honestly and let later content expand without rewriting the project core.

| **Locked Rule**                                                                                                                                                                                                                                                                                                                                                                   |
|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Technical shortcuts are acceptable only when they are local and replaceable. A shortcut must not corrupt stable IDs, save data, resource conservation, world authority, simulation ownership, registry contracts, or cross-system boundaries. If a fast prototype would make those foundations disposable, the prototype must be isolated behind a temporary adapter or rejected. |

| **Identity Layer**         | **Design Meaning**                                                                                                             | **Engineering Result**                                                                                     |
|----------------------------|--------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------|
| Authoritative Living World | One world state owns blocks, items, NPCs, projects, automation, quests, combat, factions, and aftermath.                       | Solo, LAN, online, and split-screen use the same state-change rules instead of separate game logic.        |
| Data-Driven Content        | Blocks, items, recipes, creatures, biomes, structures, cultures, quests, machines, magic, and UI records use stable schemas.   | Content expands through validated definitions and generated families rather than copied one-off code.      |
| Persistent Consequence     | World edits, NPC identities, deliveries, project stages, damage, death, ownership, and history survive save/load.              | The game can fulfil its promise that the world remembers player and NPC actions.                           |
| Scalable Simulation        | Nearby systems are physical and interactive; distant systems use compact bounded summaries.                                    | Large worlds and civilisations remain possible without simulating every actor, item, or block every frame. |
| Physical Readability       | Voxel blocks, moving goods, power, mana, wards, roads, structures, and NPC work remain visible where players can inspect them. | Abstraction improves performance without turning the world into unexplained background numbers.            |
| Multiplayer Readiness      | Authority, ownership, identity, transaction, quest scope, and local-player UI are explicit from the beginning.                 | Full online co-op can be added later without rewriting every inventory, block, village, or quest system.   |
| Recoverable Development    | Validation, journaling, backups, migration, logging, tests, and developer tools are treated as production systems.             | The project can identify errors early and protect worlds from silent data loss or corruption.              |

## 1.1 Technical Design Promise

A developer should be able to identify which system owns any piece of state, which definition created it, which command may change it, which event records the result, how it is saved, who authorises it in multiplayer, how it behaves when unloaded, and which tools expose it for debugging. A player should see consistent outcomes regardless of whether the action came from a player, NPC, machine, spell, quest, raid, or distant simulation.

## 1.2 What This Architecture Is Not

- A giant framework built before the POC has proved the game is enjoyable.

- A Blueprint-only prototype whose data, saves, and authority must later be discarded.

- A pure entity-component-system design forced onto every interactive object.

- A collection of Unreal actors ticking independently with direct references to every other system.

- A voxel renderer treated as the whole game while villages, automation, and persistence remain placeholders.

- A promise that every final feature, realm, network backend, platform, or mod API will be implemented during the POC.

# 2. Player Answer Decision Summary

All 240 questions were answered E. The table below converts those answer groups into locked engineering decisions. Appendix F preserves the exact range locks.

| **Question Range**                | **Locked Decision**                                                                                                                                                                                                                                                                            |
|-----------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **1-20: Vision and engine**       | Use a full technical plan, Unreal Engine 5 stable release, C++ systems plus Blueprint orchestration, Windows PC first, authoritative world state, modular architecture, data-driven content, and replaceable audited dependencies.                                                             |
| **21-40: Workflow and code**      | Use clear modules, stable IDs, tags, event-driven processing, bounded asynchronous work, structured logs, feature flags, Git LFS, protected main, CI, coding rules, and architecture decision records.                                                                                         |
| **41-60: Voxel foundation**       | Use one-metre blocks, benchmarked 32-cubed logical chunks or equivalent sections, palette compression, merged-face meshing, compact states, block entities, deterministic material variation, bounded fluids, batched edits, and seed-plus-delta saves.                                        |
| **61-80: World generation**       | Use deterministic derived seeds, staged validated worldgen, guaranteed POC relationships, asynchronous streaming, dynamic regional layers, World Partition support for conventional actors, abstract distant regions, and persistent realm instances.                                          |
| **81-100: Registries and mods**   | Use versioned schemas imported into runtime registries, stable namespaced IDs, localisation keys, generated content families, safe migration, spreadsheet round-tripping, content packs, manifests, and constrained mod extension points.                                                      |
| **101-120: Persistence**          | Use modular atomic saves, journals, rotating backups, schema migrations, stable entity GUIDs, complete NPC/village/quest/automation state, bounded catch-up, integrity validation, recovery tools, and developer inspectors.                                                                   |
| **121-140: AI and LOD**           | Use full nearby actors, compact distant records, schedule plus utility task choice, hierarchical voxel navigation, staged NPC construction, raid planners, group coordination, explicit simulation tiers, and deterministic scenario tests.                                                    |
| **141-160: Networks**             | Use incremental typed graphs, port records, authoritative integer transactions, separate compatible power and mana models, warehouse permissions and reservations, cross-chunk summaries, bounded unloaded simulation, ward coverage, and debug overlays.                                      |
| **161-180: Multiplayer**          | Use authoritative client-server architecture for solo/listen/dedicated modes, design for 1-8 players, validate four-player online later, prove two-player split-screen first, batch block edits, server-owned inventories and AI, scope quests/dialogue, and abstract the replication backend. |
| **181-200: UI and accessibility** | Use reusable UMG/CommonUI-style screens, event-driven view models, command-based actions, Enhanced Input, independent local-player UI, responsive layouts, accessibility metadata, localisation from POC, truthful error reasons, and automated UI tests.                                      |
| **201-220: Quality**              | Set measurable budgets early, profile packaged builds, control ticks, memory, shaders, and LOD, use layered automated testing, secure trust boundaries and mods, privacy-conscious diagnostics, release gates, and tracked technical debt.                                                     |
| **221-240: POC**                  | Build strict stages around the Forest Hamlet loop. Spike voxel editing first, then automation conservation and NPC simulation. Defer full dimensions, full settlements, and full online co-op. Require persistence, readability, accessibility basics, controller parity, and performance.     |

# 3. Technical Goals, Principles, and Non-Goals

## 3.1 Primary Technical Goals

- Prove the complete POC cause-and-effect chain in one packaged build, not only inside the editor.

- Allow blocks, items, recipes, NPCs, villages, machines, spells, creatures, quests, structures, cultures, and realms to reference each other by stable IDs.

- Protect exact resource quantities and ownership across player actions, NPC jobs, machines, warehouses, quests, raids, save/load, and distance simulation.

- Preserve named NPC identity, village history, project progress, structure damage, quest state, world edits, and aftermath across streaming and save boundaries.

- Maintain 60 FPS as the normal PC target through asynchronous work, batching, LOD, graph summaries, asset budgets, and packaged-build profiling.

- Keep solo, split-screen, LAN, and online co-op on one authoritative gameplay model even though full online play is deferred beyond the POC.

- Create enough content tooling and validation that large registries can be maintained without hand-checking every reference.

## 3.2 Core Engineering Principles

| **Principle**                  | **Rule**                                                                                                         | **Example**                                                                                |
|--------------------------------|------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------|
| Single owner for mutable truth | Every mutable record has one owning system and one authoritative mutation path.                                  | The warehouse service owns inventory transactions; UI, NPCs, and machines submit requests. |
| Definitions are immutable      | Content definitions are loaded, validated, resolved, and treated as read-only during normal play.                | An iron ingot definition does not store the quantity in a player stack.                    |
| Events describe facts          | An event is emitted only after an authoritative change succeeds.                                                 | ResourceDelivered records a committed transfer, not an attempted one.                      |
| Commands express intent        | A command contains requested action and context but not assumed success.                                         | PlaceBlock contains expected target state, player, tool, face, and item source.            |
| Queries do not mutate          | Read models and UI queries cannot quietly change game state.                                                     | Opening a project screen cannot reserve resources.                                         |
| Simulation is bounded          | Unloaded catch-up and regional events have time, work, and consequence limits.                                   | A year of absence cannot process billions of machine cycles one by one.                    |
| Presentation is replaceable    | Visual actors, effects, and widgets can be rebuilt from authoritative records.                                   | Belt item meshes are pooled visuals, not the inventory itself.                             |
| Failure is visible             | Invalid data, denied commands, blocked networks, save errors, and migration failures produce actionable reasons. | A machine shows No Output Space rather than silently losing items.                         |

## 3.3 Explicit Non-Goals for Version 0.1

- Final online matchmaking, platform accounts, host migration, moderation services, or console certification.

- Full functional dimensions, full player-founded cities, full economy simulation, full law/government tools, or all final races and cultures.

- Full structural physics, unrestricted voxel destruction in boss arenas, or physically simulated items throughout all logistics networks.

- Unrestricted executable mods or a public scripting API.

- Every final magic school, automation tier, AI family, world biome, structure family, or user-interface screen.

- Perfect final balance values. All provisional counts and budgets remain marked as engineering or balance drafts.

# 4. Engine, Platform, Toolchain, and Dependency Strategy

## 4.1 Unreal Engine 5 Baseline

Use a stable Unreal Engine 5 production release and lock the exact engine version for each milestone. Do not upgrade during a milestone unless a blocking engine defect has a verified fix and the migration is tested on a copy of the repository. Preview releases may be evaluated in a separate branch but must not become the production baseline by convenience.

| **Area**              | **Selected Direction**               | **Implementation Notes**                                                                                                                                                   |
|-----------------------|--------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Core language         | C++                                  | Use for voxel storage/meshing, registries, save systems, simulation services, transactions, networking authority, performance-critical AI, validation, and tests.          |
| Blueprints            | Orchestration and content            | Use for level assembly, actor composition, simple content behaviours, audiovisual hooks, quest presentation, prototypes behind stable interfaces, and designer iteration.  |
| World Partition       | Conventional actor streaming support | Use for landmarks, authored actors, environmental zones, major structures, presentation helpers, and non-voxel world actors. The custom voxel subsystem owns voxel chunks. |
| PCG tools             | Authored procedural support          | Use where they improve editor or runtime placement, but retain deterministic project-owned worldgen stages and validation.                                                 |
| Mass framework        | Optional representation layer        | Evaluate for crowds and lightweight agents. The domain simulation must remain independent enough to operate without Mass.                                                  |
| UMG/CommonUI patterns | UI framework                         | Use reusable screen stacks, input-aware navigation, local-player roots, style tokens, and view-model adapters.                                                             |
| Enhanced Input        | Input framework                      | Use layered contexts, rebinding, controller/keyboard parity, hold/toggle variants, and split-screen local-player separation.                                               |

## 4.2 Target Platforms and Build Configurations

| **Build/Profile**         | **Purpose**                    | **Rules**                                                                                                                                       |
|---------------------------|--------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------|
| Editor Development        | Daily development              | Full validation, debug panels, verbose logs, cheats, hot reload where safe, and developer data inspectors.                                      |
| Development Packaged      | Regular integration testing    | Near-release runtime path with diagnostics, automated smoke tests, representative save loading, and performance tracing.                        |
| Test/QA                   | Internal testing               | Controlled feature flags, test worlds, telemetry consent defaults, issue identifiers, and reproducible version metadata.                        |
| Shipping PC               | Player build                   | No unrestricted developer commands, no sensitive logs, validated content packs, optimised assets, save backups, and player-safe diagnostics.    |
| Dedicated Server - future | Authoritative headless runtime | No rendering dependency in domain simulation. Server-specific build remains future work but interfaces must not assume a rendered local player. |

## 4.3 Dependency and Plugin Rules

- Maintain a dependency register containing version, licence, source availability, update history, supported platforms, project owner, replacement cost, and exit plan.

- Core world data, registries, saves, NPC identity, automation transactions, and game rules may not be owned solely by a closed plugin.

- Wrap high-risk dependencies behind project interfaces. Save data must use project-owned records rather than serialising opaque plugin objects.

- Introduce a plugin only when it removes more verified risk than it creates. Prototype plugins are acceptable in isolated spikes but not automatically approved for production.

## 4.4 Source Control and Build Tooling

Use Git with Git LFS for binary assets. Protect main, prefer short-lived branches, tag milestones, and require build validation before merge. If the project grows into a large art team with frequent binary contention, evaluate Perforce as a deliberate migration rather than an emergency response.

# 5. Project Architecture, Modules, Ownership, and Communication

## 5.1 Architectural Layers

| **Layer**                  | **Owns**                                                                                              | **Must Not Own**                                    |
|----------------------------|-------------------------------------------------------------------------------------------------------|-----------------------------------------------------|
| Foundation                 | Stable IDs, tags, result codes, time, serialization contracts, logging, feature flags, common math.   | Gameplay-specific content or UI.                    |
| Definitions and Registries | Immutable resolved content definitions, schema versions, import reports, aliases, localisation keys.  | Mutable player or world quantities.                 |
| World and Voxel            | Chunk storage, block queries, edits, meshing, lighting, collision, fluids, block entities, streaming. | Village reputation, quest logic, or UI state.       |
| Simulation Domains         | NPCs, villages, creatures, automation, magic, quests, factions, combat, structures, regions.          | Direct widget references or raw file writes.        |
| Persistence                | World manifest, journals, snapshots, migrations, integrity checks, recovery, save scheduling.         | Gameplay decisions about what an action means.      |
| Authority and Networking   | Command validation, replication adapters, relevance, permissions, connection state.                   | Independent duplicate gameplay rules.               |
| Presentation               | Actors, animation, effects, audio, UI, view models, local input.                                      | Authoritative inventory, project, or quest state.   |
| Developer Tools            | Validators, editors, inspectors, traces, test harnesses, debug overlays.                              | Shipping game rules unavailable to runtime systems. |

## 5.2 Ownership Rules

| **State**                    | **Owner**                               | **Mutation Path**                                           | **Persistence Boundary**                  |
|------------------------------|-----------------------------------------|-------------------------------------------------------------|-------------------------------------------|
| Chunk block cells            | Voxel World Service                     | Validated block-edit command or worldgen commit             | Chunk delta record                        |
| Block entity inventory/state | Block Entity Service plus owning domain | Transaction or domain command                               | Block entity record                       |
| Player inventory and gear    | Inventory Service                       | Authoritative inventory transaction                         | Player-world character record             |
| NPC identity and needs       | NPC Simulation Service                  | Scheduled task, event, combat, or validated interaction     | NPC persistent record                     |
| Village storage/projects     | Village Service                         | Warehouse transaction, project reservation, NPC work, event | Village record plus project records       |
| Automation flow              | Automation Service                      | Network topology changes and machine transactions           | Network summaries and machine records     |
| Mana and wards               | Magic Infrastructure Service            | Mana transfer, spell/ritual command, damage, repair         | Magic network and ward records            |
| Quest/event state            | Quest and Event Service                 | Objective/event transitions from authoritative facts        | Quest graph and event records             |
| Faction/reputation           | Social State Service                    | Committed action events and explicit decisions              | Relationship and historical-event records |
| UI state                     | Local player UI layer                   | Input and presentation actions                              | Profile/settings only where appropriate   |

## 5.3 Communication Pattern

| **Contract**   | **Purpose**                                                                                 | **Example**                                                          |
|----------------|---------------------------------------------------------------------------------------------|----------------------------------------------------------------------|
| Command        | Requests a state mutation and includes authority context.                                   | FPlaceBlockCommand, FStartRecipeCommand, FDeliverToWarehouseCommand. |
| Result         | Returns success/failure, reason code, authoritative values, and optional recovery guidance. | Denied_NoPermission; Blocked_OutputFull; Success_Reserved12Iron.     |
| Event          | Immutable record that a committed fact occurred.                                            | BlockPlaced, ResourceTransferred, ProjectStageCompleted, NPCKilled.  |
| Query          | Read-only request returning a snapshot or view projection.                                  | GetWarehouseSummary, GetKnownRecipes, GetWardCoverageAt.             |
| Definition     | Immutable content record resolved by stable ID.                                             | FBlockDefinition, FRecipeDefinition, FCreatureDefinition.            |
| Runtime Record | Mutable world or player state saved independently from presentation actors.                 | FNPCRecord, FMachineRecord, FQuestRuntimeRecord.                     |
| View Model     | Knowledge-aware, localised, accessible UI projection.                                       | FWarehouseViewModel, FRaidPreparationViewModel.                      |

## 5.4 Event Ordering and Idempotency

- Commands that move resources use sequence IDs and transaction IDs. Retried commands must not duplicate items.

- Events are emitted after commit and contain stable entity IDs, world time, source, authority, and correlation ID.

- Cross-system reactions are queued and bounded; an event may not recursively trigger unbounded synchronous chains.

- Important state transitions record the expected previous state so stale commands fail safely rather than overwriting newer state.

# 6. Stable IDs, Definitions, Runtime Records, and Core Data Contracts

## 6.1 Identity Model

| **Identity Type**   | **Format**                                                        | **Use**                                                                                 |
|---------------------|-------------------------------------------------------------------|-----------------------------------------------------------------------------------------|
| Definition ID       | Namespace string or compact resolved ID, e.g. block.terrain.stone | Stable identity across registries, saves, mods, recipes, and localisation.              |
| Runtime Entity ID   | GUID/ULID-style persistent identifier                             | Named NPCs, villages, structures, machines, portals, quests, parties, and unique items. |
| World/Realm ID      | Persistent GUID plus realm definition ID                          | Separates Overworld, future dimensions, test worlds, and server worlds.                 |
| Chunk Coordinate    | Signed integer realm-local XYZ coordinate                         | Voxel storage, streaming, save file location, network relevance, and generation.        |
| Transaction ID      | Monotonic or GUID correlation ID                                  | Resource conservation, retries, logs, contributions, rollback, and support diagnostics. |
| Historical Event ID | Persistent event identifier                                       | NPC memory, village history, quest evidence, faction reactions, and timeline views.     |

## 6.2 Definition versus Instance Rule

Definitions answer what a thing is. Runtime records answer what happened to this instance. Presentation actors answer how the current player sees it. These layers must never be collapsed merely because Unreal allows data and behaviour to live on one actor.

| **Example**       | **Definition Fields**                                                         | **Runtime Fields**                                                                     | **Presentation**                                                 |
|-------------------|-------------------------------------------------------------------------------|----------------------------------------------------------------------------------------|------------------------------------------------------------------|
| Iron Pickaxe      | ID, category, tier, durability maximum, repair material, tool tags, icon key. | Quantity, durability, quality, owner, runes, unique ID only if required.               | First-person mesh, third-person mesh, icon, sound, damage state. |
| Named Builder NPC | Ancestry/culture options, job capabilities, needs profile, movement profile.  | Name, home, household, skill, inventory, memory, health, task, location, GUID.         | Actor, animation, voice, current tool, interaction marker.       |
| Mana Furnace      | Block/machine definition, ports, recipes, power rules, capacity, visuals.     | Block coordinate, inventories, recipe progress, owner, network ID, damage, fault.      | Chunk mesh plus pooled effects and interaction panel.            |
| Quest             | Quest graph, objectives, conditions, rewards, failure/fallback policies.      | Owner/scope, active nodes, bound entity IDs, contributions, deadlines, result history. | Journal entry, world markers, dialogue options, notifications.   |

## 6.3 Closed States versus Extensible Tags

Use enums for small closed technical states such as save-write phase, connection state, or chunk lifecycle. Use stable IDs and hierarchical gameplay tags for content categories, damage types, item families, cultures, magic schools, machine ports, permissions, and mod-extensible behaviours.

## 6.4 Result and Reason Codes

Every consequential command should return a stable machine-readable reason code and a localisable player-facing explanation. This supports UI trust, automated tests, networking reconciliation, accessibility, analytics, and developer diagnosis without parsing arbitrary text.

# 7. Content Registry, Schema, Import, Localisation, and Content-Pack Pipeline

## 7.1 Authoritative Content Source

Use versioned external structured data as the reviewable source for large registries, imported into validated Unreal assets and runtime registries. JSON or schema-preserving structured files are preferred for category-specific records; CSV may be used for flat spreadsheet-friendly tables. Unreal assets reference presentation resources through soft paths and do not become the only readable copy of gameplay data.

## 7.2 Registry Build Pipeline

1.  Parse source files and validate schema version.

2.  Resolve parent templates and composition layers into complete records.

3.  Validate unique IDs, aliases, tags, ranges, required fields, and localisation keys.

4.  Resolve cross-registry references and report missing, circular, deprecated, or forbidden dependencies.

5.  Generate eligible content families such as block shapes, recipe variants, item forms, material styles, and registry documentation.

6.  Produce deterministic runtime assets, content hashes, dependency manifests, and human-readable diffs.

7.  Block packaging on critical failures; quarantine non-critical invalid mod content with precise reports.

## 7.3 Core Registry Families

| **Registry**          | **Base Definition**                         | **Important Extensions**                                                                                 |
|-----------------------|---------------------------------------------|----------------------------------------------------------------------------------------------------------|
| Blocks                | FBlockDefinition                            | Terrain, construction, storage, machine, magic, village, hazard, fluid, realm.                           |
| Items                 | FItemDefinition                             | Block form, resource, tool, weapon, armour, consumable, magic component, machine part, knowledge, quest. |
| Recipes               | FRecipeDefinition                           | Hand, station, furnace, machine, cooking, rune, ritual, project, culture, dimension.                     |
| Resources             | FResourceDefinition                         | Ore, raw, refined, fuel, magic, organic, creature, culture, realm.                                       |
| NPCs and Jobs         | FNPCArchetypeDefinition / FJobDefinition    | Needs, schedules, skills, culture, combat, teacher, merchant, builder.                                   |
| Villages and Projects | FSettlementDefinition / FProjectDefinition  | Storage categories, growth, structures, reservations, raids, laws, permissions.                          |
| Creatures             | FCreatureDefinition                         | Wildlife, livestock, hostile, faction, magical, boss, dimensional.                                       |
| Worldgen              | FBiomeDefinition / FStructureDefinition     | Layers, resources, spawns, roads, anchors, states, blueprints, realms.                                   |
| Magic and Automation  | FMagicDefinition / FMachineDefinition       | Spells, runes, wards, networks, ports, power, mana, risk, upgrades.                                      |
| Quests and Events     | FQuestDefinition / FEventDefinition         | Stages, objective modules, scope, conditions, fallbacks, contribution, consequences.                     |
| UI                    | FScreenDefinition / FNotificationDefinition | Bindings, styles, input, accessibility, localisation, knowledge rules.                                   |

## 7.4 Localisation and Text

- Gameplay definitions store localisation keys and formatting metadata, not English text as identity.

- Development fallback text remains available so missing localisation is obvious and debuggable.

- UI layouts are tested with text expansion, plural forms, gender/number rules where relevant, controller glyphs, and non-Latin font coverage before release scope is set.

- Knowledge-aware text variants prevent undiscovered realms, creatures, recipes, and factions from being spoiled by registry data.

## 7.5 Spreadsheet Round-Tripping

Exports must preserve stable IDs, schema fields, tags, aliases, parent links, and category-specific extensions. Re-import creates a field-level diff and refuses destructive loss when a spreadsheet omits data that exists in the authoritative source.

## 7.6 Content Packs and Mods

Base systems and content are packaged separately where practical: foundation, POC, cultures, biomes, creatures, realms, structures, and future expansions. Every pack has a namespace, manifest, version, dependencies, compatibility range, load order, and content hash. Data mods arrive before executable scripting.

# 8. Voxel World Data Model, Chunks, Blocks, States, and Block Entities

## 8.1 Coordinate and Chunk Model

The default world grid uses one-metre blocks with signed integer coordinates. Begin benchmarking with 32 x 32 x 32 logical chunks and smaller render/update sections if required. The final size is not locked until edit latency, mesh cost, collision, lighting, save size, networking, and memory are tested together.

| **Record**          | **Purpose**                                      | **Key Fields**                                                                                            |
|---------------------|--------------------------------------------------|-----------------------------------------------------------------------------------------------------------|
| FWorldBlockAddress  | Stable location inside a realm.                  | Realm ID, chunk coordinate, local XYZ, optional layer.                                                    |
| FVoxelChunkData     | Authoritative compact block cells.               | Generation version, local palette, packed indices, packed state channels, dirty flags, integrity hash.    |
| FBlockState         | Small per-cell runtime state.                    | Rotation, shape state, moisture, growth, lit/powered, damage stage, corruption, optional extension index. |
| FBlockEntityRecord  | Complex state not suitable for every cell.       | Persistent ID, block address, definition ID, inventories, owner, ports, custom domain payload, version.   |
| FChunkDeltaRecord   | Saved differences from deterministic generation. | Edited cells, added/removed block entities, state overrides, generation version, timestamps.              |
| FChunkRuntimeHandle | Transient streaming/processing state.            | Lifecycle, priority, mesh handles, collision, nav, light, active tasks, cancellation token.               |

## 8.2 Palette Compression

A chunk stores a local palette of global block-definition IDs and compact palette indexes for cells. Uniform, sparse, dense, and compressed representations may be selected based on chunk contents. State channels are bit-packed or stored sparsely when only a minority of cells use a property. Complex inventories and machines never inflate every block cell.

## 8.3 Block Definition and Shape Composition

A resolved block definition combines material family, gameplay category, shape geometry, collision template, occlusion masks, placement rules, mining properties, sounds, rendering style, state capabilities, tags, drops, item form, and connected-system adapters. Stairs, slabs, slopes, beams, posts, fences, walls, arches, windows, roofs, and furniture-sized pieces reuse shape definitions instead of unique code paths.

## 8.4 Block Edit Transaction

| **Step**              | **Action**                                                                                                                               |
|-----------------------|------------------------------------------------------------------------------------------------------------------------------------------|
| 1\. Request           | Player, NPC, machine, spell, structure project, or world event submits a block-edit command.                                             |
| 2\. Validate          | Authority checks expected current block, tool/action, ownership, reach, permissions, required item/resource, protection, and world rule. |
| 3\. Reserve           | Required inventory or project resource is reserved if the change consumes material.                                                      |
| 4\. Commit cell       | Voxel service writes compact block/state data and creates/removes block entity records.                                                  |
| 5\. Commit resources  | Inventory transaction completes. Failure before this point rolls back the edit or reservation.                                           |
| 6\. Mark dependencies | Affected mesh, collision, light, fluid, navigation, support, network, structure, and quest regions become dirty.                         |
| 7\. Emit fact         | BlockPlaced, BlockRemoved, or BlockStateChanged event is published with source and correlation ID.                                       |
| 8\. Replicate/save    | Ordered delta is queued for clients and the chunk delta journal.                                                                         |

## 8.5 Block Entities

Use block entities for machines, inventories, warehouses, portals, signs, ritual anchors, wards, complex farms, blueprint anchors, and any placed object requiring persistent state beyond compact cell channels. A block entity is not automatically a full Unreal actor. It may receive an interaction or visual actor only while relevant.

# 9. Voxel Meshing, Collision, Lighting, Fluids, and Editing Pipeline

## 9.1 Asynchronous Chunk Lifecycle

| **Lifecycle**  | **Thread/Owner**              | **Work**                                                                                                                             |
|----------------|-------------------------------|--------------------------------------------------------------------------------------------------------------------------------------|
| Requested      | Game thread streaming service | Assign priority from players, view, movement, portals, raids, quests, machines, and memory budget.                                   |
| Data available | Worker tasks                  | Load saved delta or run deterministic generation; resolve local palette and block entities.                                          |
| Derived data   | Worker tasks                  | Build visible faces, merged geometry, transparent sections, light data, collision descriptors, fluid surfaces, and navigation cells. |
| Commit pending | Game thread budget            | Create/update render buffers, collision, nav links, presentation actors, and network relevance.                                      |
| Active         | World service                 | Accept edits, simulation, interaction, and visual updates.                                                                           |
| Demotion       | Worker plus game thread       | Write dirty records, release presentation resources, preserve boundary connectors and summaries.                                     |
| Unloaded       | Persistent services           | Retain compressed chunk delta and regional/network state only.                                                                       |

## 9.2 Meshing Strategy

- Cull faces hidden by compatible opaque neighbours.

- Merge coplanar compatible faces through greedy or equivalent meshing while preserving material, light, biome tint, damage, and state boundaries.

- Use separate geometry passes for opaque, cutout, translucent, fluid, emissive, animated, and special shape content.

- Use reusable geometry templates and occlusion masks for non-cubic shapes.

- Batch repeated edits and cancel obsolete mesh tasks before committing stale results.

- Never save mesh data as authoritative world state; rebuild it from chunk data and definitions.

## 9.3 Collision

Generate merged simple collision for solid terrain and reusable collision shapes for slabs, stairs, slopes, posts, fences, and machine blocks. Avoid one physics body per block. Complex trace collision is restricted to special interactive objects and does not become the default terrain collision.

## 9.4 Gameplay Lighting

Separate gameplay-readable voxel light data from high-fidelity presentation lighting. A bounded light-propagation or equivalent field controls spawn safety, crop/light rules, cave readability, ward and magical-light interactions, and block-level queries. Unreal lighting, pooled dynamic lights, emissive materials, fog, and effects present the result to the player. One dynamic light actor per glowing block is not permitted.

## 9.5 Fluids

Use a bounded local voxel fluid model based on levels/cells for gameplay water, lava, poison, and similar fluids. Updates are scheduled around changed cells and active players, not every fluid cell every frame. Large rivers, lakes, waterfalls, and oceans may use hybrid presentation systems while maintaining voxel interaction at shorelines and edited areas.

## 9.6 Mining Damage and Support Rules

Track transient mining damage only for actively damaged cells, with persistent damage stages reserved for structures, raids, fire, corruption, repair, and story state. Floating blocks remain the default. Tagged loose blocks use bounded falling updates; the project does not implement a full structural integrity physics simulation by default.

# 10. Rendering, 32x32 Material Variation, Visual LOD, and Asset Budgets

## 10.1 32x32 Base Texture Direction

Authored block textures use a 32 x 32 base style to preserve voxel readability and production scalability. They are stored in texture arrays or controlled atlases rather than as separate runtime materials for every block. The engine adds deterministic variation without creating a unique texture or material instance for every placed cell.

## 10.2 Engine-Driven Variation Inputs

| **Input**                       | **Possible Visual Effect**                                                    | **Storage/Computation**                                   |
|---------------------------------|-------------------------------------------------------------------------------|-----------------------------------------------------------|
| World seed and block coordinate | Pattern offset, face variant, minor colour/material variation.                | Deterministic hash in shader or mesh metadata.            |
| Biome and region                | Temperature tint, moisture, moss, dust, frost, mineral staining.              | Packed biome/region index and shared lookup.              |
| Rarity and quality              | Subtle trim, crystal inclusion, emissive accents, icon and item presentation. | Definition and instance presentation metadata.            |
| Block state                     | Wet, powered, lit, active, damaged, repaired, occupied, growth stage.         | Packed block state and selective decals/effects.          |
| Magic charge and school         | Rune colour/pulse, channel pattern, magical residue.                          | Mana network state and material parameter.                |
| Corruption or blessing          | Veins, desaturation, glow, cracks, spores, cleansing transition.              | Dynamic world-state layer and local block override.       |
| Age/weather/culture             | Weathering, carving, paint, banners, architectural motifs.                    | Structure/culture style token plus deterministic variant. |

## 10.3 Material Architecture

- Use a small number of shared master material families with limited static permutations.

- Pack per-face or per-vertex metadata for texture index, rotation, tint group, state, light, and variation seed.

- Limit translucency, layered effects, parallax, and expensive procedural noise in high-density block scenes.

- Use pooled effects and decals for rare high-value states rather than adding cost to every block shader.

- Distance LOD may simplify normal detail, animation, emissive pulses, wetness, decals, and transparency while preserving silhouette and gameplay cues.

## 10.4 Character, Creature, Machine, and Structure Assets

Characters, creatures, tools, machines, and major props may use more detailed non-voxel meshes. Asset budgets must define triangle count, material slots, texture memory, animation complexity, skeleton sharing, collision, effects, audio emitters, and LOD. High fidelity does not permit every village prop, creature, and machine to use unique heavy materials or permanent tick-driven effects.

# 11. World Generation, Streaming, Regions, Roads, Structures, and Dynamic State

## 11.1 Seed Derivation

A stable master seed produces named sub-seeds through a project-owned hash function. Terrain, climate, caves, resources, structures, names, roads, events, ecology, mana, and realms use separate derivations so one system can change without unintentionally rerolling all others. The derivation algorithm and version are saved.

## 11.2 Staged Generation Pipeline

| **Stage**                 | **Produces**                                                                      | **Validation**                                                                       |
|---------------------------|-----------------------------------------------------------------------------------|--------------------------------------------------------------------------------------|
| Realm and region plan     | World bounds/preset, region identities, climate bands, major progression anchors. | Required central playable area and no impossible region topology.                    |
| Terrain density           | Surface, altitude, mountains, valleys, coast/river basins.                        | Spawnable/buildable areas and no catastrophic terrain discontinuities.               |
| Biome layers              | Temperature, moisture, altitude, depth, mana, corruption, civilisation, danger.   | Allowed biome combinations and readable transitions.                                 |
| Water and caves           | Rivers, lakes, drainage, cave networks, chambers, entrances.                      | Connectivity, valid water paths, cave access, no required content sealed.            |
| Resources                 | Veins, grades, large deposits, clues, purity, by-products.                        | Starter and progression resources within configured ranges.                          |
| Civilisation and routes   | Village sites, faction territories, roads, bridges, crossings, trade links.       | Accessible routes, valid water/resource relationship, no overlapping critical sites. |
| Structures and threats    | Ruins, camps, mines, shrines, nests, landmarks, raid sources.                     | Spacing, biome rules, ownership, progression fallback.                               |
| Ecology and magic         | Creature spawns, livestock suitability, mana pockets, wards, corruption sources.  | Starter safety, signposted threats, POC magical clue.                                |
| Final relation validation | POC relation graph and global constraints.                                        | Guaranteed cause-and-effect route and fallback placement.                            |

## 11.3 POC Valley Relation Graph

The POC valley is procedurally generated but constrained. It must contain a wilderness spawn near a forest hamlet, river or lake, buildable route, surface wood/stone/food, copper and iron access, cave entrance, mana clue or crystal pocket, old rune ruin, goblin camp, road/trail network, warehouse, and raid approach. The exact shape varies by seed; the gameplay relationship does not.

## 11.4 Structure Blueprint Model

A structure definition contains modular block volumes, sockets, markers, material tags, culture style, terrain-adaptation rules, entrances, paths, NPC job sites, loot anchors, power/mana connectors, states, damage masks, ownership, and restoration transitions. The same structure can exist unfinished, damaged, burned, occupied, corrupted, restored, claimed, or conquered without requiring unrelated duplicate levels.

## 11.5 Streaming Responsibility

- The custom voxel service streams chunk data, meshes, collision, light, fluids, navigation cells, and voxel block entities.

- World Partition or equivalent engine streaming manages conventional actors, large landmarks, environmental zones, authored sequences, and presentation helpers.

- Regional services persist settlement, faction, route, event, ecology, and automation summaries independent of actor loading.

- Streaming priority combines all local players, view, movement, active raids, quests, portals, machines, NPC commitments, and memory budget.

## 11.6 Dynamic World-State Layers

| **Layer**           | **Examples**                                                    | **Technical Effect**                                                       |
|---------------------|-----------------------------------------------------------------|----------------------------------------------------------------------------|
| Civilisation        | Road quality, walls, farms, industry, ownership, patrol safety. | Generation overlay, spawn rules, trade routes, visuals, region simulation. |
| Corruption/blessing | Void influence, curse, warding, cleansing, sacred ground.       | Block variants, creature pressure, mana rules, event risk, NPC reaction.   |
| Extraction/industry | Depletion, noise, pollution, instability, mine network.         | Resource summaries, faction concern, creature attraction, visual evidence. |
| Damage/disaster     | Fire, raid damage, flood, storm, collapse, abandoned state.     | Structure and block state deltas, repair projects, migration, quests.      |
| Season/weather      | Snow, wetness, crop cycle, travel difficulty, visibility.       | Presentation plus bounded gameplay modifiers and event scheduling.         |

# 12. Save Games, Persistence, Journals, Migration, and Recovery

## 12.1 Save Layout

| **Component**            | **Contents**                                                                                                  | **Write Strategy**                                                |
|--------------------------|---------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------|
| World Manifest           | World/realm IDs, seed, game/build version, schema versions, mods/content hashes, settings, last clean commit. | Small atomic file updated after successful subsystem commits.     |
| Player/Character Records | Inventory, gear, progression, knowledge, reputation modifiers, location, tombstone/recovery state.            | Transactional player record with backup.                          |
| Realm and Region Records | Region summaries, settlements, factions, routes, threats, ecology, events, dynamic layers.                    | Partitioned files updated on schedule or dirty state.             |
| Chunk Delta Files        | Edited cells, state overrides, block entities, generation version.                                            | Append journal then compact to atomic snapshot.                   |
| Entity Records           | NPCs, creatures requiring persistence, unique items, machines, structures, portals.                           | Partition by region/owner with schema versions.                   |
| Domain Snapshots         | Automation graphs, mana networks, quests, projects, histories, permissions, scheduled work.                   | Owner system serialises its explicit persistent record.           |
| Recovery Data            | Journals, checksums, migration backups, rotating autosaves, issue report metadata.                            | Never overwrite the last known-good snapshot before verification. |

## 12.2 Atomic Save Procedure

8.  Freeze or snapshot the minimal authoritative records required without pausing all simulation longer than the frame budget.

9.  Serialise and compress on worker threads where safe.

10. Write temporary files and transaction journal entries.

11. Validate schema, ranges, references, checksums, and expected dirty-record counts.

12. Atomically replace committed files and update the world manifest last.

13. Retain rotating known-good backups and clear completed journal entries.

14. On failure, keep the previous committed world and display an actionable player-safe error.

## 12.3 Migration Rules

- Global, subsystem, and record schema versions are stored explicitly.

- Migrations are ordered, deterministic, tested, and run on a backup copy before replacing the original.

- Stable IDs use aliases and migration maps for renamed or moved content.

- Removed mod content becomes a missing-content placeholder with preserved quantity/state where possible, never silent deletion.

- Experimental saves may be declared incompatible only when the cost of reliable migration is documented before release of the experimental build.

## 12.4 Integrity and Recovery

Integrity checks cover manifests, hashes, ranges, entity references, inventory conservation, project reservations, quest bindings, realm links, network summaries, and transaction markers. Recovery restores a known-good snapshot or quarantines damaged records with a report. Silent partial loading is unacceptable when it would erase meaningful player progress.

## 12.5 Catch-Up after Unload or Offline Time

Bounded catch-up uses stored inputs, power, capacity, maintenance, route safety, NPC availability, threat events, and output space. It applies aggregate intervals or scheduled events rather than simulating every missed second. World settings decide whether real-world elapsed time matters; normal single-player progress should not require the game to remain running.

# 13. Simulation LOD, Time, Scheduling, and Unloaded-World Processing

## 13.1 Simulation Levels

| **Level**              | **Representation**                                                                                    | **Typical Systems**                                                                   |
|------------------------|-------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------|
| L0 - Full Interactive  | Actors, animation, collision, local pathfinding, visible item flow, detailed combat and construction. | Players, nearby named NPCs, active creatures, inspected machines, active raid area.   |
| L1 - Reduced Local     | Lightweight actors or entities, lower update rate, simplified perception/animation, local tasks.      | Nearby village population outside direct view, local wildlife, inactive machines.     |
| L2 - Chunk Summary     | Compact records with scheduled task batches and network summaries.                                    | Unseen portions of an active settlement, cross-chunk logistics, farms, patrol routes. |
| L3 - Regional Abstract | Settlement, faction, route, threat, project, ecology, and economy totals processed by bounded events. | Distant villages, caravans, camps, regional conflict, inactive dimensions.            |
| L4 - Dormant Archive   | Persistent identity and scheduled wake conditions only.                                               | Very distant minor sites, resolved structures, inactive historical entities.          |

## 13.2 Promotion and Demotion

Promotion reconstructs a valid local representation from persistent state at an interpolated position or task phase. Demotion writes authoritative actor results back into compact records, resolves incomplete local interactions, releases reservations or preserves them explicitly, and destroys presentation resources. Hidden actors are not used as the long-term distant simulation model.

## 13.3 Time Services

| **Clock**       | **Use**                                                | **Rule**                                                                  |
|-----------------|--------------------------------------------------------|---------------------------------------------------------------------------|
| Real frame time | Animation, input, camera, immediate effects.           | Never drives persistent production directly.                              |
| Simulation time | NPC tasks, machines, crops, needs, mana, project work. | Owned by authoritative world clock; can pause or scale under world rules. |
| World calendar  | Days, seasons, festivals, migrations, long events.     | Persistent, deterministic, and queryable without loading all actors.      |
| Network time    | Prediction, reconciliation, event ordering.            | Server-owned with client estimation.                                      |
| Wall-clock time | Optional offline progression or real-world events.     | Opt-in or tightly bounded; never silently causes catastrophic loss.       |

## 13.4 Scheduler

- Use priority queues or timing wheels for machine completions, NPC task checkpoints, quest deadlines, event starts, and region processing.

- Batch similar updates to avoid one timer or tick per machine, crop, NPC need, or block.

- Prioritise visible danger, player interaction, authoritative transactions, and deadline-sensitive events over routine production summaries.

- Apply per-frame and per-region work budgets; unfinished low-priority work carries forward rather than causing a hitch.

- All scheduled persistent work has a stable owner ID and survives save/load.

# 14. NPC, Creature, Navigation, Construction, and Raid AI

## 14.1 Persistent Agent Architecture

Named NPCs are persistent records that may be represented by actors, lightweight entities, or abstract regional state. The record owns identity, household, culture, faction, skills, needs, inventory, health, job, commitments, memories, relationships, and location anchors. The actor is a local controller and presentation, not the identity itself.

## 14.2 Task Selection

| **Priority Layer** | **Examples**                                                                | **Selection Rule**                                                               |
|--------------------|-----------------------------------------------------------------------------|----------------------------------------------------------------------------------|
| Crisis override    | Flee fire, defend raid, rescue, heal, seek shelter, stop dangerous machine. | Immediate safety and village policy override normal schedule.                    |
| Committed work     | Reserved project task, delivery, patrol, caravan, ritual, conversation.     | Preserve commitments unless invalid or a higher-priority crisis occurs.          |
| Needs              | Food, sleep, medicine, warmth, tool replacement, morale.                    | Utility score considers urgency, access, cost, schedule, and consequences.       |
| Job schedule       | Farm, mine, build, guard, trade, teach, repair.                             | Schedule creates candidate tasks; resources and worksite determine availability. |
| Social/cultural    | Family, worship, festival, mourning, conversation.                          | Relationship, culture, event, and personal traits affect utility.                |
| Idle/ambient       | Wander, rest, observe, maintain home.                                       | Low-cost fallback with no unbounded path requests.                               |

## 14.3 Voxel-Aware Navigation

- Local navigation uses walkability cells or polygons derived from voxel collision, slopes, stairs, ladders, doors, jumps, water, hazards, ownership, and dynamic obstacles.

- Hierarchical region portals and road graphs avoid A\* across the whole world.

- Block edits mark only affected nav cells and links dirty. Rebuilds run asynchronously and invalidate relevant paths.

- NPCs use local obstacle recovery, doorway reservations, queues, and limited steering to avoid piles.

- Long-distance travel uses route graphs and abstract progress, promoting visible travellers near players.

## 14.4 NPC Construction

Builders read staged project blueprints. The project service reserves exact resources and exposes reachable work packages. A builder selects a package, obtains tools/material, navigates to a valid work position, performs timed work, and submits a validated block-edit batch. Distant construction consumes the same reserved resources and advances equivalent stages through abstract simulation.

## 14.5 Creature and Combat AI

Creature definitions select reusable profiles for territory, senses, hunger, fear, pack behaviour, faction objectives, combat role, terrain use, drops, and world interactions. Combat action selection uses role-aware utility rather than fixed attack rotation only. Bosses and raid leaders extend profiles with phase and objective logic.

## 14.6 Goblin Raid Planner

| **Input**                 | **Examples**                                                | **Output Effect**                                                  |
|---------------------------|-------------------------------------------------------------|--------------------------------------------------------------------|
| Raid source               | Goblin camp strength, leader, supplies, losses, hostility.  | Maximum force, roles, retreat threshold, escalation.               |
| Village value             | Warehouse stock, project stage, magic supply, population.   | Theft, sabotage, capture, destruction, or intimidation objectives. |
| Defence                   | Watchtower, guards, lighting, walls, wards, traps, patrols. | Approach selection, role mix, timing, target priority.             |
| History                   | Previous defeat, camp damage, diplomacy, player attacks.    | Revenge, caution, negotiation, alternate routes, stronger leader.  |
| Difficulty/world settings | Raid size, NPC death, structure damage, telegraphs.         | Bounded challenge and consequence rules.                           |

## 14.7 AI Testing

- Deterministic schedule/need simulations over many in-game days.

- Navigation tests after mining, placement, doors, bridges, scaffolds, fluids, and structure damage.

- Project tests for reservations, unreachable work, missing tools, interruption, death, save/load, and distance LOD.

- Raid matrices covering incomplete/complete watchtower, powered/unpowered ward, guard supply, player absence, and camp state.

- Promotion/demotion soak tests proving identities, inventories, locations, tasks, and memories remain consistent.

# 15. Automation, Logistics, Storage, Power, Mana, Wards, and Transactions

## 15.1 Network Service Model

Automation is represented by typed incremental graphs. Item transport, mechanical power, electrical power, mana, control, storage, roads, and portal routes may share graph infrastructure and diagnostics, but their compatibility, capacity, risk, and propagation rules remain distinct.

| **Network**                 | **Nodes/Edges**                                                                  | **Authoritative State**                                                                    |
|-----------------------------|----------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------|
| Item logistics              | Machine/storage ports, chutes, belts, pipes, carts, warehouse inputs.            | Queued batches, capacity, filters, ownership, blockages, destination, boundary connectors. |
| Mechanical power            | Cranks, shafts, gears, water/wind sources, machines.                             | Speed/torque abstraction, capacity, load, stalls, damage.                                  |
| Electrical/industrial power | Generators, wires, batteries, priority buses, machines.                          | Generation, storage, demand, capacity, fault, priority.                                    |
| Mana                        | Crystals, batteries, conduits, furnaces, wards, rituals, village infrastructure. | Amount, rate, purity, loss/instability, priority, source, ownership.                       |
| Control/rune logic          | Sensors, filters, gates, priority, schedule, safety shutdown.                    | Conditions, allowed actions, signal state, permissions.                                    |
| Route/transport             | Roads, carts, rails, caravans, later portals.                                    | Capacity, travel time, danger, ownership, cargo commitments.                               |

## 15.2 Resource Transaction Rules

| **Conservation Rule**                                                                                                                                                                                                                                                                                                                   |
|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Items, fluids, fuel, mana units, project supplies, and currency may only move through validated transactions or explicit world-loss events. Visual movement never owns quantity. No system may create or delete resources because a chunk unloaded, a client retried a request, a machine changed LOD, or a save occurred mid-transfer. |

| **Transaction Phase** | **Rule**                                                                                          |
|-----------------------|---------------------------------------------------------------------------------------------------|
| Identify              | Source, destination, resource ID/tag, quantity, owner, delivery mode, correlation ID.             |
| Validate              | Check existence, permission, filter, capacity, expected versions, reservations, and system rules. |
| Reserve               | Lock source quantity and destination capacity without duplicating ownership.                      |
| Commit                | Subtract source and add destination atomically, or record a deliberate world spill/loss event.    |
| Record                | Emit contribution, contract, project, quest, reputation, and audit facts after success.           |
| Rollback              | Release reservations and return an exact reason if any required commit fails.                     |

## 15.3 Machine Processing

Machines use scheduled completion or bucketed processing, not per-frame recipe ticks. A machine record stores definition, inventories, selected recipe, progress, power/mana state, ports, owner, network IDs, maintenance, damage, fault, and last simulation time. Visual movement and animation interpolate from authoritative state.

## 15.4 Cross-Chunk and Unloaded Networks

- Chunk boundaries store persistent connector records and network IDs so unloading does not break topology or lose goods.

- Visible local networks show pooled item meshes and effects; distant networks use batches and flow summaries with equivalent capacity and blockage rules.

- Unloaded processing is bounded and consumes real stored inputs, power, maintenance, output capacity, and event risk.

- On promotion, detailed local state is reconciled from the summary. Any discrepancy triggers a diagnostic rather than silent correction.

## 15.5 Warehouse and Project Integration

Village warehouse inputs are permission-controlled. Delivery transactions record contributor, owner, donation/sale/contract/project mode, category, exact quantity, quality where relevant, and reservation destination. Project resources are reserved within eligible stores and cannot be consumed by daily needs unless an explicit emergency override succeeds.

## 15.6 Wards and Corruption

Wards use spatial coverage records linked to mana supply, source, threat categories, stability, ownership, overlap, gaps, and damage. Corruption and instability propagate through bounded region or network updates using sources, exposure, resistance, time, cleansing, wards, material tags, and difficulty settings rather than unrestricted per-cell simulation.

# 16. Quest, Event, Reputation, Faction, and World-State Architecture

## 16.1 Quest Graph Runtime

| **Layer**       | **Definition Data**                                                       | **Runtime Data**                                                                 |
|-----------------|---------------------------------------------------------------------------|----------------------------------------------------------------------------------|
| Quest           | Graph, scope rules, entry conditions, rewards, failure/fallback policies. | Owner, active nodes, completion/failure, contribution, history.                  |
| Objective       | Type, target query, required amount/state, visibility, alternatives.      | Bound entity/location IDs, current amount/state, deadlines, invalidation reason. |
| Event           | Trigger rules, stages, scale, participants, compatibility, consequences.  | Scheduled/active/resolved state, affected regions, generated context, evidence.  |
| Dialogue choice | Conditions, authority mode, effects, knowledge, localisation.             | Speaker, votes/consensus, selected result, irreversible confirmation.            |
| World evidence  | Structure state, item, NPC memory, faction change, region layer.          | Stable references and historical event IDs.                                      |

## 16.2 Stable World Bindings

Objectives bind to persistent entity IDs, structure IDs, region queries, registry tags, or generated target groups. They do not rely solely on an actor pointer or display name. Every objective defines what occurs if a target dies, moves, changes faction, is destroyed, becomes unreachable, unloads, or is replaced by world simulation.

## 16.3 Event Authority and Contribution

- World, party, village, faction, and individual quest scopes are explicit.

- Contributions record delivery, construction, production, combat, healing, scouting, ritual work, diplomacy, discovery, transport, and leadership.

- Multiplayer dialogue defines leader choice, vote, consensus, personal response, or host/world authority per conversation.

- Events progressing off-screen use bounded region simulation and leave persistent evidence and summaries.

- Quest and event transitions are caused by authoritative events, not UI counters that can disagree with the world.

## 16.4 Reputation, Fear, Trust, and Faction State

Social state is layered: individual memory, village reputation, faction/culture standing, trust, fear, legal status, ownership, treaties, and historical events remain separate. Systems query a resolved relationship view for trade, permissions, dialogue, raids, law, migration, and story without overwriting the underlying evidence.

# 17. Combat, Damage, Gear, Defence, and Aftermath Architecture

## 17.1 Combat Authority

In solo the local world host is authoritative; in multiplayer the server validates combat actions, resources, timing, positions, permissions, friendly-fire rules, target state, and structure damage. Clients predict player movement and suitable presentation, but do not own final damage, inventory consumption, death, or persistent aftermath.

## 17.2 Action and Damage Records

| **Record**              | **Fields**                                                                                                 | **Use**                                                                                        |
|-------------------------|------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------|
| FCombatActionDefinition | Input action, weapon/spell requirements, timing, movement, stamina/mana, hit shapes, tags, animation cues. | Reusable attacks, blocks, dodges, spells, tools, creature actions.                             |
| FCombatActionState      | Actor, action ID, phase, sequence, start time, charge, target/aim data.                                    | Prediction, validation, interruption, animation, save only when needed.                        |
| FDamagePacket           | Source, instigator, owner, action, damage types, amount, penetration, status, hit location, tags.          | Single cross-system damage contract for players, NPCs, creatures, blocks, machines, and wards. |
| FDefenceResolution      | Block/parry/dodge/armour/ward result, mitigated values, durability, stagger.                               | Deterministic combat result and UI feedback.                                                   |
| FCombatHistoricalEvent  | Deaths, injuries, structure damage, raid contribution, crime/friendly fire.                                | Quest, reputation, village history, aftermath, moderation.                                     |

## 17.3 Defence Integration

Watchtowers, walls, gates, lighting, traps, wards, guard equipment, medicine, food, repair stock, patrols, and camp disruption contribute through explicit defence records. The raid planner and aftermath service query these facts; they do not rely on a single hidden village-defence number.

## 17.4 Structure Damage and Repair

Tagged blocks and block entities accept damage packets and transition through damage states. Fire, corruption, siege, and raid damage create chunk deltas and structure-state changes. Repair projects reserve exact resources, assign work, and restore blocks/states through the same edit and transaction systems used for construction.

## 17.5 POC Combat Boundary

- Basic melee, bow, shield/block, dodge, stamina, healing, one combat spell, guard AI, goblin roles, and raid captain.

- No full limb simulation, unrestricted structural physics, PvP balance, advanced boss framework, or complete weapon tree.

- Accessibility options include aim help, timing support, telegraph strength, damage/raid settings, reduced flashes, simplified input, and peaceful/custom presets.

# 18. UI, Input, Accessibility, Localisation, and Player-Trust Architecture

## 18.1 UI Data Flow

| **Direction**           | **Rule**                                                                                                                                           |
|-------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------|
| Gameplay -\> View Model | Owner systems publish snapshots and change events. View models apply knowledge, permission, localisation, accessibility, and local-player filters. |
| View Model -\> Widget   | Widgets bind to stable presentation fields and do not poll every actor each frame.                                                                 |
| Widget -\> Command      | Player actions submit commands or transaction requests through system interfaces.                                                                  |
| Result -\> Feedback     | Authoritative success/failure reason updates UI, world presentation, audio, notifications, and focus.                                              |
| Save/Profile            | Only appropriate settings, layout preferences, filters, and accessibility choices persist in profile or local-player settings.                     |

## 18.2 Screen and Input Architecture

- Use reusable screen stacks and panels with predictable back/cancel behaviour, focus restoration, controller navigation, keyboard shortcuts, and pointer support.

- Enhanced Input contexts separate gameplay, building, machine configuration, menus, dialogue, map, photo mode, debug, and local players.

- First-person and third-person share data and actions but use perspective-specific targeting, reticle, camera collision, placement, and animation feedback.

- Split-screen uses independent local-player UI roots, safe areas, focus, notifications, and input contexts. Shared world summaries are explicit rather than accidental globals.

## 18.3 Accessibility as Data

Reusable widgets require semantic labels, roles, values, state text, focus order, narration hints, non-colour cues, caption links, text scaling, reduced motion/flash alternatives, and device-independent actions. Validation reports missing metadata. Accessibility is not an optional visual skin added after POC.

## 18.4 Localisation

All player-facing text uses localisation keys and formatted arguments. The POC tests text expansion, pluralisation, controller glyph swapping, scalable UI, and font fallback. Mod content must provide namespace-safe localisation keys and development fallback text.

## 18.5 Truthful Feedback

| **Player Trust Rule**                                                                                                                                                                                                                                                                                                                                                                 |
|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| The UI, world effects, audio, logs, and gameplay result must consume the same authoritative reason and state. A machine cannot look powered while the simulation reports no power; a project cannot show delivered iron that is not reserved; a denied action must explain whether the cause is ownership, missing resource, knowledge, danger, invalid target, or network authority. |

# 19. Multiplayer, LAN, Split-Screen, Authority, Replication, and Reconnection

## 19.1 Network Model

Use an authoritative client-server model that also serves solo play. The single-player process hosts the authoritative world locally. Listen-server co-op and LAN use the same command validation and persistence. Dedicated servers are a later deployment mode, not a separate ruleset.

| **System**            | **Authority**                                              | **Replication/Client Behaviour**                                                                  |
|-----------------------|------------------------------------------------------------|---------------------------------------------------------------------------------------------------|
| Player movement       | Server with client prediction/reconciliation.              | Client predicts responsive movement; server corrects invalid state.                               |
| Block edits           | Server/world host.                                         | Client sends expected edit command; server batches ordered deltas and occasional chunk snapshots. |
| Inventories/resources | Server/world host.                                         | Sequence-based transactions, concise deltas, failure reasons, resync snapshots.                   |
| NPCs/creatures        | Server/world host.                                         | Prioritised movement/action/status; client animation and effects are presentation.                |
| Automation/mana       | Server/world host.                                         | Local visible flow plus summaries/faults/inventory deltas according to relevance.                 |
| Quests/dialogue       | Declared world/party/village/faction/individual authority. | UI displays scope, contributor state, vote/leader/consensus rule, and result.                     |
| Saves                 | Server/world host.                                         | Clients retain safe preferences and reconnection metadata only.                                   |

## 19.2 Player Counts and Local Players

Design domain systems for approximately 1-8 co-op players, while later online validation initially targets four. Implement local-player separation from the foundation and test two-player split-screen first. Four-player split-screen remains an evaluated performance and readability goal rather than a POC commitment.

## 19.3 Block and Chunk Replication

- Batch rapid block edits into compact commands and ordered deltas rather than one reliable RPC per cell.

- Validate tool, reach, expected state, item source, permissions, protection, rate, and world settings on the server.

- Use chunk snapshots and integrity hashes for join-in-progress or resynchronisation.

- Network relevance includes all local split-screen players and active remote-player interests.

## 19.4 Reconnection and Host Migration

Reconnection restores player identity, authoritative character state, current world manifest, relevant chunk snapshots, quest scope, and pending transaction results. Seamless host migration is deferred. Modular authoritative saves and reconnection records keep future migration possible without claiming it is solved in the POC.

## 19.5 Backend Abstraction

Gameplay systems depend on project networking contracts rather than one Unreal replication backend. Begin with mature standard replication and project relevance controls. Benchmark newer backend options only when they are production-suitable for the selected engine version and project scale.

# 20. Modding, Extensibility, Compatibility, and Security Boundaries

## 20.1 Data Mod Foundation

| **Manifest Field**          | **Purpose**                                                                  |
|-----------------------------|------------------------------------------------------------------------------|
| Mod ID and namespace        | Prevents stable-ID collision and identifies ownership.                       |
| Version and schema range    | Defines compatibility with game and registry schemas.                        |
| Dependencies and load order | Ensures required content is available and patches are deterministic.         |
| Content hashes              | Detects client/server mismatch and damaged packages.                         |
| Override/patch policy       | Declares which definitions or fields may be extended or replaced.            |
| Permissions                 | Declares requested UI, file, network, scripting, or world-generation access. |
| Localisation and assets     | Lists language namespaces and soft asset packages.                           |

## 20.2 Conflict and Missing Content

Conflict diagnostics show load order, conflicting fields, dependencies, and resolution. Saves preserve missing-definition placeholders and original IDs so removed content can be restored later. Last-file-wins behaviour is permitted only through an explicit patch rule, never as an invisible default.

## 20.3 Scripting Boundary

Version 0.1 supports data-driven mods first. A future scripting layer must be constrained, documented, permission-aware, and isolated from unrestricted file, process, network, memory, and administrative access. Unrestricted C++ or arbitrary Blueprint execution is not a public mod API.

## 20.4 Security Trust Boundaries

- The server validates all consequential commands and never trusts client inventory, damage, block, quest, or permission results.

- Mod file access is sandboxed to approved paths and packages. Archive extraction protects against path traversal and oversized content.

- Admin operations are authenticated, logged, rate-limited, and separate from normal player commands.

- Save files are validated before deserialisation and use bounded lengths, ranges, and reference counts.

- Analytics and crash reports minimise personal data, use consent where required, and document retention and deletion practices.

# 21. Performance Budgets, Profiling, Scalability, and Hardware Targets

## 21.1 Hardware and Frame Target

Target 60 FPS for normal Windows PC play at 1080p on a realistic mid-range gaming PC, with scalable settings and a 30 FPS fallback profile for weaker hardware or demanding split-screen situations. Exact reference hardware is selected at POC start and retained for repeatable testing.

## 21.2 First-Pass Budget Categories

| **Budget**   | **Initial Direction**                                                                            | **Measurement**                                                                      |
|--------------|--------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------|
| Frame pacing | 16.67 ms target; normal streaming must avoid repeated visible hitches.                           | Packaged build traces using representative valley, village, raid, and factory saves. |
| Game thread  | Prefer \<= 8 ms typical on target hardware, leaving headroom for spikes.                         | Per-system traces for world commit, AI, automation, UI, combat, and replication.     |
| GPU          | Prefer \<= 14 ms at 1080p medium target profile.                                                 | GPU captures for village day/night, cave, raid, magic, automation, split-screen.     |
| Chunk commit | Bound game-thread mesh/collision/nav/light commits to a small per-frame budget.                  | Streaming benchmark while sprinting/flying through generated terrain.                |
| Save hitch   | Autosave preparation and commit should not create a noticeable multi-frame pause.                | Large edited world and active settlement save tests.                                 |
| Memory       | Set subsystem budgets for chunks, meshes, entities, assets, navigation, saves, and UI.           | Memory reports, streaming peaks, long-session leak tests.                            |
| Network      | Batch edits and resource deltas; do not replicate visual belt items or full chunks continuously. | Latency/loss multi-instance tests and packet captures.                               |

## 21.3 Scalability Controls

| **System**         | **Scalability Levers**                                                                                                    |
|--------------------|---------------------------------------------------------------------------------------------------------------------------|
| Voxel world        | Chunk radii, mesh LOD, lighting distance, collision distance, fluid update budget, generation workers, material detail.   |
| NPCs and creatures | Actor LOD, animation LOD, perception distance, path budget, update frequency, crowd representation, regional abstraction. |
| Automation         | Visible item density, pooled visuals, summary distance, machine update buckets, effects, graph diagnostics.               |
| Magic and effects  | Dynamic lights, particles, translucency, shadow quality, ward visual density, corruption decals.                          |
| UI/split-screen    | Render scale, map update rate, notification density, independent viewport effects, animation complexity.                  |
| World simulation   | Regional event frequency, distant catch-up cap, ecology detail, caravan detail, inactive-realm cadence.                   |

## 21.4 Profiling Rules

- Profile packaged builds regularly; editor FPS is not a release metric.

- Use representative saves containing edited terrain, active villagers, warehouse, automation, mana, combat, damaged structures, and long play history.

- Maintain trace markers and subsystem counters from the start, including chunk queues, path requests, active transactions, graph updates, save dirty records, and UI binding counts.

- Performance regressions that threaten budgets block merges or release according to severity and milestone rules.

# 22. Testing, Validation, Continuous Integration, and Release Gates

## 22.1 Test Layers

| **Layer**                     | **Examples**                                                                                                                           |
|-------------------------------|----------------------------------------------------------------------------------------------------------------------------------------|
| Unit and property tests       | ID parsing, seed derivation, palette encoding, transactions, utility scores, damage math, tag resolution, migration helpers.           |
| Schema and content validation | Missing references, duplicate IDs, cycles, invalid ranges, localisation gaps, unsafe mod patches, generated-family conflicts.          |
| Subsystem tests               | Chunk edit/save/load, machine processing, warehouse reservation, quest transition, NPC schedule, ward coverage, navigation update.     |
| Integration tests             | Mining -\> crafting -\> automation -\> warehouse -\> project; raid -\> damage -\> repair -\> reputation -\> history.                   |
| Gameplay flow tests           | Automated or guided POC end-to-end scenario in a packaged build.                                                                       |
| Network tests                 | Multi-process latency/loss, block batches, inventory races, join-in-progress, reconnect, quest scope, split-screen plus remote client. |
| Performance tests             | Seed suite generation, streaming traversal, village/raid/factory traces, long-session memory, save/load, shader complexity.            |
| Migration tests               | Representative old saves with active quests, NPCs, machines, damage, mods, missing content, and realms.                                |
| UI/accessibility tests        | Screenshots, focus navigation, text scaling, localisation expansion, narration metadata, colour modes, device changes.                 |
| Soak simulations              | Accelerated days/years checking population, resource conservation, projects, events, routes, save growth, and state transitions.       |

## 22.2 Continuous Integration

15. Compile required targets and modules.

16. Run schema, asset, localisation, dependency, and forbidden-reference validation.

17. Run fast unit and subsystem tests on every merge request.

18. Create a development packaged smoke build on the integration cadence.

19. Run selected worldgen seeds and end-to-end POC flow tests.

20. Archive reports, binaries, content hashes, performance summaries, and test fixtures.

## 22.3 Release-Blocking Defects

| **Severity** | **Examples**                                                                                                                               | **Gate**                                               |
|--------------|--------------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------|
| Blocker      | Save corruption/data loss, resource duplication/deletion, authority exploit, crash in core POC loop, invalid migration, world cannot load. | No release or milestone sign-off.                      |
| Critical     | Persistent quest/project break, NPC identity loss, major chunk desync, inaccessible controller flow, severe performance regression.        | Must be fixed or feature disabled with safe migration. |
| Major        | Wrong feedback, recoverable AI stall, visual desync, non-critical mod conflict, accessibility regression.                                  | Milestone owner approves documented exception only.    |
| Minor        | Cosmetic, low-impact wording, rare harmless presentation issue.                                                                            | Tracked with target milestone.                         |

# 23. Developer Tools, Debug Overlays, Logging, Analytics, and Crash Reporting

## 23.1 Required Developer Tools

| **Tool**                      | **Purpose**                                                                                                                        |
|-------------------------------|------------------------------------------------------------------------------------------------------------------------------------|
| Registry Inspector            | Search definitions, resolved parents, references, tags, localisation, aliases, pack owner, and validation issues.                  |
| Worldgen Seed Inspector       | View generation stages, sub-seeds, biome fields, guaranteed anchors, fallback placements, roads, resources, and failures.          |
| Voxel/Chunk Debugger          | Show chunk lifecycle, palette, dirty regions, mesh sections, collision, light, nav, fluid, save delta, and task queues.            |
| Entity and Village Inspector  | Search NPCs, households, jobs, needs, memories, inventories, projects, permissions, simulation LOD, and region state.              |
| Network/Transaction Inspector | Display topology, ports, resource flow, reservations, owner, power, mana, faults, cross-chunk connectors, and transaction history. |
| Quest/Event Inspector         | View graph nodes, bindings, scope, conditions, contributions, event schedule, fallbacks, and world evidence.                       |
| Authority/Replication Panel   | Show owner, server/client state, sequence IDs, relevance, pending commands, denials, resync, and connection quality.               |
| Save Inspector                | View manifest, schemas, dirty records, journal, backups, integrity, migration plan, file sizes, and recovery options.              |
| Performance Dashboard         | Subsystem timings, counts, memory, draw calls, active actors, path requests, update budgets, and hitch capture.                    |

## 23.2 Logging

Use structured log categories and stable context: world, realm, chunk, entity, transaction, quest, network, player, build, and correlation IDs. Rate-limit repeated messages. Development builds fail loudly on invariant violations; release builds recover safely and produce player-safe references rather than exposing internal data.

## 23.3 Analytics and Player Research

Analytics are optional and privacy-conscious. Prioritise crashes, performance, failed commands, abandoned onboarding flows, accessibility setting use, and POC comprehension. Development-only telemetry and moderated playtest observation remain valid alternatives. Do not collect complete conversations or unnecessary personal information.

## 23.4 Crash and Hang Reporting

Reports include symbols, build/content hashes, hardware, recent subsystem context, safe logs, save manifest version, and reproduction identifiers where consent and privacy permit. Hang detection is as important as crash detection for worldgen, save, navigation, and simulation deadlocks.

# 24. Project Workflow, Version Control, Coding Rules, and Decision Records

## 24.1 Repository Structure

| **Path/Area**              | **Contents**                                                                                 |
|----------------------------|----------------------------------------------------------------------------------------------|
| /Source or Runtime Plugins | C++ modules, interfaces, definitions, runtime systems, networking adapters.                  |
| /Content/Core              | Shared base assets, input, UI style tokens, materials, common audio/effects.                 |
| /Content/Packs/POC         | Forest Hamlet POC definitions, assets, structures, creatures, quests, valley rules.          |
| /DataSource                | Versioned registry schemas and editable source data.                                         |
| /Config                    | Engine/project defaults, feature flags, platform and world settings.                         |
| /Tests                     | Unit, subsystem, fixtures, seed suites, flow tests, screenshots, migration saves.            |
| /Tools                     | Importers, validators, exporters, documentation generators, build scripts.                   |
| /Docs/Architecture         | Module map, ADRs, save schemas, network authority, performance budgets, dependency register. |

## 24.2 Coding Rules

- Follow Unreal conventions plus project rules for ownership, nullability, stable IDs, result codes, logging, serialization, threading, and Blueprint complexity.

- Avoid deep inheritance and giant base classes. Prefer shallow inheritance, composition, interfaces, and resolved data definitions.

- No raw cross-domain actor references in persistent records. Use stable IDs and owner-system queries.

- No per-frame tick by default. A tick requires a documented frame-dependent need and profiling category.

- No unversioned persistent payload. Every saveable record declares a schema version and migration path.

- No player-facing failure without a reason code; no successful resource movement without a transaction record.

- Blueprint graphs that become core, duplicated, performance-critical, or difficult to test are moved behind C++ interfaces.

## 24.3 Branching and Review

Use protected main and short-lived feature branches. Binary assets use LFS and locking where practical. Each merge includes tests and a scope-appropriate review. Long-lived integration branches are reserved for genuinely disruptive engine upgrades or architecture migrations.

## 24.4 Architecture Decision Records

Record decisions that affect save compatibility, stable IDs, module boundaries, voxel representation, networking, modding, engine upgrades, third-party dependencies, worldgen reproducibility, or simulation ownership. Every ADR documents alternatives, reason, consequences, owner, date, and reconsideration trigger.

## 24.5 Technical Debt

Debt records include consequence, owner, trigger, and repayment milestone. Local visual placeholders are acceptable. Debt that threatens saves, authority, resource conservation, stable identity, security, or module boundaries is not deferred as ordinary cleanup.

# 25. Proof-of-Concept Technical Scope and Explicit Deferrals

## 25.1 POC Must Prove

| **System**          | **POC Technical Proof**                                                                                                                       |
|---------------------|-----------------------------------------------------------------------------------------------------------------------------------------------|
| Voxel world         | Editable generated terrain, chunk streaming, mining, placement, meshing, collision, lighting, batched edits, save/load.                       |
| Worldgen            | Controlled seed-generated valley with guaranteed village, river, cave, resources, mana site, ruin, camp, roads, and raid approach.            |
| Registries          | Stable IDs and validated definitions for POC blocks, items, recipes, NPCs, machines, magic, creatures, structures, quests, UI.                |
| Player loop         | Movement, first/third person foundation, tools, inventory, crafting, building, interaction, controller input.                                 |
| Village             | Persistent named NPCs, jobs/schedules, warehouse, request board, reputation, needs-lite, project state, save-safe identity.                   |
| Automation          | Miner, power/fuel, chute, furnace, storage, machine faults, warehouse input, exact transactions, distance summary.                            |
| Magic               | Mana resource chain, rune table, mana furnace/upgrade, conduit, utility spell, combat spell, ward support.                                    |
| Quest/event         | Watchtower arc from need discovery to delivery, construction, raid warning, raid, aftermath, recovery/failure.                                |
| Combat/raid         | Basic combat, guard AI, goblin roles, raid captain, watchtower/ward contribution, damage, injury, repair, persistent result.                  |
| UI/accessibility    | HUD, inventory, crafting, dialogue, warehouse, project, machine, mana, raid, aftermath, settings, controller, scalable text, non-colour cues. |
| Persistence/quality | Atomic saves, backups, migration fixture, integrity checks, packaged build, performance profile, automated core flow.                         |

## 25.2 Explicitly Deferred

- Full online co-op gameplay, matchmaking, platform services, dedicated deployment, host migration, and PvP.

- Functional dimension travel; include only a dormant portal/ruin with correct definitions and persistent anchors.

- Full player-founded settlement control; use shared ownership, project, storage, job, and permission foundations only.

- Complete magic schools, advanced rituals, golems, leylines, portal freight, and corruption simulation.

- Full oceans, continents, seasons, economy, faction wars, politics, families/generations, and all race cultures.

- Public script mods, Steam Workshop pipeline, and final mod user experience.

- Console certification, final cross-platform optimisation, and complete four-player split-screen.

## 25.3 POC Representative Content Target

Content volume remains limited to what is required to test the architecture and experience: approximately the locked POC block/item/recipe sets, one forest hamlet, one cave biome, two surface biomes, one ruin, one goblin camp, a small named NPC roster, seven or eight creature types, one project arc, one raid, basic automation, and basic rune/mana infrastructure. Additional content is accepted only when it tests a missing technical risk or improves player comprehension.

# 26. Proof-of-Concept Staged Implementation Plan

| **Stage**                                     | **Primary Deliverables**                                                                                                                                                                                 | **Exit Gate**                                                                                                      |
|-----------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------|
| Stage 0 - Engineering Foundation              | Repository, engine lock, modules, build targets, stable IDs, base schemas, import validation, logging, tests, CI, feature flags, world/save manifest, dependency register, ADR process.                  | Project compiles and packages; invalid sample content fails validation; a versioned empty world saves and reloads. |
| Stage 1 - Voxel Editing Core                  | Player movement/camera, voxel coordinate queries, chunk storage, generation stub, mesh/collision, mining/placement, inventory transaction, edit journal, save/load.                                      | A packaged test world supports repeated edits, reloads exactly, and meets initial chunk performance targets.       |
| Stage 2 - Controlled POC Valley               | Deterministic staged worldgen, biome layers, river/lake, cave, resources, structure anchors, roads/trails, camp/village relation graph, fallback validation, streaming.                                  | Multiple seeds produce playable valleys with every required relation and no invalid critical placement.            |
| Stage 3 - Core Content and Crafting           | POC registries, item instances, tools, harvesting, crafting, furnace, recipes, progression hooks, block shapes, 32x32 material variation.                                                                | Player can gather starter resources, craft tools/stations, refine iron, and preserve inventory/recipe state.       |
| Stage 4 - Persistent Forest Hamlet            | NPC records/actors, jobs, schedules, needs-lite, navigation, warehouse, request board, dialogue, reputation, permissions, village/project save state.                                                    | NPC identity and village state survive streaming/save; request and warehouse use authoritative data.               |
| Stage 5 - Resource-Conserving Automation      | Miner, power/fuel, chutes, furnace, storage, ports, graph topology, item batches, machine faults, cross-chunk connectors, warehouse transactions, project reservations, near/far simulation.             | Long-running tests show no duplication/loss across blockage, unload, save/load, and permission changes.            |
| Stage 6 - Mana, Runes, and Wards              | Mana resource chain, rune table, mana furnace/upgrade, conduits, storage, one utility spell, one combat spell, ward coverage, magical feedback, ruin/portal teaser.                                      | Mana powers infrastructure, affects defence, survives save/LOD, and reports understandable faults.                 |
| Stage 7 - Combat and Goblin Raid              | Combat actions/damage, guard AI, goblin profiles, camp pressure, raid planner, watchtower and ward contributions, damage/repair, injuries/death settings, aftermath.                                     | At least three graded raid outcomes are reproducible from preparation and persist after save/load.                 |
| Stage 8 - End-to-End UI and Learning          | HUD, inventory, crafting, dialogue, request, warehouse, project, machine, mana, map, raid, combat, aftermath, settings, input rebinding, controller, accessibility basics.                               | First-time representative players complete the loop without debug instructions and can explain cause and effect.   |
| Stage 9 - Hardening and POC Release Candidate | Migration fixtures, backup/recovery, profiling, scalability, AI LOD soak, automation conservation, controller parity, accessibility/localisation tests, packaged builds, crash reporting, release gates. | POC Definition of Done and acceptance matrix pass on target hardware and representative saves.                     |

## 26.1 Stage Discipline

- Each stage begins only after its required lower-level data and authority contracts exist.

- A feature is not complete because it appears visually; it must save, reload, validate, expose debug state, and pass the relevant tests.

- New content may not bypass registries or transaction systems merely to accelerate a demonstration.

- Performance, accessibility, controller, and packaged-build checks begin before the final hardening stage; Stage 9 confirms rather than invents them.

# 27. Technical Spikes, Risk Register, and Redesign Triggers

## 27.1 Priority Technical Spikes

| **Priority** | **Spike**                                                                                                            | **Success Evidence**                                                                                                                                |
|--------------|----------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------|
| 1            | Editable voxel chunks with merged meshing, collision, lighting, save deltas, streaming, and navigation invalidation. | Sustained traversal/edit benchmark with no visible corruption, acceptable commit cost, deterministic reload, and clean cancellation of stale tasks. |
| 2            | Resource-conserving automation and warehouse transactions across chunk LOD and save/load.                            | Audit totals remain exact through blockage, transfer, reservation, network split/merge, unload, catch-up, retry, and recovery.                      |
| 3            | Persistent NPC actor/record promotion and demotion with schedules, projects, navigation, and raids.                  | Identity, inventory, position, task phase, memory, project contribution, and death state remain coherent across distance and save.                  |
| 4            | Controlled procedural valley relation generation.                                                                    | Seed suite guarantees every POC anchor and route within bounds without excessive retries or identical-looking worlds.                               |
| 5            | Split-screen local-player architecture and authoritative command model.                                              | Two local players have independent input/UI and can interact safely with shared inventory/world systems.                                            |

## 27.2 Risk Register

| **Risk**                | **Failure Mode**                                                                 | **Mitigation / Trigger**                                                                                                         |
|-------------------------|----------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------|
| Voxel performance       | Chunk meshing, collision, lighting, or edits consume frame budget.               | Benchmark early; reduce section size, batch commits, simplify light/collision, or redesign representation before content growth. |
| Save growth/corruption  | Large edited worlds or partial writes become slow or unsafe.                     | Seed-plus-delta, journals, partitioning, compaction, integrity fixtures, migration backups, recovery tooling.                    |
| AI path cost            | Dynamic voxel edits cause excessive navigation rebuild and NPC stalls.           | Hierarchical nav, dirty cells, bounded path budget, route graphs, abstract travel, local recovery.                               |
| Automation duplication  | LOD, retries, or graph rebuilds create/delete resources.                         | Transactional integer quantities, reservations, idempotency, audit totals, deterministic tests.                                  |
| System coupling         | Blueprint/actor references create circular dependencies and impossible testing.  | Module dependency direction, stable contracts, event/command/query pattern, ownership review.                                    |
| Multiplayer rewrite     | Solo assumptions leak into inventories, quests, world edits, or UI.              | Authoritative local host model, local-player separation, stable IDs, sequence-based commands, targeted network tests.            |
| Content scale           | Registries become manual and inconsistent.                                       | Schemas, import validation, generated families, docs, diffs, search tools, pack manifests.                                       |
| High-fidelity rendering | Materials, lights, effects, and detailed assets erase voxel/simulation headroom. | Early asset budgets, shared materials, pooled lights/effects, LOD, representative worst-case captures.                           |
| Scope expansion         | POC accumulates final-game systems before the loop is proven.                    | Feature flags, explicit deferrals, stage exit gates, acceptance matrix, milestone scope review.                                  |

## 27.3 Redesign Triggers

A foundational redesign is justified when measured evidence shows that voxel editing/streaming, save integrity, NPC simulation, automation conservation, multiplayer authority, or performance cannot scale under representative POC conditions. A delayed cosmetic feature, missing final art, low content volume, or a difficult isolated bug does not justify restarting the architecture.

# 28. Proof-of-Concept Definition of Done and Acceptance Matrix

| **POC Definition of Done**                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| A packaged Windows build lets representative new players complete and understand the Forest Hamlet loop: gather and refine resources, create automation, deliver to a real warehouse, progress the watchtower, discover and use basic mana infrastructure, prepare for a goblin raid, experience an outcome changed by preparation, and return to a persistent aftermath. Resources remain conserved; world, NPC, project, quest, machine, damage, and history state survive save/load; controller and accessibility basics work; and performance remains within the agreed target budget. |

| **Area**             | **Acceptance Requirement**                                                                                                                                                  | **Evidence**                                             |
|----------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------|
| World                | At least the approved seed suite generates valid POC valleys; mining, placement, chunk streaming, lighting, collision, roads, cave, structures, and saves behave correctly. | Automated seed tests plus packaged traversal/edit test.  |
| Data                 | All POC content uses stable IDs and validated registries; no critical missing references or duplicate IDs.                                                                  | CI registry validation and content hash report.          |
| Resources            | No unexplained resource creation/deletion through crafting, machines, warehouses, projects, unload, retries, save/load, or raid damage.                                     | Transaction audit and long-run conservation test.        |
| Village              | Named NPCs retain identity, jobs, needs-lite, inventories, memories, home, injuries/death, and project contribution.                                                        | Promotion/demotion/save soak test and player inspection. |
| Automation           | Machine chain handles power, blockage, output full, permissions, network split, cross-chunk flow, distance summary, and recovery.                                           | Scenario matrix with exact expected totals.              |
| Magic                | Mana chain, conduit, furnace/upgrade, spells, and ward have readable sources, costs, faults, and defence effect.                                                            | State inspection, save/LOD test, raid comparison.        |
| Quest/raid           | Watchtower arc supports progress, warning, preparation, raid, failure/success grades, damage, repairs, reputation, and history.                                             | Automated graph test and guided playthrough.             |
| UI/input             | Keyboard/mouse and controller complete the loop; focus/back, localised text keys, scalable text, non-colour cues, reduced motion/flash basics work.                         | Input and accessibility checklist plus usability test.   |
| Persistence          | Atomic autosave, backup, load, migration fixture, recovery, and integrity report pass.                                                                                      | Forced-interruption and damaged-copy recovery tests.     |
| Performance          | Target profile sustains agreed frame and memory budgets during traversal, village activity, factory operation, and raid.                                                    | Packaged performance captures on reference hardware.     |
| Player comprehension | Players can explain how resources, village storage, watchtower, ward, and raid outcome connected.                                                                           | Moderated first-time-player acceptance session.          |

# 29. Post-POC Architecture Roadmap

| **Milestone**                     | **Architecture Expansion**                                                                                                                                                  | **Do Not Assume**                                                                              |
|-----------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------|
| Vertical Slice / Alpha Foundation | Broader worldgen, more villages/cultures, player settlement foundation, steel tier, deeper AI, more structures/quests, initial online co-op validation.                     | Do not add content until registry, save, transaction, and simulation tools support it.         |
| Alpha Systems                     | Dedicated-server evaluation, four-player online target, economy/trade routes, families/migration, faction territories, advanced automation, magic schools, larger raids.    | Do not promise host migration or public mod scripting without measured feasibility.            |
| Realm Prototype                   | First functional major dimension, portal travel, separate realm streaming/save, route simulation, realm resources/culture, return consequences.                             | Do not copy Overworld systems blindly; validate realm-specific rules and inactive simulation.  |
| Beta Content Scale                | Content packs, localisation expansion, mod data pipeline, performance hardening, save migration from Alpha, broader accessibility, controller/split-screen polish.          | Do not accept unbounded registry or asset growth without budgets and automated validation.     |
| Release Preparation               | Platform integration, crash/privacy processes, security review, dedicated hosting decision, final performance profiles, long-term save compatibility, community mod policy. | Do not postpone data-loss, authority, accessibility, or privacy issues to post-launch patches. |

## 29.1 Architecture Reassessment Points

- After Stage 1 voxel benchmark.

- After Stage 5 automation conservation and cross-chunk simulation.

- After Stage 7 raid with simultaneous voxel, AI, automation, magic, combat, and UI load.

- Before first online co-op implementation.

- Before first functional dimension.

- Before public mod scripting or console certification.

# 30. Open Questions for Production Planning

These questions are deliberately deferred because they require measured POC evidence, platform research, team size, funding, or later system documents. They do not block the current technical direction.

| **Area**              | **Deferred Question**                                                                                                                       |
|-----------------------|---------------------------------------------------------------------------------------------------------------------------------------------|
| Engine baseline       | Which exact stable Unreal Engine release becomes Stage 0 baseline, and what is the documented upgrade policy for the first year?            |
| Reference hardware    | Which CPU, GPU, RAM, storage, controller, and display profiles define minimum, target, and high settings?                                   |
| Voxel dimensions      | Does benchmarking confirm 32-cubed logical chunks and smaller render sections, or should vertical sectioning change?                        |
| Lighting              | Which voxel light representation best balances gameplay rules, dynamic edits, caves, coloured mana, and Unreal presentation?                |
| Navigation            | Does a custom hierarchical voxel navigation system outperform adapted engine navigation for villages and raids?                             |
| Mass framework        | Which agent groups benefit from Mass after the persistent-record architecture is functional?                                                |
| World scale           | What default active radius, world preset, vertical range, and region size meet performance and exploration goals?                           |
| Online services       | Which platform/network stack supports invites, NAT traversal, dedicated servers, cross-play, and mod compatibility when online work begins? |
| Split-screen          | Can four-player split-screen meet readability and performance targets on intended hardware, or should final support remain two players?     |
| Mod scripting         | Is a constrained scripting runtime required, and what security/compatibility cost is acceptable?                                            |
| Save format           | Which binary container/compression approach provides the best inspection, migration, speed, and corruption recovery?                        |
| Procedural structures | Which parts use project custom generation versus engine PCG or authored tools?                                                              |
| Console/Linux         | What platform targets are commercially justified after PC profiling and controller validation?                                              |
| Team workflow         | At what team size or binary-asset contention point should Git LFS be reconsidered in favour of Perforce?                                    |
| Cloud saves           | How will large partitioned worlds interact with platform cloud limits and conflict resolution?                                              |

# Appendix A. Recommended Unreal Module and Plugin Map

| **Module**      | **Type**         | **Responsibility**                                                                             | **Dependency Rule**                        |
|-----------------|------------------|------------------------------------------------------------------------------------------------|--------------------------------------------|
| FVCFoundation   | Runtime module   | IDs, tags, results, time, feature flags, logging contracts, serialization helpers.             | No gameplay domain dependencies.           |
| FVCDefinitions  | Runtime/editor   | Definition structs, registry lookup, schema metadata, aliases, localisation references.        | Foundation.                                |
| FVCContentTools | Editor/tool      | Import, validation, export, generated families, registry docs, diffs.                          | Foundation, Definitions.                   |
| FVCVoxel        | Runtime          | Chunk data, block queries/edits, meshing, collision, light, fluids, block entities, streaming. | Foundation, Definitions.                   |
| FVCWorldGen     | Runtime/editor   | Seeds, regions, terrain, biomes, caves, resources, structures, roads, validation.              | Foundation, Definitions, Voxel.            |
| FVCPersistence  | Runtime/tool     | Manifest, journals, snapshots, migrations, integrity, recovery, save scheduler.                | Foundation; domain persistence interfaces. |
| FVCSimulation   | Runtime          | World clock, scheduler, simulation LOD, region summaries, promotion/demotion contracts.        | Foundation, Persistence interfaces.        |
| FVCInventory    | Runtime          | Items, stacks, containers, transactions, reservations, ownership.                              | Foundation, Definitions, Persistence.      |
| FVCAutomation   | Runtime          | Machines, item logistics, power, ports, topology, near/far flow.                               | Inventory, Voxel, Simulation.              |
| FVCMagic        | Runtime          | Mana, spells, runes, wards, corruption, magical networks.                                      | Inventory, Voxel, Simulation.              |
| FVCAI           | Runtime          | NPC/creature records, tasks, schedules, navigation, perception, construction, groups.          | Simulation, Voxel, Inventory.              |
| FVCVillage      | Runtime          | Settlements, warehouses, projects, jobs, needs, reputation integration, raids.                 | AI, Inventory, Simulation, Voxel.          |
| FVCQuest        | Runtime          | Quest graphs, objectives, events, contribution, bindings, fallbacks.                           | Foundation and domain event contracts.     |
| FVCCombat       | Runtime          | Actions, damage, status, gear integration, defence, aftermath.                                 | Inventory, AI, Voxel, Magic.               |
| FVCSocial       | Runtime          | Reputation, fear, trust, factions, cultures, laws, ownership resolution.                       | Foundation, Definitions, Persistence.      |
| FVCNetworking   | Runtime          | Authority adapters, replication, relevance, command sequencing, reconnect.                     | Foundation and public domain interfaces.   |
| FVCUI           | Runtime          | View models, screens, input, accessibility, localisation, local-player roots.                  | Public query/command interfaces only.      |
| FVCDeveloper    | Developer/editor | Inspectors, overlays, cheats, trace panels, scenario tools.                                    | All modules in non-shipping builds.        |
| FVCTests        | Test target      | Fixtures, seed suites, automation, migrations, network, performance, screenshots.              | All testable public interfaces.            |

Module names use FVC as a working prefix only and can be replaced by the final project codename. The important lock is dependency direction and ownership, not the prefix.

# Appendix B. Stable ID, Tag, Command, Event, and Record Naming Conventions

| **Type**             | **Convention**                                           | **Examples**                                                                  |
|----------------------|----------------------------------------------------------|-------------------------------------------------------------------------------|
| Definition IDs       | lowercase namespace.category.name, stable after release. | block.terrain.stone; item.material.iron_ingot; recipe.smelting.iron_ingot.    |
| Gameplay tags        | Hierarchical and semantic; not display text.             | Resource.Metal.Iron; Permission.Village.Warehouse.Import; Magic.Rune.Control. |
| Runtime record types | F + domain + Record/State/Snapshot.                      | FNPCRecord; FMachineState; FRegionSummary.                                    |
| Commands             | Verb + object + Command; include request context.        | FPlaceBlockCommand; FStartProjectCommand; FTransferResourceCommand.           |
| Results              | OperationResult plus stable reason enum/tag.             | FInventoryTransactionResult / Denied_NoCapacity.                              |
| Events               | Past tense factual name.                                 | BlockPlaced; ResourceTransferred; RaidResolved; NPCDied.                      |
| Queries              | Get/Find/Build + read model.                             | GetVillageSummary; FindRoute; BuildMachineViewModel.                          |
| Save schemas         | Domain record plus integer schema version.               | NPCRecord v3; ChunkDelta v2; QuestRuntime v4.                                 |
| Assets               | Prefix by presentation type, not gameplay identity.      | M\_, MI\_, T\_, SK\_, SM\_, WBP\_, DA\_, SFX\_, VFX\_.                        |

# Appendix C. Core Runtime and Save Record Templates

| **Record**       | **Minimum Fields**                                                                                                                                                                        |
|------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| World Manifest   | World ID, name, seed, worldgen version, game build, schema map, content/mod hashes, world settings, realms, last clean commit, integrity.                                                 |
| Chunk Delta      | Realm ID, chunk coordinate, generation version, palette aliases, edited cells, state overrides, block entities, dynamic layers, journal sequence, hash.                                   |
| NPC Record       | Entity ID, definition IDs, generated identity, culture/faction, household, home/work anchors, job, skills, needs, inventory, health, memories, relationships, commitments, location, LOD. |
| Village Record   | Village ID, culture/faction, region, stage, population links, structures, storage categories, reservations, projects, jobs, defences, threats, laws, permissions, reputation, history.    |
| Machine Record   | Entity/block address, definition ID, owner, inventories, recipe, progress, power/mana, ports, network IDs, filters, damage, maintenance, fault, last simulation time.                     |
| Quest Runtime    | Quest ID, definition ID, scope/owner, active/completed nodes, bound entities/locations, counters, deadlines, contributions, choices, fallback state, history.                             |
| Region Summary   | Region ID, realm, settlements, faction control, routes, resources, threats, ecology, events, projects, automation totals, magic/corruption, last simulated time.                          |
| Historical Event | Event ID, type, world time, location, actors, owner, facts, consequences, visibility/knowledge, related quest/faction/structure IDs.                                                      |

# Appendix D. First-Pass Performance and Simulation Budgets

These are engineering draft budgets for instrumentation and comparison, not final promises. Stage 1 and Stage 7 profiling may revise them through an ADR.

| **Area**            | **Draft Target / Guardrail**                                                                                                   |
|---------------------|--------------------------------------------------------------------------------------------------------------------------------|
| Display target      | 1080p, 60 FPS normal profile on selected mid-range reference PC; 30 FPS fallback and split-screen scalability profile.         |
| Frame pacing        | 16.67 ms target; p95 normal play near target; avoid repeated \>33 ms hitches during ordinary streaming.                        |
| Game thread         | Approximately \<= 8 ms typical target with explicit per-system trace categories.                                               |
| GPU                 | Approximately \<= 14 ms typical at target profile, leaving practical variance for CPU/GPU overlap.                             |
| Chunk commit        | No unbounded commit; cap mesh/collision/nav/light application per frame and queue excess work.                                 |
| Autosave            | No sustained gameplay freeze; main-thread snapshot/commit work stays within a small frame budget where possible.               |
| AI POC              | Full detail for POC village and active raid; all additional agents must demonstrate LOD/update budgeting.                      |
| Automation visuals  | Visible items are pooled/capped independently from authoritative throughput.                                                   |
| Simulation catch-up | Bound by configurable maximum intervals/events per load; no per-second replay of long absences.                                |
| Memory              | Subsystem budgets measured separately for voxel data, meshes, collision, nav, actors, assets, UI, save buffers, and caches.    |
| Save growth         | Track bytes per edited chunk, NPC, machine, quest, region, and hour of play; compact journals and archive histories by policy. |
| Network             | Batch block edits and inventory deltas; no continuous replication of full chunks or visual belt items.                         |

# Appendix E. POC Engineering Checklist

- \[ \] Engine version and dependency register locked for milestone.

- \[ \] Protected repository, Git LFS, CI, package smoke build, build metadata, feature flags, and ADR process operational.

- \[ \] Stable ID parser, registry lookup, schema versions, aliases, localisation keys, validation, and content hashes operational.

- \[ \] Voxel chunks generate, mesh, collide, light, edit, stream, save, reload, and cancel stale tasks correctly.

- \[ \] POC seed suite guarantees village, river, cave, resources, mana clue, ruin, camp, roads, and raid approach.

- \[ \] Item and inventory transactions are authoritative, idempotent, audited, and save-safe.

- \[ \] Named NPC records survive actor promotion/demotion, save/load, project work, injury, and death.

- \[ \] Voxel navigation updates after block edits and supports village/raid routes.

- \[ \] Warehouse permissions, contribution, delivery modes, reservations, and project stages work with exact quantities.

- \[ \] Automation handles power, ports, filters, blockage, split/merge, cross-chunk flow, unloaded summary, and no resource loss.

- \[ \] Mana resource chain, conduit, furnace/upgrade, spells, ward, faults, and save/LOD behaviour work.

- \[ \] Quest/event graph binds stable world entities and supports fallback, scope, contribution, raid, and aftermath.

- \[ \] Combat actions, damage packets, guard/goblin AI, structure damage, repair, and world history integrate.

- \[ \] UI uses view models and commands; keyboard/mouse, controller, focus/back, scalable text, non-colour cues, and settings work.

- \[ \] Atomic save, rotating backups, migration fixture, integrity validation, recovery, and save inspector pass.

- \[ \] Packaged performance captures meet agreed targets during traversal, village/factory operation, and raid.

- \[ \] Automated end-to-end POC flow and representative first-time-player comprehension test pass.

# Appendix F. Player Answer Lock 1-240

| **Question Range** | **Answer** | **Lock**                                               |
|--------------------|------------|--------------------------------------------------------|
| Questions 1-20     | E          | Recommended hybrid technical direction locked in full. |
| Questions 21-40    | E          | Recommended hybrid technical direction locked in full. |
| Questions 41-60    | E          | Recommended hybrid technical direction locked in full. |
| Questions 61-80    | E          | Recommended hybrid technical direction locked in full. |
| Questions 81-100   | E          | Recommended hybrid technical direction locked in full. |
| Questions 101-120  | E          | Recommended hybrid technical direction locked in full. |
| Questions 121-140  | E          | Recommended hybrid technical direction locked in full. |
| Questions 141-160  | E          | Recommended hybrid technical direction locked in full. |
| Questions 161-180  | E          | Recommended hybrid technical direction locked in full. |
| Questions 181-200  | E          | Recommended hybrid technical direction locked in full. |
| Questions 201-220  | E          | Recommended hybrid technical direction locked in full. |
| Questions 221-240  | E          | Recommended hybrid technical direction locked in full. |

All detailed answers are represented in Section 2 and throughout the architecture. Any later departure from an E decision should be recorded through an Architecture Decision Record, include evidence, and identify save/data/network consequences.

# Appendix G. Cross-System Technical Requirement Matrix

| **System**        | **Technical Requirements**                                                                                                            | **Primary Owners**                                |
|-------------------|---------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------|
| Blocks            | Compact chunk cells; shapes; states; block entities; edit transactions; mesh/collision/light/nav invalidation; seed-plus-delta saves. | Voxel, Definitions, Inventory, Persistence.       |
| Items             | Immutable definitions; compact instances; quantity, durability, quality, charge, spoilage, ownership, enchantment; transactions.      | Definitions, Inventory, UI, Persistence.          |
| Recipes           | Unified timed processes; inputs/outputs/by-products; substitutions; power/mana; unlocks; NPC/project/machine use.                     | Definitions, Inventory, Automation, Magic, Quest. |
| Resources         | Exact quantities; ore/deposit grades; purity; by-products; old-material use; village/magic/automation tags.                           | Worldgen, Inventory, Automation, Village.         |
| NPC villages      | Persistent identity; schedules/tasks; inventories; jobs; needs; warehouse; projects; reputation; raids; LOD.                          | AI, Village, Simulation, Persistence.             |
| Automation        | Typed graphs; ports; power; visible local flow; distant summaries; permissions; reservations; resource conservation.                  | Automation, Inventory, Simulation, Networking.    |
| Magic             | Mana network; spells; runes; wards; corruption; infrastructure; purity/risk; village/automation links.                                | Magic, Automation, Voxel, Combat.                 |
| Creatures         | Reusable AI profiles; spawn/territory; group/raid plans; combat; drops; village/machine targets; LOD.                                 | AI, Combat, Worldgen, Village.                    |
| Biomes/worldgen   | Derived seeds; layered fields; guaranteed anchors; dynamic layers; async streaming; regional summaries.                               | Worldgen, Voxel, Simulation.                      |
| Structures        | Modular blueprints; terrain adaptation; markers; states; ownership; damage/restoration; NPC/magic/automation hooks.                   | Worldgen, Voxel, Village, Quest.                  |
| Cultures/factions | Layered identity; membership; territory; law; relationship; history; migration; ownership.                                            | Social, Village, Quest, Simulation.               |
| Dimensions        | Persistent realm IDs; derived seeds; chunks; anchors; routes; regional summaries; portals; inactive simulation.                       | Worldgen, Persistence, Simulation, Networking.    |
| Quests/events     | Graphs; stable bindings; scope; contribution; fallbacks; schedules; persistent evidence; world-state events.                          | Quest, Social, all domain event contracts.        |
| Combat/defence    | Action definitions; damage packets; server authority; guards; structures; wards; raids; repairs; aftermath.                           | Combat, AI, Voxel, Magic, Village.                |
| UI/UX             | View models; commands; reason codes; local-player roots; responsive/controller/accessibility/localisation; knowledge state.           | UI plus public interfaces of every domain.        |

# Appendix H. Architecture Decision Record Template

| **Field**               | **Required Content**                                                                     |
|-------------------------|------------------------------------------------------------------------------------------|
| ADR ID and Title        | Sequential ID and concise decision name.                                                 |
| Status                  | Proposed, Accepted, Superseded, Rejected, Experimental.                                  |
| Date and Owner          | Decision date, responsible technical owner, reviewers.                                   |
| Context                 | Problem, constraints, affected systems, evidence, and urgency.                           |
| Decision                | Exact selected direction and boundaries.                                                 |
| Alternatives            | Options considered and why they were not selected.                                       |
| Consequences            | Benefits, costs, risks, save compatibility, network impact, tooling, testing, migration. |
| Implementation          | Affected modules, stages, feature flags, migration steps, test evidence.                 |
| Reconsideration Trigger | Measured condition that should reopen the decision.                                      |
| References              | Source documents, benchmarks, issues, prototypes, engine notes, and dependency records.  |

# Appendix I. Source Document and Dependency Register

| **No.** | **Document**                          | **Version** | **Dependency Status**                            |
|---------|---------------------------------------|-------------|--------------------------------------------------|
| 00      | Master Game Design Bible              | Version 0.1 | Referenced by this Technical Implementation Plan |
| 01      | Core Gameplay Loop                    | Version 0.1 | Referenced by this Technical Implementation Plan |
| 02      | Player Progression System             | Version 0.1 | Referenced by this Technical Implementation Plan |
| 03      | Blocks Registry                       | Version 0.1 | Referenced by this Technical Implementation Plan |
| 04      | Items Registry                        | Version 0.1 | Referenced by this Technical Implementation Plan |
| 05      | Crafting and Recipe Registry          | Version 0.1 | Referenced by this Technical Implementation Plan |
| 06      | Resource Progression                  | Version 0.1 | Referenced by this Technical Implementation Plan |
| 07      | NPC Village System                    | Version 0.1 | Referenced by this Technical Implementation Plan |
| 08      | Automation System                     | Version 0.1 | Referenced by this Technical Implementation Plan |
| 09      | Magic System                          | Version 0.1 | Referenced by this Technical Implementation Plan |
| 10      | Creatures and Monsters                | Version 0.1 | Referenced by this Technical Implementation Plan |
| 11      | Biomes and World Generation           | Version 0.1 | Referenced by this Technical Implementation Plan |
| 12      | Structures                            | Version 0.1 | Referenced by this Technical Implementation Plan |
| 13      | Races, Peoples, Cultures and Factions | Version 0.1 | Referenced by this Technical Implementation Plan |
| 14      | Dimensions                            | Version 0.1 | Referenced by this Technical Implementation Plan |
| 15      | Quest and Event System                | Version 0.1 | Referenced by this Technical Implementation Plan |
| 16      | Combat, Gear and Defence System       | Version 0.1 | Referenced by this Technical Implementation Plan |
| 17      | UI/UX System                          | Version 0.1 | Referenced by this Technical Implementation Plan |

This document becomes the technical source of truth for implementation boundaries. Gameplay meaning remains owned by Documents 00 through 17. When implementation constraints require changing a gameplay lock, the affected design document and this technical plan must both be updated through a recorded decision.
