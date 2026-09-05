# Leyforge Branch D — Production / Rebuild Roadmap

## D-ROAD-00 — Roadmap Authority & Operating Rules

**Version:** 0.1  
**Date:** 30 August 2026  
**Status:** Initial Branch D Control Document  
**Branch:** D — Production / Rebuild Roadmap  
**Purpose:** Define the authority, scope, update rules, dependency logic, status model, and change-control behaviour for Leyforge's production/rebuild roadmap.

---

# 1. Purpose

Branch D is Leyforge's production-control and sequencing layer.

Its job is to answer, at any point in the project:

1. Where are we now?
2. What is active?
3. What is complete?
4. What is blocked?
5. What can proceed in parallel?
6. What depends on what?
7. What must be true before the clean rebuild can begin?
8. What is the next authorised milestone?

Branch D does **not** create gameplay canon, technical architecture, coding standards, or V1 audit doctrine. It records their production state and dependencies.

---

# 2. Core Authority Rule

> **Branch D tracks authority; it does not replace authority.**

The roadmap is a navigation, sequencing, dependency, milestone, and readiness system.

If a Branch D record conflicts with an authoritative source document, the authoritative source wins and Branch D must be corrected.

Branch D must never silently reinterpret a completed authority simply to simplify the production plan.

---

# 3. Authority Boundaries

Branch D recognises the following ownership boundaries.

## 3.1 Branch A — Project Brain / Obsidian

Branch A owns:

- project knowledge infrastructure;
- authority navigation;
- document indexing;
- work logs;
- decision indexing;
- project skills, lessons, failures, and reusable procedures;
- knowledge-graph structure;
- project-memory operating rules.

Branch D may consume Brain status and links but does not redefine Brain architecture.

## 3.2 Branch B — Engineering Governance / Operationalisation

Branch B owns:

- engineering governance;
- coding standards;
- repository engineering rules;
- agent bootstrap behaviour;
- engineering risk controls;
- testing/governance procedures;
- ADR/change-control processes;
- coding-agent operating contracts.

Branch D tracks whether required Branch B controls are ready for rebuild work.

## 3.3 Branch C — V1 Documentation Audit & Finalisation

Branch C owns:

- audit methodology;
- reconciliation procedure;
- V1 certification rules;
- contradiction and supersession handling;
- corpus-finalisation procedure;
- audit evidence requirements.

Branch D tracks Branch C readiness and the V1 certification gate but cannot change audit rules.

## 3.4 Final Content Canon (FCC)

FCC owns final content canon within its declared scope.

Branch D may track FCC dependencies, completion, handoffs, and gates.

Branch D must not reopen locked FCC decisions.

## 3.5 Existing Leyforge Design Sets

Sets 00 onward remain authoritative within their owning scopes unless superseded by later accepted authority.

Branch D tracks their lifecycle and production role.

It does not rewrite their design content.

## 3.6 PRD — Pre-Rebuild Discovery

PRD owns the structured discovery/evidence programme before final technical-canon freeze, including:

- requirement extraction;
- technical unknowns;
- technology capability audits;
- evidence classification;
- architecture-boundary discovery;
- technical risks;
- prototypes and benchmarks;
- pre-rebuild discovery closure.

Branch D tracks PRD progress and the PRD closure gate.

## 3.7 LFE — Leyforge Engine

LFE will own the final implementation-authoritative Leyforge runtime/engine architecture after required PRD closure and evidence.

Branch D tracks readiness and dependencies.

It cannot invent LFE architecture early.

## 3.8 FRG-ENG / FORGE-ENG — The Forge Engineering Canon

FRG-ENG/FORGE-ENG will own the final implementation-authoritative engineering design for The Forge and its authoring, validation, baking, registry, packaging, preview, security, and tooling architecture.

Branch D tracks readiness and dependencies.

It cannot invent Forge engineering architecture early.

## 3.9 Registries and Stable Identity

Registry authority remains with the documents and governance layers that own the relevant semantic and implementation bindings.

Branch D may track registry-certification status but does not create or mutate canonical IDs.

---

# 4. Roadmap Source Rule

Branch D must distinguish between:

- **Authority source** — defines project truth within a scope.
- **Evidence source** — supports or disproves technical claims.
- **Planning source** — records accepted sequencing/direction.
- **Navigation source** — summarises current state.
- **Historical source** — preserves prior implementation, tests, lessons, and migration evidence.
- **Superseded source** — retained for provenance but no longer controls current decisions.

A roadmap/status document is never automatically promoted to design or engineering authority.

PRD-00 remains the primary source-corpus and authority register for pre-rebuild work. Branch D must reference that authority model rather than create a competing source hierarchy.

---

# 5. Branch D Document Set

Branch D uses the following controlled document family:

| ID | Document | Purpose |
|---|---|---|
| **D-ROAD-00** | Roadmap Authority & Operating Rules | Defines Branch D itself. |
| **D-ROAD-01** | Master Production Path | Full production path from current state to clean rebuild. |
| **D-ROAD-02** | Current State & Milestone Register | Live project-position dashboard. |
| **D-ROAD-03** | Dependency / Critical-Path Map | Tracks blockers, parallel work, and critical dependencies. |
| **D-ROAD-04** | Production Gates & Exit Criteria | Defines formal milestone gates and their conditions. |
| **D-ROAD-05** | Rebuild Readiness Checklist | Final pre-build authorisation checklist. |
| **D-ROAD-06** | Initial Implementation Sequence | Written only when architecture is mature enough to derive build order. |

No additional Branch D document should be created unless the information cannot be cleanly owned by this set.

---

# 6. Status Model

Branch D uses the following standard lifecycle states:

- **NOT STARTED**
- **READY**
- **ACTIVE**
- **BLOCKED**
- **REVIEW**
- **COMPLETE**
- **LOCKED**
- **V1 CERTIFIED**
- **DEFERRED**
- **SUPERSEDED**
- **NOT REQUIRED FOR REBUILD**

A roadmap entry must not use vague terms such as "basically done" or "probably ready" for a formal gate.

---

# 7. Required Roadmap Fields

Every major D-ROAD-01 production node should record, where applicable:

- ID / name;
- owner;
- current status;
- purpose;
- authority source;
- dependencies;
- blocks;
- can run in parallel with;
- rebuild-critical: YES / NO / CONDITIONAL;
- entry condition;
- exit condition;
- evidence/certification required;
- current notes;
- last meaningful state change.

---

# 8. Dependency Rules

## 8.1 Dependency Means Real Dependency

A task must only be marked as dependent on another task when completion or authoritative output is genuinely required.

Convenient sequencing is not the same as dependency.

## 8.2 Parallel Work Is Preferred Where Safe

Branch D should actively expose work that can proceed in parallel.

The roadmap must not create artificial serialisation.

## 8.3 Downstream Work May Begin Provisionally

A downstream workstream may begin before an upstream workstream is fully closed when its authoritative owner explicitly allows controlled delta reconciliation.

However:

- unresolved upstream-owned fields must remain visibly unresolved;
- downstream documents must not silently treat them as settled;
- final freeze/certification cannot occur until required upstream authority is consumed.

## 8.4 Hard Gates Remain Hard

When an authoritative source defines a hard gate, Branch D cannot bypass it for schedule convenience.

---

# 9. Critical-Path Rule

Branch D must maintain a visible distinction between:

### Critical-path work
A delay directly delays clean rebuild authorisation.

### Architecture-constraining work
Must influence design now but may not need full implementation before rebuild begins.

### Parallel support work
Can advance independently and improves readiness without controlling the rebuild date.

### Post-rebuild production work
Important to the complete game but not required to authorise the initial clean rebuild.

This distinction prevents "complete the entire game on paper before touching Godot" from becoming an accidental requirement.

---

# 10. Rebuild-Critical Classification

Every major roadmap node should receive one of:

- **YES** — must close before clean rebuild authorisation.
- **CONDITIONAL** — only the rebuild-relevant subset must close.
- **NO** — does not gate initial rebuild.
- **TBD** — classification awaits authority/evidence.

A `TBD` classification must not silently become `NO`.

---

# 11. Production Gate Rules

Formal production gates are defined in D-ROAD-04.

A gate may only be marked passed when:

1. all mandatory predecessors are satisfied;
2. required authoritative documents exist;
3. unresolved blockers are either closed or explicitly accepted by the authority allowed to accept them;
4. required evidence exists;
5. required audits/certifications have passed;
6. the state is recorded in D-ROAD-02.

No gate passes merely because work has begun downstream.

---

# 12. Roadmap Update Procedure

Branch D enters maintenance mode after D-ROAD-00 through D-ROAD-05 are established.

After that, updates should be lightweight.

For every consequential project-state change, record:

- what completed;
- what became active;
- what became blocked/unblocked;
- whether the critical path changed;
- whether a gate changed state;
- whether a new dependency was discovered;
- whether rebuild readiness changed.

Minor edits that do not change sequencing, authority, gates, or readiness do not require a roadmap update.

---

# 13. Roadmap Delta Format

A normal state update may use:

```text
ROADMAP DELTA

Completed:
[work item]

Activated:
[work item]

Blocked / Unblocked:
[work item]

New dependency:
[dependency or None]

Critical-path change:
[Yes / No]

Gate change:
[gate or None]

Rebuild-readiness impact:
[description]

Sources:
[authoritative references]
```

The delta is then incorporated into the live Branch D registers.

---

# 14. Conflict Handling

If Branch D discovers that two sources appear to demand incompatible sequencing or ownership:

1. do not choose a winner by convenience;
2. identify each source and its authority;
3. check PRD-00 / relevant authority map;
4. route the issue to the owning authority;
5. mark the affected roadmap node **BLOCKED** or **TBD** if necessary;
6. update Branch D only after the owning authority resolves the conflict.

Branch D may identify conflicts.

Branch D may not silently resolve canon or architecture conflicts outside its authority.

---

# 15. Supersession Handling

When a workstream or document is superseded:

- retain its history/provenance;
- remove it from the active critical path unless still required for migration/evidence;
- point the roadmap to the new active owner;
- ensure no downstream roadmap node still depends on the superseded source by mistake.

Historical POC implementation may remain highly valuable for requirements, regression tests, migration evidence, and lessons even when its old architecture is not current.

---

# 16. Rebuild Authorisation Principle

The clean Leyforge rebuild does not begin merely because the team wants to resume coding.

It begins when the formal rebuild gate says the project has enough:

- content certainty;
- engineering governance;
- evidence;
- architecture;
- registry certainty;
- persistence/migration strategy;
- verification strategy;
- V1 documentation certainty;
- implementation sequencing;

to build deliberately rather than rediscover foundational decisions during implementation.

This does **not** require every eventual release-system document or future expansion system to be complete.

It requires every **rebuild-critical** dependency to be closed to the level defined by D-ROAD-04 and D-ROAD-05.

---

# 17. D-ROAD-06 Deferral Rule

D-ROAD-06 — Initial Implementation Sequence must not be finalised early.

It must be derived from:

- final/near-final PRD evidence;
- LFE architecture;
- FRG-ENG/FORGE-ENG architecture;
- final registry/identity rules;
- Branch B engineering governance;
- V1 audit findings;
- actual technical risks and prototype results.

Branch D must not lock an implementation sequence based on outdated Summer-era architecture or speculative assumptions.

---

# 18. Relationship to the Project Brain

Once the Branch A Project Brain is operational:

- D-ROAD-02 should become a primary current-state dashboard;
- D-ROAD-03 should feed dependency views;
- D-ROAD-04 gate states should be visible from the Brain;
- major roadmap deltas should appear in project work logs;
- roadmap notes should link to authoritative documents rather than duplicate their content.

The Brain is the navigation/knowledge layer.

Branch D is the production-state and sequencing authority.

---

# 19. Acceptance Criteria for D-ROAD-00

D-ROAD-00 v0.1 is ready to lock when:

- [x] Branch D purpose is explicit;
- [x] Branch D cannot override underlying canon/engineering/audit authority;
- [x] source classes are defined;
- [x] the Branch D document family is fixed;
- [x] roadmap statuses are standardised;
- [x] dependency and parallel-work rules are explicit;
- [x] critical-path classification is explicit;
- [x] rebuild-critical classification is explicit;
- [x] formal gate behaviour is defined;
- [x] update/delta behaviour is defined;
- [x] conflict and supersession handling are defined;
- [x] rebuild-authorisation principle is explicit;
- [x] D-ROAD-06 premature-lock prevention is explicit;
- [x] Project Brain relationship is defined.

---

# 20. Immediate Handoff

After D-ROAD-00 is accepted:

> **Begin D-ROAD-01 — Master Production Path v0.1.**

D-ROAD-01 will convert the existing Leyforge pre-rebuild programme into a full dependency-aware production tree with owner, status, criticality, entry conditions, exit conditions, and rebuild impact for every major workstream.
