---
brain_schema: 1
id: "PROC-PARALLEL-WORKTREES"
type: "procedure"
title: "Isolate parallel agent work with Git worktrees"
status: "validated"
information_class: "authored"
created: "2026-09-06"
updated: "2026-09-06"
authority_domain: "engineering_governance"
authority_role: "implementation_record"
authority_status: "authoritative"
record_type: "skill"
governance_status: "validated"
domain: "git_workflow"
template_version: 1
derived_from:
  - "DOC-B-OPS-02"
  - "DOC-B-OPS-05"
  - "DOC-ENG-GOV-04"
related_to:
  - "SYS-ENGINEERING-GOVERNANCE"
---

# Isolate parallel agent work with Git worktrees

## Purpose

Give each concurrent task a separate checkout and branch so filesystem writes, indexes and staging state cannot collide.

## Prerequisites / Environment

- A clean or understood source checkout.
- One unique `codex/` branch and one sibling worktree path per task.
- Explicit knowledge of any user-owned dirty files before work begins.

## Steps

1. Record the source branch, commit and dirty status.
2. Create a uniquely named branch and sibling worktree from the authorized starting commit.
3. Assign only that worktree to the task; never let two writing agents share one checkout.
4. Before integration, run the task's focused and full validation entrypoints.
5. Inspect `git status`, `git diff --check` and the complete staged diff before commit.
6. Integrate through the governed Git workflow and remove a worktree only after its state is safely published or deliberately retained.

## Verification of Success

`git worktree list` shows distinct paths/branches, each task has an independent status, and integration contains only the intended diff.

## Known Failure Modes

- Sharing a checkout causes generated files or staging state to race.
- Creating branches from different unrecorded dirty states makes later reconciliation ambiguous.
- Removing a worktree before preserving its unique state can lose work.

## Safety / Governance Constraints

Preserve unrelated dirty changes. Never use destructive cleanup to make a worktree appear clean.
