---
brain_schema: 1
id: "IFACE-BRAIN-CLI"
type: "interface"
title: "Brain CLI Contract"
status: "active"
information_class: "authored"
created: "2026-09-06"
updated: "2026-09-06"
authority_domain: "brain_operations"
authority_role: "implementation_record"
authority_status: "authoritative"
used_by:
  - "MOD-BRAIN-CLI"
  - "TEST-BRAIN-ACCEPTANCE"
---

# Brain CLI Contract

The stable v0.1 entry point is `python brain/92_SCRIPTS/brain.py <command>`. Machine consumers use `--format json` where offered and process exit code zero as pass. Mutating generators require explicit `--write`; checks are read-only by default.
