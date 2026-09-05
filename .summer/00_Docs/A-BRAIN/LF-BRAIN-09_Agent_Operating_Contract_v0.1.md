# LEYFORGE PROJECT BRAIN
## Agent Operating Contract

**Document ID:** LF-BRAIN-09  
**Version:** v0.1  
**Status:** LOCKED — Branch A Design v0.1 — Ready for Pre-Production Implementation  
**Branch:** A — Leyforge Project Brain / Obsidian  
**Parent:** LF-BRAIN-01 — Project Brain Architecture & Governance Specification  
**Related:** LF-BRAIN-02 through LF-BRAIN-08  
**Purpose:** Define the mandatory operating rules for Codex and other authorised AI/development agents when reading, modifying, generating, validating and handing off work through the Leyforge Project Brain.

---

## 1. Purpose

The Leyforge Project Brain is designed to be used by humans and authorised AI/development agents.

Agents are expected to help with implementation, documentation, testing, reconciliation, registry work, research, auditing, maintenance, automation, migration, project-state updates and operational memory.

Because agents can act quickly and across many files, the Brain requires explicit operating boundaries.

This contract ensures agents:

- resolve authority before acting;
- do not silently rewrite project truth;
- reuse existing knowledge;
- preserve provenance;
- record consequential work;
- respect generated-file ownership;
- escalate uncertainty correctly;
- maintain traceability;
- leave the project resumable.

---

## 2. Core Agent Principle

Every authorised agent SHALL operate according to:

```text
READ
  ↓
RESOLVE AUTHORITY
  ↓
UNDERSTAND CURRENT STATE
  ↓
REUSE EXISTING KNOWLEDGE
  ↓
ACT WITHIN PERMISSION
  ↓
VERIFY
  ↓
RECORD OUTCOME
  ↓
HAND OFF CLEANLY
```

Agents SHALL NOT default to:

```text
SEARCH RANDOMLY
  ↓
GUESS
  ↓
EDIT
  ↓
MOVE ON
```

---

# PART I — SCOPE

## 3. Covered Agents

This contract applies to:

- Codex;
- ChatGPT-driven repository agents;
- local coding agents;
- automation agents with semantic write capability;
- future AI workers connected to the Leyforge repository.

Purely mechanical scripts that only execute deterministic transformations remain governed primarily by their own tooling contract and Branch B engineering governance, but their outputs SHALL still respect Brain rules.

---

## 4. Agent Roles

The Brain MAY recognise different agent roles.

Initial conceptual roles:

```text
reader
operator
implementer
maintainer
auditor
governance_agent
automation_agent
```

Exact permission mechanics may be implemented later.

Roles SHALL NOT imply authority beyond what project governance delegates.

---

# PART II — MANDATORY STARTUP FLOW

## 5. Required Startup Sequence

Before significant work, an authorised agent SHOULD follow this sequence:

```text
1. Read brain/AGENTS.md
2. Read brain/CURRENT_HANDOFF.md
3. Read brain/HOME.md
4. Open the relevant Index
5. Identify the target System / Entity / Document / Work Record
6. Resolve current authority
7. Read applicable ADRs / DECs
8. Read relevant Skills / Procedures / Antipatterns / Workarounds
9. Inspect current implementation / tests / evidence as needed
10. Begin work
```

For trivial local work, a reduced path MAY be appropriate if governance permits.

---

## 6. No Blind Full-Vault Scan

Agents SHALL NOT begin significant work by scanning the entire vault indiscriminately.

Preferred retrieval order:

```text
AGENTS
→ HANDOFF
→ HOME
→ INDEX
→ TARGET RECORD
→ AUTHORITY
→ RELATED DECISIONS / KNOWHOW
```

Broad search is fallback and discovery tooling, not default context loading.

---

## 7. Authority Before Implementation

Before changing implementation, the agent SHALL determine:

- what behaviour is intended;
- which authority defines that behaviour;
- whether current implementation matches it;
- whether relevant ADRs constrain the solution;
- whether a migration or compatibility rule applies.

Current code SHALL NOT automatically be treated as intended design.

---

# PART III — AGENT READ RIGHTS

## 8. Default Read Access

Authorised agents MAY read:

- all Brain records;
- canonical documents;
- registries;
- relevant source code;
- tests;
- evidence;
- historical decisions;
- superseded records;
- Skills;
- Failures;
- Antipatterns;
- Workarounds.

Readability of historical information does not make it current authority.

---

## 9. Historical Context

Agents MAY inspect deprecated, superseded or rejected records when useful for debugging, migration, architecture archaeology, avoiding repeated failure or understanding rationale.

They SHALL not present historical records as current without resolving status.

---

# PART IV — WRITE BOUNDARIES

## 10. Automatic / Low-Risk Agent Writes

Subject to Branch B governance and validation, agents MAY normally update:

- Work Records;
- CURRENT_HANDOFF;
- generated indexes;
- derived dashboards;
- implementation links;
- test/evidence links;
- repository paths;
- discovered candidate Lessons;
- candidate Skills;
- candidate Failures;
- candidate Workarounds;
- Inbox items;
- calculated reuse references;
- stale-state metadata where mechanically derived.

These writes SHALL still preserve schema and provenance.

---

## 11. Governed Agent Writes

Agents MAY modify the following only through their required governing process:

- System records;
- Architecture records;
- Interface records;
- Requirements;
- ADRs;
- accepted DECs;
- validated Skills/Procedures/Patterns;
- audit records;
- deviations;
- document authority metadata;
- migration records.

The required process may include a Work Record, ADR/DEC, test evidence, review, authority update or schema validation.

---

## 12. Protected Truth

Agents SHALL NOT silently change:

- locked canon;
- certified documents;
- authority ownership;
- stable project IDs;
- certified registry identity;
- V1 certification records;
- accepted constitutional governance;
- save compatibility promises;
- production gates;
- approved supersession history.

Changes to protected truth require explicit governing authority.

---

# PART V — STABLE ID RULES

## 13. ID Preservation

Agents SHALL preserve stable IDs.

Renaming a file or title SHALL NOT cause ID replacement.

---

## 14. No ID Reuse

Deleted, rejected, superseded or archived IDs SHALL NOT be reused for new records.

---

## 15. Existing Domain IDs

Where a canonical project-domain ID already exists, agents SHALL not create a competing identity unless the schema explicitly requires a separate Brain proxy identity.

---

# PART VI — GENERATED & DERIVED CONTENT

## 16. Generated Ownership

If:

```yaml
information_class: generated
edit_policy: do_not_edit
```

the agent SHALL NOT manually edit the file.

The owning generator must be changed instead.

---

## 17. Generated Sections

For files with generated sections, agents MAY edit only outside machine-owned boundaries unless the generator contract explicitly permits otherwise.

---

## 18. Derived Views

Agents MAY regenerate dashboards and indexes from source records.

They SHALL NOT manually alter a derived value to make the dashboard appear correct.

Fix the source or the derivation logic.

---

# PART VII — AUTHORITY RESOLUTION

## 19. Resolution Requirement

When authority matters, agents SHALL follow LF-BRAIN-02:

```text
identify question
→ identify domain
→ identify scope
→ locate authority
→ check status
→ follow supersession
→ inspect constraints
→ compare implementation separately
→ compare evidence separately
```

---

## 20. Unknown Authority

If authority cannot be resolved:

```text
DO NOT GUESS
```

The agent SHOULD create or surface a Conflict, create an Inbox item, mark authority unresolved or block Work if required.

---

## 21. Conflicting Authority

Agents SHALL NOT silently merge conflicting authorities.

They SHOULD record:

```text
CONFLICT-...
```

and route resolution to the appropriate owner.

---

# PART VIII — DECISION BEHAVIOUR

## 22. Routine Decisions

Agents MAY make routine local decisions where Branch B and relevant governance permit.

---

## 23. Consequential Decisions

If a choice materially affects architecture, persistence, registry identity, cross-system behaviour, compatibility, governance, security, major performance strategy or production sequencing, the agent SHALL evaluate whether ADR or DEC is required.

---

## 24. No Buried Decisions

Consequential decisions SHALL NOT remain only in chat, Work Record, commit, code comment or Handoff.

They must be promoted.

---

## 25. Acceptance Authority

Agents SHALL NOT mark a decision `accepted` unless delegated authority or workflow permits it.

Otherwise:

```yaml
status: proposed
```

---

# PART IX — WORK RECORD BEHAVIOUR

## 26. Create vs Reuse

If continuing the same objective:

```text
reuse active Work Record
```

If beginning a materially different objective:

```text
create new Work Record
```

A new chat or terminal session does not automatically create new work identity.

---

## 27. Work Record Discipline

Agents SHALL record meaningful objective, authority, work performed, result, verification, decisions, discoveries, blockers and next action.

They SHALL not journal every command.

---

## 28. Blocked Work

When blocked, agents SHALL record the blocker, affected scope, resolution route and next action after resolution.

---

# PART X — HANDOFF BEHAVIOUR

## 29. Required Handoff Update

After significant work, agents SHALL update CURRENT_HANDOFF when work continues later, another agent may resume, current stage changed, blocker changed, important state changed or next action changed.

---

## 30. Handoff Concision

Agents SHALL remove stale continuation details.

CURRENT_HANDOFF is current-state memory, not a historical diary.

---

## 31. No Unique Canon in Handoff

Any project truth important enough to govern work must live in the appropriate formal authority or decision record.

Handoff only points to it.

---

# PART XI — PROJECT LEARNING USE

## 32. Pre-Work Knowledge Lookup

Before solving a recurring or complex problem, agents SHOULD inspect:

- validated Skills;
- relevant Procedures;
- Patterns;
- Antipatterns;
- active Workarounds;
- Failures.

---

## 33. Validated Knowledge Use

Validated knowledge MAY be reused autonomously within its declared scope unless other governance requires review.

---

## 34. Candidate Knowledge Use

Candidate/testing knowledge MAY be used experimentally when status is visible, risk is acceptable, Work Record captures the experiment and required verification is performed.

---

## 35. Post-Work Learning Review

After significant work, agents SHALL consider whether it produced a Lesson, Failure, Skill, Procedure improvement, Pattern, Antipattern, Shortcut or Workaround.

No learning record is required if nothing reusable was learned.

---

## 36. No Self-Validation by Confidence

Agents SHALL NOT promote learned knowledge to `validated` solely because they believe it works.

Evidence rules from LF-BRAIN-07 apply.

---

# PART XII — RESEARCH BEHAVIOUR

## 37. Research Separation

Agents SHALL distinguish:

```text
external research
≠
Leyforge authority
```

Research findings require explicit promotion through Decision, Requirement, Architecture or Document amendment before becoming project truth.

---

## 38. Source Provenance

Research records SHOULD preserve source identity, access date, publication/version information, limitations and implications.

---

## 39. No Unsupported Filling

If sources do not support a claim, agents SHALL not silently fill the gap from generic knowledge while presenting the result as source-derived.

Inference must remain identifiable.

---

# PART XIII — IMPLEMENTATION BEHAVIOUR

## 40. Inspect Before Modify

Agents SHOULD inspect current implementation, relevant tests, linked requirements, architecture, active deviations, known Bugs and migration state before significant changes.

---

## 41. Normative vs Current Behaviour

If implementation differs from authority, agents SHALL classify the discrepancy rather than rewriting authority to match code.

Possible outputs include Bug, Migration, Deviation, Conflict or intentional implementation update.

---

## 42. Minimal Scope

Agents SHOULD make the smallest coherent change that satisfies the governing requirement.

Unrelated cleanup SHOULD normally be separated.

---

## 43. Refactoring

Refactoring SHALL preserve behaviour unless an authorised requirement/decision explicitly changes behaviour.

If architecture changes materially, ADR review applies.

---

# PART XIV — TESTING & EVIDENCE

## 44. Verification Requirement

Agents SHALL verify significant implementation work according to applicable Branch B testing governance.

---

## 45. Test vs Evidence

Agents SHALL distinguish:

```text
Test
= validation definition

Evidence
= actual observed result
```

---

## 46. No False Completion

Agents SHALL not claim `verified`, `working`, `passing` or `complete` when required validation has not occurred.

---

## 47. Failed Verification

If verification fails, agents SHALL preserve the evidence, avoid hiding the failure, update Work status, create/link Bug or Conflict if appropriate and update Handoff if work remains blocked.

---

# PART XV — BUGS, RISKS & DEVIATIONS

## 48. Bug Creation

Create a Bug when a defect is meaningful, reproducible or evidenced, requires persistence or is likely to survive beyond the immediate edit.

---

## 49. Risk Creation

Create a Risk for uncertain future conditions with meaningful impact.

Do not use Risk as a generic issue type.

---

## 50. Deviation Creation

A temporary intentional departure from governing authority requires a Deviation when formal tracking is warranted.

Agents SHALL not convert convenience into silent deviation.

---

# PART XVI — FILE OPERATIONS

## 51. Renames

Agents SHALL preserve IDs and update body links where required.

---

## 52. Moves

Moving a file SHALL not alter semantic identity or authority.

---

## 53. Deletion

Before deleting a formal record, agents SHOULD inspect inbound references, supersession, evidence provenance, Work history and authority relevance.

Historical records should usually be superseded or archived rather than destroyed.

---

# PART XVII — INDEX & NAVIGATION MAINTENANCE

## 54. Index Updates

Agents SHALL update or regenerate affected indexes when new significant records are created.

---

## 55. No Manual Derived Falsification

If an Index or Dashboard is generated, agents SHALL correct the source/generator rather than manually force expected output.

---

## 56. Navigation Repair

If an agent discovers an orphan record, missing index path or broken authority route, it SHOULD repair the navigation if within scope or create a Work/Inbox item.

---

# PART XVIII — SCHEMA BEHAVIOUR

## 57. Schema Compliance

Agents SHALL create/update formal records according to LF-BRAIN-04.

---

## 58. No Ad Hoc Fields

Agents SHALL NOT invent new metadata semantics during ordinary work.

New schema fields require governed extension.

---

## 59. Schema Migration

Mass metadata changes require migration definition, validation, Work Record and schema versioning when required.

---

# PART XIX — BRAIN DOCTOR

## 60. Validation Before Closeout

For significant Brain changes, agents SHOULD run applicable Brain Doctor checks before declaring completion.

---

## 61. Validation Failures

Agents SHALL not suppress failing Brain Doctor checks merely to obtain a clean status.

Fix, explicitly waive through governance, or record the blocker.

---

# PART XX — GIT BEHAVIOUR

## 62. Git Awareness

Agents SHOULD associate significant Work with relevant commits where practical.

---

## 63. Branch B Governs Git

Commit style, branching, PRs, review, CI and repository-writing rules remain governed by Branch B.

LF-BRAIN-09 does not override engineering governance.

---

## 64. No Nested Brain Repository

Agents SHALL not initialise a second Git repository inside `brain/`.

---

# PART XXI — SECURITY & SECRETS

## 65. Secret Handling

Agents SHALL NOT commit API keys, passwords, tokens, private credentials or secret environment values into Brain notes, scripts or `.obsidian/`.

---

## 66. External Tools

Agents SHALL follow Branch B security and least-privilege rules when adding tooling or automation.

---

# PART XXII — PLUGIN POLICY

## 67. Community Plugins

Agents SHALL NOT install a community Obsidian plugin merely for convenience.

The required evaluation path is:

```text
Need
→ core Obsidian
→ official CLI
→ Leyforge-owned script
→ plugin evaluation
```

---

## 68. Plugin Installation Authority

A plugin requires explicit project approval or a delegated governance process.

Agents SHALL not silently introduce new third-party executable dependencies.

---

# PART XXIII — OBSIDIAN-SPECIFIC BEHAVIOUR

## 69. Obsidian Is an Interface

Agents SHALL remember:

```text
Markdown / schema / Git
= durable system

Obsidian
= primary human interface
```

Project knowledge SHALL not be trapped in opaque Obsidian-only structures.

---

## 70. Bases

Agents MAY maintain Bases as dynamic views.

They SHALL not store unique authoritative facts only in Base definitions.

---

## 71. Canvas

Agents MAY maintain Canvas diagrams.

They SHALL not treat Canvas as independent authority unless explicitly delegated.

---

# PART XXIV — AUTONOMY BOUNDARIES

## 72. Autonomous Actions Generally Permitted

Within task scope and governance, agents MAY autonomously:

- read;
- search;
- create Work Records;
- update Handoff;
- update implementation links;
- create evidence records;
- create candidate learned-knowledge records;
- regenerate derived indexes;
- repair broken non-authoritative navigation;
- run validation;
- create proposed ADRs/DECs;
- create Bugs/Risks/Conflicts when evidence supports them.

---

## 73. Actions Requiring Governing Authority

Agents SHALL NOT autonomously:

- change locked canon;
- accept constitutional decisions;
- certify V1;
- change authority ownership;
- retire stable canonical IDs;
- waive required tests;
- change save compatibility guarantees;
- approve production gates;
- install unapproved third-party executable dependencies;
- silently rewrite accepted architecture.

---

# PART XXV — UNCERTAINTY

## 74. Uncertainty Principle

When uncertain, agents SHALL prefer:

```text
surface uncertainty
```

over:

```text
manufacture certainty
```

---

## 75. Permitted Responses to Uncertainty

Depending on scope:

- mark unresolved;
- create Conflict;
- create Inbox item;
- create Work Item;
- create proposed Decision;
- block Work;
- gather evidence.

---

## 76. No Speculative Authority

An agent SHALL NOT infer current authority solely from recency, filename, folder, code state, popularity or memory.

---

# PART XXVI — SCOPE CONTROL

## 77. Stay Within Objective

Agents SHOULD not opportunistically rewrite unrelated systems merely because they noticed an improvement.

Create a Work Item, Lesson, Risk or Bug for later where appropriate.

---

## 78. Necessary Adjacent Fix

An adjacent fix MAY be included when it is required for correctness, validation or safe completion of the objective.

The Work Record should state why.

---

# PART XXVII — MULTI-AGENT COORDINATION

## 79. Avoid Write Collisions

Agents SHOULD avoid concurrently modifying the same authoritative or operational record unless collaboration is intentional.

---

## 80. Split Work

Parallel work SHOULD be divided by system, Work Record, document, implementation module or audit scope where practical.

---

## 81. Shared State

CURRENT_HANDOFF and Current Work views SHALL reflect important concurrent objectives.

---

# PART XXVIII — AGENT CLOSEOUT

## 82. Significant Work Closeout

Before handing control back after significant work, an agent SHOULD confirm:

```text
[ ] Objective outcome recorded
[ ] Authority respected
[ ] Relevant implementation/document records updated
[ ] Consequential decisions promoted
[ ] Tests/evidence linked
[ ] Bugs/conflicts/risks recorded if needed
[ ] Discoveries evaluated
[ ] Work Record updated
[ ] CURRENT_HANDOFF updated
[ ] Indexes/derived views refreshed where required
[ ] Brain Doctor / required validation run
[ ] Remaining blockers explicit
[ ] Next recommended action clear
```

---

## 83. Clean Handoff Standard

The next worker should not need the previous chat transcript to continue.

If they do, the operational-memory closeout is incomplete.

---

# PART XXIX — AGENT FAILURE MODES

## 84. Prohibited Failure Modes

Agents SHALL avoid:

### Authority drift
Updating project truth to match implementation without approval.

### Context reconstruction loops
Ignoring existing Work/Handoff/Skills and rediscovering prior work.

### Note proliferation
Creating near-duplicate records instead of linking existing ones.

### Schema drift
Inventing ad hoc frontmatter fields.

### Decision burial
Leaving consequential choices inside Work logs.

### Generated-file corruption
Manually editing machine-owned outputs.

### False verification
Claiming success without evidence.

### Historical erasure
Deleting superseded knowledge that remains materially useful.

### Scope creep
Rewriting unrelated areas during bounded tasks.

### Knowledge self-certification
Marking agent-created techniques validated without evidence.

---

# PART XXX — AGENTS.MD IMPLEMENTATION

## 85. Runtime `AGENTS.md`

During pre-production setup, Codex SHALL create:

```text
brain/AGENTS.md
```

as the concise operational implementation of this standard.

`AGENTS.md` should not reproduce every paragraph of LF-BRAIN-09.

It should provide:

- mandatory startup order;
- authority rules;
- write boundaries;
- generated-file rules;
- decision triggers;
- Work/Handoff requirements;
- learning reuse;
- validation/closeout checklist;
- links to full governance.

---

## 86. Root Repository Agent Rules

Branch B may also define root-level repository agent instructions.

If both exist:

```text
root engineering agent rules
+
brain/AGENTS.md
```

apply within their respective scopes.

Conflicts require explicit governance resolution.

---

# PART XXXI — CODEX PRE-PRODUCTION HANDOFF

## 87. Codex Use During Brain Construction

During Pre-Production Infrastructure setup, Codex SHALL use the completed LF-BRAIN document set as implementation authority.

Codex MAY make routine implementation decisions.

Codex SHALL create proposed ADR/DEC records for consequential unresolved choices not already specified.

---

## 88. No Redesign-by-Implementation

Codex SHALL NOT treat setup work as permission to redesign the Brain architecture for convenience.

If implementation reveals a genuine flaw:

```text
implementation issue
→ Work Record
→ proposed ADR/DEC or Conflict
→ governed amendment
```

not silent divergence.

---

# PART XXXII — AGENT OPERATING LAWS

## 89. Agent Laws

The following laws are provisionally established:

1. Agents resolve authority before significant action.
2. Agents read Handoff and relevant indexes before broad searching.
3. Agents distinguish intended design from current implementation.
4. Agents may read historical knowledge without treating it as current.
5. Stable IDs are preserved.
6. Generated content obeys generator ownership.
7. Derived views are corrected at the source, not manually falsified.
8. Unknown authority remains explicitly unknown.
9. Conflicting authority is surfaced, not silently merged.
10. Consequential decisions are promoted to ADR/DEC.
11. Decision acceptance requires delegated authority.
12. Work Records preserve meaningful outcomes, not activity exhaust.
13. CURRENT_HANDOFF preserves continuation state, not canon.
14. Agents consult validated Knowhow before recurring complex work.
15. Candidate knowledge may be used experimentally only with visible status and verification.
16. AI confidence does not validate project knowledge.
17. External research does not automatically become Leyforge authority.
18. Significant implementation work must be verified.
19. Verification failures remain visible.
20. Agents do not invent ad hoc schema fields.
21. Schema migrations are governed.
22. Secrets are never committed into Brain content.
23. Community plugins are not silently installed.
24. Agents stay within task scope unless adjacent change is required for correctness.
25. Parallel agents should avoid write collisions.
26. Significant work must leave Work and Handoff state sufficient for continuation.
27. Brain Doctor failures are fixed, governed or surfaced—not hidden.
28. Codex implements the approved Brain; it does not silently redesign it.
29. A future worker should not require the previous chat transcript to understand current state.
30. The agent's job is to leave Leyforge more understandable than it found it.

---

## 90. Status

This document establishes the Agent Operating Contract for Leyforge Brain v0.1.

It has been reconciled with Brain Doctor, automation, ingestion, certification and applicable Branch B engineering-governance boundaries.

This document is **LOCKED as the controlling Brain-domain authority for Codex and other authorised AI/development agents interacting with the Leyforge Project Brain**.
