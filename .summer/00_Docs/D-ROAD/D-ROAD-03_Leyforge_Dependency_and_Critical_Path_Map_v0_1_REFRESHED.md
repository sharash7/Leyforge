# Leyforge Branch D — Production / Rebuild Roadmap

## D-ROAD-03 — Dependency / Critical-Path Map

**Version:** 0.1  
**Date:** 30 August 2026  
**Status:** Initial Dependency / Critical-Path Map  
**Branch:** D — Production / Rebuild Roadmap  
**Authority:** D-ROAD-00 — Roadmap Authority & Operating Rules  
**Structure Source:** D-ROAD-01 — Master Production Path  
**Live State Source:** D-ROAD-02 — Current State & Milestone Register  
**Purpose:** Define Leyforge's dependency types, hard blockers, safe parallel work, critical-path nodes, conditional dependencies, and rebuild-entry dependency chain.

---

# 1. Purpose

D-ROAD-03 exists to prevent two major planning failures:

1. **Artificial serialisation** — waiting for work that does not actually block the next task.
2. **Premature progression** — starting downstream work before a real dependency has been satisfied.

This document therefore distinguishes:

- hard dependencies;
- soft dependencies;
- authority dependencies;
- evidence dependencies;
- data/interface dependencies;
- certification dependencies;
- implementation-order dependencies;
- conditional dependencies;
- non-dependencies.

---

# 2. Core Rule

> **A dependency exists only when downstream work cannot be safely completed, locked, certified, or implemented without the upstream output.**

Convenience is not dependency.

Habit is not dependency.

“Usually done first” is not dependency.

A dependency must have a reason.

---

# 3. Dependency Types

## 3.1 HARD — Hard Dependency

Downstream work must not pass its exit gate without the upstream dependency.

Example:

```text
PRD-09
  HARD depends on
PRD-00→08
```

A hard dependency may still allow exploratory downstream work, but not final lock/certification.

---

## 3.2 AUTH — Authority Dependency

Downstream work requires an authoritative decision or contract from another owner.

Example:

```text
FRG-ENG stable-ID ingestion
  AUTH depends on
FCC-13 / FCC-14 identity authority
```

The downstream owner may not invent the missing authority.

---

## 3.3 EVID — Evidence Dependency

Downstream architecture or certification requires proof, benchmark, research, or prototype evidence.

Example:

```text
Final LFE voxel ownership
  EVID depends on
PRD-02 + PRD-07/08 evidence
```

---

## 3.4 DATA — Interface / Data Dependency

Downstream work requires a schema, registry contract, identity model, or interface definition.

Example:

```text
Persistence design
  DATA depends on
stable-ID and registry contracts
```

---

## 3.5 CERT — Certification Dependency

The work may be written earlier, but cannot be declared final until another audit/certification passes.

Example:

```text
Global V1 lock
  CERT depends on
Branch C final audit
```

---

## 3.6 SOFT — Soft Dependency

Upstream work materially improves downstream quality or reduces rework, but does not block progress.

Example:

```text
D-ROAD-04
  SOFT depends on
latest D-ROAD-02 state
```

---

## 3.7 COND — Conditional Dependency

Dependency applies only to a defined subset or if a condition becomes true.

Example:

```text
Set 38 — Dedicated Servers
  COND blocks rebuild
only where server-authority architecture constrains LFE
```

---

## 3.8 ORDER — Implementation-Order Dependency

Relevant only after implementation begins.

Example:

```text
World generation runtime
  ORDER depends on
registry + voxel/runtime foundation
```

D-ROAD-03 records only high-level future ORDER relationships. D-ROAD-06 will own the detailed implementation order.

---

## 3.9 NON — Explicit Non-Dependency

A relationship that might appear sequential but must not be treated as blocking.

Example:

```text
Set 42 final storefront/release work
  NON dependency for
initial clean rebuild authorisation
```

unless a platform constraint later becomes architecture-critical.

---

# 4. Dependency Strength Scale

For control purposes:

| Level | Meaning |
|---|---|
| **D0** | No dependency |
| **D1** | Informational / useful context |
| **D2** | Soft dependency |
| **D3** | Conditional or subset dependency |
| **D4** | Hard dependency for lock/certification |
| **D5** | Hard dependency for any safe downstream execution |

Most Leyforge pre-rebuild dependencies should be D2–D4.

D5 should be rare.

---

# 5. Master Critical-Path Spine

```text
P0 FOUNDATION / EXISTING CORPUS
        │
        ▼
P1 FINAL CONTENT CANON
        │
        ├──────────────┐
        │              │
        ▼              ▼
P2 BRANCH B        P2 BRANCH C
ENG GOVERNANCE     AUDIT FRAMEWORK
        │              │
        ├───────┬──────┘
        │       │
        ▼       ▼
P3 CODEX      P4 PRD
BOOTSTRAP     DISCOVERY
        │       │
        │       ▼
        │    PRD-09
        │       │
        └───┬───┘
            ▼
       P6 TECHNICAL CANON
       LFE + FRG-ENG
            │
            ▼
 P5 REBUILD-REQUIRED POST-30
        CONTRACT CLOSURE
            │
            ▼
      P7 GLOBAL V1 AUDIT
            │
            ▼
      P8 REBUILD PREP
            │
            ▼
      D-ROAD-05 PASS
            │
            ▼
         P9 REBUILD
```

This is the **control spine**, not a claim that all work must happen strictly one after another.

---

# 6. Current Critical-Path Nodes

As of the current Branch D state, the following are treated as critical-path nodes:

| Node | Why critical | Current position |
|---|---|---|
| FCC-14 | closes final content canon needed downstream | ACTIVE |
| Required B-OPS subset | enables governed Codex/agent operations | ACTIVE |
| PRD-01→09 | closes technical unknowns and proof work | EARLY |
| LFE | final runtime architecture | NOT STARTED |
| FRG-ENG | final Forge architecture | NOT STARTED |
| rebuild-required Sets 31–42 subsets | constrain final architecture / V1 | NOT FULLY CLASSIFIED |
| Branch C final audit | certifies V1 corpus | FRAMEWORK ACTIVE |
| implementation preparation | converts V1 into executable plan | GATED |
| D-ROAD-05 | formal rebuild-authorisation instrument | COMPLETE v0.1 / future execution pending |

---

# 7. Branch-Level Dependency Map

```text
BRANCH A
Project Brain design
    │
    └──► P3 physical Brain bootstrap
              │
              └──► production-scale agent work

BRANCH B
ENG-GOV
    │
    └──► B-OPS
           │
           ├──► P3 Codex bootstrap
           ├──► governed PRD execution
           ├──► governed LFE / FRG-ENG writing
           └──► governed rebuild

BRANCH C
Audit framework
    │
    └──► final V1 audit execution
              │
              └──► V1 certification
                        │
                        └──► rebuild preparation / authorisation

BRANCH D
D-ROAD-00→05
    │
    └──► production control / gate visibility
              │
              └──► D-ROAD-05 final rebuild decision
```

---

# 8. Branch A Dependencies

## 8.1 Brain design

**Depends on:** none of the final technical canon.

**Status:** complete/locked for current purposes.

**Non-dependency:** LFE and FRG-ENG are not prerequisites for designing the Brain.

## 8.2 Physical Brain bootstrap

**HARD/AUTH depends on:**

- Branch A locked design;
- ENG-GOV;
- required B-OPS operational rules.

**SOFT depends on:**

- current Branch C traceability/audit metadata expectations;
- current D-ROAD state fields.

**Does not need to wait for:**

- PRD-09;
- LFE;
- FRG-ENG;
- final V1 audit.

---

# 9. Branch B Dependencies

## 9.1 ENG-GOV

Foundation authority for engineering governance.

No current upstream blocker.

## 9.2 B-OPS

**HARD depends on:** ENG-GOV.

**Blocks:**

- full governed Codex bootstrap;
- production agent contracts;
- engineering work logs/templates;
- repeatable enforcement/validation.

**NON dependency:**

B-OPS does not require FCC-14 completion to continue.

---

# 10. Branch C Dependencies

## 10.1 Audit methodology/framework

May be built now.

**SOFT depends on:**

- current corpus structure;
- Branch A metadata concepts;
- Branch B engineering authority;
- Branch D roadmap/gate concepts.

## 10.2 Final audit execution

**HARD/CERT depends on:**

- rebuild-critical source corpus being audit-candidate;
- FCC closure;
- PRD finality where PRD is part of V1 authority;
- LFE;
- FRG-ENG;
- required post-30 documents;
- registries;
- authority maps.

**Does not require:**

- implementation to have already begun.

---

# 11. Branch D Dependencies

## 11.1 D-ROAD-00

No upstream dependency beyond accepted project authority model.

## 11.2 D-ROAD-01

**SOFT depends on:** latest known project structure.

## 11.3 D-ROAD-02

**SOFT depends on:** latest branch/workstream statuses.

## 11.4 D-ROAD-03

**Depends on:** D-ROAD-00→02.

## 11.5 D-ROAD-04

**HARD depends on:** D-ROAD-03 dependency model.

## 11.6 D-ROAD-05

**HARD depends on:** D-ROAD-04 gate structure.

## 11.7 D-ROAD-06

**HARD depends on:**

- PRD maturity;
- LFE;
- FRG-ENG;
- V1 findings;
- final registry/persistence constraints.

**Intentionally blocked now.**

---

# 12. FCC Dependency Map

```text
Realm FCC corpus
      │
      ▼
   FCC-12
      │
      ▼
   FCC-13
      │
      ▼
   FCC-14
      │
      ├──► final registry reconciliation
      ├──► PRD delta reconciliation
      ├──► LFE content-facing contracts
      ├──► FRG-ENG content-authoring contracts
      └──► Branch C final V1 audit
```

## 12.1 PRD overlap rule

PRD-01 may begin before FCC-14 closes.

Dependency type:

**COND/AUTH**

Meaning:

- PRD may extract known requirements now;
- unresolved FCC-owned fields remain provisional;
- PRD final closure must consume FCC-14 final deltas.

---

# 13. PRD Dependency Graph

```text
PRD-00
  │
  ▼
PRD-01
  │
  ├───────────────┐
  ▼               ▼
PRD-02          PRD-03
  │               │
  └───────┬───────┘
          ▼
       PRD-04
          │
          ▼
       PRD-05
          │
          ▼
       PRD-06
          │
          ▼
       PRD-07
          │
          ▼
       PRD-08
          │
          ▼
       PRD-09
```

---

# 14. PRD Detailed Dependencies

## PRD-00 → PRD-01

Type: **HARD/AUTH**

Reason: PRD-01 must know what sources exist and what authority class they hold.

Strength: D4.

---

## PRD-01 → PRD-02 / PRD-03

Type: **HARD for complete scope; SOFT for early exploration**

Reason: technology audits must test against actual Leyforge requirements.

Strength: D3–D4.

---

## PRD-02 + PRD-03 → PRD-04

Type: **HARD/EVID**

Reason: architecture ownership should be based on actual platform/plugin capabilities.

Strength: D4.

---

## PRD-04 → PRD-05

Type: **HARD/DATA**

Reason: evidence crosswalk needs defined architectural claims/boundaries.

Strength: D4.

---

## PRD-05 → PRD-06

Type: **HARD/EVID**

Reason: technical risks must reference claims and evidence gaps.

Strength: D4.

---

## PRD-06 → PRD-07

Type: **HARD**

Reason: hostile prototypes should be selected from actual risk/proof requirements.

Strength: D5 for final programme.

---

## PRD-07 → PRD-08

Type: **HARD/EVID**

Reason: PRD-08 records prototype outcomes.

Strength: D5.

---

## PRD-08 → PRD-09

Type: **HARD/CERT**

Reason: discovery closure cannot precede required proof results.

Strength: D5.

---

# 15. PRD → LFE / FRG-ENG Dependencies

## 15.1 Early drafting

LFE and FRG-ENG may begin exploratory outlines before PRD-09 if useful.

Dependency:

**SOFT / provisional**

## 15.2 Final technical lock

LFE and FRG-ENG final implementation-authoritative freeze:

**HARD/EVID depends on PRD maturity and closure.**

At minimum:

- relevant unknowns resolved;
- technology boundaries tested;
- major risk proofs complete;
- architecture ownership supported;
- unresolved exceptions explicit.

---

# 16. LFE Internal Dependency Families

This is not the final implementation order.

It records conceptual architecture dependency families.

```text
Requirements / evidence
        │
        ▼
Runtime ownership boundaries
        │
        ├──► Voxel integration
        ├──► Registry boundaries
        ├──► Persistence ownership
        ├──► Simulation ownership
        └──► Forge/runtime interfaces
                 │
                 ▼
           Cross-system architecture
                 │
                 ▼
        Performance / determinism /
        multiplayer / testing closure
```

Key hard relationships:

- persistence depends on stable identity contracts;
- multiplayer-ready authority depends on deterministic state ownership;
- worldgen depends on voxel/runtime ownership decisions;
- near/far simulation depends on authoritative state model;
- save/migration architecture depends on versioned identity/schema rules.

---

# 17. FRG-ENG Internal Dependency Families

```text
Final content identity
      │
      ▼
Authoring object model
      │
      ├──► model/block/item tools
      ├──► structure/world editors
      ├──► entity creator
      ├──► animation
      ├──► validation/baking
      └──► packaging/security
               │
               ▼
         runtime ingestion
               │
               ▼
      LFE shared interface closure
```

Hard relationships include:

- Forge-authored content requires canonical identity/registry semantics;
- packaging requires version/security rules;
- runtime preview requires LFE-compatible execution contracts;
- player/mod content requires permission/security policy.

---

# 18. LFE ↔ FRG-ENG Shared Dependencies

LFE and FRG-ENG should be developed in parallel once shared boundaries are stable.

They must reconcile:

- content identity;
- registry loading;
- runtime/editor separation;
- preview simulation;
- serialization;
- package/version compatibility;
- resource paths/IDs;
- validation;
- permissions/security;
- mod/player-content boundaries;
- world/structure serialization;
- generated-form contracts.

Neither document family should silently invent an incompatible version of these interfaces.

Dependency type:

**BIDIRECTIONAL DATA/AUTH**

---

# 19. Post-30 Dependency Classification

The post-30 programme is not one giant hard dependency.

It must be decomposed.

---

# 20. Set 31 — Multiplayer / Networking

## Pre-rebuild dependency

**COND/AUTH**

Required before final LFE freeze where it defines:

- state authority;
- identity;
- deterministic simulation;
- replication boundaries;
- server ownership;
- save/shared-world compatibility.

Full multiplayer feature completion:

**NON dependency for initial rebuild.**

---

# 21. Set 32 — Review / Hardening

## Pre-rebuild dependency

**COND/CERT**

Required where review discovers unresolved architecture or canon defects.

Final release hardening:

**NON dependency for initial rebuild.**

---

# 22. Set 33 — Forge Overhaul / Creator / Security

## Pre-rebuild dependency

**COND/AUTH → often HARD for FRG-ENG portions**

Required where it defines:

- player-created content;
- permissions;
- content validation;
- packaging;
- creator tooling scope;
- security boundaries.

---

# 23. Set 34 — Settings / Controls

## Pre-rebuild dependency

**COND/DATA**

Architecture must preserve:

- input abstraction;
- configuration persistence;
- accessibility hooks;
- device independence.

Final menu polish:

**NON dependency.**

---

# 24. Set 35 — Create Realm / Scalability

## Pre-rebuild dependency

**COND/AUTH/EVID**

Potentially high criticality because it may constrain:

- world-generation architecture;
- simulation complexity;
- hardware tiers;
- player-created worlds/realms;
- runtime scalability.

This set requires explicit classification in D-ROAD-04.

---

# 25. Set 36 — Front End / Realm Management

## Pre-rebuild dependency

**COND/DATA**

Required where it defines:

- world lifecycle;
- save-slot/world identity;
- realm creation/deletion;
- compatibility handling.

Full front-end presentation:

**NON dependency.**

---

# 26. Set 37 — Modding / Workshop

## Pre-rebuild dependency

**COND/AUTH**

Required where it defines:

- content-package boundaries;
- stable IDs;
- version compatibility;
- mod isolation;
- trust/security model.

Workshop/store integration:

**NON dependency.**

---

# 27. Set 38 — Dedicated Servers

## Pre-rebuild dependency

**COND/AUTH**

Required only for server-authority/runtime assumptions.

Operations dashboards/tooling:

**NON dependency.**

---

# 28. Set 39 — Updates / Versioning

## Pre-rebuild dependency

**COND → HARD for schema/version rules**

Required for:

- save versioning;
- migrations;
- content versioning;
- protocol/content compatibility;
- deprecation.

Store distribution workflow:

**NON dependency.**

---

# 29. Set 40 — Diagnostics / Recovery

## Pre-rebuild dependency

**COND/DATA**

Required where architecture must provide:

- structured diagnostics;
- crash/recovery hooks;
- safe save failure behaviour;
- corruption detection.

Final support tooling:

**NON dependency.**

---

# 30. Set 41 — Accessibility / Localisation

## Pre-rebuild dependency

**COND/DATA**

Required where UI/runtime architecture must support:

- scalable UI;
- remapping;
- localisation;
- captions;
- non-colour communication;
- motion/flash controls.

Final certification:

**NON dependency for initial rebuild.**

---

# 31. Set 42 — Platform / Distribution

## Pre-rebuild dependency

Default:

**NON dependency.**

Exception:

**COND** if a confirmed target-platform constraint changes architecture.

---

# 32. Set 43+

Default:

**NON dependency for initial rebuild.**

Any exception requires explicit D-ROAD change approval.

---

# 33. Registry Dependency Map

```text
FCC content identity
       │
       ▼
Stable-ID / projection rules
       │
       ├──► registry schemas
       ├──► save identity
       ├──► worldgen identity
       ├──► Forge authored content
       ├──► mod/package identity
       └──► network identity
                │
                ▼
          global V1 audit
```

Registry stability is a cross-cutting dependency.

It cannot be treated as a late implementation detail.

---

# 34. Persistence / Migration Dependency Map

```text
Stable IDs
    │
    ▼
Schema/version rules
    │
    ├──► save format
    ├──► world state
    ├──► entity state
    ├──► inventory/content state
    ├──► Forge/package compatibility
    └──► multiplayer/shared-world state
             │
             ▼
        migration strategy
             │
             ▼
       rebuild persistence plan
```

Final persistence architecture therefore depends on:

- stable identity;
- registry contracts;
- Set 39 rebuild-relevant version rules;
- LFE state ownership;
- multiplayer-ready authority assumptions.

---

# 35. P3 Codex Bootstrap Dependency Map

```text
Branch A design
      │
ENG-GOV
      │
Required B-OPS
      │
      ▼
Codex Bootstrap Phase 1
      │
      ├──► Brain files
      ├──► schemas/templates
      ├──► AGENTS
      ├──► Brain Doctor
      ├──► work logs/handoffs
      ├──► indexes/Bases
      ├──► CI/validation
      └──► legacy archive/rebuild branch prep
```

## Must not wait for

- PRD-09;
- LFE;
- FRG-ENG;
- V1 audit.

## Must not outrun

- required engineering governance and operational controls.

---

# 36. Global V1 Audit Dependency Map

```text
Rebuild-critical design corpus
        │
FCC final
        │
PRD final
        │
LFE final
        │
FRG-ENG final
        │
Registries / identities
        │
Required post-30 contracts
        │
        ▼
Branch C final audit
        │
        ▼
V1 clean rewrite / certification
        │
        ▼
LEYFORGE DOCUMENTATION V1.0 LOCKED
```

Dependency type:

**HARD/CERT**

---

# 37. Rebuild Preparation Dependencies

P8 depends on:

- V1 technical authority;
- final/accepted architecture;
- Branch B operational readiness;
- repository/bootstrap readiness;
- final registry/persistence contracts.

P8 may start exploratory backlog work earlier, but final build order and acceptance gates must come from final authority.

---

# 38. Rebuild Authorisation Dependencies

```text
CANON
  PASS
   │
ENGINEERING GOVERNANCE
  PASS
   │
PRD DISCOVERY
  PASS
   │
TECHNICAL CANON
  PASS
   │
REBUILD-REQUIRED POST-30
  PASS
   │
GLOBAL V1
  PASS
   │
REPOSITORY / AGENT INFRASTRUCTURE
  PASS
   │
IMPLEMENTATION PLAN
  PASS
   │
D-ROAD-05
  PASS
   │
   ▼
REBUILD AUTHORISED
```

No single workstream can substitute for another.

---

# 39. Safe Parallelism Matrix

Legend:

- **YES** = generally safe in parallel.
- **COND** = safe with explicit provisional fields/reconciliation.
- **NO** = avoid because of hard dependency.

| A \ B | FCC-14 | B-OPS | Branch C Framework | Branch D | Codex Bootstrap | PRD-01 | PRD-02/03 | LFE Final | FRG-ENG Final | V1 Audit |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| FCC-14 | — | YES | YES | YES | YES | COND | COND | NO | NO | NO |
| B-OPS | YES | — | YES | YES | COND | YES | YES | NO | NO | NO |
| Branch C Framework | YES | YES | — | YES | YES | YES | YES | YES | YES | — |
| Branch D | YES | YES | YES | — | YES | YES | YES | YES | YES | YES |
| Codex Bootstrap | YES | COND | YES | YES | — | YES | YES | YES | YES | YES |
| PRD-01 | COND | YES | YES | YES | YES | — | COND | NO | NO | NO |
| PRD-02/03 | COND | YES | YES | YES | YES | COND | — | COND | COND | NO |
| LFE Final | NO | NO | YES | YES | YES | NO | COND | — | YES | NO |
| FRG-ENG Final | NO | NO | YES | YES | YES | NO | COND | YES | — | NO |
| V1 Audit | NO | NO | — | YES | YES | NO | NO | NO | NO | — |

This matrix is intentionally conservative for **final lock** work.

Exploratory drafting may be more parallel than final certification.

---

# 40. Critical-Path Risk Classes

## CP-RISK-A — Direct critical-path blocker

Failure or delay directly delays rebuild authorisation.

Examples:

- FCC-14 unresolved canon blocker;
- PRD-09 incomplete;
- LFE unresolved P0/P1 issue;
- failed V1 certification.

---

## CP-RISK-B — Critical-path expansion

Discovers new work that must become part of the path.

Examples:

- PRD reveals mandatory engine prototype;
- Set 35 reveals architecture requirement;
- Branch C discovers missing canonical owner.

---

## CP-RISK-C — Rework risk

Does not immediately block progress, but continuing could create significant downstream rework.

Examples:

- Codex bootstrap before required B-OPS rules;
- FRG-ENG drafting before stable content identity;
- persistence design before stable-ID rules.

---

## CP-RISK-D — Non-critical delay

Important, but does not block initial rebuild.

Examples:

- final storefront metadata;
- final workshop launch workflow;
- optional future expansion planning.

---

# 41. Current Critical-Path Watch Register

## CPW-001 — FCC-14

**Risk class:** A/B  
**Watch:** final content certification may discover identity or cross-canon conflicts.  
**Response:** reconcile before downstream final lock.

## CPW-002 — Remaining B-OPS

**Risk class:** A/C  
**Watch:** minimum operational set required for governed Codex/bootstrap work.  
**Response:** do not let automation outrun governance.

## CPW-003 — PRD-01 unknown expansion

**Risk class:** B  
**Watch:** technical unknown inventory may create new prototype work.  
**Response:** update D-ROAD-01/03 only if new work materially changes the programme.

## CPW-004 — Zylann/Godot evidence

**Risk class:** A/B  
**Watch:** current technical direction remains subject to PRD proof.  
**Response:** architecture follows evidence, not preference.

## CPW-005 — Set 35 criticality

**Risk class:** B  
**Watch:** scalability/Create Realm requirements may be more architecture-critical than currently known.  
**Response:** classify during post-30/PRD reconciliation.

## CPW-006 — Stable identity

**Risk class:** A/C  
**Watch:** FCC-13 theoretical identity decisions must reconcile with technical registry/save/network needs.  
**Response:** certify before final technical/V1 lock.

## CPW-007 — Persistence/versioning

**Risk class:** A/C  
**Watch:** historical save architecture is evidence, not automatically the final rebuild design.  
**Response:** derive final persistence architecture through PRD/LFE/Set 39 contracts.

---

# 42. Dependency Change Rule

A new hard dependency may only be added when there is a clear reason.

Required record:

```text
DEPENDENCY CHANGE

From:
[upstream node]

To:
[downstream node]

Type:
[HARD / AUTH / EVID / DATA / CERT / SOFT / COND / ORDER]

Strength:
[D0–D5]

Reason:
[why downstream cannot safely close without upstream]

Rebuild impact:
[none / local / critical path]

Authority source:
[source or owner]

Date:
[YYYY-MM-DD]
```

This prevents the roadmap from slowly accumulating unnecessary blockers.

---

# 43. Dependency Removal Rule

A dependency may be removed when:

- evidence proves it unnecessary;
- ownership changes;
- the downstream interface is intentionally decoupled;
- the requirement is deferred beyond initial rebuild;
- the dependency was an accidental planning assumption.

Removal must preserve historical rationale.

---

# 44. Critical-Path Change Rule

A critical-path change must update:

- D-ROAD-01 if programme structure changes;
- D-ROAD-02 live state;
- D-ROAD-03 dependency map;
- D-ROAD-04 if a gate changes;
- D-ROAD-05 if rebuild readiness changes;
- Project Brain/work log once physically operational.

---

# 45. Current Critical-Path Summary

```text
CURRENT CRITICAL PATH

FCC-14
  │
  ├─────────────┐
  ▼             ▼
B-OPS        PRD-01→09
  │             │
  ▼             ▼
P3 Bootstrap   Evidence Closure
  │             │
  └──────┬──────┘
         ▼
    LFE + FRG-ENG
         │
         ▼
  Post-30 Critical Contracts
         │
         ▼
    Global V1 Audit
         │
         ▼
  Implementation Preparation
         │
         ▼
     D-ROAD-05
         │
         ▼
   CLEAN REBUILD
```

Branch C framework and Branch D remain parallel control workstreams rather than serial blockers during the early path.

---

# 46. What Can Move Immediately

Based on the current dependency model:

- FCC-14 can continue.
- B-OPS can continue.
- Branch C framework work can continue.
- Branch D can finish D-ROAD-04/05.
- PRD-01 can begin.
- Codex bootstrap preparation can continue.
- Codex physical bootstrap can begin once the minimum B-OPS governance subset is satisfied.
- PRD-02/03 can begin once PRD-01 provides enough requirements coverage.
- post-30 criticality classification can begin before final documents are written.

---

# 47. What Must Not Be Finalised Yet

The following should not be locked yet:

- D-ROAD-06 implementation sequence;
- final LFE;
- final FRG-ENG;
- final rebuild persistence architecture;
- final network/server architecture;
- final global V1 corpus;
- rebuild authorisation.

---

# 48. Acceptance Criteria for D-ROAD-03 v0.1

D-ROAD-03 is ready to lock when:

- [x] dependency types are defined;
- [x] dependency strength is defined;
- [x] master critical path is visible;
- [x] Branch A/B/C/D relationships are mapped;
- [x] FCC dependencies are mapped;
- [x] PRD-00→09 dependencies are mapped;
- [x] PRD→LFE/FRG-ENG relationship is explicit;
- [x] LFE/FRG-ENG bidirectional interface dependencies are explicit;
- [x] Sets 31–42 are decomposed into conditional/non-critical dependency roles;
- [x] registry dependencies are explicit;
- [x] persistence/version dependencies are explicit;
- [x] Codex bootstrap dependencies are explicit;
- [x] V1 audit dependencies are explicit;
- [x] rebuild authorisation dependencies are explicit;
- [x] safe parallelism is represented;
- [x] critical-path risk classes are defined;
- [x] dependency-change control is defined;
- [x] premature finalisation points are identified.

---

# 49. Immediate Handoff

After D-ROAD-03 is accepted:

> **Begin D-ROAD-04 — Production Gates & Exit Criteria v0.1.**

D-ROAD-04 will convert the dependency graph into formal project gates.

Each gate will define:

- entry state;
- mandatory predecessors;
- pass criteria;
- evidence required;
- allowable exceptions;
- authority allowed to approve exceptions;
- downstream work unlocked by the gate;
- failure state;
- re-open conditions.

D-ROAD-04 is where “probably ready” stops being a valid project status.
