# Fantasy Voxel Civilisation Sandbox
## 21F - Voxel Asset Forge - Technical Implementation Plan
**Version 0.1 - Detailed Design Bible and Engineering Foundation Draft**

A staged Godot-native engineering plan for implementing the Leyforge Voxel Asset Forge, covering editor and developer-workspace architecture, source Resources, voxel storage, texture and material authoring, compound assets, animation, state bindings, deterministic baking, registry integration, overrides, hot reload, performance, validation, testing, migrations and Summer Engine-assisted development controls.

## Forge Technical Implementation Plan Statement

| Field | Locked Direction |
| --- | --- |
| Document Scope | Defines the complete technical architecture, data contracts, Godot systems, file layout, bake pipeline, runtime integration, performance controls, tests, migrations and staged implementation required to build the Voxel Asset Forge described by Documents 21A through 21E. |
| Engine Direction | Implement as a normal Godot 4.x project using a milestone-locked stable engine release. Use GDScript by default; use C++ GDExtension/godot-cpp only after profiling proves a specific bottleneck cannot be solved acceptably in GDScript or shaders. |
| Summer Engine Direction | Summer Engine is the AI-native development environment and orchestration layer, not a shipped runtime dependency. All source, Resources, scenes, tests and generated products must remain understandable and buildable as a normal Godot project. |
| Tool Direction | Use a reusable Forge core with two controlled hosts: a Godot EditorPlugin main-screen workspace for production authoring and an optional in-game developer-section host for integrated previews and development builds. |
| Data Direction | Store stable asset identity and authoring metadata in custom Godot Resources. Keep large voxel payloads compact and versioned. Separate editable source from deterministic baked runtime products. |
| Runtime Direction | Shipped gameplay resolves approved presentation packages by stable IDs. Runtime presentation consumes authoritative gameplay state but does not own or invent machine, item, block, magic or village logic. |
| Bake Direction | Use deterministic, dependency-aware jobs to convert face pixels, voxel volumes, parts, materials, clips and sockets into optimised meshes, textures, materials, collisions, icons, PackedScenes and manifests. |
| Geometry Direction | Remove hidden faces, merge compatible faces, index vertices, combine static parts and generate simplified collision. Standard terrain blocks remain in the existing chunk-rendering path; unique shapes and machines receive baked presentation assets. |
| Animation Direction | Bake rigid motion to named-part transform clips, surface behaviour to shared shader parameter tracks, shape-changing effects to bounded voxel-frame products and effects to named sockets. |
| Override Direction | Resolve base presentation, project overrides, content-pack overrides and permitted world overrides through stable field-level provenance. A visual change must not silently alter gameplay identity or save state. |
| Safety Direction | All edits use transactions, undo/redo, autosave snapshots, atomic writes, validation, dependency checks, reversible approval and clear fallback. Generated files are never the only copy of source data. |
| Performance Direction | Authoring can be rich, but runtime products must be bounded. Baking is incremental and cancellable; heavy CPU work uses worker jobs over plain data; scene-tree and Resource commits occur on the main thread. |
| Version-Control Direction | Commit canonical Forge source and approved deterministic runtime products. Exclude transient caches, temporary files and Godot import cache. CI rebakes representative assets and compares manifests or hashes. |
| Multiplayer Direction | Presentation content is deterministic and included in content compatibility checks. Gameplay authority remains outside the Forge; clients cannot use a local visual asset to change collision, ports, reach or simulation truth. |
| MVP Direction | Build the smallest complete pipeline that can paint a 32 x 32 block, model and connect a wooden chute, assemble and animate a basic furnace, override an existing presentation, bake and validate it, hot-reload it in a controlled preview and place it through the Blueprint Designer. |

## Document Purpose

This document converts the Voxel Asset Forge design into an implementable engineering plan. Document 21A defines the Forge's purpose and boundaries. Document 21B defines block surfaces, voxel models, compound parts, palettes, materials, collision, pivots and sockets. Document 21C defines transform animation, material animation, voxel-frame animation, effects, audio and state-driven presentation. Document 21D defines stable IDs, non-destructive overrides, variants, content packs, migration and registry contracts. Document 21E defines the developer-facing workspace and end-to-end creator workflow. Document 21F specifies how those promises are built safely in Godot.

The central engineering problem is not simply drawing voxels. The Forge must maintain a strict separation between editable authoring data, approved presentation definitions, generated runtime products and gameplay definitions. It must be possible to redesign a furnace's shape, textures, flames and gear animation while preserving its block ID, recipe processing, inventory, automation ports and save state. It must also be possible to recover the previous presentation, determine which layer supplied every field and detect when a visual override has violated a gameplay-facing contract.

The system therefore uses a source-to-product pipeline. Creators edit compact Forge source Resources and image data. A deterministic bake service validates dependencies and produces meshes, materials, collisions, icons, clips, scenes and manifests. Registries resolve those products through stable IDs rather than file paths. Runtime presentation adapters receive authoritative states from block, item, machine, automation and magic systems and apply the corresponding visual layers. The editor and in-game developer workspace share the same core services so their results do not diverge.

The implementation must remain proportionate to the proof-of-concept. The first milestone does not need a public mod marketplace, arbitrary custom file formats, distributed build farm or full creature creator. It does need clean data contracts, reliable undo, deterministic output, safe overrides and enough performance instrumentation that the team can discover whether GDScript remains sufficient before committing to native extensions.

## Engine and Source-of-Truth Note

> **Current Project Direction**  
> Leyforge is being built in Godot with Summer Engine. The current Godot/Summer revision of Document 18 is the project-wide technical source of truth. Any older Unreal Engine copy is historical only. The Forge must follow the Godot-first rules: GDScript as the default implementation language, GDExtension only for measured bottlenecks, normal Godot project portability, stable registries, deterministic generation, bounded asynchronous work, save-safe migrations and explicit AI review gates.

## Design and Technical Sources

| Source | Relevant Direction | How 21F Uses It |
| --- | --- | --- |
| 00 - Master Game Design Bible | The game uses stylised, readable, atmospheric fantasy voxel visuals rather than realism. | Prioritises pixel integrity, shared material language, readable silhouettes and performance-aware presentation. |
| 03 - Blocks Registry | Blocks use stable definitions, many shapes, states, material families and connected systems. | Requires block contracts, generated shape support, placement data and registry-safe presentation resolution. |
| 04 - Items Registry | Items and block item forms remain linked but distinct and can have held, dropped and inventory presentations. | Requires multiple representation packages without duplicating gameplay identity. |
| 08 - Automation System | Machines, chutes, ports, direction, power and blockage must be physically readable. | Requires compound scenes, sockets, state adapters, connection previews and contract validation. |
| 09 - Magic System | Mana, runes, wards, conduits, charge, corruption and magical risk require visible presentation. | Requires shared shader profiles, effects, light sockets, state layering and accessible alternatives. |
| 12 - Structures | Blueprints reference stable block families and must survive visual replacement. | Requires Blueprint Designer integration, footprint compatibility and dependency-aware refresh. |
| 17 - UI/UX System | Interfaces should be polished, inspectable, accessible and trustworthy. | Requires actionable diagnostics, predictable editor behaviour and no hidden state-changing operations. |
| 18 - Technical Implementation Plan, current Godot/Summer revision | Godot-first modular architecture, stable IDs, Resources, EditorPlugins, bounded asynchronous work, deterministic output, testing and AI governance. | Supplies the project-wide engineering constraints and review discipline used here. |
| 21A - Forge Core System | Developer-first visual authoring with future controlled modding potential. | Defines system boundaries and minimum complete pipeline. |
| 21B - Modelling, Texturing and Materials | Face painting, voxel volumes, compound parts, material DNA, collision, pivots and sockets. | Defines source data and bake requirements. |
| 21C - Animation, Effects and Visual States | Multiple animation methods and authoritative state bindings. | Defines clip, effect, audio and presentation-controller requirements. |
| 21D - Overrides, Variants and Registry Integration | Stable IDs, field-level overrides, deterministic variants, packs, provenance and migration. | Defines resolver, manifest and compatibility architecture. |
| 21E - Forge UI/UX and Creator Workflow | Main workspace, browser, editors, timelines, validation, recovery and approval. | Defines host screens, commands and workflow service contracts. |
| Godot stable documentation | EditorPlugin, custom Resources, import/saver extension points, procedural geometry, worker jobs and editor undo integration. | Confirms the engine extension points selected by this plan; exact API calls remain milestone-version locked. |

## Static Table of Contents

- 1. Locked Technical Implementation Identity
- 2. Player Decision and Direction Summary
- 3. Technical Goals, Principles and Non-Goals
- 4. Architecture Overview and Layer Boundaries
- 5. Godot and Summer Engine Development Model
- 6. Project, Add-on and Folder Structure
- 7. Core Services, Ownership and Communication
- 8. Forge Source Data Model
- 9. Stable IDs, Contracts and Registry Links
- 10. File Formats, Serialisation and Atomic Persistence
- 11. Voxel Volume Storage and Editing Data
- 12. Surface Texture, Palette and Material Source Data
- 13. Compound Parts, Pivots, Sockets, Collision and Footprints
- 14. Animation, Effects, Audio and State-Binding Data
- 15. EditorPlugin and Developer-Section Hosts
- 16. Commands, Transactions, Undo/Redo, Autosave and Recovery
- 17. Asset Index, Search, Dependencies and Provenance
- 18. Bake Pipeline and Job Orchestration
- 19. Mesh Generation and Geometry Optimisation
- 20. Texture, Material, Atlas and Shader Pipeline
- 21. Collision, Bounds, Selection and Occlusion Products
- 22. Animation, Effect and Audio Runtime Products
- 23. Icon, Thumbnail and Preview Generation
- 24. Runtime Presentation Packages and State Adapters
- 25. Override, Variant and Content-Pack Resolution
- 26. Hot Reload, Cache Invalidation and Live Refresh
- 27. Cross-System Integration
- 28. Concurrency, Thread Safety and Memory Management
- 29. Performance Budgets, Scalability and LOD
- 30. Validation, Diagnostics and Recovery
- 31. Testing, Golden Assets and Continuous Integration
- 32. Schema Versioning, Migration and Compatibility
- 33. Permissions, Security and Future Mod Boundaries
- 34. Multiplayer, Export and Deterministic Content Compatibility
- 35. Summer Engine AI-Assisted Development Controls
- 36. Proof-of-Concept Scope and Explicit Deferrals
- 37. Staged Implementation Plan
- 38. Technical Spikes, Risk Register and Redesign Triggers
- 39. Definition of Done and Acceptance Matrix
- 40. Post-MVP Roadmap and Open Decisions
- Appendix A. Recommended Godot Class and Resource Map
- Appendix B. Recommended Folder Structure
- Appendix C. Core Resource Schemas
- Appendix D. Bake Manifest, Cache Key and Dependency Record
- Appendix E. Validation Code Catalogue
- Appendix F. Test Asset and Scenario Matrix
- Appendix G. Architecture Decision Record Template
- Glossary

# 1. Locked Technical Implementation Identity

The Forge is a deterministic visual-content compiler with an integrated authoring interface. It is not only a modelling screen. Its technical identity is the complete chain from editable source to approved runtime presentation, with stable registry links and safe fallback.

## 1.1 Core Engineering Promise

> **Engineering Promise**  
> A creator can change the model, texture, material, animation and effects of a registered block or item, bake the result and see it in the game without altering gameplay identity, corrupting saves or requiring manual file-path rewiring.

The promise depends on five separations:

1. Gameplay definitions are not Forge source.
2. Forge source is not baked runtime output.
3. Baked output paths are not stable identity.
4. Runtime presentation state is not gameplay authority.
5. An override is not destructive replacement of its fallback.

## 1.2 Technical Pillars

| Pillar | Engineering Meaning | Required Result |
| --- | --- | --- |
| Data-Driven | Source, contracts, variants and bindings are custom Resources or versioned data records. | New assets do not require one-off hard-coded classes. |
| Deterministic | The same approved source and tool version produce equivalent manifests and runtime content. | CI can detect accidental drift and multiplayer can compare content. |
| Incremental | Only changed assets and affected dependants rebake. | Iteration remains fast as the library grows. |
| Non-Destructive | Base content remains available and overrides record only changed fields. | Revert and fallback are reliable. |
| Contract-Aware | Collision, ports, pivots, sockets, state names and footprints are validated against gameplay-facing contracts. | Visual freedom does not silently break interaction. |
| Performance-Bounded | Runtime products are merged, cached and assigned explicit budgets. | Editor voxel richness does not become runtime node explosion. |
| Recoverable | Edits are transactional, autosaved and backed by source history. | Crashes and failed bakes do not destroy work. |
| Tool-Portable | Summer Engine accelerates work but the project remains a normal Godot repository. | No hidden runtime or build dependency on the AI environment. |

## 1.3 What the Technical System Is Not

- It is not a replacement for the block, item, recipe, automation, magic or structure registries.
- It is not a runtime microvoxel engine that spawns one node per editor cell.
- It is not permission to mutate scene-tree objects from arbitrary worker threads.
- It is not a collection of hand-edited generated meshes with no source.
- It is not a public scripting platform in the first implementation.
- It is not a guarantee that every future authoring feature belongs in GDScript forever; native work is permitted after evidence and an Architecture Decision Record.
- It is not a reason to couple shipped gameplay to Godot editor-only classes.
- It is not the NPC, humanoid or creature authoring system.

# 2. Player Decision and Direction Summary

| Area | Locked Decision |
| --- | --- |
| Access | The full creator is available through the developer section and is also implemented as a Godot-native production tool. |
| Unique Shapes | Voxel Model Mode supports uniquely shaped blocks such as chutes, pipes, stations and machine housings. |
| Machines | Compound assets contain named parts, pivots, sockets and independently animated components. |
| Animation | Use transform animation for rigid parts, material/shader animation for glow and flow, voxel frames for true shape change and sockets for particles, lights and audio. |
| Manual Override | Developers may open an existing registered asset and override its model, textures, materials, clips and presentation bindings while preserving gameplay identity. |
| Source Ownership | Forge source is canonical; baked output is reproducible product data. |
| Editor Host | Use a main-screen EditorPlugin as the primary production host. Reuse the same workspace scenes and services in the in-game developer section where practical. |
| Language | GDScript first. Native GDExtension only after profiling, benchmarks and approval. |
| Storage | Custom Resources for metadata and compact payloads; large voxel data uses packed arrays and may later move to a custom binary format if evidence justifies it. |
| Runtime | Approved assets resolve by stable presentation ID through registry services; file paths remain implementation details. |
| Bake | Incremental, deterministic, cancellable and dependency-aware. |
| Safety | Undo/redo, autosave, atomic writes, validation and fallback are MVP requirements. |
| POC Assets | Standard block, wooden chute, basic furnace, iron pickaxe and mana conduit/ward asset provide representative coverage. |

# 3. Technical Goals, Principles and Non-Goals

## 3.1 Primary Goals

- Give the developer one safe pipeline for standard block surfaces, unique voxel shapes, compound machines and item presentations.
- Allow approved visuals to be replaced without touching gameplay code or stable save identity.
- Produce runtime assets efficient enough for a large voxel world and many repeated structures.
- Keep source reviewable, versioned and recoverable.
- Make every failure visible with enough context to fix it.
- Keep engine and AI-environment coupling low.
- Establish reusable foundations for a later creature and NPC Forge without prematurely implementing those systems.

## 3.2 Engineering Principles

### Evidence Before Native Optimisation

Prototype and profile the full pipeline in GDScript. Move only isolated kernels such as dense voxel meshing, compression or atlas packing to GDExtension when measured project-scale benchmarks justify the maintenance cost.

### Plain Data Across Worker Boundaries

Worker jobs receive immutable snapshots or owned packed arrays. They do not mutate live Nodes, editor selection, shared Resources or gameplay state. Main-thread commit stages create or replace Godot Resources and scene objects.

### Generated Products Are Disposable

A generated mesh or icon may be deleted and rebuilt from source. If deleting generated data loses the only copy of an authored choice, the architecture is wrong.

### Stable IDs Over Paths

Registries and saves refer to `block.*`, `item.*`, `presentation.*`, `material.*`, `clip.*`, `contract.*` and `pack.*` IDs. Paths can change through project reorganisation without changing identity.

### Explicit Compatibility

An asset that changes collision, footprint, port count or required socket names is not automatically a cosmetic change. The Forge must classify and validate the impact before approval.

## 3.3 Explicit Non-Goals for Version 0.1

- Full external DCC round-tripping.
- Arbitrary procedural scripts authored by users.
- Networked collaborative editing.
- Marketplace packaging, billing or entitlement.
- Full skeletal character tools.
- Real-time destructive remeshing of every placed runtime asset.
- Automatic optimisation of every possible artistic edge case.
- Supporting every final platform before the Windows-first POC is proven.

# 4. Architecture Overview and Layer Boundaries

## 4.1 High-Level Architecture

```text
Forge Hosts
    Godot EditorPlugin main screen
    optional in-game developer workspace
        |
        v
Forge Application Layer
    commands, selection, documents, undo, autosave, validation, preview
        |
        v
Forge Domain Layer
    asset definitions, voxel volumes, palettes, parts, clips, contracts, overrides
        |
        +--------------------------+
        |                          |
        v                          v
Bake Pipeline                Registry/Resolver
    mesh/material/icon           stable IDs, variants,
    collision/scene              overrides, provenance
        |                          |
        +------------+-------------+
                     v
              Runtime Products
        presentation package / PackedScene
                     |
                     v
              Runtime Adapters
    block, item, machine, magic and structure presentation
```

## 4.2 Layer Rules

| Layer | May Know About | Must Not Own |
| --- | --- | --- |
| Host UI | Commands, view models, selection, previews. | Asset truth, bake algorithms, gameplay state. |
| Application | Open documents, transactions, jobs, approval workflow. | Rendering implementation details or gameplay simulation. |
| Domain | Stable source records and validation rules. | Editor widgets, scene-tree lifecycle or network authority. |
| Bake | Immutable source snapshots and tool settings. | Canonical source or registry identity changes. |
| Resolver | Manifests, overrides, variants, contracts and packages. | UI state or authored voxel edits. |
| Runtime Adapter | Approved package and authoritative presentation inputs. | Recipe logic, item transfer, mana consumption or combat calculations. |

## 4.3 Assembly Boundaries

The project should be organised so editor-only code can be excluded from release exports. Shared data and services must not import editor APIs. A recommended split is:

- `ForgeDomain`: Resources, IDs, validation interfaces and pure data operations.
- `ForgeBake`: deterministic product generation and manifests.
- `ForgeRuntime`: package resolution and state-driven presentation.
- `ForgeEditor`: EditorPlugin, inspectors, gizmos, timelines and asset browser.
- `ForgeDevRuntime`: optional in-game developer workspace behind development feature flags.
- `ForgeTests`: headless and scene-based tests.

# 5. Godot and Summer Engine Development Model

## 5.1 Godot Version Policy

Use a stable Godot 4.x release locked for each milestone. The engine version, rendering backend, project feature flags and required add-on versions must be recorded in a project lock record. Engine upgrades occur through a dedicated branch with a migration checklist and representative Forge rebake.

## 5.2 GDScript-First Policy

GDScript is the default for:

- EditorPlugin and workspace UI.
- Resource definitions and validation.
- Commands and undo records.
- Registry lookup and override resolution.
- Bake orchestration.
- Initial mesh and texture generation prototypes.
- Runtime state adapters.
- Tests and diagnostic tooling.

A GDExtension candidate must have:

1. A reproducible benchmark.
2. A project-scale failure against an approved budget.
3. A narrow API boundary.
4. Deterministic parity tests against the GDScript reference.
5. A maintenance owner and supported platform plan.
6. An approved Architecture Decision Record.

## 5.3 Summer Engine Boundary

Summer Engine may:

- Draft code and Resources.
- Generate tests and migration scripts.
- Run approved build, validation and profiling tasks.
- Update documentation and change ledgers.
- Propose refactors through reviewable diffs.

Summer Engine must not become:

- A runtime requirement in exported builds.
- The only place build instructions or schemas exist.
- An unreviewed authority that modifies stable IDs, migrations or approved assets.
- A substitute for source control, tests or human approval.

## 5.4 Development Feature Flags

Recommended project features:

```text
feature_forge_editor
feature_forge_dev_runtime
feature_forge_diagnostics
feature_forge_visual_tests
feature_content_pack_tools
```

Production exports omit editor and dev-runtime features unless a controlled internal build is being produced.

# 6. Project, Add-on and Folder Structure

## 6.1 Add-on Structure

The production authoring host should live as a project add-on rather than a fork of the Godot editor:

```text
res://addons/leyforge_forge/
    plugin.cfg
    forge_plugin.gd
    editor/
    domain/
    bake/
    runtime_shared/
    ui/
    icons/
    gizmos/
    inspectors/
    tests/
```

The add-on may depend on shared project registries, but circular dependencies are prohibited. Shared contracts should move into a lower-level project module rather than importing gameplay scenes into the editor plug-in.

## 6.2 Content Structure

```text
res://content/forge/
    assets/
    materials/
    palettes/
    animations/
    state_bindings/
    contracts/
    variants/
    overrides/
    packs/
    migrations/

res://generated/forge/
    meshes/
    textures/
    materials/
    collisions/
    scenes/
    icons/
    manifests/

res://cache/forge/
    previews/
    intermediate/
    job_state/
```

`res://cache/forge/` is transient and excluded from source control. `res://generated/forge/` contains approved deterministic products and is committed according to the repository policy. Temporary writes use a separate temporary location and are never mistaken for approved products.

## 6.3 Folder Ownership

| Folder | Canonical? | Hand Edited? | Shipped? |
| --- | --- | --- | --- |
| `content/forge/assets` | Yes | Through Forge or reviewed text edit | Source may be excluded from retail export if not required. |
| `content/forge/contracts` | Yes | Reviewed technical edit | Required metadata may ship. |
| `generated/forge` | Reproducible product | No | Yes, approved subset. |
| `cache/forge` | No | No | No. |
| `.godot/imported` | No | No | No. |

# 7. Core Services, Ownership and Communication

## 7.1 Recommended Services

| Service | Responsibility |
| --- | --- |
| `ForgeDocumentService` | Opens, tracks, saves and closes editable asset documents. |
| `ForgeCommandService` | Executes reversible domain commands and groups transactions. |
| `ForgeAutosaveService` | Writes draft snapshots and recovery metadata. |
| `ForgeAssetIndex` | Indexes IDs, names, tags, paths, status and dependencies. |
| `ForgeDependencyGraph` | Tracks source and product dependency edges. |
| `ForgeValidationService` | Runs schema, contract, art-budget and integration checks. |
| `ForgeBakeService` | Plans and schedules deterministic bake jobs. |
| `ForgeCacheService` | Resolves cache keys, products and invalidation. |
| `ForgePreviewService` | Builds controlled preview scenes and render contexts. |
| `ForgeRegistryBridge` | Reads and writes approved presentation registry records. |
| `ForgeOverrideResolver` | Resolves layers, variants and provenance. |
| `ForgeMigrationService` | Applies schema and ID migrations. |
| `ForgeAuditService` | Records approval, tool version, hashes and changes. |

## 7.2 Communication Rules

Use typed signals or small event records between services. Avoid global signal buses with unbounded string messages. Events should describe completed facts:

```text
forge.asset_opened
forge.source_changed
forge.validation_completed
forge.bake_started
forge.bake_completed
forge.package_approved
forge.override_resolved
forge.preview_refreshed
```

Commands describe requested changes and return structured results. UI calls commands; it does not write Resources directly.

## 7.3 Service Lifetime

- Editor host services are created by the EditorPlugin and released on plug-in disable.
- Runtime resolver services live in normal project autoloads or explicit composition roots, not editor singletons.
- Test services can be instantiated without loading the complete game.
- Static global state is kept to a minimum so tests and reloads remain predictable.

# 8. Forge Source Data Model

## 8.1 Root Resource

The canonical root is `ForgeAssetDefinition`, a custom `Resource` with stable identity and references to authored components.

```text
ForgeAssetDefinition
    schema_version
    forge_asset_id
    presentation_id
    display_name_key
    asset_kind
    source_status
    source_pack_id
    gameplay_links
    presentation_contract_id
    authoring_profile
    surface_sets
    voxel_volumes
    parts
    palettes
    material_bindings
    animation_set_id
    state_binding_id
    collision_profile
    footprint_profile
    representation_profiles
    variant_set_ids
    dependency_ids
    planning_tags
```

The root stores references rather than embedding every large payload. This keeps diff scope manageable and enables shared palettes, materials and clips.

## 8.2 Asset Kinds

```text
standard_block_surface
generated_shape_family
unique_voxel_block
item_model
compound_station
compound_machine
automation_component
magic_infrastructure
prop_or_furniture
decorative_asset
```

Asset kind controls validation presets and editor panels, not separate unrelated file systems.

## 8.3 Resource Immutability During Bake

The bake service receives a deep snapshot or serialised source record. The creator may continue editing a draft while a prior revision bakes, but the bake manifest records the exact source hash. A completed product is accepted only if it still corresponds to the current requested revision or is clearly labelled as an older result.

# 9. Stable IDs, Contracts and Registry Links

## 9.1 ID Namespaces

Use the stable namespaces already defined by 21D:

```text
block.logistics.wooden_chute
item.tool.iron_pickaxe
presentation.machine.basic_furnace.default
forge_asset.machine.basic_furnace
material.metal.iron
palette.machine.basic_furnace
clip.machine.furnace.processing
statebinding.machine.furnace.basic
contract.machine.furnace.basic_v2
variantset.machine.furnace.condition
pack.leyforge.project_visuals
```

The `forge_asset.*` ID identifies editable source. `presentation.*` identifies the resolved presentation record. Gameplay saves continue to store gameplay IDs and required variant tokens, not generated file paths.

## 9.2 Presentation Contracts

A contract describes gameplay-facing visual requirements:

```text
contract.machine.furnace.basic_v2
    required_parts: body, door
    required_sockets: input, output, flame, smoke, audio_work
    required_states: inactive, powered_idle, processing, blocked, damaged
    footprint: 1 x 1 x 1
    allowed_collision_profiles: machine_solid_v1
    automation_ports: input west, output east
    compatibility_version: 2
```

The Forge may change the look of a required part or socket but cannot silently remove it. Contract changes are versioned technical work, not normal art edits.

## 9.3 Registry Bridge

The registry bridge provides read-only access to gameplay definitions during normal visual editing and writes only approved presentation records. Any action that would change gameplay data opens the appropriate registry tool or creates an explicit cross-system change request.

## 9.4 Path Independence

A registry record stores stable IDs and Resource UIDs where useful, but path changes are resolved by the project index. No save, blueprint or recipe should depend on `res://generated/forge/scenes/furnace_v3.tscn` as identity.

# 10. File Formats, Serialisation and Atomic Persistence

## 10.1 MVP Format Strategy

Use built-in Godot Resources first:

- `.tres` for human-reviewable metadata, contracts, manifests, palettes and smaller definitions.
- `.res` or external `PackedByteArray` Resources for larger compact voxel payloads when text size becomes impractical.
- `.png` for authored 32 x 32 source surfaces and generated icons/textures.
- `.tscn` only for hand-readable preview templates; generated runtime scenes may be `.scn` or `.tscn` based on determinism and diff needs.

A custom `.vfvox` format is deferred until profiling shows that Resource size, load time or version-control behaviour warrants the extra loader, saver and migration burden.

## 10.2 Serialisation Requirements

Every canonical record contains:

- Schema version.
- Stable ID.
- Source revision or content hash.
- Tool/baker version.
- Dependency IDs.
- Optional author/review metadata.
- Explicit defaults where migration ambiguity would be dangerous.

## 10.3 Atomic Save Sequence

```text
validate draft serialisation
    -> write temporary file
    -> flush and close
    -> verify read-back and checksum
    -> move current file to recovery snapshot when required
    -> atomically replace target where supported
    -> update index
    -> record change event
```

A failed write leaves the prior valid source intact. Autosave snapshots use separate names and never overwrite an approved source directly.

## 10.4 Text Normalisation

For text Resources and manifests:

- Stable key ordering where the format allows control.
- Consistent line endings.
- No volatile timestamps inside content hashes.
- No random generated IDs during each save.
- Float values normalised to an agreed precision where exact authoring precision is unnecessary.
- Arrays sorted only when their semantic order is not meaningful.

# 11. Voxel Volume Storage and Editing Data

## 11.1 Cell Representation

A voxel cell should store compact indices and flags rather than a full object:

```text
material_index: unsigned compact integer
occupancy: empty / solid / cutout / emissive-special
flags: authored, locked, damage-layer, helper-only
optional metadata_index
```

Common assets should fit within a palette of 16 or 32 material entries. Wider indices are allowed only when validated by an asset profile.

## 11.2 Volume Representation

Use profile-dependent storage:

| Profile | Recommended Storage | Use |
| --- | --- | --- |
| Small sparse item | Sparse occupied-cell list plus bounds. | Tools, runes, small props. |
| Dense 16-32 cube | Flat packed array in Z-major or agreed canonical order. | Standard unique blocks. |
| Tall/long item | Flat packed array with custom bounds. | Swords, poles, pipes. |
| Large machine | Multiple bounded part volumes. | Compound machines. |
| Very large experimental volume | Chunked pages with dirty-region tracking. | Deferred or exceptional assets. |

The canonical iteration order must be fixed so content hashes and bakes are reproducible.

## 11.3 Dirty Regions

Editing commands mark affected bounding boxes and related boundaries. The viewport may rebuild only dirty slices or local preview meshes. Approval bake still produces a clean whole-asset product to avoid accumulating incremental artefacts.

## 11.4 Compression

MVP compression options:

- Palette indices packed into bytes where possible.
- Run-length encoding for long empty or repeated spans.
- Optional general-purpose compression for saved binary payloads.
- Deduplicated repeated part volumes through shared references.

Compression must never make ordinary editing dependent on fully decoding the entire project library.

## 11.5 Editing Snapshot

The editor maintains a mutable document model separate from the saved Resource. Large brush operations produce compressed command deltas rather than cloning the whole volume for each undo entry.

# 12. Surface Texture, Palette and Material Source Data

## 12.1 Standard Block Surface Source

Each standard block surface set contains:

```text
top, bottom, north, south, east, west
channel images or packed channel data
edge-link rules
connected-texture rules
random-variant rules
material DNA reference
pixel sampling policy
```

The default resolution is 32 x 32 per face. Non-standard resolutions require an asset profile and do not silently enter the terrain atlas.

## 12.2 Palette Resource

`ForgePaletteDefinition` stores stable material roles rather than only raw colour values:

```text
palette_id
entries[]
    entry_key
    albedo
    roughness
    metallic
    emission
    opacity
    normal_or_height_hint
    material_dna_id
```

Voxel volumes store palette indices. Palette remapping can therefore create material or culture variants without rewriting geometry.

## 12.3 Material DNA

`ForgeMaterialDefinition` stores shared style and shader behaviour:

- Material family.
- Pixel sampling and filtering.
- Base roughness/metallic range.
- Emission behaviour.
- Transparency mode.
- Weather, snow, wetness and corruption overlay compatibility.
- Palette lookup behaviour.
- Texture-array or atlas group.
- Animation parameters.

Material inheritance is resolved before bake and recorded in the manifest.

## 12.4 Source Texture Policy

Source textures remain nearest-neighbour pixel art unless a specific effect requires another policy. Generated normal, height or roughness data should remain reproducible from source plus settings; hand-authored advanced channels are allowed but must be stored as canonical source.

# 13. Compound Parts, Pivots, Sockets, Collision and Footprints

## 13.1 Part Definition

```text
ForgePartDefinition
    part_key
    source_volume_or_mesh
    parent_part_key
    local_transform
    pivot_transform
    material_bindings
    static_or_animated
    visibility_group
    collision_role
    state_tags
```

Part keys are stable within the asset contract. Renaming a referenced animated part requires migration or an alias.

## 13.2 Pivot Representation

Pivots are stored as transforms in asset-local coordinates. The editor may present voxel-grid snapping, but runtime values remain normal transforms. The bake validates that rotating parts do not unintentionally intersect required collision or leave the placement footprint.

## 13.3 Socket Definition

```text
ForgeSocketDefinition
    socket_key
    socket_type
    parent_part_key
    local_transform
    direction
    tags
    contract_required
```

Socket types include effect, audio, light, item input/output, power, mana, NPC interaction, hand grip, display and attachment.

## 13.4 Collision Source

Collision is authored through profiles and optional simple volumes. The Forge does not treat every visible voxel as collision by default. Valid products include:

- Box or collection of boxes.
- Convex hull.
- Simplified voxel hull.
- No collision.
- Gameplay-provided collision contract.

Concave collision is restricted to approved static cases.

## 13.5 Footprint and Placement

Footprint records specify occupied grid cells, orientation transforms, placement clearance, selection bounds and support requirements. Any change from an approved footprint triggers migration and blueprint impact validation.

# 14. Animation, Effects, Audio and State-Binding Data

## 14.1 Animation Resources

```text
ForgeAnimationSet
    animation_set_id
    clips[]
        clip_id
        duration
        loop_mode
        tracks[]
        events[]
        lod_policy
```

Track types:

- Part transform.
- Part visibility.
- Material parameter.
- Voxel-frame selection.
- Effect activation/intensity.
- Light intensity/colour role.
- Audio loop or one-shot event.

## 14.2 Rigid Part Animation

Rigid gears, doors and pistons use transform keys targeting stable part keys. The baked runtime scene may use `AnimationPlayer`, a compact custom clip player or generated tweens depending on profiling. The source format remains independent of the final playback class.

## 14.3 Material Animation

Material tracks target named parameters defined by Material DNA, for example:

```text
furnace_heat
mana_flow_speed
rune_pulse
warning_flash
corruption_amount
```

The baker validates that the target shader profile exposes each parameter.

## 14.4 Voxel-Frame Animation

Shape-changing frames store deltas or references to bounded frame volumes. The bake may output precomputed meshes per frame. Runtime remeshing every frame is prohibited for ordinary production assets.

## 14.5 State Bindings

`ForgeStateBindingDefinition` maps authoritative state inputs to presentation actions:

```text
when processing == true
    play clip.machine.furnace.processing
    set furnace_heat = 1.0
    enable effect flame
    enable audio work_loop

when output_blocked == true
    stop processing motion
    enable warning_flash
```

Bindings may read approved presentation inputs only. They cannot consume fuel, transfer items or decide that processing succeeded.

# 15. EditorPlugin and Developer-Section Hosts

## 15.1 Primary EditorPlugin Host

Implement a main-screen EditorPlugin so the Forge appears beside Godot's primary workspaces. The plug-in owns editor integration:

- Main-screen registration.
- Docks and bottom panels.
- Editor selection bridge.
- Resource inspectors and custom property editors.
- 3D gizmos.
- Editor undo manager integration.
- Import/reimport hooks when needed.
- Debugger and preview communication.

The plug-in creates normal `Control` scenes that can be tested outside the editor where practical.

## 15.2 In-Game Developer Host

The developer section embeds selected workspace scenes using the same domain and application services, but excludes editor-only capabilities that require `EditorInterface`. It is useful for:

- World-context preview.
- Direct testing in the running game.
- Controlled visual overrides in development builds.
- Blueprint Designer round-trip.

It is not enabled in retail exports by default.

## 15.3 Shared View Models

UI panels bind to view models or document models rather than directly to disk Resources. This allows the editor host, developer host and tests to exercise the same workflows.

## 15.4 Host Capability Matrix

| Capability | EditorPlugin | Developer Host |
| --- | --- | --- |
| Full asset browser | Yes | Controlled subset. |
| File creation/reorganisation | Yes | Development builds only. |
| Block/voxel editing | Yes | Yes, when enabled. |
| Godot editor selection/gizmos | Yes | No; custom viewport equivalents. |
| Approval and bake | Yes | Optional controlled access. |
| Live world context | Play-in-editor bridge | Native. |
| Retail availability | No | No by default. |

# 16. Commands, Transactions, Undo/Redo, Autosave and Recovery

## 16.1 Command Model

Every edit is an explicit command:

```text
PaintSurfacePixelsCommand
SetVoxelCellsCommand
AddPartCommand
MovePivotCommand
SetSocketTransformCommand
SetMaterialBindingCommand
AddAnimationKeyCommand
OverridePresentationFieldCommand
```

Commands contain enough old and new data to reverse the operation. Large voxel edits store compressed deltas.

## 16.2 Transaction Groups

A drag, brush stroke, multi-selection transform or wizard completion is one undoable transaction. Validation and preview refresh occur after the transaction, not on every individual pixel where that would cause excessive work.

## 16.3 Editor Undo Integration

The EditorPlugin integrates with Godot's editor undo history for editor-visible actions while preserving domain command records. The in-game developer host uses the same domain commands with its own history stack.

## 16.4 Autosave

Autosave writes draft snapshots based on elapsed time, command count and risky operation boundaries. It does not mark an asset approved and does not overwrite the last approved product.

Recommended snapshot metadata:

```text
asset_id
source_revision
base_approved_revision
last_command_id
created_at
host_session_id
source_hash
```

## 16.5 Crash Recovery

On startup, the Forge compares open-document journals and snapshots against saved source. It offers recover, compare, discard or archive. Recovery never silently replaces an approved asset.

# 17. Asset Index, Search, Dependencies and Provenance

## 17.1 Asset Index

The index stores derived searchable fields:

- Stable IDs and display names.
- Asset kind and family.
- Tags, material and culture.
- Source path and pack.
- Review and bake status.
- Contract version.
- Dependencies and dependants.
- Validation severity.
- Last source and product hashes.

The index is rebuildable from canonical source and manifests.

## 17.2 Dependency Graph

Edges include:

```text
asset -> palette
asset -> material DNA
asset -> animation set
asset -> state binding
asset -> contract
override -> base presentation
variant set -> presentation
blueprint -> block/presentation family
product -> source and baker version
```

Cycles are rejected unless a specific harmless relationship is explicitly supported.

## 17.3 Provenance

Every resolved field can report:

- Source layer.
- Source asset/override ID.
- File/resource reference.
- Revision/hash.
- Fallback if invalid.
- Conflicting candidates.

This report powers 21E's comparison and override screens.

## 17.4 Incremental Indexing

File change events queue focused reindexing. Full project scans remain available for recovery and CI. Index updates are transactional so partial scans do not erase valid data.

# 18. Bake Pipeline and Job Orchestration

## 18.1 Bake Stages

```text
1. Resolve source and override inputs
2. Validate schemas and contract
3. Freeze source snapshot
4. Calculate dependency graph and cache key
5. Generate geometry products
6. Generate texture/material products
7. Generate collision/bounds products
8. Generate animation/effect products
9. Generate icon and previews
10. Assemble runtime package or PackedScene
11. Run product validation
12. Write to temporary output
13. Verify read-back and manifest
14. Promote products atomically
15. Update registry/index and refresh previews
```

## 18.2 Job Model

`ForgeBakeJob` contains:

```text
job_id
asset_id
source_revision
requested_products
priority
cancellation_token
dependency_jobs
progress
status
diagnostics
product_manifest
```

Jobs are cancellable between bounded stages. Promotion is never cancelled halfway through an atomic product set.

## 18.3 Incremental Bake

A change to a palette may invalidate materials and previews but not geometry. A change to a socket may invalidate the runtime scene and contract report but not the model mesh. The dependency planner maps changed fields to product stages.

## 18.4 Determinism

Bake output must not depend on:

- Hash-map iteration order.
- Wall-clock time.
- Random numbers without an explicit seed.
- Editor selection or current viewport.
- Machine-specific absolute paths.
- Unnormalised floating-point noise where stable quantisation is practical.

The manifest records engine version, baker version, source hash and relevant settings.

## 18.5 Approval Boundary

Draft bake products may appear in preview caches. Only a successful approved bake updates production registry links. The prior approved package remains active until promotion completes.

# 19. Mesh Generation and Geometry Optimisation

## 19.1 Standard Blocks

Standard full cubes and generated construction shapes continue through the voxel-world chunk meshing system. The Forge supplies surface/material definitions and optional custom shape templates. It does not create a separate scene node for every terrain block.

## 19.2 Unique Voxel Models

Unique models use a deterministic surface extractor:

1. Iterate occupied cells in canonical order.
2. Emit only faces exposed to empty or transparency-compatible neighbours.
3. Classify faces by normal, material and render group.
4. Merge compatible coplanar rectangles where visual rules permit.
5. Generate indexed vertices, UV/palette data and normals.
6. Split only where material/transparency or animation boundaries require it.

## 19.3 Greedy Meshing Rules

Faces may merge when they share:

- Plane and normal.
- Material/palette behaviour.
- Transparency class.
- Emission class.
- State-layer compatibility.
- Required UV orientation.

Faces do not merge across intentional pixel-depth details, separate animated parts or contract boundaries where it would break authoring meaning.

## 19.4 Godot Mesh Construction

Use direct mesh arrays/`ArrayMesh` for final high-volume deterministic generation when practical. `SurfaceTool` is acceptable for prototypes and smaller tools. Generated output should be indexed and have predictable surface ordering.

## 19.5 Static Part Combination

Static parts sharing material and visibility lifetime can combine into one mesh product. Animated parts remain separate. The baker records part-to-surface mapping for selection and diagnostics.

## 19.6 Normal and Tangent Policy

Voxel assets normally use hard face normals. Tangents are generated only for shader/material profiles that require them. Avoid expensive attributes with no visible benefit.

## 19.7 LOD Products

MVP uses:

- LOD0 full approved mesh.
- Optional LOD1 simplified silhouette for larger props/machines.
- Distance effect reduction through state adapter.

Additional LOD levels are generated only when asset scale and repetition justify them.

# 20. Texture, Material, Atlas and Shader Pipeline

## 20.1 Standard Block Textures

Thirty-two-pixel block surfaces feed the established terrain material system. Recommended runtime groupings are texture arrays or controlled atlases with nearest filtering, padding and mip policies that prevent bleeding.

## 20.2 Voxel Model Material Strategy

Use a small number of shared shader/material families. Preferred approaches:

- Palette lookup using vertex colour/custom data or compact UVs.
- Shared material DNA with per-instance parameters.
- Separate surfaces only for materially different render classes such as opaque, cutout, transparent and emissive-special.

Do not create one unique `ShaderMaterial` resource per placed machine unless the state requires unique mutable parameters and duplication is measured to be acceptable.

## 20.3 Atlas Packing

Atlas or texture-array packing is a deterministic build step. The packer:

- Uses stable ordering by group and ID.
- Adds required padding.
- Records UV/array-layer mapping in a product manifest.
- Rebuilds only affected groups where safe.
- Detects overflow and proposes a new group rather than silently downscaling source.

## 20.4 Mip and Filtering Rules

Pixel-art assets use nearest sampling. Mip generation must preserve readability and avoid colour bleed. Transparent cutout and emissive textures receive profile-specific import settings.

## 20.5 Shader Parameter Contracts

Material animation and state bindings target stable parameter keys. Missing parameters are validation errors or declared fallbacks, not silent no-ops.

## 20.6 Runtime Variation

Biome, culture, damage, wetness, snow, charge and corruption variations should prefer shared overlays, palette remaps and shader parameters over full texture duplication. The resolver produces a bounded composition plan.

# 21. Collision, Bounds, Selection and Occlusion Products

## 21.1 Collision Bake

Collision generation follows the authored profile:

- Primitive box set for most machines and props.
- Simplified merged voxel hull for irregular solid objects.
- Convex hull for movable physics props.
- Static concave mesh only by explicit exception.

Collision products are versioned separately from visible meshes because collision changes have gameplay and save implications.

## 21.2 Selection Bounds

Selection products include:

- Local axis-aligned bounds.
- Optional oriented bounds.
- Part selection IDs for Forge editing.
- Placement highlight footprint.
- Interaction target points.

The runtime may use a simpler selection proxy than the visual mesh.

## 21.3 Occlusion and Block Face Culling

Unique blocks declare which grid faces fully occlude neighbours. A wooden chute should not claim full-cube occlusion. Incorrect occlusion flags can create missing terrain faces and are therefore contract-sensitive.

## 21.4 Navigation and NPC Interaction

The Forge may provide interaction sockets and obstacle bounds, but navigation baking and NPC task logic remain external systems. Product manifests expose the required spatial metadata.

# 22. Animation, Effect and Audio Runtime Products

## 22.1 Animation Product

The baker converts source clips into a runtime-compatible set targeting generated part nodes or a compact player. Clip IDs remain stable even if internal Godot animation names are regenerated.

## 22.2 Effect Product

Effect sockets reference approved effect profiles rather than embedding arbitrary scenes in every asset. Profiles specify particle scene, default scale, LOD, colour roles and activation policy.

## 22.3 Light Product

Lights are bounded by profile:

- Maximum range.
- Shadow policy.
- update frequency.
- LOD disable distance.
- emissive-only fallback.

Large numbers of decorative machines should not each enable shadow-casting lights by default.

## 22.4 Audio Product

Audio sockets reference event/profile IDs. The state adapter handles start, stop, crossfade and one-shot events. Spatial audio range and concurrency limits are validated centrally.

## 22.5 Voxel-Frame Product

Frame meshes are precomputed and share materials where possible. Runtime selects a frame; it does not regenerate geometry on each animation tick.

# 23. Icon, Thumbnail and Preview Generation

## 23.1 Deterministic Icon Studio

Icons render in a controlled scene with:

- Fixed camera profile.
- Fixed light rig.
- Transparent or standard background.
- Stable object orientation.
- Agreed resolution and crop.
- Optional rarity frame applied outside the source icon.

## 23.2 Thumbnail Cache

Browser thumbnails are derived cache products. They can regenerate from the approved icon or source preview and are not committed unless needed for packaging.

## 23.3 Preview Contexts

The preview service supports:

- Isolated studio.
- Tiling block wall.
- Held item.
- Dropped item.
- Machine test bench.
- Connected chute line.
- Night/mana lighting.
- Blueprint structure context.

Context scenes are versioned test fixtures so comparisons remain meaningful.

## 23.4 Visual Snapshot Testing

Visual snapshots are optional release checks on a controlled rendering profile. Structural product tests remain the primary deterministic gate because GPU and renderer differences can introduce harmless pixel changes.

# 24. Runtime Presentation Packages and State Adapters

## 24.1 Runtime Package

`ForgeRuntimePackage` references all approved presentation products:

```text
presentation_id
contract_version
root_scene_or_mesh
materials
collision_profile
animation_library
state_binding
icon
bounds
socket_map
lod_profile
variant_compatibility
product_hash
```

## 24.2 Generated Scene Pattern

A compound machine may bake to:

```text
ForgePresentationRoot (Node3D)
    StaticGeometry (MeshInstance3D)
    Door (MeshInstance3D)
    GearLeft (MeshInstance3D)
    GearRight (MeshInstance3D)
    AnimationPlayer or ForgeClipPlayer
    SocketInput (Marker3D)
    SocketOutput (Marker3D)
    SocketFlame (Marker3D)
    SocketSmoke (Marker3D)
    VisualEffectController
```

The gameplay machine node owns inventory and processing. It attaches or instantiates this presentation as a child.

## 24.3 State Adapter

The adapter receives a typed presentation snapshot:

```text
powered: bool
processing: bool
blocked: bool
damage_band: integer
heat_normalised: float
corrupted: bool
mana_charge_normalised: float
```

It evaluates bindings and applies clips, materials, effects, light and audio. It cannot write back gameplay state.

## 24.4 Representation Packages

One item may resolve separate presentations for:

- Inventory icon.
- Held first-person model.
- Held third-person model.
- Dropped world model.
- Equipped display.
- Placed block form.

Shared source and materials are reused, but each representation can have its own pivot, bounds and LOD.

# 25. Override, Variant and Content-Pack Resolution

## 25.1 Resolution Order

```text
built-in base presentation
    -> project visual override
    -> enabled content-pack overrides by deterministic priority
    -> permitted world-specific override
    -> runtime state layers
```

Invalid fields fall back independently where 21D permits. A broken animation override should not necessarily discard a valid model override.

## 25.2 Resolver Inputs

- Stable presentation ID.
- Enabled pack manifest set.
- World content configuration.
- Explicit variant token or deterministic seed context.
- Culture, biome and condition context.
- Contract version.

## 25.3 Resolved Presentation Record

The resolver outputs a fully materialised record plus provenance. Runtime does not repeatedly merge arbitrary source dictionaries every frame. Resolved records are cached by content configuration and variant context.

## 25.4 Conflict Handling

Equal-priority conflicting field overrides block approval or pack enablement until explicitly resolved. Runtime uses the last known valid configuration or declared fallback rather than nondeterministic order.

## 25.5 No Arbitrary Code

Content packs contain data and approved Resource types. They do not execute arbitrary GDScript in the MVP. Behaviour extensions belong to reviewed project code or a later constrained extension design.

# 26. Hot Reload, Cache Invalidation and Live Refresh

## 26.1 Invalidation Graph

A source change produces invalidation tokens:

```text
geometry
material
collision
animation
icon
runtime_scene
registry_resolution
blueprint_preview
```

Dependants subscribe by stable ID, not file watcher path alone.

## 26.2 Preview Hot Reload

Draft previews can refresh immediately after a local bake. The preview service swaps the visual child or product references while retaining camera, test state and selected runtime scenario.

## 26.3 Play-in-Editor Refresh

A development bridge sends approved or explicitly draft-safe package updates to the running game. Compatible presentation children are replaced while gameplay nodes retain state. Contract-sensitive changes may require instance respawn or scene reload and must be labelled.

## 26.4 Existing World Instances

For compatible visual-only changes, existing instances resolve the new package when loaded or when a controlled refresh event occurs. Footprint, collision and port changes are not applied silently to existing worlds.

## 26.5 Cache Key

Recommended cache key inputs:

```text
source_hash
resolved_dependency_hashes
baker_version
engine_major_minor
render_profile
platform-relevant import profile
requested_product_set
```

Machine-specific absolute paths and timestamps are excluded.

# 27. Cross-System Integration

## 27.1 Blocks Registry

The block registry stores presentation and contract IDs. The Forge supplies surface families, custom meshes, occlusion flags, selection bounds and state-binding packages. Mining, placement and block state remain external.

## 27.2 Items Registry

The item registry links representation profiles. Durability, quality, charge and ownership remain item instance state; the adapter receives only approved presentation bands or values.

## 27.3 Automation

Automation provides port contracts and state snapshots. The Forge supplies visible sockets, direction markers, animation and flow effects. Item transfer truth remains in automation graphs.

## 27.4 Magic

Magic systems provide mana, ward, corruption and ritual state. The Forge uses material parameters, effects and light profiles to show those values.

## 27.5 Structures and Blueprint Designer

Blueprints store stable block/family IDs. The Blueprint Designer queries approved presentation packages for preview. When a visual family changes, preview caches invalidate without rewriting blueprint identity.

## 27.6 World Generation and Chunk Renderer

Standard block textures and shape definitions enter the chunk material/meshing registry. Unique block entities attach presentation packages only where the world system already requires a block entity or special renderer.

## 27.7 Save System

Saves store gameplay IDs, state and approved variant tokens. Presentation package hashes may appear in diagnostics but do not replace stable identity.

# 28. Concurrency, Thread Safety and Memory Management

## 28.1 Worker Job Policy

Use Godot's worker facilities for bounded CPU tasks such as:

- Surface extraction.
- Greedy merge calculations.
- Compression and hashing.
- Atlas placement planning.
- Collision simplification over plain data.
- Dependency graph analysis.

Worker functions operate on owned arrays, value types and serialised snapshots.

## 28.2 Main-Thread Commit Policy

Creation or mutation of editor controls, scene-tree nodes, live shared Resources and final engine objects occurs on the main thread unless the milestone's Godot API documentation explicitly guarantees another path and a test proves it safe.

## 28.3 Cancellation

Jobs check cancellation at row, slice, part or stage boundaries. They release temporary buffers promptly. Cancellation never promotes partial output.

## 28.4 Memory Budgets

The editor should avoid holding decoded source, full undo clones, all frame meshes and all preview textures for the entire library simultaneously. Use:

- Document-local caches.
- LRU preview cache.
- Compressed undo deltas.
- Streaming asset index metadata.
- Explicit release on document close.
- Job-local buffer pools after profiling.

## 28.5 Large Operation Warnings

The UI estimates memory and bake work before unusually large volume resize, frame duplication, atlas rebuild or batch override operations.

# 29. Performance Budgets, Scalability and LOD

## 29.1 Budget Philosophy

Budgets are initial guardrails, not permanent laws. They should expose expensive assets early and be revised from packaged-build profiling.

## 29.2 First-Pass Authoring Budgets

| Asset Type | Suggested MVP Guardrail |
| --- | --- |
| Standard block | Six 32 x 32 faces plus bounded variants. |
| Small item | Up to 32 x 32 x 64 authoring bounds, sparse occupancy encouraged. |
| Unique one-block model | Up to 32 x 32 x 32 authoring bounds. |
| Compound machine | Several bounded parts rather than one huge dense volume. |
| Named moving parts | Prefer fewer than 16 in MVP; warn above the profile. |
| Material render classes | Opaque/cutout/emissive grouped; transparent use exceptional. |
| Voxel-frame animation | Small bounded frame count and product memory budget. |
| Dynamic shadow lights | Zero by default; explicit exception. |

## 29.3 Runtime Metrics

Track:

- Vertex and triangle count by LOD.
- Surface/material count.
- Node count in generated scene.
- Collision shape count.
- Texture memory.
- Animation track/key count.
- Effect and light cost profile.
- Package load time.
- State adapter update time.
- Number of live identical instances.

## 29.4 Repetition Strategy

- Standard blocks: chunk mesh.
- Static repeated props: shared meshes and optional MultiMesh where interaction permits.
- Stateful machines: individual gameplay instances with shared presentation Resources.
- Decorative effects: pooled or distance-disabled.
- Far machines: stop nonessential animation/effects according to simulation LOD.

## 29.5 Editor Responsiveness Targets

- Brush feedback should feel immediate for normal profiles.
- Local preview rebuild should complete within an interactive threshold.
- Full bake may take longer but must show progress and remain cancellable.
- Asset browser operations should use the index rather than loading every source Resource.

Exact millisecond budgets are set after the first profiling spike on target hardware.

# 30. Validation, Diagnostics and Recovery

## 30.1 Validation Layers

| Layer | Examples |
| --- | --- |
| Schema | Missing version, invalid enum, malformed array. |
| Identity | Duplicate ID, unstable rename, missing alias. |
| Dependency | Missing palette, clip, contract or base presentation. |
| Geometry | Out-of-bounds voxel, empty model, invalid part hierarchy. |
| Material | Missing shader parameter, unsupported transparency composition. |
| Contract | Missing socket/state, changed footprint, invalid port direction. |
| Animation | Missing target part, invalid key time, excessive frame memory. |
| Product | Failed read-back, hash mismatch, broken PackedScene. |
| Registry | Invalid gameplay link, unresolved override conflict. |
| Performance | Excessive surfaces, nodes, collision shapes or texture memory. |
| Compatibility | Existing-save or blueprint impact without migration. |

## 30.2 Diagnostic Record

```text
code
severity
asset_id
source_field
source_layer
message
consequence
suggested_fix
auto_fix_available
related_ids
```

Messages should be actionable and stable enough for tests and documentation.

## 30.3 Severity

- **Info:** Useful status or optimisation suggestion.
- **Warning:** Valid but risky or outside preferred budget.
- **Error:** Affected product cannot be approved.
- **Critical:** Could corrupt identity, saves, content configuration or production registry; blocks release.

## 30.4 Recovery

Recovery options include:

- Use last approved package.
- Revert field or whole override.
- Restore autosave snapshot.
- Rebuild index.
- Clear transient cache and rebake.
- Resolve alias or dependency.
- Open impacted blueprint/save report.

# 31. Testing, Golden Assets and Continuous Integration

## 31.1 Test Pyramid

### Pure Domain Tests

- ID validation.
- Override merge and provenance.
- Variant determinism.
- Contract checks.
- Voxel indexing and compression.
- Dependency graph and cache keys.

### Bake Unit Tests

- Hidden-face removal.
- Greedy merge rules.
- Stable vertex/surface order.
- Palette remap.
- Collision profile output.
- Clip target resolution.

### Integration Tests

- Source -> bake -> package -> load.
- Base -> override -> revert.
- Asset change -> dependency invalidation.
- Existing blueprint preview refresh.
- Runtime state snapshot -> visual response.
- Save identity preserved across presentation replacement.

### Editor Workflow Tests

- Open, edit, undo, save and recover.
- Validation navigation.
- Approve and bake.
- Plug-in disable/re-enable.
- Asset index rebuild.

## 31.2 Golden Test Assets

Use the same small set throughout development:

1. Stone block surface.
2. Wooden chute with direction and connection sockets.
3. Basic furnace with gears, flame, smoke and states.
4. Iron pickaxe with held/dropped/icon representations.
5. Mana conduit or ward lantern with emissive flow and corruption layer.
6. Deliberately broken asset for diagnostics.

## 31.3 Determinism Tests

Bake each golden asset twice in clean workspaces and compare manifests, structural hashes and stable product metadata. Byte-for-byte equality is preferred where practical; where engine serialisation includes harmless variability, compare canonical extracted product records.

## 31.4 CI Gates

- Parse all Forge source.
- Validate unique IDs and dependencies.
- Run domain and bake tests headlessly.
- Rebake golden assets.
- Compare approved manifests.
- Scan for uncommitted generated drift.
- Load representative PackedScenes.
- Run migration tests.
- Reject critical diagnostics.

## 31.5 Packaged-Build Profiling

Performance acceptance uses packaged development builds on target hardware, not only editor timings.

# 32. Schema Versioning, Migration and Compatibility

## 32.1 Version Fields

Each source and product family has an independent schema version:

```text
forge_asset_schema
voxel_volume_schema
palette_schema
animation_schema
state_binding_schema
contract_schema
manifest_schema
runtime_package_schema
```

## 32.2 Migration Rules

Migrations are explicit, ordered and idempotent where practical. They produce a report and never delete the original source until the upgraded version validates and is saved successfully.

## 32.3 ID Migrations

Stable ID changes require alias or migration records. Alias chains are flattened. Two old IDs cannot silently collapse into one stateful gameplay identity without a dedicated merge migration.

## 32.4 Product Rebuild

Most product schema changes should trigger rebake from source rather than complex in-place product migration. Source migrations receive the highest protection.

## 32.5 Existing Save Compatibility

A visual-only replacement preserves gameplay IDs and runtime state. Contract-sensitive changes are classified:

- Compatible visual refresh.
- Compatible after package reload.
- Requires placed-instance visual respawn.
- Requires blueprint/world migration.
- Breaking and prohibited without explicit production decision.

# 33. Permissions, Security and Future Mod Boundaries

## 33.1 Developer Permissions

Production authoring roles may:

- Create draft source.
- Edit project overrides.
- Bake previews.
- Submit for review.
- Approve production packages according to role.
- Modify contracts only with technical permission.

## 33.2 Runtime Developer Section

The in-game developer host checks development build flags and permissions. Retail builds omit file-writing and approval capabilities.

## 33.3 Content Pack Safety

MVP packs are declarative. They may provide approved Forge Resources, textures and generated products. They may not execute arbitrary code. External file paths are normalised and constrained to pack roots.

## 33.4 Resource Limits

Import and pack validation enforce size, dimension, frame-count, dependency and decompression limits to avoid accidental or hostile memory exhaustion.

## 33.5 Future Modding

Future player/mod tools may expose a subset of Forge capabilities with sandboxed paths, quotas, permission manifests and content-signature policy. That is a later design, not an assumption of the developer MVP.

# 34. Multiplayer, Export and Deterministic Content Compatibility

## 34.1 Gameplay Authority

Servers remain authoritative for gameplay state, collision-sensitive rules and inventory/automation transactions. Presentation assets cannot redefine those values locally.

## 34.2 Content Handshake

A multiplayer world configuration can publish:

```text
required pack IDs and versions
resolved presentation contract versions
approved package manifest hash
migration/alias set version
```

Clients missing required content receive a clear compatibility error or approved fallback policy.

## 34.3 Cosmetic Versus Contract-Sensitive Content

Pure icon or material variation may be locally cosmetic where allowed. Model, collision, footprint, socket, visibility or readability changes that can affect interaction require shared authoritative content configuration.

## 34.4 Export Pipeline

Production export includes:

- Approved runtime packages.
- Required materials, textures, meshes, scenes and effects.
- Resolver manifests and aliases.
- No Forge editor UI.
- No draft/autosave/cache files.
- No unrestricted content-writing capability.

## 34.5 Build Reproducibility

Release builds are created from committed source, approved generated products, lock records and CI validation. Local unapproved hot-reload assets cannot enter a release silently.

# 35. Summer Engine AI-Assisted Development Controls

## 35.1 AI Work Categories

Summer Engine may assist with:

- Boilerplate Resource classes.
- Editor panels and tests.
- Schema validators.
- Migration scaffolds.
- Benchmark harnesses.
- Documentation synchronisation.
- Diagnostic catalogue generation.

## 35.2 Protected Changes

Human approval is mandatory for:

- Stable ID or namespace changes.
- Contract version changes.
- Source schema migrations.
- Override precedence.
- Save compatibility logic.
- Security/permission changes.
- GDExtension introduction.
- Release-gate reductions.

## 35.3 AI Change Ledger

Each AI-assisted batch records:

```text
change_id
requested_goal
files_changed
schemas_or_ids_touched
tests_run
validation_result
known_risks
reviewer
rollback reference
```

## 35.4 Task Sizing

Summer tasks should be small enough for meaningful review. Prefer one Resource family, one bake stage or one workflow slice over a prompt to “build the complete Forge.”

## 35.5 Generated Asset Safety

AI may propose palettes, models or code-generated assets, but approval still requires Forge validation and visual review. AI output does not bypass provenance, licensing or performance gates.

# 36. Proof-of-Concept Scope and Explicit Deferrals

## 36.1 POC Technical Scope

The POC must prove:

- EditorPlugin main-screen opens reliably.
- Asset browser indexes source definitions.
- New standard block surface can be painted at 32 x 32.
- Unique voxel chute can be modelled with directional sockets.
- Compound furnace can contain named parts, pivots and sockets.
- One gear transform clip and flame/effect state activate during processing.
- Existing furnace presentation can be overridden without changing gameplay ID.
- Bake produces mesh, material, collision, icon, scene and manifest.
- Validation catches a missing required socket and footprint mismatch.
- Approved package appears in preview, game test scene and Blueprint Designer.
- Undo, autosave, recovery and field-level revert function.
- Runtime state adapter responds to inactive, processing, blocked and damaged states.
- Golden assets rebake deterministically in CI.

## 36.2 Explicit POC Deferrals

- Custom `.vfvox` loader/saver unless necessary.
- Native GDExtension mesher.
- Full content-pack distribution UI.
- Public modding.
- Advanced atlas fragmentation management.
- Networked collaborative editing.
- Complex skeletal animation.
- Procedural creature generation.
- Portal-scale or city-scale animated megastructures.
- Cross-platform console authoring.

# 37. Staged Implementation Plan

## 37.1 Stage 0 - Architecture and Test Harness

Deliver:

- Add-on skeleton and feature flags.
- Domain/application/editor/runtime boundaries.
- Stable ID helper and schema version foundation.
- Test runner and golden asset fixture folders.
- Architecture Decision Record for source/product separation.

Exit criteria:

- Plug-in enables/disables without errors.
- Domain tests run headlessly.
- Release export can omit editor code.

## 37.2 Stage 1 - Forge Resources and Asset Index

Deliver:

- Root asset, palette, material, contract and basic voxel Resource classes.
- Source save/load and atomic persistence.
- Asset index and duplicate-ID validation.
- Simple browser and asset inspector.

Exit criteria:

- Stone and chute source definitions load, save and reindex.
- Corrupt source produces actionable diagnostics without crashing the editor.

## 37.3 Stage 2 - Block Surface Editor and Material Pipeline

Deliver:

- 32 x 32 six-face painting.
- Palette and Material DNA editor.
- Tiling preview.
- Texture product generation and block registry bridge.
- Undo/redo and autosave.

Exit criteria:

- Stone/plank block can be created, baked and used by the test chunk renderer.

## 37.4 Stage 3 - Voxel Model Editor and Mesh Bake

Deliver:

- Voxel volume editing, slice views and symmetry.
- Hidden-face removal and first deterministic mesher.
- Palette material output.
- Collision, bounds and icon generation.
- Wooden chute contract and connection preview.

Exit criteria:

- Chute bakes reproducibly, connects correctly and respects placement footprint.

## 37.5 Stage 4 - Compound Assets and Animation

Deliver:

- Named parts, hierarchy, pivots and sockets.
- Transform timeline.
- Material parameter track.
- Effect/audio socket binding.
- Runtime package and state adapter.

Exit criteria:

- Basic furnace gears rotate and flame/smoke activate only from authoritative processing state.

## 37.6 Stage 5 - Overrides, Variants and Provenance

Deliver:

- Base/project override resolution.
- Compare and field-level revert.
- Deterministic variant set.
- Provenance report.
- Safe fallback.

Exit criteria:

- Furnace visual can be replaced and reverted while inventory, recipe and save identity remain unchanged.

## 37.7 Stage 6 - Blueprint and World Integration

Deliver:

- Blueprint Designer package lookup.
- Structure-context preview.
- Existing-instance compatible refresh.
- Generated family material propagation.
- Dependency invalidation.

Exit criteria:

- Approved block/machine visual appears in an existing test building without blueprint rewrite.

## 37.8 Stage 7 - Hardening and Production Readiness

Deliver:

- Recovery workflow.
- CI determinism checks.
- Performance dashboard and budgets.
- Migration tests.
- Export filtering.
- Documentation and AI Change Ledger integration.

Exit criteria:

- All POC acceptance scenarios pass in a clean checkout and packaged development build.

# 38. Technical Spikes, Risk Register and Redesign Triggers

## 38.1 Required Spikes

| Spike | Question | Output |
| --- | --- | --- |
| GDScript Mesher | Can the approved normal asset profiles bake interactively? | Benchmark and representative mesh. |
| Palette Shader | Can shared palette lookup preserve pixel style and state overlays? | Shader prototype and memory comparison. |
| Editor Main Screen | Can workspace scenes integrate cleanly with editor undo and preview? | Minimal plug-in slice. |
| Runtime Visual Swap | Can a gameplay machine preserve state while replacing only its presentation child? | Test scene and compatibility rules. |
| Deterministic Package | Are repeated clean bakes structurally stable? | Manifest comparison harness. |
| Atlas/Array Strategy | Which grouping produces acceptable chunk and unique-model performance? | Pack/load/render benchmark. |
| Large Undo | Can compressed voxel deltas keep history responsive? | Memory and latency benchmark. |

## 38.2 Risk Register

| Risk | Consequence | Mitigation |
| --- | --- | --- |
| Editor and runtime code become coupled | Release builds depend on editor APIs. | Strict assembly boundaries and export test. |
| GDScript meshing is too slow | Poor iteration for complex assets. | Profile, optimise data layout, then isolate GDExtension kernel if justified. |
| Generated output drifts | CI and multiplayer mismatch. | Canonical order, manifests and clean rebake tests. |
| Too many material instances | Memory and draw-call growth. | Shared shader families, palette lookup and bounded render classes. |
| Footprint override breaks worlds | Placement overlap or inaccessible machines. | Contract-sensitive classification and migration gate. |
| Hot reload mutates gameplay | Lost inventory or processing state. | Swap presentation child only; integration tests. |
| Huge source Resources create VCS pain | Slow diffs and merges. | Packed external payloads; custom format only after evidence. |
| AI makes broad unreviewed changes | Schema or ID instability. | Protected change list, small tasks and Change Ledger. |
| Asset library index becomes slow | Poor browser UX. | Derived index, incremental updates and no eager full Resource load. |
| Visual snapshots are flaky | False CI failures. | Structural tests primary; fixed-profile visual tests secondary. |

## 38.3 Redesign Triggers

A technical redesign review is required when:

- A normal one-block unique model cannot bake within the approved interactive target after reasonable GDScript optimisation.
- Runtime generated scenes exceed node/draw budgets for representative villages.
- Source files cannot be merged or reviewed reliably in normal Git workflow.
- Hot reload causes gameplay-state loss.
- The resolver cannot explain field provenance deterministically.
- CI clean bakes produce unexplained manifest differences.
- A footprint/collision change can reach production without migration classification.
- The in-game developer host and EditorPlugin produce different source or bake results.

# 39. Definition of Done and Acceptance Matrix

## 39.1 System Definition of Done

The Forge technical foundation is complete for MVP when:

- Canonical source can be reconstructed independently of generated output.
- A clean checkout can validate and rebake all golden assets.
- The editor and developer hosts use the same domain rules.
- Every approved presentation field has provenance.
- Required contracts prevent unsafe visual overrides.
- Runtime presentation never owns gameplay truth.
- Existing saves preserve gameplay state through compatible visual replacement.
- Bakes are incremental, cancellable and recoverable.
- Release export excludes drafts, caches and editor code.
- Performance metrics are visible and representative packaged builds meet the initial budget.

## 39.2 Acceptance Matrix

| Scenario | Required Result |
| --- | --- |
| Create Stone Block | Paint six faces, bake material, preview tiling and register without manual path editing. |
| Create Wooden Chute | Model unique shape, define direction/ports, bake collision and connect in automation preview. |
| Animate Furnace | Gear transform and flame/material/effect state respond to processing snapshot. |
| Override Furnace | Replace model/texture/clip while preserving block ID, contents, recipe and save state. |
| Revert Override | Selected field and whole override return to valid base presentation. |
| Break Contract | Missing output socket blocks approval with actionable error. |
| Change Palette | Only affected products and dependants invalidate. |
| Crash During Edit | Recovery snapshot restores draft without replacing approved source. |
| Clean Rebake | Golden manifest matches approved structural result. |
| Blueprint Refresh | Existing blueprint resolves new approved presentation without changing block IDs. |
| Multiplayer Check | Mismatched required pack/package manifest is detected before play. |
| Release Export | No editor workspace, draft source cache or unrestricted file writer ships. |

# 40. Post-MVP Roadmap and Open Decisions

## 40.1 Post-MVP Expansion

- Advanced connected-texture families.
- Shared reusable part libraries.
- Batch material and culture variant authoring.
- More sophisticated LOD generation.
- Custom voxel source format if justified.
- Native mesher or compressor if justified.
- Content-pack distribution and controlled mod import.
- Automated visual regression dashboards.
- Procedural templates for machine families.
- Character and creature Forge using selected shared foundations.

## 40.2 Open Technical Decisions

The following remain deliberately open until spikes provide evidence:

- Final Godot minor version for each milestone.
- Whether final unique-model geometry uses direct `ArrayMesh`, a helper wrapper or a native kernel.
- Palette lookup attribute layout.
- Texture2DArray versus atlas grouping for each render class.
- Exact source payload threshold for `.tres` versus binary Resource.
- Whether generated products are always committed or generated for selected content classes in CI.
- Final animation playback class for large numbers of stateful machines.
- Exact visual snapshot renderer/profile.
- Final content handshake granularity for multiplayer.

> **Open-Decision Rule**  
> An open implementation choice must not delay stable source schemas, contracts, tests or the first complete vertical pipeline. Choose the simplest reversible option, instrument it and replace it only when evidence justifies the change.

# Appendix A. Recommended Godot Class and Resource Map

| Type | Suggested Base | Purpose |
| --- | --- | --- |
| `LeyforgeForgePlugin` | `EditorPlugin` | Registers main screen, docks, gizmos and editor integration. |
| `ForgeWorkspace` | `Control` | Main reusable workspace scene. |
| `ForgeAssetDefinition` | `Resource` | Canonical asset root. |
| `ForgeVoxelVolume` | `Resource` | Packed occupancy/material data and bounds. |
| `ForgeSurfaceSet` | `Resource` | Six-face block surface source and channel links. |
| `ForgePaletteDefinition` | `Resource` | Stable material-role palette. |
| `ForgeMaterialDefinition` | `Resource` | Shared Material DNA and shader contract. |
| `ForgePartDefinition` | `Resource` | Compound part source and hierarchy. |
| `ForgeSocketDefinition` | `Resource` | Named attachment/interaction transform. |
| `ForgeCollisionProfile` | `Resource` | Collision source and rules. |
| `ForgeFootprintProfile` | `Resource` | Grid occupancy and placement requirements. |
| `ForgeAnimationSet` | `Resource` | Source clips and tracks. |
| `ForgeStateBindingDefinition` | `Resource` | Authoritative input to presentation action mapping. |
| `ForgePresentationContract` | `Resource` | Required parts, sockets, states, footprint and compatibility. |
| `ForgeOverrideDefinition` | `Resource` | Field-level patch and provenance. |
| `ForgeVariantSet` | `Resource` | Deterministic variant selection and composition. |
| `ForgeContentPackManifest` | `Resource` | Pack identity, dependencies and content list. |
| `ForgeRuntimePackage` | `Resource` | Approved runtime product references. |
| `ForgeBakeManifest` | `Resource` | Source hashes, products, tool versions and diagnostics. |
| `ForgeRuntimePresenter` | `Node3D` | Loads package and applies presentation state. |
| `ForgeStateAdapter` | `Node` or `RefCounted` | Evaluates state bindings without gameplay authority. |

# Appendix B. Recommended Folder Structure

```text
res://
    addons/
        leyforge_forge/
            plugin.cfg
            forge_plugin.gd
            domain/
            application/
            bake/
            editor/
            runtime_shared/
            ui/
            tests/
    game/
        registries/
        blocks/
        items/
        automation/
        magic/
        structures/
        presentation/
    content/
        forge/
            assets/
            palettes/
            materials/
            contracts/
            animations/
            state_bindings/
            variants/
            overrides/
            packs/
            migrations/
    generated/
        forge/
            meshes/
            textures/
            materials/
            collisions/
            scenes/
            icons/
            manifests/
    cache/
        forge/
    tests/
        forge_golden/
        forge_integration/
```

# Appendix C. Core Resource Schemas

## C.1 Forge Asset Definition

```text
schema_version: int
forge_asset_id: StringName
presentation_id: StringName
asset_kind: enum
source_status: enum
source_pack_id: StringName
presentation_contract_id: StringName
gameplay_links: Array[StringName]
surface_set_refs: Array[Resource]
voxel_volume_refs: Array[Resource]
part_refs: Array[Resource]
palette_refs: Array[Resource]
material_bindings: Dictionary[StringName, StringName]
animation_set_id: StringName
state_binding_id: StringName
collision_profile_id: StringName
footprint_profile_id: StringName
representation_profiles: Dictionary
variant_set_ids: Array[StringName]
dependency_ids: Array[StringName]
planning_tags: PackedStringArray
```

## C.2 Override Definition

```text
override_id: StringName
target_presentation_id: StringName
source_pack_id: StringName
priority: int
contract_requirement: StringName
field_operations: Dictionary
status: enum
source_revision: int
provenance_note: String
```

## C.3 Runtime State Snapshot

```text
presentation_id: StringName
explicit_variant_token: int
bool_states: Dictionary[StringName, bool]
scalar_states: Dictionary[StringName, float]
enum_states: Dictionary[StringName, int]
event_sequence: Array[PresentationEvent]
```

# Appendix D. Bake Manifest, Cache Key and Dependency Record

## D.1 Bake Manifest

```text
manifest_schema_version
asset_id
presentation_id
source_revision
source_hash
resolved_dependency_hashes
engine_version
baker_version
render_profile
products[]
    product_type
    stable_product_key
    resource_uid_or_path
    product_hash
    size_bytes
    metrics
diagnostics_summary
approved_status
```

## D.2 Dependency Record

```text
source_id
source_revision
direct_dependencies
direct_dependants
invalidation_categories
last_validated_hash
last_baked_hash
```

## D.3 Cache Key Formula

```text
SHA-256(
    canonical_source_hash
    + ordered_dependency_hashes
    + baker_version
    + engine_major_minor
    + render_profile
    + product_set
)
```

The actual hash algorithm can change through a versioned manifest decision; the key principle is canonical ordered input.

# Appendix E. Validation Code Catalogue

| Code | Severity | Meaning |
| --- | --- | --- |
| `FORGE-ID-001` | Error | Duplicate stable Forge or presentation ID. |
| `FORGE-SCHEMA-001` | Error | Unsupported or missing schema version. |
| `FORGE-DEP-001` | Error | Required dependency missing. |
| `FORGE-GEO-001` | Error | Asset has no valid visible geometry. |
| `FORGE-GEO-010` | Warning | Geometry exceeds profile budget. |
| `FORGE-MAT-001` | Error | Material parameter contract missing. |
| `FORGE-CONTRACT-001` | Error | Required part or socket missing. |
| `FORGE-CONTRACT-010` | Critical | Footprint/collision changed without migration classification. |
| `FORGE-ANIM-001` | Error | Animation track targets missing part or parameter. |
| `FORGE-OVR-001` | Error | Equal-priority unresolved override conflict. |
| `FORGE-BAKE-001` | Error | Product generation failed. |
| `FORGE-BAKE-010` | Critical | Product read-back or hash verification failed. |
| `FORGE-SAVE-001` | Critical | Atomic source save could not preserve prior valid source. |
| `FORGE-COMPAT-001` | Error | Required pack or contract version incompatible. |
| `FORGE-PERF-001` | Warning | Runtime package exceeds approved budget. |

# Appendix F. Test Asset and Scenario Matrix

| Asset | Source Feature | Bake Feature | Runtime/Integration Proof |
| --- | --- | --- | --- |
| Stone Block | Six-face 32 x 32 surface. | Texture/material product. | Chunk tiling and Blueprint use. |
| Wooden Chute | Unique voxel shape and sockets. | Mesh, collision, occlusion. | Directional automation connection. |
| Basic Furnace | Parts, pivots, clips, effects. | PackedScene and state binding. | Processing, blocked and damaged states. |
| Iron Pickaxe | Multi-representation item. | Held/dropped/icon products. | Item identity and grip preview. |
| Mana Conduit | Emission and overlay layers. | Shared shader/material. | Charge and corruption presentation. |
| Broken Furnace | Missing socket and clip target. | Validation failure. | Approval blocked with diagnostics. |
| Override Conflict | Two equal-priority field patches. | Resolver report. | Explicit conflict workflow. |
| Legacy Asset | Old model wrapper. | Migration/rebake. | Existing blueprint/save compatibility. |

# Appendix G. Architecture Decision Record Template

```text
ADR ID: ADR-FORGE-###
Title:
Status: Proposed / Accepted / Superseded / Rejected
Date:
Owner:

Context
- What technical problem or evidence requires a decision?

Decision
- What exact direction is selected?
- What boundaries and exceptions apply?

Alternatives Considered
- Option A
- Option B
- Option C

Consequences
- Benefits
- Costs
- Risks
- Migration or rollback requirements

Validation
- Benchmarks
- Tests
- Acceptance criteria

Related Records
- Documents
- Issues/PRs
- Source schemas
- Previous ADRs
```

# Glossary

| Term | Meaning |
| --- | --- |
| Canonical Source | The editable data from which runtime products can be reproduced. |
| Runtime Product | Generated mesh, texture, material, collision, icon, scene or package used by the game. |
| Presentation Package | Approved set of runtime products for one stable presentation ID. |
| Presentation Contract | Versioned requirements connecting visual assets to gameplay-facing spatial/state expectations. |
| Domain Command | Reversible operation that changes Forge source without direct UI or disk coupling. |
| Bake | Deterministic conversion from canonical source to runtime products. |
| Promotion | Atomic replacement of the current approved package after successful validation. |
| Provenance | Record of which base, override or pack supplied a resolved field. |
| Dirty Region | Bounded edited area requiring local preview regeneration. |
| Golden Asset | Stable representative asset used for regression and determinism tests. |
| State Adapter | One-way presentation controller consuming authoritative gameplay state. |
| GDExtension | Native extension boundary considered only for measured bottlenecks. |
| AI Change Ledger | Review record for Summer Engine-assisted modifications. |
