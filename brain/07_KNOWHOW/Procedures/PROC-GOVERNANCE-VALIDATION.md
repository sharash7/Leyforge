---
brain_schema: 1
id: "PROC-GOVERNANCE-VALIDATION"
type: "procedure"
title: "Run the engineering-governance validation gates"
status: "validated"
information_class: "authored"
created: "2026-09-06"
updated: "2026-09-06"
authority_domain: "engineering_governance"
authority_role: "implementation_record"
authority_status: "authoritative"
record_type: "skill"
governance_status: "validated"
domain: "engineering_governance"
template_version: 1
derived_from:
  - "DOC-B-OPS-01"
  - "DOC-B-OPS-05"
  - "DOC-B-OPS-06"
related_to:
  - "SYS-ENGINEERING-GOVERNANCE"
---

# Run the engineering-governance validation gates

## Purpose

Use one stable command family for local work, CI and later agent handoffs.

## Prerequisites / Environment

- Python 3 with only the standard library.
- Repository root as the working directory.
- No Godot process is required for R5 governance validation.

## Steps

1. During editing, run `python brain/92_SCRIPTS/governance.py doctor --profile quick`.
2. For a focused governance gate, run `python tools/verify.py --tier focused`.
3. Before handoff or publication, run `python tools/verify.py --tier full`.
4. Use `governance.py query`, `rules --check`, `waivers --check`, `references --check`, or `impact --path` for a narrowed diagnosis.

## Verification of Success

The command exits zero and reports `PASS`. A blocked release gate is expected while G5 and R8 are closed.

## Safety / Governance Constraints

Generate templates from B-OPS-03 with `templates --write`; do not edit derived template files by hand. Do not update the hash-pinned authority manifest merely to silence a source drift failure.
