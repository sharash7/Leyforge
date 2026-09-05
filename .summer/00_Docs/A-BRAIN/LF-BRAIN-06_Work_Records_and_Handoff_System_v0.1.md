# LEYFORGE PROJECT BRAIN
## Work Records & Handoff System

**Document ID:** LF-BRAIN-06  
**Version:** v0.1  
**Status:** LOCKED — Branch A Design v0.1 — Ready for Pre-Production Implementation  
**Branch:** A — Leyforge Project Brain / Obsidian  
**Parent:** LF-BRAIN-01 — Project Brain Architecture & Governance Specification  
**Related:** LF-BRAIN-02, LF-BRAIN-03, LF-BRAIN-04, LF-BRAIN-05  
**Purpose:** Define how significant Leyforge work is recorded, how active context is handed between sessions and agents, how Work Records relate to Git history, how discoveries and failures are captured, how stale work is prevented, and how operational memory remains concise, useful and traceable.

---

## 1. Purpose

Leyforge is too large and too long-lived to depend on chat history, human memory or Git diffs alone.

The Project Brain therefore requires a formal operational-memory system that preserves:

- what was being attempted;
- why it was being attempted;
- which authorities were consulted;
- what changed;
- what was learned;
- what failed;
- what remains unresolved;
- what the next worker should do;
- which decisions, tests, evidence and discoveries resulted.

The goal is not to record every action. The goal is to ensure that a future human or authorised agent can continue meaningful work without reconstructing the entire previous session.

---

## 2. Fundamental Work-Memory Principle

The Brain SHALL distinguish:

```text
Git
= detailed file-level change history

Work Record
= meaningful project work context

Handoff
= concise continuation state
```

Git answers:

> What changed in the repository?

A Work Record answers:

> Why did this work happen, what did it achieve, and what was learned?

A Handoff answers:

> What does the next worker need to know right now?

These three mechanisms complement one another.

---

## 3. No Activity Exhaust

The Brain SHALL NOT record meaningless operational exhaust such as:

- every file opened;
- every command executed;
- every line changed;
- every keystroke;
- every prompt;
- every chat turn;
- every intermediate thought;
- trivial formatting edits.

The Work system exists to preserve project meaning, not telemetry.

---

# PART I — WHAT COUNTS AS SIGNIFICANT WORK

## 4. Significant Work Threshold

A Work Record SHOULD be created when one or more of the following applies:

- work changes authoritative or implementation-relevant project state;
- work spans multiple files or systems;
- work creates or modifies architecture;
- work produces a consequential decision;
- work performs reconciliation or audit;
- work produces meaningful test or benchmark evidence;
- work discovers a reusable Skill, Pattern, Antipattern, Shortcut, Lesson, Failure or Workaround;
- work investigates a difficult defect;
- work introduces migration or compatibility implications;
- work creates or changes a production gate;
- work is likely to require continuation in another session;
- work would be expensive to reconstruct later.

---

## 5. Work That Usually Does Not Need a Formal Work Record

Examples:

- typo correction;
- formatting-only edit;
- trivial rename with no semantic impact;
- routine generated-file refresh;
- simple comment correction;
- mechanical change fully explained by the Git commit and existing requirement.

Such work MAY still be referenced in a larger Work Record when part of a significant task.

---

## 6. Work Unit Principle

A Work Record SHOULD represent one coherent work objective.

Good:

```text
WORK-20260829-004
Reconcile FCC-12 material inheritance rules
```

Bad:

```text
WORK-20260829-004
Did some FCC work, fixed code, researched plugins, changed tests, updated roadmap and thought about Forge
```

Unrelated objectives should normally use separate Work Records.

---

# PART II — WORK RECORD IDENTITY

## 7. Work Record Type

Formal Work Records use:

```yaml
type: work
```

ID format:

```text
WORK-YYYYMMDD-NNN
```

Example:

```text
WORK-20260829-004
```

The date represents creation of the logical Work Record. The sequence distinguishes multiple work units created on the same day.

---

## 8. Work Record Location

Canonical location:

```text
brain/06_WORK/Work Records/
```

At scale, records MAY be partitioned:

```text
06_WORK/Work Records/
└── 2026/
    └── 08/
```

Folder location does not affect identity.

---

# PART III — WORK RECORD LIFECYCLE

## 9. Work Status

Allowed Work statuses:

```text
planned
active
blocked
complete
cancelled
```

### `planned`
Work has been defined but not materially started.

### `active`
Work is currently underway.

### `blocked`
Work cannot safely continue due to an unresolved dependency, authority issue, defect or external blocker.

### `complete`
The defined objective has been completed and required closeout has occurred.

### `cancelled`
The objective will not be pursued under the current record.

---

## 10. Only Meaningful Active Work

The Brain SHOULD avoid large numbers of simultaneous `active` Work Records.

A record should not remain active merely because someone may someday return to it.

If work is deliberately postponed, use a blocked state, a Work Item, roadmap state, or close the record and create a future Work Item.

---

# PART IV — REQUIRED WORK RECORD CONTENT

## 11. Minimum Metadata

A Work Record SHALL include:

```yaml
---
brain_schema: 1
id: WORK-YYYYMMDD-NNN
type: work
title:
status:
information_class: authored
created:
updated:
---
```

Where applicable, it SHOULD also include:

```yaml
systems:
authority_consulted:
documents:
decisions:
tests:
evidence:
discoveries:
blocked_by:
risks:
repository_path:
commit:
```

Exact schema names remain governed by LF-BRAIN-04.

---

## 12. Required Body Sections

A significant Work Record SHOULD contain:

```markdown
## Objective
## Starting State
## Authority Consulted
## Work Performed
## Result
## Decisions
## Verification
## Discoveries & Lessons
## Failures / Problems
## Remaining Work
## Handoff
```

Sections with nothing meaningful to report may be omitted.

---

## 13. Objective

The Objective SHALL state the bounded purpose of the work.

Example:

> Reconcile FCC-12 material-processing inheritance rules against the locked single-definition model and identify any unresolved registry conflicts.

The Objective should be understandable without reading the entire work history.

---

## 14. Starting State

Starting State records only context needed to understand the work.

It may include:

- previous completed step;
- current implementation condition;
- known defect;
- relevant branch state;
- relevant source-document status;
- current blocker.

It SHALL not become a full project recap.

---

## 15. Authority Consulted

The Work Record SHALL identify authoritative sources materially used to guide significant work.

Example:

```text
- DOC-FCC-12
- DOC-ENG-GOV-05
- ADR-0021
```

This allows future workers to determine what governed the work.

---

## 16. Work Performed

This section summarises meaningful actions.

Good:

- reconciled three conflicting material identities;
- updated registry mapping;
- added save migration;
- added regression tests.

Bad:

- opened file;
- searched folder;
- typed code;
- ran command.

---

## 17. Result

The Result section SHALL clearly state the outcome.

Possible outcomes include completed, partially completed, blocked, disproven, migrated, superseded, or failed with preserved evidence.

---

# PART V — DECISIONS DURING WORK

## 18. Decision Promotion

A Work Record MAY contain small routine choices.

However, a consequential decision SHALL be promoted to an ADR or Decision Record when required by LF-BRAIN-08.

The Work Record then links the decision.

---

## 19. No Hidden Decision Burial

A decision that materially changes architecture, authority, save compatibility, production behaviour, cross-system contracts, governance or significant workflow SHALL NOT exist only as a sentence inside a Work Record.

---

# PART VI — VERIFICATION

## 20. Verification Section

Significant implementation work SHOULD record how the result was verified.

Examples:

- automated tests;
- manual acceptance;
- benchmark;
- lint;
- migration validation;
- build verification;
- Brain Doctor.

---

## 21. Test Definition vs Execution

The Work Record SHALL distinguish:

```text
TEST
= defined validation procedure

EVIDENCE
= actual observed result
```

A Work Record may link both.

---

## 22. Unverified Completion

A Work Record SHALL NOT claim verified completion if required verification was not performed.

Allowed:

```text
Implementation complete; verification pending.
```

Disallowed:

```text
Complete and working.
```

when no evidence supports that claim.

---

# PART VII — DISCOVERY CAPTURE

## 23. Discovery Capture Rule

During significant work, useful discoveries SHALL be considered for promotion into the Project Learning system.

Potential outputs include Skill, Procedure, Pattern, Antipattern, Shortcut, Lesson, Failure and Workaround.

---

## 24. Candidate Discovery

Not every discovery requires immediate formal promotion.

A Work Record may capture:

```text
Candidate discovery:
A faster registry reconciliation method appears reliable.
```

Then either:

```text
Work Record
→ Inbox / Lesson
→ testing
→ Skill
```

or rejection as a one-off observation.

---

## 25. Provenance Preservation

When a discovery becomes a formal learned-knowledge record, it SHALL link back to the Work Record through `discovered_in` or the equivalent schema relationship.

This allows Leyforge to remember how the technique was learned.

---

# PART VIII — FAILURE CAPTURE

## 26. Failed Work Is Still Valuable

A Work Record may be complete even when the attempted solution failed.

Example:

```text
Objective:
Evaluate approach X.

Result:
Approach rejected due to nondeterministic save corruption.

Outputs:
FAIL-0012
EVID-0048
ADR-0031
```

Failure is project knowledge.

---

## 27. Failure Promotion

A failed approach SHOULD become a formal Failure or Antipattern record when:

- it is likely to be attempted again;
- the failure mode is non-obvious;
- investigation was expensive;
- the evidence is reusable;
- the failure reveals an architectural constraint.

---

# PART IX — GIT INTEGRATION

## 28. Git Association

A Work Record MAY record relevant commits.

A single Work Record may span multiple commits.

A single commit may also support multiple Work Records if genuinely necessary.

---

## 29. No One-to-One Requirement

The Brain SHALL NOT require:

```text
one Work Record = one Git commit
```

because meaningful project work and version-control units are not always identical.

---

## 30. Commit Message References

Branch B may later require significant commits to reference Work, ADR, Requirement or Bug IDs.

If adopted, the Brain should support that relationship.

LF-BRAIN-06 defines the Work side but does not override Branch B Git governance.

---

# PART X — CURRENT HANDOFF

## 31. Purpose of `CURRENT_HANDOFF.md`

`CURRENT_HANDOFF.md` is the Brain's primary continuation-state document.

Its job is to answer:

> **What does the next authorised worker need to know before continuing current Leyforge work?**

It SHALL remain concise. It SHALL NOT become a rolling diary.

---

## 32. Handoff Location

Canonical active handoff:

```text
brain/CURRENT_HANDOFF.md
```

Historical handoffs MAY be preserved in:

```text
brain/06_WORK/Handoffs/
```

---

## 33. Active Handoff Identity

The active handoff may use:

```yaml
id: CURRENT-HANDOFF
type: handoff
```

Archived snapshots may use:

```text
HANDOFF-YYYYMMDD-NNN
```

---

# PART XI — HANDOFF CONTENT

## 34. Recommended Handoff Structure

```markdown
# Current Handoff
## Current Programme / Stage
## Current Objective
## Last Completed
## Active Work
## Authority to Read
## Important State
## Open Blockers
## Risks / Conflicts
## Files / Systems in Scope
## Next Recommended Action
```

---

## 35. Current Programme / Stage

Identifies the broad project stage, such as FCC reconciliation, V1 audit, Pre-Production Infrastructure, clean rebuild or Forge implementation.

This is a routing field, not a full roadmap.

---

## 36. Current Objective

States the immediate active goal.

---

## 37. Last Completed

Lists only the most relevant immediately preceding completed work.

This section prevents the next worker from repeating finished steps.

---

## 38. Active Work

Links active Work Records.

---

## 39. Authority to Read

Lists the minimum controlling documents required before work continues.

This allows a new agent to load authoritative context efficiently.

---

## 40. Important State

Contains non-obvious current facts that are not worth rediscovering, such as a partially applied migration, deliberately retained prototype branch, stale generated report pending regeneration, or approved temporary deviation.

---

## 41. Open Blockers

Each blocker SHOULD link to a formal Work Item, Bug, Conflict, Risk, Decision or missing-authority record where one exists.

---

## 42. Next Recommended Action

The handoff SHOULD end with a concrete next action.

Good:

> Run registry migration test TEST-0142, then close WORK-20260829-004 if the evidence passes.

Bad:

> Continue working on Leyforge.

---

# PART XII — HANDOFF UPDATE RULES

## 43. Handoff Is Current-State Only

`CURRENT_HANDOFF.md` SHALL represent the present continuation state.

When state changes materially, it SHALL be updated.

Old details should not accumulate indefinitely.

---

## 44. Historical Preservation

If a previous handoff contains historically meaningful information not captured elsewhere, preserve it as a dated Handoff record.

Otherwise Git history may be sufficient.

Not every handoff revision requires a permanent archived file.

---

## 45. Handoff Must Not Contain Unique Authority

No project truth may exist only inside CURRENT_HANDOFF.

If important information is authoritative, it belongs in the appropriate Document, ADR, Decision, Requirement, System, Entity, Architecture or other formal record.

The handoff points to it.

---

# PART XIII — START-OF-WORK PROTOCOL

## 46. Standard Start Flow

Before significant work, an authorised agent SHOULD:

```text
1. Read AGENTS.md
2. Read CURRENT_HANDOFF.md
3. Read HOME / relevant current-state view
4. Open relevant Index
5. Resolve authority
6. Inspect active Work Record(s)
7. Inspect applicable ADRs
8. Inspect relevant Skills / Antipatterns
9. Begin work
```

This reduces rediscovery and accidental authority drift.

---

## 47. Resume vs New Work

If continuing the same objective, reuse the active Work Record.

If beginning a materially different objective, create a new Work Record.

Do not create a new Work Record merely because a new chat or terminal session began.

Work identity follows objective, not software session.

---

# PART XIV — DURING-WORK PROTOCOL

## 48. Keep Work Record Proportional

The Work Record MAY be updated during complex work when necessary to prevent context loss.

It does not need minute-by-minute journaling.

Useful interim updates include blocker discovered, authority conflict found, experiment result, major decision created or material scope change.

---

## 49. Scope Expansion

If the objective expands materially, choose one:

- amend the Work Record scope if still coherent;
- create a new linked Work Record;
- create a Work Item for later.

Avoid endlessly expanding one record.

---

# PART XV — END-OF-WORK PROTOCOL

## 50. Closeout Checklist

Before marking significant work `complete`, the worker SHOULD verify:

```text
[ ] Objective achieved or outcome explicitly recorded
[ ] Relevant authoritative records updated
[ ] Consequential decisions promoted
[ ] Tests/evidence linked
[ ] Discoveries evaluated for promotion
[ ] Failures/workarounds captured if useful
[ ] Remaining work recorded
[ ] CURRENT_HANDOFF updated if continuation remains
[ ] Git state associated where relevant
[ ] Brain Doctor / relevant validation run where required
```

---

## 51. Complete Does Not Mean Perfect

A Work Record may be complete if its bounded objective is finished even though broader project work remains.

---

# PART XVI — BLOCKED WORK

## 52. Blocked Status

A blocked Work Record SHALL state:

- blocker;
- why it prevents continuation;
- owner or resolution route;
- affected authority;
- next action once unblocked.

---

## 53. Blocking Conflict

If authority ambiguity blocks progress, create or link a Conflict record.

Do not improvise through unresolved authority merely to keep momentum.

---

## 54. Blocking Bug

If a defect blocks progress, link a Bug where formal tracking is justified.

---

# PART XVII — WORK ITEMS

## 55. Work Item Purpose

A Work Item represents planned work that deserves independent tracking but is not yet a Work Record.

Use `type: work_item` when future work has clear scope, depends on a blocker, belongs to a production stage, must survive across sessions, or is assigned from an audit or decision.

---

## 56. Work Item to Work Record

When meaningful execution begins:

```text
TASK-...
   ↓ starts
WORK-...
```

The Work Record links the originating Work Item.

---

# PART XVIII — MULTI-AGENT WORK

## 57. Multiple Agents

The Brain SHALL support multiple authorised agents working on different objectives.

Each significant active objective should have an identifiable Work Record.

---

## 58. Avoid Concurrent Record Collision

Two agents SHOULD NOT independently modify the same Work Record unless collaboration is intentional.

If work can be separated, create linked Work Records.

---

## 59. Shared Handoff

`CURRENT_HANDOFF.md` provides project-level continuation context.

It is not a replacement for detailed Work Records when multiple objectives are active.

---

# PART XIX — CROSS-BRANCH WORK

## 60. Branch A–D Coordination

Work Records MAY involve multiple governance branches.

Example:

```text
WORK
Pre-production Brain setup

Governed by:
Branch A Brain specification
Branch B engineering governance
Branch D production setup gate
```

The Work Record SHALL identify the relevant authorities rather than declaring one branch globally dominant.

---

# PART XX — WORK RECORD BODY TEMPLATE

## 61. Canonical Draft Template

```markdown
---
brain_schema: 1
id: WORK-YYYYMMDD-NNN
type: work
title:
status: active
information_class: authored
created: YYYY-MM-DD
updated: YYYY-MM-DD
---

# Objective
# Starting State
# Authority Consulted
# Work Performed
# Result
# Decisions
# Verification
# Discoveries & Lessons
# Failures / Problems
# Remaining Work
# Handoff
```

LF-BRAIN-06 defines the semantic template. LF-BRAIN-04 remains authoritative for metadata syntax.

---

# PART XXI — CURRENT HANDOFF TEMPLATE

## 62. Canonical Draft Template

```markdown
---
brain_schema: 1
id: CURRENT-HANDOFF
type: handoff
title: Current Handoff
status: active
information_class: authored
created: YYYY-MM-DD
updated: YYYY-MM-DD
---

# Current Programme / Stage
# Current Objective
# Last Completed
# Active Work
# Authority to Read
# Important State
# Open Blockers
# Risks / Conflicts
# Files / Systems in Scope
# Next Recommended Action
```

---

# PART XXII — WORK INDEXING

## 63. Work Index

The Work Index SHOULD provide:

- active Work;
- blocked Work;
- recently completed Work;
- Work by system;
- Work by production stage;
- Work linked to unresolved Bugs;
- Work linked to unresolved Conflicts.

---

## 64. Current Work Dashboard

`00_CONTROL/Current Work.md` or a Base-backed equivalent SHOULD display operational state without becoming the authoritative Work source.

---

# PART XXIII — RETENTION

## 65. Work Record Retention

Significant completed Work Records SHALL normally be retained.

Their long-term value includes reasoning history, archaeology, debugging, rediscovery prevention, Skill provenance and decision context.

---

## 66. Trivial Work Cleanup

Records later determined to contain no lasting value MAY be archived or removed under project governance.

Deletion should not destroy required decision or evidence provenance.

---

# PART XXIV — STALE WORK DETECTION

## 67. Brain Doctor Checks

Brain Doctor should eventually detect:

- `active` Work unchanged beyond a configured threshold;
- `blocked` Work with no blocker link or explanation;
- `complete` Work with unresolved required closeout;
- Work referencing missing authority;
- Work referencing missing decisions or evidence;
- Work with no clear objective;
- CURRENT_HANDOFF pointing to missing or completed Work incorrectly;
- active Work not represented in Current Work views.

---

## 68. Staleness Is a Signal

A stale record is not automatically invalid.

Brain Doctor should surface it for review rather than silently closing it.

---

# PART XXV — HANDOFF HEALTH

## 69. Handoff Health Checks

Brain Doctor SHOULD warn when:

- CURRENT_HANDOFF is missing;
- current objective is empty;
- active Work links are broken;
- handoff references superseded authority as current;
- next action is missing;
- handoff is materially stale;
- blockers exist but are not surfaced.

---

# PART XXVI — WORK DISCOVERY PIPELINE

## 70. Operational Learning Flow

The expected learning flow is:

```text
WORK
  ↓
observation
  ↓
candidate discovery
  ↓
Lesson / Failure / Workaround
  ↓
testing / reuse
  ↓
Skill / Procedure / Pattern / Antipattern
```

This is one of the Brain's central purposes.

---

## 71. Work Does Not Automatically Create Skill

Repeated success, evidence or deliberate validation is required before a Skill becomes trusted.

LF-BRAIN-07 governs project-learning maturity.

---

# PART XXVII — AUTHORITY SAFETY

## 72. Work Records Are Not Authority by Default

A Work Record is operational memory.

It SHALL NOT become project authority simply because it says a decision was made.

If a decision changes project truth, the appropriate authoritative record must be updated or created.

---

## 73. Handoff Is Never Canon

CURRENT_HANDOFF is transient operational state.

It SHALL not independently define canon, requirements, architecture, governance, registry identity or save contracts.

---

# PART XXVIII — CHAT AND AI SESSION RELATIONSHIP

## 74. Chat Is Not Durable Project Memory

Chat transcripts may contain useful context but SHALL NOT be relied upon as the durable Leyforge operational-memory system.

Meaningful outcomes SHALL be promoted into Brain records.

---

## 75. No Conversation Dumping

The Brain SHALL NOT ingest complete AI conversations merely to preserve context.

Instead, extract:

- decisions;
- Work outcomes;
- conflicts;
- learned knowledge;
- handoff state;
- relevant evidence.

This keeps the Brain navigable.

---

# PART XXIX — IMPLEMENTATION EXPECTATIONS

## 76. Codex Setup Responsibilities

During the Pre-Production Infrastructure stage, Codex SHOULD implement:

- Work Record template;
- Handoff template;
- Current Work index/dashboard;
- Work ID generation;
- stale-work validation;
- handoff validation;
- Work-to-decision/evidence linking;
- Work-to-Git association where defined;
- Work archive/partitioning rules;
- operational-learning promotion hooks where practical.

---

## 77. Automation Boundary

Automation MAY assist with:

- ID creation;
- dates;
- current branch/commit;
- changed-file lists;
- template generation;
- stale-state detection;
- index updates.

Automation SHALL NOT fabricate:

- rationale;
- decisions;
- authority consulted;
- discoveries;
- results;
- next actions.

Those require meaningful interpretation.

---

# PART XXX — WORK SYSTEM LAWS

## 78. Work & Handoff Laws

The following laws are provisionally established:

1. Significant work leaves a Work Record.
2. Work Records track objectives, outcomes and learning, not activity exhaust.
3. Work identity follows the objective, not the chat or terminal session.
4. Git records file history; Work Records record project meaning.
5. Handoff records current continuation state.
6. CURRENT_HANDOFF remains concise.
7. No authoritative project truth may exist only inside a Handoff.
8. Consequential decisions must be promoted out of Work Records.
9. Test definitions and Evidence executions remain distinct.
10. Failed work may still be successfully completed as an investigation.
11. Reusable discoveries must retain Work provenance.
12. Useful failed approaches should be preserved.
13. Active Work should remain limited and meaningful.
14. Blocked Work must explain its blocker and resolution path.
15. Significant work must resolve authority before acting.
16. Agents should resume existing Work when continuing the same objective.
17. Agents should create new Work when the objective materially changes.
18. Work closeout includes verification and handoff where applicable.
19. Chat transcripts are not the durable operational-memory layer.
20. Conversation dumps are prohibited as a substitute for structured Brain memory.
21. Automation may capture objective metadata but must not invent meaning.
22. Stale Work is surfaced, not silently closed.
23. Work Records should remain independently understandable after the original chat is gone.
24. Multi-agent work should avoid unnecessary concurrent edits to the same Work Record.
25. The Work system exists to make Leyforge resumable without rediscovery.

---

## 79. Status

This document establishes the Work Records & Handoff System for Leyforge Brain v0.1.

It has been reconciled with the learning, decision, agent, validation, automation and certification specifications.

This document is **LOCKED as the controlling Brain authority for operational work memory, continuation state and handoff behaviour**.
