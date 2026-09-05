---
brain_schema: 1
id: "GOV-DEBT-0006"
type: "deviation"
title: "G5 release and distribution certification validators"
status: "proposed"
information_class: "authored"
created: "2026-09-06"
updated: "2026-09-06"
authority_domain: "engineering_governance"
authority_role: "provisional_record"
authority_status: "proposed"
record_type: "governance_debt"
governance_status: "planned"
domain: "release"
risk_class: "E"
template_version: 1
rules:
  - "BOP05-080"
activation_milestone: "G5"
current_protection: "Release gate returns BLOCKED while G5 and R8 are closed"
desired_mechanism: "Dependency, licence, reproducibility, packaging, upgrade, rollback and certification validation"
owning_domain: "release"
derived_from:
  - "DOC-B-OPS-05"
---

# GOV-DEBT-0006 — G5 release and distribution certification validators

Activate the B-OPS-05 G5 protection set before release or distribution. The R5 CLI deliberately reports the release gate as blocked rather than fabricating release readiness.
