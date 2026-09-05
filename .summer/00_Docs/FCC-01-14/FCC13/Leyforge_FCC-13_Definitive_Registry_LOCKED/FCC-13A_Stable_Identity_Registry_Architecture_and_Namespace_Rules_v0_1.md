# Leyforge Final Content Canon Collection

## FCC-13A — Stable Identity, Registry Architecture & Namespace Rules

**Version:** 0.1  
**Date:** 29 August 2026  
**Status:** **CANON WRITING COMPLETE v0.1 — based on locked FCC-13 interview Q1–Q268**  
**Parent:** FCC-13 — Definitive Blocks, Items, Forms, Recipes, IDs & Portal Binding  
**Primary Interview Coverage:** R01 Q1–Q20, with foundational dependencies from R02/R03 and migration constraints from M01  
**Consumes:** FCC-13 Steps 1A–1E; locked FCC-13 autonomous binding interview Q1–Q268; locked FCC-12 material/form/provenance architecture  
**Downstream:** FCC-13B, FCC-13C, FCC-13D, FCC-13E, technical/Forge implementation, FCC-14 certification

---

# 1. Purpose

FCC-13A defines Leyforge's canonical identity and registry architecture.

It establishes how durable content identity works across saves, networking, Forge authoring, generated forms, mods, recipes, portals and migration.

The central problem is:

> **How does Leyforge give durable identity to content without confusing material identity, physical form, gameplay object identity, runtime instance state, display name or implementation-specific numeric handles?**

The answer is a layered namespaced identity system with stable semantic IDs and compact runtime handles.

---

# 2. Core Stable-ID Doctrine

> **Every durable content concept receives a stable semantic identifier whose meaning survives display-name changes, registry reordering, runtime numeric-handle changes, engine migration and content-version evolution.**

Stable semantic IDs are authoritative.

Runtime numeric IDs are optimisation.

Display names are presentation.

Legacy IDs are redirects.

Instance state is not canonical identity.

---

# 3. Canonical ID Syntax

Leyforge canonical stable IDs use:

> `<namespace>:<domain>/<path>`

Examples:

- `leyforge:material/iron`
- `leyforge:material/contract_iron`
- `leyforge:form/ingot`
- `leyforge:object/portal/covenant/heart`
- `leyforge:object/portal/ascension/keystone`
- `leyforge:recipe/metallurgy/iron_ingot`
- `leyforge:recipe/portal/covenant/frame`
- `leyforge:blueprint/portal/deepgate`

The syntax is human-readable, deterministic, debuggable, mod-friendly, migration-friendly and independent of display text.

---

# 4. Logical Identity Layers

## 4.1 Material Identity

Represents underlying canonical substance/material.

Examples:

- `leyforge:material/iron`
- `leyforge:material/basalt`
- `leyforge:material/dreamwater`
- `leyforge:material/contract_iron`

A material ID does not encode form, location, owner, provenance, damage, charge or quality.

## 4.2 Form Identity

Represents reusable physical form.

Examples:

- `leyforge:form/ingot`
- `leyforge:form/wire`
- `leyforge:form/plank`
- `leyforge:form/beam`
- `leyforge:form/pane`
- `leyforge:form/slab`

## 4.3 Content Object Identity

Represents a persistent gameplay object/archetype such as:

- machine;
- portal component;
- tool;
- furniture;
- container;
- authored construction piece.

Example:

`leyforge:object/portal/covenant/heart`

## 4.4 Recipe Identity

Represents an executable process/transformation.

Example:

`leyforge:recipe/metallurgy/iron_ingot`

## 4.5 Blueprint / Structure Identity

Represents authored structural/project identity.

A structure is not an Item merely because it can be planned or previewed.

## 4.6 Knowledge Identity

Represents persistent unlock/recognition/knowledge state where needed.

Knowledge remains separate from recipes, Items and materials.

## 4.7 Migration Alias Identity

Represents obsolete historical identifiers that redirect to current content.

Aliases are not active content.

---

# 5. One Syntax, Multiple Domains

Leyforge uses one overall string-ID syntax while preserving semantic domain ownership.

Core domains include:

- `material/`
- `form/`
- `object/`
- `recipe/`
- `blueprint/`
- `knowledge/`

Additional domains may be introduced only where they represent a genuinely distinct identity owner.

---

# 6. Namespace Ownership

Core Leyforge uses:

> `leyforge`

Reserved support namespaces include:

- `leyforge_compat`
- `leyforge_test`

Third-party content uses its own namespace.

Examples:

- `examplemod:material/red_steel`
- `examplemod:object/machine/arc_furnace`

A third-party source may not shadow a `leyforge:` ID.

---

# 7. Reserved Namespace Rules

## `leyforge`

Canonical shipped Leyforge content.

## `leyforge_compat`

Compatibility-only migration objects that remain loadable but are not active canonical gameplay content.

Such objects are normally:

- noncraftable;
- excluded from normal world generation;
- excluded from normal progression/trade;
- visibly marked legacy/compatibility.

## `leyforge_test`

Stable test fixtures for:

- automated tests;
- save migration tests;
- logistics tests;
- voxel stress tests;
- crafting tests.

Test content must never silently appear in normal gameplay.

---

# 8. Display Names Are Not Identity

Display names may change because of localisation, naming cleanup, cultural presentation, state, provenance or context.

Therefore:

> **display text never determines durable identity.**

Changing “Oak Beam” to “Oak Heartwood Beam” does not require a new stable object identity if the semantic object is unchanged.

---

# 9. Runtime Numeric IDs

Numeric IDs are allowed for performance and may support:

- voxel storage;
- lookup tables;
- networking compression;
- cache indexing.

But:

> **numeric IDs are not authoritative canonical identity.**

They may vary between builds or registry configurations.

---

# 10. Runtime Handle Mapping

At runtime:

> stable semantic ID → compact numeric/runtime handle

The handle table may be regenerated.

Save loading resolves stable IDs first, then remaps to current runtime handles.

If a cached numeric handle disagrees with the stable ID, the stable ID wins.

---

# 11. Numeric-Only Legacy Saves

Old POC numeric-only references may be recovered only through an exact known legacy registry-version mapping.

If the legacy registry version cannot be determined safely:

> unresolved numeric content is quarantined rather than guessed.

A current free numeric slot must never inherit unrelated old meaning.

---

# 12. Stable ID Immutability

Once a canonical stable ID ships, its semantic meaning is permanent.

It may become:

- active;
- deprecated;
- redirected;
- compatibility-only.

It may never be reused for unrelated content.

Retired IDs remain reserved forever.

---

# 13. Stable ID Renames

A stable ID changes only through explicit migration.

The old ID becomes a permanent redirect.

Example:

old:
`leyforge:material/dream_glass`

new:
`leyforge:material/lucid_glass`

The old ID remains available as migration metadata/alias where appropriate.

---

# 14. Alias Classes

Aliases are typed.

## Migration Alias
Maps obsolete shipped IDs to current content.

## Deprecated Canonical Rename
Records a deliberate canonical rename.

## Cultural / Local Alias
Presentation-only terminology.

## Compatibility Alias
Supports imported/legacy data where an exact redirect is valid.

Only migration/deprecated compatibility aliases participate in durable redirect resolution by default.

---

# 15. Multiple Legacy IDs Per Target

A canonical target may receive many legacy redirects.

This is essential when an old Block row and Item row merge into one physical object identity.

The architecture supports:

> many old IDs → one canonical target

without duplicating new content.

---

# 16. Realm Qualification

Realm qualification appears in IDs only when identity is genuinely realm-specific.

Correct:

- `leyforge:material/iron`
- `leyforge:material/basalt`

Incorrect:

- `leyforge:material/overworld_iron`
- `leyforge:material/ashen_basalt`

Distinct specialist materials such as Contract Iron, Dreamwater and Soul Silver retain their own semantic IDs because the matter itself is different.

---

# 17. Provenance, State and Quality Are Not Material IDs

Do not create separate material IDs for:

- source realm;
- current owner;
- current location;
- charge;
- damage;
- corruption;
- purity;
- grade;
- quality;
- provenance.

Those remain separate metadata/state dimensions as locked by FCC-12.

---

# 18. Generated Standard-Form Identity

Regular standard forms use deterministic identity from:

> `(material_id, form_id)`

Examples:

- `(leyforge:material/iron, leyforge:form/ingot)`
- `(leyforge:material/oak_heartwood, leyforge:form/beam)`
- `(leyforge:material/basalt, leyforge:form/slab)`

This pair is the authoritative semantic identity.

---

# 19. Generated Form Architecture

FCC-13 locks a **hybrid** architecture.

## Standard Forms

Generated/deterministic.

Examples:

- slabs;
- stairs;
- beams;
- plates;
- wire;
- panes;
- ingots;
- cloth.

## Specialist Forms

Explicitly authored.

Examples:

- portal keystone;
- specialist machine component;
- unique lens;
- living specialist assembly;
- moving mechanical object;
- bespoke non-cubic Forge content.

Runtime/build systems may materialise/cache generated rows for speed without changing semantic identity.

---

# 20. Material Form Eligibility

Material definitions reference reusable form profiles.

Examples:

- timber profile;
- stone masonry profile;
- ductile metal profile;
- glass profile;
- fibre/textile profile.

Per-material rules may:

- allow;
- deny;
- override;
- specialise.

Not every material supports every form.

---

# 21. Specialist Form Override

A material+form pair may bind an authored specialist object that supersedes the standard template.

This is valid when geometry, collision, behaviour, living structure, magical behaviour or composition requires it.

The underlying material identity remains unchanged.

---

# 22. Multi-Material Object Archetypes

A multi-material object uses a material-neutral archetype ID.

Example:

`leyforge:object/machine/pump_basic`

Actual instance composition may include:

- frame material;
- shaft material;
- seal material;
- pipe material.

The archetype does not become a different canonical ID for every material combination.

---

# 23. Material Slot Persistence

Actual selected materials remain persistent because they affect:

- visuals;
- simulation;
- repair;
- salvage;
- mass;
- conductivity;
- heat resistance;
- provenance.

Provider substitution never causes the selected material to disappear from object composition.

---

# 24. Player-Created Variants

Player-built/configured variants use:

> archetype + material-slot map + state

They do not automatically receive new canonical IDs.

A deliberately saved/published Forge/blueprint design may receive its own authored identity.

---

# 25. Forge Identity Rules

Forge-authored content receives an immutable stable ID at creation.

Display-name changes do not rename that ID automatically.

Forking/copying authored content creates a new stable identity.

Forge should allow authors to define a material/form profile and preview generated standard forms rather than authoring every material×form combination manually.

---

# 26. Mod Namespace Rules

Every mod/plugin owns its namespace.

Mods may reference core IDs but may not silently replace them.

This prevents load-order ambiguity and save corruption.

---

# 27. Migration Resolution Order

Legacy resolution proceeds conceptually as:

1. current canonical ID;
2. deprecated canonical redirect;
3. migration alias;
4. compatibility mapping;
5. contextual migration if authorised;
6. compatibility/quarantine if unresolved.

Cultural/local aliases do not automatically participate in durable migration.

---

# 28. Contextual Migration

Some old IDs require context.

Examples:

- Deepstone;
- generic Stone;
- generic Plant Fibre.

Context may inspect:

- realm/location;
- block position;
- source container;
- old category;
- old recipe;
- provenance.

Only evidence-backed mapping is permitted.

Approximate string similarity is not a valid migration rule.

---

# 29. Compatibility Objects

When no safe canonical mapping exists and deletion would destroy player-owned value/world integrity, a `leyforge_compat:` object may preserve the old content.

Compatibility objects are intentionally noncanonical.

They are excluded from normal worldgen/crafting/progression.

---

# 30. Test Content Identity

Useful test fixtures live in `leyforge_test`.

Normal canonical content may not depend on test-only objects.

This cleanly separates POC/testing assets from world canon.

---

# 31. Object Projection Principle

> **A physical object may have multiple projections without multiple canonical identities.**

Examples:

- world/placeable projection;
- inventory projection;
- dropped-object projection;
- installed projection.

Projection is representation, not automatic identity.

---

# 32. Block Boundary

`Block` is primarily a world/voxel representation or implementation subtype.

A Block may represent:

- a generated material/form;
- a canonical object;
- part of a larger assembly.

The existence of a Block does not create a separate material identity.

---

# 33. Item Boundary

`Item` is primarily a portable/inventory projection where physical identity is unchanged.

Placed and carried versions of the same physical object remain one canonical object.

This is the foundation for removing old POC duplicate Block/Item pairs.

---

# 34. Lifecycle Splits

Separate object identities are justified when physical lifecycle genuinely changes.

Example:

- living Cave Mushroom;
- harvested mushroom product.

Likewise:

- crop organism;
- seed;
- harvest;
- processed food.

This is a lifecycle distinction, not Block/Item duplication.

---

# 35. Fluids and Gases

World fluid, stored fluid and piped fluid share the same material ID.

Stored representation adds:

- container;
- quantity;
- relevant state.

Gases likewise retain substance identity while storing amount/pressure/temperature as needed.

---

# 36. Installed Components

A removable installed component remains the same physical object instance.

If assembly irreversibly consumes it, composition/provenance transfers into the resulting object according to process rules.

---

# 37. Machine Assemblies

Large machines may use:

- one root functional object;
- multiblock footprint;
- component graph;
- occupied-cell references.

Individual occupied cells do not each become separate machine identities.

---

# 38. Portal Structure Identity

Valid, inactive, damaged, ruined, calibrated and upgraded portals remain states of the same portal family unless a physical component is detached.

This prevents legacy `Broken Portal Block` from becoming a generic portal material.

---

# 39. Recipe IDs

Recipe IDs follow:

> `<namespace>:recipe/<process-domain>/<path>`

Examples:

- `leyforge:recipe/metallurgy/iron_ingot`
- `leyforge:recipe/textile/sunflax_thread`
- `leyforge:recipe/portal/covenant/frame`

Recipe IDs do not encode quantity or balance version.

Normal recipe balancing does not require a new stable ID.

---

# 40. Recipe Alias Support

Recipe IDs support migration aliases so learned old recipes may redirect to current semantic replacements.

Removed recipes with no valid replacement are not silently mapped to unrelated recipes.

---

# 41. Knowledge IDs

Persistent recipe/portal/research knowledge may use stable IDs.

Knowledge remains distinct from Items/materials.

This prevents knowledge/attunement from turning into generic inventory currencies.

---

# 42. Blueprint IDs

Blueprints/structures use stable IDs independent of chosen material providers.

Example:

`leyforge:blueprint/portal/deepgate`

A built instance stores actual selected materials/components separately.

---

# 43. Portal Component IDs

Portal keystones/cores are object identities, not materials.

Examples:

- Covenant Heart;
- Veil Keystone;
- Coherence Core;
- Ascension Keystone;
- Deep Keystone;
- Ash Keystone.

Portal-family object IDs should use portal-specific semantic paths.

---

# 44. Portal Family Identity

Exactly six normal external portal families remain distinct.

A shared runtime implementation does not merge their semantic identities.

There is no generic seventh portal family.

---

# 45. Domain Validation

Registry validation should reject domain misuse such as:

- recipe ID where material ID is required;
- migration alias where active object is required;
- knowledge ID as inventory Item.

Typed domain ownership is part of registry correctness.

---

# 46. Canonical Resolver Contract

A canonical resolver must be able to determine:

- whether an ID exists;
- domain;
- namespace owner;
- active/deprecated/compat/test status;
- redirect target;
- generated status;
- canonical target.

Exact code architecture is downstream.

---

# 47. Registry Versioning

Registry/schema versions may drive migration.

Version is not identity.

A content object remains the same semantic object across normal data-schema revisions.

---

# 48. Save Load Failure Policy

A missing target must never silently become unrelated content.

Load order is:

1. canonical lookup;
2. alias lookup;
3. version-aware migration;
4. contextual migration;
5. compatibility/quarantine;
6. explicit migration report.

Correctness takes precedence over hiding a migration problem.

---

# 49. Engine Independence

Stable IDs are independent from:

- Unreal asset paths;
- Godot resource paths;
- repository folders;
- class names;
- database row numbers;
- texture indices.

The current Godot + Zylann rebuild may change implementation without changing semantic content identity.

---

# 50. Asset References

Models, textures and sounds are referenced by content data but are not the canonical stable ID itself.

Changing art does not require a content-ID change.

---

# 51. Networking

Network systems may transmit compact runtime handles where efficient.

Peers must agree on stable-ID→handle mappings.

A numeric handle has meaning only inside the agreed registry context.

---

# 52. Save Compression

Save systems may compress repeated stable IDs through local dictionaries.

The dictionary must remain reversible to canonical stable IDs.

Compression cannot become semantic identity.

---

# 53. Voxel Chunk Storage

Voxel/chunk palettes may use compact local handles.

Palette entries must map to canonical world/object/material-form identities so chunks remain migratable.

---

# 54. Inventory Stacks

An inventory stack must preserve enough semantic data to reconstruct:

- object/material identity;
- form;
- relevant state;
- quality;
- provenance where relevant.

Two lots may remain separate because state/provenance differs without gaining separate canonical IDs.

---

# 55. Transformation Binding

When processing crosses the FCC-12 transformation threshold, output receives the canonical ID of the new material/object.

Example:

Ember Iron → Contract Iron.

The output does not remain Ember Iron with a cosmetic state label.

---

# 56. Naming Convention

Stable ID paths use:

- lower-case;
- ASCII;
- underscore-separated words;
- forward-slash semantic hierarchy.

Avoid:

- spaces;
- display punctuation;
- version suffixes for normal balancing;
- editor-folder noise.

---

# 57. Portal Namespace Pattern

Recommended core patterns:

- `leyforge:object/portal/covenant/...`
- `leyforge:object/portal/veilgate/...`
- `leyforge:object/portal/dreamgate/...`
- `leyforge:object/portal/ascension/...`
- `leyforge:object/portal/deepgate/...`
- `leyforge:object/portal/ashgate/...`

---

# 58. Material Namespace Pattern

Materials generally use:

`leyforge:material/<semantic_name>`

Examples:

- `leyforge:material/basalt`
- `leyforge:material/soul_silver`
- `leyforge:material/lucid_glass`

No Overworld prefix is added merely because a material primarily occurs there.

---

# 59. Form Namespace Pattern

Forms generally use:

`leyforge:form/<semantic_form>`

Examples:

- `leyforge:form/beam`
- `leyforge:form/wire`
- `leyforge:form/pane`

---

# 60. Recipe Namespace Pattern

Recipes generally use:

`leyforge:recipe/<process-domain>/<semantic_path>`

The final domain list is FCC-13C implementation/content binding work.

---

# 61. Blueprint Namespace Pattern

Blueprints generally use:

`leyforge:blueprint/<domain>/<semantic_path>`

Examples:

- `leyforge:blueprint/portal/covenant`
- `leyforge:blueprint/machine/mechanical_miner`

---

# 62. Migration Metadata

A migration record should retain enough information to explain:

- old ID;
- old type/domain where known;
- source registry/save version;
- canonical target;
- migration type;
- contextual requirements;
- reason.

Exact schema is technical work.

---

# 63. Migration Types

Canonical migration classes include:

- direct redirect;
- merge;
- split;
- contextual;
- form migration;
- state migration;
- component migration;
- provenance migration;
- retire;
- compatibility/quarantine;
- reject/remove.

---

# 64. Merge Migration

When multiple old IDs map to one new physical object:

- all valid references redirect;
- state/provenance is preserved;
- duplicate inventory/world definitions collapse.

This applies to old POC duplicate pairs where physically appropriate.

---

# 65. Split Migration

When one old identity covered several meanings, migration may split based on context.

Example:

Plant Fibre may resolve to:

- exact botanical fibre;
- Mixed Plant Fibre;
- provider-only semantics.

Evidence determines the result.

---

# 66. Deepstone Rule

Deepstone receives no active current material ID.

Historic IDs remain migration/category/compatibility references only.

They may map contextually to real Deep geology where evidence exists.

---

# 67. Plant Fibre Rule

Plant Fibre does not become the canonical exact material for all botanical fibres.

The registry distinguishes exact fibres, Mixed Plant Fibre and fibre-provider semantics.

---

# 68. Legacy POC Fields

Old:

- `original_id`;
- `unique_id`;
- `numeric_id`;
- asset paths;
- texture indices;
- colour values;

are migration/reference evidence only.

They do not automatically become current canonical identity.

---

# 69. Registry Manifest

A runtime/build should be able to produce a registry manifest containing:

- canonical IDs;
- domains;
- namespaces;
- versions;
- aliases;
- generated-form capability;
- compatibility/test flags.

Exact file format is technical.

---

# 70. Registry Validation Requirements

Validation should detect:

- duplicate canonical IDs;
- illegal namespace use;
- duplicate alias claims;
- alias cycles;
- missing alias target;
- removed-ID reuse;
- domain mismatch;
- generated-form collision;
- core namespace shadowing;
- test/compat content leaking into normal progression.

---

# 71. Alias Graph

Migration aliases form a directed graph that must terminate at:

- active canonical target;
- explicit compatibility target;
- explicit removal outcome.

Alias cycles are invalid.

---

# 72. Generated-Form Collision Prevention

Two different material/form pairs must never resolve to one generated stable key.

An authored specialist override must be explicit.

Generated keys cannot shadow unrelated authored objects.

---

# 73. Registry Source Ownership

Every canonical ID has clear ownership:

- core Leyforge;
- mod/plugin;
- Forge project;
- compatibility;
- test.

This supports debugging, packaging and migration.

---

# 74. Mod Removal

If a save references removed mod content:

- core Leyforge does not guess a replacement;
- mod migration hooks may resolve it;
- otherwise missing-content/compatibility handling applies.

---

# 75. Forge Content Removal

Deleted Forge-authored content follows the same principle.

The old stable ID remains reserved and may redirect explicitly.

---

# 76. Automation

Automation systems refer to:

- stable content IDs;
- material/form/provider queries;
- recipe IDs.

Display strings are never authoritative automation rules.

---

# 77. AI / NPC Systems

NPC/settlement systems may reason over:

- object archetype;
- material;
- provider capability;
- cultural preference;
- cost.

Stable IDs allow deterministic planning without duplicate recipes for every culture/material.

---

# 78. Economy

Trade/ownership may reference canonical object/material IDs plus provenance and quality.

Currency issuing does not redefine underlying material identity.

---

# 79. Portal Dependency Binding

Portal recipes reference stable IDs for exact components and stable provider/knowledge references for flexible roles.

The Realm Access graph therefore remains durable across display-name changes.

---

# 80. Worked Example — Iron Wire

Material:
`leyforge:material/iron`

Form:
`leyforge:form/wire`

Physical identity:
`(iron, wire)`

Instance adds quantity/quality/provenance.

Iron Wire is not a second Iron material.

---

# 81. Worked Example — Contract Iron Plate

Material:
`leyforge:material/contract_iron`

Form:
`leyforge:form/plate`

Contract/provenance state remains attached through the FCC-12 framework.

---

# 82. Worked Example — Covenant Heart

Object:
`leyforge:object/portal/covenant/heart`

Its composition contains multiple materials/components.

The Covenant Heart is a component, not a material family.

---

# 83. Worked Example — Veil Keystone

Object:
`leyforge:object/portal/veilgate/keystone`

Its Echo Pearl remains a distinct underlying biomineral material.

---

# 84. Worked Example — Coherence Core

Object:
`leyforge:object/portal/dreamgate/coherence_core`

Dormant/active/calibrated are states of the same core identity.

---

# 85. Worked Example — Deepgate

Blueprint:
`leyforge:blueprint/portal/deepgate`

Built instance records actual:

- frame materials;
- Deep Anchors;
- Deep Keystone;
- interface;
- calibration state.

Occupied cells do not become separate Deepgate identities.

---

# 86. Worked Example — Player-Built Pump

Archetype:
`leyforge:object/machine/pump_basic`

Instance material slots store actual frame/shaft/seal/pipe materials.

A material substitution changes composition/performance without changing pump archetype identity.

---

# 87. Worked Example — Legacy Oak Log

Legacy Block and Item IDs both resolve to one current physical Oak-log content relationship.

World/inventory representation differs.

Underlying current timber identity remains authoritative.

---

# 88. Save-Safe Generated Forms

Saved generated forms must be reconstructible from:

- material stable ID;
- form stable ID;
- state;
- instance metadata.

They must not depend on a permanent generated-row number.

---

# 89. Generated-Form Deprecation

If a future material loses eligibility for a saved form, migration must explicitly decide:

- grandfather compatibility;
- new form target;
- salvage;
- compatibility object.

Silent reinterpretation is prohibited.

---

# 90. Registry Status Classes

Registry content may conceptually be:

- active;
- deprecated;
- compatibility-only;
- removed-with-migration;
- test-only.

Exact enum names remain technical.

---

# 91. Canon Authority

Creating a new data row does not automatically make it canon.

Canonical IDs bind accepted content authority.

Forge/mod/test sources must remain clearly owned.

---

# 92. Change Governance

High-risk registry changes include:

- deleting active ID;
- changing semantic target;
- changing domain;
- merging/splitting identity;
- changing migration aliases;
- changing generated-form resolution.

Future CI/governance should surface these explicitly.

---

# 93. Registry Compatibility Philosophy

Leyforge prioritises:

1. semantic correctness;
2. save integrity;
3. explicit migration;
4. debug visibility;
5. performance optimisation.

Runtime optimisation never overrides persistence correctness.

---

# 94. FCC-13A Ownership Boundary

FCC-13A owns:

- stable ID syntax;
- namespace policy;
- domain separation;
- identity layers;
- runtime numeric-ID role;
- alias architecture;
- generated-form identity;
- Forge/mod/test/compat namespace rules;
- migration identity principles.

It does not own the entire final content list.

---

# 95. FCC-13B Handoff

FCC-13B will define:

- definitive Block/Object/Item projections;
- actual canonical object bindings;
- standard form bindings;
- single-definition resolutions;
- inventory/world representation;
- portal object families.

FCC-13B may not redefine FCC-13A identity architecture.

---

# 96. FCC-13C Handoff

FCC-13C will define:

- recipe IDs;
- recipe rows;
- quantities;
- provider bindings;
- station/process capability bindings;
- repair/project recipes.

---

# 97. FCC-13D Handoff

FCC-13D will bind:

- six exact portal families;
- portal components;
- first-access recipes;
- dependency graph;
- repair/recovery;
- upgrades/calibration.

---

# 98. FCC-13E Handoff

FCC-13E will bind:

- old IDs;
- redirects;
- compatibility objects;
- 312-row POC migration completion;
- final FCC-14 handoff.

Retired IDs remain permanently reserved.

---

# 99. Technical Handoff

Implementation must support at minimum:

- stable string IDs;
- compact runtime handles;
- domain/namespace validation;
- alias redirects;
- version-aware migration;
- deterministic generated forms;
- compatibility/test namespaces;
- material-slot composition;
- stable recipe/blueprint references.

Exact code/schema remains implementation-owned.

---

# 100. CI / Validation Handoff

Future validation should fail on:

- duplicate canonical ID;
- removed ID reuse;
- alias cycle;
- missing alias target;
- namespace shadowing;
- generated-form collision;
- invalid domain reference;
- test content entering canonical dependency;
- compatibility content entering normal worldgen;
- new numeric-only persistence without stable semantic identity.

---

# 101. FCC-13A Decision Trace

This document carries locked FCC-13 decisions from:

- Q1–Q20 — registry identity, namespace and stability;
- Q21–Q24 — projection foundation;
- Q34–Q36 — fluid/gas/component identity;
- Q42 — portal state identity;
- Q45–Q53 — generated-form architecture;
- Q60–Q63 — container/composition/migration;
- Q65–Q66 — recipe identity;
- Q239–Q252 — migration/legacy identifier constraints.

No FCC-12 ontology decision is reopened.

---

# 102. FCC-13A Completeness Gate

- [x] stable semantic ID syntax locked
- [x] logical identity layers locked
- [x] namespace ownership locked
- [x] core/compat/test namespaces locked
- [x] runtime numeric-handle role locked
- [x] stable save authority locked
- [x] removed-ID reuse prohibited
- [x] rename-through-migration locked
- [x] alias classes locked
- [x] multiple aliases per target allowed
- [x] realm-prefix anti-duplication preserved
- [x] provenance/state/quality excluded from material ID
- [x] hybrid generated-form architecture locked
- [x] deterministic material+form identity locked
- [x] form-profile eligibility locked
- [x] multi-material archetype model locked
- [x] Forge identity policy locked
- [x] mod namespace isolation locked
- [x] Block/Item projection foundation locked
- [x] lifecycle split principle locked
- [x] fluid/gas identity principle locked
- [x] installed-component identity locked
- [x] portal-state identity locked
- [x] recipe ID pattern locked
- [x] knowledge/blueprint separation locked
- [x] compatibility/quarantine foundation locked
- [x] test-fixture separation locked
- [x] engine-path independence locked
- [x] migration-resolution order locked
- [x] CI validation handoff established

---

# 103. FCC-13A Result

> **FCC-13A — STABLE IDENTITY, REGISTRY ARCHITECTURE & NAMESPACE RULES — CANON WRITING COMPLETE v0.1**

FCC-13A now provides the durable identity foundation for the definitive Leyforge content registry.

The next canon-writing document is:

> **FCC-13B — Definitive Block, Object, Item, Form & Inventory Projection Registry**

FCC-13 remains pending completion of B–E and the final fidelity audit before formal lock.

---

**End of FCC-13A v0.1**
