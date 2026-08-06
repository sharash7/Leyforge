# Fantasy Voxel Civilisation Sandbox
## 23E - Presentation Forge
### Voxel Particle Graph, Emitters, Trails, Volumes, Lighting and Simulation
**Version 0.1 - Detailed Design Bible Draft**

A detailed graph, simulation and runtime-behaviour specification for genuine three-dimensional voxel effects, covering graph compilation, node contracts, emitters, voxel forms, movement, trails, beams, volumes, collision, lighting, persistent surface writes, deterministic variation, LOD, pooling, aggregation and Forest Hamlet proof-of-concept behaviour.

*Working design document - Voxel Particle Graph node catalogue, execution model, simulation domains, compiler rules, effect evaluation, runtime budgets and Godot-facing implementation contract*

## Voxel Particle Graph System Statement

| Field | Locked Direction |
| --- | --- |
| Document Scope | Defines the detailed Voxel Particle Graph, its data types, node families, execution domains, emitter lifecycle, spawn logic, voxel-form generation, motion, fields, trails, beams, volumes, collision, material and light outputs, child effects, surface writes, determinism, LOD, aggregation, virtualisation, debugging, validation and MVP node set. |
| Core Philosophy | The graph should provide deep effect authoring without becoming unrestricted visual scripting. It is a bounded, data-driven presentation graph compiled into validated runtime plans that consume authoritative events and state but never own gameplay truth. |
| Fixed Style | Visible effect bodies must remain genuine cubes, cuboids, voxel shards, voxel clusters, voxel-frame forms, segmented paths, voxel surface cells or other clearly voxel-derived three-dimensional forms. Smooth billboard particles, hidden sprite impostors and conventional ribbon rendering are not approved authoring outputs. |
| Graph Direction | Use typed nodes, explicit execution domains, deterministic dependency order, bounded loops, declared maximum counts, compile-time validation and generated runtime plans. The shipped game does not execute an unrestricted editor graph interpreter for every effect instance. |
| Emitter Direction | Emitters are reusable graph resources with explicit start, update, stop, cancel, pause, resume, virtualise and destroy phases. Burst, rate, interval, sequence, path, surface, region, volume and event-driven emitters are supported. |
| Geometry Direction | Particle instances reference shared voxel-form resources or bounded generated forms. Forms may scale, rotate, frame-swap, fragment or remove cells, but they must preserve the fixed voxel language. |
| Motion Direction | Support velocity, acceleration, drag, gravity, buoyancy, attraction, repulsion, orbit, spiral, wind, path following, surface crawling, grid stepping and bounded voxel-field turbulence. Motion can be smooth or stepped, while geometry remains cubic. |
| Trail and Beam Direction | Trails, beams, conduit pulses, ward boundaries and flow effects are built from segmented voxel samples or voxel clusters along declared paths. Sampling, thickness, gaps, corners and LOD are explicit. |
| Volume Direction | Fog, smoke beds, dust clouds, mana fields, corruption pockets and weather cells use bounded voxel volumes with density limits, cell-size policies and camera-independent three-dimensional placement. |
| Collision Direction | Collision is visual and contextual unless gameplay explicitly supplies authoritative results. Graph collision may stop, slide, bounce, stick, fragment, extinguish or spawn presentation-only children, but cannot apply damage or alter gameplay resources. |
| Lighting Direction | VFX may reference bounded light profiles or emit light requests. Light count, shadow use, radius, flicker, importance, accessibility and LOD are explicitly budgeted. |
| Surface Direction | Graphs may request persistent or temporary Surface Presentation Layer writes through validated operations. They do not directly rewrite block textures or create unbounded per-particle save records. |
| Determinism Direction | Randomness uses named seeded streams. Deterministic streams are required for replicated, replayed, procedural-library and migration-sensitive effects; decorative local ambience may use local variation. |
| Performance Direction | Every graph compiles with maximum spawn, live-cell, update, collision, child, light, transparency, trail and surface-write estimates. Runtime budget profiles can scale, aggregate, virtualise or fall back without removing critical cues. |
| Runtime Direction | Godot receives compact compiled graph plans, pooled emitter instances, shared meshes/forms/materials, precomputed curves, bounded buffers and explicit CPU/GPU or worker-thread eligibility metadata. |
| Relationship to 23D | Document 23D defines the VFX Forge authoring product, asset families and workflow. This document defines the actual graph language and simulation behaviour used by those effect assets. |
| Relationship to 23I | This document defines the engine-neutral runtime contract. Document 23I will select concrete Godot classes, storage formats, threading, renderer integration and baking implementation. |
| MVP Direction | The MVP graph must author mining impact, block break, fire and smoke, rain contact, footsteps, furnace operation and blockage, mana conduit flow, ward breach, weapon trail, creature telegraph, construction dust and persistent scorch/wetness using the same bounded node system. |

## Document Purpose

Document 23D establishes the Particle and VFX Forge as a creator-facing system with genuine three-dimensional voxel effects, reusable families, templates, material-driven variation, spatial bindings, presentation profiles, accessibility and performance requirements. This document defines the machinery beneath that authoring experience: the Voxel Particle Graph and the rules by which authored effects become predictable, scalable runtime simulations.

The graph must be expressive enough to create fire, smoke, sparks, debris, splashes, weather, machine exhaust, mana flow, wards, trails, beams, corruption, creature breath and environmental volumes. At the same time, Leyforge cannot allow every effect to become an arbitrary script with hidden loops, unbounded child spawning, expensive collision and inconsistent multiplayer behaviour. A factory town, raid, storm and magical defence event may all occur together. The graph therefore needs explicit types, budgets, lifecycle phases, deterministic order, compile-time analysis and runtime fallbacks.

The player should see coherent cause and effect. A furnace should begin with an ignition burst, settle into a phase-continuous smoke and ember loop, strain when blocked, warn clearly when unsafe and return smoothly to normal when the blockage clears. A mining strike should orient debris from the actual struck face, select forms from the target material, respect wetness and intensity, and disappear cleanly at distance. A mana conduit should pulse along its declared path without pretending that the VFX graph owns mana transfer.

This document is intentionally detailed. It is the source of truth for graph node behaviour, execution order, data contracts and simulation limits. It does not choose the final Godot renderer architecture, shader language or file encoding. Those implementation decisions belong to 23I, but they must satisfy the contracts defined here.

## Engine and Forge Status Note

Leyforge targets Godot, with Summer Engine used as the AI-native development environment. The Voxel Particle Graph should be authored inside the unified Forge and baked into ordinary, reviewable Godot-compatible resources. Shipped effects must not depend on an online AI service or unrestricted editor-only graph execution.

Godot implementation may divide work between CPU simulation, GPU-friendly batches, MultiMesh-style instance rendering, custom rendering servers, worker threads, shaders and pooled scene nodes. This document does not lock one renderer prematurely. It does lock the observable behaviour, safety limits, fixed voxel appearance, deterministic options and data needed so the implementation can change without forcing content authors to rebuild every effect.

## Design Sources

| Source | Relevant Direction | How 23E Uses It |
| --- | --- | --- |
| 00 - Master Game Design Bible | The game is a readable, atmospheric fantasy voxel world with living villages, magic, automation and meaningful consequences. | Requires effects to communicate world state clearly while preserving stylised voxel identity. |
| 03 - Blocks Registry | Blocks expose material families, faces, states, damage, fluids, machine roles and magic roles. | Supplies surface normals, material responses, break forms, face masks and persistent surface targets. |
| 08 - Automation System | Machines require visible power, transport, processing, faults, warnings and scalable near/far simulation. | Requires continuous emitters, path pulses, phase continuity, aggregation and critical warning protection. |
| 09 - Magic System | Mana, runes, wards, rituals, portals and corruption must be physically readable. | Requires path, boundary, volume, pulse, field, breach and persistent-state graph capabilities. |
| 10 - Creatures and Monsters | Creature silhouettes, movement, attacks, phases and telegraphs need readable presentation. | Requires socket emitters, body-region sampling, trails, breath volumes, telegraph boundaries and boss budgets. |
| 11 - Biomes and World Generation | Weather, ambient life, leylines, fluids, seasons and biome states alter presentation. | Requires volume and surface emitters, environmental fields, weather contact and regional aggregation. |
| 12 - Structures | Structures contain blueprint markers, paths, zones, damage, construction and restoration stages. | Requires blueprint-region emitters, construction sequences, acoustic/visual zones and persistent surface writes. |
| 16 - Combat, Gear and Defence | Impacts, blocks, trails, projectiles, telegraphs and status effects require responsive feedback. | Requires event bursts, runtime contact orientation, path history, predicted/confirmed policies and importance classes. |
| 18 - Technical Implementation Plan | Systems must be data-driven, bounded, event-driven, persistent where required and performance-aware. | Locks compilation, deterministic plans, pooling, validation, LOD and safe runtime ownership. |
| 23A - Shared Presentation Foundation | Presentation consumes authoritative events and resolves through profiles, context and budgets. | Defines the graph as a presentation-only component in the wider resolver architecture. |
| 23B - Spatial Attachment System | Anchors, sockets, regions, paths, boundaries, masks, zones and runtime contacts are shared definitions. | Defines every spatial input node and forbids a second VFX-only attachment system. |
| 23C - Events and Bindings | Event contracts, context packets, parameter mappings, channels, priority and lifecycle are versioned. | Defines graph inputs, loop ownership, state updates, cancellation and replicated event handling. |
| 23D - VFX Forge Core | Effect families, forms, palettes, templates, persistent surfaces, accessibility and budgets are authored assets. | Provides the canonical source assets compiled by the graph system defined here. |

## Static Table of Contents

1. Locked Voxel Particle Graph Identity  
2. Approved Direction Summary  
3. Graph Architecture and Authoring Boundaries  
4. Graph Assets, IDs, Versions and Compilation Products  
5. Type System, Pins, Constants and Parameter Domains  
6. Execution Domains, Phases and Evaluation Order  
7. Graph Entry, Context, State and Event Input Nodes  
8. Emitter Lifecycle and Instance Ownership  
9. Spawn Count, Rate, Interval, Burst and Sequence Nodes  
10. Spatial Spawn Shapes, Anchors, Regions, Masks and Volumes  
11. Voxel Forms, Clusters, Shards, Frames and Generated Geometry  
12. Initial Attribute, Orientation, Scale and Variation Nodes  
13. Velocity, Acceleration, Gravity, Drag and Buoyancy  
14. Fields, Wind, Attraction, Repulsion, Orbit and Turbulence  
15. Path Following, Surface Crawling and Grid-Stepped Motion  
16. Trails, Beams, Ribbons Replacement, Boundaries and Flow Paths  
17. Volumetric Voxel Effects, Fog, Smoke Beds and Weather Cells  
18. Collision, Contact, Bounce, Stick, Fragment and Extinguish  
19. Child Emitters, Sub-Effects, Branching and Bounded Recursion  
20. Material, Palette, Emission, Transparency and Dissolve  
21. VFX Lighting, Flicker, Shadows and Light Budget Requests  
22. Surface Presentation Writes, Residue and Persistent Layers  
23. Curves, Time, Sequencing, Delays, Gates and State Machines  
24. Randomness, Seeds, Determinism and Procedural Reproducibility  
25. Composition Channels, Importance, Cancellation and Critical Cues  
26. LOD, Budget Scaling, Aggregation, Virtualisation and Fallbacks  
27. Runtime Evaluation, Pooling, Batching and Update Scheduling  
28. Multiplayer, Prediction, Confirmation, Replay and Late Join  
29. Creator Graph Workspace, Debug Views and Live Inspection  
30. Compiler Validation, Diagnostics, Repair and Migration  
31. Minimum Viable Node Set and Forest Hamlet Graph Library  
32. Worked End-to-End Graph Scenarios  
33. Balancing Rules and Explicit Non-Goals  
34. Open Questions for 23I and Production Testing  
Appendix A. Core Graph Data Templates  
Appendix B. Node Catalogue and Pin Summary  
Appendix C. Execution and Compiler Rules  
Appendix D. Default Graph Templates  
Appendix E. Budget and LOD Profiles  
Appendix F. Validation Codes and Acceptance Checklist

## 1. Locked Voxel Particle Graph Identity

The Voxel Particle Graph is the bounded simulation language used by VFX Forge effects. It converts event, context, state, spatial and material inputs into visual particle instances, segmented paths, volumes, light requests and Surface Presentation Layer operations. It is not a gameplay scripting language, not a general-purpose node editor and not a substitute for authoritative combat, magic, automation or world simulation.

### 1.1 Locked Rule

> Every graph must compile into a bounded presentation plan whose maximum work, outputs, dependencies, lifecycle and fallback behaviour can be inspected before approval.

### 1.2 Identity Layers

| Identity Layer | Design Meaning | Player-Facing Result |
| --- | --- | --- |
| Typed authoring language | Nodes expose known inputs, outputs and legal connections. | Effects behave consistently and errors are found before runtime. |
| Voxel simulation | Visible bodies are three-dimensional voxel-derived forms. | Fire, smoke, trails and magic remain part of Leyforge's art style. |
| Contract consumer | Graphs read event and state data supplied by other systems. | VFX reflects real outcomes without inventing gameplay. |
| Bounded runtime plan | Counts, loops, collision, children and lights have declared limits. | Dense scenes remain scalable and predictable. |
| Context resolver | Materials, surfaces, intensity, environment and state shape the output. | One family can produce coherent variants across the world. |
| Deterministic option | Named random streams and fixed evaluation order support replay and replication. | Important effects can be reconstructed consistently. |
| Accessibility-aware | Critical cues retain form under reduced motion, flash and colour settings. | Players do not lose necessary information when effects are simplified. |
| Tooling foundation | Graphs expose debug traces, previews, costs and diagnostics. | Creators can understand why an effect looks or performs a certain way. |

### 1.3 What the Graph Is Not

- It is not allowed to apply damage, status effects, knockback, mana cost, inventory changes or world transactions.
- It is not an unrestricted scripting environment with arbitrary code execution.
- It is not a reason to author every effect as a unique graph; families and templates remain preferred.
- It is not a hidden billboard system disguised behind voxel colours.
- It is not a promise that every particle uses collision, dynamic light or per-frame scripting.
- It is not a replacement for animation, shader, material, world weather or gameplay systems.
- It is not required to preserve every decorative particle at all distances or performance levels.

## 2. Approved Direction Summary

| Area | Locked Decision |
| --- | --- |
| Graph model | Directed, typed, mostly acyclic dataflow graph with explicit bounded feedback constructs only where approved. |
| Compilation | Editor graphs compile into compact runtime plans with resolved resources, flattened constants, precomputed curves and validated maximum costs. |
| Runtime interpretation | Runtime may evaluate compact op lists or specialised plans, but does not load the full editor graph UI model for every instance. |
| Node extensibility | New node types require registered schemas, versioning, validation, cost metadata and migration rules. Content packs may not inject arbitrary executable code through graph assets. |
| Event entry | Graphs start from Presentation Profile dispatch, contract events, loop ownership or explicit preview invocation. |
| State update | Continuous effects receive bounded state snapshots or changed parameters rather than reading arbitrary scene objects every frame. |
| Particle identity | Each live particle instance stores only fields used by its compiled plan. Unused fields are omitted from runtime buffers. |
| Maximum counts | Every emitter declares hard and preferred maxima. Unknown or unbounded counts block approval. |
| Geometry | Shared voxel-form resources are preferred. Procedural generation is bounded and can be baked or cached. |
| Curves | Curves are named resources or embedded bounded samples compiled into lookup tables. |
| Randomness | Random streams are named and seeded by effect instance, event, emitter and optional particle index. |
| Collision | Optional and budgeted. Use analytical bounds, voxel-world queries or simplified surfaces according to profile. |
| Child effects | Allowed through bounded child links and depth limits. Unbounded recursive spawning is forbidden. |
| Trails | Segmented voxel samples replace conventional smooth ribbons. |
| Volumes | Use finite grids, sparse cells or stochastic samples with explicit density and bounds. |
| Lighting | Effects request lights through profiles; the renderer/budget manager may merge, reduce or deny decorative lights. |
| Persistent writes | Use validated Surface Presentation Layer requests with merge, expiry and save rules. |
| Critical cues | Protected from decorative budget exhaustion; may fall back to static segmented forms or indicators. |
| Authoring | Graph workspace includes node search, templates, live values, cost heat maps, deterministic replay and side-by-side LOD comparison. |
| MVP | Approximately 45-60 core nodes plus reusable subgraphs are sufficient; advanced fluid, destructive field and large-scale portal nodes can follow later. |

## 3. Graph Architecture and Authoring Boundaries

### 3.1 Layered Graph Model

A VFX effect may contain several linked graph layers rather than one enormous undifferentiated graph.

```text
Effect Definition
  Entry and Lifecycle Graph
  Emitter Graphs[]
    Spawn Graph
    Initialisation Graph
    Update Graph
    Collision/Contact Graph
    Death Graph
  Path or Volume Graphs[]
  Light Request Graph
  Surface Write Graph
  Child Effect Links[]
  LOD and Accessibility Overrides
```

The creator sees these layers in one workspace, but the compiler can analyse and schedule them separately.

### 3.2 Why Layers Are Required

- Spawn logic runs at different frequency from particle updates.
- Collision logic should not execute when collision is disabled by LOD.
- Surface writes need stricter validation and persistence rules.
- Light requests are governed by a separate world budget.
- Path and volume systems may use aggregate data rather than one record per visible cell.
- Accessibility variants may replace only motion-heavy or flash-heavy layers.
- Compiler diagnostics are clearer when ownership is explicit.

### 3.3 Legal Graph Boundaries

| Boundary | Allowed | Not Allowed |
| --- | --- | --- |
| Gameplay | Read contract payloads, state snapshots and semantic IDs. | Directly mutate gameplay components or call arbitrary gameplay methods. |
| Spatial | Resolve shared anchors, regions, masks, paths and runtime contacts. | Create private unregistered sockets that other Forge modules cannot inspect. |
| Assets | Reference approved forms, materials, palettes, curves, grammars and child effects. | Load arbitrary files by operating-system path at runtime. |
| Time | Use effect-local time, particle age, sequence time and supplied world time. | Pause or accelerate authoritative world simulation. |
| Randomness | Use graph-owned seeded streams. | Use hidden global random calls that break replay. |
| Persistence | Request validated surface layers or reconstructible loops. | Save every decorative particle as an independent world object. |
| Networking | Consume replicated semantic events and context. | Send arbitrary network messages or decide authoritative outcomes. |

### 3.4 Subgraphs and Functions

Reusable graph functions are approved for common calculations:

- Map intensity to spawn count.
- Select material debris form.
- Apply surface-normal cone.
- Compute age-normalised values.
- Sample semantic palette roles.
- Apply wind and drag.
- Build stepped pulse timing.
- Convert path distance to segment index.
- Apply standard LOD spawn scaling.
- Generate seeded random orientation.

Subgraphs must declare whether they are pure, stateful, spawn-only, update-only or editor-only. A pure subgraph can be inlined by the compiler. Stateful subgraphs require explicit memory cost.

### 3.5 Bounded Feedback

General graph cycles are forbidden. Approved feedback constructs include:

- Previous-frame value with fixed one-frame delay.
- Accumulator with declared min/max clamp.
- Integrator used by motion nodes.
- Fixed-size trail history.
- Fixed-count sequence iterator.
- State machine with finite states and no dynamic state creation.

Any feedback node must declare memory size, reset behaviour, virtualisation behaviour and deterministic order.

## 4. Graph Assets, IDs, Versions and Compilation Products

### 4.1 Stable IDs

Recommended ID forms:

```text
vfx.graph.fire.voxel_flame_base
vfx.graph.smoke.chimney_standard
vfx.graph.impact.material_debris
vfx.graph.flow.mana_conduit_pulse
vfx.graph.boundary.ward_active
vfx.graph.volume.cave_dust_sparse
vfx.graph.surface.scorch_write
vfx.subgraph.motion.wind_drag
vfx.curve.spawn.intensity_standard
```

### 4.2 Graph Record

Each graph asset stores:

| Field Group | Required Content |
| --- | --- |
| Identity | stable ID, display name, namespace, owner pack, version, lifecycle state |
| Role | graph layer, permitted domains, family/category tags, criticality |
| Inputs | event/context/state fields, spatial requirements, material requirements |
| Outputs | particle buffers, path segments, volume cells, lights, surface requests, child events |
| Nodes | node instances, pin connections, constants, comments, groups and editor positions |
| Limits | preferred and hard counts, child depth, light count, collision work, write limits |
| Runtime | compiler version, plan schema, eligibility metadata, fallback plan references |
| Compatibility | required node versions, replaced IDs, migration notes, content-pack rules |
| Validation | current errors, warnings, budget estimates, test scenarios and approval status |

### 4.3 Compilation Products

```text
Editor Graph Source
  -> Schema Validation
  -> Type Resolution
  -> Constant Folding
  -> Resource Resolution
  -> Domain Separation
  -> Dependency Ordering
  -> Cost and Bound Analysis
  -> LOD/Accessibility Plan Generation
  -> Runtime Plan Emission
  -> Test Hash and Bake Record
```

A compiled runtime plan should contain only the fields and operations required by that effect. Unused generic particle attributes are removed.

### 4.4 Plan Variants

One source graph can compile into:

- Full plan.
- Reduced LOD plan.
- Minimal LOD plan.
- Critical-cue-only plan.
- Reduced-motion plan.
- Reduced-flash plan.
- Server/headless validation plan with no rendering.
- Preview instrumentation plan.

Plans share a compatibility signature so the runtime can switch without restarting the whole logical effect where phase continuity is required.

### 4.5 Versioning

Node schemas and runtime plan schemas are versioned separately. A graph records both. Migrations may:

- Rename pins.
- Replace deprecated nodes.
- Insert explicit clamps previously implied.
- Convert curve representations.
- Add new required cost fields.
- Remap spatial-reference types.
- Recompile deterministic stream names.

Migration never silently changes approved visible output without producing a review warning.

## 5. Type System, Pins, Constants and Parameter Domains

### 5.1 Core Value Types

| Type | Purpose |
| --- | --- |
| Bool | gates, state checks, enabled flags |
| Int | counts, indices, discrete tiers |
| Float | rates, ratios, distances, time, scalar parameters |
| Vec2 | Surface Mask coordinates, two-axis offsets |
| Vec3 | positions, directions, velocity, scale |
| Quaternion/Rotation | orientation and angular state |
| ColourRole | semantic palette reference rather than raw colour where possible |
| MaterialRole | semantic effect material selection |
| TimeValue | seconds or normalised age with explicit domain |
| CurveRef | typed curve resource |
| RandomStream | named deterministic or local stream handle |
| SpatialRef | anchor, socket, region, path, boundary, mask, zone or runtime contact |
| VoxelFormRef | shared or generated voxel geometry resource |
| SurfaceContext | material, face, normal, wetness, heat, damage and biome data |
| EventContext | validated Presentation Context Packet subset |
| ParticleHandle | internal particle record reference, not storable outside its domain |
| EmitterHandle | lifecycle reference for child and control nodes |
| LightProfileRef | bounded light request profile |
| SurfaceLayerRef | approved persistent/temporary surface-layer definition |

### 5.2 Typed Pins

Pins declare:

- Type.
- Required or optional status.
- Default value.
- Allowed range.
- Unit.
- Domain availability.
- Whether constant-only is required.
- Whether deterministic mode forbids local variation.

Implicit conversions are limited. Approved examples include Int to Float and semantic colour role to resolved colour. Vec3 to direction requires explicit normalisation. Float to count requires an explicit rounding node.

### 5.3 Units

Values should use explicit units:

| Unit | Examples |
| --- | --- |
| Seconds | lifetime, delay, interval |
| Metres | distance, radius, path length |
| Metres per second | velocity |
| Metres per second squared | acceleration and gravity |
| Degrees or radians | angles, angular velocity |
| Particles per second | continuous spawn rate |
| Cells per cubic metre | volume density |
| Normalised ratio 0-1 | age, heat, charge, health-like presentation ratios |
| Luminous presentation unit | Forge-defined bounded light intensity, mapped later by 23I |

The editor displays friendly units while the runtime plan uses standardised values.

### 5.4 Parameter Domains

Parameters can be marked:

- Constant at compile time.
- Constant per effect instance.
- Constant per emitter instance.
- Sampled per particle at spawn.
- Updated per particle.
- Updated only on state change.
- Updated at reduced frequency.
- Derived from context.

This prevents expensive per-particle evaluation when one value could be resolved once per effect.

### 5.5 Range and Clamp Rules

Every externally mapped parameter requires:

- Expected minimum and maximum.
- Default.
- Clamp or rejection policy.
- Missing-input fallback.
- NaN/infinite handling.
- Smoothing policy if updated continuously.

Unchecked external floats cannot directly drive spawn counts, light intensity or child count.

## 6. Execution Domains, Phases and Evaluation Order

### 6.1 Domains

| Domain | Frequency | Typical Nodes |
| --- | --- | --- |
| Compile | editor/bake only | resource resolution, constant generation, bound analysis |
| Effect Start | once per effect start | seed creation, spatial resolution, initial child dispatch |
| Emitter Start | once per emitter | local buffers, loop phase, initial burst |
| Spawn | once per spawned particle/cell | position, velocity, form, lifetime, palette variation |
| Particle Update | per scheduled update | motion, age, material, frame, scale, death test |
| Collision | only when a contact occurs | bounce, stick, fragment, child impact |
| Particle Death | once on removal | final child, surface request, release resources |
| Effect State Change | when mapped state changes | rate, intensity, mode or warning transitions |
| Path Update | on path/state changes or schedule | samples, pulses, segment visibility |
| Volume Update | bounded tick | density redistribution, drift, cell birth/death |
| Light Update | bounded tick | intensity, position, merge request |
| Surface Write | validated request time | temporary or persistent layer operation |
| Virtualised Update | low-frequency or analytical | phase, aggregate age, important state only |
| Effect Stop | once | graceful stop, cancellation, final fade, pool return |

### 6.2 Evaluation Order

Within a simulation step:

1. Apply queued contract and state updates.
2. Resolve effect lifecycle transitions.
3. Resolve changed spatial references if allowed.
4. Update emitter controls and spawn budgets.
5. Spawn new particles/cells.
6. Initialise new records.
7. Update existing records in stable emitter order.
8. Process collision results.
9. Process death and bounded child requests.
10. Update paths, volumes, lights and surface requests.
11. Apply budget manager decisions.
12. Submit render data.
13. Record debug metrics and replay data where enabled.

### 6.3 Fixed and Variable Steps

The graph supports:

- Variable visual step for ordinary decorative motion.
- Fixed simulation step for deterministic or collision-sensitive effects.
- Reduced-frequency step for distant or virtualised effects.
- Analytical age advancement for simple ballistic or loop phase effects.

Effects declare their preferred step mode. The budget manager may reduce frequency only where the plan provides a compatible fallback.

### 6.4 Pausing and Time Sources

Possible time sources:

- Effect-local scaled time.
- Unscaled presentation time.
- World simulation time.
- Animation synchronisation time.
- Replay time.

An effect must declare which source it uses. UI pause, game pause, multiplayer pause and photo mode may treat sources differently. Critical network warnings should not accidentally freeze because a local cosmetic time source paused.

## 7. Graph Entry, Context, State and Event Input Nodes

### 7.1 Entry Nodes

| Node | Purpose |
| --- | --- |
| Effect Started | Begins one-shot or loop setup. |
| Effect Stopping | Begins graceful stop behaviour. |
| Effect Cancelled | Handles immediate or priority cancellation. |
| State Changed | Runs when a mapped state field changes beyond its policy threshold. |
| Event Received | Reads validated event payload values for the current dispatch. |
| Preview Started | Editor-only entry with synthetic context. |
| Replay Marker | Editor/runtime-debug entry when a captured trace reaches a marker. |

### 7.2 Context Readers

Typed readers expose only fields declared by the graph contract:

- Source and target semantic IDs.
- Source and target material family.
- Action type.
- Intensity.
- World position and surface normal.
- Struck voxel and face.
- Movement speed and weight class.
- Biome, weather and wetness.
- Temperature and heat ratio.
- Magic school, purity and corruption.
- Damage or status presentation type.
- Listener distance class.

A graph cannot request fields not declared in its manifest without a compile warning or error.

### 7.3 State Readers

State input nodes support:

- Current value.
- Previous value.
- Changed flag.
- Rising/falling edge.
- Threshold crossing.
- Time since change.
- Smoothed value.
- Quantised tier.

For example, `state.machine.heat_ratio` may feed a smooth smoke-density curve while `state.machine.blocked` creates a discrete channel transition.

### 7.4 Spatial Input Nodes

- Resolve Anchor.
- Resolve Socket.
- Resolve Region.
- Resolve Surface Mask.
- Resolve Path.
- Resolve Boundary.
- Resolve Zone.
- Read Runtime Contact.
- Read Surface Normal.
- Read Local Basis.
- Resolve Fallback Chain.

Resolution failures follow Document 23B rules. A graph may declare a required spatial reference or a permitted approximation.

### 7.5 Material and Surface Readers

Surface context can provide:

- Material family and tags.
- Hardness and brittleness presentation values.
- Wetness, frost, soot or corruption layers.
- Surface orientation.
- Exposure to sky.
- Fluid contact.
- Heat state.
- Current damage state.

These are read-only presentation values or authoritative context supplied by the world.

## 8. Emitter Lifecycle and Instance Ownership

### 8.1 Emitter Types

| Type | Description |
| --- | --- |
| One-shot burst | Spawns a bounded set and finishes. |
| Continuous rate | Spawns over time while active. |
| Interval pulse | Spawns at fixed or varied intervals. |
| Timed sequence | Executes a finite list of phases. |
| Event-reactive | Spawns when a child event or state edge arrives. |
| Path emitter | Spawns along a path or moving distance. |
| Surface emitter | Spawns from exposed faces or a Surface Mask. |
| Region emitter | Samples a voxel region. |
| Volume emitter | Maintains bounded density in a zone. |
| Contact emitter | Uses a runtime impact/contact packet. |
| Aggregate emitter | Represents many distant or repeated sources with one grouped output. |

### 8.2 Lifecycle States

```text
Dormant -> Starting -> Active -> Stopping -> Finished
                     \-> Paused
                     \-> Virtualised
                     \-> Cancelled -> Finished
```

### 8.3 Start Policies

- Start immediately.
- Start after delay.
- Start at animation/event marker.
- Start when state enters condition.
- Start when spatial reference resolves.
- Start when within presentation range.
- Start synchronised to supplied phase.

### 8.4 Stop Policies

| Policy | Behaviour |
| --- | --- |
| Immediate | Remove live particles and release resources. |
| Stop spawning | Existing particles finish naturally. |
| Fade | Stop spawning and scale visibility over bounded time. |
| Collapse | Pull cells toward anchor or path before removal. |
| Convert | Replace loop with a finishing effect. |
| Virtualise | Preserve logical phase without visible instances. |

### 8.5 Ownership

An emitter instance is owned by one effect instance or one aggregate manager. It cannot outlive its owner unless explicitly detached through a bounded child effect. Detached children receive their own lifecycle and budget record.

### 8.6 Loop Phase

Continuous machine, fire, conduit and ambient effects store phase independently from render visibility. When virtualised or culled, phase may advance analytically. On return, the effect resumes in a visually plausible state instead of restarting every loop.

### 8.7 Instance Limits

Each emitter declares:

- Preferred live count.
- Hard live count.
- Preferred spawn rate.
- Hard spawn rate.
- Maximum lifetime.
- Maximum children per particle.
- Maximum detached children.
- Maximum light requests.
- Maximum surface writes.

Exceeding a hard bound is a validation failure, not a normal runtime strategy.

## 9. Spawn Count, Rate, Interval, Burst and Sequence Nodes

### 9.1 Count Nodes

- Constant Count.
- Context-scaled Count.
- Curve-mapped Count.
- Material-tier Count.
- Area-scaled Count.
- Path-length Count.
- Density-to-Count.
- Budget-scaled Count.
- Clamped Count.
- Stochastic Rounded Count with deterministic stream.

### 9.2 Burst Node

Inputs:

- Count.
- Delay.
- Distribution window.
- Maximum count.
- Seed stream.
- Importance.

A burst can spread spawns across a short window to avoid one-frame spikes while still reading as a single event.

### 9.3 Rate Node

Inputs:

- Particles per second.
- Start and stop gate.
- Accumulator policy.
- Catch-up limit.
- Budget scale.
- Low-frequency behaviour.

The rate accumulator has a hard catch-up cap. A stalled frame cannot cause thousands of delayed particles to spawn at once.

### 9.4 Interval Pulse Node

Supports:

- Fixed interval.
- Seeded random range.
- Curve-based interval.
- State-dependent interval.
- Beat or machine-cycle synchronisation.
- Maximum pulses per update.

### 9.5 Sequence Node

A finite sequence can describe:

```text
Ignition burst
-> 0.15 s ember pulse
-> 0.35 s smoke rise
-> begin operating loop
```

Sequence length is fixed at compile time. Dynamic unbounded arrays are not permitted.

### 9.6 Spawn Suppression

Spawn may be suppressed by:

- LOD plan.
- Budget manager.
- Invisible/occluded policy.
- Missing optional spatial reference.
- Environmental mismatch.
- Reduced-motion profile.
- Aggregate ownership.

Critical-cue graphs must define what remains when decorative spawns are suppressed.

## 10. Spatial Spawn Shapes, Anchors, Regions, Masks and Volumes

### 10.1 Point and Basis Shapes

- Point at anchor.
- Point with local offset.
- Line segment.
- Ray.
- Box.
- Oriented box.
- Sphere sampled in three-dimensional space but rendered only with voxel forms.
- Cylinder.
- Cone.
- Ring sampled as discrete voxel positions.

Analytical shapes define spawn positions only; they do not author smooth visible geometry.

### 10.2 Voxel-Aware Shapes

- Exact voxel cell.
- Voxel face.
- Voxel edge.
- Voxel corner.
- Exposed faces of region.
- Region interior.
- Region boundary.
- Highest/lowest cells.
- Cells matching material tag.
- Newly damaged/removed cells supplied by context.

### 10.3 Surface Mask Sampling

A Surface Mask sampler supports:

- Uniform eligible texel/cell selection.
- Weighted selection.
- Centre-weighted selection.
- Edge-only selection.
- Directional flow map.
- Exclusion zones.
- Minimum separation between samples.
- Stable sample set for loops.

The sampler resolves mask coordinates into local three-dimensional positions and outward directions.

### 10.4 Path Sampling

- By normalised distance.
- By world distance.
- At fixed segment spacing.
- At named path markers.
- At corners or junctions.
- Random along length.
- Moving pulse position.
- From source toward sink.

### 10.5 Region Sampling

Large regions may use:

- Exact cell list for small regions.
- Compressed runs.
- Sparse weighted samples.
- Bounding volume plus rejection mask.
- Precomputed exposed-face cache.

The graph manifest records the expected region scale and whether runtime changes are allowed.

### 10.6 Runtime Contact Sampling

A contact spawn uses:

- Contact world position.
- Surface normal.
- Tangent basis.
- Penetration or intensity.
- Target material.
- Struck voxel/face where available.
- Relative velocity.

The surface-normal cone node is the default orientation source for debris and impact bursts.

## 11. Voxel Forms, Clusters, Shards, Frames and Generated Geometry

### 11.1 Form Types

| Form | Typical Use |
| --- | --- |
| Single cube | mote, spark, droplet, ember |
| Cuboid | streak, shard, rain cell, beam segment |
| Voxel cluster | flame, smoke puff, dust clump, magical burst |
| Voxel plate | surface flake, rune fragment, frost piece |
| Frame sequence | flame shape change, portal fragment, unstable crystal |
| Generated fragment | debris derived from material grammar |
| Compound form | central cluster plus orbiting child cells |

### 11.2 Shared Form References

Shared forms are preferred because they:

- Batch efficiently.
- Maintain family identity.
- Support consistent LOD.
- Reduce content duplication.
- Allow material/palette substitution.

### 11.3 Generated Forms

Procedural generation may produce:

- Random cuboid dimensions within bounded cells.
- Seeded cluster occupancy.
- Material-specific shard ratios.
- Surface flakes.
- Segmented arc pieces.
- Sparse smoke clusters.

Generated forms must use a declared grammar, maximum cell count and deterministic seed where reproducibility matters.

### 11.4 Cell Removal and Dissolve

Voxel dissolve can remove cells by:

- Random seeded order.
- Outside-in.
- Inside-out.
- Top-down.
- Directional plane.
- Material-role priority.
- Surface exposure.

The runtime may use an occupancy mask, frame swap or material discard depending on implementation, but the visible result remains cell-based.

### 11.5 Form LOD

| LOD | Form Policy |
| --- | --- |
| Full | Complete cluster or frame sequence. |
| Reduced | Fewer cells, larger representative cells, simplified frame count. |
| Minimal | Single cube/cuboid or tiny cluster preserving silhouette. |
| Critical | Static segmented indicator or bounded pulse. |
| Hidden | Decorative-only output removed. |

### 11.6 Orientation Rules

Forms may orient to:

- World axes.
- Emitter local basis.
- Velocity direction.
- Surface normal.
- Path tangent.
- Camera-independent fixed orientation.
- Random seeded cube rotation.

Camera-facing billboarding is not an approved form orientation. Limited camera-aware LOD may select between pre-authored three-dimensional orientations only if the result remains genuine 3D voxel geometry.

## 12. Initial Attribute, Orientation, Scale and Variation Nodes

### 12.1 Initial Attributes

Common fields:

- Position.
- Velocity.
- Acceleration.
- Rotation.
- Angular velocity.
- Scale.
- Lifetime.
- Form reference.
- Palette/material role.
- Emission multiplier.
- Collision mode.
- Importance.
- Seed.
- User-defined compact fields.

### 12.2 Variation Nodes

- Random Range Float.
- Random Range Int.
- Random Direction in Cone.
- Random Cube Rotation.
- Weighted Choice.
- Shuffle Bag.
- Repeat Avoidance.
- Per-Emitter Variation.
- Per-Particle Variation.
- Context-conditioned Choice.

### 12.3 Scale

Scale can use:

- Uniform scalar.
- Per-axis cuboid scale.
- Discrete cell-size tiers.
- Curve over life.
- Step curve.
- Context intensity.
- LOD override.

Extremely small sub-pixel forms at intended gameplay distance should fail readability validation.

### 12.4 Lifetime

Lifetime sources include:

- Constant.
- Random bounded range.
- Form-dependent.
- Velocity/distance-dependent.
- Environment-dependent.
- State-controlled loop ownership.

No particle may have an unbounded lifetime unless it belongs to a managed persistent loop or volume with explicit ownership.

### 12.5 Orientation from Contact

For impacts:

```text
Forward = surface normal
Right/Up = stable tangent basis from normal + seed
Velocity cone = forward +/- spread angle
```

This produces consistent outward debris even when the same block face is struck from different directions.

## 13. Velocity, Acceleration, Gravity, Drag and Buoyancy

### 13.1 Velocity Nodes

- Constant Velocity.
- Direction * Speed.
- Surface-normal Cone Velocity.
- Path-tangent Velocity.
- Radial Outward Velocity.
- Radial Inward Velocity.
- Inherit Source Velocity.
- Relative Impact Velocity.
- Seeded Scatter.

### 13.2 Acceleration

- Constant Acceleration.
- Gravity Profile.
- Local Gravity Direction.
- Directional Push.
- Heat Rise.
- Mana Lift.
- Context Wind Acceleration.

### 13.3 Drag

Drag profiles:

- Linear drag.
- Quadratic approximation.
- Axis-specific drag.
- Environment-based drag.
- Age-based drag.

Smoke and mist may use high drag and buoyancy. Metal shards use lower drag and stronger gravity.

### 13.4 Buoyancy

Buoyancy can depend on:

- Heat ratio.
- Particle material role.
- Environment fluid/air state.
- Age.
- Volume density.

It is a visual motion rule and does not simulate actual thermodynamics.

### 13.5 Integration

Approved integrators:

- Semi-implicit Euler for ordinary particles.
- Analytical ballistic step for simple gravity.
- Fixed-step integrator for deterministic collision effects.
- Stepped/grid movement for stylised magic.

The compiled plan records the chosen method.

## 14. Fields, Wind, Attraction, Repulsion, Orbit and Turbulence

### 14.1 Field Nodes

| Field | Use |
| --- | --- |
| Directional wind | rain, smoke, leaves, ash |
| Point attraction | mana motes, ritual convergence |
| Point repulsion | explosion, ward impact |
| Line attraction | conduit flow, beam support |
| Plane push | shockwave, portal expulsion |
| Vortex | magical spiral, smoke curl |
| Noise/turbulence | fire, dust, corruption |
| Flow field | water spray, environmental drift |

### 14.2 Voxel Turbulence

Voxel turbulence should be bounded and reproducible. It may use:

- Precomputed 3D noise tiles.
- Seeded hash field.
- Low-frequency curl-like field.
- Grid-step direction changes.
- Region-authored vector cells.

The field resolution and sample frequency are budgeted. Per-particle high-cost procedural noise is not assumed.

### 14.3 Wind Integration

World weather supplies a simplified wind vector and optional gust parameter. Effects map it through a response coefficient. A stone shard barely responds; smoke and leaves respond strongly.

### 14.4 Attraction and Orbit

Orbit nodes define:

- Centre spatial reference.
- Axis.
- Radius.
- Angular speed.
- Radial drift.
- Phase.
- Lifetime exit policy.

Used for mana motes, spell charge and portal fragments. Orbit cannot create unbounded persistent particles.

### 14.5 Field Volumes

Fields may be limited to:

- Sphere/box volume.
- Shared region.
- Path corridor.
- Boundary shell.
- Blueprint zone.

Particles outside the field skip its evaluation.

## 15. Path Following, Surface Crawling and Grid-Stepped Motion

### 15.1 Path Following

A path follower stores:

- Current distance.
- Speed.
- Direction.
- Loop/clamp/bounce policy.
- Branch selection at junctions.
- Tangent and normal basis.
- Offset from path.

### 15.2 Junction Rules

At path junctions, selection may be:

- Explicit route from context.
- Highest-priority output.
- Weighted seeded choice.
- Flow-ratio distribution supplied by gameplay.
- Stop at fault junction.

VFX does not decide real item or mana routing; it visualises supplied state or a decorative route.

### 15.3 Surface Crawling

Used for frost, corruption motes, sparks and magical traces. A crawler may:

- Move across connected voxel faces.
- Prefer material tags.
- Avoid excluded masks.
- Follow gradient supplied by a surface layer.
- Stop at region boundary.
- Leave bounded temporary surface cells.

### 15.4 Grid-Stepped Motion

Grid-stepped motion updates position in discrete increments:

```text
accumulate travel distance
when threshold reached:
  move one effect cell along chosen axis/direction
  optionally rotate or frame-swap
```

This is useful for rune pulses, digital-magical effects and intentionally blocky lightning.

### 15.5 Path Resampling

Paths that change at runtime are resampled only when:

- Topology changes.
- Length changes beyond threshold.
- Owner asset changes LOD mapping.
- Explicit refresh event occurs.

Constant per-frame full-path rebuilding is not the default.

## 16. Trails, Beams, Ribbons Replacement, Boundaries and Flow Paths

### 16.1 Segmented Trail Rule

> Leyforge trails are ordered three-dimensional voxel segments or clusters. They are not smooth camera-facing ribbons.

### 16.2 Trail Sources

- Two attachment points such as blade root and tip.
- Single moving socket history.
- Projectile path.
- Creature tail/wing path.
- Runtime contact chain.
- Authored blueprint path.

### 16.3 Trail History

A trail buffer declares:

- Maximum samples.
- Sample distance or time.
- Minimum motion threshold.
- Teleport break threshold.
- Lifetime per sample.
- Interpolation policy.
- LOD sample reduction.

### 16.4 Segment Construction

Segments may be:

- Cuboids between samples.
- Discrete cubes at samples.
- Cluster stamps along distance.
- Alternating gaps and cells.
- Tapered cell-size tiers.

Corners remain segmented and readable.

### 16.5 Beams

Beam graph fields:

- Start and end spatial references.
- Maximum range.
- Segment length.
- Thickness tier.
- Jitter/turbulence.
- Pulse speed.
- Branch count and depth.
- Impact child.
- Occlusion presentation policy.

Gameplay supplies authoritative beam hit or target information. The VFX beam cannot determine damage.

### 16.6 Ward Boundaries

Boundaries use:

- Ordered boundary path or surface shell.
- Cell spacing.
- Strength/health parameter.
- Fault and breach points.
- Contact ripple distance.
- Protected critical form.

At low LOD, only corners, junctions and breach points may remain.

### 16.7 Flow Paths

Mana, steam, liquid and power flow presentation maps:

- Flow ratio to pulse rate.
- Direction to travel direction.
- Purity/temperature to palette and emission.
- Fault state to gaps or sparks.
- Junction state to local highlights.

### 16.8 Accessibility

Reduced-motion trails may become:

- Static segmented arc.
- Shorter history.
- Lower update rate.
- Ground boundary cells.
- Directional icon/indicator reference through the Presentation Profile.

## 17. Volumetric Voxel Effects, Fog, Smoke Beds and Weather Cells

### 17.1 Volume Model

A volume effect defines a finite region and a bounded representation:

- Dense small grid for tiny effects.
- Sparse cell set.
- Stochastic maintained population.
- Layered slices made of 3D cells, not billboards.
- Aggregate cluster instances.

### 17.2 Volume Fields

| Field | Purpose |
| --- | --- |
| Bounds | finite box, region, zone or path corridor |
| Cell size | minimum visible voxel cell scale |
| Target density | desired cells per volume |
| Maximum live cells | hard limit |
| Birth/death rate | density maintenance |
| Drift | wind, buoyancy or flow |
| Density mask | blocked/allowed subregions |
| Visibility policy | indoor/outdoor, distance, occlusion |
| LOD representation | sparse, clustered, critical-only or hidden |

### 17.3 Fog

Fog uses sparse translucent voxel cells or clusters. It should avoid filling the screen with overlapping alpha. Preferred techniques include:

- Larger cells with low overlap.
- Dithered or stepped opacity.
- Depth-aware density reduction.
- Local pockets rather than uniform global fog.
- Separate world atmospheric fog handled by the renderer where appropriate.

The VFX Forge authors local voxel fog; it does not replace all world fog systems.

### 17.4 Smoke Beds and Dust Clouds

A smoke bed can maintain density near:

- Fire source.
- Collapsed structure.
- Machine hall ceiling.
- Cave floor dust.
- Corruption zone.

Cells age, rise, drift and merge into aggregate clusters. Detailed collision is normally disabled.

### 17.5 Weather Cells

Weather emitters use camera/player-centred bounded zones while respecting world weather truth. They may spawn:

- Rain cuboids.
- Snow cubes/clusters.
- Hail cells.
- Ash and leaves.
- Magical storm motes.

Contact effects are separate and surface-aware. Weather cells do not need to exist across the entire loaded world.

### 17.6 Indoor and Shelter Handling

Weather volume masks may use:

- Sky-exposure queries.
- Blueprint interior zones.
- Roof blockers.
- Sound/acoustic portal data as supporting context.
- Simplified shelter flags.

The result should avoid rain visibly spawning inside sealed rooms while remaining affordable in player-built structures.

## 18. Collision, Contact, Bounce, Stick, Fragment and Extinguish

### 18.1 Collision Modes

| Mode | Use |
| --- | --- |
| None | smoke, distant ambience, most motes |
| Ground plane | simple debris and droplets |
| Simplified world | nearby debris, sparks, rain contacts |
| Voxel query | exact nearby block-face contact |
| Entity bounds | body-contact presentation only |
| Authoritative contact only | effect uses gameplay-supplied contact and does no queries |

### 18.2 Collision Responses

- Kill.
- Stop.
- Bounce.
- Slide.
- Stick.
- Align to surface.
- Fragment.
- Spawn bounded child.
- Change palette/material.
- Request temporary surface layer.
- Extinguish.
- Convert to drip or residue.

### 18.3 Bounce

Bounce uses presentation coefficients from material DNA:

- Restitution.
- Friction.
- Angular scatter.
- Minimum speed before stop.
- Maximum bounce count.

### 18.4 Stick and Align

Useful for:

- Sparks cooling on metal.
- Snow accumulating temporarily.
- Acid/poison droplets.
- Rune fragments.

Stuck particles have a maximum attached lifetime and owner-destruction policy.

### 18.5 Fragmentation

Fragmentation is bounded:

- Maximum fragments.
- Maximum depth one by default.
- Child form grammar.
- Inherited velocity fraction.
- Budget priority.

Recursive fragment explosions are forbidden.

### 18.6 Extinguish and Environment Conversion

Fire/ember particles may convert when entering water or rain-heavy context. Conversion can create:

- Small steam cluster.
- Reduced emission.
- Shortened lifetime.
- Immediate death.

This is visual response only. Actual fire gameplay state is authoritative elsewhere.

### 18.7 Collision LOD

At reduced LOD:

- Disable collision.
- Use ground plane only.
- Evaluate a fraction of particles.
- Replace with one aggregate contact effect.
- Preserve only critical impact contact.

## 19. Child Emitters, Sub-Effects, Branching and Bounded Recursion

### 19.1 Child Triggers

- On spawn.
- At age threshold.
- On interval.
- On collision.
- On death.
- On state transition.
- At path marker.
- At volume threshold.

### 19.2 Child Context

Children may inherit selected fields:

- Position and orientation.
- Velocity.
- Material and surface context.
- Intensity.
- Seed derivation.
- Importance.
- Parent age/phase.

Inheritance is explicit to keep runtime records compact.

### 19.3 Limits

Every child link declares:

- Maximum children per trigger.
- Maximum triggers per parent.
- Maximum depth.
- Cooldown.
- Budget priority.
- Cancellation policy.
- Whether it may detach.

### 19.4 Branch Nodes

Approved branches are condition-based and finite:

- Material tag branch.
- Intensity tier branch.
- Environment branch.
- State branch.
- Random weighted branch.
- Accessibility branch.
- LOD branch.

### 19.5 Sub-Effect Reuse

Common children include:

- Small spark burst.
- Dust puff.
- Steam conversion.
- Impact flash.
- Residue write.
- Final ember.
- Boundary ripple.

These should reference shared effect assets rather than duplicate node groups.

## 20. Material, Palette, Emission, Transparency and Dissolve

### 20.1 Material Roles

Effects reference semantic roles:

```text
core_hot
body_primary
body_secondary
edge_bright
smoke_dense
smoke_faded
mana_pure
warning_critical
corruption_dark
residue_surface
```

The resolved colours/materials may vary by culture, biome, dimension, accessibility and material family.

### 20.2 Palette Nodes

- Resolve Palette Role.
- Gradient Between Roles.
- Step Palette by Age.
- Context Material Palette.
- Heat Palette.
- Purity Palette.
- Corruption Palette.
- Accessibility Palette Override.

### 20.3 Emission

Emission uses bounded multipliers and profiles. It may depend on:

- Age.
- Heat.
- Mana charge.
- Warning pulse.
- Distance LOD.
- Reduced-flash setting.

### 20.4 Transparency

Transparency is allowed but constrained. Nodes may control:

- Opacity over life.
- Stepped opacity tiers.
- Dither threshold.
- Cell removal instead of smooth fade.
- Distance reduction.

Effects should prefer sparse geometry and cell removal over many overlapping translucent cubes.

### 20.5 Dissolve

Dissolve modes:

- Cell mask removal.
- Frame sequence.
- Threshold material.
- Shrink-to-cell.
- Scatter fragments.

A soft sprite fade is not the only approved disappearance method.

### 20.6 Material Batching

Graphs should minimise material variants. The compiler reports:

- Unique material roles.
- Transparency classes.
- Emission variants.
- Light-affecting variants.
- Expected batch breaks.

## 21. VFX Lighting, Flicker, Shadows and Light Budget Requests

### 21.1 Light Requests

A graph may request a light through `LightProfileRef`. It supplies:

- Position/spatial reference.
- Intensity multiplier.
- Radius multiplier.
- Colour role.
- Importance.
- Lifetime.
- Flicker phase.
- Shadow preference.

The central light budget manager may approve, merge, reduce or deny decorative requests.

### 21.2 Light Classes

| Class | Examples | Policy |
| --- | --- | --- |
| Critical | attack telegraph, lethal overload | preserve cue; shadows optional |
| Important | spell cast, ward breach, portal | preserve nearby, reduce at distance |
| Standard | furnace, torch, machine spark | merge/reduce in dense scenes |
| Decorative | tiny ember, ambient mote | usually no independent dynamic light |

### 21.3 Flicker

Flicker should use named deterministic curves or noise streams. Reduced-flash settings limit:

- Peak intensity.
- Frequency.
- Contrast.
- Abrupt transitions.

### 21.4 Shadows

Dynamic shadows are exceptional. Most particle lights should be unshadowed or use shared environmental lighting. Shadow requests require explicit justification and budget class.

### 21.5 Light Aggregation

Dense fire or machine scenes may aggregate multiple requests into spatial clusters. Aggregation preserves:

- Overall area illumination.
- Critical warning lights.
- Major colour identity.
- Smooth entry/exit as clusters change.

### 21.6 Voxel Emission Without Lights

Many effects communicate brightness through emissive materials and bloom without a dynamic light. Disabling bloom must still leave readable voxel geometry.

## 22. Surface Presentation Writes, Residue and Persistent Layers

### 22.1 Write Operation

A Surface Write node creates a validated request:

```text
surface_layer_id
spatial target
intensity
radius or mask
age/expiry
merge mode
source event
save policy
cleaning interaction reference
```

### 22.2 Allowed Targets

- Exact voxel face.
- Surface Mask.
- Voxel region exposed faces.
- Runtime contact face.
- Path corridor.
- Boundary contact area.

### 22.3 Layer Examples

- Wetness.
- Frost.
- Scorch.
- Soot.
- Mud.
- Footprint.
- Mana residue.
- Corruption.
- Repair dust.
- Poison/acid residue.

### 22.4 Merge Rules

| Rule | Behaviour |
| --- | --- |
| Max | keep stronger intensity |
| Add clamped | accumulate to maximum |
| Replace channel | newer layer replaces same-channel layer |
| Blend semantic | combine compatible wetness/mud or scorch/soot rules |
| Reject | incompatible target/material |

### 22.5 Persistence

The graph does not decide save scope alone. The layer definition declares:

- Cosmetic transient: no save.
- Reconstruct from world state.
- Save aggregate cell/face state.
- Save important authored consequence.

Per-drop or per-spark persistence is forbidden.

### 22.6 Write Budgets

Each effect has a maximum writes-per-event and affected-area limit. Weather uses aggregate wetness updates, not one write per raindrop.

## 23. Curves, Time, Sequencing, Delays, Gates and State Machines

### 23.1 Curve Types

- Float over normalised age.
- Vec3 over age.
- Palette role sequence.
- Step curve.
- Pulse curve.
- Ease curve.
- Context mapping curve.
- LOD scaling curve.

Curves compile into bounded lookup samples or simple analytical forms.

### 23.2 Time Nodes

- Effect Time.
- Emitter Time.
- Particle Age.
- Normalised Age.
- Time Since State Change.
- Loop Phase.
- Sequence Phase.
- Replay Time.

### 23.3 Gates

- Boolean Gate.
- Threshold Gate.
- Range Gate.
- Edge Gate.
- Cooldown Gate.
- Once Gate.
- Every-N Gate.
- Probability Gate.
- Budget Availability Gate.

### 23.4 Delays

Delays are bounded and lifecycle-aware. A delayed action is cancelled or preserved according to policy when the parent stops, virtualises or changes LOD.

### 23.5 Finite State Machines

Approved effect-local states might include:

```text
Idle
Starting
Operating
Strained
Warning
Stopping
```

States are presentation states derived from contract inputs. They do not replace the authoritative machine state. The state machine defines transitions, entry/exit actions and layer activation.

### 23.6 Hysteresis

Continuous values such as heat should use hysteresis around thresholds to prevent flickering between states. Example:

```text
enter Overheated at >= 0.85
leave Overheated at <= 0.75
```

## 24. Randomness, Seeds, Determinism and Procedural Reproducibility

### 24.1 Named Random Streams

Recommended streams:

```text
spawn_position
spawn_count_rounding
initial_velocity
form_selection
rotation
palette_variation
lifetime
child_choice
turbulence
```

### 24.2 Seed Derivation

```text
base_seed = hash(effect_id, event_instance_id, source_stable_id, world_seed_optional)
emitter_seed = hash(base_seed, emitter_id)
particle_seed = hash(emitter_seed, spawn_index)
stream_seed = hash(particle_seed, stream_name)
```

### 24.3 Determinism Classes

| Class | Requirement |
| --- | --- |
| Strict | identical plan and inputs produce matching result across replay/clients within supported platform rules |
| Semantic | same major form, timing and count; tiny local motion may vary |
| Local decorative | no cross-client match required |
| Baked procedural | generation result stored/reproducible, runtime motion may vary |

### 24.4 Deterministic Limits

Strict determinism avoids:

- Unspecified iteration order.
- Global random state.
- Frame-rate-dependent spawn accumulation without fixed rules.
- Platform-sensitive unbounded physics.
- Reading local camera state.

### 24.5 Replay

Replay may record:

- Event contract and context.
- Effect ID and version.
- Base seed.
- Start time and lifecycle transitions.
- Important state changes.

It should not need to record every particle transform for ordinary effects.

## 25. Composition Channels, Importance, Cancellation and Critical Cues

### 25.1 Channels

- Base.
- Operation.
- Damage.
- Environment.
- Magic.
- Warning.
- Temporary event.
- Accessibility.

### 25.2 Importance Classes

| Class | Examples | Budget Behaviour |
| --- | --- | --- |
| Critical | lethal telegraph, ward breach, overload warning | never removed without equivalent fallback |
| Important | player spell release, boss phase, major impact | reduce density before timing/form |
| Standard | machine smoke, footsteps, mining debris | scale normally |
| Decorative | ambient dust, tiny motes | first to aggregate or hide |

### 25.3 Cancellation

Cancellation can be:

- Immediate.
- Graceful.
- Replace by new state.
- Crossfade to successor.
- Preserve critical warning child.
- Ignore lower-priority cancel request.

### 25.4 Duplicate Suppression

Rapid repeated events can use:

- Cooldown.
- Merge window.
- Count accumulation.
- Intensity escalation.
- Spatial clustering.
- Latest-wins.

This prevents dozens of identical block impacts or machine warnings from overwhelming the scene.

### 25.5 Critical Cue Fallback

A critical cue must define at least one low-cost form such as:

- Static segmented ground boundary.
- Large high-contrast voxel pulse.
- Short directional cuboid burst.
- Stable warning anchor cells.
- Presentation Profile UI or haptic reference.

## 26. LOD, Budget Scaling, Aggregation, Virtualisation and Fallbacks

### 26.1 LOD Inputs

- Distance.
- Screen size.
- Importance.
- Visibility/occlusion.
- Local player relevance.
- Scene budget pressure.
- Split-screen view count.
- Accessibility settings.
- Hardware/scalability tier.

### 26.2 Scalable Dimensions

| Dimension | Reduction Options |
| --- | --- |
| Spawn | lower rate/count, larger cells, fewer bursts |
| Geometry | simpler forms, fewer cells, fewer frames |
| Update | lower frequency, analytical motion |
| Collision | reduced fraction, plane only, off |
| Children | disable decorative children |
| Trails | fewer samples, longer segments |
| Volumes | lower density, clustered representation |
| Lighting | merge, reduce radius, disable shadows |
| Transparency | fewer overlapping cells, opaque/dither fallback |
| Surface writes | aggregate area, lower frequency |

### 26.3 Budget Profiles

Every graph references a profile with:

- Preferred cost.
- Hard cap.
- Importance.
- Per-instance and global category caps.
- Fallback chain.
- Aggregation eligibility.
- Virtualisation eligibility.

### 26.4 Aggregation

Aggregation groups similar sources by:

- Effect family.
- Spatial cluster.
- State/phase.
- Material/palette compatibility.
- Importance.

Examples:

- Many distant chimneys become a few smoke clusters.
- Conveyor pulses become junction highlights.
- Rain impacts become roof-zone splash emitters.
- Ambient fireflies become biome-zone cells.

### 26.5 Virtualisation

Virtualised effects retain only essential logical state:

- Start time/phase.
- Current loop state.
- Important parameter snapshot.
- Seed.
- Pending critical transition.

They do not update every invisible particle.

### 26.6 Fallback Chain

```text
Full
-> Reduced
-> Minimal
-> Critical cue only
-> Hidden (decorative only)
```

Transitions should avoid obvious popping through fade, phase matching or distance thresholds with hysteresis.

## 27. Runtime Evaluation, Pooling, Batching and Update Scheduling

### 27.1 Runtime Components

Engine-neutral responsibilities:

- Effect instance manager.
- Emitter pool.
- Particle buffer allocator.
- Shared voxel-form library.
- Material/palette resolver.
- Spatial resolver bridge.
- Budget manager.
- Collision query bridge.
- Light request manager.
- Surface write queue.
- Debug/telemetry collector.

### 27.2 Pooling

Pools may be grouped by:

- Compiled plan layout.
- Particle record stride.
- Voxel form family.
- Material class.
- Collision mode.

Pool return must reset seeds, history, child links and spatial ownership.

### 27.3 Batching

Batching should prefer:

- Shared form and material.
- Shared transparency class.
- Similar light/emission behaviour.
- Stable world-space transforms.

The compiler can warn when a graph's many unique forms or materials prevent batching.

### 27.4 Update Scheduling

Emitters receive update tiers:

- Every frame.
- Fixed 30 Hz equivalent.
- Fixed 15 Hz equivalent.
- Low-frequency 5 Hz.
- State-change only.
- Virtualised analytical.

Exact values remain balance drafts for 23I testing.

### 27.5 CPU/GPU Eligibility

A compiled plan declares eligibility rather than assuming one path. GPU-friendly plans avoid:

- Complex world collision.
- Persistent surface writes per particle.
- Arbitrary child spawning.
- dynamic spatial queries.
- strict cross-platform determinism requirements.

CPU plans can perform richer contact logic but require tighter counts. Hybrid effects may use CPU emitters with GPU-batched visible cells.

### 27.6 Memory

The compiler reports:

- Bytes per live particle.
- Trail history bytes.
- Volume cell bytes.
- Per-emitter state.
- Shared-resource memory.
- Worst-case concurrent memory.

Unused custom fields are eliminated.

## 28. Multiplayer, Prediction, Confirmation, Replay and Late Join

### 28.1 Replication Principle

Replicate semantic presentation events, stable IDs, context, seeds and state transitions where needed. Do not replicate every particle transform.

### 28.2 Prediction

Predicted local effects may start immediately for responsive combat. The graph/profile declares:

- Prediction allowed.
- Confirmation event.
- Rejection behaviour.
- Duplicate suppression key.
- Correction policy.

### 28.3 Confirmation

On confirmation:

- Continue predicted effect.
- Upgrade intensity.
- Spawn confirmed child.
- Replace provisional material response.
- Merge duplicate event.

### 28.4 Rejection

Rejected predictions may:

- Fade quickly.
- Cancel immediately.
- Convert to miss/deflect presentation.
- Preserve non-misleading weapon trail but remove impact.

### 28.5 Continuous State

Machines, wards and weather are reconstructed from replicated authoritative state and phase. Clients do not need a network message for every smoke particle or conduit pulse.

### 28.6 Late Join

Late join receives:

- Active loop IDs.
- Start/phase reference.
- Current state parameters.
- Seed where required.
- Persistent surface layers within relevance.

One-shot effects that already ended are not replayed unless they created persistent world evidence.

### 28.7 Replay Compatibility

Replays pin or record effect versions. If assets migrate, the system may:

- Use archived compatible runtime plan.
- Use approved replacement with warning.
- Fall back to semantic minimal cue.

## 29. Creator Graph Workspace, Debug Views and Live Inspection

### 29.1 Workspace Layout

```text
Library / Templates | Graph Canvas | 3D Preview
Node Inspector       | Timeline     | Cost and Validation
Context Simulator    | Live Values  | LOD/Accessibility Matrix
```

### 29.2 Graph Canvas Features

- Typed colour-coded pins.
- Domain lanes.
- Node search by action and category.
- Collapsible groups.
- Subgraph references.
- Comments and design notes.
- Invalid-connection prevention.
- Inline constant controls.
- Pin value preview.
- Execution trace highlighting.

### 29.3 Preview Controls

- Play, pause, step and scrub.
- Restart with same seed.
- Restart with new seed.
- Simulate different context packets.
- Change material and surface.
- Move listener/camera.
- Change distance and LOD.
- Toggle reduced motion/flash.
- Multiply concurrent instances.
- Enable collision and overdraw views.

### 29.4 Debug Overlays

- Spawn positions.
- Velocity vectors.
- Field vectors.
- Collision bounds and hits.
- Trail samples.
- Volume cells and density.
- Light radii.
- Surface writes.
- Spatial anchor/path resolution.
- Budget heat map.
- Batch/material groups.

### 29.5 Live Runtime Inspection

When connected to a development build, the Forge may display:

- Active effect instances.
- Graph version and plan.
- Current LOD.
- Live count and spawn rate.
- Virtualisation state.
- Parameters and state changes.
- Budget suppression decisions.
- Collision count.
- Child count.
- Light requests.

Edits remain explicit hot-reload actions and do not silently modify approved production assets.

## 30. Compiler Validation, Diagnostics, Repair and Migration

### 30.1 Validation Stages

1. Schema and node-version validation.
2. Pin and type validation.
3. Domain legality validation.
4. Cycle and feedback validation.
5. Spatial and resource dependency validation.
6. Bound and cost analysis.
7. Determinism audit.
8. Style audit.
9. Accessibility audit.
10. LOD/fallback completeness.
11. Runtime plan generation.
12. Preview and acceptance tests.

### 30.2 Blocking Errors

- Unbounded spawn or lifetime.
- General graph cycle.
- Missing required spatial reference without fallback.
- Gameplay mutation node or arbitrary script call.
- Billboard/smooth-ribbon visible output.
- Unbounded child recursion.
- Missing hard count.
- Unsupported type conversion.
- Critical cue without fallback.
- Surface write without approved layer policy.
- Deterministic graph using local global randomness.

### 30.3 Warnings

- High transparency overlap.
- Excessive unique material variants.
- Collision on too many particles.
- Dynamic lights on decorative cells.
- Poor gameplay-distance readability.
- Frequent state threshold without hysteresis.
- LOD transition likely to pop.
- Graph duplicates an existing family/template.
- Large memory stride from rarely used fields.

### 30.4 Automatic Repair Suggestions

Summer Engine or deterministic tools may suggest:

- Insert clamp.
- Replace deprecated node.
- Move calculation to emitter domain.
- Share a form/material.
- Add catch-up cap.
- Add child limit.
- Convert smooth fade to cell removal.
- Add reduced-motion variant.
- Lower collision mode in reduced LOD.

Repairs require review and produce a diff.

### 30.5 Migration

Graph migration records:

- Old/new schema versions.
- Node replacements.
- Pin remaps.
- Constant changes.
- Expected visible differences.
- Recompile hash.
- Tests requiring reapproval.

## 31. Minimum Viable Node Set and Forest Hamlet Graph Library

### 31.1 MVP Node Count

The initial implementation should target approximately 45-60 core nodes plus reusable templates. This is enough to prove the system without building every advanced graph feature.

### 31.2 MVP Core Nodes

| Category | Required Nodes |
| --- | --- |
| Entry/context | Effect Start, Stop, Event Context, State Reader, Spatial Resolve, Material Reader |
| Spawn | Burst, Rate, Interval, Count Clamp, Budget Scale |
| Shapes | Point, Box, Surface Normal, Region Sample, Surface Mask, Path Sample, Runtime Contact |
| Form | Form Select, Generated Cuboid, Cluster Select, Frame Sequence |
| Initial | Lifetime, Velocity Cone, Random Rotation, Scale, Palette Role |
| Update | Age, Gravity, Drag, Buoyancy, Wind, Attraction, Orbit, Scale Curve, Opacity/Cell Remove |
| Trail/path | Trail History, Segment Builder, Path Pulse, Boundary Cells |
| Volume | Bounded Volume Population, Drift, Density LOD |
| Collision | World Contact, Bounce/Stop, Kill, Impact Child |
| Child | Spawn Child, Delayed Child, Limit Gate |
| Light | Light Request, Flicker Curve |
| Surface | Temporary/Persistent Layer Request |
| Logic/time | Branch, Gate, Threshold, Hysteresis, Curve, Delay, Sequence, Random Choice |
| Lifecycle | Stop Spawning, Fade/Collapse, Virtualise Phase |

### 31.3 MVP Effect Library

- Stone mining contact.
- Wood chopping contact.
- Block placement and break.
- Dirt/grass footstep.
- Water/mud footstep.
- Campfire flame, ember and smoke.
- Furnace ignition, operation, blocked warning and shutdown.
- Rain cells and roof contact.
- Mana conduit pulse.
- Ward active boundary, contact ripple and breach.
- Weapon trail and confirmed impact.
- Goblin captain telegraph.
- Wisp/mana discovery effect.
- Watchtower construction dust and completion.
- Scorch or wetness Surface Presentation Layer write.

### 31.4 MVP Success Criteria

- All visible effect forms pass voxel-style validation.
- The same material impact grammar supports at least stone, wood, metal and mana crystal.
- Furnace loops preserve phase through distance virtualisation.
- Ward critical cues remain readable under reduced motion, reduced flash and heavy budget pressure.
- Rain does not spawn visibly inside the sealed watchtower interior.
- A 10x or higher concurrency stress multiplier remains bounded and diagnosable.
- Graph compile errors identify unbounded counts and missing fallbacks.
- Runtime capture/replay reproduces the same deterministic mining impact and ward breach.

## 32. Worked End-to-End Graph Scenarios

### 32.1 Stone Mining Impact

```text
Entry: event.block.mining_contact
Context:
  target_material = stone
  tool_material = iron
  intensity = medium
  runtime_contact = position + normal
Spawn:
  count = intensity curve -> clamp 5..9
  point = runtime contact
Initial:
  form = material debris grammar(stone)
  velocity = normal cone 2.0..4.5 m/s
  lifetime = 0.35..0.8 s
  rotation = seeded cube rotation
Update:
  gravity + drag
Collision:
  ground/world simplified, one bounce maximum
Child:
  one bounded dust cluster at start
LOD:
  reduced 3 shards, no collision
  minimal 1 cuboid + dust cell
```

### 32.2 Furnace Operation and Blockage

```text
Effect lifecycle owned by machine presentation profile
Emitters:
  chimney smoke rate
  ember interval
  gearbox spark event
State inputs:
  active, heat_ratio, blocked, damaged
Composition:
  Operation channel -> smoke density and buoyancy
  Warning channel -> protected warning pulse
  Damage channel -> bounded sparks
Transitions:
  active rising -> ignition sequence
  blocked rising -> strain smoke + warning
  blocked falling -> recovery puff
  active falling -> stop spawning + shutdown tail
Virtualisation:
  retain loop phase and heat state
Aggregation:
  distant furnaces cluster smoke by roof zone
```

### 32.3 Mana Conduit Pulse

```text
State: flow_ratio, direction, purity, fault_points
Spatial: shared conduit path
Path graph:
  pulse speed = flow curve
  spacing = inverse flow curve
  segment form = emissive cuboids
  palette = purity role
Junctions:
  use supplied flow direction
Fault:
  local spark child at fault marker
LOD:
  full moving pulses
  reduced sparse pulses
  minimal junction and fault highlights
```

### 32.4 Ward Contact and Breach

```text
Loop:
  boundary cells sampled at fixed spacing
  intensity = ward_strength
Contact event:
  runtime boundary point
  radial boundary ripple over path distance
  outward cuboid burst
Breach event:
  critical segmented gap form
  bright but reduced-flash-safe pulse
  local fragment burst
  persistent damaged boundary state supplied by gameplay
Budget:
  critical cue protected
```

### 32.5 Goblin Captain Heavy Attack Telegraph

```text
Entry: attack_telegraph_started
Spatial: weapon trail path + ground target boundary
Sequence:
  charge motes 0.0-0.35 s
  segmented weapon arc 0.2-0.65 s
  ground boundary cells 0.25-0.75 s
  release marker ends telegraph
Reduced motion:
  static arc and ground cells
Reduced flash:
  slow intensity pulse
Cancellation:
  interrupted attack fades in 0.08 s
```

### 32.6 Heavy Rain at Watchtower

```text
Weather truth: rain intensity and wind
Volume:
  player-centred bounded weather zone
  rain cuboids with wind
Shelter:
  sky-exposure/roof mask suppresses indoor cells
Contact:
  roof-zone aggregate splashes
  path/mask drips at two leak points
Surface:
  aggregate wetness layer on exposed faces
LOD:
  reduced cell count, larger rain cuboids
  distant structure uses wetness + ambience only
```

## 33. Balancing Rules and Explicit Non-Goals

### 33.1 Balancing Rules

1. Readability is more important than particle quantity.
2. Larger, fewer voxel forms are preferred over clouds of tiny cells.
3. Critical cues keep timing and silhouette before decorative detail.
4. Collision is reserved for effects that visibly benefit from it.
5. Dynamic lights are rarer than emissive cells.
6. Continuous loops must have phase and stop policies.
7. Child effects must be bounded at every link.
8. Weather and dense industry use aggregation rather than literal world-wide simulation.
9. Persistent surface writes represent meaningful states, not every contact.
10. Context variation should come from shared families and material DNA, not duplicate graphs.
11. LOD should reduce cost in multiple dimensions rather than only lowering spawn count.
12. Graph complexity must be explainable in the preview and diagnostics tools.

### 33.2 Explicit Non-Goals

- Full physically accurate smoke, fire or fluid simulation.
- General-purpose GPU visual scripting in v0.1.
- Per-voxel real-time global illumination from every particle.
- Destructible voxel geometry controlled by VFX graphs.
- Gameplay damage or status logic.
- Smooth ribbon, billboard or photorealistic particle support.
- Saving all particle instances.
- Network replication of all particle transforms.
- Unlimited user-script nodes in content packs.
- A requirement that every effect use collision, lighting or persistent writes.

## 34. Open Questions for 23I and Production Testing

The architecture is ready, but implementation testing must choose first-pass values and engine paths for:

- Best Godot rendering path for shared voxel forms and large instance counts.
- Whether trails use MultiMesh cuboids, generated mesh strips made of cuboids or another voxel-segment batch.
- CPU/GPU split for common node plans.
- Exact fixed-step rates for strict deterministic effects.
- Practical live-particle and volume-cell budgets by hardware tier.
- Voxel-world collision query batching.
- Best representation for sparse volume cells.
- Dynamic light request and cluster limits.
- Transparency and overdraw measurement approach.
- Hot-reload strategy for compiled plans.
- Runtime plan binary/resource format.
- Archived plan policy for replay compatibility.
- Split-screen budget allocation.
- World weather shelter-query strategy for player-built roofs.
- Persistent surface-layer storage and chunk integration.

These are implementation and tuning questions rather than missing design foundations. They should be resolved through 23I prototypes and packaged-build stress tests.

## Appendix A. Core Graph Data Templates

### A.1 Graph Definition

```text
VFXGraphDefinition
{
    graph_id
    display_name
    namespace
    graph_version
    node_schema_version
    graph_role
    allowed_domains[]
    family_tags[]
    required_contracts[]
    required_context_fields[]
    spatial_requirements[]
    material_requirements[]
    nodes[]
    connections[]
    subgraph_refs[]
    declared_bounds
    budget_profile_id
    lod_overrides[]
    accessibility_overrides[]
    deterministic_class
    lifecycle_state
    provenance
    validation_record
}
```

### A.2 Compiled Runtime Plan

```text
VFXRuntimePlan
{
    plan_id
    source_graph_id
    source_version
    compiler_version
    compatibility_signature
    domain_op_lists
    resolved_resource_table
    particle_record_layout
    emitter_state_layout
    constants
    sampled_curves
    declared_bounds
    scheduling_profile
    determinism_metadata
    lod_plan_links
    fallback_plan_link
    debug_symbol_map_optional
    bake_hash
}
```

### A.3 Emitter State

```text
VFXEmitterState
{
    emitter_instance_id
    lifecycle_state
    start_time
    loop_phase
    spawn_accumulator
    spawn_index
    base_seed
    spatial_binding
    active_plan_id
    parameter_snapshot
    live_count
    child_count
    virtualisation_state
    stop_policy
}
```

### A.4 Particle Layout Example

```text
ParticleRecord_ImpactDebris
{
    position : vec3
    velocity : vec3
    rotation : packed_rotation
    angular_velocity : packed_vec3
    scale : packed_vec3
    age : float
    lifetime : float
    form_index : uint16
    palette_index : uint8
    bounce_count : uint8
    seed : uint32
}
```

### A.5 Surface Write Request

```text
SurfaceWriteRequest
{
    layer_id
    target_spatial_ref
    world_contact_optional
    intensity
    radius_or_mask
    merge_rule
    expiry
    source_event_id
    save_policy
    budget_priority
}
```

## Appendix B. Node Catalogue and Pin Summary

| Category | Node | Primary Inputs | Primary Outputs | Domain |
| --- | --- | --- | --- | --- |
| Entry | Effect Started | lifecycle | exec/data | Start |
| Entry | State Changed | state field, threshold | old/new/edge | State Change |
| Context | Read Context Field | field ID | typed value | Start/State/Spawn |
| Spatial | Resolve Anchor | anchor ID | transform, valid | Start/Update |
| Spatial | Runtime Contact | context | position, normal, material | Spawn |
| Spawn | Burst | count, delay | spawn requests | Emitter |
| Spawn | Rate | rate, gate | spawn requests | Emitter Update |
| Spawn | Interval | interval, jitter | pulse | Emitter Update |
| Shape | Point | transform | position | Spawn |
| Shape | Box Sample | bounds, stream | position | Spawn |
| Shape | Region Sample | region, mode | position, normal | Spawn |
| Shape | Mask Sample | mask, weight | position, normal | Spawn |
| Shape | Path Sample | path, distance | transform | Spawn/Path |
| Form | Select Form | family/context | form ref | Spawn |
| Form | Generate Cuboid | cell ranges, seed | form ref | Spawn/Compile cache |
| Initial | Velocity Cone | direction, angle, speed | velocity | Spawn |
| Initial | Lifetime | range, stream | lifetime | Spawn |
| Initial | Random Rotation | stream | rotation | Spawn |
| Motion | Gravity | profile | acceleration | Update |
| Motion | Drag | coefficient | velocity | Update |
| Motion | Wind | world wind, response | acceleration | Update |
| Motion | Attraction | centre, strength | acceleration | Update |
| Motion | Orbit | centre, axis, speed | position/velocity | Update |
| Motion | Grid Step | direction, cell size | position | Update |
| Trail | Trail History | socket/path, limits | samples | Path Update |
| Trail | Segment Builder | samples, form | segment instances | Path Update |
| Beam | Beam Segments | start/end, spacing | segments | Path Update |
| Volume | Maintain Density | bounds, target | birth/death | Volume Update |
| Collision | World Contact | mode, bounds | hit | Collision |
| Collision | Bounce | hit, coefficients | velocity/position | Collision |
| Collision | Stick | hit | attached state | Collision |
| Child | Spawn Child | child ID, context | child request | Any bounded trigger |
| Material | Palette Role | role/context | colour/material | Spawn/Update |
| Material | Age Curve | curve, age | value | Update |
| Light | Request Light | profile, transform, intensity | light request | Light Update |
| Surface | Write Layer | layer, target, intensity | write request | Surface Write |
| Logic | Branch | condition | selected path | Any legal domain |
| Logic | Hysteresis | value, thresholds | stable bool/state | State Change |
| Logic | Cooldown | trigger, duration | gated trigger | Emitter/State |
| Random | Weighted Choice | weights, stream | index/value | Spawn/Start |
| Lifecycle | Stop Spawning | stop event | emitter state | Stop |
| Lifecycle | Virtualise Phase | time/phase | reduced state | Virtualised |

## Appendix C. Execution and Compiler Rules

| Rule ID | Rule | Severity |
| --- | --- | --- |
| GRAPH-001 | Every output-producing graph declares preferred and hard bounds. | Error |
| GRAPH-002 | General node cycles are forbidden. | Error |
| GRAPH-003 | Feedback uses approved fixed-memory nodes only. | Error |
| GRAPH-004 | External values driving counts or lights require clamps. | Error |
| GRAPH-005 | Node domains must match; spawn-only values cannot be read later unless stored. | Error |
| GRAPH-006 | Child depth and count are explicit. | Error |
| GRAPH-007 | Deterministic plans use named streams and stable order. | Error |
| GRAPH-008 | Runtime plan omits unused particle fields. | Warning if not optimised |
| GRAPH-009 | Decorative dynamic lights require explicit profile. | Warning/Error by budget |
| GRAPH-010 | Critical cues require a critical fallback plan. | Error |
| GRAPH-011 | Surface writes require approved layer definitions. | Error |
| GRAPH-012 | Collision has a declared LOD reduction policy. | Warning |
| GRAPH-013 | Trails have fixed history and teleport-break limits. | Error |
| GRAPH-014 | Rate emitters have catch-up caps. | Error |
| GRAPH-015 | Persistent loops define stop, virtualisation and owner-destruction behaviour. | Error |
| GRAPH-016 | Visible output passes voxel-style audit. | Error |
| GRAPH-017 | High-overdraw plans provide a reduced transparency fallback. | Warning |
| GRAPH-018 | Deprecated nodes must migrate or block approval. | Error |

## Appendix D. Default Graph Templates

### D.1 Material Impact Template

```text
Event Context
-> Runtime Contact
-> Intensity to Count
-> Material Form Grammar
-> Surface Normal Cone
-> Lifetime/Rotation Variation
-> Gravity + Drag
-> Optional Collision
-> Optional Dust Child
-> LOD Override
```

### D.2 Continuous Chimney Template

```text
Machine State
-> Surface Mask Sample
-> Rate from Heat
-> Smoke Cluster Select
-> Buoyancy + Wind + Turbulence
-> Scale and Cell Removal over Life
-> Aggregation Eligibility
-> Phase Virtualisation
```

### D.3 Segmented Weapon Trail Template

```text
Animation Events begin/end
-> Root/Tip Socket History
-> Distance Sample
-> Cuboid Segment Builder
-> Age Taper
-> Reduced-Motion Static Arc
-> Teleport Break
```

### D.4 Path Pulse Template

```text
Flow State
-> Path Resolve
-> Pulse Interval and Speed
-> Path Distance Advance
-> Segment/Cluster Form
-> Junction/Fault Highlights
-> Sparse LOD
```

### D.5 Bounded Weather Volume Template

```text
Weather State
-> Player-Centred Zone
-> Shelter Mask
-> Density to Count
-> Rain/Snow Form
-> Wind + Gravity
-> Aggregate Contact Children
-> Surface Wetness Aggregate
```

## Appendix E. Budget and LOD Profiles

| Profile | Preferred Live Cells | Hard Live Cells | Collision | Lights | Typical Use |
| --- | ---: | ---: | --- | --- | --- |
| vfx.contact.small | 6 | 16 | optional simplified | none | footsteps, small impacts |
| vfx.contact.standard | 12 | 32 | nearby subset | optional flash | mining, melee |
| vfx.loop.machine | 24 | 64 | none or rare | merged | furnace, sawmill |
| vfx.fire.small | 32 | 96 | none | one merged request | torch, campfire |
| vfx.path.standard | 48 segments | 128 | none | sparse junction | conduit, trail |
| vfx.volume.local | 64 | 256 | none | none | cave dust, local fog |
| vfx.weather.player | 96 | 384 | aggregate contact | none | rain/snow zone |
| vfx.critical.telegraph | 24 | 96 | none | protected optional | boss/attack warning |
| vfx.boss.major | 128 | 512 | selective | bounded major | phase effect |

*All values are first-pass balance drafts for packaged-build profiling. 23I may revise them without changing the architecture.*

### E.1 Standard LOD Multipliers

| LOD | Spawn | Geometry Cells | Update Rate | Collision | Children | Light |
| --- | ---: | ---: | ---: | --- | --- | --- |
| Full | 1.0 | 1.0 | 1.0 | profile | full bounded | profile |
| Reduced | 0.55 | 0.7 | 0.5 | reduced | important only | merged |
| Minimal | 0.2 | 0.35 | 0.25 | off | critical only | critical only |
| Critical | 0 | static form | state-change | off | none | optional protected |
| Hidden | 0 | 0 | virtualised | off | none | none |

## Appendix F. Validation Codes and Acceptance Checklist

### F.1 Validation Codes

| Code | Meaning |
| --- | --- |
| VPG-E001 | Unbounded spawn count or rate. |
| VPG-E002 | Unbounded particle lifetime or loop ownership. |
| VPG-E003 | Illegal graph cycle. |
| VPG-E004 | Missing required clamp on external value. |
| VPG-E005 | Child recursion/count exceeds declared bounds. |
| VPG-E006 | Missing required spatial reference/fallback. |
| VPG-E007 | Illegal gameplay mutation or arbitrary script node. |
| VPG-E008 | Non-voxel visible output detected. |
| VPG-E009 | Critical cue lacks fallback. |
| VPG-E010 | Deterministic plan uses non-deterministic source. |
| VPG-E011 | Surface write lacks approved layer/save policy. |
| VPG-E012 | Runtime plan schema incompatible or migration missing. |
| VPG-W101 | High alpha overlap. |
| VPG-W102 | Excessive unique material/form batches. |
| VPG-W103 | Collision cost high for importance class. |
| VPG-W104 | Decorative dynamic-light request. |
| VPG-W105 | Poor gameplay-distance readability. |
| VPG-W106 | State threshold lacks hysteresis. |
| VPG-W107 | LOD transition likely to pop. |
| VPG-W108 | Duplicate family/template likely exists. |
| VPG-W109 | Particle record contains expensive rarely used fields. |

### F.2 Acceptance Checklist

#### Graph and Bounds
- All nodes and pins validate.
- All domains are legal.
- Counts, rates, lifetime, histories, children and writes have hard bounds.
- External parameters are clamped.
- Catch-up and cancellation policies exist.

#### Style and Readability
- Visible forms are genuine 3D voxel geometry.
- No billboard or smooth ribbon dependency exists.
- Full, reduced and critical forms remain readable.
- Post-processing can be disabled without destroying the effect identity.

#### Integration
- Event/context/state requirements are declared.
- Spatial references and fallbacks resolve.
- Material DNA and palette roles are valid.
- Presentation Profile ownership is known.
- Graph does not mutate gameplay.

#### Runtime
- Compiled plan regenerates from source.
- Particle layout omits unused fields.
- Pool reset is clean.
- Virtualisation preserves required phase.
- LOD transitions pass stress preview.
- Multiplayer prediction/confirmation does not duplicate output.

#### Accessibility and Performance
- Critical cues have reduced-motion and reduced-flash equivalents.
- Colour-independent form exists where required.
- Budget profile and fallback chain are complete.
- Dense-scene multiplier test passes.
- Collision, light and transparency costs remain within profile.

