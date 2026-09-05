# LEYFORGE PROJECT BRAIN
## Skills, Procedures & Project Learning System

**Document ID:** LF-BRAIN-07  
**Version:** v0.1  
**Status:** LOCKED — Branch A Design v0.1 — Ready for Pre-Production Implementation  
**Branch:** A — Leyforge Project Brain / Obsidian  
**Parent:** LF-BRAIN-01 — Project Brain Architecture & Governance Specification  
**Related:** LF-BRAIN-02, LF-BRAIN-03, LF-BRAIN-04, LF-BRAIN-05, LF-BRAIN-06  
**Purpose:** Define how Leyforge captures, evaluates, promotes, validates, reuses, supersedes and preserves project know-how, including Skills, Procedures, Patterns, Antipatterns, Shortcuts, Lessons, Failures and Workarounds.

---

## 1. Purpose

Leyforge SHALL preserve not only project facts and decisions, but also reusable knowledge about how the project itself is successfully designed, reconciled, implemented, tested, debugged and maintained.

The Project Learning System exists to answer questions such as:

- Have we solved this kind of problem before?
- What method worked?
- Under what conditions did it work?
- What approach failed?
- Why did it fail?
- Is there a safe shortcut?
- Is that shortcut still valid?
- What procedure is required here?
- What pattern should this system follow?
- What antipattern should we avoid?
- What evidence supports this technique?
- Has this technique been reused successfully?
- Is this still current practice?
- What did Leyforge learn from this work?

The target outcome is:

> **Leyforge remembers how to work on itself.**

---

## 2. Core Learning Principle

A useful observation SHALL NOT automatically become trusted project practice.

The learning lifecycle is deliberately progressive:

```text
Observation
    ↓
Candidate Lesson
    ↓
Testing / Reuse / Evidence
    ↓
Validated Knowledge
    ↓
Ongoing Reuse
    ↓
Review / Supersession / Deprecation
```

This prevents one-off hacks becoming standards, accidental behaviour becoming doctrine, outdated shortcuts surviving indefinitely, and AI guesses being treated as learned project wisdom.

---

# PART I — PROJECT LEARNING RECORD TYPES

## 3. Canonical Learning Types

The Project Learning System SHALL use:

```text
skill
procedure
pattern
antipattern
shortcut
lesson
failure
workaround
```

These types have intentionally different roles and SHALL not be treated as interchangeable.

## 4. Skill

**Type:** `skill`  
**ID family:** `SKILL-`

A Skill is reusable problem-solving know-how.

A Skill answers:

> **How do we effectively solve this recurring class of problem?**

Examples include registry identity reconciliation, diagnosing chunk-streaming stalls, structuring a large canon reconciliation, isolating save-migration regressions, or comparing implementation paths without losing authority.

## 5. Procedure

**Type:** `procedure`  
**ID family:** `PROC-`

A Procedure is a prescribed or recommended repeatable sequence of actions.

A Procedure answers:

> **What steps should be followed when performing this operation?**

A Procedure may become mandatory where a governing authority explicitly requires it.

## 6. Pattern

**Type:** `pattern`  
**ID family:** `PATTERN-`

A Pattern describes a recurring solution structure that has proven useful.

Examples include stable identity with multiple projections, authority proxies instead of canon duplication, bounded near/far simulation, or derived current-state dashboards.

## 7. Antipattern

**Type:** `antipattern`  
**ID family:** `ANTI-`

An Antipattern describes an approach that appears attractive but repeatedly creates harmful outcomes.

Examples include using implementation state as canon, duplicating authoritative content inside summaries, giant all-project Markdown files, or silently accepting stale registry identities.

## 8. Shortcut

**Type:** `shortcut`  
**ID family:** `SHORT-`

A Shortcut is a faster route that remains safe only under explicit conditions.

Every Shortcut SHALL define safe conditions, unsafe conditions, fallback path, evidence and scope.

A Shortcut is never permission to bypass required governance, testing or review.

## 9. Lesson

**Type:** `lesson`  
**ID family:** `LESSON-`

A Lesson is a useful finding that does not yet justify a more formal reusable record.

Lessons provide low-friction capture and may later become a Skill, Procedure, Pattern, Antipattern or Shortcut.

## 10. Failure

**Type:** `failure`  
**ID family:** `FAIL-`

A Failure preserves an unsuccessful approach worth remembering.

It answers:

> **What did we try, what happened, and why should we not blindly repeat it?**

## 11. Workaround

**Type:** `workaround`  
**ID family:** `WORKAROUND-`

A Workaround is an intentionally temporary or constrained solution to an unresolved underlying problem.

Every Workaround SHALL define the underlying problem, temporary solution, limitations, risk, removal condition and preferred permanent direction where known.

---

# PART II — TYPE SELECTION

## 12. Selection Rule

Use this decision model:

```text
Useful one-off observation?                → Lesson
Reusable technique?                        → Skill
Repeatable required/recommended sequence?  → Procedure
Recurring structural solution?             → Pattern
Recurring harmful approach?                → Antipattern
Faster safe route under bounded conditions?→ Shortcut
Unsuccessful reusable attempt?             → Failure
Deliberately temporary solution?           → Workaround
```

## 13. No Duplicate Knowledge by Label

The same underlying knowledge SHALL not be copied into multiple records merely to satisfy different labels.

Prefer relationships:

```text
FAIL-0012
    ↓ informed
ANTI-0008
    ↓ avoided by
PATTERN-0014
    ↓ operationalised by
PROC-0021
```

Each record has a distinct semantic role.

---

# PART III — LEARNING LIFECYCLE

## 14. Standard Maturity States

```text
candidate
testing
validated
deprecated
rejected
archived
```

## 15. Candidate

The knowledge appears useful but has not yet earned project trust.

Candidate knowledge MAY be reused experimentally if its status is visible, but SHALL NOT be presented as established Leyforge practice.

## 16. Testing

The knowledge is undergoing deliberate evaluation through repeated use, automated tests, benchmarks, cross-system application, controlled experimentation or review against failure conditions.

## 17. Validated

The knowledge has sufficient evidence, reuse history or governing approval to be treated as trusted project know-how within its defined scope.

Validation is always scope-aware.

## 18. Deprecated

Previously useful knowledge that should no longer be selected for new work.

The reason SHALL be preserved.

## 19. Rejected

Candidate knowledge that was evaluated and should not be adopted.

Rejected knowledge may remain historically valuable.

## 20. Archived

Knowledge that remains historically useful but no longer belongs in normal active retrieval.

---

# PART IV — VALIDATION MODEL

## 21. Evidence-Based Validation

A record SHALL NOT become `validated` merely because an agent recommends it, it sounds reasonable, it worked once, it was written confidently, or it appears in a recent Work Record.

## 22. Acceptable Validation Evidence

Depending on the record, validation may include:

- successful reuse across multiple Work Records;
- automated Tests and Evidence;
- Benchmark results;
- controlled Experiments;
- repeated audit success;
- explicit governing approval;
- reproducible defect avoidance;
- demonstrated reduction in error or effort;
- successful reuse by multiple agents.

## 23. `validated_by`

Validated learning records SHOULD link appropriate evidence:

```yaml
validated_by:
  - TEST-0001
  - EVID-0002
  - WORK-20260829-004
```

Where validation is governance-based, link the relevant Decision, ADR, Document or Audit.

## 24. Reuse Is Evidence, Not Proof

High reuse count does not automatically imply correctness.

A frequently reused bad habit can still be an Antipattern.

---

# PART V — DISCOVERY PROVENANCE

## 25. Discovery Source

Learned knowledge SHOULD identify where it originated.

Preferred:

```yaml
discovered_in:
  - WORK-20260829-004
```

Other valid provenance may include Research, Experiment, Bug investigation, Audit or Benchmark.

## 26. Normal Promotion Path

```text
Work Record
   ↓
candidate discovery
   ↓
Lesson / Failure / Workaround
   ↓
evaluation
   ↓
Skill / Procedure / Pattern / Antipattern / Shortcut
```

Not every discovery requires every stage.

## 27. No Provenance Fabrication

Unknown provenance SHALL remain unknown rather than being invented for neatness.

---

# PART VI — SKILL STANDARD

## 28. Minimum Metadata

```yaml
---
brain_schema: 1
id: SKILL-0001
type: skill
title:
status:
information_class: authored
created:
updated:
discovered_in:
---
```

For validated Skills, `validated_by` SHALL be present.

Recommended additional fields include `skill_class`, `systems`, `reuse_count`, `related_to`, `supersedes` and `superseded_by`.

## 29. Skill Body Structure

```markdown
# Problem
# Applicable Context
# Technique
# Why It Works
# Preconditions
# Failure Conditions
# Validation
# Reuse History
# Related Knowledge
```

## 30. Context Boundaries

A Skill SHALL state where it applies and where it does not.

Validated knowledge must not be reused outside its known scope as though universal.

## 31. Failure Conditions

Validated Skills SHOULD identify known conditions under which they fail or become unsafe.

---

# PART VII — PROCEDURE STANDARD

## 32. Procedure Structure

```markdown
# Purpose
# Preconditions
# Inputs
# Procedure
# Validation
# Failure / Escalation
# Outputs
# Related Authority
```

## 33. Procedure Authority

A Procedure MAY be recommended, required, advisory or experimental.

Where mandatory, it SHALL link the governing authority that makes it mandatory.

The Procedure itself does not create governance unless authority is delegated to it.

## 34. Version Sensitivity

Procedures dependent on a specific engine, tool, repository, schema or save version SHALL declare that dependency.

---

# PART VIII — PATTERN STANDARD

## 35. Pattern Structure

```markdown
# Context
# Problem
# Pattern
# Consequences
# Appropriate Use
# Inappropriate Use
# Evidence / Examples
# Related Patterns
```

## 36. Pattern vs Architecture

A Pattern describes reusable structure.

An Architecture record describes a specific current Leyforge architecture.

They SHALL remain distinct.

---

# PART IX — ANTIPATTERN STANDARD

## 37. Antipattern Structure

```markdown
# Tempting Approach
# Why It Seems Attractive
# Failure Mode
# Evidence
# Detection Signals
# Preferred Alternative
# Exceptions
```

## 38. Antipattern Evidence

Antipatterns SHOULD link relevant Failure records, Bugs, Work Records, Benchmarks or Audit findings.

## 39. Scope

An approach may be harmful in one context and valid in another.

Antipatterns SHALL define scope rather than becoming unjustified universal bans.

---

# PART X — SHORTCUT STANDARD

## 40. Shortcut Structure

```markdown
# Goal
# Shortcut
# Safe Conditions
# Unsafe Conditions
# Fallback Procedure
# Validation
# Expiry / Review Conditions
```

## 41. Safety Gate

A Shortcut SHALL NOT become validated without explicit safe and unsafe boundaries.

## 42. Governance Cannot Be Shortcutted

No Shortcut may bypass locked authority, required certification, migrations, security controls, destructive-change approval, mandatory testing or audit gates unless the governing authority explicitly defines an alternate compliant path.

---

# PART XI — LESSON STANDARD

## 43. Lesson Structure

```markdown
# Observation
# Context
# Why It Matters
# Evidence
# Possible Reuse
# Promotion Candidate
```

## 44. Promotion

A Lesson may remain a Lesson indefinitely.

Promotion is useful only when the knowledge becomes meaningfully reusable, prescriptive, structural, harmful or a safe shortcut.

---

# PART XII — FAILURE STANDARD

## 45. Failure Structure

```markdown
# Attempt
# Intended Outcome
# Actual Outcome
# Failure Mechanism
# Evidence
# Impact
# Retry Conditions
# Safer Alternative
```

## 46. Retry Conditions

A Failure SHOULD state whether the approach should never be retried under current architecture, retried only when conditions change, retried after a version upgrade, or reconsidered after redesign.

## 47. Failure vs Bug

A Bug describes a defect in intended current behaviour.

A Failure describes an unsuccessful attempted approach or experiment.

---

# PART XIII — WORKAROUND STANDARD

## 48. Workaround Structure

```markdown
# Underlying Problem
# Temporary Solution
# Scope
# Limitations
# Risks
# Monitoring
# Removal Condition
# Permanent Direction
```

## 49. Removal Trigger

A Workaround SHOULD have one or more explicit removal triggers such as an expiry date, production milestone, migration completion, Bug resolution, version upgrade or architecture replacement.

Brain Doctor SHOULD flag active Workarounds with no removal condition.

## 50. Workaround Is Not Architecture by Accident

If a Workaround is intentionally becoming permanent, an explicit ADR, Decision, Architecture update or Requirement update is required as appropriate.

---

# PART XIV — REUSE TRACKING

## 51. Reuse History

Reusable knowledge SHOULD track meaningful reuse.

The body may list Work Records, Audits or Experiments where the knowledge was applied.

## 52. Derived Reuse Count

Where tooling can calculate reuse from links, `reuse_count` SHOULD become derived rather than manually maintained.

## 53. Reuse Outcomes

The Brain may eventually distinguish successful and failed reuse so repeated application does not falsely imply successful validation.

---

# PART XV — SUPERSESSION

## 54. Superseding Learned Knowledge

Use normal lineage fields:

```yaml
status: deprecated
superseded_by:
  - SKILL-0002
```

## 55. Preserve the Reason

Superseded learning SHOULD preserve why it changed and whether any older contexts remain valid.

## 56. Avoid Historical Erasure

Where a technique changes materially, prefer a successor record over rewriting the old technique beyond recognition.

---

# PART XVI — DUPLICATE KNOWLEDGE

## 57. Duplicate Search

Before creating a learned-knowledge record, agents SHOULD inspect the relevant Knowhow/Skills indexes for near duplicates.

## 58. Merge Behaviour

When two records represent the same knowledge:

1. retain the stronger primary record;
2. merge unique evidence and provenance;
3. preserve aliases where useful;
4. mark the duplicate appropriately;
5. preserve links and history.

## 59. Similar Does Not Mean Duplicate

A Skill, Procedure and Pattern may all relate to the same problem without duplicating one another because they play different semantic roles.

---

# PART XVII — KNOWLEDGE RELATIONSHIPS

## 60. Recommended Relationships

Useful relationships include:

```text
discovered_in
validated_by
used_by
related_to
supersedes
superseded_by
derived_from
addresses
avoids
replaces
requires
```

Exact schema names remain governed by LF-BRAIN-04.

## 61. Positive and Negative Links

The Brain SHOULD support relationships such as:

```text
PATTERN-0012 avoids → ANTI-0004
PROC-0019 uses → SKILL-0008
WORKAROUND-0006 addresses → BUG-0022
SKILL-0010 derived_from → LESSON-0017
```

---

# PART XVIII — SKILLS INDEX

## 62. Purpose

The Skills Index SHALL help humans and agents find reusable current know-how quickly.

It SHOULD surface validated Skills, validated Procedures, validated Patterns, active Shortcuts, high-impact Antipatterns, active Workarounds and candidates awaiting validation.

## 63. Default Retrieval Priority

Normal work SHOULD prefer:

```text
validated
    ↓
testing, when explicitly appropriate
    ↓
candidate, only with caution
```

Deprecated and rejected knowledge SHOULD be excluded from normal recommendations unless historical context is needed.

---

# PART XIX — AGENT USE

## 64. Before Work

Before significant work, an agent SHOULD inspect relevant Skills, Procedures, Patterns, Antipatterns and active Workarounds.

## 65. During Work

Validated knowledge may be applied autonomously within declared scope unless another governance rule requires review.

Testing or candidate knowledge may be used experimentally only when status is visible, risk is acceptable and the Work Record captures the experiment.

## 66. After Work

An agent SHALL evaluate whether work produced a new Lesson, Failure, reusable Skill, Procedure improvement, Pattern, Antipattern, Shortcut or Workaround.

Not every work unit needs a learning output.

---

# PART XX — AI SAFETY AGAINST SELF-MYTHOLOGY

## 67. No Self-Certification by Confidence

An AI agent SHALL NOT promote its own technique to `validated` merely because it believes the technique is good.

## 68. No Fake Reuse History

Agents SHALL NOT fabricate reuse counts, successful applications, validation evidence or discovery history.

## 69. No Generic Knowledge Dump

The Skills Registry is for Leyforge-useful operational knowledge, not generic programming trivia.

---

# PART XXI — RESEARCH, BENCHMARK & BUG LEARNING

## 70. Research to Learning

```text
External Research
      ↓
Finding
      ↓
Leyforge Experiment / Application
      ↓
Work Evidence
      ↓
Lesson / Skill / Pattern
```

A technique that works elsewhere may not work in Leyforge.

## 71. Benchmark to Learning

Benchmark results MAY produce Lessons, Patterns, Antipatterns, Skills or ADR input.

The Benchmark remains the evidence; the learning record captures reusable interpretation.

## 72. Bug to Learning

A Bug may produce:

```text
Bug
 ↓
Failure mechanism
 ↓
Regression Test
 ↓
Antipattern / Skill
```

---

# PART XXII — KNOWLEDGE REVIEW

## 73. Periodic Review Triggers

Validated know-how SHOULD be reviewed when major engine, architecture, registry schema, save-format, tooling or production-stage changes occur.

## 74. Triggered Review

A record SHALL be considered for review when linked authority is superseded, a required implementation module is removed, validation evidence becomes obsolete, or linked Failure/Antipattern evidence contradicts its assumptions.

---

# PART XXIII — BRAIN DOCTOR

## 75. Learning-System Health Checks

Brain Doctor SHOULD eventually detect:

- duplicate Skill IDs;
- validated Skill without validation evidence;
- Shortcut missing safe/unsafe conditions;
- Workaround missing removal condition;
- broken discovery provenance;
- deprecated knowledge still marked default/current;
- superseded records missing successor links;
- stale candidate knowledge;
- impossible reuse counts;
- orphan learned knowledge;
- active Workaround linked to resolved root problem without review;
- Procedure claiming mandatory status without governing authority.

---

# PART XXIV — DYNAMIC VIEWS

## 76. Useful Bases / Index Views

```text
Validated Skills
Candidate Skills
Active Workarounds
High-Impact Antipatterns
Recent Lessons
Skills by System
Skills by Work Record
Knowledge Awaiting Validation
Deprecated Knowledge Still Referenced
```

---

# PART XXV — EXAMPLE SKILL

## 77. Example

```yaml
---
brain_schema: 1
id: SKILL-0027
type: skill
title: Registry Reconciliation by Identity Projection
status: validated
information_class: authored
created: 2026-08-29
updated: 2026-08-29
skill_class: reconciliation
discovered_in:
  - WORK-20260829-004
validated_by:
  - EVID-0066
  - WORK-20260829-009
systems:
  - SYS-REGISTRIES
---
```

```markdown
# Problem
Block and inventory records may appear to represent duplicate entities even when they are projections of one physical identity.

# Applicable Context
Registry reconciliation where placed, broken and inventory representations must be compared before creating separate identities.

# Technique
1. Determine physical identity.
2. Determine placed-world behaviour.
3. Determine broken-state behaviour.
4. Determine inventory projection.
5. Determine transformation semantics.
6. Apply the single-definition rule.
7. Create a second stable identity only if behaviour requires one.

# Failure Conditions
Do not apply when records represent genuinely different persistent objects with distinct behaviour.
```

---

# PART XXVI — PROJECT LEARNING VS GOVERNANCE

## 78. Learned Knowledge Does Not Automatically Become Law

A validated Skill or Pattern is trusted know-how, not automatically mandatory governance.

To become mandatory, the relevant authority must promote it into a governed Procedure, engineering standard, Requirement, architecture rule, audit requirement or equivalent formal source.

## 79. Governance May Reference Learned Knowledge

Governance SHOULD reference validated know-how where that reduces repeated explanation without weakening authority.

---

# PART XXVII — RETENTION

## 80. Preserve Useful Negative Knowledge

Failures, rejected candidates and deprecated techniques SHOULD be retained where they prevent repeated mistakes.

Negative knowledge is a major purpose of the Brain.

## 81. Archive Low-Value Knowledge

Low-value stale Lessons may be archived if they are no longer referenced, contain no unique evidence, are superseded and provide little realistic rediscovery value.

---

# PART XXVIII — CODEX IMPLEMENTATION RESPONSIBILITIES

## 82. Pre-Production Setup

During the Pre-Production Infrastructure stage, Codex SHOULD implement:

- templates for all core learning types;
- Skills/Knowhow Index;
- maturity-state validation;
- provenance links;
- validation-evidence checks;
- duplicate-detection support;
- active Workaround views;
- stale-candidate detection;
- Work Record promotion hooks where practical;
- safe-reuse lookup;
- deprecation and supersession checks.

## 83. Automation Boundary

Automation MAY calculate reuse counts, find references, detect stale candidates, suggest duplicates, surface validation gaps and generate indexes.

Automation SHALL NOT independently decide that a technique is validated unless an explicit machine-verifiable validation policy has been satisfied.

Where judgement is required, the record remains candidate/testing pending authorised evaluation.

---

# PART XXIX — PROJECT LEARNING LAWS

## 84. Learning Laws

1. Leyforge preserves reusable project know-how as first-class knowledge.
2. A useful observation does not automatically become trusted practice.
3. Skills describe reusable problem-solving know-how.
4. Procedures describe repeatable workflows.
5. Patterns describe recurring successful structures.
6. Antipatterns preserve recurring harmful approaches.
7. Shortcuts require explicit safety boundaries.
8. Lessons provide low-friction capture without premature promotion.
9. Failures preserve unsuccessful approaches worth remembering.
10. Workarounds are temporary by definition and require removal conditions.
11. Learned knowledge should preserve discovery provenance.
12. Validation requires evidence appropriate to the claim.
13. AI confidence is not validation.
14. Reuse strengthens evidence but does not prove correctness by itself.
15. Validation is scope-specific.
16. Generic programming knowledge does not belong in the Leyforge Skills Registry unless materially project-specific.
17. Research must be tested or applied before becoming Leyforge operational knowledge where applicability is uncertain.
18. Negative knowledge is deliberately retained.
19. Deprecated knowledge remains historically accessible.
20. Supersession should preserve why older knowledge changed.
21. Duplicate learning records should be merged without losing provenance.
22. Project-learning records do not automatically become governance.
23. Governance may explicitly promote or require validated project know-how.
24. Agents should consult relevant validated know-how before significant work.
25. Agents should evaluate significant work for reusable learning after completion.
26. Brain Doctor validates learning-system integrity.
27. Active Workarounds must remain visible.
28. Shortcuts never bypass required authority or safety gates.
29. The learning system must remain useful enough that workers actually consult it.
30. The ultimate purpose is to prevent Leyforge from repeatedly rediscovering the same solutions and mistakes.

---

## 85. Status

This document establishes the Skills, Procedures & Project Learning System for Leyforge Brain v0.1.

It has been reconciled with decision management, agent behaviour, Brain Doctor, automation, ingestion and pilot/certification requirements.

This document is **LOCKED as the controlling Brain authority for capturing, evaluating, validating, preserving and reusing Leyforge project know-how**.
