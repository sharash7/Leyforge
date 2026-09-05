---
brain_schema: 1
id: "MOD-BRAIN-CLI"
type: "implementation_module"
title: "Brain Standard-Library CLI"
status: "active"
information_class: "authored"
created: "2026-09-06"
updated: "2026-09-06"
authority_domain: "implementation_state"
authority_role: "implementation_record"
authority_status: "authoritative"
repository_paths:
  - "brain/92_SCRIPTS/brain.py"
implements:
  - "REQ-BRAIN-HEADLESS-001"
  - "ARCH-BRAIN-HEADLESS-TOOLING"
interfaces:
  - "IFACE-BRAIN-CLI"
tested_by:
  - "TEST-BRAIN-ACCEPTANCE"
---

# Brain Standard-Library CLI

`brain.py` owns record parsing, validation, deterministic generated outputs, repository-backed queries, stable-ID assistance, trace traversal, migration dry runs, changed-path impact and R4 certification orchestration. It performs no network access and executes no note content.
