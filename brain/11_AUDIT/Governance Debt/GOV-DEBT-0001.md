---
brain_schema: 1
id: "GOV-DEBT-0001"
type: "deviation"
title: "G0 governance metadata and entrypoint automation"
status: "resolved"
information_class: "authored"
created: "2026-09-06"
updated: "2026-09-06"
authority_domain: "engineering_governance"
authority_role: "implementation_record"
authority_status: "certified"
record_type: "governance_debt"
governance_status: "closed"
domain: "engineering_governance"
risk_class: "B"
template_version: 1
rules:
  - "BOP05-030"
  - "BOP05-031"
  - "BOP05-032"
  - "BOP05-033"
  - "BOP05-034"
  - "BOP05-035"
  - "BOP05-036"
  - "BOP05-037"
  - "BOP05-038"
  - "BOP05-039"
activation_milestone: "G0"
current_protection: "R5 governance CLI, root AGENTS, stable verification entrypoints, CI and Brain procedures"
desired_mechanism: "Operational G0 metadata, identity, reference, waiver and entrypoint validation"
owning_domain: "engineering_governance"
closure_evidence: "EVID-0002"
derived_from:
  - "DOC-B-OPS-05"
related_to:
  - "SYS-ENGINEERING-GOVERNANCE"
  - "EVID-0002"
  - "AUDIT-0002"
---

# GOV-DEBT-0001 — G0 governance metadata and entrypoint automation

## Governed Rules

BOP05-030 through BOP05-039.

## Gap

At R4 closeout the certified Branch B corpus was navigable, but its G0 validators, templates, task contract, worktree knowledge and CI entrypoints were not operational.

## Current Protection

The R5 governance CLI validates metadata, identity, references, risk classes, template versions, rule links and active-waiver expiry. Root agent instructions, stable verification tiers, CI and reusable worktree guidance are active.

## Closure Evidence

[[EVID-0002]] and [[AUDIT-0002]] certify the implementation at `f9ea015a90706b302df9846040a1fe51f02ce6f9`. G0 is closed. G1 through G5 remain planned and must activate only at their governed milestones.
