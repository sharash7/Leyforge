---
brain_schema: 1
id: "DASH-GOVERNANCE"
type: "dashboard"
title: "Engineering Governance Health"
status: "active"
information_class: "authored"
created: "2026-09-06"
updated: "2026-09-06"
authority_domain: "engineering_governance"
authority_role: "derived_record"
authority_status: "authoritative"
depends_on:
  - "SYS-ENGINEERING-GOVERNANCE"
related_to:
  - "WORK-20260906-001"
  - "WORK-20260906-002"
  - "WORK-20260906-003"
  - "WORK-20260906-004"
  - "WORK-20260906-005"
  - "TASK-20260906-005"
  - "GOV-DEBT-0007"
  - "TEST-GOVERNANCE-R6"
  - "EVID-0003"
  - "EVID-0004"
  - "EVID-0005"
  - "AUDIT-0003"
  - "AUDIT-0004"
  - "AUDIT-0005"
  - "CHANGE-20260906-003"
  - "CHANGE-20260906-004"
  - "HANDOFF-20260906-004"
  - "ADR-0008"
---

# Engineering Governance Health

## G0 — Repository and Governance Bootstrap

- Authority manifest: active, 23 Branch B sources hash-pinned.
- Agent bootstrap: active.
- Templates: active, 12 source-derived files.
- Governance metadata and references: active.
- Waiver expiry: active.
- Stable build, focused-test and full-validation entrypoints: active.
- CI: active; both workflows passed after the portable generated-source hash repair at `263e3f1810c08c1cd0197cc140fed5d6f45fbb16`.
- Brain integration: active.

## R6 Operating Pilot

- Seven REBUILD-00 pilot paths: certified PASS.
- Headless free-text authority lookup: active and tested.
- Dated Work, Task and Change ID allocation: active and tested.
- ADR-trigger, violation, waiver, stale-summary and legacy-boundary fixtures: PASS.
- [[GOV-DEBT-0007]]: closed by [[EVID-0003]].
- [[PROC-BRAIN-GOVERNANCE-PILOT]]: validated.

## R7 PRD-07 Intake Certification

- Exact source admission: certified PASS at implementation commit `e1ab8d28984ac022f49133d21059ed1502c8b081`.
- Controlled source corpus: 446 artifacts with five post-R3 admissions and zero active POC dependencies.
- `DOC-PRD-07`: Markdown authority exposed as proposed; supporting handoff registered without a proxy.
- Evidence and audit: [[EVID-0004]] and [[AUDIT-0004]].

## R7 W0 Harness Bootstrap Certification

- Certified state commit: `c25daedd33dc33ece3f70ab6867f6477a40c4ea1`.
- Stable verification: 46/46 Brain/governance/R6 tests plus 28/28 W0 tests PASS.
- Brain and Governance Doctors, controlled ingestion, index drift, link validation and clean-rebuild boundary: PASS.
- Architecture lint: 15 harness Python files, six rules and zero violations; the seeded forbidden dependency is detected in its negative fixture.
- Boundary: 24 exact hash-pinned development-tool paths; zero active POC dependencies.
- Portability: Git-clean blob plus canonical LF digest checks pass in a fresh 446-source checkout.
- Readiness: 13 `HARNESS-BLOCKED`, zero `READY`, zero proof-run IDs and zero proof-evidence IDs.
- [[ADR-0008]]: **ACCEPTED** by the project owner on 2026-09-06 for the development-only proof-harness boundary.
- Evidence and audit: [[EVID-0005]] and [[AUDIT-0005]].

## Later Activation Milestones

- G1 registry and core identity: planned in [[GOV-DEBT-0002]].
- G2 persistent V1 world: planned in [[GOV-DEBT-0003]].
- G3 external Forge/mod content: planned in [[GOV-DEBT-0004]].
- G4 multiplayer/server exposure: planned in [[GOV-DEBT-0005]].
- G5 release/distribution: planned in [[GOV-DEBT-0006]].

R7 dependency/export readiness is active under [[TASK-20260906-005]] and [[WORK-20260906-005]]. ADR-0001 through ADR-0007 remain proposed, [[CONFLICT-0002]] remains open, and R8 gameplay permission remains closed. Planned validators do not claim active protection before their owning system exists.
