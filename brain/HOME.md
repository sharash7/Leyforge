---
brain_schema: 1
id: "HOME"
type: "home"
title: "Leyforge Project Brain"
status: "active"
information_class: "authored"
created: "2026-09-06"
updated: "2026-09-06"
authority_domain: "brain_operations"
authority_role: "primary"
authority_status: "authoritative"
related_to:
  - "SYS-PROJECT-BRAIN"
  - "SYS-ENGINEERING-GOVERNANCE"
  - "DASH-PROJECT-STATE"
  - "DASH-GOVERNANCE"
  - "CURRENT-HANDOFF"
---

# Leyforge Project Brain

This vault is the governed navigation, traceability, work-memory and evidence layer for Leyforge. Source documents remain authoritative at their canonical repository paths; Brain document records are proxies and must defer to those files.

## Start here

1. Read [[AGENTS|Agent Operating Contract]].
2. Read [[CURRENT-HANDOFF|Current Handoff]].
3. Read [[DASH-PROJECT-STATE|Project State]].
4. For engineering work, read [[DASH-GOVERNANCE|Engineering Governance Health]].
5. Open the relevant generated index under `01_INDEXES/Generated`.
6. Follow the target record to its source authority, decisions, implementation and evidence.

## Core navigation

- [[INDEX-PROJECT|Project]]
- [[INDEX-DOCUMENT|Documents]]
- [[INDEX-SYSTEMS|Systems]]
- [[INDEX-REQUIREMENT|Requirements]]
- [[INDEX-DECISION|Decisions]]
- [[INDEX-WORK|Work]]
- [[INDEX-SKILLS|Skills and Learning]]
- [[INDEX-TESTING|Testing and Evidence]]
- [[INDEX-AUDIT|Audit]]
- [[INDEX-RISK|Risks]]
- [[INDEX-CONFLICT|Conflicts]]

## Command line

Run from the repository root:

```powershell
python brain/92_SCRIPTS/brain.py doctor --profile quick
python brain/92_SCRIPTS/brain.py query --type requirement
python brain/92_SCRIPTS/brain.py trace REQ-BRAIN-HEADLESS-001 --direction both
python brain/92_SCRIPTS/governance.py query --record-type architecture_decision
python tools/verify.py --tier focused
```

The Brain is plain repository data. Obsidian improves navigation, but the CLI, validation and Git history work without the GUI or community plugins.
