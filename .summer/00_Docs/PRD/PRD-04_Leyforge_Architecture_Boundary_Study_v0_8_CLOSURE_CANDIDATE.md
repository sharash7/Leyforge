# PRD-04 — Leyforge Architecture Boundary Study

**Project:** Leyforge / Ley Realms / The Forge  
**Document:** PRD-04  
**Version:** 0.8 CLOSURE CANDIDATE  
**Date:** 4 September 2026  
**Status:** PRD-04 CLOSURE CANDIDATE — Rounds 1–8 complete; architecture ownership reconciled; proof/risk/evidence handoff ready; no production-qualification claim  
**Upstream:** PRD-00 v1.0 FINAL; PRD-01 v0.15 CLOSURE CANDIDATE; PRD-02 v0.8 CLOSURE CANDIDATE; PRD-03 v0.8 CLOSURE CANDIDATE; FCC-12/13/14; ENG-GOV/B-OPS  
**Downstream:** PRD-05, PRD-06, PRD-07, PRD-08, PRD-09, LFE, FORGE-ENG

---

# 1. Purpose

PRD-04 converts the pre-rebuild discovery programme into explicit architecture boundaries.

PRD-01 established the technical requirements and unknowns.  
PRD-02 established what the voxel substrate can provide.  
PRD-03 established what Godot and supporting technology can provide.

PRD-04 now answers:

> **Who owns each kind of truth, state, execution, projection and adaptation in Leyforge?**

Its job is to prevent authority inversion before implementation begins.

---

# 2. Round-1 Scope

Round 1 defines:

- top-level Leyforge ↔ Godot ↔ Zylann ↔ Forge ↔ supporting-technology ownership;
- semantic authority classes;
- runtime/projection classes;
- anti-leakage rules;
- SceneTree authority boundary;
- stable-ID vs runtime-handle boundary;
- save/network/provider authority principles;
- initial adapter/facade policy.

Round 1 does **not** choose exact implementation details that still require P3/P4 proof.

---

# 3. Evidence Basis

PRD-02 closure established that:

- Zylann is a strong voxel substrate candidate;
- Zylann runtime palette/type IDs are not Leyforge semantic IDs;
- Leyforge owns whole-world save/checkpoint authority above voxel streams;
- Leyforge owns worldgen planning while Zylann executes local voxel materialisation;
- navigation, fluids, vessels and specialist systems remain Leyforge/provider concerns;
- Module vs GDExtension remains proof-gated.

PRD-03 closure established that:

- Godot 4.7.2 remains the leading engine-shell baseline;
- Godot supplies scene/runtime, rendering, UI/input/audio, Jolt/physics APIs, NavigationServer, ENet, threading, resources, export and profiling;
- SceneTree is not the persistent civilisation database;
- Resource UID is not Leyforge semantic identity;
- SceneMultiplayer wire format is not the durable Leyforge world protocol;
- raw Godot Resource serialization is not the sole long-lived world-save schema;
- PCK loading is not a safe untrusted-code sandbox;
- custom forks/global replacement systems remain evidence-triggered only.

The PRD-03 handoff explicitly requires PRD-04 to define:

- Godot ↔ Leyforge ↔ Zylann ownership;
- coordinates/spatial frames;
- SceneTree vs persistent-domain representation;
- worker/owner/commit topology;
- physics/movement facade;
- voxel/navigation providers;
- network/interest/service-plane boundary;
- save/DB/voxel-store boundary;
- Forge source/bake/runtime boundary;
- mod trust;
- settings/presentation;
- diagnostics/tests/dependencies.

---

# 4. Architecture Decision Maturity

PRD-04 uses four labels:

| Label | Meaning |
|---|---|
| `BOUNDARY-LOCK` | Ownership boundary is sufficiently supported to govern downstream architecture. |
| `CANDIDATE` | Preferred implementation direction; still requires P3/P4 evidence. |
| `PROVIDER-CHOICE` | Responsibility owner is clear but exact provider remains open. |
| `DEFERRED` | Intentionally unresolved here. |

Core rule:

> **PRD-04 may lock who owns a responsibility without locking exactly how that responsibility is implemented.**

---

# 5. Authority Classes

## A0 — Canonical Semantic Authority

Defines what something **is**.

Examples:

- FCC stable IDs;
- materials/forms/states;
- canonical content definitions;
- rules;
- canonical world/entity identifiers;
- schema/message IDs.

Owner: **Leyforge canon/governed definitions**.

## A1 — Authoritative Domain State

Defines what is **currently true**.

Examples:

- inventory ownership;
- settlement population;
- crop/machine state;
- vessel damage/flooding;
- character state;
- committed voxel mutation;
- world history.

Owner: **Leyforge domain services/state owners**.

## A2 — Provider / Execution State

Provider-specific state used to execute A0/A1 truth.

Examples:

- Zylann VoxelBuffer;
- physics body;
- NavigationServer map;
- ENet peer;
- DB row/index;
- worker task.

Owner: provider internally, under Leyforge contract.

## A3 — Presentation / Projection State

Visible/locally active representation.

Examples:

- SceneTree Nodes;
- meshes;
- materials;
- particles;
- audio emitters;
- HUD controls;
- local animation;
- HLOD.

May be destroyed/rebuilt without changing persistent identity.

## A4 — Ephemeral Runtime Handle

Examples:

- Godot RID;
- ObjectID;
- Resource UID;
- NodePath;
- Zylann numeric TYPE;
- peer ID;
- task ID;
- native pointer.

These are never canonical identity.

---

# 6. Master Anti-Inversion Rule

> **Lower authority classes may implement or project higher classes, but may not redefine them.**

Valid:

```text
leyforge:block/stone
    ↓ compiler
runtime TYPE 42
```

Invalid:

```text
TYPE 42
therefore canonical ID = 42
```

Valid:

```text
persistent character ID
    ↓ active projection
CharacterBody3D Node
```

Invalid:

```text
Node exists
therefore canonical character exists
```

Valid:

```text
Leyforge transaction
    ↓
DB + voxel + network projections
```

Invalid:

```text
DB row committed
therefore whole-world transaction is complete
```

---

# 7. Round-1 Boundary Register

## PRD04-BND-001 — Leyforge semantic authority

**Maturity:** `BOUNDARY-LOCK`

Leyforge owns all canonical game/domain semantic identities and rules.

Godot, Zylann and external libraries may reference these identities but may not create canonical meaning independently.

## PRD04-BND-002 — Stable IDs outrank runtime handles

**Maturity:** `BOUNDARY-LOCK`

FCC/Leyforge stable IDs outrank:

- Zylann TYPE/palette indices;
- Resource UIDs;
- RIDs;
- ObjectIDs;
- NodePaths;
- peer IDs;
- DB row IDs;
- file paths.

## PRD04-BND-003 — Persistent domain state is Leyforge-owned

**Maturity:** `BOUNDARY-LOCK`

Persistent people, settlements, machines, ecology, inventories, ownership and history are Leyforge domain state, not engine object state.

## PRD04-BND-004 — Godot role

**Maturity:** `BOUNDARY-LOCK`

Godot is the primary runtime/engine service shell.

It owns execution services such as:

- process/runtime;
- SceneTree;
- platform abstraction;
- rendering;
- UI/input/audio;
- physics APIs;
- NavigationServer;
- network transport primitives;
- threading/server APIs;
- resources;
- export/profiling/tooling.

Godot does not own Leyforge canon.

## PRD04-BND-005 — Zylann role

**Maturity:** `BOUNDARY-LOCK`

Zylann is the specialised voxel substrate.

It may own internal voxel buffers, streaming, meshing, local generation execution, voxel collision and stream hooks.

It does not own semantic IDs, whole-world persistence, civilisation simulation, regional navigation, fluid/ocean authority, vessel semantics or gameplay networking authority.

## PRD04-BND-006 — Forge role

**Maturity:** `BOUNDARY-LOCK`

The Forge owns governed content authoring/compilation workflows.

Forge source authority compiles into provider-specific runtime products through adapters.

## PRD04-BND-007 — Supporting technology role

**Maturity:** `BOUNDARY-LOCK`

Optional DB/test/platform/native technologies live behind governed interfaces and do not become project canon merely because they store or execute data.

## PRD04-BND-008 — SceneTree is active representation

**Maturity:** `BOUNDARY-LOCK`

SceneTree represents local active/presented objects, input, UI, cameras, audio, VFX and physical wrappers.

It is not the canonical database for the whole world.

## PRD04-BND-009 — Node lifetime is not domain lifetime

**Maturity:** `BOUNDARY-LOCK`

Streaming or simulation LOD may create/destroy Nodes without creating/destroying canonical entities.

## PRD04-BND-010 — Runtime handles are non-durable

**Maturity:** `BOUNDARY-LOCK`

RID, ObjectID, NodePath, pointer, peer ID, task ID and transient voxel TYPE are forbidden as durable semantic identity.

## PRD04-BND-011 — Runtime voxel palette adapter

**Maturity:** `BOUNDARY-LOCK`

Leyforge owns a reversible mapping:

```text
semantic voxel key
    ↔
compact runtime handle
```

The Zylann palette is execution state, not semantic truth.

## PRD04-BND-012 — Worldgen authority

**Maturity:** `BOUNDARY-LOCK`

Leyforge owns seed contract, generator version, macro planning, feature identities and deterministic intents.

Zylann executes local block materialisation.

## PRD04-BND-013 — Physics evidence boundary

**Maturity:** `BOUNDARY-LOCK`

Godot/Jolt determines physical evidence such as collision, contacts, motion and force integration.

Leyforge decides gameplay consequences.

## PRD04-BND-014 — Movement authority

**Maturity:** `BOUNDARY-LOCK`

Leyforge owns mover capabilities, traversal rules, permissions and movement state.

CharacterBody3D/RigidBody/etc. are executors/providers.

## PRD04-BND-015 — Navigation hierarchy

**Maturity:** `BOUNDARY-LOCK`

Leyforge owns route intent and regional routing.

Godot NavigationServer is a local surface-navigation provider candidate.

Voxel/grid/volume providers may serve specialist traversal.

## PRD04-BND-016 — Spatial change event

**Maturity:** `CANDIDATE`

Authoritative spatial edits should emit one Leyforge-owned change description consumed by voxel projection, nav invalidation, physics readiness, persistence, networking and specialist systems.

Working name: `SpatialChangeSet`.

## PRD04-BND-017 — Coordinate authority

**Maturity:** `BOUNDARY-LOCK`

Canonical position/address belongs to Leyforge.

`Node3D.global_position` is an execution projection.

## PRD04-BND-018 — Hierarchical coordinate direction

**Maturity:** `CANDIDATE`

Preferred proof direction:

```text
realm/world
  ↓
region/partition/chunk
  ↓
voxel/local integer address
  ↓
sub-voxel local offset
```

Exact widths/sizes remain proof-gated.

## PRD04-BND-019 — Spatial-frame ownership

**Maturity:** `BOUNDARY-LOCK`

Leyforge owns transforms between world, region, vessel-local, structure-local and realm/session frames.

## PRD04-BND-020 — Worker proposal principle

**Maturity:** `BOUNDARY-LOCK`

Workers calculate bounded proposals/results from versioned input.

They do not freely mutate foreign canonical state.

## PRD04-BND-021 — Owner commit principle

**Maturity:** `BOUNDARY-LOCK`

Each mutable authoritative partition has one defined commit authority at a time.

Worker output becomes canonical only after validation and commit.

## PRD04-BND-022 — Owner is not synonymous with main thread

**Maturity:** `BOUNDARY-LOCK`

Ownership is a consistency role.

Exact thread/partition topology is still open.

## PRD04-BND-023 — Revisioned asynchronous work

**Maturity:** `CANDIDATE`

Asynchronous results should carry enough identity/revision context to reject stale work after world/session/state changes.

## PRD04-BND-024 — Save authority

**Maturity:** `BOUNDARY-LOCK`

Leyforge owns whole-world save/checkpoint/recovery authority.

No individual DB, voxel stream or Resource save declares a complete world checkpoint.

## PRD04-BND-025 — Storage-provider boundary

**Maturity:** `BOUNDARY-LOCK`

Voxel stores, structured DBs and file/blob stores participate beneath one Leyforge save coordinator.

## PRD04-BND-026 — Journal/operation identity

**Maturity:** `CANDIDATE`

Consequential operations should have Leyforge-owned IDs/revisions reusable for save recovery, network dedupe, reconnect and diagnostics.

## PRD04-BND-027 — Network protocol authority

**Maturity:** `BOUNDARY-LOCK`

Leyforge owns the durable gameplay/world protocol.

Godot/ENet provide transport/session primitives.

## PRD04-BND-028 — Interest-management authority

**Maturity:** `BOUNDARY-LOCK`

Leyforge owns cross-domain player/session interest and may drive entity replication, voxel streaming, simulation activation and far representation.

## PRD04-BND-029 — Peer identity is not player identity

**Maturity:** `BOUNDARY-LOCK`

Network peer IDs are transient session handles.

Persistent account/player/character/world ownership identities are separate.

## PRD04-BND-030 — Presentation authority

**Maturity:** `BOUNDARY-LOCK`

Visual/audio/UI layers project semantic state.

No renderer-specific effect is allowed to be the only gameplay-significant cue.

## PRD04-BND-031 — Settings authority

**Maturity:** `BOUNDARY-LOCK`

Settings are governed Leyforge definitions.

Godot project settings/widgets are implementation surfaces, not the canonical product settings model.

## PRD04-BND-032 — Mod trust boundary

**Maturity:** `BOUNDARY-LOCK`

Default untrusted player content is data-only and schema-validated.

Script/native extensions are explicit trusted-code tiers.

## PRD04-BND-033 — Content-pack authority

**Maturity:** `BOUNDARY-LOCK`

Pack load order does not define canonical namespace authority.

Leyforge owns manifests, dependencies, namespaces and compatibility.

## PRD04-BND-034 — Diagnostic contract

**Maturity:** `BOUNDARY-LOCK`

Godot/Zylann/provider metrics feed a stable Leyforge diagnostic/support model.

Provider log strings are evidence, not the support schema itself.

## PRD04-BND-035 — Test contract

**Maturity:** `BOUNDARY-LOCK`

Tests should target Leyforge contracts above provider implementations wherever practical.

Provider-specific tests remain necessary at adapter boundaries.

## PRD04-BND-036 — Dependency authority

**Maturity:** `BOUNDARY-LOCK`

Third-party libraries are governed implementation dependencies.

Adding a library does not transfer system ownership to it.

---

# 8. Master Ownership Matrix

| Concern | Canonical owner | Executor/provider | Projection |
|---|---|---|---|
| semantic stable IDs | Leyforge/FCC | registry/compiler | provider handles |
| persistent people | Leyforge domain | simulation/storage | active Nodes |
| settlements/economy | Leyforge domain | simulation/DB candidate | UI/world projection |
| voxel semantics | Leyforge world contract | Zylann | mesh/collision |
| runtime voxel palette | Leyforge adapter | Zylann library | TYPE/channel values |
| worldgen plan | Leyforge | Zylann generator execution | terrain |
| rendering | Leyforge presentation policy | Godot renderer | pixels |
| physics | Leyforge gameplay rules | Godot/Jolt | bodies/contacts |
| movement | Leyforge mover system | Godot body executor | animated actor |
| local ground path | Leyforge movement facade | NavigationServer | path |
| long route | Leyforge regional router | Leyforge/provider | route plan |
| flying/swimming path | Leyforge movement facade | specialist provider | route |
| world network schema | Leyforge protocol | ENet/Godot peer | packets |
| session transport | Leyforge session service | Godot/ENet | peer |
| checkpoint | Leyforge save coordinator | DB/Zylann/files | artifacts |
| Forge authoring | The Forge | Godot/UI/native tools | sources |
| content bake | Forge/Leyforge compiler | provider adapters | runtime assets |
| settings | Leyforge | Godot APIs | menus/widgets |
| diagnostics | Leyforge | provider metrics | logs/support bundle |
| CI/test policy | ENG-GOV/Leyforge | Godot CLI/test framework | reports |

---

# 9. Boundary-Crossing Rule

Use a facade/adapter when a boundary carries semantic meaning or replacement risk.

Preferred:

```text
Gameplay
  ↓
PhysicsFacade
  ↓
Godot/Jolt
```

```text
World
  ↓
VoxelFacade
  ↓
Zylann
```

```text
Movement
  ↓
NavigationProvider
  ├── Godot navmesh
  ├── voxel/grid
  └── flight/swim
```

This is not abstraction for its own sake.

It is to keep provider details from becoming impossible-to-remove game law.

---

# 10. Anti-Leakage List

These may exist internally but may not become durable semantic identity without explicit mapping:

- Zylann TYPE number;
- voxel-channel slot;
- RID;
- ObjectID;
- Resource UID;
- NodePath;
- SceneTree location;
- physics-body instance;
- NavigationServer RID;
- ENet/Godot peer ID;
- RPC checksum;
- DB rowid;
- file path;
- worker task ID;
- native pointer.

---

# 11. Projection-Rebuild Rule

Provider/projection state should be conceptually rebuildable from authoritative state where reasonable.

Examples:

```text
destroy active NPC Node
→ recreate from persistent character state

rebuild runtime voxel palette
→ regenerate semantic mapping

rebuild nav tile
→ derive from current spatial state

reconnect client
→ restore from stable session/world state
```

---

# 12. Technology-Replacement Rule

The architecture should allow evidence-driven provider replacement without redefining canon.

Examples:

- Module ↔ GDExtension;
- Jolt ↔ another qualified physics provider;
- one local nav provider ↔ another;
- SQLite adapter ↔ another structured store;
- GUT ↔ GdUnit4;
- renderer tier ↔ another renderer tier.

Replacement need not be cheap.

It must not require redefining what Leyforge content/world state *means*.

---

# 13. Round-1 Locked Invariants

1. Leyforge owns semantic truth.
2. Leyforge owns authoritative persistent domain state.
3. Godot is the primary runtime service shell.
4. Zylann is the voxel substrate/provider.
5. The Forge owns governed source authoring/compilation.
6. Runtime handles do not become canonical IDs.
7. SceneTree is projection, not persistent world DB.
8. Node/projection lifetime does not equal domain lifetime.
9. Worldgen semantic planning sits above Zylann.
10. Physics results are evidence consumed by gameplay law.
11. Movement capability sits above physical executors.
12. Regional route intent sits above local navigation.
13. Canonical coordinates sit above engine transforms.
14. Workers propose; defined owners commit.
15. Whole-world checkpoint authority sits above storage providers.
16. Leyforge owns the durable network protocol.
17. Leyforge owns cross-domain interest management.
18. Presentation cannot be the sole semantic carrier.
19. Default untrusted content cannot execute arbitrary code.
20. Diagnostics/tests/dependencies remain governed through stable project contracts.

---

# 14. Deliberately Unlocked

Round 1 does not yet choose:

- exact coordinate integer widths;
- region/chunk dimensions;
- standard vs double precision production baseline;
- Module vs GDExtension production edition;
- simulation partition size;
- owner thread topology;
- final physics facade API;
- final vessel local-frame implementation;
- navigation tile size;
- ENet channel layout;
- binary protocol codec;
- SQLite wrapper;
- GUT vs GdUnit4;
- Forge canonical source serialization;
- mod archive format;
- launch-platform matrix.

These stay routed to later PRD-04 rounds and PRD-06/07 proof.

---

# 15. Round-1 Risk Register

| ID | Risk | Severity | Response |
|---|---|---:|---|
| `PRD04-R01-01` | engine convenience becomes semantic authority | RED | enforce A0→A4 hierarchy |
| `PRD04-R01-02` | duplicate authoritative owners | RED | name one commit authority per mutable partition |
| `PRD04-R01-03` | SceneTree becomes persistence graph | RED | persistent IDs/state outside projection |
| `PRD04-R01-04` | runtime handles written into durable saves | RED | schema validation |
| `PRD04-R01-05` | provider APIs spread through gameplay | AMBER/RED | semantic facades |
| `PRD04-R01-06` | too many meaningless abstractions | AMBER | adapters only at real boundaries |
| `PRD04-R01-07` | boundary lock freezes unproven implementation | RED | separate ownership lock from candidate implementation |
| `PRD04-R01-08` | worker directly mutates foreign state | RED | proposal/revision/owner commit |
| `PRD04-R01-09` | DB or voxel stream independently claims checkpoint | RED | outer save coordinator |
| `PRD04-R01-10` | peer ID becomes player ID | RED | stable identity mapping |
| `PRD04-R01-11` | pack load order creates canon | RED | manifest/namespace governance |
| `PRD04-R01-12` | visual effect becomes gameplay truth | RED | semantic fallback contract |

---

# 16. Proof Obligations Created by Round 1

## PRD04-PROOF-01 — Projection destruction/rebuild

Destroy/recreate active Node, physics body, nav representation, voxel palette and network projection.

Persistent identity/state must survive.

## PRD04-PROOF-02 — Runtime-ID randomization

Change palette ordering, Resource paths, NodePaths, object creation order and DB row ordering.

Save/network/domain meaning must stay stable.

## PRD04-PROOF-03 — Provider swap

Run one bounded fixture through alternative providers/editions without changing the gameplay-facing contract.

## PRD04-PROOF-04 — Cross-boundary transaction

One construction action must coherently touch inventory, voxel state, structure state, persistence, nav/physics invalidation and networking.

Inject failures at every boundary.

---

# 17. Working Architecture

```text
                         LEYFORGE
              A0 CANONICAL SEMANTIC AUTHORITY
                             │
                             ▼
               A1 AUTHORITATIVE DOMAIN STATE
                             │
               owners / transactions / revisions
                             │
           ┌─────────────────┼─────────────────┐
           │                 │                 │
           ▼                 ▼                 ▼
      GODOT FACADE      ZYLANN FACADE    SUPPORT FACADE
           │                 │                 │
           ▼                 ▼                 ▼
     A2 provider state  A2 voxel state    A2 DB/tool state
           │                 │                 │
           └─────────────────┼─────────────────┘
                             │
                             ▼
                   A3 PRESENTATION/PROJECTION
                  SceneTree / meshes / audio / UI
                             │
                             ▼
                    A4 EPHEMERAL HANDLES
               RID / ObjectID / TYPE / peer / task
```

**Authority flows downward.**

**Provider evidence/results flow upward through governed contracts.**

Canonical meaning never originates from an ephemeral handle.

---

# 18. Round-1 Gate Result

**PASS — CONTINUE PRD-04**

No contradiction was found between the PRD-02 and PRD-03 handoffs.

The core boundary is now explicit:

> **Leyforge owns meaning and authoritative world state. Godot, Zylann and supporting technologies execute, store or project that state behind governed boundaries.**

---

# 19. Planned PRD-04 Rounds

1. **Round 1 — Top-level ownership, authority classes and anti-leakage rules** — **COMPLETE**
2. **Round 2 — Canonical coordinates, WorldSession, spatial frames and SceneTree projection lifecycle** — **COMPLETE**
3. **Round 3 — Simulation partitions, workers, owners, revisions, task/lifetime and commit topology** — **COMPLETE**
4. **Round 4 — Voxel, physics, movement, navigation, fluids and vessel integration facades** — **COMPLETE**
5. **Round 5 — Network protocol, interest management, save coordinator, database and reconnect boundaries** — **COMPLETE**
6. **Round 6 — Forge source/bake/runtime pipeline, content packs, mod trust and settings/presentation boundaries** — **COMPLETE**
7. **Round 7 — Diagnostics, tests, build/dependency boundaries and whole-stack transaction/interface reconciliation** — **COMPLETE**
8. **Round 8 — Final architecture map, conditional decisions, proof handoff and PRD-04 closure candidate** — **COMPLETE**

---

# 20. Immediate Next Action

Proceed to:

> **PRD-04 Round 2 — Canonical coordinates, WorldSession, spatial frames and SceneTree projection lifecycle.**

Round 2 will define how these relate without confusing one another:

- realm/world identity;
- canonical coordinates;
- regions/chunks;
- active local engine coordinates;
- vessels/structures/local frames;
- streaming;
- WorldSession lifetime;
- projection creation/destruction;
- single-player/listen/dedicated-server session consistency.

The governing distinction is:

> **Canonical position is Leyforge data. `Node3D.global_position` is a current execution projection.**

---

**ROUND-1 RESULT: TOP-LEVEL OWNERSHIP / AUTHORITY CLASS / ANTI-LEAKAGE ARCHITECTURE COMPLETE.**

---

# 21. Round-2 Scope

Round 2 defines the conceptual spatial/session architecture needed to support:

- huge streamed worlds;
- multiple realms;
- local active physics/rendering;
- Zylann terrain streaming;
- player travel over extreme distances;
- vessels and other moving local coordinate frames;
- structures with local coordinates;
- single-player;
- listen-hosted multiplayer;
- dedicated servers;
- remote clients;
- world unload/reload;
- safe asynchronous task cancellation/rejection.

The core question is:

> **How does Leyforge describe where something is and which world-session it belongs to without making Godot's current transform tree the canonical source of truth?**

Round-2 answer:

> **Leyforge should use canonical world/session identity plus hierarchical spatial addresses, then project bounded active regions into one or more engine-local frames. Godot transforms, Zylann terrain coordinates and physics bodies become local execution projections of that canonical address space.**

---

# 22. Core Spatial Vocabulary

Round 2 introduces the following conceptual terms.

## 22.1 WorldDefinition

The persistent identity/configuration of a saved world.

Contains or references things such as:

- stable `world_id`;
- world seed/generator contract;
- world schema version;
- content/registry manifest;
- created realms and their persistent identities;
- world-level options;
- world history/checkpoint lineage.

A `WorldDefinition` can exist while no game process currently has it open.

## 22.2 WorldSession

A live runtime opening of a `WorldDefinition`.

A WorldSession owns or coordinates live runtime concerns such as:

- loaded authoritative world state;
- active realms;
- current checkpoint/journal context;
- simulation ownership;
- active spatial frames;
- streaming;
- runtime registry/palette mappings;
- save coordinator;
- network/server session integration;
- task epochs/lifetimes.

A WorldSession is **ephemeral relative to the persistent world**.

## 22.3 RealmInstance

A persistent/runtime realm identity within a world.

Examples:

- Overworld;
- Ancestral Veil;
- Somnolent Expanse;
- Ascendant Reach;
- Impossible Deep;
- Ashen Lower Realms.

Realm identity is not inferred from which Godot scene is loaded.

## 22.4 CanonicalSpatialAddress

A Leyforge-owned durable spatial address.

Conceptually:

```text
WorldID
RealmID
SpatialCell / Region coordinate
Local integer coordinate
Sub-unit offset
```

Exact integer widths and cell sizes remain proof-gated.

## 22.5 SpatialFrame

A coordinate frame used to represent a bounded local space.

Examples:

- realm/world active frame;
- vessel-local frame;
- structure-local frame;
- temporary simulation/work frame.

A SpatialFrame has a stable Leyforge frame identity and a transform relationship to another canonical frame.

## 22.6 EngineLocalTransform

The current Godot-facing local transform used for rendering/physics/Nodes.

It is derived from canonical spatial state plus current active-frame mapping.

It is not canonical persistence identity.

---

# 23. WorldDefinition vs WorldSession

The persistent world and the live runtime session must be distinct.

```text
WORLD DEFINITION
persistent saved identity
      │
      │ open
      ▼
WORLD SESSION
live authority / loaded state
      │
      ├── active RealmInstance(s)
      ├── simulation partitions
      ├── active spatial frames
      ├── Zylann terrain projections
      ├── SceneTree projections
      ├── physics/navigation projections
      ├── save coordinator
      └── network/session services
      │
      │ close
      ▼
WORLD DEFINITION remains
```

Consequences:

- quitting the game destroys the WorldSession, not the world;
- a server restart creates a new WorldSession over the same persistent world;
- reconnecting a client does not create a new world;
- a single-player world opened for online hosting retains the same WorldDefinition;
- runtime task IDs/Nodes/RIDs from the old session are invalid in the new session.

---

# 24. Round-2 Boundary Register

## PRD04-BND-037 — Persistent world identity

**Maturity:** `BOUNDARY-LOCK`

A saved Leyforge world has a stable `world_id` independent of:

- filesystem path;
- save-folder name;
- Godot process;
- server address;
- active scene;
- WorldSession lifetime.

Renaming or moving the world directory must not create a new world identity.

---

## PRD04-BND-038 — WorldSession identity

**Maturity:** `BOUNDARY-LOCK`

Every live opening of a world has a distinct runtime `world_session_id` or equivalent session epoch.

The session identifier is used to reject stale work and stale runtime handles from a previous opening of the same persistent world.

---

## PRD04-BND-039 — WorldDefinition / WorldSession split

**Maturity:** `BOUNDARY-LOCK`

Persistent world definition/history and live WorldSession execution are separate architecture objects.

The same WorldDefinition may be opened in different runtime modes over its lifetime.

---

## PRD04-BND-040 — Runtime mode does not redefine world identity

**Maturity:** `BOUNDARY-LOCK`

Opening the same world as:

- single-player;
- listen host;
- dedicated server;

does not create a different canonical world.

Network topology is an execution mode around the same persistent semantic world.

---

## PRD04-BND-041 — Remote client session is a replica, not world authority

**Maturity:** `BOUNDARY-LOCK`

A remote multiplayer client may maintain a local client-side WorldSession projection/cache, but the authoritative WorldSession remains server-side.

Client-local scene/voxel/physics state is not independent canonical world truth.

---

## PRD04-BND-042 — Realm identity is persistent semantic state

**Maturity:** `BOUNDARY-LOCK`

Realm identity is Leyforge data.

It is not inferred from:

- which scene is loaded;
- world-space Y coordinate;
- a Zylann terrain node;
- a portal Node;
- server port.

---

## PRD04-BND-043 — Realm-local coordinate spaces

**Maturity:** `BOUNDARY-LOCK`

Canonical positions are scoped by realm/world identity before local spatial coordinates are interpreted.

Coordinates `(100, 60, 100)` in the Overworld and Impossible Deep are not the same location merely because the numeric tuple matches.

---

## PRD04-BND-044 — Realm transitions are transactions

**Maturity:** `BOUNDARY-LOCK`

Cross-realm travel is an explicit Leyforge transition transaction.

It must update:

- canonical realm/address;
- active interest;
- streaming;
- projection ownership;
- physics/navigation state;
- network visibility where applicable;
- save/journal evidence.

It is not implemented semantically as "move the Node very far away."

---

## PRD04-BND-045 — Canonical spatial address ownership

**Maturity:** `BOUNDARY-LOCK`

Leyforge owns the durable spatial address representation.

Godot `Vector3`/Transform3D and Zylann block coordinates are adapters/projections.

---

## PRD04-BND-046 — Canonical address is hierarchical

**Maturity:** `CANDIDATE`

The preferred canonical address family contains:

```text
world
realm
coarse spatial cell/region
local integer position
sub-unit offset
```

This is the default architecture direction unless P3 evidence shows a better equivalent representation.

---

## PRD04-BND-047 — Integer-first large spatial address

**Maturity:** `CANDIDATE`

Large-scale canonical addressing should use integer/coarse-cell components rather than one unbounded floating-point world position.

Sub-voxel motion may use bounded local numeric offsets.

Exact widths remain deferred.

---

## PRD04-BND-048 — Engine coordinates are bounded local projections

**Maturity:** `BOUNDARY-LOCK`

Godot rendering/physics coordinates should operate inside a bounded active frame rather than being the sole persistent global coordinate representation.

This remains true whether production ultimately uses single or double precision.

---

## PRD04-BND-049 — Precision build is an execution decision

**Maturity:** `BOUNDARY-LOCK`

Standard vs double precision does not change canonical world addresses.

It changes the precision/range of engine-side active projections.

Therefore save/network identity must not serialize raw engine precision as the only positional truth.

---

## PRD04-BND-050 — Active origin/frame may move without moving the canonical world

**Maturity:** `BOUNDARY-LOCK`

Leyforge may reposition/rebase an active engine frame for precision/performance.

Canonical addresses remain unchanged.

A frame rebase is a projection operation, not world mutation.

---

## PRD04-BND-051 — Frame rebase must be coordinated

**Maturity:** `CANDIDATE`

If active-frame origin rebasing is used, it must be coordinated across relevant:

- SceneTree projections;
- Zylann terrain projections;
- physics;
- navigation;
- cameras;
- audio;
- particles;
- interpolation;
- network/client prediction state.

Exact mechanism remains P3/P4 work.

---

## PRD04-BND-052 — SpatialFrame has Leyforge identity

**Maturity:** `BOUNDARY-LOCK`

A vessel/structure/local frame is identified by a Leyforge stable runtime/domain identifier, not only by a Node transform.

Its transform relationship to parent/world space is part of authoritative or derived Leyforge state.

---

## PRD04-BND-053 — Parent-frame hierarchy is explicit

**Maturity:** `CANDIDATE`

Spatial frames should form an explicit, bounded hierarchy such as:

```text
RealmFrame
   ├── Region/ActiveFrame
   │      └── Entity projection
   └── VesselFrame
          ├── deck/interior structure
          └── occupant projection
```

Arbitrary deep transform nesting should not become the canonical spatial model.

---

## PRD04-BND-054 — Vessel-local coordinates are first-class

**Maturity:** `BOUNDARY-LOCK`

Objects structurally belonging to a vessel may use stable vessel-local coordinates.

A vessel moving through the world must not require rewriting every internal block/component's semantic local coordinate.

---

## PRD04-BND-055 — Vessel world pose is separate from vessel-local content

**Maturity:** `BOUNDARY-LOCK`

A vessel has:

1. a world/realm pose/address for the vessel frame;
2. vessel-local spatial state for hull, machinery, cargo fixtures and other internal components.

Moving the vessel updates the frame pose, not the canonical local coordinates of every block.

---

## PRD04-BND-056 — Structure-local coordinates are permitted

**Maturity:** `BOUNDARY-LOCK`

Large authored/generated structures may maintain local coordinates for semantic composition where useful.

Their canonical world placement is defined through a frame/placement relation.

This is especially useful for:

- blueprints;
- dungeons;
- large machines;
- vessel interiors;
- generated complexes.

---

## PRD04-BND-057 — Static structure local frame may collapse at runtime

**Maturity:** `CANDIDATE`

A static structure may compile/materialize directly into ordinary world voxels and cease needing an active runtime frame after placement.

The source/structure identity remains separately recordable if gameplay requires it.

---

## PRD04-BND-058 — Dynamic frame crossing requires explicit handoff

**Maturity:** `BOUNDARY-LOCK`

Moving an entity between world-local and vessel-/structure-local authority is an explicit handoff.

Examples:

- boarding a ship;
- disembarking;
- stepping into a moving lift;
- entering an isolated moving structure.

The handoff updates authoritative parent/frame relation and must not be inferred only from scene parenting.

---

## PRD04-BND-059 — Scene parenting is projection, not canonical parentage

**Maturity:** `BOUNDARY-LOCK`

A Node becoming a child of a vessel Node does not by itself establish canonical ownership/attachment.

Leyforge domain state determines frame/attachment semantics; SceneTree parenting projects them.

---

## PRD04-BND-060 — Canonical orientation is Leyforge-owned where persistent

**Maturity:** `BOUNDARY-LOCK`

Persistent orientation/rotation is represented through a Leyforge schema suitable for the owning domain/frame.

Godot Quaternion/Basis/Transform may be used as runtime representations but are not the only durable contract by default.

---

## PRD04-BND-061 — Zylann chunk coordinates are provider-local

**Maturity:** `BOUNDARY-LOCK`

Zylann data/mesh block coordinates and sizes remain voxel-provider implementation details.

Canonical region/simulation coordinates do not have to equal Zylann chunk coordinates.

Mappings may intentionally differ.

---

## PRD04-BND-062 — Simulation partition != voxel chunk != nav tile

**Maturity:** `BOUNDARY-LOCK`

These spatial granularities solve different problems:

- canonical coarse address;
- simulation partition;
- Zylann data block;
- mesh block;
- navigation tile;
- network interest cell;
- save/checkpoint region.

They may align for performance where proven, but alignment is not semantic law.

---

## PRD04-BND-063 — Streaming state is not existence state

**Maturity:** `BOUNDARY-LOCK`

Loaded/unloaded status does not determine whether a canonical entity/place exists.

Streaming changes representation/residency.

Persistent existence is separate.

---

## PRD04-BND-064 — Loaded voxel data is not simulation activation

**Maturity:** `BOUNDARY-LOCK`

A Zylann block being loaded/meshed/collidable does not automatically mean the corresponding ecology/civilisation/economy simulation must be active at full fidelity.

Simulation LOD is Leyforge-owned.

---

## PRD04-BND-065 — Active projection set is interest-driven

**Maturity:** `CANDIDATE`

SceneTree/physics/audio/VFX/local-navigation projections should be created according to governed active-interest/simulation policies rather than persisted indefinitely.

Exact policies are deferred to later rounds/PRD-07.

---

## PRD04-BND-066 — Projection creation is idempotent against canonical identity

**Maturity:** `BOUNDARY-LOCK`

Creating the active projection for an already-existing canonical entity must not accidentally create a duplicate semantic entity.

Projection factories resolve/create by stable ID.

---

## PRD04-BND-067 — Projection destruction is non-destructive by default

**Maturity:** `BOUNDARY-LOCK`

Destroying/unloading an A3 projection must not delete authoritative A1 state unless an explicit domain transaction says the entity/place is destroyed.

---

## PRD04-BND-068 — Projection lifecycle has explicit states

**Maturity:** `CANDIDATE`

Active objects should conceptually move through lifecycle states such as:

```text
UNLOADED
  ↓
REQUESTED
  ↓
DATA_READY
  ↓
PROJECTION_CREATING
  ↓
ACTIVE
  ↓
RETIRING
  ↓
UNLOADED
```

Special systems may add readiness gates such as physics/nav/network readiness.

---

## PRD04-BND-069 — Physical readiness is distinct from visual readiness

**Maturity:** `BOUNDARY-LOCK`

An area/entity may be visually present before all required physics/navigation data is ready, or vice versa.

Gameplay activation uses explicit readiness contracts where correctness depends on them.

---

## PRD04-BND-070 — Teleport/fast-travel activation is a spatial transaction

**Maturity:** `BOUNDARY-LOCK`

Fast travel/teleport requires:

1. authoritative destination resolution;
2. target realm/frame selection;
3. destination interest/preload;
4. required data readiness;
5. physics-safe placement;
6. canonical position commit;
7. projection/interpolation reset;
8. old-interest release.

It is not merely an instantaneous Node transform assignment.

---

## PRD04-BND-071 — WorldSession owns runtime spatial mapping

**Maturity:** `BOUNDARY-LOCK`

The live mapping between canonical spatial addresses and current engine-local frames belongs to the WorldSession.

Provider Nodes/systems query/use that mapping; they do not define it independently.

---

## PRD04-BND-072 — WorldSession owns session-scoped runtime registries

**Maturity:** `BOUNDARY-LOCK`

Runtime mappings tied to a live world opening—such as:

- semantic↔voxel palette;
- active projection handles;
- loaded frame mappings;
- task epochs;
- client peer mapping;

belong to the WorldSession or explicit subservices.

They are rebuilt on a new session.

---

## PRD04-BND-073 — WorldSession lifetime gates asynchronous work

**Maturity:** `BOUNDARY-LOCK`

Any async job capable of returning after world close/reopen must be identifiable as belonging to a specific WorldSession/session epoch.

Results from an ended session are rejected.

---

## PRD04-BND-074 — Realm lifetime may be shorter than WorldSession

**Maturity:** `CANDIDATE`

A WorldSession may keep some realms unloaded/inactive while the persistent world remains open.

Activating/deactivating a realm is a runtime residency decision, not realm creation/deletion.

---

## PRD04-BND-075 — WorldSession close is a coordinated barrier

**Maturity:** `BOUNDARY-LOCK`

Closing a WorldSession must coordinate:

- stop/refuse new domain commands;
- stop or invalidate new async work;
- finish/cancel/reject in-flight work safely;
- checkpoint/save as policy requires;
- drain provider writes;
- detach network peers;
- destroy projections;
- release provider/session resources.

The exact shutdown sequence is refined later.

---

## PRD04-BND-076 — WorldSession reopen creates new runtime epochs

**Maturity:** `BOUNDARY-LOCK`

Reopening the same persistent world creates new runtime session/epoch identities.

Old:

- task IDs;
- Nodes;
- RIDs;
- peer IDs;
- active-frame mappings;
- provider handles;

must not be accepted as current merely because the persistent `world_id` matches.

---

## PRD04-BND-077 — Single-player authority uses the same world contract

**Maturity:** `BOUNDARY-LOCK`

Single-player should use the same authoritative world/domain contracts as multiplayer server mode wherever practical.

Network serialization may be bypassed locally, but semantic transactions and ownership rules should remain equivalent.

---

## PRD04-BND-078 — Listen server is server authority plus local client projection

**Maturity:** `BOUNDARY-LOCK`

A listen-host session should be conceptually:

```text
authoritative server WorldSession
           +
local client/player projection
```

The host player does not receive special semantic authority merely because both execute in one process.

---

## PRD04-BND-079 — Dedicated server has no required visual projection

**Maturity:** `BOUNDARY-LOCK`

The authoritative WorldSession must operate without requiring:

- camera;
- visible mesh;
- local audio;
- HUD;
- client-only resources.

Server-required collision/query/voxel/simulation data remains available independently.

---

## PRD04-BND-080 — Client cache/residency is disposable

**Maturity:** `BOUNDARY-LOCK`

A remote client's locally loaded:

- voxel blocks;
- entity Nodes;
- nav data;
- render assets;
- predicted states;

are cache/projection state and may be discarded/reconstructed from authoritative protocol state.

---

## PRD04-BND-081 — Client canonical addresses use server-compatible schema

**Maturity:** `BOUNDARY-LOCK`

Networked spatial messages use Leyforge canonical/frame-aware addressing, not raw client `global_position` as the only durable location contract.

This permits differing local origins/precision implementations between server and client.

---

## PRD04-BND-082 — Interest areas are frame-aware

**Maturity:** `CANDIDATE`

Interest queries should operate over canonical/frame-aware space so they remain valid across:

- active-origin rebases;
- realms;
- vessels;
- split-screen/local multiple viewers;
- server/client projection differences.

---

## PRD04-BND-083 — Cross-frame proximity requires canonical transformation

**Maturity:** `BOUNDARY-LOCK`

Two objects in different local frames cannot be compared reliably using their raw local engine positions.

Spatial queries crossing frames transform through Leyforge frame relationships first.

---

## PRD04-BND-084 — Cross-frame physics remains provider-constrained

**Maturity:** `PROVIDER-CHOICE`

Canonical frames may be independent of how active physics is implemented.

PRD-04 does not assume one Godot PhysicsServer space per frame.

The provider strategy must be chosen by vessel/local-frame prototypes.

---

## PRD04-BND-085 — Frame ownership survives region crossing

**Maturity:** `BOUNDARY-LOCK`

A moving vessel/frame can cross canonical region boundaries without changing its stable frame identity or rebuilding all local semantic coordinates.

Only its parent/world pose/address changes.

---

## PRD04-BND-086 — Large structure identity survives chunk/region fragmentation

**Maturity:** `BOUNDARY-LOCK`

A structure spanning multiple voxel chunks, nav tiles, save regions or simulation partitions remains one semantic structure where canon/gameplay says so.

Provider partitioning does not split semantic identity.

---

## PRD04-BND-087 — Canonical time is not engine frame time

**Maturity:** `BOUNDARY-LOCK`

World/session simulation time and historical timestamps must not derive their canonical meaning solely from:

- rendered frame count;
- Node `_process()` count;
- local OS time;
- physics-frame index.

Exact world-clock architecture is deferred to Round 3.

---

## PRD04-BND-088 — Realm clocks may be governed independently if canon requires

**Maturity:** `DEFERRED`

The spatial/session architecture allows realm-specific temporal rules without encoding them into Godot scene lifetime.

Whether any realm actually needs differentiated time is content/system authority, not assumed here.

---

# 25. Canonical Address Model — Working Candidate

Round 2 does not lock concrete field widths, but adopts the following conceptual family:

```text
CanonicalAddress
  world_id
  realm_id
  coarse_cell = (cx, cy, cz)
  local_voxel = (vx, vy, vz)
  local_offset = (ox, oy, oz)
```

Where:

```text
coarse_cell
= very large integer address space

local_voxel
= bounded integer location inside coarse cell

local_offset
= bounded sub-voxel movement/placement precision
```

Potential benefits:

- stable deterministic voxel addressing;
- compact network/save representation;
- avoids requiring one huge float/double vector;
- active-frame rebasing is cheap conceptually;
- aligns naturally with chunk/region indexing;
- works with vessel-local coordinates.

Potential risk:

- complexity at every cross-cell/frame operation.

Therefore the interface must make common operations safe and ergonomic.

---

# 26. Coordinate Type Separation

Round 2 recommends distinct conceptual types instead of passing generic `Vector3` everywhere.

Candidate semantic type family:

```text
CanonicalWorldAddress
RealmAddress
VoxelAddress
LocalOffset
SpatialFrameID
FrameLocalTransform
EngineLocalTransform
```

Anti-pattern:

```text
func teleport(pos: Vector3):
    ...
```

when it is unclear whether `pos` means:

- canonical world coordinate;
- local current frame;
- vessel local;
- renderer local;
- physics local;
- voxel index.

Preferred architecture makes coordinate domain explicit at API boundaries.

---

# 27. Frame Graph — Working Candidate

A bounded explicit frame graph:

```text
WorldDefinition
   │
WorldSession
   │
RealmFrame
   │
   ├── ActiveWorldFrame
   │      ├── ordinary actor projections
   │      ├── local Zylann terrain projection
   │      └── local physics/navigation
   │
   ├── VesselFrame A
   │      ├── hull/local blocks
   │      ├── machinery
   │      └── occupants/attached objects
   │
   └── StructureFrame B
          └── local authored structure data
```

Not every semantic object needs a frame.

Frames are reserved for spatial domains where local coordinates provide real value.

---

# 28. SceneTree Projection Layout — Candidate

Round 2 recommends that SceneTree organisation follow projection/runtime needs rather than become the semantic object graph.

Illustrative layout:

```text
/Runtime
  /WorldSessionProjection
    /RealmProjections
      /Overworld
        /ActiveFrame
          /Terrain
          /Entities
          /Structures
          /VFX
          /Audio
        /DynamicFrames
          /Vessel_<runtime-projection>
    /UI
    /Cameras
```

Persistent entity/structure relationships remain outside this tree in Leyforge state.

Therefore scene reorganisation does not become save-schema migration.

---

# 29. Projection Registry

A WorldSession should maintain a lookup conceptually equivalent to:

```text
stable semantic/runtime domain ID
       ↔
current active projection handle
```

Examples:

```text
character_id → Node/Object handle
vessel_id → Vessel projection
structure_id → active projection
realm_id → realm runtime projection
```

The mapping is session-scoped and disposable.

It must tolerate:

- no projection;
- projection creation;
- replacement;
- destruction;
- realm unload;
- session shutdown.

---

# 30. WorldSession Runtime-Service Candidate

A live WorldSession likely coordinates or owns interfaces to:

```text
WorldSession
├── Identity / SessionEpoch
├── RealmRuntimeRegistry
├── SpatialFrameService
├── RuntimePaletteRegistry
├── ProjectionRegistry
├── SimulationCoordinator
├── InterestManager
├── VoxelFacade
├── PhysicsFacade
├── NavigationFacade
├── SaveCoordinator
├── NetworkSession/Protocol service
├── Domain storage
└── Diagnostics
```

This is a conceptual ownership map.

It does **not** require one enormous God object/class.

Later architecture may implement these as separate services with one WorldSession composition root.

---

# 31. WorldSession State Machine — Candidate

```text
CLOSED
  ↓ open requested
OPENING
  ↓ identity/schema/manifest validated
LOADING
  ↓ authoritative stores ready
STARTING
  ↓ services/realms/runtime mappings ready
ACTIVE
  ↓ close/drain requested
DRAINING
  ↓ final checkpoint/provider drain
CLOSING
  ↓ resources released
CLOSED
```

Failure states should be explicit and recoverable:

```text
OPEN_FAILED
RECOVERY_REQUIRED
INCOMPATIBLE_CONTENT
CORRUPT_CHECKPOINT
```

Exact state names are deferred, but an explicit lifecycle is accepted as necessary.

---

# 32. Player Travel Scenarios

## 32.1 Ordinary long-distance walking

Canonical address changes continuously.

Active frame may eventually rebase.

The world does not move semantically.

## 32.2 Fast travel

Destination is resolved canonically first.

Destination representations are prepared.

Player projection moves only after required readiness.

## 32.3 Portal realm transition

RealmID and canonical address change in one governed transaction.

Old realm interest/projections retire after destination activation.

## 32.4 Boarding a vessel

Entity's parent/frame relation changes:

```text
Realm/World frame
       ↓
VesselFrame
```

Its vessel-local position becomes authoritative for attached/local movement as defined by the movement/vessel system.

## 32.5 Vessel crosses a region boundary

Only vessel world pose/address crosses the coarse boundary.

Hull/machine local addresses do not all get rewritten.

---

# 33. Single-Player → Online Hosting

Round 2 explicitly supports the retained requirement that a previously single-player world can become hosted multiplayer.

Conceptually:

```text
existing WorldDefinition
        ↓
open WorldSession as listen/server authority
        ↓
attach network/session services
        ↓
admit clients
```

This should **not** require:

- cloning the world into a different schema;
- changing canonical entity IDs;
- changing coordinate representation;
- converting SceneTree Nodes into server objects.

The same persistent world contracts already support server authority.

---

# 34. Dedicated Server / Client Relationship

```text
DEDICATED SERVER
  WorldDefinition
      ↓
  Authoritative WorldSession
      ↓
  canonical world/domain state
      ↓
  Leyforge protocol
      ↓
────────────────────────────
      ↓
REMOTE CLIENT
  client session/projection
      ↓
  local interest cache
  local voxel blocks
  local Nodes
  local render/physics prediction
```

The client may use a different active local origin from the server as long as both can encode/decode canonical addresses correctly.

This is strategically important for large worlds.

---

# 35. Split-Screen Relationship

Local split-screen introduces multiple viewers, not multiple canonical worlds.

Candidate:

```text
one authoritative local WorldSession
        ↓
multiple LocalPlayer projections
        ↓
multiple interest/view requests
        ↓
multiple Viewports/cameras
```

Interest management may union or budget the local viewers.

A Viewport does not own a world/session.

---

# 36. Spatial Readiness Contract

A destination/activity may require multiple readiness conditions.

Candidate readiness dimensions:

```text
DATA_READY
VOXEL_READY
VISUAL_READY
PHYSICS_READY
NAV_READY
DOMAIN_READY
NETWORK_SYNC_READY
```

Not every action needs every dimension.

Examples:

- cosmetic distant object: maybe visual only;
- teleport destination: voxel + physics + domain + network;
- NPC pathing: domain + nav + physical collision where active;
- server headless region: domain + voxel/query, no visual.

This allows correctness without blocking everything on maximum readiness.

---

# 37. Session Epoch / Stale Work Pattern

Every async result that can outlive a projection or world state should validate something equivalent to:

```text
world_id
world_session_epoch
realm_id
owner/partition
input_revision
task_generation
```

Example:

```text
Nav bake starts
  world_session = 44
  tile revision = 100

world closes
new session = 45

old bake finishes

session mismatch → reject
```

This prevents the classic:

> old background task writes into a newly opened world.

---

# 38. World-Switch Barrier

The PRD-02 save/stream world-switch concern generalises into the whole architecture.

Before the process changes from World A to World B:

1. stop accepting new commands into World A;
2. invalidate/cancel async work;
3. checkpoint/drain according to policy;
4. detach provider targets;
5. destroy session projections;
6. release/replace session-scoped adapters;
7. construct World B session with a new epoch.

No provider may simply have its target path/world reference overwritten while old work still exists.

---

# 39. Round-2 Master Spatial Ownership Matrix

| Concern | Canonical owner | Runtime/service owner | Provider projection |
|---|---|---|---|
| world identity | WorldDefinition/Leyforge | WorldSession opener | folder/server UI |
| live session identity | Leyforge WorldSession | session lifecycle | process/runtime handles |
| realm identity | Leyforge | RealmRuntimeRegistry | scene/terrain projections |
| canonical position | Leyforge spatial service/domain | WorldSession SpatialFrameService | Godot/Zylann coordinates |
| active origin | WorldSession projection policy | SpatialFrameService | Node/physics/terrain origin |
| vessel local coordinates | vessel domain | vessel spatial/frame service | local transforms/mesh |
| structure local coordinates | structure domain/Forge | structure projection service | world voxels/Nodes |
| scene parenting | Leyforge attachment relation | ProjectionRegistry | SceneTree |
| Zylann block coordinate | voxel adapter | Zylann | provider coordinates |
| simulation residency | Leyforge simulation | SimulationCoordinator | active systems |
| render residency | Leyforge interest/presentation | ProjectionRegistry | Nodes/meshes |
| physics residency | Leyforge activity policy | PhysicsFacade | bodies/shapes |
| nav residency | Leyforge movement/nav facade | NavigationFacade | nav maps/tiles |
| client world cache | server protocol semantics | client session | local blocks/Nodes |

---

# 40. Round-2 Risk Register

| ID | Risk | Severity | Response |
|---|---|---:|---|
| `PRD04-R02-01` | raw global Vector3 becomes canonical world coordinate | RED | hierarchical canonical address |
| `PRD04-R02-02` | standard/double precision changes save format semantics | RED | precision-independent address schema |
| `PRD04-R02-03` | active-origin shift mutates canonical world | RED | projection-only rebase |
| `PRD04-R02-04` | Node parent defines persistent attachment | RED | explicit frame/attachment state |
| `PRD04-R02-05` | vessel crossing region rewrites every internal coordinate | RED | stable VesselFrame |
| `PRD04-R02-06` | Zylann chunk == simulation/nav/network/save region by assumption | RED | independent granularities |
| `PRD04-R02-07` | unloaded entity treated as destroyed | RED | existence/residency split |
| `PRD04-R02-08` | loaded voxel block activates full simulation | RED | sim LOD independent |
| `PRD04-R02-09` | world reopen accepts old async result | RED | session epoch validation |
| `PRD04-R02-10` | world-switch retargets providers with pending work | RED | coordinated barrier |
| `PRD04-R02-11` | teleport commits before physics/data ready | RED | readiness transaction |
| `PRD04-R02-12` | remote client local origin assumed equal to server | RED | canonical network coordinates |
| `PRD04-R02-13` | dedicated server requires render projections | RED | headless domain/projection split |
| `PRD04-R02-14` | split-screen creates duplicated world authority | RED | one world, multiple viewers |
| `PRD04-R02-15` | frame hierarchy becomes arbitrary scene-transform graph | AMBER/RED | governed bounded frame graph |
| `PRD04-R02-16` | local/canonical coordinate types are interchangeable | RED | explicit spatial types/contracts |

---

# 41. Round-2 Proof Obligations

## PRD04-PROOF-05 — Extreme Coordinate Walk

Represent the same canonical entity at:

- origin;
- tens of kilometres;
- hundreds/thousands of kilometres;
- very large coarse-cell coordinates.

Compare:

- standard precision;
- double precision;
- local-frame rebasing.

Canonical address must remain exact/stable.

## PRD04-PROOF-06 — Origin Rebase Torture

During:

- walking;
- physics contact;
- projectile;
- vehicle/vessel movement;
- nav;
- particles/audio;
- voxel streaming;

rebase the active frame.

No semantic teleport or stale provider reference may occur.

## PRD04-PROOF-07 — World Close/Reopen Stale Task

Launch delayed:

- save;
- voxel generation;
- nav bake;
- DB query;
- network block preparation.

Close/reopen the same world before completion.

Old results must be rejected.

## PRD04-PROOF-08 — Vessel Region Crossing

A voxel vessel with internal components/occupants crosses many coarse cells/regions.

Verify:

- vessel ID unchanged;
- local hull coordinates unchanged;
- world pose updates;
- occupants retain correct local/world transforms;
- persistence/network stay stable.

## PRD04-PROOF-09 — Realm Transition Transaction

Cross realm through portal under:

- normal play;
- save during transition;
- disconnect/reconnect;
- destination loading delay;
- transition failure.

Exactly one canonical realm/address becomes committed.

## PRD04-PROOF-10 — Single Player → Listen Host

Open same saved world:

1. single-player;
2. close;
3. listen host;
4. admit remote client.

Stable IDs/world coordinates/save semantics must remain unchanged.

## PRD04-PROOF-11 — Headless WorldSession

Start real server export with no renderer.

Load world/realm, simulate, query voxels/physics/navigation as required, save and shut down.

No client visual assets required for authoritative state.

## PRD04-PROOF-12 — Projection Eviction

Repeatedly unload/reload:

- NPC;
- machine;
- structure;
- voxel region;
- vessel projection.

Persistent identity and domain state must survive thousands of cycles.

---

# 42. Round-2 New Architecture Unknowns

1. Exact canonical coarse-cell size?
2. Exact integer widths for cell coordinates?
3. Exact local voxel coordinate width?
4. Fixed-point vs float/double sub-voxel offsets?
5. Should canonical orientation use fixed-point/quaternion/compressed representation?
6. Should canonical address normalize automatically when local position crosses a coarse-cell edge?
7. Should negative cell/local coordinates be canonicalized into one unique representation?
8. How are extremely large realms bounded, if at all?
9. Is every realm 3D-addressed even if gameplay geometry is effectively surface-oriented?
10. Does the Overworld use one RealmFrame or several top-level active frames?
11. Can multiple distant active frames exist simultaneously on a server?
12. Can multiple active frames exist in one client for split-screen players far apart?
13. If yes, can one Godot physics space efficiently represent them?
14. Can one Zylann terrain instance represent multiple far-separated active windows without precision problems?
15. When should a client rebase its active origin?
16. When should a server rebase, if ever?
17. Should dedicated server avoid frame rebasing by using bounded provider frames per active area?
18. Can standard precision plus per-interest local frames outperform a whole-engine double build?
19. Does double precision reduce need for rebases enough to justify memory/compatibility cost?
20. How does Zylann Module vs GDExtension interact with chosen precision/frame strategy?
21. How are world-space raycasts specified from canonical addresses?
22. How do projectile trajectories cross coarse-cell/frame boundaries?
23. How do long beams/lasers/spells cross frame boundaries?
24. How are cross-frame distances computed without precision loss?
25. How do large explosions/area effects overlap multiple coarse cells?
26. What spatial index operates over canonical frame/region space?
27. Does each RealmInstance own its own top-level spatial index?
28. How are portals indexed between realm spaces?
29. Can a moving vessel span multiple canonical coarse cells at once?
30. Which address is authoritative for a vessel: origin/anchor, center of mass or bounding volume reference?
31. How are vessel bounding volumes indexed into world spatial queries?
32. How are occupants represented while walking freely on a moving deck?
33. When exactly does an occupant switch between world frame and VesselFrame?
34. Can an entity interact simultaneously with world and vessel objects without changing parent frame?
35. Are nested moving frames allowed, e.g. lift inside ship?
36. If nested frames are allowed, what maximum depth is supported?
37. Do rail cars/carts need local frames or only vessel-scale objects?
38. Do large machines with moving subassemblies need semantic frames or ordinary component transforms?
39. When does a StructureFrame collapse into world voxels after construction?
40. How do blueprints preserve source-local coordinates after world materialization?
41. What stable identifier represents an active SpatialFrame?
42. Are SpatialFrame IDs persistent across save/load for vessels?
43. Are temporary active-world frame IDs session-only?
44. How are frame transforms journaled?
45. How are frame transforms replicated efficiently over network?
46. How are canonical coordinates compressed into network packets?
47. Does the client receive coarse cell + local offsets or delta-to-interest-origin encoding?
48. How are server/client local origins negotiated or inferred?
49. What happens if server and client use different engine precision builds?
50. How does prediction reconcile across a local-origin rebase?
51. How does interpolation reset during rebase/teleport?
52. How are particles/trails handled through frame rebases?
53. How are audio emitters/listeners rebased?
54. Can NavigationServer maps be relocated/rebased safely?
55. Should nav maps be generated in frame-local coordinates from the start?
56. How are world and vessel navigation connected?
57. Does boarding use a navigation link whose endpoint belongs to a moving frame?
58. How does a portal destination become `PHYSICS_READY` before player commit?
59. Which readiness flags are mandatory per gameplay transaction?
60. How long may old visual state exist while canonical position already moved?
61. Should visual transition occur before or after authoritative commit for portals?
62. How does save recovery resolve a half-completed realm transition?
63. How does reconnect resolve a player who disconnected during transition?
64. Which WorldSession services are authoritative server-only?
65. Which services also exist as client-side mirrors?
66. Does single-player instantiate a server-style service composition in-process?
67. Should listen host run logical server/client layers separately even if same process?
68. Can local split-screen players share one client session or need distinct player-session objects?
69. How does interest union work for widely separated split-screen players?
70. What maximum number of simultaneously active distant regions is budgeted?
71. What does `RealmRuntimeRegistry` actually contain?
72. When is a realm runtime projection fully unloaded?
73. Can distant simulation continue for an unloaded realm?
74. Does unloaded realm simulation use pure domain state without Zylann/SceneTree?
75. What task classes must be drained vs simply invalidated on WorldSession shutdown?
76. How long may shutdown wait for storage providers?
77. What happens if provider drain times out?
78. Which session identifiers are persisted for crash diagnosis but not semantic identity?
79. How does crash recovery distinguish previous session epoch from new session?
80. What logs/diagnostics record active frame/origin mappings?
81. Should debug UI show canonical and engine-local coordinates simultaneously?
82. What Forge tools are needed to visualize coarse cells/spatial frames?
83. How are canonical coordinate migrations performed if field widths/partition strategy change before V1?
84. Which PRD-01 unknowns are fully resolved by this boundary versus merely narrowed?

---

# 43. Round-2 Architecture Diagram

```text
                    PERSISTENT WORLD
                     WorldDefinition
                           │
                           │ open
                           ▼
                      WorldSession
          world_session_id / epoch / authority
                           │
                ┌──────────┴──────────┐
                │                     │
          RealmInstance(s)       Session Services
                │                save/network/sim
                │
         CanonicalAddress
                │
         SpatialFrameService
                │
      ┌─────────┼──────────────┐
      │         │              │
ActiveWorld  VesselFrame   StructureFrame
   Frame          │              │
      │           │              │
      └───────────┼──────────────┘
                  │
          engine-local mapping
                  │
       ┌──────────┼─────────────┐
       │          │             │
    Godot      Zylann        Providers
 SceneTree     terrain      physics/nav/audio
       │          │             │
       └──────────┼─────────────┘
                  │
             projections
```

---

# 44. Round-2 Locked Invariants

Round 2 locks:

1. A persistent world and a live WorldSession are different.
2. Every live opening gets a new session epoch/identity.
3. Realm identity is canonical Leyforge data.
4. Canonical positions are realm-aware.
5. Cross-realm movement is a transaction.
6. Canonical position is not raw Godot global position.
7. Canonical addressing is precision-build independent.
8. Engine coordinates are bounded projections.
9. Active-frame rebasing may not mutate canonical location.
10. Vessel-local coordinates are first-class.
11. Vessel local content does not get rewritten on every world movement.
12. Scene parenting is not canonical attachment.
13. Zylann chunking does not dictate every other spatial partition.
14. Streaming residency is separate from semantic existence.
15. Voxel loaded state is separate from simulation fidelity.
16. Projection creation/destruction must preserve identity.
17. Teleport/fast travel is a readiness-gated transaction.
18. WorldSession owns live canonical↔engine mapping.
19. Async work is session-epoch gated.
20. World close/switch is a coordinated barrier.
21. Single-player, listen server and dedicated server use the same persistent world contract.
22. Remote client state is a projection/cache of server authority.
23. Network positions use canonical/frame-aware schema.
24. Dedicated servers require no visual projection.
25. Large structures/vessels keep semantic identity across provider partitions.

---

# 45. Round-2 Gate Result

**PASS — CONTINUE PRD-04**

The coordinate/session architecture is sufficiently clear to proceed into simulation ownership and concurrency topology.

Round 2 does **not** select final coordinate widths, precision build, frame rebase algorithm or vessel physics implementation.

It locks the more important architecture:

> **Leyforge owns persistent world/session/realm/frame identity and canonical spatial addresses. Engine-local coordinates are bounded projections created by a live WorldSession.**

---

# 46. Updated PRD-04 Round Sequence

1. **Round 1 — Top-level ownership, authority classes and anti-leakage rules** — **COMPLETE**
2. **Round 2 — Canonical coordinates, WorldSession, spatial frames and SceneTree projection lifecycle** — **COMPLETE**
3. **Round 3 — Simulation partitions, workers, owners, revisions, task/lifetime and commit topology** — **NEXT**
4. **Round 4 — Voxel, physics, movement, navigation, fluids and vessel integration facades**
5. **Round 5 — Network protocol, interest management, save coordinator, database and reconnect boundaries**
6. **Round 6 — Forge source/bake/runtime pipeline, content packs, mod trust and settings/presentation boundaries**
7. **Round 7 — Diagnostics, tests, build/dependency boundaries and whole-stack transaction/interface reconciliation**
8. **Round 8 — Final architecture map, conditional decisions, proof handoff and PRD-04 closure candidate**

---

# 47. Immediate Next Action

Proceed to:

> **PRD-04 Round 3 — Simulation partitions, workers, owners, revisions, task/lifetime and commit topology.**

Round 3 must answer:

- what constitutes a simulation partition;
- who owns mutable state;
- how workers read snapshots and return proposals;
- how revisions/epochs prevent stale commits;
- how distant/active simulation fidelity changes;
- how cross-partition transactions work;
- whether any state may commit off the main thread;
- how Godot/Zylann/Navigation worker pools coexist;
- how shutdown/drain works across task systems;
- how domain state remains testable outside SceneTree.

The governing distinction is:

> **Thread location is an execution detail. Authority/ownership is a consistency rule.**

---

**ROUND-2 RESULT: CANONICAL COORDINATE / WORLDSESSION / SPATIAL-FRAME / PROJECTION-LIFECYCLE ARCHITECTURE COMPLETE.**

---

# 48. Round-3 Scope

Round 3 defines how Leyforge may simulate a very large persistent world concurrently without allowing multiple systems to mutate the same authoritative state incoherently.

It covers:

- simulation partitions;
- mutable-state owners;
- immutable/versioned snapshots;
- workers and provider jobs;
- proposals/results;
- revisions and ownership epochs;
- cross-partition commands/transactions;
- simulation fidelity/LOD;
- world/domain clocks;
- backpressure and cancellation;
- shutdown/drain semantics;
- SceneTree-independent domain simulation.

Round-3 answer:

> **Every mutable authoritative state partition has one current commit authority. Workers/providers calculate against versioned input and return proposals or evidence. A result becomes canonical only after the current owner validates session, ownership and revision context and commits it.**

---

# 49. Core Simulation Vocabulary

**Simulation Partition** — bounded ownership domain for mutable state. It may be spatial, semantic or hybrid.

**State Owner** — authority currently allowed to commit changes to that partition/domain. Ownership is a consistency role, not automatically a thread.

**Snapshot** — immutable/versioned state supplied to workers or providers.

**Proposal / Result** — computed output that is not authoritative until accepted by the owner.

**Revision** — version marker used to detect stale or conflicting work.

**Ownership Epoch** — generation identifying the current ownership period of a partition/entity.

**Command** — intent addressed to an owner.

**Event** — fact published after a committed change.

---

# 50. Round-3 Boundary Register

## PRD04-BND-089 — One commit authority per mutable state
**Maturity:** `BOUNDARY-LOCK`

Every mutable authoritative state partition/domain has one current commit authority.

## PRD04-BND-090 — Ownership may be spatial, semantic or hybrid
**Maturity:** `BOUNDARY-LOCK`

Leyforge does not require one universal partitioning scheme. Settlements, vessels, realm systems, ecology and spatial world state may use different ownership models.

## PRD04-BND-091 — Simulation partition is not provider partition
**Maturity:** `BOUNDARY-LOCK`

Simulation partitions are not automatically equal to Zylann chunks, nav tiles, DB pages, SceneTree branches, save regions or network-interest cells.

## PRD04-BND-092 — Partition migration does not change semantic identity
**Maturity:** `BOUNDARY-LOCK`

Moving an entity between owners/partitions preserves its stable Leyforge identity.

## PRD04-BND-093 — Domain simulation must work without SceneTree
**Maturity:** `BOUNDARY-LOCK`

Persistent people, settlements, machines, ecology and economy must be simulatable while no active Node exists.

## PRD04-BND-094 — Active projections are not sole domain owners
**Maturity:** `BOUNDARY-LOCK`

A Node/physics body may cache execution state but cannot become the only persistent authority for the represented domain entity.

## PRD04-BND-095 — Workers read versioned snapshots
**Maturity:** `BOUNDARY-LOCK`

Worker jobs consume immutable/versioned snapshots or explicitly thread-safe owned data, not arbitrary mutable world graphs.

## PRD04-BND-096 — Worker output is a proposal until commit
**Maturity:** `BOUNDARY-LOCK`

Default pattern:

```text
snapshot → worker/provider → proposal/result → owner validation → commit
```

## PRD04-BND-097 — Stale result rejection is mandatory
**Maturity:** `BOUNDARY-LOCK`

Results are rejected or explicitly reconciled when WorldSession, ownership epoch, input revision or task generation is stale.

## PRD04-BND-098 — Revision scope is explicit
**Maturity:** `BOUNDARY-LOCK`

Revisions may be scoped per entity, owner/partition, spatial tile, aggregate or transaction stream. One global counter is not assumed.

## PRD04-BND-099 — Revision semantics are Leyforge-owned
**Maturity:** `BOUNDARY-LOCK`

Provider timestamps/task IDs do not replace Leyforge revision semantics.

## PRD04-BND-100 — Ownership transfer is explicit
**Maturity:** `BOUNDARY-LOCK`

State moves between owners through a defined handoff rather than simultaneous shared mutation.

## PRD04-BND-101 — Ownership epochs invalidate old mutation rights
**Maturity:** `CANDIDATE`

Worker output from an older ownership epoch cannot commit after transfer.

## PRD04-BND-102 — Cross-owner mutation uses commands/transactions
**Maturity:** `BOUNDARY-LOCK`

One owner does not directly mutate another owner's internals.

## PRD04-BND-103 — Cross-domain transaction authority is Leyforge-owned
**Maturity:** `BOUNDARY-LOCK`

Construction, trade, realm travel, vessel commissioning and similar operations spanning multiple owners use an explicit Leyforge orchestration/transaction contract.

## PRD04-BND-104 — Complex transactions may be multi-phase
**Maturity:** `CANDIDATE`

Validation, reservation/preparation, commit, event publication and durability may be separate phases where required.

## PRD04-BND-105 — Heavy distributed transactions are not assumed globally
**Maturity:** `BOUNDARY-LOCK`

Use the minimum consistency protocol that satisfies each domain's semantics.

## PRD04-BND-106 — Commands are intent; events are committed facts
**Maturity:** `BOUNDARY-LOCK`

Example:

```text
Command: attempt block placement
Event: block placement committed
```

## PRD04-BND-107 — Event callback order is not global commit order
**Maturity:** `BOUNDARY-LOCK`

Ordering guarantees are explicit per event stream/domain.

## PRD04-BND-108 — Cross-boundary events use stable IDs/revisions
**Maturity:** `BOUNDARY-LOCK`

Events do not require recipients to dereference foreign Nodes/RIDs/pointers.

## PRD04-BND-109 — Simulation fidelity is Leyforge-owned
**Maturity:** `BOUNDARY-LOCK`

Distance, interest and load may change simulation fidelity independently from provider residency.

## PRD04-BND-110 — Simulation LOD preserves identity
**Maturity:** `BOUNDARY-LOCK`

A person/settlement/ecology entity may move between detailed and aggregate simulation without becoming a different semantic entity.

## PRD04-BND-111 — Fidelity transitions are explicit
**Maturity:** `BOUNDARY-LOCK`

Promotion/demotion preserves identity, conserved resources, ownership, commitments and relevant history.

## PRD04-BND-112 — Distant simulation may run without physics/rendering
**Maturity:** `BOUNDARY-LOCK`

Abstract simulation may progress while no Node, physics body, nav agent or voxel mesh is active.

## PRD04-BND-113 — No per-frame update requirement per entity
**Maturity:** `BOUNDARY-LOCK`

Leyforge may use fixed ticks, scheduled updates, batched region jobs, event-driven updates and aggregate simulation.

## PRD04-BND-114 — Simulation clock is Leyforge-owned
**Maturity:** `BOUNDARY-LOCK`

World simulation time is not defined by render FPS or `_process()` count.

## PRD04-BND-115 — Physics cadence and domain cadence may differ
**Maturity:** `BOUNDARY-LOCK`

Physics may run at one cadence while economy/ecology/civilisation update at others.

## PRD04-BND-116 — Determinism requirements are domain-specific
**Maturity:** `BOUNDARY-LOCK`

Only domains needing replay/network/recovery determinism receive stricter deterministic contracts.

## PRD04-BND-117 — Authoritative randomness is explicit input
**Maturity:** `BOUNDARY-LOCK`

Authoritative random outcomes use governed seeds/streams/context rather than uncontrolled global RNG calls.

## PRD04-BND-118 — Scheduling does not confer authority
**Maturity:** `BOUNDARY-LOCK`

A scheduler decides when/where work runs, not whether it is canonical.

## PRD04-BND-119 — No custom whole-engine scheduler by default
**Maturity:** `BOUNDARY-LOCK`

Start by composing Godot workers, provider workers and Leyforge owner queues. A replacement scheduler requires evidence.

## PRD04-BND-120 — Provider worker pools remain contract-isolated
**Maturity:** `BOUNDARY-LOCK`

Zylann, navigation, DB and Godot worker systems may use different execution pools.

## PRD04-BND-121 — CPU budget is cross-provider
**Maturity:** `CANDIDATE`

WorldSession should coordinate concurrency/backpressure so voxel, navigation, simulation, DB and network work do not independently saturate all cores.

## PRD04-BND-122 — Main-thread commit is not universal
**Maturity:** `BOUNDARY-LOCK`

SceneTree/provider APIs may require main-thread commits, while pure domain owners may safely commit elsewhere if designed for it.

## PRD04-BND-123 — SceneTree mutation crosses a projection boundary
**Maturity:** `BOUNDARY-LOCK`

Workers/domain services do not mutate arbitrary Nodes directly.

## PRD04-BND-124 — Provider callbacks are translated before foreign domain mutation
**Maturity:** `BOUNDARY-LOCK`

Godot/Zylann/provider signals become Leyforge evidence/commands/events before affecting unrelated authority.

## PRD04-BND-125 — Backpressure is mandatory
**Maturity:** `BOUNDARY-LOCK`

Simulation, voxel, nav, DB, network and projection queues must be bounded, coalesced, cancelled or admission-controlled.

## PRD04-BND-126 — Superseded work may be coalesced
**Maturity:** `BOUNDARY-LOCK`

Obsolete nav bakes, presentation refreshes and similar derived work may be dropped/coalesced. Consequential transactions may not be silently discarded.

## PRD04-BND-127 — Cancellation is not rollback
**Maturity:** `BOUNDARY-LOCK`

Cancelling computation does not undo already committed canonical state.

## PRD04-BND-128 — Every long task has an owner
**Maturity:** `BOUNDARY-LOCK`

Long-running tasks have defined cancellation, stale-result, error, shutdown and diagnostic handling.

## PRD04-BND-129 — Shutdown distinguishes drain/cancel/invalidate
**Maturity:** `BOUNDARY-LOCK`

Tasks are classified as drain-required, cancellable, invalidate-only or provider-drain work.

## PRD04-BND-130 — Durable and disposable work are distinct
**Maturity:** `BOUNDARY-LOCK`

Checkpoint/journal writes are treated differently from obsolete nav/path/presentation work.

## PRD04-BND-131 — Failures return to the owning domain
**Maturity:** `BOUNDARY-LOCK`

Owners decide retry, degrade, reject, quarantine or recovery policy.

## PRD04-BND-132 — Partition migration is recoverable
**Maturity:** `CANDIDATE`

Ownership transfer/repartitioning must leave an unambiguous state recoverable after crash/restart.

## PRD04-BND-133 — Owner lookup is explicit
**Maturity:** `BOUNDARY-LOCK`

Given a stable entity/domain ID, the system can resolve its current owner without SceneTree hierarchy.

## PRD04-BND-134 — Cross-partition references use stable IDs
**Maturity:** `BOUNDARY-LOCK`

Foreign authoritative state is referenced by Leyforge IDs, not durable raw pointers.

## PRD04-BND-135 — Derived read models may duplicate data, not authority
**Maturity:** `BOUNDARY-LOCK`

Spatial indexes, market summaries, nav occupancy and interest summaries may cache data but remain rebuildable derivatives.

## PRD04-BND-136 — Cache invalidation is revision/event driven
**Maturity:** `BOUNDARY-LOCK`

Derived state has governed invalidation/update rules.

## PRD04-BND-137 — Eventual consistency is semantic-specific
**Maturity:** `BOUNDARY-LOCK`

Far presentation and cached UI may lag; inventory, ownership, damage and block commits require stronger consistency.

## PRD04-BND-138 — Strong operations expose explicit commit points
**Maturity:** `BOUNDARY-LOCK`

Consequential operations define when mutation becomes canonical.

## PRD04-BND-139 — Secondary side effects follow authoritative decision
**Maturity:** `BOUNDARY-LOCK`

Navigation, physics, networking and presentation react to a committed domain decision rather than deciding whether the action occurred.

## PRD04-BND-140 — Reservation before expensive projection is permitted
**Maturity:** `CANDIDATE`

Resources/ownership may be reserved while provider preparation occurs, with explicit reservation/final states.

## PRD04-BND-141 — Domain APIs prefer command/query/event boundaries
**Maturity:** `CANDIDATE`

External systems should not freely mutate internal containers.

## PRD04-BND-142 — Hot-loop data layout may differ from domain object layout
**Maturity:** `BOUNDARY-LOCK`

Compact arrays/SoA/batches are allowed internally without changing semantic identity.

## PRD04-BND-143 — One heavyweight object per simulated thing is not required
**Maturity:** `BOUNDARY-LOCK`

Large distant populations/jobs/crops may be represented as compact aggregate data.

## PRD04-BND-144 — Active projection properties have defined synchronization ownership
**Maturity:** `BOUNDARY-LOCK`

Domain/physics/animation/UI properties cannot have uncontrolled competing writers.

## PRD04-BND-145 — Property-level authority may differ within one entity
**Maturity:** `BOUNDARY-LOCK`

Inventory, locomotion, physical velocity, animation pose and UI state may have different owners with explicit boundaries.

## PRD04-BND-146 — Physics evidence goes through gameplay authority
**Maturity:** `BOUNDARY-LOCK`

Contacts/forces do not directly mutate health/ownership/inventory.

## PRD04-BND-147 — Navigation result is a disposable proposal
**Maturity:** `BOUNDARY-LOCK`

Paths can be rejected/replanned after terrain, mover, destination, partition or session changes.

## PRD04-BND-148 — Voxel generation cannot overwrite newer authoritative edits
**Maturity:** `BOUNDARY-LOCK`

Generated blocks are accepted under worldgen/edit revision rules.

## PRD04-BND-149 — Distant simulation preserves conserved state
**Maturity:** `BOUNDARY-LOCK`

People, resources, ownership, production/trade obligations and structure state cannot disappear because fidelity is lower.

## PRD04-BND-150 — Fidelity promotion reconstructs detail from authority
**Maturity:** `CANDIDATE`

Detailed active entities are created from canonical aggregate/history/identity state.

## PRD04-BND-151 — Fidelity demotion commits detail before projection loss
**Maturity:** `BOUNDARY-LOCK`

Active details are reconciled into canonical domain state before demotion/unload.

## PRD04-BND-152 — Simulation scheduling may prioritize domain importance
**Maturity:** `CANDIDATE`

Candidate factors include proximity, quests/events, danger, transaction pressure, age since update and cost.

## PRD04-BND-153 — Analytical time-skipping is permitted where valid
**Maturity:** `CANDIDATE`

Distant systems may advance `t0 → t1` without every intermediate tick when domain invariants remain satisfied.

## PRD04-BND-154 — Presentation callbacks cannot be sole simulation drivers
**Maturity:** `BOUNDARY-LOCK`

Visibility, particles, UI and `_process()` cannot determine whether authoritative progression occurs.

## PRD04-BND-155 — Diagnostics include ownership/revision context
**Maturity:** `BOUNDARY-LOCK`

Stale/conflict reports include world/session, owner, epoch/revision, task/command and rejection reason.

## PRD04-BND-156 — Replay/audit evidence is selective
**Maturity:** `BOUNDARY-LOCK`

Consequential transactions receive stronger evidence than disposable simulation micro-work.

## PRD04-BND-157 — Checkpoints capture ownership-consistent state
**Maturity:** `BOUNDARY-LOCK`

Checkpointing cannot freeze an entity halfway through an uncommitted ownership transfer.

## PRD04-BND-158 — Network replication follows committed authority
**Maturity:** `BOUNDARY-LOCK`

Worker proposals and uncommitted reservations are not transmitted as final world truth unless explicitly modeled as such.

---

# 51. Candidate Ownership / Work Topology

```text
WorldSession
    │
SimulationCoordinator
    │
 ┌──┼─────────────────────┐
 │  │                     │
Owner A               Owner B
rev 101               rev 88
 │                       │
 └── snapshots ───────────┘
          │
   Worker / Provider Pools
          │
    proposals / evidence
          │
          ▼
     OWNER VALIDATION
          │
        COMMIT
          │
 ┌────────┼───────────────┐
 │        │               │
events  journal/save   projection/network
```

---

# 52. Candidate Simulation Fidelity Ladder

Illustrative only:

```text
S0 Dormant/Historical
   scheduled events / canonical state

S1 Distant Aggregate
   populations/resources/jobs/statistics

S2 Regional Detailed
   settlements/groups/production/travel

S3 Local Active
   individual agents/local paths/structures

S4 Physical
   precise collision/combat/interaction
```

Not every domain needs every level.

The invariant is identity and conservation across transitions.

---

# 53. Consistency Classes

## C0 — Strong authoritative commit

Examples:

- inventory ownership;
- currency/trade transfer;
- block edit;
- health/damage;
- player canonical position;
- vessel ownership;
- realm transition.

## C1 — Revision-bounded derived state

Examples:

- nav tile;
- physics proxy rebuild;
- spatial/read indexes.

May lag briefly but must carry source-revision context.

## C2 — Disposable presentation/cache

Examples:

- far mesh;
- UI summary;
- particles;
- cosmetic analytics.

May be dropped/rebuilt freely.

---

# 54. Candidate Shutdown / Drain Model

```text
DRAIN REQUESTED
      ↓
stop new external commands
      ↓
mark session closing epoch
      ↓
classify tasks:
  drain / cancel / invalidate / provider-drain
      ↓
complete durable committed work
      ↓
checkpoint/save barrier
      ↓
provider drain
      ↓
retire projections
      ↓
destroy services/owners
```

---

# 55. Round-3 Risk Register

| ID | Risk | Severity | Response |
|---|---|---:|---|
| `PRD04-R03-01` | multiple workers mutate same authority | RED | one commit owner |
| `PRD04-R03-02` | stale worker commits after newer state | RED | revisions/epochs |
| `PRD04-R03-03` | entity transfers while old worker still owns it | RED | ownership epoch |
| `PRD04-R03-04` | every domain forced into one spatial grid | RED | mixed partition models |
| `PRD04-R03-05` | simulation partition copied from Zylann chunk size | RED | independent concerns |
| `PRD04-R03-06` | distant simulation depends on Nodes | RED | domain core outside SceneTree |
| `PRD04-R03-07` | fidelity transition loses resources/identity | RED | conservation contract |
| `PRD04-R03-08` | one `_process()` per simulated entity | RED | batching/scheduling/events |
| `PRD04-R03-09` | world time tied to render FPS | RED | simulation clock |
| `PRD04-R03-10` | custom scheduler invented before profiling | AMBER/RED | existing pools first |
| `PRD04-R03-11` | provider pools independently saturate CPU | RED | cross-provider budget |
| `PRD04-R03-12` | main thread becomes universal authority bottleneck | AMBER/RED | owner != main thread |
| `PRD04-R03-13` | worker mutates SceneTree directly | RED | projection boundary |
| `PRD04-R03-14` | unlimited queues | RED | bounded queues/backpressure |
| `PRD04-R03-15` | cancellation assumed to undo commits | RED | cancellation != rollback |
| `PRD04-R03-16` | event subscriber mutates foreign owner | RED | commands/transactions |
| `PRD04-R03-17` | cache becomes second authority | RED | revisioned read model |
| `PRD04-R03-18` | eventual consistency used for ownership/inventory | RED | explicit consistency class |
| `PRD04-R03-19` | network sends proposal as committed truth | RED | commit first |
| `PRD04-R03-20` | checkpoint catches half-transfer state | RED | ownership-consistent barrier |
| `PRD04-R03-21` | task has no owner/cancel policy | RED | task registry/ownership |
| `PRD04-R03-22` | retry loop hides permanent provider failure | AMBER/RED | classified errors |
| `PRD04-R03-23` | aggregate sim invents/destroys conserved state | RED | invariants |
| `PRD04-R03-24` | active property has two uncontrolled writers | RED | property-level authority |

---

# 56. Round-3 Proof Obligations

## PRD04-PROOF-13 — Stale Worker Commit

Run a worker on revision N, mutate owner to N+2, then finish old work. Old output must be rejected or explicitly reconciled.

## PRD04-PROOF-14 — Partition Ownership Transfer

Move thousands of entities across owner boundaries under concurrent work. Prove no duplicate/lost entities and no old-owner commits.

## PRD04-PROOF-15 — SceneTree-Free Distant Simulation

Simulate a large settlement/ecology/economy fixture with zero entity Nodes, then promote it to local detail with conserved state intact.

## PRD04-PROOF-16 — Fidelity Promotion/Demotion

Cycle aggregate → regional → active → physical → active → regional → aggregate repeatedly without identity/resource loss.

## PRD04-PROOF-17 — Cross-Domain Construction Transaction

One build action touches inventory, permission, voxel state, structure identity, persistence, network and nav/physics invalidation. Inject failure at each stage.

## PRD04-PROOF-18 — Cross-Provider CPU Saturation

Stress voxel generation, nav baking, DB, simulation, networking and save simultaneously. Prove bounded queues and useful latency.

## PRD04-PROOF-19 — Main-Thread Independence

Run pure domain simulation outside SceneTree and marshal only projection commits to main thread.

## PRD04-PROOF-20 — Shutdown Drain Matrix

Exercise every task class during world/server shutdown and prove correct drain/cancel/invalidate behavior.

## PRD04-PROOF-21 — Deterministic Seeded Simulation

Run selected deterministic domains twice with identical inputs/seeds/time/commands and verify matching results where required.

## PRD04-PROOF-22 — Read-Model Rebuild

Destroy derived indexes/caches and rebuild them from authority without semantic loss.

---

# 57. Round-3 New Architecture Unknowns

1. What concrete simulation partition types exist first?
2. Are distant people spatially owned or settlement/faction owned?
3. How are travelling groups transferred between owners?
4. Does each vessel remain one owner while crossing world partitions?
5. Where do world-/realm-global services live?
6. How are commands routed during ownership transfer?
7. What command-ID and duplicate-detection scheme is required?
8. What snapshot representation minimizes copy cost?
9. Which domains require deterministic iteration/RNG?
10. What is the base Leyforge world simulation clock?
11. Which domains use analytical time skipping?
12. How does active physics state synchronize back into canonical position/velocity?
13. How are power/fluid/logistics networks partitioned when they cross regions?
14. Are cross-domain transactions centrally coordinated or domain-specific?
15. Which actions need reservations before final commit?
16. What durability classes exist for user commands?
17. Which user actions must be durable before success is acknowledged?
18. What event-bus implementation prevents global coupling?
19. Which post-commit side effects are asynchronous/idempotent?
20. How are provider/job queues budgeted by core count and hardware profile?
21. Can partitions dynamically split/merge by load?
22. Should a dedicated server initially run one WorldSession per process for fault isolation?
23. What task registry tracks all WorldSession-owned asynchronous work?
24. What happens when a provider does not expose cancellation?
25. What shutdown drain timeout is acceptable?
26. Which ownership violations are fatal in debug/release?
27. What chaos-test harness randomizes job ordering/failures?
28. Which PRD-01 unknowns become resolved or narrowed by this model?

---

# 58. Round-3 Locked Invariants

Round 3 locks:

1. Every mutable authoritative state has one current commit authority.
2. Ownership is independent from thread location.
3. Partitions may be spatial, semantic or hybrid.
4. Simulation partitions are independent from provider chunks/tiles.
5. Persistent domain simulation must function without SceneTree.
6. Workers operate on versioned/immutable input.
7. Worker/provider output is not canonical until owner validation/commit.
8. Stale results are rejected or explicitly reconciled.
9. Ownership transfer is explicit and epoch-aware.
10. Cross-owner mutation uses commands/transactions.
11. Commands express intent; events express committed facts.
12. Simulation fidelity is Leyforge-owned.
13. Identity and conserved state survive fidelity transitions.
14. Simulation time is independent from rendering FPS.
15. Physics and domain cadences may differ.
16. Authoritative randomness is explicit/governed.
17. Scheduling does not confer ownership.
18. A custom whole-engine scheduler requires evidence.
19. Cross-provider backpressure/CPU budgeting is required.
20. SceneTree mutations occur through projection commit boundaries.
21. Unlimited work queues are forbidden.
22. Every long task has ownership and shutdown behavior.
23. Shutdown distinguishes drain/cancel/invalidate work.
24. Read models may duplicate data but not authority.
25. Eventual consistency is only used where semantics tolerate it.
26. Strong operations have explicit canonical commit points.
27. Network replication follows committed authority.
28. Checkpoints capture ownership-consistent state.
29. Distant simulation preserves conserved gameplay state.
30. Presentation callbacks cannot be the sole simulation driver.

---

# 59. Round-3 Gate Result

**PASS — CONTINUE PRD-04**

The simulation ownership/concurrency model is sufficiently clear to proceed into the spatial/provider integration facades.

Round 3 does not yet select:

- exact partition dimensions;
- actor/ECS/service implementation style;
- exact world/domain tick rates;
- exact thread count;
- custom scheduler technology;
- exact transaction protocol;
- exact event-bus implementation.

It locks the deeper rule:

> **Authoritative state is mutated only by its defined owner. Concurrent workers/providers compute against versioned state and return proposals/evidence; session, ownership and revision checks determine whether those results may become canonical.**

---

# 60. Updated PRD-04 Round Sequence

1. **Round 1 — Top-level ownership, authority classes and anti-leakage rules** — **COMPLETE**
2. **Round 2 — Canonical coordinates, WorldSession, spatial frames and SceneTree projection lifecycle** — **COMPLETE**
3. **Round 3 — Simulation partitions, workers, owners, revisions, task/lifetime and commit topology** — **COMPLETE**
4. **Round 4 — Voxel, physics, movement, navigation, fluids and vessel integration facades** — **NEXT**
5. **Round 5 — Network protocol, interest management, save coordinator, database and reconnect boundaries**
6. **Round 6 — Forge source/bake/runtime pipeline, content packs, mod trust and settings/presentation boundaries**
7. **Round 7 — Diagnostics, tests, build/dependency boundaries and whole-stack transaction/interface reconciliation**
8. **Round 8 — Final architecture map, conditional decisions, proof handoff and PRD-04 closure candidate**

---

# 61. Immediate Next Action

Proceed to:

> **PRD-04 Round 4 — Voxel, physics, movement, navigation, fluids and vessel integration facades.**

Round 4 will define the actual interface relationships among:

- canonical voxel/world state;
- Zylann execution;
- physical collision/readiness;
- CharacterBody/RigidBody movement;
- local/regional navigation;
- `SpatialChangeSet`;
- fluid/ocean authority;
- vessel-local grids/meshing;
- moving-frame physics;
- provider readiness and invalidation.

The governing rule is:

> **Providers execute specialized spatial/physical work. Leyforge owns the semantic transaction and decides what provider results mean.**

---

**ROUND-3 RESULT: SIMULATION PARTITION / OWNER / REVISION / TASK-LIFETIME / COMMIT-TOPOLOGY ARCHITECTURE COMPLETE.**

---

# 62. Round-4 Scope

Round 4 defines the integration boundaries among the physical/spatial providers and Leyforge domain authority.

It covers:

- canonical voxel edits and Zylann materialization;
- voxel query/readiness boundaries;
- `SpatialChangeSet`;
- collision/proxy generation;
- physics evidence;
- mover capability and physical execution;
- regional/local navigation;
- navigation invalidation;
- local conserved fluids and ocean boundaries;
- fluid↔voxel coupling;
- vessel-local voxel grids;
- moving-frame collision/physics;
- vessel mass/buoyancy/flooding coupling;
- vessel-local navigation;
- cross-provider readiness and invalidation.

Core question:

> **When one authoritative spatial transaction changes the world, how do all spatial providers react without any provider becoming a competing source of truth?**

Round-4 answer:

> **Leyforge commits the semantic/domain transaction first. A versioned `SpatialChangeSet` and related domain events describe the consequences. Voxel, physics, navigation, fluid, vessel, network and presentation services consume those consequences through facades and publish provider readiness/evidence back to Leyforge.**

---

# 63. Spatial Provider Facade Principle

Round 4 uses facades only where they protect a meaningful semantic/provider boundary.

Candidate high-level family:

```text
VoxelFacade
PhysicsFacade
MovementFacade
NavigationFacade
FluidFacade
VesselFacade
SpatialChangeService
```

These names are architectural roles, not final class/API names.

The goal is not a layer of wrappers around every Godot call.

The goal is to ensure gameplay/domain code speaks in:

- stable Leyforge IDs;
- canonical addresses/frames;
- mover capabilities;
- semantic material/state keys;
- revisions;
- domain commands/events;

rather than provider-specific:

- `VoxelBuffer` internals;
- RIDs;
- NavigationServer map handles;
- Node paths;
- collider object IDs.

---

# 64. Round-4 Boundary Register

## PRD04-BND-159 — Canonical voxel mutation is a Leyforge transaction

**Maturity:** `BOUNDARY-LOCK`

A gameplay-significant voxel edit becomes canonical only through a Leyforge-owned transaction/owner.

Examples:

- mine block;
- place block;
- explosion damage;
- construction;
- machine transformation;
- fluid solidification;
- vessel hull edit.

Direct provider mutation is not by itself canonical world truth.

---

## PRD04-BND-160 — Zylann materializes committed voxel state

**Maturity:** `BOUNDARY-LOCK`

Zylann is the primary voxel execution provider.

It materializes/streams/meshes/collides voxel state according to Leyforge semantic/runtime mapping and revision rules.

---

## PRD04-BND-161 — VoxelFacade owns semantic↔provider translation

**Maturity:** `BOUNDARY-LOCK`

`VoxelFacade` or equivalent translates between:

- canonical address/frame;
- semantic material/form/state key;
- runtime compact palette/type;
- Zylann data/mesh block coordinates.

Gameplay code should not need to know runtime TYPE allocation.

---

## PRD04-BND-162 — Voxel queries distinguish semantic and provider queries

**Maturity:** `BOUNDARY-LOCK`

Queries must state whether they require:

- canonical semantic voxel state;
- currently materialized provider state;
- collision readiness;
- visual mesh readiness.

A meshed voxel is not the only way to ask whether a block exists.

---

## PRD04-BND-163 — Authoritative edits outrank late generation

**Maturity:** `BOUNDARY-LOCK`

Procedural generation output cannot overwrite a newer committed voxel edit because generation completed later.

Worldgen/provider results validate generation/edit revisions before publication.

---

## PRD04-BND-164 — Generated baseline and persistent edits are distinguishable

**Maturity:** `CANDIDATE`

Persistence/runtime architecture should retain enough provenance to distinguish:

- reproducible generated baseline;
- committed player/system modifications;
- irreversible/generated-state migrations;

where this distinction enables regeneration, networking, storage efficiency or recovery.

Exact storage representation is deferred.

---

## PRD04-BND-165 — Voxel provider readiness is multidimensional

**Maturity:** `BOUNDARY-LOCK`

Provider readiness may include:

- data resident;
- mesh ready;
- collision ready;
- query ready;
- save/write complete.

The system does not collapse these into one boolean `loaded`.

---

## PRD04-BND-166 — SpatialChangeSet is emitted from canonical change

**Maturity:** `BOUNDARY-LOCK`

A committed spatial mutation produces a Leyforge-owned `SpatialChangeSet` or equivalent consequence descriptor.

It is derived from the authoritative commit, not from observing that a mesh happened to change.

---

## PRD04-BND-167 — SpatialChangeSet carries canonical context

**Maturity:** `CANDIDATE`

A SpatialChangeSet should carry enough context to identify:

- `world_id`;
- `world_session_id`;
- realm/frame;
- source transaction/operation;
- source revision;
- affected canonical bounds/cells;
- semantic change category;
- readiness/invalidation hints where appropriate.

Exact schema is deferred.

---

## PRD04-BND-168 — SpatialChangeSet is not a second world state

**Maturity:** `BOUNDARY-LOCK`

SpatialChangeSet is consequence/invalidation evidence.

Consumers may rebuild/query authoritative state rather than relying on the event payload as a full durable copy.

---

## PRD04-BND-169 — Spatial consumers subscribe independently

**Maturity:** `BOUNDARY-LOCK`

Voxel, navigation, physics, fluids, structures, vessels, persistence, networking and presentation may consume one canonical change without calling one another in an uncontrolled chain.

Preferred:

```text
commit
  ↓
SpatialChangeSet
  ├── voxel
  ├── physics
  ├── nav
  ├── fluids
  ├── save
  ├── network
  └── presentation
```

rather than:

```text
voxel calls physics
physics calls nav
nav calls fluid
fluid calls network
...
```

---

## PRD04-BND-170 — Spatial invalidation is scope-bounded

**Maturity:** `BOUNDARY-LOCK`

A spatial change identifies the smallest practical affected region(s) for downstream invalidation.

A one-block edit must not default to world-wide rebuild.

---

## PRD04-BND-171 — Consequential spatial transaction and derived rebuilds have different consistency classes

**Maturity:** `BOUNDARY-LOCK`

The canonical edit may commit immediately while derived states such as:

- nav;
- mesh;
- collision proxy;
- far representation;

catch up under revision control.

Where temporary lag is unsafe, gameplay uses quarantine/readiness gates.

---

## PRD04-BND-172 — Unsafe projection lag is explicitly quarantined

**Maturity:** `BOUNDARY-LOCK`

If committed state and a derived provider temporarily disagree in a way that could break correctness, the affected area/action is guarded.

Examples:

- destroyed bridge before nav bake;
- new solid wall before stale path completion;
- teleport destination before collision ready;
- vessel hull edit before updated collision proxy.

---

## PRD04-BND-173 — Physics provider is evidence/execution, not game-law authority

**Maturity:** `BOUNDARY-LOCK`

Godot/Jolt owns physical integration, collision contacts, forces and queries.

Leyforge gameplay/domain systems interpret those results.

---

## PRD04-BND-174 — PhysicsFacade translates canonical/frame-aware spatial requests

**Maturity:** `BOUNDARY-LOCK`

Gameplay/domain systems request physical operations using Leyforge IDs, frames and semantic intent.

`PhysicsFacade` maps to active provider bodies/spaces/RIDs and returns provider evidence in governed form.

---

## PRD04-BND-175 — Collision representation is a projection

**Maturity:** `BOUNDARY-LOCK`

Collision shapes/proxies are derived execution representations.

They may be regenerated or simplified without changing canonical structure/block identity.

---

## PRD04-BND-176 — Collision fidelity may differ from visual voxel fidelity

**Maturity:** `BOUNDARY-LOCK`

Collision meshes/proxies may use simpler geometry than rendered voxels if interaction correctness remains valid.

Exact block-by-block visual mesh need not equal exact dynamic collision mesh.

---

## PRD04-BND-177 — Collision readiness is explicit after spatial edits

**Maturity:** `BOUNDARY-LOCK`

Systems that require physical safety must know whether collision reflecting the committed spatial revision is ready.

Old collision must not silently be treated as current indefinitely.

---

## PRD04-BND-178 — Physics contact has source revision/frame context where consequential

**Maturity:** `CANDIDATE`

Physics evidence used for authoritative gameplay should be attributable to the current active frame/body revision where stale-body interactions could matter.

Exact metadata path is deferred.

---

## PRD04-BND-179 — Active movement has separate intent, capability and executor layers

**Maturity:** `BOUNDARY-LOCK`

Movement architecture separates:

1. intent/goal;
2. mover capability/rules;
3. route/path proposal;
4. physical execution;
5. canonical movement commit/network authority.

---

## PRD04-BND-180 — MovementFacade owns mover-semantic interface

**Maturity:** `BOUNDARY-LOCK`

Gameplay/AI requests movement using semantic capability and canonical/frame-aware targets.

The movement facade chooses/uses physical and navigation providers.

---

## PRD04-BND-181 — CharacterBody3D is a candidate executor, not mover identity

**Maturity:** `BOUNDARY-LOCK`

Ordinary active characters may use `CharacterBody3D` as the leading physical movement executor.

Persistent mover identity/capability does not depend on that class.

---

## PRD04-BND-182 — Locomotion mode is Leyforge state

**Maturity:** `BOUNDARY-LOCK`

Modes such as:

- ground;
- swim;
- climb;
- fly;
- ride;
- vessel-attached;
- portal/traversal;

are Leyforge movement state/capability, not inferred only from which Godot body/controller currently exists.

---

## PRD04-BND-183 — Physical transform and canonical transform synchronize through defined ownership

**Maturity:** `BOUNDARY-LOCK`

For active physical movement, the architecture defines which short-timescale transform/velocity values the executor owns and when/how those become canonical movement state.

Uncontrolled bidirectional transform writes are forbidden.

---

## PRD04-BND-184 — Teleport bypasses ordinary locomotion but not spatial transaction rules

**Maturity:** `BOUNDARY-LOCK`

Teleport/realm travel uses Round-2 readiness/commit logic rather than forcing the physical executor to simulate the displacement.

---

## PRD04-BND-185 — NavigationFacade owns route-provider abstraction

**Maturity:** `BOUNDARY-LOCK`

Movement/AI does not depend directly on one navigation technology.

`NavigationFacade` coordinates:

- regional routing;
- local Godot navmesh;
- voxel/grid pathing;
- volume/flying/swimming providers;
- traversal links.

---

## PRD04-BND-186 — Regional and local navigation are distinct layers

**Maturity:** `BOUNDARY-LOCK`

Long-distance route planning belongs to Leyforge regional/topological routing.

Godot NavigationServer is a candidate local surface path provider.

---

## PRD04-BND-187 — Navigation path is revisioned disposable state

**Maturity:** `BOUNDARY-LOCK`

A path is a proposal valid against:

- source geometry/revision;
- mover profile/capabilities;
- destination;
- frame/session.

It may be discarded/rebuilt without semantic loss.

---

## PRD04-BND-188 — SpatialChangeSet drives local navigation invalidation

**Maturity:** `BOUNDARY-LOCK`

Committed relevant voxel/structure changes mark affected nav data dirty.

Navigation rebuilds are scoped/coalesced and revision-validated.

---

## PRD04-BND-189 — Dirty navigation does not imply physically valid traversal

**Maturity:** `BOUNDARY-LOCK`

While nav representation is stale:

- physical collision;
- direct occupancy checks;
- route quarantine;
- link disabling;
- path revision checks;

protect immediate correctness.

---

## PRD04-BND-190 — Traversal links are semantic Leyforge objects

**Maturity:** `BOUNDARY-LOCK`

Ladders, jumps, lifts, portals, squeezes and similar traversals have Leyforge semantic IDs/rules.

Godot NavigationLink or another provider representation projects path connectivity.

---

## PRD04-BND-191 — Navigation layers do not define mover body geometry

**Maturity:** `BOUNDARY-LOCK`

Route permissions/categories and physical clearance/body profiles are distinct.

A giant and goblin may share permissions while requiring different clearance profiles.

---

## PRD04-BND-192 — Flying and swimming may use specialist volumetric providers

**Maturity:** `BOUNDARY-LOCK`

Surface navmesh is not required to represent every 3D movement domain.

Flight/swim may use sparse graph, voxel-volume or other providers behind the same movement/navigation facade.

---

## PRD04-BND-193 — Avoidance is local motion evidence, not route authority

**Maturity:** `BOUNDARY-LOCK`

RVO/avoidance may adjust local velocity around active agents.

It does not redefine the canonical route, collision world or gameplay priority law.

---

## PRD04-BND-194 — Fluid authority is Leyforge-owned

**Maturity:** `BOUNDARY-LOCK`

Water/fluid state that affects gameplay is owned by a Leyforge fluid domain/service.

Zylann voxels and shaders may represent fluid state but do not define conservation/flow semantics.

---

## PRD04-BND-195 — FluidFacade separates fluid simulation from voxel materialization

**Maturity:** `BOUNDARY-LOCK`

The fluid system may query/use voxel occupancy/material boundaries through VoxelFacade while maintaining its own authoritative fluid quantities/connectivity/state.

---

## PRD04-BND-196 — Fluid state may use representation different from solid voxel state

**Maturity:** `BOUNDARY-LOCK`

Conserved local fluid does not need to be represented as one ordinary solid voxel identity per fluid cell if a different structure better preserves:

- volume;
- level;
- pressure;
- flow;
- mixture;
- performance.

---

## PRD04-BND-197 — Ocean boundary and local fluid simulation are distinct concerns

**Maturity:** `BOUNDARY-LOCK`

Large stable ocean bodies may use boundary/background representations while local disturbances/flooding use conserved active simulation.

The ocean does not need to simulate every water voxel globally.

---

## PRD04-BND-198 — Fluid conservation is semantic, rendering is projection

**Maturity:** `BOUNDARY-LOCK`

Visual water height/refraction/particles cannot create or destroy authoritative fluid quantity.

---

## PRD04-BND-199 — Voxel edits may invalidate fluid topology

**Maturity:** `BOUNDARY-LOCK`

Opening/closing/removing solid boundaries may trigger fluid connectivity/flow recomputation through SpatialChangeSet.

---

## PRD04-BND-200 — Fluid changes may create canonical spatial consequences

**Maturity:** `BOUNDARY-LOCK`

Fluid simulation can itself cause authoritative changes such as:

- filling/emptying volume;
- erosion if enabled;
- freezing/solidifying;
- vessel flooding;
- extinguishing/fire interactions.

Those changes commit through owning domain rules and emit normal spatial consequences.

---

## PRD04-BND-201 — Fluid simulation fidelity may scale independently

**Maturity:** `CANDIDATE`

Local active fluids may use higher fidelity than distant/static water.

Fidelity reduction must preserve relevant conserved quantities and hazard state.

---

## PRD04-BND-202 — Vessel is a domain object, not a moving terrain instance

**Maturity:** `BOUNDARY-LOCK`

A commissioned vessel is a Leyforge domain entity with:

- stable vessel ID;
- VesselFrame;
- hull/component state;
- mass/inertia;
- flooding/damage;
- ownership/crew;
- physical projection.

It is not semantically "a Zylann terrain that happens to move."

---

## PRD04-BND-203 — Vessel local voxel/hull state is first-class

**Maturity:** `BOUNDARY-LOCK`

Editable voxel/block hull data may exist in vessel-local coordinates independently from world terrain chunks.

---

## PRD04-BND-204 — Vessel voxel representation may reuse Zylann meshing without Zylann terrain ownership

**Maturity:** `CANDIDATE`

A finite vessel grid may reuse Zylann block meshing/VoxelBuffer APIs or other proven mesh tooling without representing the vessel as a normal streamed `VoxelTerrain`.

Final approach remains P3/P4-gated.

---

## PRD04-BND-205 — Vessel semantic hull state outranks generated mesh

**Maturity:** `BOUNDARY-LOCK`

The vessel's canonical local block/component state owns:

- material identity;
- damage;
- openings;
- machinery attachments;
- structural semantics.

Generated mesh/collider is derived.

---

## PRD04-BND-206 — Vessel physical body is a proxy/executor

**Maturity:** `BOUNDARY-LOCK`

Godot/Jolt body/bodies represent active vessel physics.

They do not replace vessel domain identity/state.

---

## PRD04-BND-207 — Dynamic vessel collision should use qualified proxy geometry

**Maturity:** `CANDIDATE`

Preferred direction is generated primitive/convex/compound collision proxies rather than one giant arbitrary dynamic concave triangle mesh.

Exact decomposition strategy remains proof-gated.

---

## PRD04-BND-208 — Vessel mass properties derive from semantic/component state

**Maturity:** `BOUNDARY-LOCK`

Mass, center of mass and inertia are derived from governed material/component/cargo/fluid state, then supplied to the physics executor as appropriate.

Physics does not invent canonical vessel mass independently.

---

## PRD04-BND-209 — Vessel buoyancy/hydrodynamics are Leyforge/provider systems above Jolt

**Maturity:** `BOUNDARY-LOCK`

Jolt integrates resulting forces/torques.

Leyforge owns:

- buoyancy rules;
- displacement/fluid coupling;
- flooding;
- propulsion/rudder/sail/magic semantics.

---

## PRD04-BND-210 — Flooding couples FluidFacade and VesselFacade through vessel-local topology

**Maturity:** `BOUNDARY-LOCK`

Hull openings and internal compartments may drive vessel-local fluid state.

Fluid quantity/flooding affects mass/buoyancy and may create further vessel damage/behavior.

---

## PRD04-BND-211 — Vessel structural edits are transactions

**Maturity:** `BOUNDARY-LOCK`

Adding/removing/damaging vessel blocks/components commits against vessel domain authority.

Derived mesh, collision, mass, nav and fluid systems update afterward.

---

## PRD04-BND-212 — Vessel provider rebuilds are revisioned

**Maturity:** `BOUNDARY-LOCK`

Mesh/collision/mass/nav/fluid derived products identify the vessel hull/source revision they represent.

Stale rebuilds cannot publish over newer edits.

---

## PRD04-BND-213 — Vessel movement does not remesh unchanged hull merely because world pose changed

**Maturity:** `BOUNDARY-LOCK`

World translation/rotation updates VesselFrame/physics pose.

Unchanged local hull geometry remains reusable.

---

## PRD04-BND-214 — Vessel local navigation is a separate provider domain

**Maturity:** `BOUNDARY-LOCK`

Walking inside/on a vessel may use vessel-local navigation data.

It is transformed/connected to world/regional routing through frame-aware traversal interfaces.

---

## PRD04-BND-215 — Boarding traversal connects navigation domains

**Maturity:** `CANDIDATE`

Boarding/disembarking may be modeled as dynamic traversal links/transition states between world-local and vessel-local navigation frames.

Exact implementation remains proof-gated.

---

## PRD04-BND-216 — Occupant movement and vessel physics are separate but frame-coupled

**Maturity:** `BOUNDARY-LOCK`

An occupant walking on deck has local movement relative to VesselFrame while the vessel itself moves in the parent world frame.

The architecture must not double-apply or lose parent motion.

---

## PRD04-BND-217 — Vessel edits may require temporary interaction quarantine

**Maturity:** `BOUNDARY-LOCK`

After a critical hull edit, the system may temporarily gate:

- walking across changed area;
- collision-critical interaction;
- fluid transfer;
- boarding;

until required derived providers reach the committed revision.

---

## PRD04-BND-218 — Structure integrity is a Leyforge domain concern

**Maturity:** `BOUNDARY-LOCK`

If structural support/collapse exists, its semantic rules belong to Leyforge structure/vessel systems.

Physics/voxel providers supply geometry/contact evidence but do not define whether a structure is canonically supported.

---

## PRD04-BND-219 — Collapse may emit a new authoritative spatial transaction

**Maturity:** `BOUNDARY-LOCK`

When structure-integrity rules conclude collapse/destruction occurs, that conclusion commits through the owning domain and emits new spatial changes.

It is not inferred solely from a mesh/collider disappearing.

---

## PRD04-BND-220 — Provider readiness is revision-addressed

**Maturity:** `BOUNDARY-LOCK`

Readiness should mean:

> provider X is ready for source revision R in scope S

not merely:

> provider X says ready.

This enables precise quarantine release.

---

## PRD04-BND-221 — Readiness aggregation is Leyforge-owned

**Maturity:** `BOUNDARY-LOCK`

A gameplay transaction may require multiple providers:

```text
voxel data R ready
collision R ready
nav R ready
fluid R ready
network sync R ready
```

Leyforge decides which combination permits the action.

---

## PRD04-BND-222 — Provider failure does not silently revert canonical transaction

**Maturity:** `BOUNDARY-LOCK`

If a derived provider rebuild fails after a canonical commit, the owner chooses:

- retry;
- quarantine;
- fallback representation;
- compensating transaction;
- fatal recovery.

Providers do not silently undo world truth.

---

## PRD04-BND-223 — Provider degradation may preserve semantic world state

**Maturity:** `BOUNDARY-LOCK`

Example:

- nav unavailable → NPC pauses/replans;
- fancy vessel mesh unavailable → fallback proxy;
- high-detail fluid unavailable → coarse fluid mode.

Semantic state remains intact unless gameplay policy explicitly changes it.

---

## PRD04-BND-224 — Cross-provider direct handle sharing is minimized

**Maturity:** `BOUNDARY-LOCK`

Navigation should not persist a physics RID as its semantic bridge; fluid should not store a mesh instance ID as canonical wall identity; vessel should not store a NodePath as hull identity.

Cross-provider relations resolve through Leyforge IDs/frames/adapters.

---

## PRD04-BND-225 — Provider-specific high-frequency integration may bypass broad event buses internally

**Maturity:** `BOUNDARY-LOCK`

Performance-critical adapters may use direct typed interfaces between tightly related services where semantics are explicit.

The architecture does not require every contact/query to become a global event.

---

## PRD04-BND-226 — SpatialChangeSet supports coarse and precise consumers

**Maturity:** `CANDIDATE`

A change may carry:

- affected bounds/cells;
- changed semantic IDs/categories;
- source revision;

while consumers choose whether to:

- incrementally update;
- rescan exact cells;
- rebuild a whole tile/proxy.

This avoids overstuffing the event with every provider's private data.

---

## PRD04-BND-227 — World and vessel spatial changes share a common consequence model

**Maturity:** `CANDIDATE`

The same high-level invalidation architecture should work for:

- world terrain edit;
- structure edit;
- vessel hull edit;

with frame/scope differences rather than entirely unrelated pipelines.

---

## PRD04-BND-228 — Spatial transaction ordering is explicit where changes overlap

**Maturity:** `BOUNDARY-LOCK`

Overlapping edits use owner revision/order semantics so consumers can distinguish:

```text
R100 remove wall
R101 place new block
```

from an unordered set of mesh notifications.

---

## PRD04-BND-229 — Derived providers may skip superseded intermediate revisions

**Maturity:** `BOUNDARY-LOCK`

If a nav/collision/mesh rebuild for R100 is still pending when R103 arrives, provider work may coalesce directly to R103 where semantics allow.

Committed R101/R102 transactions remain in authoritative history as required.

---

## PRD04-BND-230 — Spatial facade contracts must be headless-valid

**Maturity:** `BOUNDARY-LOCK`

Voxel/physics/navigation/fluid/vessel authoritative interfaces must not require render-only objects.

Dedicated server execution remains a first-class target.

---

# 65. SpatialChangeSet Working Contract

Conceptual candidate:

```text
SpatialChangeSet
  world_id
  world_session_id
  realm_id
  spatial_frame_id
  transaction_id
  source_revision
  affected_bounds[]
  change_kinds[]
  semantic_subject_ids[]
  readiness_requirements / hints?
```

Possible `change_kinds`:

```text
SOLID_OCCUPANCY
MATERIAL_STATE
STRUCTURE_TOPOLOGY
VESSEL_HULL
FLUID_BOUNDARY
TRAVERSAL
COLLISION_RELEVANT
VISUAL_RELEVANT
```

Important:

- exact fields are not locked;
- provider-private handles are excluded;
- consumers may query authoritative state for detail;
- one transaction may produce multiple frame/scoped change sets if required.

---

# 66. World Voxel Edit Pipeline

Candidate pipeline:

```text
Build/Mine/Explosion command
          ↓
resolve spatial owner
          ↓
validate semantic IDs / permission / resources
          ↓
canonical voxel transaction
          ↓
revision R committed
          ↓
SpatialChangeSet(R)
          │
   ┌──────┼──────────┬─────────┬──────────┐
   │      │          │         │          │
Voxel   Physics     Nav      Fluid     Network/Save
   │      │          │         │          │
materialize collision dirty   topology    replicate/
R         R        tile(s)     update      persist
   │      │          │         │
   └──────┴──────────┴─────────┘
          ↓
readiness by revision
```

Gameplay requiring only semantic truth may proceed immediately.

Gameplay requiring physical/nav/fluid readiness waits or quarantines as explicitly contracted.

---

# 67. Physics / Movement Integration

Candidate:

```text
MoverDomainState
 capability / mode / canonical frame
          │
          ▼
MovementFacade
          │
    route / desired motion
          │
          ▼
Physical Executor
 CharacterBody / other
          │
          ▼
PhysicsFacade / Jolt
 contacts / velocity / query evidence
          │
          ▼
Movement Owner
 validate / update canonical movement
          │
          └── network / animation projection
```

Important ownership examples:

- AI goal: AI/domain;
- path: disposable NavigationFacade result;
- physical contact: Jolt evidence;
- mover capability: Leyforge;
- health consequence: gameplay domain;
- animation pose: presentation;
- canonical position: movement/world authority.

---

# 68. Navigation Integration

```text
Goal / Destination
       ↓
Regional Router
       ↓
local waypoint / traversal domain
       ↓
NavigationFacade
       ├── Godot surface navmesh
       ├── voxel/grid provider
       ├── flight/swim volume provider
       └── semantic traversal links
       ↓
revisioned path proposal
       ↓
MovementFacade
       ↓
physical executor
```

Spatial edits feed invalidation separately:

```text
SpatialChangeSet
       ↓
affected navigation scope
       ↓
DIRTY
       ↓
coalesced async rebuild
       ↓
revision check
       ↓
publish current
```

---

# 69. Fluid Integration

Candidate:

```text
Canonical solid boundaries
        │
        │ query / SpatialChangeSet
        ▼
     FluidFacade
 authoritative local fluid state
 volume / level / connectivity / flow
        │
        ├── gameplay hazards
        ├── vessel flooding
        ├── fire/material interactions
        └── presentation projection
        │
        └── if fluid causes world mutation
                ↓
           canonical domain transaction
                ↓
           SpatialChangeSet
```

Ocean background state may provide boundary conditions without becoming one globally simulated active grid.

---

# 70. Vessel Integration

Candidate vessel composition:

```text
VesselDomain
 stable vessel ID
 VesselFrame
 local hull/component state
 ownership/crew
 damage/flooding
      │
      ├── VesselVoxelAdapter
      │      finite local voxel/block grid
      │      mesh generation
      │
      ├── VesselCollisionBuilder
      │      convex/compound proxy candidate
      │
      ├── MassPropertyService
      │      material/cargo/fluid-derived
      │
      ├── FluidFacade
      │      flooding/displacement
      │
      ├── VesselPhysicsAdapter
      │      Jolt force/torque integration
      │
      ├── VesselNavigationProvider
      │      deck/interior local navigation
      │
      └── Projection
             mesh / audio / VFX / UI
```

World pose changes continuously.

Local hull semantic coordinates remain stable unless the hull itself is edited.

---

# 71. Vessel Hull Edit Pipeline

```text
Remove hull block
      ↓
Vessel owner validates
      ↓
commit hull revision H71
      ↓
SpatialChangeSet(frame=vessel, H71)
      │
      ├── local mesh rebuild
      ├── collision proxy rebuild
      ├── mass/inertia recompute
      ├── fluid topology/flooding update
      ├── local nav invalidation
      ├── persistence
      └── networking
      ↓
required provider readiness
      ↓
interaction quarantine released
```

No provider independently decides that the hull block exists or does not exist.

---

# 72. Readiness Contract — Candidate

Provider readiness result concept:

```text
ProviderReadiness
  world_session_id
  spatial_frame_id
  scope
  provider_kind
  source_revision
  state:
    PENDING
    READY
    FAILED
    SUPERSEDED
```

The gameplay/domain transaction specifies which readiness is required.

Examples:

## Placing ordinary decorative block

May need:

- canonical commit;
- voxel data/materialization;
- collision if solid.

Does not necessarily wait for nav if no agent is immediately traversing the area; nav may be dirty/quarantined.

## Teleport destination

Likely requires:

- canonical destination data;
- voxel query;
- collision;
- domain;
- network/client synchronization.

## Vessel hull breach

May require:

- canonical hull commit;
- collision proxy protection;
- fluid topology/flooding activation.

Visual mesh may catch up later.

---

# 73. Provider Failure Model

Example:

```text
canonical wall removal committed at R88

nav rebuild fails
```

The world does not automatically put the wall back.

Instead:

```text
nav scope remains DIRTY/FAILED
NPC routing quarantined/reduced
diagnostic emitted
retry/fallback policy
```

If no safe degraded mode exists, the owning domain may issue a compensating transaction.

That compensation is explicit and journalable.

---

# 74. Cross-System Structural Example

A player destroys the base of a tower.

```text
Mine command
   ↓
voxel owner commits block removal R501
   ↓
SpatialChangeSet R501
   │
   ├── Zylann remesh/collision
   ├── structure integrity reevaluation
   ├── nav invalidation
   ├── fluid topology if relevant
   ├── persistence/network
   └── presentation
```

If structure integrity concludes the tower collapses:

```text
StructureDomain:
collapse decision
   ↓
NEW canonical transaction R502
   ↓
many block/structure changes
   ↓
new SpatialChangeSet R502
```

The collapse is not a side effect hidden inside the mesh builder.

---

# 75. Consistency Classes for Spatial Providers

## S0 — Canonical spatial state

Owned by Leyforge domain/world/vessel owners.

Examples:

- block exists;
- hull opening exists;
- fluid quantity;
- mover is in realm/frame X.

## S1 — Safety-critical derived state

May lag only under explicit quarantine.

Examples:

- collision;
- teleport-safe occupancy;
- critical vessel collision proxy;
- fluid containment boundary required for active interaction.

## S2 — Functional derived state

May lag under bounded revision-aware fallback.

Examples:

- nav tile;
- spatial index;
- local route cache.

## S3 — Presentation

Freely rebuildable/drop-able.

Examples:

- rendered mesh;
- particles;
- water shader;
- far representation.

This classification prevents "wait for everything" while protecting immediate correctness.

---

# 76. Round-4 Master Ownership Matrix

| Concern | Canonical owner | Provider/executor | Derived/readiness rule |
|---|---|---|---|
| world block semantic state | spatial/world owner | Zylann | provider represents committed revision |
| voxel runtime palette | VoxelFacade | Zylann block library | reversible mapping |
| voxel visual mesh | projection/provider | Zylann mesher | disposable |
| voxel collision | Physics/Voxel adapters | Zylann/Jolt | safety-critical revision |
| mover capability | Movement domain | MovementFacade | canonical |
| active locomotion execution | Movement/physics boundary | CharacterBody/Jolt | synchronized commit |
| regional route | Leyforge router | Leyforge/provider | proposal |
| local surface path | NavigationFacade | NavigationServer | revisioned disposable path |
| traversal link semantics | Leyforge movement | NavigationLink/provider | projection |
| fluid quantity/state | Fluid domain | FluidFacade | canonical |
| fluid rendering | presentation | Godot shaders/VFX | disposable |
| vessel hull state | Vessel domain | local voxel adapter | canonical |
| vessel mesh | vessel projection | Zylann/custom mesher | disposable |
| vessel collider | vessel physics adapter | Jolt shapes | safety-critical derived |
| vessel mass/inertia | Vessel domain derived service | physics adapter consumes | revisioned |
| flooding | Fluid/Vessel domain contract | fluid solver/provider | canonical/derived by model |
| structure integrity | Structure domain | physics/voxel evidence | canonical decision |
| spatial invalidation | SpatialChangeService | subscribers | source-revision bound |

---

# 77. Round-4 Risk Register

| ID | Risk | Severity | Response |
|---|---|---:|---|
| `PRD04-R04-01` | direct Zylann edit bypasses canonical transaction | RED | VoxelFacade/owner commit |
| `PRD04-R04-02` | mesh change observed as world truth | RED | commit→SpatialChangeSet direction |
| `PRD04-R04-03` | late generation overwrites player edit | RED | edit/generation revision precedence |
| `PRD04-R04-04` | `loaded=true` conflates data/mesh/collision | RED | multidimensional readiness |
| `PRD04-R04-05` | one block edit rebuilds huge world scope | RED | bounded invalidation |
| `PRD04-R04-06` | providers call each other in cyclic chains | RED | independent consequence subscription/facades |
| `PRD04-R04-07` | nav stale after destroyed bridge | RED | quarantine/collision/revision checks |
| `PRD04-R04-08` | stale collision after solid edit | RED | collision readiness by revision |
| `PRD04-R04-09` | gameplay health mutated directly by physics callback | RED | physics evidence→gameplay owner |
| `PRD04-R04-10` | movement identity tied to CharacterBody3D | RED | MovementFacade/capability authority |
| `PRD04-R04-11` | surface navmesh forced onto flying/swimming | RED | specialist providers |
| `PRD04-R04-12` | RVO avoidance treated as pathfinding | RED | local velocity-only role |
| `PRD04-R04-13` | water renderer creates/destroys fluid | RED | FluidFacade canonical state |
| `PRD04-R04-14` | global ocean simulated as every active water voxel | RED/PERF | ocean boundary + local conserved fluid |
| `PRD04-R04-15` | voxel edit fails to notify fluid topology | RED | SpatialChangeSet |
| `PRD04-R04-16` | vessel implemented as moving VoxelTerrain by convenience | RED | vessel domain + finite local grid |
| `PRD04-R04-17` | vessel world motion rewrites entire hull | RED | VesselFrame |
| `PRD04-R04-18` | dynamic vessel uses giant concave collider blindly | RED | qualified proxy strategy |
| `PRD04-R04-19` | mesh defines vessel mass | RED | semantic material/component mass |
| `PRD04-R04-20` | flooding disconnected from mass/buoyancy | RED | Fluid↔Vessel contract |
| `PRD04-R04-21` | stale vessel collider publishes over newer hull | RED | hull revision validation |
| `PRD04-R04-22` | boarding is only Node reparenting | RED | frame/movement transaction |
| `PRD04-R04-23` | structure collapse hidden inside physics/mesh provider | RED | StructureDomain decision |
| `PRD04-R04-24` | gameplay waits for every visual provider | AMBER/RED | consistency/readiness classes |
| `PRD04-R04-25` | provider failure silently reverts canonical state | RED | explicit owner recovery/compensation |
| `PRD04-R04-26` | cross-provider raw handles become durable relations | RED | stable IDs/adapters |
| `PRD04-R04-27` | SpatialChangeSet grows into duplicate full world state | AMBER | invalidation descriptor + query authority |
| `PRD04-R04-28` | every provider rebuilds every intermediate revision | AMBER/RED | coalesce superseded derived work |

---

# 78. Round-4 Proof Obligations

## PRD04-PROOF-23 — One-Block Spatial Fan-Out

Commit one ordinary solid voxel change.

Verify exactly the intended consumers receive bounded invalidation:

- voxel;
- collision;
- nav;
- fluid if relevant;
- persistence;
- network;
- presentation.

No provider becomes the source of the canonical edit.

## PRD04-PROOF-24 — Late Generation vs Edit

Start procedural generation for a block/region.

Commit player edits before generation completes.

Late generation must not overwrite newer edits.

## PRD04-PROOF-25 — Collision Revision Quarantine

Rapidly place/remove solid blocks around an active player/mob.

Verify no traversal through stale collision and no permanent stall while collision catches up.

## PRD04-PROOF-26 — Nav Dirty Bridge

Destroy/rebuild a bridge while many agents are routing across it.

Verify:

- stale paths are detected;
- physical safety holds immediately;
- nav bakes coalesce;
- newest revision wins.

## PRD04-PROOF-27 — Fluid Boundary Breach

Create sealed fluid chamber, remove wall, restore wall.

Measure:

- conserved volume;
- topology update;
- collision/voxel ordering;
- rebuild/coalescing behavior.

## PRD04-PROOF-28 — Ocean / Local Fluid Boundary

Connect/disconnect local terrain cavity to large ocean boundary.

Prove local conserved flooding without globally simulating the whole ocean.

## PRD04-PROOF-29 — Vessel Hull Edit Underway

Edit/damage hull while vessel moves physically.

Verify:

- stable local hull coordinates;
- mesh/collision/mass/flooding revisions;
- stale products rejected;
- safe interaction quarantine.

## PRD04-PROOF-30 — Moving Vessel Occupants

Multiple characters walk/jump on a translating/rotating vessel.

Verify:

- no double-applied parent motion;
- stable vessel-local position;
- boarding/disembark handoff;
- network/canonical frame consistency.

## PRD04-PROOF-31 — Vessel Collision Strategy Matrix

Compare:

- primitive/compound;
- convex decomposition;
- other qualified proxy strategies.

Against representative editable hull sizes.

Measure:

- rebuild cost;
- contact quality;
- Jolt stability;
- memory;
- edit frequency.

## PRD04-PROOF-32 — Vessel Flooding / Buoyancy

Damage below waterline.

Verify:

- fluid enters through valid opening;
- mass/center changes;
- buoyancy response;
- pumps/repairs;
- save/reload consistency.

## PRD04-PROOF-33 — Structure Collapse Transaction

Remove supports from a large voxel structure.

If integrity rules trigger collapse, prove collapse is a new authoritative transaction and all providers consume it consistently.

## PRD04-PROOF-34 — Provider Failure Degradation

Force failures in:

- nav bake;
- vessel mesh;
- collision rebuild;
- fluid worker.

Verify semantic state survives and recovery/quarantine policy is explicit.

---

# 79. Round-4 New Architecture Unknowns

1. What exact methods belong on VoxelFacade?
2. Does authoritative voxel state live primarily as overlay/edit journal over deterministic baseline or as fully materialized stored state?
3. Which voxel queries can be answered without loading a Zylann block?
4. How are generated baseline revisions represented?
5. Does runtime palette mapping vary per WorldSession, realm, content pack or whole process?
6. How are palette remaps handled while blocks are loaded?
7. What is the smallest SpatialChangeSet granularity?
8. Can one SpatialChangeSet span several frames/realms?
9. Should semantic change categories be bitflags, typed records or separate event types?
10. How are huge explosions represented without listing millions of block IDs?
11. When do consumers query exact changed voxels versus affected bounds?
12. Should provider readiness use one shared state object or per-facade APIs?
13. What timeout/retry policy exists for collision readiness?
14. Can Zylann-generated collision be used directly for static world terrain in all required cases?
15. How quickly does Zylann collision follow block edits under hostile load?
16. Do some world objects require Leyforge-generated collision independent from Zylann?
17. How are non-voxel props combined with voxel collision queries?
18. Which gameplay queries use PhysicsDirectSpaceState vs higher facade?
19. What physical evidence requires source revision tagging?
20. How often does active physical transform commit to canonical character position?
21. Does server movement authority run exact same CharacterBody controller as client prediction?
22. Should client prediction use the same collision snapshot revision?
23. How are correction/rollback states framed across origin rebases?
24. What movement modes share one controller versus specialist executors?
25. Do climbing/swimming/flying use CharacterBody3D or separate systems?
26. How are mount/rider movement authorities separated?
27. What route-provider interface supports both async and immediate results?
28. How are mover profiles represented?
29. How many navigation clearance profiles are practical?
30. How are dynamic doors/gates represented: nav link toggle, local obstacle, rebake, or hybrid?
31. How are moving lifts represented in local navigation?
32. How is a moving vessel connected to dock/land nav?
33. Can Godot NavigationLink endpoints update safely at vessel frequency?
34. Should boarding use route planning only near the vessel instead?
35. How are large crowds budgeted between pathfinding and avoidance?
36. How are active nav agents reduced/virtualized at distance?
37. What exact volumetric navigation provider serves swimming?
38. Can swimming use fluid connectivity cells directly?
39. What provider serves flight through caves/buildings?
40. How are aerial no-fly hazards/permissions represented?
41. What fluid state representation is most suitable: cellular levels, volume regions, heightfields, graph compartments, hybrid?
42. What exact quantities are conserved for water?
43. Are gases handled by the same FluidFacade family or separate atmosphere service?
44. Are lava/magic fluids variants of the same solver or different domains?
45. How are mixtures handled?
46. How is infinite/static ocean boundary pressure/level represented?
47. How are tides/waves separated from authoritative bulk water?
48. What active radius/fidelity is needed for local fluid simulation?
49. How is fluid time-skipped/demoted at distance?
50. How does fluid interact with voxel porosity/permeability?
51. Is erosion part of V1 or deferred?
52. How are pumps/pipes coupled to open-world fluid?
53. Do pipe networks belong to fluid domain or machine/logistics domain?
54. How are waterfalls represented without simulating every rendered droplet?
55. What vessel-local voxel dimensions are practical?
56. What is the maximum editable vessel size target?
57. Does vessel hull storage use VoxelBuffer directly, a Leyforge schema, or both?
58. Can `VoxelMesher.build_mesh()` satisfy runtime vessel mesh generation under edit load?
59. How are vessel mesh chunks partitioned locally?
60. How are materials/shaders mapped for finite vessel meshes?
61. What collision decomposition algorithm/library is appropriate?
62. How are colliders incrementally rebuilt after local hull edits?
63. How are thin hull surfaces represented robustly in collision?
64. How is center of mass calculated for arbitrary cargo placement?
65. How often can mass/inertia be updated without destabilizing Jolt?
66. How is water displacement estimated for arbitrary voxel hulls?
67. Are buoyancy sample points, submerged voxels, signed volume or another method preferable?
68. How are enclosed compartments detected/updated after edits?
69. How does flooding traverse doors/hatches/pipes?
70. How is air/pressure in sealed vessel spaces modeled, if at all?
71. How are pumps/bilge systems integrated?
72. How do sinking/grounding/collision damage interact?
73. Does a broken vessel split into multiple vessel entities?
74. If vessels split, what transaction assigns blocks/components to new VesselFrames?
75. Can structures similarly split/collapse into dynamic debris?
76. What debris becomes voxel items vs rigid bodies vs destroyed state?
77. How is vessel local navigation regenerated after hull changes?
78. Can crew path while vessel rotates/moves without world nav rebakes?
79. How are ladders/lifts aboard vessels represented?
80. Does vessel local nav use Godot NavigationServer in its own map/local frame?
81. Can NavigationServer maps exist in local frame space independent of world transform?
82. How are path outputs transformed to current vessel frame during execution?
83. What happens if vessel moves substantially while path is being computed?
84. How are projectile/world interactions with moving voxel hull addressed?
85. How are raycasts transformed into vessel-local voxel queries?
86. How do explosions affect both world voxels and vessel hull voxels?
87. How are docking constraints/physics represented?
88. Does vessel collision participate in ordinary world Jolt space or a specialized system?
89. What maximum number of active vessels is practical?
90. How are far vessels simulated without active rigid bodies?
91. How does a far vessel transition from abstract route simulation to active physics?
92. Which vessel properties must be conserved across physical↔abstract transition?
93. How do currents/wind affect distant vessels?
94. What provider readiness is required before promoting a distant vessel to local active state?
95. Should SpatialChangeSet be persisted/journaled or regenerated from canonical transaction events?
96. How are spatial events deduplicated across save/reconnect?
97. How are provider queue depths exposed to diagnostics?
98. What does degraded mode look like if nav or fluid provider is overloaded?
99. How are provider adapter APIs fuzzed/chaos-tested?
100. Which Round-4 boundaries should become ADRs after PRD-07 evidence?

---

# 80. Round-4 Architecture Diagram

```text
                 LEYFORGE DOMAIN AUTHORITY
                         commands
                            │
                            ▼
                    CANONICAL COMMIT
                    transaction / R
                            │
                            ▼
                    SpatialChangeSet(R)
                            │
       ┌────────────────────┼────────────────────┐
       │                    │                    │
       ▼                    ▼                    ▼
   VoxelFacade         PhysicsFacade       NavigationFacade
       │                    │                    │
    Zylann            Jolt / collision       local providers
       │                    │                    │
       ├──────────────┐     │                    │
       │              │     │                    │
       ▼              ▼     ▼                    ▼
 FluidFacade      VesselFacade             MovementFacade
       │              │                        │
 fluid state      hull/frame/mass              │
       │          physics/flood/nav             │
       └──────────────┴───────────────┬─────────┘
                                      │
                              provider evidence /
                              readiness by revision
                                      │
                                      ▼
                              LEYFORGE OWNERS
```

---

# 81. Round-4 Locked Invariants

Round 4 locks:

1. Canonical voxel edits are Leyforge transactions.
2. Zylann materializes voxel state; it does not define semantic truth.
3. VoxelFacade owns semantic/provider coordinate and palette translation.
4. Late generation cannot overwrite newer edits.
5. Voxel readiness is multidimensional.
6. SpatialChangeSet originates from canonical commit.
7. SpatialChangeSet is invalidation/consequence evidence, not duplicate world state.
8. Spatial consumers react independently rather than through cyclic provider calls.
9. Invalidation is spatially bounded.
10. Derived providers may lag only under explicit consistency/readiness rules.
11. Unsafe lag is quarantined.
12. Physics provides evidence/execution; gameplay interprets it.
13. Collision geometry is derived projection.
14. Movement separates intent, capability, route and physical execution.
15. CharacterBody3D is a candidate executor, not identity.
16. Navigation is hierarchical/provider-based.
17. Paths are disposable revisioned proposals.
18. Spatial edits drive nav invalidation.
19. Traversal links have Leyforge semantics.
20. Flying/swimming may use specialist volume providers.
21. Fluid gameplay state is Leyforge-owned.
22. Fluid conservation is independent from visual water.
23. Ocean boundary and local conserved fluid are separate concerns.
24. Voxel edits can invalidate fluid topology.
25. Vessels are Leyforge domain entities with VesselFrames.
26. Vessel-local hull state is first-class.
27. Zylann meshing may be reused without making vessel a VoxelTerrain.
28. Vessel mesh/collision are derived from semantic hull state.
29. Vessel mass/inertia derive from governed materials/components/cargo/fluid.
30. Buoyancy/flooding are Leyforge/provider semantics above Jolt.
31. Vessel edits are authoritative transactions.
32. Vessel derived products are hull-revision bound.
33. Vessel motion does not remesh unchanged local geometry.
34. Vessel local navigation is a separate navigation domain.
35. Structure integrity decisions belong to Leyforge.
36. Collapse/destruction is an authoritative transaction.
37. Provider readiness is revision-addressed.
38. Leyforge aggregates readiness required by gameplay.
39. Provider failure does not silently rewrite canonical truth.
40. Spatial facade contracts remain headless-valid.

---

# 82. Round-4 Gate Result

**PASS — CONTINUE PRD-04**

The physical/spatial provider integration boundary is sufficiently clear to proceed into network, persistence and reconnect architecture.

Round 4 does not select:

- final VoxelFacade API;
- exact fluid solver;
- exact volumetric path provider;
- exact vessel meshing/collision algorithm;
- exact buoyancy model;
- exact CharacterBody/controller implementation;
- exact navigation tile/profile dimensions;
- exact provider readiness schema.

It locks the deeper architecture:

> **Leyforge commits spatial meaning. `SpatialChangeSet` propagates versioned consequences. Specialized providers materialize, collide, route, flow and physically execute that committed state, and their outputs return as revisioned evidence/readiness rather than competing world truth.**

---

# 83. Updated PRD-04 Round Sequence

1. **Round 1 — Top-level ownership, authority classes and anti-leakage rules** — **COMPLETE**
2. **Round 2 — Canonical coordinates, WorldSession, spatial frames and SceneTree projection lifecycle** — **COMPLETE**
3. **Round 3 — Simulation partitions, workers, owners, revisions, task/lifetime and commit topology** — **COMPLETE**
4. **Round 4 — Voxel, physics, movement, navigation, fluids and vessel integration facades** — **COMPLETE**
5. **Round 5 — Network protocol, interest management, save coordinator, database and reconnect boundaries** — **NEXT**
6. **Round 6 — Forge source/bake/runtime pipeline, content packs, mod trust and settings/presentation boundaries**
7. **Round 7 — Diagnostics, tests, build/dependency boundaries and whole-stack transaction/interface reconciliation**
8. **Round 8 — Final architecture map, conditional decisions, proof handoff and PRD-04 closure candidate**

---

# 84. Immediate Next Action

Proceed to:

> **PRD-04 Round 5 — Network protocol, interest management, save coordinator, database and reconnect boundaries.**

Round 5 must define how one committed authoritative world is:

- persisted across voxel/database/file providers;
- checkpointed/recovered;
- journaled/versioned;
- projected to connected clients;
- filtered through one cross-domain interest manager;
- resumed after reconnect;
- protected against duplicate/replayed operations;
- converted cleanly among single-player, listen-host and dedicated-server execution.

The governing rule is:

> **Network and storage are projections of the same committed authority. Neither the packet that arrived nor the database row that wrote first gets to redefine the world.**

---

**ROUND-4 RESULT: VOXEL / PHYSICS / MOVEMENT / NAVIGATION / FLUID / VESSEL INTEGRATION-FACADE ARCHITECTURE COMPLETE.**

---

# 85. Round-5 Scope

Round 5 defines the architecture that keeps persistence, networking and reconnect aligned with the same authoritative world state.

It covers:

- durable network protocol ownership;
- transport/session separation;
- protocol/schema/version negotiation;
- command IDs and deduplication;
- authoritative server semantics;
- client prediction/correction boundaries;
- snapshot/delta strategy;
- interest management;
- voxel/entity/realm interest;
- cross-domain relevance;
- save coordinator;
- journal/checkpoint architecture;
- voxel store + structured DB + file/blob providers;
- checkpoint identity;
- crash recovery;
- reconnect/resume;
- operation replay/dedupe;
- save/network revision relationships;
- single-player/listen/dedicated equivalence.

Core question:

> **How does Leyforge ensure that the state persisted to disk, replicated to clients and resumed after reconnect all describe one coherent authoritative world?**

Round-5 answer:

> **Leyforge owns one committed transaction/history authority. Persistence and networking consume committed revisions/operations from that authority. The SaveCoordinator declares durable checkpoints across storage providers; the Protocol/Interest layers project authoritative state to clients; reconnect compares stable session/world/content/revision state and repairs missing information rather than reconstructing identity from transient peer/runtime handles.**

---

# 86. Network / Persistence Vocabulary

## 86.1 Protocol Message

A Leyforge-defined network message with stable message/schema identity, protocol version, bounded payload, semantic IDs, and operation/revision context where needed.

## 86.2 Session Peer

A transient connected transport peer. It may map to an authenticated account, player slot, local-player identity, character, or admin/service principal. The peer itself is not persistent identity.

## 86.3 Operation ID

A stable or session-scoped unique identifier for a consequential request/transaction, used for deduplication, retry safety, reconnect, diagnostics, and journal correlation.

## 86.4 Interest Set

The authoritative/relevant subset of world state a connection/player/viewer should receive or actively maintain.

## 86.5 Journal

Append-oriented durable evidence of committed or commit-relevant operations required for recovery. The journal is not necessarily the entire historical gameplay log.

## 86.6 Checkpoint

A durable, coherent recovery point across participating storage providers. A checkpoint is declared by Leyforge, not by any one provider.

## 86.7 SaveProvider

A storage backend participating in persistence, such as a voxel store, structured DB, or file/blob store.

---

# 87. Round-5 Boundary Register

## PRD04-BND-231 — Leyforge owns the durable gameplay protocol

**Maturity:** `BOUNDARY-LOCK`

Leyforge defines durable gameplay/world network messages independently from Godot SceneTree structure and transport implementation.

## PRD04-BND-232 — Transport does not define protocol meaning

**Maturity:** `BOUNDARY-LOCK`

ENet/Godot transport primitives carry Leyforge protocol messages. Changing transport must not redefine message semantics.

## PRD04-BND-233 — SceneMultiplayer may be used only behind bounded adapters

**Maturity:** `BOUNDARY-LOCK`

Godot high-level multiplayer/RPC features may be used where convenient for bounded/local presentation cases. They do not become the long-lived world protocol authority.

## PRD04-BND-234 — Network NodePath is not semantic address

**Maturity:** `BOUNDARY-LOCK`

RPC/SceneTree paths must not be used as durable entity/world identity. Messages refer to Leyforge stable IDs and canonical spatial/frame addresses.

## PRD04-BND-235 — Protocol schema has explicit version identity

**Maturity:** `BOUNDARY-LOCK`

Every connection/session negotiates or validates compatible Leyforge protocol/schema versions before ordinary world admission.

## PRD04-BND-236 — Content/schema compatibility is separate from transport connection success

**Maturity:** `BOUNDARY-LOCK`

A successful ENet/socket connection does not imply the client can join the world. Admission may require matching/compatible protocol version, content manifest, registry schema, save/world version, and required mods/DLC.

## PRD04-BND-237 — Protocol messages use bounded explicit schemas

**Maturity:** `BOUNDARY-LOCK`

Messages use explicit field types, size limits and count limits. Arbitrary object deserialization is not accepted as the default public-network contract.

## PRD04-BND-238 — Object decoding remains disabled for untrusted public protocol paths

**Maturity:** `BOUNDARY-LOCK`

Godot object deserialization is not used as the public gameplay message format. The Leyforge decoder handles bounded primitive/structured payloads.

## PRD04-BND-239 — Command identity is explicit

**Maturity:** `BOUNDARY-LOCK`

Consequential client/server commands carry a command/operation ID sufficient to detect duplicates/retries where required.

## PRD04-BND-240 — Duplicate command detection is authority-owned

**Maturity:** `BOUNDARY-LOCK`

The server/domain owner decides whether a repeated operation ID is duplicate already committed, duplicate still pending, invalid/replayed, or a safe retry.

## PRD04-BND-241 — Client command is intent, not authority

**Maturity:** `BOUNDARY-LOCK`

The client requests an action. The server validates and commits. The client does not declare canonical world facts.

## PRD04-BND-242 — Client prediction is explicitly non-authoritative

**Maturity:** `BOUNDARY-LOCK`

Prediction may create temporary local state for responsiveness. Predicted state is clearly distinguishable from confirmed authoritative state.

## PRD04-BND-243 — Correction/reconciliation operates on stable IDs/revisions

**Maturity:** `BOUNDARY-LOCK`

Server correction references stable entity/world IDs and authoritative revisions/operations rather than transient Node/peer handles.

## PRD04-BND-244 — Authoritative server state may be headless

**Maturity:** `BOUNDARY-LOCK`

Protocol/network authority cannot depend on renderer/UI/client resources. Dedicated server remains first-class.

## PRD04-BND-245 — Listen host uses the same authoritative command validation

**Maturity:** `BOUNDARY-LOCK`

The host's local player goes through the same semantic command/authority rules as remote players where practical.

## PRD04-BND-246 — Single-player may bypass transport, not authority contracts

**Maturity:** `BOUNDARY-LOCK`

Single-player can invoke server/domain commands directly in-process. It should not use a separate semantic mutation path.

## PRD04-BND-247 — Network state is projected by revision/operation context

**Maturity:** `BOUNDARY-LOCK`

Replicated state/events identify authoritative revision/operation context sufficient for ordering, stale rejection and reconnect repair where needed.

## PRD04-BND-248 — Snapshot and delta are complementary

**Maturity:** `BOUNDARY-LOCK`

Leyforge may use snapshots for baseline/current state and deltas/events for incremental change. Neither strategy is required universally.

## PRD04-BND-249 — Deltas are only valid against known baselines

**Maturity:** `BOUNDARY-LOCK`

A client applies a delta only when its referenced baseline/revision is compatible. Otherwise it requests or receives repair/fresh snapshot.

## PRD04-BND-250 — Snapshot identity is scoped

**Maturity:** `BOUNDARY-LOCK`

Snapshots identify their scope: entity, voxel region, settlement summary, vessel, realm/interest cell, or other bounded bootstrap subset.

## PRD04-BND-251 — Network channel/transfer mode is a transport optimization

**Maturity:** `BOUNDARY-LOCK`

Reliable/unreliable/channel assignment does not change protocol semantic identity.

## PRD04-BND-252 — Bulk voxel transfer is separate from realtime control traffic

**Maturity:** `BOUNDARY-LOCK`

Large voxel snapshots/repair payloads use a bounded bulk path so they do not monopolize gameplay/control latency.

## PRD04-BND-253 — Message priority is semantic-budget aware

**Maturity:** `CANDIDATE`

Transport scheduling should distinguish traffic classes such as input/control, authoritative entity state, gameplay events, voxel bulk, chat/social, and admin/service. Exact mapping remains proof-gated.

## PRD04-BND-254 — Interest management is Leyforge-owned

**Maturity:** `BOUNDARY-LOCK`

Leyforge decides what a connection/viewer/session should know. Zylann streaming, SceneMultiplayer visibility and provider culling consume that decision.

## PRD04-BND-255 — Interest is cross-domain

**Maturity:** `BOUNDARY-LOCK`

Interest may consider spatial proximity, realm/frame, ownership, team/faction, quest relevance, remote UI, vessel membership, sensory range and admin permissions.

## PRD04-BND-256 — Interest set is not identical to simulation fidelity

**Maturity:** `BOUNDARY-LOCK`

Something may be simulated while no client is interested. Something may be UI-relevant without full physical simulation.

## PRD04-BND-257 — Interest set is not identical to Zylann view distance

**Maturity:** `BOUNDARY-LOCK`

Voxel streaming distance is one consumer of interest policy. Entity, simulation, audio and UI relevance may use different ranges/scopes.

## PRD04-BND-258 — Interest is frame-aware

**Maturity:** `BOUNDARY-LOCK`

Interest works across realm frames, world active frames, vessel frames, split-screen viewers and client/server origin differences.

## PRD04-BND-259 — Interest transitions are revisioned/bounded

**Maturity:** `BOUNDARY-LOCK`

Entering/leaving interest produces explicit baseline/load/unload behavior. Rapid movement or teleport does not create unbounded stale queues.

## PRD04-BND-260 — Interest loss does not delete canonical state

**Maturity:** `BOUNDARY-LOCK`

No longer replicated/currently relevant does not mean the entity ceased to exist.

## PRD04-BND-261 — Interest repair is allowed

**Maturity:** `BOUNDARY-LOCK`

A damaged/stale interest scope can be repaired/resnapshotted without reconnecting the whole world.

## PRD04-BND-262 — Remote UI/management interest can be non-spatial

**Maturity:** `BOUNDARY-LOCK`

A player managing a distant settlement/map may receive bounded domain summaries without activating/rendering that region.

## PRD04-BND-263 — Split-screen interest is unioned/budgeted above Viewports

**Maturity:** `BOUNDARY-LOCK`

Multiple local viewers contribute to one local authoritative/client interest model. Viewports do not own replication authority.

## PRD04-BND-264 — SaveCoordinator owns checkpoint authority

**Maturity:** `BOUNDARY-LOCK`

Only Leyforge SaveCoordinator or equivalent may declare a coherent recoverable world checkpoint.

## PRD04-BND-265 — Checkpoint has stable identity/metadata

**Maturity:** `BOUNDARY-LOCK`

A checkpoint records world/checkpoint ID, schema/content/generator versions, participating provider revisions/positions, journal boundary and integrity data where appropriate.

## PRD04-BND-266 — Journal boundary is explicit

**Maturity:** `BOUNDARY-LOCK`

A checkpoint identifies which committed journal/operation sequence is included.

## PRD04-BND-267 — Journal records consequential authority, not every provider micro-step

**Maturity:** `BOUNDARY-LOCK`

The journal records operations/state transitions needed for recovery/audit, not every mesh task/nav bake/physics frame/particle.

## PRD04-BND-268 — Journal operation IDs align with network dedupe where useful

**Maturity:** `CANDIDATE`

The same or correlated operation identity may support persistence recovery, duplicate command prevention, reconnect resume and diagnostics.

## PRD04-BND-269 — Save provider state is independently versioned

**Maturity:** `BOUNDARY-LOCK`

Voxel store, structured DB and file/blob providers may use different internal commit/revision mechanisms. SaveCoordinator maps them into one checkpoint boundary.

## PRD04-BND-270 — Provider commit order does not define canonical order

**Maturity:** `BOUNDARY-LOCK`

Physical timing of DB/voxel/file writes does not redefine canonical transaction order.

## PRD04-BND-271 — Cross-store atomicity is coordinated above providers

**Maturity:** `BOUNDARY-LOCK`

Leyforge must tolerate failure between journal append, DB commit, voxel write and manifest/checkpoint update.

## PRD04-BND-272 — Structured DB is provider, not canonical schema authority

**Maturity:** `BOUNDARY-LOCK`

SQLite-class or other DB technology stores/query-indexes domain state. The DB schema does not replace canonical Leyforge semantic/schema identity.

## PRD04-BND-273 — DB row IDs are not durable external identity

**Maturity:** `BOUNDARY-LOCK`

External references use Leyforge stable IDs. Database primary keys may remain implementation keys.

## PRD04-BND-274 — Voxel store is one checkpoint participant

**Maturity:** `BOUNDARY-LOCK`

Zylann stream/store completion is voxel-durability evidence but does not independently make the whole checkpoint valid.

## PRD04-BND-275 — Save manifests are authoritative coordination metadata

**Maturity:** `BOUNDARY-LOCK`

World save manifests identify which storage artifacts/provider states constitute a valid recovery set.

## PRD04-BND-276 — Checkpoint publication is the durability commit point

**Maturity:** `CANDIDATE`

Preferred direction: provider writes reach safe state, checkpoint metadata/manifest is finalized, then the checkpoint becomes the current recovery point.

## PRD04-BND-277 — Previous known-good checkpoint may be retained

**Maturity:** `BOUNDARY-LOCK`

Persistence retains enough previous valid state to recover from partial write, corrupt latest checkpoint, interrupted migration or crash during publication.

## PRD04-BND-278 — Checkpoint integrity is verifiable

**Maturity:** `BOUNDARY-LOCK`

Recovery can detect obviously missing/mismatched/corrupted artifacts through metadata, hashes, DB integrity and provider checks as appropriate.

## PRD04-BND-279 — Checkpoint creation may be asynchronous but acknowledgement semantics are explicit

**Maturity:** `BOUNDARY-LOCK`

The system distinguishes in-memory committed authority, journal durability and checkpoint durability.

## PRD04-BND-280 — Durability classes are explicit

**Maturity:** `CANDIDATE`

Candidate classes:

```text
D0 volatile
D1 journal-durable
D2 provider-durable
D3 checkpoint-published
```

## PRD04-BND-281 — User-visible save success maps to a defined durability class

**Maturity:** `BOUNDARY-LOCK`

"World saved" cannot merely mean an async save job was queued.

## PRD04-BND-282 — Autosave does not require globally freezing simulation

**Maturity:** `CANDIDATE`

Prefer ownership-consistent snapshots/journals/provider barriers over long whole-world freezes.

## PRD04-BND-283 — Recovery chooses one coherent checkpoint lineage

**Maturity:** `BOUNDARY-LOCK`

Startup does not independently choose the latest DB, voxel file and manifest by timestamp.

## PRD04-BND-284 — Recovery is explicit about incomplete operations

**Maturity:** `BOUNDARY-LOCK`

Journal evidence plus transaction state determines replay, finish, compensation or discard policy.

## PRD04-BND-285 — Migrations run against checkpoint/schema authority

**Maturity:** `BOUNDARY-LOCK`

Save/schema migrations operate on governed versions and produce a new valid checkpoint or recovery state.

## PRD04-BND-286 — Save migration failure preserves source recovery path

**Maturity:** `BOUNDARY-LOCK`

A failed migration must not destroy the only known-good source checkpoint by default.

## PRD04-BND-287 — Reconnect uses stable account/player/character identity

**Maturity:** `BOUNDARY-LOCK`

Reconnect does not recover persistent identity from old peer ID or Node instance.

## PRD04-BND-288 — Reconnect negotiates world/content/protocol compatibility

**Maturity:** `BOUNDARY-LOCK`

Before resume, the reconnecting client validates current world identity, protocol, content manifest, relevant schema and character/session state.

## PRD04-BND-289 — Reconnect resumes from acknowledged authoritative revisions

**Maturity:** `BOUNDARY-LOCK`

Client/server compare known/acknowledged revisions or operation boundaries for relevant scopes.

## PRD04-BND-290 — Reconnect may use snapshot + delta repair

**Maturity:** `BOUNDARY-LOCK`

Resume may use fresh scoped snapshots, delta catch-up or a hybrid depending on gap size/history retention.

## PRD04-BND-291 — Client unacknowledged commands remain idempotent/retriable by operation ID

**Maturity:** `BOUNDARY-LOCK`

If disconnect occurs after sending a command but before confirmation, retry/resume uses the original operation ID where semantics allow.

## PRD04-BND-292 — Reconnect does not duplicate world entities

**Maturity:** `BOUNDARY-LOCK`

New transport connection creates a new projection/session binding, not a new canonical character.

## PRD04-BND-293 — Character/session lease is explicit where needed

**Maturity:** `CANDIDATE`

Server authority may hold an explicit lease/ownership binding indicating which live player session controls a character.

## PRD04-BND-294 — Disconnect policy is domain-owned

**Maturity:** `BOUNDARY-LOCK`

What happens to a character after disconnect is gameplay/server policy; transport disconnect does not silently delete/freeze canonical state.

## PRD04-BND-295 — Reconnect repairs interest before ordinary play resumes

**Maturity:** `BOUNDARY-LOCK`

The client re-establishes realm/frame context, canonical position, nearby voxel baseline, relevant entity baseline and pending operation acknowledgements before full control resumes.

## PRD04-BND-296 — Teleport/reconnect share readiness concepts

**Maturity:** `BOUNDARY-LOCK`

Both require a coherent target state and scoped readiness before active control resumes.

## PRD04-BND-297 — Network history retention is bounded

**Maturity:** `BOUNDARY-LOCK`

When retained deltas are unavailable/inefficient, the client receives a new baseline snapshot.

## PRD04-BND-298 — Reconnect gap handling is scope-aware

**Maturity:** `BOUNDARY-LOCK`

One stale voxel region does not require resending every settlement/entity in the world.

## PRD04-BND-299 — Save/network operation identity is not transport sequence number

**Maturity:** `BOUNDARY-LOCK`

Transport packet sequence/reliability numbers are not durable gameplay operation IDs.

## PRD04-BND-300 — Network acknowledgements distinguish receipt from authoritative commit

**Maturity:** `BOUNDARY-LOCK`

Packet receipt is distinct from command accepted, transaction committed, journal-durable and checkpoint-durable.

## PRD04-BND-301 — Service/control plane is separate from world gameplay plane

**Maturity:** `BOUNDARY-LOCK`

Authentication/account/directory/admin/server-health functions may use separate HTTPS/WSS/service protocols.

## PRD04-BND-302 — Admin commands use explicit authorization domain

**Maturity:** `BOUNDARY-LOCK`

Administrative authority is not implemented as ordinary player RPCs with hidden flags.

## PRD04-BND-303 — Network semantic rate limits are separate from packet rate limits

**Maturity:** `BOUNDARY-LOCK`

The server may enforce budgets for expensive actions such as teleport, voxel requests, path/world queries, blueprint placement, construction, decompression and content requests.

## PRD04-BND-304 — Interest/request budgets protect server work

**Maturity:** `BOUNDARY-LOCK`

Clients cannot force unbounded region generation/streaming merely by rapidly changing requested interest.

## PRD04-BND-305 — Bulk payload decode is bounded before allocation/work

**Maturity:** `BOUNDARY-LOCK`

Network decoders validate claimed length, compressed/uncompressed size, record count and semantic bounds before expensive allocation/decompression.

## PRD04-BND-306 — Network protocol is migration/version aware

**Maturity:** `BOUNDARY-LOCK`

Schema/message evolution includes explicit compatibility policy rather than silently reusing IDs with changed meaning.

## PRD04-BND-307 — Stable message IDs are not source-code enum ordinals by accident

**Maturity:** `BOUNDARY-LOCK`

Reordering source enums/files must not redefine network meaning.

## PRD04-BND-308 — Unknown/new optional messages fail safely

**Maturity:** `CANDIDATE`

Protocol negotiation can distinguish required incompatibility, optional unsupported extension and ignorable unknown metadata.

## PRD04-BND-309 — World bootstrap is staged

**Maturity:** `BOUNDARY-LOCK`

Joining a world proceeds through transport, authentication, protocol/content compatibility, world admission, character/session binding, realm/frame bootstrap, interest baseline and active-control release.

## PRD04-BND-310 — Bootstrap failure does not partially create canonical player state without cleanup

**Maturity:** `BOUNDARY-LOCK`

If admission fails mid-bootstrap, the server either never committed canonical entry or explicitly compensates/releases committed leases/resources.

## PRD04-BND-311 — SaveCoordinator participates in clean server shutdown

**Maturity:** `BOUNDARY-LOCK`

Dedicated/listen server shutdown coordinates drain/checkpoint/provider close under Round-3 task-lifetime rules.

## PRD04-BND-312 — Server restart preserves world identity, changes session identity

**Maturity:** `BOUNDARY-LOCK`

After restart, `world_id` remains while a new `world_session_id`/epoch and runtime handles are created.

## PRD04-BND-313 — Client caches are keyed by world/content/checkpoint context

**Maturity:** `CANDIDATE`

Reusable client caches include enough identity/version metadata to prevent stale data from another world/content/schema/region revision being accepted incorrectly.

## PRD04-BND-314 — Local cache is never sole recovery authority

**Maturity:** `BOUNDARY-LOCK`

Client cache may accelerate reconnect/bootstrap; server authoritative state remains source of truth.

## PRD04-BND-315 — Save and network diagnostics share transaction correlation

**Maturity:** `BOUNDARY-LOCK`

Diagnostics should trace client command → server validation → canonical transaction → journal → provider writes → network acknowledgement/replication using stable correlation/operation IDs.

## PRD04-BND-316 — Network/persistence failures are independently observable

**Maturity:** `BOUNDARY-LOCK`

A world may remain canonically committed while one client replication fails or a checkpoint is delayed. Diagnostics and recovery distinguish failure domains.

## PRD04-BND-317 — Save provider backpressure may influence admission/quality policy

**Maturity:** `CANDIDATE`

If persistence queues become dangerously backlogged, the server may slow heavy commands, pause expensive imports, prioritize durable work or surface degraded health.

## PRD04-BND-318 — Network backpressure may reduce projection fidelity before authority

**Maturity:** `BOUNDARY-LOCK`

Under bandwidth pressure, reduce update rate, far-detail frequency, cosmetic replication or bulk prefetch before dropping consequential authoritative transactions.

## PRD04-BND-319 — Checkpoint/reconnect architecture is compatible with single-player

**Maturity:** `BOUNDARY-LOCK`

Single-player still uses SaveCoordinator/checkpoint identity and stable operation semantics.

## PRD04-BND-320 — World export/copy uses checkpoint lineage, not live provider file copying

**Maturity:** `BOUNDARY-LOCK`

World backup/copy uses a coherent published checkpoint or explicit snapshot process rather than arbitrary live DB/voxel file copying.

---

# 88. Network Protocol Working Layers

```text
APPLICATION / DOMAIN
  commands / events / snapshots
        │
        ▼
LEYFORGE PROTOCOL
  message IDs
  schemas
  versions
  operation IDs
  revisions
        │
        ▼
SESSION / INTEREST
  authentication binding
  admission
  interest scopes
  bootstrap/reconnect
        │
        ▼
TRANSPORT ADAPTER
  ENet candidate
  channels
  reliable/unreliable
  bulk segmentation
```

---

# 89. Candidate World Join Flow

```text
CONNECT
   ↓
authenticate session
   ↓
protocol version compatible?
   ↓
content/registry manifest compatible?
   ↓
world admission
   ↓
bind account/player/character
   ↓
resolve realm + canonical address
   ↓
establish interest
   ↓
send baseline snapshots
   ↓
client confirms baseline/revisions
   ↓
release ordinary input/prediction
```

---

# 90. Candidate Reconnect Flow

```text
new transport peer
      ↓
authenticate same account/session authority
      ↓
resolve stable character/player ID
      ↓
validate world/protocol/content
      ↓
compare acknowledged operation/revision boundaries
      ↓
restore realm/frame/position
      ↓
repair interest baseline
      ↓
resolve unacknowledged command IDs
      ↓
release control
```

---

# 91. Candidate Interest Model

Interest inputs may include:

```text
viewer position/frame
view/render radius
voxel streaming radius
entity activity radius
hearing/sensory radius
ownership/party/faction
quest relevance
remote settlement UI
vessel membership
admin/debug privileges
server budgets
```

Outputs may include distinct scopes:

```text
VoxelInterest
EntityInterest
DomainSummaryInterest
AudioInterest
SimulationInfluence
```

---

# 92. Save Architecture Working Model

```text
                  AUTHORITATIVE OWNERS
                         commits
                            │
                            ▼
                     Leyforge Journal
                            │
                            ▼
                     SaveCoordinator
                            │
          ┌─────────────────┼─────────────────┐
          │                 │                 │
      Voxel Store      Structured DB      Files/Blobs
        Zylann?        SQLite-class?       manifests
          │                 │                 │
          └─────────────────┼─────────────────┘
                            │
                      provider-ready
                            │
                            ▼
                    CHECKPOINT MANIFEST
                     checkpoint C104
                            │
                            ▼
                      published/valid
```

---

# 93. Checkpoint Manifest — Candidate Fields

Conceptually:

```text
world_id
checkpoint_id
parent_checkpoint_id
timestamp / world-time marker
world schema version
content manifest hash/version
registry/generator version
journal committed-through ID
voxel provider state/version
structured DB state/version
file/blob manifest
integrity hashes/checks
migration lineage
```

Exact fields/representation remain deferred.

---

# 94. Crash-Recovery Candidate Flow

```text
open world
   ↓
find latest published checkpoint
   ↓
validate manifest/provider availability
   ↓
open coherent provider states
   ↓
validate journal boundary
   ↓
replay/finish/compensate post-checkpoint operations
   ↓
rebuild disposable derived caches
   ↓
create NEW WorldSession epoch
   ↓
ACTIVE
```

---

# 95. Command / Persistence / Network Correlation

Example block placement:

```text
Client
Command OP-8101
      ↓
Server validation
      ↓
Canonical transaction OP-8101 / R500
      ↓
Journal record
      ↓
SpatialChangeSet R500
      ├── voxel provider
      ├── nav/physics
      ├── save provider
      └── network replication
      ↓
Client ack:
OP-8101 COMMITTED R500
```

If the acknowledgement is lost:

```text
client reconnect:
"What happened to OP-8101?"

server:
"Already committed as R500."
```

---

# 96. Snapshot / Delta Examples

## Entity

```text
EntitySnapshot
  entity_id
  state_revision
  canonical frame/address
  semantic state
```

Then:

```text
EntityDelta
  entity_id
  base_revision
  new_revision
  changed fields/events
```

## Voxel region

```text
VoxelRegionSnapshot
  realm/frame
  region/block address
  revision
  compact semantic/runtime payload
```

Then:

```text
VoxelDelta
  base_revision
  new_revision
  operations/cell changes
```

Baseline mismatch → scoped repair/snapshot.

---

# 97. Persistence Consistency Classes

Candidate:

## P0 — In-memory committed

Canonical owner accepted the mutation.

## P1 — Journal durable

Enough operation evidence exists to recover/replay according to contract.

## P2 — Provider durable

Relevant storage providers have written their state.

## P3 — Checkpoint published

Manifest/lineage declares a coherent recovery point.

Different actions may require different acknowledgement guarantees.

---

# 98. Reconnect Consistency Classes

Candidate:

## R0 — Fresh bootstrap

No usable client baseline.

## R1 — Short-gap resume

Recent acknowledged revisions retained; send deltas.

## R2 — Mixed repair

Some scopes current, others need snapshots.

## R3 — Full rebootstrap

Gap too large/incompatible; stable character identity survives but client projections rebuild.

---

# 99. Security / Abuse Alignment

Round 5 ties PRD-03 security findings into architecture:

- explicit admission;
- no arbitrary object decode;
- command validation;
- semantic action budgets;
- bulk payload limits;
- interest request budgets;
- dedupe/replay protection;
- separate admin plane;
- stable identity separate from peer;
- content/protocol compatibility before world admission.

---

# 100. Round-5 Master Ownership Matrix

| Concern | Canonical owner | Provider/adapter | Key rule |
|---|---|---|---|
| protocol message semantics | Leyforge protocol | ENet/Godot | transport-independent |
| peer transport | session adapter | ENet | transient |
| account/player identity | auth/domain service | session mapping | stable ID |
| command validation | domain owner | protocol decoder | intent only |
| operation dedupe | domain/session authority | command registry/journal | operation ID |
| entity replication | server authority | interest/protocol | committed state |
| voxel replication | world authority | bulk protocol | scoped snapshot/delta |
| interest | Leyforge InterestManager | provider consumers | cross-domain |
| journal | Leyforge persistence | file/DB implementation | authoritative operation evidence |
| checkpoint | SaveCoordinator | voxel/DB/file providers | one coherent lineage |
| DB state | domain storage adapter | SQLite-class candidate | provider |
| voxel durability | SaveCoordinator/VoxelFacade | Zylann stream/store | participant |
| reconnect identity | session/domain | new peer binding | stable character/player |
| reconnect repair | protocol/interest | snapshot/delta | revision-aware |
| save success UX | SaveCoordinator policy | UI | defined durability class |

---

# 101. Round-5 Risk Register

| ID | Risk | Severity | Response |
|---|---|---:|---|
| `PRD04-R05-01` | SceneMultiplayer wire format becomes permanent protocol | RED | Leyforge protocol layer |
| `PRD04-R05-02` | NodePath/RID/peer ID used as persistent network identity | RED | stable IDs |
| `PRD04-R05-03` | arbitrary Object decode from network | CRITICAL | explicit bounded decoder |
| `PRD04-R05-04` | duplicate retransmitted command duplicates gameplay effect | RED | operation IDs/dedupe |
| `PRD04-R05-05` | client prediction treated as committed truth | RED | predicted vs confirmed |
| `PRD04-R05-06` | delta applied to wrong baseline | RED | base revision checks |
| `PRD04-R05-07` | voxel bulk blocks realtime control | RED | traffic separation |
| `PRD04-R05-08` | interest == view distance only | RED | cross-domain policy |
| `PRD04-R05-09` | interest loss deletes entity | RED | residency/existence split |
| `PRD04-R05-10` | client can force unlimited region generation | RED | request budgets |
| `PRD04-R05-11` | DB commit interpreted as whole-world checkpoint | RED | SaveCoordinator |
| `PRD04-R05-12` | voxel write interpreted as whole-world checkpoint | RED | outer checkpoint |
| `PRD04-R05-13` | independently latest provider files mixed on recovery | CRITICAL | checkpoint lineage |
| `PRD04-R05-14` | journal logs every provider micro-step | AMBER/PERF | consequential authority only |
| `PRD04-R05-15` | provider write order defines canonical history | RED | Leyforge transaction order |
| `PRD04-R05-16` | migration corrupts only known-good checkpoint | CRITICAL | preserve source |
| `PRD04-R05-17` | save complete means job queued | RED | explicit durability |
| `PRD04-R05-18` | autosave freezes world excessively | AMBER/RED | snapshots/journal/barriers |
| `PRD04-R05-19` | reconnect creates duplicate character | CRITICAL | stable identity/lease |
| `PRD04-R05-20` | new peer ID treated as new player | RED | auth/session mapping |
| `PRD04-R05-21` | unacked command resent with new ID | RED | original operation ID |
| `PRD04-R05-22` | server retains infinite delta history | RED/PERF | bounded history |
| `PRD04-R05-23` | packet receipt ack means transaction committed | RED | semantic acknowledgements |
| `PRD04-R05-24` | admin exposed as normal player RPC | CRITICAL | separate authorization plane |
| `PRD04-R05-25` | packet-rate limit ignores expensive semantic work | RED | action/computational budgets |
| `PRD04-R05-26` | compressed payload allocates before validation | CRITICAL | bounded decode |
| `PRD04-R05-27` | enum reorder changes wire identity | RED | governed IDs |
| `PRD04-R05-28` | shutdown disconnects before durability drain | RED | SaveCoordinator shutdown |
| `PRD04-R05-29` | local cache becomes recovery authority | RED | server authority |
| `PRD04-R05-30` | live backup copies inconsistent files | RED | checkpoint copy |

---

# 102. Round-5 Proof Obligations

## PRD04-PROOF-35 — Duplicate Command / Lost Ack

Send a consequential command, drop the acknowledgement, reconnect and retry with the same operation ID. Verify exactly one authoritative effect.

## PRD04-PROOF-36 — Protocol Baseline Mismatch

Apply voxel/entity deltas against deliberately stale/wrong baselines. Client must reject and request scoped repair.

## PRD04-PROOF-37 — Teleport Interest Spike

Teleport many clients to cold distant regions. Verify interest admission, voxel bulk, realtime traffic and server generation queues remain bounded.

## PRD04-PROOF-38 — Cross-Domain Interest

One client stands in Region A, remotely manages Settlement B, belongs to Vessel C and receives quest state from Realm D. Verify bounded independent scopes.

## PRD04-PROOF-39 — Cross-Store Crash Matrix

Crash after each stage:

```text
canonical commit
journal append
DB commit
voxel write
checkpoint manifest publish
```

Recovery must select one coherent result.

## PRD04-PROOF-40 — Corrupt Latest Checkpoint

Damage/miss one latest provider artifact. Verify integrity detection and fallback/recovery to prior known-good lineage.

## PRD04-PROOF-41 — Save During Heavy Edits

Run high-rate construction/voxel/fluid/vessel changes while autosaving. Measure pause time, queue depth, durability lag and restart correctness.

## PRD04-PROOF-42 — Reconnect During Realm Transition

Disconnect at each phase of a portal transition. Reconnect. Exactly one realm/address/character state is authoritative.

## PRD04-PROOF-43 — Reconnect During Inventory Transaction

Disconnect after request, before ack, after commit and during save delay. No duplicated/lost items.

## PRD04-PROOF-44 — Client Cache Poison

Present stale cache from another world, old content manifest or old region revision. Incorrect reuse must be refused.

## PRD04-PROOF-45 — Server Restart Resume

Persist world, kill server, restart into new WorldSession epoch and reconnect clients. Stable world/character IDs survive; runtime handles do not.

## PRD04-PROOF-46 — Network Backpressure

Saturate connection with voxel bulk. Verify authoritative commands/control remain responsive and bulk is bounded/throttled.

## PRD04-PROOF-47 — Persistence Backpressure

Artificially slow a storage provider. Verify queue/backpressure/health policy prevents unbounded durability lag.

## PRD04-PROOF-48 — World Copy / Backup

Create portable backup from published checkpoint while live world continues. Restore independently and verify coherent world identity/history.

---

# 103. Round-5 New Architecture Unknowns

1. Exact Leyforge network message ID format?
2. Binary codec: custom, FlatBuffers, MessagePack-like, protobuf-like, other?
3. Which protocol schema technology best preserves stable IDs/versioning?
4. Should protocol messages be generated from one schema source?
5. Do save/journal schemas reuse the same generated types?
6. What is the protocol major/minor compatibility policy?
7. How many previous client versions may connect?
8. Are exact client/server build matches required initially?
9. How are optional extensions negotiated?
10. What content-manifest hash structure is used?
11. How are official DLC/mod namespaces represented in admission?
12. Can clients join missing cosmetic-only packs?
13. Can clients join missing semantic packs?
14. How are content downloads handled?
15. What packet/message size limit is default?
16. What segment size is used for voxel bulk?
17. Which compression algorithm is used?
18. Is compression dictionary/versioned?
19. Which payload classes are never compressed?
20. What ENet channel mapping wins prototype tests?
21. How is message priority implemented?
22. How is per-peer queued byte count measured?
23. What disconnect policy applies to severely slow clients?
24. What exact client-side prediction is in V1?
25. Is character locomotion predicted?
26. Are block edits predicted?
27. Are inventory actions predicted or pending?
28. What rollback/correction history is retained?
29. How does local-origin rebase interact with prediction buffers?
30. How are server authoritative physics snapshots encoded?
31. What entity state is delta-compressed?
32. What voxel delta representation is best?
33. Are block operations sent semantically or as runtime palette values?
34. If runtime palette is sent, how is mapping versioned/repaired?
35. How are large structures/vessels snapshotted?
36. What is the interest spatial index?
37. Is interest cell size independent per domain?
38. How often is interest recalculated?
39. How are fast-moving vessels handled?
40. How are projectiles beyond entity interest range handled?
41. How are sounds/events replicated outside visual interest?
42. How are remote-management summaries permissioned?
43. How are spectator/admin interest scopes represented?
44. How are split-screen viewers with wide separation budgeted?
45. What is max voxel interest per connection?
46. How are teleport prefetch requests prioritized?
47. How are malicious interest oscillations detected?
48. Does server initially host one world per process?
49. How are multiple WorldSessions hosted later?
50. What exact operation-ID scope is used?
51. UUID, monotonic server ID, composite account/session sequence, other?
52. Which operations require idempotency keys?
53. How long is dedupe history retained?
54. Is dedupe history persisted across restart?
55. Which operation statuses are journaled?
56. What exact journal format is used?
57. Append-only binary log, DB table, files, other?
58. Is journal per world, realm, partition or domain?
59. How is journal corruption detected?
60. How is journal compaction performed?
61. Can checkpoints truncate old journal safely?
62. Which history remains permanently for gameplay versus recovery only?
63. Does world history live separately from recovery journal?
64. What durability guarantees apply to mining/building?
65. When may server acknowledge a block placement?
66. Is journal durability enough or is checkpoint durability required?
67. What crash-loss window is acceptable?
68. How frequent are checkpoints?
69. Is interval time/operation/size/adaptive based?
70. How much write amplification do checkpoints cause?
71. Can DB use WAL safely with checkpoint coordination?
72. How are WAL files backed up?
73. Does SaveCoordinator use DB backup APIs?
74. How are voxel stream writes flushed/barriered?
75. Does Zylann expose enough completion evidence for barriers?
76. If not, is an outer voxel journal/overlay required?
77. What generated-baseline/edit-overlay strategy is used?
78. Can untouched regions be regenerated?
79. How are generator-version upgrades handled?
80. How are edits migrated when baseline changes?
81. What happens when a required mod block disappears?
82. How are unknown semantic IDs quarantined?
83. Can world open read-only for recovery?
84. How are backups named/versioned?
85. How many previous checkpoints are retained?
86. How is disk pressure handled?
87. How does save storage compact safely?
88. Can checkpoint publication use atomic rename on all targets?
89. What happens on weaker filesystem semantics?
90. Are checkpoints directory-based or manifest-pointer-based?
91. How is cloud save layered later?
92. How are huge backups uploaded incrementally?
93. What save data is per-world versus per-account/player?
94. How are local settings separated from world save?
95. How are server config and canonical world settings separated?
96. What exactly is a character lease?
97. How long after disconnect is lease retained?
98. Can same account control multiple local characters?
99. How are split-screen player identities bound?
100. What prevents two sessions controlling same character?
101. How are reconnect tokens secured?
102. Are reconnect tokens stored server-side or signed?
103. How is session hijack prevented?
104. How are bans/kicks represented relative to identities?
105. What state remains after kick vs timeout?
106. How does reconnect work after server IP migration?
107. Is server service identity separate from world identity?
108. Can a world move hosts and retain world identity?
109. How are clients told a new server endpoint?
110. Which Round-5 decisions become ADRs after proof?

---

# 104. Round-5 Architecture Diagram

```text
                      AUTHORITATIVE WORLD
                    owners / transactions
                            │
                 committed operation R
                            │
          ┌─────────────────┴──────────────────┐
          │                                    │
          ▼                                    ▼
   PERSISTENCE SIDE                      NETWORK SIDE
          │                                    │
       Journal                            Protocol Event/
          │                               Snapshot/Delta
          ▼                                    │
   SaveCoordinator                             ▼
   ┌──────┼──────┐                       InterestManager
   │      │      │                             │
 Voxel   DB    Files                           ▼
 Store  Store  Blobs                      Session/Peer
   │      │      │                             │
   └──────┼──────┘                             ▼
          │                                  ENet
          ▼
   Checkpoint C
          │
          └────────── recovery/reconnect ──────┐
                                               │
                                               ▼
                                      stable world/player state
```

---

# 105. Round-5 Locked Invariants

Round 5 locks:

1. Leyforge owns the durable gameplay protocol.
2. Transport does not define message semantics.
3. SceneTree/NodePath/peer IDs are not durable network identity.
4. Protocol/schema/content compatibility is explicit.
5. Public messages use bounded explicit schemas.
6. Client commands are intents; server/domain authority commits.
7. Prediction is non-authoritative.
8. Operation IDs support dedupe/retry where consequential.
9. Snapshot and delta are complementary.
10. Deltas require compatible baselines.
11. Bulk voxel traffic is separated from realtime control.
12. Interest management is Leyforge-owned and cross-domain.
13. Interest is distinct from simulation fidelity and view distance.
14. Interest loss does not delete canonical state.
15. SaveCoordinator alone declares whole-world checkpoints.
16. Checkpoint metadata identifies coherent provider lineage.
17. Journal boundary is explicit.
18. Journal records consequential authority, not provider micro-work.
19. Provider commit order does not define canonical transaction order.
20. Cross-store atomicity/recovery sits above providers.
21. DB and voxel store are checkpoint participants, not world authority.
22. Previous known-good checkpoints remain recoverable.
23. Save success maps to a real durability class.
24. Recovery selects one coherent checkpoint lineage.
25. Migration failure preserves recovery source.
26. Reconnect uses stable player/character identity.
27. New peer/session does not create a new canonical character.
28. Reconnect compares acknowledged revisions/operations.
29. Reconnect uses scoped snapshot/delta repair.
30. Unacknowledged commands can be resolved idempotently.
31. Network history retention is bounded.
32. Packet receipt != transaction commit.
33. Service/admin plane is separate from gameplay plane.
34. Semantic/computational rate limits protect server work.
35. Protocol evolution is explicit/versioned.
36. World bootstrap is staged.
37. Server restart changes WorldSession, not WorldDefinition.
38. Client cache is disposable and context-keyed.
39. Save/network diagnostics correlate through operation IDs.
40. World copies/backups come from coherent checkpoints, not arbitrary live file copies.

---

# 106. Round-5 Gate Result

**PASS — CONTINUE PRD-04**

The network/persistence/reconnect boundary is sufficiently clear to proceed into Forge/content/settings architecture.

Round 5 does not select:

- exact binary codec;
- exact network channel layout;
- exact compression;
- exact interest cell dimensions;
- exact journal file format;
- exact SQLite integration;
- checkpoint interval/retention counts;
- exact reconnect token/session implementation;
- exact durability acknowledgement level per action.

It locks the deeper architecture:

> **Networking and persistence are two projections of the same committed Leyforge authority. The protocol replicates committed revisions/operations to interested clients; the SaveCoordinator publishes coherent checkpoints across storage providers; reconnect repairs client state against stable world/player identity and acknowledged authoritative revisions rather than transient peer/runtime state.**

---

# 107. Updated PRD-04 Round Sequence

1. **Round 1 — Top-level ownership, authority classes and anti-leakage rules** — **COMPLETE**
2. **Round 2 — Canonical coordinates, WorldSession, spatial frames and SceneTree projection lifecycle** — **COMPLETE**
3. **Round 3 — Simulation partitions, workers, owners, revisions, task/lifetime and commit topology** — **COMPLETE**
4. **Round 4 — Voxel, physics, movement, navigation, fluids and vessel integration facades** — **COMPLETE**
5. **Round 5 — Network protocol, interest management, save coordinator, database and reconnect boundaries** — **COMPLETE**
6. **Round 6 — Forge source/bake/runtime pipeline, content packs, mod trust and settings/presentation boundaries** — **NEXT**
7. **Round 7 — Diagnostics, tests, build/dependency boundaries and whole-stack transaction/interface reconciliation**
8. **Round 8 — Final architecture map, conditional decisions, proof handoff and PRD-04 closure candidate**

---

# 108. Immediate Next Action

Proceed to:

> **PRD-04 Round 6 — Forge source/bake/runtime pipeline, content packs, mod trust and settings/presentation boundaries.**

Round 6 must define:

- canonical content source representation;
- Forge authoring ownership;
- source → validate → compile/bake → runtime pipeline;
- block/item/model/material/audio/VFX asset compilation boundaries;
- content pack manifests/dependencies/namespaces;
- official DLC vs player data-only mods;
- trusted script/native extension tiers;
- runtime content loading;
- settings registry;
- graphics/simulation/world-creation settings separation;
- accessibility/presentation fallbacks;
- Forge renderer/profile certification.

The governing rule is:

> **The Forge authors semantic source content. Runtime engine assets are compiled products. Player content trust is explicit. Settings and presentation may change execution and appearance, but never silently redefine canonical game meaning.**

---

**ROUND-5 RESULT: NETWORK / INTEREST / SAVE / DATABASE / RECONNECT ARCHITECTURE COMPLETE.**

---

# 109. Round-6 Scope

Round 6 defines the content-production and player-facing configuration boundary around Leyforge.

It covers:

- canonical semantic content definitions;
- The Forge as authoring environment;
- Art Production Handoff responsibilities;
- source → validate → compile/bake → runtime pipeline;
- model/rig/animation/material/texture/shader/VFX/audio/icon generation boundaries;
- Forge previews versus runtime truth;
- block/item/generated-form compilation;
- content-pack manifests;
- pack namespace/dependency/version authority;
- official packs/DLC/patches;
- player-authored data-only content;
- trusted script/native extension tiers;
- runtime content loading;
- content capability/complexity limits;
- settings registry;
- graphics settings;
- simulation settings;
- world-creation settings;
- server/world rules;
- accessibility settings;
- presentation fallback certification;
- renderer/profile-specific baked products.

Core question:

> **How does Leyforge let The Forge and player creators author an enormous amount of content while keeping canon, runtime assets, security, settings and presentation from collapsing into one undifferentiated pile?**

Round-6 answer:

> **Leyforge canonical semantics remain authoritative. The Forge owns governed source authoring and validation. The Art Production Handoff owns reproducible final-asset production requirements. Compilers/bakers create provider-specific runtime artifacts. Content packs carry governed manifests and explicit trust classes. Settings alter execution, fidelity and presentation within declared scopes but do not silently redefine semantic identity or world truth.**

---

# 110. Content Production Vocabulary

## 110.1 Canonical Definition

A governed semantic definition describing what a content identity means.

Examples:

- material identity;
- block/item semantic key;
- form/state eligibility;
- creature identity;
- machine capability;
- realm association;
- gameplay tags/capabilities.

Canonical definitions are not raw Godot resources.

## 110.2 Forge Source

Editable creator-facing source content.

Examples:

- block/material definition;
- model source;
- rig/animation source;
- texture/material graph/source;
- VFX source;
- audio source;
- icon/UI source;
- structure/blueprint;
- recipe/content schema.

Forge source is optimized for authoring and review, not necessarily runtime performance.

## 110.3 Art Production Handoff

The governed production contract that tells Codex/The Forge/asset tooling how to turn semantic/visual requirements into final assets.

It includes production instructions for things such as:

- models;
- rigs;
- animations;
- textures;
- materials;
- shaders;
- VFX;
- audio;
- icons;
- export/bake requirements;
- naming/scale/pivot/LOD/variant requirements;
- validation/certification.

This is distinct from visual canon itself.

## 110.4 Baked Runtime Artifact

A compiled/provider-specific product optimized for execution.

Examples:

- Godot Resource;
- mesh;
- collision data;
- material/shader variant;
- texture import result;
- Zylann block model;
- animation library;
- audio stream;
- runtime registry table;
- compact generated-form mapping.

Baked artifacts are disposable/rebuildable when source + compiler/toolchain remain available.

## 110.5 Content Pack

A governed collection of semantic/source/baked content with a manifest describing:

- pack identity;
- version;
- namespace;
- dependencies;
- compatibility;
- trust class;
- hashes/signatures where appropriate.

---

# 111. Round-6 Boundary Register

## PRD04-BND-321 — Canonical content semantics remain above Forge/runtime assets

**Maturity:** `BOUNDARY-LOCK`

The Forge, Godot Resources, Zylann block models, textures, meshes and other assets represent canonical definitions.

They do not redefine the canonical meaning of an existing Leyforge semantic ID merely through their file contents.

---

## PRD04-BND-322 — The Forge owns governed authoring workflow

**Maturity:** `BOUNDARY-LOCK`

The Forge is the primary creator-facing environment for governed Leyforge content authoring.

It owns source-editing workflows, validation feedback, previews, bake requests and pack assembly.

---

## PRD04-BND-323 — The Forge is not just a form/JSON editor

**Maturity:** `BOUNDARY-LOCK`

The Forge must preserve the project's intended visual/3D authoring experience, including direct creation/editing of appropriate models, materials, textures, animations, VFX, structures and other content.

Declarative metadata supports the workflow but does not replace real visual authoring.

---

## PRD04-BND-324 — Art Production Handoff is distinct from semantic/visual canon

**Maturity:** `BOUNDARY-LOCK`

Canon answers:

> what should this asset represent?

The Art Production Handoff answers:

> how must the asset be produced, authored, validated and delivered so the Forge/runtime can use it reliably?

Both are required.

---

## PRD04-BND-325 — FCC/semantic certification does not certify production readiness

**Maturity:** `BOUNDARY-LOCK`

A semantically/visually certified content definition is not automatically ready for final asset generation.

Production readiness additionally requires applicable Forge/art-handoff requirements.

---

## PRD04-BND-326 — Production handoff does not rewrite canonical identity

**Maturity:** `BOUNDARY-LOCK`

Model topology, texture packing, rig naming, LODs, compression and export conventions are production concerns.

They must not silently create new semantic identities unless canon/schema explicitly requires them.

---

## PRD04-BND-327 — Forge source and baked runtime artifact are separate classes

**Maturity:** `BOUNDARY-LOCK`

Editable source and runtime products are not treated as interchangeable.

Runtime artifacts may be regenerated from governed source/toolchain.

---

## PRD04-BND-328 — Baked runtime artifact is not the sole editable source

**Maturity:** `BOUNDARY-LOCK`

The normal content pipeline must not require reverse-engineering imported/compressed runtime assets to make ordinary edits.

---

## PRD04-BND-329 — Content compilation is deterministic where required

**Maturity:** `CANDIDATE`

Given the same:

- source;
- canonical definitions;
- compiler/tool versions;
- target profile;

the bake pipeline should produce semantically equivalent deterministic outputs and stable manifests/hashes where practical.

Exact binary reproducibility requirements remain proof-gated.

---

## PRD04-BND-330 — Bake provenance is recorded

**Maturity:** `BOUNDARY-LOCK`

Runtime artifacts should be traceable to:

- source identity/version;
- compiler/bake version;
- target profile;
- content-pack version;
- relevant semantic definition revision.

---

## PRD04-BND-331 — Forge validation precedes production bake

**Maturity:** `BOUNDARY-LOCK`

Invalid source should fail before becoming an approved runtime pack.

Validation may include:

- schema;
- stable IDs;
- namespace;
- references;
- scale/pivot;
- texture/material rules;
- animation/rig contract;
- performance budgets;
- accessibility/presentation rules;
- trust/security constraints.

---

## PRD04-BND-332 — Validation severity is explicit

**Maturity:** `BOUNDARY-LOCK`

Forge validators distinguish:

- error/blocker;
- warning;
- advisory;
- profile-specific incompatibility.

A Compatibility-renderer warning is not treated the same as a broken stable ID.

---

## PRD04-BND-333 — Forge source may be technology-neutral where beneficial

**Maturity:** `BOUNDARY-LOCK`

Canonical/source content should avoid unnecessary Godot/Zylann coupling where a provider-neutral schema better preserves portability and auditability.

Provider-specific extensions may exist behind explicit fields/adapters.

---

## PRD04-BND-334 — Provider-specific source is permitted when the content itself requires provider features

**Maturity:** `BOUNDARY-LOCK`

Not every source must be abstract.

Custom Godot shader/VFX/editor data may be provider-specific when that is genuinely the authored medium.

Its semantic role and fallback requirements remain Leyforge-governed.

---

## PRD04-BND-335 — Source format choice does not define semantic identity

**Maturity:** `BOUNDARY-LOCK`

Changing a Forge source representation from one serialization format to another does not create new game content identities.

---

## PRD04-BND-336 — Runtime registry is compiled from canonical content manifests

**Maturity:** `BOUNDARY-LOCK`

Runtime registries/palettes are derived from governed canonical/pack definitions.

Runtime registration order must not create semantic IDs.

---

## PRD04-BND-337 — Generated forms use semantic keys, not manually duplicated content rows

**Maturity:** `BOUNDARY-LOCK`

FCC-12/13 generated standard-form semantics remain authoritative.

Forge/runtime generation compiles eligible material/form combinations without creating unnecessary duplicate canonical material identities.

---

## PRD04-BND-338 — Generated runtime entries are rebuildable

**Maturity:** `BOUNDARY-LOCK`

Derived block/item/model/material variants generated from semantic rules may be rebuilt when packs/toolchains change.

Persistent worlds reference stable semantic keys/mappings, not accidental generated row positions.

---

## PRD04-BND-339 — Block and item projections remain separate from semantic identity where canon requires

**Maturity:** `BOUNDARY-LOCK`

One physical semantic thing may have:

- world/block projection;
- inventory/item projection;
- installed projection;
- dropped projection;

without automatically becoming multiple canonical identities.

---

## PRD04-BND-340 — Forge preview is a projection, not certification by appearance alone

**Maturity:** `BOUNDARY-LOCK`

A preview looking correct does not prove:

- semantic validity;
- collision;
- renderer compatibility;
- performance;
- accessibility;
- animation correctness;
- runtime pack validity.

Certification uses explicit validators/tests.

---

## PRD04-BND-341 — Forge preview uses runtime-equivalent materials where practical

**Maturity:** `CANDIDATE`

Preview should reuse the same compiled material/model logic as runtime where feasible to reduce authoring/runtime divergence.

Exact preview architecture remains implementation work.

---

## PRD04-BND-342 — Preview may show multiple target profiles

**Maturity:** `BOUNDARY-LOCK`

Forge should be capable of preview/certification against relevant profiles such as:

- Forward+;
- Mobile;
- Compatibility where supported;
- high/low graphics;
- accessibility variants;
- UI scale.

---

## PRD04-BND-343 — Asset production is target-profile aware

**Maturity:** `BOUNDARY-LOCK`

A source asset may compile into different runtime artifacts/settings per:

- renderer;
- platform;
- performance profile;
- server/client role.

These are projections of one governed source identity.

---

## PRD04-BND-344 — Dedicated-server packs omit presentation-only products where safe

**Maturity:** `BOUNDARY-LOCK`

Server content manifests retain semantic definitions and authoritative resources while omitting unnecessary:

- textures;
- visual meshes;
- VFX;
- audio;
- UI;

unless required for server-side validation or gameplay queries.

---

## PRD04-BND-345 — Server/client semantic manifests remain compatible despite different baked payloads

**Maturity:** `BOUNDARY-LOCK`

Client and dedicated-server packs may contain different physical resources but must agree on canonical semantic IDs/schema required for world authority.

---

## PRD04-BND-346 — Content pack has stable identity/version

**Maturity:** `BOUNDARY-LOCK`

Every governed pack has a stable pack ID/namespace and explicit version.

File name alone is not pack identity.

---

## PRD04-BND-347 — Pack namespace authority is explicit

**Maturity:** `BOUNDARY-LOCK`

A pack can define only namespaces/IDs permitted by Leyforge governance.

Load order does not allow arbitrary takeover of another pack's canonical namespace.

---

## PRD04-BND-348 — Pack dependencies are declared

**Maturity:** `BOUNDARY-LOCK`

Content packs declare required/optional dependencies and version constraints where needed.

Missing required dependencies fail admission/load clearly.

---

## PRD04-BND-349 — Pack dependency graph must terminate

**Maturity:** `BOUNDARY-LOCK`

Circular/invalid dependency graphs are rejected or explicitly unsupported.

---

## PRD04-BND-350 — Pack manifest contains compatibility metadata

**Maturity:** `BOUNDARY-LOCK`

Manifest may include:

- pack ID/version;
- namespace;
- required Leyforge schema/API;
- dependency ranges;
- content type;
- trust class;
- hashes/signature;
- target/runtime profiles;
- optional metadata/licensing.

Exact format remains deferred.

---

## PRD04-BND-351 — Pack version is separate from individual semantic definition version

**Maturity:** `BOUNDARY-LOCK`

One pack release may update many definitions/artifacts.

Persistent migration logic references whichever scope is appropriate rather than conflating all versions.

---

## PRD04-BND-352 — Official base content is still pack-governed

**Maturity:** `BOUNDARY-LOCK`

Built-in Leyforge content should follow the same manifest/namespace/version principles as DLC/mod content where practical.

"Built in" is not an excuse for invisible dependency behavior.

---

## PRD04-BND-353 — DLC/official patch trust is explicit

**Maturity:** `BOUNDARY-LOCK`

Official DLC/patch packs may carry signed trusted content and executable components where required.

Trust derives from governed distribution/signature policy, not file extension.

---

## PRD04-BND-354 — Player default mod tier is data-only

**Maturity:** `BOUNDARY-LOCK`

Default third-party/player content does not execute arbitrary GDScript, C#, native code or unrestricted editor scripts.

---

## PRD04-BND-355 — Data-only mod schema is Leyforge-owned

**Maturity:** `BOUNDARY-LOCK`

M0/player-safe content uses declarative Leyforge schemas and bounded asset imports validated by The Forge/runtime importer.

---

## PRD04-BND-356 — Data-only does not mean risk-free

**Maturity:** `BOUNDARY-LOCK`

Untrusted data may still cause:

- decompression abuse;
- huge resource allocation;
- pathological geometry;
- recursive references;
- excessive recipes/variants;
- shader/material abuse;
- accessibility/readability issues.

Complexity and size limits remain mandatory.

---

## PRD04-BND-357 — Player-safe content cannot smuggle executable entries

**Maturity:** `BOUNDARY-LOCK`

A pack declaring the safe/data-only tier is rejected/quarantined if it contains forbidden:

- scripts;
- native libraries;
- editor plugins;
- executable hooks.

---

## PRD04-BND-358 — Trusted script extensions are a separate tier

**Maturity:** `BOUNDARY-LOCK`

Script-capable mods/extensions require explicit trusted-code policy and user/server acceptance.

They are not silently upgraded from ordinary data mods.

---

## PRD04-BND-359 — Native extensions are full-trust code

**Maturity:** `BOUNDARY-LOCK`

GDExtension/native plugins execute with application-process privileges and are treated as fully trusted software dependencies.

---

## PRD04-BND-360 — Script/native trust cannot be created by schema validation alone

**Maturity:** `BOUNDARY-LOCK`

A syntactically valid executable mod can still be malicious.

Validation and trust are different controls.

---

## PRD04-BND-361 — Signed code proves provenance/integrity, not safety

**Maturity:** `BOUNDARY-LOCK`

Signature verification does not make arbitrary third-party executable code safe.

---

## PRD04-BND-362 — World records required semantic pack dependencies

**Maturity:** `BOUNDARY-LOCK`

A world/checkpoint records the semantic packs/versions/manifests required to interpret its content.

---

## PRD04-BND-363 — Missing semantic content is an explicit recovery condition

**Maturity:** `BOUNDARY-LOCK`

If a required content pack is unavailable, world open may:

- refuse;
- enter governed recovery/read-only/quarantine mode;
- use explicit migration/placeholder policy.

It must not silently reinterpret unknown IDs.

---

## PRD04-BND-364 — Unknown semantic IDs are preserved/quarantined, not recycled

**Maturity:** `BOUNDARY-LOCK`

Unknown IDs from removed content remain distinguishable from newly assigned IDs.

Stable-ID meaning is never recycled to "fix" missing content.

---

## PRD04-BND-365 — Client-only cosmetic content cannot alter authoritative collision/semantics

**Maturity:** `BOUNDARY-LOCK`

Cosmetic packs may alter approved presentation only.

They cannot independently change:

- collision;
- hitboxes;
- traversal;
- item stats;
- semantic visibility obligations;
- server gameplay rules.

---

## PRD04-BND-366 — Semantic content packs participate in multiplayer admission

**Maturity:** `BOUNDARY-LOCK`

Server/client must agree on required semantic content manifests before world admission.

---

## PRD04-BND-367 — Content hot reload is scope-governed

**Maturity:** `BOUNDARY-LOCK`

Not all content may be safely hot-reloaded.

Changes are classified as:

- presentation-only;
- runtime-registry compatible;
- new-world-only;
- migration-required;
- restart-required.

---

## PRD04-BND-368 — Hot reload never silently mutates persistent semantic identity

**Maturity:** `BOUNDARY-LOCK`

Changing a source definition while a world is active does not retroactively redefine existing semantic IDs without an explicit migration/transaction contract.

---

## PRD04-BND-369 — Forge compile/bake output is cacheable by content/tool/profile identity

**Maturity:** `CANDIDATE`

Bake cache keys should include sufficient source/tool/target identity to avoid stale artifacts.

Exact hashing scheme is deferred.

---

## PRD04-BND-370 — Bake cache is disposable

**Maturity:** `BOUNDARY-LOCK`

Deleting runtime bake caches must not destroy canonical source content/world semantics.

---

## PRD04-BND-371 — Forge compiler errors are first-class diagnostics

**Maturity:** `BOUNDARY-LOCK`

Asset/source compilation reports stable source identity, validator, target profile, tool version and actionable reason.

---

## PRD04-BND-372 — Content generation by AI/tooling uses the same validation path

**Maturity:** `BOUNDARY-LOCK`

Codex/AI-generated models, textures, animations, VFX, sounds and definitions are not privileged.

They must pass the same Forge/handoff validators as human-authored content.

---

## PRD04-BND-373 — AI generation provenance may be recorded where useful

**Maturity:** `CANDIDATE`

Forge source metadata may record generation recipe/tool/version/reference lineage for reproducibility and debugging.

Exact governance remains Art Production Handoff scope.

---

## PRD04-BND-374 — Final asset production must be reproducible enough to repair/update content

**Maturity:** `BOUNDARY-LOCK`

The production pipeline should retain enough source/handoff/tool information that an asset can be regenerated or intentionally revised without rediscovering the production method from scratch.

---

## PRD04-BND-375 — Art production validation includes semantic alignment

**Maturity:** `BOUNDARY-LOCK`

A technically valid model/texture/audio asset can still fail if it represents the wrong material, form, culture, creature, machine state or other canonical meaning.

---

## PRD04-BND-376 — Semantic material identity is separate from rendered material resource

**Maturity:** `BOUNDARY-LOCK`

`leyforge:material/iron` remains semantic identity.

A Godot Material/ShaderMaterial/resource is a renderer/runtime projection.

---

## PRD04-BND-377 — Derived form appearance follows semantic source rules

**Maturity:** `BOUNDARY-LOCK`

Generated forms such as plates, rods, cogs, stairs and related derived items use material/form inheritance rules instead of ad-hoc manually recolored assets unless the form requires bespoke art.

---

## PRD04-BND-378 — Texture/material family templates are preferred over per-item shader proliferation

**Maturity:** `BOUNDARY-LOCK`

Forge compilers should favor reusable material/shader families with governed parameters to control shader permutations and visual consistency.

---

## PRD04-BND-379 — Model/rig/animation contracts are asset-type-specific

**Maturity:** `BOUNDARY-LOCK`

Character, creature, vessel, prop, item and structure assets may have different production contracts.

One universal art export rule is not assumed.

---

## PRD04-BND-380 — Runtime LOD/variant products are derived from one source identity where appropriate

**Maturity:** `BOUNDARY-LOCK`

High/medium/low LODs, platform variants and collision meshes are runtime production variants unless canon assigns distinct semantic identity.

---

## PRD04-BND-381 — Audio playback asset is projection of semantic audio event

**Maturity:** `BOUNDARY-LOCK`

Gameplay sound-event semantics and AI-hearing consequences are separate from whichever WAV/OGG/stream is played to the user.

---

## PRD04-BND-382 — VFX asset is presentation, not sole gameplay cue

**Maturity:** `BOUNDARY-LOCK`

Spell/hazard/machine state cannot exist semantically only in a particle/compositor effect.

---

## PRD04-BND-383 — Icon/UI art does not define semantic state

**Maturity:** `BOUNDARY-LOCK`

Icons project semantic IDs/states.

Changing icon art does not change the underlying content identity.

---

## PRD04-BND-384 — Settings are governed Leyforge definitions

**Maturity:** `BOUNDARY-LOCK`

Each product setting should have a stable Leyforge setting identity/schema rather than existing only as a menu widget or arbitrary Godot project setting.

---

## PRD04-BND-385 — Setting scope is explicit

**Maturity:** `BOUNDARY-LOCK`

Settings declare scope such as:

- device/local user;
- account;
- local player;
- world;
- server;
- world-creation-only;
- accessibility;
- graphics;
- simulation.

---

## PRD04-BND-386 — Graphics settings do not change canonical simulation truth

**Maturity:** `BOUNDARY-LOCK`

Graphics settings may change:

- renderer;
- resolution scale;
- shadows;
- particles;
- post-processing;
- visual distance;
- presentation LOD.

They do not alter authoritative economy, AI, resources, fluid quantity or other game truth.

---

## PRD04-BND-387 — Simulation settings are distinct from graphics settings

**Maturity:** `BOUNDARY-LOCK`

Simulation-quality/scalability settings may change permitted fidelity, cadence, active radius or aggregate strategies according to explicit game contracts.

They are not hidden inside a graphics preset.

---

## PRD04-BND-388 — World-creation simulation options become world rules where applicable

**Maturity:** `BOUNDARY-LOCK`

Choices made at world creation that alter world behavior are stored as governed world settings/rules.

They do not remain mere local menu preferences.

---

## PRD04-BND-389 — Server authority controls authoritative world settings in multiplayer

**Maturity:** `BOUNDARY-LOCK`

Clients cannot locally override simulation/world rules that affect canonical multiplayer truth.

---

## PRD04-BND-390 — Local accessibility settings remain player-owned where possible

**Maturity:** `BOUNDARY-LOCK`

UI scale, high contrast, subtitles, TTS, reduced motion and similar presentation accessibility settings should generally remain local/player preferences unless a setting affects authoritative gameplay.

---

## PRD04-BND-391 — Accessibility settings do not reduce required semantic information

**Maturity:** `BOUNDARY-LOCK`

A reduced-particle/reduced-motion/high-contrast profile must still communicate required gameplay state through equivalent accessible cues.

---

## PRD04-BND-392 — Presentation fallbacks are part of content certification

**Maturity:** `BOUNDARY-LOCK`

Content certification checks that critical state remains interpretable with:

- reduced particles;
- no compositor effects;
- low shadows;
- supported low renderer;
- color-accessibility modes;
- large UI scale.

---

## PRD04-BND-393 — Renderer/profile support is declared per content feature

**Maturity:** `BOUNDARY-LOCK`

A content asset/effect can declare required/fallback renderer capability.

Unsupported high-tier polish must not silently remove required gameplay information.

---

## PRD04-BND-394 — Compatibility support is earned, not assumed

**Maturity:** `BOUNDARY-LOCK`

A content pack/profile is Compatibility-supported only after applicable materials/shaders/visual cues pass certification.

---

## PRD04-BND-395 — Mobile renderer is a legitimate desktop scalability target

**Maturity:** `BOUNDARY-LOCK`

Forge/runtime profile definitions should support Mobile renderer as a possible balanced/low modern-GPU target, not only mobile-device content.

---

## PRD04-BND-396 — UI scale is independent from 3D resolution scale

**Maturity:** `BOUNDARY-LOCK`

Low 3D render resolution must not force blurred/unreadable UI.

---

## PRD04-BND-397 — Input binding is a settings projection over semantic actions

**Maturity:** `BOUNDARY-LOCK`

Semantic actions such as interact/jump/attack remain stable while keyboard/gamepad/touch mappings are user-configurable.

---

## PRD04-BND-398 — Runtime input remaps are persisted by Leyforge settings layer

**Maturity:** `BOUNDARY-LOCK`

Godot InputMap changes are implementation state.

Leyforge settings owns persistence/versioning/conflict policy.

---

## PRD04-BND-399 — Input device profile may differ without changing gameplay action semantics

**Maturity:** `BOUNDARY-LOCK`

Mouse, controller and touch may use different curves/layouts while invoking the same governed action meanings.

---

## PRD04-BND-400 — Local split-screen settings may be per-player/per-viewer

**Maturity:** `BOUNDARY-LOCK`

Where practical, local players may have separate:

- controls;
- UI preferences;
- camera settings;
- accessibility preferences;

without creating separate world authority.

---

## PRD04-BND-401 — Server settings and world rules are distinct

**Maturity:** `BOUNDARY-LOCK`

Server operational configuration—ports, player cap, admin, logging, autosave frequency—is distinct from canonical world gameplay rules.

---

## PRD04-BND-402 — World rule changes are transactions where consequential

**Maturity:** `BOUNDARY-LOCK`

Changing an authoritative rule on a running world may require:

- validation;
- permissions;
- journal/save evidence;
- network replication;
- migration/recalculation.

It is not merely changing a UI checkbox.

---

## PRD04-BND-403 — Setting availability is capability-aware

**Maturity:** `BOUNDARY-LOCK`

Settings UI may hide/disable options unavailable under current:

- renderer;
- hardware;
- platform;
- server role;
- content profile.

The registry retains stable setting identity.

---

## PRD04-BND-404 — Setting migrations are explicit

**Maturity:** `BOUNDARY-LOCK`

Renamed/removed/changed settings use migration/deprecation rules rather than silently reusing old keys with different meaning.

---

## PRD04-BND-405 — Graphics auto-detection produces defaults, not immutable policy

**Maturity:** `BOUNDARY-LOCK`

Hardware detection/startup benchmark may choose recommended settings.

Players retain control over supported local presentation options.

---

## PRD04-BND-406 — Safe graphics recovery path is required

**Maturity:** `BOUNDARY-LOCK`

A user must be able to recover from unsupported/broken display/renderer/shader configuration without manually editing opaque project internals.

---

## PRD04-BND-407 — First-run accessibility can precede world entry

**Maturity:** `BOUNDARY-LOCK`

Critical UI scale, contrast, subtitle/TTS and input-access needs should be available before requiring successful ordinary gameplay navigation.

---

## PRD04-BND-408 — Settings presets expand to explicit setting values

**Maturity:** `BOUNDARY-LOCK`

"Low/Medium/High" presets are convenience bundles.

The underlying setting registry remains independently addressable.

---

## PRD04-BND-409 — Simulation presets expose intentional trade-offs

**Maturity:** `BOUNDARY-LOCK`

Low-end simulation presets should document what fidelity/cadence/range changes and preserve core game rules/invariants unless the world-creation option explicitly chooses a different rule set.

---

## PRD04-BND-410 — Content can declare scalability metadata

**Maturity:** `CANDIDATE`

Forge source/compiled manifests may declare costs/alternatives such as:

- particle budget;
- shadow requirement;
- LOD availability;
- texture memory class;
- simulation cost class;
- fallback asset.

Exact schema remains Forge engineering work.

---

## PRD04-BND-411 — Content budget validation occurs before pack certification

**Maturity:** `BOUNDARY-LOCK`

Forge should prevent a content pack from becoming "supported" while violating declared memory, shader, geometry, VFX, audio or simulation budgets for its claimed target profiles.

---

## PRD04-BND-412 — Modded content does not bypass presentation/accessibility obligations automatically

**Maturity:** `BOUNDARY-LOCK`

A pack may be marked uncertified/limited, but the engine should not silently treat third-party content as meeting official accessibility/performance standards.

---

## PRD04-BND-413 — Official content must pass all claimed profile certifications

**Maturity:** `BOUNDARY-LOCK`

Official Leyforge content should not rely on "works on the developer's Forward+ machine" as certification.

---

## PRD04-BND-414 — Forge pack build produces a manifest of source and runtime outputs

**Maturity:** `CANDIDATE`

A build should report:

- semantic definitions included;
- source assets;
- generated/baked outputs;
- target profiles;
- validators/results;
- hashes;
- dependencies;
- tool versions.

Exact report format remains deferred.

---

## PRD04-BND-415 — Forge build is reproducible from repository/source package

**Maturity:** `BOUNDARY-LOCK`

Production content should not depend on undocumented editor state or one developer workstation.

---

## PRD04-BND-416 — Content build may run headless/CI where feasible

**Maturity:** `BOUNDARY-LOCK`

Validation, manifest generation, deterministic compilation and non-interactive bakes should be automatable for CI.

Interactive visual authoring remains a Forge/editor workflow.

---

## PRD04-BND-417 — Manual artistic review remains valid evidence where automation is insufficient

**Maturity:** `BOUNDARY-LOCK`

Not all art quality/semantic alignment can be certified mechanically.

Forge governance may require human/manual visual review alongside automated validators.

---

## PRD04-BND-418 — Content certification result is versioned evidence

**Maturity:** `BOUNDARY-LOCK`

Certification applies to a specific source/pack/tool/profile combination.

Editing the source or compiler can invalidate prior certification.

---

## PRD04-BND-419 — Content pack build does not mutate source definitions silently

**Maturity:** `BOUNDARY-LOCK`

Compilers may normalize/generated derived outputs, but source changes must be explicit/reviewable rather than hidden bake side effects.

---

## PRD04-BND-420 — Runtime-generated content obeys the same semantic authority

**Maturity:** `BOUNDARY-LOCK`

Procedurally assembled structures/items/forms at runtime use canonical definitions and provider adapters.

Runtime generation does not mint uncontrolled new semantic IDs.

---

## PRD04-BND-421 — User-created world content and reusable content-pack source are distinguishable

**Maturity:** `BOUNDARY-LOCK`

A player placing blocks in a save is not automatically authoring a globally reusable pack.

Exporting reusable blueprints/content is an explicit Forge/content operation.

---

## PRD04-BND-422 — Blueprint/structure export preserves semantic references

**Maturity:** `BOUNDARY-LOCK`

Reusable structure exports reference stable semantic materials/components and declare dependencies rather than baking accidental runtime palette IDs.

---

## PRD04-BND-423 — Content pack migration is separate from world migration

**Maturity:** `BOUNDARY-LOCK`

Updating a pack can require a world migration, but the two are distinct controlled operations.

Pack version update alone does not silently rewrite every world.

---

## PRD04-BND-424 — Content removal requires explicit deprecation/missing-content policy

**Maturity:** `BOUNDARY-LOCK`

Removing semantic definitions uses governed deprecation/alias/migration/quarantine behavior.

---

## PRD04-BND-425 — Forge/runtime import boundary rejects unsupported external references

**Maturity:** `BOUNDARY-LOCK`

Imported models/materials/assets must not retain uncontrolled external filesystem/URI dependencies that break portability or security.

---

## PRD04-BND-426 — Source asset licensing/provenance may be pack metadata

**Maturity:** `CANDIDATE`

Content packs may record license/credit/provenance metadata for user/mod/official content.

Exact policy remains governance/product work.

---

## PRD04-BND-427 — Runtime content path is not semantic identity

**Maturity:** `BOUNDARY-LOCK`

Moving a baked asset path does not create a new content identity when manifest/semantic mapping remains valid.

---

## PRD04-BND-428 — Runtime resource UID is secondary to pack/semantic manifest

**Maturity:** `BOUNDARY-LOCK`

Godot Resource UIDs help runtime/editor references but do not replace pack IDs/stable semantic IDs.

---

## PRD04-BND-429 — Pack loading order is deterministic and governed

**Maturity:** `BOUNDARY-LOCK`

When precedence is allowed—for patches or explicit overrides—it is declared by manifest/authority policy, not incidental filesystem enumeration.

---

## PRD04-BND-430 — Override capability is permissioned by namespace/content class

**Maturity:** `CANDIDATE`

Player-safe packs should not freely replace protected official semantic definitions unless an explicit override system permits it.

Exact override policy remains deferred.

---

# 112. Content Authority Stack

```text
                 CANONICAL LEYFORGE SEMANTICS
                            │
                 FCC / governed definitions
                            │
                            ▼
                    FORGE SOURCE CONTENT
             editable models / definitions / art
                            │
                            ▼
                 ART PRODUCTION HANDOFF
         production rules / validation / deliverables
                            │
                            ▼
                 VALIDATE / COMPILE / BAKE
                            │
              ┌─────────────┼──────────────┐
              │             │              │
          Godot assets   Zylann assets   server data
              │             │              │
              └─────────────┼──────────────┘
                            │
                            ▼
                    CONTENT PACK MANIFEST
                            │
                            ▼
                      RUNTIME REGISTRY
```

Authority flows downward.

Runtime artifacts do not flow upward and redefine the source semantics.

---

# 113. Art Production Handoff Boundary

The Art Production Handoff should eventually define production contracts by asset family.

Illustrative:

```text
Semantic/visual requirement
      ↓
Asset Family Contract
      ├── model topology/scale/pivot
      ├── rig/skeleton naming
      ├── animation clips/root motion
      ├── texture dimensions/channels
      ├── material/shader template
      ├── VFX limits/fallback
      ├── audio format/loop/spatial rules
      ├── icon framing/background
      ├── LOD/collision products
      └── validation/certification
      ↓
Forge/Codex generation
      ↓
review
      ↓
bake/runtime
```

The architecture deliberately separates:

```text
FCC/Canon:
what Iron Golem should be

Art Production Handoff:
how its model/rig/textures/animations/VFX/audio
must be authored/generated

Forge Compiler:
how those sources become runtime products
```

---

# 114. Candidate Forge Build Pipeline

```text
AUTHOR / AI / IMPORT
        ↓
Forge Source
        ↓
Schema + semantic validation
        ↓
Art-production validation
        ↓
Dependency/namespace validation
        ↓
Target-profile validation
        ↓
Compile / bake
        ↓
Runtime artifacts
        ↓
Renderer/platform/server variants
        ↓
Pack manifest + hashes
        ↓
Certification
        ↓
Runtime install/load
```

Failures stop at the earliest meaningful stage.

---

# 115. Pack Trust Classes

Round 6 formalizes the PRD-03 security split.

## M0 — Data-only content

Default safe player/mod pack class.

May contain approved declarative data and bounded assets.

No arbitrary executable code.

## M1 — Trusted script extension

Explicitly trusted scripted functionality.

Requires separate permission/install/server policy.

## M2 — Native/plugin extension

Native application code.

Full-trust dependency.

## O — Official signed content

Official base/DLC/patch content.

May contain M0/M1/M2 components as governed by official build/distribution policy.

Trust class and semantic authority are still separate concepts.

---

# 116. Candidate Pack Manifest

```text
pack_id
pack_version
namespace(s)
trust_class
Leyforge schema/API version
dependencies[]
optional_dependencies[]
semantic_manifest
source_manifest?          # creator/dev distribution
runtime_artifacts[]
target_profiles[]
server_required_artifacts[]
hashes
signature/provenance?
license/credits?
```

Exact serialization remains deferred.

---

# 117. Settings Architecture

Candidate:

```text
                    SettingsRegistry
                           │
   ┌────────────┬──────────┼───────────┬─────────────┐
   │            │          │           │             │
Graphics   Accessibility  Input    Simulation    World Rules
   │            │          │           │             │
local       local/player  player    local/server   authoritative
   │            │          │           │             │
   └────────────┴──────────┼───────────┴─────────────┘
                           │
                      UI projection
                           │
                 Godot/provider adapters
```

Each setting definition may include:

```text
setting_id
scope
type/range/options
default
availability predicate
restart/reload requirement
authority level
migration/deprecation
accessible name/help
profile membership
```

---

# 118. Graphics vs Simulation vs World Rules

Examples:

## Graphics

```text
renderer
resolution scale
shadow quality
particles
post FX
water visual quality
render distance
texture/LOD quality
```

May not change canonical truth.

## Simulation scalability

```text
distant simulation cadence
active NPC detail budget
fluid fidelity/radius
ecology update budget
pathing concurrency
```

May change execution/fidelity only within preserved invariants.

## World-creation rules

```text
difficulty/system complexity
simulation features enabled
realm/world generation rules
persistent gameplay modifiers
```

Become authoritative world configuration where they change actual world behavior.

## Server operations

```text
port
max players
autosave interval
logging
admin configuration
resource budgets
```

Operational configuration, separate from canonical world rules unless explicitly promoted.

---

# 119. Presentation Certification Matrix

An official critical-state asset should be checked under relevant combinations:

```text
Forward+
Mobile
Compatibility if claimed

High / Medium / Low presentation
Reduced particles
Post FX off
Shadows off/reduced
High-contrast profile
Color-accessibility profile
Large UI scale
```

Question:

> **Does the player still understand the required semantic state?**

If not, the content is not certified for that profile.

---

# 120. Generated-Form Compilation Example

```text
Semantic:
material = iron
form = cog

Eligibility:
iron supports cog

Source art rule:
metal cog template
    +
iron material appearance

Forge:
compile semantic key
(iron, cog)
     ↓
runtime item projection
runtime mesh/material
runtime icon
```

No manually invented:

```text
iron_cog_material_id_8241
```

unless a genuine distinct semantic identity is required.

---

# 121. Server/Client Pack Difference Example

```text
PACK: leyforge:creatures/base
```

Client might contain:

```text
creature semantic definitions
models
rigs
animations
textures
materials
VFX
audio
icons
```

Dedicated server might contain:

```text
creature semantic definitions
collision/query data
AI/gameplay data
animation semantic markers if required
```

Both agree on:

```text
stable creature IDs
capabilities
gameplay schema
pack version/manifest
```

---

# 122. Round-6 Master Ownership Matrix

| Concern | Canonical owner | Authoring/production | Runtime projection |
|---|---|---|---|
| semantic content ID | FCC/Leyforge | Forge references | registry handles/resources |
| material/form rules | FCC/Leyforge | Forge templates | block/item/material variants |
| visual target | visual/content canon | art production handoff | model/material/texture |
| source asset | Forge/source governance | Forge/Codex/human | baked runtime asset |
| rig/animation contract | Art Handoff/Forge | production tooling | Skeleton/Animation resources |
| shader/material family | Forge art/runtime contract | Forge | Godot shader/material |
| audio semantic event | Leyforge gameplay | audio production | audio streams/buses |
| content pack identity | Leyforge content governance | Forge pack builder | installed pack |
| pack dependency | manifest authority | Forge | loader graph |
| mod trust | security/content governance | Forge/installer | runtime loader |
| runtime registry | Leyforge compiler | build pipeline | Godot/Zylann mappings |
| graphics setting | SettingsRegistry | settings UI | renderer/provider values |
| simulation setting | simulation/world policy | settings UI | scheduler/fidelity configuration |
| world rule | world authority | world creation/admin transaction | simulation behavior |
| accessibility cue | Leyforge UX/content contract | Forge/UI | visuals/audio/TTS/UI |

---

# 123. Round-6 Risk Register

| ID | Risk | Severity | Response |
|---|---|---:|---|
| `PRD04-R06-01` | baked asset becomes only editable source | RED | source/runtime separation |
| `PRD04-R06-02` | Godot Resource defines canonical identity | RED | semantic manifest authority |
| `PRD04-R06-03` | semantic certification mistaken for production readiness | RED | Art Production Handoff |
| `PRD04-R06-04` | art handoff accidentally changes canon | RED | production vs semantic authority |
| `PRD04-R06-05` | Forge degenerates into metadata forms only | RED PRODUCT | real visual/3D authoring requirement |
| `PRD04-R06-06` | AI-generated asset bypasses validators | RED | same pipeline for all authors |
| `PRD04-R06-07` | runtime bake depends on undocumented workstation state | RED | reproducible build/tool versions |
| `PRD04-R06-08` | generated forms duplicated manually | RED | semantic generated-form compilation |
| `PRD04-R06-09` | shader/material proliferation explodes permutations | RED/PERF | family templates/budgets |
| `PRD04-R06-10` | preview looks good but runtime/profile fails | RED | certification matrix |
| `PRD04-R06-11` | dedicated server ships huge presentation-only pack | AMBER/PERF | role-specific bake |
| `PRD04-R06-12` | server/client semantic manifests diverge | CRITICAL | manifest compatibility |
| `PRD04-R06-13` | file/load order creates namespace authority | RED | manifest/namespace governance |
| `PRD04-R06-14` | circular pack dependency | RED | graph validation |
| `PRD04-R06-15` | safe mod contains hidden script/native code | CRITICAL | trust-tier validation |
| `PRD04-R06-16` | data-only mod causes resource exhaustion | RED | complexity/size budgets |
| `PRD04-R06-17` | signed executable mod assumed safe | RED | provenance != safety |
| `PRD04-R06-18` | removed pack IDs silently reused | CRITICAL | quarantine/no recycling |
| `PRD04-R06-19` | cosmetic mod changes collision/readability unfairly | RED | cosmetic capability limits |
| `PRD04-R06-20` | hot reload mutates existing semantic meaning | RED | compatibility/migration classes |
| `PRD04-R06-21` | baked cache deletion destroys content | RED | cache disposable |
| `PRD04-R06-22` | graphics setting changes simulation truth | RED | separate scope |
| `PRD04-R06-23` | simulation setting hidden inside graphics preset | RED | explicit simulation registry |
| `PRD04-R06-24` | client overrides authoritative world rule | CRITICAL | server/world authority |
| `PRD04-R06-25` | reduced-particle mode hides critical hazard | RED A11Y | fallback certification |
| `PRD04-R06-26` | low renderer removes gameplay cue | RED | semantic presentation contract |
| `PRD04-R06-27` | UI scale coupled to 3D scale | RED | independent UI scaling |
| `PRD04-R06-28` | runtime remaps lost on restart | RED UX | Leyforge settings persistence |
| `PRD04-R06-29` | old setting key reused with new meaning | RED | migrations/deprecation |
| `PRD04-R06-30` | bad graphics config makes game unrecoverable | RED UX | safe recovery path |
| `PRD04-R06-31` | official content skips low-profile certification | RED | profile certification |
| `PRD04-R06-32` | blueprint stores runtime palette IDs | RED | stable semantic refs |
| `PRD04-R06-33` | pack update silently migrates all worlds | RED | pack/world migration separation |
| `PRD04-R06-34` | imported model retains unsafe external URI/path | RED SECURITY | import sanitization |
| `PRD04-R06-35` | pack build silently edits source | RED GOVERNANCE | explicit source change |
| `PRD04-R06-36` | runtime generator mints uncontrolled IDs | RED | canonical generator contract |

---

# 124. Round-6 Proof Obligations

## PRD04-PROOF-49 — Source → Bake Reproducibility

Build the same representative pack on clean environments.

Compare:

- semantic manifest;
- runtime registry;
- target-profile artifacts;
- hashes where deterministic.

No hidden editor/workstation dependency.

## PRD04-PROOF-50 — Art Production Handoff Fixture

Take one representative asset family—for example a creature or machine—from canonical definition through:

- model;
- rig;
- animations;
- textures/materials;
- VFX;
- audio;
- icon;
- collision/LOD;
- runtime bake.

Verify Codex/Forge can produce the required asset without inventing missing production conventions.

## PRD04-PROOF-51 — AI vs Human Source Parity

Submit equivalent human-authored and AI-generated assets through the same validator/build pipeline.

No privileged bypass.

## PRD04-PROOF-52 — Generated Form Explosion

Generate large material×form combinations from FCC eligibility rules.

Measure:

- registry size;
- bake time;
- shader/material count;
- icon/model generation;
- runtime palette pressure.

Verify no duplicate semantic IDs.

## PRD04-PROOF-53 — Renderer/Profile Certification

One representative content pack runs through:

- Forward+;
- Mobile;
- Compatibility if targeted;
- particles off;
- shadows off;
- low resolution scale;
- accessibility profiles.

Critical semantics remain readable.

## PRD04-PROOF-54 — Server/Client Pack Split

Bake same semantic pack into client and dedicated-server products.

Verify:

- same semantic manifest;
- server omits presentation assets;
- authoritative gameplay remains intact.

## PRD04-PROOF-55 — Safe Mod Smuggling

Create an M0/data pack containing hidden:

- GDScript;
- native library;
- editor plugin;
- external URI;
- pathological archive entries.

Loader/Forge must reject/quarantine it.

## PRD04-PROOF-56 — Data Mod Resource Bomb

Test:

- huge textures;
- millions of definitions;
- recursive blueprint;
- extreme mesh;
- deep dependency chain;
- decompression bomb.

Budgets prevent unbounded work/memory.

## PRD04-PROOF-57 — Missing Pack World Recovery

Save world containing semantic IDs from a test mod.

Remove mod.

Verify governed missing-content behavior preserves unknown IDs and does not reinterpret/recycle them.

## PRD04-PROOF-58 — Pack Upgrade / World Migration

Upgrade semantic pack with:

- additive change;
- compatible art-only change;
- deprecated definition;
- breaking schema change.

Verify each enters correct hot-reload/migration/restart class.

## PRD04-PROOF-59 — Settings Scope Isolation

Change:

- graphics;
- accessibility;
- input;
- simulation;
- world rule;
- server operation.

Verify only the intended scope changes and authoritative multiplayer rules cannot be locally overridden.

## PRD04-PROOF-60 — Safe Graphics Recovery

Force invalid renderer/resolution/shader configuration.

Restart/recover through safe settings path without editing project files.

## PRD04-PROOF-61 — Accessibility Semantic Torture

Disable/reduce:

- particles;
- post FX;
- color distinctions;
- motion;
- sound categories where alternatives exist.

Critical hazards/states remain understandable.

## PRD04-PROOF-62 — Forge CI Build

Headlessly validate/build a representative pack from clean source checkout and emit manifest/certification report.

---

# 125. Round-6 New Architecture Unknowns

1. What serialization format becomes the primary Forge semantic source?
2. Which source types use Godot Resources directly?
3. Which source types should remain provider-neutral text/schema?
4. Does the Forge store canonical definitions inside the repository or separate pack workspaces?
5. How are source assets linked to canonical FCC IDs?
6. How are source document revisions represented?
7. What exact Art Production Handoff document families exist by asset type?
8. Which handoff requirements are universal vs asset-family-specific?
9. What metadata must Codex receive to generate a complete asset?
10. How are references/turnarounds/style examples linked without duplicating canon?
11. How are asset-generation prompts/recipes versioned?
12. What AI model/tool provenance is worth recording?
13. How are manual edits after AI generation represented?
14. What constitutes a production-certified final asset?
15. Who/what signs off manual visual review?
16. How does Forge represent rejected/needs-rework states?
17. How are production exceptions/waivers recorded?
18. What naming rules exist for model bones, animation clips and material slots?
19. What unit/scale/pivot/orientation standards are required?
20. How are sockets/attachment points represented?
21. What collision proxy source belongs in art handoff versus runtime generation?
22. Which LODs are authored versus generated?
23. How are animation retargeting contracts handled?
24. Is there one humanoid reference rig or several?
25. How are non-humanoid rigs standardized?
26. How are first-person vs third-person assets related?
27. How are held-item poses/attachments defined?
28. How are equipment/armor morph/fit systems produced?
29. What texture channel packing is standard?
30. Are base Leyforge textures always 32×32 for blocks only, or other asset families differ?
31. How are high-resolution creature/prop textures governed relative to block art?
32. Which material templates are officially supported?
33. How are transparent/cutout materials classified?
34. What shader features are allowed in M0 mods?
35. Can M0 mods provide custom shader code at all?
36. If not, which parameterized shader templates are exposed?
37. How are VFX graphs/templates authored?
38. What particle limits are enforced per profile?
39. What compositor effects can official content use?
40. How are low-renderer VFX fallbacks authored?
41. What audio source/mastering formats are required?
42. How are loop points/3D attenuation semantics represented?
43. How are footsteps/material sounds generated from material identity?
44. How are voice assets/localization linked?
45. What icon generator pipeline uses live 3D snapshots?
46. How are icon backgrounds/rarity/state overlays separated?
47. What Forge tooling is needed for frame animations?
48. What exact generated-form icon/model pipeline is used?
49. What runtime artifact format does Zylann block library consume?
50. How are block custom shapes authored and compiled?
51. How are block collision forms certified?
52. How are animated blocks represented across renderer tiers?
53. What exact source→runtime pipeline exists for structures/dungeons?
54. How are blueprint dependencies resolved?
55. How are blueprint local frames stored?
56. Can packs contain worldgen features/biome definitions in M0?
57. Which worldgen scripting capabilities are safe declaratively?
58. How are recipe/provider/capability definitions exposed to mods?
59. What maximum semantic definition count is supported per pack?
60. What maximum pack count is supported?
61. What dependency-resolution algorithm/version semantics are used?
62. SemVer, exact version, range, custom compatibility ID?
63. How are optional dependencies handled?
64. How are conflicts surfaced in Forge?
65. Can one pack patch another pack's data?
66. What official override hierarchy exists?
67. How are localization packs classified?
68. Are texture-only packs allowed to replace protected presentation assets?
69. How are fairness/readability constraints enforced in multiplayer cosmetics?
70. How are client-only packs declared?
71. How are server-required semantic packs distributed?
72. Is automatic pack download in scope?
73. If so, what signature/hash/source trust model is required?
74. How are pack licenses displayed to players?
75. How are removed packs represented in world manifest?
76. Can a missing-content world open read-only in Forge for repair?
77. How are unknown block IDs visually represented without losing identity?
78. How are aliases/migrations supplied by pack updates?
79. How is a pack migration tested against historical saves?
80. Can hot reload occur on a dedicated server?
81. Which source/art changes are presentation-only hot reloads?
82. Which registry additions are safe live?
83. Which changes require world restart?
84. How do connected clients synchronize pack hot reload?
85. What settings storage format is used?
86. Which settings are per device versus account cloud-synced?
87. Which settings are per local player?
88. Which settings are stored in world metadata?
89. Which world rules are immutable after creation?
90. Which can be changed by admin transaction?
91. How are simulation scalability profiles represented?
92. Which simulation settings are safe for multiplayer servers?
93. Do clients expose local simulation options at all on remote servers?
94. How are low-end world-creation presets described to players?
95. Which settings require restart?
96. Which renderer changes require restart?
97. How is safe mode triggered automatically/manually?
98. How is first-launch hardware benchmarking done?
99. How are graphics defaults adjusted after hardware changes?
100. How are settings imported/exported?
101. How are controller profiles per device stored?
102. How are split-screen control assignments persisted?
103. What settings are accessibility-critical enough for first boot?
104. How is screen-reader metadata certified inside Forge UI?
105. How are color-accessibility validators implemented?
106. How are photosensitivity/reduced-flash constraints validated?
107. How are subtitles/non-speech captions sourced from semantic audio events?
108. Which presentation requirements become automated Forge validators?
109. Which require manual certification?
110. Which Round-6 boundaries become ADRs after PRD-07 proof?

---

# 126. Round-6 Architecture Diagram

```text
                     LEYFORGE CANON
                          │
                          ▼
                   Forge Source Layer
            semantic + visual + production source
                          │
                          ▼
                Art Production Handoff
                          │
                          ▼
                   Validator Pipeline
              schema / semantic / art / cost /
               security / accessibility
                          │
                          ▼
                    Compile / Bake
                          │
       ┌──────────────────┼───────────────────┐
       │                  │                   │
   Client Assets      Server Assets      Registry/Data
       │                  │                   │
       └──────────────────┼───────────────────┘
                          │
                          ▼
                    Pack Manifest
                          │
                          ▼
                    Runtime Loader
                          │
         ┌────────────────┼────────────────┐
         │                │                │
      Godot            Zylann        Leyforge Domains
         │                │                │
         └────────────────┼────────────────┘
                          │
                    player/settings
                          │
                   presentation only
                   where scoped local
```

---

# 127. Round-6 Locked Invariants

Round 6 locks:

1. Canonical semantics remain above Forge and runtime assets.
2. The Forge owns governed authoring workflow.
3. The Forge remains a real visual/3D creation environment, not only metadata forms.
4. Art Production Handoff is distinct from semantic/visual canon.
5. Semantic certification does not automatically mean production-ready.
6. Forge source and baked runtime artifacts are separate.
7. Runtime artifacts are rebuildable and not the sole editable source.
8. Bake provenance/version context is recorded.
9. All source—human or AI-generated—uses the same validators.
10. Runtime registries compile from stable semantic/pack definitions.
11. Generated forms use semantic material/form keys.
12. Forge preview is not certification by appearance alone.
13. Target renderer/platform/server variants remain projections of one source identity.
14. Dedicated-server packs may omit presentation-only assets.
15. Pack ID/namespace/version/dependencies are explicit.
16. Load order does not create namespace authority accidentally.
17. Default player mod tier is data-only.
18. Safe data-only packs cannot contain arbitrary executable code.
19. Script/native extensions are explicit trusted tiers.
20. Signed code proves provenance, not safety.
21. Worlds record required semantic pack manifests.
22. Missing semantic IDs are preserved/quarantined, never recycled.
23. Cosmetic packs cannot change authoritative collision/gameplay semantics.
24. Content hot reload is compatibility-classified.
25. Bake caches are disposable.
26. Art assets retain enough production source/handoff to be reproducibly repaired.
27. Semantic material/audio/VFX/icon identities remain separate from runtime assets.
28. Settings use a governed registry with explicit scope.
29. Graphics, simulation, world rules, server operations and accessibility are separate setting classes.
30. Graphics settings cannot change canonical simulation truth.
31. Authoritative world rules are server/world-owned in multiplayer.
32. Accessibility settings preserve required semantic information.
33. Presentation fallbacks are part of content certification.
34. Renderer/profile support is claimed only after certification.
35. UI scale remains independent from 3D resolution scale.
36. Input mappings project stable semantic actions.
37. Settings migrations/deprecations are explicit.
38. Safe graphics recovery is required.
39. Official content must pass all claimed profile budgets/certification.
40. Reusable blueprints/content export stable semantic references, not runtime handles.
41. Pack updates and world migrations are separate controlled operations.
42. External asset import is sanitized/bounded.
43. Runtime paths/Resource UIDs do not become semantic identity.
44. Pack precedence/override behavior is governed and deterministic.

---

# 128. Round-6 Gate Result

**PASS — CONTINUE PRD-04**

The Forge/content/settings boundary is sufficiently clear to proceed into diagnostics, testing, build/dependency and whole-stack reconciliation.

Round 6 does not select:

- exact Forge source serialization;
- final Art Production Handoff schemas;
- exact AI asset-generation tooling;
- exact pack archive format;
- exact dependency-version syntax;
- exact runtime shader permissions for M0 content;
- exact settings persistence format;
- exact content hot-reload capabilities;
- exact renderer certification automation.

It locks the deeper architecture:

> **Leyforge canon owns semantic meaning. The Forge and Art Production Handoff own reproducible authoring/production. Compilers create disposable provider-specific runtime products. Content packs declare identity, dependencies and trust. Settings alter only the scopes they explicitly own, and presentation/accessibility certification ensures lower-quality modes never erase gameplay meaning.**

---

# 129. Updated PRD-04 Round Sequence

1. **Round 1 — Top-level ownership, authority classes and anti-leakage rules** — **COMPLETE**
2. **Round 2 — Canonical coordinates, WorldSession, spatial frames and SceneTree projection lifecycle** — **COMPLETE**
3. **Round 3 — Simulation partitions, workers, owners, revisions, task/lifetime and commit topology** — **COMPLETE**
4. **Round 4 — Voxel, physics, movement, navigation, fluids and vessel integration facades** — **COMPLETE**
5. **Round 5 — Network protocol, interest management, save coordinator, database and reconnect boundaries** — **COMPLETE**
6. **Round 6 — Forge source/bake/runtime pipeline, content packs, mod trust and settings/presentation boundaries** — **COMPLETE**
7. **Round 7 — Diagnostics, tests, build/dependency boundaries and whole-stack transaction/interface reconciliation** — **NEXT**
8. **Round 8 — Final architecture map, conditional decisions, proof handoff and PRD-04 closure candidate**

---

# 130. Immediate Next Action

Proceed to:

> **PRD-04 Round 7 — Diagnostics, tests, build/dependency boundaries and whole-stack transaction/interface reconciliation.**

Round 7 must define:

- stable diagnostics/support schema;
- provider metric adapters;
- task/queue/revision observability;
- test-layer boundaries;
- CI/build matrix ownership;
- dependency adapter/governance interfaces;
- release symbol/crash-support ownership;
- whole-stack command→commit→provider→save→network traceability;
- interface rules preventing circular ownership;
- architecture conformance checks.

The governing rule is:

> **If Leyforge cannot explain who owned a transaction, which revision committed, which provider represented it, what was persisted, what was replicated and why a failure occurred, the architecture is not production-governable.**

---

**ROUND-6 RESULT: FORGE / ART-PRODUCTION / SOURCE-BAKE-RUNTIME / CONTENT-PACK / MOD-TRUST / SETTINGS / PRESENTATION ARCHITECTURE COMPLETE.**


---

# 131. Round-7 Scope

Round 7 defines the operational/governance architecture needed to make the previous six rounds testable, diagnosable, buildable and enforceable.

It covers:

- stable diagnostic identities;
- end-to-end transaction correlation;
- structured logging;
- provider metric adapters;
- task/queue/revision observability;
- health/degraded-state reporting;
- support bundles and redaction;
- crash symbols and release-build traceability;
- test-layer ownership;
- contract tests;
- provider adapter conformance;
- headless/exported/hardware tests;
- deterministic fixtures;
- fault injection/chaos testing;
- CI quality gates;
- performance budgets;
- build matrix ownership;
- Godot/Zylann edition/precision/provider matrix;
- dependency pinning;
- third-party provenance/license/security records;
- upstream patches/forks;
- architecture conformance;
- dependency-direction enforcement;
- whole-stack transaction/interface reconciliation;
- PRD-05/06/07 proof handoff preparation.

Core question:

> **Can Leyforge prove which subsystem owned a decision, what revision committed, which providers represented it, what persisted, what replicated and why a failure occurred—without reverse-engineering the runtime after the fact?**

Round-7 answer:

> **Yes, if diagnostics, tests, builds and dependency governance are treated as first-class architecture consumers. Stable correlation IDs, revision-aware metrics, contract-oriented tests, reproducible build manifests and enforced dependency directions make the architecture observable and auditable rather than merely documented.**

---

# 132. Operational Vocabulary

## 132.1 Correlation ID

A stable identifier that ties related work together across services/providers.

May correlate:

- command;
- operation;
- transaction;
- journal entry;
- provider task;
- network acknowledgement;
- diagnostic records.

It is not necessarily identical to every subsystem's internal task ID.

## 132.2 Diagnostic Event

A structured operational record describing:

- what occurred;
- which subsystem/provider;
- world/session;
- owner/partition;
- revision/operation;
- severity/category;
- result/failure reason.

## 132.3 Health State

A bounded operational assessment such as:

```text
HEALTHY
DEGRADED
RECOVERING
BLOCKED
FAILED
```

Health is diagnostic/service state, not gameplay semantic identity.

## 132.4 Contract Test

A test asserting a Leyforge-facing interface/behavior independently from one exact implementation.

## 132.5 Provider Conformance Test

A test proving that a specific Godot/Zylann/DB/nav/etc. adapter satisfies the Leyforge contract.

## 132.6 Build Manifest

A machine-readable record identifying the exact technology/content/dependency inputs that produced an executable/runtime artifact.

---

# 133. Round-7 Boundary Register

## PRD04-BND-431 — Diagnostics are architecture consumers, not afterthoughts
**Maturity:** `BOUNDARY-LOCK`

Every consequential architecture boundary should expose enough stable evidence for diagnosis without requiring direct inspection of private provider internals.

## PRD04-BND-432 — Diagnostic schema is Leyforge-owned
**Maturity:** `BOUNDARY-LOCK`

Leyforge defines stable high-level diagnostic categories/fields. Godot/Zylann/DB/native logs are evidence sources mapped into that schema where practical.

## PRD04-BND-433 — Provider log strings are not stable machine contracts
**Maturity:** `BOUNDARY-LOCK`

Automated project logic must not depend on parsing arbitrary human-readable upstream log text as the primary contract when a typed/status API can exist.

## PRD04-BND-434 — Correlation identity crosses subsystem boundaries
**Maturity:** `BOUNDARY-LOCK`

A consequential command/transaction should be traceable across command → owner → commit/revision → provider tasks → persistence → replication → acknowledgement using one correlation/operation identity or explicit related IDs.

## PRD04-BND-435 — Provider task ID is subordinate to correlation ID
**Maturity:** `BOUNDARY-LOCK`

Godot worker IDs, Zylann task handles, DB request IDs and nav bake IDs may be recorded, but they do not replace the Leyforge correlation identity.

## PRD04-BND-436 — Diagnostics carry WorldSession context
**Maturity:** `BOUNDARY-LOCK`

Relevant records identify at minimum `world_id`, `world_session_id`/epoch and realm/frame where applicable.

## PRD04-BND-437 — Diagnostics carry owner/revision context where consequential
**Maturity:** `BOUNDARY-LOCK`

Stale-result, transaction, provider and persistence events record owner/partition and revision/epoch context needed to explain acceptance/rejection.

## PRD04-BND-438 — Structured events and human logs are separate projections
**Maturity:** `BOUNDARY-LOCK`

A structured diagnostic event may produce readable log text. Human formatting is not the canonical diagnostic data model.

## PRD04-BND-439 — Severity and category are explicit
**Maturity:** `BOUNDARY-LOCK`

Operational events distinguish validation, ownership, stale work, persistence, network, provider, content, security, performance, recovery and invariant-violation categories. Severity is separately represented.

## PRD04-BND-440 — Expected stale work is not automatically an error
**Maturity:** `BOUNDARY-LOCK`

A revision-invalidated/cancelled result can be normal operation. Diagnostics distinguish expected supersession from actual failure.

## PRD04-BND-441 — Invariant violations are higher-severity than provider retries
**Maturity:** `BOUNDARY-LOCK`

Examples include two owners committing the same entity, unknown stable IDs being silently recycled, checkpoint lineage mixing providers, or M0 content executing code.

## PRD04-BND-442 — Queue depth and age are first-class metrics
**Maturity:** `BOUNDARY-LOCK`

Bounded queues expose current depth, oldest-work age, throughput, drop/coalesce/cancel count, and failure/retry count.

## PRD04-BND-443 — Provider readiness lag is measurable by revision
**Maturity:** `BOUNDARY-LOCK`

Diagnostics measure how far providers lag canonical source revisions by scope.

## PRD04-BND-444 — Durability lag is observable
**Maturity:** `BOUNDARY-LOCK`

Persistence exposes distance/time between in-memory committed, journal durable, provider durable and checkpoint published.

## PRD04-BND-445 — Replication lag is observable
**Maturity:** `BOUNDARY-LOCK`

Networking exposes per-peer/scope authoritative revision, acknowledged revision, queued bytes, baseline age, and repair/resnapshot counts.

## PRD04-BND-446 — Simulation fidelity state is observable
**Maturity:** `BOUNDARY-LOCK`

Diagnostics can report which domains/entities/regions operate at which simulation fidelity and why.

## PRD04-BND-447 — Spatial frame/origin mapping is inspectable
**Maturity:** `BOUNDARY-LOCK`

Developer diagnostics expose canonical address ↔ active frame ↔ engine-local transform mappings.

## PRD04-BND-448 — Runtime palette mapping is inspectable
**Maturity:** `BOUNDARY-LOCK`

Developers can resolve semantic voxel key ↔ runtime palette/type for the active WorldSession without treating the numeric handle as canonical.

## PRD04-BND-449 — Content/pack manifest is included in diagnostics
**Maturity:** `BOUNDARY-LOCK`

Support evidence identifies semantic/runtime pack set, versions and hashes required to reproduce content-related failures.

## PRD04-BND-450 — Build identity is included in diagnostics
**Maturity:** `BOUNDARY-LOCK`

Every release/dev executable exposes a stable build identity covering Leyforge, Godot, Zylann, relevant native extensions and target profile.

## PRD04-BND-451 — Release symbol artifacts are tied to build identity
**Maturity:** `BOUNDARY-LOCK`

Private debug-symbol packages are archived against the exact binaries/build manifest they symbolize.

## PRD04-BND-452 — Crash support is provider-aware
**Maturity:** `BOUNDARY-LOCK`

Crash evidence distinguishes frames belonging to Leyforge, Godot, Zylann, native extensions and platform libraries.

## PRD04-BND-453 — Support bundles are bounded and redactable
**Maturity:** `BOUNDARY-LOCK`

Support collection has explicit size limits and redaction rules and does not blindly package whole worlds or unrelated personal data.

## PRD04-BND-454 — Secrets are excluded from diagnostic exports
**Maturity:** `BOUNDARY-LOCK`

Support bundles/logs exclude auth tokens, private signing keys, passwords, reconnect secrets and private server credentials.

## PRD04-BND-455 — Support bundle content is versioned/schema-identified
**Maturity:** `BOUNDARY-LOCK`

Support tooling evolves under explicit bundle/schema version identity.

## PRD04-BND-456 — Server health is independent from gameplay world semantics
**Maturity:** `BOUNDARY-LOCK`

A server may be `DEGRADED` due to persistence/network/provider backlog while canonical world state remains coherent.

## PRD04-BND-457 — Degraded mode is explicit, not silent
**Maturity:** `BOUNDARY-LOCK`

When fidelity is reduced or heavy work paused due to health/performance, diagnostics expose reason and scope.

## PRD04-BND-458 — Provider fallback is observable
**Maturity:** `BOUNDARY-LOCK`

If navigation, rendering, vessel mesh, fluid fidelity or another provider uses fallback behavior, diagnostics expose the active fallback.

## PRD04-BND-459 — Performance budgets are architecture contracts
**Maturity:** `BOUNDARY-LOCK`

CPU, memory, GPU, bandwidth, queue and save-latency budgets are governed requirements/proof targets.

## PRD04-BND-460 — Performance metrics are measured per workload class
**Maturity:** `BOUNDARY-LOCK`

Benchmarks identify workloads such as active settlement, cold teleport, vessel edit, fluid breach, many clients, low-end renderer and autosave under load.

## PRD04-BND-461 — Benchmark environment is recorded
**Maturity:** `BOUNDARY-LOCK`

Performance evidence records hardware, OS, driver, build, renderer, precision, module/GDExtension edition, content/world fixture and settings.

## PRD04-BND-462 — Built-in and external profilers are complementary
**Maturity:** `BOUNDARY-LOCK`

Godot profiling and native/GPU profilers are complementary evidence tools.

## PRD04-BND-463 — Test ownership follows architecture ownership
**Maturity:** `BOUNDARY-LOCK`

Tests are organized around the contract/owner being validated rather than only source-file/class boundaries.

## PRD04-BND-464 — Pure domain tests avoid SceneTree where practical
**Maturity:** `BOUNDARY-LOCK`

Simulation, transaction, registry, migration and save-logic tests run without rendering/scene setup when their contracts do not require it.

## PRD04-BND-465 — Provider adapters have conformance suites
**Maturity:** `BOUNDARY-LOCK`

Each provider implementation passes the same Leyforge-facing contract tests where alternatives exist.

## PRD04-BND-466 — Provider-specific regression tests remain necessary
**Maturity:** `BOUNDARY-LOCK`

Contract tests do not replace provider-specific tests for upstream quirks, engine/module patches, export behavior, precision or renderer differences.

## PRD04-BND-467 — Test fixtures use stable semantic IDs
**Maturity:** `BOUNDARY-LOCK`

Tests avoid accidental coupling to runtime palette order, ObjectID creation order or DB row IDs.

## PRD04-BND-468 — Deterministic fixtures control seeds/time/order where required
**Maturity:** `BOUNDARY-LOCK`

Tests inject fixed seeds, deterministic RNG streams, controlled simulation time and known command ordering where repeatability is part of the contract.

## PRD04-BND-469 — Concurrency tests deliberately vary completion order
**Maturity:** `BOUNDARY-LOCK`

Race/ownership tests inject delays/randomized completion so success does not depend on one lucky scheduler ordering.

## PRD04-BND-470 — Fault injection is a first-class test capability
**Maturity:** `BOUNDARY-LOCK`

Test harnesses can inject failures/delays at DB, voxel save, journal, network ack, nav, collision, content bake and provider shutdown boundaries.

## PRD04-BND-471 — Crash-recovery tests terminate real processes where necessary
**Maturity:** `BOUNDARY-LOCK`

Persistence qualification includes abrupt process termination/power-loss approximation, not only graceful exception paths.

## PRD04-BND-472 — Exported artifacts are test targets
**Maturity:** `BOUNDARY-LOCK`

CI/testing exercises actual client/server exports, not only the Godot editor project.

## PRD04-BND-473 — Headless tests do not substitute for renderer qualification
**Maturity:** `BOUNDARY-LOCK`

Headless lanes validate domain/server behavior. Real renderer/GPU/platform lanes validate graphical execution.

## PRD04-BND-474 — Hardware/render matrix is risk-driven
**Maturity:** `BOUNDARY-LOCK`

Release/nightly lanes derive from claimed support profiles and known risks rather than testing every combination on every commit.

## PRD04-BND-475 — Accessibility tests are part of product qualification
**Maturity:** `BOUNDARY-LOCK`

Automated/manual test plans include focus/navigation, UI scale, assistive metadata, reduced motion, subtitles/captions and semantic fallback cues.

## PRD04-BND-476 — Content packs have independent fixture suites
**Maturity:** `BOUNDARY-LOCK`

Official/critical packs can be validated in bounded fixtures without loading the entire full-world corpus.

## PRD04-BND-477 — Historical-save fixtures are retained
**Maturity:** `BOUNDARY-LOCK`

Migration/compatibility tests include curated older save/checkpoint fixtures.

## PRD04-BND-478 — Corrupt-save fixtures are retained
**Maturity:** `BOUNDARY-LOCK`

Recovery tests include truncated journals, missing provider files, corrupt manifests, partial migrations and missing content packs.

## PRD04-BND-479 — Protocol compatibility fixtures are retained
**Maturity:** `BOUNDARY-LOCK`

Where cross-version compatibility is supported, CI retains old/new protocol fixtures.

## PRD04-BND-480 — CI gates are severity/risk classified
**Maturity:** `BOUNDARY-LOCK`

PR-blocking, integration/export-smoke, nightly hardware/render and scheduled hostile/soak suites remain distinct.

## PRD04-BND-481 — Flaky tests are governed debt, not permanently ignored
**Maturity:** `BOUNDARY-LOCK`

A quarantined flaky test has an owner, reason, tracking debt/issue, review/expiry and repair plan.

## PRD04-BND-482 — Test failure identifies build/content context
**Maturity:** `BOUNDARY-LOCK`

Reports include enough build/profile/pack/provider information to reproduce failure.

## PRD04-BND-483 — CI artifacts include diagnostic evidence
**Maturity:** `BOUNDARY-LOCK`

Failed lanes publish bounded structured logs, reports, metrics, crash traces and relevant manifests.

## PRD04-BND-484 — Build configuration is governed source
**Maturity:** `BOUNDARY-LOCK`

Export presets, build scripts, module/GDExtension configuration and other non-secret build definitions are version-controlled project inputs.

## PRD04-BND-485 — Build secrets remain external to repository
**Maturity:** `BOUNDARY-LOCK`

Signing keys, store credentials and other secrets are injected securely and are not committed.

## PRD04-BND-486 — Every release artifact has a build manifest
**Maturity:** `BOUNDARY-LOCK`

Client/server/tool artifacts record exact Leyforge source, Godot, Zylann, precision, renderer/target, native dependencies, content manifest and relevant toolchain versions.

## PRD04-BND-487 — Build variants are explicit
**Maturity:** `BOUNDARY-LOCK`

Client/server/Forge, debug/profile/release, Module/GDExtension, precision, platform and renderer are named build dimensions rather than hidden compiler switches.

## PRD04-BND-488 — Unsupported build combinations fail early
**Maturity:** `BOUNDARY-LOCK`

Known-incompatible variant combinations are rejected by build validation.

## PRD04-BND-489 — Reference/control build is explicit during proof phase
**Maturity:** `BOUNDARY-LOCK`

PRD-07 comparisons identify one reference/control build—currently likely Godot 4.7.2 + Zylann 1.7 Module—against which alternatives are measured.

## PRD04-BND-490 — Build reproducibility is sufficient to identify exact inputs
**Maturity:** `BOUNDARY-LOCK`

Bit-for-bit binaries are not mandatory unless later justified, but artifacts remain attributable to exact governed inputs.

## PRD04-BND-491 — Dependency inventory is authoritative engineering metadata
**Maturity:** `BOUNDARY-LOCK`

Third-party runtime/editor/native dependencies record name, version/commit, source, license, purpose, platform/build form, trust/security class, update policy, patches and exit path.

## PRD04-BND-492 — Dependency presence does not grant architecture authority
**Maturity:** `BOUNDARY-LOCK`

A library remains an implementation provider behind its documented boundary.

## PRD04-BND-493 — Dependencies are pinned for controlled builds
**Maturity:** `BOUNDARY-LOCK`

Production/CI builds use governed versions/commits rather than floating latest dependencies.

## PRD04-BND-494 — Dependency update is an engineering change
**Maturity:** `BOUNDARY-LOCK`

Changing Godot, Zylann, DB wrapper, test framework or other relevant dependencies invokes controlled review/testing.

## PRD04-BND-495 — Dependency compatibility is fixture-tested
**Maturity:** `BOUNDARY-LOCK`

Generic compatibility claims do not certify Leyforge's exact Godot version, edition, headless target, precision, platform and workload.

## PRD04-BND-496 — Licenses are reviewed before dependency admission
**Maturity:** `BOUNDARY-LOCK`

Dependency governance records license compatibility/distribution obligations before required adoption.

## PRD04-BND-497 — Security advisories/upstream status are monitored
**Maturity:** `BOUNDARY-LOCK`

Long-lived critical dependencies have a process for security advisories, abandonment and incompatible releases.

## PRD04-BND-498 — Transitive native dependencies are recorded where consequential
**Maturity:** `BOUNDARY-LOCK`

Native runtime supply-chain components relevant to packaging/security/debugging do not remain invisible.

## PRD04-BND-499 — Patches are explicit and reproducible
**Maturity:** `BOUNDARY-LOCK`

Local changes to Godot/Zylann/third-party code are tracked, documented, test-covered, reproducibly applicable and tied to upstream version.

## PRD04-BND-500 — Fork threshold remains evidence-triggered
**Maturity:** `BOUNDARY-LOCK`

A maintained fork is justified only when required capabilities cannot be safely delivered through adapters/upstream contributions/patches at acceptable maintenance cost.

## PRD04-BND-501 — Forked behavior requires regression tests
**Maturity:** `BOUNDARY-LOCK`

Every maintained engine/provider patch affecting requirements carries corresponding tests/proof evidence.

## PRD04-BND-502 — Upstream contribution is preferred where practical
**Maturity:** `CANDIDATE`

Generic fixes should be upstreamed where practical and compatible with schedule/requirements.

## PRD04-BND-503 — Architecture dependency direction is explicit
**Maturity:** `BOUNDARY-LOCK`

High-level domains depend on Leyforge contracts/facades, not arbitrary provider internals.

## PRD04-BND-504 — Circular ownership dependencies are forbidden
**Maturity:** `BOUNDARY-LOCK`

Subsystems may exchange commands/events but may not each require direct mutable ownership of the other's state.

## PRD04-BND-505 — Interface owner is identifiable
**Maturity:** `BOUNDARY-LOCK`

Every significant cross-system interface has one authority responsible for semantic contract, versioning, invariants and compatibility expectations.

## PRD04-BND-506 — Adapter owns provider translation, not domain rules
**Maturity:** `BOUNDARY-LOCK`

An adapter maps data/calls/results and does not silently own unrelated gameplay policy.

## PRD04-BND-507 — Domain service does not expose mutable internals across boundary
**Maturity:** `BOUNDARY-LOCK`

Consumers use commands, queries, read models and contracts instead of unrestricted mutable container references.

## PRD04-BND-508 — Shared utility code cannot become hidden global authority
**Maturity:** `BOUNDARY-LOCK`

Common libraries provide algorithms/types but canonical ownership remains in explicit domain services.

## PRD04-BND-509 — Global singletons are reserved for true process/session services
**Maturity:** `BOUNDARY-LOCK`

Convenience singletons do not bypass world/session ownership boundaries.

## PRD04-BND-510 — WorldSession is a composition root, not one giant god object
**Maturity:** `BOUNDARY-LOCK`

WorldSession assembles service lifetimes/routing but does not absorb every subsystem implementation.

## PRD04-BND-511 — Architecture conformance can be partly automated
**Maturity:** `CANDIDATE`

Static checks/lints/tests may enforce forbidden provider imports, runtime IDs in persistence, pack manifests, dependency direction and protocol registration.

## PRD04-BND-512 — Runtime invariant assertions are allowed in debug/profile builds
**Maturity:** `BOUNDARY-LOCK`

Debug/profile builds may assert owner mismatch, stale revision publication, wrong session epoch, unknown palette mapping, invalid checkpoint lineage and M0 executable content.

## PRD04-BND-513 — Release validation remains graceful where possible
**Maturity:** `BOUNDARY-LOCK`

Production builds reject/quarantine/recover from invalid external/content/network state where feasible rather than relying on debug-style crashes.

## PRD04-BND-514 — Whole-stack transaction trace has one canonical commit point
**Maturity:** `BOUNDARY-LOCK`

For consequential transactions, diagnostics distinguish received, validated, committed, journal durable, provider ready, replicated, acknowledged and checkpoint durable.

## PRD04-BND-515 — Post-commit provider failures remain correlated to source transaction
**Maturity:** `BOUNDARY-LOCK`

Failed nav/collision/save/network projections remain traceable to the committed source revision/operation.

## PRD04-BND-516 — Compensating transactions are new transactions
**Maturity:** `BOUNDARY-LOCK`

A compensation/reversal has its own operation/revision identity and does not erase evidence of the original commit.

## PRD04-BND-517 — No hidden cross-layer side effects
**Maturity:** `BOUNDARY-LOCK`

Provider adapters do not trigger unrelated persistence/network/gameplay mutations as undocumented side effects.

## PRD04-BND-518 — Whole-stack interface list is controlled architecture metadata
**Maturity:** `BOUNDARY-LOCK`

The project maintains an authoritative inventory/map of major interfaces/facades and owners as implementation matures.

## PRD04-BND-519 — ADRs lock implementation choices after evidence, not before
**Maturity:** `BOUNDARY-LOCK`

PRD-07/08 evidence selects implementation choices such as Module vs GDExtension, precision strategy, DB adapter, vessel collision method, protocol codec and test framework.

## PRD04-BND-520 — Architecture exceptions require governed waivers
**Maturity:** `BOUNDARY-LOCK`

Intentional direct-provider coupling or other boundary violation requires a documented waiver rather than becoming silent precedent.

## PRD04-BND-521 — Proof IDs remain stable across PRD-05/06/07 handoff
**Maturity:** `BOUNDARY-LOCK`

PRD04 proof obligations keep stable IDs for evidence/risk/prototype cross-reference.

## PRD04-BND-522 — Boundary IDs remain stable architecture references
**Maturity:** `BOUNDARY-LOCK`

Mature boundary IDs are amended/deprecated rather than silently renumbered.

## PRD04-BND-523 — Risk register entries map to proofs/controls
**Maturity:** `BOUNDARY-LOCK`

PRD-06 maps each consequential unresolved architecture risk to proof, design control, accepted limitation or explicit deferral.

## PRD04-BND-524 — PRD-05 crosswalk distinguishes fact from architecture decision
**Maturity:** `BOUNDARY-LOCK`

Research evidence preserves technology fact, architecture boundary, candidate implementation, proof result and ADR decision as distinct classes.

## PRD04-BND-525 — Prototype success does not automatically production-qualify architecture
**Maturity:** `BOUNDARY-LOCK`

P3 proves feasibility in the tested fixture; P4/P5 remain required where hostile/performance/production qualification matters.

## PRD04-BND-526 — Prototype failure targets the implementation hypothesis first
**Maturity:** `BOUNDARY-LOCK`

A failed implementation does not automatically invalidate the canonical requirement or top-level architecture boundary.

## PRD04-BND-527 — Proof evidence records exact environment
**Maturity:** `BOUNDARY-LOCK`

PRD-07/08 results identify exact build/content/hardware/provider inputs.

## PRD04-BND-528 — Architecture status is visible as locked/candidate/deferred
**Maturity:** `BOUNDARY-LOCK`

Implementation planning must not treat `CANDIDATE` boundaries as already production-proven.

## PRD04-BND-529 — Architecture debt is explicit
**Maturity:** `BOUNDARY-LOCK`

Missing validators, temporary adapters, unproven fallbacks and boundary exceptions are recorded as governance/architecture debt.

## PRD04-BND-530 — Production implementation preserves observability hooks
**Maturity:** `BOUNDARY-LOCK`

Optimization/refactoring must preserve equivalent ownership/revision/task/provider-health visibility required for debugging and proof.

---

# 134. Whole-Stack Transaction Trace — Working Model

Example: player removes a vessel hull block.

```text
CLIENT COMMAND OP-9102
        ↓
protocol decode / bounded schema
        ↓
Vessel owner validates
        ↓
CANONICAL COMMIT H82
        │
        ├── Journal correlation OP-9102
        ├── SpatialChangeSet H82
        │      ├── mesh task M551
        │      ├── collision task C218
        │      ├── fluid topology F992
        │      ├── mass recompute P113
        │      └── nav dirty N300
        ├── network replication / peer ack
        └── SaveCoordinator
               └── checkpoint C701 includes OP-9102
```

Diagnostics can answer:

```text
Who owned the edit?      Vessel 17 owner
What committed?          OP-9102 / H82
Did collision update?    yes, C218 → H82 READY
Did flooding update?     yes, F992 → H82 READY
Was it replicated?       peers 2/3 ack; peer 3 repaired
Was it durable?          journal yes; checkpoint C701
Which build?             build manifest XYZ
```

---

# 135. Diagnostic Record — Candidate

```text
event_id
timestamp
severity
category
build_id
world_id
world_session_id
realm_id?
spatial_frame_id?
correlation_id
operation_id?
owner_id?
partition_id?
source_revision?
provider
provider_task_id?
queue_name?
queue_depth?
result
reason_code
bounded_context
```

Exact schema remains implementation work.

---

# 136. Core Metric Families

```text
Leyforge/Session/*
Leyforge/Simulation/*
Leyforge/Voxel/*
Leyforge/Physics/*
Leyforge/Navigation/*
Leyforge/Fluid/*
Leyforge/Vessel/*
Leyforge/Save/*
Leyforge/Database/*
Leyforge/Network/*
Leyforge/Forge/*
Leyforge/Content/*
Leyforge/Projection/*
Leyforge/Security/*
```

Provider-specific raw metrics may exist underneath.

---

# 137. Support Bundle — Candidate Contents

Bounded evidence may include:

```text
build manifest
Godot/Zylann/dependency versions
renderer/precision/edition
OS/hardware summary
content-pack manifest
world/checkpoint/schema IDs
recent structured logs
queue/health summary
performance snapshot
provider readiness summary
recent crash trace
selected settings/profile
```

Excluded/redacted by default:

```text
tokens/passwords/private keys
private account secrets
arbitrary full world files
unrelated personal files
```

---

# 138. Test Layer Model

```text
L0 — STATIC / SCHEMA
L1 — UNIT / PURE DOMAIN
L2 — CONTRACT
L3 — PROVIDER INTEGRATION
L4 — HEADLESS WORLD INTEGRATION
L5 — EXPORTED ARTIFACT
L6 — HARDWARE / RENDERER
L7 — HOSTILE / SOAK / CHAOS
```

---

# 139. Build Matrix — Working Dimensions

```text
Godot:
  4.7.2 reference baseline

Zylann:
  Module reference/control
  GDExtension candidate

Precision:
  standard
  double candidate

Role:
  client
  dedicated server
  Forge/tool

Configuration:
  debug
  profile
  release

Renderer:
  Forward+
  Mobile
  Compatibility where claimed

Platform:
  Windows
  Linux
  macOS where supported/tested
  later targets as qualified
```

PRD-07 selects a minimal high-value matrix rather than multiplying every dimension blindly.

---

# 140. Dependency Direction — Working Rule

```text
CANON / DOMAIN
      ↓
LEYFORGE CONTRACTS
      ↓
ADAPTERS / FACADES
      ↓
Godot / Zylann / DB / platform
```

---

# 141. Architecture Conformance Checks — Candidate

Potential automated checks:

- persistent schemas reject RID/ObjectID/NodePath/runtime palette fields;
- only approved adapter modules import provider-specific APIs;
- public protocol messages use stable IDs;
- M0 packs reject executable entries;
- world-save manifests require pack/schema/checkpoint identity;
- build artifacts emit build manifests;
- dependency inventory includes version/license/source;
- known boundary exceptions carry waiver IDs.

Exact enforcement belongs ENG-GOV/B-OPS implementation.

---

# 142. Failure Classification

```text
EXPECTED_SUPERSESSION
VALIDATION_REJECTION
RETRYABLE_PROVIDER_FAILURE
DEGRADED_PROVIDER
CONTENT_INCOMPATIBILITY
RECOVERY_REQUIRED
SECURITY_REJECTION
PERFORMANCE_BUDGET_BREACH
ARCHITECTURE_INVARIANT_FAILURE
FATAL_PROCESS_FAILURE
```

---

# 143. Round-7 Master Ownership Matrix

| Concern | Canonical owner | Provider/tool | Key rule |
|---|---|---|---|
| diagnostic schema | Leyforge observability | Godot/log adapters | stable categories |
| transaction correlation | domain/WorldSession | provider IDs attached | cross-stack |
| queue metrics | owning service | provider metrics | bounded/age visible |
| crash symbol mapping | build/release pipeline | compiler/platform tools | exact build ID |
| support bundle | Leyforge support tooling | provider evidence | bounded/redacted |
| performance budget | ENG-GOV/architecture | profiler/benchmarks | workload-specific |
| pure-domain tests | domain owner | test framework | no SceneTree unless needed |
| provider conformance | facade/interface owner | provider adapters | same contract |
| export testing | build/CI authority | Godot CLI/export | real artifacts |
| renderer qualification | presentation/runtime | real hardware | support-claim driven |
| dependency inventory | ENG-GOV | package/source tooling | pinned/governed |
| local patches/forks | dependency authority | Git/upstream | explicit/tested |
| architecture interfaces | PRD-04/LFE later | module boundaries | one owner |
| ADR decisions | ENG-GOV/ADR | PRD-08 evidence | after proof |
| proof IDs | PRD-04 | PRD-05/06/07/08 | stable crosswalk |

---

# 144. Round-7 Risk Register

| ID | Risk | Severity | Response |
|---|---|---:|---|
| `PRD04-R07-01` | logs lack transaction correlation | RED | stable correlation IDs |
| `PRD04-R07-02` | provider task IDs mistaken for domain operation IDs | RED | identity hierarchy |
| `PRD04-R07-03` | stale work floods error logs | AMBER | supersession category |
| `PRD04-R07-04` | queue age invisible | RED | depth + age + throughput |
| `PRD04-R07-05` | save lag invisible until crash | RED | durability-lag metrics |
| `PRD04-R07-06` | replication lag invisible | RED | ack/baseline/queue metrics |
| `PRD04-R07-07` | support bundle leaks secrets | CRITICAL | allowlist/redaction |
| `PRD04-R07-08` | no matching crash symbols | RED | exact-build archive |
| `PRD04-R07-09` | degraded mode silently changes fidelity | RED | health/fallback metrics |
| `PRD04-R07-10` | benchmark lacks environment context | RED | environment manifest |
| `PRD04-R07-11` | tests only implementation internals | RED | contract layers |
| `PRD04-R07-12` | tests rely on lucky worker order | RED | randomized order |
| `PRD04-R07-13` | graceful tests replace real crash tests | RED | process kill fixtures |
| `PRD04-R07-14` | editor tests replace exported artifact | RED | export lanes |
| `PRD04-R07-15` | headless claims graphics qualification | RED | hardware lanes |
| `PRD04-R07-16` | flaky tests ignored indefinitely | AMBER/RED | governed debt |
| `PRD04-R07-17` | build flags hidden/untracked | RED | build manifest |
| `PRD04-R07-18` | release inputs cannot be reconstructed | RED | exact manifest |
| `PRD04-R07-19` | dependency floats to latest | RED | pinning |
| `PRD04-R07-20` | plugin accepted without exact fixture | RED | compatibility matrix |
| `PRD04-R07-21` | license discovered late | RED | pre-admission review |
| `PRD04-R07-22` | local patch exists only on one machine | CRITICAL | reproducible tracking |
| `PRD04-R07-23` | fork expands silently | RED | threshold/register |
| `PRD04-R07-24` | provider internals spread into gameplay | RED | dependency direction |
| `PRD04-R07-25` | adapter hides gameplay policy | RED | interface-owner review |
| `PRD04-R07-26` | WorldSession becomes god object | RED | composition-root boundary |
| `PRD04-R07-27` | debug invariant becomes user crash | RED | release recovery |
| `PRD04-R07-28` | compensation erases original evidence | RED | new operation |
| `PRD04-R07-29` | proof IDs renumber downstream | RED | stable IDs |
| `PRD04-R07-30` | P3 success treated as production-ready | RED | proof ladder |
| `PRD04-R07-31` | prototype failure deletes requirement | RED | classify hypothesis |
| `PRD04-R07-32` | candidate treated as locked implementation | RED | visible status |
| `PRD04-R07-33` | exception becomes precedent | RED | waiver |
| `PRD04-R07-34` | optimization removes observability | RED | observability contract |

---

# 145. Round-7 Proof Obligations

## PRD04-PROOF-63 — End-to-End Transaction Trace
Execute one complex construction/vessel edit and verify one correlation trail covers command, owner, revision, provider tasks, journal, checkpoint, replication and acknowledgement.

## PRD04-PROOF-64 — Stale Work Diagnostic Classification
Generate thousands of superseded tasks plus real failures and verify expected stale/cancelled work remains distinguishable from genuine errors.

## PRD04-PROOF-65 — Support Bundle Redaction
Populate credentials/private data, generate a support bundle and verify required diagnostics remain while secrets are absent.

## PRD04-PROOF-66 — Release Crash Symbolication
Crash a release-like client/server/native build and resolve stack traces using archived exact-build symbols.

## PRD04-PROOF-67 — Provider Conformance Matrix
Run the same facade contract fixture through Zylann Module, GDExtension candidate and other applicable provider alternatives.

## PRD04-PROOF-68 — Worker-Order Chaos
Randomize worker/provider completion ordering across repeated runs; authority invariants must not depend on scheduler luck.

## PRD04-PROOF-69 — Real Process Crash Recovery
Kill real server/client processes during journal/DB/voxel/checkpoint stages and validate recovery contracts.

## PRD04-PROOF-70 — Exported Artifact Matrix
Build and smoke-test actual client/server/Forge artifacts and verify manifests/resource-role differences.

## PRD04-PROOF-71 — Renderer / Hardware Lane
Run representative official content on claimed renderer/hardware profiles and capture performance + semantic-presentation evidence.

## PRD04-PROOF-72 — Dependency Upgrade Fixture
Upgrade one critical dependency in isolation and run compatibility/conformance/export/save fixtures.

## PRD04-PROOF-73 — Local Patch Reproducibility
Apply a test Godot/Zylann patch from clean checkout, build/test it and identify it from the build manifest.

## PRD04-PROOF-74 — Architecture Dependency Lint
Introduce forbidden direct provider/domain dependencies and verify available conformance tooling catches them.

## PRD04-PROOF-75 — Observability Overhead
Measure logs/metrics/correlation hooks under hostile load; production observability must remain bounded.

## PRD04-PROOF-76 — Whole-Stack Hostile Transaction Soak
Run long combined worldgen, construction, vessel, fluid, NPC, network, save, reconnect, content and frame-change workloads while validating ownership, revisions, queues, checkpoint lineage, client repair and stale-task containment.

---

# 146. Round-7 New Architecture Unknowns

1. Exact structured diagnostic serialization format?
2. Text logs plus JSON events, binary events, or another model?
3. Which fields are mandatory on every diagnostic event?
4. Which records are sampled versus always retained?
5. How much release logging is acceptable?
6. What are local/server log-retention policies?
7. Should server structured logs emit to stdout, files, journald, or multiple sinks?
8. Is a metrics HTTP endpoint required?
9. Should a Prometheus-style adapter exist?
10. Which metrics stay enabled in release?
11. Which provider queue metrics can Zylann expose?
12. Is custom instrumentation inside Zylann integration required?
13. How are NavigationServer dirty/bake metrics captured?
14. How are Jolt/physics spikes attributed?
15. How is DB latency broken down?
16. Which health thresholds trigger degraded mode?
17. Which thresholds automatically reduce fidelity?
18. How is health exposed to remote admin/service plane?
19. Is crash-report uploading in scope?
20. What privacy/consent applies to uploaded diagnostics?
21. Which crash service/library, if any, is worthwhile?
22. How are symbols stored and for how long?
23. How are exact symbols tied to CI build IDs?
24. Is support-bundle generation available in the main menu?
25. What support evidence can dedicated servers export?
26. How are large logs truncated while preserving causal context?
27. What exact correlation-ID format is used?
28. Do operation IDs double as correlation IDs?
29. Should traces model parent/child spans?
30. Is OpenTelemetry-like semantics useful or unnecessary?
31. Which native/GPU profilers become standard dev workflow?
32. How does benchmark harness control VSync/resolution/time?
33. What percentile metrics are recorded?
34. What performance regression thresholds block CI?
35. What low-end reference machines define minimum targets?
36. What server hardware profiles define player-count targets?
37. Which tests are PR-blocking/nightly/weekly?
38. Maximum acceptable PR CI time?
39. How are large fixture assets cached?
40. How are deterministic test worlds created?
41. How are isolated `user://` paths assigned?
42. Can headless tests run in parallel safely?
43. Which project test framework wins?
44. How are native doctest and project tests unified?
45. How are JUnit/results unified?
46. What chaos/fault-injection API is provided?
47. How are network loss/reorder/latency simulated?
48. How are disk-full/permission errors simulated?
49. How are corrupted content packs generated?
50. How many historical save versions remain mandatory?
51. How are PRD-08 proof artifacts stored/indexed?
52. Does Project Brain link proof results directly to boundary/proof IDs?
53. Which architecture rules can static lint enforce?
54. What module/package dependency tool is used?
55. How are direct Zylann imports restricted?
56. Which interfaces are public Leyforge architecture APIs?
57. When is an interface change an ADR?
58. Which boundaries need dedicated contract-test packages?
59. How are WorldSession services composed/accessed safely?
60. Which process singletons are legitimate?
61. How are editor/Forge services isolated from runtime services?
62. How are server-only modules excluded from clients?
63. How are client-only modules excluded from server?
64. Exact build-manifest format?
65. Is an SBOM generated?
66. What vulnerability scanning is integrated?
67. What license report is generated?
68. How are Godot export templates/build commits pinned?
69. How is Zylann pinned/vendor-managed?
70. Vendor/submodule/package-download strategy?
71. How are custom Godot builds distributed to developers?
72. How are Module/GDExtension control builds kept comparable?
73. How is double-precision variant built/tested?
74. Which build combinations are unsupported?
75. What is the first production reference build matrix?
76. How is an upstream engine/provider upgrade handled as a controlled delta?
77. When does a patch set become a fork?
78. How are patches rebased/tested?
79. How are abandoned dependencies replaced?
80. Does SQLite wrapper remain external or become a thin Leyforge binding?
81. How are plugin/tool versions exposed in bake provenance?
82. Which diagnostics are part of save compatibility?
83. Which Round-7 boundaries become LFE/ENG-GOV implementation rules?
84. Which proof obligations are prerequisites to final PRD-04 closure versus downstream execution?

---

# 147. Round-7 Architecture Diagram

```text
                        LEYFORGE AUTHORITY
                         command / commit
                                │
                                ▼
                        Correlation Context
                                │
          ┌─────────────────────┼─────────────────────┐
          │                     │                     │
      Providers             Persistence            Network
   voxel/nav/physics       journal/checkpoint     snapshot/delta
          │                     │                     │
          └─────────────────────┼─────────────────────┘
                                │
                                ▼
                        DIAGNOSTIC SCHEMA
             owner / revision / task / health / build
                                │
                   ┌────────────┼────────────┐
                   │            │            │
                 Logs        Metrics      Support/Crash
                   │            │            │
                   └────────────┼────────────┘
                                │
                                ▼
                          TEST / CI / PROOF
                                │
                                ▼
                         ADR / GOVERNANCE
```

---

# 148. Round-7 Locked Invariants

Round 7 locks:

1. Diagnostics are first-class architecture consumers.
2. Leyforge owns stable diagnostic categories/fields.
3. Provider log text is not a machine contract.
4. Consequential transactions have cross-stack correlation identity.
5. WorldSession/owner/revision context is observable.
6. Queue depth, age, throughput and coalescing are measurable.
7. Provider readiness lag is measurable by revision.
8. Durability and replication lag are observable.
9. Simulation fidelity and spatial frame mappings are inspectable.
10. Build/content/dependency identity is included in diagnostics.
11. Release symbols are archived against exact builds.
12. Support bundles are bounded and redact secrets.
13. Degraded/fallback states are explicit.
14. Performance budgets are governed proof targets.
15. Benchmark environment is recorded.
16. Test ownership follows architecture ownership.
17. Pure domain tests avoid SceneTree where practical.
18. Provider adapters have contract/conformance suites.
19. Concurrency tests vary completion ordering.
20. Fault/crash injection is first-class.
21. Actual exported artifacts are tested.
22. Headless tests do not replace GPU/render qualification.
23. Historical/corrupt save fixtures are retained.
24. CI gates are risk/severity layered.
25. Flaky-test quarantine is governed debt.
26. Build configuration is governed source; secrets are external.
27. Release artifacts carry exact build manifests.
28. Build variants are explicit.
29. Dependencies are inventoried, pinned and controlled.
30. Dependency upgrades are engineering changes.
31. Exact compatibility is fixture-tested.
32. Licenses/security/upstream status are governed.
33. Local patches/forks are explicit and regression-tested.
34. Architecture dependency direction is explicit.
35. Circular mutable ownership is forbidden.
36. Cross-system interfaces have identifiable owners.
37. Adapters translate providers; they do not own hidden gameplay law.
38. WorldSession is a composition root, not a god object.
39. Architecture conformance is partly automatable.
40. Whole-stack transaction stages remain distinguishable.
41. Compensating actions are new transactions.
42. Hidden cross-layer side effects are forbidden.
43. Boundary/proof IDs remain stable downstream references.
44. ADRs select implementations after evidence.
45. Exceptions require waivers.
46. PRD-05/06/07 preserve fact/boundary/candidate/proof distinctions.
47. P3 prototype success is not automatic production qualification.
48. Prototype failure targets implementation hypothesis before requirement.
49. Architecture debt remains explicit.
50. Production optimization preserves equivalent observability.

---

# 149. Round-7 Gate Result

**PASS — CONTINUE PRD-04**

The operational/testing/build/dependency architecture is sufficiently clear to perform final reconciliation.

Round 7 does not select:

- exact logging/metrics serialization;
- tracing framework;
- crash-report service;
- final project test framework;
- exact CI provider;
- exact dependency packaging mechanism;
- exact architecture-lint tooling;
- exact performance thresholds/hardware matrix.

It locks the deeper architecture:

> **Every consequential Leyforge transaction must remain explainable across ownership, revision, provider execution, persistence, replication, build identity and failure state. Tests and CI validate Leyforge contracts and exact provider/build combinations. Dependencies and exceptions remain governed implementation choices rather than hidden architecture.**

---

# 150. Updated PRD-04 Round Sequence

1. **Round 1 — Top-level ownership, authority classes and anti-leakage rules** — **COMPLETE**
2. **Round 2 — Canonical coordinates, WorldSession, spatial frames and SceneTree projection lifecycle** — **COMPLETE**
3. **Round 3 — Simulation partitions, workers, owners, revisions, task/lifetime and commit topology** — **COMPLETE**
4. **Round 4 — Voxel, physics, movement, navigation, fluids and vessel integration facades** — **COMPLETE**
5. **Round 5 — Network protocol, interest management, save coordinator, database and reconnect boundaries** — **COMPLETE**
6. **Round 6 — Forge source/bake/runtime pipeline, content packs, mod trust and settings/presentation boundaries** — **COMPLETE**
7. **Round 7 — Diagnostics, tests, build/dependency boundaries and whole-stack transaction/interface reconciliation** — **COMPLETE**
8. **Round 8 — Final architecture map, conditional decisions, proof handoff and PRD-04 closure candidate** — **NEXT**

---

# 151. Immediate Next Action

Proceed to:

> **PRD-04 Round 8 — Final architecture map, conditional decisions, proof handoff and PRD-04 closure candidate.**

Round 8 must reconcile all seven prior rounds, classify major areas as locked/candidate/deferred, consolidate proofs into manageable programmes, route unresolved implementation choices to PRD-06/07/08, verify the final Godot ↔ Leyforge ↔ Zylann ↔ Forge ↔ support boundary and produce the PRD-04 closure-candidate verdict.

---

**ROUND-7 RESULT: DIAGNOSTICS / TEST / BUILD / DEPENDENCY / WHOLE-STACK INTERFACE-RECONCILIATION ARCHITECTURE COMPLETE.**



---

# 152. Round-8 Purpose

Round 8 closes the PRD-04 discovery phase.

It does **not** choose unproven technologies or claim production readiness.

It answers five final questions:

1. **Does every major Leyforge technical responsibility have one clear semantic/authoritative owner?**
2. **Do Godot, Zylann, The Forge and supporting technologies remain subordinate providers rather than accidental sources of canon?**
3. **Are runtime, persistence, networking, simulation and content-production boundaries mutually consistent?**
4. **Are all remaining implementation uncertainties explicitly classified and routed to PRD-05/06/07/08?**
5. **Can implementation planning proceed later without reopening architecture ownership from scratch?**

Round-8 verdict:

> **YES — subject to the proof and risk programmes defined below.**

---

# 153. Final Reconciliation Method

The seven completed rounds were reconciled against the following failure classes:

```text
AUTHORITY DUPLICATION
Two systems claim canonical ownership of the same state.

AUTHORITY INVERSION
A provider/runtime handle becomes semantic truth.

LIFETIME INVERSION
Node/task/peer/provider lifetime becomes world/entity lifetime.

TRANSACTION SPLIT
Persistence/network/provider state can disagree with canonical commit.

COORDINATE SPLIT
Different subsystems silently use incompatible definitions of position/frame.

PARTITION COLLAPSE
Voxel/nav/sim/network/save partitions are incorrectly assumed identical.

TRUST COLLAPSE
Data content and executable code share the same security tier.

SETTINGS COLLAPSE
Graphics/local settings silently alter authoritative multiplayer/world semantics.

OBSERVABILITY GAP
A consequential state transition cannot be traced or reconstructed.

PROOF LEAKAGE
A candidate implementation is treated as locked before evidence.
```

**Result: no unresolved architecture contradiction was found that blocks closure-candidate status.**

---

# 154. Round-8 Final Boundary Register

## PRD04-BND-531 — One semantic authority hierarchy governs the whole stack

**Maturity:** `BOUNDARY-LOCK`

The final authority hierarchy is:

```text
A0 Canonical Semantic Authority
        ↓
A1 Authoritative Domain State
        ↓
A2 Provider / Execution State
        ↓
A3 Presentation / Projection
        ↓
A4 Ephemeral Runtime Handles
```

No lower class may silently redefine a higher class.

---

## PRD04-BND-532 — Leyforge owns semantic meaning and authoritative world truth

**Maturity:** `BOUNDARY-LOCK`

Leyforge owns:

- stable semantic identity;
- authoritative world/domain state;
- canonical coordinates/frames;
- simulation law;
- transaction semantics;
- world protocol;
- checkpoint authority;
- content trust;
- settings scope;
- Forge/source governance.

---

## PRD04-BND-533 — Godot remains the primary engine/runtime provider

**Maturity:** `BOUNDARY-LOCK`

Godot supplies runtime/platform/scene/render/input/audio/physics/navigation/network/thread/resource/export/profiling services.

Godot does not own Leyforge semantic identity or whole-world authority.

---

## PRD04-BND-534 — Zylann remains the specialised voxel substrate

**Maturity:** `BOUNDARY-LOCK`

Zylann supplies voxel buffers, streaming, meshing, local generation execution, voxel queries and related spatial execution.

Zylann does not own world semantics, simulation, protocol, checkpoint authority, vessels, fluids or regional navigation.

---

## PRD04-BND-535 — The Forge remains the governed content-authoring environment

**Maturity:** `BOUNDARY-LOCK`

The Forge owns visual/source authoring, validation, bake/build workflow and pack assembly.

Runtime artifacts remain compiled products.

---

## PRD04-BND-536 — Art Production Handoff is a required downstream production authority

**Maturity:** `BOUNDARY-LOCK`

Canonical semantic/visual definition alone does not make an asset production-ready.

Final asset production requires the appropriate Art Production Handoff contract.

---

## PRD04-BND-537 — WorldDefinition and WorldSession remain separate

**Maturity:** `BOUNDARY-LOCK`

Persistent world identity survives runtime close/reopen/server restart.

Runtime session epochs/handles do not.

---

## PRD04-BND-538 — Canonical coordinates remain provider-independent

**Maturity:** `BOUNDARY-LOCK`

Canonical realm/frame/address semantics do not depend on Godot global transforms, Zylann chunk numbering or selected precision mode.

---

## PRD04-BND-539 — Hierarchical/local-frame large-world architecture is the preferred proof direction

**Maturity:** `CANDIDATE`

The default hypothesis is hierarchical canonical addressing plus bounded active frames.

Final precision widths, cell sizes and rebase strategy remain PRD-07 evidence decisions.

---

## PRD04-BND-540 — Mutable authoritative state remains owner-committed

**Maturity:** `BOUNDARY-LOCK`

Workers/providers compute proposals/evidence against versioned state.

Only the defined owner/transaction authority commits canonical mutation.

---

## PRD04-BND-541 — Simulation scale is achieved through partitioning and fidelity, not permanent Nodes

**Maturity:** `BOUNDARY-LOCK`

Large civilisation/ecology/economy simulation may use aggregate/distant representations without active SceneTree objects while preserving identity and conserved state.

---

## PRD04-BND-542 — Spatial providers consume canonical consequences

**Maturity:** `BOUNDARY-LOCK`

`SpatialChangeSet` or equivalent remains the preferred consequence/invalidation spine for committed spatial changes.

Providers do not independently infer canon from mesh/collider/path state.

---

## PRD04-BND-543 — Physics, navigation and fluids remain provider/domain collaborations

**Maturity:** `BOUNDARY-LOCK`

Physics supplies evidence/execution.

Navigation supplies route proposals/provider state.

Fluid gameplay state remains Leyforge-owned.

None becomes universal game-law authority.

---

## PRD04-BND-544 — Vessel architecture remains frame-local and domain-owned

**Maturity:** `BOUNDARY-LOCK`

Vessels remain stable domain entities with vessel-local hull/component state and derived mesh/collision/mass/fluid/navigation projections.

---

## PRD04-BND-545 — Zylann finite-mesh reuse for vessels remains a candidate, not a lock

**Maturity:** `CANDIDATE`

Reusing Zylann `VoxelBuffer`/block meshing for finite moving vessel geometry remains preferred evidence direction.

Production use requires hostile performance/physics qualification.

---

## PRD04-BND-546 — Networking and persistence remain projections of one committed authority

**Maturity:** `BOUNDARY-LOCK`

Protocol replication and checkpoint persistence consume the same canonical transaction/revision history.

Neither packet order nor storage-provider write timing changes canonical order.

---

## PRD04-BND-547 — SaveCoordinator remains whole-world durability authority

**Maturity:** `BOUNDARY-LOCK`

Voxel store, structured DB and file/blob stores participate beneath the SaveCoordinator/checkpoint contract.

---

## PRD04-BND-548 — Leyforge protocol remains independent from transport implementation

**Maturity:** `BOUNDARY-LOCK`

ENet/Godot are leading transport/runtime candidates.

Durable gameplay messages remain Leyforge-owned/versioned/bounded.

---

## PRD04-BND-549 — Reconnect remains stable-identity and revision based

**Maturity:** `BOUNDARY-LOCK`

Reconnect repairs client projections against stable world/player/character identity and acknowledged authoritative revision/operation boundaries.

---

## PRD04-BND-550 — Interest management remains cross-domain and Leyforge-owned

**Maturity:** `BOUNDARY-LOCK`

Voxel streaming, entity replication, remote management, vessel membership and other relevance scopes consume one governed interest architecture without collapsing into one identical radius.

---

## PRD04-BND-551 — Content pack identity/trust/dependency remains explicit

**Maturity:** `BOUNDARY-LOCK`

Pack manifests, namespaces, dependencies, compatibility and trust class remain governed source/runtime contracts.

---

## PRD04-BND-552 — Default player-content execution remains data-only

**Maturity:** `BOUNDARY-LOCK`

M0 content remains declarative and bounded.

Scripts/native extensions remain explicit trusted-code tiers.

---

## PRD04-BND-553 — Settings scope remains part of architecture authority

**Maturity:** `BOUNDARY-LOCK`

Graphics, accessibility, input, simulation, world rules and server operations remain distinct scopes.

Local presentation may not silently override authoritative world truth.

---

## PRD04-BND-554 — Accessibility/presentation fallback is part of certification

**Maturity:** `BOUNDARY-LOCK`

Critical semantic information must remain interpretable across claimed render/accessibility profiles.

---

## PRD04-BND-555 — Diagnostics/testing/build identity remain production requirements

**Maturity:** `BOUNDARY-LOCK`

The architecture is not implementation-complete if ownership/revisions/provider state/build inputs cannot be observed and reproduced.

---

## PRD04-BND-556 — Dependencies remain replaceable implementation choices behind boundaries

**Maturity:** `BOUNDARY-LOCK`

Dependency adoption does not transfer semantic authority.

Pinned versions, provenance, patches and exit paths remain governed engineering metadata.

---

## PRD04-BND-557 — ADRs select consequential implementations after proof

**Maturity:** `BOUNDARY-LOCK`

PRD-04 closes architecture ownership.

PRD-07/08 evidence and ADRs later select concrete implementation strategies.

---

## PRD04-BND-558 — Closure candidate does not equal production qualification

**Maturity:** `BOUNDARY-LOCK`

PRD-04 completion means architecture discovery is sufficient to proceed.

It does not prove performance, reliability or production suitability.

---

## PRD04-BND-559 — Failed prototypes do not reopen canon automatically

**Maturity:** `BOUNDARY-LOCK`

A failed implementation hypothesis routes back to provider/architecture candidate review.

Canonical requirements remain unless evidence proves the requirement itself impossible/invalid and governance explicitly changes it.

---

## PRD04-BND-560 — PRD-04 changes after closure use controlled deltas

**Maturity:** `BOUNDARY-LOCK`

After acceptance of v0.8 Closure Candidate, later material architecture discoveries should be recorded as controlled PRD-04 deltas/amendments rather than silently rewriting the closed baseline.

---

# 155. Final Architecture Map

```text
                           LEYFORGE CANON
                  semantic identities / game law
                                  │
                                  ▼
                  AUTHORITATIVE DOMAIN LAYER
        world / simulation / transactions / history / rules
                                  │
         ┌────────────────────────┼─────────────────────────┐
         │                        │                         │
         ▼                        ▼                         ▼
   WorldSession             Forge / Content            Protocol /
 composition root          source authority            Persistence
         │                        │                         │
         │                        ▼                         │
         │                validate / compile               │
         │                        │                         │
         ▼                        ▼                         ▼
     LEYFORGE CONTRACTS / FACADES / ADAPTERS
         │
         ├── VoxelFacade ───────────────► Zylann
         ├── PhysicsFacade ─────────────► Godot/Jolt
         ├── NavigationFacade ──────────► Godot/specialist providers
         ├── FluidFacade ───────────────► Leyforge/provider solver
         ├── VesselFacade ──────────────► voxel/physics/fluid/nav adapters
         ├── SaveCoordinator ───────────► voxel store / DB / files
         ├── NetworkProtocol ───────────► ENet/Godot transport
         ├── Projection layer ──────────► SceneTree/render/audio/UI
         └── Diagnostics/Test hooks ────► logs/metrics/CI/profilers
                                  │
                                  ▼
                    PROVIDER / RUNTIME EXECUTION
                                  │
                                  ▼
                   EPHEMERAL HANDLES / CACHES
            RID / ObjectID / NodePath / TYPE / peer / task
```

**Authority flows downward.**

**Evidence, readiness, results and diagnostics flow upward through governed contracts.**

---

# 156. Final Major Architecture Classification

| Architecture Area | Final Status | Notes |
|---|---|---|
| Leyforge semantic authority | `LOCKED` | canonical IDs/rules above providers |
| Godot engine-shell role | `LOCKED` | current leading engine baseline |
| Zylann voxel-substrate role | `LOCKED` | candidate provider retained |
| Forge authoring role | `LOCKED` | visual/3D governed source workflow |
| Art Production Handoff requirement | `LOCKED` | separate from visual canon |
| WorldDefinition / WorldSession split | `LOCKED` | runtime epoch distinct from world |
| canonical realm/frame address ownership | `LOCKED` | provider-independent |
| hierarchical large-world coordinates | `CANDIDATE` | exact widths/rebase strategy proof-gated |
| standard vs double precision | `DEFERRED` | PRD-07 |
| Module vs GDExtension | `DEFERRED` | PRD-07/08 + ADR |
| owner/worker/revision commit model | `LOCKED` | implementation topology still open |
| exact simulation partition sizes/types | `DEFERRED` | domain prototypes/perf |
| simulation LOD | `LOCKED` concept | exact ladders/domain policies deferred |
| SpatialChangeSet consequence model | `CANDIDATE` architecture | exact schema deferred |
| physics authority boundary | `LOCKED` | provider evidence/gameplay interpretation |
| movement facade/capability split | `LOCKED` | controller implementation deferred |
| NavigationFacade/hybrid routing | `LOCKED` | provider selection/profile details deferred |
| fluid domain authority | `LOCKED` | exact solver deferred |
| ocean/local-fluid split | `LOCKED` concept | quantitative implementation deferred |
| vessel-local frame/domain architecture | `LOCKED` | physical implementation proof-gated |
| finite Zylann vessel mesh reuse | `CANDIDATE` | PRD-07 |
| vessel collision strategy | `DEFERRED` | PRD-07/08 |
| network protocol ownership | `LOCKED` | codec/channel details deferred |
| ENet transport | `CANDIDATE` | proof required |
| interest management ownership | `LOCKED` | exact indexing/ranges deferred |
| SaveCoordinator/checkpoint authority | `LOCKED` | storage/journal details deferred |
| SQLite-class structured store | `CANDIDATE` | exact integration deferred |
| operation ID/dedupe architecture | `LOCKED` concept | ID format/retention deferred |
| reconnect repair model | `LOCKED` | token/security mechanics deferred |
| content pack identity/dependencies | `LOCKED` | archive/manifest format deferred |
| M0/M1/M2 trust split | `LOCKED` | exact permissions deferred |
| source→validate→bake→runtime pipeline | `LOCKED` | exact source formats deferred |
| generated-form compilation | `LOCKED` | exact tooling deferred |
| graphics/simulation/world settings split | `LOCKED` | concrete setting catalog later |
| accessibility fallback certification | `LOCKED` | automation specifics deferred |
| diagnostic correlation | `LOCKED` | serialization/tracing tech deferred |
| test-layer model | `LOCKED` | framework selection deferred |
| build/dependency manifest | `LOCKED` | exact format deferred |
| fork threshold | `LOCKED` policy | trigger values deferred |

---

# 157. Final Authority Reconciliation

The following potentially dangerous overlaps were checked and resolved.

## 157.1 SceneTree vs persistent world

**Resolved:** SceneTree is projection only.

## 157.2 Zylann voxel state vs semantic voxel identity

**Resolved:** Leyforge semantic key and reversible runtime palette mapping own meaning.

## 157.3 Physics transform vs canonical position

**Resolved:** provider execution and canonical movement commit are distinct.

## 157.4 Navigation path vs movement authority

**Resolved:** path is a revisioned disposable proposal.

## 157.5 Fluid visual representation vs conserved fluid quantity

**Resolved:** fluid semantic/domain state is authoritative.

## 157.6 Vessel hull mesh vs vessel structure

**Resolved:** vessel-local domain state is authoritative.

## 157.7 Network packet vs canonical transaction

**Resolved:** packet contains intent/evidence; domain owner commits.

## 157.8 DB/voxel write vs checkpoint

**Resolved:** SaveCoordinator publishes coherent checkpoint lineage.

## 157.9 Peer ID vs player/character identity

**Resolved:** stable domain identity is authoritative.

## 157.10 Forge/runtime asset vs semantic content

**Resolved:** source/canon remain above baked products.

## 157.11 Mod file vs trust

**Resolved:** explicit trust tier, not extension/load source.

## 157.12 Graphics setting vs world rule

**Resolved:** settings registry declares authority scope.

## 157.13 Worker scheduling vs state ownership

**Resolved:** scheduler executes; owner commits.

## 157.14 Provider task/log ID vs operation identity

**Resolved:** Leyforge correlation/operation identity remains primary.

**Reconciliation result:** `14 / 14 resolved`.

---

# 158. Proof Consolidation

The 76 detailed `PRD04-PROOF-*` obligations are preserved as stable IDs.

For PRD-06/07 execution, they are grouped into twelve macro programmes.

## PRD04-PKG-A — Identity / Projection / Provider Independence

Covers:

- PROOF-01
- PROOF-02
- PROOF-03
- PROOF-12
- PROOF-22
- PROOF-74

Proves canonical identity survives runtime/provider rebuild and dependency boundaries.

## PRD04-PKG-B — Large Coordinates / Frames / Realm Travel

Covers:

- PROOF-05
- PROOF-06
- PROOF-09
- PROOF-10
- PROOF-11

Proves huge-world addressing, origin rebasing, realm transitions and mode consistency.

## PRD04-PKG-C — Ownership / Concurrency / Simulation Scale

Covers:

- PROOF-13
- PROOF-14
- PROOF-15
- PROOF-16
- PROOF-18
- PROOF-19
- PROOF-21
- PROOF-68

Proves owner/revision architecture and distant civilisation simulation under hostile scheduling.

## PRD04-PKG-D — Cross-Domain Transactions

Covers:

- PROOF-04
- PROOF-17
- PROOF-33
- PROOF-63
- PROOF-76

Proves complex commands remain coherent across many subsystems.

## PRD04-PKG-E — Voxel / Collision / Navigation Integration

Covers:

- PROOF-23
- PROOF-24
- PROOF-25
- PROOF-26
- PROOF-34
- PROOF-67

Proves spatial provider fan-out, stale-result protection and adapter conformance.

## PRD04-PKG-F — Fluid / Ocean

Covers:

- PROOF-27
- PROOF-28

Proves conserved local fluids and ocean boundary behavior.

## PRD04-PKG-G — Vessel Systems

Covers:

- PROOF-08
- PROOF-29
- PROOF-30
- PROOF-31
- PROOF-32

Proves local-frame vessels, editable hulls, collision, occupants and flooding/buoyancy.

## PRD04-PKG-H — Network / Interest / Reconnect

Covers:

- PROOF-35
- PROOF-36
- PROOF-37
- PROOF-38
- PROOF-42
- PROOF-43
- PROOF-44
- PROOF-45
- PROOF-46

Proves authoritative protocol, scoped interest, dedupe, reconnect and backpressure.

## PRD04-PKG-I — Persistence / Recovery / Migration

Covers:

- PROOF-07
- PROOF-20
- PROOF-39
- PROOF-40
- PROOF-41
- PROOF-47
- PROOF-48
- PROOF-57
- PROOF-58
- PROOF-69

Proves checkpoint lineage, crash recovery, content/save migration and durability pressure.

## PRD04-PKG-J — Forge / Content / Trust / Art Production

Covers:

- PROOF-49
- PROOF-50
- PROOF-51
- PROOF-52
- PROOF-54
- PROOF-55
- PROOF-56
- PROOF-62

Proves reproducible content production, Art Handoff sufficiency, generated-form scalability and safe content loading.

## PRD04-PKG-K — Presentation / Settings / Accessibility

Covers:

- PROOF-53
- PROOF-59
- PROOF-60
- PROOF-61
- PROOF-71

Proves renderer/settings isolation, safe recovery and semantic accessibility across profiles.

## PRD04-PKG-L — Build / Dependency / Observability / Qualification

Covers:

- PROOF-64
- PROOF-65
- PROOF-66
- PROOF-70
- PROOF-72
- PROOF-73
- PROOF-75

Proves supportability, exact-build traceability, dependency controlled deltas and bounded observability overhead.

---

# 159. Proof Package Dependency Order

Recommended PRD-07 execution dependency:

```text
PKG-A  Identity / Projection
   │
   ├──► PKG-B Coordinates / Frames
   │
   ├──► PKG-C Ownership / Simulation
   │
   └──► PKG-E Voxel / Collision / Nav
             │
             ├──► PKG-F Fluid
             └──► PKG-G Vessel

PKG-C + PKG-E
      └──► PKG-D Cross-Domain Transactions

PKG-A + PKG-C + PKG-D
      ├──► PKG-H Network / Reconnect
      └──► PKG-I Persistence / Recovery

PKG-J Forge / Content
      └──► PKG-K Presentation / Settings

ALL
 └──► PKG-L Build / Observability / Qualification
      └──► PROOF-76 Whole-Stack Soak
```

`PROOF-76` is a final integration/hostile soak, not an early feasibility experiment.

---

# 160. PRD-06 Risk Handoff

PRD-06 should create explicit high-priority risks for at least:

```text
RISK-A
large-coordinate / precision / origin-frame strategy

RISK-B
Zylann Module vs GDExtension parity

RISK-C
semantic runtime palette / migration

RISK-D
async voxel persistence + coherent checkpoint

RISK-E
deterministic worldgen / late-generation overwrite

RISK-F
simulation ownership / worker scaling

RISK-G
cross-provider CPU saturation/backpressure

RISK-H
dynamic voxel navigation after edits

RISK-I
local conserved fluid + ocean boundary

RISK-J
moving editable vessel collision / mass / flooding

RISK-K
authoritative voxel/entity networking and reconnect

RISK-L
headless dedicated-server parity

RISK-M
content-pack safe-mod sandbox boundary

RISK-N
Art Production Handoff completeness

RISK-O
renderer/accessibility/profile certification

RISK-P
dependency/build reproducibility and observability
```

These are programme-level risks.

PRD-06 may split them further.

---

# 161. PRD-05 Evidence Crosswalk Handoff

PRD-05 must map major architecture claims to evidence without turning evidence into canon.

Required classes:

```text
Technology Fact
Architecture Boundary
Candidate Implementation
Proof Obligation
Proof Result
ADR Decision
```

Example:

```text
Technology Fact:
Godot supports GDExtension.

Architecture Boundary:
Provider implementation sits behind Leyforge adapter.

Candidate:
Use GDExtension for Zylann.

Proof:
PRD04-PKG-E / provider conformance.

Result:
PRD-08 later.

ADR:
Only after evidence.
```

This distinction is mandatory.

---

# 162. PRD-07 Prototype Handoff

PRD-07 should not prototype every unknown independently.

It should build the minimum set of **shared hostile fixtures** that exercise multiple proof IDs.

Recommended fixture families:

```text
FIXTURE-01
Canonical WorldSession + registry + coordinate/frame harness

FIXTURE-02
Voxel edit / SpatialChangeSet / collision / nav harness

FIXTURE-03
Partitioned simulation + worker/revision chaos harness

FIXTURE-04
Checkpoint / DB / voxel-store crash harness

FIXTURE-05
Authoritative server / reconnect / bulk-interest harness

FIXTURE-06
Editable vessel / local frame / collision / flooding harness

FIXTURE-07
Forge pack / generated-form / safe-mod / Art Handoff fixture

FIXTURE-08
Renderer / accessibility / settings profile fixture

FIXTURE-09
Build / exported artifact / support / dependency fixture

FIXTURE-10
Combined hostile-world soak
```

This prevents 76 separate toy projects.

---

# 163. PRD-08 ADR / Result Handoff

PRD-08 should record:

- exact fixture;
- environment;
- result;
- evidence;
- limitations;
- proof level reached;
- failed hypotheses;
- recommended implementation;
- unresolved risk.

Consequential choices then become ADRs.

Expected ADR candidates include:

```text
ADR — production Godot precision strategy
ADR — Zylann Module vs GDExtension
ADR — canonical coordinate concrete representation
ADR — simulation partition/owner implementation model
ADR — structured persistence/database adapter
ADR — journal/checkpoint durability strategy
ADR — network protocol codec/channel model
ADR — navigation provider composition
ADR — fluid solver representation
ADR — vessel collision/buoyancy implementation
ADR — Forge canonical source format
ADR — content pack/archive format
ADR — test framework
ADR — observability/tracing stack
```

---

# 164. Architecture Closure Criteria

PRD-04 Closure Candidate requires:

| Criterion | Result |
|---|---|
| top-level authority hierarchy defined | PASS |
| Godot/Leyforge/Zylann boundaries defined | PASS |
| Forge/art-production boundary defined | PASS |
| canonical vs runtime identity separated | PASS |
| world/session/realm/frame ownership defined | PASS |
| simulation owner/worker model defined | PASS |
| voxel/physics/nav/fluid/vessel boundaries defined | PASS |
| network/persistence/reconnect authority defined | PASS |
| content-pack/mod/settings trust boundaries defined | PASS |
| diagnostics/test/build/dependency governance defined | PASS |
| major authority contradictions remaining | **0** |
| major unowned architecture responsibilities found | **0** |
| provider handles promoted to canonical IDs | **0 permitted** |
| proof obligations stable and consolidated | PASS |
| implementation unknowns routed forward | PASS |
| production qualification claimed | **NO** |

**Closure criteria result: PASS.**

---

# 165. Final Anti-Inversion Laws

The following are the shortest safe summary of PRD-04.

```text
Semantic ID > runtime handle.

Canonical world state > Node/provider state.

Domain owner > worker completion order.

WorldSession mapping > raw global transform.

Canonical transaction > provider side effect.

SpatialChangeSet > observed mesh change.

Gameplay law > physics result.

Movement capability > body implementation.

Route intent > nav path.

Fluid quantity > water shader.

Vessel state > generated mesh/collider.

Protocol semantics > transport packet.

Player identity > peer ID.

Checkpoint > latest provider file.

Forge source > baked runtime asset.

Pack manifest/trust > load order/file extension.

World rule > local settings widget.

Structured diagnostics > random log text.

Evidence > assumption.

ADR after proof > implementation by convenience.
```

---

# 166. Final Architecture Decision Ledger

## Locked

Architecture ownership and boundary decisions are sufficiently mature for downstream use:

- A0–A4 authority hierarchy;
- Leyforge semantic/domain authority;
- Godot engine-shell role;
- Zylann voxel-substrate role;
- Forge source-authoring role;
- Art Production Handoff requirement;
- WorldDefinition/WorldSession split;
- realm/frame/canonical coordinate authority;
- owner/worker/revision commit model;
- SceneTree-independent domain simulation;
- hybrid navigation architecture;
- fluid-domain authority;
- vessel-domain/local-frame architecture;
- network protocol authority;
- interest-management authority;
- SaveCoordinator/checkpoint authority;
- pack/trust/settings boundaries;
- diagnostics/test/build/dependency governance.

## Candidate

Architecture direction preferred but requiring P3/P4 proof:

- hierarchical coordinate representation details;
- active-frame rebasing strategy;
- SpatialChangeSet exact architecture/schema;
- Zylann finite vessel meshing;
- provider readiness aggregation details;
- simulation fidelity/scheduling implementation;
- journal-operation correlation implementation;
- target-profile bake caching;
- automated architecture conformance.

## Deferred

Implementation decisions intentionally not chosen:

- precision mode;
- Module vs GDExtension;
- exact cell/partition dimensions;
- exact DB wrapper;
- exact journal format;
- exact network codec/channels/compression;
- exact nav/volume provider;
- exact fluid solver;
- exact vessel collider/buoyancy model;
- exact Forge source serialization;
- exact pack archive/version-range syntax;
- exact test framework;
- exact diagnostics/tracing stack;
- final hardware/performance thresholds.

---

# 167. Final PRD-04 Closure Verdict

## Verdict

> **PASS — PRD-04 CLOSURE CANDIDATE**

PRD-04 has completed architecture discovery sufficiently to proceed.

The study now defines:

- who owns semantic truth;
- who owns authoritative state;
- how runtime providers participate;
- how huge-world coordinates/session/frame lifetimes work;
- how simulation can scale without SceneTree ownership;
- how voxel/physics/navigation/fluid/vessel systems interact;
- how networking and persistence project one authority;
- how Forge/content/mod/settings pipelines remain governed;
- how diagnostics/testing/build/dependency systems enforce the architecture;
- what remains unproven.

## What PRD-04 does **not** claim

It does not claim:

- Godot/Zylann production qualification;
- Module/GDExtension final selection;
- large-world precision solution proven;
- vessel physics proven;
- fluid solver proven;
- save/network throughput proven;
- low-end performance proven;
- multiplayer scale proven;
- Forge production pipeline implemented;
- Art Production Handoff completed;
- V1 documentation globally audited.

Those claims require later programme work.

---

# 168. Controlled-Delta Rule

After acceptance of PRD-04 v0.8 Closure Candidate:

- implementation evidence does not silently rewrite this document;
- materially changed architecture assumptions create a controlled PRD-04 v0.x/v1.x delta as governance determines;
- proof failure first updates the associated risk/prototype/ADR record;
- only a genuine architecture-authority change reopens affected PRD-04 boundaries.

This prevents prototype iteration from destabilizing the whole architecture baseline.

---

# 169. Programme State After PRD-04

```text
PRD-00
Source Corpus & Authority Register
FINAL / CLOSED

PRD-01
Complete Technical Requirements & Unknowns
CLOSURE CANDIDATE

PRD-02
Zylann Voxel Tools Deep Capability Audit
CLOSURE CANDIDATE

PRD-03
Godot & Supporting Technology Audit
CLOSURE CANDIDATE

PRD-04
Architecture Boundary Study
CLOSURE CANDIDATE
  560 architecture boundaries
  76 stable proof obligations
  12 proof macro-programmes

NEXT:
PRD-05
Research Evidence Crosswalk
```

---

# 170. Immediate Downstream Sequence

Proceed in this order:

```text
PRD-05
Research Evidence Crosswalk
      ↓
PRD-06
Technical Risk & Proof Register
      ↓
PRD-07
Prototype & Benchmark Programme
      ↓
PRD-08
Prototype Results & ADR Evidence
      ↓
PRD-09
Pre-Rebuild Closure Audit
```

PRD-05 should begin from:

- PRD-01 requirements/unknowns;
- PRD-02 technology evidence;
- PRD-03 technology evidence;
- PRD-04 boundary/proof IDs.

It should **not** re-decide architecture.

---

# 171. Final Round-8 Result

**PRD-04 ROUND 8 — COMPLETE**

**Reconciliation status:**

```text
Rounds reconciled:                  8 / 8
Architecture boundaries:            560
Boundary ID gaps:                   0
Proof obligations:                  76
Proof ID gaps:                      0
Proof macro-programmes:             12
Major authority contradictions:     0
Major unowned responsibilities:     0
Production qualification claimed:   NO
Downstream proof/risk routing:       COMPLETE
```

> **PRD-04 — LEYFORGE ARCHITECTURE BOUNDARY STUDY v0.8 — CLOSURE CANDIDATE**

The architecture is sufficiently defined to stop broad ownership discovery and move forward into evidence crosswalk, risk formalisation and hostile prototype planning.

---

**FINAL PRD-04 RESULT: PASS — CLOSURE CANDIDATE.**
