
# LEYFORGE PRODUCTION PROGRAMME

## PROD-08 — Arcs III–IV Production Contracts: P12–P24

**Document ID:** PROD-08  
**Title:** Leyforge Arcs III–IV Production Contracts — Hearth & Hammer / Shape, Motion & Song  
**Version:** v0.1  
**Date:** 21 September 2026  
**Status:** **DRAFT FOR OWNER REVIEW — EXECUTABLE ARC VOLUME CANDIDATE**  
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
**Previous executable volume:** PROD-07 — Arcs I–II Production Contracts: P01–P11  
**Arc scope:** ARC III — HEARTH & HAMMER / ARC IV — SHAPE, MOTION & SONG  
**Parent slices:** P12–P24  
**Programme gates:** PG-03 Survival / Craft Foundation, PG-04 Presentation Stack  
**Primary downstream consumers:** ProductionRegistry, Project Brain, Task Contracts, Codex/coding agents, CI, runtime/Forge implementation, PROD-09 onward

---

# 00. Executive Arc Statement

PROD-08 turns the persistent editable world created by PROD-07 into a game with a meaningful first material loop, then establishes the shared presentation systems that every later entity, machine, settlement, spell, vessel and realm will reuse.

The two Arcs have different but deliberately connected jobs.

## ARC III — HEARTH & HAMMER

> *Take what the world gives you. Shape it into what you need.*

ARC III proves the first true survival-production chain:

```text
BLOCK / RESOURCE
→ BREAK
→ DROP / PICKUP
→ INVENTORY
→ TOOL
→ SURVIVAL USE
→ RECIPE
→ CRAFT
→ FURNACE / PROCESS
→ REFINED MATERIAL
```

This Arc closes only when Leyforge has a coherent, persistent, conserved:

> **gather → carry → craft → process**

loop.

## ARC IV — SHAPE, MOTION & SONG

> *A world is not alive because it moves. It is alive because movement has meaning.*

ARC IV establishes the production presentation stack:

```text
AUTHORITATIVE GAMEPLAY STATE
        ↓
PRESENTATION STATE
        ├── Animation
        ├── VFX
        ├── Lighting
        ├── Sound
        └── Music
```

The governing principle is:

> **Gameplay systems own truth. Presentation systems read and communicate that truth.**

A furnace animation may show processing.

It may not consume fuel.

A flame effect may show that a campfire is burning.

It may not be the only state that says the campfire is burning.

A sound may warn that output is blocked.

It may not set the machine state.

By the end of P24, Leyforge should have one reusable presentation language ready for creatures, NPCs, machines, magic and civilisation rather than each later system inventing its own audiovisual state logic.

---

# 01. Governing Production Rules for P12–P24

## 01.1 Resource conservation begins now

From P12 onward, resource movement is authoritative.

Items/resources do not appear or disappear because:

- a pickup unloads;
- inventory UI closes;
- a furnace animation completes;
- a save occurs;
- an entity projection despawns.

Every movement/transformation follows the Transaction contract from PROD-05.

## 01.2 Current single-definition rule supersedes historical block-item duplication

Historical item documents describe separate “block item forms.”

The current production rule is:

> **If a broken/collected block remains the same canonical block when carried and placed again, inventory references that canonical block/content definition rather than creating a duplicate gameplay Item solely for inventory.**

A separate item definition exists only when the world object transforms into a genuinely different carried object or where current canon explicitly requires one.

Examples:

- placed stone block → collected same stone block reference;
- ore block → raw ore item, if current drop canon says mining transforms it;
- log block → same block reference or transformed log item according to current authoritative content rule;
- tool → item/equipment definition, because it is not simply a placeable world block.

PROD-08 must not blindly implement the older duplicate block-item model.

## 01.3 Inventory stores semantics, not scene instances

The inventory contains:

- canonical content identity;
- quantity;
- instance state where required.

It does not contain:

- dropped-item Node references;
- icon Nodes;
- scene paths as identity.

## 01.4 Recipes transform real inputs

Crafting does not create outputs by UI decree.

Recipe execution validates and consumes actual inputs and commits actual outputs.

## 01.5 Early survival stays deliberately small

P15 is not the final needs system.

The early slice proves:

- consequence;
- warmth/fire/shelter;
- basic recoverability;
- enough tension to make gathering/crafting meaningful.

The complete settlement needs framework arrives later.

## 01.6 Forge-first continues

P14 creates the Item & Tool authoring capability before the project mass-produces tools/items.

P16 creates Recipe Forge before large recipe expansion.

P18–P23 create shared presentation authoring capabilities before creatures/machines/magic depend on them.

## 01.7 Presentation reads truth

P18–P24 must preserve the locked Set 21C principle:

> **Presentation reads authoritative state and communicates it. It does not own gameplay state.**

## 01.8 Accessibility begins with the presentation stack

Critical state may not depend solely on:

- colour;
- sound;
- flashing;
- motion.

Reduced-motion, reduced-flash, bloom-off/low-effects and non-audio equivalents are architectural obligations from the beginning.

## 01.9 Music is not permanent wallpaper

ART-07 establishes music as intermittent, adaptive and supportive of exploration, survival, civilisation and mystery rather than continuously cinematic.

P22/P23 must respect that identity.

---

# 02. Common Evidence Rules for This Volume

All P-slices inherit PROD-06.

ARC III particularly requires:

- transaction/conservation tests;
- save/reload;
- negative inventory tests;
- recipe atomicity;
- UI truth tests.

ARC IV particularly requires:

- source → bake → runtime evidence;
- state-binding tests;
- accessibility variants;
- timing/event correctness;
- performance/LOD evidence;
- ART-06/07/08 review where applicable.

---

# 03. ARC III — HEARTH & HAMMER

---

# P12 — WHAT THE EARTH GIVES

**Classification:** FOUNDATION  
**Arc:** ARC III — HEARTH & HAMMER  
**Player/creator payoff:** Breaking useful world content now yields something tangible the player can collect.

## P12.1 Purpose

Establish world resources/pickups and the first conserved transfer from voxel/world state into carried-state ownership.

P12 answers:

> **When the player removes a resource from the world, where does that value go?**

## P12.2 Authoritative source packet

Primary:

- PROD-03 inventory/resource transaction architecture;
- PROD-05 Identity, Ownership, Transaction, Result/Reason;
- current Blocks Registry mining/drop semantics;
- current Items Registry where non-block item forms remain canonical;
- Resource Progression;
- P04 authoritative edits;
- P05 persistence;
- ART-04 world/held/dropped modelling rules;
- ART-08 icon/presentation hooks.

## P12.3 Entry gate

- P05 COMPLETE;
- P11 complete enough that early block/resource identities are stable;
- current drop transformation rules resolved for the starter set.

## P12.4 Dependencies

### Hard

P04–P05.

### Forge

P08/P09 for representative authored resource assets.

### Runtime

semantic world edits; world-item/entity projection; persistence.

### Content

Starter subset such as:

- stone;
- wood/log;
- fibre/stick or equivalent;
- coal/ore only where current early progression needs it.

## P12.5 Universal primitives used

- Identity;
- Ownership;
- State;
- Capability;
- Transaction;
- Result/Reason.

## P12.6 In scope

- authoritative break-result/drop rule;
- block-preserves-identity handling;
- transformed-drop handling;
- world pickup record;
- world pickup projection;
- stack aggregation where valid;
- pickup transaction;
- ownership/possession transfer;
- pickup persistence;
- unload/reload safety;
- despawn policy foundation if any;
- collection feedback;
- test/debug inspection.

## P12.7 Explicit non-scope

- full player inventory UI;
- hotbar;
- tool gating;
- loot rarity;
- creature drops;
- equipment;
- economy;
- settlement storage;
- conveyors.

## P12.8 Implementation capability requirements

Required conceptual chain:

```text
BreakBlock transaction
→ authoritative drop outcome
→ world resource/pickup state
→ pickup projection
→ collect transaction
→ carried-state destination
```

P12 may use a temporary small carried-state container before P13, but the transaction semantics must be final enough to migrate cleanly.

## P12.9 Forge requirements

Dropped/held presentation derives from canonical source/ART rules.

Do not create hidden gameplay identity for visual projection.

## P12.10 Runtime requirements

World pickup Node is a projection of persistent pickup state where persistence is required.

Unloading the Node cannot duplicate/delete the authoritative resource.

## P12.11 Canonical content subset

Enough to prove:

1. a block that remains the same canonical block;
2. a block/resource that transforms into a different item on break, if current canon includes one in the starter set.

## P12.12 Persistence implications

Required:

- world pickup survives save/reload if still present;
- collected pickup does not reappear after reload;
- broken block remains broken through P05.

## P12.13 Multiplayer / authority implications

Pickup transaction IDs and ownership changes must be compatible with future simultaneous pickup attempts.

## P12.14 Simulation-LOD implications

Far/unloaded pickups may use compact records.

No physics projection is required while unloaded.

## P12.15 Accessibility / localisation implications

Pickup feedback should not be sound-only.

## P12.16 Performance implications

Test bounded pickup density and aggregation.

Do not spawn one permanent heavy physics object for every trivial resource if lighter projection is sufficient.

## P12.17 Security / trust implications

Repeated/replayed pickup commands must not duplicate resources.

## P12.18 Recommended child decomposition

- P12-A — drop/transformation contract;
- P12-B — persistent pickup state/projection;
- P12-C — pickup transaction/ownership;
- P12-D — persistence/unload proof;
- P12-E — density/performance proof;
- P12-F — reconciliation.

## P12.19 Acceptance matrix

| ID | Requirement | Evidence | Gate |
| --- | --- | --- | --- |
| P12-AC01 | Breaking starter resource produces authoritative drop outcome | EV-B / EV-C | Required |
| P12-AC02 | Same-block carry path does not create duplicate canonical Item | EV-A / EV-B | Required |
| P12-AC03 | Transformed drops use explicit canonical output identity | EV-B | Required |
| P12-AC04 | Pickup transaction transfers exact quantity once | EV-B negative/retry | Required |
| P12-AC05 | Uncollected pickup survives unload/save/reload where policy requires | EV-D | Required |
| P12-AC06 | Collected pickup does not respawn on reload | EV-D | Required |
| P12-AC07 | Projection destruction alone cannot delete/duplicate resource | EV-B | Required |
| P12-AC08 | Pickup feedback has non-audio cue | EV-F | Required |
| P12-AC09 | Representative pickup density remains bounded | EV-E | Required |
| P12-AC10 | Final SHA/CI passes | EV-H | Required |

## P12.20 Negative tests

- double collect;
- stale pickup;
- pickup while destination unavailable;
- pickup projection destroyed before commit;
- save between drop and collect;
- unknown output identity.

## P12.21 Manual acceptance scenario

Break a starter resource.

Watch a physical pickup appear.

Walk away far enough to exercise projection/unload if practical.

Return and collect it.

Save/reload.

Confirm the block remains removed and the pickup does not reappear.

## P12.22 Rule-of-cool target

The classic satisfying:

> **break → pop → pick up**

voxel-game loop finally exists in production.

## P12.23 Exit gate

World resources can move from terrain into authoritative carried state without duplication or loss.

## P12.24 Downstream unlock

P13 inventory.

## P12.25 Known risks / ADR triggers

- pickup persistence policy;
- stack aggregation architecture;
- heavy-physics vs lightweight projection strategy.

---

# P13 — PACK & POCKET

**Classification:** FOUNDATION  
**Arc:** ARC III  
**Player/creator payoff:** The player can actually carry, organise, select and use collected resources.

## P13.1 Purpose

Establish persistent inventory/hotbar state and player-facing transfer interactions.

## P13.2 Authoritative source packet

- PROD-03 InventoryService architecture;
- PROD-05 Identity, Ownership, Transaction, Reservation, Result;
- current Items Registry inventory/stack rules;
- current single-definition rule;
- Document 17 UI/UX inventory/hotbar patterns;
- ART-08 inventory/icon presentation;
- P12 pickup transactions.

## P13.3 Entry gate

- P12 COMPLETE;
- starter content stack/instance semantics resolved.

## P13.4 Dependencies

### Hard

P12.

### Forge

P08/P09 source/capture hooks.

### Runtime

InventoryService or equivalent authoritative store.

### Content

Starter blocks/resources.

## P13.5 Universal primitives used

- Identity;
- Ownership;
- State;
- Capability;
- Transaction;
- Reservation hook;
- Result/Reason.

## P13.6 In scope

- player inventory model;
- slots/containers or selected production representation;
- exact quantity;
- stack compatibility;
- instance state hook;
- hotbar;
- active selection;
- add/remove/transfer transaction;
- split/merge;
- full/blocked reason;
- drop-from-inventory back to world;
- inventory persistence;
- basic sorting if low cost;
- inventory UI;
- icon/thumbnail consumption;
- controller/input-focus architecture compatible with later work.

## P13.7 Explicit non-scope

- backpacks/large storage progression;
- equipment screen;
- settlement storage;
- advanced search/filtering;
- multiplayer trading;
- weight system unless current canon explicitly requires it for starter play;
- quality/rarity full UI.

## P13.8 Implementation capability requirements

Inventory content references canonical definition IDs.

Instance records exist only when per-instance state requires them.

Example:

```text
stone block stack
→ definition + quantity

iron pickaxe later
→ definition + unique/current durability state
```

## P13.9 Forge requirements

P13 consumes icon/capture products.

Final Icon & Capture Forge is later, so early inventory may use governed provisional captures that can be regenerated.

## P13.10 Runtime requirements

UI submits transactions.

UI does not mutate arrays directly.

## P13.11 Canonical content subset

P12 starter resources and P08 blocks.

## P13.12 Persistence implications

Inventory survives full close/reopen.

World pickup + inventory destination must remain transactionally consistent across save.

## P13.13 Multiplayer / authority implications

Inventory service is designed as authority-owned state, even though networking is not implemented.

## P13.14 Simulation-LOD implications

None.

## P13.15 Accessibility / localisation implications

- inventory labels/tooltips scalable;
- selected slot visible without colour-only dependence;
- focus state distinct;
- quantity readable;
- icons paired with text where needed.

## P13.16 Performance implications

Inventory operations should be bounded and event-driven.

Avoid UI rebuilding the entire catalogue every frame.

## P13.17 Security / trust implications

Invalid slot/index/quantity rejected.

## P13.18 Recommended child decomposition

- P13-A — inventory data/state;
- P13-B — transaction API;
- P13-C — hotbar/selection;
- P13-D — UI/view model;
- P13-E — persistence/negative tests;
- P13-F — reconciliation.

## P13.19 Acceptance matrix

| ID | Requirement | Evidence | Gate |
| --- | --- | --- | --- |
| P13-AC01 | Pickup enters inventory with exact canonical identity/quantity | EV-B / EV-C | Required |
| P13-AC02 | Stack merge/split conserves quantity | EV-B negative | Required |
| P13-AC03 | Inventory-full operation fails without loss | EV-B negative | Required |
| P13-AC04 | Drop-from-inventory transfers exact quantity back to world | EV-B / EV-C | Required |
| P13-AC05 | Inventory/hotbar persist after restart | EV-D | Required |
| P13-AC06 | Hotbar selection points to authoritative inventory content | EV-B | Required |
| P13-AC07 | UI cannot create/delete content without transaction | EV-A / test | Required |
| P13-AC08 | Same canonical block identity is preserved across world/inventory/placed representation | EV-B / EV-D | Required |
| P13-AC09 | Basic UI passes ART-08 clarity/focus review | EV-F / EV-G | Required |
| P13-AC10 | Final SHA/CI passes | EV-H | Required |

## P13.20 Negative tests

- split zero/negative quantity;
- merge incompatible instance states;
- move to occupied incompatible slot;
- stale transaction;
- drop more than owned;
- save/reload with partial stacks.

## P13.21 Manual acceptance scenario

Collect several resources.

Open inventory.

Move and split stacks.

Select a block on hotbar.

Drop part of a stack.

Pick it back up.

Save/reload and confirm exact quantities/selection state according to policy.

## P13.22 Rule-of-cool target

Nothing extravagant.

The game should suddenly feel much more like a **real playable sandbox**.

## P13.23 Exit gate

Persistent transactional inventory/hotbar exists.

## P13.24 Downstream unlock

P14 tools and P16 recipes.

## P13.25 Known risks / ADR triggers

- inventory representation if it affects save/network semantics;
- per-instance item state design.

---

# P14 — TOOLS OF THE FIRST AGE

**Classification:** FORGE-FIRST  
**Arc:** ARC III  
**Player/creator payoff:** The player can create and use actual tools rather than breaking everything bare-handed.

## P14.1 Purpose

Create Item & Tool Forge v1 plus the runtime tool-capability foundation.

## P14.2 Authoritative source packet

- PROD-04 Forge shared-service architecture;
- PROD-05 Capability/Identity/State;
- current Items Registry;
- Resource Progression tool ladder;
- Player Progression tool direction;
- ART-04 item/tool modelling;
- ART-08 inventory icon rules;
- ART-09 production execution;
- P08/P09 Forge source services;
- P13 inventory.

## P14.3 Entry gate

- P13 COMPLETE;
- P08/P09 Forge authoring services available;
- current starter-tool identities resolved.

## P14.4 Dependencies

### Hard

P13.

### Forge

P06–P10.

### Runtime

inventory; interaction; authoritative edit.

### Content

Starter tool family.

## P14.5 Universal primitives used

- Identity;
- State;
- Capability;
- Ownership;
- Transaction;
- Connection/Socket;
- Provenance.

## P14.6 In scope

Item & Tool Forge v1:

- item identity/source;
- carried/held representation;
- inventory representation/capture hook;
- tool capability profile;
- compatible target tags/capabilities;
- efficiency/mining-speed fields;
- durability/condition state;
- repair hook;
- use/impact anchors;
- first-person grip/pivot;
- drop projection;
- validation;
- bake/register;
- runtime held-tool state.

Starter runtime capabilities:

- hand/basic gathering;
- one crude/stone tool family;
- one improved early tool if current progression needs it;
- tool wear;
- tool-required or tool-efficient resource gates.

## P14.7 Explicit non-scope

- full weapons;
- armour;
- equipment screen;
- enchantments;
- quality/rarity economy;
- complex repair stations;
- animation Forge-powered final tool animations before P18;
- final tool catalogue.

## P14.8 Implementation capability requirements

The runtime should ask:

```text
Does active tool have capability required by target?
What efficiency/tier applies?
What durability cost applies?
```

Avoid hard-coded:

```text
if item == iron_pickaxe
```

where capability data can express the rule.

## P14.9 Forge requirements

Guided Item/Tool flow:

```text
Identity
→ purpose/category
→ form
→ material
→ held/drop/icon projections
→ capabilities
→ durability/state
→ sockets/anchors
→ validate
→ Test Lab
→ bake/register
```

## P14.10 Runtime requirements

Tool use submits/augments existing authoritative world action.

The tool does not directly mutate voxels.

## P14.11 Canonical content subset

Enough to establish a readable early ladder, such as:

- crude/primitive gathering tool;
- stone pickaxe;
- stone axe;
- optional early copper equivalent only if needed for P17 progression.

Exact list follows current canon.

## P14.12 Persistence implications

Tool durability/instance state persists.

## P14.13 Multiplayer / authority implications

Tool capability/durability must be authoritative later.

No local-only durability mutation.

## P14.14 Simulation-LOD implications

None.

## P14.15 Accessibility / localisation implications

Tool state/durability visible through more than colour.

## P14.16 Performance implications

Held/drop models should use appropriate complexity.

## P14.17 Security / trust implications

Forged/invalid capability data blocked by registry/Forge validation.

## P14.18 Recommended child decomposition

- P14-A — item/tool source schema;
- P14-B — held/drop/icon projection;
- P14-C — capability/durability runtime;
- P14-D — starter tool family;
- P14-E — Test Lab/ART review;
- P14-F — reconciliation.

## P14.19 Acceptance matrix

| ID | Requirement | Evidence | Gate |
| --- | --- | --- | --- |
| P14-AC01 | Tool can be authored through Forge and registered | EV-B / EV-C | Required |
| P14-AC02 | Tool capability controls appropriate interaction | EV-B | Required |
| P14-AC03 | Unsupported tool/target combination returns explicit result | EV-B negative | Required |
| P14-AC04 | Durability changes only on committed authorised use | EV-B | Required |
| P14-AC05 | Tool instance durability persists | EV-D | Required |
| P14-AC06 | Held/drop/inventory projections preserve one canonical item identity | EV-B | Required |
| P14-AC07 | Starter tool passes ART-04 silhouette/grip review | EV-F / EV-G | Required |
| P14-AC08 | Inventory icon/capture is readable at intended size | EV-F | Required |
| P14-AC09 | No hard-coded per-tool mining special case is needed for normal capability path | EV-A / review | Required |
| P14-AC10 | Final SHA/CI passes | EV-H | Required |

## P14.20 Negative tests

- zero durability;
- wrong tool category;
- missing capability;
- invalid target;
- source with missing held pivot;
- source with no canonical registration.

## P14.21 Manual acceptance scenario

Craft/debug-grant starter tool.

Equip from hotbar.

Mine/chop valid target and compare to bare hand/invalid tool.

Observe durability.

Save/reload.

## P14.22 Rule-of-cool target

The first satisfying **proper tool swing into the voxel world**, even if final animation arrives P18.

## P14.23 Exit gate

Forge-authored tools can modify action capability/efficiency and persist state.

## P14.24 Downstream unlock

P15/P16/P17.

## P14.25 Known risks / ADR triggers

- item-instance representation;
- durability/state packing;
- first-person held-item architecture if it affects later animation.

---

# P15 — SPARK & TIMBER

**Classification:** COOL-PULL  
**Arc:** ARC III  
**Player/creator payoff:** The player can establish the first tiny foothold in a dangerous world: fire, food/recovery and shelter.

## P15.1 Purpose

Create a deliberately bounded early survival loop that gives resource gathering a reason to matter.

## P15.2 Authoritative source packet

- Master Game Design Bible survival direction;
- Core Gameplay Loop;
- Player Progression early survival direction;
- Resource Progression survival supplies;
- Blocks/Items canon for fire/shelter/food subset;
- ART-06 fire/lighting rules where applicable;
- ART-07 survival ambience/audio direction;
- Document 17 HUD/accessibility principles.

## P15.3 Entry gate

- P13 inventory;
- P14 basic tools;
- P12 resource acquisition.

## P15.4 Dependencies

### Hard

P12–P14.

### Forge

P08/P09/P14.

### Runtime

player state + basic environment/time hook as required.

### Content

campfire/shelter/basic food or recovery resources.

## P15.5 Universal primitives used

- Identity;
- State;
- Capability;
- Transaction;
- Result/Reason.

## P15.6 In scope

A minimal survival state may include:

- health/damage foundation;
- basic food/recovery or hunger hook according to current canon/configuration;
- temperature/exposure hook only to the depth needed for campfire/shelter proof;
- campfire functional state;
- fuel consumption foundation if required;
- basic shelter recognition or sheltered-state test;
- simple rest/recovery hook if current canon requires;
- minimal HUD/readout;
- world setting/config hook to allow survival severity to scale later.

P15 should prove **meaningful survival**, not implement every need.

## P15.7 Explicit non-scope

- full seven settlement pillars;
- disease;
- complex nutrition;
- medical system;
- full weather;
- seasons;
- full temperature simulation;
- advanced cooking;
- NPC needs;
- final death/tombstone system unless required by current early canon;
- hardcore modes.

## P15.8 Implementation capability requirements

Campfire state is authoritative:

- fuel;
- lit/unlit;
- heat/recovery contribution.

Presentation can initially be simple and is upgraded in P18–P24.

## P15.9 Forge requirements

Use registered blocks/items.

No bespoke one-off campfire scene identity outside registry.

## P15.10 Runtime requirements

Basic player state/need service may be introduced, but it must remain extensible for later settings and settlement-facing systems.

## P15.11 Canonical content subset

Recommended minimal:

- campfire;
- fuel;
- basic food/recovery resource;
- simple shelter blocks.

## P15.12 Persistence implications

Campfire/fuel/player survival state persists where current save policy requires.

## P15.13 Multiplayer / authority implications

Player survival state ownership should be authority-compatible.

## P15.14 Simulation-LOD implications

No distant survival simulation.

## P15.15 Accessibility / localisation implications

Critical low-health/cold/hunger state cannot rely solely on colour/audio.

## P15.16 Performance implications

No heavy per-block thermal simulation.

Use bounded semantic exposure/heat logic.

## P15.17 Security / trust implications

None.

## P15.18 Recommended child decomposition

- P15-A — player survival state foundation;
- P15-B — campfire/fuel function;
- P15-C — shelter/exposure proof;
- P15-D — basic food/recovery;
- P15-E — HUD/accessibility;
- P15-F — reconciliation.

## P15.19 Acceptance matrix

| ID | Requirement | Evidence | Gate |
| --- | --- | --- | --- |
| P15-AC01 | Player can experience a meaningful bounded survival consequence | EV-C | Required |
| P15-AC02 | Campfire consumes real authorised fuel where fuel is used | EV-B / EV-C | Required |
| P15-AC03 | Campfire functional state persists | EV-D | Required |
| P15-AC04 | Shelter recognition is based on gameplay state, not visual guess | EV-B | Required |
| P15-AC05 | Basic food/recovery consumes exact inventory resource | EV-B | Required |
| P15-AC06 | Survival severity can be represented as future world-setting/config input | EV-A / test | Required |
| P15-AC07 | Critical state has accessible non-colour cue | EV-F | Required |
| P15-AC08 | No unbounded thermal/weather simulation introduced | EV-E / review | Required |
| P15-AC09 | Final SHA/CI passes | EV-H | Required |

## P15.20 Negative tests

- campfire without fuel;
- consume missing food;
- invalid shelter condition;
- restart during lit campfire;
- survival disabled/reduced setting path if implemented.

## P15.21 Manual acceptance scenario

Gather fuel/resources.

Create/use a campfire.

Establish a small shelter.

Experience recovery/protection difference.

Leave/reload and verify persistent state.

## P15.22 Rule-of-cool target

First cosy moment:

> **night outside, little fire inside, and the world suddenly feels like somewhere worth surviving.**

## P15.23 Exit gate

Starter survival has enough meaning to support crafting progression without becoming a simulation rabbit hole.

## P15.24 Downstream unlock

P16.

## P15.25 Known risks / ADR triggers

- survival-stat ownership if current canon conflicts;
- shelter detection if implementation requires more architecture than planned.

---

# P16 — CRAFT OF HAND

**Classification:** FORGE-FIRST  
**Arc:** ARC III  
**Player/creator payoff:** The player can transform collected resources into useful things through real recipes.

## P16.1 Purpose

Create the canonical recipe/process model, Recipe Forge v1 and hand/workbench crafting runtime.

## P16.2 Authoritative source packet

- current Crafting & Recipe Registry;
- Resource Progression;
- Items/Blocks registries;
- Player Progression unlock direction;
- PROD-05 Transaction/Capability/Knowledge hooks;
- PROD-04 Forge orchestration;
- Document 17 crafting UI;
- ART-08 recipe/crafting presentation.

## P16.3 Entry gate

- P13 inventory COMPLETE;
- P14 item/tool source path available;
- starter recipe identities/content resolved.

## P16.4 Dependencies

### Hard

P13–P14.

### Forge

Forge Core + Item/Block/Material services.

### Runtime

Inventory transactions.

### Content

Small starter recipe set.

## P16.5 Universal primitives used

- Identity;
- Capability;
- Transaction;
- Knowledge/unlock hook;
- State;
- Result/Reason;
- Provenance.

## P16.6 In scope

Unified recipe/process definition capable of later extension:

- recipe identity;
- category;
- station requirement;
- inputs;
- quantities;
- accepted substitutions/tag groups where current canon uses them;
- outputs;
- by-products hook;
- time;
- fuel/power/mana hooks;
- unlock/knowledge hook;
- batch hook;
- failure hook reserved;
- automation compatibility hook;
- validation;
- Recipe Forge v1;
- hand crafting;
- workbench crafting;
- transactional consume/output;
- crafting UI;
- recipe search/filter minimal;
- recipe persistence/knowledge state foundation.

## P16.7 Explicit non-scope

- machine automation runtime;
- full alchemy;
- rituals;
- magical crafting runtime;
- NPC crafting;
- research system;
- full recipe book progression;
- mass final recipe catalogue.

## P16.8 Implementation capability requirements

The same conceptual recipe/process definition should be capable of later use by:

- player;
- NPC;
- workstation;
- machine;
- project;

with domain-specific execution rules.

Avoid building separate “player recipe” and later “machine recipe” formats unless semantics genuinely differ.

## P16.9 Forge requirements

Recipe Forge guided flow:

```text
Identity
→ category/process
→ required station/capabilities
→ inputs
→ outputs/by-products
→ time
→ optional fuel/power/unlock
→ compatibility
→ validation
→ test
```

## P16.10 Runtime requirements

Crafting is an authoritative transaction:

```text
validate recipe
→ validate station/unlock
→ reserve inputs
→ commit consumption/transformation
→ commit outputs
→ emit result
```

## P16.11 Canonical content subset

Starter recipes sufficient for:

- basic tools;
- workbench;
- camp/shelter pieces;
- furnace components for P17.

## P16.12 Persistence implications

Known/unlocked recipes persist if current progression uses knowledge state at this stage.

Active timed workstation process may be deferred to P17.

## P16.13 Multiplayer / authority implications

Recipe execution path must be compatible with future authoritative server handling.

## P16.14 Simulation-LOD implications

None for hand crafting.

## P16.15 Accessibility / localisation implications

Crafting UI:

- shows missing ingredient reason;
- does not rely on red/green only;
- supports scalable text/focus;
- distinguishes known/locked/unavailable.

## P16.16 Performance implications

Recipe lookup/search should scale to later larger registry.

## P16.17 Security / trust implications

Recipe output/inputs must come from validated registered definitions.

## P16.18 Recommended child decomposition

- P16-A — recipe/process schema;
- P16-B — Recipe Forge;
- P16-C — hand/workbench runtime;
- P16-D — crafting UI/knowledge hook;
- P16-E — transaction/negative tests;
- P16-F — reconciliation.

## P16.19 Acceptance matrix

| ID | Requirement | Evidence | Gate |
| --- | --- | --- | --- |
| P16-AC01 | Recipe can be authored/validated through Forge | EV-B / EV-C | Required |
| P16-AC02 | Craft consumes exact registered inputs | EV-B | Required |
| P16-AC03 | Craft produces exact registered outputs | EV-B | Required |
| P16-AC04 | Failed craft leaves inputs unchanged | EV-B negative | Required |
| P16-AC05 | Batch craft conserves quantities where enabled | EV-B | Required |
| P16-AC06 | Station requirement is capability/identity validated | EV-B | Required |
| P16-AC07 | Recipe source has future hooks without implementing later automation/magic | EV-A / review | Required |
| P16-AC08 | Crafting UI reports real authoritative failure reason | EV-C / EV-F | Required |
| P16-AC09 | Recipe registry survives save/reload/known-state path as applicable | EV-D | Required |
| P16-AC10 | Final SHA/CI passes | EV-H | Required |

## P16.20 Negative tests

- missing ingredient;
- wrong station;
- stale inventory revision;
- full output destination;
- invalid recipe identity;
- recipe references missing content;
- retry of same committed command.

## P16.21 Manual acceptance scenario

Gather starter resources.

Open hand/workbench crafting.

Craft a tool/component.

Observe exact resource removal/output addition.

Attempt an invalid recipe and inspect real reason.

## P16.22 Rule-of-cool target

The player's first genuine:

> **“I gathered this, and now I made something useful from it.”**

## P16.23 Exit gate

Recipe Forge + transactional starter crafting function.

## P16.24 Downstream unlock

P17 Fire and Iron.

## P16.25 Known risks / ADR triggers

- recipe schema if it would split later player/NPC/machine recipes unnecessarily;
- unlock/progression authoring ownership if dedicated Progression Forge becomes required.

---

# P17 — FIRE AND IRON

**Classification:** INTEGRATION  
**Arc:** ARC III  
**Player/creator payoff:** Raw ore and fuel become refined metal through an actual workstation process.

## P17.1 Purpose

Integrate gathering, inventory, tools, survival resources and recipes into the first timed processing workstation.

This is the Arc III certification slice.

## P17.2 Authoritative source packet

- Crafting/Recipe Registry furnace chains;
- Resource Progression stone/furnace/copper/iron chains;
- Blocks/Items furnace/fuel/resource entries;
- PROD-05 Transaction/State/Capability;
- P12–P16 implementation contracts;
- ART-04 workstation modelling;
- ART-06/07 hooks reserved for later presentation upgrades.

## P17.3 Entry gate

- P12–P16 COMPLETE;
- starter furnace recipe/content resolved.

## P17.4 Dependencies

### Hard

P12–P16.

### Forge

Block/Material/Item/Recipe Forge.

### Runtime

Inventory; timed process/workstation state.

### Content

Furnace + fuel + ore + ingot/refined output.

## P17.5 Universal primitives used

- Identity;
- State;
- Capability;
- Transaction;
- Ownership;
- Result/Reason;
- Connection hooks.

## P17.6 In scope

- functional furnace/workstation definition;
- input/fuel/output buffers;
- fuel consumption;
- timed process;
- recipe selection;
- process state;
- blocked-output state;
- pause/recovery policy;
- save/load active process;
- output collection;
- first raw ore → ingot/refined material chain;
- basic furnace UI;
- integration scenario.

## P17.7 Explicit non-scope

- automated furnace;
- Flux/mana furnace;
- machine ports;
- conveyor input;
- NPC operation;
- advanced metallurgy;
- steel;
- final furnace animation/VFX/audio.

Those presentation features begin P18–P24.

## P17.8 Implementation capability requirements

Furnace gameplay truth must exist independently of visuals.

States might include:

- idle;
- ready;
- active;
- no fuel;
- invalid input;
- output blocked;
- complete/cooling as required.

Presentation can later bind to these states.

## P17.9 Forge requirements

Use existing Block/Item/Recipe source.

No separate furnace recipe format.

## P17.10 Runtime requirements

Timed process must preserve transactional conservation.

Output is created by recipe process commit, not animation callback.

## P17.11 Canonical content subset

One complete metal process chain, preferably aligned to current early progression:

- fuel;
- raw ore;
- furnace;
- refined ingot/material.

Copper or iron choice follows current authoritative progression.

## P17.12 Persistence implications

Active process state survives save/reload with bounded catch-up policy.

Do not replay elapsed real-world time unless world-time design says so.

## P17.13 Multiplayer / authority implications

Workstation ownership/permission hooks reserved.

## P17.14 Simulation-LOD implications

Nearby process exact.

Far/distant workstation summary comes later.

## P17.15 Accessibility / localisation implications

Furnace UI clearly communicates:

- input;
- fuel;
- progress;
- output;
- blocked reason.

Not colour-only.

## P17.16 Performance implications

Timed workstation processing must be event/schedule-driven, not one heavy per-frame script per future furnace.

## P17.17 Security / trust implications

Save/reload/retry cannot duplicate output.

## P17.18 Recommended child decomposition

- P17-A — workstation/process state;
- P17-B — fuel/input/output transaction;
- P17-C — save/reload active processing;
- P17-D — furnace UI;
- P17-E — end-to-end Arc III scenario;
- P17-F — PG-03 reconciliation.

## P17.19 Acceptance matrix

| ID | Requirement | Evidence | Gate |
| --- | --- | --- | --- |
| P17-AC01 | Furnace accepts valid registered recipe/input/fuel | EV-B / EV-C | Required |
| P17-AC02 | Fuel and input quantities are conserved/consumed correctly | EV-B | Required |
| P17-AC03 | Process creates correct output exactly once | EV-B negative/retry | Required |
| P17-AC04 | Output-full/blocked state is authoritative and recoverable | EV-B / EV-C | Required |
| P17-AC05 | Active process survives save/reload correctly | EV-D | Required |
| P17-AC06 | UI reflects real process state and reasons | EV-C / EV-F | Required |
| P17-AC07 | Processing implementation is suitable for later presentation binding | EV-A / review | Required |
| P17-AC08 | Multiple idle/active furnaces remain within provisional runtime budget | EV-E | Required |
| P17-AC09 | End-to-end gather→craft→smelt scenario passes | EV-C | Required |
| P17-AC10 | Final SHA/CI passes | EV-H | Required |

## P17.20 Negative tests

- remove fuel mid-process;
- output fills;
- reload during process;
- invalid recipe;
- repeated completion/reconnect-style replay;
- break furnace while active according to current bounded policy.

## P17.21 Manual acceptance scenario

Gather wood/stone/ore.

Craft tool/workbench/furnace components.

Build furnace.

Load ore and fuel.

Wait through actual process.

Collect refined material.

Save/reload during another batch and verify correct continuation.

## P17.22 Rule-of-cool target

The first little industrial moment:

> **cold ore goes in, usable metal comes out, and you know exactly where every piece came from.**

## P17.23 Exit gate — PG-03 SURVIVAL / CRAFT FOUNDATION

PG-03 passes when:

- P12–P17 COMPLETE;
- gather→pickup→inventory→tool→craft→process chain works;
- resources remain conserved/persistent;
- starter survival gives the loop meaning.

## P17.24 Downstream unlock

ARC IV presentation stack.

Also provides the perfect first stateful functional asset for animation/VFX/audio testing.

## P17.25 Known risks / ADR triggers

- timed-process scheduler architecture;
- active-process save/catch-up semantics;
- workstation buffer abstraction.

---

# 04. ARC IV — SHAPE, MOTION & SONG

ARC IV establishes the presentation authoring/runtime stack using P17's furnace and other simple fixtures as truth-bearing test assets.

The key rule for every P18–P24 task is:

> **Presentation may observe, interpolate, layer and communicate gameplay state. It may never become the only owner of gameplay state.**

---

# P18 — THE MOVING FORGE

**Classification:** FORGE-FIRST  
**Arc:** ARC IV — SHAPE, MOTION & SONG  
**Player/creator payoff:** Forge-authored objects begin to move with purpose rather than switching between static scenes.

## P18.1 Purpose

Establish Animation Forge v1 and runtime animation/state-binding architecture for rigid/compound objects first.

## P18.2 Authoritative source packet

- PROD-04 shared Animation Forge architecture;
- PROD-05 State/Signal/Connection/Result;
- Set 21C animation/effects/runtime-state system;
- ART-04 model pivots/parts;
- ART-05 motion handoff where applicable;
- ART-09 execution;
- ART-10 motion certification;
- P17 furnace states.

## P18.3 Entry gate

- P17 COMPLETE;
- P06/P10 Forge/Test Lab available;
- at least one named-part/pivot asset available.

## P18.4 Dependencies

### Hard

P17; P06–P10.

### Forge

shared source/bake/Test Lab.

### Runtime

authoritative state/event source.

### Content

Representative:

- furnace;
- gear;
- door or simple interactive object.

## P18.5 Universal primitives used

- Identity;
- State;
- Signal/Event distinction;
- Connection/Socket;
- Provenance;
- Result/Reason.

## P18.6 In scope

Animation Forge v1:

- named-part transform animation;
- keyframes;
- timeline tracks;
- interpolation;
- loops;
- playback speed;
- semantic event markers;
- visibility/state track where safe;
- material-parameter animation hook;
- voxel-frame/prebaked animation hook;
- state binding;
- transition/interrupt;
- preview/scrub;
- bake/cache;
- runtime playback;
- LOD/reduced-motion hook.

Initial focus is rigid/compound props and workstations.

## P18.7 Explicit non-scope

- full skeletal character animation;
- IK;
- facial animation;
- cinematic sequencer;
- physics cloth/rope;
- public animation scripting;
- final creature locomotion.

Those arrive with entity/rig Arcs.

## P18.8 Implementation capability requirements

Animation source does not call gameplay mutations.

Example:

```text
furnace.state == ACTIVE
→ play active_loop
```

Wrong:

```text
animation reaches frame 20
→ create ingot
```

Semantic animation markers may emit **presentation timing events** or request approved gameplay hooks where the gameplay system explicitly owns the consequence.

## P18.9 Forge requirements

Local guided flow:

```text
Source/parts
→ pivots
→ clip
→ tracks
→ events
→ state binding
→ transition
→ preview
→ validate
→ runtime test
```

## P18.10 Runtime requirements

State binding reads domain state.

Reconnect/reload should reconstruct current visual state rather than replay obsolete one-shot events.

## P18.11 Canonical content subset

- rotating gear;
- simple door/lever or moving prop;
- furnace ignition/active/cooling movement if geometry supports it.

## P18.12 Persistence implications

Animation progress is persistent only where gameplay contract requires.

Most presentation reconstructs from state/time.

## P18.13 Multiplayer / authority implications

Presentation can reconstruct from replicated authoritative state later.

## P18.14 Simulation-LOD implications

Animation may stop/simplify at distance while authoritative process continues.

## P18.15 Accessibility / localisation implications

Reduced-motion variant required where motion carries critical information.

## P18.16 Performance implications

- no per-frame runtime remeshing for ordinary transform animation;
- voxel-frame animation uses prebaked products;
- animation LOD.

## P18.17 Security / trust implications

Animation events cannot execute arbitrary scripts in player content.

## P18.18 Recommended child decomposition

- P18-A — clip/timeline schema;
- P18-B — Animation Forge UI;
- P18-C — state binding/runtime playback;
- P18-D — markers/transitions;
- P18-E — LOD/accessibility/bake;
- P18-F — fixtures/reconciliation.

## P18.19 Acceptance matrix

| ID | Requirement | Evidence | Gate |
| --- | --- | --- | --- |
| P18-AC01 | Named part can animate around Forge-authored pivot | EV-C | Required |
| P18-AC02 | Animation clip is editable source and baked runtime product | EV-B | Required |
| P18-AC03 | Gameplay state drives clip selection/read-only binding | EV-B | Required |
| P18-AC04 | Animation cannot create furnace output or own processing state | EV-B negative/review | Required |
| P18-AC05 | Reload/reconnect-style state reconstruction selects correct current presentation | EV-B / EV-D | Required |
| P18-AC06 | Reduced-motion/LOD path preserves required state readability | EV-F / EV-E | Required |
| P18-AC07 | Stale source invalidates bake | EV-B | Required |
| P18-AC08 | Representative fixture passes ART motion review | EV-F / EV-G | Required |
| P18-AC09 | Final SHA/CI passes | EV-H | Required |

## P18.20 Negative tests

- missing pivot;
- missing named part;
- invalid state binding;
- state changes mid-transition;
- stale bake;
- disabled/reduced-motion profile.

## P18.21 Manual acceptance scenario

Open furnace/gear in Forge.

Create/edit clip.

Preview.

Bind to real P17 state.

Run furnace.

Observe animation follow authoritative state.

Block output and confirm presentation changes without owning blockage.

## P18.22 Rule-of-cool target

The first machine/workstation that visibly feels **alive**.

## P18.23 Exit gate

Reusable Animation Forge/runtime foundation exists.

## P18.24 Downstream unlock

P19–P24 and later Rig/Creature work.

## P18.25 Known risks / ADR triggers

- animation source format;
- Godot AnimationPlayer/AnimationTree integration if architecture-changing;
- voxel-frame bake strategy.

---

# P19 — FIREFLIES & THUNDER

**Classification:** FORGE-FIRST  
**Arc:** ARC IV  
**Player/creator payoff:** Impacts, fire, smoke, sparks and subtle magical hints give actions physical consequence.

## P19.1 Purpose

Establish VFX Forge v1 and semantic effect/event binding.

## P19.2 Authoritative source packet

- PROD-04 VFX shared service;
- PROD-05 State/Signal/Event;
- Set 21C particles/effect sockets/state layers;
- ART-06 locked VFX law;
- ART-04 sockets;
- ART-09/10;
- P18 event/state-binding infrastructure.

## P19.3 Entry gate

- P18 COMPLETE or stable shared event/socket interfaces available.

## P19.4 Dependencies

### Hard

P18.

### Forge

Forge Core/Test Lab.

### Runtime

semantic events/state.

### Content

furnace/campfire/block-impact fixtures.

## P19.5 Universal primitives used

- Identity;
- State;
- Signal/Event;
- Connection/Socket;
- Provenance;
- Result/Reason.

## P19.6 In scope

- reusable VFX source/profile;
- effect sockets/anchors;
- one-shot effects;
- looping/state effects;
- timing;
- spawn direction/shape;
- stylised voxel-compatible particles;
- material-linked effect hook;
- pooling/culling;
- deterministic cosmetic variation hook;
- reduced-flash;
- reduced-motion;
- low-effects;
- LOD;
- bake/runtime profile;
- state/event binding.

## P19.7 Explicit non-scope

- final weather system;
- final spell VFX;
- portals;
- boss telegraphs;
- realm atmospheres;
- unrestricted shader scripting.

## P19.8 Implementation capability requirements

VFX reveals causes.

Example:

- block impact event → chips/dust based on Material DNA;
- furnace ACTIVE → flame/smoke loop;
- furnace fault later → sparks if state says so.

No particle owns damage, heat or process completion.

## P19.9 Forge requirements

Guided VFX flow:

```text
Identity
→ event/state source
→ anchor/socket
→ shape/motion
→ material/context
→ timing
→ full/reduced/low profile
→ validate
→ Test Lab
→ bake
```

## P19.10 Runtime requirements

Effects are pooled/culled.

Critical effect events may aggregate under high density.

## P19.11 Canonical content subset

- material impact dust/chips;
- campfire/furnace flame/smoke;
- small spark/ember effect;
- optional restrained Flux crystal motes if canon permits.

## P19.12 Persistence implications

Transient effects generally not saved.

Persistent state reconstructs loop effects after load.

## P19.13 Multiplayer / authority implications

One-shot effects derive from authoritative replicated events later.

## P19.14 Simulation-LOD implications

Presentation LOD may reduce/omit ambience but not critical cues.

## P19.15 Accessibility / localisation implications

Critical effects survive:

- reduced flash;
- reduced motion;
- low effects;
- colour-independent conditions.

## P19.16 Performance implications

Pool/cull/aggregate.

Measure high-rate impact and multiple fire emitters.

## P19.17 Security / trust implications

VFX profile cannot call arbitrary gameplay code.

## P19.18 Recommended child decomposition

- P19-A — VFX source/profile;
- P19-B — socket/event binding;
- P19-C — pooling/runtime;
- P19-D — accessibility/LOD;
- P19-E — material response fixtures;
- P19-F — reconciliation.

## P19.19 Acceptance matrix

| ID | Requirement | Evidence | Gate |
| --- | --- | --- | --- |
| P19-AC01 | Effect can be authored/baked through Forge | EV-B / EV-C | Required |
| P19-AC02 | One-shot effect binds to semantic event, not direct hidden logic | EV-B | Required |
| P19-AC03 | Loop effect reconstructs from current authoritative state | EV-B / EV-D | Required |
| P19-AC04 | Reduced-flash/motion/low profile retains critical meaning | EV-F | Required |
| P19-AC05 | High-rate effects pool/cull/aggregate within provisional budget | EV-E | Required |
| P19-AC06 | Material response family can vary by Material DNA reference | EV-B / EV-C | Required |
| P19-AC07 | VFX cannot mutate gameplay state | EV-B negative/review | Required |
| P19-AC08 | Fixture passes ART-06 review | EV-F / EV-G | Required |
| P19-AC09 | Final SHA/CI passes | EV-H | Required |

## P19.20 Negative tests

- missing socket;
- missing event type;
- low-effects mode;
- rapid event spam;
- stale effect source;
- reload while state-loop active.

## P19.21 Manual acceptance scenario

Mine stone/wood, light campfire/furnace, inspect full and low-effects modes, block/stop furnace and confirm effects follow state correctly.

## P19.22 Rule-of-cool target

Mining, fire and work should finally have **physical punch** without becoming particle soup.

## P19.23 Exit gate

Shared VFX authoring/runtime exists.

## P19.24 Downstream unlock

P20 and broader P24 integration.

## P19.25 Known risks / ADR triggers

- effect-pool architecture;
- GPU vs CPU particle strategy if provider choice changes contracts.

---

# P20 — LIGHT OF THE FORGE

**Classification:** FORGE-FIRST  
**Arc:** ARC IV  
**Player/creator payoff:** Fire, crystals and functional objects can illuminate the world in ways that communicate state and atmosphere.

## P20.1 Purpose

Establish Lighting Forge/profile authoring and runtime light/emission binding.

## P20.2 Authoritative source packet

- ART-06 lighting law;
- ART-02 material emission;
- Set 21C light/emission/state responses;
- PROD-04 lighting shared service;
- P09 Material Forge;
- P18/P19 state/event binding.

## P20.3 Entry gate

- P09 Material Forge;
- P18 state binding;
- P19 effect/socket infrastructure where shared.

## P20.4 Dependencies

### Hard

P09, P18–P19.

### Forge

Forge Core/Test Lab.

### Runtime

presentation-state source.

## P20.5 Universal primitives used

- Identity;
- State;
- Connection/Socket;
- Result/Reason;
- Provenance.

## P20.6 In scope

- light profile source;
- emission profile;
- socket/anchor;
- state binding;
- intensity/range/falloff controls within ART limits;
- flicker/pulse profile;
- low-end fallback;
- bloom-off readability;
- critical vs decorative classification;
- pooled/limited dynamic-light strategy;
- Test Lab lighting contexts.

## P20.7 Explicit non-scope

- final global illumination architecture;
- weather/day-night complete system;
- realm-specific complete lighting libraries;
- dynamic light per glowing voxel.

## P20.8 Implementation capability requirements

Emission and actual illumination are separate.

Many glowing blocks may use emissive/material cues while bounded light sources provide practical illumination.

## P20.9 Forge requirements

Lighting profile can be reused by multiple content sources.

## P20.10 Runtime requirements

Active light follows authoritative object state.

## P20.11 Canonical content subset

- campfire/furnace;
- Flux crystal;
- optional torch/lantern if early content includes one.

## P20.12 Persistence implications

Light projection reconstructed from saved gameplay state.

## P20.13 Multiplayer / authority implications

No separate network light state when it can derive from replicated object state.

## P20.14 Simulation-LOD implications

Distant lights simplify according to profile while preserving important navigation/state cues.

## P20.15 Accessibility / localisation implications

State should remain readable with bloom disabled/reduced.

## P20.16 Performance implications

Explicit dynamic-light budgets.

No one-light-per-crystal-block architecture.

## P20.17 Security / trust implications

None.

## P20.18 Recommended child decomposition

- P20-A — lighting profile schema/Forge;
- P20-B — emission/light binding;
- P20-C — low-end/LOD;
- P20-D — fixture review;
- P20-E — performance proof;
- P20-F — reconciliation.

## P20.19 Acceptance matrix

| ID | Requirement | Evidence | Gate |
| --- | --- | --- | --- |
| P20-AC01 | Reusable lighting profile can be authored in Forge | EV-B / EV-C | Required |
| P20-AC02 | Light/emission follows real object state | EV-B / EV-C | Required |
| P20-AC03 | Bloom-off/low profile preserves critical state readability | EV-F | Required |
| P20-AC04 | Repeated emitters remain within provisional budget | EV-E | Required |
| P20-AC05 | No default per-block dynamic-light explosion | EV-A / EV-E | Required |
| P20-AC06 | Flux crystal remains recognisable without relying only on emitted light | EV-F / EV-G | Required |
| P20-AC07 | Fixture passes ART-06 lighting review | EV-F / EV-G | Required |
| P20-AC08 | Final SHA/CI passes | EV-H | Required |

## P20.20 Negative tests

- light profile missing anchor;
- active state ends;
- bloom disabled;
- low-end profile;
- large cluster of emissive crystal blocks.

## P20.21 Manual acceptance scenario

Inspect campfire/furnace and crystal:

- active/inactive;
- close/far;
- normal/low;
- bloom on/off.

## P20.22 Rule-of-cool target

The first cave/fire scene that actually looks like **Leyforge**, not a dev room.

## P20.23 Exit gate

Reusable state-bound lighting/emission authoring exists.

## P20.24 Downstream unlock

P21/P24.

## P20.25 Known risks / ADR triggers

- light pooling/cluster strategy if engine limitations require custom approach.

---

# P21 — ECHOES IN STONE

**Classification:** FORGE-FIRST  
**Arc:** ARC IV  
**Player/creator payoff:** The world begins sounding materially different depending on what the player touches, breaks, walks on and uses.

## P21.1 Purpose

Establish Sound Forge v1, semantic audio events and Material DNA response families.

## P21.2 Authoritative source packet

- ART-07 locked sonic identity;
- Set 21C audio cues/sockets;
- PROD-04 Sound Forge shared service;
- PROD-05 Signal/Event/State;
- ART-02 Material DNA;
- ART-04 sound/impact anchors;
- P09 materials;
- P18 event markers.

## P21.3 Entry gate

- P09;
- P18 stable event markers/state binding;
- P12/P14/P17 provide meaningful events.

## P21.4 Dependencies

### Hard

P09, P18.

### Forge

Forge Core/Test Lab.

### Runtime

semantic audio event resolver.

## P21.5 Universal primitives used

- Identity;
- State;
- Signal/Event;
- Connection/Socket;
- Capability;
- Provenance;
- Result/Reason.

## P21.6 In scope

Sound Forge v1:

- sound source/cue;
- one-shot/loop/state-driven;
- semantic event mapping;
- stable sound socket;
- material response family;
- variation set;
- deterministic/non-repeating selection policy where needed;
- spatial parameters;
- distance LOD;
- priority;
- cooldown/aggregation;
- category/bus;
- caption/equivalent hook;
- bake/runtime product;
- Test Lab.

Starter events:

- footsteps;
- block impact/break/place;
- tool strike;
- pickup;
- campfire/furnace loop;
- UI confirmation/error minimal.

## P21.7 Explicit non-scope

- character voices;
- creature calls;
- final combat soundscape;
- weather;
- ocean/vessels;
- realms;
- final large-factory aggregation;
- final dialogue voice system.

## P21.8 Implementation capability requirements

Semantic footstep example:

```text
foot_contact.left
+ footwear/body context
+ Material DNA underfoot
+ intensity/environment
→ resolved sound family
```

Character/tool source does not hard-code `stone_step_03.wav`.

## P21.9 Forge requirements

Sound authoring references semantic events and material families.

## P21.10 Runtime requirements

Audio is presentation.

A sound ending does not end gameplay state.

## P21.11 Canonical content subset

Representative:

- stone;
- wood;
- soil/grass;
- metal;
- crystal if useful.

## P21.12 Persistence implications

Loops reconstruct from saved state.

One-shots do not replay after load unless gameplay event genuinely reoccurs.

## P21.13 Multiplayer / authority implications

Future replicated events can produce local audio presentation without audio itself being network authority.

## P21.14 Simulation-LOD implications

Near/mid/far audio LOD and virtualisation hooks.

## P21.15 Accessibility / localisation implications

Information-bearing audio must have non-audio equivalent hook/caption where required.

## P21.16 Performance implications

Voice budgets, cooldowns and aggregation from the start.

## P21.17 Security / trust implications

Imported audio rights/provenance recorded.

## P21.18 Recommended child decomposition

- P21-A — Sound Forge cue/source schema;
- P21-B — semantic event resolver;
- P21-C — Material DNA response families;
- P21-D — spatial/LOD/aggregation;
- P21-E — accessibility/Test Lab;
- P21-F — reconciliation.

## P21.19 Acceptance matrix

| ID | Requirement | Evidence | Gate |
| --- | --- | --- | --- |
| P21-AC01 | Sound cue authored/baked through Forge | EV-B / EV-C | Required |
| P21-AC02 | Footstep/impact resolves through semantic material family | EV-B / EV-C | Required |
| P21-AC03 | Repetition control avoids deterministic obvious looping under sample scenario | EV-C / EV-F | Required |
| P21-AC04 | State loop reconstructs correctly after load | EV-D | Required |
| P21-AC05 | Information-bearing cue has non-audio equivalent hook | EV-F | Required |
| P21-AC06 | Dense repeated events aggregate/cooldown within voice budget | EV-E | Required |
| P21-AC07 | Sound cannot mutate gameplay state | EV-B negative/review | Required |
| P21-AC08 | Representative family passes ART-07 review | EV-F / EV-G | Required |
| P21-AC09 | Final SHA/CI passes | EV-H | Required |

## P21.20 Negative tests

- missing material family;
- rapid impact spam;
- loop owner unloads;
- sound disabled;
- source file missing;
- state changes before loop fade completes.

## P21.21 Manual acceptance scenario

Walk across several material surfaces.

Break/place blocks.

Use tool.

Operate furnace.

Mute/reduce relevant categories and confirm gameplay remains understandable.

## P21.22 Rule-of-cool target

Close your eyes and still feel:

> **stone is stone, wood is wood, fire is fire.**

## P21.23 Exit gate

Shared semantic sound system exists.

## P21.24 Downstream unlock

P22 music and P24 integration.

## P21.25 Known risks / ADR triggers

- audio middleware/provider decision if beyond Godot built-ins;
- large-scale voice virtualisation architecture if early evidence demands it.

---

# P22 — THE SONG BETWEEN WORLDS

**Classification:** FORGE-FIRST / COOL-PULL  
**Arc:** ARC IV  
**Player/creator payoff:** Leyforge gains an adaptive musical identity that supports exploration, survival, civilisation and mystery without constantly shouting over the world.

## P22.1 Purpose

Establish Music Forge v1 and the runtime adaptive-music contract.

## P22.2 Authoritative source packet

- ART-07 music identity/adaptive principles;
- PROD-04 Music Forge shared service;
- PROD-05 State/Knowledge/Event hooks;
- P21 audio system;
- current world/progression mood direction;
- ART-09/10 production/certification.

## P22.3 Entry gate

- P21 COMPLETE;
- music rights/source strategy resolved for production fixtures.

## P22.4 Dependencies

### Hard

P21.

### Forge

Sound/Forge Core.

### Runtime

music context/read model.

## P22.5 Universal primitives used

- Identity;
- State;
- Signal/Event;
- Knowledge hook;
- Provenance;
- Result/Reason.

## P22.6 In scope

Music Forge v1:

- track/stem identity;
- metadata;
- motif;
- loop/section structure;
- transition points;
- intensity/context tags;
- silence/rest rules;
- one-shot musical stingers;
- adaptive layer/stem control;
- fade/crossfade;
- priority against critical cues;
- world/player-state context inputs;
- volume/category;
- accessibility hooks;
- bake/runtime playback.

Initial contexts may include:

- calm exploration;
- night/tension;
- shelter/safety;
- first discovery/mystery;
- crafting/hearth ambience if musically appropriate.

## P22.7 Explicit non-scope

- every realm score;
- faction/culture complete themes;
- boss music system;
- dynamic orchestral generation;
- AI music generation;
- final soundtrack catalogue.

## P22.8 Implementation capability requirements

Music supports the world.

It does not reveal hidden gameplay truth.

Example:

A hidden boss nearby must not trigger music unless current player-facing state legitimately knows/experiences the danger.

## P22.9 Forge requirements

Guided flow:

```text
Identity
→ musical function
→ source/rights/provenance
→ sections/stems
→ context tags
→ transitions
→ priority/silence
→ validate
→ Test Lab
→ bake
```

## P22.10 Runtime requirements

Adaptive music reads safe player-facing/context state.

Critical SFX/UI cues outrank score according to ART-07.

## P22.11 Canonical content subset

A small golden music suite only.

## P22.12 Persistence implications

Usually music playback itself is not saved.

Context reconstructs.

## P22.13 Multiplayer / authority implications

Music may be local per player knowledge/context.

Do not assume all multiplayer clients hear identical score.

## P22.14 Simulation-LOD implications

None.

## P22.15 Accessibility / localisation implications

Music is never the sole critical information channel.

## P22.16 Performance implications

Streaming/decoding memory/voice budget captured.

## P22.17 Security / trust implications

Rights/provenance mandatory.

## P22.18 Recommended child decomposition

- P22-A — Music Forge source schema;
- P22-B — runtime context/transition engine;
- P22-C — stem/layer system;
- P22-D — initial golden tracks;
- P22-E — mixing/accessibility/performance review;
- P22-F — reconciliation.

## P22.19 Acceptance matrix

| ID | Requirement | Evidence | Gate |
| --- | --- | --- | --- |
| P22-AC01 | Track/stem source authored and provenance recorded | EV-A / EV-B | Required |
| P22-AC02 | Runtime can transition between at least two contexts without hard cut defect | EV-C | Required |
| P22-AC03 | Music respects silence/rest conditions | EV-C / EV-G | Required |
| P22-AC04 | Hidden/unauthorised world truth is not leaked through context input | EV-B negative | Required |
| P22-AC05 | Critical cues remain readable over/through music mix | EV-F / EV-G | Required |
| P22-AC06 | Streaming/memory cost measured | EV-E | Required |
| P22-AC07 | Representative suite passes ART-07 review | EV-F / EV-G | Required |
| P22-AC08 | Final SHA/CI passes | EV-H | Required |

## P22.20 Negative tests

- context oscillation;
- missing stem;
- sound/music category disabled;
- invalid transition point;
- hidden-state context attempt.

## P22.21 Manual acceptance scenario

Walk from open exploration to shelter/safety and into a mild mystery/discovery context.

Observe that music changes with restraint and leaves space for the world.

## P22.22 Rule-of-cool target

The first time the player just stops moving because:

> **“Fuck, this place has a sound now.”**

## P22.23 Exit gate

Adaptive Music Forge/runtime foundation exists.

## P22.24 Downstream unlock

P23 Music Lab and P24 unified presentation.

## P22.25 Known risks / ADR triggers

- streaming/codec architecture if engine limitations require external solution;
- licensing/source pipeline.

---

# P23 — THE CLOCKMAKER'S SONG

**Classification:** COOL-PULL / FORGE-FIRST  
**Arc:** ARC IV  
**Player/creator payoff:** Music stops being only background score; Leyforge gains notes, instruments, timing and sequenced musical interaction that later systems can actually use.

## P23.1 Purpose

Create Music Lab v1: a reusable note/instrument/sequencer layer that later enables bells, instruments, logic-driven music and ultimately the P72 Flux pipe organ.

## P23.2 Authoritative source packet

- ART-07 music/audio principles;
- PROD-04 Music Lab concept;
- PROD-05 Signal/State/Connection hooks;
- P21 Sound Forge;
- P22 Music Forge;
- future P61/P72 dependency requirements from PROD-02.

## P23.3 Entry gate

- P21–P22 COMPLETE.

## P23.4 Dependencies

### Hard

P21–P22.

### Forge

Music/Sound source pipeline.

### Runtime

timing/sequencer.

## P23.5 Universal primitives used

- Identity;
- State;
- Signal hook;
- Connection/Port hook;
- Composition;
- Result/Reason;
- Provenance.

## P23.6 In scope

Music Lab v1:

- note/pitch identity;
- instrument definition;
- sample/synthesis source as selected;
- timing grid;
- tempo;
- sequence;
- step/event;
- velocity/intensity hook;
- loop;
- simple trigger input;
- basic multi-note/chord support if architecture permits;
- playback;
- editor/piano-roll/step-sequencer equivalent;
- export/save source;
- signal-input adapter hook reserved for P61;
- runtime note event.

## P23.7 Explicit non-scope

- full DAW;
- unrestricted audio scripting;
- complete MIDI workstation;
- machine logic;
- player Signal Forge;
- pipe organ itself;
- procedural AI composition.

## P23.8 Implementation capability requirements

Music Lab should create reusable musical semantics.

Later P61 should be able to drive:

```text
approved signal
→ note trigger
→ instrument
```

without rewriting the audio engine.

## P23.9 Forge requirements

Music Lab is a specialist workspace using Sound/Music shared services.

## P23.10 Runtime requirements

Timing should remain stable enough for rhythmic interaction.

Gameplay-critical simulation must not depend on audio callback timing.

## P23.11 Canonical content subset

- one simple instrument;
- note range;
- one short sequence/song fixture;
- optional bell/chime world object.

## P23.12 Persistence implications

Sequences are Forge/content source.

Runtime playback position generally need not persist unless future object state requires it.

## P23.13 Multiplayer / authority implications

Later networked instruments may transmit note/control events, not raw audio.

No networking required now.

## P23.14 Simulation-LOD implications

Distant instrument audio may virtualise.

## P23.15 Accessibility / localisation implications

Interactive instrument state should have visual feedback.

## P23.16 Performance implications

Polyphony/voice limits measured.

## P23.17 Security / trust implications

No arbitrary file/device execution.

## P23.18 Recommended child decomposition

- P23-A — note/instrument schema;
- P23-B — sequencer source/editor;
- P23-C — runtime timing/playback;
- P23-D — trigger/signal adapter hook;
- P23-E — instrument/sequence fixture;
- P23-F — reconciliation.

## P23.19 Acceptance matrix

| ID | Requirement | Evidence | Gate |
| --- | --- | --- | --- |
| P23-AC01 | Instrument/note definitions are authored through shared audio pipeline | EV-B | Required |
| P23-AC02 | Sequence plays reproducibly at defined tempo | EV-B / EV-C | Required |
| P23-AC03 | Multiple notes can be triggered without losing identity/timing within target tolerance | EV-E / EV-C | Required |
| P23-AC04 | Simple external approved trigger interface exists for future P61 | EV-A / EV-B | Required |
| P23-AC05 | No gameplay state depends on audio callback timing | EV-B negative/review | Required |
| P23-AC06 | Polyphony/voice limit is bounded | EV-E | Required |
| P23-AC07 | Interactive feedback has visual equivalent | EV-F | Required |
| P23-AC08 | Final SHA/CI passes | EV-H | Required |

## P23.20 Negative tests

- invalid note;
- missing instrument;
- polyphony overflow;
- tempo extremes outside supported range;
- sequence source changes during playback.

## P23.21 Manual acceptance scenario

Open Music Lab.

Create a short sequence.

Play it.

Trigger individual notes.

Change tempo.

Save/reopen source and replay.

Launch simple world/test instrument and trigger notes interactively.

## P23.22 Rule-of-cool target

A tiny moment of pure sandbox delight:

> **the player can make the world play music.**

This is the first seed of the future pipe-organ insanity. 😂

## P23.23 Exit gate

Reusable musical interaction layer exists.

## P23.24 Downstream unlock

P24 and later P61/P72.

## P23.25 Known risks / ADR triggers

- synthesis/sample implementation if it materially affects content pipeline;
- timing architecture if platform audio constraints require alternate scheduling.

---

# P24 — BREATH OF THE WORLD

**Classification:** INTEGRATION / COOL-PULL  
**Arc:** ARC IV  
**Player/creator payoff:** The same world actions now move, glow, spark, sound and score themselves coherently because all presentation is reading the same truth.

## P24.1 Purpose

Create the unified Presentation State layer and certify P18–P23 as one coherent stack.

P24 answers:

> **Can one authoritative gameplay state be expressed consistently through animation, VFX, lighting, sound, music and UI without any of those layers owning the truth?**

## P24.2 Authoritative source packet

- PROD-03 PresentationState boundary;
- PROD-04 shared presentation services;
- PROD-05 State/Signal/Event/Result;
- Set 21C runtime visual-state contract;
- ART-06;
- ART-07;
- ART-08;
- P17 furnace;
- P18–P23.

## P24.3 Entry gate

- P18–P23 COMPLETE;
- P17 provides representative stateful gameplay.

## P24.4 Dependencies

### Hard

P18–P23.

### Forge

all presentation Forge services developed in Arc IV.

### Runtime

authoritative gameplay states/events.

### Content

At least:

- furnace;
- campfire;
- block/material impact;
- Flux crystal;
- simple musical fixture.

## P24.5 Universal primitives used

- Identity;
- State;
- Signal/Event;
- Connection/Socket;
- Result/Reason;
- Composition;
- Provenance.

## P24.6 In scope

- PresentationState service/model;
- shared semantic state/event bindings;
- cross-channel timing;
- state layering;
- priority/conflict rules;
- reconstruction after load;
- presentation LOD;
- reduced motion/flash/effects handling;
- category/mix interaction;
- unified diagnostics;
- Test Lab state matrix;
- integration fixture(s).

## P24.7 Explicit non-scope

- final entity animation graph;
- creature states;
- machines/automation;
- spells;
- weather;
- vessels;
- realms;
- all final presentation content.

P24 certifies the platform.

## P24.8 Implementation capability requirements

Example furnace:

```text
authoritative state = ACTIVE
      ↓
Presentation State
      ├── Animation: moving/active loop
      ├── VFX: flame/smoke
      ├── Lighting: heat/emission
      ├── Sound: fire/mechanical loop
      ├── UI: processing/progress
      └── Music: usually unaffected unless broader player context says otherwise
```

Then:

```text
authoritative state = BLOCKED_OUTPUT
      ↓
Presentation State
      ├── Animation: stop/strain as authored
      ├── VFX: warning/fault if applicable
      ├── Lighting: status indication if applicable
      ├── Sound: stop/alert
      └── UI: exact reason
```

No presentation channel sets `BLOCKED_OUTPUT`.

## P24.9 Forge requirements

Presentation State inspection in Test Lab should allow creators to preview:

- each state;
- legal combinations;
- transitions;
- full/low/reduced profiles.

## P24.10 Runtime requirements

Presentation reconstructs after:

- load;
- projection reactivation;
- future reconnect-style state refresh.

One-shot events should not replay merely because projection recreated.

## P24.11 Canonical content subset

Golden fixture set only.

## P24.12 Persistence implications

Authoritative state persists.

Most presentation state reconstructs.

Only presentation data with true continuity need persist.

## P24.13 Multiplayer / authority implications

Architecture is now ready for future replicated state/event presentation.

## P24.14 Simulation-LOD implications

Presentation LOD is explicitly distinct from simulation LOD.

A distant furnace can stop animating/sounding while still processing.

## P24.15 Accessibility / localisation implications

State must remain understandable with:

- sound off;
- bloom off;
- low effects;
- reduced flash;
- reduced motion;
- colour limitations.

UI/reason text remains available where appropriate.

## P24.16 Performance implications

Combined stack benchmark:

- several active furnaces/campfires;
- repeated impacts;
- audio voices;
- lights/VFX;
- animation.

Measure aggregate, not only individual tools.

## P24.17 Security / trust implications

Presentation graphs/Forge source cannot invoke unrestricted gameplay mutation.

## P24.18 Recommended child decomposition

- P24-A — Presentation State model/service;
- P24-B — state/event binding unification;
- P24-C — priority/layering/reconstruction;
- P24-D — accessibility/LOD profiles;
- P24-E — end-to-end integration fixture;
- P24-F — PG-04 reconciliation.

## P24.19 Acceptance matrix

| ID | Requirement | Evidence | Gate |
| --- | --- | --- | --- |
| P24-AC01 | One authoritative state drives multiple presentation channels consistently | EV-B / EV-C | Required |
| P24-AC02 | No presentation channel owns gameplay truth | EV-A / negative tests | Required |
| P24-AC03 | Projection reload reconstructs loops/current state without replaying stale one-shots | EV-D / EV-B | Required |
| P24-AC04 | Layered state conflict follows explicit priority rules | EV-B | Required |
| P24-AC05 | Low/reduced accessibility profiles preserve critical meaning | EV-F / EV-G | Required |
| P24-AC06 | Distant presentation can reduce while authoritative process continues | EV-B / EV-E | Required |
| P24-AC07 | Combined fixture stays within provisional performance envelope | EV-E | Required |
| P24-AC08 | UI reason agrees with authoritative gameplay state | EV-C / EV-F | Required |
| P24-AC09 | Presentation Test Lab state matrix is reusable by later specialist Forge tools | EV-A / EV-C | Required |
| P24-AC10 | Final SHA/CI passes | EV-H | Required |

## P24.20 Negative tests

- remove VFX source while gameplay remains active;
- mute sound;
- disable bloom;
- reduced motion;
- projection unload/reload;
- rapid state transition;
- simultaneous damaged + active presentation;
- stale one-shot event.

## P24.21 Manual acceptance scenario

Operate the P17 furnace through:

- idle;
- ignition/start;
- active;
- low fuel if supported;
- output blocked;
- recovered active;
- stopped.

Observe all available presentation channels.

Repeat with reduced-effects/motion/audio settings.

Save/reload while active and confirm correct reconstruction.

## P24.22 Rule-of-cool target

The furnace is the first object that should make the project feel like:

> **“Oh shit, the world is starting to breathe.”**

## P24.23 Exit gate — PG-04 PRESENTATION STACK

PG-04 passes when:

- P18–P24 COMPLETE;
- animation/VFX/light/audio/music authoring services exist;
- semantic state/event binding is reusable;
- accessibility/LOD behaviour is proven;
- presentation never owns gameplay truth.

## P24.24 Downstream unlock

ARC V — BLOOD, BONE & STEEL.

P25+ can now create living entities on top of a mature presentation foundation.

## P24.25 Known risks / ADR triggers

- PresentationState representation if it changes runtime ownership;
- event aggregation/priority architecture;
- combined presentation performance if current provider assumptions fail.

---

# 05. Arc III Integration Gate — PG-03 Summary

PG-03 requires:

| Capability | Parent |
| --- | --- |
| World drops/pickups | P12 |
| Inventory/hotbar | P13 |
| Item & Tool Forge / tool runtime | P14 |
| Early survival | P15 |
| Recipe Forge / crafting | P16 |
| Furnace/processing integration | P17 |

Minimum end-to-end scenario:

```text
explore
→ break resource
→ collect
→ inventory
→ craft tool
→ gather gated resource
→ craft workbench/furnace
→ fuel furnace
→ process raw resource
→ receive refined output
→ save/reload
```

All resource quantities must reconcile.

---

# 06. Arc IV Integration Gate — PG-04 Summary

PG-04 requires:

| Capability | Parent |
| --- | --- |
| Animation Forge | P18 |
| VFX Forge | P19 |
| Lighting Forge | P20 |
| Sound Forge | P21 |
| Music Forge | P22 |
| Music Lab | P23 |
| Unified Presentation State | P24 |

Minimum end-to-end presentation fixture:

```text
P17 furnace state
→ Animation
→ VFX
→ Lighting
→ Sound
→ UI reason/status
```

Music should respond only where broader player/world context legitimately calls for it.

A second playful fixture should prove Music Lab interactivity.

---

# 07. Recommended Production Concurrency

The roadmap remains ordered, but limited overlap can reduce idle time.

## P12 / P13

P13 inventory data model can begin once P12 transaction/drop identity is stable enough.

Pickup UI/projection should not force inventory semantics prematurely.

## P14 / P15 / P16

P14 Item & Tool Forge and P16 Recipe Forge source-schema work may overlap if:

- P07 registry is stable;
- ownership boundaries are explicit;
- both consume P13 transactions instead of redefining them.

P15 can use provisional starter content but should not invent final recipe/tool definitions outside Forge.

## P18–P21

Shared socket/event/state-binding infrastructure should be designed jointly.

Specialist tools can implement in sequence/parallel as long as one service does not invent conflicting event concepts.

## P22 / P23

Music Lab may begin once the P22 source/playback contract is stable enough.

P23 must reuse Sound/Music services rather than implement another audio engine.

---

# 08. What Must NOT Sneak Into Arcs III–IV

## Gameplay

- NPCs;
- settlement needs;
- combat depth;
- automation;
- regional economy;
- full magic;
- farming production;
- governance.

## Forge

- Rig Forge;
- Character/Creature Forge;
- Structure Forge;
- Machine Forge;
- Signal & Logic Forge;
- Spell/Rune/Ritual Forge;
- Unified Forge;
- public mods.

## World

- production weather;
- full worldgen/biomes;
- oceans;
- realms.

## Presentation

- final weather VFX;
- full spell VFX;
- creature voices;
- vessel audio;
- realm complete scores.

Build shared capability now; expand content later.

---

# 09. Cross-Arc Architectural Discoveries Locked Here

## 09.1 Current block/item identity correction

The historical Items Registry's block-item-form architecture is not copied literally where it conflicts with the current single-definition rule.

The production distinction is:

> **world projection, inventory projection, held projection and icon projection do not automatically imply different gameplay identities.**

This should be enforced in P12–P14 tests.

## 09.2 Recipe definition should stay universal enough for later automation/NPC use

P16 is deliberately designed as a general process definition with capability/station/time/input/output hooks.

Later machine/NPC execution should reuse it where semantics match.

## 09.3 Presentation sockets/events are becoming infrastructure

P18–P21 collectively establish reusable:

- pivots;
- anchors;
- semantic events;
- state binding;
- audio/effect sockets.

These should be compatible with the universal Connection/Socket contracts from PROD-05 rather than becoming presentation-only private concepts.

## 09.4 Accessibility is not a late filter

The moment an audiovisual system communicates critical state, its accessible alternative becomes part of the contract.

## 09.5 Music Lab is a future composition enabler

P23 is intentionally early enough that later:

- bells;
- alarms;
- instruments;
- signal-driven music;
- ritual music;
- machines;
- the P72 Flux pipe organ

can reuse one musical interaction layer.

---

# 10. ProductionRegistry Seed Entries

Add/maintain:

```text
P012 — What the Earth Gives
P013 — Pack & Pocket
P014 — Tools of the First Age
P015 — Spark & Timber
P016 — Craft of Hand
P017 — Fire and Iron
P018 — The Moving Forge
P019 — Fireflies & Thunder
P020 — Light of the Forge
P021 — Echoes in Stone
P022 — The Song Between Worlds
P023 — The Clockmaker's Song
P024 — Breath of the World
```

Initial status remains governed by actual dependencies/evidence.

No entry becomes READY because this document exists.

---

# 11. Evidence Fixtures Recommended for Retention

Useful permanent/release-line fixtures include:

- starter pickup conservation fixture;
- inventory split/merge fixture;
- starter tool capability/durability fixture;
- campfire/shelter survival fixture;
- recipe atomicity fixture;
- active furnace save/reload fixture;
- rotating gear Animation Forge fixture;
- block/material impact VFX fixture;
- low-end/bloom-off light fixture;
- semantic material footstep fixture;
- adaptive music transition fixture;
- Music Lab instrument/sequencer fixture;
- unified furnace Presentation State fixture.

The furnace should become one of the earliest long-lived regression objects because it crosses so many systems.

---

# 12. Open Decisions Deliberately Deferred to Execution Evidence

PROD-08 does not silently decide:

- exact pickup physics implementation;
- exact inventory slot count;
- exact survival-stat balance;
- exact starter tool tier quantities;
- exact crafting times;
- exact fuel values;
- exact item-instance storage packing;
- exact audio file codec;
- exact sound voice budget;
- exact dynamic-light budget;
- exact particle implementation;
- exact animation provider details beyond accepted architecture;
- exact music streaming codec;
- exact Music Lab synthesis/sample approach.

Where one becomes gating, measure/prove and record the decision.

---

# 13. PROD-08 Acceptance Gate

PROD-08 is ready for owner lock when the owner agrees that:

- [ ] P12–P24 retain PROD-02 names/order;
- [ ] P12 begins authoritative resource conservation;
- [ ] the current single-definition rule supersedes historical duplicate block-item forms where the block remains the same thing;
- [ ] P13 inventory is semantic/transactional rather than UI-owned state;
- [ ] P14 Item & Tool Forge uses capability-driven interaction;
- [ ] P15 remains a deliberately bounded early-survival slice rather than the final needs simulation;
- [ ] P16 Recipe Forge defines a reusable process schema suitable for later NPC/machine use where semantics match;
- [ ] P17 furnace processing owns gameplay truth independently of presentation;
- [ ] PG-03 requires a complete conserved gather→craft→process loop;
- [ ] P18 animation cannot create gameplay outcomes;
- [ ] P19 VFX reveals state/cause rather than owning it;
- [ ] P20 lighting/emission preserves material/state readability and avoids one-light-per-glowing-block architecture;
- [ ] P21 semantic material-response audio uses Material DNA/context rather than per-asset hard-coded audio paths;
- [ ] P22 music remains restrained/adaptive and cannot leak hidden world truth;
- [ ] P23 Music Lab establishes reusable note/instrument/sequencer semantics for later signals/instruments;
- [ ] P24 unifies presentation state without creating a presentation God-system;
- [ ] projection/LOD reduction cannot imply authoritative process stopped;
- [ ] reduced motion/flash/effects and non-audio/non-colour cues are part of the stack from the start;
- [ ] P18–P24 establish shared Forge services for later systems rather than bespoke feature presentation;
- [ ] exact balance/provider parameters remain evidence-driven;
- [ ] no P-slice becomes READY merely because PROD-08 exists.

---

# 14. Proposed Lock Statement

If owner-approved, lock the following:

> **PROD-08 — LEYFORGE ARCS III–IV PRODUCTION CONTRACTS — v0.1**
>
> ARC III converts Leyforge's persistent editable world into a conserved survival-production loop: authoritative drops and pickups, persistent inventory/hotbar state, Forge-authored capability-driven tools, bounded early survival, a reusable Recipe Forge/process model and the first timed furnace/refinement integration. World, carried, held, dropped and icon projections preserve canonical identity according to the current single-definition rule rather than creating duplicate block Items merely for inventory. Resource movement and transformation are transactional and survive save/reload without duplication or loss. ARC IV then establishes the shared presentation stack: Animation Forge, VFX Forge, Lighting Forge, Sound Forge, Music Forge, Music Lab and a unified Presentation State layer. Gameplay systems own truth; presentation reads and communicates it through semantic state, events, sockets and accessible/LOD-aware profiles. By P24, later entities, machines, magic, settlements and realms can reuse one presentation architecture instead of inventing private audiovisual state systems.

---

# 15. Next Document

After PROD-08 acceptance/reconciliation, continue to:

> **PROD-09 — Arcs V–VI Production Contracts: P25–P38**

That volume will cover:

- Entity & Creature contract;
- Character/Creature Forge v1;
- Rig Forge;
- entity runtime and locomotion;
- creature behaviour/ecology;
- Equipment Forge;
- first combat encounter;
- NPC identity;
- Character Forge v2 humanoids;
- Voice & Character Audio Forge;
- deterministic NPC planner/task system;
- personal needs and seven settlement pillars;
- Dialogue Forge;
- Three Souls and a Fire integration slice.

---

**End of PROD-08 v0.1 — Arcs III–IV Production Contracts Candidate**
