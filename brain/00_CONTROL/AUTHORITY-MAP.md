---
brain_schema: 1
id: "AUTHORITY-MAP"
type: "system"
title: "Brain Authority Map"
status: "locked"
information_class: "authored"
created: "2026-09-06"
updated: "2026-09-06"
authority_domain: "brain_operations"
authority_role: "delegated"
authority_status: "authoritative"
derived_from:
  - "DOC-LF-BRAIN-02"
  - "DOC-LF-BRAIN-04"
  - "DOC-B-OPS-00"
  - "DOC-B-OPS-04"
conflicts_with:
  - "CONFLICT-0002"
---

# Brain Authority Map

Brain records expose authority; they do not create it. Resolve a claim by domain, owning source, declared source status, specificity, supersession and evidence. If those checks do not produce a deterministic answer, create a Conflict and stop the authority-sensitive change.

| Domain | Current source surface | Brain treatment |
| --- | --- | --- |
| Brain operations | LF-BRAIN-01 through LF-BRAIN-13 and SET-A | Locked source; generated proxies defer to canonical files |
| Engineering governance | ENG-GOV-00 through ENG-GOV-15 and B-OPS-00 through B-OPS-06 | Branch B sources retain primary authority; the hash-pinned manifest, validators and Brain records apply and expose them |
| Audit | C-AUD corpus | Source-owned status; unresolved coverage remains visible |
| Production | D-ROAD corpus | Current execution map, subject to source-status reconciliation |
| Requirements | PRD corpus and accepted requirement sources | Closure candidates remain proposed until their owner promotes them |
| Content canon | Documents 00–30 and later governed sources | Register first; create selective proxies only when useful |
| Implementation state | Repository implementation records | Record what exists at a tested commit |
| Testing evidence | Test and Evidence records | Evidence proves only the exact command and source state recorded |

Authority statuses and roles are validated from `brain/91_SCHEMA/brain.schema.json`. Branch B application metadata is validated from `brain/91_SCHEMA/governance.schema.json`. The adapter adds no competing canon or engineering law.
