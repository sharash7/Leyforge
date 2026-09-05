# ENG-GOV-09 — Leyforge Registry / Stable Identity Standard

**Document ID:** ENG-GOV-09  
**Title:** Leyforge Registry / Stable Identity Standard  
**Version:** v0.1  
**Status:** THEORETICALLY LOCKED  
**Authority Domain:** Engineering Governance — Registry / Stable Identity  
**Parent Authority:** ENG-GOV-00 — Leyforge Engineering Constitution  
**Related Standards:** ENG-GOV-01, ENG-GOV-02, ENG-GOV-03, ENG-GOV-05, ENG-GOV-06, ENG-GOV-07, ENG-GOV-08, ENG-GOV-11, ENG-GOV-12, ENG-GOV-15  
**Project:** Leyforge

---

## 00. Purpose and Scope

ENG-GOV-09 defines how Leyforge represents stable machine identity, registry authority, definition ownership, namespaces, aliases, generated forms, reference integrity, package provenance, registry loading and compatibility-safe content evolution.

The canonical content corpus determines which concepts exist and what they mean.

The registry expresses those concepts in machine-readable form and must not silently invent or redefine canon.

---

## 01. Registry Authority

### EG09-001 — ENG-GOV-09 Governs Machine Identity and Registry Authority
This standard governs stable IDs, namespaces, registry ownership, definition uniqueness, aliases, retirement, generated identities, derived forms, references, dependency resolution, schema validation, load ordering, provenance and definition-instance relationships.

### EG09-002 — Registry-Owned Facts Have One Authoritative Machine-Readable Definition
Runtime systems consume registry-owned facts from the registry rather than independently redefining them.

### EG09-003 — Registries Express Canon; They Do Not Silently Create Canon
Adding a machine-readable definition does not by itself make a concept canonical.

---

## 02. Stable Identity

### EG09-004 — Stable IDs Are Semantic Identities
Stable IDs identify concepts. They are not display names, filenames, asset paths, translation keys, source classes or array positions.

### EG09-005 — Stable IDs Are Immutable in Meaning Once Persistent or External References May Depend on Them
An ID that historically represented one concept continues to mean that concept even after deprecation or retirement.

### EG09-006 — Stable IDs Are Never Reused for Unrelated Concepts
Retired identity remains reserved.

### EG09-007 — Display-Name Changes Do Not Change Stable Identity
Presentation may evolve independently.

### EG09-008 — Localization Never Participates in Stable Identity
Translated text cannot become a persistent key.

---

## 03. Namespace Ownership and Syntax

### EG09-009 — Every Stable ID Belongs to a Declared Namespace or Domain
Core, official, Forge/player, mod/external and engineering identity spaces must have explicit ownership.

### EG09-010 — Namespace Ownership Is Stable
A package or subsystem may not casually issue identities inside another authority's namespace.

### EG09-011 — Namespace Collision Is a Hard Validation Failure
Two distinct definitions cannot claim one stable ID.

### EG09-012 — Registry ID Syntax Is Mechanically Validatable
The exact FCC-13 grammar must remain deterministic, case-consistent, portable, parseable and unambiguous.

### EG09-013 — IDs Use Canonical Machine Terminology
Stable identity should avoid presentation-only punctuation, case ambiguity and unsafe path characters unless explicitly supported by the canonical grammar.

### EG09-014 — Normalization Must Not Silently Merge Ambiguous Authoring
Ambiguous identities should fail validation rather than being silently canonicalized into one value.

---

## 04. Single-Definition Rule

### EG09-015 — One Canonical Concept Receives One Authoritative Definition
Multiple runtime contexts do not justify duplicate content definitions.

### EG09-016 — Block/Object/Item Projections Do Not Automatically Create Separate Canonical Identities
Where a placed, carried or editor-visible representation is the same underlying concept, one definition may own multiple projections.

### EG09-017 — Separate Stable Definitions Require Real Semantic Identity Differences
Separate raw, processed, crafted or transformed definitions exist only when canon treats them as different identities.

---

## 05. Projection Architecture

### EG09-018 — Projections Reference Their Owning Definition
Block, object, item, UI, Forge and other representations should resolve back to the owning definition.

### EG09-019 — Projection-Specific Data Does Not Automatically Belong in the Core Definition
Representation-specific data may remain in the projection layer while sharing one canonical identity.

### EG09-020 — Projection State and Instance State Are Distinct
A projection describes representation; an instance stores per-instance state.

---

## 06. Definition and Instance Separation

### EG09-021 — Registries Define Reusable Identities; Instances Contain Per-Instance State
Persistent instances should normally reference a definition ID and store only instance-specific state.

### EG09-022 — Instance Data Does Not Silently Override Registry-Owned Facts
Variation must be explicitly modelled where overrides are legitimate.

---

## 07. Derived and Generated Forms

### EG09-023 — Derived Forms Inherit Through Declared Form Rules
Generated forms derive from authoritative bases using explicit rules.

### EG09-024 — Generated Forms Are Deterministic
Base definition, form definition, generator version and configuration should reproduce the same generated result.

### EG09-025 — Generation Must Not Duplicate an Existing Authoritative Definition
Equivalent explicit definitions take precedence according to declared authority.

### EG09-026 — Explicit Definitions Override Generated Defaults Only Through Declared Precedence
Generated defaults and explicit overrides use an explicit, testable resolution model.

### EG09-027 — Generated Identity Provenance Is Inspectable
Base, form, generator version and override source should be discoverable.

### EG09-028 — Generated Stable IDs Follow One Deterministic Grammar
No local per-contributor generated-ID dialects.

### EG09-029 — Generated IDs Receive the Same Uniqueness Guarantees as Explicit IDs
Generated identities are stable where persistent references may depend on them.

### EG09-030 — Generator Algorithm Changes Require Compatibility Analysis
Changes that alter existing generated identities are persistence/identity changes.

---

## 08. Aliases

### EG09-031 — An Alias Is Not an Independent Definition
Aliases resolve into canonical identity.

### EG09-032 — Aliases Exist for Compatibility, Migration or Controlled External Naming
They are not an unlimited spelling-variation mechanism.

### EG09-033 — Alias Chains Are Flattened or Bounded
Resolution paths must not grow without limit.

### EG09-034 — Alias Cycles Are Prohibited
Cycles fail validation.

### EG09-035 — Alias Resolution Is Deterministic
A declared alias resolves consistently for the relevant compatibility state.

---

## 09. Deprecation and Retirement

### EG09-036 — Registry Definitions Have Lifecycle State
Useful states include ACTIVE, DEPRECATED, COMPATIBILITY-ONLY and RETIRED.

### EG09-037 — Deprecation Does Not Immediately Invalidate Existing References
Existing worlds and integrations may continue to rely on deprecated identities.

### EG09-038 — Retirement Requires a Reference Strategy
Migration, alias, compatibility definition, missing-content representation or explicit unsupported status must be chosen.

### EG09-039 — Historical IDs Remain Reserved
Retired IDs are never recycled.

### EG09-040 — Canon Removal Does Not Automatically Erase Registry History
Compatibility representation may remain after a concept leaves current canon.

---

## 10. References

### EG09-041 — Registry Relationships Use Stable IDs
Recipes, materials, providers, structures, drops and related definitions reference stable machine identity.

### EG09-042 — Referential Integrity Is Validated
Required unknown references fail validation unless external/optional dependency semantics explicitly permit otherwise.

### EG09-043 — Required and Optional References Are Distinct
Missing required dependencies and missing optional dependencies have different outcomes.

### EG09-044 — Reference Resolution Does Not Depend on Accidental Load Order
Registry correctness must follow an explicit loading/resolution lifecycle.

---

## 11. Registry Load Lifecycle

### EG09-045 — Registry Loading Is Staged
Discover sources → parse → validate schema → establish identities → resolve references → generate derived forms → apply authorised overrides → validate global invariants → freeze/publish.

### EG09-046 — Invalid Core Registry State Never Becomes Partially Live
Invalid partial content must not quietly become runtime authority.

### EG09-047 — Published Registry State Is Immutable by Default During a Simulation Session
Immutability simplifies simulation, persistence, networking and determinism.

### EG09-048 — Runtime Registry Mutation Requires Explicit Generation Semantics
Future hot-loading must create an explicit new registry generation rather than silently mutating global state.

### EG09-049 — Systems May Identify the Registry Generation They Resolved Against Where Needed
This may support hot reload, multiplayer, Forge and compatibility.

---

## 12. Package Provenance and Dependencies

### EG09-050 — Registry Sources Have Identifiable Provenance
Definitions should identify core, official, Forge, mod, generated or compatibility origin.

### EG09-051 — Content Packages Have Stable Package Identity
Package identity, version, namespace ownership and dependencies are separate from file location.

### EG09-052 — Package Namespaces Prevent Collision with Core and Other Creators
External content must not casually claim official identity space.

### EG09-053 — Registry Packages Declare Dependencies Explicitly
Dependencies are discovered before runtime reference failure.

### EG09-054 — Dependency Cycles Are Rejected by Default
Cycles require an explicitly designed safe model to be permitted.

### EG09-055 — Dependency Version Compatibility Is Explicit
Installed package versions must be checkable against dependency requirements.

---

## 13. Overrides

### EG09-056 — Override Capability Is Explicit Rather Than Load-Order Shadowing
Definitions must not be replaced merely because one file happened to load last.

### EG09-057 — Official Definitions Cannot Be Silently Replaced by Arbitrary External Packages
Modifying core behaviour requires an explicit override architecture.

### EG09-058 — Overrides Preserve Provenance
Original definition, override source, changed fields and resolved output should be inspectable where relevant.

### EG09-059 — Patching and Whole-Definition Replacement Are Distinct Operations
Their risk and semantics differ.

---

## 14. Validation

### EG09-060 — Registry Validation Is Layered
Useful classes include SYNTAX, SCHEMA, IDENTITY, REFERENCE, SEMANTIC, GLOBAL INVARIANT, PROVENANCE and COMPATIBILITY.

### EG09-061 — Syntax Validity Does Not Imply Semantic Validity
Well-formed data may still violate project invariants.

### EG09-062 — Cross-Definition Invariants Receive Whole-Registry Validation
Duplicate IDs, alias loops, illegal generation collisions, namespace violations and invalid projection combinations must be checked globally.

### EG09-063 — Same Inputs and Versions Produce the Same Resolved Registry
Registry construction must not depend on uncontrolled filesystem, hash-map, clock or thread ordering.

### EG09-064 — Resolution Precedence Is Explicit Where It Matters
Base, generated, patch and override ordering must be declared and testable.

---

## 15. Registry Fingerprints and Versions

### EG09-065 — Resolved Registry State May Expose a Reproducible Hash or Fingerprint
Useful for persistence provenance, multiplayer, support and debugging.

### EG09-066 — Registry Hash Mismatch Is Evidence, Not Automatic Proof of Corruption
Different legitimate content configurations may have different fingerprints.

### EG09-067 — Registry Schema Version and Content Version Remain Separate
Structure and content evolution are independent domains.

### EG09-068 — Content Changes Affecting Persistent Interpretation Require Compatibility Review
Identity removal, generated-form mapping changes and instance-interpretation changes are compatibility-sensitive.

---

## 16. Quantities, Capabilities and Recipes

### EG09-069 — Registry Quantities Use Explicit Units or Semantics Where Ambiguous
Generic numeric amounts should be avoided where units matter.

### EG09-070 — Capability-Based Relationships Are Used Where Canon Defines Capability-Based Behaviour
Processing and provider relationships should consume declared capabilities rather than brittle hardcoded type lists.

### EG09-071 — Capability IDs Are Stable Identities Where Persisted or Externally Referenced
Capabilities receive the same identity discipline when durable.

### EG09-072 — Recipes Reference Definitions, Capabilities and Providers Through Declared Registry Contracts
Recipe semantics should not live only in source code.

### EG09-073 — Recipe Identity Is Stable Where Recipes Are Persisted or Externally Referenced
Durable references require durable recipe identity.

### EG09-074 — Recipe Resolution Is Deterministic for a Declared Registry State
Automation and multiplayer must not observe inconsistent recipe resolution.

### EG09-075 — Derived Forms Inherit Only Declared Inheritable Properties
Inheritance is explicit rather than blind cloning.

### EG09-076 — Form Transformation May Replace or Constrain Inherited Capabilities
Derived forms are governed transformations.

### EG09-077 — Definition Dependencies Are Explicit Where Meaning Requires Them
Incomplete packages should fail early.

---

## 17. Registry APIs and Runtime Handles

### EG09-078 — Runtime Code Accesses Registries Through Owned Interfaces
Direct global-dictionary access should not become the project-wide registry API.

### EG09-079 — Lookup Failure Semantics Are Explicit
Not-found, retired, alias-resolved, missing dependency, invalid ID and registry-not-ready conditions should remain distinguishable.

### EG09-080 — Stable-ID Domains Should Be Type-Distinguishable Where Practical
Different identity domains should not be freely interchangeable merely because they share a string representation.

### EG09-081 — Runtime Storage Type Does Not Define Identity Semantics
StringName, String, integer handle or another storage type is implementation.

### EG09-082 — Fast Runtime Handles Do Not Replace Stable Persistence Identity
Ephemeral numeric handles may accelerate lookup but should not be persisted unless their stability is explicitly guaranteed.

### EG09-083 — Runtime Indexes Are Derived State
Indexes are rebuildable from authoritative definitions.

---

## 18. Missing Content and Unknown Extension Data

### EG09-084 — Missing-Content Representations Have Explicit Semantics
A placeholder means the original definition is unavailable; it does not become the original definition.

### EG09-085 — Missing-Content Placeholders Preserve the Original Stable ID
Restored packages may potentially resolve the original identity again.

### EG09-086 — Unknown Extension Data May Be Preserved Where Safe and Explicitly Designed
Round-trip preservation is optional architecture, not an accidental promise.

---

## 19. Editing and Forge

### EG09-087 — Generated Registry Output Is Never Edited Directly
Modify the source/generator and regenerate.

### EG09-088 — Hand-Authored Definitions Use the Same Validation Pipeline as Generated Definitions
Manual content receives no validation exemption.

### EG09-089 — Forge Uses the Same Registry Contracts as Runtime Where It Authors Runtime Content
Forge must not become a parallel incompatible content model.

### EG09-090 — Forge Preview Data Is Not Automatically Authoritative
Publication/import/validation establishes runtime authority.

### EG09-091 — Forge Packages Validate Before Publication or Import
Invalid IDs, unresolved references and namespace collisions should be caught before worlds depend on them.

---

## 20. External Content and Networking

### EG09-092 — External Packages Cannot Bypass Registry Validation
Mod status does not permit invalid registry state.

### EG09-093 — External Content Uses Owned Namespaces
Package identity must not collide with core or unrelated creators.

### EG09-094 — Removed External Packages Produce Explicit Missing-Dependency Semantics
Missing definitions are never silently replaced with unrelated content.

### EG09-095 — Multiplayer Peers Must Eventually Establish Registry Compatibility Before Sharing Authority
Exact protocol belongs to networking architecture.

### EG09-096 — Compact Network Handles Require Explicit Mapping to Canonical IDs
Wire optimisation does not redefine persistent identity.

---

## 21. Diagnostics, CI and Inspection

### EG09-097 — Registry Load and Resolution Emit Structured Diagnostics
Load start, rejection, unresolved reference, alias resolution, collision and ready events should be observable.

### EG09-098 — Registry Errors Include Definition and Package Provenance
Errors should identify ID, source/package, field/reference and reason.

### EG09-099 — Resolved Definitions Are Inspectable During Development
Inspection should expose source, generated inheritance, overrides, aliases, capabilities and references where relevant.

### EG09-100 — Whole-Registry Validation Is a REQUIRED CI Gate
Identity collisions, alias cycles, missing required references, illegal generation collisions and namespace violations block integration.

### EG09-101 — Registry Validation Runs Headlessly Where Practical
The core validator should not require launching full gameplay.

### EG09-102 — Validators Have Intentionally Invalid Fixtures
Tests should prove rejection of duplicates, bad aliases, unknown references, namespace theft, generator collisions and dependency cycles.

### EG09-103 — Stable-ID Compatibility Changes Use Historical Fixtures
Alias/migration changes should prove old identities resolve according to declared compatibility.

---

## 22. Risk and Architecture Governance

### EG09-104 — Persistent Stable-ID Changes Are Change Class D Minimum
Even one-character identity changes are compatibility-sensitive.

### EG09-105 — Registry Schema Changes Are Class D Where Persistent or External Compatibility Is Affected
Purely internal tooling changes may classify lower when semantics permit.

### EG09-106 — Consequential Registry Architecture Changes Require ADRs
Namespace model, override semantics, dynamic generations, form generation and package dependency architecture are ADR-level changes.

---

## 23. Coding-Agent Restrictions

### EG09-107 — Agents May Not Invent Stable IDs Merely to Satisfy Missing References
Authority must be checked first.

### EG09-108 — Agents May Not Rename Stable IDs as Style Cleanup
Old terminology or spelling does not grant migration authority.

### EG09-109 — Agents May Not Create Duplicate Definitions to Solve Projection Problems
Projection architecture must be corrected instead.

### EG09-110 — Agents May Not Weaken Validators Merely to Obtain Green CI
The invalid content or governing rule must be addressed.

### EG09-111 — Agents Inspect Definition Provenance Before Modifying Registry Content
They must know whether content is hand-authored, generated, compatibility-owned or third-party.

---

## 24. Registry Change Reporting and Project Brain

### EG09-112 — Consequential Registry Changes Should Produce Machine-Readable Diff Reports Where Practical
Useful categories include added, removed, deprecated and aliased IDs; definition changes; capability changes; generated-form changes and unresolved references.

### EG09-113 — Registry Review Prefers Semantic Diffs Over Raw Generated Noise
Large generated-file churn should still expose the definitions that actually changed.

### EG09-114 — Major Registry Evolution Propagates to the Project Brain
Namespace architecture, generator changes, major migrations, capability families and retirement-policy changes should be reflected in project knowledge.

### EG09-115 — Reusable Registry Failures Become Failure or Antipattern Knowledge
Recurring identity and resolution failures should become reusable engineering knowledge.

### EG09-116 — Registry Health Should Eventually Be Machine-Derived
Core validity, dependency graph, alias health and collision state should flow from validation evidence.

---

## 25. Canon Traceability and Certification

### EG09-117 — Consequential Definitions Should Be Traceable to Authoritative Design Where Practical
The ideal chain is canon → registry definition → runtime projection → saved instance → verification.

### EG09-118 — Registry Data Conflicting with Canon Is an Implementation Defect Until Reconciled
Machine readability does not outrank design authority.

### EG09-119 — Registry Completeness Requires More Than Successful Parsing
Expected definitions, reference closure, projections, generated forms and invariant validation may all be required.

### EG09-120 — Registry Certification Requires Identity, Reference, Generation and Compatibility Validation
Certification requires no identity collisions, unresolved required references, illegal alias cycles, generation collisions or namespace/schema violations.

### EG09-121 — One Semantic Identity Maps to One Authoritative Resolved Definition for a Declared Registry Generation

```text
STABLE ID
    ↓
ONE AUTHORITATIVE RESOLVED DEFINITION
    ↓
ZERO OR MORE PROJECTIONS
    ↓
ZERO OR MORE INSTANCES
```

Aliases resolve into canonical identity. Generated forms create deterministic identities according to governed rules. Overrides resolve through explicit precedence.

---

## Registry Lifecycle

```text
DISCOVER SOURCES
      ↓
VALIDATE PACKAGE / NAMESPACE
      ↓
PARSE DEFINITIONS
      ↓
REGISTER STABLE IDENTITIES
      ↓
RESOLVE ALIASES
      ↓
RESOLVE REFERENCES
      ↓
GENERATE DERIVED FORMS
      ↓
APPLY AUTHORISED OVERRIDES
      ↓
GLOBAL INVARIANT VALIDATION
      ↓
CREATE RESOLVED REGISTRY GENERATION
      ↓
HASH / DIAGNOSTICS / REPORT
      ↓
PUBLISH IMMUTABLE RUNTIME VIEW
```

---

## Closing Principle

Leyforge registry architecture exists to preserve one coherent machine-readable truth for every semantic identity.

Stable IDs are durable meaning, not display labels. Block/Object/Item are projections when identity is shared. Generated forms are deterministic. Aliases preserve compatibility. Retired identities remain reserved. Package provenance and namespace ownership are explicit. Registry construction is staged and validated. Runtime handles remain derived optimisations. Forge and runtime share the same contracts. Whole-registry validation is a required gate.

Nothing may create a second competing definition merely because doing so is locally convenient.
