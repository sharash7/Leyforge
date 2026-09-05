# PRD-00 — Leyforge Source Corpus & Authority Register

**Version:** 1.0  
**Date:** 28 August 2026  
**Status:** **FINAL / CLOSED — Initial Controlled Source Baseline**  
**Closure basis:** Rounds 1–5 complete: inventory, authority/lifecycle, coverage, Do-Not-Lose controls, document-level master register, provenance cleanup and closure audit  
**Purpose:** Establish the controlled source corpus for PRD-01 and all later PRD, LFE and FORGE-ENG work. This document does not design the new engine. It records what sources exist, what each source owns, what it may supersede, and how conflicts must be routed.

---

## 1. Governing Principle

PRD-00 separates four kinds of truth that must never be collapsed into one another:

1. **Game/content canon** — defines what Leyforge is and what the game must support.
2. **Engineering canon** — future LFE / FORGE-ENG documents that will define how the rebuilt system satisfies approved requirements.
3. **Research/evidence** — informs engineering decisions but cannot silently rewrite game/content canon.
4. **Historical/prototype evidence** — preserves useful behaviour, tests, migration data and lessons without automatically retaining obsolete implementation choices.

A failed engineering prototype invalidates or constrains an implementation approach; it does not silently delete a canonical game requirement.

---

## 2. Source-ID Convention

| Prefix | Source family | Example |
|---|---|---|
| `SRC-DIR` | Explicit approved project direction / owner locks | `SRC-DIR-001` |
| `SRC-FND` | Reconciled Foundation documents 00–20 | `SRC-FND-07` |
| `SRC-SET` | Main numbered system/content sets | `SRC-SET-26F` |
| `SRC-FRG` | Forge source/design documents 21–23 | `SRC-FRG-22I` |
| `SRC-XSI` | Cross-set interface / reconciliation authority | `SRC-XSI-27-30` |
| `SRC-FCC` | Final Content Canon | `SRC-FCC-01J` |
| `SRC-CHAT` | Recovered planning/discussion evidence | `SRC-CHAT-OPT` |
| `SRC-RSCH` | External/comparative research passes | `SRC-RSCH-VS1` |
| `SRC-POC` | Historical implementation / prototype / test evidence | `SRC-POC-99` |
| `SRC-NAV` | Navigation/status/checklist documents | `SRC-NAV-PRERB` |
| `SRC-FUT` | Future production constraints / expansion horizon | `SRC-FUT-31` |
| `SRC-LFE` | Reserved future Leyforge Engine engineering canon | `SRC-LFE-00` |
| `SRC-FORGEENG` | Reserved future Forge engineering canon | `SRC-FORGEENG-00` |
| `SRC-MISS` | Expected/referenced but unavailable or unresolved source | `SRC-MISS-001` |

IDs identify the source slot. Version/revision remains a separate field so later revisions do not require inventing a new identity unless the source itself is a distinct historical artefact.

---

## 3. Source Classes

| Class | Meaning | Can define game/content truth? | Can define final engineering truth? |
|---|---|---:|---:|
| **Locked Canon** | Explicitly approved/locked content or system rule within an owned scope | Yes | Only when the source owns an engineering-neutral invariant |
| **Reconciled System Canon** | Current approved gameplay/system design with explicit ownership boundaries | Yes | Requirement source only |
| **Governance / Interface Authority** | Defines ownership, IDs, handoffs, reconciliation or source-of-truth rules | Yes within governance scope | Constrains future engineering canon |
| **Forge Design Authority** | Defines what the Forge must author/preserve/validate | Yes for Forge capability/authoring requirements | Requirement source only |
| **Future Production Constraint** | Planned Set 31–42 requirement that architecture must not preclude | Not current implemented canon | Constraint only |
| **Future Expansion / Stress Horizon** | 43+ ideas deliberately not numbered/frozen | No | Stress-test input only |
| **Research / Evidence** | Comparative or technology research | No | No; evidence for PRD/ADR decisions |
| **Official Technology Evidence** | Upstream docs/source/demos/issues | No | No; technology fact/evidence only |
| **Leyforge Prototype Evidence** | Personally run prototype/benchmark/test evidence | No | No; may justify ADR/LFE decision after review |
| **Historical Implementation / POC** | Previous implementation and regression record | No | No; preserve reusable requirements/tests only |
| **Recovered Planning Evidence** | Important project discussions not yet formalised into canon | Only when they record explicit approved project direction | No until adopted through PRD/LFE/FORGE-ENG |
| **Navigation / Status** | Roadmaps/checklists | No | No |
| **Superseded / Deprecated** | Historical revision retained for provenance | No | No |
| **Unavailable / Expected** | Referenced source not yet present or not yet created | Unknown | Unknown |

### 3.1 Authority status and implementation maturity are separate axes

PRD-00 must never use a document's design/canon status as shorthand for implementation maturity. A source may be authoritative for **what must exist** while the corresponding runtime remains unimplemented or unproven. Conversely, a historical prototype may demonstrate working behaviour without having authority to define current canon.

Record these separately:

**Source lifecycle / authority status**

- `PROPOSED` — candidate direction; not an active lock.
- `WORKING LOCK` — approved working direction that still names a later proof/review gate.
- `LOCKED / CERTIFIED` — authoritative within its owned scope, subject only to declared higher/global reconciliation.
- `SUPERSEDED` — replaced for the owned fields identified by its successor.
- `HISTORICAL / EVIDENCE` — preserved for provenance, tests or lessons, not active design authority.
- `FUTURE / EXPECTED` — planned owner not yet authored or approved.

**Implementation maturity**

- `DESIGN ONLY` — specified in documents; executable evidence not implied.
- `REFERENCE / EXTERNAL EVIDENCE` — demonstrated upstream or by another project.
- `LEYFORGE PROTOTYPE` — P3-style proof in a Leyforge-relevant environment.
- `STRESS TESTED` — P4-style hostile/scale testing completed for the stated conditions.
- `IMPLEMENTED` — exists in a runtime build, without implying final integration/release qualification.
- `INTEGRATION CLOSED` — cross-system/source/migration obligations for the declared scope have passed.
- `PRODUCTION QUALIFIED` — P5-style production/release gates pass for the declared scope.

**Rule:** `LOCKED` does not mean `IMPLEMENTED`, and `IMPLEMENTED` does not mean `CANONICAL`.

### 3.2 Source-embedded status versus project lifecycle state

Some files intentionally preserve the status they had when authored (for example, `Owner Review Candidate`) even when a later project approval subsequently accepted the set. PRD-00 therefore records both when they differ:

1. **Source-embedded status** — literal status written inside the file.
2. **Project lifecycle state** — later approved state supported by an amendment, lock certificate, approval record or controlled project decision.

A later project lifecycle state must never be back-written into an older source unless a controlled revision is issued. If approval provenance is not present in the file corpus, PRD-00 records the later state as a provenance item requiring linkage rather than pretending the older header already said it.

---

## 4. Authority and Conflict Model

### 4.1 Scope-first rule

There is no safe single global rule of “newer file always wins”. Authority is resolved by **owned scope first**, then explicit supersession.

Use this order:

1. **Explicit approved project direction** where the project lead has clearly locked a decision.
2. **Later explicit lock/amendment from the canonical owner of the affected domain.**
3. **Canonical interface / reconciliation register** where multiple specialist owners meet.
4. **Current specialist/domain owner document** for the rule it explicitly owns.
5. **Current reconciled Foundation / general system document** for rules not transferred to a later specialist owner.
6. **Earlier Atlas / source material** where not superseded.
7. **Research, prototype and historical implementation evidence** as evidence only.

### 4.2 Non-supersession rule

A later specialist document does not erase an earlier gameplay capability merely by being newer. It supersedes the earlier source **only for the rules it explicitly owns**. The Foundation reconciliation register states the preservation rule as: retire the POC scenario, not automatically the reusable gameplay capability behind it.

### 4.3 FCC-specific precedence

For realm/content ambiguity, FCC-01J defines the active ordering:

1. explicit later FCC amendment/lock;
2. accepted FCC interview decision;
3. completed current realm FCC canon where realm ownership applies;
4. fidelity-certified FCC written canon;
5. FCC reconciliation/source-routing decisions;
6. current universal system documents within their domain;
7. older World Content Atlas/source documents;
8. retired POC/test content.

### 4.4 Sets 27–30 interface precedence

For economy/social/biology/movement collisions, the final reconciled package states:

1. Cross-Set Interface Register v1.1;
2. each set's updated `J` v0.2 integration document;
3. specialist gameplay rules;
4. earlier provisional interface-status wording.

### 4.5 Evidence cannot delete canon

Research, benchmarks and prototypes decide whether an implementation approach is viable. They do not remove a canonical requirement merely because it is difficult. If the current candidate architecture cannot satisfy a locked requirement, the architecture changes or the requirement is explicitly reopened by its owner.

### 4.6 Specification is not implementation closure

Set 25's production-integrity rules establish a project-wide lifecycle safeguard: a feature being thoroughly described in prose does not make its implementation task Ready, and completion of a document sequence does not imply integration or release closure. Active source-of-truth changes require controlled replacement/revision, indexing and migration treatment where applicable.

PRD-00 therefore distinguishes:

`document exists` → `source is authoritative for its scope` → `implementation is proven` → `integration is closed` → `production is qualified`.

No later PRD, LFE or FORGE-ENG document may collapse those states.

---

# 5. Master Source Register — Current Inventory

## 5.1 Foundation 00–20

**Package:** `Leyforge_Foundation_00-20_Reconciled_Master_Documents_v1_0_Pre_Set20_Companion_Pass(1).zip`  
**Package status:** Reconciled master documents v1.0, explicitly labelled **Pre-Set20 Companion Pass**.  
**Important package note:** Document 20 v1.0 is included, but the package states that 20A–20H were not yet reconciled in this archive; the later standalone Set 20 v0.2 package therefore must be registered alongside it.

| Source ID | Document | Version | Class / status | PRD-01 |
|---|---|---|---|---:|
| SRC-FND-00 | Master Game Design Bible | v1.0 | Reconciled system canon | Yes |
| SRC-FND-01 | Core Gameplay Loop | v1.0 | Reconciled system canon | Yes |
| SRC-FND-02 | Player Progression System | v1.0 | Reconciled system canon | Yes |
| SRC-FND-03 | Canonical Blocks Registry Framework and Production Families | v1.0 | Reconciled system canon | Yes |
| SRC-FND-04 | Canonical Items Registry, Inventory, Equipment and Production Families | v1.0 | Reconciled system canon | Yes |
| SRC-FND-05 | Canonical Crafting, Recipe Registry and Transformation System | v1.0 | Reconciled system canon | Yes |
| SRC-FND-06 | Canonical Resource Progression, Material Ecology and Capability Pathway System | v1.0 | Reconciled system canon | Yes |
| SRC-FND-07 | NPC, Village, Persistent People and Settlement Operations System | v1.0 | Reconciled system canon | Yes |
| SRC-FND-08 | Automation, Industry, Logistics and Network Control System | v1.0 | Reconciled system canon | Yes |
| SRC-FND-09 | Magic, Mana, Spellcraft, Runes, Rituals and Civilisation Magic System | v1.0 | Reconciled system canon | Yes |
| SRC-FND-10 | Creatures, Monsters, Wildlife and Ecology Runtime System | v1.0 | Reconciled system canon | Yes |
| SRC-FND-11 | Biomes, World Generation and Procedural World Assembly System | v1.0 | Reconciled system canon | Yes |
| SRC-FND-12 | Structures, Landmarks, Routes and Persistent Structure Runtime System | v1.0 | Reconciled system canon | Yes |
| SRC-FND-13 | Peoples, Cultures, Factions, Governments and Civilisation Identity System | v1.0 | Reconciled system canon | Yes |
| SRC-FND-14 | Dimensions, Realms, Realm Travel and Interdimensional World System | v1.0 | Reconciled system canon | Yes |
| SRC-FND-15 | Quest, Event, History and World Consequence System | v1.0 | Reconciled system canon | Yes |
| SRC-FND-16 | Combat, Gear, Defence and Tactical Conflict System | v1.0 | Reconciled system canon | Yes |
| SRC-FND-17 | UI/UX, Accessibility, Menus, HUD, World Configuration and Player Trust System | v1.0 | Reconciled system canon | Yes |
| SRC-FND-18 | Godot / Summer Engine Technical Implementation Plan | v1.0 package revision | **Mixed:** engine-neutral requirements retained; Summer-specific implementation subject to technical supersession | Yes, with implementation filtering |
| SRC-FND-19 | Settlement Growth, District Planning and Player Voxel Blueprint System | v1.0 | Reconciled system canon | Yes |
| SRC-FND-20 | Buildings, Facilities, Functional Services, Construction and Settlement Project System | v1.0 | Reconciled system canon; companion details supplemented by Set 20 v0.2 | Yes |
| SRC-FND-GOV | Foundation 00–20 POC-to-Production Reconciliation Register | v0.2 | Governance / supersession authority | Yes |

### Foundation preservation rule

POC names, fixed coordinates, scripted relationships and obsolete engine assumptions may be archived while reusable mechanics remain unless a later approved owner explicitly replaces/rejects them.

---

## 5.2 Document Set 20 — Buildings / Settlement Projects

**Package:** `Leyforge_Document_Set_20_v0_2(1).zip`  
**Status:** v0.2 explicitly supersedes corresponding v0.1 Set 20 files.

| Source ID | Document | Version | Status |
|---|---|---|---|
| SRC-SET-20 | Buildings, Facilities, Construction and Settlement Project System | v0.2 | Active specialist companion source; reconcile with Foundation 20 v1.0 |
| SRC-SET-20A | Housing, Provisions, Health and Community | v0.2 | Active |
| SRC-SET-20B | Work, Extraction, Crafting, Trade and Education | v0.2 | Active |
| SRC-SET-20C | Governance, Safety, Defence, Justice and Emergency Services | v0.2 | Active |
| SRC-SET-20D | Storage, Roads, Transport, Logistics and Utilities | v0.2 | Active |
| SRC-SET-20E | Magic, Automation, Industry, Power and Dimensions | v0.2 | Active |
| SRC-SET-20F | Districts, Complexes, Megaprojects and Wonders | v0.2 | Active |
| SRC-SET-20G | Culture, Faction, Biome and Realm Building Packs | v0.2 | Active |
| SRC-SET-20H | Detailed Building Catalogue, Stage Matrix and Production Backlog | v0.2 | Active |

**Round-2 handling:** standalone Set 20 v0.2 explicitly replaces the earlier Set-20 v0.1 companion files and supplies the current detailed Unified-Forge/runtime integration treatment. No explicit evidence currently supports a blanket replacement of Foundation Document 20 v1.0. PRD-01 therefore uses **field/scope ownership**: v0.2 companion documents for their detailed owned fields, Foundation 20 for the broad reconciled foundation where not contradicted.

---

## 5.3 Forge Source/Design Family — Sets 21–23

### Set 21 — Voxel Asset Forge

**Package:** `Leyforge_Voxel_Asset_Forge_Document_Set_21_v0_1.zip`

- SRC-FRG-21A — Voxel Asset Forge Core System v0.1
- SRC-FRG-21B — Voxel Modelling, Texturing and Material Authoring v0.1
- SRC-FRG-21C — Animation, Effects and Runtime Visual States v0.1
- SRC-FRG-21D — Asset Overrides, Variants and Registry Integration v0.1
- SRC-FRG-21E — Forge UI/UX and Creator Workflow v0.1
- SRC-FRG-21F — Forge Technical Implementation Plan v0.1
- SRC-FRG-21G — Visual Overhaul and Cross-Forge Asset Migration Integration Plan **v0.2** — active replacement source
- SRC-FRG-21G-AMEND — 21G v0.2 Amendment Summary — replacement/provenance authority
- SRC-FRG-21G-HIST — Visual Overhaul and Asset Migration Plan v0.1 — **SUPERSEDED by 21G v0.2**

**21G v0.2 authority split:**

- **21G** owns Asset Forge production/migration for terrain, materials, construction families, generated shapes, unique blocks, items, props, functional stations, machines, logistics, magical-infrastructure bodies and shared visual kits.
- **22L** owns entity production/migration, rigs, locomotion, equipment fitting, gameplay markers and complete semantic Blueprint Forge migration.
- **23J** owns Presentation Profiles, Event Contracts, spatial presentation references, voxel VFX, audio, lights, surface feedback, material responses, accessibility, budgets and presentation migration.

A complete building batch therefore distinguishes Asset-Kit Ready (21G), Simulation Ready (22L), Presentation Ready (23J), and Integrated Release Ready (combined approval). 21G v0.2 preserves the original Asset Forge production strategy while superseding the old 21G file's cross-Forge integration treatment.

**Authority note:** authoring/asset requirements are active inputs. Summer/Godot implementation specifics in technical-plan material are subject to PRD technical reassessment.

### Set 22 — Entity and Blueprint Forge

**Package:** `Leyforge_Forge_Document_Set_22_v0_1(1).zip`

- SRC-FRG-22A — Forge Entity and Blueprint Expansion Core System v0.1
- SRC-FRG-22B — Entity Model Taxonomy, Anatomy and Body Architecture v0.1
- SRC-FRG-22C — Humanoid Player Character and NPC Creator v0.1
- SRC-FRG-22D — Creature, Mob, Monster and Boss Model Creator v0.1
- SRC-FRG-22E — Skeletons, Rigging, Joints, IK and Attachment Systems v0.1
- SRC-FRG-22F — Entity Animation, Locomotion, Combat and Visual States v0.1
- SRC-FRG-22G — Character Customisation, Equipment Variants and Visual Inheritance v0.1
- SRC-FRG-22H — Entity Gameplay Integration, Hitboxes, AI Markers and Simulation LOD v0.1
- SRC-FRG-22I — Blueprint Forge, Building, Structure and World Blueprint Authoring v0.1
- SRC-FRG-22J — Unified Forge UI/UX and Creator Workflow v0.1
- SRC-FRG-22K — Forge Entity and Blueprint Technical Implementation Plan v0.1
- SRC-FRG-22L — Entity and Blueprint Visual Production and Migration Plan v0.1

### Set 23 — Presentation Forge

**Archive supplied:** `23-A-J.7z`  
**Container limitation:** 7z archive cannot currently be directly enumerated by the local archive utility; the File Library contains the individual documents and confirms the set structure.

- SRC-FRG-23A — Presentation Forge Vision, Scope and Shared Foundation v0.1
- SRC-FRG-23B — Spatial Anchors, Sockets, Regions, Paths and Attachment System v0.1
- SRC-FRG-23C — Presentation Events, Bindings, Parameters and Cross-System Integration v0.1
- SRC-FRG-23D — Particle and VFX Forge Core Authoring System v0.1
- SRC-FRG-23E — Voxel Particle Graph, Emitters, Trails, Volumes, Lighting and Simulation v0.1
- SRC-FRG-23F — Sound Forge Core Authoring and Sound Event System v0.1
- SRC-FRG-23G — Material Audio, Spatial Sound, Ambience, Acoustics and Runtime Mixing v0.1
- SRC-FRG-23H — Unified Presentation Forge UI/UX, Creator Workflow, Preview Laboratory and Accessibility v0.1
- SRC-FRG-23I — Godot and Summer Engine Technical Implementation Plan v0.1
- SRC-FRG-23J — Presentation Forge Asset Libraries, Registries, Production Pipeline, Testing and Migration v0.1

**Important retained invariant:** canonical editable Forge source and baked runtime products are separate; generated runtime products are replaceable outputs rather than the only editable truth.

**Round-4 revision check:** the available File Library confirms the current 23A–23J v0.1 family. No later Set-23 revision or amendment was found in the available corpus during this pass. This is an availability-scoped finding, not a claim that no external/private revision could exist. 21G v0.2 explicitly treats 22L and 23J as the approved specialist migration authorities it coordinates with.

---

## 5.4 Document Set 24 — World Content Atlas

**Package:** `Leyforge_Document_Set_24_World_Content_Atlas_MD_v0_1(1).zip`  
**Package lifecycle:** active historical/post-POC atlas source, superseded by later FCC only where FCC owns and conflicts with the same content field.  
**Implementation maturity:** DESIGN ONLY / CONTENT SOURCE.

| ID | Exact document | Version | Scope / authority | PRD-01 |
|---|---|---|---|:---:|
| SRC-SET-24-INDEX | `00 - Document Set 24 Index.md` | v0.1 package | Set navigation/index | Yes |
| SRC-SET-24A | `24A - Foundations, World Topology and Procedural Content Rules.md` | v0.1 | Atlas topology/procedural-content source | Yes |
| SRC-SET-24B | `24B - Overworld Regions, Climate and Surface Biomes.md` | v0.1 | Pre-FCC Overworld surface atlas | Yes |
| SRC-SET-24C | `24C - Oceans, Coasts, Islands, Skylands, Underground and Special Overworld Biomes.md` | v0.1 | Pre-FCC special-Overworld atlas | Yes |
| SRC-SET-24D | `24D - Dimensions, Realm Structure and Realm Biome Atlas.md` | v0.1 | Pre-FCC realm/topology atlas | Yes |
| SRC-SET-24E | `24E - Peoples, Cultures, Factions and Settlement Atlas.md` | v0.1 | Peoples/civilisation content source | Yes |
| SRC-SET-24F | `24F - Wildlife, Creatures, Monsters and Ecology Atlas.md` | v0.1 | Ecology/creature source | Yes |
| SRC-SET-24G | `24G - Dungeons, Ruins, Lairs and Megadungeons Atlas.md` | v0.1 | Site/adventure source | Yes |
| SRC-SET-24H | `24H - Bosses, Titans, Siege Threats and Realm Guardians Atlas.md` | v0.1 | Major-encounter source | Yes |
| SRC-SET-24I | `24I - Structures, Landmarks, Routes, Wonders and World Infrastructure Atlas.md` | v0.1 | Structure/infrastructure source | Yes |
| SRC-SET-24J | `24J - Resources, Loot, Relics, Trade and Material Ecology Atlas.md` | v0.1 | Resource/material-provenance source | Yes |
| SRC-SET-24K | `24K - World History, Story Arcs, Events and Dynamic World States Atlas.md` | v0.1 | History/event/state source | Yes |
| SRC-SET-24L | `24L - Content Registry, Cross-Link Matrix, Budgets and Production Roadmap.md` | v0.1 | Atlas registry/cross-link/production source | Yes |

**Authority note:** later locked FCC content supersedes conflicting realm/Overworld content within FCC-owned scope. Atlas rows remain valuable for provenance, non-conflicting universal requirements, old aliases and PRD-01 completeness checking.

---

## 5.5 Document Set 25 — Governance / Registries / Integration

**Package:** `Leyforge_Document_Set_25_Post_Atlas_Production_Governance_Registries_Classification_and_Integration_v0_1(1).zip`  
**Package:** v0.1; contains current authoritative 25A–25L; 25A/25B are v0.2, 25C–25L v0.1. Superseded 25A/25B v0.1 intentionally excluded.

| ID | Document | Version | Role |
|---|---|---|---|
| SRC-SET-25A | Post-Atlas Production Governance, POC Retirement Baseline and Decision Register | v0.2 | Governance / POC retirement / authority |
| SRC-SET-25B | Canonical Registry Kernel, Stable IDs, Namespaces and Source-of-Truth Ownership | v0.2 | Registry identity / ownership authority |
| SRC-SET-25C | Domain Schemas, Relationship Graph, Capabilities, Suitability, Fallbacks and Completeness Contracts | v0.1 | Governance/schema |
| SRC-SET-25D | Content Packs, Manifests, Authoring Formats, Import/Export and Migration | v0.1 | Packaging/migration |
| SRC-SET-25E | Validation Architecture, Seed QA, Progression Reachability, Performance and Release Gates | v0.1 | Validation |
| SRC-SET-25F | Core Production Atlas Classification and Scope Lock | v0.1 | Production scope |
| SRC-SET-25G | Core Production Package Dependency and Progression Matrix | v0.1 | Dependency planning |
| SRC-SET-25H | Core Production Block Family Catalogue | v0.1 | Block-family planning source |
| SRC-SET-25I | Core Production Item Family Catalogue | v0.1 | Item-family planning source |
| SRC-SET-25J | Resource, Loot, Provenance, Progression and Recipe Chain Matrix | v0.1 | Physical/progression chain source |
| SRC-SET-25K | Asset Budgets, Forge, Animation, Audio, VFX, Socket and Event Manifest Contract | v0.1 | Asset/Forge admission contract |
| SRC-SET-25L | Production Backlog, Summer Engine Task Contract and Source-of-Truth Integrity Audit | v0.1 | Historical/current production-control input; Summer-specific parts subject to supersession |

**Important authority distinction:** Set 25 owns governance/identity/integration contracts; it does not absorb detailed specialist gameplay authority such as maritime design.

**Lifecycle distinction:** completion of the planned 25A–25L drafting sequence is not final Set 25 integration closure and does not imply implementation. 25L explicitly separates document-sequence completion, production-specification closure, foundation implementation readiness, Core integration closure, Set 26 integration closure and release closure. PRD-00 therefore treats Set 25 as a current **design/governance authority** while preserving its unresolved integration and executable-evidence gates.

**Registry-kernel rule retained for PRD:** 25B's current working contract uses one qualified stable identity, one canonical field owner, immutable authored definitions, and separate generated bindings / persistent instances / spatial frames. Legacy short IDs and engine paths remain migration inputs, not production identity authority. Final FCC-13/LFE work may refine or supersede relevant registry details only through explicit controlled ownership.

---

## 5.6 Document Set 26 — Oceans / Maritime / Vessels / Naval Systems

**Package:** `Leyforge_Document_Set_26_Oceans_Maritime_Civilisation_Vessels_and_Naval_Systems_Expansion_v0_1(1).zip`  
**Source lifecycle:** specialist design programme complete at design-bible v0.1 level.  
**Implementation maturity:** DESIGN ONLY except where separate prototype/test evidence exists; package completion does not prove vessel/fluid/runtime feasibility.

| ID | Exact document | Version | Primary scope | PRD-01 |
|---|---|---|---|:---:|
| SRC-SET-26A | `26A_Fantasy_Voxel_Civilisation_Sandbox_Maritime_and_Naval_Expansion_Vision_Scope_Authority_and_Integration_Foundation_v0_1.md` | v0.1 | Maritime authority/integration foundation | Yes |
| SRC-SET-26B | `26B_Fantasy_Voxel_Civilisation_Sandbox_Water_Liquid_and_Fluid_Simulation_Overhaul_v0_1.md` | v0.1 | Water/liquid/fluid simulation requirements | Yes |
| SRC-SET-26C | `26C_Fantasy_Voxel_Civilisation_Sandbox_Oceans_Coasts_Islands_and_Underwater_World_Generation_v0_1.md` | v0.1 | Marine world generation | Yes |
| SRC-SET-26D | `26D_Fantasy_Voxel_Civilisation_Sandbox_Marine_Climate_Wind_Waves_Tides_Currents_and_Storm_Systems_v0_1.md` | v0.1 | Marine environment/weather | Yes |
| SRC-SET-26E | `26E_Fantasy_Voxel_Civilisation_Sandbox_Swimming_Diving_and_Underwater_Player_Interaction_v0_1.md` | v0.1 | Aquatic player locomotion/interaction | Yes |
| SRC-SET-26F | `26F_Fantasy_Voxel_Civilisation_Sandbox_Voxel_Vessel_Architecture_Structural_Roles_and_Commissioning_v0_1.md` | v0.1 | Voxel-vessel structure/identity | Yes |
| SRC-SET-26G | `26G_Fantasy_Voxel_Civilisation_Sandbox_Vessel_Movement_Buoyancy_Propulsion_Steering_and_Navigation_v0_1.md` | v0.1 | Vessel movement/nav | Yes |
| SRC-SET-26H | `26H_Fantasy_Voxel_Civilisation_Sandbox_Shipwright_Tools_Construction_Repair_Refitting_and_Salvage_v0_1.md` | v0.1 | Construction/repair/salvage | Yes |
| SRC-SET-26I | `26I_Fantasy_Voxel_Civilisation_Sandbox_Vessel_Forge_Blueprint_Authoring_and_Procedural_Ship_Variants_v0_1.md` | v0.1 | Vessel Forge authoring | Yes |
| SRC-SET-26J | `26J_Fantasy_Voxel_Civilisation_Sandbox_Ports_Harbours_Shipyards_Crews_and_Maritime_Civilisation_v0_1.md` | v0.1 | Ports/crews/civilisation | Yes |
| SRC-SET-26K | `26K_Fantasy_Voxel_Civilisation_Sandbox_Maritime_Trade_Fleets_Piracy_Navies_and_Regional_Power_v0_1.md` | v0.1 | Trade/fleets/power | Yes |
| SRC-SET-26L | `26L_Fantasy_Voxel_Civilisation_Sandbox_Naval_Combat_Boarding_Damage_Flooding_Fire_and_Siege_v0_1.md` | v0.1 | Naval combat/damage | Yes |
| SRC-SET-26M | `26M_Fantasy_Voxel_Civilisation_Sandbox_Marine_Ecology_Fishing_Sea_Creatures_Dungeons_and_Bosses_v0_1.md` | v0.1 | Marine ecology/adventure | Yes |
| SRC-SET-26N | `26N_Fantasy_Voxel_Civilisation_Sandbox_Maritime_Progression_Registries_Magic_Automation_Economy_Quests_and_Events_v0_1.md` | v0.1 | Cross-system maritime integration | Yes |
| SRC-SET-26O | `26O_Fantasy_Voxel_Civilisation_Sandbox_Maritime_UI_UX_Multiplayer_Godot_Summer_Engine_Technical_Plan_Performance_QA_and_Main_Document_Integration_v0_1.md` | v0.1 | UI/MP/technical/performance/QA capstone | Yes, with technical filtering |

**Authority note:** Set 26 is the specialist maritime owner; where its interfaces collide with Set 30, the final 27–30 Cross-Set Interface Register owns the resolved boundary.

**Decision-status rule:** 26O deliberately mixes `Locked`, `Working Lock`, `Recommended Freeze`, `Recommended Production Lock`, `Provisional`, and prototype-dependent decisions. PRD-00 preserves those per-decision states. Numeric vessel budgets and moving-frame engineering assumptions are prototype targets/inputs, not automatically production-qualified rules.

---

## 5.7 Document Sets 27–30 — Final Reconciled Package

**Package:** `Leyforge_Document_Sets_27-30_Final_Reconciled_v1_1(1).zip`  
**Integration baseline:** Cross-Set Interface Register v1.1, dated 8 August 2026.  
**Interface lifecycle:** **Approved integration baseline / Final Reconciled Contract** for interfaces between Sets 27–30; supersedes XSI v1.0.  
**Package status:** each reconciled set package is v0.2; A–I remain v0.1 where gameplay did not change; J is v0.2.

### Set 27 — Economy, Markets, Contracts, Trade and Public Finance

| ID | Exact document | Version |
|---|---|---|
| SRC-SET-27A | Economic Vision, Architecture and Ownership | v0.1 |
| SRC-SET-27B | Currency, Barter, Value and Price Formation | v0.1 |
| SRC-SET-27C | Markets, Merchants, Stock and Supply-Demand Simulation | v0.1 |
| SRC-SET-27D | Labour, Wages, Households, Businesses and Ownership | v0.1 |
| SRC-SET-27E | Contracts, Orders, Services, Breach and Enforcement | v0.1 |
| SRC-SET-27F | Credit, Debt, Banking, Insurance and Financial Risk | v0.1 |
| SRC-SET-27G | Taxation, Tariffs, Treasuries and Public Finance | v0.1 |
| SRC-SET-27H | Trade Routes, Caravans, Regional Exchange and Cross-Realm Commerce | v0.1 |
| SRC-SET-27I | Monopolies, Embargoes, Smuggling, Black Markets and Economic Conflict | v0.1 |
| SRC-SET-27J | Economy UI, Simulation LOD, Multiplayer, Registries and Integration | v0.2 |

### Set 28 — Dialogue, Social Systems and Companions

| ID | Exact document | Version |
|---|---|---|
| SRC-SET-28A | Social System Vision, Architecture and Ownership | v0.1 |
| SRC-SET-28B | Dialogue Runtime, Conversation Structure and Context | v0.1 |
| SRC-SET-28C | Knowledge, Rumours, Truth, Lies, Languages and Information Spread | v0.1 |
| SRC-SET-28D | Relationships, Memory, Trust, Loyalty, Affection and Rivalry | v0.1 |
| SRC-SET-28E | Persuasion, Negotiation, Intimidation, Etiquette and Social Consequences | v0.1 |
| SRC-SET-28F | Companion, Follower, Hireling and Temporary Ally System | v0.1 |
| SRC-SET-28G | Orders, Delegation, Assignments, Autonomy and Off-Screen Resolution | v0.1 |
| SRC-SET-28H | Authored, Procedural and AI-Assisted Dialogue Governance | v0.1 |
| SRC-SET-28I | Voice, Localisation, Accessibility, UI and Presentation | v0.1 |
| SRC-SET-28J | Multiplayer, Persistence, Registries, Validation and Cross-System Integration | v0.2 |

### Set 29 — Survival, Health and Biological Systems

| ID | Exact document | Version |
|---|---|---|
| SRC-SET-29A | Survival, Health and Biological System Foundation | v0.1 |
| SRC-SET-29B | Health, Stamina, Exertion, Fatigue and Biological Recovery | v0.1 |
| SRC-SET-29C | Hunger, Thirst, Nutrition and Consumption | v0.1 |
| SRC-SET-29D | Temperature, Wetness, Shelter, Sleep and Environmental Exposure | v0.1 |
| SRC-SET-29E | Injuries, Wounds, Bleeding, Pain and Functional Impairment | v0.1 |
| SRC-SET-29F | Disease, Infection, Poison, Toxins and Biological Hazards | v0.1 |
| SRC-SET-29G | Medicine, First Aid, Healing, Treatment and Rehabilitation | v0.1 |
| SRC-SET-29H | Biological Profiles, Equipment, Magic, Settlement and Environmental Integration | v0.1 |
| SRC-SET-29I | Simulation LOD, Multiplayer, Persistence, UI and Accessibility | v0.1 |
| SRC-SET-29J | Biological Registries, APIs, Balance Framework, Validation and Cross-System Integration | v0.2 |

### Set 30 — Movement, Traversal and Transportation

| ID | Exact document | Version |
|---|---|---|
| SRC-SET-30A | Movement, Traversal and Transportation System Architecture | v0.1 |
| SRC-SET-30B | Core Player Locomotion, Controls, Camera and Movement States | v0.1 |
| SRC-SET-30C | Climbing, Vaulting, Mantling, Ladders, Ropes and Grappling | v0.1 |
| SRC-SET-30D | Gliding, Falling, Aerial Traversal and Environmental Movement | v0.1 |
| SRC-SET-30E | Mounts, Riding, Saddles, Harnesses and Mounted Traversal | v0.1 |
| SRC-SET-30F | Work Animals, Handcarts, Wagons, Carriages and Caravans | v0.1 |
| SRC-SET-30G | Rails, Minecarts, Elevators and Powered Land Transportation | v0.1 |
| SRC-SET-30H | Roads, Routes, Terrain Accessibility, Navigation and Long-Distance Travel | v0.1 |
| SRC-SET-30I | NPC Navigation, Pathfinding, Formations, Multiplayer and Persistence | v0.1 |
| SRC-SET-30J | Movement Registries, Physics Contracts, Validation and Final Integration | v0.2 |

### Cross-set authorities

| ID | Exact source | Version | Authority |
|---|---|---|---|
| SRC-XSI-27-30 | `Leyforge_Document_Sets_27-30_Cross-Set_Interface_Register_v1_1_Final_Reconciled.md` | v1.1 | Final reconciled interface ownership baseline |
| SRC-XSI-27-30-REPORT | `Leyforge_Document_Sets_27-30_Final_Cross-Set_Reconciliation_and_Integration_Report_v1_1.md` | v1.1 | Reconciliation evidence/report |

**All 27A–30J are mandatory PRD-01 inputs.** One gameplay rule has one owner; consumers receive typed/versioned snapshots or interfaces rather than recreating another owner's formula. World clock/authoritative simulation time and global actor promotion remain technical/world-authority responsibilities outside Sets 27–30.

---

# 6. FCC Source Family

## 6.1 FCC-01 — Overworld

**Package:** `Leyforge_FCC-01_Overworld_FULL_PACKAGE_LOCKED(1).zip`  
**Status:** **CONTENT CANON LOCKED — pending final cross-realm reconciliation**.  
**Fidelity:** zero remaining FCC-01 fidelity holds.

### Final locked A–J

- SRC-FCC-01A — Overworld Identity, Cosmology, World Topology, Progression and Canon Boundaries v0.1
- SRC-FCC-01B — Continents, Climate, Biomes, Oceans, Skylands, Underground, Hazards and Regional States v0.2 Final Pass
- SRC-FCC-01C — Overworld Geology, Materials, Resources, Processing Foundations and Provenance v0.2 Final Pass
- SRC-FCC-01D — Overworld Flora, Fungi, Agriculture, Crops, Foods and Botanical Ecology v0.2 Final Pass
- SRC-FCC-01E1 — Ordinary Fauna, Food Webs, Husbandry and Environmental Ecology v0.2 Final Pass
- SRC-FCC-01E2 — Monsters, Magical Fauna, Undead, Constructs, Creature Materials and Classification Boundaries v0.1
- SRC-FCC-01F1 — Peoples, Cultures, Religions, Governments, Factions, Law and Civilisation Identity v0.1
- SRC-FCC-01F2 — Settlements, Population Geography, Economy, Trade, Industry and Civilisation Infrastructure v0.1
- SRC-FCC-01G1 — Structures, Landmarks, Routes, Infrastructure, Megaprojects and Wonders v0.1
- SRC-FCC-01G2 — Portal Archaeology, Realm Discovery, Research Institutions and Pre-Access Provenance v0.1
- SRC-FCC-01H1 — Dungeons, Ruins, Lairs, Sites and Megadungeons v0.1
- SRC-FCC-01H2 — Bosses, Titans, Authorities, Siege Threats and Major Encounters v0.1
- SRC-FCC-01I1 — Magic Ecology, History, Archaeology, Events, Dynamic States and Persistent Aftermath v0.1
- SRC-FCC-01I2 — Cross-Realm Interfaces, Migration, Trade, Capability Freedom and Void Boundaries v0.1
- SRC-FCC-01J — Final Canon Registry, Completeness Audit, Global Reconciliation Handoff and Art Readiness v0.3 LOCKED

### FCC-01 governance/provenance artefacts

- SRC-FCC-01-STEP2A — Realm-by-Realm Overworld Reconciliation Extraction v0.1
- SRC-FCC-01-STEP2B — Cross-Realm Collision and Source-Reconciliation Pass v0.1
- SRC-FCC-01-STEP2C — Ownership Classification and Decision-Routing Register v0.1
- SRC-FCC-01-STEP2D — Interview Architecture and Completeness Map v0.1
- SRC-FCC-01-AUDIT2 — Final Document-to-Interview Fidelity Audit v0.2 ZERO HOLD
- SRC-FCC-01-AMEND — Final Exact-Transcription Recovery and Lost-Source Amendment Packet v0.1
- SRC-FCC-01-LOCK — Overworld Content Canon Lock Certificate v1.0

### FCC-01 superseded history

The package explicitly contains superseded B/C/D/E1 v0.1 drafts, J v0.1/v0.2 and Fidelity Audit v0.1 under a superseded/audit-history folder. These remain provenance only and may not override the locked versions above.

---

## 6.2 Completed realm FCC packages supplied

The supplied FCC collection contains six completed realm FCC packages. Each is a first-class realm-local content source family pending final global reconciliation. PRD-00 records source-embedded status and project lifecycle state separately where the package preserves pre-acceptance wording.

| Source family | Realm | Exact package | Current treatment |
|---|---|---|---|
| SRC-FCC-02A–J | Verdant Covenant | `Leyforge_FCC-02_Verdant_Covenant_Content_Canon_v0_1.zip` | Realm-local canon; final global reconciliation pending |
| SRC-FCC-03A–J | Ancestral Veil | `Leyforge_FCC03_Ancestral_Veil_Current_Reviewed_Set.zip` | Realm-local canon; H v0.2 supersedes H v0.1; later project acceptance recorded, J preserves owner-review wording |
| SRC-FCC-04A–J | Somnolent Expanse | `Leyforge_FCC-04_Somnolent_Expanse_Content_Canon_v0_1.zip` | Realm-local canon in current project lifecycle; J preserves owner-review candidate wording; global reconciliation pending |
| SRC-FCC-05A–J | Ascendant Reach | `Leyforge_FCC-05_Ascendant_Reach_Content_Canon_v0_1.zip` | Realm-local canon in current project lifecycle; J preserves owner-review candidate wording; global reconciliation pending |
| SRC-FCC-06A–J | Impossible Deep | `FCC-06_Impossible_Deep_Complete_Content_Canon_v0_1.zip` | Realm-local canon locked; global reconciliation pending |
| SRC-FCC-08A–J | Ashen Lower Realms | `Leyforge_FCC-08_Ashen_Lower_Realms_Content_Canon_v0_1_REVIEWED.zip` | Realm-local canon locked/reviewed; global reconciliation pending |

### Realm FCC document ownership pattern

The six packages each preserve A–J specialist ownership. Exact filenames are captured in Appendix A. Broadly:

- **A** — realm identity/laws/progression/canon boundaries;
- **B** — biomes/terrain/environmental states/hazards;
- **C** — geology/materials/resources/provenance;
- **D** — flora/fungi/agriculture/food;
- **E** — creatures/ecology/material interfaces;
- **F** — peoples/civilisations/settlements/infrastructure;
- **G** — structures/sites/portal/Blocks/Items/processing/recipes as realm-local handoff;
- **H** — dungeons/guardians/authorities/major encounters/events;
- **I** — corruption/realm states/restoration/cross-realm interfaces;
- **J** — final registry/completeness/certification/art handoff.

A realm's J document is the certification/index/handoff authority but does not erase A–I detailed ownership unless it explicitly records a certification-time reconciliation.

**Numbering note:** no current FCC-07 package exists in the supplied corpus. Historical FCC text refers to World-Engine work as future/deferred under FCC-07, but PRD-00 does not promote the numbering gap into a current missing-canon blocker without an explicit current FCC roadmap/index requiring it.

## 6.3 Downstream FCC sources — FCC-12 source reconciliation complete; FCC-13/14 expected

FCC-01 routes remaining universal/global work to FCC-12, FCC-13 and FCC-14. Round 5 confirms that FCC-12 Steps 1A–1D now exist; Step 1D closes the source-reconciliation/pre-interview phase and routes next to U01.

| ID | Exact source | Version / date | Lifecycle | Authority use |
|---|---|---|---|---|
| SRC-FCC-12-1A | `FCC-12_Step_1A_Universal_Material_Source_Corpus_Authority_and_Collision_Extraction_v0_1.md` | v0.1 — 27 Aug 2026 | **ACTIVE / source-reconciliation working document** | Extracts current material corpus and authority/collision questions; does not invent new global merge/split decisions |
| SRC-FCC-12-1B | `FCC-12_Step_1B_Cross-Realm_Material_Collision_Equivalence_Lineage_and_State-vs-Identity_Matrix_v0_1.md` | v0.1 — 27 Aug 2026 | **ACTIVE / locked relationships recorded; unresolved relationships deferred** | Classifies material identity/lineage/state/provenance/alias relationships |
| SRC-FCC-12-1C | `FCC-12_Step_1C_Universal_Derived_Form_Processing_Inheritance_and_Material_Transformation_Deduplication_Matrix_v0_1.md` | v0.1 — 27 Aug 2026 | **ACTIVE / proposed-for-interview, not final locked** | Defines structural form/process questions and routes next to Step 1D |
| SRC-FCC-12-1D | `FCC-12_Step_1D_Interview_Architecture_Question_Map_and_Completeness_Gate_v0_1.md` | v0.1 — 27 Aug 2026 | **SOURCE-RECONCILIATION COMPLETE / decision interview architecture ready** | Closes FCC-12 pre-interview reconciliation; defines A–D ownership and routes next to U01 decision interview |
| SRC-MISS-FCC13 | FCC-13 — Definitive Blocks, Items & Recipes | expected downstream | **EXPECTED / not yet supplied** | Final registry rows/IDs/aliases/recipes/portal recipes and migration bindings |
| SRC-MISS-FCC14 | FCC-14 — Canon Certification & Art Handoff | expected downstream | **EXPECTED / not yet supplied** | Final cross-realm/global certification and art handoff |

**Update obligation:** PRD-00 closes with FCC-12 Steps 1A–1D registered. FCC-12 has completed its source-reconciliation/pre-interview phase but has not yet reached final content lock. PRD-01 may begin exhaustive extraction now; material/registry/global-reconciliation requirements must receive controlled delta reconciliation as the FCC-12 decision interview/A–D canon, FCC-13 and FCC-14 mature. PRD-09 and final LFE/FORGE-ENG freeze cannot treat unresolved FCC-owned fields as silently settled.

---

# 7. Recovered Planning / Roadmap Sources

| ID | Source | Class | Authority use |
|---|---|---|---|
| SRC-CHAT-OPT | `Voxel cube game planning - Project Optimisation Discussion.pdf` | Recovered planning evidence | Defines the pre-rebuild discovery method, evidence classifications and P0–P5 proof ladder; engineering proposals require formal PRD/LFE adoption unless they record explicit approved project direction. |
| SRC-CHAT-POST30 | `Voxel cube game planning - Post-30 Doc Set Ideas.pdf` | Recovered roadmap / future constraint source | Establishes working Sets 31–42 production roadmap and 43+ future-expansion register. |
| SRC-NAV-PRERB | `Leyforge_Pre-Rebuild_Roadmap_Checklist_v0_2.docx` | Navigation/status only | Current navigation/status view after PRD-00 closure; records FCC-01 locked, PRD-00 done, PRD-01 next and FCC-12/13/14 parallel content work. Cannot override underlying sources. |

---

# 8. Research / Evidence Sources

Available in the user's File Library:

| ID | Source | Status / role |
|---|---|---|
| SRC-RSCH-VS1 | Vintage Story — Pass 1 Feature/Architecture Map | Research/evidence only |
| SRC-RSCH-VS2 | Vintage Story — Pass 2: Engineering Teardown | Research/evidence only |
| SRC-RSCH-VS3 | Vintage Story Failure Archaeology — Pass Three | Research/evidence only |
| SRC-RSCH-P4 | Pass Four Comparative Architecture Study for Leyforge | Research/evidence only |
| SRC-RSCH-P5 | Leyforge Architecture Synthesis: Pass Five | **Provisional architecture synthesis**; not final engineering canon until reconciled through PRD and later adopted by LFE/FORGE-ENG |

PRD-05 will map these findings to actual Leyforge requirements. PRD-00 records their existence and authority only.

---

# 9. Historical / Prototype Evidence

| ID | Source | Status | Retained value |
|---|---|---|---|
| SRC-POC-99 | `99_Leyforge_POC_Manual_Testing_Guide_v0_1.md` (content identifies itself as v0.3, last updated 28 July 2026) | Historical implementation/regression evidence | Behavioural tests, successful mechanics, migration fixtures, benchmark history, regressions; never current production design authority |
| SRC-POC-VOXREG | `VoxelRegistry.json` | Historical/prototype registry evidence | Migration aliases, old IDs, implementation history and test data only unless admitted by current registry/FCC owners |

**Important discrepancy:** the filename says `v0_1`, while the document body states Version 0.3. Register body version as the content revision and filename as the supplied artefact name; do not silently rename it.

---

# 10. Future Production Constraints

From the recovered Post-30 roadmap:

- SRC-FUT-31 — Multiplayer, Networking, Hosting & Shared Worlds
- SRC-FUT-32 — Full Human Review, Bug Fixing, Optimisation & Production Hardening
- SRC-FUT-33 — Unified Forge Overhaul, Player Creator Security & Content-Pack Architecture
- SRC-FUT-34 — Settings, Controls & Player Configuration
- SRC-FUT-35 — Realm Creation, Simulation Complexity & Hardware Scalability
- SRC-FUT-36 — Main Menu, Front-End & Realm Management
- SRC-FUT-37 — Modding, Workshop & Community Content
- SRC-FUT-38 — Dedicated Server Administration & Realm Operations
- SRC-FUT-39 — Game Updates, Patching, Versioning & Release Lifecycle
- SRC-FUT-40 — Release Diagnostics, Crash Reporting, Recovery & Support Tools
- SRC-FUT-41 — Accessibility, Localisation & Final UX Certification
- SRC-FUT-42 — Platform, Distribution & Production Release
- SRC-FUT-43PLUS — intentionally unnumbered Future Expansion Register / stress horizon

These are not all pre-rebuild implementation blockers. Their architectural constraints must be represented before choices are frozen where later compatibility would otherwise be impossible.

---

# 11. Reserved Future Engineering Canon

These source families do not yet exist and therefore cannot currently override design or research sources.

- SRC-LFE-* — future Leyforge Engine canonical engineering specifications.
- SRC-FORGEENG-* — future Forge canonical engineering specifications.

They become engineering authority only after PRD closure, evidence review and explicit approval.

---

# 12. Initial Supersession / Provenance Map

| Earlier source / assumption | Current disposition | Successor / owner |
|---|---|---|
| Unreal-specific Foundation technical assumptions | Technical implementation superseded; engine-neutral requirements retained | Current Godot direction + PRD/LFE future decisions |
| Summer Engine as voxel/runtime foundation | No longer assumed as production voxel foundation; historical implementation remains evidence | Godot + Zylann is current candidate, subject to PRD-02/03/prototypes |
| Fixed Forest Hamlet / valley / named POC arrangements | Archived Validation / regression evidence | Seed-generated production systems and current canon |
| POC block/item IDs and `VoxelRegistry.json` paths | Migration/prototype evidence, not production identity authority | Set 25 registry governance; FCC-13 future final registry work |
| 21G Visual Overhaul and Asset Migration Plan v0.1 | **Superseded** | 21G Visual Overhaul and Cross-Forge Asset Migration Integration Plan v0.2 + amendment summary |
| “Set 25 documents complete = Set 25 integration complete” | **Rejected lifecycle inference** | 25L distinguishes drafting sequence, specification closure, implementation readiness, integration closure and release closure |
| “Set 26 design complete = vessel/ocean implementation proven” | **Rejected lifecycle inference** | Set 26 remains specialist design authority; prototype-dependent/provisional decisions flow to PRD-06/07/08 |
| Old Set 20 v0.1 companions | Superseded within the Set 20 companion family | Set 20 v0.2 |
| Foundation package's pre-companion 20A–20H state | Later standalone v0.2 companions supply the current detailed/integration treatment; Foundation 20 remains broad foundation where not contradicted | Set 20 v0.2 for companion-owned fields; no blanket whole-document supersession without explicit instruction |
| Atlas 24 realm/Overworld content conflicting with later locked FCC | Superseded within FCC-owned content scope | relevant locked FCC source |
| FCC-01 B/C/D/E1 v0.1 and J/audit prior drafts | Superseded provenance only | locked Final Pass / v0.3 / zero-hold audit |
| Sets 27–30 provisional interface wording and XSI v1.0 | Superseded for 27–30 interface status/ownership | XSI v1.1 Final Reconciled + J v0.2 |
| Pass 5 architecture synthesis | Provisional synthesis/evidence | PRD validation → future LFE/FORGE-ENG if adopted |
| FCC-12 formerly registered as wholly future/missing | **Status updated through Round 5** | FCC-12 Steps 1A–1D now exist; the source-reconciliation/pre-interview phase is complete and the U01 decision interview is next; FCC-13/14 remain downstream expected owners |
| PRD roadmap checklist | Navigation only | underlying source corpus + PRD documents |

---

# 13. Conflict / Ambiguity / Missing-Source Register — Round 4

| ID | Issue | Current disposition | Resolution action / downstream gate |
|---|---|---|---|
| CAM-001 | Foundation 20 v1.0 vs standalone Set 20 v0.2 | **Resolved for PRD-00.** Set 20 v0.2 explicitly supersedes earlier Set-20 v0.1 companions; no evidence supports blanket replacement of Foundation 20 v1.0. | PRD-01 uses field/scope ownership: detailed companion fields from v0.2; broad Foundation 20 where not contradicted. |
| CAM-002 | Set 23 supplied as 7z; local archive utility cannot enumerate it | **Controlled.** File Library confirms 23A–J v0.1. No later Set-23 revision/amendment found in available corpus during Round 4. | Use File Library identities; retain availability-scoped caveat; optional archival repack later. |
| CAM-003 | FCC numbering gap: no current FCC-07 package | **Not a current blocker.** Historical FCC text associates FCC-07 with deferred World-Engine work, but no current package requirement is established by numbering alone. | Preserve provenance question; only elevate if an explicit current FCC roadmap/index activates FCC-07. |
| CAM-004 | FCC-12 was previously registered as wholly expected/missing | **Resolved/updated through closure.** Steps 1A–1D now exist; Step 1D records `FCC-12 SOURCE-RECONCILIATION / PRE-INTERVIEW PHASE COMPLETE` and routes next to U01. | Register SRC-FCC-12-1A/1B/1C/1D in the v1.0 baseline; add interview, A–D writing, fidelity/lock and later global outputs through controlled delta revisions. |
| CAM-005 | FCC-13 and FCC-14 not yet supplied | **Open expected-source slots.** | PRD-01 tags their owned fields as pending; PRD-09/LFE/FORGE-ENG freeze requires relevant completed outputs. |
| CAM-006 | POC guide supplied filename says v0_1 while body says v0.3 | **Resolved handling.** | Store artefact filename and body-declared content version separately. |
| CAM-007 | Old technical docs name Summer Engine / previous runtime assumptions | **Controlled historical technical source.** | PRD-01 extracts engine-neutral requirements; PRD-02/03/04/prototypes determine replacement; LFE supersedes implementation instructions explicitly. |
| CAM-008 | Pass 5 contains recommended architecture and numeric targets | **Provisional synthesis only.** | PRD-05 crosswalk + PRD-06/07/08 evidence before LFE adoption. |
| CAM-009 | Supplied Set-21 archive contains 21G v0.1 while separate v0.2 exists | **Resolved.** | v0.2 active; v0.1 superseded provenance; 22L/23J handoffs retained. |
| CAM-010 | Set 25 document-sequence completion could be mistaken for implementation/integration closure | **Resolved by lifecycle model.** | Track authority and implementation maturity separately everywhere. |
| CAM-011 | Set 26 design programme complete but engineering contains working/provisional/prototype-dependent choices | **Controlled.** | Preserve per-decision status; route risky technical claims to PRD-06/07/08. |
| CAM-012 | FCC-03/04/05 J files preserve Owner Review Candidate wording while current project lifecycle records later acceptance/lock | **Controlled but provenance linkage remains useful.** | Keep literal source status and project lifecycle state separate; FCC-14/final archive should link or issue controlled acceptance provenance rather than rewriting historical files. |
| CAM-013 | Pre-Rebuild Roadmap Checklist v0.1 showed FCC-01 unfinished | **Resolved at PRD-00 closure.** Navigation v0.2 now records FCC-01 locked, PRD-00 closed and PRD-01 next. | Preserve v0.1 only as historical navigation; future checklist revisions remain non-authoritative status views. |
| CAM-014 | Set 25 stable-ID governance will intersect FCC-13 definitive ID/alias work | **Owner boundary, not contradiction.** | FCC-13/LFE may refine only through explicit field ownership, aliases and migration rules. |
| CAM-015 | `VoxelRegistry.json` contains legacy engine paths, placeholder colours and duplicate Block/Item physical identities | **Historical migration evidence only.** | FCC-12 classifies ontology; FCC-13 owns definitive registry migration; PRD-01 retains compatibility/test requirements, not legacy row authority. |
| CAM-016 | Historical Document 18 revisions include Godot/Summer implementation details that may still contain useful engine-neutral architecture | **Mixed provenance.** | Preserve invariants/requirements; supersede engine-specific instructions through evidence-backed LFE ADRs rather than deleting the document wholesale. |

---

# 14. Source Coverage Matrix — Downstream Consumption Contract

This matrix defines which major source families later work packages are obliged to consume. It is a **coverage obligation**, not permission for a consumer to overwrite the source owner's scope.

**Legend**

- **M** — Mandatory direct input. The work package must inspect/extract from this family.
- **C** — Mandatory constraint/reference. The work package must preserve relevant boundaries even if it does not extract every field.
- **E** — Evidence input. May support/reject engineering options; cannot rewrite canon by itself.
- **O** — Downstream owner/output relationship. The work package produces the future authority or handoff for this family.
- **—** — No routine direct consumption required; use only if a discovered dependency makes it relevant.

| Source family | PRD-01 | PRD-02 | PRD-03 | PRD-04 | PRD-05 | PRD-06 | PRD-07 | PRD-08 | PRD-09 | LFE | FORGE-ENG |
|---|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| Foundation 00–20 + FND reconciliation | **M** | C | C | **M** | C | **M** | C | C | **M** | **M** | C |
| Standalone Set 20 v0.2 | **M** | C | C | **M** | C | **M** | C | C | **M** | **M** | **M** |
| Forge 21–23, incl. 21G v0.2 | **M** | C | C | **M** | C | **M** | **M** | C | **M** | C | **M** |
| World Content Atlas Set 24 | **M** | C | C | C | C | **M** | C | C | **M** | **M** | C |
| Governance / Registry Set 25 | **M** | C | C | **M** | C | **M** | C | **M** | **M** | **M** | **M** |
| Maritime / Vessel Set 26 | **M** | **M** | C | **M** | C | **M** | **M** | **M** | **M** | **M** | **M** |
| Sets 27–30 + XSI v1.1 | **M** | C | C | **M** | C | **M** | **M** | C | **M** | **M** | C |
| FCC-01 + completed realm FCCs | **M** | C | C | **M** | C | **M** | **M** | C | **M** | **M** | **M** |
| FCC-12 active work + FCC-13 / FCC-14 as they mature | **M*** | C | C | **M*** | C | **M*** | C | C | **M*** | **M*** | **M*** |
| Project Optimisation Discussion | **M** | **M** | **M** | C | **M** | **M** | **M** | **M** | **M** | C | C |
| Post-30 Sets 31–42 roadmap | **M** | C | C | **M** | C | **M** | C | C | **M** | **M** | **M** |
| 43+ Future Expansion Register | C | — | — | C | C | C | E | — | C | C | C |
| Research Passes 1–5 | C | **E** | **E** | E | **M** | **E** | **E** | **E** | C | E | E |
| Historical POC guide / registries | **M** | E | E | C | E | **E** | **E** | **E** | C | C | C |
| Official Godot/Zylann/upstream evidence gathered later | — | **M** | **M** | E | **M** | **E** | **E** | **E** | C | E | E |
| PRD-01 requirements inventory | **O** | **M** | **M** | **M** | **M** | **M** | **M** | **M** | **M** | **M** | **M** |
| PRD-02/03 technology audits | — | **O** | **O** | **M** | **M** | **M** | **M** | **M** | **M** | **M** | **M** |
| PRD-04 architecture boundary study | — | — | — | **O** | C | **M** | **M** | **M** | **M** | **M** | **M** |
| PRD-05 evidence crosswalk | — | — | — | — | **O** | **M** | **M** | **M** | **M** | **M** | **M** |
| PRD-06 risk/proof register | — | — | — | — | — | **O** | **M** | **M** | **M** | **M** | **M** |
| PRD-07 prototype programme | — | — | — | — | — | — | **O** | **M** | **M** | E | E |
| PRD-08 results / ADR evidence | — | — | — | — | — | — | — | **O** | **M** | **M** | **M** |
| PRD-09 closure audit | — | — | — | — | — | — | — | — | **O** | **M** | **M** |
| LFE | — | — | — | — | — | — | — | — | C | **O** | C |
| FORGE-ENG | — | — | — | — | — | — | — | — | C | C | **O** |

`*` FCC-12 source reconciliation is complete through Steps 1A–1D and its U01 decision interview is the next FCC action; FCC-13/14 remain expected downstream owners. PRD-01 may proceed now, but any requirement/ownership area later finalised by the FCC-12 interview/A–D canon, FCC-13 or FCC-14 must receive controlled delta reconciliation before PRD-09 and before LFE/FORGE-ENG freeze.

## 14.1 Required coverage principles

1. **PRD-01 is the exhaustive internal extraction pass.** It must consume every active gameplay/content/Forge/FCC/governance source and explicitly route historical/provisional material rather than omitting it.
2. **PRD-02 and PRD-03 are technology audits, not canon audits.** They consume PRD-01 requirements and technology evidence; they do not redesign Leyforge's desired game to fit convenient technology.
3. **PRD-04 may freeze ownership only after requirements and technology facts are visible.** It must preserve specialist ownership already locked in sources such as Set 25, 21G/22L/23J, Set 26 and XSI v1.1 unless an explicit governed redesign is approved.
4. **PRD-05 is where research Passes 1–5 become traceable.** No important research recommendation should survive only as prose disconnected from a Leyforge requirement/risk/ADR.
5. **PRD-06/07/08 convert uncertainty into evidence.** Any `Working Lock`, `Provisional`, unknown, blocker or high-risk engineering assumption that affects foundation viability must receive an explicit proof target or a documented defer/reject decision.
6. **PRD-09 is a coverage audit as well as a risk audit.** It must verify that every mandatory source family above was consumed and that unresolved future sources have bounded update obligations.
7. **LFE and FORGE-ENG are outputs of the evidence chain.** They may supersede earlier technical implementation instructions, but not silently erase gameplay/content/authoring requirements owned elsewhere.

---

# 15. Do-Not-Lose Register

This register preserves decisions and constraints that are especially vulnerable to disappearing between chats, source migrations or technical rewrites. It is deliberately short enough to audit repeatedly.

| DNL ID | Requirement / decision that must survive | Current authority type | Downstream owner / proof route |
|---|---|---|---|
| DNL-001 | **Research first → decisions second → prototypes third → canonical technical documentation fourth → rebuild fifth.** Do not resume broad production implementation from assumptions. | Recovered approved planning/process direction | PRD-00–09; final rebuild gate |
| DNL-002 | Use **P0–P5 proof levels**: Idea, Documentation Evidence, Reference Implementation, Leyforge Prototype, Stress Tested, Production Qualified. | Recovered planning/process direction | PRD-06/07/08/09; LFE acceptance gates |
| DNL-003 | Distinguish **Design Decision**, **Engineering Decision**, and **Technology Fact**. Design follows Leyforge canon; engineering follows tests/profiling; technology facts follow source inspection. | Recovered planning/process direction | All PRD work; ADR/change-control rules |
| DNL-004 | **Godot + Zylann/Voxel Tools is the current rebuild foundation candidate, not unquestioned final technical canon.** Zylann must receive a requirement-driven capability audit and risky gaps must be prototyped. | Current project direction + planning evidence; provisional engineering choice | PRD-02/03/04/06/07 → LFE |
| DNL-005 | **Canonical Leyforge IDs and persistent identity must not be implementation IDs, engine paths or Voxel Tools model IDs.** Runtime bindings remain replaceable implementation detail. | Set 25 governance + optimisation planning | PRD-01/04 → LFE registry/persistence docs; FCC-13 where applicable |
| DNL-006 | **One logical truth has one owner.** Consumers use typed/versioned interfaces, snapshots, commands and evidence instead of duplicating another system's mutable state/formula. | Set 25 + XSI v1.1 governance | PRD-04 → LFE architecture constitution |
| DNL-007 | **Authority/canon status and implementation maturity are separate.** `LOCKED` ≠ `IMPLEMENTED`; `IMPLEMENTED` ≠ `PRODUCTION QUALIFIED`. | PRD-00 lifecycle rule grounded in Set 25 integrity controls | All PRD/LFE/FORGE-ENG lifecycle metadata |
| DNL-008 | **A failed prototype invalidates an engineering approach, not the canonical game requirement.** Difficult features are redesigned or explicitly reopened by their owner, never silently deleted. | PRD-00 authority rule / planning method | PRD-06/07/08/09; ADR governance |
| DNL-009 | **The Forge remains a real visual authoring environment**, not merely forms/JSON: official editable building/world blueprints remain voxel/semantic source, and Vessel Forge remains an editable freeform voxel workspace. | Forge 22I + Set 26I design authority | PRD-01/04/07 → FORGE-ENG |
| DNL-010 | **Unified Forge does not mean collapsed ownership.** Asset Forge, Entity/Blueprint Forge and Presentation Forge share services while retaining specialist owners; 21G/22L/23J handoffs must remain explicit. | 21G v0.2 + Sets 22/23 | PRD-04 → FORGE-ENG architecture |
| DNL-011 | **Editable canonical Forge source and baked runtime products remain separate.** Meshes, collision, icons, LODs, caches and other products are reproducible/replaceable outputs. | Forge 21F/23A/26I + Set 20 | PRD-01/03/04 → FORGE-ENG bake/runtime pipeline |
| DNL-012 | **Developer and player creator authority remain different.** Player creation is first-class but must not grant canonical namespace, schema, migration, worldgen or unrestricted script authority. | Set 19/20 + 26I + future Set 33 | PRD-01/04/06 → FORGE-ENG security/package model |
| DNL-013 | **Multiplayer is architecturally considered before full multiplayer implementation.** Authority, IDs, deterministic generation, edits, persistence and simulation choices must not make later shared worlds impossible. | Optimisation discussion + future Set 31 + Set 25/XSI constraints | PRD-01/04/06 → LFE multiplayer foundations |
| DNL-014 | **Low-end scalability is an architectural requirement, not a late optimisation hack.** Graphics and simulation scalability are separable; lower profiles may reduce representation/detail but must preserve authoritative truth. | Existing system/FCC rules + future Sets 34/35 | PRD-01/04/06/07 → LFE performance/simulation LOD |
| DNL-015 | **Persistence/versioning/migration are foundation architecture.** Seed/base world/deltas, save safety, aliases/tombstones, old-world compatibility and recovery are not post-release afterthoughts. | Set 25 + optimisation discussion + future Set 39 | PRD-01/04/06/07/08 → LFE persistence |
| DNL-016 | **Diagnostics, profiling, regression gates and evidence exist from the foundation onward.** “It feels smooth” is not sufficient performance evidence. | Optimisation discussion + POC evidence + future Set 40 | PRD-06/07/08 → LFE development/performance architecture |
| DNL-017 | **Historical POC/Summer implementation is evidence, not automatic architecture authority.** Preserve behaviours, regression cases and successful lessons while replacing obsolete engine-specific ownership. | Foundation reconciliation + Set 25 + PRD-00 | PRD-01/05/06/07; migration/regression suites |
| DNL-018 | **No blanket supersession by file date/version.** Resolve authority by owned field/scope and explicit replacement instruction. | Foundation/Set 20/Set 25/FCC/XSI source-control evidence | PRD-00/01; future source registry |
| DNL-019 | **Future Sets 31–42 constrain architecture now without all becoming clean-rebuild blockers.** Full UX/production implementations occur in their proper programme. | Post-30 roadmap | PRD-01/04/09 → LFE/FORGE-ENG compatibility constraints |
| DNL-020 | **LFE and FORGE-ENG become canonical engineering authority only after PRD closes and evidence is reviewed.** Pass 5 and old technical plans remain provisional/historical until formally adopted or superseded. | Pre-rebuild roadmap + PRD process | PRD-09 → LFE/FORGE-ENG freeze |

## 15.1 Do-Not-Lose audit rule

Every PRD-09 closure review and every later major LFE/FORGE-ENG reconciliation must check DNL-001 through DNL-020. A changed direction requires an explicit amendment/ADR identifying:

- which DNL rule changes;
- the owning source/authority permitted to change it;
- evidence supporting the change;
- affected requirements and saves/content/packages;
- migration/supersession treatment;
- whether the pre-rebuild restart gate remains valid.

---

# 16. PRD-00 Closure Checklist

- [x] Enumerate supplied top-level archives.
- [x] Recursively enumerate ZIP packages and nested FCC / 27–30 archives.
- [x] Identify exact Foundation 00–20 titles and package status.
- [x] Identify exact Set 20, 21, 22, 24, 25, 26 and 27–30 source files.
- [x] Recover Set 23 A–J structure from File Library sources and record the local 7z limitation.
- [x] Register locked FCC-01 package, superseded history and lock artefacts.
- [x] Register six supplied completed realm FCC packages and exact A–J source identities.
- [x] Record FCC-03 H v0.2 supersession and source-embedded/project-lifecycle status distinctions.
- [x] Document FCC-07 numbering gap as provenance only, not a presumed current blocker.
- [x] Register FCC-12 Steps 1A–1D; Step 1D closes the source-reconciliation/pre-interview phase and routes next to U01.
- [x] Keep FCC-13 and FCC-14 as controlled expected downstream owners.
- [x] Register research Passes 1–5, recovered planning PDFs, POC guide, VoxelRegistry and roadmap checklist.
- [x] Inspect package-level governance/reconciliation/lock sources for lifecycle and authority annotations.
- [x] Confirm 21G v0.2 replacement amendment and 21G/22L/23J ownership family.
- [x] Build Source Coverage Matrix for PRD-01 through PRD-09, LFE and FORGE-ENG.
- [x] Complete the document-level Master Register metadata contract.
- [x] Complete the Conflict / Ambiguity / Missing-Source Register with bounded actions.
- [x] Complete the Do-Not-Lose Register and amendment rule.
- [x] Run Round 5 closure audit against active-source coverage, source authority, supersession, open-source handling and PRD-01 readiness.
- [x] Confirm no unresolved item blocks PRD-00 closure.
- [x] Issue PRD-00 v1.0 FINAL / CLOSED initial controlled baseline.
- [x] Define controlled delta intake so later FCC-12/13/14 and other valid revisions can be registered without reopening the completed discovery phase.


# 17. Master Register Metadata Contract

Every source record carried into PRD-01 inherits or explicitly states the following fields:

| Field | Rule |
|---|---|
| Source ID | Stable PRD source slot; revision is separate |
| Exact source | Exact title/file/package where available; File-Library-only identities are labelled as such |
| Version / date | Record when source states it; do not infer author date from upload time |
| Source class | Canon, governance, Forge authority, research, POC evidence, future constraint, etc. |
| Authority | What fields the source is allowed to define |
| Lifecycle | Proposed / working / locked / superseded / historical / future |
| Implementation maturity | Separate from authority: design only / reference / P3 / P4 / implemented / integration closed / P5 |
| Owned scope | Domain/fields for which the source wins conflicts |
| Dependencies | Sources it consumes or interfaces with where material to source control |
| Supersession | Explicit predecessor/successor relationship; no date-only replacement |
| Conflict/ambiguity | Link to CAM register when unresolved or specially routed |
| PRD-01 use | Mandatory / constraint / evidence / not routine |

Appendix A applies these fields at document or coherent-package level without pretending every source has an individually known author date or implementation proof state.

---

# 18. Round-5 Closure Audit

Round 5 tested PRD-00 as a source-control system rather than adding more design content. The question was whether PRD-01 can begin from this register without relying on remembered chats, unstated precedence or unbounded missing-source assumptions.

| Closure criterion | Result | Closure finding |
|---|---|---|
| Every currently available active major source family has a controlled slot | **PASS** | Foundation 00–20; Set 20; Forge 21–23; Sets 24–30; XSI; FCC-01; six completed realm FCCs; active FCC-12 Steps 1A–1D; planning; research; POC evidence; future constraints are represented. |
| Exact source identity is known where available | **PASS** | Exact filenames/titles are recorded at document or coherent-package level. Set 23 is File-Library verified with a declared local-archive limitation rather than guessed. |
| Known supersession is explicit and scope-bounded | **PASS** | 21G v0.2, Set 20 v0.2 companions, FCC-01 final-pass revisions, FCC-03 H v0.2, XSI v1.1 and historical technical/runtime transitions are routed explicitly. |
| No “newer file automatically wins” ambiguity remains as a governing rule | **PASS** | Scope-first ownership and explicit supersession are mandatory. |
| Canon, engineering evidence and historical implementation are separated | **PASS** | Source class plus independent implementation-maturity axes prevent executable/historical material from gaining canon authority by accident. |
| Ongoing FCC work is controlled rather than treated as absent | **PASS** | FCC-12 Steps 1A–1D are registered. Step 1D explicitly closes its source-reconciliation/pre-interview phase and routes next to U01. FCC-13/14 remain bounded expected owners. |
| Open provenance issues are bounded | **PASS** | FCC-07 numbering, Set-23 archive access and FCC-03/04/05 historical header provenance remain documented non-blockers with explicit follow-up routes. |
| Future Sets 31–42 and 43+ cannot silently become current canon | **PASS** | They are registered respectively as future production constraints and stress-horizon material. |
| Research Passes 1–5 cannot silently become technical canon | **PASS** | Passes 1–4 are evidence; Pass 5 remains provisional synthesis until PRD validation and LFE/FORGE-ENG adoption. |
| Historical POC/Summer material cannot silently become rebuild authority | **PASS** | Behaviour/test/migration evidence is retained while engine-specific ownership is explicitly subject to replacement. |
| Every downstream PRD/LFE/FORGE-ENG stage has declared source-consumption obligations | **PASS** | Section 14 Coverage Matrix is the downstream consumption contract. |
| Fragile project decisions have explicit continuity controls | **PASS** | DNL-001 through DNL-020 are complete and require amendment/ADR treatment if changed. |
| PRD-01 can start without waiting for FCC-12/13/14 completion | **PASS WITH DELTA OBLIGATION** | PRD-01 starts now from the v1.0 baseline; affected fields are revisited by controlled source deltas as those FCC owners mature. |
| Any unresolved issue still blocks PRD-00 itself | **NO** | No PRD-00 blocker remains. Remaining open items belong to future source maturation or later PRD proof work. |

## 18.1 Closure findings

1. **PRD-00 can close now.** Its purpose is source control, not completion of every future source.
2. **FCC-12 Step 1D was discovered during the closure audit and incorporated before sign-off.** This validates the need for controlled delta intake while parallel workstreams continue.
3. **FCC-13 and FCC-14 are not PRD-00 blockers.** Their ownership and future ingestion obligations are explicit. They do remain required inputs before PRD-09/final technical-canon freeze where their fields are relevant.
4. **PRD-01 has a controlled input baseline.** No known current major source family must be remembered outside this register.
5. **PRD-00 closure does not freeze the corpus forever.** It freezes the source-control model and initial baseline. New approved revisions enter through versioned delta updates.
6. **The Pre-Rebuild Roadmap Checklist was advanced to v0.2 as a non-authoritative navigation update**, recording PRD-00 closed and PRD-01 next while FCC-12/13/14 continue in parallel.

---

# 19. Final Status, Delta Intake and PRD-01 Handoff

> **PRD-00 — LEYFORGE SOURCE CORPUS & AUTHORITY REGISTER — FINAL / CLOSED (INITIAL CONTROLLED BASELINE v1.0).**

## 19.1 Controlled delta rule

After v1.0 closure, a newly created/revised source does **not** require reopening the PRD-00 discovery phase. Instead, issue a controlled `PRD-00 v1.x` delta when the source materially changes the corpus. Each delta must record:

- source ID or new source slot;
- exact title/file/version/date where known;
- source class and lifecycle;
- owned scope;
- predecessor/supersession relationship;
- affected CAM/DNL entries;
- downstream PRD/LFE/FORGE-ENG consumers requiring reconciliation;
- whether any previously extracted PRD-01 requirement must be amended.

A major v2.0 review is warranted only if the **source-control/authority model itself** changes materially, not merely because FCC-12/13/14 or another expected document is completed.

## 19.2 Non-blocking open source obligations at closure

- FCC-12 decision interview and A–D writing/fidelity/lock remain active future deltas.
- FCC-13 remains an expected definitive Block/Item/Recipe/ID/alias/portal-recipe owner.
- FCC-14 remains an expected final cross-realm certification/art-handoff owner.
- FCC-07 numbering remains provenance-only unless a current roadmap activates it.
- Set 23's local 7z enumeration limitation remains archival housekeeping, not a source-identity blocker.
- Historical FCC candidate/approval wording may receive stronger provenance linkage later without invalidating the current source slots.

## 19.3 PRD-01 controlled input baseline

PRD-01 must now perform exhaustive technical-requirement and unknown extraction from:

1. Foundation 00–20 plus Foundation reconciliation governance;
2. Set 20 v0.2;
3. Forge Sets 21–23 including 21G v0.2 and the 21G/22L/23J handoff model;
4. World Content Atlas Set 24;
5. Governance/Registry Set 25;
6. Maritime Set 26;
7. Sets 27–30 plus XSI v1.1 final reconciliation;
8. FCC-01 final locked package and all six completed realm FCC packages;
9. FCC-12 Steps 1A–1D, with later FCC-12/13/14 deltas mandatory where fields mature;
10. recovered Project Optimisation Discussion;
11. recovered Post-30 roadmap / Sets 31–42 constraints and 43+ stress horizon;
12. research Passes 1–5 as evidence/provisional synthesis only;
13. historical POC testing guide and VoxelRegistry as evidence/migration inputs;
14. DNL-001 through DNL-020 as continuity constraints.

PRD-01 must not decide implementation merely because it extracts a requirement. It must preserve the planning distinction:

> **Design decision -> what Leyforge should be.**  
> **Engineering decision -> tests/profiling.**  
> **Technology fact -> source inspection.**

## 19.4 Handoff

The next engineering document is:

> **PRD-01 — Complete Technical Requirements & Unknowns Inventory**

PRD-01 may begin immediately from this v1.0 baseline while FCC-12 continues in parallel.


# Appendix A — Document-Level Master Source Register

This appendix is the v1.0 controlled inventory. Repeated DOCX/Markdown renderings of the same logical source are one source identity, not two canon records. Dates are included only when explicitly established; `—` means not independently established in PRD-00. Unless a row says otherwise, active design/canon documents are **DESIGN ONLY** for implementation maturity.

## A.1 Foundation 00–20

The exact Foundation filenames are those in the reconciled v1.0 package. All are mandatory PRD-01 inputs; `SRC-FND-18` is mixed technical provenance and must be filtered into engine-neutral requirements versus superseded Summer-specific implementation.

| ID | Exact file | Version | Class/lifecycle | Scope / supersession | PRD-01 |
|---|---|---|---|---|:---:|
| SRC-FND-00 | `00_Fantasy_Voxel_Civilisation_Sandbox_Master_Game_Design_Bible_v1_0.md` | v1.0 | Reconciled system canon / ACTIVE | Foundation owner for its named domain | Yes |
| SRC-FND-01 | `01_Fantasy_Voxel_Civilisation_Sandbox_Core_Gameplay_Loop_v1_0.md` | v1.0 | Reconciled system canon / ACTIVE | Foundation owner for its named domain | Yes |
| SRC-FND-02 | `02_Fantasy_Voxel_Civilisation_Sandbox_Player_Progression_System_v1_0.md` | v1.0 | Reconciled system canon / ACTIVE | Foundation owner for its named domain | Yes |
| SRC-FND-03 | `03_Fantasy_Voxel_Civilisation_Sandbox_Canonical_Blocks_Registry_Framework_and_Production_Families_v1_0.md` | v1.0 | Reconciled system canon / ACTIVE | Foundation owner for its named domain | Yes |
| SRC-FND-04 | `04_Fantasy_Voxel_Civilisation_Sandbox_Canonical_Items_Registry_Inventory_Equipment_and_Production_Families_v1_0.md` | v1.0 | Reconciled system canon / ACTIVE | Foundation owner for its named domain | Yes |
| SRC-FND-05 | `05_Fantasy_Voxel_Civilisation_Sandbox_Canonical_Crafting_Recipe_Registry_and_Transformation_System_v1_0.md` | v1.0 | Reconciled system canon / ACTIVE | Foundation owner for its named domain | Yes |
| SRC-FND-06 | `06_Fantasy_Voxel_Civilisation_Sandbox_Canonical_Resource_Progression_Material_Ecology_and_Capability_Pathway_System_v1_0.md` | v1.0 | Reconciled system canon / ACTIVE | Foundation owner for its named domain | Yes |
| SRC-FND-07 | `07_Fantasy_Voxel_Civilisation_Sandbox_NPC_Village_Persistent_People_and_Settlement_Operations_System_v1_0.md` | v1.0 | Reconciled system canon / ACTIVE | Foundation owner for its named domain | Yes |
| SRC-FND-08 | `08_Fantasy_Voxel_Civilisation_Sandbox_Automation_Industry_Logistics_and_Network_Control_System_v1_0.md` | v1.0 | Reconciled system canon / ACTIVE | Foundation owner for its named domain | Yes |
| SRC-FND-09 | `09_Fantasy_Voxel_Civilisation_Sandbox_Magic_Mana_Spellcraft_Runes_Rituals_and_Civilisation_Magic_System_v1_0.md` | v1.0 | Reconciled system canon / ACTIVE | Foundation owner for its named domain | Yes |
| SRC-FND-10 | `10_Fantasy_Voxel_Civilisation_Sandbox_Creatures_Monsters_Wildlife_and_Ecology_Runtime_System_v1_0.md` | v1.0 | Reconciled system canon / ACTIVE | Foundation owner for its named domain | Yes |
| SRC-FND-11 | `11_Fantasy_Voxel_Civilisation_Sandbox_Biomes_World_Generation_and_Procedural_World_Assembly_System_v1_0.md` | v1.0 | Reconciled system canon / ACTIVE | Foundation owner for its named domain | Yes |
| SRC-FND-12 | `12_Fantasy_Voxel_Civilisation_Sandbox_Structures_Landmarks_Routes_and_Persistent_Structure_Runtime_System_v1_0.md` | v1.0 | Reconciled system canon / ACTIVE | Foundation owner for its named domain | Yes |
| SRC-FND-13 | `13_Fantasy_Voxel_Civilisation_Sandbox_Peoples_Cultures_Factions_Governments_and_Civilisation_Identity_System_v1_0.md` | v1.0 | Reconciled system canon / ACTIVE | Foundation owner for its named domain | Yes |
| SRC-FND-14 | `14_Fantasy_Voxel_Civilisation_Sandbox_Dimensions_Realms_Realm_Travel_and_Interdimensional_World_System_v1_0.md` | v1.0 | Reconciled system canon / ACTIVE | Foundation owner for its named domain | Yes |
| SRC-FND-15 | `15_Fantasy_Voxel_Civilisation_Sandbox_Quest_Event_History_and_World_Consequence_System_v1_0.md` | v1.0 | Reconciled system canon / ACTIVE | Foundation owner for its named domain | Yes |
| SRC-FND-16 | `16_Fantasy_Voxel_Civilisation_Sandbox_Combat_Gear_Defence_and_Tactical_Conflict_System_v1_0.md` | v1.0 | Reconciled system canon / ACTIVE | Foundation owner for its named domain | Yes |
| SRC-FND-17 | `17_Fantasy_Voxel_Civilisation_Sandbox_UI_UX_Accessibility_Menus_HUD_World_Configuration_and_Player_Trust_System_v1_0.md` | v1.0 | Reconciled system canon / ACTIVE | Foundation owner for its named domain | Yes |
| SRC-FND-18 | `18_Fantasy_Voxel_Civilisation_Sandbox_Godot_Summer_Engine_Technical_Implementation_Plan_v1_0.md` | v1.0 | Mixed technical source / ACTIVE REQUIREMENTS + historical implementation | Engine-neutral technical requirements retained; Summer-specific implementation subject to PRD/LFE supersession | Yes |
| SRC-FND-19 | `19_Fantasy_Voxel_Civilisation_Sandbox_Settlement_Growth_District_Planning_and_Player_Voxel_Blueprint_System_v1_0.md` | v1.0 | Reconciled system canon / ACTIVE | Foundation owner for its named domain | Yes |
| SRC-FND-20 | `20_Fantasy_Voxel_Civilisation_Sandbox_Buildings_Facilities_Functional_Services_Construction_and_Settlement_Project_System_v1_0.md` | v1.0 | Reconciled system canon / ACTIVE | Foundation owner for its named domain | Yes |
| SRC-FND-GOV | `Leyforge_Foundation_00-20_POC_to_Production_Reconciliation_Register_v0_2.md` | v0.2 | Governance / ACTIVE | Foundation supersession/preservation authority | Yes |

## A.2 Set 20 and Forge 21–23

Set 20 v0.2 is the current companion family; 21G v0.2 supersedes 21G v0.1. Set 23 is File-Library-verified because the supplied 7z could not be enumerated locally.

| ID | Exact title / source identity | Version | Class/lifecycle | Supersession / scope | PRD-01 |
|---|---|---|---|---|:---:|
| SRC-SET-20 | Buildings, Facilities, Construction and Settlement Project System | v0.2 | Specialist system canon / ACTIVE | Supersedes corresponding v0.1 companion fields only | Yes |
| SRC-SET-20A | Housing, Provisions, Health and Community | v0.2 | Specialist system canon / ACTIVE | Supersedes corresponding v0.1 companion fields only | Yes |
| SRC-SET-20B | Work, Extraction, Crafting, Trade and Education | v0.2 | Specialist system canon / ACTIVE | Supersedes corresponding v0.1 companion fields only | Yes |
| SRC-SET-20C | Governance, Safety, Defence, Justice and Emergency Services | v0.2 | Specialist system canon / ACTIVE | Supersedes corresponding v0.1 companion fields only | Yes |
| SRC-SET-20D | Storage, Roads, Transport, Logistics and Utilities | v0.2 | Specialist system canon / ACTIVE | Supersedes corresponding v0.1 companion fields only | Yes |
| SRC-SET-20E | Magic, Automation, Industry, Power and Dimensions | v0.2 | Specialist system canon / ACTIVE | Supersedes corresponding v0.1 companion fields only | Yes |
| SRC-SET-20F | Districts, Complexes, Megaprojects and Wonders | v0.2 | Specialist system canon / ACTIVE | Supersedes corresponding v0.1 companion fields only | Yes |
| SRC-SET-20G | Culture, Faction, Biome and Realm Building Packs | v0.2 | Specialist system canon / ACTIVE | Supersedes corresponding v0.1 companion fields only | Yes |
| SRC-SET-20H | Detailed Building Catalogue, Stage Matrix and Production Backlog | v0.2 | Specialist system canon / ACTIVE | Supersedes corresponding v0.1 companion fields only | Yes |
| SRC-FRG-21A | Voxel Asset Forge Core System | v0.1 | Forge design authority / ACTIVE | Authoring requirement source; technical specifics subject to PRD where applicable | Yes |
| SRC-FRG-21B | Voxel Modelling, Texturing and Material Authoring | v0.1 | Forge design authority / ACTIVE | Authoring requirement source; technical specifics subject to PRD where applicable | Yes |
| SRC-FRG-21C | Animation, Effects and Runtime Visual States | v0.1 | Forge design authority / ACTIVE | Authoring requirement source; technical specifics subject to PRD where applicable | Yes |
| SRC-FRG-21D | Asset Overrides, Variants and Registry Integration | v0.1 | Forge design authority / ACTIVE | Authoring requirement source; technical specifics subject to PRD where applicable | Yes |
| SRC-FRG-21E | Forge UI/UX and Creator Workflow | v0.1 | Forge design authority / ACTIVE | Authoring requirement source; technical specifics subject to PRD where applicable | Yes |
| SRC-FRG-21F | Forge Technical Implementation Plan | v0.1 | Forge design authority / ACTIVE | Authoring requirement source; technical specifics subject to PRD where applicable | Yes |
| SRC-FRG-21G | Visual Overhaul and Cross-Forge Asset Migration Integration Plan | v0.2 | Forge integration authority / ACTIVE | Replaces 21G v0.1; coordinates 21G + 22L + 23J | Yes |
| SRC-FRG-21G-HIST | Visual Overhaul and Asset Migration Plan | v0.1 | SUPERSEDED | Provenance only; replaced by 21G v0.2 | Evidence only |
| SRC-FRG-22A | Forge Entity and Blueprint Expansion Core System | v0.1 | Forge design authority / ACTIVE | Entity/Blueprint Forge owned scope | Yes |
| SRC-FRG-22B | Entity Model Taxonomy, Anatomy and Body Architecture | v0.1 | Forge design authority / ACTIVE | Entity/Blueprint Forge owned scope | Yes |
| SRC-FRG-22C | Humanoid Player Character and NPC Creator | v0.1 | Forge design authority / ACTIVE | Entity/Blueprint Forge owned scope | Yes |
| SRC-FRG-22D | Creature, Mob, Monster and Boss Model Creator | v0.1 | Forge design authority / ACTIVE | Entity/Blueprint Forge owned scope | Yes |
| SRC-FRG-22E | Skeletons, Rigging, Joints, IK and Attachment Systems | v0.1 | Forge design authority / ACTIVE | Entity/Blueprint Forge owned scope | Yes |
| SRC-FRG-22F | Entity Animation, Locomotion, Combat and Visual States | v0.1 | Forge design authority / ACTIVE | Entity/Blueprint Forge owned scope | Yes |
| SRC-FRG-22G | Character Customisation, Equipment Variants and Visual Inheritance | v0.1 | Forge design authority / ACTIVE | Entity/Blueprint Forge owned scope | Yes |
| SRC-FRG-22H | Entity Gameplay Integration, Hitboxes, AI Markers and Simulation LOD | v0.1 | Forge design authority / ACTIVE | Entity/Blueprint Forge owned scope | Yes |
| SRC-FRG-22I | Blueprint Forge, Building, Structure and World Blueprint Authoring | v0.1 | Forge design authority / ACTIVE | Entity/Blueprint Forge owned scope | Yes |
| SRC-FRG-22J | Unified Forge UI/UX and Creator Workflow | v0.1 | Forge design authority / ACTIVE | Entity/Blueprint Forge owned scope | Yes |
| SRC-FRG-22K | Forge Entity and Blueprint Technical Implementation Plan | v0.1 | Forge design authority / ACTIVE | Entity/Blueprint Forge owned scope | Yes |
| SRC-FRG-22L | Entity and Blueprint Visual Production and Migration Plan | v0.1 | Forge design authority / ACTIVE | Specialist migration owner coordinated by 21G v0.2 | Yes |
| SRC-FRG-23A | Presentation Forge Vision, Scope and Shared Foundation | v0.1 | Forge design authority / ACTIVE (File Library verified) | Presentation Forge owned scope | Yes |
| SRC-FRG-23B | Spatial Anchors, Sockets, Regions, Paths and Attachment System | v0.1 | Forge design authority / ACTIVE (File Library verified) | Presentation Forge owned scope | Yes |
| SRC-FRG-23C | Presentation Events, Bindings, Parameters and Cross-System Integration | v0.1 | Forge design authority / ACTIVE (File Library verified) | Presentation Forge owned scope | Yes |
| SRC-FRG-23D | Particle and VFX Forge Core Authoring System | v0.1 | Forge design authority / ACTIVE (File Library verified) | Presentation Forge owned scope | Yes |
| SRC-FRG-23E | Voxel Particle Graph, Emitters, Trails, Volumes, Lighting and Simulation | v0.1 | Forge design authority / ACTIVE (File Library verified) | Presentation Forge owned scope | Yes |
| SRC-FRG-23F | Sound Forge Core Authoring and Sound Event System | v0.1 | Forge design authority / ACTIVE (File Library verified) | Presentation Forge owned scope | Yes |
| SRC-FRG-23G | Material Audio, Spatial Sound, Ambience, Acoustics and Runtime Mixing | v0.1 | Forge design authority / ACTIVE (File Library verified) | Presentation Forge owned scope | Yes |
| SRC-FRG-23H | Unified Presentation Forge UI/UX, Creator Workflow, Preview Laboratory and Accessibility | v0.1 | Forge design authority / ACTIVE (File Library verified) | Presentation Forge owned scope | Yes |
| SRC-FRG-23I | Godot and Summer Engine Technical Implementation Plan | v0.1 | Forge design authority / ACTIVE (File Library verified) | Presentation Forge owned scope | Yes |
| SRC-FRG-23J | Presentation Forge Asset Libraries, Registries, Production Pipeline, Testing and Migration | v0.1 | Forge design authority / ACTIVE (File Library verified) | Presentation migration owner coordinated by 21G v0.2 | Yes |

## A.3 Sets 24–26

The detailed tables in Sections 5.4–5.6 are the authoritative document-level inventory for these families. Their family metadata is summarised here to avoid duplicating long filenames twice.

| Source range | Package / class | Lifecycle | Supersession / authority | PRD-01 |
|---|---|---|---|:---:|
| SRC-SET-24-INDEX, 24A–24L | World Content Atlas v0.1 | Active historical/content source | Later FCC wins conflicting FCC-owned content; Atlas remains provenance/non-conflicting source | Yes |
| SRC-SET-25A–25L | Post-Atlas Governance/Registries v0.1 package (25A/B v0.2) | Governance/interface ACTIVE | Stable IDs/source ownership/validation/packages; does not absorb specialist gameplay | Yes |
| SRC-SET-26A–26O | Maritime/Naval Expansion v0.1 | Specialist design ACTIVE | Maritime owner; implementation proof separate; XSI resolves 26/30 interface collisions | Yes |

## A.4 Sets 27–30 and cross-set reconciliation

Sections 5.7 lists all 40 specialist documents exactly. All are mandatory PRD-01 inputs. The current integration authority is `SRC-XSI-27-30` v1.1; each J v0.2 is the reconciled set capstone.

| Source range | Class/lifecycle | Maturity | Supersession / authority | PRD-01 |
|---|---|---|---|:---:|
| SRC-SET-27A–J | Reconciled system canon / ACTIVE | Design only | Economy owner; J v0.2 integration capstone | Yes |
| SRC-SET-28A–J | Reconciled system canon / ACTIVE | Design only | Social/dialogue/companion owner; J v0.2 capstone | Yes |
| SRC-SET-29A–J | Reconciled system canon / ACTIVE | Design only | Survival/biology owner; J v0.2 capstone | Yes |
| SRC-SET-30A–J | Reconciled system canon / ACTIVE | Design only | Movement/traversal owner; J v0.2 capstone | Yes |
| SRC-XSI-27-30 | Governance/interface authority / FINAL RECONCILED | Design contract | Supersedes XSI v1.0 for 27–30 interfaces | Yes |
| SRC-XSI-27-30-REPORT | Reconciliation evidence | Evidence | Supports v1.1 integration baseline | Yes/constraint |

## A.5 FCC realm document register

All realm FCC A–J documents are mandatory PRD-01 requirement sources within their owned realm/content fields. The exact filenames below come from the supplied nested FCC packages.

| ID | Exact file | Version | Lifecycle / authority | PRD-01 |
|---|---|---|---|:---:|
| SRC-FCC-02A | `FCC-02A_Verdant_Covenant_Realm_Identity_Laws_Progression_and_Canon_Boundaries_v0_1.md` | v0.1 | Realm-local canon / ACTIVE; global reconciliation pending | Yes |
| SRC-FCC-02B | `FCC-02B_Verdant_Covenant_Biomes_Terrain_Climate_Seasonal_States_and_Environmental_Hazards_v0_1.md` | v0.1 | Realm-local canon / ACTIVE; global reconciliation pending | Yes |
| SRC-FCC-02C | `FCC-02C_Verdant_Covenant_Geology_Materials_Resources_Processing_Foundations_and_Material_Provenance_v0_1.md` | v0.1 | Realm-local canon / ACTIVE; global reconciliation pending | Yes |
| SRC-FCC-02D | `FCC-02D_Verdant_Covenant_Flora_Great_Trees_Wood_Families_Crops_Fungi_Food_and_Botanical_Ecology_v0_1.md` | v0.1 | Realm-local canon / ACTIVE; global reconciliation pending | Yes |
| SRC-FCC-02E | `FCC-02E_Verdant_Covenant_Creatures_Ecology_and_Creature_Materials_v0_1.md` | v0.1 | Realm-local canon / ACTIVE; global reconciliation pending | Yes |
| SRC-FCC-02F | `FCC-02F_Verdant_Covenant_Civilisations_Seasonal_Courts_Settlements_Structures_and_Infrastructure_v0_1.md` | v0.1 | Realm-local canon / ACTIVE; global reconciliation pending | Yes |
| SRC-FCC-02G | `FCC-02G_Verdant_Covenant_Blocks_Items_Processing_Recipes_and_Portal_Construction_v0_1.md` | v0.1 | Realm-local canon / ACTIVE; global reconciliation pending | Yes |
| SRC-FCC-02H | `FCC-02H_Verdant_Covenant_Dungeons_Guardians_Authorities_Adventure_Sites_and_Resolution_Content_v0_1.md` | v0.1 | Realm-local canon / ACTIVE; global reconciliation pending | Yes |
| SRC-FCC-02I | `FCC-02I_Verdant_Covenant_Corruption_Blight_Restoration_Realm_States_and_Cross-Realm_Interfaces_v0_1.md` | v0.1 | Realm-local canon / ACTIVE; global reconciliation pending | Yes |
| SRC-FCC-02J | `FCC-02J_Verdant_Covenant_Canonical_Content_Registry_Completeness_Certification_and_Art_Handoff_v0_1.md` | v0.1 | Realm-local canon / ACTIVE; global reconciliation pending | Yes |
| SRC-FCC-03A | `FCC-03A_Ancestral_Veil_Realm_Identity_Laws_Progression_and_Canon_Boundaries_v0_1.md` | v0.1 | Realm-local canon / ACTIVE; global reconciliation pending | Yes |
| SRC-FCC-03B | `FCC-03B_Ancestral_Veil_Biomes_Terrain_Memory_States_and_Environmental_Hazards_v0_1.md` | v0.1 | Realm-local canon / ACTIVE; global reconciliation pending | Yes |
| SRC-FCC-03C | `FCC-03C_Ancestral_Veil_Geology_Materials_Resources_Processing_and_Provenance_v0_1.md` | v0.1 | Realm-local canon / ACTIVE; global reconciliation pending | Yes |
| SRC-FCC-03D | `FCC-03D_Ancestral_Veil_Flora_Soulwood_Ossuary_Ecology_Food_and_Botanical_Ecology_v0_1.md` | v0.1 | Realm-local canon / ACTIVE; global reconciliation pending | Yes |
| SRC-FCC-03E | `FCC-03E_Ancestral_Veil_Creatures_Wildlife_Spirit_Ecology_Creature_Materials_and_Variants_v0_1.md` | v0.1 | Realm-local canon / ACTIVE; global reconciliation pending | Yes |
| SRC-FCC-03F | `FCC-03F_Ancestral_Veil_Peoples_Civilisations_Necropolis_Polities_Settlements_Culture_and_Infrastructure_v0_1.md` | v0.1 | Realm-local canon / ACTIVE; global reconciliation pending | Yes |
| SRC-FCC-03G | `FCC-03G_Ancestral_Veil_Structures_Sites_Veilgate_Blocks_Items_Processing_and_Recipes_v0_1.md` | v0.1 | Realm-local canon / ACTIVE; global reconciliation pending | Yes |
| SRC-FCC-03H | `FCC-03H_Ancestral_Veil_Dungeons_Guardians_Authorities_Events_and_Major_Outcomes_v0_2.md` | v0.2 | Realm-local canon / ACTIVE; v0.2 supersedes H v0.1 | Yes |
| SRC-FCC-03I | `FCC-03I_Ancestral_Veil_Identity_Memory_States_Necropolis_Dynamics_Void_Corruption_Restoration_and_Cross-Realm_Interaction_v0_1.md` | v0.1 | Realm-local canon / ACTIVE; global reconciliation pending | Yes |
| SRC-FCC-03J | `FCC-03J_Ancestral_Veil_Final_Canon_Registry_Validation_Completeness_Certification_and_Art_Handoff_v0_1.md` | v0.1 | Realm-local canon / ACTIVE; global reconciliation pending | Yes |
| SRC-FCC-04A | `FCC-04A_Somnolent_Expanse_Realm_Identity_Laws_Progression_and_Canon_Boundaries_v0_1.md` | v0.1 | Realm-local canon / ACTIVE; global reconciliation pending | Yes |
| SRC-FCC-04B | `FCC-04B_Somnolent_Expanse_Biomes_Terrain_Coherence_States_and_Environmental_Hazards_v0_1.md` | v0.1 | Realm-local canon / ACTIVE; global reconciliation pending | Yes |
| SRC-FCC-04C | `FCC-04C_Somnolent_Expanse_Geology_Materials_Resources_Processing_Foundations_and_Material_Provenance_v0_1.md` | v0.1 | Realm-local canon / ACTIVE; global reconciliation pending | Yes |
| SRC-FCC-04D | `FCC-04D_Somnolent_Expanse_Flora_Reverie_Wood_Crops_Fungi_Food_and_Botanical_Ecology_v0_1.md` | v0.1 | Realm-local canon / ACTIVE; global reconciliation pending | Yes |
| SRC-FCC-04E | `FCC-04E_Somnolent_Expanse_Creatures_Dream_Ecology_Creature_Materials_Variants_and_Personhood_Boundaries_v0_1.md` | v0.1 | Realm-local canon / ACTIVE; global reconciliation pending | Yes |
| SRC-FCC-04F | `FCC-04F_Somnolent_Expanse_Civilisations_Cultures_Settlements_Structures_and_Social_Systems_v0_1.md` | v0.1 | Realm-local canon / ACTIVE; global reconciliation pending | Yes |
| SRC-FCC-04G | `FCC-04G_Somnolent_Expanse_Structures_Sites_Dreamgate_Blocks_Items_Processing_and_Recipes_v0_1.md` | v0.1 | Realm-local canon / ACTIVE; global reconciliation pending | Yes |
| SRC-FCC-04H | `FCC-04H_Somnolent_Expanse_Dungeons_Guardians_Authorities_Events_and_Major_Outcomes_v0_1.md` | v0.1 | Realm-local canon / ACTIVE; global reconciliation pending | Yes |
| SRC-FCC-04I | `FCC-04I_Somnolent_Expanse_Dream_States_Nightmare_Dynamics_Void_Corruption_Stabilisation_Restoration_and_Cross-Realm_Interaction_v0_1.md` | v0.1 | Realm-local canon / ACTIVE; global reconciliation pending | Yes |
| SRC-FCC-04J | `FCC-04J_Somnolent_Expanse_Final_Canon_Registry_Validation_Completeness_Certification_and_Art_Handoff_v0_1.md` | v0.1 | Certification source; embedded Owner Review Candidate wording preserved; current project lifecycle records later realm lock | Yes |
| SRC-FCC-05A | `FCC-05A_Ascendant_Reach_Realm_Identity_Laws_Progression_and_Canon_Boundaries_v0_1.md` | v0.1 | Realm-local canon / ACTIVE; global reconciliation pending | Yes |
| SRC-FCC-05B | `FCC-05B_Ascendant_Reach_Biomes_Terrain_Altitude_Bands_Regional_States_and_Environmental_Hazards_v0_1.md` | v0.1 | Realm-local canon / ACTIVE; global reconciliation pending | Yes |
| SRC-FCC-05C | `FCC-05C_Ascendant_Reach_Geology_Materials_Resources_Processing_Foundations_and_Material_Provenance_v0_1.md` | v0.1 | Realm-local canon / ACTIVE; global reconciliation pending | Yes |
| SRC-FCC-05D | `FCC-05D_Ascendant_Reach_Flora_Trees_Woods_Agriculture_Food_and_Botanical_Ecology_v0_1.md` | v0.1 | Realm-local canon / ACTIVE; global reconciliation pending | Yes |
| SRC-FCC-05E | `FCC-05E_Ascendant_Reach_Creatures_Vertical_Ecology_Creature_Materials_Husbandry_Variants_and_Personhood_Boundaries_v0_1.md` | v0.1 | Realm-local canon / ACTIVE; global reconciliation pending | Yes |
| SRC-FCC-05F | `FCC-05F_Ascendant_Reach_Peoples_Civilisations_Settlements_Divine_Institutions_Culture_and_Infrastructure_v0_1.md` | v0.1 | Realm-local canon / ACTIVE; global reconciliation pending | Yes |
| SRC-FCC-05G | `FCC-05G_Ascendant_Reach_Structures_Sites_Ascension_Gate_Blocks_Items_Processing_and_Recipes_v0_1.md` | v0.1 | Realm-local canon / ACTIVE; global reconciliation pending | Yes |
| SRC-FCC-05H | `FCC-05H_Ascendant_Reach_Dungeons_Guardians_Authorities_Pilgrim_Star_Events_and_Major_Outcomes_v0_1.md` | v0.1 | Realm-local canon / ACTIVE; global reconciliation pending | Yes |
| SRC-FCC-05I | `FCC-05I_Ascendant_Reach_Realm_States_Sacred_Law_Dynamics_Void_Corruption_Stabilisation_Restoration_and_Cross_Realm_Interaction_v0_1.md` | v0.1 | Realm-local canon / ACTIVE; global reconciliation pending | Yes |
| SRC-FCC-05J | `FCC-05J_Ascendant_Reach_Final_Canon_Registry_Validation_Completeness_Certification_and_Art_Handoff_v0_1.md` | v0.1 | Certification source; embedded Owner Review Candidate wording preserved; current project lifecycle records later realm lock | Yes |
| SRC-FCC-06A | `FCC-06A_Impossible_Deep_Realm_Identity_Laws_Progression_and_Canon_Boundaries_v0_1.md` | v0.1 | Realm-local canon / ACTIVE; global reconciliation pending | Yes |
| SRC-FCC-06B | `FCC-06B_Impossible_Deep_Biomes_Terrain_Environmental_Hazards_and_Regional_States_v0_1.md` | v0.1 | Realm-local canon / ACTIVE; global reconciliation pending | Yes |
| SRC-FCC-06C | `FCC-06C_Impossible_Deep_Geology_Materials_Native_Resources_and_Derived_Material_Canon_v0_1.md` | v0.1 | Realm-local canon / ACTIVE; global reconciliation pending | Yes |
| SRC-FCC-06D | `FCC-06D_Impossible_Deep_Flora_Fungi_Agriculture_Crops_and_Food_Ecology_v0_1.md` | v0.1 | Realm-local canon / ACTIVE; global reconciliation pending | Yes |
| SRC-FCC-06E | `FCC-06E_Impossible_Deep_Creatures_Fauna_and_Ecology_v0_1.md` | v0.1 | Realm-local canon / ACTIVE; global reconciliation pending | Yes |
| SRC-FCC-06F | `FCC-06F_Impossible_Deep_Civilisations_Settlements_Structures_and_Infrastructure_v0_1.md` | v0.1 | Realm-local canon / ACTIVE; global reconciliation pending | Yes |
| SRC-FCC-06G | `FCC-06G_Impossible_Deep_Blocks_Items_Processing_and_Recipes_v0_1.md` | v0.1 | Realm-local canon / ACTIVE; global reconciliation pending | Yes |
| SRC-FCC-06H | `FCC-06H_Impossible_Deep_Dungeons_Guardians_Realm_Authorities_and_Major_Encounters_v0_1.md` | v0.1 | Realm-local canon / ACTIVE; global reconciliation pending | Yes |
| SRC-FCC-06I | `FCC-06I_Impossible_Deep_Corruption_Regional_States_Realm_Events_and_Cross_Realm_Interfaces_v0_1.md` | v0.1 | Realm-local canon / ACTIVE; global reconciliation pending | Yes |
| SRC-FCC-06J | `FCC-06J_Impossible_Deep_Final_Registry_Completeness_Audit_and_Art_Handoff_v0_1.md` | v0.1 | Realm-local canon / ACTIVE; global reconciliation pending | Yes |
| SRC-FCC-08A | `FCC-08A_Ashen_Lower_Realms_Realm_Identity_Laws_Progression_and_Canon_Boundaries_v0_1.md` | v0.1 | Realm-local canon / ACTIVE; global reconciliation pending | Yes |
| SRC-FCC-08B | `FCC-08B_Ashen_Lower_Realms_Biomes_Terrain_Nine_Stratum_Distribution_Environmental_Hazards_and_Regional_States_v0_1.md` | v0.1 | Realm-local canon / ACTIVE; global reconciliation pending | Yes |
| SRC-FCC-08C | `FCC-08C_Ashen_Lower_Realms_Geology_Materials_Resources_Processing_Foundations_and_Provenance_v0_1.md` | v0.1 | Realm-local canon / ACTIVE; global reconciliation pending | Yes |
| SRC-FCC-08D | `FCC-08D_Ashen_Lower_Realms_Flora_Fungi_Agriculture_Crops_and_Food_Ecology_v0_1.md` | v0.1 | Realm-local canon / ACTIVE; global reconciliation pending | Yes |
| SRC-FCC-08E | `FCC-08E_Ashen_Lower_Realms_Creatures_Fauna_Creature_Materials_and_Ecology_v0_1.md` | v0.1 | Realm-local canon / ACTIVE; global reconciliation pending | Yes |
| SRC-FCC-08F | `FCC-08F_Ashen_Lower_Realms_Peoples_Civilisations_Settlements_Culture_and_Infrastructure_v0_1.md` | v0.1 | Realm-local canon / ACTIVE; global reconciliation pending | Yes |
| SRC-FCC-08G | `FCC-08G_Ashen_Lower_Realms_Structures_Sites_Ashgate_Blocks_Items_Processing_and_Recipes_v0_1.md` | v0.1 | Realm-local canon / ACTIVE; global reconciliation pending | Yes |
| SRC-FCC-08H | `FCC-08H_Ashen_Lower_Realms_Dungeons_Guardians_Realm_Authorities_and_Major_Encounters_v0_1.md` | v0.1 | Realm-local canon / ACTIVE; global reconciliation pending | Yes |
| SRC-FCC-08I | `FCC-08I_Ashen_Lower_Realms_Corruption_Regional_States_Realm_Events_and_Cross_Realm_Interfaces_v0_1.md` | v0.1 | Realm-local canon / ACTIVE; global reconciliation pending | Yes |
| SRC-FCC-08J | `FCC-08J_Ashen_Lower_Realms_Final_Registry_Completeness_Audit_and_Art_Handoff_v0_1.md` | v0.1 | Realm-local canon / ACTIVE; global reconciliation pending | Yes |

## A.6 FCC-01 Overworld and downstream global FCC

FCC-01 exact locked/provenance sources are listed in Section 6.1. The controlling lifecycle source is the v1.0 lock certificate dated 27 August 2026. FCC-12 source reconciliation is complete through Step 1D and the U01 decision interview is next; FCC-13/14 remain controlled expected owners.

| ID/range | Source | Version/date | Lifecycle | PRD-01 |
|---|---|---|---|:---:|
| SRC-FCC-01A–J | FCC-01 final locked A–J package | mixed final revisions | **CONTENT CANON LOCKED — pending final cross-realm reconciliation** | Yes |
| SRC-FCC-01-STEP2A–2D | FCC-01 prewrite reconciliation steps | v0.1 | Provenance/governance evidence | Yes/constraint |
| SRC-FCC-01-AUDIT2 | Final Document-to-Interview Fidelity Audit | v0.2 ZERO HOLD | Certification evidence | Yes/constraint |
| SRC-FCC-01-AMEND | Final Exact-Transcription Recovery & Lost-Source Amendment Packet | v0.1 | Controlled amendment/provenance | Yes where patched fields matter |
| SRC-FCC-01-LOCK | Overworld Content Canon Lock Certificate | v1.0 — 27 Aug 2026 | Lock/certification authority | Yes |
| SRC-FCC-12-1A | Universal Material Source Corpus, Authority & Collision Extraction | v0.1 — 27 Aug 2026 | ACTIVE working reconciliation | Yes |
| SRC-FCC-12-1B | Cross-Realm Material Collision/Equivalence/Lineage Matrix | v0.1 — 27 Aug 2026 | ACTIVE working reconciliation | Yes |
| SRC-FCC-12-1C | Universal Derived-Form/Processing/Transformation Deduplication Matrix | v0.1 — 27 Aug 2026 | ACTIVE proposed-for-interview | Yes |
| SRC-FCC-12-1D | Interview Architecture, Question Map & Completeness Gate | v0.1 — 27 Aug 2026 | **SOURCE-RECONCILIATION COMPLETE / decision interview ready** | Yes |
| SRC-MISS-FCC13 | FCC-13 Definitive Blocks, Items & Recipes | expected | Not yet supplied | Later delta / final technical freeze input |
| SRC-MISS-FCC14 | FCC-14 Canon Certification & Art Handoff | expected | Not yet supplied | Later delta / final technical freeze input |

## A.7 Planning, research, POC, navigation and future constraints

| ID | Exact source | Class/lifecycle | Authority / use | PRD-01 |
|---|---|---|---|:---:|
| SRC-CHAT-OPT | `Voxel cube game planning - Project Optimisation Discussion.pdf` | Recovered planning / ACTIVE process evidence | PRD method, P0–P5, design/engineering/technology decision separation; proposals still require formal adoption | Yes |
| SRC-CHAT-POST30 | `Voxel cube game planning - Post-30 Doc Set Ideas.pdf` | Recovered roadmap / FUTURE CONSTRAINT | Sets 31–42 roadmap and 43+ horizon | Yes/constraint |
| SRC-RSCH-VS1 | Vintage Story — Pass 1 Feature/Architecture Map | Research evidence | External evidence only | Constraint/evidence |
| SRC-RSCH-VS2 | Vintage Story — Pass 2 Engineering Teardown | Research evidence | External evidence only | Constraint/evidence |
| SRC-RSCH-VS3 | Vintage Story Failure Archaeology — Pass Three | Research evidence | External evidence only | Constraint/evidence |
| SRC-RSCH-P4 | Pass Four Comparative Architecture Study for Leyforge | Research evidence | External evidence only | Constraint/evidence |
| SRC-RSCH-P5 | Leyforge Architecture Synthesis — Pass Five | **PROVISIONAL architecture synthesis** | Must be reconciled/proven before LFE adoption | Constraint/evidence |
| SRC-POC-99 | `99_Leyforge_POC_Manual_Testing_Guide_v0_1.md` (body version 0.3) | Historical implementation/test evidence | Regression behaviours, benchmarks, save/worldgen evidence; old engine instructions non-canonical | Yes/evidence |
| SRC-POC-VXLREG | `VoxelRegistry.json` | Historical migration evidence | Legacy IDs/paths/duplicates/placeholders only | Yes/evidence |
| SRC-NAV-PRERB | `Leyforge_Pre-Rebuild_Roadmap_Checklist_v0_2.docx` | Navigation/status / CURRENT | Non-authoritative current status view; v0.1 is historical/stale navigation only | No, except navigation |
| SRC-FUT-31–42 | Post-30 production programme | Future production constraints | Architecture must remain compatible; full implementation later | Yes/constraint |
| SRC-FUT-43PLUS | Future Expansion Register | Stress horizon | No current canon ownership | Constraint only |
| SRC-LFE-* | Future LFE family | Reserved future engineering canon | Becomes engineering authority only after PRD closure/adoption | Output |
| SRC-FORGEENG-* | Future FORGE-ENG family | Reserved future engineering canon | Becomes Forge engineering authority only after PRD closure/adoption | Output |

## A.8 Closure provenance conclusions

1. The active corpus is now registered at document or coherent-package level with explicit source identity.
2. FCC-12 must be treated as a live, changing source family from this point forward; Steps 1A–1D are in the v1.0 baseline and later interview/A–D/fidelity/lock outputs enter through controlled deltas.
3. FCC-13 and FCC-14 remain expected downstream owners and are not silently substituted by Set 25 or old registries.
4. Set-23 availability is sufficient for PRD-00 source control, with an explicit caveat that local 7z enumeration was unavailable.
5. FCC-03/04/05 provenance is preserved without rewriting historical certification headers; project lifecycle and source-embedded status remain separate fields.
6. Historical technical plans and POC runtime artefacts remain in the corpus because PRD-01 needs their requirements, compatibility lessons and regression evidence, not because their engine-specific implementation remains binding.
7. No source can acquire authority merely because it is newer, more detailed, executable, or conveniently accessible. Owned scope and explicit supersession remain decisive.
8. Round 5 found no unresolved source-control blocker. PRD-00 closes at v1.0 as the initial controlled baseline; source evolution continues through v1.x delta revisions without reopening the completed discovery phase unless the authority model itself changes.
