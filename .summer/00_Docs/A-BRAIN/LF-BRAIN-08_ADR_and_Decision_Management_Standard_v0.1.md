# LEYFORGE PROJECT BRAIN
## ADR & Decision Management Standard

**Document ID:** LF-BRAIN-08  
**Version:** v0.1  
**Status:** LOCKED — Branch A Design v0.1 — Ready for Pre-Production Implementation  
**Branch:** A — Leyforge Project Brain / Obsidian  
**Parent:** LF-BRAIN-01 — Project Brain Architecture & Governance Specification  
**Related:**  
- LF-BRAIN-02 — Authority & Truth Resolution Model  
- LF-BRAIN-03 — Note-Type Taxonomy & Information Model  
- LF-BRAIN-04 — Brain Schema & Metadata Standard  
- LF-BRAIN-05 — Vault Architecture & Navigation Standard  
- LF-BRAIN-06 — Work Records & Handoff System  
- LF-BRAIN-07 — Skills, Procedures & Project Learning System  

**Purpose:** Define how consequential Leyforge decisions are captured, classified, accepted, linked to authority, superseded, rejected, preserved and surfaced through the Project Brain.

---

## 1. Purpose

Leyforge requires durable decision memory.

As the project grows, many important choices will otherwise be lost inside:

- chat history;
- commit messages;
- Work Records;
- temporary notes;
- implementation comments;
- remembered context;
- old design drafts.

The Decision Management System exists so that a future human or authorised agent can determine:

- what decision was made;
- why it was made;
- what alternatives were considered;
- what authority permitted the decision;
- which systems are affected;
- what consequences followed;
- whether the decision is still current;
- what superseded it;
- whether a newer implementation conflicts with it;
- what evidence informed the choice.

The system SHALL preserve decision history without turning every routine implementation choice into bureaucracy.

---

## 2. Core Decision Principle

A consequential choice SHALL be recorded at the level appropriate to its impact.

Leyforge SHALL use two primary decision record types:

```text
ADR
= Architecture Decision Record

DEC
= General Decision Record
```

The purpose is not to rank ADRs as "more important" than every DEC.

The purpose is to distinguish architectural/engineering decisions from other consequential project decisions.

---

# PART I — DECISION TYPES

## 3. Architecture Decision Record

**Type:** `adr`  
**ID family:** `ADR-`

An ADR captures a significant technical or architectural choice.

Typical ADR subjects include:

- subsystem boundaries;
- persistence architecture;
- save compatibility strategy;
- registry architecture;
- engine integration;
- world-streaming architecture;
- networking contracts;
- performance-critical architecture;
- cross-module interfaces;
- build/deployment architecture;
- security-sensitive architecture;
- major tooling architecture;
- expensive-to-reverse technical choices.

An ADR SHOULD be used when the decision is likely to matter long after the implementation session that created it.

---

## 4. General Decision Record

**Type:** `decision`  
**ID family:** `DEC-`

A DEC captures a consequential project choice that does not require a full architecture decision record.

Typical DEC subjects include:

- naming choices with broad impact;
- workflow choices;
- documentation-governance choices;
- bounded design decisions;
- operational policy choices;
- local tool-selection decisions;
- process choices;
- non-architectural implementation choices with lasting consequence.

---

## 5. Routine Choices

Routine local choices SHALL NOT require ADR or DEC records.

Examples:

- variable name;
- local helper extraction;
- formatting choice;
- trivial test refactor;
- small implementation detail fully constrained by existing architecture.

These may remain in code, commits or Work Records.

---

# PART II — ADR VS DEC SELECTION

## 6. ADR Selection Questions

A decision SHOULD become an ADR if one or more are true:

- Is it expensive to reverse?
- Does it affect multiple systems?
- Does it define an architecture boundary?
- Does it affect save compatibility?
- Does it affect registry stability?
- Does it define a persistent data contract?
- Does it materially affect performance strategy?
- Does it affect security or integrity?
- Does it constrain future implementation choices?
- Is it likely to be questioned again?
- Would forgetting the rationale create significant rework?

---

## 7. DEC Selection Questions

A decision SHOULD become a DEC when:

- the decision is consequential;
- it should survive chat/session boundaries;
- it affects future work;
- it has meaningful rationale;
- it is not primarily architectural;
- a future worker may otherwise repeat the discussion.

---

## 8. Decision Escalation

A DEC MAY later be superseded by or promoted into an ADR if its impact becomes broader than originally expected.

Example:

```text
DEC-0014
Temporary save alias strategy
    ↓ architecture impact discovered
ADR-0032
Persistent migration alias architecture
```

The original DEC remains in history.

---

# PART III — DECISION LIFECYCLE

## 9. ADR Status

Allowed ADR statuses:

```text
proposed
experimental
accepted
superseded
rejected
deprecated
```

---

## 10. DEC Status

Allowed DEC statuses:

```text
proposed
accepted
superseded
rejected
```

---

## 11. `proposed`

The decision is under consideration.

A proposed record MAY contain:

- context;
- options;
- recommendation;
- unresolved questions.

It SHALL NOT be treated as current authority.

---

## 12. `accepted`

The decision has been adopted within its declared scope.

An accepted decision becomes part of the current project decision history.

Its exact authority depends on the domain and delegated governance.

---

## 13. `superseded`

The decision was once accepted but has been replaced.

A superseded record SHALL identify its successor where one exists.

Example:

```yaml
status: superseded
superseded_by:
  - ADR-0041
```

---

## 14. `rejected`

The proposal was explicitly considered and not adopted.

Rejected records may remain valuable because they preserve:

- alternatives;
- rationale;
- failed paths;
- avoided repetition.

---

## 15. `deprecated`

Used primarily for ADRs where the decision remains historically current in some context but SHOULD NOT govern new work.

A deprecated ADR SHOULD explain its remaining scope.

---

## 15A. `experimental`

Used for explicitly temporary or experimental architecture where Branch B's ADR governance permits that lifecycle state.

An experimental ADR SHALL identify its bounded scope and the evidence, constraint change, review point or reconsideration trigger that determines whether it is accepted, superseded, rejected or deprecated.

For engineering ADRs, Branch B remains authoritative for ADR lifecycle semantics, decision classes, evidence strength and acceptance procedure. Branch A stores and exposes those states in machine-indexable form.

---

# PART IV — DECISION AUTHORITY

## 16. Decision Records Do Not Automatically Create Authority

An ADR or DEC SHALL not gain project authority merely because it exists.

Its authority depends on:

- applicable governance;
- authority domain;
- decision owner;
- acceptance status;
- delegated authority;
- relationship to controlling documents.

---

## 17. Authority Domain

Decision records SHOULD identify:

```yaml
authority_domain:
  - architecture
```

or another valid domain.

A decision SHALL NOT claim authority outside its actual scope.

---

## 18. Conflict with Higher Authority

If an ADR or DEC conflicts with a higher controlling authority:

```text
Higher Authority
      ↓
Decision Record
```

the higher authority wins unless the decision was part of an authorised amendment process.

The Brain SHALL flag unresolved conflict rather than silently letting the newer decision override the older authority.

---

## 19. Decision as Amendment Trigger

A Decision may trigger:

- document amendment;
- architecture update;
- requirement update;
- registry migration;
- implementation migration.

However, the Decision record is not a substitute for updating the actual controlling source where required.

---

# PART V — REQUIRED ADR CONTENT

## 20. ADR Minimum Metadata

An ADR SHALL include:

```yaml
---
brain_schema: 1
id: ADR-0001
type: adr
title:
status:
information_class: authored
created:
updated:
authority_domain:
---
```

Recommended:

```yaml
scope:
decision_class:
reconsideration_triggers:
systems:
requirements:
documents:
supersedes:
superseded_by:
related_to:
work:
evidence:
```

---

## 21. ADR Body Structure

Recommended:

```markdown
# Context

# Decision

# Rationale

# Alternatives Considered

# Consequences

# Implementation Implications

# Validation / Evidence

# Supersession
```

---

## 22. Context

Context explains the problem and constraints that made the decision necessary.

It SHOULD include only information necessary to understand the choice.

---

## 23. Decision

The Decision section SHALL be explicit.

Good:

> Leyforge will use one stable material identity with multiple validated representations rather than duplicate stable identities for placed and inventory forms when behaviour does not require separation.

Bad:

> We think the projection approach is probably better.

---

## 24. Rationale

Rationale explains why the chosen option was selected.

It SHOULD capture:

- key constraints;
- tradeoffs;
- risk;
- future implications;
- relevant evidence.

---

## 25. Alternatives Considered

Significant alternatives SHOULD be recorded when they were genuinely evaluated.

The ADR does not need to invent fake alternatives for template completeness.

---

## 26. Consequences

Consequences SHOULD include:

- benefits;
- costs;
- constraints;
- known risks;
- future migration implications;
- testing implications.

---

# PART VI — DEC RECORD CONTENT

## 27. DEC Minimum Metadata

A DEC SHALL include:

```yaml
---
brain_schema: 1
id: DEC-0001
type: decision
title:
status:
information_class: authored
created:
updated:
authority_domain:
---
```

Recommended:

```yaml
scope:
documents:
systems:
work:
supersedes:
superseded_by:
```

---

## 28. DEC Body Structure

Recommended:

```markdown
# Context

# Decision

# Rationale

# Consequences

# Follow-Up
```

A DEC should be lighter than an ADR.

---

# PART VII — ONE DECISION PER RECORD

## 29. Atomic Decision Principle

A decision record SHOULD capture one coherent decision.

Bad:

```text
ADR-0014
Save system, logging, UI naming and asset import decisions
```

Good:

```text
ADR-0014
Save Serialization Boundary

ADR-0015
Save Migration Compatibility Strategy
```

Related decisions may link to one another.

---

## 30. Decision Bundles

Closely dependent choices MAY be captured together when separating them would destroy meaning.

The record should still have one clear central decision.

---

# PART VIII — DECISION CREATION

## 31. Creation Trigger

A Decision record SHOULD be created when the decision becomes materially consequential, not necessarily before discussion begins.

Possible flow:

```text
Work
 ↓
decision point discovered
 ↓
proposal
 ↓
ADR / DEC created
 ↓
evaluation
 ↓
accepted / rejected
```

---

## 32. Proposed Decision Before Implementation

Where a decision is high-risk or expensive to reverse, the ADR SHOULD be accepted before major implementation begins.

This is especially important for:

- save formats;
- persistent registries;
- public interfaces;
- migrations;
- cross-system architecture.

---

## 33. Retrospective ADR

Retrospective ADRs are allowed when an important architecture decision already exists in practice but was never recorded.

The record SHALL clearly identify that it is retrospective.

It SHALL NOT fabricate historical reasoning that is unknown.

---

# PART IX — DECISIONS INSIDE WORK

## 34. Work Record Linkage

A Work Record SHOULD link decisions created during the work.

Example:

```yaml
decisions:
  - ADR-0021
  - DEC-0044
```

---

## 35. No Hidden Consequential Decisions

A consequential decision SHALL NOT remain only in:

- Work Record;
- Handoff;
- chat;
- commit message;
- code comment.

It must be promoted to ADR/DEC or the controlling authority itself.

---

# PART X — DECISION RELATIONSHIPS

## 36. Recommended Relationships

Decision records MAY link:

```text
supersedes
superseded_by
amends
amended_by
related_to
decisions
requirements
systems
architecture
documents
work
evidence
risks
conflicts
```

---

## 37. Supersession Chain

Decision history SHOULD remain traceable:

```text
ADR-0007
   ↓ superseded by
ADR-0026
   ↓ superseded by
ADR-0041
```

The latest accepted ADR governs the declared scope unless another authority overrides it.

---

## 38. Partial Supersession

A decision may be partially superseded.

The successor SHALL state:

- which part changes;
- which parts remain valid.

The predecessor SHOULD be updated to point to the successor.

---

# PART XI — DECISION IDs

## 39. ADR IDs

Format:

```text
ADR-0001
ADR-0002
...
```

IDs are project-wide and never reused.

---

## 40. DEC IDs

Format:

```text
DEC-0001
DEC-0002
...
```

IDs are project-wide and never reused.

---

## 41. No Renumbering

Deleting or rejecting a record SHALL NOT cause later records to be renumbered.

History must remain stable.

---

# PART XII — DECISION FILENAMES

## 42. ADR Filenames

Recommended:

```text
ADR-0001 Save Serialization Boundary.md
```

---

## 43. DEC Filenames

Recommended:

```text
DEC-0001 Current Handoff Root Placement.md
```

Stable ID in filename improves human navigation.

---

# PART XIII — DECISION DIRECTORY

## 44. Brain Decision Location

```text
brain/05_DECISIONS/
├── ADR/
├── Decisions/
└── Superseded/
```

General DEC records are canonical in this Brain area.

Engineering ADRs are canonical here only if Branch B delegates ADR storage to the Brain. If Branch B defines another canonical ADR repository location, this Brain area SHALL contain indexed/proxy representations and navigation links rather than a competing authoritative copy.

A physical Superseded folder is optional.

Metadata remains the semantic source of truth for Brain indexing; the underlying canonical ADR source remains authoritative for its content.

---

# PART XIV — ALTERNATIVES

## 45. Record Real Alternatives

Alternatives SHOULD include only options actually considered or materially relevant.

Do not generate filler.

---

## 46. Rejected Alternatives Can Become Reusable Knowledge

A rejected ADR alternative MAY produce:

- Failure;
- Antipattern;
- Lesson;
- Research record.

Example:

```text
ADR-0014 rejects duplicated material identities
      ↓
ANTI-0006
Duplicate Stable Identity from Representation Difference
```

---

# PART XV — EVIDENCE

## 47. Evidence-Informed Decisions

A decision MAY be supported by:

- Research;
- Benchmark;
- Experiment;
- Test;
- Bug investigation;
- Work Record;
- external Source.

Links should be explicit.

---

## 48. Evidence Does Not Replace Judgement

A benchmark may show option A is faster.

The ADR still decides whether that performance difference outweighs:

- complexity;
- maintainability;
- correctness;
- migration cost;
- architecture risk.

---

# PART XVI — DECISION REVIEW

## 49. Review Triggers

Accepted decisions SHOULD be reviewed when:

- core architecture changes;
- engine/tool version changes;
- assumptions become false;
- repeated Bugs indicate a bad constraint;
- new evidence contradicts the rationale;
- a production phase changes requirements;
- the decision's scope expands significantly.

---

## 50. Review Does Not Mean Automatic Change

A review may conclude:

```text
Decision remains valid.
```

No successor is needed unless the actual decision changes.

---

# PART XVII — SUPERSESSION

## 51. Supersession Requires Explicit Successor

When a decision changes materially, prefer:

```text
old ADR
→ superseded
new ADR
→ accepted
```

rather than rewriting the old record to make it appear the project always believed the new thing.

---

## 52. Preserve History

The old record SHALL preserve:

- original rationale;
- original context;
- consequences known at the time.

The successor explains what changed.

---

## 53. Successor References

A successor SHOULD identify:

```yaml
supersedes:
  - ADR-0014
```

The predecessor SHOULD identify:

```yaml
superseded_by:
  - ADR-0041
```

---

# PART XVIII — REJECTION

## 54. Rejected Decision Preservation

Rejected ADRs/DECs SHOULD be retained when they capture meaningful analysis.

They prevent future workers from reopening the same path without knowing prior reasoning.

---

## 55. Low-Value Rejected Drafts

A trivial abandoned proposal may be removed if it contains no lasting value and was never referenced.

---

# PART XIX — CONFLICTS

## 56. Conflicting Accepted Decisions

Two accepted decisions SHALL NOT silently govern the same scope if they disagree.

Create or surface:

```text
CONFLICT-...
```

until resolved.

---

## 57. Conflict Resolution

The authority owner for the relevant domain resolves the conflict.

The Brain records the resolution and updates supersession links.

---

# PART XX — DECISION INDEX

## 58. Decision Index

The Decision Index SHOULD provide:

```text
Accepted ADRs
Proposed ADRs
Superseded ADRs
Rejected ADRs
Accepted DECs
Proposed DECs
Recent Decisions
Decisions by System
Decisions by Authority Domain
Decisions with Open Conflicts
```

---

## 59. Default Retrieval

Current work SHOULD prioritise:

```text
accepted current decisions
```

while still allowing historical traversal.

---

# PART XXI — AGENT BEHAVIOUR

## 60. Before Significant Work

An agent SHOULD inspect applicable accepted ADRs and DECs before modifying:

- architecture;
- persistence;
- registry contracts;
- interfaces;
- major tooling;
- other governed systems.

---

## 61. During Work

If the agent discovers a consequential unresolved choice, it SHOULD:

1. identify the decision;
2. determine ADR vs DEC;
3. capture context;
4. avoid silently making the choice when governance requires acceptance;
5. link the Work Record.

---

## 62. Autonomous Routine Decisions

Agents MAY make routine local decisions without formal ADR/DEC when permitted by governance.

The Brain should not create bureaucracy for every code edit.

---

## 63. No AI Authority Inflation

An AI agent SHALL NOT mark an ADR/DEC `accepted` unless:

- it has delegated authority to do so;
- or the governing workflow explicitly allows autonomous acceptance for that decision class.

Otherwise it remains `proposed`.

---

# PART XXII — RELATIONSHIP TO BRANCH B

## 64. Engineering Governance Integration

Branch B owns the engineering governance procedure surrounding technical decision-making.

LF-BRAIN-08 defines how ADRs/DECs are represented and stored in the Brain.

If Branch B defines:

- mandatory ADR thresholds;
- required review;
- approvers;
- code-change rules;
- Git reference rules;

those rules SHALL apply.

Branch A SHALL not override Branch B's engineering authority.

---

## 65. Brain as ADR Memory

The Brain SHALL surface:

- current ADRs;
- supersession;
- systems affected;
- implementation links;
- tests;
- evidence;
- Skills;
- Risks.

This makes ADRs navigable rather than isolated documents.

---

# PART XXIII — RELATIONSHIP TO BRANCH C

## 66. Audit Decisions

Branch C audit activity may produce consequential reconciliation decisions.

Those may use:

- DEC;
- ADR;
- document amendment;
- audit certification;

depending on scope.

The Brain SHALL preserve the decision lineage.

---

# PART XXIV — RELATIONSHIP TO BRANCH D

## 67. Production Decisions

Branch D may own production-sequencing decisions.

Where a roadmap decision deserves independent persistence, a DEC may be used.

The Production Roadmap itself remains authoritative for sequence.

---

# PART XXV — DECISION TEMPLATES

## 68. ADR Template

```markdown
---
brain_schema: 1
id: ADR-0000
type: adr
title:
status: proposed
information_class: authored
created: YYYY-MM-DD
updated: YYYY-MM-DD
authority_domain:
  - architecture
---

# Context

# Decision

# Rationale

# Alternatives Considered

# Consequences

# Implementation Implications

# Validation / Evidence

# Supersession
```

---

## 69. DEC Template

```markdown
---
brain_schema: 1
id: DEC-0000
type: decision
title:
status: proposed
information_class: authored
created: YYYY-MM-DD
updated: YYYY-MM-DD
authority_domain:
---

# Context

# Decision

# Rationale

# Consequences

# Follow-Up
```

---

# PART XXVI — DECISION QUALITY

## 70. Good Decision Record

A good decision record should allow a future worker to understand:

- what problem existed;
- what choice was made;
- why;
- what was rejected;
- what tradeoffs remain;
- what systems are constrained.

---

## 71. Avoid Decision Essays

Decision records SHOULD remain focused.

If large research or analysis is required, place it in Research/Experiment records and link it.

---

# PART XXVII — RETROSPECTIVE DECISION CAPTURE

## 72. Historical Decision Recovery

During initial Brain ingestion, existing major project decisions MAY be reconstructed into ADR/DEC records.

The record SHALL distinguish:

```text
known historical fact
```

from:

```text
inferred rationale
```

Unknown rationale SHALL remain unknown.

---

## 73. No Fictional Reconstruction

Agents SHALL NOT invent:

- alternatives supposedly considered;
- reasons supposedly discussed;
- dates supposedly decided;
- approvals supposedly given.

Only supported history may be recorded.

---

# PART XXVIII — DECISION TRACEABILITY

## 74. Decision Position in Traceability Chain

The Brain's long-term traceability model includes:

```text
SOURCE
  ↓
AUTHORITY
  ↓
REQUIREMENT
  ↓
DECISION
  ↓
ARCHITECTURE
  ↓
IMPLEMENTATION
  ↓
TEST
  ↓
EVIDENCE
```

Not every Requirement requires a separate Decision.

Not every Decision requires a new Requirement.

Relationships should reflect actual project history rather than a forced chain.

---

# PART XXIX — BRAIN DOCTOR

## 75. Decision Health Checks

Brain Doctor SHOULD eventually detect:

- duplicate ADR IDs;
- duplicate DEC IDs;
- accepted decision missing authority domain;
- accepted ADR missing Decision section;
- superseded decision missing successor where expected;
- successor missing reciprocal link;
- two accepted decisions claiming conflicting scope;
- accepted decision linked to superseded controlling authority;
- proposed ADR incorrectly marked as governing current implementation;
- rejected decision referenced as current;
- orphan architecture with no governing decision where policy requires one;
- high-impact Work Record containing unpromoted consequential decision;
- malformed status;
- broken system/document references.

---

# PART XXX — GIT & CODE LINKS

## 76. Git References

Where useful, ADR/DEC records MAY link:

- implementing commits;
- pull requests;
- migration commits;
- test commits.

Branch B determines whether such references are mandatory.

---

## 77. Code Comments

Code comments MAY reference ADR IDs for non-obvious architectural constraints.

Example:

```text
See ADR-0014.
```

The code comment SHALL not duplicate the entire ADR rationale.

---

# PART XXXI — CHANGES TO DECISIONS

## 78. Minor Clarification

Minor editorial clarification MAY update an accepted decision without supersession if the actual decision does not change.

The `updated` date SHALL change.

---

## 79. Material Change

A material change to the decision SHOULD create a successor.

Examples:

- different architecture;
- changed compatibility guarantee;
- changed authority boundary;
- changed persistent ID model;
- changed migration policy.

---

# PART XXXII — DECISION GOVERNANCE LEVELS

## 80. Decision Classes

Implementation MAY classify decisions by impact to support automation:

```text
local
system
cross_system
project
constitutional
```

This classification is optional for Brain v0.1 but may be useful.

---

## 81. Constitutional Decisions

A constitutional decision affects:

- project authority;
- governance ownership;
- Brain laws;
- production gates;
- cross-branch structure.

Such decisions require the appropriate project-control authority and SHALL NOT be autonomously accepted by ordinary agents.

---

# PART XXXIII — CODEX IMPLEMENTATION RESPONSIBILITIES

## 82. Pre-Production Setup

Codex SHOULD implement:

- ADR template;
- DEC template;
- automatic ID generation;
- Decision Index;
- status filters;
- supersession validation;
- reciprocal link checks;
- current-vs-historical views;
- Work-to-Decision linkage;
- optional Git/PR linkage;
- Brain Doctor decision checks.

---

## 83. Automation Boundary

Automation MAY:

- generate IDs;
- prefill dates;
- detect supersession inconsistencies;
- list affected systems;
- generate indexes;
- suggest that a Work Record contains a likely decision.

Automation SHALL NOT invent rationale or accept consequential decisions without delegated authority.

---

# PART XXXIV — DECISION SYSTEM LAWS

## 84. Decision Laws

The following laws are provisionally established:

1. Consequential decisions must survive beyond chat/session context.
2. ADRs capture significant architecture and engineering decisions.
3. DECs capture other consequential project decisions.
4. Routine local choices do not require decision records.
5. One record should normally represent one coherent decision.
6. Decision records do not automatically create authority.
7. Accepted decisions operate only within declared authority scope.
8. Higher controlling authority outranks conflicting lower decisions.
9. Major changes should supersede rather than rewrite history.
10. Superseded decisions remain preserved.
11. Rejected decisions may remain valuable historical knowledge.
12. Consequential decisions must not remain buried only inside Work Records.
13. Significant alternatives should be preserved when genuinely evaluated.
14. Evidence may inform a decision but does not make the decision automatically.
15. AI confidence does not grant acceptance authority.
16. Agents may autonomously make routine local decisions where governance permits.
17. High-risk decisions should generally be accepted before expensive implementation.
18. Retrospective ADRs are allowed but must not fabricate history.
19. Conflicting accepted decisions require explicit resolution.
20. Decision IDs are permanent and never reused.
21. Decision history should be easily traversable.
22. Branch B governs engineering decision procedure where applicable.
23. Branch A governs Brain representation and retrieval of decision records.
24. Brain Doctor validates decision-system integrity.
25. The purpose of ADR/DEC memory is to prevent Leyforge from repeatedly asking, "Why the hell did we build it this way?" 😂

---

## 85. Status

This document establishes the ADR & Decision Management Standard for Leyforge Brain v0.1.

It has been reconciled with LF-BRAIN-09 through LF-BRAIN-13 and with Branch B's locked engineering ADR direction. Branch B remains authoritative for engineering ADR procedure, lifecycle semantics, decision classes and evidence requirements; Branch A remains authoritative for Brain representation, indexing, linkage and retrieval.

This document is **LOCKED as the controlling Brain authority for durable decision records, supersession and decision-history navigation within the Project Brain**.
