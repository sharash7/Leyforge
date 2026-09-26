# LEYFORGE PRODUCTION PROGRAMME

## PROD-03 — Leyforge Runtime Engineering Architecture

**Document ID:** PROD-03  
**Title:** Leyforge Runtime Engineering Architecture  
**Version:** v0.1  
**Date:** 21 September 2026  
**Status:** **LOCKED — OWNER-APPROVED PRODUCTION AUTHORITY**  
**Project:** Leyforge  
**Product context:** Ley Realms / The Forge  
**Programme:** PROD — Detailed Production Plan & Implementation Handoff  
**Constitutional parent:** PROD-00 — Production Constitution, Authority & Scope  
**Source-routing parent:** PROD-01 — Legacy Canon & Source Crosswalk  
**Roadmap parent:** PROD-02 — Master Production Roadmap & Dependency Atlas  
**Primary technical evidence:** PRD-02 Zylann Voxel Tools capability audit; PRD-03 Godot/supporting-technology audit; PRD-04 architecture boundary study; later accepted PRD proof/ADR evidence where available  
**Primary downstream consumers:** PROD-04 through PROD-17, ProductionRegistry, Project Brain, runtime implementation, Forge adapters, save/migration tooling, multiplayer implementation, diagnostics and CI  

---

# 00. Executive Runtime Statement

Leyforge owns **meaning and authoritative world state**.

Godot, Zylann Voxel Tools and any supporting technologies **execute, store, accelerate or project** that state behind governed boundaries.

This document turns that principle into the production runtime architecture.

The active engine baseline is:

- **Godot 4.7.2 stable**;
- **Zylann Voxel Tools / `godot_voxel`** as the specialised voxel substrate;
- Leyforge-owned gameplay, world, simulation, persistence, networking and semantic systems above those providers.

Historical Unreal Engine and Summer Engine implementation directions are not active runtime targets. Engine-agnostic lessons from those documents remain useful where PROD-01 classifies them as inherited requirements or evidence.

The architecture deliberately prevents the following failures:

- runtime palette numbers becoming canonical block identities;
- SceneTree Nodes becoming the world database;
- voxel chunks becoming settlement/simulation partitions merely because they already exist;
- save files being defined by whatever one storage provider happens to write;
- network peer IDs becoming player identity;
- worker threads mutating shared world truth without an owner;
- distant simulation processing every nearby action one-by-one;
- moving vessels being implemented by moving a world-terrain object that was not designed for that purpose;
- Forge bake products becoming the editable source of truth;
- provider limitations silently deleting gameplay requirements;
- multiplayer arriving later and discovering the single-player architecture cannot express authority;
- performance work being postponed until the complete game already depends on expensive assumptions.

The core technical promise is:

> **Canonical identity and state remain stable while representations, providers, loaded regions, engine Nodes, runtime handles, worker tasks and presentation objects may come and go.**

The runtime architecture is therefore built around six separations:

1. **meaning vs execution**;
2. **persistent domain state vs active projection**;
3. **canonical spatial address vs engine-local transform**;
4. **authoritative mutation vs worker computation**;
5. **whole-world checkpoint vs individual storage-provider writes**;
6. **gameplay truth vs presentation**.

---

# 01. Scope

PROD-03 owns production architecture for:

- engine/provider boundaries;
- Leyforge runtime service boundaries;
- world identity and live-session identity;
- realm identity;
- canonical coordinates and spatial frames;
- Zylann voxel integration;
- worldgen runtime ownership;
- streaming and chunk lifecycle;
- authoritative voxel edits;
- time, scheduling and deterministic work;
- simulation levels of detail;
- persistence, save, checkpoint, recovery and migration architecture;
- runtime registries and semantic-ID projection;
- entities, NPCs and active SceneTree representation;
- movement and physics integration;
- navigation and route hierarchy;
- automation, power, signals and logistics runtime architecture;
- water/fluid runtime boundary;
- moving-vessel spatial architecture;
- realm/portal runtime architecture;
- multiplayer authority and interest management;
- commands, events, queries and transactions;
- performance/scalability architecture;
- diagnostics and support contracts;
- testing boundaries and runtime acceptance;
- technology upgrade and ADR boundaries.

PROD-03 does **not** own:

- final content definitions;
- final art rules;
- final Forge creation journeys or authoring UI;
- specialist gameplay balance;
- detailed P01–P192 task decomposition;
- final player-facing interface layouts;
- release-store/platform policy;
- AI implementation.

Those are routed to their owning canon/PROD documents.

---

# 02. Current Technology Baseline

## 02.1 Godot

The production baseline is **Godot 4.7.2 stable**.

Godot provides the engine/service shell, including as applicable:

- process/runtime lifecycle;
- SceneTree;
- rendering;
- UI;
- input;
- audio;
- physics/Jolt integration;
- NavigationServer APIs;
- resource loading;
- worker/threading facilities;
- multiplayer transport/session primitives;
- export and platform integration;
- profiler/debugger/tooling.

Godot does **not** become Leyforge semantic authority merely because a feature is represented as a Node, Resource, RID, ObjectID, project setting or engine service.

## 02.2 Zylann Voxel Tools

Zylann is the specialised voxel substrate.

It may provide or execute:

- voxel buffers;
- voxel terrain storage;
- near-field terrain streaming;
- voxel meshing;
- local collision generation;
- generator execution;
- voxel-edit APIs;
- stream hooks;
- runtime palette/type values;
- instancing where appropriate.

It does **not** own:

- semantic block/material IDs;
- civilisation state;
- whole-world checkpoints;
- worldgen macro intent;
- regional routes;
- full ocean/fluid authority;
- vessel semantics;
- player/network authority;
- realm identity;
- package/registry canon.

The current PRD evidence uses Voxel Tools 1.7 aligned to Godot 4.7.2. Exact **module vs GDExtension packaging** is treated as an implementation/build decision, not a semantic contract. P01 must pin the actual production integration edition/build and record it through the normal ADR/evidence path.

## 02.3 Supporting technologies

Databases, native libraries, file formats, testing libraries, compression libraries, networking backends or other dependencies remain **providers**.

A technology may accelerate or store a Leyforge system without acquiring ownership of the system's meaning.

---

# 03. Authority Classes

Runtime architecture follows these authority classes.

| Class | Name | Owns |
| --- | --- | --- |
| **A0** | Canon / semantic authority | Stable identities, gameplay meaning, world laws, content semantics |
| **A1** | Persistent domain authority | Authoritative saved people, inventories, settlements, structures, economy, realm state, history |
| **A2** | Live session/service authority | Active mutation ownership, transactions, scheduling, simulation, runtime registry maps, checkpoints |
| **A3** | Provider/executor | Godot services, Zylann, storage engines, network transports, native libraries |
| **A4** | Projection/presentation | SceneTree Nodes, meshes, particles, UI views, local physics wrappers, audio/VFX |

The governing law is:

> **A lower class may implement or project a higher class, but may not redefine it.**

Consequences:

- a Zylann TYPE value may represent a canonical block, but is not the block's durable identity;
- a Node may represent an NPC, but deleting the Node due to streaming does not delete the NPC;
- a database row may store a settlement record, but the database's internal row ID is not the settlement's semantic identity;
- an ENet peer may control a player character, but the peer ID is not the persistent player identity;
- a VFX emitter may show that a conduit is active, but it may not be the only place where “active” exists.

---

# 04. Runtime Architectural Laws

## 04.1 One owner for mutable truth

Every mutable authoritative record has one defined commit owner at a time.

Examples:

- inventory service owns committed inventory quantities;
- settlement service owns settlement membership/policy state;
- voxel edit coordinator owns semantic world-edit transaction state;
- vessel service owns vessel-local structural/damage state;
- save coordinator owns checkpoint publication.

Other systems submit commands, proposals or transactions.

## 04.2 Commands express intent

A command describes what an actor/system wants to do.

It does not declare success.

Example:

```text
PlaceBlockCommand
- actor_id
- world_id
- realm_id
- target address
- face/orientation
- requested block key
- source inventory reference
- expected target revision/state
```

The authoritative owner validates and either commits or rejects it with a reason.

## 04.3 Events describe committed facts

An event is emitted after authoritative change succeeds.

Examples:

- `BlockPlaced`;
- `ResourceDelivered`;
- `ProjectStageCompleted`;
- `PortalTransferCommitted`.

An attempted action does not emit a success event.

## 04.4 Queries do not mutate

Read operations may not quietly reserve resources, advance time, repair state or change ownership.

Opening a UI panel is not a gameplay transaction.

## 04.5 Definitions are immutable in ordinary play

Validated canonical definitions are read-only at runtime.

Mutable state is stored in instances/records.

A block definition does not contain “how many of this block the player currently owns.”

## 04.6 Runtime handles are disposable

The following are non-durable execution handles unless explicitly wrapped by a Leyforge schema:

- NodePath;
- ObjectID;
- RID;
- raw pointer;
- network peer ID;
- Zylann TYPE/palette index;
- worker task ID;
- file path;
- database row ID.

## 04.7 Failure is explicit

Important denied/blocked operations produce stable reason codes and diagnostics.

Silent item deletion, silent rollback, silent save failure and silent permission denial are prohibited.

## 04.8 Simulation is bounded

Leyforge does not reproduce billions of missed individual ticks merely because the player was away.

Distant simulation preserves authoritative outcomes through bounded summaries and conserved state.

## 04.9 Presentation is reconstructible

Visual/audio/UI state should be reproducible from authoritative domain state plus presentation state.

Destroying a particle system must not destroy the fact that a machine is overheated.

---

# 05. Core Runtime Layering

The target conceptual layering is:

```text
CANON / REGISTRIES
stable semantic definitions
        │
        ▼
PERSISTENT DOMAIN STATE
world / people / settlements / inventories / structures / history
        │
        ▼
WORLD SESSION SERVICES
commands / transactions / simulation / ownership / save / networking
        │
        ├───────────────┐
        ▼               ▼
PROVIDER ADAPTERS     WORKER COMPUTE
Godot / Zylann / DB   immutable/versioned jobs
        │               │
        └──────┬────────┘
               ▼
ACTIVE PROJECTION
SceneTree / physics / nav / meshes / audio / VFX / UI
```

The same persistent world may be opened by multiple different WorldSession instances across its lifetime.

---

# 06. WorldDefinition, WorldSession and RealmInstance

## 06.1 WorldDefinition

`WorldDefinition` is the durable identity/configuration of a saved world.

At minimum it references:

- stable `world_id`;
- world schema version;
- seed/generator contract;
- generator version;
- content/registry manifest;
- enabled content packs;
- world settings;
- created persistent realms;
- checkpoint lineage;
- world-history metadata.

A WorldDefinition exists even when the game is not running.

## 06.2 WorldSession

`WorldSession` is the live opening of a WorldDefinition.

It coordinates:

- loaded authoritative records;
- active realms;
- simulation partitions;
- active spatial frames;
- runtime registries/palette maps;
- voxel provider instances;
- streaming;
- save coordinator;
- network/session services;
- interest management;
- task epochs/revisions;
- diagnostics;
- shutdown/drain.

Closing the process destroys the WorldSession, not the world.

## 06.3 RealmInstance

Every persistent realm has a stable realm identity within the world.

The realm is not identified by a scene path.

Current production realm identities include:

- Overworld;
- Verdant Covenant;
- Ancestral Veil;
- Somnolent Expanse;
- Ascendant Reach;
- Impossible Deep;
- Ashen Lower Realms.

Portal/world-transfer systems target RealmInstance identities and valid anchors, not arbitrary scene loads.

## 06.4 Session epoch

Every WorldSession should expose a session/task epoch sufficient to reject results from an earlier closed/restarted session.

A stale worker result from Session A may not be committed into Session B simply because an object happens to share a local handle.

---

# 07. Canonical Spatial Architecture

## 07.1 CanonicalSpatialAddress

Persistent position belongs to Leyforge.

Conceptually:

```text
WorldID
RealmID
Spatial partition / region coordinate
Integer/local coordinate
Sub-voxel offset where required
```

Exact integer widths and partition dimensions are implementation parameters, not semantic truths.

## 07.2 EngineLocalTransform

Godot `Transform3D` / `global_position` represents the active local projection used for rendering, physics and Nodes.

It is not the only durable position record.

## 07.3 SpatialFrame

Leyforge owns explicit spatial frames.

Examples:

- realm/world frame;
- active-region frame;
- vessel-local frame;
- structure-local frame;
- test/simulation frame.

A frame has:

- stable runtime/domain identity;
- parent frame relation;
- transform/pose relation;
- lifecycle/revision;
- authority owner.

## 07.4 Frame rebasing

The active engine origin may move/rebase for precision/performance without changing canonical world addresses.

If used, rebase must coordinate:

- SceneTree projections;
- Zylann terrain;
- physics;
- navigation;
- camera;
- audio;
- particles;
- interpolation;
- client prediction/network state.

A rebase is projection maintenance, not world mutation.

## 07.5 Spatial granularities are intentionally different

The following are **not required to have the same size or boundaries**:

- Zylann data block;
- Zylann mesh block;
- canonical region;
- simulation partition;
- persistence region;
- navigation tile;
- interest-management cell;
- ecology region;
- settlement planning area.

They solve different problems.

---

# 08. Stable Identity and Runtime Registry Projection

## 08.1 Stable semantic keys

Canonical content is addressed by stable semantic IDs/keys governed by FCC/current registries.

Examples:

```text
block.stone.granite
item.tool.pickaxe.iron
creature.goblin.raider
structure.house.cottage_basic
```

The exact namespace grammar is governed by the current registry authority.

## 08.2 Runtime compact handles

For speed, a WorldSession may build compact runtime maps:

```text
stable semantic key
    ↔
runtime handle
    ↔
provider-local handle
```

Example:

```text
block.stone.granite
    ↔ Leyforge RuntimeVoxelHandle 37
    ↔ Zylann TYPE 14
```

Only the semantic key is durable by default.

## 08.3 Runtime maps are reversible

Runtime/provider projection must be able to resolve back to canonical identity for:

- save;
- networking;
- debugging;
- migration;
- Forge inspection;
- support diagnostics.

## 08.4 Missing content

When saved content references a missing/deprecated package or ID, the runtime must not silently reinterpret another runtime index as that content.

Missing-reference handling is explicit and migration/recovery aware.

---

# 09. Zylann Voxel Integration Boundary

## 09.1 Provider responsibility

The Zylann adapter owns integration with:

- terrain instance lifecycle;
- VoxelBuffer/provider data;
- blocky material/model mapping;
- streaming callbacks;
- local generator callbacks;
- mesh/collision readiness;
- provider stream interaction;
- edit/bulk-access APIs;
- provider metrics.

## 09.2 Leyforge responsibility

Leyforge owns:

- block semantics;
- canonical edit commands;
- stable IDs;
- worldgen intents;
- structure placement intent;
- save/checkpoint coordination;
- permissions/ownership;
- simulation consequences;
- nav invalidation;
- multiplayer replication semantics;
- historical edit records where needed.

## 09.3 No direct gameplay dependence on TYPE numbers

Gameplay systems may not use Zylann TYPE/palette integers as canonical conditions.

Wrong:

```text
if voxel_type == 42:
    grant_magic()
```

Correct:

```text
semantic = voxel_registry.resolve(runtime_voxel_handle)
if semantic.has_capability("flux_bearing"):
    ...
```

## 09.4 Loaded-border limitation

Provider-local editing restrictions must not define Leyforge's conceptual ability to schedule distant projects/worldgen operations.

Remote/unloaded edits require a Leyforge-owned data/worldgen/persistence path rather than pretending a loaded `VoxelTool` can edit the entire universe.

---

# 10. Voxel Chunk and Streaming Lifecycle

## 10.1 Streaming is representation lifecycle

Loading a voxel area:

- materialises provider data;
- may generate missing base terrain;
- projects applicable edits/state;
- produces mesh/collision;
- registers readiness.

Unloading:

- removes provider representation;
- does not erase canonical edits, structures or simulation state.

## 10.2 Readiness states

A voxel region should expose explicit readiness phases such as:

```text
REQUESTED
DATA_READY
SEMANTICS_APPLIED
MESH_READY
COLLISION_READY
GAMEPLAY_READY
UNLOADING
UNLOADED
```

Exact names may vary, but downstream gameplay must not guess readiness from Node existence.

## 10.3 Streaming interest

WorldSession interest management may combine:

- player camera/view;
- collision/movement need;
- nearby entity simulation;
- active construction;
- vessel proximity;
- portal transition;
- multiplayer client interest;
- explicit test/Forge requests.

Voxel streaming is one consumer of broader Leyforge interest management.

## 10.4 Large view distance

The architecture must not assume blocky far-distance terrain is already solved by near-field `VoxelTerrain`.

Far representation/LOD remains a production proof/performance concern and must preserve canonical terrain truth without forcing full-resolution chunks to remain loaded.

---

# 11. Authoritative Spatial Edits

## 11.1 Edit transaction

A world edit begins as an authoritative command/transaction.

Validation may include:

- actor permission;
- target revision;
- target block state;
- source inventory;
- tool capability;
- collision/occupancy;
- protected structure/territory rules;
- world/realm law.

## 11.2 SpatialChangeSet

After a successful commit, the runtime should publish one Leyforge-owned spatial change description.

A `SpatialChangeSet` conceptually contains:

- change ID/revision;
- world/realm;
- affected canonical bounds;
- semantic before/after data as required;
- actor/cause;
- transaction link;
- persistence implications;
- invalidation categories.

Consumers may include:

- Zylann projection;
- mesh/collision rebuild scheduling;
- navigation invalidation;
- structure/room validation;
- ecology;
- routes;
- fluid boundary;
- automation network adjacency;
- save journal;
- multiplayer replication;
- diagnostics.

This prevents twelve systems from independently deciding what “a block changed” means.

## 11.3 Bulk edits

Large construction/worldgen/admin operations use batched change sets.

Do not emit one heavyweight cross-system transaction per voxel when one bounded region operation can preserve the same truth.

---

# 12. World Generation Architecture

## 12.1 Seed contract

Leyforge owns:

- world seed;
- generator version;
- deterministic derivation rules;
- realm seeds/identities;
- feature IDs;
- macro planning;
- guaranteed anchors;
- structure/biome/resource intent.

## 12.2 Macro planning vs local materialisation

Preferred separation:

```text
WORLDGEN PLAN
regions / climate / geology / hydrology / feature intents
        ↓
DETERMINISTIC FEATURE RECORDS
stable feature IDs / ownership / placement intent
        ↓
LOCAL VOXEL MATERIALISATION
Zylann generator/provider callbacks
        ↓
VOXEL DATA / MESH
```

This keeps large structures, routes and world features from depending on generation-call order.

## 12.3 Generator callbacks are idempotent

Provider generation may be requested more than once.

Generation code must not rely on “this callback runs exactly once.”

One-time side effects belong in stable feature/world records, not raw terrain callback execution.

## 12.4 Cross-chunk structures

Small bounded features may use provider-supported multipass techniques where proven.

Large structures/megaprojects should use stable blueprint/feature intents that can deterministically rasterise/materialise into whichever intersecting chunks are requested.

## 12.5 Generation determinism

Required determinism is defined at Leyforge output/semantic level.

Worker scheduling, chunk request order or reload order must not change the canonical world where the contract requires reproducibility.

---

# 13. Time Architecture

Leyforge distinguishes several time domains.

## 13.1 Real time

Wall-clock/platform time used for:

- session diagnostics;
- network timeout;
- logs;
- optional real-time schedules outside world simulation.

It is not authoritative world simulation time.

## 13.2 Simulation time

World/realm simulation clock used for:

- day/night;
- schedules;
- production;
- ecology;
- events;
- crops;
- weather;
- distant catch-up.

## 13.3 Fixed-step gameplay/physics time

Used where deterministic or stable simulation cadence requires bounded stepping.

## 13.4 Presentation time

Interpolation, animation and effect timing may run independently from authoritative simulation cadence where safe.

## 13.5 Calendar

The calendar is Leyforge domain state.

Godot process uptime is not the world's age.

---

# 14. Worker Compute / Owner Commit Concurrency

## 14.1 Core rule

Workers compute **proposals/results** from versioned inputs.

They do not freely mutate foreign canonical state.

Pattern:

```text
owner snapshots revisioned input
        ↓
worker computes bounded result
        ↓
worker returns immutable result
        ↓
owner checks session + revision + preconditions
        ↓
commit OR reject stale/invalid result
```

## 14.2 Candidate worker workloads

Good candidates include:

- worldgen analysis;
- path proposals;
- economy summaries;
- ecology calculations;
- settlement planning proposals;
- Forge bake analysis;
- visibility/coverage;
- distant simulation calculations;
- compression/serialization preparation.

## 14.3 Poor worker workloads

Avoid:

- one task per voxel;
- one task per trivial NPC operation;
- arbitrary SceneTree mutation;
- workers waiting recursively on other worker tasks without a designed DAG;
- multiple workers mutating the same cached Resource.

## 14.4 Global worker budget

Leyforge must observe the combined cost of:

- Godot WorkerThreadPool;
- Zylann internal workers;
- NavigationServer work;
- resource loader workers;
- physics;
- rendering;
- native workers;
- I/O;
- networking.

“Thread-safe” does not mean “budget-safe.”

Scalability profiles may constrain subsystem parallelism.

---

# 15. Determinism Model

Leyforge does **not** require every floating-point animation, particle or local physics detail to be bit-identical.

Determinism is scoped.

## 15.1 Required deterministic domains

Where specified, the following require reproducible semantic outcomes:

- seeded base worldgen;
- stable feature placement;
- content/registry resolution;
- generated variants where seed-driven;
- save reconstruction;
- authoritative transactions;
- simulation summaries where reproducibility is required by the owning system.

## 15.2 Authoritative randomness

Gameplay-significant randomness uses Leyforge-owned seeded/random-stream context.

Random calls should be attributable to a domain/feature/operation rather than one global uncontrolled RNG stream whose sequence changes when unrelated code is added.

## 15.3 Physics

Godot/Jolt supplies physical evidence.

Leyforge decides gameplay consequences.

Network architecture should not depend on deterministic lockstep physics unless later proof explicitly selects it.

---

# 16. Simulation Level-of-Detail Architecture

Simulation LOD is separate from visual LOD and voxel mesh LOD.

The minimum conceptual levels are:

| Level | Typical state | Behaviour |
| --- | --- | --- |
| **ACTIVE** | Near/visible/interactive | Full entity actions, local navigation, collisions, exact machine/item movement where required |
| **LOCAL** | Nearby/off-screen | Reduced action cadence, simplified movement/production while preserving exact critical state |
| **REGIONAL** | Same broader region but not locally instantiated | Grouped jobs, route/economy/project summaries, bounded event resolution |
| **FAR** | Distant realm/region | Aggregate production/consumption/risk/history progression |
| **DORMANT** | No currently meaningful progression | Persist state without unnecessary simulation |
| **REHYDRATION** | Becoming active again | Materialise prior abstract results into visible actors/damage/inventory/projects consistently |

Exact labels can be refined, but the architecture must preserve this separation.

## 16.1 Promotion/demotion

Transitions are explicit and testable.

A promotion may need to instantiate:

- NPC positions consistent with work/history;
- damaged structures;
- stock levels;
- project stage;
- route blockage;
- machine fault;
- casualties/injuries.

Demotion captures enough state to resume without duplication or loss.

## 16.2 Conservation

Distant simulation may summarise work, but may not invent resources outside the owning rules.

A mine cannot create stock simply because the player left the area unless the settlement had:

- valid worker/labour capacity;
- valid resource access;
- valid tools/workplace;
- time;
- storage/logistics;
- any required consumables.

---

# 17. Persistence Architecture

## 17.1 Whole-world save authority

Leyforge owns checkpoint/recovery authority.

No one of the following is a complete save by itself:

- Zylann VoxelStream;
- SQLite database;
- Godot Resource file;
- JSON file;
- entity snapshot;
- server state blob.

## 17.2 SaveCoordinator

The WorldSession contains a `SaveCoordinator` responsible for:

- checkpoint identity;
- save epoch/revision;
- provider flush orchestration;
- journal boundary;
- manifest creation;
- integrity metadata;
- backup policy;
- publish/commit;
- recovery detection.

## 17.3 Storage providers

Possible provider classes include:

- voxel store;
- structured domain database;
- file/blob store;
- package/manifest references;
- screenshot/preview metadata.

Exact technologies remain implementation decisions behind stable interfaces.

## 17.4 Checkpoint publication

A checkpoint becomes current only after the coordinator has enough evidence that required provider products for that checkpoint are complete/consistent.

Conceptually:

```text
begin checkpoint C
    ↓
freeze/record checkpoint boundary
    ↓
flush/write provider snapshots
    ↓
validate required artifacts
    ↓
write checkpoint manifest + integrity data
    ↓
atomically publish C as current
```

Exact transactional mechanics depend on selected storage providers.

## 17.5 Journal / consequential operation identity

Consequential operations should carry stable operation IDs/revisions useful for:

- recovery;
- deduplication;
- reconnect;
- transaction auditing;
- support diagnostics.

## 17.6 Schema versioning

Every persistent payload has:

- schema/version identity;
- migration path or explicit unsupported status;
- stable semantic IDs rather than runtime handles.

---

# 18. Save Recovery and Corruption Posture

The runtime must distinguish:

- clean checkpoint;
- recoverable interrupted save;
- missing optional content;
- missing required content;
- migration required;
- integrity mismatch;
- partial provider failure;
- unrecoverable corruption.

Recovery must not silently manufacture substitute content.

Where possible, the system should retain the last known-good checkpoint and provide actionable diagnostics.

P166 later turns this architecture into full player-facing release recovery.

---

# 19. Entity and NPC Representation

## 19.1 Domain entity vs Node

Persistent entities have Leyforge identity/state independent of SceneTree Nodes.

An entity may be:

- fully projected as a Node;
- represented in a lightweight runtime record;
- represented only in regional simulation;
- dormant.

## 19.2 Projection lifecycle

Promotion:

```text
domain entity
→ resolve definition
→ choose representation level
→ create Node/physics/nav/animation projection
→ bind stable entity ID
→ sync presentation state
```

Demotion:

```text
active projection
→ commit authoritative local state
→ release Node/provider resources
→ retain persistent entity record
```

## 19.3 No Node ownership inversion

A freed Node may invalidate a projection reference.

It does not invalidate the domain entity unless an authoritative gameplay event actually destroyed/died/despawned the entity according to its owning rules.

---

# 20. Physics and Gameplay Consequences

Godot/Jolt determines runtime physical evidence:

- collisions;
- contacts;
- velocity;
- rigid-body integration;
- ray/shape queries.

Leyforge determines gameplay consequences:

- damage;
- movement permission;
- structural state;
- item transfer;
- boarding;
- combat result;
- hazard state.

High-volume low-level physics may use PhysicsServer APIs where profiling proves value, but the same semantic boundary applies.

---

# 21. Movement Architecture

Leyforge owns mover capabilities and movement state.

A mover definition/state may include:

- walk;
- sprint;
- jump;
- climb;
- swim;
- fly;
- crawl;
- vessel operation;
- special realm movement.

Godot bodies execute movement.

The movement system is responsible for translating semantic capability into provider operations and back into authoritative state.

First-person and later third-person presentation share the same authoritative mover state where possible.

---

# 22. Navigation and Route Hierarchy

Navigation has at least three levels.

## 22.1 Local pathfinding

Used for nearby NPC/creature movement around current geometry.

Godot NavigationServer is a strong local surface-navigation provider candidate where suitable.

## 22.2 Specialist traversal providers

May include:

- voxel/grid pathing;
- volume/flying pathing;
- swimming;
- vessel navigation;
- underground routes;
- realm-specific movement.

## 22.3 Regional routing

Leyforge owns long-distance route intent:

- roads;
- trails;
- caravans;
- sea lanes;
- portals;
- trade routes.

Regional routing does not require all local nav surfaces along the route to remain loaded.

## 22.4 Dynamic invalidation

Terrain edits, construction, destruction, water and world events may invalidate local or regional navigation.

SpatialChangeSet and route-change events drive invalidation.

---

# 23. Inventory and Resource Transactions

Resource movement is transactional.

A transfer includes:

- source owner/container;
- destination;
- semantic item/resource key;
- exact quantity/state;
- reservation/permission context;
- operation ID;
- result/reason.

Successful movement must conserve exact quantity except where an owning recipe/process explicitly transforms it.

This applies to:

- player inventory;
- settlement warehouse;
- machine buffers;
- construction delivery;
- caravan cargo;
- vessel cargo;
- cross-realm freight.

---

# 24. Automation, Power, Signal and Logistics Runtime

## 24.1 Typed graph model

Automation systems operate through typed semantic connections.

Domains may include:

- item/resource;
- mechanical power;
- fuel;
- Flux;
- signal/control;
- fluid where implemented;
- audio/event/state where applicable.

## 24.2 Shared port contract

A port exposes domain-specific extensions over common concepts such as:

- type;
- direction;
- compatibility;
- capacity/rate;
- geometry/socket;
- ownership/permission;
- connection state;
- fault state.

PROD-05 owns the universal contract details.

## 24.3 Network recomputation

Large networks must use bounded invalidation/recomputation.

A single block edit should not force global graph rebuild.

Prefer:

- local dirty regions;
- component IDs;
- incremental connectivity updates;
- bounded propagation;
- cached summaries;
- explicit fault reasons.

## 24.4 Near/far simulation

Nearby logistics may show individual visible items.

Far simulation may process batches/throughput summaries.

Both use the same authoritative inventories/transactions.

Visible belt/chute meshes are not the inventory.

---

# 25. Signal/Event Architecture

Signals used for player machines/logic are gameplay-domain semantic signals, not arbitrary Godot signal wiring exposed as canon.

The runtime should distinguish:

- engine/internal event;
- authoritative domain event;
- player-constructible signal;
- presentation event.

This prevents player logic from accidentally gaining access to internal engine objects or unrestricted scripting.

---

# 26. Water and Fluid Boundary

Full production water is a Leyforge-owned system above voxel and physics providers.

Zylann may store/materialise voxel fluid/block state where useful, but does not own the complete ocean/hydrology simulation.

The water architecture must separately address:

- persistent body identity;
- water level/state;
- bounded flow/propagation;
- terrain-edit interaction;
- hydrology/worldgen relation;
- swimming;
- buoyancy queries;
- vessel interaction;
- flooding;
- currents/tides/waves;
- streaming;
- save/load;
- multiplayer replication;
- scalability.

Not all of these must use one simulation technique.

In particular:

> **visual waves, regional current fields, bounded voxel flooding and vessel buoyancy may be related systems without being one giant per-voxel Navier–Stokes simulation.**

P103–P105 define the production slices that implement/prove this boundary.

---

# 27. Vessel Runtime Architecture

## 27.1 Zylann terrain is not the vessel foundation

Current architecture rejects “move an ordinary `VoxelTerrain` node around as the ship” as the production vessel foundation.

A vessel requires a dedicated vessel-local spatial representation.

## 27.2 Vessel frame

A vessel has:

1. stable vessel identity;
2. vessel-local spatial frame;
3. world/realm pose for that frame;
4. local structural/component state.

Moving the vessel updates the frame pose.

It does not rewrite every hull block's canonical local coordinate.

## 27.3 Vessel-local content

Potential vessel-local state includes:

- hull voxels/components;
- compartments;
- doors/hatches;
- machinery;
- stations;
- cargo fixtures;
- damage;
- flooding;
- fire;
- propulsion;
- steering;
- crew attachment.

## 27.4 Boarding handoff

Boarding/disembarking is an explicit spatial authority handoff:

```text
world frame
→ validate boarding
→ vessel frame parent relation
→ vessel-local position
```

SceneTree parenting alone does not establish canonical boarding.

## 27.5 Vessel projection

The exact production implementation of vessel-local voxel rendering/collision remains provider/proof-driven.

The semantic frame and authority boundary are locked independently of that implementation.

---

# 28. Structure-Local Frames

Large authored structures may retain structure-local coordinates at source/semantic level.

Static world structures may materialise into ordinary world voxels and no longer require an active transform frame after placement.

Persistent structure identity may still exist for:

- ownership;
- rooms;
- jobs;
- damage/restoration;
- history;
- upgrades;
- utilities.

Moving/special structures may retain active frames.

---

# 29. Realm and Portal Runtime Architecture

## 29.1 Realms are persistent worlds within one WorldDefinition

Each RealmInstance has:

- stable identity;
- worldgen/seed contract;
- persistent state;
- simulation state;
- portal anchors;
- realm-specific rules/providers where allowed.

## 29.2 Realm loading is not identity

A realm may be inactive/unloaded without ceasing to exist.

## 29.3 Portal transfer

Portal transfer is an authoritative transaction involving:

- source realm/frame;
- destination realm/anchor;
- actor/entity identity;
- carried inventory;
- permissions;
- destination readiness;
- transfer state;
- failure/recovery.

A scene change is only one possible presentation/execution step.

## 29.4 Cross-realm logistics

Later cross-realm freight uses the same route/transaction principles as regional logistics while adding portal/realm constraints.

---

# 30. Multiplayer Authority Architecture

## 30.1 Same authoritative model for solo and multiplayer

Single-player hosts the authoritative WorldSession locally.

Online/listen/dedicated multiplayer uses the same domain commands, validations and mutation paths.

Do not implement “single-player shortcuts” that bypass authority and later require a second gameplay system.

## 30.2 Client intent, authority commit

Clients submit commands.

Authority validates:

- identity;
- permission;
- state revision;
- resource availability;
- spatial validity;
- rule constraints.

Authority commits and emits replicated results/deltas.

## 30.3 Prediction

Responsive movement or presentation may be predicted.

Predicted state is not automatically authoritative.

## 30.4 Interest management

Leyforge owns cross-domain interest policy.

Interest may drive:

- entity replication;
- voxel deltas;
- simulation promotion;
- nearby inventory/machine detail;
- realm/portal visibility;
- route/event summaries.

## 30.5 Peer identity

Transient peer/network connection identity remains separate from:

- account identity;
- profile identity;
- player identity;
- character identity;
- faction/settlement membership.

## 30.6 Network protocol

The durable gameplay/world protocol is Leyforge-owned.

Godot/ENet or another transport moves messages but does not define canonical semantics.

## 30.7 No deterministic lockstep assumption

The architecture does not require every client to simulate the complete world deterministically in lockstep.

Authoritative server/host state remains the source of committed truth.

---

# 31. Interest Management as a Shared Service

Interest management is broader than networking.

The same high-level interest model may help coordinate:

- terrain streaming;
- entity projection;
- local simulation;
- audio/VFX detail;
- navigation activation;
- multiplayer replication;
- Forge test focus.

Domain-specific systems retain their own thresholds and budgets.

---

# 32. Presentation State Boundary

Gameplay state is authoritative.

Presentation observes gameplay/domain state and may derive:

- animation state;
- VFX;
- audio;
- lighting;
- materials;
- UI indicators.

The runtime should use semantic presentation events/states where appropriate.

Example:

```text
machine.state = BLOCKED_OUTPUT
        ↓
PresentationState
        ├── animation slows/stops
        ├── warning light
        ├── mechanical strain sound stops
        └── UI reason = NO_OUTPUT_SPACE
```

The animation or warning light does not own `BLOCKED_OUTPUT`.

---

# 33. UI Runtime Boundary

UI communicates with domain systems through:

- read models/view models;
- queries;
- commands;
- stable reason codes;
- knowledge/permission filtering.

UI must not mutate provider internals directly.

Examples:

- inventory screen requests a transfer transaction;
- settlement screen submits policy change command;
- machine screen queries ports/fault state;
- world map reads knowledge-filtered cartography data.

---

# 34. Settings Runtime Boundary

Settings are Leyforge-defined records.

Categories may include:

- graphics;
- performance;
- simulation;
- audio;
- input;
- camera;
- gameplay;
- UI;
- accessibility;
- multiplayer;
- notifications;
- advanced/developer.

Godot project settings/widgets are implementation mechanisms.

They are not the canonical settings schema.

World/realm settings remain distinct from profile/global settings and server overrides.

---

# 35. Content Packs and Runtime Trust

## 35.1 Data-first untrusted content

Default player/community content is data/schema validated.

It may compose approved capabilities.

It does not receive unrestricted native/script execution by default.

## 35.2 Developer authority

Developer builds may possess tools/capabilities that can define or alter canonical base-game content.

Player tools use the same shared Forge services where applicable but under restricted authority.

## 35.3 Runtime package resolution

World/session manifests record the content packages and compatible versions needed to interpret durable semantic IDs.

Load order does not redefine namespace ownership.

---

# 36. Diagnostics Architecture

Provider-specific metrics feed a Leyforge diagnostic model.

Diagnostics should be queryable by stable categories such as:

- world/session;
- voxel streaming;
- voxel generation;
- meshing;
- collision;
- persistence;
- simulation;
- NPC/navigation;
- automation graphs;
- water;
- vessels;
- multiplayer;
- Forge runtime;
- memory;
- CPU/GPU timing;
- task queues;
- save health;
- content-pack compatibility.

Raw provider logs remain available as evidence, but player/support tooling should not depend on parsing arbitrary provider log strings.

---

# 37. Performance Architecture

Performance is a first-class runtime contract.

Every major system should expose:

- work count;
- active representation count;
- time cost;
- memory cost;
- queue/backlog;
- budget violations;
- LOD/scalability state.

Representative budgets are established and evolved through PROD-06/Arc XVIII evidence, not hard-coded here without measurement.

## 37.1 Separate presentation and simulation scaling

Graphics reduction and simulation reduction are different controls.

Low-end scaling may reduce:

- view distance;
- particle count;
- secondary animation;
- visual detail;
- update frequency;
- distant population representation;
- background simulation precision where canon permits.

It may not remove semantic truth or create resource duplication/loss.

---

# 38. Build and Runtime Profiles

At minimum, production should distinguish profiles equivalent to:

## 38.1 Developer

- maximum diagnostics;
- validators;
- debug overlays;
- cheats/dev tools under permission;
- Forge integration;
- profiling;
- assertions where practical.

## 38.2 Development packaged

- near-release runtime path;
- diagnostics retained;
- smoke/regression tests;
- representative save load;
- performance tracing.

## 38.3 Release client

- production-safe diagnostics;
- no developer-authority tools;
- validated content packages;
- security boundaries.

## 38.4 Dedicated server

- no unnecessary renderer/UI;
- authoritative world/session services;
- admin/config/backup/logging;
- content package enforcement.

Exact export/template configuration is a build-system implementation detail.

---

# 39. Upgrade Policy

Godot, Zylann and major dependencies are pinned per production milestone/release line.

Upgrade procedure:

1. evaluate release/source delta;
2. open controlled upgrade task/branch;
3. rebuild provider adapters;
4. run contract/regression tests;
5. run save/migration fixtures;
6. run representative performance comparisons;
7. accept/reject through ADR/governance;
8. only then change production baseline.

Development/preview engine features may be researched in isolation but are not silently promoted into production requirements.

---

# 40. Technology Escalation Ladder

Use the simplest layer that satisfies the measured requirement.

Preferred progression:

```text
GDScript / Godot Resources / standard APIs
        ↓ if measured blocker
lower-level Server APIs / custom data structures
        ↓ if measured blocker
GDExtension/native C++
        ↓ if public API blocker
maintained engine/module fork
```

This is not a language ideology.

It is a maintenance/risk ladder.

Native code does not gain permission to bypass stable IDs, owner-commit, save or thread boundaries.

---

# 41. Runtime Service Map

The production runtime is expected to converge on services/facades comparable to:

| Service | Responsibility |
| --- | --- |
| `WorldService` | WorldDefinition/WorldSession lifecycle |
| `RealmService` | RealmInstance lifecycle and realm state |
| `RegistryService` | Stable IDs, manifests, runtime handles |
| `SpatialService` | Canonical addresses and frame transforms |
| `VoxelService` | Semantic voxel edits and Zylann adapter boundary |
| `WorldgenService` | Macro planning and deterministic feature intent |
| `StreamingService` | Cross-domain active-interest coordination |
| `SimulationService` | Time, partitions, LOD and scheduling |
| `EntityService` | Persistent entities and projection lifecycle |
| `MovementService` | Mover capability/state and body execution |
| `NavigationService` | Local providers + regional route intent |
| `InventoryService` | Item/resource state and transactions |
| `WorkService` | Jobs, tasks and production work contracts |
| `StructureService` | Placed structure identity/state |
| `ConstructionService` | Projects, stages, labour and deliveries |
| `AutomationService` | Typed networks, processing and graph state |
| `SignalService` | Bounded semantic control/event networks |
| `MagicService` | Flux/spell/rune/ritual runtime ownership |
| `FluidService` | Water/fluid authoritative state |
| `VesselService` | Vessel frames, structure, movement/damage state |
| `RouteService` | Regional road/sea/portal route state |
| `SettlementService` | Settlement membership, needs, projects and policy |
| `EconomyService` | Markets, trade and regional economic state |
| `FactionService` | Culture/faction/government/territory/diplomacy |
| `KnowledgeService` | Observation, fact, rumour, records and discovery |
| `EventService` | Persistent event/quest lifecycle |
| `SaveCoordinator` | Checkpoints, journal, recovery and migration |
| `NetworkService` | Protocol, sessions, authority, replication |
| `InterestService` | Cross-domain interest policy |
| `PresentationStateService` | Semantic presentation state/events |
| `SettingsService` | Profile/world/server settings schema |
| `DiagnosticsService` | Stable metrics/reason/support model |

These are conceptual ownership boundaries, not a requirement to create one giant singleton Node for each row.

PROD-06/task architecture determines actual module/file decomposition.

---

# 42. Service Communication Rules

Preferred communication categories:

1. **Command** — asks an owner to change state.
2. **Query** — asks for current/read-model information.
3. **Committed domain event** — announces a fact after commit.
4. **Worker proposal/result** — non-authoritative calculated output.
5. **Transaction** — coordinated resource/state change with success/failure semantics.
6. **Presentation event/state** — non-authoritative output for visuals/audio/UI.

Avoid using unrestricted global event buses as a substitute for ownership.

Critical mutation paths should be traceable.

---

# 43. Cross-System Transaction Example — Place a Structure Block

A valid construction placement may touch many systems without creating many authorities.

Conceptually:

```text
Builder/NPC task
    ↓
PlaceConstructionBlockCommand
    ↓
ConstructionService validates project/stage
    ↓
Inventory/warehouse reservation consumes exact material
    ↓
VoxelService commits semantic block edit
    ↓
SpatialChangeSet emitted
    ├── Zylann projection/remesh
    ├── nav invalidation
    ├── structure-state update
    ├── persistence journal
    ├── network delta
    └── presentation event
    ↓
Project progress commits
```

No individual consumer may independently pretend the construction succeeded before the owning transaction commits.

---

# 44. Cross-System Transaction Example — Portal Transfer

```text
actor requests portal use
    ↓
permission / ritual / portal-state validation
    ↓
destination RealmInstance + anchor readiness
    ↓
transfer transaction opens
    ↓
source simulation detaches entity
    ↓
canonical realm/frame relation changes
    ↓
destination representation/materialisation
    ↓
inventory/entity state remains same semantic identity
    ↓
transfer commits
    ↓
network / save / presentation notified
```

A failed destination load must have a bounded recovery path rather than leaving the entity in no realm.

---

# 45. Cross-System Transaction Example — Regional Trade Delivery

```text
settlement export order
    ↓
warehouse reservation
    ↓
route/caravan/vessel cargo transaction
    ↓
near/far travel simulation
    ↓
destination arrival
    ↓
warehouse import commit
    ↓
market/economy state reacts
    ↓
history/event/knowledge may record outcome
```

The goods remain the same authoritative stock through each representation.

---

# 46. Runtime Data Ownership by Domain

| Domain | Durable truth |
| --- | --- |
| Voxel world | base generator identity + semantic edits/state |
| Item/inventory | stable item identity + instance state + exact quantities |
| Entity | stable entity identity + persistent domain state |
| Settlement | membership, policy, stock references, projects, history |
| Structure | blueprint identity, placement, state, ownership, damage |
| Machine | definition identity, buffers, process state, network connections |
| Automation network | topology/components/state summaries |
| Water | body/region state, bounded flow/flood data, environmental fields |
| Vessel | local structure/components + world pose + crew/cargo/damage |
| Realm | identity, seed/generator contract, persistent realm state |
| Knowledge | source/confidence/owner/visibility and record identity |
| Quest/event | lifecycle, participants, objectives, consequences, history |
| Faction/government | identity, membership, territory, rules, relationships |
| Player | persistent identity/progression/inventory/reputation as owned by domain |
| World | manifest, settings, realm list, checkpoint lineage, history |

The persistence implementation may physically distribute this truth across multiple stores while one Leyforge contract remains authoritative.

---

# 47. Security and Trust Boundaries

The runtime treats the following as untrusted or validation-required inputs:

- multiplayer client commands;
- imported content packs;
- player-authored Forge content;
- server configuration;
- migrated historical saves;
- external/generated data;
- optional AI proposals.

Every such input enters through schemas/commands/permissions.

No untrusted data gains arbitrary code execution by default.

---

# 48. Optional AI Boundary

Although AI is implemented much later, the runtime must already make the boundary possible.

AI may eventually:

- query authorised read models;
- propose commands;
- propose Forge operations;
- propose events/plans.

It may not mutate world state outside normal authoritative owners.

Therefore no runtime service should require an AI model to exist.

---

# 49. P01–P05 Runtime Foundation Mapping

PROD-03 translates the first production gate directly.

## P01 — The Empty Canvas

Must establish:

- pinned Godot 4.7.2 baseline;
- pinned Zylann integration build/edition;
- repository/runtime module structure;
- WorldService/boot shell;
- logging/diagnostics foundation;
- test entry points;
- build profiles;
- provider version reporting.

P01 does **not** need the final complete runtime service map implemented.

## P02 — Stone Beneath Our Feet

Must establish:

- VoxelService/Zylann adapter;
- semantic↔runtime voxel mapping;
- terrain streaming;
- mesh/collision readiness;
- canonical coordinates sufficient for the local proof;
- worldgen interface.

## P03 — First Footfall

Must establish:

- MovementService foundation;
- player/domain identity;
- body executor boundary;
- canonical/projected movement state;
- basic interaction query.

## P04 — The First Scar

Must establish:

- authoritative edit command;
- transaction validation;
- bulk/edit result;
- SpatialChangeSet;
- remesh/collision readiness response.

## P05 — The World Remembers

Must establish:

- WorldDefinition;
- WorldSession;
- save coordinator foundation;
- semantic edit persistence;
- versioned save manifest;
- clean reload/recovery baseline.

P05 is the first proof that Node/provider lifetime is not world lifetime.

---

# 50. Production Parameters That Must Be Measured, Not Guessed

The architecture intentionally does not hard-code the following without evidence:

- canonical region dimensions;
- simulation partition dimensions;
- persistence region size;
- nav tile size;
- exact active view distance;
- far-LOD technique;
- standard vs double-precision build;
- origin-rebase thresholds;
- Zylann module vs GDExtension packaging;
- storage provider choice;
- database choice;
- exact worker counts;
- exact per-system tick cadences;
- water propagation algorithm;
- vessel-local rendering/collision implementation;
- exact networking snapshot/delta cadence;
- compression formats;
- cache sizes.

These become bounded engineering decisions with benchmark/acceptance criteria.

This follows the existing project rule:

> **Do not decide “16 or 32” by preference when a benchmark can decide it.**

---

# 51. Decisions That Are NOT Open Implementation Parameters

The following are architecture laws unless formally amended:

- stable semantic IDs outrank provider/runtime handles;
- persistent world state is Leyforge-owned;
- SceneTree is active representation, not the world database;
- Zylann is the voxel substrate, not civilisation/world authority;
- worldgen macro intent is Leyforge-owned;
- whole-world checkpoint authority is Leyforge-owned;
- canonical coordinates are not only Godot transforms;
- vessel-local coordinates are first-class;
- workers propose, owners commit;
- simulation LOD is separate from visual/voxel LOD;
- routes are higher-level than local nav;
- gameplay networking semantics are Leyforge-owned;
- untrusted player content is data/schema validated by default;
- presentation does not own gameplay truth;
- single-player uses the same authoritative mutation model needed by multiplayer;
- optional AI never becomes a world-state authority.

---

# 52. Test Architecture

Tests should target Leyforge contracts above providers wherever practical.

Required classes include:

## 52.1 Unit/contract tests

Examples:

- stable ID resolution;
- transaction conservation;
- permission evaluation;
- coordinate/frame conversion;
- deterministic seed derivation;
- schema migration;
- worker stale-result rejection.

## 52.2 Provider-adapter tests

Examples:

- Zylann palette mapping;
- edit projection;
- chunk readiness;
- mesh/collision callbacks;
- Godot navigation/provider behavior;
- storage provider flush/reopen.

## 52.3 Integration tests

Examples:

- block edit → save → unload → reload;
- construction → nav invalidation → NPC route update;
- machine transaction → warehouse stock;
- vessel move → occupant frame handoff;
- portal transfer → save/reload;
- multiplayer simultaneous edit conflict.

## 52.4 Soak/stress tests

Examples:

- long-running simulation;
- repeated chunk load/unload;
- large edit bursts;
- automation graphs;
- large populations;
- save/checkpoint repetition;
- join/leave/reconnect;
- multi-realm activity.

## 52.5 Regression fixtures

Historical POC scenes may be retained where PROD-01 classifies them as useful evidence, but production tests should be rebuilt against current contracts rather than preserving obsolete architecture merely to keep an old scene alive.

---

# 53. Diagnostics and Reason Codes

Critical operations should expose stable diagnostic/reason identifiers rather than only human strings.

Examples:

```text
EDIT_DENIED_PROTECTED_AREA
EDIT_FAILED_STALE_REVISION
INVENTORY_INSUFFICIENT_QUANTITY
MACHINE_BLOCKED_OUTPUT
PORT_INCOMPATIBLE_TYPE
SAVE_PROVIDER_TIMEOUT
SAVE_INTEGRITY_FAILURE
PORTAL_DESTINATION_NOT_READY
NETWORK_COMMAND_PERMISSION_DENIED
CONTENT_REFERENCE_MISSING
MIGRATION_REQUIRED
```

User-facing text/localisation is downstream of these stable semantics.

---

# 54. Shutdown and Drain

A clean WorldSession shutdown must:

1. stop accepting new authoritative work;
2. signal/cancel bounded worker tasks;
3. drain required task results;
4. complete or abort transactions safely;
5. checkpoint/save as policy requires;
6. close network sessions;
7. release provider resources;
8. invalidate session handles/epochs;
9. report unclean leftovers.

This is particularly important for:

- WorkerThreadPool task lifetime;
- native threads;
- Zylann streaming workers;
- persistence;
- dedicated servers.

---

# 55. Crash/Unclean Session Recovery

On next open, the runtime should be able to detect:

- previous unclean shutdown;
- incomplete checkpoint;
- stale temp artifacts;
- journal entries after last published checkpoint;
- provider mismatch;
- content manifest difference.

The recovery policy is implemented progressively, but the architecture preserves the evidence needed for it from P05 onward.

---

# 56. Development Architecture Boundary

Implementation should prefer modules/directories aligned to ownership rather than scene-specific convenience.

Recommended high-level shape:

```text
runtime/
  core/
  world/
  voxel/
  simulation/
  entities/
  movement/
  navigation/
  inventory/
  structures/
  construction/
  automation/
  magic/
  fluids/
  vessels/
  settlements/
  economy/
  factions/
  knowledge/
  events/
  persistence/
  networking/
  presentation/
  settings/
  diagnostics/

providers/
  godot/
  zylann/
  storage/
  network/

tests/
  unit/
  contract/
  integration/
  performance/
  fixtures/
```

Exact folders/names are implementation choices, but ownership boundaries should remain recognisable.

The Forge has its own architecture in PROD-04 and depends on these runtime contracts rather than being buried inside gameplay scenes.

---

# 57. ADR Triggers

An Architecture Decision Record is required for changes affecting at least:

- engine version;
- Zylann integration edition/fork;
- semantic ID format;
- canonical coordinate representation;
- worldgen reproducibility;
- persistence schema/storage boundary;
- save/checkpoint publication;
- simulation ownership;
- major worker/threading model;
- navigation provider strategy;
- water/fluid architecture;
- vessel-local representation;
- networking authority/protocol;
- content-pack trust model;
- native-code escalation;
- public mod/script capability;
- provider/library that would materially shift ownership.

Minor implementation refactors inside an already-locked boundary do not need an ADR merely for ceremony.

---

# 58. Known Risk Register Carried into Production

The following remain high-value proof targets even though the architecture boundary is now clear:

| Risk | Architecture response |
| --- | --- |
| Blocky far-distance LOD | Provider-independent far representation; benchmark before lock |
| Large edit bursts | Bulk change sets, provider profiling, bounded remesh/collision |
| Deep caves/geology | Leyforge worldgen plan + Zylann materialisation proof |
| Simulation LOD fidelity | Explicit promotion/demotion and conservation tests |
| NPC navigation after edits | Spatial invalidation + provider hierarchy |
| Large automation graphs | Incremental graph invalidation/recompute |
| Production water | Separate hydrology/flow/presentation/vessel concerns |
| Moving voxel vessels | Vessel-local spatial frame; no moved terrain assumption |
| Cross-realm persistence | Realm identity above scene loading |
| Multiplayer authority | Same command/transaction architecture from solo onward |
| Save migration | Versioned schemas + stable semantic IDs + coordinator |
| Worker oversubscription | Global diagnostics/budgets across Godot/Zylann/nav/loaders |

---

# 59. Acceptance Gate for PROD-03

PROD-03 is ready for owner lock when the owner agrees that:

- [ ] Godot 4.7.2 stable is the current production engine baseline;
- [ ] Zylann is the voxel substrate and does not own Leyforge semantics;
- [ ] exact Zylann module/GDExtension packaging is an implementation/build decision that must be pinned before P01 completes;
- [ ] Leyforge owns stable IDs and provider mappings are ephemeral;
- [ ] WorldDefinition, WorldSession and RealmInstance are distinct;
- [ ] canonical position is Leyforge-owned and engine transforms are projections;
- [ ] vessel-local and structure-local frames are permitted/first-class where appropriate;
- [ ] voxel chunk, simulation partition, nav tile and persistence region are not forced to share dimensions;
- [ ] worldgen macro planning belongs to Leyforge;
- [ ] provider generation callbacks are deterministic/idempotent where required;
- [ ] authoritative edits publish a shared SpatialChangeSet/invalidation description;
- [ ] workers calculate proposals and owners validate/commit;
- [ ] simulation LOD is distinct from rendering/voxel LOD;
- [ ] whole-world checkpoint authority sits above storage providers;
- [ ] SceneTree Nodes are active projections rather than persistent entity truth;
- [ ] movement/navigation/physics provider boundaries are clear;
- [ ] automation/logistics use conserved transactional state rather than presentation objects;
- [ ] full water/ocean authority remains Leyforge-owned and is not assumed solved by the voxel provider;
- [ ] vessels use a dedicated local-frame architecture rather than moving ordinary terrain;
- [ ] realm/portal transfers are world-state transactions;
- [ ] single-player and multiplayer share the same authoritative mutation model;
- [ ] network peer identity remains separate from persistent player identity;
- [ ] content packs remain schema/manifest governed;
- [ ] presentation cannot become authoritative gameplay state;
- [ ] performance, diagnostics and scalability are architectural requirements from the beginning;
- [ ] unresolved numerical/technology parameters are benchmarked rather than chosen by taste;
- [ ] AI remains optional and outside authoritative mutation paths.

---

# 60. Proposed Lock Statement

If owner-approved, lock the following:

> **PROD-03 — LEYFORGE RUNTIME ENGINEERING ARCHITECTURE — v0.1**
>
> Leyforge owns canonical semantics, persistent world state, authoritative mutation, worldgen intent, spatial identity, simulation, save/checkpoint authority, gameplay networking semantics and cross-system transactions. Godot 4.7.2 is the current runtime/service shell and Zylann Voxel Tools is the specialised voxel substrate; both remain providers beneath Leyforge-owned contracts. SceneTree objects, provider handles, network peers and runtime palette values are disposable execution projections rather than durable semantic identity. Persistent worlds are represented through WorldDefinition, live WorldSession and persistent RealmInstance identities; canonical positions use Leyforge-owned spatial addresses/frames and may be projected into bounded engine-local coordinates. Workers compute revisioned proposals and owners commit canonical state. Whole-world checkpoints coordinate multiple storage providers. Simulation LOD is separate from visual/voxel LOD. Vessels use first-class local spatial frames, water/fluid authority remains Leyforge-owned, and multiplayer uses the same authoritative command/transaction model as local play. Performance, diagnostics, migration, scalability and future multiplayer/AI constraints are designed into the runtime rather than retrofitted after feature completion.

---

# 61. Next Document

After PROD-03 acceptance/reconciliation, continue to:

> **PROD-04 — The Forge Engineering & Creation Journey Architecture**

PROD-04 will define:

- Forge Core services;
- specialist workspaces;
- Creation Journey Engine;
- source → validation → bake → runtime pipeline;
- shared modelling/material/animation/VFX/audio/capture services;
- dependency/composition graph;
- developer vs player authority;
- runtime preview/Test Lab/hot reload;
- package/mod architecture;
- production validation;
- Forge/runtime adapter boundaries.

---

**End of PROD-03 v0.1 — Runtime Engineering Architecture Candidate**
