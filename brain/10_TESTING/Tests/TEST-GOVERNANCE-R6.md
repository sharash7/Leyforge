---
brain_schema: 1
id: "TEST-GOVERNANCE-R6"
type: "test"
title: "R6 Brain-to-Governance Operating Pilot Acceptance Suite"
status: "active"
information_class: "authored"
created: "2026-09-06"
updated: "2026-09-06"
authority_domain: "testing_evidence"
authority_role: "implementation_record"
authority_status: "authoritative"
verification_command: "python tools/verify.py --tier full"
tests:
  - "SYS-ENGINEERING-GOVERNANCE"
evidence:
  - "EVID-0003"
derived_from:
  - "DOC-REBUILD-00"
  - "DOC-ENG-GOV-11"
  - "DOC-B-OPS-04"
related_to:
  - "WORK-20260906-002"
  - "TASK-20260906-002"
  - "GOV-DEBT-0007"
  - "PROC-BRAIN-GOVERNANCE-PILOT"
  - "AUDIT-0003"
---

# R6 Brain-to-Governance Operating Pilot Acceptance Suite

R6-AT-001 through R6-AT-007 cover the seven REBUILD-00 pilot tasks: authority lookup, Work and Task lifecycle, ADR-trigger routing, harmless violation and bounded-waiver routing, Procedure promotion, disposable stale-index repair, and legacy POC classification.

The suite proves that the repaired operator interface returns source ownership and status, allocates valid dated IDs, reports architectural decisions without inventing acceptance, records enforcement gaps as governance debt, lets owning records replace stale summaries, and keeps the historical POC outside the active runtime.

The full entrypoint also runs the complete Brain and Governance suites, controlled-ingestion and generated-index drift checks, relationship validation, both certification Doctors, the R6 machine pilot, and the clean-rebuild boundary.
