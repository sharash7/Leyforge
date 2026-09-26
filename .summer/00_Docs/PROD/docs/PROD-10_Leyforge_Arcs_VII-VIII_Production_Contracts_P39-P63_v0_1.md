
# LEYFORGE PRODUCTION PROGRAMME

## PROD-10 — Arcs VII–VIII Production Contracts: P39–P63

**Document ID:** PROD-10  
**Title:** Leyforge Arcs VII–VIII Production Contracts — From Campfire to Kingdom / Gears Beneath the Earth  
**Version:** v0.1  
**Date:** 21 September 2026  
**Status:** **LOCKED — OWNER-APPROVED PRODUCTION AUTHORITY**  
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
**Previous executable volumes:** PROD-07, PROD-08, PROD-09  
**Arc scope:** ARC VII — FROM CAMPFIRE TO KINGDOM / ARC VIII — GEARS BENEATH THE EARTH  
**Parent slices:** P39–P63  
**Programme gates:** PG-07 Settlement Foundation, PG-08 Production & Automation Foundation  
**Primary downstream consumers:** ProductionRegistry, Project Brain, Task Contracts, Codex/coding agents, CI, runtime/Forge implementation, PROD-11 onward

---

# 00. Executive Arc Statement

PROD-10 is where Leyforge's civilisation promise becomes real.

ARC VI ended with three named people living around one fire.

ARC VII asks:

> **Can those people turn shared needs, resources, labour and space into a real settlement that grows because of what physically exists in the world?**

ARC VIII then asks:

> **Can that settlement become economically capable enough to gather, process, store, haul, power and automate real production without cheating resources into existence?**

The combined progression is:

```text
THREE PEOPLE
→ STRUCTURE DEFINITIONS
→ STRUCTURE FORGE
→ SEMANTIC BUILDINGS
→ CONSTRUCTION PROJECTS
→ BUILDER PROFESSION
→ HOUSEHOLDS
→ SETTLEMENT PLANNING
→ ROADS / PARCELS
→ MIGRATION
→ HAMLET
→ PROFESSIONS
→ EXTRACTION
→ NPC CRAFTING
→ WAREHOUSING
→ HAULING
→ AUTONOMOUS PRODUCTION
→ MECHANICAL POWER
→ MACHINE NETWORK CONTRACT
→ MACHINE FORGE
→ MACHINES
→ AUTOMATED LOGISTICS
→ SIGNAL / LOGIC
→ FACTORY
→ WORKING TOWN ECONOMY
```

The design promise of ARC VII is:

> **Buildings are not decorative bonuses. They are validated semantic compositions that people can inhabit and use.**

The design promise of ARC VIII is:

> **Automation does not replace the settlement simulation; it plugs into the same real resource, work, storage and logistics systems.**

---

# 01. Governing Production Rules for P39–P63

## 01.1 Structures are compositions of registered content

A Structure source references:

- registered blocks;
- registered materials/material roles;
- registered furniture/components;
- semantic markers;
- zones;
- sockets;
- construction stages;
- state deltas.

A Structure source may **not** invent private block/material definitions that exist only inside that blueprint.

If a new block is required:

> create → validate → bake → register through the appropriate Forge first.

Then Structure Forge may reference it.

## 01.2 Visual completion does not imply functional completion

A building counts as Housing, Work, Health, Safety, Infrastructure, etc. only when its required semantic contract validates.

Examples:

A cottage does not provide Housing merely because it has walls.

A blacksmith does not provide metalwork merely because it contains an anvil model.

A warehouse does not store settlement stock merely because crates are visible.

Function derives from:

- valid markers;
- valid zones;
- access;
- routes;
- stock;
- staff;
- utilities;
- permissions;
- operational state.

## 01.3 Construction uses exact conserved resources

Projects reserve, deliver and consume real content.

Nearby construction visibly places real voxel stages.

Distant construction may advance through bounded summaries later, but its:

- resources;
- labour;
- project state;
- completion;

must reconcile.

## 01.4 Builder is a real profession

P43 proves the construction runtime.

P50 owns **Builder** as a canonical profession definition.

This means Builder may have:

- skills;
- tools;
- schedules;
- work eligibility;
- project access;
- specialisations;
- progression.

P43 may initially use a minimal Builder-capable task profile, but it must later bind to the canonical P50 profession rather than remaining a special construction-only NPC class.

Potential later specialisations include:

- labourer;
- builder;
- mason;
- carpenter;
- engineer;
- repairer.

## 01.5 Player and NPC construction share semantic structure truth

Players and NPCs may interact with construction differently.

They do not receive incompatible building definitions.

Structure source, stages, materials and functional semantics remain shared.

## 01.6 Settlement planning is not omniscient city painting

NPC settlements choose projects from:

- needs;
- opportunities;
- shortages;
- terrain;
- available resources;
- routes;
- culture;
- skills;
- maintenance;
- danger;
- permissions.

The planner selects **what should happen**.

Structure Forge and construction runtime determine **what it means to build it**.

## 01.7 Roads are functional infrastructure

A road/path is not just a visual decal.

Road/network state affects:

- travel cost;
- accessibility;
- parcels;
- deliveries;
- work;
- emergency access;
- future carts/caravans.

## 01.8 Settlement growth remains slow enough for the player to matter

NPC settlements may grow autonomously.

The player should meaningfully accelerate or redirect growth by:

- supplying scarce materials;
- building;
- trading;
- opening routes;
- defending;
- introducing automation;
- later magic/knowledge.

Autonomy must not make player contribution pointless.

## 01.9 ARC VIII conserves resources everywhere

NPC labour, warehouse logic, hauling, machine processing and logistics all use the same Transaction principles.

No system may:

- spawn outputs because worker animation completed;
- delete input because a belt unloaded;
- duplicate stock when LOD changes;
- create warehouse stock from capacity.

## 01.10 Profession owns role semantics; planner owns task choice

Profession answers:

> what work can this NPC perform and under what requirements?

Planner answers:

> which valid task should this NPC perform now?

Workplace answers:

> what work is available here?

These are related but distinct.

## 01.11 Warehousing distinguishes stock classes

Settlement storage should support at minimum conceptual separation of:

- available stock;
- reserved project stock;
- workplace inputs;
- workplace outputs;
- emergency reserve;
- trade stock;
- private/owned stock where applicable.

Capacity is not stock.

## 01.12 Universal connection architecture exists before P56

PROD-05 already corrected the P56/P57 dependency.

The universal typed Connection/Port/Socket contract is architecturally available before mechanical power implementation.

P57 remains the roadmap milestone that **fully implements/proves the machine/network-facing use of that contract**.

This avoids renumbering P01–P192 while maintaining the correct dependency.

## 01.13 Network domains share infrastructure, not physics

Mechanical power, items, Flux, fluid and signal may reuse:

- typed endpoints;
- graph identity;
- ownership;
- capacity;
- diagnostics.

They do not share one universal propagation equation.

## 01.14 Signal & Logic Forge is bounded visual logic

P61 supports:

- triggers;
- conditions;
- timers;
- counters;
- comparisons;
- gates;
- state reads;
- approved actions.

It does not provide unrestricted scripting by default.

## 01.15 A factory is a composition, not a bespoke system

P62 should prove:

```text
deposit
→ extraction
→ logistics
→ machine
→ furnace/process
→ storage
```

using already existing systems.

Do not create `FirstFactorySystem`.

---

# 02. Common Evidence Rules for This Volume

ARC VII particularly requires:

- structure semantic validation;
- construction-stage conservation;
- NPC builder/task evidence;
- household/residency persistence;
- settlement-planner reason traces;
- route/parcels validity;
- migration causality;
- Campfire → Hamlet end-to-end integration.

ARC VIII particularly requires:

- profession/task separation;
- gathering/extraction conservation;
- NPC crafting;
- storage/reservations;
- hauling;
- distant/away-state reconciliation;
- power graph behaviour;
- typed machine ports;
- machine transaction safety;
- automated logistics;
- bounded signal/logic;
- complete factory/town integration.

---

# 03. ARC VII — FROM CAMPFIRE TO KINGDOM

---

# P39 — THE ARCHITECT'S TABLE

**Classification:** FOUNDATION  
**Arc:** ARC VII — FROM CAMPFIRE TO KINGDOM  
**Player/creator payoff:** Leyforge gains one authoritative concept of a building/structure blueprint that both the world and The Forge understand.

## P39.1 Purpose

Establish the Structure / Blueprint semantic contract.

P39 answers:

> **What does Leyforge need to know about a building beyond the blocks it contains?**

## P39.2 Authoritative source packet

Primary:

- PROD-03 structure/world-edit architecture;
- PROD-04 composition/Structure Forge architecture;
- PROD-05 Composition, Identity, Connection, Capability;
- Document 19 Settlement Growth & Player Voxel Blueprint System;
- 20A–20H structure/service contracts;
- Set 22I Blueprint Forge;
- ART-03 architecture/culture direction;
- ART-04 structure modelling;
- ART-09/10 production/certification.

## P39.3 Entry gate

- PG-06 COMPLETE;
- registered block/material ecosystem functional;
- P04/P05 world mutation/persistence stable.

## P39.4 Dependencies

### Hard

P08/P09, P24, P38.

### Forge

Forge Core; Block/Material services.

### Runtime

world edits; persistence; NPC movement/service concepts.

### Content

small structure fixture set.

## P39.5 Universal primitives used

- Identity;
- State;
- Capability;
- Composition;
- Connection/Socket;
- Ownership;
- Permission;
- Provenance;
- Result/Reason.

## P39.6 In scope

Structure Definition/source contract covering:

- stable structure identity;
- voxel composition;
- nested modules;
- registered-content references;
- material roles;
- stable internal element IDs;
- entrances;
- rooms/zones;
- job/service markers;
- storage markers;
- sleep/household markers;
- construction markers;
- interaction markers;
- route sockets;
- utility/network sockets;
- module/upgrade sockets;
- placement envelope;
- terrain constraints;
- construction stage graph;
- stage deltas;
- state variants/deltas;
- damage/repair hooks;
- functional/service profile;
- icon/capture profile;
- dependencies;
- validation profile;
- runtime bake contract;
- placed-instance record contract.

## P39.7 Explicit non-scope

- full Structure Forge UI;
- final player Blueprint Workshop;
- city districts;
- procedural structure generation;
- dungeon topology;
- every building family;
- structural physics.

## P39.8 Implementation capability requirements

The contract must distinguish:

```text
functional definition
editable Structure Forge source
runtime bake product
construction project
placed structure instance
```

These are not one object.

## P39.9 Forge requirements

P40 consumes this contract.

## P39.10 Runtime requirements

Placed structure instance owns:

- location;
- state;
- condition;
- ownership;
- commissioning/function state;
- damage;
- runtime links.

Editable source does not mutate placed world instances automatically.

## P39.11 Canonical content subset

Representative profiles:

- simple house/cottage;
- work/storage structure;
- road/path module hook.

## P39.12 Persistence implications

Placed structures persist by:

- stable structure definition/source revision reference;
- stable element IDs where required;
- placed runtime state.

## P39.13 Multiplayer / authority implications

Placement/ownership/permissions remain future-authority compatible.

## P39.14 Simulation-LOD implications

Structure function persists even when full geometry/presentation unloads.

## P39.15 Accessibility / localisation implications

Validation/reason text must be readable/localisable.

## P39.16 Performance implications

Structure bake products should not require scanning every voxel each frame to answer functional questions.

## P39.17 Security / trust implications

Player/community blueprints later cannot insert arbitrary executable content or private registry definitions.

## P39.18 Recommended child decomposition

- P39-A — structure source/definition schema;
- P39-B — markers/zones/sockets;
- P39-C — construction/state delta contract;
- P39-D — runtime placed-instance record;
- P39-E — registered-content/dependency validation;
- P39-F — reconciliation.

## P39.19 Acceptance matrix

| ID | Requirement | Evidence | Gate |
| --- | --- | --- | --- |
| P39-AC01 | Structure source references registered canonical content only | EV-B | Required |
| P39-AC02 | Source, bake, project and placed instance are distinct records | EV-A / EV-B | Required |
| P39-AC03 | Stable internal element IDs survive valid source revisions where required | EV-B / EV-D | Required |
| P39-AC04 | Markers/zones/sockets use shared semantic contracts | EV-B | Required |
| P39-AC05 | Construction stages describe ordered deltas rather than duplicated full hidden structures | EV-B | Required |
| P39-AC06 | Placed instance state persists independently of editable source | EV-D | Required |
| P39-AC07 | Missing/private content dependency blocks validation | EV-B negative | Required |
| P39-AC08 | Final SHA/CI passes | EV-H | Required |

## P39.20 Negative tests

- private/unregistered block reference;
- invalid stage order;
- duplicate internal element ID;
- marker outside valid zone;
- incompatible socket direction;
- source revision changes after instance placement.

## P39.21 Manual acceptance scenario

Inspect a simple cottage source definition.

Change an allowed source property.

Bake.

Place instance.

Modify source again.

Confirm placed instance does not magically rewrite itself without governed migration/update action.

## P39.22 Rule-of-cool target

None required.

This is the semantic foundation that makes every later city possible.

## P39.23 Exit gate

Structure contract stable enough for Forge authoring.

## P39.24 Downstream unlock

P40.

## P39.25 Known risks / ADR triggers

- voxel-volume source representation;
- stable element-ID migration;
- placed-instance/source update policy.

---

# P40 — STONE DREAMS

**Classification:** FORGE-FIRST  
**Arc:** ARC VII  
**Player/creator payoff:** A creator can build a real semantic structure in a 3D Forge environment and test it in Leyforge.

## P40.1 Purpose

Create Structure Forge v1.

## P40.2 Authoritative source packet

- P39;
- PROD-04 specialist/composition Forge law;
- Set 22I Blueprint Forge;
- Document 19 Blueprint systems;
- 20A–20H required source layers;
- ART-03/04;
- ART-09/10.

## P40.3 Entry gate

- P39 COMPLETE;
- Block/Material Forge stable.

## P40.4 Dependencies

### Hard

P39.

### Forge

P06–P10, P08/P09.

### Runtime

world placement Test Lab.

## P40.5 Universal primitives used

- Identity;
- Composition;
- Connection/Socket;
- Capability;
- State;
- Provenance;
- Result/Reason.

## P40.6 In scope

Structure Forge v1:

- 3D voxel construction workspace;
- registered-content browser;
- material-role assignment;
- transform/selection/editing;
- modules;
- stable element IDs;
- markers;
- zones;
- sockets;
- room/functional overlays;
- construction stages;
- stage preview;
- state/damage preview hooks;
- placement envelope;
- cost compilation;
- validation;
- deterministic bake;
- runtime/Test Lab launch;
- icon/capture hook.

## P40.7 Explicit non-scope

- final public Blueprint Workshop;
- district editor;
- dungeon editor;
- AI structure generation;
- arbitrary scripts;
- full procedural roof/stair system unless needed by initial fixture.

## P40.8 Implementation capability requirements

Structure Forge asks structure-specific questions.

It reuses:

- Block/Voxel Forge;
- Material Forge;
- Animation/VFX/Sound where later applicable;
- Test Lab;
- registry/dependency services.

## P40.9 Forge requirements

Guided journey:

```text
Identity / function
→ layout / modules
→ registered blocks/material roles
→ entrances / rooms / zones
→ markers
→ sockets
→ construction stages
→ states
→ placement
→ cost
→ validate
→ Test Lab
→ bake
```

## P40.10 Runtime requirements

Baked source must be usable by P42 construction runtime.

## P40.11 Canonical content subset

Minimum golden structures:

- simple cottage;
- simple communal/store/work structure.

## P40.12 Persistence implications

Source saved/versioned.

Placed instance remains separate.

## P40.13 Multiplayer / authority implications

Developer Forge only.

Restricted player version later shares services but not authority.

## P40.14 Simulation-LOD implications

Bake should include compact functional summary independent of full voxel geometry where useful.

## P40.15 Accessibility / localisation implications

Validation overlays not colour-only.

## P40.16 Performance implications

Large-ish representative structure edit/bake time measured.

## P40.17 Security / trust implications

No unregistered/private content.

## P40.18 Recommended child decomposition

- P40-A — 3D workspace/content browser;
- P40-B — markers/zones/sockets tooling;
- P40-C — stages/state authoring;
- P40-D — cost/validation;
- P40-E — bake/Test Lab;
- P40-F — golden fixtures/reconciliation.

## P40.19 Acceptance matrix

| ID | Requirement | Evidence | Gate |
| --- | --- | --- | --- |
| P40-AC01 | Structure can be authored entirely from registered content | EV-C / EV-B | Required |
| P40-AC02 | Marker/zone/socket overlays are editable and validated | EV-C | Required |
| P40-AC03 | Construction stages can be authored/previewed | EV-C | Required |
| P40-AC04 | Material roles resolve to registered content | EV-B | Required |
| P40-AC05 | Cost compiles from actual stage/source composition | EV-B | Required |
| P40-AC06 | Bake is deterministic for same source/settings | EV-B | Required |
| P40-AC07 | Structure launches into real Test Lab/world | EV-C | Required |
| P40-AC08 | Invalid structure cannot claim production-ready state | EV-B negative | Required |
| P40-AC09 | Golden cottage passes ART structure review | EV-F / EV-G | Required |
| P40-AC10 | Final SHA/CI passes | EV-H | Required |

## P40.20 Negative tests

- hidden/private block;
- missing entrance;
- marker without valid zone;
- invalid stage delta;
- unresolved material role;
- stage removes structural dependency unexpectedly.

## P40.21 Manual acceptance scenario

Create/edit cottage.

Assign material roles.

Place entrance/bed/storage markers.

Create stages.

Compile cost.

Validate.

Launch in Test Lab.

Walk through/use semantic overlays.

## P40.22 Rule-of-cool target

The first proper:

> **build a house in The Forge → walk inside it in Leyforge**

moment.

## P40.23 Exit gate

Structure Forge source→bake→runtime loop exists.

## P40.24 Downstream unlock

P41–P43.

## P40.25 Known risks / ADR triggers

- source editing data structure;
- large source incremental invalidation/bake strategy.

---

# P41 — MORE THAN WALLS

**Classification:** FORGE-FIRST / FOUNDATION  
**Arc:** ARC VII  
**Player/creator payoff:** Buildings are recognised for what they can actually do, not what they look like.

## P41.1 Purpose

Create functional semantic validation for structures.

## P41.2 Authoritative source packet

- 20A–20H functional/service contracts;
- P36 seven pillars;
- P39/P40;
- PROD-05 Capability/Route/Connection/Permission;
- Document 19 validation principles.

## P41.3 Entry gate

- P40 COMPLETE;
- service capability model available from P36.

## P41.4 Dependencies

### Hard

P36, P40.

## P41.5 Universal primitives used

- Capability;
- Composition;
- Connection;
- Route;
- Permission;
- State;
- Result/Reason.

## P41.6 In scope

Validators for:

- reachable entrance;
- valid sleeping/housing positions;
- internal navigation/access;
- storage;
- job/workstation;
- service markers;
- hazard zones;
- route connection;
- required utilities;
- capacity calculation;
- ownership/access;
- commissioning state;
- construction-stage safe partial function where allowed;
- functional reason codes.

## P41.7 Explicit non-scope

- every final building family validator;
- full town/city service graph;
- government;
- utility networks not yet implemented.

## P41.8 Implementation capability requirements

Example cottage:

```text
shell exists
+ entrance reachable
+ bed slots valid
+ weather/shelter conditions pass
+ permissions valid
→ housing capacity
```

A decorative bed model without semantic marker does not count.

## P41.9 Forge requirements

Validation feedback should point to:

- source element;
- failed rule;
- suggested repair category.

## P41.10 Runtime requirements

Placed structure re-evaluates function when relevant state changes:

- entrance blocked;
- bed destroyed;
- utility lost;
- ownership/access changes.

## P41.11 Canonical content subset

Golden:

- cottage;
- small storage/work structure.

## P41.12 Persistence implications

Functional state reconstructs from persistent authoritative structure state.

## P41.13 Multiplayer / authority implications

Permissions/access later filter valid service.

## P41.14 Simulation-LOD implications

Distant simulation can use baked/updated functional summary.

## P41.15 Accessibility / localisation implications

Failure reasons understandable in text, not colour only.

## P41.16 Performance implications

Incremental invalidation rather than rescanning entire structure every frame.

## P41.17 Security / trust implications

Validator cannot be bypassed by player/community source.

## P41.18 Recommended child decomposition

- P41-A — service validator framework;
- P41-B — housing/access validator;
- P41-C — storage/work validator;
- P41-D — runtime invalidation/re-evaluation;
- P41-E — diagnostics;
- P41-F — reconciliation.

## P41.19 Acceptance matrix

| ID | Requirement | Evidence | Gate |
| --- | --- | --- | --- |
| P41-AC01 | Cottage functional Housing only when semantic conditions pass | EV-B / EV-C | Required |
| P41-AC02 | Destroy/block required element invalidates affected service | EV-B / EV-C | Required |
| P41-AC03 | Unrelated damage does not disable unrelated function unnecessarily | EV-B | Required |
| P41-AC04 | Validator reports precise reason/source location | EV-C | Required |
| P41-AC05 | Incremental revalidation remains bounded | EV-E | Required |
| P41-AC06 | Distant functional summary matches authoritative source state | EV-B | Required |
| P41-AC07 | Decorative-only structure cannot fake service | EV-B negative | Required |
| P41-AC08 | Final SHA/CI passes | EV-H | Required |

## P41.20 Negative tests

- blocked entrance;
- invalid bed zone;
- destroyed storage marker;
- missing utility socket;
- private access restriction;
- partial stage that should not be commissioned.

## P41.21 Manual acceptance scenario

Test valid cottage.

Block door.

Destroy bed.

Repair.

Observe Housing capacity and reasons update correctly.

## P41.22 Rule-of-cool target

The gratifying realisation that a player-designed building can be **understood by the game**.

## P41.23 Exit gate

Structures carry valid gameplay semantics.

## P41.24 Downstream unlock

P42–P48.

## P41.25 Known risks / ADR triggers

- validator dependency graph;
- incremental structure change detection.

---

# P42 — RAISED ONE STONE AT A TIME

**Classification:** FOUNDATION  
**Arc:** ARC VII  
**Player/creator payoff:** Buildings are constructed through visible stages using real materials instead of appearing instantly.

## P42.1 Purpose

Create authoritative construction-project runtime.

## P42.2 Authoritative source packet

- Document 19 construction/project lifecycle;
- 20A–20H stage/resource rules;
- P16 recipe/process transactions;
- P39–P41;
- PROD-05 Transaction/Reservation/Composition.

## P42.3 Entry gate

- P40/P41 COMPLETE;
- exact structure cost/stages compile.

## P42.4 Dependencies

### Hard

P39–P41, P16.

## P42.5 Universal primitives used

- Identity;
- State;
- Transaction;
- Reservation;
- Ownership;
- Permission;
- Composition;
- Result/Reason;
- History.

## P42.6 In scope

Construction project:

- project ID;
- structure/source revision;
- site/parcel;
- ownership;
- permission;
- stage graph;
- resource requirements;
- reservations;
- delivered stock;
- builder-work units;
- stage prerequisites;
- world voxel delta application;
- partial-state validation;
- commissioning;
- cancellation/recovery;
- damage/repair hooks;
- save/load.

## P42.7 Explicit non-scope

- full Builder profession;
- autonomous project selection;
- construction vehicles;
- megaprojects;
- district construction.

## P42.8 Implementation capability requirements

Project progression requires:

```text
valid site
+ required resource delivered/reserved
+ authorised labour/work
→ stage commit
→ world edits
→ structure/project state update
```

No stage progresses purely because timer elapsed unless work definition explicitly permits passive curing/etc.

## P42.9 Forge requirements

Structure Forge provides stage deltas and cost.

## P42.10 Runtime requirements

Construction world edits use P04 authoritative mutation pipeline.

## P42.11 Canonical content subset

One cottage or hut with 4–6 meaningful stages.

## P42.12 Persistence implications

Project state, delivered resources and completed stages survive save/reload.

## P42.13 Multiplayer / authority implications

Project contributions authoritative/contribution-ready.

## P42.14 Simulation-LOD implications

Near project visible.

Far summary later but exact stock/stage retained.

## P42.15 Accessibility / localisation implications

Project UI explains missing resources/labour/permission.

## P42.16 Performance implications

Batch stage edits.

Avoid one block update/remesh pathologically when batch safe.

## P42.17 Security / trust implications

Project cannot consume resources twice on retry.

## P42.18 Recommended child decomposition

- P42-A — project record/stage state;
- P42-B — resource reservations/delivery;
- P42-C — labour/work commit;
- P42-D — world edit/stage application;
- P42-E — save/cancel/recovery;
- P42-F — reconciliation.

## P42.19 Acceptance matrix

| ID | Requirement | Evidence | Gate |
| --- | --- | --- | --- |
| P42-AC01 | Project compiles exact stage resources from source | EV-B | Required |
| P42-AC02 | Delivered/reserved resources remain conserved | EV-B negative | Required |
| P42-AC03 | Stage cannot complete without required resource/work | EV-B | Required |
| P42-AC04 | Stage world edits use authoritative voxel path | EV-B / EV-C | Required |
| P42-AC05 | Save/reload preserves partial project | EV-D | Required |
| P42-AC06 | Cancellation returns/releases stock according to policy without duplication | EV-B / EV-D | Required |
| P42-AC07 | Completed structure commissions only when semantic validation passes | EV-B / EV-C | Required |
| P42-AC08 | Stage edit burst stays bounded | EV-E | Required |
| P42-AC09 | Final SHA/CI passes | EV-H | Required |

## P42.20 Negative tests

- insufficient materials;
- material removed/reservation invalidated;
- stage retry;
- save mid-stage;
- site becomes invalid;
- cancel;
- final stage invalid semantic structure.

## P42.21 Manual acceptance scenario

Place cottage project.

Deliver some materials.

Observe partial stage.

Deliver rest.

Apply labour.

Watch building visibly progress.

Save/reload mid-project.

Finish and commission.

## P42.22 Rule-of-cool target

Watching the first house **actually rise out of supplied materials**.

## P42.23 Exit gate

Authoritative staged construction works.

## P42.24 Downstream unlock

P43.

## P42.25 Known risks / ADR triggers

- construction edit batching;
- source-revision/project migration;
- project cancellation/recovery policy.

---

# P43 — HANDS AT WORK

**Classification:** INTEGRATION / COOL-PULL  
**Arc:** ARC VII  
**Player/creator payoff:** An NPC physically gathers project supplies and builds a real structure stage by stage.

## P43.1 Purpose

Integrate NPC planner with construction projects and prove Builder work.

## P43.2 Authoritative source packet

- current NPC Village builder direction;
- Document 19 NPC builders;
- 20B construction markers;
- P35 planner;
- P42 projects;
- future P49/P50 profession architecture.

## P43.3 Entry gate

- P42 COMPLETE;
- P35 planner stable.

## P43.4 Dependencies

### Hard

P35, P42.

## P43.5 Universal primitives used

- Identity;
- Capability;
- Reservation;
- Transaction;
- Route/navigation;
- State;
- Result/Reason.

## P43.6 In scope

Builder task runtime:

- identify available project work;
- eligibility/capability;
- claim task;
- retrieve/receive project resources;
- travel to work marker;
- perform construction work;
- complete work unit/stage;
- release/replan;
- tool hook;
- unsafe/unreachable blocker;
- visible work presentation.

## P43.7 Explicit non-scope

- full profession progression;
- complete trade skills;
- multi-builder optimisation;
- scaffolding engineering;
- repair specialisation;
- automated construction machines.

## P43.8 Implementation capability requirements

P43 must be designed as an early consumer of the later P50 profession.

It may initially use:

```text
capability.profession.builder
```

or equivalent controlled fixture.

P50 later becomes canonical authoring/definition owner.

Do not create a permanent `BuilderNPC` class.

## P43.9 Forge requirements

Structure source supplies construction markers/stages.

Character/Equipment/Animation provide work presentation.

## P43.10 Runtime requirements

Builder action commits work through Project service.

Animation does not advance project directly.

## P43.11 Canonical content subset

One named P38 settler temporarily eligible as Builder.

## P43.12 Persistence implications

Builder/task/project continuity survives load.

## P43.13 Multiplayer / authority implications

Project work authoritative.

## P43.14 Simulation-LOD implications

Nearby builder visible.

Far builder summary later.

## P43.15 Accessibility / localisation implications

Project blockers visible in diagnostics/player-facing summaries later.

## P43.16 Performance implications

No per-block pathfinding between every placement action unless needed.

## P43.17 Security / trust implications

Builder cannot bypass project permissions.

## P43.18 Recommended child decomposition

- P43-A — project-work task source;
- P43-B — resource/work-marker reservations;
- P43-C — construction execution;
- P43-D — presentation;
- P43-E — persistence/failure;
- P43-F — reconciliation.

## P43.19 Acceptance matrix

| ID | Requirement | Evidence | Gate |
| --- | --- | --- | --- |
| P43-AC01 | NPC can discover/claim valid construction task | EV-B / EV-C | Required |
| P43-AC02 | NPC uses real project resources and reservations | EV-B | Required |
| P43-AC03 | NPC travels to valid construction marker | EV-C | Required |
| P43-AC04 | Work commits through Project service, not animation | EV-B | Required |
| P43-AC05 | Blocked route/material shortage creates explainable task failure | EV-B / EV-C | Required |
| P43-AC06 | Save/reload mid-project preserves NPC/project consistency | EV-D | Required |
| P43-AC07 | No permanent special BuilderNPC architecture exists | EV-A / review | Required |
| P43-AC08 | Final SHA/CI passes | EV-H | Required |

## P43.20 Negative tests

- project cancelled;
- material disappears before pickup;
- work marker unreachable;
- builder loses eligibility;
- save mid-task;
- two builders claim exclusive work marker.

## P43.21 Manual acceptance scenario

Assign/enable Builder capability.

Start cottage project.

Supply resources.

Watch NPC collect/go to project/work.

Block route and observe recovery.

Restore.

Finish building.

## P43.22 Rule-of-cool target

The first time you can genuinely:

> **stand back and watch someone else build the world.**

## P43.23 Exit gate

NPC construction works through normal planner/project systems.

## P43.24 Downstream unlock

P44–P48 and later P50 profession formalisation.

## P43.25 Known risks / ADR triggers

- labour-unit accounting;
- multi-worker stage concurrency.

---

# P44 — ROOTS TAKE HOLD

**Classification:** FOUNDATION  
**Arc:** ARC VII  
**Player/creator payoff:** People can belong to households and actually live in completed homes.

## P44.1 Purpose

Create household/residency foundation.

## P44.2 Authoritative source packet

- 20A housing/household rules;
- P32 identity;
- P36 needs;
- P41 Housing validation;
- P42 completed structures.

## P44.3 Entry gate

- P41/P42;
- P32/P36.

## P44.4 Dependencies

### Hard

P32, P36, P41–P42.

## P44.5 Universal primitives used

- Identity;
- Membership;
- Ownership;
- Permission;
- Reservation;
- State;
- Relationship hook.

## P44.6 In scope

- household identity;
- resident membership;
- residence assignment;
- bed/sleep-capacity reservation;
- household-owned/shared storage hook;
- household access;
- home preference hook;
- homelessness/temporary shelter state;
- move-in/move-out;
- residency persistence;
- Housing pillar integration.

## P44.7 Explicit non-scope

- marriage/romance;
- children;
- inheritance law;
- property market;
- rent/mortgage;
- advanced family generation.

## P44.8 Implementation capability requirements

A completed structure does not become home until:

- valid Housing capability;
- access;
- assignment;
- capacity;
- permissions.

## P44.9 Forge requirements

Structure semantics supply household/sleep markers.

## P44.10 Runtime requirements

Household record exists independent of house geometry.

## P44.11 Canonical content subset

Three P38 settlers in one/two simple households.

## P44.12 Persistence implications

Household/membership/residence persistent.

## P44.13 Multiplayer / authority implications

Player/NPC property access compatible later.

## P44.14 Simulation-LOD implications

Household persists all LODs.

## P44.15 Accessibility / localisation implications

Housing reasons clear.

## P44.16 Performance implications

No issue at small scale; schema must scale.

## P44.17 Security / trust implications

Capacity/access cannot be bypassed by assignment UI.

## P44.18 Recommended child decomposition

- P44-A — household record;
- P44-B — residence assignment;
- P44-C — capacity/access;
- P44-D — needs integration;
- P44-E — persistence;
- P44-F — reconciliation.

## P44.19 Acceptance matrix

| ID | Requirement | Evidence | Gate |
| --- | --- | --- | --- |
| P44-AC01 | Household identity/membership persists | EV-D | Required |
| P44-AC02 | Residence assignment requires valid Housing service/capacity | EV-B | Required |
| P44-AC03 | Over-capacity assignment rejected | EV-B negative | Required |
| P44-AC04 | Destroyed/invalid home causes appropriate residency/Housing change | EV-B / EV-C | Required |
| P44-AC05 | NPC planner uses assigned residence for sleep where valid | EV-C | Required |
| P44-AC06 | Final SHA/CI passes | EV-H | Required |

## P44.20 Negative tests

- bed destroyed;
- entrance blocked;
- home reassigned;
- household split;
- capacity reduced.

## P44.21 Manual acceptance scenario

Complete cottage.

Assign household.

Observe settlers return/sleep there.

Break housing function.

Observe reason/status.

Repair.

## P44.22 Rule-of-cool target

A building becomes:

> **their home.**

## P44.23 Exit gate

Households/residency work.

## P44.24 Downstream unlock

P45/P47/P48.

## P44.25 Known risks / ADR triggers

- household ownership vs residence semantics.

---

# P45 — THE VILLAGE CHOOSES

**Classification:** FOUNDATION  
**Arc:** ARC VII  
**Player/creator payoff:** The emerging settlement can identify what it needs next and propose/build toward it without a hard-coded layout.

## P45.1 Purpose

Create settlement planning v1.

## P45.2 Authoritative source packet

- Document 19 settlement growth/planning;
- 20A–20H planner triggers;
- P36 needs;
- P39–P44;
- PROD-05 Capability/Route/Reservation/History.

## P45.3 Entry gate

- semantic structures;
- construction;
- households;
- needs.

## P45.4 Dependencies

### Hard

P36, P41–P44.

## P45.5 Universal primitives used

- Identity;
- State;
- Capability;
- Reservation;
- Route;
- Knowledge;
- History;
- Result/Reason.

## P45.6 In scope

Settlement record/planner:

- settlement identity;
- member population;
- current stage;
- seven-pillar summary;
- active projects;
- available project pool;
- required/optional/conditional project classes;
- spare capacity;
- resource opportunity;
- blocker reasons;
- site suitability hook;
- priority/scoring;
- anti-spam/duplicate rules;
- project proposal;
- project queue;
- player influence/priorities hook;
- decision trace.

## P45.7 Explicit non-scope

- town/city governance;
- districts;
- economy/trade;
- full culture variation;
- megaprojects;
- diplomacy.

## P45.8 Implementation capability requirements

Planner chooses from validated authored definitions.

It does not invent a new house type procedurally at runtime.

## P45.9 Forge requirements

Structure definitions expose planner-relevant capability/profile.

## P45.10 Runtime requirements

Planner creates/requests P42 project.

## P45.11 Canonical content subset

Small Camp/Hamlet project pool:

- housing;
- food/community;
- work/storage;
- path/road;
- perhaps basic safety.

## P45.12 Persistence implications

Settlement plan/project queue persists.

## P45.13 Multiplayer / authority implications

Player influence/ownership future-ready.

## P45.14 Simulation-LOD implications

Planner may run at bounded intervals.

## P45.15 Accessibility / localisation implications

Player can inspect why a project is proposed/blocked.

## P45.16 Performance implications

Planner cadence/option pool bounded.

## P45.17 Security / trust implications

Planner cannot bypass project permissions/resources.

## P45.18 Recommended child decomposition

- P45-A — settlement record/stage;
- P45-B — need/project pool;
- P45-C — scoring/anti-spam;
- P45-D — site/project proposal;
- P45-E — diagnostics/persistence;
- P45-F — reconciliation.

## P45.19 Acceptance matrix

| ID | Requirement | Evidence | Gate |
| --- | --- | --- | --- |
| P45-AC01 | Settlement identifies current seven-pillar shortages | EV-B / EV-C | Required |
| P45-AC02 | Planner chooses from authored valid project definitions | EV-B | Required |
| P45-AC03 | Spare capacity reduces duplicate project priority | EV-B | Required |
| P45-AC04 | Resource/site/access blockers appear in reason trace | EV-B / EV-C | Required |
| P45-AC05 | Planner creates normal P42 project rather than instant building | EV-B | Required |
| P45-AC06 | Planner remains bounded at target small settlement count | EV-E | Required |
| P45-AC07 | Project queue survives reload | EV-D | Required |
| P45-AC08 | Final SHA/CI passes | EV-H | Required |

## P45.20 Negative tests

- no valid site;
- insufficient population;
- duplicate active project;
- source unavailable;
- road/access requirement missing;
- player disables category if policy supported.

## P45.21 Manual acceptance scenario

Give settlement housing shortage.

Observe project selection.

Add spare housing manually.

Re-run planner.

Confirm duplicate priority drops and different need may emerge.

## P45.22 Rule-of-cool target

The settlement starts feeling like it has **intent**, not a script.

## P45.23 Exit gate

Settlement can choose bounded growth.

## P45.24 Downstream unlock

P46–P48.

## P45.25 Known risks / ADR triggers

- planner scoring representation;
- site solver ownership.

---

# P46 — THE ROAD BETWEEN DOORS

**Classification:** FOUNDATION / COOL-PULL  
**Arc:** ARC VII  
**Player/creator payoff:** Buildings become connected places rather than isolated boxes; routes and parcels begin shaping the settlement.

## P46.1 Purpose

Create local settlement roads/paths, parcel/site connectivity and route cost.

## P46.2 Authoritative source packet

- 20D roads/routes/parcels;
- Document 19 settlement layout;
- PROD-05 Route;
- P28 navigation;
- P39 sockets;
- P45 planner.

## P46.3 Entry gate

- P39 route sockets;
- P45 settlement planning;
- local navigation works.

## P46.4 Dependencies

### Hard

P28, P39, P45.

## P46.5 Universal primitives used

- Route;
- Connection/Socket;
- State;
- Ownership;
- Permission;
- Capability;
- Result/Reason.

## P46.6 In scope

Local road/path system:

- route/path segment identity;
- footpath/road class foundation;
- junctions;
- route sockets;
- passability;
- width/clearance;
- surface/cost;
- slope;
- condition;
- ownership/access hook;
- parcel/site relationship;
- entrance connection;
- road construction project hook;
- navigation cost integration;
- planner route requirement;
- diagnostic route trace.

## P46.7 Explicit non-scope

- regional travel;
- caravans;
- carts/wagons;
- bridges beyond simple local fixture;
- weather damage;
- trade route economy;
- rail.

## P46.8 Implementation capability requirements

Building straight-line distance does not equal accessibility.

A house behind an invalid/blocked entrance has route failure.

## P46.9 Forge requirements

Structure Forge exposes route sockets.

Road pieces may be network/structure Forge source as appropriate.

## P46.10 Runtime requirements

Navigation consumes local route preference/cost where available.

## P46.11 Canonical content subset

- dirt path;
- junction;
- simple local road segment.

## P46.12 Persistence implications

Road/network elements persist.

## P46.13 Multiplayer / authority implications

Route ownership/access future-ready.

## P46.14 Simulation-LOD implications

Local route summary persists.

## P46.15 Accessibility / localisation implications

Route-block reason understandable.

## P46.16 Performance implications

Incremental local route graph updates.

## P46.17 Security / trust implications

No path grants access through locked/private target automatically.

## P46.18 Recommended child decomposition

- P46-A — route segment/socket schema;
- P46-B — local graph/junctions;
- P46-C — navigation cost integration;
- P46-D — parcel/site access;
- P46-E — construction/persistence;
- P46-F — reconciliation.

## P46.19 Acceptance matrix

| ID | Requirement | Evidence | Gate |
| --- | --- | --- | --- |
| P46-AC01 | Entrances connect through explicit route sockets | EV-B / EV-C | Required |
| P46-AC02 | Route cost affects travel/planning | EV-B / EV-C | Required |
| P46-AC03 | Blocked/broken segment invalidates affected access | EV-B | Required |
| P46-AC04 | Planner can require valid route before commissioning project | EV-B | Required |
| P46-AC05 | Navigation remains able to move off-road where allowed; road is cost/preference, not universal rail | EV-C | Required |
| P46-AC06 | Incremental graph update remains bounded | EV-E | Required |
| P46-AC07 | Save/reload preserves road network | EV-D | Required |
| P46-AC08 | Final SHA/CI passes | EV-H | Required |

## P46.20 Negative tests

- disconnected entrance;
- blocked road;
- invalid junction;
- private route;
- parcel loses access.

## P46.21 Manual acceptance scenario

Connect hearth, cottage and work/storage site with paths.

Observe NPC route choice.

Break/block path.

Observe route failure/repath and settlement diagnostic.

## P46.22 Rule-of-cool target

The first time the hamlet looks/behaves like a **place**, not buildings dropped into a field.

## P46.23 Exit gate

Local settlement connectivity exists.

## P46.24 Downstream unlock

P47/P48 and later logistics/routes.

## P46.25 Known risks / ADR triggers

- graph/nav provider integration.

---

# P47 — THE FOURTH CHAIR

**Classification:** COOL-PULL / FOUNDATION  
**Arc:** ARC VII  
**Player/creator payoff:** The settlement can attract a new resident because it genuinely has room, food, work and safety for them.

## P47.1 Purpose

Create migration/population-growth v1.

## P47.2 Authoritative source packet

- NPC Village migration/growth authority;
- 20A settlement service capacity;
- Document 19 stages;
- P32 identity;
- P36 needs;
- P44 households;
- P45 planner.

## P47.3 Entry gate

- P44 household/residency;
- P45 settlement record;
- capacity/service summaries valid.

## P47.4 Dependencies

### Hard

P32, P36, P44, P45.

## P47.5 Universal primitives used

- Identity;
- Membership;
- Knowledge;
- Route hook;
- State;
- Relationship hook;
- Result/Reason.

## P47.6 In scope

Migration v1:

- candidate migrant definition/record;
- settlement attractiveness/eligibility;
- minimum housing/service capacity;
- work/opportunity hook;
- safety hook;
- route/arrival hook;
- acceptance/refusal reason;
- new household/residency assignment;
- settlement membership;
- history;
- bounded population-growth trigger.

## P47.7 Explicit non-scope

- births/generations;
- refugees at scale;
- faction migration;
- immigration law;
- cultural assimilation;
- town population simulation.

## P47.8 Implementation capability requirements

The fourth resident arrives because actual conditions permit it.

Not because settlement XP reached level 2.

## P47.9 Forge requirements

Uses normal humanoid/NPC source.

## P47.10 Runtime requirements

New person receives persistent identity before/at arrival.

## P47.11 Canonical content subset

One additional settler.

## P47.12 Persistence implications

Migration decision/member identity persists.

## P47.13 Multiplayer / authority implications

Settlement membership authoritative.

## P47.14 Simulation-LOD implications

Arrival may be summarised if out of view, but person remains real.

## P47.15 Accessibility / localisation implications

Growth/blocker explanations readable.

## P47.16 Performance implications

No issue at four people; scalable trigger model.

## P47.17 Security / trust implications

No duplicate migrant identity.

## P47.18 Recommended child decomposition

- P47-A — migration eligibility;
- P47-B — candidate/person creation;
- P47-C — arrival/residency;
- P47-D — history/UI;
- P47-E — persistence;
- P47-F — reconciliation.

## P47.19 Acceptance matrix

| ID | Requirement | Evidence | Gate |
| --- | --- | --- | --- |
| P47-AC01 | Migration requires real valid settlement capacity | EV-B | Required |
| P47-AC02 | Missing housing/provisions/etc produces clear blocker | EV-B / EV-C | Required |
| P47-AC03 | New migrant receives persistent unique person ID | EV-D | Required |
| P47-AC04 | Arrival creates normal household/membership relationships | EV-B | Required |
| P47-AC05 | Save/reload preserves migrant/person state | EV-D | Required |
| P47-AC06 | No abstract settlement-level value creates resources/services | EV-A / review | Required |
| P47-AC07 | Final SHA/CI passes | EV-H | Required |

## P47.20 Negative tests

- no bed;
- no provisions;
- settlement unsafe;
- no valid arrival route;
- duplicate candidate trigger.

## P47.21 Manual acceptance scenario

Start with three settlers and insufficient capacity.

Observe migration blocked.

Build/support additional capacity.

Observe fourth settler become eligible and arrive.

## P47.22 Rule-of-cool target

Put an actual **fourth chair by the fire** and have someone new show up to use it. 😁

## P47.23 Exit gate

Population can grow causally.

## P47.24 Downstream unlock

P48.

## P47.25 Known risks / ADR triggers

- candidate generation/provenance.

---

# P48 — FROM CAMPFIRE TO HAMLET

**Classification:** INTEGRATION / COOL-PULL  
**Arc:** ARC VII  
**Player/creator payoff:** The original hearth grows into the first functioning Leyforge hamlet through actual building, needs, roads and population.

## P48.1 Purpose

Certify ARC VII.

## P48.2 Authoritative source packet

- P39–P47;
- P32–P38;
- Document 19 Camp/Hamlet growth;
- 20A–20D.

## P48.3 Entry gate

- P39–P47 COMPLETE.

## P48.4 Dependencies

All ARC VII.

## P48.5 Universal primitives used

Broad integration set.

## P48.6 In scope

End-to-end hamlet fixture:

- original hearth;
- named settlers;
- homes/households;
- at least one work/service structure;
- storage/basic provisioning;
- local paths/roads;
- staged construction;
- NPC Builder;
- settlement planner;
- migration;
- seven-pillar summaries;
- save/reload;
- away/return continuity at current supported level.

## P48.7 Explicit non-scope

- full professions;
- warehouse economy;
- automation;
- trade;
- government;
- raids;
- magic infrastructure.

## P48.8 Implementation capability requirements

No bespoke hamlet controller.

Normal systems compose.

## P48.9 Forge requirements

All structures authored through Structure Forge.

## P48.10 Runtime requirements

Settlement record summarises real structures/people/resources.

## P48.11 Canonical content subset

A small neutral/Overworld hamlet kit only.

## P48.12 Persistence implications

Full fixture persists.

## P48.13 Multiplayer / authority implications

Future-compatible.

## P48.14 Simulation-LOD implications

At minimum active ↔ unloaded/reloaded consistency.

## P48.15 Accessibility / localisation implications

Needs/project reasons understandable.

## P48.16 Performance implications

Profile small hamlet baseline.

## P48.17 Security / trust implications

No hidden resource spawning.

## P48.18 Recommended child decomposition

- P48-A — hamlet fixture/source pack;
- P48-B — planner/construction integration;
- P48-C — household/road/migration integration;
- P48-D — persistence;
- P48-E — human gameplay review;
- P48-F — PG-07 reconciliation.

## P48.19 Acceptance matrix

| ID | Requirement | Evidence | Gate |
| --- | --- | --- | --- |
| P48-AC01 | Hamlet grows from real construction/projects | EV-C | Required |
| P48-AC02 | NPC builder uses real resources | EV-B / EV-C | Required |
| P48-AC03 | Households occupy valid homes | EV-C | Required |
| P48-AC04 | Roads/access affect actual movement/function | EV-C | Required |
| P48-AC05 | Migration responds to real capacity | EV-C | Required |
| P48-AC06 | Seven-pillar summary reflects real underlying causes | EV-B / EV-C | Required |
| P48-AC07 | Full save/reload preserves hamlet state | EV-D | Required |
| P48-AC08 | Small hamlet remains within provisional performance budget | EV-E | Required |
| P48-AC09 | No bespoke demo-only settlement logic exists | EV-A / review | Required |
| P48-AC10 | Human review: growth is understandable and feels consequential | EV-G | Required |
| P48-AC11 | Final SHA/CI passes | EV-H | Required |

## P48.20 Negative tests

- remove housing;
- block main road;
- cancel active project;
- exhaust food;
- builder unavailable;
- save during construction/migration.

## P48.21 Manual acceptance scenario

Begin with P38 hearth.

Observe need.

Planner proposes structure.

Supply/build.

Builder works.

Household moves in.

Path network grows.

Capacity opens.

Fourth settler arrives.

Save/quit/reload.

## P48.22 Rule-of-cool target

The emotional payoff:

> **“I remember when this was just three people and a fire.”**

## P48.23 Exit gate — PG-07 SETTLEMENT FOUNDATION

PG-07 passes when P39–P48 are COMPLETE and the hamlet grows through real systems.

## P48.24 Downstream unlock

ARC VIII work/profession/production/automation.

## P48.25 Known risks / ADR triggers

- settlement summary ownership;
- planner/project feedback loops.

---

# 04. ARC VIII — GEARS BENEATH THE EARTH

ARC VIII gives the settlement an economy.

It begins with people doing real work.

Then storage/logistics allow work to connect.

Then mechanical power/machines reduce labour.

Finally signals let systems coordinate.

The Arc ends with a settlement whose production can continue without the player personally moving every item.

---

# P49 — THE WORK OF MANY HANDS

**Classification:** FOUNDATION  
**Arc:** ARC VIII — GEARS BENEATH THE EARTH  
**Player/creator payoff:** Work becomes a first-class simulation concept instead of bespoke behaviours hidden inside each NPC/workplace.

## P49.1 Purpose

Define Work, Profession & Production Contract.

## P49.2 Authoritative source packet

- 20B Work/Extraction/Crafting/Trade/Education;
- NPC planner P35;
- Recipe Forge P16;
- settlement/service docs;
- PROD-05 Capability/Reservation/Transaction.

## P49.3 Entry gate

- PG-07;
- NPC planner;
- structures/work markers;
- recipes.

## P49.4 Dependencies

P35, P40/P41, P48.

## P49.5 Universal primitives used

- Identity;
- Capability;
- Reservation;
- Transaction;
- Route;
- State;
- Result/Reason;
- Membership/Role.

## P49.6 In scope

Work/Profession base contracts:

### Profession definition

- identity;
- permitted work families;
- required skills;
- tools;
- workplace capability;
- schedule compatibility;
- progression hooks;
- specialisation hooks.

### Work order/task source

- work identity;
- worker requirements;
- source/workplace;
- inputs;
- tool requirements;
- actions;
- outputs;
- destination;
- time/work units;
- conditions;
- failure reasons;
- priority;
- ownership/permission.

### Production contract

- inputs;
- outputs/by-products;
- labour;
- recipe/process;
- buffers;
- stock ownership;
- conservation.

## P49.7 Explicit non-scope

- Work & Profession Forge;
- full skill/progression system;
- every profession;
- automated machines.

## P49.8 Implementation capability requirements

Profession != active job task.

A Builder can haul temporarily if allowed.

A Miner may have no active mining task.

## P49.9 Forge requirements

P50 authors definitions.

## P49.10 Runtime requirements

P35 planner consumes available work tasks based on profession/capability.

## P49.11 Canonical content subset

Starter profession/work test definitions.

## P49.12 Persistence implications

Profession/skill/active work references persist.

## P49.13 Multiplayer / authority implications

Work claims/reservations authoritative.

## P49.14 Simulation-LOD implications

Contract must support near visible work and later distant summaries.

## P49.15 Accessibility / localisation implications

Work failure reasons readable.

## P49.16 Performance implications

Work availability indexing; avoid every NPC scanning every workplace.

## P49.17 Security / trust implications

Worker cannot consume/produce without valid task transaction.

## P49.18 Recommended child decomposition

- P49-A — profession schema;
- P49-B — work-order/task-source schema;
- P49-C — production input/output contract;
- P49-D — planner integration;
- P49-E — diagnostics/persistence;
- P49-F — reconciliation.

## P49.19 Acceptance matrix

| ID | Requirement | Evidence | Gate |
| --- | --- | --- | --- |
| P49-AC01 | Profession and active task are distinct | EV-B | Required |
| P49-AC02 | Work order exposes exact input/output/tool/workplace requirements | EV-B | Required |
| P49-AC03 | Planner can match eligible worker without per-profession bespoke code | EV-B | Required |
| P49-AC04 | Work result uses authoritative transaction | EV-B | Required |
| P49-AC05 | Work failure reason is explicit | EV-B | Required |
| P49-AC06 | Work availability lookup remains bounded | EV-E | Required |
| P49-AC07 | Final SHA/CI passes | EV-H | Required |

## P49.20 Negative tests

- missing tool;
- worker ineligible;
- workplace blocked;
- input unavailable;
- output full;
- task claimed by another worker.

## P49.21 Manual acceptance scenario

Assign two profession profiles.

Expose several work tasks.

Observe planner match workers appropriately.

## P49.22 Rule-of-cool target

The settlement begins to feel organised by **actual trades and work**, not NPC animations.

## P49.23 Exit gate

Shared work/profession contract exists.

## P49.24 Downstream unlock

P50–P55.

## P49.25 Known risks / ADR triggers

- profession/skill schema;
- work-index scheduling architecture.

---

# P50 — CALLINGS OF THE HEARTH

**Classification:** FORGE-FIRST  
**Arc:** ARC VIII  
**Player/creator payoff:** Professions can be authored, specialised and tested through The Forge.

## P50.1 Purpose

Create Work & Profession Forge v1.

## P50.2 Authoritative source packet

- P49;
- 20B profession/work requirements;
- PROD-04 specialist Forge;
- P14 tools;
- P16 recipes;
- P40 structures/work markers.

## P50.3 Entry gate

- P49 COMPLETE.

## P50.4 Dependencies

P49 plus supporting Forge services.

## P50.5 Universal primitives used

- Identity;
- Capability;
- Role;
- Reservation;
- Provenance;
- Result/Reason.

## P50.6 In scope

Profession Forge workflow:

```text
Identity
→ profession family
→ required capabilities/skills
→ allowed work families
→ tools
→ workplaces/resource sites
→ schedule
→ outputs/services
→ skill/progression hooks
→ specialisations
→ animation/audio presentation references
→ validation
→ simulation test
```

Initial canonical professions should include at least:

- Builder;
- Miner;
- Lumberjack/Forester;
- Farmer or food-worker placeholder if full agriculture runtime is not yet ready;
- Hauler;
- Blacksmith;
- Carpenter;
- Cook or provision-worker where content supports.

Builder is explicitly canonical here.

## P50.7 Explicit non-scope

- complete final profession catalogue;
- guilds;
- education/training depth;
- skill-tree Forge;
- government offices.

## P50.8 Implementation capability requirements

Builder becomes canonical profession definition.

P43 construction tasks now bind to P50 Builder eligibility.

## P50.9 Forge requirements

Uses shared Item/Recipe/Structure/Animation/Audio references.

## P50.10 Runtime requirements

Profession definitions feed P49/P35.

## P50.11 Canonical content subset

Starter hamlet production professions.

## P50.12 Persistence implications

NPC profession/specialisation persist.

## P50.13 Multiplayer / authority implications

Profession assignment authoritative.

## P50.14 Simulation-LOD implications

Profession remains at all LOD.

## P50.15 Accessibility / localisation implications

Profession/work blockers/reasons readable.

## P50.16 Performance implications

Validation/source only.

## P50.17 Security / trust implications

Player creator later cannot grant arbitrary privileged capability without allowed profile.

## P50.18 Recommended child decomposition

- P50-A — profession source/journey;
- P50-B — tool/workplace/work-family references;
- P50-C — skill/specialisation hooks;
- P50-D — simulation preview;
- P50-E — starter profession definitions;
- P50-F — reconciliation.

## P50.19 Acceptance matrix

| ID | Requirement | Evidence | Gate |
| --- | --- | --- | --- |
| P50-AC01 | Profession definition can be authored/validated in Forge | EV-B / EV-C | Required |
| P50-AC02 | Builder is canonical profession and P43 can consume it | EV-B / EV-C | Required |
| P50-AC03 | Different professions match different work without bespoke planner branches | EV-B | Required |
| P50-AC04 | Tool/workplace requirements resolve stable IDs/capabilities | EV-B | Required |
| P50-AC05 | Invalid circular/incompatible specialisation blocked | EV-B negative | Required |
| P50-AC06 | Starter professions survive save/load assignments | EV-D | Required |
| P50-AC07 | Final SHA/CI passes | EV-H | Required |

## P50.20 Negative tests

- profession references missing tool;
- impossible workplace;
- invalid work family;
- duplicate specialisation;
- builder project unavailable.

## P50.21 Manual acceptance scenario

Open Builder/Hauler/Miner definitions.

Adjust controlled requirement.

Run simulation test.

Observe worker eligibility change for real tasks.

## P50.22 Rule-of-cool target

The Forge can now define **what someone does for a living**.

## P50.23 Exit gate

Profession authoring works.

## P50.24 Downstream unlock

P51–P55 and later settlement services.

## P50.25 Known risks / ADR triggers

- progression/skill ownership if dedicated Progression Forge must be introduced.

---

# P51 — FROM FOREST AND VEIN

**Classification:** COOL-PULL / FOUNDATION  
**Arc:** ARC VIII  
**Player/creator payoff:** NPCs go to actual forests, quarries/mines or resource sites and bring back real material.

## P51.1 Purpose

Create Gathering & Extraction Runtime.

## P51.2 Authoritative source packet

- 20B resource work/extraction;
- resource progression;
- P49/P50;
- P04 world edits;
- P12 drops;
- P29 ecology hooks.

## P51.3 Entry gate

- P49/P50;
- resource-site semantics available.

## P51.4 Dependencies

P49–P50, P04/P12.

## P51.5 Universal primitives used

- Identity;
- Capability;
- Transaction;
- Reservation;
- Route;
- State;
- Result/Reason.

## P51.6 In scope

- forestry/lumber extraction;
- mining/quarry extraction;
- surface gathering;
- farming-harvest hook where existing crops support it;
- hunting/fishing hooks only if required by starter content;
- resource site/zone;
- work marker;
- tools;
- safe access;
- depletion/regeneration where authoritative;
- carried output;
- interruption;
- permissions;
- work-site blocker.

## P51.7 Explicit non-scope

- full farming lifecycle;
- animal husbandry;
- deep mine systems;
- industrial automated mining;
- regional resource ecology;
- Builder profession semantics.

Builder belongs P50; P51 is extraction/gathering.

## P51.8 Implementation capability requirements

Workers do not spawn “wood” from job timer.

They interact with real source/site records and commit actual extraction/transformation.

## P51.9 Forge requirements

Profession/resource/site definitions.

## P51.10 Runtime requirements

Work output becomes carried/world/inventory stock through transactions.

## P51.11 Canonical content subset

- wood;
- stone;
- ore.

## P51.12 Persistence implications

Resource-site state and extracted stock persist.

## P51.13 Multiplayer / authority implications

Extraction commands authoritative.

## P51.14 Simulation-LOD implications

Near exact visible.

Far summary later must preserve quantity/site state.

## P51.15 Accessibility / localisation implications

Resource depleted/tool missing/unsafe reasons clear.

## P51.16 Performance implications

Batch/tree/ore work should not force pathological voxel remesh.

## P51.17 Security / trust implications

Retry cannot duplicate output.

## P51.18 Recommended child decomposition

- P51-A — resource-site/work source;
- P51-B — forestry;
- P51-C — mining/quarry;
- P51-D — carried output/transactions;
- P51-E — persistence/performance;
- P51-F — reconciliation.

## P51.19 Acceptance matrix

| ID | Requirement | Evidence | Gate |
| --- | --- | --- | --- |
| P51-AC01 | NPC extracts from real world/resource state | EV-B / EV-C | Required |
| P51-AC02 | Tool/profession requirement validated | EV-B | Required |
| P51-AC03 | Output quantity conserved | EV-B negative | Required |
| P51-AC04 | Resource depletion/state persists | EV-D | Required |
| P51-AC05 | Unsafe/unreachable/depleted site blocks work with reason | EV-B / EV-C | Required |
| P51-AC06 | Nearby visible extraction and world edit reconcile | EV-C | Required |
| P51-AC07 | Final SHA/CI passes | EV-H | Required |

## P51.20 Negative tests

- depleted source;
- missing tool;
- worker interrupted;
- save mid-work;
- voxel source already removed;
- two workers target same exclusive source.

## P51.21 Manual acceptance scenario

Assign lumberjack/miner.

Observe them travel, work, produce real output, carry/drop/deliver.

Inspect source reduction.

## P51.22 Rule-of-cool target

The settlement can literally **go get its own wood and stone**.

## P51.23 Exit gate

Real extraction works.

## P51.24 Downstream unlock

P52–P55.

## P51.25 Known risks / ADR triggers

- resource-site abstraction vs raw voxel scanning;
- sustainable forestry/regeneration ownership.

---

# P52 — HANDS THAT MAKE

**Classification:** FOUNDATION  
**Arc:** ARC VIII  
**Player/creator payoff:** NPC artisans use the same real recipes as the player to turn settlement stock into useful goods.

## P52.1 Purpose

Create NPC Crafting & Processing.

## P52.2 Authoritative source packet

- P16 recipes;
- P17 workstation;
- P49/P50;
- 20B workshops.

## P52.3 Entry gate

- P49/P50;
- RecipeService stable.

## P52.4 Dependencies

P16/P17, P49/P50.

## P52.5 Universal primitives used

- Identity;
- Transaction;
- Reservation;
- Capability;
- State;
- Result/Reason.

## P52.6 In scope

- workstation work orders;
- recipe permissions/knowledge;
- worker eligibility/skill hook;
- input reservation;
- workplace input buffer;
- tool use;
- timed work;
- output buffer;
- blocking;
- work order priority;
- NPC retrieval/delivery integration hook.

## P52.7 Explicit non-scope

- automated machine processing;
- full artisan quality;
- education/apprenticeship;
- market demand.

## P52.8 Implementation capability requirements

Use canonical P16 recipes where semantics match.

Do not create “NPC-only recipes.”

## P52.9 Forge requirements

Work/Profession Forge references recipes/workplaces.

## P52.10 Runtime requirements

Outputs commit transactionally.

## P52.11 Canonical content subset

- carpenter/log→plank component;
- blacksmith/simple metal component;
- cook/basic food if available.

## P52.12 Persistence implications

Active orders/buffers persist.

## P52.13 Multiplayer / authority implications

Authoritative.

## P52.14 Simulation-LOD implications

Near visible; summary later.

## P52.15 Accessibility / localisation implications

Blockers clear.

## P52.16 Performance implications

Workstations event-driven.

## P52.17 Security / trust implications

No output duplication.

## P52.18 Recommended child decomposition

- P52-A — work order;
- P52-B — recipe/input reservation;
- P52-C — worker/workstation execution;
- P52-D — output/blocking;
- P52-E — persistence;
- P52-F — reconciliation.

## P52.19 Acceptance matrix

| ID | Requirement | Evidence | Gate |
| --- | --- | --- | --- |
| P52-AC01 | NPC uses canonical recipe definition | EV-B | Required |
| P52-AC02 | Inputs reserved/consumed exactly | EV-B | Required |
| P52-AC03 | Output created exactly once | EV-B negative | Required |
| P52-AC04 | Output-full blocks safely | EV-B / EV-C | Required |
| P52-AC05 | Save/reload preserves work order | EV-D | Required |
| P52-AC06 | Worker eligibility/knowledge enforced | EV-B | Required |
| P52-AC07 | Final SHA/CI passes | EV-H | Required |

## P52.20 Negative tests

- wrong worker;
- missing recipe;
- missing input;
- full output;
- interrupted work;
- retry.

## P52.21 Manual acceptance scenario

Stock workshop.

Assign artisan.

Observe real inputs consumed and output appear.

Block output and inspect recovery.

## P52.22 Rule-of-cool target

The blacksmith/carpenter is now **actually making things**.

## P52.23 Exit gate

NPC production works.

## P52.24 Downstream unlock

P53–P55.

## P52.25 Known risks / ADR triggers

- workplace-buffer abstraction.

---

# P53 — THE COMMON STORE

**Classification:** FOUNDATION / COOL-PULL  
**Arc:** ARC VIII  
**Player/creator payoff:** The settlement gains a real shared stockpile/warehouse that projects, workplaces and future trade can depend on.

## P53.1 Purpose

Create Settlement Inventory & Warehousing.

## P53.2 Authoritative source packet

- 20D storage/reservations;
- 20A reserves;
- 20B inputs/outputs;
- P13 Inventory;
- P42 projects.

## P53.3 Entry gate

- P13;
- settlement record;
- structure storage semantics.

## P53.4 Dependencies

P13, P41, P48.

## P53.5 Universal primitives used

- Identity;
- Ownership;
- Permission;
- Transaction;
- Reservation;
- State;
- Result/Reason.

## P53.6 In scope

Settlement storage:

- warehouse/store identity;
- typed/category capacity;
- actual stock;
- ownership;
- access;
- available quantity;
- reserved project stock;
- emergency reserve;
- workplace stock;
- trade-stock hook;
- import/export endpoints;
- stock history;
- shortage summary;
- UI/view model;
- project reserve integration.

## P53.7 Explicit non-scope

- regional trade;
- caravans;
- spoilage depth;
- container micro-simulation for every shelf;
- logistics automation.

## P53.8 Implementation capability requirements

Capacity does not create stock.

Visible crates do not create stock.

Stock remains authoritative inventory/transaction data.

## P53.9 Forge requirements

Warehouse structure supplies storage/loading markers/capacity profile.

## P53.10 Runtime requirements

Settlement summary queries warehouse service.

## P53.11 Canonical content subset

- small storehouse;
- village warehouse or reduced fixture.

## P53.12 Persistence implications

Critical exact stock/reservations persist.

## P53.13 Multiplayer / authority implications

Permissions/transactions authority-safe.

## P53.14 Simulation-LOD implications

Distant warehouse uses exact/bounded stock summary.

## P53.15 Accessibility / localisation implications

UI clearly distinguishes available vs reserved.

## P53.16 Performance implications

Large stock indexes bounded/event-driven.

## P53.17 Security / trust implications

Reservation race/duplicate withdrawal tests.

## P53.18 Recommended child decomposition

- P53-A — settlement stock/storage record;
- P53-B — categories/capacity/access;
- P53-C — reservation classes;
- P53-D — project/workplace integration;
- P53-E — UI/history/persistence;
- P53-F — reconciliation.

## P53.19 Acceptance matrix

| ID | Requirement | Evidence | Gate |
| --- | --- | --- | --- |
| P53-AC01 | Warehouse quantity equals real inventory stock | EV-B | Required |
| P53-AC02 | Reservations reduce available quantity without duplicating physical stock | EV-B | Required |
| P53-AC03 | Project reserve survives reload | EV-D | Required |
| P53-AC04 | Permission denied withdrawal leaves stock unchanged | EV-B negative | Required |
| P53-AC05 | Capacity/decoration cannot create goods | EV-B negative/review | Required |
| P53-AC06 | Shortage/stock summaries reconcile with underlying inventory | EV-B | Required |
| P53-AC07 | Final SHA/CI passes | EV-H | Required |

## P53.20 Negative tests

- simultaneous reservation;
- full storage;
- category mismatch;
- private goods;
- reserve withdrawal denied;
- save during transfer.

## P53.21 Manual acceptance scenario

Deliver wood/stone/iron to warehouse.

Reserve materials for project.

Inspect available vs reserved.

Craft/workplace consumes other stock.

Finish/cancel project and reconcile.

## P53.22 Rule-of-cool target

The first time the player can look at a warehouse and think:

> **“That's what the town actually owns.”**

## P53.23 Exit gate

Settlement stock is authoritative.

## P53.24 Downstream unlock

P54/P55/P60/P62.

## P53.25 Known risks / ADR triggers

- storage category/capacity schema;
- high-volume inventory representation.

---

# P54 — BURDEN AND ROAD

**Classification:** FOUNDATION  
**Arc:** ARC VIII  
**Player/creator payoff:** NPC haulers move resources between extraction sites, workshops, warehouses and projects instead of materials teleporting.

## P54.1 Purpose

Create Internal Hauling & Logistics.

## P54.2 Authoritative source packet

- 20D delivery throughput/routes;
- 20B workplace buffers;
- P46 roads;
- P49/P50 Hauler profession;
- P53 warehouse.

## P54.3 Entry gate

- P46;
- P50 Hauler;
- P53 warehouse.

## P54.4 Dependencies

P46, P49–P53.

## P54.5 Universal primitives used

- Transaction;
- Reservation;
- Route;
- Capability;
- State;
- Result/Reason.

## P54.6 In scope

- haul task;
- pickup/dropoff endpoints;
- quantity;
- reservation;
- carried inventory;
- capacity;
- route choice;
- priority;
- workplace input/output requests;
- warehouse transfers;
- project deliveries;
- blocked destination;
- task batching;
- simple carrying/cart hook for later.

## P54.7 Explicit non-scope

- regional freight;
- caravans;
- automated chutes/belts;
- complex vehicles;
- shipping.

## P54.8 Implementation capability requirements

Hauling moves real items via transactions.

Visual carried props are presentation.

## P54.9 Forge requirements

Profession/structure markers.

## P54.10 Runtime requirements

Hauler uses local routes/navigation.

## P54.11 Canonical content subset

Warehouse ↔ workshop ↔ project/extraction.

## P54.12 Persistence implications

In-transit cargo/task survives or safely reconciles.

## P54.13 Multiplayer / authority implications

Authoritative cargo ownership.

## P54.14 Simulation-LOD implications

Near physical; far summaries later.

## P54.15 Accessibility / localisation implications

Blocked route/output reasons readable.

## P54.16 Performance implications

Task batching avoids one task per individual low-value item where appropriate.

## P54.17 Security / trust implications

Cargo cannot exist simultaneously at source and carrier.

## P54.18 Recommended child decomposition

- P54-A — haul request/task;
- P54-B — pickup/dropoff transaction;
- P54-C — route/capacity;
- P54-D — workplace/project integration;
- P54-E — persistence/performance;
- P54-F — reconciliation.

## P54.19 Acceptance matrix

| ID | Requirement | Evidence | Gate |
| --- | --- | --- | --- |
| P54-AC01 | Hauler transfers exact quantity source→carrier→destination | EV-B | Required |
| P54-AC02 | Source quantity decreases before/with authoritative carrier possession | EV-B | Required |
| P54-AC03 | Route blockage causes safe delay/replan | EV-B / EV-C | Required |
| P54-AC04 | Destination full does not delete cargo | EV-B negative | Required |
| P54-AC05 | Save/reload in transit reconciles cargo once | EV-D | Required |
| P54-AC06 | Batch logistics remains within provisional task budget | EV-E | Required |
| P54-AC07 | Final SHA/CI passes | EV-H | Required |

## P54.20 Negative tests

- destination fills;
- carrier unloads;
- route blocked;
- source reservation invalid;
- save in transit;
- duplicate haul retry.

## P54.21 Manual acceptance scenario

Mine produces ore/logs.

Hauler picks up.

Travels road.

Deposits at warehouse/workshop.

Block route and observe.

## P54.22 Rule-of-cool target

Watching goods **physically move through the settlement**.

## P54.23 Exit gate

Internal logistics works.

## P54.24 Downstream unlock

P55/P62.

## P54.25 Known risks / ADR triggers

- cargo ownership during transit;
- task batching.

---

# P55 — WHILE YOU WERE AWAY

**Classification:** INTEGRATION / COOL-PULL  
**Arc:** ARC VIII  
**Player/creator payoff:** Leave the hamlet, come back later, and its people have actually worked using real resources while you were gone.

## P55.1 Purpose

Create Autonomous Settlement Production v1 and first bounded simulation-LOD continuity.

## P55.2 Authoritative source packet

- NPC Village near/far simulation;
- 20A–20D bounded distant summaries;
- PROD-03 Simulation LOD;
- P49–P54.

## P55.3 Entry gate

- P49–P54;
- settlement fixture stable.

## P55.4 Dependencies

P49–P54.

## P55.5 Universal primitives used

- Identity;
- State;
- Transaction;
- Route;
- Reservation;
- History;
- Result/Reason.

## P55.6 In scope

- active settlement production;
- transition to bounded away/unloaded representation;
- scheduled/aggregate work update;
- extraction/crafting/hauling/project progress within supported scope;
- exact resource accounting;
- blockers;
- elapsed world-time handling;
- return/reconciliation;
- production summary/history;
- anti-exploit bounds.

## P55.7 Explicit non-scope

- full regional economy;
- long-year civilisation simulation;
- war;
- caravans;
- fully simulated distant pathfinding;
- magical automation.

## P55.8 Implementation capability requirements

Distant simulation must not:

- invent input;
- ignore storage capacity;
- skip required worker/tool/workplace;
- complete impossible project.

It may summarise path/action detail while preserving outcomes.

## P55.9 Forge requirements

No new Forge.

## P55.10 Runtime requirements

LOD transition:

```text
ACTIVE detailed
→ bounded summary
→ ACTIVE rehydrated
```

must preserve authoritative equivalence for supported work.

## P55.11 Canonical content subset

Hamlet with:

- extractor;
- hauler;
- artisan;
- warehouse;
- active project.

## P55.12 Persistence implications

Critical.

## P55.13 Multiplayer / authority implications

Authority-owned simulation clock/state.

## P55.14 Simulation-LOD implications

This slice is the first meaningful civilisation LOD proof.

## P55.15 Accessibility / localisation implications

Return summary explains what changed and why.

## P55.16 Performance implications

Compare active vs away cost.

## P55.17 Security / trust implications

Time-skipping/reload must not duplicate production.

## P55.18 Recommended child decomposition

- P55-A — settlement summary state;
- P55-B — LOD transition;
- P55-C — bounded production scheduler;
- P55-D — resource reconciliation;
- P55-E — return/history/performance;
- P55-F — reconciliation.

## P55.19 Acceptance matrix

| ID | Requirement | Evidence | Gate |
| --- | --- | --- | --- |
| P55-AC01 | Settlement can demote from active without losing identity/stock/tasks | EV-D | Required |
| P55-AC02 | Away production consumes/produces conserved resources | EV-B / EV-D | Required |
| P55-AC03 | Impossible work remains blocked while away | EV-B negative | Required |
| P55-AC04 | Return rehydrates coherent worker/project/storage state | EV-C / EV-D | Required |
| P55-AC05 | Reload/time advance cannot duplicate production | EV-B negative | Required |
| P55-AC06 | Away simulation cost substantially bounded vs active fixture | EV-E | Required |
| P55-AC07 | Change summary/history explains major outcomes | EV-C | Required |
| P55-AC08 | Final SHA/CI passes | EV-H | Required |

## P55.20 Negative tests

- no input;
- output full;
- worker absent;
- tool breaks;
- route unavailable;
- repeated load/time advancement.

## P55.21 Manual acceptance scenario

Observe hamlet active.

Leave/unload for defined world time.

Return.

Inspect stock, tasks, project progress.

Compare expected conservation.

## P55.22 Rule-of-cool target

The first:

> **“Wait, they did all that while I was gone?”**

moment.

## P55.23 Exit gate

Settlement production can continue away from player without cheating.

## P55.24 Downstream unlock

P56–P63 and later regional simulation.

## P55.25 Known risks / ADR triggers

- summary scheduler/tick architecture;
- LOD reconciliation algorithm.

---

# P56 — TURN THE WHEEL

**Classification:** FOUNDATION / COOL-PULL  
**Arc:** ARC VIII  
**Player/creator payoff:** The settlement can generate usable mechanical power from motion instead of every process relying on hand labour.

## P56.1 Purpose

Create Mechanical Power Foundation.

## P56.2 Authoritative source packet

- 20E progression: copper mechanisms → renewable mechanical power;
- automation/resource progression;
- PROD-05 universal Connection/Port contract;
- technical typed network architecture;
- P24 presentation.

## P56.3 Entry gate

- PROD-05 connection contract accepted;
- P55 production foundation.

## P56.4 Dependencies

Architectural dependency on universal Connection/Port exists before this milestone.

P55 for economic context.

## P56.5 Universal primitives used

- Connection/Port;
- Identity;
- State;
- Capability;
- Ownership;
- Permission;
- Result/Reason.

## P56.6 In scope

Mechanical power domain:

- power source;
- output port;
- input/load port;
- shaft/transmission connection;
- rotational speed/torque or chosen domain variables;
- direction;
- capacity/load;
- connected graph;
- enabled/disabled;
- overload/stall;
- disconnect;
- bounded loss hook;
- diagnostics;
- presentation state.

Starter sources:

- hand crank;
- water wheel and/or wind source where environment permits.

## P56.7 Explicit non-scope

- steam;
- electrical grid;
- Flux power;
- full fluid hydrodynamics;
- final gearbox complexity.

## P56.8 Implementation capability requirements

A rotating wheel model does not generate power by visual animation.

Power graph owns authoritative state.

## P56.9 Forge requirements

P58 Machine Forge later authors consumers/components.

P56 may use developer fixtures.

## P56.10 Runtime requirements

Incremental graph update.

## P56.11 Canonical content subset

- one source;
- shaft/transmission;
- one test load.

## P56.12 Persistence implications

Network topology/state reconstructs.

## P56.13 Multiplayer / authority implications

Topology edits authoritative later.

## P56.14 Simulation-LOD implications

Distant network summary preserves source/load balance.

## P56.15 Accessibility / localisation implications

Power flow/state inspectable without animation alone.

## P56.16 Performance implications

Graph update scales; no per-frame full-network recompute.

## P56.17 Security / trust implications

Invalid connection rejected.

## P56.18 Recommended child decomposition

- P56-A — mechanical domain extension;
- P56-B — graph/topology;
- P56-C — source/load calculation;
- P56-D — fault/overload;
- P56-E — diagnostics/performance;
- P56-F — reconciliation.

## P56.19 Acceptance matrix

| ID | Requirement | Evidence | Gate |
| --- | --- | --- | --- |
| P56-AC01 | Mechanical ports use universal typed connection contract | EV-A / EV-B | Required |
| P56-AC02 | Source/load balance is authoritative independent of animation | EV-B | Required |
| P56-AC03 | Disconnect/overload/stall updates affected graph correctly | EV-B / EV-C | Required |
| P56-AC04 | Invalid connection/domain blocked | EV-B negative | Required |
| P56-AC05 | Incremental network update remains bounded | EV-E | Required |
| P56-AC06 | Save/reload reconstructs topology/state | EV-D | Required |
| P56-AC07 | Final SHA/CI passes | EV-H | Required |

## P56.20 Negative tests

- incompatible ports;
- overload;
- source removed;
- loop topology;
- unloaded segment;
- repeated connect/disconnect.

## P56.21 Manual acceptance scenario

Build crank/wheel→shaft→test load.

Observe power.

Disconnect.

Overload.

Restore.

## P56.22 Rule-of-cool target

The first **water wheel/gear assembly actually doing work**.

## P56.23 Exit gate

Mechanical power graph proven.

## P56.24 Downstream unlock

P57–P59.

## P56.25 Known risks / ADR triggers

- mechanical model complexity;
- network partition/update strategy.

---

# P57 — PORTS OF PURPOSE

**Classification:** FOUNDATION  
**Arc:** ARC VIII  
**Player/creator payoff:** Machines gain a consistent language for inputs, outputs, power and control.

## P57.1 Purpose

Implement and certify the machine/network-facing universal connection contract.

## P57.2 Authoritative source packet

- PROD-05 Connection/Port/Socket;
- technical typed networks;
- 20B/20E sockets;
- P56 mechanical graph;
- P16 recipes;
- P53 storage.

## P57.3 Entry gate

Universal contract already exists conceptually.

P56 provides first power-domain implementation proof.

## P57.4 Dependencies

PROD-05, P56.

## P57.5 Universal primitives used

- Connection/Port;
- State;
- Capability;
- Transaction;
- Signal hook;
- Ownership;
- Permission;
- Result/Reason.

## P57.6 In scope

Machine contract:

- machine identity/instance;
- item input/output ports;
- power input/output;
- fuel port;
- fluid port placeholder/typed capability;
- Flux port placeholder;
- signal/control port;
- attachment/socket distinction;
- internal buffers;
- recipe/process capability;
- machine states;
- fault states;
- maintenance hook;
- moving-part presentation hooks;
- safety;
- port geometry/side/compatibility;
- diagnostics.

## P57.7 Explicit non-scope

- full fluid runtime;
- Flux network;
- Signal Forge implementation;
- Machine Forge UI;
- final maintenance system.

## P57.8 Implementation capability requirements

The universal contract is extended by domain.

Do not create unrelated port classes with incompatible meaning.

## P57.9 Forge requirements

P58 consumes.

## P57.10 Runtime requirements

Port topology/state changes authoritative.

## P57.11 Canonical content subset

Machine test fixture.

## P57.12 Persistence implications

Machine/port connection state persists/reconstructs.

## P57.13 Multiplayer / authority implications

Connection edits authority-safe.

## P57.14 Simulation-LOD implications

Topology remains meaningful when visual machine unloads.

## P57.15 Accessibility / localisation implications

Port types/directions readable with symbols/text, not colour only.

## P57.16 Performance implications

Port discovery/graph updates bounded.

## P57.17 Security / trust implications

No arbitrary cross-domain coercion.

## P57.18 Recommended child decomposition

- P57-A — machine base record/state;
- P57-B — item/fuel/power ports;
- P57-C — signal/fluid/Flux typed placeholders;
- P57-D — compatibility/adapter rules;
- P57-E — diagnostics/persistence;
- P57-F — reconciliation.

## P57.19 Acceptance matrix

| ID | Requirement | Evidence | Gate |
| --- | --- | --- | --- |
| P57-AC01 | Machine ports derive from universal Connection/Port contract | EV-A / EV-B | Required |
| P57-AC02 | Item/power/signal domains remain type-safe | EV-B | Required |
| P57-AC03 | Direction/capacity/compatibility enforced | EV-B negative | Required |
| P57-AC04 | Machine state remains when presentation unloads | EV-D | Required |
| P57-AC05 | Port UI/debug is non-colour-only | EV-F | Required |
| P57-AC06 | Port topology updates remain bounded | EV-E | Required |
| P57-AC07 | Final SHA/CI passes | EV-H | Required |

## P57.20 Negative tests

- item→power;
- output→output;
- over-capacity connection;
- disabled port;
- owner permission denied;
- adapter missing.

## P57.21 Manual acceptance scenario

Inspect test machine.

Connect valid item/power endpoints.

Try invalid connections.

Observe precise reasons.

## P57.22 Rule-of-cool target

Quiet infrastructure milestone.

This is the grammar behind almost every later machine.

## P57.23 Exit gate

Machine/network contract stable.

## P57.24 Downstream unlock

P58–P61 and future magic/fluid networks.

## P57.25 Known risks / ADR triggers

- universal-port schema amendment.

---

# P58 — THE MACHINEWRIGHT'S BENCH

**Classification:** FORGE-FIRST  
**Arc:** ARC VIII  
**Player/creator payoff:** A creator can build a functional machine in The Forge from form, ports, process, power and states.

## P58.1 Purpose

Create Machine Forge v1.

## P58.2 Authoritative source packet

- PROD-04 Machine Forge;
- P57;
- 20E machinery;
- ART-04 machines;
- P16 recipes;
- P18–P24 presentation.

## P58.3 Entry gate

- P57 COMPLETE.

## P58.4 Dependencies

P57 plus shared Forge services.

## P58.5 Universal primitives used

- Identity;
- Composition;
- Connection/Port;
- State;
- Capability;
- Provenance;
- Result/Reason.

## P58.6 In scope

Machine Forge journey:

```text
Identity
→ purpose
→ physical form
→ materials
→ moving parts
→ ports
→ buffers
→ process/recipes
→ power
→ states/faults
→ animation
→ VFX
→ lighting
→ audio
→ maintenance/safety hooks
→ validate
→ Test Lab
→ bake
```

## P58.7 Explicit non-scope

- every machine;
- full player Machine Forge;
- arbitrary scripts;
- advanced robotics;
- magic machines.

## P58.8 Implementation capability requirements

Specialist Forge orchestrates shared services.

## P58.9 Forge requirements

This slice is the specialist tool.

## P58.10 Runtime requirements

Baked machine consumed by P59.

## P58.11 Canonical content subset

Starter:

- sawmill or crusher;
- simple mechanical processor;
- optional miner fixture.

## P58.12 Persistence implications

Source/bake/runtime machine state separate.

## P58.13 Multiplayer / authority implications

Developer source only.

## P58.14 Simulation-LOD implications

Machine summary product includes ports/process/state.

## P58.15 Accessibility / localisation implications

Port/state validation readable.

## P58.16 Performance implications

Complexity budgets/preview.

## P58.17 Security / trust implications

No scripts.

## P58.18 Recommended child decomposition

- P58-A — machine source/journey;
- P58-B — parts/ports/buffers;
- P58-C — process/power/state authoring;
- P58-D — presentation integration;
- P58-E — validation/Test Lab;
- P58-F — fixtures/reconciliation.

## P58.19 Acceptance matrix

| ID | Requirement | Evidence | Gate |
| --- | --- | --- | --- |
| P58-AC01 | Machine source authored through Forge with stable identity | EV-B / EV-C | Required |
| P58-AC02 | Ports bind P57 semantic endpoints | EV-B | Required |
| P58-AC03 | Recipe/process uses P16 definitions where appropriate | EV-B | Required |
| P58-AC04 | Presentation services reused, not duplicated | EV-A / review | Required |
| P58-AC05 | Invalid machine fails validation | EV-B negative | Required |
| P58-AC06 | Bake deterministic/traceable | EV-B | Required |
| P58-AC07 | Machine launches in Test Lab | EV-C | Required |
| P58-AC08 | Final SHA/CI passes | EV-H | Required |

## P58.20 Negative tests

- missing power port;
- input/output mismatch;
- recipe missing;
- buffer invalid;
- moving part/pivot missing;
- stale bake.

## P58.21 Manual acceptance scenario

Author sawmill/crusher.

Configure ports/process/power/states.

Validate.

Bake.

Launch Test Lab.

## P58.22 Rule-of-cool target

First time we can say:

> **“We made a functioning machine in The Forge.”**

## P58.23 Exit gate

Machine authoring works.

## P58.24 Downstream unlock

P59.

## P58.25 Known risks / ADR triggers

- machine source graph representation.

---

# P59 — IRON IN MOTION

**Classification:** INTEGRATION / COOL-PULL  
**Arc:** ARC VIII  
**Player/creator payoff:** A powered machine accepts real input, processes it and produces real output.

## P59.1 Purpose

Create Machine Runtime v1.

## P59.2 Authoritative source packet

- P16/P17;
- P56–P58;
- 20E machine/resource rules.

## P59.3 Entry gate

- P58 COMPLETE.

## P59.4 Dependencies

P56–P58.

## P59.5 Universal primitives used

- Transaction;
- State;
- Connection/Port;
- Capability;
- Result/Reason.

## P59.6 In scope

- machine instance;
- connected power;
- input/output buffers;
- process start;
- process timing;
- resource transformation;
- blocked output;
- no power;
- jam/fault hook;
- recovery;
- presentation state;
- save/load;
- basic maintenance hook.

## P59.7 Explicit non-scope

- automated item transport;
- signals;
- full maintenance;
- magic machines.

## P59.8 Implementation capability requirements

Process output created by authoritative process transaction.

Animation is presentation.

## P59.9 Forge requirements

Uses P58 source.

## P59.10 Runtime requirements

Incremental/events.

## P59.11 Canonical content subset

At least two distinct machine behaviours if practical:

- crusher;
- sawmill/basic processor.

## P59.12 Persistence implications

Active process/buffers persist.

## P59.13 Multiplayer / authority implications

Authoritative.

## P59.14 Simulation-LOD implications

Distant machine summary later/provisional.

## P59.15 Accessibility / localisation implications

No power/input/output fault reasons readable.

## P59.16 Performance implications

Multiple machine benchmark.

## P59.17 Security / trust implications

Retry/save cannot duplicate output.

## P59.18 Recommended child decomposition

- P59-A — machine runtime instance;
- P59-B — power/process;
- P59-C — buffer transactions;
- P59-D — faults/recovery;
- P59-E — persistence/performance;
- P59-F — reconciliation.

## P59.19 Acceptance matrix

| ID | Requirement | Evidence | Gate |
| --- | --- | --- | --- |
| P59-AC01 | Machine requires valid power/input | EV-B / EV-C | Required |
| P59-AC02 | Process conserves/transforms resources exactly | EV-B | Required |
| P59-AC03 | Output-full blocks without loss | EV-B negative | Required |
| P59-AC04 | Power loss pauses/fails according to contract | EV-B / EV-C | Required |
| P59-AC05 | Save/reload active process correct | EV-D | Required |
| P59-AC06 | Presentation follows authoritative state | EV-C | Required |
| P59-AC07 | Machine population stays within provisional budget | EV-E | Required |
| P59-AC08 | Final SHA/CI passes | EV-H | Required |

## P59.20 Negative tests

- input removed;
- output full;
- power removed;
- reload at completion boundary;
- duplicate completion callback.

## P59.21 Manual acceptance scenario

Power machine.

Load input.

Watch process.

Block output.

Restore.

Save/reload while active.

## P59.22 Rule-of-cool target

**Material actually moving through powered industry.**

## P59.23 Exit gate

Machine runtime proven.

## P59.24 Downstream unlock

P60/P62.

## P59.25 Known risks / ADR triggers

- machine scheduler/catch-up.

---

# P60 — RIVERS OF GOODS

**Classification:** FOUNDATION / COOL-PULL  
**Arc:** ARC VIII  
**Player/creator payoff:** Items can move automatically between machines and storage through visible logistics networks.

## P60.1 Purpose

Create Automated Logistics v1.

## P60.2 Authoritative source packet

- automation system;
- 20D logistics;
- P53/P57/P59;
- technical item network graph.

## P60.3 Entry gate

- warehouse;
- machine item ports;
- machine runtime.

## P60.4 Dependencies

P53, P57, P59.

## P60.5 Universal primitives used

- Connection/Port;
- Transaction;
- Route/network;
- State;
- Result/Reason.

## P60.6 In scope

- chute/conveyor-like segment;
- item transport endpoint;
- junction;
- split;
- merge;
- filter hook;
- buffer;
- destination selection;
- machine/warehouse import/export;
- blockage;
- cross-chunk continuity;
- transport presentation;
- transaction reconciliation.

## P60.7 Explicit non-scope

- regional freight;
- belts across unloaded continents;
- teleporting item networks;
- fluid pipes;
- smart signals beyond simple built-in routing.

## P60.8 Implementation capability requirements

Visual item movement is not authoritative quantity.

Transport service owns item state/transaction.

## P60.9 Forge requirements

Machine/structure network sockets.

## P60.10 Runtime requirements

Incremental graph/network updates.

## P60.11 Canonical content subset

- chute;
- junction;
- filter/simple splitter if stable.

## P60.12 Persistence implications

In-network/buffer state persists/reconciles.

## P60.13 Multiplayer / authority implications

Authoritative.

## P60.14 Simulation-LOD implications

Network can summarise transfers when distant, preserving quantity.

## P60.15 Accessibility / localisation implications

Blockage/filter state inspectable.

## P60.16 Performance implications

High-throughput benchmark.

No entity-per-item requirement at all distances.

## P60.17 Security / trust implications

No duplication across chunk unload/retry.

## P60.18 Recommended child decomposition

- P60-A — item-network topology;
- P60-B — transfer/buffers;
- P60-C — junction/filter;
- P60-D — machine/warehouse integration;
- P60-E — cross-chunk/LOD/performance;
- P60-F — reconciliation.

## P60.19 Acceptance matrix

| ID | Requirement | Evidence | Gate |
| --- | --- | --- | --- |
| P60-AC01 | Exact item quantity moves through network | EV-B | Required |
| P60-AC02 | Blocked destination preserves items | EV-B negative | Required |
| P60-AC03 | Cross-chunk/unload transition preserves in-transit quantity | EV-D | Required |
| P60-AC04 | Warehouse/machine endpoints use P57 ports | EV-B | Required |
| P60-AC05 | Visual movement may aggregate without changing authoritative count | EV-B / EV-E | Required |
| P60-AC06 | High-throughput fixture stays bounded | EV-E | Required |
| P60-AC07 | Final SHA/CI passes | EV-H | Required |

## P60.20 Negative tests

- blocked segment;
- chunk unload;
- source removed;
- destination full;
- filter rejects;
- retry.

## P60.21 Manual acceptance scenario

Machine output → chute → junction → warehouse.

Block line.

Observe backlog.

Restore.

Confirm exact stock.

## P60.22 Rule-of-cool target

The first visible **river of goods** running through a workshop.

## P60.23 Exit gate

Automated item logistics works.

## P60.24 Downstream unlock

P61/P62.

## P60.25 Known risks / ADR triggers

- item-network representation;
- cross-chunk summarisation.

---

# P61 — THE WHISPERING WIRE

**Classification:** FORGE-FIRST / COOL-PULL  
**Arc:** ARC VIII  
**Player/creator payoff:** Players/creators can connect machines, lights, doors, alarms and later magic through safe visual logic.

## P61.1 Purpose

Create Signal & Logic Forge v1 and bounded control runtime.

## P61.2 Authoritative source packet

- PROD-05 Signal vs Domain Event;
- P57 signal ports;
- P23 Music Lab future trigger;
- automation/control direction;
- PROD-04 composition tooling.

## P61.3 Entry gate

- P57 ports;
- P59 machines;
- P60 logistics.

## P61.4 Dependencies

P57/P59/P60.

## P61.5 Universal primitives used

- Signal;
- Connection/Port;
- State;
- Capability;
- Result/Reason;
- Composition.

## P61.6 In scope

Approved logic nodes/operators:

- trigger;
- boolean signal;
- pulse;
- toggle/latch;
- timer;
- counter;
- comparison;
- threshold;
- AND/OR/NOT;
- simple gate;
- state read;
- item/storage fullness read;
- machine fault read;
- time/day-night read hook;
- pressure/lever trigger;
- approved actions:
  - enable/disable machine;
  - toggle light;
  - open authorised door/gate;
  - ring bell;
  - change allowed routing mode;
  - trigger approved Music Lab note/event.

Signal Forge:

```text
Purpose
→ inputs
→ logic nodes
→ outputs
→ approved actions
→ timing
→ validation
→ simulation/test
```

## P61.7 Explicit non-scope

- arbitrary scripting;
- filesystem/network access;
- unrestricted reflection;
- custom code execution;
- full programmable computer;
- AI logic.

## P61.8 Implementation capability requirements

Signal expresses control intent/information.

Target system validates the requested action.

Signal itself does not bypass permission/state.

## P61.9 Forge requirements

Visual graph/composer.

## P61.10 Runtime requirements

Bounded evaluation/update.

Cycle handling explicit.

## P61.11 Canonical content subset

Examples:

- storage-full stop machine;
- night lamp;
- machine alarm;
- lever gate;
- pressure plate bell;
- note trigger.

## P61.12 Persistence implications

Logic graph/source/state such as latch/counter persists where required.

## P61.13 Multiplayer / authority implications

Server/authority evaluates consequential action.

## P61.14 Simulation-LOD implications

Simple control may summarise distant while preserving state.

## P61.15 Accessibility / localisation implications

Signals use shapes/icons/text not colour only.

## P61.16 Performance implications

Event-driven/bounded updates; cycle protection.

## P61.17 Security / trust implications

Critical.

No arbitrary code.

Approved action whitelist.

## P61.18 Recommended child decomposition

- P61-A — signal type/channel runtime;
- P61-B — logic node library;
- P61-C — Signal Forge graph editor;
- P61-D — approved state-read/action adapters;
- P61-E — cycle/security/performance;
- P61-F — fixture suite/reconciliation.

## P61.19 Acceptance matrix

| ID | Requirement | Evidence | Gate |
| --- | --- | --- | --- |
| P61-AC01 | Signal remains separate from authoritative domain event | EV-A / EV-B | Required |
| P61-AC02 | Logic can read approved state and request approved action | EV-B / EV-C | Required |
| P61-AC03 | Target system still validates action/permission | EV-B negative | Required |
| P61-AC04 | Arbitrary scripting/internal service access unavailable | EV-B security | Required |
| P61-AC05 | Logic cycles fail/settle according to bounded rule | EV-B negative | Required |
| P61-AC06 | Large representative logic graph stays bounded | EV-E | Required |
| P61-AC07 | Music Lab note can be triggered through approved semantic adapter | EV-C | Required |
| P61-AC08 | Logic state persists where required | EV-D | Required |
| P61-AC09 | Final SHA/CI passes | EV-H | Required |

## P61.20 Negative tests

- infinite cycle;
- unauthorised door;
- invalid signal type;
- stale target;
- attempt to invoke internal method;
- high-frequency pulse spam.

## P61.21 Manual acceptance scenario

Create storage-full stop-machine circuit.

Create night lamp.

Create lever→bell/note.

Break/repair connections.

## P61.22 Rule-of-cool target

This is a huge sandbox milestone:

> **the player can make systems react to systems.**

## P61.23 Exit gate

Safe composable control layer exists.

## P61.24 Downstream unlock

P62/P72 and later rituals, traps, wards, vessels.

## P61.25 Known risks / ADR triggers

- graph evaluation model;
- player-content sandbox/security boundary.

---

# P62 — THE FIRST FACTORY

**Classification:** INTEGRATION / COOL-PULL  
**Arc:** ARC VIII  
**Player/creator payoff:** A complete automated resource chain extracts, processes and stores material with minimal manual handling.

## P62.1 Purpose

Certify first factory composition.

## P62.2 Authoritative source packet

- P51 extraction;
- P53 storage;
- P56–P61;
- resource progression early automation;
- Core Gameplay Loop automation path.

## P62.3 Entry gate

- P51/P53/P56–P61 COMPLETE.

## P62.4 Dependencies

Relevant ARC VIII systems.

## P62.5 Universal primitives used

Broad integration set.

## P62.6 In scope

Canonical chain:

```text
IRON/ORE DEPOSIT
→ MINER / EXTRACTION
→ ITEM LOGISTICS
→ CRUSHER / PROCESSOR
→ FURNACE / REFINER
→ INGOT
→ WAREHOUSE
```

The initial extractor may be:

- NPC miner feeding line;
- machine miner if current P59 scope supports one.

Mechanical power required where applicable.

Signals may provide:

- start/stop;
- full-storage halt;
- fault alarm.

## P62.7 Explicit non-scope

- giant factory;
- electricity;
- magic automation;
- regional logistics;
- assemblers for whole tech tree.

## P62.8 Implementation capability requirements

No bespoke Factory system.

Composition only.

## P62.9 Forge requirements

Machines from Machine Forge.

Logic from Signal Forge.

## P62.10 Runtime requirements

Exact conservation end to end.

## P62.11 Canonical content subset

One iron/copper chain chosen from current progression.

## P62.12 Persistence implications

Save/reload/LOD must preserve whole chain.

## P62.13 Multiplayer / authority implications

Future-safe.

## P62.14 Simulation-LOD implications

Prove active and bounded away operation if feasible under P55.

## P62.15 Accessibility / localisation implications

Fault/bottleneck diagnostics understandable.

## P62.16 Performance implications

Combined network benchmark.

## P62.17 Security / trust implications

No duplication under reconnect/reload-style retries.

## P62.18 Recommended child decomposition

- P62-A — factory fixture design;
- P62-B — extraction/logistics integration;
- P62-C — processing/power integration;
- P62-D — signal/storage integration;
- P62-E — persistence/LOD/performance;
- P62-F — reconciliation.

## P62.19 Acceptance matrix

| ID | Requirement | Evidence | Gate |
| --- | --- | --- | --- |
| P62-AC01 | Input deposit/stock decrease reconciles with final warehouse output/by-products | EV-B | Required |
| P62-AC02 | Each stage uses existing normal system contracts | EV-A / review | Required |
| P62-AC03 | Storage-full condition stops/blocks chain safely | EV-C / EV-B | Required |
| P62-AC04 | Power failure propagates correct operational state | EV-C | Required |
| P62-AC05 | Save/reload preserves in-flight buffers/processes without duplication | EV-D | Required |
| P62-AC06 | Away/return simulation preserves quantity if enabled | EV-D | Required |
| P62-AC07 | Combined factory stays within provisional budget | EV-E | Required |
| P62-AC08 | Human review confirms bottlenecks/faults understandable | EV-G | Required |
| P62-AC09 | Final SHA/CI passes | EV-H | Required |

## P62.20 Negative tests

- warehouse full;
- power loss;
- blocked chute;
- machine failure;
- source exhausted;
- save with items in network.

## P62.21 Manual acceptance scenario

Start factory.

Observe ore become ingots.

Fill warehouse.

Observe automatic stop/block.

Clear stock.

Restart.

Break power/logistics and diagnose.

## P62.22 Rule-of-cool target

The first proper:

> **“Holy shit, I built a factory.”**

moment. 😂🔥

## P62.23 Exit gate

Factory composition works without bespoke factory code.

## P62.24 Downstream unlock

P63 and later magic/region systems.

## P62.25 Known risks / ADR triggers

- cross-network scheduler interactions.

---

# P63 — A TOWN THAT WORKS

**Classification:** INTEGRATION / COOL-PULL  
**Arc:** ARC VIII  
**Player/creator payoff:** The settlement can gather, craft, store, haul, build, power and automate enough of its own economy that it feels genuinely alive.

## P63.1 Purpose

Certify ARC VIII and the first working settlement economy.

## P63.2 Authoritative source packet

- P49–P62;
- P39–P48;
- 20A–20E;
- Resource/Recipe/Automation/NPC authorities.

## P63.3 Entry gate

- P49–P62 COMPLETE.

## P63.4 Dependencies

All ARC VIII plus ARC VII settlement foundation.

## P63.5 Universal primitives used

Nearly all early simulation primitives.

## P63.6 In scope

Integration settlement contains:

- multiple households;
- multiple professions;
- extraction;
- NPC crafting;
- warehouse;
- hauling;
- autonomous work while player away;
- construction project;
- mechanical power;
- at least two machines;
- automated item logistics;
- bounded signals;
- factory chain;
- seven-pillar summaries responding to real production;
- shortages/bottlenecks;
- player intervention;
- save/reload/away-return.

## P63.7 Explicit non-scope

- regional economy;
- trade caravans;
- government;
- ocean;
- full magic;
- city-scale population;
- every industry.

## P63.8 Implementation capability requirements

The settlement must function because normal systems compose.

No `TownEconomyController` that fabricates totals.

Settlement summary observes:

- actual people;
- actual stock;
- actual buildings;
- actual routes;
- actual production.

## P63.9 Forge requirements

All content uses existing Forge services.

## P63.10 Runtime requirements

Player can leave and return to meaningful change.

## P63.11 Canonical content subset

Compact Overworld settlement production slice.

## P63.12 Persistence implications

Full fixture persists.

## P63.13 Multiplayer / authority implications

Future-safe authoritative transactions.

## P63.14 Simulation-LOD implications

P55 away production integrated with machine/settlement economy.

## P63.15 Accessibility / localisation implications

Player can understand:

- shortage;
- blocked route;
- missing worker/tool;
- machine fault;
- stock state;
- project state.

## P63.16 Performance implications

Profile combined settlement/factory/people/roads.

## P63.17 Security / trust implications

Run conservation and permission negatives.

## P63.18 Recommended child decomposition

- P63-A — working-town fixture/content;
- P63-B — profession/extraction/crafting/storage integration;
- P63-C — hauling/construction/autonomy;
- P63-D — power/machine/logistics/signal integration;
- P63-E — away-return/save/performance/human review;
- P63-F — PG-08 reconciliation.

## P63.19 Acceptance matrix

| ID | Requirement | Evidence | Gate |
| --- | --- | --- | --- |
| P63-AC01 | NPC workers gather/process using real profession/work contracts | EV-C / EV-B | Required |
| P63-AC02 | Warehouse stock/reservations reconcile exactly | EV-B | Required |
| P63-AC03 | Hauling physically/semantically connects work sites and storage | EV-C | Required |
| P63-AC04 | Construction consumes settlement resources and Builder labour | EV-C / EV-B | Required |
| P63-AC05 | Mechanical/machine/logistics networks operate from P56–P60 contracts | EV-C | Required |
| P63-AC06 | Signal logic controls approved behaviours without bypass | EV-B / EV-C | Required |
| P63-AC07 | Player absence produces bounded conserved work results | EV-D | Required |
| P63-AC08 | Shortage/fault/bottleneck visibly changes settlement behaviour | EV-C | Required |
| P63-AC09 | Seven-pillar summaries remain causally tied to underlying systems | EV-B | Required |
| P63-AC10 | Combined performance remains within provisional settlement target | EV-E | Required |
| P63-AC11 | No resource duplication/loss found through long integration run | EV-B / soak | Required |
| P63-AC12 | Human review confirms settlement feels understandable and alive | EV-G | Required |
| P63-AC13 | Final SHA/CI passes | EV-H | Required |

## P63.20 Negative tests

- mine exhausted;
- warehouse full;
- road blocked;
- hauler absent;
- artisan tool missing;
- power offline;
- chute jammed;
- signal invalid;
- save/quit mid-production;
- leave/return multiple cycles.

## P63.21 Manual acceptance scenario

Enter settlement.

Inspect needs/stock.

Watch:

- miner/lumber worker;
- hauler;
- artisan;
- builder;
- machines;
- factory/logistics.

Create a bottleneck.

Leave area.

Return.

Repair bottleneck.

Watch settlement recover.

Save/reload.

## P63.22 Rule-of-cool target

This should be the first milestone where the user can stand on a hill and watch a little town below and realise:

> **“That whole thing actually works.”**

## P63.23 Exit gate — PG-08 PRODUCTION & AUTOMATION FOUNDATION

PG-08 passes only when:

- P49–P63 COMPLETE;
- the settlement economy conserves resources;
- professions/workplaces/warehouses/logistics/machines share one economy;
- away-state simulation reconciles;
- Signal/Logic is bounded;
- the factory is composition, not bespoke code.

## P63.24 Downstream unlock

ARC IX — WHEN THE LEY AWAKENS:

- Flux foundation;
- Rune Forge;
- Spell Forge;
- player magic;
- magical infrastructure;
- Alchemy Forge;
- Ritual Forge;
- magic + automation;
- P72 Flux-powered voxel pipe organ.

## P63.25 Known risks / ADR triggers

- combined settlement scheduler;
- cross-network deadlocks;
- simulation-LOD reconciliation at higher population.

---

# 05. Arc VII Integration Gate — PG-07 Summary

PG-07 requires:

| Capability | Parent |
| --- | --- |
| Structure/Blueprint contract | P39 |
| Structure Forge | P40 |
| Semantic validation | P41 |
| Construction runtime | P42 |
| NPC Builder | P43 |
| Households/residency | P44 |
| Settlement planner | P45 |
| Roads/parcels | P46 |
| Migration | P47 |
| Campfire → Hamlet | P48 |

Minimum end-to-end:

```text
three-person hearth
→ identify housing/service need
→ planner chooses authored project
→ site/route valid
→ exact materials supplied
→ Builder constructs stages
→ structure validates
→ household moves in
→ new capacity permits migration
→ fourth settler arrives
→ save/reload
```

---

# 06. Arc VIII Integration Gate — PG-08 Summary

PG-08 requires:

| Capability | Parent |
| --- | --- |
| Work/Profession contract | P49 |
| Work & Profession Forge | P50 |
| Gathering/Extraction | P51 |
| NPC Crafting/Processing | P52 |
| Settlement Warehouse | P53 |
| Hauling/Internal Logistics | P54 |
| Autonomous Away Production | P55 |
| Mechanical Power | P56 |
| Machine/Network Contract | P57 |
| Machine Forge | P58 |
| Machine Runtime | P59 |
| Automated Logistics | P60 |
| Signal & Logic Forge | P61 |
| First Factory | P62 |
| Working Town | P63 |

Minimum end-to-end:

```text
resource site
→ worker extracts
→ hauler delivers
→ warehouse reserves
→ artisan/machine processes
→ power drives machines
→ logistics moves output
→ signal handles blockage/full state
→ warehouse receives goods
→ construction/settlement consumes goods
→ player leaves
→ settlement continues bounded work
→ player returns
→ quantities reconcile
```

---

# 07. Recommended Production Concurrency

The numeric order remains the default.

## P39–P41

P40 tooling can begin while late P39 schema settles if source/identity contracts are not redefined.

P41 validators should be developed alongside representative P40 fixtures.

## P42/P43

P43 task-source scaffolding may start late in P42, but construction semantics remain P42-owned.

## P44–P47

Households, settlement planning, roads and migration can overlap once:

- structure semantics;
- settlement record;
- service summaries;

are stable.

## P49/P50

Profession Forge may begin as soon as P49 schema stabilises.

## P51–P54

Extraction, NPC crafting, storage and hauling can proceed partly in parallel with explicit transaction/storage ownership.

## P56–P61

Shared network infrastructure should be developed deliberately to avoid each network inventing private concepts.

Mechanical power P56 is the first concrete domain.

P57 formalises the machine-facing universal network contract.

P60 and P61 then add item-flow and control domains.

---

# 08. What Must NOT Sneak Into Arcs VII–VIII

## Settlement

- town/city governments;
- factions;
- diplomacy;
- laws/justice depth;
- regional economy;
- caravans;
- city districts;
- megaprojects.

## World

- final worldgen;
- oceans;
- realms.

## Magic

- full Flux system;
- spells;
- runes;
- magical machines.

P11 crystal remains a resource teaser only until P64.

## Automation

- unrestricted programmable computers;
- electrical grids;
- steam mega-industry;
- robots/golems;
- AI-controlled factories.

---

# 09. Cross-Arc Architectural Discoveries Locked Here

## 09.1 Structure Forge is the first major proof of semantic composition

A structure is more than voxels because it has:

- rooms;
- services;
- entrances;
- storage;
- work;
- routes;
- stages;
- state.

This is the same composition philosophy later used by:

- rituals;
- dungeons;
- vessels;
- factories;
- realms.

## 09.2 Builder's correct ownership is now explicit

P43 owns construction-work runtime.

P50 owns Builder profession identity/authoring.

This prevents Builder from becoming a special NPC species.

## 09.3 Settlement stage must emerge from capability, not XP

Camp → Hamlet growth is driven by:

- people;
- structures;
- needs;
- routes;
- resources;
- capacity.

Not a free level-up unlock.

## 09.4 Warehousing becomes the economic truth layer

P53 is the first serious bridge from:

- survival inventory

to:

- civilisation stock.

Later regional economy should build on it rather than creating abstract settlement resources.

## 09.5 P55 establishes the civilisation-scale LOD pattern

Object:

> this furnace works.

Settlement:

> this hamlet works.

Later:

> this region works.

The pattern scales by preserving authoritative summaries, not by simulating every path forever.

## 09.6 Universal connection architecture is preserved without roadmap renumbering

The dependency issue around P56/P57 is now permanently handled.

Conceptual architecture first.

Roadmap milestone proof second.

## 09.7 Signal Forge is becoming a foundational composition tool

P61 is already useful for:

- machines;
- doors;
- storage;
- lights;
- alarms;
- Music Lab.

Later it becomes useful for:

- wards;
- traps;
- rituals;
- dungeon puzzles;
- vessels;
- instruments.

This is broader than an automation-only system.

## 09.8 Forge composition beats bespoke feature systems

P62 is deliberately a composition certification.

If the factory needs a bespoke parent controller to work, the underlying systems are not composable enough yet.

---

# 10. Recommended Persistent Regression Fixtures

Retain:

- P39 semantic cottage source;
- P40 Structure Forge golden cottage;
- P41 broken-door/bed validation fixture;
- P42 staged cottage project;
- P43 NPC Builder project;
- P44 household/residency fixture;
- P45 planner shortage/project-choice fixture;
- P46 path/blocked-route fixture;
- P47 fourth-settler migration fixture;
- P48 Campfire → Hamlet world;
- P49 profession/work-order fixture;
- P50 Builder/Miner/Hauler definitions;
- P51 extraction fixture;
- P52 artisan workstation fixture;
- P53 warehouse reservation fixture;
- P54 in-transit cargo fixture;
- P55 leave/return production fixture;
- P56 mechanical wheel network;
- P57 typed-port compatibility fixture;
- P58 machine source golden;
- P59 powered processor;
- P60 cross-chunk item network;
- P61 bounded signal-logic fixture;
- P62 first factory;
- P63 working-town integration world.

P48 and P63 should become major long-term regression worlds.

---

# 11. ProductionRegistry Seed Entries

```text
P039 — The Architect's Table
P040 — Stone Dreams
P041 — More Than Walls
P042 — Raised One Stone at a Time
P043 — Hands at Work
P044 — Roots Take Hold
P045 — The Village Chooses
P046 — The Road Between Doors
P047 — The Fourth Chair
P048 — From Campfire to Hamlet
P049 — The Work of Many Hands
P050 — Callings of the Hearth
P051 — From Forest and Vein
P052 — Hands That Make
P053 — The Common Store
P054 — Burden and Road
P055 — While You Were Away
P056 — Turn the Wheel
P057 — Ports of Purpose
P058 — The Machinewright's Bench
P059 — Iron in Motion
P060 — Rivers of Goods
P061 — The Whispering Wire
P062 — The First Factory
P063 — A Town That Works
```

No status becomes READY because this document exists.

---

# 12. Open Decisions Deliberately Deferred to Execution Evidence

PROD-10 does not silently decide:

- exact structure source storage format;
- exact stage count for every building;
- exact Builder work speed;
- exact household size rules;
- exact planner scoring weights;
- exact road cost coefficients;
- exact migration rates;
- exact profession skill progression;
- exact extraction depletion/regeneration;
- exact warehouse capacities;
- exact hauling batch size;
- exact away-simulation cadence;
- exact mechanical power units/formula;
- exact machine throughput/power draw;
- exact chute/belt visual representation;
- exact Signal Forge node count/library beyond v1;
- final factory balance.

---

# 13. PROD-10 Acceptance Gate

PROD-10 is ready for owner lock when the owner agrees that:

- [ ] P39–P63 retain PROD-02 names/order;
- [ ] Structure sources reference only registered canonical content;
- [ ] source, bake, project and placed structure instance remain distinct;
- [ ] a visually complete building provides no service unless semantic validation passes;
- [ ] Structure Forge is a guided composition workflow, not a private block editor;
- [ ] construction projects consume exact resources through reservations/transactions;
- [ ] P43 Builder runtime does not create a permanent special BuilderNPC class;
- [ ] Builder is explicitly canonicalised as a profession in P50;
- [ ] households/residency require valid semantic Housing capacity;
- [ ] settlement planning selects authored valid projects from real needs/opportunities rather than free building generation;
- [ ] roads/routes affect real access and travel;
- [ ] migration depends on actual settlement capacity rather than abstract XP;
- [ ] P48 proves Campfire → Hamlet using normal systems;
- [ ] Profession, active job task and workplace remain distinct concepts;
- [ ] P51 extraction uses real world/resource sources;
- [ ] NPC crafting reuses canonical recipes;
- [ ] warehouse capacity does not equal stock;
- [ ] reservations never duplicate stock;
- [ ] hauling transfers real ownership/possession rather than teleporting totals;
- [ ] away production in P55 preserves resource conservation;
- [ ] universal Connection/Port architecture conceptually precedes P56 even though P57 remains its roadmap implementation/proof milestone;
- [ ] mechanical power, item logistics and signals share connection infrastructure without sharing one propagation model;
- [ ] Machine Forge orchestrates shared Forge services;
- [ ] machine runtime creates outputs through authoritative process transactions;
- [ ] automated logistics presentation never becomes authoritative quantity;
- [ ] Signal & Logic Forge is bounded and cannot execute arbitrary scripts;
- [ ] P62 First Factory is composition-only rather than bespoke factory code;
- [ ] P63 working town uses the same real people/resources/buildings/routes/warehouses/machines as the rest of the game;
- [ ] exact balance/performance/provider parameters remain evidence-driven.

---

# 14. Proposed Lock Statement

If owner-approved, lock the following:

> **PROD-10 — LEYFORGE ARCS VII–VIII PRODUCTION CONTRACTS — v0.1**
>
> ARC VII scales the first living hearth into a real settlement through semantic structures, Structure Forge, functional validation, exact staged construction, NPC Builder work, households, planning, roads/parcels and causally earned migration. Structures use only registered canonical content and provide gameplay services only when their semantic markers, zones, routes, stock, staff, utilities, permissions and operational state validate. Builder runtime is introduced at P43 and is formalised as a true profession through P50 rather than remaining a construction-only NPC special case. ARC VIII then establishes a real settlement economy: Work/Profession contracts and Forge authoring, extraction, NPC crafting, authoritative warehousing, hauling, bounded away-state production, mechanical power, typed machine/network ports, Machine Forge, machine processing, automated item logistics, bounded Signal & Logic Forge, the First Factory and a working-town integration slice. All resources remain conserved through authoritative transactions; capacity and presentation never invent stock; network domains share common connection semantics while retaining domain-specific behaviour; and the factory/town are compositions of reusable systems rather than bespoke controllers.

---

# 15. Next Document

After PROD-10 acceptance/reconciliation, continue to:

> **PROD-11 — Arcs IX–X Production Contracts: P64–P82**

That volume will cover:

- Flux / Fluxion foundation;
- Rune Forge;
- Spell Forge;
- player magic runtime;
- Magical Infrastructure Forge;
- Alchemy Forge;
- Ritual Forge;
- magic + automation integration;
- P72 Flux-powered voxel pipe organ certification;
- regional Worldgen Contract;
- World Forge;
- Biome Forge;
- Flora & Ecology Forge / Ecology Composer;
- Weather & Seasons;
- Cave Provinces & Deep Overworld;
- world structures/ruins;
- Dungeon Forge;
- Cartography & Discovery;
- First Expedition integration.

---

**End of PROD-10 v0.1 — Arcs VII–VIII Production Contracts Candidate**
