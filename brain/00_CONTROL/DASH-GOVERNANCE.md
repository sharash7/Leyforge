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
  - "GOV-DEBT-0007"
  - "TEST-GOVERNANCE-R6"
  - "EVID-0003"
  - "AUDIT-0003"
  - "HANDOFF-20260906-002"
---

# Engineering Governance Health

## G0 — Repository and Governance Bootstrap

- Authority manifest: active, 23 Branch B sources hash-pinned.
- Agent bootstrap: active.
- Templates: active, 12 source-derived files.
- Governance metadata and references: active.
- Waiver expiry: active.
- Stable build, focused-test and full-validation entrypoints: active.
- CI: active.
- Brain integration: active.

## R6 Operating Pilot

- Seven REBUILD-00 pilot paths: certified PASS.
- Headless free-text authority lookup: active and tested.
- Dated Work, Task and Change ID allocation: active and tested.
- ADR-trigger, violation, waiver, stale-summary and legacy-boundary fixtures: PASS.
- [[GOV-DEBT-0007]]: closed by [[EVID-0003]].
- [[PROC-BRAIN-GOVERNANCE-PILOT]]: validated.

## Later Activation Milestones

- G1 registry and core identity: planned in [[GOV-DEBT-0002]].
- G2 persistent V1 world: planned in [[GOV-DEBT-0003]].
- G3 external Forge/mod content: planned in [[GOV-DEBT-0004]].
- G4 multiplayer/server exposure: planned in [[GOV-DEBT-0005]].
- G5 release/distribution: planned in [[GOV-DEBT-0006]].

R7 technical and audit work proceeds through [[HANDOFF-20260906-002]]. R8 gameplay permission remains closed. Planned validators do not claim active protection before their owning system exists.
