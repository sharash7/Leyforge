# LEYFORGE PROJECT BRAIN
## Initial Ingestion & Traceability Plan

**Document ID:** LF-BRAIN-12  
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
- LF-BRAIN-10 — Brain Doctor & Validation Standard  
- LF-BRAIN-11 — Automation, CLI & Git Integration Standard  

**Purpose:** Define how existing and future Leyforge project knowledge is ingested into the Project Brain, how authority is preserved, how legacy material is classified, how document proxies and domain records are created, and how project-wide traceability is built without duplicating canon or importing uncontrolled historical noise.

---

## 1. Purpose

Leyforge already contains a substantial body of:

- design documents;
- canon documents;
- engineering specifications;
- registries;
- research;
- prototypes;
- test material;
- historical implementation evidence;
- decisions;
- project roadmaps;
- legacy files;
- superseded concepts.

The Brain SHALL not begin by copying all of this information blindly.

Initial ingestion must instead be:

```text
authority-first
selective
traceable
reversible
validated
incremental
```

The objective is to create a Brain that helps resolve and navigate Leyforge rather than becoming another uncontrolled copy of it.

---

## 2. Core Ingestion Principle

The Brain SHALL ingest **structure, identity, provenance, relationships and current state** before attempting broad knowledge extraction.

The preferred order is:

```text
SOURCE INVENTORY
      ↓
AUTHORITY CLASSIFICATION
      ↓
DOCUMENT PROXIES
      ↓
SYSTEM / ENTITY MAP
      ↓
REQUIREMENTS
      ↓
DECISIONS
      ↓
IMPLEMENTATION LINKS
      ↓
TESTS / EVIDENCE
      ↓
PROJECT LEARNING
      ↓
TRACEABILITY
```

---

## 3. No Canon Duplication

The Brain SHALL NOT create independent rewritten copies of authoritative documents solely for convenience.

Instead:

```text
Authoritative Document
        ↓
Brain Document Proxy
        ↓
System / Entity / Requirement / Decision relationships
```

A Brain proxy may summarise scope and relationships but must link back to the controlling source.

---

# PART I — INGESTION CLASSES

## 4. Source Classification

Every source considered for ingestion SHOULD first be classified as one of:

```text
current_authoritative
current_supporting
implementation_state
evidence
research
historical
legacy
superseded
provisional
unknown
```

Classification SHALL follow LF-BRAIN-02.

---

## 5. `current_authoritative`

A current controlling source within a declared domain.

Priority: highest.

---

## 6. `current_supporting`

A current source that constrains or supplements another authority but is not itself the primary owner.

---

## 7. `implementation_state`

Current code, registries, configuration or runtime artefacts describing what exists now.

This SHALL remain distinct from intended design.

---

## 8. `evidence`

Tests, benchmark outputs, manual acceptance results, diagnostics and comparable observations.

---

## 9. `research`

External or internal investigations that may inform future decisions but do not define current project truth.

---

## 10. `historical`

Previously relevant project material preserved for context.

---

## 11. `legacy`

Old project material whose semantics may no longer match current architecture or canon.

Legacy is not automatically superseded authority.

It may simply be obsolete implementation or historical design.

---

## 12. `superseded`

A source with an explicit successor.

---

## 13. `provisional`

Unaccepted or incomplete material.

---

## 14. `unknown`

A source whose role cannot yet be safely determined.

Unknown sources SHALL NOT be promoted into current authority during ingestion.

---

# PART II — INITIAL INGESTION SCOPE

## 15. Initial Ingestion Is Selective

Brain v0.1 SHALL prioritise current high-value sources.

Initial targets SHOULD include:

1. Project-control documents.
2. Branch A–D governance once available.
3. Current authoritative document register.
4. Current FCC corpus.
5. Current PRD corpus.
6. Current LFE / FORGE-ENG engineering authorities.
7. Current engineering-governance documents.
8. Current registry authorities.
9. Current architecture decisions.
10. Current production roadmap/state.
11. Current testing and acceptance authority.
12. High-value historical evidence required for current decisions.

---

## 16. Deferred Initial Material

The first pass SHOULD generally defer:

- obsolete implementation dumps;
- old experiments with no current relevance;
- abandoned design copies;
- duplicate exported documents;
- unclassified scratch files;
- complete chat transcripts;
- large binary archives;
- old generated artefacts;
- irrelevant historical backups.

These may be ingested later if their value becomes clear.

---

# PART III — INGESTION PHASES

## 17. Phase I — Control Layer Bootstrap

Create Brain records for:

```text
LF-BRAIN documents
ENG-GOV documents
future Branch C audit documents
future Branch D roadmap documents
master control/status documents
```

Outputs:

- Document proxies;
- authority links;
- control indexes;
- current Handoff;
- initial Project State.

---

## 18. Phase II — Document Corpus Register

Create a Brain-level register of known significant documents.

For each document, capture at minimum:

```yaml
id:
title:
version:
document_family:
canonical_path:
status:
authority_status:
authority_domain:
```

Where known:

```yaml
supersedes:
superseded_by:
amends:
amended_by:
```

---

## 19. Phase III — Current Canon & Requirement Sources

Ingest current certified or locked design/canon sources.

Priority:

```text
current authority first
historical predecessors later
```

The Brain should identify:

- systems affected;
- entities defined;
- important requirements;
- current authority scope;
- unresolved conflicts.

---

## 20. Phase IV — Engineering & Architecture

Ingest:

- engineering governance;
- architecture documents;
- accepted ADRs;
- implementation boundaries;
- registry contracts;
- save/version contracts;
- Forge architecture;
- runtime architecture.

Outputs:

- System records;
- Architecture records;
- Interface records;
- implementation mappings;
- Decision links.

---

## 21. Phase V — Implementation Mapping

Create Implementation Module records for significant current repository modules.

Do not mirror the entire source tree.

Map:

```text
System
→ Architecture
→ Implementation Module
→ Repository Path
```

---

## 22. Phase VI — Testing & Evidence

Ingest current:

- test definitions;
- manual acceptance procedures;
- benchmarks;
- critical regression evidence;
- historical baseline evidence where still useful.

---

## 23. Phase VII — Project Learning

Promote useful known:

- Skills;
- Procedures;
- Patterns;
- Antipatterns;
- Failures;
- Workarounds;

only where sufficient provenance exists.

Do not invent historical Skills merely because current practice seems obvious.

---

## 24. Phase VIII — Historical Expansion

Once current authority and navigation are stable, selectively ingest historical and legacy material for:

- archaeology;
- migration;
- regression comparison;
- failure avoidance;
- decision rationale.

---

# PART IV — DOCUMENT PROXY INGESTION

## 25. Document Proxy Rule

Each significant logical Leyforge document SHOULD have one primary Brain Document record.

Example:

```yaml
id: DOC-FCC-12
type: document
title: FCC-12 ...
canonical_path: ...
```

---

## 26. Proxy Does Not Reproduce Source

The proxy SHOULD contain:

- identity;
- scope;
- authority;
- version;
- path;
- lineage;
- systems/entities affected;
- audit status.

It SHOULD NOT contain a rewritten copy of all source content.

---

## 27. Duplicate Copies

If multiple file copies represent the same logical document:

```text
one logical Document record
+
mirror/copy references
```

not multiple competing authority records.

---

## 28. Content Hashing

Where useful, ingestion tooling MAY calculate file hashes to identify:

- duplicates;
- mirrors;
- changed copies;
- stale exports.

A hash does not establish authority by itself.

---

# PART V — SYSTEM INGESTION

## 29. System Creation Threshold

Create a System record where a project area has meaningful:

- behaviour;
- dependencies;
- requirements;
- implementation;
- tests;
- architecture;
- authority.

Do not create a System record merely because a document heading exists.

---

## 30. System Scope

A System record SHOULD initially include:

```text
identity
scope
source_of_truth
dependencies
requirements
architecture
implementation
tests
decisions
risks
```

Unknown relationships may remain unresolved.

---

## 31. Avoid Premature Micro-Systems

Do not split one system into dozens of tiny System records before there is evidence that independent lifecycle/navigation is needed.

---

# PART VI — ENTITY INGESTION

## 32. Entity Extraction

Important persistent domain concepts MAY be represented as Entity records.

Examples:

- realms;
- materials;
- species;
- structures;
- technologies;
- cultures;
- sites;
- machines.

---

## 33. Reuse Canonical IDs

Where a valid canonical stable ID already exists, ingestion SHOULD preserve or map to it.

The Brain SHALL not invent a duplicate project identity.

---

## 34. Entity Density

Not every named noun in canon needs a Brain Entity record immediately.

Create records when the entity benefits from:

- cross-document linking;
- registry mapping;
- implementation mapping;
- testing;
- repeated retrieval;
- supersession;
- independent lifecycle.

---

# PART VII — REQUIREMENT EXTRACTION

## 35. Requirement Extraction Is Selective

Not every normative sentence becomes a `REQ-` record.

Create a Requirement when it needs independent implementation or verification tracking.

---

## 36. Requirement Source Fidelity

Every Requirement SHALL point to its source authority.

The extracted Requirement SHALL preserve source meaning.

It SHALL NOT simplify away material constraints.

---

## 37. Requirement Granularity

A Requirement should be:

```text
specific enough to test
broad enough to matter independently
```

Avoid:

```text
REQ-0001 Player movement exists.
```

if that statement has no useful traceability role.

---

## 38. Requirement IDs

New Requirement IDs SHALL follow LF-BRAIN-04 and project authority rules.

Where existing requirement IDs already exist, reuse them.

---

# PART VIII — DECISION INGESTION

## 39. Existing Decision Recovery

Historical and current major decisions MAY be reconstructed into ADR/DEC records.

---

## 40. Evidence Boundary

Ingest only supported decision history.

If rationale is unknown:

```text
Rationale:
Unknown / not preserved.
```

Do not invent historical reasoning.

---

## 41. Current Decision Priority

Accepted current decisions should be ingested before rejected/superseded proposals.

Historical decisions follow once current architecture is clear.

---

# PART IX — IMPLEMENTATION INGESTION

## 42. Implementation Mapping Principle

The Brain tracks significant implementation ownership, not every function/class/file.

---

## 43. Module Threshold

Create an Implementation Module when it has meaningful:

- responsibility;
- system ownership;
- architecture role;
- test coverage;
- migration relevance.

---

## 44. Current Code Is Observed State

Implementation ingestion SHALL not convert code behaviour into normative design.

If code differs from authority:

```text
implementation discrepancy
```

not:

```text
automatic canon update
```

---

# PART X — REGISTRY INGESTION

## 45. Registry Authority Classification

Before ingesting a registry, determine whether it is:

```text
authoritative
generated
implementation-only
legacy
experimental
historical
```

---

## 46. Legacy Registry Safety

Legacy registries SHALL NOT be treated as current truth merely because:

- they are structured;
- they have IDs;
- they are easy to parse.

---

## 47. Registry-to-Entity Mapping

Where current authority supports it:

```text
Entity
↔ Registry identity
```

should be traceable.

---

## 48. Registry Conflict

If registry identity conflicts with current canon/authority:

- create or link a Conflict;
- do not silently choose one.

---

# PART XI — TEST & EVIDENCE INGESTION

## 49. Current Test Authority

Prioritise current:

- acceptance tests;
- regression tests;
- migration tests;
- performance tests;
- manual validation procedures.

---

## 50. Historical Evidence

Historical test results MAY be ingested when useful as:

- baseline;
- regression evidence;
- proof of prior behaviour;
- performance comparison.

They SHALL be marked historical/current appropriately.

---

## 51. Evidence Context

Imported evidence SHOULD retain:

- date;
- version/build;
- commit where known;
- platform/hardware where relevant;
- test method;
- result.

---

# PART XII — RESEARCH INGESTION

## 52. Research Is Evidentiary

External research SHALL remain Source/Research/Finding material.

It does not automatically become:

- Requirement;
- Architecture;
- Skill;
- canon.

---

## 53. Research Promotion

Promotion flow:

```text
Source
  ↓
Research
  ↓
Finding
  ↓
Decision / Experiment
  ↓
Project authority or learning
```

---

# PART XIII — LEGACY & HISTORICAL MATERIAL

## 54. Legacy Quarantine

Unclassified legacy material SHOULD remain outside current Brain navigation until classified.

A legacy holding area MAY be represented through:

- Historical Document proxies;
- archive references;
- controlled ingestion queue.

---

## 55. Legacy Does Not Mean Delete

Legacy material may still contain valuable:

- failure evidence;
- migration data;
- old IDs;
- benchmarks;
- implementation history;
- reasoning.

---

## 56. Legacy Promotion

A legacy source MAY inform current work only after its relevance is explicitly evaluated.

---

# PART XIV — CHAT & CONVERSATION INGESTION

## 57. No Chat Dumping

Complete chat transcripts SHALL NOT be imported into the Brain as routine project memory.

---

## 58. Extract Outcomes

From conversations, preserve only durable outputs such as:

- decisions;
- Work state;
- requirements;
- conflicts;
- research conclusions;
- Skills;
- unresolved questions;
- Handoff.

---

## 59. Conversation Provenance

Where useful, a Work Record MAY note that a decision originated during a design discussion.

The Brain SHALL not depend on the transcript remaining available.

---

# PART XV — TRACEABILITY MODEL

## 60. Target Traceability Chain

The long-term target is:

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
  ↓
LESSON / SKILL
```

This is a conceptual chain, not a mandatory sequence for every record.

---

## 61. Traceability Is Relationship-Based

Traceability SHALL be built through stable IDs and typed relationships.

It SHALL not rely on filenames or folder proximity.

---

## 62. Partial Traceability Is Valid

During early ingestion:

```text
Requirement → Test
```

may be known while:

```text
Architecture
```

is not yet represented.

The Brain SHALL show incomplete coverage rather than fabricate missing links.

---

# PART XVI — TRACEABILITY DIRECTIONS

## 63. Forward Traceability

Example:

```text
Requirement
→ Architecture
→ Implementation
→ Test
→ Evidence
```

Answers:

> Where did this requirement end up?

---

## 64. Reverse Traceability

Example:

```text
Implementation Module
→ Architecture
→ Decision
→ Requirement
→ Source Authority
```

Answers:

> Why does this code exist?

---

## 65. Change Impact Traceability

Example:

```text
Document changes
→ Requirements affected
→ Architecture affected
→ Modules affected
→ Tests affected
```

Supports safer change planning.

---

# PART XVII — TRACEABILITY COVERAGE

## 66. Coverage Levels

Brain Doctor MAY classify traceability coverage:

```text
none
partial
substantial
complete
```

Exact definitions may vary by project phase.

---

## 67. Design-Phase Expectations

During design:

- authority;
- systems;
- requirements;
- major decisions;

matter most.

Implementation/test coverage may legitimately be incomplete.

---

## 68. Production-Phase Expectations

During implementation:

- Requirements should increasingly link to Architecture;
- Architecture to Modules;
- Modules to Tests;
- Tests to Evidence.

---

## 69. Certification Expectations

At certification gates, required traceability SHALL be defined by the governing audit/production standard.

---

# PART XVIII — INGESTION PIPELINE

## 70. Standard Pipeline

Every significant ingestion operation SHOULD follow:

```text
SOURCE
 ↓
CLASSIFY
 ↓
IDENTIFY LOGICAL IDENTITY
 ↓
IDENTIFY AUTHORITY
 ↓
CHECK EXISTING BRAIN RECORD
 ↓
CREATE / UPDATE PROXY
 ↓
EXTRACT RELATIONSHIPS
 ↓
CREATE SELECTIVE DOMAIN RECORDS
 ↓
UPDATE INDEX
 ↓
VALIDATE
 ↓
REVIEW DIFF
 ↓
WORK RECORD CLOSEOUT
```

---

## 71. Existing Record First

Ingestion tooling SHALL check for an existing Brain record before creating a new one.

This prevents duplicate proxies and duplicate Systems/Entities.

---

## 72. Merge, Do Not Duplicate

If the logical record already exists:

- update metadata;
- add new provenance;
- add relationships;
- preserve stable ID.

---

# PART XIX — AUTOMATED INGESTION

## 73. Deterministic Extraction

Automation MAY deterministically extract:

- title;
- path;
- version;
- hashes;
- file dates;
- explicit IDs;
- explicit references;
- metadata.

---

## 74. Semantic Extraction

AI MAY propose:

- systems;
- entities;
- requirements;
- authority scope;
- conflicts;
- relationships.

These remain proposals until validated according to their record class.

---

## 75. No Silent Semantic Promotion

An AI-generated Requirement or authority mapping SHALL not become protected truth merely because ingestion automation created it.

---

# PART XX — INGESTION WORK RECORDS

## 76. Significant Ingestion Requires Work Record

Large ingestion batches SHOULD have a Work Record containing:

- scope;
- source set;
- classifications;
- records created;
- conflicts found;
- validation result;
- unresolved items.

---

## 77. Batch IDs

Large ingestion passes MAY use explicit batch identifiers.

Example:

```text
INGEST-2026-001
```

This may be implementation metadata rather than a formal note type.

---

# PART XXI — INGESTION CONFLICTS

## 78. Conflict Creation

If ingestion discovers contradictory current authority:

```text
create CONFLICT
```

Do not decide based on:

- newest timestamp;
- latest upload;
- most convenient source;
- code behaviour.

---

## 79. Unknown Lineage

If supersession cannot be determined:

```yaml
authority_status: unresolved
```

and route to audit/reconciliation.

---

# PART XXII — INGESTION QUEUE

## 80. Controlled Queue

Sources awaiting classification MAY be tracked through:

- Work Items;
- Inbox;
- audit records;
- generated ingestion queue.

---

## 81. Queue Is Not Authority

Unprocessed files remain sources awaiting classification.

They do not enter current authority automatically.

---

# PART XXIII — INITIAL LEYFORGE PRIORITY ORDER

## 82. Priority Group A — Project Control

First:

```text
Branch A Brain governance
Branch B Engineering Governance
Branch C Audit governance once created
Branch D Production Roadmap once created
master project control/status
```

---

## 83. Priority Group B — Current Design Authority

Then:

```text
current FCC
current PRD
current Sets / foundation authorities
```

according to their certified roles.

---

## 84. Priority Group C — Engineering Authority

Then:

```text
LFE
FORGE-ENG
ENG-GOV
accepted ADRs
registry standards
save/version rules
testing standards
```

---

## 85. Priority Group D — Implementation & Evidence

Then:

```text
current implementation modules
current registries
tests
benchmarks
manual acceptance guides
critical historical baselines
```

---

## 86. Priority Group E — Historical Expansion

Finally:

```text
superseded documents
legacy registries
old prototypes
historical testing
failed approaches
old architecture
```

only where useful.

---

# PART XXIV — INITIAL INGESTION MINIMUM

## 87. Minimum Brain v0.1 Seed

Before the Brain pilot, the Brain SHOULD contain at least:

```text
HOME
AGENTS
CURRENT_HANDOFF

Branch A Document proxies
Branch B governance proxies
Branch C/D placeholders or governance records once available

Project State
Current Work
Document Index
Systems Index
Decision Index
Skills Index
Testing Index

current major Systems
current authoritative document map
current engine architecture decision
current registry authority map
current testing authority
active Work / Handoff
```

---

# PART XXV — CORPUS AUDIT INTERACTION

## 88. Branch C Relationship

Branch C will define the formal V1 documentation audit.

Brain ingestion SHALL NOT pre-empt that audit by declaring ambiguous documents certified.

---

## 89. Pre-Audit State

The Brain MAY represent:

```text
current_known_authority
provisional_authority
unresolved_authority
```

while Branch C performs formal reconciliation.

---

## 90. Post-Audit Update

After V1 certification:

- Document proxies update authority status;
- supersession maps update;
- Systems/Entities update source pointers;
- obsolete conflicts resolve;
- traceability is regenerated.

---

# PART XXVI — PRODUCTION ROADMAP INTERACTION

## 91. Branch D Relationship

Branch D controls production sequencing.

The Brain uses Branch D to determine:

- which sources must be ingested before each stage;
- which traceability gates apply;
- when Brain certification is required.

---

# PART XXVII — TRACEABILITY DASHBOARDS

## 92. Core Views

The Brain SHOULD eventually provide views such as:

```text
Requirements missing implementation
Requirements missing tests
Systems missing authority
Implementation modules missing architecture
Tests missing evidence
Entities missing registry mapping
Accepted ADRs missing implementation linkage
Current documents with unresolved supersession
```

---

## 93. Dashboards Are Derived

Traceability dashboards SHALL not become authority.

Fix underlying records rather than manually editing coverage numbers.

---

# PART XXVIII — SOURCE FIDELITY

## 94. Preserve Terminology

When extracting from authoritative sources, the Brain SHOULD preserve:

- stable IDs;
- official terms;
- scope;
- distinctions;
- defined relationships.

---

## 95. No Silent Normalisation

Do not silently rename or merge concepts merely because they appear similar.

If reconciliation is needed, create:

- Conflict;
- Decision;
- audit item.

---

# PART XXIX — INGESTION TESTING

## 96. Ingestion Tool Tests

`brain-ingest` SHOULD include tests for:

- duplicate document detection;
- stable ID preservation;
- source-path extraction;
- lineage extraction;
- existing-record merge;
- unknown authority handling;
- conflict generation;
- generated boundary preservation.

---

## 97. Pilot Corpus

The initial Brain pilot SHOULD use a small, representative corpus before full ingestion.

It should include:

- one content authority;
- one engineering authority;
- one System;
- one Entity group;
- one Decision;
- one implementation mapping;
- one Test/Evidence chain;
- one learned-knowledge record.

---

# PART XXX — INGESTION FAILURE BEHAVIOUR

## 98. Fail Safe

If ingestion cannot safely determine:

- identity;
- authority;
- supersession;
- classification;

it SHALL flag the uncertainty instead of guessing.

---

## 99. Partial Batch Failure

A partially failed batch SHALL report:

- successful records;
- failed records;
- unresolved records;
- conflicts;
- validation results.

---

# PART XXXI — REVERSIBILITY

## 100. Ingestion Must Be Reviewable

Large ingestion should produce Git-reviewable changes.

---

## 101. Rebuildability

Generated proxies/indexes SHOULD be reproducible where practical.

Authored reconciliations SHALL preserve Work/Decision provenance.

---

# PART XXXII — INITIAL INGESTION SUCCESS CRITERIA

## 102. Successful Initial Ingestion

Initial ingestion is successful when:

```text
[ ] Current high-value documents are registered
[ ] Authority states are explicit
[ ] Major Systems are represented
[ ] Key Entities are connected where useful
[ ] Current decisions are discoverable
[ ] Current implementation has high-level mapping
[ ] Current testing/evidence is navigable
[ ] Legacy material is not masquerading as current authority
[ ] No duplicate logical authorities exist unresolved
[ ] Core indexes work
[ ] Brain Doctor passes the required profile
[ ] CURRENT_HANDOFF can route a new agent into real work
```

---

# PART XXXIII — TRACEABILITY SUCCESS CRITERIA

## 103. Initial Traceability Target

Brain v0.1 does not require perfect whole-project traceability on day one.

It SHALL demonstrate at least one complete real chain such as:

```text
Authority
→ Requirement
→ Decision
→ Architecture
→ Implementation
→ Test
→ Evidence
→ Lesson/Skill
```

This proves the model works before mass expansion.

---

# PART XXXIV — CODEX IMPLEMENTATION RESPONSIBILITIES

## 104. Pre-Production Setup

Codex SHOULD implement:

- ingestion tooling;
- document-proxy generation;
- source classification support;
- duplicate detection;
- hash support where useful;
- stable-ID mapping;
- selective relationship extraction;
- ingestion queue;
- traceability queries;
- traceability dashboards;
- validation;
- pilot ingestion;
- initial high-value corpus seed.

---

## 105. Codex Ingestion Boundaries

Codex MAY automate structure and propose relationships.

Codex SHALL NOT:

- certify ambiguous authority;
- silently reconcile conflicting canon;
- invent historical rationale;
- promote legacy data to current authority because parsing is easier;
- bulk-create low-value Entity records without retrieval value.

---

# PART XXXV — INGESTION LAWS

## 106. Ingestion Laws

The following laws are provisionally established:

1. Initial ingestion is authority-first, selective and incremental.
2. The Brain ingests structure and relationships before attempting broad extraction.
3. Authoritative documents are proxied, not duplicated.
4. Every significant source is classified before it influences current Brain state.
5. Legacy material is never assumed current.
6. Structured machine-readable data is not automatically authoritative.
7. Current code describes implementation state, not intended design.
8. Current high-value authority is ingested before historical material.
9. One logical document gets one primary Brain proxy.
10. Duplicate copies do not create duplicate authority.
11. Canonical stable IDs are reused or mapped rather than reinvented.
12. Not every named concept requires an Entity record.
13. Not every normative sentence requires a Requirement record.
14. Requirement extraction preserves source meaning.
15. Historical decisions may be reconstructed only from supported evidence.
16. Chat transcripts are not durable Brain memory.
17. Durable chat outcomes are extracted into formal records.
18. Traceability is relationship-based.
19. Partial traceability is valid and preferable to fabricated completeness.
20. Forward, reverse and change-impact traceability are all required capabilities.
21. Automated semantic extraction may propose but not silently certify.
22. Existing records are updated before duplicates are created.
23. Ingestion conflicts are surfaced rather than guessed through.
24. Unknown authority remains explicitly unknown.
25. Initial Brain seeding prioritises control, current authority, engineering, then implementation/evidence.
26. Branch C certification updates Brain authority state rather than being pre-empted by ingestion.
27. Branch D determines stage-specific ingestion and traceability gates.
28. Traceability dashboards are derived views.
29. Source terminology and distinctions are preserved.
30. Silent normalisation or concept merging is prohibited.
31. Ingestion tooling must be tested.
32. Pilot ingestion precedes mass ingestion.
33. Large ingestion batches must be reviewable and recoverable through Git.
34. Brain v0.1 proves at least one end-to-end traceability chain before scaling.
35. The purpose of ingestion is to make Leyforge easier to understand, not to move every old file into Obsidian.

---

## 107. Status

This document establishes the Initial Ingestion & Traceability Plan for Leyforge Brain v0.1.

It has been reconciled with the pilot/certification handoff, Branch B engineering-governance boundaries, and the defined future Branch C/D audit and production-gate integrations.

This document is **LOCKED as the controlling Brain-domain authority for initial corpus ingestion, document proxy creation, authority-safe extraction and project-wide traceability construction**.
