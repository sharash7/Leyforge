# LEYFORGE PROJECT BRAIN
## Note-Type Taxonomy & Information Model

**Document ID:** LF-BRAIN-03  
**Version:** v0.1  
**Status:** LOCKED — Branch A Design v0.1 — Ready for Pre-Production Implementation  
**Branch:** A — Leyforge Project Brain / Obsidian  
**Parent:** LF-BRAIN-01 — Project Brain Architecture & Governance Specification  
**Related:** LF-BRAIN-02 — Authority & Truth Resolution Model  
**Purpose:** Define the canonical classes of records that may exist in the Leyforge Project Brain, their responsibilities, boundaries, and rules preventing duplication, over-classification and note-type drift.

---

## 1. Purpose

The Leyforge Project Brain requires a controlled information model.

Without a defined taxonomy, the vault would gradually accumulate overlapping concepts such as system notes, feature notes, implementation notes, architecture notes, design notes, reference notes, task notes, decision notes, lesson notes, research notes and miscellaneous notes.

That would undermine search quality, automation, agent retrieval, schema validation, authority resolution, traceability and long-term maintainability.

The guiding principle is:

> **Create a new note type only when the information has materially different behaviour, authority, lifecycle, validation or relationships.**

A different topic does not automatically justify a different note type.

---

## 2. Core Taxonomy Principle

Brain note types SHALL describe the **role a record plays in project knowledge**, not merely its subject.

For example, Settlement may be represented by:

- a System record;
- one or more Entity records;
- Requirements;
- Architecture records;
- Implementation Module records;
- Tests;
- Evidence;
- Work Records;
- ADRs.

The word `Settlement` does not imply a dedicated `settlement_note` type.

Likewise, Material, Realm, Species, Structure and Technology are project-domain subjects. They may share the common **Entity** information model with domain-specific classifications.

This prevents the Brain schema from becoming a separate note type for every Leyforge concept.

---

## 3. Top-Level Information Families

Brain v0.1 SHALL organise records into these top-level information families:

1. Control & Navigation
2. Project-Domain Knowledge
3. Authority & Documentation
4. Requirements & Architecture
5. Implementation
6. Decisions
7. Work & Handoff
8. Project Learning
9. Research & Experimentation
10. Testing & Evidence
11. Risk, Conflict & Audit
12. Generated & Derived Records
13. Temporary Intake

These families organise responsibilities. They do not automatically require separate folders for every type; physical layout is governed later by LF-BRAIN-05.

---

# PART I — CONTROL & NAVIGATION

## 4. HOME Record

**Type:** `home`  
**ID:** fixed or reserved; no sequence required  
**Purpose:** Human and agent entry point into the Brain.

`HOME.md` SHALL provide access to project status, current handoff, major indexes, active work, risks, conflicts, decisions, Skills, audit state and Brain health.

HOME is navigational and derived from authoritative records. It SHALL NOT become a second source of project truth.

---

## 5. Index Record

**Type:** `index`  
**Suggested ID family:** `IDX-` where stable identity is useful

An Index is a curated navigation map over a defined information domain.

Examples include Canon Index, Systems Index, Architecture Index, Document Index, Decision Index, Skills Index, Testing Index and Research Index.

Indexes may be manually curated, partly generated, Base-backed or hybrid.

An Index SHALL primarily answer:

> "Where do I go next?"

It should not duplicate the full content of indexed records.

---

## 6. Dashboard Record

**Type:** `dashboard`  
**Suggested ID family:** `DASH-` only if a permanent stable identity is useful

A Dashboard is a derived operational view.

Examples include Current Work, Project State, Brain Health, Audit Status, Open Risks, Unresolved Conflicts and Production Gate Status.

Dashboards SHALL be considered **derived information**. They do not independently own the facts they display.

---

# PART II — PROJECT-DOMAIN KNOWLEDGE

## 7. System Record

**Type:** `system`  
**ID family:** `SYS-`

A System record represents a coherent Leyforge capability, ruleset or interacting gameplay/technical domain.

Examples:

```text
SYS-SETTLEMENT
SYS-ECONOMY
SYS-INVENTORY
SYS-WORLDGEN
SYS-MAGIC
SYS-SAVE
```

A System record exists when the subject has meaningful requirements, dependencies, architecture, implementation, tests, authority and lifecycle.

System records should primarily describe system identity, scope, authority pointers, dependencies, relationships, implementation ownership, tests, decisions, risks and learned knowledge.

A System record SHALL NOT become a giant restatement of all design documentation.

---

## 8. Entity Record

**Type:** `entity`  
**ID family:** preferably the canonical project-domain stable identity when one already exists; otherwise an approved `ENT-` identity may be used

An Entity record represents a specific persistent project concept.

Examples include Realm, Material, Item, Block, Species, Ancestry, Culture, Government form, Structure family, Site, Creature family, Technology, Spell, Resource, Machine and Settlement archetype.

Rather than create separate Brain note types such as `material`, `species`, `realm`, `structure` and `culture`, these shall generally be represented as:

```yaml
type: entity
entity_class: material
```

or:

```yaml
type: entity
entity_class: realm
```

This gives Leyforge a consistent entity graph while retaining domain identity.

---

## 9. Entity Class

`entity_class` SHALL be a controlled classification vocabulary.

Initial classes may include:

```text
realm
region
biome
material
resource
block
item
recipe
species
creature_family
ancestry
culture
government
settlement_archetype
structure
site
dungeon
technology
machine
tool
weapon
armour
spell
ability
hazard
crop
flora
fungus
faction
organisation
```

The exact list may expand as required.

Expansion of `entity_class` does **not** require creation of new Brain note types.

---

## 10. Concept Record

**Type:** `concept`  
**ID family:** `CONCEPT-` only when needed

A Concept record represents an important abstract project idea that does not qualify as a System or Entity.

Examples include Single Definition Rule, Capability-Based Processing, Persistent World Consequence, Personhood Classification and Near/Far Simulation.

Concept records should be used sparingly.

If a concept is actually a formal rule, it may instead belong in a governing Document, Decision or Requirement.

---

# PART III — AUTHORITY & DOCUMENTATION

## 11. Document Record / Document Proxy

**Type:** `document`  
**ID family:** `DOC-`

A Document record represents an authoritative or historically relevant Leyforge document without duplicating the document itself.

It acts as a Brain proxy for document identity, title, family, version, authority status, canonical location, supersession, related systems, affected entities, implementation links and audit state.

The underlying Markdown, PDF or other file remains the source document.

The Brain Document record provides graph connectivity and authority metadata.

---

## 12. Source Record

**Type:** `source`  
**ID family:** `SRC-`

A Source record represents a source that is not itself a Leyforge-controlled project document.

Examples include external technical documentation, academic papers, web articles, repositories, benchmark references, external standards, game-design references and engine documentation.

A Source record records provenance and retrieval details.

It does not become Leyforge authority merely by being referenced.

---

## 13. Requirement Record

**Type:** `requirement`  
**ID family:** `REQ-`

A Requirement record represents a discrete implementation-facing obligation that must be traceable.

Requirements may originate from certified design documents, engineering governance, platform constraints, save contracts, accessibility requirements or production gates.

A Requirement should be created when the obligation is important enough to require independent tracking through implementation and testing.

A Requirement record should normally link:

```text
source authority
→ requirement
→ architecture
→ implementation
→ test
→ evidence
```

Not every sentence in every document should become a Requirement record.

---

## 14. Policy / Rule Representation

The Brain SHALL NOT create a generic `rule` note type by default.

Rules normally belong to authoritative Documents, Requirements, ADRs, Decisions or governance records.

A standalone Concept may represent a widely reused principle when navigation benefits justify it.

This avoids duplicating governance into thousands of tiny rule notes.

---

# PART IV — REQUIREMENTS & ARCHITECTURE

## 15. Architecture Record

**Type:** `architecture`  
**ID family:** `ARCH-`

An Architecture record represents a durable technical design boundary, relationship or structure.

Examples:

```text
ARCH-SAVE-PIPELINE
ARCH-WORLD-STREAMING
ARCH-FORGE-ASSET-PATH
ARCH-REGISTRY-BOUNDARY
```

Architecture records may describe subsystem responsibilities, interfaces, ownership boundaries, data flows, runtime contracts, persistence boundaries and integration relationships.

Architecture records should reference their governing ADRs and engineering standards.

They SHALL NOT silently redefine decisions recorded elsewhere.

---

## 16. Interface / Contract Record

**Type:** `interface`  
**ID family:** `IFACE-`

An Interface record represents an important cross-system or cross-module contract.

Use it when a contract is consumed by multiple systems, independently testable, version-sensitive, integration-critical or important enough to deserve direct traceability.

Minor internal function interfaces do not require Brain records.

---

# PART V — IMPLEMENTATION

## 17. Implementation Module Record

**Type:** `implementation_module`  
**ID family:** `IMPL-`

An Implementation Module record maps Brain knowledge to actual repository implementation.

It may represent a module, plugin, service, subsystem, package, significant directory, runtime component or tooling component.

It should contain repository path, ownership, implemented systems, applicable architecture, governing requirements, relevant tests and current implementation state.

The record SHALL NOT replace source code documentation.

---

## 18. Migration Record

**Type:** `migration`  
**ID family:** `MIG-`

A Migration record represents a controlled transition between versions or authority states.

Examples include save migration, registry migration, schema migration, Brain schema migration, data migration and architecture migration.

A migration is distinct because it has a source state, target state, compatibility constraints, execution procedure, validation and rollback or failure handling.

---

# PART VI — DECISIONS

## 19. Architecture Decision Record

**Type:** `adr`  
**ID family:** `ADR-`

An ADR records a significant technical or architectural decision.

An ADR should be used for decisions that are expensive to reverse, cross-system, architecture-defining, save-format affecting, security relevant, performance critical or likely to be questioned again.

Each ADR SHALL preserve context, considered options where useful, decision, rationale, consequences, status and supersession.

---

## 20. Decision Record

**Type:** `decision`  
**ID family:** `DEC-`

A Decision record captures a consequential project decision that does not require a full ADR.

The distinction is:

```text
ADR
= significant architecture / engineering decision

DEC
= consequential decision that deserves persistence
```

Minor routine choices do not require records.

---

# PART VII — WORK & HANDOFF

## 21. Work Record

**Type:** `work`  
**ID family:** `WORK-YYYYMMDD-NNN`

A Work Record represents a meaningful unit of completed, active or blocked project work.

It records objective, authority consulted, affected systems, changes, decisions, tests, discoveries, failures, unresolved issues and next action.

Work Records SHALL describe meaningful outcomes rather than activity exhaust.

---

## 22. Work Item

**Type:** `work_item`  
**ID family:** `TASK-` only where independent tracking is justified

A Work Item represents a discrete planned piece of work.

Use only where the work deserves tracking independently of a roadmap or Work Record.

The Brain SHALL avoid turning every trivial TODO into a formal Work Item.

Small TODOs may remain in the relevant Work Record, Handoff or roadmap.

---

## 23. Handoff Record

**Type:** `handoff`  
**ID:** `CURRENT-HANDOFF` for the active handoff; archived handoffs may use `HANDOFF-YYYYMMDD-NNN`

The Handoff record preserves enough current state for another human or agent to continue work.

It should include current objective, last completed state, active files/systems, relevant authority, open blockers, risks and next recommended action.

The active Handoff is operational state, not project canon.

---

# PART VIII — PROJECT LEARNING

## 24. Skill Record

**Type:** `skill`  
**ID family:** `SKILL-`

A Skill is a reusable problem-solving technique discovered through Leyforge work.

It answers:

> "How do we solve this class of problem effectively?"

It should record problem, technique, conditions, evidence, maturity, reuse history and related systems.

---

## 25. Procedure Record

**Type:** `procedure`  
**ID family:** `PROC-`

A Procedure is a prescribed repeatable workflow.

A Procedure differs from a Skill:

```text
Skill
= reusable know-how

Procedure
= required or recommended sequence of actions
```

---

## 26. Pattern Record

**Type:** `pattern`  
**ID family:** `PATTERN-`

A Pattern describes a solution structure that repeatedly works.

It may be broader and less procedural than a Skill.

---

## 27. Antipattern Record

**Type:** `antipattern`  
**ID family:** `ANTI-`

An Antipattern describes an approach that appears attractive but repeatedly causes problems.

It should capture the tempting approach, failure mode, evidence, safer alternative and affected contexts.

---

## 28. Shortcut Record

**Type:** `shortcut`  
**ID family:** `SHORT-`

A Shortcut is a faster route that remains safe within defined constraints.

It SHALL identify when it is safe, when it is unsafe, evidence and fallback procedure.

A shortcut is not permission to bypass governance.

---

## 29. Lesson Record

**Type:** `lesson`  
**ID family:** `LESSON-`

A Lesson is a useful finding that does not yet justify a Skill, Pattern or Procedure.

Lessons may later be promoted, merged, deprecated or archived.

---

## 30. Failure Record

**Type:** `failure`  
**ID family:** `FAIL-`

A Failure record preserves an unsuccessful experiment, implementation approach or project method worth remembering.

It should answer what was attempted, why, what happened, why it failed, what evidence exists and whether retry conditions exist.

---

## 31. Workaround Record

**Type:** `workaround`  
**ID family:** `WORKAROUND-`

A Workaround is an intentionally temporary or constrained solution.

It MUST identify root problem, workaround, limitations, risks, expiry/removal condition and preferred permanent solution where known.

Workarounds should not silently become permanent architecture.

---

## 32. Tooling Discovery and Benchmark Lesson Representation

Tooling discoveries SHALL normally use:

```text
type: lesson
lesson_class: tooling
```

or:

```text
type: skill
skill_class: tooling
```

depending on maturity.

Benchmark lessons SHALL normally be represented as a Lesson or Skill linked to Benchmark evidence.

Separate `tooling_discovery` and `benchmark_lesson` note types are unnecessary for Brain v0.1.

---

# PART IX — RESEARCH & EXPERIMENTATION

## 33. Research Record

**Type:** `research`  
**ID family:** `RESEARCH-`

A Research record represents a defined investigation.

It may include question, scope, sources, findings, limitations, implications, recommendations and promotion status.

Research does not become project authority without an authorised decision or amendment.

---

## 34. Finding Record

**Type:** `finding`  
**ID family:** `FINDING-` only when independent reuse is justified

A Finding is a discrete conclusion supported by research or experimentation.

Most small findings should remain inside their Research record.

Create a standalone Finding only when it affects multiple systems, requires independent traceability, is referenced repeatedly or may be promoted into project knowledge.

---

## 35. Experiment Record

**Type:** `experiment`  
**ID family:** `EXP-`

An Experiment records an empirical trial designed to test a hypothesis or technical approach.

It should include hypothesis, setup, method, variables, result, evidence, interpretation and follow-up.

An Experiment may produce Benchmark, Evidence, Skill, Failure or ADR input.

---

# PART X — TESTING & EVIDENCE

## 36. Test Record

**Type:** `test`  
**ID family:** `TEST-`

A Test record represents a defined validation procedure or automated/manual test identity.

It should identify requirements, implementation target, method, expected result and execution environment where relevant.

A Test record is the definition of the test.

Its executions/results may be represented through Evidence.

---

## 37. Evidence Record

**Type:** `evidence`  
**ID family:** `EVID-`

Evidence records a specific observed result.

Examples include test run, screenshot, profiler capture, build output, crash reproduction, manual acceptance result and diagnostic report.

Evidence should record the conditions under which the observation was made.

Evidence does not independently define requirements.

---

## 38. Benchmark Record

**Type:** `benchmark`  
**ID family:** `BENCH-`

A Benchmark is a specialised Evidence record with performance-focused structure.

It should capture build/commit, hardware, renderer/platform, configuration, workload, sample count, metrics, target, result and historical/current status.

Benchmarks SHALL be retained historically when superseded.

---

## 39. Bug Record

**Type:** `bug`  
**ID family:** `BUG-`

A Bug record represents an observed defect or discrepancy requiring tracking.

It should connect requirement, implementation, reproduction, evidence, severity, status, fix and regression test.

Not every transient development error requires a permanent Bug record.

---

# PART XI — RISK, CONFLICT & AUDIT

## 40. Risk Record

**Type:** `risk`  
**ID family:** `RISK-`

A Risk represents an uncertain future condition that could negatively affect Leyforge.

A Risk should record description, likelihood, impact, owner, mitigation, trigger and status.

A current defect is not a Risk; it is usually a Bug, Conflict or Work Item.

---

## 41. Conflict Record

**Type:** `conflict`  
**ID family:** `CONFLICT-`

Defined by LF-BRAIN-02.

A Conflict represents contradictory or unresolved authority claims.

It SHALL NOT be replaced by a generic `issue` note.

---

## 42. Audit Record

**Type:** `audit`  
**ID family:** `AUDIT-`

An Audit record represents an auditable validation or certification item.

Examples include document completeness, authority classification, registry reconciliation, V1 certification, traceability coverage and Brain health certification.

Branch C will define the V1 audit process.

Branch A defines how audit records are represented inside the Brain.

---

## 43. Exception / Deviation Record

**Type:** `deviation`  
**ID family:** `DEV-`

A Deviation record represents an approved temporary departure from a governing rule or requirement.

It should identify governing authority, deviation, justification, owner, risk, expiry and remediation.

This type exists because approved exceptions have a distinct lifecycle from ordinary Bugs or Workarounds.

---

# PART XII — GENERATED, DERIVED & TEMPORARY INFORMATION

## 44. Generated Record

`generated` SHALL normally be an **information class**, not a note type.

Example:

```yaml
type: dashboard
information_class: generated
generator: brain-build-indexes
```

The semantic type describes what the record does.

The information class describes how it was produced.

---

## 45. Derived Record

`derived` SHALL likewise be an information class rather than a standalone type.

Example:

```yaml
type: dashboard
information_class: derived
```

---

## 46. Inbox Record

**Type:** `inbox`  
**ID:** optional until promoted

The Inbox is a temporary intake mechanism.

Inbox records may contain unclassified discoveries, possible Skills, unresolved research thoughts, notes requiring routing or agent-captured observations.

Inbox records SHALL NOT be considered authoritative.

Every Inbox record should eventually be promoted, merged, rejected, archived or deleted if truly disposable.

Brain Doctor should flag stale Inbox entries.

---

# PART XIII — RELATIONSHIP MODEL

## 47. Relationships Matter More Than Folder Location

The Brain graph SHALL primarily depend on explicit relationships.

Common relationships include:

```text
authority_for
source_of_truth
depends_on
used_by
implements
implemented_by
tests
tested_by
evidence_for
decision_for
affected_by
supersedes
superseded_by
amends
amended_by
derived_from
generated_from
discovered_in
validated_by
related_to
blocked_by
mitigates
conflicts_with
```

The Brain Schema will define which relationships are valid for each type.

---

## 48. Directional Relationships

Where a relationship has meaningful direction, the direction SHALL be explicit.

Example:

```text
SYS-ECONOMY
depends_on → SYS-INVENTORY
```

is different from:

```text
SYS-INVENTORY
used_by → SYS-ECONOMY
```

Where practical, Brain Doctor may verify reciprocal relationship consistency.

---

## 49. Avoid Generic `related_to` Overuse

`related_to` is permitted as a fallback but SHALL NOT replace meaningful typed relationships where one exists.

Bad:

```yaml
related_to:
  - SYS-SAVE
  - TEST-0092
  - ADR-0014
```

Better:

```yaml
depends_on:
  - SYS-SAVE

tests:
  - TEST-0092

decisions:
  - ADR-0014
```

Typed relationships improve retrieval and validation.

---

# PART XIV — NOTE CREATION RULES

## 50. Creation Threshold

A new formal Brain note should be created only when at least one of the following is true:

- it requires independent lifecycle tracking;
- it has its own stable identity;
- it is referenced by multiple other records;
- it has distinct authority;
- it requires independent testing or evidence;
- it has meaningful supersession history;
- it is likely to be retrieved independently;
- it would otherwise cause duplication inside multiple notes.

If none apply, the information should remain inside its parent record.

---

## 51. One Concept, One Primary Record

The Brain SHALL follow a single-primary-record rule.

A significant concept should have one canonical Brain record for each semantic role.

For example, `SYS-SETTLEMENT` should not coexist with `SYS-SETTLEMENT-SYSTEM`, `FEATURE-SETTLEMENT`, `SETTLEMENT-MASTER` and `SETTLEMENT-OVERVIEW` unless those records have explicitly different semantic roles.

---

## 52. Folder and Title Independence

A note's semantic type SHALL come from metadata, not solely from its folder.

Moving a note between valid folders must not change what it is.

Likewise, a filename or title SHALL NOT be used as the sole determinant of record type.

---

# PART XV — TYPES EXPLICITLY NOT CREATED IN V0.1

## 53. Rejected Generic Types

The following generic types SHALL NOT be introduced in Brain v0.1 unless later justified:

```text
note
reference
misc
info
master
overview
feature
topic
page
general
knowledge
resource
```

These names are too ambiguous to support reliable automation.

---

## 54. Rejected Domain-Specific Note-Type Explosion

Brain v0.1 SHALL NOT create independent top-level note types for every content class.

Examples that normally remain Entity classes:

```text
realm
material
species
structure
item
block
culture
technology
government
creature
machine
weapon
spell
```

Use:

```yaml
type: entity
entity_class: material
```

instead.

---

## 55. Rejected Activity-Exhaust Types

The Brain SHALL NOT create permanent note types for command run, file opened, line edited, thought, message, chat turn, prompt, keystroke or routine code edit.

Meaningful results belong in Work Records, Decisions, Evidence or learned-knowledge records.

---

# PART XVI — CANONICAL V0.1 TYPE REGISTER

## 56. Canonical Note Types

The initial canonical Brain v0.1 note-type register is:

```text
home
index
dashboard

system
entity
concept

document
source
requirement

architecture
interface

implementation_module
migration

adr
decision

work
work_item
handoff

skill
procedure
pattern
antipattern
shortcut
lesson
failure
workaround

research
finding
experiment

test
evidence
benchmark
bug

risk
conflict
audit
deviation

inbox
```

Total initial semantic types: **38**

This is intentionally broad enough to support the complete project while remaining small enough to validate and understand.

---

## 57. Information Classes

All applicable note types may additionally use one of these information classes:

```text
authored
generated
derived
temporary
```

These are not substitutes for semantic type.

---

## 58. Domain Classification

Where useful, records may use controlled secondary classification fields such as:

```text
entity_class
system_class
architecture_class
source_class
requirement_class
skill_class
research_class
test_class
risk_class
audit_class
```

Secondary classifications should be preferred over new top-level types.

---

# PART XVII — TRACEABILITY EXPECTATIONS

## 59. Minimum Traceability Philosophy

Not every note requires every relationship.

However:

**Systems** should usually link to authority, requirements, architecture, implementation, tests and decisions.

**Entities** should usually link to authority, systems, registries where relevant and implementation where relevant.

**Requirements** should usually link to source authority, implementation and tests.

**Architecture** should usually link to requirements, ADRs, implementation modules and interfaces.

**Implementation Modules** should usually link to systems, architecture and tests.

**Tests** should usually link to requirements, implementation target and evidence.

**Skills** should usually link to work records, evidence and reuse history.

**Conflicts** should usually link to conflicting sources, affected systems and resolution owner.

These rules will be made machine-validatable in LF-BRAIN-04 and LF-BRAIN-10.

---

# PART XVIII — AGENT BEHAVIOUR

## 60. Type Selection Rule for Agents

When creating a Brain record, an agent SHALL:

1. identify the information's semantic role;
2. check whether an existing record already owns that role;
3. select an existing canonical type;
4. use secondary classification if needed;
5. create a new type only through a governed Brain-schema amendment.

Agents SHALL NOT invent ad hoc note types during ordinary work.

---

## 61. Promotion Rule

Temporary information may be promoted.

Examples:

```text
Inbox
→ Lesson
→ Skill
```

or:

```text
Research
→ Finding
→ Decision
→ Requirement
```

Promotion changes semantic role and may require creation of a new formal record.

The original provenance should remain linked.

---

## 62. Demotion / Retirement Rule

Formal records may become deprecated, superseded, rejected or archived.

They should not normally be transformed into ambiguous miscellaneous notes.

---

# PART XIX — SCHEMA CONSEQUENCES

## 63. Relationship to LF-BRAIN-04

LF-BRAIN-04 — Brain Schema & Metadata Standard SHALL convert this taxonomy into:

- required fields;
- optional fields;
- allowed statuses;
- allowed information classes;
- allowed secondary classifications;
- relationship constraints;
- validation rules;
- stable ID formats;
- schema versioning.

LF-BRAIN-03 defines **what records exist**.

LF-BRAIN-04 defines **what fields those records must contain**.

---

## 64. Initial Taxonomy Laws

The following laws are provisionally established:

1. Note types describe semantic role, not topic.
2. Domain concepts should usually be Entity classes rather than new note types.
3. New note types require materially different lifecycle, authority, behaviour or validation.
4. Secondary classifications are preferred over type proliferation.
5. One significant concept should have one primary Brain record per semantic role.
6. Folders do not define note type.
7. Filenames do not define note type.
8. Generated, derived and temporary are information classes, not semantic types.
9. Generic types such as `misc`, `reference` and `note` are prohibited.
10. Activity exhaust does not belong in permanent Brain records.
11. Significant work belongs in Work Records.
12. Significant technical choices belong in ADRs or Decisions.
13. Reusable know-how belongs in the project-learning family.
14. External material belongs in Source/Research records and is not automatically authoritative.
15. Tests define validation procedures; Evidence records define specific observed results.
16. Benchmarks remain distinct because performance evidence has specialised metadata and historical value.
17. Conflicts are first-class records and must not be hidden inside generic issue notes.
18. Approved deviations are distinct from Bugs and Workarounds.
19. Temporary Inbox material must have a promotion or disposal lifecycle.
20. Agents may not invent ad hoc semantic types without schema governance.

---

## 65. Status

This document defines the canonical note taxonomy and information model for Leyforge Brain v0.1.

The register has been reconciled against the metadata schema, vault architecture, agent contract and Brain Doctor rules. The canonical v0.1 register contains **38 semantic record types**.

This document is **LOCKED as the controlling authority for semantic record types within the Leyforge Project Brain**.
