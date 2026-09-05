# ENG-GOV-02 — Leyforge Repository & Module Structure Standard

**Document ID:** ENG-GOV-02  
**Title:** Leyforge Repository & Module Structure Standard  
**Version:** v0.1  
**Status:** THEORETICALLY LOCKED  
**Authority Domain:** Engineering Governance — Repository & Module Structure  
**Parent Authority:** ENG-GOV-00 — Leyforge Engineering Constitution  
**Related Standard:** ENG-GOV-01 — Leyforge Codebase Engineering Standard  
**Project:** Leyforge

---

## 00. Purpose and Scope

ENG-GOV-02 defines how the Leyforge repository is organised so that code, tools, tests, schemas, generated artifacts, documentation, the Project Brain and third-party dependencies remain understandable, discoverable and structurally aligned with declared architecture.

This standard governs repository structure and module-boundary expression. It does not prematurely define the final V1 runtime module list. Exact subsystem boundaries remain subject to architecture-critical PRD, LFE and FORGE-ENG work.

---

## 01. Durable Engineering Workspace

### EG02-001 — The Git Repository Is the Durable Engineering Workspace

The repository should contain enough durable project information that a competent contributor or coding agent can understand and work on Leyforge without depending upon old chat history.

Where appropriate, the repository contains implementation, authoritative documents, the Project Brain, engineering governance, tests, tooling, schemas, migration definitions, build configuration, dependency records and agent instructions.

Temporary caches, machine-local state and disposable generated output do not belong merely because they exist during development.

## 02. Project Brain Placement

### EG02-002 — `brain/` Is a First-Class Repository Area

The Leyforge Obsidian Project Brain lives inside the repository as a first-class project area so Brain changes travel with Git history, branches, commits, releases and architecture evolution.

The Brain remains a knowledge, navigation and status system rather than becoming a second copy of authoritative canon or engineering standards.

## 03. Authoritative Documents and Brain Knowledge

### EG02-003 — Authoritative Documents and Brain Knowledge Must Be Structurally Distinguishable

Authoritative documents and Project Brain knowledge must not be mixed into one ambiguous corpus.

Conceptually:

```text
docs/
    authoritative project documents

brain/
    indexes
    navigation
    status
    work logs
    skills
    patterns
    antipatterns
    failures
    relationships
```

The Brain may link to authoritative documents but should not duplicate them unnecessarily.

## 04. Root-Directory Discipline

### EG02-004 — The Repository Root Must Remain Intentionally Small

The repository root is reserved for major entry points and project-wide infrastructure. Temporary scripts, backups, miscellaneous notes and unowned assets must not accumulate there.

A future root may contain entries such as `AGENTS.md`, `project.godot`, `brain/`, `docs/`, `game/`, `forge/`, `tests/`, `tools/`, `addons/`, `third_party/`, `schemas/`, `generated/` and `.github/`, but the exact final tree remains subject to architecture work.

## 05. Declared Purpose for Major Areas

### EG02-005 — Major Repository Areas Require Explicit Ownership Semantics

Every major top-level repository area should have an identifiable purpose, authority, inclusion rules, exclusion rules, generation status, runtime-shipping status and modification ownership.

A contributor should be able to determine why an area exists and what belongs there.

## 06. Architecture-Driven Structure

### EG02-006 — Repository Modules Follow Architectural Responsibility

Repository structure should primarily represent subsystem ownership and architectural responsibility rather than becoming one giant set of directories grouped only by file type.

Large generic `scripts/`, `scenes/` or `resources/` folders that erase subsystem ownership should be avoided where module-oriented organisation is practical.

## 07. Module-First Organisation

### EG02-007 — Cohesive Subsystem Assets Should Normally Remain Near Their Owning Module

Scripts, scenes, local resources, module-specific configuration and helpers that belong to one subsystem should normally remain near that subsystem instead of being scattered globally by extension.

This is particularly useful in Godot, where scripts, scenes and resources frequently form one semantic implementation unit.

## 08. Shared-Code Discipline

### EG02-008 — Generic Shared Areas Require Strong Justification

Directories named `common`, `shared`, `utils`, `helpers` or equivalents must not become default dumping grounds for code whose ownership is unclear.

A helper should normally remain with its owner until multiple legitimate consumers establish a real shared abstraction.

## 09. No Generic Manager Graveyard

### EG02-009 — Repository Structure Must Not Centralise Unrelated Systems by Naming Pattern

Directories must not exist merely to collect classes because they share suffixes such as `Manager`, `Controller`, `Provider` or `Processor`.

Folders should represent durable architectural responsibility, not naming fashion.

## 10. Module Contracts

### EG02-010 — Every Consequential Module Has a Declared Boundary

Important modules should eventually have discoverable information describing responsibility, authoritative state owned, public interfaces, permitted and forbidden dependencies, persistence implications, relevant tests, relevant diagnostics and governing architecture/canon.

The Project Brain may surface this information rather than duplicating it in every directory.

## 11. Machine-Visible Dependency Direction

### EG02-011 — Architectural Dependencies Should Eventually Be Statically Verifiable Where Feasible

Where LFE establishes dependency direction, the repository should support eventual tooling that detects prohibited dependencies or import relationships where practical.

Manual review may serve temporarily, with missing automation tracked as governance debt.

## 12. No Sideways Reach-Through

### EG02-012 — Modules Must Use Declared Interfaces Rather Than Internal Reach-Through

A module should consume another module through its public architectural surface rather than reaching into its internal implementation paths.

Repository structure should reinforce this distinction.

## 13. Public and Internal Surfaces

### EG02-013 — Public Contracts and Internal Implementation Must Be Distinguishable Where It Matters

Large or consequential modules may distinguish public API/contracts from internal implementation through directory or metadata conventions.

This distinction is semantic rather than a mandatory folder pattern for every small subsystem.

## 14. Runtime and Development Tooling

### EG02-014 — Production Runtime and Development Tooling Must Be Structurally Distinguishable

Migration generators, registry validators, audit tools, benchmark launchers, conversion scripts, release tooling and similar development infrastructure must not be mixed arbitrarily with normal runtime implementation.

This reduces accidental runtime dependency on development-only infrastructure.

## 15. Development and Test Scenes

### EG02-015 — Development-Only Scenes and Harnesses Must Be Clearly Identifiable

A contributor must be able to determine whether a scene belongs to product runtime, automated verification or development instrumentation.

Dedicated labs, visual test rooms and scenario harnesses remain valid patterns, but their status must be explicit.

## 16. Test Discoverability

### EG02-016 — Tests Must Remain Discoverable from the Systems They Protect

Leyforge uses a hybrid test-layout principle.

Central test infrastructure, fixtures, integration suites, scenarios and benchmarks may live under `tests/`, while focused module tests may be co-located or mirrored according to the eventual testing framework.

There must be a predictable way to discover the tests protecting a module. Detailed convention belongs to ENG-GOV-05.

## 17. Verification Fixtures

### EG02-017 — Verification Fixtures Must Be Distinguishable from Production Data

Save fixtures, registry fixtures, world-generation fixtures, corrupted-save samples and other test data must live in clearly identified verification areas and must not be confused with normal shipping content.

## 18. Schemas

### EG02-018 — Machine-Readable Contracts Must Be Centrally Discoverable

Schema definitions for saves, registries, Forge content, diagnostics, network contracts or other persistent/interoperable formats should be discoverable through a predictable repository location or module-owned equivalent.

A conceptual `schemas/` area is permitted where centralisation improves discoverability.

## 19. Generated Files

### EG02-019 — Generated Output Requires an Identifiable Zone or Unmistakable Marking

Generated files must not look like manually maintained authoritative source.

Generated output should reveal its source of truth, generator, regeneration procedure and whether manual edits are permitted.

## 20. Generated Output in Git

### EG02-020 — Generated Output Is Committed Only When There Is a Reason

Generated artifacts may be versioned when required for runtime, review, deterministic mirrors, release integrity or offline build requirements.

Caches, temporary exports, logs, local reports and intermediate build products should not be committed by default.

## 21. Build and Runtime Output

### EG02-021 — Build Products and Runtime-Generated Files Must Not Contaminate Source Authority

Exports, caches, runtime save data, temporary benchmark output and similar artifacts should not accumulate among authoritative source.

Repository structure must make it clear whether a file is source, generated runtime data, a test fixture or disposable output.

## 22. Third-Party Boundaries

### EG02-022 — Third-Party and Upstream Code Require Distinct Repository Boundaries

Upstream-owned, vendored, forked and Leyforge-owned code must remain structurally distinguishable.

Godot-integrated dependencies may require `addons/`, while other vendored code may live elsewhere, but ownership semantics must remain clear. Detailed procedures belong to ENG-GOV-15.

## 23. Voxel Integration Boundary

### EG02-023 — The Voxel Dependency Must Remain Structurally Distinguishable from Leyforge-Owned Systems

Whether Leyforge uses an upstream voxel plugin, a fork, a patch set or an extension layer, the repository must make that integration status clear.

Leyforge-specific gameplay systems must not gradually migrate into upstream voxel areas merely because they interact with voxels. Genuine voxel-core or world-generation changes should likewise live in the appropriate voxel layer rather than unrelated gameplay code.

The exact boundary is an LFE decision; ENG-GOV-02 requires the repository to express it clearly.

## 24. Documentation Structure

### EG02-024 — Engineering Documents Must Have Stable, Predictable Locations

Governance, architecture, canon, discovery and other authoritative document families should live in predictable repository areas aligned with the Branch A authority map.

Document IDs remain the durable authority identity. Paths are discoverability mechanisms.

## 25. Document Identity and Paths

### EG02-025 — Moving a Document Must Not Silently Create a New Authority

A document retains its authority identity when its path changes.

Path moves require links and indexes to be updated, but a filepath alone does not define document identity.

## 26. Root Agent Entry Point

### EG02-026 — The Repository Root Contains the Universal Coding-Agent Entry Point

A concise root `AGENTS.md` provides the universal agent entry point.

It should identify authority locations, Brain navigation, critical universal invariants, build/test entry points, subsystem-instruction discovery and completion obligations without duplicating the entire governance corpus.

## 27. Local Agent Instructions

### EG02-027 — Path-Specific Agent Instructions Are Permitted Where Local Risk Justifies Them

Subsystem or path-specific agent instructions may supplement the root agent entry point. They may not contradict higher authority.

Detailed semantics belong to ENG-GOV-12.

## 28. Local README Files

### EG02-028 — Local README Files Explain Usage Rather Than Duplicate Authoritative Architecture

Local README files may explain entry points, development commands, local hazards and where authoritative architecture lives.

They should link to governing architecture and Brain records rather than becoming a competing architecture specification.

## 29. Durable Directory Naming

### EG02-029 — Directory Names Must Communicate Durable Responsibility

Directory names should reflect meaningful domain or architectural responsibility.

Generic categories such as `controllers`, `providers`, `managers`, `processors`, `helpers` or `misc` should not become project-wide architecture unless those terms genuinely represent a coherent declared subsystem.

## 30. No Miscellaneous Dumping Grounds

### EG02-030 — Generic Miscellaneous Directories Are Prohibited

Permanent repository areas named `misc`, `random`, `other`, `temp_stuff`, `old`, `backup` or equivalent are prohibited as architecture.

If an artifact has no clear home, that is architectural information and its owner should be identified or defined.

## 31. Archives and History

### EG02-031 — Historical Copies Must Be Preserved by Git or Deliberate Archival Storage

Duplicate active-source trees such as `settlement_old` or `backup_before_refactor` must not be used as normal history.

Git preserves historical implementation. Explicit migration fixtures or archival evidence are different and must be identified by their real purpose.

## 32. Structural Refactoring

### EG02-032 — Filesystem Refactoring Must Preserve or Explicitly Modify Architecture

Moving files can represent ownership transfer, dependency change or authority change.

Repository movement is not automatically a harmless cleanup operation. Where a move changes subsystem boundaries, it must be classified and reviewed accordingly.

## 33. Monorepo Default

### EG02-033 — Leyforge Defaults to a Monorepo with Modular Internal Architecture

The game runtime, Forge, Project Brain, governance and tightly coupled supporting technology remain in one Git repository by default while architecture is evolving.

Repository separation may be reconsidered later where independent release, security or organisational boundaries justify it.

The default is a modular monorepo, not a monolith.

## 34. Module Boundaries vs Repository Boundaries

### EG02-034 — Software Modules May Be Independently Buildable Without Becoming Separate Repositories

A module may have its own API, tests, build process and versioned interface while remaining inside the Leyforge repository.

Repository splitting must not be used as a substitute for modular architecture.

## 35. Dependency Inventory

### EG02-035 — External Dependencies Require a Predictable Authoritative Record

Leyforge should maintain a discoverable dependency inventory recording dependency name, purpose, source, version, licence, integration mode, upstream status and local modifications where relevant.

This record should integrate with ENG-GOV-15 and the Project Brain.

## 36. Repository Cleanliness

### EG02-036 — Machine-Local State Is Excluded by Default

Editor caches, local exports, runtime saves, OS metadata, IDE state, temporary logs, benchmark scratch output and local secrets are excluded unless intentionally versioned.

`.gitignore` and related repository controls are governed project mechanisms.

## 37. Secret Material

### EG02-037 — Secret Material Must Never Gain a Normal Repository Home

Real credentials, tokens, private keys and equivalent secret material must not be stored in source control.

Templates and non-secret examples are permitted where useful. Detailed security requirements belong to ENG-GOV-13.

## 38. Path Portability

### EG02-038 — Repository Paths Must Remain Portable Across Supported Environments

Repository structure must not depend on case-insensitive filesystem behaviour or other platform-specific path assumptions.

Conflicting names that differ only by case are prohibited. Paths should remain safe for Git, CI, Linux servers, containers and future dedicated-server environments.

## 39. Path Stability

### EG02-039 — Frequently Referenced Architectural Paths Must Not Churn Casually

Repository restructuring is allowed when it produces meaningful value.

Frequently referenced paths should not be reorganised repeatedly for aesthetic preference alone because Godot resources, documentation links, tooling and agent instructions may depend on them.

## 40. Machine-Readable Repository Map

### EG02-040 — The Repository Should Eventually Expose a Machine-Readable Module and Ownership Map

Leyforge should eventually maintain a machine-readable representation of module identity, paths, authority, risk, owned state, dependencies and other useful architecture metadata.

The exact format is deferred. The map should support AI navigation, dependency validation, Brain generation, review rules, test discovery and architecture audits where practical.

## 41. Generated Navigation

### EG02-041 — Machine-Readable Structure Metadata Should Generate Derived Indexes Where Practical

Where an authoritative module manifest exists, derived navigation and indexes should be generated rather than manually duplicated across multiple files.

Automation should reduce repetitive project administration.

## 42. Structural Validation

### EG02-042 — Important Repository Boundaries Should Eventually Have Automated Validators

Possible checks include duplicate module IDs, forbidden root clutter, generated-file marking, dependency boundaries, required module metadata, third-party modification boundaries and broken authority references.

Missing automation may initially be recorded as governance debt.

## 43. Repository Restructuring

### EG02-043 — Large Structural Changes Require a Migration Plan

Major repository reorganisation must consider Godot resource paths, imports, tests, tooling, documentation links, Brain links, CI, agent instructions, build scripts and third-party patches before execution.

Large moves must not be performed without accounting for their ecosystem effects.

## 44. V1 Rebuild Transition

### EG02-044 — Superseded POC Structure Must Not Silently Define the V1 Repository Architecture

Historical Summer-based POC structure may provide evidence, behavioural reference and test inspiration.

It does not automatically define V1 architecture. The V1 repository must be shaped by locked canon, PRD findings, Godot/Zylann reality, LFE and FORGE-ENG.

## 45. POC Preservation

### EG02-045 — Valuable POC Evidence Must Remain Retrievable Without Remaining Production Authority

Preserved POC material must be explicitly identified as historical or reference material.

Obsolete Summer-era source must not accidentally become part of the clean V1 runtime.

## 46. Repository Bootstrap Gate

### EG02-046 — The Final V1 Directory Tree Is Locked Only After Architecture-Critical Discovery

ENG-GOV-02 defines the rules of repository structure now.

The concrete V1 module manifest is frozen only after architecture-critical PRD findings, LFE foundational boundaries, FORGE-ENG foundational boundaries and the voxel integration strategy are sufficiently resolved.

This prevents repository governance from inventing architecture prematurely.

## 47. Structural Success Criterion

### EG02-047 — Repository Structure Is Successful When Placement Becomes Predictable

A competent contributor should normally be able to determine:

- where a new artifact belongs;
- who owns it;
- whether it is runtime, test, tool, generated, documentation or upstream;
- what it may depend on;
- where its verification lives;
- and where its authority is defined.

If those questions routinely require guesswork, the repository structure has failed regardless of how tidy its folder names appear.

---

## Provisional Structural Model

The final repository may converge toward a shape resembling:

```text
leyforge/
│
├── AGENTS.md
├── project.godot
│
├── brain/
├── docs/
├── game/
├── forge/
├── tests/
├── tools/
├── schemas/
├── generated/
├── addons/
├── third_party/
└── .github/
```

The exact contents beneath `game/` and `forge/` remain intentionally open until LFE and FORGE-ENG establish the actual subsystem boundaries.

---

## Closing Principle

Leyforge repository structure exists to express ownership and architecture, not merely to sort files.

The structure should make authoritative boundaries visible, keep runtime and development concerns distinct, preserve upstream ownership, prevent dumping grounds, support AI and human navigation, and remain stable enough that contributors can reason about the project without filesystem archaeology.

The final repository tree must be a consequence of real architecture rather than an attempt to guess that architecture in advance.
