# LEYFORGE PROJECT BRAIN
## Brain Schema & Metadata Standard

**Document ID:** LF-BRAIN-04  
**Version:** v0.1  
**Status:** LOCKED — Branch A Design v0.1 — Ready for Pre-Production Implementation  
**Branch:** A — Leyforge Project Brain / Obsidian  
**Parent:** LF-BRAIN-01 — Project Brain Architecture & Governance Specification  
**Related:**  
- LF-BRAIN-02 — Authority & Truth Resolution Model  
- LF-BRAIN-03 — Note-Type Taxonomy & Information Model  

**Purpose:** Define the canonical metadata schema, stable identity rules, status vocabularies, relationship fields, provenance model, timestamp rules, schema-versioning model and validation expectations for formal Leyforge Project Brain records.

---

## 1. Purpose

The Leyforge Project Brain SHALL be machine-readable as well as human-readable.

Markdown bodies remain important for explanation, rationale and context. However, critical Brain structure must not depend on natural-language interpretation alone.

Formal Brain records therefore use controlled metadata so that humans, Obsidian, Codex, Brain Doctor and future automation can reliably determine:

- what a record is;
- its stable identity;
- its lifecycle state;
- its authority state;
- what it depends on;
- what it implements;
- what tests it;
- what evidence supports it;
- what supersedes it;
- where it came from;
- when it changed;
- whether it is generated or authored;
- whether it is current or historical.

This document defines the initial Brain Schema v1.

---

## 2. Schema Philosophy

The Brain Schema SHALL be:

1. stable;
2. explicit;
3. typed;
4. human-readable;
5. machine-validatable;
6. versioned;
7. extensible without uncontrolled drift;
8. independent of folder location;
9. independent of filename;
10. portable outside Obsidian.

The schema SHALL prefer a small number of reusable common fields plus controlled type-specific extensions.

---

## 3. Schema Version

All formal Brain records SHALL declare:

```yaml
brain_schema: 1
```

The integer identifies the metadata contract used by the record.

Schema changes SHALL be classified as either:

### Compatible extension
Adds optional fields or allowed values without breaking existing valid records.

### Migration-required change
Changes semantics, required fields, field names, ID rules or validation behaviour.

Migration-required changes SHALL increment the schema version.

Example:

```text
Brain Schema 1
      ↓
MIG-BRAIN-SCHEMA-0001
      ↓
Brain Schema 2
```

---

## 4. YAML Frontmatter

Formal Brain records SHALL use YAML frontmatter.

Example:

```yaml
---
brain_schema: 1
id: SYS-SETTLEMENT
type: system
title: Settlement System
status: active
information_class: authored
created: 2026-08-29
updated: 2026-08-29
---
```

Metadata SHALL remain concise enough to be readable by humans.

Detailed reasoning belongs in the Markdown body rather than being forced into YAML.

---

# PART I — UNIVERSAL CORE FIELDS

## 5. Required Universal Fields

Unless explicitly exempted by note type, every formal Brain record SHALL contain:

```yaml
brain_schema:
id:
type:
title:
status:
information_class:
created:
updated:
```

These fields form the universal Brain identity layer.

---

## 6. `brain_schema`

**Type:** integer  
**Required:** yes  
**Initial value:** `1`

Defines the metadata schema version.

---

## 7. `id`

**Type:** string  
**Required:** yes for formal records  
**Must be unique:** yes  
**Mutable:** no

The ID is the immutable persistent Brain identity.

Example:

```yaml
id: ADR-0014
```

Changing the title, filename or folder SHALL NOT change the ID.

---

## 8. `type`

**Type:** controlled string  
**Required:** yes  
**Mutable:** only through governed semantic migration

Allowed values are defined by LF-BRAIN-03.

Initial values:

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

Agents SHALL NOT invent new values during normal work.

---

## 9. `title`

**Type:** string  
**Required:** yes  
**Mutable:** yes

Human-readable canonical title of the Brain record.

Example:

```yaml
title: Settlement System
```

The title is presentation identity. The ID remains persistent identity.

---

## 10. `status`

**Type:** controlled string  
**Required:** yes  
**Meaning:** lifecycle state

`status` SHALL represent the record's current lifecycle condition.

The valid values depend on note type.

The schema SHALL reject invalid type/status combinations.

---

## 11. `information_class`

**Type:** controlled string  
**Required:** yes  
**Allowed values:**

```text
authored
generated
derived
temporary
```

### `authored`
Deliberately maintained knowledge.

### `generated`
Produced automatically by a known generator.

### `derived`
Calculated or assembled from other records.

### `temporary`
Not yet promoted into durable formal knowledge.

---

## 12. `created`

**Type:** date  
**Required:** yes  
**Format:** `YYYY-MM-DD`

Represents creation of the logical Brain record.

It SHALL NOT be replaced when the file is moved or renamed.

---

## 13. `updated`

**Type:** date  
**Required:** yes  
**Format:** `YYYY-MM-DD`

Represents the last material update to the logical record.

Minor formatting changes need not update this value if project tooling later distinguishes material and non-material edits.

---

# PART II — COMMON OPTIONAL FIELDS

## 14. `summary`

**Type:** short string  
**Required:** no

A concise human-readable description.

Example:

```yaml
summary: Governs persistent settlement identity, capability, population and construction relationships.
```

The summary SHALL not replace authoritative detail.

---

## 15. `aliases`

**Type:** list of strings  
**Required:** no

Used for alternate names, historical names or common search terms.

Aliases do not create new identities.

---

## 16. `tags`

**Type:** list of strings  
**Required:** no

Tags SHALL be secondary navigation aids.

Tags SHALL NOT replace typed fields or authority metadata.

Avoid tag soup.

---

## 17. `owner`

**Type:** string or stable ID reference  
**Required:** conditional

Identifies a responsible project, governance or implementation owner where useful.

A personal name is not required unless later governance specifically needs one.

---

## 18. `scope`

**Type:** string or list  
**Required:** conditional

Defines the bounded subject covered by the record.

Especially useful for authority, ADR, architecture, requirement, audit, deviation and conflict records.

---

# PART III — AUTHORITY METADATA

## 19. `authority_domain`

**Type:** list of controlled strings  
**Required:** conditional

Initial authority domains:

```text
project_control
content_canon
requirements
engineering_governance
architecture
registry
implementation_state
testing_evidence
research
brain_operations
production
audit
```

The list may expand through governed schema amendment.

---

## 20. `authority_role`

**Type:** controlled string  
**Required:** when a record participates directly in authority resolution

Allowed values:

```text
primary
delegated
supporting
implementation_record
evidence_record
derived_record
historical_record
provisional_record
none
```

---

## 21. `authority_status`

**Type:** controlled string  
**Required:** conditional

Initial vocabulary:

```text
draft
proposed
theoretically_locked
authoritative
certified
superseded
retired
historical
rejected
unresolved
not_applicable
```

`authority_status` is distinct from lifecycle `status`.

Example:

```yaml
status: active
authority_status: certified
```

---

## 22. `source_of_truth`

**Type:** list of stable ID references  
**Required:** for proxy/derived records where authority exists elsewhere

Example:

```yaml
source_of_truth:
  - DOC-FCC-12
  - DOC-SET-25
```

This field identifies controlling authorities.

It SHALL NOT be used loosely for merely related documents.

---

## 23. `authority_scope`

**Type:** short string or structured list  
**Required:** conditional

Describes exactly what authority is claimed.

This helps prevent overlapping authority claims.

---

# PART IV — RELATIONSHIP METADATA

## 24. Relationship Field Rule

Relationships SHOULD use stable Brain IDs rather than filenames.

Preferred:

```yaml
depends_on:
  - SYS-INVENTORY
```

Avoid:

```yaml
depends_on:
  - Inventory System.md
```

This preserves graph continuity across renames.

---

## 25. Core Relationship Fields

The schema SHALL support at least:

```text
depends_on
used_by
implements
implemented_by
requirements
architecture
interfaces
tests
tested_by
evidence
evidence_for
decisions
decision_for
risks
blocked_by
mitigates
conflicts_with
related_to
derived_from
generated_from
discovered_in
validated_by
```

Not every type may use every field.

Brain Doctor SHALL eventually validate allowed combinations.

---

## 26. Authority-Lineage Fields

The schema SHALL support:

```text
supersedes
superseded_by
amends
amended_by
consolidates
consolidated_into
retires
retired_by
```

All values SHALL reference stable IDs where applicable.

---

## 27. Reciprocal Relationship Policy

Some relationships SHOULD be reciprocal.

Example:

```text
SYS-ECONOMY depends_on SYS-INVENTORY
SYS-INVENTORY used_by SYS-ECONOMY
```

Brain Doctor may validate reciprocal consistency.

Reciprocity is not required for every relationship if it would create unnecessary maintenance cost.

The exact reciprocal set SHALL be defined by validation rules.

---

# PART V — PROVENANCE & EVIDENCE

## 28. `created_from`

**Type:** list of stable IDs or source references  
**Required:** conditional

Identifies immediate provenance.

---

## 29. `discovered_in`

**Type:** list of Work, Experiment or Research IDs  
**Required:** strongly recommended for learned knowledge

Example:

```yaml
discovered_in:
  - WORK-20260828-004
```

---

## 30. `validated_by`

**Type:** list of Test, Evidence or Benchmark IDs  
**Required:** conditional

Example:

```yaml
validated_by:
  - TEST-0044
  - EVID-0201
```

---

## 31. `evidence`

**Type:** list of Evidence IDs  
**Required:** conditional

A record may link direct supporting evidence.

Evidence SHALL remain independently inspectable where material.

---

## 32. `confidence`

**Type:** controlled string  
**Required:** optional

Allowed initial values:

```text
low
medium
high
confirmed
```

`confidence` is useful for provisional knowledge, research and findings.

It SHALL NOT override formal authority status.

A high-confidence research finding is still not automatically canon.

---

# PART VI — GENERATION METADATA

## 33. Generated Records

Records with:

```yaml
information_class: generated
```

SHALL contain:

```yaml
generator:
generation_version:
generated_at:
edit_policy:
```

Example:

```yaml
generator: brain-registry-audit
generation_version: 1
generated_at: 2026-08-29T16:00:00+08:00
edit_policy: do_not_edit
```

---

## 34. `generator`

Identifies the script, command or tooling component that owns the record.

---

## 35. `generation_version`

Identifies the generator contract/version.

This allows generated output changes to be traced to tooling changes.

---

## 36. `generated_at`

**Format:** ISO 8601 timestamp

Generated records require more precise timestamps than normal authored records.

---

## 37. `edit_policy`

Allowed initial values:

```text
editable
generated_sections_only
do_not_edit
```

Agents SHALL obey this field.

---

# PART VII — STABLE ID STANDARD

## 38. General ID Rules

Stable IDs SHALL:

- use uppercase ASCII letters, digits and hyphens;
- contain no spaces;
- avoid punctuation other than hyphen;
- remain unique project-wide;
- remain immutable after creation;
- communicate record family;
- avoid embedding mutable titles where sequential IDs are better.

---

## 39. Named Stable IDs

Long-lived systems and architecture may use readable named IDs.

Examples:

```text
SYS-SETTLEMENT
SYS-WORLDGEN
ARCH-SAVE-PIPELINE
IFACE-REGISTRY-READ
```

Named IDs should be used where the concept itself has durable identity.

---

## 40. Sequential Stable IDs

Records with chronological or append-only behaviour should usually use sequential IDs.

Examples:

```text
ADR-0001
DEC-0001
SKILL-0001
RISK-0001
CONFLICT-0001
BUG-0001
AUDIT-0001
```

IDs SHALL use zero-padded sequences.

Initial recommended width:

```text
0001
```

The width may expand beyond 9999 without renumbering earlier records.

---

## 41. Date-Scoped IDs

Work and handoff records may use:

```text
WORK-YYYYMMDD-NNN
HANDOFF-YYYYMMDD-NNN
```

Example:

```text
WORK-20260829-004
```

Daily counters MAY reset each date.

---

## 42. Existing Canonical IDs

Where a Leyforge domain object already possesses a valid canonical stable identity, the Brain SHOULD reuse or reference that identity rather than create a duplicate identity system.

LF-BRAIN-04 does not force duplicate IDs where the project already has authoritative stable identities.

---

## 43. Document IDs

Document proxy IDs should reflect stable logical documents rather than filenames where practical.

Examples:

```text
DOC-FCC-12
DOC-ENG-GOV-03
DOC-LF-BRAIN-04
```

A document version SHOULD normally be metadata, not part of the permanent Brain ID.

Example:

```yaml
id: DOC-LF-BRAIN-04
version: v0.1
```

---

# PART VIII — VERSION & DOCUMENT METADATA

## 44. `version`

**Type:** string  
**Required:** for versioned documents, tools and contracts

Example:

```yaml
version: v0.1
```

---

## 45. `document_family`

**Type:** controlled string  
**Required:** for Document proxies where applicable

Initial examples:

```text
foundation
set
fcc
prd
lfe
forge_eng
eng_gov
brain
audit
roadmap
```

Exact vocabulary SHALL be reconciled with the final project corpus.

---

## 46. `canonical_path`

**Type:** repository-relative path  
**Required:** for Document proxies and Implementation Modules where applicable

Example:

```yaml
canonical_path: docs/FCC/FCC-12.md
```

Absolute machine-specific filesystem paths SHALL NOT be stored as canonical paths.

---

## 47. `content_hash`

**Type:** string  
**Required:** optional but recommended for mirrors and generated ingestion

Used to distinguish logical identity from file copies.

---

# PART IX — STATUS VOCABULARIES

## 48. Navigation & Control Status

Allowed initial values:

```text
active
deprecated
archived
```

Applicable to:

- home;
- index;
- dashboard.

---

## 49. Source Status

Allowed initial values:

```text
active
historical
superseded
unavailable
archived
```

---

## 50. Migration Status

Allowed initial values:

```text
planned
active
complete
failed
rolled_back
superseded
```

---

## 51. Finding Status

Allowed initial values:

```text
candidate
supported
superseded
rejected
archived
```

---

## 52. Evidence & Benchmark Status

Allowed initial values:

```text
active
superseded
historical
invalidated
archived
```

`outcome` remains separate from lifecycle status.

---

## 53. Handoff Status

Allowed initial values:

```text
active
superseded
archived
```

---

## 54. General Project Entity Status

Allowed initial values:

```text
proposed
active
locked
deprecated
superseded
archived
```

Applicable to system, entity, concept, architecture, interface and implementation_module.

---

## 55. Document Status

Allowed initial values:

```text
draft
active
locked
certified
superseded
retired
archived
```

---

## 56. Requirement Status

Allowed initial values:

```text
proposed
active
implemented
verified
deferred
superseded
retired
```

A Requirement may be `implemented` without yet being `verified`.

---

## 57. ADR Status

Allowed initial values:

```text
proposed
experimental
accepted
superseded
rejected
deprecated
```

---

## 58. Decision Status

Allowed initial values:

```text
proposed
accepted
superseded
rejected
```

---

## 59. Work Status

Allowed initial values:

```text
planned
active
blocked
complete
cancelled
```

---

## 60. Learned-Knowledge Status

Allowed initial values:

```text
candidate
testing
validated
deprecated
rejected
archived
```

Applicable to skill, procedure, pattern, antipattern, shortcut, lesson, failure and workaround.

A Failure may use `validated` to mean the failure mode has been confirmed.

---

## 61. Research Status

Allowed initial values:

```text
planned
active
complete
superseded
archived
```

---

## 62. Experiment Status

Allowed initial values:

```text
planned
running
complete
failed
cancelled
```

`failed` here means the experiment execution failed, not that the hypothesis was disproven.

---

## 63. Test Status

Allowed initial values:

```text
draft
active
deprecated
superseded
```

Test execution outcome belongs in Evidence, not Test definition status.

---

## 64. Evidence Outcome

Evidence records SHOULD include:

```yaml
outcome:
```

Allowed initial values:

```text
pass
fail
inconclusive
observed
not_applicable
```

---

## 65. Bug Status

Allowed initial values:

```text
open
triaged
in_progress
fixed
verified
deferred
wont_fix
duplicate
```

---

## 66. Risk Status

Allowed initial values:

```text
identified
active
mitigated
accepted
realised
closed
```

---

## 67. Conflict Status

Allowed values:

```text
detected
investigating
resolved
deferred
```

---

## 68. Audit Status

Allowed initial values:

```text
planned
active
pass
fail
blocked
deferred
certified
superseded
```

---

## 69. Deviation Status

Allowed initial values:

```text
proposed
approved
active
expired
resolved
revoked
```

---

## 70. Inbox Status

Allowed values:

```text
new
reviewing
promoted
merged
rejected
archived
```

---

# PART X — TYPE-SPECIFIC REQUIRED FIELDS

## 71. System

Minimum:

```yaml
id:
type: system
title:
status:
information_class:
created:
updated:
authority_domain:
source_of_truth:
```

Recommended:

```yaml
depends_on:
used_by:
requirements:
architecture:
implemented_by:
tests:
decisions:
risks:
```

---

## 72. Entity

Minimum:

```yaml
id:
type: entity
entity_class:
title:
status:
information_class:
created:
updated:
source_of_truth:
```

Recommended:

```yaml
systems:
registry:
implemented_by:
```

---

## 73. Document

Minimum:

```yaml
id:
type: document
title:
status:
information_class:
created:
updated:
version:
document_family:
canonical_path:
authority_status:
```

Conditional:

```yaml
supersedes:
superseded_by:
amends:
amended_by:
content_hash:
```

---

## 74. Requirement

Minimum:

```yaml
id:
type: requirement
title:
status:
information_class:
created:
updated:
source_of_truth:
authority_domain:
```

Recommended:

```yaml
implements:
tests:
evidence:
```

---

## 75. Architecture

Minimum:

```yaml
id:
type: architecture
title:
status:
information_class:
created:
updated:
authority_domain:
```

Recommended:

```yaml
requirements:
decisions:
interfaces:
implemented_by:
tests:
```

---

## 76. ADR

Minimum:

```yaml
id:
type: adr
title:
status:
information_class: authored
created:
updated:
authority_domain:
```

Recommended:

```yaml
scope:
decision_class:
reconsideration_triggers:
supersedes:
superseded_by:
related_to:
evidence:
```

`decision_class`, where used for engineering ADRs, is governed by Branch B's ADR standard rather than independently enumerated by Branch A.

`reconsideration_triggers` SHALL be populated for temporary or experimental architecture when Branch B requires explicit reconsideration conditions.

The body SHALL contain context, decision, rationale and consequences.

---

## 77. Decision

Minimum:

```yaml
id:
type: decision
title:
status:
information_class: authored
created:
updated:
authority_domain:
```

The body SHALL contain decision and rationale.

---

## 78. Work Record

Minimum:

```yaml
id:
type: work
title:
status:
information_class: authored
created:
updated:
```

Recommended:

```yaml
systems:
authority_consulted:
decisions:
tests:
discoveries:
blocked_by:
```

---

## 79. Handoff

Minimum:

```yaml
id:
type: handoff
title:
status:
information_class: authored
created:
updated:
```

Recommended:

```yaml
current_work:
systems:
authority_consulted:
blocked_by:
risks:
```

---

## 80. Skill

Minimum:

```yaml
id:
type: skill
title:
status:
information_class: authored
created:
updated:
discovered_in:
```

For `validated` Skills:

```yaml
validated_by:
```

SHALL be required.

Recommended:

```yaml
reuse_count:
systems:
related_to:
```

---

## 81. Procedure

Minimum:

```yaml
id:
type: procedure
title:
status:
information_class:
created:
updated:
```

Validated procedures SHOULD link supporting evidence or governing authority.

---

## 82. Failure

Minimum:

```yaml
id:
type: failure
title:
status:
information_class: authored
created:
updated:
discovered_in:
```

Recommended:

```yaml
evidence:
systems:
related_to:
```

---

## 83. Workaround

Minimum:

```yaml
id:
type: workaround
title:
status:
information_class: authored
created:
updated:
```

Required body concepts:

- root problem;
- workaround;
- limitations;
- expiry/removal condition.

---

## 84. Research

Minimum:

```yaml
id:
type: research
title:
status:
information_class: authored
created:
updated:
```

Recommended:

```yaml
sources:
confidence:
findings:
```

---

## 85. Source

Minimum:

```yaml
id:
type: source
title:
status:
information_class: authored
created:
updated:
source_class:
```

Recommended:

```yaml
url:
publisher:
published:
accessed:
```

Where URLs are stored, they remain provenance, not project authority.

---

## 86. Experiment

Minimum:

```yaml
id:
type: experiment
title:
status:
information_class: authored
created:
updated:
```

Recommended:

```yaml
systems:
evidence:
findings:
```

---

## 87. Test

Minimum:

```yaml
id:
type: test
title:
status:
information_class: authored
created:
updated:
```

Recommended:

```yaml
requirements:
implementation:
evidence:
```

---

## 88. Evidence

Minimum:

```yaml
id:
type: evidence
title:
status:
information_class:
created:
updated:
outcome:
```

Recommended:

```yaml
tests:
evidence_for:
build:
commit:
environment:
```

---

## 89. Benchmark

Minimum:

```yaml
id:
type: benchmark
title:
status:
information_class:
created:
updated:
outcome:
```

Recommended:

```yaml
build:
commit:
hardware:
platform:
renderer:
configuration:
sample_count:
metrics:
target:
```

---

## 90. Bug

Minimum:

```yaml
id:
type: bug
title:
status:
information_class: authored
created:
updated:
severity:
```

Recommended:

```yaml
requirements:
implementation:
evidence:
tests:
```

---

## 91. Risk

Minimum:

```yaml
id:
type: risk
title:
status:
information_class: authored
created:
updated:
likelihood:
impact:
```

Recommended:

```yaml
owner:
mitigates:
related_to:
```

---

## 92. Conflict

Minimum:

```yaml
id:
type: conflict
title:
status:
information_class: authored
created:
updated:
severity:
authority_domain:
sources:
```

Recommended:

```yaml
authority_question:
resolution_owner:
systems:
conflicts_with:
```

---

## 93. Audit

Minimum:

```yaml
id:
type: audit
title:
status:
information_class:
created:
updated:
audit_class:
```

Recommended:

```yaml
scope:
source_of_truth:
evidence:
```

---

## 94. Deviation

Minimum:

```yaml
id:
type: deviation
title:
status:
information_class: authored
created:
updated:
source_of_truth:
```

Recommended:

```yaml
owner:
risks:
expires:
remediation:
```

---

## 95. Inbox

Minimum:

```yaml
type: inbox
title:
status:
information_class: temporary
created:
updated:
```

Stable ID is optional until promotion.

---

# PART XI — COMMON SECONDARY CLASSIFICATIONS

## 96. Classification Rule

Secondary classifications SHALL use controlled vocabularies where automation depends on them.

New classifications MAY be added through compatible schema extension when they do not change semantics.

---

## 97. `entity_class`

Initial examples:

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

---

## 98. `source_class`

Initial values:

```text
official_documentation
repository
academic
standard
article
forum
community
benchmark_reference
game_reference
internal_external_copy
other
```

---

## 99. `requirement_class`

Initial values:

```text
functional
nonfunctional
performance
persistence
compatibility
accessibility
security
testing
tooling
production
governance
```

---

## 100. `skill_class`

Initial values:

```text
engineering
reconciliation
testing
research
tooling
automation
documentation
performance
workflow
```

---

## 101. `test_class`

Initial values:

```text
unit
integration
system
regression
acceptance
manual
performance
compatibility
migration
smoke
soak
```

---

## 102. `audit_class`

Initial values:

```text
authority
completeness
consistency
traceability
registry
implementation
testing
brain_health
v1_certification
production_gate
```

---

# PART XII — DATE, TIME & TEMPORAL RULES

## 103. Dates

Dates SHALL use ISO format:

```text
YYYY-MM-DD
```

---

## 104. Timestamps

Where time-of-day matters, timestamps SHALL use ISO 8601 with timezone offset.

Example:

```text
2026-08-29T16:00:00+08:00
```

---

## 105. `effective_from`

Optional date/timestamp indicating when an authority or rule becomes effective.

---

## 106. `effective_until`

Optional date/timestamp indicating a planned or known end of effect.

---

## 107. `expires`

Used for temporary deviations, workarounds or provisional records where an explicit expiry exists.

---

# PART XIII — IMPLEMENTATION & REPOSITORY METADATA

## 108. `repository_path`

**Type:** repository-relative path or list of paths

Example:

```yaml
repository_path:
  - addons/leyforge/worldgen/
```

Machine-specific absolute paths SHALL NOT be used.

---

## 109. `commit`

**Type:** Git commit hash  
**Required:** conditional for Evidence, Benchmark or Work where exact implementation identity matters

---

## 110. `build`

**Type:** string  
**Required:** conditional

May identify a build ID, package version, release candidate or prototype version.

---

## 111. `environment`

**Type:** structured map or string

Used only where environment materially affects evidence.

---

# PART XIV — ARRAY & VALUE RULES

## 112. Lists

Relationship fields SHALL always use YAML lists, even when only one value exists.

Preferred:

```yaml
tests:
  - TEST-0001
```

Avoid:

```yaml
tests: TEST-0001
```

This prevents scalar/list ambiguity.

---

## 113. Empty Fields

Formal records SHOULD omit unused optional fields rather than fill them with `N/A`, `None`, `Unknown` or `-`.

Explicit unknown state should be represented only where semantically meaningful.

Example:

```yaml
authority_status: unresolved
```

---

## 114. Boolean Values

Use YAML booleans:

```yaml
true
false
```

not `yes`, `no`, `Y` or `N` where machine validation is expected.

---

# PART XV — DUPLICATION & NORMALISATION

## 115. Metadata Shall Not Duplicate Long Prose

Do not place entire explanations into frontmatter.

Detailed rationale belongs in the Markdown body.

---

## 116. Body Shall Not Shadow Metadata

Where a formal state exists in metadata, the body SHOULD not maintain a second manual copy that can drift.

Use:

```yaml
status: superseded
```

rather than separately maintaining an unrelated body status label unless that display is generated from metadata.

---

# PART XVI — FILE & TITLE CONVENTIONS

## 117. Filename Philosophy

Filenames SHOULD be human-readable.

Stable identity belongs in metadata.

Recommended examples:

```text
Settlement System.md
Authority & Truth Resolution Model.md
ADR-0014 Save Serialization Boundary.md
```

The exact physical naming convention is governed by LF-BRAIN-05.

---

## 118. ID in Filename

Sequential records MAY include their ID in the filename where useful.

Examples:

```text
ADR-0014 Save Serialization Boundary.md
SKILL-0027 Registry Reconciliation by Identity Projection.md
```

Long-lived entity/system files need not duplicate their stable ID in the filename if navigation remains clear.

---

# PART XVII — MACHINE-READABLE SCHEMAS

## 119. JSON Schema

Brain v0.1 SHOULD include machine-readable schema definitions under a repository location to be established by LF-BRAIN-05.

Candidate structure:

```text
brain/91_SCHEMA/
├── brain.schema.json
├── common.schema.json
├── system.schema.json
├── entity.schema.json
├── document.schema.json
├── requirement.schema.json
├── adr.schema.json
├── work.schema.json
├── skill.schema.json
├── test.schema.json
└── ...
```

The exact file split may be simplified during implementation.

---

## 120. Single Source of Schema Truth

The machine-readable schema and LF-BRAIN-04 MUST remain synchronised.

One SHALL NOT silently evolve without the other.

A future generator MAY produce part of the human-readable schema documentation from machine definitions if that reduces drift.

---

# PART XVIII — VALIDATION LEVELS

## 121. Validation Severity

Brain Doctor should distinguish:

```text
ERROR
WARNING
INFO
```

### ERROR
The Brain record violates a required contract.

Examples:

- duplicate ID;
- missing required field;
- invalid type;
- invalid status;
- malformed date;
- broken required authority pointer.

### WARNING
Potentially problematic but not necessarily invalid.

Examples:

- orphan system;
- stale Inbox note;
- validated Skill with weak evidence;
- one-way relationship where reciprocity is recommended.

### INFO
Useful maintenance notice.

Examples:

- optional metadata missing;
- archived record still heavily referenced;
- classification candidate.

---

# PART XIX — SCHEMA MIGRATION

## 122. Schema Changes

Material schema changes SHALL use a Migration record.

Example:

```text
MIG-BRAIN-0001
Brain Schema 1 → Brain Schema 2
```

The migration SHALL define:

- change;
- reason;
- affected types;
- old fields;
- new fields;
- transformation;
- rollback if relevant;
- validation;
- completion status.

---

## 123. No Silent Mass Mutation

Agents SHALL NOT mass-rewrite Brain metadata to a new convention without:

- an approved schema change;
- migration definition;
- validation;
- Work Record.

---

# PART XX — DEFAULT FORMAL RECORD EXAMPLE

## 124. System Example

```yaml
---
brain_schema: 1

id: SYS-SETTLEMENT
type: system
title: Settlement System

status: active
information_class: authored

created: 2026-08-29
updated: 2026-08-29

authority_domain:
  - content_canon
  - requirements

authority_role: derived_record
authority_status: not_applicable

source_of_truth:
  - DOC-FCC-01
  - DOC-SET-24

depends_on:
  - SYS-NPC
  - SYS-INVENTORY

used_by:
  - SYS-CIVILISATION

requirements:
  - REQ-SETTLEMENT-001

architecture:
  - ARCH-SETTLEMENT-RUNTIME

implemented_by:
  - IMPL-SETTLEMENT

tests:
  - TEST-SETTLEMENT-001

decisions:
  - ADR-0012
---
```

The body then provides concise system context and navigation without duplicating the authoritative documents.

---

# PART XXI — AGENT METADATA BEHAVIOUR

## 125. Agent Creation Rule

When creating a formal record, an agent SHALL:

1. select an approved note type;
2. generate a valid stable ID;
3. apply Brain Schema version;
4. populate required universal fields;
5. populate type-required fields;
6. add meaningful typed relationships;
7. avoid speculative authority;
8. run schema validation before completion.

---

## 126. Agent Update Rule

When materially updating a formal record, an agent SHALL:

- preserve `id`;
- preserve `created`;
- update `updated`;
- preserve historical relationships;
- avoid deleting supersession lineage;
- respect `edit_policy`;
- preserve authority boundaries.

---

## 127. Agent Uncertainty Rule

If an agent cannot determine a required value:

- it SHALL not invent one;
- it SHALL use an explicit unresolved state where permitted;
- otherwise it SHALL create or surface an appropriate conflict, Inbox item or work blocker.

---

# PART XXII — BRAIN DOCTOR OBLIGATIONS

## 128. Minimum Schema Checks

Brain Doctor v0.1 SHALL eventually validate at least:

- parseable YAML;
- supported Brain schema version;
- globally unique stable IDs;
- valid note type;
- required universal fields;
- valid type-specific required fields;
- valid status for type;
- valid information class;
- valid date formats;
- valid relationship value shape;
- referenced stable IDs exist where required;
- generated records include generator metadata;
- generated `do_not_edit` records have not been manually altered where detectable;
- supersession relationships are coherent;
- validated Skills have validation evidence;
- Document proxies have canonical paths;
- formal records do not use prohibited ad hoc types.

---

# PART XXIII — INITIAL SCHEMA LAWS

## 129. Schema Laws

The following laws are provisionally established:

1. All formal Brain records use a versioned schema.
2. Stable ID is independent from title and filename.
3. Stable IDs never change after creation.
4. Semantic type is explicit metadata.
5. Lifecycle status is explicit metadata.
6. Authority status is separate from lifecycle status.
7. Information class is separate from semantic type.
8. Relationships use stable IDs rather than filenames.
9. Relationship fields use lists consistently.
10. Generated records identify their generator and edit policy.
11. Provenance and evidence are first-class metadata concerns.
12. Timestamps use ISO standards.
13. Repository paths are relative, not machine-specific.
14. Optional unused fields should be omitted.
15. Ad hoc metadata keys should not be invented during normal work.
16. New metadata semantics require schema governance.
17. Material schema changes require migration.
18. Machine-readable schema definitions must remain aligned with this document.
19. Brain Doctor validates schema compliance.
20. Metadata remains concise; detailed reasoning stays in Markdown bodies.

---

## 130. Status

This document establishes the locked Brain Schema v1 design contract.

It has been reconciled against all 38 LF-BRAIN-03 semantic types, LF-BRAIN-05's canonical `91_SCHEMA/` location, the Work/Handoff and learning systems, Branch B-compatible ADR lifecycle support including `experimental`, and Brain Doctor validation requirements.

This document is **LOCKED as the controlling metadata and schema authority for Leyforge Brain v0.1**.
