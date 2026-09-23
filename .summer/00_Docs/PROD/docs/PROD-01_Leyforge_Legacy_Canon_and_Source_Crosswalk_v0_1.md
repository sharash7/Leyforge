# LEYFORGE PRODUCTION PROGRAMME

## PROD-01 — Legacy Canon & Source Crosswalk

**Document ID:** PROD-01  
**Title:** Leyforge Legacy Canon & Source Crosswalk  
**Version:** v0.1  
**Date:** 21 September 2026  
**Status:** **DRAFT FOR OWNER REVIEW — SOURCE CROSSWALK CANDIDATE**  
**Project:** Leyforge  
**Product context:** Ley Realms / The Forge  
**Programme:** PROD — Detailed Production Plan & Implementation Handoff  
**Constitutional parent:** PROD-00 — Production Constitution, Authority & Scope  
**Primary purpose:** Preserve, classify and route the existing Leyforge corpus into the P01–P192 production programme without silent loss, duplication or accidental reactivation of superseded assumptions.  
**Primary downstream consumers:** PROD-02 through PROD-17, ProductionRegistry, Project Brain, Codex/coding agents, Forge implementation, runtime implementation and validation/CI.

---

# 00. Executive Crosswalk Statement

Leyforge is not beginning production from an empty folder of ideas. It is beginning production with a large, layered source corpus containing gameplay canon, content canon, Forge design, art direction, technical evidence, registries, governance and historical prototype proof.

PROD-01 exists so that the new production programme does **not** solve the same problems again and does **not** lose capabilities merely because the previous documents were written before the final P01–P192 production sequence existed.

The governing rule is:

> **Inherit deliberately. Supersede explicitly. Preserve evidence. Never let chronology alone decide authority.**

A newer file is not automatically allowed to erase an older capability. An older file is not automatically allowed to override a later specialist owner. The correct production source is determined by **ownership, lock status, explicit supersession, reconciliation status and scope**.

This document therefore classifies every major source family into one or more of the following production roles:

- semantic/gameplay authority;
- content authority;
- presentation authority;
- authoring/Forge authority;
- engineering/governance authority;
- evidence/prototype authority;
- migration/compatibility evidence;
- historical/supporting source;
- retained future constraint;
- source requiring verification before use.

---

# 01. Crosswalk Objectives

PROD-01 shall:

1. identify the major source families retained by the project;
2. record what each source family owns;
3. record what each source family does **not** own after later reconciliation;
4. route each source family into the relevant PROD documents and production Arcs;
5. preserve historical POC proof without importing obsolete architecture;
6. preserve current stable/canonical identities while respecting FCC-13 migration authority;
7. prevent Set 24 or older realm material from reactivating content removed or superseded by the FCC programme;
8. preserve Sets 21/22 Forge capabilities while allowing PROD-04 to reconcile and extend their engineering shape;
9. preserve ART-00–10 as final presentation-production authority rather than rewriting those rules inside PROD;
10. preserve the final reconciled Sets 27–30 ownership boundaries;
11. identify unresolved source-manifest gaps instead of inventing document contents;
12. provide PROD-02 with a clean source map for all P01–P192 parent slices.

---

# 02. Source Treatment Codes

| Code | Meaning |
| --- | --- |
| AUTHORITATIVE | Current owning source for the stated domain. Downstream production consumes it; contradiction requires formal amendment. |
| SPECIALIST-OWNER | Later/specialist source owns a bounded domain previously described more generally elsewhere. |
| INHERIT | Production retains the capability/rule and implements it through current architecture. |
| INTERFACE | Older/general source retains intent but consumes another system through a typed interface instead of duplicating its truth. |
| SUPPORTING | Useful context or detail where not superseded; cannot override current owner. |
| EVIDENCE | Prototype/research/benchmark evidence only; proves or informs feasibility/behaviour but does not define final architecture. |
| MIGRATION | Used to map historical IDs/assets/saves into current canonical identity. |
| ARCHIVED-POC | Fixed POC scenario identity/placement/script is retired from ordinary production. |
| SUPERSEDED-TECH | Old engine/tool implementation direction is replaced while preserving engine-agnostic requirements. |
| FUTURE-CONSTRAINT | Later-roadmap requirement retained so current architecture does not block it. |
| VERIFY | Source exists but exact contents/authority require verification before being used as production truth. |

---

# 03. Global Authority Routing

The production authority relationship established by PROD-00 is preserved here:

```text
LOCKED GAMEPLAY / CONTENT CANON
Foundation 00–20 + reconciled specialist sets + FCC
        ↓
FINAL PRESENTATION AUTHORITY
ART-00 through ART-10
        ↓
PROD PROGRAMME
ordering, contracts, gates, implementation handoff
        ↓
ENGINEERING GOVERNANCE / ACCEPTED ADRs
ENG-GOV, B-OPS, current repository architecture decisions
        ↓
FORGE SOURCES + IMPLEMENTATION
editable sources, definitions, registries, code, manifests
        ↓
VALIDATED / BAKED RUNTIME PRODUCTS
        ↓
LEYFORGE RUNTIME
```

The Project Brain remains the navigation/status/handoff/history layer alongside this chain.

### Conflict rule

When two sources appear to disagree, production must classify the disagreement before acting:

- **meaning/content conflict** → current owning gameplay/FCC authority wins;
- **presentation conflict** → ART authority wins for presentation;
- **implementation conflict** → current accepted engineering architecture/ADR decides how to satisfy the requirement;
- **historical POC conflict** → historical source is evidence only unless rebound;
- **specialist ownership conflict** → the later explicitly reconciled specialist owner controls its domain, while the earlier source retains only the intent/interfaces it still owns;
- **unresolved conflict** → stop, record and route; do not silently guess.

---

# 04. Reconciled Foundation Corpus — Documents 00–20

The current reconciled Foundation package is the preferred Foundation baseline over the original v0.1 files where its scope applies. It explicitly preserves reusable gameplay capabilities while retiring fixed POC scenario identity and obsolete engine assumptions.

| Doc | Current reconciled title | Production role | Treatment |
| --- | --- | --- | --- |
| 00 | Master Game Design Bible | Production vision, pillars, player fantasy, sandbox identity, cross-system promises. | AUTHORITATIVE / INHERIT |
| 01 | Core Gameplay Loop | Minute-to-minute and long-form gameplay loop; sandbox-first progression and player choice. | AUTHORITATIVE / INHERIT |
| 02 | Player Progression System | Capability progression, knowledge/research, skills, magic/automation access and progression philosophy. | AUTHORITATIVE / INHERIT |
| 03 | Canonical Blocks Registry Framework and Production Families | Block identity/families, canonical block semantics, registry-facing production rules. | AUTHORITATIVE / INHERIT |
| 04 | Canonical Items Registry, Inventory, Equipment and Production Families | Item identity, inventory/equipment projections, canonical item families and single-definition relationships. | AUTHORITATIVE / INHERIT |
| 05 | Canonical Crafting Recipe Registry and Transformation System | Recipes, transformations, providers, crafting semantics and canonical recipe relationships. | AUTHORITATIVE / INHERIT |
| 06 | Canonical Resource Progression, Material Ecology and Capability Pathway System | Resource ladder, provenance, material capability progression and production uses. | AUTHORITATIVE / INHERIT |
| 07 | NPC Village, Persistent People and Settlement Operations System | Persistent NPCs, jobs, schedules, households, warehouses, settlement operations and near/far simulation. | AUTHORITATIVE / INHERIT |
| 08 | Automation, Industry, Logistics and Network Control System | Machines, logistics, power/control, resource-conserving automation and settlement integration. | AUTHORITATIVE / INHERIT |
| 09 | Magic, Mana, Spellcraft, Runes, Rituals and Civilisation Magic System | Flux/mana, spells, runes, rituals, wards, portals and magical infrastructure. | AUTHORITATIVE / INHERIT |
| 10 | Creatures, Monsters, Wildlife and Ecology Runtime System | Creature runtime, ecology, behaviour, encounters, spawning and persistent consequences. | AUTHORITATIVE / INHERIT |
| 11 | Biomes, World Generation and Procedural World Assembly System | Seed-deterministic worldgen, biomes, ecology placement, structures and procedural world assembly. | AUTHORITATIVE / INHERIT |
| 12 | Structures, Landmarks, Routes and Persistent Structure Runtime System | Structure runtime identity, dynamic states, damage/repair/occupation and world placement. | AUTHORITATIVE / INHERIT |
| 13 | Peoples, Cultures, Factions, Governments and Civilisation Identity System | Culture/faction/government identity, territory, law, diplomacy and civilisation semantics. | AUTHORITATIVE / INHERIT |
| 14 | Dimensions, Realms, Realm Travel and Interdimensional World System | Persistent realms, portals, travel, realm rules and cross-realm consequences. | AUTHORITATIVE / INHERIT |
| 15 | Quest, Event, History and World Consequence System | Authored/emergent quests, events, world-state consequences and persistent history. | AUTHORITATIVE / INHERIT |
| 16 | Combat, Gear, Defence and Tactical Conflict System | Combat actions, damage, gear, defence, raids, war-facing combat interfaces and aftermath. | AUTHORITATIVE / INHERIT |
| 17 | UI, UX, Accessibility, Menus, HUD, World Configuration and Player-Trust System | Interaction architecture, accessibility, settings, menus, feedback, maps, codex and trustworthy UI. | AUTHORITATIVE / INHERIT |
| 18 | Godot/Summer Engine Technical Implementation Plan | Historical/reconciled technical requirements and engine-agnostic production constraints; engineering details defer to current PROD/ADRs. | AUTHORITATIVE / INHERIT |
| 19 | Settlement Growth, District Planning and Player Voxel Blueprint System | Settlement growth, parcels/districts, shared blueprint core, player blueprint rules and NPC adoption. | AUTHORITATIVE / INHERIT |
| 20 | Buildings, Facilities, Functional Services, Construction and Settlement Project System | Seven-needs building/service capability model, staged construction, settlement project authority and structure services. | AUTHORITATIVE / INHERIT |

## 04.1 Foundation preservation doctrine

The Foundation reconciliation register establishes a rule that PROD adopts directly:

> **Retire the POC scenario, never automatically retire a gameplay capability merely because the POC used it.**

Therefore named/fixed POC arrangements may be archived while their reusable mechanics remain active production requirements. Examples include persistent NPCs, settlement warehouses, staged NPC construction, raids and aftermath, automation, practical magic, caves/ruins, save continuity, simulation LOD and seed-driven world discovery.

## 04.2 Foundation technical treatment

Document 18's current reconciled engine-agnostic requirements remain valuable, but detailed runtime architecture is owned downstream by PROD-03 plus accepted ADRs. Any stale Unreal-era or transitional Summer-era implementation technique is **SUPERSEDED-TECH** unless current engineering explicitly adopts it.

---

# 05. Set 20 Companion Corpus — Settlement Functional Authority

The companion documents refine the universal settlement-service model under Documents 19 and 20. Production must not flatten these into generic building prefabs: their purpose is to describe **function, services, semantics, construction, state and integration**.

| Doc | Title | Treatment |
| --- | --- | --- |
| 20A | Housing, Provisions, Health and Community | SPECIALIST-OWNER / INHERIT |
| 20B | Work, Extraction, Crafting, Trade and Education | SPECIALIST-OWNER / INHERIT |
| 20C | Governance, Safety, Defence, Justice and Emergency Services | SPECIALIST-OWNER / INHERIT |
| 20D | Storage, Roads, Transport, Logistics and Utilities | SPECIALIST-OWNER / INHERIT |
| 20E | Magic, Automation, Industry, Power and Dimensions | SPECIALIST-OWNER / INHERIT |
| 20F | Districts, Complexes, Megaprojects and Wonders | SPECIALIST-OWNER / INHERIT |
| 20G | Culture, Faction, Biome and Realm Building Packs | SPECIALIST-OWNER / INHERIT |
| 20H | Detailed Building Catalogue, Stage Matrix and Production Backlog | SPECIALIST-OWNER / INHERIT |

### Production routing

- 20A primarily feeds Arcs VI–VII and XVI where households, provisions, health/community and settlement life matter.
- 20B feeds Arcs VI–VIII, XI and XVI for work, extraction, crafting, education and knowledge services.
- 20C feeds Arc XII and settlement safety/governance interfaces.
- 20D feeds Arcs VII–VIII, XI and XIII for storage, roads, utilities, freight and ports.
- 20E feeds Arcs VIII–IX and XIV for magic, automation, advanced industry and dimensional infrastructure.
- 20F feeds late settlement/civilisation growth, districts, complexes, megaprojects and wonders.
- 20G feeds culture/faction/biome/realm composition without replacing the lower-level functional definitions.
- 20H is a production/catalogue bridge and remains useful for coverage/backlog traceability, subject to current canonical registries.

---

# 06. Document Set 21 — Voxel Asset Forge Baseline

Set 21 is a major authoring baseline. PROD-04 may reconcile, extend and re-implement it, but should not discard its proven concepts merely to rename them.

| Doc | Title | Treatment |
| --- | --- | --- |
| 21A | Voxel Asset Forge Core System | SPECIALIST-OWNER / INHERIT |
| 21B | Voxel Modelling, Texturing and Material Authoring | SPECIALIST-OWNER / INHERIT |
| 21C | Animation, Effects and Runtime Visual States | SPECIALIST-OWNER / INHERIT |
| 21D | Asset Overrides, Variants and Registry Integration | SPECIALIST-OWNER / INHERIT |
| 21E | Forge UI/UX and Creator Workflow | SPECIALIST-OWNER / INHERIT |
| 21F | Forge Technical Implementation Plan | SPECIALIST-OWNER / INHERIT |
| 21G | Visual Overhaul and Asset Migration Plan | SPECIALIST-OWNER / INHERIT |

### Preserved Set 21 concepts

Production explicitly preserves, where still compatible with current canon:

- editable source versus baked/runtime separation;
- voxel/compound authoring modes;
- Material DNA and palette-role concepts;
- 32×32 surface authoring language;
- deterministic variants;
- animation/effects/runtime visual states;
- stable sockets/events;
- inheritance/override/variant resolution;
- registry integration;
- Forge UI/UX creator workflows;
- validation/test-lab direction;
- migration planning.

PROD-04 expands this into the unified Forge architecture, shared services and guided Creation Journey Engine.

---

# 07. Document Set 22 — Entity & Blueprint Forge Expansion

Set 22 is the primary pre-PROD authoring baseline for entities, rigs, animation and blueprint/structure tooling.

| Doc | Title | Treatment |
| --- | --- | --- |
| 22A | Forge Entity and Blueprint Expansion Core System | SPECIALIST-OWNER / INHERIT |
| 22B | Entity Model Taxonomy, Anatomy and Body Architecture | SPECIALIST-OWNER / INHERIT |
| 22C | Humanoid Player Character and NPC Creator | SPECIALIST-OWNER / INHERIT |
| 22D | Creature, Mob, Monster and Boss Model Creator | SPECIALIST-OWNER / INHERIT |
| 22E | Skeletons, Rigging, Joints, IK and Attachment Systems | SPECIALIST-OWNER / INHERIT |
| 22F | Entity Animation, Locomotion, Combat and Visual States | SPECIALIST-OWNER / INHERIT |
| 22G | Character Customisation, Equipment, Variants and Visual Inheritance | SPECIALIST-OWNER / INHERIT |
| 22H | Entity Gameplay Integration, Hitboxes, AI Markers and Simulation LOD | SPECIALIST-OWNER / INHERIT |
| 22I | Blueprint Forge — Building, Structure and World Blueprint Authoring | SPECIALIST-OWNER / INHERIT |
| 22J | Unified Forge UI/UX and Creator Workflow | SPECIALIST-OWNER / INHERIT |
| 22K | Forge Entity and Blueprint Technical Implementation Plan | SPECIALIST-OWNER / INHERIT |
| 22L | Entity and Blueprint Visual Production and Migration Plan | SPECIALIST-OWNER / INHERIT |

### Critical architectural inheritance

PROD retains the Set 22 separation between:

- entity taxonomy/body architecture;
- humanoid authoring;
- creature authoring;
- rigging/IK/attachments;
- animation/locomotion/combat state authoring;
- equipment/variant inheritance;
- gameplay markers/hitboxes/simulation LOD;
- blueprint/structure authoring;
- unified Forge UI/workflow;
- technical bake/runtime products;
- production/migration.

The new PROD roadmap extends these ideas into NPC Forge, Machine Forge, World/Biome/Dungeon/Realm Forge, Vessel Forge, Logic Forge, Music Lab and other specialist workflows, all orchestrating shared Forge services rather than duplicating them.

---

# 08. Document Set 23 — Retained Archive, Manifest Verification Required

The project contains the archive `23-A-J.7z`. The current execution environment can confirm that it is a valid 7-Zip archive, but does not currently provide a 7z extractor capable of enumerating its internal filenames.

**Treatment:** `VERIFY`.

PROD-01 therefore does **not** invent titles or authority for Set 23. Before PROD-02 is finally locked, Set 23 shall be enumerated and classified against the same rules in this crosswalk. Until then:

- Set 23 is retained;
- nothing in PROD may claim Set 23 was discarded;
- nothing may cite an assumed Set 23 rule as production authority without reading the actual source;
- if Set 23 contains Presentation Forge or other authoring authority, that content must be routed into PROD-04/ART rather than duplicated.

---

# 09. Document Set 24 — World Content Atlas

Set 24 remains a major historical/supporting world-content source, but current FCC realm canon supersedes it where the two conflict. ART-03 explicitly adopts this same rule.

| Doc | Title | Treatment |
| --- | --- | --- |
| 24A | Foundations, World Topology and Procedural Content Rules | SUPPORTING; FCC wins where superseded |
| 24B | Overworld Regions, Climate and Surface Biomes | SUPPORTING; FCC wins where superseded |
| 24C | Oceans, Coasts, Islands, Skylands, Underground and Special Overworld Biomes | SUPPORTING; FCC wins where superseded |
| 24D | Dimensions, Realm Structure and Realm Biome Atlas | SUPPORTING; FCC wins where superseded |
| 24E | Peoples, Cultures, Factions and Settlement Atlas | SUPPORTING; FCC wins where superseded |
| 24F | Wildlife, Creatures, Monsters and Ecology Atlas | SUPPORTING; FCC wins where superseded |
| 24G | Dungeons, Ruins, Lairs and Megadungeons Atlas | SUPPORTING; FCC wins where superseded |
| 24H | Bosses, Titans, Siege Threats and Realm Guardians Atlas | SUPPORTING; FCC wins where superseded |
| 24I | Structures, Landmarks, Routes, Wonders and World Infrastructure Atlas | SUPPORTING; FCC wins where superseded |
| 24J | Resources, Loot, Relics, Trade and Material Ecology Atlas | SUPPORTING; FCC wins where superseded |
| 24K | World History, Story Arcs, Events and Dynamic World States Atlas | SUPPORTING; FCC wins where superseded |
| 24L | Content Registry, Cross-Link Matrix, Budgets and Production Roadmap | SUPPORTING; FCC wins where superseded |

### Set 24 non-reactivation rule

Set 24 may supply supporting world relationships, taxonomy, production coverage and historical context **only where current FCC canon has not superseded it**. It may not silently reactivate deferred/removed realms, portal families, materials, creatures or world-law assumptions.

---

# 10. Document Set 25 — Post-Atlas Production Governance & Registry Authority

Set 25 is one of the strongest direct parents of the PROD programme because it already separates canonical identity, schemas, manifests, validation, catalogues, budgets and backlog/task integrity.

| Doc | Title | Treatment |
| --- | --- | --- |
| 25A | Post-Atlas Production Governance, POC Retirement Baseline and Decision Register | AUTHORITATIVE / SPECIALIST-OWNER |
| 25B | Canonical Registry Kernel, Stable IDs, Namespaces and Source-of-Truth Ownership | AUTHORITATIVE / SPECIALIST-OWNER |
| 25C | Domain Schemas, Relationship Graph, Capabilities, Suitability, Fallbacks and Completeness Contracts | AUTHORITATIVE / SPECIALIST-OWNER |
| 25D | Content Packs, Manifests, Authoring Formats, Import/Export and Migration | AUTHORITATIVE / SPECIALIST-OWNER |
| 25E | Validation Architecture, Seed QA, Progression Reachability, Performance and Release Gates | AUTHORITATIVE / SPECIALIST-OWNER |
| 25F | Core Production Atlas Classification and Scope Lock | AUTHORITATIVE / SPECIALIST-OWNER |
| 25G | Core Production Package Dependency and Progression Matrix | AUTHORITATIVE / SPECIALIST-OWNER |
| 25H | Core Production Block Family Catalogue | AUTHORITATIVE / SPECIALIST-OWNER |
| 25I | Core Production Item Family Catalogue | AUTHORITATIVE / SPECIALIST-OWNER |
| 25J | Resource, Loot, Provenance, Progression and Recipe Chain Matrix | AUTHORITATIVE / SPECIALIST-OWNER |
| 25K | Asset Budgets, Forge Animation/Audio/VFX Socket and Event Manifest Contract | AUTHORITATIVE / SPECIALIST-OWNER |
| 25L | Production Backlog, Summer Engine Task Contract and Source-of-Truth Integrity Audit | AUTHORITATIVE / SPECIALIST-OWNER |

### Direct PROD inheritance

PROD particularly inherits:

- 25B stable-ID/namespace/source-of-truth law;
- 25C schema/capability/completeness concepts;
- 25D manifests, packages, import/export and migration;
- 25E validation, seed QA, reachability, performance and release gates;
- 25K cross-presentation socket/event/budget manifest direction;
- 25L production-backlog/task/source-integrity discipline.

PROD-05 and PROD-06 will reconcile these into the universal primitive/contracts and execution-governance layers.

---

# 11. Document Set 26 — Oceans, Maritime Civilisation, Vessels & Naval Systems

Set 26 remains the specialist maritime authority and is the primary source family for Arc XIII.

| Doc | Title | Treatment |
| --- | --- | --- |
| 26A | Maritime and Naval Expansion Vision, Scope, Authority and Integration Foundation | SPECIALIST-OWNER / INHERIT |
| 26B | Water, Liquid and Fluid Simulation Overhaul | SPECIALIST-OWNER / INHERIT |
| 26C | Oceans, Coasts, Islands and Underwater World Generation | SPECIALIST-OWNER / INHERIT |
| 26D | Marine Climate, Wind, Waves, Tides, Currents and Storm Systems | SPECIALIST-OWNER / INHERIT |
| 26E | Swimming, Diving and Underwater Player Interaction | SPECIALIST-OWNER / INHERIT |
| 26F | Voxel Vessel Architecture, Structural Roles and Commissioning | SPECIALIST-OWNER / INHERIT |
| 26G | Vessel Movement, Buoyancy, Propulsion, Steering and Navigation | SPECIALIST-OWNER / INHERIT |
| 26H | Shipwright Tools, Construction, Repair, Refitting and Salvage | SPECIALIST-OWNER / INHERIT |
| 26I | Vessel Forge, Blueprint Authoring and Procedural Ship Variants | SPECIALIST-OWNER / INHERIT |
| 26J | Ports, Harbours, Shipyards, Crews and Maritime Civilisation | SPECIALIST-OWNER / INHERIT |
| 26K | Maritime Trade, Fleets, Piracy, Navies and Regional Power | SPECIALIST-OWNER / INHERIT |
| 26L | Naval Combat, Boarding, Damage, Flooding, Fire and Siege | SPECIALIST-OWNER / INHERIT |
| 26M | Marine Ecology, Fishing, Sea Creatures, Dungeons and Bosses | SPECIALIST-OWNER / INHERIT |
| 26N | Maritime Progression, Registries, Magic, Automation, Economy, Quests and Events | SPECIALIST-OWNER / INHERIT |
| 26O | Maritime UI/UX, Multiplayer, Godot/Summer Technical Plan, Performance, QA and Main-Document Integration | SPECIALIST-OWNER / INHERIT |

### Maritime boundary rule

Production must preserve Set 26's distinction between world water/hydrology, swimming/diving, vessel structural identity, vessel movement, shipbuilding, Vessel Forge, ports/crews, maritime trade, naval conflict, marine ecology and integrated QA.

The new roadmap changes **when** these systems are built; it does not erase their specialist semantics.

---

# 12. Final Reconciled Document Sets 27–30

The final reconciled 27–30 package contains a Cross-Set Interface Register and Final Reconciliation Report. Those reconciliation products are the preferred ownership boundary for these four domains.

## 12.1 Set 27 — Economy, Markets, Contracts, Trade & Public Finance

| Doc | Title | Treatment |
| --- | --- | --- |
| 27A | Economic Vision, Architecture and Ownership | SPECIALIST-OWNER |
| 27B | Currency, Barter, Value and Price Formation | SPECIALIST-OWNER |
| 27C | Markets, Merchants, Stock and Supply/Demand Simulation | SPECIALIST-OWNER |
| 27D | Labour, Wages, Households, Businesses and Ownership | SPECIALIST-OWNER |
| 27E | Contracts, Orders, Services, Breach and Enforcement | SPECIALIST-OWNER |
| 27F | Credit, Debt, Banking, Insurance and Financial Risk | SPECIALIST-OWNER |
| 27G | Taxation, Tariffs, Treasuries and Public Finance | SPECIALIST-OWNER |
| 27H | Trade Routes, Caravans, Regional Exchange and Cross-Realm Commerce | SPECIALIST-OWNER |
| 27I | Monopolies, Embargoes, Smuggling, Black Markets and Economic Conflict | SPECIALIST-OWNER |
| 27J | Economy UI, Simulation LOD, Multiplayer, Registries and Integration | SPECIALIST-OWNER |

## 12.2 Set 28 — Dialogue, Social Systems & Companions

| Doc | Title | Treatment |
| --- | --- | --- |
| 28A | Social System Vision, Architecture and Ownership | SPECIALIST-OWNER |
| 28B | Dialogue Runtime, Conversation Structure and Context | SPECIALIST-OWNER |
| 28C | Knowledge, Rumours, Truth, Lies, Languages and Information Spread | SPECIALIST-OWNER |
| 28D | Relationships, Memory, Trust, Loyalty, Affection and Rivalry | SPECIALIST-OWNER |
| 28E | Persuasion, Negotiation, Intimidation, Etiquette and Social Consequences | SPECIALIST-OWNER |
| 28F | Companion, Follower, Hireling and Temporary Ally System | SPECIALIST-OWNER |
| 28G | Orders, Delegation, Assignments, Autonomy and Off-Screen Resolution | SPECIALIST-OWNER |
| 28H | Authored, Procedural and AI-Assisted Dialogue Governance | SPECIALIST-OWNER |
| 28I | Voice, Localisation, Accessibility, UI and Presentation | SPECIALIST-OWNER |
| 28J | Multiplayer, Persistence, Registries, Validation and Cross-System Integration | SPECIALIST-OWNER |

## 12.3 Set 29 — Survival, Health & Biological Systems

| Doc | Title | Treatment |
| --- | --- | --- |
| 29A | Survival, Health and Biological System Foundation | SPECIALIST-OWNER |
| 29B | Health, Stamina, Exertion, Fatigue and Biological Recovery | SPECIALIST-OWNER |
| 29C | Hunger, Thirst, Nutrition and Consumption | SPECIALIST-OWNER |
| 29D | Temperature, Wetness, Shelter, Sleep and Environmental Exposure | SPECIALIST-OWNER |
| 29E | Injuries, Wounds, Bleeding, Pain and Functional Impairment | SPECIALIST-OWNER |
| 29F | Disease, Infection, Poison, Toxins and Biological Hazards | SPECIALIST-OWNER |
| 29G | Medicine, First Aid, Healing, Treatment and Rehabilitation | SPECIALIST-OWNER |
| 29H | Biological Profiles, Equipment, Magic, Settlement and Environmental Integration | SPECIALIST-OWNER |
| 29I | Simulation LOD, Multiplayer, Persistence, UI and Accessibility | SPECIALIST-OWNER |
| 29J | Biological Registries, APIs, Balance Framework, Validation and Cross-System Integration | SPECIALIST-OWNER |

## 12.4 Set 30 — Movement, Traversal & Transportation

| Doc | Title | Treatment |
| --- | --- | --- |
| 30A | Movement, Traversal and Transportation System Architecture | SPECIALIST-OWNER |
| 30B | Core Player Locomotion, Controls, Camera and Movement States | SPECIALIST-OWNER |
| 30C | Climbing, Vaulting, Mantling, Ladders, Ropes and Grappling | SPECIALIST-OWNER |
| 30D | Gliding, Falling, Aerial Traversal and Environmental Movement | SPECIALIST-OWNER |
| 30E | Mounts, Riding, Saddles, Harnesses and Mounted Traversal | SPECIALIST-OWNER |
| 30F | Work Animals, Handcarts, Wagons, Carriages and Caravans | SPECIALIST-OWNER |
| 30G | Rails, Minecarts, Elevators and Powered Land Transportation | SPECIALIST-OWNER |
| 30H | Roads, Routes, Terrain Accessibility, Navigation and Long-Distance Travel | SPECIALIST-OWNER |
| 30I | NPC Navigation, Pathfinding, Formations, Multiplayer and Persistence | SPECIALIST-OWNER |
| 30J | Movement Registries, Physics Contracts, Validation and Final Integration | SPECIALIST-OWNER |

### Corrected ownership note

The current final reconciled package identifies Sets 27–30 as **Economy**, **Dialogue/Social**, **Survival/Health/Biology**, and **Movement/Traversal/Transportation** respectively. PROD uses the actual reconciled package contents rather than any earlier informal memory/working labels.

### Cross-set rule

Foundation/runtime systems may retain their own identities and intentions, but they must consume these specialist states through interfaces instead of independently recalculating them.

---

# 13. FCC — Final Content Canon Authority

FCC is the current high-authority content programme for the locked production realms and global material/identity bindings. It overrides older atlas/world content wherever an explicit collision exists.

## 13.1 Current persistent production-world roster

The current locked roster is:

1. Overworld;
2. Verdant Covenant;
3. Ancestral Veil;
4. Somnolent Expanse;
5. Ascendant Reach;
6. Impossible Deep;
7. Ashen Lower Realms.

Current production does not silently reactivate deferred worlds from older planning.

## 13.2 Realm packages

- **FCC-01 — Overworld**: final A–J locked package, including topology/biomes, geology/materials, flora, fauna/monsters, peoples/cultures/governments, settlements/economy, structures/portals, dungeons/bosses, magic/history/cross-realm interfaces and final registry/audit handoff.
- **FCC-02 — Verdant Covenant**: current locked realm canon.
- **FCC-03 — Ancestral Veil**: current reviewed realm canon.
- **FCC-04 — Somnolent Expanse**: current locked realm canon.
- **FCC-05 — Ascendant Reach**: current locked realm canon.
- **FCC-06 — Impossible Deep**: current locked realm canon.
- **FCC-08 — Ashen Lower Realms**: current reviewed/locked realm canon.

## 13.3 Global FCC packages

- **FCC-12** owns universal material identity, derived forms, processing families, provenance, states, quality and cross-realm material relationships.
- **FCC-13** owns stable identity architecture, definitive block/object/item/form/inventory projections, recipes/providers/quantities, portal bindings and the legacy migration matrix.
- **FCC-14A** owns final cross-realm invariants/certification.
- **FCC-14B** owns semantic art-handoff and required visual distinctions.
- **FCC-14C** owns Forge/technical/validation/migration handoff obligations.
- **FCC-14D** owns final hold/amendment/completeness/package/cross-realm lock.

### Production treatment

`AUTHORITATIVE`.

PROD may schedule implementation and define execution contracts, but it may not casually reinterpret FCC content meaning.

---

# 14. ART-00 through ART-10 — Final Presentation/Production Authority

The ART corpus is retained intact. PROD references it; it does not rewrite its visual/audio/UI laws.

| Doc | Title | Treatment |
| --- | --- | --- |
| ART-00 | Art Production Constitution and Authority Map | AUTHORITATIVE for presentation/production |
| ART-01 | Master Visual Language and Style Bible | AUTHORITATIVE for presentation/production |
| ART-02 | Materials, Colour, Texture, Surface and Shader Art Standard | AUTHORITATIVE for presentation/production |
| ART-03 | World, Realm, Biome, Architecture and Culture Art Direction | AUTHORITATIVE for presentation/production |
| ART-04 | Blocks, Items, Machines, Structures, Equipment and Vessel Modelling Standard | AUTHORITATIVE for presentation/production |
| ART-05 | Characters, Creatures, Rigging and Animation Style Handoff | AUTHORITATIVE for presentation/production |
| ART-06 | VFX, Lighting, Weather, Magic and Environmental Effects Bible | AUTHORITATIVE for presentation/production |
| ART-07 | Audio, Music and Sonic Identity Bible | AUTHORITATIVE for presentation/production |
| ART-08 | UI, Icons, Cartography, Codex and 2D Presentation Standard | AUTHORITATIVE for presentation/production |
| ART-09 | Codex and The Forge Asset Production Execution Contract | AUTHORITATIVE for presentation/production |
| ART-10 | Golden References, Visual/Audio QA and Production Certification | AUTHORITATIVE for presentation/production |

### ART-to-PROD boundary

- FCC/gameplay canon decides **what the thing means**.
- ART decides **how that meaning is presented**.
- PROD decides **when/how the capability enters production and what evidence closes the implementation slice**.
- PROD-04/The Forge provides the authoring capability.
- PROD-03/runtime engineering provides implementation.

ART-09's end-to-end execution procedure and ART-10's certification/golden-reference model are direct inputs to PROD-04, PROD-06 and PROD-17.

---

# 15. PRD / Pre-Rebuild Evidence Programme

The PRD programme was created to turn unknowns into measured evidence before clean production implementation. Its current role in PROD is **technical evidence and decision support**, not gameplay canon.

The programme family is retained as:

- PRD-00 — Source Corpus & Authority Register;
- PRD-01 — Technical Requirements & Unknowns Inventory;
- PRD-02 — Zylann Voxel Tools Deep Capability Audit;
- PRD-03 — Godot & Supporting Technology Audit;
- PRD-04 — Architecture Boundary Study;
- PRD-05 — Research Evidence Crosswalk;
- PRD-06 — Technical Risk & Proof Register;
- PRD-07 — Prototype / Benchmark / Proof Execution Programme;
- PRD-08/09 — where present/current, results/ADR closure and pre-rebuild closure functions.

### Production treatment

`EVIDENCE` unless an accepted ADR or current engineering authority explicitly elevates a conclusion into architecture.

Measured proof should influence PROD-03/04 and slice acceptance; prototype code itself is not automatically production code.

---

# 16. Engineering Governance, Operations & Project Brain

## 16.1 ENG-GOV / B-OPS

These remain the engineering/work-control authority for repository behaviour, coding-agent constraints, change control, validation and operational discipline where currently accepted.

**Treatment:** `AUTHORITATIVE` for governance, subordinate to product/content meaning.

## 16.2 Project Brain

Project Brain remains the operational knowledge and navigation layer for:

- current status;
- task contracts;
- work records;
- handoffs;
- decisions;
- source navigation;
- reusable knowledge;
- production history.

It does not replace the owning design/ART/PROD/engineering authority.

## 16.3 Branch A/B/C/D work

Completed Project Brain, engineering-governance and audit-framework work remains operational infrastructure. PROD-06/17 should consume it rather than build a parallel task/governance system.

---

# 17. Historical POC, VoxelRegistry & Migration Evidence

## 17.1 POC treatment

The archived POC remains valuable for:

- functional-contract evidence;
- performance measurements;
- interaction/readability lessons;
- save/migration fixtures;
- animation/socket/pivot evidence;
- automation conservation tests;
- UI/accessibility regression scenarios;
- Visual Test Room concepts;
- negative tests and failure modes.

It is not a source of final architecture by default.

## 17.2 POC Manual Testing Guide

Document 99 is `EVIDENCE / REGRESSION`. It may define reusable regression scenarios, but no historical POC value becomes current production canon merely because a test expects it. Tests must be migrated to current authority when the authoritative value changes.

## 17.3 VoxelRegistry.json

The supplied historical `VoxelRegistry.json` contains 312 rows. It is retained as identity/migration evidence, not final presentation or current canonical binding authority. FCC-13 and the current registry kernel govern final canonical identity/migration decisions.

Treatment: `MIGRATION / EVIDENCE`.

## 17.4 Single-definition rule

Where a placed block remains the same canonical thing when collected, inventory should reference the canonical block/content identity rather than create a duplicate independent item definition. Separate item identity is justified when transformation or non-block semantics genuinely require it.

PROD-03/04/05 must implement this without reintroducing duplicate registry ownership.

---

# 18. Retained Post-30 / Set 31–42 Roadmap Constraints

The earlier post-30 roadmap is no longer the primary production ordering, but its concerns remain valid future constraints and have been absorbed into the new Arcs:

- Multiplayer/networking/shared worlds → Arc XVII;
- giant whole-game review/optimisation/hardening → Arc XVIII + PROD-17;
- Unified Forge/player creator security/content packs → Arc XV + XVII;
- settings/controls/player configuration → Arc XVIII;
- Create Realm/simulation complexity/hardware scalability → Arc XVIII;
- front-end/world management → Arc XVIII;
- modding/workshop/community ecosystem → Arc XVII;
- dedicated servers → Arc XVII;
- updates/patching/versioning/release lifecycle → Arc XVIII;
- diagnostics/recovery/support → Arc XVIII;
- final accessibility/localisation certification → Arc XVIII;
- platform/distribution/release → Arc XVIII.

Treatment: `FUTURE-CONSTRAINT` where not already promoted into current PROD scope.

---

# 19. Arc-to-Source Crosswalk

This table gives PROD-02 the first high-level routing map. Detailed P-level source bindings will be expanded there and inside PROD-07 through PROD-16.

| Arc | Name | Slices | Primary inherited source families |
| --- | --- | --- | --- |
| I | A WORLD FROM STONE | P01–P05 | 00, 01, 03, 11, 18, 25, PRD evidence, POC regression evidence |
| II | THE MAKER'S HAND | P06–P11 | 21, 22, 25, ART-01/02/04/09/10, FCC-12/13/14 |
| III | HEARTH & HAMMER | P12–P17 | 02–06, 20B, 25H–J, 29 where survival biology applies |
| IV | SHAPE, MOTION & SONG | P18–P24 | 21C/21E/21F, ART-05/06/07/08/09/10, 25K |
| V | BLOOD, BONE & STEEL | P25–P31 | 10, 16, 22B–H, ART-04/05/06/07, 29 biological interfaces |
| VI | THE FIRST HEARTH | P32–P38 | 07, 13, 15, 17, 20A/B, 28, 29, 30I |
| VII | FROM CAMPFIRE TO KINGDOM | P39–P48 | 19, 20/20A–H, 22I/J/K/L, 25, 30H/I |
| VIII | GEARS BENEATH THE EARTH | P49–P63 | 08, 20B/D/E, 21/22, 25, 27 where economic exchange applies, 30 routes |
| IX | WHEN THE LEY AWAKENS | P64–P72 | 09, 20E, FCC material/form canon, ART-06/07, 25K |
| X | BEYOND THE HORIZON | P73–P82 | 11, 12, 24, FCC-01 and realm/world canon, ART-03/06/07/08, 30 |
| XI | ROADS OF GOLD & DUST | P83–P92 | 27, 07, 20B/D, 30F/H/I, 26 for maritime interfaces later |
| XII | CROWNS & CONSEQUENCES | P93–P102 | 13, 15, 16, 20C/G, 27, 28, FCC civilisation canon |
| XIII | CALL OF THE DEEP BLUE | P103–P114 | 26A–O, 20D, 27H, 30 movement facade, ART-03/04/06/07 |
| XIV | BEYOND THE VEIL | P115–P126 | 14, FCC-01/02/03/04/05/06/08/12/13/14, 24 historical support, ART-03/06/07 |
| XV | THE FORGE UNBOUND | P127–P137 | 21A–G, 22A–L, 25B–E/K/L, ART-08/09/10, ENG-GOV |
| XVI | A WORLD THAT REMEMBERS | P138–P148 | 15, 28C/D, 20B knowledge services, ART-03/08, FCC history canon |
| XVII | MANY HANDS, ONE WORLD | P149–P158 | 17, 18 technical requirements as evidence, 25D/E, 27–30 multiplayer interfaces, ENG-GOV/ADRs |
| XVIII | TEMPERING LEYFORGE | P159–P170 | 17, 18 requirements, 25D/E/K/L, ART-10, post-30 31–42 retained constraints, POC regression evidence |
| XIX | THE MIND IN THE MACHINE | P171–P179 | 28H and other AI-assist governance only where compatible; ART-09 provenance; PROD AI-last law |
| XX | THE FIRST FLAME | P180–P192 | 00–30, FCC, ART, Forge, multiplayer, release/certification authorities — full-stack integration |

---

# 20. Cross-Cutting Rules Preserved from the Legacy Corpus

The following rules repeatedly appear across current authoritative sources and are promoted into explicit PROD cross-cutting obligations.

## 20.1 One owner for mutable truth

Systems may observe or request changes to another system's state, but they may not maintain contradictory duplicate mutable truth.

## 20.2 Stable identity over fragile file paths

Gameplay/content references use stable canonical IDs/registries rather than treating scene/file paths as identity.

## 20.3 Source versus runtime product

Editable Forge source is not the same thing as a runtime cache/bake/product. Generated products should be reproducible from approved source wherever practical.

## 20.4 Existing content before composition

Structure/Vessel/Blueprint and similar composition tools use content already registered in the active game/package authority. They do not silently create new canonical blocks/materials/items as a side effect of assembly.

## 20.5 Shared editor/service core

Where developer Forge, player Forge and multiplayer Forge overlap, they should call the same underlying edit/validation/serialization services with different permissions rather than become unrelated editors.

## 20.6 Specialist Forge workflows orchestrate shared services

Animation, VFX, audio, materials, validation, capture, packaging and other shared services must not be re-implemented inside every specialist Forge.

## 20.7 Creation order should be guided

A specialist Forge should guide creators through the natural dependency order of the thing being created, exposing required and optional stages and ending in a clear validated completion state.

## 20.8 Simulation truth survives LOD

Near/far/dormant representations may differ in detail, but authoritative identities, conserved resources, ownership and important consequences must remain coherent.

## 20.9 Presentation reflects authoritative state

A machine cannot merely look powered when authoritative state says it is not; UI/audio/VFX must consume the same truth and failure reasons.

## 20.10 World history persists

Damage, repair, occupation, construction, route change, migration and other major supported consequences should leave persistent state/history where owning systems require it.

---

# 21. Supersession & Non-Supersession Matrix

| Earlier source | Current owner/successor | Production treatment |
| --- | --- | --- |
| Original 00–18 v0.1 | Reconciled Foundation 00–20 v1.0 | Use v1.0 for overlapping Foundation scope; preserve older files only as historical/supporting evidence. |
| Old POC fixed identities/layouts | Set 24/25 + reconciled Foundation + FCC | Archive fixed POC scenario identity; preserve reusable mechanics. |
| Set 24 realm/world detail | FCC realm canon | FCC wins where superseded; Set 24 remains supporting only. |
| Legacy block/item registry values | FCC-13 + Set 25 registry kernel | Use legacy data for migration/evidence, not current identity/presentation truth. |
| Old engine-specific implementation | PROD-03/04 + accepted ADRs | Preserve requirements; replace obsolete engine techniques. |
| General economy/social/biology/movement rules in Foundation | Final reconciled Sets 27–30 | Specialist set owns its state/formulas; Foundation retains intent and interfaces. |
| Forge concepts in Sets 21/22 | PROD-04 | PROD-04 reconciles/extends implementation architecture without discarding capabilities. |
| Presentation hints in gameplay docs | ART-00–10 | ART owns final presentation where it has ruled. |
| Old post-30 Set 31–42 order | PROD 20-Arc roadmap | Retain requirements; new dependency order controls implementation. |
| Early AI-assisted dialogue/asset ideas | Arc XIX / PROD AI-last law | Do not activate player/world/Forge AI before non-AI game and Forge completion; older AI references are deferred to Arc XIX unless needed only as offline production provenance tooling already governed by ART/ENG. |

---

# 22. Source Retrieval Rules During Production

When implementing a P# slice, the executing agent/team shall not rely on this crosswalk alone for domain detail. It shall:

1. identify the P#'s source families from PROD-02/Arc volume;
2. retrieve the actual owning source documents;
3. distinguish authoritative, supporting and evidence-only sources;
4. retrieve the applicable ART documents for presentation;
5. retrieve current engineering/ADR constraints;
6. retrieve the applicable Forge/registry schemas;
7. identify migration/legacy fixtures only if the slice touches historical compatibility;
8. record unresolved conflicts rather than inferring a new canon rule;
9. bind tests to current authority, not stale prototype constants;
10. record the source set used in the Task Contract/Work Record/evidence package.

This requirement prevents PROD from becoming a lossy summary layer.

---

# 23. Known Verification Items

The following items remain intentionally open at PROD-01 v0.1 and must be resolved before final lock where they materially affect production:

### PROD01-V001 — Set 23 manifest

`23-A-J.7z` is retained but its internal manifest could not be enumerated in the current tool environment. Extract and classify A–J before PROD-02 final lock or before any P# depends on it, whichever comes first.

### PROD01-V002 — Current repo/Brain production gate

This document does not claim the current repository/Brain execution gate is open. Before starting P01 implementation, PROD-06/17 and the active repository authority must confirm the governing task/handoff state.

### PROD01-V003 — PRD-08/09 exact closure state

Where the repository/current Project Brain contains current PRD-08/09 artifacts or accepted replacements, PROD-03/06 should bind those exact artifacts. PROD-01 records the programme role without inventing a current closure result.

### PROD01-V004 — Current production registry source

`VoxelRegistry.json` is historical/migration evidence. The final production registry source and migration bindings must resolve through FCC-13/Set 25/current repository authority before P07/P08 mass content work.

---

# 24. PROD Document Routing

| PROD | Role | Crosswalk relationship |
| --- | --- | --- |
| PROD-00 | Constitution, authority and scope | Constitutional parent; defines treatment philosophy. |
| PROD-01 | Legacy canon & source crosswalk | This document. |
| PROD-02 | Master roadmap & dependency atlas | Binds P01–P192 to dependencies and source families. |
| PROD-03 | Runtime engineering architecture | Consumes Foundation/PRD/Set25/26/27–30/FCC technical obligations. |
| PROD-04 | Forge engineering & Creation Journey architecture | Consumes Sets 21/22/25, FCC-14C, ART-09/10. |
| PROD-05 | Universal simulation primitives & cross-system contracts | Reconciles identity/state/signal/permission/transaction/route/knowledge/history/composition. |
| PROD-06 | Production governance, task contracts & evidence | Consumes ENG-GOV/B-OPS/Brain/25E/25L/ART-10. |
| PROD-07–16 | Arc implementation volumes | Each P# retrieves its owning sources through this crosswalk. |
| PROD-17 | Master verification/certification/handoff register | Verifies coverage, evidence and final programme state. |

---

# 25. PROD-01 Acceptance Gate

PROD-01 is ready for owner lock when all of the following are accepted:

- [ ] Reconciled Foundation 00–20 is recognised as the preferred Foundation baseline for overlapping scope.
- [ ] 20A–20H remain specialist settlement-service authority under Documents 19/20.
- [ ] Sets 21/22 are retained as major Forge capability baselines and routed into PROD-04 rather than discarded.
- [ ] Set 23 is explicitly retained and marked VERIFY until its manifest is read.
- [ ] Set 24 is supporting/historical where superseded by FCC.
- [ ] Set 25 remains major registry/governance/validation authority.
- [ ] Set 26 remains maritime specialist authority.
- [ ] Final reconciled Sets 27–30 ownership boundaries are recognised.
- [ ] FCC owns current realm/global material/stable-identity content canon.
- [ ] ART-00–10 remain final presentation-production authority.
- [ ] PRD/POC are evidence unless promoted by accepted current architecture authority.
- [ ] ENG-GOV/B-OPS/Project Brain retain their governance/operational roles.
- [ ] Historical VoxelRegistry is migration/evidence, not final registry truth.
- [ ] Old Set 31–42 concerns are preserved as requirements but reordered by the new 20-Arc PROD sequence.
- [ ] No source family has been silently deleted merely because it predates PROD.
- [ ] No unresolved source gap has been filled by invention.

### Proposed lock statement

> **PROD-01 — LEGACY CANON & SOURCE CROSSWALK — v0.1 CANDIDATE**
>
> Leyforge production shall inherit the existing corpus by explicit ownership and treatment rather than by document age. Reconciled Foundation documents provide the core system baseline; specialist Sets 20A–30 own their bounded domains; FCC owns current content canon and global identity/material bindings; ART owns final presentation and production-art rules; ENG-GOV/B-OPS/accepted ADRs own engineering governance; Project Brain owns operational navigation/history; PRD and POC evidence inform implementation without automatically becoming final architecture. Historical sources remain available for migration, proof and context. Any source not yet inspected is marked VERIFY rather than invented. PROD-02 and the Arc volumes may therefore bind P01–P192 to authoritative source families without losing or silently reviving legacy assumptions.

---

# 26. Next Document

Upon owner acceptance or continuation approval, proceed to:

> **PROD-02 — Master Production Roadmap & Dependency Atlas**

PROD-02 shall turn the twenty Arcs and P01–P192 into the canonical production sequence, including dependency edges, entry/exit gates, Forge-first prerequisites, integration/cool-pull markers, child-slice rules and source-family bindings from PROD-01.

---

# Appendix A — Source Family Quick Index

| Source family | Primary role | Treatment |
| --- | --- | --- |
| Foundation 00–20 | Core game/system authority | AUTHORITATIVE / reconciled baseline |
| 20A–20H | Settlement needs/services/catalogue | SPECIALIST-OWNER |
| 21A–G | Voxel Asset Forge | SPECIALIST-OWNER / Forge baseline |
| 22A–L | Entity/Blueprint Forge | SPECIALIST-OWNER / Forge baseline |
| 23A–J archive | Unverified in current environment | VERIFY |
| 24A–L | World Content Atlas | SUPPORTING where FCC supersedes |
| 25A–L | Production governance/registries/validation | AUTHORITATIVE / SPECIALIST-OWNER |
| 26A–O | Maritime/vessels/naval | SPECIALIST-OWNER |
| 27A–J | Economy/trade/public finance | SPECIALIST-OWNER |
| 28A–J | Dialogue/social/companions | SPECIALIST-OWNER |
| 29A–J | Survival/health/biology | SPECIALIST-OWNER |
| 30A–J | Movement/traversal/transport | SPECIALIST-OWNER |
| FCC-01/02/03/04/05/06/08 | Realm content canon | AUTHORITATIVE |
| FCC-12/13/14 | Global material/identity/certification | AUTHORITATIVE |
| ART-00–10 | Final presentation/asset production | AUTHORITATIVE |
| PRD | Research/risk/prototype evidence | EVIDENCE unless promoted via ADR |
| ENG-GOV/B-OPS | Engineering governance | AUTHORITATIVE for governance |
| Project Brain | Status/handoffs/work history/navigation | OPERATIONAL AUTHORITY |
| POC/Doc 99 | Historical regression/proof | EVIDENCE |
| VoxelRegistry.json | Legacy 312-row identity/migration evidence | MIGRATION / EVIDENCE |
| Old Set 31–42 roadmap | Retained future/release constraints | FUTURE-CONSTRAINT |

---

# Appendix B — Production Source Rule Summary

When in doubt:

> **Read the owner.**

When two owners collide:

> **Stop and classify the collision.**

When a prototype proves something useful:

> **Preserve the evidence, not necessarily the implementation.**

When an older document contains a capability that still matters:

> **Do not delete it just because the example around it was POC-specific.**

When a later specialist owns a state:

> **Consume it through an interface; do not calculate a second truth.**

When Forge needs a capability:

> **Prefer shared services and canonical sources over editor-local reinvention.**

When a source has not actually been read:

> **Mark VERIFY. Never invent the missing rule.**

---

**End of PROD-01 v0.1 — Draft Legacy Canon & Source Crosswalk Candidate**
