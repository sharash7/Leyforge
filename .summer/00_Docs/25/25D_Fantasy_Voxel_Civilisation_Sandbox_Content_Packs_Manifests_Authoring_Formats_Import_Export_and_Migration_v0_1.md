# FANTASY VOXEL CIVILISATION SANDBOX

## DOCUMENT SET 25

# 25D - Content Packs, Manifests, Authoring Formats, Import/Export and Migration

**Version 0.1 - Content Packaging and Migration Architecture Draft**

A canonical production architecture defining how Leyforge content is authored, normalised, packaged, compiled, versioned, distributed, imported, exported, patched, removed, restored and migrated without duplicating source-of-truth ownership, corrupting deterministic worlds, breaking persistent identities or forcing optional expansions into Core Production.

**Project Lead and Final Authority:** Ash

**Architecture, systems planning, documentation and production support:** GPT-5.6 Thinking

> **Content Packaging and Migration Architecture Statement**  
> Leyforge content is not safe because its files load once. It is safe when every authoritative field has one declared authoring owner, every compiled record can be traced to that source, every content pack publishes its dependencies and interfaces, every world records the exact registry snapshot that generated it, every update has a tested migration path, and every missing or removed package produces an explicit recovery state rather than silent deletion or reinterpretation.

| Field | Locked Direction |
| --- | --- |
| Document Scope | Content-pack architecture, pack classifications, manifests, dependency modes, load and compile order, authoring-source policy, spreadsheet contracts, canonical structured interchange, generated Godot Resources, Forge boundaries, import/export, field-level diffs, snapshots, hashes, provenance, save/world manifests, migration, removal, quarantine, reactivation, rollback, data-mod boundaries and Set 26 admission. |
| Identity Dependency | All packs, manifests, definitions, facets, schemas, interfaces, dependencies, migrations and snapshots use the qualified-ID, namespace, ownership, alias, tombstone, persistent-instance and spatial-frame rules of Document 25B v0.2. |
| Semantic Dependency | Pack assembly and migration preserve the schema, relationship, capability, suitability, fallback, reachability and completeness contracts of Document 25C v0.1. |
| Authoring Direction | No single editor owns all content. Each field path has one declared authoritative source. Spreadsheet, structured text, Forge project files and future custom editors may author different owned facets, but they compile through one normalised schema-preserving interchange and registry pipeline. |
| Runtime Direction | Runtime builds consume validated generated registries and asset packages, not spreadsheets or uncontrolled editor files. Generated Godot Resources are engine-facing outputs unless an owning document explicitly approves a hand-authored Resource type. |
| Pack Direction | Every pack is self-describing, versioned, hashable, dependency-aware, namespace-owned, migration-aware and removable only through an explicit policy. Load order cannot be used to conceal conflicting ownership. |
| Optional-Content Direction | Optional expansions may enrich a world but may not become an undeclared requirement for Core progression. Their absence, version mismatch or removal must be detected before authoritative state is loaded. |
| Migration Direction | Migrations are ordered, deterministic, evidence-backed and executed against backups. Failure never overwrites the last known-good save or registry snapshot. |
| Expansion Direction | Document Set 26 is the first major expansion admission case. Set 25 defines the general packaging and compatibility contract; Set 26 retains authority over maritime content, detailed schemas, behaviour and final shipping composition. |
| Mod Direction | Initial public extensibility is data-pack-first. Arbitrary executable scripting, unrestricted file access and silent protected-field overrides are outside this document's approved initial boundary. |
| Implementation Boundary | This document defines production contracts and file responsibilities, not final Godot class names, command-line syntax, binary layout, cloud distribution, workshop integration, cryptographic implementation or user-interface design. Those belong to Document 18, 25E, 25L, 26O and owning tools. |
| Next Deliverable | 25E - Validation Architecture, Seed QA, Progression Reachability, Performance and Release Gates. |

# Revision History

| Version | Status | Summary |
| --- | --- | --- |
| 0.1 | Content Packaging and Migration Architecture Draft | Establishes the project-wide content-pack, manifest, authoring-source, normalisation, dependency, compilation, import/export, snapshot, migration, removal, recovery, mod and expansion-admission contracts required before automated validation and Core Production classification. |

# Document Purpose

Document 25D converts the identity kernel of Document 25B and the semantic contracts of Document 25C into a controlled content supply chain. It defines how a designer or tool creates authoritative content, how that content becomes normalised registry data, how separately owned facets assemble, how packs declare compatibility, how builds freeze exact snapshots, how worlds remember their generating content set, and how updates preserve saves when definitions, packs, namespaces or package topology change.

The document resolves the broad authoring-format question left open by Document 24L without pretending that one file format can efficiently author every Leyforge domain. It establishes a common interchange and build boundary while preserving specialised ownership for Atlas records, physical gameplay registries, Forge projects, localisation, presentation assets and technical bindings.

This document does not select the Core Production roster, define complete validator implementation, decide final Set 26 shipping composition, create maritime registries, design player-facing mod browsers, rewrite Document 18 or populate Blocks, Items, Recipes and Resources. It creates the package, authoring and migration contract those later tasks must follow.

# Design Sources and Supersession Rules

| Source | Authority Used by 25D |
| --- | --- |
| 00-02 - Vision, Loop and Progression | Preserve sandbox freedom, physical progression, multiple valid pathways, living-world consequence and seed-adaptive starts. Fixed POC content is not a packaging dependency. |
| 03-06 - Blocks, Items, Recipes and Resources | Preserve separate executable registries, inheritance, block-item links, substitutions, exact inputs/outputs and spreadsheet-scale authoring needs. Their POC lists and inconsistent numbering are not pack authority. |
| 07-17 - Gameplay Systems | Preserve each system's executable ownership, runtime state and cross-system interfaces. Packs may carry definitions and assets but do not transfer gameplay authority. |
| 18 - Technical Implementation Plan v0.1 | Retain versioned external schemas, validated registries, spreadsheet round-tripping, content hashes, atomic saves, backups, migrations, missing-content placeholders, data-mod-first boundaries and authoritative world manifests. Unreal-specific importers, modules and packaging are superseded. |
| 24A - Atlas Foundations | Primary authority for content-pack awareness, stable identities, aliases, content hashes, generation versions, saved deltas, dependency rules, long-running migration tests and world-manifest inspection. |
| 24L - Registry and Production Roadmap | Primary authority for manifests, dependencies, overrides, world manifests, mod boundaries, authoring workflow, provenance, save migration, removed-content recovery and release documentation. |
| 25A v0.2 | Governs production authority, POC archive isolation, decision/change records, major expansion admission, parallel development and Set 25 closure. |
| 25B v0.2 | Canonical authority for qualified IDs, namespace ownership, domain and extension admission, facets, field ownership, versions, hashes, aliases, tombstones, instance identity, spatial frames and optional expansion safety. |
| 25C v0.1 | Canonical authority for registered schemas, relationship and capability definitions, hard/soft reference semantics, completeness, fallback, reachability, expansion declarations and deterministic repair. |
| Approved Set 26 Direction | Locks a separate maritime/naval expansion and its dependency on Set 25. Detailed maritime record fields, behaviour, package partition and shipping tier remain owned by 26A-26O and Ash. |
| Forge Document Sets | Preserve Forge ownership of editable asset projects, reusable kits, exported models/textures/animations, sockets, previews and asset manifests. 25D governs how those outputs enter packs, not how they are authored internally. |

> **Supersession Rule**  
> Older documents that describe POC-labelled content packs, Unreal-specific import pipelines, silent load-order replacement, direct runtime spreadsheet use, unversioned persistent payloads or deletion of missing mod content are superseded by this document. Reusable principles remain valid only through the Godot/Summer Engine, stable-ID, pack-manifest and migration boundaries defined here.

> **No Duplicate Truth Rule**  
> Exported JSON, generated Godot Resources, compiled registries, previews, documentation tables and spreadsheets may represent the same logical definition, but they may not all be independently editable sources. The field-ownership declaration identifies which source is authoritative and which representations are generated, cached or review-only.

# Static Table of Contents

- Revision History
- 1. Locked Content-Pack and Authoring Identity
- 2. Source-Derived Direction and Canonical Resolution Boundary
- 3. Scope, Non-Goals and Handoff Boundaries
- 4. Canonical Terminology
- 5. Content Supply Chain and Layer Model
- 6. Field-Level Authoring Source Policy
- 7. Authoring Format Decision Matrix
- 8. Spreadsheet Authoring Contract
- 9. Canonical Structured Interchange Contract
- 10. YAML and Alternate Text Format Policy
- 11. Godot Resource and Runtime Artifact Boundary
- 12. Forge and Custom Authoring Tool Boundary
- 13. Repository Source Topology
- 14. Pack Identity, Namespace and Programme Topology
- 15. Pack Classifications and Trust Classes
- 16. Manifest Architecture
- 17. Required Manifest Field Groups
- 18. Dependency Modes and Semantics
- 19. Dependency Resolution, Load Order and Cycle Rules
- 20. Features, Build Profiles and Conditional Admission
- 21. Versioning and Compatibility Ranges
- 22. Definition Files, Shards and Domain Partitions
- 23. Compilation and Normalisation Pipeline
- 24. Extension-Facet Assembly and Field Conflict Rules
- 25. Patches, Overrides and Supersession
- 26. Import, Export and Round-Tripping
- 27. Field-Level Diff, Deletion and Destructive Change Protection
- 28. Registry Snapshots, Hashes and Build Lockfiles
- 29. World Manifest and Generated-World Compatibility
- 30. Migration Architecture
- 31. Migration Types and Ordered Execution
- 32. Definition Rename, Split, Merge and Replacement
- 33. Pack Absence, Removal, Quarantine and Reactivation
- 34. Missing-Content Preservation and Recovery
- 35. Rollback, Backup and Failed-Migration Behaviour
- 36. Distribution, Build Packaging and Release Channels
- 37. Data Mods, Security and Protected Authority
- 38. Official Major Expansion Admission
- 39. Document Set 26 Admission and Integration Boundary
- 40. Player-Authored Blueprints and Shared Content
- 41. Localisation, Generated Names and Font Coverage
- 42. Asset Bundles, Licensing and Provenance Transport
- 43. Tooling, Reports and Audit Evidence
- 44. Authoring and Review Workflow
- 45. Decisions Locked by 25D and Handoff to Later Documents
- 46. Risks, Redesign Triggers and Open Decisions
- Appendix A. Canonical Content-Pack Manifest Template
- Appendix B. Pack Dependency and Compatibility Matrix Template
- Appendix C. Field-Level Authoring Source Declaration
- Appendix D. Spreadsheet Import/Export Workbook Contract
- Appendix E. Migration Step and Chain Template
- Appendix F. Pack Removal, Quarantine and Reactivation Checklist
- Appendix G. Set 26 Major Expansion Admission Checklist
- Appendix H. Document 25D Acceptance Criteria

# 1. Locked Content-Pack and Authoring Identity

The content-pack and authoring layer is the controlled bridge between design truth and executable game data. It allows the project to use the best authoring method for each domain while producing one deterministic, inspectable and migration-safe runtime registry set.

> **Locked Rule**  
> A file does not become authoritative merely because it is convenient to edit or accepted by Godot. Every authoritative field must declare its owner, source format, schema, pack, version and generation path. Runtime content must be reproducible from those sources, and a released world must record the exact compiled snapshot it used.

| Architecture Layer | Meaning | Production Result |
| --- | --- | --- |
| Authoring Source | Human- or tool-edited source that owns declared field paths. | Designers know where a change must be made and do not edit generated copies. |
| Normalised Interchange | Schema-preserving structured representation assembled from all owning sources. | Validators and compilers receive deterministic data independent of editor UI. |
| Compiled Registry | Optimised Godot-facing definitions, indexes and lookup tables. | Runtime does not parse spreadsheets or loosely typed design files. |
| Content Pack | Versioned package of definitions, assets, localisation, interfaces, migrations and evidence. | Dependencies, ownership and compatibility can be tested and distributed. |
| Registry Snapshot | Immutable build-specific set of compiled definitions and hashes. | Saves and multiplayer sessions can prove which content truth they used. |
| World Manifest | Save-owned record of seed, generation contract, packs, snapshots, selected definitions and migration chain. | Long-lived worlds can load, diagnose mismatch and migrate safely. |
| Migration Chain | Ordered transformation from one compatible persistent contract to another. | Updates preserve identity, inventory, structures, relationships and history. |
| Quarantine Record | Preserved authoritative state whose owning pack cannot currently load. | Missing optional content does not vanish or become unrelated core content. |

# 2. Source-Derived Direction and Canonical Resolution Boundary

| Classification | Treatment in 25D |
| --- | --- |
| Source-Derived Rule | The Atlas and technical foundation require versioned schemas, content packs, dependencies, aliases, hashes, world manifests, spreadsheet round-tripping, migrations, backups and removed-content preservation. |
| 25B Dependency | Pack IDs, namespaces, definitions, extension facets, aliases, tombstones, persistent instances and local spatial frames already have canonical identity rules. |
| 25C Dependency | Packs must carry compatible schema/interface versions and may not bypass relationship, capability, suitability, fallback, reachability or completeness contracts. |
| 25D Canonical Resolution | Establishes one field-owner source policy; spreadsheet plus structured-interchange workflow; generated Godot Resource boundary; manifest field groups; dependency modes; deterministic compile order; snapshot hashes; migration steps; optional-pack quarantine and expansion admission. |
| Recommendation | Use normalised JSON as the common repository interchange and validator/compiler input; use spreadsheets for approved bulk tables; use Forge/custom tools for complex authored projects; generate Godot Resources and runtime packs. |
| Deferred Decision | Exact Godot classes, binary cache layout, package file extension, command names, signing technology, distribution service and player-facing recovery UI remain for Document 18, 25E, 25L and 26O. |

# 3. Scope, Non-Goals and Handoff Boundaries

## 3.1 In scope

- pack identity, namespace and version;
- official, development, test, archive, community and player-authored pack classes;
- manifest structure and dependency semantics;
- authoring-source ownership and generated-copy rules;
- spreadsheet imports and exports;
- normalised structured interchange;
- Godot Resource generation boundary;
- Forge/custom-tool output contracts;
- pack compilation, extension-facet assembly and patch order;
- registry snapshots, hashes and world manifests;
- definition and save migration contracts;
- pack absence, removal, quarantine, reactivation and recovery;
- data-mod boundaries and protected authority;
- official expansion admission using Set 26 as the first case;
- evidence and reports consumed by 25E and release gates.

## 3.2 Explicit non-goals

This document does not:

- design vessel, fluid, wave, tide, storm, port, crew, fleet or naval combat fields;
- decide whether Set 26 is base-game, optional DLC, staged content or a mixed package;
- author final registry rows;
- define the complete UI for load mismatches or mod management;
- approve executable community scripting;
- choose final source-control hosting or distribution storefronts;
- define final encryption, signatures or anti-cheat;
- guarantee downgrade compatibility from every future build;
- permit a pack to override source-of-truth ownership through priority alone.

## 3.3 Handoff boundaries

| Owner | Receives from 25D | Remains owned elsewhere |
| --- | --- | --- |
| 25E | Manifest schemas, dependency modes, authoring rules, snapshot contract, migration states and failure classes. | Validator implementation, seed suites, performance tests and release automation. |
| 25F-25G | Pack and build-profile classification fields, dependency requirements and optional-content rules. | Core Production selection and package dependency matrix. |
| 25H-25J | Approved source formats and pack partitions for physical registries. | Actual block, item, resource, loot and recipe content. |
| 25K | Asset-manifest transport, provenance fields, pack placement and source/output distinction. | Detailed asset budgets and licensing policy. |
| 25L | Release lockfile, migration evidence, integration debt and pack admission status. | Final implementation backlog and closure audit. |
| Document 18 | Runtime registry compiler, Godot Resource topology, save loader, pack loader, migration runner and tooling implementation. | Gameplay meaning and content ownership. |
| Set 26 | General expansion manifest, optional dependency, local-frame persistence and removal rules. | Detailed maritime contracts, package partition and system behaviour. |

# 4. Canonical Terminology

| Term | Definition |
| --- | --- |
| Pack | Versioned unit declaring content, assets, localisation, interfaces, dependencies, compatibility, migrations and validation evidence. |
| Programme | A documentation and production initiative that may produce one or more distributable packs. Document Set 26 is a programme until shipping topology is approved. |
| Pack Manifest | Authoritative self-description of a pack and its dependencies, files, versions, hashes, migration and validation requirements. |
| Build Profile | Named product configuration that declares which packs/features are required, optional, excluded or development-only. |
| Authoring Source | The editable source owning a field path or project asset. |
| Normalised Interchange | Canonically ordered schema-preserving structured data used for validation, diffing and compilation. |
| Generated Artifact | Reproducible output that must not be edited as independent truth. |
| Registry Snapshot | Immutable content-addressed compiled registry set for one build/profile. |
| Pack Lockfile | Resolved pack versions, hashes, dependency graph, interface versions and compile order for a build or world. |
| World Manifest | Persistent save record describing world generation, active content, selected definitions, snapshots, migration history and unresolved content state. |
| Patch Pack | Pack whose declared purpose is to modify permitted fields of compatible target definitions without claiming their identity. |
| Extension Facet | Schema-keyed separately owned fields attached to an existing definition under 25B-25C rules. |
| Quarantine | Safe unavailable state preserving identity and persistent data while its owning pack or compatible definition is absent. |
| Reactivation | Validated restoration of quarantined records after the owning pack or approved replacement returns. |
| Tombstone | Persistent identity record for deprecated, removed or historically destroyed content. |
| Migration | Versioned deterministic transformation of definition references, persistent records, manifests or package topology. |
| Rollback | Return to a previous known-good application/content/save set using preserved backups and compatible snapshots. |
| Provenance | Traceable origin, authoring tool, licence, contributor/source and transformation history for content or assets. |

# 5. Content Supply Chain and Layer Model

Leyforge uses a staged content supply chain. Each stage has one purpose and may not absorb the authority of another stage.

| Stage | Inputs | Outputs | Editable? |
| --- | --- | --- | --- |
| Design Authority | Approved documents, decisions, Atlas foundations and owning registry rules. | Field ownership, schemas, package scope and content requirements. | Yes through controlled document revision. |
| Domain Authoring | Spreadsheets, structured text, Forge projects and approved custom editors. | Authoritative source records and projects. | Yes by declared owners. |
| Normalisation | Importers convert owned sources into deterministic structured records. | Normalised interchange plus source map and diagnostics. | Generated; fix upstream. |
| Validation | Schema, ownership, references, dependencies, completeness and policy checks. | Pass/fail report and proposed changes. | Reports only. |
| Compilation | Facet assembly, derived indexes, localisation bindings and Godot-facing conversion. | Compiled registries and engine resources. | Generated. |
| Packaging | Definitions, assets, localisation, migrations and evidence are bundled. | Versioned pack and manifest. | Manifest source is editable; bundle is generated. |
| Build Resolution | Build profile resolves dependencies and produces lockfile/snapshot. | Immutable build registry snapshot. | Generated and archived. |
| World Generation | World profile and seed select compatible definitions. | World manifest, generated bindings and initial persistent records. | Generated and save-owned. |
| Runtime and Save | Authoritative simulation changes instances and state. | Deltas, histories, inventories, structures and relationships. | Runtime-owned only. |
| Update/Migration | New packs/schemas meet old manifest and save. | Migrated save or explicit incompatibility/quarantine report. | Controlled migration only. |

> **Upstream Fix Rule**  
> When a generated output is wrong, repair the owning source, importer, schema or compiler. Editing the generated output is not a valid production fix unless the artifact has been explicitly reclassified as an authoritative source through a recorded decision.

# 6. Field-Level Authoring Source Policy

A Leyforge definition may be assembled from several authoritative facets, but each field path has exactly one authoring source.

## 6.1 Authoring-source declaration

Each field-ownership declaration must identify:

- definition or schema scope;
- field path or field group;
- canonical owner document/domain;
- authoring source type;
- source path pattern;
- pack and namespace;
- importer/tool identifier and version;
- whether the field is authored, generated, derived, cached or runtime-only;
- review owner;
- replacement and migration consequences.

## 6.2 Permitted source patterns

| Pattern | Permitted Use | Restriction |
| --- | --- | --- |
| Spreadsheet-owned facet | Large flat or relational registries, balancing tables and bulk metadata. | Must import through schema-aware mapping and preserve stable IDs. |
| JSON-owned facet | Complex structured definitions, manifests, relationships, schemas and migration descriptors. | Must use canonical ordering and schema validation. |
| Forge-owned project | Voxel/model/animation/blueprint authoring and asset metadata. | Exports normalised manifests; gameplay fields remain with gameplay owners. |
| Custom-editor-owned project | Graphs, route networks, dungeon grammars or future specialised content. | Editor must export canonical interchange and source map. |
| Approved Godot Resource source | Rare engine-coupled configuration where direct resource authoring is explicitly approved. | Cannot duplicate a JSON/spreadsheet-owned field; must remain text-diffable or exportable. |
| Generated field | Reverse indexes, hashes, compiled paths, derived capability maps and caches. | Never hand edited. |
| Runtime-only field | Current ownership, damage, inventory, route state, population or spatial transform. | Never stored in definition authoring sources. |

## 6.3 Prohibited patterns

- the same field edited in both spreadsheet and JSON;
- display text used as identity;
- runtime save state copied back into definitions;
- hidden editor metadata required to interpret a released definition but omitted from source control;
- binary-only authoritative records without deterministic export;
- manually changed generated Godot Resources;
- pack priority used to claim another owner's field;
- undocumented local scripts that transform production data without version/provenance records.

# 7. Authoring Format Decision Matrix

The project requires specialised authoring but one normalised build boundary.

| Content Type | Preferred Human Authoring | Canonical Build Interchange | Godot-Facing Output | Notes |
| --- | --- | --- | --- | --- |
| Universal schemas and interfaces | JSON | Normalised JSON | Generated registry resources/classes | Schema definitions require stable diff and strict typing. |
| Pack manifests and migrations | JSON | Normalised JSON | Pack metadata and migration registry | Small, nested and release-critical. |
| Blocks, Items, Recipes, Resources | Spreadsheet workbooks plus approved JSON extensions | Normalised JSON | Generated typed Resources/compact registry tables | Bulk rows benefit from spreadsheet review; nested extensions remain structured. |
| Atlas classification and package matrices | Spreadsheet/database view | Normalised JSON exports | Planning and generated registry facets | Prose documents remain design authority; structured rows drive production. |
| Relationships and capabilities | Spreadsheet edge tables or graph editor | Normalised JSON | Generated graph/index resources | Freeform text is not canonical. |
| NPC, creature, biome, structure and quest definitions | Mixed spreadsheet and structured editors | Normalised JSON | Generated Resources/scenes/bindings | Owner declares each facet source. |
| Forge assets and blueprints | Forge project source | Export manifest JSON plus asset files | Imported Godot resources/scenes | Forge does not own unrelated gameplay data. |
| Localisation | Translation tables or localisation tool | Normalised locale catalogues | Godot localisation resources | Identity keys remain namespace-safe. |
| Build profiles and pack lockfiles | JSON source for profiles; lockfile generated | Normalised JSON | Build configuration | Lockfiles are immutable generated evidence. |
| Runtime saves | Not human authored | Versioned binary or structured records selected by Document 18 | Save records | Must remain inspectable through tools and schemas. |

> **Working Format Lock**  
> Normalised JSON is the common validator/compiler interchange for initial production. Spreadsheets and specialised tools may be authoritative authoring sources for their declared fields. Generated Godot Resources are the default engine-facing representation. YAML is not an initial canonical content source unless a later recorded decision proves a specific need and defines strict parser/schema behaviour.

# 8. Spreadsheet Authoring Contract

Spreadsheets remain valuable for large registries, but they are controlled authoring tools rather than runtime databases.

## 8.1 Workbook requirements

Every production workbook must include:

- workbook manifest sheet;
- workbook schema/version;
- pack ID and namespace;
- owner and review owner;
- one stable primary key column per authored entity;
- explicit null/empty semantics;
- field-path mapping;
- type and allowed-value metadata or linked schema;
- source rows separated from generated/read-only columns;
- import status and last validated snapshot;
- no merged cells in machine-readable sheets;
- stable sheet identifiers independent of display tab names;
- protected formula/generated columns where practical.

## 8.2 Relational sheet pattern

Complex registries should use related sheets rather than encoded prose cells.

| Sheet Role | Example Columns |
| --- | --- |
| Definitions | definition_id, parent_id, family_id, status, tier, owner, source_pack |
| Tags | definition_id, tag_id, mode |
| Relationships | edge_id, source_id, relationship_type, target/reference_query, strength, condition_id |
| Capability Offers | definition_id, capability_id, band, capacity, conditions |
| Capability Requirements | definition_id, capability_id, minimum_band, fallback_group, guarantee_class |
| Variants | variant_id, base_id, profile_id, changed_field_group |
| Localisation | key, default_text, context, character_limit, accessibility_note |
| Planning | definition_id, milestone, asset status, implementation status, issue link |

## 8.3 Spreadsheet safety rules

- IDs are text and must never be automatically converted to numbers or dates.
- Decimal separators and numeric precision are locale-independent.
- Boolean values use one approved literal set.
- Lists are not stored as comma-separated prose when order or escaping matters.
- Formula outputs are not authoritative unless imported as declared derived fields.
- Deleting a row does not delete a definition; it creates a proposed deletion requiring tombstone/migration review.
- Re-import compares field-level values against the current normalised snapshot.
- Unknown columns are rejected or explicitly classified as non-production notes.
- Hidden sheets and cells cannot carry required production truth.
- External workbook links are not allowed in released sources.

# 9. Canonical Structured Interchange Contract

Normalised JSON provides the common boundary between authoring tools and validation/compilation.

## 9.1 Canonicalisation requirements

- UTF-8 encoding;
- deterministic key ordering in generated snapshots;
- stable array ordering where order is semantic;
- explicit sorting keys where order is not semantic;
- no comments in canonical runtime/interchange JSON;
- explicit null semantics;
- no implicit numeric/string coercion;
- finite numeric values only;
- canonical path separators;
- stable line endings;
- schema ID and schema version in every top-level document or shard;
- source map linking each field to its owning authoring source;
- generator/importer version and timestamp in build metadata, not semantic hashes unless required;
- content hash calculated from canonical semantic content rather than filesystem timestamps.

## 9.2 File granularity

The interchange may use:

- one definition per file for high-complexity authored content;
- domain shards for large flat registries;
- edge/capability files for relationship tables;
- package-level indexes for fast discovery;
- generated aggregate indexes for runtime compilation.

File granularity is a tooling decision. Stable identity and semantic hashes may not depend on arbitrary file grouping.

## 9.3 Source maps

Each normalised record must retain sufficient provenance to identify:

- source file/project/workbook;
- source sheet/object/record;
- source revision or commit;
- authoring tool and importer version;
- owning facet and field group;
- generated/derived fields;
- warnings or accepted exceptions.

# 10. YAML and Alternate Text Format Policy

YAML is readable but introduces parser, typing, anchor, merge and whitespace behaviours that can differ across tooling. It is therefore not part of the initial canonical production path.

## 10.1 Initial policy

- YAML may be used in non-production experiments or documentation examples.
- YAML may not be the sole authoritative source for released definitions, manifests, migrations or world-generation contracts in the initial pipeline.
- A future YAML admission requires one approved parser/version, disabled unsafe tags, explicit schema validation, canonical JSON conversion and round-trip tests.
- TOML, CSV, XML or custom text formats follow the same admission requirement.
- CSV may be used only as an export/import transport for a single flat sheet, not as a complete pack format.

This policy avoids multiplying canonical formats before the registry kernel and validators are proven.

# 11. Godot Resource and Runtime Artifact Boundary

Godot Resources are valuable for editor integration, typed references, asset linking and efficient runtime loading, but they should not automatically become the project's universal authoring truth.

## 11.1 Default rule

- Normalised definitions compile into generated typed Godot Resources, custom binary tables or another validated runtime format selected by replacement Document 18.
- Generated `.tres`, `.res`, scene fragments or registry caches are marked as generated and not edited manually.
- The build records which source snapshot and generator produced each artifact.
- Asset-bearing Resources may reference imported models, textures, audio, VFX, scenes and scripts through validated presentation facets.
- Runtime lookups use qualified IDs and compiled indexes, not filesystem paths as identity.

## 11.2 Exceptional hand-authored Resources

A Godot Resource may be authoritative only when:

- the owning document identifies a genuinely engine-coupled configuration;
- the field-ownership map assigns the relevant fields to that Resource;
- no spreadsheet/JSON/Forge source owns the same fields;
- deterministic text export, schema validation and migration are available;
- mod and headless build tooling can consume it;
- Ash or the delegated architecture authority approves the exception.

## 11.3 Scene boundary

Scenes are presentation and composition assets, not identity authority for persistent gameplay definitions. A scene may implement a definition, but the definition ID, pack, schema, capabilities and save contract remain in the registry.

# 12. Forge and Custom Authoring Tool Boundary

Forge systems own editable asset projects and specialised authoring experiences. Their outputs enter content packs through explicit manifests.

## 12.1 Forge-owned truth

Forge may own:

- voxel/model geometry source;
- texture and material source;
- animation timelines and clips;
- skeleton/rig source;
- sockets and attachment points;
- blueprint geometry and modular composition authored in Forge;
- preview scenes and icon snapshots;
- asset-specific performance metadata;
- export settings and compatible target profiles.

## 12.2 Registry-owned truth

Forge does not independently own:

- gameplay damage, progression tier or economy value;
- world-generation distribution;
- creature ecology;
- recipe inputs/outputs;
- NPC permissions or faction law;
- quest state;
- authoritative vessel physics or naval behaviour;
- save/migration policy.

Those fields remain with owning registries and Set 26/main documents.

## 12.3 Forge export contract

Each Forge export supplies:

- asset ID and source project ID;
- source definition IDs;
- exported file list and hashes;
- tool and export profile versions;
- scale, pivots, collision and LOD class;
- sockets/events and semantic roles;
- platform/import requirements;
- source/provenance/licence references;
- dependency pack IDs;
- generated preview/icon references;
- validation evidence and known warnings.

# 13. Repository Source Topology

The exact folder names may change during Document 18 implementation, but the responsibility topology is locked.

| Source Area | Responsibility |
| --- | --- |
| `/Docs` | Approved design documents, decision records, ownership maps and integration registers. |
| `/Schemas` | Universal/domain/extension schemas, relationship types, capabilities and manifest schemas. |
| `/Authoring/Spreadsheets` | Authoritative bulk registry workbooks. |
| `/Authoring/Definitions` | Hand-authored structured definition and configuration sources. |
| `/Authoring/Forge` | Forge project sources and related metadata. |
| `/Authoring/Localisation` | Localisation catalogues and generated-name source rules. |
| `/Packs/<pack_id>/manifest` | Pack manifest source, dependency declarations and feature definitions. |
| `/Migrations` | Versioned migration descriptors, scripts or data maps selected by Document 18. |
| `/Generated/Normalised` | Normalised interchange; reproducible and not hand edited. |
| `/Generated/Registries` | Compiled Godot-facing registries and indexes. |
| `/Generated/Reports` | Validation, diff, snapshot, provenance and migration reports. |
| `/Tests/Fixtures` | Pack combinations, old saves, missing-content cases and deterministic snapshots. |
| `/Archive/POC` | Non-shipping POC documents, data, scenes, assets, saves and regression fixtures. |

Generated outputs may be committed when this improves review, deterministic builds or distribution, but their generated status and source hash must remain explicit.

# 14. Pack Identity, Namespace and Programme Topology

A documentation set is not automatically one content pack. A major programme may produce several domain, asset, localisation or compatibility packs while presenting one player-facing product.

## 14.1 Pack identity

Each pack has:

- qualified `pack_id`;
- owned namespace or permitted namespace contribution;
- semantic version;
- pack class and trust class;
- release channel;
- content/interface/schema compatibility;
- dependencies and conflicts;
- feature declarations;
- definition/assets/localisation/migration indexes;
- validation evidence;
- removal and recovery policy.

## 14.2 Namespace topology

- `leyforge.core` remains the initial official production namespace.
- Official expansions receive an approved namespace or controlled contribution arrangement through 25B and 25D admission.
- A pack does not gain authority over every ID in a namespace merely by loading first.
- Community packs own their allocated namespaces.
- Patch packs reference target IDs but do not impersonate target ownership.
- Archive, test and development namespaces cannot enter shipping profiles unless explicitly allowed for a test build.

## 14.3 Programme versus pack

Set 26 may eventually be:

- one official expansion pack;
- an umbrella product containing several required subpacks;
- base-game system updates plus optional maritime content packs;
- staged release channels;
- a mixed arrangement.

This remains pending. Early Set 26 work may use provisional package identifiers, but persistent or public IDs freeze only after 26A, 25D/25F and Ash approve the topology.

# 15. Pack Classifications and Trust Classes

## 15.1 Functional pack classes

| Pack Class | Purpose | Example Responsibility |
| --- | --- | --- |
| Foundation | Registry kernel, schemas, shared interfaces and protected system data. | Identity, schema and capability libraries. |
| Core Gameplay | Required executable definitions for a build profile. | Core blocks/items/recipes or world systems. |
| World Content | Biomes, cultures, ecology, structures, realms and events. | Core Production content slice. |
| Expansion | Optional or profile-required major content/system extension. | Approved Set 26 output. |
| Asset | Models, voxel kits, textures, audio, VFX, animations and icons. | Forge or presentation bundles. |
| Localisation | Locale catalogues, fonts and locale-specific assets. | English or future translations. |
| Compatibility | Aliases, patches, migrated data or integration adapters. | Old ID conversion or cross-version bridge. |
| Development | Debug definitions, diagnostics and editor-only test content. | Seed probes or test machines. |
| Test Fixture | Deterministic validation content and old-save fixtures. | POC regression or missing-pack tests. |
| Archive | Historical content excluded from normal builds. | `leyforge.archive.poc`. |
| Community Data | User/community definitions within approved data boundaries. | New biome or recipe pack. |
| Player-Authored | Blueprints or authored creations tied to users/worlds. | Shared structure or vessel blueprint. |

## 15.2 Trust classes

| Trust Class | Meaning | Permission Boundary |
| --- | --- | --- |
| Protected Official | Foundation and authority-critical official data. | May define protected schemas/interfaces and release migrations. |
| Official | Reviewed Leyforge content or expansion. | May use approved extension points and official namespaces. |
| Signed Partner | Approved external package with controlled interfaces. | No protected authority unless explicitly granted. |
| Community Data | Untrusted data-only content. | Sandboxed paths, quotas and schema-approved fields. |
| Local Development | Developer-generated or experimental. | Never admitted to normal public saves without profile warning. |
| Archive/Test | Historical or validation-only. | Excluded from shipping generation and normal matchmaking. |

# 16. Manifest Architecture

The manifest is the authoritative package contract. It is structured data, versioned independently from the definitions it indexes and validated before pack contents load.

## 16.1 Manifest layers

| Layer | Purpose |
| --- | --- |
| Identity | Pack ID, display/localisation keys, owner, namespace, version and class. |
| Compatibility | Engine/build, registry kernel, schema, interface and pack version ranges. |
| Dependencies | Required, optional, build-profile-required, soft and incompatible packs/features. |
| Content Index | Definition shards, schemas, relationships, capabilities, localisation, assets and counts/hashes. |
| Assembly | Facet contribution, patch targets, compile phase and deterministic ordering constraints. |
| Runtime | Required services, simulation classes, authority requirements and platform constraints. |
| Persistence | Save record families, world-manifest requirements, migration and removal policy. |
| Distribution | Release channel, package files, compression/import class and optional download group. |
| Security | Trust class, permissions, script policy, file roots and integrity/signature metadata. |
| Validation | Required validator profile, passed suites, evidence hashes and accepted waivers. |
| Provenance | Source repository/revision, build generator, licences and source-manifest references. |

## 16.2 Manifest immutability

A released manifest version is immutable. Corrections require a new pack version. Build metadata such as local build timestamp may exist outside the semantic manifest hash.

# 17. Required Manifest Field Groups

| Field Group | Minimum Fields |
| --- | --- |
| Identity | pack_id, manifest_schema_version, pack_version, pack_class, trust_class, owner, display_name_key, description_key, release_channel |
| Namespace | owned_namespaces, contributed_namespaces, protected_scope_requests, ID allocation authority |
| Compatibility | game_build_range, registry_kernel_range, schema_ranges, interface_ranges, worldgen compatibility, platform profile |
| Dependencies | dependency ID, mode, version range, required features, reason, failure behaviour |
| Conflicts | incompatible pack/features, reason, detection phase and recovery guidance |
| Content | definition files, schema/facet registrations, relationship/capability files, localisation, assets, migrations, counts and hashes |
| Assembly | compile phase, extension targets, patch declarations, priority within allowed class, merge policy |
| Runtime | services/interfaces required, authority class, simulation LOD classes, memory/performance class |
| Persistence | save record owners, world-manifest fields, removal mode, quarantine handler, migration chain |
| Distribution | bundle groups, optional downloads, locale packs, source/debug inclusion and licence notices |
| Security | allowed data types, executable code flag, file roots, permissions, signature/integrity class |
| Validation | validator version/profile, required suites, pass report hash, seed/migration fixtures and known warnings |
| Provenance | source revision, generator/importer versions, asset/source manifests, licence/provenance references |

# 18. Dependency Modes and Semantics

Dependency language must be precise enough to validate build profiles and save compatibility.

| Dependency Mode | Meaning | Missing Behaviour |
| --- | --- | --- |
| Required | Pack cannot compile, load or preserve its declared contract without the dependency. | Block pack/build/world load until installed or migrated. |
| Build-Profile Required | Dependency is mandatory only when a named product/profile enables the feature. | Profile resolution fails; other profiles may remain valid. |
| Optional | Pack detects and integrates with the dependency through declared extension points. | Feature is absent; base package remains complete. |
| Soft | Enrichment such as presentation or documentation may be missing without gameplay corruption. | Warning and declared fallback/omission. |
| Incompatible | Packs or feature versions cannot safely coexist. | Resolution fails before load; user receives conflict report. |
| Development Only | Required for authoring, testing or generation but not runtime distribution. | Build pipeline fails; released runtime may omit. |
| Migration Only | Needed temporarily to transform older data. | Migration cannot proceed; last good save remains. |

## 18.1 Dependency requirements

Every dependency declaration states:

- target pack or provided interface;
- version/compatibility range;
- mode;
- feature gate or build profile;
- reason;
- compile/load phase;
- missing behaviour;
- fallback or migration;
- whether it affects world generation, saves or multiplayer joining.

> **No Hidden Dependency Rule**  
> A direct hard reference, owned extension facet, required interface, asset path, migration handler or persistent record owned by another pack creates a manifest dependency. Tooling must derive and compare actual dependencies against declared dependencies.

# 19. Dependency Resolution, Load Order and Cycle Rules

## 19.1 Resolution order

1. select build profile and requested packs;
2. read manifests only;
3. validate manifest schema and identity;
4. resolve required and profile-required dependencies;
5. evaluate incompatible packs/features;
6. resolve schema/interface compatibility;
7. create deterministic dependency graph;
8. reject forbidden cycles;
9. establish compile phases and patch order;
10. hash resolved lockfile;
11. load and validate content;
12. compile registry snapshot.

## 19.2 Load-order rule

Load order is derived from dependency and compile-phase rules. It is not a user-controlled method for deciding which pack silently wins.

## 19.3 Cycle policy

- Required dependency cycles are rejected unless all members are approved as one atomic umbrella package with an acyclic internal build plan.
- Optional mutual integration uses independently declared extension facets or compatibility packs, not required cycles.
- Runtime service dependencies follow Document 18 module/interface direction and may not be inferred from content load order.
- Asset packs may depend on definition packs; definition packs should use soft asset references/fallbacks where dedicated headless/server profiles must omit presentation data.

# 20. Features, Build Profiles and Conditional Admission

A pack may expose named features so a build profile can require only the intended contract.

## 20.1 Feature declaration

A feature has:

- feature ID;
- owner pack;
- description/localisation key;
- required schemas/interfaces;
- required and optional pack dependencies;
- definition/asset groups;
- save and worldgen impact;
- removal and fallback behaviour;
- multiplayer compatibility effect;
- validation profile.

## 20.2 Build profiles

Illustrative profiles include:

- editor/development;
- automated headless validation;
- Core Production client;
- Core Production server/headless authority;
- Core plus selected official expansion;
- accessibility/localisation test;
- archive regression;
- migration laboratory.

The exact public release profiles remain pending. Build profiles are configuration authority, not production-tier decisions.

# 21. Versioning and Compatibility Ranges

Pack version, schema version, interface version, worldgen version, save version and asset export version are separate concerns.

| Version Type | Governs | Change Example |
| --- | --- | --- |
| Pack Version | Distributed package content and contract. | New definitions or corrected assets. |
| Manifest Schema Version | Shape of manifest itself. | New dependency field. |
| Definition Schema Version | Fields and semantics for a domain/facet. | New required block state contract. |
| Interface Version | Capability/service contract between packs/systems. | New mobile-container persistence interface. |
| Registry Snapshot Version/Hash | Exact compiled content set. | Any semantic compiled change. |
| Worldgen Version | Base generation algorithm and named sub-seed contract. | Region assembly change. |
| Save/Record Version | Persistent serialisation contract. | NPC record or vessel state change. |
| Asset Export Version | Forge/importer output contract. | Socket or material export change. |
| Migration Version | Transformation logic and postconditions. | Definition split or pack topology change. |

## 21.1 Versioning policy

- Pack versions use semantic versioning as the initial working convention.
- Compatibility ranges are explicit and machine parsed.
- A minor pack update may still require save migration; semantic version alone does not imply persistence safety.
- Schema/interface breaking changes require new major compatibility boundaries or approved adapters.
- Hash equality proves exact semantic snapshot identity; version equality alone does not.
- Pre-release/experimental profiles may use stricter compatibility warnings.

# 22. Definition Files, Shards and Domain Partitions

Large registries require partitioning, but partitioning must not alter identity or ownership.

## 22.1 Partition principles

- shard by domain, family, pack or authoring workflow where practical;
- preserve one logical definition assembly record;
- do not split one owner field group across files without an explicit composition schema;
- each file declares schema, pack, source and semantic hash;
- indexes are generated;
- cross-shard references use qualified IDs;
- moving a record between files does not change its definition ID;
- persistent save references never store source file paths.

## 22.2 Large asset and locale separation

Definitions may reside in a lightweight gameplay pack while large presentation assets or locale catalogues use soft/conditional packs. Headless authority profiles must still resolve gameplay identity and required collision/navigation data.

# 23. Compilation and Normalisation Pipeline

## 23.1 Required stages

1. discover authoritative sources from ownership declarations;
2. import spreadsheets and specialised-tool exports;
3. normalise types, IDs, paths and ordering;
4. validate source maps and ownership;
5. validate schemas and conditional fields;
6. register domain and extension schemas;
7. assemble parent/default inheritance;
8. assemble extension facets under field-owner rules;
9. validate relationships, capabilities and completeness;
10. resolve localisation and presentation references;
11. generate reverse indexes, query indexes and derived fields;
12. produce compiled Godot-facing artifacts;
13. calculate semantic hashes;
14. produce pack indexes, reports and snapshot lockfile;
15. run 25E build/seed/migration gates;
16. package only after required evidence passes.

## 23.2 Determinism

Given the same source revisions, importer/compiler versions, build profile and dependency lockfile, the pipeline must produce semantically identical normalised data, compiled registry hashes and pack indexes.

## 23.3 No editor-only dependency

The headless build and validator pipeline must compile production data without manually opening every asset or scene in an editor. Tool import steps must be scriptable and report failures.

# 24. Extension-Facet Assembly and Field Conflict Rules

Set 25 permits one logical definition to receive separately owned facets. Pack assembly must preserve that rule.

## 24.1 Assembly order

1. universal definition envelope;
2. parent and family defaults;
3. owning domain facet;
4. approved extension facets;
5. variant/profile composition;
6. permitted patch operations;
7. generated/derived fields;
8. validation and hash.

## 24.2 Conflict behaviour

- two facets claiming the same canonical field path are a blocking ownership conflict;
- a patch may change only fields explicitly permitted by target schema/manifest;
- arrays/maps declare merge semantics rather than relying on generic replacement;
- generated fields cannot be patched directly;
- optional extension failure removes/quarantines only that extension when the base definition remains complete;
- identity-critical extension failure blocks the pack/profile;
- conflicts produce a field-level report naming both owners and source locations.

# 25. Patches, Overrides and Supersession

Core IDs and official definitions are not silently replaced.

## 25.1 Patch declaration

A patch pack declares:

- patch ID and owner;
- target qualified ID and compatible target versions/hashes;
- exact field operations;
- permission/interface authorising each operation;
- priority within the approved patch class;
- expected previous value or condition;
- conflict policy;
- save/migration impact;
- uninstall/reversion behaviour;
- validation fixtures.

## 25.2 Permitted operations

- add an optional relationship or provider;
- contribute an extension facet;
- add localisation or presentation alternatives;
- adjust approved balance/configuration fields within protected ranges;
- deprecate through official compatibility pack;
- correct invalid data through a new official version.

## 25.3 Prohibited operations

- changing another pack's stable ID owner;
- replacing personhood/culture identity through load priority;
- deleting required capabilities without migration;
- altering save authority or security boundaries;
- changing worldgen identity of explored content silently;
- duplicating unique rewards or relics during uninstall/reinstall;
- patching generated hash/index fields.

# 26. Import, Export and Round-Tripping

## 26.1 Export contract

Exports for review or spreadsheet editing must include:

- stable qualified IDs;
- pack, namespace and schema versions;
- field ownership and source status;
- aliases, parents and variants;
- relationships and capabilities;
- null/default/derived distinction;
- category-specific extensions;
- current normalised snapshot hash;
- export tool/version;
- read-only generated columns clearly marked.

## 26.2 Re-import contract

Re-import must:

- validate workbook/file identity;
- compare against the exported baseline hash;
- reject changed IDs unless an explicit rename/migration operation exists;
- create a field-level diff;
- identify concurrent source changes;
- refuse silent deletion of fields omitted by the export format;
- preserve nested fields not owned by that source;
- require explicit acceptance for destructive changes;
- regenerate normalised data and rerun validation.

## 26.3 Partial exports

A filtered export cannot be re-imported as a complete replacement unless its scope and deletion behaviour are explicit. Omitted records remain unchanged by default.

# 27. Field-Level Diff, Deletion and Destructive Change Protection

Every import, patch, migration or pack update produces a semantic diff.

| Diff Class | Example | Required Action |
| --- | --- | --- |
| Additive | New optional biome or localisation key. | Validate dependencies/completeness. |
| Compatible Modification | Balance value or presentation reference within approved contract. | Review, test and snapshot. |
| Identity-Affecting | Parent, family, uniqueness or ownership change. | Migration and reverse-reference review. |
| Reference-Breaking | Removed target or changed interface. | Block until alias, replacement, fallback or migration exists. |
| Persistence-Affecting | Save record fields or state semantics change. | Save migration fixture required. |
| Worldgen-Affecting | Suitability, exclusions, generation version or provider guarantee changes. | Seed comparison and unexplored-world policy required. |
| Destructive | Definition deletion, inventory conversion or unique-content removal. | Explicit approval, backup, recovery and user-facing impact. |
| Security/Authority | Permissions, scripting or authoritative transaction changes. | Architecture/security review; cannot be ordinary content patch. |

Deletion is a lifecycle operation, not a missing row. Definitions move through deprecation, replacement/tombstone and migration states before physical source removal.

# 28. Registry Snapshots, Hashes and Build Lockfiles

## 28.1 Registry snapshot

A snapshot contains:

- build profile ID;
- resolved pack lockfile;
- pack and manifest hashes;
- schema/interface version map;
- definition semantic hashes;
- relationship/capability library hashes;
- compiled registry/index hashes;
- localisation and asset bundle hashes where required;
- compiler/importer versions;
- validation report references;
- creation source revision;
- approved exceptions.

## 28.2 Semantic hashing

Hashes must exclude irrelevant local metadata such as file modification time and include all fields that can change gameplay, generation, presentation requirements, persistence or compatibility. Separate hashes may exist for gameplay, presentation and localisation layers.

## 28.3 Build lockfile

The lockfile records exactly which pack versions and features were resolved and the deterministic compile order. It is archived with the build and referenced by worlds created under that build.

# 29. World Manifest and Generated-World Compatibility

The world manifest is the save's content identity anchor.

## 29.1 Minimum world-manifest fields

- world and realm IDs;
- master seed and world profile;
- worldgen and named-sub-seed derivation versions;
- game/build version;
- registry snapshot ID/hash;
- enabled packs, versions, hashes and features;
- schema/interface map;
- selected definitions and generated bindings required for persistence;
- realm graph and route anchors;
- generated history version/summary;
- migration chain and last successful migration;
- quarantined/missing content records;
- aliases/tombstones used;
- world settings and authority profile;
- last clean commit/integrity state;
- unresolved warnings and compatibility mode.

## 29.2 Load comparison

Before authoritative records load, the loader compares the current build lockfile with the world manifest and classifies:

- exact match;
- compatible additive change;
- compatible migration required;
- optional pack absent;
- required pack absent;
- incompatible pack/schema/interface;
- downgrade attempt;
- corrupt or unverified manifest.

No mismatch class is silently treated as exact match.

## 29.3 Existing versus unexplored world

Existing generated instances and explored terrain preserve saved bindings and generation lineage. New content may enter through unexplored regions, explicit world upgrade, migration, routes, events, traders, archaeology or other approved methods. Updating a pack does not silently reroll established places.

# 30. Migration Architecture

Migration preserves meaning, identity and authoritative state when content contracts change.

> **Locked Migration Rule**  
> A migration is not successful because the save opens. It must preserve or explicitly transform identities, quantities, ownership, relationships, history, uniqueness, spatial frames, progression and recovery evidence according to declared postconditions.

## 30.1 Migration chain components

- migration ID and owner;
- source and target compatibility ranges;
- affected packs/schemas/interfaces/records;
- prerequisites and dependency packs;
- transformation steps;
- alias, replacement and tombstone maps;
- inventory/resource conservation rules;
- worldgen and generated-binding policy;
- unique-content policy;
- spatial-frame/container policy;
- postconditions and integrity checks;
- reversibility class;
- backup and rollback plan;
- representative fixtures;
- report format.

## 30.2 Migration phases

1. inspect manifest and current build;
2. select valid ordered chain;
3. verify migration dependencies;
4. create backup and recovery metadata;
5. migrate manifest/schema metadata;
6. migrate definition references and generated bindings;
7. migrate persistent records by owning subsystem;
8. reconcile cross-record relationships and inventories;
9. rebuild derived indexes/summaries;
10. validate postconditions and content conservation;
11. write migrated save to new location or transaction;
12. update world manifest last;
13. retain report and last known-good save.

# 31. Migration Types and Ordered Execution

| Migration Type | Scope | Example |
| --- | --- | --- |
| Manifest Migration | Pack list, hashes, features or dependency representation. | Expansion pack split into subpacks. |
| Schema Migration | Field shape or semantics. | New explicit relationship strength field. |
| Definition Reference Migration | ID, alias, replacement or domain move. | Legacy item ID moved to canonical namespace. |
| Persistent Record Migration | Runtime state record. | NPC, machine, vessel or settlement record version change. |
| Worldgen Contract Migration | Generation version or selected bindings. | New unexplored-region generation profile. |
| Content Conversion | One content family becomes another approved representation. | Old component mapped to compatible replacement. |
| Pack Topology Migration | Content moves between packs/namespaces. | Maritime foundations move from development to official expansion packs. |
| Asset Binding Migration | Model/scene/socket/material references change. | Forge export revision. |
| Localisation Migration | Keys or generated-name grammar change. | Alias old localisation key. |
| Quarantine/Reactivation Migration | Pack unavailable or returns. | Restore optional expansion instances. |

Execution is deterministic and dependency-ordered. Subsystem migrations may run in phases but may not each independently reinterpret shared identities.

# 32. Definition Rename, Split, Merge and Replacement

## 32.1 Rename

A semantic identity rename normally retains the same qualified ID and changes display/localisation. An actual ID change requires alias and migration evidence.

## 32.2 Split

When one definition becomes several:

- migration chooses target using recorded state/context;
- ambiguous cases require explicit mapping or preserved legacy placeholder;
- inventory quantities and unique identity are conserved;
- generated instances retain historical provenance;
- references and relationships are remapped by owner.

## 32.3 Merge

When definitions merge:

- old IDs become aliases/tombstones as appropriate;
- distinct instance state is not discarded merely because definitions combine;
- unique items/structures remain unique instances;
- balance/value conversion is explicit;
- reverse references are rebuilt.

## 32.4 Replacement

Replacement IDs state whether the replacement is functionally equivalent, compatibility-only, visual-only or narrative successor. A replacement may not be used as a silent universal substitute when player history or progression meaning differs.

# 33. Pack Absence, Removal, Quarantine and Reactivation

Pack removal is a controlled compatibility event.

## 33.1 Removal modes

| Mode | Use | Behaviour |
| --- | --- | --- |
| Removal Blocked | Required foundation or unresolved authoritative state. | World does not load normally until pack returns or approved migration runs. |
| Safe Disable | Optional feature with no persistent authoritative records. | Feature omitted; soft references use fallback. |
| Quarantine | Optional pack has persistent instances/state. | Preserve records and identities in dormant unavailable form. |
| Convert to Approved Replacement | Official migration exists. | Transform through tested mapping with report. |
| Archive Compatibility | Old pack no longer active but compatibility/tombstone pack resolves references. | World loads with historical evidence and limited interaction. |
| Destructive Removal | Developer/test-only or explicit irreversible user action. | Requires backup, detailed loss report and separate confirmation; not default. |

## 33.2 Quarantine requirements

Quarantined records preserve, where applicable:

- persistent instance ID;
- owning pack and definition ID;
- current state payload/version;
- inventory/cargo and quantities;
- ownership/faction/permission references;
- world/realm/container-local location and spatial-frame hierarchy;
- historical relationships and unique status;
- quest/event bindings;
- presentation fallback or safe proxy;
- reason and required reactivation versions.

Quarantine is not a gameplay substitute. It is a preservation state.

## 33.3 Reactivation

Reactivation requires:

- compatible pack/version or approved migration;
- definition and schema resolution;
- integrity validation;
- spatial and ownership reconciliation;
- collision/placement safety for physical instances;
- inventory and uniqueness checks;
- updated manifest and report.

# 34. Missing-Content Preservation and Recovery

## 34.1 Definition missing but pack present

Treat as a broken pack/update. Use alias, tombstone or migration; otherwise block or quarantine according to severity.

## 34.2 Pack missing

Apply declared dependency/removal mode. Required pack absence blocks. Optional persistent content quarantines.

## 34.3 Asset missing

If gameplay definition remains valid, use declared presentation fallback and warn. Missing collision/navigation-critical asset may block integration or activate a safe technical proxy.

## 34.4 Unique content

Unique relics, bosses, structures, vessels, world events or progression rewards may not be duplicated during recovery. Historical evidence and instance IDs survive definition replacement.

## 34.5 Recovery options

Depending on approved policy:

- reinstall exact pack version;
- install compatible newer version and migrate;
- use official compatibility pack;
- restore last known-good backup;
- load read-only diagnostic mode;
- export diagnostic package;
- convert through explicit recovery operation;
- abandon destructive conversion and preserve quarantined save.

# 35. Rollback, Backup and Failed-Migration Behaviour

## 35.1 Backup requirements

Before any persistence-affecting migration:

- verify source save integrity;
- create versioned backup or copy-on-write snapshot;
- record current build/pack lockfile;
- record migration chain and expected output;
- verify available storage and write permissions;
- never update the source world manifest first.

## 35.2 Rollback classes

| Class | Meaning |
| --- | --- |
| Fully Reversible | Migration has a tested inverse and no new irreversible gameplay state. |
| Backup-Reversible | Return requires restoring the pre-migration backup. |
| Forward-Only | New world state cannot safely downgrade; backup remains the only rollback. |
| Destructive/Unsupported | Not permitted for normal release without explicit decision and user-facing warning. |

## 35.3 Failure behaviour

On failure:

- stop further migration phases;
- preserve source and partial output separately;
- do not mark the world as migrated;
- produce machine- and human-readable reports;
- identify failed step, source record and expected postcondition;
- restore or offer last good backup;
- quarantine only when the policy explicitly permits continued loading;
- never silently drop invalid records to make validation pass.

# 36. Distribution, Build Packaging and Release Channels

## 36.1 Package outputs

A release build may produce:

- gameplay definition pack;
- presentation/asset pack;
- localisation packs;
- server/headless pack;
- optional expansion pack;
- compatibility/migration pack;
- symbols/debug reports for internal use;
- source/provenance archive retained internally.

The exact Godot PCK/resource-pack or equivalent implementation belongs to Document 18. The contract remains the same regardless of container format.

## 36.2 Release channels

Channels may include development, internal validation, closed test, experimental, Early Access, stable and archive. A channel declares compatibility expectations and migration guarantees.

## 36.3 Packaging rules

- source and generated outputs are not confused;
- production pack includes only files reachable from its manifest/profile unless intentionally retained;
- archive/test namespaces are excluded from normal shipping profiles;
- manifests and lockfiles are included or externally verifiable;
- headless/server profiles omit unnecessary presentation assets but retain authoritative gameplay and collision data;
- optional download groups cannot remove a required gameplay dependency;
- licences/notices accompany distributable assets.

# 37. Data Mods, Security and Protected Authority

Initial public modding is data-driven.

## 37.1 Allowed initial capabilities

Subject to schema and pack policy, data packs may:

- add definitions in owned namespaces;
- contribute approved extension facets;
- add relationships/capability providers within permitted domains;
- add assets/localisation;
- add recipes, structures, biomes, creatures or other data-defined content when completeness passes;
- declare optional compatibility with official packs.

## 37.2 Protected boundaries

Community packs may not:

- claim official namespaces;
- replace protected kernel schemas/interfaces;
- bypass authority, transaction or save validation;
- execute arbitrary code under a data-pack declaration;
- access unrestricted filesystem/network/process APIs;
- silently modify another pack's protected fields;
- remove personhood/representation safeguards;
- force optional content into core progression without a selected profile;
- load archive POC identities into normal generation.

## 37.3 Security metadata

Manifests declare executable content, requested permissions, file roots, network needs, trust class and integrity/signature information. Data-only packs with scripts are rejected as misclassified.

# 38. Official Major Expansion Admission

A major expansion uses the same kernel and may not create a parallel registry universe.

## 38.1 Admission package

Before an expansion becomes canonical, it submits:

- programme identity and authority;
- proposed pack topology and namespaces;
- domain and extension-schema map;
- dependency and interface map;
- build profiles/features;
- field ownership and authoring sources;
- completeness additions;
- persistent record families;
- worldgen/save/multiplayer impact;
- absence/removal/quarantine policy;
- migration and compatibility ranges;
- asset/localisation/provenance plan;
- validation fixtures and release gates;
- downstream document amendment map.

## 38.2 Admission outcomes

- accepted into existing domains/facets;
- accepted with new extension schema/interface;
- accepted with new top-level domain after 25B/25C revision;
- provisionally accepted for development only;
- deferred pending tooling or ownership resolution;
- rejected due to duplicate authority or incompatible persistence.

# 39. Document Set 26 Admission and Integration Boundary

Document Set 26 is the first required real-world test of the major expansion contract.

## 39.1 Set 26 dependency position

Set 26 depends on:

- Set 24 Atlas context, especially 24C;
- Set 25A governance;
- 25B identity, namespace, facets and spatial frames;
- 25C schema, relationships, capabilities and completeness;
- 25D pack, authoring, migration and optional-content contracts;
- existing Forge and main system authorities.

## 39.2 Permitted early development

Before final pack topology is approved, Set 26 may:

- draft system documents and candidate schemas;
- use provisional development namespace/pack IDs;
- define candidate interfaces and completeness requirements;
- create non-persistent prototypes and test fixtures;
- prepare authoring workbooks/Forge projects using provisional ownership maps.

It may not freeze public/persistent IDs, publish final pack dependencies or claim migration guarantees without 25D/25F/26A approval.

## 39.3 Candidate package groups

Set 26 may eventually require groups for:

- water/fluid/world-environment systems;
- maritime world content;
- vessel definitions and persistent mobile constructs;
- ports, crews, fleets and trade;
- naval combat/adventure;
- maritime assets and Vessel Forge outputs;
- compatibility and migration.

These are integration candidates, not approved shipping packs.

## 39.4 Set 26 removal risk

Vessels, cargo, crews, ports, routes, underwater sites and maritime world state may become authoritative persistent content. Therefore an optional Set 26 configuration must define stronger quarantine/recovery than a cosmetic content pack. Container-local voxel structures and inventories must preserve frame identity and uniqueness even when interaction is disabled.

## 39.5 No maritime duplication

25D does not define fluid algorithms, buoyancy, vessel damage, crew simulation, fleets or naval encounters. It only requires their owning records to declare pack, source, persistence, migration, dependency and removal contracts.

# 40. Player-Authored Blueprints and Shared Content

Player-authored structures and future vessel blueprints require identity and sharing rules without becoming unrestricted mods.

## 40.1 Ownership classes

- world-local blueprint;
- account/local-library blueprint;
- exported share package;
- curated community blueprint;
- official promoted blueprint.

## 40.2 Minimum shared blueprint manifest

- blueprint ID and creator/provenance metadata;
- format/schema version;
- required packs/features;
- referenced block/component IDs;
- size, complexity and performance class;
- sockets/markers and allowed substitutions;
- preview/icon;
- script/executable flag, normally false;
- moderation/safety metadata where public sharing exists;
- missing-dependency behaviour;
- migration policy.

## 40.3 Capability declaration boundary

Player-authored blueprints should derive capabilities from validated components and approved composition rules by default. Direct arbitrary capability claims remain pending 25K, Forge, 26I and technical review.

# 41. Localisation, Generated Names and Font Coverage

Localisation is pack-aware and identity-safe.

## 41.1 Localisation contract

- keys use qualified namespace-safe patterns;
- default development text is present for diagnostics;
- locale packs declare fallback locale;
- definitions reference keys, not embedded player-facing text where localisation is required;
- generated-name grammars are versioned and pack-owned;
- existing generated names are stored in saves and do not reroll because a grammar updates;
- font/glyph coverage and text expansion are validated per locale/profile;
- optional locale absence falls back without changing identity;
- community packs cannot overwrite official keys silently.

# 42. Asset Bundles, Licensing and Provenance Transport

25D carries provenance fields; 25K defines the full policy and budgets.

## 42.1 Asset bundle manifest

Each bundle records:

- bundle ID, pack and version;
- asset IDs and source definition IDs;
- files and hashes;
- import/tool/export versions;
- platform and memory/performance classes;
- LOD/collision/navigation requirements;
- sockets/events and compatible definitions;
- fallback assets;
- source project references;
- licence, contributor and provenance record IDs;
- AI-assisted or third-party processing flags where the later 25K policy requires;
- known restrictions and redistribution terms.

## 42.2 Provenance boundary

A runtime pack may carry compact provenance references while the complete source evidence remains in the internal production archive. Missing required licence/provenance blocks release admission even if the asset functions technically.

# 43. Tooling, Reports and Audit Evidence

25D requires tools to emit inspectable evidence. Exact commands belong to 25E/Document 18.

## 43.1 Required reports

- source ownership report;
- import diagnostics and field-level diff;
- manifest/dependency graph;
- undeclared dependency report;
- pack conflict/cycle report;
- normalisation and schema report;
- compiled facet assembly report;
- registry snapshot and hash report;
- world-manifest compatibility report;
- migration plan and result report;
- quarantine/reactivation report;
- pack removal impact report;
- provenance/licence completeness report;
- build profile lockfile;
- Set 26 integration/admission status.

## 43.2 Inspectors

Recommended inspectors include:

- definition source trace;
- pack content browser;
- reverse dependency browser;
- snapshot diff;
- world manifest viewer;
- missing-content and quarantine browser;
- migration dry-run viewer;
- local/world spatial-frame record viewer for mobile constructs;
- source-to-generated artifact trace.

# 44. Authoring and Review Workflow

1. identify owning document/domain and package;
2. register or confirm schema/interface and field ownership;
3. choose approved authoring source for each facet;
4. reserve qualified IDs and provisional pack IDs where appropriate;
5. author content or tool project;
6. export/import to normalised interchange;
7. inspect field-level diff and source map;
8. run schema, ownership, dependency and completeness validation;
9. compile extension facets and generated indexes;
10. generate Godot-facing artifacts and asset bindings;
11. calculate pack/snapshot hashes;
12. run 25E tests and migration fixtures;
13. approve manifest/version and archive lockfile;
14. distribute to the selected build profile/channel;
15. record downstream document and migration consequences.

## 44.1 Review questions

- Does every field have one editable owner?
- Can the pack rebuild without manual editor repair?
- Are all actual dependencies declared?
- Does the pack remain complete when optional dependencies are absent?
- Can a world prove which version/hash generated its instances?
- Does removal preserve authoritative persistent content?
- Are aliases, tombstones and migrations explicit?
- Can import/export omit no owned data silently?
- Are generated Resources protected from hand editing?
- Are Set 26 responsibilities represented only as extension/admission contracts rather than maritime design?

# 45. Decisions Locked by 25D and Handoff to Later Documents

## 45.1 Working locks requiring approval of this draft

- Each field path has one declared authoritative authoring source; all other representations are generated, derived, cached, runtime-only or review exports.
- Normalised JSON is the common initial interchange and validator/compiler input.
- Spreadsheet workbooks are approved for bulk registry authoring under schema-aware import/export rules; they are not runtime databases.
- YAML is not an initial canonical production source.
- Generated Godot Resources are the default engine-facing output; exceptional hand-authored Resources require explicit ownership approval.
- Forge owns editable asset projects and exports manifests; gameplay registries retain gameplay meaning.
- Every pack has a versioned immutable manifest, namespace boundary, compatibility ranges, dependencies, content hashes, migration/removal policy and validation evidence.
- Dependency modes are Required, Build-Profile Required, Optional, Soft, Incompatible, Development Only and Migration Only.
- Deterministic dependency resolution and compile phases replace arbitrary winner-by-load-order behaviour.
- Patches declare target versions, permitted field operations, expected prior state and uninstall/migration behaviour.
- Every build/profile produces an immutable pack lockfile and registry snapshot hash.
- Every world stores a manifest binding it to worldgen versions, pack versions/hashes, schema/interfaces, selected definitions and migration history.
- Migrations are ordered, deterministic, backup-first and postcondition-validated; failed migration never overwrites the last good save.
- Optional persistent content is quarantined rather than silently deleted or reinterpreted when its pack is absent.
- Initial public mod support is data-pack-first and cannot bypass protected authority.
- Set 26 uses the general major-expansion admission contract; final namespace, pack partition and shipping mode remain pending.

## 45.2 Handoff to Document 25E

25E must automate or specify tests for:

- manifest schemas and required fields;
- namespace/pack ownership;
- declared versus actual dependencies;
- version/interface compatibility;
- dependency cycles and load order;
- field-source ownership and generated-file tampering;
- spreadsheet round-tripping and destructive-loss protection;
- canonical JSON normalisation and deterministic hashes;
- extension-facet conflict detection;
- patch permissions and uninstall behaviour;
- pack combinations and build profiles;
- world-manifest mismatch classes;
- migration dry runs, fixtures, backups and postconditions;
- pack removal, quarantine and reactivation;
- POC/archive exclusion;
- data-mod security and path limits;
- Set 26 expansion admission fixtures.

## 45.3 Handoff to 25F-25G

25F-25G must classify which packs/features are required for Core Production and which are optional, Early Access, Full Release, Later Expansion, Tooling Research or Archived Validation. They must not make Core progression depend on optional Set 26 packs without changing the build-profile and shipping decision through Ash.

## 45.4 Handoff to replacement Document 18

Document 18 must choose and implement:

- Godot registry/resource compiler architecture;
- package container and load service;
- source/import tool layout;
- headless validation/build commands;
- snapshot/hash algorithms;
- atomic save/world-manifest storage;
- migration runner and backup strategy;
- quarantine proxy/record services;
- multiplayer pack handshake and join validation;
- exact performance/security budgets;
- Summer Engine bounded implementation tasks.

## 45.5 Handoff to Set 26

26A and 26N/26O must submit the final maritime programme-to-pack topology, namespaces, dependencies, interfaces, source formats, persistent record families, worldgen impact, migration/removal policy, validation fixtures and downstream amendment map. 26F-26I must preserve stable mobile-container and blueprint identities without making Forge projects or scenes the save identity.

# 46. Risks, Redesign Triggers and Open Decisions

## 46.1 Risks

| Risk | Consequence | Control |
| --- | --- | --- |
| Duplicate Editable Truth | Spreadsheet, JSON and Godot Resources diverge. | Field-level source declaration and generated-artifact protection. |
| Spreadsheet Fragility | Auto-formatting, hidden cells or deleted rows corrupt IDs/data. | Workbook contract, import schema, baseline hash and destructive diff review. |
| Format Proliferation | Each team invents a parser and canonical form. | Normalised JSON boundary and explicit alternate-format admission. |
| Manifest Drift | Actual references differ from declared dependencies. | Derive dependency report from compiled graph and block undeclared hard links. |
| Load-Order Modding | Packs silently overwrite one another. | Typed patch/facet rules and ownership conflicts as blockers. |
| Hash Instability | Identical semantic content produces different snapshots. | Canonicalisation, tool/version control and semantic hashing. |
| Migration False Success | Save opens after losing items, relationships or history. | Domain postconditions, conservation checks and representative fixtures. |
| Optional-Pack Data Loss | Expansion removal deletes vessels, cargo or world state. | Quarantine and reactivation contract. |
| Quarantine Becomes Permanent Debt | Preserved records can never recover. | Versioned recovery handlers, diagnostics and release ownership. |
| Pack Topology Churn | Content moves repeatedly between packs/namespaces. | Delay public identity freeze until 25F/26A; topology migrations require evidence. |
| Community Security | Data pack hides executable code or unsafe paths. | Trust classes, manifest permissions, sandboxed import and script rejection. |
| Forge Authority Creep | Asset tool begins owning gameplay truth. | Export manifest boundary and field ownership review. |
| Set 26 Premature Freeze | Maritime records lock incompatible pack/schema decisions. | Provisional development IDs and admission checkpoints. |
| Excessive Pack Fragmentation | Dependency graph and distribution become unmanageable. | Pack-cohesion review and umbrella profiles; split only for clear ownership/download/runtime reasons. |
| Monolithic Pack | Every update invalidates all content and blocks optionality. | Domain/asset separation where useful and stable interfaces. |

## 46.2 Redesign triggers

Revisit 25D when:

- a field cannot identify one authoritative source;
- normalised JSON cannot represent a required schema without loss;
- deterministic rebuilds produce different semantic hashes;
- pack removal cannot preserve authoritative state;
- official expansion integration requires required dependency cycles;
- a hand-authored Godot Resource becomes necessary across many domains;
- spreadsheet round-tripping repeatedly loses nested or relationship data;
- migration chains become unbounded or ambiguous;
- community data packs require behaviour impossible without a safe scripting architecture;
- Set 26 proves that mobile/nested persistent structures need pack-level behaviour not represented here.

## 46.3 Open decisions for later authority

| Open Decision | Owner | Status |
| --- | --- | --- |
| Final repository folder names and generated-artifact commit policy. | Document 18/25L | Pending implementation. |
| Exact JSON schema technology and canonical serialisation library. | Document 18/25E | Pending technical selection. |
| Exact Godot Resource classes and whether compiled binary registries supplement `.tres`/`.res`. | Document 18 | Pending. |
| Final pack container format, compression and distribution service. | Document 18/25L | Pending. |
| Cryptographic signing policy for official and partner packs. | Document 18/security/release | Pending. |
| Exact public mod distribution and moderation scope. | 25F/25L/future mod document/Ash | Pending. |
| Whether any domain receives approved authoritative Godot Resource authoring. | Owning document/Document 18/Ash | Pending evidence. |
| Final Set 26 namespace, pack topology and shipping mode. | 26A/25F/Ash | Pending. |
| Downgrade-support policy for stable and Early Access releases. | Document 18/25E/Ash | Pending. |
| User-facing choices for required-pack mismatch, quarantine and destructive conversion. | 17/18/26O | Pending UI/technical design. |
| Retention duration and storage budget for migration backups. | Document 18/25E | Pending performance/platform design. |
| Whether player-authored blueprints may include custom data-defined behaviours. | 25K/Forge/26I/future mod authority/Ash | Pending. |

# Appendix A. Canonical Content-Pack Manifest Template

| Group | Field | Requirement |
| --- | --- | --- |
| Identity | pack_id | Qualified stable pack identity. |
| Identity | manifest_schema_version | Version of this manifest contract. |
| Identity | pack_version | Immutable released pack version. |
| Identity | pack_class / trust_class | Functional and security classification. |
| Identity | owner / review_owner | Canonical authority and approval responsibility. |
| Identity | display_name_key / description_key | Localised presentation. |
| Namespace | owned_namespaces | Namespace roots allocated to pack. |
| Namespace | contributed_namespaces | Approved contributions without ownership transfer. |
| Compatibility | game_build_range | Compatible game/build range. |
| Compatibility | registry_kernel_range | Required 25B kernel/interface version. |
| Compatibility | schema_ranges | Domain/extension schema compatibility. |
| Compatibility | interface_ranges | Required capability/service interfaces. |
| Dependencies | dependencies[] | ID/interface, mode, range, feature, reason and missing behaviour. |
| Dependencies | incompatible[] | Explicit conflicts and recovery guidance. |
| Features | features[] | Optional/profile-selectable contracts. |
| Content | definition_files[] | Paths, schema IDs, counts and hashes. |
| Content | relationship/capability files | Protected semantic library contributions. |
| Content | assets/localisation | Bundle and locale indexes. |
| Assembly | compile_phase | Deterministic phase. |
| Assembly | facets/patches | Extension and patch declarations. |
| Runtime | required_services | Technical interfaces and authority class. |
| Runtime | performance_class | Memory, streaming and LOD category. |
| Persistence | record_families | Save owners and versions. |
| Persistence | removal_policy | Block, disable, quarantine, convert or archive. |
| Migration | migrations[] | Supported source ranges and chain IDs. |
| Distribution | bundles/channels | Runtime package groups and release channel. |
| Security | executable flag / permissions | Data-only status or approved code and permissions. |
| Validation | required_profile | 25E validation suite. |
| Validation | evidence_hashes | Pass reports, fixtures and accepted waivers. |
| Provenance | source_revision | Source control revision and generator versions. |
| Provenance | licence_manifest | Licence/provenance bundle reference. |

## A.1 Illustrative non-binding manifest fragment

```json
{
  "pack_id": "leyforge.example.world_content",
  "manifest_schema_version": "1.0.0",
  "pack_version": "0.1.0",
  "pack_class": "world_content",
  "trust_class": "official",
  "owned_namespaces": ["leyforge.example"],
  "registry_kernel_range": ">=0.2.0 <1.0.0",
  "dependencies": [
    {
      "target": "leyforge.core.registry_foundation",
      "mode": "required",
      "version_range": ">=0.1.0 <1.0.0",
      "missing_behaviour": "block_load"
    }
  ],
  "removal_policy": "quarantine_persistent_records",
  "validation_profile": "official_world_content"
}
```

The example is not approval of final pack names, schema numbers or Set 26 topology.

# Appendix B. Pack Dependency and Compatibility Matrix Template

| Source Pack | Target Pack/Interface | Mode | Version Range | Feature/Profile | Worldgen Impact | Save Impact | Missing Behaviour | Fallback/Migration | Owner |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
|  |  |  |  |  |  |  |  |  |  |

# Appendix C. Field-Level Authoring Source Declaration

| Field | Description |
| --- | --- |
| declaration_id | Stable identity of ownership declaration. |
| definition/schema scope | IDs, domain, family or field group covered. |
| field_path | Exact canonical field or path pattern. |
| canonical_owner | Document/domain responsible for meaning. |
| source_type | Spreadsheet, JSON, Forge, custom editor, approved Godot Resource, generated or runtime. |
| source_path | Repository/project/workbook location pattern. |
| pack_id | Owning/distributing pack. |
| importer/tool | Tool and version transforming source. |
| representation_class | Authored, generated, derived, cached, review-only or runtime-only. |
| review_owner | Required reviewer. |
| migration_impact | Consequence if ownership/source changes. |

# Appendix D. Spreadsheet Import/Export Workbook Contract

## D.1 Required workbook manifest fields

| Field | Requirement |
| --- | --- |
| workbook_id | Stable workbook identity. |
| workbook_schema_version | Import/export contract version. |
| source_pack | Owning pack. |
| namespaces | Allowed IDs. |
| owner/review_owner | Authority. |
| exported_snapshot_hash | Baseline for re-import diff. |
| included_scopes | Domains/families/filters exported. |
| deletion_semantics | Omitted rows unchanged by default. |
| importer_version | Required compatible importer. |
| generated_columns | Read-only fields. |

## D.2 Import acceptance checklist

- [ ] Workbook identity and schema resolve.
- [ ] IDs remain text and namespace-valid.
- [ ] Baseline snapshot matches or concurrent changes are reconciled.
- [ ] Unknown columns are rejected or classified.
- [ ] No hidden required production truth exists.
- [ ] Deletions are explicit lifecycle operations.
- [ ] Field-level diff is reviewed.
- [ ] Nested/unowned fields are preserved.
- [ ] Normalised output validates and hashes deterministically.

# Appendix E. Migration Step and Chain Template

| Field | Requirement |
| --- | --- |
| migration_id | Qualified immutable migration identity. |
| owner | Responsible system/pack. |
| source_range | Eligible pack/schema/save versions. |
| target_version | Resulting contract. |
| prerequisites | Required packs/interfaces/tools. |
| affected_records | Definitions, manifests, records and indexes. |
| operations | Ordered deterministic transforms. |
| aliases/replacements | Identity map. |
| conservation_rules | Quantity, uniqueness, ownership and history requirements. |
| spatial_rules | World/realm/container-local identity handling. |
| postconditions | Mandatory integrity checks. |
| rollback_class | Fully reversible, backup-reversible or forward-only. |
| fixtures | Representative saves/packs. |
| report_fields | Counts, warnings, failures and unresolved records. |

# Appendix F. Pack Removal, Quarantine and Reactivation Checklist

## F.1 Before removal

- [ ] Compare pack against world manifest and current lockfile.
- [ ] Identify required dependencies and reverse references.
- [ ] Count persistent instances, inventories, structures, relationships and unique content.
- [ ] Determine approved removal mode.
- [ ] Verify quarantine or conversion handler.
- [ ] Create backup and impact report.
- [ ] Block removal if required state cannot be preserved.

## F.2 Quarantine

- [ ] Preserve instance and definition identity.
- [ ] Preserve state payload/version.
- [ ] Preserve quantities, ownership and uniqueness.
- [ ] Preserve world/realm/local-frame placement.
- [ ] Preserve quest/event/history bindings.
- [ ] Apply safe technical/presentation proxy where approved.
- [ ] Update world manifest without claiming migration completion.

## F.3 Reactivation

- [ ] Compatible pack/version installed.
- [ ] Schema/reference resolution passes.
- [ ] Migration chain runs if required.
- [ ] Spatial/ownership/inventory integrity passes.
- [ ] Physical placement is safe.
- [ ] No duplicate unique instances appear.
- [ ] World manifest and reports update after success.

# Appendix G. Set 26 Major Expansion Admission Checklist

- [ ] 26A confirms programme authority, scope and proposed shipping topology.
- [ ] Final official namespace and pack IDs approved by Ash and registered through 25B.
- [ ] 26B-26O submit domain/extension schema and interface map to 25C.
- [ ] Required, optional, profile-required, soft and incompatible dependencies declared.
- [ ] Water/fluid, vessel, port, crew, fleet, route, encounter and marine content authoring sources identified.
- [ ] Persistent mobile-container, cargo, crew and local-frame record families identified.
- [ ] Worldgen and Atlas dependencies identified, including safe absence and fallback rules.
- [ ] Pack removal/quarantine/reactivation behaviour defined for persistent maritime state.
- [ ] Vessel Forge project and export-manifest boundary defined.
- [ ] Save, migration and multiplayer compatibility ranges defined.
- [ ] Headless/server asset separation and authority requirements defined.
- [ ] Main-document amendment map approved.
- [ ] 25E validation profiles and fixtures exist.
- [ ] 25F classifies each selected maritime package by production tier/build profile.
- [ ] 25L records unresolved integration debt before closure.

# Appendix H. Document 25D Acceptance Criteria

| Acceptance Area | Pass Condition |
| --- | --- |
| Source Ownership | Every representation type has a clear authored/generated/runtime role and duplicate editable truth is prohibited. |
| Format Decision | Spreadsheet, JSON, Godot Resource, Forge and YAML boundaries are explicit and compatible with 25B-25C. |
| Pack Contract | Manifest, namespace, version, dependency, feature, compatibility, security and evidence fields are defined. |
| Assembly | Deterministic compilation, facet assembly, patch and conflict behaviour are explicit. |
| Import/Export | Round-tripping preserves IDs, owned fields, nested data and produces destructive-change diffs. |
| Snapshots | Build lockfiles, semantic hashes and world-manifest bindings are defined. |
| Migration | Ordered backup-first migration, postconditions, rollback and failed-migration behaviour are explicit. |
| Optional Content | Absence, removal, quarantine, recovery and reactivation preserve authoritative state. |
| Mod Boundary | Initial data-pack permissions and protected authority are explicit. |
| Set 26 Integration | Major expansion admission is supported without defining maritime gameplay or silently selecting shipping topology. |
| POC Boundary | Archive/test content cannot enter normal generation or shipping profiles. |
| Handoff | 25E, 25F-25G, Document 18, 25K-25L and Set 26 receive actionable requirements. |
| Human Authority | Working format and packaging locks remain subject to Ash's approval of this draft; unresolved shipping decisions are not presented as approved. |

> **Document 25D Completion Statement**  
> Leyforge now has a controlled path from approved design and specialised authoring sources to normalised registry data, generated Godot-facing artifacts, versioned content packs, immutable build snapshots and migration-safe worlds. The next task is Document 25E, which converts the identity, semantic, packaging and migration contracts of 25B-25D into automated validation, seed QA, reachability, performance and release gates.

End of Document 25D - Content Packs, Manifests, Authoring Formats, Import/Export and Migration.
