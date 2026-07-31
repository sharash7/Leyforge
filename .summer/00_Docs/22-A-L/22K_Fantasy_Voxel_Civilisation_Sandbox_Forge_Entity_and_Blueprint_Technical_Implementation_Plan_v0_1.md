# Fantasy Voxel Civilisation Sandbox
## 22K - Forge Entity and Blueprint Technical Implementation Plan
**Version 0.1 - Detailed Design Bible and Engineering Foundation Draft**

A staged Godot-native engineering plan for extending the Leyforge Forge into a unified voxel-only Entity Forge and Blueprint Forge, covering humanoid and creature authoring, body-plan graphs, rigs, animation, procedural locomotion, equipment, gameplay markers, entity runtime assembly, structure blueprints, construction states, world-generation placement, icon capture, validation, persistence, performance, multiplayer compatibility and Summer Engine-assisted development controls.

## Forge Entity and Blueprint Technical Implementation Plan Statement

| Field | Locked Direction |
| --- | --- |
| Document Scope | Defines the technical architecture, data contracts, Godot services, source formats, runtime products, bake jobs, validation, testing, migrations and staged implementation required to build Documents 22A through 22J on top of the Voxel Asset Forge foundation established by Document Set 21. |
| Engine Direction | Implement as a normal Godot 4.x project on a milestone-locked stable release. Use GDScript by default. Introduce C++ through GDExtension only after profiling identifies a bounded bottleneck that cannot be solved acceptably through GDScript, shaders, data layout or job partitioning. |
| Summer Engine Direction | Summer Engine is the AI-native development and orchestration environment, not a required shipped runtime. Generated code, Resources, scenes, tests, manifests and migrations must remain reviewable and buildable as an ordinary Godot project. |
| Forge Relationship | Extend the shared services from 21F rather than creating a second asset system. Entity and Blueprint content use the same stable IDs, manifests, dependency graph, override resolver, lifecycle states, atomic persistence, icon capture, validation, packaging and deterministic bake infrastructure. |
| Voxel Direction | All visible authored geometry originates from editable voxel source, voxel-generating operations or other Forge voxel assets. Runtime meshes, LODs, collisions and impostors are generated products and do not replace the voxel source of truth. |
| Entity Direction | Store entity presentation as layered Resources: body-plan graph, voxel body parts, rig, materials, animation sets, customisation, equipment compatibility, semantic markers, gameplay contracts and runtime assembly profile. |
| Blueprint Direction | Store structures as semantic voxel blueprints containing physical placements, nested modules, material roles, functional assets, markers, networks, construction stages, upgrades, world states and world-generation rules. |
| Runtime Direction | Runtime actors and structure instances resolve approved content by stable IDs. Forge presentation consumes authoritative gameplay state but does not own AI decisions, combat outcomes, inventories, recipes, village simulation, construction truth or world-generation authority. |
| Rig Direction | Use reusable skeleton families, named semantic roles and custom body graphs. Rigid voxel parts are the default binding model; bounded deformable voxel skinning is optional where it materially improves motion. |
| Animation Direction | Combine authored transform animation, reusable clips, retargeting, procedural gait/IK, voxel-frame changes, material tracks and named events. Audio and VFX production remain deferred; this set stores only future-proof event and socket contracts. |
| Blueprint Construction Direction | Construction, upgrades, damage, occupation, corruption, repair and restoration are represented as deterministic deltas or staged semantic states, not duplicated complete structures unless a deliberate authored exception is required. |
| Icon Direction | Items, blocks, entities, bosses and blueprints generate icons, portraits and thumbnails directly from controlled live Forge previews using deterministic capture profiles. |
| Performance Direction | Use source complexity warnings, asynchronous deterministic baking, reusable products, animation LOD, rig LOD, marker LOD, blueprint streaming and abstract simulation boundaries. Detailed authoring must never imply equally detailed runtime simulation at all distances. |
| Safety Direction | Use transactional editing, undo/redo, autosave snapshots, dependency-aware changes, atomic writes, reversible approval, schema migration, validation gates and safe fallbacks. Never make a generated product the only copy of source data. |
| Multiplayer Direction | Clients receive authoritative entity and structure state and resolve compatible approved presentation packages. Visual overrides cannot change movement collision, hit regions, reach, capacity, network ports, construction cost, world placement or simulation truth without an explicit gameplay migration. |
| POC Direction | Prove one standard humanoid, one pig, one spider, one segmented centipede, one bird, one dragon test rig, one equipment set and one staged watchtower blueprint inside the same Forge, with live icon capture, deterministic baking, validation, hot reload and runtime preview. |

## Document Purpose

This document converts the Entity Forge and Blueprint Forge design into an implementable engineering architecture. Documents 22A through 22J define what the expanded Forge must let a developer create and how that authoring experience should behave. Document 22K defines how those promises are represented, validated, baked, integrated and maintained in Godot.

The central challenge is not simply storing voxel models. The system must support radically different body plans, many limb counts, repeated segments, flying creatures, bosses, modular humanoids, equipment, reusable rigs, procedural locomotion, semantic hit regions and simulation LOD. At the same time, the Blueprint Forge must author structures containing blocks, unique Forge assets, NPC markers, pathing, automation, mana, construction stages, damage states and deterministic world-generation rules. Both workspaces must share one identity, one source-to-product pipeline and one dependency system.

The implementation therefore separates four layers:

1. **Canonical Forge source** - editable voxel volumes, body graphs, rig definitions, animations, customisation rules, blueprint layers and authored metadata.
2. **Approved presentation definitions** - resolved, validated records with stable IDs and explicit gameplay contracts.
3. **Generated runtime products** - meshes, materials, skeletons, animations, collision proxies, scenes, icons, thumbnails, LODs, navigation hints and compact manifests.
4. **Authoritative gameplay and world state** - entity records, AI state, combat state, inventories, construction progress, village ownership, damage, quests and simulation state owned by their proper gameplay systems.

The expanded Forge must allow the visuals of a humanoid, pig, dragon, machine or watchtower to be replaced without silently rewriting gameplay identity. It must also detect the exceptions where a visual change is actually spatial or semantic: moving a dragon's breath origin, changing the size of a player collision envelope, removing a warehouse access marker or changing a watchtower footprint. Those changes require explicit compatibility review rather than being treated as harmless art edits.

## Engine and Existing Forge Status Note

> **Current Project Direction**  
> Leyforge is being developed in Godot with Summer Engine. Document 21F defines the shared Voxel Asset Forge engineering foundation. Document 22K extends that foundation for entities and semantic structure blueprints. Older Unreal-specific technical material is historical and must not control implementation decisions.

## Design and Technical Sources

| Source | Relevant Direction | How 22K Uses It |
| --- | --- | --- |
| 00 - Master Game Design Bible | Stylised, readable, atmospheric fantasy voxel presentation with living NPC civilisations, creatures, machines and structures. | Establishes voxel identity, readable silhouettes and the requirement that created content supports the living world. |
| 03 - Blocks Registry | Stable block definitions, shapes, states, material families and gameplay links. | Supplies block placement contracts and material-role resolution for blueprints. |
| 04 - Items Registry | Items and block forms have distinct held, dropped, equipped and icon presentations. | Requires representation profiles, equipment links and Icon Capture products. |
| 07 - NPC Village System | Persistent named NPCs, jobs, homes, projects, warehouses and simulation LOD. | Requires persistent appearance seeds, semantic NPC markers and construction integration. |
| 08 - Automation System | Machines and networks have physical ports, readable states and near/far simulation. | Requires blueprint network layers and contract-safe functional asset placement. |
| 09 - Magic System | Mana infrastructure, wards, conduits and magical states are physical and readable. | Requires mana/ward blueprint layers, entity magic sockets and material-state bindings. |
| 10 - Creatures and Monsters | Creatures use distinct silhouettes, body plans, behaviours, drops, bosses and LOD. | Defines the variety and gameplay integration the Entity Forge must support. |
| 11 - Biomes and World Generation | Structures are placed through deterministic relational world generation and dynamic states. | Requires blueprint placement profiles, terrain adaptation and generated-state persistence. |
| 12 - Structures | Structures use blueprints, markers, ownership, stages, damage, repair and world-state variants. | Supplies the Blueprint Forge semantic contract. |
| 16 - Combat, Gear and Defence | Combat uses body regions, equipment, attacks, breakable parts and authoritative outcomes. | Requires hit regions, equipment sockets, animation events and gameplay-safe contracts. |
| 17 - UI/UX System | Developer tools must be inspectable, accessible, trustworthy and controller-aware where practical. | Guides diagnostics, workflow clarity, error recovery and viewport overlays. |
| 21A-21G - Voxel Asset Forge | Shared source Resources, modelling, animation, overrides, UI, technical pipeline and migration plan. | Provides the platform this expansion reuses rather than duplicates. |
| 22A - Forge Expansion Core | Locks voxel-only Entity Forge and Blueprint Forge scope. | Defines the high-level expansion contract. |
| 22B - Entity Taxonomy and Anatomy | Body families, body-plan graph, scale, density and anatomy roles. | Defines body graph and part source schemas. |
| 22C - Humanoid Creator | Modular bodies, faces, hair, player envelopes, NPC identity and equipment. | Defines humanoid assembly and customisation requirements. |
| 22D - Creature and Boss Creator | Quadrupeds, spiders, centipedes, birds, dragons, bosses and variants. | Defines template, repeated-segment and boss product requirements. |
| 22E - Rigging, IK and Attachments | Skeleton families, joints, IK, retargeting and attachment contracts. | Defines rig source and runtime solver architecture. |
| 22F - Animation and Visual States | Locomotion, combat, work, procedural gait, events, states and LOD. | Defines animation source, event and runtime graph requirements. |
| 22G - Customisation and Equipment | Visual inheritance, deterministic variation, equipment fit and persistent appearance. | Defines resolver, seed channels and compatibility requirements. |
| 22H - Gameplay Integration | Collision, hitboxes, AI markers, navigation profiles and simulation LOD. | Defines gameplay-facing entity contracts and loaded/unloaded boundaries. |
| 22I - Blueprint Forge | Semantic layers, nested modules, construction, upgrades, worldgen and validation. | Defines blueprint source and product architecture. |
| 22J - Unified Forge UI/UX | Unified library, workspaces, test laboratory, review, packaging and workflows. | Defines host applications and service-facing editor requirements. |

## Static Table of Contents

1. Locked Technical Implementation Identity
2. Locked Direction Summary
3. Technical Goals, Constraints and Non-Goals
4. Relationship to Document 21F and Shared Forge Services
5. Godot and Summer Engine Development Model
6. Project Modules, Ownership and Communication
7. Folder Structure, Add-ons and Generated Products
8. Stable IDs, Manifests, Lifecycle and Content Contracts
9. Canonical Source and Runtime Product Separation
10. Entity Definition and Resource Architecture
11. Body-Plan Graph and Anatomy Source Model
12. Voxel Body Parts, Density, Materials and Modifiers
13. Repeated Segments, Procedural Anatomy and Deterministic Generation
14. Rig, Skeleton, Joint and Attachment Source Model
15. Runtime Skeleton Assembly and Binding
16. Animation Source, Libraries, Retargeting and Events
17. Procedural Gait, IK, Terrain Contact and Flight Solvers
18. Humanoid Assembly, Customisation and Persistent NPC Appearance
19. Equipment, Fit Profiles, Coverage and Runtime Attachment
20. Entity Gameplay Contracts, Collision, Hit Regions and AI Markers
21. Entity Runtime Assembly, Actors and Presentation Controllers
22. Entity Rendering, Animation, Physics, AI and Simulation LOD
23. Blueprint Definition and Semantic Layer Architecture
24. Nested Modules, Material Roles and Dependency Resolution
25. Construction Stages, Upgrades, Damage and World-State Deltas
26. World-Generation Placement, Terrain Adaptation and Structure Instances
27. Shared Marker, Socket, Network and Role Registries
28. Icon Capture, Portraits, Codex Images and Blueprint Thumbnails
29. Unified Forge Hosts, UI Services and Workspace Integration
30. Forge Test Laboratory and Validation Scenarios
31. Entity and Blueprint Bake Pipeline
32. Cache, Dependency Graph, Invalidation and Hot Reload
33. Runtime Registry Integration and Content Resolution
34. Persistence, Migration, Backups and Save Compatibility
35. Multiplayer Authority and Content Compatibility
36. Performance Budgets, Scalability and Profiling
37. Validation, Diagnostics and Recovery
38. Testing, Golden Content and Continuous Integration
39. Summer Engine AI-Assisted Development Controls
40. Permissions, Security and Future Player-Creator Boundaries
41. Proof-of-Concept Scope and Explicit Deferrals
42. Staged Implementation Plan
43. Technical Spikes, Risk Register and Redesign Triggers
44. Definition of Done and Acceptance Matrix
45. Post-POC Roadmap and Open Decisions
Appendix A. Recommended Godot Class and Resource Map
Appendix B. Recommended Folder Structure
Appendix C. Core Entity Resource Schemas
Appendix D. Core Blueprint Resource Schemas
Appendix E. Shared Semantic Role and Marker Catalogue
Appendix F. Validation Code Catalogue
Appendix G. Golden Content and Scenario Matrix
Appendix H. Architecture Decision Record Template
Glossary

# 1. Locked Technical Implementation Identity

The Entity and Blueprint expansion is a specialised layer of the existing Leyforge Forge, not a separate application with incompatible storage or workflows. It expands what the Forge can author while preserving the same engineering promises: stable identity, editable voxel source, deterministic products, reversible overrides, dependency awareness, validation and runtime separation.

> **Locked Rule**  
> Every entity and blueprint must be reproducible from canonical Forge source, resolvable through stable IDs, validatable against explicit contracts and usable by runtime systems without giving presentation data authority over gameplay truth.

## 1.1 Technical Promise

A developer should be able to create a pig, spider, centipede, bird, dragon, humanoid NPC or watchtower blueprint, approve it, bake it and see it in a controlled runtime preview without manually wiring fragile scene paths. The same content must survive project reload, source-control merge, registry rebuild and later visual override.

## 1.2 Technical Pillars

| Pillar | Engineering Meaning |
| --- | --- |
| Voxel Source Fidelity | Editable voxel source remains available even after optimised runtime products are generated. |
| Semantic Architecture | Body roles, joints, sockets, hit regions, blueprint markers and network ports use stable semantic IDs. |
| Shared Forge Foundation | Entity and Blueprint tools reuse the manifest, dependency, override, lifecycle, validation and packaging systems from Set 21. |
| Deterministic Products | The same approved source and tool versions produce equivalent runtime manifests and products. |
| Authoritative Boundaries | Presentation responds to gameplay and world state; it does not invent it. |
| Scalable Complexity | A pig can be simple, while a dragon or capital blueprint can be complex without forcing all content into the most expensive path. |
| Reversible Development | Source edits, AI changes, approvals, migrations and overrides can be reviewed and rolled back. |
| Runtime Performance | High-detail authoring is converted into bounded products and LOD profiles. |

## 1.3 What This Plan Does Not Do

This plan does not:

- Build full audio production software.
- Build full particle or VFX authoring software.
- Define complete gameplay AI behaviour trees.
- Define combat balance or exact damage formulas.
- Define every final creature, race or structure.
- Require native C++ before profiling.
- Make every authored voxel a runtime node or physics body.
- Allow a local visual override to change multiplayer gameplay truth.
- Require full public modding or player-facing creation in the POC.

# 2. Locked Direction Summary

| Area | Locked Technical Decision |
| --- | --- |
| Shared Foundation | Reuse the 21F Forge core and extend it through specialist services and schemas. |
| Host | Primary authoring uses a Godot EditorPlugin main-screen workspace; an optional in-game developer host uses the same core services. |
| Language | GDScript first; shaders for rendering work; GDExtension only for measured hotspots. |
| Entity Source | Layered Resources referencing body graph, voxel parts, rig, animation, customisation, equipment, gameplay contract and bake profile. |
| Blueprint Source | Layered semantic blueprint Resource with placements, nested modules, roles, markers, networks, stages, states and placement rules. |
| Body Graph | Directed acyclic graph with stable node IDs, semantic roles, parent links and authored constraints. |
| Repeated Segments | Store generator parameters and overrides, not hundreds of unrelated hand-authored nodes. |
| Rigging | Reusable rig templates plus custom rigs. Rigid-part binding is the default. |
| Animation | Shared libraries, retarget maps, procedural solvers, named events and state-driven presentation. |
| Customisation | Deterministic layered resolution with independent seed channels and explicit exclusions. |
| Gameplay Contracts | Collision, hit regions, weak points, sensors, navigation capabilities and interaction anchors are versioned contracts. |
| Runtime Assembly | Build actors from approved packages through factories and registries, not hard-coded file paths. |
| LOD | Rendering, animation, physics, AI and simulation LOD are independent but coordinated. |
| Blueprint Instances | Store stable blueprint ID, revision/variant tokens, transform, ownership and world-state deltas. |
| Construction | Stages and upgrades are deterministic deltas with resource and marker validation. |
| Worldgen | Blueprint placement uses versioned profiles, relational anchors, deterministic seeds and fallback rules. |
| Icon Capture | Deterministic capture profiles render directly from Forge live views. |
| Validation | Errors block approval; warnings can be overridden only with recorded justification. |
| Persistence | Atomic source writes, backup snapshots, schema migrations and generated-product regeneration. |
| CI | Validate schemas, bake golden content, test determinism and run representative runtime scenarios. |
| Deferred | Full Audio Forge, full VFX Forge, public creator, marketplace, final creature ecosystem and final procedural world-building suite. |

# 3. Technical Goals, Constraints and Non-Goals

## 3.1 Goals

The implementation must:

- Support the body families defined in 22B without a universal humanoid-only assumption.
- Keep simple authoring paths for common content.
- Preserve exact stable identity through visual redesign.
- Make body, rig and animation compatibility explicit.
- Produce reusable animation and equipment libraries.
- Support deterministic generated variation for populations and structure decoration.
- Validate entity contracts against runtime capabilities.
- Validate structure blueprints against NPC, pathing, automation, mana and construction requirements.
- Make dependencies and affected content visible before changes are approved.
- Generate icons and thumbnails from the same approved presentation used by the game.
- Scale to large registries without loading every source asset into memory.

## 3.2 Constraints

- One metre remains the canonical world block scale.
- Standard block surfaces remain 32 x 32 pixels per face unless a documented exception applies.
- Entity density profiles must remain visually compatible with the block world.
- Godot scene-tree changes occur on the main thread.
- Heavy baking jobs operate on immutable or copied plain data.
- Generated products must be replaceable without destroying source.
- POC content must remain achievable by a small team using Summer Engine assistance.
- Player and NPC collisions must remain compatible with doors, workstations and navigation envelopes.

## 3.3 Non-Goals

The first implementation will not solve:

- Film-quality deformation or motion capture.
- Fully dynamic destruction of every voxel in every creature.
- Arbitrary runtime user-authored scripts.
- Unlimited limb counts without budgets.
- Seamless retargeting between incompatible body families.
- Full procedural animation for every attack and social action.
- Automatic generation of production-ready art without developer review.
- Full structural engineering simulation for blueprints.

# 4. Relationship to Document 21F and Shared Forge Services

Document 21F owns the shared platform. Document 22K adds domain services rather than reimplementing the platform.

## 4.1 Shared Services Reused Unchanged or Extended

| Shared Service | Entity/Blueprint Use |
| --- | --- |
| `ForgeProjectManifestService` | Registers entity, rig, animation, equipment and blueprint namespaces and schemas. |
| `ForgeAssetIndexService` | Searches and filters all new source types without eagerly loading them. |
| `ForgeDependencyGraphService` | Tracks body parts, rigs, clips, materials, equipment, modules and worldgen dependencies. |
| `ForgeCommandService` | Provides transactional edits and undo/redo. |
| `ForgePersistenceService` | Performs atomic saves, backups and recovery. |
| `ForgeBakeService` | Orchestrates entity and blueprint product jobs. |
| `ForgeValidationService` | Runs common and domain-specific validators. |
| `ForgeOverrideResolver` | Resolves project, pack and permitted world presentation overrides. |
| `ForgeIconCaptureService` | Adds entity portraits and blueprint miniature profiles. |
| `ForgeLifecycleService` | Applies Concept, Draft, Functional, Visual Review, Approved, Deprecated and Legacy states. |
| `ForgePackageService` | Exports source, products, manifests, dependencies and migration records. |
| `ForgeAIChangeLedger` | Records Summer Engine-assisted changes and required review. |

## 4.2 New Specialist Services

```text
Forge Core
├── EntityDefinitionService
├── BodyPlanGraphService
├── VoxelBodyPartService
├── RigAuthoringService
├── AnimationLibraryService
├── ProceduralMotionService
├── CustomisationResolver
├── EquipmentCompatibilityService
├── EntityContractService
├── EntityBakeService
├── BlueprintDefinitionService
├── BlueprintLayerService
├── BlueprintConstructionService
├── BlueprintPlacementService
├── BlueprintBakeService
└── ForgeTestLaboratoryService
```

## 4.3 Boundary Rule

Specialist services may depend on shared Forge contracts. Shared Forge services must not depend on one specific creature or blueprint family. This prevents dragon-specific or village-specific assumptions from contaminating the platform.

# 5. Godot and Summer Engine Development Model

## 5.1 Normal Godot Project First

The Forge must remain a normal Godot project and add-on. Summer Engine may generate plans, code, tests, fixtures and migration proposals, but the repository remains understandable without proprietary orchestration state.

## 5.2 Recommended Implementation Languages

| Work | Default |
| --- | --- |
| Editor UI and domain services | GDScript |
| Data Resources and validators | GDScript |
| Preview rendering | Godot scenes, shaders and GDScript |
| Material and selection overlays | Godot shaders |
| Deterministic source processing | GDScript over compact arrays initially |
| Heavy voxel meshing or repeated-segment generation | Profile first; optional GDExtension later |
| Automated tests | GDScript test framework and command-line scenes/scripts |

## 5.3 AI Change Rules

Summer Engine-assisted changes must:

- State which document and contract they implement.
- Touch bounded modules where practical.
- Add or update tests.
- Avoid replacing stable IDs or schemas without a migration.
- Record generated files separately from canonical source.
- Pass lint, validation, golden-content bake and render checks.
- Require human approval for collision, hit region, network, construction cost, worldgen and save-schema changes.

# 6. Project Modules, Ownership and Communication

## 6.1 Recommended Add-on Boundaries

| Module | Owns |
| --- | --- |
| `forge_core` | Shared IDs, manifests, lifecycle, commands, persistence, dependency graph and package contracts. |
| `forge_voxel` | Voxel volumes, materials, modifiers, source previews and common mesh baking. |
| `forge_entity` | Entity definitions, body graphs, part assembly, customisation and entity contracts. |
| `forge_rig` | Rig templates, joints, sockets, retarget maps and solver profiles. |
| `forge_animation` | Clips, libraries, events, state graphs and procedural motion profiles. |
| `forge_blueprint` | Blueprint layers, placements, modules, construction, states and placement rules. |
| `forge_runtime` | Runtime package resolution, actor factories, structure factories and presentation controllers. |
| `forge_testlab` | Preview scenarios, diagnostics, benchmark scenes and acceptance tests. |
| `forge_ui` | Main-screen editor shell and domain workspace panels. |

## 6.2 Communication Rules

- UI issues commands; it does not directly mutate disk Resources.
- Domain services return immutable snapshots or explicit editable sessions.
- Bake jobs consume serialisable snapshots, not live Nodes.
- Runtime systems consume approved package manifests and stable IDs.
- Gameplay systems publish state through typed adapters or events.
- Entity and Blueprint workspaces share selection and dependency context through interfaces, not global singletons with hidden mutable state.

## 6.3 Suggested Event Families

```text
forge.source.changed
forge.validation.completed
forge.bake.started
forge.bake.completed
forge.package.promoted
forge.runtime.refresh_requested
entity.contract.changed
entity.preview.rebuilt
blueprint.layer.changed
blueprint.validation.completed
blueprint.preview.rebuilt
```

Events inform observers after a command commits. They are not substitutes for authoritative query services.

# 7. Folder Structure, Add-ons and Generated Products

The project should separate source, generated products, caches and tests.

```text
addons/
    leyforge_forge/
        core/
        voxel/
        entity/
        rig/
        animation/
        blueprint/
        runtime/
        testlab/
        ui/
content/
    forge/
        entities/
            definitions/
            body_plans/
            body_parts/
            rig_profiles/
            animation_sets/
            customisation/
            equipment_profiles/
            gameplay_contracts/
        blueprints/
            definitions/
            modules/
            material_roles/
            construction_profiles/
            placement_profiles/
            state_profiles/
        shared/
            semantic_roles/
            marker_catalogues/
            capture_profiles/
            lifecycle/
            migrations/
generated/
    forge/
        entities/
            meshes/
            skeletons/
            animations/
            materials/
            collisions/
            scenes/
            lod/
            icons/
            portraits/
            manifests/
        blueprints/
            compact_data/
            preview_scenes/
            thumbnails/
            nav_hints/
            construction_data/
            placement_data/
            manifests/
cache/
    forge/
tests/
    forge_entity/
    forge_blueprint/
    forge_integration/
    forge_golden/
```

Generated folders may be committed when the project policy requires deterministic approved products, but transient Godot import state and temporary caches are excluded.

# 8. Stable IDs, Manifests, Lifecycle and Content Contracts

## 8.1 ID Families

Recommended ID namespaces:

```text
entity.definition.*
entity.body_plan.*
entity.body_part.*
entity.rig.*
entity.animation_set.*
entity.customisation.*
entity.equipment_profile.*
entity.contract.*
blueprint.definition.*
blueprint.module.*
blueprint.material_role_set.*
blueprint.construction_profile.*
blueprint.placement_profile.*
marker.role.*
socket.role.*
network.role.*
capture.profile.*
```

## 8.2 Stable Identity Rule

A display name, file name or scene path is not an identity. Rename operations update metadata and paths while preserving IDs. Save records and gameplay registries reference IDs.

## 8.3 Lifecycle

| State | Technical Meaning |
| --- | --- |
| Concept | Incomplete source allowed; not runtime-resolvable. |
| Draft | Source valid enough to save and preview; approval blocked. |
| Functional | Core contracts and products validate. |
| Visual Review | Runtime preview accepted; final package not promoted. |
| Approved | Package promoted and eligible for game registries. |
| Deprecated | Existing references remain valid; new use discouraged. |
| Legacy Fallback | Minimal package retained for migration or missing-pack recovery. |

## 8.4 Contract Classes

- **Presentation-only contract** - palette, non-spatial surface and cosmetic animation changes.
- **Spatial contract** - bounds, collision, socket positions, doorway clearance or footprint.
- **Gameplay integration contract** - hit regions, weak points, network ports, capacities or marker roles.
- **Persistence contract** - fields that appear in save records or world deltas.

Changes to the last three classes require explicit compatibility classification and tests.

# 9. Canonical Source and Runtime Product Separation

## 9.1 Canonical Source

Canonical source includes:

- Voxel body-part volumes and modifiers.
- Body-plan graph nodes and parameters.
- Rig templates, joints and attachment semantics.
- Animation source clips and events.
- Customisation pools and seed channels.
- Equipment fit profiles.
- Gameplay marker contracts.
- Blueprint placements, nested modules and semantic layers.
- Construction and world-state deltas.
- Worldgen placement rules.
- Capture profiles.

## 9.2 Runtime Products

Runtime products include:

- Optimised meshes and material bindings.
- Skeletons, skins or rigid-part hierarchies.
- Baked animation libraries and state resources.
- Collision, hurtbox and sensor proxies.
- Entity PackedScenes or compact assembly manifests.
- Blueprint compact placement data.
- Construction stage products.
- Navigation hints and bounds.
- Icons, portraits, codex images and thumbnails.
- LOD products and compatibility manifests.

## 9.3 Regeneration Rule

Every generated product must identify its source hash, dependency hashes, baker version and target profile. Deleting the generated folder must not delete authored content.

# 10. Entity Definition and Resource Architecture

## 10.1 Layered Entity Definition

```text
EntityPresentationDefinition
├── identity and lifecycle
├── body_plan_id
├── body_part_bindings
├── rig_profile_id
├── animation_set_id
├── material_profile_ids
├── customisation_profile_ids
├── equipment_compatibility_id
├── gameplay_contract_id
├── representation_profiles
├── lod_profile_id
├── capture_profile_ids
└── dependency and migration metadata
```

## 10.2 Definition Versus Runtime Record

The entity definition describes reusable content. A persistent NPC or creature record stores instance identity and state such as appearance seed, selected authored variant, equipment IDs, health, job, relationships and simulation state. The loaded actor resolves both.

## 10.3 Representation Profiles

An entity may have:

- Full world representation.
- Medium and far LOD representation.
- Inventory or summon icon.
- Dialogue portrait.
- Codex full-body image.
- Boss card.
- Corpse or remains representation.
- Distant abstract marker.

These profiles share identity but may use different products and capture settings.

# 11. Body-Plan Graph and Anatomy Source Model

## 11.1 Graph Requirements

The body-plan graph is a directed acyclic graph of anatomical nodes. Each node has:

- Stable node ID within the body plan.
- Semantic role.
- Parent node ID.
- Side or pair index.
- Local transform and scale.
- Part binding or generator reference.
- Joint hint.
- Rig-role mapping.
- Collision and damage-region hints.
- LOD grouping.
- Optional repeated-segment metadata.

## 11.2 Graph Operations

The service must support:

- Add, remove and reparent node.
- Mirror a node or pair.
- Insert repeated chains.
- Convert generated nodes to local overrides.
- Validate cycles and duplicate semantic roles.
- Compare template and instance graph.
- Map nodes to rig bones and gameplay regions.

## 11.3 Template Compatibility

Templates define required roles and optional extension points. A pig template may require `body`, `head`, four leg roots and optional tail. A dragon template may require torso, neck chain, head, jaw, tail chain, wing roots and locomotion limbs according to subtype.

## 11.4 Storage

Store graph data in compact Resources and avoid one Node3D per authoring node in source. The editor can materialise temporary preview nodes from the graph.

# 12. Voxel Body Parts, Density, Materials and Modifiers

## 12.1 Body Part Source

A body part references:

- Compact voxel volume.
- Local origin and connection anchors.
- Density profile.
- Palette and material slots.
- Modifier stack.
- symmetry source.
- surface tags.
- deformation compatibility.
- LOD and bake profile.

## 12.2 Density Profiles

Density is declared rather than inferred. The validator checks adjacent parts for incompatible pixel scale and warns when an exception lacks justification.

## 12.3 Non-Destructive Modifiers

Initial modifier set:

- Mirror.
- Array/repeat.
- Taper.
- Bend guide.
- Twist.
- Hollow.
- Thicken.
- Material replacement.
- Controlled noise.
- Damage scatter.
- Age/weathering.
- Corruption mask.

Modifiers operate deterministically and store parameters plus seed. They can be disabled, reordered or baked into a new source revision.

## 12.4 Runtime Geometry

Body parts bake through hidden-face removal, compatible face merging, indexed vertices and material grouping. Static adjacent parts may be combined where animation and damage contracts permit. Moving or breakable parts remain separable.

# 13. Repeated Segments, Procedural Anatomy and Deterministic Generation

## 13.1 Segment Generator Source

A repeated chain stores:

```text
segment_source_id
segment_count
length_profile
scale_curve
rotation_curve
overlap_or_gap
child_attachment_pattern
material_variation_profile
seed
local_overrides
lod_reduction_profile
```

## 13.2 Generated Node Identity

Generated segments receive deterministic derived IDs based on chain ID and ordinal. Local overrides bind to these stable derived IDs. Changing segment count must report which overrides become orphaned.

## 13.3 Centipede and Long-Body Optimisation

The editor may display every segment, but runtime products can:

- Combine repeated static geometry into larger meshes.
- Group collision and damage regions.
- Reduce active leg solvers at distance.
- Use phase-offset animation instancing.
- Replace remote body chains with simplified spline-driven products.

## 13.4 Deterministic Population Variation

Procedural anatomy and markings use independent seed channels so changing colour does not reshuffle horns, proportions or scars. Seed-channel names are stable contract fields.

# 14. Rig, Skeleton, Joint and Attachment Source Model

## 14.1 Rig Profile

A rig profile defines:

- Bone or rigid-part hierarchy.
- Semantic bone roles.
- Rest transforms.
- Joint types, axes and limits.
- Body-plan role mappings.
- IK chain definitions.
- procedural solver hooks.
- attachment sockets.
- retarget profile.
- rig LOD levels.
- breakable-chain metadata.

## 14.2 Rigid Versus Deformable Binding

Rigid voxel-part binding is the default because it preserves pixel form and is easy to author. Limited weighted skinning may be enabled for selected flexible regions such as long necks, tails or wing membranes when the visual benefit justifies complexity.

## 14.3 Socket Source

Sockets use semantic IDs and store:

- Parent rig role or body node.
- Local transform.
- allowed attachment categories.
- handedness or side.
- occupancy rules.
- gameplay/presentation classification.
- optional preview mesh.

## 14.4 Version-Appropriate Godot Adapter

The core source model must not encode one exact Godot IK node as permanent data. Runtime builders translate Forge rig and solver profiles to the version-appropriate Godot `Skeleton3D`, animation and modifier/solver implementation. This isolates engine API changes from authored content.

# 15. Runtime Skeleton Assembly and Binding

## 15.1 Assembly Pipeline

```text
resolved entity definition
    -> resolve body graph
    -> resolve rig template and overrides
    -> build semantic skeleton/part hierarchy
    -> attach baked meshes
    -> apply material bindings
    -> create sockets and region proxies
    -> attach animation state resources
    -> register gameplay contract adapters
```

## 15.2 PackedScene Versus Assembly Manifest

Common approved entities may bake to a `PackedScene` for fast instantiation. Highly variable NPCs may use a compact assembly manifest and shared mesh/material resources to avoid generating a unique scene for every appearance.

## 15.3 Shared Resources

Meshes, materials, animation libraries and rig templates should be shared by reference. Per-instance state stores only selections and dynamic parameters.

## 15.4 Read-Back Validation

After assembly, the baker or runtime test verifies:

- Required rig roles exist.
- Part transforms match expected anchors.
- Sockets resolve.
- Bounds and ground contact are valid.
- animation tracks target existing roles.
- gameplay proxies align with visual regions.

# 16. Animation Source, Libraries, Retargeting and Events

## 16.1 Animation Source Types

- Transform clips over semantic rig roles.
- Rigid-part clips.
- Limited skeletal deformation clips.
- Voxel-frame tracks.
- Material parameter tracks.
- visibility/variant tracks.
- named event tracks.
- procedural solver parameter tracks.

## 16.2 Animation Libraries

Libraries are organised by compatible rig family and capability tags. A humanoid library can be reused by compatible people; a quadruped library can be specialised into pig, boar and wolf variants.

## 16.3 Retarget Maps

Retargeting maps semantic source roles to target roles and includes scale, orientation and optional correction poses. Compatibility levels are explicit:

- Exact.
- Compatible with proportional correction.
- Partial with missing optional roles.
- Incompatible.

## 16.4 Animation Events

Events store a stable event name, time, payload class and authority classification. Examples include footsteps, tool contact, attack window requests, breath release, item transfer and construction strike.

Presentation events may trigger future sound/VFX sockets. Gameplay events are requests consumed and validated by authoritative gameplay systems; an animation file cannot independently apply damage or transfer resources.

## 16.5 State Resources

Godot runtime products may use `AnimationPlayer`/animation library products and `AnimationTree`-style state/blend resources, but authored state definitions remain Forge Resources so they can be regenerated and migrated.

# 17. Procedural Gait, IK, Terrain Contact and Flight Solvers

## 17.1 Solver Architecture

Procedural motion uses small composable solvers behind stable interfaces:

```text
IProceduralMotionSolver
├── initialise(profile, semantic_rig)
├── update_targets(context)
├── solve(delta, lod_level)
├── emit_diagnostics()
└── reset()
```

## 17.2 Initial Solver Families

- Two-leg foot placement.
- Quadruped foot placement.
- Spider alternating gait.
- Hexapod tripod gait.
- Centipede travelling wave.
- Head/look tracking.
- Tail and neck follow-through.
- Wing bank and glide adjustment.
- Perch and landing alignment.
- Mount rider alignment.

## 17.3 Determinism and Authority

Procedural presentation can be locally evaluated from authoritative movement inputs when it does not affect gameplay. Contact data that influences movement, climbing or attacks remains authoritative and is not derived solely from cosmetic solver output.

## 17.4 LOD

At distance, reduce raycasts, solver frequency, active limbs and correction precision. Remote crowds may use authored clips without procedural contact. Segment creatures can solve representative limbs and phase the rest.

## 17.5 Failure Behaviour

If a solver cannot resolve terrain or required roles, it falls back to base animation and reports a diagnostic in the Test Laboratory rather than corrupting the rig.

# 18. Humanoid Assembly, Customisation and Persistent NPC Appearance

## 18.1 Layer Resolution

```text
species/base family
    -> body frame
    -> culture
    -> faction
    -> profession
    -> individual authored or seeded variation
    -> equipment
    -> persistent history
    -> runtime state overlays
```

## 18.2 Deterministic Resolver

The resolver consumes stable pools, weights, exclusions and independent seeds. It produces a compact resolved appearance record that can be stored in an NPC save record.

## 18.3 Player Character Constraints

Player-compatible profiles validate:

- movement envelope.
- first-person camera and hand presentation.
- doorway and workstation clearance.
- equipment fit.
- multiplayer representation consistency.
- animation compatibility.

## 18.4 NPC Persistence

A named NPC stores appearance seed channels and explicit overrides. Promotion from distant simulation to a loaded actor reconstructs the same appearance. Appearance changes from age, scars, equipment or corruption are stored as state deltas, not regenerated randomly.

## 18.5 Population Preview

The editor generates sample populations from a culture/faction profile and reports repetition, invalid combinations, silhouette spread and material diversity.

# 19. Equipment, Fit Profiles, Coverage and Runtime Attachment

## 19.1 Equipment Compatibility Record

An equipment item presentation declares:

- compatible body/rig families.
- required sockets.
- coverage regions.
- fit profile or part substitutions.
- hide/replace rules for underlying parts.
- clipping masks.
- alternate variants.
- handedness and grip profiles.
- icon/portrait visibility rules.

## 19.2 Runtime Resolution

The actor assembler resolves equipment from authoritative inventory/equipment state. The Forge controls visual attachment and fit, while gameplay systems control whether the item is equipped and what it does.

## 19.3 Multi-Limb Support

Equipment slots are semantic rather than fixed to two hands. A four-armed humanoid can expose `hand.primary.0`, `hand.secondary.0`, `hand.primary.1` and related roles according to its equipment contract.

## 19.4 Armour and Damage Regions

Coverage maps refer to semantic damage regions. A visual armour piece must not silently grant coverage; the combat system validates gameplay coverage from authoritative item definitions. The Forge validator compares both and warns when presentation and gameplay disagree.

# 20. Entity Gameplay Contracts, Collision, Hit Regions and AI Markers

## 20.1 Contract Contents

An entity gameplay contract may include:

- movement collision profile.
- footprint and height.
- hurtbox regions.
- weak-point and armour-region mappings.
- temporary attack volume anchors.
- interaction anchors.
- vision, hearing and special sensor origins.
- navigation capabilities.
- mount/passenger/cargo points.
- projectile, spell and breath origins.
- loot, nameplate and UI anchors.
- LOD merge rules.

## 20.2 Presentation Versus Gameplay Authority

The Forge authors and previews spatial contracts, but gameplay code decides outcomes. Changing a visual head without updating the head hurtbox is a warning. Changing the hurtbox requires gameplay compatibility review.

## 20.3 Proxy Products

The bake pipeline creates simplified collision and region proxies. It must not create one collision shape per voxel. Proxy generation is guided by authored regions and can be manually overridden.

## 20.4 Marker Catalogue

Semantic marker definitions live in shared catalogues with versioned required fields, allowed parent roles and validation rules. This prevents one blueprint or creature from inventing incompatible marker meanings.

# 21. Entity Runtime Assembly, Actors and Presentation Controllers

## 21.1 Runtime Actor Factory

`EntityActorFactory` receives:

- stable entity definition ID.
- persistent runtime record or spawn parameters.
- approved content manifest.
- current equipment and state.
- target representation/LOD profile.

It returns a loaded actor configured through runtime adapters.

## 21.2 Actor Components

Recommended composition:

```text
EntityActor
├── movement/physics owner
├── visual root
├── semantic rig adapter
├── animation presentation controller
├── equipment presentation controller
├── gameplay region adapter
├── interaction marker adapter
├── LOD controller
└── debug/diagnostic adapter (development only)
```

## 21.3 State Flow

Gameplay state flows one way into presentation snapshots. Presentation may emit named requests or completed-animation events, but authoritative systems validate them.

## 21.4 Actor Reconstruction

Actors are disposable loaded representations. Persistent identity and state remain in records. Demotion/unloading writes only approved runtime deltas and never serialises the entire scene tree.

# 22. Entity Rendering, Animation, Physics, AI and Simulation LOD

## 22.1 Independent LOD Axes

| Axis | Example Levels |
| --- | --- |
| Rendering | Full mesh -> reduced mesh -> impostor/hidden. |
| Animation | Full clips + solvers -> clips only -> sampled pose -> static. |
| Physics | Full movement and regions -> simplified collision -> no local physics. |
| AI | Full behaviour -> reduced local logic -> abstract settlement/region decision. |
| Simulation | Per-tick needs/inventory -> batched summary -> distant event model. |
| Marker Detail | All anchors -> essential interaction anchors -> stable record only. |

## 22.2 Coordination

A central representation policy selects compatible combinations, but one axis should not force all others. A visible distant dragon may need a flight animation but no individual wing hitboxes.

## 22.3 Promotion and Demotion

Promotion reconstructs from persistent record plus approved definition. Demotion validates that important changes such as wounds, equipment, cargo, location and quest bindings are written back to authoritative records.

## 22.4 Crowds and Herds

Use shared meshes/materials, animation sampling, reduced solvers and optional `MultiMesh`-style products for purely visual distant groups. Named important NPCs retain individual identity even when their visual representation is batched or omitted.

# 23. Blueprint Definition and Semantic Layer Architecture

## 23.1 Blueprint Source Record

A blueprint definition stores:

- stable ID, version and lifecycle.
- coordinate origin, bounds and anchors.
- block/shape placements.
- unique Forge asset placements.
- nested module instances.
- material roles.
- semantic marker layers.
- network layers.
- construction profile.
- upgrade and world-state profiles.
- terrain adaptation rules.
- worldgen placement profile.
- capture profile.
- dependencies and migration metadata.

## 23.2 Layer Storage

Layers are stored as compact typed collections rather than arbitrary Nodes. The editor materialises selected layers into preview nodes.

## 23.3 Instance Record

A world structure instance stores:

```text
instance_id
blueprint_id
blueprint_revision_or_compat_token
variant/material role resolution
world transform
owner/faction/village IDs
construction stage and progress
world-state flags
persistent element deltas
network bindings
quest/event bindings
```

## 23.4 Internal Element IDs

Placements and markers receive stable internal IDs so upgrades, damage and save deltas can target them even if source ordering changes.

# 24. Nested Modules, Material Roles and Dependency Resolution

## 24.1 Nested Modules

Modules are reusable blueprints with connectors and exposed parameters. The resolver expands them deterministically while preserving source module identity for review and migration.

## 24.2 Circular Dependency Prevention

The dependency graph rejects direct or indirect blueprint/module cycles before approval.

## 24.3 Material Roles

Blueprints reference roles such as `wall.primary`, `roof.primary` or `trim.metal`. Culture and biome role sets resolve those roles to approved block/material IDs. Required physical properties can be specified as constraints.

## 24.4 Dependency Locking

Approved blueprint packages record dependency hashes or compatibility versions. A changed door, machine or module triggers targeted invalidation and validation rather than silently altering every structure.

## 24.5 Missing Dependencies

The preview shows placeholders and blocks approval for required dependencies. Runtime uses a declared legacy fallback only when compatibility policy allows it.

# 25. Construction Stages, Upgrades, Damage and World-State Deltas

## 25.1 Stage Representation

Construction stages should be stored as semantic deltas from the source blueprint:

- elements added or activated.
- elements removed or hidden.
- material substitutions.
- marker availability.
- network availability.
- collision/navigation changes.
- required resources and project recipe links.

## 25.2 Upgrade Profiles

An upgrade links a parent blueprint/state to a target state and stores ordered changes. The validator checks that existing persistent element IDs remain resolvable or have migrations.

## 25.3 Damage and Repair

Damage states may use authored region groups and deterministic replacement rules. Runtime damage produces sparse instance deltas. Repair removes or transforms those deltas according to authoritative construction/project systems.

## 25.4 Occupation and Corruption

Occupation, faction conversion, corruption and cleansing primarily alter markers, material roles, props, spawn rules and effects. Gameplay systems own the state; Blueprint presentation resolves the matching package.

## 25.5 Partial Functionality

Stages explicitly declare which entrances, beds, workstations, storage, networks and defences are active. This prevents unfinished structures from becoming fully functional because their final markers exist in source.

# 26. World-Generation Placement, Terrain Adaptation and Structure Instances

## 26.1 Placement Profile

A placement profile contains:

- biome and region tags.
- terrain slope/height/water constraints.
- road, river, village, resource and leyline relationships.
- orientation rules.
- clearance and exclusion volume.
- terrain adaptation mode.
- deterministic decoration seed channels.
- fallback and retry policy.
- progression guarantee classification.

## 26.2 Relational Anchors

Worldgen uses named anchors such as entrance, road connector, river crossing, mine direction or village centre. These are semantic data, not hard-coded local coordinates in worldgen scripts.

## 26.3 Terrain Adaptation Products

The Blueprint baker may generate:

- footprint masks.
- foundation/support requirements.
- cut/fill volumes.
- water interaction masks.
- road/entrance approach zones.
- placement validation bounds.

Actual world edits remain authoritative worldgen or construction operations.

## 26.4 Versioning

A generated world stores the blueprint and placement-profile compatibility tokens used. Later content updates do not retroactively rewrite structures unless an explicit migration or regeneration policy applies.

# 27. Shared Marker, Socket, Network and Role Registries

## 27.1 Registry Purpose

Entity and Blueprint content must share a controlled vocabulary for semantic roles. Examples include `interaction.talk`, `job.blacksmith.anvil`, `network.item.input`, `sensor.vision.origin` and `structure.entrance.primary`.

## 27.2 Registry Record

Each role defines:

- stable role ID.
- domain.
- required fields.
- allowed parent content types.
- multiplicity.
- compatibility version.
- validation rules.
- runtime consumer service.
- deprecation/migration mapping.

## 27.3 Extensibility

Content packs can add namespaced roles only through declared extension points. Core runtime consumers ignore unknown optional presentation roles but reject unknown required gameplay roles.

## 27.4 Editor Assistance

The property inspector selects roles from the registry, displays their requirements and offers automatic placement suggestions based on voxel bounds or body semantics.

# 28. Icon Capture, Portraits, Codex Images and Blueprint Thumbnails

## 28.1 Capture Pipeline

```text
approved or preview source
    -> build controlled preview scene
    -> resolve variant/state/equipment
    -> apply capture camera and lighting profile
    -> render to transparent or themed target
    -> crop/pad/outline/post-process
    -> write image and capture manifest
```

## 28.2 Determinism

Capture profiles store camera, projection, target framing, lighting, background, state, animation time, seed and output size. Batch regeneration uses the same inputs.

## 28.3 Product Types

- Inventory icons.
- Block/item recipe icons.
- NPC dialogue portraits.
- Creature codex images.
- Boss cards.
- Blueprint miniatures.
- Construction-stage thumbnails.
- Save or review thumbnails.

## 28.4 Live-Linked Versus Locked

Live-linked captures invalidate when relevant dependencies change. Locked captures preserve an approved frame and report mismatch if the current model materially differs.

# 29. Unified Forge Hosts, UI Services and Workspace Integration

## 29.1 EditorPlugin Host

The main production host uses a Godot main-screen `EditorPlugin` with `Control`-based workspaces. It uses the same domain services as headless tests and optional in-game previews.

## 29.2 Workspace Sessions

Each open tab owns an editable session containing:

- source snapshot and revision.
- command history.
- selection and viewport state.
- dirty regions.
- validation summary.
- preview build handle.
- provenance and override context.

## 29.3 Service-Driven UI

The UI never scans folders directly or mutates Resource fields without commands. Search uses the asset index. Save uses persistence. Bake uses the job service. Validation uses domain validators.

## 29.4 Large Content Behaviour

The library loads metadata cards lazily. Graphs and preview products load on demand. Large blueprints stream visible regions/layers into the editor rather than materialising every node continuously.

## 29.5 Accessibility and Trust

Diagnostics identify the exact object, role and source layer. Destructive actions show dependants and require explicit confirmation. Colour-coded overlays include shape, labels or patterns.

# 30. Forge Test Laboratory and Validation Scenarios

## 30.1 Test Laboratory Architecture

The Test Laboratory is a set of controlled scenes and scenario scripts using the same runtime assembly factories as the game. It is not a separate mock renderer.

## 30.2 Entity Scenarios

- Flat locomotion.
- Slopes and stairs.
- Narrow doors and workstation clearance.
- Rough terrain foot placement.
- Spider climbing surface.
- Centipede long-body turning.
- Bird take-off, flight and perch.
- Dragon ground, flight and breath-origin test.
- Equipment combination matrix.
- Hit region and attack volume visualisation.
- LOD transitions and crowd performance.

## 30.3 Blueprint Scenarios

- NPC entrance and path reachability.
- Bed, workstation and storage access.
- Door animation clearance.
- Chute/power/mana network continuity.
- Construction stage reachability.
- Damage and repair transition.
- Material-role matrix.
- Terrain placement and foundation adaptation.
- Worldgen relational-anchor test.
- LOD and streaming benchmark.

## 30.4 Repeatable Scenario Records

Scenarios store seed, profile, content revisions and expected assertions. Results attach to the asset lifecycle review.

# 31. Entity and Blueprint Bake Pipeline

## 31.1 Job Graph

```text
validate source
    -> resolve dependencies and overrides
    -> canonicalise source snapshot
    -> generate domain intermediate data
    -> bake meshes/materials/rigs/animations/proxies
    -> bake blueprint compact products
    -> generate captures and LODs
    -> assemble preview/runtime packages
    -> read-back validate
    -> write manifest
    -> promote atomically after approval
```

## 31.2 Entity Jobs

- Body graph expansion.
- Modifier evaluation.
- Part mesh baking.
- Rig/skeleton generation.
- Binding/skin or rigid hierarchy generation.
- Animation retarget and compression.
- Collision/hurtbox proxy generation.
- Equipment fit product generation.
- LOD generation.
- Scene or assembly-manifest generation.
- icon/portrait capture.

## 31.3 Blueprint Jobs

- Placement canonicalisation.
- Nested module expansion.
- Material-role validation.
- semantic-layer compilation.
- construction and state delta compilation.
- network graph validation.
- terrain/placement product generation.
- compact runtime data generation.
- preview scene and thumbnail generation.

## 31.4 Threading

Worker jobs operate on plain copied data. Godot `Resource`, `Image`, mesh and scene-tree commits occur through controlled main-thread stages where required. Jobs are incremental, cancellable and report progress.

# 32. Cache, Dependency Graph, Invalidation and Hot Reload

## 32.1 Cache Keys

Cache keys include canonical source hash, ordered dependency hashes, baker version, engine profile and product profile.

## 32.2 Invalidation Categories

- Geometry.
- Material.
- Rig.
- Animation.
- gameplay contract.
- capture.
- blueprint placement.
- blueprint semantic layers.
- construction/state.
- worldgen placement.

A palette edit should not rebuild worldgen placement. A body-graph change should invalidate rig mapping, collision, animations and captures.

## 32.3 Hot Reload

Development hot reload replaces preview/runtime presentation packages at safe boundaries. It does not mutate authoritative entity or structure state. Spatial contract changes require actor/instance reconstruction and explicit warning.

## 32.4 Dependency Graph UI

Before deletion, deprecation or approval, the system lists direct and transitive dependants. Large graphs support filtered impact views.

# 33. Runtime Registry Integration and Content Resolution

## 33.1 Registry Mapping

Gameplay registries map gameplay IDs to presentation IDs and contract versions. Runtime factories resolve presentation packages through the approved content manifest.

## 33.2 No Path-Based Gameplay Links

Gameplay definitions never store direct `.tscn` or generated mesh paths as identity. The resolver may internally cache Godot resource paths after stable-ID resolution.

## 33.3 Fallback Order

1. Exact approved package and required pack versions.
2. Compatible project override.
3. compatible base package.
4. declared legacy fallback.
5. visible missing-content placeholder plus error log.

Gameplay does not silently substitute an entity or structure with different gameplay contracts.

## 33.4 Content Packs

Pack manifests declare namespaces, dependencies, override priorities, schema versions and compatibility hashes. Equal-priority conflicts are explicit errors.

# 34. Persistence, Migration, Backups and Save Compatibility

## 34.1 Forge Source Persistence

Source saves use temp file, flush, validation/read-back and atomic replacement. Prior valid revisions and autosave snapshots are retained according to policy.

## 34.2 Schema Migration

Each Resource has a schema version. Migrations are small, ordered, idempotent and tested against fixtures. Source migration is separate from runtime save migration.

## 34.3 Save Compatibility

Entity saves store stable definition ID, appearance tokens, equipment IDs and persistent state. Structure saves store blueprint ID, compatibility token and sparse instance deltas. Visual-only package revisions do not rewrite saves.

## 34.4 Contract Migrations

Changes to body envelopes, hit regions, sockets, blueprint element IDs, marker roles or footprints require migration records. The migration may remap IDs, reconstruct actors, transform deltas or intentionally retain a legacy package.

## 34.5 Backup and Recovery

Recovery can reopen autosave source, restore an approved revision, discard corrupt generated products and rebake. It must never guess a migration silently.

# 35. Multiplayer Authority and Content Compatibility

## 35.1 Authority Boundaries

- Server/host owns entity movement, AI, combat, inventory, equipment, construction, ownership and world state.
- Clients resolve compatible presentation and evaluate permitted cosmetic animation locally.
- Client visual files cannot expand collision, attack reach, capacity or network ports.

## 35.2 Compatibility Handshake

A multiplayer content manifest includes required gameplay-contract versions and presentation compatibility hashes. Servers can enforce exact packs or allow approved cosmetic differences only where contracts declare them safe.

## 35.3 Replication

Replicate compact state: entity definition/variant token, equipment IDs, animation/action state, important presentation events, structure blueprint/variant token and sparse world-state deltas. Do not replicate source voxel volumes or full scene trees.

## 35.4 Deterministic Cosmetic Variation

Seeded cosmetic variation can be reconstructed locally from authoritative seed tokens when all clients share compatible profiles.

# 36. Performance Budgets, Scalability and Profiling

## 36.1 Budget Philosophy

Budgets are profile-based and measured in packaged builds. The Forge reports source and baked metrics but approval thresholds differ for small creatures, common NPCs, bosses, props and megastructures.

## 36.2 Entity Metrics

Track:

- source voxel count.
- visible face and vertex count by LOD.
- material/surface count.
- bones or rigid parts.
- active solver chains and raycasts.
- animation memory.
- collision and hurtbox count.
- draw calls.
- assembly time.
- icon capture time.

## 36.3 Blueprint Metrics

Track:

- block and unique asset placements.
- nested module count.
- functional entities.
- marker count.
- network nodes/edges.
- construction delta size.
- runtime instance data size.
- preview and world placement build time.
- navigation/terrain validation cost.

## 36.4 Profiling Gates

Native optimisation is considered only after:

1. Packaged profiling confirms a budget failure.
2. Algorithm and data layout are reviewed.
3. Incremental work and cache use are verified.
4. A bounded API and regression benchmark are defined.
5. GDExtension complexity is justified by measured gain.

# 37. Validation, Diagnostics and Recovery

## 37.1 Validation Layers

- Schema validation.
- ID and namespace validation.
- dependency validation.
- voxel source validation.
- body graph validation.
- rig/animation compatibility validation.
- customisation/equipment validation.
- gameplay contract validation.
- blueprint semantic validation.
- construction/state validation.
- worldgen placement validation.
- performance validation.
- generated-product read-back validation.

## 37.2 Severity

| Severity | Behaviour |
| --- | --- |
| Info | Guidance only. |
| Warning | Approval allowed only when policy permits; justification may be required. |
| Error | Approval and package promotion blocked. |
| Critical | Operation aborted; prior valid source/product preserved. |

## 37.3 Diagnostic Requirements

Every diagnostic includes stable code, severity, source ID, internal element/node ID where applicable, human explanation, likely consequence and recommended action.

## 37.4 Recovery

The user can navigate directly to invalid nodes, markers or layers. Bulk fixes are previewed as commands and remain undoable.

# 38. Testing, Golden Content and Continuous Integration

## 38.1 Test Layers

- Unit tests for ID, graph, resolver, delta and migration logic.
- property tests for deterministic generation and graph operations.
- integration tests for bake jobs and runtime assembly.
- scenario tests in the Test Laboratory.
- visual regression for icons, portraits and thumbnails.
- performance benchmarks for representative content.
- save/migration fixtures.

## 38.2 Golden Content

Golden content includes:

- standard humanoid.
- four-armed humanoid extension.
- pig.
- spider.
- segmented centipede.
- bird.
- dragon test rig.
- basic armour/weapon set.
- cottage.
- warehouse.
- staged watchtower.
- bridge.
- goblin camp.
- rune ruin.

## 38.3 CI Gates

CI should:

1. Validate all source schemas and IDs.
2. Detect dependency cycles and unresolved roles.
3. Bake golden content from a clean cache.
4. Compare deterministic manifests and allowed product hashes.
5. Run runtime assembly and blueprint scenario tests.
6. Run migration fixtures.
7. Report budget regressions.
8. Block promotion on critical errors or data-loss tests.

# 39. Summer Engine AI-Assisted Development Controls

## 39.1 Appropriate Uses

Summer Engine may assist with:

- scaffolding Resources and validators.
- generating test fixtures.
- proposing body-role mappings.
- suggesting joint or marker placement.
- creating first-pass gait profiles.
- generating repetitive schema documentation.
- identifying missing animation states.
- proposing blueprint construction stages.
- producing migration drafts.
- reviewing dependency impact.

## 39.2 Restricted Uses

AI-generated changes require explicit human review when they alter:

- stable IDs or namespaces.
- save schemas or migrations.
- movement collision or player envelopes.
- hit regions, weak points or attack anchors.
- network ports or capacities.
- construction resources or functional marker availability.
- worldgen guarantees.
- multiplayer compatibility.
- approval or fallback policy.

## 39.3 AI Change Ledger

Each AI-assisted change records prompt/task, files changed, tests added, contracts affected, reviewer, result and rollback reference. Generated claims are not accepted as validation evidence without executable tests or direct review.

# 40. Permissions, Security and Future Player-Creator Boundaries

## 40.1 Developer Forge

The developer Forge can edit source, contracts, IDs, markers, collisions, worldgen rules, migrations and packages according to repository permissions.

## 40.2 Future Restricted Creator

A future player or mod creator may be limited to:

- voxel appearance within approved budgets.
- approved body templates.
- cosmetic materials and animations.
- bounded blueprint placement palettes.
- non-authoritative icon capture.

It cannot edit core gameplay contracts, arbitrary scripts, save migrations or protected namespaces without a trusted content pipeline.

## 40.3 Package Safety

Imported packages are validated before loading. Unknown executable scripts are not accepted as ordinary Forge content. Paths are sandboxed to declared package roots, IDs are namespaced and manifests are signed or trusted according to future distribution policy.

# 41. Proof-of-Concept Scope and Explicit Deferrals

## 41.1 POC Entity Content

- One standard humanoid body and rig.
- Basic face/colour customisation.
- One clothing and equipment set.
- One persistent NPC appearance record.
- Pig quadruped.
- Spider with eight-leg gait.
- Centipede with repeated segments and reduced runtime solver.
- Bird with ground, take-off, flight and landing states.
- Dragon test rig with ground/flight preview and breath socket.

## 41.2 POC Blueprint Content

- Small cottage.
- village warehouse.
- staged watchtower.
- bridge/crossing.
- workshop with one functional machine connection.
- goblin camp.
- rune ruin.

## 41.3 POC Platform Proof

- Stable source IDs and manifests.
- body graph and rig editing.
- deterministic entity and blueprint baking.
- animation events and state preview.
- semantic markers and contract validation.
- icon/portrait/thumbnail capture.
- dependency graph and lifecycle approval.
- hot reload in Test Laboratory.
- save/reload of source and runtime instance records.

## 41.4 Explicit Deferrals

- Full Audio Forge.
- Full VFX/Particle Forge.
- public player-facing creator.
- marketplace and untrusted mod distribution.
- complete NPC race library.
- complete creature ecosystem.
- advanced cinematic animation editor.
- fully dynamic voxel dismemberment.
- automated production-quality AI art generation.
- full procedural city generator.
- final console-specific authoring host.

# 42. Staged Implementation Plan

## Stage 0 - Foundation Alignment

**Goal:** Confirm Set 21 services and schemas can be extended cleanly.

Tasks:

- Audit 21F core service interfaces.
- Lock ID namespaces and manifest extensions.
- Create ADRs for body graph, blueprint storage and runtime assembly.
- Add empty entity/blueprint modules and tests.
- Establish golden-content fixture repository.

**Exit criteria:** New modules compile/load, register schemas and pass empty-project validation without duplicating core services.

## Stage 1 - Entity Source and Body Graph

Tasks:

- Implement entity definition, body plan and body part Resources.
- Implement graph editing commands and validation.
- Add voxel part preview and density checks.
- Build humanoid and pig templates.
- Add canonical serialisation and source hashing.

**Exit criteria:** Humanoid and pig body graphs save, reload and reproduce identical preview manifests.

## Stage 2 - Rig and Runtime Assembly

Tasks:

- Implement rig profile, joints, role mapping and sockets.
- Build semantic skeleton/rig adapter.
- Implement rigid-part binding.
- Build runtime actor factory and preview scene.
- Add rig/part read-back validation.

**Exit criteria:** Humanoid and pig instantiate through stable IDs and animate a basic idle/walk clip.

## Stage 3 - Animation Libraries and Procedural Motion

Tasks:

- Implement animation source Resources and event tracks.
- Add retarget maps.
- Implement basic two-leg and quadruped foot placement.
- Add spider gait and centipede phase-wave prototype.
- Add bird flight-state preview.

**Exit criteria:** Golden entities run repeatable locomotion scenarios with diagnostics and LOD fallback.

## Stage 4 - Customisation, Equipment and Gameplay Contracts

Tasks:

- Implement deterministic appearance resolver.
- Add equipment fit and socket resolution.
- Implement collision/hit-region/sensor contract schemas.
- Generate simplified proxies.
- Persist NPC appearance and reconstruct actor.

**Exit criteria:** One named NPC reloads with identical appearance/equipment; entity contract tests pass.

## Stage 5 - Blueprint Source and Semantic Layers

Tasks:

- Implement blueprint definition, placements, modules and layers.
- Add material-role resolution.
- Add entrances, NPC markers, storage and network roles.
- Build compact preview and dependency validation.
- Create cottage and warehouse golden blueprints.

**Exit criteria:** Blueprints save, reload, preview and validate without scene-path identity.

## Stage 6 - Construction, States and Worldgen Placement

Tasks:

- Implement stage and upgrade delta compiler.
- Add damage/repair and occupation state profiles.
- Add placement profiles, anchors and terrain masks.
- Build staged watchtower and relational placement scenario.

**Exit criteria:** Watchtower progresses through stages, retains stable element IDs and passes placement validation.

## Stage 7 - Icon Capture, Unified UI and Test Laboratory

Tasks:

- Extend capture service for portraits, codex and blueprint thumbnails.
- Integrate workspaces into 22J shell.
- Add scenario runner and result reports.
- Add lifecycle review and package promotion.

**Exit criteria:** Entity/blueprint content can be created, validated, captured, approved and hot-reloaded through one workflow.

## Stage 8 - Performance, Migration and CI Hardening

Tasks:

- Add LOD generation and profiling overlays.
- Add clean-cache deterministic CI.
- Add migration fixtures and failure recovery.
- Benchmark crowds, spider/centipede solvers and large blueprints.
- Decide whether any measured hotspot justifies GDExtension.

**Exit criteria:** POC acceptance matrix passes in packaged builds and no critical data-loss or compatibility defect remains.

# 43. Technical Spikes, Risk Register and Redesign Triggers

| Risk/Spike | Evidence Needed | Mitigation | Redesign Trigger |
| --- | --- | --- | --- |
| Body graph becomes too generic or complex | Time to author pig, spider and dragon templates. | Keep template-first workflow and semantic extensions. | Common creatures require manual low-level graph work for routine changes. |
| GDScript voxel baking too slow | Clean-cache benchmark on golden entities and watchtower. | Incremental jobs, compact arrays, caching. | P95 bake time exceeds agreed budget after algorithm optimisation. |
| Procedural legs are unstable | Test Lab slopes, turns and climbing. | Fallback clips, reduced solver scope, profile tuning. | Common locomotion visibly fails on normal terrain. |
| Rig retargeting produces poor results | Humanoid and quadruped variant matrix. | Compatibility levels and correction poses. | Most compatible variants require unique animation copies. |
| NPC variation causes clipping/repetition | Population matrix tests. | Exclusions, fit profiles, weighted pools. | Approved population profile exceeds repetition/clipping threshold. |
| Blueprint layer model is too heavy | Cottage, warehouse, camp and watchtower authoring metrics. | Lazy materialisation, compact typed arrays. | Editor cannot interact smoothly with medium structures. |
| Nested modules break migrations | Parent module revision tests. | stable internal IDs, explicit conflict reports. | Parent changes silently corrupt child overrides. |
| Construction deltas become unmanageable | Watchtower and upgrade chain size/clarity. | semantic stages and delta compaction. | Deltas are larger or less reviewable than explicit state source. |
| Runtime assembly causes spikes | Spawn/crowd benchmark. | preloaded shared resources, pooled assembly, cached manifests. | Named NPC promotion exceeds frame-time budget. |
| Contract and presentation drift | Automated alignment tests. | mandatory contract validation and visual overlays. | Spatial mismatches repeatedly escape review. |
| AI changes introduce broad regressions | Change ledger and CI results. | bounded tasks, tests, approval gates. | AI-generated changes cannot be reviewed or reproduced reliably. |

# 44. Definition of Done and Acceptance Matrix

| Area | Definition of Done |
| --- | --- |
| Source Integrity | All POC entities and blueprints have canonical voxel source, schemas, stable IDs and valid dependencies. |
| Entity Architecture | Required body families are representable without humanoid-only assumptions. |
| Rigging | Humanoid, pig, spider, centipede, bird and dragon test rigs assemble and validate. |
| Animation | Required clips, procedural solvers, events and LOD fallbacks run in Test Laboratory. |
| Customisation | Persistent NPC appearance is deterministic and equipment fit checks pass. |
| Gameplay Contracts | Collision, regions, sensors, sockets and navigation profiles resolve by stable semantic roles. |
| Blueprint Architecture | Required POC blueprints contain semantic layers, nested assets and stable internal IDs. |
| Construction | Watchtower stages and damage/repair transitions preserve save-compatible deltas. |
| Worldgen | Relational placement scenario is deterministic and has fallback diagnostics. |
| Capture | Icons, portraits, codex images and thumbnails regenerate from capture profiles. |
| Runtime | Actors and structures instantiate through registries, not hard-coded paths. |
| Hot Reload | Approved presentation changes refresh safely in development preview. |
| Persistence | Source saves are atomic; migrations and recovery fixtures pass. |
| Multiplayer | Compatibility manifest prevents unsafe presentation-contract mismatch. |
| Performance | Golden content meets provisional packaged-build budgets or has approved exceptions. |
| Validation | No Error or Critical diagnostics remain in approved POC content. |
| CI | Clean-cache bake, deterministic manifests, runtime scenarios and migrations pass. |
| AI Governance | Summer Engine-assisted changes have ledger entries, tests and human review where required. |

# 45. Post-POC Roadmap and Open Decisions

## 45.1 Post-POC Roadmap

1. Expand humanoid race and culture libraries.
2. Add production creature templates and boss authoring tools.
3. Improve deformable voxel skinning only where needed.
4. Add advanced flight, climbing and aquatic solvers.
5. Expand equipment fitting and creature barding.
6. Add blueprint district and settlement composition tools.
7. Add large dungeon and megastructure streaming tools.
8. Build restricted player-facing creator profiles.
9. Design dedicated VFX Forge after socket/event contracts are proven.
10. Design dedicated Audio Forge after animation/event workflows are proven.

## 45.2 Open Decisions

- Exact source payload format for very large voxel body parts.
- Whether common runtime entities prefer PackedScenes or assembly manifests by default.
- The first packaged-build performance budgets for crowds and bosses.
- Which procedural solvers remain cosmetic versus movement-authoritative.
- How much weighted voxel skinning the final art style requires.
- Whether blueprint compact data uses custom binary products after POC profiling.
- How approved content products are committed and distributed across branches.
- The future trust/signing model for external content packs.

# Appendix A. Recommended Godot Class and Resource Map

| Forge Concept | Suggested Godot Form |
| --- | --- |
| Main Forge workspace | `EditorPlugin` with main-screen `Control` root. |
| Source definitions | Custom `Resource` classes. |
| Domain services | `RefCounted` services or explicit project services with narrow interfaces. |
| Entity preview | `Node3D` scene built by preview factory. |
| Runtime entity | Character/physics owner plus presentation child hierarchy appropriate to gameplay implementation. |
| Voxel body meshes | Generated `ArrayMesh`/mesh Resources. |
| Rig | `Skeleton3D` or rigid semantic part hierarchy behind Forge adapter. |
| Attachments | Semantic socket adapter; runtime may use bone/part attachment nodes. |
| Animation | Animation libraries/player/tree resources generated from Forge source. |
| Materials | Shared `ShaderMaterial`/material Resources generated from Material DNA. |
| Collision proxies | Simplified shape Resources and region nodes generated from contracts. |
| Blueprint preview | `Node3D` scene materialised from compact layer data. |
| World structure instance | Runtime structure root plus compact state/delta record. |
| Capture | Controlled `SubViewport`, camera and render target pipeline. |
| Distant repeated visuals | Shared meshes/materials and optional `MultiMesh`-style products. |
| Navigation integration | Runtime adapters to the project navigation system and generated hints. |
| Worker jobs | Worker pool or job service over plain copied data, with main-thread commit. |

# Appendix B. Recommended Folder Structure

```text
addons/leyforge_forge/
    core/
        ids/
        manifests/
        lifecycle/
        commands/
        persistence/
        dependency/
        validation/
        package/
    voxel/
        source/
        modifiers/
        baker/
        materials/
    entity/
        definitions/
        body_graph/
        body_parts/
        customisation/
        equipment/
        contracts/
        runtime/
    rig/
        templates/
        joints/
        sockets/
        retarget/
        solvers/
    animation/
        source/
        libraries/
        events/
        state_graphs/
        runtime/
    blueprint/
        definitions/
        layers/
        modules/
        materials/
        construction/
        states/
        worldgen/
        runtime/
    testlab/
        scenarios/
        runners/
        reports/
        benchmarks/
    ui/
        shell/
        library/
        entity_workspace/
        rig_workspace/
        animation_workspace/
        blueprint_workspace/
        capture/
        review/
```

# Appendix C. Core Entity Resource Schemas

## C.1 Entity Presentation Definition

```text
schema_version: int
entity_presentation_id: StringName
lifecycle_state: enum
body_plan_id: StringName
body_part_bindings: Dictionary[StringName, StringName]
rig_profile_id: StringName
animation_set_id: StringName
material_profile_ids: Array[StringName]
customisation_profile_ids: Array[StringName]
equipment_compatibility_id: StringName
gameplay_contract_id: StringName
representation_profiles: Dictionary
lod_profile_id: StringName
capture_profile_ids: Dictionary
dependency_ids: Array[StringName]
contract_version: int
source_revision: int
```

## C.2 Body Plan Node

```text
node_id: StringName
semantic_role: StringName
parent_node_id: StringName
side_index: int
local_transform: Transform3D
part_source_id: StringName
generator_id: StringName
joint_hint_id: StringName
rig_role_id: StringName
damage_region_hint: StringName
lod_group: StringName
flags: PackedStringArray
```

## C.3 Rig Profile

```text
rig_profile_id: StringName
rig_family_id: StringName
bone_or_part_nodes: Array[RigNodeSource]
joint_constraints: Array[JointConstraintSource]
body_role_map: Dictionary
ik_chains: Array[IKChainSource]
procedural_solver_profiles: Array[StringName]
sockets: Array[SocketSource]
retarget_profile_id: StringName
rig_lod_levels: Array[RigLODSource]
```

## C.4 Resolved Appearance Record

```text
entity_definition_id: StringName
appearance_profile_id: StringName
seed_channels: Dictionary[StringName, int]
resolved_part_variants: Dictionary
resolved_material_variants: Dictionary
explicit_overrides: Dictionary
persistent_history_layers: Array
runtime_overlay_state: Dictionary
```

## C.5 Entity Gameplay Contract

```text
contract_id: StringName
contract_version: int
movement_profile: Resource
collision_regions: Array[RegionSource]
hurt_regions: Array[RegionSource]
weak_points: Array[WeakPointSource]
attack_anchors: Array[AnchorSource]
interaction_anchors: Array[AnchorSource]
sensor_profiles: Array[SensorSource]
navigation_capabilities: PackedStringArray
mount_and_cargo_anchors: Array[AnchorSource]
ui_anchors: Array[AnchorSource]
lod_merge_rules: Array
```

# Appendix D. Core Blueprint Resource Schemas

## D.1 Blueprint Definition

```text
schema_version: int
blueprint_id: StringName
lifecycle_state: enum
category: StringName
bounds: AABB
origin_transform: Transform3D
anchors: Array[BlueprintAnchorSource]
block_placements: PackedArray
asset_placements: Array[AssetPlacementSource]
module_instances: Array[ModuleInstanceSource]
material_role_set_id: StringName
semantic_layers: Dictionary[StringName, Resource]
construction_profile_id: StringName
upgrade_profile_ids: Array[StringName]
world_state_profile_ids: Array[StringName]
terrain_profile_id: StringName
placement_profile_id: StringName
capture_profile_id: StringName
dependency_ids: Array[StringName]
contract_version: int
source_revision: int
```

## D.2 Blueprint Element

```text
element_id: StringName
element_type: enum
local_transform: Transform3D
content_id_or_role: StringName
layer_id: StringName
state_mask: int
construction_stage_mask: int
parameters: Dictionary
```

## D.3 Construction Stage Delta

```text
stage_id: StringName
parent_stage_id: StringName
resource_project_recipe_id: StringName
add_or_activate_elements: Array[StringName]
remove_or_deactivate_elements: Array[StringName]
material_role_overrides: Dictionary
marker_availability_changes: Dictionary
network_changes: Array
collision_navigation_changes: Array
```

## D.4 Placement Profile

```text
placement_profile_id: StringName
allowed_biome_tags: PackedStringArray
forbidden_tags: PackedStringArray
slope_range: Vector2
height_range: Vector2
water_rules: Dictionary
relational_anchor_rules: Array
orientation_rules: Dictionary
clearance_volume: AABB
terrain_adaptation_mode: enum
seed_channels: PackedStringArray
retry_policy: Resource
fallback_policy: Resource
```

# Appendix E. Shared Semantic Role and Marker Catalogue

| Role Family | Examples | Primary Consumer |
| --- | --- | --- |
| Body anatomy | `body.head`, `limb.leg.front.left`, `wing.primary.left` | Rig and entity assembly. |
| Equipment sockets | `socket.hand.primary.0`, `socket.back`, `socket.saddle` | Equipment presentation. |
| Combat regions | `region.head`, `region.wing.left`, `weakpoint.core` | Combat integration. |
| Sensors | `sensor.vision.origin`, `sensor.hearing.origin` | AI/perception adapters. |
| Interaction | `interaction.talk`, `interaction.harvest`, `interaction.mount` | Interaction systems. |
| Structure entrance | `structure.entrance.primary`, `structure.exit.emergency` | Navigation/worldgen. |
| Household | `household.bed`, `household.storage`, `household.social` | NPC village simulation. |
| Job | `job.blacksmith.anvil`, `job.guard.post`, `job.builder.staging` | NPC job systems. |
| Storage | `storage.input`, `storage.output`, `warehouse.access` | Inventory/automation. |
| Networks | `network.item.input`, `network.power.mechanical`, `network.mana` | Automation/magic. |
| Worldgen | `worldgen.road.connector`, `worldgen.river.crossing`, `worldgen.village.anchor` | World generation. |
| Capture | `capture.focus.head`, `capture.focus.structure` | Icon Capture Studio. |

# Appendix F. Validation Code Catalogue

| Code | Severity | Meaning |
| --- | --- | --- |
| `EFB-ID-001` | Error | Duplicate or invalid stable ID. |
| `EFB-SCHEMA-001` | Error | Unsupported source schema version. |
| `EFB-DEP-001` | Error | Required dependency missing. |
| `EFB-BODY-001` | Error | Body-plan graph contains cycle or invalid parent. |
| `EFB-BODY-010` | Warning | Adjacent parts use incompatible density profiles. |
| `EFB-SEG-001` | Error | Repeated-segment override targets no generated segment. |
| `EFB-RIG-001` | Error | Required semantic rig role missing. |
| `EFB-RIG-010` | Warning | Joint limit or rest pose creates likely self-intersection. |
| `EFB-ANIM-001` | Error | Animation track targets missing role. |
| `EFB-ANIM-010` | Warning | Required capability has no clip or fallback. |
| `EFB-GAIT-001` | Error | Procedural solver profile is incompatible with rig roles. |
| `EFB-EQUIP-001` | Error | Required socket or fit profile missing. |
| `EFB-CONTRACT-001` | Error | Gameplay contract cannot resolve required region or anchor. |
| `EFB-CONTRACT-010` | Critical | Spatial/gameplay contract changed without compatibility classification. |
| `EFB-BP-001` | Error | Blueprint internal element ID duplicated. |
| `EFB-BP-010` | Error | Nested blueprint dependency cycle. |
| `EFB-BP-MARKER-001` | Error | Required semantic marker invalid or unreachable. |
| `EFB-BP-NET-001` | Error | Required network connection incomplete. |
| `EFB-BP-STAGE-001` | Error | Construction stage references missing element. |
| `EFB-BP-WORLD-001` | Error | Placement profile has no valid fallback for required structure. |
| `EFB-CAP-001` | Warning | Live-linked capture is stale. |
| `EFB-PERF-001` | Warning | Approved profile budget exceeded. |
| `EFB-BAKE-001` | Error | Entity or blueprint bake failed. |
| `EFB-BAKE-010` | Critical | Generated product failed read-back/hash verification. |
| `EFB-SAVE-001` | Critical | Atomic source save could not preserve prior valid revision. |
| `EFB-COMPAT-001` | Error | Runtime content contract incompatible. |

# Appendix G. Golden Content and Scenario Matrix

| Content | Key Source Proof | Runtime/Test Proof |
| --- | --- | --- |
| Standard Humanoid | Body graph, modular parts, rig, basic customisation. | Door/workstation, equipment and animation tests. |
| Four-Armed Humanoid | Optional arm-pair extension and sockets. | Retarget/attachment and collision checks. |
| Pig | Quadruped template and material variants. | Walk/trot, slope, flee and icon capture. |
| Spider | Eight legs and climb profile. | Procedural gait, wall test and attack anchor. |
| Giant Centipede | Repeated segments and leg pairs. | Turn, wave gait, LOD reduction and region grouping. |
| Bird | Avian rig and wing profile. | Take-off, flight, perch and landing. |
| Dragon Test Rig | Neck/tail chains, wings, breath socket and regions. | Ground/flight, phase state and boss-card capture. |
| Humanoid Equipment Set | Fit, coverage and grip profiles. | Random combination and clipping matrix. |
| Cottage | Blocks, door, bed and household markers. | NPC access and material-role preview. |
| Warehouse | Storage, access and automation markers. | Delivery path and network validation. |
| Watchtower | Construction stages, guard posts and damage states. | Project progression and raid-readiness validation. |
| Bridge | Terrain anchors and crossing profile. | River placement and navigation. |
| Goblin Camp | Spawn, storage, patrol and raid-source markers. | Enemy camp scenario. |
| Rune Ruin | Mana roles, puzzle/interaction anchors and damaged state. | Worldgen relation and magical-state preview. |

# Appendix H. Architecture Decision Record Template

```text
ADR ID: ADR-EFB-###
Title:
Status: Proposed / Accepted / Superseded / Rejected
Date:
Owner:

Context
- What entity, blueprint or shared-Forge problem requires a decision?

Decision
- What exact direction is selected?
- Which source schemas, contracts and runtime products are affected?

Alternatives Considered
- Option A
- Option B
- Option C

Consequences
- Benefits
- Costs
- Risks
- Migration and rollback requirements

Validation
- Golden content
- Benchmarks
- Scenario tests
- Acceptance criteria

Related Records
- Documents
- Issues/PRs
- Schemas
- Previous ADRs
```

# Glossary

| Term | Meaning |
| --- | --- |
| Body-Plan Graph | Canonical semantic graph describing an entity's anatomical structure. |
| Semantic Rig | Rig whose bones/parts are identified by stable roles rather than only local names. |
| Rigid-Part Binding | Voxel body part attached rigidly to a bone or animated transform. |
| Retarget Map | Versioned mapping from one compatible semantic rig to another. |
| Procedural Solver | Runtime or preview system that adjusts authored motion using terrain or movement context. |
| Entity Contract | Versioned spatial and semantic interface between presentation and gameplay systems. |
| Blueprint Element ID | Stable internal identity for a placement or marker within a blueprint. |
| Semantic Layer | Typed blueprint collection such as navigation, NPC, storage, automation or construction data. |
| Construction Delta | Changes that transform one blueprint stage/state into another. |
| Relational Anchor | Named point used to place a structure relative to roads, rivers, villages or other world features. |
| Assembly Manifest | Compact generated record used to build a variable entity or structure at runtime. |
| Capture Profile | Deterministic camera, lighting, state and framing definition for icons or thumbnails. |
| Contract Migration | Explicit mapping or compatibility rule required when spatial/gameplay semantics change. |
| Golden Content | Stable representative entity or blueprint used for regression and determinism tests. |
