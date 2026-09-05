# ENG-GOV-04 — Leyforge Git / Branch / Change Standard

**Document ID:** ENG-GOV-04  
**Title:** Leyforge Git / Branch / Change Standard  
**Version:** v0.1  
**Status:** THEORETICALLY LOCKED  
**Authority Domain:** Engineering Governance — Git / Branch / Change Management  
**Parent Authority:** ENG-GOV-00 — Leyforge Engineering Constitution  
**Related Standards:** ENG-GOV-01, ENG-GOV-02, ENG-GOV-03  
**Project:** Leyforge

---

## 00. Purpose and Scope

ENG-GOV-04 defines how engineering changes move from local work into Leyforge's durable Git history.

It governs branches, worktrees, commits, integration, mainline protection, change sizing, history rewriting, reverts, hotfixes, conflict handling, Git hygiene, AI-agent Git behaviour and release/reference tag safety.

It does not define code architecture, test requirements, CI implementation or the project's distinct version domains.

---

## 01. Mainline Model

### EG04-001 — ENG-GOV-04 Governs Change Integration Rather Than Implementation Architecture

This standard governs Git and change-flow behaviour. Architecture remains governed by ENG-GOV-01/02 and LFE/FORGE-ENG; source naming by ENG-GOV-03; testing by ENG-GOV-05; CI by ENG-GOV-06.

### EG04-002 — Leyforge Uses a Mainline-Oriented Integration Model

The canonical integration branch, expected to be `main` unless the repository declares another name, is the authoritative current integrated code line.

Development should integrate toward main frequently using short-lived task branches.

### EG04-003 — Main Must Remain Buildable, Bootable and Regression-Green

A known-broken mainline is an engineering incident.

When a merged change breaks main, the regression must be prioritised immediately and either fixed quickly or reverted so that the trusted integration baseline is restored.

### EG04-004 — Consequential Implementation Does Not Normally Occur Directly on Main

Normal consequential development occurs on isolated task branches or worktrees.

Direct-main intervention is reserved for exceptional recovery under the governed emergency procedure.

---

## 02. Branch Structure

### EG04-005 — Task Branches Should Be Short-Lived

Task branches should normally live for hours to a few working days rather than weeks or months.

Long-lived branches should trigger reconsideration of scope, slicing, feature flags, architecture readiness or experimental status.

### EG04-006 — A Task Branch Represents One Coherent Purpose

A branch should have one understandable goal.

Unrelated systems or behaviours should not be bundled simply because one contributor or agent happened to work on them together.

### EG04-007 — Branch Names Communicate Work Type and Purpose

Recommended forms:

```text
<type>/<work-id>-<short-description>
```

or:

```text
<type>/<short-description>
```

Useful types include:

```text
feat/
fix/
refactor/
docs/
test/
perf/
chore/
spike/
hotfix/
```

Branch names should be portable, lowercase and concise.

### EG04-008 — Branch Names Describe Work Rather Than Contributor Identity

Branch taxonomy should describe the change, not the human or AI performing it.

Normal names such as `codex-branch-7`, `chatgpt-work` or `johns-stuff` should be avoided.

---

## 03. Parallel Work and Worktrees

### EG04-009 — Parallel Coding Agents Should Normally Use Isolated Worktrees or Equivalent Isolated Checkouts

Independent agents should not share one mutable working directory.

Each parallel task should normally receive its own branch and isolated worktree.

### EG04-010 — One Branch Has One Active Mutation Context at a Time

Multiple contributors or agents must not independently mutate the same branch/worktree simultaneously without deliberate coordination.

Shared work should be split, explicitly handed off or integrated first.

### EG04-011 — Existing Uncommitted Work Must Be Preserved

Before significant editing, contributors and agents must inspect repository/worktree state.

Unrelated uncommitted changes must not be discarded, overwritten, reset, hidden or reformatted casually.

Unknown changes are treated as potentially valuable work.

---

## 04. Destructive and History-Rewriting Operations

### EG04-012 — Destructive Git Commands Are Prohibited by Default

Commands such as `git reset --hard`, `git clean -fd`, forced overwrite checkout and uncontrolled mass restore must not be used casually.

Destructive operations require clear understanding of what will be lost, explicit justification and preservation where relevant.

### EG04-013 — Published or Shared History Must Not Be Rewritten Casually

Local unpublished history may be rebased, amended or squashed when useful.

Once a branch or commit becomes shared with contributors or automation, history stability takes precedence.

Force-pushing shared work requires deliberate coordination.

---

## 05. Commit Structure

### EG04-014 — A Commit Represents One Coherent Conceptual Change

Commit quality is determined by conceptual atomicity rather than line count.

A commit should be understandable and reasonably revertible as one idea.

### EG04-015 — Integration-Ready Commits Should Leave the Repository in a Meaningful State

Non-WIP commits intended for integration should not deliberately leave broken compilation, half-finished API transitions, missing migrations or known failing essential tests where avoidable.

Temporary broken checkpoints may exist locally but should normally be cleaned before integration.

### EG04-016 — WIP Commits Are Permitted Locally

Local checkpoint commits are allowed and encouraged where useful.

Sequences such as `wip`, `fix`, `oops`, `works now` should normally be reorganised before integration if they add no durable historical value.

---

## 06. Commit Messages

### EG04-017 — Commit Messages Use Concise Structured Subjects

Leyforge uses a Conventional-Commit-inspired format without automatically coupling it to release versioning:

```text
<type>(<optional-scope>): <imperative summary>
```

Examples:

```text
feat(settlements): add transactional bed assignment
fix(save): preserve backup after failed migration
refactor(inventory): isolate transaction validation
test(worldgen): add cross-order determinism fixture
docs(governance): add ENG-GOV-04
```

### EG04-018 — Commit Subjects Must Be Meaningful Without Opening the Diff

Subjects such as `update stuff`, `changes`, `fix`, `working now` or `codex changes` are not acceptable durable history.

### EG04-019 — Commit Bodies Explain Non-Obvious Rationale

Consequential commits may record why the change was required, important trade-offs, migration implications, compatibility constraints and related issues or ADRs.

Commit bodies should reference rather than duplicate authoritative documents.

### EG04-020 — Consequential Changes Record Verification Evidence

The integration/change record should identify relevant verification, such as focused tests, migration checks, integration suites or manual scenarios.

The exact storage mechanism may be the PR/change template rather than every individual commit.

---

## 07. Reviewable Change Construction

### EG04-021 — Refactoring and Behavioural Change Should Normally Be Separate

Where practical, behaviour-preserving structure changes and behavioural modifications should be distinguishable in separate commits or changes.

### EG04-022 — Broad Formatting Changes Must Not Obscure Functional Changes

Large mechanical formatting churn should be separated from consequential logic changes where practical.

### EG04-023 — Generated-Output Changes Should Be Isolated When Useful

Changes to generators and regenerated output may be separated when doing so improves reviewability and preserves source-of-truth clarity.

### EG04-024 — Leyforge Has No Arbitrary Maximum Lines-Per-Change Rule

Changes are judged by conceptual coherence, reviewability and blast radius rather than a fixed line count.

### EG04-025 — Large Initiatives Should Integrate Through Safe Slices

Long-running work should be decomposed into safe vertical or architectural slices where practical rather than remaining isolated on giant divergent branches.

### EG04-026 — Incomplete Work May Integrate Behind Explicit Non-Production Boundaries

Development-only entry points, feature flags, disabled registration and similar mechanisms may allow incremental integration when incomplete behaviour cannot become normal production authority.

### EG04-027 — Spike Branches Are Disposable Evidence Branches

A `spike/` branch exists to answer a technical question.

Its findings should be recorded. The implementation may then be discarded or deliberately rebuilt/hardened for production.

Experimental code does not become production code automatically.

---

## 08. Review and Merge Readiness

### EG04-028 — Review Semantic Risk Before Cosmetic Detail

Recommended review order:

1. Should the change exist?
2. Does it respect authority?
3. Is the architecture correct?
4. Is the behaviour correct?
5. Are state, data and resources safe?
6. Are failure cases safe?
7. Is verification sufficient?
8. Is the implementation understandable?
9. Does style conform?

### EG04-029 — Evidence Outranks Preference During Review

Authority, tests, benchmarks, reproductions, documentation and technical evidence outrank personal taste.

Architectural disagreement should escalate through the appropriate authority or ADR process.

### EG04-030 — A Branch Is Merge-Ready Only When Applicable Completion Obligations Are Satisfied

Depending on risk, merge readiness may require completed implementation, passing verification, CI success, migrations, ADRs, documentation, Brain/work-log updates and explained known limitations.

Not every change requires every artifact.

### EG04-031 — Leyforge Prefers a Readable Mainline History

Squash merge is preferred when intermediate commits are merely development checkpoints.

Individually meaningful commits may be preserved.

Merge commits remain valid when they preserve useful topology, such as upstream or coordinated integration.

Readable history is the objective.

### EG04-032 — Branches Must Be Current Enough to Integrate Safely

Where mainline changes create conflicts or semantic interaction, the branch must reconcile sufficiently recent main state before integration.

### EG04-033 — Merge Conflicts Require Semantic Resolution

A merge conflict is not resolved merely because conflict markers disappear.

The resolver must understand which behaviour is authoritative and whether interfaces, tests or migrations also require changes.

### EG04-034 — Agents Must Not Guess Through Consequential Merge Conflicts

Consequential conflicts involving persistence, stable identity, architecture, canon or transaction logic require consultation of relevant authority and evidence before resolution.

---

## 09. Reverts, Hotfixes and Recovery

### EG04-035 — Revert Is a Normal Recovery Tool

If main is broken and a safe fix is not immediately available, revert the damaging integration, restore main, investigate on a branch and reintegrate correctly later.

### EG04-036 — Reverted Changes Remain Historically Visible

History must not be rewritten to pretend a failed integration never happened.

The revert remains useful evidence, and important lessons should propagate to the Project Brain where appropriate.

### EG04-037 — Cherry-Picks Are Permitted for Deliberate Backports and Isolated Transfers

Cherry-picks should preserve traceability to their originating changes.

They should not become the default mechanism for avoiding normal branch synchronization.

### EG04-038 — Urgent Production Fixes Use a Bounded Hotfix Path

A hotfix should start from the correct release or integration base, make the smallest safe correction, receive risk-appropriate verification, merge into the affected line and propagate to main where necessary.

Emergency status does not justify bypassing data safety.

### EG04-039 — Direct-Main Intervention Is Reserved for Exceptional Recovery

If normal branch tooling cannot be used during a critical repository recovery, direct intervention may occur under the emergency exception procedure.

The action must then be documented, verified and reconciled.

### EG04-040 — Restoring Main Outranks Unrelated Feature Work

A confirmed integration regression on main becomes priority work.

Unrelated changes should not continue stacking onto a known-broken baseline.

### EG04-041 — Fixes Should Preserve Discoverability of the Regression They Address

Bug fixes should reference relevant issues, incidents, failure records, tests, commits or requirements where known.

---

## 10. Git and Project Knowledge

### EG04-042 — Git Is Not the Project-Management Database

Branch deletion or merge must not erase decision rationale, follow-up work, known limitations, architecture decisions or debt.

Those belong in the appropriate Project Brain, ADR or tracking records.

### EG04-043 — Consequential AI-Assisted Changes Must Be Traceable Without Polluting Every Symbol

AI provenance should be recorded through relevant work logs, change records or task/session metadata where applicable.

Every commit does not need to announce that AI was involved.

Git authorship must not be deliberately falsified.

### EG04-044 — Agents Describe the Change Rather Than Themselves

AI-generated commit messages must describe the actual engineering change.

`codex updates` or `AI generated changes` are not acceptable durable history.

### EG04-045 — Agent Completion Does Not Imply Commit Permission

Editing, committing, pushing, opening a PR, merging and tagging are distinct permissions.

Task instructions determine which actions an agent is authorised to perform.

### EG04-046 — Remote Publication Is Explicit

A local commit does not automatically grant permission to push, open a PR, merge, tag or publish a release.

### EG04-047 — Stale Merged Branches Should Normally Be Deleted

Merged task branches should be removed when they no longer provide operational value.

History remains in Git.

---

## 11. Tags, Versions and Repository Payload

### EG04-048 — Published Release and Reference Tags Are Immutable

Once a release or formal reference tag is published, it must not be silently moved to another commit.

Corrections use a new version or explicit corrective reference.

### EG04-049 — Git Tags Do Not Collapse Leyforge's Version Domains

Git tags may mark releases or milestones but do not replace distinct version domains such as:

- Game Version
- Save Schema Version
- Worldgen Version
- Registry Schema Version
- Content Version
- Forge Package Version
- Plugin/API Version
- Migration Version

### EG04-050 — Large and Binary Artifacts Require Deliberate Treatment

Exports, captures, archives, generated binaries and temporary large assets must not be committed casually.

Large source assets that genuinely belong in the project require an intentional storage/versioning strategy.

### EG04-051 — Sensitive or Machine-Local Data Must Not Become Normal History

If credentials or sensitive artifacts are accidentally committed, the project must stop, assess exposure, rotate/revoke where necessary and clean history according to the security procedure.

Deleting the file in a later commit does not remove it from history.

---

## 12. Verification and Integration Records

### EG04-052 — Local Preflight Scales with Change Risk

Lightweight changes may require lightweight checks.

Higher-risk changes may require focused tests, migration fixtures, integration tests, benchmarks and manual validation as defined by ENG-GOV-05 and ENG-GOV-06.

### EG04-053 — Consequential Integrated Changes Should Have a Durable Change Summary

A change record should eventually capture fields such as:

```text
What changed?
Why?
Risk class?
Authority?
Tests?
Migration impact?
ADR?
Known limitations?
Brain updates?
```

The process may remain lightweight for low-risk solo work.

### EG04-054 — PR-Style Review Is Useful Even in a Solo + AI Project

A bounded pull-request or equivalent change-review object provides a diff boundary, CI target, change summary, verification evidence and agent-to-human handoff point without requiring enterprise ceremony.

### EG04-055 — Higher-Risk Changes Require an Independent Review Perspective

Class C–E work should receive an independent perspective appropriate to risk.

This may be another human, another AI/model pass, specialised validation tooling or a combination.

The producing agent's self-review alone is not sufficient evidence for high-risk foundational work.

### EG04-056 — Governance Must Not Require Fake Organisational Ceremony

Leyforge does not require arbitrary approval chains that provide no real evidence.

The objective is independent technical confidence, not imitation of large-enterprise bureaucracy.

---

## 13. History as Forensic Evidence

### EG04-057 — Git History Must Support Future Debugging and Archaeology

History should make it possible to determine when behaviour changed, why it changed, what requirement or incident drove it, which tests accompanied it, whether it was later reverted and which ADR or authority governed it.

### EG04-058 — Consequential Git Milestones Must Propagate to the Project Brain

Major architecture integrations, important subsystem completions, consequential reverts, reusable development procedures, important failures and release milestones should update the Brain.

The Brain does not require an entry for every trivial commit.

### EG04-059 — A Committed Implementation Does Not Automatically Redefine Authority

Code reaching `main` does not make conflicting behaviour canonical.

If implementation contradicts authoritative design, the implementation is wrong unless the authority is explicitly amended through its proper process.

### EG04-060 — A Change Is Fully Integrated Only When Implementation, Verification, History and Project Knowledge Agree

A consequential change is complete when its implementation, governing authority, verification evidence, Git history and relevant Project Brain state tell a consistent story.

---

## Recommended Day-to-Day Flow

```text
Read Brain + authority
        ↓
Create/update task branch
        ↓
Use isolated worktree for parallel work
        ↓
Implement bounded change
        ↓
Run focused verification
        ↓
Create coherent commit(s)
        ↓
Reconcile mainline if necessary
        ↓
Run integration gates
        ↓
Review change + evidence
        ↓
Merge into healthy main
        ↓
Remove stale task branch
        ↓
Update Brain when consequential
```

---

## Closing Principle

Leyforge Git history exists to make change understandable, recoverable and trustworthy.

Branches remain short-lived.

Commits represent coherent ideas.

Main remains healthy.

Destructive operations are deliberate.

Merge conflicts are resolved semantically.

Bad integrations are reverted rather than defended.

AI actions remain permission-bounded.

Published references remain stable.

And Git never silently becomes a substitute for canon, architecture or project knowledge.
