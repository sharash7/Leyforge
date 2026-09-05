# Leyforge Branch D — Production / Rebuild Roadmap

## D-ROAD-01 — Master Production Path

**Version:** 0.1  
**Date:** 30 August 2026  
**Status:** Initial Master Production Path  
**Branch:** D — Production / Rebuild Roadmap  
**Authority:** Operates under D-ROAD-00 — Roadmap Authority & Operating Rules  
**Purpose:** Define the complete dependency-aware path from Leyforge's current pre-production state to authorised clean rebuild commencement.

---

# 1. Purpose

D-ROAD-01 is the stable master production map for the Leyforge pre-rebuild programme.

It answers:

- what major workstreams exist;
- who owns them;
- what each workstream depends on;
- what each workstream blocks;
- which work can safely run in parallel;
- what is rebuild-critical;
- what may continue after the rebuild begins;
- what entry and exit conditions apply.

D-ROAD-01 is deliberately more stable than D-ROAD-02.

- **D-ROAD-01** = structure of the journey.
- **D-ROAD-02** = live position on the journey.
- **D-ROAD-03** = detailed dependency/critical-path model.
- **D-ROAD-04** = gate definitions.
- **D-ROAD-05** = final rebuild-readiness check.
- **D-ROAD-06** = implementation sequence, derived later.

---

# 2. Current Snapshot — 30 August 2026

This snapshot exists only to anchor v0.1. Live status will move to D-ROAD-02.

## 2.1 Current branch state

- **Branch A — Project Brain / Obsidian:** design/control layer complete. Physical repository/bootstrap implementation remains a Codex/infrastructure action and is sequenced with Branch B operational controls.
- **Branch B — Engineering Governance:** ENG-GOV set complete. B-OPS operationalisation is active; B-OPS work has progressed through at least B-OPS-05.
- **Branch C — V1 Documentation Audit & Finalisation:** active. C-AUD-00 and C-AUD-01 have reached v0.1 lock-candidate state.
- **Branch D — Production / Rebuild Roadmap:** active. D-ROAD-00 complete as v0.1; D-ROAD-01 is this document.
- **FCC programme:** FCC-12 and FCC-13 binding theoretical decision registers are locked; FCC-14 is currently being built.
- **PRD:** PRD-00 is complete/final; PRD-01 is the next discovery document.
- **LFE:** not yet started.
- **FRG-ENG / FORGE-ENG:** not yet started.
- **Clean rebuild:** implementation remains intentionally gated.

---

# 3. Master Production Tree

```text
LEYFORGE — PRE-REBUILD PROGRAMME
│
├── P0 — EXISTING FOUNDATION / LEGACY EVIDENCE
│   │
│   ├── Sets 00–20 — Foundation design corpus
│   ├── Set 20 companion / settlement work
│   ├── Sets 21–23 — Forge foundation families
│   ├── Set 24 — World Content Atlas
│   ├── Set 25 — Governance / Registries / Integration
│   ├── Set 26 — Oceans / Maritime / Vessels / Naval
│   ├── Sets 27–30 — Economy / Social / Survival / Movement
│   ├── Historical POC implementation
│   ├── Historical tests / probes / benchmarks
│   └── Historical registries / migration evidence
│
├── P1 — FINAL CONTENT CANON
│   │
│   ├── Realm FCC programme
│   ├── FCC-12 — universal materials / states / processing
│   ├── FCC-13 — stable identities / projections / recipes
│   └── FCC-14 — final canon reconciliation / certification
│
├── P2 — PROJECT CONTROL INFRASTRUCTURE
│   │
│   ├── Branch A — Project Brain / Obsidian
│   ├── Branch B — Engineering Governance
│   ├── Branch B — B-OPS operationalisation
│   ├── Branch C — V1 audit framework
│   └── Branch D — production roadmap
│
├── P3 — CODEX / REPOSITORY BOOTSTRAP
│   │
│   ├── Brain physical implementation
│   ├── schemas / templates / registers
│   ├── AGENTS / agent bootstrap
│   ├── Brain Doctor / validation tooling
│   ├── indexes / Bases / navigation
│   ├── work-log / handoff system
│   ├── engineering automation
│   ├── Git / CI / verification baseline
│   └── legacy freeze / rebuild branch preparation
│
├── P4 — PRD DISCOVERY PROGRAMME
│   │
│   ├── PRD-00 — Source Corpus & Authority Register
│   ├── PRD-01 — Technical Requirements & Unknowns Inventory
│   ├── PRD-02 — Zylann / Voxel Technology Audit
│   ├── PRD-03 — Godot / Supporting Technology Audit
│   ├── PRD-04 — Architecture Boundaries & Ownership
│   ├── PRD-05 — Research / Evidence Crosswalk
│   ├── PRD-06 — Risk & Proof Register
│   ├── PRD-07 — Hostile Prototype / Benchmark Programme
│   ├── PRD-08 — Prototype Results / ADR Evidence
│   └── PRD-09 — Final Discovery Closure Audit
│
├── P5 — POST-30 BASE-GAME PROGRAMME
│   │
│   ├── Set 31 — Multiplayer / Networking / Shared Worlds
│   ├── Set 32 — Whole-Game Review / Hardening / Optimisation
│   ├── Set 33 — Forge Overhaul / Player Creator / Security
│   ├── Set 34 — Settings / Controls / Configuration
│   ├── Set 35 — Create Realm / Scalability / Hardware Complexity
│   ├── Set 36 — Main Menu / Front End / Realm Management
│   ├── Set 37 — Modding / Workshop / Community Content
│   ├── Set 38 — Dedicated Servers / Realm Operations
│   ├── Set 39 — Updates / Patching / Version Lifecycle
│   ├── Set 40 — Diagnostics / Crash Recovery / Support
│   ├── Set 41 — Accessibility / Localisation / UX Certification
│   └── Set 42 — Platform / Distribution / Release
│
├── P6 — FINAL TECHNICAL CANON
│   │
│   ├── LFE — Leyforge Engine architecture
│   └── FRG-ENG / FORGE-ENG — Forge engineering architecture
│
├── P7 — GLOBAL V1 RECONCILIATION
│   │
│   ├── corpus freeze candidate
│   ├── authority audit
│   ├── canon reconciliation
│   ├── terminology / identity audit
│   ├── registry audit
│   ├── cross-family audit
│   ├── requirements traceability
│   ├── completeness / edge-case audit
│   ├── clean V1 rewrites
│   ├── link / dependency audit
│   └── final V1 certification
│
├── P8 — REBUILD PREPARATION
│   │
│   ├── implementation dependency graph
│   ├── module boundaries
│   ├── initial vertical slices
│   ├── build backlog
│   ├── CI / testing / benchmark gates
│   ├── repository / branch cutover
│   ├── legacy archive / tag / worktree
│   ├── agent bootstrap verification
│   └── D-ROAD-05 rebuild-readiness certification
│
└── P9 — CLEAN LEYFORGE REBUILD
    │
    ├── foundation bootstrap
    ├── voxel/runtime kernel
    ├── registry kernel
    ├── persistence
    ├── streaming / world generation
    ├── simulation
    ├── gameplay systems
    ├── Forge systems
    ├── vertical slices
    ├── integration tests
    └── full production
```

---

# 4. Rebuild-Critical Spine

The complete programme is large, but the clean rebuild is controlled by a narrower critical spine.

```text
FOUNDATION CORPUS
      │
      ▼
FCC FINALISATION
      │
      ├───────────────┐
      ▼               ▼
BRANCH B          BRANCH C
ENG GOVERNANCE    AUDIT FRAMEWORK
      │               │
      ├───────┬───────┘
      │       │
      ▼       ▼
   CODEX    PRD PROGRAMME
 BOOTSTRAP      │
      │         ▼
      │      PRD-09
      │         │
      └────┬────┘
           ▼
    FINAL TECHNICAL CANON
       LFE + FRG-ENG
           │
           ▼
  REBUILD-REQUIRED POST-30
     CONTRACT RECONCILIATION
           │
           ▼
      GLOBAL V1 AUDIT
           │
           ▼
  IMPLEMENTATION PLANNING
           │
           ▼
 D-ROAD-05 REBUILD GATE
           │
           ▼
      CLEAN REBUILD
```

The roadmap must resist two opposite errors:

1. **Starting too early** while foundational decisions are still unresolved.
2. **Waiting too long** for non-critical release/expansion work that does not actually block the initial rebuild.

---

# 5. P0 — Existing Foundation / Legacy Evidence

## 5.1 Purpose

Preserve and correctly classify the existing design corpus, historical implementation, tests, registries, benchmarks, and lessons.

Historical material is not automatically current authority, but it remains valuable evidence.

## 5.2 Major nodes

| Node | Owner | Current role | Rebuild critical |
|---|---|---|---|
| Sets 00–20 | owning design authorities | foundation design | YES, via V1 reconciliation |
| Set 20 companion work | owning design authority | settlement/development evidence | CONDITIONAL |
| Sets 21–23 | Forge design authorities | Forge foundation | YES, via final Forge engineering |
| Set 24 | world-content authority | atlas/content source | YES |
| Set 25 | governance/registry authority | integration/registry source | YES |
| Set 26 | maritime authority | base-game system source | CONDITIONAL |
| Sets 27–30 | owning design authorities | base-game system sources | YES/CONDITIONAL by subsystem |
| Historical POC | historical implementation | evidence / lessons / regression source | NO as architecture; YES as evidence |
| Historical test suite | verification evidence | regression and acceptance evidence | CONDITIONAL |
| Historical registries | legacy registry evidence | migration/reconciliation source | CONDITIONAL |

## 5.3 Entry condition

Existing corpus and implementation evidence are available.

## 5.4 Exit condition

There is no single P0 closure event. P0 is consumed by FCC, PRD, Branch C, LFE, FRG-ENG, and V1 audit work.

## 5.5 Key rule

Old implementation facts may prove that a behaviour once worked; they do not automatically prove that the old architecture remains correct for the rebuild.

---

# 6. P1 — Final Content Canon

## 6.1 Purpose

Close final content identity, realm, material, processing, block/item/recipe, and cross-canon decisions before final V1 reconciliation.

## 6.2 Realm FCC programme

The realm FCC programme has already produced substantial locked canon, including the Overworld and completed realm families.

### Production role

- supplies final content definitions;
- supplies provenance and realm relationships;
- constrains registries;
- constrains generation;
- constrains progression;
- constrains LFE/Forge interfaces;
- supplies final V1 content authority.

## 6.3 FCC-12

**Purpose:** universal materials, forms, states, derived forms, transformations, processing, provenance and inheritance.

**Current state:** binding Q1–Q352 theoretical decision register locked.

**Depends on:** realm FCC canon and prior design corpus.

**Blocks:** final material/processing identity reconciliation; FCC-13/14 certification completeness.

**Rebuild critical:** YES.

**Exit condition for progression:** accepted decisions fully consumed by downstream FCC/certification documents.

## 6.4 FCC-13

**Purpose:** final stable-ID architecture, Block/Object/Item projection model, generated forms, recipes/providers/capabilities, quantity/consumption semantics and content identity.

**Current state:** binding Q1–Q268 theoretical decision register locked.

**Depends on:** FCC-12.

**Blocks:** FCC-14; registry certification; final implementation identity contracts.

**Rebuild critical:** YES.

**Exit condition for progression:** accepted decisions fully available to FCC-14 and V1 reconciliation.

## 6.5 FCC-14

**Purpose:** final canon certification and reconciliation handoff.

**Current state:** ACTIVE / being built.

**Depends on:** FCC-12, FCC-13, realm FCC corpus.

**Blocks:**

- final content-canon closure;
- final registry reconciliation;
- final content-facing V1 audit;
- some LFE/FRG-ENG assumptions.

**Can run in parallel with:**

- Branch B operationalisation;
- Branch C framework work;
- Branch D;
- PRD work that does not require unresolved FCC-14 fields.

**Rebuild critical:** YES.

**Exit condition:**

- final content conflicts reconciled;
- cross-realm content identities certified;
- stable identities ready for technical consumption;
- unresolved content-canon blockers closed or formally routed.

---

# 7. P2 — Project Control Infrastructure

P2 creates the control systems that stop the remaining work from becoming untraceable.

---

# 8. Branch A — Project Brain / Obsidian

## 8.1 Purpose

Create Leyforge's persistent knowledge graph and institutional memory.

## 8.2 Current state

Branch A design/control layer is COMPLETE/LOCKED for current purposes.

Physical implementation into the repository is handled in P3.

## 8.3 Owns

- knowledge architecture;
- project navigation;
- work logs;
- skills/procedures/shortcuts;
- failures/antipatterns;
- decisions;
- authority links;
- project state views;
- audit/traceability navigation.

## 8.4 Depends on

No downstream technical canon is required to design the Brain.

Physical bootstrap depends on enough Branch B operational rules to avoid building the wrong automation/control behaviour.

## 8.5 Blocks

- full repository knowledge infrastructure;
- automated project state/navigation;
- durable agent work memory.

## 8.6 Rebuild critical

**CONDITIONAL.**

The Brain's design is critical and complete. Physical bootstrap and minimum operational validation should be complete before production-scale rebuild work.

---

# 9. Branch B — Engineering Governance

## 9.1 ENG-GOV

**Current state:** COMPLETE.

**Purpose:** define project-wide engineering authority and rules.

**Rebuild critical:** YES.

**Blocks:** safe Codex bootstrap, agent engineering behaviour, final implementation discipline.

## 9.2 B-OPS

**Current state:** ACTIVE.

**Known progress:** operationalisation has progressed through at least B-OPS-05.

**Purpose:** convert ENG-GOV principles into practical templates, records, procedures, agent contracts, and operational controls.

**Depends on:** ENG-GOV.

**Blocks:**

- final Codex bootstrap specification;
- reliable work logging;
- governed template usage;
- consistent agent operations;
- some repository automation.

**Can run in parallel with:** FCC-14, Branch C, Branch D, selected PRD work.

**Rebuild critical:** YES for the required operational subset.

**Exit condition:**

- required engineering records/templates exist;
- agent/workflow procedures are executable;
- governance can be applied by Codex during infrastructure and rebuild work;
- remaining optional B-OPS work is explicitly non-blocking.

---

# 10. Branch C — V1 Documentation Audit & Finalisation

## 10.1 Current state

ACTIVE.

C-AUD-00 and C-AUD-01 have reached v0.1 lock-candidate state.

## 10.2 Purpose

Define and later execute the final documentation reconciliation/certification methodology.

## 10.3 Depends on

The audit framework can be created before the final corpus exists.

The actual final audit depends on all rebuild-critical source families reaching audit-candidate state.

## 10.4 Blocks

- controlled V1 corpus certification;
- final contradiction closure;
- formal implementation-authoritative documentation lock.

## 10.5 Can run in parallel with

FCC-14, B-OPS, Branch D, PRD, and later technical canon work.

## 10.6 Rebuild critical

YES.

## 10.7 Exit condition

Two distinct milestones must be tracked:

1. **Audit framework ready.**
2. **Final V1 audit executed and passed.**

Branch C is not considered fully closed merely because the methodology documents are complete.

---

# 11. Branch D — Production / Rebuild Roadmap

## 11.1 Current state

ACTIVE.

- D-ROAD-00 — COMPLETE v0.1
- D-ROAD-01 — this document
- D-ROAD-02 — LIVE / maintained
- D-ROAD-03 — COMPLETE v0.1
- D-ROAD-04 — COMPLETE v0.1
- D-ROAD-05 — COMPLETE v0.1
- D-ROAD-06 — intentionally deferred

## 11.2 Purpose

Maintain sequencing, dependencies, gates, and rebuild readiness.

## 11.3 Rebuild critical

YES as a control function, but Branch D is not a design blocker once D-ROAD-00–05 are established and maintained.

---

# 12. P3 — Codex / Repository Bootstrap

## 12.1 Purpose

Physically implement the project-control and engineering infrastructure inside the Leyforge Git repository before production-scale rebuild work.

## 12.2 Planned bootstrap scope

- project Brain/vault directories;
- governed Markdown templates;
- metadata/schema support;
- work logs;
- handoff records;
- decision/ADR records;
- skills/procedures/antipattern records;
- AGENTS / agent bootstrap rules;
- Brain validation / Brain Doctor;
- indexes / Bases;
- authority maps;
- traceability structure;
- CI/validation foundations;
- repository hygiene;
- engineering automation;
- legacy POC freeze/archive strategy;
- rebuild branch/worktree preparation.

## 12.3 Repository strategy

Current accepted strategy:

- remain in the same Git repository;
- freeze the old implementation using a legacy tag;
- retain an archive branch for the legacy POC;
- create a clean rebuild branch;
- keep old implementation accessible through Git/worktrees without leaving it mixed into the new active architecture.

Working names previously proposed:

- `pre-rebuild-legacy`
- `archive/legacy-poc`
- `rebuild/v1`

Exact names remain implementation details unless separately locked.

## 12.4 Depends on

- Branch A design complete;
- ENG-GOV complete;
- sufficient B-OPS operational controls.

## 12.5 Blocks

- fully operational Brain;
- automated repository governance;
- production-ready agent workflows;
- clean technical-canon ingestion.

## 12.6 Can run in parallel with

Branch C, Branch D, FCC-14 and much of PRD after its own minimum prerequisites are satisfied.

## 12.7 Rebuild critical

YES for the minimum production infrastructure.

---

# 13. P4 — PRD Discovery Programme

## 13.1 Governing principle

> Research first, decisions second, prototypes third, canonical technical documentation fourth, rebuild fifth.

PRD exists to stop assumptions from being promoted into architecture without evidence.

---

# 14. PRD-00 — Source Corpus & Authority Register

**Current state:** COMPLETE / FINAL.

**Purpose:**

- inventory source families;
- classify authority/evidence/planning/history;
- map supersession;
- provide discovery-source governance.

**Rebuild critical:** YES, already satisfied.

**Blocks:** PRD-01 onward.

---

# 15. PRD-01 — Complete Technical Requirements & Unknowns Inventory

**Current state:** NEXT.

**Purpose:**

- extract rebuild-critical technical requirements;
- identify unknowns;
- identify unresolved assumptions;
- separate proven facts from design wishes;
- create the discovery workload.

**Depends on:** PRD-00 and available FCC/design sources.

**Can begin while:** FCC-14 matures, provided unresolved FCC-owned fields remain clearly unresolved.

**Blocks:** focused audits, risk programme and prototype planning.

**Rebuild critical:** YES.

---

# 16. PRD-02 — Zylann / Voxel Technology Audit

**Purpose:**

- inspect the chosen Godot voxel technology;
- determine supported features;
- identify fork/plugin boundaries;
- identify gaps;
- record constraints;
- map required proof work.

**Depends on:** PRD-01 requirements.

**Blocks:** final voxel/runtime boundary decisions and related prototypes.

**Rebuild critical:** YES.

---

# 17. PRD-03 — Godot / Supporting Technology Audit

**Purpose:**

Audit Godot and candidate supporting technologies against Leyforge requirements.

**Depends on:** PRD-01.

**Can run in parallel with:** PRD-02.

**Rebuild critical:** YES.

---

# 18. PRD-04 — Architecture Boundaries & Ownership

**Purpose:**

Define evidence-backed ownership boundaries between:

- Godot core;
- voxel plugin/fork;
- Leyforge runtime;
- Forge;
- registries;
- editor tooling;
- persistence;
- multiplayer-facing authority;
- generated content.

**Depends on:** PRD-01–03 evidence.

**Blocks:** prototype scope, final LFE/FRG-ENG structure.

**Rebuild critical:** YES.

---

# 19. PRD-05 — Research / Evidence Crosswalk

**Purpose:**

Map important requirements and architectural claims to their supporting research/evidence.

**Depends on:** PRD-01–04.

**Rebuild critical:** YES.

---

# 20. PRD-06 — Risk & Proof Register

**Purpose:**

Classify technical risks and define the proof level required before architecture freeze.

**Depends on:** PRD-01–05.

**Blocks:** PRD-07.

**Rebuild critical:** YES.

---

# 21. PRD-07 — Hostile Prototype / Benchmark Programme

**Purpose:**

Design prototypes that attempt to break risky assumptions rather than merely demonstrate happy-path feasibility.

Example risk families may include:

- voxel update performance;
- streaming;
- world generation;
- caves;
- persistence;
- large settlements;
- near/far simulation;
- automation;
- water/fluid approach;
- registry scale;
- Forge/runtime integration;
- multiplayer authority boundaries.

Exact programme content belongs to PRD.

**Depends on:** PRD-06.

**Rebuild critical:** YES.

---

# 22. PRD-08 — Prototype Results / ADR Evidence

**Purpose:**

Record results, benchmarks, rejected approaches, exceptions and architecture-decision evidence.

**Depends on:** PRD-07 execution.

**Blocks:** PRD-09 and final technical-canon confidence.

**Rebuild critical:** YES.

---

# 23. PRD-09 — Final Discovery Closure Audit

**Purpose:** certify that discovery has reached sufficient evidence maturity for final technical canon.

**Hard-gate role:** YES.

**Depends on:** PRD-00–08.

**Exit condition:**

- critical unknowns closed or explicitly bounded;
- required proof levels reached;
- risk register dispositioned;
- architecture boundary recommendations supported;
- prototype evidence complete enough for LFE/FRG-ENG;
- unresolved matters formally carried forward rather than silently assumed.

**Blocks:** final LFE/FRG-ENG freeze and later rebuild gate.

**Rebuild critical:** YES.

---

# 24. P5 — Post-30 Base-Game Programme

## 24.1 Purpose

Complete the remaining base-game design families that were intentionally deferred beyond Set 30.

## 24.2 Critical distinction

Not every Set 31–42 document must be fully final before the initial clean rebuild starts.

Each set must be classified as:

- rebuild-critical in full;
- rebuild-critical in part;
- architecture-constraining only;
- post-rebuild production work.

This classification will be refined through PRD, Branch C, and D-ROAD-03/04.

---

# 25. Set 31 — Multiplayer / Networking / Shared Worlds

**Role:** architecture-critical.

**Rebuild critical:** CONDITIONAL.

The full final multiplayer feature set need not necessarily be implemented before the rebuild, but early architecture must not make later authoritative multiplayer impossible.

Required pre-rebuild subset likely includes:

- authority ownership;
- deterministic/shared-state boundaries;
- persistence/network identity assumptions;
- simulation ownership constraints;
- content/version compatibility constraints.

Final scope remains subject to owning authority.

---

# 26. Set 32 — Whole-Game Review / Hardening / Optimisation

**Role:** whole-programme review.

**Rebuild critical:** CONDITIONAL.

Some review findings may be required before final V1 lock, while final release hardening naturally continues later.

---

# 27. Set 33 — Forge Overhaul / Player Creator / Security / Content Packs

**Role:** Forge architecture and content-authoring constraints.

**Rebuild critical:** CONDITIONAL to YES for architecture-facing portions.

Must feed FRG-ENG where it affects:

- player-created content;
- security;
- validation;
- packaging;
- permissions;
- authoring pipeline boundaries.

---

# 28. Set 34 — Settings / Controls / Configuration

**Rebuild critical:** CONDITIONAL.

Architecture-facing configuration, input abstraction and accessibility hooks should be respected early. Full final UX tuning may continue later.

---

# 29. Set 35 — Create Realm / Simulation Complexity / Hardware Scalability

**Rebuild critical:** CONDITIONAL to YES for architecture-facing scalability contracts.

This set may strongly constrain:

- runtime scalability;
- simulation budgets;
- user-created realms;
- hardware-tier behaviour;
- generated-world complexity.

---

# 30. Set 36 — Main Menu / Front End / Realm Management

**Rebuild critical:** CONDITIONAL.

World/realm lifecycle contracts may affect persistence and project structure before full front-end implementation.

---

# 31. Set 37 — Modding / Workshop / Community Content

**Rebuild critical:** CONDITIONAL.

Architecture should preserve content/version/security boundaries even if final workshop integration is later.

---

# 32. Set 38 — Dedicated Servers / Realm Operations

**Rebuild critical:** CONDITIONAL.

Server-authority assumptions may constrain runtime design; full operations tooling can be later.

---

# 33. Set 39 — Updates / Patching / Versioning / Release Lifecycle

**Rebuild critical:** CONDITIONAL.

Schema/version/migration rules are architecture-critical. Full release operations are not necessarily initial-rebuild blockers.

---

# 34. Set 40 — Diagnostics / Crash Recovery / Support

**Rebuild critical:** CONDITIONAL.

Diagnostics and recoverability principles should be built into architecture; final support tooling can mature later.

---

# 35. Set 41 — Accessibility / Localisation / Final UX Certification

**Rebuild critical:** CONDITIONAL.

Architecture and UI framework choices should preserve accessibility/localisation capability from the beginning.

---

# 36. Set 42 — Platform / Distribution / Production Release

**Rebuild critical:** generally NO for initial rebuild, except where a platform constraint materially affects architecture.

---

# 37. Set 43+

Future expansion.

**Rebuild critical:** NO unless a specific base-game architecture contract explicitly requires accommodation.

---

# 38. P6 — Final Technical Canon

P6 translates proven requirements and evidence into implementation-authoritative architecture.

---

# 39. LFE — Leyforge Engine

## 39.1 Purpose

Define the final Leyforge runtime architecture.

Likely scope includes:

- runtime layering;
- voxel integration;
- world streaming;
- world generation;
- simulation;
- near/far simulation;
- entity lifecycle;
- persistence;
- saves/deltas/migration;
- threading/jobs;
- determinism;
- multiplayer-ready authority;
- performance/scalability;
- runtime registries;
- system interfaces;
- diagnostics;
- testability.

## 39.2 Depends on

- PRD evidence and closure;
- content-canon contracts;
- ENG-GOV/B-OPS;
- rebuild-critical post-30 architecture constraints.

## 39.3 Blocks

- implementation dependency graph;
- final V1 technical audit;
- rebuild authorisation.

## 39.4 Can run in parallel with

FRG-ENG once shared boundaries are sufficiently stable.

## 39.5 Rebuild critical

YES.

## 39.6 Exit condition

LFE is implementation-authoritative, evidence-backed, cross-checked against FCC/design requirements, and has no unresolved P0/P1 architectural blockers.

---

# 40. FRG-ENG / FORGE-ENG — Forge Engineering Canon

## 40.1 Purpose

Define the final implementation architecture for The Forge.

Likely scope includes:

- Forge application architecture;
- voxel asset authoring;
- block/item/model authoring;
- tools/armour/equipment modelling;
- entity creator;
- animation;
- structure/dungeon/building/vessel editors;
- 3D environment editing;
- validation;
- baking;
- preview/runtime simulation;
- registries;
- packaging;
- content packs;
- developer/player permissions;
- modding/security boundaries;
- performance;
- export/ingestion into runtime.

## 40.2 Depends on

- PRD closure;
- FCC-13/14 content identity;
- Sets 21–23;
- Set 33 and other relevant post-30 constraints;
- ENG-GOV/B-OPS;
- shared LFE boundaries.

## 40.3 Blocks

- final Forge implementation plan;
- global V1 audit;
- production rebuild where Forge infrastructure is foundational.

## 40.4 Rebuild critical

YES.

## 40.5 Exit condition

Forge engineering is implementation-authoritative and cross-compatible with LFE and final content/registry authority.

---

# 41. P7 — Global V1 Reconciliation

## 41.1 Purpose

Convert the complete rebuild-critical corpus from accumulated development documents into a clean, reconciled, implementation-authoritative V1.

## 41.2 Inputs

At minimum:

- Sets 00–30;
- rebuild-required Set 31–42 content;
- FCC;
- PRD;
- ENG-GOV/B-OPS where applicable;
- LFE;
- FRG-ENG;
- registries;
- relevant research/evidence;
- accepted ADRs;
- authoritative Brain indexes/maps.

## 41.3 Audit programme

Branch C owns exact methodology. D-ROAD-01 recognises the following production stages:

1. Corpus freeze candidate.
2. Master inventory.
3. Authority audit.
4. Canon reconciliation.
5. Terminology audit.
6. Stable-ID/identity audit.
7. Registry reconciliation.
8. Cross-family systems audit.
9. Requirements/implementation traceability audit.
10. Save/migration/version audit.
11. Performance/scalability audit.
12. Multiplayer/authority audit.
13. Forge/security/modding audit.
14. Accessibility/UX architecture audit where rebuild-relevant.
15. Completeness/edge-case audit.
16. V1 clean rewrite pass.
17. Inter-document dependency/link audit.
18. Final certification.

## 41.4 Blocks

Rebuild authorisation.

## 41.5 Rebuild critical

YES.

## 41.6 Exit condition

> **LEYFORGE DOCUMENTATION V1.0 LOCKED**

with all required audit evidence and unresolved exceptions explicitly governed.

---

# 42. P8 — Rebuild Preparation

## 42.1 Purpose

Turn V1 authority into an executable implementation programme.

## 42.2 Work products

- implementation dependency graph;
- module/component boundaries;
- initial build sequence;
- vertical-slice plan;
- issue/backlog structure;
- testing matrix;
- benchmark matrix;
- regression gates;
- CI plan;
- migration/legacy-access plan;
- initial registry bootstrap;
- repository cutover;
- agent implementation bootstrap;
- acceptance criteria for first production milestones.

## 42.3 Depends on

- final technical canon;
- V1 audit closure;
- Branch B operational readiness;
- P3 repository infrastructure.

## 42.4 Rebuild critical

YES.

## 42.5 Exit condition

D-ROAD-05 can certify rebuild readiness.

---

# 43. P9 — Clean Leyforge Rebuild

## 43.1 Entry rule

The rebuild begins only after the formal rebuild gate passes.

## 43.2 Initial conceptual phases

Final order belongs to D-ROAD-06 and must not be frozen here.

Conceptual work families include:

- repository/build bootstrap;
- engine/voxel foundation;
- registry kernel;
- persistence;
- world streaming;
- world generation;
- simulation kernel;
- player/runtime interaction;
- gameplay systems;
- Forge foundation;
- representative vertical slices;
- automated regression;
- performance gates;
- progressive content integration.

## 43.3 Important rule

P9 is **not** the end of documentation.

Once implementation begins:

- code changes create work logs;
- architecture changes create governed decisions;
- new reusable techniques create Skills/Procedures;
- failures create antipattern/failure records;
- documentation evolves through controlled post-V1 revisions.

---

# 44. Parallel Work Model

The recommended high-level concurrency model is:

```text
                   FCC-14
                     │
         ┌───────────┼───────────┐
         ▼           ▼           ▼
      B-OPS       BRANCH C    BRANCH D
         │           │           │
         └──────┬────┴─────┬─────┘
                │          │
                ▼          ▼
          CODEX BOOTSTRAP  PRD-01+
                │          │
                │       PRD-02/03
                │          │
                │       PRD-04–09
                │          │
                └────┬─────┘
                     ▼
                LFE + FRG-ENG
                     │
                     ▼
                 V1 AUDIT
                     │
                     ▼
               REBUILD PREP
                     │
                     ▼
                  REBUILD
```

This is a model, not a substitute for D-ROAD-03.

---

# 45. Major Hard Dependencies

The following dependencies are treated as hard unless an owning authority explicitly changes them.

| Downstream work | Hard predecessor |
|---|---|
| Final content-canon closure | FCC-14 |
| Codex governance-aware bootstrap | ENG-GOV + required B-OPS subset |
| PRD-01 | PRD-00 |
| PRD-04 | PRD-01–03 evidence |
| PRD-07 | risk/proof programme |
| PRD-09 | PRD-00–08 |
| Final LFE freeze | sufficient PRD closure/evidence |
| Final FRG-ENG freeze | sufficient PRD + Forge/content identity |
| Global V1 certification | complete rebuild-critical corpus |
| D-ROAD-05 rebuild pass | V1 certification + implementation preparation |
| Clean rebuild | rebuild gate passed |

---

# 46. Things That Must Not Become Artificial Hard Dependencies

Unless later evidence proves otherwise, Branch D must not automatically require:

- every future DLC idea;
- Set 43+;
- every shipping/storefront detail;
- every final UI polish decision;
- every final community/workshop operation;
- every release-support workflow;
- final implementation of multiplayer itself;

before the first clean production rebuild can begin.

Architecture may need to accommodate these systems without their full final implementation blocking P9.

---

# 47. Rebuild Readiness Domains

D-ROAD-05 will eventually certify readiness across these domains:

1. **Canon**
2. **Authority**
3. **Engineering governance**
4. **Agent operations**
5. **Repository infrastructure**
6. **Evidence / PRD**
7. **Voxel/runtime feasibility**
8. **Architecture**
9. **Forge architecture**
10. **Stable identity / registries**
11. **Persistence / migration**
12. **Multiplayer-ready authority**
13. **Performance/scalability**
14. **Testing / benchmarks**
15. **V1 documentation**
16. **Implementation sequencing**
17. **Legacy preservation**
18. **Traceability**

No single green domain can compensate for a red hard-gate domain.

---

# 48. Current Critical-Path Assessment

As of 30 August 2026, the most important active path is:

```text
FCC-14 ACTIVE
      │
      ├──────────────┐
      │              │
      ▼              ▼
B-OPS ACTIVE    BRANCH C ACTIVE
      │              │
      └──────┬───────┘
             ▼
      CODEX BOOTSTRAP
             │
             ├─────────────┐
             │             │
             ▼             ▼
        PRD-01 → 09   CONTROL SYSTEMS
             │
             ▼
        LFE + FRG-ENG
             │
             ▼
         GLOBAL V1
             │
             ▼
      REBUILD PREPARATION
             │
             ▼
          REBUILD
```

Branch D itself should soon leave active construction mode and enter maintenance mode after D-ROAD-00–05 are established.

---

# 49. Near-Term Recommended Sequence

The near-term production order is:

```text
1. Continue FCC-14.
2. Continue Branch B B-OPS.
3. Continue Branch C audit-framework build.
4. Complete Branch D D-ROAD-00–05.
5. Finish the minimum Branch B controls required for Codex bootstrap.
6. Execute Codex Bootstrap Phase 1:
   - Brain
   - schemas/templates
   - AGENTS
   - Brain Doctor
   - work/handoff systems
   - Git/CI controls
   - archive/rebuild branch preparation
7. Begin/continue PRD-01 and downstream discovery.
8. Execute required hostile prototypes and benchmarks.
9. Close PRD-09.
10. Build LFE and FRG-ENG.
11. Reconcile rebuild-required post-30 architecture/design.
12. Run Branch C global V1 audit.
13. Lock Leyforge Documentation V1.0.
14. Create D-ROAD-06 from actual final architecture.
15. Complete rebuild-preparation backlog and tests.
16. Pass D-ROAD-05.
17. Authorise clean rebuild.
```

Parallelism is expected throughout this sequence.

---

# 50. Branch D Maintenance Triggers

D-ROAD-01 should only be structurally revised when one of the following occurs:

- a new major workstream is created;
- a major workstream is removed;
- authority ownership changes;
- a previously non-critical programme becomes rebuild-critical;
- a critical dependency changes;
- rebuild entry criteria materially change;
- PRD/LFE evidence invalidates the current programme structure.

Normal progress updates belong in D-ROAD-02.

---

# 51. Acceptance Criteria for D-ROAD-01 v0.1

D-ROAD-01 v0.1 is ready to lock when:

- [x] the entire pre-rebuild programme is represented;
- [x] foundation, FCC, control infrastructure, PRD, post-30, technical canon, V1 audit, rebuild prep and rebuild are included;
- [x] Branch A/B/C/D responsibilities are separated;
- [x] Codex bootstrap is represented as its own production phase;
- [x] legacy POC is preserved as evidence rather than current architecture;
- [x] FCC-14 is represented as the active final-content step;
- [x] PRD-00–09 are represented in sequence;
- [x] LFE and FRG-ENG are represented as post-discovery technical canon;
- [x] Sets 31–42 are classified as potentially partial/conditional rebuild dependencies rather than automatically all-or-nothing blockers;
- [x] Set 43+ is excluded from the base rebuild gate unless architecture requires otherwise;
- [x] global V1 certification is a hard pre-rebuild gate;
- [x] implementation planning is separated from architecture design;
- [x] D-ROAD-06 is explicitly deferred;
- [x] current critical-path logic is visible;
- [x] parallel work is explicitly supported.

---

# 52. Immediate Handoff

After D-ROAD-01 is accepted:

> **Begin D-ROAD-02 — Current State & Milestone Register v0.1.**

D-ROAD-02 will become the live, compact control page showing:

- every active major workstream;
- current status;
- latest completed milestone;
- next milestone;
- blockers;
- gate state;
- rebuild-readiness impact;
- last update.

That document will answer the day-to-day question:

> **“Where the hell are we now?”**
