# LEYFORGE PRODUCTION PROGRAMME

## PROD-02 — Master Production Roadmap & Dependency Atlas

**Document ID:** PROD-02  
**Title:** Leyforge Master Production Roadmap & Dependency Atlas  
**Version:** v0.1  
**Date:** 21 September 2026  
**Status:** **LOCKED — OWNER-APPROVED PRODUCTION AUTHORITY**  
**Project:** Leyforge  
**Product context:** Ley Realms / The Forge  
**Programme:** PROD — Detailed Production Plan & Implementation Handoff  
**Constitutional parent:** PROD-00 — Production Constitution, Authority & Scope  
**Source-routing parent:** PROD-01 — Legacy Canon & Source Crosswalk  
**Primary purpose:** Convert the accepted twenty-Arc / P01–P192 production sequence into one governed dependency atlas, with explicit entry gates, parent-slice identities, cross-Arc dependencies, integration milestones, concurrency rules and child-slice decomposition law.  
**Primary downstream consumers:** PROD-03 through PROD-17, ProductionRegistry, Project Brain, Codex/coding agents, task contracts, CI/validation and production reporting.

---

# 00. Executive Roadmap Statement

Leyforge production is governed by **20 Arcs and 192 parent production slices**.

These slices are not intended to become 192 monolithic coding tasks. A P-number is a **production capability boundary**: it states what capability or integration proof must exist before the programme can rely on it. Implementation may decompose a parent slice into governed child slices, test fixtures, content batches and technical tasks where necessary.

The roadmap is ordered by dependency and meaningful payoff, not by the chronology in which ideas were originally documented.

The governing production chain remains:

> **Contract → Forge → Runtime → Content → Integration → Expansion**

This is a direction of dependency, not a rigid waterfall. Safe work may run concurrently when all owning contracts are stable, required prerequisites are satisfied, source ownership does not overlap and the active task/handoff governance permits it.

The roadmap deliberately alternates between foundations and visible payoffs. Leyforge must not spend years building invisible infrastructure without periodically proving that the player or creator receives something compelling from it.

The programme reaches its final milestone at:

> **P192 — THE FIRST FLAME**

where the complete game, The Forge, multiplayer/release systems and any optional AI features are certified together through a real handcrafted Tutorial World built using the same production tools and runtime rules as the rest of Leyforge.

---

# 01. Scope of PROD-02

PROD-02 owns:

- canonical production Arc order;
- canonical P01–P192 parent-slice numbering and names;
- primary dependency relationships between parent slices;
- programme-level entry and exit gates;
- Arc-level prerequisite relationships;
- integration proof placement;
- concurrency rules;
- child-slice decomposition rules;
- the ProductionRegistry shape needed to represent the roadmap operationally.

PROD-02 does **not** replace:

- the detailed gameplay/content rules in upstream canon;
- specialist ART production law;
- runtime architecture owned by PROD-03;
- Forge engineering detail owned by PROD-04;
- universal contract detail owned by PROD-05;
- task/evidence governance owned by PROD-06;
- detailed P-slice implementation contracts owned by PROD-07 through PROD-16;
- final verification/certification ownership in PROD-17.

---

# 02. Roadmap Invariants

## 02.1 Parent slices are capability boundaries

A parent P-slice answers:

> **What must be true when this production step is complete?**

It is not synonymous with:

- one Git commit;
- one Codex prompt;
- one Godot scene;
- one sprint;
- one asset;
- one pull request.

Large slices such as a complete realm are expected to decompose into many child tasks while retaining one parent completion gate.

## 02.2 Recommended order versus hard dependency

The numeric sequence is the **default production order**.

However, the roadmap distinguishes:

- **hard prerequisite** — work must not claim production readiness before the prerequisite passes;
- **Forge prerequisite** — required authoring capability must exist before mass content of that class;
- **integration prerequisite** — representative systems must already work together;
- **soft/order preference** — chosen to reduce rework or improve player-facing cadence;
- **expansion dependency** — a capability is already proven and is now being scaled.

A later P may begin limited preparatory work before an earlier soft dependency completes, but it may not bypass a hard prerequisite or claim its own exit gate early.

## 02.3 Forge-first does not mean Forge-before-contract

The Forge cannot author a concept whose semantic/runtime contract is undefined.

The intended order is:

```text
THIN CONTRACT
    ↓
SPECIALIST FORGE CAPABILITY
    ↓
RUNTIME CONSUMPTION
    ↓
REPRESENTATIVE CONTENT
    ↓
INTEGRATION PROOF
    ↓
MASS CONTENT / EXPANSION
```

## 02.4 Specialist Forge workflows orchestrate shared services

A specialist Forge may guide the creator through a domain-specific journey, but should call shared services for modelling, materials, animation, VFX, audio, capture, validation, packaging and testing rather than cloning them internally.

## 02.5 Structure/Vessel/Composition authoring uses existing canonical content

Structure Forge, Vessel Forge and similar composition tools build with existing registered blocks/items/components/materials unless the relevant developer authority first creates and registers new content through the owning Forge.

A blueprint-only convenience material or hidden duplicate item may not silently become canonical game content.

## 02.6 Integration slices are first-class production work

An integration slice is not filler.

It proves that independently-valid subsystems actually compose under real runtime conditions. Failure in an integration slice may legitimately reopen an upstream architecture or contract issue.

## 02.7 AI cannot move forward

ARC XIX is hard-gated by P170.

AI features are not permitted to become required infrastructure for completing earlier runtime, Forge, UI, content or simulation work.

## 02.8 Tutorial World is last

ARC XX is not an onboarding prototype built early and forgotten.

It is a final production world created using the complete Forge and complete runtime, and it doubles as whole-game integration evidence.

---

# 03. Classification Markers

The roadmap uses the following production classifications:

| Marker | Meaning |
| --- | --- |
| **FOUNDATION** | Creates a contract or capability that later systems genuinely depend upon. |
| **FORGE-FIRST** | Creates the authoring capability before mass content of that class. |
| **COOL-PULL** | Deliberately brings a compelling player/creator payoff forward when dependencies allow it. |
| **INTEGRATION** | Proves several existing systems together in a meaningful end-to-end slice. |
| **EXPANSION** | Scales a capability that has already passed its foundational proof. |
| **EXPERIMENTAL** | Bounded optional work that may not become a dependency of the core game unless formally promoted. |

A slice may carry multiple classifications.

---

# 04. Parent-Slice Operational Status

The ProductionRegistry should support at least:

| Status | Meaning |
| --- | --- |
| `UNASSESSED` | Parent exists in roadmap but current production readiness has not been evaluated. |
| `AUTHORITY_RESOLVED` | Owning sources/contracts are identified; no unresolved authority ambiguity blocks planning. |
| `PLANNED` | Child-slice plan, evidence target and acceptance shape exist. |
| `READY` | All hard entry gates and active-governance permissions are satisfied. |
| `ACTIVE` | Authorised implementation is underway. |
| `BLOCKED` | A hard dependency, defect, evidence gap or authority conflict prevents progress/claim. |
| `IN_REVIEW` | Implementation is complete enough for required automated/human review. |
| `PASS` | Required acceptance evidence has passed, pending any programme-level reconciliation step. |
| `COMPLETE` | Parent slice is reconciled, recorded and may be depended upon downstream. |
| `SUPERSEDED` | Replaced through explicit production governance; never used as a silent synonym for abandoned. |

`COMPLETE` is not inferred merely because code exists.

---

# 05. Programme Gates

## PG-00 — PRODUCTION ADMISSION

**Position:** Before P01  
**Required proof:** PROD-00–06 accepted enough to govern work; repo/Brain/active-task gate separately verified before implementation begins.

## PG-01 — WORLD FOUNDATION

**Position:** After P05  
**Required proof:** Production world boots, streams, edits and persists deterministically enough for downstream gameplay.

## PG-02 — FORGE CORE

**Position:** After P10  
**Required proof:** A registered Forge source can be authored, validated, baked, run and inspected in Test Lab.

## PG-03 — SURVIVAL / CRAFT FOUNDATION

**Position:** After P17  
**Required proof:** Real gather→inventory→tool→craft→smelt loop works with conservation and persistence.

## PG-04 — PRESENTATION STACK

**Position:** After P24  
**Required proof:** Animation/VFX/light/material/audio/music observe authoritative state through shared presentation contracts.

## PG-05 — ENTITY / COMBAT

**Position:** After P31  
**Required proof:** Forge-authored living entity can be built, rigged, animated, spawned and fought without bespoke per-entity code.

## PG-06 — SOCIAL HEARTH

**Position:** After P38  
**Required proof:** Persistent named NPCs live, work, need, converse and form a functioning founding camp.

## PG-07 — SETTLEMENT GROWTH

**Position:** After P48  
**Required proof:** NPCs can plan, resource and construct Forge-authored structures; camp grows into hamlet.

## PG-08 — AUTONOMOUS INDUSTRY

**Position:** After P63  
**Required proof:** Professions, storage, hauling, machines, logistics and settlement production function together near and far.

## PG-09 — MAGE-ENGINEERING

**Position:** After P72  
**Required proof:** Flux, runes, spells, rituals and magic/automation composition are proven; pipe-organ proof demonstrates emergent composition.

## PG-10 — OVERWORLD ADVENTURE

**Position:** After P82  
**Required proof:** Worldgen, biomes, ecology, weather, caves, ruins, dungeons and discovery produce a complete expedition.

## PG-11 — REGIONAL ECONOMY

**Position:** After P92  
**Required proof:** Multiple settlements exchange real stock over routes with meaningful disruption/recovery.

## PG-12 — CIVILISATION POLITY

**Position:** After P102  
**Required proof:** Government, law, territory, diplomacy, military logistics and conflict produce persistent consequences.

## PG-13 — MARITIME WORLD

**Position:** After P114  
**Required proof:** Production water, ports, vessels, crews, sea routes, marine ecology and naval conflict function end-to-end.

## PG-14 — SEVEN-WORLD COSMOLOGY

**Position:** After P126  
**Required proof:** All current production realms are integrated as persistent connected worlds with portals and cross-realm logistics.

## PG-15 — UNIFIED FORGE

**Position:** After P137  
**Required proof:** Forge is one coherent creator platform capable of producing and packaging a mini expansion without project hacking.

## PG-16 — PERSISTENT HISTORY

**Position:** After P148  
**Required proof:** Knowledge, memory, events, generations and physical historical layering survive long simulation.

## PG-17 — MULTIPLAYER ECOSYSTEM

**Position:** After P158  
**Required proof:** Shared authoritative worlds, collaborative play/Forge, content packs and dedicated servers are proven together.

## PG-18 — NON-AI RELEASE HARDENING

**Position:** After P170  
**Required proof:** Game and Forge are feature-complete, accessible, scalable, migratable, diagnosable and shippable without AI.

## PG-19 — OPTIONAL INTELLIGENCE

**Position:** After P179  
**Required proof:** AI features operate only through completed systems and can be disabled without breaking world truth.

## PG-20 — THE FIRST FLAME

**Position:** After P192  
**Required proof:** Tutorial World certifies the complete production game/Forge as an adventure and becomes final programme integration milestone.

# 06. Twenty-Arc Dependency Map

The Arcs form the following high-level dependency spine:

```text
I  A WORLD FROM STONE
        ↓
II THE MAKER'S HAND
        ↓
III HEARTH & HAMMER
        ↓
IV SHAPE, MOTION & SONG
        ↓
V BLOOD, BONE & STEEL
        ↓
VI THE FIRST HEARTH
        ↓
VII FROM CAMPFIRE TO KINGDOM
        ↓
VIII GEARS BENEATH THE EARTH
        ↓
IX WHEN THE LEY AWAKENS
        ↓
X BEYOND THE HORIZON
        ↓
XI ROADS OF GOLD & DUST
        ↓
XII CROWNS & CONSEQUENCES
        ↓
XIII CALL OF THE DEEP BLUE
        ↓
XIV BEYOND THE VEIL
        ↓
XV THE FORGE UNBOUND
        ↓
XVI A WORLD THAT REMEMBERS
        ↓
XVII MANY HANDS, ONE WORLD
        ↓
XVIII TEMPERING LEYFORGE
        ↓
XIX THE MIND IN THE MACHINE
        ↓
XX THE FIRST FLAME
```

This diagram shows the programme spine, not every legal concurrency opportunity.

## ARC I — A WORLD FROM STONE

> *Before civilisation, before magic, before memory — there was the world.*

**Parent slices:** P01–P05  
**Arc entry dependency:** PROD programme admission  
**Arc exit:** P05 must satisfy the corresponding programme gate before the programme relies on this Arc as a completed capability family.

## ARC II — THE MAKER'S HAND

> *The world exists. Now we learn how to make things worthy of it.*

**Parent slices:** P06–P11  
**Arc entry dependency:** ARC I persistence/world foundation  
**Arc exit:** P11 must satisfy the corresponding programme gate before the programme relies on this Arc as a completed capability family.

## ARC III — HEARTH & HAMMER

> *Take what the world gives you. Shape it into what you need.*

**Parent slices:** P12–P17  
**Arc entry dependency:** ARC I + Forge Core from ARC II  
**Arc exit:** P17 must satisfy the corresponding programme gate before the programme relies on this Arc as a completed capability family.

## ARC IV — SHAPE, MOTION & SONG

> *A world is not alive because it moves. It is alive because movement has meaning.*

**Parent slices:** P18–P24  
**Arc entry dependency:** Forge Core + stateful gameplay objects  
**Arc exit:** P24 must satisfy the corresponding programme gate before the programme relies on this Arc as a completed capability family.

## ARC V — BLOOD, BONE & STEEL

> *The world is alive. Some of it wants to eat you.*

**Parent slices:** P25–P31  
**Arc entry dependency:** Forge presentation stack + entity contract readiness  
**Arc exit:** P31 must satisfy the corresponding programme gate before the programme relies on this Arc as a completed capability family.

## ARC VI — THE FIRST HEARTH

> *A campfire means survival. Someone sitting beside it means home.*

**Parent slices:** P32–P38  
**Arc entry dependency:** Entity runtime/combat + NPC identity contract  
**Arc exit:** P38 must satisfy the corresponding programme gate before the programme relies on this Arc as a completed capability family.

## ARC VII — FROM CAMPFIRE TO KINGDOM

> *A home becomes a street. A street becomes a town. A town becomes history.*

**Parent slices:** P39–P48  
**Arc entry dependency:** NPC needs/planner + canonical content/Forge composition  
**Arc exit:** P48 must satisfy the corresponding programme gate before the programme relies on this Arc as a completed capability family.

## ARC VIII — GEARS BENEATH THE EARTH

> *First we worked with our hands. Then we taught the world to work beside us.*

**Parent slices:** P49–P63  
**Arc entry dependency:** Settlement construction + work/economy substrate  
**Arc exit:** P63 must satisfy the corresponding programme gate before the programme relies on this Arc as a completed capability family.

## ARC IX — WHEN THE LEY AWAKENS

> *The world was never empty. We simply hadn't learned how to listen.*

**Parent slices:** P64–P72  
**Arc entry dependency:** Automation ports/signals + early Flux teaser  
**Arc exit:** P72 must satisfy the corresponding programme gate before the programme relies on this Arc as a completed capability family.

## ARC X — BEYOND THE HORIZON

> *Home matters more when there is somewhere worth leaving it for.*

**Parent slices:** P73–P82  
**Arc entry dependency:** Stable world persistence + mature Forge authoring  
**Arc exit:** P82 must satisfy the corresponding programme gate before the programme relies on this Arc as a completed capability family.

## ARC XI — ROADS OF GOLD & DUST

> *A road carries more than feet. It carries food, news, wealth, ideas and war.*

**Parent slices:** P83–P92  
**Arc entry dependency:** Regional world + settlement stock/logistics  
**Arc exit:** P92 must satisfy the corresponding programme gate before the programme relies on this Arc as a completed capability family.

## ARC XII — CROWNS & CONSEQUENCES

> *A civilisation is more than its buildings. It is what its people agree to protect, permit, remember and fight for.*

**Parent slices:** P93–P102  
**Arc entry dependency:** Regional economy + identity/permissions  
**Arc exit:** P102 must satisfy the corresponding programme gate before the programme relies on this Arc as a completed capability family.

## ARC XIII — CALL OF THE DEEP BLUE

> *The horizon was never the edge of the world. It was an invitation.*

**Parent slices:** P103–P114  
**Arc entry dependency:** World/route/logistics + production water risk gate  
**Arc exit:** P114 must satisfy the corresponding programme gate before the programme relies on this Arc as a completed capability family.

## ARC XIV — BEYOND THE VEIL

> *There are worlds beside this one, and every doorway asks a price.*

**Parent slices:** P115–P126  
**Arc entry dependency:** World Forge + Flux/portal + realm persistence contracts  
**Arc exit:** P126 must satisfy the corresponding programme gate before the programme relies on this Arc as a completed capability family.

## ARC XV — THE FORGE UNBOUND

> *We learned to shape stone, life, machine and magic. Now the tools themselves become one.*

**Parent slices:** P127–P137  
**Arc entry dependency:** Specialist Forge tools proven across all major domains  
**Arc exit:** P137 must satisfy the corresponding programme gate before the programme relies on this Arc as a completed capability family.

## ARC XVI — A WORLD THAT REMEMBERS

> *The world changes. Then it remembers why.*

**Parent slices:** P138–P148  
**Arc entry dependency:** Knowledge/event foundations + mature persistent simulation  
**Arc exit:** P148 must satisfy the corresponding programme gate before the programme relies on this Arc as a completed capability family.

## ARC XVII — MANY HANDS, ONE WORLD

> *One person can build a home. Many can build a civilisation.*

**Parent slices:** P149–P158  
**Arc entry dependency:** Complete authoritative single-player simulation + permissions/packages  
**Arc exit:** P158 must satisfy the corresponding programme gate before the programme relies on this Arc as a completed capability family.

## ARC XVIII — TEMPERING LEYFORGE

> *A blade is not finished when it takes shape. It is finished when it survives the fire.*

**Parent slices:** P159–P170  
**Arc entry dependency:** Multiplayer-complete representative game  
**Arc exit:** P170 must satisfy the corresponding programme gate before the programme relies on this Arc as a completed capability family.

## ARC XIX — THE MIND IN THE MACHINE

> *First we taught the world its laws. Only then did we teach something to reason within them.*

**Parent slices:** P171–P179  
**Arc entry dependency:** Non-AI game and Forge certified complete at P170  
**Arc exit:** P179 must satisfy the corresponding programme gate before the programme relies on this Arc as a completed capability family.

## ARC XX — THE FIRST FLAME

> *Every legend begins somewhere.*

**Parent slices:** P180–P192  
**Arc entry dependency:** Release-hardened game + complete Forge + optional AI already bounded  
**Arc exit:** P192 must satisfy the corresponding programme gate before the programme relies on this Arc as a completed capability family.

# 07. Detailed Parent-Slice Dependency Atlas

The table below is the canonical **v0.1 roadmap index**. Detailed implementation requirements are owned later by PROD-07 through PROD-16. The prerequisite column identifies the most important parent-level entry dependencies, not every source document, test fixture or child task.


## ARC I — A WORLD FROM STONE

| P | Name | Class | Primary prerequisites | Parent production output / proof |
| --- | --- | --- | --- | --- |
| **P01** | **The Empty Canvas** | FOUNDATION | PROD handoff gate; clean production repository | Godot 4.7.2 production bootstrap, Zylann integration boundary, diagnostics/test entry points |
| **P02** | **Stone Beneath Our Feet** | FOUNDATION | P01 | Production voxel terrain volume, chunk lifecycle, streaming, meshing, collision and terrain interface |
| **P03** | **First Footfall** | FOUNDATION | P01–P02 | Production player locomotion, camera, traversal and interaction-ray foundation |
| **P04** | **The First Scar** | COOL-PULL / FOUNDATION | P02–P03 | Authoritative voxel targeting, break/place/edit transaction and safe remesh loop |
| **P05** | **The World Remembers** | FOUNDATION | P02–P04 | Seed identity, generated-base-versus-edits persistence, save/load/recovery/version foundation |

## ARC II — THE MAKER'S HAND

| P | Name | Class | Primary prerequisites | Parent production output / proof |
| --- | --- | --- | --- | --- |
| **P06** | **The Forge Ignites** | FORGE-FIRST | P01; P05 persistence contract available | Smallest viable Forge workspace and source→validate→bake→runtime loop |
| **P07** | **Names of Power** | FOUNDATION / FORGE-FIRST | P06 | Stable content IDs, registries, inheritance, references, dependency metadata and compatibility |
| **P08** | **Voxelwright** | FORGE-FIRST | P06–P07 | Block/Voxel Forge authoring, geometry, pivots, collision, sockets and runtime bake |
| **P09** | **The Alchemist's Palette** | FORGE-FIRST | P06–P08 | Material Forge, Material DNA, 32×32 surfaces, variants and state overlays |
| **P10** | **The Testing Crucible** | FORGE-FIRST / FOUNDATION | P06–P09 | Forge Test Laboratory v1 and source/runtime validation environment |
| **P11** | **A Glimmer in the Stone** | COOL-PULL | P02; P09–P10 | First production fantasy signal: rare Flux crystal presentation/worldgen teaser |

## ARC III — HEARTH & HAMMER

| P | Name | Class | Primary prerequisites | Parent production output / proof |
| --- | --- | --- | --- | --- |
| **P12** | **What the Earth Gives** | FOUNDATION | P04–P05 | Drops, pickups, stacks, conservation and persistent world-item handling |
| **P13** | **Pack & Pocket** | FOUNDATION | P12 | Inventory/hotbar/stack interaction and persistence |
| **P14** | **Tools of the First Age** | FORGE-FIRST | P08–P10; P13 | Item & Tool Forge v1 plus first functional harvesting tools |
| **P15** | **Spark & Timber** | COOL-PULL | P03; P13–P14 | Early survival, health/environment hooks, campfire, food/shelter foundation |
| **P16** | **Craft of Hand** | FORGE-FIRST | P07; P13–P15 | Recipe Forge plus transactional hand crafting |
| **P17** | **Fire and Iron** | INTEGRATION | P14–P16 | Workbench/furnace/fuel/smelting and first metal progression loop |

## ARC IV — SHAPE, MOTION & SONG

| P | Name | Class | Primary prerequisites | Parent production output / proof |
| --- | --- | --- | --- | --- |
| **P18** | **The Moving Forge** | FORGE-FIRST | P06–P10; P17 stateful workstation proof | Animation Forge timeline/state/event foundation |
| **P19** | **Fireflies & Thunder** | FORGE-FIRST | P18 | VFX Forge with sockets, state binding, LOD and reduced-effects support |
| **P20** | **Light of the Forge** | FORGE-FIRST | P09; P18–P19 | Lighting Forge, emission/state lights and scalable profiles |
| **P21** | **Echoes in Stone** | FORGE-FIRST | P09; P18 | Sound Forge, spatial emitters, semantic events and material-response families |
| **P22** | **The Song Between Worlds** | FORGE-FIRST / COOL-PULL | P21 | Music Forge with adaptive cues, stems, motifs and transitions |
| **P23** | **The Clockmaker's Song** | FORGE-FIRST / COOL-PULL | P21–P22 | Music Lab v1: notes, timing, sequencer, instruments and simple triggers |
| **P24** | **Breath of the World** | INTEGRATION | P18–P23 | Presentation State layer proving animation/VFX/light/material/audio/music tell runtime truth |

## ARC V — BLOOD, BONE & STEEL

| P | Name | Class | Primary prerequisites | Parent production output / proof |
| --- | --- | --- | --- | --- |
| **P25** | **The Shape of Life** | FOUNDATION | P07; P24 | Entity & Creature semantic/runtime contract |
| **P26** | **Flesh from Voxel** | FORGE-FIRST | P08–P10; P25 | Character & Creature Forge v1 body/anatomy/material/socket workflow |
| **P27** | **Bones Beneath** | FORGE-FIRST | P18; P26 | Rig Forge skeletons/joints/IK/sockets/retarget rules |
| **P28** | **Give It Life** | INTEGRATION | P25–P27 | Entity runtime spawning, locomotion, animation, persistence and basic navigation |
| **P29** | **Tooth & Claw** | COOL-PULL | P28 | Creature senses, hostility/fear, attacks, territory, ecology/group hooks |
| **P30** | **Steel in Hand** | FORGE-FIRST | P14; P26–P28 | Equipment Forge expansion: weapons, armour, fit, slots, sockets, durability |
| **P31** | **Trial by Blood** | INTEGRATION / COOL-PULL | P28–P30; P24 | Complete first combat encounter proving Forge-authored entities/equipment/presentation |

## ARC VI — THE FIRST HEARTH

| P | Name | Class | Primary prerequisites | Parent production output / proof |
| --- | --- | --- | --- | --- |
| **P32** | **A Name Beside the Fire** | FOUNDATION | P28; P31 combat consequences available | NPC identity, household, occupation, needs, knowledge and persistence contract |
| **P33** | **Faces of the Living** | FORGE-FIRST | P26–P27; P32 | Character Forge v2 guided humanoid creation journey and required-animation manifest |
| **P34** | **Voices Around the Hearth** | FORGE-FIRST | P21; P33 | Voice/character audio profiles and semantic foot-contact/event mapping |
| **P35** | **Thought Before Action** | FOUNDATION | P28; P32 | Deterministic NPC goals/tasks/priorities/schedules/reservations and planner diagnostics |
| **P36** | **Bread, Bed & Belonging** | FOUNDATION | P32; P35 | Personal needs and seven settlement pillars at resident scale |
| **P37** | **Words Between People** | FORGE-FIRST | P32; P35–P36 | Dialogue Forge v1 with conditions, consequences, knowledge visibility and localisation hooks |
| **P38** | **Three Souls and a Fire** | INTEGRATION / COOL-PULL | P32–P37 | Founding Camp vertical slice with persistent named residents living together |

## ARC VII — FROM CAMPFIRE TO KINGDOM

| P | Name | Class | Primary prerequisites | Parent production output / proof |
| --- | --- | --- | --- | --- |
| **P39** | **The Architect's Table** | FOUNDATION | P07; P36; P38 | Blueprint/Structure semantic contract including rooms, markers, utilities and construction stages |
| **P40** | **Stone Dreams** | FORGE-FIRST | P08–P10; P39 | Structure Forge v1 guided composition using existing registered game content only |
| **P41** | **More Than Walls** | FORGE-FIRST | P39–P40 | Semantic Structure Forge validation: rooms, access, jobs, storage, utilities, routes |
| **P42** | **Raised One Stone at a Time** | FOUNDATION | P39–P41; P12–P17 resources | Construction runtime: staged projects, deliveries, labour and commissioning |
| **P43** | **Hands at Work** | INTEGRATION / COOL-PULL | P35; P42 | NPC builders perform real construction using profession/work contracts |
| **P44** | **Roots Take Hold** | FOUNDATION | P32; P36; P42–P43 | Households, residency, settlement membership, private/shared space and ownership |
| **P45** | **The Village Chooses** | FOUNDATION | P39–P44 | Settlement planner selects valid Forge-authored projects from needs/resources/terrain |
| **P46** | **The Road Between Doors** | FOUNDATION / COOL-PULL | P41; P44–P45 | Settlement roads, parcels, access and expansion layout |
| **P47** | **The Fourth Chair** | COOL-PULL | P44–P46 | Migration/population growth driven by real housing, work, safety and provisions |
| **P48** | **From Campfire to Hamlet** | INTEGRATION / COOL-PULL | P39–P47 | Camp organically becomes a hamlet through real resources, NPC work and construction |

## ARC VIII — GEARS BENEATH THE EARTH

| P | Name | Class | Primary prerequisites | Parent production output / proof |
| --- | --- | --- | --- | --- |
| **P49** | **The Work of Many Hands** | FOUNDATION | P35; P42–P48 | Universal work/profession/production contract |
| **P50** | **Callings of the Hearth** | FORGE-FIRST | P49 | Work & Profession Forge including builder/labourer, miner, lumberjack, farmer, smith, hauler and later specialisations |
| **P51** | **From Forest and Vein** | COOL-PULL | P14; P49–P50 | NPC gathering/extraction runtime for mining, forestry, quarrying and gathering |
| **P52** | **Hands That Make** | FOUNDATION / INTEGRATION | P16–P17; P49–P50 | NPC crafting/processing using canonical recipes and real workstations |
| **P53** | **The Common Store** | FOUNDATION / COOL-PULL | P13; P44; P49–P52 | Settlement inventories, warehouse stock, project/emergency/trade reserves and ownership |
| **P54** | **Burden and Road** | FOUNDATION | P46; P53 | NPC hauling/internal logistics with reservations, priorities and route-aware movement |
| **P55** | **While You Were Away** | INTEGRATION / COOL-PULL | P51–P54; P05 simulation persistence | Autonomous near/far settlement production with conserved resources |
| **P56** | **Turn the Wheel** | FOUNDATION / COOL-PULL | P17; P24 | Mechanical power sources, loads, transmission and diagnostics |
| **P57** | **Ports of Purpose** | FOUNDATION | P07; P56 | Typed machine/network semantic ports: items, power, fuel, signals and reserved future domains |
| **P58** | **The Machinewright's Bench** | FORGE-FIRST | P18–P21; P57 | Machine Forge guided workflow: form→moving parts→ports→process→states→presentation→test |
| **P59** | **Iron in Motion** | INTEGRATION / COOL-PULL | P56–P58 | Machine runtime for real powered processors and failure/blockage states |
| **P60** | **Rivers of Goods** | FOUNDATION / COOL-PULL | P53; P57–P59 | Automated item logistics, junctions, filtering, buffers and cross-chunk conservation |
| **P61** | **The Whispering Wire** | FORGE-FIRST / COOL-PULL | P57; P59–P60 | Bounded Signal & Logic Forge reused beyond factories |
| **P62** | **The First Factory** | INTEGRATION / COOL-PULL | P56–P61 | First end-to-end automated production chain feeding real settlement stock |
| **P63** | **A Town That Works** | INTEGRATION / COOL-PULL | P49–P62 | NPC labour + storage + hauling + machines + automation + construction operate as one economy |

## ARC IX — WHEN THE LEY AWAKENS

| P | Name | Class | Primary prerequisites | Parent production output / proof |
| --- | --- | --- | --- | --- |
| **P64** | **The Ley Revealed** | FOUNDATION | P11; P57 reserved Flux port concept; P63 stable industry | Production Fluxion foundation: sources, storage, transfer, consumption and persistence |
| **P65** | **Signs of Power** | FORGE-FIRST | P61; P64 | Rune Forge using approved capabilities, sockets, signals, presentation and validation |
| **P66** | **Words That Change the World** | FORGE-FIRST | P18–P21; P64–P65 | Spell Forge composing targeting, cost, effect modules and shared presentation services |
| **P67** | **Fire in the Palm** | COOL-PULL | P64–P66 | Player magic runtime and first meaningful utility/combat/mobility magic |
| **P68** | **Lanterns Against the Dark** | FORGE-FIRST / FOUNDATION | P57; P64–P67 | Magical infrastructure authoring and Flux network devices |
| **P69** | **Bottled Wonders** | FORGE-FIRST | P16; P64 | Alchemy Forge layered over canonical recipe/item systems |
| **P70** | **Circles of Power** | FORGE-FIRST / COOL-PULL | P39–P41; P61; P64–P68 | Ritual Forge where space, participants, runes and Flux form a validated composition |
| **P71** | **The Arcane Engine** | INTEGRATION / COOL-PULL | P59–P61; P64–P70 | Magic and automation interoperate without either replacing the other |
| **P72** | **The Impossible Instrument** | INTEGRATION / COOL-PULL | P23; P40–P41; P57–P61; P64–P71 | Flux-powered voxel pipe organ as emergent composition certification |

## ARC X — BEYOND THE HORIZON

| P | Name | Class | Primary prerequisites | Parent production output / proof |
| --- | --- | --- | --- | --- |
| **P73** | **The Shape of Continents** | FOUNDATION | P02; P05; P64 realm/world energy hooks as applicable | Regional deterministic worldgen contract: climate, geology, hydrology, resources, structures and routes |
| **P74** | **Worldwright** | FORGE-FIRST | P10; P73 | World Forge with seed previews, heatmaps, diagnostics and statistical generation tests |
| **P75** | **Where Earth Becomes Place** | FORGE-FIRST | P73–P74; P09 | Biome Forge: terrain, climate, geology, ecology, resources, structures, ambience and transitions |
| **P76** | **The Green Between Stones** | FORGE-FIRST / FOUNDATION | P25–P29; P75 | Flora/Ecology Forge plus ecology composition relationships |
| **P77** | **Sky With Teeth** | COOL-PULL | P19–P21; P73–P76 | Production weather/seasons with real environmental/world consequences |
| **P78** | **Beneath the Roots** | COOL-PULL | P73–P77 | Cave provinces, geology, Deep Routes and underground ecology |
| **P79** | **Echoes of Those Before** | EXPANSION | P40–P41; P73–P78 | Forge-authored structures/ruins integrated into procedural world placement |
| **P80** | **Doors Into Darkness** | FORGE-FIRST | P39–P41; P61; P73–P79 | Dungeon Forge for authored and procedural-composed dungeons |
| **P81** | **Map What You Know** | FOUNDATION / FORGE-FIRST | P73–P80; knowledge-state hooks from existing UI canon | Cartography/discovery runtime and authoring that represents learned information |
| **P82** | **The First Expedition** | INTEGRATION / COOL-PULL | P73–P81; P31 | Real exploration adventure across biomes, weather, cave, ruin, dungeon, combat and mapping |

## ARC XI — ROADS OF GOLD & DUST

| P | Name | Class | Primary prerequisites | Parent production output / proof |
| --- | --- | --- | --- | --- |
| **P83** | **What Is It Worth?** | FOUNDATION | P53; P63; P82 regional world | Economy/exchange contract: ownership, value, scarcity, supply/demand and economic history |
| **P84** | **The Merchant's Ledger** | FORGE-FIRST | P83 | Commerce Forge for goods/services, markets, contracts and trade rules |
| **P85** | **Market Day** | COOL-PULL | P53; P83–P84 | Local markets and merchants trading real inventories with bounded price variation |
| **P86** | **Pack, Cart & Saddle** | FORGE-FIRST / FOUNDATION | P28; P53–P54; P85 | Land transport, pack animals/carts/wagons and cargo movement |
| **P87** | **The Long Road** | FOUNDATION | P46; P73; P86 | Regional route/travel runtime with terrain, weather, safety, ownership and maintenance |
| **P88** | **Caravan Bells** | COOL-PULL | P85–P87 | Persistent caravans with cargo, route selection, guards, rest and near/far simulation |
| **P89** | **The Road Remembers** | FOUNDATION | P77; P87–P88 | Route events, damage, danger, maintenance, repair and history |
| **P90** | **Warehouse to Warehouse** | INTEGRATION | P53–P54; P83–P89 | Regional freight moves real stock between settlement warehouses |
| **P91** | **The Living Market** | FOUNDATION / EXPANSION | P83–P90 | Regional economy evaluates production, consumption, shortage, imports/exports and route effects |
| **P92** | **Roads of Gold & Dust** | INTEGRATION / COOL-PULL | P83–P91 | First regional economy with disruption and recovery propagating through real routes/stock |

## ARC XII — CROWNS & CONSEQUENCES

| P | Name | Class | Primary prerequisites | Parent production output / proof |
| --- | --- | --- | --- | --- |
| **P93** | **Threads of Identity** | FOUNDATION | P32; P44; P92 | Society/culture/faction/government identity layers remain distinct |
| **P94** | **Banners in the Wind** | FORGE-FIRST | P93 | Faction Forge for membership, territory interests, economy, diplomacy hooks and presentation |
| **P95** | **The Civic Forge** | FORGE-FIRST / FOUNDATION | P93–P94; universal permissions concept | Government & Law Forge plus shared permission/jurisdiction contract |
| **P96** | **The Seat of Power** | FOUNDATION | P94–P95 | Governance runtime: offices, leadership, civic decisions, laws and succession hooks |
| **P97** | **Lines Upon the Earth** | FOUNDATION / COOL-PULL | P95–P96; P87 routes | Territory/jurisdiction, land/resource rights, claims and contested boundaries |
| **P98** | **Words Before Swords** | FOUNDATION | P93–P97; P83 trade | Diplomacy, treaties, access, alliances, grievances and ceasefires |
| **P99** | **The Muster** | FOUNDATION | P30–P31; P50 professions; P53 logistics; P96–P98 | Military jobs, supply, patrols, muster, forts and mobilisation logistics |
| **P100** | **When Banners Burn** | COOL-PULL | P31; P97–P99 | War, raids, campaigns, siege, occupation objectives and surrender/retreat |
| **P101** | **What Remains** | COOL-PULL / FOUNDATION | P100 | Occupation, displacement, reconstruction, persistent grievances and memorial consequences |
| **P102** | **Crowns & Consequences** | INTEGRATION / COOL-PULL | P93–P101 | Regional polity scenario proving government, territory, diplomacy, conflict and aftermath |

## ARC XIII — CALL OF THE DEEP BLUE

| P | Name | Class | Primary prerequisites | Parent production output / proof |
| --- | --- | --- | --- | --- |
| **P103** | **Water That Remembers** | FOUNDATION | P02; P05; P73 world architecture | Production water: bodies, bounded flow, voxel edits, persistence, swimming, buoyancy interface and flooding |
| **P104** | **The Waterwright** | FORGE-FIRST | P09–P10; P103 | Hydrology/Water Forge orchestrating world/material/VFX/audio/physics profiles |
| **P105** | **Tidebound** | COOL-PULL | P77 weather; P103–P104 | Waves, tides, currents, wind and storm-sea behaviour |
| **P106** | **Harbour Lights** | INTEGRATION | P40–P46; P53–P54; P103–P105 | Ports, docks, shipyards, maritime warehouses and land/sea logistics |
| **P107** | **Law of the Hull** | FOUNDATION | P39–P41; P57; P103–P106 | Vessel semantic/runtime contract: hull, compartments, propulsion, cargo, crew stations, damage |
| **P108** | **Shipwright** | FORGE-FIRST | P40–P41; P58 shared Forge services; P107 | Vessel Forge guided workflow using existing canonical blocks/components |
| **P109** | **Launch Day** | COOL-PULL / INTEGRATION | P103–P108 | First Forge-built vessel constructed, launched, sailed, docked and persisted |
| **P110** | **All Hands** | FOUNDATION / EXPANSION | P49–P50; P107–P109 | Maritime professions and crew operating real vessel stations |
| **P111** | **Blue Roads** | INTEGRATION | P87–P90; P106–P110 | Maritime routes/trade integrated into universal route/logistics concepts |
| **P112** | **Beneath the Surface** | COOL-PULL | P76; P103–P105; P109 | Marine ecology, diving, reefs, wrecks, submerged ruins and underwater hazards |
| **P113** | **Broadside** | COOL-PULL | P31; P99; P107–P112 | Naval combat, vessel damage, fire/flooding, boarding, piracy and navies |
| **P114** | **Stormbound** | INTEGRATION / COOL-PULL | P103–P113 | Complete maritime adventure from harbour to storm/trade/combat/repair |

## ARC XIV — BEYOND THE VEIL

| P | Name | Class | Primary prerequisites | Parent production output / proof |
| --- | --- | --- | --- | --- |
| **P115** | **The Law of Thresholds** | FOUNDATION | P05; P64; P73; P114 | Realm/portal persistence and transfer contract |
| **P116** | **Keys Between Worlds** | FORGE-FIRST | P39–P41; P65; P70; P115 | Portal Forge orchestrating structure/material/rune/ritual/VFX/audio/permission services |
| **P117** | **Worlds With Different Laws** | FORGE-FIRST | P74–P81; P93–P95; P115–P116 | Realm Forge orchestrating existing world/biome/ecology/structure/culture/presentation services |
| **P118** | **The First Crossing** | INTEGRATION / COOL-PULL | P115–P117 | First complete persistent secondary-realm crossing and return proof |
| **P119** | **The Sunlit Canopy** | EXPANSION / COOL-PULL | P117–P118; Verdant FCC authority | Verdant Covenant production programme |
| **P120** | **Where Names Endure** | EXPANSION / COOL-PULL | P117–P118; Ancestral FCC authority | Ancestral Veil production programme |
| **P121** | **The Dream That Watches** | EXPANSION / COOL-PULL | P117–P118; Somnolent FCC authority | Somnolent Expanse production programme |
| **P122** | **Above the World** | EXPANSION / COOL-PULL | P117–P118; Ascendant FCC authority | Ascendant Reach production programme |
| **P123** | **Below All Depths** | EXPANSION / COOL-PULL | P117–P118; Impossible Deep FCC authority | Impossible Deep production programme |
| **P124** | **Nine Roads Down** | EXPANSION / COOL-PULL | P117–P118; Ashen FCC authority | Ashen Lower Realms production programme including nine strata |
| **P125** | **Trade Between Worlds** | INTEGRATION | P90–P92; P98; P115–P124 | Cross-realm logistics, migration, trade, permissions and civilisation consequences |
| **P126** | **Seven Worlds, One Ley** | INTEGRATION / COOL-PULL | P115–P125 | Full cosmology integration proving realms form one civilisation sandbox |

## ARC XV — THE FORGE UNBOUND

| P | Name | Class | Primary prerequisites | Parent production output / proof |
| --- | --- | --- | --- | --- |
| **P127** | **The Great Workshop** | FORGE-FIRST / FOUNDATION | P06–P10 plus all specialist Forge services proven through P126 | Unified Forge workspace over shared authoring services |
| **P128** | **The Path of Making** | FORGE-FIRST | P127; existing specialist journey definitions | Creation Journey Engine for required/optional stages, completeness and guided Next flow |
| **P129** | **Threads of the Forge** | FOUNDATION / FORGE-FIRST | P07; P127–P128 | Universal dependency/composition graph and visible change propagation |
| **P130** | **Ink, Icon & Interface** | FORGE-FIRST | P127–P129; ART-08 | UI, Icon & 2D Forge |
| **P131** | **The Eye of the Forge** | FORGE-FIRST | P130; ART capture standards | Shared deterministic Capture Studio |
| **P132** | **The Judge's Hammer** | FOUNDATION / FORGE-FIRST | P127–P131 | Universal Forge validation with actionable diagnostics |
| **P133** | **The Living Test Chamber** | FORGE-FIRST / INTEGRATION | P10; P127–P132 | Final Test Laboratory spanning gameplay, content, performance and scenarios |
| **P134** | **Forge Without Walls** | FORGE-FIRST / COOL-PULL | P127–P133 | Live playtest and safe hot reload into real Leyforge runtime |
| **P135** | **Echoes of Yesterday** | FORGE-FIRST | P129; P134 | Revision, comparison, provenance, review and rollback tooling |
| **P136** | **Bound in Wax and Rune** | FORGE-FIRST | P07; P129; P132; P135 | Package Forge: namespaces, versions, dependencies, migrations, compatibility and publication classes |
| **P137** | **The Forge Unbound** | INTEGRATION / COOL-PULL | P127–P136 | Create/install a mini content expansion entirely through Forge |

## ARC XVI — A WORLD THAT REMEMBERS

| P | Name | Class | Primary prerequisites | Parent production output / proof |
| --- | --- | --- | --- | --- |
| **P138** | **What Is Known** | FOUNDATION | P81; P93; P137 | Knowledge contract separating reality, observation, fact, rumour, belief, inference and restricted information |
| **P139** | **Pages Against Oblivion** | FORGE-FIRST | P130; P138 | Knowledge & Codex Forge |
| **P140** | **Stories Waiting to Happen** | FORGE-FIRST | P37; P98; P138–P139 | Quest & Event Forge with world-state, knowledge, consequence and multiplayer scopes |
| **P141** | **The Turning of Days** | FOUNDATION | P140; existing simulation systems | Persistent world-event runtime across personal→world scales |
| **P142** | **I Remember You** | COOL-PULL | P32; P37; P138; P141 | NPC memory and relationship consequences |
| **P143** | **Those Who Come After** | COOL-PULL | P44; P96 succession hooks; P142 | Families, life stages, inheritance, apprenticeship and generational succession |
| **P144** | **Rumours on the Road** | COOL-PULL | P87–P88; P138–P143 | Information propagation through people, routes, institutions and communication |
| **P145** | **Ink and Stone** | FOUNDATION | P139; P141–P144 | Archives, records, monuments and historical sites |
| **P146** | **Scars Upon the Land** | INTEGRATION / COOL-PULL | P101; P141–P145 | Persistent historical layering physically alters and records the world |
| **P147** | **The Chronicle** | INTEGRATION | P138–P146 | Knowledge-sensitive world chronicle |
| **P148** | **A World That Remembers** | INTEGRATION / COOL-PULL | P138–P147 | Long simulation demonstrates accumulated people, events, buildings, routes and visible history |

## ARC XVII — MANY HANDS, ONE WORLD

| P | Name | Class | Primary prerequisites | Parent production output / proof |
| --- | --- | --- | --- | --- |
| **P149** | **The Shared Truth** | FOUNDATION | P05; P07; P95 permissions; P148 stable persistent simulation | Multiplayer authoritative command/state/transaction foundation |
| **P150** | **Another Footstep** | COOL-PULL | P149 | Join/leave/reconnect, player identity and content compatibility |
| **P151** | **Two Pickaxes** | INTEGRATION | P04; P12–P17; P31; P149–P150 | Cooperative mining/building/items/crafting/combat without duplication/races |
| **P152** | **Many Hands Build Faster** | COOL-PULL / INTEGRATION | P42–P48; P95; P149–P151 | Cooperative settlement play and contribution/permission handling |
| **P153** | **The World Doesn't Pause** | FOUNDATION / INTEGRATION | P55; P63; P92; P114; P126; P148–P152 | Living simulation remains coherent with players in different regions/realms |
| **P154** | **Forge Together** | FORGE-FIRST / COOL-PULL | P127–P137; P149–P153 | Collaborative Forge review/edit/test workflows with authority controls |
| **P155** | **The Sealed Grimoire** | FORGE-FIRST / FOUNDATION | P136; P149 | Protected mod/content-pack runtime, compatibility and safe namespaces |
| **P156** | **The Workshop Gates** | COOL-PULL | P136; P155 | Community content import/export/sharing metadata and validation state |
| **P157** | **A Realm for Everyone** | FOUNDATION | P149–P156 | Dedicated server administration, backups, permissions, packs, logs and recovery |
| **P158** | **The Great Build** | INTEGRATION / COOL-PULL | P149–P157 | Full multiplayer certification journey across settlement, Forge, automation, vessel and realm systems |

## ARC XVIII — TEMPERING LEYFORGE

| P | Name | Class | Primary prerequisites | Parent production output / proof |
| --- | --- | --- | --- | --- |
| **P159** | **The Measure of the World** | FOUNDATION | P158; representative complete game | Production performance observatory, budgets and representative benchmark worlds |
| **P160** | **A World for Every Machine** | FOUNDATION | P159 | Graphics and simulation scalability that preserve authoritative meaning |
| **P161** | **Rules Before Birth** | FOUNDATION / FORGE-FIRST | P160; all gameplay systems known | Final Create Realm/world configuration system |
| **P162** | **The Gatehouse** | COOL-PULL | P155–P157; P161 | Final main menu, world management, multiplayer/server/Forge/content entry points |
| **P163** | **Every Hand, Every Eye** | FOUNDATION | All prior UX/content systems; P160–P162 | Whole-game and Forge accessibility finalisation |
| **P164** | **A Thousand Tongues** | FOUNDATION | P130; P162–P163 | Localisation across game, Forge, content packs, dialogue and UI reflow |
| **P165** | **The Clear Glass** | INTEGRATION | P162–P164 plus authoritative state contracts | Final UI/UX/player-trust pass: reasons, truth, consistency and polish |
| **P166** | **Nothing Lost** | FOUNDATION / COOL-PULL | P05; P136; P155–P165 | Save migration, backup, recovery and content-version resilience |
| **P167** | **The Living Version** | FOUNDATION | P136; P155–P166 | Updates, patching, rollback, schemas, packs, mods, servers and lifecycle |
| **P168** | **The Watchful Lantern** | FOUNDATION | P132–P133; P157; P159–P167 | Diagnostics, crash/support bundles, security validation and repair tooling |
| **P169** | **The Shipping Forge** | FOUNDATION | P162–P168 | Distribution, packaging, release branches, platform services and server/Forge builds |
| **P170** | **Tempered Ley** | INTEGRATION / COOL-PULL | P159–P169 | Whole-game soak/stress/regression/accessibility/scalability/release certification; non-AI game complete |

## ARC XIX — THE MIND IN THE MACHINE

| P | Name | Class | Primary prerequisites | Parent production output / proof |
| --- | --- | --- | --- | --- |
| **P171** | **The Iron Boundary** | FOUNDATION | P170 | AI constitution: optional intelligence cannot own authoritative world truth |
| **P172** | **The Listener at the Anvil** | FORGE-FIRST | P128; P171 | Natural-language Forge intent parsed into an inspectable creation plan |
| **P173** | **The Apprentice Smith** | FORGE-FIRST / COOL-PULL | P127–P137; P171–P172 | AI operates existing Forge capabilities and produces normal editable/validated source |
| **P174** | **The Librarian in the Walls** | FORGE-FIRST | P129; P132–P135; P171–P173 | AI Forge assistant/troubleshooter over real dependency/diagnostic data |
| **P175** | **The Companion Flame** | COOL-PULL | P138–P148; P171 | Optional player companion constrained by real knowledge state |
| **P176** | **Whispers of the Hearth** | COOL-PULL | P35; P45; P96; P138–P148; P171 | Bounded NPC/settlement intelligence proposes within deterministic simulation rules |
| **P177** | **The World That Wonders** | COOL-PULL | P140–P148; P171 | World Mind proposes events/stories through authoritative Quest/Event validation |
| **P178** | **Dreams of the Forge** | EXPANSION / EXPERIMENTAL | P137; P148; P170–P177 | Experimental AI World Mode for bounded simulation/Forge experiments |
| **P179** | **The Mind in the Machine** | INTEGRATION | P171–P178 | AI certification including AI-off, failures, privacy/permission and no-authority regressions |

## ARC XX — THE FIRST FLAME

| P | Name | Class | Primary prerequisites | Parent production output / proof |
| --- | --- | --- | --- | --- |
| **P180** | **A World That Teaches** | FOUNDATION | P170; P179 optional AI already bounded | Tutorial World contract, coverage map and optional guidance modes |
| **P181** | **The Valley of Beginnings** | FORGE-FIRST / COOL-PULL | P137; P180 | Handcrafted Tutorial World built as a real packaged Leyforge world through final Forge |
| **P182** | **First Footprints** | COOL-PULL | P181; P12–P17 | Survival/gathering/crafting/building learning journey using real systems |
| **P183** | **A Fire Shared** | COOL-PULL | P181; P38; P48; P63 | NPC/settlement learning journey with real work, needs and construction |
| **P184** | **Gears in the Hills** | COOL-PULL | P181; P62–P63 | Automation learning journey through a real machine/logistics chain |
| **P185** | **When Stone Begins to Glow** | COOL-PULL | P181; P64–P72 | Magic learning journey, including optional Flux-powered pipe-organ secret |
| **P186** | **Beyond the Safe Road** | COOL-PULL | P181; P73–P82 | Exploration/combat/map/dungeon learning journey |
| **P187** | **The Harbour Beyond** | COOL-PULL | P181; P103–P114 | Maritime showcase and usable vessel journey |
| **P188** | **The Door Between Worlds** | COOL-PULL | P181; P115–P126 | Controlled portal/realm showcase without spoiling full cosmology |
| **P189** | **Secrets Beneath the Lessons** | COOL-PULL | P181–P188 | Secrets, puzzles, hidden routes, development history/easter eggs and curiosity rewards |
| **P190** | **Many Hands at the First Fire** | INTEGRATION | P158; P180–P189 | Multiplayer Tutorial World certification with individual guidance and shared consequences |
| **P191** | **The World Is Yours** | COOL-PULL | P180–P190 | Graduation without expulsion: Tutorial World remains a normal persistent Leyforge world |
| **P192** | **THE FIRST FLAME** | FINAL INTEGRATION GATE | P01–P191; PROD-17 certification | Final production milestone proving complete runtime, Forge, content, multiplayer, release systems and optional AI in one adventure |

# 08. Critical Dependency Chains

The numeric roadmap is broad. The following chains expose several of the most important vertical dependencies that must remain coherent even when child work is parallelised.

## 08.1 World truth chain

```text
P01 Production bootstrap
→ P02 Voxel world
→ P04 Authoritative edits
→ P05 Persistence
→ P73 Regional worldgen
→ P103 Production water
→ P115 Realm persistence
→ P149 Multiplayer authority
→ P166 Migration/recovery
→ P192 Final world certification
```

A later world system may not invalidate the truth established by an earlier one. For example, multiplayer or migration cannot reinterpret a voxel edit differently merely because networking/release work arrived later.

## 08.2 Forge language chain

```text
P06 Forge Core
→ P07 Stable identity/registries
→ P08–P10 Voxel/material/test foundations
→ specialist Forge slices across Arcs III–XIV
→ P127 Unified Forge
→ P128 Creation Journey Engine
→ P129 Dependency/Composition Graph
→ P132 Universal Validation
→ P133 Test Laboratory
→ P136 Package Forge
→ P137 Forge Unbound proof
→ P154 Collaborative Forge
→ P155 Protected content-pack runtime
→ P173 AI-assisted Forge
→ P181 Tutorial World authored through final Forge
```

The final Forge is therefore not a late rewrite of separate tools. It is the consolidation and orchestration of authoring services proven throughout production.

## 08.3 Living civilisation chain

```text
P32 NPC identity
→ P35 behaviour/work planning
→ P36 needs
→ P38 founding camp
→ P39–P48 settlement construction/growth
→ P49–P55 professions and autonomous production
→ P63 working town
→ P83–P92 regional economy
→ P93–P102 politics/conflict
→ P138–P148 memory/history
→ P153 multiplayer living simulation
```

NPCs are never reduced to construction helpers. Builder is a real profession in P50; gathering, crafting, hauling, trade, governance, military, maritime and other professions extend the same underlying work contract.

## 08.4 Composition / connection chain

```text
P39 semantic structures
→ P41 semantic markers/zones
→ P57 typed ports
→ P61 signals/logic
→ P65 runes
→ P70 rituals
→ P72 emergent pipe-organ proof
→ P107 vessel contract
→ P115 portal contract
→ P129 universal composition graph
```

This chain protects one of Leyforge's defining sandbox goals:

> **What happens if I connect these things?**

The programme should prefer reusable semantic connection primitives over bespoke one-off interaction systems.

## 08.5 Player knowledge chain

```text
P37 dialogue knowledge visibility
→ P81 cartographic discovery
→ P138 formal knowledge contract
→ P139 Codex Forge
→ P140 Quest/Event Forge
→ P144 information propagation
→ P147 Chronicle
→ P175 optional companion knowledge boundary
→ P180 tutorial knowledge/guidance model
```

Knowledge must remain distinct from omniscient world truth.

## 08.6 Route chain

```text
P46 settlement roads
→ P54 internal hauling
→ P87 regional routes
→ P88 caravans
→ P90 regional freight
→ P111 maritime routes
→ P115 portal/realm transport
→ P125 cross-realm logistics
```

Higher-level systems may share the concept **origin → destination → capacity → cost → danger → ownership → cargo**, while domain-specific route implementations remain specialised.

## 08.7 Permission / jurisdiction chain

```text
P44 household/property ownership
→ P53 settlement stock ownership/reservations
→ P95 government/law + universal permission contract
→ P97 territory/jurisdiction
→ P116 portal permissions
→ P149 multiplayer authority
→ P152 cooperative settlement permissions
→ P155 server/content-pack permissions
```

Do not implement unrelated warehouse, town, faction, ship, portal and multiplayer permission systems when one shared contract with domain extensions can safely express them.

## 08.8 Release chain

```text
P158 multiplayer ecosystem
→ P159 measurement
→ P160 scalability
→ P161 world configuration
→ P162 front end
→ P163 accessibility
→ P164 localisation
→ P165 final UX trust
→ P166 migration/recovery
→ P167 updates
→ P168 diagnostics/security
→ P169 shipping
→ P170 non-AI certification
```

P170 is the hard gate into AI.

## 08.9 AI-last chain

```text
P170 Complete non-AI game + Forge
→ P171 AI authority boundary
→ P172 intent parsing
→ P173 Forge operation
→ P174 troubleshooting
→ P175 companion
→ P176 NPC/settlement intelligence
→ P177 World Mind
→ P178 experimental world mode
→ P179 AI-off / failure certification
```

No earlier P may acquire a hidden dependency on P171–P179.

## 08.10 Final Tutorial World chain

```text
P180 Tutorial contract
→ P181 real Forge-authored world
→ P182 survival/building
→ P183 civilisation
→ P184 automation
→ P185 magic
→ P186 exploration/combat
→ P187 maritime
→ P188 realms
→ P189 secrets/history
→ P190 multiplayer
→ P191 persistent graduation
→ P192 THE FIRST FLAME
```

The Tutorial World uses real systems. Tutorial-only fake furnaces, fake settlement construction or fake machines are prohibited where the production system can teach the real mechanic.

---

# 09. Concurrency Rules

## 09.1 Safe concurrency

Child work may proceed concurrently when all of the following are true:

1. every shared hard prerequisite is already stable enough for the work;
2. ownership boundaries are explicit;
3. branches/tasks do not independently redefine the same schema, registry family or authority;
4. tests can isolate and then integrate the changes;
5. the active Project Brain/task/handoff state permits the work;
6. concurrency does not force downstream teams to guess unresolved upstream contracts.

## 09.2 Unsafe concurrency examples

Do not concurrently:

- define a semantic port schema in two different machine/magic tasks;
- rewrite the same save record in separate slices without an owning migration plan;
- build mass creature content while the Creature Forge source schema is still unstable;
- produce multiple realm packs while Realm Forge's required source/bake contract is still being changed incompatibly;
- add AI behaviours while the authoritative action/permission boundary is unresolved.

## 09.3 Parallel content after proof

Once a Forge/runtime family passes its representative vertical slice, content production may fan out by family.

Examples:

- after P31, more creature/equipment families may be produced under the proven entity pipeline;
- after P48, additional settlement blueprints can expand under the proven construction/planner contracts;
- after P62/P63, machine families can expand under the proven ports/power/logistics system;
- after P118, realm content may parallelise where shared Realm Forge contracts are frozen enough and realm-specific authorities do not overlap.

Parallelism is a reward for stable contracts, not a substitute for them.

---

# 10. Child-Slice Decomposition Law

A parent P may be split into child slices whenever one or more of the following is true:

- implementation spans multiple owning subsystems;
- more than one independently-testable risk exists;
- one child requires a separate proof/benchmark;
- content production would otherwise hide technical completion;
- the parent would exceed a practical review/task size;
- multiple workers/agents can safely operate under explicit ownership.

Recommended identity:

```text
P108
  P108-A  Vessel Forge source schema and creation-journey contract
  P108-B  Hull/compartment authoring tools
  P108-C  propulsion/steering/station authoring
  P108-D  damage/flood/fire states
  P108-E  validation and Sea Trial
  ...
```

Child IDs are examples only until allocated by the production registry/governance process.

A child slice may not independently claim that its parent is complete.

Parent completion requires:

1. all required children pass;
2. integration evidence passes;
3. unresolved blockers are zero or formally accepted/deferred;
4. documentation/registry status is reconciled;
5. the parent exit gate is explicitly recorded.

---

# 11. Integration Slice Doctrine

The following parent slices are especially important integration proofs and should receive deliberate end-to-end scenarios rather than only unit-level acceptance:

- P17 — Fire and Iron
- P24 — Breath of the World
- P31 — Trial by Blood
- P38 — Three Souls and a Fire
- P48 — From Campfire to Hamlet
- P55 — While You Were Away
- P62 — The First Factory
- P63 — A Town That Works
- P71 — The Arcane Engine
- P72 — The Impossible Instrument
- P82 — The First Expedition
- P90 — Warehouse to Warehouse
- P92 — Roads of Gold & Dust
- P102 — Crowns & Consequences
- P109 — Launch Day
- P114 — Stormbound
- P118 — The First Crossing
- P125 — Trade Between Worlds
- P126 — Seven Worlds, One Ley
- P137 — The Forge Unbound
- P146–P148 — persistent-history integration
- P151–P158 — multiplayer integration sequence
- P170 — whole non-AI game certification
- P179 — AI architecture certification
- P190–P192 — final Tutorial World certification.

A failure here is valuable evidence. Integration work must not be forced green by weakening the intended cross-system truth.

---

# 12. High-Risk Proof Routing

Historical PRD/prototype evidence reduces uncertainty but does not eliminate production proof.

The following risk families deserve explicit child proof tasks when their parent slices are planned:

- deterministic worldgen under varying generation order/scheduling;
- large voxel-edit bursts and chunk lifecycle;
- caves/deep geology;
- production water and bounded flow;
- moving voxel vessels;
- simulation LOD transitions;
- NPC navigation under terrain edits and unloaded areas;
- large automation/signal graphs;
- save migration and missing-content recovery;
- multiplayer authority under simultaneous edits/transactions;
- realm transfer and cross-world persistence;
- Forge source/bake determinism and dependency invalidation;
- low-end scalability without semantic loss.

PROD-06 and the detailed Arc documents define exact evidence forms.

---

# 13. ProductionRegistry Minimum Schema

The machine-readable ProductionRegistry should represent at least:

```yaml
production_slice_id: P001
name: The Empty Canvas
arc_id: ARC_I
classification:
  - FOUNDATION
status: UNASSESSED

authority:
  primary_sources: []
  resolved: false

dependencies:
  hard: []
  forge: []
  integration: []
  soft: []

child_slices: []

entry_gate:
  requirements: []

acceptance:
  automated: []
  manual: []
  performance: []
  evidence_refs: []

ownership:
  runtime_domains: []
  forge_domains: []
  content_domains: []

handoff:
  unlocks: []
  blocked_by: []

history:
  created_version: PROD-02_v0.1
  supersedes: []
```

Exact serialization and repository location are owned later by PROD-03/06 and the Project Brain integration decision.

---

# 14. Detailed-Document Routing

The roadmap is expanded through the remaining PROD set as follows:

| Document | Ownership |
| --- | --- |
| **PROD-03** | Leyforge Runtime Engineering Architecture |
| **PROD-04** | The Forge Engineering & Creation Journey Architecture |
| **PROD-05** | Universal Simulation Primitives & Cross-System Contracts |
| **PROD-06** | Production Governance, Task Contracts & Evidence Standard |
| **PROD-07** | Arcs I–II — P01–P11 |
| **PROD-08** | Arcs III–IV — P12–P24 |
| **PROD-09** | Arcs V–VI — P25–P38 |
| **PROD-10** | Arcs VII–VIII — P39–P63 |
| **PROD-11** | Arcs IX–X — P64–P82 |
| **PROD-12** | Arcs XI–XII — P83–P102 |
| **PROD-13** | Arcs XIII–XIV — P103–P126 |
| **PROD-14** | Arcs XV–XVI — P127–P148 |
| **PROD-15** | Arcs XVII–XVIII — P149–P170 |
| **PROD-16** | Arcs XIX–XX — P171–P192 |
| **PROD-17** | Master Verification, Certification & Production Handoff Register |

No detailed Arc document may silently renumber a P-slice. If decomposition is required, allocate child identity beneath the parent.

---

# 15. Roadmap Acceptance Checklist

PROD-02 is ready for owner lock when the owner agrees that:

- [ ] the twenty Arc names/order are correct;
- [ ] P01–P192 numbering/names are preserved;
- [ ] parent slices are capability boundaries rather than assumed one-task units;
- [ ] Forge-first ordering is represented without placing Forge before undefined contracts;
- [ ] Structure/Vessel composition uses registered content rather than hidden duplicate definitions;
- [ ] Builder is explicitly part of the profession model rather than a special construction-only NPC mode;
- [ ] autonomous settlement work includes gathering, crafting, hauling, storage and future-project stocking;
- [ ] the typed-port/signal/composition direction is preserved;
- [ ] the Flux-powered voxel pipe organ remains a formal emergent-composition proof;
- [ ] realms remain production expansions of one shared Realm Forge/runtime architecture rather than bespoke games;
- [ ] Unified Forge is built from shared specialist services rather than replacements/duplicates;
- [ ] knowledge, permissions, routes, transactions, signals, state, history and composition are routed into PROD-05;
- [ ] multiplayer comes after complete authoritative single-player systems but uses compatible authority principles;
- [ ] release hardening is a hard prerequisite for AI;
- [ ] AI remains optional and cannot own authoritative world truth;
- [ ] the Tutorial World remains the final Arc and uses real systems;
- [ ] P192 remains the final production milestone;
- [ ] PROD-03 through PROD-17 ownership is clear.

---

# 16. Proposed Lock Statement

If owner-approved, lock the following statement:

> **PROD-02 — LEYFORGE MASTER PRODUCTION ROADMAP & DEPENDENCY ATLAS — v0.1**
>
> Leyforge production is organised into twenty ordered production Arcs containing P01–P192 parent capability slices. Numeric order is the default production spine; explicit prerequisites define hard dependency. Thin contracts precede specialist authoring, specialist Forge capabilities precede mass content, runtime capabilities are proven through representative content, and major subsystem families close through integration slices before later systems rely on them. Parent slices may decompose into governed child work without renumbering or weakening their acceptance gate. Safe concurrency is permitted only under stable contracts and explicit ownership. The non-AI game and Forge must reach release-hardened completeness before optional AI features are admitted. The programme ends at P192 — THE FIRST FLAME, where the complete production game and creator platform are certified through a real handcrafted Tutorial World.

---

# 17. Next Document

After PROD-02 owner acceptance/reconciliation, continue to:

> **PROD-03 — Leyforge Runtime Engineering Architecture**

PROD-03 translates the roadmap's runtime dependencies into the production architecture for Godot 4.7.2 + Zylann, including ownership boundaries, world identity, coordinates, scheduling, deterministic simulation, streaming, persistence, entities, navigation, automation, fluids, realms, multiplayer authority, registries, performance and diagnostics.

---

**End of PROD-02 v0.1 — Master Production Roadmap & Dependency Atlas Candidate**
