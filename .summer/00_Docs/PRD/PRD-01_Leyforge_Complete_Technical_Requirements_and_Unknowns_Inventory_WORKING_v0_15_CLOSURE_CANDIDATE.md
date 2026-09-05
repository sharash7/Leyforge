# PRD-01 — Leyforge Complete Technical Requirements & Unknowns Inventory

**Version:** 0.15 WORKING — CLOSURE CANDIDATE
**Date:** 30 August 2026  
**Status:** ACTIVE — Rounds 1–15 complete; master reconciliation/coverage-closure candidate issued; FCC-14A/B/C consumed; FCC-14D final package lock remains a controlled pre-freeze delta; Branch-C material PRD deltas remain controlled inputs
**Upstream authority:** `PRD-00 — Leyforge Source Corpus & Authority Register v1.0 FINAL`  
**Purpose:** Extract every technical capability, invariant, constraint, compatibility obligation and unresolved implementation question that the clean Leyforge redevelopment must satisfy before LFE/FORGE-ENG technical canon is written.

---

## 1. PRD-01 Governing Rule

PRD-01 records **what the rebuilt system must support** and **what remains unknown**. It does not choose an implementation merely because a requirement exists.

Preserve the project decision classes:

- **Design Decision** — determined by approved Leyforge canon/source owners.
- **Engineering Decision** — determined by tests, profiling, prototypes and ADR review.
- **Technology Fact** — determined by source/code/documentation inspection.

A difficult or failed implementation approach does not silently delete a canonical requirement.

---

## 2. Extraction Boundary

PRD-01 is exhaustive at the **technical-requirement level**, not at the raw named-content level.

Example:

- `Reed Marsh`, `Mire Bog`, `Peat Moor` and every other individual biome remain FCC/content payloads.
- PRD-01 extracts requirements such as **the world system must support many authored biome families, sub-biomes/states, adjacency constraints, continuous climate fields, persistence and procedural selection** when the owning source requires those behaviours.

A named creature/material/structure receives a dedicated technical requirement only when it introduces a genuinely distinct runtime, persistence, simulation, authority, tooling, worldgen or data-contract need.

This prevents artificial requirement multiplication while preserving every behavioural obligation.

---

## 3. Requirement Record Schema

Every final requirement record must contain:

| Field | Meaning |
|---|---|
| **Requirement ID** | Stable PRD-01 requirement identity. |
| **Statement** | Implementation-neutral requirement. |
| **Class** | Canon requirement / architecture constraint / compatibility constraint / process constraint / evidence requirement. |
| **Source(s)** | Controlled PRD-00 Source IDs plus source section where useful. |
| **Authority owner** | System/source owner of the design truth. |
| **Decision class** | Design / Engineering / Technology Fact / Mixed. |
| **Status** | Locked / Active / Pending FCC delta / Unknown / Evidence required / Deferred. |
| **Implementation maturity** | Separate from authority; normally DESIGN ONLY during extraction. |
| **Unknown / evidence gap** | What is not yet resolved. |
| **Downstream consumers** | PRD-02–09, LFE and/or FORGE-ENG. |
| **Notes / collisions** | Duplicate, dependency or supersession handling. |

### 3.1 Requirement ID families

Initial namespaces:

- `REQ-GOV` — authority, ownership, source-of-truth, lifecycle
- `REQ-ID` — stable identity, registries, aliases, provenance
- `REQ-WLD` — world topology, realms, world state
- `REQ-WGEN` — generation, seeds, compatibility, history
- `REQ-SIM` — simulation, LOD, scheduling/relevance obligations
- `REQ-PST` — persistence, saves, recovery, migration
- `REQ-CIV` — persistent people/civilisation representation
- `REQ-SET` — settlements, buildings, construction
- `REQ-STR` — persistent structures, landmarks, sites and physical route infrastructure
- `REQ-POL` — civilisation identity, government, law, territory and political state
- `REQ-QST` — quests, events, evidence, chronicles and narrative runtime
- `REQ-AUT` — automation/logistics/production
- `REQ-MAG` — magic/mana/realm-capability runtime
- `REQ-PROG` — progression/knowledge/capability
- `REQ-ECON` — economy/trade/contracts
- `REQ-SOC` — social/dialogue/relationship truth
- `REQ-BIO` — survival/health/biology
- `REQ-MOV` — movement/routes/traversal
- `REQ-MAR` — oceans/vessels/maritime
- `REQ-ECO` — ecology/creatures/environment
- `REQ-CMB` — combat/threat/aftermath
- `REQ-REALM` — realm access/cross-realm behaviour
- `REQ-FORGE` — authoring/validation/bake/tooling
- `REQ-MP` — shared-world/multiplayer compatibility
- `REQ-UX` — UI/accessibility/explainability
- `REQ-PERF` — performance/scalability/backpressure
- `REQ-PROD` — production packages/release classification
- `REQ-DEV` — development/test/diagnostic/change-control
- `REQ-CFG` — settings, configuration, realm/server profiles and hardware guidance
- `REQ-MOD` — modding, workshop/community content and restricted player extensibility
- `REQ-OPS` — dedicated-server administration, moderation and long-running realm operations
- `REQ-REL` — updates, patching, release lifecycle, platform/distribution and shipping compatibility
- `REQ-ARCH` — engine-neutral architecture/runtime boundary constraints
- `REQ-PLAN` — settlement planning, parcels, projects and player Blueprint orchestration
- `REQ-BLD` — building functions, services, construction and activation contracts
- `REQ-ENT` — entity/body/actor representation and lifecycle
- `REQ-PRES` — presentation contracts and contextual presentation authority
- `REQ-SPAT` — spatial anchors, sockets, regions, paths, masks and coordinate semantics
- `REQ-VFX` — voxel/particle/VFX authoring and runtime constraints
- `REQ-AUDIO` — semantic audio/acoustics/voice authoring and runtime constraints

Unknowns use corresponding `UNK-*` namespaces. Specialised unknown-only namespaces currently include `UNK-FLUID`, `UNK-NAV` and `UNK-VESSEL`; these identify unresolved technical domains without implying a separate final LFE ownership family.

---

# 4. Round 1 — Root Technical Requirements

**Sources consumed in this round:**

- `SRC-FND-00` — Master Game Design Bible v1.0
- `SRC-FND-01` — Core Gameplay Loop v1.0
- `PRD-00 DNL-001` through `DNL-020`

These are root constraints. Later specialist sources may refine their owned fields without silently erasing the root promise.

## 4.1 Authority, causality and world-truth requirements

| ID | Requirement | Source | Decision class | Initial downstream |
|---|---|---|---|---|
| **REQ-GOV-001** | Leyforge must maintain **one authoritative owner for each gameplay truth**; consumers must obtain results through declared typed/versioned interfaces or evidence rather than duplicating mutable rules/formulas. | FND-00 §32; DNL-006 | Design | PRD-04, LFE |
| **REQ-GOV-002** | System authority/canon status must remain separate from implementation maturity; `LOCKED`, `IMPLEMENTED`, `STRESS TESTED` and `PRODUCTION QUALIFIED` are not interchangeable states. | PRD-00 lifecycle model; DNL-007 | Process | All PRD/LFE/FORGE-ENG |
| **REQ-GOV-003** | Source authority must resolve by owned scope and explicit supersession, not by file date/version alone. | PRD-00; DNL-018 | Process | All documentation/change control |
| **REQ-GOV-004** | Important actions must follow a readable causal cycle equivalent to **State → Intent → Validation → Cost → Result → Evidence → Consequence**. | FND-01 §3 | Design | LFE command/transaction/event architecture |
| **REQ-GOV-005** | When goods, labour, travel, construction, damage, treatment or production are claimed to have occurred, the owning authoritative state must be able to explain the result; abstraction may aggregate but may not invent impossible outcomes. | FND-00 §3 | Design | LFE authority/simulation/persistence |
| **REQ-GOV-006** | Cross-system consequences must consume authoritative outputs from their owning domains rather than relying on disconnected progress bars/menu-only state. | FND-00 §3; FND-01 §3 | Design | LFE interfaces/events |
| **REQ-GOV-007** | A failed prototype or benchmark may reject an engineering approach but may not silently delete a canonical game requirement. | DNL-008 | Process | PRD-06/07/08/09 |

## 4.2 World generation, capability reachability and history

| ID | Requirement | Source | Decision class | Initial downstream |
|---|---|---|---|---|
| **REQ-WGEN-001** | Normal production worlds must be seed-generated from reusable content families/relationships rather than depend on the fixed POC valley or named POC identities. | FND-00 §8, §31, §34; FND-01 §5, §37 | Design | PRD-02/04, LFE worldgen |
| **REQ-WGEN-002** | Procedural randomness must be constrained by compatibility/explanation: generated cultures, sites, routes, ecology, threats and realm relationships require valid contextual reasons. | FND-00 §8.1 | Design | LFE worldgen/content validation |
| **REQ-WGEN-003** | Production seeds must not depend on one exact POC-era village, material, ruin, cave, portal or other named content identity to remain playable. | FND-00 §8.2; FND-01 §5, §36 | Design | LFE worldgen/capability validation |
| **REQ-WGEN-004** | Required capability categories must remain reachable through approved provider families, substitutes, alternate routes or controlled generation failure rather than hidden POC fallback reconstruction. | FND-00 §8.2; FND-01 §5, §36 | Design | PRD-04/06, LFE capability/worldgen |
| **REQ-WGEN-005** | Capability substitutes must still obey progression, resource availability, suitability, world/cultural context, balance, permissions and specialist validation. | FND-01 §36.2 | Design | LFE capability validation |
| **REQ-WGEN-006** | World generation must support generated/persistent history and current state for regions, settlements, structures, factions, routes and sites where their owners require it. | FND-00 §8.3 | Design | LFE world-state/worldgen/persistence |
| **REQ-WGEN-007** | Generated history must be consumable by later systems such as exploration, rumours, quests, markets, settlement behaviour and events. | FND-00 §8.3 | Design | LFE event/history interfaces |

## 4.3 Simulation abstraction and authoritative continuity

| ID | Requirement | Source | Decision class | Initial downstream |
|---|---|---|---|---|
| **REQ-SIM-001** | Leyforge must support multiple simulation representations/fidelity levels because the entire world cannot run at maximum physical detail simultaneously. | FND-00 §29; FND-01 §35 | Design + Engineering | PRD-04/06/07, LFE simulation |
| **REQ-SIM-002** | Abstraction must preserve consequential stable identity, quantities, ownership, reservations/obligations, capability/blockers, history, route feasibility, settlement state, biological state, economic commitments and relevant social memory. | FND-00 §3.1 | Design | LFE simulation/state contracts |
| **REQ-SIM-003** | Near simulation must permit detailed physical actors/interactions, visible goods/construction, real-time combat, local pathing and directly operable machines where the owning systems require them. | FND-01 §35.1 | Design | LFE near-runtime architecture |
| **REQ-SIM-004** | Distant simulation may use bounded summaries for settlements, journeys, economy, biology, social assignments, construction and production, but may not fabricate quantities or bypass owning rules. | FND-01 §35.2 | Design | LFE distant simulation |
| **REQ-SIM-005** | Promotion/demotion between simulation representations must reconcile from authoritative state and must not invent contradictory local reality. | FND-00 §29.1; FND-01 §35.3 | Design + Engineering | PRD-06/07, LFE LOD transitions |
| **REQ-SIM-006** | Removing visual representation at distance must not remove authoritative world truth. | FND-00 §3.1 | Design | LFE simulation/persistence |

## 4.4 Persistent people and civilisation-scale truth

| ID | Requirement | Source | Decision class | Initial downstream |
|---|---|---|---|---|
| **REQ-CIV-001** | Important NPCs must have persistent consequential identities across representation changes. | FND-00 §9, §34; FND-01 §35 | Design | LFE entity/civilisation |
| **REQ-CIV-002** | Where relevant, persistent people must be capable of retaining stable identity/name, culture/faction/settlement context, household/relationships, occupation/skills, residence/work context, schedules/tasks, inventory, memories/social history, biological state, obligations, travel state, quest/event participation and life-history state. | FND-00 §9.1 | Design | PRD specialist extraction → LFE entity data |
| **REQ-CIV-003** | NPC occupations must correspond to real world capability and authoritative resources rather than decorative labels: production, construction, guarding, trade, healing, hauling and maritime work must connect to owning systems. | FND-00 §9.2 | Design | LFE jobs/tasks/interfaces |
| **REQ-CIV-004** | Distant civilisation/person simulation may simplify representation but must preserve consequential identity and outcomes. | FND-00 §9.1–9.3 | Design + Engineering | PRD-06/07, LFE civilisation LOD |
| **REQ-CIV-005** | Social/population change such as migration, households, relationships, ageing/birth/death or recruitment must be representable where enabled by the owning systems/world settings. | FND-00 §9.3 | Design | Later Set 28/29 extraction; LFE data model |

## 4.5 Settlements, buildings and physical construction

| ID | Requirement | Source | Decision class | Initial downstream |
|---|---|---|---|---|
| **REQ-SET-001** | The only top-level settlement needs are **Housing, Provisions, Health, Work, Safety, Infrastructure and Morale** unless explicitly amended by the owning canon. | FND-00 §10.1, §34 | Design lock | LFE settlement model |
| **REQ-SET-002** | Settlement capability/growth must not require one fixed visual layout; settlements are physical networks of people, parcels, routes, buildings, services, projects, utilities, storage, defences and culture. | FND-00 §10 | Design | LFE settlement representation |
| **REQ-SET-003** | Settlements must be able to progress independently of the player subject to real resources, population/specialists, housing/services, routes, safety, economy, health/provisions, culture, knowledge, events and damage. | FND-00 §10.3 | Design | LFE settlement simulation |
| **REQ-SET-004** | Building/service function must be determined by valid semantic/runtime contracts (structure, markers, access, people, resources, equipment, networks, permissions, condition and operation), not appearance alone. | FND-00 §10.4, §34 | Design | LFE building/service contracts; FORGE-ENG |
| **REQ-SET-005** | Leyforge must support multiple construction paths including direct block building, modular voxel pieces, in-world blueprints, workshop blueprints, NPC staged construction, settlement projects and developer-authored Blueprint Forge source. | FND-00 §10.5 | Design | LFE construction; FORGE-ENG |
| **REQ-SET-006** | Survival-world construction must consume authoritative resources and respect terrain, permissions and capability; free drafting does not imply free construction. | FND-00 §10.5 | Design | LFE transactions/construction |
| **REQ-SET-007** | Settlement decline, occupation, abandonment, damage, corruption and restoration must be representable as persistent altered states where enabled, including downstream evidence such as ruins, ownership changes, displaced people/routes and reconstruction opportunities. | FND-00 §10.6 | Design | LFE settlement/history/persistence |

## 4.6 Forge and authoring boundary requirements

| ID | Requirement | Source | Decision class | Initial downstream |
|---|---|---|---|---|
| **REQ-FORGE-001** | The Forge must remain a real controlled content-authoring environment with distinct Asset, Entity, Blueprint and Presentation specialist workspaces/ownership. | FND-00 §28; DNL-009/010 | Design | PRD-04/07, FORGE-ENG |
| **REQ-FORGE-002** | Forge-authored visual/spatial/presentation/semantic data may not silently redefine the owning gameplay truth. | FND-00 §28.2 | Design | FORGE-ENG validation/contracts |
| **REQ-FORGE-003** | Canonical editable authoring source must remain separate from derived runtime products such as meshes, caches, collision products, icons, animation data and presentation bakes, which must be regenerable/replaceable. | FND-00 §28.3; DNL-011 | Design | PRD-03/04, FORGE-ENG pipeline |
| **REQ-FORGE-004** | Developer Forge authority and shipped player creator/Blueprint Workshop authority must remain distinct; player creation may not grant unrestricted canonical registry, migration or source-of-truth control. | FND-00 §28.4; DNL-012 | Design/security constraint | PRD-04/06, FORGE-ENG |
| **REQ-FORGE-005** | The shipped game must not require an external AI service merely because AI-assisted development/authoring tools are used. | FND-00 §28.5 | Design | FORGE-ENG/deployment |

## 4.7 Performance and hardware scalability requirements

| ID | Requirement | Source | Decision class | Initial downstream |
|---|---|---|---|---|
| **REQ-PERF-001** | Scalability must be designed into the architecture rather than treated as late optimisation. | FND-00 §29; DNL-014 | Design + Engineering | PRD-06/07, LFE performance |
| **REQ-PERF-002** | Quality/performance profiles may reduce representation cost (distance, actor detail, presentation density, update frequency within bounds, background detail and local budgets) but may not silently change authoritative outcomes. | FND-00 §29.2 | Design | LFE scalability/settings |
| **REQ-PERF-003** | Lower-end hardware must be supported through reduced representation cost and selected simulation breadth where compatible while preserving the same game identity and authoritative truth. | FND-00 §29.3; DNL-014 | Design + Engineering | PRD-06/07; future Set 35; LFE |
| **REQ-PERF-004** | Graphics scalability and simulation scalability must remain separable concerns. | DNL-014; future Set 35 constraint | Design constraint | PRD-04/06, LFE |
| **REQ-PERF-005** | Performance decisions require measured budgets/profiling/regression evidence; perceived smoothness alone is insufficient. | DNL-016 | Process/evidence | PRD-06/07/08; LFE development |

## 4.8 Multiplayer/shared-world compatibility requirements

| ID | Requirement | Source | Decision class | Initial downstream |
|---|---|---|---|---|
| **REQ-MP-001** | Solo must remain a complete baseline experience; multiplayer extends the same authoritative world rather than introducing a separate ruleset. | FND-00 Production Status; FND-01 §33 | Design | PRD-04/06, LFE multiplayer |
| **REQ-MP-002** | Architecture choices for identity, authority, deterministic generation, edits, persistence and simulation must not make later shared-world multiplayer impossible even if full multiplayer is implemented later. | DNL-013 | Compatibility constraint | PRD-04/06, LFE |
| **REQ-MP-003** | Shared-world ownership/permission must be explicit for inventories, structures, projects, contracts, settlement actions, companions, vehicles/vessels, quests/events, social decisions and economic commitments where multiple players may act. | FND-01 §33.1 | Design | LFE authority/permissions |

## 4.9 UI, explainability and accessibility requirements

| ID | Requirement | Source | Decision class | Initial downstream |
|---|---|---|---|---|
| **REQ-UX-001** | UI must explain authoritative world state rather than replace simulation with menu-only truth. | FND-01 §34 | Design | LFE/FORGE presentation interfaces |
| **REQ-UX-002** | Consequential blockers, permissions, missing resources, route access, biological warnings, economic reasons, social consequences, machine faults, construction state, threat preparation, event state and save/recovery status must be inspectable/readable where applicable. | FND-01 §34 | Design | Specialist UI contracts |
| **REQ-UX-003** | Normal play should remain world-first, with deeper numbers/history/graphs/ledgers/diagnostics exposed progressively when requested or required. | FND-01 §34.1 | Design | UI architecture |
| **REQ-UX-004** | Critical information should have equivalent multi-channel communication where practical (text, iconography, sound, animation, vibration, patterns, configurable timing/assistance). | FND-01 §34.2; FND-00 §34 | Design | Accessibility architecture |
| **REQ-UX-005** | Meaningful world consequences should eventually be visible or inspectable rather than existing only as invisible state. | FND-00 §34 rule 30 | Design | Event/history/UI presentation |

## 4.10 Persistence, identity and lifecycle root requirements

| ID | Requirement | Source | Decision class | Initial downstream |
|---|---|---|---|---|
| **REQ-ID-001** | Canonical Leyforge IDs/persistent identities must remain independent from engine paths, Godot resource identity, Zylann/Voxel Tools model IDs or other replaceable runtime bindings. | DNL-005 | Design/governance | PRD-04, LFE registry/persistence |
| **REQ-ID-002** | Stable identity must survive revision through governed IDs, aliases, migration and provenance. | FND-00 §34 rule 26; DNL-015 | Design | LFE registry/migration; FCC-13 delta |
| **REQ-PST-001** | Persistence, save safety, versioning, migration, aliases/tombstones, old-world compatibility and recovery must be foundation architecture rather than post-release add-ons. | DNL-015 | Design + Engineering | PRD-04/06/07/08, LFE persistence |
| **REQ-PST-002** | World edits, people, inventories, structures, relationships, economies, journeys, events, damage and history must persist where their owning systems require persistence. | FND-00 Production Status | Design | Specialist extraction; LFE persistence |

## 4.11 Production/process constraints

| ID | Requirement | Source | Decision class | Initial downstream |
|---|---|---|---|---|
| **REQ-PROD-001** | Documented breadth is not automatically a shipping commitment; systems/content use production classifications such as Core Production, Early Access, Full Release, Later Expansion, Tooling Research and Archived Validation. | FND-00 §30 | Process/design | Implementation staging |
| **REQ-PROD-002** | A content/system package should not enter production merely as an isolated idea; it requires stable identity, owner, dependencies, physical inputs/outputs, capabilities/fallbacks, relationships, presentation requirements, simulation behaviour, save/migration treatment and validation evidence as applicable. | FND-00 §30.2 | Process | PRD-09, LFE/FORGE-ENG acceptance |
| **REQ-PROD-003** | Core Production must prove the final generated-game identity rather than recreate the retired Forest Hamlet/POC scenario. | FND-00 §30.3 | Design/staging | Implementation vertical slice |
| **REQ-PROD-004** | Retiring POC scenario identities must not automatically remove reusable capabilities proven by the POC. | FND-00 §31; FND-01 §37; DNL-017 | Governance | PRD-01/05/06/07 |
| **REQ-PROD-005** | Future Sets 31–42 impose architectural compatibility constraints now but their complete production/UX implementations are not all prerequisites for starting the clean rebuild. | DNL-019 | Process/compatibility | PRD-04/09, LFE/FORGE-ENG |

## 4.12 Pre-rebuild engineering-process requirements

| ID | Requirement | Source | Decision class | Initial downstream |
|---|---|---|---|---|
| **REQ-DEV-001** | Rebuild sequence remains **research → decisions → prototypes → canonical technical documentation → clean rebuild**. | DNL-001 | Process lock | PRD-01–09 |
| **REQ-DEV-002** | Capability confidence must use P0–P5 proof levels: Idea, Documentation Evidence, Reference Implementation, Leyforge Prototype, Stress Tested, Production Qualified. | DNL-002 | Process lock | PRD-06/07/08/09 |
| **REQ-DEV-003** | Design decisions, engineering decisions and technology facts must be tracked separately and resolved by the appropriate authority/evidence source. | DNL-003 | Process lock | All PRD/LFE/FORGE-ENG |
| **REQ-DEV-004** | Godot + Zylann/Voxel Tools remains the current rebuild foundation **candidate**, not unquestioned final technical canon; requirement-driven audits/prototypes must qualify it. | DNL-004 | Engineering hypothesis | PRD-02/03/04/06/07 |
| **REQ-DEV-005** | Diagnostics, profiling and regression evidence must exist from the foundation onward. | DNL-016 | Process/evidence | PRD-06/07/08, LFE development architecture |
| **REQ-DEV-006** | Historical Summer/POC technical implementation may contribute regression requirements and evidence but cannot automatically own the new architecture. | DNL-017 | Governance | PRD-01/05/06/07 |
| **REQ-DEV-007** | LFE and FORGE-ENG become canonical engineering authority only after PRD closure/evidence review; Pass 5 and historical technical plans remain provisional/evidence until formally adopted. | DNL-020 | Process lock | PRD-09 → LFE/FORGE-ENG |

---

# 5. Round-1 Implementation Unknowns / Evidence Gaps

These are **not missing game-design decisions**. They are technical questions exposed by the root requirements and deliberately left for later PRD work.

| Unknown ID | Question exposed by requirements | Decision type / planned route |
|---|---|---|
| **UNK-WGEN-001** | What exact deterministic generation pipeline, work partitioning and ordering model will satisfy seed identity across threads/cores and large worlds? | Technology + Engineering → PRD-02/03/06/07 |
| **UNK-WGEN-002** | What validation/repair mechanism guarantees required capability reachability without reconstructing fixed POC content? | Engineering → PRD-04/06/07 |
| **UNK-SIM-001** | What exact simulation fidelity levels, relevance criteria and transition contracts will preserve authoritative state at Leyforge scale? | Engineering → PRD-04/06/07 |
| **UNK-SIM-002** | How are detailed actor/world states reconstructed from distant summaries without duplication, disappearance or contradictory outcomes? | Engineering → PRD-04/06/07 |
| **UNK-ID-001** | What concrete stable-ID format, namespace rules and runtime-binding layer will separate canon identity from engine/Zylann IDs? | Design/governance + Engineering → PRD-04; FCC-13 delta |
| **UNK-PST-001** | What save partitioning, journaling/atomicity, recovery and migration architecture satisfies long-lived multi-realm worlds? | Engineering → PRD-04/06/07/08 |
| **UNK-PERF-001** | What CPU/GPU/memory/worldgen/streaming/simulation budgets define acceptable profiles across target hardware? | Engineering → PRD-06/07 |
| **UNK-MP-001** | What future-compatible authority/replication topology best preserves the solo authoritative model while allowing shared worlds? | Technology + Engineering → PRD-03/04/06 |
| **UNK-FORGE-001** | What canonical authoring schemas/package format/compiler/bake pipeline preserve editable source while generating runtime products? | Engineering → PRD-03/04/07; FORGE-ENG |
| **UNK-FORGE-002** | What technical sandbox/permission model separates developer and player creator authority while still allowing powerful player tools? | Technology + Engineering → PRD-03/04/06 |
| **UNK-CIV-001** | What representation/data architecture allows large persistent populations while preserving important individual identity and distant civilisation truth? | Engineering → PRD-04/06/07 |
| **UNK-NAV-001** | How will local navigation, route feasibility and large terrain edits interact safely with streamed/unloaded worlds and NPC simulation LOD? | Technology + Engineering → later specialist extraction + PRD-03/06/07 |
| **UNK-AUT-001** | How will large automation/logistics networks conserve exact resources while avoiding unbounded graph recomputation? | Engineering → later specialist extraction + PRD-06/07 |
| **UNK-FLUID-001** | What bounded fluid/ocean model can satisfy world, ecology, construction and maritime requirements without uncontrolled simulation cost? | Technology + Engineering → Set 26/FCC extraction + PRD-02/03/06/07 |
| **UNK-VESSEL-001** | What moving-vessel architecture can preserve editable physical construction, occupants, cargo, collision, persistence and future multiplayer authority? | Technology + Engineering → Set 26 extraction + PRD-02/03/06/07 |
| **UNK-DEV-001** | What exact observability counters, benchmark fixtures, regression suites and failure thresholds must exist before production architecture is accepted? | Engineering/process → PRD-06/07/08 |

---

# 6. Extraction Rounds — Controlled Plan

PRD-01 will proceed source family by source family rather than mixing hundreds of documents at once.

| Round | Primary sources | Purpose | Status |
|---|---|---|---|
| **1** | Foundation 00–01 + DNL-001–020 | Root identity, causality, world truth, simulation, Forge, scale/process constraints | **DONE — v0.1** |
| **2** | Foundation 02–06 | progression, Blocks/Items/Recipes, materials/capabilities and registry/transformation requirements | **DONE — v0.2** |
| **3** | Foundation 07–10 | people, settlements, automation, magic, creatures/ecology | **DONE — v0.3** |
| **4** | Foundation 11–15 | worldgen, structures, civilisation identity, realms, quests/events/history | **NEXT** |
| **5** | Foundation 16–20 + Set 20 v0.2 | combat, UI/accessibility, mixed technical provenance, settlement planning/buildings/projects | PENDING |
| **6** | Forge 21–23 | complete authoring, validation, migration, runtime-bake and creator requirements | PENDING |
| **7** | Sets 24–26 | Atlas/world-content, governance/registries, oceans/maritime/vessels | PENDING |
| **8** | Sets 27–30 + XSI v1.1 | economy, social, biology, movement and final interface ownership | PENDING |
| **9** | FCC-01 + FCC-02/03/04/05/06/08 | realm/content-derived runtime/data/worldgen requirements and cross-realm constraints | PENDING |
| **10** | FCC-12 active corpus + later FCC-12/13/14 deltas | material/processing/identity/recipe/global reconciliation deltas | ACTIVE DELTA TRACK |
| **11** | Optimisation Discussion + Sets 31–42 + 43+ | pre-rebuild process, future production compatibility and stress horizon | PENDING |
| **12** | Research Passes 1–5 + POC/VoxelRegistry | evidence cross-check, historical behaviours, regression/prototype inputs; **not new canon** | PENDING |
| **13** | All above | deduplication, dependency graph, unknowns matrix, coverage audit and PRD-01 closure candidate | PENDING |

---

# 7. Round-1 Coverage Result

Round 1 establishes the non-negotiable root architecture pressure:

- persistent authoritative world truth;
- physically grounded cause-and-effect;
- seed-generated production worlds;
- capability-based reachability rather than fixed named-content dependencies;
- simulation abstraction that preserves identity/quantities/consequences;
- persistent people and settlements;
- functional construction contracts;
- real visual Forge authoring with separated runtime bake products;
- authority separation between developer/player tools;
- performance/scalability as architecture;
- future multiplayer compatibility;
- stable identity and migration as foundation concerns;
- world-first explainable UI/accessibility;
- evidence-driven technical decisions before the clean rebuild.

These are root constraints only. Specialist documents will now add the detailed technical obligations that make them implementable and testable.

---

# 8. Current Next Action

Proceed to **PRD-01 Round 4 — Foundation Documents 11–15**.

Round 4 will extract requirements for:

- biome/world-generation and procedural assembly;
- terrain/climate/hydrology/geology and generated-history interfaces;
- structures, landmarks, routes and persistent structure state;
- peoples, cultures, factions, governments and civilisation identity;
- realms, portal travel and interdimensional world-state separation;
- quests, events, history and persistent world consequences.

PRD-01 remains **WORKING** until every mandatory PRD-00 input family has been consumed, deduplicated and reconciled.

---

# 9. Round 2 — Foundation 02–06 Requirements

**Sources consumed:** `SRC-FND-02` through `SRC-FND-06`.

Round 2 adds the canonical progression, Block, Item, Recipe/Transformation, Resource and capability-pathway contracts. These sources strongly constrain the future data model but still do not choose the host-engine implementation.

## 9.1 Progression and capability requirements — Document 02

| ID | Requirement | Source | Decision class | Downstream |
|---|---|---|---|---|
| **REQ-PROG-001** | Player progression must remain multi-layered and capability-based; no single level/skill/perk number may erase missing physical, legal, biological, knowledge, consent or system state. | FND-02 §1–2 | Design | LFE progression/interfaces |
| **REQ-PROG-002** | Progression must support multiple valid routes to the same capability through practice, equipment, specialists, institutions, knowledge, trade, alternate materials/processes or other approved providers. | FND-02 §2.1, §19 | Design | LFE capability graph |
| **REQ-PROG-003** | Progression gates must distinguish hard world gates, soft proficiency gates and discovery/access gates so implementation does not replace physical truth with arbitrary level locks. | FND-02 §2.2 | Design | LFE validation/progression |
| **REQ-PROG-004** | Progression benefits must be exposed as typed modifiers/capability support to specialist owners rather than directly rewriting Health, Stamina, prices, relationships, movement or other externally owned truth. | FND-02 §13, §41 | Design/governance | PRD-04, LFE interfaces |
| **REQ-PROG-005** | Knowledge progression must support distinct knowledge states and preserve separation between source confidence/belief and objective truth. | FND-02 §16 | Design | Set 28/Atlas extraction; LFE knowledge refs |
| **REQ-PROG-006** | The system must distinguish at least **known**, **eligible**, **available here** and **currently executable** when presenting progression/recipes/capabilities. | FND-02 §17 | Design | UX/capability validation |
| **REQ-PROG-007** | Tools, materials, equipment, machines, vehicles, vessels and infrastructure must remain real physical capability providers; skill cannot conjure an absent provider. | FND-02 §18 | Design | LFE capability provider model |
| **REQ-PROG-008** | Later progression must not automatically obsolete earlier materials/capabilities; useful lower-tier repair/infrastructure paths must remain representable. | FND-02 §18.2, §32.2 | Design | Resource/recipe architecture |
| **REQ-PROG-009** | Automation/delegated work must not become passive character grinding that awards progression without meaningful player participation or approved contribution semantics. | FND-02 §21, §38 | Design | LFE progression/events |
| **REQ-PROG-010** | Settlement growth/capability must remain distinct from player level; one may enable opportunities for the other without mirroring state. | FND-02 §22 | Design | LFE settlement/progression |
| **REQ-PROG-011** | Social/reputation/political consequence must not collapse into one universal XP/reputation number where specialist owners preserve distinct trust, law, faction or evidence states. | FND-02 §24, §31 | Design | Set 28/27/13 extraction |
| **REQ-PROG-012** | Movement skill must not grant a missing movement mode; maritime progression must likewise depend on real vessels/equipment/infrastructure and owned capability. | FND-02 §27–28 | Design | Set 30/26 extraction |
| **REQ-PROG-013** | The game must not require global enemy auto-scaling to player level, and peaceful/non-combat progression must remain capable of forming a complete play path where settings/systems allow. | FND-02 §29 | Design | Combat/world scaling |
| **REQ-PROG-014** | Realm access/progression must not reduce to one player-level gate and realm materials must not automatically obsolete Overworld industry. | FND-02 §32 | Design | FCC/realm/resource extraction |
| **REQ-PROG-015** | Shared-world progression commits must be authoritative/reason-coded; client-reported XP may not be authoritative and one player may not silently respec another. | FND-02 §34 | Design/security | LFE multiplayer/progression |
| **REQ-PROG-016** | Difficulty/performance profiles may alter pressure/forgiveness but must not silently rewrite underlying capability truth or progression state. | FND-02 §37 | Design | LFE settings/simulation |
| **REQ-PROG-017** | Anti-exploit handling must prevent duplicate progression awards for the same committed event unless explicitly repeatable and must reject client-authoritative progression commits. | FND-02 §38 | Design/security | LFE event/progression |
| **REQ-PROG-018** | Supported generated worlds must be validated for viable progression/capability reachability; a failed reachability proof must report/repair/fail the seed/profile rather than reconstruct the retired POC. | FND-02 §40 | Design + Engineering | PRD-06/07, LFE world validation |

## 9.2 Canonical Block and voxel-definition requirements — Document 03

| ID | Requirement | Source | Decision class | Downstream |
|---|---|---|---|---|
| **REQ-ID-003** | Canonical Block identity must separate Block Family, Concrete Block Entry, inventory projection, runtime placement/cell state, Block Entity, material/shape/state profiles and presentation profiles. | FND-03 §1, §5 | Design | LFE registry/voxel binding |
| **REQ-ID-004** | A new canonical Block definition is justified only by materially distinct physical/gameplay/save behaviour; cosmetic palette/weather/culture/presentation variants must normally remain profiles/states/overlays rather than duplicate definitions. | FND-03 §1.2, §19, §44 | Design | FCC-13; FORGE-ENG |
| **REQ-ID-005** | Canonical Block authoring must use one-way derivation into generated runtime resources; generated Resources, Forge visuals, spreadsheet exports, inventory projections, thumbnail data and save caches may not become editable competing sources of Block truth. | FND-03 §3 | Design/governance | PRD-04, LFE/FORGE-ENG |
| **REQ-ID-006** | Block IDs must be qualified, stable and independent of display names/asset paths; referenced IDs are frozen, never recycled, and changes use aliases/tombstones/explicit split-merge migration mappings. | FND-03 §4 | Design | FCC-13, LFE migration |
| **REQ-ID-007** | Runtime placements must reference immutable definition identity rather than copy immutable material/profile fields into every cell/save record. | FND-03 §5 | Design + Engineering | LFE voxel storage |
| **REQ-ID-008** | Ordinary recover-as-self placeables must use one Block definition plus a generated Block Inventory Projection rather than a duplicate Item definition. | FND-03 §6–8, §50 | Design lock | FCC-13, LFE registry/inventory |
| **REQ-ID-009** | A distinct Item alongside a Block is allowed only for a genuinely different lifecycle/transformation (e.g. harvested ore/food/component/kit); the relationship must be explicit. | FND-03 §6 | Design | FCC-13, recipes |
| **REQ-ID-010** | Block Inventory Projections must be generated views referencing the Block ID and approved portable state; display/material/placement truth must resolve from the canonical Block rather than duplicate Item fields. | FND-03 §7 | Design | LFE inventory/registry |
| **REQ-ID-011** | Every breakable/harvestable Block must declare one authoritative recovery/output mode, and self-recovery may not also emit a same-identity duplicate Item. | FND-03 §8 | Design | LFE mining/transactions |
| **REQ-PST-003** | Packing/picking up stateful Blocks/containers must be atomic and conservation-safe; failure must roll back or quarantine rather than leave placed and carried duplicates. | FND-03 §9 | Design + Engineering | PRD-06/07, LFE transactions |
| **REQ-ID-012** | Block composition should use shallow inheritance plus typed composition/facets; deep inheritance that obscures final behaviour is prohibited. | FND-03 §10 | Design | LFE data schema/FORGE-ENG |
| **REQ-ID-013** | Admitted Blocks require a universal definition schema covering identity, classification, material, shape, placement, interaction, recovery, inventory, state, services, world eligibility, authority, presentation and validation references. | FND-03 §11 | Design | LFE registry/FORGE-ENG validators |
| **REQ-ID-014** | Block material/physical behaviour should reference governed profiles/bands (hardness, density, flammability, light, permeability, friction, etc.) rather than duplicate material truth or premature fake precision. | FND-03 §12 | Design | FCC-12/13; LFE physics/material interface |
| **REQ-ID-015** | Shape availability must be explicit per family; the system must not generate every family × material × shape combination automatically. | FND-03 §13, §44 | Design/performance | FORGE-ENG compiler; LFE registry |
| **REQ-WLD-001** | Player placement, NPC construction, blueprint placement and worldgen must consume the same canonical Block definitions even when their validation/authority pipelines differ. | FND-03 §14 | Design | LFE world mutation/FORGE-ENG |
| **REQ-WLD-002** | Collision/selection/interaction/fluid-boundary/navigation/vessel occupancy truth must come from the Block/shape contract or validated derived products; presentation geometry may not silently change gameplay collision. | FND-03 §15 | Design | LFE voxel physics/FORGE-ENG validation |
| **REQ-WLD-003** | Ordinary land construction must not assume universal structural collapse; gravity/support simulation applies only to explicitly participating families/specialist systems. | FND-03 §16 | Design | LFE physics/structure systems |
| **REQ-ID-016** | Block condition should remain state/overlay when identity and behaviour remain compatible; materially changed collision/drops/capability/simulation/save contracts require an explicit transformation/new definition. | FND-03 §18–19 | Design | FCC-13, LFE state machine |
| **REQ-ID-017** | Block Entities must be reserved for persistent state that cannot safely fit compact cell state, and the Block definition owns which schema may attach while specialist systems own detailed behaviour. | FND-03 §20 | Design + Engineering | LFE block-entity architecture |
| **REQ-MP-004** | Placeable Blocks must expose typed ownership/permission/reservation/mutation hooks where required without taking ownership of legal/social/economic consequences. | FND-03 §21 | Design | LFE authority/interface layer |
| **REQ-PST-004** | Saves must store stable Block IDs plus runtime state, not fragile asset paths. Missing/removed optional definitions must preserve original IDs/payload through recovery/quarantine and explicit schema migration. | FND-03 §42 | Design + Engineering | LFE persistence/migration |
| **REQ-SIM-007** | Ordinary Blocks should not receive unnecessary distant per-tick simulation; stateful Blocks participate through owning-system summaries and demotion may not discard identity/conserved state. | FND-03 §43 | Design + Engineering | LFE simulation LOD |
| **REQ-PERF-006** | Block-registry architecture must explicitly control combinatorial entry explosion through family-first authoring, limited shape eligibility, runtime states/overlays, compact compiled IDs and separated presentation variants. | FND-03 §44 | Design + Engineering | PRD-06/07, LFE/FORGE-ENG |
| **REQ-ID-018** | The executable concrete Block registry must be machine-readable canonical data, deterministically compilable, semantically versioned/hashed and accompanied by migration/placement/break/save validation. | FND-03 §46 | Design + Engineering | LFE registry compiler; FORGE-ENG |
| **REQ-PST-005** | Legacy `VoxelRegistry.json`/`VXL_BLK_*` IDs and Unreal asset paths are migration evidence only; migration must classify/map/convert state explicitly and quarantine unresolved definitions rather than guess. | FND-03 §47 | Design/migration | PRD-05/06/07; LFE migration |
| **REQ-DEV-008** | Block release validation must cover identity, generation determinism, Block/Item duplication, placement/collision, harvest, conservation, state, Block Entity save/rollback, worldgen, optional packs, Forge contracts, accessibility and performance. | FND-03 §49–50 | Evidence requirement | PRD-06/07/08 |

## 9.3 Canonical Item, inventory and carried-state requirements — Document 04

| ID | Requirement | Source | Decision class | Downstream |
|---|---|---|---|---|
| **REQ-ID-019** | The Item Registry owns real non-Block carried/equipped identity and persistent item-specific state; it must not become a catalogue of every UI-slot representation. | FND-04 §1, §3 | Design | LFE item registry |
| **REQ-ID-020** | If two records describe the same physical thing through the same lifecycle, only one may remain canonical; consumers reference identity through facets/projections/relationships. | FND-04 §1 | Design lock | FCC-13, LFE registry |
| **REQ-ID-021** | Item Family, Concrete Definition, Stack, Instance, runtime equipment binding and inventory/container location must remain separate layers with distinct ownership. | FND-04 §5 | Design | LFE inventory/data model |
| **REQ-PERF-007** | Item instances must be created only when gameplay state requires singular persistence; ordinary bulk goods must not become thousands of heavyweight instances merely because the engine supports them. | FND-04 §5 | Design + Engineering | LFE inventory/performance |
| **REQ-ID-022** | Block projections may occupy inventory/storage/crafting/trade slots without becoming Item definitions; block-form pseudo-families remain non-spawnable migration/projection aliases. | FND-04 §6–7 | Design lock | FCC-13, inventory |
| **REQ-PST-006** | Portable container/packed-state transactions must be atomic so contents cannot remain in the world while also appearing inside a carried payload. | FND-04 §9 | Design + Engineering | LFE transaction/persistence |
| **REQ-ID-023** | Canonical Item definitions require governed identity/classification/state/use/equipment/provenance/migration/validation fields while external truths such as price, biology and movement remain references/facets. | FND-04 §10, §3 | Design | LFE registry/FORGE-ENG |
| **REQ-ID-024** | Stackability must depend on explicit state compatibility profiles; split/merge must preserve required batch/instance state such as quality, freshness, purity, provenance, charge, ownership or contamination. | FND-04 §11–12 | Design + Engineering | LFE inventory transactions |
| **REQ-PST-007** | Item quantity and required state must remain conserved across crafting, automation, transfers, trade, death, storage, save/load and migration. | FND-04 §1, §13 | Design + Engineering | LFE transactions/persistence |
| **REQ-ID-025** | Ownership, custody/location, claims/permissions and canonical identity must remain separate concepts so transfers do not accidentally rewrite identity or legal ownership. | FND-04 §14 | Design | LFE authority/inventory |
| **REQ-ID-026** | Provenance/maker/source/chain-of-custody data must use governed profiles and shared authoritative records where relevant rather than duplicate complete world history into every Item. | FND-04 §15 | Design + Engineering | LFE provenance/event refs |
| **REQ-ECON-001** | Item physical identity/state may expose economic facts but may not own authoritative dynamic price/value formulas; current economic truth belongs to Set 27. | FND-04 §3, §16, §46 | Design/governance | Set 27 extraction; LFE interface |
| **REQ-ID-027** | Optional content removal must preserve unknown Item definitions/state via tombstones/quarantine/recovery rather than silently deleting or converting them to unrelated generic goods. | FND-04 §40–41 | Design + Engineering | LFE persistence/mod packages |
| **REQ-PST-008** | Item migrations must preserve stable IDs/aliases, quantities, instance/stack state, ownership and provenance; retired POC IDs may remain migration aliases but not normal spawn identities. | FND-04 §4, §41 | Design + Engineering | LFE migration |
| **REQ-CIV-006** | Persons/awakened constructs must never be represented as ordinary inventory/loot merely because another system needs a reference/token. | FND-04 §20–21, §44/46 | Design/personhood boundary | Later creature/social extraction |
| **REQ-DEV-009** | Item acceptance must block identity/reference collisions, same-lifecycle Block/Item duplicates, state-loss/illicit merges, non-conserved transactions, ownership loss, external-owner bypass, personhood violations and optional-pack save corruption. | FND-04 §42, §44 | Evidence requirement | PRD-06/07/08 |

## 9.4 Recipe, transformation and transaction requirements — Document 05

| ID | Requirement | Source | Decision class | Downstream |
|---|---|---|---|---|
| **REQ-AUT-001** | Any process that changes authoritative physical stock, item/block condition, project material state, installed equipment, salvage or declared world-state output must resolve through an approved transformation/transaction contract or another owner with equivalent conservation guarantees. | FND-05 §1 | Design | LFE transaction architecture |
| **REQ-AUT-002** | Recipe Family, Concrete Recipe, runtime Recipe Job and irreversible Transaction Journal must remain distinct; definitions may not contain live progress/stock/owner/market/queue state. | FND-05 §3–4 | Design | LFE recipes/jobs/journal |
| **REQ-AUT-003** | A timer/progress completion event may not create output by itself; only a successful authoritative transaction commit may change stock/state. | FND-05 §4 | Design | LFE job/transaction core |
| **REQ-ID-028** | Recipe identities must use stable qualified namespaces/lifecycle states and explicit pack ownership; deprecated/tombstoned/archived recipes must preserve migration integrity without becoming new production outputs. | FND-05 §5 | Design | LFE registry/migration |
| **REQ-AUT-004** | Concrete recipes require a universal schema spanning identity, typed inputs/outputs, process, authority, failure, unlock, presentation, persistence/LOD and validation. | FND-05 §7 | Design | LFE recipe registry/FORGE-ENG |
| **REQ-AUT-005** | Recipe inputs/outputs must reference canonical Item IDs, Block projections/placed Blocks and other owned resource units directly; recipes may not create fake duplicate block-item identities. | FND-05 §8–9 | Design | LFE transformation core |
| **REQ-AUT-006** | Material/provider substitution is allowed only through explicit typed groups/family rules with compatibility predicates; unrestricted `any_material`/`any_ingot`/`any food` matching is prohibited where physical/social distinctions matter. | FND-05 §10 | Design | LFE capability/recipe validation |
| **REQ-AUT-007** | Non-trivial transformations must use explicit resolve → authority/permission → exact input resolution → validation → reservation → work → revalidation → atomic commit → state/provenance transfer → reservation release → journal/evidence semantics. | FND-05 §11 | Design | LFE transaction kernel |
| **REQ-AUT-008** | Failed commits must leave authoritative stock unchanged or execute an explicit recovery transaction; partial best-effort duplication/loss is prohibited. | FND-05 §11, §19 | Design + Engineering | PRD-06/07, LFE transactions |
| **REQ-AUT-009** | Quality, condition, purity, freshness, contamination, charge, unique identity, provenance and ownership may transfer/recompute only according to declared semantic rules; they may not be copied/erased for convenience. | FND-05 §12 | Design | LFE state-transfer contracts |
| **REQ-AUT-010** | By-products/waste/emissions are first-class declared outputs/sinks and may not silently disappear merely to simplify queues. | FND-05 §13 | Design | LFE recipes/environment interfaces |
| **REQ-AUT-011** | Recipes reference stations/tools/worksites/services/environmental conditions rather than redefining those definitions or owning their runtime simulation. | FND-05 §14 | Design/governance | PRD-04, LFE interfaces |
| **REQ-AUT-012** | Batching, queues and time progression may affect throughput but not conservation; jobs may not overbook capacity, time skips may not double-complete, blocked outputs may not delete goods, and unload/pause must preserve progress. | FND-05 §15 | Design + Engineering | PRD-06/07, LFE scheduler/jobs |
| **REQ-AUT-013** | Recipes declare energy/power/mana requirements while the owning network systems resolve actual supply; recipe data may not simulate the network independently. | FND-05 §16 | Design/governance | LFE automation/magic interface |
| **REQ-PROG-019** | Knowledge/unlock/permission and physical execution capability must remain distinct: owning a station does not automatically teach every recipe it can execute. | FND-05 §17 | Design | LFE knowledge/recipe eligibility |
| **REQ-AUT-014** | Ordinary crafting may not erase ownership/provenance of stolen/claimed goods; laundering requires an explicit owning-system rule. | FND-05 §18 | Design | LFE provenance/economy/social interface |
| **REQ-AUT-015** | Every interruptible process must define pause/reservation/cancellation/irreversible-state/recovery/hazard/save-reconstruction behaviour. | FND-05 §19 | Design + Engineering | LFE persistent jobs |
| **REQ-AUT-016** | Player, NPC/service and machine execution of equivalent transformations must share the same net conservation semantics. | FND-05 §1; §36–37 | Design | LFE transactions/simulation |
| **REQ-MP-005** | Recipe starts/reservations/cancellations/commits in multiplayer must be authoritative; stock/capacity cannot be double-reserved, duplicate client requests must be idempotent/rejected, and disconnect/reconnect must preserve jobs/reservations. | FND-05 §38 | Design + Engineering | LFE multiplayer/jobs |
| **REQ-PST-009** | Persistent jobs must store enough stable context to recover safely, including recipe/version, work target, exact reservations, progress, ownership/contributor context, power/process state as needed, output destination, interruption/migration state and idempotency/transaction identity. | FND-05 §39 | Design + Engineering | LFE persistence/jobs |
| **REQ-SIM-008** | Near and far recipe/production simulation must yield the same net material transformation; unsafe-to-abstract jobs must pause or use an owner-approved summary rather than approximate impossible work. | FND-05 §39 | Design + Engineering | LFE simulation LOD |
| **REQ-PST-010** | Missing optional recipe dependencies must pause/quarantine safely, preserve reserved goods and existing outputs, use compatible aliases/migrations only, and never destroy inventories or duplicate refunds. | FND-05 §40 | Design + Engineering | LFE packages/migration |
| **REQ-DEV-010** | Recipe release validation must block identity/reference errors, duplicate Block/Item outputs, conservation/reservation defects, lost state transfer, unreachable core chains, project-without-material progress, local/far divergence, persistence duplication, multiplayer overspend and missing-pack corruption. | FND-05 §42 | Evidence requirement | PRD-06/07/08 |

## 9.5 Resource, material ecology and capability-path requirements — Document 06

| ID | Requirement | Source | Decision class | Downstream |
|---|---|---|---|---|
| **REQ-ID-029** | A Resource family is a progression/ecology/provider concept and must not create a duplicate physical Block/Item identity; world and carried forms resolve through their owning registries. | FND-06 §1, §3 | Design | FCC-12/13; LFE registry interfaces |
| **REQ-GOV-008** | Resource fields must have one owner; Document 06 may own resource/progression/provider truth but must not duplicate world distribution, Block/Item identity, recipe transforms, current prices or live stock. | FND-06 §1.2, §3–4 | Design/governance | PRD-04 |
| **REQ-ID-030** | Resource identities must use governed qualified IDs, aliases and lifecycle status independent from legacy POC planning labels. | FND-06 §5 | Design | FCC-12/13, LFE migration |
| **REQ-WGEN-008** | Resource generation must be deterministic/suitability-driven and allow local absence where valid alternative providers preserve required capability; supported world profiles require explicit seed reachability proof. | FND-06 §7–8 | Design + Engineering | LFE worldgen validation |
| **REQ-WGEN-009** | Resource occurrence must distinguish geological/ecological suitability from actual current availability: sources may be claimed, depleted, diseased, protected, unknown or inaccessible without changing the underlying resource definition. | FND-06 §7–9 | Design | LFE world/resource state |
| **REQ-ID-031** | Grade, purity, quality, condition, scarcity and provenance must remain distinct data dimensions with governed ownership/transfer semantics rather than a single generic “quality” value. | FND-06 §10 | Design | LFE item/resource state |
| **REQ-ECO-001** | Renewable/finite resource systems must support depletion/regeneration/carrying-capacity semantics where relevant; worldgen updates may not silently refill explored finite deposits. | FND-06 §11 | Design | LFE ecology/resource persistence |
| **REQ-PROG-020** | Resource progression must be represented as capability bands/provider paths rather than a single universal material ladder; material anchors may guide readability without becoming absolute one-item gates. | FND-06 §12 | Design | LFE capability graph |
| **REQ-PROG-021** | A supported world/package profile must provide at least one valid provider path per required capability, including multiple possible provider families for key capabilities where the source explicitly requires resilience. | FND-06 §8, §12 | Design + Engineering | PRD-06/07, LFE validation |
| **REQ-AUT-017** | Resource substitution must be capability-typed and require valid physical/social compatibility; decorative renaming is not an equivalent provider. | FND-06 §13 | Design | LFE resource/recipe validation |
| **REQ-CIV-007** | Sapient/person-like beings may not be declared generic resource providers by the resource system; creature eligibility/personhood/welfare/legal harvest must come from owning creature/social/law systems. | FND-06 §20 | Design/personhood | Later creature/social extraction |
| **REQ-REALM-001** | Realm resources must support explicit stabilisation/export behaviour where required and should have lasting Overworld/cross-realm roles rather than existing solely as higher-stat replacement ores. | FND-06 §22 | Design | FCC extraction; LFE resource state |
| **REQ-AUT-018** | Automation may increase labour efficiency/throughput/scheduling/transport/scale but may not generate matter without a declared producer or explicit magic/realm rule. | FND-06 §11, §24, §38 | Design | LFE automation/conservation |
| **REQ-SET-008** | Settlement/public-work resource demand must consume actual available/reserved stock rather than virtual production-graph output. | FND-06 §25, §32–33 | Design | LFE settlement/warehouse transactions |
| **REQ-ECON-002** | Scarcity, provenance, renewability, strategic role, producer region, legality, cargo class and substitute capability may feed economy, but Resource definitions must not store authoritative current prices. | FND-06 §26 | Design/governance | Set 27 extraction |
| **REQ-AUT-019** | All player/NPC/machine and near/far resource transformations must ultimately use the authoritative transformation/reservation model owned by Document 05 or an equivalent explicit owner. | FND-06 §30, §33 | Design | LFE transaction/simulation |
| **REQ-PST-011** | Live stock quantities must exist only in authoritative world/inventory/storage/aggregate records, never in immutable Resource family definitions. | FND-06 §32 | Design | LFE world/inventory data |
| **REQ-PST-012** | Resource stock, reservations, irreversible depletion, required realm/stabilisation state and governed provenance must survive near/far transitions and save/migration; promoted local state reconciles from aggregates before interaction resumes. | FND-06 §33 | Design + Engineering | LFE persistence/simulation |
| **REQ-UX-006** | Resource/prospecting UI must distinguish **unknown** from **absent** and communicate restrictions/hazards/grade/provenance/depletion/substitution through non-colour-dependent cues where relevant. | FND-06 §34 | Design | LFE/UI accessibility |
| **REQ-DEV-011** | Resource validation/seed QA must block unreachable required capability paths, invalid/unrestricted substitutions, provenance loss, ownership/conservation violations, optional-maritime hard dependencies and resource-owned dynamic price truth. | FND-06 §36 | Evidence requirement | PRD-06/07/08 |
| **REQ-AUT-020** | Salvage/recycling/renewable production must remain bounded by conserved source content or explicit declared magic/world rules; renewables require non-zero ecological rates/carrying capacity rather than zero-input matter creation. | FND-06 §38 | Design | LFE resource/recipe/ecology |
| **REQ-PERF-008** | Resource simulation at distance may aggregate provenance only according to its profile and must preserve exact/net quantities/reservations/depletion required by the owning systems. | FND-06 §33 | Design + Engineering | LFE simulation/performance |

---

# 10. Round-2 New Unknowns / Evidence Gaps

| Unknown ID | Question | Route |
|---|---|---|
| **UNK-ID-002** | What machine-readable canonical registry format/schema compiler will implement Block/Item/Resource/Recipe separation without editable mirrors? | PRD-03/04 → LFE/FORGE-ENG |
| **UNK-ID-003** | What compact runtime-ID/palette binding strategy will map stable qualified IDs into performant voxel/inventory/runtime representations while remaining migration-safe? | PRD-02/03/04/06/07 |
| **UNK-ID-004** | What exact state/payload limits determine compact Block cell state versus Block Entity versus packed portable payload? | Engineering → PRD-02/03/06/07 |
| **UNK-ID-005** | What semantic hashing/revision/versioning mechanism will allow deterministic compiled registries and compatibility checks across saves/content packs/servers? | PRD-03/04/06 |
| **UNK-PST-002** | What transaction/journal/idempotency architecture can atomically conserve Blocks, Items, containers, projects, machines and distant summaries under crashes? | PRD-03/04/06/07/08 |
| **UNK-PST-003** | What quarantine/missing-definition representation and rehydration rules will safely preserve removed optional content without allowing invalid execution? | PRD-03/04/06/07 |
| **UNK-AUT-002** | What reservation granularity/locking strategy prevents double-spend across inventories, warehouses, projects, machines, NPC work, contracts and multiplayer without excessive contention? | PRD-03/04/06/07 |
| **UNK-AUT-003** | How will persistent recipe/project jobs be scheduled and recovered across chunk unload, simulation LOD and server restart while retaining exact reservations? | PRD-04/06/07 |
| **UNK-AUT-004** | What graph/network architecture lets power/logistics supply recipe requirements while preserving system ownership and bounded recomputation? | Foundation 08 + PRD-03/06/07 |
| **UNK-PROG-001** | What exact capability-provider graph representation supports hard/soft/discovery gates, alternate providers, explainable blockers and seed reachability validation? | PRD-04/06/07 |
| **UNK-PROG-002** | What authoritative event/contribution model awards XP/skill progression exactly once across player, NPC-assisted and shared-world activity? | PRD-04/06/07 |
| **UNK-WGEN-003** | What seed corpus size/profiles and automated solver/validator are sufficient to prove capability reachability across content-pack combinations? | PRD-06/07 |
| **UNK-PERF-002** | What maximum registry sizes/state densities/Block Entity counts/stack-instance counts are acceptable per hardware profile? | PRD-06/07 |
| **UNK-FORGE-003** | How will Forge authoring validate collision/shape/state/service contracts without turning visual source into a competing gameplay source? | PRD-03/04/07 → FORGE-ENG |

---

# 11. Round-2 Coverage Result

Foundation 02–06 materially strengthens the rebuild constraints around **identity and conservation**:

- progression cannot bypass world truth;
- capability/provider graphs replace one rigid material/level ladder;
- Blocks, Items, Resource families, recipes and runtime instances are different kinds of identity/state;
- one recover-as-self placeable uses one canonical Block definition rather than duplicate Block+Item records;
- qualified IDs, aliases, tombstones and migration are mandatory;
- generated runtime records are replaceable products, not editable truth;
- stock, reservations and transformations are authoritative runtime state;
- recipes are transactions, not timers;
- manual/NPC/machine/near/far execution must conserve the same net material truth;
- state/provenance/ownership cannot disappear through stacking, crafting, automation or migration;
- optional content removal requires quarantine/recovery rather than deletion;
- seed reachability and registry/conservation correctness require automated release-blocking validation.

**Next extraction source family:** Foundation 07–10 — persistent people/settlements, automation, magic and creature/ecology runtime.

---

# 12. Round 3 — Foundation 07–10 Requirements

**Sources consumed:** `SRC-FND-07` through `SRC-FND-10`.

Round 3 adds the production contracts for persistent people and settlement operations, automation/industry/logistics, practical magic/mana infrastructure, and creature/ecology runtime. These four sources are especially important because they all require **persistent identity, specialist ownership, intent-versus-execution separation, bounded simulation LOD, save-safe promotion/demotion and reason-coded diagnostics**.

## 12.1 Persistent people and settlement-operation requirements — Document 07

| ID | Requirement | Source | Decision class | Downstream |
|---|---|---|---|---|
| **REQ-CIV-008** | A persistent ordinary NPC must exist as **one person truth**. Scene actors, visuals, dialogue sessions, social records, biological records, economic contracts and movement state are linked representations around one stable person identity and may not create duplicate people. | FND-07 §§1,4 | Design | LFE entity/person architecture |
| **REQ-CIV-009** | Persistent person identity/state must be stored independently from temporary Godot scene-node existence so despawn, streaming, save/load, LOD, appearance revision and migration do not change who the person is. | FND-07 §§1.3,4,54 | Design + Engineering | PRD-03/04/06/07; LFE entities/persistence |
| **REQ-CIV-010** | The person model must support arbitrary generated settlements and civilisation contexts rather than a hard-coded Forest Hamlet roster or fixed job list. | FND-07 Purpose, §3, §52.1 | Design | LFE generation/civilisation runtime |
| **REQ-CIV-011** | Persistent person records must be capable of referencing lifecycle, settlement, household, residence/bed, job/workplace, schedule, inventory/equipment, skills/knowledge, biological/social/economic/movement links, quest/event participation, history, provenance and revisions without duplicating those specialist owners. | FND-07 §4.1 | Design | LFE person schema/interfaces |
| **REQ-CIV-012** | Reusable NPC definitions/generation profiles must remain distinct from mutable runtime people; job, home, allegiance, equipment, relationships, injuries and life-history changes modify the person record/state rather than the immutable source definition. | FND-07 §4.2 | Design | LFE registry/entity model |
| **REQ-CIV-013** | Established settlement residents must normally retain persistent identity, while routine background population may use compact/aggregate representation only where promotion rules preserve consequential truth. | FND-07 §§5,39–40 | Design + Engineering | LFE civilisation LOD |
| **REQ-CIV-014** | Household membership, residence assignment, dependent/care context and private-storage rights must remain coherent and persist through relocation, displacement, migration and save/load; household members may not be silently orphaned or duplicated. | FND-07 §51.2 | Design | LFE households/persistence |
| **REQ-CIV-015** | Ordinary jobs must resolve against real active workplaces/services, tools, stock, schedule, route availability, biological availability, permissions/contracts where required, and authoritative transaction outcomes; a job label alone cannot create production. | FND-07 §51.3 | Design | LFE jobs/tasks/interfaces |
| **REQ-CIV-016** | Document-07 task selection owns **intent**, not physical movement. NPC destination/task intent must be handed to Set-30/Set-26 movement providers and consequential work may not assume arrival until authoritative movement evidence confirms it. | FND-07 statement; §§2,56 | Design/governance | PRD-04; LFE task/movement interface |
| **REQ-CIV-017** | Routine NPC autonomy must support bounded scheduling/task selection for work, home, rest, hauling, construction, maintenance and emergency behaviour without requiring player micromanagement of every person. | FND-07 Purpose, §§1,54 | Design + Engineering | LFE task scheduler |
| **REQ-CIV-018** | Personal/settlement work inventories and reservations must use authoritative inventory/transaction services; NPC simulation may not create, consume or move important stock solely through abstract counters. | FND-07 §§1,51.3,54 | Design | LFE inventory/transaction interface |
| **REQ-CIV-019** | Construction and repair labour must operate on real projects/work packages and authoritative resources; worker participation cannot advance a project when required stock, route, tool, permission, service or authoritative project state is invalid. | FND-07 §§1,52.4,56 | Design | LFE settlement/project labour |
| **REQ-CIV-020** | Migration execution must preserve person, household, inventory, obligations and history and must not create duplicate residents or silently discard dependants/commitments. | FND-07 §§1,40–42,51 | Design + Engineering | LFE migration/persistence |
| **REQ-CIV-021** | Conquest/occupation/settlement ownership change must operate on the existing persistent population and actual outcomes; it may not reset a settlement by despawning residents and spawning generic replacement inhabitants. | FND-07 §38.1 | Design | LFE settlement/faction handoff |
| **REQ-CIV-022** | Death, departure, migration and other lifecycle changes must be authoritative; dead/departed people cannot continue active work and a person cannot hold contradictory existence states across systems. | FND-07 §51.1 | Design | LFE lifecycle invariants |
| **REQ-CIV-023** | Named/protected/otherwise consequential people must remain individually traceable through distant simulation even where routine population operations are batched. | FND-07 §39 | Design | LFE civilisation LOD |
| **REQ-CIV-024** | Promotion/demotion between person representation levels must preserve stable identity plus household/home/job/schedule, current intent/journey, inventory/equipment, reservations, specialist links/revisions, obligations, event participation, history and unresolved blockers. | FND-07 §40 | Design + Engineering | PRD-06/07; LFE LOD transitions |
| **REQ-CIV-025** | If authoritative external-domain revisions have not reconciled after loading/promotion, a person may remain temporarily unavailable for consequential interaction rather than expose half-loaded contradictory truth. | FND-07 §40.1 | Design + Engineering | LFE reconciliation barriers |
| **REQ-CIV-026** | Long-absence settlement catch-up must be bounded and deterministic, operate from elapsed world time and authoritative domain inputs, and route each external consequence through its owner. | FND-07 §41 | Design + Engineering | LFE catch-up/scheduler |
| **REQ-CIV-027** | Distant catch-up may not invent deaths, migrations, marriages/household changes, construction, items, debts, injuries or relationship changes without a valid causal event/owner commit. | FND-07 §41.1 | Design | LFE catch-up invariants |
| **REQ-CIV-028** | World time, schedules, journeys, migration, construction labour and incident history must reference the authoritative world timeline/evidence system rather than per-actor drifting clocks. | FND-07 §42 | Design | LFE time/event architecture |
| **REQ-CIV-029** | Settlement-operation diagnostics must expose stable reason families for invalid identity, household/home/job/workplace/schedule/task, stock/reservation, biology/social/economy/movement/service/project blockers, migration, LOD, save/migration and unauthorised mutation. | FND-07 §50 | Evidence/design | LFE diagnostics/UX |
| **REQ-CIV-030** | Production validation must prove person, household and work invariants and run the same settlement period across loaded/reduced/distant/dormant modes to check approved LOD equivalence while preserving protected identity, stock and history. | FND-07 §§51–52 | Evidence requirement | PRD-06/07/08 |
| **REQ-SIM-009** | Document-07 simulation must support multiple person/settlement representation levels from active individual through local reduced, settlement summary, regional abstract and dormant/scheduled catch-up. | FND-07 §39 | Design + Engineering | LFE simulation |
| **REQ-SIM-010** | Changing person/settlement LOD may alter update cadence, animation and batching but may not change ownership, existence/death, route validity, paid contracts, injuries, consumed stock, completed projects or committed social outcomes. | FND-07 §39.1 | Design | LFE simulation invariants |
| **REQ-PERF-009** | Low-end profiles may reduce instantiated actor count, animation/path cadence, ambient social events and background granularity but must preserve persistent people, inventory, deaths, migration, contracts, jobs, construction progress, settlements and committed history. | FND-07 §53.2 | Design + Engineering | PRD-06/07; LFE scalability |
| **REQ-MP-006** | NPC/settlement mutation commands and consequential commitments must remain host/server authoritative in shared worlds, including person identity, work, inventory/reservation and LOD reconciliation. | FND-07 §§50–54 | Compatibility/design | LFE multiplayer authority |
| **REQ-DEV-012** | The historical Forest Hamlet remains available as an isolated regression fixture for persistent identity, households, jobs, schedules, inventories, storage, construction labour, automation delivery, emergency response, injury/death, repair, save/load and promotion/demotion, but it is not a production generation template. | FND-07 §55 | Evidence/process | PRD-05/06/07/08 |

## 12.2 Automation, industry, logistics and network-control requirements — Document 08

| ID | Requirement | Source | Decision class | Downstream |
|---|---|---|---|---|
| **REQ-AUT-021** | Automation behaviour definitions, canonical physical Blocks/Items, runtime machine instances, network elements and editable/presentation assets must remain separate records with one owner each. | FND-08 §§1–3 | Design/governance | PRD-04; LFE/FORGE-ENG |
| **REQ-AUT-022** | A recover-as-self machine/logistics component uses the canonical Block identity plus its automation behaviour/runtime state; Document 08 may not create a duplicate carried Item identity. | FND-08 statement, §§1,60.4 | Design | FCC-13; LFE registry |
| **REQ-AUT-023** | Automation networks must be explicit typed graphs with stable element identity and declared ports/edges carrying type, direction, capacity, filters/compatibility, ownership/permission, condition and relevant failure state. | FND-08 §§1,5–7,51 | Design | LFE graph/network architecture |
| **REQ-AUT-024** | Conversion between network/energy/resource types requires an explicit compatible converter/process with bounded capacity, efficiency/loss/by-products and risk rather than silent type coercion. | FND-08 §§5–7 | Design | LFE networks/recipes |
| **REQ-AUT-025** | Fixed logistics transfers must carry authoritative source/destination inventory, canonical identity, quantity, custody/ownership, reservation, path/capacity, status and transaction/evidence identity. | FND-08 §10.1 | Design | LFE logistics transactions |
| **REQ-AUT-026** | Nearby belt/chute/pipe/item visuals are projections of authoritative transfer state; deleting, hiding, pooling or failing to render the visual must not create or destroy stock. | FND-08 §10.2 | Design | LFE presentation/state separation |
| **REQ-AUT-027** | Fixed logistics must implement backpressure/blocked-output semantics: stock remains in source/buffer, machine pauses, permitted reroute occurs or explicit overflow handling commits; unavailable destination capacity may not delete stock. | FND-08 §10.3 | Design | LFE logistics/fault handling |
| **REQ-AUT-028** | Persistent machine work-in-progress must preserve recipe/task refs, machine ref, reserved/committed inputs, energy/fuel state, elapsed/process state, destination/by-products, interruption reason and save/schema version as needed for exact reconstruction. | FND-08 §8.2 | Design | LFE machine jobs/persistence |
| **REQ-AUT-029** | Automated extraction may operate only against an authoritative resource/provider with validated access, compatibility, claim/permission, quantity/regeneration, power, output capacity, maintenance/hazard and transaction state. | FND-08 §9 | Design | LFE extraction/resource interface |
| **REQ-AUT-030** | When automated extraction changes voxel terrain, the authoritative voxel/world delta must commit the actual Block change; automation may not decrement an abstract ore counter while contradictory extractable ore remains physically present unless the provider explicitly uses non-voxel extraction. | FND-08 §9.2 | Design | PRD-02/04; LFE voxel/automation interface |
| **REQ-AUT-031** | Mobile freight movement is externally owned: Document 08 may reserve/load/stage/dispatch/unload and consume arrival evidence, while Set 30/Set 26 own the moving vehicle/vessel route, position, travel and movement faults. | FND-08 §§11,30–35 | Design/governance | PRD-04; LFE transport handoff |
| **REQ-AUT-032** | Automation power must be authoritative and resource/capacity constrained; animation or theoretical connected capacity may not create usable power. | FND-08 §§1,6,7 | Design | LFE power solver |
| **REQ-AUT-033** | Machine operation must require a valid definition/physical reference, compatible ports/network/power, approved recipe/task, inputs/output capacity, permissions, safety/clearance and required operator/maintenance state; failures must block rather than silently bypass prerequisites. | FND-08 §§1,8,27–28,51 | Design | LFE machine state machine |
| **REQ-AUT-034** | Automation control must support explicit sensors, filters, priorities, routing policies, control signals and bounded configuration under ownership/permission; unrestricted player configuration cannot bypass safety or authoritative system rules. | FND-08 §§1,5–7,25 | Design | LFE control/network model |
| **REQ-AUT-035** | Automation must preserve meaningful labour by shifting work toward setup, routing, engineering, operation, maintenance, inspection, logistics/safety and specialist roles rather than replacing persistent worker identity with hidden production bonuses. | FND-08 §22 | Design | LFE jobs/automation integration |
| **REQ-AUT-036** | Construct/golem automation integration must reference one authoritative entity and inventory; the same worker may not simultaneously exist as an automation counter, creature/entity instance and persistent entity with independent stock. | FND-08 §23 | Design | LFE entity/automation interface |
| **REQ-AUT-037** | Economic systems may consume committed physical output/delivery evidence, but theoretical capacity is not stock and contract deadlines may not permit teleport fulfilment. | FND-08 §24 | Design | Set-27 interface/LFE evidence |
| **REQ-AUT-038** | Settlement/faction/private machine configuration requires the relevant ownership/permission result; automation may consume Set-28 willingness/permission but may not calculate Trust or social relationship truth. | FND-08 §25 | Design/governance | LFE permission/social interface |
| **REQ-AUT-039** | Automation hazards such as heat, smoke, dust, contamination, pressure, fire or magical leaks must emit typed source/exposure/environment evidence; Document 08 may not directly mutate Health, creature biology or externally owned environmental truth. | FND-08 §26 | Design | LFE hazard/event interface |
| **REQ-AUT-040** | Machine maintenance must use declared real inputs, tools, labour/time and safe access/isolation requirements; maintenance and wear/fault state must persist where required. | FND-08 §27 | Design | LFE machine maintenance |
| **REQ-AUT-041** | Routine machine faults must fail safely/readably where practical, preserving stock and exposing what failed, why, affected state, safety, recovery action and owning blocker; catastrophic outcomes require explicit dangerous conditions/events/settings. | FND-08 §28 | Design + UX | LFE faults/diagnostics |
| **REQ-AUT-042** | Authoritative damage/sabotage may degrade capability, disconnect ports, leak explicit process state, shut down/isolate networks and require repair, but damage handling must preserve/resolve stock through owned transactions rather than silently deleting it. | FND-08 §29 | Design | LFE damage/automation interface |
| **REQ-AUT-043** | Port/maritime automation may operate fixed pumps, winches, cranes, loaders, cargo networks, processing/preservation and onboard machinery, but vessel identity, buoyancy/stability, propulsion/steering, voyage and physical movement remain Set-26 truth. | FND-08 §§30–31 | Design/governance | Set-26 extraction; LFE maritime handoff |
| **REQ-AUT-044** | Shipyard automation may supply machines/logistics/material reservations and labour interfaces but cannot commission/repair/refit a vessel merely because an automation progress counter reaches completion; the vessel-construction owner must validate/commit the outcome. | FND-08 §31 | Design | Set-26H/LFE project interface |
| **REQ-AUT-045** | Aquaculture/fishing automation may process/feed/pump/store/monitor, but cannot create marine abundance; production remains constrained by authoritative stock, feed, water, labour, environment, time and ecology/health state. | FND-08 §32 | Design | Set-26M/ECO interface |
| **REQ-AUT-046** | Project- or contract-reserved stock cannot be consumed by ordinary automation unless the owning reserve is explicitly released/reallocated with recorded authority/evidence. | FND-08 §§24,37 | Design | LFE reservation kernel |
| **REQ-AUT-047** | Blueprint/structure presentation may expose semantic automation ports/zones/sockets, but appearance alone cannot create a functional input/output/power/control/fluid/maintenance/cargo capability. | FND-08 §§38–39 | Design/governance | FORGE-ENG/LFE validation |
| **REQ-AUT-048** | Automation LOD must support detailed through dormant/scheduled representations while preserving exact conserved stock, protected reservations/commitments, important faults/damage and impossible dependencies. | FND-08 §§44–46 | Design + Engineering | LFE automation LOD |
| **REQ-AUT-049** | Distant automation catch-up must stop/branch at the first invalid dependency such as empty inputs, no fuel/power, broken machine, blocked output, invalid recipe, unavailable transport, missing required vessel/operator or custody/contract blocker. | FND-08 §45 | Design + Engineering | LFE catch-up |
| **REQ-AUT-050** | Automation promotion/demotion must preserve machine/network IDs, inventories/in-flight fixed transfers, reservations, power/control state, work-in-progress, maintenance/faults, external movement/mana references and audit revisions. | FND-08 §46 | Design + Engineering | LFE LOD transitions |
| **REQ-MP-007** | Host/server authority must own consequential automation topology/configuration, transfers, production commits, power/reservations, maintenance and dispatch; repeated network commands require idempotent IDs/revisions so duplicate messages cannot duplicate goods. | FND-08 §47 | Design/security | LFE multiplayer/transactions |
| **REQ-PST-013** | Automation saves must persist stable definition refs, machine instances, topology/ports/configuration, authoritative inventories/transfers/reservations, work-in-progress, reconstructable power/control state, maintenance/faults, external dispatch refs, transaction evidence, LOD and schema revisions independent of scene nodes. | FND-08 §48 | Design | LFE persistence |
| **REQ-PST-014** | Automation migration must explicitly handle legacy POC/machine IDs, duplicate machine Item mirrors, reassigned rail/elevator/mobile movement ownership, old mana/portal ownership, endpoint/port/power schemas and persisted work records rather than silently carrying contradictory fields forward. | FND-08 §49 | Design + Engineering | LFE migration |
| **REQ-DEV-013** | Automation release validation must include definition/network validity, cross-chunk topology, conservation across all LOD, cross-owner mutation checks, stable diagnostics and hostile laboratories for fixed logistics, machine work, power/faults, LOD/catch-up and external movement handoff. | FND-08 §§50–52 | Evidence requirement | PRD-06/07/08 |

## 12.3 Magic, mana, runes, rituals and civilisation-magic requirements — Document 09

| ID | Requirement | Source | Decision class | Downstream |
|---|---|---|---|---|
| **REQ-MAG-001** | Magic must be represented as persistent, resource-aware gameplay capability/infrastructure rather than a detached spell/VFX layer; costs, authority, interruption/counterplay and world consequences must be inspectable where relevant. | FND-09 statement, §§1–4 | Design | LFE magic architecture |
| **REQ-MAG-002** | Magic schools/domains/traditions must support tagged/compound behaviour without duplicating underlying physics; cultural/divine/necromancy/golemancy/etc. interpretations may compose approved schools/tags instead of forcing duplicate universal systems. | FND-09 §5 | Design | LFE magic registry/FCC |
| **REQ-MAG-003** | Personal mana and external civilisation-scale mana are distinct authoritative resources; personal mana may not silently satisfy external infrastructure demand. | FND-09 statements, §§6–7 | Design | LFE mana architecture |
| **REQ-MAG-004** | Personal mana must persist and remain distinct from Set-29 Stamina/Fatigue; biological consequences of casting are requested from Set 29 rather than stored as duplicate biological bars. | FND-09 §6 | Design | LFE magic/biology interface |
| **REQ-MAG-005** | External mana providers/networks must expose authoritative amount/capacity, rates, purity/stability/compatibility, ownership/permissions, topology/context, damage/corruption/maintenance and revision as required by the provider type. | FND-09 §7 | Design | LFE mana graph/state |
| **REQ-MAG-006** | External mana transfers must conserve finite mana through authoritative reservation/commit semantics and may not create charge because consumers/providers are off-screen or represented at lower LOD. | FND-09 §7.2; App. K | Design + Engineering | PRD-06/07; LFE mana transactions |
| **REQ-MAG-007** | Magical definitions, knowledge/unlocks, provider capability, cost, intent, validation, commit, cross-owner effect request, evidence and persistent aftermath must remain explicit stages rather than one monolithic spell script. | FND-09 §4 | Design | LFE command/effect architecture |
| **REQ-MAG-008** | Spell/ritual effects may not directly write another domain's authoritative state. Healing routes to Set 29; physical movement to Set 30/26; social knowledge/belief to Set 28; economic value to Set 27; combat resolution to Document 16; realm/portal destination truth to Document 14/FCC. | FND-09 statements; §§18,40–44; App. J/K | Design/governance | PRD-04; LFE typed effect requests |
| **REQ-MAG-009** | Casting must validate caster/knowledge, target/target class, range/line/context, permission/law where applicable, resource costs, cooldown/strain/focus, environmental/realm constraints and owning-domain compatibility before commit. | FND-09 canonical architecture; App. K | Design | LFE casting validator |
| **REQ-MAG-010** | Resource costs for spells/runes/rituals/enchantments/alchemy must be authoritative and committed exactly once; visuals or cooldown completion may not create free effects/resources. | FND-09 §§6–7,20–23; App. K | Design | LFE transactions/magic |
| **REQ-MAG-011** | Magical Blocks/devices that recover as themselves follow the universal single-Block identity rule; magic behaviour references the canonical physical definition rather than creating duplicate Item identities. | FND-09 statement; App. K | Design | FCC-13; LFE registry |
| **REQ-MAG-012** | Runes must be declarative validated magical logic attached to compatible substrates/targets with knowledge, materials/mana, layout/orientation/permission constraints where relevant; runes may not become unrestricted arbitrary scripting. | FND-09 §20 | Design/security | LFE rune engine/FORGE-ENG |
| **REQ-MAG-013** | Rune state/inscriptions must persist through save/load, migration and applicable object/state changes without becoming a duplicate physical Item/Block owner. | FND-09 §20; App. K | Design | LFE persistence/item integration |
| **REQ-MAG-014** | Enchantments are persistent magic records attached to valid physical Items/objects; the Item owner retains physical identity while magic owns enchantment effect/state and migration must preserve it. | FND-09 §21; App. K | Design | LFE item/magic interface |
| **REQ-MAG-015** | Alchemy/transmutation must use Document-05 authoritative transformation transactions and declared compatibility/cost rules; magic may not create unlimited high-value outputs from arbitrary low-value inputs. | FND-09 §22; App. K | Design | LFE recipe/magic interface |
| **REQ-MAG-016** | Rituals must support persistent multi-stage plans with site/layout, components/reservations, participants/roles, mana, timing/environment/law conditions, staged commits, stability/interruption, cross-owner effects and aftermath. | FND-09 §23 | Design | LFE ritual jobs/persistence |
| **REQ-MAG-017** | Interrupted rituals must have explicit safe/readable interruption, recovery/failure and already-committed-cost semantics; serious catastrophic outcomes require authored dangerous conditions rather than arbitrary failure rolls. | FND-09 §23.2 | Design | LFE ritual failure handling |
| **REQ-MAG-018** | Summoned/constructed/bound entities must retain one authoritative entity and inventory/cargo identity; summoning capability/binding state cannot create duplicate creature/person/automation copies. | FND-09 §§24–25 | Design | LFE entity/magic/automation interface |
| **REQ-MAG-019** | Golemancy remains a compound integration across magic, automation and entity/movement systems; Document 09 owns magical binding/mana, Document 08 owns compatible work queues/interfaces, and movement/entity owners retain their state. | FND-09 §25 | Design/governance | LFE subsystem interfaces |
| **REQ-MAG-020** | Mana networks are Document-09-owned typed magical-energy infrastructure; automation may consume their provider/capability snapshots but may not maintain a second independent mana truth. | FND-09 §26; App. K | Design/governance | LFE mana/automation interface |
| **REQ-MAG-021** | Wards must be persistent authoritative systems whose validated anchor/topology, mana demand, ownership/permission, compatibility, maintenance/stability and coverage/breach state determine protection; visible radius/VFX alone cannot grant coverage. | FND-09 §19 | Design | LFE wards/spatial coverage |
| **REQ-MAG-022** | Ward coverage state must persist and remain reconstructable across LOD/save/load with real mana demand and damage/breach consequences. | FND-09 §19; App. K | Design + Engineering | LFE persistence/LOD |
| **REQ-MAG-023** | Portal/space-magic activation must preserve authorised origin/destination/realm compatibility, costs, safety/stability and handoff to the movement/realm owner; magic cannot grant automatic teleport authority. | FND-09 §§1, portal sections; App. J/K | Design | FCC/LFE realm-transition interface |
| **REQ-MAG-024** | Magical corruption/forbidden-practice and cleansing consequences must leave persistent evidence; biological symptoms, terrain/environment changes and social/political interpretation remain owned by their specialist systems. | FND-09 §§38–39 | Design | LFE magic/world evidence |
| **REQ-MAG-025** | Maritime magic may provide navigation/weather sensing, protection, rescue, pumping/propulsion assistance, preservation, wards and realm-travel capability without invalidating ordinary seamanship; Set 26 owns vessel physics/movement outcomes. | FND-09 §40 | Design | Set-26/LFE interface |
| **REQ-MAG-026** | Weather/environment magic must use bounded typed effect requests to the owning environment/weather system and may not directly overwrite baseline terrestrial or marine weather fields. | FND-09 §41 | Design | LFE environment interface |
| **REQ-MAG-027** | Magical healing/protection must submit typed treatment/capability requests carrying source, target, magnitude/duration, costs, knowledge, side effects/tags and revision/evidence; Set 29 validates and commits the biological result. | FND-09 §§18,42 | Design | Set-29/LFE treatment interface |
| **REQ-MAG-028** | Divination/telepathy/translation/charm-like capability must preserve information provenance and route belief, trust, consent and social interpretation through Set 28 rather than directly editing social state. | FND-09 §44; App. K | Design | Set-28/LFE information interface |
| **REQ-MAG-029** | Magic LOD/catch-up must preserve consequential personal/external mana, runes/enchantments, ritual stages/reservations, summons/bindings, ward coverage/demand, portal state, corruption/cleansing and committed magical history even if update/presentation cadence is reduced. | FND-09 App. K; system scope | Design + Engineering | LFE magic LOD |
| **REQ-MP-008** | Shared-world magic authority must prevent duplicate casts/resources and unauthorised magical mutation; consequential cast/ritual/network/portal commands require host/server validation and idempotent transaction/evidence semantics. | FND-09 App. K; system scope | Design/security | LFE multiplayer/magic |
| **REQ-PERF-010** | Low-end presentation/simulation settings may reduce magical VFX and non-authoritative cadence but may not alter mana truth, ward/ritual/portal outcomes or other authoritative magic state. | FND-09 App. K | Design + Engineering | PRD-06/07; LFE scalability |
| **REQ-DEV-014** | Magic production qualification must test stable-definition resolution, personal/external mana persistence/conservation, cross-owner effect routing, rune/enchantment migration, alchemy transactions, ritual interruption/save, summon identity, ward coverage/demand, portal authority, LOD, multiplayer duplication resistance, persistent corruption/cleansing and reason-coded diagnostics. | FND-09 App. K | Evidence requirement | PRD-06/07/08 |

## 12.4 Creature, wildlife and ecology-runtime requirements — Document 10

| ID | Requirement | Source | Decision class | Downstream |
|---|---|---|---|---|
| **REQ-ECO-002** | Authored creature-family identity/content must remain owned by Atlas 24F (or approved extensions), while Document 10 owns reusable runtime mechanics; the runtime must reference the family rather than maintain a second editable creature catalogue. | FND-10 §§1–3 | Design/governance | PRD-04; LFE ecology/registry |
| **REQ-ECO-003** | Being class, personhood, ecological role, gameplay role and threat/hostility must remain independent axes; hostility may not automatically route a recognised person into livestock/monster/harvest semantics. | FND-10 §§5–6 | Design | LFE entity/personhood routing |
| **REQ-ECO-004** | Recognised persons, disputed/emergent personhood and awakened/intelligent beings must route to appropriate person/social/law systems and cannot be automatically tameable, breedable livestock, animal property or harvest resources merely because their body is creature-like. | FND-10 §6; App. G | Design/governance | Set-28/13/LFE routing |
| **REQ-ECO-005** | Normal creature encounters must resolve from a valid persistent source such as a population, nest/territory, migration, dungeon ecology, event, summon/construct, captivity/trader stock or boss territory rather than invisible unrelated proximity spawning. | FND-10 statement; §§14–15 | Design | LFE encounter/ecology runtime |
| **REQ-ECO-006** | Ambient low-cost clues/representations may omit promoted actors only when they still resolve from underlying ecology/population truth. | FND-10 §14.1, §36 | Design + Performance | LFE ambient ecology |
| **REQ-ECO-007** | Creature encounter assembly must preserve a causal chain from region/habitat eligibility through source/activity/group/variant selection, actor promotion, movement/behaviour, encounter outcome and population/world aftermath. | FND-10 §15 | Design | LFE encounter pipeline |
| **REQ-ECO-008** | Predators/hostile-capable creatures may have non-aggressive activities and may not universally attack on sight; behaviour must depend on authored activity/motivation/context. | FND-10 §§15.1,32 | Design | LFE behaviour intent |
| **REQ-ECO-009** | Creature behaviour owns **intent** and may use authored family behaviour, activity, needs/pressure, territory/group/threat, biological state, senses, weather/season/time, training/owner/events and route results, while Set 30/26E owns physical movement execution. | FND-10 §§17,23–25 | Design/governance | PRD-04; LFE AI/movement interface |
| **REQ-ECO-010** | Creature perception must support typed sensory evidence (target/evidence, confidence, direction, freshness/intensity, identity certainty and threat/interest classification) without granting social omniscience. | FND-10 §18 | Design | LFE sensing/budget model |
| **REQ-ECO-011** | Group behaviour must support persistent/temporary herd, pack, flock, school, swarm, colony/hive and migration intent/roles while movement/formation execution remains with the movement owner. | FND-10 §§21–22 | Design | LFE group-agent architecture |
| **REQ-ECO-012** | Creature locomotion profiles may expose physically supported capabilities/constraints such as body envelope, step/slope/jump/climb/fly/glide/burrow/squeeze/phase/door/block interaction, but AI cannot ignore world collision/access rules without explicit capability/cost. | FND-10 §§23–26 | Design | Set-30/26E; LFE movement profiles |
| **REQ-ECO-013** | Creature lifecycle must support authored stage/state changes affecting size, behaviour, movement, breeding, resources, combat/taming and presentation without requiring a new unrelated creature identity for every stage. | FND-10 §27 | Design | LFE creature state |
| **REQ-ECO-014** | Distant reproduction/recruitment must use bounded demographic updates with valid conditions/carrying capacity rather than per-frame individual breeding; important/tame lineages may retain individual lineage detail. | FND-10 §28 | Design + Engineering | LFE ecology LOD |
| **REQ-ECO-015** | Migration must preserve an authoritative origin/population, compatible destination, timing/motivation/corridor intent and consequences; Set 30/26E executes movement at the appropriate abstraction. | FND-10 §29 | Design | LFE migration/ecology-movement |
| **REQ-ECO-016** | Nests/dens/territories/colonies/hives and other ecology sites must persist with explicit states such as active/dormant/seasonal/abandoned/damaged/occupied/cleansed/corrupted/managed/destroyed/recovering, and clearing a site must not simply reset respawn state. | FND-10 §30 | Design | LFE ecology-site persistence |
| **REQ-ECO-017** | Population is the primary distant ecology unit and must support family/region/habitat, count/band/demographic model, carrying capacity/input/pressure, nest/migration/trend/extirpation/notable-individual and reconciliation state as required. | FND-10 §§8–10 | Design | LFE population data model |
| **REQ-ECO-018** | Routine wild creatures need not all receive permanent individual runtime nodes/records; tame, owned, named, notable, boss/quest-linked, equipped or otherwise consequential individuals must be promotable to persistent identity without duplication. | FND-10 §§8,120 | Design + Engineering | LFE promotion/demotion |
| **REQ-ECO-019** | Carrying capacity/ecological pressure must be a bounded causal model that can incorporate habitat, food/water/shelter, breeding sites, climate/season, competition/predation/disease, civilisation/hunting/pollution/magic/events rather than an infinite respawn constant. | FND-10 §§9–11 | Design | LFE ecology simulation |
| **REQ-ECO-020** | Heavy local harvesting/predation/habitat change may cause decline/extirpation and later recovery/recolonisation; unloaded/reloaded regions may not instantly refill depleted populations without a valid source/cause. | FND-10 §§10–11 | Design | LFE ecology persistence |
| **REQ-ECO-021** | Regional ecology must support authored relationship graphs (feeding/predation/competition/symbiosis/pollination/nesting/parasites/etc.) sufficient to cause bounded abundance/decline/migration/pest/disease/crop/resource consequences without requiring laboratory-grade full energy simulation. | FND-10 §12 | Design + Engineering | LFE ecology graph |
| **REQ-ECO-022** | Habitat eligibility must consume authoritative worldgen/environment context and explicit family exclusions; biome identity alone may not force one fixed creature roster, and seed selection should resolve compatible ecology packages. | FND-10 §13 | Design | LFE worldgen/ecology handoff |
| **REQ-ECO-023** | Safe zones must arise from visible world systems such as structures, lighting, patrols, wards, habitat management/deterrents and settlement pressure rather than despawning all ecology; benign/managed species may remain in safe settlements. | FND-10 §16 | Design | LFE settlement/ecology interface |
| **REQ-ECO-024** | Creature difficulty/ecology profiles may reduce predation/threat/damage pressure but must remain explicit world/settings policy rather than silently rewriting creature-family identity. | FND-10 §16.2 | Design | Settings/LFE ecology |
| **REQ-ECO-025** | Applicable creature biological state must route through Set 29 while distant population ecology may remain lighter-weight; non-biological constructs/spirits may opt out of biological channels according to owned profiles. | FND-10 §39 | Design/governance | Set-29/LFE adapter |
| **REQ-ECO-026** | Husbandry/welfare/taming/training must be species/family-eligible and persistent; animal care may use scalable facility/handler systems and must not require individual click-chore simulation for large herds. | FND-10 §§37–42 | Design | LFE creature care/settlement interface |
| **REQ-ECO-027** | Non-person animal familiarity/training may use creature-owned bounded values, but socially complex/person companions must use Set-28 relationship/companion authority rather than duplicate Trust/Affection/Loyalty. | FND-10 §§41–44 | Design/governance | Set-28/LFE companion adapter |
| **REQ-ECO-028** | Creature harvest/salvage/output must resolve through valid eligibility, personhood/legal/welfare state, authoritative death/harvest source and Documents 04–06/05 provenance/transformations; a creature runtime may not invent generic loot detached from population/source truth. | FND-10 ownership; §§1,105 | Design | LFE ecology/resource/recipe interface |
| **REQ-ECO-029** | Procedural creature variation may select only authored compatible traits/variants; procedural generation may not arbitrarily combine capabilities such as flight, fire breath, telepathy, poison or armour without a coherent family contract. | FND-10 §118 | Design | Forge/worldgen validation |
| **REQ-ECO-030** | Future bounded AI assistance may propose target/activity/style/adaptive response, but deterministic authoritative validators must reject family-incompatible powers, movement, combat, ecology or permission changes. | FND-10 §117 | Compatibility/design | Future AI/LFE validation |
| **REQ-ECO-031** | Creature simulation must scale through population abstraction, group agents, pooled ambient life, sensory/path budgets, relevance, LOD/animation LOD and deterministic catch-up; distant ecology must not instantiate every animal as a Godot node. | FND-10 §120 | Design + Engineering | PRD-06/07; LFE ecology performance |
| **REQ-ECO-032** | Low-end profiles may reduce visible herd/ambient density, actor promotion, animation and AI/sense cadence but cannot change population/ownership truth, rare/boss existence, harvest/migration history or ecological consequences. | FND-10 §121 | Design + Engineering | LFE scalability |
| **REQ-MP-009** | Shared-world creature/taming authority must define who may own, command, ride, breed, harvest outputs, transfer/sell/release and must prevent contradictory simultaneous exclusive ownership. | FND-10 §122 | Design/security | LFE multiplayer/creatures |
| **REQ-PST-015** | Creature save validation must prevent duplicate tame animals/bosses, negative populations, dead actors remaining active, regenerated harvested carcasses, one creature in mutually exclusive ecology sites, incompatible dual ownership and recognised persons being reloaded as harvestable animals. | FND-10 §123 | Design + Evidence | LFE persistence/validation |
| **REQ-DEV-015** | Creature/ecology production validation must cover family/personhood/habitat/population/encounter invariants, representative seed ecology, migration/depletion/recovery, LOD/promotion, save safety and retirement of fixed POC spawn dependencies while preserving them as regression fixtures. | FND-10 §§105–106,124 | Evidence requirement | PRD-06/07/08 |

---

# 13. Round-3 New Unknowns / Evidence Gaps

| Unknown ID | Question | Route |
|---|---|---|
| **UNK-CIV-002** | What concrete persistent-person/household/job data partitioning allows large populations without turning every distant resident into a live scene object? | PRD-03/04/06/07 → LFE |
| **UNK-CIV-003** | What promotion/demotion criteria distinguish protected/named people from safely aggregatable routine population, and how are identities reconstructed without drift? | PRD-04/06/07 |
| **UNK-CIV-004** | What bounded utility/task-scheduling model can operate thousands of workers while consuming external biology/social/economy/movement results rather than duplicating them? | PRD-03/04/06/07 |
| **UNK-CIV-005** | What deterministic catch-up/event compression scheme preserves plausible household/work/migration/project history without replaying every missed tick? | PRD-04/06/07 |
| **UNK-CIV-006** | What reconciliation-barrier/revision protocol prevents interaction with partially promoted people/settlements while avoiding visible stalls? | PRD-04/06/07 |
| **UNK-AUT-005** | What graph partitioning/topology-cache strategy supports very large, cross-chunk fixed logistics/power/control networks with bounded invalidation/recomputation? | PRD-02/03/04/06/07 |
| **UNK-AUT-006** | What power/allocation solver and update cadence preserve exact capacity/priority/storage/fault semantics across LOD without expensive full-network solving every frame? | PRD-03/04/06/07 |
| **UNK-AUT-007** | What authoritative in-flight transfer representation best supports nearby visuals, cross-chunk streaming, buffers/backpressure and save/recovery without per-item simulation at distance? | PRD-02/03/04/06/07 |
| **UNK-AUT-008** | How will automation catch-up reconstruct historical power/fault/maintenance/transport availability without assuming continuous perfect operation or replaying every machine tick? | PRD-04/06/07 |
| **UNK-AUT-009** | What exact handoff protocol coordinates automation reservations/load/unload with Set-30 mobile transport and Set-26 vessels without double ownership of cargo or movement? | PRD-04/06/07; Set-26/30 extraction |
| **UNK-AUT-010** | What bounded control/sensor update model permits advanced factories while preventing combinatorial control-loop or event storms? | PRD-03/06/07 |
| **UNK-MAG-001** | What exact data model separates personal mana, external mana providers, mana topology, purity/stability and magical state while preserving transaction/migration safety? | PRD-03/04/06/07 → LFE |
| **UNK-MAG-002** | What mana-network solver/allocation strategy can support settlement/regional infrastructure and wards without unbounded graph updates? | PRD-03/04/06/07 |
| **UNK-MAG-003** | What generic typed effect-request/response protocol allows spells/rituals to request biology, movement, social, combat, weather and realm consequences without leaking ownership? | PRD-04/06/07 |
| **UNK-MAG-004** | What transaction/idempotency architecture makes casting and multi-stage rituals safe under interruption, save/load, retries and multiplayer? | PRD-04/06/07/08 |
| **UNK-MAG-005** | What spatial representation/solver should authoritative ward coverage use for voxel edits, moving/changed structures, multiple overlapping wards and LOD? | PRD-02/03/04/06/07 |
| **UNK-MAG-006** | How are summoned/constructed entities routed among person, creature, automation and magic ownership without duplicate identity/state when their status changes? | PRD-04/06/07 |
| **UNK-MAG-007** | What realm/portal transition transaction safely transfers actors/cargo and persistent authority between worlds/realms while preventing duplication or stranding? | Foundation 14 + FCC + PRD-04/06/07 |
| **UNK-ECO-001** | What population representation (exact counts, cohorts, bands or hybrid) provides adequate causal ecology while remaining scalable and deterministic? | PRD-03/04/06/07 |
| **UNK-ECO-002** | What rules promote/demote wild individuals and preserve notable/tame/owned/quest-linked identity when entering/leaving active simulation? | PRD-04/06/07 |
| **UNK-ECO-003** | What regional ecology update cadence/model handles carrying capacity, predation, breeding, disease, harvest and recovery without per-creature simulation? | PRD-04/06/07 |
| **UNK-ECO-004** | How are migration corridors and population movement represented across unloaded regions while consuming Set-30/26E route/access results? | PRD-04/06/07; Set-30/26 extraction |
| **UNK-ECO-005** | What sensory/perception query budgets and caching model support many active creatures without O(N²) target scans? | PRD-03/06/07 |
| **UNK-ECO-006** | How are ecology-site/nest destruction, vacancy, recolonisation and worldgen-derived habitat reconciled with persistent voxel edits? | PRD-02/04/06/07 |
| **UNK-ECO-007** | What authoritative carcass/harvest/provenance representation prevents respawn duplication while scaling from individual kills to distant population harvesting? | PRD-04/06/07 |
| **UNK-PERF-003** | What active-person, active-creature, path-query, sensory-query, machine/network and catch-up budgets are acceptable per simulation profile/hardware tier? | PRD-06/07 |
| **UNK-SIM-003** | What shared scheduling/backpressure framework coordinates person tasks, automation, mana networks and ecology without one subsystem starving the others? | PRD-03/04/06/07 |

---

# 14. Round-3 Coverage Result

Foundation 07–10 materially confirms that the production architecture must support:

- one persistent identity for each consequential person/entity across actor/visual/social/biology/economy/movement representations;
- intent-versus-execution interfaces instead of systems directly mutating one another's owned state;
- arbitrary generated settlements rather than a fixed POC roster;
- bounded L0–L4-style person/settlement representation and deterministic catch-up;
- exact worker/inventory/reservation/project truth across LOD;
- typed automation graphs, fixed logistics, backpressure, persistent work-in-progress, maintenance/faults and cross-owner movement handoffs;
- automation LOD that keeps conserved stock and committed history exact while reducing visual/per-segment work;
- personal versus external mana, conserved magical infrastructure and typed cross-owner magical effect requests;
- persistent runes, enchantments, rituals, summons, wards, portals and corruption/cleansing evidence;
- creature populations as persistent ecology truth, with promoted individuals only where individual identity matters;
- source-backed encounters rather than arbitrary proximity spawns;
- bounded carrying capacity, depletion/recovery, migration, ecology graphs and persistent nests/territories;
- personhood separated from hostility/body type;
- simulation/performance profiles that reduce representation cost but not authoritative people, stock, mana, populations or history;
- multiplayer-safe, idempotent ownership/mutation boundaries; and
- stable reason-coded validation plus dedicated test laboratories before production qualification.

The strongest cross-document convergence in this round is the same architectural pattern appearing independently in all four sources:

**persistent authoritative state → bounded representation → intent/request → specialist validation/execution → evidence → reconciliation.**

This is a major input to PRD-04/LFE later, but PRD-01 records it here only as a repeated requirement pattern, not as a prematurely chosen implementation.

**Next extraction source family:** Foundation 11–15 — world generation, structures/routes, peoples/cultures/factions, realms/interdimensional travel, and quests/events/history.


---

# 15. Round 4 — Foundation 11–15 Requirements

**Sources consumed:** `SRC-FND-11` through `SRC-FND-15`.

Round 4 moves PRD-01 from local/system-scale simulation into Leyforge's world-scale persistence and orchestration requirements: deterministic procedural world assembly, persistent structures and routes, layered civilisation/political identity, multi-realm world instances and atomic realm travel, and quest/event/history systems that observe rather than replace specialist-owned truth.

## 15.1 World generation and procedural world-assembly requirements — Document 11

| ID | Requirement | Source | Decision class | Downstream |
|---|---|---|---|---|
| **REQ-WGEN-010** | Every normal production world must be derived from an authoritative root seed, a versioned world profile, approved content packs and declared generator/registry versions rather than from a fixed POC layout. | FND-11 Statement; §§2–5 | Design | PRD-02/04; LFE worldgen |
| **REQ-WGEN-011** | For unchanged authoritative generation inputs, the unexplored generated base must reproduce the same authoritative output; presentation-only microvariation may differ only where it cannot affect gameplay, saves, discovery or multiplayer truth. | FND-11 §3.2 | Design + Engineering | PRD-02/06/07; LFE determinism |
| **REQ-WGEN-012** | Generation stages must derive deterministic scoped random streams/seeds from stable keys rather than consume one mutable global random stream whose ordering can shift unrelated outcomes. | FND-11 §5.2 | Design + Engineering | PRD-02/06/07; LFE RNG/worldgen |
| **REQ-WGEN-013** | Persistent generated records must retain enough seed lineage/provenance to explain their world, generation version, source definition/family, generation stage, deterministic repair/fallback and whether the result remains reconstructible or has been frozen. | FND-11 §5.3 | Design | LFE provenance/persistence |
| **REQ-WGEN-014** | Validation repair/fallback must itself be deterministic and recorded; invalid generation may not use arbitrary runtime rerolls, hidden POC substitutes or nondeterministic retry-until-success behaviour. | FND-11 §5.4 | Design + Engineering | PRD-06/07; LFE worldgen validator |
| **REQ-WGEN-015** | World generation must assemble coherent relationships before local decoration: topology, climate, geology, hydrology, history, ecology, resources, sites, routes, settlements and boss territories must arise from compatible contexts rather than decorative placement alone. | FND-11 §1 | Design | LFE generation-stage graph |
| **REQ-WGEN-016** | The world runtime must distinguish reusable world-profile/Atlas definitions from generated world/region/biome/site instances, mutable runtime state, persistent world deltas and actor knowledge records. | FND-11 §4 | Design | LFE world-state model |
| **REQ-WGEN-017** | Seed-derived base state must remain reconstructible where valid, while player edits, extraction, settlement growth, destruction, restoration, disasters, ownership, ecology change, route change and other history persist as deltas or promoted authoritative records. | FND-11 Statement; §4 | Design | LFE persistence/world state |
| **REQ-WGEN-018** | Updating a generator must not silently rewrite explored or otherwise stateful terrain/regions/sites; explored/generated state requires freezing, migration or explicit governed transformation. | FND-11 Statement; §§4–5 | Design + Compatibility | PRD-06/07; LFE migration |
| **REQ-WGEN-019** | The generated world must support a nested spatial hierarchy at least rich enough to represent world-scale topology, landmasses/ocean basins, macro-regions, watersheds/marine regions, terrain provinces, biome mosaics, territory overlays and sites. | FND-11 §6 | Design | PRD-04; LFE spatial hierarchy |
| **REQ-WGEN-020** | Terrestrial worldgen must provide authoritative context for macro-topology, terrain provinces, climate fields, hydrology/watersheds, geology, natural biome mosaics and general site suitability while preserving specialist ownership of ecology, resources, structures, movement, economy, biology and marine systems. | FND-11 §§1–2 | Design/governance | PRD-04; LFE worldgen interfaces |
| **REQ-WGEN-021** | World-generation stages and dependencies must be explicit enough to prevent later-stage features from silently invalidating earlier topology/placement assumptions and to support deterministic diagnostics/replay. | FND-11 §§1,5; App. D | Design + Engineering | PRD-04/06/07 |
| **REQ-WGEN-022** | Start validation must establish a viable survival/capability envelope—hazard escape, gathering, shelter/buildability, food or equivalent route, early tool/material route and reachable terrain—without guaranteeing one exact village, road, cave, ore, ruin, creature, quest or biome arrangement. | FND-11 §24 | Design | LFE world-start validator |
| **REQ-WGEN-023** | Progression safety must be expressed through category/capability guarantees and equivalent providers rather than hard-coded named resources or POC set-pieces. | FND-11 §§24–25 | Design | LFE capability/worldgen validation |
| **REQ-WGEN-024** | Worldgen validation must be able to prove or deterministically repair major capability families including survivable spawn, early tools, magic discovery where enabled, automation access, civilisation viability where required, ecology viability, dungeon reachability, boss coherence, required realm access and healthy distribution/spacing. | FND-11 §25 | Design + Evidence | PRD-06/07; LFE validator |
| **REQ-WGEN-025** | A world-generation failure must expose structured validation reasons and provenance rather than silently inserting impossible or unrelated content merely to satisfy a missing capability. | FND-11 §§1,25; App. A | Design | LFE diagnostics |
| **REQ-WGEN-026** | World profiles must support configurable scale/topology/climate/civilisation/ecology/adventure/resource/magic/maritime/vertical/start/simulation/accessibility/production parameters without changing cross-system ownership boundaries. | FND-11 App. B | Design | Future Set 35; LFE settings/worldgen |
| **REQ-WGEN-027** | Biome/world definitions must expose typed compatibility information—climate, terrain/substrate, hydrology, adjacency/transitions, vegetation, material roles, ecology/resource/site/settlement/route opportunities, overlays and validation ownership—rather than relying on display names. | FND-11 App. C | Design | LFE registry/worldgen; FORGE-ENG |
| **REQ-WGEN-028** | Worldgen must expose physical habitat/environment facts to ecology and may reject/reduce/move/substitute an ecologically invalid population, but may not fabricate unrelated prey/resources solely to make a chosen creature fit. | FND-11 §22 | Design | LFE worldgen/ecology interface |
| **REQ-WGEN-029** | Worldgen may generate leyline paths, mana fields, magical-site suitability, scars/leaks and magical resource opportunities, but spell effects, mana-network behaviour, ritual costs and corruption formulas remain specialist-owned. | FND-11 §23 | Design/governance | LFE worldgen/magic interface |
| **REQ-WGEN-030** | Where a world profile requires magic discoverability, generation must provide at least one valid category-equivalent discovery route through an owning system rather than one fixed mana-crystal/ruin sequence. | FND-11 §23.2 | Design | LFE worldgen/progression |
| **REQ-WGEN-031** | Physical route existence and terrain/topology evidence must remain separate from mover-specific accessibility/travel time, economic value and actor knowledge; those remain Set-30, Set-27 and Set-28 concerns respectively. | FND-11 §§1.2,21 | Design/governance | PRD-04; LFE interfaces |
| **REQ-WGEN-032** | Marine generation must integrate through the shared physical world while allowing Set-26 specialist ownership of basin/coast/island/bathymetry, liquid mechanics and dynamic marine conditions; the Overworld cannot maintain duplicate terrestrial and maritime world truths. | FND-11 §§1.2,2 | Design | PRD-04; LFE worldgen/Set26 boundary |
| **REQ-WGEN-033** | Local voxel terrain materialisation must be derived from higher-level generated records and canonical physical definitions rather than become a separate authoritative world model. | FND-11 Purpose, §§1,4 | Design | PRD-02/04; LFE voxel bridge |
| **REQ-WGEN-034** | Dynamic environmental states and history-driven overlays must be persistable and queryable without requiring every changing condition to become a new biome or authored world definition. | FND-11 §§1,4; Atlas boundary | Design | LFE world-state/overlays |
| **REQ-WGEN-035** | Generated sites must expose stable instance identity plus spatial bounds/context, source family, terrain/biome/route/water/history/territory/resource/magic suitability, protected-anchor state, persistence/discovery and validation evidence. | FND-11 App. A.4 | Design | LFE site records |
| **REQ-WGEN-036** | Biome instances must expose stable identity, spatial coverage, parent region, climate/terrain/hydrology context, ecology/resource/site/settlement/route compatibility, overlays, history, discovery, generated revision and validation. | FND-11 App. A.3 | Design | LFE biome-instance records |
| **REQ-WGEN-037** | World generation and simulation settings may vary density, history depth, distant-simulation complexity and presentation cost, but may not change the ownership of authoritative facts merely because a lower hardware profile is selected. | FND-11 Purpose; App. B | Design | LFE scalability; Set 35 |
| **REQ-WGEN-038** | Production worldgen must continuously validate absence of retired fixed POC IDs/layout dependencies from shipping generation while retaining the old scenarios only as archive/regression fixtures. | FND-11 §2.1; §25 | Governance + Evidence | PRD-06/07/09 |

## 15.2 Persistent structure, landmark, site and physical-route requirements — Document 12

| ID | Requirement | Source | Decision class | Downstream |
|---|---|---|---|---|
| **REQ-STR-001** | Each placed consequential structure/site must have one stable persistent runtime identity independent from its Atlas family, Blueprint source, construction project, settlement function and presentation objects. | FND-12 Statements; §§1–2 | Design | LFE structure runtime |
| **REQ-STR-002** | Atlas identity, editable Blueprint source, generated placement, construction project, settlement service/function and persistent structure instance must remain separate source layers linked by stable IDs rather than editable mirrors. | FND-12 Source-Layer Separation; §2 | Design/governance | PRD-04; LFE/FORGE-ENG |
| **REQ-STR-003** | Damage, occupation, corruption, restoration, ownership, repair and player edits normally modify state on the same Structure Instance rather than create duplicate “damaged”, “occupied” or “restored” definitions. | FND-12 Structure Instance Rule | Design | LFE state model |
| **REQ-STR-004** | Physical route infrastructure such as roads, bridges, tunnels, gates and crossings must persist as world facts independently from mover-specific traversal cost/access, economic route value and route knowledge. | FND-12 Routes Rule; §§1–2 | Design/governance | LFE structure/route interface |
| **REQ-STR-005** | Structure instances must retain or reference bounds, semantic elements, interaction points, condition/damage, ownership/claim, occupier, restoration/conversion state, local inventories/services/routes/sites/history and persistent player deltas without duplicating specialist-owned data. | FND-12 §1.1 | Design | LFE structure schema |
| **REQ-STR-006** | Persistent Structure Instances must reference external source/definition records by stable ID and should not copy the entire editable Blueprint/Atlas truth into save data. | FND-12 §2 No Mirror Rule | Design | LFE persistence; FORGE-ENG |
| **REQ-STR-007** | Player repair, renovation, expansion, excavation, decoration, reinforcement, conversion and demolition must preserve original source/provenance and historical ancestry where practical. | FND-12 §55 | Design | LFE structure deltas/migration |
| **REQ-STR-008** | Protected anchors—such as realm route anchors, essential return routes, boss/site anchors or other system-critical semantics—must have explicit deletion/conversion/failure policies rather than disappear through ordinary voxel edits. | FND-12 §56 | Design | LFE protected-state/edit validation |
| **REQ-STR-009** | Construction state must be able to exist persistently before commissioning and evolve through real material/labour/project stages rather than appear only as an instant final blueprint paste. | FND-12 §§57–58 | Design | LFE construction/structure interface |
| **REQ-STR-010** | Structure save commits must preserve causal atomicity across physical blocks/deltas, Structure Instance state, ownership, inventory/reservations, repair/project state and route availability so crash/retry cannot create contradictory partial truth. | FND-12 §118 | Design + Engineering | PRD-06/07; LFE transactions/persistence |
| **REQ-STR-011** | Structure simulation must support at least active, local-reduced, site-summary, regional-summary and dormant/archive representations with authoritative reconciliation at promotion/demotion. | FND-12 §119 | Design + Engineering | LFE simulation LOD |
| **REQ-STR-012** | Structure LOD/distance may not change structure existence, ownership, major damage, loot state, restoration, route closure, portal state, service truth, boss/site resolution or player edits. | FND-12 §120 | Design | LFE LOD invariants |
| **REQ-STR-013** | One persistent large site/structure identity may span many streamed voxel/navigation/audio/encounter zones without fragmenting into unrelated authoritative instances. | FND-12 §121 | Design + Engineering | PRD-02/04/06/07 |
| **REQ-STR-014** | Multiplayer host/server authority must govern structure placement, destruction, repair, claiming, ownership, door/gate state, structure inventory transfer, restoration, physical route state and blueprint-instance mutation. | FND-12 §122 | Design/security | LFE multiplayer |
| **REQ-STR-015** | Concurrent shared-world structure editing requires authoritative voxel revisions plus conflict resolution/locking, reservations, permission checks and rollback/recovery on failed commits. | FND-12 §123 | Design + Engineering | PRD-06/07; LFE MP/editing |
| **REQ-STR-016** | Structure permissions must support operation-specific rights such as enter/use/build/break/repair/claim/configure/loot/store/machine/portal/bed/service while the law/ownership systems remain the permission source. | FND-12 §124 | Design | LFE permission interfaces |
| **REQ-STR-017** | Structure-state changes must emit typed/versioned events/evidence sufficient for downstream movement, economy, quests, history, settlement service and presentation to react without polling duplicated state. | FND-12 §126 | Design | LFE event interfaces |
| **REQ-STR-018** | Structure validation must separately check identity/source, physical geometry/bounds/foundation/access/protected anchors, semantic contracts and lifecycle state, and must detect cross-system ownership violations. | FND-12 §§127–128 | Design + Evidence | FORGE-ENG/LFE validation |
| **REQ-STR-019** | Production validation must detect retired POC-only structure IDs/coordinates/dependencies in shipping pools while allowing archive/test namespaces. | FND-12 §129 | Governance + Evidence | PRD-06/07/09 |
| **REQ-STR-020** | Structure runtime must avoid one node/physics object per voxel or distant room and must support derived meshes, compact deltas, event-driven state, streamed zones and bounded presentation resources. | FND-12 §131 | Design + Engineering | PRD-02/03/06/07 |
| **REQ-STR-021** | Low-end profiles may reduce render/interior/physics/audio/presentation/detail/update cost, but cannot remove persistent roads, bridges, structures, owners, damage, services, route state, dungeons or player edits. | FND-12 §132 | Design | LFE scalability |
| **REQ-STR-022** | A moving vessel must not be treated as an ordinary static Structure Instance; vessel identity/local grids remain Set-26-owned while shared Blueprint/block/damage semantics may be reused. | FND-12 §50 | Design/governance | PRD-04; LFE maritime boundary |
| **REQ-STR-023** | Transition from vessel to wreck/site state must preserve identity/provenance and authoritative cargo/structure/history relationships rather than spawn an unrelated replacement structure. | FND-12 §§50–51 | Design | LFE/Set26 persistence |
| **REQ-STR-024** | One physical Structure Instance may support multiple compatible settlement service/function records without duplicating the structure itself. | FND-12 §§52–53 | Design | LFE structure/service interface |
| **REQ-STR-025** | Player-authored or official blueprints may satisfy shared structure/service contracts only after validation; authored geometry cannot override protected world anchors, registry identity, permissions, realm laws, route safety or resource conservation. | FND-12 §§54–57 | Design/security | FORGE-ENG/LFE |
| **REQ-STR-026** | Dungeon/site puzzle, loot, boss-removal, door and player-edit state must survive unload/reload rather than reset when the site is no longer active. | FND-12 App. I | Design | LFE site persistence |
| **REQ-STR-027** | Route-damage changes must invalidate downstream movement feasibility before economic systems continue using an impossible route; structure, movement and economy must reconcile in owner order. | FND-12 App. I; §130.3 | Design | LFE cross-system reconciliation |
| **REQ-STR-028** | Updating a Blueprint/source definition must not silently rebuild an explored modified Structure Instance; migration must preserve local deltas or explicitly resolve incompatibility. | FND-12 §§117,130.10 | Design + Compatibility | PRD-06/07; LFE migration |

## 15.3 Civilisation identity, government, law and political-state requirements — Document 13

| ID | Requirement | Source | Decision class | Downstream |
|---|---|---|---|---|
| **REQ-POL-001** | Ancestry/personhood, heritage, culture, language, faith, household, settlement, citizenship, government, faction, profession, social relationships, political loyalty and realm history must remain separable linked identities rather than collapse into one race/faction record. | FND-13 Statements; §§1–4 | Design lock | LFE civilisation model |
| **REQ-POL-002** | No ancestry, lineage, body type, culture or realm origin may mechanically imply morality, intelligence, hostility, profession, technology level, government, religion or civilisation worth. | FND-13 No Inherent Morality | Design lock | Content validation/LFE |
| **REQ-POL-003** | Formal political state and social process must remain separate: Document 13 owns governments/laws/membership/territory/treaties/war while Set 28 owns persuasion, trust, belief, relationships and social interpretation. | FND-13 Political/Social Boundary | Design/governance | PRD-04; LFE interfaces |
| **REQ-POL-004** | Political/fiscal authority and economic execution must remain separate: political records can establish who is authorised to tax/customs/borrow, while Set 27 owns assessment, amount, collection, treasury and market consequences. | FND-13 Government/Economy Boundary | Design/governance | LFE interfaces |
| **REQ-POL-005** | One persistent person must be able to hold multiple simultaneous, independently changing, hidden/disputed and jurisdiction-specific identity/membership/status records. | FND-13 §1.1 | Design | LFE person/political records |
| **REQ-POL-006** | Runtime political/civilisation state must resolve from Atlas definitions without maintaining a second editable copy of authored ancestry/culture/government/faction/settlement foundations. | FND-13 §4 | Design | LFE registry/runtime |
| **REQ-POL-007** | Display names/titles must not be canonical identity; people, factions, governments, offices and political records require stable identities independent from renamed presentation. | FND-13 §§19–21; identity model | Design | LFE IDs/migration |
| **REQ-POL-008** | Culture must persist independently from sovereignty and may branch, reform, merge, revive, hybridise, regionalise, diaspora-adapt, partially assimilate or disappear locally while retaining history/provenance. | FND-13 §§15–18,71–74 | Design | LFE civilisation simulation |
| **REQ-POL-009** | Hybrid culture formation must require persistent population/time/institutions/practices/linguistic-material-social blending rather than instant creation from temporary co-location. | FND-13 §16 | Design | LFE cultural-change model |
| **REQ-POL-010** | Language identity/competency references must remain independent from ancestry and from actual comprehension/knowledge transfer, which is resolved by Set 28. | FND-13 §§19–20 | Design | LFE identity/social interface |
| **REQ-POL-011** | Formal faith/philosophy affiliation must remain distinct from personal belief and from magic truth; people may doubt, privately believe, follow multiple traditions or change affiliation. | FND-13 §22 | Design | LFE political/social/magic interfaces |
| **REQ-POL-012** | Government and culture must remain independent: one culture may exist under several governments and one government may rule multiple cultures. | FND-13 §§23–24 | Design | LFE civilisation model |
| **REQ-POL-013** | Political world state must support governments, offices, succession, law activation/jurisdiction, citizenship/legal status, territorial claims, sovereignty, occupation, protectorates/autonomy, war/peace, treaties, alliances, recognition, rebellion/secession, annexation/liberation and political history. | FND-13 §2 | Design | LFE political state |
| **REQ-POL-014** | Office vacancy caused by death/resignation/removal/exile/term expiry/coup/disappearance must trigger political succession logic without recreating or replacing the underlying person population. | FND-13 §105 | Design | LFE lifecycle/politics |
| **REQ-POL-015** | Elections/councils/assemblies must have explicit eligibility, electorate/membership, quorum/agenda/authority, decision rules and committed outcomes; cultural stereotypes may not determine results. | FND-13 §§107–108 | Design | LFE political simulation |
| **REQ-POL-016** | Faction split/merge/federation/reform/dissolution must reconcile existing members, assets, claims, offices, laws/treaties and history without duplicating assets or deleting historical identities. | FND-13 §§110–112 | Design + Engineering | PRD-06/07; LFE political transactions |
| **REQ-POL-017** | Government collapse must not delete settlements, people, cultures or local services; political failure produces changed world state/history rather than world reset. | FND-13 §§113–114 | Design | LFE civilisation/history |
| **REQ-POL-018** | Settlements/civilisations must support mixed ancestries, cultures, languages, faiths, citizenship statuses, refugees/diaspora and mixed households without assuming one homogeneous population identity. | FND-13 §116 | Design | LFE population/civilisation |
| **REQ-POL-019** | Law may recognise or deny rights/permissions such as language, ritual, education, land/use, heritage and personhood, but specialist systems remain responsible for physical/social/economic/biological consequences. | FND-13 §117; boundaries | Design/governance | LFE law interfaces |
| **REQ-POL-020** | Colonisation/migration/realm settlement must account for existing claims, societies, ecology, treaties, supply, routes, adaptation and law; empty generated space cannot automatically mean politically unowned space. | FND-13 §§74–79 | Design | LFE worldgen/politics |
| **REQ-POL-021** | Route/portal ownership may grant route-specific authority such as passage, inspection, toll authorisation, maintenance or closure without automatically conferring sovereignty over the destination realm/territory. | FND-13 §77 | Design | LFE realm/political interface |
| **REQ-POL-022** | Political state changes must follow an authoritative commit pattern: proposal/trigger → authority/world-fact checks → specialist social/economic/physical feasibility where required → political commit → evidence/event → specialist consequences. | FND-13 App. F | Design | LFE commands/transactions |
| **REQ-POL-023** | Political defeat, conquest, occupation and surrender must preserve surviving people, culture, history, claims and diaspora rather than replace them with generic faction state. | FND-13 §§110–117; App. H | Design | LFE civilisation persistence |
| **REQ-POL-024** | Political simulation must support bounded strategic LOD using sparse relationship graphs, summaries, scheduled/event-driven updates and protected actors rather than simulating every distant council conversation. | FND-13 §223 | Design + Engineering | PRD-06/07; LFE simulation |
| **REQ-POL-025** | Low-end profiles may reduce strategic tick/ambient political detail but cannot erase governments, law, citizenship, territory, treaties, war or political history. | FND-13 §224 | Design | LFE scalability |
| **REQ-POL-026** | Save/load and LOD must preserve governments, treaties, memberships, claims, occupation/sovereignty distinction and political history without rewriting political truth. | FND-13 App. H | Design | LFE persistence/LOD |
| **REQ-POL-027** | Actor-facing political UI/read models must be capable of distinguishing authoritative truth from unknown, rumoured, disputed or reported information so hidden server truth is not leaked. | FND-13 §§225–226; App. H | Design | LFE read models/UI |
| **REQ-POL-028** | Political content updates that remove definitions must use alias/deprecation/freeze/fallback/quarantine semantics and must not delete living people solely because a definition changed. | FND-13 §221 | Design + Compatibility | LFE migration |
| **REQ-POL-029** | Formal treaties, war state, citizenship and other political commits must be authoritatively ordered in multiplayer/shared-world execution rather than committed independently by clients. | FND-13 §§93–104; App. H | Design/security | LFE multiplayer |

## 15.4 Realm instances, laws, access and cross-realm transition requirements — Document 14

| ID | Requirement | Source | Decision class | Downstream |
|---|---|---|---|---|
| **REQ-REALM-002** | A major realm must be representable as a complete persistent world system with topology, laws, regions, ecology, societies, resources, infrastructure, dungeons/bosses and mutable history rather than as a recoloured biome/loot room. | FND-14 Dimension System Statement; Purpose | Design lock | LFE realm architecture |
| **REQ-REALM-003** | Authored realm families/laws/biomes and runtime RealmInstances/network/routes/state must remain separate; runtime outcomes modify instances, not Atlas definitions. | FND-14 Atlas/Runtime Rule; §§4,13 | Design | LFE realm state |
| **REQ-REALM-004** | Normal worlds must not require one fixed first realm or linear dimension ladder; enabled realm instances, clues, routes, arrivals, politics, dungeon/boss state and route stability may be seed-derived and simulation-responsive. | FND-14 No Fixed First Realm; §§9–10 | Design | LFE realm-network generation |
| **REQ-REALM-005** | Every RealmInstance must have stable persistent identity, source definition, derived seed/generation version, topology/region references, active law stack, dynamic-state references, inbound/outbound/emergency routes, persistent deltas and LOD/lifecycle state. | FND-14 §§12–14 | Design | LFE realm records |
| **REQ-REALM-006** | Realm-network generation must be deterministic for unchanged world seed/content manifest/generation versions/world profile and must preserve seeded relationship/route-instance provenance. | FND-14 §§9–12 | Design + Engineering | PRD-06/07; LFE determinism |
| **REQ-REALM-007** | Realm laws must support scoped precedence/override from cosmological to realm-global, regional, biome, site and temporary authorised overlays, with each override declaring what fields it may change. | FND-14 §§17–18 | Design | LFE law stack |
| **REQ-REALM-008** | Realm-law/environment snapshots must expose generic typed fields such as gravity/local-up, atmosphere, pressure/temperature context, buoyancy/drag, time rate, mana density, visibility, navigation anomalies and matter stability rather than hard-code realm-name checks into consuming systems. | FND-14 §§18–19,216 | Design | PRD-04; LFE interfaces |
| **REQ-REALM-009** | Movement, biology, economy, social knowledge, political authority, magic activation, ecology and structure state inside realms must remain owned by their specialist systems; Document 14 supplies realm context/routes/law rather than duplicating those truths. | FND-14 §§2–3 | Design/governance | PRD-04 |
| **REQ-REALM-010** | No ancestry may be mechanically treated as the biological owner or moral identity of a realm; native/adapted/migrant/diasporic/colonising/visiting societies remain separate political/cultural identities. | FND-14 No Biological Realm Ownership | Design lock | LFE/content validation |
| **REQ-REALM-011** | Normal realm progression must never silently strand a save; each intended route must provide a stable, recoverable, negotiated, constructible or emergency return path unless explicitly classified/signposted as a deliberate no-return challenge. | FND-14 Safe-Return Rule; §§41–48 | Design lock | PRD-06/07; LFE transition/safety |
| **REQ-REALM-012** | Realm access/preparation should query capabilities and valid combinations of knowledge, structures, catalysts, power, rituals, specialists, permissions, outcomes, equipment/vessels and anchors rather than one exact universal key item. | FND-14 §§172–174 | Design | LFE capability/realm access |
| **REQ-REALM-013** | Cross-realm access must be represented as an authoritative route/anchor graph with explicit route stability, capacity, permissions, destination resolution, arrival-envelope and return state. | FND-14 §§2,8–12 | Design | LFE realm route system |
| **REQ-REALM-014** | Realm transition must be an authoritative transaction that validates route/anchor, magic/power, permission, traveller/cargo, destination arrival, throughput reservation and origin/destination commit ordering before emitting arrival evidence. | FND-14 §49 | Design + Engineering | PRD-06/07; LFE transactions |
| **REQ-REALM-015** | A traveller/container may not exist authoritatively in two realms simultaneously; transition failure after origin release requires transaction-log-based recovery to a safe origin/destination/emergency state without duplication or silent loss. | FND-14 §§50–51 | Design + Engineering | PRD-06/07; LFE persistence |
| **REQ-REALM-016** | Inventory/cargo remains attached to the authoritative traveller/container through realm transition; portal travel may not implement movement by copying inventory into a destination record. | FND-14 §51 | Design | LFE entity/container transfer |
| **REQ-REALM-017** | Portal/realm routes must declare traveller/cargo compatibility and throughput/capacity for players, NPCs, creatures, mounts, carts, guided vehicles, cargo and vessels where applicable. | FND-14 §§52–54 | Design | LFE realm/movement/maritime |
| **REQ-REALM-018** | Arrival envelopes must guarantee valid spatial placement/clearance/support/hazard/party/vehicle/fallback constraints; normal routes cannot place travellers inside solids, outside bounds or into untelegraphed unavoidable lethal conditions. | FND-14 §§57–60 | Design | PRD-06/07; LFE transition |
| **REQ-REALM-019** | Dangerous arrival is valid only when danger is authored, warned/signposted, preparable and consistent with intended progression rather than an accidental streaming/placement failure. | FND-14 §60 | Design | LFE validation/UI |
| **REQ-REALM-020** | Portal/route throughput must be physically/capability bounded by infrastructure, power, permissions, arrival space and stability so realm routes cannot provide unlimited instantaneous army/freight teleportation. | FND-14 §§100–107 | Design | LFE realm logistics |
| **REQ-REALM-021** | Interdimensional trade must involve actual goods, route, throughput, ownership/customs, destination and physical/dimensional transit; no ledger-only teleport trade may bypass movement/route capacity. | FND-14 §§100–103 | Design | LFE realm/economy/transport |
| **REQ-REALM-022** | Cross-realm consequences must be routed as typed evidence/requests to specialist owners rather than Document 14 directly mutating ecology, politics, economy, structures, quests, magic or other domains. | FND-14 §§108–109 | Design | LFE event/interface architecture |
| **REQ-REALM-023** | Realm discovery/objective truth and actor/player knowledge must remain distinct; UI may expose confidence/rumours/known destinations only through knowledge-aware read models. | FND-14 §§110–114,211 | Design | LFE read models/UI |
| **REQ-REALM-024** | Pocket realms must have explicit creator/source, owner, capacity, laws, entry/exit, persistence, storage/access permissions and safe-collapse/ejection rules; they may not act as infinite free storage. | FND-14 §§130–133 | Design | LFE pocket realm runtime |
| **REQ-REALM-025** | Realm clusters, network realms, reflection/layer realms, artificial realms and interstitial realms must be supportable without forcing every realm into one continuous terrain/world topology model. | FND-14 §§134–138 | Design | PRD-04; LFE realm topology |
| **REQ-REALM-026** | Realm-specific technology, magic, building, civilisation, ecology, economy, movement and biology must extend shared universal systems through law/context/adaptation rather than create duplicate realm-specific engines by default. | FND-14 §§139–147 | Design/governance | LFE/FORGE-ENG |
| **REQ-REALM-027** | Realm outcome/history changes such as alliance, restoration, conquest, isolation, collapse, sealing or industrialisation must remain instance state/history on the same RealmInstance. | FND-14 §§163–166 | Design | LFE realm/history |
| **REQ-REALM-028** | Realm systems must support independent streaming and distant LOD without requiring one permanent scene branch containing every realm; one authoritative server/world may host players in different RealmInstances concurrently. | FND-14 §§230,233–234 | Design + Engineering | PRD-03/04/06/07; LFE |
| **REQ-REALM-029** | Multiplayer realm travel requires compatible gameplay-critical realm/biome/route/law definitions/content hashes and authoritative ordering under capacity pressure; incompatible content must block or explicitly migrate rather than silently desynchronise. | FND-14 §§228,235 | Design/security | LFE multiplayer/content handshake |
| **REQ-REALM-030** | Realm validation/tests must cover definition/instance/route integrity, safe-return, seed variety, transition types, power/anchor/permission/network failures, save during transit, LOD, cross-realm ecology, realm settlements, source updates, multiplayer capacity and pocket destruction/recovery. | FND-14 §§213–229 | Evidence requirement | PRD-06/07/08 |

## 15.5 Quest, event, evidence and world-history runtime requirements — Document 15

| ID | Requirement | Source | Decision class | Downstream |
|---|---|---|---|---|
| **REQ-QST-001** | A quest must be a player-facing interpretation/tracker of a real opportunity/problem/promise/investigation/project/event and may not manufacture the underlying world truth merely to satisfy its objective. | FND-15 Quest System Statement | Design lock | LFE quest/event architecture |
| **REQ-QST-002** | An Event must be an authoritative time/phase-based world-state change driven by valid causes/actors/schedules/simulation pressure/authored grammars, may progress without players and must leave persistent aftermath. | FND-15 Event System Statement | Design | LFE event runtime |
| **REQ-QST-003** | Quest objective progress must be satisfied by authoritative evidence supplied by the owner of the underlying fact; the quest system may evaluate evidence but may not recreate specialist formulas. | FND-15 Evidence Owns Progress | Design/governance | PRD-04; LFE evidence interfaces |
| **REQ-QST-004** | Quest/event failure should normally become persistent world/history state rather than force reload; deadlines, deaths, migration, collapse, contract breach, faction reform and route closure must be representable. | FND-15 Failure Becomes History | Design | LFE event/history |
| **REQ-QST-005** | Authored story arcs/event families/history/rumours/aftermath content, runtime Quest/Event Instances, economic contracts and social assignments must remain separate record types with their owning systems. | FND-15 Arc/Quest/Event Separation; §§3–4 | Design/governance | LFE registry/interfaces |
| **REQ-QST-006** | Runtime Quest Instances must support stable definitions/revisions, real subject bindings, ownership/scope, lifecycle/stages/branches, objective/evidence/contribution state, resolution/rewards/aftermath/history and migration. | FND-15 §§1,9–11 | Design | LFE quest schema |
| **REQ-QST-007** | Quest/objective/event bindings must reference actual people, structures, settlements, routes, realms, resources, contracts and event instances through stable IDs rather than display names or placeholder story objects. | FND-15 §§9–10 | Design | LFE IDs/quest runtime |
| **REQ-QST-008** | Every objective must declare target bindings, evidence predicate/source, completion/contribution/failure policy, visibility and reason state. | FND-15 §6 | Design | LFE objective schema |
| **REQ-QST-009** | Cross-system evidence must have stable identity, source owner/transaction/event reference, subject refs, authoritative world time, typed payload/fact, revision, visibility and authority/server provenance sufficient for deduplication and audit. | FND-15 §7 | Design | LFE event/evidence bus |
| **REQ-QST-010** | Evidence processing, objective increments, contribution credit, rewards and event consequences must be idempotent so retries/network duplication/save recovery cannot apply the same authoritative evidence twice. | FND-15 §§8,195,203 | Design + Engineering | PRD-06/07; LFE transactions |
| **REQ-QST-011** | Quest lifecycle must support latent/discoverable/offered/available/accepted/active/blocked/suspended/branch-pending/completed/failed/expired/abandoned/superseded/closed/archived states where applicable. | FND-15 §11 | Design | LFE quest state machine |
| **REQ-QST-012** | Quest discovery and visibility must be knowledge-aware; a quest definition existing on the server may not expose hidden world truth to a player who only has rumour/partial/contested evidence. | FND-15 §§12–13 | Design | LFE read models/Set28 |
| **REQ-QST-013** | Requests, contracts, social assignments, investigations and player-private objectives must remain distinct semantics; tracking an external obligation does not transfer ownership of that obligation to the quest system. | FND-15 §§16–21 | Design/governance | PRD-04; LFE |
| **REQ-QST-014** | Generated quests must bind a valid requester/source, target, solution space, reward source and aftermath; generated variety must arise from real world differences rather than simple noun substitution. | FND-15 §§304–307 | Design | LFE quest generation |
| **REQ-QST-015** | Generated quest creation must be bounded by meaningful conditions/context validation and must not spam formal quests for trivial fluctuations unless the selected guidance/settings intentionally request dense task presentation. | FND-15 generation rules; v0.1 preserved | Design | LFE event/quest scheduler |
| **REQ-QST-016** | Quest/event outcomes may feed future social memory, rumours, arc selection, memorialisation and history, but specialist systems must commit their own downstream changes rather than Chronicle directly rewriting them. | FND-15 §§308–314 | Design | LFE history/evidence interfaces |
| **REQ-QST-017** | Chronicle/history records must represent important world history rather than only player achievements, while objective historical evidence remains distinct from the beliefs/interpretations different actors/groups hold. | FND-15 §§309–315 | Design | LFE Chronicle/knowledge |
| **REQ-QST-018** | Severe procedural/event content must support deliberate authored severity/review classification and world settings that can suppress/soften selected categories with coherent replacement behaviour rather than arbitrary deletion of causal systems. | FND-15 §§316–317 | Design | Future Set35/41; LFE event profiles |
| **REQ-QST-019** | High-consequence world events must provide fair warning/counterplay where fiction allows; protected player-critical state may use bounded risk, delayed catastrophic commit, rescue opportunity or settings rather than arbitrary off-screen destruction. | FND-15 §§318–321 | Design | LFE event safety/settings |
| **REQ-QST-020** | Important NPCs are not universally narrative-immortal, and quest/event continuity must adapt to authoritative death/departure/world change rather than keep impossible actors/structures alive for story convenience. | FND-15 §§322–323; App. I | Design | LFE quest migration/rebinding |
| **REQ-QST-021** | Quest/event scheduling must be capable of event-driven subscriptions plus bounded periodic condition evaluation using relevance/dirty flags/budgets rather than scanning the entire world every frame. | FND-15 §§190–191 | Design + Engineering | PRD-03/04/06/07 |
| **REQ-QST-022** | Save state must persist Quest/Event Instances, objectives/bindings/evidence/contributions/branches/deadlines/rewards, event phase/severity/history and migration revisions without duplicating specialist mutable state. | FND-15 §192 | Design | LFE persistence |
| **REQ-QST-023** | Reward commit and event-resolution/aftermath commit must be transaction-safe across crashes/retries so completion and reward/consequence state cannot diverge or duplicate. | FND-15 §§193–195 | Design + Engineering | PRD-06/07/08 |
| **REQ-QST-024** | Host/server must own authoritative Quest/Event world state; personal/party visibility/contribution may differ, but disconnecting a player cannot freeze world events, contracts, convoys or rescues that should continue. | FND-15 §§196–202 | Design | LFE multiplayer |
| **REQ-QST-025** | Party/shared quests must explicitly define ownership, join/leave rules, contribution, branch authority and reward policy, including late join and disconnect behaviour. | FND-15 §§199–201 | Design | LFE multiplayer/quest |
| **REQ-QST-026** | Quest/event migration must handle changed/removed IDs, NPCs, structures, content packs, objective schemas, ownership and archived POC content without fabricating replacement truth. | FND-15 §204 | Design + Compatibility | LFE migration |
| **REQ-QST-027** | Event/quest LOD must permit events to continue/resolve while distant or while players are absent, while preserving identical authoritative world outcomes and persistent aftermath/history. | FND-15 App. I; §§190–192 | Design + Engineering | LFE simulation |
| **REQ-QST-028** | Low-end/performance settings may reduce quest/event presentation and evaluation cadence within safe bounds but may not change authoritative quest/event truth, contribution, deadlines or world-history outcomes. | FND-15 App. I; performance principle | Design | LFE scalability |
| **REQ-QST-029** | Production proof must verify authoritative evidence binding, duplicate-evidence rejection, transaction-safe rewards, save/load, distant event progression, persistent aftermath/history, dead/destroyed subject continuity, cross-owner objective boundaries and deterministic multiplayer contribution. | FND-15 App. I | Evidence requirement | PRD-06/07/08 |

---

# 16. Round-4 New Unknowns / Evidence Gaps

| Unknown ID | Question | Route |
|---|---|---|
| **UNK-WGEN-004** | What exact spatial hierarchy/ID/partition model maps world → macro-region → province → biome/site → voxel chunks without creating duplicate ownership between regional simulation and Zylann terrain storage? | PRD-02/04/06/07 → LFE |
| **UNK-WGEN-005** | What deterministic generation-stage/job graph guarantees identical authoritative results across worker counts, job order, cancellation/retry and streaming arrival order? | PRD-02/03/06/07 |
| **UNK-WGEN-006** | What generated-base/delta/freeze granularity best preserves explored worlds across generator upgrades without storing the entire base redundantly? | PRD-02/03/04/06/07 |
| **UNK-WGEN-007** | When a seed/profile fails a required capability validator, what conditions justify deterministic repair versus choosing a different start versus rejecting world creation entirely? | PRD-04/06/07 |
| **UNK-WGEN-008** | How will effectively enormous/semi-infinite terrain, long-term edits and promoted world records keep save/database growth bounded over years of play? | PRD-02/03/04/06/07 |
| **UNK-WGEN-009** | What exact interface separates Document-11 terrestrial generation, Set-26 marine generation and Zylann voxel materialisation while preserving one physical world truth? | PRD-02/04 |
| **UNK-WGEN-010** | How are multi-chunk sites/structures/roads/resource fields reserved/generated atomically when generation jobs encounter chunks in arbitrary order? | PRD-02/06/07 |
| **UNK-WGEN-011** | Which world-profile parameters may legitimately change authoritative simulation breadth while still representing the same game, and which must remain presentation-only? | PRD-04/06; future Set35 |
| **UNK-STR-001** | How are Structure Instance bounds, semantic elements and persistent deltas partitioned when one structure spans many voxel chunks/streaming zones? | PRD-02/04/06/07 |
| **UNK-STR-002** | What compact semantic-manifest representation lets structures expose rooms/anchors/doors/routes/services without one node/object per semantic element? | PRD-03/04/06/07 |
| **UNK-STR-003** | How should Blueprint-source updates rebase/migrate against player-modified structure deltas without silently destroying edits or requiring full structure duplication in saves? | PRD-04/06/07 |
| **UNK-STR-004** | What bounded structural-support/collapse model is required for structures versus normal floating voxel terrain, and how does it interact with damage/restoration? | Design clarification + PRD-02/06/07 |
| **UNK-STR-005** | What concurrent-edit transaction/revision protocol prevents conflicting multiplayer voxel/build/repair changes while remaining responsive? | PRD-03/04/06/07 |
| **UNK-STR-006** | What invalidation granularity connects physical bridge/gate/road edits to movement route graphs and downstream economy without full-world recomputation? | PRD-04/06/07 |
| **UNK-STR-007** | How are megadungeons/very large structures streamed zone-by-zone while maintaining one site identity, puzzle/loot history, navigation and encounter state? | PRD-02/03/04/06/07 |
| **UNK-STR-008** | What exact protected-anchor policy distinguishes deletable, confirmable, consequence-bearing and non-removable semantic anchors? | PRD-04/06; design owner review |
| **UNK-STR-009** | How is vessel→wreck/site conversion committed atomically so identity, cargo, damage, salvage rights and history cannot duplicate or disappear? | Set26 extraction + PRD-04/06/07 |
| **UNK-STR-010** | How are multiple Document-20 service/function records mapped to one changing physical Structure Instance without hidden duplicate capacity? | PRD-04/06/07 |
| **UNK-POL-001** | What political/civilisation graph data model scales territory, governments, factions, memberships, treaties, wars and claims across large worlds/realms? | PRD-03/04/06/07 |
| **UNK-POL-002** | What spatial representation should jurisdictions, territorial claims, occupation and sovereignty use when borders can change independently of terrain chunks? | PRD-04/06/07 |
| **UNK-POL-003** | What deterministic thresholds/history model governs cultural branching/hybridisation/assimilation without simulating every cultural interaction at maximum fidelity? | PRD-04/06/07; design calibration |
| **UNK-POL-004** | How are faction splits/merges/federations committed transactionally across memberships, assets, laws, treaties and historical IDs without duplication? | PRD-04/06/07 |
| **UNK-POL-005** | What distant scheduling model handles succession, elections, councils and law/policy changes without simulating every meeting/conversation? | PRD-04/06/07 |
| **UNK-POL-006** | How should contested/hidden political truth be stored separately from actor/player knowledge while supporting server-authoritative UI and history queries? | PRD-04; Set28 extraction |
| **UNK-POL-007** | What multiplayer permission/consensus/authorisation model governs high-impact political commands such as treaties, war declarations, annexation and law changes? | PRD-04/06; future Set31 |
| **UNK-POL-008** | How are migration, refugees and diaspora aggregated across distant simulation while retaining protected individual identities and cultural/political continuity? | PRD-04/06/07 |
| **UNK-REALM-002** | How do RealmInstances map into the future world/shard/spatial hierarchy—separate save partitions, shards within one world, or another ownership structure? | PRD-04/06/07 → LFE |
| **UNK-REALM-003** | What atomic cross-realm transaction/journal protocol can safely span independently streamed/save-partitioned realms under crashes, disconnects and retries? | PRD-03/04/06/07 |
| **UNK-REALM-004** | What throughput reservation/queue/ordering model prevents double travel, starvation or race conditions when many actors/cargo attempt one route concurrently? | PRD-04/06/07 |
| **UNK-REALM-005** | How do realm-local time-rate modifiers reconcile with one authoritative world chronology, deadlines, distant events, economics and multiplayer players in different realms? | PRD-04/06/07 |
| **UNK-REALM-006** | What schema resolves law-stack precedence/conflicts and which law fields are permitted to vary at cosmological/realm/region/biome/site/temporary scopes? | PRD-04/06; FCC delta |
| **UNK-REALM-007** | What streaming/resource-budget model permits several RealmInstances to be active for different players while bounding CPU/RAM/GPU/worldgen/save pressure? | PRD-03/06/07 |
| **UNK-REALM-008** | How are safe-return guarantees maintained when players/factions can damage, close or construct routes/anchors after another party enters a realm? | PRD-04/06/07 |
| **UNK-REALM-009** | What authoritative quotas/capacity/storage/ejection rules make player-created pocket realms useful without infinite-storage or persistence exploits? | PRD-04/06/07; future content owner |
| **UNK-REALM-010** | How are undiscovered realm networks and explored realm instances migrated when realm definitions/content packs/generator versions change? | PRD-04/06/07 |
| **UNK-REALM-011** | How does multiplayer join-in-progress/spectating/reconnect work when a player is in a realm not currently streamed by other clients? | PRD-03/04/06; future Set31 |
| **UNK-QST-001** | What durable event/evidence bus and indexing model supports cross-system subscriptions, idempotency and history queries without unbounded retained event volume? | PRD-03/04/06/07 |
| **UNK-QST-002** | How long must raw evidence be retained before compaction into Chronicle/history, and what evidence must never be pruned because active quests/contracts/migrations reference it? | PRD-04/06/07 |
| **UNK-QST-003** | What versioned objective-predicate/expression language can bind typed specialist evidence while remaining safe for content packs and migratable across schema changes? | PRD-03/04/06/07; FORGE-ENG |
| **UNK-QST-004** | What transaction choreography links objective completion, reward commit, specialist aftermath and Chronicle transition without requiring a fragile cross-system global transaction? | PRD-04/06/07 |
| **UNK-QST-005** | What quest/event LOD scheduler handles deadlines, phase windows and catch-up deterministically without scanning every quest/event each tick? | PRD-04/06/07 |
| **UNK-QST-006** | What generation/ranking/cooldown model prevents simulation-driven quest spam while still surfacing genuinely meaningful changing world conditions? | PRD-04/06/07; design calibration |
| **UNK-QST-007** | How does Chronicle/history storage remain searchable and bounded over multi-year worlds with potentially enormous event histories? | PRD-03/04/06/07 |
| **UNK-QST-008** | What persistence partition model cleanly separates personal, party, settlement/faction, realm and world quest/event state in shared worlds? | PRD-04/06; future Set31 |
| **UNK-QST-009** | When a content update removes/replaces a bound quest target, what rebind/close/fail/quarantine rules preserve causal truth without inventing a substitute? | PRD-04/06/07 |
| **UNK-QST-010** | What world-setting thresholds define bounded off-screen consequence protection for critical NPCs/bases/unique items without creating hidden narrative invulnerability? | PRD-04/06/07; future Set35 |

---

# 17. Round-4 Coverage Result

Foundation 11–15 adds the world-scale requirements that the earlier local simulation rounds could not fully define:

- deterministic world assembly from root seed, world profile, content manifest and versioned generation stages;
- scoped seed derivation and reproducible deterministic repair rather than one global random stream or arbitrary rerolls;
- generated base versus persistent deltas/promoted records, with explored/stateful world freezing across generator revisions;
- explicit world spatial hierarchy and typed biome/site records that sit above local voxel materialisation;
- capability-based world-start/progression validation instead of guaranteed named starter content;
- one persistent Structure Instance per placed place, with Blueprint/Atlas/project/function/source layers kept separate;
- persistent physical route infrastructure, structure damage/ownership/occupation/restoration/player edits and multi-zone site streaming;
- atomic structure/project/inventory/route persistence and multiplayer-safe concurrent editing;
- layered civilisation identity where ancestry, culture, government, faction, law, citizenship and social belief are independent but interoperable;
- persistent political transitions—elections, succession, faction splits/merges, government collapse, conquest, diaspora and hybridisation—without deleting people or culture;
- RealmInstances as independently persistent world systems with seeded route networks, law stacks, safe-return obligations, LOD and cross-realm consequences;
- atomic cross-realm transition that cannot duplicate travellers/cargo and must recover safely after failure;
- capability-based realm access, bounded portal throughput, valid arrival envelopes and explicit pocket-realm capacity/collapse rules;
- quests/events as orchestration over real specialist-owned facts, not replacement simulation;
- stable idempotent evidence as the basis of objectives, contribution, rewards, aftermath and Chronicle/history;
- world events that continue without the player and produce persistent consequences/history;
- knowledge-aware quest/realm/political presentation that does not leak hidden server truth; and
- the same cross-document pattern seen earlier: stable authoritative instances and records survive while local representations, views and fidelity are allowed to change.

Round 4 also exposes several of the highest-risk prototype targets for later PRD work: deterministic multi-threaded worldgen, generated-base/delta persistence, cross-chunk structure identity, concurrent voxel editing, large-site streaming, political/civilisation aggregation, independently streamed RealmInstances, atomic cross-realm transactions, and bounded evidence/event/history storage.

**Next extraction source family:** Foundation 16–20 — combat/defence, UI/UX/accessibility/player trust, the mixed technical implementation plan, settlement growth/player blueprints, and buildings/facilities/construction/projects.


# 18. Round 5 — Foundation 16–20 Technical Requirements

**Sources consumed in this round:**

- `SRC-FND-16` — Combat, Gear, Defence and Tactical Conflict System v1.0
- `SRC-FND-17` — UI/UX, Accessibility, Menus, HUD, World Configuration and Player Trust System v1.0
- `SRC-FND-18` — Godot + Summer Engine Technical Implementation Plan v1.0 (**mixed technical provenance; engine-neutral requirements only**)
- `SRC-FND-19` — Settlement Growth, District Planning and Player Voxel Blueprint System v1.0
- `SRC-FND-20` — Buildings, Facilities, Functional Services, Construction and Settlement Project System v1.0
- `SRC-FND-GOV` — Foundation 00–20 POC-to-Production Reconciliation Register v0.2

Round 5 completes the initial **Foundation 00–20** extraction baseline. Document 18 is deliberately filtered: its retained engine-neutral invariants are extracted below, while Summer-specific repository paths/classes/module assumptions are preserved as historical implementation provenance and are **not** promoted into clean-rebuild technical canon.

## 18.1 Combat, gear, defence and tactical-conflict requirements — Document 16

| ID | Requirement | Source | Decision class | Downstream |
|---|---|---|---|---|
| **REQ-CMB-001** | Combat must remain a contextual action-survival layer whose tactical result is integrated into the wider sandbox rather than a detached minigame or universal owner of danger. | FND-16 Statement; §§1–4 | Design | PRD-04/06/07; LFE combat |
| **REQ-CMB-002** | Combat must support non-kill resolutions—including avoidance, deterrence, stealth, surrender, capture, retreat, rescue, containment, construction, diplomacy and political/economic solutions—where the encounter/content owner permits them. | FND-16 Victory/Optional Combat Rules; §§4,113–116,188 | Design | PRD-04/06/07; LFE combat |
| **REQ-CMB-003** | First- and third-person combat must consume the same authoritative hit/action truth; perspective may change camera, reticle and presentation assistance but not mechanics. | FND-16 §5 | Design | LFE combat; UX |
| **REQ-CMB-004** | Combat actions must be data-defined with stable identity, phases, equipment/capability requirements, target profile, resource requests, movement envelope, attack/defence profiles, conditions, interrupts and presentation references. | FND-16 §§8–10,339–342 | Design | PRD-04/06/07; LFE combat |
| **REQ-CMB-005** | Combat action execution must expose readable commitment/cancel/active/recovery phases and bounded configurable input buffering without hidden indefinite auto-chaining. | FND-16 §§10–12 | Design | PRD-04/06/07; LFE combat |
| **REQ-CMB-006** | Animation may expose timing markers but cannot authoritatively deal damage, spend ammunition, move actors outside the movement owner or complete a defence result. | FND-16 §§13–14 | Design | PRD-04/06/07; LFE combat |
| **REQ-CMB-007** | Combat must request Stamina costs from Set 29 and may not maintain a second combat Stamina pool. | FND-16 §§15–16 | Design/governance | LFE combat/biology interface |
| **REQ-CMB-008** | Combat may maintain short-lived Guard/Stability as tactical posture/control state distinct from biological Stamina/Fatigue and persistent Injury. | FND-16 §§17–19 | Design | PRD-04/06/07; LFE combat |
| **REQ-CMB-009** | Spell/mana validity and magical status remain Document-09-owned; Combat may add timing, interruption, targeting and tactical constraints only through declared interfaces. | FND-16 §§20–21 | Design/governance | LFE combat/magic interface |
| **REQ-CMB-010** | Each resolved combat hit/effect segment must produce one authoritative, uniquely identifiable final Damage Packet with source, target, contact, mitigation, penetration, final damage, exposure/condition requests and authority metadata. | FND-16 §§22–24 | Design | PRD-04/06/07; LFE combat |
| **REQ-CMB-011** | Damage resolution ordering must be deterministic and explicitly defined across contact, active defence, shield, armour/protection, wards/specialists, penetration/resistance, target consequence and evidence. | FND-16 §25 | Design + Engineering | PRD-04/06/07; LFE combat |
| **REQ-CMB-012** | Combat may not directly mutate biological Health, Injury, Bleeding, Poison, Disease, Fatigue or recovery; it submits resolved trauma/exposure to Set 29 and consumes the returned biological result. | FND-16 §§26–35; FR §7.17 | Design/governance | LFE combat/biology |
| **REQ-CMB-013** | Combat-owned tactical conditions such as stagger/guard break must remain distinct from specialist-owned biological, magical, movement and social states. | FND-16 §§47–56 | Design | PRD-04/06/07; LFE combat |
| **REQ-CMB-014** | Combat may request dodge, knockback, launch, recoil and action-movement envelopes but the movement owner must validate and execute physical displacement. | FND-16 §§52–58; 208; FR §7.17 | Design/governance | LFE combat/movement |
| **REQ-CMB-015** | Blocking, parrying, dodging and other active defences must resolve through explicit timing/geometry/capability windows rather than arbitrary client presentation. | FND-16 §§57–78 | Design | PRD-04/06/07; LFE combat |
| **REQ-CMB-016** | Weapon, shield and armour combat behaviour must be supplied as facets of the one canonical Item identity; Combat may not create duplicate weapon/gear identities or own persistent item durability/ownership. | FND-16 Gear Identity; §§80–81,129–139,323–346 | Design/governance | LFE item/combat; FCC-13 delta |
| **REQ-CMB-017** | Weapon mastery/progression may unlock moves/efficiency but cannot bypass physical reach, missing ammunition, collision, armour or other authoritative constraints. | FND-16 §§92–93 | Design | PRD-04/06/07; LFE combat |
| **REQ-CMB-018** | Physical ammunition must be real inventory/resource state for players and NPCs where required; firing/reloading must use authoritative reservation/consumption and cannot grant free NPC ammunition. | FND-16 §§94–103 | Design | LFE combat/inventory/logistics |
| **REQ-CMB-019** | Projectile runtime must preserve source/ownership/action identity and support authoritative hit validation, recovery/destruction and save/network policy for consequential projectiles. | FND-16 §§100–103,334 | Design + Engineering | PRD-03/04/06/07; LFE projectile |
| **REQ-CMB-020** | Stealth/combat alert must consume detection inputs and knowledge from the appropriate owners rather than turn combat into an omniscient perception system. | FND-16 §§105–110 | Design | LFE combat/perception interface |
| **REQ-CMB-021** | Surrender, capture and non-lethal outcomes must preserve personhood and route social willingness/political/legal consequences through their owning systems rather than mind-control or loot-category shortcuts. | FND-16 §§111–119,145; FR §7.17 | Design/governance | LFE combat/social/politics |
| **REQ-CMB-022** | Friendly-fire and PvP outcomes must be permission/world-rule/authority aware and server-authoritative in shared worlds. | FND-16 §§117–119 | Design/security | LFE multiplayer combat |
| **REQ-CMB-023** | Tactical AI may choose combat roles/actions/formations using actor/world context, but it may not directly own locomotion, biological truth, personhood or political state. | FND-16 §§140–155 | Design/governance | LFE AI/combat interface |
| **REQ-CMB-024** | Guard/militia effectiveness must be able to depend on real equipment, ammunition/supplies, staffing, readiness, routes and fortifications rather than hidden combat bonuses. | FND-16 §§149–155,164 | Design | LFE settlement/combat/logistics |
| **REQ-CMB-025** | Encounter runtime must support explicit context/objectives/start/end and objective-driven victory; engagement must remain distinct from political war state. | FND-16 §§157–163 | Design/governance | LFE encounter/events/politics |
| **REQ-CMB-026** | Raids must consume preparation and world-state evidence but their event lifecycle/political context remain owned by Document 15/13 while Combat owns physical resolution. | FND-16 §§163–164,325; FR §7.17 | Design/governance | LFE event/combat interfaces |
| **REQ-CMB-027** | Structure attacks must emit bounded structure Damage Packets and integrate with Structure/Block owners; combat must not assume universal freeform voxel destruction or collapse. | FND-16 §§165–179,312 | Design | LFE combat/structure |
| **REQ-CMB-028** | Fortifications, traps, automated defences and magical defences must contribute through real structures/networks/resources/conditions rather than decorative defence scores. | FND-16 §§169–176 | Design | LFE combat/structure/automation/magic |
| **REQ-CMB-029** | Authored boss/titan/realm-guardian identity, world role, phases/alternate outcomes and recurrence remain Atlas/FCC content-owned; Combat supplies reusable tactical execution and must not hardcode boss identity. | FND-16 §§180–195,299,313,326 | Design/governance | LFE combat; FCC content |
| **REQ-CMB-030** | Character-scale boarding combat may reuse Document-16 actions, but vessel-scale damage, flooding, sinking, capture and naval context remain Set-26-owned. | FND-16 §§196–203,301,315 | Design/governance | PRD Set26 extraction; LFE maritime/combat |
| **REQ-CMB-031** | Combat must respect realm/environment law and equipment protection interfaces without branching core combat code on hardcoded realm names. | FND-16 §§209–216 | Design | LFE realm/combat |
| **REQ-CMB-032** | Combat outcomes must emit stable/idempotent contribution and evidence records sufficient for quests/events/history/economy/politics without those systems re-simulating the fight. | FND-16 owned scope; evidence/validation sections | Design | LFE evidence bus |
| **REQ-CMB-033** | Combat must support bounded abstract/distant resolution that conserves ammunition, equipment state, casualties/injuries and named identities and reconciles consistently on promotion. | FND-16 Test Lab §317; combat LOD ownership | Design + Engineering | PRD-06/07; LFE combat LOD |
| **REQ-CMB-034** | Combat persistence must save only consequential tactical state needed to resume/reconcile—such as action phase, Guard/Stability, downed state, tactical conditions, encounter/projectile/contribution sequence state—without duplicating specialist-owned biology/item truth. | FND-16 §§331–337 | Design + Engineering | LFE persistence |
| **REQ-CMB-035** | Save/reload policy for mid-action, mid-projectile, downed and abstract battle states must be deterministic and transaction-safe. | FND-16 §§333–336 | Engineering | PRD-06/07; LFE persistence |
| **REQ-CMB-036** | Combat validation and regression suites must explicitly detect duplicate hits, duplicated biology/gear ownership, direct transform writes, personhood violations, naval reimplementation and POC-only hardcoding. | FND-16 §§294–317 | Evidence requirement | PRD-06/07/09 |


## 18.2 UI/UX, accessibility, world configuration and player-trust requirements — Document 17

| ID | Requirement | Source | Decision class | Downstream |
|---|---|---|---|---|
| **REQ-UX-007** | Every significant player-facing field must be traceable to its authoritative owner/source, view-model revision, observation time, knowledge state and permission state even when that provenance is hidden in ordinary presentation. | FND-17 §5 | Design | LFE UI/view models; FORGE-ENG where applicable |
| **REQ-UX-008** | UI view models must be read-only projections that may aggregate multiple systems but never become a new mutable gameplay record. | FND-17 §§6–7 | Design | LFE UI/view models; FORGE-ENG where applicable |
| **REQ-UX-009** | Player-facing information must be knowledge-filtered so server-authoritative hidden facts do not leak through maps, markets, realms, politics, tooltips, debug metadata or other UI. | FND-17 §§8,112,152,163–171,182–185 | Design | LFE UI/view models; FORGE-ENG where applicable |
| **REQ-UX-010** | UI must represent freshness/confidence/unknown/stale/rumoured state where relevant rather than present estimates as certain live truth. | FND-17 §§9–10,164–165 | Design | LFE UI/view models; FORGE-ENG where applicable |
| **REQ-UX-011** | Blocked or failed player actions must return stable reason codes, plain-language causes and safe corrective actions without those suggestions bypassing validation. | FND-17 §§11–13 | Design | LFE UI/view models; FORGE-ENG where applicable |
| **REQ-UX-012** | UI may issue intent commands and show bounded optimistic/pending feedback, but persistent success may only be shown after authoritative commit; requested/reserved/committing/committed/rejected/rolled-back states must be distinguishable when relevant. | FND-17 §§14–16 | Design | LFE UI/view models; FORGE-ENG where applicable |
| **REQ-UX-013** | False save, delivery, route, service, transaction or compatibility feedback is a production correctness defect, not cosmetic polish. | FND-17 §17 | Design + Evidence | PRD-06/07/09; LFE diagnostics |
| **REQ-UX-014** | Presentation styling must use semantic tokens and accessible equivalents; legibility and meaning must survive cultural/realm theming and cannot depend on colour alone. | FND-17 §§18–24 | Design | FORGE-ENG presentation; Set41 |
| **REQ-UX-015** | The product shell must separate runtime play, Forge/creation, world/content management, settings/accessibility and help/support without coupling gameplay IDs to branding/navigation structure. | FND-17 §§25–26 | Design | LFE UI/view models; FORGE-ENG where applicable |
| **REQ-UX-016** | Worlds must be first-class library records exposing identity, profile, simulation depth, difficulty, packs, multiplayer mode, save/backup health and compatibility/migration state rather than being hidden behind a single Continue action. | FND-17 §§27–31 | Design | LFE UI/view models; FORGE-ENG where applicable |
| **REQ-UX-017** | Recovery flows must preserve original data before repair and may offer retry/safe-mode/backup/migration/diagnostics, but must not silently delete structures/items/quests, regenerate explored worlds or drop unknown components. | FND-17 §§32–34 | Design + Compatibility | LFE persistence/recovery |
| **REQ-UX-018** | World creation must support quick, guided and expert paths with transparent defaults rather than require beginners to understand all advanced controls or prevent experts from accessing them. | FND-17 §§35–39 | Design | LFE UI/view models; FORGE-ENG where applicable |
| **REQ-UX-019** | Simulation Depth must be a first-class world/simulation configuration distinct from graphics/performance, difficulty, accessibility and render distance. | FND-17 §§40–51 | Design lock | LFE simulation/scalability; future Set35 |
| **REQ-UX-020** | Simulation-depth profiles may change modelling granularity and background complexity while protecting important named/player-relevant identities and authoritative outcomes. | FND-17 §§41–49 | Design + Engineering | PRD-04/06/07; LFE simulation |
| **REQ-UX-021** | Changing simulation depth after world creation must use explicit compatibility/migration rules and warnings rather than silently rewriting an existing world. | FND-17 §§49–50 | Compatibility | LFE migration; Set35 |
| **REQ-UX-022** | Device Performance Profile must be independently selectable/recommended and may alter presentation/update budgets without silently changing canonical game truth or simulation-depth promises. | FND-17 §§51–56 | Design + Engineering | LFE performance/scalability |
| **REQ-UX-023** | Performance recommendations must be presented as estimates with transparent limitations rather than guaranteed promises; worlds must not be silently downgraded because current hardware is weaker. | FND-17 §§53,74–76 | Design | LFE UI/view models; FORGE-ENG where applicable |
| **REQ-UX-024** | World generation settings that affect generated identity/history must declare whether they are generation-locked, safely mutable or migration-requiring. | FND-17 §§57–60 | Design + Compatibility | LFE worldgen/settings |
| **REQ-UX-025** | Difficulty/consequence, gameplay assistance and accessibility must remain distinct domains so accessibility options do not secretly alter difficulty unless explicitly chosen. | FND-17 §§61–67 | Design lock | LFE settings; Set41 |
| **REQ-UX-026** | Offline progression must distinguish safe local closed-time policy from continuously authoritative dedicated-server progression. | FND-17 §§68–70 | Design + Engineering | LFE time/persistence/server |
| **REQ-UX-027** | World/system settings must be dependency-aware; invalid combinations must be detected/explained rather than accepted into contradictory state. | FND-17 §§71–73 | Design + Evidence | LFE settings validation |
| **REQ-UX-028** | Content-pack selection/removal during world creation or management must expose compatibility/dependency consequences and prevent unsafe removal of gameplay-critical content. | FND-17 §§77–80 | Design + Compatibility | LFE packages; FORGE-ENG |
| **REQ-UX-029** | Player-facing Forge entry and developer-authority tooling must be separated so ordinary players cannot gain canonical edit/debug powers through the same interface. | FND-17 §§81–83 | Design/security | FORGE-ENG; future Set33 |
| **REQ-UX-030** | HUD must support minimal/contextual/preset/custom layouts and surface only timely relevant state while retaining critical warnings and accessibility equivalents. | FND-17 §§84–96 | Design | LFE UI/view models; FORGE-ENG where applicable |
| **REQ-UX-031** | Input must support full remapping, conflict detection, hold/toggle alternatives, configurable timing and device-independent action semantics. | FND-17 §§97–103 | Design | LFE input; Set34/41 |
| **REQ-UX-032** | Keyboard/mouse and controller must provide functional parity for core gameplay/UI flows, and split-screen must maintain independent focus/context for each local player. | FND-17 §§104–106 | Design + Engineering | PRD-03/06/07; LFE local players |
| **REQ-UX-033** | Inventory, crafting, building, Blueprint/project, automation, storage, magic, progression, social, economy, route, map, quest, civilisation, realm, ecology, combat and maritime UI must consume their specialist view models/reason codes instead of recreating domain logic. | FND-17 §§107–212 | Design/governance | LFE view-model adapters |
| **REQ-UX-034** | Inventory and crafting UI must correctly distinguish block inventory projections from distinct Items, permissions/reservations, recipe failure/substitution and queued transactional state. | FND-17 §§107–117 | Design | LFE inventory/crafting UI |
| **REQ-UX-035** | Building/project UI must expose placement/validation reasons, exact costs/reservations, worker/stage/blocker state, structure condition/restoration and authoritative commissioning status. | FND-17 §§118–123 | Design | LFE settlement/Forge UI |
| **REQ-UX-036** | Automation/logistics UI must expose status, direction, capacity, blockage, destination and source-owned reason codes without inventing flow that the authoritative network did not commit. | FND-17 §§124–128 | Design | LFE UI/view models; FORGE-ENG where applicable |
| **REQ-UX-037** | Maps, route planning, markets, Chronicle/history and realm-network views must respect viewer knowledge and may represent unknown/estimated/stale information rather than omniscient world state. | FND-17 §§149–171,182–185 | Design | LFE UI/view models; FORGE-ENG where applicable |
| **REQ-UX-038** | Notifications/alarms must have severity, relevance, deduplication/quiet-mode and accessibility semantics sufficient to avoid spam while preserving critical safety information. | FND-17 §§205–213 | Design | LFE notification service; Set41 |
| **REQ-UX-039** | Accessibility metadata/equivalent channels must be available to UI, audio, captions, VFX and critical gameplay signals from the start rather than added only during final certification. | FND-17 accessibility sections; FR §7.18 | Design lock | LFE/FORGE-ENG; Set41 |
| **REQ-UX-040** | Localisation must use stable localisation keys/arguments and layouts must support text expansion, plural/gender/number needs where relevant, glyph swapping, scalable text and font fallback. | FND-17 typography/reflow/localisation sections | Design | FORGE-ENG/LFE localisation |
| **REQ-UX-041** | UI state restoration after save/load/reconnect must never imply committed game state that the authoritative world did not restore. | FND-17 Player Trust/Recovery; §115+ | Design + Compatibility | LFE persistence/UI |
| **REQ-UX-042** | Advanced/debug provenance and technical detail may be exposed to authorised users/developers, but ordinary UI must remain understandable without requiring raw IDs or internal codes. | FND-17 §§5,11–13; developer-tool sections | Design | LFE UI/view models; FORGE-ENG where applicable |


## 18.3 Retained engine-neutral technical-architecture requirements — Document 18

These records preserve Foundation-18 requirements that remain valid after the Summer-specific implementation direction was superseded. Exact Godot/Zylann module choices, paths, class names and third-party technology decisions remain for PRD-02/03/04 and later LFE.

| ID | Requirement | Source | Decision class | Downstream |
|---|---|---|---|---|
| **REQ-ARCH-001** | The production architecture must keep authoritative gameplay truth in stable records/services rather than scene-node lifetime; runtime Nodes are representations, not the database. | FND-18 §§2.1–2.4 | Architecture constraint | PRD-02/03/04/06/07; LFE |
| **REQ-ARCH-002** | Canonical definitions must be runtime-immutable; mutable instance state must use stable runtime identity and version/revision semantics. | FND-18 §§2.3–2.4,26 | Architecture constraint | PRD-02/03/04/06/07; LFE |
| **REQ-ARCH-003** | Runtime communication must distinguish read-only queries, intent commands, committed transactions and factual events/evidence, with idempotency for persistent consequences. | FND-18 §§2.5–2.9,30–39 | Architecture constraint | PRD-02/03/04/06/07; LFE |
| **REQ-ARCH-004** | Determinism must be explicitly scoped: authoritative generation/transactions/catch-up require stable random streams while purely presentational randomness may remain non-authoritative. | FND-18 §§2.9,48–49 | Architecture constraint | PRD-02/03/04/06/07; LFE |
| **REQ-ARCH-005** | Performance/scalability mechanisms may change representation/work frequency but may not silently rewrite authoritative outcomes or ownership. | FND-18 §2.10; §§138–146,195–197 | Architecture constraint | PRD-02/03/04/06/07; LFE |
| **REQ-ARCH-006** | Canonical authoring/interchange data and generated runtime engine resources must remain separate so generated products can be rebuilt deterministically from source. | FND-18 §§8–10,23–24,164–167 | Architecture constraint | LFE registries; FORGE-ENG |
| **REQ-ARCH-007** | Runtime identity must not depend on engine asset paths, scene names, voxel palette/model indices or array positions; stable namespaced IDs/ULIDs and aliases/tombstones must bridge persistence and content changes. | FND-18 §§11–16,26–27 | Architecture constraint | LFE identity/migration |
| **REQ-ARCH-008** | Content packs must have namespaces, versions, dependencies, hashes/load resolution and a world/session lockfile or equivalent compatibility record; pack removal must be validated/migrated rather than silently accepted. | FND-18 §§17–21 | Architecture constraint | LFE packages; FORGE-ENG |
| **REQ-ARCH-009** | The world address/spatial-frame model must distinguish fixed world/realm coordinates from moving local frames such as vessels and provide explicit conversions rather than treating all objects as one static coordinate space. | FND-18 §§27–29 | Architecture constraint | LFE spatial model; Set26 |
| **REQ-ARCH-010** | World time and scheduling must be authoritative and support application-closed time policy, bounded scheduler work, backlog visibility and deterministic catch-up. | FND-18 §§40–47 | Architecture constraint | LFE time/scheduler |
| **REQ-ARCH-011** | Asynchronous workers may calculate derived/results off-thread but may not perform unsafe background mutation of authoritative world state; ownership/commit boundaries must be explicit. | FND-18 §§42–47 | Architecture constraint | LFE jobs/threading |
| **REQ-ARCH-012** | Voxel edits must be transaction/batch capable, revision-aware and dirty only affected regions for meshing/collision/lighting/navigation rather than trigger unbounded synchronous whole-world rebuilds. | FND-18 §§50–61 | Architecture constraint | PRD-02/06/07; LFE voxel integration |
| **REQ-ARCH-013** | World generation stages and generator versions must be explicit, deterministic/repairable and persist explored/stateful results as generated base plus deltas rather than retroactively regenerate history. | FND-18 §§64–70 | Architecture constraint | LFE worldgen/persistence |
| **REQ-ARCH-014** | Navigation products must have revisions/invalidation and support local pathfinding plus long-distance route/journey planning without one global navigation representation. | FND-18 §§79–86 | Architecture constraint | LFE navigation |
| **REQ-ARCH-015** | Runtime systems for structures, NPCs, creatures, economy, social state, biology, magic, automation, quests/events, combat and maritime must preserve their specialist ownership while using common identity/time/evidence/persistence infrastructure. | FND-18 §§89–114 | Architecture constraint | PRD-04; LFE domain boundaries |
| **REQ-ARCH-016** | UI runtime must consume read-only view-model adapters at bounded update cadences rather than poll/mutate raw domain state directly. | FND-18 §§115–118 | Architecture constraint | LFE UI |
| **REQ-ARCH-017** | Settings runtime must separate performance profile, simulation depth, consequence/difficulty and accessibility as independent configuration domains with explicit migration/compatibility policy. | FND-18 §§119–123 | Architecture constraint | LFE settings |
| **REQ-ARCH-018** | Save architecture must be partitionable/sharded, atomic at commit boundaries, journalled/backup-capable, integrity checked, migratable and recoverable after interruption or missing content. | FND-18 §§124–137 | Architecture constraint | PRD-06/07; LFE persistence |
| **REQ-ARCH-019** | Derivable caches/meshes/indexes must be disposable/rebuildable and must not become the sole source of canonical world truth. | FND-18 §137; §§330–331 | Architecture constraint | LFE cache policy |
| **REQ-ARCH-020** | Simulation LOD must use explicit presence/promote/demote/catch-up semantics; LOD is representation, not alternate truth, and full simulation still requires bounded budgets. | FND-18 §§138–146 | Architecture constraint | LFE simulation |
| **REQ-ARCH-021** | Multiplayer must use authoritative consequential state, stable network identity, interest management, revisions/snapshots, reconnect handling and bounded replication rather than world-wide high-frequency replication. | FND-18 §§147–160 | Architecture constraint/security | PRD-03/06/07; LFE multiplayer |
| **REQ-ARCH-022** | Mod/player-content execution is a security boundary; data content should be admitted before executable scripting, and gameplay-critical content must be hash/dependency compatible in shared worlds. | FND-18 §§161–163,317 | Architecture constraint/security | LFE packages; FORGE-ENG; Set37 |
| **REQ-ARCH-023** | Forge authoring must remain separate from runtime products and emit bake metadata/provenance sufficient to rebuild generated assets and diagnose the source of runtime content. | FND-18 §§164–168 | Architecture constraint | FORGE-ENG |
| **REQ-ARCH-024** | Structured logs, build identity, world signature and bounded diagnostics bundles must exist as first-class technical systems and avoid depending on user-visible free-form output as the only evidence. | FND-18 §§169–173 | Architecture/process constraint | LFE diagnostics; Set40 |
| **REQ-ARCH-025** | Validation/test infrastructure must have stable validator/test identities, layered positive/negative/headless/scenario evidence and retained artefacts sufficient to prove registry, conservation, save, LOD, networking and performance behaviour. | FND-18 §§174–188 | Evidence requirement | PRD-06/07/08/09; LFE tests |
| **REQ-ARCH-026** | Performance must be measured in packaged representative scenarios with explicit CPU/GPU/memory/worldgen/save/network/backlog/asset budgets and regression policy rather than editor feel alone. | FND-18 §§189–206 | Evidence requirement | PRD-06/07/08; LFE budgets |
| **REQ-ARCH-027** | Accessibility/localisation/audio/VFX/presentation adapters must consume semantic authoritative events and provide equivalent channels; accessibility may change presentation but must not silently suppress authoritative events. | FND-18 §§207–214 | Architecture constraint | LFE/FORGE-ENG; Set41 |
| **REQ-ARCH-028** | Physics must have an explicit fixed-step/frame-step ownership boundary and tolerance-based deterministic tests where floating-point exact equality is inappropriate. | FND-18 §§215–219 | Architecture constraint | PRD-03/06/07; LFE physics |
| **REQ-ARCH-029** | High-volume world state should favour data-oriented services/records with promotion to Nodes only for active physical/presentation needs, and demotion must preserve authoritative state. | FND-18 §§220–222 | Architecture constraint | LFE entity/simulation |
| **REQ-ARCH-030** | Global/autoload services must be limited and world/session/domain context must be injectable/separable so multiple worlds/sessions/tests do not share accidental mutable globals. | FND-18 §§223–230 | Architecture constraint | LFE application/world contexts |
| **REQ-ARCH-031** | Reservations and cross-domain transactions must support explicit result/reason records, compensation/retry/idempotency and history instead of ad-hoc partial mutation. | FND-18 §§232–239 | Architecture constraint | LFE transactions |
| **REQ-ARCH-032** | Canonical source provenance, deterministic/reproducible builds and CI change-scope validation must be retained as production requirements even though exact repository paths/tools from the Summer-era plan are superseded. | FND-18 §§243–250; FR §7.19 | Process constraint | LFE development architecture |
| **REQ-ARCH-033** | Architecture decisions and technical debt/waivers must be recorded with evidence, and broad code tasks must be decomposed into bounded contracts with explicit allowed files/tests/rollback. | FND-18 §§251–268 | Process constraint | LFE development/change control |
| **REQ-ARCH-034** | Implementation/release gates must prove a representative vertical slice across registries, persistence, worldgen, LOD, living simulation, gameplay and validation before bulk content conversion. | FND-18 §§257–290 | Process + Evidence | PRD-09; LFE rebuild staging |
| **REQ-ARCH-035** | The shipped runtime must be able to operate offline without Summer Engine, remote AI or generative services; those tools may assist development but cannot be runtime dependencies or authority. | FND-18 header; §§4,313–314 | Architecture constraint | LFE deployment |
| **REQ-ARCH-036** | Legacy Unreal/Summer-specific module/path/class assumptions are historical implementation provenance only; PRD/LFE must remap retained requirements onto the current Godot + Zylann candidate architecture after audit/prototypes. | FND-18 §1; FR §7.19; PRD-00 DNL-004/017 | Process/compatibility | PRD-02/03/04; LFE |


## 18.4 Settlement planning and player Blueprint requirements — Document 19

| ID | Requirement | Source | Decision class | Downstream |
|---|---|---|---|---|
| **REQ-PLAN-001** | Settlement planning must treat reusable Blueprint definitions, settlement-plan rules, parcels/districts, project proposals, construction projects and placed Structure Instances as separate linked layers with stable identity. | FND-19 §§3–4 | Design | LFE settlement planning; FORGE-ENG Blueprint tools |
| **REQ-PLAN-002** | The in-world player designer and main-menu player Blueprint Workshop must share the same edit-command, validation, stage, palette, marker and serialisation core rather than maintain incompatible editors. | FND-19 §§3.2,6,24.5 | Design | LFE settlement planning; FORGE-ENG Blueprint tools |
| **REQ-PLAN-003** | Player Blueprint tooling must remain compatible with the developer Blueprint Forge while preserving distinct player/developer permissions and canonical-authoring authority. | FND-19 §§3.3,24.4–24.5 | Design/security | FORGE-ENG |
| **REQ-PLAN-004** | Blueprint definitions must remain immutable source/version records while runtime project/structure/settlement state persists separately. | FND-19 §§4.1,23 | Design | LFE settlement planning; FORGE-ENG Blueprint tools |
| **REQ-PLAN-005** | Blueprints require stable IDs, bounds/pivot/cells/stages/tokens/markers/dependencies and stable internal element identity sufficient for migration and local deltas. | FND-19 §§4,8,19 | Design | LFE settlement planning; FORGE-ENG Blueprint tools |
| **REQ-PLAN-006** | Blueprint composition must support nested reusable components plus bounded optional/weighted parts without turning each variation into an unrelated definition. | FND-19 §§5–5.2 | Design | LFE settlement planning; FORGE-ENG Blueprint tools |
| **REQ-PLAN-007** | Player editing must support undo/history/safety and distinguish creative geometric freedom from functional validity/approval. | FND-19 §§7–7.2 | Design | FORGE-ENG editor |
| **REQ-PLAN-008** | Blueprint voxel/source storage must be compact, bounded and versioned; player edits after construction must persist as instance/world deltas rather than rewriting official source. | FND-19 §§8–8.2 | Design + Compatibility | LFE persistence; FORGE-ENG |
| **REQ-PLAN-009** | Material tokens/palettes/style kits must resolve semantic construction roles to valid current materials while keeping culture/biome/realm presentation separate from universal functional identity. | FND-19 §§9–9.2 | Design | FORGE-ENG; FCC-12/13 delta |
| **REQ-PLAN-010** | Construction intake must calculate exact resource requirements from resolved blueprint stages/palette and use authoritative reservations/activation gates rather than hidden approximate costs. | FND-19 §§10–10.3 | Design | LFE construction/resources |
| **REQ-PLAN-011** | Functional markers/rooms/jobs/sockets/utilities are semantic declarations that require validation against real geometry/access/owner-system contracts; marker presence alone cannot manufacture service. | FND-19 §§11–11.1 | Design/governance | LFE/Document20 interface |
| **REQ-PLAN-012** | Site validation must consider terrain, slope, water, protected edits, foundations, access, routes, hazards and world constraints in an ordered deterministic process. | FND-19 §§12–12.2 | Design + Engineering | PRD-02/04/06/07 |
| **REQ-PLAN-013** | Player overrides of site/terrain warnings must be explicit and permission/safety bounded; overrides cannot bypass protected anchors, ownership or impossible functional requirements. | FND-19 §12.2 | Design/security | LFE settlement planning; FORGE-ENG Blueprint tools |
| **REQ-PLAN-014** | Settlements must be planned as dynamic networks of parcels, roads, clusters, districts and expansion rules rather than fixed copied city layouts. | FND-19 §§13–13.4 | Design | LFE settlement planner |
| **REQ-PLAN-015** | A Settlement Plan is a persistent rule/state structure for growth and layout, not a fixed geometry blueprint. | FND-19 §13.2 | Design | LFE settlement planning; FORGE-ENG Blueprint tools |
| **REQ-PLAN-016** | Settlement growth stages must use explicit readiness gates across population, seven needs, safety, jobs, infrastructure, specialists and other required evidence rather than stage-by-timer or appearance. | FND-19 §§14–14.5 | Design | LFE settlement progression |
| **REQ-PLAN-017** | Growth stage must not force one architectural appearance; culture/style packs and player plans may satisfy the same capability through different validated forms. | FND-19 §14.2 | Design | LFE settlement planning; FORGE-ENG Blueprint tools |
| **REQ-PLAN-018** | Settlement planning must consume the closed seven-need model and expose readiness/blockers without replacing the specialist systems that produce need demand/capacity evidence. | FND-19 §§14.4–14.5 | Design/governance | LFE planning/service interface |
| **REQ-PLAN-019** | Autonomous project selection must score real needs, available land/routes/resources/labour, culture/policy/history, risk and player constraints and must suppress repetitive/spam proposals. | FND-19 §§15–15.4 | Design + Engineering | LFE planner; PRD-06/07 |
| **REQ-PLAN-020** | Emergency planning must be able to reprioritise repair, shelter, defence, health, logistics and other urgent work from authoritative world conditions. | FND-19 §15.5 | Design | LFE settlement planning; FORGE-ENG Blueprint tools |
| **REQ-PLAN-021** | Nearby NPC construction must use real labour, routes, tools, inventories/reservations and visible staged placement; distant construction may use bounded summary progress but must conserve the same inputs/outputs/state. | FND-19 §§16–16.5,23.4 | Design + Engineering | PRD-06/07; LFE construction LOD |
| **REQ-PLAN-022** | Construction task scheduling must support interruption/failure/retry without consuming impossible resources or silently completing unreachable work. | FND-19 §§16.2–16.3 | Design | LFE settlement planning; FORGE-ENG Blueprint tools |
| **REQ-PLAN-023** | Wages/contracts/finance for construction remain Set-27-owned even when planning uses them as project constraints. | FND-19 §16.5; Production reconciliation | Design/governance | Set27 extraction |
| **REQ-PLAN-024** | Players must be able to propose compatible designs to existing settlements, receive clear approval/rejection reasons and remain subject to ownership, law, culture, resources and planning constraints. | FND-19 §§17–17.2 | Design | LFE planner/permissions/UI |
| **REQ-PLAN-025** | Player-founded settlements may use custom town styles/plans but their residents, economy, social life and services must remain autonomous specialist-owned simulation rather than player-owned puppets. | FND-19 §§18–18.3 | Design | LFE settlement planning; FORGE-ENG Blueprint tools |
| **REQ-PLAN-026** | Blueprint libraries/packages require manifests, versions, dependencies, compatibility/migration and safe removal/rebinding rules. | FND-19 §§19–20 | Design + Compatibility | LFE packages; FORGE-ENG |
| **REQ-PLAN-027** | Imported/shared player Blueprint content must be data-only or otherwise pass explicit security admission; malformed, oversized, missing-dependency or executable imports must not corrupt the library/world. | FND-19 §§20–20.3 | Design/security | FORGE-ENG; Set37 |
| **REQ-PLAN-028** | Damage, repair, renovation and upgrades must preserve structure identity/provenance and player edits or explicitly resolve incompatible deltas instead of replacing the building invisibly. | FND-19 §§21–21.2 | Design + Compatibility | LFE structures/migration |
| **REQ-PLAN-029** | Planning/Blueprint contracts must expose automation, magic, defence, utility, road, waterfront and megaproject sockets/requirements without becoming owner of those specialist networks. | FND-19 §§22–22.3 | Design/governance | LFE settlement planning; FORGE-ENG Blueprint tools |
| **REQ-PLAN-030** | Settlement planning must support explicit P0–P3 planning fidelity from active through dormant scheduled state with invariant identity, reservations, costs, history and committed project outcomes. | FND-19 §§23.1–23.4 | Design + Engineering | LFE simulation LOD |
| **REQ-PLAN-031** | Host/server authority must govern persistent Blueprint/project admission, reservations, placement and shared settlement-plan mutations; clients may preview but cannot commit authoritative construction. | FND-19 §§23.5–23.6 | Design/security | LFE multiplayer |
| **REQ-PLAN-032** | Collaborative Blueprint/planning edits require revision/conflict handling rather than last-writer-wins corruption. | FND-19 §23.6 | Design + Engineering | PRD-03/06/07; FORGE-ENG |
| **REQ-PLAN-033** | Settlement/Blueprint tooling must expose stable reason codes and validation for functional house access, construction, road/waterfront placement, package removal, distant reconciliation and multiplayer cases. | FND-19 §§35–36 | Evidence requirement | PRD-06/07/09; FORGE-ENG |
| **REQ-PLAN-034** | Production generation/planning must not depend on the archived Forest-Hamlet cottage/watchtower fixture; that scenario may remain as regression evidence only. | FND-19 §§27,32,37 | Governance + Evidence | PRD-09 |
| **REQ-PLAN-035** | Official content scale targets and player Blueprint complexity must remain budgeted/validated so creator freedom cannot create unbounded voxel/source/runtime cost. | FND-19 §§26,33 | Design + Engineering | PRD-06/07; FORGE-ENG certification |


## 18.5 Buildings, functional services, construction and project requirements — Document 20

| ID | Requirement | Source | Decision class | Downstream |
|---|---|---|---|---|
| **REQ-BLD-001** | Universal building/function identity, Blueprint source, ConstructionProject, StructureInstance and settlement planner state must remain separate linked records with explicit owners. | FND-20 Purpose; §§5,11–12,23; Completion | Design/governance | LFE building/service/construction; FORGE-ENG |
| **REQ-BLD-002** | Leyforge settlement capability must use exactly seven top-level needs—Housing, Provisions, Health, Work, Safety, Infrastructure and Morale—while specialist systems remain owners of lower-level biological/economic/social/movement truth. | FND-20 §7; FR §7.21 | Design lock | LFE settlement service model |
| **REQ-BLD-003** | A structure contributes to a need only through active authoritative ServiceRecord evidence; names, signs, visual appearance or markers alone may not create capability. | FND-20 §§7.2,24.2 | Design lock | LFE building/service/construction; FORGE-ENG |
| **REQ-BLD-004** | Effective service capacity must be derived from declared capacity plus physical validity, staffing, inputs/stock, networks/utilities, permissions/ownership, access/routes, condition/safety and specialist modifiers as applicable. | FND-20 §8 | Design | LFE building/service/construction; FORGE-ENG |
| **REQ-BLD-005** | Document-20 service aggregation must consume specialist snapshots/decisions and may not duplicate price, Trust, Health, Stamina, traversal, berth compatibility or combat formulas. | FND-20 §8.2 | Design/governance | LFE building/service/construction; FORGE-ENG |
| **REQ-BLD-006** | Service/need status must expose coverage/reserve/trend/blockers/freshness in player-readable bands and explain cause rather than collapse civilisation into one score. | FND-20 §§8.3–8.5 | Design | LFE settlement UI/planner |
| **REQ-BLD-007** | Markers, semantic zones and sockets must use typed stable contracts and are declarations for validation/integration, not independent gameplay truth. | FND-20 §9 | Design | FORGE-ENG semantic contracts |
| **REQ-BLD-008** | Material roles and culture/biome/realm/state packs must resolve presentation/construction alternatives deterministically while preserving universal function and physical safety. | FND-20 §10 | Design | FORGE-ENG; FCC-12/13 |
| **REQ-BLD-009** | Official editable Blueprint Forge source must remain separate from derived runtime bake products; generated meshes/collisions/previews/caches are rebuildable products, not the only source. | FND-20 §11 | Design/governance | FORGE-ENG |
| **REQ-BLD-010** | ConstructionProjects must use explicit stage graphs with real resource reservations, labour/tools/routes and atomic stage commits; reservations are not consumption. | FND-20 §12 | Design | LFE construction transactions |
| **REQ-BLD-011** | Player direct building and autonomous NPC/project construction must converge on the same authoritative placed-world/resource/permission truth rather than maintain separate fake construction economies. | FND-20 §§12.8,24 | Design | LFE building/service/construction; FORGE-ENG |
| **REQ-BLD-012** | Building/project lifecycle must support planned, under construction, commissioning, operational, impaired/offline, damaged, occupied/corrupted/restoring, upgraded/converting and removed/ruined states with explicit precedence. | FND-20 §§13,16 | Design | LFE lifecycle state |
| **REQ-BLD-013** | A completed building may provide partial functionality only through declared independent services; completion alone does not activate every possible function. | FND-20 §14 | Design lock | LFE building/service/construction; FORGE-ENG |
| **REQ-BLD-014** | Commissioning must validate current geometry/access/staffing/input/network/permission/condition contracts before a service becomes active. | FND-20 §§14.1–14.3 | Design | LFE building/service/construction; FORGE-ENG |
| **REQ-BLD-015** | Upgrades/conversions must use explicit deltas/inheritance and preserve identity/history/player modifications where compatible; a true new definition is required only for a genuine functional identity change. | FND-20 §15 | Design + Compatibility | LFE building/service/construction; FORGE-ENG |
| **REQ-BLD-016** | Damage, repair, occupation, conquest, corruption and restoration must be state/delta changes on persistent structures/services unless an explicit identity conversion is justified. | FND-20 §16 | Design | LFE building/service/construction; FORGE-ENG |
| **REQ-BLD-017** | Placement must validate parcel/terrain/foundation/access/protection/route/waterfront and specialist constraints before construction/commissioning. | FND-20 §17 | Design + Engineering | PRD-02/06/07 |
| **REQ-BLD-018** | Physical access infrastructure must remain separate from mover-specific accessibility; Document 20 may require an entrance/route but Set 30/26 determines whether a given mover can traverse it. | FND-20 §17.3 | Design/governance | LFE movement/building |
| **REQ-BLD-019** | Waterfront/port facilities require specialist water, berth, depth, route and maritime validation rather than ordinary land-building assumptions. | FND-20 §17.4; §30.2 | Design | Set26 extraction |
| **REQ-BLD-020** | Roads, storage, fixed logistics, power, mana, fluids and port connections must expose typed network/socket dependencies while their specialist systems own actual network truth. | FND-20 §18 | Design/governance | LFE building/service/construction; FORGE-ENG |
| **REQ-BLD-021** | Residents/households/jobs/staffing/occupancy must reference Document-07/Set-28/29/30 person/social/biology/movement truth rather than duplicate people inside buildings. | FND-20 §19 | Design/governance | LFE building/service/construction; FORGE-ENG |
| **REQ-BLD-022** | Production/market/health/social/cultural buildings must expose physical service/input/output/capacity contracts while Set 27/28/29 and other specialists own prices, social meaning and biological outcomes. | FND-20 §20 | Design/governance | LFE building/service/construction; FORGE-ENG |
| **REQ-BLD-023** | Maintenance must be persistent, resource/labour/network/condition aware and capable of reducing service when neglected rather than being purely cosmetic decay. | FND-20 §20.5 | Design | LFE building/service/construction; FORGE-ENG |
| **REQ-BLD-024** | Settlement stage is a planning expectation, not an automatic service grant; settlements may develop non-linearly when required functions/equivalents are satisfied. | FND-20 §21 | Design lock | LFE building/service/construction; FORGE-ENG |
| **REQ-BLD-025** | Building/function metadata must distinguish required, optional, conditional and strategic roles and permit validated functional equivalents instead of one mandatory visual building per need. | FND-20 §22 | Design | LFE building/service/construction; FORGE-ENG |
| **REQ-BLD-026** | Document 20 must provide functional requirements/capacity/project definitions to Document 19, while Document 19 owns proposal selection, parcel/district planning and growth orchestration. | FND-20 §23 | Design/governance | PRD-04 |
| **REQ-BLD-027** | Emergency projects may be proposed from authoritative urgent demand but must still obey resources, labour, access, permissions and specialist constraints. | FND-20 §23.4 | Design | LFE building/service/construction; FORGE-ENG |
| **REQ-BLD-028** | Player Blueprint acceptance into settlements must validate actual contracts/permissions; a player cannot create service by inserting semantic markers into arbitrary geometry. | FND-20 §24 | Design/security | LFE building/service/construction; FORGE-ENG |
| **REQ-BLD-029** | Complexes/megaprojects/wonders must be composable from multiple structures/projects/services while retaining explicit component identity, dependencies, partial activation, damage and persistence. | FND-20 §25 | Design + Engineering | LFE megaprojects |
| **REQ-BLD-030** | World-generated structures and ruins may consume Document-20 function/activation/restoration contracts without turning worldgen identity into a duplicate building definition. | FND-20 §26 | Design/governance | LFE building/service/construction; FORGE-ENG |
| **REQ-BLD-031** | ConstructionProject and ServiceRecord state must persist across unload/reload and LOD; distant simulation may summarize but cannot fabricate stock, labour, damage, activation or service. | FND-20 §27 | Design + Engineering | LFE persistence/LOD |
| **REQ-BLD-032** | Host/server authority must commit project creation, reservations, construction stages, building changes, service activation, demolition and authoritative cancellation in multiplayer. | FND-20 §27.5 | Design/security | LFE multiplayer |
| **REQ-BLD-033** | Building/Forge validation must cover schema/identity, dependency/version, voxel source, semantics, navigation/entity compatibility, stages/resources, deltas, terrain, networks, performance, activation and package/save/multiplayer compatibility. | FND-20 §28 | Evidence requirement | PRD-06/07/09; FORGE-ENG |
| **REQ-BLD-034** | Diagnostics must provide stable code, severity, affected element, plain-language explanation, why-it-matters and corrective/exception path. | FND-20 §28.3 | Design + Evidence | LFE diagnostics; FORGE-ENG |
| **REQ-BLD-035** | Runtime building/service performance must avoid Node-per-decorative-block designs, recalculate only affected services via event/revision invalidation and keep simulation depth separate from device performance profile. | FND-20 §33.3 | Architecture constraint | PRD-03/06/07; LFE |
| **REQ-BLD-036** | Current protected catalogue IDs may not be renumbered/reused/casually deleted; the 120-definition count is a reconciled baseline pending functional-distinction audit, not a permanent hard ceiling. | FND-20 Companion Status; §29.4; Acceptance | Compatibility/governance | FCC-13/Set20 companion reconciliation |
| **REQ-BLD-037** | New universal building definitions require a genuine new functional/planner/network/staffing/risk/construction/world-state distinction; ordinary visual variants/capacity increases belong in profiles/modules/packs/upgrades. | FND-20 §5.3 | Design lock | LFE building/service/construction; FORGE-ENG |
| **REQ-BLD-038** | Production building content must be validated across representative generated settlements, maritime facilities, multiplayer/scale/recovery and not only the archived POC fixture. | FND-20 §§28,31,34; Acceptance | Evidence requirement | PRD-06/07/09 |


# 19. Round-5 Unknowns / Evidence Gaps

| ID | Unknown / evidence gap | Resolution route |
|---|---|---|
| **UNK-CMB-001** | What exact combat tick/rollback/hit-validation model gives responsive melee/ranged play under latency without allowing duplicate hits or client-authoritative damage? | PRD-03/04/06/07; future Set31 |
| **UNK-CMB-002** | What hit-volume/reach/animation-marker representation works reliably for first/third person, voxel terrain and variable actor body sizes? | PRD-03/06/07 |
| **UNK-CMB-003** | How are projectiles simulated/persisted/networked across active-to-distant transitions without one Node/physics body per irrelevant projectile? | PRD-03/04/06/07 |
| **UNK-CMB-004** | What combat-LOD abstraction preserves ammunition, equipment wear, injuries, named actors and tactical objectives while remaining equivalent enough to active simulation? | PRD-04/06/07 |
| **UNK-CMB-005** | What deterministic save policy resumes versus cancels mid-action/mid-projectile combat after save/load or crash? | PRD-04/06/07 |
| **UNK-CMB-006** | What structure-damage granularity/collapse rules provide meaningful siege without unbounded voxel physics/rebuild cost? | PRD-02/03/06/07; Structure owner |
| **UNK-CMB-007** | How should large formations/guards/raids schedule tactical AI and pathing without O(N²) awareness or command cost? | PRD-03/04/06/07 |
| **UNK-CMB-008** | What server/world-rule model reconciles PvP, friendly fire, surrender/capture and legal consequences across shared worlds? | PRD-04/06; future Set31 |
| **UNK-UX-001** | What view-model cache/revision architecture keeps many complex screens fresh without polling every domain or leaking hidden truth? | PRD-03/04/06/07 |
| **UNK-UX-002** | What simulation-depth profile values and domain knobs are understandable to players while still mapping to measurable bounded workloads? | PRD-04/06/07; future Set35 |
| **UNK-UX-003** | How should existing worlds migrate when simulation depth is increased/decreased after years of history without fabricating missing historical detail? | PRD-04/06/07; Set35/39 |
| **UNK-UX-004** | What hardware recommendation model can estimate CPU/GPU/RAM risk for a world profile without promising performance it cannot guarantee? | PRD-03/06/07; Set34/35 |
| **UNK-UX-005** | What notification deduplication/priority/quiet-mode policy prevents large simulations from overwhelming the player while preserving critical alarms? | PRD-04/06/07; Set41 |
| **UNK-UX-006** | What accessible equivalent-channel schema should every gameplay/presentation event carry for captions, non-colour cues, reduced motion/flash and assistive technologies? | PRD-04; FORGE-ENG; Set41 |
| **UNK-UX-007** | How are split-screen/local-player independent focus, safe areas and knowledge views implemented without duplicated global UI state? | PRD-03/04/06/07 |
| **UNK-UX-008** | How much advanced provenance/technical detail should ordinary players see versus developer/admin modes while maintaining debuggability and trust? | PRD-04; Set34/40 |
| **UNK-ARCH-001** | What exact Godot + Zylann ownership boundary replaces the Summer-specific voxel/runtime portions of Foundation 18? | PRD-02/03/04 |
| **UNK-ARCH-002** | What spatial shard/region/chunk hierarchy and world-address format best supports Minecraft-scale Overworlds, separate realms and moving vessel frames? | PRD-02/03/04/06/07 |
| **UNK-ARCH-003** | What scheduler/job architecture and single-writer commit model should enforce bounded async work inside Godot without unsafe background mutation? | PRD-03/04/06/07 |
| **UNK-ARCH-004** | What save partition/journal/atomic-commit scheme safely coordinates world/shard/entity/registry state and still permits recovery after process kill? | PRD-03/04/06/07 |
| **UNK-ARCH-005** | Which caches/derived products are cheap enough to rebuild and which need persisted acceleration metadata for very large long-lived worlds? | PRD-03/04/06/07 |
| **UNK-ARCH-006** | What authoritative network protocol/transport/serialization should carry voxel deltas, snapshots, simulation state and transactions? | PRD-03/04/06/07; future Set31 |
| **UNK-ARCH-007** | What content-pack/mod sandbox is feasible in Godot while preventing executable player content from gaining canonical/world authority? | PRD-03/04/06/07; future Set33/37 |
| **UNK-ARCH-008** | What minimum diagnostics/profiling counters must exist in the first new foundation build to make later budgets auditable? | PRD-03/06/07 |
| **UNK-ARCH-009** | What representative hardware classes and packaged benchmark scenarios define initial CPU/GPU/RAM/save/network budgets? | PRD-03/06/07 |
| **UNK-ARCH-010** | What tolerance/determinism policy distinguishes exact deterministic state from physics results that require bounded tolerance/reconciliation? | PRD-03/04/06/07 |
| **UNK-PLAN-001** | What compact editable Blueprint cell/shape representation scales from cottages to megaprojects while remaining diffable, migratable and Forge-friendly? | PRD-02/03/04/06/07; FORGE-ENG |
| **UNK-PLAN-002** | What shared editor-core architecture can serve in-world and main-menu Blueprint creators without coupling editor UI to runtime scene state? | PRD-03/04; FORGE-ENG |
| **UNK-PLAN-003** | What deterministic site-fit/foundation solver should estimate cut/fill/support/water/route impacts for large blueprints without blocking the frame? | PRD-02/03/06/07 |
| **UNK-PLAN-004** | How should autonomous settlement planners rank projects/districts over long horizons without proposal spam, oscillation or expensive global rescoring? | PRD-04/06/07 |
| **UNK-PLAN-005** | How are player-authored Blueprint versions upgraded when already-built structures contain edits/damage/renovations? | PRD-04/06/07; FORGE-ENG |
| **UNK-PLAN-006** | What revision/locking/merge model supports multiplayer collaborative Blueprint editing and settlement-plan changes safely? | PRD-03/04/06/07; Set31/FORGE-ENG |
| **UNK-PLAN-007** | What player-content validation/moderation/package limits are needed for sharing large Blueprints without denial-of-service or malicious dependencies? | PRD-03/06/07; Set33/37 |
| **UNK-PLAN-008** | What distant construction abstraction produces equivalent material/labour/time outcomes without materialising every placed block until promotion? | PRD-04/06/07 |
| **UNK-BLD-001** | Should the universal functional catalogue remain at 120 definitions or expand after the companion/maritime functional-distinction audit? | Set20 companion/FCC integration; not an architecture guess |
| **UNK-BLD-002** | What exact universal treatment should Shipyard, Lighthouse/Navigation Aid, Rescue and Port Authority/Harbourmaster receive? | Set20 companion + Set26 reconciliation |
| **UNK-BLD-003** | How are mixed-use buildings allowed to share capacity/resources/staffing without double-counting service? | PRD-04/06/07; Set20 companion |
| **UNK-BLD-004** | What service/maintenance capacity rates and failure curves are required once representative Blueprint sources and economy balance exist? | Set20 companion + PRD-06/07 |
| **UNK-BLD-005** | What route-congestion/queue model should reduce effective service without requiring full agent simulation at city scale? | PRD-03/04/06/07 |
| **UNK-BLD-006** | How much structural support/collapse simulation is required beyond explicit support/condition contracts? | PRD-02/03/06/07 |
| **UNK-BLD-007** | How should high-density cities aggregate many buildings/services while retaining inspectable real physical capacity and blockers? | PRD-04/06/07 |
| **UNK-BLD-008** | What construction-work-rate and material-cost balance remains stable across player/NPC/distant construction and different Simulation Depth profiles? | PRD-06/07; design calibration |


# 20. Round-5 Coverage Result

Foundation 16–20 completes the first-pass technical extraction of the reconciled Foundation corpus. It adds:

- a combat layer that owns tactical action/hit/defence resolution while biological, movement, item, social, political, structure, event and maritime owners commit their own consequences;
- one authoritative deterministic Damage Packet/evidence path instead of combat directly mutating every affected subsystem;
- objective-driven encounters, real ammunition/supplies/fortifications, bounded abstract combat and save/network-safe tactical state;
- read-only, knowledge-filtered UI view models with freshness/confidence/reason codes and commands that express intent instead of mutating gameplay truth;
- explicit separation of Simulation Depth, device Performance Profile, difficulty/consequence and accessibility;
- world-library/recovery flows that expose compatibility and preserve original data rather than performing destructive silent fixes;
- retained engine-neutral Document-18 architecture invariants covering stable identity, immutable definitions, commands/events/transactions/evidence, bounded async work, deterministic worldgen, atomic persistence, LOD, authoritative networking, rebuildable Forge outputs, diagnostics, validation, budgets and change control;
- explicit retirement of Summer-specific implementation assumptions from technical authority pending Godot/Zylann audit and prototypes;
- shared in-world/main-menu Blueprint editing services, compact versioned source, exact staged costs, deterministic site validation and safe player-content packages;
- autonomous settlement planning over parcels/routes/districts/growth readiness, with nearby physical and distant conserved construction;
- one closed seven-need settlement summary model backed by real `ServiceRecord` evidence;
- strict separation of universal function, Blueprint source, ConstructionProject, StructureInstance and specialist-owned economy/social/biology/movement truth; and
- validation/laboratory obligations that prevent appearance, markers, LOD or multiplayer prediction from manufacturing resources, services or world state.

**Foundation 00–20 baseline status: COMPLETE for initial PRD-01 extraction.**

The next source family is the **specialist Set 20 v0.2 companion documents (20A–20H), followed by Forge Sets 21–23**. These sources refine the broad Foundation-19/20/Forge requirements and must be extracted by owned field rather than blindly duplicating Foundation statements.


# 21. Round 6 — Specialist Set 20 v0.2 Companion Extraction

## 21.1 Extraction rule for 20A–20H

Set 20 v0.2 is a **specialist refinement layer** over the Foundation 19/20 requirements already extracted in Round 5. PRD-01 therefore does not duplicate broad rules such as “services require real staffing/resources” or “Blueprint source is separate from runtime state” unless a companion adds a distinct technical contract.

The specialist suite is also authoritative by owned field:

- **20A** — Housing, Provisions, Health and Community.
- **20B** — Work, Extraction, Crafting, Trade and Education.
- **20C** — Governance, Safety, Defence, Justice and Emergency Services.
- **20D** — Storage, Roads, Transport, Logistics and Utilities.
- **20E** — Magic, Automation, Industry, Power and Dimensions.
- **20F** — Districts, Complexes, Megaprojects and Wonders.
- **20G** — Culture, Faction, Biome and Realm Building Packs.
- **20H** — numbered universal catalogue, stage matrix and production governance.

Summer-specific implementation language in these documents remains historical/mixed technical evidence under PRD-00. Requirements below retain only the engine-neutral contract unless the wording itself defines current design truth.

---

## 21.2 20A — Housing, Provisions, Health and Community

| ID | Requirement | Source | Decision class | Downstream |
|---|---|---|---|---|
| **REQ-BLD-039** | Housing/service capacity must be calculated from validated semantic capacity, occupant compatibility, climate, route access, permissions, damage, utilities and current operational state rather than visual volume or structure count. | SET-20A v0.2 §§5–7 | Design | LFE settlement/service runtime |
| **REQ-BLD-040** | One physical capacity unit must not be counted simultaneously by incompatible services; mixed-use structures must explicitly divide shared routes, utilities, storage and service capacity. | SET-20A v0.2 §5.4, §7.5 | Design | LFE service aggregation |
| **REQ-BLD-041** | Settlement service coverage must be route-aware and capacity-aware rather than a simple radius test, and partial service regions may remain active when unaffected semantic regions remain valid. | SET-20A v0.2 §5.4, §17 | Design + Engineering | PRD-04/06/07; LFE services/navigation |
| **REQ-BLD-042** | Permanent housing credit must require a compatible permanent place, valid habitable zone, resident-reachable access, climate protection, safety checks, required stage-aware utilities and valid ownership/permission. | SET-20A v0.2 §7.1 | Design | LFE housing |
| **REQ-CIV-031** | Household identity must persist independently of any dwelling and retain members, relationships, accessibility/privacy preferences, shared-inventory permissions, displacement and home history through relocation or destruction. | SET-20A v0.2 §7.2 | Design | LFE people/household persistence |
| **REQ-BLD-043** | Temporary beds, guest lodging, recovery beds, refuge capacity, quarantine beds and duty bunks must remain distinguishable from permanent civilian housing capacity. | SET-20A v0.2 §7.3 | Design | LFE housing/service model |
| **REQ-BLD-044** | Overcrowding must be representable as a graded strain state with downstream health/fire/morale effects rather than instant invalidation of all assigned residents. | SET-20A v0.2 §7.4 | Design | LFE housing/biology/morale interfaces |
| **REQ-PROD-006** | Provision security must derive from conserved stock and net flow plus reserve days, source diversity, preservation, route reliability, season and contamination/emergency risk. | SET-20A v0.2 §§5.2,8 | Design | LFE settlement/provisions |
| **REQ-PROD-007** | Farms, fisheries and livestock outputs must bind to real terrain/ecology/animal/feed/water/care sources; decorative fields, ponds or pens must not generate production. | SET-20A v0.2 §8.2, §9 | Design | LFE production/ecology |
| **REQ-PST-016** | Provision stock must support explicit ownership/reservation classes such as available, household-owned, workplace-owned, project-reserved, trade-bound and emergency-reserved, with release/theft/spoilage/contamination/destruction represented as authoritative events or transactions. | SET-20A v0.2 §8.3 | Design | LFE inventory/transactions/persistence |
| **REQ-BLD-045** | Treatment capacity must account for supplied/staffed treatment and recovery slots, patient severity, route access and sanitation; treatment/quarantine spaces must not create housing capacity. | SET-20A v0.2 §§5.2,10 | Design | LFE health/service interface |
| **REQ-BLD-046** | Health facilities must support clean/dirty route separation and explicit transitions where contamination control requires it. | SET-20A v0.2 §10.3, semantic contracts | Design | LFE service/navigation; FORGE-ENG validators |
| **REQ-BLD-047** | Community/morale facilities must provide accessible, compatible gathering/event capacity and recent-use outcomes rather than passive morale from building count. | SET-20A v0.2 §§5.2,11 | Design | LFE morale/event interface |
| **REQ-PLAN-036** | Domestic/social project selection must be able to respond to shortages, household demand, terrain, culture, risk, access, resources, maintenance and specialist availability while suppressing repetitive proposal spam. | SET-20A v0.2 §12 | Design | LFE settlement planner |
| **REQ-FORGE-006** | 20A Blueprint semantic elements must use stable internal element IDs so source revisions can migrate persistent references to beds, routes, zones, sockets and service regions safely. | SET-20A v0.2 §6.4 | Design + Compatibility | FORGE-ENG; LFE migration |

## 21.3 20B — Work, Extraction, Crafting, Trade and Education

| ID | Requirement | Source | Decision class | Downstream |
|---|---|---|---|---|
| **REQ-PROD-008** | Extraction facilities must bind explicitly to authoritative world-resource sites/deposits; workstation appearance alone cannot create an extractable resource. | SET-20B v0.2 §§6.4,8 | Design | LFE resources/worldgen/production |
| **REQ-PROD-009** | Resource extraction must preserve depletion/renewal/ecological constraints and cannot mine from decorative or unbound source geometry. | SET-20B v0.2 §8 | Design | LFE resource simulation |
| **REQ-PROD-010** | Production facilities must execute authoritative recipes using exact inputs, outputs, by-products, tools, buffers, hazards and route constraints, including persistent work-in-progress where required. | SET-20B v0.2 §§9,12 | Design | LFE production/transactions |
| **REQ-CIV-032** | Job staffing must preserve named workers, role requirements, eligibility, skill and succession rather than reduce workplaces to anonymous worker-count bonuses. | SET-20B v0.2 §7 | Design | LFE people/jobs |
| **REQ-PROG-022** | Skill/training progression must be able to depend on real practice, teachers, curricula, tools, materials and time instead of instant building-based unlocks. | SET-20B v0.2 §§7,11 | Design | LFE progression/education |
| **REQ-PROG-023** | Education records must support named teachers/learners, curricula, apprenticeship/professional continuity and persistent knowledge storage where the owning system requires it. | SET-20B v0.2 §11 | Design | LFE knowledge/people |
| **REQ-ECON-003** | Trade structures must operate on owned conserved stock, manifests/contracts and route links; markets must not generate merchant inventory from presentation or occupancy alone. | SET-20B v0.2 §10 | Design | LFE economy/logistics |
| **REQ-ECON-004** | Trade modes and public-service/loading functions must remain separable so a market or caravan facility cannot double-count the same stock/route capacity through incompatible roles. | SET-20B v0.2 §§10.2–10.3 | Design | LFE economy/service model |
| **REQ-PROD-011** | Workplace operational validity must incorporate staff, tools, stock, route access, permissions, semantic contracts, safety and commissioning state before output is produced. | SET-20B v0.2 locked scope, §§5,9 | Design | LFE production/services |
| **REQ-PROD-012** | Quality, buffers and by-products must be first-class production data where a recipe/process uses them; distant simulation must preserve the same authoritative conserved totals. | SET-20B v0.2 §12, §27 | Design | LFE production LOD |
| **REQ-PLAN-037** | Productive/commercial project planning must be able to score shortages, resource opportunities, bottlenecks, staffing/succession, routes, safety, culture, cost and policy. | SET-20B v0.2 §13 | Design | LFE settlement planner |
| **REQ-PST-017** | Distant work/trade/training summaries must preserve stock, ownership, named people, project state and history rather than fabricate production or reset professional continuity. | SET-20B v0.2 §27 | Design | LFE simulation/persistence |

## 21.4 20C — Governance, Safety, Defence, Justice and Emergency Services

| ID | Requirement | Source | Decision class | Downstream |
|---|---|---|---|---|
| **REQ-GOV-009** | Civic buildings may host government functions but must never manufacture legitimacy, law, ownership, jurisdiction or faction authority from their appearance or presence. | SET-20C v0.2 locked authority rule | Design/governance | LFE politics/governance interfaces |
| **REQ-POL-030** | Governance/service runtime must reference separate authoritative law, permission, ownership, jurisdiction and political records rather than encode them as building states. | SET-20C v0.2 §§3, governance contracts | Design | LFE politics/settlement |
| **REQ-GOV-010** | Justice runtime must preserve evidence/witness/report confidence, case identity, proportional consequence and persistent case history rather than resolve crime as an opaque instant penalty. | SET-20C v0.2 revision summary; justice sections | Design | LFE justice/evidence |
| **REQ-CMB-037** | Settlement defence must support the staged chain Detection → Warning → Delay → Response → Sustainment → Refuge → Recovery, with each stage backed by real people, structures, resources and routes. | SET-20C v0.2 revision summary | Design | LFE defence/settlement |
| **REQ-STR-029** | Modular walls, gates and towers must support stable element IDs, connection/perimeter graphs, damage groups, access state and repair paths so local breaches do not require replacing an entire fortification identity. | SET-20C v0.2 revision summary; defence sections | Design | LFE structures/defence; FORGE-ENG |
| **REQ-CMB-038** | Guard readiness must be separable from structure existence and may depend on staffing, equipment, supplies, access, alert state, condition and current threat pressure. | SET-20C v0.2 primary focus/safety model | Design | LFE combat/settlement |
| **REQ-GOV-011** | Civic/justice/emergency services must support bounded incident records with named participants and persistent outcomes that can be simulated distantly without deleting laws, judgments or history. | SET-20C v0.2 simulation direction | Design | LFE events/politics LOD |
| **REQ-STR-030** | Access-control semantics must distinguish public/private/service/emergency/controlled routes and gates where civic/security functions require them. | SET-20C v0.2 semantic contracts | Design | LFE navigation/permissions; FORGE-ENG |
| **REQ-BLD-048** | Fire/rescue/refuge facilities must expose actual responder capacity, equipment/supply, reachability and safe refuge/egress rather than cosmetic emergency-service capacity. | SET-20C v0.2 primary focus | Design | LFE emergency/service runtime |
| **REQ-PLAN-038** | Civic/defence project selection must be able to respond to administration load, incidents, threats, diplomacy, terrain, staffing, resources, maintenance, laws and recognised authority. | SET-20C v0.2 NPC Growth | Design | LFE settlement planner |
| **REQ-MP-010** | Security-sensitive permissions, law enforcement, fortification state and civic consequences must remain server-authoritative in shared worlds even when clients predict presentation. | SET-20C v0.2 player/security and simulation authority sections | Design/security | future Set31; LFE multiplayer |

## 21.5 20D — Storage, Roads, Transport, Logistics and Utilities

| ID | Requirement | Source | Decision class | Downstream |
|---|---|---|---|---|
| **REQ-AUT-051** | Settlement storage must represent real owned inventory/capacity and cannot derive stock from decorative containers or volume. | SET-20D v0.2 locked resource rule | Design | LFE inventory/logistics |
| **REQ-AUT-052** | Route infrastructure must expose connected traversable graph state and effective capacity/condition; disconnected decorative roads must not create access or logistics throughput. | SET-20D v0.2 locked scope | Design | LFE routes/navigation/logistics |
| **REQ-AUT-053** | Freight/loading operations must transfer exact conserved stock through authoritative source/destination/reservation records and remain safe under blockage, partial capacity and save/reload. | SET-20D v0.2 §§storage/logistics | Design | LFE logistics/transactions |
| **REQ-AUT-054** | Utility networks must require valid source, destination, capacity, ownership, direction/connection and condition; an unbound pipe or visual conduit must not generate flow. | SET-20D v0.2 locked scope; semantic network contracts | Design | LFE utility graphs |
| **REQ-BLD-049** | Public water service must distinguish physical water presence from validated accessible/safe water-source and distribution capacity. | SET-20D v0.2 locked scope | Design | LFE water/service interface |
| **REQ-BLD-050** | Sanitation/drainage/waste services must be representable as real capacities/dependencies with failure, maintenance and incident states rather than as hidden bonuses from building count. | SET-20D v0.2 primary focus | Design | LFE services/environment |
| **REQ-STR-031** | Bridges, docks, roads and other route infrastructure must support terrain/connection/clearance/access validation plus persistent deterioration/damage/repair state where applicable. | SET-20D v0.2 official authoring/simulation | Design | LFE structures/navigation; FORGE-ENG |
| **REQ-AUT-055** | Distant infrastructure simulation must preserve exact stock plus persistent route/network capacity, allocation, deterioration, blockages and incident consequences while batching visible hauling. | SET-20D v0.2 simulation direction | Design | LFE logistics LOD |
| **REQ-PLAN-039** | Infrastructure project planning must be able to react to storage pressure, effective travel, water/sanitation load, terrain/weather, trade, threats, maintenance and planned expansion. | SET-20D v0.2 NPC Growth | Design | LFE settlement planner |
| **REQ-FORGE-007** | Blueprint/network authoring must support semantic route and utility layers, terrain adaptation and validated network endpoints rather than rely on geometry-only inference. | SET-20D v0.2 official authoring | Design | FORGE-ENG network/Blueprint tools |

## 21.6 20E — Magic, Automation, Industry, Power and Dimensions

| ID | Requirement | Source | Decision class | Downstream |
|---|---|---|---|---|
| **REQ-AUT-056** | Power, mana, mechanical, item-logistics, control, cooling and waste systems must be representable as typed graphs with stable element IDs, capacity, direction, ownership, condition and explicit failure state. | SET-20E v0.2 revision summary | Design | LFE graph runtime; FORGE-ENG |
| **REQ-AUT-057** | Energy-producing/consuming systems must preserve authoritative generation, storage, transfer and consumption budgets; animation or visual activity must never itself create power/mana/capacity. | SET-20E v0.2 resource rule/locked scope | Design | LFE energy/mana |
| **REQ-AUT-058** | Machines/industrial systems must expose explicit blocked/fault causes such as missing input/power/specialist, blocked output, unsafe heat or maintenance failure rather than silently stalling. | SET-20E v0.2 purpose | Design | LFE machines/diagnostics |
| **REQ-AUT-059** | Earlier industrial/power branches must remain valid where their capabilities suffice; progression must not require global replacement of manual/mechanical systems by later magical technology. | SET-20E v0.2 progression | Design | LFE progression/automation |
| **REQ-MAG-030** | Wards must depend on authoritative mana/power/network/condition and coverage contracts and support readable breach/failure state rather than passive visual protection. | SET-20E v0.2 typed contracts | Design | LFE magic/defence |
| **REQ-MAG-031** | Portal facilities must bind to explicit authoritative destination/link/anchor/permission/stability contracts; an empty frame or visual effect cannot create a destination. | SET-20E v0.2 locked scope/revision summary | Design | LFE realm/portal |
| **REQ-MAG-032** | Dimensional containment and corruption-management facilities must expose explicit containment, contamination/risk, failure, cleansing/repair/restoration and persistent consequence states. | SET-20E v0.2 scope/revision summary | Design | LFE magic/hazard/runtime |
| **REQ-AUT-060** | Golems/constructed labour must operate as bounded civilisation labour support with real resources, ownership, tasks, maintenance and permissions rather than replace named people or create free work. | SET-20E v0.2 core philosophy/scope | Design | LFE automation/entities |
| **REQ-PROG-024** | Advanced industrial/magical facilities may require knowledge/research/specialist gates, but those gates must remain separate from the building shell and be inspectable as blockers. | SET-20E v0.2 NPC Growth/purpose | Design | LFE progression/services |
| **REQ-AUT-061** | Distant industrial/magical simulation must preserve exact resource and energy budgets, production, staffing, projects, risk/fault state and consequences while reducing visual/mechanical fidelity. | SET-20E v0.2 simulation direction | Design | LFE automation/magic LOD |
| **REQ-FORGE-008** | Forge source for industrial/magical facilities must support typed network graphs, nested modules, terrain bindings, construction stages and dynamic fault/damage/corruption/repair state deltas. | SET-20E v0.2 official authoring/revision summary | Design | FORGE-ENG |
| **REQ-MP-011** | Player-authored automation/magic sources may configure approved contracts but must not alter protected registries, source yields, universal recipes, migrations or server authority. | SET-20E v0.2 player creator | Design/security | FORGE-ENG; Set31/33/37 |

## 21.7 20F — Districts, Complexes, Megaprojects and Wonders

| ID | Requirement | Source | Decision class | Downstream |
|---|---|---|---|---|
| **REQ-PLAN-040** | Settlement planning must support the hierarchy Building → Parcel → Cluster → District → Campus/Complex → Settlement Plan → Megaproject/Wonder without collapsing lower-level ownership/state into the parent plan. | SET-20F v0.2 planning ladder | Design | LFE planning/settlements |
| **REQ-PLAN-041** | Plans must coordinate real structures, routes, utilities, services, people and construction phases; a boundary/label/visual model may not create underlying capability. | SET-20F v0.2 core philosophy | Design | LFE planning/services |
| **REQ-PLAN-042** | Complexes and megaprojects must be graphs of independently saved subprojects with explicit prerequisites/dependencies, enabling works, roads/utilities, supply/workforce support and staged commissioning. | SET-20F v0.2 construction | Design | LFE project graphs/persistence |
| **REQ-PLAN-043** | Large plans must support partial activation when valid completed subprojects provide a bounded subset of services while incomplete/failed branches remain unavailable. | SET-20F v0.2 construction/locked scope | Design | LFE project/service runtime |
| **REQ-PLAN-044** | Wonder/megaproject effects must remain contingent on completed, authorised and functioning subprojects plus required maintenance rather than remain permanently active from visual completion. | SET-20F v0.2 locked scope | Design | LFE megaproject runtime |
| **REQ-PLAN-045** | District/complex planning must incorporate density, travel, service coverage, terrain, infrastructure, threat, specialists, law, culture, logistics, maintenance, disruption and expansion space. | SET-20F v0.2 NPC Growth | Design | LFE settlement planner |
| **REQ-PLAN-046** | Distant district/megaproject simulation must preserve parcel ownership, capacities, resources, subproject progress, maintenance/risk, ownership and history while allowing lower physical detail. | SET-20F v0.2 simulation | Design | LFE simulation LOD |
| **REQ-FORGE-009** | Forge plan sources must support nested blueprints/modules, parcel roles, route/utility spines, phase graphs, terrain rules, dependencies and state variants as editable source. | SET-20F v0.2 official authoring | Design | FORGE-ENG structure/plan tools |
| **REQ-ARCH-037** | Generated plan graphs, coverage maps, scenes and caches must be treated as rebuildable derived products rather than authoritative editable/persistent truth. | SET-20F v0.2 engine direction | Architecture constraint | LFE/FORGE-ENG |
| **REQ-PST-018** | Damage/restoration to a complex must preserve unaffected subproject identities and historical continuity rather than replace the entire plan with one generic damaged state. | SET-20F v0.2 construction/state model | Design | LFE project/structure persistence |

## 21.8 20G — Culture, Faction, Biome and Realm Building Packs

| ID | Requirement | Source | Decision class | Downstream |
|---|---|---|---|---|
| **REQ-CIV-033** | Architecture/presentation composition must keep ancestry, culture, settlement, faction, government, faith/philosophy, economy, biome, realm and historical state as separate linked identities; no ancestry may imply one architecture, morality, government or technology. | SET-20G v0.2 Identity Lock | Design/canon | LFE civilisation; FORGE-ENG packs |
| **REQ-FORGE-010** | Pack layers may select compatible Blueprint sources, material-role sets, layouts, modules and declared functional replacements but may not create unregistered beds/jobs/production/safety/infrastructure. | SET-20G v0.2 Universal Registry Rule | Design/governance | FORGE-ENG pack resolver |
| **REQ-FORGE-011** | Pack resolution must be deterministic across the ordered composition chain universal definition → source → culture → regional/subculture → biome → faction/government/faith/economy → realm → history/state → approved settlement/player override → bounded age/weathering detail. | SET-20G v0.2 Resolution Direction | Design + Engineering | PRD-04/06/07; FORGE-ENG/LFE |
| **REQ-ID-032** | Pack records must use stable namespaced IDs, schema versions, dependencies, content hashes, lifecycle state and migration aliases sufficient for deterministic compatibility checks. | SET-20G v0.2 Data and Mod Direction | Design + Compatibility | LFE registries; FORGE-ENG |
| **REQ-FORGE-012** | Culture/faction/biome/realm expression should reuse universal definitions and material roles/source pools by default; full functional replacement requires an explicit compatible replacement contract. | SET-20G v0.2 purpose/universal rule | Design | FORGE-ENG |
| **REQ-CIV-034** | Mixed settlements must support layered/hybrid architectural resolution and historical evolution rather than forcing one mutually-exclusive culture pack. | SET-20G v0.2 locked scope/purpose | Design | LFE civilisation; FORGE-ENG |
| **REQ-REALM-031** | Realm packs must be able to encode physical-law adaptation, arrival/outpost rules, native settlement profiles, local matter, portal dependencies, hazards, ownership and signature projects; realm packs are not recoloured biome packs. | SET-20G v0.2 Realm Direction | Design | LFE realm interfaces; FORGE-ENG |
| **REQ-FORGE-013** | Player style/town packs must use the same validated data contracts as official packs while remaining unable to modify protected gameplay definitions, execute arbitrary code or bypass server authority. | SET-20G v0.2 Player Authoring/Data directions | Design/security | FORGE-ENG; Set33/37 |
| **REQ-FORGE-014** | Pack benefits/differences must be capable of carrying explicit trade-offs, requirements, maintenance, terrain dependence, legal/specialist/political consequences rather than becoming hidden strictly-superior bonuses. | SET-20G v0.2 Balance Direction | Design | LFE planner/balance; FORGE-ENG |
| **REQ-PST-019** | Resolved pack provenance must persist sufficiently to reproduce/migrate an existing structure or settlement presentation after pack/source revisions without inferring identity from visuals. | SET-20G v0.2 purpose/data direction | Compatibility | LFE persistence; FORGE-ENG migration |

## 21.9 20H — Catalogue, stage matrix and production governance

| ID | Requirement | Source | Decision class | Downstream |
|---|---|---|---|---|
| **REQ-ID-033** | The universal settlement catalogue must have a controlled functional identity register; current Set-20 v0.2 authority contains exactly 120 universal definitions, with expansion requiring an explicit function-distinction review. | SET-20H v0.2 §§1–2 | Design/governance | PRD-01 deltas; LFE registries |
| **REQ-ID-034** | Culture palettes, ordinary size/layout variants, inheritance children, damage/construction states and decorative alternatives must not create new universal functional IDs. | SET-20H v0.2 §2 | Design/governance | LFE registries; FORGE-ENG |
| **REQ-ID-035** | Universal definitions, module definitions, Blueprint source, approved packages, construction-project records, structure instances and pack definitions must remain separate registry/runtime units with distinct namespaces and identity semantics. | SET-20H v0.2 §3 | Design | LFE/FORGE-ENG data model |
| **REQ-ID-036** | Runtime instance records must reference stable definition/source identities using generated instance IDs; legacy namespace forms must be migration inputs rather than canonical new output. | SET-20H v0.2 §3.2 | Compatibility | LFE IDs/migration |
| **REQ-GOV-012** | Ownership precedence must be field-scoped: 20H owns universal identity/stage/planner metadata, Document 20 shared rules, 20A–20F family mechanics, 20G composition, Blueprint Forge source semantics, construction projects active resource/labour commitments and StructureInstance placed state. | SET-20H v0.2 §3.3 | Governance | PRD-04; LFE/FORGE-ENG |
| **REQ-FORGE-015** | Every content definition/source must support independently tracked design, definition-data, Forge-source, runtime-bake, gameplay, test, balance, pack-coverage and migration maturity rather than one ambiguous “done” flag. | SET-20H v0.2 §4.1 | Process/governance | FORGE-ENG production lifecycle |
| **REQ-FORGE-016** | Forge source lifecycle must support blockout → semantic pass → material-role resolution → construction stages → operational/damage states → placement/performance validation → bake → integration → scenario test → shippable gates. | SET-20H v0.2 §§4.2–4.3 | Process constraint | FORGE-ENG; PRD-06/07 |
| **REQ-FORGE-017** | A source cannot be Forge-validated without semantic, stage, placement, reference and performance checks, and shippable content must include applicable save/load, migration, damage/repair and simulation-LOD verification. | SET-20H v0.2 §4.3 | Evidence requirement | PRD-06/07/09; FORGE-ENG |
| **REQ-ID-037** | Mixed-use Blueprints may satisfy several compatible functional definitions but every service retains its own ID/capacity and may not be double-counted. | SET-20H v0.2 §2 | Design | LFE services; FORGE-ENG validation |
| **REQ-ID-038** | Stable IDs already implemented or externally referenced must be migrated with aliases/tombstones rather than casually renamed, reused or reassigned to a different concept. | SET-20H v0.2 §26 | Compatibility lock | LFE registries/migration |
| **REQ-DEV-016** | Catalogue changes must follow explicit change classes—editorial, additive compatible, behavioural compatible, source revision, contract migration, stable-ID change and catalogue expansion/removal—with matching review/migration/regression obligations. | SET-20H v0.2 §26.1 | Process constraint | LFE development governance; FORGE-ENG |
| **REQ-DEV-017** | AI-assisted catalogue/content changes must produce human-reviewable diffs and must not silently alter stable IDs, catalogue scope or protected contracts. | SET-20H v0.2 §§4.3,26 | Process/security | LFE/FORGE-ENG development rules |
| **REQ-ARCH-038** | The content pipeline must support deterministic runtime baking and dependency invalidation so only affected packages/caches need rebuild when source dependencies change. | SET-20H v0.2 §25 | Architecture/evidence | PRD-03/04/06/07; FORGE-ENG |
| **REQ-FORGE-018** | Every universal definition must be able to link official source IDs, size/footprint profiles, validator profile, construction-state coverage, damage/operational coverage, terrain/world-placement coverage, pack compatibility, player-authoring permission, bake/tool version and test fixtures/blockers. | SET-20H v0.2 §24.1 | Design/tooling | FORGE-ENG registry/editor |
| **REQ-PLAN-047** | Planner classes must distinguish required, optional, conditional, upgrade, district and megaproject candidates, with eligibility and stage/condition rules rather than treating all projects as one undifferentiated build list. | SET-20H v0.2 §21 | Design | LFE settlement planner |
| **REQ-DEV-018** | The Set-20 production stack requires machine-verifiable schemas, namespace validation, semantic registries, source validation, deterministic bake hashes, migration tests, Forge-lab scenarios and CI regression gates before production qualification. | SET-20H v0.2 §§25–26 | Evidence/process | PRD-06/07/09; FORGE-ENG/LFE |

---

# 22. Round-6 Explicit Unknowns / Evidence Gaps

| ID | Unknown / evidence gap | Required downstream |
|---|---|---|
| **UNK-BLD-009** | What route-aware service-coverage algorithm scales from a hamlet to dense cities while respecting real access/capacity and not requiring pathfinding every resident-to-service pair each tick? | PRD-03/04/06/07 |
| **UNK-BLD-010** | What semantic granularity is sufficient to keep only affected rooms/service regions active after damage or contamination without making every building prohibitively expensive to author/simulate? | PRD-03/04/06/07; FORGE-ENG |
| **UNK-BLD-011** | What balancing model converts conserved stock/net flow/season/reliability into provision-reserve risk without turning ordinary food management into micromanagement? | PRD-06/07; design calibration |
| **UNK-BLD-012** | How are clean/dirty route constraints validated and scheduled for healthcare, sanitation and contaminated industry without exploding navigation complexity? | PRD-03/04/06/07 |
| **UNK-CIV-007** | What household data model preserves relocation/history/privacy/accessibility without duplicating person/social truth or making household simulation too heavy? | PRD-04/06/07 |
| **UNK-PROD-003** | What resource-site binding representation cleanly connects worldgen deposits/ecology to extraction facilities across edits, depletion, ownership and save migration? | PRD-02/03/04/06/07 |
| **UNK-PROD-004** | What production batching/quality/by-product model remains transaction-equivalent between active workplaces and distant summaries? | PRD-04/06/07 |
| **UNK-PROG-003** | How detailed should curricula/apprenticeship/skill succession be at different Simulation Depth levels while preserving named professional continuity? | PRD-04/06/07 |
| **UNK-ECON-001** | What authoritative trade/manifests/contracts interface should Set 20B facilities expose to the later Set-27 economy owner without duplicating prices/markets/trade truth? | PRD Set27 extraction; PRD-04 |
| **UNK-GOV-001** | What evidence/case representation is sufficient for fair justice and persistent history without retaining unbounded raw witness/event data forever? | PRD-04/06/07 |
| **UNK-CMB-009** | What perimeter/sector graph representation supports damage, breaches, gates, patrol access and LOD without recalculating an entire fortified settlement after every block edit? | PRD-02/03/04/06/07 |
| **UNK-CMB-010** | How are Detection→Warning→Delay→Response→Sustainment→Refuge→Recovery stages scored/reconciled under distant combat while preserving the same preparation causes? | PRD-04/06/07 |
| **UNK-AUT-011** | What route/freight graph and capacity model provides believable congestion/blockage at settlement scale without full per-item/per-NPC simulation everywhere? | PRD-03/04/06/07 |
| **UNK-AUT-012** | What utility graph representation supports water, sanitation, mechanical, power, mana, control, cooling and waste contracts without forcing one unsuitable universal solver? | PRD-03/04/06/07 |
| **UNK-AUT-013** | What exact authoritative water-service model distinguishes natural water voxels, safe sources, storage, distribution, contamination and consumption? | PRD-02/03/04/06/07 |
| **UNK-AUT-014** | What typed-network simulation/update strategy keeps large interconnected industrial/magical graphs bounded under edits and LOD transitions? | PRD-03/04/06/07 |
| **UNK-AUT-015** | How should machine fault/maintenance state be aggregated distantly while still producing the same resource/energy outcomes and readable causes on promotion? | PRD-04/06/07 |
| **UNK-MAG-008** | What portal-facility runtime contract cleanly separates structure/network readiness from the later FCC-13 exact portal recipes and realm-transition authority? | FCC-13 + PRD-04/06/07 |
| **UNK-MAG-009** | How are ward/containment coverage fields represented and invalidated efficiently when sources, networks, terrain or structures change? | PRD-03/04/06/07 |
| **UNK-PLAN-009** | What graph/partition model allows megaprojects with thousands of subcomponents to save, activate, damage and restore independently without one monolithic project record? | PRD-03/04/06/07 |
| **UNK-PLAN-010** | What district-level aggregation strategy preserves real lower-level capacity and blockers while avoiding a full rescan of every building whenever one subproject changes? | PRD-04/06/07 |
| **UNK-FORGE-004** | What deterministic pack-resolution/override algorithm and conflict diagnostics will make the 20G composition chain reproducible across clients, saves and tool versions? | PRD-03/04/06/07; FORGE-ENG |
| **UNK-FORGE-005** | How much source/pack provenance must a placed structure persist to reproduce historical appearance after source revisions without bloating saves? | PRD-04/06/07; FORGE-ENG |
| **UNK-FORGE-006** | What semantic source format can support stable internal element IDs across Blueprint edits, nesting, inheritance and module reuse without fragile coordinate-only references? | PRD-03/04/06/07; FORGE-ENG |
| **UNK-ID-006** | Is the 120-definition universal catalogue cap still final after Set-26 maritime and later FCC-12/13 reconciliation, or will controlled function-distinction changes be required? | Set26/FCC-13 reconciliation; PRD-01 delta |
| **UNK-ID-007** | What persistent alias/tombstone and content-package strategy guarantees removed/renamed catalogue entries remain recoverable across long-lived worlds and mods? | PRD-03/04/06/07; Set39 |
| **UNK-DEV-002** | Which Set-20 production status tracks belong in runtime/shipping manifests versus Forge/project-management metadata only? | PRD-04; FORGE-ENG |

# 23. Round-6 Coverage Result

Set 20 v0.2 specialist extraction is complete for the initial PRD-01 baseline. The companion suite adds material refinements beyond Foundation 19/20, including:

- route-aware, semantic housing/service capacity with household identity independent of buildings;
- conserved provision reserves, resource-bound farming/fishing/livestock and contamination/shortage state;
- resource-site-bound extraction, named professional succession, real trade stock/manifests and persistent training/knowledge continuity;
- evidence-backed civic/justice functions and the explicit defence chain Detection → Warning → Delay → Response → Sustainment → Refuge → Recovery;
- real storage, freight, route, water, sanitation and utility-network capacity rather than decorative infrastructure;
- typed industrial/magical network graphs, explicit machine/ward/portal faults and exact energy/resource budgets across LOD;
- graph-based districts/complexes/megaprojects with independently persisted subprojects and partial activation;
- deterministic culture/faction/biome/realm pack composition without ancestry stereotypes or a duplicate functional registry; and
- the controlled 120-definition universal catalogue with stable namespaces, maturity tracks, migration/change classes and deterministic Forge/bake/test gates.

**Set 20 v0.2 baseline status: COMPLETE for initial PRD-01 extraction.**

The next source family is **Forge Sets 21–23**. Round 7 must extract the technical requirements for voxel/material/item/prop authoring, source/runtime separation, Blueprint Forge, Forge-wide workflow, packaging, validation, technical implementation boundaries and presentation/VFX tooling without duplicating the Set-20 functional contracts above.

# 24. Round-7 — Forge Sets 21–23 Technical Requirement Extraction
## 24.1 Scope and authority handling

Round 7 extracts the active authoring, data-contract, migration, validation and runtime-facing requirements from **Set 21 (Voxel Asset Forge), Set 22 (Entity and Blueprint Forge), and Set 23 (Presentation Forge)**.

Authority handling follows PRD-00:
- 21G **v0.2** supersedes 21G v0.1 and coordinates the 21G / 22L / 23J migration split.
- Set-21/22/23 authoring requirements are active design inputs.
- Summer-era implementation specifics in 21F, 22K and 23I are not automatically current rebuild architecture; only implementation-neutral constraints are extracted here.
- Asset Forge, Entity Forge, Blueprint Forge and Presentation Forge remain specialist branches of one Unified Forge; shared services do not erase specialist ownership.
## 24.2 New requirements
| ID | Normative requirement | Primary source(s) | Classification / downstream |
|---|---|---|---|
| **REQ-FORGE-019** | Canonical Forge source must remain editable and authoritative while generated runtime products remain disposable/rebuildable outputs. | 21A–21F; 22A/22K; 23A/23I | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-FORGE-020** | The Unified Forge must expose specialist Asset, Entity, Blueprint and Presentation workspaces over shared project, registry, dependency, validation, bake, review and migration services. | 21G v0.2; 22J; 23A/23H | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-FORGE-021** | Developer authoring must support standard block surfaces, unique voxel models, compound assets with named parts, and manually authored overrides without changing gameplay identity by default. | 21A–21F | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-FORGE-022** | Standard block surfaces must retain the locked 32×32 default profile unless an explicitly approved profile differs. | 21B; 21G v0.2 | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-FORGE-023** | Editor microvoxels must bake to efficient runtime geometry rather than becoming one runtime node per authoring cell. | 21F; 21G v0.2 | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-FORGE-024** | Asset families must support reusable Material DNA, palettes, stamps/templates, generated shapes and shared kits rather than one-off duplicated assets. | 21B; 21G v0.2 | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-FORGE-025** | Visual variants must inherit from a strong base and override only justified material/culture/biome/condition/magic/quality differences. | 21D; 21G v0.2 | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-FORGE-026** | Project overrides must be non-destructive, reversible and dependency-visible, with explicit fallback to approved base/legacy content. | 21D; 21G v0.2 | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-FORGE-027** | Forge authoring operations must provide undo/redo, autosave, atomic writes, validation and recovery for MVP production work. | 21E/21F; 22J/22K; 23H/23I | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-FORGE-028** | Forge search and editing UI must operate through indexed/shared services rather than arbitrary folder scanning and direct resource mutation. | 22J/22K; 23H | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-FORGE-029** | Forge workspaces must preserve selection/context when navigating between owning assets, entities, blueprints and presentation references. | 22J; 23H | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-FORGE-030** | The Forge must expose dependency impact before deletion, deprecation, replacement or approval, including transitive dependants for large graphs. | 21F; 22K; 23I/23J | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-FORGE-031** | Bakes must be deterministic, incremental, dependency-aware, cancellable and traceable to source/dependency hashes, baker version and target profile. | 21F; 22K; 23I | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-FORGE-032** | Generated products must be read-back validated before approval/shipping. | 21F; 22K; 23I | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-FORGE-033** | Hot reload may replace presentation/runtime products only at safe boundaries and must not mutate authoritative world/entity/structure state. | 22K; 23I | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-FORGE-034** | Forge source schemas and runtime products must be versioned and explicitly migratable. | 21F; 22K; 23I/23J | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-FORGE-035** | Forge backups/recovery must restore source or approved revisions and rebake disposable products rather than silently guessing repairs. | 21F; 22K; 23H/23I | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-FORGE-036** | Content packages must declare dependencies, provenance, compatibility and required gameplay-contract versions. | 21D/21F; 22K; 23J | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-FORGE-037** | Developer and future restricted player-creator authority must remain distinct; restricted creators cannot alter protected gameplay contracts, scripts, migrations or namespaces through untrusted content. | 22K; future Set33 constraint | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-FORGE-038** | AI-assisted Forge changes must remain reviewable, reversible, bounded and non-authoritative, with stable-ID/schema changes requiring explicit migration/review. | 21F; 22K; 23A/23I | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-FORGE-039** | Asset approval must include representative in-world checks, not isolated editor beauty alone. | 21G v0.2; 22L; 23J | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-FORGE-040** | Cross-Forge release must distinguish Asset-Kit Ready, Simulation Ready, Presentation Ready and Integrated Release Ready rather than one ambiguous completion flag. | 21G v0.2; 22L; 23J | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-FORGE-041** | Legacy presentation must remain available until replacement approval, representative regression and migration/fallback requirements pass. | 21G v0.2; 22L; 23J | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-FORGE-042** | Cosmetic replacement must not silently change footprint, collision, ports, interaction anchors, attachments, event contracts or stable spatial references. | 21G v0.2 | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-FORGE-043** | Any presentation change that alters a gameplay/spatial contract must route to the owning specialist and require explicit migration. | 21G v0.2; 22L; 23J | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-ENT-001** | Entity Forge must represent multiple body families without a universal humanoid-only assumption. | 22A/22B/22D | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-ENT-002** | Body plans must use stable semantic graph nodes/roles with validation for cycles, duplicates and required template roles. | 22B/22K | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-ENT-003** | Procedural/repeated anatomy must generate deterministic derived node identities so overrides survive regeneration where semantically valid. | 22B/22K | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-ENT-004** | Changing generated segment counts must identify orphaned overrides instead of silently retargeting them. | 22K | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-ENT-005** | Population anatomy, markings and appearance variation must use independent stable seed channels so one cosmetic change does not reshuffle unrelated traits. | 22C/22D/22G/22K | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-ENT-006** | Entity source must support rigid and deformable binding, semantic skeleton roles, joints, sockets, attachments and version-independent rig intent. | 22E/22K | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-ENT-007** | Authored rig data must not permanently encode one exact engine IK/solver node; runtime adapters translate semantic profiles to supported engine APIs. | 22E/22K | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-ENT-008** | Rig assembly must validate required roles, socket mappings, joint limits and attachment compatibility before approval. | 22E/22K | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-ENT-009** | Animation libraries must support stable semantic clips/states, retarget maps and declared fallback behaviour. | 22F/22K | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-ENT-010** | Animation events that affect gameplay are requests to authoritative systems, never permission for animation assets to apply damage or transfer resources directly. | 22F/22K | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-ENT-011** | Procedural locomotion/IK solvers must be composable, bounded and able to fall back safely when terrain/roles cannot resolve. | 22E/22F/22K | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-ENT-012** | Cosmetic procedural motion may evaluate locally from authoritative movement inputs, while movement/attack-relevant contacts remain authoritative. | 22F/22K | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-ENT-013** | Player/NPC appearance must resolve deterministically from layers, pools, weights, exclusions and seed tokens into a compact persistent appearance record. | 22C/22G/22K | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-ENT-014** | Persistent NPC appearance must survive unload/reload, save migration and LOD reconstruction without storing a whole scene tree. | 22C/22G/22H/22K | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-ENT-015** | Equipment presentation must resolve from authoritative inventory/equipment state while Forge owns fit/attachment appearance only. | 22G/22K | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-ENT-016** | Equipment fit must support non-humanoid/multi-limb compatibility through semantic sockets/fit profiles rather than humanoid-only hard-coding. | 22G/22K | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-ENT-017** | Visual armour coverage must not grant gameplay protection; validators must detect disagreement between presentation coverage and authoritative combat/item definitions. | 22G/22H/22K | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-ENT-018** | Entity gameplay contracts must expose semantic collision, hit/damage regions, sensors, interaction anchors, navigation envelopes and required markers. | 22H/22K | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-ENT-019** | Collision/hit proxy baking must avoid one collision shape per voxel and support authored/manual proxy overrides. | 22H/22K | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-ENT-020** | Shared semantic marker catalogues must define versioned meanings and validation rules so individual content cannot invent incompatible gameplay markers. | 22H/22K | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-ENT-021** | Loaded entity actors must be disposable representations reconstructed from stable definition plus authoritative persistent record. | 22H/22K | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-ENT-022** | Demotion/unload must write only approved persistent deltas such as wounds, equipment, cargo, location and quest bindings. | 22H/22K | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-ENT-023** | Entity rendering, animation, collision/marker detail and simulation may scale on independent LOD axes while preserving gameplay truth. | 22H/22K | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-ENT-024** | Crowd/herd representation must support aggregation and bounded detail without losing persistent notable individuals. | 22H/22K | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-PLAN-048** | Blueprint Forge must preserve stable Blueprint identity/version/lifecycle independently from placed StructureInstance identity. | 22I/22K | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-PLAN-049** | Blueprint placements, markers and semantic elements must have stable internal IDs so upgrades, damage and save deltas survive source reordering. | 22I/22K | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-PLAN-050** | Blueprints must support nested reusable modules with explicit dependency resolution and circular-dependency prevention. | 22I/22K | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-PLAN-051** | Blueprint materials must use semantic roles with capability/property constraints that culture/biome/material packs resolve to approved IDs. | 22I/22K | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-PLAN-052** | Required Blueprint dependencies must block approval when missing; placeholders are preview aids, not silent shipping substitutions. | 22I/22K | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-PLAN-053** | Construction stages must encode semantic deltas and links to authoritative project/resource requirements without Blueprint source owning transactions. | 22I/22K | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-PLAN-054** | Upgrade profiles must preserve stable semantic element correspondence or produce explicit conflicts/migration requirements. | 22I/22K | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-PLAN-055** | Damage/repair must operate through sparse instance deltas against stable Blueprint elements rather than rewriting canonical Blueprint source. | 22I/22K | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-PLAN-056** | Blueprints must support occupation, corruption, restoration and partial-functionality presentation/semantic states without duplicating owning gameplay state. | 22I/22K | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-PLAN-057** | World-placement profiles must express terrain, slope, support/foundation, relational anchor and fallback requirements without directly owning world edits. | 22I/22K | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-PLAN-058** | Blueprint authoring must support building, dungeon, structure, environment and world-layout work as a real 3D editing workflow, not only forms/JSON. | 22I/22J; approved project direction | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-PLAN-059** | Blueprint runtime products must remain source-derived and rebuildable while placed historical state persists separately. | 22I/22K | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-PRES-001** | Gameplay systems must own truth; Presentation Forge consumes declared events/read-only state and cannot decide gameplay success or mutate authoritative state. | 23A/23C | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-PRES-002** | Presentation Profiles must provide reusable composition of VFX, audio, light, surface and accessibility outputs instead of bespoke wiring at every use site. | 23A/23C | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-PRES-003** | Every reusable presentation event must have stable semantic ID, owner, schema version, typed payload, authority, frequency, replication, replay, persistence and accessibility policy. | 23C | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-PRES-004** | Continuous presentation state must use approved typed parameters with units/ranges/update rates/smoothing/privacy/fallback rules rather than arbitrary object inspection. | 23C | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-PRES-005** | Presentation Context Packets must be compact immutable event-time snapshots sufficient for deterministic/reproducible resolution. | 23C | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-PRES-006** | Bindings must connect contracts to profiles/components through semantic spatial references rather than raw scene paths. | 23B/23C | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-PRES-007** | Binding resolution must use deterministic specificity/fallback rules including family/material/culture/biome/content-pack/accessibility/budget variants. | 23C | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-PRES-008** | Presentation composition must support explicit base/environment/damage/magic/warning/temporary/accessibility channels with priority/exclusivity/masks and critical-cue protection. | 23C | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-PRES-009** | Presentation lifecycle must support cooldowns, repeat suppression, aggregation windows, sequence IDs, loop ownership, phase continuity and de-duplication. | 23C | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-PRES-010** | Meaningful multiplayer presentation must derive from authoritative confirmed state/events with bounded low-risk prediction and reconciliation. | 23C/23I | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-PRES-011** | Presentation replay/debug traces must store contract IDs, timestamps, compact context and resolution decisions rather than rendered particles or mixed audio. | 23C/23H/23I | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-PRES-012** | State-driven presentation must reconstruct correctly after reload, late join or LOD promotion without replaying obsolete transient events. | 23A/23C/23I | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-PRES-013** | Critical information must retain authored equivalents under reduced motion, reduced flash, colour filtering, low quality and muted audio. | 23A/23C/23H | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-PRES-014** | Presentation systems must support aggregation/virtualisation/budgets so dense villages, factories, weather and bosses remain bounded. | 23A/23E/23G/23I | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-PRES-015** | Persistent residues/feedback must use explicit surface/region presentation records or authoritative state-driven reconstruction rather than immortal effect instances. | 23D/23E/23I | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-SPAT-001** | Presentation spatial references must use stable semantic identity while physical mappings may vary by model, variant, damage, LOD or content-pack override. | 23B | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-SPAT-002** | Spatial reference types must distinguish Anchor, Socket, Region, Path, Surface Mask, Zone, Sound Portal and Runtime Anchor. | 23B | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-SPAT-003** | Spatial references must support whole assets, exact voxels, faces/texels, edges/vertices, local points, bones/body roles, blueprint cells, volumes, network routes and runtime contacts. | 23B | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-SPAT-004** | Every spatial reference must declare owner and coordinate space with explicit transform/scale policy. | 23B | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-SPAT-005** | Named Surface Masks must be preferred over fragile raw texture coordinates while still permitting exact/weighted/irregular mask precision. | 23B | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-SPAT-006** | Assets/entities/blueprints must be able to inherit spatial templates and override/remap only variant-specific mappings. | 23B | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-SPAT-007** | Runtime gameplay may provide temporary contact anchors containing authoritative position/normal/material/target context; presentation may consume but not invent them. | 23B | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-SPAT-008** | Spatial mappings must support LOD mappings, fallbacks, aliases, approximation rules, required/optional status and migration history. | 23B | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-SPAT-009** | Attachment follow behaviour must be explicit, including rigid, position-only, rotation-only, normal alignment, facing, path, snapshot, linger/fade/rebind policies. | 23B | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-SPAT-010** | Approval must block missing required references, duplicate IDs, orphan mappings, invalid paths, empty masks, broken portals, cyclic fallbacks, incompatible sockets or absent LOD policy. | 23B | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-SPAT-011** | Editable spatial source must bake into compact lookup/remap products; runtime must instantiate only active attachments rather than one node per authored reference. | 23B | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-SPAT-012** | Persistent saves must store owner IDs and semantic spatial IDs rather than raw transforms where the reference is persistent. | 23B | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-VFX-001** | Approved VFX source must use genuine three-dimensional voxel-derived geometry rather than conventional billboard/sprite particles as authored source. | 23A/23D/23E | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-VFX-002** | Voxel trails/beams must use segmented voxel/path forms rather than smooth ribbon dependencies. | 23D/23E | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-VFX-003** | Fog/mist/volumes must use bounded three-dimensional voxel cells/volumes with aggressive LOD rather than full-screen soft-sheet substitution. | 23D/23E | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-VFX-004** | VFX families/templates must support inheritance of timing/grammar/budgets with variants overriding only necessary palette/form/density/child layers. | 23D | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-VFX-005** | VFX graphs must be bounded typed dataflow with explicit execution domains, deterministic dependency order, bounded loops/counts and compile-time validation. | 23E | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-VFX-006** | Shipped effects must use compiled/flattened runtime plans rather than unrestricted editor graph interpretation per effect instance. | 23D/23E | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-VFX-007** | Emitters must support explicit start/update/stop/cancel/pause/resume/virtualise/destroy lifecycle and burst/rate/interval/sequence/path/surface/region/volume/event modes. | 23E | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-VFX-008** | Particle instances must reference shared/bounded voxel-form resources and preserve the voxel visual language through transforms/frame changes/fragmentation. | 23E | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-VFX-009** | VFX motion may support physical-looking forces/fields but remains presentation-only unless authoritative gameplay supplies results. | 23E | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-VFX-010** | VFX collision may alter presentation behaviour but cannot apply damage or gameplay resource changes. | 23E | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-VFX-011** | VFX light requests must use bounded light profiles with importance, shadow/radius/flicker, accessibility and LOD budgets. | 23E | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-VFX-012** | Surface writes from VFX must pass validated persistence/save policy and cannot create unbounded per-particle saved records. | 23E | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-VFX-013** | VFX randomness must expose deterministic seeds/selection keys where replay, multiplayer or review consistency requires them. | 23D/23E | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-VFX-014** | VFX runtime products must omit unused particle fields and support clean pooling/reset, aggregation, virtualisation and LOD phase continuity. | 23E | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-VFX-015** | VFX validation must hard-bound counts/rates/lifetimes/histories/children/writes and clamp external parameters. | 23E | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-VFX-016** | VFX multiplayer prediction/confirmation must not duplicate output. | 23E/23I | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-AUDIO-001** | Sound Forge must author/import/record/layer/process/vary/package reusable Sound Events with provenance and reviewable source rights metadata. | 23F/23J | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-AUDIO-002** | World audio must resolve material/contact context rather than attaching one flat clip directly to each object. | 23F/23G | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-AUDIO-003** | Audio spatial sources must support point, oriented point, line, path, surface, region, volume, area-bed and runtime-cluster shapes. | 23G | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-AUDIO-004** | Large audio sources must localise from appropriate nearest path/surface/region geometry rather than an incorrect single centre point. | 23G | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-AUDIO-005** | Moving/teleporting sources must use explicit update/crossfade/restart/phase policies so portals/LOD changes do not create false sweeping movement. | 23G | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-AUDIO-006** | Static audio placement must resolve through 23B semantic spatial IDs with declared fallback order. | 23B/23G | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-AUDIO-007** | Audio must support material response matrices for footsteps, impacts, mining, breaking, rain and other contextual interactions. | 23G | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-AUDIO-008** | Acoustic representation must support rooms/zones/openings/Sound Portals and bounded propagation/leakage suitable for voxel structures. | 23B/23G | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-AUDIO-009** | Runtime mixing must support bus/snapshot priorities, critical-cue protection, voice budgets, clustering and virtualisation. | 23G | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-AUDIO-010** | Dense repeated machine/station/crowd sources must aggregate by family while preserving locally important interaction/warning cues. | 23G | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-AUDIO-011** | Machine/magic audio may communicate throughput/charge/strain/instability but cannot infer or own those gameplay states. | 23G | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-AUDIO-012** | Audio accessibility must provide captions/visual or other equivalents for critical information and remain useful when audio is muted. | 23A/23C/23G/23H | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-AUDIO-013** | Audio systems must be scalable from isolated sources to capital-city density without requiring every potential source to remain active. | 23G/23I | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-UX-043** | Presentation Forge must provide dedicated editors/overlays for spatial references, profiles, contracts, VFX, audio, acoustics, accessibility and test/replay workflows. | 23H | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-UX-044** | Creators must be able to inspect resolved presentation context, fallbacks, budgets and diagnostics without editing gameplay code. | 23H | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-UX-045** | The Test Laboratory must support saved scenarios, runtime capture, replay, comparison and assertions across presentation systems. | 23H/23I/23J | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-UX-046** | Forge accessibility review must include a critical-cue matrix and produce review evidence, not rely on visual/audio intuition alone. | 23H/23J | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-UX-047** | Forge recovery must restore unsaved source after simulated failure as part of acceptance testing. | 23H | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-UX-048** | Review workflow must support version-safe comments, diffs, approval and rejection records. | 23H/23J | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-UX-049** | Performance tooling must identify stress-scene contributors and verify fallback ladders rather than expose only aggregate frame time. | 23H/23I | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-ID-039** | Entity, Blueprint, spatial, event, VFX, audio and presentation identities must be semantic stable IDs, not scene paths or generated resource paths. | 22K; 23A–23J | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-ID-040** | Runtime registries may cache engine resource paths only after stable-ID resolution; gameplay/content contracts must not use paths as identity. | 22K; 23I | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-ID-041** | Shared marker/spatial/event registries must permit namespaced extension only through declared extension points and reject unknown required gameplay semantics. | 22K; 23B/23C | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-ID-042** | Content revisions that preserve gameplay contracts should avoid save rewrites; contract-breaking revisions require explicit compatibility tokens/migrations. | 22K; 23I/23J | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-MP-012** | Multiplayer content handshake must compare required gameplay-contract versions and presentation compatibility, allowing cosmetic differences only when declared safe. | 22K; 23I | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-MP-013** | Client presentation files must never expand authoritative collision, attack reach, capacity, network ports or other gameplay capability. | 22K | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-MP-014** | Deterministic cosmetic variation may reconstruct locally from authoritative seed tokens only when compatible profiles are present. | 22K; 23I | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-PERF-011** | Forge/runtime performance budgets must be explicit for entity geometry/rigs/animation/collision, blueprint complexity, VFX, lights, audio voices and dense-scene multipliers. | 21F; 22K; 23E/23G/23I | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-PERF-012** | Profiling gates must use representative packaged/runtime scenarios in addition to editor previews. | 21G v0.2; 22K; 23I/23J | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-PERF-013** | LOD/fallback changes must preserve critical gameplay readability and accessibility even when decorative fidelity is reduced. | 22H; 23A/23E/23G | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-DEV-019** | Golden representative content must cover major body families, Blueprint types and presentation scenarios for regression/determinism testing. | 22K; 23J | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-DEV-020** | CI must validate schemas, IDs, dependencies, deterministic bakes, migrations, representative scenarios and protected contract compatibility. | 21F; 22K; 23I/23J | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |
| **REQ-DEV-021** | Technical implementation specifics inherited from Summer-era plans are hypotheses/legacy implementation guidance unless independently revalidated for the current Godot+Zylann rebuild. | PRD-00 authority rule applied to 21F/22K/23I | Design/tool/runtime constraint → FORGE-ENG; PRD-03/04/06/07 as applicable |

# 25. Round-7 Explicit Unknowns / Evidence Gaps
| ID | Unknown / evidence gap | Required downstream |
|---|---|---|
| **UNK-FORGE-007** | What canonical editable source encoding should each Forge domain use under the current Godot+Zylann rebuild, and which parts merit custom binary storage? | PRD-03/04/06/07; FORGE-ENG |
| **UNK-FORGE-008** | How should shared Unified Forge services be packaged so specialist workspaces reuse them without becoming tightly coupled? | PRD-03/04; FORGE-ENG |
| **UNK-FORGE-009** | What incremental dependency graph and cache-key design keeps rebakes fast across thousands of cross-Forge assets? | PRD-03/04/06/07 |
| **UNK-FORGE-010** | What safe hot-reload boundaries are possible for assets/entities/blueprints/presentation while a world is running? | PRD-03/04/06/07 |
| **UNK-FORGE-011** | What restricted player-creator package format and sandbox boundary can safely reuse developer Forge tooling later? | PRD-04/06/07; Set33/37 |
| **UNK-ENT-001** | What runtime representation best maps semantic body-plan/rig source to Godot without locking content to fragile engine-specific node APIs? | PRD-03/04/06/07 |
| **UNK-ENT-002** | How many body/rig/animation LOD tiers are actually needed for dense settlements, herds and bosses on target hardware? | PRD-06/07 |
| **UNK-ENT-003** | Which procedural locomotion contacts are cosmetic versus authoritative movement inputs for each body family? | PRD-04/06/07 |
| **UNK-ENT-004** | How should equipment fitting and collision proxies scale across arbitrary body plans without an authoring explosion? | PRD-04/06/07; FORGE-ENG |
| **UNK-ENT-005** | What compact persistent appearance record survives future generator/profile revisions without changing old NPCs unexpectedly? | PRD-04/06/07 |
| **UNK-PLAN-011** | What compact Blueprint source representation supports large 3D structures, nested modules and stable internal IDs while remaining pleasant to edit? | PRD-03/04/06/07; FORGE-ENG |
| **UNK-PLAN-012** | How should Blueprint dependency locking/version ranges work for long-lived worlds and modded content? | PRD-04/06/07; Set39 |
| **UNK-PLAN-013** | How are terrain-adaptation previews reconciled with authoritative Zylann/worldgen edits without duplicating terrain truth? | PRD-02/04/06/07 |
| **UNK-PLAN-014** | What editing/streaming strategy keeps the Forge responsive for megastructures, dungeons, ships and environment-scale blueprints? | PRD-03/06/07; FORGE-ENG |
| **UNK-PRES-001** | What compact Presentation Context Packet fields are sufficient across all systems without becoming a universal object dump? | PRD-04/06/07 |
| **UNK-PRES-002** | What deterministic resolver precedence handles project/content-pack/accessibility/budget overrides without surprising authors? | PRD-04/06/07; FORGE-ENG |
| **UNK-PRES-003** | How long should presentation replay traces and persistent surface presentation records be retained before compaction? | PRD-04/06/07 |
| **UNK-SPAT-001** | How should semantic spatial references remap after destructive voxel edits, Blueprint upgrades, rig changes and LOD swaps? | PRD-03/04/06/07 |
| **UNK-SPAT-002** | What compact runtime representation supports exact voxel/face/mask/path references without excessive memory in large worlds? | PRD-03/04/06/07 |
| **UNK-SPAT-003** | How should acoustic Sound Portals and other zone graphs update when players edit voxel walls/openings dynamically? | PRD-02/03/04/06/07 |
| **UNK-VFX-001** | Which Godot rendering path best supports large quantities of genuine 3D voxel particles: MultiMesh, RenderingServer, GPU simulation, custom GDExtension, or a hybrid? | PRD-03/06/07 |
| **UNK-VFX-002** | What deterministic guarantees are required for VFX simulation versus only deterministic selection/replay intent? | PRD-04/06/07 |
| **UNK-VFX-003** | How should persistent surface layers be stored/merged/expired across chunk unload, save and multiplayer? | PRD-02/04/06/07 |
| **UNK-VFX-004** | What hard particle/light/volume budgets preserve the voxel style on low-end through high-end profiles? | PRD-06/07 |
| **UNK-AUDIO-001** | What audio voice, cluster and virtualisation budgets are appropriate from hamlet to capital-city scenes? | PRD-03/06/07 |
| **UNK-AUDIO-002** | What bounded acoustic model gives convincing voxel-room/door/cave behaviour without expensive full physical acoustics? | PRD-03/04/06/07 |
| **UNK-AUDIO-003** | How should multi-listener/split-screen audio arbitration work? | PRD-03/04/06/07 |
| **UNK-AUDIO-004** | What source-rights/provenance metadata and tooling are required for shipped/community audio packages? | PRD-04; Set37/42 |
| **UNK-MP-002** | What exact compatibility hash/manifest fields distinguish gameplay-contract mismatch from safe cosmetic mismatch? | PRD-04/06/07; Set31/39 |
| **UNK-MP-003** | Which presentation events may be predicted locally and what reconciliation rules prevent duplicate VFX/audio? | PRD-04/06/07 |
| **UNK-PERF-004** | What representative entity/Blueprint/VFX/audio stress scenes define P3/P4 proof for Forge runtime products? | PRD-06/07 |
| **UNK-DEV-003** | Which 21F/22K/23I Godot implementation recommendations survive direct validation against the current Godot and Zylann versions? | PRD-02/03/05 |
| **UNK-DEV-004** | What Forge automated test harness can exercise editor-source, bake, runtime read-back, migration and packaged-game scenarios in CI? | PRD-03/06/07 |
| **UNK-UX-009** | How should the Unified Forge expose advanced graph/spatial/rig tools without making common asset authoring unnecessarily complex? | FORGE-ENG UX prototypes; PRD-07 |
| **UNK-UX-010** | What collaboration/version-control workflow should replace the original v0.1 deferral of networked collaborative editing, given future Set33/37 constraints? | PRD-04; future planning |

# 26. Round-7 Coverage Result

Forge Sets 21–23 are complete for the **initial PRD-01 extraction baseline**.

Round 7 added **137 unique technical requirements** and **35 explicit unknowns/evidence gaps**. The major retained contracts are:

- one Unified Forge with specialist Asset / Entity / Blueprint / Presentation ownership;
- canonical editable source separated from deterministic rebuildable runtime products;
- stable semantic IDs rather than engine paths;
- non-destructive overrides, inheritance, dependency-aware baking, migration and recovery;
- a genuine 3D authoring environment for voxel assets, entities and structures;
- semantic body plans, rigs, equipment, gameplay markers and disposable loaded actors;
- semantic Blueprint layers, stable internal element IDs, nested modules and sparse placed-state deltas;
- contract-driven presentation with immutable context packets and no gameplay authority;
- stable spatial anchors/sockets/regions/paths/masks/zones/portals;
- genuine 3D voxel VFX with bounded compiled graphs, LOD, pooling and accessibility fallbacks;
- contextual material/spatial audio with bounded acoustics, clustering, voice budgets and critical-cue protection;
- cross-Forge production gates coordinated by 21G v0.2, 22L and 23J; and
- Summer-era implementation recommendations retained only as hypotheses/evidence until current Godot + Zylann validation.

**Forge Sets 21–23 baseline status: COMPLETE for initial PRD-01 extraction.**

The next source family is **Document Set 24 — World Content Atlas**. PRD-01 must extract technical capability pressure from the Atlas while respecting PRD-00's rule that later FCC content supersedes conflicting Atlas content within FCC-owned scope.

# 27. Round-8 — Document Set 24 World Content Atlas Technical Requirement Extraction

## 27.1 Scope and authority handling

Round 8 extracts **implementation-neutral capability pressure** from Set 24A–24L.

The Atlas is treated as an important world/content architecture source, but PRD-00 authority rules are enforced:

- Set 24 remains authoritative for Atlas relationship/completeness concepts where not superseded.
- Later FCC material supersedes conflicting realm/biome/site/resource/content identity within FCC-owned scope.
- Old POC arrangements and old realm rosters are **not** reintroduced as requirements.
- Counted content registries are not converted into fake engine requirements for every named entry.
- The extraction focuses on topology, deterministic assembly, relationships, ecology, civilisation, sites, threats, resources, history, migration, validation and production capability.

## 27.2 New requirements

| ID | Normative requirement | Primary source(s) | Classification / downstream |
|---|---|---|---|
| **REQ-WLD-004** | The runtime must represent a nested spatial/topological hierarchy at least equivalent to World Save → Realm → Macro-Region → Region → Biome Patch/Sub-Biome → Site/Anchor → Local Voxel Area, with each layer owning only its appropriate scale of state. | 24A §§7,22; 24L §§19–27 | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-WLD-005** | World saves must retain world profile, calendar/chronology, realm-network identity, global history, content manifest/hash information and generation version independently from loaded voxel scenes. | 24A §§7–8,23; 24L §48 | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-WLD-006** | Macro-regions and regions must be addressable persistent world entities with climate/history/route/civilisation/ecology/threat metadata rather than being inferred only from current chunks. | 24A §7; 24B §§4–11 | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-WLD-007** | World topology must support surface, marine, sky/aerial, shallow-underground and deep-underground environmental layers that can overlap or connect without being collapsed into one biome field. | 24A §7.1; 24C §§4,21,24 | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-WLD-008** | Named regions/sites must be able to persist through conquest, restoration, destruction, environmental change and ownership change while retaining historical identity. | 24A §§8,20; 24K §§11,33–36 | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-WLD-009** | World content must support runtime overlays/states whose identity is separate from immutable base-definition identity. | 24A §20; 24B §33; 24C §31; 24K §§33–35 | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-WGEN-039** | Normal production worlds must be assembled deterministically from authored content families and constraints rather than from a fixed hand-authored POC map. | 24A §§1,5–6 | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-WGEN-040** | The same world seed, world profile, content manifest and generation version must produce the same untouched base-world selections and relationships. | 24A §6; 24L §44 | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-WGEN-041** | Generation domains must use namespaced derived random streams so adding/changing one content family does not reshuffle unrelated domains such as rivers, settlements or anatomy. | 24A §§6,8 | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-WGEN-042** | Generation must separate immutable conceptual base generation from persistent player/simulation deltas and history. | 24A §6; 24L §§45,48 | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-WGEN-043** | Generation must use staged dependency-aware assembly with validation outputs and controlled repair/fallback passes rather than an opaque monolithic generator. | 24A §§9,18,27 | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-WGEN-044** | Generation eligibility must apply hard constraints before soft weights/preferences, and selection from valid candidates must be deterministic. | 24A §§6,12; 24L §§11–12 | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-WGEN-045** | Generation must support negative/exclusion constraints as first-class inputs, not only positive tags and weights. | 24A §12 | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-WGEN-046** | Capability queries must be able to select any compatible provider rather than requiring fixed IDs where design intent is substitution. | 24A §18; 24L §§11–12,44 | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-WGEN-047** | Spawn/early-world validation must guarantee viable shelter/resource/escape/building/progression routes without requiring fixed named content. | 24A §18; 24B §14; 24L §44 | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-WGEN-048** | Progression reachability validation must cover tools, materials, knowledge, settlements, magic, automation, sites/bosses and realm access through valid paths or substitutes. | 24A §18; 24L §44 | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-WGEN-049** | Generation must validate route connectivity so important settlements, resources, sites, portals and regional services are not isolated by impossible topology. | 24A §§14,18; 24C §§25,37; 24L §44 | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-WGEN-050** | Missing preferred optional content must trigger controlled substitution, relocation, clue/trade-route generation or explicit world-generation failure rather than silent invalid worlds. | 24A §18; 24L §44 | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-WGEN-051** | Generated instances such as regions, settlements, major structures, portals, dungeons, bosses and named people must receive persistent runtime identity independent of coordinate alone. | 24A §8.1 | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-WGEN-052** | Generation records must retain definition IDs plus seed/version/provenance inputs sufficient to explain how major generated instances were created. | 24A §8.1 | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-WGEN-053** | World upgrades must not silently rewrite explored terrain; new generation/content must follow explicit manifest/version rules and provide discovery routes where necessary. | 24A §23; 24L §§44,48 | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-WGEN-054** | Seed QA must include determinism, diversity, spawn viability, progression reachability, route connectivity, content-density and fallback-repair suites over large seed batches. | 24A §27; 24L §44 | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-WGEN-055** | World generation must preserve wilderness/building space while satisfying minimum civilisation, discovery and progression density constraints. | 24A §§19,25; 24L §44 | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-SIM-011** | Atlas-scale simulation must support explicit simulation profiles for regions, settlements, routes, ecologies, dungeons, bosses and realms, with bounded inactive-world processing. | 24A §22; 24L §45 | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-SIM-012** | Promotion/demotion between Atlas summaries and active local simulation must preserve causal world state and not respawn a contradictory local reality. | 24A §22; 24K §37 | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-SIM-013** | Major content definitions must declare simulation class, expected density, rendering cost, memory class, save-size class and network relevance as data. | 24L §45 | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-ID-043** | Atlas definitions must use stable namespaced IDs, aliases, schema versions, parent/variant relations, provenance and content hashes. | 24A §§4,8,23; 24L §§6–8 | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-ID-044** | Definitions, parent families, regional/cultural variants, generated instances and runtime states must remain distinct identity layers. | 24A §13; 24L §7 | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-ID-045** | Hard definition references, soft references, capability queries, weighted candidate sets, generated instance bindings and historical tombstones must have distinct resolution semantics. | 24L §11 | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-ID-046** | Historical tombstones must allow references to destroyed/removed entities to resolve to evidence/history rather than silently disappearing. | 24K §§10,36; 24L §11 | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-ID-047** | Deprecated Atlas definitions must supply replacement, conversion, tombstone or explicit incompatibility policy. | 24L §§42,48 | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-ID-048** | Definition split/merge migrations must preserve inventory, structure, history, relationship and provenance semantics where compatible. | 24L §48 | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-ID-049** | World manifests must record enabled packs, versions, hashes, selected definitions, generation version, applied migrations and unresolved warnings. | 24L §14 | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-GOV-013** | The Atlas relationship graph must support typed, directional, cardinality-aware relationships across spatial, ecological, civilisation, functional, progression, narrative, ownership/law, presentation and technical domains. | 24L §§9–10 | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-GOV-014** | Atlas tags may accelerate filtering but must not substitute for typed fields, capability checks and semantic validation. | 24L §12 | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-GOV-015** | Inheritance, composition modules, regional variants, cultural variants, runtime state variants, generated detail and signature overrides must have distinct reuse semantics. | 24L §13 | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-GOV-016** | Generated detail may fill declared slots but must not invent unsupported capabilities. | 24L §13 | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-GOV-017** | Content packs must declare namespace, version, schema range, dependencies, conflicts, load order, optional features, localisation/assets and migrations. | 24L §14 | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-GOV-018** | Hard pack dependencies must be acyclic and deterministic; soft dependencies may enable optional relationships/fallbacks. | 24L §§14,42 | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-GOV-019** | Core IDs must not be silently replaced by content-pack overrides; patches must declare target version, changed fields, priority, compatibility and uninstall behaviour. | 24L §14 | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-GOV-020** | Pack removal must provide fallback/tombstone/conversion or a clear incompatibility warning before world load. | 24L §§14,48 | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-GOV-021** | Mods/content packs must not bypass protected authority, security, save, transaction or personhood rules. | 24L §14 | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-GOV-022** | Each Atlas package family must satisfy a completeness contract tying it to its required world, ecology, civilisation, progression, presentation, persistence and runtime relationships rather than being approved as an isolated entry. | 24A §25; 24L §§19–31 | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-GOV-023** | Production status must distinguish definition completeness, cross-link completeness, representation readiness, runtime validation and shipping classification rather than only counting entries. | 24A §§25–26; 24L §§31–33 | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-GOV-024** | Atlas content budgets must control authored scope, repetition and minimum coverage while remaining data/planning constraints rather than runtime assumptions about exact content counts. | 24A §§19,25; 24L §§34–37 | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-ECO-033** | Ecology definitions must encode habitat suitability, food-web relationships, migration corridors, avoidance/pressure relationships and population suitability rather than independent spawn tables. | 24A §§11–15; 24F | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-ECO-034** | Predators must have prey or alternate food support and ecology validation must reject incoherent population compositions. | 24F; 24L §43 | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-ECO-035** | Flora/fauna/resource relationships such as pollination, decomposition, grazing, predation, parasitism and nesting must be representable as typed ecological edges. | 24A §11; 24F; 24L §§10,12 | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-ECO-036** | Creature populations must be able to migrate through connected regional habitat rather than existing only as chunk-local spawn pools. | 24A §15; 24B §29; 24C §35; 24F | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-ECO-037** | Ecology must react persistently to habitat loss, hunting, extraction, contamination, climate/disaster change and restoration. | 24B §§27,29,33; 24C §§35–36; 24F | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-ECO-038** | Ecology placement must support ambient populations, nests/lairs, migratory populations, regional pressure and boss/titan relationships without conflating them. | 24A §15; 24F | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-ECO-039** | Ecological content must expose resource/economic/civilisation consequences so population change can affect food, materials, hazards and local behaviour. | 24F; 24J | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-CIV-035** | Generated people and settlements must be assembled from independent ancestry, culture, faction, household, profession, government, language, faith, territory and history layers rather than one compound race/faction template. | 24A §14; 24E | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-CIV-036** | Cultures and factions must be able to migrate, hybridise, split, merge, occupy, trade and form historical claims while preserving persistent people and place identity. | 24E; 24K §§12–15 | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-CIV-037** | Settlement generation must validate survival/service capabilities such as water, housing, storage, route access and viable livelihood or declared alternatives. | 24A §14; 24E; 24L §43 | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-CIV-038** | Territory, political control, ownership, legal claims and cultural identity must remain separable and historically trackable. | 24E; 24K §§12,14,35 | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-CIV-039** | Civilisation placement must be conditioned by climate, resources, terrain, routes, history, hazards and cultural adaptation rather than biome-name stereotypes. | 24B §30; 24E | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-CIV-040** | Cultures must be able to export/trade only goods supported by actual material sources, production structures and route/economic relationships. | 24E; 24J; 24L §43 | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-CIV-041** | Procedurally generated cultures/peoples must not automatically infer hostility, criminality, primitive status, biological profession restrictions or denied personhood from ancestry/appearance. | 24E; 24L §§43,47 | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-STR-032** | Sites must support authored origin/purpose, builder/occupant/history, topology, entrance/route logic, hazards, rewards, ecology and persistent future state rather than being isolated encounter rooms. | 24A §16; 24G | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-STR-033** | Dungeon/site generation must support procedural grammar from authored modules while preserving stable site identity and semantic validation. | 24A §16.3; 24G | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-STR-034** | Dungeon states must support conditions such as active, abandoned, occupied, sealed, damaged, corrupted, restored or converted without changing underlying site identity unnecessarily. | 24A §16.2; 24G | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-STR-035** | Megadungeons must support persistent multi-region/multi-district topology, multiple routes/entrances, factions/ecologies, logistics and long-term state rather than a single loaded scene. | 24G; later FCC-01 specialist ownership where applicable | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-STR-036** | Sites must validate a usable entrance/approach/retreat relationship and cannot be approved solely because interior content exists. | 24G; 24L §43 | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-STR-037** | Static structures, landmarks, roads, bridges, ports, deep routes, aerial routes, wonders and regional infrastructure must be representable as persistent Atlas-connected world entities. | 24I | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-STR-038** | Routes must be first-class graph entities with hierarchy, condition, ownership/use, capacity/hazard and connectivity relationships rather than decorative splines only. | 24C §37; 24I | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-STR-039** | World infrastructure must be able to change state through construction, damage, blockage, repair, occupation and environmental transformation while preserving historical continuity. | 24I; 24K §§33–36 | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-STR-040** | Structure/wonder placement must support regional/relational anchors and history/ecology/civilisation constraints rather than fixed coordinates. | 24A §§14,16; 24I | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-CMB-039** | Bosses, titans, siege threats and realm authorities must have a territory/world role, discovery path, pre-confrontation pressure, confrontation contract, alternative outcomes where defined and persistent aftermath. | 24A §15.2; 24H | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-CMB-040** | Boss placement must validate sufficient territory/arena/context and cannot be reduced to an arena plus loot table. | 24A §15.2; 24H; 24L §43 | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-CMB-041** | Boss/titan pressure must be able to affect ecology, routes, settlements, factions, resources and world events before direct player confrontation. | 24H; 24K §§25,33–35 | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-CMB-042** | Boss resolution must support persistent world-state consequences such as territory release, migration, political change, ecological recovery/imbalance, ruin/restoration or continuing allegiance. | 24H; 24K §36 | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-CMB-043** | Siege-scale threats must support regional/settlement preparation and consequence state beyond local combat-actor simulation. | 24H; 24K §§25,32 | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-REALM-032** | Realm networks must be generated as persistent connected topology with explicit routes/anchors/access rules rather than a flat level-select list. | 24A §17; 24D | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-REALM-033** | Each major realm must be able to provide its own multi-region/multi-biome topology, societies, ecology, resources, sites, bosses, hazards and long-term world states. | 24A §17; 24D | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-REALM-034** | Realm generation must preserve realm-local laws such as gravity/time/environment/access without forcing those laws into universal Overworld assumptions. | 24D | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-REALM-035** | Cross-realm relationships must support influence/leaks, trade/migration, historical contact, portal routes, shared threats and aftermath while preserving each realm's sovereign persistent state. | 24D; 24K §13 | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-REALM-036** | Realm content must support realm-specific dungeon/site taxonomies and authority/boss roles while runtime mechanics remain implemented through shared interfaces where possible. | 24A §17.2; 24D | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-REALM-037** | Later FCC realm packages supersede conflicting Set-24 realm rosters/content, but the runtime must retain the generic multi-realm capabilities demanded by Set 24. | PRD-00 authority model applied to 24D | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-PROD-013** | Resources must be represented as part of material ecology with origin, abundance, renewability/depletion, extraction, processing, by-products, trade uses, hazards and environmental consequences. | 24J | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-PROD-014** | Resource availability must be region/biome/geology/ecology/history dependent rather than globally uniform. | 24B §28; 24C §36; 24J | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-PROD-015** | Extraction state must persist depletion, damage/contamination, regeneration or exhaustion independently of the decorative appearance of a resource site. | 24C §36.1; 24J | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-PROD-016** | Loot generation must use authored grammars, provenance/context and world-state eligibility rather than unrestricted random item tables. | 24J | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-PROD-017** | Relics/artifacts must preserve provenance, historical relationships, uniqueness/state and ownership history independently of ordinary item identity. | 24J; 24K §10 | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-PROD-018** | Unique rewards/relics must not duplicate through content removal, migration, reload or alternate site resolution. | 24J; 24L §48 | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-PROD-019** | Material scarcity and abundance must be able to change dynamically through depletion, trade disruption, ecological change, disasters and discovery. | 24J §45.1; 24K §§28,33–35 | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-ECON-005** | Trade relationships in the Atlas must bind real producing/consuming regions, settlements, resources and routes while leaving price/market authority to the later economy owner. | 24E; 24I; 24J; Set-27 owner boundary | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-ECON-006** | Regional goods and cultural trade specialisation must be explainable by actual resource/production/culture/route relationships rather than arbitrary flavour tags. | 24J; 24L §43 | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-QST-030** | World history must be representable as persistent typed incidents connecting causes, actors, places, evidence and outcomes rather than as lore text disconnected from world state. | 24A §10; 24K §§5,8–10 | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-QST-031** | Procedural history must be deterministic from world identity/history seeds and authored event grammars while preserving coherent causal ordering. | 24A §10; 24K §8 | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-QST-032** | Historical events must be able to leave physical, institutional, cultural, ecological, political and narrative evidence in the current world. | 24A §10; 24K §§9–14,36 | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-QST-033** | The system must distinguish objective world truth, cultural belief, propaganda, oral tradition, rumours, uncertainty and player-discovered knowledge. | 24A §21; 24K §§6,15,21,41 | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-QST-034** | Story/event selection must use authored grammars, role slots, eligibility, exclusions, cooldowns and fallback participants rather than hardcoded named POC actors. | 24K §§16–23 | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-QST-035** | Story arcs must support world, realm, culture, faction, settlement, site and character scales while binding to generated persistent instances. | 24K §§16–18 | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-QST-036** | Branching stories/events must support convergence, replacement and fallback paths that preserve continuity when expected participants/sites become unavailable. | 24K §19 | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-QST-037** | Events must be able to propagate consequences across climate/ecology, settlements, politics, trade, infrastructure, magic, sites, bosses and realms through controlled dependency relationships. | 24K §§22–34 | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-QST-038** | Dynamic world-state transitions must record cause, eligibility, entry state, active effects, exit/recovery conditions and aftermath rather than mutate arbitrary flags. | 24K §§33–36 | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-QST-039** | Aftermath must persist through memorials, records, ruins, changed ownership, ecology, trade, routes or other evidence as appropriate. | 24K §36 | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-QST-040** | Inactive-world history/events must advance through bounded summary simulation without requiring every actor/site to remain loaded. | 24K §37 | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-QST-041** | Generated quests/objectives must consume Atlas facts/events/history as evidence and discovery opportunities without making the quest system owner of those facts. | 24K §20; Foundation 15 ownership rule | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-PST-020** | Explored generated terrain must remain stable across worldgen-version upgrades unless an explicit migration transforms it. | 24A §23; 24L §48 | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-PST-021** | Save data must combine seed/base identity with journals/deltas, content manifest, migrations, unresolved-reference reporting and recovery snapshots. | 24L §45 | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-PST-022** | Pack removal must preserve unknown payload where practical so content can be restored if the pack is reinstalled. | 24L §48 | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-PST-023** | Failed migrations must never overwrite the last known-good save and must produce backup, diagnostics and recovery options. | 24L §48 | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-PST-024** | Removed unique world content must preserve historical evidence or controlled placeholder/recovery semantics and must not duplicate unique rewards. | 24L §48 | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-MP-015** | The host/server must own the authoritative world/content-pack manifest and clients must validate compatible logic/presentation before joining. | 24L §§14,45,48 | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-MP-016** | Generated instance bindings, inventory/resource transactions, combat, events, ownership and world-state changes must remain server/host authoritative in multiplayer. | 24L §45 | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-MP-017** | Multiplayer must preserve visible ownership/permissions/contribution semantics for destructive world actions and shared historical outcomes. | 24K §40; 24L §47 | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-PERF-014** | Atlas registries must keep compact immutable definition data resident while heavy assets and optional descriptive content can stream by domain/region. | 24L §45 | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-PERF-015** | World generation must support asynchronous staged work, cached validated manifests, bounded per-frame work and diagnostic progress. | 24L §45 | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-PERF-016** | Distant regions/settlements/routes/ecologies/dungeons/bosses/realms must use bounded summaries rather than retaining full actors/scenes. | 24L §45 | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-PERF-017** | Structures and dungeons must be representable through compact source/modules plus sparse runtime state rather than permanent loaded actors for every block/room. | 24L §45 | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-PERF-018** | Atlas content production must include performance, streaming, persistence, save-size and network budgets as release criteria. | 24L §§45–46 | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-UX-050** | Maps, codex, rumours and discovery UI must distinguish confirmed truth, uncertain reports, cultural belief and player knowledge state. | 24A §21; 24K §§15,21,41 | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-UX-051** | Generated names must support localisation/grammar/cultural rules and fallback handling rather than English-only concatenation. | 24A §21.2; 24B §11.1; 24L §47 | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-UX-052** | Critical hazards, bosses, portals and irreversible world-state changes must provide readable warnings and appropriate recovery/settings where compatible with design. | 24L §47 | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-UX-053** | Critical world information must not require colour perception, precise audio recognition, rapid repetitive input or one control scheme. | 24L §47 | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-UX-054** | Dynamic events must avoid deceptive urgency, punishment for ordinary breaks and forced daily-attendance mechanics. | 24L §47 | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-FORGE-044** | Atlas authoring tools must expose stable IDs, relationship edges, capability requirements, exclusions, provenance, completeness status and reverse-reference impact rather than raw free-form content only. | 24A §§11–12,26; 24L §§39,42–43 | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-FORGE-045** | World-content tooling must provide debug views for generation stages, region/biome relationships, progression coverage, route connectivity, content density and fallback/repair decisions. | 24A §27 | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-FORGE-046** | Atlas validation tooling must support schema/reference/namespace/dependency checks plus semantic/coherence/completeness/representation checks. | 24L §§41–44 | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-FORGE-047** | Before Atlas deletion/schema change, tools must report affected definitions, packs and saves through reverse references. | 24L §42 | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-DEV-022** | Atlas release gates must combine automated validation with human review for quality, representation, localisation, accessibility, player trust and balance. | 24L §§41,47,53 | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |
| **REQ-DEV-023** | AI-assisted Atlas production may propose content/relationships but must remain subject to human authority, review and protected-contract restrictions. | 24L §40 | Design/data/runtime constraint → PRD-03/04/06/07; LFE/FORGE-ENG as applicable |

# 28. Round-8 Explicit Unknowns / Evidence Gaps

| ID | Unknown / evidence gap | Required downstream |
|---|---|---|
| **UNK-WGEN-012** | What exact data structure represents the World→Realm→Macro-Region→Region→Site hierarchy while supporting streaming, queries, migration and multiplayer authority? | PRD-03/04/06/07 |
| **UNK-WGEN-013** | How should deterministic seed derivation remain stable when generation algorithms and content packs evolve over many game versions? | PRD-04/06/07; Set39 |
| **UNK-WGEN-014** | What content-hash boundary is sufficient to prove untouched-base reproducibility without hashing enormous generated worlds? | PRD-04/06/07 |
| **UNK-WGEN-015** | How can large-seed-batch validation prove progression reachability and route connectivity without fully generating every voxel of every test world? | PRD-03/04/06/07 |
| **UNK-WGEN-016** | What controlled repair operations are allowed after a generation validation failure without compromising determinism or creating obvious artefacts? | PRD-04/06/07 |
| **UNK-WLD-001** | How are macro-region/region boundaries represented spatially so they remain stable yet can support procedural coastlines, caves, oceans and player-altered terrain? | PRD-02/03/04/06/07 |
| **UNK-WLD-002** | How much Atlas metadata should be persisted per region versus reproducibly regenerated from seed? | PRD-04/06/07 |
| **UNK-ECO-008** | What ecological graph/population representation supports food webs and migration at world scale without becoming an O(n²) relationship simulation? | PRD-03/04/06/07 |
| **UNK-ECO-009** | How are habitat/carrying-capacity changes recomputed after voxel-scale terrain edits without rescanning entire regions? | PRD-02/03/04/06/07 |
| **UNK-ECO-010** | What aggregation model preserves notable individuals and causal population change while most wildlife remains regional summary state? | PRD-04/06/07 |
| **UNK-CIV-008** | What spatial/political representation supports moving borders, overlapping claims, cultural regions and legal jurisdiction without expensive per-voxel ownership maps? | PRD-03/04/06/07 |
| **UNK-CIV-009** | How should procedural history generate populations/settlements/factions without creating implausibly dense entity histories or huge saves? | PRD-04/06/07 |
| **UNK-STR-011** | What graph representation unifies roads, maritime routes, aerial routes, cave routes and realm routes while allowing domain-specific capacity/hazard rules? | PRD-03/04/06/07 |
| **UNK-STR-012** | How are persistent site/route identities reconciled when terrain destruction or construction physically moves/removes their geometry? | PRD-02/04/06/07 |
| **UNK-STR-013** | What compact state model supports multi-session megadungeons/large wonders without storing a full copy of every generated room/block? | PRD-02/04/06/07 |
| **UNK-CMB-011** | How should regional boss/titan pressure be simulated distantly so ecology, trade and settlements react causally without full boss AI? | PRD-04/06/07 |
| **UNK-REALM-012** | How does the Atlas realm-network representation reconcile with final FCC-12/13 portal/resource definitions and the eventual LFE realm-transition owner? | FCC-12/13 + PRD-04 |
| **UNK-REALM-013** | What topology/storage approach supports multiple persistent realm worlds without forcing all realms to stay loaded or share one chunk coordinate space? | PRD-02/03/04/06/07 |
| **UNK-PROD-005** | What material-ecology/depletion representation efficiently connects geological/ecological resource fields to actual voxel extraction and regeneration? | PRD-02/03/04/06/07 |
| **UNK-PROD-006** | How should relic/provenance history be compacted while retaining enough lineage for archaeology, quests, trade and unique-reward protection? | PRD-04/06/07 |
| **UNK-ECON-002** | What minimal Atlas trade relationship data belongs outside Set-27 economy authority so worldgen can place coherent routes/production without duplicating live market truth? | Set27 extraction; PRD-04 |
| **UNK-QST-011** | What world-history event granularity should be permanently stored versus compacted into derived summaries/evidence? | PRD-04/06/07 |
| **UNK-QST-012** | How can procedural history/event generation remain causally coherent when content packs add/remove possible cultures, sites or resources? | PRD-04/06/07; Set39 |
| **UNK-QST-013** | How should rumours, beliefs and propaganda reference facts that later become destroyed, migrated or reinterpreted? | PRD-04/06/07 |
| **UNK-QST-014** | What bounded consequence-propagation model prevents a world event from triggering an uncontrolled cascade across every connected system? | PRD-04/06/07 |
| **UNK-PST-004** | How should unexplored terrain switch to a newer worldgen version while preserving routes/regions that cross explored-version boundaries? | PRD-02/04/06/07; Set39 |
| **UNK-PST-005** | What unknown-payload preservation strategy allows removed mod content to be reinstalled without unsafe arbitrary-data retention? | PRD-04/06/07; Set37/39 |
| **UNK-ID-008** | What storage/index design supports millions of generated instance bindings and historical tombstones with fast reverse-reference queries? | PRD-03/04/06/07 |
| **UNK-GOV-002** | What deterministic override/load-order model should Atlas content packs use, especially when multiple packs patch the same optional fields? | PRD-03/04/06/07; Set37 |
| **UNK-GOV-003** | Which Atlas completeness checks are hard release blockers versus warnings requiring human justification? | PRD-06/07/09 |
| **UNK-PERF-005** | What concrete memory/save/network budgets should region, ecology, history, route and site summaries meet on low-end target profiles? | PRD-06/07 |
| **UNK-PERF-006** | What worldgen stages can execute asynchronously with Zylann/Godot without touching unsafe engine objects or violating deterministic commit order? | PRD-02/03/04/06/07 |
| **UNK-UX-011** | How should map/codex knowledge display uncertain or conflicting cultural claims without overwhelming the player? | PRD-07; later UX design |
| **UNK-FORGE-012** | What Atlas graph/editor UI can make thousands of typed relationships and reverse dependencies manageable for a small development team? | FORGE-ENG; PRD-07 |
| **UNK-FORGE-013** | What seed-debug visualisations are required to inspect climate, hydrology, ecology, civilisation, route and progression failures efficiently? | PRD-03/07 |
| **UNK-DEV-005** | Which Set-24 count/budget targets remain useful production goals after FCC-01 and FCC-12–14 reconciliation, and which are now historical? | PRD-01 delta after FCC-14 |

# 29. Round-8 Coverage Result

Document Set 24A–24L is complete for the **initial PRD-01 extraction baseline**.

Round 8 added **124 unique technical requirements** and **36 explicit unknowns/evidence gaps**.

The capability pressure retained from Set 24 is concentrated in:

- deterministic authored-random world assembly with isolated seed streams and controlled repair;
- persistent multi-scale topology from world/realm/region down to sites and active voxel areas;
- Atlas relationship graphs, capability queries, exclusions, generated bindings and historical tombstones;
- coherent climate/biome/marine/sky/underground content as connected world systems rather than isolated labels;
- persistent ecological networks, migration and consequences;
- layered civilisation identity, territorial/history state and route-aware settlement coherence;
- persistent sites, megadungeons, routes, wonders and boss territories with pre-state and aftermath;
- material ecology, provenance-aware loot/relics and depletion/scarcity state;
- deterministic procedural history, uncertainty/belief layers, event grammars and consequence propagation;
- content-pack/world-manifest compatibility, migration and removed-content recovery;
- large-seed-batch validation for determinism, diversity, progression, connectivity and fallbacks; and
- explicit Atlas performance/LOD/save/network budgets.

**Authority note:** later FCC packages remain authoritative for conflicting realm/content identity. Set 24's old named content is not restored by this extraction.

**Document Set 24 baseline status: COMPLETE for initial PRD-01 extraction.**

The next source family is **Document Set 25 — Post-Atlas Production Governance, Registries, Classification and Integration**.

# 30. Round-9 — Document Set 25 Post-Atlas Governance / Registry / Production Integration Extraction

## 30.1 Scope and authority handling

Round 9 extracts Set 25A–25L as the project's **post-Atlas governance and production-control layer**.

Important source handling:
- 25A and 25B **v0.2** are used instead of their earlier v0.1 revisions.
- 25C–25L v0.1 remain active within their owned scope.
- Set-25 production classifications and old Core-roster choices are not allowed to override later FCC canon.
- Summer Engine-specific task wording in 25L is treated as historical implementation/process evidence; the durable requirements are bounded tasks, repository audit, evidence, rollback, ownership and change control.
- Set 25 completion is not treated as implementation/integration closure.
## 30.2 New requirements

| ID | Normative requirement | Primary source(s) | Classification / downstream |
|---|---|---|---|
| **REQ-GOV-025** | Production governance must distinguish canon/design approval, production classification, data readiness, integration evidence and final release closure; document completion alone cannot imply implementation closure. | 25A v0.2; 25L | Governance/data/runtime/evidence constraint → PRD-03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-GOV-026** | Retired POC identities must remain isolated in archive/test/development namespaces and cannot enter normal production generation, manifests or fallback selection. | 25A v0.2; 25B v0.2 | Governance/data/runtime/evidence constraint → PRD-03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-GOV-027** | Reusable mechanics/assets from the POC may be re-admitted only under production identities with current ownership/package contracts rather than by aliasing archive POC identity directly into production. | 25B v0.2 §31 | Governance/data/runtime/evidence constraint → PRD-03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-GOV-028** | Scope changes after a production lock must be explicit, dependency-aware and account for displaced work rather than silently expanding the milestone. | 25F §§6–7,37 | Governance/data/runtime/evidence constraint → PRD-03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-GOV-029** | Production tiers such as Core, Early Access, Full Release, Later Expansion and Tooling Research must remain classification/planning metadata rather than gameplay properties. | 25F §§4–6 | Governance/data/runtime/evidence constraint → PRD-03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-GOV-030** | A selected production package must be dependency-complete for the role it is intended to prove; isolated entries cannot be marked complete when required physical/runtime/presentation relationships are absent. | 25C §§29–32; 25F; 25G | Governance/data/runtime/evidence constraint → PRD-03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-GOV-031** | Major expansions must enter through the same registry/pack/validation kernel and registered extension interfaces rather than creating parallel identity or authority systems. | 25A/25B/25C/25D | Governance/data/runtime/evidence constraint → PRD-03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-GOV-032** | One logical definition may be assembled from multiple owned facets, but each authoritative field path has exactly one canonical owner. | 25B v0.2; 25D | Governance/data/runtime/evidence constraint → PRD-03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-GOV-033** | Cross-system source-of-truth integrity audits must identify duplicate ownership, POC leakage, superseded implementation assumptions and unresolved integration debt before release closure. | 25A v0.2; 25L | Governance/data/runtime/evidence constraint → PRD-03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-GOV-034** | A work package may recommend redesign but cannot silently alter canon, ownership, progression, release tier or protected contracts. | 25L §45 | Governance/data/runtime/evidence constraint → PRD-03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-GOV-035** | Dependency-equivalent scope substitution is allowed only when capability, world role, physical I/O, presentation, fallback and acceptance obligations remain complete. | 25L §45 | Governance/data/runtime/evidence constraint → PRD-03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-GOV-036** | Completion claims must be evidence-backed; prose status alone cannot mark a production package complete. | 25L §16 | Governance/data/runtime/evidence constraint → PRD-03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-ID-050** | Placeable block item-form policy must explicitly distinguish generated, explicit special item, packed block entity, project-only, non-removable and no-item-form cases. | 25I §8 | Governance/data/runtime/evidence constraint → PRD-03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-ID-051** | Item definition, stack, unique instance and runtime state must remain separate so stackability never erases required provenance/condition/ownership. | 25I §§7,10,31 | Governance/data/runtime/evidence constraint → PRD-03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-ARCH-039** | The registry kernel must compile immutable definitions plus authorised facets into validated runtime registries/indexes while mutable world state remains in owner services. | 25B v0.2; 25D | Governance/data/runtime/evidence constraint → PRD-03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-ARCH-040** | Canonical relationship edges must be authored once; inverse edges and search/reverse indexes are derived products rather than duplicate editable truth. | 25C | Governance/data/runtime/evidence constraint → PRD-03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-ARCH-041** | Runtime builds must consume validated compiled registries and asset packages, not spreadsheets or uncontrolled editor-source files. | 25D | Governance/data/runtime/evidence constraint → PRD-03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-ARCH-042** | The content supply chain must separate authoritative source → normalised interchange → compiled registry/runtime products → immutable snapshot/lockfile. | 25D §§5–11,23,28 | Governance/data/runtime/evidence constraint → PRD-03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-ARCH-043** | Generated Godot Resources/runtime artifacts are engine-facing outputs unless a specific owner explicitly designates a hand-authored Resource as canonical source. | 25D | Governance/data/runtime/evidence constraint → PRD-03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-ARCH-044** | Registry snapshots must be immutable/content-addressed enough to prove which definition truth a build/world/session used. | 25D §§28–29 | Governance/data/runtime/evidence constraint → PRD-03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-ARCH-045** | Validation architecture must support one orchestrated assurance pipeline with stable validator/suite/fixture identities while retaining domain-specific validators. | 25E §§5–7 | Governance/data/runtime/evidence constraint → PRD-03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-ARCH-046** | Validation must run in ordered layers from schema/identity through semantic/completeness, generation/reachability, runtime/persistence/performance and human release approval. | 25E §5 | Governance/data/runtime/evidence constraint → PRD-03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-FORGE-048** | Asset requirements must distinguish gameplay definition, editable asset source and generated runtime product identities. | 25K §§7–10 | Governance/data/runtime/evidence constraint → PRD-03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-FORGE-049** | Derived asset variants must declare parent, changed fields, source/runtime cost and reason reuse of the parent is insufficient. | 25K §11 | Governance/data/runtime/evidence constraint → PRD-03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-FORGE-050** | Every asset pack must declare owner pack, required/optional dependencies, compatibility range, runtime bundles and source/evidence manifests. | 25K §28 | Governance/data/runtime/evidence constraint → PRD-03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-FORGE-051** | Missing optional asset packs must resolve through approved fallback, explicit unavailability/dependency reporting or preserved opaque state for reactivation. | 25K §28 | Governance/data/runtime/evidence constraint → PRD-03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-PROG-025** | Capabilities must be stable functional outcomes independent of the named provider currently satisfying them. | 25C §19 | Governance/data/runtime/evidence constraint → PRD-03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-PROG-026** | Capability offers must declare provider, band/capacity where applicable, scope, access/conditions, substitutes and player-visible evidence. | 25C §20 | Governance/data/runtime/evidence constraint → PRD-03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-PROG-027** | Capability requirements must declare minimum semantics, substitution policy, fallback group and player-facing failure reason. | 25C §20 | Governance/data/runtime/evidence constraint → PRD-03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-PROG-028** | Capability bands are capability-specific ordered semantics and must not be inferred from rarity, colour, lore status or one universal material tier. | 25C §21 | Governance/data/runtime/evidence constraint → PRD-03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-PROG-029** | Suitability evaluation must reject hard constraints/exclusions/dependency/capability/spatial/tier failures before applying soft preference weights. | 25C §22 | Governance/data/runtime/evidence constraint → PRD-03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-PROG-030** | Deterministic candidate selection must use stable ordering/tie-breaking and record rejected reasons, score components and fallback/repair use. | 25C §§22–26 | Governance/data/runtime/evidence constraint → PRD-03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-PROG-031** | Fallback groups must preserve required capabilities through equivalent providers/repairs without hardcoding retired POC identities or fixed arrangements. | 25C §26 | Governance/data/runtime/evidence constraint → PRD-03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-PROG-032** | Progression reachability must prove capabilities are obtainable through valid actions, not merely present somewhere in the registry/world. | 25C §27; 25E §§29–31 | Governance/data/runtime/evidence constraint → PRD-03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-PROG-033** | Supported profiles/seeds must prove required capability bands including start safety, automation/magic access and realm access/safe return where applicable. | 25C §27; 25G | Governance/data/runtime/evidence constraint → PRD-03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-PROG-034** | Optional expansion providers may enrich/substitute capabilities only when supported base profiles retain valid independent providers/fallbacks. | 25C §32 | Governance/data/runtime/evidence constraint → PRD-03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-SIM-014** | Dynamic transitions must declare prerequisites, state/definition/ownership/relationship effects, authority and recovery/fallback rather than arbitrarily mutating records. | 25C §28 | Governance/data/runtime/evidence constraint → PRD-03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-SIM-015** | LOD promotion/demotion may change representation but must not change identity, ownership, unresolved relationships, conservation or authoritative commitments. | 25B/25C; 25E §34 | Governance/data/runtime/evidence constraint → PRD-03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-SIM-016** | Distant resource/production simulation may aggregate quantities but must preserve totals, reservations and irreversible events. | 25J §11 | Governance/data/runtime/evidence constraint → PRD-03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-PST-025** | Every released world must record the exact world/content registry snapshot/manifest contract required to diagnose compatibility and migrate deliberately. | 25D §§28–29 | Governance/data/runtime/evidence constraint → PRD-03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-PST-026** | Migrations must be ordered, deterministic, evidence-backed, run against backups and never overwrite the last known-good save on failure. | 25D §§30–35 | Governance/data/runtime/evidence constraint → PRD-03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-PST-027** | Definition rename/split/merge/replacement migrations must preserve compatible identity, inventory, structures, relationships, provenance and history. | 25D §§31–32 | Governance/data/runtime/evidence constraint → PRD-03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-PST-028** | Missing optional content must enter explicit quarantine/recovery state rather than disappearing or silently converting to unrelated core content. | 25D §§33–34 | Governance/data/runtime/evidence constraint → PRD-03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-PST-029** | Reinstalling/reactivating compatible optional content must be able to restore quarantined persistent state through declared migration/rebinding rules. | 25D §§33–34 | Governance/data/runtime/evidence constraint → PRD-03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-PST-030** | Pack/world mismatch must be detected before authoritative state is loaded. | 25D | Governance/data/runtime/evidence constraint → PRD-03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-PST-031** | Save restoration must resolve manifest/snapshot compatibility and migrations before instantiating runtime presentations. | 25B/25D | Governance/data/runtime/evidence constraint → PRD-03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-PST-032** | Migration reports must identify affected records, aliases, fallbacks, quarantine and unresolved blockers. | 25B/25D | Governance/data/runtime/evidence constraint → PRD-03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-DEV-024** | Every validator must have stable identity/version, owning system, evaluated contract/schema, accepted target domains, severity/blocking policy and evidence output. | 25E §6 | Governance/data/runtime/evidence constraint → PRD-03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-DEV-025** | Validation evidence must be retained as reproducible artefacts including seed-run manifests, reachability proofs, performance baselines, migration results and release checklists. | 25E §§14–15,44,47 | Governance/data/runtime/evidence constraint → PRD-03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-DEV-026** | Seed QA must test determinism, topology/coherence, diversity/repetition, progression reachability, fallback repair and supported world profiles. | 25E §§21–32 | Governance/data/runtime/evidence constraint → PRD-03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-DEV-027** | Runtime validation must cover save/load/migration/recovery, LOD promotion/demotion/catch-up, transaction conservation, authority and reconnection. | 25E §§33–36 | Governance/data/runtime/evidence constraint → PRD-03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-DEV-028** | Performance validation must use workload profiles, representative scenarios, baselines, regression thresholds and profiling evidence rather than editor feel. | 25E §§37–39 | Governance/data/runtime/evidence constraint → PRD-03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-DEV-029** | Release gates must include asset/presentation/localisation/provenance, accessibility, representation, player trust, fun/balance and human approval in addition to automated correctness. | 25E §§40–48 | Governance/data/runtime/evidence constraint → PRD-03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-DEV-030** | Waivers/exceptions must be explicit, bounded, owned, expiry/review aware and cannot redefine canon or source-of-truth ownership. | 25E §45 | Governance/data/runtime/evidence constraint → PRD-03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-DEV-031** | Defects must retain reproducible evidence and regression ownership so fixes become durable tests where appropriate. | 25E §46 | Governance/data/runtime/evidence constraint → PRD-03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-DEV-032** | AI-assisted validation may propose tests/findings but cannot waive failures or replace human release authority. | 25E §43 | Governance/data/runtime/evidence constraint → PRD-03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-DEV-033** | Production work packages must declare identity, dependencies, owned files/scope, validation commands/evidence, rollback and completion gates. | 25L §§15–19 | Governance/data/runtime/evidence constraint → PRD-03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-DEV-034** | Repository-changing tasks must be bounded to declared files; newly discovered required changes trigger task revision or a separate task. | 25L §18 | Governance/data/runtime/evidence constraint → PRD-03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-DEV-035** | Implementation work should begin from a read-only repository audit/current-project map before destructive restructuring. | 25L §§13,17–18 | Governance/data/runtime/evidence constraint → PRD-03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-DEV-036** | Production board/status tracking must retain evidence and integration debt rather than only task completion labels. | 25L §44 | Governance/data/runtime/evidence constraint → PRD-03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-MP-018** | Multiplayer join/reconnect must validate required pack/schema/alias/snapshot compatibility before applying world state. | 25B §29; 25D; 25E §36 | Governance/data/runtime/evidence constraint → PRD-03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-MP-019** | Host/server manifest and authority remain authoritative; clients cannot resolve missing content by local nearest-name substitution or undeclared overrides. | 25B/25D | Governance/data/runtime/evidence constraint → PRD-03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-MP-020** | Pack combinations used for multiplayer must be validated for dependency, capability, completeness and protected-authority compatibility. | 25C §32; 25D; 25E | Governance/data/runtime/evidence constraint → PRD-03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-PROD-020** | Resource/recipe-chain definitions must separate resource origin, item/block identities, transformations and mutable runtime stock/state. | 25J §§5–9 | Governance/data/runtime/evidence constraint → PRD-03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-PROD-021** | Production chains must conserve declared quantities and required state across player, NPC, automation, project and LOD execution modes. | 25J §§13–18,42 | Governance/data/runtime/evidence constraint → PRD-03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-PROD-022** | Outputs must use integer or explicitly scaled fixed-point authoritative quantities; floating display values cannot own stock truth. | 25J §14 | Governance/data/runtime/evidence constraint → PRD-03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-PROD-023** | By-products and waste are declared outputs with explicit handling; they cannot disappear merely because they are inconvenient. | 25J §14 | Governance/data/runtime/evidence constraint → PRD-03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-PROD-024** | Near and far production must reconcile to equivalent net transactions without hidden distance yield bonuses. | 25J §14 | Governance/data/runtime/evidence constraint → PRD-03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-PROD-025** | Packed stations/containers and optional-pack removal must not duplicate contents or stored progress. | 25I §8; 25J §14 | Governance/data/runtime/evidence constraint → PRD-03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-PROD-026** | Substitution groups must be typed/declared and preserve capability/recipe semantics rather than accepting arbitrary similar-looking items. | 25J §15 | Governance/data/runtime/evidence constraint → PRD-03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-PROD-027** | Automation may increase throughput but cannot create physical input without a declared producer or separately owned energy-to-matter rule. | 25J §11 | Governance/data/runtime/evidence constraint → PRD-03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-PROD-028** | Ownership, claims, custody, theft, salvage and restitution state relevant to production/rewards must remain authoritative through transformations. | 25J §§18–20,42 | Governance/data/runtime/evidence constraint → PRD-03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-PROD-029** | Loot/reward/relic grammars must preserve provenance and progression eligibility rather than functioning as unconstrained random drops. | 25J §20 | Governance/data/runtime/evidence constraint → PRD-03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-PERF-019** | Content definitions/packages must carry validation-cost/performance classes so semantic completeness cannot ignore runtime budgets. | 25C; 25E; 25G | Governance/data/runtime/evidence constraint → PRD-03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-PERF-020** | Asset budgets must be explicit production envelopes covering material/surface, geometry/collision, rigs/animation, VFX/lights, audio, UI and dense-scene behaviour. | 25K §§12–25 | Governance/data/runtime/evidence constraint → PRD-03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-PERF-021** | Asset/presentation approval must include LOD, aggregation, virtualisation and reduced-effect stress tests, including signature boss/realm presentation. | 25K §§22,25,41–43 | Governance/data/runtime/evidence constraint → PRD-03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-PRES-016** | Every required presentation asset/event must have stable identity, source provenance, variant/state coverage, runtime budget and fallback/accessibility obligations. | 25K §§6–25 | Governance/data/runtime/evidence constraint → PRD-03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-PRES-017** | Gameplay-relevant visual states such as damage, wetness, heat/cold, corruption/cleansing, power, occupancy and construction progress must not depend on colour alone. | 25K §14 | Governance/data/runtime/evidence constraint → PRD-03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-PRES-018** | Animation events must use stable semantic names and cannot own gameplay transactions unless an owning gameplay system explicitly declares an authoritative animation window. | 25K §18 | Governance/data/runtime/evidence constraint → PRD-03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-PRES-019** | Root motion/locomotion authority must be declared so presentation cannot silently diverge between multiplayer peers. | 25K §18 | Governance/data/runtime/evidence constraint → PRD-03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-PRES-020** | Long-lived audio/machine/ambience loops must preserve meaningful phase/state through LOD and virtualisation. | 25K §21 | Governance/data/runtime/evidence constraint → PRD-03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-PRES-021** | VFX never creates damage, resources or gameplay state; it presents authoritative outcomes. | 25K §22 | Governance/data/runtime/evidence constraint → PRD-03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-PRES-022** | Asset overrides cannot remove protected gameplay/accessibility behaviour without an approved equivalent. | 25K §28 | Governance/data/runtime/evidence constraint → PRD-03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-UX-055** | Critical item/tool/magic/spoilage/damage/unique-significance states require readable cues beyond colour alone. | 25I §35; 25K §24 | Governance/data/runtime/evidence constraint → PRD-03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-UX-056** | Sound events require caption/accessibility metadata and critical information must retain an equivalent non-audio path. | 25K §§21,24 | Governance/data/runtime/evidence constraint → PRD-03/04/06/07/09; LFE/FORGE-ENG as applicable |

# 31. Round-9 Explicit Unknowns / Evidence Gaps

| ID | Unknown / evidence gap | Required downstream |
|---|---|---|
| **UNK-ID-009** | What final qualified-ID syntax, namespace tokens and compact runtime encoding should LFE adopt while preserving Set-25 semantics? | PRD-03/04/06/07; LFE |
| **UNK-ID-010** | What persistent-instance ID generation scheme provides uniqueness, offline creation and multiplayer merge safety without excessive storage? | PRD-03/04/06/07 |
| **UNK-ID-011** | How are tombstones and alias chains compacted over many years without losing migration/history evidence? | PRD-04/06/07; Set39 |
| **UNK-ARCH-011** | What concrete registry compiler/snapshot architecture best implements Set-25's source→normalise→compile→snapshot model in Godot? | PRD-03/04/06/07 |
| **UNK-ARCH-012** | Which runtime indexes should be precompiled versus generated lazily for relationship/capability/reverse-reference queries? | PRD-03/04/06/07 |
| **UNK-GOV-004** | Which Set-25 Core/Early-Access/Full-Release classifications remain current after the later FCC programme and current rebuild roadmap? | PRD-01 reconciliation; PRD-09 |
| **UNK-GOV-005** | What approval authority and workflow should govern new namespaces, schemas, capabilities and relationship types in day-to-day development? | LFE/FORGE-ENG governance; Branch A/B sync |
| **UNK-GOV-006** | How should field-level ownership be represented so both humans and tools can detect conflicting edits before compile time? | PRD-03/04/07; FORGE-ENG |
| **UNK-PROG-004** | What initial capability library and band semantics survive FCC-12/13 and later specialist reconciliation without over-fragmentation? | FCC-12/13; PRD-01 delta |
| **UNK-PROG-005** | Which fallback groups are global interfaces versus domain-owned contracts? | PRD-04; LFE |
| **UNK-PROG-006** | What reachability solver can prove capability paths through recipes, knowledge, structures, trade, realms and substitutions at production scale? | PRD-03/04/06/07 |
| **UNK-PST-006** | What exact registry snapshot/lockfile information must be embedded in saves versus stored externally/cached? | PRD-04/06/07 |
| **UNK-PST-007** | What quarantine representation safely preserves unknown optional-pack state without loading executable/untrusted semantics? | PRD-04/06/07; Set37 |
| **UNK-PST-008** | How should downgrade compatibility be bounded when migrations are intentionally one-way? | PRD-04; Set39 |
| **UNK-DEV-006** | What command-line/editor/CI validation orchestrator should replace Set-25's implementation-neutral concept in the current Godot rebuild? | PRD-03/06/07 |
| **UNK-DEV-007** | What numeric regression thresholds define blocking versus warning for determinism, performance, save size and network budgets? | PRD-06/07 |
| **UNK-DEV-008** | How should explicit waivers/debt expire and re-enter release gates automatically? | Engineering governance/LFE |
| **UNK-DEV-009** | Which 25L Summer Engine task-contract details remain useful once rewritten for Codex/ChatGPT/Git-based current development? | PRD-03/04; Branch B governance |
| **UNK-PROD-007** | What fixed-point quantity scale(s) are needed for physical stocks, fluids, energy and other conserved values without overflow or needless precision? | PRD-03/04/06/07 |
| **UNK-PROD-008** | What provenance granularity is required on ordinary stacks versus unique/relic/ownership-sensitive items to remain performant? | PRD-04/06/07 |
| **UNK-PROD-009** | How are production-chain equivalence tolerances defined when distant simulation batches time but must conserve outcomes? | PRD-04/06/07 |
| **UNK-FORGE-014** | Which source domains should actually use spreadsheets versus structured text versus Forge-native projects in the current production workflow? | FORGE-ENG; PRD-07 |
| **UNK-FORGE-015** | What deterministic normalised interchange format should replace Set-25's recommendation if JSON proves inefficient or awkward for some domains? | PRD-03/04/07 |
| **UNK-FORGE-016** | How should round-trip editing avoid losing comments, ordering or author intent while still producing canonical normalised data? | PRD-03/04/07 |
| **UNK-MP-004** | What registry-snapshot compatibility policy permits safe cosmetic/content differences without allowing gameplay contract drift? | PRD-04/06/07; Set31 |
| **UNK-PERF-007** | What numeric production envelopes replace Set-25's intentionally deferred frame/memory/save/network budgets? | PRD-06/07 |
| **UNK-PERF-008** | How much relationship/capability/provenance metadata can remain resident on low-end targets before registry streaming is required? | PRD-03/06/07 |
| **UNK-PRES-004** | Which animation events, if any, should be authoritative timing windows versus purely presentation requests? | PRD-04/06/07 |
| **UNK-UX-012** | What player-facing recovery flow explains missing packs, quarantine, migrations and incompatible worlds without exposing registry jargon? | PRD-07; Set34/36/39 |
| **UNK-DEV-010** | What current repository audit replaces 25L's historical Godot/Summer audit and becomes the evidence baseline before clean rebuild implementation? | PRD-03/09; implementation planning |

# 32. Round-9 Coverage Result

Document Set 25A–25L is complete for the **initial PRD-01 extraction baseline**.

Round 9 added **85 unique technical requirements** and **30 explicit unknowns/evidence gaps**.

The strongest Set-25 contracts retained are:

- one qualified identity/namespace kernel shared by base content and expansions;
- one canonical owner per authoritative field path, with schema-keyed extension facets instead of load-order ownership;
- strict separation of definitions, generated bindings, persistent instances, runtime state, spatial frames, history and presentation;
- capability/provider/suitability/fallback/reachability semantics as registered testable contracts;
- a controlled source → normalised interchange → compiled registry → immutable snapshot/world-manifest pipeline;
- deterministic migrations, backups, quarantine and reactivation for missing optional content;
- evidence-based validation from schema through seed QA, progression, persistence, LOD, multiplayer, performance and human release review;
- physical production conservation across player/NPC/automation/project/LOD execution;
- explicit asset/presentation budgets, provenance and accessibility obligations;
- bounded production work packages, repository/change discipline and integration-debt tracking; and
- Set 25 completion remaining distinct from actual implementation/integration closure.

**Authority note:** Set-25 historical Core-roster and realm-content selections do not supersede later FCC canon. Summer Engine-specific implementation language in 25L is not imported as current rebuild architecture.

**Document Set 25 baseline status: COMPLETE for initial PRD-01 extraction.**

The next source family is **Document Set 26 — Oceans, Maritime Civilisation, Vessels and Naval Systems Expansion**.

# 33. Round-10 — Document Set 26 Oceans / Maritime / Vessels / Naval Systems Extraction

## 33.1 Scope and authority handling

Round 10 extracts **26A–26O** as a specialist expansion stress-test of the shared Leyforge architecture.

Authority handling is deliberately strict:

- Set 26 owns maritime gameplay/data contracts within its specialist scope.
- Set 25 remains the registry/governance/package/migration/validation spine.
- Atlas/FCC owners remain authoritative for named world/content canon.
- **26O numeric budgets, scale caps, constants and production recommendations are not frozen here when the source marks them provisional/prototype-driven.**
- Godot/Summer Engine implementation detail is treated as historical/candidate implementation guidance. PRD-01 retains the implementation-neutral requirements; PRD-02/03/04/07 must revalidate the current Godot + voxel-stack architecture.
- Set 26 is a design-bible-complete programme, not implementation proof.
## 33.2 New requirements

| ID | Normative requirement | Primary source(s) | Classification / downstream |
|---|---|---|---|
| **REQ-MAR-001** | Maritime systems must extend the existing world, construction, civilisation, ecology, economy, magic, automation, combat and persistence architecture rather than form a disconnected second game stack. | 26A | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-MAR-002** | Large oceans and other major Water Bodies must use stable generated topology plus regional/query state rather than billions of continuously active liquid cells. | 26A; 26B | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-MAR-003** | Fluid simulation must be hybrid: bounded local volume simulation for edited/hazardous spaces, regional fields for large-water behaviour and separate presentation for rendered waves/effects. | 26A; 26B | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-MAR-004** | Rendered waves, foam, spray and distant-water animation must not be authoritative fluid state. | 26B; 26D; 26O | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-MAR-005** | Interactive liquid cells must store bounded volume/state, activate only where required, advance through bounded deterministic work and collapse to summaries when stable. | 26B | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-MAR-006** | Fluid sources, sinks, openings, seals, pumps, drains, gates and containment boundaries must affect authoritative volume rather than presentation-only water. | 26B | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-MAR-007** | Flooding must be volume-based and compartment-aware, with breaches/openings/pumps/drains/gates/seals controlling inflow and outflow. | 26B; 26L | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-MAR-008** | The generic flooding contract must be usable by vessels and static structures without creating two incompatible water systems. | 26B | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-MAR-009** | Fluid simulation owns liquid state while automation owns pump/valve/network permissions, operation, energy and transactions. | 26B | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-MAR-010** | Fluid systems must expose authoritative surface, depth, density, local velocity and submerged-volume/environment query inputs without owning vessel buoyancy/stability. | 26B | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-MAR-011** | Generated base water topology must be reconstructible from seed/version while saves retain persistent deviations, active local volumes, contamination, special fluids and unresolved flooding. | 26B | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-MAR-012** | The liquid foundation must support water-first profiles and controlled additional liquids/reactions without requiring unrestricted chemistry or a universal gas simulation. | 26B | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-MAR-013** | Marine environmental state must be represented by coherent regional fields and bounded local queries rather than per-wave/per-gust world objects. | 26D | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-MAR-014** | Authoritative wave state must be aggregate and derived from environmental inputs such as wind, duration, fetch, swell, current and depth; individual rendered waves are presentation. | 26D | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-MAR-015** | Tides must provide deterministic predictable regimes/phases and local amplification suitable for planning without requiring exact astronomical simulation. | 26D | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-MAR-016** | Currents must support persistent generated corridors plus time-varying modification from wind, tide, rivers, storms, ice and extraordinary fields. | 26C; 26D | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-MAR-017** | Storms must be persistent moving field instances with origin, track, structure, severity, uncertainty, warning and aftermath. | 26D | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-MAR-018** | Severe maritime weather must form/move/intensify/dissipate coherently and provide discoverable warning/response windows instead of spawning immediately around the player. | 26D | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-MAR-019** | Forecast truth and player/NPC forecast knowledge must remain separate; forecasts may be uncertain according to observation, instruments, skill, infrastructure or magic without random deception. | 26D | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-MAR-020** | Vessels must be persistent mobile voxel structures assembled from ordinary block/component definitions; vessel-specific structural meaning attaches to local instances rather than replacing base block IDs. | 26F | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-MAR-021** | Vessel construction must allow broadly transferable materials and determine consequences from mass, sealing, strength, attachment and environmental properties rather than a cosmetic whitelist of ship blocks. | 26F | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-MAR-022** | Vessel structure must use a simplified vessel-specific structural graph including roles such as spine, frames, hull shell, decks, bulkheads, supports, armour, ballast and attachments rather than universal full-world engineering. | 26F | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-MAR-023** | A bounded Shipwright candidate scan must establish vessel-local semantic axes/reference data and deterministically infer roles, compartments and validation failures with explainable overrides. | 26F | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-MAR-024** | Static construction, vessel class, vessel Blueprint, candidate assembly and commissioned Vessel Instance must remain separate records. | 26F; 26I | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-MAR-025** | Commissioning must be an atomic conservation-preserving transfer from static world construction into a persistent local-grid Vessel Instance, or roll back coherently. | 26F | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-MAR-026** | Commissioning must preserve block definitions, mutable block/container state, inventories, attachments, occupants where allowed, ownership and provenance. | 26F | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-MAR-027** | Structural commissioning may produce an immobilised vessel and must remain separate from later movement/operational certification. | 26F; 26G | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-MAR-028** | A commissioned vessel must own a stable local coordinate/spatial frame independent of world transform and scene parenting. | 26F; 26O | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-MAR-029** | Characters, cargo, components, projectiles and temporary interactions must be able to bind/reconcile across moving vessel frames without becoming individual vessel-voxel physics/network objects. | 26O | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-MAR-030** | Vessel cells must be compact data with derived/baked rendering, collision and navigation products rather than one engine Node/physics body per block. | 26F; 26O | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-MAR-031** | Vessel movement must use one authoritative vessel motion owner/body with aggregate/sample-based support, drag and force application rather than per-voxel rigid-body/fluid physics. | 26G | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-MAR-032** | Vessel support/movement must derive from actual vessel shape, material mass, contained load, environment and working providers while remaining simplified/bounded. | 26G | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-MAR-033** | Movement certification must validate applicable support, stability, control, propulsion, clearance and environment requirements before an immobilised commissioned vessel becomes operational. | 26G | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-MAR-034** | Propulsion must use reusable provider contracts capable of combining multiple mundane, mechanical, magical or creature-assisted methods without hardcoding one vessel technology ladder. | 26G | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-MAR-035** | Propulsion providers must not produce output without their authoritative required inputs, energy, environmental conditions and operational state. | 26G | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-MAR-036** | Steering/control effectiveness must depend on appropriate operating conditions/provider capability rather than grant fixed control because a component exists visually. | 26G | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-MAR-037** | Grounding and route feasibility must depend on actual vessel clearance/draft and local depth/environmental state. | 26G | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-MAR-038** | Anchor, mooring, towing, docking and launching transitions must preserve vessel identity and use authoritative state transitions rather than teleport/recreate the vessel. | 26G; 26H | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-MAR-039** | Distant voyage simulation must preserve route certification/clearance, vessel capability, cargo, crew, condition, time and environmental consequences rather than teleport vessels between ports. | 26G; 26K; 26O | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-MAR-040** | Shipwright construction, repair, refit and salvage must operate as real projects with resources, tools, labour, permissions, safe work states and persistent progress. | 26H | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-MAR-041** | Refits must preserve Vessel Instance identity/history when the craft remains conceptually the same, with explicit conversion/recommissioning where contract-breaking changes occur. | 26H | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-MAR-042** | Emergency combat damage control and proper long-term repair/refit/salvage must remain separate ownership phases. | 26H; 26L | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-MAR-043** | Sinking/wreck transition must preserve vessel provenance, sections, inventories, damage/history and recoverable identities as applicable instead of replacing the craft with generic loot. | 26L | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-MAR-044** | Ports must be operational settlement/service systems backed by structures, approach/berth capability, workers, inventory, permissions and environment rather than menu nodes or labels. | 26J | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-MAR-045** | Port/harbour capability must account for real approach geometry/depth/environment and vessel requirements; naming a structure 'Port' cannot grant service capability. | 26J | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-MAR-046** | Crews must consist of persistent people with roles/stations/orders/supplies/skills and cannot be replaced by one abstract crew-number when nearby. | 26J | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-MAR-047** | Distant crew/port operation may aggregate representation only while preserving people/roles/resources/critical commitments according to shared civilisation LOD rules. | 26J; 26O | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-MAR-048** | Fleet Instances must be persistent organisations referencing identifiable vessels, crews, command, mission, formation, supply plan and authority; fleet membership must not erase member identities. | 26K | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-MAR-049** | Maritime routes must be persistent relationships between valid endpoints with path knowledge, vessel requirements, seasonal/environment windows, hazards, legal access and service needs; routes cannot teleport goods. | 26K | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-MAR-050** | Regional maritime power must be multi-vector and causally derived from real access/logistics/commerce/shipbuilding/security/intelligence/diplomacy/resilience rather than one score silently granting control. | 26K | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-MAR-051** | Maritime systems must support peaceful, commercial, rescue, exploration, ecology, pilgrimage and infrastructure uses in addition to warfare. | 26A; 26J; 26K; 26N | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-WGEN-056** | Marine generation must create relationships/topology before decoration, using shared climate, geology, hydrology, magic and history constraints. | 26C | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-WGEN-057** | Marine world generation must support ocean basins, seas, marine regions, bathymetry, shelves/slopes/trenches, coasts, islands, inland waters and underwater connectivity as generated records rather than isolated noise features. | 26C | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-WGEN-058** | A coast must be a persistent interface relation between land and marine regions with morphology/substrate/exposure/sediment/tide/freshwater/harbour/change-state context. | 26C | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-WGEN-059** | Island generation must support multiple origin families and retain origin/provenance where it matters to geology/ecology/history. | 26C | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-WGEN-060** | Underwater generation must support depth, geology, light, pressure, chemistry, access, habitat, route, structure and hazard contexts so discoverability can precede safe accessibility. | 26C | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-WGEN-061** | Marine capability guarantees must use categories, bounded search and controlled fallback placement rather than fixed named harbours/islands/wrecks/species/tutorial oceans. | 26C | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-WGEN-062** | Marine generated topology must reconstruct from seed/version while saves retain shoreline edits, dredging, canals, reclamation, changed routes, discovered names, ownership, resource depletion and habitat damage. | 26C | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-WGEN-063** | Marine generation must expose harbour-suitability, route, habitat, resource, underwater-site and environmental-field sockets for specialist systems without owning those systems' mutable state. | 26C | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-WGEN-064** | Small/large world profiles may compress distance/count but must preserve functional marine depth/access/route/progression categories. | 26C | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-WGEN-065** | Marine worldgen validation must prove required navigation/survival/port/resource/access capabilities across supported seeds/profiles without relying on one named content entry. | 26C; 26N | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-WLD-010** | Water Bodies, coast interfaces, marine regions, routes, ports, reefs, fisheries and underwater sites must have persistent world identity independent of currently loaded chunks. | 26B; 26C; 26M | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-WLD-011** | Marine dynamic state such as shoreline change, habitat damage, fishery state, storm aftermath and route accessibility must persist separately from immutable generated definitions. | 26C; 26D; 26M | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-WLD-012** | Oceans must function as full world regions containing ecology, civilisation, resources, routes, sites and history rather than merely terrain separators. | 26A; 26C | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-MOV-001** | Aquatic locomotion must extend the shared movement system with water-contact, wading, surface, floating/treading and underwater states rather than create a disconnected movement game. | 26E | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-MOV-002** | Ordinary swimming must remain responsive character-controlled movement with bounded environmental forces rather than uncontrolled rigid-body motion. | 26E | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-MOV-003** | Character aquatic response must consume fluid/world/environment snapshots from their owners rather than recompute or own water/current/storm truth. | 26E | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-MOV-004** | Water entry/exit, ladders, vessel-side climbing and rescue must support safe state transitions across land/water/vessel frames. | 26E | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-MOV-005** | Navigation must combine direct steering, charts/knowledge, depth/hazard queries, route graphs, environmental windows, NPC competence and optional assistance without replacing sandbox control. | 26G | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-MOV-006** | Navigation knowledge/forecast confidence must remain separate from true route/weather state. | 26D; 26G; 26O | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-MOV-007** | Movement between world and vessel-local frames must preserve character identity and authoritative state under boarding, disembarkation, reconnect and motion. | 26F; 26G; 26O | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-MOV-008** | Boarding combat must support real links/routes between two moving frames rather than instantaneous transfer on contact. | 26L | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-BIO-001** | Breath must be a readable character capacity affected by exertion, condition, preparation, equipment, magic and difficulty rather than per-molecule oxygen simulation. | 26E | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-BIO-002** | Drowning must use clear escalating stages with configurable severity and a default recoverable rescue/incapacitation window before death. | 26E | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-BIO-003** | Depth/pressure hazards must use authored bands/capability checks rather than exact decompression physics by default. | 26E | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-BIO-004** | Temperature, visibility, current/surf/turbulence and other aquatic hazards must route through authoritative biology/movement owners rather than duplicate health truth. | 26E | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-BIO-005** | Aquatic equipment/magic/training/traits may modify capability while ancestry must not imply morality/profession or unmitigable superiority/inferiority. | 26E | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-BIO-006** | Aquatic burden must use declared equipment/load/heavy-object semantics rather than silently introduce a universal inventory-weight simulation. | 26E | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-BIO-007** | Underwater work/building/mining/interactions must use normal tools, inventories, permissions, projects and specialist validations with environmental capability modifiers. | 26E | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-BIO-008** | Rescue must be a first-class multiplayer/NPC-capable interaction with persistent consequences rather than a cosmetic revival animation. | 26E; 26L | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-FORGE-052** | Vessel Forge must be a specialist workspace inside the existing Unified Forge, reusing shared manifests, IDs, material libraries, semantic markers, revision history, dependency graph, test lab, packaging and bake services. | 26I | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-FORGE-053** | Vessel Blueprint source must remain editable semantic voxel/data source while meshes, collision, thumbnails, hydrostatic samples, LOD and preview products are rebuildable outputs. | 26I | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-FORGE-054** | Vessel Forge must author structural/functional/construction/variant/test intent but cannot itself certify runtime structure, movement or world project completion owned by 26F/26G/26H. | 26I | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-FORGE-055** | Vessel procedural variants must be deterministic, inspectable and bakeable into explicit source revisions rather than opaque uneditable generated scenes. | 26I | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-FORGE-056** | Vessel variation should use inheritance, material roles, modules, parameter sets, state deltas and seeded decoration before duplicating entire vessel sources. | 26I | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-FORGE-057** | Vessel Forge must support both full developer authority and restricted player workflows without exposing registry/migration/worldgen/unrestricted scripting authority to players. | 26I | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-FORGE-058** | Player vessel authoring must support an in-world design/worksite mode and a world-independent planning/library/test workflow using compatible contracts. | 26I | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-FORGE-059** | Vessel Forge validation must consume the same structural, movement, construction, packaging and performance validators used by runtime/production rather than inventing preview-only truth. | 26I | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-CIV-042** | NPC settlements must be capable of constructing, owning, crewing, repairing, supplying and using vessels through the same persistent people/project/resource systems as land civilisation. | 26A; 26J | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-CIV-043** | Maritime professions/stations must be roles of persistent people with real skills, schedules, tools, permissions and handover rather than spawned service tokens. | 26J | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-CIV-044** | Shipyards must commission vessels from real materials, labour, facilities, tools and validation; progress counters cannot create ships from missing inputs. | 26J | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-CIV-045** | Harbour/port service activation must depend on actual structure/staff/stock/access/environment/network/permission capability. | 26J | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-CIV-046** | Maritime settlements must support fishing, ferries, rescue, migration, research, exploration, salvage, diplomacy, coast defence and other roles without forcing one commercial/naval template. | 26J | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-CIV-047** | Piracy must be a behaviour/economic/legal/political status supported by actual people, vessels, supplies, motives and targets rather than a biological creature/faction category. | 26K | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-CIV-048** | Navies/coast guards/customs/patrols must be institutions sustained by settlements, resources, shipyards, crews, doctrine, intelligence and political authority rather than abstract faction technology flags. | 26K | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-CIV-049** | Maritime culture/faction/region content must continue to use Atlas/personhood authority and Set 26 may not invent stereotypes or replace named canon to close technical gaps. | 26J; 26K; 26M; 26N | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-ECON-007** | Cargo must originate from authoritative inventories/production, be reserved into explicit lots/manifests, transported and settled without duplication. | 26K | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-ECON-008** | Distant cargo/voyage simulation may summarise physical handling but must preserve quantity, provenance, custody/ownership, time, risk, damage and outcome. | 26K | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-ECON-009** | Maritime contracts/trade must bind real ports, route capability, cargo, vessel, crew, provisions/fuel/spares and legal/risk state rather than abstract profit counters. | 26K; 26N | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-ECON-010** | Customs, tariffs, smuggling, prize/salvage claims and restitution must use authoritative legal/ownership/custody state rather than flavour-only modifiers. | 26K; 26N | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-ECON-011** | Market/economic value may respond to supply, demand, access, culture and route risk but Set 26 must not duplicate the later economy owner's numeric market authority. | 26K; 26N | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-ECON-012** | Blockades/interdiction must affect trade only through actual route/port/fleet capability and persisted strategic state. | 26K | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-ECON-013** | Fleet operating capability must depend on actual vessels, crews, supplies, maintenance, ports and mission constraints rather than a decorative fleet-strength score. | 26K | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-CMB-044** | Maritime tactical encounters must begin from valid strategic/environmental/vessel context and return authoritative outcomes to strategy/economy/politics without owning those domains. | 26K; 26L | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-CMB-045** | Naval combat objectives must support escape, escort, blockade-running, rescue, disablement, surrender, capture, denial, survival and withdrawal as first-class outcomes; destruction is not universally required. | 26L | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-CMB-046** | Vessel damage must resolve through impact location, damage type, material/shape, structural roles, components, compartments, occupants and current condition rather than one vessel health bar. | 26L | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-CMB-047** | Structural combat damage must use sparse addressable damage groups/local recalculation rather than full unbounded per-voxel structural recomputation. | 26L | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-CMB-048** | Breaches must hand off compartment-local water ingress to the fluid owner and resulting added mass/trim/stability effects to the movement owner. | 26L | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-CMB-049** | Fire/smoke/heat/explosions must use bounded tagged/compartment propagation influenced by ventilation, suppression, closures, weather and materials rather than unrestricted per-voxel propagation. | 26L | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-CMB-050** | Damage-control tasks must consume real people/tools/materials/capability and preserve reservation/transaction integrity. | 26L | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-CMB-051** | Boarding must occur through actual contact/grappling/access routes/control zones between moving vessels and use shared character combat. | 26L | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-CMB-052** | Tactical control of stations/zones must remain distinct from legal ownership/capture of the Vessel Instance. | 26L | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-CMB-053** | Surrender/capture/prisoner/prize outcomes must be authoritative transitions with law/terms/history and cannot occur merely because an arbitrary control point changed. | 26L | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-CMB-054** | Survivors after wreck/abandon-ship events must remain persistent groups/people until resolved by rescue, death or other outcome. | 26L | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-CMB-055** | Capsizing, sinking, scuttling and wreck transitions must persist and preserve appropriate vessel/cargo/history state. | 26L | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-CMB-056** | Coastal batteries/harbour defences/barriers influence combat only when their structures, crews, supplies and access are functionally valid. | 26L | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-CMB-057** | Fleet combat at distance must use deterministic bounded resolution conserving ammunition, cargo, crew and damage state. | 26L | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-CMB-058** | Promotion from abstract maritime combat to physical combat must not reroll/heal prior outcomes. | 26L | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-CMB-059** | NPC naval tactics must remain information-limited and doctrine/context-driven rather than omniscient. | 26L | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-ECO-040** | Marine ecology must use deterministic regional summaries/cohorts with detailed representative nearby entities rather than Node-per-fish or Node-per-ecology-cell simulation. | 26M | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-ECO-041** | Marine population state must include carrying capacity, migration, reproduction, mortality, extraction and restoration consequences and remain save-safe. | 26M | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-ECO-042** | Fishing/harvest must reserve conserved catch from authoritative ecology state before creating items/cargo. | 26M; 26N | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-ECO-043** | Fishing methods including line/net/trap/spear/diving/vessel/aquaculture must share one ecology/conservation truth rather than independent loot tables. | 26M | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-ECO-044** | Marine creature suitability must support depth, pressure, salinity, current, temperature, oxygen and relevant schooling/breaching/beaching/vessel interaction facets. | 26M | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-ECO-045** | Marine sites/dungeons must derive from real topology, water/history/ecology/access state and persist rather than reset as loot rooms. | 26M | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-ECO-046** | Marine bosses must function as territorial/migratory/world ecological actors with non-kill outcomes where fiction/personhood permits. | 26M | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-ECO-047** | Marine boss/creature combat logic must extend shared personal/vessel combat rather than create duplicate damage systems. | 26M | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-ECO-048** | Fishery closure, habitat degradation/restoration and overharvest must propagate into settlements/economy/ecology through authoritative evidence. | 26M; 26N | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-PROG-035** | Maritime progression must be a capability web with multiple entry routes through survival, fishing, diving, shipwright work, trade, navigation, ecology, rescue, piracy, naval service, magic and settlement development rather than a single ship tier. | 26N | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-PROG-036** | Maritime unlocks may derive from tools, materials, knowledge, practice/skill, teachers, research, reputation, licences, facilities, vessels, routes, preparation and outcomes, but overall level cannot substitute for missing physical capability. | 26N | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-PROG-037** | Maritime progression/registry admission must use Set-25 capabilities, relationships, suitability, fallbacks, packs and migration rather than a maritime-only parallel progression registry. | 26N | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-PROG-038** | Maritime capability paths must remain seed-independent through equivalent providers/fallbacks and not depend on fixed named ports/teachers/materials/vessels. | 26N | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-PROG-039** | Licences/reputation/permission may gate lawful access but cannot fabricate missing tools, supplies, facilities or environmental protection. | 26N | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-PROG-040** | Peaceful/accessibility settings must preserve valid maritime progression through rescue, trade, ecology, exploration, construction and hazard-management routes when combat is reduced. | 26N | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-MAG-033** | Maritime magic must extend existing schools/mana infrastructure and may assist navigation, weather reading, breathing, pressure protection, propulsion, pumping, wards, preservation, rescue and realm travel without becoming a separate magic engine. | 26N | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-MAG-034** | Maritime magic must not invalidate mundane seamanship/logistics by creating free capability without declared mana/resources/conditions/permissions. | 26N | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-MAG-035** | Magical weather/environment influence must modify authoritative environmental systems through typed requests rather than presentation effects directly changing weather. | 26D; 26N | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-MAG-036** | Magical vessel propulsion/pumping/ward providers must participate in the same provider/capability/fault/conservation interfaces as comparable mundane systems where applicable. | 26G; 26N | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-AUT-062** | Maritime automation must extend existing automation to pumps, winches, cranes, cargo, shipyards, preservation, fisheries and port logistics while conserving stock/fluids/energy/labour/ownership/work. | 26N | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-AUT-063** | Vessel/port automation cannot bypass crew/permission/maintenance/supply requirements unless an owning capability explicitly replaces them. | 26J; 26N | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-AUT-064** | Distant maritime automation must reconcile to the same conserved outcomes as nearby operation and may not produce free catch/cargo/fuel/repairs. | 26N | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-AUT-065** | Damage-control automation may assist pumping/suppression/closures but cannot own combat damage or fluid truth. | 26L; 26N | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-QST-042** | Maritime quests must bind to real authoritative needs/opportunities involving ports, cargo, routes, vessels, weather, ecology, crews, sites, law or events rather than create parallel quest-only state. | 26N | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-QST-043** | Maritime events must arise from authoritative weather/ecology/economy/faction/port/vessel/site/boss/history state and may continue without quest acceptance. | 26N | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-QST-044** | Voyage/rescue/fishing/trade/piracy/naval/ecology/dungeon outcomes must feed persistent history/aftermath through shared event/evidence systems. | 26K; 26L; 26M; 26N | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-QST-045** | Maritime objective modules must reference persistent subjects and survive LOD/disconnect/world changes according to shared quest/event rules. | 26N | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-PST-033** | Maritime saves must separate immutable definitions from persistent Water Body deltas, Vessel Instances/local deltas, Port/Fleet records, cargo/crew/projects, ecology summaries, events and recovery metadata. | 26O | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-PST-034** | Vessel-local saves must preserve local voxel/component identity and not depend on current scene-node hierarchy or one baked mesh. | 26F; 26O | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-PST-035** | Compartment identity/state must survive splits/merges through lineage/migration rules sufficient to reconcile flooding/hazard/damage state. | 26F; 26L; 26O | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-PST-036** | Maritime authoritative transitions such as commissioning, cargo transfer, capture, repair/refit, docking and frame transfer must be journalled/atomic where interruption could duplicate or lose state. | 26F; 26H; 26K; 26O | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-PST-037** | Interrupted commissioning must recover to one coherent static-or-vessel state rather than a half-transferred duplicate. | 26F | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-PST-038** | Existing visited ocean/coast/water/structure state must not be silently regenerated merely because maritime worldgen gains new detail. | 26O | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-PST-039** | Optional maritime content removal must use Set-25 quarantine/migration and preserve original persistent payload rather than delete or nearest-match substitute it. | 26F; 26O | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-PST-040** | Reconnection/promotion must restore occupants/characters to safe valid positions in the correct vessel/world frame without identity duplication/ejection. | 26F; 26G; 26O | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-PST-041** | Demotion/promotion of vessels/fleets/ports/ecology must preserve conserved stock, cargo, crew, condition, damage, routes, ownership and history. | 26O | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-PST-042** | Wreck conversion must preserve sufficient lineage for salvage, archaeology, ownership/prize disputes, ecology and history. | 26L | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-MP-021** | One host/server authority must validate persistent maritime changes in solo/LAN/co-op/future dedicated-server-compatible play; clients may only predict bounded movement/presentation where safe. | 26O | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-MP-022** | Vessel voxel edits, commissioning/refits, cargo/inventory transfers, combat damage, flooding/fire, port/market/contracts and quest/event resolution must be authority-validated transactions. | 26O | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-MP-023** | Ordinary character/swimming movement and helm input may use bounded prediction/reconciliation, but clients do not own persistent vessel transform/state. | 26O | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-MP-024** | Multiplayer vessel station control must use explicit leases/authority/handover so conflicting commands resolve to one motion truth. | 26O | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-MP-025** | Concurrent shipwright/repair/damage-control edits must use permissions/reservations/revisions preventing duplicated work or divergent vessel state. | 26F; 26H; 26L; 26O | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-MP-026** | Cargo transfer must reconcile source, destination, quantity, custody and reservation atomically. | 26O | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-MP-027** | Boarding/capture must not change legal vessel ownership until authoritative conditions/postconditions commit. | 26L; 26O | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-MP-028** | Network relevance must stream/replicate maritime detail by proximity/role/importance rather than one network object per voxel, fish, wave crest, sailor or cargo unit. | 26O | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-UX-057** | Maritime UI must be a read-only trustworthy interpretation of authoritative state and may not hide loss, invent capability or conceal blocking ownership/safety/resource/environment/permission reasons. | 26O | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-UX-058** | Maritime interfaces must use progressive disclosure so ordinary movement does not require a permanent cockpit dashboard. | 26O | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-UX-059** | Shipwright/commissioning validation must expose exact understandable reasons/locations for structural/capability failures rather than generic invalid-vessel messages. | 26F; 26O | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-UX-060** | Helm/navigation UI must distinguish true environmental/vessel state from knowledge/instrument confidence where information is not perfect. | 26D; 26G; 26O | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-UX-061** | Flooding/damage/compartment UI must communicate location, severity, cause, trend and actionable response without relying solely on colour. | 26L; 26O | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-UX-062** | Aquatic accessibility must support auto-surface assistance, simplified vertical controls, hold/toggle alternatives, reduced camera motion, clear breath/depth cues and configurable drowning risk. | 26E | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-UX-063** | Maritime environmental presentation intensity such as camera motion, distortion, particles and audio must be separable from authoritative hazard severity. | 26D; 26E | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-UX-064** | Critical maritime warnings must retain multimodal/non-colour cues under reduced effects, muted audio or accessibility settings. | 26D; 26L; 26O | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-UX-065** | Controller-only workflows must be able to complete critical commissioning/navigation/damage-control interactions required by supported control profiles. | 26F; 26G; 26O | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-PERF-022** | Maritime simulation must scale through detailed near, reduced local, regional summary, distant scheduled and dormant representations rather than full-fidelity everywhere. | 26O | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-PERF-023** | No ambient maritime system may require one Node, physics body, network object or save record per voxel, fish, wave crest, rope segment, distant sailor or cargo unit. | 26O | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-PERF-024** | Fluid work must be region/activation bounded and deferrable with stable large-water summaries. | 26B; 26O | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-PERF-025** | Marine field/weather simulation must use bounded update cadences and snapshots rather than per-rendered-wave authoritative physics. | 26D; 26O | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-PERF-026** | Vessel structural/damage/compartment recalculation must invalidate affected local groups rather than rescan the entire vessel after every small change where bounded alternatives exist. | 26F; 26L | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-PERF-027** | Distant fleets/voyages/ports/markets/ecology/events must use deterministic summaries and promotion rather than keeping all actors/physics active. | 26K; 26M; 26O | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-PERF-028** | Maritime performance admission must be based on packaged profiling and stress scenarios across vessel scale, moving interiors, ports, storms, combat, ecology, networking and save/migration. | 26O | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-PERF-029** | Numeric vessel/fluid/network/save/render budgets in Set 26 remain provisional evidence targets until prototype/profile gates approve them; PRD-01 must not freeze them as architecture constants. | 26A; 26O | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-DEV-037** | Set 26 design completion is DESIGN ONLY and must not be mistaken for proof that fluids, moving voxel vessels or naval simulation are technically feasible. | PRD-00 §5.6; 26O | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-DEV-038** | A bounded Maritime Foundation Vertical Slice must precede broad naval-content production and prove cross-system foundations before fleet-war/massive-vessel breadth. | 26O | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-DEV-039** | Prototype laboratories must separately test fluid behaviour, vessel conversion, buoyancy/stability, moving interiors, route LOD, multiplayer helm/editing, combat/flooding/fire, recovery and migration. | 26F; 26G; 26L; 26O | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-DEV-040** | Maritime acceptance must combine deterministic fixtures/automated validation with packaged profiling, multiplayer soak, accessibility and manual feel/visual review. | 26O | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-DEV-041** | Summer Engine-specific implementation/task language in Set 26 is historical implementation guidance; current rebuild architecture must revalidate it against the present Godot + voxel-stack candidate before adoption. | PRD-00 authority applied to 26A–26O | Specialist design/runtime constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |

# 34. Round-10 Explicit Unknowns / Evidence Gaps

| ID | Unknown / evidence gap | Required downstream |
|---|---|---|
| **UNK-FLUID-002** | What exact local liquid-cell representation and volume precision can conserve flooding/pumping while remaining compatible with Zylann voxel storage/streaming? | PRD-02/03/04/06/07 |
| **UNK-FLUID-003** | What activation/deactivation algorithm determines when stable regional water becomes local simulated volume and when it can safely collapse back to summary state? | PRD-02/03/04/06/07 |
| **UNK-FLUID-004** | How should local fluid simulation cross chunk boundaries without large update storms or seam duplication? | PRD-02/03/04/06/07 |
| **UNK-FLUID-005** | What fluid-query interface provides stable surface/depth/velocity/density/submersion data to characters and vessels without coupling them to renderer/chunk internals? | PRD-02/03/04/06/07 |
| **UNK-FLUID-006** | How are displacement and flooding reconciled when a moving vessel-local frame intersects world-space water? | PRD-02/03/04/06/07 |
| **UNK-FLUID-007** | Which non-water liquids/reactions are technically generalisable without turning the water system into an unbounded chemistry solver? | PRD-04/06/07 |
| **UNK-WGEN-017** | What representation stores Water Body/coast/bathymetry topology independently from local voxel chunks while supporting terrain edits and streaming? | PRD-02/03/04/06/07 |
| **UNK-WGEN-018** | How are canals, dredging, reclamation and shoreline edits reconciled with generated marine route/hydrology identities? | PRD-02/04/06/07 |
| **UNK-MAR-001** | What exact VesselInstance/local-grid storage format supports arbitrary shaped blocks, block entities and sparse edits at target vessel sizes? | PRD-02/03/04/06/07 |
| **UNK-MAR-002** | What deterministic connected-assembly scan can select the intended vessel without accidentally absorbing docks, braces, seabed or neighbouring structures? | PRD-02/03/04/06/07 |
| **UNK-MAR-003** | How are vessel compartments incrementally detected/updated after edits without full rescans while preserving stable lineage? | PRD-03/04/06/07 |
| **UNK-MAR-004** | What simplified structural-graph algorithm catches meaningful hull/frame failures without becoming expensive universal structural engineering? | PRD-03/04/06/07 |
| **UNK-MAR-005** | What atomic commissioning transaction can safely move thousands/millions of voxel/component records from world frame to vessel frame and recover from interruption? | PRD-03/04/06/07 |
| **UNK-MAR-006** | What vessel size/complexity bands are achievable on low-end hardware before the local-grid/movement model needs redesign? | PRD-06/07 |
| **UNK-MAR-007** | Can one authoritative rigid-vessel representation support player-edited voxel hulls at scale without unstable physics or excessive collision rebuild cost? | PRD-02/03/06/07 |
| **UNK-MAR-008** | What sampled buoyancy/hydrostatic approximation produces readable stable behaviour for arbitrary voxel shapes without full CFD? | PRD-03/06/07 |
| **UNK-MAR-009** | How should flood mass/centre-of-mass changes feed movement/stability at bounded cadence without oscillation or delayed nonsense? | PRD-03/04/06/07 |
| **UNK-MAR-010** | What collision/contact architecture supports vessel-vessel, vessel-world, moving interior and character interactions without per-block bodies? | PRD-02/03/04/06/07 |
| **UNK-MAR-011** | How should vessels transition between active physics and distant route summaries without position/velocity/cargo/crew discontinuity? | PRD-03/04/06/07 |
| **UNK-MAR-012** | How are anchored/moored/docked/towed vessel constraints represented transactionally across moving frames and world structures? | PRD-03/04/06/07 |
| **UNK-MAR-013** | What safe wreck-transition representation preserves enough hull topology/history for salvage without retaining expensive full vessel simulation? | PRD-03/04/06/07 |
| **UNK-MOV-001** | How should character controllers reconcile world-space and vessel-local motion, especially jumping, falling, ladders, deck edges and reconnect under latency? | PRD-03/04/06/07 |
| **UNK-MOV-002** | What boarding-link representation supports pathfinding/combat between two independently moving local frames? | PRD-03/04/06/07 |
| **UNK-BIO-001** | What breath/drowning timing model feels readable across difficulty/accessibility profiles without becoming trivial or punitive? | PRD-07; gameplay tuning |
| **UNK-BIO-002** | How should pressure/depth capability bands interact with biology, equipment, magic and vehicle interiors without duplicated hazard formulas? | PRD-04/06/07 |
| **UNK-FORGE-017** | How will Vessel Forge stream/edit/test very large voxel blueprints without loading/rendering every cell at maximum editor detail? | PRD-03/06/07; FORGE-ENG |
| **UNK-FORGE-018** | What deterministic procedural-vessel grammar can create useful variants while preserving editable source, stable semantic IDs and migration? | PRD-03/04/07; FORGE-ENG |
| **UNK-FORGE-019** | What restricted player vessel format/sharing validation prevents unsafe contracts or abusive resource/runtime complexity? | PRD-04/06/07; Set33/37 |
| **UNK-CIV-010** | What crew representation allows named persistent sailors nearby but bounded role/condition summaries on distant voyages? | PRD-04/06/07 |
| **UNK-CIV-011** | How are station leases/orders/handover represented so NPC autonomy and player command coexist without RTS micromanagement? | PRD-04/06/07 |
| **UNK-CIV-012** | What port-service capacity model can resolve berth/depth/weather/worker/stock/network constraints efficiently at busy harbours? | PRD-03/04/06/07 |
| **UNK-ECON-003** | What cargo-lot/manifests representation preserves provenance/custody while avoiding one persistent record per commodity unit? | PRD-04/06/07 |
| **UNK-ECON-004** | What distant voyage risk model remains causal/deterministic enough to conserve actual cargo/crew/vessel condition without simulating every encounter physically? | PRD-04/06/07 |
| **UNK-ECON-005** | How should blockade/interdiction coverage be calculated against route graphs and moving fleets without expensive continuous geometry checks? | PRD-03/04/06/07 |
| **UNK-CMB-012** | What sparse vessel-damage grouping/invalidation model preserves local physical consequences under arbitrary voxel edits? | PRD-03/04/06/07 |
| **UNK-CMB-013** | What bounded fire/smoke/heat model is convincing across compartments without per-voxel combustion/gas simulation? | PRD-03/04/06/07 |
| **UNK-CMB-014** | How should deterministic abstract naval encounters resolve ammunition, damage, crew/cargo consequences and tactical objectives so promotion does not reroll history? | PRD-04/06/07 |
| **UNK-CMB-015** | What exact capture/surrender transaction separates tactical control, legal title, prize claims, prisoners and cargo custody safely? | PRD-04/06/07 |
| **UNK-ECO-011** | What marine cohort model supports schools/migration/predation/fisheries at ocean scale and promotes representative actors consistently? | PRD-03/04/06/07 |
| **UNK-ECO-012** | How do moving vessels/fishing fleets query and reserve catch from ecology summaries without race conditions or duplication? | PRD-04/06/07 |
| **UNK-ECO-013** | What habitat-update cadence captures pollution, reef damage, storms and extraction without full ocean rescans? | PRD-03/04/06/07 |
| **UNK-PROG-007** | Which maritime capability bands/providers survive the later FCC/material/recipe reconciliation and should become universal capabilities versus Set-26-only extensions? | FCC-12/13 + PRD-04 |
| **UNK-MAG-010** | How should weather-navigation magic expose bounded requests/forecasts without letting spells bypass environmental authority or make mundane navigation irrelevant? | PRD-04/06/07 |
| **UNK-AUT-016** | What automation graph can operate on a moving vessel frame and reconnect correctly to port/world networks when docked? | PRD-03/04/06/07 |
| **UNK-PST-009** | What save partition/journal granularity lets large VesselInstances recover atomically without rewriting entire vessel data after every edit? | PRD-03/04/06/07 |
| **UNK-PST-010** | How are visited marine regions migrated when worldgen/topology algorithms change but route/water identities cross old/new generation boundaries? | PRD-02/04/06/07; Set39 |
| **UNK-MP-005** | What interest-management hierarchy handles world region → vessel → compartment → actor/component relevance efficiently? | PRD-03/04/06/07 |
| **UNK-MP-006** | What helm/moving-frame prediction model gives responsive controls without clients owning persistent vessel transforms? | PRD-03/04/06/07 |
| **UNK-MP-007** | How are simultaneous voxel edits, damage, flooding and repair commands serialised/rejected at high latency on the same vessel region? | PRD-03/04/06/07 |
| **UNK-MP-008** | Is host migration for active maritime sessions required at initial multiplayer scope, and if so what authority/journal state must transfer? | Set31 + PRD-04 |
| **UNK-PERF-009** | What measured budgets should replace Set-26 provisional vessel-cell, active-fluid, field, network, memory and save-size targets? | PRD-06/07 |
| **UNK-PERF-010** | What packaged stress suite covers worst-case combinations such as storm + port + multiple editable vessels + flooding/fire + NPC crews + multiplayer? | PRD-06/07 |
| **UNK-DEV-011** | Which Set-26 technical recommendations survive direct prototypes against current Godot + Zylann and which require a different Leyforge-owned subsystem? | PRD-02/03/04/07 |
| **UNK-DEV-012** | What minimum Maritime Foundation Vertical Slice proves fluid, moving-frame, vessel commissioning, save/recovery and multiplayer boundaries without prematurely implementing fleet/naval breadth? | PRD-06/07 |
| **UNK-UX-013** | How should vessel/port/environment information be prioritised so advanced systems remain understandable without permanent dashboard overload? | PRD-07 |

# 35. Round-10 Coverage Result

Document Set 26A–26O is complete for the **initial PRD-01 extraction baseline**.

Round 10 added **186 unique technical requirements** and **55 explicit unknowns/evidence gaps**.

The strongest architecture pressure retained from Set 26 is:

- a hybrid water model separating stable Water Bodies, bounded local liquid volumes, marine fields and presentation;
- persistent generated marine topology with edited shoreline/canal/route/ecology deltas;
- responsive character aquatic interaction without a second movement/biology/combat game;
- static voxel construction → deterministic Shipwright scan → atomic commissioning → persistent vessel-local grid/frame;
- one authoritative aggregate vessel motion model rather than per-voxel rigid bodies or full CFD;
- separate structural commissioning, movement certification, construction/refit, combat damage and wreck-transition owners;
- persistent ports, crews, routes, fleets and cargo bound to real world resources and people;
- naval combat that resolves through physical vessel structure/compartments and supports non-destruction objectives;
- regional marine ecology/fisheries with conserved catches and representative nearby creatures;
- Vessel Forge as a specialist Unified-Forge workspace with editable semantic source and rebuildable products;
- authoritative moving-frame multiplayer, transactions, journaling, recovery and LOD reconciliation;
- no ambient Node/network/save-record-per-voxel/fish/wave/crew architecture; and
- a mandatory prototype/evidence programme before Set-26 design assumptions become LFE implementation canon.

**Authority note:** Set 26 is complete as a specialist **design programme**, not as technical feasibility evidence. Provisional numeric caps/physics constants and Summer Engine-era implementation choices remain evidence targets/historical guidance, not PRD-01 architecture locks.

**Document Set 26 baseline status: COMPLETE for initial PRD-01 extraction.**

The next source family is **Document Sets 27–30 plus the final XSI v1.1 cross-set interface authority**.

# 36. Round-11 — Document Sets 27–30 + XSI v1.1 Technical Requirement Extraction

## 36.1 Scope and authority handling

Round 11 extracts the reconciled Sets 27–30 packages and the final cross-set interface authority.

Authority handling follows the reconciled package itself:

1. **Cross-Set Interface Register v1.1 — Final Reconciled Contract**;
2. each set's updated **J v0.2** final-integration document;
3. specialist A–I gameplay rules;
4. earlier provisional interface-status wording.

The specialist documents retain ownership of their gameplay semantics. XSI v1.1 consolidates parallel interface proposals; it does not create a fifth gameplay owner.

The final four-layer ownership summary is retained exactly as the reconciliation report frames it:

- **Set 27:** why value moves / what it is worth / what is owed;
- **Set 28:** who agrees / believes / trusts / is assigned;
- **Set 29:** what the body can biologically sustain;
- **Set 30:** what can physically move / where / how long it takes.

Detailed aquatic locomotion remains a Set-26E provider behind Set 30's universal movement facade.

## 36.2 New requirements

| ID | Normative requirement | Primary source(s) | Classification / downstream |
|---|---|---|---|
| **REQ-GOV-037** | One gameplay rule must have one owner; other systems consume typed, versioned interfaces/evidence and may not recreate the owner's formula. | XSI v1.1 Governing Rule | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-GOV-038** | Set 27 owns prices/value/currency/markets/wages/economic contracts/finance/tax/trade economics; Set 28 owns dialogue/knowledge/social memory/relationships/companion social intent; Set 29 owns biological state; Set 30 owns non-aquatic physical movement/traversal/transport. | XSI v1.1 §2 | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-GOV-039** | Physical road/bridge/building infrastructure remains owned by Document 20/structure owners; movement only interprets mover-specific accessibility. | XSI v1.1 §2 | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-GOV-040** | Detailed aquatic locomotion remains owned by Set 26E while Set 30 provides the universal Aquatic movement facade and cross-medium coordination. | XSI v1.1 §§14–15 | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-GOV-041** | World clock/simulation time and global promotion triggers remain technical/world-authority concerns rather than being absorbed by Sets 27–30. | XSI v1.1 §§2,4,13 | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-GOV-042** | Cross-set consumers must receive bounded typed snapshots rather than another system's mutable arrays/records. | XSI v1.1 §3 | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-GOV-043** | Cross-set values whose staleness can affect authority must carry source revision and authoritative world time. | XSI v1.1 §3 | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-GOV-044** | Persistent cross-set actions/evidence must carry transaction/evidence identity and be idempotent. | XSI v1.1 §§3–4 | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-GOV-045** | Cross-set queries are side-effect free unless explicitly defined as commands. | XSI v1.1 §3 | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-GOV-046** | Permission/consent and physical feasibility are separate decisions owned by their respective systems. | XSI v1.1 §3 | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-GOV-047** | Intent and execution remain separate: economy/social/AI may request movement while Set 30 owns physical execution and authoritative arrival/failure evidence. | XSI v1.1 §3 | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-GOV-048** | Biological cause and movement consequence remain separate: Set 29 owns physiology, Set 30 applies only resulting movement restrictions/modifiers. | XSI v1.1 §3 | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-GOV-049** | Economic value and physical capacity remain separate: Set 27 values cargo/services while movement/vessel owners supply usable physical capacity. | XSI v1.1 §3 | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-GOV-050** | Actor knowledge/belief and objective truth remain separate; Set 28C owns belief/provenance while the owning gameplay system retains the fact. | XSI v1.1 §§3,10 | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-GOV-051** | Abstraction/LOD may not bypass local truth; distant execution cannot claim traversal or outcome that detailed simulation would reject. | XSI v1.1 §3 | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-GOV-052** | Earlier provisional interface names are historical aliases when XSI v1.1 defines the consolidated canonical contract. | XSI v1.1 §§16–20 | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-GOV-053** | For Sets 27–30 reconciliation, authority precedence is XSI v1.1 → each set's J v0.2 → specialist gameplay rules → earlier provisional interface-status wording. | Final Reconciliation Report §8 | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-ARCH-047** | Sets 27–30 must share one WorldTimeReference envelope for deadlines, social assignments, biological scheduling and travel estimates. | XSI v1.1 §4.1 | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-ARCH-048** | Actor presence must use an explicit shared presence-state envelope instead of each gameplay system interpreting wall-clock/application state independently. | XSI v1.1 §4.2 | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-ARCH-049** | Cross-set evidence must use a common envelope with evidence ID, source owner/event/transaction, subjects, outcome class, world time, revision and reason codes. | XSI v1.1 §4.3 | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-ARCH-050** | A consumer records the external evidence reference and commits its own consequence once rather than copying the producer's mutable state. | XSI v1.1 §4.3 | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-ARCH-051** | Cross-set promotion/demotion must use one transition context while each set serialises/reconstructs only its owned domain payload. | XSI v1.1 §13 | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-ARCH-052** | A promotion/demotion transition cannot complete while a required consequential domain remains reconciling or failed. | XSI v1.1 §13 | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-ARCH-053** | Economy integration must separate immutable definitions, mutable runtime records, summaries/read models and audit/history state. | 27J §§7–10 | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-ARCH-054** | Social integration must use world-scoped specialist services rather than one shared mutable SocialManager/dictionary. | 28J §§1–5 | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-ARCH-055** | Biology must separate immutable definitions, mutable state, derived values, revisioned snapshots, disposable caches, append-only history and UI state. | 29J §18 | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-ARCH-056** | Movement must separate immutable mover/traversal/vehicle definitions from runtime movement state, route plans and persistent journeys. | 30J §§6–7,20 | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-ARCH-057** | External systems requiring movement must submit intent/commands or consume snapshots; they may not mutate mover transforms. | 30J §§2,25–27 | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-ARCH-058** | Authoritative services must support solo/listen-server/dedicated-server operation without depending on presentation nodes. | 27J/28J/29J/30J | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-ECON-014** | Economic state must be caused by authoritative world state; markets, treasuries, contracts and summaries cannot become second inventories or free-value sources. | 27A §§1,9 | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-ECON-015** | Economic production/consumption must remain tied to real goods, labour/service capacity, ownership, obligations and route access. | 27A | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-ECON-016** | No item/service/currency definition owns one permanent executable price; price is contextual quote or committed transaction state. | 27B §1 | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-ECON-017** | A non-spendable Reference Value Unit may serve as a balancing anchor but never as currency/account balance or universal transaction price. | 27B §§5–7 | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-ECON-018** | The runtime must support contextual currency acceptance, multiple currency families, barter and mixed consideration rather than one mandatory universal currency. | 27B §§9–16 | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-ECON-019** | Currency/account systems must preserve authorised issuance, destruction, transfer and custody semantics; no ghost currency is allowed. | 27A/27B | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-ECON-020** | Executable price calculations must be deterministic and audit-friendly, using controlled integer/fixed-point arithmetic rather than uncontrolled floating stock/value truth. | 27B | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-ECON-021** | Price formation must compose reference/instance value, market pressure, actor spread/concession, taxes/fees, conversion and rounding while preserving owner boundaries. | 27B §§17–20 | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-ECON-022** | Non-trivial quotes must expose reason vectors/top causal factors sufficient for explanation. | 27B; 27J §20 | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-ECON-023** | Markets must be local/regional by default and connected through actual information/transport relationships rather than an omniscient global market. | 27C | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-ECON-024** | Market listings resolve from authoritative stock/reservations and are not duplicate inventories. | 27C §§9–10 | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-ECON-025** | Sellable stock excludes reservations, protected reserves and unavailable/locked lots and remains bounded by access/service capacity. | 27C §§9–10 | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-ECON-026** | Expected arrivals may influence forecasts but cannot become sellable stock before authoritative delivery. | 27C §11 | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-ECON-027** | Merchant/market replenishment must come from production/purchase/transfer/delivery/bootstrap/admin authority, never hidden restock timers. | 27C | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-ECON-028** | Economic demand must originate from valid consumer/project/service/production/reserve intents and is not itself a purchase or consumption. | 27C §§13–15 | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-ECON-029** | Market pressure must be deterministic, bounded, damped and explainable; Set 27C produces pressure and Set 27B maps it to prices. | 27C §§16–20 | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-ECON-030** | Merchant purchasing must be bounded by valid funds/capacity; a merchant may reduce quantity, barter, seek finance/contract or refuse rather than invent purchasing power. | 27C | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-ECON-031** | Distant markets may aggregate stock lots/demand/flows but must preserve conservation and significant obligations. | 27C; 27J | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-ECON-032** | Household economic simulation must support shared summaries while preserving individual ownership for named/unique property and important obligations. | 27D | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-ECON-033** | Household membership remains externally owned; Set 27D owns economic pooling, reserves and affordability rather than social/household identity. | 27D | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-ECON-034** | Property rights must support modular ownership/custody/control/access/use/lease/extraction/transfer/pledge/benefit semantics rather than one overloaded owner flag. | 27D | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-ECON-035** | Labour output must resolve to valid worker/service capacity, time, skill and availability; no ghost labour is permitted. | 27A/27D | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-ECON-036** | Compensation may be currency, goods, housing/services, shares or other explicit forms only when promised value is actually reserved/delivered. | 27D | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-ECON-037** | Enterprise identity must be persistent and separate from its building, owner, merchant actor and balances. | 27D | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-ECON-038** | Profit, cash balance and owner withdrawals/dividends must remain separate; withdrawals are explicit authorised transfers. | 27D | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-ECON-039** | Contracts must use persistent ContractInstance plus typed modular obligations rather than separate hard-coded engines per family. | 27E | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-ECON-040** | Contract formation must preserve parties/authority, essential terms, acceptance and a versioned agreement snapshot. | 27E | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-ECON-041** | Contract obligations complete only from authoritative evidence of goods/services/payment/rights or an owned external decision; elapsed time alone is insufficient. | 27E | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-ECON-042** | Delivery obligations must preserve origin/destination, custody/ownership terms, quantity/condition and authoritative handover evidence while movement remains external. | 27E | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-ECON-043** | Escrow/security must hold actual transferred/reserved value and cannot be an unfunded promise. | 27E | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-ECON-044** | Milestones, partial performance, substitution, acceptance, cure, force-majeure and breach/remedy state must be explicit contract data. | 27E | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-ECON-045** | Contract remedies may affect only authorised economic value/rights; legal arrest/seizure, social forgiveness and physical movement remain external. | 27E | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-ECON-046** | Financial assets must resolve to valid claims/liabilities/custody relationships or ownership of existing assets; finance cannot silently mint value. | 27F | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-ECON-047** | Loans/credit must be funded by lender capacity or explicitly authorised issuance and preserve principal, schedule, charges, repayment and default state. | 27F | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-ECON-048** | Credit decisions must use explainable risk factors/policy bands rather than one opaque universal score. | 27F | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-ECON-049** | Collateral/security claims remain separate from underlying ownership until an authorised transfer/enforcement event. | 27F | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-ECON-050** | Insurance requires an insurable subject, defined risks/exclusions, consideration and funded capacity; payouts cannot exceed authorised loss/policy bounds. | 27F | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-ECON-051** | Tax/public-finance state must use explicit policies, assessments, obligations, collections and treasury transactions rather than hidden deductions or production multipliers. | 27G | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-ECON-052** | In-kind taxation/subsidies/procurement must use real delivered/reserved resources or authorised treasury transfers. | 27G | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-ECON-053** | Customs/tariffs require a valid crossing and applicable jurisdiction; no global remote customs mutation is allowed. | 27G | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-ECON-054** | Treasuries must distinguish general and restricted/earmarked funds and physical strategic-stock obligations where applicable. | 27G | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-ECON-055** | Player-meaningful treasury mutations must retain actor, authority, source/destination, amount, purpose and policy/contract/event provenance. | 27G | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-ECON-056** | Economic routes must be persistent records over valid endpoints and mode-specific legs while each transport owner retains physical execution. | 27H | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-ECON-057** | Trade opportunities derive from residual need/surplus, obligations, strategic/public demand, production or passenger/service demand plus valid access; price difference alone is insufficient. | 27H | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-ECON-058** | Export reserves/removes real origin stock and import becomes real only on authoritative arrival. | 27H | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-ECON-059** | Trade must protect stock reserved for provisions/projects/contracts/emergencies/policy minimums unless an authorised override exists. | 27H | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-ECON-060** | Shipments must preserve cargo ownership, custody, provenance, reservations and multi-leg handoffs without duplication. | 27H | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-ECON-061** | Distant trade must use bounded shipment/event checkpoints and reconcile physical stock/capacity rather than simulate fictional per-frame commerce. | 27H | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-ECON-062** | Trade/route estimates must carry source, timestamp, coverage/confidence and cannot present stale/unknown access as certainty. | 27H | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-ECON-063** | Restricted/illicit economy is an overlay on normal stock/price/route/ownership truth rather than a parallel economy. | 27I | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-ECON-064** | Black-market/contraband supply must resolve to real stock/provenance and valid supply/access; no infinite illicit inventory is allowed. | 27I | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-ECON-065** | Embargoes/sanctions/quotas may restrict authorised commerce but cannot erase inventories or automatically close all physical routes. | 27I | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-ECON-066** | Smuggling is an economic mission overlay; physical movement/detection and legal/social consequences remain external. | 27I | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-ECON-067** | Economic restrictions must not make mandatory progression permanently unreachable without an approved capability fallback. | 27I | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-ECON-068** | Economic LOD/catch-up must preserve major contracts, financial obligations, stock conservation, deadlines and scheduled commitments. | 27J §§22–30 | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-ECON-069** | Economic transactions/reservations must be atomic/idempotent under concurrency, reconnect and recovery. | 27J §§32–36 | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-ECON-070** | Set 27 must expose economic terms snapshots to Set 28 and accept bounded social commercial resolutions while retaining executable-term commit authority. | XSI v1.1 §5 | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-ECON-071** | Set 27 must consume PopulationHealthSummary/economic provision interfaces rather than recalculate biological food/medical/workforce demand. | XSI v1.1 §6 | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-ECON-072** | Set 27 transport missions must define commercial origin/destination, capacity needs, windows, route policy and clearances while Set 30 owns physical planning/execution. | XSI v1.1 §7 | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-ECON-073** | Set 27 must consume TransportExecutionSnapshot evidence for usable capacity, route state, ETA/progress, condition, blockers and arrival rather than infer movement. | XSI v1.1 §7 | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-SOC-001** | Social outcomes must be traceable to authoritative people, knowledge, memories, relationships and world events; social systems cannot invent external facts. | 28A §1 | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-SOC-002** | Person existence/home/job/schedule/household remain externally owned while Set 28 owns social personality, relationships, social memory, conversation, companion and assignment-social state. | 28A §2 | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-SOC-003** | Conversation runtime must be a bounded authoritative session over persistent participants and live context rather than a detached frozen menu. | 28B §1 | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-SOC-004** | Consequential conversation choices require revalidation against current world/system revisions before commit. | 28B | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-SOC-005** | Displaying dialogue or a choice cannot itself mutate external gameplay state; consequential actions route through owner commands/results. | 28B | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-SOC-006** | Conversation runtime must support participant roles, topic/intent selection, beat traversal, choice eligibility, interruption/suspension/resumption and semantic events. | 28B | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-SOC-007** | Set 28C must represent knowledge as propositions/claims with belief stance, confidence, provenance, freshness and contradiction/correction state. | 28C | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-SOC-008** | Set 28C must not duplicate mutable facts such as price, Health, quest stage, territory owner, vehicle position or structure condition. | 28C §2.3 | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-SOC-009** | Historical observations/claims may persist after facts change only with explicit time/provenance/belief semantics. | 28C | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-SOC-010** | Rumour/information propagation must be bounded and knowledge-aware rather than granting omniscient server truth. | 28C/28J | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-SOC-011** | Language competency, comprehension, translation/interpreter fidelity and information-transfer outcome must be represented as social information state. | 28C | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-SOC-012** | Relationships must use persistent directed/scope-aware edges rather than one universal friendship/reputation meter. | 28D | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-SOC-013** | Trust, Affection, Fear, Loyalty, Respect, Grievance and Familiarity must remain distinct dimensions; none automatically implies friendship, romance, morality or consent. | 28D | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-SOC-014** | Significant relationship milestones must derive from evidence-linked events/repeated behaviour and mutual requirements where applicable. | 28D | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-SOC-015** | Relationship consequence must remain separate from the external cause, belief about the cause, companion decision and downstream economic result. | 28D §2.3 | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-SOC-016** | Relationship graphs must support sparse persistence/LOD without discarding important directed bonds/history. | 28D/28J | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-SOC-017** | Social influence can modify a willing decision only within plausible/authorised bounds and cannot bypass eligibility, external authority, physical impossibility or consent. | 28E | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-SOC-018** | Intimidation may produce compliance but cannot be treated as sincere agreement, friendship, loyalty or consent. | 28E | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-SOC-019** | Negotiation must separate social concessions/process from executable economic/political terms committed by external owners. | 28E | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-SOC-020** | Social-action resolutions must expose reason codes and emit social evidence rather than directly editing unrelated domains. | 28E | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-SOC-021** | Companion recruitment creates bounded participation/permission and must preserve identity, agency, obligations and refusal/exit conditions. | 28F | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-SOC-022** | Companion membership/agreement/autonomy/permissions remain separate from relationship Loyalty; no duplicate loyalty score may shadow 28D. | 28F | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-SOC-023** | Companion following/seating/riding/travel remain physically Set-30-owned; Set 28 supplies permission/intent only. | 28F/XSI | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-SOC-024** | Delegation is persistent orchestration over authoritative external systems and cannot declare world effects merely because assignment time elapsed. | 28G | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-SOC-025** | Assignments must preserve issuer/assignee, authority, goal, targets, constraints, briefing/knowledge, resources/custody, deadline, reporting and adapter/evidence state. | 28G | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-SOC-026** | An assignment cannot begin with information the assignee does not actually possess unless a valid briefing transfers it. | 28G | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-SOC-027** | Off-screen assignment resolution must use bounded checkpoints and authoritative domain summaries without skipping required transactions. | 28G | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-SOC-028** | Assignment reports must distinguish observed fact, inference, hearsay, missing evidence and unknown status. | 28G | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-SOC-029** | Assignment autonomy may adapt methods within accepted constraints but material term changes require reapproval. | 28G | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-SOC-030** | Recall/cancel is itself a request subject to communication, travel and current-crisis state rather than instant remote control. | 28G | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-SOC-031** | Assignments may affect quests/contracts/world state only through authoritative evidence from the owning domain. | 28G | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-SOC-032** | Runtime generated dialogue, if enabled, must receive bounded semantic/knowledge packets rather than unrestricted world databases/hidden state. | 28H | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-SOC-033** | Generated wording may realise an authorised semantic frame but cannot create new canon, hidden truth, prices, obligations or gameplay outcomes. | 28H | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-SOC-034** | Generated wording must preserve semantic meaning; material entities, quantities, beneficiaries, urgency and action type cannot drift. | 28H | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-SOC-035** | Every generated candidate must pass schema/entity/knowledge/contradiction/state-claim/tone/safety validation and have deterministic fallback. | 28H | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-SOC-036** | Consequential displayed generated text may be preserved for history, but authoritative saves store semantic IDs/results independent of wording source. | 28H | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-SOC-037** | Runtime interpretation of player free text may map only to currently legal semantic intents; consequential ambiguity requires clarification/confirmation. | 28H | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-SOC-038** | Remote language/model providers require explicit data-egress/privacy policy and may not receive raw saves/secrets/unnecessary data. | 28H | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-SOC-039** | Generated/social content provenance must retain source mode, template/definition/provider version where relevant, grounding hash and validation/approval state. | 28H | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-SOC-040** | Deterministic localisation must remain a baseline path so runtime generation cannot make unsupported languages second-class. | 28H/28I | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-SOC-041** | Social presentation consumes authoritative read models and cannot commit gameplay. | 28I | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-SOC-042** | Social presentation must support subtitles/captions, speaker attribution, turn readability, history, choice requirements/reasons, localisation and voice metadata without leaking hidden state. | 28I | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-SOC-043** | Social runtime must use specialist services with typed records and command/event boundaries rather than a shared mutable dictionary. | 28J | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-SOC-044** | Social commands must validate identity, scope, revision, permissions, knowledge and duplicate-commit state before mutation. | 28J | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-SOC-045** | Social queries are side-effect free and return revisioned read models suitable for stale-command protection. | 28J | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-SOC-046** | Consequential social mutations must return explicit stale/invalid/already-committed outcomes instead of silently applying against changed state. | 28J | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-SOC-047** | Client social replication must be observer/permission/knowledge filtered and may not expose server knowledge just because it exists. | 28J | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-SOC-048** | Relationship events and cross-system effects must be idempotent so duplicate delivery cannot apply the same change twice. | 28J | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-SOC-049** | Multi-owner negotiation/companion/assignment operations must preserve correlated/atomic commit evidence or recover safely from partial failure. | 28J | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-SOC-050** | Generated-provider failure must never invalidate authoritative semantic conversation state. | 28J | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-SOC-051** | Host/server owns mutable social state; clients submit commands and receive privacy/relevance-filtered deltas/read models. | 28J | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-SOC-052** | Social persistence stores semantic records/history required for consequence, not node references or verbatim transcripts as sole truth. | 28J | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-SOC-053** | Social migrations must be stepwise, preserve stable IDs/meaning and visibly quarantine/fail on missing content rather than nearest-name guessing. | 28J | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-SOC-054** | Social LOD/catch-up must preserve named actors, companion/assignment state, meaningful relationship edges and knowledge provenance without omniscient promotion. | 28J | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-SOC-055** | Set 28 must consume SocialBiologicalSummary for care/availability and may submit SocialCareContext while Set 29 owns treatment eligibility/outcome. | XSI v1.1 §8 | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-SOC-056** | Set 28 owns SocialMovementAuthorisation/FormationIntent and uses generic ExternalMovementIntent rather than implementing bespoke movement. | XSI v1.1 §9 | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-SOC-057** | Set 28C consumes objective RouteObservation and publishes RouteKnowledgeSnapshot with belief/confidence/provenance/staleness without mutating route truth. | XSI v1.1 §10 | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-BIO-009** | Set 29 owns Health, Stamina, Fatigue, hunger/hydration/nutrition, temperature/wetness/sleep, injury, disease/toxin, treatment and biological modifiers without absorbing combat/economy/social/movement authority. | 29A/XSI | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-BIO-010** | Death/downing/respawn remain external; Set 29 exposes depleted/critical/stabilised/recovery states. | 29A/29B | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-BIO-011** | Health and persistent injury/disease/toxin state remain distinct so raw Health cannot replace condition semantics. | 29A–29G | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-BIO-012** | Stamina spending is one authoritative Set-29 transaction using action-owner context plus biological modifiers; action/movement owners do not subtract independently. | 29B/XSI | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-BIO-013** | Fatigue remains longer-term strain separate from momentary Stamina and primarily recovers through valid rest/sleep pathways. | 29B | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-BIO-014** | Ordinary walking does not spend Stamina by default; exertion is action/context driven rather than frame driven. | 29B | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-BIO-015** | Biological carrying penalties consume declared load/heavy-carry context without introducing a universal kilogram inventory model. | 29A/29B | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-BIO-016** | Hunger must preserve satiety/reserve and severity semantics while allowing distant populations to use deterministic demand summaries. | 29C | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-BIO-017** | Thirst remains a supported channel with explicit enable/applicability state even when disabled by default in Standard. | 29A/29C/29J | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-BIO-018** | Nutrition uses bounded contribution groups/rolling state rather than a micronutrient simulator while preserving meaningful recovery/workforce effects. | 29C | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-BIO-019** | Food/water consumption must route real committed item/serving results into biology and cannot be a universal instant combat heal. | 29C | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-BIO-020** | Unsafe ingestion creates explicit disease/toxin exposure rather than letting consumption code invent illness directly. | 29C/29F | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-BIO-021** | Thermal state must be driven by authoritative environment/protection snapshots and use semantic exposure state with neutral recovery. | 29D | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-BIO-022** | Wetness must persist/dry as biological state but wetness alone cannot create infection. | 29D/29F | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-BIO-023** | Shelter is consumed as validated protection capabilities such as precipitation/wind/shade/insulation/heating/cooling/sleep suitability rather than a decorative indoors flag. | 29D | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-BIO-024** | Sleep evaluates rest-site quality/safety/shelter/environment/interruption and reports restorative result without advancing world time itself. | 29D | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-BIO-025** | Closing a local application cannot silently inflict starvation, disease, bleed-out, fatigue or exposure; progression follows world-time/presence policy. | 29I/XSI | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-BIO-026** | Persistent injuries use semantic body regions and bounded injury families/severity rather than organ-by-organ simulation. | 29E | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-BIO-027** | Repeated compatible injury on a region/family consolidates/worsens rather than creating unbounded duplicate wounds. | 29E | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-BIO-028** | Bleeding/Blood Loss, pain and functional impairment are biological consequences whose action/movement effects are consumed through interfaces. | 29E | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-BIO-029** | Injury recovery preserves lifecycle and re-injury rather than disappearing on unload or raw Health restoration. | 29E | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-BIO-030** | Disease/infection is exposure-based, route-aware and lifecycle driven rather than a generic random sickness roll. | 29F | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-BIO-031** | Disease state separates severity from lifecycle and supports definition-controlled resistance/immunity/reinfection. | 29F | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-BIO-032** | Environmental/wound/food/water owners supply exposure evidence while 29F owns infection/toxin state. | 29F | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-BIO-033** | Poison/toxin is represented per toxin/venom with load/elimination semantics rather than one universal DOT status. | 29F | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-BIO-034** | Treatment follows Capability → Validate → Reserve/Commit Cost → Perform → Biological Outcome → History. | 29G | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-BIO-035** | Routine first aid primarily stabilises/controls/protects and is not an unconditional full-heal action. | 29G | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-BIO-036** | Health restoration, injury treatment, disease cure and toxin treatment remain distinct biological consequences. | 29G | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-BIO-037** | Diagnosis/assessment produces evidence/confidence while true condition identity remains with injury/disease owners and visibility is knowledge-filtered. | 29G | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-BIO-038** | Advanced care may require provider capability, clean context, tools, assistants, medicine and functional staffed/supplied facilities. | 29G | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-BIO-039** | Magic may supply treatment/protection/profile-overlay capability after paying its own costs, but Set 29 validates/commits biological change. | 29G/29H | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-BIO-040** | Biological profiles use a base profile plus explicit permanent/temporary overlays rather than copying full profiles for minor variants. | 29H | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-BIO-041** | Culture/faction cannot directly change biology unless a separate physical/environmental/training/magical/transformation source changes physiology. | 29H | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-BIO-042** | Non-biological actors explicitly disable/scope biological channels; maintenance/charging cannot be renamed Hunger/Disease. | 29H | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-BIO-043** | Equipment/item/combat owners retain gear identity/fit/durability/defence; Set 29 consumes effective biological protection traits only. | 29H | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-BIO-044** | Permanent biological transformation is an explicit profile-overlay/migration event with source authority, persistence and reversibility/consent policy where applicable. | 29H | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-BIO-045** | Mixed settlements evaluate actual resident biological profiles/needs rather than assuming a majority ancestry/body default. | 29H | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-BIO-046** | Effective profile composition is cached/recomputed only when source overlays change, not rebuilt from registries every frame. | 29H | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-BIO-047** | Biology supports five LODs—Active, Local Reduced, Settlement/Chunk Summary, Regional Abstract and Dormant/Scheduled—without changing core rules. | 29I | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-BIO-048** | Severe/critical, quest/story, companion, player and protected named cases remain individually traceable through LOD. | 29I | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-BIO-049** | Routine unnamed populations may aggregate only by compatible biological profile/state while preserving real resource/service constraints. | 29I | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-BIO-050** | Biological catch-up uses bounded deterministic simulation-time slices/milestones and may spread workload without skipping authoritative elapsed time. | 29I | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-BIO-051** | Biological persistent state/resource/treatment transactions are host/server authoritative; only explicitly safe presentation/Stamina prediction may occur locally. | 29I | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-BIO-052** | Biological replication prioritises critical state and transaction results over slow-changing routine detail. | 29I | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-BIO-053** | Biological UI separates simulation truth from player-visible knowledge and provides multi-channel accessible warnings. | 29I | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-BIO-054** | The canonical Survival API remains `leyforge.system.interface.survival` v1.0 with the nine mandatory compatibility endpoints frozen by Set 29/XSI. | 29J §19/XSI §18 | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-BIO-055** | Survival API queries are side-effect free, revision/time-aware where needed, knowledge-filtered and explicit for disabled/inapplicable channels. | 29J §§19–20 | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-BIO-056** | Persistent biological commands carry transaction ID, source owner, world time, expected revision where needed, source refs, permission context and resulting revision/history. | 29J §21 | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-BIO-057** | Duplicate committed biological transaction IDs return the prior result rather than execute twice. | 29J §21 | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-BIO-058** | Set 29 exposes one canonical PopulationHealthSummary for aggregate consumers rather than multiple incompatible health-demand formulas. | AM-29-104/XSI §6 | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-BIO-059** | Set 29 exposes a unified revisioned biological modifier bundle while retaining named compatibility queries. | AM-29-105 | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-BIO-060** | Persistent biological commands return a unified transaction result envelope with commit status/reason/revisions/resource refs/outcome refs/world time. | AM-29-106 | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-BIO-061** | Set 29 receives MovementExertionRequest physical context and returns MovementExertionDecision; Set 30 does not define biological Stamina costs. | XSI v1.1 §11 | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-BIO-062** | Movement exertion estimate mode is side-effect free so map/route queries cannot spend Stamina. | XSI v1.1 §11 | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-BIO-063** | Set 29 publishes BiologicalMobilityModifierSnapshot for Stamina/carry/fatigue/injury/thermal/disease/toxin movement restrictions. | XSI v1.1 §11.3 | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-BIO-064** | Set 29 consumes PhysicalImpactEvent evidence and returns BiologicalImpactResult without Set 30 precomputing injury/Health outcome. | XSI v1.1 §12 | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-MOV-009** | Set 30 owns physical non-aquatic movement/traversal/mount/land-transport/route-accessibility/local-navigation/movement-LOD truth without absorbing external owners. | 30A/30J/XSI | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-MOV-010** | Ordinary player locomotion is input-led, collision-authoritative and presentation-independent; animation/camera/VFX cannot create world displacement. | 30B | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-MOV-011** | Movement states support ordinary stance/locomotion/airborne modes plus specialist transitions while preserving one authoritative mover state. | 30B/30J | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-MOV-012** | Movement consumes biological/environment/equipment modifiers through owner snapshots rather than duplicating their formulas. | 30A/30J/XSI | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-MOV-013** | Sustained climbing is not universally available on arbitrary walls; it requires valid capability plus geometry/surface/anchor/link/equipment/magic permission. | 30C | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-MOV-014** | Traversal uses candidate query/scoring, capability/clearance validation, explicit action lifecycle and safe return to ground/airborne state. | 30C | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-MOV-015** | Vault/mantle/climb/ladder/rope/grapple links retain semantic requirements and are not free navigation graph edges. | 30C/30I | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-MOV-016** | Set 30D computes physical fall/landing evidence; Set 29 owns resulting injury/Health consequence. | 30D/XSI §12 | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-MOV-017** | Gravity/environment movement consumes authoritative field state; visual weather/wind cannot create physical force. | 30D | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-MOV-018** | Reduced-motion accessibility cannot remove authoritative movement physics. | 30D | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-MOV-019** | Mounting creates a control/attachment relationship while the mount remains the physical mover and retains external biology/AI/social/inventory ownership. | 30E | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-MOV-020** | Mounted control is filtered through mount capability, availability, terrain, load and permission rather than player input overriding all constraints. | 30E | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-MOV-021** | Seat/passenger assignment separates social authorisation from physical fit/availability. | 30E/XSI §9 | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-MOV-022** | Unpowered carts/wagons/carriages must model footprint/swept envelope, load effect, ground contact, slope/grade, steering, braking and hitch/draft relationships without requiring a universal rigid-body simulator. | 30F | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-MOV-023** | Physical convoy execution remains movement-owned while caravan economics/cargo commitments remain Set 27-owned. | 30F/XSI | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-MOV-024** | Guided vehicles move only on continuous compatible authorised guides with occupancy/reservation and safe-separation rules. | 30G | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-MOV-025** | Powered transport accelerates only when the owning power/energy system reports movement-ready state; Set 30 cannot invent fuel/power/mana. | 30G | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-MOV-026** | Switch/signal/power/control systems may own readiness while Set 30 owns resulting guided motion. | 30G/30J | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-MOV-027** | Route accessibility is mover-specific and state-specific rather than one global open/closed graph edge. | 30H | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-MOV-028** | Route planning distinguishes hard accessibility gates from soft suitability/unsafe-but-passable costs and returns explainable blockers/reasons. | 30H | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-MOV-029** | Route planning uses actual movement modes/transfers/effective distance rather than straight-line teleport assumptions. | 30H/30J | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-MOV-030** | Destination intent and route knowledge remain externally owned; 30H/30I own physical route feasibility/execution. | 30H/30I | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-MOV-031** | NPC/creature AI may request a destination but cannot declare arrival, teleport or independently simulate physical movement. | 30I | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-MOV-032** | Local navigation is derived from authoritative voxel/collision/world state and is disposable; persistent location/journey state cannot depend only on regenerated nav data. | 30I | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-MOV-033** | Dynamic voxel edits invalidate only relevant nav/route evidence and trigger bounded replanning. | 30I/30J | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-MOV-034** | AI-controlled movers use the same mover-profile/capability restrictions and cannot gain invisible traversal privileges. | 30I | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-MOV-035** | Doors/gates/ladders/ropes/lifts/moving platforms/mounts/vehicles are explicit navigation links with capability/permission/reservation requirements. | 30I | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-MOV-036** | Path following/steering cannot directly set transforms to path points or cross inaccessible geometry to avoid conflicts. | 30I | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-MOV-037** | Constrained spaces/resources use reservations/occupancy with lifecycle, capacity and deterministic conflict handling. | 30I | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-MOV-038** | Deadlock resolution uses wait/yield/release/re-request/replan/failure policies and never teleports actors through one another. | 30I | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-MOV-039** | Stuck detection distinguishes legitimate queue/wait states and uses bounded recovery/replan before exceptional safe relocation. | 30I | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-MOV-040** | Companion following/regroup does not routinely teleport through locked geometry; exceptional safe relocation is explicit and bypass-safe. | 30I | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-MOV-041** | Set 28 owns formation intent while Set 30 owns physical slots, compression, separation and regroup movement. | 30I/XSI §9 | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-MOV-042** | Creature AI owns herd/flock/pack intent while Set 30 owns physical group motion. | 30I | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-MOV-043** | Job/work systems may request semantic destinations but task completion cannot be inferred until authoritative arrival/use-point access. | 30I | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-MOV-044** | Movement LOD preserves mover identity, semantic location, journey progress, attachments/passengers/cargo and valid route truth. | 30I/30J | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-MOV-045** | A distant mover cannot cross a route/bridge/gate/geometry state that local simulation would reject. | 30J §35/XSI §3 | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-MOV-046** | Every physically instantiated mover has exactly one authoritative transform and velocity source. | 30J §27 | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-MOV-047** | Animation, camera and client prediction never become persistent transform authority without host/server acceptance. | 30J §§27,38,40–41 | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-MOV-048** | Movement on moving supports/vehicles preserves explicit frame/attachment relationships and authoritative seat/spatial anchors. | 30J §§29,36 | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-MOV-049** | The Movement API retains `CurrentMovementMode`, `MaxSpeed`, `CargoCapacity`, `TraversalCost`, `VehicleCondition`, `MountStatus`, `TravelTime` and `RouteAccessibility`. | 30J §25/XSI §19 | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-MOV-050** | Movement API endpoints cannot recalculate economic/social/biological rules internally. | 30J | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-MOV-051** | Detailed aquatic locomotion remains 26E-owned; Set 30 publishes Aquatic mode and coordinates non-aquatic entry/re-entry and route/navigation provider edges. | XSI v1.1 §14 | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-MOV-052** | Aquatic mounts retain 30E rider/seat/control relationships while Set 26 owns water-medium locomotion. | XSI v1.1 §14.6 | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-MOV-053** | Movement multiplayer is host/server authoritative for transform/journey/attachments/arrival with bounded prediction/reconciliation for player-controlled movers. | 30I/30J | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-MOV-054** | Movement persistence/reconstruction uses stable mover/definition/route/frame identities rather than node paths/transient nav caches. | 30I/30J | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-SIM-017** | Global simulation authority selects fidelity transitions while Sets 27–30 each own their domain reconciliation payload. | XSI v1.1 §13 | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-SIM-018** | Cross-set LOD summaries may compress routine detail but retain consequential commitments, protected identities and source revisions required for reconstruction. | 27J/28J/29I/30I | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-SIM-019** | No set may use LOD demotion as permission to create free stock, heal/kill actors, complete assignments or teleport movers. | 27J/28J/29I/30I | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-SIM-020** | Promotion must reconstruct from authoritative records/evidence rather than rerolling local outcomes. | XSI v1.1 §13 | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-MP-029** | Sets 27–30 persistent mutations are host/server authoritative; clients cannot directly edit economic/social/biological/movement truth. | 27J/28J/29I/30J | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-MP-030** | Cross-set commands use expected revisions/idempotency so retries/reconnects cannot duplicate payments, social changes, treatment, Stamina spend or arrivals. | XSI/J docs | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-MP-031** | Clients receive only relevance/permission/knowledge-appropriate snapshots rather than complete hidden state. | 27J/28J/29I/30I | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-MP-032** | Reconnect reconstructs views/controllers from authoritative records and rejects stale commands/snapshots. | 27J/28J/29I/30J | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-MP-033** | Movement prediction can improve responsiveness but authoritative transform/arrival and persistent consequences remain server truth. | 30J | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-PST-043** | Sets 27–30 saves persist consequential domain records and stable external references rather than duplicate another owner's mutable state. | 27J/28J/29J/30J | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-PST-044** | Cross-domain save/checkpoint must capture compatible revisions or use reconciliation/journal barriers so partially committed interactions recover safely. | 27J/28J/29J/30J | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-PST-045** | Migrations preserve stable semantic IDs/meaning and use explicit migration/quarantine for incompatible content rather than nearest-name substitution. | 27J/28J/29J/30J | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-PST-046** | Audit/history retains enough evidence to explain consequential transactions, social changes, treatments and movement outcomes without requiring unbounded raw logs. | 27J/28J/29J/30J | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-UX-066** | Economy UI uses progressive disclosure, non-colour-only signals and causal reason codes rather than raw simulation internals. | 27J | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-UX-067** | Economic information exposes freshness/confidence/knowledge limits and does not present stale/unknown market or route state as certainty. | 27J/XSI §10 | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-UX-068** | Social UI protects private beliefs/relationships/knowledge and exposes only authorised read-model summaries. | 28I/28J | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-UX-069** | Biological UI exposes semantic status/reason/trend and critical multi-channel alerts with knowledge filtering. | 29I/29J | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-UX-070** | Movement/route UI exposes accessible blocker/unsafe-route/reason information rather than raw pathfinding cost. | 30H/30J | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-UX-071** | Authoritative mechanical accessibility modifiers follow explicit world/server policy rather than hidden presentation-only changes. | 29I/30J | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-PERF-030** | Economy uses bounded event/tick scheduling, local-detail/regional-summary LOD and catch-up rather than per-frame macroeconomic simulation. | 27A/27J | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-PERF-031** | Social simulation uses sparse relationship graphs, bounded rumour/history catch-up and relevance-filtered replication rather than all-pairs simulation. | 28D/28J | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-PERF-032** | Biology uses scheduled channels/cohorts/bounded catch-up and no render-FPS-dependent outcomes. | 29I | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-PERF-033** | Movement/navigation uses hierarchical/relevance-bounded pathing, local invalidation and movement LOD rather than full-world pathfinding for every actor. | 30H/30I/30J | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-PERF-034** | Performance reduction may lower fidelity/cadence but cannot change conserved stock, social identity/history, biological consequence or route/movement truth. | 27J/28J/29I/30J | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-DEV-042** | Set 25 must register final XSI interface IDs/schema versions; implementations target canonical XSET contracts rather than provisional aliases. | XSI v1.1 §§20–21 | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-DEV-043** | The final terrestrial Environment Movement Field owner mapping remains an explicit external dependency and must not be guessed inside Set 30. | XSI v1.1 §21 | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-DEV-044** | Automation/Magic readiness adapters for powered/guided transport remain explicit external dependencies and must not be invented by movement. | XSI v1.1 §21 | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-DEV-045** | Exact Godot classes, tick rates, performance/network thresholds and storage layouts remain implementation/evidence questions, not design locks from Sets 27–30. | XSI v1.1 §21/J docs | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |
| **REQ-DEV-046** | Validation must test cross-owner invariants such as no direct price rewrite by social systems, no client Trust mutation, no movement teleport, no biology-owned attack resolution and no abstraction bypass. | 27J/28J/29J/30J validation | Design/interface/runtime constraint → PRD-03/04/06/07/09; LFE as applicable |

# 37. Round-11 Explicit Unknowns / Evidence Gaps

| ID | Unknown / evidence gap | Required downstream |
|---|---|---|
| **UNK-ARCH-013** | What concrete schema/serialization mechanism should implement revisioned XSET snapshots/evidence envelopes without creating excessive allocation or network overhead? | PRD-03/04/06/07 |
| **UNK-ARCH-014** | What cross-service transaction coordinator/journal pattern safely supports multi-owner operations without becoming a new gameplay authority? | PRD-04/06/07 |
| **UNK-ARCH-015** | How are source revisions compared/invalidated across independently scheduled economy/social/biology/movement services? | PRD-03/04/06/07 |
| **UNK-GOV-007** | What exact Set-25 registry IDs/major-minor compatibility rules should be assigned to XSET-001 through XSET-011? | PRD-04; LFE registry governance |
| **UNK-ECON-006** | What fixed-point scales/ranges are required for prices, currency, wages, accounts, taxes and large institutional balances without overflow or wasted precision? | PRD-03/04/06/07 |
| **UNK-ECON-007** | What market aggregation structure preserves stock coverage, flows, substitutions and memory from hamlet to region without expensive per-item/per-actor updates? | PRD-03/04/06/07 |
| **UNK-ECON-008** | What price-pressure smoothing/window parameters remain stable and responsive across different world simulation speeds and market sizes? | PRD-06/07 |
| **UNK-ECON-009** | What ledger/journal granularity is necessary for audit/recovery without allowing long-lived economic worlds to grow saves indefinitely? | PRD-04/06/07 |
| **UNK-ECON-010** | How should physical currency stacks, purse balances, accounts and bullion interoperate with the authoritative inventory/container system? | PRD-04/06/07 |
| **UNK-ECON-011** | What transaction locking/reservation strategy prevents overselling/overdrawing across simultaneous player, NPC, automation and contract operations? | PRD-03/04/06/07 |
| **UNK-ECON-012** | How should regional trade summaries allocate/consume real origin stock when many distant shipments compete for the same reserves? | PRD-04/06/07 |
| **UNK-ECON-013** | What bounded finance/insurance simulation is sufficient for advanced settlements without requiring a full banking-sector macro simulation? | PRD-06/07 |
| **UNK-SOC-001** | What sparse relationship-graph storage/indexing model supports millions of potential person-to-person edges while keeping named relationships persistent/queryable? | PRD-03/04/06/07 |
| **UNK-SOC-002** | What evidence/memory compaction policy preserves socially meaningful history without unbounded per-person event logs? | PRD-04/06/07 |
| **UNK-SOC-003** | How large can a conversation context/read model become before live revalidation and multiplayer privacy filtering become too expensive? | PRD-03/06/07 |
| **UNK-SOC-004** | What proposition/knowledge graph representation supports truth revisions, contradictory claims, rumours and provenance at civilisation scale? | PRD-03/04/06/07 |
| **UNK-SOC-005** | How should rumour propagation be aggregated at distance while preserving source provenance and preventing omniscient promotion? | PRD-04/06/07 |
| **UNK-SOC-006** | What concurrency policy resolves two players attempting incompatible companion/relationship/negotiation commands at the same revision? | PRD-04/06/07 |
| **UNK-SOC-007** | What assignment checkpoint cadence gives believable off-screen delegation without becoming a second simulation of every owning domain? | PRD-04/06/07 |
| **UNK-SOC-008** | If runtime AI dialogue is eventually enabled, what local/remote provider architecture, latency budget, safety gate and privacy boundary satisfy 28H without making gameplay depend on it? | PRD-03/04/06/07; future product decision |
| **UNK-SOC-009** | What semantic-intent parser/fallback UX is needed if player free-text dialogue is enabled? | PRD-07 |
| **UNK-BIO-003** | What biological scheduler cadence/event-wheel structure efficiently supports active actors, cohorts, treatments, disease milestones and catch-up? | PRD-03/04/06/07 |
| **UNK-BIO-004** | What exact cohort grouping/splitting rules preserve named cases, profile compatibility and outbreak/resource consequences at city scale? | PRD-04/06/07 |
| **UNK-BIO-005** | What disease exposure/transmission aggregation model remains deterministic and causal without pairwise contact simulation? | PRD-03/04/06/07 |
| **UNK-BIO-006** | How are treatment reservations and multi-step procedures made atomic with external inventory, provider and facility owners? | PRD-04/06/07 |
| **UNK-BIO-007** | What compact representation stores injuries/disease/toxin/treatment history while retaining enough evidence for UI, quests and migration? | PRD-04/06/07 |
| **UNK-BIO-008** | How should Biological Profile overlays be ordered/composed when ancestry, equipment, magic, transformation and temporary states interact? | PRD-04/06/07 |
| **UNK-BIO-009** | What server policy should govern disconnected players in persistent worlds across protected-rest, physical-presence and safely-suspended states? | Set31 + PRD-04 |
| **UNK-BIO-010** | Which biological values may be client-predicted safely beyond Stamina/UI trend without increasing exploit/reconciliation complexity? | PRD-04/06/07 |
| **UNK-MOV-003** | What local voxel navigation representation best fits Zylann terrain edits: navmesh, voxel/cell graph, hierarchical hybrid or another structure? | PRD-02/03/04/06/07 |
| **UNK-MOV-004** | What incremental invalidation region/granularity keeps building/mining responsive without rebuilding excessive navigation data? | PRD-02/03/06/07 |
| **UNK-MOV-005** | What hierarchical route/navigation algorithm scales across local voxels, settlement roads, regional routes and realm/provider transitions? | PRD-03/04/06/07 |
| **UNK-MOV-006** | How are doors, ladders, ropes, lifts, mounts, vehicles and aquatic-provider transitions represented in one path query without exploding branching cost? | PRD-03/04/06/07 |
| **UNK-MOV-007** | What reservation/deadlock policy works for narrow voxel spaces, ladders, doors, workstations, rail blocks and dense crowds? | PRD-04/06/07 |
| **UNK-MOV-008** | What stuck-detection thresholds distinguish genuine failure from queues, slow heavy movers, combat holds and intentional waiting? | PRD-06/07 |
| **UNK-MOV-009** | What movement-LOD handoff representation preserves route progress and local re-entry position without visible teleport or impossible geometry? | PRD-04/06/07 |
| **UNK-MOV-010** | What prediction/reconciliation model should be used for player locomotion, mounts, wagons, gliders and guided vehicles under multiplayer latency? | PRD-04/06/07 |
| **UNK-MOV-011** | What exact Set-26 aquatic-provider adapter data is needed so route planning can evaluate water segments without duplicating swim physics? | PRD-04/06/07 |
| **UNK-MOV-012** | Who is the final owner/provider of the terrestrial Environment Movement Field contract XSI-30-004? | PRD-04 / external-owner reconciliation |
| **UNK-AUT-017** | What Automation/Magic readiness adapter satisfies XSI-30-009 for powered/guided transport without letting movement own power/control truth? | PRD-04; automation/magic owners |
| **UNK-SIM-004** | What shared promotion/demotion orchestration can wait for all required domain reconciliations without deadlocking world streaming? | PRD-03/04/06/07 |
| **UNK-SIM-005** | What transition timeouts/recovery policy applies when one domain cannot reconcile during promotion? | PRD-04/06/07 |
| **UNK-MP-009** | What snapshot/revision replication scheme minimises bandwidth while preserving privacy and stale-state protection across all four sets? | PRD-03/04/06/07 |
| **UNK-MP-010** | How are cross-owner atomic actions recovered across server crash/restart when some domain commits before another? | PRD-04/06/07 |
| **UNK-PST-011** | What history/journal compaction rules can discard routine detail while preserving contract, relationship, biological and journey evidence needed by future systems? | PRD-04/06/07 |
| **UNK-UX-014** | How should UI explain cross-owner failures such as 'socially accepted but physically impossible' or 'economically valid but biologically unavailable' without exposing subsystem jargon? | PRD-07 |
| **UNK-PERF-011** | What concrete actor/market/relationship/cohort/path-query budgets define the low-end target for Sets 27–30? | PRD-06/07 |
| **UNK-PERF-012** | What packaged stress scenarios best test combined economy + social + biology + navigation load in a dense settlement? | PRD-06/07 |
| **UNK-DEV-013** | Which exact specialist numeric defaults from Sets 27–30 are balance canon versus prototype/tuning values that may change without an architecture ADR? | PRD-01 final classification; PRD-09 |

# 38. Round-11 Coverage Result

The reconciled Document Sets 27–30 and XSI v1.1 are complete for the **initial PRD-01 extraction baseline**.

Round 11 added **277 unique technical requirements** and **49 explicit unknowns/evidence gaps**.

The strongest cross-system architecture pressure retained is:

- one owner per gameplay truth with revisioned typed snapshots/commands/evidence;
- shared world-time, presence, idempotency and promotion/demotion envelopes without inventing a fifth gameplay owner;
- contextual physical economy with conserved stock, obligations, labour, accounts, trade routes and auditability;
- social truth separated into dialogue, knowledge/belief, directed relationships, influence, companions and delegated intent without duplicating external facts;
- biology as a persistent specialist owner of Health/Stamina/Fatigue/needs/exposure/injury/disease/treatment with cohort LOD and a frozen Survival API;
- movement as authoritative physical execution with mover-specific routes, traversal capabilities, navigation reservations, dynamic-world invalidation and one authoritative transform;
- explicit economy↔social, economy↔biology, economy↔movement, social↔biology, social↔movement, route-truth↔knowledge, biology↔movement and impact↔biology contracts;
- detailed swimming retained in Set 26E behind Set 30's universal `Aquatic` movement facade;
- no side-effecting queries, no hidden duplication of another owner's formula and no abstraction that bypasses local physical truth; and
- multiplayer/save/LOD reconciliation based on stable identity, source revision, idempotent evidence and domain-owned state.

**Authority note:** XSI v1.1 is the final interface authority for conflicts/overlaps between Sets 27–30. Earlier provisional interface names remain historical aliases only where consolidated by the final register.

**Document Sets 27–30 + XSI v1.1 baseline status: COMPLETE for initial PRD-01 extraction.**

The next source family is the **FCC corpus**: FCC-01 plus completed FCC-02/03/04/05/06/08 packages, followed by the active FCC-12 delta track and later FCC-13/14 reconciliation updates.

# 39. Round-12 — FCC Realm Canon, Universal Materials & Active Registry-Binding Delta Extraction

## 39.1 Scope and authority handling

Round 12 extracts implementation-neutral technical capability pressure from the locked **FCC-01 Overworld**, the completed realm-local **FCC-02/03/04/05/06/08** packages, the now-current locked **FCC-12 material ontology**, and the currently available **FCC-13 Step 1A** registry-binding preparation.

Authority treatment:
- FCC-01 is consumed from its zero-hold locked package.
- FCC-02/03/04/05/06/08 are consumed as completed realm-local content canon pending final global reconciliation.
- No FCC-07 requirement is invented from the numbering gap.
- Current FCC-13 Step 1A identifies FCC-12 as its locked predecessor and places the FCC-12 Final Fidelity Audit/Canon Lock at the top of material-semantic authority; PRD-01 therefore treats the FCC-12 ontology as the current locked semantic input.
- FCC-13 Step 1A is **source-reconciliation / registry-binding preparation**, not final registry canon. Only already-authoritative binding obligations are extracted here; later FCC-13 steps remain a controlled delta source.
- FCC-14 is still a downstream certification dependency and cannot be guessed here.
- Raw named content is not copied into PRD-01 unless it creates a distinct runtime, worldgen, persistence, simulation, interface or tooling obligation.

## 39.2 New requirements

| ID | Normative requirement | Primary source(s) | Classification / downstream |
|---|---|---|---|
| **REQ-GOV-054** | FCC technical extraction must consume the latest scope owner without reopening locked realm/content decisions merely because older Atlas/Foundation wording differs. | FCC-01J v0.3; realm FCC J documents; FCC-13 Step 1A | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-GOV-055** | The current active FCC realm set is FCC-01/02/03/04/05/06/08; the FCC-07 numbering gap is not itself a missing runtime requirement. | FCC-13 Step 1A authority scope; PRD-00 | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-GOV-056** | Current FCC-13 Step 1A explicitly treats FCC-12 as CONTENT CANON LOCKED and places the FCC-12 Final Fidelity Audit/Canon Lock above FCC-12D/A–C in semantic authority. | FCC-13 Step 1A §§1–3 | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-GOV-057** | FCC-13 may bind IDs/rows/recipes/migrations to FCC-12 semantics but may not silently redefine material ontology, shared/non-shared identity, lineages, state rules or provider doctrine. | FCC-12D; FCC-13 Step 1A | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-GOV-058** | FCC-14 remains the final project-wide cross-realm certification owner; PRD/LFE freeze must accept a later controlled delta from FCC-14 rather than assuming its result in advance. | FCC-12D; FCC-01J | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-REALM-038** | Each current major realm must exist as a persistent world/realm instance with its own ecology, societies, resources, structures, sites, hazards and long-term state rather than as a biome, temporary event map or themed reskin. | FCC-02A; FCC-03A; FCC-04A/J; FCC-05J; FCC-06A; FCC-08 | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-REALM-039** | Each current major realm has one canonical normal external portal family: Covenant Portal, Veilgate, Dreamgate, Ascension Gate, Deepgate and Ashgate. | FCC-01J v0.3 §5; realm FCCs | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-REALM-040** | Resonance, dreams, death, memory, roots, local gates, deep caves, floating terrain, ash/volcanism and other thematic similarities must not become undeclared alternate inter-realm travel. | FCC-01B/I2; FCC-02A/I; FCC-03A/I; FCC-04J; FCC-06; FCC-08 | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-REALM-041** | Portal clues, knowledge, permissions, keystones, stabilisation and intra-realm routes may support access without becoming second normal portal families. | FCC-02A; FCC-01I2; realm FCCs | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-REALM-042** | Realm-specific portal geometry must be supported while universal linking/transition/authority behaviour remains shared. | FCC-02A §7.2; realm portal contracts | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-REALM-043** | First-access portal progression must be non-circular: a realm cannot require destination-native inaccessible material as the sole way to obtain first normal access. | FCC-02A §7.2–7.3; FCC-06G; FCC-13 Step 1A | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-REALM-044** | Portal arrival must resolve to a valid authored risk/safety envelope rather than arbitrary unavoidable lethal terrain. | FCC-02A §§7,20; FCC-05 arrival rules; realm FCCs | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-REALM-045** | A realm may have unusual topology—vertical, layered, folded, non-Euclidean/networked or stratum-based—without forcing all realms into one Euclidean terrain model. | FCC-04A/J; FCC-05; FCC-06A/B; FCC-08B | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-REALM-046** | Somnolent Dream Network adjacency/coherence must be persistent/deterministic and must not require unrestricted expectation-driven world editing. | FCC-04A/J | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-REALM-047** | Impossible Deep pressure, gravity/orientation, folded-distance and deep-route behaviour must be explicit realm/region law/context rather than universal cave behaviour. | FCC-06A/B | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-REALM-048** | Ashen nine-stratum topology must be representable independently from biome, territory, site and temporary environmental state. | FCC-08B | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-REALM-049** | Ascendant vertical altitude-band/topology state must support persistent routes, settlements, ecology and hazards across a continuous inhabitable realm. | FCC-05B/J | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-REALM-050** | Verdant seasonal, identity, covenant, hospitality, resonance and living-territory laws must be implemented through bounded explicit gameplay state rather than unrestricted natural-language or mood-driven rule generation. | FCC-02A §§5–6 | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-REALM-051** | Realm laws may affect local permissions/environment/content but cannot silently seize universal ownership of death/respawn, personhood, inventory, movement, contracts or other global systems. | FCC-02J; FCC-03A; FCC-04J; FCC-05J; FCC-06; FCC-08 | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-REALM-052** | Knowledge/information may cross realm boundaries without implying physical matter transfer; physical matter requires legitimate transfer through owning realm-access mechanics. | FCC-01I2 | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-REALM-053** | Cross-realm transfer must preserve personhood, material identity, relevant provenance, ownership and contained matter. | FCC-01I2; FCC-12C | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-REALM-054** | Realm-specific physical/magical law does not automatically spread into a destination realm merely because an exported object or person arrived. | FCC-01I2; FCC-12C | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-REALM-055** | Environmental resemblance is neither realm provenance nor portal evidence; Overworld/dependent systems must represent provenance explicitly. | FCC-01B; FCC-01I2 | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-REALM-056** | Cross-realm event consequences must be applied through explicit receiving-realm/system interfaces rather than one realm directly rewriting another realm’s internal state. | FCC-01I2; realm I documents | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-REALM-057** | Cross-realm organism movement must distinguish imported, cultivated/contained, naturalised and invasive ecological status without rewriting origin provenance. | FCC-01D/I2; FCC-12C §§27–30 | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-REALM-058** | Realm access and return must support recovery/safe-return handling compatible with universal death and realm-transition authority. | FCC-01A/I2; realm A/G/J documents | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-REALM-059** | Non-mandatory-kill authority outcomes must be representable where realm canon permits political, cleansing, freeing, assisting or other resolution paths. | FCC-02A/J; FCC-05J; FCC-06; FCC-08 | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-REALM-060** | Realm authority/boss outcome must update persistent realm/world aftermath without forcing kill-only progression or resetting the realm on unload. | Realm H/I/J documents | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-REALM-061** | Realm content completeness and implementation maturity remain separate: a content-complete realm can still require technical prototypes, registries, art and performance evidence. | FCC realm J documents; PRD-00 maturity rule | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-WLD-013** | The Overworld must support Minecraft-scale default exploration extent through streamed/procedural world representation rather than a fixed POC valley/map. | FCC-01A/J | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-WLD-014** | Overworld environmental authoring must support World → Continent/Macro-region → Region → Terrain/Hydrological Province → Biome/Environmental Context → Local Feature/Site/Settlement relationships. | FCC-01B §4 | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-WLD-015** | Regions must be able to contain multiple biome mosaics/ecotones while retaining coherent landform, watershed, geology, route, history, civilisation and magical identity. | FCC-01B §4 | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-WLD-016** | Climate fields, watersheds/ocean basins, altitude/sky volumes, subterranean topology, geology, history, magic, dynamic states and civilisation/ownership overlays must coexist without requiring one-to-one records. | FCC-01B §4 | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-WLD-017** | The Deep Overworld is finite Overworld geography and cannot accidentally become portal-free physical passage into the Impossible Deep realm. | FCC-01A/B; FCC-06 | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-WLD-018** | Significant environmental outcomes such as fire, flood, extraction, pollution, settlement, war, restoration and magical change must persist as world memory/state. | FCC-01B | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-WGEN-066** | World/realm generation must place realm-specific topology and content through deterministic seeded rules while preserving realm-local completeness/progression constraints. | FCC-01A/B; FCC-02B/J; FCC-04B/J; realm FCCs | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-WGEN-067** | Verdant seasonal/environmental state generation must be serialisable/deterministic and low-end fallbacks must preserve progression/realm identity. | FCC-02B | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-WGEN-068** | Somnolent coherence/expectation-derived state must be bounded and deterministic/save-safe rather than dependent on nondeterministic free-form runtime interpretation. | FCC-04A/B/J | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-WGEN-069** | Realm first-arrival generation must provide viable destination context under the portal’s authored risk tier and cannot rely on fixed POC coordinates. | Realm A/G/J documents | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-WGEN-070** | Realm-specific biome/region variation may be broad while gameplay-bearing canonical family counts remain bounded and do not require a new registry definition for every cosmetic/procedural variant. | FCC-02D/E/J; FCC-01J | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-WGEN-071** | Generation validation must preserve capability reachability under realm material/provider substitutions and must not assume one realm-tier ladder. | FCC-01A/I2; FCC-12C | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-SIM-021** | Performance/Simulation Depth may reduce active actors, particles, update cadence and local detail but must not change canon existence, conservation, ownership, personhood, portal/progression outcomes or persistent aftermath. | Realm J/I documents; FCC-02I/J | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-SIM-022** | Realm environmental/state systems must support local entity/site/settlement/region/realm summary scales with deterministic rehydration. | FCC-02I §101; realm I documents | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-SIM-023** | Natural/ecological/magical realm-state propagation must use bounded profiles rather than continuous full-realm per-entity simulation. | FCC-02I; FCC-03/04/05/06/08 state docs | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-SIM-024** | Memory, expectation, prophecy, resonance and similar high-concept realm mechanics must be represented through bounded explicit records/events rather than unbounded global mental-state simulation. | FCC-03A/I; FCC-04A/I | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-SIM-025** | A realm state restored/cleansed at distance must reconcile to the same persistent aftermath when promoted to local simulation. | Realm I/J documents | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-ECO-049** | Realm creature rosters must function as ecology rather than themed enemy spawn tables, with trophic/resource/habitat/migration roles and non-combat relevance where authored. | FCC-02E; FCC-03/04/05/06/08 E documents | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-ECO-050** | Season/health/age/region/blight/corruption and other bounded creature variants do not automatically require separate creature definitions. | FCC-02E | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-ECO-051** | Creature populations cannot respawn independently of habitat/world state merely because a region unloads/reloads. | FCC-02E | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-ECO-052** | Imported organisms must be evaluated against destination environmental suitability; material exportability does not imply organism transplantation success. | FCC-01D/I2; FCC-12C §§27–30 | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-ECO-053** | Natural rot/decomposition, ecological blight/dysfunction and Void corruption must remain separate ecological/state concepts where Verdant interfaces consume them. | FCC-02I/J | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-ECO-054** | Healthy decay-associated organisms/regions cannot be classified as corrupted or evil merely by rot/decomposition association. | FCC-02I/J | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-ECO-055** | Cross-realm ecology must preserve provenance and distinguish resonance/similarity from actual migrated/native ecology. | FCC-01I2; realm I documents | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-CIV-050** | Realm societies must support multiple cultures/polities/factions/settlements and cannot be reduced to one realm-wide race or faction. | FCC-02A/F/J; FCC-03/04/05/06/08 F documents | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-CIV-051** | Realm origin, body/ancestry, culture, faction, citizenship, profession and political alignment must remain separable identity axes. | Realm F/J documents; FCC-01F | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-CIV-052** | Living, spirit-associated, dream-associated, divine, infernal, undead-adjacent or other unusual beings must retain personhood according to universal personhood rules rather than realm stereotype. | FCC-01E/F/I2; FCC-03/04/05/08 | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-CIV-053** | Realm settlements must satisfy real environmental/support/logistics needs using universal civilisation/service systems adapted to local laws and ecology. | Realm F documents | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-CIV-054** | Living infrastructure may provide real services but must expose bounded capacities/requirements rather than free capacity because it is biological/magical. | FCC-02A/F | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-CIV-055** | Cross-realm migrants/diasporas retain identity/history/personhood and do not become destination-native by simple presence. | FCC-01I2 | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-STR-041** | Realm structures/sites must consume shared structure/Blueprint/project ownership while expressing realm-specific materials, laws, hazards, routes and state overlays. | Realm F/G/H documents | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-STR-042** | Portal infrastructure must be a persistent physical construct with realm-specific components/geometry and universal transition ownership. | Realm G documents; FCC-13 Step 1A | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-STR-043** | Dungeon/site state must support persistent restoration, occupation, repurposing, corruption/cleansing and authority aftermath rather than reset-on-reload content. | Realm H/I/J documents | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-STR-044** | Realm-local resonance routes, Rootways, Dreaming Bridges, Descent Thresholds and similar internal transport cannot silently become external realm portals. | FCC-02A/F; FCC-04; FCC-08 | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-CMB-060** | Realm guardians/authorities may be creatures, persons, offices, constructs, institutions or other authored authority roles; title alone must not imply one combatant implementation class. | Realm H/J documents | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-CMB-061** | Encounter resolution must be able to emit political/ecological/restoration/access/world-state outcomes independently of kill state where canon supports alternatives. | FCC-02J; FCC-05J; FCC-06; FCC-08 | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-CMB-062** | Realm combat/encounter content cannot redefine universal death, Health, movement or combat ownership merely because a realm has special hazards/laws. | Realm A/H/I/J documents | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-QST-046** | Ancestral historical/memory reconstruction must preserve provenance/confidence and cannot automatically be treated as objective original-person testimony. | FCC-03A/I | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-QST-047** | No automatic one-to-one spirit or memory copy may be generated for every death merely because Ancestral content exists. | FCC-03A/I | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-QST-048** | Somnolent prophecy must be conditional/probabilistic information rather than guaranteed future truth written directly into world state. | FCC-04A/J | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-QST-049** | Cross-realm research/discovery may reveal clues and knowledge without granting physical access or rewriting destination realm truth. | FCC-01G2/I2 | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-QST-050** | Restoration/cleansing may change current state without rewinding historical consequences; history must preserve what occurred. | FCC-02I; FCC-03/04/05/06/08 I documents | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-MAG-037** | Natural nightmare/dream phenomena, divine hostility, ecological blight and other dark-looking states must remain distinct from actual Void corruption unless authoritative provenance links them. | FCC-01B/I2; FCC-02I; FCC-04I/J; FCC-05J | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-MAG-038** | Void corruption should default to persistent state/contamination where underlying identity remains intact and become a new definition only after the universal transformation threshold is crossed. | FCC-02I; FCC-12A/D | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-MAG-039** | Verdant Covenant/promises/identity/threshold effects require explicit recognised state and cannot parse arbitrary player/NPC language into binding magic. | FCC-02A | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-MAG-040** | Somnolent expectation/coherence mechanics may influence bounded authored state but cannot provide unrestricted thought-to-world mutation. | FCC-04A/J | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-MAG-041** | Realm-specific magical support such as coherence, sacred-law, contract or seasonal conditions must be represented as actual support requirements/capabilities rather than hardcoded realm-name enable flags. | FCC-12C | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-ID-052** | Material identity, superclass, physical form, phase, state/condition, facies, quality, grade, purity, charge, affinity, contamination, provenance, ownership, location and processing history must remain separate semantic axes. | FCC-12A §§2–3 | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-ID-053** | One material identity may exist across many forms/states/realms/owners without generating duplicate material definitions unless the transformation threshold is crossed. | FCC-12A | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-ID-054** | Physically/intrinsically equivalent ordinary matter shared across realms must use one canonical identity with provenance/location separated. | FCC-12A §9; FCC-12D | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-ID-055** | Realm-prefixing an ordinary material is not sufficient reason for a new identity. | FCC-12A | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-ID-056** | Superclass membership never implies exact-material equivalence; specialist sibling materials may share a class and remain distinct. | FCC-12A §§5–6 | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-ID-057** | A reversible charge, environmental conditioning, ordinary damage, ownership, location or provenance change defaults to state/metadata rather than new material identity. | FCC-12A | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-ID-058** | A new transformed material identity is justified only when composition, persistent structure or intrinsic behaviour changes enough to constitute genuinely different matter. | FCC-12A; FCC-12D | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-ID-059** | Material quality is multidimensional; purity, structural quality, composition/grade, condition, charge, attunement, contamination and provenance cannot be collapsed into one universal rarity/star tier. | FCC-12A Q95–Q102 | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-ID-060** | Rarity is not quality and charge is not quality. | FCC-12A Q98–Q99 | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-ID-061** | Containers/components remain object identities separate from contained material identity. | FCC-12A/D | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-ID-062** | Material-related registry records must distinguish exact material, superclass, form, state, facies, provenance, quality/composition, transformed material, manufactured component, provider class, aliases/legacy terms and rejected generic identities. | FCC-12D §2 | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-ID-063** | Broad terms such as sand/gravel/lava/clay may represent form/composition families and cannot be forced into one compositionless exact material row. | FCC-12A §9–10 | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-ID-064** | Generated/inherited standard forms require stable semantic binding without creating one independent material identity per material×shape combination. | FCC-12B; FCC-13 Step 1A | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-ID-065** | Stable content IDs must remain independent of display text, legacy engine path, old texture index and order-sensitive numeric registry position. | FCC-13 Step 1A §§11–17 | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-ID-066** | Durable identity must conceptually distinguish Material ID, reusable Form/Product Archetype, Canonical Content Object ID and Runtime Instance State even if runtime registries optimise their storage. | FCC-13 Step 1A §10 | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-ID-067** | Legacy Block/Item duplicate rows are migration evidence and must be resolved by physical semantics, not preserved merely because two old rows exist. | FCC-13 Step 1A §§7–9 | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-ID-068** | POC numeric IDs may be compact runtime bindings but cannot be assumed to be durable canonical identity. | FCC-13 Step 1A §12 | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-ID-069** | Legacy original IDs may become migration aliases only when safe; an obsolete identifier is not automatically the new canonical ID. | FCC-13 Step 1A §13 | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-ID-070** | POC test-only/archive concepts must remain isolated from normal canonical registry selection/generation. | FCC-13 Step 1A; PRD-00 | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-PROD-030** | Regular derived forms must use reusable form templates plus material eligibility, with specialist geometry/behaviour explicitly authored where necessary. | FCC-12B/D | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-PROD-031** | Not every material may instantiate every standard form; form eligibility must be explicit and physically/gameplay meaningful. | FCC-12B/D | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-PROD-032** | Processes must declare material/form inputs, capabilities/conditions, outputs, states, conservation, hazards and specialist modes instead of encoding one bespoke process per realm/material. | FCC-12B/D | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-PROD-033** | Named stations are capability providers/bundles and cannot become arbitrary exclusive gates when another provider satisfies the same required process capabilities. | FCC-12B/D | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-PROD-034** | Realm-special processing normally composes universal process family plus specialist support/environment rather than defining a parallel realm-specific copy of the process. | FCC-12B/D | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-PROD-035** | Physical processing must conserve meaningful stock and explicitly account for outputs, by-products, waste, offcuts, scrap, emissions and authored loss. | FCC-12B/D | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-PROD-036** | Mixed scrap requires valid sorting/separation/refining and cannot be magically converted to arbitrary pure inputs. | FCC-12B/C/D | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-PROD-037** | Automation must obey the same material/form/provider/exact-material/reservation rules as manual processing. | FCC-12B/C | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-PROD-038** | Exact-material requirements take priority when identity, chemistry, provenance or unique magical function is the authored mechanic. | FCC-12C §§73–75; FCC-12D §23 | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-PROD-039** | Capability/provider requirements should accept any eligible material meeting the required form/state/capability/quality/environment/provenance constraints. | FCC-12C §§73–75 | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-PROD-040** | Provider equivalence must not merge material identities or imply identical performance; valid alternatives may carry weight, brittleness, corrosion, cost, maintenance or magical trade-offs. | FCC-12C §§76–77 | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-PROD-041** | Provider queries conceptually evaluate exact/category eligibility, form, state, capability threshold, quality/purity threshold, environment compatibility and provenance where required. | FCC-12C §73 | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-PROD-042** | Knowledge/research, legal restrictions, certification and cultural preference may restrict use without changing the material’s physical identity/capability truth. | FCC-12C §§81–88 | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-PROD-043** | Material storage/transport eligibility must be able to depend on temperature, pressure, humidity, shielding, segregation, ventilation, seal, mass, volume, fragility and hazard properties. | FCC-12C §§89–93 | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-PROD-044** | Portal transit preserves relevant material identity/state/provenance/ownership/contents and does not automatically stabilise, cleanse, recharge or make hazardous material safe. | FCC-12C §§93–94 | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-PROD-045** | Cross-realm processing is valid when real process/support/knowledge/safety/law/energy requirements are met; realm origin alone cannot invalidate an otherwise valid process. | FCC-12C §35+ | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-PROD-046** | There is no universal realm stabiliser; support is requirement-driven and may include pressure, atmosphere, temperature, mana, coherence, law, contract, shielding, cooling or containment. | FCC-12C §§9–15 | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-PROD-047** | Material stabilisation/dormancy/weakening normally changes support state/function, not material identity. | FCC-12C §§5–15 | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-PROD-048** | Hazardous exports remain hazardous and containment failure must produce authored physical/magical consequences rather than silent deletion for convenience. | FCC-12C §§31–34 | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-PROD-049** | FCC-13 must bind exact Block/Item/form/recipe/quantity/station/provider/portal-component/portal-recipe/alias/migration/placement-recovery records from the locked ontology. | FCC-13 Step 1A §§1,18 | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-PROD-050** | The six exact normal portal recipes/components remain FCC-13 binding work and must preserve first-access reachability and realm identity. | FCC-13 Step 1A §§3–4,18 | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-PST-047** | Material provenance must be bounded: preserve history required by gameplay truth while allowing ordinary bulk matter to aggregate irrelevant chain-of-custody detail. | FCC-12A §§12–14 | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-PST-048** | Stack/lot merging is allowed only when required condition/provenance/certification/ownership/contamination/quality metadata can survive correctly. | FCC-12A Q100; FCC-13/technical handoff | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-PST-049** | Transformed outputs acquire new material identity where required while preserving relevant input provenance/history. | FCC-12A §15 | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-PST-050** | Legacy POC registry rows require explicit retain/rebind/merge/split/alias/state/form/component/provenance/reject/defer/contextual migration disposition before canonical binding. | FCC-13 Step 1A migration scope | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-PST-051** | Missing/deprecated saved content must resolve through explicit migration, replacement, salvage, quarantine or incompatibility handling rather than nearest-name guessing/reinterpretation. | FCC-13 Step 1A; Set 25 persistence rules | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-PST-052** | Generated standard-form bindings must remain stable enough that save references do not change merely because the Forge/baker reorganises output. | FCC-12B; FCC-13 Step 1A | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-FORGE-060** | The Forge must be able to author material definitions, material properties, allowed-form profiles, specialist forms, process eligibility, transformations, station capabilities, state visuals and component composition. | FCC-12B §191 | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-FORGE-061** | The Forge must support exact-material locks, provider requirements, substitute profiles, environmental/support dependencies and hazard metadata. | FCC-12C §206 | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-FORGE-062** | Blueprint/material authoring must support selected-material visual inheritance and material+form composition without duplicating material identity. | FCC-12B/C | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-FORGE-063** | Forge validation must test imported specialist materials against support, containment, process and substitute constraints rather than realm-name allowlists. | FCC-12C | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-FORGE-064** | FCC-13 binding tooling must support materials/forms/non-cubic Blocks/construction pieces/Items/machines/sockets/ports/pivots/moving parts/state visuals/recipes/provider constraints/icons while preserving owning semantics. | FCC-13 Step 1A downstream handoff | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-FORGE-065** | A dedicated pre-architecture Special Mechanics & Unique Physical Content Register must inventory weird committed mechanics such as chutes, hoppers, belts, pipes, pumps, gutters, ward networks, rune controllers, pressure systems, unusual vessels, settlement endpoints, special machines, portal infrastructure, creature-specific interactions and special construction/terrain tools. | FCC-01J §18 | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-UX-072** | Material UI must expose only task-relevant dimensions and distinguish exact-material requirements, provider classes, valid alternatives, unmet capability and state/quality requirements without relying on one rarity colour/star score. | FCC-12A Q101; FCC-12C §78 | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-UX-073** | Identification UI must permit unknown/partial/misclassified material knowledge while objective material properties remain stable underneath. | FCC-12C §§87–88 | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-UX-074** | Cross-realm UI must distinguish provenance, support/dormancy/hazard state and legal/research restrictions from material identity. | FCC-12C | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-UX-075** | Portal/discovery UI must distinguish clues/knowledge/permissions from actual physical access so thematic resonance does not look like an undocumented travel route. | FCC-01G2/I2; realm A/J documents | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-PERF-035** | Realm-specific simulation scaling must reduce representation detail, not alter locked content, progression, personhood, conservation, portal identity or persistent outcome state. | FCC-02I/J; realm J documents | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-PERF-036** | Large realm ecology/state systems must support aggregate off-screen updates and deterministic rehydration rather than continuous simulation of every organism/state source. | FCC-02E/I; realm E/I documents | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-PERF-037** | Material/form inheritance must avoid material×shape×state×realm registry/asset explosion. | FCC-12A/B/D | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-PERF-038** | Capability/provider queries and support-state evaluation must be indexable/bounded enough for automation, settlements, Blueprints and bulk processing rather than scanning the entire material registry per operation. | FCC-12C downstream implications | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-DEV-047** | PRD-01 must retain a controlled delta obligation for FCC-13 as Steps 1B onward settle definitive rows/IDs/recipes/provider bindings/migration and portal recipes. | FCC-13 Step 1A status | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-DEV-048** | PRD-01/PRD-09 must retain a controlled delta obligation for FCC-14 final cross-realm certification/art handoff before final LFE/FORGE-ENG freeze. | FCC-01J; FCC-12D | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-DEV-049** | Realm/FCC test suites must verify no portal bypass, no state-definition explosion, no provenance loss, deterministic off-screen state and authority/persistence boundaries. | Realm I/J validation requirements | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-DEV-050** | FCC-13 migration validation must compare every legacy registry row against current semantic ownership rather than bulk-promoting the old registry. | FCC-13 Step 1A §§5–9 | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |
| **REQ-DEV-051** | The Special Mechanics & Unique Physical Content Register must reach coverage closure before rebuild architecture freeze so uncommon committed mechanics cannot disappear during abstraction/deduplication. | FCC-01J §18 | FCC-derived design/interface/data constraint → PRD-02/03/04/06/07/09; LFE/FORGE-ENG as applicable |

# 40. Round-12 Explicit Unknowns / Evidence Gaps

| ID | Unknown / evidence gap | Required downstream |
|---|---|---|
| **UNK-REALM-014** | What generic realm-instance/law-profile representation supports ordinary, vertical, non-Euclidean, folded/gravity-oriented and stratum-based realm topologies without hardcoding every realm? | PRD-03/04/06/07 |
| **UNK-REALM-015** | What portal-transition transaction and arrival-validation architecture satisfies all six portal families while preserving realm-specific geometry/components? | PRD-03/04/06/07; FCC-13 delta |
| **UNK-REALM-016** | How should realm-law/support snapshots be versioned so specialist systems can query pressure/coherence/sacred-law/contract conditions without realm-name branches? | PRD-03/04/06/07 |
| **UNK-REALM-017** | What explicit cross-realm event-transfer protocol prevents one realm from mutating another realm owner directly? | PRD-04/06/07 |
| **UNK-REALM-018** | How are realm routes/instances mapped to server shards/streaming worlds when several realms have active players simultaneously? | PRD-03/04/06/07 |
| **UNK-WGEN-019** | What technical topology representation supports Somnolent non-Euclidean Dream Network adjacency while remaining deterministic, navigable and save-compatible? | PRD-03/04/06/07 |
| **UNK-WGEN-020** | What coordinate/orientation scheme supports Impossible Deep gravity reorientation/folded topology without destabilising voxel editing, movement or saves? | PRD-02/03/04/06/07 |
| **UNK-WGEN-021** | How should nine-stratum Ashen topology and Ascendant altitude bands map to streamed voxel regions/chunks while remaining semantic world layers? | PRD-02/03/04/06/07 |
| **UNK-SIM-006** | What bounded state solver/update model implements Verdant resonance/seasonal state and Somnolent coherence/expectation without global per-actor scans? | PRD-03/04/06/07 |
| **UNK-SIM-007** | What generic off-screen realm-state aggregation contract preserves restoration/corruption/history outcomes across all six realms? | PRD-04/06/07 |
| **UNK-ECO-014** | What cross-realm organism suitability/naturalisation/invasive model is sufficient without simulating full ecosystems for every transported organism? | PRD-04/06/07 |
| **UNK-ECO-015** | How are realm-specific ecology cohorts represented when migration crosses portal/realm boundaries? | PRD-04/06/07 |
| **UNK-QST-015** | What provenance/evidence representation distinguishes Ancestral reconstruction, Somnolent prophecy, rumours and objective history without duplicating the global knowledge/history systems? | PRD-04/06/07 |
| **UNK-MAG-011** | What universal corruption-state interface allows Verdant/Somnolent/Ascendant/etc. to consume genuine Void provenance while keeping natural blight/nightmare/divine hostility distinct? | PRD-04/06/07 |
| **UNK-ID-012** | What concrete data schema implements FCC-12 material identity + form + state + provenance + multidimensional quality without registry or stack explosion? | PRD-03/04/06/07; FCC-13 delta |
| **UNK-ID-013** | What stable-ID strategy should FCC-13 use for generated standard forms so future form-template/baker changes do not break saves? | FCC-13 + PRD-03/04/06/07 |
| **UNK-ID-014** | How should material/form/content-object/runtime-instance namespaces relate to Set-25 qualified IDs without creating redundant registries? | FCC-13 + PRD-04 |
| **UNK-ID-015** | What exact rule determines when small alloy/formulation differences remain grade/composition metadata versus distinct material identities in implementation? | FCC-13/content calibration + PRD-04 |
| **UNK-PROD-010** | What provider-tag/capability schema and indexed query structure should implement FCC-12 exact-material vs capability substitution? | FCC-13 + PRD-03/04/06/07 |
| **UNK-PROD-011** | How are multidimensional quality/purity/composition/state/provenance constraints represented in inventory lots and recipe matching efficiently? | FCC-13 + PRD-03/04/06/07 |
| **UNK-PROD-012** | What support-state scheduler updates dormant/weakened/unstable specialist materials without ticking every item/container continuously? | PRD-03/04/06/07 |
| **UNK-PROD-013** | How are hazardous storage/transport compatibility checks cached/incrementally invalidated across warehouses, vehicles and portals? | PRD-03/04/06/07 |
| **UNK-PROD-014** | What exact six portal component/recipe bindings and dependency ordering will FCC-13 lock, and do they create any new reachability constraints? | FCC-13 controlled delta |
| **UNK-PST-012** | How much material provenance/processing history is retained for bulk stacks versus regulated/sacred/relic/contract goods? | PRD-04/06/07; FCC-13 |
| **UNK-PST-013** | What migration/quarantine plan maps all 312 legacy VoxelRegistry rows into FCC-13 final identities without data loss or accidental canon revival? | FCC-13 + PRD-03/04/06/07 |
| **UNK-PST-014** | How are old numeric voxel IDs translated to durable semantic IDs while keeping chunk/save storage compact? | FCC-13 + PRD-02/03/04/06/07 |
| **UNK-FORGE-020** | What Forge data model/editor UX can author material axes, form eligibility, provider queries, transformation lineages and support/hazard rules without overwhelming ordinary asset workflows? | FORGE-ENG; PRD-07 |
| **UNK-FORGE-021** | Which standard material×form combinations should be generated automatically versus explicitly authored as specialist geometry? | FCC-13/FORGE-ENG; PRD-07 |
| **UNK-FORGE-022** | What imported-material Test Laboratory scenarios are required to certify support/dormancy/containment/substitution across realms? | PRD-06/07; FORGE-ENG |
| **UNK-PERF-013** | What realm-specific stress scenarios prove identical authoritative outcomes across low/medium/high simulation profiles? | PRD-06/07 |
| **UNK-PERF-014** | What upper bounds are needed for provider-query count, material lots, state overlays and realm-state propagation in settlement/factory-scale play? | PRD-06/07 |
| **UNK-DEV-014** | What exact Special Mechanics & Unique Physical Content Register format/coverage method will prove every unusual committed mechanic survived PRD-01 deduplication? | PRD-01 closure / PRD-06 |
| **UNK-DEV-015** | Which FCC-13 steps beyond 1A will exist, and at what point is its definitive registry stable enough for the final PRD-01 delta/freeze? | FCC-13 current work |
| **UNK-DEV-016** | When FCC-14 becomes available, what PRD-01 sections must be re-audited for final cross-realm conflicts rather than blindly appended? | FCC-14 controlled delta |
| **UNK-MP-011** | What cross-realm multiplayer transition/reconnect state is required when a player reconnects into a realm whose specialist support/content pack is not currently loaded locally? | PRD-04/06/07; Set31 |
| **UNK-UX-015** | How should material substitution/support/hazard UI explain why an apparently stronger material is invalid or legal/knowledge-restricted without exposing raw registry internals? | PRD-07 |
| **UNK-UX-016** | How should realm-discovery UI distinguish thematic resonance/clues from actual portal access and provenance with minimal spoiler leakage? | PRD-07 |

# 41. Round-12 Coverage Result

The currently available FCC technical-capability baseline is complete for **PRD-01 initial extraction**.

Round 12 added **141 unique technical requirements** and **37 explicit unknowns/evidence gaps**.

The strongest FCC-derived constraints retained are:

- a coherent Minecraft-scale Overworld plus six current persistent major realms with one canonical normal portal family each;
- support for realm topologies that may be ordinary, vertical, non-Euclidean, folded/gravity-oriented or stratum-based;
- explicit bounded realm laws/states rather than free-form natural-language or unbounded mental-state world rewriting;
- cross-realm knowledge, matter, people, ecology, provenance and event consequences flowing through owned interfaces rather than realm-system collapse;
- realm ecology/civilisation/sites/authorities as persistent systems rather than themed spawn/loot layers;
- low-end simulation reducing representation rather than canon/progression/personhood/conservation;
- FCC-12's material ontology separating identity, form, state, facies, provenance, quality/composition, transformed material, components and provider roles;
- reusable form inheritance and capability-driven processing that prevents material×shape×state×realm and station/process explosion;
- off-realm material identity persistence with explicit support/dormancy/hazard/containment instead of realm-name lockouts;
- exact-material requirements versus capability/provider substitution with real trade-offs and knowledge/legal/cultural constraints kept separate;
- current FCC-13 binding obligations for stable IDs, definitive Block/Item/form rows, recipes/quantities, providers, six portal recipes and migration; and
- an explicit Special Mechanics & Unique Physical Content coverage gate before architecture freeze.

**Historical Round-12 delta state (superseded by Round 14):** at the time of Round 12, FCC-13 Step 1A was the latest consumed source. Round 14 records the completed FCC-13 canon lock and current FCC-14 certification progress.

**FCC initial technical-capability baseline status: COMPLETE.**

The next primary source family is **Recovered Planning + Future Production Constraints (Project Optimisation Discussion, Post-30 roadmap Sets 31–42 and the 43+ Future Expansion Register)**, while FCC-13/14 remain parallel controlled-delta sources.

# 42. Round-13 — Recovered Planning + Future Production Constraint Extraction

## 42.1 Scope and authority handling

Round 13 consumes the recovered **Project Optimisation Discussion** and **Post-30 Doc Set Ideas**.

These sources have two different roles:

- the Project Optimisation Discussion is **recovered pre-rebuild process/evidence guidance**, much of which was already protected by PRD-00 DNL rules; this round adds only material refinements not already captured;
- Sets **31–42** are **Future Production Constraints**. They are not treated as currently implemented/canonical gameplay systems and are not all pre-rebuild blockers, but architecture choices must not make them impossible;
- **43+** remains an intentionally unnumbered **Future Expansion / Stress Horizon**. Its detailed mechanics are not requirements; only extension-pressure is retained.

This round therefore extracts compatibility obligations, not imaginary completed specifications for documents that do not yet exist.
## 42.2 New requirements

| ID | Normative requirement | Primary source(s) | Classification / downstream |
|---|---|---|---|
| **REQ-DEV-052** | The pre-rebuild programme must investigate every major architecture branch before technical canon is considered final rather than treating one successful subsystem demo as proof of the whole game. | Recovered Project Optimisation Discussion pp.2,5–6 | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-DEV-053** | Every uncertain capability must retain an explicit evidence level from P0 Idea through P5 Production Qualified, and the level must describe the exact Leyforge requirement rather than a vaguely related upstream capability. | Recovered Project Optimisation Discussion p.6 | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-DEV-054** | Technology evidence must distinguish user-observed Leyforge tests, upstream demonstrations, reusable built-in capability, reference/demo implementation, Leyforge-owned implementation and unknown/prototype-required behaviour. | Recovered Project Optimisation Discussion pp.1,4 | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-DEV-055** | The Zylann/Voxel Tools ecosystem must be audited as an SDK/component set before architecture ownership is frozen. | Recovered Project Optimisation Discussion pp.2–5 | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-DEV-056** | High-risk engineering unknowns must receive isolated prototypes/benchmarks before being documented as solved architecture. | Recovered Project Optimisation Discussion p.2 | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-DEV-057** | Risk prototypes must include representative hostile cases for moving voxel vessels, blocky far-distance LOD, fluids, dynamic navigation, large coordinates/worlds, cross-chunk megastructures, persistence, simulation LOD, multiplayer authority and Forge/runtime editing where still unresolved. | Recovered Project Optimisation Discussion p.2 | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-DEV-058** | Forge architecture must be redesigned against the proven runtime boundary rather than forcing the runtime to fit untested Forge assumptions. | Recovered Project Optimisation Discussion p.2 | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-DEV-059** | The authoritative data-model pass must keep canonical IDs/records independent of Voxel Tools model IDs, file paths and other implementation identifiers. | Recovered Project Optimisation Discussion p.3 | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-DEV-060** | Performance architecture must establish measurable CPU/GPU/memory/worldgen/streaming/entity/persistence budgets before large-scale gameplay implementation is accepted. | Recovered Project Optimisation Discussion p.3 | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-DEV-061** | Persistence and simulation-scale design must explicitly cover Seed → Base World → Deltas, active/regional/far/dormant state, unload/reload, history, corruption recovery and version migration. | Recovered Project Optimisation Discussion p.3 | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-DEV-062** | Future multiplayer constraints must influence authority, identity, determinism, edits and persistence before full multiplayer implementation. | Recovered Project Optimisation Discussion p.3 | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-DEV-063** | Canonical LFE/FORGE-ENG documents must be written only after the relevant research/prototype decisions exist; they are not the place where risky questions are first discovered. | Recovered Project Optimisation Discussion p.3 | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-DEV-064** | The clean rebuild must proceed in gated foundations-first stages rather than bulk reintroducing all gameplay at once. | Recovered Project Optimisation Discussion p.3 | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-MP-034** | Future Set 31 requires shared-world multiplayer to exercise the same authoritative gameplay systems rather than a parallel multiplayer ruleset. | Future Set 31 — Multiplayer, Networking, Hosting & Shared Worlds | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-MP-035** | The multiplayer architecture must support world-host/server authority for persistent world mutation while permitting bounded client prediction only where reconciliation is defined. | Future Set 31 constraint | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-MP-036** | Shared worlds must support explicit ownership/permission scopes for voxel edits, containers, structures, settlements, projects, companions, vehicles/vessels, contracts, social decisions and administrative actions. | Future Set 31 constraint | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-MP-037** | Join-in-progress must reconstruct authoritative world/player state without replaying already-committed persistent actions. | Future Set 31 constraint | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-MP-038** | Reconnect must preserve player identity, permissions, location/realm context and outstanding authoritative operations rather than treating reconnect as a new actor spawn. | Future Set 31 constraint | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-MP-039** | Multiplayer must support compatibility checks for game version, save schema, gameplay-critical content manifests and required mods/packs before authoritative state is applied. | Future Sets 31,37,39 | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-MP-040** | Network interest/relevance must be spatial/system-aware so clients do not require full world, full economy, full social graph or full distant-simulation replication. | Future Set 31 constraint | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-MP-041** | Persistent commands must support sequencing/idempotency/resync so packet retry/loss cannot duplicate items, voxel edits, payments, treatment, project progress or social consequences. | Future Set 31 constraint | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-MP-042** | Shared-world time/pause rules must be explicit rather than inheriting single-player pause assumptions. | Future Set 31 constraint | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-MP-043** | Multiplayer realm transitions must preserve party/individual destination authority, cargo/vehicle state, arrival validation and reconnect safety. | Future Set 31 + current realm constraints | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-MP-044** | Multiplayer architecture must allow later dedicated-server deployment without rewriting gameplay ownership into a separate server-only ruleset. | Future Sets 31,38 | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-MP-045** | Local/split-screen players and remote players must remain distinct player contexts while sharing the same authoritative world. | Future Set 31 + existing UI constraints | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-PERF-039** | Future Set 32 requires a whole-game hardening pass across the real post-POC systems, including CPU, GPU, memory, loading, network, simulation and worldgen behaviour. | Future Set 32 — Full Human Review, Bug Fixing, Optimisation & Production Hardening | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-PERF-040** | Production hardening must inspect contradictions, duplicate ownership, invalid save assumptions, multiplayer incompatibilities, unnecessary simulation and broken world states in addition to raw performance. | Future Set 32 | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-PERF-041** | Performance baselines must cover slow world loading, chunk generation, NPC AI/navigation, automation, Forge/runtime bottlenecks, registry lookup cost and network inefficiency. | Future Set 32 | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-PERF-042** | Hardening must include exploit/edge-case and player-flow review so technically correct systems that are confusing, abusable or unenjoyable can still fail release gates. | Future Set 32 | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-PERF-043** | Optimisation may change representation/data structures/scheduling but cannot silently change authoritative gameplay semantics to hit a frame budget. | Future Set 32 + DNL-014 | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-FORGE-066** | Future Set 33 requires one Unified Forge architecture while preserving the separation between developer canonical-authority tools and restricted player creator tools. | Future Set 33 — Unified Forge Overhaul, Player Creator Security & Content-Pack Architecture | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-FORGE-067** | Developer builds may retain tools capable of editing canonical definitions; normal player builds must not receive equivalent canonical write authority. | Recovered Post-30 roadmap, Set 33 | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-FORGE-068** | Player-created content must layer above protected base content rather than physically rewriting/removing the canonical base package. | Recovered Post-30 roadmap, Set 33 | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-FORGE-069** | Official base content, official expansions, player content packs and mod/override layers must remain identifiable separately in resolution/provenance. | Future Set 33 | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-FORGE-070** | A player override that radically changes content must still leave the underlying canonical definition/package recoverable. | Recovered Post-30 roadmap, Set 33 | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-FORGE-071** | Player creator exports must pass the same protected-contract validation required for gameplay-critical content before admission to a world/server. | Future Set 33 | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-MOD-001** | Future Set 37 requires the protected content-pack architecture to be exposable as a player-facing mod/community-content ecosystem without granting direct canonical-source ownership. | Future Set 37 — Modding, Workshop & Community Content | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-MOD-002** | Mods/content packs must declare identity, version, dependencies, conflicts/load ordering, compatibility and required/optional status. | Future Set 37 | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-MOD-003** | Multiplayer servers must be able to declare allowed, required and forbidden content packs/mods and verify client matching before join. | Future Sets 37–38 | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-MOD-004** | Data-only player content must remain separated from any later executable-script capability so scripting cannot be smuggled through declarative fields/localisation/source metadata. | Future Set 37 + existing Set-25 security boundary | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-MOD-005** | Player/content-pack namespaces must prevent community content from impersonating official/canonical IDs. | Future Set 37 | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-MOD-006** | Mod removal/update must preserve migration/quarantine semantics for existing world state rather than deleting unknown content silently. | Future Sets 37,39 | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-MOD-007** | Community content sharing must carry provenance/author/version/compatibility information sufficient for diagnostics and moderation. | Future Set 37 | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-MOD-008** | Mod compatibility must be evaluated against gameplay contracts, save schema and world/content manifests rather than filename equality alone. | Future Set 37 | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-CFG-001** | Future Set 34 requires settings to be a typed configuration architecture rather than one unstructured global settings blob. | Future Set 34 — Settings, Controls & Player Configuration | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-CFG-002** | Global/profile settings, realm/world settings and server-authoritative settings must remain separate scopes with explicit precedence and ownership. | Recovered Post-30 roadmap, Sets 34–36 | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-CFG-003** | Settings must distinguish graphics/presentation scalability from authoritative simulation/world configuration. | Future Sets 34–35 | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-CFG-004** | Settings architecture must support graphics, performance, simulation, audio, controls, camera, gameplay, UI, accessibility, multiplayer, notifications and advanced categories without requiring each subsystem to invent its own persistence scheme. | Future Set 34 | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-CFG-005** | Profile-local settings may follow a player across worlds only where they do not alter server/world-authoritative truth. | Future Set 34 | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-CFG-006** | Server/realm settings that affect authoritative outcomes must be recorded with the world/server configuration and exposed to clients readably. | Future Sets 34–35 | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-CFG-007** | Input configuration must be action/semantic-command based so rebinding does not couple gameplay to physical device codes. | Future Set 34 + existing UI/input rules | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-CFG-008** | Settings changes that require restart/world regeneration/server authority must declare that constraint explicitly rather than appearing to apply instantly. | Future Set 34 | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-CFG-009** | Future Set 35 requires Create Realm to configure simulation complexity as a first-class world profile, not merely terrain-generation options. | Future Set 35 — Realm Creation, Simulation Complexity & Hardware Scalability | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-CFG-010** | Create Realm must support a range equivalent to Simple → Extreme while preserving clear semantics about which systems/fidelities/settings change. | Future Set 35 | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-CFG-011** | Civilisation, ecology, economy and other simulation-domain controls must compose through validated profiles rather than arbitrary incompatible toggles. | Future Set 35 | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-CFG-012** | Hardware scalability guidance must treat graphics load and simulation load as distinct dimensions. | Future Set 35 | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-CFG-013** | Create Realm must be able to estimate/recommend hardware suitability or warn about risk without promising guaranteed performance. | Future Set 35 | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-CFG-014** | A world must retain the authoritative simulation/configuration profile needed to reproduce its intended rules after save/load/update/server transfer. | Future Set 35 | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-CFG-015** | Changing simulation complexity after world creation must have explicit compatibility/migration semantics and may not fabricate historical detail that was never simulated. | Future Set 35 + future Set 39 | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-CFG-016** | Configuration profiles must support sharing/export or server/world descriptors without exposing developer-only/debug controls as ordinary gameplay settings. | Future Sets 34–35 | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-UX-076** | Future Set 36 requires the front end to be built after multiplayer, Forge, settings and Create Realm contracts are known so menus reflect real underlying capabilities rather than dictating them. | Future Set 36 — Main Menu, Front-End & Realm Management | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-UX-077** | Realm management must expose world identity, version/profile, simulation complexity, content packs/mods, multiplayer capability and save-health/recovery state where applicable. | Future Set 36 | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-UX-078** | The front end must provide coherent entry points for continuing/managing realms, multiplayer/servers, The Forge, mods/content, settings and recovery/backups. | Future Set 36 | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-UX-079** | World-management actions such as duplicate, backup, migrate, repair, disable/enable pack or delete must operate on explicit persistent-state workflows with confirmations/recovery policy. | Future Set 36 | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-UX-080** | Front-end summaries must not claim a world is healthy/compatible when required manifest/schema/migration checks have failed. | Future Set 36 | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-UX-081** | Realm selection/management UI must scale to long-lived players with many worlds without requiring every world to fully load for listing metadata. | Future Set 36 | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-OPS-001** | Future Set 38 requires a headless/dedicated-server mode that can run authoritative realms without graphical/editor dependencies. | Future Set 38 — Dedicated Server Administration & Realm Operations | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-OPS-002** | Dedicated-server configuration must separate host/server policy from per-player local settings and from immutable world-generation history. | Future Set 38 | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-OPS-003** | Server administration must support explicit roles/permissions for world operations, moderation, player access and privileged commands. | Future Set 38 | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-OPS-004** | Long-running community realms require automated/manual backup, restore and integrity-check operations that do not depend on an interactive game client. | Future Set 38 | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-OPS-005** | Dedicated servers must expose structured logs/diagnostics sufficient for operations while respecting privacy and bounded retention. | Future Set 38 | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-OPS-006** | Server operations must support controlled content-pack/mod installation, required-pack policy and compatibility checks. | Future Set 38 | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-OPS-007** | Administrative intervention must be auditable and must not bypass persistent identity/conservation without a deliberately privileged repair/admin operation. | Future Set 38 | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-OPS-008** | Server software must support clean shutdown/checkpoint/restart and crash recovery without corrupting the authoritative world. | Future Set 38 | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-OPS-009** | Long-running realm operations must account for unattended simulation policy, maintenance windows, migration/update sequencing and reconnect behaviour. | Future Set 38 | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-OPS-010** | Moderation/administration records that affect persistent permissions/bans/ownership must remain separate from gameplay social reputation or faction law unless an explicit bridge exists. | Future Set 38 | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-REL-001** | Future Set 39 requires game/content/save evolution to use explicit patch, hotfix, migration, rollback and major-version policies rather than assuming current schemas are permanent. | Future Set 39 — Game Updates, Patching, Versioning & Release Lifecycle | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-REL-002** | Updates must preserve or deliberately migrate long-lived saves, content manifests and stable IDs; incompatible changes require explicit user/server-facing handling. | Future Set 39 | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-REL-003** | Patch/update systems must treat base game, Forge/tooling, official content packs and community mods as separately versioned compatibility surfaces. | Future Set 39 | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-REL-004** | Server updates must support compatibility checks and controlled migration/rollback rather than allowing clients/servers to silently diverge. | Future Set 39 | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-REL-005** | Rollback must distinguish executable/build rollback from irreversible save migrations and must not promise unsafe downgrade compatibility. | Future Set 39 | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-REL-006** | Release/version identity must be available to saves, servers, diagnostics and support tooling. | Future Sets 39–40 | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-REL-007** | Future Set 42 requires shipping builds to support reproducible packaging/release branches and platform-specific integration without contaminating canonical game identity with storefront/platform IDs. | Future Set 42 — Platform, Distribution & Production Release | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-REL-008** | Platform packaging/signing/achievements/services/cloud integration must remain adapters around authoritative game/save/content systems rather than new owners of gameplay truth. | Future Set 42 | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-REL-009** | Distribution channels may vary, but build/content/save compatibility semantics must remain inspectable and consistent. | Future Set 42 | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-REL-010** | Release pipelines must be able to produce player, developer/Forge and server/headless artefacts with deliberately different authority/tool surfaces where required. | Future Sets 33,38,42 | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-DEV-065** | Future Set 40 requires production diagnostics to be designed as a supported product capability, not only developer console logging. | Future Set 40 — Release Diagnostics, Crash Reporting, Recovery & Support Tools | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-DEV-066** | A support bundle must be able to collect bounded diagnostic facts such as version, content manifest, enabled mods, save schema, hardware class, simulation configuration, recent crash context, bounded logs, performance summary and world-health information. | Recovered Post-30 roadmap, Set 40 | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-DEV-067** | Support tooling must minimise unnecessary personal/private data and make diagnostic collection scope reviewable. | Future Set 40 | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-DEV-068** | Crash/recovery tooling must preserve enough version/save/manifest context to reproduce failures in long-lived/modded worlds. | Future Set 40 | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-DEV-069** | Save-repair tools must be explicit/auditable and must prefer diagnosis, backup and controlled migration/quarantine over silent destructive guessing. | Future Set 40 | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-DEV-070** | Diagnostics must distinguish game defect, content/mod incompatibility, save corruption, hardware/performance pressure and configuration problems where evidence permits. | Future Set 40 | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-UX-082** | Future Set 41 is a final whole-game accessibility/localisation certification, not the point at which accessibility/localisation first enter development. | Future Set 41 — Accessibility, Localisation & Final UX Certification | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-UX-083** | Final certification must cover Ley Realms gameplay, The Forge, multiplayer, realm creation, settings, menus, mods/content and major recovery/support interfaces. | Future Set 41 | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-UX-084** | Localisation architecture must be able to certify text expansion, plural/grammar handling, font/glyph coverage, controller glyphs and namespaced mod/content text. | Future Set 41 + existing localisation requirements | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-UX-085** | Accessibility certification must verify equivalent critical cues across audio/visual/motion/colour/input variants after final production changes. | Future Set 41 | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-UX-086** | Accessibility/localisation settings must remain usable before loading a world so a player is not required to enter inaccessible gameplay to configure them. | Future Sets 34,36,41 | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-PROD-051** | Sets 31–42 together form the future base-game production/release programme; their full authored documents are not prerequisites for starting the clean rebuild, but architecture must not preclude them. | Recovered Post-30 roadmap + PRD-00 | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-PROD-052** | Set 32 must occur after multiplayer foundation and before later production infrastructure so the real gameplay architecture receives a whole-game human hardening pass. | Recovered Post-30 roadmap | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-PROD-053** | Set 33 content/security architecture must precede full modding and update ecosystems so those later systems build on protected ownership rather than retrofit it. | Recovered Post-30 roadmap | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-PROD-054** | Sets 34–36 form a connected player-experience programme: Settings defines what can be configured, Create Realm defines the world being created, Main Menu defines access/management. | Recovered Post-30 roadmap | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-PROD-055** | Modding precedes dedicated-server operations in the future roadmap because server compatibility depends on manifests, mods, dependencies, allowed/required packs and client matching. | Recovered Post-30 roadmap | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-PROD-056** | Set 42 is the production-release gate for the base-game programme rather than a new gameplay foundation set. | Recovered Post-30 roadmap | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-GOV-059** | The 43+ Future Expansion Register is a stress horizon, not current canon and not a numbered implementation commitment. | Recovered Post-30 roadmap | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-GOV-060** | Future expansion concepts must be used to test whether extension points are general enough, but they cannot force premature implementation or ownership into the base architecture. | Recovered Post-30 roadmap 43+ | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-GOV-061** | The final numbering/grouping of post-release expansion documents must remain open until the released architecture after Set 42 is understood. | Recovered Post-30 roadmap 43+ | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |
| **REQ-GOV-062** | Candidate future themes such as civilisation ages/dynasties, archaeology, advanced politics/warfare, research/invention, magic engineering, megaproject networks, dynamic myths/religion/collapse/chronicle and Endless World must remain possible without being treated as present requirements for their detailed mechanics. | Recovered Post-30 roadmap 43+ | Future-constraint / recovered-process requirement → PRD-03/04/06/07/09; LFE/FORGE-ENG/future Sets as applicable |

# 43. Round-13 Explicit Unknowns / Evidence Gaps

| ID | Unknown / evidence gap | Required downstream |
|---|---|---|
| **UNK-MP-012** | What multiplayer transport/replication stack and online-service layer best fit Godot, self-hosting, LAN, invites/NAT traversal and later dedicated servers? | PRD-03/04/06/07; future Set31 |
| **UNK-MP-013** | What player-count targets and split-screen + remote combinations can meet simulation/network/UI budgets on intended hardware? | PRD-06/07; future Set31 |
| **UNK-MP-014** | What world-pause/time policy applies to solo, local co-op, listen servers and dedicated servers? | PRD-04/07; future Set31/34 |
| **UNK-MP-015** | What host-migration policy, if any, is feasible without compromising authoritative world/save continuity? | PRD-03/04/06/07; future Set31 |
| **UNK-PERF-015** | What reference hardware tiers define minimum, recommended and high simulation/graphics envelopes? | PRD-03/06/07; future Sets32/35/42 |
| **UNK-PERF-016** | What whole-game packaged benchmark suite represents the Set-32 hardening gate rather than isolated subsystem microbenchmarks? | PRD-06/07 |
| **UNK-FORGE-023** | What exact capability split belongs in developer Forge versus restricted player creator builds? | PRD-04/07; FORGE-ENG; future Set33 |
| **UNK-MOD-001** | Will initial public modding remain data-only, and if executable scripting is later allowed, what sandbox/permission/security model is acceptable? | PRD-03/04/06; future Set37 |
| **UNK-MOD-002** | What deterministic mod/override precedence and conflict-resolution UX can remain understandable with large community pack stacks? | PRD-04/07; future Set37 |
| **UNK-MOD-003** | How are community package trust, provenance, moderation and unsafe-content reporting represented without conflating trust with technical compatibility? | Future Set37 |
| **UNK-MOD-004** | What mod-download/distribution/workshop service, if any, should be assumed versus supporting provider-neutral package files? | PRD-03; future Set37/42 |
| **UNK-CFG-001** | What typed settings schema and precedence model should implement Global/Profile vs Realm vs Server scopes? | PRD-03/04/07; future Set34 |
| **UNK-CFG-002** | Which settings are presentation-only, player-local mechanical assists, world-authoritative rules or server policy? | PRD-04/07; future Set34 |
| **UNK-CFG-003** | What Simple→Extreme simulation profile dimensions are actually meaningful and testable rather than arbitrary complexity sliders? | PRD-04/06/07; future Set35 |
| **UNK-CFG-004** | How can hardware recommendations estimate combined CPU/GPU/RAM/storage risk from custom simulation/world settings without false precision? | PRD-03/06/07; future Set35 |
| **UNK-CFG-005** | Which post-creation realm/simulation settings can change safely, which require migration, and which must remain immutable for world integrity? | PRD-04/07; future Sets35/39 |
| **UNK-UX-017** | What compact world-summary metadata allows Main Menu/My Realms to show health, version, packs and simulation information without fully loading a save? | PRD-03/04; future Set36 |
| **UNK-UX-018** | What recovery/backup/migration flow should the front end expose when a world cannot load normally? | PRD-04/07; future Sets36/39/40 |
| **UNK-OPS-001** | What dedicated-server packaging/runtime boundary keeps headless operation free of rendering/editor dependencies? | PRD-03/04/06/07; future Set38 |
| **UNK-OPS-002** | What remote administration protocol/console/API is required, and what authentication/authorisation model is appropriate? | PRD-03/04; future Set38 |
| **UNK-OPS-003** | What unattended-simulation and maintenance policy applies to long-running realms with no players online? | PRD-04/06/07; future Set38 |
| **UNK-OPS-004** | What backup retention/snapshot strategy balances recovery confidence against enormous long-lived world size? | PRD-04/06/07; future Set38/40 |
| **UNK-REL-001** | What semantic-version/build/content-manifest compatibility policy governs game, server, Forge and pack updates? | PRD-04; future Set39 |
| **UNK-REL-002** | Which save migrations are reversible, and what explicit boundary determines when downgrade/rollback is unsupported? | PRD-04/06/07; future Set39 |
| **UNK-REL-003** | How will patching avoid rewriting enormous unchanged world data or re-downloading/rebuilding unaffected content? | PRD-03/04/06; future Set39/42 |
| **UNK-REL-004** | What release-branch/build-artifact model supports player, developer/Forge and dedicated-server products without divergent game logic? | PRD-03/04; future Set42 |
| **UNK-REL-005** | Which storefront/platform services are target requirements versus optional adapters, and do any impose architecture constraints before release? | PRD-03; future Set42 |
| **UNK-DEV-017** | What privacy/redaction policy defines exactly what a generated support package may collect and retain? | PRD-04/07; future Set40 |
| **UNK-DEV-018** | What save-health diagnostics can detect corruption/inconsistency without mutating the save during inspection? | PRD-03/04/06/07; future Set40 |
| **UNK-DEV-019** | What automatic repair actions, if any, are safe enough for player-facing support tools versus requiring expert/manual recovery? | PRD-04/06/07; future Set40 |
| **UNK-UX-019** | What final localisation language/font/input targets will define Set-41 certification? | Future Set41/42 planning |
| **UNK-UX-020** | What automated accessibility/localisation checks can be run continuously so Set 41 is certification rather than first discovery? | PRD-03/06/07; future Set41 |
| **UNK-GOV-008** | Which 43+ stress-horizon themes genuinely require base-architecture extension points versus being ordinary content built on existing systems? | PRD-04/09; future review |
| **UNK-DEV-020** | What exact P3/P4 evidence threshold should PRD-09 demand for each critical unknown before LFE/FORGE-ENG freeze? | PRD-06/07/08/09 |

# 44. Round-13 Coverage Result

Recovered planning and the future-production constraint register are complete for the **initial PRD-01 extraction baseline**.

Round 13 added **107 unique technical requirements** and **34 explicit unknowns/evidence gaps**.

The strongest retained constraints are:

- evidence/prototype status must remain requirement-specific through P0–P5;
- risky architecture questions are researched and prototyped before LFE/FORGE-ENG freeze;
- future multiplayer is architecturally anticipated now even though full Set 31 implementation can occur later;
- the future hardening programme must audit cross-system correctness, performance, exploits and player experience, not merely FPS;
- developer Forge authority must remain distinct from restricted player creator/mod authority;
- Settings, Create Realm and Main Menu form separate but connected configuration/management layers;
- Global/Profile, Realm and Server settings must not collapse into one blob;
- graphics scalability and simulation complexity remain independent dimensions with hardware-risk guidance;
- community packs/mods require protected namespaces, manifests, compatibility, migration and multiplayer matching;
- dedicated servers require headless authority, administration, backups, moderation, content compatibility and long-running realm operations;
- patching/versioning must preserve long-lived worlds, migrations, mod/server compatibility and bounded rollback semantics;
- production diagnostics/support bundles must be useful while privacy-bounded;
- accessibility/localisation remain continuous architecture concerns with Set 41 as final certification, not initial implementation;
- release/platform integration remains an adapter/shipping layer around authoritative game/save/content truth; and
- 43+ remains an unnumbered expansion stress horizon, not current gameplay canon.

**Future-constraint rule:** fully writing/implementing Sets 31–42 is **not** a clean-rebuild prerequisite. The pre-rebuild obligation is that LFE/FORGE-ENG architecture does not make those programmes impossible or require foundational identity/persistence/security rewrites later.

**Recovered planning + future constraints status: COMPLETE for initial PRD-01 extraction.**

The next primary source family is **Research/Evidence + Historical POC/Registry Evidence**: comparative research Passes 1–5, old implementation/prototype evidence, the manual POC testing guide and `VoxelRegistry.json`. This pass must add risks/evidence obligations without allowing research or failed historical implementation to become game canon.

FCC-13/14 remain parallel controlled-delta sources and will be re-applied before PRD-01 final closure.

# 45. Round-14 — Research / Evidence + Historical POC / Registry + Parallel Authority Delta

## 45.1 Scope and authority handling

Round 14 consumes:

- `SRC-RSCH-VS1` — Vintage Story Pass 1 Feature/Architecture Map;
- `SRC-RSCH-VS2` — Vintage Story Pass 2 Engineering Teardown;
- `SRC-RSCH-VS3` — Vintage Story Failure Archaeology Pass Three;
- `SRC-RSCH-P4` — Pass Four Comparative Architecture Study;
- `SRC-RSCH-P5` — Leyforge Architecture Synthesis Pass Five;
- `SRC-POC-99` — historical POC Manual Testing Guide (supplied filename v0_1; body Version 0.3, 28 July 2026);
- `SRC-POC-VXLREG` — historical `VoxelRegistry.json`;
- final FCC-13 locked registry/migration package;
- current FCC-14 Steps 1A–1C;
- current Branch A / Branch B / Branch C / Branch D control-state sources.

**Authority rule:** research adds evidence, risks, candidate patterns and proof obligations. It does not directly create engineering canon. Historical POC evidence may establish prior Leyforge behaviour/prototype maturity, but it neither overrides current design canon nor certifies the clean rebuild. Locked FCC-13 semantic decisions do carry content authority and therefore update prior PRD-01 provisional FCC-13 assumptions.
## 45.2 Current parallel authority/status delta

- **FCC-13:** CONTENT CANON LOCKED. Final audit reports 268/268 interview decisions, 312/312 legacy POC rows, 407/407 current-canon binding demands, 6/6 normal portal families and zero unresolved FCC-13 holds.
- **FCC-14:** active; Steps 1A–1C are currently available. Step 1C certifies the cross-realm interface model as coherent while carrying one narrow biological owner hold: Overworld `Deepcap Mushroom` ↔ Impossible Deep `Deepcap`.
- **Branch A:** LF-BRAIN-01→13 design locked; physical operational Brain still belongs to pre-production bootstrap.
- **Branch B:** ENG-GOV-00→15 + B-OPS-00→06 certified as the engineering-governance corpus for rebuild bootstrap; automation/enforcement implementation debt remains intentionally staged.
- **Branch C:** audit constitution/inventory methodology active; later findings enter PRD/V1 through explicit delta/propagation.
- **Branch D:** D-ROAD-00→05 form the v0.1 control/readiness baseline; D-ROAD-02 remains live-maintained and D-ROAD-06 remains intentionally deferred.
## 45.3 New requirements / evidence obligations

| ID | Normative requirement / evidence obligation | Primary source(s) | Classification / downstream |
|---|---|---|---|
| **REQ-GOV-063** | PRD-01 must consume parallel authority changes by bounded delta rather than restarting unrelated completed extraction rounds. | Branch C delta doctrine; D-ROAD control model | Evidence-derived / locked-delta constraint → PRD-05/06/07/08/09; LFE/FORGE-ENG only after adoption |
| **REQ-GOV-064** | Branch A Project Brain design is locked but remains design authority for knowledge infrastructure only; it does not replace PRD, FCC, ENG-GOV, LFE or domain sources. | LF-BRAIN-13 v0.1 | Evidence-derived / locked-delta constraint → PRD-05/06/07/08/09; LFE/FORGE-ENG only after adoption |
| **REQ-GOV-065** | Branch B ENG-GOV-00–15 and B-OPS-00–06 are now certified engineering-governance inputs for bootstrap/technical work; PRD outputs must comply with them without duplicating the governance corpus. | B-OPS-06 v0.1; Branch B Complete Corpus v1.0 | Evidence-derived / locked-delta constraint → PRD-05/06/07/08/09; LFE/FORGE-ENG only after adoption |
| **REQ-GOV-066** | Branch D D-ROAD-00→05 is the current roadmap/control baseline; it tracks PRD gates and status but does not alter PRD requirement meaning. | D-ROAD-00→05 v0.1 | Evidence-derived / locked-delta constraint → PRD-05/06/07/08/09; LFE/FORGE-ENG only after adoption |
| **REQ-GOV-067** | Branch C owns V1 audit methodology and may invalidate/reopen affected audit targets by explicit delta; PRD must preserve traceability so later C-AUD findings can be propagated without guesswork. | C-AUD-00/01 v0.1 | Evidence-derived / locked-delta constraint → PRD-05/06/07/08/09; LFE/FORGE-ENG only after adoption |
| **REQ-GOV-068** | FCC-13 is now CONTENT CANON LOCKED and supersedes the earlier PRD-01 assumption that only FCC-13 Step 1A was available. | FCC-13 Final Fidelity Audit & Canon Lock v0.1 | Evidence-derived / locked-delta constraint → PRD-05/06/07/08/09; LFE/FORGE-ENG only after adoption |
| **REQ-GOV-069** | FCC-14 is certification rather than redesign authority; its current technical handoffs must remain PRD/LFE/FORGE-ENG questions unless FCC-14 identifies an actual semantic contradiction. | FCC-14 Steps 1A–1C | Evidence-derived / locked-delta constraint → PRD-05/06/07/08/09; LFE/FORGE-ENG only after adoption |
| **REQ-GOV-070** | The current FCC-14 cross-realm model has no proven broad contradiction; one narrow Deepcap biological relationship hold must remain external-owner pending rather than being guessed in PRD. | FCC-14 Step 1C | Evidence-derived / locked-delta constraint → PRD-05/06/07/08/09; LFE/FORGE-ENG only after adoption |
| **REQ-GOV-071** | Research/evidence sources may strengthen risk classification or prototype obligations but cannot by themselves become final LFE/FORGE-ENG architecture. | PRD-00 research authority; Passes 1–5 | Evidence-derived / locked-delta constraint → PRD-05/06/07/08/09; LFE/FORGE-ENG only after adoption |
| **REQ-GOV-072** | Historical POC success/failure remains evidence and regression material; it neither overrides locked canon nor certifies the new rebuild architecture. | PRD-00; C-AUD-00 CA00-061 | Evidence-derived / locked-delta constraint → PRD-05/06/07/08/09; LFE/FORGE-ENG only after adoption |
| **REQ-DEV-071** | Research evidence must preserve epistemic labels such as documented fact, demonstrated behaviour, observed Leyforge behaviour, strong inference and unknown instead of flattening them into one confidence class. | Research Passes 1–5 | Evidence-derived / locked-delta constraint → PRD-05/06/07/08/09; LFE/FORGE-ENG only after adoption |
| **REQ-DEV-072** | Closed or partially closed reference-engine internals must be recorded as unspecified when primary evidence cannot prove their implementation details. | VS Passes 1–3; Pass 4 | Evidence-derived / locked-delta constraint → PRD-05/06/07/08/09; LFE/FORGE-ENG only after adoption |
| **REQ-DEV-073** | Public bug reports are evidence of failure classes and reproduction contexts, not automatic proof that ordinary vanilla/reference workloads always exhibit the reported magnitude. | VS Failure Archaeology Pass 3 | Evidence-derived / locked-delta constraint → PRD-05/06/07/08/09; LFE/FORGE-ENG only after adoption |
| **REQ-DEV-074** | Candidate architecture from Pass Five must be cross-walked requirement-by-requirement in PRD-05 before any principle is adopted as engineering canon. | Pass Five; PRD-00 | Evidence-derived / locked-delta constraint → PRD-05/06/07/08/09; LFE/FORGE-ENG only after adoption |
| **REQ-DEV-075** | High-risk concurrency choices must be tested with worker-order/thread-count fuzzing and canonical state comparison before acceptance. | Passes 3–5 | Evidence-derived / locked-delta constraint → PRD-05/06/07/08/09; LFE/FORGE-ENG only after adoption |
| **REQ-DEV-076** | Hostile benchmark fixtures should remain permanent regression assets rather than one-off prototype demonstrations. | VS Failure Archaeology; Pass 4/5 | Evidence-derived / locked-delta constraint → PRD-05/06/07/08/09; LFE/FORGE-ENG only after adoption |
| **REQ-DEV-077** | The benchmark programme must include rapid travel through never-generated terrain, large voxel-edit bursts, long simulation catch-up, high agent/strategic-population loads, crash/reload loops, network impairment, worldgen order/core-count variation and repeated load/unload. | Pass Five hostile benchmark set | Evidence-derived / locked-delta constraint → PRD-05/06/07/08/09; LFE/FORGE-ENG only after adoption |
| **REQ-DEV-078** | Evidence from a reference project must identify whether the capability is built-in, example/demo code, extension point, or merely an architectural lesson requiring Leyforge-owned implementation. | Project Optimisation Discussion; Pass 1/2 | Evidence-derived / locked-delta constraint → PRD-05/06/07/08/09; LFE/FORGE-ENG only after adoption |
| **REQ-DEV-079** | The rebuild must instrument per-system CPU time, job counts, queue depth/backlog, allocations/resource handles, memory, I/O and network bytes early enough to diagnose scaling rather than after system proliferation. | Failure Archaeology Pass 3 | Evidence-derived / locked-delta constraint → PRD-05/06/07/08/09; LFE/FORGE-ENG only after adoption |
| **REQ-DEV-080** | Stress/soak/fuzz tests must include long-lived-world history growth, repeated session/world unloads, massive structures/content packs and simulation-backlog recovery. | Pass 3/4 | Evidence-derived / locked-delta constraint → PRD-05/06/07/08/09; LFE/FORGE-ENG only after adoption |
| **REQ-DEV-081** | Historical POC automated tests should be preserved as migration/regression evidence where their behaviour remains canonical, but exact Summer scene paths/scripts are not required to survive. | POC Manual v0.3 | Evidence-derived / locked-delta constraint → PRD-05/06/07/08/09; LFE/FORGE-ENG only after adoption |
| **REQ-DEV-082** | Manual/perceptual acceptance must remain explicit for visual readability, interaction feel, accessibility, first-time comprehension and other properties automated probes cannot truthfully certify. | POC Manual v0.3 §§1,7,11 | Evidence-derived / locked-delta constraint → PRD-05/06/07/08/09; LFE/FORGE-ENG only after adoption |
| **REQ-DEV-083** | Every production phase/slice should define both automated and manual acceptance where each can observe distinct failure classes. | POC Manual maintenance/sign-off rule | Evidence-derived / locked-delta constraint → PRD-05/06/07/08/09; LFE/FORGE-ENG only after adoption |
| **REQ-DEV-084** | The historical POC's known benign runner warnings must not become blanket permission to ignore parse errors, resource-load failures, transaction errors or crashes in the rebuilt test environment. | POC Manual v0.3 §9 | Evidence-derived / locked-delta constraint → PRD-05/06/07/08/09; LFE/FORGE-ENG only after adoption |
| **REQ-DEV-085** | Historical benchmark numbers must retain build/hardware/renderer/resolution/context and cannot become universal future performance targets without PRD-06/07 revalidation. | POC Manual historical baseline | Evidence-derived / locked-delta constraint → PRD-05/06/07/08/09; LFE/FORGE-ENG only after adoption |
| **REQ-DEV-086** | Historical seed-suite diversity and determinism results are evidence of useful validation methodology, not proof that the new worldgen algorithm is already deterministic. | POC Manual current source gate | Evidence-derived / locked-delta constraint → PRD-05/06/07/08/09; LFE/FORGE-ENG only after adoption |
| **REQ-DEV-087** | Regression suites must test both positive behaviour and invariant failures such as duplicate/lost resources, stale jobs, invalid recovery, cross-world leakage and false progression completion. | POC Manual §§5–8 | Evidence-derived / locked-delta constraint → PRD-05/06/07/08/09; LFE/FORGE-ENG only after adoption |
| **REQ-DEV-088** | A fresh-agent/fresh-developer continuation test should be retained as an operational-quality check once the Brain/repository system is physically bootstrapped. | LF-BRAIN-13 certification laws | Evidence-derived / locked-delta constraint → PRD-05/06/07/08/09; LFE/FORGE-ENG only after adoption |
| **REQ-DEV-089** | PRD/LFE evidence records should be suitable for future ingestion/navigation through the Project Brain while linking to authoritative sources rather than duplicating them. | LF-BRAIN-13; B-OPS-04 | Evidence-derived / locked-delta constraint → PRD-05/06/07/08/09; LFE/FORGE-ENG only after adoption |
| **REQ-ARCH-059** | Architectural proposals must distinguish canonical data, derived simulation/cache data and presentation/engine objects so disposable jobs/nodes cannot become persistence truth by convenience. | Pass Five provisional synthesis; reinforced by current requirements | Evidence-derived / locked-delta constraint → PRD-05/06/07/08/09; LFE/FORGE-ENG only after adoption |
| **REQ-ARCH-060** | Architectures permitting arbitrary concurrent mutation of shared authoritative spatial state must be considered high risk and require explicit ownership/synchronisation proof before adoption. | VS Passes 1–3; Pass 4/5 | Evidence-derived / locked-delta constraint → PRD-05/06/07/08/09; LFE/FORGE-ENG only after adoption |
| **REQ-ARCH-061** | Render chunks/mesh blocks, authoritative voxel storage partitions, simulation partitions and persistence partitions must not be assumed to require the same granularity; candidate sizes must be benchmarked. | Pass 4 | Evidence-derived / locked-delta constraint → PRD-05/06/07/08/09; LFE/FORGE-ENG only after adoption |
| **REQ-ARCH-062** | Authoritative and best-effort read paths may use different consistency/performance guarantees where incorrect presentation data is harmless but gameplay truth is not. | VS Pass 2 | Evidence-derived / locked-delta constraint → PRD-05/06/07/08/09; LFE/FORGE-ENG only after adoption |
| **REQ-ARCH-063** | Bulk world mutation should be evaluated as a first-class architecture path because relighting, meshing, navigation, persistence and replication costs can otherwise multiply per voxel. | VS Pass 2 | Evidence-derived / locked-delta constraint → PRD-05/06/07/08/09; LFE/FORGE-ENG only after adoption |
| **REQ-ARCH-064** | Derived GPU resources, mesh caches, subscriptions, background jobs and world/session resources require explicit lifetime ownership and leak testing. | Passes 1–3/5 | Evidence-derived / locked-delta constraint → PRD-05/06/07/08/09; LFE/FORGE-ENG only after adoption |
| **REQ-ARCH-065** | Long-lived historical data must use bounded/paged/indexed working sets so world age/exploration history does not directly determine interactive frame cost. | Failure Archaeology Pass 3 | Evidence-derived / locked-delta constraint → PRD-05/06/07/08/09; LFE/FORGE-ENG only after adoption |
| **REQ-ARCH-066** | Generic data-driven authoring may compile into specialised dense runtime views/hot-path indexes rather than forcing flexible editor schemas into hot loops. | VS Pass 1/2; Pass 5 | Evidence-derived / locked-delta constraint → PRD-05/06/07/08/09; LFE/FORGE-ENG only after adoption |
| **REQ-ARCH-067** | Parallelism must be justified by measured wall-time benefit and data-locality/synchronisation cost, not CPU utilisation alone. | Pass 4/5 Factorio comparison | Evidence-derived / locked-delta constraint → PRD-05/06/07/08/09; LFE/FORGE-ENG only after adoption |
| **REQ-SIM-026** | Research evidence reinforces that simulation depth must scale by changing representation and update policy rather than only reducing tick frequency on the same full object population. | Passes 2–5 | Evidence-derived / locked-delta constraint → PRD-05/06/07/08/09; LFE/FORGE-ENG only after adoption |
| **REQ-SIM-027** | No subsystem may rely on one-frame/tick work proportional to total historical world size, total population, total blocks or total connected clients without a bounded partition/queue mechanism. | Failure Archaeology Pass 3 | Evidence-derived / locked-delta constraint → PRD-05/06/07/08/09; LFE/FORGE-ENG only after adoption |
| **REQ-SIM-028** | Scheduler designs must prevent synchronized tick storms by supporting dephasing, event-driven sleep, bounded queues/backpressure and controlled catch-up. | Failure Archaeology Pass 3 | Evidence-derived / locked-delta constraint → PRD-05/06/07/08/09; LFE/FORGE-ENG only after adoption |
| **REQ-SIM-029** | Simulation promotion/demotion tests must compare conserved canonical outcomes after long dormant/regional intervals against materially equivalent detailed runs. | Pass 4/5 | Evidence-derived / locked-delta constraint → PRD-05/06/07/08/09; LFE/FORGE-ENG only after adoption |
| **REQ-SIM-030** | Permanent always-active simulation zones require explicit justification/budget and cannot accumulate casually outside ordinary relevance policy. | Pass 4 comparative findings | Evidence-derived / locked-delta constraint → PRD-05/06/07/08/09; LFE/FORGE-ENG only after adoption |
| **REQ-SIM-031** | Candidate L0–L4 simulation hierarchy from Pass Five remains a provisional synthesis until PRD-05–08 evidence/adoption; PRD-01 records the capability need, not the exact cadence/distance constants. | Pass Five | Evidence-derived / locked-delta constraint → PRD-05/06/07/08/09; LFE/FORGE-ENG only after adoption |
| **REQ-WGEN-072** | World-generation concurrency tests must include cross-boundary structures/features that would tempt multiple workers to modify the same destination partition. | Failure Archaeology Pass 3 | Evidence-derived / locked-delta constraint → PRD-05/06/07/08/09; LFE/FORGE-ENG only after adoption |
| **REQ-WGEN-073** | Generator determinism must be tested under different generation orders, cancellations/retries and worker/core counts, not only repeated single-thread runs. | Pass 4/5 | Evidence-derived / locked-delta constraint → PRD-05/06/07/08/09; LFE/FORGE-ENG only after adoption |
| **REQ-WGEN-074** | Large cross-boundary world features should have an evidence-backed deterministic ownership/commit strategy before production worldgen parallelism is accepted. | Passes 3–5 | Evidence-derived / locked-delta constraint → PRD-05/06/07/08/09; LFE/FORGE-ENG only after adoption |
| **REQ-WGEN-075** | Worldgen workers must not gain unrestricted unsafe mutation APIs merely for performance without a phase/ownership contract that can be verified. | Failure Archaeology Pass 3 | Evidence-derived / locked-delta constraint → PRD-05/06/07/08/09; LFE/FORGE-ENG only after adoption |
| **REQ-WGEN-076** | Worldgen performance benchmarks must separate expensive procedural analysis from authoritative publication/commit costs. | VS Pass 2; Pass 4 | Evidence-derived / locked-delta constraint → PRD-05/06/07/08/09; LFE/FORGE-ENG only after adoption |
| **REQ-WGEN-077** | Chunk/data/mesh granularity choices must be benchmarked against both traversal throughput and edit-remesh latency rather than copied from a reference game's chunk size. | Pass 4 | Evidence-derived / locked-delta constraint → PRD-05/06/07/08/09; LFE/FORGE-ENG only after adoption |
| **REQ-PST-053** | Persistence design must explicitly test crash injection during voxel edits, transactions, saves, migrations and cross-domain commits rather than only clean shutdown/reload. | Passes 3–5; POC Manual | Evidence-derived / locked-delta constraint → PRD-05/06/07/08/09; LFE/FORGE-ENG only after adoption |
| **REQ-PST-054** | Repeated world open→close/unload cycles must demonstrate flat/bounded retained resource state rather than monotonically growing memory/handles. | Failure Archaeology Pass 3; Pass Five | Evidence-derived / locked-delta constraint → PRD-05/06/07/08/09; LFE/FORGE-ENG only after adoption |
| **REQ-PST-055** | Historical-world maps/history/logs require pagination/compaction/cache policies so save age does not create an ever-growing interactive working set. | Failure Archaeology Pass 3 | Evidence-derived / locked-delta constraint → PRD-05/06/07/08/09; LFE/FORGE-ENG only after adoption |
| **REQ-PST-056** | Generator version, authoritative edits, simulation state and migration history must remain distinguishable so old worlds are not silently reinterpreted under new generation logic. | Pass 4/5 | Evidence-derived / locked-delta constraint → PRD-05/06/07/08/09; LFE/FORGE-ENG only after adoption |
| **REQ-PST-057** | POC save integrity, rotating recovery candidates, version migration and readable save-health behaviour remain useful regression evidence for the new persistence design even though their exact file layout is historical. | POC Manual v0.3 | Evidence-derived / locked-delta constraint → PRD-05/06/07/08/09; LFE/FORGE-ENG only after adoption |
| **REQ-PST-058** | Multi-world isolation must remain a regression fixture: same-seed worlds may share reproducible base generation while retaining completely independent mutable state. | POC Manual Stage A/§8 | Evidence-derived / locked-delta constraint → PRD-05/06/07/08/09; LFE/FORGE-ENG only after adoption |
| **REQ-PST-059** | Persistence tests must include mid-operation checkpoints such as in-flight production, construction, combat, active wards/events and pending repairs where those behaviours remain current. | POC Manual §8 | Evidence-derived / locked-delta constraint → PRD-05/06/07/08/09; LFE/FORGE-ENG only after adoption |
| **REQ-PST-060** | Old engine asset paths and numeric IDs must be treated as migration inputs only; successful loading must resolve them to current semantic identity before runtime presentation. | VoxelRegistry + FCC-13A/E | Evidence-derived / locked-delta constraint → PRD-05/06/07/08/09; LFE/FORGE-ENG only after adoption |
| **REQ-PERF-044** | The Forge must eventually reject or warn on pathological first-party/community content workloads rather than assuming valid data is performant data. | Failure Archaeology Pass 3; Pass 4/5 | Evidence-derived / locked-delta constraint → PRD-05/06/07/08/09; LFE/FORGE-ENG only after adoption |
| **REQ-PERF-045** | Renderer stress tests should include dense transparency/foliage/voxel VFX and large water/ocean scenes because reference failures show content can create GPU cliffs independently of CPU simulation. | Failure Archaeology Pass 3 | Evidence-derived / locked-delta constraint → PRD-05/06/07/08/09; LFE/FORGE-ENG only after adoption |
| **REQ-PERF-046** | Simulation benchmarks should include thousands of independently scheduled machine/block behaviours to detect cadence/work-queue cliffs. | Failure Archaeology Pass 3 | Evidence-derived / locked-delta constraint → PRD-05/06/07/08/09; LFE/FORGE-ENG only after adoption |
| **REQ-PERF-047** | Networking benchmarks should include high latency/packet loss plus large replicated-object populations and spatially separated clients. | Pass 3/5 | Evidence-derived / locked-delta constraint → PRD-05/06/07/08/09; LFE/FORGE-ENG only after adoption |
| **REQ-PERF-048** | Memory tests must track engine/GPU/native handles and world/session resources in addition to managed heap or headline process memory. | Passes 1–3 | Evidence-derived / locked-delta constraint → PRD-05/06/07/08/09; LFE/FORGE-ENG only after adoption |
| **REQ-PERF-049** | Performance acceptance must include backlog recovery: a temporary overload cannot be allowed to create a self-reinforcing catch-up spiral that never returns to budget. | Failure Archaeology Pass 3 | Evidence-derived / locked-delta constraint → PRD-05/06/07/08/09; LFE/FORGE-ENG only after adoption |
| **REQ-PERF-050** | POC performance profiles demonstrated the desired semantic pattern—representation budgets can vary without changing authoritative transactions—but the actual profile numbers are historical only. | POC Manual Stage 9 | Evidence-derived / locked-delta constraint → PRD-05/06/07/08/09; LFE/FORGE-ENG only after adoption |
| **REQ-PERF-051** | The historical packaged POC benchmark on i5-9600K/RTX 2080 Ti is retained as evidence context, not as a current minimum/recommended hardware commitment. | POC Manual historical baseline | Evidence-derived / locked-delta constraint → PRD-05/06/07/08/09; LFE/FORGE-ENG only after adoption |
| **REQ-FORGE-072** | Forge/runtime content architecture should keep canonical authoring source separate from generated CPU/GPU/runtime products and prove rebuild/disposal of derived assets. | Passes 1/2/4/5 | Evidence-derived / locked-delta constraint → PRD-05/06/07/08/09; LFE/FORGE-ENG only after adoption |
| **REQ-FORGE-073** | Forge schemas must expose performance-relevant metadata/validation hooks early enough to prevent pathological content from bypassing budgets. | Failure Archaeology Pass 3 | Evidence-derived / locked-delta constraint → PRD-05/06/07/08/09; LFE/FORGE-ENG only after adoption |
| **REQ-FORGE-074** | Forge/runtime validation should include large content-pack dependency graphs, malformed references, migration cases and representative performance scenes. | Pass 3/4 | Evidence-derived / locked-delta constraint → PRD-05/06/07/08/09; LFE/FORGE-ENG only after adoption |
| **REQ-FORGE-075** | Ordinary creator workflows should prefer stable declarative extension points; powerful native/internal hooks require higher trust and compatibility risk classification. | Pass 3/4/5 | Evidence-derived / locked-delta constraint → PRD-05/06/07/08/09; LFE/FORGE-ENG only after adoption |
| **REQ-FORGE-076** | Historical POC visual/progression test rooms are useful evidence for dedicated representative Forge/runtime laboratories, but their Summer scene files are not canonical tooling architecture. | POC Manual §§3,6 | Evidence-derived / locked-delta constraint → PRD-05/06/07/08/09; LFE/FORGE-ENG only after adoption |
| **REQ-MP-046** | Research supports server-authoritative networking as a strong candidate baseline, but final protocol/transport/interest architecture still requires PRD-03/04/06/07 validation rather than being adopted solely from Pass Five. | Pass 4/5 | Evidence-derived / locked-delta constraint → PRD-05/06/07/08/09; LFE/FORGE-ENG only after adoption |
| **REQ-MP-047** | Simulation cadence, replication cadence and interpolation/presentation cadence must be independently budgetable rather than implicitly identical for every entity. | Failure Archaeology Pass 3 | Evidence-derived / locked-delta constraint → PRD-05/06/07/08/09; LFE/FORGE-ENG only after adoption |
| **REQ-MP-048** | Network interest management must be tested for entity×player scaling and should avoid global membership recomputation at high frequency if profiling confirms the reference failure class. | Failure Archaeology Pass 3 | Evidence-derived / locked-delta constraint → PRD-05/06/07/08/09; LFE/FORGE-ENG only after adoption |
| **REQ-MP-049** | Multiplayer compatibility tests must include large mod/content manifests and dependency mismatch/reconciliation failure cases. | Failure Archaeology Pass 3 | Evidence-derived / locked-delta constraint → PRD-05/06/07/08/09; LFE/FORGE-ENG only after adoption |
| **REQ-MOD-009** | Creator APIs must distinguish stable, experimental/internal and privileged/native extension surfaces so ordinary mods are not forced to patch private internals. | Failure Archaeology Pass 3 | Evidence-derived / locked-delta constraint → PRD-05/06/07/08/09; LFE/FORGE-ENG only after adoption |
| **REQ-MOD-010** | Mod/save API versioning and deprecation metadata must be independently testable because runtime/platform/library changes can break tightly coupled extensions even when game semantics are unchanged. | Failure Archaeology Pass 3 | Evidence-derived / locked-delta constraint → PRD-05/06/07/08/09; LFE/FORGE-ENG only after adoption |
| **REQ-MOD-011** | If sandboxed scripting is later considered, it must be evaluated as an engineering/security option rather than assumed from research recommendation. | Pass 3/5 | Evidence-derived / locked-delta constraint → PRD-05/06/07/08/09; LFE/FORGE-ENG only after adoption |
| **REQ-ID-071** | FCC-13 canonical stable IDs now use `<namespace>:<domain>/<path>` as locked semantic syntax. | FCC-13A §3 | Evidence-derived / locked-delta constraint → PRD-05/06/07/08/09; LFE/FORGE-ENG only after adoption |
| **REQ-ID-072** | Generated standard-form semantic identity is the deterministic pair `(material_id, form_id)` rather than a permanent generated-row number. | FCC-13A §§18–19,88 | Evidence-derived / locked-delta constraint → PRD-05/06/07/08/09; LFE/FORGE-ENG only after adoption |
| **REQ-ID-073** | Runtime numeric handles and local save/chunk palette dictionaries may compress identity only if they remain reversibly mapped to canonical stable IDs. | FCC-13A §§9,52–53 | Evidence-derived / locked-delta constraint → PRD-05/06/07/08/09; LFE/FORGE-ENG only after adoption |
| **REQ-ID-074** | FCC-13 alias/migration graphs must terminate at an active canonical target, compatibility object or explicit rejection/retirement state and must not recycle old meaning. | FCC-13A §§12–15,71 | Evidence-derived / locked-delta constraint → PRD-05/06/07/08/09; LFE/FORGE-ENG only after adoption |
| **REQ-ID-075** | One physical object may expose world/inventory/installed/dropped projections without multiplying canonical identity when the underlying physical thing is unchanged. | FCC-13A §31; FCC-13B §§2–7 | Evidence-derived / locked-delta constraint → PRD-05/06/07/08/09; LFE/FORGE-ENG only after adoption |
| **REQ-ID-076** | FCC-13's locked migration closure, not raw VoxelRegistry row order/display names/asset paths, is the canonical interpretation of the 312 legacy rows. | FCC-13E; Final Lock | Evidence-derived / locked-delta constraint → PRD-05/06/07/08/09; LFE/FORGE-ENG only after adoption |
| **REQ-ID-077** | The legacy registry's contiguous numeric IDs 1–312 are historical handles and cannot determine future canonical ordering or identity. | VoxelRegistry; FCC-13A/E | Evidence-derived / locked-delta constraint → PRD-05/06/07/08/09; LFE/FORGE-ENG only after adoption |
| **REQ-ID-078** | Legacy asset paths under `/Game/Voxel/...` and POC colour/texture fields remain migration/presentation evidence only, not stable identity or final art canon. | VoxelRegistry; FCC-13A/E; FCC-14 | Evidence-derived / locked-delta constraint → PRD-05/06/07/08/09; LFE/FORGE-ENG only after adoption |
| **REQ-PROD-057** | FCC-13 recipes now distinguish exact-material/component inputs from explicitly declared provider inputs; similarity alone cannot create substitution. | FCC-13C | Evidence-derived / locked-delta constraint → PRD-05/06/07/08/09; LFE/FORGE-ENG only after adoption |
| **REQ-PROD-058** | FCC-13 processing/repair/dismantling must preserve declared quantities, outputs, by-products/losses and provenance/quality propagation as applicable. | FCC-13C | Evidence-derived / locked-delta constraint → PRD-05/06/07/08/09; LFE/FORGE-ENG only after adoption |
| **REQ-PROD-059** | The six portal-family bindings and first-access dependency graph are now locked content inputs for later technical implementation; no seventh generic portal family may appear as a technical shortcut. | FCC-13D; Final Lock | Evidence-derived / locked-delta constraint → PRD-05/06/07/08/09; LFE/FORGE-ENG only after adoption |
| **REQ-PROD-060** | Mandatory portal first-access ingredients require at least one deterministic obtainable path; random rare loot may supplement but not be the sole route. | FCC-13D §§153–156 | Evidence-derived / locked-delta constraint → PRD-05/06/07/08/09; LFE/FORGE-ENG only after adoption |
| **REQ-UX-087** | Historical POC first-time-player comprehension scripts are retained as evidence that causal explanation/learnability deserves representative-player testing, not only functional automation. | POC Manual Stage 8 | Evidence-derived / locked-delta constraint → PRD-05/06/07/08/09; LFE/FORGE-ENG only after adoption |
| **REQ-UX-088** | Historical UI/accessibility checks show the value of controller-only navigation, visible focus/back behaviour, scalable text, non-colour cues and adaptive information reveal as regression categories. | POC Manual Stage 8/9 | Evidence-derived / locked-delta constraint → PRD-05/06/07/08/09; LFE/FORGE-ENG only after adoption |
| **REQ-UX-089** | Diagnostics/support output must remain privacy-bounded; the historical POC intentionally omitted names, free-form text, file paths and remote-upload identifiers. | POC Manual Stage 9 | Evidence-derived / locked-delta constraint → PRD-05/06/07/08/09; LFE/FORGE-ENG only after adoption |
| **REQ-UX-090** | World/save recovery UI must distinguish incompatible/corrupt/recovered states without silently overwriting a broken world with a fresh one. | POC Manual Stage A/Stage 9 | Evidence-derived / locked-delta constraint → PRD-05/06/07/08/09; LFE/FORGE-ENG only after adoption |

# 46. Round-14 Explicit Unknowns / Evidence Gaps

| ID | Unknown / evidence gap | Required downstream |
|---|---|---|
| **UNK-ARCH-016** | Which Pass-Five ownership model (single-writer shard, equivalent ownership lease, or another design) best satisfies Leyforge's actual concurrency requirements under Godot/Zylann? | PRD-03/04/06/07 |
| **UNK-ARCH-017** | What storage-chunk, mesh-block, simulation-region and persistence-region granularities minimise total cost across traversal, editing, save, navigation and networking? | PRD-02/03/06/07 |
| **UNK-ARCH-018** | Which best-effort/read-snapshot APIs are safe for presentation/forecast systems without weakening authoritative reads? | PRD-04/06/07 |
| **UNK-ARCH-019** | What resource-lifetime ownership mechanism can automatically detect leaked jobs, subscriptions, meshes/GPU handles, streams and world/session caches? | PRD-03/06/07 |
| **UNK-PERF-017** | What backlog/queue thresholds trigger dephasing, degradation, throttling or admission control before catch-up becomes self-reinforcing? | PRD-06/07 |
| **UNK-PERF-018** | What memory/resource leak soak duration and tolerance constitute P4 evidence for repeated world/session load-unload? | PRD-06/07 |
| **UNK-PERF-019** | Which dense transparency/foliage/ocean/VFX benchmark scenes best match Leyforge's final presentation style after art governance? | PRD-06/07; later art/style inputs |
| **UNK-PERF-020** | What machine/block-entity stress shape exposes the transition from event-driven bounded networks to pathological independently ticking objects? | PRD-06/07 |
| **UNK-PERF-021** | What current-hardware benchmark replaces the historical POC i5-9600K/RTX 2080 Ti evidence and defines minimum/recommended profiles? | PRD-03/06/07 |
| **UNK-WGEN-022** | What deterministic feature-intent/ownership scheme, if any, best handles structures/rivers/caves/features spanning many Zylann chunks? | PRD-02/03/04/06/07 |
| **UNK-WGEN-023** | How should worldgen determinism hashes distinguish intended generator-version changes from race/order nondeterminism? | PRD-04/06/07 |
| **UNK-WGEN-024** | Which worker/core-count matrix is sufficient to claim deterministic worldgen P4 evidence? | PRD-06/07 |
| **UNK-PST-015** | What paged/indexed history/map storage strategy prevents long exploration history from bloating interactive working sets? | PRD-03/04/06/07 |
| **UNK-PST-016** | What crash-injection matrix is sufficient for voxel writes, multi-owner transactions, journal/checkpoint rotation, migration and world-manifest updates? | PRD-06/07 |
| **UNK-PST-017** | Which historical POC save/migration fixtures should be preserved verbatim for compatibility testing versus represented only as expected semantic outcomes? | FCC-13 migration + PRD-07 |
| **UNK-PST-018** | What technical loader implementation realises FCC-13's 312-row migration closure and old numeric-ID interpretation without importing old `/Game/Voxel` assumptions? | PRD-03/04/06/07 |
| **UNK-SIM-008** | What scheduler design gives bounded dephasing/backpressure across people, ecology, biology, automation, economy and world events without one global bottleneck? | PRD-03/04/06/07 |
| **UNK-SIM-009** | What equivalence metrics decide whether regional/strategic/dormant catch-up is materially faithful enough to active simulation? | PRD-06/07 |
| **UNK-FORGE-024** | What automated performance-certification metadata and representative scenes should every shippable Forge package carry? | FORGE-ENG; PRD-06/07 |
| **UNK-FORGE-025** | What safe extension API coverage allows most community features without requiring private-engine patching/native plugins? | PRD-03/04/06/07; future Set37 |
| **UNK-MP-016** | What server-authoritative interest-management model best avoids entity×player scaling while supporting voxel, settlement, realm and social/economic relevance? | PRD-03/04/06/07 |
| **UNK-MP-017** | Which protocol traffic classes/channels should separate commands, world bulk data, state deltas and presentation/telemetry? | PRD-03/04/06/07 |
| **UNK-MOD-005** | If privileged native extensions are supported, what trust/signing/server-policy boundary prevents them from being treated like ordinary safe data packs? | PRD-03/04; future Set37/38 |
| **UNK-ID-016** | What compact runtime handle/palette dictionary design best maps FCC-13 semantic IDs to high-performance chunk/inventory/network representations? | PRD-02/03/04/06/07 |
| **UNK-ID-017** | What alias/tombstone storage and compaction strategy preserves FCC-13 migration semantics over many future versions? | PRD-04/06/07; future Set39 |
| **UNK-ID-018** | How should generated `(material_id, form_id)` identities be hashed/indexed/cached for performance without creating persistent row-number identity? | PRD-03/04/06/07 |
| **UNK-DEV-021** | What exact hostile-test subset is required at P3 versus P4 before PRD-09 may accept an architecture decision? | PRD-06/07/08/09 |
| **UNK-DEV-022** | How should old POC manual tests be mapped to current requirements so superseded Summer-specific steps are excluded without losing valuable regression intent? | PRD-05/07 |
| **UNK-DEV-023** | What current Branch-C audit findings/metadata requirements must PRD-01 incorporate before its final freeze? | Branch C controlled delta |
| **UNK-DEV-024** | What further FCC-14 Step 1D/1E/final-lock deltas will affect PRD-01 requirements or resolved-unknown status? | FCC-14 controlled delta |

# 47. Round-14 Resolution / Narrowing of Earlier Unknowns

The following earlier PRD-01 unknowns are **not deleted**, because their history is useful, but their status is changed by completed FCC-13:

| Earlier unknown | Round-14 disposition |
|---|---|
| `UNK-DEV-015` — which FCC-13 steps/freeze point exist? | **RESOLVED at content-authority level.** FCC-13 Steps 1A–1E, Q1–Q268, A–E writing and final fidelity/canon lock are complete. |
| `UNK-ID-013` — stable identity for generated standard forms | **SEMANTICALLY RESOLVED.** Authoritative identity is `(material_id, form_id)`; exact hashing/runtime representation remains technical. |
| `UNK-ID-014` — relationship between material/form/content-object namespaces | **SUBSTANTIALLY RESOLVED SEMANTICALLY** by FCC-13A domain syntax/layers; compiled/runtime layout remains technical. |
| `UNK-PROD-014` — exact six portal component/recipe bindings/dependency ordering | **RESOLVED at content level.** FCC-13D binds six families and certifies non-circular first access; executable portal transaction/failsafe code remains technical. |
| `UNK-PST-013` — 312-row legacy migration plan | **RESOLVED at semantic-mapping level.** FCC-13E accounts for 312/312 legacy rows; loader/quarantine implementation remains technical. |
| `UNK-PST-014` — numeric voxel-ID translation | **NARROWED.** Version-aware mapping into canonical semantic IDs is required; compact runtime/persistence encoding remains technical. |
| `UNK-FORGE-021` — generated standard forms versus authored specialist geometry | **NARROWED/DOCTRINE RESOLVED.** Standard eligible forms are generated from material+form semantics; specialist forms/geometry remain explicitly authored where required. |
| `UNK-DEV-016` — what FCC-14 areas need re-audit? | **PARTIALLY RESOLVED.** Steps 1A–1C now identify cross-realm/material/registry/ecology/event/universal-system and migration/art/technical handoffs; final Step 1D/1E/final lock remains incoming. |

FCC-14 currently carries one semantic hold (`FCC14-HOLD-BIO-001`, Deepcap relationship). PRD-01 records the hold but does not manufacture a biological resolution.

# 48. Round-14 Historical POC Evidence Snapshot

The historical POC manual is retained as **evidence**, not current architecture.

Important evidence preserved from the supplied guide includes:

- an old multi-stage POC covering voxel editing, worldgen, crafting, persistent villagers, automation, magic, raids, UI/accessibility, save hardening, multi-world generation and living-settlement construction;
- explicit manual acceptance alongside automated probes;
- atomic/recoverable save behaviour, world isolation and migration fixtures;
- conservation tests across crafting/automation/construction;
- near/far simulation regression checks;
- deterministic/regional seed validation;
- packaged diagnostics and privacy-bounded reports;
- controller/accessibility/localisation readiness tests;
- a historical 489-check baseline and later source gates reported at 5,018 checks for the Stage-B 256-seed gate;
- an extended 10,000-seed regional planner run reported at 130,007 checks with 9,998 unique starter-layout signatures;
- a historical packaged benchmark on the reference i5-9600K / RTX 2080 Ti system reporting 4.438 ms p95 and 16.902 ms maximum over the stated test context.

These figures remain **historical build evidence only**. They do not certify Godot+Zylann, the future LFE architecture or current target hardware.

`VoxelRegistry.json` is likewise historical migration evidence:

- **312 rows total**;
- **143 Block rows**;
- **169 Item rows**;
- numeric IDs are contiguous `1..312`;
- all supplied legacy asset paths are `/Game/Voxel/...`-style old-engine paths;
- duplicate display-name pairs include Oak Log, Stone Brick, Cobblestone, Oak Beam, Cave Mushroom and Clay Roof Tile.

FCC-13's locked migration package now controls the semantic disposition of those rows; the raw registry does not.

# 49. Round-14 Coverage Result

Round 14 added **94 unique requirements/evidence obligations** and **30 explicit unknowns/evidence gaps**.

The research/evidence and historical-POC source families are now complete for the **initial PRD-01 extraction baseline**.

The strongest conclusions are deliberately evidence-scoped:

- external research repeatedly supports ownership, bounded work, simulation-resolution changes, batching, explicit lifetimes, deterministic testing and data-driven authoring as high-value patterns;
- Pass Five's single-writer shards, L0–L4 hierarchy, deterministic generation DAG, hybrid persistence and server-authoritative networking remain **provisional architecture synthesis**, not automatically adopted LFE law;
- concurrency, chunk granularity, worldgen commit strategy, persistence layout, navigation, networking, scheduling and Forge/runtime boundaries still require PRD-02–08 evidence where marked unknown;
- the historical POC demonstrates many useful behaviours and test patterns, but successful Summer-era code/tests do not certify the rebuild;
- FCC-13 now fully replaces the raw 312-row POC registry as the semantic migration/binding authority;
- FCC-14 through Step 1C has so far found the cross-realm model coherent, with one narrow biological owner hold and many deliberately downstream technical implementation questions;
- Branch A design, Branch B governance and Branch D control baseline are complete at their current design/control levels; Branch C remains active and will feed controlled audit deltas.

**Round-14 status: COMPLETE.**

The next PRD-01 operation is **Round 15 — Master Reconciliation, Deduplication, Dependency/Unknown Crosswalk and Coverage-Closure Candidate**.

Round 15 can proceed while FCC-14 continues, but **PRD-01 final freeze/closure must consume the final FCC-14 delta and any material Branch-C audit delta that affects this inventory**.

# 50. Round-15 — Master Reconciliation, Deduplication, Dependency Crosswalk & Coverage-Closure Candidate

## 50.1 Purpose

Round 15 changes PRD-01 from an extraction document into a **controlled closure candidate**.

It does not rewrite 1,871 requirement rows into a smaller V1 corpus. Branch C now owns the final rewrite/normalisation methodology, and stable PRD requirement IDs must not be casually recycled merely because two rows overlap. Instead, this round:

- consumes the latest authority deltas;
- proves namespace/ID hygiene;
- classifies overlap and normalisation candidates;
- crosswalks the requirement corpus into implementation-facing umbrella domains;
- reconciles unknown status;
- audits every PRD-00 mandatory source family;
- audits DNL-001→020 continuity;
- audits unusual/special physical mechanics coverage;
- checks downstream routing; and
- states the exact remaining conditions for PRD-01 final freeze.

The governing closure rule is:

> **No requirement disappears merely because another row sounds similar. Merge only when authority, scope, conditions and downstream obligations are genuinely equivalent.**

---

# 51. Live Authority Delta Consumed in Round 15

## 51.1 FCC-14A — cross-realm semantic certification

FCC-14A closes `FCC14-HOLD-BIO-001`.

Current semantic result:

- Overworld **Deepcap Mushroom** and Impossible Deep **Abysscap** are distinct native biological crop identities;
- `Deepcap` may remain an Impossible Deep legacy/colloquial alias where useful;
- no shared species, ancestry, import or cultivar relationship is implied;
- zero FCC-14 semantic holds remain open at Volume-A level;
- the formal whole-package lock remains reserved to FCC-14D.

Therefore the Round-14 status row `REQ-GOV-070` is retained for provenance but is now **historically satisfied/superseded as a live hold statement**. Its governing process principle—PRD must not guess unresolved owner canon—remains valid.

## 51.2 FCC-14B — semantic art handoff

FCC-14B confirms that later art/presentation must preserve consequential distinctions among identity, form, state, provenance, quality/grade and contextual overlays without prematurely choosing final palettes, textures, shaders, models, VFX, audio or exact LOD budgets.

No new PRD implementation architecture is chosen by this handoff.

## 51.3 FCC-14C — Forge / technical / validation / migration handoff

FCC-14C is now complete and consumed by this closure candidate.

Its technical-contract domains are already represented in PRD-01:

| FCC-14C handoff | Existing PRD-01 coverage |
|---|---|
| Stable semantic IDs / runtime handles are projections | `REQ-ID`, `REQ-PST`, `REQ-ARCH` |
| Generated standard forms + specialist authored overrides | `REQ-ID`, `REQ-FORGE`, `REQ-PRES` |
| Block/Object/Item/world/inventory projections | `REQ-ID`, `REQ-FORGE`, `REQ-PST` |
| Material state/provenance/quality/composition | `REQ-ID`, `REQ-FORGE`, `REQ-REALM` |
| Exact/provider/capability/quantity processing | `REQ-PROD`, `REQ-AUT`, `REQ-FORGE` |
| Blueprint/project/repair material resolution | `REQ-BLD`, `REQ-PLAN`, `REQ-STR` |
| Cross-realm suitability/support/environment | `REQ-REALM`, `REQ-ECO`, `REQ-BIO`, `REQ-MAG` |
| Six-family portal authoring/state/recovery | `REQ-REALM`, `REQ-MAG`, `REQ-PST`, `REQ-ID` |
| Semantic art-contract/non-colour validation | `REQ-PRES`, `REQ-UX`, `REQ-FORGE`, `REQ-DEV` |
| Performance/accessibility truth preservation | `REQ-PERF`, `REQ-UX`, `REQ-ARCH` |
| Legacy/save migration + compatibility/test isolation | `REQ-PST`, `REQ-ID`, `REQ-MOD`, `REQ-DEV` |
| Build/runtime diagnostics and validation gates | `REQ-DEV`, `REQ-ARCH`, `REQ-PERF` |

**Result:** FCC-14C creates no missing top-level PRD requirement family. It strengthens authority/acceptance criteria for already-extracted capabilities.

## 51.4 Branch-C audit-methodology delta

Branch C has advanced through C-AUD-09, with C-AUD-10 now acting as the certification-register lock candidate. PRD-01 therefore adopts the following closure constraints without duplicating Branch-C law:

1. traceability records prove connection but do not replace owning authority;
2. current/historical/superseded/evidence states remain distinguishable;
3. exact duplicates may be normalised later, but semantic conditions must survive;
4. historical implementation evidence cannot masquerade as current qualification;
5. unresolved material authority deltas reopen only affected records;
6. final PRD freeze requires its own known material delta queue to be empty.

C-AUD-11 global V1 certification is **not** a prerequisite for PRD-01 closure; that would create a circular dependency because global V1 itself later consumes PRD/LFE/FORGE-ENG. Only Branch-C findings materially affecting PRD-01 must be consumed before this document freezes.

---

# 52. Requirement-ID and Namespace Hygiene Audit

## 52.1 ID integrity

Round-15 machine audit result:

- raw requirement rows: **1,871**;
- raw unknown rows: **478**;
- duplicate requirement/unknown IDs: **0**;
- requirement rows with missing ID family: **0 known**;
- previously omitted namespace declarations in §3.1 have been repaired in v0.15.

## 52.2 Namespace interpretation

PRD namespaces are **inventory/navigation domains**, not automatic final engine modules.

For example:

- `REQ-BIO` does not require one `BiologyManager`;
- `REQ-REALM` does not require one monolithic Realm subsystem;
- `REQ-FORGE` may be implemented through several authoring/compiler/runtime components;
- cross-cutting requirements may legitimately reference multiple namespaces.

Final LFE/FORGE-ENG module boundaries remain downstream engineering decisions.

---

# 53. Overlap / Deduplication Reconciliation

## 53.1 Exact-duplicate result

A normalised statement comparison found:

> **0 exact duplicate requirement statements.**

The corpus is large because later specialist documents refine, constrain or mirror earlier requirements—not because hundreds of rows were mechanically copied verbatim.

## 53.2 Overlap classes

Round 15 uses four overlap classes:

| Class | Meaning | Action in PRD-01 |
|---|---|---|
| `ROOT → SPECIALIST` | Later owner refines an earlier umbrella promise. | Keep both; trace parent/child. |
| `CROSS-OWNER MIRROR` | Two owners need complementary duties around one invariant. | Keep both; make interface explicit. |
| `SEMANTIC ALIAS CANDIDATE` | Rows appear materially equivalent and may collapse in later V1 rewrite. | Preserve IDs now; mark for C-AUD-09 normalisation. |
| `STATUS / DELTA SUPERSEDED` | Row records a once-valid programme state that later authority resolved. | Preserve provenance; mark live status superseded. |

## 53.3 Representative normalisation candidates

| Pair / family | Round-15 disposition |
|---|---|
| `REQ-SIM-005` ↔ `REQ-SIM-012` | Strong alias candidate: generic promotion/demotion rule vs Atlas-specific wording. |
| `REQ-ID-048` ↔ `REQ-PST-027` | Cross-owner mirror: identity migration semantics vs persistence migration execution. Keep both. |
| `REQ-MP-003` ↔ `REQ-MP-036` | Strong alias candidate; future V1 rewrite may consolidate shared-world ownership scope. |
| `REQ-DEV-022` ↔ `REQ-DEV-029` | Strong alias candidate around combined automated + human release gates. |
| `REQ-GOV-026` ↔ `REQ-ID-070` | Root/specialist pair: archive/test isolation doctrine vs registry selection consequence. |
| `REQ-PERF-011` ↔ `REQ-PERF-020` | Strong overlap; retain until asset-budget scope is normalised. |
| `REQ-REALM-033` ↔ `REQ-REALM-038` | Strong alias candidate for persistent full-realm systemic breadth. |
| `REQ-ARCH-054` ↔ `REQ-SOC-043` | Root/specialist mirror: architecture service boundary vs Social-owned implementation obligation. |
| `REQ-PROD-005` ↔ `REQ-PROD-051` | Strong alias candidate: Sets 31–42 constrain architecture without all being rebuild blockers. |
| `REQ-ID-027` ↔ `REQ-PST-028` | Cross-owner mirror: missing-content identity preservation vs save/quarantine behaviour. |
| `REQ-BLD-009` / `REQ-FORGE-019` / `REQ-ARCH-023` / `REQ-FORGE-072` | Shared source→bake→runtime doctrine at building, Forge and architecture levels. Keep semantic root + specialist applications; later rewrite may reduce repetition. |
| `REQ-SOC-053` ↔ `REQ-PST-045` | Specialist migration rule consuming general persistence migration law. |
| `REQ-AUT-010` ↔ `REQ-PROD-023` | Root/specialist overlap around explicit by-products/waste and conservation. |
| `REQ-SIM-011` ↔ `REQ-PERF-016` | Complementary: simulation-profile obligation vs bounded representation/performance obligation. |
| `REQ-GOV-058` ↔ `REQ-DEV-048` | Historical controlled-delta pair; now substantially satisfied by FCC-14A/B/C, with FCC-14D still pending. |
| `REQ-SET-001` ↔ `REQ-BLD-002` | Root/specialist duplicate meaning of the seven settlement needs; future V1 normalisation candidate. |
| `REQ-GOV-017` ↔ `REQ-MOD-002` | Root content-pack manifest contract vs future mod-domain specialisation. |
| `REQ-PROD-001` ↔ `REQ-GOV-029` | Classification doctrine; likely one canonical rule + one consumer trace in V1. |
| `REQ-UX-021` ↔ `REQ-CFG-015` | Same post-creation simulation-depth migration concern from UX and configuration viewpoints; likely parent/consumer rather than two formulas. |

**Round-15 rule:** no IDs are deleted or renumbered in the working PRD. Final editorial consolidation belongs to the governed V1 rewrite/normalisation process.

---

# 54. Master Requirement Umbrella Crosswalk

The 1,871 rows can be understood as sixteen implementation-facing umbrella concerns without treating those umbrellas as final code modules:

| Umbrella | Primary PRD namespaces | Principal downstream |
|---|---|---|
| Authority / ownership / lifecycle | GOV, DEV | PRD-04/05/09; LFE/FORGE-ENG governance interfaces |
| Stable identity / registry / migration | ID, PST | PRD-03/04/06/07; LFE registries/persistence |
| Transactions / conservation / evidence | GOV, AUT, PROD, ECON, DEV | LFE transaction/event/evidence kernel |
| World topology / generation / history | WLD, WGEN, REALM | PRD-02/03/04/06/07; LFE world |
| Simulation / LOD / scheduling | SIM, CIV, ECO, BIO, ECON, SOC | PRD-04/06/07; LFE simulation |
| Persistence / recovery / compatibility | PST, ID, MOD, REL | PRD-03/04/06/07; LFE persistence |
| People / social / biology / combat | CIV, SOC, BIO, CMB | LFE specialist domains |
| Settlement / planning / structures | SET, PLAN, BLD, STR, POL | LFE settlement/structure interfaces; FORGE-ENG |
| Automation / production / economy / magic | AUT, PROD, ECON, MAG, PROG | LFE specialist domains |
| Movement / navigation / maritime | MOV, MAR, SPAT | PRD-02/03/04/06/07; LFE movement/spatial |
| Realm access / cross-realm contracts | REALM, MAG, PST, ID | LFE Realm Access + specialist interfaces |
| Forge / source / bake / presentation | FORGE, ENT, PRES, VFX, AUDIO | PRD-03/04/06/07; FORGE-ENG |
| Multiplayer / authority / replication | MP, ID, PST | PRD-03/04/06/07; LFE networking |
| UX / accessibility / configuration | UX, CFG, PRES, AUDIO/VFX | LFE UI/settings; FORGE-ENG presentation |
| Performance / diagnostics / proof | PERF, DEV, ARCH | PRD-05/06/07/08/09; LFE budgets/testing |
| Mods / operations / release / future constraints | MOD, OPS, REL, PROD | PRD-03/04/06; future Sets 31–42 |

This crosswalk demonstrates that no large extracted domain is currently without a plausible downstream consumer.

---

# 55. Unknown-Status Reconciliation

PRD-01 keeps the original unknown IDs because resolution history matters.

Current raw inventory:

- **478** unknown rows total;
- **3 fully resolved at their stated semantic/content level**;
- **6 narrowed or partially resolved** while a technical remainder still exists;
- **469 remain open/routed** for later discovery/architecture/evidence work.

## 55.1 Fully resolved

| Unknown | Disposition |
|---|---|
| `UNK-DEV-015` | FCC-13 sequence/freeze point resolved by completed FCC-13 A–E + final lock. |
| `UNK-PROD-014` | Six portal component/recipe bindings and first-access dependency graph resolved by FCC-13D. |
| `UNK-PST-013` | 312-row legacy migration semantic plan resolved by FCC-13E; loader implementation remains represented elsewhere. |

## 55.2 Narrowed / partial

| Unknown | Current status |
|---|---|
| `UNK-ID-013` | Generated standard-form semantic identity resolved as `(material_id, form_id)`; runtime hashing/encoding remains technical. |
| `UNK-ID-014` | Namespace/domain semantic relationship substantially resolved by FCC-13A; compiled/runtime layout remains technical. |
| `UNK-PST-014` | Numeric legacy-ID migration semantics narrowed to version-aware mapping; concrete loader/palette implementation remains open. |
| `UNK-FORGE-021` | Generated standard-form vs specialist-authored doctrine resolved; exact Forge/compiler implementation remains open. |
| `UNK-DEV-016` | FCC-14 audit domains are now known and A/B/C consumed; formal D/package lock remains pending. |
| `UNK-DEV-024` | Step 1D/1E/A/B/C deltas are now consumed; only FCC-14D/final package-lock delta remains for this unknown. |

## 55.3 Routing integrity

Every recorded unknown has a declared downstream investigation/owner route. No orphan unknown lacking a next decision/evidence destination was found in the Round-15 scan.

---

# 56. PRD-00 Mandatory Source-Coverage Audit

| PRD-00 mandatory input | PRD-01 result |
|---|---|
| 1. Foundation 00–20 + reconciliation governance | **COVERED — Rounds 1–5** |
| 2. Set 20 v0.2 | **COVERED — Round 6** |
| 3. Forge Sets 21–23 incl. 21G v0.2 | **COVERED — Round 7** |
| 4. Set 24 World Content Atlas | **COVERED — Round 8** |
| 5. Set 25 Governance / Registries | **COVERED — Round 9** |
| 6. Set 26 Maritime | **COVERED — Round 10** |
| 7. Sets 27–30 + XSI v1.1 | **COVERED — Round 11** |
| 8. FCC-01 + six completed realm FCC packages | **COVERED — Round 12** |
| 9. FCC-12 + later FCC-13/14 deltas | **FCC-12/13 COVERED; FCC-14A/B/C COVERED; FCC-14D PENDING FINAL DELTA** |
| 10. Project Optimisation Discussion | **COVERED — Round 13** |
| 11. Post-30 Sets 31–42 + 43+ stress horizon | **COVERED — Round 13** |
| 12. Research Passes 1–5 | **COVERED — Round 14** |
| 13. Historical POC guide + VoxelRegistry | **COVERED — Round 14** |
| 14. DNL-001→020 | **COVERED — Round 1 + Round-15 audit below** |

**Coverage result:** all currently available mandatory source families have been extracted or reconciled. The only known FCC family completion delta still outstanding is **FCC-14D**.

PRD-00 v1.0 itself requires a controlled `PRD-00 v1.x` source-register delta when completed/new sources materially change the corpus. Before final PRD-01 freeze, the project should therefore either issue that controlled delta for the completed FCC-12/13/14 and Branch A/B/C/D source families that materially affect PRD, or formally record an equivalent governed update against the existing source slots.

---

# 57. DNL-001→020 Continuity Audit

| DNL | Preserved by representative PRD rows | Result |
|---|---|---|
| 001 research→decision→prototype→tech docs→rebuild | `REQ-DEV-001` | PASS |
| 002 P0–P5 evidence ladder | `REQ-DEV-002` | PASS |
| 003 Design vs Engineering vs Technology Fact | `REQ-DEV-003` | PASS |
| 004 Godot+Zylann candidate, not unquestioned final | `REQ-DEV-004`, `REQ-ARCH-036` | PASS |
| 005 canonical IDs ≠ implementation/path/model IDs | `REQ-ID-001` | PASS |
| 006 one truth / one owner | `REQ-GOV-001` | PASS |
| 007 authority ≠ maturity | `REQ-GOV-002` | PASS |
| 008 failed prototype rejects approach, not requirement | `REQ-GOV-007` | PASS |
| 009 Forge remains genuine visual authoring | `REQ-FORGE-001` | PASS |
| 010 Unified Forge does not collapse specialist ownership | `REQ-FORGE-001` + Round-7 ownership contracts | PASS |
| 011 editable source ≠ baked runtime | `REQ-FORGE-003` | PASS |
| 012 developer vs player creator authority | `REQ-FORGE-004` | PASS |
| 013 multiplayer considered early | `REQ-MP-002` | PASS |
| 014 low-end scalability preserves truth | `REQ-PERF-001`, `003`, `004`, `043` | PASS |
| 015 persistence/version/migration foundational | `REQ-ID-002`, `REQ-PST-001` | PASS |
| 016 diagnostics/profiling/regression foundational | `REQ-PERF-005`, `REQ-DEV-005` | PASS |
| 017 POC/Summer historical | `REQ-PROD-004`, `REQ-DEV-006` | PASS |
| 018 no blanket newer-file supersession | `REQ-GOV-003` | PASS |
| 019 Sets 31–42 constrain now without all blocking rebuild | `REQ-PROD-005` | PASS |
| 020 LFE/FORGE-ENG canon only after PRD/evidence | `REQ-DEV-007` | PASS |

**DNL result: 20/20 preserved.**

---

# 58. Special Mechanics & Unique Physical Content Coverage Audit

FCC requires an explicit safeguard against technically unusual content being lost inside generic architecture.

Round 15 confirms PRD-01 contains technical pressure for every major special-mechanic class currently identified:

| Special mechanic class | Representative coverage |
|---|---|
| Chutes / belts / item pipes / sorters / multi-input logistics | `REQ-AUT-026+`, Forge/automation constraints |
| Pumps / fluid pipes / reservoirs / flooding / fluid transfer | `REQ-AUT`, `REQ-MAR`, `UNK-FLUID` |
| Power / mana / ward / control networks | `REQ-AUT`, `REQ-MAG` |
| Pressure / atmosphere / environmental support / containment | `REQ-REALM`, `REQ-PROG`, `REQ-AUT` |
| Moving vessels / moving frames / ship-local coordinates | `REQ-MAR`, `REQ-SPAT`, `REQ-ID`, `REQ-MP`, `REQ-PST` |
| Realm portals / family state / arrival / recovery | `REQ-REALM`, `REQ-MAG`, `REQ-PST`, `REQ-ID` |
| Doors / ladders / lifts / constrained traversal | `REQ-MOV`, `REQ-STR`, `REQ-BLD` |
| Construction terrain survey / cut-fill / excavation / protected edits | `REQ-PLAN`, `REQ-BLD`, `REQ-STR` |
| Multi-cell / compound / specialist physical objects | `REQ-ID`, `REQ-FORGE`, `REQ-MAG`, `REQ-CIV` |
| Creature/body-specific movement and environment interaction | `REQ-ENT`, `REQ-BIO`, `REQ-MOV`, `REQ-MAR` |
| Stateful damage / occupation / corruption / restoration | `REQ-STR`, `REQ-REALM`, `REQ-PRES`, `REQ-FORGE` |
| Semantic visual/audio/accessibility states | `REQ-PRES`, `REQ-VFX`, `REQ-AUDIO`, `REQ-UX` |

**Result:** no whole special-mechanics family is currently orphaned.

FCC-14C strengthens this conclusion by explicitly requiring semantic authoring/validation for sockets/ports/pivots/moving parts, generated/specialist forms, portal state, material/environment requirements and semantic visual contracts. The exact final **Special Mechanics & Unique Physical Content Register** remains a downstream maintained register rather than a reason to duplicate every named object in PRD-01.

---

# 59. Downstream Handoff / Dependency Coverage

## 59.1 Requirement routing

Round-15 structural scan found no requirement table row intentionally lacking a downstream destination.

PRD-01 therefore has a complete **initial handoff map** into:

- PRD-02 — Zylann capability audit;
- PRD-03 — Godot/supporting-technology audit;
- PRD-04 — architecture boundary study;
- PRD-05 — evidence crosswalk;
- PRD-06 — risk/proof register;
- PRD-07 — prototype/benchmark programme;
- PRD-08 — results/ADR evidence;
- PRD-09 — discovery closure;
- LFE technical canon;
- FORGE-ENG technical canon;
- conditional future Sets 31–42 where the requirement is production-programme rather than rebuild-core.

## 59.2 Dependency principle

A requirement may route to several downstream documents because each has a different job:

```text
SOURCE / CANON
      ↓
PRD-01 requirement
      ├─→ PRD-02/03 technology fact
      ├─→ PRD-04 ownership/boundary decision
      ├─→ PRD-05 evidence mapping
      ├─→ PRD-06 risk
      ├─→ PRD-07 prototype
      ├─→ PRD-08 result / ADR evidence
      └─→ PRD-09 closure
                ↓
         LFE / FORGE-ENG
```

PRD-01 does not need to settle those downstream questions to be complete. It must ensure they are **visible and routed**.

---

# 60. Round-15 Closure-Candidate Verdict

## 60.1 What is now complete

PRD-01 has achieved an initial master inventory closure candidate:

- **1,871** unique requirement/evidence-obligation IDs retained;
- **478** unknown/evidence-gap IDs retained;
- **0 duplicate IDs**;
- **0 exact normalised duplicate requirement statements** detected;
- all PRD-00 mandatory source families covered for currently available material;
- FCC-12 and FCC-13 final deltas consumed;
- FCC-14A/B/C consumed;
- Abysscap amendment consumed and old Deepcap hold closed;
- DNL continuity **20/20**;
- overlap/normalisation candidates classified without unsafe ID deletion;
- unknowns status-reconciled and routed;
- Special Mechanics coverage present;
- downstream PRD/LFE/FORGE-ENG destinations represented;
- Branch A/B/C/D governance/control boundaries reconciled at the current snapshot.

## 60.2 Why this is not yet PRD-01 FINAL

Three bounded pre-freeze obligations remain:

1. **FCC-14D** — consume the formal final FCC package/completeness/amendment/cross-realm lock delta.
2. **PRD-00 controlled source-register delta** — register the materially matured/new source families or record an equivalent governed source-control update as required by PRD-00 §19.1.
3. **Branch-C material-delta check** — immediately before PRD-01 final freeze, confirm no new C-AUD finding materially alters requirement ownership, meaning, identity, evidence classification or downstream routing.

C-AUD-11 global V1 completion is deliberately **not** included as a PRD-01 prerequisite.

## 60.3 Readiness to proceed downstream

The remaining obligations are bounded deltas, not evidence that requirement extraction is incomplete.

Therefore:

> **PRD-01 v0.15 is a valid CLOSURE CANDIDATE and provides sufficient requirements coverage to begin PRD-02 / PRD-03 discovery work under controlled-delta reconciliation.**

Final PRD-01 lock should be issued immediately after FCC-14D and the final bounded source/audit deltas are consumed, provided they introduce no new unextracted technical requirement family.

---

# 61. Immediate Next Action

Primary next work:

> **PRD-02 — Zylann Voxel Tools Deep Capability Audit**

PRD-02 should test the actual current Godot/Zylann capability surface against the PRD-01 requirement families rather than asking whether Zylann is “good enough” in the abstract.

High-priority capability groups include:

- voxel storage/chunk/mesh/block granularity;
- blocky model/state/palette representation;
- runtime edits and bulk edits;
- worldgen/generator APIs and threading ownership;
- LOD/streaming and far-distance blocky-world behaviour;
- collision and physics interaction;
- custom data / stable semantic-ID mapping;
- persistence/save interaction;
- cross-chunk structures/features;
- navigation invalidation hooks;
- fluids/oceans integration boundaries;
- moving-vessel/moving-frame implications;
- multiplayer/server/headless suitability;
- custom shaders/materials/rendering hooks;
- Forge/editor/runtime integration;
- diagnostics/profiling/testing hooks;
- extension/fork maintenance risk.

PRD-02 must classify each capability as technology fact, demonstrated/reference capability, Leyforge prototype evidence or unresolved/prototype-required work. It must not promote convenience into architecture canon.

---

**ROUND-15 RESULT: PRD-01 MASTER RECONCILIATION / COVERAGE-CLOSURE CANDIDATE COMPLETE.**
