---
brain_schema: 1
id: "AGENTS"
type: "system"
title: "Brain Agent Operating Contract"
status: "locked"
information_class: "authored"
created: "2026-09-06"
updated: "2026-09-06"
authority_domain: "brain_operations"
authority_role: "delegated"
authority_status: "authoritative"
derived_from:
  - "DOC-LF-BRAIN-09"
---

# Brain Agent Operating Contract

Follow the root `AGENTS.md` and the canonical LF-BRAIN-01 through LF-BRAIN-13 sources. This note is the concise runtime contract; it does not replace those sources.

## Startup sequence

1. Read this contract.
2. Read [[CURRENT-HANDOFF]].
3. Read [[HOME]].
4. Open the relevant generated index.
5. Read the target record and its canonical authority.
6. Read linked decisions, learned knowledge, implementation and evidence.

## Operating rules

- Query before scanning. Do not blindly read the whole vault.
- Treat `.summer/00_Docs` sources as authority according to their owning status. Brain proxies are navigation records.
- Do not guess authority, resolve a conflict silently, or promote a proposed ADR/Decision.
- Create a Work Record for significant work and close it with verification, discoveries, remaining work and an active Handoff.
- Candidate skills and lessons may be captured, but validation is a separate governed state change.
- Do not edit files marked `information_class: generated` or `edit_policy: do_not_edit`; run their generator.
- Run Brain Doctor after meaningful changes. Certification requires the full R4 acceptance gate.
- Gameplay implementation remains closed until its later governing gate explicitly opens it.

## Headless commands

```powershell
python brain/92_SCRIPTS/brain.py doctor --profile quick
python brain/92_SCRIPTS/brain.py query --id SYS-PROJECT-BRAIN --format json
python brain/92_SCRIPTS/brain.py links
python brain/92_SCRIPTS/brain.py index --check
python brain/92_SCRIPTS/brain.py ingest --check
```
