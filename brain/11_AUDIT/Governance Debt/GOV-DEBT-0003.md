---
brain_schema: 1
id: "GOV-DEBT-0003"
type: "deviation"
title: "G2 persistent V1 world-state validators"
status: "proposed"
information_class: "authored"
created: "2026-09-06"
updated: "2026-09-06"
authority_domain: "engineering_governance"
authority_role: "provisional_record"
authority_status: "proposed"
record_type: "governance_debt"
governance_status: "planned"
domain: "persistence"
risk_class: "E"
template_version: 1
rules:
  - "BOP05-053"
activation_milestone: "G2"
current_protection: "No V1 runtime or persistent world exists; R8 gameplay permission is closed"
desired_mechanism: "Save schema, round-trip, migration, corruption, recovery and interruption validation"
owning_domain: "persistence"
derived_from:
  - "DOC-B-OPS-05"
related_to:
  - "ADR-0007"
---

# GOV-DEBT-0003 — G2 persistent V1 world-state validators

Activate the full B-OPS-05 G2 protection set before the first persistent V1 world state. Historical POC saves are not the V1 contract.
