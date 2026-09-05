# Leyforge Branch D — Production / Rebuild Roadmap

## D-ROAD-04 — Production Gates & Exit Criteria

**Version:** 0.1  
**Date:** 30 August 2026  
**Status:** Initial Production Gate Standard  
**Branch:** D — Production / Rebuild Roadmap  
**Authority:** D-ROAD-00 — Roadmap Authority & Operating Rules  
**Programme Source:** D-ROAD-01 — Master Production Path  
**Live State Source:** D-ROAD-02 — Current State & Milestone Register  
**Dependency Source:** D-ROAD-03 — Dependency / Critical-Path Map  
**Purpose:** Define Leyforge's formal pre-rebuild production gates, required evidence, pass/fail conditions, exception rules, reopen conditions, and downstream authority unlocked by each gate.

---

# 1. Purpose

D-ROAD-04 converts Leyforge's roadmap and dependency model into explicit project gates.

A gate answers:

> **What must be true before this project stage may be considered passed?**

A gate is not a progress estimate.

A gate is not a mood.

A gate is not:

- "mostly done";
- "close enough";
- "probably fine";
- "we can clean it up later";
- "the code works on my machine";
- "we already started the next thing".

A gate is a formal readiness decision.

---

# 2. Gate States

Every production gate uses one of the following states:

- **NOT ENTERED**
- **PREPARING**
- **IN REVIEW**
- **PASS**
- **PASS WITH APPROVED EXCEPTION**
- **FAIL**
- **REOPENED**
- **SUPERSEDED**

Only **PASS** or **PASS WITH APPROVED EXCEPTION** unlocks work that explicitly requires that gate.

---

# 3. Gate Evidence Rule

A gate may pass only when its required evidence exists.

Evidence may include:

- authoritative documents;
- decision registers;
- audit results;
- validation reports;
- prototype results;
- benchmark results;
- test results;
- registry checks;
- migration checks;
- dependency closure;
- issue/blocker disposition;
- signed/recorded exception decisions.

Statements such as "we know this works" are not evidence unless tied to an accepted source or verification record.

---

# 4. Exception Rule

Exceptions are permitted only when:

1. the exception is explicitly recorded;
2. the affected requirement is identified;
3. the impact is bounded;
4. the owning authority is identified;
5. the approving authority has the right to accept that risk;
6. downstream impact is documented;
7. the exception does not violate a higher authority;
8. the exception has a revisit/closure condition if temporary.

Branch D cannot approve exceptions outside Branch D authority.

---

# 5. Gate Reopen Rule

A passed gate must be reopened if later work proves that a pass condition was no longer true.

Examples:

- FCC-14 discovers a contradiction in supposedly final identity canon;
- PRD invalidates a technical assumption used by LFE;
- Branch C finds a P0/P1 V1 blocker;
- a registry collision is discovered after certification;
- a prototype disproves a claimed architecture boundary;
- a post-30 requirement introduces a previously missing rebuild-critical constraint.

Reopening a gate is not failure of the project process.

Failing to reopen a knowingly invalid gate is.

---

# 6. Gate Hierarchy

```text
G0 — Foundation Corpus Established
        │
        ▼
G1 — Final Content Canon Closed
        │
        ├───────────────┐
        ▼               ▼
G2 — Engineering      G3 — Control / Audit
Governance Ready      Infrastructure Ready
        │               │
        └───────┬───────┘
                ▼
G4 — Repository / Codex Bootstrap Ready
                │
                ▼
G5 — PRD Discovery Closed
                │
                ▼
G6 — Technical Canon Closed
                │
                ▼
G7 — Rebuild-Critical Base-Game Contracts Closed
                │
                ▼
G8 — Global V1 Corpus Certified
                │
                ▼
G9 — Implementation Programme Ready
                │
                ▼
G10 — Rebuild Authorised
```

Not every gate is strictly serial during work.

The hierarchy defines **pass prerequisites**, not necessarily when drafting may begin.

---

# 7. G0 — Foundation Corpus Established

## Purpose

Confirm that the pre-existing Leyforge design foundation exists, is preserved, and can be consumed by later canon/discovery/audit work.

## Mandatory inputs

- Sets 00–30 or their accepted reconciled equivalents;
- Forge foundation sets;
- World Content Atlas;
- governance/registry source material;
- historical implementation evidence where relevant;
- historical testing/benchmark material where relevant.

## Pass criteria

- [ ] core design corpus is available;
- [ ] major document families are identifiable;
- [ ] source ownership is sufficiently known for downstream work;
- [ ] legacy implementation is preserved as evidence/history;
- [ ] known superseded material is not being treated as current authority by default;
- [ ] PRD-00 can inventory/classify the source corpus.

## Required evidence

- source corpus inventory;
- PRD-00 or equivalent source/authority register;
- preserved historical POC evidence.

## Allowed exceptions

Minor missing historical artifacts may be accepted if they do not affect current authority or required evidence.

## Unlocks

- formal FCC reconciliation;
- PRD discovery;
- Branch C corpus analysis;
- final roadmap planning.

## Reopen conditions

- discovery of a major missing authoritative source;
- proof that a supposedly preserved source family was lost or misclassified.

## Current provisional state

**PASS**

---

# 8. G1 — Final Content Canon Closed

## Purpose

Confirm that rebuild-critical content canon is sufficiently final for technical architecture, registry certification, and V1 audit.

## Mandatory predecessors

- G0;
- required realm FCC work;
- FCC-12;
- FCC-13;
- FCC-14.

## Pass criteria

- [ ] required realm canon is locked;
- [ ] FCC-12 binding decisions are fully consumed;
- [ ] FCC-13 identity/recipe/projection decisions are fully consumed;
- [ ] FCC-14 final reconciliation is complete;
- [ ] no unresolved P0/P1 content-canon contradictions remain;
- [ ] canonical IDs/projections required downstream are certified;
- [ ] known superseded identities are dispositioned;
- [ ] content-facing registry requirements are ready for technical consumption;
- [ ] unresolved lower-severity matters are explicitly governed.

## Required evidence

- FCC-12 accepted decision register;
- FCC-13 accepted decision register;
- FCC-14 final certification/reconciliation records;
- issue/exception register if applicable.

## Allowed exceptions

Only non-critical content matters that:

- do not affect stable identity;
- do not alter architecture;
- do not invalidate progression or registry ownership;
- do not block V1 certification.

## Approval authority

FCC-owning authority / applicable canon authority.

Branch D only records the result.

## Unlocks

- final content-facing technical architecture;
- final registry reconciliation;
- final V1 content audit.

## Reopen conditions

- later technical work proves a content identity contradiction;
- Branch C finds unresolved canon conflict;
- stable-ID certification fails.

## Current provisional state

**PREPARING / ACTIVE**

FCC-14 remains in progress.

---

# 9. G2 — Engineering Governance Ready

## Purpose

Confirm that Leyforge engineering work can proceed under enforceable governance rather than informal convention.

## Mandatory predecessors

- ENG-GOV corpus;
- required B-OPS operational subset.

## Pass criteria

- [ ] ENG-GOV-00→15 are locked;
- [ ] required B-OPS templates/records exist;
- [ ] coding-agent behaviour is governed;
- [ ] repository engineering standards are executable;
- [ ] ADR/change-control process is available;
- [ ] testing/verification expectations are operational;
- [ ] stable-ID / save / migration governance is represented;
- [ ] engineering risk classification is operational;
- [ ] work/handoff procedures are usable;
- [ ] no missing B-OPS item prevents safe Codex/bootstrap activity.

## Required evidence

- locked ENG-GOV corpus;
- B-OPS index/authority map;
- required operational templates;
- agent/workflow rules;
- engineering certification/operationalisation records.

## Allowed exceptions

Optional B-OPS enhancements that are not needed for:

- Codex bootstrap;
- technical canon;
- rebuild engineering;
- validation;
- change control.

## Approval authority

Branch B.

## Unlocks

- governed Codex/repository bootstrap;
- production-scale technical documentation;
- governed implementation work.

## Reopen conditions

- governance contradiction discovered;
- required enforcement/control proves unusable;
- a missing operational control creates a rebuild-critical gap.

## Current provisional state

**IN PROGRESS**

ENG-GOV is locked; B-OPS continues.

---

# 10. G3 — Control / Audit Infrastructure Ready

## Purpose

Confirm that the project can track authority, status, dependencies, audit work, and rebuild readiness without losing state.

## Mandatory predecessors

### Branch A
- Project Brain design/control layer locked.

### Branch C
- minimum V1 audit framework established.

### Branch D
- D-ROAD-00;
- D-ROAD-01;
- D-ROAD-02;
- D-ROAD-03;
- D-ROAD-04;
- D-ROAD-05.

## Pass criteria

- [ ] Branch A knowledge architecture is locked;
- [ ] Branch C has a usable audit framework;
- [ ] Branch D roadmap/control set D-ROAD-00→05 exists;
- [ ] project status can be refreshed without reconstructing history manually;
- [ ] dependency/gate logic exists;
- [ ] future V1 audit state can be tracked;
- [ ] rebuild-readiness state can be represented;
- [ ] authority ownership is not duplicated by the control layer.

## Required evidence

- Branch A final design/control docs;
- Branch C baseline audit docs;
- Branch D D-ROAD-00→05.

## Allowed exceptions

Later convenience dashboards/automation may be absent.

## Approval authority

Each owning branch certifies its own component.

Branch D records composite gate state.

## Unlocks

- stable project-wide pre-rebuild control;
- reliable Codex/bootstrap tracking;
- formal readiness reporting.

## Reopen conditions

- control system cannot represent a critical dependency;
- audit ownership becomes ambiguous;
- Branch D or Brain starts conflicting with source authority.

## Current provisional state

**PREPARING**

Branch D's D-ROAD-00→05 control set is now established. Composite G3 remains PREPARING until the required Branch A/Branch C control components are also satisfied at gate-review time.

---

# 11. G4 — Repository / Codex Bootstrap Ready

## Purpose

Confirm that Leyforge's repository has the minimum governed infrastructure required for production-scale AI-assisted technical work and later rebuild implementation.

## Mandatory predecessors

- G2;
- Branch A design;
- G3 minimum control structure.

## Pass criteria

- [ ] Brain/vault structure exists in the repository;
- [ ] governed templates exist;
- [ ] AGENTS/bootstrap instructions exist;
- [ ] work logs/handoffs are operational;
- [ ] Skills/Procedures/Failures capture is operational;
- [ ] Brain validation / Brain Doctor exists at required minimum level;
- [ ] authority/index navigation exists;
- [ ] Git/CI validation baseline exists;
- [ ] engineering governance references are wired into agent instructions;
- [ ] legacy POC preservation strategy is executed;
- [ ] clean rebuild branch/worktree strategy is prepared;
- [ ] new production work will not silently mutate the archived legacy baseline.

## Required evidence

- repository tree;
- AGENTS files;
- validation scripts;
- initial CI checks;
- bootstrap completion record;
- legacy tag/archive/rebuild branch evidence.

## Allowed exceptions

Non-critical dashboard polish, optional automation and quality-of-life tooling.

## Approval authority

Branch B for engineering controls;
Branch A for Brain conformance;
Branch D for roadmap-state recording.

## Unlocks

- production-scale Codex work;
- governed PRD/LFE/FRG-ENG editing in-repo;
- later rebuild execution infrastructure.

## Reopen conditions

- agents bypass governance;
- validation cannot detect malformed control artifacts;
- legacy/rebuild boundaries prove unsafe.

## Current provisional state

**NOT ENTERED / PREPARING**

---

# 12. G5 — PRD Discovery Closed

## Purpose

Confirm that rebuild-critical technical uncertainty has been reduced to an acceptable, explicit, evidence-backed level.

## Mandatory predecessors

- PRD-00→09;
- required FCC deltas consumed;
- required technology/prototype evidence.

## Pass criteria

- [ ] PRD-01 requirements/unknowns inventory complete;
- [ ] PRD-02 voxel technology audit complete;
- [ ] PRD-03 Godot/supporting technology audit complete;
- [ ] PRD-04 ownership/boundary analysis complete;
- [ ] PRD-05 evidence crosswalk complete;
- [ ] PRD-06 risk/proof register complete;
- [ ] PRD-07 required hostile prototypes executed;
- [ ] PRD-08 results/ADR evidence recorded;
- [ ] PRD-09 closure audit passed;
- [ ] architecture-critical unknowns are closed or explicitly bounded;
- [ ] known rejected approaches are recorded;
- [ ] benchmark/prototype evidence is sufficient for final technical architecture;
- [ ] no P0/P1 technical unknown remains disguised as an assumption.

## Required evidence

PRD-00→09 and referenced prototype/benchmark/ADR records.

## Allowed exceptions

Only bounded uncertainties whose impact:

- is understood;
- does not invalidate the chosen architecture;
- has a clear implementation-time proof/checkpoint;
- is accepted by the correct technical authority.

## Approval authority

PRD/technical discovery authority under engineering governance.

## Unlocks

- final LFE freeze;
- final FRG-ENG freeze;
- evidence-backed implementation planning.

## Reopen conditions

- new evidence invalidates a core technical conclusion;
- required platform/plugin capability changes;
- later architecture uncovers an unresolved foundational unknown.

## Current provisional state

**NOT ENTERED / EARLY**

PRD-00 is final; PRD-01 is next.

---

# 13. G6 — Technical Canon Closed

## Purpose

Confirm that Leyforge's runtime and Forge architecture are implementation-authoritative.

## Mandatory predecessors

- G1;
- G2;
- G5;
- rebuild-critical post-30 architecture constraints sufficiently known.

## Required components

- LFE;
- FRG-ENG / FORGE-ENG;
- shared interface reconciliation;
- registry/persistence/network/performance contracts.

## Pass criteria

### LFE
- [ ] runtime ownership is explicit;
- [ ] voxel integration boundary is explicit;
- [ ] world streaming architecture is defined;
- [ ] worldgen architecture is defined;
- [ ] simulation authority is defined;
- [ ] near/far simulation model is defined;
- [ ] persistence/save/migration architecture is defined;
- [ ] registry/runtime identity contracts are defined;
- [ ] determinism/multiplayer-ready authority is defined;
- [ ] performance/scalability strategy is defined;
- [ ] testing/diagnostics interfaces are defined.

### FRG-ENG
- [ ] Forge application architecture is defined;
- [ ] content-authoring object model is defined;
- [ ] block/item/model/entity/animation pipelines are defined;
- [ ] structure/dungeon/building/vessel editors are defined;
- [ ] validation/baking/preview is defined;
- [ ] registry integration is defined;
- [ ] package/version/security boundaries are defined;
- [ ] developer/player/mod permissions are defined.

### Shared closure
- [ ] LFE ↔ FRG-ENG interfaces are reconciled;
- [ ] content package/runtime ingestion is coherent;
- [ ] stable identity is consistent;
- [ ] serialization contracts are compatible;
- [ ] no P0/P1 architecture contradiction remains.

## Required evidence

- final LFE corpus;
- final FRG-ENG corpus;
- applicable ADRs;
- PRD cross-references;
- registry/interface validation.

## Allowed exceptions

Only implementation-detail choices that do not alter architecture contracts.

## Approval authority

Owning technical authorities under ENG-GOV.

## Unlocks

- final global V1 audit;
- final implementation dependency graph;
- D-ROAD-06 derivation.

## Reopen conditions

- V1 audit discovers architecture contradiction;
- implementation proof invalidates a fundamental contract;
- new mandatory platform/content requirement changes architecture.

## Current provisional state

**NOT ENTERED**

---

# 14. G7 — Rebuild-Critical Base-Game Contracts Closed

## Purpose

Confirm that the portions of Sets 31–42 which constrain the rebuild have been identified and closed sufficiently for V1 and implementation.

## Mandatory predecessors

- D-ROAD-03 classification;
- relevant PRD/technical findings;
- owning post-30 authorities.

## Pass criteria

### Set 31
- [ ] multiplayer/state-authority contracts defined where architecture-critical.

### Set 32
- [ ] rebuild-critical whole-game review findings dispositioned.

### Set 33
- [ ] Forge/security/player-content constraints supplied to FRG-ENG.

### Set 34
- [ ] input/configuration/accessibility architecture constraints defined.

### Set 35
- [ ] realm creation/simulation complexity/hardware scalability contracts defined.

### Set 36
- [ ] world/realm lifecycle contracts defined.

### Set 37
- [ ] mod/content-package/version/security boundaries defined where architecture-critical.

### Set 38
- [ ] server-authority assumptions defined if required by LFE.

### Set 39
- [ ] schema/version/migration/update contracts defined where rebuild-critical.

### Set 40
- [ ] diagnostics/recovery architecture requirements defined.

### Set 41
- [ ] localisation/accessibility architecture hooks defined.

### Set 42
- [ ] confirmed platform constraints affecting architecture are defined, if any.

## Key rule

This gate does **not** require every Set 31–42 document to be fully release-final.

It requires every rebuild-critical contract to be known and represented.

## Required evidence

- post-30 criticality register;
- owning design documents;
- PRD/LFE/FRG-ENG cross-references.

## Allowed exceptions

Pure post-rebuild/release work explicitly classified as non-blocking.

## Approval authority

Owning design authorities, reconciled through Branch D classification and Branch C audit.

## Unlocks

- final V1 corpus certification;
- confidence that the rebuild will not embed architecture hostile to known base-game requirements.

## Reopen conditions

- a supposedly non-critical Set 31–42 requirement is later shown to affect architecture.

## Current provisional state

**NOT ENTERED / UNCLASSIFIED**

---

# 15. G8 — Global V1 Corpus Certified

## Purpose

Confirm that the complete rebuild-critical Leyforge documentation corpus is coherent, authoritative, traceable, and implementation-ready.

## Mandatory predecessors

- G1;
- G2;
- G5;
- G6;
- G7;
- Branch C audit framework.

## Pass criteria

- [ ] audit-candidate corpus is frozen;
- [ ] document inventory is complete;
- [ ] authority ownership audit passes;
- [ ] canon contradiction audit passes;
- [ ] supersession/legacy audit passes;
- [ ] terminology audit passes;
- [ ] stable identity audit passes;
- [ ] registry reconciliation passes;
- [ ] cross-document interfaces pass;
- [ ] FCC ↔ gameplay systems passes;
- [ ] FCC ↔ LFE passes;
- [ ] FCC ↔ FRG-ENG passes;
- [ ] PRD ↔ technical evidence passes;
- [ ] requirements traceability passes;
- [ ] save/migration audit passes;
- [ ] multiplayer authority audit passes;
- [ ] performance/scalability audit passes;
- [ ] security/modding audit passes;
- [ ] accessibility architecture audit passes where applicable;
- [ ] completeness/missing-contract audit passes;
- [ ] required clean rewrites are complete;
- [ ] inter-document links are valid;
- [ ] no unresolved P0/P1 blocker remains;
- [ ] final V1 certification is issued.

## Required evidence

Branch C final audit/certification records.

## Allowed exceptions

Only explicitly certified lower-severity exceptions with:

- owner;
- impact;
- rationale;
- future closure path where required.

## Approval authority

Branch C audit authority in conjunction with owning source authorities where corrections are required.

## Unlocks

> **LEYFORGE DOCUMENTATION V1.0 LOCKED**

and final rebuild preparation.

## Reopen conditions

- later discovery of a P0/P1 contradiction;
- invalid stable IDs;
- broken architecture authority;
- implementation proves a supposedly authoritative requirement impossible.

## Current provisional state

**NOT ENTERED**

---

# 16. G9 — Implementation Programme Ready

## Purpose

Confirm that V1 authority has been converted into an executable implementation programme.

## Mandatory predecessors

- G4;
- G8.

## Pass criteria

- [ ] D-ROAD-06 implementation sequence exists;
- [ ] module/component dependency graph exists;
- [ ] first vertical slices are defined;
- [ ] initial implementation backlog exists;
- [ ] acceptance criteria exist;
- [ ] automated test strategy exists;
- [ ] benchmark gates exist;
- [ ] CI/validation gates exist;
- [ ] registry bootstrap plan exists;
- [ ] persistence bootstrap plan exists;
- [ ] legacy reference/access strategy exists;
- [ ] agent implementation bootstrap is validated;
- [ ] repository cutover is ready;
- [ ] first rebuild milestone can be started without foundational guesswork.

## Required evidence

- D-ROAD-06;
- implementation backlog;
- module graph;
- testing/benchmark matrix;
- bootstrap verification;
- repository readiness record.

## Allowed exceptions

Later production backlog detail beyond the first controlled implementation phases.

## Approval authority

Technical implementation authority under ENG-GOV, recorded by Branch D.

## Unlocks

D-ROAD-05 final rebuild-readiness certification.

## Reopen conditions

- implementation sequence loses consistency with V1 architecture;
- repository bootstrap is invalidated;
- required first-slice acceptance criteria are missing.

## Current provisional state

**NOT ENTERED**

---

# 17. G10 — Rebuild Authorised

## Purpose

Provide the final formal decision that the clean Leyforge rebuild may begin.

## Mandatory predecessors

- G0 PASS;
- G1 PASS;
- G2 PASS;
- G3 PASS;
- G4 PASS;
- G5 PASS;
- G6 PASS;
- G7 PASS;
- G8 PASS;
- G9 PASS;
- D-ROAD-05 final readiness certification.

## Pass criteria

- [ ] every mandatory predecessor is PASS or approved equivalent;
- [ ] no open P0/P1 blocker exists;
- [ ] no unresolved authority contradiction exists;
- [ ] no missing stable-ID blocker exists;
- [ ] no unresolved architecture-critical unknown exists;
- [ ] required repository infrastructure is live;
- [ ] required engineering governance is live;
- [ ] implementation sequence is derived from final authority;
- [ ] first production milestone is defined;
- [ ] testing/benchmark gates are ready;
- [ ] legacy implementation is safely preserved;
- [ ] rebuild branch/worktree is ready;
- [ ] D-ROAD-05 result = **REBUILD AUTHORITY: YES**.

## Allowed exceptions

No exception may bypass:

- unresolved P0/P1 canon contradiction;
- missing implementation-authoritative architecture;
- unresolved stable identity blocker;
- absent engineering governance;
- absent V1 certification;
- absent implementation plan.

Lower-severity approved exceptions may remain if they are explicitly non-blocking.

## Approval authority

Composite project authority:

- owning canon authorities certify canon;
- Branch B certifies engineering governance;
- PRD/technical authorities certify evidence;
- LFE/FRG-ENG certify architecture;
- Branch C certifies V1;
- Branch D records final readiness result.

Branch D does not fabricate the component approvals.

## Unlocks

> **CLEAN LEYFORGE REBUILD MAY BEGIN**

## Reopen conditions

If a critical predecessor is invalidated before meaningful implementation begins, G10 returns to **REOPENED**.

If implementation has already begun, the issue is routed through engineering change control and the relevant authority rather than pretending the original gate still holds.

## Current provisional state

**NOT ENTERED / BLOCKED**

---

# 18. Gate Dependency Matrix

| Gate | Requires | Primary unlock |
|---|---|---|
| G0 | foundation corpus | formal pre-rebuild programme |
| G1 | FCC closure | final content-facing technical work |
| G2 | ENG-GOV + required B-OPS | governed technical/agent work |
| G3 | Branch A/C/D control infrastructure | stable project control |
| G4 | G2 + Brain/control bootstrap | production-scale Codex/repository work |
| G5 | PRD-00→09 | final technical architecture |
| G6 | G1 + G2 + G5 + critical constraints | implementation-authoritative LFE/FRG-ENG |
| G7 | post-30 critical contracts | final V1 completeness |
| G8 | G1/G2/G5/G6/G7 + Branch C | V1 documentation lock |
| G9 | G4 + G8 | executable implementation programme |
| G10 | G0→G9 + D-ROAD-05 | clean rebuild |

---

# 19. Current Provisional Gate Dashboard

```text
G0  FOUNDATION CORPUS              PASS
G1  FINAL CONTENT CANON            ACTIVE / PREPARING
G2  ENGINEERING GOVERNANCE         ACTIVE / PREPARING
G3  CONTROL / AUDIT INFRA          ACTIVE / PREPARING
G4  REPOSITORY / CODEX BOOTSTRAP   NOT ENTERED
G5  PRD DISCOVERY                  EARLY
G6  TECHNICAL CANON                NOT ENTERED
G7  POST-30 CRITICAL CONTRACTS     NOT ENTERED / UNCLASSIFIED
G8  GLOBAL V1                      NOT ENTERED
G9  IMPLEMENTATION PROGRAMME       NOT ENTERED
G10 REBUILD AUTHORISED             BLOCKED
```

Formal current-state ownership remains in D-ROAD-02.

---

# 20. Gate Failure Handling

If a gate fails:

1. record the failed criterion;
2. identify owning authority;
3. create or link remediation work;
4. identify downstream work affected;
5. update D-ROAD-02;
6. update D-ROAD-03 if dependencies change;
7. do not mark the gate passed until the failed condition is re-evaluated.

A gate failure is not automatically a project emergency.

It is a controlled signal that something is not ready.

---

# 21. Gate Exception Record

Use:

```text
GATE EXCEPTION

Gate:
[G#]

Criterion:
[failed/waived criterion]

Exception class:
[temporary / permanent / lower-severity]

Reason:
[why exception is acceptable]

Impact:
[known downstream effect]

Owner:
[authority owner]

Approved by:
[authority]

Expiry / closure condition:
[condition or N/A]

Date:
[YYYY-MM-DD]

Status:
[OPEN / CLOSED]
```

---

# 22. Gate Reopen Record

Use:

```text
GATE REOPEN

Gate:
[G#]

Original pass date:
[date]

Reopen date:
[date]

Trigger:
[new evidence / contradiction / failed validation / changed requirement]

Affected criteria:
[list]

Downstream impact:
[list]

Owning authority:
[owner]

Required remediation:
[list]

Current state:
[REOPENED]
```

---

# 23. Gate Review Cadence

Gate state should be reviewed:

- when a major workstream closes;
- when PRD discovers a new architecture-critical unknown;
- when FCC/registry identity changes;
- when Branch C discovers a major contradiction;
- before LFE/FRG-ENG final lock;
- before V1 certification;
- before D-ROAD-05;
- immediately before rebuild authorisation.

Routine minor edits do not require formal gate review.

---

# 24. Anti-Pattern Rules

Branch D must reject the following arguments:

### "We already started downstream work, so the gate has effectively passed."
False.

### "Only one requirement is missing."
Severity matters, not count.

### "We'll remember to fix it later."
Record it or it does not exist as governed work.

### "This is just documentation."
If it defines architecture, identity, migration, authority or acceptance criteria, it is production infrastructure.

### "The prototype worked once."
A prototype is evidence only for the conditions it actually tested.

### "This release feature is incomplete, therefore rebuild cannot begin."
Only if its rebuild-critical contract is unresolved.

---

# 25. Acceptance Criteria for D-ROAD-04 v0.1

D-ROAD-04 is ready to lock when:

- [x] gate states are defined;
- [x] evidence requirements are defined;
- [x] exception rules are defined;
- [x] reopen rules are defined;
- [x] the gate hierarchy is explicit;
- [x] G0 foundation gate exists;
- [x] G1 final-content gate exists;
- [x] G2 engineering-governance gate exists;
- [x] G3 control/audit-infrastructure gate exists;
- [x] G4 repository/Codex-bootstrap gate exists;
- [x] G5 PRD-discovery gate exists;
- [x] G6 technical-canon gate exists;
- [x] G7 post-30 critical-contract gate exists;
- [x] G8 global-V1 gate exists;
- [x] G9 implementation-programme gate exists;
- [x] G10 rebuild-authorisation gate exists;
- [x] pass criteria are concrete;
- [x] allowed exceptions are bounded;
- [x] approval ownership is separated;
- [x] downstream unlocks are defined;
- [x] reopen conditions are defined;
- [x] gate-failure handling is defined.

---

# 26. Immediate Handoff

After D-ROAD-04 is accepted:

> **Begin D-ROAD-05 — Rebuild Readiness Checklist v0.1.**

D-ROAD-05 will be the final compact certification instrument used immediately before rebuild.

Where D-ROAD-04 defines **what each gate means**, D-ROAD-05 will answer one final question:

> **“Can we actually start building Leyforge now?”**

The answer will be either:

**REBUILD AUTHORITY: YES**

or

**REBUILD AUTHORITY: NO**
