# LEYFORGE PROJECT BRAIN
## Brain Doctor & Validation Standard

**Document ID:** LF-BRAIN-10  
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
- LF-BRAIN-08 — ADR & Decision Management Standard  
- LF-BRAIN-09 — Agent Operating Contract  

**Purpose:** Define the health, integrity, validation, diagnostics, severity, waiver, certification and automation requirements for the Leyforge Brain Doctor system.

---

## 1. Purpose

The Leyforge Project Brain is intended to become project infrastructure rather than an informal note collection.

Accordingly, its structural and operational integrity SHALL be machine-checkable.

Brain Doctor exists to answer:

- Is the Brain structurally valid?
- Are stable IDs unique?
- Are required fields present?
- Are statuses legal?
- Are authority links coherent?
- Are supersession chains valid?
- Are generated records current and protected?
- Are significant records orphaned?
- Is Current Handoff usable?
- Is active Work stale or unresolved?
- Are validated Skills supported by evidence?
- Are Workarounds still justified?
- Are Requirements linked to implementation and Tests?
- Are current indexes and dashboards consistent with source records?
- Is the Brain healthy enough to support production work?

The system SHALL identify problems before they become long-lived project drift.

---

## 2. Core Validation Principle

Brain Doctor SHALL operate according to:

```text
DETECT
  ↓
CLASSIFY
  ↓
REPORT
  ↓
FIX / WAIVE / ESCALATE
  ↓
REVALIDATE
```

Brain Doctor SHALL NOT silently change authoritative project truth merely to make validation pass.

---

## 3. Brain Doctor Is Not Authority

Brain Doctor is a validator.

It may:

- detect invalid states;
- generate diagnostics;
- identify broken relationships;
- regenerate derived outputs where authorised;
- suggest remediation;
- block gates when policy requires.

It SHALL NOT independently decide:

- canon;
- authority ownership;
- ADR acceptance;
- V1 certification;
- production approval;
- requirement meaning;
- architectural intent.

Where validation reveals a governance question, Brain Doctor SHALL surface the issue for the appropriate authority.

---

# PART I — VALIDATION LEVELS

## 4. Diagnostic Severity

Brain Doctor SHALL classify diagnostics using:

```text
ERROR
WARNING
INFO
```

A future implementation MAY add more granular codes while preserving these three top-level severities.

---

## 5. ERROR

An ERROR represents a state that violates a required Brain contract or makes reliable operation unsafe.

Examples:

- duplicate stable ID;
- malformed YAML;
- unsupported schema version;
- missing required field;
- invalid note type;
- invalid status for type;
- broken required authority pointer;
- conflicting current primary authority;
- generated `do_not_edit` file manually altered where integrity can be established;
- CURRENT_HANDOFF missing when required for active significant work;
- accepted ADR with structurally invalid supersession lineage.

ERROR conditions MAY block certification or CI depending on validation profile.

---

## 6. WARNING

A WARNING represents a suspicious, stale, incomplete or risky state that may still be valid.

Examples:

- active Work stale beyond threshold;
- orphan significant record;
- candidate Skill stale;
- active Workaround with no recent review;
- Requirement missing a Test;
- one-way relationship where reciprocity is recommended;
- deprecated knowledge still heavily referenced.

Warnings SHALL remain visible until reviewed, resolved or explicitly waived.

---

## 7. INFO

INFO provides maintenance guidance without implying invalidity.

Examples:

- optional metadata missing;
- archive candidate detected;
- recently superseded record still frequently linked;
- unused secondary classification;
- new record lacks optional summary.

INFO SHALL NOT block gates by itself.

---

# PART II — VALIDATION PROFILES

## 8. Validation Profiles

Brain Doctor SHOULD support multiple profiles.

Initial conceptual profiles:

```text
quick
standard
strict
certification
```

---

## 9. `quick`

Designed for fast local checks during ordinary work.

Should include at least:

- YAML parse;
- supported schema version;
- duplicate IDs;
- invalid type;
- invalid status;
- required fields;
- broken critical references.

---

## 10. `standard`

Used for significant work closeout.

Includes `quick` plus:

- relationship integrity;
- authority pointers;
- Handoff health;
- Work status health;
- generated-file ownership;
- relevant learning validation;
- index consistency.

---

## 11. `strict`

Used before major merges, migrations or control-layer milestones.

Includes `standard` plus:

- full supersession checks;
- traceability checks;
- stale-state checks;
- duplicate-semantic-record checks where detectable;
- Workaround expiry review;
- audit coverage checks;
- derived-output drift.

---

## 12. `certification`

Used for formal Brain v0.1 certification and later production gates.

Includes all required integrity checks plus gate-specific requirements.

Certification SHALL fail when blocking ERROR conditions remain unresolved.

---

# PART III — SCHEMA VALIDATION

## 13. YAML Validation

Brain Doctor SHALL verify that formal records contain parseable YAML frontmatter.

Malformed YAML is an ERROR.

---

## 14. Schema Version Validation

Each formal Brain record SHALL declare a supported:

```yaml
brain_schema:
```

Unsupported or missing required schema version is an ERROR.

---

## 15. Required Field Validation

Brain Doctor SHALL verify:

- universal required fields;
- type-specific required fields;
- conditional required fields.

Example:

```text
validated Skill
→ must include validated_by
```

---

## 16. Type Validation

`type` SHALL match the canonical LF-BRAIN-03 register.

Unknown ad hoc types are ERROR unless introduced through approved schema extension.

---

## 17. Status Validation

Brain Doctor SHALL verify that each record uses a status permitted for its type.

Example:

```text
type: work
status: accepted
```

is invalid.

---

## 18. Information Class Validation

Allowed:

```text
authored
generated
derived
temporary
```

Invalid values are ERROR.

---

# PART IV — ID VALIDATION

## 19. Global ID Uniqueness

Stable IDs SHALL be unique across the Brain.

Duplicate stable IDs are ERROR.

---

## 20. ID Format

Brain Doctor SHALL validate family-specific formats.

Examples:

```text
ADR-0001
DEC-0001
WORK-20260829-004
SYS-SETTLEMENT
```

---

## 21. ID Immutability

Where Git history or a registry of IDs allows detection, Brain Doctor SHOULD warn or error when a stable ID appears to have been replaced improperly.

---

## 22. No ID Reuse

An ID associated historically with a different logical record SHALL NOT be reused.

Where detectable, reuse is ERROR.

---

# PART V — RELATIONSHIP VALIDATION

## 23. Reference Existence

Relationship fields using stable IDs SHOULD resolve to existing records where the relationship requires a Brain target.

Missing required target is ERROR.

Missing optional/historical target may be WARNING if deliberate external references are allowed.

---

## 24. Relationship Shape

Relationship fields SHALL use the value shape defined by LF-BRAIN-04.

For list fields:

```yaml
tests:
  - TEST-0001
```

is valid.

Unexpected scalar/list inconsistency is ERROR where schema requires a list.

---

## 25. Allowed Relationship by Type

Brain Doctor SHOULD validate type-compatible relationships.

Example:

```text
Skill validated_by Evidence
```

is valid.

A clearly nonsensical relationship MAY be flagged.

---

## 26. Reciprocal Relationships

Where reciprocity is mandatory, both sides SHALL exist.

Example:

```text
ADR-0014 superseded_by ADR-0041
ADR-0041 supersedes ADR-0014
```

Missing required reciprocal link is ERROR or WARNING according to relationship class.

---

# PART VI — AUTHORITY VALIDATION

## 27. Authority Pointer Integrity

Significant records requiring authority SHALL have:

- valid `authority_domain`;
- valid `source_of_truth`;
- or explicit unresolved authority state.

---

## 28. Current Authority Uniqueness

Two current `primary` authorities SHALL NOT claim the same scope within the same domain unless the authority model explicitly permits co-ownership.

Conflicting claims are ERROR and SHOULD surface a Conflict record.

---

## 29. Superseded Authority

A superseded source SHALL NOT remain referenced as the sole current `source_of_truth` where a valid successor exists.

This is ERROR for current authoritative records.

---

## 30. Historical Authority Use

Historical sources MAY remain linked for provenance.

Brain Doctor SHOULD distinguish:

```text
historical reference
```

from:

```text
current authority pointer
```

---

## 31. Unknown Authority

If authority is unresolved and the schema permits:

```yaml
authority_status: unresolved
```

Brain Doctor SHALL not fabricate an answer.

It SHOULD emit a WARNING or ERROR depending on whether work can safely continue.

---

# PART VII — SUPERSESSION & LINEAGE

## 32. Supersession Integrity

Brain Doctor SHALL validate:

- predecessor exists;
- successor exists;
- reciprocal links where required;
- no circular supersession;
- current record does not supersede itself;
- status matches lineage.

---

## 33. Circular Supersession

Example:

```text
ADR-0001 → ADR-0002 → ADR-0001
```

is ERROR.

---

## 34. Multiple Successors

Multiple successors MAY be valid under partial supersession.

If present, scope SHALL be clear.

Ambiguous multiple full successors SHOULD be ERROR.

---

## 35. Amendment Integrity

Amendment links SHALL resolve to valid parents/successors where applicable.

An amendment SHALL NOT point to an unrelated logical record without declared rationale.

---

# PART VIII — GENERATED & DERIVED CONTENT

## 36. Generator Metadata

Generated records SHALL include required generator metadata:

```yaml
generator:
generation_version:
generated_at:
edit_policy:
```

Missing required generator metadata is ERROR.

---

## 37. Generated Integrity

Where practical, generated files SHOULD contain a source fingerprint, generation signature or reproducible derivation allowing Brain Doctor to detect drift.

---

## 38. Manual Edit Detection

If:

```yaml
edit_policy: do_not_edit
```

and generated output differs from what the generator would produce, Brain Doctor SHOULD report ERROR or WARNING depending on certainty.

---

## 39. Derived View Drift

Derived dashboards and indexes SHOULD be compared against source records where feasible.

Stale derived outputs are WARNING or ERROR depending on operational importance.

---

# PART IX — WORK VALIDATION

## 40. Active Work Health

Brain Doctor SHOULD verify that active Work:

- has clear objective;
- has current `updated` date;
- links relevant authority where required;
- is represented in Current Work views;
- is not obviously completed but still marked active.

---

## 41. Stale Work

Work unchanged beyond a configured threshold SHOULD produce WARNING.

The threshold SHALL be configurable.

Brain Doctor SHALL not auto-close stale Work.

---

## 42. Blocked Work

Blocked Work SHOULD identify:

- blocker;
- resolution route;
- next action.

Missing blocker explanation is WARNING or ERROR depending on workflow requirements.

---

## 43. Complete Work

A Work Record marked `complete` SHOULD satisfy required closeout fields.

Where required verification is absent, Brain Doctor SHOULD warn or error based on task class.

---

# PART X — HANDOFF VALIDATION

## 44. CURRENT_HANDOFF Presence

When significant work is active, `CURRENT_HANDOFF.md` SHALL exist.

Missing Handoff is ERROR in strict/certification profiles.

---

## 45. Handoff Health

Brain Doctor SHOULD validate:

- current objective present;
- active Work references resolve;
- authority links resolve;
- blockers are surfaced;
- next recommended action exists;
- handoff is not materially stale.

---

## 46. Handoff vs Work Consistency

If Handoff lists a Work Record as active but that Work is complete/cancelled, Brain Doctor SHOULD warn.

---

## 47. Handoff Canon Drift

If Handoff contains unique claims marked as governing truth without formal authority links, Brain Doctor MAY warn that the information should be promoted.

---

# PART XI — PROJECT LEARNING VALIDATION

## 48. Validated Knowledge

Validated Skills, Procedures, Patterns and other applicable learned records SHALL contain appropriate validation evidence.

Missing required `validated_by` is ERROR.

---

## 49. Candidate Knowledge Staleness

Candidate/testing knowledge stale beyond a configured review threshold SHOULD produce WARNING.

---

## 50. Shortcut Safety

A Shortcut SHALL define:

- safe conditions;
- unsafe conditions;
- fallback path.

Missing safety boundaries is ERROR for validated Shortcut.

---

## 51. Workaround Removal Condition

Active Workarounds SHALL define a removal or expiry condition.

Missing removal condition is WARNING or ERROR depending on production relevance.

---

## 52. Workaround Root-Cause Review

If the linked root Bug/Conflict is resolved while Workaround remains active, Brain Doctor SHOULD warn.

---

## 53. Deprecated Knowledge

Deprecated knowledge SHOULD NOT be marked as default/current recommendation.

If current Procedures or Agent instructions still depend on deprecated knowledge, Brain Doctor SHOULD warn.

---

# PART XII — DECISION VALIDATION

## 54. ADR Structural Checks

Accepted ADRs SHOULD contain:

- Context;
- Decision;
- Rationale;
- Consequences.

Missing Decision section is ERROR.

Other missing sections MAY be WARNING depending on policy.

---

## 55. Decision Acceptance

Accepted ADR/DEC SHALL identify valid authority domain.

---

## 56. Proposed Decisions

Proposed decisions SHALL NOT be treated as current governing decisions in derived current-state views.

If they are, Brain Doctor SHOULD flag ERROR.

---

## 56A. Experimental ADRs

Engineering ADRs with:

```yaml
status: experimental
```

SHALL comply with Branch B's experimental-architecture rules.

Brain Doctor SHOULD detect missing bounded scope, reconsideration triggers or required evidence metadata when those fields are required by the governing Branch B ADR class.

Experimental ADRs SHALL NOT be represented as permanently accepted architecture outside their declared scope.

---

## 57. Superseded Decisions

Superseded decisions SHOULD identify successor when one exists.

---

## 58. Conflicting Accepted Decisions

Brain Doctor SHOULD detect multiple accepted decisions claiming contradictory scope where metadata permits.

This condition requires Conflict resolution.

---

# PART XIII — REQUIREMENT TRACEABILITY

## 59. Requirement Source

Active Requirements SHALL link to a valid source authority.

Missing source is ERROR unless authority is explicitly unresolved.

---

## 60. Requirement Implementation

Depending on production stage, Brain Doctor SHOULD identify active Requirements lacking implementation linkage.

This is normally WARNING during design and may become ERROR during implementation certification.

---

## 61. Requirement Test Coverage

Requirements that require verification SHOULD link to Tests.

Missing Test linkage is WARNING during early stages and MAY become ERROR at certification gates.

---

## 62. Requirement Evidence

Verified Requirements SHOULD have supporting Evidence.

---

# PART XIV — TEST & EVIDENCE VALIDATION

## 63. Test Identity

Tests SHALL use valid stable IDs and required metadata.

---

## 64. Evidence Context

Evidence SHOULD identify sufficient context to understand the observation.

Where relevant:

- build;
- commit;
- environment;
- test;
- timestamp.

---

## 65. False Pass Prevention

A Requirement or Work Record SHALL NOT be marked verified solely because a Test definition exists.

Actual Evidence is required where verification policy requires execution.

---

## 66. Benchmark Context

Benchmarks SHOULD include:

- hardware;
- platform;
- configuration;
- workload;
- metrics;
- sample count;
- build/commit.

Missing critical benchmark context SHOULD be WARNING or ERROR depending on use.

---

# PART XV — BUG, RISK, CONFLICT & DEVIATION

## 67. Bug Integrity

Open Bugs SHOULD have:

- severity;
- evidence or reproduction where available;
- implementation target;
- status.

---

## 68. Risk Integrity

Active Risks SHOULD define:

- likelihood;
- impact;
- mitigation or owner where required.

---

## 69. Conflict Integrity

Conflicts SHOULD identify:

- conflicting sources;
- authority domain;
- severity;
- resolution owner or route.

---

## 70. Deviation Integrity

Active Deviations SHOULD identify:

- governing authority;
- justification;
- risk;
- expiry/remediation condition.

Expired but active Deviations are ERROR or WARNING depending on severity.

---

# PART XVI — INDEX & NAVIGATION VALIDATION

## 71. Required Entry Files

Brain Doctor SHALL verify existence of:

```text
HOME.md
AGENTS.md
CURRENT_HANDOFF.md
```

according to profile requirements.

---

## 72. Index Integrity

Expected core indexes SHOULD exist.

Missing critical Index is WARNING or ERROR depending on profile.

---

## 73. Orphan Significant Records

A significant record with no inbound or outbound project relationship MAY be orphaned.

Brain Doctor SHOULD flag likely orphans for review.

Not all standalone records are invalid.

---

## 74. Broken Body Links

Brain Doctor SHOULD detect broken Obsidian wikilinks where practical.

Broken navigation links are WARNING by default.

Broken links essential to authority or operation MAY be ERROR.

---

## 75. Navigation Depth

Brain Doctor MAY report INFO when important active records are not reachable through expected Index paths.

This is a usability diagnostic rather than a strict correctness rule.

---

# PART XVII — INBOX & ARCHIVE

## 76. Inbox Staleness

Inbox records older than a configured threshold SHOULD be WARNING.

Inbox is a queue, not storage.

---

## 77. Inbox Promotion State

An Inbox record marked `promoted` or `merged` SHOULD link its destination.

Missing destination is WARNING.

---

## 78. Archive Integrity

Archived records SHALL preserve stable IDs and historical relationships.

Archive movement SHALL NOT erase semantic status.

---

# PART XVIII — DUPLICATE & SEMANTIC DRIFT DETECTION

## 79. Exact Duplicate IDs

ERROR.

---

## 80. Duplicate Logical Records

Brain Doctor SHOULD attempt to detect likely duplicate primary records using:

- same title;
- aliases;
- same authority source;
- same canonical path;
- same domain identity;
- high semantic overlap where tooling permits.

These are WARNING candidates requiring human/agent review.

---

## 81. Duplicate Document Proxies

Two current Document records pointing to the same canonical logical document SHOULD be flagged.

---

## 82. Mirror Detection

Copies/mirrors SHOULD be represented as mirrors rather than independent authority.

Hash comparison MAY assist detection.

---

# PART XIX — REPOSITORY & PATH VALIDATION

## 83. Canonical Path Validation

Document proxies and Implementation Modules SHOULD reference valid repository-relative paths.

Missing required path is ERROR.

---

## 84. Absolute Path Detection

Machine-specific absolute paths SHOULD be rejected from canonical metadata.

Example:

```text
C:\Users\...
/Users/name/...
```

should produce ERROR or WARNING depending on field.

---

## 85. Missing Repository Target

A canonical path pointing to a missing file/directory is ERROR or WARNING depending on whether the target is expected to exist in current stage.

---

# PART XX — `.obsidian/` HEALTH

## 86. Project Configuration

Brain Doctor MAY inspect expected project-relevant `.obsidian/` configuration.

---

## 87. Volatile Workspace Files

If volatile workspace state is accidentally tracked contrary to policy, Brain Doctor SHOULD warn.

---

## 88. Secret Scanning

Brain Doctor or associated repository tooling SHOULD detect likely secrets inside Brain content.

Confirmed secrets are ERROR and require remediation.

Branch B may own the wider repository secret-scanning policy.

---

# PART XXI — PLUGIN VALIDATION

## 89. Community Plugin Check

Brain v0.1 expects no community plugin dependency unless explicitly approved.

Brain Doctor SHOULD report unapproved community plugins if detectable.

---

## 90. Plugin Dependency Drift

If an essential Brain function becomes dependent on a community plugin contrary to governance, Brain Doctor SHOULD flag ERROR in strict/certification mode.

---

# PART XXII — VALIDATION CODES

## 91. Stable Diagnostic Codes

Brain Doctor SHOULD use stable machine-readable codes.

Examples:

```text
BD-SCHEMA-001
BD-ID-001
BD-AUTH-001
BD-WORK-001
BD-HANDOFF-001
BD-LEARN-001
BD-DECISION-001
BD-TRACE-001
BD-GENERATED-001
```

Codes allow:

- CI filtering;
- waiver tracking;
- dashboards;
- trend analysis;
- precise remediation.

---

## 92. Diagnostic Message Structure

Each diagnostic SHOULD include:

```text
code
severity
record
message
rule
suggested action
```

Optional:

```text
related records
source path
line
validation profile
```

---

# PART XXIII — WAIVERS & EXCEPTIONS

## 93. No Silent Ignore

A validation failure SHALL NOT disappear because an agent chooses not to care about it.

---

## 94. Waiver Mechanism

Where a rule may legitimately be waived, the waiver SHALL be explicit.

A waiver SHOULD identify:

- diagnostic code;
- affected record(s);
- reason;
- authority;
- expiry/review condition;
- related Deviation or Decision.

---

## 95. Waiver vs Fix

Waiver is not equivalent to resolution.

Dashboards SHOULD distinguish:

```text
passing
waived
failing
```

---

## 96. Expired Waivers

Expired waivers SHALL no longer suppress diagnostics.

---

# PART XXIV — AUTOFIX POLICY

## 97. Safe Autofix

Brain Doctor MAY automatically fix deterministic low-risk issues, such as:

- missing generated index content;
- formatting normalisation;
- ordering generated sections;
- derived counts;
- mechanically recoverable reciprocal links where policy explicitly allows.

---

## 98. Unsafe Autofix

Brain Doctor SHALL NOT automatically:

- choose authority;
- accept decisions;
- alter canon;
- resolve conflicts;
- change stable IDs;
- retire records;
- invent missing evidence;
- change requirement meaning.

---

## 99. Autofix Transparency

Every autofix SHOULD be:

- logged;
- reproducible;
- attributable to tooling;
- reviewable in Git.

---

# PART XXV — REPORTING

## 100. Human Summary

Brain Doctor SHOULD produce a concise human-readable result:

```text
Brain Doctor: FAIL

Errors:   3
Warnings: 7
Info:     12
```

with grouped actionable diagnostics.

---

## 101. Machine Output

Brain Doctor SHOULD support structured output such as JSON for:

- CI;
- dashboards;
- automated tooling;
- trend analysis.

---

## 102. No Giant Noise Dump

Diagnostics SHOULD be deduplicated and grouped.

A single root cause SHOULD not generate hundreds of redundant messages when a clearer grouped report is possible.

---

# PART XXVI — CI & GIT INTEGRATION

## 103. Local Validation

Developers/agents SHOULD be able to run Brain Doctor locally.

---

## 104. CI Validation

Strict or targeted Brain Doctor checks SHOULD eventually run in CI for Brain-affecting changes.

Branch B governs final CI implementation.

---

## 105. Changed-File Optimisation

Quick validation MAY operate only on:

- changed records;
- directly affected references;
- required global uniqueness checks.

Strict/certification profiles MAY scan the entire Brain.

---

# PART XXVII — VALIDATION PERFORMANCE

## 106. Performance Goal

Brain Doctor SHOULD remain fast enough that agents actually use it.

Slow checks MAY be split into:

```text
quick
standard
strict
certification
```

rather than making every edit trigger a full-vault audit.

---

## 107. Caching

Implementation MAY cache:

- parsed metadata;
- ID index;
- dependency graph;
- hashes;
- generated-output fingerprints.

Caches SHALL be disposable and non-authoritative.

---

# PART XXVIII — BRAIN HEALTH DASHBOARD

## 108. Brain Health View

The Brain Health dashboard SHOULD surface:

```text
overall validation state
error count
warning count
stale Work
stale Inbox
unresolved Conflicts
active Deviations
active Workarounds
missing Requirement Tests
broken authority links
schema migration status
generated-output drift
```

---

## 109. Health Dashboard Authority

The dashboard is derived.

Underlying records and diagnostics remain the source.

---

# PART XXIX — CERTIFICATION GATES

## 110. Brain v0.1 Certification

Before Brain v0.1 is declared operational, certification SHOULD require:

```text
[ ] No unresolved blocking schema ERRORs
[ ] No duplicate stable IDs
[ ] Required root files present
[ ] Authority system operational
[ ] Work/Handoff workflow passes pilot
[ ] Decision system operational
[ ] Learning system operational
[ ] Generated/derived boundaries enforced
[ ] Core indexes functional
[ ] Brain Doctor itself tested
[ ] Git integration verified
[ ] Agent startup/closeout flow verified
[ ] Required waivers documented
```

---

## 111. Production Setup Gate

Before clean Leyforge rebuild begins, the Brain certification profile SHALL be run as part of Pre-Production Infrastructure certification.

Failure of blocking Brain Doctor rules SHALL block Brain certification.

---

## 112. No False Green

Certification SHALL not be achieved by:

- deleting diagnostics;
- disabling checks without governance;
- blanket waivers;
- marking unresolved issues as INFO;
- editing generated outputs manually.

---

# PART XXX — BRAIN DOCTOR SELF-VALIDATION

## 113. Brain Doctor Is Production Tooling

Brain Doctor itself SHALL be:

- versioned;
- tested;
- reviewed under Branch B;
- reproducible;
- documented;
- safe against destructive changes.

---

## 114. Test Fixtures

Brain Doctor SHOULD include fixtures for:

- valid records;
- duplicate IDs;
- malformed YAML;
- broken authority;
- circular supersession;
- stale Handoff;
- invalid Skill validation;
- generated-file drift;
- invalid Workaround;
- traceability gaps.

Historical fixtures SHOULD be preserved as evidence.

---

## 115. Rule Regression

A validation rule fix SHOULD include a regression test where practical.

---

# PART XXXI — CODEX IMPLEMENTATION RESPONSIBILITIES

## 116. Pre-Production Setup

Codex SHOULD implement:

- Brain Doctor CLI entry point;
- validation profiles;
- stable diagnostic codes;
- Markdown/YAML parsing;
- schema validation;
- global ID index;
- reference graph;
- authority checks;
- supersession checks;
- Work/Handoff checks;
- learning-system checks;
- generated-file checks;
- traceability checks;
- structured JSON output;
- human-readable output;
- test fixtures;
- CI integration hooks;
- Brain Health output.

---

## 117. Implementation Language

LF-BRAIN-10 does not mandate a programming language.

Branch B engineering governance and project constraints SHALL determine implementation.

---

## 118. Codex May Refine Mechanics

Codex MAY choose efficient internal implementation techniques.

It SHALL NOT weaken validation semantics to simplify coding.

If a required check is impractical, the limitation SHALL be surfaced through Work/Decision records rather than silently omitted.

---

# PART XXXII — INITIAL RULE FAMILIES

## 119. Rule Families

Brain Doctor v0.1 SHOULD organise rules into families:

```text
schema
identity
relationships
authority
lineage
generated
work
handoff
learning
decisions
requirements
testing
evidence
bugs
risks
conflicts
deviations
navigation
inbox
archive
repository
security
plugins
traceability
certification
```

---

# PART XXXIII — VALIDATION LAWS

## 120. Brain Doctor Laws

The following laws are provisionally established:

1. Brain integrity is machine-testable.
2. Validation detects; authority resolves.
3. Brain Doctor must not silently rewrite project truth.
4. Errors, Warnings and Info remain distinct.
5. Validation profiles balance speed and depth.
6. Duplicate stable IDs are always invalid.
7. Required schema fields are enforceable.
8. Authority links are validated explicitly.
9. Supersession must remain coherent and non-circular.
10. Generated content must identify ownership.
11. Derived output drift must be detectable where practical.
12. Active Work and Handoff health are validation concerns.
13. Validated project learning requires evidence.
14. Active Workarounds require removal conditions.
15. Proposed decisions must not masquerade as accepted authority.
16. Requirements should become increasingly traceable as production approaches.
17. Test definitions are not execution evidence.
18. Historical records remain valid history without becoming current authority.
19. Inbox staleness is surfaced.
20. Likely duplicate logical records should be reviewable.
21. Canonical repository paths should be valid and portable.
22. Secrets in Brain content are unacceptable.
23. Unapproved plugin dependency is detectable.
24. Waivers are explicit, scoped and reviewable.
25. Waivers do not equal fixes.
26. Safe deterministic autofix is allowed.
27. Semantic/autonomous truth-changing autofix is prohibited.
28. Diagnostics should be concise and actionable.
29. Brain Doctor should support human and machine-readable output.
30. Certification cannot be achieved by hiding failures.
31. Brain Doctor itself is governed production tooling.
32. Validation rules require regression coverage where practical.
33. Fast checks should be easy enough for routine use.
34. Strict checks should exist for major gates.
35. The Brain is not considered healthy merely because Obsidian opens without errors.

---

## 121. Status

This document establishes the Brain Doctor & Validation Standard for Leyforge Brain v0.1.

It has been reconciled with automation, ingestion, pilot/certification requirements, Branch B engineering-governance boundaries and the defined future Branch C/D gate integrations.

This document is **LOCKED as the controlling Brain authority for health validation, diagnostics, integrity checks and Brain certification**.
