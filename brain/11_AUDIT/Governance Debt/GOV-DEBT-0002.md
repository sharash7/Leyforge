---
brain_schema: 1
id: "GOV-DEBT-0002"
type: "deviation"
title: "G1 registry and core identity validators"
status: "proposed"
information_class: "authored"
created: "2026-09-06"
updated: "2026-09-06"
authority_domain: "engineering_governance"
authority_role: "provisional_record"
authority_status: "proposed"
record_type: "governance_debt"
governance_status: "planned"
domain: "registry"
risk_class: "E"
template_version: 1
rules:
  - "BOP05-040"
  - "BOP05-043"
  - "BOP05-046"
activation_milestone: "G1"
current_protection: "Gameplay and registry implementation remain closed; historical identities are evidence only"
desired_mechanism: "Authoritative namespace, reference, projection, generation and alias validators"
owning_domain: "registry"
derived_from:
  - "DOC-B-OPS-05"
related_to:
  - "ADR-0006"
---

# GOV-DEBT-0002 — G1 registry and core identity validators

Implement the complete B-OPS-05 G1 validator family once the V1 registry and namespace contracts are authoritative. This planned record prevents the present generic governance ID check from being mistaken for a game registry validator.
