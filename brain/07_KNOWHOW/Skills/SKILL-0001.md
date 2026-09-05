---
brain_schema: 1
id: "SKILL-0001"
type: "skill"
title: "Regenerate Brain-owned outputs instead of editing them"
status: "candidate"
information_class: "authored"
created: "2026-09-06"
updated: "2026-09-06"
authority_domain: "brain_operations"
authority_role: "provisional_record"
authority_status: "proposed"
derived_from:
  - "EVID-0001"
related_to:
  - "MOD-BRAIN-CLI"
---

# Regenerate Brain-owned outputs instead of editing them

## Trigger

A generated Document proxy, registry or index needs to change.

## Procedure

Change the governing source or generator, run `brain ingest --write` or `brain index --write`, inspect the diff, then run Brain Doctor. Never patch content inside an artifact marked `edit_policy: do_not_edit`.

## Validation state

Candidate until repeated R4/R5 use confirms the procedure and its failure behavior.
