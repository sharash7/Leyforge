# Fantasy Voxel Civilisation Sandbox
## 23I - Presentation Forge
### Godot and Summer Engine Technical Implementation Plan
**Version 0.1 - Detailed Design Bible and Engineering Foundation Draft**

*A staged technical architecture for implementing Leyforge's Presentation Forge in Godot with Summer Engine, covering canonical source data, generated runtime products, editor plugins, stable registries, event and context resolution, spatial attachment, voxel VFX execution, runtime audio, acoustic zones, accessibility, budgets, hot reload, multiplayer, persistence, diagnostics, testing and production hardening.*

*Working technical design document - Godot resource architecture, Presentation Forge services, graph compilation, runtime execution, editor integration, deployment boundaries and Forest Hamlet implementation plan*

# Presentation Forge Technical Implementation Statement

| Field | Locked Direction |
|---|---|
| Document Scope | Defines the technical implementation architecture for Documents 23A through 23H. It covers source and runtime data, Godot resources, editor plugins, importers, registries, dependency graphs, bake pipelines, event routing, context resolution, spatial mapping, VFX execution, audio playback, acoustics, accessibility, performance, networking, persistence, testing, deployment and staged delivery. |
| Core Philosophy | Build the smallest dependable architecture that can prove the complete Presentation Forge identity without creating disposable foundations. Editable source, generated runtime products and authoritative gameplay state remain separate. |
| Engine Direction | Use a pinned stable Godot 4.x production version per milestone. Godot 4.7.1 is the current stable baseline at the time of drafting, but engine upgrades require explicit compatibility review, automated import tests and rollback capability. |
| Language Direction | Use GDScript for most editor tooling, orchestration, schemas and non-critical runtime services. Use GDExtension/C++ only for measured hot paths, specialised audio streams, heavy graph execution or data processing that cannot meet budgets in GDScript. |
| Forge Direction | Presentation Forge is implemented as a coordinated set of Godot editor plugins, import plugins, project tools and runtime modules that share one registry, command model, schema version system and project manifest. It is not a second game engine or an isolated external asset database. |
| Source Direction | Canonical Forge source remains human-reviewable and version-control-friendly. Generated `.tres`, `.res`, mesh caches, lookup tables, imported audio products and registry bundles are replaceable build products, not the only editable source. |
| Runtime Direction | Runtime code consumes compact, validated resources and bounded commands. It does not parse full authoring graphs, perform unrestricted filesystem discovery or depend on editor-only metadata in shipped builds. |
| Event Direction | Authoritative systems emit versioned Event Contracts or expose read-only state. Presentation resolves profiles from contract payloads and Context Packets; it never owns damage, inventory, AI, machine output, spell success or persistent world truth. |
| Spatial Direction | All placement resolves through the stable anchor, socket, region, path, Surface Mask, zone, portal and runtime-contact model from 23B. Scene-tree paths and raw node names are not public identity. |
| VFX Direction | Compile editable voxel graphs into bounded execution plans targeting pooled CPU emitters, MultiMesh-based voxel batches, approved GPU particle paths, path/volume services, light requests and persistent surface layers. |
| Audio Direction | Compile Sound Events, families, spatial profiles, material responses, buses, snapshots, acoustic zones and portals into compact runtime lookup structures with central voice ownership, concurrency, virtualisation and critical-cue protection. |
| Threading Direction | Worker threads operate on pure data, immutable compiled resources and staging buffers. SceneTree mutation, most Node operations and unsafe Resource mutation remain on the main thread unless the engine explicitly guarantees thread safety. |
| Performance Direction | Budgets are enforced centrally through reusable profiles. VFX, audio, lights, surfaces, zones and event traffic degrade through declared fallback chains rather than uncontrolled frame-time spikes. |
| Multiplayer Direction | Replicate authoritative presentation events, stable IDs, compact payloads and deterministic seeds where required. Do not replicate individual particles, sound voices or local mix decisions. |
| Persistence Direction | Save durable presentation state only when it represents world evidence or continuity: persistent surface layers, long-lived presentation state, authored overrides and required reconstruction data. Transient particles and ordinary one-shots are not saved. |
| Summer Engine Direction | Summer Engine may generate code, schemas, tests, migration drafts, diagnostics and first-pass content suggestions. All changes remain reviewable in the Godot project, attributable, reversible and independent of an online AI service at runtime. |
| MVP Direction | Prove mining impacts, footsteps, furnace lifecycle, mana conduit flow, ward warning/breach, rain and shelter transitions, village ambience and a goblin raid through one shared registry, resolver, budget system, capture/replay pipeline and Godot runtime. |
| Deferred Scope | Full dialogue editing, music composition, cinematic sequencing, third-party middleware dependence, unrestricted custom graph scripting, cloud-only asset services and platform certification tooling remain outside the first implementation. |

# Document Purpose

Documents 23A through 23H define the Presentation Forge's creative identity, data concepts, authoring workflows and player-facing behaviour. This document converts those requirements into an implementation architecture for Godot and Summer Engine.

The Presentation Forge must support precise authoring without turning runtime presentation into a fragile collection of scene nodes and hard-coded callbacks. A mining impact, furnace loop, mana pulse, ward breach, creature telegraph or rain contact should resolve from the same stable contracts, spatial model, material context, accessibility rules and performance budgets. The technical design therefore centres on registries, immutable compiled resources, explicit service ownership, bounded execution and deterministic reconstruction.

The plan deliberately avoids assuming that every system should be implemented as a custom engine module. Godot already provides Resources, editor plugins, import plugins, audio buses, spatial audio nodes, particle systems, rendering servers, MultiMesh rendering, worker-thread facilities and GDExtension boundaries. The implementation should use those capabilities where they fit, wrap them behind Leyforge-owned contracts and add native code only after profiling demonstrates a real need.

This document is not a line-by-line coding tutorial and does not replace the full game technical plan. It defines module boundaries, data contracts, execution order, failure policies, test gates and a staged implementation sequence so Summer Engine, human developers and future contributors can build compatible components.

# Current Godot Baseline Note

At the time of drafting, Godot 4.7.1 is the current stable release. The project should not automatically chase every engine release. Each production milestone pins an exact engine build, addon set and import configuration. Upgrades occur on a controlled branch and must pass registry loading, import, audio, VFX, save, replay, multiplayer and packaged-build tests before adoption.

The technical recommendations in this document were checked against the official stable Godot documentation for editor plugins, import plugins, Resources, ResourceLoader/ResourceSaver, AudioStreamPlayer3D, AudioServer, WorkerThreadPool, thread-safe APIs and GDExtension. Where Godot APIs change, the Leyforge contracts in this document remain the source of architectural intent.

# Design Sources

| Source Document | Relevant Direction | How 23I Implements It |
|---|---|---|
| 18 - Technical Implementation Plan | Stable IDs, data-driven registries, authoritative state, modular ownership, async bounded work, persistence, multiplayer readiness, diagnostics and release gates. | Reuses those project-wide engineering rules and translates them into Presentation Forge-specific modules and pipelines. |
| 23A - Shared Presentation Foundation | Defines profiles, contracts, context, source/runtime separation, budgets, accessibility, lifecycle, packaging and MVP. | Supplies the umbrella architecture, authority boundary and acceptance criteria. |
| 23B - Spatial Attachment System | Defines anchors, sockets, regions, paths, masks, zones, portals, remapping, fallbacks and runtime contacts. | Defines compiled spatial resources, runtime resolution and validation services. |
| 23C - Events and Cross-System Integration | Defines Event Contracts, Context Packets, bindings, parameters, channels, composition, prediction and replay. | Defines event routing, schema validation, resolver order, payload compression and runtime command dispatch. |
| 23D - VFX Forge Core | Defines effect definitions, voxel forms, families, inheritance, surfaces, lights, variants and authoring lifecycle. | Defines VFX resource types, bake products, pools and runtime services. |
| 23E - Voxel Particle Graph | Defines graph nodes, emitters, motion, collision, trails, volumes, lights, surfaces, determinism, LOD and compiler rules. | Defines the graph compiler, execution plans and CPU/GPU runtime backends. |
| 23F - Sound Forge Core | Defines sources, layers, events, families, loops, variation, provenance, accessibility and audio lifecycle. | Defines Sound Event resources, source import, voice management and playback state. |
| 23G - Material Audio and Runtime Mixing | Defines material response, spatial sound, zones, portals, ambience, buses, snapshots, listeners and virtualisation. | Defines audio resolver, acoustic graph, mix services and listener policies. |
| 23H - Unified Forge UI/UX | Defines shared workspaces, semantic selection, Test Laboratory, capture/replay, validation, collaboration and bake verification. | Defines editor plugin services, command interfaces, preview runtime and tool diagnostics. |

# Static Table of Contents

1. Locked Technical Implementation Identity
2. Approved Engineering Direction Summary
3. Technical Goals, Principles and Non-Goals
4. Engine Version, Toolchain and Dependency Strategy
5. Repository, Addon and Module Architecture
6. Canonical Source, Imported Assets and Generated Products
7. Stable IDs, Namespaces, Manifests and Schema Versions
8. Godot Resource Architecture and Serialization Rules
9. Editor Plugins, Import Plugins and Companion Tools
10. Dependency Graph, Bake Pipeline and Incremental Rebuilds
11. Runtime Service Ownership and Startup Order
12. Event Contract Ingestion and State Observation
13. Context Packet Construction and Presentation Resolution
14. Spatial Mapping, Anchors, Paths, Zones and Runtime Contacts
15. VFX Runtime Resource Types and Product Model
16. Voxel Particle Graph Compiler
17. Particle Simulation Backends and Scheduling
18. Voxel Rendering, MultiMesh, Materials and Batching
19. Trails, Beams, Paths, Volumes and Weather Execution
20. Dynamic Lights and Persistent Surface Presentation
21. Audio Runtime Resource Types and Source Pipeline
22. Sound Event Resolution, Playback and Voice Ownership
23. Material Audio and Contact Response
24. Spatial Audio, Acoustic Zones and Sound Portals
25. Audio Buses, Mix Snapshots and Runtime Mixing
26. Accessibility and Equivalent Feedback Runtime
27. Central Budget Manager and Quality Profiles
28. LOD, Aggregation, Virtualisation and Phase Continuity
29. Threading, Jobs, Queues and Main-Thread Boundaries
30. Memory, Pools, Streaming, Caches and Lifetime Management
31. Multiplayer Authority, Prediction and Replication
32. Split-Screen, Multiple Listeners and Local Presentation
33. Saving, Persistence, Reconstruction and Migration
34. Hot Reload, Live Link and Atomic Runtime Replacement
35. Presentation Forge Editor Implementation
36. Test Laboratory, Capture, Replay and Scenario Runtime
37. Validation, Diagnostics, Debug Overlays and Repair Tools
38. Summer Engine and AI-Assisted Engineering Workflow
39. Content Packs, Modding, Security and Compatibility
40. Build, Export, Packaging and Continuous Integration
41. Automated Testing and Quality Gates
42. Profiling, Telemetry and Performance Analysis
43. Failure Handling, Recovery and Safe Degradation
44. Staged Implementation Plan
45. Forest Hamlet MVP Technical Scope
46. Risk Register and Redesign Triggers
47. Definition of Done and Acceptance Matrix
48. Relationships With 23J and Future Systems

- Appendix A. Recommended Godot Addon and Runtime Module Map
- Appendix B. Recommended Project Folder Structure
- Appendix C. Core Resource and Record Templates
- Appendix D. Runtime Event-to-Presentation Sequence
- Appendix E. First-Pass Budget Profiles
- Appendix F. Test Matrix
- Appendix G. Naming and Coding Conventions
- Appendix H. Migration and Engine-Upgrade Checklist
- Appendix I. Open Questions for Production Planning

# 1. Locked Technical Implementation Identity

The Presentation Forge technical layer is the bridge between editable creative source and bounded runtime feedback. It owns how presentation definitions are imported, validated, compiled, registered, resolved, scheduled, played, reduced, reconstructed and debugged. It does not own the gameplay facts that cause those reactions.

**Locked Rule:** The runtime must never need to understand an entire authoring workspace in order to play a sound or effect. Authoring graphs, source media, annotations, review comments and editor metadata are compiled into compact resources and lookup tables before shipping.

## 1.1 Technical Promise

A developer should be able to trace any visible or audible result through the complete chain:

```text
Authoritative Event or Read-Only State
        -> Event Contract Version
        -> Context Packet
        -> Binding and Presentation Profile
        -> Spatial Mapping and Material Response
        -> Accessibility and Quality Variant
        -> Budget Admission
        -> Runtime Command
        -> Pooled Audio/VFX/Light/Surface Service
        -> Debug Trace and Measured Cost
```

The same trace should remain available in editor previews, packaged development builds and captured replay sessions.

## 1.2 Identity Layers

| Layer | Responsibility | Runtime Result |
|---|---|---|
| Canonical Source | Editable graphs, definitions, masks, layers, metadata, manifests and review state. | Version-control-friendly creative source. |
| Import and Bake | Validate schemas, compile graphs, resolve dependencies, generate caches and produce runtime resources. | Deterministic, replaceable products. |
| Registry | Map stable IDs and versions to loaded runtime definitions. | File-path-independent lookup. |
| Resolver | Combine event, state, context, spatial, material, accessibility and variant rules. | One bounded presentation request. |
| Runtime Services | Allocate pooled instances, schedule updates, manage voices, surfaces, lights and zones. | Efficient playback and continuity. |
| Budget and Quality | Admit, reduce, aggregate, virtualise or reject requests by importance and cost. | Stable performance under density. |
| Diagnostics | Record provenance, fallbacks, costs, errors and lifecycle. | Trustworthy debugging and replay. |

## 1.3 What the Technical Layer Is Not

- It is not a second gameplay event system.
- It is not a general-purpose visual scripting environment with unrestricted code execution.
- It is not a reason to put every effect or sound in its own permanent Node.
- It is not dependent on raw scene-tree paths, editor selection state or file names as public identity.
- It is not a guarantee that every authored particle cell or sound layer is active at every distance.
- It is not a requirement to write native code before profiling.
- It is not permitted to silently convert invalid source into plausible but untraceable runtime behaviour.

# 2. Approved Engineering Direction Summary

| Area | Approved Direction |
|---|---|
| Production engine | Pin a stable Godot 4.x build per milestone; current drafting baseline is 4.7.1 stable. |
| Runtime languages | GDScript first for orchestration and tools; optional GDExtension/C++ for measured hot paths. |
| Canonical data | Text-based, schema-versioned Forge source plus original media and voxel assets. |
| Runtime data | Baked Godot Resources, compact tables, mesh caches, imported audio streams and manifests. |
| Public identity | Stable namespace IDs and versions, never scene paths or file names alone. |
| Resource access | Registry handles resolve IDs to immutable runtime definitions; dependencies are predeclared. |
| Editor architecture | Shared EditorPlugin shell with specialist main screens, docks, inspectors, importers and Test Laboratory tools. |
| Bake architecture | Deterministic dependency graph with content hashes, incremental rebuilds and atomic product publication. |
| Event routing | One Presentation Event Gateway validates contracts and builds immutable event records. |
| Resolution | Context -> binding -> profile -> variant -> spatial/material -> accessibility -> quality -> budget -> command. |
| VFX execution | Hybrid pooled CPU and GPU paths, always preserving approved voxel forms and declared fallbacks. |
| Audio execution | Central voice manager using Godot audio players and buses, with phase-aware loops, aggregation and virtualisation. |
| Threading | Pure data jobs off-thread; SceneTree mutation and unsafe resource changes on main thread. |
| Persistence | Save durable surface/state evidence and logical continuity, not ordinary particles or one-shots. |
| Multiplayer | Replicate compact authoritative events and seeds; resolve local presentation on clients. |
| Hot reload | Delta bake, validation, atomic registry swap and phase-preserving instance migration where supported. |
| Accessibility | Runtime settings select declared alternatives and protect critical information before decorative content. |
| CI | Headless import, bake, schema validation, tests, package smoke load and performance checks. |
| AI | Summer Engine assists implementation and diagnostics; all output remains diffable and human-approved. |

# 3. Technical Goals, Principles and Non-Goals

## 3.1 Primary Goals

1. One shared pipeline for audio, voxel VFX, lights, surfaces and related feedback.
2. Stable, traceable data from authoring source to runtime instance.
3. Fast iteration through incremental bake and hot reload.
4. Predictable performance in dense villages, factories, storms and raids.
5. Safe integration with authoritative gameplay, multiplayer and saves.
6. A tool architecture that remains usable after the content library becomes large.
7. Accessibility equivalence and critical-cue protection as runtime requirements.
8. Engine-version resilience through Leyforge-owned interfaces and migration tests.

## 3.2 Engineering Principles

- **Data before wiring:** definitions and registries replace repeated manual scene connections.
- **Immutable runtime definitions:** loaded baked resources are treated as read-only; mutable state lives in runtime records.
- **Commands before Nodes:** systems submit small commands; services decide whether and how to instantiate Nodes or server objects.
- **Bounded graphs:** every graph node has known inputs, outputs, cost class and runtime restrictions.
- **Explicit ownership:** every active loop, surface layer, zone and pooled object has one owner and one release path.
- **Graceful fallback:** invalid optional components degrade; required critical components block approval.
- **Reproducible builds:** the same source, engine, plugin set and bake version produce equivalent runtime products.
- **Profile before native optimisation:** GDExtension is a targeted response to measured cost, not a default architecture preference.

## 3.3 Non-Goals

- Implementing a full digital audio workstation.
- Replacing Godot's renderer, audio server or editor.
- Simulating physically exact acoustics for every voxel at runtime.
- Replicating decorative particles and audio voices over the network.
- Saving every transient presentation instance.
- Permitting content packs to execute arbitrary scripts through graph nodes.
- Building every final-game effect family before the shared MVP works.

# 4. Engine Version, Toolchain and Dependency Strategy

## 4.1 Engine Pinning

Each milestone records:

- Godot executable version and build hash.
- Rendering backend and project settings relevant to presentation.
- Required addons and their versions.
- GDExtension ABI/build targets if native modules exist.
- Audio import and compression settings.
- Shader cache and platform target assumptions.
- Bake schema and runtime registry versions.

Minor engine upgrades are tested in a separate branch. The project should maintain at least one known-good downloadable engine package or reproducible setup record for every released milestone.

## 4.2 Recommended Technology Allocation

| Responsibility | First Choice | Escalation Path |
|---|---|---|
| Editor UI and orchestration | GDScript EditorPlugin/Control | Native extension only for missing editor capability or severe scale issue. |
| Schemas and registries | GDScript Resources plus generated tables | C++ lookup layer if profiling shows resolver bottleneck. |
| Graph compilation | GDScript pure-data compiler | WorkerThreadPool and then GDExtension for large graph batches. |
| Runtime VFX scheduling | GDScript service plus RenderingServer/MultiMesh/GPUParticles | Native simulation kernel for proven CPU pressure. |
| Runtime audio control | GDScript voice manager plus AudioStreamPlayer nodes and AudioServer | Custom AudioStream or native mixer component for specialised requirements. |
| Import pipeline | EditorImportPlugin and ResourceFormatLoader/Saver where appropriate | External command-line preprocessor for heavy offline conversion. |
| Testing | GDScript test harness and headless Godot | Native unit tests for GDExtension modules. |
| Build automation | Shell/Python plus headless Godot | CI platform integration. |

## 4.3 Dependency Policy

Third-party addons are allowed only when they:

- Use a compatible licence.
- Have source available and a clear maintenance state.
- Can be pinned to a version or commit.
- Do not own canonical Presentation Forge identity.
- Can be removed or replaced behind a Leyforge interface.
- Pass packaged-build and platform tests.

A dependency register records owner, purpose, version, licence, update policy and replacement plan.

# 5. Repository, Addon and Module Architecture

Presentation Forge should appear as one logical addon family with clear editor/runtime boundaries.

## 5.1 Top-Level Components

```text
addons/leyforge_presentation/
    editor/
    importers/
    schemas/
    compiler/
    validation/
    test_lab/
    shared/

src/presentation/
    registry/
    events/
    resolver/
    spatial/
    vfx/
    audio/
    acoustics/
    accessibility/
    budgets/
    replay/
    debug/

content/presentation_source/
content/presentation_generated/
tests/presentation/
tools/presentation/
```

The exact folders may change to match the wider Leyforge repository, but ownership boundaries must remain clear.

## 5.2 Recommended Runtime Modules

| Module | Owns | Does Not Own |
|---|---|---|
| PresentationRegistry | ID/version lookup, manifests, dependency handles, product generation numbers. | Active playback state. |
| PresentationEventGateway | Contract validation, event sequencing, prediction metadata and trace IDs. | Gameplay event generation. |
| ContextPacketBuilder | Normalised read-only context and safe system queries. | Arbitrary world scanning. |
| PresentationResolver | Binding/profile/material/variant/accessibility resolution. | Node allocation and rendering. |
| SpatialPresentationResolver | Anchor, path, zone, fallback and runtime contact transforms. | Entity rig authoring. |
| VFXRuntimeService | VFX commands, pools, graph instances, paths, volumes, surfaces and light requests. | Gameplay damage or environment mutation. |
| AudioRuntimeService | Sound Event instances, voices, loops, variation and source lifecycle. | Dialogue logic or music composition. |
| AcousticRuntimeService | Zone graph, portal transmission, environment sends and listener classification. | Full physical wave simulation. |
| PresentationBudgetManager | Admission, reduction, aggregation, virtualisation and quality policy. | Gameplay difficulty. |
| PresentationAccessibilityService | Runtime alternatives, critical-cue policies and comfort settings. | User settings UI ownership. |
| PresentationCaptureService | Trace recording, deterministic replay data and comparison metrics. | Whole-game save system. |
| PresentationDebugService | Overlays, provenance, counters and issue reporting. | Production analytics policy. |

## 5.3 Autoload and Scene Ownership

Not every service must be a Godot autoload. Recommended split:

- A small `PresentationRuntimeRoot` is created by the game bootstrap and owns services.
- Registry and configuration services may be RefCounted/Resource-based objects.
- Scene-dependent pools and listeners live under a runtime root Node.
- World-specific acoustic, surface and spatial caches attach to world instances.
- Local-player listener adapters attach to each viewport/player context.

This avoids a single global singleton accumulating every world-specific Node while preserving one authoritative service entry point.

# 6. Canonical Source, Imported Assets and Generated Products

## 6.1 Three Data Layers

| Layer | Examples | Rules |
|---|---|---|
| Canonical Forge Source | JSON/YAML definitions, graph source, Surface Masks, editable voxel forms, WAV masters, metadata, manifests and review state. | Human-reviewable, schema-versioned and committed to source control. |
| Imported Intermediate | Godot-imported audio, decoded metadata, texture masks, mesh fragments, waveform caches and editor thumbnails. | Regenerable local products; not public identity. |
| Baked Runtime Product | `.tres`/`.res` definitions, compact registries, compiled graph bytecode/plans, MultiMesh caches, audio event tables and zone graphs. | Deterministic, bounded and packageable. |

## 6.2 Canonical Format Recommendation

Use simple text schemas rather than embedding all authoring state only in `.tres` files. Recommended source extensions are conceptual and may be revised:

```text
*.pfprofile.json
*.pfbinding.json
*.pfevent.json
*.pfspatial.json
*.pfvfx.json
*.pfgraph.json
*.pfsound.json
*.pfmaterial.json
*.pfacoustic.json
*.pfbudget.json
```

Binary media remains in standard source formats such as WAV and approved voxel/texture formats. The manifest links them through stable IDs and content hashes.

## 6.3 Why Generated Godot Resources Still Matter

Godot Resources provide editor integration, dependency tracking, loading and native runtime access. The bake pipeline should generate Resources that expose only required runtime fields. This gives the game efficient loading without making generated resources the only source of authoring truth.

## 6.4 Product Immutability

- Runtime definitions are not modified in place by active instances.
- Hot reload publishes a new generation of a definition.
- Existing instances either continue with the old generation, migrate through an explicit adapter or restart according to component policy.
- Generated product paths may change without changing stable IDs.

# 7. Stable IDs, Namespaces, Manifests and Schema Versions

## 7.1 ID Rules

Examples:

```text
presentation.profile.machine.furnace.standard
presentation.binding.machine.furnace.active
presentation.event.machine.processing_started
presentation.spatial.machine.furnace.chimney
presentation.vfx.machine.furnace.smoke_standard
presentation.sound.machine.furnace.work_loop
presentation.material.stone.basic
presentation.acoustic.zone.small_stone_room
presentation.budget.village.standard
```

IDs are lowercase, namespaced, descriptive and stable. Display names are localisable and may change independently.

## 7.2 Manifest Entry

Each entry records:

- Stable ID.
- Asset type.
- Schema version.
- Source path and source hash.
- Generated product path and product hash.
- Dependencies by stable ID.
- Optional dependencies and fallback IDs.
- Content-pack owner and load priority.
- Lifecycle and approval state.
- Licence/provenance references where required.
- Minimum runtime/bake version.
- Platform or quality exclusions.

## 7.3 Schema Versioning

Every source type has a schema identifier and integer version. Migration rules are explicit functions:

```text
pfgraph v3 -> v4
pfsound v2 -> v3
pfspatial v5 -> v6
```

Migrations must:

- Preserve unknown extension fields when safe.
- Produce a report of changed/defaulted/removed data.
- Never overwrite source without backup or version-control visibility.
- Be deterministic and testable.
- Block when semantic interpretation is ambiguous.

## 7.4 Runtime Handles

Runtime systems should use lightweight handles containing:

```text
stable_id_hash
registry_generation
asset_type
resolved_index
```

A debug build retains the full stable ID for inspection. Shipping builds may use compact hashes or indices, but collision detection occurs during bake and registry load.

# 8. Godot Resource Architecture and Serialization Rules

## 8.1 Core Resource Families

Recommended runtime Resource classes:

| Resource | Runtime Purpose |
|---|---|
| `PFRegistryBundle` | Compact ID tables, versions, dependency ranges and product generations. |
| `PFEventContract` | Event payload schema, replication policy, frequency class and replay rules. |
| `PFStateContract` | Read-only state fields, update policy and version. |
| `PFPresentationProfile` | Component references, channels, variants, accessibility and budget class. |
| `PFBindingDefinition` | Owner/event/state conditions, spatial reference and profile reference. |
| `PFSpatialMap` | Anchors, sockets, regions, paths, zones, masks, remaps and fallbacks. |
| `PFMaterialResponseTable` | Material/action/intensity/environment lookup and fallbacks. |
| `PFVFXEffectDefinition` | Compiled graph reference, form/material resources, lifecycle and LOD tiers. |
| `PFParticleExecutionPlan` | Validated node arrays, constant data, parameter slots and backend hints. |
| `PFSoundEventDefinition` | Source layers, variants, loop lifecycle, concurrency and spatial profile. |
| `PFAudioFamilyDefinition` | Family defaults, intensity bands and variation policy. |
| `PFSpatialAudioProfile` | Attenuation, directionality, occlusion, reverb and priority. |
| `PFAcousticZoneGraph` | Zone records, portals, adjacency and environment profiles. |
| `PFMixSnapshot` | Bus targets, transitions, priority and stacking policy. |
| `PFBudgetProfile` | VFX/audio/light/surface/update limits and fallback thresholds. |
| `PFAccessibilityProfile` | Reduced motion/flash, caption, indicator and sensory alternatives. |

Class names are implementation recommendations, not player-facing contract names.

## 8.2 Serialization Rules

- Generated Resources contain no editor comments, waveform thumbnails or review history.
- Runtime arrays use compact numeric forms where readability is unnecessary.
- Strings repeated across many entries are interned or replaced with registry indices during bake.
- Curves may bake into sampled lookup tables when deterministic evaluation and cost justify it.
- Large media remains external/streamed rather than embedded into definition resources.
- Resource mutation after registry publication is prohibited except for controlled hot-reload replacement.

## 8.3 Text Versus Binary Products

Development builds may prefer text `.tres` products for diffs and debugging. Shipping builds may use binary `.res` or packaged resources for load speed and size. Both are generated from the same canonical source and must pass equivalent load tests.

# 9. Editor Plugins, Import Plugins and Companion Tools

## 9.1 EditorPlugin Structure

Presentation Forge should register:

- A main Presentation Forge screen.
- Shared project/library docks.
- Custom inspectors for generated runtime Resources.
- Spatial viewport tools and gizmos.
- Particle graph and audio event editors.
- Acoustic zone/portal editors.
- Test Laboratory and capture/replay panels.
- Validation and bake commands.

The plugin should use the shared command and selection services defined in 23H rather than directly changing files from every panel.

## 9.2 Import Plugins

`EditorImportPlugin` is appropriate for turning recognised canonical source files into generated Godot Resources and editor previews. Importers should:

- Read canonical source.
- Validate schema and dependencies.
- Produce deterministic products.
- Record source and bake versions.
- Emit clear error/warning diagnostics.
- Avoid network access during ordinary import.
- Support headless operation.

Heavy multi-asset baking may use a dedicated bake command rather than forcing every operation through the standard single-file importer.

## 9.3 Resource Loaders and Savers

Custom ResourceFormatLoader/Saver support may be added when Presentation Forge runtime products require specialised extensions or lazy loading. Canonical source remains handled by Forge schema tools, not treated as unrestricted runtime Resources.

## 9.4 Companion Tool Boundary

A standalone companion process is allowed for:

- Heavy waveform analysis.
- Offline audio conversion.
- Large voxel mesh/cache generation.
- Batch schema migration.
- CI validation.

It communicates through declared files or a local protocol and cannot become the only way to open or repair the project.

# 10. Dependency Graph, Bake Pipeline and Incremental Rebuilds

## 10.1 Bake Stages

```text
Discover Source
 -> Parse and Schema Validate
 -> Resolve Stable IDs
 -> Build Dependency Graph
 -> Semantic Validate
 -> Compile Graphs and Tables
 -> Generate Mesh/Audio/Mask/Zone Products
 -> Cross-Product Validate
 -> Publish to Staging Registry
 -> Smoke Load
 -> Atomically Promote Registry Generation
```

## 10.2 Content Hashing

Each source and generated product receives a content hash. Rebuild decisions use:

- Source hash.
- Dependency hashes.
- Schema/compiler version.
- Engine/import version where relevant.
- Platform/quality target.
- Bake options.

A changed display description should not necessarily rebake voxel meshes; a changed Surface Mask should rebuild only dependants that consume that mask.

## 10.3 Dependency Classes

| Dependency Type | Example | Rebuild Behaviour |
|---|---|---|
| Hard | Profile requires VFX effect and Sound Event. | Missing dependency blocks bake. |
| Optional | Profile may use light flash. | Missing dependency uses declared fallback and warning. |
| Inheritance | Culture variant inherits base furnace profile. | Base change rebuilds variant resolution. |
| Schema | Binding consumes Event Contract v3. | Contract change triggers compatibility validation. |
| Runtime-only query | Footstep requests surface material from world. | No asset dependency; requires interface contract test. |
| Packaging | Content pack requires base material library. | Validated at pack build/load time. |

## 10.4 Atomic Publication

Products are written to a staging location. Registry validation and smoke load complete before the active generated directory or registry pointer changes. A failed bake leaves the previous known-good generation active.

## 10.5 Bake Report

Every bake report includes:

- Sources changed.
- Products rebuilt.
- Dependants invalidated.
- Warnings and fallbacks.
- Timing per stage.
- Product sizes.
- Registry generation.
- Compatibility/migration notes.
- Hot-reload eligibility.

# 11. Runtime Service Ownership and Startup Order

## 11.1 Startup Sequence

1. Load Presentation runtime configuration and quality/accessibility settings.
2. Load base registry bundle.
3. Apply approved content-pack manifests in deterministic order.
4. Validate registry versions and ID collisions.
5. Create budget, event, resolver and debug services.
6. Create world-specific spatial, acoustic, surface and pool services.
7. Register local listeners and viewport adapters.
8. Begin accepting authoritative presentation events.

Gameplay events emitted before readiness are either buffered within a short bounded queue or dropped according to contract importance. Critical persistent states reconstruct after service readiness.

## 11.2 Runtime Command Types

```text
PlayOneShot
StartLoop
UpdateLoop
StopLoop
SpawnBurst
StartContinuousEffect
UpdateContinuousEffect
StopContinuousEffect
WriteSurfaceLayer
RemoveSurfaceLayer
RequestLight
ReleaseLight
PushMixSnapshot
PopMixSnapshot
ShowAccessibilityIndicator
EmitCaption
```

Commands use IDs, compact context, spatial handles, priority, seed and trace metadata. Runtime services may reduce the implementation but not reinterpret gameplay facts.

## 11.3 Ownership Keys

Long-lived instances use an ownership key such as:

```text
owner_entity_id + binding_id + channel_id + optional_instance_slot
```

This prevents duplicate loops when state updates repeat and provides deterministic stop/update routing.

# 12. Event Contract Ingestion and State Observation

## 12.1 Event Gateway

Authoritative systems submit typed records to `PresentationEventGateway`. The gateway:

- Resolves contract ID/version.
- Validates required fields in development builds.
- Assigns sequence/trace IDs.
- Applies frequency and de-duplication policy.
- Marks prediction/authority state.
- Forwards an immutable event record to the resolver queue.

## 12.2 State Observation

Long-lived presentation should consume read-only state snapshots or change notifications, not poll arbitrary gameplay Nodes every frame. Examples:

- Machine active/blocked/damaged/heat ratio.
- Mana conduit flow ratio and direction.
- Ward charge and breach state.
- Creature phase and telegraph state.
- Weather intensity and shelter classification.

The owning system supplies a stable adapter interface. Presentation stores only the values required for interpolation and display.

## 12.3 Event Frequency Classes

| Class | Examples | Policy |
|---|---|---|
| Critical Rare | Ward breach, boss phase, machine overload. | Reliable authority, strong trace, protected cue. |
| Standard | Weapon impact, item placement, spell release. | Normal event path with de-duplication. |
| High Frequency | Footsteps, rain contacts, conveyor ticks. | Local generation or aggregation; compact tracing. |
| Continuous State | Furnace work, mana flow, wind ambience. | Start/update/stop ownership rather than repeated one-shots. |
| Cosmetic Ambient | Leaves, distant village activity. | May be locally seeded and omitted under pressure. |

## 12.4 Backpressure

The event queue has bounded capacity. Under overload:

1. Merge or drop decorative ambient events.
2. Aggregate repeated high-frequency material contacts.
3. Preserve lifecycle stops and critical warnings.
4. Record overload counters.
5. Never block authoritative gameplay simulation waiting for presentation.

# 13. Context Packet Construction and Presentation Resolution

## 13.1 Context Builder

The builder normalises event payload and safe queries into fixed fields:

```text
source_id, target_id
source_material, target_material
position, normal, velocity
struck_voxel, struck_face
intensity, weight_class, movement_speed
biome, weather, wetness, temperature
indoor_state, acoustic_zone
magic_school, damage_type, corruption_state
local_player_relation, listener_distance_band
```

Not every packet contains every field. Availability bits distinguish absent data from a valid zero value.

## 13.2 Safe Query Interfaces

Presentation may request bounded queries from owning systems:

- Surface material beneath a contact point.
- Acoustic zone containing a source/listener.
- Spatial anchor transform for an entity or block entity.
- Current weather cell and shelter state.
- Material response tags.
- Local player relation or importance.

Queries return read-only values and must have fallback behaviour. Presentation does not traverse world chunks or inventories directly.

## 13.3 Resolver Pipeline

```text
Contract
 -> Candidate Bindings
 -> Conditions and Channel Rules
 -> Base Presentation Profile
 -> Inheritance and Content-Pack Overrides
 -> Material Response
 -> Context Variant
 -> Spatial Mapping
 -> Accessibility Variant
 -> Quality/LOD Variant
 -> Budget Admission
 -> Component Commands
```

## 13.4 Resolver Caching

Cache keys may include:

- Contract ID/version.
- Binding/profile generation.
- Source/target material families.
- Intensity band.
- Environment/acoustic category.
- Accessibility preset.
- Quality tier.

Dynamic position, normal and owner state remain outside static result caching.

## 13.5 Fallback Trace

Every resolution records, at least in development builds:

- Requested profile.
- Applied override.
- Missing context fields.
- Material fallback path.
- Anchor fallback.
- Accessibility substitution.
- Budget reduction.
- Final command IDs.

# 14. Spatial Mapping, Anchors, Paths, Zones and Runtime Contacts

## 14.1 Compiled Spatial Maps

Authoring references from 23B bake into compact arrays:

- Anchor transforms and orientation bases.
- Bone/socket mappings.
- Region voxel/member ranges.
- Surface Mask data and weighted samples.
- Path control points and segment metadata.
- Zone bounds/volumes.
- Sound portal planes and adjacency.
- Variant/LOD remap tables.
- Fallback chains.

## 14.2 Runtime Resolution Order

1. Use explicit runtime contact transform if supplied and permitted.
2. Resolve owner asset spatial map.
3. Apply variant/damage/LOD remap.
4. Resolve requested anchor/region/path/zone.
5. Apply local offset and orientation rule.
6. Use fallback anchor or owner transform when allowed.
7. Reject or downgrade if required precision is unavailable.

## 14.3 Transform Updates

- Bone-following anchors update with the owning Skeleton3D pose.
- Machine/block anchors update only when their transform or state mapping changes.
- Static structure anchors are cached in world space until structure mutation.
- Long paths use versioned geometry; active effects decide whether to migrate or finish on the old version.

## 14.4 Surface Masks

Surface Masks bake into compact bitsets or weighted sample lists. Runtime samplers avoid scanning 32x32 textures. Masks may expose:

- Eligible cells.
- Weight per cell.
- Direction/tangent.
- Exclusion flags.
- Material-role overrides.

## 14.5 Runtime Contacts

A runtime contact record includes position, normal, owner IDs, struck voxel/face, material and lifetime. It is valid only for the event/command that created it unless explicitly promoted to a persistent surface anchor.

# 15. VFX Runtime Resource Types and Product Model

## 15.1 VFX Definition Products

A baked VFX effect contains:

- Stable ID and generation.
- Compiled particle execution plan.
- Required voxel forms and material handles.
- Declared emitter count and maximum child depth.
- Parameter slots and default values.
- Lifecycle mode.
- Spatial requirements.
- LOD tiers and fallback effect IDs.
- Budget class and importance.
- Accessibility alternatives.
- Pool and warm-up hints.
- Determinism policy.

## 15.2 Voxel Form Products

Forms bake into one or more of:

- Shared cube/cuboid meshes.
- MultiMesh transform templates.
- Compact voxel-cluster cell arrays.
- Frame sequences with changed-cell deltas.
- Trail segment geometry templates.
- Surface overlay tile/material references.

## 15.3 Runtime Instance Record

```text
instance_id
owner_key
effect_definition_handle
start_time
seed
parameter_buffer
spatial_handle
lod_tier
backend
pool_slot
virtualised_state
child_count
trace_id
```

The instance record is separate from the immutable effect definition.

# 16. Voxel Particle Graph Compiler

## 16.1 Compiler Responsibilities

The compiler:

- Validates node types and typed connections.
- Rejects cycles except declared feedback/state constructs.
- Resolves constants and removes unreachable nodes.
- Calculates maximum emitters, child depth and per-instance bounds.
- Bakes curves and lookup tables.
- Assigns parameter slots.
- Partitions work by execution domain.
- Selects supported runtime backend hints.
- Generates debug source maps from runtime instructions to authoring nodes.

## 16.2 Execution Domains

| Domain | Examples | Typical Backend |
|---|---|---|
| Spawn | Burst count, rate, shape sampling, initial form. | CPU command setup or GPU emission parameters. |
| Particle Update | Velocity, gravity, drag, palette, scale, lifetime. | CPU batch or GPU particle shader. |
| Collision | Ground/block contact, bounce, stick, extinguish. | CPU bounded query; limited GPU approximation. |
| Path | Trail sampling, beam segments, conduit pulses. | CPU path service plus MultiMesh. |
| Volume | Fog cells, weather regions, smoke beds. | Spatial volume scheduler, GPU or sparse CPU cells. |
| Surface | Scorch/wetness/frost writes. | Surface service command, not per-particle mutation. |
| Light | Flash/flicker/range request. | Central light request service. |
| Child Events | Spawn secondary effect or sound cue. | Bounded runtime command queue. |

## 16.3 Boundedness Validation

Approval blocks when the compiler cannot prove limits for:

- Maximum particles per instance.
- Continuous spawn rate.
- Child emitter recursion/depth.
- Trail history.
- Collision queries.
- Dynamic lights.
- Persistent surface writes.
- Network-triggered frequency.

## 16.4 Compiler Versioning

Compiled plans record compiler version and node-library version. Runtime rejects incompatible plans with a clear registry error rather than attempting partial interpretation.

# 17. Particle Simulation Backends and Scheduling

## 17.1 Hybrid Backend Strategy

No single backend fits every effect.

| Backend | Best Use | Limitations |
|---|---|---|
| CPU Pooled Particles | Exact voxel contact, low/medium counts, deterministic replay, child events and complex context. | Higher CPU cost at large counts. |
| MultiMesh Batch | Many cube/cuboid instances sharing mesh/material. | Requires buffer updates and grouped materials. |
| GPUParticles3D | Dense rain, fog, sparks or ambient volumes using approved voxel meshes. | Limited exact world queries and deterministic cross-device behaviour. |
| Prebaked Voxel Frames | Stable looping flames, portal motifs, distant effects. | Less responsive to per-cell simulation. |
| Aggregated Proxy | Distant factory smoke, village ambience, large mana network. | Reduced local detail by design. |

## 17.2 Backend Selection

The compiler suggests a backend; the runtime may select another approved tier based on quality, platform and density. The source effect remains voxel-authored regardless of backend.

## 17.3 Fixed-Step and Frame-Step Work

- Critical deterministic CPU simulation may use a fixed presentation tick.
- Decorative effects may update at frame rate or throttled intervals.
- Visual interpolation hides lower update rates when appropriate.
- Presentation ticks never block gameplay ticks.

## 17.4 Collision Queries

Collision policies are explicit:

- None.
- Ground plane approximation.
- Physics space ray/shape query.
- Voxel world query.
- Owner-surface query.
- First contact only.

High-frequency particles cannot each perform unrestricted physics queries. The compiler and budget manager enforce query limits.

# 18. Voxel Rendering, MultiMesh, Materials and Batching

## 18.1 Rendering Goal

Preserve genuine three-dimensional cube, cuboid, shard and voxel-cluster silhouettes while reducing draw calls and update cost.

## 18.2 Shared Geometry

Use a small library of canonical meshes:

- Unit cube.
- Rectangular cuboid.
- Thin shard.
- Plate.
- Cross/stepped cluster where approved.

Per-instance transforms, palette indices, emission and lifecycle values are supplied through MultiMesh custom data or equivalent shader inputs.

## 18.3 Batch Keys

Particles may batch by:

```text
mesh_form + material_shader + transparency_mode + render_layer + shadow_policy + quality_tier
```

Avoid creating unique materials for minor colour changes. Semantic palettes and per-instance indices should drive variations.

## 18.4 Transparency Rules

- Opaque/cutout voxels are preferred where style permits.
- Transparent cells use bounded overlap and simplified sorting expectations.
- Dense fog/smoke tiers reduce cell count before increasing alpha layering.
- Bloom supports emission but cannot hide non-voxel geometry.

## 18.5 Server-Level Rendering

If scene-node MultiMesh instances become too expensive, the runtime may use RenderingServer objects behind the same VFX service interface. This is an optimisation path, not an MVP requirement.

# 19. Trails, Beams, Paths, Volumes and Weather Execution

## 19.1 Trail Service

The trail service stores bounded sample histories for declared paths such as blade root-to-tip. It generates segmented voxel geometry with:

- Maximum samples.
- Minimum distance/angle thresholds.
- Lifetime and width curve.
- Teleport/reset detection.
- LOD sample reduction.
- Owner-stop policy.

## 19.2 Beam and Conduit Paths

Beams and mana flows use path definitions plus runtime state:

- Segment spacing.
- Pulse speed and phase.
- Junction behaviour.
- Direction.
- Breaks/blocked state.
- LOD representation.

Gameplay owns whether power or mana flows. Presentation receives a path and flow state.

## 19.3 Volume Scheduler

Volumes register bounds, density, importance and environmental context. The scheduler activates cells around relevant cameras/listeners rather than simulating every point in the full volume.

Use cases:

- Rain/snow contact volumes.
- Cave dust.
- Smoke beds.
- Corruption haze.
- Portal chamber ambience.

## 19.4 Weather Contact Sampling

Rain contact is generated from local weather intensity and sampled surfaces around players, not from globally colliding every raindrop. Roof/ground material responses are resolved through the Material Response Matrix.

# 20. Dynamic Lights and Persistent Surface Presentation

## 20.1 Light Request Service

Effects request lights; they do not instantiate unrestricted Light3D nodes directly. A request declares:

- Position/spatial handle.
- Colour role.
- Intensity and range curves.
- Duration.
- Importance.
- Shadow requirement.
- Merge group.
- Fallback emissive-only mode.

The service pools lights, merges compatible nearby requests and denies decorative shadows under pressure.

## 20.2 Surface Presentation Service

Persistent or semi-persistent layers attach to voxel faces/Surface Masks/regions. Runtime records:

```text
surface_owner
face_or_mask
layer_type
intensity
age
source_id
expiry_policy
save_policy
material_variant
```

## 20.3 Chunk Integration

For voxel terrain and structures:

- Surface layers are stored in chunk-local sparse maps.
- Changes mark only affected render chunks for overlay refresh.
- Decorative short-lived layers use non-save caches.
- Meaningful scorch, corruption or cleansing may persist through the world save system.

## 20.4 Conflict Resolution

Layer channels define composition and priority. Example:

```text
wetness + soot -> darkened soot
frost + heat -> accelerated frost removal
corruption + cleansing -> opposing intensity transition
scorch + repair -> repair may clear or cover scorch by rule
```

Presentation rules may visualise state interaction but do not decide gameplay cleansing or fire spread.

# 21. Audio Runtime Resource Types and Source Pipeline

## 21.1 Source Masters

Canonical audio masters remain lossless where practical. Import metadata records:

- Source ID and file hash.
- Sample rate/channels.
- Loop points.
- Loudness analysis.
- Licence/provenance.
- Trim/fade instructions.
- Compression/streaming class.
- Platform overrides.

## 21.2 Generated Audio Products

Godot imports source files into runtime streams. Sound Forge bake products reference imported streams by generated handle and contain layer/variation logic rather than duplicating media.

## 21.3 Sound Event Definition

A baked Sound Event contains:

- Event mode: one-shot, loop, sequence, random set or state machine.
- Layer definitions and gain/pitch ranges.
- Variation/round-robin policy.
- Loop regions and transition points.
- Spatial profile.
- Bus and concurrency group.
- Priority and budget class.
- Caption/accessibility metadata.
- Virtualisation and phase policy.
- LOD/distance representations.

## 21.4 Streaming Policy

| Audio Type | Default |
|---|---|
| Very short impacts/footsteps | Preloaded/compressed in memory as appropriate. |
| Medium machine loops | Preloaded or streamed based on count and memory profile. |
| Long ambience beds | Streamed. |
| Rare large creature/boss assets | Streamed or prewarmed before encounter. |
| UI critical cues | Preloaded and protected. |

# 22. Sound Event Resolution, Playback and Voice Ownership

## 22.1 Central Voice Manager

The Audio Runtime Service owns all presentation voices. Callers receive logical handles, not direct control of AudioStreamPlayer nodes.

Responsibilities:

- Allocate pooled 2D/3D players.
- Choose variation deterministically when required.
- Apply spatial and bus profiles.
- Enforce concurrency and priority.
- Manage loop phases and transitions.
- Virtualise inaudible loops.
- Aggregate dense sources.
- Emit captions/indicators.
- Trace start/update/stop lifecycle.

## 22.2 Voice Lifecycle

```text
Requested -> Admitted -> Allocated -> Starting -> Playing
    -> Virtualised -> Resumed
    -> Fading/Stopping -> Released
```

A denied decorative request may end at `Requested -> RejectedByBudget` with a trace counter.

## 22.3 Loop Phase Continuity

Long-lived loops store logical phase even when virtualised. On re-entry:

- Resume at phase when the source remains logically active.
- Restart only when the Sound Event declares restart behaviour.
- Crossfade when hot reload changes compatible loop content.

## 22.4 Variation Seed

Variation may derive from authoritative event seed, owner ID and sequence number. Purely local ambience can use local deterministic seeds per region/session.

# 23. Material Audio and Contact Response

## 23.1 Contact Resolver

The contact resolver receives:

```text
source_material
target_material
action
intensity
movement/tool family
environment
wetness/temperature
```

It resolves an audio family and optional VFX/debris profile through the shared Material Response Table.

## 23.2 Lookup Strategy

1. Exact source-target-action-intensity-environment match.
2. Exact target/action with source family wildcard.
3. Target material family fallback.
4. Action default.
5. Global neutral fallback or no cue if permitted.

Missing critical responses are validation errors; missing decorative variations are warnings.

## 23.3 High-Frequency Contacts

Footsteps, rain and machinery use aggregation/cooldown rules. The system prevents multiple animation markers in the same contact window from creating duplicated audio.

# 24. Spatial Audio, Acoustic Zones and Sound Portals

## 24.1 Spatial Playback

Godot AudioStreamPlayer3D or equivalent pooled players receive:

- World transform.
- Attenuation parameters.
- Directionality.
- Doppler policy.
- Bus routing.
- Occlusion/filter values.
- Reverb/environment sends.

The Leyforge spatial profile owns authored meaning; direct node property values are generated from it.

## 24.2 Acoustic Zone Graph

A world/structure acoustic graph stores:

- Zone ID and bounds.
- Enclosure score.
- Dominant material/damping profile.
- Reverb profile.
- Outdoor exposure.
- Connected portals.
- Priority and nesting.

## 24.3 Sound Portals

Portals represent doors, windows, tunnels, vents, arches, chimneys and magical gateways. Runtime portal state includes open fraction, transmission class and obstruction.

Source-to-listener traversal uses a bounded graph search rather than voxel-by-voxel wave tracing. Results are cached until zone/portal topology changes.

## 24.4 Procedural Structures

For player-built voxel spaces:

- A background analyser proposes bounded zones from enclosed regions.
- Updates are incremental around changed blocks.
- Uncertain spaces use conservative outdoor/partially enclosed fallbacks.
- Creators may pin or override important zones.

Full dynamic zone generation is post-MVP; MVP supports authored Forest Hamlet zones plus basic shelter classification.

# 25. Audio Buses, Mix Snapshots and Runtime Mixing

## 25.1 Bus Ownership

Presentation Forge defines the audio bus contract but should use Godot AudioServer buses and effects underneath.

Recommended buses:

```text
Master
  UI
  Player
  Combat
  Creatures
  NPC Activity
  Machines
  Magic
  Environment
  Weather
  Dialogue (reserved)
  Music (reserved)
```

## 25.2 Snapshot Service

Snapshots contain target bus values and transition policy. They can stack by channel and priority:

- Environment: cave, underwater, indoor, portal.
- Gameplay: combat, raid, low health.
- Interaction: dialogue focus, menu pause.
- Accessibility: high-clarity critical cues.

## 25.3 Ducking

Ducking rules are explicit and bounded. Example: dialogue focus may reduce environment and machines, but must not suppress critical overload or enemy telegraph cues below their minimum audibility.

## 25.4 Runtime Mix Diagnostics

Development builds expose:

- Active voices by bus/group.
- Virtualised voices.
- Stolen/rejected voices.
- Snapshot stack.
- Peak/RMS or practical level indicators.
- Critical-cue minimum enforcement.
- Zone/portal filter path.

# 26. Accessibility and Equivalent Feedback Runtime

## 26.1 Settings Input

The Presentation Accessibility Service consumes player settings such as:

- Reduced motion.
- Reduced flash.
- Particle density.
- Colour filters/colour-independent cues.
- Caption and directional-caption settings.
- Critical audio enhancement.
- Visual indicator preferences.
- Controller response preferences.

## 26.2 Resolution Timing

Accessibility variants are selected before budget admission so the budget manager understands the actual cost and importance of the chosen equivalent.

## 26.3 Critical Cue Contract

A critical Presentation Profile declares at least two independent channels where practical. Runtime checks ensure one channel remains available after user settings, distance, occlusion and budget reduction.

## 26.4 Caption Events

Captions are semantic events, not transcripts scraped from audio files. They include:

- Localisation key.
- Source direction/location when applicable.
- Importance.
- Duration.
- Repeat/cooldown policy.
- Icon/category.

# 27. Central Budget Manager and Quality Profiles

## 27.1 Budget Domains

| Domain | Example Limits |
|---|---|
| VFX Instances | Active effects by importance and scene. |
| Voxel Cells | Total active rendered cells/instances. |
| VFX Updates | CPU particle/path/volume update time. |
| Collision Queries | Queries per frame/tick. |
| Dynamic Lights | Active lights, shadowed lights and merge groups. |
| Surface Layers | Active transient overlays and persistent writes. |
| Audio Voices | Physical voices per bus/priority. |
| Virtual Voices | Logical loops retaining phase. |
| Acoustic Work | Zone searches, portal updates and listener evaluations. |
| Event Traffic | Events resolved per frame and queue capacity. |

## 27.2 Admission Result

```text
Full
Reduced
Aggregated
Virtualised
CriticalCueOnly
RejectedDecorative
```

## 27.3 Quality Profiles

Quality settings select baseline budgets, but runtime adapts to measured pressure. A fixed low-quality preset is not enough for a sudden raid during heavy rain in a machine-filled village.

## 27.4 Importance Sources

Importance derives from:

- Critical profile flag.
- Local player ownership/relation.
- Screen/listener distance.
- Threat or interaction relevance.
- Current objective/boss phase.
- Visibility/audibility.
- Persistence requirement.

Gameplay may label importance but cannot bypass hard safety caps.

# 28. LOD, Aggregation, Virtualisation and Phase Continuity

## 28.1 Declared Fallback Chain

Every major effect/sound family should provide:

```text
Full -> Reduced -> Minimal -> Critical Cue Only -> Hidden/Virtual
```

A missing required fallback is a validation warning or error depending on expected density.

## 28.2 Aggregation Examples

- Fifty furnace loops become several spatial factory clusters plus nearby individual machines.
- Distant chimney smoke becomes one region-level voxel smoke source.
- Rain impacts become material-weighted surface clusters.
- Crowd work sounds become village activity beds with nearby individual events.
- Long mana networks show pulses near junctions, faults and players.

## 28.3 Virtualisation

Virtualised instances retain:

- Logical active state.
- Phase/time.
- Owner key.
- Important parameter values.
- Last spatial classification.

They do not retain every particle cell or physical audio player.

## 28.4 Rehydration

When an instance becomes relevant:

1. Re-resolve current definition generation.
2. Restore logical phase.
3. Choose appropriate LOD.
4. Reacquire pool resources.
5. Fade or materialise according to profile.

# 29. Threading, Jobs, Queues and Main-Thread Boundaries

## 29.1 WorkerThreadPool Use

Appropriate background jobs include:

- Parsing and schema validation.
- Dependency hashing.
- Graph compilation on immutable source data.
- Waveform/loudness analysis.
- Acoustic zone analysis on copied voxel occupancy data.
- Mesh/transform buffer generation.
- Capture/replay comparison.
- Batch validation.

Every submitted worker task must be joined/awaited according to Godot's WorkerThreadPool lifecycle requirements.

## 29.2 Main-Thread Work

Keep on the main thread unless an engine API explicitly supports otherwise:

- SceneTree Node creation/removal.
- Most Resource mutation/publication.
- Editor UI updates.
- AudioStreamPlayer allocation/control.
- MultiMesh/RenderingServer updates when thread-safety is uncertain.
- Physics/world queries not exposed through a safe thread interface.

## 29.3 Data Transfer

Workers produce immutable result objects or plain arrays placed into a thread-safe completion queue. The main thread validates generation IDs before applying results, preventing stale jobs from overwriting newer edits.

## 29.4 Cancellation

Long jobs receive cancellation tokens and generation numbers. Cancellation never leaves partially published products; staging output is deleted or ignored.

# 30. Memory, Pools, Streaming, Caches and Lifetime Management

## 30.1 Pool Families

- AudioStreamPlayer3D pool.
- AudioStreamPlayer/2D pool.
- MultiMesh voxel batch pool.
- CPU particle instance pool.
- Trail/path instance pool.
- Dynamic light pool.
- Temporary surface-layer command pool.
- Caption/indicator request pool.

## 30.2 Pool Policy

Pools have soft and hard capacities. Under hard pressure the budget manager reduces or rejects decorative requests. Pools expose leak counters and ownership traces.

## 30.3 Cache Types

| Cache | Key | Invalidation |
|---|---|---|
| Resolver cache | Contract/material/context bands/settings. | Registry generation or relevant setting change. |
| Spatial cache | Owner + anchor/path + variant/LOD. | Model/spatial map/transform generation change. |
| Acoustic path cache | Source zone + listener zone + portal state generation. | Portal/zone topology change. |
| Voxel form cache | Form ID + quality/material. | Form/material generation change. |
| Audio variation cache | Sound Event + seed/round-robin state. | Event generation or session reset. |

## 30.4 Streaming

Large audio and rare boss assets use explicit preload windows. World-region manifests can declare likely presentation assets so streaming begins before entry.

# 31. Multiplayer Authority, Prediction and Replication

## 31.1 Replication Unit

Replicate:

- Event Contract ID/version or compact negotiated index.
- Source/target stable runtime IDs where needed.
- Quantised position/normal/context fields.
- Authoritative sequence/timestamp.
- Deterministic seed.
- Importance/reliability class.

Do not replicate:

- Individual particle positions.
- Audio voice allocation.
- Local bus levels.
- Local accessibility alternatives.
- Client-specific LOD decisions.

## 31.2 Reliability

| Event | Recommended Policy |
|---|---|
| Boss phase, ward breach, portal opened | Reliable/ordered or reconstructable state. |
| Weapon impact, spell release | Standard authoritative event; reliability based on combat protocol. |
| Footsteps | Usually local/nearby derived or low-cost unreliable event. |
| Rain contacts/ambient motes | Local simulation, not replicated. |
| Machine continuous state | Replicate machine state; clients own presentation start/update/stop. |

## 31.3 Prediction

Local attacks may play predicted audio/VFX. On authority result:

- Confirm and continue.
- Correct material/impact point with a secondary authoritative cue.
- Fade/cancel predicted cue when rejected.

Prediction must not produce persistent surface evidence or major critical cues until confirmed unless specifically designed.

## 31.4 Join-in-Progress

New clients reconstruct continuous presentation from authoritative states and world save data rather than replaying all historical events.

# 32. Split-Screen, Multiple Listeners and Local Presentation

## 32.1 Listener Model

Each local player has:

- Viewport/camera reference.
- Audio listener policy.
- Accessibility settings.
- Caption/indicator surface.
- Relevance and quality context.

## 32.2 Audio Strategy

Because one shared audio output cannot perfectly represent multiple independent ears, use a documented policy:

- Shared world mix using the primary or blended listener.
- Critical per-player cues may be routed as non-spatial/local overlays.
- Captions and directional indicators remain per viewport.
- Extreme distance disagreements favour critical information and nearest relevant player.

## 32.3 VFX Strategy

VFX culling and quality may evaluate all active cameras. An effect visible to either viewport remains active at the highest required tier within a capped split-screen budget.

# 33. Saving, Persistence, Reconstruction and Migration

## 33.1 What Is Saved

- Persistent surface presentation tied to world evidence.
- Long-lived authored presentation overrides or placed emitters.
- Logical state required to reconstruct phase-sensitive loops when gameplay state alone is insufficient.
- Acoustic zone/portal overrides and cached generated topology version where appropriate.
- Content-pack/registry generation compatibility data.

## 33.2 What Is Not Saved

- Ordinary one-shot sounds.
- Short-lived particles.
- Decorative ambient instances.
- Physical pooled-node state.
- Runtime caches that can be rebuilt.

## 33.3 Reconstruction

On load:

1. Load authoritative gameplay/world state.
2. Load persistent presentation evidence records.
3. Resolve current definitions and migrations.
4. Rebuild acoustic/surface caches.
5. Start continuous presentation from logical state and current phase policy.
6. Do not replay expired historical one-shots.

## 33.4 Save Compatibility

Saved records use stable IDs and schema versions. Removed assets require aliases, migration or safe fallback. A missing decorative profile can drop with warning; missing persistent corruption/surface semantics may require migration blocking.

# 34. Hot Reload, Live Link and Atomic Runtime Replacement

## 34.1 Development Flow

```text
Edit Source -> Incremental Validate -> Delta Bake -> Staging Load
 -> Compare Compatibility -> Atomic Registry Swap -> Instance Migration
 -> Runtime Verification -> Accept or Roll Back
```

## 34.2 Compatibility Classes

| Change | Active Instance Policy |
|---|---|
| Palette/material parameter | Apply live if layout-compatible. |
| Sound source variation | New one-shots use new generation; loops crossfade if compatible. |
| Graph constant/curve | Apply to new instances or migrate if state layout matches. |
| Graph topology/state layout | Existing instances finish old generation or restart by policy. |
| Anchor mapping | Re-resolve following instances; persistent paths may require restart. |
| Event Contract schema | Requires gateway compatibility check; may block live swap. |
| Bus/snapshot change | Apply through controlled transition. |

## 34.3 Rollback

Keep the previous known-good registry generation and generated products until runtime verification succeeds. A failed swap restores the prior generation and produces a trace report.

# 35. Presentation Forge Editor Implementation

## 35.1 Shared Editor Services

Implement 23H's UI through reusable services:

- `PFEditorProjectContext`.
- `PFEditorSelectionContext`.
- `PFEditorCommandBus`.
- `PFEditorHistoryService`.
- `PFEditorValidationService`.
- `PFEditorBakeService`.
- `PFEditorPreviewBridge`.
- `PFEditorCollaborationAdapter`.

Panels issue commands rather than writing source files directly.

## 35.2 Custom Gizmos and Viewport Tools

Use EditorNode3DGizmoPlugin or equivalent editor APIs for:

- Anchors and sockets.
- Orientation axes.
- Regions and paths.
- Acoustic zones and portals.
- VFX volumes and light ranges.
- Runtime capture markers.

## 35.3 Inspector Integration

Custom inspectors show:

- Stable ID and source path.
- Local/resolved/inherited values.
- Schema and product generation.
- Dependency links.
- Validation.
- Runtime preview and trace entry points.

## 35.4 Responsiveness

Large searches, graph compile, waveform analysis and bake operations run asynchronously. UI remains responsive and clearly marks stale preview data.

# 36. Test Laboratory, Capture, Replay and Scenario Runtime

## 36.1 Preview Runtime

The Test Laboratory uses the same runtime services as the game wherever possible, hosted in a controlled preview scene. Avoid a separate simplified renderer/audio implementation that can diverge from production.

## 36.2 Capture Record

A capture contains:

- Engine/build and registry generation.
- Scenario ID and random seeds.
- Event/state timeline.
- Context Packets or reproducible query results.
- Spatial mappings used.
- Resolver decisions.
- Budget/admission outcomes.
- Performance counters.
- Optional screenshots/audio metrics.

## 36.3 Replay Modes

- Deterministic event replay.
- State timeline replay.
- Step-by-step resolver inspection.
- A/B registry generation comparison.
- Accessibility/quality matrix replay.
- Stress multiplication of selected event streams.

## 36.4 Runtime Capture Boundary

Captures store presentation-relevant records, not private player communications or full unrelated gameplay state. Production capture is opt-in and privacy-aware.

# 37. Validation, Diagnostics, Debug Overlays and Repair Tools

## 37.1 Validation Layers

| Layer | Examples |
|---|---|
| Schema | Missing field, invalid enum, unsupported version. |
| Identity | Duplicate ID, hash collision, invalid namespace. |
| Dependency | Missing effect, source, anchor, bus, material or fallback. |
| Semantic | Event payload unavailable, invalid channel composition, wrong spatial type. |
| Style | Non-voxel VFX geometry, excessive transparency, unreadable effect scale. |
| Boundedness | Unbounded emitters, recursion, lights, voices, surface writes. |
| Accessibility | Critical cue lacks equivalent, colour-only warning, excessive flash. |
| Runtime | Pool leak, missing stop, stale handle, failed hot reload. |
| Packaging | Editor-only source leaked, licence/provenance missing, content-pack conflict. |

## 37.2 Debug Overlays

- Active anchors/paths/zones/portals.
- Event and binding traces.
- Current profile/variant/material fallback.
- VFX cells, batches and update cost.
- Audio voices, virtual voices, buses and concurrency.
- Light requests and merges.
- Surface layers by channel.
- Budget pressure and rejected requests.
- Acoustic traversal path.
- Accessibility substitutions.

## 37.3 Repair Tools

Repair actions may:

- Remap missing anchors.
- Add required fallback.
- Convert legacy event version.
- Regenerate products.
- Rebuild acoustic zones.
- Clear orphaned surface records.
- Reassign missing bus/material family.

Repairs produce a preview and diff before source modification.

# 38. Summer Engine and AI-Assisted Engineering Workflow

## 38.1 Approved Assistance

Summer Engine may:

- Generate initial Resource classes and schema validators.
- Draft importers and migration functions.
- Produce graph-node boilerplate.
- Generate tests from contracts and acceptance tables.
- Analyse runtime traces and suggest bottlenecks.
- Suggest missing fallbacks or accessibility alternatives.
- Create deterministic test fixtures.
- Summarise bake reports and failed CI jobs.

## 38.2 Guardrails

- AI-generated code enters normal version control and review.
- Generated migrations include fixtures proving before/after behaviour.
- AI cannot modify approved source or publish registry generations without explicit command.
- Licence/provenance requirements apply to generated media and code dependencies.
- Runtime does not call a remote AI service to resolve ordinary presentation.
- The project remains buildable from repository source without Summer Engine availability.

## 38.3 Prompt and Task Size

Implementation work should be broken into small verifiable tasks with acceptance tests. Example:

```text
Create PFEventContract Resource and JSON importer.
Add schema version validation.
Add three valid fixtures and five invalid fixtures.
Run headless import test.
Do not implement resolver or UI in this task.
```

This reduces hallucinated cross-system changes and makes review practical.

# 39. Content Packs, Modding, Security and Compatibility

## 39.1 Pack Structure

A presentation content pack declares:

- Namespace and version.
- Dependencies.
- Added/replaced stable IDs.
- Override priority.
- Runtime products.
- Source/licence manifest where distributed.
- Minimum Presentation runtime version.
- Allowed platforms/quality tiers.

## 39.2 Safe Extension Boundaries

Packs may add data through approved schemas and bounded graph nodes. They may not:

- Execute arbitrary GDScript through presentation definitions.
- Register unrestricted native libraries without explicit trusted installation.
- Mutate gameplay systems.
- Bypass event-contract or accessibility validation.
- Reference files outside allowed pack roots.

## 39.3 Conflict Resolution

Conflicts resolve deterministically by manifest load order, namespace ownership and explicit override declarations. Silent last-file-wins behaviour is not acceptable.

## 39.4 Compatibility Report

Loading a pack produces a report of:

- Replaced IDs.
- Missing dependencies.
- Contract-version mismatches.
- Fallbacks used.
- Disabled assets.
- Licence/security warnings.

# 40. Build, Export, Packaging and Continuous Integration

## 40.1 Build Products

Shipping packages include:

- Runtime registry bundles.
- Generated Resources.
- Imported/compressed audio streams.
- Required voxel mesh/material/shader products.
- Runtime scripts/native libraries.
- Content-pack manifests.

They exclude:

- Editor-only source and comments unless intentionally distributed for modding.
- Waveform thumbnails and preview renders.
- Test captures not required by the build.
- Unused source masters.
- AI prompts and internal review notes.

## 40.2 CI Stages

1. Repository/schema lint.
2. Headless Godot import.
3. Presentation source validation.
4. Deterministic bake.
5. Generated product diff/hash check.
6. Unit and integration tests.
7. Test Laboratory scenario replay.
8. Packaged development build smoke test.
9. Performance and accessibility gates.
10. Artifact manifest and licence report.

## 40.3 Reproducibility

CI records engine version, addon/native dependency versions, bake compiler version and target platform. Non-deterministic product changes fail or require explicit approval.

# 41. Automated Testing and Quality Gates

## 41.1 Test Layers

| Test Type | Examples |
|---|---|
| Unit | ID parsing, fallback resolution, curves, concurrency choice, portal traversal. |
| Schema | Valid/invalid source fixtures for every version. |
| Compiler | Graph boundedness, constant folding, node compatibility, source map. |
| Determinism | Same seed/context produces equivalent plan selections and CPU results. |
| Integration | Event -> resolver -> audio/VFX command -> lifecycle stop. |
| Runtime | Pool reuse, virtualisation, hot reload, save reconstruction. |
| Multiplayer | Prediction, authoritative correction, join-in-progress state. |
| Performance | Dense furnaces, rain, raid, mana grid and split-screen. |
| Accessibility | Reduced flash/motion, critical equivalents, captions and indicators. |
| Packaging | Editor source exclusion, missing dependency failure, content-pack loading. |

## 41.2 Golden Scenarios

Forest Hamlet scenarios become stable regression fixtures:

- Pickaxe against dry stone in cave.
- Footsteps across grass, mud, stone and shallow water.
- Furnace start/work/blocked/damaged/stop.
- Mana conduit low/high/overloaded flow.
- Ward warning and breach.
- Rain moving from outdoors to cottage interior.
- Village at work with machine aggregation.
- Goblin raid with warning, impacts, magic and accessibility profiles.

## 41.3 Release Blocking Defects

- Data loss or source corruption.
- Missing required stop/release causing leaks.
- Event contract mismatch producing wrong critical cue.
- Broken save migration for persistent presentation evidence.
- Critical accessibility cue absent.
- Unbounded graph or budget bypass.
- Packaged build missing required runtime product.
- Multiplayer presentation event causing gameplay desync or crash.

# 42. Profiling, Telemetry and Performance Analysis

## 42.1 Required Counters

- Events received/resolved/dropped/aggregated.
- Resolver cache hit rate and time.
- Active/virtual VFX instances and cells.
- Particle update, collision and buffer-upload time.
- Draw calls/batches by effect family.
- Active lights and shadowed lights.
- Surface-layer count and chunk updates.
- Physical/virtual/stolen audio voices by bus.
- Acoustic searches and cache hit rate.
- Pool allocations and high-water marks.
- Hot-reload migration/restart counts.

## 42.2 Profiling Builds

Development builds expose detailed traces; shipping builds retain lightweight counters and crash-safe diagnostics. Expensive per-event traces are disabled or sampled outside development.

## 42.3 Performance Targets

Exact hardware targets belong in production planning, but implementation must establish target milliseconds and memory budgets before content scale. A feature that only works in an empty test scene is not complete.

# 43. Failure Handling, Recovery and Safe Degradation

## 43.1 Failure Categories

| Failure | Runtime Response |
|---|---|
| Missing decorative effect | Skip or use neutral fallback; log once per generation. |
| Missing critical cue | Use protected default cue and raise release-blocking diagnostic. |
| Invalid graph product | Refuse load; retain prior registry generation. |
| Audio stream fails | Use alternate layer/source or caption/indicator equivalent. |
| Pool exhausted | Reduce/aggregate/reject decorative request. |
| Acoustic graph unavailable | Use distance-only spatial profile and outdoor/indoor fallback. |
| Hot reload incompatible | Keep old instances or restart by declared policy. |
| Save record references removed ID | Apply alias/migration/fallback; block load only for essential semantics. |
| Worker job fails | Discard staging result and keep known-good product. |

## 43.2 Logging Policy

Repeated runtime failures are rate-limited and grouped by stable ID. Every log includes registry generation, contract/profile ID and trace ID where available.

## 43.3 Crash Recovery

Editor operations use autosave and staging. Generated products can be deleted and rebuilt. Canonical source is never reconstructed solely from generated runtime files after a crash.

# 44. Staged Implementation Plan

## Phase 0 - Technical Spikes

- Confirm pinned Godot version and plugin architecture.
- Prototype stable registry loading.
- Prototype pooled AudioStreamPlayer3D and MultiMesh voxel burst.
- Verify editor hot reload and headless import.
- Measure baseline CPU/GPU/audio costs.

**Exit:** no blocker prevents the chosen source/runtime split.

## Phase 1 - Source, Schemas and Registry

- Project manifest.
- Stable ID service.
- Core source schemas.
- Generated Resource classes.
- Import/bake staging and atomic registry publication.
- Basic validation and headless CI.

**Exit:** a profile, Sound Event and VFX definition load by stable ID in a packaged test.

## Phase 2 - Event, Context and Spatial Foundation

- Event Gateway.
- Context Packet builder.
- Binding/profile resolver.
- Spatial map runtime and runtime contacts.
- Trace/debug output.

**Exit:** a mining event resolves correct stone/wood responses at the exact impact point.

## Phase 3 - VFX MVP Runtime

- Voxel form cache.
- CPU/MultiMesh burst emitter.
- Basic graph compiler.
- Trails/path pulses.
- Light request service.
- VFX budgets and pooling.

**Exit:** mining, furnace smoke, mana pulse and ward burst run through one service.

## Phase 4 - Audio MVP Runtime

- Sound Event resources.
- Source/variation/layer playback.
- Central voice manager.
- Spatial profiles and buses.
- Loop ownership and virtualisation.
- Captions/critical equivalents.

**Exit:** footsteps, impacts, furnace lifecycle and ward warning are stable under repetition.

## Phase 5 - Material, State and Composition

- Material Response Table.
- State channels and parameter updates.
- Wetness/environment variants.
- Accessibility and quality selection.
- Resolver caching.

**Exit:** shared profiles combine active, damaged, wet and magical states without duplicate loops.

## Phase 6 - Acoustics, Ambience and Surfaces

- Authored acoustic zones/portals.
- Indoor/outdoor and reverb routing.
- Ambience layers and rain contact aggregation.
- Surface presentation service.

**Exit:** cottage/cave/workshop transitions and persistent scorch/wetness work in the Forest Hamlet scene.

## Phase 7 - Editor and Test Laboratory

- Shared Presentation Forge screen.
- Spatial and graph/audio editors.
- Capture/replay.
- Scenario runner.
- Validation/repair panels.
- Bake/hot-reload workflow.

**Exit:** a creator can author, preview, validate, bake and verify without manual scene wiring.

## Phase 8 - Networking, Saves and Scale

- Event replication and prediction.
- Join-in-progress reconstruction.
- Persistent surface records.
- Dense village/factory aggregation.
- Split-screen listener policy.

**Exit:** multiplayer and save/load tests pass the full MVP scenario.

## Phase 9 - Production Hardening

- Performance tuning and optional GDExtension hot paths.
- Content-pack security/compatibility.
- CI release gates.
- Migration suite.
- Documentation and onboarding.

**Exit:** Presentation Forge is ready for broad content production.

# 45. Forest Hamlet MVP Technical Scope

## 45.1 Required Systems

| Scenario | Technical Proof |
|---|---|
| Mining Impact | Runtime contact, material query, profile resolution, seeded variation, voxel debris, sound, cave acoustics and budget trace. |
| Footsteps | Animation event, ground material, wetness, cooldown/de-duplication, audio/VFX response and accessibility caption option. |
| Furnace Lifecycle | Start/work/blocked/damaged/stop ownership, smoke, embers, light, loop phase, aggregation and hot reload. |
| Mana Conduit | Path mapping, flow parameter, segmented voxel pulse, hum, overload state and LOD. |
| Ward | Critical warning, charge/breach events, boundary path, protected cue and multiplayer authority. |
| Rain and Shelter | Weather volume, sampled surface contacts, cottage acoustic zone, sound portal and indoor snapshot. |
| Village Ambience | Region-level ambience, nearby individual actions, voice/concurrency management and density fallback. |
| Goblin Raid | Warning, creature telegraphs, impacts, magic, critical priorities, capture/replay and stress budgets. |

## 45.2 MVP Runtime Limits

The MVP may use:

- Authored acoustic zones rather than fully procedural zoning.
- CPU/MultiMesh VFX for most effects with one approved GPU weather/volume spike.
- A small material family table.
- Limited content-pack support.
- One primary listener with split-screen interfaces present but not fully tuned.
- GDScript implementations unless profiling proves a native requirement.

## 45.3 MVP Acceptance Run

The acceptance scene runs for at least several minutes through normal and worst-case modes. It must demonstrate:

- No unbounded growth in Nodes, voices, particles, lights or surface records.
- Stable start/update/stop ownership.
- Correct fallbacks when anchors/materials/context are missing.
- Accessibility alternatives under reduced motion/flash/audio.
- Hot reload without corrupting active gameplay state.
- Save/load reconstruction of persistent surface evidence.
- Authoritative multiplayer event replay where included.

# 46. Risk Register and Redesign Triggers

| Risk | Early Warning | Mitigation | Redesign Trigger |
|---|---|---|---|
| Editor tool fragmentation | Different panels write incompatible data or bypass command/history. | Shared editor services and schemas from Phase 1. | Two workflows require separate canonical identities for the same asset. |
| Graph runtime cost | CPU update time grows faster than active cells. | Compiler optimisation, batching, LOD, backend selection. | MVP worst-case cannot meet budget after measured optimisation. |
| Too many scene Nodes | Pool counts and tree updates dominate. | MultiMesh/server-level batching and logical instance records. | Stable scene still exceeds Node/update budget at target density. |
| Audio voice explosion | Dense machines/raid steal critical cues. | Central concurrency, aggregation and critical reservation. | Critical cues cannot be protected without redesigning bus/voice model. |
| Fragile hot reload | Active loops/effects corrupt after product changes. | Generation handles, compatibility classes and rollback. | Registry swaps require full game restart for ordinary content changes. |
| Acoustic complexity | Dynamic voxel rooms cause expensive rebuilds. | Authored zones first, incremental background analysis, conservative fallback. | Local building edits repeatedly exceed background budget. |
| Save bloat | Persistent marks grow without bound. | Sparse chunk records, expiry, merge and significance thresholds. | Representative long save exceeds allocated presentation record budget. |
| Engine upgrade breakage | Plugins/importers fail on minor updates. | Pinned version, upgrade branch, interface wrappers and tests. | Repeated upgrades require rewriting canonical source or public IDs. |
| AI-generated inconsistency | Summer Engine creates cross-module code without tests. | Small tasks, fixtures, diff review and ownership. | AI changes cannot be reviewed or reproduced from repository state. |
| GDScript hot path limits | Profiler shows sustained resolver/simulation bottleneck. | Cache, batch, reduce allocations, then GDExtension. | Measured target cannot be reached with architecture-preserving optimisation. |

# 47. Definition of Done and Acceptance Matrix

## 47.1 Foundation Acceptance

- Canonical source and generated runtime products are visibly separate.
- Every runtime definition resolves by stable ID and registry generation.
- The bake pipeline is deterministic, incremental and atomically published.
- Invalid source cannot silently enter a shipping registry.
- The packaged game loads required products without editor-only source.

## 47.2 Runtime Acceptance

- Events and states resolve through declared contracts and Context Packets.
- Audio/VFX/light/surface commands use central services and ownership keys.
- Pools return all resources after lifecycle completion.
- Critical cues survive budgets and accessibility settings through declared equivalents.
- Dense scenes reduce/aggregate/virtualise predictably.
- Debug traces identify profile, variant, spatial mapping, fallback and cost.

## 47.3 Integration Acceptance

- Blocks, items, entities, machines, magic, structures, weather and combat use the same spatial/event interfaces.
- Multiplayer replicates compact authority rather than decorative instances.
- Save/load reconstructs persistent evidence and continuous state.
- Hot reload can update common content safely with rollback.
- Test Laboratory replay uses production runtime services.

## 47.4 Engineering Acceptance

- CI performs headless import, bake, tests and packaged smoke load.
- Engine/plugin versions and dependency licences are recorded.
- Performance counters and worst-case scenarios exist before broad content production.
- Summer Engine output is reviewed, tested and not required at runtime.
- Optional native modules are justified by profiler evidence and have fallback/build documentation.

## 47.5 Completion Rule

**Document 23I is implemented successfully not when Godot can spawn one particle and play one sound, but when the complete source-to-runtime chain is stable, inspectable, bounded, accessible, hot-reloadable, testable and shared across the Forest Hamlet presentation scenarios.**

# 48. Relationships With 23J and Future Systems

Document 23J owns the production-facing registries, default library targets, asset intake, provenance, naming catalogues, content status, QA workflow, migration rollout and packaging checklists. This document owns the engine and tool architecture that makes those production processes enforceable.

Future dialogue, music, cinematics and haptics should attach through Presentation Profiles, Event Contracts, buses, spatial references, budgets and accessibility equivalents rather than bypassing the shared core.

The wider game technical plan remains authoritative for world chunks, entities, saves, multiplayer transport, combat and gameplay simulation. Presentation Forge integrates through explicit adapters and must not duplicate those systems.

# Appendix A. Recommended Godot Addon and Runtime Module Map

```text
addons/leyforge_presentation/
  plugin.cfg
  plugin.gd
  editor/
    presentation_main_screen.gd
    project_context.gd
    selection_context.gd
    command_bus.gd
    history_service.gd
    library_dock.gd
    dependency_dock.gd
    diagnostics_dock.gd
    spatial/
    profiles/
    vfx/
    audio/
    acoustics/
    test_lab/
  importers/
    profile_importer.gd
    spatial_importer.gd
    vfx_importer.gd
    graph_importer.gd
    sound_importer.gd
    material_importer.gd
    acoustic_importer.gd
  compiler/
    dependency_graph.gd
    graph_compiler.gd
    bake_coordinator.gd
    product_publisher.gd
  schemas/
    schema_registry.gd
    migrations/
  validation/
    validator_registry.gd
    rules/
  shared/
    ids.gd
    manifests.gd
    hashes.gd
    diagnostics.gd

src/presentation/
  presentation_runtime_root.gd
  registry/
  events/
  resolver/
  spatial/
  vfx/
  audio/
  acoustics/
  accessibility/
  budgets/
  replay/
  debug/
```

# Appendix B. Recommended Project Folder Structure

```text
content/
  presentation_source/
    profiles/
    bindings/
    events/
    spatial/
    vfx/
    graphs/
    audio/
    materials/
    acoustics/
    budgets/
    accessibility/
  media_source/
    audio_master/
    voxel_forms/
    surface_masks/
  presentation_generated/
    registries/
    resources/
    graphs/
    meshes/
    audio/
    zones/
    previews/

tests/presentation/
  unit/
  schema/
  compiler/
  integration/
  replay/
  performance/
  accessibility/
  migration/
  fixtures/

tools/presentation/
  ci/
  migration/
  reports/
```

# Appendix C. Core Resource and Record Templates

## C.1 Event Record

```text
PFEventRecord
  contract_handle
  contract_version
  sequence_id
  timestamp
  source_runtime_id
  target_runtime_id
  payload_buffer
  prediction_state
  authority_state
  seed
  trace_id
```

## C.2 Context Packet

```text
PFContextPacket
  availability_bits
  source_material_handle
  target_material_handle
  position
  normal
  velocity
  intensity_band
  environment_flags
  acoustic_zone_handle
  weather_values
  magic_tags
  player_relation
```

## C.3 Presentation Command

```text
PFPresentationCommand
  command_type
  component_definition_handle
  owner_key
  spatial_handle
  parameter_buffer
  priority
  budget_class
  accessibility_flags
  seed
  trace_id
```

## C.4 Active Logical Instance

```text
PFLogicalInstance
  owner_key
  definition_handle
  registry_generation
  lifecycle_state
  start_time
  logical_phase
  parameters
  spatial_handle
  physical_handle_or_none
  virtualised
```

# Appendix D. Runtime Event-to-Presentation Sequence

```text
Gameplay/Machine/Magic System
  emits typed event or state change
        |
PresentationEventGateway
  validates contract and assigns trace
        |
ContextPacketBuilder
  merges payload with safe world/material/spatial queries
        |
PresentationResolver
  selects binding/profile/variant/accessibility/quality
        |
SpatialPresentationResolver
  resolves anchor/path/runtime contact and fallback
        |
PresentationBudgetManager
  admits/reduces/aggregates/virtualises
        |
AudioRuntime / VFXRuntime / LightService / SurfaceService
  executes bounded commands
        |
PresentationDebugService
  records provenance, lifecycle and cost
```

# Appendix E. First-Pass Budget Profiles

Values below are placeholders for profiling rather than final hardware commitments.

| Profile | Intent | Typical Rules |
|---|---|---|
| `budget.presentation.critical` | Boss/ward/overload/player danger. | Reserved voice/light/cue capacity; never fully removed. |
| `budget.vfx.impact_small` | Footsteps and minor hits. | Short lifetime, low cell count, no dynamic shadow. |
| `budget.vfx.machine_standard` | Ordinary active machine. | Aggregates by region at distance; continuous update throttling. |
| `budget.vfx.weather_local` | Rain/snow around player. | Local volume only, sampled contacts, GPU or aggregate tier. |
| `budget.audio.machine_loop` | Repeating machine sound. | Cluster concurrency, phase virtualisation, nearby individual detail. |
| `budget.audio.creature_critical` | Telegraph/attack/voice. | Priority over ambience and ordinary machines. |
| `budget.surface.transient` | Wetness/dust/footprints. | Sparse, expiring, non-save by default. |
| `budget.surface.persistent` | Scorch/corruption/world evidence. | Saved only above significance threshold. |
| `budget.scene.village_dense` | Village plus machines and NPC activity. | Cross-domain caps and region aggregation. |
| `budget.scene.raid_storm` | Worst-case raid during weather. | Protect threats/warnings; aggressively reduce ambience. |

# Appendix F. Test Matrix

| Test | Editor | Headless | Packaged | Multiplayer | Save/Load |
|---|---:|---:|---:|---:|---:|
| Registry load and ID collision | Yes | Yes | Yes | N/A | Yes |
| Graph compile and boundedness | Yes | Yes | Product load | N/A | N/A |
| Mining material response | Yes | Replay | Yes | Yes | N/A |
| Furnace lifecycle and pooling | Yes | Replay | Yes | Yes | Yes |
| Mana path LOD | Yes | Replay | Yes | Yes | Yes |
| Ward critical accessibility | Yes | Replay | Yes | Yes | Yes |
| Acoustic zone/portal transition | Yes | Replay | Yes | Local | Rebuild |
| Hot reload compatibility | Yes | Optional | Dev build | Host/client dev | N/A |
| Persistent surface migration | Yes | Yes | Yes | Authority | Yes |
| Content-pack conflict | Yes | Yes | Yes | Join/load | Yes |
| Dense raid/storm performance | Yes | Benchmark | Yes | Yes | N/A |

# Appendix G. Naming and Coding Conventions

- Runtime classes use a consistent `PF` prefix or project-approved namespace.
- Stable IDs are lowercase dotted namespaces.
- Source schema fields use snake_case.
- Event contracts use past-tense facts or clear lifecycle names: `impact_confirmed`, `processing_started`, `ward_breached`.
- Commands use imperative internal names: `PlayOneShot`, `StartLoop`, `SpawnBurst`.
- Services expose narrow interfaces and avoid direct cross-module Node references.
- Every long-lived allocation has an owner key and release path.
- Every asynchronous job has a generation, cancellation and completion policy.
- Native code mirrors the same public contracts and does not introduce a parallel ID system.

# Appendix H. Migration and Engine-Upgrade Checklist

- [ ] Create version-control branch and backup generated products.
- [ ] Record old/new Godot and addon versions.
- [ ] Reimport all Presentation Forge sources headlessly.
- [ ] Compare deterministic product hashes and explain expected differences.
- [ ] Run schema and migration fixtures.
- [ ] Load base and content-pack registries.
- [ ] Run Forest Hamlet golden replays.
- [ ] Verify audio buses, spatial sound and loop continuity.
- [ ] Verify voxel VFX materials, MultiMesh, GPU particle and shader behaviour.
- [ ] Verify editor gizmos, importers and hot reload.
- [ ] Verify packaged development build.
- [ ] Verify save/load and multiplayer join-in-progress.
- [ ] Profile worst-case raid/storm scene.
- [ ] Retain rollback engine/package until milestone approval.

# Appendix I. Open Questions for Production Planning

1. Which exact Godot 4.x release will be pinned for the first implementation milestone?
2. Which rendering backend and minimum hardware tier will define initial VFX budgets?
3. Will canonical source use JSON, YAML or a mixed schema format across the wider Forge?
4. Which test framework and CI host will be standardised for Godot headless tests?
5. How much of the Presentation Forge editor should live inside Godot versus a companion process?
6. Which audio source formats and loudness standards will be required for production masters?
7. What is the first measured threshold for moving graph execution or audio processing into GDExtension?
8. How will the wider voxel world expose thread-safe material and occupancy snapshots for acoustics and surface effects?
9. Which multiplayer transport/event layer will carry presentation contract records?
10. Which persistent surface states are gameplay-significant enough to enter world saves?
11. What content-pack distribution model will be supported at first release?
12. Which accessibility presets must be validated for every critical cue before content approval?
13. What profiler hardware set will represent low, target and high quality?
14. How long should prior registry generations remain available during editor hot reload and save migration?
15. Which dialogue, music and haptic systems are most likely to attach next so their interfaces can be smoke-tested early?

---

**Document Status:** Version 0.1 - Detailed Design Bible and Engineering Foundation Draft

**Next Document:** 23J - Presentation Forge Asset Libraries, Registries, Production Pipeline, Testing and Migration
