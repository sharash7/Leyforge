# FANTASY VOXEL CIVILISATION SANDBOX

## DOCUMENT SET 25

# 25C - Domain Schemas, Relationship Graph, Capabilities, Suitability, Fallbacks and Completeness Contracts

**Version 0.1 - Schema and Relationship Architecture Draft**

A canonical semantic-contract document defining how Leyforge content domains extend the Registry Kernel, how definitions relate through a typed graph, how capabilities replace hardcoded named progression requirements, how suitability and exclusion control deterministic selection, how fallback and repair groups preserve valid seed-generated worlds, and how universal and domain-specific completeness contracts prevent disconnected content from advancing into production.

**Project Lead and Final Authority:** Ash

**Architecture, systems planning, documentation and production support:** GPT-5.6 Thinking

> **Schema and Relationship Architecture Statement**  
> A Leyforge definition is not production-ready because its individual fields are valid. It becomes production-ready when its schema, owned facets, typed relationships, provided and required capabilities, suitability constraints, exclusions, fallbacks, dynamic states, physical dependencies, presentation requirements and validation evidence form a complete, explainable package. World generation may choose different content for every seed, but it may not invent missing capability, ignore incompatibility or silently substitute unrelated content.

| Field | Locked Direction |
| --- | --- |
| Document Scope | Canonical domain-schema architecture, field groups, schema and extension registration, relationship graph, relationship-type semantics, direction, cardinality, scope, reference modes, capabilities, suitability, exclusions, generated bindings, fallback groups, progression reachability, universal completeness, domain package contracts and Set 26 expansion compatibility. |
| Identity Dependency | All definitions, schemas, relationship types, capabilities, interfaces and compiled references use the qualified-ID, namespace, facet, ownership, instance and spatial-frame rules locked by Document 25B v0.2. |
| Atlas Direction | Preserve Document 24A's graph, hard/soft constraint, seed validation and capability-fallback principles and Document 24L's universal metadata, relationship library, completeness contracts and production gates. |
| Source-of-Truth Direction | Atlas domains own context, distribution, history, ecology, culture, suitability and world relationships. Gameplay registries own executable definitions. Set 25 owns shared semantic contracts. Runtime services own mutable instance state. |
| Progression Direction | World-generation and progression guarantees are expressed as capability requirements and eligible provider groups, not guaranteed named biomes, materials, teachers, villages, structures, bosses, portals or coordinates. |
| Selection Direction | Hard constraints and exclusions are evaluated before preferences. Weights may rank eligible candidates but may never override incompatibility. Deterministic tie-breaking and named sub-seeds are mandatory. |
| Fallback Direction | Fallbacks preserve capability and player agency through equivalent providers, routes, trade, salvage, research, migration or deterministic repair. They do not silently recreate fixed POC arrangements. |
| Completeness Direction | Each selected package must satisfy a universal contract and its domain contract before advancing beyond Specified/Data Ready into prototype, asset or integration work. |
| Expansion Direction | Major expansions use the same schema, graph, capability, suitability, fallback and completeness framework. Set 26 is the first required compatibility case but retains authority over detailed maritime schemas and behaviour. |
| Implementation Boundary | This document defines semantic contracts, not final JSON/YAML syntax, Godot Resource classes, database tables, validator code, balance values or domain-specific gameplay algorithms. Those are completed by 25D, 25E, replacement Document 18 and owning system documents. |
| Next Deliverable | 25D - Content Packs, Manifests, Authoring Formats, Import/Export and Migration. |

# Revision History

| Version | Status | Summary |
| --- | --- | --- |
| 0.1 | Schema and Relationship Architecture Draft | Establishes the project-wide domain-schema contract, relationship graph, capability-provider model, suitability and exclusion system, deterministic selection rules, fallback and repair groups, progression reachability, universal and domain completeness contracts, and expansion compatibility rules required before Core Production classification. |

# Document Purpose

Document 25C converts the World Content Atlas relationship philosophy and Document 25B identity kernel into a precise semantic architecture that every later registry, world-generation rule, content pack, validator and implementation task can share. It defines what domain schemas must declare, how separately owned facets assemble without duplicate truth, how links are represented and validated, how a seed chooses coherent content, how a missing named provider is replaced by an equivalent capability, and what must exist before a biome, realm, culture, creature, site, boss, structure, resource, event or expansion package can be called complete.

This document does not select the Core Production roster, balance selection weights, enumerate final block/item/recipe content, design detailed ocean or vessel mechanics, choose a Set 26 shipping namespace, define Godot classes or implement validators. It creates the contract those later decisions must satisfy.

# Design Sources and Supersession Rules

| Source | Authority Used by 25C |
| --- | --- |
| 00-02 - Vision, Loop and Progression | Preserve sandbox freedom, interconnection, physical progression, multi-track unlocks, civilisation consequence and seed-adaptive starts. Named POC guarantees are superseded. |
| 03-06 - Blocks, Items, Recipes and Resources | Preserve separate physical registries, transformation logic, inheritance, substitutions and real inputs/outputs. Their POC lists and inconsistent ladders are not schema authority. |
| 07-17 - Gameplay Systems | Preserve each system's executable ownership and cross-system relationships. 25C does not absorb NPC, automation, magic, ecology, combat, quest, UI or realm behaviour. |
| 18 - Technical Implementation Plan v0.1 | Retain immutable definitions, runtime-state separation, deterministic generation, authoritative records, save safety, LOD and validation principles only. Unreal-specific structures are superseded. |
| 24A - Atlas Foundations | Primary authority for the relationship graph, required/preferred/possible/forbidden links, hard constraints, soft preferences, exclusions, capability-based progression guarantees, validation and deterministic repair. |
| 24B-24K - Atlas Domains | Primary authority for domain context, relationships, suitability, distribution, history, ecology, culture, states, package foundations and production requirements. |
| 24C - Oceans and Special Overworld Environments | Primary Atlas authority for marine, coastal, island, underwater, current, tide, water-state and special-environment context consumed by Set 26. |
| 24L - Registry and Production Roadmap | Primary authority for universal metadata, relationship/reference architecture, capability interfaces, package contracts, completeness, production lifecycle and validation gates. |
| 25A v0.2 | Governs authority, POC retirement, expansion admission, parallel development, integration checkpoints and final closure. |
| 25B v0.2 | Canonical authority for qualified IDs, namespaces, domain registry, facets, field ownership, definitions, instances, spatial frames, aliases, tombstones and expansion extension boundaries. |
| Approved Set 26 Direction | Locks the existence and scope of a separate maritime/naval expansion. Detailed fluid, vessel, port, crew, fleet, naval, marine and technical schemas remain owned by 26A-26O and their main-document owners. |

> **Supersession Rule**  
> Any older relationship, progression path, world-generation rule or completeness checklist that depends on a fixed POC identity or one guaranteed named provider is replaced by the capability, suitability, fallback and package-contract rules in this document. Reusable mechanics remain valid under new production identities.

> **Kernel Preservation Rule**  
> Document 25C may register schema families, relationship semantics, capabilities and interfaces, but it may not change Document 25B's qualified-ID grammar, namespace authority, field-owner rule, definition/instance separation or spatial-frame identity without an approved 25B revision and migration assessment.

# Static Table of Contents

- Revision History
- 1. Locked Schema and Relationship Identity
- 2. Source-Derived Direction and Canonical Resolution Boundary
- 3. Scope, Non-Goals and Handoff Boundaries
- 4. Canonical Terminology
- 5. Schema Architecture Overview
- 6. Schema Registry and Registration Contract
- 7. Universal Definition Envelope and Domain Facets
- 8. Domain Schema Field Groups
- 9. Required, Conditional, Optional and Derived Fields
- 10. Schema Inheritance, Composition and Extension Facets
- 11. Schema Versioning and Compatibility
- 12. Relationship Graph Architecture
- 13. Relationship-Type Definition Contract
- 14. Direction, Inverses and Symmetry
- 15. Cardinality, Scope, Strength and Temporal Mode
- 16. Hard References, Soft References, Queries and Generated Bindings
- 17. Reverse Links, Graph Normalisation and Derived Indexes
- 18. Spatial, Container-Local and Mobile-Frame Relationships
- 19. Capability Architecture
- 20. Capability Provider and Requirement Contracts
- 21. Capability Bands, Capacity, Access and Quality
- 22. Suitability Architecture
- 23. Hard Constraints, Soft Preferences and Exclusions
- 24. Deterministic Candidate Selection and Explainability
- 25. Generated Bindings and World-Manifest Evidence
- 26. Fallback Groups and Repair Strategies
- 27. Progression Reachability and Capability Guarantees
- 28. Dynamic States, Transitions and Transformation Relationships
- 29. Universal Completeness Contract
- 30. Domain Package Completeness Contracts
- 31. Physical Gameplay and Cross-Registry Completeness
- 32. Major Expansion and Optional-Content Completeness
- 33. Set 26 Compatibility and Schema-Admission Boundary
- 34. Validation Severity and Failure Behaviour
- 35. Authoring and Review Workflow
- 36. Decisions Locked by 25C and Handoff to Later Documents
- 37. Risks, Redesign Triggers and Open Decisions
- Appendix A. Universal Domain Schema Template
- Appendix B. Relationship-Type Definition Template and Starter Library
- Appendix C. Capability Definition, Provider and Requirement Templates
- Appendix D. Suitability, Exclusion and Selection Template
- Appendix E. Fallback Group and Deterministic Repair Template
- Appendix F. Universal and Domain Completeness Checklist
- Appendix G. Set 26 Compatibility Mapping and Admission Questions
- Appendix H. Document 25C Acceptance Criteria

# 1. Locked Schema and Relationship Identity

The schema and relationship layer is the semantic backbone connecting the Atlas, gameplay registries, world generation, simulation, saves, tools and production planning. It tells the project what a definition is allowed to contain, what it must connect to, what it can provide, where it can appear, what it must never coexist with, and how the game remains valid when a particular named entry is absent.

> **Locked Rule**  
> A valid row is not automatically valid content. Every production definition must satisfy its registered schema and participate in a coherent, typed, source-owned relationship package whose requirements can be validated before world generation or runtime use.

| Architecture Layer | Meaning | Production Result |
| --- | --- | --- |
| Registered Schema | Declares the semantic contract for a domain or extension facet. | Tools know which fields are legal, required, owned and versioned. |
| Typed Relationship Graph | Connects definitions, queries, instances and historical evidence through registered relationship types. | World generation and systems can reason about dependencies instead of parsing prose. |
| Capability Interface | Describes a functional outcome independently of one named provider. | Progression remains valid across seeds, cultures, realms and optional packs. |
| Suitability Contract | Filters and ranks eligible content using environment, topology, culture, history, ecology, progression and performance. | Procedural selection creates coherent worlds rather than random lists. |
| Fallback Group | Declares equivalent providers and deterministic repair methods for a required capability. | Missing content produces a controlled alternative instead of a dead end or hardcoded POC replacement. |
| Completeness Contract | Defines the minimum relationships, physical support, states, presentation and evidence required by a content family. | Incomplete entries cannot advance merely because their prose or assets look finished. |
| Explainability Record | Stores why a candidate was selected, rejected, repaired or bound. | Designers can debug seeds and players receive trustworthy world behaviour. |

# 2. Source-Derived Direction and Canonical Resolution Boundary

| Classification | Treatment in 25C |
| --- | --- |
| Source-Derived Rule | The Atlas is a graph; relationships have types, strength and scope; hard constraints precede weights; exclusions are first-class; progression guarantees target capabilities; worlds are validated and repaired before play. |
| 25B Dependency | Every schema, relationship type, capability and interface has a qualified identity and owner. Facets cannot overwrite fields. Runtime instances and mobile spatial frames remain separate from definitions. |
| 25C Canonical Resolution | Defines exact semantic field groups, relationship edge contract, reference modes, cardinality model, capability offers/requirements, suitability evaluation order, fallback-group structure and completeness-gate inheritance. |
| Recommendation | Starter relationship and capability libraries are provided to prevent uncontrolled vocabulary growth. They remain extensible through recorded registration rather than ad hoc strings. |
| Deferred Decision | Final storage format, compiled binary representation, Godot class topology, numeric weighting, domain-specific balance and validator implementation are deferred to 25D, 25E, Document 18 and owning documents. |
| Set 26 Boundary | 25C proves that maritime concepts can use or extend the general contracts. It does not define buoyancy, fluid simulation, vessel construction, naval combat or detailed maritime values. |

# 3. Scope, Non-Goals and Handoff Boundaries

| 25C Owns | 25C Does Not Own |
| --- | --- |
| Domain-schema registration and semantic field-group rules. | Final physical file format or editor interface. |
| Relationship-type registration, edge semantics and graph normalisation. | Domain-specific AI, combat, economy, fluid or physics behaviour. |
| Capability identities, provider and requirement contracts. | Final capability values, balance curves or content roster. |
| Suitability, exclusion and deterministic selection order. | Terrain generation algorithm, pathfinding algorithm or worldgen noise implementation. |
| Fallback groups, repair methods and reachability requirements. | Exact tutorial, quest, settlement, resource or portal path in a generated world. |
| Universal and domain completeness contracts. | Core Production classification, which belongs to 25F-25G. |
| General major-expansion schema admission. | Set 26's detailed maritime schemas and package contents. |
| Semantic validation requirements. | Validator CLI, CI integration and release suite implementation, owned by 25E and Document 18. |

**Handoff sequence:**

1. **25D** converts these semantic contracts into content-pack, manifest, authoring, import/export and migration rules.
2. **25E** defines automated schema, graph, capability, seed, fallback and completeness validators.
3. **25F-25G** classify Atlas foundations and instantiate complete Core Production packages.
4. **25H-25J** enumerate physical blocks, items, resources and transformation chains against these contracts.
5. **Set 26** proposes extension schemas and detailed maritime contracts without bypassing the kernel.
6. **Document 18** implements the Registry Service, graph indexes, world-manifest bindings, save records and validation commands in Godot/Summer Engine.

# 4. Canonical Terminology

| Term | Canonical Meaning |
| --- | --- |
| Domain Schema | The registered semantic field contract for definitions in one domain, such as biome, creature, structure, item or recipe. |
| Extension Schema | A registered optional facet contract that adds fields to an existing definition without changing base identity or field ownership. |
| Schema Registry | Protected kernel definitions identifying schemas, versions, owners, parent schemas, allowed facets and validators. |
| Field Group | A cohesive owned section of a schema, such as selection, capabilities, relationships, runtime or presentation. |
| Relationship Type | A registered semantic link such as contains, inhabits, produces, controls, threatens or transforms_into. |
| Relationship Edge | An authored or generated connection between a source and a target definition, query, instance or spatial anchor. |
| Inverse | The derived reverse meaning of a directed relationship, such as contained_by for contains. |
| Capability | A stable, testable functional outcome that one or more providers can supply, independent of a specific named definition. |
| Capability Offer | A provider's declaration that it supplies a capability under stated conditions, capacity, access and scope. |
| Capability Requirement | A consumer or world profile's declaration that a capability must be resolvable under stated conditions. |
| Suitability | The eligibility and preference result for placing, selecting or binding content in a context. |
| Hard Constraint | A requirement that must pass; failure makes the candidate ineligible. |
| Soft Preference | A ranking factor applied only after hard constraints pass. |
| Exclusion | An explicit incompatibility or prohibited context. |
| Candidate Set | The stable, ordered set of eligible definitions considered for a selection role. |
| Generated Binding | A deterministic world/save-specific choice connecting definitions or instances. |
| Fallback Group | A registered set of equivalent capability providers and approved repair methods. |
| Repair Pass | A deterministic post-generation operation that resolves a missing capability or invalid relationship without selecting a fixed named POC arrangement. |
| Completeness Contract | A minimum package requirement inherited by a domain definition before status advancement. |
| Reachability | Proof that a player or system can obtain a required capability through allowed world interactions and routes. |
| Explainability Trace | An auditable record of candidate filtering, score components, chosen provider, fallback use and repair reason. |

# 5. Schema Architecture Overview

Leyforge schemas are layered rather than monolithic. The universal envelope from 25B identifies and owns the definition. Domain schemas add semantic content. Atlas, gameplay, presentation and technical facets remain separately owned and compile into one read-only definition.

| Layer | Purpose | Example Ownership |
| --- | --- | --- |
| Identity Envelope | Qualified ID, domain, namespace, source pack, owner, schema reference, aliases and lifecycle. | 25B / Registry Kernel. |
| Domain Core | Fields that make the definition a biome, creature, structure, recipe or other domain object. | Canonical domain document/registry. |
| Atlas Context | Distribution, history, ecology, culture, suitability, world role and relationships. | Documents 24A-24K and replacement world-content sources. |
| Gameplay Facet | Executable rules, inputs/outputs, stats, actions, ports, AI, interaction and progression. | Documents 03-17 and later system registries. |
| Presentation Facet | Asset families, icons, animation, audio, VFX, map and Codex links. | Forge, Audio/VFX and Document 17. |
| Technical Facet | Runtime type, service owner, LOD profile, authority, persistence, streaming and performance class. | Rewritten Document 18. |
| Expansion Facet | Optional fields owned by an admitted expansion schema. | Set 26 or later expansion owner. |
| Planning Metadata | Tier, status, milestone, effort, risk, blockers and evidence links. | Set 25 production records; excluded from clean shipped gameplay records where unnecessary. |

> **One-Owner Field Rule**  
> Each canonical field path has one editing authority. Other documents may reference, summarise or derive it only through the permitted copy types defined by 25B. Compilation rejects duplicate ownership even when values match.

# 6. Schema Registry and Registration Contract

Every domain and extension schema must be represented by a protected schema definition under the `leyforge.system.schema` identity space. The schema ID does not include a version token; its version is metadata.

## 6.1 Required schema registration fields

| Field | Requirement |
| --- | --- |
| schema_id | Qualified stable ID in the protected system namespace. |
| applies_to_domain | Registered domain prefix or authorised extension facet. |
| canonical_owner | Source document/registry with editing authority. |
| schema_version | Semantic schema version used for compatibility and migration. |
| parent_schema | Optional registered schema from which common rules are inherited. |
| allowed_facets | Facet IDs permitted to attach to definitions using the schema. |
| field_ownership_map | Owner for every canonical field path or field group. |
| required_field_rules | Always-required and conditional-required rules. |
| reference_rules | Permitted target domains, reference modes and cardinality. |
| state_contract | Allowed definition-level state profiles and runtime-state owner. |
| validation_profile | Required schema, semantic, graph and completeness validators. |
| migration_policy | Compatible changes, migration-required changes and prohibited silent changes. |
| extension_points | Named attachment locations for authorised extension schemas. |
| deprecation_policy | Replacement, tombstone or explicit incompatibility requirements. |

## 6.2 Domain-schema admission

A new top-level domain schema is admitted only when:

1. Existing domains cannot represent the concept without misleading identity, invalid ownership or unsafe lifecycle behaviour.
2. The concept has a distinct canonical owner and persistent semantic role.
3. It requires relationships or instance behaviour that cannot be expressed as a subtype, module, variant, interface or extension facet.
4. The proposed domain defines save, migration, pack, validation and reverse-reference consequences.
5. The architecture decision is approved at the level required by 25A.

A desire for cleaner filenames, shorter IDs, a new content theme or a large number of entries is not sufficient justification.

## 6.3 Extension-schema admission

An extension schema is preferred when an optional system adds behaviour to an existing definition. It must declare:

- the base schemas it may extend;
- owned field paths;
- required expansion pack and dependency mode;
- behaviour when the extension is absent;
- save records requiring quarantine or migration;
- compatibility with core and other extensions;
- validation and completeness additions;
- whether the extension changes selection eligibility or only runtime behaviour.

# 7. Universal Definition Envelope and Domain Facets

All domain definitions inherit the identity envelope locked in 25B and the following semantic groups derived from 24L. A group may be empty only when the domain schema explicitly permits it.

| Field Group | Canonical Purpose |
| --- | --- |
| Identity | Definition ID, domain, family, parent, namespace, source pack, schema and aliases. |
| Provenance | Canonical source, authoring record, revision, licence/provenance references and supersession history. |
| Planning | Tier, status, milestone, owner, priority, risk, effort and evidence links. |
| Selection | Scope, presets, rarity/density, uniqueness, suitability, exclusions, repetition controls and fallback group. |
| Capabilities | Provides, requires, consumes, produces, protects, threatens, teaches, unlocks and transforms. |
| Relationships | Typed hard/soft/query/generated/historical links and reverse-link expectations. |
| Gameplay | World role, player interactions, progression, challenge, rewards, failure, recovery and alternative outcomes. |
| Presentation | Model/material/animation/audio/VFX/icon/map/Codex manifests and accessibility metadata. |
| Runtime | Resource/runtime type, instance record, allowed states, transitions, LOD, streaming, authority, persistence and budgets. |
| Validation | Schema, semantic, graph, completeness, seed, performance, accessibility, representation and migration requirements. |
| Lifecycle | Creation, revision, deprecation, replacement, aliases, migration, archive reason and release notes. |

# 8. Domain Schema Field Groups

Domain schemas may add fields only inside registered groups or extension points. The following groups are standard across the project.

| Group | Representative Fields | Owner Rule |
| --- | --- | --- |
| domain_identity | family, subtype, parent, modules, variant profiles, selectable/abstract flag. | Canonical domain registry. |
| world_context | realm, layer, region roles, biome roles, distribution, climate, topology, history. | Atlas/world-content owner. |
| selection_contract | eligibility, suitability profile, exclusions, density, uniqueness, repetition cooldown, candidate roles. | Atlas/worldgen owner with technical validation. |
| capability_contract | offers, requirements, capacity, access, substitution, fallback and scope. | Functional owner; shared semantics owned by 25C. |
| relationship_contract | authored edges, generated-role declarations, reverse expectations and graph constraints. | Edge meaning owner; type semantics owned by 25C. |
| physical_contract | block/item/resource forms, inputs, outputs, drops, costs, storage, salvage and by-products. | Documents 03-06 and relevant system owner. |
| interaction_contract | actions, interfaces, permissions, danger, recovery, alternative approaches and player feedback. | Owning gameplay system. |
| dynamic_state_contract | allowed states, transitions, causes, evidence, persistence and migration. | Domain owner with runtime owner declaration. |
| presentation_contract | required assets, variants, sockets, events, readability and accessibility. | Forge/presentation owners. |
| technical_contract | runtime service, instance class, authority, LOD, streaming, save and performance class. | Document 18. |
| production_contract | tier, status, blockers, tests, evidence and admission gates. | Set 25. |

# 9. Required, Conditional, Optional and Derived Fields

Every schema field is classified as one of four modes.

| Mode | Meaning | Rule |
| --- | --- | --- |
| Required | Every concrete selectable definition must provide a value. | Missing value is a schema error. |
| Conditional Required | Required when a stated discriminator, capability, state, relationship or production tier applies. | The condition must be machine-testable. |
| Optional | May be absent without changing the definition's declared completeness level. | Optional does not mean unowned or unvalidated. |
| Derived | Compiled from canonical fields or indexes and not independently edited. | Conflicting authored values are rejected. |

Examples:

- A `creature` definition with `can_nest = true` conditionally requires a nest relationship or eligible nest capability query.
- A `structure` marked `restorable` conditionally requires restoration states, physical costs, ownership outcomes and persistent evidence.
- A `realm` classified as fully playable requires safe-return capability and a realm completeness contract; a teaser route does not.
- A mobile-container definition conditionally requires spatial-frame, authority, LOD and save contracts.

# 10. Schema Inheritance, Composition and Extension Facets

Inheritance supplies defaults; composition supplies reusable behaviour; extension facets add separately owned optional fields. These mechanisms are not interchangeable.

| Mechanism | Use | Prohibited Use |
| --- | --- | --- |
| Parent Schema | Shared field rules across related definition schemas. | Hiding ownership changes or domain incompatibility. |
| Parent Definition | Shared authored defaults within one semantic family. | Treating a mutable state as a child definition by default. |
| Module | Reusable composable behaviour with explicit compatibility. | Copying fields into multiple owners. |
| Variant Profile | Regional, cultural, material, seasonal, difficulty or realm modification. | Creating invisible gameplay power changes without presentation/validation. |
| Extension Facet | Optional expansion/system fields attached to a base definition. | Overwriting core fields or making an optional pack a hidden hard dependency. |
| Generated Binding | Seed/save-specific relationship or role assignment. | Replacing authored identity with generated text or coordinates. |

## 10.1 Merge precedence

1. Schema defaults.
2. Parent-definition defaults.
3. Composed modules in a declared deterministic order.
4. Base definition overrides.
5. Authorised variant profiles.
6. Authorised extension facets.
7. Generated bindings recorded in the world manifest.
8. Mutable runtime state stored separately.

Later layers may override only fields their schema explicitly permits. Extension facets never override a field owned by the base or another extension owner.

# 11. Schema Versioning and Compatibility

Schema versions live in metadata and manifests, not in definition IDs. Changes are classified by effect.

| Change Class | Examples | Required Treatment |
| --- | --- | --- |
| Compatible Additive | New optional field, new enum value with safe unknown handling, new derived index. | Minor schema revision; old content remains valid. |
| Conditional Additive | New conditionally required field for definitions opting into a feature. | Validator update; affected definitions migrate before feature admission. |
| Migration Required | Field rename, unit change, reference-mode change, split/merge of authoritative field. | Explicit migration, reverse-reference report, backups and version bump. |
| Identity Affecting | Domain change, owner change, incompatible semantic reinterpretation. | New definition ID or approved alias/migration plan under 25B. |
| Breaking Removal | Removed required field or meaning, unsupported state, deleted relationship type. | Major schema revision, content-pack compatibility decision and recovery path. |
| Prohibited Silent Change | Reinterpreting existing values without version/migration evidence. | Block compilation and release. |

# 12. Relationship Graph Architecture

The Atlas and gameplay registries form a graph whose nodes are qualified definitions, persistent instances, capability queries or spatial anchors. Edges are typed, source-owned and explainable. The graph is used by authoring tools, world generation, simulation, Codex discovery, quest/event binding, migration impact analysis and production planning.

> **Locked Graph Rule**  
> Relationship meaning must never be encoded only in prose, filenames, table position or an unregistered tag. Any relationship that affects selection, progression, persistence, authority, physical dependency or player-facing consequence requires a registered type and validated edge or query.

## 12.1 Node classes

| Node Class | Examples | Persistence |
| --- | --- | --- |
| Definition Node | biome, creature, culture, block, item, recipe, structure, realm. | Registry snapshot. |
| Capability Node | drinkable water, safe shelter, basic heat, realm return, cargo transfer. | System registry. |
| Query Node | provider query constrained by tags, scope and suitability. | Authored contract or compiled query. |
| Generated Binding Node | selected settlement role, local boss territory, trade route assignment. | World manifest/save. |
| Persistent Instance Node | named NPC, settlement, vessel/mobile construct, dungeon instance, event. | Save. |
| Spatial Anchor Node | world cell, compartment, socket, route waypoint, portal anchor. | World/save, relative to a spatial frame. |
| Historical Evidence Node | past event, ruin origin, ownership transfer, discovery record. | World history/save. |

# 13. Relationship-Type Definition Contract

Relationship types are protected definitions under `leyforge.system.relationship`. A type registration must specify:

| Field | Meaning |
| --- | --- |
| relationship_type_id | Stable qualified type identity. |
| canonical_verb | Human-readable semantic name. |
| source_domains | Allowed source domains or interfaces. |
| target_domains | Allowed target domains, capabilities, queries or instance classes. |
| direction | Directed, symmetric or ordered multi-party. |
| inverse_type | Derived inverse when applicable. |
| default_cardinality | Default source and target count constraints. |
| allowed_scopes | Definition, site, biome, region, realm, world, save, instance or spatial-frame scopes. |
| allowed_strengths | Required, preferred, possible, forbidden, historical or runtime-generated. |
| temporal_modes | Definition-static, worldgen binding, persistent runtime, transient runtime or historical. |
| reference_modes | Hard ID, soft ID, capability query, tag query, generated role or instance binding. |
| ownership_rule | Which facet/domain may author the edge. |
| cycle_policy | Allowed, forbidden or conditionally validated. |
| validation_rules | Inverse, suitability, cardinality, reachability and semantic checks. |
| save_policy | Whether generated/runtime edges persist and how they migrate. |

New relationship types require semantic justification. Synonyms are rejected in favour of one canonical type plus display-language variation.

# 14. Direction, Inverses and Symmetry

A canonical edge is authored once. Its inverse and search indexes are derived unless the reverse statement carries independent information.

| Pattern | Example | Rule |
| --- | --- | --- |
| Directed Inverse | contains / part_of | Author the canonical source edge; compile the inverse index. |
| Symmetric | allies_with, borders | Store one canonical pair ordered deterministically; expose both directions. |
| Asymmetric Social | fears, respects, claims | Do not infer reciprocity. |
| Ordered Route | route_from / route_to | Preserve direction and traversal conditions. |
| Transform | transforms_into | Direction is meaningful; reverse requires an explicit restoration relationship. |
| Multi-Party | dispute over a site, trade network | Represent through a relationship/binding record when pairwise edges would lose role meaning. |

## 14.1 Inverse consistency

- An authored inverse that contradicts the canonical edge is an error.
- Derived inverse indexes are not editable source truth.
- Symmetric relationships may include different runtime attitudes only through separate state records, not by breaking the type semantics.
- `hostile_to` is symmetric only when the relationship type explicitly says so; one-sided predation, fear or claim remains directed.

# 15. Cardinality, Scope, Strength and Temporal Mode

## 15.1 Cardinality

Supported cardinality expressions are:

- `0..1`
- `1`
- `0..*`
- `1..*`
- exact count
- inclusive range
- at-least / at-most
- one-per-scope, such as unique per world or one capital per faction

Cardinality may apply to definitions, generated instances or both. A culture may support many settlement forms as definitions while one generated settlement has exactly one current primary government.

## 15.2 Scope

| Scope | Meaning |
| --- | --- |
| definition | Relationship exists between authored definitions. |
| local_site | Must resolve within one site or local generation cluster. |
| spatial_frame | Must resolve inside or relative to one world/mobile frame. |
| biome | Must resolve within the biome instance or its transition zone. |
| region | Must resolve somewhere in the generated region. |
| realm | Must resolve within the realm network. |
| culture/faction | Must resolve for a generated social group or territory. |
| world | Must resolve somewhere in the enabled world. |
| save_instance | Binds specific persistent instances. |
| player/party | Applies to a player or group state and is owned by runtime systems. |

## 15.3 Strength

| Strength | Semantic Meaning |
| --- | --- |
| Required | The package or generated context is invalid if unresolved. |
| Preferred | Improves selection score but is not mandatory. |
| Possible | Permitted relationship used for variety or runtime emergence. |
| Forbidden | Explicitly blocks coexistence or selection. |
| Historical | Describes a past relationship and may conflict with current state. |
| Runtime-Generated | Created by simulation, player action or event rather than fixed in the definition. |

## 15.4 Temporal mode

Relationships must declare whether they are definition-static, worldgen-bound, persistent runtime, transient runtime or historical. Current ownership, occupation and hostility generally belong to runtime state; cultural origin, compatible habitat and potential trade relationships generally belong to definitions.

# 16. Hard References, Soft References, Queries and Generated Bindings

| Reference Mode | Use | Failure Behaviour |
| --- | --- | --- |
| Hard Definition Reference | Exact provider is intrinsic to identity or package contract. | Missing target blocks compilation or pack/world load. |
| Soft Definition Reference | Optional enrichment or cross-pack enhancement. | Missing target removes the enrichment and records a warning if required. |
| Capability Query | Any eligible provider may satisfy a functional requirement. | Resolve through provider selection or fallback/repair. |
| Tag Query | Broad discovery/filtering where tags are sufficient and no progression guarantee depends on exact semantics. | Empty result is allowed only if the field is optional. |
| Generated Role | World generation assigns a definition to a semantic role. | Binding must be deterministic, recorded and validated. |
| Persistent Instance Binding | Runtime state connects specific entities, sites, routes, owners or anchors. | Missing target invokes explicit recovery/quarantine, never guessed replacement. |
| Historical Reference | Evidence links to past definitions or instances. | Tombstones remain resolvable for history and migration. |

> **Hard-Reference Restraint Rule**  
> Use a hard definition reference only when replacing the target with an equivalent provider would change the source identity or authored story. Progression, survival, world-start safety and generic production should normally use capability requirements.

# 17. Reverse Links, Graph Normalisation and Derived Indexes

The canonical graph stores source-owned edges and generates indexes for efficient search.

Derived indexes may include:

- inverse relationships;
- providers by capability and scope;
- consumers by resource or capability;
- references by namespace and pack;
- dependants of a definition/schema/relationship type;
- suitability candidates by environment and role;
- persistent instances by definition and spatial frame;
- POC/archive/test/dev contamination reports;
- unresolved optional references;
- migration impact and removed-content reports.

The indexes are generated outputs. Editing a reverse index or generated provider list is prohibited. Authoring tools may present them for review and offer a controlled action that writes to the canonical edge owner.

# 18. Spatial, Container-Local and Mobile-Frame Relationships

Document 25B locks stable spatial frames and container-local records. 25C defines how graph edges use them without embedding derived world coordinates as identity.

| Spatial Reference | Required Data |
| --- | --- |
| World Anchor | World/realm instance ID, stable chunk/cell/anchor key and optional semantic socket. |
| Container Anchor | Persistent container/frame ID plus local anchor, component, compartment, cell or transform. |
| Route Anchor | Route instance/definition plus waypoint or segment identity. |
| Portal Anchor | Portal/route instance plus endpoint role and realm/world frame. |
| Nested Container | Parent frame ID, child frame ID, attachment relationship and authority owner. |
| Transfer Relationship | Source frame, destination frame, transition state, authority handoff and persistent child identities. |

## 18.1 Spatial relationship rules

- Persistent child identity remains stable when its world transform changes.
- Relationships such as `contained_by`, `attached_to`, `occupies`, `docked_at`, `connected_to` or `transfers_through` must identify the frame/anchor, not only coordinates.
- Cyclic physical containment is invalid.
- A mobile frame may have one authoritative parent frame at a time, although historical records may preserve previous attachments.
- LOD promotion/demotion may change representation but not identity, ownership or unresolved relationships.
- Set 26 vessel interiors use this general contract; 25C does not define vessel physics or compartment simulation.

# 19. Capability Architecture

Capabilities describe what the world, a provider or a system can do. They are stable definitions under `leyforge.system.capability` and are intentionally more abstract than blocks, items, structures or NPCs.

> **Locked Capability Rule**  
> Capability identity describes a player- or system-relevant outcome, not the name of the content currently providing it. `survival.drinkable_water` is a capability; `spring_water_block` is a provider.

## 19.1 Capability families

| Family | Representative Outcomes |
| --- | --- |
| Survival | breathable environment, drinkable water, basic food, shelter, heat, healing, safe rest. |
| Gathering | harvest material band, cut wood, mine hard stone, collect fluid, prospect deposit. |
| Crafting/Processing | work surface, heat source, smelt metal, preserve food, refine mana, repair equipment. |
| Building | place structural block, create door/roof/storage, support settlement project. |
| Logistics | store, transfer, filter, route, load/unload, cross-frame cargo transfer. |
| Power/Magic | mechanical power, mana supply, ward protection, ritual anchor, stabilisation. |
| Civilisation | housing, provisions, health, work, safety, infrastructure, morale, trade service. |
| Exploration | traverse terrain, navigate, map, dive, climb, fly, enter/return from realm. |
| Combat/Defence | damage channel, protection, siege resistance, warning, evacuation, recovery. |
| Knowledge/Progression | teach recipe family, research school, reveal route, unlock capability band. |
| Worldgen | valid start, region connectivity, settlement viability, ecology role, safe return. |
| Presentation/Accessibility | readable warning, non-colour cue, captionable sound, input alternative. |

The starter families are not a final content roster. Domain owners register concrete capability IDs only when the outcome is testable and not already represented by an existing capability.

# 20. Capability Provider and Requirement Contracts

## 20.1 Provider offer

A capability offer declares:

| Field | Meaning |
| --- | --- |
| capability_id | Registered functional outcome. |
| provider_ref | Definition, instance, module or system offering it. |
| capability_band | Qualitative or ordered band where the capability supports tiers. |
| capacity | Optional quantity/rate/slots/range; units are owned by the capability schema. |
| quality | Output quality or reliability where meaningful. |
| access_mode | Gather, craft, trade, teach, interact, route, own, power, unlock or other registered mode. |
| scope | Local, site, biome, region, realm, world, settlement, spatial frame or player. |
| conditions | State, power, weather, permission, reputation, equipment, skill or environment requirements. |
| costs | Resources, time, risk, maintenance, authority or opportunity costs. |
| persistence | Continuous, periodic, consumable, one-shot or event-bound. |
| substitutes | Compatible capability offers or interface implementations. |
| evidence | Blocks/items/structures/UI/state evidence proving the capability exists in play. |

## 20.2 Consumer requirement

A capability requirement declares:

| Field | Meaning |
| --- | --- |
| capability_id | Required outcome. |
| minimum_band | Lowest acceptable capability band. |
| minimum_capacity | Required quantity/rate/count/range if applicable. |
| access_limit | Maximum route cost, distance, danger, progression band or permission barrier. |
| required_scope | Local/site/region/realm/world or runtime ownership scope. |
| timing | Start, before milestone, continuous, seasonal, event or on-demand. |
| substitution_policy | Exact capability only, compatible interface, or fallback group. |
| exclusivity | Whether one provider may satisfy multiple requirements or must be dedicated. |
| failure_severity | Warning, generation blocker, progression blocker, save blocker or release blocker. |
| fallback_group | Registered fallback and repair contract. |
| player_facing_reason | Why the capability is required and what failure would mean. |

# 21. Capability Bands, Capacity, Access and Quality

Capability bands are capability-specific ordered semantics, not one universal material tier. For example, heat, structural strength, navigation, mana storage and medical treatment may each have different bands.

Rules:

- Bands must be defined by the capability owner and have testable meaning.
- A higher band does not automatically provide every lower-band interface unless explicitly declared.
- Rarity, item colour or lore status does not define capability band.
- Capacity and quality are separate from the band.
- Access is part of reachability: a provider that exists but cannot be reached, powered, afforded, understood or legally used may not satisfy the requirement.
- Optional expansion providers may satisfy requirements only when the active build/world profile admits them.

# 22. Suitability Architecture

Suitability decides whether a definition can fill a role in a generated or runtime context. It is a structured result rather than one opaque weight.

## 22.1 Suitability evaluation stages

1. Validate definition, pack and schema eligibility.
2. Validate realm/world/profile availability.
3. Apply hard environmental and topology constraints.
4. Apply hard ecology, culture, history, progression, authority and performance constraints.
5. Apply explicit exclusions and conflict groups.
6. Confirm required capabilities and neighbouring relationships can resolve.
7. Calculate soft-preference components for eligible candidates.
8. Apply uniqueness, density and repetition controls.
9. Sort the candidate set deterministically.
10. Use the named sub-seed for weighted selection among eligible candidates.
11. Record the chosen candidate, rejected reasons, score components and bindings.

> **No Weight Override Rule**  
> A large preference weight may never rescue a candidate that failed a hard constraint, exclusion, pack dependency, capability requirement, spatial rule or production-tier gate.

# 23. Hard Constraints, Soft Preferences and Exclusions

## 23.1 Standard hard-constraint groups

- realm and physical-law compatibility;
- temperature, moisture, altitude, depth, salinity, atmosphere, light and water state;
- terrain slope, geology, soil, clearance, volume and structural support;
- route, entrance, return, access and traversal requirements;
- required prey, food, host, resource, labour, settlement, structure, portal or history;
- progression band, danger band and player-start safety;
- authority, ownership, sacred/protected territory and world-setting restrictions;
- performance footprint, active-simulation budget and streaming class;
- content-pack, platform and dependency availability.

## 23.2 Standard soft-preference groups

- preferred climate, terrain, magic intensity, corruption, civilisation influence and resource richness;
- synergy with neighbouring biomes, structures, ecologies, routes or economies;
- historical and cultural fit;
- narrative contrast and regional readability;
- world uniqueness, novelty and repetition cooldown;
- player-selected world profile and difficulty;
- production/asset reuse where it does not reduce identity;
- performance headroom.

## 23.3 Exclusions

Exclusions are first-class data and may target definitions, tags, capabilities, states, scopes or relationship combinations. Examples include:

- no surface spawn;
- no ocean or no underground;
- incompatible low mana;
- forbidden sacred ground;
- requires unclaimed territory;
- cannot coexist with a particular ecology role;
- mutually exclusive world-unique origin;
- no active civilisation within radius;
- no mobile-frame placement;
- unavailable without required expansion.

An exclusion must explain its owner and reason. Hidden code-only exceptions are technical debt and block production admission.

# 24. Deterministic Candidate Selection and Explainability

Determinism requires more than using the same seed.

## 24.1 Selection contract

- Candidate definitions are resolved from a fixed registry snapshot and active pack manifest.
- Candidates are sorted by qualified ID before random selection.
- The selection role uses a named sub-seed derived from world seed, generation version, scope key and role key.
- Numeric operations, unit conversions and tie-breaking must be stable across supported platforms.
- Candidate rejection reasons and score components are available to debug tools.
- The selected binding and its provenance are recorded when later regeneration could differ.
- Registry or algorithm version changes cannot silently rewrite explored persistent content.

## 24.2 Explainability trace

A trace should answer:

- Which role was being filled?
- Which candidate source query was used?
- Which candidates were considered?
- Which hard constraints or exclusions rejected candidates?
- Which preference components affected ranking?
- Which sub-seed and algorithm version selected the result?
- Which capability requirements were satisfied?
- Was a fallback or repair used?
- Which definition/pack/schema versions were active?

# 25. Generated Bindings and World-Manifest Evidence

Generated bindings convert definition possibilities into a specific world.

| Binding Type | Examples | Persistence Rule |
| --- | --- | --- |
| Topology Binding | Region adjacency, realm route, river-to-sea, cave entrance. | World manifest; immutable after explored unless migrated. |
| Role Binding | Culture assigned to settlement, boss assigned to territory, creature assigned to ecology role. | World manifest or generated instance record. |
| Provider Binding | Which source satisfies a required capability for a region/settlement/realm. | World manifest and reachability report. |
| Historical Binding | Builder, former owner, catastrophe, occupation or restoration origin. | Procedural history record. |
| Asset Variant Binding | Culture/material/seasonal presentation selected for an instance. | Instance or derived deterministic key, according to save policy. |
| Runtime Binding | Trade contract, faction claim, current occupant, active route or quest participant. | Save, owned by runtime service. |
| Spatial Binding | Structure anchor, local compartment, dock/socket or route endpoint. | World/save with spatial-frame identity. |

Bindings must retain source definition IDs, selected variant/module IDs, generation version and relevant sub-seed lineage.

# 26. Fallback Groups and Repair Strategies

Fallback groups preserve capabilities without promising one named content entry. They are protected interface records under `leyforge.system.interface.fallback_group.*` unless 25D approves a different kernel representation.

## 26.1 Fallback hierarchy

Use the least intrusive valid method:

1. Select another eligible provider from the normal candidate group.
2. Select a compatible provider through a capability/interface query.
3. Use a regional, cultural, material or realm variant of an approved provider family.
4. Provide access through trade, migration, salvage, research, teaching, quest, route or restoration.
5. Generate an additional suitable provider/site/route in an unexplored or uncommitted location.
6. Repair topology or access while preserving existing content identity.
7. Apply a declared world-profile compatibility adjustment.
8. Fail world creation or warn that the chosen pack/profile combination is unsupported when safe repair is impossible.

A fixed Forest Hamlet, watchtower, goblin raid, named teacher, exact portal, exact ore or guaranteed coordinate is never a fallback.

## 26.2 Fallback group contract

| Field | Requirement |
| --- | --- |
| fallback_group_id | Stable interface identity. |
| required_capability | Capability and minimum band/capacity. |
| supported_scopes | Start/local/region/realm/world/settlement/etc. |
| provider_queries | Eligible provider and variant queries. |
| minimum_provider_count | Count required after generation. |
| access_threshold | Maximum distance, route cost, danger or progression delay. |
| repair_methods | Ordered approved repair operations. |
| forbidden_repairs | Operations that would break canon, saves, topology, agency or pack boundaries. |
| deterministic_key | Named sub-seed/role used for provider and repair selection. |
| persistence_policy | What is written to manifest/save. |
| user_feedback | Warning, world-profile message or debug explanation where applicable. |
| validation_suite | Seed counts, presets, pack combinations and migration scenarios. |

# 27. Progression Reachability and Capability Guarantees

Reachability proves that a capability is not merely present but obtainable through valid player/world actions.

## 27.1 Reachability graph

Nodes may include:

- player starting capabilities;
- resource/material providers;
- blocks/items/tools/stations/machines;
- recipes and transformations;
- knowledge/teacher/research providers;
- settlements, routes, trade and permissions;
- hazards, traversal and protection requirements;
- realms and return routes;
- boss/event gates and alternative outcomes.

Edges represent acquisition, transformation, access, teaching, trade, unlock, transport or state transition. A Core Production world preset must resolve all mandatory milestones without depending on disabled optional content or one named entry.

## 27.2 Guarantee classes

| Guarantee | Required Result |
| --- | --- |
| Start Safety | Player can reach basic survival, shelter and recovery capabilities in the approved opening window. |
| Early Physical Progression | At least one valid gathering, tool, processing and building path exists. |
| Civilisation Access | At least one viable path reaches civilisation interaction without forcing a fixed nearby village. |
| Automation/Magic Access | Selected Core slice provides valid discovery and physical supply paths for its included automation and practical magic capabilities. |
| Adventure Access | Required dungeon/site/boss roles are discoverable and reachable with preparation alternatives. |
| Realm Access and Return | A fully playable realm has at least one valid access route and one validated safe-return or recovery capability. |
| Recovery | Death, loss, route failure, settlement destruction or provider removal does not permanently invalidate required progression unless the world setting explicitly permits it. |
| Expansion Independence | Base-game guarantees remain valid when optional expansions are absent. |

# 28. Dynamic States, Transitions and Transformation Relationships

Definitions declare allowed states and transitions; runtime services own current state. `transforms_into`, `restored_as`, `corrupts`, `cleanses`, `occupies`, `abandons` and similar relationships must specify whether they change a definition binding, instance state, ownership, presentation or all of these.

| Transition Field | Requirement |
| --- | --- |
| source_state | Allowed current state/profile. |
| target_state_or_definition | Resulting runtime state or new definition binding. |
| trigger | Player action, event, time, ecology, damage, magic, weather, economy or migration. |
| prerequisites | Capability, resource, ownership, permission, history or world-setting requirements. |
| costs_and_outputs | Physical inputs, outputs, salvage, by-products and rewards. |
| persistence | Temporary, reversible, persistent or world-history permanent. |
| evidence | Visual/audio/UI/Codex/world-state evidence. |
| relationship_effects | Edges added, removed, suspended or historised. |
| migration | Behaviour when transition/schema changes across versions. |
| fallback | Recovery or safe failure when target content is unavailable. |

# 29. Universal Completeness Contract

Every concrete production package inherits the universal contract below. Domain contracts add requirements; they do not remove universal obligations unless the package is explicitly classified as a non-playable concept or test fixture.

| Contract Area | Minimum Requirement |
| --- | --- |
| Identity and Ownership | Stable qualified ID, schema, namespace, canonical owner, source pack, parent/family and lifecycle status. |
| World Role | Clear reason the content exists and the player/world-facing function it performs. |
| Selection | Scope, eligibility, suitability, exclusions, density/uniqueness and deterministic selection role. |
| Relationships | Required graph edges/queries, reverse expectations, cardinality, scope and unresolved-link policy. |
| Capabilities | Functional offers and requirements with access, conditions, capacity/band where needed and fallback group. |
| Physical Support | Real blocks/items/resources/recipes/drops/costs/storage or an explicit reason no physical form applies. |
| Player Interaction | Discover, use, avoid, trade, fight, restore, build, research, negotiate or other valid approaches. |
| Failure and Recovery | Failure consequences, readable warning, recovery, alternative outcomes and no silent dead end. |
| Dynamic State | Allowed states, transitions, ownership/occupation effects, persistence and aftermath. |
| Presentation | Required asset, animation, audio, VFX, icon, map/Codex, readability and accessibility metadata. |
| Runtime | Service owner, instance/state model, authority, LOD, streaming, save, migration and performance class. |
| Validation | Schema, graph, completeness, seed, reachability, performance, accessibility, representation, migration and regression evidence. |
| Production Evidence | Responsible owner, milestone, blockers, approved deferrals and status-gate evidence. |

# 30. Domain Package Completeness Contracts

## 30.1 World, region, biome and special-environment package

Must define:

- topology/layer/realm position and adjacency;
- climate, terrain, water, geology, light and environmental laws;
- transition rules and exclusion boundaries;
- resource and capability providers;
- ecology roles and pressure;
- civilisation/settlement/route suitability;
- structures, sites, hazards and discovery cues;
- dynamic states, disasters, recovery and long-term change;
- block/material/presentation families;
- traversal, start-safety and performance requirements;
- seed tests and fallback providers.

## 30.2 Realm package

A fully playable realm additionally requires:

- persistent topology and derived seed lineage;
- multiple environment/biome roles and transitions;
- realm laws with player-facing effects;
- native ecology/resources/structures/sites;
- civilisation or deliberate non-civilisation rationale;
- access, discovery, ownership, stability and safe return;
- progression value in and outside the realm;
- at least one adventure/guardian path with alternatives and aftermath;
- save, LOD, streaming, authority and migration treatment.

A teaser route may use a reduced contract but may not be labelled a fully playable realm.

## 30.3 People, culture, faction and settlement package

Must keep ancestry, culture, citizenship, faction, faith, language, government and profession separate. It requires:

- homeland/diaspora and environment suitability;
- population and settlement forms;
- homes, jobs, needs, services, stores and production;
- architecture/material/presentation families;
- relations, law, trade, conflict and player approaches;
- history, beliefs, internal diversity and generated-name rules;
- growth, decline, migration, conquest, restoration and aftermath;
- physical goods/resources/recipes/structures;
- NPC simulation/LOD/authority/save contracts;
- representation review and counterexample seed tests.

## 30.4 Creature, monster and ecology package

Requires:

- habitat, diet, ecological role and population baseline;
- reproduction/nest/source or explicit non-reproducing origin;
- movement, senses, threat/avoidance and settlement interaction;
- prey/predator/scavenger/competitor relationships where applicable;
- drops, harvesting, trade, crafting, magic or ecological value;
- local spawn representation tied to regional state;
- migration, depletion, recovery, invasion or state change where applicable;
- visual/audio/animation/readability;
- AI/LOD/performance/save treatment;
- counterplay, rewards and persistent consequences for hostile content.

## 30.5 Dungeon, ruin, lair and site package

Requires:

- environment/topology placement and origin;
- builder/former owner/current occupant/history;
- entrance, route, return and traversal validity;
- procedural grammar or authored layout contract;
- inhabitants, ecology, hazards, puzzles and services;
- resource/loot/reward provenance;
- state model including clear/occupy/restore/claim/destroy as applicable;
- boss or major encounter binding where required;
- alternative outcomes, reoccupation and aftermath;
- map/Codex/discovery evidence;
- save and migration behaviour.

## 30.6 Boss, titan, siege or guardian package

Requires:

- territory, motivation, ecological/social role and discovery cues;
- encounter or pressure behaviour before direct combat;
- arena/lair/site and traversal/escape rules;
- preparation capabilities and multiple valid approaches where appropriate;
- exact combat behaviour owned by Document 16, not duplicated here;
- rewards, knowledge, resources and provenance;
- non-combat/avoidance/negotiation/restoration outcome where approved;
- defeat, survival, recurrence or transformation rules;
- regional, faction, ecology and world-state aftermath;
- accessibility warnings, difficulty and recovery;
- performance, LOD, save and authority requirements.

## 30.7 Structure, route, service and infrastructure package

Requires:

- function, builder/user/owner and historical role;
- placement, terrain/route/settlement compatibility;
- physical block/material/blueprint and component requirements;
- construction, operation, maintenance, damage, repair and salvage;
- services, capacity, inputs/outputs, storage and permissions;
- NPC, automation, magic, combat and event connections;
- route/network endpoints and failure behaviour;
- dynamic states, occupation, claim and restoration;
- asset kit, socket/event bindings and LOD;
- save/authority/migration.

## 30.8 Resource, loot, relic, goods and material-ecology package

Requires:

- source, distribution, renewability and environmental conditions;
- physical block/item forms and grades/quality/purity where applicable;
- extraction/harvesting requirements and consequences;
- transformations, by-products, salvage, recycling and sinks;
- capability contributions and progression role;
- settlement/culture/faction demand, claims, legality and trade;
- creature/site/boss/history provenance for loot and relics;
- contextual reward rules rather than rarity-only power;
- storage, spoilage/decay/charge and instance state;
- worldgen, economy, save and migration validation.

## 30.9 History, arc, quest, event, rumour and dynamic-state package

Requires:

- eligible contexts and participant roles;
- evidence, knowledge certainty and cultural viewpoints;
- triggers, stages, branches, failure and timeout policy;
- required capabilities and alternative providers;
- physical objectives/rewards/consequences where applicable;
- world/settlement/ecology/faction/site relationships;
- generated participant binding and missing-target recovery;
- persistent aftermath and history records;
- player-agency, urgency and trust rules;
- LOD, multiplayer contribution, save and migration.

# 31. Physical Gameplay and Cross-Registry Completeness

Atlas context cannot become executable until physical registries support it. For each selected package, the dependency matrix must identify:

| Physical Layer | Required Questions |
| --- | --- |
| Blocks | Which terrain, construction, functional, hazard, state and infrastructure blocks physically realise the package? |
| Items | Which carried resources, tools, components, drops, goods, knowledge, rewards and block-item forms exist? |
| Resources | Where do physical inputs originate, how are they renewed/depleted, and which capability bands do they support? |
| Recipes/Transformations | How do inputs become outputs, what stations/power/knowledge are required, and what substitutions/by-products exist? |
| Structures/Blueprints | Which block families, project stages, sockets and services assemble the package? |
| NPC/Civilisation | Who produces, consumes, trades, teaches, repairs, protects or contests it? |
| Automation/Magic | How may production or capability scale, and what risks/permissions apply? |
| Combat/Adventure | What threatens it, what does it protect against, what rewards or aftermath connect? |
| UI/Presentation | How does the player understand availability, requirements, state, danger, ownership and fallback? |

A package with a lore resource but no physical source, item, use or sink is incomplete. A recipe with no reachable inputs is incomplete. A biome with no block/material/ecology/structure support is incomplete. A settlement with abstract resources that are not connected to real inventories and production is incomplete.

# 32. Major Expansion and Optional-Content Completeness

Major expansions inherit every relevant universal/domain contract and add an Expansion Extension Contract.

## 32.1 Required expansion declarations

- programme authority and owning documents;
- namespace and package identity (finalised by 25D);
- required, optional and incompatible dependencies;
- base definitions extended and extension schemas used;
- new domains requested, if any, with justification;
- capabilities added and whether core progression may depend on them;
- cross-pack relationships and fallback behaviour;
- world-profile and build-profile admission;
- save records, removal/quarantine/reactivation and migration;
- performance, LOD, authority and platform requirements;
- downstream main-document amendments;
- completeness and release gates.

## 32.2 Optional-content safety rules

- Base content may not hard-require an optional expansion in a profile where it is absent.
- Optional providers may enrich or substitute capabilities only when core providers remain valid.
- If an expansion is promoted to build-profile-required, manifests and worlds record that requirement explicitly.
- Removing an expansion with active persistent records must invoke the 25D recovery policy; silent deletion or reinterpretation is prohibited.
- Cross-expansion facets must declare load-order, field ownership and compatibility.
- Completeness is evaluated for each supported pack combination, not only the maximum installed configuration.

# 33. Set 26 Compatibility and Schema-Admission Boundary

Set 26 is the first major real-world test of these contracts. The mappings below are canonical compatibility directions, not detailed maritime schema design.

| Set 26 Concept | Default 25C Mapping | Detailed Owner / Admission Condition |
| --- | --- | --- |
| Oceans, seas, coasts, islands, underwater regions | world, region, biome, env and overlay schemas. | 24C, replacement Document 11 and 26C. |
| Water/liquid definitions | fluid definitions plus state/effect/runtime facets. | 26B and Document 18 define behaviour and storage. |
| Waves, currents, tides, wind and storms | env, weather and spatial_profile definitions/bindings by default. | 26D may request a new domain only if these cannot represent persistent semantics safely. |
| Vessel class/mobile voxel construct | vehicle definition with mobile-frame, structure, blueprint and component_role interfaces by default. | 26F-26G may submit a vessel-domain admission case if `vehicle` is semantically unsafe. |
| Vessel blueprint | blueprint definition referencing block/component roles and Forge presentation. | 26F, 26H, 26I and 25K. |
| Commissioned vessel | Persistent mobile-container instance referencing class/blueprint/refit history. | 26F-26I and 26O; not a new authored definition per commissioned object. |
| Port, harbour, dock and shipyard | structure, service, project, settlement and route definitions. | 26J with Documents 07, 11 and 12. |
| Crew role | job definition and NPC/culture/faction relationships. | 26J and Documents 07/13. |
| Fleet | Persistent group/formation binding; an authored fleet-class or doctrine may use an extension schema. | 26K must justify any new fleet domain. |
| Cargo shipment/trade voyage | Persistent contract/shipment record referencing item/goods/market/route and owners. | 26K/26N and economy/quest owners. |
| Flooding, breach, fire and vessel damage | state/status/effect definitions plus container-local runtime state and transitions. | 26L/26O. |
| Marine creatures, sites, bosses and events | Existing creature, ecology, nest, site, boss, quest, event and aftermath schemas. | 26M/26N and main system owners. |
| Maritime capability examples | Navigation, buoyancy, cargo transfer, watertight integrity, diving, rescue and safe harbour may become capabilities after owning Set 26 definitions specify testable semantics. | 26B-26O submit capability registrations; 25C does not invent final bands or values. |

## 33.1 Persistent mobile-construct completeness extension

Any block-built moving construct, including future vessels, airships or mobile fortresses, conditionally requires:

- class/blueprint/instance separation;
- stable spatial frame and local child identities;
- component-role graph and structural connectivity;
- construction, commissioning, refit, damage, repair and salvage transitions;
- power/propulsion/control interfaces as owned by the system document;
- ownership, access, crew/occupant and cargo permissions;
- world/frame transfer and route/anchor relationships;
- near/far LOD representation preserving resource conservation and identity;
- save, migration, recovery and optional-pack removal behaviour;
- multiplayer authority and moving-interior consistency;
- performance and validation fixtures.

This extension is general architecture. Set 26 owns maritime implementation.

# 34. Validation Severity and Failure Behaviour

| Validation Failure | Severity | Required Behaviour |
| --- | --- | --- |
| Definition references unregistered schema | Error | Reject compilation. |
| Extension facet uses unregistered schema or field path | Error | Reject facet/pack. |
| Missing always-required or triggered conditional field | Error | Reject definition. |
| Relationship type unregistered or domains incompatible | Error | Reject edge. |
| Required inverse/cardinality inconsistency | Error | Reject graph snapshot or generated binding. |
| Hard reference unresolved | Error/Load Blocker | Block build, pack or world load according to scope. |
| Capability requirement has no eligible provider or fallback | Generation/Progression Blocker | Reject supported profile/seed or run approved repair. |
| Preference weight attempts to override hard exclusion | Error | Reject selection rule. |
| Candidate selection is nondeterministic or lacks stable ordering | Error | Block worldgen release. |
| Generated binding lacks provenance/version/sub-seed evidence | Error | Reject persistent manifest. |
| Fallback uses fixed POC identity or undeclared repair | Release Blocker | Reject production profile. |
| Completeness contract missing required physical/presentation/runtime owner | Status Blocker | Cannot advance to Specified/Data Ready/Integrated as applicable. |
| Optional expansion is absent but base hard dependency remains | Compatibility Blocker | Reclassify dependency, add fallback or promote expansion explicitly. |
| Mobile local record lacks spatial frame/anchor | Data-Loss Blocker | Block restoration or enter approved recovery mode. |
| Dynamic transition deletes authoritative relationships/history | Save Blocker | Reject transition/migration. |
| New relationship/capability string bypasses registry | Error | Require registration or use existing type. |
| Ambiguous soft/query result affects progression without tie-break/fallback | Progression Blocker | Define deterministic selection and repair. |

> **No Silent Semantic Repair Rule**  
> Tools may suggest an existing relationship type, capability, provider, exclusion or fallback, but they may not silently reinterpret a definition, weaken a requirement, delete a relationship, invent a provider or alter a frozen binding.

# 35. Authoring and Review Workflow

1. Define the package fantasy, world role, player-facing purpose and canonical owner.
2. Select the registered domain schema and parent definition.
3. Reserve the qualified ID under 25B.
4. Fill required identity and domain fields.
5. Declare capabilities offered and required.
6. Add typed relationships, queries, scopes, strengths and cardinality.
7. Define suitability constraints, exclusions, preferences, uniqueness and density.
8. Assign fallback groups for mandatory capabilities and progression roles.
9. Fill physical, interaction, state, presentation, technical and validation contracts.
10. Run schema and field-ownership validation.
11. Run graph, inverse, cardinality and reference validation.
12. Run provider, reachability, fallback and package-completeness analysis.
13. Review cross-domain owners and reverse-reference impact.
14. Prototype the complete loop with placeholder assets and persistent state.
15. Advance production status only with evidence required by 25A/24L.

## 35.1 Review questions

- Does the definition have a role beyond aesthetic variety?
- Are required relationships explicit and source-owned?
- Can every capability requirement resolve in supported profiles?
- Are exclusions and failure modes visible rather than hidden in code?
- Does the package have real physical inputs, outputs, states and evidence?
- Are fallback methods equivalent in function without becoming identical content?
- Can the world explain why this content is here?
- Can a save preserve what happened when the content changes?
- Can an optional expansion be absent without corrupting the package?

# 36. Decisions Locked by 25C and Handoff to Later Documents

## 36.1 Working locks requiring approval of this draft

- Every domain and extension facet uses a registered schema definition and one field-ownership map.
- Relationship types and capabilities are registered protected definitions, not freeform strings.
- Canonical relationship edges are authored once; inverses and search indexes are derived.
- Relationships declare direction, cardinality, scope, strength, temporal mode, reference mode, owner and validation.
- Capability requirements target functional outcomes and eligible providers rather than named content by default.
- Hard constraints, pack availability and exclusions are evaluated before weighted preferences.
- Candidate ordering, named sub-seeds, tie-breaking and explainability traces are mandatory for persistent procedural selection.
- Fallback groups use ordered provider/repair strategies and may not recreate retired POC identities or fixed arrangements.
- Reachability includes access, cost, permission, danger, knowledge and route validity, not mere provider existence.
- Every selected package inherits the universal completeness contract and its domain contract.
- Optional expansion absence is validated as a supported configuration; core progression cannot silently depend on it.
- Mobile/nested constructs use the 25B spatial-frame identity and the conditional mobile-construct completeness extension.
- Set 26 maritime records map to existing domains and extension schemas by default; any new top-level domain requires explicit admission evidence.

## 36.2 Handoff to Document 25D

25D must define:

- pack manifests carrying schema, relationship, capability and interface versions;
- required, optional, build-profile-required, soft and incompatible dependencies;
- authoring formats and generated outputs;
- compilation order and extension-facet assembly;
- pack removal, quarantine, reactivation and migration;
- registry snapshot hashes and world-manifest compatibility;
- distribution and namespace topology for official expansions;
- source/provenance and rollback records.

## 36.3 Handoff to Document 25E

25E must convert this document into automated tests for:

- schema and conditional fields;
- field ownership;
- relationship domains, inverses, cycles and cardinality;
- capability providers and reachability;
- suitability and exclusions;
- deterministic selection traces;
- fallback/repair behaviour;
- universal/domain completeness;
- optional expansion combinations;
- spatial frames and LOD identity;
- seed, migration, performance and release gates.

## 36.4 Handoff to 25F-25G and Set 26

25F-25G instantiate these contracts for the chosen Core Production packages. Set 26 submits detailed extension schemas, capability registrations, domain-admission requests and completeness additions to the relevant Set 25/main-document owners before maritime entries become canonical.

# 37. Risks, Redesign Triggers and Open Decisions

## 37.1 Risks

| Risk | Consequence | Control |
| --- | --- | --- |
| Schema Proliferation | Every content family invents a bespoke format and tooling becomes unmaintainable. | Parent schemas, standard field groups and admission review. |
| Relationship Vocabulary Drift | Synonyms and ambiguous verbs produce incompatible graphs. | Protected starter library and registration process. |
| Capability Over-Abstraction | Capabilities become vague labels that cannot be tested. | Require measurable outcome, provider evidence and owner. |
| Capability Over-Fragmentation | Thousands of near-duplicate capabilities make selection impossible. | Interface families, bands and semantic review. |
| Weight-Driven Incoherence | High scores bypass invalid environment/history/progression. | Hard-filter-first evaluation and validators. |
| Hidden Code Constraints | Data appears valid but runtime contains undocumented exceptions. | Require schema/relationship ownership and code-to-contract audit. |
| Fallback Homogenisation | Every seed receives the same emergency provider and loses replayability. | Multiple equivalent provider families and deterministic context-aware repair. |
| Repair Damage | World repair rewrites explored content or player choices. | Repair before play where possible; manifest persistence and explicit upgrade operations later. |
| Completeness Inflation | Contracts become checklists filled with meaningless placeholders. | Evidence requirements, cross-owner review and player-facing acceptance tests. |
| Expansion Coupling | Core content begins requiring optional Set 26 content. | Dependency modes, pack-combination tests and fallback independence. |
| Maritime Hardcoding in Kernel | Set 25 becomes a naval design document and future expansion support remains narrow. | General mobile/spatial/extension contracts only; detailed behaviour stays in Set 26. |
| Performance-Blind Graphs | Semantically complete packages exceed runtime budgets. | Technical facets, LOD/capacity constraints and 25E/Document 18 performance gates. |

## 37.2 Redesign triggers

Revisit 25C when:

- a domain cannot be represented without duplicate field ownership;
- a capability cannot be tested consistently across providers;
- worldgen repair repeatedly overrides player-facing variety;
- optional pack removal cannot preserve or quarantine authoritative state;
- a relationship type requires incompatible meanings in different domains;
- graph queries exceed technical budgets despite indexing;
- persistent mobile/nested structures cannot preserve identity through LOD, transfer or migration;
- Set 26 proves that an existing domain cannot safely represent a maritime concept.

## 37.3 Open decisions for later authority

| Open Decision | Owner | Status |
| --- | --- | --- |
| Exact schema-version numbering and compatibility ranges. | 25D/Document 18 | Pending. |
| Canonical authoring syntax for conditions, queries and cardinality. | 25D | Pending. |
| Numeric suitability normalisation and fixed-point strategy. | Document 18/25E/domain owners | Pending technical design. |
| Initial complete capability library for Core Production. | 25F-25G with main registry owners | Pending classification. |
| Which fallback groups are world-global versus domain-owned. | 25D/25F/Document 18 | Pending. |
| Whether Set 26 requires a dedicated vessel or fleet top-level domain. | 26F/26K with 25B-25C and Ash | Pending evidence; existing domains are default. |
| Exact persistence of full explainability traces in retail saves versus debug manifests. | Document 18/25E | Pending performance/privacy review. |
| Whether player-authored blueprints may declare capabilities directly or only through validated components. | 25D/25K/26I/Forge owners | Pending. |

# Appendix A. Universal Domain Schema Template

| Group | Template Fields |
| --- | --- |
| Identity | definition_id; domain; family; subtype; parent; modules; namespace; source_pack; schema_id; schema_version; aliases. |
| Ownership | canonical_document; canonical_registry; field_ownership_map; extension_permissions. |
| Provenance | source_reference; revision; authoring_record; licence/provenance; supersedes; notes. |
| Planning | production_tier; status; milestone; owner; priority; risk; effort; blockers; evidence. |
| Selection | scope; world/build presets; rarity/density; uniqueness; suitability_profile; exclusions; repetition; candidate_roles. |
| Capabilities | offers; requirements; capacity/band; access; conditions; fallback_groups. |
| Relationships | authored_edges; queries; generated_roles; reverse_expectations; cardinality; scope; temporal mode. |
| Gameplay | world_role; player_interactions; progression; danger; rewards; failure; recovery; alternatives. |
| Physical | block/item/resource/recipe forms; inputs; outputs; drops; costs; storage; salvage; by-products. |
| State | allowed_states; transitions; triggers; persistence; ownership/occupation; evidence; aftermath. |
| Presentation | assets; materials; animation; audio; VFX; icons; map/Codex; sockets/events; accessibility. |
| Technical | runtime_type; service_owner; instance_record; authority; LOD; streaming; save; migration; performance_class. |
| Validation | schema; graph; capability; suitability; completeness; seed; performance; accessibility; representation; migration. |
| Lifecycle | created; revised; frozen; deprecated; replacement; tombstone; archive_reason; release_notes. |

# Appendix B. Relationship-Type Definition Template and Starter Library

## B.1 Template

| Field | Value |
| --- | --- |
| relationship_type_id |  |
| canonical_verb |  |
| description |  |
| source_domains/interfaces |  |
| target_domains/interfaces |  |
| direction/inverse |  |
| default_cardinality |  |
| allowed_scopes |  |
| allowed_strengths |  |
| temporal_modes |  |
| reference_modes |  |
| owner |  |
| cycle_policy |  |
| validation |  |
| save/migration |  |

## B.2 Starter relationship library

| Type | Inverse / Symmetry | Typical Use |
| --- | --- | --- |
| contains | part_of | World/region/biome/site/structure hierarchy. |
| borders | symmetric | Region/biome/territory adjacency. |
| transitions_to | context-sensitive inverse | Biome/state/route transitions. |
| connected_to | symmetric unless ordered subtype | Routes, services, networks and anchors. |
| requires | required_by | Exact intrinsic dependency. |
| supports | supported_by | Functional or production support. |
| provides_capability | capability provider index | Definition to capability. |
| requires_capability | capability requirement | Consumer to capability query. |
| inhabits | habitat_for | Creature/culture to environment/site. |
| nests_in | nest_for | Creature/ecology to nest/site/environment. |
| hunts | prey_of | Predator-prey relationship. |
| feeds_on | food_for | Ecology/production consumption. |
| migrates_to | receives_migration_from | Seasonal/state migration. |
| invades | invaded_by | Invasive ecology/faction pressure. |
| produces | produced_by | Resource/goods/output source. |
| consumes | consumed_by | Settlement/machine/creature demand. |
| trades_with | symmetric or route-mediated | Civilisation/economy exchange. |
| controls | controlled_by | Faction/settlement/site/route/resource control. |
| builds | built_by | Culture/faction/player/project origin. |
| occupies | occupied_by | Runtime mutable occupation. |
| claims | claimed_by | Ownership claim distinct from control. |
| allies_with | symmetric | Political/social alliance. |
| hostile_to | type-declared symmetry | Conflict relation. |
| rivals | symmetric or role record | Competition without universal hostility. |
| fears | feared_by | Directed social/ecological fear. |
| threatens | threatened_by | Pressure/target relation. |
| protects | protected_by | Defence/service/capability relation. |
| guards | guarded_by | Site/route/object protection. |
| teaches | taught_by | Knowledge/recipe/spell capability. |
| unlocks | unlocked_by | Progression access. |
| corrupts | corrupted_by | State/environment transformation. |
| cleanses | cleansed_by | Restoration transformation. |
| transforms_into | transformed_from | Definition/state transition. |
| restored_as | restored_from | Deliberate recovery outcome. |
| evidence_of | evidenced_by | History, rumour, site, relic and state evidence. |
| believes | believed_by | Culture/person belief distinct from objective truth. |
| disputes | disputed_by | Multi-party claim/meaning conflict. |
| remembers | remembered_by | Historical/social memory. |
| spawns_event | spawned_by | Event generation relationship. |
| resolves_event | resolved_by | Event outcome relationship. |
| uses_asset_family | asset family reverse index | Presentation binding. |

# Appendix C. Capability Definition, Provider and Requirement Templates

## C.1 Capability definition

| Field | Value |
| --- | --- |
| capability_id |  |
| owner |  |
| description/testable outcome |  |
| interface family |  |
| band semantics |  |
| capacity units |  |
| compatible substitutions |  |
| allowed scopes |  |
| required evidence |  |
| validation method |  |
| deprecation/migration |  |

## C.2 Provider offer

| Field | Value |
| --- | --- |
| provider_ref |  |
| capability_id |  |
| band/capacity/quality |  |
| access_mode |  |
| scope |  |
| conditions |  |
| costs/maintenance/risk |  |
| persistence |  |
| evidence |  |

## C.3 Requirement

| Field | Value |
| --- | --- |
| consumer_ref/role |  |
| capability_id |  |
| minimum band/capacity |  |
| scope/timing |  |
| access threshold |  |
| substitution policy |  |
| fallback group |  |
| failure severity |  |
| player-facing reason |  |

# Appendix D. Suitability, Exclusion and Selection Template

| Group | Template Fields |
| --- | --- |
| Context | world/realm/region/biome/site/frame; generation version; active packs; world preset; role. |
| Hard Environment | climate; temperature; moisture; altitude/depth; water/salinity; light; geology; slope; volume. |
| Hard System | required capabilities; route/access; history; culture/faction; progression; authority; performance. |
| Exclusions | definitions; tags; states; capabilities; adjacency; radius; uniqueness; pack/profile. |
| Preferences | environment; neighbours; history; ecology; culture; resources; danger; novelty; performance. |
| Density/Repetition | min/max; cooldown; uniqueness scope; clustering; separation. |
| Determinism | candidate query; stable sort; named sub-seed; algorithm version; tie-break. |
| Output | selected definition; variants/modules; generated bindings; rejected reasons; score components; fallback/repair. |

# Appendix E. Fallback Group and Deterministic Repair Template

| Field | Value |
| --- | --- |
| fallback_group_id |  |
| owner |  |
| required capability |  |
| scope/timing |  |
| provider queries |  |
| minimum providers |  |
| access threshold |  |
| ordered repair methods |  |
| forbidden repairs |  |
| deterministic key |  |
| manifest/save evidence |  |
| user/debug feedback |  |
| validation presets/seeds |  |
| migration/removal policy |  |

# Appendix F. Universal and Domain Completeness Checklist

## F.1 Universal

- [ ] Stable identity, schema, owner, namespace and source pack.
- [ ] Clear world role and player-facing purpose.
- [ ] Registered relationships with cardinality, scope and ownership.
- [ ] Capability offers and requirements with access and fallback.
- [ ] Suitability, hard constraints, exclusions and deterministic selection.
- [ ] Real physical inputs, outputs and dependencies where applicable.
- [ ] Player interactions, alternatives, failure and recovery.
- [ ] Dynamic states, transitions, persistence and aftermath.
- [ ] Presentation, readability and accessibility.
- [ ] Runtime owner, authority, LOD, save, migration and budget.
- [ ] Automated and human validation evidence.
- [ ] Production tier, status, blockers, deferrals and approval.

## F.2 Domain additions

- [ ] World/biome: topology, transitions, ecology, resources, civilisation, hazards, traversal and seed tests.
- [ ] Realm: laws, multiple environments, access/return, resources, society/ecology, adventure and persistence.
- [ ] Culture/settlement: separated identity layers, needs, production, architecture, relations, growth and representation.
- [ ] Creature/ecology: habitat, food web, population/source, behaviour, drops, pressure, counterplay and LOD.
- [ ] Site/dungeon: origin, access/return, grammar, occupants, hazards, rewards, states, outcomes and reoccupation.
- [ ] Boss/threat: territory, discovery, preparation, encounter role, alternatives, reward and aftermath.
- [ ] Structure/route: physical build, services, inputs/outputs, network, permissions, damage/repair and save.
- [ ] Resource/loot: source, extraction, transformation, sinks, trade, provenance, state and recovery.
- [ ] Event/arc: context, participants, conditions, branches, capability fallbacks, evidence, aftermath and persistence.
- [ ] Mobile construct: frame, blueprint/instance, components, transfer, authority, LOD, save and recovery.

# Appendix G. Set 26 Compatibility Mapping and Admission Questions

Before a Set 26 schema or top-level domain is frozen, its owner must answer:

1. Which existing domain/interface cannot represent the concept safely?
2. Is the record an immutable definition, generated binding, persistent instance, runtime state or historical record?
3. Which fields belong to Atlas context, gameplay behaviour, Forge presentation and technical runtime?
4. Which base definitions receive extension facets?
5. Which capabilities are provided or required, and how are they tested?
6. Which relationships, scopes and cardinalities are required?
7. What hard environmental/spatial constraints and exclusions apply?
8. What is the fallback when maritime content is absent, disabled, inaccessible or removed?
9. Does the record require a mobile spatial frame or container-local references?
10. How does LOD preserve identity, resource conservation, crew/cargo state and authority?
11. What saves, migrations, quarantine and reactivation are required?
12. Which main documents and registries must be amended after the Set 26 contract is approved?

# Appendix H. Document 25C Acceptance Criteria

| Acceptance Area | Pass Condition |
| --- | --- |
| Kernel Compatibility | Uses 25B IDs, namespaces, domains, facets, instances and spatial frames without contradiction. |
| Schema Contract | Defines registration, field groups, ownership, inheritance, extension and versioning. |
| Relationship Graph | Defines node/edge classes, type registration, direction, inverse, cardinality, scope, strength, time and reference modes. |
| Capabilities | Defines testable capability identities, offers, requirements, bands, access and provider resolution. |
| Suitability | Hard constraints, preferences, exclusions, deterministic candidate selection and explainability are explicit. |
| Fallbacks | Capability-equivalent provider and repair groups prevent hardcoded named progression. |
| Completeness | Universal and domain package contracts cover physical, gameplay, state, presentation, technical and validation requirements. |
| Expansion Support | Set 26 is supported through general extension contracts without importing maritime design into Set 25. |
| POC Retirement | No fallback, example or guarantee depends on retired POC identities or fixed arrangements. |
| Handoff Readiness | 25D, 25E, 25F-25G, Set 26 and Document 18 receive actionable contracts and open decisions. |
| Human Authority | Working locks and unresolved domain/technical decisions remain visible for Ash's approval. |

**End of Document 25C - Domain Schemas, Relationship Graph, Capabilities, Suitability, Fallbacks and Completeness Contracts v0.1**
