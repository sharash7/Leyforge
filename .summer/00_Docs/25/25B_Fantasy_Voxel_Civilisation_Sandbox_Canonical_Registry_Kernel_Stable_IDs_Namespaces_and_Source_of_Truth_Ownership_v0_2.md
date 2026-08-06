# FANTASY VOXEL CIVILISATION SANDBOX

## DOCUMENT SET 25

# 25B - Canonical Registry Kernel, Stable IDs, Namespaces and Source-of-Truth Ownership

*Version 0.2 - Maritime Compatibility Amendment Draft*

A canonical identity and ownership contract for every Atlas, gameplay, technical, presentation and approved expansion definition, establishing qualified IDs, namespace authority, field-level source-of-truth rules, generated-instance and spatial-frame separation, optional-package compatibility and the registry foundation required by Godot/Summer Engine production.

**Project Lead and Final Authority: Ash**

Architecture, systems planning, documentation and production support: GPT-5.6 Thinking

---

> **Canonical Registry Kernel Statement**
>
> Leyforge content must have one stable machine identity independent of display name, file path, current owner, world location, runtime state, production status, presentation asset, installed expansion set, or current spatial frame. Every definition is resolved through a registered namespace and domain, assembled from fields with one canonical owner, linked through qualified IDs, and separated from generated instances, local-space bindings and mutable save records. No production system or expansion may create a second editable truth for the same field.

| Field | Locked Direction |
| --- | --- |
| Document Scope | Canonical registry terminology, universal definition envelope, qualified stable-ID grammar, namespaces, domain prefixes, identity allocation, aliases, localisation keys, definition facets, runtime identifiers, field-level source-of-truth ownership, registry-service boundaries, legacy conversion and identity acceptance criteria. |
| Primary Authority | Document 24L is the integration and registry-roadmap authority. Document 24A owns Atlas topology and procedural-content foundations. Document 24C owns ocean, coast, island, underwater and marine-environment context. Document 25A v0.2 owns governance, POC retirement, major-expansion admission and approval control. |
| Canonical ID | The globally stored definition ID is a lowercase qualified path: <namespace>.<domain>.<identity_path>. Example: leyforge.core.block.terrain.stone. |
| Namespace Direction | Namespaces identify stable creation authority, not file layout. Official production content begins in leyforge.core. Archive, test and development namespaces are isolated from production selection. |
| Ownership Direction | One logical definition may be assembled from multiple owned facets, but every field path has one canonical owner. Mirrors are references, generated outputs, read-only snapshots or prose summaries - never competing editable truth. |
| Runtime Direction | Authored definitions are immutable at runtime. Generated bindings, persistent instances, mobile spatial containers and container-local records use separate world/save identities. Engine nodes, scene-tree paths and derived world transforms are never persistent identity. |
| Engine Direction | The contract is engine-neutral and targets Godot/Summer Engine. Typed Godot Resources or validated external records will be generated later from this kernel; this document does not lock file formats or implementation classes. |
| POC Direction | POC identities are moved to leyforge.archive.poc or synthetic test namespaces and are prohibited from normal production manifests, generation pools and capability fallbacks. |
| Implementation Boundary | This document defines universal identity, ownership, extension and spatial-reference contracts. Detailed relationships, capabilities, suitability and fallback semantics belong to 25C; packs, optional dependencies and migrations belong to 25D; validation tooling belongs to 25E; runtime implementation belongs to the rewritten Document 18. Detailed maritime records and behaviour remain owned by Document Set 26. |
| Approved Expansion Direction | Document Set 26 - Oceans, Maritime Civilisation, Vessels and Naval Systems Expansion - is the first major extension case. It consumes this kernel and may add approved schemas, domains and facets without creating a parallel registry authority. |
| Expansion Compatibility | Major expansions declare owned namespaces, extension schemas, required/optional dependencies, save behaviour and validation profiles. Base content cannot silently depend on an absent optional expansion. |
| Spatial Identity Direction | Persistent mobile structures use a container/spatial-frame identity. Child blocks, components, sockets, inventories and actors use container-local references; world-space transforms are derived runtime views. |
| Next Deliverable | 25C - Domain Schemas, Relationship Graph, Capabilities, Suitability, Fallbacks and Completeness Contracts, including general extension and spatial-reference schema contracts. |

# Revision History

| Version | Status | Summary |
| --- | --- | --- |
| 0.1 | Registry Identity Foundation Draft | Established the original qualified-ID grammar, namespace model, domain registry, definition facets, runtime identity classes, field-level source-of-truth ownership, POC isolation and legacy-conversion plan. |
| 0.2 | Maritime Compatibility Amendment Draft | Formally recognises Document Set 26 as a separate major expansion; adds general expansion-domain admission, schema-keyed extension facets, optional-package identity rules, local-space/world-space reference contracts, persistent mobile-container identity, LOD/authority hooks, expansion save/removal safeguards and cross-pack validation. No maritime gameplay behaviour or full maritime registry is designed here. |

# Document Purpose

Document 25B creates the canonical identity layer required before the Atlas can be converted into Blocks, Items, Recipes, Godot Resources, Forge manifests, generated worlds or persistent saves. It resolves the project-wide ambiguity between display names, short registry IDs, pack namespaces, definition records, generated instances, spatial containers and runtime state. It also establishes how the Atlas, gameplay documents and approved expansion sets can contribute different fields to one logical definition without duplicating editable truth.

This document does not enumerate the Core Production roster, define every domain-specific schema, select exact block or item families, define content-pack load order, write migration scripts, implement the registry service, or design water physics, vessels, crews, fleets or naval combat. It defines the stable contracts those later tasks must obey. The rules become the active Set 25 v0.2 working baseline when Ash approves this document; later changes require the decision, amendment and migration controls established in 25A v0.2.

# Design Sources and Supersession Rules

| Source | Authority Used by 25B |
| --- | --- |
| 24A - Atlas Foundations | Stable namespaced IDs, generated-name separation, derived seed inputs, aliases, content hashes, save-safe runtime records, parent families and the rule that every field has one authoritative owner. |
| 24L - Registry and Production Roadmap | Registry domains, canonical prefixes, ID grammar direction, definitions versus instances and states, universal metadata, pack namespace ownership, aliases, localisation, lifecycle and Registry Service responsibilities. |
| 25A v0.2 - Production Governance | POC isolation, source-of-truth governance, approval authority, evidence-based status, major-expansion admission, parallel-development control, supersession and the requirement that 25B stabilise before registry-heavy Set 26 work is finalised. |
| 03-06 - Physical Registries | Retain the useful separation between Blocks, Items and Recipes, parent definitions, inherited families and cross-registry references. Existing short IDs and POC planning fields are legacy inputs, not the final qualified-ID authority. |
| 07-17 - Gameplay Systems | Provide domain ownership boundaries for NPCs, settlements, automation, magic, creatures, worldgen, structures, cultures, realms, events, combat and UI. |
| 18 - Technical Plan v0.1 | Retain definitions versus runtime records, immutable definition data, stable references, one owner for mutable truth, authoritative commands and save-safe records. Unreal-specific classes and module assumptions are not retained. |
| Forge and Presentation Sets | Retain asset-source and authoring ownership. Presentation assets reference gameplay definitions but do not own gameplay identity or behaviour. Vessel Forge and vessel-blueprint authoring remain future Set 26 extensions of the established Forge architecture. |
| Approved Document Set 26 Direction | Establishes a separate Oceans, Maritime Civilisation, Vessels and Naval Systems Expansion depending on the Atlas, Set 25 kernel/governance, Forge and existing gameplay documents. 25B provides compatibility and extension rules only; 26A-26O retain detailed maritime authority. |

> **Supersession Rule**
>
> Legacy short IDs such as block.terrain.stone, terrain.stone.basic or item.material.iron_ingot may be used as migration inputs, but new production data must store the fully qualified ID. Display names, filenames, spreadsheet row numbers, engine resource paths and runtime state suffixes are not stable IDs.

# Static Table of Contents

- 1. Locked Registry Kernel Identity
- 2. Source-Derived Direction and Recommendation Boundary
- 3. Scope, Non-Goals and Handoff Boundaries
- 4. Canonical Registry Terminology
- 5. Registry Domain Architecture
- 6. Universal Definition Envelope
- 7. Stable Identity Principles
- 8. Canonical Qualified-ID Grammar
- 9. Token, Path and Naming Rules
- 10. Namespace Model and Ownership
- 11. Domain Prefix Registry
- 12. ID Allocation, Reservation and Collision Handling
- 13. Display Names, Generated Names and Localisation Keys
- 14. Aliases, Deprecation, Replacement and Tombstones
- 15. Parent Definitions, Families, Modules and Variants
- 16. Definition Facets and Compiled Records
- 17. Definitions, Generated Bindings, Instances and Runtime States
- 18. Persistent Runtime Identifier Classes
- 19. Source-of-Truth Ownership Model
- 20. Field-Level Ownership and Permitted Copy Types
- 21. Atlas-to-Gameplay Ownership Matrix
- 22. Main-Document and Registry Ownership Matrix
- 23. Cross-Domain Reference Identity Contract
- 24. Definition Immutability, Versions, Hashes and Revisions
- 25. Content-Pack and Namespace Boundary
- 26. Authoring Sources, Generated Outputs and Registry Service Boundary
- 27. Save, World Manifest and Migration Identity Contract
- 28. Determinism and Generated-Identity Contract
- 29. Multiplayer and Authority Identity Contract
- 30. Planning Metadata and Shipped-Data Separation
- 31. POC Archive, Test, Development and Production Namespace Rules
- 32. Identity Validation and Failure Behaviour
- 33. Adoption and Legacy-ID Conversion Plan
- 34. Decisions Locked by 25B and Handoff to 25C
- Appendix A. Canonical ID Pattern Reference
- Appendix B. Reserved Namespace and Domain Register
- Appendix C. Universal Definition Envelope Template
- Appendix D. Field Ownership Declaration Template
- Appendix E. Legacy Conversion Examples
- Appendix F. Anti-Patterns and Rejection Examples
- Appendix G. Document 25B Acceptance Criteria
- Appendix H. Major Expansion Extension Contract Template
# 1. Locked Registry Kernel Identity

The Registry Kernel is Leyforge's universal identity and ownership layer. It allows specialised Atlas, gameplay, technical and presentation documents to remain separate while resolving their contributions into one coherent graph of definitions. The kernel is deliberately smaller than any domain schema: it owns the fields every definition needs before domain-specific behaviour is added.

> **Locked Rule**
>
> One game concept has one stable qualified identity. Different documents may own different facets of that identity, but they may not create parallel competing definitions merely because they describe the concept from different perspectives.

| Identity Layer | Meaning | Production Result |
| --- | --- | --- |
| Qualified Definition Identity | Stable content identity shared across Atlas, gameplay, presentation and saves. | Cross-system links survive renames, file moves and asset reorganisation. |
| Namespace Authority | Declares who may create base definitions in an identity space. | Core, expansion, mod, archive and test content cannot collide silently. |
| Domain Contract | Declares what kind of definition an ID represents and which schema/owner controls it. | A biome cannot be loaded as an item or silently redefined by another registry. |
| Owned Facets | Different field groups are authored by their canonical documents and assembled together. | Atlas context and executable behaviour connect without duplicate editable truth. |
| Generated Binding | A seed or simulation binds authored definitions to specific world instances. | Each world can differ while retaining explainable provenance and deterministic relationships. |
| Persistent Runtime Identity | Mutable people, settlements, sites, items and events have save-scoped IDs separate from definitions. | State changes do not mutate content identity or break other worlds. |
| Compatibility Identity | Aliases, hashes, versions and tombstones preserve meaning across updates. | Saves fail visibly or migrate deliberately rather than silently losing content. |

# 2. Source-Derived Direction and Recommendation Boundary

Documents 24A and 24L already lock the need for stable namespaced IDs, lowercase hierarchical paths, aliases, localisation separation, immutable definitions, generated instances, runtime states, content-pack ownership and one authoritative field owner. Document 25B formalises those principles into an exact project-wide contract.

| Classification | Treatment in 25B |
| --- | --- |
| Locked Project Direction | POC retirement, deterministic seed generation, Godot/Summer Engine, stable IDs, content packs, save safety and human approval are applied directly. |
| Atlas Authority | The 24L domain taxonomy and all-period hierarchical ID direction are retained and expanded only where main gameplay documents require missing domains. |
| Engine-Neutral Technical Principle | Immutable definitions, separate runtime records, authoritative mutable owners and reference-by-ID are retained from Document 18. |
| 25B Canonical Resolution | The exact qualified-ID pattern, namespace reservations, field-facet assembly model, extension-facet mechanism, spatial-reference classes and ID-freeze point are operational resolutions made necessary by the source documents. |
| Newly Approved Set 26 Direction | Set 26 is a separate approved maritime/naval expansion and must consume the Set 25 production spine. | Treated as locked programme direction; detailed maritime concepts, records and behaviour remain unapproved until their owning Set 26 documents are reviewed. |
| 25B v0.2 Integration Conclusion | The existing kernel supports Set 26 in principle but requires explicit extension-domain admission, optional-dependency, local-space/world-space, mobile-container, save-removal and authority/LOD contracts. | Added as general-purpose rules suitable for future expansions, using Set 26 only as the first validation case. |
| Deferred Implementation | File formats, Godot class names, database layout, import CLI, binary ID compression and migration-script implementation are intentionally deferred. |

# 3. Scope, Non-Goals and Handoff Boundaries

| 25B Owns | 25B Does Not Own |
| --- | --- |
| Universal definition identity and terminology. | Domain-specific gameplay fields or balance values. |
| Qualified ID grammar and namespace rules. | Relationship verbs, capability semantics or suitability scoring beyond identity references. |
| Domain prefix registration and owner mapping. | Final Core Production content selection. |
| Definition facets and field-owner declaration. | Content-pack dependency/load-order mechanics in full detail. |
| Definition versus instance/state separation. | Godot Resource classes, database tables or editor UI. |
| Alias, tombstone and ID-revision policy. | Migration scripts and removed-content recovery implementation. |
| Identity-level validation and failure severity. | Full seed, progression, performance or accessibility validation. |
| General expansion-domain and schema-extension admission rules. | Detailed vessel, fluid, wave, tide, current, storm, port, fleet, cargo, crew or naval schemas. |
| Persistent spatial-frame and container-local reference identity. | Buoyancy, vessel physics, moving-interior implementation or naval authority algorithms. |

Document 25C consumes the identities, extension points, spatial-reference classes and ownership boundaries defined here, then adds typed relationships, cardinality, capabilities, suitability, exclusions, fallback groups and completeness contracts. 25D adds pack manifests, authoring formats, required/optional dependency modes, import/export, removal recovery and migration packaging. 25E turns the contracts into validators and release gates. Set 26 consumes these contracts and defines maritime-specific schemas and behaviour in its own documents.

# 4. Canonical Registry Terminology

| Term | Canonical Meaning |
| --- | --- |
| Definition | An authored, versioned, runtime-immutable content record identified by a qualified stable ID. |
| Qualified ID | The globally unique lowercase identity path: namespace + domain + identity path. |
| Namespace | The stable authority prefix that owns creation of base identities, such as leyforge.core. |
| Domain | The first token after the namespace that selects the canonical schema family, such as biome, creature, block or recipe. |
| Identity Path | The domain-local hierarchy that distinguishes family and entry, such as terrain.stone. |
| Facet | A field group attached to a definition and owned by one source document or registry, such as atlas_context or combat. |
| Compiled Definition | The validated read-only result created by assembling the identity envelope and all permitted facets. |
| Parent Definition | An abstract or selectable definition supplying shared defaults and validation rules. |
| Module | A reusable composable definition with explicit compatibility and ownership. |
| Variant Profile | A reusable modifier for regional, cultural, material, seasonal, difficulty, realm or state variation. |
| Generated Binding | A seed-selected relationship between definitions or instances stored in the world manifest or save. |
| Persistent Instance | A world/save-specific person, settlement, site, object, route, event or group with its own runtime ID. |
| Runtime State | Mutable values owned by the authoritative runtime service for a persistent instance. |
| Historical Record | Append-only or migrated evidence explaining past ownership, damage, discovery, transformation or events. |
| Alias | A versioned mapping from an old qualified ID to its current target. |
| Tombstone | A resolvable record stating that an ID no longer has an active definition and how references must be handled. |
| Localisation Key | A stable key resolving player-facing text; it is not the definition identity. |
| Source Pack | The package currently shipping the definition; it may change without changing identity when namespace ownership remains valid. |
| Extension Domain Declaration | A registered request by an approved owner to add a new top-level domain because existing domains cannot represent the concept safely. |
| Extension Facet | A schema-keyed field group attached to an existing definition by an authorised pack without changing the base identity or overwriting another owner. |
| Dependency Mode | The declared relationship between packs or records: required, optional, build-profile-required, soft/query-only or incompatible. Exact semantics are completed by 25D. |
| Spatial Frame | A persistent coordinate frame owned by a world root or mobile/nested container instance. |
| Spatial Anchor | A stable point, socket, compartment, cell, local coordinate or semantic marker inside a spatial frame. |
| Container-Local Record | Persistent state addressed relative to a container/spatial frame rather than by derived world coordinates. |
| Quarantined Record | Preserved but non-executing save data whose owning optional expansion or schema is unavailable; recovery behaviour is controlled by 25D and Document 18. |

# 5. Registry Domain Architecture

Leyforge uses domain registries rather than one monolithic file. Every domain implements the same identity envelope, but its executable fields remain in the appropriate gameplay, Atlas, presentation and technical facets. The Domain Registry is itself canonical data: a new top-level prefix cannot be invented inside an individual spreadsheet or code file.

| Domain Group | Representative Prefixes | Primary Meaning |
| --- | --- | --- |
| World and Environment | world, region, biome, env, overlay, fluid, weather | World profiles, regions, biomes, special environmental layers, liquids and reusable weather/environment profiles. |
| Realm and Routes | realm, portal, route | Persistent realms, portal families and route definitions. |
| Civilisation | ancestry, culture, lang, faith, gov, faction, settlement, npc, job | Personhood and social identity, organisations, settlements and NPC templates. |
| Ecology | creature, ecology, nest, disease | Creature families, ecological profiles, nests, migrations and disease definitions. |
| Adventure and Threat | site, room, hazard, puzzle, boss, siege, titan | Dungeons, ruins, modules, encounter hazards and major threats. |
| Built World | structure, landmark, wonder, service, project, blueprint, component_role | Structures, infrastructure, services, construction/project definitions, reusable blueprints and semantic component roles. |
| Material and Economy | res, material, loot, relic, goods, market | World resources, transformable materials, reward grammars, goods and market profiles. |
| Physical Gameplay | block, item, recipe, machine, power, spell, ritual, vehicle | Executable blocks, inventory objects, transformations, machines, energy, magic and general mobile-construct definitions. A specialised expansion may request a narrower domain when justified. |
| Narrative and State | history, arc, quest, event, rumour, state, aftermath, dialogue | History foundations, runtime-facing narrative definitions, state profiles and aftermath. |
| Combat and Effects | action, damage, status, effect | Reusable actions, damage/status definitions and gameplay effects. |
| Presentation | asset, material_set, anim, vfx, sfx, icon, map_symbol, ui | Asset families, animation/effect bindings, icons and UI definition data. |
| Kernel and Tooling | schema, tag, capability, relationship, interface, extension, spatial_profile, authority_profile, lod_profile, migration, test_fixture | Protected system definitions used by registries, extension contracts, spatial/authority profiles, validators and migrations. |

Some domains may later split into specialised schemas, but their top-level identity remains stable. Subschema selection belongs in schema metadata, not in an unregistered replacement prefix.

## 5.1 Expansion Domain Admission

An approved expansion may use existing domains, define specialised schemas beneath them, or request a new top-level domain. A new domain is not created merely because an expansion has a large feature list. The request must demonstrate that existing domains would collapse distinct identity, ownership or validation semantics.

| Admission Field | Requirement |
| --- | --- |
| Proposed Domain | Singular stable token, purpose and examples; no version, pack or feature-state suffix. |
| Namespace/Owner | Approved namespace owner, identity owner, canonical document and responsible review role. |
| Existing-Domain Analysis | Explanation of why biome, structure, vehicle, route, job, faction, project, state or another current domain is insufficient. |
| Schema and Interfaces | Proposed schema ID, parent interfaces, reference classes and extension-facet boundaries. |
| Pack Behaviour | Required/optional dependency mode, absence/removal behaviour and whether the domain can appear in base saves. |
| Migration | Alias, deprecation, supersession, tombstone and removed-pack recovery expectations. |
| Validation | Collision, ownership, hard-reference, save, spatial, LOD and multiplayer checks required before admission. |
| Approval | 25A decision record plus 25C schema and 25D pack admission; no domain is activated by prose alone. |

Set 26 is the first practical test. Candidate maritime records may map to existing domains or justify extension domains, but 25B does not decide the final mapping. That decision belongs to 25C with 26A, 26B, 26F, 26N and 26O inputs.

# 6. Universal Definition Envelope

Every definition must contain the following identity envelope before it can advance to Data Ready. Domain facets may add fields, but they cannot remove or reinterpret the envelope.

| Field Group | Core Fields | Rule |
| --- | --- | --- |
| Identity | definition_id, namespace, domain, identity_path, schema_id, schema_version | Required and validated before any cross-reference is accepted. |
| Ownership | identity_owner, canonical_document, source_pack, namespace_owner, facet_owners | Identifies who may create the identity and who owns each field group. |
| Presentation Keys | display_name_key, description_key, optional codex/map keys | Text is resolved separately and may vary without changing identity. |
| Structure | parent_id, family_id, module_refs, variant_profiles | Optional by domain; all references are qualified and cycle-validated. |
| Compatibility | aliases, deprecated_since, replacement_id, tombstone_policy | Required when identity changes or content is removed after freeze. |
| Provenance | created_version, revised_version, source_refs, definition_revision, content_hash | Supports audit, reproducibility and migration. |
| Planning | production_status, production_tier, milestone, priority, risk, review_owner | Canonical planning truth; excluded from retail runtime unless needed. |
| Validation | required_suites, last_validated_build, validation_profile | Evidence reference, not a substitute for validator output. |
| Extension Interfaces | interface_ids, extension_facets, dependency_refs, spatial_profile_id, authority_profile_id, lod_profile_id | Optional and schema-declared. Arbitrary unknown root fields are prohibited. |

## 6.1 Derived Fields

- namespace, domain and identity_path are parsed from definition_id and must match any explicitly stored convenience fields.
- content_hash is generated from canonical compiled data, not hand-authored.
- reverse references and search indexes are generated outputs, not editable fields in the source definition.
- display text is loaded from localisation bundles; the definition stores keys and optional generated-name rules only.
- runtime class/resource bindings are supplied by the technical facet and generated toolchain, not guessed from filename.
- extension_facets are keyed by qualified extension-schema IDs and compiled only when their declaring pack and schema are available.
- world transforms for container-local records are derived from the authoritative spatial frame and local transform; they are not independently authored identity fields.

## 6.2 Forward-Compatible Extension Envelope

The kernel allows expansion data through declared extension facets rather than a free-form property bag. Each extension facet identifies its schema, owner, source pack, dependency mode and compatibility version. Unknown extension fields cannot execute silently. Tooling may preserve an unavailable optional facet as opaque quarantined data for round-trip recovery only when 25D and the rewritten Document 18 explicitly permit it.

> **Extension Rule**
>
> An expansion may add a new owned facet, schema, definition or relationship, but it may not overwrite a base field, infer ownership from load order, or depend on the runtime ignoring unknown authoritative data.

# 7. Stable Identity Principles

1. Identity represents what a definition is, not where its file currently lives.
2. Identity does not include display name, translation, culture-specific title, current owner, world location, rarity, production status, platform or runtime state.
3. A presentation rename never changes the definition ID.
4. A balance adjustment, asset replacement or file move normally keeps the same ID.
5. A change that creates a materially different concept receives a new ID and an explicit relationship or migration from the old concept.
6. IDs are human-readable semantic paths, but their tokens are chosen for stability rather than prose elegance.
7. Persistent records store only qualified IDs. Short IDs may be accepted by authoring tools only when the namespace context is explicit and compilation resolves them unambiguously.
8. No released or save-referenced ID is reused for a different concept, even after removal.
9. Generated names and player labels are runtime data and never become definition identity.
10. The Registry Service is the only runtime authority that resolves aliases, parents and compiled definitions.
11. Installing or removing an optional expansion does not change the identity of unaffected base definitions.
12. A persistent mobile container keeps its instance identity while moving; world coordinates and scene parenting may change without identity migration.
13. Container-local child identity is stable within its declared frame and must not be reconstructed from a transient world transform alone.
14. Extension facets are addressed by qualified schema IDs and declared owners, never by anonymous dictionaries or load-order conventions.

# 8. Canonical Qualified-ID Grammar

> **Canonical Format**
>
> <namespace>.<domain>.<identity_path>

The qualified ID is a single lowercase ASCII path. The namespace may contain multiple tokens. The Domain Registry and namespace manifest determine where the namespace ends; the next token is the registered domain. Production tools resolve the longest declared namespace prefix, then validate the domain and remaining identity path.

| Component | Pattern | Example |
| --- | --- | --- |
| Namespace | Two or more lowercase tokens owned by a manifest. | leyforge.core |
| Domain | One registered singular prefix. | block |
| Identity Path | One or more stable hierarchy tokens. | terrain.stone |
| Qualified ID | Namespace + domain + identity path. | leyforge.core.block.terrain.stone |
| Local Authoring ID | Domain + identity path; permitted only inside an explicit namespace context. | block.terrain.stone |
| Localisation Key | Namespace + loc + domain/path + field. | leyforge.core.loc.block.terrain.stone.name |

## 8.1 Illustrative Qualified IDs

| Domain | Illustrative ID | Meaning |
| --- | --- | --- |
| Biome | leyforge.core.biome.surface.temperate_meadow | A reusable authored surface-biome definition. |
| Creature | leyforge.core.creature.verdant_covenant.predator.thornmane | A realm-scoped creature definition. |
| Block | leyforge.core.block.terrain.stone | A placeable world block definition. |
| Item | leyforge.core.item.material.iron_ingot | An inventory-facing material definition. |
| Recipe | leyforge.core.recipe.smelting.iron_ingot | A transformation definition. |
| Culture | leyforge.core.culture.riverward | A culture definition independent of ancestry. |
| State | leyforge.core.state.structure.occupied | A reusable state profile, not a mutated structure ID. |
| Blueprint | leyforge.core.blueprint.structure.bridge_modular | A reusable authored blueprint identity separate from any built instance. |
| Vehicle | leyforge.core.vehicle.mobile_construct.cart | A general mobile construct definition; a specialised expansion may admit a narrower domain. |
| Spatial Profile | leyforge.system.spatial_profile.mobile_voxel_container | A protected interface/profile definition for local-space persistence. |
| Expansion Pattern | leyforge.expansion.<approved_name>.<domain>.<identity_path> | Structural pattern only; the Set 26 namespace token and detailed maritime domains are not locked by this example. |
| Archive | leyforge.archive.poc.structure.watchtower | A retired POC identity resolvable only in archive/test contexts. |

Examples are structural illustrations only. They do not classify the named concepts as Core Production content.

# 9. Token, Path and Naming Rules

| Rule | Requirement |
| --- | --- |
| Character Set | ASCII lowercase letters a-z, digits 0-9 and underscore inside tokens; period separates tokens. |
| Token Start | A token begins with a letter. Digits may follow. |
| Underscores | Use single underscores for multiword tokens. No leading, trailing or repeated underscores. |
| Length | Recommended maximum 48 characters per token and 192 characters per qualified ID. The rewritten Document 18 may tighten but not silently broaden these limits. |
| Hierarchy | Use the minimum stable hierarchy needed for clarity. Excessive folder-like depth is rejected. |
| Singular Domain | Top-level domain prefixes are singular and registered. |
| No Version Tokens | Do not add v2, final, new, remake, alpha, beta or release names to identity. Versions live in metadata. |
| No State Tokens | Do not append active, damaged, owned, discovered, winter or corrupted unless the entry is a true authored definition rather than mutable state/profile composition. |
| No Location Tokens | Do not encode generated coordinates, seed values or current settlement ownership in definition IDs. |
| No Presentation Tokens | Do not encode colour, icon border or asset-file format unless it is a genuine reusable presentation definition. |
| Numbers | Numbers are allowed only when canonically meaningful, not as collision-avoidance suffixes such as creature_wolf_2. |
| Reserved Work Tokens | temp, todo, copy, draft and unnamed are prohibited in production namespaces. |

# 10. Namespace Model and Ownership

A namespace is the stable identity authority, not necessarily a single content pack. Packs may be reorganised while definitions keep their IDs, provided namespace ownership remains valid and the world manifest records the new pack versions and hashes.

| Namespace | Purpose | Production Eligibility |
| --- | --- | --- |
| leyforge.core | Official base-game identities intended for production classification. | Eligible when production tier/status and package contracts pass. |
| leyforge.system | Protected schemas, domain declarations, tags, capabilities, relationship types and kernel records. | Always required; not selected as ordinary world content. |
| leyforge.presentation | Official shared asset, animation, audio, VFX, icon and UI families. | Presentation-only unless a gameplay definition references them. |
| leyforge.expansion.<name> | Official expansion identities and authorised extension facets that remain stable even when distributed across several packs. | Eligible only when the expansion namespace and relevant manifests are admitted for the active build/world profile. |
| leyforge.archive.poc | Retired proof-of-concept identities and migration tombstones. | Never eligible for normal production generation. |
| leyforge.test | Synthetic automated-test identities and fixtures. | Test profiles only. |
| leyforge.dev | Temporary developer experiments and spikes. | Development builds only; references block release. |
| <publisher>.<pack> | External mod or partner namespace. | Only through validated manifests and approved extension boundaries. |

## 10.1 Namespace Ownership Rules

- Only the registered namespace owner may create base identities inside that namespace.
- A content pack declares every namespace it owns or extends. Undeclared creation is an error.
- External packs may not use a leyforge.* namespace unless explicitly authorised and signed as an official pack.
- Extension packs reference existing qualified IDs and may attach only declared extension facets or variants. Silent replacement is prohibited.
- Moving a definition to another source pack does not change its ID when the namespace owner remains the same.
- Moving a definition to a different namespace is an identity migration requiring alias, manifest and save treatment.
- Namespace names are never inferred from folder paths or repository names.

## 10.2 Official Major Expansion Namespace Admission

Programme approval does not automatically choose a shipping namespace, pack topology or installation model. Before an official expansion namespace is frozen, 25D and the owning expansion documents must record its token, owner, source packs, dependency modes, extension permissions, removal/recovery behaviour and compatibility policy.

- An expansion may own new base identities inside its namespace.
- It may extend a core identity only through a declared extension facet or patch contract.
- A core definition keeps its core ID when an expansion adds optional behaviour.
- A concept that exists only because the expansion is installed receives an expansion-owned ID.
- Base production content may not hold a hard reference to optional expansion content unless the build profile explicitly promotes that expansion to required.
- Set 26 is approved as a programme, but its final namespace token and package topology remain pending 25D/26A decisions.

# 11. Domain Prefix Registry

The following prefixes are reserved as the initial registry-domain vocabulary. 25C and later domain schemas may add subtypes, but new top-level prefixes require a recorded architecture decision because they affect all validators, packs, saves and tooling.

| Prefix Group | Reserved Prefixes | Canonical Owner |
| --- | --- | --- |
| World | world, region, biome, env, overlay, fluid, weather | 24A-24C and replacement Document 11 for executable worldgen/environment facets; detailed fluid/weather behaviour may be extended by Set 26. |
| Realm/Route | realm, portal, route | 24D and Document 14; route gameplay may extend through Structures/Automation. |
| Civilisation | ancestry, culture, lang, faith, gov, faction, settlement, npc, job | 24E, Documents 07 and 13, and later settlement documents. |
| Ecology | creature, ecology, nest, disease | 24F and Document 10. |
| Adventure | site, room, hazard, puzzle, boss, siege, titan | 24G-24H with Documents 12 and 16 for executable encounter facets. |
| Built World | structure, landmark, wonder, service, project, blueprint, component_role | 24I, Document 12 and settlement/Forge/blueprint systems. |
| Materials/Economy | res, material, loot, relic, goods, market | 24J with Documents 03-06 and economy-facing systems. |
| Physical Gameplay | block, item, recipe, machine, power, spell, ritual, vehicle | Documents 03-09, relevant transport owners and approved expansion schemas. |
| Narrative/State | history, arc, quest, event, rumour, state, aftermath, dialogue | 24K and Document 15; state owners remain domain-specific at runtime. |
| Combat/Effect | action, damage, status, effect | Document 16 and relevant gameplay systems. |
| Presentation | asset, material_set, anim, vfx, sfx, icon, map_symbol, ui | Forge, Audio/VFX and Document 17. |
| Kernel | schema, tag, capability, relationship, interface, extension, spatial_profile, authority_profile, lod_profile, migration, test_fixture | Document Set 25 and rewritten Document 18. |

## 11.1 Set 26 Compatibility Mapping - Non-Binding

The following table confirms that the kernel can identify expected maritime concepts without defining their detailed fields or behaviour. Final domain choices remain owned by 25C and Set 26.

| Expected Set 26 Record | Kernel-Compatible Direction | Final Owning Decision |
| --- | --- | --- |
| Ocean, sea, coast, island and underwater regions | Existing world, region, biome, env and overlay domains. | 24C, replacement Document 11 and 26C. |
| Water/liquid definitions and state profiles | General fluid/env/state definitions plus runtime records. | 25C, 26B and Document 18. |
| Wave, current, tide, wind and storm profiles | env/weather/relationship/profile definitions; new domain only if justified. | 25C, 26D and 26O. |
| Vessel class or mobile voxel construct | vehicle with specialised schema, or admitted expansion domain if semantic separation is required. | 25C, 26F-26G and 26O. |
| Vessel blueprint and component roles | blueprint, component_role, block/item/machine references and Forge-owned presentation facets. | 26F, 26H, 26I and 25K. |
| Port, harbour, dock and shipyard | structure, service, project, settlement and route definitions. | 26J with Documents 07, 11 and 12. |
| Crew roles | job/NPC definitions with expansion-owned facets. | 26J and Documents 07/13. |
| Fleet or naval formation | Existing faction/group relationships or an admitted expansion domain. | 25C, 26K and 26N. |
| Cargo and maritime trade route | item/goods/market/route definitions plus persistent shipment or contract instances. | 26K/26N and owning economy/quest documents. |
| Flooding, fire, breach and vessel damage | state/status/effect definitions plus authoritative container-local runtime records. | 26L and 26O. |
| Marine creatures, sites, bosses and events | creature, site, boss, quest and event domains. | 26M/26N with Documents 10, 12, 15 and 16. |

# 12. ID Allocation, Reservation and Collision Handling

## 12.1 Allocation Lifecycle

1. A concept may use a non-persistent working label while still at Concept status.
2. The identity owner requests a qualified ID before the definition enters Data Ready or is referenced by another definition.
3. The namespace and domain validators reserve the ID and record the owner, source and creation version.
4. The ID becomes frozen at the earliest of: Data Ready status, inclusion in a compiled registry snapshot, use by a save/test fixture intended for compatibility, or release in a pack.
5. After freeze, spelling corrections and taxonomy changes use aliases or new IDs rather than silent edits.
6. The reservation remains permanent even if the definition is later deprecated or removed.

## 12.2 Collision Rules

| Collision | Required Response |
| --- | --- |
| Same qualified ID, same intended concept | Merge source fragments under the declared facet owners; reject duplicate field ownership. |
| Same qualified ID, different concepts | Block compilation. One concept receives a new qualified ID. |
| Different IDs, same intended concept | Select one canonical identity; map the other through alias or explicit related-definition semantics. |
| Same display name, different IDs | Allowed. Localisation and context disambiguate the player-facing names. |
| Short ID resolves to multiple namespaces | Reject the short reference and require the full qualified ID. |
| Mod attempts protected core ID creation | Reject pack load before world access. |

# 13. Display Names, Generated Names and Localisation Keys

Stable identity never depends on player-facing text. A single site may have an ancient name, local nickname, faction title, scholarly catalogue name and player label while retaining one instance identity. A culture or region may use generated names whose spelling differs between saves without changing the source definition.

| Text Layer | Owner | Identity Rule |
| --- | --- | --- |
| Fallback Display Name | Localisation bundle referenced by display_name_key. | May change or translate without ID change. |
| Description/Codex Text | Localisation/Codex content owner. | References definition and knowledge state; not canonical mechanics. |
| Generated Canonical Name | World naming system using culture, language, geography and history definitions. | Stored on the generated instance, not promoted to definition ID. |
| Aliases and Titles | Runtime history, faction, culture or player knowledge records. | Multiple names can resolve to one instance. |
| Player Label | Player/save data. | Never modifies definition or generated canonical identity. |
| Developer Label | Planning/editor metadata. | May assist search but is excluded from shipped identity. |

## 13.1 Localisation-Key Pattern

Default localisation keys follow <namespace>.loc.<domain>.<identity_path>.<field>. Definitions may reference specialist keys where required, but keys remain namespaced and stable. Common terminal fields include name, description, short_description, codex_summary, warning, map_label and accessibility_description.

# 14. Aliases, Deprecation, Replacement and Tombstones

| Mechanism | Use | Rules |
| --- | --- | --- |
| Alias | Spelling correction, namespace migration or approved identity rename. | Old qualified ID maps one-way to the current ID with version, reason and migration scope. |
| Deprecation | Definition remains resolvable but should not be selected for new content. | References warn; existing saves remain valid. |
| Replacement | A current definition supersedes the old concept for future selection. | replacement_id is explicit; compatibility must be stated. |
| Tombstone | Definition is removed or archive-only but historical references must resolve. | Stores former domain, reason, replacement/fallback and display recovery information. |
| Split Migration | One old definition becomes several new concepts. | Migration selects targets through explicit rules; no automatic alias can represent the split alone. |
| Merge Migration | Several old definitions become one current concept. | All old IDs remain reserved and map through recorded migration. |

## 14.1 Alias Safety

- Alias cycles are errors.
- Alias chains are flattened in compiled output so runtime resolution has one final target.
- An alias never transfers a domain incompatibly without a migration rule.
- An old ID is never reassigned after alias or tombstone creation.
- Production generation does not select deprecated or tombstoned definitions unless a world manifest explicitly preserves them.
- POC aliases resolve only for archived saves, regression fixtures or migration tooling.

# 15. Parent Definitions, Families, Modules and Variants

| Construct | Identity Treatment | Boundary |
| --- | --- | --- |
| Parent Definition | Has its own qualified ID and schema-compatible defaults. | May be abstract or selectable; deep fragile inheritance chains are prohibited. |
| Family | A stable grouping referenced by family_id or tags/capabilities. | Family is not automatically a parent and does not replace domain identity. |
| Module | A separately identified reusable component attached through composition. | Declares compatibility and cannot overwrite identity fields. |
| Variant Profile | A reusable profile referenced by the base definition or generated binding. | Use for regional, cultural, material, seasonal, realm or difficulty changes without cloning the base. |
| Signature Override | A deliberate unique definition or module override. | Retains common interfaces and owns only its declared fields. |
| Runtime State Profile | A definition describing allowed state behaviour/presentation. | The instance stores current state; the base definition ID does not change. |

A new definition is justified when the concept has a distinct gameplay identity, save-significant behaviour, progression role, world relationship package or player-facing provenance. Cosmetic palette changes, current damage, ownership and seasonal presentation should normally use variants or state profiles.

## 15.1 Blueprint, Class and Instance Separation

A blueprint is an authored or player-saved construction plan, not a parent definition and not the built object itself. A mobile construct may reference a class/parent, a blueprint, component-role definitions and variant profiles while the commissioned instance owns modifications, damage, cargo, crew and current state.

- Parent definitions provide shared defaults and interfaces.
- Component roles define semantic requirements such as propulsion, storage, control, structural support or service attachment without owning the final system behaviour.
- Blueprints define intended composition and local anchors; they do not become runtime authority.
- A commissioned or built object receives a persistent instance ID and records its source blueprint plus approved deltas.
- Refitting normally changes instance state or blueprint revision, not the base class ID.
- Set 26 owns the detailed vessel role, commissioning and refit contracts.

# 16. Definition Facets and Compiled Records

The project must avoid creating one Atlas creature and a second gameplay creature with separate IDs. Instead, one creature identity is assembled from owned facets. A compiled record is read-only and generated; source facets remain editable only by their owners.

| Facet | Typical Owner | Examples of Owned Fields |
| --- | --- | --- |
| identity | Registry Kernel / domain identity owner | definition_id, namespace, domain, schema, parent, family, aliases. |
| atlas_context | Relevant 24A-24K volume | Distribution, habitat, culture, history, suitability, scarcity, world role, authored relationships. |
| gameplay | Primary system document/registry | Executable interactions, slots, actions, consumption, drops, station behaviour, AI profile links. |
| combat | Document 16 where relevant | Damage interfaces, attack/action definitions, defence interactions, defeat rules. |
| presentation | Forge/Audio/VFX/UI owners | Model kits, materials, animations, sockets, icons, sounds, effects, accessibility descriptors. |
| technical_binding | Rewritten Document 18 and generated schemas | Runtime resource type, save record, LOD, authority, streaming and replication bindings. |
| localisation | Localisation content owner | Text keys and locale bundles. |
| planning | Production documentation owner | Tier, status, milestone, risk, effort and review owner. |
| validation_profile | 25E and domain validators | Required suites, completeness contract and evidence links. |
| extension:<schema_id> | Approved expansion/main-document owner | Only fields declared by the qualified extension schema; source pack, dependency mode and owner are mandatory. |
| spatial_contract | Domain owner with Document 18 binding | Spatial-frame interface, anchor types, local-record policy and permitted authority/LOD profiles; no derived world transform truth. |

## 16.1 Facet Assembly Rules

- The identity owner creates the base identity envelope; other facet owners attach only schema-declared paths.
- Two facets may reference the same fact but may not both own it. One stores the field; the other resolves it by ID or generated query.
- Compilation rejects incompatible schema versions, undeclared facets and duplicate writes to the same field path.
- Compiled definitions include source provenance so tools can show which document/pack owns each field.
- Retail runtime may strip planning and authoring metadata while preserving identity, pack, hash and migration information required for trust and saves.

## 16.2 Extension-Facet Assembly Rules

- Extension facets are keyed by qualified schema IDs and declare whether they are required for the definition, optional for an enabled feature, or presentation-only.
- An expansion cannot attach a facet to an identity unless the base schema exposes a compatible extension interface.
- Extension facets may add fields and references but may not reinterpret or shadow an existing field path.
- Compiled definitions retain facet provenance and dependency mode so save, UI, multiplayer and validation systems can explain unavailable functionality.
- Removing an optional facet does not rewrite the base definition; persistent extension-owned state follows the 25D removal/recovery contract.

# 17. Definitions, Generated Bindings, Instances and Runtime States

| Layer | Mutable? | Identity and Example |
| --- | --- | --- |
| Parent Definition | No at runtime | Qualified definition ID; shared defaults such as a quadruped creature parent. |
| Authored Definition | No at runtime | Qualified ID; reusable biome, creature, culture, structure, item or recipe. |
| Variant Profile | No at runtime | Qualified profile ID composed onto a base definition or binding. |
| Blueprint Definition | No at runtime | Qualified blueprint ID describing local composition, anchors and permitted variants; separate from a built instance. |
| Generated Binding | World/save record | Seed-selected relationship such as a culture claiming a generated ruin. |
| Persistent Instance | Yes through authoritative record | A specific NPC, settlement, site, relic, route, event, vehicle or mobile constructed object in one save. |
| Persistent Spatial Container | Yes through authoritative record | A world root or mobile/nested local-space container with its own instance/frame identity and transform state. |
| Container-Local Record | Yes through container/domain owner | A block entity, component, socket, compartment, inventory or actor binding addressed inside a spatial frame. |
| Runtime State | Yes through owner service | Current health, damage, ownership, population, supply, discovery or activity. |
| Historical Record | Append-only or migrated | Former owner, construction event, destruction, repair, boss defeat or cultural reinterpretation. |
| Engine Presentation | Ephemeral | Godot Node, scene instance, visual actor, UI view model or pooled effect. |

> **Separation Rule**
>
> A runtime instance stores the qualified IDs of definitions that created or currently configure it, but the instance ID is not a definition ID. Runtime state never rewrites the source definition, and a Godot node path, parent node or derived world transform is never the persistent instance identity.

## 17.1 Local-Space and World-Space Identity

Persistent moving or nested spaces require an explicit frame contract. The world root is one frame; a mobile constructed object may own another; nested interiors or attached modules may own subordinate frames when the technical design permits them.

| Reference Layer | Stored Identity | Rule |
| --- | --- | --- |
| Spatial Container | Persistent instance/frame ID + source definition/blueprint IDs. | Identity survives movement, scene reload and authority handoff. |
| Local Anchor | Container ID + stable anchor/socket/cell/component key. | Preferred for child references and interactions inside the container. |
| Local Transform | Position/rotation relative to the authoritative container frame. | Saved when required; not embedded in definition ID. |
| World Transform | Derived from the frame graph at runtime. | May be cached or replicated, but is not independent persistent truth. |
| Frame Transfer | Authority-issued transaction moving a record between frames. | Preserves identity/history and updates ownership, local transform and references atomically. |

Ordinary voxel cells do not each require globally unique IDs. A container stores its voxel volume by local coordinates/palette/state, while only addressable block entities, sockets, compartments or historically referenced elements receive stable local keys. Detailed moving-vessel storage belongs to Document 18 and Set 26O.

# 18. Persistent Runtime Identifier Classes

25B locks logical classes of persistent identifiers while leaving the final Godot implementation and binary representation to the rewritten Document 18.

| Identifier Class | Recommended Form | Use |
| --- | --- | --- |
| World ID | Opaque 128-bit persistent ID; ULID recommended. | Uniquely identifies a save world independent of display name and seed. |
| Deterministic Generated Key | Derived from world ID/seed lineage + generation path + definition inputs. | Stable identity for generated regions, sites, routes or anchors that must regenerate consistently. |
| Dynamic Instance ID | Typed record prefix + ULID or equivalent opaque 128-bit value. | NPCs, player-created structures, dropped relics, contracts and other runtime-created persistent records. |
| Historical Record ID | World-scoped append-only event/history ID. | Links causes and aftermath without changing the subject identity. |
| Transaction/Command ID | Authority-issued unique request/result ID. | Prevents duplicate inventory, construction, automation or multiplayer changes. |
| Spatial Frame ID | Persistent container instance ID or world-root frame ID. | Resolves local-space records and derived transforms without using scene parenting as identity. |
| Local Element Key | Container-scoped stable key or validated local coordinate/component key. | Addresses sockets, compartments, block entities or other persistent local elements without global IDs for every voxel. |
| Frame Transfer ID | Authority-issued transaction/history ID. | Audits movement of actors, cargo or components between world and mobile/nested frames. |
| Ephemeral Handle | Engine-local integer/object reference. | Temporary performance handle only; never serialized as canonical identity. |

## 18.1 Runtime-ID Rules

- Persistent instance IDs are globally unique within their intended compatibility scope and never derived from display names.
- Deterministic keys include stable generation-version inputs so a validator can explain how the identity was formed.
- Dynamic IDs must not depend on frame number, scene-tree order or mutable array index.
- Typed prefixes improve logs and diagnostics but are not substitutes for schema validation.
- Instance deletion produces a historical/tombstone record where other persistent references require evidence.
- A spatial container may move, stream, sleep or change authority without changing its instance/frame ID.
- Local element keys are unique within their owning container and are invalid without the container identity.
- Frame graphs must be acyclic unless a future technical design explicitly defines a safe portal/reference mechanism that is not treated as physical parenting.

## 18.2 Mobile and Nested Container Identity Boundary

25B establishes identity only. It does not select the voxel data structure, buoyancy model, interior simulation, physics body arrangement, replication algorithm or LOD thresholds. Those decisions belong to the rewritten Document 18 and, for maritime vessels, 26F-26O. Any implementation must nevertheless preserve the container/frame and local-child separation locked here.

# 19. Source-of-Truth Ownership Model

Ownership exists at several levels. Treating all of them as a single owner would recreate ambiguity, so 25B defines the following distinct roles.

| Ownership Type | Meaning |
| --- | --- |
| Namespace Owner | Authority allowed to create base qualified IDs inside a namespace. |
| Identity Owner | Domain document/registry responsible for the definition envelope and concept boundary. |
| Facet Owner | Document, registry or tool responsible for a declared field group. |
| Runtime State Owner | Authoritative service that may mutate a category of persistent state. |
| Spatial State Owner | Authoritative service owning container transforms, frame membership, local/world conversion and transfer transactions. |
| Extension Contract Owner | Approved document/schema owner permitted to define and revise one extension facet or admitted domain. |
| Source-Pack Owner | Pack currently distributing the definition and its dependencies. |
| Authoring Owner | Human/team/tool responsible for maintaining source data. |
| Review Owner | Human role responsible for approval and evidence at the current production gate. |
| Final Authority | Ash for scope, canon, major boundaries, representation, licensing and release. |

> **One Mutable Truth Rule**
>
> For every mutable runtime field, exactly one authoritative system owns writes. UI, AI, quests, events and tools send commands or requests; they do not maintain competing state. Events describe successful changes and history, but they are not a second editable state store.

# 20. Field-Level Ownership and Permitted Copy Types

| Copy Type | Allowed? | Rule |
| --- | --- | --- |
| Authoritative Field | Yes - one only | Editable only in the canonical owner source. |
| Qualified Reference | Yes | Stores the target ID and optional role; does not duplicate target fields. |
| Generated Derived Value | Yes | Built from authoritative fields and regenerated; source is recorded. |
| Read-Only Snapshot | Yes when needed | Version/hash marked and never edited as truth. |
| Prose Summary | Yes | Clearly non-canonical and may omit details; links to owner. |
| Runtime Cache | Yes | Disposable and invalidated by version/hash; never saved as authoritative content. |
| Derived World Transform | Yes | Generated from the authoritative frame graph and local transform; never edited or saved as a second truth unless explicitly snapshot-marked. |
| Opaque Quarantined Extension Payload | Conditional | May be preserved for round-trip recovery when the owning optional schema is absent; cannot execute or be edited as active truth. |
| Editable Mirror | No | Rejected because two files could diverge. |
| Implicit Convention | No | A field cannot be owned only by filename, folder position or undocumented code assumption. |

## 20.1 Field-Ownership Declaration

Every domain schema must publish a field-owner map. A field path may be marked canonical, reference-only, generated, runtime-owned or presentation-only. Validators compare source fragments against this map and reject unauthorised writes.

# 21. Atlas-to-Gameplay Ownership Matrix

| Concept | Atlas Owns | Gameplay/Runtime Owns |
| --- | --- | --- |
| Biome | World role, climate context, adjacency, ecology, civilisation suitability, distribution, history and state possibilities. | Terrain generation parameters, block palettes, hazards, traversal, resource placement execution and runtime biome state. |
| Creature | Habitat, food web, migration, settlement relation, dungeon/boss ecology and distribution. | Movement, senses, AI actions, combat interfaces, taming mechanics, exact drops and runtime population records. |
| Culture/Faction | Identity, values, history, homeland/diaspora, political relationships, architecture context and resource preferences. | NPC generation, reputation calculations, law execution, trade transactions, dialogue/quest runtime and faction state. |
| Structure/Site | Function, placement, history, ownership context, connections, states, inhabitants and suitability. | Blueprint/block volume, collision, services, construction, damage, interaction, encounter sockets and instance records. |
| Resource/Relic | Material ecology, origin, distribution, scarcity, provenance, claims, social value and reward context. | Block/item definitions, yields, stats, processing, recipes, inventory, transactions and current depletion. |
| Boss/Threat | Territory, role, discovery evidence, society/ecology connections, outcomes and aftermath. | Actions, damage, phases, AI execution, encounter authority, exact rewards and defeat state. |
| Event/Arc | Authored foundation, compatible roles, causes, evidence, branches and aftermath. | Participant binding, objectives, timing, contribution, dialogue, journal state, failure and authoritative resolution. |
| Realm | Realm identity, laws, biome network, societies, routes, histories and cross-realm consequences. | World instance, generation execution, portal transactions, survival effects, save/LOD and runtime realm state. |
| Ocean/Maritime Package | 24C and related Atlas owners hold ocean/coast/island/underwater context, ecology, culture, distribution, history, suitability and world relationships. | Set 26 owns detailed water, vessel, crew, fleet, naval and maritime gameplay contracts; amended main documents and runtime services own their executable facets and mutable state. |

# 22. Main-Document and Registry Ownership Matrix

| Active Owner | Canonical Responsibility | Reference Boundary |
| --- | --- | --- |
| 00-02 | Vision, player loop and progression philosophy. | Do not own individual content definitions or duplicate registry fields. |
| 03 | Executable block definitions, placement, shapes, states, mining and block-item links. | Atlas supplies world context; Items own carried forms. |
| 04 | Executable item definitions, inventory behaviour, equipment/consumption and block-item forms. | Blocks own placed behaviour; Recipes own transformations. |
| 05 | Recipe and transformation definitions, stations, inputs/outputs and processing requirements. | References Blocks, Items, Resources, Machines and unlock providers. |
| 06 | Capability-based resource progression and pathway rules. | 24J owns material ecology/provenance; physical registries own executable forms. |
| 07 | NPC and village runtime definitions, jobs, needs, storage, reputation and settlement simulation. | 24E owns culture/faction/settlement context. |
| 08 | Machines, logistics, power networks and automation transactions. | References physical resources, structures, settlements and realm laws. |
| 09 | Spells, rituals, mana infrastructure and executable magic behaviour. | Atlas owns magical ecology, cultural context and realm relationships. |
| 10 | Creature executable definitions and AI/ecology interfaces. | 24F owns Atlas ecology context; 16 owns combat extensions. |
| 11 replacement | Worldgen execution, seed streams, terrain, placement and generated-world records. | 24A-24D own authored topology/context. |
| 12 | Blueprints, structures, sites and executable state/interaction rules. | 24G/24I own history, placement, function and relationship context. |
| 13 | Executable ancestry/culture/faction interfaces and reputation/diplomacy definitions. | 24E owns Atlas identity and world context. |
| 14 | Realm/portal executable behaviour and runtime world instances. | 24D owns cosmology, realm package context and route foundations. |
| 15 | Quest/event execution, objectives, journal and contribution state. | 24K owns authored history/arc/event foundations. |
| 16 | Combat actions, damage, defence, gear interfaces and encounter execution. | Creatures/bosses own identity; combat owns executable packets/actions. |
| 17 | UI definitions, view models, accessibility presentation and player-trust feedback. | References all canonical definitions; never invents gameplay state. |
| 18 replacement | Godot runtime architecture, generated resource bindings, registry service, saves, spatial frames, authority, LOD and tooling. | Consumes canonical documents; does not redefine content meaning. |
| Document Set 26 | Authoritative maritime/naval extension contracts across water, worldgen, vessels, ports, crews, fleets, combat, ecology, progression, UI and technical requirements. | Extends existing domains and owners through registered schemas/facets; does not replace Set 25 or create duplicate base registries. |
| Forge/Presentation Sets | Authoring projects, assets, animation, socket, audio/VFX and presentation families. | Reference gameplay identities; Vessel Forge extensions remain Set 26-owned and enter through 25K manifests. |

# 23. Cross-Domain Reference Identity Contract

25C will define relationship semantics. 25B locks how any cross-domain reference identifies its target.

- Persistent and cross-pack references use full qualified definition IDs.
- A reference declares its expected target domain or interface so an ID cannot resolve to the wrong schema silently.
- Parent, family, replacement and alias references are validated during compilation.
- Raw file paths, spreadsheet row numbers, engine node paths, display strings and array indexes are prohibited as cross-domain identity.
- Generated-instance references use persistent instance IDs plus optional source definition IDs.
- Soft references and capability queries still record a stable query/type identity; they do not pass arbitrary strings.
- Reverse indexes are generated from forward canonical references and are not hand-maintained duplicates.
- Reference failures have explicit severity and fallback rules; they never silently become null in save-critical data.
- Cross-pack references declare dependency mode and owning pack/namespace expectations.
- References to container-local elements store the spatial container ID plus a validated local element key or anchor reference.
- A derived world-space position may accompany a reference for networking/debugging but cannot replace its canonical frame/local identity.

## 23.1 Required, Optional and Spatial References

25C will define relationship strength and fallback semantics. At the identity layer:

- **Required hard reference:** target definition/schema/pack must resolve or compilation/load is blocked.
- **Build-profile-required reference:** required only when a declared feature or expansion profile is enabled.
- **Optional qualified reference:** target may be absent only when a declared fallback, disabled-feature state or quarantine policy exists.
- **Soft capability/query reference:** stores a qualified query/interface identity rather than an arbitrary string.
- **Persistent spatial reference:** resolves a container/frame ID and local anchor/element key; world coordinates are derived.

A base definition cannot disguise an optional expansion hard dependency as a soft string or presentation link.

# 24. Definition Immutability, Versions, Hashes and Revisions

| Version/Hash | Meaning | Identity Effect |
| --- | --- | --- |
| Schema Version | Structure and interpretation of a domain/facet. | Does not enter ID; incompatible changes require migration. |
| Definition Revision | Monotonic revision of the authored concept inside its namespace. | Normally same ID; change log required after freeze. |
| Pack Version | SemVer or approved package version containing definitions/assets. | Pack may change while IDs remain stable. |
| Generation Version | Worldgen algorithm/rule version used to bind definitions. | Stored in world manifest; does not modify definition IDs. |
| Content Hash | Generated hash of canonical compiled definition data. | Detects exact content used by a world/build. |
| Registry Snapshot Hash | Hash of compiled registry/manifest set. | Supports join validation, save reload and reproducibility. |

## 24.1 Same ID or New ID?

| Change | Treatment |
| --- | --- |
| Display text, icon, model or file path changes but concept remains | Keep ID; update revision/assets/localisation. |
| Balance tuning or bug fix preserves intended capability | Keep ID; update revision and migration only if runtime data shape changes. |
| Definition gains an optional facet or relationship | Keep ID if concept remains compatible; validate completeness. |
| Concept changes domain or fundamental player-facing meaning | Create new ID; deprecate/migrate old identity. |
| One definition splits into multiple distinct concepts | Create new IDs and a split migration. |
| POC content is merely reused as a production mechanic | Create a production identity; never promote the POC ID directly. |
| Optional expansion adds an authorised facet to a compatible base definition | Keep the base ID; extension facet retains its own schema/pack provenance. |
| Expansion introduces a concept that does not exist without it | Create an expansion-owned qualified ID. |
| Mobile instance moves, rotates, changes world region or transfers authority | Keep instance/frame ID; update authoritative transform/ownership state. |
| Authored blueprint is forked into a distinct reusable design | Create a new blueprint ID with provenance/derivation; player runtime edits may remain instance delta until saved as a new authored/user blueprint. |

# 25. Content-Pack and Namespace Boundary

25D will define manifests and load order. 25B locks the identity boundary that manifests must enforce.

- Pack ID and namespace are separate. A pack may distribute definitions from namespaces it owns, and one namespace may be distributed across approved official packs.
- The world manifest records pack IDs, versions, hashes, namespaces and registry snapshot hashes.
- A pack cannot create a definition in another namespace without a declared extension or patch contract.
- A pack reorganisation does not force definition renames when namespace ownership and compatibility are preserved.
- Hard dependency failure blocks pack/world load before mutable state is opened.
- Uninstall or removal must resolve persistent identities through migration, tombstone, approved fallback or a clear incompatibility warning.
- Server/host manifest identity is authoritative in multiplayer.

## 25.1 Optional Major Expansion Compatibility

Document Set 26 is approved as a programme but its installation and shipping model is not yet selected. The kernel therefore supports general required and optional expansion modes without assuming that all maritime content is always present.

| Situation | Identity/Load Requirement |
| --- | --- |
| Expansion absent from a new base world | Expansion definitions and facets are not selectable; base capability fallbacks may not reference them. |
| Expansion enabled for a world | Manifest records namespace, packs, versions, hashes, schemas and required/optional status. |
| Base definition has optional expansion facet | Base definition loads without the facet; feature is disabled or replaced only through declared 25C/25D behaviour. |
| Persistent expansion instance exists but pack is missing | Load blocks, enters approved compatibility/quarantine mode, or opens read-only recovery according to 25D policy; never silently deletes or converts the record. |
| Expansion re-enabled with compatible identity | Quarantined records may reactivate after hash/schema/migration validation. |
| Expansion version supersedes a concept | Alias/migration/tombstone rules apply inside the owning namespace and to all cross-pack references. |
| Multiplayer peer lacks required expansion | Join is rejected before world state opens. Optional client presentation packs may differ only under an explicit safe profile. |

Set 26 must use these rules as its first major extension case. Detailed removal policy, distribution topology and build-profile classification remain 25D/25F/26A decisions.

# 26. Authoring Sources, Generated Outputs and Registry Service Boundary

| Layer | Editable? | Responsibility |
| --- | --- | --- |
| Canonical Authoring Source | Yes by owner | Spreadsheet, validated text, Forge project or specialist editor source chosen later by 25D. |
| Facet Source Fragment | Yes by facet owner | Contains only fields owned by that facet schema and the target qualified ID. |
| Compiled Definition | No | Validated assembly of all facets, aliases, inheritance and generated indexes. |
| Typed Godot Resource | Generated/read-only | Engine-facing definition or binding produced from the compiled registry. |
| Runtime Registry Cache | No | Fast resolution of IDs, aliases, parents, localisation and pack ownership. |
| Registry Snapshot/Report | No | Auditable counts, hashes, ownership and validation results. |
| UI/Editor View | Edits owner source only | May present merged data but routes writes to the canonical field owner. |

## 26.1 Registry Service Responsibilities

- Resolve qualified IDs and flattened aliases.
- Validate namespace and domain ownership.
- Return compiled immutable definitions by expected schema/interface.
- Resolve parent/composition and expose provenance for each field.
- Provide localisation keys, presentation references and production metadata as permitted by build profile.
- Expose content/registry hashes and source-pack ownership.
- Reject archive/test/dev definitions in normal production queries.
- Resolve installed extension schemas, authorised facets, interfaces and dependency-mode metadata.
- Report unavailable optional facets and quarantined records without fabricating replacement data.
- Expose spatial profile definitions, while leaving mutable frame graphs and transforms to the authoritative world/spatial service.
- Never own mutable world state that belongs to NPC, settlement, inventory, automation, quest, combat or world services.

# 27. Save, World Manifest and Migration Identity Contract

| Saved Element | Identity Data Required |
| --- | --- |
| World Manifest | world_id, world seed/profile, generation version, enabled packs/versions/hashes, namespaces, registry snapshot hash, realm graph and migration history. |
| Generated Instance | persistent instance ID or deterministic key, source definition IDs, generated binding provenance and owning simulation profile. |
| Runtime State Record | instance ID, record schema/version, authoritative owner, current state and source definition references. |
| Historical Record | record ID, subjects, cause, time/order, definitions involved and persistent aftermath references. |
| Inventory/Placed Content | qualified block/item/definition ID plus only required mutable instance state. |
| Spatial Container | container/frame instance ID, source class/blueprint IDs, parent frame, local/world transform state as defined by the technical schema, voxel/component storage version, authority/LOD profile and migration history. |
| Container-Local Record | container/frame ID, stable local element/anchor key, local transform/state, source definition IDs and authoritative owner. |
| Expansion Dependency State | expansion namespaces/packs/schemas used by the world, required/optional mode, unavailable/quarantined records and last compatible versions/hashes. |
| Removed Content | alias/tombstone/migration outcome and unresolved warning if no compatible recovery exists. |

A save never relies on the current display name, source filename, scene path, derived world transform or array index to recover content. Loading resolves the world manifest first, validates the registry and enabled-expansion snapshot compatibility, applies aliases/migrations deliberately, restores spatial containers and local records through their owner services, then instantiates runtime presentations from persistent records.

## 27.1 Expansion Absence, Removal and Recovery

- Required expansion absence blocks normal load before mutable records are opened.
- Optional expansion absence may disable features only when no active persistent record requires its schema, or when an approved quarantine/recovery path exists.
- Unknown authoritative extension data is preserved, not executed or discarded, when the approved round-trip policy supports preservation.
- Removing a pack cannot collapse a mobile container, delete cargo/crew/ownership history or convert definitions by display-name similarity.
- Migration reports identify every affected record, alias, fallback, quarantine and unresolved blocker.
- Final policies and user-facing recovery modes are owned by 25D and the rewritten Document 18.

# 28. Determinism and Generated-Identity Contract

- Definitions provide stable IDs used as inputs to namespaced derived seed streams.
- Adding an unrelated definition must not move rivers, rewrite settlements or change another domain merely because one global random sequence shifted.
- Generated bindings record the selected source definitions, generation version and stable path/seed inputs required to explain the result.
- Generated identity remains stable for explored/persisted content even when later registry versions add new candidates.
- Unexplored-region update policy is a save/migration decision and cannot silently rewrite existing persistent relationships.
- Cosmetic variation may derive from definition ID + location + state + variation channel, but cosmetic output does not become a new definition ID.
- Capability fallbacks selected by worldgen are stored as bindings so later reloads do not choose a different provider unexpectedly.
- A seed-generated mobile structure may receive a deterministic instance key at creation, but later movement does not change that identity.
- Blueprint composition and local voxel/component layout may be deterministic inputs; runtime damage, refit and cargo become saved deltas/state.
- Weather, flow or maritime profile definitions remain stable inputs, while their current simulation state belongs to runtime records.

# 29. Multiplayer and Authority Identity Contract

Multiplayer-ready identity is required even when the first implementation focuses on solo play.

- The server or local host owns the authoritative content-pack manifest, registry snapshot, world manifest and mutable runtime state.
- Clients validate compatible definitions and required presentation packs before joining.
- Commands reference persistent instance IDs and qualified definition IDs; clients do not request changes by display string or scene path.
- Replicated state records identify their authoritative owner and schema version.
- Client-only presentation definitions may differ only where the server contract permits; they cannot change gameplay identity or transactions.
- Join/reconnect detects missing aliases, packs or schema support before applying world state.
- Identity collisions or mismatched hashes are join blockers, not warnings that can be ignored.
- Moving or nested spatial containers have one authoritative frame owner at a time; child interactions resolve through that frame rather than competing world transforms.
- Boarding, disembarking, cargo transfer and other cross-frame changes require authority-issued transfer transactions.
- Replication may send derived world transforms for presentation, but persistent reconciliation uses container/frame and local identities.
- LOD promotion/demotion must preserve the same container and child identities across detailed and abstract simulation.

## 29.1 Ownership, Authority and Spatial Identity Are Separate

A vessel, vehicle, structure or container may be owned by a player, settlement, faction or fleet while simulation authority belongs to a host/server service and spatial parenting belongs to a frame graph. These are separate references and must never be collapsed into one field or inferred from the Godot scene tree. Set 26K-26O will define maritime ownership and moving-interior requirements; Document 18 will define the general runtime authority implementation.

# 30. Planning Metadata and Shipped-Data Separation

| Planning Field | Treatment |
| --- | --- |
| production_status / production_tier | Canonical planning truth; retained in development builds and registry reports, optionally stripped from retail runtime. |
| milestone / priority / estimated_effort | Production planning only; never changes gameplay selection unless an explicit build manifest filters content. |
| review_owner / risk / blockers | Workflow metadata; not serialized into normal player saves. |
| expansion_admission_status | Planning record showing whether an extension is proposed, admitted, deferred, blocked, superseded or released; not runtime feature state. |
| integration_debt_ref | Link to the 25A integration-debt register; excluded from retail runtime. |
| POC Required / Alpha / Beta legacy labels | Migrated to the 24L lifecycle/tier model; not shipped as gameplay properties. |
| placeholder_asset / implementation_note | May block a gate but does not become part of the content identity. |
| canonical_document / facet_sources | Retained in authoring and audit output; compiled runtime may keep compact provenance identifiers. |

> **Planning Separation Rule**
>
> A definition is not Common, Rare, stronger, weaker, spawnable or player-visible because its production status says Core, Alpha, Placeholder or Released. Production metadata controls workflow; gameplay fields control the game.

# 31. POC Archive, Test, Development and Production Namespace Rules

| Namespace Class | Allowed References | Release Behaviour |
| --- | --- | --- |
| Production | May reference production/system/presentation definitions and declared required/optional expansion packs under the active build profile. | Eligible for shipping after all gates. |
| Archive POC | May reference archive and migration support; may reference production only for comparison adapters. | Blocked from normal world generation and production fallbacks. |
| Test | May reference production and synthetic test definitions. | Excluded from retail manifests and player saves. |
| Development | May reference production/test/dev definitions. | Any reference from production is a release blocker. |

## 31.1 POC Conversion Rule

Reusable mechanics, schemas, test scenarios and assets may be reclassified only under new production identities with new ownership and package contracts. The archive ID remains as historical evidence or migration input. No alias may make an archive POC identity silently become the production definition, because that would preserve the retired content identity and contaminate saves.

# 32. Identity Validation and Failure Behaviour

| Validation | Severity | Failure Behaviour |
| --- | --- | --- |
| Malformed or non-lowercase qualified ID | Error | Reject definition compilation. |
| Duplicate qualified ID with conflicting identity owner | Error | Reject registry snapshot. |
| Unregistered namespace or domain | Error | Reject pack load. |
| Facet writes field it does not own | Error | Reject compiled definition. |
| Unresolved parent, schema or hard identity reference | Error | Block build/pack/world load as appropriate. |
| Alias cycle or old ID reused | Error | Reject registry snapshot. |
| Production definition references archive/test/dev ID | Release Blocker | Block production manifest and release. |
| Short ambiguous ID in persistent/cross-pack data | Error | Require qualified ID. |
| Definition ID embeds version/state/display text | Error or Review Blocker | Rename before freeze; migrate after freeze. |
| Excessively deep/generic identity path | Warning/Review | Human review before Data Ready. |
| Duplicate display name | Informational | Allowed when context/localisation disambiguates. |
| Orphan definition with no package/owner | Error | Cannot advance to Data Ready. |
| Undeclared extension facet or schema-keyed field group | Error | Reject compiled definition/pack. |
| Extension facet overwrites another owner field | Error | Reject compilation and ownership map. |
| Base hard reference targets disabled optional expansion | Release Blocker | Reclassify dependency or provide approved fallback before release. |
| Missing spatial container/frame for persistent local record | Error/Data-Loss Blocker | Block load or enter approved recovery mode; never place by guessed coordinates. |
| Cyclic physical frame parenting or duplicate spatial authority | Error | Reject runtime restoration/transfer. |
| Derived world transform saved as sole identity for local child | Error | Require container/frame plus local key/transform migration. |
| Missing optional expansion with active persistent records | Compatibility Blocker | Apply 25D block/quarantine/read-only recovery policy. |
| Expansion uses unregistered top-level domain | Error | Require domain admission decision and schema registration. |

## 32.1 No Silent Auto-Repair

Tools may suggest corrected IDs, aliases, ownership mappings, spatial repairs or expansion recovery paths, but they must not silently rename frozen definitions, guess a namespace, redirect a missing ID, reparent a local record, flatten a mobile container or delete an unresolved extension record. Any automatic migration produces an auditable report and requires the approval level defined in 25A.

## 32.2 Expansion and Spatial Validation Profiles

25E must provide reusable validation profiles for official expansion admission, optional-pack absence, extension-facet ownership, local/world reference integrity, frame transfer, LOD identity preservation, save migration and multiplayer manifest equality. Set 26 becomes the first required fixture set, but the validators must remain domain-general.

# 33. Adoption and Legacy-ID Conversion Plan

1. Inventory every existing block, item, recipe, resource, biome, structure, creature, culture, realm, quest, event, asset and technical ID in Documents 00-18, Atlas sources, Forge manifests and current code/data.
2. Classify each current identifier as canonical candidate, alias candidate, duplicate concept, POC archive identity, test fixture, file path, display-only label or invalid placeholder.
3. Register the initial official namespaces and domain-prefix ownership table.
4. Generate proposed qualified IDs without changing source files, then run collision and duplicate-concept review.
5. Approve the mapping and reserve all accepted IDs in the Registry Kernel ledger.
6. Create alias/tombstone records for frozen or compatibility-relevant legacy IDs.
7. Update canonical authoring sources and generate cross-document reference reports.
8. Update code, tests, saves and Forge manifests through bounded migration tasks rather than broad search-and-replace.
9. Compile the first representative registry snapshot and load it in Godot through the future Registry Service spike.
10. Register provisional Set 26 extension needs without freezing detailed maritime domains or schemas.
11. Freeze the 25B v0.2 identity baseline before 25F selects Core Production, before 25H/25I enumerate physical content and before registry-heavy Set 26 contracts are finalised.

## 33.1 Legacy Conversion Priorities

| Priority | Content |
| --- | --- |
| 1 - Foundation | Domain declarations, schemas, tags/capabilities, core block/item/recipe references and world manifest records. |
| 2 - Save-Critical | Persistent structures, NPCs, settlements, inventories, worldgen selections, realms, quests/events and ownership. |
| 3 - Cross-System | Machines, magic infrastructure, creatures, bosses, routes, resources, drops, mobile containers, spatial references, expansion facets and asset manifests. |
| 4 - Presentation | Icons, map symbols, audio/VFX families, localisation keys and Codex references. |
| 5 - Archive/Test | POC fixtures, regression worlds, synthetic definitions and migration-only records. |

## 33.2 Set 26 Compatibility Adoption

After approval of 25B v0.2, early Set 26 documents may cite this kernel for identity and ownership. Before Set 26 freezes vessel/fluid/fleet domains or save-critical fields, the owning documents must submit their proposed schema/domain/interface map to 25C and their pack/dependency/removal contract to 25D. Maritime physical entries remain non-canonical until the relevant Set 26 contracts and owning registries accept them.

# 34. Decisions Locked by 25B and Handoff to 25C

## 34.1 Working Locks Requiring Ash Approval of This Draft

- The globally stored definition ID uses the all-period format <namespace>.<domain>.<identity_path>.
- leyforge.core is the initial official production namespace; archive, test and development namespaces are isolated.
- Persistent and cross-pack data stores full qualified IDs; short IDs are authoring conveniences only.
- One logical definition may be assembled from multiple owned facets, but every field path has one canonical owner.
- IDs freeze at Data Ready, compiled-registry use, compatibility test/save use or pack release - whichever occurs first.
- Definitions are immutable at runtime; persistent instances and runtime state use separate IDs and owner services.
- Deterministic generated keys and dynamic ULID-style identifiers are distinct runtime identity classes.
- POC archive identities cannot be aliased directly into production identities.
- Legacy short IDs must be inventoried and migrated before physical registry replacement work becomes canonical.
- Approved expansions use the same qualified-ID, ownership, facet, alias, save and validation kernel; they do not create a parallel registry.
- New top-level expansion domains require recorded admission; schema-keyed extension facets are the default way to add optional behaviour to an existing identity.
- Persistent mobile/nested containers use stable frame identity and container-local child references; derived world transforms are not persistent identity.
- Optional expansion absence/removal cannot silently delete or reinterpret authoritative records.
- Set 26 remains the owner of detailed vessel, fluid, port, crew, fleet, naval and maritime behaviour and final record schemas.

## 34.2 Handoff to Document 25C

Document 25C receives the namespace, domain, definition-envelope, extension-facet, spatial-reference and ownership contracts. It must define domain and extension-schema registration; typed relationship nodes and edges; direction, cardinality and strength; required/optional/soft references; spatial relationship forms; capabilities; suitability and exclusion queries; generated bindings; fallback groups; reverse-link expectations; and completeness contracts. It must also define how Set 26 candidate records map to existing domains or justify admitted domains. It may extend field groups but may not change the qualified-ID grammar, frame/local identity rule or field ownership without an approved 25B revision and migration assessment.

## 34.3 Open Identity Decisions for Later Authority

| Open Decision | Owner | Status |
| --- | --- | --- |
| Final official namespace token and pack topology for Document Set 26. | 25D/26A/Ash | Pending; programme approval does not decide distribution identity. |
| Whether vessels use the general vehicle domain, an admitted vessel domain, or a schema/interface combination. | 25C/26F/26N | Pending detailed schema analysis. |
| Exact domain treatment for fluid, waves, tides, currents, storms, fleets and cargo shipment records. | 25C with 26B/26D/26K/26N | Pending; current mappings are compatibility candidates only. |
| Player-authored vessel blueprint identity, sharing, moderation and namespace rules. | 25D/26I/Forge owners | Pending. |
| Final optional-expansion removal modes and user-facing recovery policy. | 25D/26O/Document 18/Ash | Pending. |
| Godot service ownership for spatial frame graphs, moving interiors, LOD and replication. | Document 18/26O | Pending technical design; identity boundary is locked. |

# Appendix A. Canonical ID Pattern Reference

| Pattern | Requirement |
| --- | --- |
| Qualified definition ID | <namespace>.<domain>.<identity_path> |
| Namespace pattern | Two or more lowercase tokens; example leyforge.core |
| Token pattern | [a-z][a-z0-9_]* |
| Separator | Period only for definition/localisation hierarchy |
| Minimum local path | Registered domain + at least one identity token |
| Maximum recommended length | 48 characters per token; 192 characters total |
| Localisation key | <namespace>.loc.<domain>.<identity_path>.<field> |
| Alias key | Old qualified ID -> current qualified ID + version/reason |
| Runtime instance | Separate typed persistent ID; not a definition path |
| Spatial reference | <container_instance_id> + <local_anchor_or_element_key> + optional local transform |
| Extension facet key | Qualified extension-schema ID + owner/source-pack metadata |
| Expansion definition | leyforge.expansion.<approved_name>.<domain>.<identity_path> after namespace admission |

# Appendix B. Reserved Namespace and Domain Register

| Register | Initial Reserved Values |
| --- | --- |
| Official Namespaces | leyforge.core; leyforge.system; leyforge.presentation; leyforge.expansion.<name> |
| Non-Production Namespaces | leyforge.archive.poc; leyforge.test; leyforge.dev |
| World Domains | world; region; biome; env; overlay; fluid; weather; realm; portal; route |
| Civilisation Domains | ancestry; culture; lang; faith; gov; faction; settlement; npc; job |
| Ecology/Adventure Domains | creature; ecology; nest; disease; site; room; hazard; puzzle; boss; siege; titan |
| Built/Material Domains | structure; landmark; wonder; service; project; blueprint; component_role; res; material; loot; relic; goods; market |
| Gameplay Domains | block; item; recipe; machine; power; spell; ritual; vehicle; action; damage; status; effect |
| Narrative Domains | history; arc; quest; event; rumour; state; aftermath; dialogue |
| Presentation Domains | asset; material_set; anim; vfx; sfx; icon; map_symbol; ui |
| Kernel Domains | schema; tag; capability; relationship; interface; extension; spatial_profile; authority_profile; lod_profile; migration; test_fixture |
| Expansion Domain Rule | Additional top-level domains are admitted only through the Section 5.1 contract and are not reserved by examples. |

# Appendix C. Universal Definition Envelope Template

> **Illustrative Machine-Readable Shape**
>
> The exact JSON/YAML/Godot representation is deferred to 25D and Document 18. The following is a field contract, not a locked file format.

```yaml
definition_id: leyforge.core.<domain>.<identity_path>
namespace: leyforge.core
domain: <registered_domain>
identity_path: <domain_local_path>
schema_id: leyforge.system.schema.<domain>.<schema_name>
schema_version: <version>
definition_revision: <integer>
identity_owner: <canonical_owner_id>
canonical_document: <document_id>
source_pack: <pack_id>
display_name_key: leyforge.core.loc.<domain>.<identity_path>.name
description_key: leyforge.core.loc.<domain>.<identity_path>.description
parent_id: <qualified_id_or_null>
family_id: <qualified_id_or_null>
aliases: []
facets:
  atlas_context: <owned_source_reference>
  gameplay: <owned_source_reference>
  presentation: <owned_source_reference>
  technical_binding: <generated_source_reference>
interfaces: []
extensions:
  <qualified_extension_schema_id>:
    source_pack: <pack_id>
    dependency_mode: <required_or_optional>
    source: <owned_source_reference>
spatial_identity:
  spatial_profile_id: <qualified_id_or_null>
  authority_profile_id: <qualified_id_or_null>
  lod_profile_id: <qualified_id_or_null>
dependency_refs: []
planning:
  production_tier: <tier>
  production_status: <status>
provenance:
  created_version: <version>
  revised_version: <version>
  content_hash: <generated>
```

# Appendix D. Field Ownership Declaration Template

| Field | Entry |
| --- | --- |
| Definition/Facet | Qualified definition ID and facet name. |
| Canonical Owner | Document, registry, schema and responsible role. |
| Owned Field Paths | Exact paths the facet may write. |
| Reference-Only Paths | Fields the facet may resolve but not duplicate. |
| Generated Paths | Derived values produced by compiler/indexer. |
| Runtime Owner | Service permitted to mutate instance fields, if applicable. |
| Extension Schema/Owner | Qualified extension schema, namespace owner, dependency mode and permitted field paths. |
| Spatial Owner | Service owning frame membership, local/world conversion and transfer when applicable. |
| Source Format | Authoring source selected by 25D. |
| Validation | Schema and ownership tests required. |
| Supersession | Earlier source or field definition replaced. |
| Approval | Decision ID, status, approver and date. |

# Appendix E. Legacy Conversion Examples

| Legacy Form | Illustrative Treatment | Reason |
| --- | --- | --- |
| terrain.stone.basic | leyforge.core.block.terrain.stone | Legacy form mixes category and block identity without official namespace. |
| block.terrain.stone | Alias or source rewrite to leyforge.core.block.terrain.stone | Valid local authoring path but not globally qualified. |
| item.material.iron_ingot | leyforge.core.item.material.iron_ingot | Adds official namespace while preserving domain/path. |
| recipe.smelting.iron_ingot | leyforge.core.recipe.smelting.iron_ingot | Adds official namespace and retains transformation identity. |
| Forest Hamlet | leyforge.archive.poc.settlement.forest_hamlet tombstone/archive record | Display name is not production identity and the POC settlement is retired. |
| POC Watchtower | leyforge.archive.poc.structure.watchtower | Archive only; a future generic defence tower receives a separate production ID. |
| /root/World/Village/Warehouse | Persistent settlement/structure instance ID | Scene-tree path is ephemeral presentation, not save identity. |
| row_184 | Rejected; map row to a qualified ID | Spreadsheet order cannot be persistent identity. |
| vessel at world coordinate 120,44,-91 | Persistent container/frame ID + source definition/blueprint IDs | Current coordinates are state, not definition or instance identity. |
| onboard chest world transform | Container ID + local chest/block-entity key | Local child persists through vessel movement and scene reload. |
| core definition with optional maritime facet | Keep core ID + schema-keyed expansion facet | Optional extension does not rename or duplicate the base concept. |

The final mapping is produced by the legacy inventory and the replacement registries. Examples do not pre-approve the exact final names.

# Appendix F. Anti-Patterns and Rejection Examples

| Rejected Pattern | Why It Fails | Correct Direction |
| --- | --- | --- |
| block.stone_v2_final | Version/status embedded in identity. | Keep stable ID; store versions in metadata. |
| creature.red_wolf_2 | Numeric suffix hides a collision or unclear concept. | Use a meaningful family/identity path or variant profile. |
| village.current_owner_house | Current ownership and generated context embedded. | Use structure definition + instance ownership state. |
| biome.winter_forest_damaged | Season and damage treated as permanent identity. | Base biome + seasonal/state profiles. |
| Item display name used as recipe input | Translation/rename breaks reference. | Qualified item ID or capability query. |
| Godot resource path used in save | File reorganisation breaks world. | Qualified definition ID resolved by Registry Service. |
| Atlas and gameplay copies of habitat | Two editable truths can diverge. | Atlas owns habitat; gameplay references/queries it. |
| UI stores its own village reputation | UI becomes competing mutable state. | UI queries authoritative reputation owner. |
| Production fallback references POC watchtower | Retired identity leaks into normal worlds. | Capability-based production fallback with valid production IDs. |
| Missing ID auto-replaced with nearest name | Silent corruption and provenance loss. | Block load or run explicit migration/tombstone recovery. |
| vessel.sloop_at_x120_z91 | Runtime location embedded in definition identity. | Expansion definition ID + persistent container/frame instance state. |
| Onboard NPC saved only with world position | Moving container breaks or strands the NPC after load. | Container/frame reference + local transform/anchor. |
| Core recipe hard-references absent optional expansion item | Base world cannot load or progress without undeclared dependency. | Declare build-profile requirement or use approved optional fallback. |
| Expansion dictionary overwrites core field by load order | Hidden duplicate ownership and version-dependent behaviour. | Registered extension facet with qualified schema and owner. |

# Appendix G. Document 25B Acceptance Criteria

| Acceptance Area | Pass Condition |
| --- | --- |
| Identity Grammar | One exact qualified-ID format is defined, source-aligned and usable across domains, packs, saves and tools. |
| Namespace Governance | Official, archive, test, development and external namespace rules are explicit. |
| Domain Registry | Initial domain prefixes and canonical owners are recorded; ad hoc top-level domains are prohibited. |
| Definition Envelope | Universal fields, derived fields and provenance requirements are defined. |
| Source of Truth | One-identity/multiple-owned-facets model and permitted copy types prevent duplicate editable truth. |
| Runtime Separation | Definitions, generated bindings, persistent instances, runtime states, history and engine presentations are distinct. |
| Compatibility | Aliases, deprecation, replacement, tombstones, versions and hashes have explicit identity rules. |
| POC Isolation | Archive/test/dev identities cannot enter normal production manifests or fallback selection. |
| Legacy Adoption | A staged conversion plan exists for short IDs, POC identifiers, code paths, saves and assets. |
| Handoff | 25C can define schemas, relationships, capabilities, suitability, extension-domain admission and completeness without reopening identity grammar. |
| Expansion Compatibility | Official expansions use owned namespaces, schema-keyed facets, dependency modes and explicit absence/removal behaviour without a parallel kernel. |
| Spatial Identity | Mobile/nested containers, local elements and frame transfers have stable identity separate from derived world transforms. |
| Set 26 Boundary | The kernel can admit expected maritime records while detailed water/vessel/naval fields and behaviour remain in 26A-26O. |
| Human Approval | Ash reviews and approves the working locks before they become the active Registry Kernel baseline. |


# Appendix H. Major Expansion Extension Contract Template

| Field | Required Entry |
| --- | --- |
| Expansion Programme | Approved document set/name, authority decision and owning lead. |
| Proposed Namespace | Candidate official namespace token; status as proposed/reserved/frozen. |
| Source Packs | Pack IDs, owners, versions and which namespaces/facets each distributes. |
| Dependency Mode | Required, optional, build-profile-required, soft/query-only or incompatible. |
| Base Dependencies | Minimum core schemas, documents, registry versions and interfaces required. |
| New Domains | Proposed top-level domains with Section 5.1 justification and owners. |
| Extension Facets | Target base domains/interfaces, qualified extension schema IDs and owned field paths. |
| Persistent Records | New instance/state/history records and their runtime/spatial owners. |
| Spatial Contract | Container/frame, local anchor, transfer, LOD and authority requirements where applicable. |
| Save/Removal Policy | Load block, migration, quarantine, read-only recovery, fallback and reactivation rules. |
| Multiplayer Policy | Host/server manifest requirements, client compatibility and authority ownership. |
| Validation | Schema, cross-pack, save, migration, spatial, LOD, performance and release suites. |
| Main-Document Amendments | Owning documents/registries that consume approved expansion outputs. |
| Supersession | Deprecated identities, aliases, tombstones and active-source changes. |
| Approval/Status | Decision IDs, production status, evidence and final authority sign-off. |

> **Set 26 Use**
>
> Document Set 26 must complete this contract progressively through 26A-26O and the relevant Set 25 gates. The template is an admission record, not a substitute for the detailed maritime documents.

End of Document 25B - Canonical Registry Kernel, Stable IDs, Namespaces and Source-of-Truth Ownership v0.2
