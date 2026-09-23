
# LEYFORGE PRODUCTION PROGRAMME

## PROD-07 — Arcs I–II Production Contracts: P01–P11

**Document ID:** PROD-07  
**Title:** Leyforge Arcs I–II Production Contracts — A World From Stone / The Maker's Hand  
**Version:** v0.1  
**Date:** 21 September 2026  
**Status:** **DRAFT FOR OWNER REVIEW — FIRST EXECUTABLE ARC VOLUME CANDIDATE**  
**Project:** Leyforge  
**Product context:** Ley Realms / The Forge  
**Programme:** PROD — Detailed Production Plan & Implementation Handoff  
**Constitutional parent:** PROD-00 — Production Constitution, Authority & Scope  
**Source-routing parent:** PROD-01 — Legacy Canon & Source Crosswalk  
**Roadmap parent:** PROD-02 — Master Production Roadmap & Dependency Atlas  
**Runtime parent:** PROD-03 — Leyforge Runtime Engineering Architecture  
**Forge parent:** PROD-04 — The Forge Engineering & Creation Journey Architecture  
**Cross-system parent:** PROD-05 — Universal Simulation Primitives & Cross-System Contracts  
**Governance parent:** PROD-06 — Production Governance, Task Contracts & Evidence Standard  
**Arc scope:** ARC I — A WORLD FROM STONE / ARC II — THE MAKER'S HAND  
**Parent slices:** P01–P11  
**Programme gates:** PG-00 Production Admission, PG-01 World Foundation, PG-02 Forge Core  
**Primary downstream consumers:** ProductionRegistry, Project Brain, Task Contracts, Codex/coding agents, CI, runtime/Forge implementation, PROD-08 onward

---

# 00. Executive Arc Statement

PROD-07 is the first document in the PROD corpus that is intended to be directly executable as production work.

Its job is not to restate the whole Leyforge design.

Its job is to say:

> **What exactly must exist, what must not be overbuilt yet, and what evidence proves each of P01–P11 is safe for later production to depend upon?**

The two Arcs covered here deliberately establish two different foundations.

## ARC I — A WORLD FROM STONE

> *Before civilisation, before magic, before memory — there was the world.*

ARC I proves that Leyforge can:

- boot as the current production project;
- host a real blocky voxel world through the Godot/Zylann boundary;
- place a player in that world;
- perform authoritative voxel edits;
- preserve those edits across save/reload.

The Arc closes only when:

> **the world exists independently of any one SceneTree lifetime and remembers what the player changed.**

## ARC II — THE MAKER'S HAND

> *The world exists. Now we learn how to make things worthy of it.*

ARC II proves that The Forge can:

- author editable production source;
- bind stable semantic identity;
- create voxel/model and material source;
- validate that source;
- bake runtime products;
- run them through a controlled Test Laboratory;
- place at least one unmistakably Leyforge fantasy signal into the world.

The Arc closes only when:

> **a real Forge-created, registry-bound, validated production asset can appear in the real Leyforge world without becoming hard-coded content.**

The intended combined result is extremely small compared with the final game:

```text
BOOT
→ VOXEL WORLD
→ PLAYER
→ BREAK / PLACE
→ SAVE / RELOAD
→ OPEN FORGE
→ CREATE REGISTERED BLOCK / MATERIAL
→ VALIDATE / BAKE
→ TEST
→ FIND A FLUX CRYSTAL IN THE WORLD
```

That is enough.

Do not add inventory, crafting, villagers, machines, spells, oceans or multiplayer merely because they exist later in the roadmap.

---

# 01. Governing Production Rules for P01–P11

## 01.1 Current production technology baseline

The current architectural baseline is:

- Godot 4.7.2 stable;
- Zylann Voxel Tools / `godot_voxel` as the specialised voxel substrate;
- Leyforge-owned semantic/runtime services above providers.

The exact pinned Zylann integration build/edition and module-versus-GDExtension decision must be verified against the actual production repository during P01.

This document does not invent the current repository state.

## 01.2 Historical implementation is evidence, not source architecture

The archived POC may provide:

- behavioural examples;
- test ideas;
- visual proportions;
- regression fixtures;
- measured evidence.

It must not be copied wholesale into production merely because it already works.

## 01.3 One-metre block grammar remains the world-space baseline

The production world uses the existing one-metre block grammar unless a later accepted authority changes it.

ART's 32×32 base surface language remains presentation authority for ordinary block surfaces.

The separate **32 authoring voxels per metre** detailed-model density used by the Forge must not be confused with world cell size.

## 01.4 Semantic identity exists before provider identity

No P-slice may make Zylann TYPE numbers, Godot ObjectIDs, NodePaths or file paths the durable identity of content.

## 01.5 Save truth belongs to Leyforge

P05 must not simply demonstrate that one provider wrote a file.

It must prove that the Leyforge world can reconstruct its authoritative state.

## 01.6 Forge source precedes mass content

ARC II builds the minimum authoring platform required to produce production content.

It does not mass-produce the content catalogue.

## 01.7 P11 is a teaser, not the magic system

P11 proves visual/world/content identity for Flux-bearing material.

It does **not** implement:

- player mana;
- spells;
- Rune Forge;
- magical networks;
- mana furnace behaviour;
- ritual systems.

Those belong to later milestones.

## 01.8 Measured parameters stay measured

Do not choose by preference:

- chunk/data block size;
- active streaming radius;
- worker counts;
- provider packaging mode;
- storage backend;
- far LOD solution.

Where a parameter affects P01–P11, define a bounded proof and choose from evidence.

---

# 02. Common Evidence Rules for This Volume

Every P-slice inherits PROD-06.

At minimum, each parent slice must produce:

- an authority-resolved record;
- a candidate-bound acceptance matrix;
- automated evidence where behaviour is machine-testable;
- scenario evidence where player/creator behaviour matters;
- repository/final-SHA evidence where the slice closes on committed code;
- an explicit parent completion reconciliation.

Manual/owner review is required only where stated.

The suggested child decompositions below are **planning recommendations**. Actual child IDs are allocated through the ProductionRegistry at production time.

---

# 03. ARC I — A WORLD FROM STONE

---

# P01 — THE EMPTY CANVAS

**Classification:** FOUNDATION  
**Arc:** ARC I — A WORLD FROM STONE  
**Player/creator payoff:** Leyforge boots as the real production game project, reports what technology it is actually running, and has a trustworthy place to build from.

## P01.1 Purpose

Establish the smallest production runtime shell capable of supporting every later slice without prematurely implementing later systems.

P01 answers:

> **Do we have one real, governed, diagnosable production Leyforge runtime built on the currently accepted Godot/Zylann boundary?**

## P01.2 Authoritative source packet

Primary sources:

- PROD-00 through PROD-06;
- current accepted PRD technology/boundary evidence;
- current ENG-GOV/B-OPS and Project Brain state;
- current production repository;
- Godot 4.7.2 project baseline;
- current accepted Zylann capability/boundary evidence.

Historical sources may support regression only.

## P01.3 Entry gate

P01 may become READY only when PG-00 is satisfied.

Minimum PG-00 conditions include:

- PROD-00 through PROD-07 accepted enough to govern P01;
- ProductionRegistry bootstrapped;
- actual production repository verified;
- actual branch/upstream verified;
- current Project Brain task/handoff reconciled;
- first P01 Task Contract admitted;
- no unresolved repository/governance blocker.

## P01.4 Dependencies

### Hard

- PROD programme architecture/governance;
- current repository access;
- usable Godot 4.7.2 installation/toolchain.

### Forge

None.

### Runtime

None beyond engine/provider availability.

### Content

Only minimum test identities/assets required to boot.

### Evidence

Historical PRD facts may be reused where still applicable, but production boot must be re-observed in the current repository.

## P01.5 Universal primitives used

- Identity;
- State;
- Result/Reason;
- Provenance.

## P01.6 In scope

P01 includes:

- pin/verify Godot 4.7.2 production baseline;
- pin/verify selected Zylann build/edition/integration mode;
- record provider versions at runtime/developer diagnostics;
- establish production boot path;
- establish minimal WorldService/WorldSession shell;
- establish project/runtime module boundaries sufficient for P02–P05;
- logging/diagnostic foundation;
- stable startup/shutdown lifecycle;
- automated test entry point;
- development and packaged-development build profiles;
- configuration boundary for provider adapters;
- initial CI/smoke path if repository governance supports it;
- first ProductionRegistry/task/evidence loop.

## P01.7 Explicit non-scope

P01 does **not** implement:

- full voxel world;
- final save system;
- Forge UI;
- inventory;
- crafting;
- final settings menu;
- multiplayer;
- final worldgen;
- simulation LOD;
- complete runtime service map;
- final performance optimisation;
- final main menu.

A minimal developer bootstrap scene/screen is sufficient.

## P01.8 Implementation capability requirements

The runtime must be able to report at minimum:

- Leyforge build/version identity;
- Godot version;
- Zylann provider version/build identity where obtainable;
- current build profile;
- startup result;
- clean shutdown result.

The project structure should make provider-specific code recognisable as an adapter boundary rather than allowing gameplay code to directly scatter provider calls everywhere.

## P01.9 Forge requirements

None.

However, P01 should reserve clean architectural boundaries so P06 can exist without becoming entangled with gameplay scenes.

## P01.10 Runtime requirements

Minimum conceptual shell:

```text
Application / Boot
    ↓
WorldService
    ↓
WorldSession shell
    ↓
Diagnostics / Provider adapters
```

No requirement exists yet for a persistent playable world.

## P01.11 Canonical content subset

Minimum:

- one bootstrap/test world identity;
- one diagnostic/test content entry if needed.

These may be marked development-only.

## P01.12 Persistence implications

P01 may store developer/editor configuration.

It must not accidentally establish an irreversible final world-save schema.

## P01.13 Multiplayer / authority implications

P01 should not implement networking.

It must avoid architectural shortcuts that require rewriting all mutation paths later.

## P01.14 Simulation-LOD implications

None beyond ensuring future simulation services have a clean home.

## P01.15 Accessibility / localisation implications

Bootstrap diagnostics need not be final UI.

Any player-visible error should still be readable and not depend on colour alone where practical.

## P01.16 Performance implications

Record baseline startup time and idle memory for comparison, but do not create premature budgets from one machine.

## P01.17 Security / trust implications

Provider/version/config input should be treated as developer-controlled.

Do not add untrusted content loading yet.

## P01.18 Recommended child decomposition

Suggested:

- P01-A — Repository / toolchain / provider pin;
- P01-B — Runtime bootstrap and WorldService shell;
- P01-C — diagnostics/version reporting;
- P01-D — automated smoke/build profile;
- P01-E — parent reconciliation.

## P01.19 Acceptance matrix

| ID | Requirement | Evidence | Gate |
| --- | --- | --- | --- |
| P01-AC01 | Current governed production repository/branch/HEAD are verified before implementation | EV-A / EV-H | Required |
| P01-AC02 | Godot 4.7.2 production project opens/boots without blocking error | EV-B / EV-C | Required |
| P01-AC03 | Exact Zylann integration build/edition is pinned and reported | EV-A / EV-H | Required |
| P01-AC04 | Provider version/build diagnostics are observable | EV-B / EV-C | Required |
| P01-AC05 | Minimal WorldSession can open and close cleanly | EV-B | Required |
| P01-AC06 | Startup/shutdown leaves no known task/thread/provider lifecycle defect | EV-B / EV-H | Required |
| P01-AC07 | Automated smoke test can run from governed test entry point | EV-B | Required |
| P01-AC08 | Packaged-development or equivalent non-editor smoke boot works | EV-C | Required |
| P01-AC09 | No P02+ gameplay feature is required to satisfy P01 | EV-G review | Required |
| P01-AC10 | Final committed SHA passes required local/CI checks | EV-H | Required |

## P01.20 Negative tests

At minimum:

- wrong/missing provider configuration fails with actionable reason;
- duplicate/invalid boot attempt fails safely;
- clean shutdown after failed boot does not leave persistent broken state.

## P01.21 Manual acceptance scenario

1. obtain governed candidate;
2. start production Leyforge build;
3. observe startup/version information;
4. open minimal WorldSession shell;
5. close session;
6. exit application cleanly;
7. repeat from packaged-development build where applicable.

## P01.22 Rule-of-cool target

None required.

P01's emotional payoff is:

> **This is no longer the archived POC. This is the actual Leyforge production project.**

## P01.23 Exit gate

P01 is COMPLETE when:

- provider/toolchain pin is explicit;
- production boot is stable;
- diagnostics/test path exists;
- final candidate is reconciled.

## P01.24 Downstream unlock

Unlocks:

- P02 voxel substrate implementation;
- P06 preliminary Forge shell planning only where it does not depend on P05 persistence.

## P01.25 Known risks / ADR triggers

ADR required if work changes:

- active Godot version;
- Zylann integration architecture;
- project-level provider boundary;
- native/module strategy beyond accepted baseline.

---

# P02 — STONE BENEATH OUR FEET

**Classification:** FOUNDATION  
**Arc:** ARC I  
**Player/creator payoff:** For the first time in production, the player can stand inside a real streamed blocky Leyforge world.

## P02.1 Purpose

Establish the production voxel substrate and its Leyforge-owned semantic adapter.

P02 answers:

> **Can Leyforge load, stream, render, collide with and query a blocky voxel world without allowing the provider to become gameplay identity?**

## P02.2 Authoritative source packet

Primary:

- PROD-03 voxel/spatial/streaming architecture;
- PROD-05 Identity/State contracts;
- current PRD Zylann capability/boundary evidence;
- Document 03 Blocks Registry for semantic block examples;
- engine-agnostic voxel lifecycle concepts retained from Document 18;
- ART-01 global voxel language;
- ART-02 block/material surface constraints where required for test presentation.

## P02.3 Entry gate

Required:

- P01 COMPLETE;
- Zylann production integration pinned;
- semantic block-ID mapping strategy accepted;
- no unresolved provider API blocker.

## P02.4 Dependencies

### Hard

P01.

### Forge

None; test assets may be manually seeded through controlled source until P08.

### Runtime

WorldSession shell; registry bootstrap sufficient to resolve semantic voxel IDs.

### Content

Small representative block set only.

Recommended:

- air;
- stone;
- dirt/soil;
- grass surface;
- one transparent/cutout block only if required for provider proof.

### Evidence

Reuse PRD proof methodology where relevant, but run current production candidate.

## P02.5 Universal primitives used

- Identity;
- State;
- Capability;
- Result/Reason.

## P02.6 In scope

- `VoxelService` or equivalent semantic facade;
- Zylann adapter;
- semantic ID ↔ runtime voxel handle ↔ provider type projection;
- blocky terrain instance;
- deterministic local generator interface;
- near-field streaming;
- block query by canonical position;
- mesh readiness;
- collision readiness;
- explicit region/chunk readiness states sufficient for later edit/player work;
- minimum canonical spatial-address conversion;
- provider diagnostics;
- first traversal/streaming benchmark fixture.

## P02.7 Explicit non-scope

- final continental worldgen;
- caves;
- biomes;
- oceans;
- fluids;
- final lighting system;
- player editing;
- persistence;
- vegetation/ecology;
- far-distance final LOD;
- structures;
- Forge-authored block workflow.

## P02.8 Implementation capability requirements

The semantic layer must be able to answer:

```text
What canonical block is at this world address?
What provider-local value represents it right now?
Is data ready?
Is collision ready?
```

Provider-local type values must be reversible to semantic identity.

## P02.9 Forge requirements

None.

Do not build Voxel Forge prematurely inside P02.

## P02.10 Runtime requirements

Required boundaries:

```text
RegistryService
      ↓
VoxelService
      ↓
Zylann Adapter
      ↓
VoxelTerrain/provider representation
```

Gameplay-facing code queries `VoxelService`, not provider TYPE integers.

## P02.11 Canonical content subset

A deliberately tiny terrain palette.

Do not migrate the entire historical VoxelRegistry.

## P02.12 Persistence implications

Base generated terrain may be deterministic.

Player edits are not yet required to persist.

No provider file format becomes the whole-world save contract.

## P02.13 Multiplayer / authority implications

None yet.

Voxel query/edit APIs should already be compatible with future authoritative command ownership.

## P02.14 Simulation-LOD implications

Voxel streaming is representation lifecycle, not future civilisation simulation LOD.

Keep those concepts separate from day one.

## P02.15 Accessibility / localisation implications

No major UI requirements.

Debug overlays should have labels/non-colour cues where practical.

## P02.16 Performance implications

Measure:

- local generation time;
- mesh time if observable;
- traversal streaming stability;
- collision readiness;
- memory;
- queue/backlog.

Do not lock final chunk/view-distance settings without evidence.

## P02.17 Security / trust implications

Generator input is developer-controlled.

## P02.18 Recommended child decomposition

- P02-A — semantic voxel registry projection;
- P02-B — Zylann terrain/provider adapter;
- P02-C — canonical coordinate/query interface;
- P02-D — streaming/readiness lifecycle;
- P02-E — traversal/performance proof;
- P02-F — parent reconciliation.

## P02.19 Acceptance matrix

| ID | Requirement | Evidence | Gate |
| --- | --- | --- | --- |
| P02-AC01 | Stable semantic block identity resolves through runtime/provider mapping | EV-B | Required |
| P02-AC02 | Provider type remapping does not change semantic identity | EV-B negative/regression | Required |
| P02-AC03 | Terrain streams while traversing representative area | EV-C / EV-E | Required |
| P02-AC04 | Mesh and collision readiness are explicit and observable | EV-B / EV-C | Required |
| P02-AC05 | Player/test body can stand on voxel collision without per-block bodies | EV-C | Required |
| P02-AC06 | Query returns correct semantic block for world position | EV-B | Required |
| P02-AC07 | Reload/re-request of generated area produces equivalent required semantic terrain | EV-B | Required |
| P02-AC08 | Provider logs/metrics are surfaced through bounded diagnostics | EV-B | Required |
| P02-AC09 | No gameplay code relies on raw Zylann TYPE as durable identity | EV-A / review | Required |
| P02-AC10 | Representative traversal remains inside provisional proof budget or produces explicit benchmark decision | EV-E | Required |
| P02-AC11 | Final SHA/CI gate passes | EV-H | Required |

## P02.20 Negative tests

- unknown semantic block mapping fails loudly;
- stale/invalid provider handle cannot silently map to wrong block;
- querying unloaded/unready area returns explicit state rather than fake air where contract distinguishes it;
- provider shutdown/unload does not destroy canonical registry.

## P02.21 Manual acceptance scenario

Walk/fly through a representative generated block world far enough to force repeated streaming.

Observe:

- blocky Leyforge-compatible terrain;
- collision;
- streaming;
- no obvious permanent holes after readiness settles;
- semantic debug lookup.

## P02.22 Rule-of-cool target

First genuine production screenshot:

> **the player standing in the new Leyforge voxel world.**

No need for magic yet.

## P02.23 Exit gate

P02 closes when the voxel substrate is semantically wrapped, streamable, queryable and collision-ready enough for P03/P04.

## P02.24 Downstream unlock

- P03 movement;
- P04 edit architecture preparation;
- P08 later Voxel Forge runtime target.

## P02.25 Known risks / ADR triggers

- provider integration method;
- data/mesh block sizes if production-impacting;
- far LOD if P02 evidence proves near-field architecture insufficient;
- coordinate/precision approach if measured traversal exposes issue.

---

# P03 — FIRST FOOTFALL

**Classification:** FOUNDATION  
**Arc:** ARC I  
**Player/creator payoff:** The game becomes physically inhabitable: move, look, jump and interact with the voxel world.

## P03.1 Purpose

Build the production first-person mover and interaction-query foundation without tying player identity to a transient Node.

## P03.2 Authoritative source packet

- PROD-03 movement/entity/spatial architecture;
- PROD-05 Identity/Capability/Result;
- Document 01 core gameplay-loop exploration direction;
- Document 17 input/UI accessibility principles;
- current ART first-person readability guidance where applicable;
- historical POC movement behaviour as evidence only.

## P03.3 Entry gate

- P01 COMPLETE;
- P02 terrain/collision proof PASS.

## P03.4 Dependencies

### Hard

P02.

### Runtime

WorldSession; SpatialService concepts; collision-ready voxel world.

### Forge

None.

### Content

Voxel test world.

## P03.5 Universal primitives used

- Identity;
- State;
- Capability;
- Result/Reason.

## P03.6 In scope

- persistent player/character domain identity sufficient for session;
- active first-person body projection;
- walk;
- sprint;
- jump;
- gravity;
- grounded state;
- camera/look;
- basic slope/step handling as supported;
- interaction ray/query;
- canonical/projected position conversion;
- respawn/reset developer path;
- input abstraction compatible with later rebinding/controller work;
- movement diagnostics.

Swimming is only an interface/capability placeholder, not production swimming.

## P03.7 Explicit non-scope

- third-person presentation;
- combat;
- stamina tuning;
- climbing;
- swimming runtime;
- mounts;
- vehicles;
- final accessibility/input UI;
- controller certification;
- multiplayer prediction;
- parkour.

## P03.8 Implementation capability requirements

Player Node is an active projection.

At minimum the runtime must be able to map:

```text
persistent/local player identity
↔ active body Node
↔ canonical spatial address
```

## P03.9 Forge requirements

None.

## P03.10 Runtime requirements

MovementService or equivalent owns movement capability/state.

Godot body/physics executes movement.

## P03.11 Canonical content subset

None beyond terrain.

## P03.12 Persistence implications

P03 may record test spawn position.

Final player save is not required until later.

P05 should be able to preserve a basic player/world position if selected in its contract.

## P03.13 Multiplayer / authority implications

Do not encode assumptions that only one local body can ever exist.

Input/controller ownership and persistent player identity must remain separable.

## P03.14 Simulation-LOD implications

Player active body is always ACTIVE.

No NPC LOD yet.

## P03.15 Accessibility / localisation implications

- configurable mouse sensitivity at developer/config level;
- avoid forced head bob;
- camera motion should be separable for future reduced-motion;
- input actions use Godot action abstraction rather than hard-coded keys.

## P03.16 Performance implications

Movement must remain stable during voxel streaming.

Profile hitching caused by streaming, not just average FPS.

## P03.17 Security / trust implications

None beyond avoiding debug teleports in future release authority.

## P03.18 Recommended child decomposition

- P03-A — player identity/body boundary;
- P03-B — locomotion/camera/input;
- P03-C — interaction query;
- P03-D — streaming traversal regression;
- P03-E — reconciliation.

## P03.19 Acceptance matrix

| ID | Requirement | Evidence | Gate |
| --- | --- | --- | --- |
| P03-AC01 | Player can walk/sprint/jump reliably on production voxel collision | EV-C | Required |
| P03-AC02 | Movement survives chunk streaming without losing body/world identity | EV-C / EV-E | Required |
| P03-AC03 | Interaction query resolves canonical voxel address/semantic block | EV-B / EV-C | Required |
| P03-AC04 | Player domain identity is not the Node/ObjectID | EV-A / EV-B | Required |
| P03-AC05 | Input uses abstract actions rather than hard-coded keys | EV-A / review | Required |
| P03-AC06 | Camera motion has no mandatory inaccessible cosmetic motion | EV-F | Required |
| P03-AC07 | Destroy/recreate active projection can restore player identity/state for controlled test | EV-B / EV-C | Required |
| P03-AC08 | Streaming traversal has no unresolved blocking hitch/fall-through defect | EV-E / EV-C | Required |
| P03-AC09 | Final SHA/CI passes | EV-H | Required |

## P03.20 Negative tests

- interaction query into unloaded/unready voxel area returns explicit result;
- body projection recreation does not duplicate player identity;
- invalid spawn location uses bounded safe fallback.

## P03.21 Manual acceptance scenario

Spawn in terrain, walk across several chunk boundaries, jump onto/off terrain, look around, target several different blocks and inspect semantic target information.

## P03.22 Rule-of-cool target

The player can finally just **wander around the new world**.

## P03.23 Exit gate

Movement and interaction query are stable enough that voxel editing can be performed as an authoritative player action.

## P03.24 Downstream unlock

P04.

## P03.25 Known risks / ADR triggers

- movement body strategy if standard Godot approach proves incompatible with blocky terrain;
- coordinate precision only if measured evidence requires escalation.

---

# P04 — THE FIRST SCAR

**Classification:** FOUNDATION / COOL-PULL  
**Arc:** ARC I  
**Player/creator payoff:** The player changes the world: break a block, place a block, see the terrain update.

## P04.1 Purpose

Implement the first authoritative world mutation path.

P04 is not “call `VoxelTool.set_voxel()` from the player script.”

It establishes the command/validation/change-set architecture later systems will reuse.

## P04.2 Authoritative source packet

- PROD-03 authoritative spatial-edit architecture;
- PROD-05 Command/Transaction/State/Result contracts;
- Document 03 block semantics;
- retained Document 18 edit/bulk/async concepts;
- PRD edit/streaming evidence;
- ART-01/02 presentation only where relevant.

## P04.3 Entry gate

- P02 COMPLETE;
- P03 COMPLETE.

## P04.4 Dependencies

### Hard

P02–P03.

### Runtime

VoxelService, interaction query, semantic IDs.

### Forge

None.

### Content

Two or more placeable test blocks.

## P04.5 Universal primitives used

- Identity;
- State;
- Permission placeholder;
- Capability;
- Transaction;
- Result/Reason;
- History hook;
- Composition hook.

## P04.6 In scope

- `PlaceBlockCommand`;
- `BreakBlockCommand`;
- validation;
- target revision/state where needed;
- canonical before/after semantic state;
- provider edit application;
- bulk edit path foundation;
- `SpatialChangeSet` or equivalent shared invalidation record;
- mesh/collision readiness reaction;
- edit diagnostics;
- simple developer placement selector;
- rate/bounds safety;
- edit regression tests.

Permission evaluation may initially resolve to permissive development-world policy through the shared contract.

## P04.7 Explicit non-scope

- item drops;
- inventory cost;
- tools/mining speed;
- durability;
- construction stages;
- structure ownership;
- multiplayer;
- final anti-cheat;
- fluid reaction;
- nav invalidation if navigation does not yet exist.

Hooks may exist for future consumers.

## P04.8 Implementation capability requirements

The authoritative path must be:

```text
player intent
→ command
→ validation
→ semantic world mutation
→ provider projection
→ SpatialChangeSet
→ readiness/remesh/collision
→ committed result
```

Do not make provider edit success the only authoritative record.

## P04.9 Forge requirements

None.

## P04.10 Runtime requirements

The same edit path should be callable later by:

- player;
- construction system;
- world event;
- admin/test tools;

under different authority.

Do not hard-code “player only” into the mutation core.

## P04.11 Canonical content subset

Small:

- air;
- stone;
- dirt;
- one contrasting construction/test block.

## P04.12 Persistence implications

Edits may be volatile until P05.

However, the edit representation must already contain enough semantic information to be persisted later.

## P04.13 Multiplayer / authority implications

Commands/results/revisions should be compatible with later server authority.

No networking required.

## P04.14 Simulation-LOD implications

None.

## P04.15 Accessibility / localisation implications

Target outline/debug information should remain readable.

No final build UI required.

## P04.16 Performance implications

Test:

- repeated single edits;
- bounded edit burst;
- repeated edits across chunk boundary;
- cancellation/stale remesh behaviour where applicable.

## P04.17 Security / trust implications

Development world may allow all edits.

The architecture must leave permission validation as a real stage.

## P04.18 Recommended child decomposition

- P04-A — edit command/result schema;
- P04-B — semantic/provider mutation adapter;
- P04-C — SpatialChangeSet/invalidation;
- P04-D — edit-burst / chunk-boundary proof;
- P04-E — reconciliation.

## P04.19 Acceptance matrix

| ID | Requirement | Evidence | Gate |
| --- | --- | --- | --- |
| P04-AC01 | Break command validates and commits correct semantic before/after state | EV-B | Required |
| P04-AC02 | Place command validates and commits correct semantic state | EV-B | Required |
| P04-AC03 | Mesh/collision update follows committed edit | EV-C | Required |
| P04-AC04 | A committed edit emits one shared SpatialChangeSet/invalidation record | EV-B | Required |
| P04-AC05 | Stale/invalid target state fails safely | EV-B negative | Required |
| P04-AC06 | Burst edit test remains bounded and does not corrupt terrain | EV-B / EV-E | Required |
| P04-AC07 | Chunk-boundary edit behaves correctly | EV-C | Required |
| P04-AC08 | No item/inventory duplication behaviour is invented before P12/P13 | EV-G review | Required |
| P04-AC09 | Provider TYPE is not used as durable edit identity | EV-A | Required |
| P04-AC10 | Final SHA/CI passes | EV-H | Required |

## P04.20 Negative tests

- place into invalid occupied target;
- break already-air target;
- stale expected revision;
- invalid semantic block ID;
- edit into unloaded/unsupported region follows explicit contract;
- repeated command ID does not duplicate consequential mutation where retry handling is enabled.

## P04.21 Manual acceptance scenario

Target a block.

Break it.

Watch geometry/collision update.

Select another block.

Place it.

Walk on the new geometry.

Repeat across a chunk boundary.

## P04.22 Rule-of-cool target

> **The first hole you dig in production Leyforge.**

Simple as hell.

Massive milestone. 😂

## P04.23 Exit gate

World mutation is authoritative, semantically addressed and provider-projected.

## P04.24 Downstream unlock

P05 persistence.

Later consumers may reuse the mutation command architecture.

## P04.25 Known risks / ADR triggers

- provider bulk-edit limitations;
- edit-threading strategy;
- change-set granularity if profiling shows current shape is unbounded.

---

# P05 — THE WORLD REMEMBERS

**Classification:** FOUNDATION  
**Arc:** ARC I  
**Player/creator payoff:** Close the game, come back, and the hole you dug is still there.

## P05.1 Purpose

Establish the first real persistent Leyforge world.

P05 proves that:

> **provider lifetime, SceneTree lifetime and process lifetime are not world lifetime.**

## P05.2 Authoritative source packet

- PROD-03 WorldDefinition/WorldSession/SaveCoordinator architecture;
- PROD-05 Identity/State/Transaction/History;
- current PRD persistence/save evidence;
- retained engine-neutral persistence principles from Document 18;
- current registry/stable-ID authority.

## P05.3 Entry gate

- P04 COMPLETE;
- a stable semantic edit representation exists.

## P05.4 Dependencies

### Hard

P01–P04.

### Runtime

WorldDefinition; WorldSession; voxel semantic edits.

### Forge

None.

### Content

Only P02–P04 test content.

## P05.5 Universal primitives used

- Identity;
- State;
- Transaction;
- Result/Reason;
- History/provenance hooks.

## P05.6 In scope

- stable `world_id`;
- WorldDefinition;
- WorldSession open/close;
- seed/generator metadata;
- content/registry manifest baseline;
- save schema version;
- semantic voxel edit persistence;
- minimal player/world position persistence if selected;
- SaveCoordinator foundation;
- checkpoint identity;
- clean save;
- reload;
- backup/last-known-good baseline where practical;
- interrupted-write safety proof appropriate to current storage;
- explicit save failure reasons;
- migration fixture framework, even if only same-version at first.

## P05.7 Explicit non-scope

- final all-domain database;
- NPC saves;
- inventory saves;
- realm saves;
- multiplayer server saves;
- cloud saves;
- final patch migration suite;
- final recovery UI.

## P05.8 Implementation capability requirements

The save must reference canonical semantic IDs.

It must not require runtime palette indices to remain identical across sessions.

## P05.9 Forge requirements

P06 may later store Forge projects separately.

World saves must not become Forge source storage.

## P05.10 Runtime requirements

Conceptual checkpoint:

```text
WorldDefinition
+ generated-base identity
+ semantic edit state
+ session/world metadata
→ checkpoint manifest
→ close
→ reopen
→ reconstruct
```

## P05.11 Canonical content subset

Same as P04.

## P05.12 Persistence implications

This slice **is** the first persistence authority.

Schema versioning starts now.

Future data domains extend it.

## P05.13 Multiplayer / authority implications

World save ownership belongs to authoritative WorldSession/server later.

Do not make save logic depend on local UI/player scripts.

## P05.14 Simulation-LOD implications

None yet.

However, unloaded voxel state must remain persistent.

## P05.15 Accessibility / localisation implications

Save failures need understandable reason text eventually; stable reason codes begin now.

## P05.16 Performance implications

Record:

- save duration;
- load duration;
- save size for fixture;
- dirty-edit scaling.

Do not over-optimise until representative worlds exist.

## P05.17 Security / trust implications

Corrupted/malformed fixture should fail safely.

Do not execute content from save data.

## P05.18 Recommended child decomposition

- P05-A — WorldDefinition/schema;
- P05-B — edit persistence/store;
- P05-C — SaveCoordinator/checkpoint;
- P05-D — reload/reconstruction;
- P05-E — interruption/corruption negative proof;
- P05-F — parent/PG-01 reconciliation.

## P05.19 Acceptance matrix

| ID | Requirement | Evidence | Gate |
| --- | --- | --- | --- |
| P05-AC01 | New world receives stable world identity and versioned manifest | EV-B / EV-D | Required |
| P05-AC02 | Seed/base-generation identity is recorded | EV-B / EV-D | Required |
| P05-AC03 | P04 edits survive full process close/reopen | EV-D / EV-C | Required |
| P05-AC04 | Save reconstructs semantic blocks even if runtime/provider mapping is regenerated | EV-D / EV-B | Required |
| P05-AC05 | Unloaded/reloaded region retains edits | EV-D | Required |
| P05-AC06 | Interrupted/invalid write cannot silently replace last known-good state | EV-D negative | Required |
| P05-AC07 | Save/load failure emits stable actionable reason | EV-B | Required |
| P05-AC08 | SaveCoordinator owns checkpoint publication rather than UI/provider | EV-A / review | Required |
| P05-AC09 | Basic save/load measurement captured | EV-E | Required |
| P05-AC10 | Final SHA/CI passes | EV-H | Required |

## P05.20 Negative tests

- missing/corrupt manifest;
- unknown semantic block ID;
- interrupted save at controlled phase;
- stale temp artifact;
- provider mapping changed between sessions;
- load of unsupported future schema reports explicit result.

## P05.21 Manual acceptance scenario

1. create world;
2. walk somewhere;
3. break/place several memorable blocks;
4. save/exit;
5. restart application;
6. load same world;
7. return to location;
8. verify changes still exist.

## P05.22 Rule-of-cool target

The first personal moment of persistence:

> **“That's my world. It remembered me.”**

## P05.23 Exit gate — PG-01 WORLD FOUNDATION

PG-01 may pass only when:

- P01–P05 COMPLETE;
- world boots;
- terrain streams;
- player moves;
- edits commit;
- save/reload preserves them;
- no unresolved blocker makes later Forge/gameplay work unsafe.

## P05.24 Downstream unlock

- P06 Forge Core may now rely on stable runtime/world identity;
- ARC III later may build persistent resources/items safely.

## P05.25 Known risks / ADR triggers

- save storage provider;
- checkpoint publication architecture;
- semantic edit compression if chosen;
- schema change.

---

# 04. ARC II — THE MAKER'S HAND

ARC II establishes the first real production-authoring chain.

The target is not a complete user-facing creator suite.

The target is:

> **Create a canonical block/material source in The Forge, validate it, bake it, register it, test it and see it in Leyforge.**

---

# P06 — THE FORGE IGNITES

**Classification:** FORGE-FIRST  
**Arc:** ARC II — THE MAKER'S HAND  
**Player/creator payoff:** The project gains its first real authoring environment instead of hand-editing runtime assets.

## P06.1 Purpose

Build the smallest viable Forge Core.

P06 answers:

> **Can Leyforge author editable source through a governed Forge workflow and turn it into a traceable runtime product?**

## P06.2 Authoritative source packet

- PROD-04 Forge architecture;
- PROD-03 runtime registry/provider boundaries;
- PROD-06 production governance;
- Document Set 21A core Forge concepts;
- 21E Forge UI/UX concepts where current;
- 21F engineering concepts only where not superseded;
- ART-09 execution contract;
- ART-10 minimum certification concepts;
- ART-00 authority map.

## P06.3 Entry gate

- P01 COMPLETE;
- P05 COMPLETE for stable world/runtime manifest assumptions;
- source/bake authority model accepted.

Some UI prototyping may begin earlier, but P06 cannot close before P05.

## P06.4 Dependencies

### Hard

P01 and P05.

### Runtime

Registry adapter target; ability to launch test runtime.

### Forge

None; this is Forge Core.

### Content

One trivial development Forge source class is enough for infrastructure proof.

## P06.5 Universal primitives used

- Identity;
- State;
- Permission/Authority;
- Result/Reason;
- Provenance;
- Composition hooks.

## P06.6 In scope

- Forge application/workspace shell;
- Forge source project/content browser v1;
- source create/load/save;
- source schema/version header;
- provenance/task link;
- unsaved/dirty state;
- inspector foundation;
- 3D/preview viewport foundation;
- shared validation panel shell;
- bake service shell;
- runtime registration handoff;
- launch controlled runtime preview/test world;
- source vs generated-output separation;
- developer authority mode only;
- common error/result handling.

## P06.7 Explicit non-scope

- full Voxel Forge;
- full Material Forge;
- Animation/VFX/Audio Forge;
- player-facing Forge;
- package ecosystem;
- collaboration;
- AI authoring;
- final unified Forge workspace;
- full Creation Journey Engine;
- hot reload for all source types.

## P06.8 Implementation capability requirements

A minimal Forge source must be able to travel:

```text
Create source
→ edit
→ save
→ validate
→ bake
→ register
→ load in runtime/test
```

The exact first source may be a development-only primitive.

P08 is where production block authoring becomes real.

## P06.9 Forge requirements

This slice owns the Forge Core foundation itself.

The UI should already visually distinguish:

- source;
- generated product;
- validation state.

## P06.10 Runtime requirements

Forge runtime preview uses real Leyforge runtime adapters.

Do not build a separate fake game runtime inside the Forge.

## P06.11 Canonical content subset

None required beyond development fixtures.

## P06.12 Persistence implications

Forge source/project persistence is separate from world-save persistence.

Source safe-save/revision basics required.

## P06.13 Multiplayer / authority implications

None.

The authority model should still distinguish developer operations from future restricted creator operations.

## P06.14 Simulation-LOD implications

None.

## P06.15 Accessibility / localisation implications

- usable keyboard navigation where practical;
- scalable editor UI architecture;
- semantic labels/tooltips;
- avoid inaccessible colour-only validation status.

Full certification is later.

## P06.16 Performance implications

Forge should remain responsive for small source.

Long validation/bake operations must have a path to async execution later.

## P06.17 Security / trust implications

P06 is developer-authority only.

Do not expose unrestricted imported/community execution.

## P06.18 Recommended child decomposition

- P06-A — Forge project/source model;
- P06-B — workspace/browser/inspector shell;
- P06-C — validation/bake service shell;
- P06-D — runtime preview handoff;
- P06-E — source safe-save/provenance;
- P06-F — reconciliation.

## P06.19 Acceptance matrix

| ID | Requirement | Evidence | Gate |
| --- | --- | --- | --- |
| P06-AC01 | Forge opens from governed production environment | EV-C | Required |
| P06-AC02 | Editable versioned source can be created/saved/reopened | EV-B / EV-D | Required |
| P06-AC03 | Generated output is stored/identified separately from editable source | EV-A / EV-B | Required |
| P06-AC04 | Validator can emit INFO/WARNING/ERROR/BLOCKER-equivalent result | EV-B | Required |
| P06-AC05 | Invalid source cannot silently become production-valid bake | EV-B negative | Required |
| P06-AC06 | Successful bake records source revision/dependency/tool identity sufficient for traceability | EV-B | Required |
| P06-AC07 | Baked fixture can be launched/observed in real Leyforge runtime/test context | EV-C | Required |
| P06-AC08 | Failed bake does not corrupt editable source | EV-D negative | Required |
| P06-AC09 | Validation states are not colour-only | EV-F | Required |
| P06-AC10 | Final SHA/CI passes | EV-H | Required |

## P06.20 Negative tests

- malformed source;
- unsupported schema;
- failed validator;
- failed bake;
- stale source changed during long operation;
- missing runtime product.

## P06.21 Manual acceptance scenario

Open The Forge.

Create a development source.

Edit one meaningful property.

Save.

Validate.

Bake.

Launch it in the real Test/preview runtime.

Return to Forge and change the source again.

## P06.22 Rule-of-cool target

First time the user sees:

> **THE FORGE**

as a working production tool rather than a document concept. 🔥

## P06.23 Exit gate

Forge source→validate→bake→runtime loop exists.

## P06.24 Downstream unlock

P07 stable registry integration and P08/P09 specialist authoring.

## P06.25 Known risks / ADR triggers

- Forge host architecture if implementation choice materially changes source/tool separation;
- source serialization format;
- editor/plugin vs standalone runtime-host strategy if it changes long-term ownership.

---

# P07 — NAMES OF POWER

**Classification:** FOUNDATION / FORGE-FIRST  
**Arc:** ARC II  
**Player/creator payoff:** Every Forge-created thing has a stable name the game, saves, packages and tools can agree on.

## P07.1 Purpose

Establish production stable content identity and registry resolution.

P07 answers:

> **Can The Forge and runtime refer to content by stable semantic identity without coupling saves and assets to provider-local numbers or file paths?**

## P07.2 Authoritative source packet

- PROD-03 stable-ID/runtime projection architecture;
- PROD-05 Identity/Capability/Provenance;
- PROD-04 source/registry/package architecture;
- current FCC stable identity/invariant authority;
- Set 21D registry/override/variant concepts;
- historical VoxelRegistry as migration evidence only;
- ART-09 source/registry binding requirements.

## P07.3 Entry gate

- P06 COMPLETE;
- P02 semantic voxel mapping already proven.

## P07.4 Dependencies

### Hard

P06.

### Runtime

RegistryService projection.

### Forge

Forge Core source model.

### Content

Small test namespace only.

## P07.5 Universal primitives used

- Identity;
- Capability;
- Provenance;
- Result/Reason;
- State.

## P07.6 In scope

- canonical definition ID format/validation using current authority;
- namespace;
- source identity;
- definition/source binding;
- package/base namespace distinction;
- registry load/index;
- stable reference resolution;
- compact runtime handle allocation;
- provider-local mapping;
- dependency reference basics;
- deprecation/alias/migration hooks;
- duplicate-ID detection;
- missing-reference result;
- display name/localisation-key separation.

## P07.7 Explicit non-scope

- full content-pack public ecosystem;
- community load order;
- full package migration;
- all canonical content migration;
- final localisation implementation;
- save migration of every historical POC identity.

## P07.8 Implementation capability requirements

Required mapping shape:

```text
stable semantic definition ID
↔ Forge source
↔ runtime compact handle
↔ provider-local handle if applicable
```

Stable ID remains authoritative.

## P07.9 Forge requirements

Forge browser/inspector must show:

- stable ID;
- namespace;
- registration state;
- conflicts;
- missing dependency.

## P07.10 Runtime requirements

Registry lookups must work without direct file-path coupling.

## P07.11 Canonical content subset

Create a minimal production namespace containing representative:

- block definition;
- material definition placeholder/reference;
- development fixture.

Do not import the entire legacy registry automatically.

## P07.12 Persistence implications

P05 saves should now be able to reference semantic IDs through the production registry.

Migration hooks should exist before mass content.

## P07.13 Multiplayer / authority implications

IDs must be transferable/negotiable across future network clients.

Compact runtime mappings may differ per process/session.

## P07.14 Simulation-LOD implications

None.

## P07.15 Accessibility / localisation implications

Display name is not ID.

Human-readable labels can change/localise without breaking durable identity.

## P07.16 Performance implications

Registry lookup should be efficient at runtime.

Measure large synthetic registry only if current implementation choice risks poor scaling.

## P07.17 Security / trust implications

Duplicate/protected namespace definitions must fail.

Future package-local namespaces anticipated.

## P07.18 Recommended child decomposition

- P07-A — stable ID schema/validator;
- P07-B — registry source/load/index;
- P07-C — runtime/provider mapping;
- P07-D — Forge integration;
- P07-E — missing/deprecated/migration hooks;
- P07-F — reconciliation.

## P07.19 Acceptance matrix

| ID | Requirement | Evidence | Gate |
| --- | --- | --- | --- |
| P07-AC01 | Stable semantic IDs resolve consistently after restart | EV-B / EV-D | Required |
| P07-AC02 | Duplicate ID is rejected | EV-B negative | Required |
| P07-AC03 | Missing ID returns explicit reason rather than wrong fallback | EV-B negative | Required |
| P07-AC04 | Runtime compact handle can change without changing saved semantic identity | EV-B / EV-D | Required |
| P07-AC05 | Provider-local voxel mapping remains reversible | EV-B | Required |
| P07-AC06 | Display/localisation label change does not change canonical ID | EV-B | Required |
| P07-AC07 | Forge shows registered/unregistered/conflict state | EV-C | Required |
| P07-AC08 | Legacy registry values are not silently promoted as final canon | EV-G review | Required |
| P07-AC09 | Final SHA/CI passes | EV-H | Required |

## P07.20 Negative tests

- duplicate namespace/ID;
- malformed ID;
- protected namespace conflict;
- unresolved dependency;
- stale/deprecated alias behaviour;
- provider handle map reordered.

## P07.21 Manual acceptance scenario

Create/register a test definition.

Restart Forge/game.

Resolve it by stable ID.

Change its file location/display label.

Resolve again.

Confirm identity remains intact.

## P07.22 Rule-of-cool target

None.

This slice is quiet infrastructure with enormous future value.

## P07.23 Exit gate

Stable identity/registry is safe enough for real Forge-authored block/material content.

## P07.24 Downstream unlock

P08, P09 and every later Forge/content family.

## P07.25 Known risks / ADR triggers

- stable ID grammar change;
- package namespace strategy;
- migration alias semantics.

---

# P08 — VOXELWRIGHT

**Classification:** FORGE-FIRST  
**Arc:** ARC II  
**Player/creator payoff:** Create a block or voxel-authored object in The Forge and use it in the real world.

## P08.1 Purpose

Create the first real specialist Forge authoring workflow: Block / Voxel Forge v1.

## P08.2 Authoritative source packet

- PROD-04 Forge architecture;
- PROD-03 voxel runtime boundary;
- PROD-05 Identity/State/Capability/Composition;
- Document 21A Forge Core;
- Document 21B voxel modelling/texturing authoring;
- Set 21D identity/variant rules;
- ART-01 global visual language;
- ART-04 modelling standard;
- ART-09 execution workflow;
- ART-10 applicable block golden/certification requirements;
- Document 03 Blocks Registry for content semantics.

## P08.3 Entry gate

- P06 COMPLETE;
- P07 COMPLETE;
- P02 runtime voxel target stable enough for authored content.

## P08.4 Dependencies

### Hard

P06–P07; P02.

### Forge

Forge Core.

### Runtime

VoxelService + registry.

### Content

Small representative block family.

## P08.5 Universal primitives used

- Identity;
- State;
- Capability;
- Connection/Socket hooks;
- Composition;
- Provenance;
- Result/Reason.

## P08.6 In scope

Voxel/Block Forge v1 must support the minimum modes required for early production:

- ordinary cube/block definition;
- six-face 32×32 surface source association;
- bounded voxel-volume authoring for one unique block/object class if required;
- origin/pivot;
- placement footprint;
- collision profile;
- occlusion/face behaviour;
- named sockets/interaction anchors where relevant;
- state/variant hooks;
- source preview;
- bake to runtime geometry/products;
- registry binding;
- placement test in real world;
- block icon/capture placeholder profile hook;
- deterministic bake manifest.

P08 may implement generated standard shapes only if needed for the initial family; full construction shape programme may be later.

## P08.7 Explicit non-scope

- full item/tool Forge;
- complex machines;
- rigging;
- animation;
- final connected-texture suite;
- mass block catalogue;
- Structure Forge;
- player/restricted Forge;
- arbitrary mesh importer as primary content path.

## P08.8 Implementation capability requirements

Authors choose the simplest correct source representation.

Ordinary full blocks remain surface-led cubes.

Unique silhouettes may use bounded voxel source.

Do not require every block to become a 32³ filled model.

## P08.9 Forge requirements

Guided v1 journey:

```text
Identity
→ block class
→ form/source mode
→ material/surface slots
→ collision/placement
→ optional sockets/state
→ validate
→ bake
→ world placement test
```

Full P128 Creation Journey Engine is not required yet.

A local checklist/profile is sufficient if its data can later migrate.

## P08.10 Runtime requirements

Baked block registers through P07.

World placement/break uses P04.

## P08.11 Canonical content subset

Recommended golden starter family:

- stone;
- dirt/soil;
- grass-topped soil;
- one wood/log or plank block;
- one unique/functional test block.

Content semantics must come from current registry/canon, not the old POC palette.

## P08.12 Persistence implications

Forge-created block identity placed into world must survive P05 save/reload.

## P08.13 Multiplayer / authority implications

None beyond stable IDs.

## P08.14 Simulation-LOD implications

No simulation.

Geometry/runtime products should not prevent later LOD.

## P08.15 Accessibility / localisation implications

- source fields labelled;
- validation readable;
- critical states not colour-only;
- future icon/capture hooks.

## P08.16 Performance implications

Validate:

- geometry complexity;
- collision;
- bake time;
- runtime block-family cost.

Ordinary terrain block must remain efficient.

## P08.17 Security / trust implications

Developer authority only.

## P08.18 Recommended child decomposition

- P08-A — block source schema/journey;
- P08-B — standard surface block authoring;
- P08-C — unique voxel source mode;
- P08-D — collision/pivot/socket/bake;
- P08-E — runtime placement/save proof;
- P08-F — ART/golden review + reconciliation.

## P08.19 Acceptance matrix

| ID | Requirement | Evidence | Gate |
| --- | --- | --- | --- |
| P08-AC01 | New block source can be created through Forge with stable ID | EV-C / EV-B | Required |
| P08-AC02 | Ordinary block uses authorised 32×32 surface workflow | EV-F | Required |
| P08-AC03 | Collision/placement footprint is explicit and validates | EV-B / EV-C | Required |
| P08-AC04 | Bake produces traceable runtime product | EV-B | Required |
| P08-AC05 | Baked block appears through P02/P04 runtime path | EV-C | Required |
| P08-AC06 | Placed authored block survives P05 save/reload by semantic ID | EV-D | Required |
| P08-AC07 | Source change invalidates/rebuilds affected bake | EV-B | Required |
| P08-AC08 | Generated product deletion can be repaired by rebake from source | EV-D | Required |
| P08-AC09 | Representative block passes applicable ART-04 review | EV-F / EV-G | Required |
| P08-AC10 | Terrain-block performance remains inside provisional target | EV-E | Required |
| P08-AC11 | Final SHA/CI passes | EV-H | Required |

## P08.20 Negative tests

- missing registry identity;
- invalid collision bounds;
- missing required surface/material reference;
- stale bake;
- duplicate source binding;
- delete runtime product then rebake.

## P08.21 Manual acceptance scenario

In Forge:

1. create a new authorised block source;
2. assign stable identity;
3. author/assign surfaces;
4. validate;
5. bake;
6. launch test world;
7. place block;
8. save;
9. reload;
10. inspect same block.

## P08.22 Rule-of-cool target

First content-development moment where we can say:

> **“We made that in The Forge.”**

## P08.23 Exit gate

A production block can be authored, registered, baked, placed and persisted without hand-editing provider data.

## P08.24 Downstream unlock

P09 Material Forge and later Structure/Item/Machine authoring.

## P08.25 Known risks / ADR triggers

- source serialization;
- runtime block-library generation;
- collision/bake strategy;
- generated-shape architecture if introduced.

---

# P09 — THE ALCHEMIST'S PALETTE

**Classification:** FORGE-FIRST  
**Arc:** ARC II  
**Player/creator payoff:** Blocks stop being arbitrary colours and begin reading as actual Leyforge materials.

## P09.1 Purpose

Establish Material Forge / Material DNA v1 and bind the first coherent material families to Forge-authored block content.

## P09.2 Authoritative source packet

- PROD-04 shared material authoring;
- PROD-05 Identity/State/Capability;
- Document 21B Material DNA/palette roles/surfaces;
- ART-02 locked material standard;
- ART-01 visual hierarchy;
- ART-04 modelling handoff;
- current material/resource canon;
- Document 06 resource progression for material meaning.

## P09.3 Entry gate

- P08 sufficiently complete to consume materials;
- P07 stable IDs.

P09 may overlap late P08 child work only under explicit ownership.

## P09.4 Dependencies

### Hard

P07–P08.

### Forge

Forge Core + Block/Voxel Forge.

### Runtime

runtime material binding/renderer adapter sufficient for block surfaces.

### Content

Representative wood/stone/soil/crystal material subset.

## P09.5 Universal primitives used

- Identity;
- State;
- Capability;
- Provenance;
- Result/Reason.

## P09.6 In scope

Material Forge v1:

- stable material identity;
- material family;
- parent/inheritance hook;
- named palette roles;
- 32×32 base surface authoring/import;
- roughness/metallic/emission/opacity fields as authorised;
- texture/surface channels needed by current ART;
- deterministic variation hook;
- material-state overlay hooks;
- material sound-family reference hook;
- block/material binding;
- preview under representative lighting;
- low-end/basic fallback;
- validation.

Initial state overlays may be authored but need not all have runtime simulation drivers yet.

## P09.7 Explicit non-scope

- full wetness/snow/rust/corruption runtime simulation;
- every canonical material;
- advanced shader authoring;
- player custom shaders;
- full biome tint system;
- final weather response.

## P09.8 Implementation capability requirements

Material identity remains recognisable across uses.

A block does not own a random one-off palette if it canonically uses a shared material.

## P09.9 Forge requirements

Guided material flow:

```text
Identity
→ family / parent
→ palette roles
→ surface pattern
→ physical presentation fields
→ state responses
→ compatible content
→ preview
→ validate
→ bake
```

## P09.10 Runtime requirements

Material runtime products bind by stable ID/handle.

No unique material instance per placed block as the default architecture.

## P09.11 Canonical content subset

Recommended:

- one stone family;
- one soil/earth family;
- one wood family;
- Flux/mana crystal material family for P11;
- optional metal test material if useful.

Do not attempt every FCC material.

## P09.12 Persistence implications

World saves persist block/material semantic definition references through registered content, not renderer material instance IDs.

## P09.13 Multiplayer / authority implications

None.

## P09.14 Simulation-LOD implications

Material visual variation must be reconstructible/deterministic where required.

## P09.15 Accessibility / localisation implications

Material identity cannot rely only on hue.

Preview must include colour-independent readability checks.

## P09.16 Performance implications

Validate texture/material batching strategy and avoid per-block material explosion.

## P09.17 Security / trust implications

Developer authority only.

## P09.18 Recommended child decomposition

- P09-A — Material DNA schema;
- P09-B — palette/surface authoring;
- P09-C — runtime material bake/binding;
- P09-D — inheritance/variation/state hooks;
- P09-E — preview/ART validation;
- P09-F — reconciliation.

## P09.19 Acceptance matrix

| ID | Requirement | Evidence | Gate |
| --- | --- | --- | --- |
| P09-AC01 | Material source has stable identity/family | EV-B | Required |
| P09-AC02 | 32×32 base surface workflow matches ART-02 | EV-F | Required |
| P09-AC03 | Shared material can bind to more than one content source without identity duplication | EV-B / EV-C | Required |
| P09-AC04 | Deterministic variation reproduces under same defined seed/context where used | EV-B | Required |
| P09-AC05 | Material change invalidates/rebakes affected products only | EV-B | Required |
| P09-AC06 | Runtime does not allocate one unique material per placed ordinary block by default | EV-E / review | Required |
| P09-AC07 | Material remains distinguishable under representative lighting and colour-reduced review | EV-F / EV-G | Required |
| P09-AC08 | Flux crystal material can express restrained emission without losing material truth | EV-F | Required |
| P09-AC09 | Final SHA/CI passes | EV-H | Required |

## P09.20 Negative tests

- missing parent material;
- inheritance cycle;
- invalid palette role;
- unsupported transparency/emission combination;
- deleted surface dependency;
- duplicate material ID.

## P09.21 Manual acceptance scenario

Open stone, wood and Flux crystal materials in Forge.

Compare them under:

- neutral light;
- darker cave light;
- low-effect/basic profile.

Place representative blocks in runtime and verify identity remains readable.

## P09.22 Rule-of-cool target

The world begins to look intentionally **Leyforge**, not just “a block demo.”

## P09.23 Exit gate

Material authoring is stable enough for the first Forge Test Laboratory and P11 fantasy teaser.

## P09.24 Downstream unlock

P10 and P11.

## P09.25 Known risks / ADR triggers

- texture array/atlas strategy if it changes runtime contract;
- shader/material-resource architecture;
- inheritance schema.

---

# P10 — THE TESTING CRUCIBLE

**Classification:** FORGE-FIRST / FOUNDATION  
**Arc:** ARC II  
**Player/creator payoff:** A creator can deliberately test what they made instead of discovering problems randomly in the main world.

## P10.1 Purpose

Create Test Laboratory v1 as the shared Forge/runtime validation environment.

P10 answers:

> **Can a Forge source be tested in controlled real-runtime conditions with reproducible evidence?**

## P10.2 Authoritative source packet

- PROD-04 Test Laboratory architecture;
- PROD-06 evidence governance;
- ART-09 execution;
- ART-10 golden/certification concepts;
- 21E/21F Forge testing concepts where current;
- ART-01/02/04 relevant review requirements;
- current P08/P09 source/bake pipelines.

## P10.3 Entry gate

- P06–P09 sufficiently complete;
- at least one Forge-authored block/material test asset exists.

## P10.4 Dependencies

### Hard

P06–P09.

### Forge

Forge source/validation/bake.

### Runtime

P02–P05 production world path.

### Content

Representative block/material fixtures.

## P10.5 Universal primitives used

- Identity;
- State;
- Result/Reason;
- Provenance;
- Capability;
- Composition hook.

## P10.6 In scope

Test Laboratory v1 should support:

- deterministic/identified test scenario;
- neutral block/material studio;
- small terrain/placement field;
- spawn/place selected authored block;
- change time/light preset where current runtime allows;
- first-person inspection;
- distance/silhouette inspection;
- collision/placement test;
- break/place test;
- save/reload test hook;
- low-end/basic presentation profile hook;
- golden-reference/capture slots;
- evidence/report output;
- launch from Forge;
- return to Forge.

## P10.7 Explicit non-scope

- creature combat lab;
- machine lab;
- vessel sea trial;
- realm test world;
- multiplayer arena;
- final performance laboratory;
- final universal Test Lab P133.

P10 is the shared seed these later labs extend.

## P10.8 Implementation capability requirements

The Test Lab uses the real runtime.

It may use developer controls to arrange conditions.

It may not fake the system being tested.

## P10.9 Forge requirements

A source should expose:

- `Test`;
- `Validate`;
- relevant scenario selection;
- result/evidence.

## P10.10 Runtime requirements

Test scenarios identify:

- world/test fixture;
- source revision;
- bake revision;
- runtime build.

## P10.11 Canonical content subset

P08/P09 golden starter assets.

## P10.12 Persistence implications

At least one scenario should verify P05 persistence for Forge-created block.

Test worlds may be disposable.

## P10.13 Multiplayer / authority implications

None.

## P10.14 Simulation-LOD implications

Not yet.

## P10.15 Accessibility / localisation implications

Test Lab can expose:

- colour-independent check;
- reduced-effect/basic presentation preview;
- readable validation text.

## P10.16 Performance implications

Capture basic metrics for block/material fixtures.

Do not treat P10 as full performance certification.

## P10.17 Security / trust implications

Developer-only test controls.

## P10.18 Recommended child decomposition

- P10-A — scenario/test-world framework;
- P10-B — block/material studio;
- P10-C — Forge launch/return integration;
- P10-D — evidence/capture/report binding;
- P10-E — accessibility/basic profile;
- P10-F — PG-02 reconciliation support.

## P10.19 Acceptance matrix

| ID | Requirement | Evidence | Gate |
| --- | --- | --- | --- |
| P10-AC01 | Forge can launch selected source into identified Test Lab scenario | EV-C | Required |
| P10-AC02 | Scenario uses real P02–P05 runtime systems | EV-A / review | Required |
| P10-AC03 | Source revision/bake/runtime identity are recorded with result | EV-B | Required |
| P10-AC04 | Block collision/placement/break test can run | EV-C | Required |
| P10-AC05 | Forge-authored block persistence scenario can run | EV-D | Required |
| P10-AC06 | Neutral/context lighting views support ART review | EV-F | Required |
| P10-AC07 | Validation failure links back to affected source | EV-C | Required |
| P10-AC08 | Evidence/report cannot claim PASS when required scenario failed | EV-B negative | Required |
| P10-AC09 | Test Lab can be extended without editing each specialist tool privately | EV-A / review | Required |
| P10-AC10 | Final SHA/CI passes | EV-H | Required |

## P10.20 Negative tests

- stale bake selected;
- missing source;
- failed scenario;
- source changes while test running;
- evidence report with mismatched candidate rejected.

## P10.21 Manual acceptance scenario

From a Forge-authored block:

1. press Test;
2. launch neutral studio;
3. inspect close/far;
4. place/break;
5. inspect collision;
6. run save/reload scenario;
7. return to Forge;
8. see results linked to source.

## P10.22 Rule-of-cool target

The first proper:

> **“I made this → press Test → I'm standing next to it in Leyforge.”**

moment.

## P10.23 Exit gate — PG-02 FORGE CORE

PG-02 can pass when:

- P06–P10 COMPLETE;
- Forge source→validate→bake→register→runtime test chain works;
- stable identity survives;
- representative block/material passes Test Lab;
- no hidden provider/file-path authority exists.

## P10.24 Downstream unlock

P11 and ARC III Forge-first content work.

## P10.25 Known risks / ADR triggers

- test-world hosting architecture;
- runtime/Forge process boundary if it materially affects hot reload or source safety.

---

# P11 — A GLIMMER IN THE STONE

**Classification:** COOL-PULL  
**Arc:** ARC II  
**Player/creator payoff:** The first unmistakable hint that this is not merely a voxel survival game: something magical is buried in the stone.

## P11.1 Purpose

Use the production block/material/registry/Test Lab pipeline to introduce the first restrained Fluxion-world identity into the Overworld.

P11 proves:

- Forge-created magical material can exist as normal registered content;
- worldgen can place it through semantic identity;
- presentation can communicate “unusual/magical” without requiring the future magic runtime.

## P11.2 Authoritative source packet

- current magic/resource canon;
- Document 03 mana/Flux crystal ore identity;
- Document 06 Mana Crystal as physical magic fuel/infrastructure material;
- ART-01 ordinary-vs-magical hierarchy;
- ART-02 crystal/emission/material rules;
- ART-06 magic/VFX/lighting rules where applicable;
- P08 Block/Voxel Forge;
- P09 Material Forge;
- P10 Test Lab;
- PROD-03 worldgen/provider boundary.

## P11.3 Entry gate

- PG-02 passed or P06–P10 individually complete;
- Flux/mana crystal canonical naming/identity resolved under current canon.

If historical docs say `Mana Crystal` and current production canon prefers `Flux`/`Fluxion`, the production definition must use the currently authoritative identity and preserve migration aliases as needed rather than inventing a third name.

## P11.4 Dependencies

### Hard

P08–P10; P02 worldgen interface.

### Forge

Voxel/Block Forge + Material Forge + Test Lab.

### Runtime

Worldgen placement of a semantic block.

### Content

One Flux-bearing crystal ore/source family.

## P11.5 Universal primitives used

- Identity;
- State;
- Capability;
- Knowledge hook;
- Provenance;
- Result/Reason.

## P11.6 In scope

- canonical Flux-bearing crystal block/resource identity;
- Forge source;
- material source;
- restrained emission/presentation;
- placement/worldgen rule suitable for a rare teaser;
- semantic capability such as `flux_bearing` or current equivalent;
- runtime registration;
- Test Lab review;
- real-world generation;
- optional ambient visual/audio cue only if current shared presentation capability can support it without inventing later systems.

## P11.7 Explicit non-scope

P11 does **not** implement:

- item drop;
- inventory stack;
- mana meter;
- spell;
- Rune Forge;
- alchemy;
- mana furnace processing;
- conduits;
- wards;
- magic network;
- magical progression UI.

Harvest/drop behaviour waits for P12+.

Full Flux runtime waits for P64.

## P11.8 Implementation capability requirements

The crystal must be an ordinary registered world content definition with magical semantics.

It must not be a one-off scene spawned beside the player.

## P11.9 Forge requirements

Use the real P08/P09 workflow.

No manually-authored secret runtime material outside Forge.

## P11.10 Runtime requirements

Worldgen places semantic identity.

Same seed/feature rule should reproduce required placement semantics where current local generator contract requires determinism.

## P11.11 Canonical content subset

Exactly enough to create one convincing crystal-bearing ore/source family.

Do not begin the full magic resource catalogue.

## P11.12 Persistence implications

If player/debug edits affect the crystal, P05 persists the block state.

No resource inventory persistence yet.

## P11.13 Multiplayer / authority implications

None.

## P11.14 Simulation-LOD implications

None.

## P11.15 Accessibility / localisation implications

The magical identity should not rely on glow/colour alone.

Shape/material pattern/silhouette should contribute.

## P11.16 Performance implications

Emission/effect must remain cheap enough for repeated deposits.

Do not use one dynamic light Node per crystal block as the default solution.

## P11.17 Security / trust implications

None.

## P11.18 Recommended child decomposition

- P11-A — canonical identity/migration naming;
- P11-B — crystal block/model source;
- P11-C — Flux crystal material/presentation;
- P11-D — worldgen placement;
- P11-E — Test Lab + in-world ART review;
- P11-F — parent/Arc II reconciliation.

## P11.19 Acceptance matrix

| ID | Requirement | Evidence | Gate |
| --- | --- | --- | --- |
| P11-AC01 | Crystal uses current canonical stable identity | EV-A | Required |
| P11-AC02 | Source is authored through P08/P09 Forge paths | EV-B / EV-C | Required |
| P11-AC03 | Runtime placement resolves by semantic ID, not raw provider type | EV-B | Required |
| P11-AC04 | Same defined seed/context reproduces required semantic placement behaviour | EV-B | Required |
| P11-AC05 | Crystal reads as materially distinct/magical under ART rules without glow-only dependence | EV-F / EV-G | Required |
| P11-AC06 | Presentation does not require P64 magic runtime | EV-A / review | Required |
| P11-AC07 | Crystal edit state persists through P05 | EV-D | Required |
| P11-AC08 | Repeated deposit presentation stays inside provisional performance envelope | EV-E | Required |
| P11-AC09 | No item/drop/inventory capability is falsely claimed | EV-G review | Required |
| P11-AC10 | Final SHA/CI passes | EV-H | Required |

## P11.20 Negative tests

- missing crystal material dependency;
- wrong/legacy ID mapping;
- raw provider TYPE reused as semantic check;
- emission disabled still leaves recognisable crystal identity;
- low/basic presentation remains readable.

## P11.21 Manual acceptance scenario

Start a real generated test world.

Travel/mine/debug-navigate into appropriate terrain.

Find the crystal naturally through the generation rule.

Inspect it:

- up close;
- from a short distance;
- in darker lighting;
- with reduced/basic effects.

Break/remove and save/reload only as a voxel-state test if desired.

No magical power should be granted yet.

## P11.22 Rule-of-cool target

This is our first deliberate:

> **“Wait... what the fuck is THAT?”**

moment. 😂

The game should briefly hint at the massive magic/civilisation game hiding behind the survival foundation.

## P11.23 Exit gate

ARC II closes when:

- Forge Core exists;
- stable registry exists;
- Block/Voxel Forge exists;
- Material Forge exists;
- Test Lab exists;
- Flux crystal is created through those systems and appears in the real world.

## P11.24 Downstream unlock

ARC III — HEARTH & HAMMER:

- P12 What the Earth Gives;
- P13 Pack & Pocket;
- P14 Tools of the First Age;
- P15 Spark & Timber;
- P16 Craft of Hand;
- P17 Fire and Iron.

## P11.25 Known risks / ADR triggers

- final production identity/name if current canon conflicts;
- worldgen feature identity if local generator cannot preserve required deterministic semantics;
- material/emission implementation if it violates ART/runtime batching constraints.

---

# 05. Arc I Integration Gate — PG-01 Summary

PG-01 requires:

| Capability | Parent |
| --- | --- |
| Production bootstrap | P01 |
| Voxel world | P02 |
| Player movement/query | P03 |
| Authoritative edits | P04 |
| Save/reload persistence | P05 |

Minimum end-to-end scenario:

```text
boot
→ create/open world
→ stream terrain
→ move player
→ break/place blocks
→ save
→ close
→ reopen
→ return
→ edits remain
```

No Forge is required for PG-01.

---

# 06. Arc II Integration Gate — PG-02 Summary

PG-02 requires:

| Capability | Parent |
| --- | --- |
| Forge Core | P06 |
| Stable registry | P07 |
| Block/Voxel Forge | P08 |
| Material Forge | P09 |
| Test Laboratory v1 | P10 |

P11 then proves the chain with an actual fantasy content asset.

Minimum end-to-end scenario:

```text
open Forge
→ create registered block/material source
→ validate
→ bake
→ Test Lab
→ register in runtime
→ generate/place in world
→ save/reload
```

---

# 07. Recommended Production Concurrency

The numeric order remains default.

Limited concurrency may be allowed as follows:

## After P01

P02 work begins.

P06 UI shell mock-up may be explored, but P06 cannot close before P05 and must not invent final runtime/source contracts independently.

## During P02/P03

P03 input/body work may begin once collision/query interfaces are stable enough.

P04 command schema can be drafted but not considered READY until required P02/P03 contracts exist.

## During P08/P09

P09 material-source schema may proceed alongside late P08 tooling if:

- ownership is explicit;
- source contracts do not conflict;
- shared registry is stable.

## P10

P10 should start early enough to support P08/P09 validation, but its parent completion occurs after representative source pipelines exist.

This is a deliberate feedback loop, not an excuse to ignore roadmap gates.

---

# 08. What Must NOT Sneak Into Arcs I–II

To protect production velocity, the following are explicitly deferred.

## Gameplay

- drops/pickups;
- inventory;
- tools;
- survival;
- crafting;
- combat;
- NPCs;
- settlements;
- automation;
- full magic.

## World

- final biomes;
- continental generator;
- full caves;
- weather;
- ocean;
- structures;
- dungeons;
- realms.

## Forge

- Animation Forge;
- VFX Forge;
- Sound Forge;
- Structure Forge;
- Machine Forge;
- Creature Forge;
- Unified Forge;
- public/player Forge;
- packages/mods;
- AI.

## Release

- full menus/settings;
- localisation completion;
- multiplayer;
- dedicated servers;
- final optimisation.

If an early system needs a future hook, implement the smallest explicit interface.

Do not pull the future system forward.

---

# 09. First Production Task Recommendation

When the PROD corpus is accepted and PG-00 is being prepared, the first actual implementation Task Contract should be smaller than P01 itself.

Recommended first task shape:

> **P01-A — Verify and Pin Production Toolchain / Bootstrap Authority**

It should:

- verify repository/workspace;
- verify branch/upstream;
- verify current HEAD;
- verify Godot 4.7.2 project compatibility;
- inspect current Zylann integration;
- record selected provider build/edition;
- run the smallest existing boot/smoke check;
- make only the bounded changes explicitly required to establish the pin/diagnostic record.

It should **not** immediately implement P01-B/C/D.

This lets the first production execution certify that the new PROD governance actually works before larger code begins.

---

# 10. ProductionRegistry Seed Entries

PROD-07 should seed at minimum:

```text
P001 — The Empty Canvas
P002 — Stone Beneath Our Feet
P003 — First Footfall
P004 — The First Scar
P005 — The World Remembers
P006 — The Forge Ignites
P007 — Names of Power
P008 — Voxelwright
P009 — The Alchemist's Palette
P010 — The Testing Crucible
P011 — A Glimmer in the Stone
```

Initial status should remain `UNASSESSED` or the current governed equivalent until repository/authority readiness is actually evaluated.

Do not mark P01 READY merely because PROD-07 exists.

---

# 11. Open Decisions Deliberately Deferred to Execution Evidence

The following are **not** silently decided in PROD-07:

- exact Zylann module vs GDExtension packaging if current repo has not already locked it;
- exact voxel block/data dimensions;
- final active streaming radius;
- far-distance terrain LOD;
- storage provider/database choice;
- final world-save format;
- exact Forge source serialization;
- exact Forge host/editor implementation;
- final texture-array/atlas implementation;
- final shader architecture.

Where one becomes necessary for P01–P11, allocate a bounded proof/ADR and choose from evidence.

---

# 12. PROD-07 Acceptance Gate

PROD-07 is ready for owner lock when the owner agrees that:

- [ ] P01–P11 retain the names/order locked by PROD-02;
- [ ] P01 is a small production bootstrap rather than “build the whole engine”;
- [ ] P02 makes Zylann the voxel substrate without giving it semantic authority;
- [ ] P03 player identity remains distinct from the active Godot Node;
- [ ] P04 establishes command/validation/SpatialChangeSet rather than direct player-script voxel writes;
- [ ] P05 proves Leyforge-owned world persistence and semantic edit reload;
- [ ] PG-01 ends with the world remembering player edits;
- [ ] P06 establishes a minimum real Forge source→validate→bake→runtime chain;
- [ ] P07 stable IDs outrank runtime/provider handles and file paths;
- [ ] P08 creates real production block/voxel authoring through The Forge;
- [ ] P09 implements Material DNA / 32×32 material-family authoring under ART-02;
- [ ] P10 Test Laboratory uses the real runtime and candidate-bound evidence;
- [ ] P11 is a restrained Flux crystal teaser rather than premature magic implementation;
- [ ] P11 does not falsely claim item drops/inventory before P12/P13;
- [ ] current/legacy `Mana Crystal` vs `Flux` naming must resolve through current authority rather than guesswork;
- [ ] mass content production is deferred until Forge/runtime pipelines are proven;
- [ ] child-slice IDs remain recommendations until allocated through ProductionRegistry;
- [ ] exact engineering parameters remain evidence-driven where PROD-03 left them open;
- [ ] PG-00 remains required before P01 code execution;
- [ ] PROD-07 does not mark any P-slice READY merely because the document exists.

---

# 13. Proposed Lock Statement

If owner-approved, lock the following:

> **PROD-07 — LEYFORGE ARCS I–II PRODUCTION CONTRACTS — v0.1**
>
> Leyforge production begins with two deliberately bounded foundation Arcs. ARC I establishes the real production project, a semantically wrapped Zylann voxel world, first-person player movement, authoritative block edits and Leyforge-owned save/reload persistence. ARC II establishes the minimum Forge authoring platform, stable registry identity, Block/Voxel Forge, Material Forge and Test Laboratory, then proves that pipeline by creating and placing a restrained Flux-bearing crystal through the real Forge/runtime path. P01–P11 may decompose into governed child slices but may not expand into later inventory, crafting, civilisation, automation, full magic, worldgen or release systems. Provider handles, runtime Nodes, file paths and generated products remain subordinate to stable Leyforge identity and source authority. PG-01 closes only when the world remembers edits; PG-02 closes only when Forge source can be validated, baked, registered and tested in the real runtime. P11 closes the volume by showing the first unmistakable hint of Leyforge's magical identity without prematurely implementing the magic system.

---

# 14. Next Document

After PROD-07 acceptance/reconciliation, continue to:

> **PROD-08 — Arcs III–IV Production Contracts: P12–P24**

That volume will cover:

- resource drops/pickups;
- inventory/hotbar;
- Item & Tool Forge;
- early survival;
- Recipe Forge/crafting;
- furnace/metal integration;
- Animation Forge;
- VFX Forge;
- Lighting Forge;
- Sound Forge;
- Music Forge;
- Music Lab;
- unified Presentation State integration.

---

**End of PROD-07 v0.1 — Arcs I–II Production Contracts Candidate**
