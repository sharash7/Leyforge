# LEYFORGE

## 18 — Godot + Summer Engine Technical Implementation Plan

### Production Architecture, Registry Compilation, Voxel Runtime, Deterministic World Assembly, Persistence, Simulation LOD, Authority, Networking, Forge Products, Validation, Performance, Recovery and Bounded AI-Assisted Development

**Version 1.0 — Reconciled Production Technical Foundation Draft**  
**Date:** 8 August 2026  
**Production Status:** Complete Replacement of Legacy Unreal/POC Technical Plan; Architecture Ready for Review, Repository-Mapping Gate Still Required  
**Supersedes:** `18_Fantasy_Voxel_Civilisation_Sandbox_Technical_Implementation_Plan_v0_1` for active technical direction  
**Legacy Engine Direction:** Unreal Engine 5 — **Retired**  
**Active Engine Direction:** **Godot + Summer Engine**  
**Default Scripting Direction:** **GDScript first; measured native/GDExtension acceleration only for proven hotspots**  
**Runtime Dependency Rule:** **The shipped game does not require Summer Engine, a remote model or any generative-AI service to function**  
**Primary Design Authorities:** Documents 00–17 v1.0  
**Pending Foundation Reconciliation:** Documents 19–20 remain subject to their planned production reconciliation after this document  
**Production Governance:** Document Set 25  
**Maritime Technical Extension:** Document Set 26, especially 26O  
**Economy / Social / Biology / Movement Ownership:** Final Reconciled Sets 27–30 Cross-Set Interface Register v1.1  
**Forge / Runtime Product Boundaries:** Sets 21–23 + 25D/25K  
**World Content:** Document Set 24  
**Project Lead and Final Authority:** Ash

---

# Repository Evidence Status

This document is intentionally explicit about what is and is not known.

The current documentation set contains strong production authority for:

- gameplay ownership;
- registries;
- content packs;
- world generation;
- persistence requirements;
- simulation LOD;
- maritime systems;
- economy;
- social systems;
- biology;
- movement;
- validation;
- Summer Engine task governance.

It does **not** contain a verified read-only audit of the live Godot/Summer Engine repository.

Therefore this document **does not claim**:

- an exact installed Godot version;
- exact addon/plugin versions;
- exact repository folder names;
- exact existing class names;
- exact autoload names;
- exact Summer Engine integration commands;
- exact CI provider;
- exact build command syntax;
- exact platform SDK versions;
- exact current scene/resource layout.

Those values become authoritative only after the Set-25 **DOC-003 Read-Only Repository Audit**.

> **Repository Honesty Rule**
>
> **No technical plan becomes more useful by inventing files that may not exist. Document 18 defines the production architecture, path classes, service responsibilities, data contracts, gates, validation command identities and implementation sequence. The repository audit maps those contracts onto the real project before code-bearing tasks become Ready.**

---

# Technical Implementation Plan Statement

> **Build Leyforge as one authoritative, persistent, data-driven living world whose gameplay truth lives in stable records and bounded services rather than scene-node accidents. Godot hosts runtime execution and presentation. Canonical authored content compiles through validated registries. Generated worlds are deterministic bases plus persistent history. Loaded Nodes represent what currently needs physical interaction or presentation; they are not the database. Summer Engine assists bounded development tasks under explicit source, file, test, evidence and rollback contracts, but is not part of the shipped runtime dependency chain.**

---

# 1. Complete Replacement Scope

Document 18 v1.0 replaces the former technical plan because the old document was built around:

- Unreal Engine 5;
- C++/Blueprint ownership;
- Unreal Actor/World Partition assumptions;
- Unreal `/Game/...` asset paths;
- the Forest Hamlet POC;
- a fixed POC valley relationship graph;
- POC implementation stages;
- broad pre-Set-26–30 ownership;
- pre-Forge production architecture;
- pre-Atlas content architecture.

The following technical principles from v0.1 remain valuable and are retained:

- one mutable truth owner;
- stable IDs;
- immutable definitions;
- command versus event separation;
- side-effect-free queries;
- authoritative transactions;
- event ordering;
- idempotency;
- chunked voxel data;
- palette compression;
- asynchronous meshing;
- seed-plus-delta persistence;
- rotating backups;
- migrations;
- simulation LOD;
- bounded catch-up;
- server authority;
- split-screen readiness;
- structured logging;
- automated tests;
- profiling in packaged builds;
- content validation;
- recovery tools;
- architecture decision records;
- technical debt tracking.

The Unreal-specific and POC-specific implementation wrappers are retired.

---

# 2. Governing Technical Locks

The following rules are non-negotiable unless explicitly superseded by an approved architecture decision.

## 2.1 One Rule, One Owner

One gameplay rule has one owner.

Consumers receive:

- typed snapshots;
- commands;
- events;
- evidence;
- references.

They do not recreate another owner's formula.

## 2.2 Scene Tree Is Not the Database

Godot Nodes exist for:

- loaded interaction;
- presentation;
- local physics;
- active controllers;
- UI;
- audio;
- VFX;
- editor tooling.

Persistent world truth must not depend on a Node remaining loaded.

## 2.3 Definitions Are Runtime-Immutable

Authored definitions compile into validated runtime products.

Normal gameplay changes runtime instances/state, not definitions.

## 2.4 Runtime State Uses Stable Identity

A runtime instance has a persistent ID independent of:

- scene path;
- Node name;
- parent Node;
- display name;
- current owner;
- current world position;
- active LOD.

## 2.5 Commands Express Intent

A command requests a change.

It does not declare success.

## 2.6 Events Describe Committed Facts

An event is emitted after authoritative state commits.

## 2.7 Queries Do Not Mutate

Opening:

- map;
- market;
- route screen;
- inventory;
- settlement dashboard

must not consume resources or advance simulation merely because it was queried.

## 2.8 Persistent Consequences Are Idempotent

Transactions/evidence use stable IDs so retries cannot:

- duplicate currency;
- duplicate items;
- double-complete quests;
- double-apply injuries;
- double-deliver cargo.

## 2.9 Determinism Is Scoped

Exact deterministic reproduction is required for:

- registry compilation;
- pack resolution;
- generated IDs;
- world-selection decisions;
- worldgen;
- repair decisions;
- deterministic schedules where declared;
- migration outputs where possible.

Real-time physics such as:

- buoyancy;
- collisions;
- moving characters;
- waves

may use server authority and bounded tolerances rather than pretending cross-platform bitwise physics determinism exists.

## 2.10 Performance Cannot Rewrite Truth

Performance profiles may reduce:

- rendering;
- presentation;
- local promotion radius;
- update scheduling frequency;
- VFX;
- actor representation.

They do not silently change authoritative world rules.

Simulation Depth is a separate explicit world rule.

---

# 3. Engine Direction

## 3.1 Godot Owns Runtime and Editor Execution

Godot is the active runtime engine.

Godot hosts:

- application lifecycle;
- scenes;
- Nodes;
- physics integration;
- input;
- rendering;
- UI;
- audio;
- resource loading;
- platform abstraction;
- editor plugins/tools;
- multiplayer transport integration;
- packaged builds.

## 3.2 GDScript First

GDScript is the default production implementation language.

Reasons:

- rapid iteration;
- tight Godot integration;
- inspectability;
- lower architectural friction;
- easier bounded task changes;
- simpler AI-assisted review;
- strong suitability for service/orchestration code.

## 3.3 Native Acceleration Policy

GDExtension/native code is considered only after profiling proves a meaningful need.

Candidate hotspots may include:

- voxel meshing;
- compression;
- large graph rebuilds;
- specialised numeric kernels;
- high-volume geometry processing.

Native code is **not** introduced because a subsystem sounds “performance critical.”

## 3.4 Native Admission Requires

- retained profiler trace;
- measured bottleneck;
- stable boundary;
- benchmark fixture;
- fallback/replacement strategy;
- platform/build impact review;
- test parity.

## 3.5 Godot Version Lock

The exact Godot version is **Repository-Audit Required**.

Production policy:

- choose a stable supported version;
- lock per milestone/release branch;
- record upgrade ADR;
- run save, registry, physics, UI and packaged-build regression before upgrade acceptance.

---

# 4. Summer Engine Role

Summer Engine is a development and implementation environment, not runtime gameplay authority.

It may assist with:

- repository inspection;
- architecture mapping;
- bounded coding tasks;
- schema generation;
- importer/compiler implementation;
- validator implementation;
- test generation;
- test execution;
- regression comparison;
- migration scripting;
- debug visualisation;
- documentation synchronisation;
- evidence summarisation.

## 4.1 Summer Engine Must Not

- silently redefine gameplay ownership;
- create new canonical IDs without registry review;
- broaden task scope without updating task contract;
- edit undeclared files;
- suppress failed tests;
- delete evidence;
- overwrite the last good save fixture;
- commit secrets;
- introduce arbitrary runtime AI dependencies;
- make a feature “green” through UI-only simulation.

## 4.2 Human Authority

AI-assisted changes require:

- source references;
- code review;
- test evidence;
- rollback path;
- architecture approval where boundaries change.

Ash remains final project authority.

---

# 5. Repository Discovery Gate

Before the first code-bearing production task, run a read-only repository audit.

## 5.1 Audit Outputs

The audit must freeze:

- root project map;
- Godot version;
- project file;
- addons/plugins;
- autoloads;
- scenes;
- scripts;
- resources;
- test folders;
- build/export configuration;
- generated files;
- asset import locations;
- content/data locations;
- save implementation;
- current voxel implementation;
- existing Summer Engine/task integration;
- external dependencies;
- ignored/cache paths;
- CI configuration;
- known failing tests;
- current packaged build state.

## 5.2 Audit Is Read-Only

No cleanup.

No renames.

No “helpful” refactor.

The goal is evidence.

## 5.3 Repository Mapping Output

The audit produces a mapping:

```text
Logical Architecture Component
    -> Existing Repository Path(s)
    -> Existing Class/Resource/Scene
    -> Current Owner
    -> Keep / Amend / Replace / Remove
    -> Risk
    -> Test Coverage
```

## 5.4 Code Readiness

A code task is **Not Ready** until exact changed files are known.

---

# 6. Logical Repository Path Classes

Exact folder names are pending audit, but production sources must remain separated by class.

Logical classes:

- `AUTHORING_SOURCE`
- `CANONICAL_INTERCHANGE`
- `SCHEMA_SOURCE`
- `GENERATED_RUNTIME_DATA`
- `ENGINE_RUNTIME_CODE`
- `EDITOR_TOOL_CODE`
- `PRESENTATION_ASSET`
- `RUNTIME_CACHE`
- `SAVE_DATA`
- `SAVE_FIXTURE`
- `MIGRATION_SOURCE`
- `TEST_SOURCE`
- `TEST_EVIDENCE`
- `BUILD_EVIDENCE`
- `ARCHIVE_POC`
- `DOCUMENTATION`

## 6.1 Generated Files

Generated files:

- identify generator/version;
- are rebuildable;
- are not manually edited.

## 6.2 Save Data

Save data never lives in canonical source folders.

## 6.3 Archive Data

POC fixtures remain isolated from shipping profiles.

---

# 7. Production Architectural Layers

Recommended logical layers:

1. **Authoring**
2. **Validation / Compilation**
3. **Immutable Definition Runtime**
4. **Authoritative World-State Services**
5. **Simulation / Transactions**
6. **Loaded Physical Runtime**
7. **Presentation**
8. **UI / View Models**
9. **Networking / Replication**
10. **Persistence / Recovery**
11. **Developer Tooling / Evidence**

Dependencies flow downward only through declared interfaces.

---

# 8. Authoring Layer

Authoring truth may originate from:

- spreadsheets;
- normalised JSON;
- Forge projects;
- graph editors;
- localisation catalogues;
- approved Godot Resources in rare engine-coupled cases.

Each field path has one authoring owner.

---

# 9. Canonical Interchange

Set 25D locks **normalised JSON** as the initial common validator/compiler interchange.

Requirements:

- UTF-8;
- explicit schema/version;
- deterministic semantic ordering;
- explicit nulls;
- no unsafe executable content;
- source provenance;
- stable IDs;
- canonical path separators;
- semantic hashes.

YAML is documentation/experimental only unless later admitted through an ADR and strict parser/schema contract.

---

# 10. Generated Godot Resources

Generated Godot Resources are default engine-facing products where useful.

They are:

- compiled;
- validated;
- provenance-linked;
- hashable;
- rebuildable.

They are not automatically canonical authoring truth.

---

# 11. Canonical Identity Kernel

New production definitions use fully qualified IDs.

Conceptual form:

```text
namespace.domain.identity_path
```

Example:

```text
leyforge.core.block.terrain.stone
```

Rules:

- lowercase stable identity;
- display name is separate;
- file path is separate;
- runtime instance ID is separate;
- save-state suffix is separate;
- local scene path is never identity.

---

# 12. Definition Envelope

A compiled definition should expose:

```yaml
definition:
  qualified_id: <id>
  schema_id: <id>
  schema_version: <version>
  identity_owner: <owner>
  source_pack_ref: <pack>
  lifecycle_status: <status>
  facets: {}
  relationship_refs: []
  capability_refs: []
  source_map_ref: <id>
  semantic_hash: <hash>
```

---

# 13. Facet Ownership

Several systems may describe one concept through different facets.

Example canonical sword:

- Item identity facet — Document 04;
- Combat facet — Document 16;
- magic/enchantment facet — Document 09;
- movement/load facet — Set 30/29;
- economy-facing facts — Set 27 consumes derived/item facts.

No second sword identity is created.

---

# 14. Canonical Block / Item Technical Rule

FR-00-20-006 is a technical invariant.

If:

```text
same placeable identity + same recovered identity
```

then:

```text
one canonical Block definition
zero duplicate canonical Item definitions
generated Block Inventory Projection
```

## 14.1 Runtime Inventory Reference

An inventory stack must be capable of referencing:

```yaml
inventory_identity:
  block_ref: <canonical_block_id>?
  item_ref: <canonical_item_id>?
```

Exactly one canonical carried identity is selected.

## 14.2 Projection

A Block Inventory Projection is generated presentation/runtime metadata.

It is not an editable Item definition.

---

# 15. Corrected Core Registry Baseline

The Foundation reconciliation establishes:

- **217 canonical Block-family baseline**
- **286 canonical Item-family baseline**
- **105 production chain contracts**
- **15 typed substitution groups**

The older Set-25 296-item figure included ten `block_form.*` profiles that are now projections under FR-00-20-006.

Technical implementation uses the reconciled canonical total.

---

# 16. Alias and Tombstone Runtime

Registry kernel supports:

- alias;
- tombstone;
- deprecated ID;
- missing-definition recovery.

Aliases resolve one-way.

A removed identity does not become a second active identity.

---

# 17. Content-Pack Model

A content pack declares:

- pack ID;
- namespace;
- version;
- schema compatibility;
- dependencies;
- optional dependencies;
- authored definitions;
- extension facets;
- migrations;
- presentation assets;
- production status;
- semantic hash.

---

# 18. Pack Resolution

Pack resolver:

1. validates manifests;
2. resolves required dependencies;
3. evaluates optional dependencies;
4. detects cycles/conflicts;
5. freezes load order;
6. freezes pack versions;
7. emits deterministic lockfile.

---

# 19. Pack Lockfile

A generated lockfile identifies the exact content universe used by:

- a world;
- a test;
- a packaged candidate.

It is retained in evidence.

---

# 20. Pack Overrides

A pack cannot silently replace another owner's canonical field.

Allowed extension requires:

- declared extension facet;
- compatible schema;
- owner permission;
- explicit merge rules.

---

# 21. Pack Removal

Removal checks:

- active definitions;
- saved instances;
- structures;
- items;
- quests;
- realm content;
- migrations.

Missing content enters:

- alias resolution;
- quarantine;
- placeholder;
- safe failure.

It is not silently deleted.

---

# 22. Build Profiles

Feature/build profile service resolves combinations such as:

- Core Production;
- Core + approved optional;
- Development;
- Archive Regression;
- Test Fixture;
- Maximal Pack;
- Minimal Pack.

POC archive content is not admitted into shipping profiles.

---

# 23. Registry Compilation Pipeline

Conceptual flow:

```text
Authoring Sources
    ↓
Importers
    ↓
Normalised JSON
    ↓
Schema Validation
    ↓
Identity / Ownership Validation
    ↓
Relationship / Capability Validation
    ↓
Pack Resolution
    ↓
Compiled Definition Assembly
    ↓
Semantic Hash
    ↓
Generated Godot Resources / Runtime Tables
    ↓
Load Test
    ↓
Registry Snapshot
```

---

# 24. Registry Snapshot

A runtime registry snapshot is frozen for:

- world generation;
- active server;
- save compatibility;
- release evidence.

Hot-reload in developer tools must not change authoritative multiplayer truth unsafely.

---

# 25. Registry Query API

Provide side-effect-free operations conceptually equivalent to:

- resolve definition;
- resolve alias;
- query facet;
- query capability;
- query relationship;
- query pack provenance;
- query lifecycle status.

Exact names await repository mapping.

---

# 26. Runtime Instance Identity

Runtime identities are separate from definitions.

Recommended family:

```text
<domain_instance>:<ULID>
```

or another approved collision-safe persistent ID strategy.

The exact ID generator is a technical implementation decision, but must be:

- persistent;
- non-display;
- save-safe;
- network-safe.

---

# 27. World Address Model

A persistent spatial address needs more than one global transform.

Conceptual model:

```yaml
world_address:
  world_ref: <id>
  realm_instance_ref: <id>
  spatial_frame_ref: <id>
  region_or_chunk_ref: <id>?
  local_position: <vector_or_grid_position>
```

This supports:

- Overworld terrain;
- realms;
- vessels;
- moving platforms;
- pocket worlds.

---

# 28. Spatial Frames

A Spatial Frame has:

- persistent frame ID;
- parent world/realm;
- transform provider;
- local coordinate space;
- attachment rules;
- persistence;
- replication relevance.

Examples:

- static world;
- vessel local frame;
- moving platform;
- guided transport interior.

---

# 29. Moving-Frame Rule

Persistent child identity is not a world-space coordinate.

A chest aboard a vessel remains attached to:

- vessel frame;
- local coordinates;
- persistent chest instance.

---

# 30. Core Runtime Communication

Use four primary semantics:

- **Query**
- **Command**
- **Transaction**
- **Event**

Plus:

- **Evidence Envelope**
- **View Model**

---

# 31. Query

A query:

- reads;
- is side-effect free;
- may return revision/freshness;
- may be cached.

---

# 32. Command

A command:

- expresses intent;
- carries actor/authority;
- carries expected revision when stale-state matters;
- carries idempotency key for persistent consequences.

---

# 33. Transaction

A transaction:

- validates;
- reserves;
- commits atomically;
- journals;
- emits events;
- supports recovery.

---

# 34. Event

An event states:

> something authoritative happened.

It includes:

- event ID;
- source owner;
- subjects;
- world time;
- source revision;
- reason codes.

---

# 35. Cross-System Evidence Envelope

Adopt the final Sets 27–30 pattern.

```yaml
evidence:
  evidence_id: <id>
  source_owner: <system>
  source_event_or_transaction_ref: <id>
  subject_refs: []
  outcome_class: <class>
  world_time: <time>
  source_revision: <rev>
  integrity_key: <key>?
  reason_codes: []
```

Consumers commit their own consequence once.

---

# 36. Event Ordering

When several consequences depend on one transaction:

1. owner validates;
2. owner commits;
3. owner increments revision;
4. owner journals;
5. owner emits event/evidence;
6. consumers process according to dependency rules.

Do not emit success before commit.

---

# 37. Cyclic Event Protection

Event cascades require:

- causal chain ID;
- depth/budget;
- duplicate suppression;
- owner-level idempotency.

---

# 38. Runtime Authority Context

One gameplay authority model should work for:

- solo;
- local split-screen;
- listen-host multiplayer;
- dedicated server.

Solo is not implemented through a separate permissive rule set.

---

# 39. Authority Request

Consequential commands include:

- requester;
- player/actor;
- world;
- ownership/permission context;
- expected state revision;
- command ID;
- transaction ID where needed.

---

# 40. World Time Authority

One authoritative simulation time reference supplies:

- simulation time;
- calendar mapping;
- simulation rate;
- pause/suspend state;
- revision.

Sets 27–30 consume the same time reference.

---

# 41. Application-Closed Time

Wall-clock time is not automatically simulation time.

World policy determines whether a world advances while:

- local application closed;
- local host running;
- dedicated server running;
- no players connected.

---

# 42. Scheduler

Use a central bounded scheduler for:

- delayed jobs;
- periodic simulation;
- event milestones;
- background summaries;
- time-based contracts;
- crop updates;
- biological updates;
- journey updates.

---

# 43. Scheduler Requirements

- stable task IDs;
- world-time basis;
- priority;
- cancellation;
- owner;
- deterministic ordering where required;
- bounded per-frame work;
- persistence for important scheduled work.

---

# 44. Async Work

Candidate asynchronous work:

- voxel meshing;
- collision product generation;
- navigation rebuild preparation;
- worldgen;
- registry compile;
- asset baking;
- route planning;
- regional summary processing;
- validation;
- compression.

Authoritative commits return through a deterministic main simulation boundary.

---

# 45. No Unsafe Background Mutation

Worker threads/jobs must not mutate shared authoritative world state without:

- isolated result;
- version/revision check;
- commit phase.

---

# 46. Work Queue

A work item includes:

- owner;
- input revision;
- cancellation token;
- estimated class;
- output;
- commit callback;
- invalidation policy.

---

# 47. Simulation Backlog

Systems expose backlog metrics.

A performance profile may spread work across time, but not drop mandatory authoritative work silently.

---

# 48. Deterministic Random Streams

Persistent randomness derives from named streams using:

- root world seed;
- stable domain key;
- stable subject ID;
- event ID;
- algorithm/version.

Never rely on one global random stream whose call order changes as unrelated features are added.

---

# 49. Presentation Randomness

Cosmetic randomness may be non-authoritative if it cannot:

- affect save state;
- affect collision;
- affect gameplay result.

---

# 50. Voxel World Identity

The primary world grid remains **one-metre-style** in design terms, with approved authored shapes/sub-cell geometry.

Exact storage section size is a performance decision.

---

# 51. Chunk / Section Size

The legacy 32³ logical-chunk idea remains a useful benchmark candidate.

It is **not** a production lock until profiling compares:

- memory;
- meshing;
- edit cost;
- collision;
- streaming;
- save delta size.

---

# 52. Voxel Data Storage

A chunk/section should use compact arrays/tables for:

- block palette index;
- block state;
- lighting/environment data where applicable;
- local metadata references.

No Node per voxel.

---

# 53. Palette Compression

Chunk-local palettes map compact indices to canonical Block IDs.

Benefits:

- memory;
- compression;
- save delta;
- network block edits.

---

# 54. Block State

Small state belongs in compact voxel state when practical.

Examples:

- orientation;
- open/closed;
- growth stage;
- damage band;
- waterlogged/local state.

Large/stateful gameplay records use Block Entities.

---

# 55. Block Entities

Create a Block Entity only when the voxel has meaningful state that cannot live efficiently in compact block state.

Examples:

- inventory;
- machine;
- complex portal;
- specialised interactive device.

A Block Entity is a record first.

A Node may represent it while loaded.

---

# 56. Block Edit Transaction

A block edit validates:

- authority;
- target revision;
- Block definition;
- placement support;
- collision;
- ownership;
- inventory/resource source;
- protected anchors;
- world rule.

Then commits:

- voxel change;
- inventory change;
- structure/project effects;
- dirty regions;
- event.

---

# 57. Batch Block Edits

Construction, explosions and worldgen use bounded batch transactions.

Avoid one network/save/mesh transaction per block when a coherent batch exists.

---

# 58. Voxel Dirty Regions

A block edit can mark:

- mesh;
- collision;
- navigation;
- lighting;
- fluid;
- structure graph;
- automation graph

dirty independently.

Only affected products rebuild.

---

# 59. Meshing

Default design direction:

- merged faces;
- greedy/compatible meshing where appropriate;
- shape-aware products;
- material batching;
- async generation;
- main-thread attachment.

Exact mesher requires profiling.

---

# 60. Collision

Collision products:

- generated per dirty section;
- simplified where safe;
- rebuilt incrementally;
- prioritised before decorative render in imminent interaction zones.

---

# 61. Voxel Lighting

Gameplay illumination truth must remain distinct from purely decorative rendering.

Exact light propagation implementation remains a technical spike.

---

# 62. Fluids

Set 26B establishes a hybrid.

Large ocean:

- not a full active voxel-water simulation.

Local Fluid Islands:

- bounded;
- conserved;
- activated for containment/flooding/pumps/edits.

---

# 63. Marine Fields

Set 26D supplies regional:

- wind;
- current;
- tide;
- wave;
- storm.

Presentation samples fields.

Vessel movement samples fields.

They are not millions of object Nodes.

---

# 64. World Generation Pipeline

Document 11 v1.0 owns the pipeline.

Technical runtime must support:

1. validate profile/packs;
2. resolve seed/version;
3. topology;
4. land/ocean skeleton;
5. elevation;
6. climate;
7. hydrology;
8. geology;
9. magic baseline;
10. macro-regions;
11. biome mosaics;
12. specialist environments;
13. procedural history;
14. civilisation context;
15. route/infrastructure candidates;
16. content sockets;
17. Atlas resolution;
18. progression/ecology/civilisation validation;
19. deterministic repair;
20. start selection;
21. freeze stateful/discovered records;
22. local voxel materialisation.

---

# 65. Worldgen Stages Are Versioned

Every stage records:

- generator version;
- input seed;
- derived stream;
- definition snapshot;
- repair decisions.

---

# 66. Deterministic Repair

Repair is:

- bounded;
- source-reasoned;
- traceable;
- deterministic.

Repair cannot become an invisible second generator.

---

# 67. Seed Corpus

Technical harness supports:

- golden;
- broad;
- adversarial;
- boundary;
- minimal-pack;
- maximal-pack;
- migration;
- long-run;
- expansion-compatibility

seed corpora.

---

# 68. Generated Base + Persistent Delta

A world is conceptually:

```text
Deterministic Generated Base
+
Persistent Delta / Promoted Runtime Records
```

This is the core save architecture.

---

# 69. Freeze Rules

Generated records become protected/frozen when:

- discovered;
- referenced;
- modified;
- owned;
- settled;
- quest-bound;
- event-bound;
- extracted;
- structurally changed.

---

# 70. World Upgrade Rule

A generator update may:

- affect new unexplored areas;
- add compatible content;
- migrate state;
- repair references.

It may not silently move/delete explored important world features.

---

# 71. Region Streaming

Region/Chunk streaming prioritises:

1. authoritative collision/access;
2. active gameplay state;
3. navigation;
4. important actors;
5. presentation;
6. decoration.

---

# 72. Region Runtime

A loaded region hosts:

- materialised chunks;
- relevant Nodes;
- local simulation adapters;
- physics;
- audio/presentation.

The persistent state remains service-owned.

---

# 73. Realm Runtime

Each realm uses its own:

- RealmInstance ID;
- coordinate space;
- regions;
- environment/law snapshot;
- streaming state.

Do not place every realm millions of units apart in one scene.

---

# 74. Realm Transition

Cross-realm transition is transactional:

- validate route;
- validate permission;
- reserve destination;
- commit origin release;
- commit destination presence;
- recover atomically on failure.

---

# 75. Vessel Runtime

Set 26 establishes:

- one vessel root;
- compact local voxel/grid data;
- derived structural graph;
- compartment graph;
- semantic markers;
- incremental rebuilds.

No Node per vessel voxel.

---

# 76. Vessel Local Space

Player/NPC/item/fixture state aboard a vessel uses vessel-local coordinates when attached.

World transform is derived.

---

# 77. Vessel Edit Rebuild

Dirty vessel edits may invalidate:

- mesh;
- collision;
- mass summary;
- structural graph;
- compartment graph;
- water interaction samples.

Rebuild incrementally.

---

# 78. Buoyancy

Do not apply buoyancy to every voxel.

Use bounded samples/patches derived from geometry.

---

# 79. Navigation Architecture

Navigation is layered.

Potential levels:

- local movement geometry;
- voxel traversal graph;
- structure interiors;
- moving-frame navigation;
- route graph;
- long-distance journey;
- formation/reservation.

Set 30 remains owner of movement/path execution.

---

# 80. Navigation Products

Generated navigation products are derived caches.

They can be rebuilt from:

- terrain;
- structures;
- movers;
- movement facets.

Persistent identity should not depend on nav-cache IDs.

---

# 81. Navigation Revisions

Changes such as:

- bridge collapse;
- gate closure;
- tunnel block;
- vessel movement;
- terrain edit

increment relevant topology revisions.

Consumers invalidate only affected routes.

---

# 82. Local Pathfinding

Local pathfinding must be:

- bounded;
- asynchronous where safe;
- mover-profile aware;
- clearance aware;
- dynamic obstacle aware.

---

# 83. Long-Distance Route Planning

Use route graph and movement APIs.

Do not path every long journey across raw voxels.

---

# 84. Journey Runtime

A journey record survives:

- unload;
- save;
- distant simulation.

It references:

- mover;
- origin;
- destination;
- route;
- progress;
- current leg;
- blockers;
- ETA snapshot.

---

# 85. Movement Physical Authority

Set 30 owns:

- authoritative transforms;
- velocity;
- terrestrial/aerial movement;
- climbing/traversal;
- mounts;
- land vehicles;
- guided transport;
- route access;
- local navigation.

Set 26 owns aquatic/vessel specialist execution where defined.

---

# 86. External Movement Modifiers

Biology, combat, magic, environment and equipment produce typed modifiers.

Movement resolves them through ordered contracts.

No system writes `actor.position` because it wants a slow/knockback effect.

---

# 87. Combat Integration

Document 16 owns:

- actions;
- hit;
- defence;
- Guard/Stability;
- final Combat Damage Packet;
- downed/death.

Set 29 owns biological application.

Set 30 owns physical displacement.

---

# 88. Projectile Architecture

Character combat projectiles can be transient runtime entities with stable attack sequence IDs.

Persistent projectile recovery becomes Item/world state only when needed.

---

# 89. Structure Runtime

Document 12 owns persistent StructureInstance state.

Blueprint voxel source is not the same as placed structure state.

---

# 90. Blueprint Bake

Forge/Blueprint source can bake:

- compact voxel volume;
- mesh hints;
- collision;
- semantic marker table;
- room/zone data;
- navigation seed;
- thumbnail;
- validation hash.

Runtime stores source revision + deltas.

---

# 91. Structure Update Rule

Updating the source blueprint does not silently rebuild player-modified existing structures.

---

# 92. NPC Architecture

Document 07 persistent people are records.

Loaded NPC Nodes are promotions.

NPC record may contain:

- identity;
- household;
- job;
- current task;
- location/presence;
- schedule state;
- inventory references;
- social/political references.

---

# 93. NPC Task Selection

Use bounded planner/utility/schedule systems according to the owning design.

Do not run unbounded general-purpose reasoning per NPC per frame.

---

# 94. NPC Movement

NPC chooses intent/task.

Set 30 navigation/movement executes.

---

# 95. NPC Distant Simulation

Distant NPCs may become:

- individual persistent records;
- household/cohort summaries

according to Simulation Depth and relevance.

Named/protected actors remain traceable.

---

# 96. Creature Runtime

Document 10 uses:

- populations/cohorts;
- habitat;
- nests;
- territories;
- promoted individual creatures.

No universal invisible spawn-point loop.

---

# 97. Creature Promotion

Promote to full actor when relevant through:

- proximity;
- encounter;
- tame/companion status;
- injury;
- unique identity;
- quest/event.

---

# 98. Population Conservation

Distant/near transitions preserve:

- count;
- notable individuals;
- reproduction/death;
- extraction/harvest;
- territory.

---

# 99. Economy Runtime

Set 27 owns economic truth.

Technical services must support:

- market nodes;
- currency/ledger;
- contract records;
- transaction journals;
- trade-route economic snapshots;
- public finance.

No UI-owned prices.

---

# 100. Economic Quantity Precision

Money/resources with conservation requirements use explicit stable numeric representation.

Avoid unbounded floating-point drift in ledgers.

Exact fixed/integer scaling per currency/resource is a schema decision.

---

# 101. Contract Runtime

Contracts are persistent records.

Quest journal may project them.

The quest system cannot fulfil them by setting a flag.

---

# 102. Social Runtime

Set 28 owns:

- dialogue;
- trust;
- loyalty;
- beliefs;
- rumours;
- memory;
- willingness;
- companion agreements.

Technical architecture stores social graph/state separately from formal political state.

---

# 103. Knowledge Runtime

Knowledge records include:

- subject;
- claim/fact reference;
- source;
- confidence;
- timestamp;
- provenance;
- contradiction.

UI filters truth through knowledge.

---

# 104. Biology Runtime

Set 29 owns:

- Health;
- Stamina;
- Fatigue;
- hunger;
- hydration;
- temperature;
- wetness;
- sleep;
- injuries;
- disease;
- toxins;
- treatment.

Combat does not duplicate these records.

---

# 105. Biological Scheduling

Local players update at responsive cadence.

Distant actors can use bounded scheduled integration.

Elapsed-time catch-up must preserve:

- cause;
- protection;
- treatment;
- death rules.

---

# 106. Magic Runtime

Document 09 owns:

- mana;
- spells;
- runes;
- rituals;
- wards;
- magical networks;
- corruption.

Automation may consume magic through typed ports/capabilities.

---

# 107. Automation Runtime

Document 08 uses graph/network services.

Recommended pattern:

- definitions;
- network topology;
- ports;
- buffers;
- power/mana provider snapshots;
- transactions;
- dirty incremental rebuild.

---

# 108. No Tick Per Machine Rule

Dormant/steady machines should not require `_process()` every frame.

Prefer:

- event-driven wake;
- scheduler;
- network batch;
- time-to-next-transition.

---

# 109. Logistics Conservation

Machine/network transfers use the same authoritative inventory/resource transaction layer.

No distant simulation creates outputs without consuming inputs.

---

# 110. Quest/Event Runtime

Document 15 is evidence-driven.

Technical runtime needs:

- QuestInstance store;
- EventInstance store;
- objective subscriptions;
- evidence index;
- scheduled deadlines;
- event density budgets;
- Chronicle storage.

---

# 111. Quest Evaluation

Avoid scanning every objective every frame.

Index subscriptions by:

- evidence type;
- subject;
- system;
- region;
- world-time wakeup.

---

# 112. Chronicle

Store structured history records.

Generated prose is presentation derived from evidence.

---

# 113. Combat Runtime

Combat active entities require low-latency local execution.

Persistent aftermath is handed to:

- biology;
- items;
- structures;
- quests/events;
- social;
- politics.

---

# 114. Maritime Runtime

Adopt 26O service-led architecture.

Logical services include:

- Fluid Simulation;
- Marine Field;
- Aquatic Interaction;
- Vessel;
- Vessel Movement;
- Shipwright;
- Vessel Forge;
- Port;
- Crew;
- Voyage/Fleet;
- Naval Encounter;
- Marine Ecology;
- Maritime Quest/Event adapter;
- Maritime Save adapter.

Exact code names remain repository-mapped.

---

# 115. UI Runtime

Document 17 locks:

- read-only view models;
- validated commands;
- reason codes;
- knowledge filtering;
- freshness/confidence;
- split-screen roots.

UI Node state is presentation state.

---

# 116. View-Model Adapter

Each gameplay owner exposes bounded data.

A UI adapter:

- combines permitted fields;
- applies knowledge/permission filter;
- creates presentation tokens;
- subscribes to revisions.

It does not mutate authoritative records.

---

# 117. UI Update Cadence

Use event-driven updates.

Large lists use:

- virtualisation;
- pagination/filtering;
- incremental diff.

---

# 118. Notifications

Systems emit semantic warning/event data.

Notification router chooses presentation according to:

- severity;
- player settings;
- accessibility;
- split-screen context.

---

# 119. Settings Runtime

Settings registry distinguishes:

- device;
- player;
- accessibility;
- gameplay assist;
- world;
- simulation depth;
- multiplayer/server;
- developer.

---

# 120. Performance Profile

Device-local.

May change rendering/presentation/update budgeting.

Does not change world rules by default.

---

# 121. Simulation Depth

World-authoritative.

May alter:

- cohort versus individual granularity;
- background actor count;
- event detail;
- market locality;
- ecology graph detail;
- history detail.

Changes require explicit migration policy.

---

# 122. Difficulty / Consequence

World/policy-level rule.

Separate from performance and simulation depth.

---

# 123. Accessibility

Presentation accessibility is per-player.

Mechanical assists are explicit authoritative modifiers where applicable.

---

# 124. Save Architecture

The save system stores persistent truth, not every rebuildable runtime product.

Logical save components:

- World Manifest;
- content/pack lock;
- registry snapshot identity;
- world-profile state;
- generated-base metadata;
- region/chunk deltas;
- domain state shards;
- persistent entity records;
- scheduler state;
- quest/event/history;
- realm state;
- moving-frame/vessel state;
- migration history;
- transaction journals;
- checksums;
- backup metadata.

---

# 125. World Manifest

Conceptual:

```yaml
world_manifest:
  world_id: <id>
  schema_version: <version>
  created_build_id: <id>
  current_build_id: <id>
  root_seed: <seed>
  world_profile_ref: <id>
  pack_lock_ref: <id>
  registry_snapshot_ref: <id>
  generator_versions: {}
  active_realm_refs: []
  save_generation: <n>
  last_committed_world_time: <time>
  migration_history_refs: []
  integrity_refs: []
```

---

# 126. Save Shards

Logical shards may include:

- global;
- regions;
- entities;
- structures;
- settlements;
- economy;
- social;
- biology;
- movement;
- realms;
- quests/events;
- maritime.

Exact physical file format/sharding is repository/profiling dependent.

---

# 127. Atomic Save Procedure

Conceptual process:

1. freeze save generation ID;
2. request consistent domain snapshots;
3. flush required journals;
4. serialise into temporary generation;
5. calculate integrity hashes;
6. validate manifest;
7. atomically promote generation;
8. retain previous good generation/backup;
9. report committed success.

---

# 128. Save Failure

If promotion fails:

- previous save remains valid;
- current session remains active if safe;
- UI reports failure truthfully;
- temporary files are quarantined/cleaned according to policy.

---

# 129. Autosave

Autosave must never report success before atomic promotion.

---

# 130. Save Journals

Use journals for:

- high-value transactions;
- migration;
- world-setting change;
- long-running project state;
- cross-domain commits

where crash recovery requires them.

---

# 131. Recovery

Recovery can:

- detect last good generation;
- restore backup;
- dry-run migration;
- quarantine missing pack content;
- rebuild generated caches.

It does not guess silently.

---

# 132. Rotating Backups

Backup policy is configurable and bounded.

Keep:

- last good;
- migration pre-image;
- important manual snapshots.

Exact counts depend on storage profile.

---

# 133. Migration

Every schema-changing release declares:

- source version;
- destination version;
- affected domains;
- alias changes;
- save changes;
- dry-run;
- rollback or backup policy;
- validation.

---

# 134. Migration Is Versioned Code/Data

Migration scripts/descriptors are source-controlled.

They are not one-off editor operations.

---

# 135. Save Dry Run

`CMD-SAVE-DRYRUN` operates on a copy.

Never overwrite the last good fixture.

---

# 136. Missing-Pack Recovery

When definitions disappear:

- keep persistent instance;
- resolve alias;
- quarantine unsupported fields;
- use explicit placeholder;
- record reason.

---

# 137. Derivable Caches

Do not save as authoritative truth unless necessary:

- meshes;
- nav caches;
- UI view models;
- presentation LOD;
- transient particle state;
- rebuildable spatial indexes.

---

# 138. Simulation LOD Architecture

All major domains support:

- local detailed;
- regional/reduced;
- distant summary;
- dormant/scheduled.

Exact names differ by domain.

---

# 139. Global Presence State

Technical/world authority maintains a universal presence class such as:

- active local;
- active remote;
- disconnected persistent;
- safely suspended;
- protected rest;
- abstract simulation;
- unavailable.

Each domain owns its payload.

---

# 140. Promotion / Demotion

Promotion/demotion:

- preserve stable ID;
- preserve quantities;
- preserve ownership;
- preserve state;
- preserve history;
- preserve revisions.

No reroll.

---

# 141. LOD Is Representation, Not Alternate Truth

If a distant bridge is destroyed, loading it later produces a destroyed bridge.

If a distant NPC is injured, promotion preserves injury.

---

# 142. Bounded Catch-Up

Do not simulate one million missed ticks.

Use analytic/event-based catch-up:

- production batches;
- crop phase;
- biological integration;
- contract deadlines;
- travel progress;
- settlement summaries.

---

# 143. Catch-Up Limits

Harsh irreversible outcomes may require:

- warning;
- protection;
- bounded maximum;
- server-running policy.

---

# 144. Distant Transactions

Abstract systems still use:

- reservations;
- stock;
- costs;
- conservation.

---

# 145. Simulation Depth Implementation

Simulation Depth changes granularity by selecting:

- promotion thresholds;
- cohort rules;
- retained minor actors;
- market node density;
- political actor budgets;
- event density;
- history retention;
- update cadence.

Each change is a declared world profile.

---

# 146. Full Does Not Mean Unbounded

Even Full uses:

- cohorts;
- LOD;
- scheduling;
- dirty updates;
- bounded work.

No requirement for every fish or coin to be a permanent Node.

---

# 147. Multiplayer Architecture

Use authoritative client/server semantics.

The same authority boundary applies in solo.

---

# 148. Modes

Architecture should support:

- solo local authority;
- split-screen local players;
- listen server;
- LAN;
- dedicated server.

Exact final networking product scope is governed by later multiplayer work.

---

# 149. Server Owns Consequential State

Server/authority owns:

- world edits;
- inventory;
- NPCs;
- combat result;
- movement authoritative state;
- economic transactions;
- quests/events;
- realm transitions;
- vessel state;
- settings.

---

# 150. Client Prediction

Permitted for responsiveness:

- local movement;
- camera;
- animation;
- projectile presentation;
- safe UI feedback.

Server corrects authoritative truth.

---

# 151. Interest Management

Replication uses relevance.

Interest may consider:

- spatial proximity;
- party;
- active quest;
- owned settlement;
- vessel;
- combat;
- UI subscription;
- strategic admin view.

---

# 152. No World-Wide High-Frequency Replication

Distant systems replicate:

- summaries;
- state changes;
- events

not transforms every frame.

---

# 153. Network Identity

Replication uses persistent IDs, not NodePath identity.

---

# 154. Replication Revisions

State messages include revisions where stale ordering matters.

---

# 155. Reconnect

Reconnect restores:

- player identity;
- authoritative presence;
- current realm;
- spatial frame;
- inventory;
- quest;
- social/party state.

---

# 156. Disconnect

World policy decides whether actor becomes:

- persistent;
- safely suspended;
- protected rest;
- removed from active world.

No specialist system invents its own disconnect interpretation.

---

# 157. Host Migration

Architecture must avoid unnecessarily blocking future host migration.

A production promise of seamless host migration is not made here without later networking proof.

---

# 158. Split-Screen

Each local player has:

- input context;
- camera;
- UI root;
- focus;
- accessibility profile;
- authority identity.

Shared world state is one authority.

---

# 159. Moving-Frame Networking

Characters aboard vessels require:

- frame ID;
- local transform;
- authoritative vessel transform;
- attachment revision.

Network reconciliation must avoid jitter from double world-space correction.

---

# 160. Vessel Snapshot Rate

26O suggests prototype ranges such as 10–20 Hz authoritative vessel snapshots with interpolation/prediction.

These remain **prototype targets**, not final locked values.

---

# 161. Security Boundary

Never trust client-provided:

- inventory quantities;
- money;
- damage;
- item IDs;
- world edits;
- ownership;
- quest completion;
- destination;
- save payload.

Validate intent.

---

# 162. Mod Security

Initial player packages are data-only through restricted schemas.

No arbitrary scripts/executables inside ordinary content packs.

---

# 163. Scripted Mod Policy

If executable mod scripting is ever admitted, it requires a separate security architecture and approval.

---

# 164. Forge Architecture

Forge source is editable authoring truth.

Runtime product is baked/compiled.

---

# 165. Forge Separation

Examples:

- Block Forge source;
- Item Forge source;
- Blueprint source;
- Creature source;
- Vessel source;
- animation source.

These export canonical manifests/products.

Runtime does not need editor graph state.

---

# 166. Forge Bake Metadata

Every baked product records:

- source ID;
- source revision;
- tool version;
- semantic hash;
- dependencies;
- validation result.

---

# 167. Runtime Rebuildability

Derived products should be rebuildable when practical.

Examples:

- mesh;
- collision;
- thumbnail;
- marker table;
- compact voxel bake.

---

# 168. Developer Tools

Required development tools conceptually include:

- Registry Browser;
- ID/Alias Inspector;
- Pack Resolver;
- Dependency Graph;
- Worldgen Stage Viewer;
- Seed Runner;
- Chunk Inspector;
- Block Edit Inspector;
- Structure Inspector;
- NPC/Creature LOD Inspector;
- Automation Graph Viewer;
- Route/Navigation Debugger;
- Realm Network Inspector;
- Vessel Inspector;
- Save Inspector;
- Migration Dry-Run Viewer;
- Transaction Journal Viewer;
- Reason-Code Browser;
- Performance Dashboard;
- Network Authority Inspector.

---

# 169. Structured Logging

Logs include:

- category;
- severity;
- world/build ID;
- subject IDs;
- event/transaction ID;
- reason codes;
- revision.

Avoid human-only unparseable logs for critical systems.

---

# 170. Log Categories

Examples:

- registry;
- pack;
- worldgen;
- save;
- migration;
- simulation;
- inventory;
- automation;
- movement;
- combat;
- economy;
- social;
- biology;
- realm;
- maritime;
- UI;
- network.

---

# 171. Build Identity

Every packaged build exposes:

- build ID;
- commit/revision;
- Godot version;
- registry snapshot;
- pack lock;
- schema versions;
- feature profile.

---

# 172. World Signature

A world records:

- seed;
- world profile;
- generator versions;
- pack lock;
- registry snapshot;
- save schema.

---

# 173. Diagnostics Bundle

A player-support diagnostic can include:

- build signature;
- world signature;
- recent errors;
- enabled packs;
- save health;
- performance summary

without exposing private player data unnecessarily.

---

# 174. Validation Architecture

Adopt Set 25E assurance layers.

Validation includes:

- schema;
- identity;
- ownership;
- references;
- relationships;
- capabilities;
- suitability;
- completeness;
- packs;
- POC leakage;
- deterministic seeds;
- progression;
- saves;
- migrations;
- LOD;
- conservation;
- multiplayer;
- performance;
- assets;
- localisation;
- accessibility;
- player trust.

---

# 175. Validator Identity

Every validator has:

- validator ID;
- version;
- owner;
- inputs;
- deterministic/tolerance classification;
- output schema;
- severity rules;
- gates.

---

# 176. Test Suite Identity

Every suite records:

- suite ID/version;
- validators;
- fixtures;
- command;
- evidence output;
- retention;
- gate.

---

# 177. Evidence

A green result without retained evidence does not satisfy a release gate.

Evidence includes:

- build/profile;
- pack lock;
- seed/world;
- tool versions;
- timestamps;
- failures;
- metrics;
- source revision.

---

# 178. Command-ID Contract

Set 25L establishes stable command IDs.

Document 18 retains them:

- `CMD-DOC-AUDIT`
- `CMD-REG-VALIDATE`
- `CMD-PACK-RESOLVE`
- `CMD-REG-COMPILE`
- `CMD-POC-SCAN`
- `CMD-TEST-HEADLESS`
- `CMD-SEED-BATCH`
- `CMD-REACHABILITY`
- `CMD-SAVE-DRYRUN`
- `CMD-PROFILE-PACKAGED`
- `CMD-EVIDENCE-FREEZE`

---

# 179. Exact Command Syntax

The exact shell/Godot/Summer Engine command mapped to each ID is **Repository-Audit Required**.

This document does not fabricate it.

---

# 180. Headless Tests

Godot headless execution should run:

- unit tests;
- schema tests;
- registry tests;
- integration fixtures;
- save tests;
- seed tests where feasible.

Exact test framework is repository-audit dependent.

---

# 181. Test Layers

Recommended layers:

1. pure unit;
2. schema/data;
3. service integration;
4. deterministic fixture;
5. world/seed;
6. save/migration;
7. multiplayer authority;
8. performance;
9. manual feel/accessibility;
10. release gate.

---

# 182. Negative Tests

Every critical validator needs invalid fixtures.

Examples:

- duplicate ID;
- duplicate Block/Item identity;
- missing pack;
- bad alias;
- stale transaction;
- double reward;
- impossible route;
- bad migration;
- POC leak.

---

# 183. POC Scan

Shipping profiles fail if code/data/scenes/manifests/localisation require:

- Forest Hamlet;
- fixed Watchtower arc;
- fixed Goblin raid;
- fixed rune ruin;
- fixed mana pocket;
- fixed portal;
- Unreal asset path;
- POC-only identity.

Archive/test profile is exempt.

---

# 184. Progression Reachability

`CMD-REACHABILITY` proves required capability paths.

Inputs include:

- world seed/profile;
- pack lock;
- resources;
- routes;
- permissions;
- alternatives.

---

# 185. Conservation Ledger

Testing records creation/destruction/transfer for:

- inventory;
- currency;
- cargo;
- automation;
- resources.

Unexpected net creation is release-blocking.

---

# 186. Save Matrix

Save tests cover:

- new world;
- long world;
- active combat;
- active quest;
- active contract;
- moving vessel;
- realm travel;
- missing optional pack;
- migration;
- interrupted save.

---

# 187. LOD Matrix

For each domain:

```text
Detailed
→ Demote
→ Distant Advance
→ Save
→ Load
→ Promote
→ Compare
```

---

# 188. Network Matrix

Validate:

- join;
- reconnect;
- stale command;
- inventory race;
- simultaneous block edit;
- combat;
- vessel;
- split-screen + online;
- content mismatch.

---

# 189. Performance Philosophy

Performance budgets are evidence gates.

Average FPS alone is insufficient.

Measure:

- CPU frame percentiles;
- GPU frame percentiles;
- hitch duration;
- memory;
- physics;
- simulation backlog;
- streaming latency;
- save duration;
- load duration;
- network bandwidth;
- UI update cost.

---

# 190. Reference Hardware

Exact reference hardware is **not locked** in the current source.

Document 18 requires three eventual measured classes:

- lower-bound supported;
- representative target;
- development/high-end.

---

# 191. Packaged Profiling

Performance decisions use packaged builds, not editor-only results.

---

# 192. Representative Scenarios

Profiles should include:

- new seed start;
- dense settlement;
- factory/automation;
- combat;
- large construction edit;
- deep cave;
- realm;
- port;
- vessel;
- naval encounter;
- split-screen;
- long save/load.

---

# 193. Performance Baseline

A baseline records:

- build;
- hardware;
- scenario;
- world seed;
- pack lock;
- settings;
- metrics;
- trace link.

---

# 194. Regression Policy

A performance regression triggers review based on:

- budget threshold;
- repeated percentile shift;
- hitch increase;
- memory growth;
- save/load increase.

---

# 195. Scalability Layers

Separate:

- graphics/render;
- presentation density;
- local LOD promotion;
- scheduling budget;
- world Simulation Depth.

---

# 196. Lower-End Strategy

Prefer:

1. render reduction;
2. VFX reduction;
3. presentation actor LOD;
4. work spreading;
5. cache/streaming optimisation;
6. explicit player-selected Simulation Depth only if desired.

---

# 197. No Hidden Simplification

A device profile cannot change:

- market formula;
- NPC death;
- inventory quantity;
- route existence;
- quest result.

---

# 198. Provisional Maritime Budgets

Set 26O provides prototype targets including:

- small vessel local voxels `<= 2,500`;
- medium `<= 12,000`;
- large `<= 35,000`;
- exceptional stress `<= 60,000`;
- full-detail nearby vessels 4 target / 8 stress;
- detailed compartments 64 target / 128 stress;
- incremental vessel edit commit `< 50 ms` main-thread target;
- helm input-to-visible response `< 100 ms` local target.

These are technical-spike targets, not final gameplay limits.

---

# 199. Voxel Budgets

Exact terrain chunk/mesh budgets require profiling.

Document 18 does not invent MB/frame targets without the repository and representative build.

---

# 200. Simulation Backlog Budget

Every scheduled domain exposes:

- queue depth;
- oldest age;
- work duration;
- dropped/failed work.

No invisible backlog starvation.

---

# 201. UI Budget

Large screens:

- virtualise lists;
- update on revisions;
- avoid full rebuild per frame;
- reduce animations on low-end.

---

# 202. Network Budget

Use:

- interest management;
- compressed deltas;
- event replication;
- low-frequency distant snapshots.

---

# 203. Save Budget

Save must be:

- incremental where practical;
- atomic;
- bounded;
- background-prepared where safe.

Promotion remains authoritative.

---

# 204. Memory Budget

Major memory groups:

- voxel chunks;
- generated meshes;
- collision;
- navigation;
- active actors;
- registry data;
- assets;
- vessels;
- UI;
- save staging.

---

# 205. Cache Eviction

Derived caches are evictable.

Persistent truth is not evicted without durable storage.

---

# 206. Asset Budgets

25K remains asset-budget authority.

Runtime enforces:

- texture;
- material;
- mesh;
- animation;
- audio;
- VFX;
- socket/event manifest

constraints through validated manifests.

---

# 207. Texture Direction

Base voxel texture direction remains 32×32.

Variation is driven by:

- seed;
- biome;
- rarity;
- state;
- magic;
- corruption;
- damage;
- age;
- culture

through approved presentation data.

---

# 208. Asset Identity

Asset paths are not gameplay identity.

Definitions reference presentation assets through validated refs.

---

# 209. Localisation

User-facing text uses localisation keys.

Generated names use stable identity plus localised supporting grammar.

---

# 210. Accessibility Technical Contract

UI/Presentation components expose:

- semantic role;
- labels;
- focus;
- non-colour state;
- caption hooks;
- reduced-motion variants.

---

# 211. Accessibility Does Not Suppress Events

A VFX can be reduced.

The authoritative gameplay event remains.

---

# 212. Audio

Audio is event-driven where possible.

Avoid one permanent emitter Node per distant source.

---

# 213. VFX

Use:

- pooling;
- relevance;
- LOD;
- accessibility variants.

---

# 214. Presentation Adapters

Gameplay events map to:

- animation;
- audio;
- VFX;
- camera;
- haptic;
- captions.

Adapters do not mutate gameplay.

---

# 215. Physics Boundary

Physics owns immediate physical calculation.

Persistent semantic state is committed through owner services.

---

# 216. Fixed-Step / Frame-Step

Exact Godot physics tick configuration is repository/profile dependent.

Gameplay must not assume render FPS equals simulation tick.

---

# 217. Physics Authority

Multiplayer:

- server authoritative for consequential physics outcome;
- clients predict/interpolate where safe.

---

# 218. Tolerance-Based Tests

Real-time physics tests may validate:

- position envelope;
- stability band;
- collision result;
- bounded drift

rather than exact floating-point replay.

---

# 219. World Physics and Realms

Document 14 provides realm environment fields.

Movement/physics consumes:

- gravity;
- local-up;
- drag;
- buoyancy;
- external forces.

Avoid realm-name `if` branches.

---

# 220. Data-Oriented Service Principle

High-volume state should prefer:

- arrays;
- maps;
- compact records;
- indexed stores;
- graphs.

Do not require Node inheritance to represent data.

---

# 221. Node Promotion Principle

A record receives a Node only when needed for:

- physics;
- interaction;
- animation;
- audio;
- visible AI;
- editor preview.

---

# 222. Node Demotion

On unload:

- commit runtime state to records;
- detach presentation;
- release caches;
- preserve persistent identity.

---

# 223. Autoload / Global Service Policy

Godot Autoloads may be appropriate for truly global application services.

Do not make every domain an Autoload by convenience.

Exact Autoload list requires repository architecture review.

---

# 224. Dependency Injection / Service Access

Use a consistent service-location/context strategy.

Requirements:

- testability;
- world isolation;
- multiple world/session support where needed;
- no hidden NodePath dependency.

Exact pattern is TEC-001 decision.

---

# 225. Multiple Worlds / Sessions

Editor/tests/server may need more than one isolated world context.

Avoid hard-coded singleton mutable globals that make parallel fixtures impossible.

---

# 226. World Context

A WorldContext concept should provide:

- world ID;
- time;
- authority;
- registries;
- scheduler;
- save;
- domain services;
- event/evidence routing.

Exact class name remains audit/TEC-001 decision.

---

# 227. Application Context

Application-level services may include:

- build identity;
- content pack discovery;
- settings;
- localisation;
- user profile;
- world library.

---

# 228. Domain Service Isolation

A domain service only writes its owned state.

Cross-domain requests use public interface.

---

# 229. Direct References

Direct object references are acceptable within a tightly owned loaded subsystem.

Persistent cross-domain/save references use stable IDs.

---

# 230. Dependency Cycles

Technical dependency cycles are release blockers.

Use:

- interface inversion;
- event/evidence;
- adapter;
- shared kernel

rather than mutual concrete imports.

---

# 231. Shared Kernel Scope

The shared kernel stays small.

It may contain:

- IDs;
- result/reason;
- world time;
- authority;
- transaction/evidence envelopes;
- spatial refs;
- basic immutable data primitives.

It must not become a dumping ground for gameplay formulas.

---

# 232. Result Type

Commands return structured result:

```yaml
result:
  success: <bool>
  reason_codes: []
  committed_event_refs: []
  new_revision: <rev>?
  corrective_action_refs: []
```

---

# 233. Reason Codes

Reason codes are stable machine IDs.

Text/localisation is separate.

---

# 234. Transaction Record

Conceptual:

```yaml
transaction:
  transaction_id: <id>
  owner: <system>
  initiator_ref: <id>
  subject_refs: []
  expected_revisions: {}
  reservations: []
  operations: []
  state: validating
  reason_codes: []
  started_world_time: <time>
  committed_world_time: <time>?
```

---

# 235. Reservation

Reservations prevent double use of:

- inventory;
- money;
- berth;
- route capacity;
- machine capacity;
- project materials.

---

# 236. Reservation Expiry

Reservation lifecycle uses world/system time and explicit cancellation.

No permanent leaked locks.

---

# 237. Cross-Domain Transactions

Prefer orchestrated saga/commit patterns rather than one service directly editing another's private storage.

---

# 238. Failure Compensation

If a multi-domain operation partially commits, recovery uses:

- journal;
- compensating transaction;
- retry;
- safe quarantine.

Never quietly forget half the operation.

---

# 239. World Edit History

High-value world edits may retain:

- actor;
- before/after;
- transaction;
- time;
- reason.

Useful for:

- multiplayer disputes;
- recovery;
- debugging;
- undo where supported.

---

# 240. World Settings

World-setting changes are transactions.

Record:

- old value;
- new value;
- authority;
- migration;
- world time.

---

# 241. Simulation Profile Migration

Changing Simulation Depth may require:

- cohort aggregation;
- new detail generation;
- new-region-only rules;
- backup.

UI displays limitations.

---

# 242. Content Hot Reload

Developer hot reload is allowed only when:

- definition compatibility permits;
- world/server context accepts;
- persistent state is not invalidated.

Production multiplayer does not casually hot-reload gameplay registries.

---

# 243. Editor Tooling

Godot editor plugins may provide:

- registry validation;
- definition inspection;
- Forge import;
- blueprint preview;
- seed preview;
- world debug.

Canonical data remains external/interchange as declared.

---

# 244. Tool Separation

Editor tools can generate runtime products.

Runtime should not require editor plugin code.

---

# 245. Source Provenance

Every compiled definition and important asset product can trace to:

- source file;
- source record;
- importer;
- version;
- pack;
- commit.

---

# 246. Build Reproducibility

A release candidate should be reproducible from:

- repository revision;
- toolchain versions;
- pack lock;
- generation commands.

---

# 247. CI

Exact CI provider is pending repository audit.

Required logical jobs:

- source audit;
- registry validation;
- pack resolve;
- registry compile;
- unit/headless tests;
- POC scan;
- seed smoke;
- save fixture;
- package;
- performance gate where scheduled;
- evidence bundle.

---

# 248. CI Change Scope

Fast CI runs bounded affected suites.

Nightly/milestone expands coverage.

---

# 249. Evidence Retention

Retain:

- release bundle;
- migration fixtures;
- golden seeds;
- blocker reproductions;
- performance baselines.

Raw traces can use tiered retention.

---

# 250. Branch Discipline

Every Summer Engine implementation task uses:

- dedicated branch/change set;
- task ID;
- declared changed files;
- tests;
- evidence.

---

# 251. Task Contract

Every task contains:

- ID/title;
- source authority;
- current-state evidence;
- dependencies;
- objective;
- in/out scope;
- changed files;
- data/migration effect;
- command IDs;
- acceptance tests;
- evidence;
- rollback;
- risk/debt;
- owner/reviewer.

---

# 252. Task Size Rule

Normally one task produces one bounded:

- service;
- schema family;
- importer;
- validator;
- migration;
- data batch;
- UI flow;
- fixture set.

---

# 253. No Broad “Implement X” Task

Invalid:

> Implement world generation.

Valid:

> Implement deterministic definition envelope and one cross-domain fixture with unit tests and rollback.

---

# 254. Architecture Decision Records

Create ADR when changing:

- service topology;
- canonical format;
- persistence format;
- network authority;
- native extension;
- chunk size lock;
- physics model;
- major dependency.

---

# 255. ADR Template

```text
ADR ID
Status
Context
Decision
Alternatives
Consequences
Migration
Validation
Rollback
Approver
```

---

# 256. Technical Debt

Debt has:

- ID;
- owner;
- reason;
- impact;
- expiry/review milestone;
- gate impact.

“Later” is not an owner.

---

# 257. Release Gates

Adopt Set-25 gates.

---

# 258. G0 — Source Baseline

Exit requires:

- canonical document bundle;
- POC inventory;
- repository audit;
- blocker/debt register.

**Current documentation pass does not claim G0 complete because the repository audit is absent.**

---

# 259. G1 — Production Documentation

Exit requires:

- Document 18 v1.0;
- required 00–17 production revisions;
- approved indexes/supersession.

Documents 19–20 continue through their planned reconciliation lane.

---

# 260. G2 — Technical Test Foundation

Requires:

- service topology;
- logging/build identity;
- test harness;
- CI;
- command/event/transaction foundation;
- scheduler;
- authority context;
- feature profiles.

---

# 261. G3 — Registry & Validation Vertical

Requires:

- definition envelope;
- schema/facet registry;
- pack resolver;
- compiler;
- representative optional pack;
- validation;
- rollback.

---

# 262. G4 — Core Data Foundation

Requires:

- reconciled Block/Item/Recipe/Resource data;
- capability reachability;
- registry snapshot candidate.

---

# 263. G5 — Seed World Kernel

Requires:

- multiple regions/biomes;
- placements;
- deterministic repair;
- seed corpus;
- no POC dependency.

---

# 264. G6 — Persistent Living Slice

Requires:

- survival;
- gathering;
- crafting;
- building;
- NPC settlement;
- ecology;
- automation;
- magic;
- threat;
- aftermath;
- save;
- LOD.

Not a recreation of Forest Hamlet.

---

# 265. G7 — Adventure, Realm & Presentation

Requires:

- sites;
- major threats;
- selected realm content;
- Forge/runtime products;
- UI/accessibility;
- packaged profiles.

---

# 266. G8 — Core Integration Candidate

Requires:

- frozen pack lock;
- migrations;
- performance;
- authority;
- accessibility;
- human review.

---

# 267. G9 — Set 26 Integration Closure

Requires selected maritime packages:

- schemas;
- tests;
- migration;
- performance;
- downstream ownership closure.

---

# 268. G10 — Release Candidate

Requires:

- all selected gates pass;
- frozen evidence bundle;
- Ash approval.

---

# 269. Implementation Sequence

Recommended production sequence follows the gate structure.

---

# 270. Phase 0 — Repository Audit

Do:

- DOC-003.

Output:

- real project map.

No code changes.

---

# 271. Phase 1 — Technical Kernel

Implement first:

- service topology;
- build identity;
- logging;
- test harness;
- command/event/transaction kernel;
- scheduler;
- authority context;
- feature profile.

---

# 272. Phase 2 — Registry Vertical

Implement:

- qualified IDs;
- schema/facet registry;
- pack resolver;
- compiler;
- generated Godot Resource output;
- representative cross-domain fixture.

---

# 273. Representative Fixture Rule

Prove one thin chain before bulk conversion.

The fixture should exercise:

- Block;
- Block Inventory Projection;
- Item;
- Recipe;
- Resource;
- structure;
- one optional pack;
- save;
- UI read model.

---

# 274. Phase 3 — Core Data Conversion

Convert:

- 217 Block families;
- 286 canonical Item families;
- 105 chain contracts;
- 15 substitutions

in bounded batches.

---

# 275. Phase 4 — Voxel / World / Save Kernel

Implement:

- chunk storage;
- Block edit transactions;
- meshing;
- collision;
- streaming;
- worldgen stages;
- generated-base + delta;
- save coordinator;
- migration;
- recovery.

---

# 276. Phase 5 — Time / LOD / Presence

Implement:

- world time;
- scheduler;
- presence;
- promotion/demotion;
- catch-up;
- workload budgets.

---

# 277. Phase 6 — Living World

Implement bounded verticals for:

- NPC;
- settlement;
- inventory/logistics;
- ecology;
- economy;
- social;
- biology.

---

# 278. Phase 7 — Automation / Magic / Infrastructure

Implement:

- network graphs;
- machines;
- mana;
- wards;
- facilities;
- project transactions.

---

# 279. Phase 8 — Movement / Combat

Implement shared movement API before specialist movers.

Then:

- locomotion;
- traversal;
- navigation;
- combat;
- mounts;
- vehicles;
- route journeys.

---

# 280. Phase 9 — Adventure Runtime

Implement:

- structures/sites;
- quests/events;
- major threats;
- persistent aftermath.

---

# 281. Phase 10 — UI / Accessibility

Implement:

- view-model framework;
- command bridge;
- notifications;
- menus;
- world creation;
- settings;
- accessibility;
- recovery UI.

UI work begins earlier for test tools but full player shell follows stable APIs.

---

# 282. Phase 11 — Realms

Implement:

- RealmInstance;
- environment law snapshots;
- route/anchor;
- transition transactions;
- safe return;
- realm streaming.

---

# 283. Phase 12 — Maritime

Implement selected Set-26 packages through G9:

- marine fields;
- fluid islands;
- aquatic movement;
- vessels;
- ports;
- maritime economy/event/UI.

---

# 284. Phase 13 — Multiplayer Hardening

After authoritative local model proves:

- replication;
- prediction;
- reconnect;
- split-screen + network;
- content handshake;
- admin/permission;
- soak.

---

# 285. Phase 14 — Performance / Release

- packaged profiling;
- baseline comparison;
- seed QA;
- migration suite;
- accessibility review;
- human playtest;
- evidence freeze.

---

# 286. Parallelisation

Work may proceed in parallel only after shared contracts are stable.

Examples:

- asset authoring after schemas;
- UI mockups against fake read-only VMs;
- realm content after registry/world contracts;
- Set 26 technical spikes after spatial-frame kernel.

---

# 287. Do Not Bulk-Convert Too Early

The representative registry/validation fixture must pass before mass data conversion.

This prevents hundreds of entries encoding the wrong schema.

---

# 288. Do Not Build Presentation Before Truth

A pretty market screen does not substitute for Set-27 transaction state.

A ship model does not substitute for VesselInstance.

---

# 289. Vertical Slice Direction

The production technical slice should prove the **game identity**, not recreate the POC.

A suitable slice needs several connected generated contexts and capabilities.

---

# 290. Production Vertical Slice Must Prove

- seed-generated world;
- gathering;
- crafting;
- Block placement;
- persistent inventory;
- generated people;
- settlement need;
- construction;
- automation;
- magic;
- ecology;
- combat/threat;
- route/travel;
- quest/event evidence;
- save/load;
- LOD;
- UI;
- accessibility;
- performance.

---

# 291. No Fixed Slice Geography

The validation harness may use golden seeds.

But production logic cannot require:

- Forest Hamlet;
- fixed valley;
- fixed watchtower;
- fixed goblin camp.

---

# 292. Archive Regression Fixture

The old POC may remain in:

- archive content pack;
- automated fixture;
- manual regression.

It must be namespaced/isolated.

---

# 293. Unreal Retirement

Remove active dependencies on:

- UE modules;
- C++/Blueprint runtime instructions;
- Unreal Actor assumptions;
- World Partition assumptions;
- `/Game/...` path identity;
- UMG/CommonUI requirements;
- Enhanced Input requirements.

Equivalent gameplay capabilities are reimplemented through Godot.

---

# 294. Preserve Legacy IDs Carefully

Legacy content IDs migrate through aliases.

Engine asset paths do not become permanent IDs.

---

# 295. Technical POC Preservation Matrix

| Legacy Technical Capability | Production Treatment |
|---|---|
| Chunked voxel terrain | Preserve |
| Palette compression | Preserve |
| Async meshing | Preserve |
| Block entities | Preserve as records |
| Seed + delta saves | Preserve |
| Atomic save / backups | Preserve |
| Simulation LOD | Preserve |
| Stable IDs | Preserve and upgrade to 25B qualified IDs |
| Commands / Events | Preserve |
| Multiplayer authority | Preserve architecture |
| Split-screen | Preserve requirement |
| POC valley guarantee | Archive |
| Unreal Engine modules | Replace |
| Blueprint orchestration | Replace with Godot service/presentation architecture |
| Unreal actor-per-system assumptions | Replace |
| World Partition dependency | Replace |
| Forest Hamlet implementation stages | Archive |
| Unreal asset paths | Migration evidence only |

---

# 296. Block/Item Duplicate Technical Tests

Release-blocking checks include:

- recoverable Block has duplicate canonical Item;
- recipe outputs fake block-item;
- Item mirrors Block physical fields;
- Block projection missing where required;
- technical Block incorrectly projected.

---

# 297. Registry Integrity Tests

Check:

- malformed ID;
- conflicting owner;
- ambiguous alias;
- duplicate field owner;
- unresolved hard reference;
- pack cycle;
- schema mismatch.

---

# 298. Worldgen Tests

Check:

- deterministic equality;
- progression capability;
- start safety;
- route coherence;
- ecology;
- civilisation;
- repair rate;
- diversity;
- POC absence.

---

# 299. Save Tests

Check:

- atomicity;
- backup;
- migration;
- missing content;
- interrupted save;
- world-setting change;
- explored-world stability.

---

# 300. Simulation Tests

Check:

- detailed/distant equivalence;
- conservation;
- named actor preservation;
- time;
- scheduling;
- backlog.

---

# 301. Economy Tests

Check:

- currency conservation;
- contract idempotency;
- trade stock;
- transport evidence;
- public finance.

---

# 302. Social Tests

Check:

- knowledge vs truth;
- assignments vs movement;
- dialogue no hidden mutation;
- relationship persistence.

---

# 303. Biology Tests

Check:

- combat Damage Packet once;
- Stamina;
- injury;
- poison;
- treatment;
- distant integration.

---

# 304. Movement Tests

Check:

- authority;
- collision;
- clearance;
- moving frames;
- route accessibility;
- promotion/demotion.

---

# 305. Combat Tests

Check:

- attack;
- defence;
- damage handoff;
- no duplicate Health;
- impulse through movement;
- gear identity.

---

# 306. Maritime Tests

Check:

- water/fluid distinction;
- vessel local frame;
- structural graph;
- compartment;
- flooding;
- port;
- voyage;
- network;
- persistence.

---

# 307. UI Tests

Check:

- view model read-only;
- reason code;
- knowledge leakage;
- save truth;
- settings separation;
- split-screen focus;
- accessibility.

---

# 308. Multiplayer Tests

Check:

- authority;
- stale commands;
- retries;
- reconnect;
- moving frames;
- pack mismatch.

---

# 309. Soak Tests

Long-running tests cover:

- scheduler;
- memory;
- save growth;
- event accumulation;
- economy;
- population;
- routes;
- realm;
- vessels.

---

# 310. Mutation Tests

Where practical, deliberately corrupt:

- ID;
- manifest;
- save;
- transaction;
- alias;
- route;
- migration

and prove validators fail.

---

# 311. Crash / Hang Reporting

Packaged builds should support privacy-conscious crash/hang diagnostics.

Exact provider is pending technical decision.

---

# 312. Analytics

Player analytics are optional and privacy-conscious.

They must not be required for offline game correctness.

---

# 313. Offline-First Runtime

Core single-player functionality must not require remote services.

---

# 314. Future Online Services

Account/cloud/server services remain replaceable boundaries.

Gameplay save format should not depend on one third-party backend.

---

# 315. Build Configurations

Logical build profiles may include:

- Development;
- Test;
- Profile;
- Release;
- Dedicated Server;
- Archive Regression.

Exact export presets await repository audit.

---

# 316. Dedicated Server

Dedicated server build should avoid unnecessary:

- rendering;
- editor assets;
- client-only UI.

It still loads authoritative gameplay definitions.

---

# 317. Content Hash Handshake

Network join verifies:

- build compatibility;
- pack lock;
- gameplay definition hashes;
- schema versions.

Presentation-only differences may be handled separately if safe.

---

# 318. World Version Compatibility

A client cannot join if it cannot interpret authoritative world state.

---

# 319. Save Compatibility Window

Release policy defines supported migration versions.

Critical golden fixtures are retained across the compatibility window.

---

# 320. Dependency Policy

Third-party dependencies require:

- purpose;
- licence;
- maintenance status;
- version lock;
- replacement boundary;
- platform impact;
- security review.

---

# 321. Dependency Minimisation

Prefer Godot-native/built-in capabilities where they satisfy requirements.

Do not introduce libraries for trivial convenience.

---

# 322. Voxel Engine Decision

If Summer Engine already contains voxel functionality, the repository audit must determine:

- current capability;
- ownership;
- performance;
- save model;
- meshing;
- editing;
- licensing.

Document 18 does not assume its exact implementation.

---

# 323. Summer Engine Name Boundary

“Summer Engine” in project planning refers to the development/engine workflow used alongside Godot.

The shipped player should not need a separate AI orchestration stack.

---

# 324. Source-of-Truth Audit

Before implementing any domain, record:

- design owner;
- data owner;
- runtime owner;
- save owner;
- UI owner;
- external consumers.

---

# 325. Ownership Audit Example

`Iron Sword`

- Item definition — Doc04;
- material/resource context — Doc06;
- recipe — Doc05;
- combat facet — Doc16;
- Item condition — Item runtime;
- price — Set27 runtime;
- presentation asset — Forge/asset manifest.

---

# 326. Cross-System API Freeze

Public domain interfaces become versioned.

Breaking changes require:

- version;
- consumers;
- migration;
- tests;
- ADR.

---

# 327. API Types

Prefer:

- stable data records;
- small commands;
- typed result;
- snapshots.

Avoid exposing mutable internal arrays.

---

# 328. Revision Semantics

Mutable records increment revision when authoritative state changes.

Consumers can detect stale caches/commands.

---

# 329. Snapshot Semantics

Snapshot includes:

- owner;
- subject;
- revision;
- world time;
- fields.

It is read-only.

---

# 330. Cache Semantics

A cache records source revision.

If source changes, cache invalidates.

---

# 331. Derived Data

Derived data can be regenerated.

Do not treat it as canonical.

---

# 332. Field Ownership Metadata

Schema tooling can expose each field's:

- owner;
- authoring source;
- runtime/definition classification;
- persistence;
- replication;
- derivation.

---

# 333. Technical Definition of Ready

A task is Ready only if:

- source authority locked;
- repository state inspected;
- exact files known;
- dependencies pass;
- migration impact known;
- test/evidence plan exists;
- rollback exists.

---

# 334. Technical Definition of Done

A task is Done only if:

- code/data complete;
- declared tests pass;
- negative tests pass;
- generated products rebuilt;
- migration tested if applicable;
- docs/API updated;
- evidence retained;
- rollback verified where required;
- reviewer approves.

---

# 335. Feature Definition of Done

A gameplay feature additionally needs:

- authoritative owner;
- save;
- LOD;
- multiplayer boundary;
- UI view model;
- reason codes;
- accessibility;
- localisation;
- performance evidence;
- POC leakage check.

---

# 336. Release-Blocking Defects

Examples:

- item/currency duplication;
- save false-success;
- unrecoverable migration corruption;
- POC production dependency;
- invalid ownership duplication;
- authoritative client exploit;
- deterministic worldgen mismatch;
- blocked required progression;
- inaccessible critical UI;
- persistent state lost on LOD;
- missing pack silently deletes player content.

---

# 337. Waivers

Non-critical warnings may be waived only with:

- owner;
- reason;
- scope;
- expiry;
- gate;
- evidence.

Protected blockers are non-waivable.

---

# 338. Redesign Triggers

Trigger architecture review if:

- scene-tree state repeatedly becomes save truth;
- registry compiler cannot explain field provenance;
- most seeds require heavy repair;
- LOD promotion cannot preserve state;
- chunk edits cause unbounded main-thread stalls;
- vessel edits require full rescans constantly;
- network bandwidth depends on world size rather than relevance;
- save size grows primarily from derivable data;
- background simulation backlog never catches up;
- Godot/GDScript hotspot remains dominant after data/layout optimisation;
- one shared service becomes a gameplay dumping ground.

---

# 339. Native-Code Redesign Trigger

Move a subsystem to native only when:

- profiler proves it;
- algorithm/data design has already been optimised;
- native boundary is narrow;
- test parity exists.

---

# 340. Worldgen Redesign Trigger

If a large fraction of seeds pass only through heavy deterministic repair, fix:

- content constraints;
- generation;
- capability providers

rather than expanding repair indefinitely.

---

# 341. Save Redesign Trigger

If atomic save duration becomes unacceptable:

- shard;
- incremental snapshot;
- background preparation;
- journal

before sacrificing consistency.

---

# 342. Network Redesign Trigger

If moving-frame reconciliation is unstable, solve frame-relative networking rather than disabling vessel interiors.

---

# 343. UI Redesign Trigger

If a UI needs hidden formula copies to display data, build a proper view model from the owner.

---

# 344. Summer Engine Task Evidence

Each AI-assisted task retains:

- prompt/task card;
- changed-file list;
- diff;
- test results;
- evidence outputs;
- unresolved warnings.

---

# 345. No Autonomous Release

Summer Engine may prepare a candidate.

It cannot approve its own release gate.

---

# 346. Documentation Synchronisation

When public interface/schema changes:

- owning document;
- interface register;
- migration notes;
- task evidence

must update together.

---

# 347. Generated Documentation

Registry tooling may generate:

- ID indexes;
- schema references;
- dependency maps.

Generated docs are clearly marked.

---

# 348. Production Backlog Integration

Document 25L remains the high-level backlog/governance authority.

Document 18 supplies the technical architecture that makes its packages executable.

---

# 349. Initial Code Queue After G1

The first code-bearing sequence remains:

1. TEC-001 service topology;
2. TEC-002 logging/build identity;
3. TEC-003 test harness;
4. TEC-004 CI/evidence;
5. TEC-005 command/event/transaction;
6. TEC-006 time/scheduler/async;
7. TEC-007 feature/build profiles;
8. TEC-008 runtime authority;
9. REG-001 qualified definition envelope;
10. REG-002 schema/facet registry;
11. pack resolver/compiler;
12. POC scanner;
13. representative data fixture.

---

# 350. Repository Audit Can Change Names, Not Contracts

If the existing project already contains good equivalents, reuse them.

Do not rename functioning architecture merely to match illustrative names in this document.

---

# 351. Suggested Logical Service Map

The following is a **logical responsibility map**, not a claim about existing classes.

## Foundation

- Build Identity
- World Context
- Authority Context
- World Time
- Scheduler
- Async Work Queue
- Command Router
- Event/Evidence Router
- Transaction Journal
- Feature/Profile Resolver

## Registry / Pack

- Definition Registry
- Schema Registry
- Alias Resolver
- Relationship/Capability Index
- Pack Resolver
- Registry Compiler
- Source Provenance
- Validation

## World

- Voxel World
- World Generation
- Region Streaming
- Spatial Frames
- World State
- Simulation LOD
- Navigation World
- Save/Migration/Recovery

## Gameplay

- Inventory/Items
- Recipes/Resources
- NPC/Settlement
- Automation
- Magic
- Ecology
- Structures
- Civilisation
- Realms
- Quest/Event
- Combat
- Movement

## Expansion

- Maritime
- Vessel
- Port
- Fleet
- Marine Ecology

## Presentation

- View Models
- UI Shell
- Notification
- Presentation Adapters
- Accessibility
- Localisation

---

# 352. Dependency Direction

Conceptually:

```text
Presentation / UI
        ↓
Domain Public Interfaces
        ↓
Gameplay Domain Services
        ↓
Shared Technical Kernel
        ↓
Registry / Time / Authority / Persistence / Spatial
```

Domain services may consume each other only through approved interfaces.

---

# 353. No God Service

Reject a `GameManager` that owns:

- inventory;
- worldgen;
- NPCs;
- quests;
- economy;
- saves;
- UI

through one mutable singleton.

---

# 354. No NodePath Persistence

Never save:

```text
/root/World/NPCs/Goblin12
```

as identity.

Save persistent IDs.

---

# 355. No Filename Identity

Do not derive content identity from:

- JSON filename;
- Resource filename;
- spreadsheet row;
- Forge path.

---

# 356. No Display-Name Identity

Renaming “Oak Planks” cannot break saves.

---

# 357. No POC Tag Deletion

A POC-tagged object is not deleted merely because it appeared in the POC.

Use the Foundation reconciliation classification.

---

# 358. POC Classification

1. Gameplay Capability — Preserve
2. Reusable Content — Preserve/Generalise
3. POC Scenario Wrapper — Archive
4. Actually Superseded — Replace

---

# 359. POC Archive Build

Archive profile may preserve:

- old scenario;
- regression IDs;
- manual test fixture.

It is excluded from shipping world generation.

---

# 360. Technical Migration From Unreal

Migration tasks include:

- remove Unreal terminology in active docs/data;
- replace `/Game/...` identity references;
- convert design assets into Forge/Godot pipeline;
- rebuild technical tests;
- preserve stable gameplay IDs where practical.

No binary Unreal runtime compatibility is promised.

---

# 361. Main-Document Dependency State

Current Foundation status for this technical plan:

- 00–17 — reconciled v1.0;
- 18 — this complete replacement;
- 19–20 — consume current contracts but still scheduled for final production reconciliation;
- 21–23 — Forge system;
- 24 — Atlas;
- 25 — governance/registries/validation;
- 26 — maritime expansion;
- 27–30 — final reconciled specialist ownership.

---

# 362. Document 19/20 Technical Boundary

Until 19/20 reconciliation completes:

- do not hard-code obsolete POC milestones;
- consume current stable concepts:
  - settlement plans;
  - player blueprints;
  - seven needs;
  - projects;
  - facilities;
  - service records;
  - cultural building packs.

Their final v1.0 schemas may refine implementation.

---

# 363. Main-Menu / World-Settings Technical Boundary

Document 17 defines configuration semantics.

Technical implementation stores:

- world-profile record;
- device profile;
- player profile;
- accessibility profile;
- server rules.

---

# 364. Settings Persistence

Device settings:

- local profile.

Player settings:

- user profile.

World rules:

- world save/server.

Never mix them into one config file without scope metadata.

---

# 365. World Creation

New World build process:

1. resolve packs;
2. validate settings;
3. freeze world profile;
4. create seed;
5. create world manifest;
6. create generation versions;
7. run start validation;
8. create initial save generation.

---

# 366. World-Generation Cancellation

Cancelling creation must:

- clean incomplete temporary world;
- preserve logs/evidence;
- not leave world card claiming healthy save.

---

# 367. World Duplication

Duplicating a world creates:

- new world ID;
- copied save state;
- clear provenance.

Do not duplicate external server authority accidentally.

---

# 368. World Deletion

Delete uses:

- confirmation;
- optional backup/export;
- safe trash/recovery policy where feasible.

---

# 369. World Export

Export package records:

- world save;
- required pack list;
- version;
- integrity.

It does not need to bundle licensed pack assets unless permitted.

---

# 370. Performance vs Simulation

Technical configuration must enforce Document 17's separation.

A low-end device may run a Full simulation world using more aggressive LOD/scheduling if it remains within supported limits.

If not viable, UI recommends explicit simulation change.

---

# 371. Server Simulation Profile

For multiplayer, the authoritative host/server owns world Simulation Depth.

Client graphics do not change it.

---

# 372. Client Accessibility

Client presentation accessibility remains local where it does not affect mechanics.

---

# 373. Mechanical Assist Authority

If an accessibility assist changes gameplay:

- server/world policy defines allowed scope;
- command/input records carry resulting authoritative modifier.

---

# 374. Replay / Deterministic Debug

Not all physics supports exact replay.

A debug capture should still preserve:

- seed;
- inputs;
- commands;
- revisions;
- transactions;
- events;
- key snapshots.

---

# 375. Reproduction Bundle

A bug reproduction can package:

- build ID;
- world seed/profile;
- pack lock;
- save fixture;
- command/event trace;
- logs;
- expected/actual.

---

# 376. Performance Reproduction

Include:

- hardware;
- settings;
- scenario;
- camera/player count;
- world seed;
- active systems.

---

# 377. Developer Console

If implemented, commands are:

- permission-gated;
- logged;
- clearly non-production where destructive.

---

# 378. Cheats / Debug

Debug spawning must use explicit debug authority and avoid contaminating release validation saves unless marked.

---

# 379. Test Worlds

Test fixtures use isolated namespaces/profiles.

---

# 380. Golden Seeds

Golden seeds are regression evidence.

They do not become worldgen targets that all content is tuned around.

---

# 381. Manual Testing

Doc 99 remains historical POC regression guidance.

Production manual suites should be generated from v1.0 contracts.

---

# 382. Player Trust Technical Gate

Release fails if:

- save UI lies;
- transaction UI lies;
- stale knowledge is presented as live certainty;
- world setting impact is hidden;
- pack removal silently deletes content.

---

# 383. Accessibility Technical Gate

Release requires:

- keyboard/controller core flows;
- scalable text;
- non-colour critical cues;
- subtitle/caption paths;
- reduced motion;
- split-screen accessibility.

---

# 384. Fun / Feel Gate

Automated tests cannot approve:

- movement feel;
- combat feel;
- UI readability;
- world coherence;
- procedural blandness.

Human review remains required.

---

# 385. Production Candidate Freeze

A candidate freezes:

- build;
- repository revision;
- pack lock;
- registry snapshot;
- schema versions;
- world profile;
- test suites;
- performance settings.

---

# 386. Evidence Freeze

`CMD-EVIDENCE-FREEZE` collects:

- manifests;
- lockfiles;
- validation reports;
- seed results;
- save/migration results;
- performance traces;
- accessibility/manual sign-offs;
- approvals.

---

# 387. Release Authority

No automated pipeline promotes to Released without the project authority gate.

---

# 388. Open Technical Decisions — Repository Audit Required

The following cannot be truthfully locked before DOC-003:

- exact Godot version;
- exact project tree;
- exact current voxel implementation;
- exact save format currently present;
- exact test framework;
- exact CI provider;
- exact package/export command;
- exact autoload/service mechanism;
- exact dependency injection pattern;
- exact native-extension requirements;
- exact supported minimum hardware;
- exact chunk section dimensions;
- exact network transport/backend;
- exact save shard physical layout.

---

# 389. Open Decisions — Profiling Required

Require measured spikes:

- chunk/section size;
- meshing implementation;
- collision rebuild strategy;
- navigation rebuild granularity;
- voxel save compression;
- vessel voxel limits;
- active actor limits;
- native acceleration;
- world-stream radius;
- simulation budgets.

---

# 390. Open Decisions — Product Scope Required

Later product decisions determine:

- final online player cap;
- dedicated-server distribution;
- cloud saves;
- workshop/mod distribution;
- console/handheld targets;
- host migration promise;
- cross-play.

Architecture should avoid unnecessary blockers.

---

# 391. Required Repository Audit Report Template

```markdown
# Leyforge Godot/Summer Repository Audit

## Build Identity
- Godot:
- Summer Engine:
- Repository revision:
- Platforms:

## Root Map
...

## Existing Runtime Services
...

## Existing Data/Registry
...

## Existing Voxel System
...

## Existing Save System
...

## Existing Networking
...

## Existing Tests
...

## Existing Tooling
...

## Keep / Amend / Replace / Remove Matrix
...

## Risks
...

## Exact Command Mapping
...
```

---

# 392. Summer Engine Task Card Template

```yaml
task:
  task_id: <id>
  title: <one measurable action>
  source_authority: []
  current_state_evidence: []
  dependencies: []
  objective: <one result>
  in_scope: []
  out_of_scope: []
  changed_files: []
  data_migration_effect: []
  command_ids: []
  acceptance_tests: []
  evidence_outputs: []
  rollback: []
  risks: []
  owner: <id>
  reviewers: []
```

---

# 393. Repository Path Map Template

```yaml
repository_path_map:
  logical_component: DefinitionRegistry
  current_paths: []
  proposed_paths: []
  existing_symbols: []
  action: keep|amend|replace|remove
  tests: []
  risks: []
  approved: false
```

---

# 394. Validation Command Map Template

```yaml
command_mapping:
  command_id: CMD-TEST-HEADLESS
  exact_command: <repository_audit_required>
  working_directory: <path>
  environment: []
  expected_outputs: []
  timeout_policy: <value>
  failure_code: <id>
```

---

# 395. Service Contract Template

```yaml
service_contract:
  service_id: <id>
  owner_domain: <domain>
  owns_records: []
  public_queries: []
  public_commands: []
  emitted_events: []
  consumed_snapshots: []
  persistence_adapter_ref: <id>
  lod_adapter_ref: <id>
  replication_profile_ref: <id>
  reason_code_namespace: <id>
```

---

# 396. Runtime Record Template

```yaml
runtime_record:
  instance_id: <id>
  definition_refs: []
  world_ref: <id>
  realm_ref: <id>
  spatial_ref: <id>?
  owner_ref: <id>?
  state: {}
  revision: <rev>
  created_world_time: <time>
  modified_world_time: <time>
```

---

# 397. Persistence Adapter Contract

```yaml
persistence_adapter:
  domain_id: <id>
  schema_version: <version>
  snapshot_query: <id>
  load_command: <id>
  migration_refs: []
  integrity_validator_ref: <id>
  derived_cache_fields: []
```

---

# 398. LOD Adapter Contract

```yaml
lod_adapter:
  domain_id: <id>
  local_state_profile: <id>
  reduced_state_profile: <id>
  distant_state_profile: <id>
  promotion_command: <id>
  demotion_command: <id>
  invariants: []
  catchup_policy_ref: <id>
```

---

# 399. Replication Profile

```yaml
replication_profile:
  domain_id: <id>
  authority: server
  identity_fields: []
  high_frequency_fields: []
  event_fields: []
  interest_rules: []
  prediction_policy_ref: <id>?
  reconciliation_policy_ref: <id>
```

---

# 400. Performance Budget Record

```yaml
performance_budget:
  budget_id: <id>
  scenario_ref: <id>
  hardware_class_ref: <id>
  graphics_profile_ref: <id>
  simulation_profile_ref: <id>
  cpu_budget: <pending_measurement>
  gpu_budget: <pending_measurement>
  memory_budget: <pending_measurement>
  save_budget: <pending_measurement>
  network_budget: <pending_measurement>
  evidence_ref: <id>
```

---

# 401. Build Evidence Record

```yaml
build_evidence:
  build_id: <id>
  repository_revision: <rev>
  godot_version: <version>
  pack_lock_ref: <id>
  registry_snapshot_ref: <id>
  test_suite_refs: []
  seed_corpus_refs: []
  performance_baseline_refs: []
  migration_refs: []
  evidence_hash: <hash>
```

---

# 402. World Integrity Record

```yaml
world_integrity:
  world_ref: <id>
  save_generation: <n>
  manifest_hash: <hash>
  pack_lock_hash: <hash>
  registry_hash: <hash>
  domain_hash_refs: []
  journal_state: clean
  last_verified_world_time: <time>
```

---

# 403. Technical Failure-Code Families

Recommended namespaces:

- `TEC-*`
- `REG-*`
- `PACK-*`
- `WLD-*`
- `VOX-*`
- `SAVE-*`
- `MIG-*`
- `SIM-*`
- `AUTH-*`
- `NET-*`
- `PERF-*`
- `BUILD-*`

Domain-specific documents retain their own reason codes.

---

# 404. Core Technical Diagnostics

| Code | Meaning |
|---|---|
| `TEC-OWNER-001` | Mutable state has no unique owner. |
| `TEC-CYCLE-001` | Prohibited domain dependency cycle. |
| `TEC-QUERY-001` | Query mutated state. |
| `TEC-EVENT-001` | Success event emitted before commit. |
| `TEC-IDEMP-001` | Persistent command/evidence not idempotent. |
| `TEC-TIME-001` | Domain uses non-authoritative time. |
| `TEC-ASYNC-001` | Async result committed against stale revision. |
| `TEC-NODE-001` | Scene Node used as persistent identity/database truth. |
| `REG-DUP-001` | Duplicate canonical definition/field owner. |
| `REG-BLOCKITEM-001` | Duplicate recoverable Block / Item identity. |
| `PACK-LOCK-001` | Pack resolution differs from frozen lock. |
| `WLD-DET-001` | Deterministic world result mismatch. |
| `SAVE-ATOMIC-001` | Save promotion not atomic. |
| `SAVE-TRUTH-001` | UI/runtime reported save success falsely. |
| `MIG-001` | Migration cannot preserve supported state. |
| `SIM-LOD-001` | Promotion/demotion changes authoritative state. |
| `AUTH-001` | Unauthorised mutation accepted. |
| `NET-DUP-001` | Network retry duplicated committed outcome. |
| `PERF-BACKLOG-001` | Mandatory simulation backlog exceeds approved bound. |
| `BUILD-POC-001` | Shipping build contains active retired POC dependency. |

---

# 405. Production Definition of Done — Technical Foundation

Document 18 implementation reaches Foundation Ready when:

- repository audit is frozen;
- Godot version/toolchain recorded;
- service topology approved;
- test harness runs headless;
- build identity exists;
- structured logging works;
- command/event/transaction contracts work;
- world time/scheduler work;
- authority context works;
- registry kernel resolves qualified IDs;
- pack resolver produces deterministic lockfile;
- compiler produces generated Godot runtime products;
- POC scanner blocks production leaks;
- save fixtures run through dry-run migration;
- evidence is retained.

---

# 406. Production Definition of Done — Voxel / World

Requires:

- canonical Blocks load;
- no duplicate block-items;
- chunk edits are transactional;
- mesh/collision rebuild incrementally;
- seed generation deterministic;
- start/progression validator passes corpora;
- explored edits persist;
- save/load preserves deltas;
- worldgen updates do not rewrite explored areas.

---

# 407. Production Definition of Done — Living World

Requires:

- persistent people;
- settlement state;
- resources;
- economy;
- ecology;
- biology;
- social;
- automation;
- magic;
- movement

all survive LOD/save without duplicated truth.

---

# 408. Production Definition of Done — Adventure

Requires:

- structures;
- dungeons/sites;
- major threats;
- quests/events;
- realms

bind to real generated identities and preserve aftermath.

---

# 409. Production Definition of Done — Maritime

Requires selected Set-26 content:

- water;
- marine fields;
- aquatic movement;
- vessels;
- shipwright;
- ports;
- voyages;
- naval combat;
- ecology;
- UI

to satisfy the same identity/save/authority/performance rules.

---

# 410. Production Definition of Done — UI

Requires:

- view models;
- commands;
- reason codes;
- knowledge filtering;
- settings separation;
- accessibility;
- save truth;
- split-screen.

---

# 411. Production Definition of Done — Multiplayer

Requires:

- authoritative state;
- interest replication;
- movement prediction;
- reconnect;
- content handshake;
- stale-state protection;
- no duplication;
- moving-frame correctness.

---

# 412. Production Definition of Done — Release Candidate

Requires:

- all selected gates;
- frozen pack lock;
- registry snapshot;
- seed evidence;
- migration evidence;
- performance evidence;
- accessibility/human review;
- evidence bundle;
- final approval.

---

# 413. Architecture Acceptance Checklist

## Engine

- [x] Unreal direction retired.
- [x] Godot runtime/editor direction active.
- [x] GDScript default.
- [x] Native code only after profiling.
- [x] Summer Engine is development tooling, not shipped dependency.

## Identity / Data

- [x] Qualified IDs.
- [x] immutable definitions.
- [x] runtime instances separate.
- [x] normalised JSON interchange.
- [x] generated Godot Resources.
- [x] source provenance.
- [x] Block/Item single identity rule.
- [x] 217 Block / 286 Item baseline acknowledged.

## Runtime

- [x] scene tree not database.
- [x] service-led state.
- [x] commands/events/transactions.
- [x] world-time authority.
- [x] async bounded work.
- [x] deterministic streams.

## World

- [x] chunked voxel runtime.
- [x] seed world.
- [x] generated base + delta.
- [x] frozen explored state.
- [x] realm-local spaces.
- [x] moving frames/vessels.

## Persistence

- [x] atomic saves.
- [x] backups.
- [x] journals where needed.
- [x] migrations.
- [x] missing-pack recovery.
- [x] save truth in UI.

## LOD

- [x] detailed/reduced/distant/dormant.
- [x] no reroll on promotion.
- [x] bounded catch-up.
- [x] Simulation Depth explicit.

## Networking

- [x] authoritative client/server model.
- [x] solo shares authority model.
- [x] split-screen independent UI/input.
- [x] interest management.
- [x] prediction/reconciliation.
- [x] persistent IDs over NodePaths.

## Quality

- [x] validators.
- [x] seed corpora.
- [x] POC scan.
- [x] save/migration tests.
- [x] packaged profiling.
- [x] accessibility.
- [x] evidence gates.

## Repository Honesty

- [x] no invented exact paths.
- [x] no invented exact Godot command.
- [x] no invented current class names.
- [x] repository audit remains mandatory before code-bearing tasks.

---

# Appendix A — Active Technical Authority Hierarchy

When technical sources conflict, apply:

1. Explicit approved project direction.
2. Final reconciled Sets 27–30 interface register v1.1 for those interfaces.
3. Current Foundation Documents 00–18 v1.0.
4. Specialist Sets 26–30.
5. Set 25 governance/registry/validation.
6. Set 24 Atlas.
7. Sets 21–23 Forge.
8. Current Documents 19–20 pending reconciliation, where not superseded.
9. Legacy Documents 00–18 v0.1 for preserved intent only.
10. Document 99 and POC sources as regression/history only.

A later specialist owner does not transfer ownership merely because Document 18 consumes its API.

---

# Appendix B — Canonical Technical Invariants

```text
one gameplay rule -> one owner

definition != runtime instance

scene node != persistent identity

display name != stable ID

asset path != stable ID

query != command

command != committed result

event = committed fact

performance profile != simulation depth

knowledge != world truth

route permission != physical accessibility

economic value != physical capacity

social intent != movement execution

combat damage packet != biological Health storage

same recoverable Block identity -> no duplicate Item definition

distant simulation != free resource creation

unloaded != reset
```

---

# Appendix C — Logical World Runtime Graph

```text
Application Context
    |
    +-- Build / Pack / Settings / Localisation
    |
    +-- World Context
          |
          +-- Registry Snapshot
          +-- World Time / Scheduler
          +-- Authority
          +-- Event / Evidence Router
          +-- Transaction Journal
          +-- Save / Migration
          +-- Spatial Frame Service
          +-- World Generation / Streaming
          +-- Simulation LOD
          |
          +-- Domain Services
                +-- Blocks / Inventory / Recipes / Resources
                +-- NPC / Settlement
                +-- Automation
                +-- Magic
                +-- Ecology
                +-- Structures
                +-- Civilisation
                +-- Realms
                +-- Quest / Event
                +-- Combat
                +-- Economy
                +-- Social
                +-- Biology
                +-- Movement
                +-- Maritime
          |
          +-- Presentation Adapters
          +-- UI View Models
          +-- Network Replication
```

---

# Appendix D — Data Product Flow

```text
Spreadsheet / JSON / Forge / Graph / Localisation
                 |
                 v
             Import
                 |
                 v
          Normalised JSON
                 |
                 v
       Schema + Owner Validate
                 |
                 v
         Pack / Dependency Resolve
                 |
                 v
        Compiled Definitions
                 |
                 +--> Generated Godot Resources
                 +--> Compact Runtime Tables
                 +--> Reverse Indexes
                 +--> Semantic Hashes
                 +--> Source Maps
                 |
                 v
           Registry Snapshot
```

Generated outputs are not manually edited.

---

# Appendix E — Save Concept

```text
World Manifest
    |
    +-- Pack Lock
    +-- Registry Snapshot Identity
    +-- Generator Versions
    +-- World Profile
    |
    +-- Generated Base References
    |
    +-- Persistent Deltas
    |     +-- Terrain/Block
    |     +-- Structures
    |     +-- Entities
    |     +-- Settlements
    |     +-- Realm
    |     +-- Vessel
    |
    +-- Domain State
    |     +-- Inventory/Economy
    |     +-- Social/Political
    |     +-- Biology
    |     +-- Movement/Journeys
    |     +-- Quests/Events/History
    |
    +-- Scheduler
    +-- Transaction Journals
    +-- Migration History
    +-- Integrity
```

---

# Appendix F — Simulation LOD Principle

```text
Local Detailed
      |
      v
Reduced / Regional
      |
      v
Distant Summary
      |
      v
Dormant Scheduled
```

At every transition:

```text
Identity preserved
Quantities preserved
Ownership preserved
History preserved
Irreversible state preserved
```

---

# Appendix G — Authority Flow

```text
Player / NPC / AI / Machine / UI
            |
          Intent
            |
            v
     Authoritative Command
            |
            v
      Owner Validation
            |
        Reservation
            |
            v
          Commit
            |
      Journal + Revision
            |
            v
     Event / Evidence
            |
        Consumers
```

No consumer reaches backwards and edits the owner's private state.

---

# Appendix H — Summer Engine Development Flow

```text
Approved Source Authority
        |
        v
Read-Only Current-State Inspection
        |
        v
Bounded Task Card
        |
        v
Declared Files / Tests / Rollback
        |
        v
Summer Engine Implementation
        |
        v
Automated Validation
        |
        v
Human Review
        |
        v
Evidence Freeze
        |
        v
Merge / Gate
```

---

# Appendix I — Initial Technical Spike Register

## SPIKE-TEC-001 — Repository Audit

Prove current Godot/Summer project reality.

## SPIKE-VOX-001 — Chunk Storage / Meshing

Benchmark candidate chunk sizes and edit patterns.

## SPIKE-SAVE-001 — Atomic Sharded Save

Prove crash-safe promotion and backup.

## SPIKE-REG-001 — Registry Vertical

Prove canonical JSON → validation → Godot runtime product.

## SPIKE-SIM-001 — LOD Round Trip

Prove local → distant → catch-up → local equivalence.

## SPIKE-MOVE-001 — Spatial Frame

Prove actor moving inside a moving vessel frame.

## SPIKE-NET-001 — Moving-Frame Replication

Prove client prediction/reconciliation aboard vessel.

## SPIKE-MAR-001 — Vessel Incremental Rebuild

Prove bounded mesh/structural/compartment updates.

## SPIKE-PERF-001 — Identity-Complete Packaged Baseline

Measure real slice on reference hardware candidates.

---

# Appendix J — Production Risk Register

| Risk | Failure | Primary Mitigation |
|---|---|---|
| Scene-tree database | Unloaded content loses truth | Record/service architecture |
| Registry duplication | Conflicting content truth | 25B/25D compiler ownership |
| Block/item duplication | Inventory/recipe/save conflicts | FR-00-20-006 validator |
| Async race | Stale job overwrites world | Input revisions + commit validation |
| Save corruption | Player world loss | Atomic generations + backups |
| Heavy repair | Bland/invalid worldgen | Seed analytics + redesign trigger |
| Tick explosion | CPU collapse | Event/scheduler/LOD |
| Node explosion | Memory/performance collapse | Data-oriented records + promotion |
| Moving-frame jitter | Broken vessels/interiors | Spatial-frame authority spike |
| Network duplication | Items/money/damage duplicate | Idempotent transactions/evidence |
| Mod script attack | Security compromise | Data-only initial pack policy |
| Pack removal loss | Player content disappears | Quarantine/migration |
| UI false truth | Player loses trust | View-model/reason-code architecture |
| AI scope creep | Incoherent implementation | Set-25 task contracts |
| Premature native code | Build complexity | Profile-first GDExtension policy |
| Low-end divergence | Different simulation accidentally | Simulation vs Performance separation |

---

# Appendix K — Document 18 / Set 25 Gate Mapping

| Set-25 Package | Document-18 Responsibility |
|---|---|
| DOC-003 | Repository audit contract |
| DOC-004 | This replacement |
| TEC-001 | Service/module topology |
| TEC-002 | Logging/build identity |
| TEC-003 | Test harness |
| TEC-004 | CI/evidence |
| TEC-005 | Commands/events/transactions |
| TEC-006 | Time/scheduler/async |
| TEC-007 | Feature/build profiles |
| TEC-008 | Authority context |
| REG-001+ | Registry runtime |
| SAVE lane | Persistence architecture |
| SIM lane | LOD/time/presence |
| PERF lane | Profiling/budgets |
| UI lane | View-model/player-trust technical shell |
| MP lane | Authority/replication/reconnect |
| SET26 lane | Maritime admission |

---

# Appendix L — Source-to-Implementation Integrity Questions

Before changing code, answer:

1. Which document owns the rule?
2. Which registry owns the definition?
3. Is this definition or runtime state?
4. What is the stable ID?
5. Which service owns mutation?
6. Is this query, command, transaction or event?
7. What happens when unloaded?
8. What is saved?
9. What happens in multiplayer?
10. What happens if retried?
11. What happens if the pack disappears?
12. What happens after a version upgrade?
13. Which test proves it?
14. Which evidence is retained?
15. What is rollback?

If any answer is unknown, the task is not Ready.

---

# Appendix M — Repository Audit Completion Criteria

DOC-003 is complete only when:

- [ ] Godot version known.
- [ ] project revision recorded.
- [ ] complete root map recorded.
- [ ] autoloads mapped.
- [ ] addons/dependencies mapped.
- [ ] current voxel implementation mapped.
- [ ] current save implementation mapped.
- [ ] current networking mapped.
- [ ] current tests mapped.
- [ ] current content/data pipeline mapped.
- [ ] current Forge integration mapped.
- [ ] Summer Engine workflow mapped.
- [ ] exact command candidates recorded.
- [ ] Keep/Amend/Replace/Remove matrix produced.
- [ ] no files modified by the audit.

---

# Appendix N — Document 18 Production Acceptance Criteria

Document 18 v1.0 is accepted as the active technical architecture when:

- [x] Unreal Engine is fully retired from active technical direction.
- [x] Godot + Summer Engine is the current development direction.
- [x] Summer Engine is not a shipped runtime dependency.
- [x] GDScript-first direction is explicit.
- [x] native/GDExtension work is profile-gated.
- [x] one-owner mutable truth is preserved.
- [x] definitions and instances are separate.
- [x] SceneTree is not persistent database.
- [x] fully qualified IDs are the production identity basis.
- [x] normalised JSON is the initial canonical interchange.
- [x] generated Godot Resources are runtime products, not manually edited truth.
- [x] FR-00-20-006 is implemented technically.
- [x] 217 Blocks / 286 canonical Items / 105 chains are the reconciled baseline.
- [x] commands/events/transactions/evidence are separated.
- [x] authoritative world time is shared.
- [x] async work is bounded and commit-safe.
- [x] deterministic seed streams are scoped.
- [x] voxel world remains chunked/data-oriented.
- [x] exact chunk size remains profiling-gated.
- [x] world generation follows Document 11.
- [x] generated base + persistent delta is the save model.
- [x] explored/stateful world data is protected from silent regeneration.
- [x] realms use separate persistent coordinate spaces.
- [x] moving vessels use persistent local spatial frames.
- [x] simulation LOD preserves truth.
- [x] catch-up remains bounded.
- [x] Simulation Depth and Performance Profile are technically separate.
- [x] solo/split-screen/network share authoritative mutation boundaries.
- [x] replication uses interest/revisions rather than world-wide ticks.
- [x] content packs are data-driven, versioned and safely removable/migratable.
- [x] Forge source and runtime bake products are separated.
- [x] saves are atomic and recoverable.
- [x] migrations are versioned and dry-runnable.
- [x] validation uses retained evidence and seed corpora.
- [x] packaged profiling is required.
- [x] POC leakage scanning is release-blocking.
- [x] exact repository paths/commands are not fabricated.
- [x] repository audit remains mandatory before code tasks become Ready.
- [x] Set-25 G0–G10 gates are adopted.
- [x] Set-26 maritime technical architecture is admitted.
- [x] Sets 27–30 final ownership contracts are respected.

---

# Completion Statement

**Document 18 v1.0 completely replaces Leyforge's Unreal Engine / Forest Hamlet technical implementation plan with the production Godot + Summer Engine architecture.**

The central technical model is now:

**Author content once.**  
**Validate ownership and identity.**  
**Compile immutable definitions.**  
**Instantiate persistent records.**  
**Promote only what needs physical Nodes.**  
**Mutate through authoritative commands and transactions.**  
**Emit committed events and evidence.**  
**Save generated bases plus persistent history.**  
**Demote distant systems without changing truth.**  
**Replicate only relevant authoritative state.**  
**Profile packaged builds.**  
**Retain evidence.**  
**Recover instead of silently destroying player worlds.**

The old POC proved useful capabilities.

It no longer owns the architecture.

The old Unreal plan provided valuable engineering principles.

It no longer owns the engine.

And the new plan deliberately refuses to pretend that uninspected repository paths are known.

**The next technical action is not a giant implementation prompt. It is the bounded Set-25 DOC-003 read-only Godot/Summer Engine repository audit.**

After the repository map is frozen, TEC-001 can bind this architecture to the actual project and the first code-bearing production tasks can begin safely.

**Next Foundation reconciliation sequence after Document 18: Documents 19 and 20 — settlement growth, player voxel blueprints, buildings, facilities, construction and settlement projects.**
