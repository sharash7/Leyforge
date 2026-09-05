---
brain_schema: 1
id: "GOV-DEBT-0004"
type: "deviation"
title: "G3 external Forge and mod-content validators"
status: "proposed"
information_class: "authored"
created: "2026-09-06"
updated: "2026-09-06"
authority_domain: "engineering_governance"
authority_role: "provisional_record"
authority_status: "proposed"
record_type: "governance_debt"
governance_status: "planned"
domain: "external_content"
risk_class: "E"
template_version: 1
rules:
  - "BOP05-064"
activation_milestone: "G3"
current_protection: "External packages and Forge runtime activation are closed"
desired_mechanism: "Manifest, path containment, schema, policy and transactional activation validation"
owning_domain: "forge"
derived_from:
  - "DOC-B-OPS-05"
---

# GOV-DEBT-0004 — G3 external Forge and mod-content validators

Activate the B-OPS-05 G3 validator family before any external Forge package or mod content can affect authoritative project/runtime state.
