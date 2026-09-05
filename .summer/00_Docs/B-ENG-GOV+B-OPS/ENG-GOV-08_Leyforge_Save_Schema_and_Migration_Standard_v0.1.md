# ENG-GOV-08 — Leyforge Save / Schema / Migration Standard

**Document ID:** ENG-GOV-08  
**Title:** Leyforge Save / Schema / Migration Standard  
**Version:** v0.1  
**Status:** THEORETICALLY LOCKED  
**Authority Domain:** Engineering Governance — Persistence / Save / Schema / Migration  
**Parent Authority:** ENG-GOV-00 — Leyforge Engineering Constitution  
**Related Standards:** ENG-GOV-01, ENG-GOV-05, ENG-GOV-06, ENG-GOV-07, ENG-GOV-09, ENG-GOV-11, ENG-GOV-12, ENG-GOV-14  
**Project:** Leyforge

---

## 00. Purpose and Scope

ENG-GOV-08 defines the engineering laws governing long-lived Leyforge world data, save schemas, world metadata, migration, recovery, integrity, compatibility, persistent identity and persistence-safe evolution.

A player's world is treated as long-lived authoritative data rather than a disposable implementation detail.

The exact gameplay state owned by each subsystem remains defined by the relevant architecture. ENG-GOV-08 governs how that state is safely persisted, versioned, migrated, validated and restored.

---

## 01. Persistence Contract

### EG08-001 — Persistence Is a Long-Lived Public Contract
Save data, world metadata, schema versions, migration, recovery and persistent identity are compatibility-sensitive engineering interfaces.

### EG08-002 — Saves Persist Authoritative State Rather Than Arbitrary Runtime State
Only state that must survive reload becomes persistence authority. Rendering objects, temporary UI state, debug state and disposable caches should normally be reconstructed.

### EG08-003 — Scene, Node and Runtime Object Instances Are Not Stable Identity by Default
Transient scene paths, object IDs and runtime instances must not become durable identity unless explicitly designed as such.

---

## 02. Version Domains

### EG08-004 — Project Version Domains Remain Distinct
Game Version, Save Schema Version, Worldgen Version, Registry Schema Version, Content Version, Forge Package Version, Plugin/API Version and Migration Version are separate concepts.

### EG08-005 — Every Persisted Save Declares Its Schema Version
Loaders must know what persisted structure they are reading.

### EG08-006 — Save-Schema Version Changes Represent Compatibility-Relevant Structural Change
Schema versions are not bumped for unrelated cosmetic changes.

### EG08-007 — Additive Fields Define Explicit Old-Save Defaults or Derivation
Missing fields in older saves must not silently rely on accidental language defaults.

### EG08-008 — Persisted Fields Have Explicit Lifecycles Where Compatibility Matters
Relevant states include ACTIVE, DEPRECATED, COMPATIBILITY-ONLY and REMOVED.

---

## 03. Persistent Identity

### EG08-009 — Source Refactoring Does Not Automatically Change Persistence Identity
Source symbol names and persistent identity are separate layers.

### EG08-010 — Saves Reference Stable IDs Rather Than Display Names
Display text is presentation, not durable identity.

### EG08-011 — Retired Persistent IDs Are Never Reused for Unrelated Concepts
Historical identity remains reserved.

### EG08-012 — Identity Replacement Uses Explicit Alias or Migration Records
Old-to-new identity mapping must be governed, testable and documented.

### EG08-013 — Unknown Persistent Identities Fail Safely
Unknown IDs may reject, quarantine, map through a known migration or use an explicit missing-content representation. They must never silently resolve to unrelated content.

### EG08-014 — Missing Content Has Declared Handling
Missing dependency, retired content, corrupt identity and unsupported version must remain distinguishable.

---

## 04. World Manifest and Isolation

### EG08-015 — Worlds Have Discoverable Persistence Metadata
World identity, creation/last-save version, schema versions, worldgen provenance, registry/content provenance, dependencies, migration state and integrity metadata should be discoverable.

### EG08-016 — Persistence Metadata Does Not Depend on Filesystem Accidents
Folder timestamps and file ordering are not schema authority.

### EG08-017 — World IDs Are Stable and Independent of Display/Folder Names
Renaming a world does not change its authoritative identity.

### EG08-018 — Worlds Maintain Isolated Persistence Boundaries
One world's save, backup, migration or corruption state must not normally contaminate another.

### EG08-019 — Corruption Is Contained to the Smallest Reasonable Boundary
A local failure should not automatically destroy unrelated worlds or persistence domains.

---

## 05. Failure-Resistant Writes

### EG08-020 — Authoritative Saves Use Transactional Candidate/Commit Semantics
Persistence captures a coherent state, serializes a candidate, validates it, writes a new generation or temporary candidate, and only then commits.

### EG08-021 — Final Save Activation Uses the Strongest Practical Atomic Replacement Mechanism
Interrupted writes must not turn the last known-good save into a partially written valid save.

### EG08-022 — At Least One Prior Known-Good State Is Preserved Where Practical
Current, previous, backup and candidate roles remain distinguishable.

### EG08-023 — Backup Rotation Is Bounded
Recovery history must not grow indefinitely.

### EG08-024 — Recovery Candidate Order Is Explicit and Deterministic
Candidate precedence follows declared validation rules rather than modification-time guessing.

### EG08-025 — Automatic Recovery Is Observable
Use of previous/backup generations must be diagnosable and surfaced appropriately.

### EG08-026 — Failed or Corrupt Candidates Are Preserved for Diagnosis Where Practical
Recovery must not immediately destroy evidence.

---

## 06. Integrity and Snapshot Consistency

### EG08-027 — Save Candidates Support Integrity Checking Appropriate to Risk
Integrity mechanisms may include structural validation, checksums, manifests, counts and cross-reference validation.

### EG08-028 — Byte Integrity Does Not Replace Semantic Validity
A perfectly hashed invalid save is still invalid.

### EG08-029 — Save Capture Represents a Coherent Authoritative Snapshot
Persisted subsystems must not represent mutually inconsistent transaction generations unless the model explicitly permits it.

### EG08-030 — Snapshot Consistency Does Not Mandate One Synchronization Technique
LFE may choose barriers, snapshots, copy-on-write, generation models or other approaches while preserving consistency.

### EG08-031 — Async Save Jobs Cannot Commit Stale Generations
Save jobs require ordering, request identity or equivalent stale-completion protection.

### EG08-032 — Save Cancellation Has Explicit Commit Semantics
Cancellation must not leave ambiguous half-committed authority.

---

## 07. Transactions and Derived State

### EG08-033 — In-Flight Authoritative Transactions Have Explicit Persistence Semantics
Transfers, construction, machines, trade and tasks define whether state is active, rolled back or committed across save boundaries.

### EG08-034 — Save/Reload Must Not Duplicate Exactly-Once Transactions
Reload must not re-consume or reapply already committed effects.

### EG08-035 — Committed Effects Must Not Vanish Due to Ambiguous Persistence Lag
Durability boundaries must be defined.

### EG08-036 — Derived State Is Recomputed Unless Persistence Is Needed
Caches and derived lookups should not be persisted by default.

### EG08-037 — Persisted Caches Have Explicit Validity and Version Rules
If a derived dataset is persisted, invalidation semantics must be known.

---

## 08. Portable Representation

### EG08-038 — Persistent Data Avoids Unnecessary Machine-Specific Representation
Pointer width, native memory layout, runtime object IDs and absolute platform paths must not become accidental semantics.

### EG08-039 — Persisted Numeric Precision Is Deliberate
Identity, quantity and precision-sensitive values must not be silently narrowed.

### EG08-040 — Ordering Is Explicit When Semantically Meaningful
Filesystem or dictionary iteration order must not accidentally become save semantics.

### EG08-041 — Hashes Over Semantic Data Use Stable Serialization Where Required
Canonicalization is required when reproducible semantic hashing depends on ordering.

### EG08-042 — Compression Changes Representation, Not Meaning
Compression format can evolve independently where compatibility supports it.

### EG08-043 — Encryption Is Not Assumed by Baseline Persistence Integrity
Security mechanisms are separately governed by ENG-GOV-13.

---

## 09. Migration Architecture

### EG08-044 — Schema Incompatibility Uses Named Migration Rather Than Loader Guessing
Compatibility transformations are explicit.

### EG08-045 — Supported Migrations Form a Declared Ordered Chain or Transformation Graph
Supported paths must be knowable.

### EG08-046 — Consequential Migrations Have Stable Engineering Identities
Migration IDs should be referenceable by tests, diagnostics, Brain records and incidents.

### EG08-047 — Migration Is Deterministic Where Practical
Same valid source state and migration version should yield the same authoritative result.

### EG08-048 — Migration-Created Persistent IDs Have Deterministic Collision-Safe Provenance Where Appropriate
Retrying the same migration should not invent different identities unnecessarily.

### EG08-049 — Migration Does Not Trigger Ordinary Gameplay Side Effects
Migration must not accidentally advance gameplay, trigger achievements, events or AI.

### EG08-050 — Migrated Candidates Validate Before Replacing Known-Good Data
Migration commits only after validation.

### EG08-051 — Destructive Migration Preserves Recoverable Pre-Migration State
The original world is protected before irreversible transformation.

### EG08-052 — Historical Fixtures Are Not Rewritten Merely Because Migration Logic Changed
Fixtures remain evidence of old-world inputs.

### EG08-053 — Migration Failure Must Not Destroy the Last Known-Good Source
Source preservation is mandatory where practical.

### EG08-054 — Migration Retries Must Be Safe
Partial prior effects must not duplicate on retry.

### EG08-055 — Long Migrations Expose Progress
Players and developers should be able to distinguish work-in-progress from a hang.

### EG08-056 — Migration Interruption Has Safe Semantics
Cancellation or process failure must preserve source safety.

### EG08-057 — Migration Emits Structured Diagnostics
Migration identity, source/target schema, world ID, transformed records, warnings, failures and duration should be diagnosable.

---

## 10. Compatibility Window

### EG08-058 — Supported Save-Version Range Is Explicit
Minimum supported schema, current schema and unsupported/future behaviour are declared.

### EG08-059 — Unsupported Old Saves Fail Clearly
Where an upgrade path exists, the user should be told rather than treating the save as generic corruption.

### EG08-060 — Newer Unsupported Schemas Are Rejected Safely by Older Builds
Older software must not optimistically reinterpret or resave unknown future data.

### EG08-061 — Forward Compatibility Is Explicit, Not Assumed
Unknown future schemas default to safe rejection unless specifically designed and verified.

### EG08-062 — Downgrade Support Is Not Assumed
Opening or saving a migrated world in an older version is supported only when explicitly designed.

### EG08-063 — Pre-Release Save Compatibility Has an Explicit Policy
Release and development save-support promises are not accidentally conflated.

---

## 11. Load Failure Safety

### EG08-064 — Incompatible or Corrupt Saves Are Never Automatically Deleted
Reject, quarantine, copy or recover; never silently wipe.

### EG08-065 — Load Failure Must Not Silently Create a Fresh World Under the Same Identity
Failed load and new-world creation are separate operations.

---

## 12. Worldgen Provenance

### EG08-066 — Generated Worlds Retain Worldgen Provenance
Existing generated terrain remains interpretable according to its generation history.

### EG08-067 — Worldgen Version and Save-Schema Version Are Independent
Algorithm and storage evolution are separate domains.

### EG08-068 — Existing Worlds Declare How New Regions Choose Worldgen Rules
Whole-world lock, upgraded-new-region or hybrid policies are LFE decisions, but the chosen policy must be explicit, deterministic and persisted.

### EG08-069 — Mixed-Generation Worlds Persist Region/Chunk Provenance Where Required
Hybrid generation cannot rely on hidden ambiguity.

### EG08-070 — Regeneration Must Not Erase Persistent Player/World Modification Without Authority
Player construction, mining, roads, settlements and event state are protected according to the world-state model.

### EG08-071 — Regenerable Base Data Retains Enough Provenance to Reproduce or Safely Supersede It
Full-chunk, delta or region-snapshot architecture is deferred to LFE.

---

## 13. Registry and Content Provenance

### EG08-072 — Save Data Retains Enough Registry/Content Provenance to Interpret IDs Correctly
Content removal, aliases, mods and registry-schema evolution must remain diagnosable.

### EG08-073 — New Definitions Do Not Silently Reinterpret Historical Instance State
Definition-owned values and per-instance historical state must remain distinct.

### EG08-074 — Persistence Distinguishes Definition References from Instance State
Stable definition IDs are not duplicated unnecessarily into full per-instance definitions.

### EG08-075 — Retired Definitions Require a Persistence Strategy
Alias, migration, legacy definition, missing-content placeholder or explicit rejection must be chosen according to semantics.

---

## 14. Paths, External Dependencies and Portability

### EG08-076 — Save Portability Does Not Depend Unnecessarily on Absolute Machine Paths
Machine-local filesystem paths must not become authoritative meaning.

### EG08-077 — External Assets Use Stable Dependency Resolution
Forge/mod dependencies require package identity/version rather than fragile local paths.

### EG08-078 — Save Filenames Are Not Authoritative Identity
Storage presentation and world identity are separate.

### EG08-079 — Players Must Be Able to Make Safe External Backups
Persistence architecture should not intentionally prevent safe world copying.

### EG08-080 — Legacy Import Prefers Preservation Over Destructive Movement
Copy/import, verify, then retire old storage deliberately.

### EG08-081 — Cloud/Platform Sync Does Not Replace Local Persistence Integrity
Synchronization can distribute both valid state and corruption.

### EG08-082 — Divergent Save Generations Do Not Silently Merge Without a Real Merge Model
Cloud/multiplayer conflicts require explicit conflict architecture.

---

## 15. Risk and Architecture Governance

### EG08-083 — Save/Schema Changes Are Change Class D Minimum
Persistent layout, identity, migration, worldgen provenance and compatibility interpretation are at least Class D.

### EG08-084 — Consequential Persistence Architecture Requires ADR Coverage
Sharding, snapshot model, journaling, region-delta strategy, migration graph and provenance strategy are architecture decisions.

### EG08-085 — Persistence Changes Trigger Dedicated Compatibility Verification
Applicable old fixtures, migration, round-trip, active-state save, interruption, recovery, stable-ID and determinism tests are required.

---

## 16. Historical Compatibility Corpus

### EG08-086 — Supported Old-World Fixtures Are Protected Evidence
Migration failures are fixed in migration code rather than by rewriting history.

### EG08-087 — Migration Certification Uses Representative Populated Worlds
Fixtures evolve to include terrain edits, inventories, settlements, NPCs, construction, machines, structures and realm state as systems exist.

### EG08-088 — Leyforge Maintains a Controlled Golden Compatibility Corpus
Representative historical, regression, corruption and recovery worlds become long-term project assets.

---

## 17. Validation and Repair

### EG08-089 — Successful Deserialization Is Not Sufficient Validation
Parsed data may still violate identity, reference or semantic invariants.

### EG08-090 — Persistence Validation Distinguishes Structural, Schema, Referential, Semantic and Integrity Checks
Not every layer must run at identical cost, but their meanings remain separate.

### EG08-091 — Automatic Repair Is Limited to Explicitly Understood Repairable Conditions
Known rebuildable derived state may be repaired. Ambiguous authoritative state may not be guessed.

### EG08-092 — Significant Repairs Preserve Evidence and Produce Diagnostics
Repairs should be historically diagnosable.

### EG08-093 — Material Recovery or Data-Loss Events Are Communicated Appropriately
Silent rollback of meaningful player progress is not acceptable.

### EG08-094 — Invalid or Partially Loaded Worlds Must Not Autosave Over Their Original Data
Normal save is enabled only after sufficient load validity is established.

### EG08-095 — Autosaves Obey the Same Integrity Contract as Manual Saves
Frequency may differ; safety may not.

### EG08-096 — Save Generation Roles Remain Distinguishable
Autosave, manual save, current generation, previous generation, backup and candidate roles must not be inferred from timestamps alone.

---

## 18. Performance and Ownership

### EG08-097 — Save Scheduling Is Performance-Aware Without Weakening Correctness
Snapshot correctness is never traded away merely to reduce pause or write cost.

### EG08-098 — Higher Save Frequency Does Not Compensate for Unsafe Writes
Frequency and integrity are independent concerns.

### EG08-099 — Each Persisted State Domain Has an Authoritative Owner and Persistence Responsibility
Ownership, serialization, validation and migration responsibility must be discoverable.

### EG08-100 — Persistence Infrastructure Orchestrates Rather Than Redefines Game Truth
Subsystems own semantics; persistence owns safe capture, versioning and restoration.

### EG08-101 — Consequential Persistent Domains Have Discoverable Schema/Ownership Documentation
Brain, LFE, schema definitions, migration records and tests should connect the persistence contract.

---

## 19. Compatibility Retirement

### EG08-102 — Dropping Old Save Support Is an Explicit Project Decision
Support-range changes require migration, player/release, fixture and documentation consideration.

### EG08-103 — Retired Migration Code Is Removed Only After Support Obligations End
Historical source remains recoverable through Git.

### EG08-104 — Persisted Contracts Become Machine-Readable/Validatable Where Practical
Machine-readable schemas support CI, migration, Forge, diagnostics and agents.

### EG08-105 — Automatically Generated Migrations Receive Independent Validation
Generated transformation code is not accepted blindly for player worlds.

---

## 20. Coding-Agent Restrictions

### EG08-106 — Agents May Not Casually Delete Compatibility or Migration Paths
Before removal, support range, fixtures, replacement and retirement authority must be established.

### EG08-107 — Agents May Not Clean Up Stable Persisted IDs Without Migration Authority
Ugly or old naming does not justify identity change.

### EG08-108 — Agents May Not Rewrite Historical Fixtures Solely to Obtain Green CI
Historical evidence is protected.

### EG08-109 — Migration Tooling Should Support Dry-Run/Analysis Modes Where Practical
Large/risky worlds benefit from pre-commit analysis.

### EG08-110 — Migration Compatibility Is Tested Across Representative World Sets
Bulk migration of the golden corpus should be automated where practical.

---

## 21. Incident and Auditability

### EG08-111 — Unexplained Persistence Corruption Is a Critical Engineering Incident
Normal feature progression pauses while evidence is preserved, blast radius is assessed, the defect is fixed and regression protection is added.

### EG08-112 — Meaningful Migrations and Recovery Actions Remain Historically Explainable
Identity changes, migration versions, affected schemas, tests and support retirement should be auditable.

### EG08-113 — Old Truth, Migration Truth, New Truth and Verification Must Agree
A persistence change is complete only when historical supported data, migration logic, new authoritative models and tests describe the same transformation.

---

## Persistence Lifecycle

```text
AUTHORITATIVE LIVE STATE
        ↓
COHERENT SNAPSHOT
        ↓
SERIALIZE CANDIDATE
        ↓
STRUCTURAL + SEMANTIC VALIDATION
        ↓
INTEGRITY PROTECTION
        ↓
TEMP / NEW GENERATION
        ↓
SAFE COMMIT
        ↓
CURRENT + RECOVERABLE PRIOR STATE
```

## Migration Lifecycle

```text
ORIGINAL WORLD
    ↓
PRESERVE SOURCE
    ↓
CREATE MIGRATION CANDIDATE
    ↓
RUN NAMED MIGRATION(S)
    ↓
VALIDATE
    ↓
VERIFY STABLE IDS / INVARIANTS
    ↓
COMMIT NEW GENERATION
    ↓
RETAIN RECOVERY PATH
```

---

## Closing Principle

A Leyforge world is not disposable implementation state.

Persistence must preserve stable identity, authoritative state, compatibility intent and recoverability across years of engineering change. Writes are failure-resistant. Migrations are explicit and testable. Historical fixtures remain evidence. Recovery is observable. Unsupported data fails safely. Worldgen provenance remains explicit. Source renames never silently rewrite persistent identity. AI agents may not erase compatibility merely because it looks old.

Persistence is complete only when old truth, migration truth, new truth and verification all agree.
