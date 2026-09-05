# LEYFORGE PROJECT BRAIN
## Vault Architecture & Navigation Standard

**Document ID:** LF-BRAIN-05  
**Version:** v0.1  
**Status:** LOCKED — Branch A Design v0.1 — Ready for Pre-Production Implementation  
**Branch:** A — Leyforge Project Brain / Obsidian  
**Parent:** LF-BRAIN-01 — Project Brain Architecture & Governance Specification  
**Related:** LF-BRAIN-02, LF-BRAIN-03, LF-BRAIN-04  
**Purpose:** Define the physical Obsidian vault layout, folder responsibilities, naming conventions, navigation hierarchy, index architecture, Bases and Canvas usage, Inbox and Archive behaviour, attachment handling, `.obsidian/` repository policy, and human/agent retrieval flow for Leyforge Brain v0.1.

---

## 1. Purpose

The Leyforge Project Brain must remain understandable at both small and very large scale.

The vault architecture therefore needs to support:

- thousands of future records;
- multiple documentation families;
- human browsing;
- AI retrieval;
- automated validation;
- controlled ingestion;
- project-wide traceability;
- historical preservation;
- low-friction work logging;
- deterministic storage rules;
- Git versioning;
- future tooling.

The vault SHALL not depend on memory of where individual notes happen to be stored.

Physical folders provide organisation. Stable IDs, metadata, indexes and typed relationships provide meaning.

---

## 2. Core Physical Architecture Principle

The Brain SHALL live at:

```text
Leyforge/brain/
```

Only this directory SHALL be opened as the Obsidian Vault.

The full Leyforge repository SHALL NOT be opened as an Obsidian Vault.

The Brain remains inside the same root Git repository as the rest of Leyforge.

```text
Leyforge/
│
├── .git/
├── project/
├── addons/
├── assets/
├── code/
├── docs/
├── registries/
├── tests/
│
└── brain/                    ← OBSIDIAN VAULT ROOT
```

This isolates Obsidian indexing from large code, assets, generated content, imports and repository internals while preserving shared version control.

---

# PART I — CANONICAL VAULT ROOT

## 3. Initial Vault Structure

Brain v0.1 SHALL use the following high-level structure:

```text
brain/
│
├── HOME.md
├── AGENTS.md
├── CURRENT_HANDOFF.md
│
├── 00_CONTROL/
├── 01_INDEXES/
├── 02_ENTITIES/
├── 03_ARCHITECTURE/
├── 04_DOCUMENTS/
├── 05_DECISIONS/
├── 06_WORK/
├── 07_KNOWHOW/
├── 08_RESEARCH/
├── 09_IMPLEMENTATION/
├── 10_TESTING/
├── 11_AUDIT/
├── 12_REQUIREMENTS/
├── 13_RISKS_AND_CONFLICTS/
│
├── 80_BASES/
├── 81_CANVAS/
├── 82_ATTACHMENTS/
├── 90_TEMPLATES/
├── 91_SCHEMA/
├── 92_SCRIPTS/
├── 98_INBOX/
├── 99_ARCHIVE/
│
└── .obsidian/
```

The numeric prefixes exist to provide predictable ordering across operating systems and file explorers.

Numbers SHALL describe navigation order, not authority.

---

## 4. Root-Level Files

Only a small set of high-value entry files SHALL live at vault root.

### `HOME.md`
Primary human and agent navigation entry point.

### `AGENTS.md`
Controlling Brain interaction contract for authorised AI/development agents.

### `CURRENT_HANDOFF.md`
Current operational continuity record.

These files are deliberately placed at root because they are expected to be read frequently and early.

Other records SHOULD live inside their assigned domains.

---

# PART II — CONTROL AREA

## 5. `00_CONTROL/`

Purpose:

- current project state;
- production overview;
- active-work summaries;
- Brain health;
- open questions;
- major blockers;
- current branch status;
- control-layer coordination.

Initial contents may include:

```text
00_CONTROL/
├── Project State.md
├── Current Work.md
├── Production Overview.md
├── Open Questions.md
├── Control Layer Status.md
└── Brain Health.md
```

These records are primarily dashboards or control views. They SHALL not duplicate authoritative project documents.

---

## 6. Project State

`Project State.md` should provide a concise derived view of:

- current design phase;
- current documentation work;
- current audit state;
- current pre-production readiness;
- current implementation stage;
- major blockers.

Its values should eventually be generated or queried from authoritative records where practical.

---

# PART III — INDEX LAYER

## 7. `01_INDEXES/`

Purpose:

Provide curated, hierarchical navigation into the Brain.

Initial index set:

```text
01_INDEXES/
├── Project Index.md
├── Canon Index.md
├── Systems Index.md
├── Entity Index.md
├── Architecture Index.md
├── Document Index.md
├── Requirement Index.md
├── Registry Index.md
├── Decision Index.md
├── Work Index.md
├── Skills Index.md
├── Research Index.md
├── Implementation Index.md
├── Testing Index.md
├── Audit Index.md
├── Risk Index.md
└── Conflict Index.md
```

Indexes SHALL be intentionally small enough to serve as routing pages.

---

## 8. Hierarchical Retrieval

The standard navigation model SHALL be:

```text
HOME
  ↓
Relevant Index
  ↓
Relevant System / Entity / Document / Record
  ↓
Authoritative Source
```

Agents SHALL prefer this path over full-vault scanning.

---

## 9. Index Scope

An Index should contain:

- brief scope statement;
- current major records;
- links to subordinate indexes;
- filtered dynamic views where useful;
- unresolved gaps where relevant.

It should not duplicate record content.

---

# PART IV — ENTITY GRAPH

## 10. `02_ENTITIES/`

Purpose:

Store Brain Entity records representing persistent Leyforge domain concepts.

Recommended structure:

```text
02_ENTITIES/
├── Realms/
├── Regions/
├── Biomes/
├── Materials/
├── Resources/
├── Blocks/
├── Items/
├── Recipes/
├── Species/
├── Creature Families/
├── Ancestries/
├── Cultures/
├── Governments/
├── Settlements/
├── Structures/
├── Sites/
├── Technologies/
├── Machines/
├── Tools/
├── Weapons/
├── Armour/
├── Magic/
├── Hazards/
├── Flora/
├── Fungi/
├── Factions/
└── Other/
```

These folders are convenience groupings.

The authoritative semantic class remains:

```yaml
type: entity
entity_class: ...
```

---

## 11. No Folder-Defined Identity

Moving a record between valid entity folders SHALL NOT change:

- stable ID;
- entity type;
- authority;
- relationships.

Folders organise. Metadata defines.

---

## 12. Entity Subfolder Expansion

New entity subfolders MAY be added without a schema migration where they merely improve navigation.

A new folder does not create a new semantic type.

---

# PART V — ARCHITECTURE

## 13. `03_ARCHITECTURE/`

Purpose:

Store system and architecture records.

Recommended structure:

```text
03_ARCHITECTURE/
├── Systems/
├── Runtime/
├── Worldgen/
├── Persistence/
├── Forge/
├── Registries/
├── Simulation/
├── Networking/
├── Rendering/
├── AI/
├── UI/
├── Tooling/
└── Interfaces/
```

This area contains:

- `system`;
- `architecture`;
- `interface`;
- architecture-level `concept` records where justified.

---

## 14. System vs Entity Placement

System records belong under Architecture because they describe behavioural/technical systems rather than content entities.

Example:

```text
03_ARCHITECTURE/Systems/Settlement System.md
```

while a settlement archetype may belong under:

```text
02_ENTITIES/Settlements/
```

---

# PART VI — DOCUMENT PROXIES

## 15. `04_DOCUMENTS/`

Purpose:

Store Brain proxies for Leyforge-controlled documents.

Recommended structure:

```text
04_DOCUMENTS/
├── Foundation/
├── Sets/
├── FCC/
├── PRD/
├── LFE/
├── FORGE-ENG/
├── ENG-GOV/
├── BRAIN/
├── AUDIT/
├── ROADMAP/
├── Registries/
└── Historical/
```

These are proxy records only.

The underlying authoritative documents remain at their canonical repository locations.

---

## 16. No Canon Duplication

A Document proxy SHALL contain:

- identity;
- version;
- authority status;
- canonical path;
- scope;
- relationships;
- audit status;
- lineage.

It SHALL NOT reproduce the full document unless the document itself is intentionally stored inside the Brain as its canonical location.

---

# PART VII — DECISIONS

## 17. `05_DECISIONS/`

Recommended structure:

```text
05_DECISIONS/
├── ADR/
├── Decisions/
└── Superseded/
```

Types:

- `adr`;
- `decision`.

For general Leyforge DEC records, this area is canonical.

For engineering ADRs, `05_DECISIONS/ADR/` is the preferred Brain location **only when Branch B delegates canonical ADR storage to the Brain**. If Branch B establishes another canonical repository ADR location, the Brain SHALL index/proxy those ADRs here without creating a competing authoritative copy.

A physical `Superseded/` folder is optional. Metadata remains authoritative for supersession.

---

## 18. Decision Naming

Recommended filenames:

```text
ADR-0001 Short Decision Title.md
DEC-0001 Short Decision Title.md
```

Stable ID appears in filename for quick human recognition.

---

# PART VIII — WORK & HANDOFF

## 19. `06_WORK/`

Recommended structure:

```text
06_WORK/
├── Active/
├── Work Records/
├── Work Items/
└── Handoffs/
```

The active handoff remains at root:

```text
CURRENT_HANDOFF.md
```

Archived handoffs may live in:

```text
06_WORK/Handoffs/
```

---

## 20. Work Record Partitioning

If Work Records become numerous, they MAY be partitioned by year and month:

```text
06_WORK/Work Records/
└── 2026/
    ├── 08/
    ├── 09/
    └── ...
```

This is a physical scaling strategy only. IDs remain independent.

---

## 21. Active Work

`06_WORK/Active/` should remain small.

Completed records SHALL move or resolve into their permanent Work Record locations.

Brain Doctor should flag excessive stale content in Active.

---

# PART IX — PROJECT LEARNING

## 22. `07_KNOWHOW/`

Recommended structure:

```text
07_KNOWHOW/
├── Skills/
├── Procedures/
├── Patterns/
├── Antipatterns/
├── Shortcuts/
├── Lessons/
├── Failures/
└── Workarounds/
```

This area stores Leyforge's reusable operational memory.

The purpose is to prevent rediscovery of good techniques, bad techniques, safe shortcuts, temporary fixes and known failure modes.

---

## 23. Knowhow Navigation

The Skills Index should prioritise:

- validated Skills;
- frequently reused Procedures;
- active Workarounds;
- high-impact Antipatterns;
- newly promoted Lessons.

Deprecated or rejected knowledge remains searchable but excluded from default current views.

---

# PART X — RESEARCH

## 24. `08_RESEARCH/`

Recommended structure:

```text
08_RESEARCH/
├── Research/
├── Sources/
├── Findings/
├── Experiments/
└── Historical/
```

Research records should remain distinct from project authority.

---

## 25. External Source Storage

Source proxies should contain:

- title;
- publisher;
- publication date if known;
- access date;
- URL or repository reference;
- source class;
- reliability/context notes where useful.

The Brain SHALL avoid storing unnecessary full copies of external copyrighted material.

---

# PART XI — IMPLEMENTATION

## 26. `09_IMPLEMENTATION/`

Recommended structure:

```text
09_IMPLEMENTATION/
├── Modules/
├── Migrations/
├── Repository Maps/
├── Traceability/
└── Generated Maps/
```

Contains implementation-module records, migration records, repository mapping and implementation traceability views.

---

## 27. Repository Maps

Repository maps MAY provide high-level paths such as:

```text
System
→ implementation module
→ repository path
```

They SHALL not attempt to mirror the entire code tree as Markdown.

---

# PART XII — TESTING & EVIDENCE

## 28. `10_TESTING/`

Recommended structure:

```text
10_TESTING/
├── Tests/
├── Evidence/
├── Benchmarks/
├── Bugs/
└── Acceptance/
```

Tests define validation.

Evidence records executions and observations.

Benchmarks record performance-specific evidence.

Bugs track defects requiring persistence.

---

## 29. Evidence Attachments

Large evidence artifacts SHOULD generally live in `82_ATTACHMENTS/` or elsewhere in the project repository and be linked from Evidence records.

Examples include screenshots, profiler captures, log excerpts, exported reports and diagrams.

---

# PART XIII — AUDIT

## 30. `11_AUDIT/`

Recommended structure:

```text
11_AUDIT/
├── V1/
├── Authority/
├── Completeness/
├── Consistency/
├── Traceability/
├── Registries/
├── Certification/
└── Brain Health/
```

Branch C will govern the V1 audit process.

This folder stores Brain audit records and derived audit views.

---

# PART XIV — REQUIREMENTS

## 31. `12_REQUIREMENTS/`

Recommended structure:

```text
12_REQUIREMENTS/
├── Gameplay/
├── Engineering/
├── Performance/
├── Persistence/
├── Accessibility/
├── Compatibility/
├── Tooling/
├── Production/
└── Governance/
```

This contains independently traceable Requirement records.

Not every source sentence becomes a Requirement.

---

# PART XV — RISKS & CONFLICTS

## 32. `13_RISKS_AND_CONFLICTS/`

Recommended structure:

```text
13_RISKS_AND_CONFLICTS/
├── Risks/
├── Conflicts/
└── Deviations/
```

This keeps unresolved project-control concerns highly visible.

---

# PART XVI — BASES

## 33. `80_BASES/`

Purpose:

Store Obsidian Bases used as dynamic structured views.

Candidate Bases:

```text
80_BASES/
├── Systems.base
├── Documents.base
├── Decisions.base
├── Current Work.base
├── Skills.base
├── Research.base
├── Tests.base
├── Risks.base
├── Conflicts.base
├── Audit.base
└── Brain Health.base
```

Exact extension and format SHALL follow the Obsidian version used during implementation.

---

## 34. Base Authority

Bases are query/view definitions.

They SHALL NOT become authoritative storage for project facts.

The facts remain in Markdown properties and linked project records.

This preserves portability.

---

## 35. Base Failure Behaviour

If Obsidian Bases become unavailable, underlying Brain records SHALL remain readable and usable.

Important workflows SHALL be recoverable through Markdown indexes, search, CLI or Brain scripts.

---

# PART XVII — CANVAS

## 36. `81_CANVAS/`

Purpose:

Store curated visual architecture and relationship diagrams.

Candidate Canvases:

```text
81_CANVAS/
├── Project Control Layer.canvas
├── Document Authority Map.canvas
├── Runtime Architecture.canvas
├── Forge Architecture.canvas
├── Worldgen Architecture.canvas
├── Persistence Architecture.canvas
└── Production Flow.canvas
```

Canvas is for deliberate visual maps.

The global Obsidian Graph SHALL NOT replace curated architecture diagrams.

---

## 37. Canvas Authority

Canvas files are visualisations.

Unless explicitly declared otherwise, they are derived representations.

They SHALL link back to controlling Brain records and authorities.

---

# PART XVIII — ATTACHMENTS

## 38. `82_ATTACHMENTS/`

Recommended structure:

```text
82_ATTACHMENTS/
├── Images/
├── Diagrams/
├── Evidence/
└── Other/
```

Attachments SHOULD be kept out of note folders to prevent navigation clutter.

---

## 39. Large Attachment Rule

Large binaries, source assets, builds, videos or other heavy project files SHALL NOT be copied into the Brain merely for convenience.

Where such artifacts already live elsewhere in Leyforge, Brain records should link to them.

---

## 40. Attachment Naming

Avoid names such as:

```text
image1.png
new_final2.png
```

Prefer meaningful names such as:

```text
EVID-0201_Worldgen_Profile.png
ARCH-SAVE-Pipeline_Diagram.svg
```

where practical.

---

# PART XIX — TEMPLATES

## 41. `90_TEMPLATES/`

Purpose:

Store canonical Markdown templates used to create Brain records.

Candidate templates include:

```text
System.md
Entity.md
Document.md
Requirement.md
Architecture.md
Interface.md
ADR.md
Decision.md
Work Record.md
Handoff.md
Skill.md
Procedure.md
Pattern.md
Antipattern.md
Shortcut.md
Lesson.md
Failure.md
Workaround.md
Research.md
Experiment.md
Test.md
Evidence.md
Benchmark.md
Bug.md
Risk.md
Conflict.md
Audit.md
Deviation.md
```

Templates SHALL follow LF-BRAIN-04.

---

# PART XX — SCHEMA

## 42. `91_SCHEMA/`

Purpose:

Store machine-readable Brain schema definitions and schema-support files.

Candidate structure:

```text
91_SCHEMA/
├── brain.schema.json
├── common.schema.json
├── record-types/
└── migrations/
```

The final split SHALL favour maintainability over excessive file count.

---

# PART XXI — SCRIPTS

## 43. `92_SCRIPTS/`

Purpose:

Store Leyforge Brain-owned scripts.

Candidate tools include:

```text
brain-doctor
brain-index
brain-ingest
brain-query
brain-migrate
brain-link-check
brain-id-check
```

Scripts SHALL follow Branch B engineering governance.

They MAY validate metadata, detect duplicate IDs, generate indexes, query records, update derived views, ingest authoritative sources, detect stale records, validate links, migrate schema and check traceability.

They SHALL NOT silently rewrite project authority.

---

# PART XXII — INBOX

## 44. `98_INBOX/`

Purpose:

Temporary intake for unclassified or not-yet-promoted information.

The rule is:

> **Inbox is a queue, not storage.**

Brain Doctor should eventually flag stale Inbox entries.

Every Inbox record should eventually be promoted, merged, rejected, archived or deleted if truly disposable.

---

# PART XXIII — ARCHIVE

## 45. `99_ARCHIVE/`

Recommended structure:

```text
99_ARCHIVE/
├── Brain/
├── Work/
├── Research/
├── Historical Maps/
└── Other/
```

Archive is a physical navigation decision.

Supersession is semantic state.

The two SHALL remain distinct.

---

# PART XXIV — `.obsidian/` POLICY

## 46. `.obsidian/`

The Obsidian configuration directory SHALL exist inside the Brain vault:

```text
brain/.obsidian/
```

Project-relevant configuration MAY be committed to Git.

Device and session-specific volatile state SHOULD be excluded.

---

## 47. Project Configuration

Candidate committed configuration includes:

- core plugin configuration;
- template folder configuration;
- attachment folder configuration;
- editor/project behaviour needed for consistent Brain use;
- safe project-relevant settings.

The exact file list SHALL be verified against the Obsidian version used during Codex implementation.

---

## 48. Volatile Workspace State

Files equivalent to:

```text
.obsidian/workspace.json
.obsidian/workspace-mobile.json
```

SHOULD be ignored where present.

Additional device-specific or session-specific files may be excluded after implementation inspection.

---

## 49. No Secret Storage

The Brain and `.obsidian/` SHALL NOT contain passwords, API keys, access tokens, personal credentials or private authentication secrets.

Secrets belong in approved secure mechanisms outside versioned Brain content.

---

# PART XXV — GIT POLICY

## 50. Same Root Repository

The Brain SHALL use the existing Leyforge root Git repository.

A nested Brain Git repository is prohibited.

Preferred:

```text
Leyforge/
├── .git/
└── brain/
```

---

## 51. Git and Brain Roles

Git provides change history, branch integration, review, rollback, attribution and historical comparison.

The Brain provides meaning, authority, work context, decisions and traceability.

These systems complement one another.

---

## 52. Sync Warning

Git SHALL not automatically be treated as real-time multi-device sync.

If mobile or multi-device sync is introduced later, Leyforge SHALL choose one deliberate strategy and avoid simultaneous competing sync mechanisms that can create races or conflicts.

---

# PART XXVI — NAVIGATION MODEL

## 53. Human Entry Flow

Recommended human flow:

```text
HOME
 ↓
Current Work / Project State
 ↓
Relevant Index
 ↓
Target Record
 ↓
Authority / implementation / evidence
```

---

## 54. Agent Entry Flow

Required conceptual agent flow:

```text
AGENTS.md
 ↓
HOME.md
 ↓
CURRENT_HANDOFF.md
 ↓
Relevant Index
 ↓
Relevant record(s)
 ↓
Authority pointers
 ↓
Authoritative source
 ↓
Applicable decisions / knowhow / tests
```

Agents SHALL NOT begin significant work by indiscriminately scanning the entire vault.

---

## 55. Broad Search as Fallback

Full-vault search is allowed when indexes fail, a record is unknown, deliberate discovery is required, audit/coverage work is underway, or Brain navigation is being repaired.

Broad search is a fallback, not the normal entry path.

---

# PART XXVII — NAVIGATION DEPTH

## 56. Shallow Navigation Goal

Important active knowledge SHOULD generally be reachable from HOME within approximately three meaningful navigation steps.

This is a usability target rather than a strict machine rule.

---

## 57. Avoid Folder Tunnelling

Overly deep trees are discouraged.

Prefer shallow folders plus metadata and typed relationships.

---

# PART XXVIII — NAMING STANDARD

## 58. Folder Names

Top-level numbered folder names SHALL remain stable after Brain v0.1 certification unless changed through controlled migration.

Subfolder names may evolve where required.

---

## 59. Human-Readable Filenames

Filenames SHOULD use readable names.

Sequential records SHOULD normally include ID:

```text
ADR-0014 Save Boundary.md
SKILL-0027 Registry Identity Projection.md
```

---

## 60. Prohibited Filename Practices

Avoid:

```text
final.md
final-final.md
new.md
copy.md
notes.md
misc.md
untitled.md
temp2.md
```

Formal identity belongs in metadata and stable filenames.

---

# PART XXIX — LINKS

## 61. Stable-ID Relationships vs Wikilinks

Metadata relationships SHALL reference stable IDs.

Markdown bodies MAY use Obsidian wikilinks for human navigation.

Example:

```yaml
depends_on:
  - SYS-INVENTORY
```

Body:

```markdown
See [[Inventory System]].
```

This gives both machine stability and readable navigation.

---

# PART XXX — GRAPH USE

## 62. Global Graph

The global Obsidian Graph is optional exploratory tooling.

It SHALL NOT be the primary project-navigation system.

---

## 63. Local Graph

Local Graph MAY be useful for one System, Entity, ADR, Requirement or Conflict.

Focused local relationships are preferred over a full-vault spiderweb.

---

# PART XXXI — BASES AS DASHBOARDS

## 64. Preferred Dynamic Views

Bases should eventually support views such as:

```text
All active Systems
All certified Documents
All unresolved Conflicts
All active Risks
All validated Skills
All active Work
All Requirements missing Tests
All current Bugs
All superseded ADRs
```

Every critical Base-backed view SHALL have a conceptual fallback through Markdown indexes, CLI, scripts or search.

---

# PART XXXII — PERFORMANCE & SCALE

## 65. Avoid Giant Markdown Monoliths

The Brain SHALL NOT create giant files containing the entire project knowledge corpus.

Examples prohibited:

```text
ALL_LEYFORGE_KNOWLEDGE.md
EVERY_SYSTEM.md
COMPLETE_CANON_COPY.md
```

Large-scale knowledge SHALL be distributed across modest records connected by indexes and relationships.

---

## 66. File Size Discipline

No arbitrary hard line-count limit is required.

A record should be split when it contains multiple independently retrievable concepts, independent lifecycle becomes useful, authority diverges, repeated linking to subsections becomes common, or editing/rendering performance degrades.

---

# PART XXXIII — GENERATED NAVIGATION

## 67. Generated Sections

Indexes MAY contain generated sections surrounded by machine-owned boundaries.

The generator SHALL preserve authored sections outside those boundaries.

---

## 68. Whole-File Generated Records

If an entire file is generated, metadata SHALL identify:

```yaml
information_class: generated
edit_policy: do_not_edit
```

---

# PART XXXIV — INITIAL BOOTSTRAP ORDER

## 69. Codex Construction Order

During Pre-Production Infrastructure setup, Codex SHOULD create the Brain approximately in this order:

```text
1. brain/ root
2. .obsidian/ baseline configuration
3. root entry files
4. top-level folders
5. schema directory
6. templates
7. indexes
8. Bases
9. Canvas placeholders where justified
10. scripts / Brain Doctor
11. initial authoritative document proxies
12. initial System records
13. current Work/Handoff state
14. pilot data
15. validation
```

The exact implementation sequence may change if Branch B engineering governance requires a better dependency order.

---

# PART XXXV — INITIAL INGESTION BOUNDARY

## 70. Do Not Import Everything Immediately

The initial Brain SHALL NOT attempt to ingest every historical Leyforge file at once.

Initial ingestion should prioritise:

- current control documents;
- Branch A–D governance;
- current authoritative document register;
- active FCC/PRD material;
- current engine/architecture decisions;
- current registry authority;
- active requirements;
- current testing authority;
- current production status.

Historical and legacy information can follow in controlled passes.

---

# PART XXXVI — BRAIN HEALTH

## 71. Navigation Health Checks

Brain Doctor should eventually detect:

- orphan significant records;
- broken root links;
- missing expected indexes;
- stale Current Handoff;
- invalid top-level placement where policy requires;
- stale Inbox;
- empty required indexes;
- missing canonical paths;
- generated index drift;
- duplicate primary records.

---

# PART XXXVII — ARCHITECTURAL LAWS

## 72. Vault Architecture Laws

The following laws are provisionally established:

1. The Brain lives at `Leyforge/brain/`.
2. Only `brain/` is opened as the Obsidian Vault.
3. The Brain uses the existing root Git repository.
4. No nested Brain Git repository is permitted.
5. Root-level files remain intentionally minimal.
6. HOME, AGENTS and CURRENT_HANDOFF are primary entry points.
7. Numbered top-level folders provide deterministic order.
8. Folder placement does not define semantic type.
9. Stable IDs and metadata define identity.
10. Indexes provide hierarchical navigation.
11. Agents prefer indexes over broad vault scans.
12. Bases provide dynamic views but not authoritative storage.
13. Canvas provides curated visualisation but not independent authority.
14. Global Graph is exploratory, not primary navigation.
15. Attachments are separated from note folders.
16. Large project binaries should remain outside the Brain where already stored elsewhere.
17. Community-plugin-specific storage is not required for Brain v0.1.
18. Project-relevant `.obsidian/` configuration may be versioned.
19. Volatile workspace/session state should be ignored.
20. Secrets must never be committed inside the Brain.
21. Inbox is temporary intake, not long-term storage.
22. Archive location and semantic supersession are distinct.
23. Giant Markdown knowledge monoliths are prohibited.
24. Initial ingestion is selective and authority-first.
25. The vault must remain usable even if Obsidian-specific dynamic views are unavailable.

---

## 73. Canonical Brain v0.1 Layout

The current target physical layout is:

```text
brain/
│
├── HOME.md
├── AGENTS.md
├── CURRENT_HANDOFF.md
│
├── 00_CONTROL/
├── 01_INDEXES/
├── 02_ENTITIES/
├── 03_ARCHITECTURE/
├── 04_DOCUMENTS/
├── 05_DECISIONS/
├── 06_WORK/
├── 07_KNOWHOW/
├── 08_RESEARCH/
├── 09_IMPLEMENTATION/
├── 10_TESTING/
├── 11_AUDIT/
├── 12_REQUIREMENTS/
├── 13_RISKS_AND_CONFLICTS/
│
├── 80_BASES/
├── 81_CANVAS/
├── 82_ATTACHMENTS/
├── 90_TEMPLATES/
├── 91_SCHEMA/
├── 92_SCRIPTS/
├── 98_INBOX/
├── 99_ARCHIVE/
│
└── .obsidian/
```

This layout SHALL be treated as the current Branch A design baseline.

Subordinate documents may refine internal folder content without changing the top-level architecture unless a formal amendment is made.

---

## 74. Status

This document establishes the canonical physical vault and navigation design for Leyforge Brain v0.1.

It has been reconciled with operational records, learning, decisions, agent behaviour, validation, automation, ingestion and pilot requirements. Engineering ADR storage remains subordinate to Branch B's canonical ADR-location decision if Branch B places ADR authority outside the Brain.

This document is **LOCKED as the controlling physical architecture and navigation standard for the Leyforge Project Brain**.
