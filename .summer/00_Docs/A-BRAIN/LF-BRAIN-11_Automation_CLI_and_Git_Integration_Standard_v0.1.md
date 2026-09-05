# LEYFORGE PROJECT BRAIN
## Automation, CLI & Git Integration Standard

**Document ID:** LF-BRAIN-11  
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

**Purpose:** Define the automation architecture, official Obsidian CLI role, Leyforge-owned Brain tooling, generated-content rules, Git integration, CI behaviour, migration automation, local/headless boundaries and safe automation constraints for Leyforge Brain v0.1.

---

## 1. Purpose

The Leyforge Project Brain is intended to reduce repeated manual maintenance without surrendering project truth to opaque automation.

Automation should make the Brain:

- easier to update;
- faster to navigate;
- harder to corrupt;
- easier to validate;
- easier for Codex and humans to use;
- more traceable;
- less repetitive;
- independent of manual dashboard upkeep.

However, automation SHALL remain subordinate to:

- authority;
- schema;
- governance;
- evidence;
- explicit project state.

The automation system must never create the appearance of correctness by silently rewriting reality.

---

## 2. Core Automation Principle

The preferred automation hierarchy is:

```text
1. Plain Markdown / YAML / JSON / filesystem
        ↓
2. Leyforge-owned deterministic Brain tooling
        ↓
3. Official Obsidian CLI for local Obsidian integration
        ↓
4. Obsidian core features
        ↓
5. Community plugin only if a demonstrated requirement remains
```

The ordering is about dependency safety, not user-interface preference.

The Brain SHALL remain operational without community plugins.

---

## 3. Durable System Boundary

The durable Brain exists in repository files.

Conceptually:

```text
Markdown / YAML / JSON
        ↓
source data

Leyforge Brain scripts
        ↓
headless validation / generation / migration

Official Obsidian CLI
        ↓
local Obsidian-aware interaction

Obsidian
        ↓
human interface

Git
        ↓
history / review / rollback
```

No essential project truth SHALL exist only in an automation cache, GUI state or plugin database.

---

# PART I — OFFICIAL OBSIDIAN CLI ROLE

## 4. Official CLI Status

As of the Brain v0.1 design baseline, Obsidian provides an official command-line interface capable of terminal-based control and automation.

The implementation stage SHALL verify the exact installed Obsidian version and current CLI contract before relying on specific commands.

---

## 5. CLI Installation Baseline

The current official CLI requires the Obsidian 1.12 installer generation, with current documentation specifying installer version 1.12.7 or later.

Codex SHALL verify the actual installed version during pre-production setup rather than assuming this design-time version remains current.

---

## 6. Running-App Dependency

The official Obsidian CLI currently connects to a running Obsidian application.

If Obsidian is not running, the first CLI command may launch it.

Therefore:

> **The official Obsidian CLI SHALL NOT be the sole foundation of headless validation or CI.**

CI, Brain Doctor and repository-critical automation SHALL operate directly on durable Brain files through Leyforge-owned tooling.

---

## 7. Appropriate CLI Uses

The official CLI is suitable for local tasks such as:

- search;
- file read;
- file creation;
- append/prepend;
- file move/rename;
- listing files/folders;
- reading/writing Properties;
- link inspection;
- unresolved-link inspection;
- orphan/dead-end discovery;
- querying Bases;
- creating records from templates;
- viewing local file history;
- diffing/restoring File Recovery versions;
- executing Obsidian commands;
- inspecting plugin state;
- checking restricted mode;
- local development diagnostics.

---

## 8. CLI Base Queries

The CLI may query Obsidian Bases and return structured output such as:

```text
json
csv
tsv
md
paths
```

This makes Bases useful as local human/agent query surfaces.

However, critical project automation SHALL not require a Base to be open or Obsidian to be running.

---

## 9. CLI File Operations

The CLI may be used locally for:

- create;
- read;
- append;
- prepend;
- rename;
- move;
- delete;
- file/folder listing.

Agents SHALL still obey:

- stable ID rules;
- generated-file ownership;
- archive policy;
- authority boundaries;
- Branch B repository governance.

Availability of a command does not imply permission to use it destructively.

---

## 10. CLI Property Operations

Where safe, local automation MAY use official property commands to:

- read Properties;
- set Properties;
- remove Properties.

Schema validation SHALL still occur through Brain tooling.

Obsidian property support is an editing interface, not the source of schema authority.

---

## 11. CLI Link Diagnostics

Official link commands MAY supplement Brain Doctor by providing:

- backlinks;
- outgoing links;
- unresolved links;
- orphan detection;
- dead-end detection.

Brain Doctor SHALL still own project-semantic interpretation of those results.

An Obsidian orphan is not automatically a Leyforge-invalid record.

---

## 12. CLI File History

Local Obsidian File Recovery history MAY be inspected through CLI diff/history commands.

This is useful for accidental local editing recovery.

Git remains the project-level authoritative version history.

File Recovery SHALL not replace Git.

---

# PART II — LEYFORGE-OWNED BRAIN TOOLING

## 13. Brain-Owned Tooling Is the Headless Foundation

Leyforge-owned Brain tooling SHALL provide all automation required for:

- CI;
- validation;
- schema migration;
- index generation;
- traceability;
- ID validation;
- authority validation;
- generated-record production;
- repository integration.

These tools SHALL operate without Obsidian.

---

## 14. Initial Tool Family

Candidate Brain tools:

```text
brain-doctor
brain-index
brain-query
brain-ingest
brain-migrate
brain-id
brain-links
brain-trace
brain-generate
brain-impact
```

The actual command names may be refined under Branch B engineering governance.

---

## 15. `brain-doctor`

Defined by LF-BRAIN-10.

Responsibilities include:

- structural validation;
- diagnostics;
- certification checks;
- health reporting.

---

## 16. `brain-index`

Responsible for deterministic generation or refresh of machine-owned Index sections and lookup artifacts.

It SHALL not invent semantic relationships.

---

## 17. `brain-query`

Provides headless queries over Brain metadata.

Potential filters:

```text
type
status
authority_domain
entity_class
system
source_of_truth
updated
```

Output SHOULD support machine-readable and human-readable formats.

---

## 18. `brain-ingest`

Supports controlled conversion of existing project sources into Brain proxies, indexes and traceability records.

It SHALL obey LF-BRAIN-12.

Ingestion SHALL not silently reinterpret source authority.

---

## 19. `brain-migrate`

Executes approved Brain schema migrations.

It SHALL require:

- migration definition;
- source schema version;
- target schema version;
- deterministic transformation;
- validation;
- Work Record.

---

## 20. `brain-id`

May support:

- next sequential ID;
- uniqueness check;
- family validation;
- reservation where required.

It SHALL never reuse retired IDs.

---

## 21. `brain-links`

May provide direct filesystem-based analysis of:

- stable-ID relationships;
- wikilinks;
- broken relationships;
- backlinks;
- orphan candidates.

It SHALL not depend on Obsidian's index.

---

## 22. `brain-trace`

May answer traceability questions such as:

```text
Requirement → Implementation → Test → Evidence
System → Authority → ADR → Module
Entity → Canon → Registry → Test
```

---

## 23. `brain-impact`

May analyse changed files and report potentially affected Brain records.

Example:

```text
registry schema changed
        ↓
affected:
REG records
Architecture records
Migration requirements
Tests
Document proxies
```

Impact analysis is advisory unless a governing rule makes a specific result blocking.

---

# PART III — AUTOMATION CLASSES

## 24. Deterministic Automation

Deterministic automation produces the same output from the same inputs.

Examples:

- ID uniqueness checks;
- index generation;
- schema validation;
- counts;
- relationship maps;
- content hashes;
- status filtering.

Deterministic automation is preferred for infrastructure.

---

## 25. Semantic Automation

Semantic automation uses interpretation.

Examples:

- proposing a Skill;
- suggesting duplicate concepts;
- classifying a source;
- identifying likely affected systems;
- summarising a document.

Semantic automation MAY assist.

It SHALL not silently promote interpretation into authority.

---

## 26. Generative Automation

AI-generated project content SHALL be treated according to LF-BRAIN-09.

Generated proposals require:

- provenance;
- status;
- authority discipline;
- verification where applicable.

---

# PART IV — GENERATED FILE CONTRACT

## 27. Whole-File Generated Content

A fully generated Brain record SHALL declare:

```yaml
information_class: generated
generator:
generation_version:
generated_at:
edit_policy: do_not_edit
```

---

## 28. Generated Sections

Hybrid files MAY contain machine-owned sections.

Recommended markers:

```markdown
<!-- GENERATED: START <section-id> -->

...machine output...

<!-- GENERATED: END <section-id> -->
```

Agents and humans SHALL not manually edit content inside generated boundaries unless the generator contract allows it.

---

## 29. Authored Sections

Authored content outside generated boundaries SHALL be preserved during regeneration.

A generator that destroys authored sections is invalid.

---

## 30. Generated Content Source Declaration

Generated outputs SHOULD identify source inputs through metadata or reproducible configuration.

Examples:

```yaml
generated_from:
  - SYS-SETTLEMENT
  - REQ-0012
```

---

## 31. Generated Output Fingerprints

Where useful, generated output MAY include:

- source hash;
- generator version;
- generation timestamp.

Brain Doctor may use these to detect stale output.

---

# PART V — DERIVED DATA

## 32. Derived Values

Values that can be calculated reliably SHOULD be derived rather than manually maintained where practical.

Examples:

- reuse count;
- number of unresolved Conflicts;
- Requirement coverage;
- active Work count;
- stale Inbox count;
- backlinks;
- traceability completeness.

---

## 33. Avoid Dual Maintenance

The Brain SHOULD avoid:

```text
manual value
+
generated value
```

representing the same fact.

Choose one source.

---

# PART VI — INDEX GENERATION

## 34. Index Generation Model

Indexes may contain:

- authored introduction;
- authored navigation notes;
- generated current lists.

Example:

```markdown
# Systems Index

Human-maintained explanation.

<!-- GENERATED: START active-systems -->
...
<!-- GENERATED: END active-systems -->
```

---

## 35. Generated Index Sorting

Sorting SHALL be deterministic.

Potential ordering:

```text
status
class
title
stable ID
```

The exact view determines the sort policy.

---

## 36. Missing Records

Index generation SHALL not fabricate placeholder records solely to make an Index appear complete.

Missing coverage should be reported.

---

# PART VII — GIT INTEGRATION

## 37. One Repository

The Brain SHALL remain part of the existing root Leyforge Git repository.

No nested Brain repository.

---

## 38. Git Roles

Git provides:

- immutable-ish change history;
- branch comparison;
- review;
- rollback;
- merge;
- authorship;
- commit identity.

The Brain adds project meaning and relationships.

---

## 39. Significant Brain Changes

Significant Brain changes SHOULD be committed with enough context to identify:

- Work Record;
- ADR/DEC;
- migration;
- audit;
- issue/bug;

where Branch B requires or recommends it.

---

## 40. Git Commit Hashes in Brain

Evidence, Benchmarks, Work and migration records MAY record commit hashes where exact source state matters.

Example:

```yaml
commit:
  - abc123...
```

---

## 41. Do Not Over-Couple Brain IDs to Git

Stable Brain IDs SHALL remain valid independent of:

- branch;
- commit;
- repository clone;
- file history.

---

# PART VIII — `.gitignore` POLICY

## 42. Brain Files Are Versioned by Default

Brain Markdown, schema, templates, Bases, Canvas files and project-owned scripts SHOULD generally be versioned.

---

## 43. Volatile Obsidian State

Device/session-specific Obsidian state SHOULD be ignored.

Expected candidates include workspace state files such as:

```text
brain/.obsidian/workspace.json
brain/.obsidian/workspace-mobile.json
```

The exact ignore list SHALL be generated only after inspecting the installed Obsidian version.

---

## 44. Caches

Brain tooling caches SHALL normally be ignored unless intentionally versioned fixtures.

Example:

```text
brain/.cache/
```

or final implementation equivalent.

---

## 45. Generated Outputs

Generated outputs MAY be:

- committed;
- ignored and regenerated;
- mixed by type.

The decision SHALL be explicit per generator.

---

## 46. Committed Generated Outputs

Commit generated outputs when they are useful for:

- human navigation without tooling;
- review;
- historical traceability;
- offline use;
- deterministic diffs.

---

## 47. Ignored Generated Outputs

Ignore generated outputs when they are:

- large;
- disposable;
- trivial to reproduce;
- cache-like;
- noisy;
- not useful to review.

---

# PART IX — CI INTEGRATION

## 48. CI Is Headless

CI SHALL NOT require:

- Obsidian GUI;
- active vault session;
- official Obsidian CLI connection.

CI operates directly on repository files through Brain-owned tooling.

---

## 49. CI Validation

Depending on Branch B governance, Brain-affecting changes SHOULD run:

```text
brain-doctor quick/standard
schema tests
ID uniqueness
link/reference checks
generated-output drift
migration checks
```

---

## 50. Strict CI Gates

Major merges or production gates MAY require:

```text
brain-doctor strict
```

or equivalent.

---

## 51. Certification CI

Pre-production certification SHALL run:

```text
brain-doctor certification
```

plus any Branch B/Branch C/Branch D required gates.

---

# PART X — CHANGED-FILE IMPACT

## 52. Changed-File Detection

Git diff MAY be used to identify changed Brain or project files.

Automation MAY then calculate impacted records.

---

## 53. Impact Categories

Potential categories:

```text
authority impact
requirement impact
architecture impact
registry impact
implementation impact
test impact
evidence impact
documentation impact
Brain schema impact
```

---

## 54. Impact Analysis Is Conservative

Where uncertainty exists, automation SHOULD over-report possible impact rather than silently under-report.

It SHOULD still avoid useless noise.

---

# PART XI — GIT HOOKS

## 55. Local Hooks

Local Git hooks MAY be used for fast checks such as:

- schema validation;
- ID uniqueness;
- generated drift;
- prohibited secrets.

Branch B SHALL determine hook policy.

---

## 56. Hooks Are Not Sole Enforcement

Critical validation SHALL also run in CI.

Local hooks can be bypassed or absent.

---

# PART XII — MIGRATION AUTOMATION

## 57. Migration Requirements

A Brain schema migration SHALL be deterministic where practical.

Required workflow:

```text
Migration approved
      ↓
backup through Git
      ↓
migration tool
      ↓
Brain Doctor
      ↓
diff review
      ↓
commit
```

---

## 58. Dry Run

Migration tooling SHOULD support a dry-run mode.

Dry run should report:

- affected files;
- field changes;
- errors;
- unresolved transformations.

---

## 59. No Guessing During Migration

If data cannot be migrated deterministically:

```text
STOP / FLAG
```

Do not invent values.

The migration may produce:

- Conflict;
- Inbox item;
- unresolved marker;
- manual migration queue.

---

# PART XIII — INGESTION AUTOMATION

## 60. Ingest Is Not Copy-All

`brain-ingest` SHALL not indiscriminately copy source documents into the Brain.

It should create or update:

- Document proxies;
- source metadata;
- relationships;
- authority pointers;
- traceability records;
- candidate classifications.

---

## 61. Source Fidelity

Automated ingestion SHALL preserve:

- source identity;
- version;
- canonical path;
- authority status where known;
- supersession;
- provenance.

---

## 62. Semantic Extraction

AI-assisted extraction MAY propose:

- systems;
- entities;
- requirements;
- relationships;
- conflicts.

These proposals SHALL be validated before becoming protected project truth.

---

# PART XIV — QUERY ARCHITECTURE

## 63. Three Query Layers

The Brain SHOULD support three query layers:

```text
Obsidian Bases / Search
→ human interactive views

Official Obsidian CLI
→ local terminal interaction

brain-query
→ headless project-semantic querying
```

---

## 64. Headless Query Authority

`brain-query` SHALL query the actual repository files.

It SHALL not depend on Obsidian's internal cache.

---

# PART XV — OBSIDIAN BASES AUTOMATION

## 65. Bases as Views

Obsidian Bases MAY display:

- Systems;
- Documents;
- Skills;
- Work;
- Risks;
- Conflicts;
- Tests;
- Audit state.

Bases operate over Markdown files and Properties.

---

## 66. Base Files Are Versionable View Definitions

`.base` files MAY be committed where useful.

They remain view/configuration artifacts rather than data authority.

---

## 67. CLI Base Query

Local automation MAY query a Base through the official CLI for convenient structured output.

The same critical information SHALL remain queryable headlessly from repository files.

---

# PART XVI — OBSIDIAN FILE HISTORY

## 68. File Recovery

Obsidian File Recovery MAY provide local recovery for accidental note edits.

---

## 69. Git Remains Primary Project History

File Recovery is:

```text
local convenience
```

Git is:

```text
project history
```

They serve different roles.

---

# PART XVII — PLUGIN AUTOMATION POLICY

## 70. Community Plugins Are Not Automation Foundation

Brain v0.1 SHALL not depend on community plugins for:

- Git;
- schema validation;
- query;
- index generation;
- agent access;
- CI;
- core automation.

---

## 71. Future Plugin Adoption

If a genuine requirement emerges:

```text
Need
↓
Check Obsidian core
↓
Check official CLI
↓
Check Brain-owned tooling
↓
Evaluate plugin
↓
Security / maintenance / portability review
↓
Decision
```

---

## 72. Plugin State Inspection

The official CLI may inspect installed/enabled plugins and restricted mode locally.

Brain Doctor MAY use this capability in local certification.

Headless certification SHALL also have a repository-level policy check where relevant.

---

# PART XVIII — RESTRICTED MODE

## 73. Initial Policy

Brain v0.1 SHOULD operate with community plugins disabled / Restricted Mode active unless an approved exception exists.

---

## 74. Drift Detection

Local setup validation SHOULD detect unexpected community plugin enablement where possible.

---

# PART XIX — AUTOMATION LOGGING

## 75. Meaningful Automation Logging

Automation SHOULD record:

- command/tool;
- version;
- result;
- changed files;
- diagnostic summary.

It SHALL not flood the Brain with low-value execution logs.

---

## 76. Work Record Integration

Significant automated operations SHOULD be referenced from the relevant Work Record.

Examples:

- schema migration;
- mass ingestion;
- authority-map regeneration;
- certification run.

---

# PART XX — IDEMPOTENCE

## 77. Idempotent Generators

Generators SHOULD be idempotent where practical.

Running the same generator twice with unchanged inputs SHOULD not create meaningless diffs.

---

## 78. Stable Output

Generated ordering and formatting SHOULD remain stable.

This improves Git review.

---

# PART XXI — FAILURE BEHAVIOUR

## 79. Fail Closed for Destructive Operations

Automation performing destructive or authority-sensitive changes SHOULD stop on unresolved error rather than continuing with guesses.

---

## 80. Partial Failure

If a batch operation partially succeeds, tooling SHALL:

- report completed changes;
- report failures;
- avoid falsely declaring success;
- leave recovery path;
- preserve Git-reviewability.

---

# PART XXII — TRANSACTIONS & BACKUPS

## 81. Git as Safety Net

Large automated mutations SHOULD begin from a known clean or reviewable Git state.

---

## 82. Migration Checkpoint

Before mass migration/ingestion:

- record Work state;
- ensure Git diff is understood;
- create commit/checkpoint where Branch B requires.

---

# PART XXIII — CONCURRENCY

## 83. Concurrent Agents

Automation SHALL assume multiple agents may eventually operate on the repository.

Generated outputs SHOULD minimise shared mutable hotspots.

---

## 84. Locking

If tooling requires exclusive mutation of a shared registry/index, an explicit locking or conflict-detection mechanism MAY be implemented.

The exact method is Branch B engineering territory.

---

# PART XXIV — MOBILE / MULTI-DEVICE

## 85. Git Is Not Live Sync

The Brain SHALL not assume Git provides conflict-free live multi-device editing.

---

## 86. Future Sync Strategy

If mobile/multi-device Brain editing becomes required, a dedicated decision SHALL define:

- sync mechanism;
- conflict behaviour;
- Git relationship;
- authoritative device/session rules.

---

# PART XXV — SECURITY

## 87. Secrets

Automation SHALL not write secrets into versioned Brain files.

---

## 88. Command Injection

Brain tooling SHALL treat note content and metadata as untrusted input where commands/shell execution are involved.

Branch B security rules apply.

---

## 89. External Network Access

Brain automation requiring network access SHALL declare:

- purpose;
- destination/service;
- data transmitted;
- failure behaviour.

Core Brain validation SHOULD remain offline-capable.

---

# PART XXVI — TOOL VERSIONING

## 90. Brain Tool Versions

Brain-owned tooling SHALL be versioned.

Generated outputs SHOULD record generator version where required by LF-BRAIN-04.

---

## 91. Obsidian Version Recording

Pre-production certification SHOULD record the Obsidian version and installer/CLI version used to construct/test Brain v0.1.

This is environmental evidence, not permanent schema authority.

---

# PART XXVII — AUTOMATION TESTING

## 92. Tool Tests

Brain tooling SHALL be tested under Branch B governance.

Important areas include:

- parser;
- ID generation;
- index generation;
- migration;
- generated-boundary preservation;
- traceability;
- changed-file impact;
- failure recovery.

---

## 93. Golden Fixtures

Where useful, deterministic tools SHOULD use golden input/output fixtures.

---

## 94. Regression Tests

Automation defects SHOULD produce regression tests where practical.

---

# PART XXVIII — LOCAL DEVELOPER EXPERIENCE

## 95. Simple Commands

The final tooling SHOULD expose memorable commands.

Conceptual examples:

```text
brain doctor
brain doctor --strict
brain query ...
brain index
brain ingest ...
brain migrate ...
```

Exact CLI syntax is an implementation decision.

---

## 96. One Entry Point Preferred

Where practical, Brain tooling SHOULD use one command family rather than many unrelated scripts.

Example:

```text
brain doctor
brain index
brain query
```

is preferable to dozens of disconnected filenames.

---

# PART XXIX — CODEX USE

## 97. Codex Automation Role

During pre-production setup, Codex SHOULD:

- create the automation tooling;
- generate initial indexes;
- configure official CLI integration;
- configure `.gitignore`;
- establish validation commands;
- wire CI hooks;
- create migration framework;
- test deterministic generation;
- document local commands.

---

## 98. Codex Does Not Invent Authority

Automation setup SHALL not grant Codex permission to:

- rewrite canon;
- accept ADRs;
- silently resolve conflicts;
- change schema semantics;
- weaken validation gates.

---

# PART XXX — PRE-PRODUCTION BOOTSTRAP

## 99. Recommended Automation Bootstrap Sequence

```text
1. Confirm repository state
2. Confirm Obsidian installation/version
3. Enable/register official CLI if appropriate
4. Create Brain-owned tooling entry point
5. Implement schema parser
6. Implement stable ID index
7. Implement Brain Doctor core
8. Implement query layer
9. Implement index generation
10. Implement migration framework
11. Implement ingestion framework
12. Configure Git ignore rules
13. Configure local commands
14. Configure CI
15. Generate initial derived views
16. Run pilot
17. Run certification
```

---

# PART XXXI — CURRENT OBSIDIAN CAPABILITY BASELINE

## 100. Design-Time Verified Official Capabilities

At the time LF-BRAIN-11 v0.1 was drafted, official Obsidian documentation confirms CLI support for capabilities including:

- vault targeting;
- file and folder listing;
- file create/read/append/prepend;
- move/rename/delete;
- search;
- backlinks/outgoing links;
- unresolved links;
- orphans/dead ends;
- Properties read/write;
- Base listing/query/create;
- File Recovery history/diff/restore;
- command execution;
- plugin inspection;
- restricted-mode inspection.

These capabilities informed this architecture.

They SHALL be reverified during actual pre-production implementation because external tool interfaces may evolve.

---

## 100A. Design-Time Official References

The design-time Obsidian capability baseline was verified against:

- `https://obsidian.md/help/cli`
- `https://obsidian.md/help/bases`

These references are evidentiary implementation inputs, not Leyforge project authority. Current behaviour SHALL be reverified at implementation time.

---

# PART XXXII — FALLBACK PRINCIPLE

## 101. Obsidian Failure

If Obsidian is unavailable:

```text
Brain Doctor works
brain-query works
schema works
Git works
CI works
Markdown remains readable
```

Human GUI convenience may be reduced, but project integrity remains intact.

---

## 102. CLI Failure

If the official CLI changes or becomes unavailable, the Brain remains operational through repository files and Leyforge-owned tooling.

---

# PART XXXIII — AUTOMATION LAWS

## 103. Automation Laws

The following laws are provisionally established:

1. Plain repository files are the durable automation substrate.
2. Brain-owned tooling is the headless automation foundation.
3. Official Obsidian CLI is a local integration layer, not CI's sole dependency.
4. Critical Brain automation must work without Obsidian running.
5. Obsidian Bases are views, not unique data stores.
6. Community plugins are not required for Brain v0.1.
7. Deterministic automation is preferred for infrastructure.
8. Semantic automation may propose but must respect authority.
9. Generated content identifies generator ownership.
10. Machine-owned sections are protected from manual editing.
11. Authored sections must survive regeneration.
12. Derived values should not be manually duplicated where automation can calculate them.
13. Index generation must be deterministic.
14. Git and Brain operational memory serve different purposes.
15. Brain stable IDs do not depend on Git commit identity.
16. Volatile Obsidian workspace state should not be versioned.
17. Generated-output version-control policy is explicit per artifact.
18. CI is headless.
19. Critical validation runs outside the Obsidian GUI.
20. Local Git hooks supplement rather than replace CI.
21. Schema migrations are explicit and reviewable.
22. Migration tooling must not invent unresolved values.
23. Initial ingestion creates structured proxies and relationships, not a second copy of canon.
24. Query infrastructure has human, local-CLI and headless layers.
25. File Recovery supplements but does not replace Git.
26. Community plugin introduction requires a demonstrated need and explicit review.
27. Significant automation runs integrate with Work Records.
28. Generators should be idempotent and produce stable diffs.
29. Destructive automation fails closed on unresolved errors.
30. Batch failure must remain visible and recoverable.
31. Automation tooling itself is versioned and tested.
32. Core validation should remain offline-capable.
33. Codex may implement automation mechanics but may not weaken Brain governance.
34. External Obsidian capabilities are reverified at implementation time.
35. If Obsidian disappears, the Leyforge Brain still exists.

---

## 104. Status

This document establishes the Automation, CLI & Git Integration Standard for Leyforge Brain v0.1.

It has been reconciled with ingestion and certification requirements and with Branch B's ownership of repository, CI, Git and tooling implementation quality. The official Obsidian CLI capability baseline was reverified during the Branch A lock pass and remains subject to implementation-time revalidation.

This document is **LOCKED as the controlling Brain-domain authority for automation architecture, local Obsidian CLI integration, headless Brain tooling, Git integration and safe generated-content behaviour**.
