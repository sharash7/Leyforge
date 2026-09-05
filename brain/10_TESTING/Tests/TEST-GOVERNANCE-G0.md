---
brain_schema: 1
id: "TEST-GOVERNANCE-G0"
type: "test"
title: "R5 G0 Engineering Governance Acceptance Suite"
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
  - "EVID-0002"
derived_from:
  - "DOC-B-OPS-01"
  - "DOC-B-OPS-05"
  - "DOC-B-OPS-06"
---

# R5 G0 Engineering Governance Acceptance Suite

GOV-AT-001 through GOV-AT-018 cover the installed Branch B manifest and statuses, 12 source-derived templates, governance metadata and IDs, risk classes, template versions, ADR/dependency references, waiver expiry, debt-rule links, agent bootstrap, stable validation entrypoints, CI, Brain integration, controlled PRD intake, duplicate-authority prevention, and the closed release/gameplay boundary.

The full entrypoint also reruns the R4 Brain suite, ingestion/index/link drift checks, both Doctors and the clean-rebuild boundary.
