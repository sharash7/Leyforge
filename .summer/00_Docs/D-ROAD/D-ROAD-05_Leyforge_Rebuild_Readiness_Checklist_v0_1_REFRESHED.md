# Leyforge Branch D — Production / Rebuild Roadmap

## D-ROAD-05 — Rebuild Readiness Checklist

**Version:** 0.1  
**Date:** 30 August 2026  
**Status:** Initial Rebuild Readiness Certification Instrument  
**Branch:** D — Production / Rebuild Roadmap  
**Authority:** D-ROAD-00 — Roadmap Authority & Operating Rules  
**Programme Source:** D-ROAD-01 — Master Production Path  
**Live State Source:** D-ROAD-02 — Current State & Milestone Register  
**Dependency Source:** D-ROAD-03 — Dependency / Critical-Path Map  
**Gate Source:** D-ROAD-04 — Production Gates & Exit Criteria  
**Purpose:** Provide the final compact certification instrument used to determine whether the clean Leyforge rebuild is authorised to begin.

---

# 1. Purpose

D-ROAD-05 answers one question:

> **Can the clean Leyforge rebuild begin now?**

The answer is binary:

- **REBUILD AUTHORITY: YES**
- **REBUILD AUTHORITY: NO**

D-ROAD-05 does not replace D-ROAD-04.

- D-ROAD-04 defines each production gate.
- D-ROAD-05 verifies that the required gates and readiness domains have actually passed.

---

# 2. Certification Rule

The rebuild may be authorised only when:

1. every mandatory rebuild gate is PASS or validly PASS WITH APPROVED EXCEPTION;
2. every hard-blocking readiness domain is PASS;
3. no unresolved P0/P1 blocker exists;
4. no unresolved authority contradiction exists;
5. no architecture-critical unknown remains disguised as an assumption;
6. required evidence is linked;
7. required repository/agent infrastructure is operational;
8. the implementation programme is ready;
9. the result is recorded in D-ROAD-02.

If any mandatory condition fails:

> **REBUILD AUTHORITY: NO**

---

# 3. Readiness States

Every checklist item uses one of:

- **PASS**
- **PASS WITH APPROVED EXCEPTION**
- **IN PROGRESS**
- **BLOCKED**
- **FAIL**
- **NOT APPLICABLE**
- **NOT YET ASSESSED**

Only PASS and approved exceptions count as satisfied.

---

# 4. Severity Classes

## P0 — Stop

Critical contradiction or missing authority that makes rebuild authorisation invalid.

Examples:

- no implementation-authoritative architecture;
- stable-ID collision;
- contradictory save identity rules;
- unresolved authority inversion;
- required engineering governance missing.

P0 always blocks rebuild.

## P1 — Critical

Major unresolved issue likely to invalidate architecture, implementation sequencing, persistence, multiplayer authority, registries, or V1 integrity.

P1 blocks rebuild.

## P2 — Major but bounded

Important issue that may be allowed only with explicit owning-authority approval and documented containment.

## P3 — Minor

Does not affect rebuild correctness or foundational architecture.

## P4 — Cosmetic / later production

Does not block initial rebuild.

---

# 5. Section A — Authority & Governance

## A1 — Authority model

- [ ] Authoritative source families are identified.
- [ ] Branch A/B/C/D ownership is unambiguous.
- [ ] FCC authority is unambiguous.
- [ ] PRD authority/evidence role is unambiguous.
- [ ] LFE authority is unambiguous.
- [ ] FRG-ENG/FORGE-ENG authority is unambiguous.
- [ ] registries have clear semantic/technical owners.
- [ ] no lower authority silently overrides a higher authority.

**Required gate:** G0/G2/G8  
**Current state:** IN PROGRESS  
**Blocking severity if failed:** P0

---

## A2 — Engineering governance

- [ ] ENG-GOV-00→15 locked.
- [ ] required B-OPS operational subset complete.
- [ ] ADR/change-control system operational.
- [ ] engineering risk model operational.
- [ ] testing/verification rules operational.
- [ ] save/migration governance operational.
- [ ] agent engineering behaviour governed.
- [ ] no missing operational rule blocks production Codex work.

**Required gate:** G2  
**Current state:** IN PROGRESS  
**Blocking severity if failed:** P0

---

# 6. Section B — Content Canon & Stable Identity

## B1 — Final content canon

- [ ] required realm FCC canon closed.
- [ ] FCC-12 fully consumed/certified.
- [ ] FCC-13 fully consumed/certified.
- [ ] FCC-14 complete.
- [ ] no unresolved P0/P1 content contradiction.
- [ ] superseded content identities dispositioned.
- [ ] downstream technical consumers use final content authority.

**Required gate:** G1  
**Current state:** IN PROGRESS  
**Blocking severity if failed:** P0/P1

---

## B2 — Stable IDs / identity model

- [ ] stable-ID architecture certified.
- [ ] namespace rules certified.
- [ ] Block/Object/Item projection model certified.
- [ ] generated-form identity rules certified.
- [ ] aliases/migration semantics defined.
- [ ] duplicate legacy identities reconciled.
- [ ] save/network/registry identity uses canonical stable IDs.
- [ ] no unresolved identity collision exists.

**Required gates:** G1/G6/G8  
**Current state:** IN PROGRESS  
**Blocking severity if failed:** P0

---

# 7. Section C — Project Control Infrastructure

## C1 — Project Brain design

- [ ] Brain architecture locked.
- [ ] authority/navigation model locked.
- [ ] work-log model locked.
- [ ] skills/procedures/failures model locked.
- [ ] audit/traceability navigation supported.

**Required gate:** G3  
**Current state:** PASS  
**Blocking severity if failed:** P1

---

## C2 — Project Brain physical bootstrap

- [ ] Brain directory exists in repository.
- [ ] Markdown schemas/templates installed.
- [ ] indexes/Bases operational.
- [ ] work-log system operational.
- [ ] handoff system operational.
- [ ] skills/procedures capture operational.
- [ ] Brain Doctor/validation operational.
- [ ] authority links functional.

**Required gate:** G4  
**Current state:** NOT YET ASSESSED  
**Blocking severity if failed:** P1

---

## C3 — Branch D control system

- [x] D-ROAD-00 exists.
- [x] D-ROAD-01 exists.
- [x] D-ROAD-02 exists.
- [x] D-ROAD-03 exists.
- [x] D-ROAD-04 exists.
- [x] D-ROAD-05 exists.
- [ ] D-ROAD-02 refreshed immediately before rebuild.
- [ ] no unresolved critical-path inconsistency exists.

**Required gate:** G3/G10  
**Current state:** PASS FOR DESIGN / FINAL REFRESH REQUIRED LATER  
**Blocking severity if failed:** P1

---

# 8. Section D — Repository / Agent Bootstrap

## D1 — Repository baseline

- [ ] existing Git history preserved.
- [ ] legacy implementation tagged/frozen.
- [ ] legacy archive branch prepared.
- [ ] clean rebuild branch/worktree prepared.
- [ ] old implementation is not mixed into the active rebuild architecture.
- [ ] historical tests/evidence remain accessible.
- [ ] authoritative documentation lives in governed locations.

**Required gate:** G4  
**Current state:** NOT YET ASSESSED  
**Blocking severity if failed:** P1

---

## D2 — Agent bootstrap

- [ ] root AGENTS instructions installed.
- [ ] local AGENTS layering rules installed where needed.
- [ ] agents must read relevant authority before consequential work.
- [ ] agents cannot silently override canon.
- [ ] work logs/handoffs are required.
- [ ] ADR escalation path exists.
- [ ] reusable skills/procedures are captured.
- [ ] validation runs before completion.
- [ ] agent bootstrap test passes.

**Required gate:** G4/G9  
**Current state:** NOT YET ASSESSED  
**Blocking severity if failed:** P1

---

## D3 — Git / CI / validation

- [ ] repository validation baseline exists.
- [ ] document/schema validation exists.
- [ ] registry validation exists.
- [ ] test runner baseline exists.
- [ ] CI failure semantics are clear.
- [ ] no production work can silently bypass required checks.
- [ ] benchmark hooks exist for critical systems.

**Required gate:** G4/G9  
**Current state:** NOT YET ASSESSED  
**Blocking severity if failed:** P1

---

# 9. Section E — PRD Discovery & Technical Evidence

## E1 — Requirements & unknowns

- [ ] PRD-01 complete.
- [ ] rebuild-critical technical requirements extracted.
- [ ] unknowns classified.
- [ ] assumptions distinguished from evidence.
- [ ] unresolved FCC-owned fields reconciled before closure.

**Required gate:** G5  
**Current state:** NOT YET ASSESSED  
**Blocking severity if failed:** P1

---

## E2 — Technology audits

- [ ] PRD-02 voxel/Zylann audit complete.
- [ ] PRD-03 Godot/supporting-tech audit complete.
- [ ] plugin/fork boundaries understood.
- [ ] known limitations recorded.
- [ ] required replacement/custom systems identified.

**Required gate:** G5  
**Current state:** NOT YET ASSESSED  
**Blocking severity if failed:** P1

---

## E3 — Architecture boundaries

- [ ] PRD-04 complete.
- [ ] Godot ownership explicit.
- [ ] voxel plugin/fork ownership explicit.
- [ ] Leyforge runtime ownership explicit.
- [ ] Forge ownership explicit.
- [ ] persistence ownership explicit.
- [ ] registry ownership explicit.
- [ ] multiplayer/server authority boundaries explicit.

**Required gate:** G5  
**Current state:** NOT YET ASSESSED  
**Blocking severity if failed:** P0/P1

---

## E4 — Evidence / risk / prototypes

- [ ] PRD-05 evidence crosswalk complete.
- [ ] PRD-06 risk/proof register complete.
- [ ] PRD-07 hostile prototypes executed.
- [ ] PRD-08 results recorded.
- [ ] critical benchmark thresholds recorded.
- [ ] rejected approaches recorded.
- [ ] risk exceptions explicitly governed.

**Required gate:** G5  
**Current state:** NOT YET ASSESSED  
**Blocking severity if failed:** P1

---

## E5 — Discovery closure

- [ ] PRD-09 passed.
- [ ] no architecture-critical unknown remains unresolved.
- [ ] all required proof levels reached.
- [ ] bounded exceptions are explicitly recorded.

**Required gate:** G5  
**Current state:** NOT YET ASSESSED  
**Blocking severity if failed:** P0/P1

---

# 10. Section F — Runtime Technical Canon

## F1 — LFE completeness

- [ ] runtime architecture authoritative.
- [ ] voxel integration architecture authoritative.
- [ ] world streaming architecture authoritative.
- [ ] worldgen architecture authoritative.
- [ ] simulation authority model authoritative.
- [ ] near/far simulation authoritative.
- [ ] persistence/save/migration authoritative.
- [ ] registry runtime contracts authoritative.
- [ ] entity lifecycle authoritative.
- [ ] threading/jobs architecture authoritative.
- [ ] determinism rules authoritative.
- [ ] multiplayer-ready authority authoritative.
- [ ] performance/scalability architecture authoritative.
- [ ] diagnostics/testability interfaces authoritative.

**Required gate:** G6  
**Current state:** NOT YET ASSESSED  
**Blocking severity if failed:** P0

---

# 11. Section G — Forge Technical Canon

## G1 — FRG-ENG/FORGE-ENG completeness

- [ ] Forge application architecture authoritative.
- [ ] Voxel Asset Forge architecture authoritative.
- [ ] block/item/model authoring architecture authoritative.
- [ ] tools/armour/equipment creation authoritative.
- [ ] entity creator authoritative.
- [ ] animation architecture authoritative.
- [ ] structure/dungeon/building/vessel editors authoritative.
- [ ] 3D environment editor authoritative.
- [ ] validation/baking authoritative.
- [ ] preview/runtime simulation authoritative.
- [ ] registry integration authoritative.
- [ ] content packaging authoritative.
- [ ] permission/security boundaries authoritative.
- [ ] player/mod content boundaries authoritative.

**Required gate:** G6  
**Current state:** NOT YET ASSESSED  
**Blocking severity if failed:** P0/P1

---

## G2 — LFE ↔ Forge shared interfaces

- [ ] shared content identity is consistent.
- [ ] runtime ingestion contract is consistent.
- [ ] serialization contract is consistent.
- [ ] package/version compatibility is consistent.
- [ ] preview/runtime behaviour is coherent.
- [ ] permissions/security assumptions are coherent.
- [ ] world/structure serialization is coherent.
- [ ] generated-form contracts are coherent.

**Required gate:** G6  
**Current state:** NOT YET ASSESSED  
**Blocking severity if failed:** P0

---

# 12. Section H — Rebuild-Critical Sets 31–42

## H1 — Set 31 Multiplayer / Shared Worlds

- [ ] state authority contract defined.
- [ ] deterministic/shared-state constraints defined.
- [ ] network identity constraints defined.
- [ ] save/shared-world compatibility constraints defined.

**Required gate:** G7  
**Current state:** NOT YET ASSESSED  
**Blocking severity if failed:** P1 if architecture-relevant

---

## H2 — Set 32 Whole-Game Review

- [ ] rebuild-critical review findings dispositioned.
- [ ] no unresolved whole-game architecture defect remains.

**Required gate:** G7  
**Current state:** NOT YET ASSESSED

---

## H3 — Set 33 Forge Overhaul / Security / Player Content

- [ ] Forge constraints supplied to FRG-ENG.
- [ ] player-created-content trust boundaries defined.
- [ ] validation/security requirements defined.
- [ ] package/permission requirements defined.

**Required gate:** G7  
**Current state:** NOT YET ASSESSED

---

## H4 — Set 34 Settings / Controls

- [ ] configuration persistence contract defined.
- [ ] input abstraction contract defined.
- [ ] remapping/device-independence supported.
- [ ] accessibility hooks preserved.

**Required gate:** G7  
**Current state:** NOT YET ASSESSED

---

## H5 — Set 35 Create Realm / Scalability

- [ ] realm/world creation architecture constraints defined.
- [ ] simulation-complexity scaling defined.
- [ ] hardware-tier constraints defined.
- [ ] low-end scalability requirements represented.
- [ ] worldgen/runtime architecture supports required variability.

**Required gate:** G7  
**Current state:** NOT YET ASSESSED  
**Blocking severity if failed:** P1

---

## H6 — Set 36 Front End / Realm Management

- [ ] world lifecycle contract defined.
- [ ] realm/world identity defined.
- [ ] create/load/delete/compatibility semantics defined.
- [ ] persistence interface requirements supplied to LFE.

**Required gate:** G7  
**Current state:** NOT YET ASSESSED

---

## H7 — Set 37 Modding / Community Content

- [ ] mod/content package boundaries defined.
- [ ] stable-ID compatibility defined.
- [ ] version compatibility defined.
- [ ] security/trust boundaries defined.

**Required gate:** G7  
**Current state:** NOT YET ASSESSED

---

## H8 — Set 38 Dedicated Servers

- [ ] server-authority assumptions defined if required.
- [ ] runtime architecture is not hostile to future dedicated-server operation.

**Required gate:** G7 if applicable  
**Current state:** NOT YET ASSESSED

---

## H9 — Set 39 Updates / Versioning

- [ ] save schema versioning defined.
- [ ] migrations defined.
- [ ] content versioning defined.
- [ ] compatibility/deprecation rules defined.

**Required gate:** G7  
**Current state:** NOT YET ASSESSED  
**Blocking severity if failed:** P1

---

## H10 — Set 40 Diagnostics / Recovery

- [ ] structured diagnostics hooks defined.
- [ ] corruption/failure detection requirements defined.
- [ ] safe-save failure behaviour defined.
- [ ] crash/recovery architecture requirements defined.

**Required gate:** G7  
**Current state:** NOT YET ASSESSED

---

## H11 — Set 41 Accessibility / Localisation

- [ ] localisation architecture supported.
- [ ] scalable UI supported.
- [ ] captions/non-colour communication supported.
- [ ] motion/flash/input accessibility hooks supported.

**Required gate:** G7  
**Current state:** NOT YET ASSESSED

---

## H12 — Set 42 Platform / Distribution

- [ ] any confirmed architecture-relevant platform constraint is resolved.
- [ ] non-architecture release work explicitly remains post-rebuild if incomplete.

**Required gate:** G7 where applicable  
**Current state:** NOT YET ASSESSED

---

# 13. Section I — Persistence, Migration & Version Safety

## I1 — Persistence architecture

- [ ] authoritative state ownership defined.
- [ ] save schema defined.
- [ ] world-state persistence defined.
- [ ] entity-state persistence defined.
- [ ] inventory/content persistence defined.
- [ ] near/far state persistence defined.
- [ ] Forge/package persistence boundaries defined.

**Required gate:** G6/G8  
**Current state:** NOT YET ASSESSED  
**Blocking severity if failed:** P0

---

## I2 — Migration/versioning

- [ ] schema versioning strategy defined.
- [ ] stable-ID migration defined.
- [ ] deprecation rules defined.
- [ ] invalid/old content handling defined.
- [ ] legacy POC save compatibility decision explicitly made.
- [ ] no silent save overwrite of incompatible data is allowed.

**Required gate:** G6/G7/G8  
**Current state:** NOT YET ASSESSED  
**Blocking severity if failed:** P1

---

# 14. Section J — Performance, Scalability & Determinism

## J1 — Performance architecture

- [ ] performance budgets defined.
- [ ] streaming budgets defined.
- [ ] simulation budgets defined.
- [ ] NPC/entity budgets defined.
- [ ] Forge/runtime tool budgets defined where relevant.
- [ ] low-end scalability strategy represented.

**Required gate:** G5/G6/G7  
**Current state:** NOT YET ASSESSED

---

## J2 — Determinism / simulation correctness

- [ ] deterministic systems identified.
- [ ] worldgen determinism/versioning defined.
- [ ] authoritative transactions conserved.
- [ ] near/far simulation conservation defined.
- [ ] network-ready deterministic boundaries defined.

**Required gate:** G6  
**Current state:** NOT YET ASSESSED  
**Blocking severity if failed:** P1

---

# 15. Section K — Testing, Verification & Benchmarks

## K1 — Test architecture

- [ ] unit-test expectations defined.
- [ ] integration-test expectations defined.
- [ ] regression-test expectations defined.
- [ ] manual acceptance expectations defined.
- [ ] historical POC tests identified for salvage/reuse.
- [ ] registry tests defined.
- [ ] save/migration tests defined.

**Required gate:** G2/G9  
**Current state:** NOT YET ASSESSED

---

## K2 — Benchmark gates

- [ ] voxel-update benchmark defined.
- [ ] streaming benchmark defined.
- [ ] worldgen benchmark defined.
- [ ] simulation benchmark defined.
- [ ] settlement/NPC benchmark defined where relevant.
- [ ] Forge/editor benchmark defined where relevant.
- [ ] target hardware/scalability evidence defined.

**Required gate:** G5/G9  
**Current state:** NOT YET ASSESSED

---

# 16. Section L — Global V1 Certification

## L1 — Corpus audit

- [ ] corpus freeze complete.
- [ ] inventory audit passed.
- [ ] authority audit passed.
- [ ] contradiction audit passed.
- [ ] supersession audit passed.
- [ ] terminology audit passed.
- [ ] stable-ID audit passed.
- [ ] registry audit passed.
- [ ] cross-document interface audit passed.
- [ ] requirements traceability audit passed.
- [ ] save/migration audit passed.
- [ ] multiplayer authority audit passed.
- [ ] performance/scalability audit passed.
- [ ] security/modding audit passed.
- [ ] accessibility architecture audit passed where applicable.
- [ ] completeness audit passed.

**Required gate:** G8  
**Current state:** NOT YET ASSESSED  
**Blocking severity if failed:** P0/P1

---

## L2 — V1 rewrite/certification

- [ ] superseded wording removed.
- [ ] accepted amendments integrated.
- [ ] document cross-links valid.
- [ ] authority references valid.
- [ ] registries reconciled.
- [ ] final V1 status assigned.
- [ ] no unresolved P0/P1 blocker remains.
- [ ] final V1 certification issued.

**Required gate:** G8  
**Current state:** NOT YET ASSESSED  
**Blocking severity if failed:** P0

---

# 17. Section M — Implementation Programme

## M1 — D-ROAD-06

- [ ] implementation sequence derived from final architecture.
- [ ] sequence does not rely on obsolete Summer-era assumptions.
- [ ] dependency order matches LFE/FRG-ENG.
- [ ] first vertical slice identified.
- [ ] bootstrap phases identified.
- [ ] major acceptance gates identified.

**Required gate:** G9  
**Current state:** INTENTIONALLY DEFERRED  
**Blocking severity if absent at final review:** P0/P1

---

## M2 — Implementation backlog

- [ ] initial modules/workstreams defined.
- [ ] owners/agent responsibilities defined.
- [ ] dependencies defined.
- [ ] acceptance criteria defined.
- [ ] test requirements defined.
- [ ] benchmark requirements defined.
- [ ] architecture references attached.
- [ ] canonical requirements traceable.

**Required gate:** G9  
**Current state:** NOT YET ASSESSED

---

## M3 — First production slice

- [ ] exact first slice defined.
- [ ] prerequisites satisfied.
- [ ] expected player/runtime behaviour defined.
- [ ] automated acceptance defined.
- [ ] manual acceptance defined.
- [ ] performance gate defined.
- [ ] completion produces reusable architecture rather than throwaway code.

**Required gate:** G9  
**Current state:** NOT YET ASSESSED

---

# 18. Section N — Legacy Preservation / Clean Cutover

## N1 — Legacy preservation

- [ ] pre-rebuild legacy tag exists.
- [ ] legacy archive branch exists.
- [ ] historical POC remains inspectable.
- [ ] historical benchmarks/tests remain inspectable.
- [ ] important lessons are captured in Brain.
- [ ] salvage candidates are identified.
- [ ] no accidental deletion of useful historical evidence.

**Required gate:** G4/G9  
**Current state:** NOT YET ASSESSED

---

## N2 — Clean rebuild workspace

- [ ] rebuild branch/worktree exists.
- [ ] governed repo structure exists.
- [ ] obsolete runtime code does not contaminate new architecture.
- [ ] new dependencies are intentional.
- [ ] initial CI passes.
- [ ] initial agent bootstrap passes.
- [ ] documentation/Brain paths resolve correctly.

**Required gate:** G9/G10  
**Current state:** NOT YET ASSESSED

---

# 19. Section O — Requirements Traceability

## O1 — Design-to-code traceability

For representative rebuild-critical features, verify:

```text
Canon
  ↓
Requirement
  ↓
Technical architecture
  ↓
Registry / stable identity
  ↓
Implementation module
  ↓
Automated verification
  ↓
Manual acceptance
```

- [ ] every rebuild-critical feature has canonical authority.
- [ ] every implementation module has a requirement/architecture owner.
- [ ] no major canonical requirement lacks an implementation destination.
- [ ] no major implementation subsystem lacks canonical/technical authority.
- [ ] tests link to the requirement they verify.
- [ ] deferred features are explicitly marked rather than silently missing.

**Required gate:** G8/G9  
**Current state:** NOT YET ASSESSED  
**Blocking severity if failed:** P1

---

# 20. Mandatory Gate Checklist

Immediately before rebuild authorisation:

| Gate | Required State | Actual State | Evidence |
|---|---|---|---|
| G0 — Foundation Corpus Established | PASS | PASS | [link] |
| G1 — Final Content Canon Closed | PASS | ___ | [link] |
| G2 — Engineering Governance Ready | PASS | ___ | [link] |
| G3 — Control / Audit Infrastructure Ready | PASS | ___ | [link] |
| G4 — Repository / Codex Bootstrap Ready | PASS | ___ | [link] |
| G5 — PRD Discovery Closed | PASS | ___ | [link] |
| G6 — Technical Canon Closed | PASS | ___ | [link] |
| G7 — Rebuild-Critical Base-Game Contracts Closed | PASS | ___ | [link] |
| G8 — Global V1 Corpus Certified | PASS | ___ | [link] |
| G9 — Implementation Programme Ready | PASS | ___ | [link] |

If any required row is not PASS or validly PASS WITH APPROVED EXCEPTION:

> **G10 MUST FAIL**

---

# 21. Blocker Register

Immediately before G10 review:

```text
OPEN P0 BLOCKERS:
- [none / list]

OPEN P1 BLOCKERS:
- [none / list]

APPROVED P2 EXCEPTIONS:
- [none / list]

P3/P4 DEFERRED ITEMS:
- [none / list]
```

Required condition:

```text
OPEN P0 = 0
OPEN P1 = 0
```

---

# 22. Final Rebuild Certification

## Certification date

`YYYY-MM-DD`

## Current project commit / tag

`[commit/tag]`

## V1 corpus identity

`[V1 corpus version/hash/tag]`

## Engineering governance identity

`[ENG-GOV/B-OPS version/tag]`

## PRD closure identity

`[PRD-09 version/result]`

## LFE identity

`[LFE version/tag]`

## FRG-ENG identity

`[FRG-ENG version/tag]`

## Branch C certification

`[audit certification ID]`

## Implementation-plan identity

`[D-ROAD-06 / backlog / milestone ID]`

---

# 23. Final Questions

Every answer must be **YES**.

- [ ] Is final rebuild-critical content canon authoritative?
- [ ] Is engineering governance operational?
- [ ] Is the repository/agent control infrastructure operational?
- [ ] Has discovery closed the architecture-critical unknowns?
- [ ] Is runtime architecture implementation-authoritative?
- [ ] Is Forge architecture implementation-authoritative?
- [ ] Are stable IDs and registries certified?
- [ ] Are persistence/migration/version contracts authoritative?
- [ ] Are multiplayer-ready authority constraints accounted for?
- [ ] Are performance/scalability requirements accounted for?
- [ ] Are rebuild-critical Sets 31–42 contracts accounted for?
- [ ] Has the global V1 audit passed?
- [ ] Is Leyforge Documentation V1.0 locked?
- [ ] Is the initial implementation sequence derived from final architecture?
- [ ] Are tests and benchmarks ready?
- [ ] Is the legacy POC safely preserved?
- [ ] Is the clean rebuild workspace ready?
- [ ] Are there zero open P0 blockers?
- [ ] Are there zero open P1 blockers?
- [ ] Can the first production milestone begin without making foundational assumptions that should already have been decided?

---

# 24. Final Verdict

Choose exactly one.

## REBUILD AUTHORITY: YES

Use only when all mandatory requirements pass.

or

## REBUILD AUTHORITY: NO

Use whenever any mandatory requirement is incomplete, failed, blocked, unverified, or unsupported by required evidence.

---

# 25. Current v0.1 Verdict — 30 August 2026

Based on the current programme state:

- FCC-14 is still active.
- B-OPS is still active.
- Codex/repository bootstrap has not yet been executed.
- PRD discovery has not closed.
- LFE has not yet been created.
- FRG-ENG has not yet been created.
- rebuild-critical Sets 31–42 have not yet been fully classified/closed.
- the global V1 audit has not yet been executed.
- D-ROAD-06 has not yet been created.
- implementation preparation is not complete.

Therefore:

# **REBUILD AUTHORITY: NO**

This is the expected and correct result at the current stage.

The purpose of Branch D is now to make the path from **NO** to **YES** explicit, measurable, and difficult to fake.

---

# 26. Branch D Core Setup Completion

With D-ROAD-05 established, the core Branch D control set is:

- **D-ROAD-00** — Roadmap Authority & Operating Rules
- **D-ROAD-01** — Master Production Path
- **D-ROAD-02** — Current State & Milestone Register
- **D-ROAD-03** — Dependency / Critical-Path Map
- **D-ROAD-04** — Production Gates & Exit Criteria
- **D-ROAD-05** — Rebuild Readiness Checklist

This completes the **Branch D control-framework build**.

Branch D should now enter:

> **LIVE MAINTENANCE MODE**

until enough PRD/LFE/FRG-ENG/V1 work exists to create:

- **D-ROAD-06 — Initial Implementation Sequence**

D-ROAD-06 remains intentionally deferred.

---

# 27. Maintenance Rule

From this point forward, normal Branch D work is:

1. refresh D-ROAD-02 when major project state changes;
2. update D-ROAD-03 only when dependencies materially change;
3. update D-ROAD-04 only when gate definitions materially change;
4. use D-ROAD-05 as the rebuild-readiness instrument;
5. do not create more roadmap documents unless a real control gap exists;
6. create D-ROAD-06 only when final architecture makes implementation order derivable.

---

# 28. Immediate Production Handoff

The project should now continue primarily through the active non-D branches:

```text
FCC-14
   +
Remaining B-OPS
   +
Branch C audit framework
   +
PRD-01 / discovery
   +
Codex bootstrap when governance-ready
```

Branch D observes, records, and updates.

Its next major authored document is not due until:

> **D-ROAD-06 — Initial Implementation Sequence**

becomes legitimately derivable from the final technical/V1 corpus.
