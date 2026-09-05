# LEYFORGE PROJECT BRAIN
## Architecture & Governance Specification

**Document ID:** LF-BRAIN-01  
**Version:** v0.1  
**Status:** LOCKED — Branch A Design v0.1 — Ready for Pre-Production Implementation  
**Branch:** A — Leyforge Project Brain / Obsidian  
**Purpose:** Authoritative specification for the design, governance and eventual implementation of the Leyforge Project Brain.

---

## 1. Purpose

The Leyforge Project Brain is the persistent knowledge, navigation, operational-memory, decision-history and project-learning system for Leyforge.

Its purpose is to ensure that Leyforge remains understandable, traceable and maintainable as the project grows across design, engineering, implementation, testing, auditing and production.

The Brain must allow a human or authorised development agent to determine:

- what information is authoritative;
- where that authority resides;
- why a decision was made;
- what systems depend on that decision;
- what work is currently active;
- what has previously been attempted;
- what failed and why;
- what reusable techniques have been discovered;
- what has been implemented;
- what has been tested;
- what evidence supports a conclusion;
- what remains unresolved;
- and what context must be read before continuing work.

The Brain is therefore not merely a note-taking vault.

It is Leyforge's persistent project knowledge graph and operational memory.

---

## 2. Core Principle

The Project Brain SHALL NOT become a competing copy of Leyforge canon or engineering authority.

Authoritative project documents remain authoritative within their assigned domains.

The Brain may:

- index them;
- identify their authority;
- link them;
- describe their relationships;
- track their status;
- connect them to implementation;
- connect them to tests and evidence;
- record decisions affecting them;
- record lessons learned while implementing them.

The Brain SHALL NOT silently redefine their authoritative content.

Example:

```text
FCC-12
   ↓
authoritatively defines material behaviour
   ↓
Brain entity node
   ↓
links FCC-12 to:
systems
registries
implementation
tests
ADRs
work records
skills
```

The Brain node is not an independent second definition of the material.

---

## 3. Brain Authority

Although the Brain does not replace project-domain authorities, it SHALL be authoritative regarding its own operation.

The following Brain-governance documents shall ultimately govern the Brain subsystem:

- `BRAIN_SPEC.md`
- `BRAIN_SCHEMA.md`
- `AUTHORITY_MODEL.md`
- `AGENTS.md`

These documents may define:

- Brain note structures;
- Brain ID rules;
- metadata requirements;
- lifecycle states;
- navigation behaviour;
- agent interaction rules;
- Work Record behaviour;
- Skills Registry behaviour;
- generated-content rules;
- validation rules;
- Brain Doctor behaviour;
- Brain automation rules.

They SHALL NOT independently redefine gameplay canon, registries, engineering architecture, save contracts or other project-domain authorities.

---

## 4. Physical Location

The Leyforge Brain SHALL live inside the existing Leyforge Git repository.

Target structure:

```text
Leyforge/
│
├── project source
├── addons
├── assets
├── docs
├── registries
├── tests
│
└── brain/
```

`Leyforge/brain/` SHALL be opened as the Obsidian Vault.

The complete Leyforge repository SHALL NOT be opened as the Obsidian Vault.

This separation prevents Obsidian from unnecessarily indexing source code, generated assets, imported content, build data and unrelated repository internals.

The Brain nevertheless remains versioned by the same root Git repository as the rest of Leyforge.

---

## 5. Persistence and Tool Independence

The durable Project Brain shall be based primarily on open, inspectable project files.

Preferred durable formats include:

- Markdown;
- YAML;
- JSON;
- other plain-text formats where justified.

Obsidian is the primary human interface for navigating and editing the Brain.

Obsidian itself SHALL NOT be treated as the sole persistence layer.

The conceptual hierarchy is:

```text
Plain project files
        ↓
durable knowledge

Leyforge Brain tooling
        ↓
headless validation, generation and maintenance

Official Obsidian CLI
        ↓
local Obsidian-aware automation

Obsidian
        ↓
human interface
```

Loss or replacement of Obsidian must not destroy the underlying Leyforge knowledge system.

---

## 6. Initial Plugin Policy

Leyforge Brain v0.1 SHALL begin without community plugins.

Initial functionality should rely on Obsidian core capabilities wherever practical, including:

- Properties;
- Bases;
- Templates;
- Search;
- Backlinks;
- local graph views;
- Canvas;
- command-line functionality.

A community plugin may only be considered when an actual project requirement cannot reasonably be fulfilled through:

1. Obsidian core functionality;
2. the official Obsidian CLI;
3. a simple Leyforge-owned script or tool.

Any proposed plugin must also be assessed for:

- security;
- maintenance activity;
- portability;
- data ownership;
- failure behaviour;
- project dependence.

Essential Leyforge knowledge SHALL NOT exist exclusively inside a community-plugin-specific database or opaque format.

---

## 7. Stable Brain Identities

Significant Brain records SHALL receive persistent stable identities.

Stable IDs SHALL be independent of filenames and human-readable titles.

Renaming a note SHALL NOT require changing its stable ID.

Example:

```yaml
id: SYS-SETTLEMENT
title: Civilisation Settlement System
```

The filename may change while `SYS-SETTLEMENT` remains permanent.

Candidate identity families include:

```text
SYS-          System
ARCH-         Architecture
DOC-          Document
REG-          Registry or registry map

ADR-          Architecture Decision Record
DEC-          Decision Record

WORK-         Work Record

SKILL-        Reusable Skill
PROC-         Procedure
PATTERN-      Pattern
ANTI-         Antipattern
FAIL-         Failure Record
WORKAROUND-   Workaround

TEST-         Test record
EVID-         Evidence
BENCH-        Benchmark

RISK-         Risk
CONFLICT-     Contradiction/conflict
AUDIT-        Audit record
```

The final namespace set SHALL be defined by the Brain Schema.

Trivial notes need not automatically receive heavyweight identities.

---

## 8. Brain Schema Versioning

The Project Brain SHALL use a versioned metadata schema.

Formal Brain records should contain a schema identifier such as:

```yaml
brain_schema: 1
```

The authoritative schema shall be documented in `BRAIN_SCHEMA.md` and, where useful, represented in machine-readable schema files.

When the information model changes materially, migration shall occur explicitly.

Example:

```text
Brain Schema 1
      ↓
defined migration
      ↓
Brain Schema 2
```

Uncontrolled accumulation of incompatible metadata conventions is prohibited.

---

## 9. Information Classes

Brain content SHALL distinguish between four broad information classes.

### 9.1 Authored

Deliberately maintained project knowledge.

Examples:

- system records;
- architecture records;
- ADRs;
- Skills;
- research conclusions.

### 9.2 Generated

Automatically produced from another source.

Examples:

- registry coverage reports;
- automatically generated indexes;
- generated traceability summaries.

Generated records SHALL identify their generator and SHALL NOT be manually edited unless explicitly permitted.

### 9.3 Derived

Calculated or assembled from existing Brain information.

Examples:

- active-risk dashboards;
- document coverage dashboards;
- unresolved-conflict views;
- current audit summaries.

### 9.4 Temporary

Information not yet promoted into permanent project knowledge.

Examples:

- Inbox discoveries;
- candidate lessons;
- unvalidated observations;
- provisional research notes.

Temporary information must have a defined path toward promotion, rejection or archival.

---

## 10. Lifecycle Model

Brain records SHALL use controlled lifecycle states appropriate to their type.

Possible project-entity states:

```text
proposed
active
locked
deprecated
superseded
archived
```

Possible learned-knowledge states:

```text
candidate
testing
validated
deprecated
rejected
```

Possible work states:

```text
planned
active
blocked
complete
cancelled
```

Possible conflict states:

```text
detected
investigating
resolved
deferred
```

Each note type SHALL define its valid states in the Brain Schema.

---

## 11. Contradiction Handling

The Brain SHALL NOT silently resolve conflicting authoritative sources unless an existing authority or supersession rule already resolves the conflict.

Unresolved contradictions SHALL become explicit records.

Example:

```text
CONFLICT-0042
```

A conflict record should identify:

- affected sources;
- conflicting claims;
- authority status;
- affected systems;
- known consequences;
- resolution status;
- eventual resolution;
- resulting supersession or amendment where applicable.

Conflicts shall be surfaced through appropriate Brain indexes and audit views.

---

## 12. Work Records

Significant Leyforge work SHALL leave an operational Work Record.

Work Records exist to preserve context and reasoning that cannot be reconstructed efficiently from Git history alone.

A Work Record may contain:

- objective;
- authority consulted;
- affected systems;
- files changed;
- decisions made;
- tests performed;
- problems encountered;
- discoveries;
- Skills reused;
- Skills proposed;
- unresolved issues;
- recommended next work;
- handoff information.

The Brain SHALL NOT record meaningless activity exhaust.

Git records detailed file history.

The Brain records why the work occurred, what was learned and what follows.

---

## 13. Handoff State

Significant work sessions SHALL leave sufficient context for another authorised human or development agent to continue without reconstructing the previous session from scratch.

A current handoff mechanism shall expose:

- current task;
- recently completed work;
- unresolved work;
- relevant authorities;
- important assumptions;
- open risks;
- affected files or systems;
- recommended next action.

The standard future agent-entry path should approximate:

```text
AGENTS.md
    ↓
HOME
    ↓
CURRENT_HANDOFF
    ↓
relevant indexes
    ↓
authoritative sources
```

---

## 14. Project Learning System

The Brain SHALL preserve reusable Leyforge project knowledge.

The learned-knowledge system may include:

- Skills;
- Procedures;
- Patterns;
- Antipatterns;
- Shortcuts;
- Lessons;
- Failures;
- Workarounds;
- Tooling discoveries;
- Benchmark lessons.

A discovered technique SHALL NOT automatically become trusted project practice.

Learned knowledge should track maturity and provenance.

Example:

```yaml
id: SKILL-0017
status: validated

discovered_in:
  - WORK-20260828-004

evidence:
  - TEST-0032
  - EVID-0066

reuse_count: 4
```

This allows Leyforge to distinguish between an interesting idea and a repeatedly validated technique.

---

## 15. Historical Preservation

Important project history SHALL normally be superseded rather than erased.

Examples include:

- ADRs;
- major decisions;
- failed experiments;
- significant benchmark results;
- abandoned architecture;
- rejected procedures;
- known antipatterns.

Example:

```text
ADR-0014
Status: superseded

Superseded by:
ADR-0041
```

Historical records exist partly to prevent Leyforge from repeatedly rediscovering previously rejected solutions.

---

## 16. Brain Doctor

The Brain SHALL eventually include a validation and health-check system known as **Brain Doctor**.

Brain Doctor shall be designed to detect issues such as:

- malformed metadata;
- duplicate stable IDs;
- missing required properties;
- invalid lifecycle states;
- broken links;
- missing authorities;
- orphaned significant records;
- unresolved supersession;
- improperly edited generated records;
- stale active work;
- stale Inbox records;
- missing Skill evidence;
- duplicate entities;
- missing traceability links;
- index drift.

Brain Doctor shall become part of major project validation and pre-production certification.

---

## 17. Navigation Philosophy

The Brain SHALL NOT depend on the global Obsidian Graph as its primary navigation model.

Primary navigation should instead use:

- curated indexes;
- Obsidian Bases;
- focused local graphs;
- system/entity links;
- selected Canvas maps;
- structured metadata;
- search.

The global graph may remain useful for exploration and diagnostics.

---

## 18. Traceability Goal

The long-term Brain traceability chain is:

```text
SOURCE
   ↓
CANON / AUTHORITY
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

Not every project element must contain every stage of the chain.

However, significant production systems should eventually be traceable through the appropriate portions of this structure.

---

## 19. Agent Behaviour Principle

Authorised development agents may use the Brain to understand and maintain Leyforge.

Agents SHALL NOT silently modify project truth outside their authorised domain.

Future `AGENTS.md` rules shall define:

- required reading before significant work;
- allowed automatic updates;
- governed modifications;
- prohibited autonomous changes;
- work-logging requirements;
- decision-recording requirements;
- Skill promotion rules;
- generated-file handling;
- validation and handoff requirements.

---

## 20. Pre-Production Implementation

This specification defines the Brain architecture.

It does not require the complete Brain infrastructure to be physically constructed during the current theoretical-design phase.

The complete Branch A specification set shall become an implementation input to the Leyforge Pre-Production Infrastructure & Project Initialisation stage.

During that stage, Codex or another authorised implementation agent shall use the approved Branch A documents to construct and configure the Brain infrastructure.

Expected implementation work includes:

- Obsidian vault creation;
- exact folder structure;
- metadata schemas;
- templates;
- indexes and Bases;
- `AGENTS.md`;
- Work Record tooling;
- handoff tooling;
- Skills Registry infrastructure;
- Brain Doctor;
- validation scripts;
- Git integration;
- appropriate automation;
- initial authoritative-source ingestion;
- pilot testing.

The implementation SHALL conform to the approved Branch A documents rather than inventing a competing Brain architecture during setup.

---

## 21. Production Setup Gate

Before the clean Leyforge production rebuild begins, the Project Brain shall pass an infrastructure certification process.

The target sequence is:

```text
Branch A specifications locked
        ↓
Pre-production setup begins
        ↓
Codex constructs Brain infrastructure
        ↓
Initial authoritative data indexed
        ↓
Brain Doctor passes
        ↓
Agent workflow pilot passes
        ↓
Git / validation integration passes
        ↓
Authority behaviour verified
        ↓
LEYFORGE BRAIN v0.1 CERTIFIED
        ↓
Production rebuild may proceed
```

---

## 22. Relationship to Other Project-Control Branches

The Brain forms one component of a wider Leyforge project-control layer.

```text
Branch A
Project Brain / Obsidian
        ↕
Branch B
Engineering Governance
        ↕
Branch C
V1 Documentation Audit
        ↕
Branch D
Production / Rebuild Roadmap
```

These branches must remain mutually compatible.

Branch A primarily governs project knowledge organisation, operational memory and navigation.

Branch B primarily governs engineering practice and implementation discipline.

Branch C governs the process by which the existing Leyforge documentation corpus becomes reconciled, implementation-authoritative V1 documentation.

Branch D governs sequencing, production stages, implementation gates and rebuild progression.

The Project Brain shall eventually represent and connect information from all four branches without replacing their respective authorities.

---

## 23. Initial Constitutional Principles

The following principles are provisionally established for Leyforge Brain v0.1:

1. The Brain lives inside the Leyforge repository.
2. Only the Brain directory is opened as the Obsidian Vault.
3. Plain project files remain the durable persistence layer.
4. Canonical documents remain authoritative within their domains.
5. The Brain maps authority rather than duplicating it.
6. Important Brain objects receive stable identities.
7. Brain metadata uses a versioned schema.
8. Entity relationships and metadata form the knowledge graph.
9. Folders primarily organise information type rather than define truth.
10. Human and AI navigation uses curated hierarchical indexes.
11. Significant work leaves operational memory.
12. Reusable discoveries are promoted into durable learned knowledge.
13. Failures and antipatterns are deliberately preserved.
14. Significant architecture decisions use ADRs.
15. Brain integrity must be machine-testable.
16. Plugins enhance the system but do not own essential knowledge.
17. Community plugins are unnecessary for Brain v0.1 unless a demonstrated requirement proves otherwise.
18. Giant monolithic Markdown knowledge files are prohibited.
19. Important history is superseded rather than silently erased.
20. Generated and authored information remain distinguishable.
21. Development agents operate under explicit write boundaries.
22. Historical evidence and benchmarks remain available when superseded.
23. Brain automation should favour supported interfaces and simple owned tooling.
24. The Brain should gradually increase automation rather than require complete automation on day one.
25. The ultimate objective is project-wide traceability from authority through implementation and evidence.

---

## 24. Status

This document establishes the parent architecture for the Leyforge Project Brain.

The complete LF-BRAIN-01 through LF-BRAIN-13 design set has now been cross-reconciled.

This document is therefore **LOCKED as part of Leyforge Project Brain Design v0.1 — Ready for Pre-Production Implementation**.

Its subordinate specifications remain the controlling detailed authorities for their assigned Brain domains. Future material changes require a governed Branch A amendment, ADR/DEC where applicable, and schema migration where required.
