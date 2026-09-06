---
brain_schema: 1
id: "GOV-DEBT-0007"
type: "deviation"
title: "R6 headless query and dated stable-ID operator contract"
status: "resolved"
information_class: "authored"
created: "2026-09-06"
updated: "2026-09-06"
authority_domain: "engineering_governance"
authority_role: "implementation_record"
authority_status: "certified"
record_type: "governance_debt"
governance_status: "closed"
domain: "brain_operations"
risk_class: "B"
template_version: 1
rules:
  - "BOP04-006"
  - "BOP04-019"
  - "BOP05-007"
  - "BOP05-120"
  - "BOP05-121"
  - "BOP05-122"
activation_milestone: "G0"
current_protection: "Certified free-text authority search and schema-aware dated ID allocation"
desired_mechanism: "Tested free-text authority search and schema-aware dated ID allocation through the headless CLIs"
owning_domain: "engineering_governance"
closure_evidence: "EVID-0003"
derived_from:
  - "DOC-REBUILD-00"
  - "DOC-B-OPS-04"
  - "DOC-B-OPS-05"
related_to:
  - "WORK-20260906-002"
  - "TASK-20260906-002"
  - "TEST-GOVERNANCE-R6"
  - "EVID-0003"
  - "AUDIT-0003"
  - "CHANGE-20260906-002"
---

# GOV-DEBT-0007 — R6 headless query and dated stable-ID operator contract

## Gap

The certified R5 handoff advertised a free-text query form that the installed CLIs rejected. The generic Brain allocator emitted a four-digit Task suffix, while the governance allocator omitted the required date segment for Work and Task records.

## Current Protection

The certified CLIs expose tested free-text lookup, authority role and owning status, and schema-valid dated ID allocation. Undated governed prefixes are rejected.

## Desired Mechanism

Both CLIs accept `--text`; governance results distinguish primary authority sources from operational records and expose owning status. Both allocators generate IDs that validate against the applicable dated schema.

## Closure Evidence

[[EVID-0003]] and [[AUDIT-0003]] certify the repaired operator contract at `dd17cd6c5a24ab71aafd5ebf0c252461aa09aef4`. This G0 gap is closed.
