---
brain_schema: 1
id: "TEST-BRAIN-ACCEPTANCE"
type: "test"
title: "Brain v0.1 Acceptance Suite"
status: "active"
information_class: "authored"
created: "2026-09-06"
updated: "2026-09-06"
authority_domain: "testing_evidence"
authority_role: "delegated"
authority_status: "authoritative"
verification_command: "python -m unittest discover brain/92_SCRIPTS/tests -v"
tests:
  - "MOD-BRAIN-CLI"
  - "REQ-BRAIN-HEADLESS-001"
evidence:
  - "EVID-0001"
---

# Brain v0.1 Acceptance Suite

The suite maps twenty named tests to BRAIN-AT-001 through BRAIN-AT-020. It verifies startup roots, schema, IDs, authority, ingestion, supersession rules, Work and Handoff structure, indexes, Bases, Canvas, headless query, deterministic generation, migration safety, plugin policy, traceability, Git integration and certification evidence.
