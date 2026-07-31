# Fantasy Voxel Civilisation Sandbox
## 21D - Voxel Asset Forge - Asset Overrides, Variants and Registry Integration
**Version 0.1 - Detailed Design Bible Draft**

A detailed specification for replacing, extending and combining Forge-authored presentation without breaking stable gameplay identity, including field-level overrides, visual inheritance, variant families, registry contracts, content packs, conflict resolution, versioning, migration, save compatibility and safe fallback.

## Asset Overrides, Variants and Registry Integration Statement

| Field | Locked Direction |
| --- | --- |
| Document Scope | Defines stable presentation identity, parent inheritance, field-level overrides, variant sets, registry links, content packs, resolution precedence, provenance, conflicts, fallback, versioning, migration, save compatibility, validation and developer workflows. |
| Core Philosophy | A developer must be able to replace how a block or item looks, animates and presents itself without accidentally replacing what that block or item does. |
| Identity Direction | Gameplay definitions keep stable namespace IDs. Models, textures, materials, animations, icons and other presentation products resolve through separate stable references and may be replaced independently. |
| Override Direction | Support whole-asset and partial overrides. Every resolved field must reveal whether it came from the built-in definition, project override, enabled content pack or permitted world-specific override. |
| Variant Direction | Use parent assets, material substitution, overlays and controlled variant dimensions before duplicating complete assets. Geometry variants are reserved for meaningful silhouette or construction differences. |
| Registry Direction | Blocks, items, animations, materials, recipes, structures and other systems connect through validated stable IDs rather than fragile filenames or scene paths. |
| Precedence Direction | Resolve presentation in a deterministic order: built-in definition -> project visual override -> enabled content-pack override -> permitted world-specific override, with explicit priority and conflict diagnostics inside each layer. |
| Safety Direction | Invalid or missing visual data must fall back to the last valid inherited definition. A visual override may not silently alter recipes, inventories, power logic, NPC use, resource flow or authoritative state contracts. |
| Save Direction | Saves store stable gameplay identity and required runtime state. Visual file paths are not save identity. Variant tokens are stored only when needed to preserve a deliberate or gameplay-significant appearance. |
| Developer Direction | The developer section permits direct visual replacement, comparison, selective reversion, duplication, promotion, hot reload and legacy-asset migration through the Forge. |
| Modding Direction | The first implementation is developer-first. Content-pack and world-override foundations are included now so later modding does not require a destructive redesign. |
| Implementation Context | Current implementation target is Godot with Summer Engine. Exact Resource classes, importers, manifest formats and cache services are deferred to 21F, while this document defines their required behaviour. |
| MVP Direction | Prove safe model, texture, material and animation overrides; deterministic variants; registry resolution; conflict diagnostics; revert/fallback; hot reload; and save-safe visual replacement for a furnace, chute, building block, item and mana device. |

## Document Purpose

This document defines how the Voxel Asset Forge replaces and expands existing game presentation while keeping the rest of Leyforge stable. Document 21A established the Forge as a code-preserving visual-authoring layer. Document 21B defined voxel models, block surfaces, materials, collision, pivots and sockets. Document 21C defined animation, effects, audio and runtime visual-state presentation. Document 21D connects those products to the game's registries and controls how base assets, overrides, variants and content packs resolve into one final runtime presentation.

The user's required workflow is central: an authorised developer must be able to open an existing block or item in the Forge, replace its model, texture, materials or animation, save the change and immediately use the updated asset without rewriting its recipes, inventory logic, machine processing, NPC interactions or save identity. That freedom requires stronger safeguards than a simple file replacement system. The Forge must know exactly which fields changed, which fields remain inherited, which contracts the replacement must satisfy, which version produced the result and how to return to a valid fallback.

The same framework also prevents unnecessary asset duplication. An oak chute, pine chute and dwarven iron-lined chute should not automatically become three unrelated one-off definitions. They can share a parent geometry, connection contract and animation set while substituting material DNA, trims, overlays or selected geometry parts. Damage, weathering, magical charge and corruption can layer over those variants without creating an unmanageable matrix of complete assets.

This document focuses on identity, resolution, registry and compatibility rules. Editor screens, asset browser presentation, compare panels and detailed creator interaction are expanded in 21E. Godot Resource classes, file formats, manifest parsing, import/bake services, cache keys, hot-reload implementation and automated tests are expanded in 21F. The ordered production migration of existing visuals is expanded in 21G.

## Engine Status Note

> **Current Project Direction**  
> Leyforge is currently being built in Godot with Summer Engine. The Forge should use data-driven Godot resources, stable registry IDs, deterministic resolution and GDScript-first developer tooling where practical. Earlier Unreal-specific planning remains useful for authority, save safety, stable IDs, validation and modular data contracts, but Unreal is not the active implementation target.

## Design Sources

| Source Document | Relevant Direction | How 21D Uses It |
| --- | --- | --- |
| 00 - Master Game Design Bible | The game uses a stylised, readable high-fidelity voxel presentation where blocks, tools, machines, magic and civilisation remain visually understandable. | Locks the requirement that variants enrich the world without obscuring asset identity or block readability. |
| 03 - Blocks Registry | Blocks use parent definitions, material families, shapes, states, stable IDs and connected-system fields. | Supplies the block contracts that visual overrides and variants must preserve. |
| 04 - Items Registry | Blocks and items remain separate but linked; item instances may carry quality, durability, charge, ownership and enchantment state. | Requires separate block, inventory, held, dropped and icon presentation links without confusing gameplay identity. |
| 05 - Crafting and Recipe Registry | Recipes reference stable block and item IDs and must survive visual replacement. | Establishes that presentation changes cannot silently modify inputs, outputs, station rules or unlocks. |
| 08 - Automation System | Machines, logistics, ports, directionality, power and state must remain readable and physically present. | Requires connection, socket and visual-state contracts to survive machine overrides. |
| 09 - Magic System | Runes, mana, wards, conduits and corruption use visible infrastructure and layered states. | Requires magical variant dimensions, emission roles and state-compatible overlays. |
| 11 - Biomes and World Generation | Biomes, culture, weather, corruption and deterministic seed variation alter visual presentation. | Requires controlled biome overlays, deterministic variant selection and worldgen-safe references. |
| 12 - Structures | Structures use block families, blueprint substitution, culture palettes, construction states, damage, repair and restoration. | Requires structure-safe variant families and stable blueprint references. |
| 17 - UI/UX System | Complex information must remain inspectable, readable and trustworthy. | Requires clear provenance, conflict messages, comparison and safe-revert feedback in the Forge. |
| 18 - Technical Implementation Plan | Stable IDs, validated registries, versioning, migration, deterministic data and safe fallback are foundation requirements. | Supplies engine-agnostic reliability rules while its old Unreal implementation details are superseded. |
| 21A - Voxel Asset Forge Core System | Locks developer overrides, visual/gameplay separation, inheritance, variants and the resolution hierarchy. | Acts as the direct governance source for 21D. |
| 21B - Voxel Modelling, Texturing and Material Authoring | Defines editable models, surfaces, palettes, Material DNA, pivots, sockets, collision and baked products. | Defines the static fields that 21D can inherit, replace, validate and resolve. |
| 21C - Animation, Effects and Runtime Visual States | Defines clips, tracks, effects, audio, state contracts, transitions and animation overrides. | Defines the dynamic presentation fields that 21D links to registries and protects through contract validation. |

## Static Table of Contents

- 1. Locked Asset Override, Variant and Registry Identity
- 2. Player Decision and Direction Summary
- 3. System Architecture and Conceptual Model
- 4. Stable Gameplay Identity and Presentation Identity
- 5. Definition Layers, Editable Sources and Runtime Products
- 6. Parent Definitions, Inheritance and Visual Families
- 7. Override Scopes, Access and Authorisation
- 8. Field-Level Override Data Model
- 9. Resolution Order, Provenance and Fallback
- 10. New Asset, Duplicate, Variant and Override Decision Rules
- 11. Model and Geometry Overrides
- 12. Texture, Palette and Material Overrides
- 13. Animation, Effect, Audio and State-Binding Overrides
- 14. Collision, Placement, Pivots, Sockets and Contract-Sensitive Overrides
- 15. Block, Item and Multi-Presentation Integration
- 16. Variant System Identity and Classification
- 17. Material, Culture, Biome, Condition, Magic and Quality Variants
- 18. Runtime States Versus Persistent Variants
- 19. Deterministic Variant Selection and World Seeds
- 20. Variant Composition, Compatibility and Combinatorial Control
- 21. Registry Architecture and Core Contracts
- 22. Stable IDs, Namespaces, Display Names and File Paths
- 23. References, Dependencies, Aliases, Deprecation and Replacement
- 24. Content Packs, Manifests and Distribution Units
- 25. Load Order, Conflict Detection and Merge Rules
- 26. Developer Editing, Compare, Revert and Promotion Workflow
- 27. Approval Status, Review History and Change Provenance
- 28. Hot Reload, Cache Invalidation and Live Preview
- 29. Versioning, Migrations and Save Compatibility
- 30. Legacy Asset Migration and Visual Overhaul Conversion
- 31. Blueprint Designer, Structures, Worldgen and Generated Families
- 32. Multiplayer, Server Content and Client Consistency
- 33. Permissions, Security and Future Modding Boundaries
- 34. Validation, Diagnostics, Release Gates and Recovery
- 35. Minimum Viable 21D Scope
- 36. Success Criteria and Acceptance Rules
- 37. Relationships With Documents 21E-21G
- Appendix A. Override Record Field Template
- Appendix B. Variant Set Field Template
- Appendix C. Presentation Registry Contract Template
- Appendix D. Conflict and Resolution Matrix
- Appendix E. POC Override and Variant Test Matrix
- Appendix F. Glossary and Deferred Decisions

# 1. Locked Asset Override, Variant and Registry Identity

The override and registry layer is the continuity layer of the Voxel Asset Forge. It lets Leyforge's visuals improve repeatedly without turning every visual change into a risky gameplay migration. It also lets related assets share common parents and controlled variants so the content library can grow without becoming a collection of copied one-off files.

> **Locked Rule**  
> A visual override may change how an asset is modelled, textured, animated, lit, sounded, previewed or presented, but it may not silently change the stable gameplay definition that recipes, saves, NPCs, automation, quests, structures and world simulation reference.

## 1.1 Core Promise

An authorised developer should be able to:

- Open a furnace already used in existing worlds.
- Inspect its gameplay identity and the source of every resolved presentation field.
- Replace only the model, only the texture, only an animation clip or the complete visual profile.
- Keep fuel logic, inventory slots, processing recipes, power ports, NPC use and save references unchanged.
- Preview the replacement beside the current approved asset.
- Revert one field or the entire override without damaging the base definition.
- Create material, culture, biome and condition variants without copying the full asset unnecessarily.
- Detect conflicts when multiple packs try to replace the same field.
- Remove an invalid or disabled override and fall back to the last valid inherited presentation.
- Load an existing save after the visual replacement and see the same gameplay objects using the new approved presentation.

## 1.2 Identity Layers

| Identity Layer | Meaning | Stability Rule |
| --- | --- | --- |
| Gameplay Definition | The authoritative block, item, machine, station or other gameplay record. | Stable ID; changes require gameplay validation and possible migration. |
| Presentation Profile | The resolved model, material, animation, icon, sockets and visual-state package. | Replaceable through Forge while satisfying the gameplay contract. |
| Editable Source | Voxel volumes, painted faces, palettes, timelines and authored metadata. | Versioned development data; never used as save identity. |
| Baked Runtime Products | Meshes, textures, materials, clips, icons, collisions and caches generated from source. | Rebuildable products addressed through stable presentation references and hashes. |
| Variant Set | A controlled family of selectable presentation differences. | Inherits from a parent and declares selection rules and compatibility. |
| Override Record | A field-level patch targeting an existing definition or presentation profile. | Stores target ID, layer, changed fields, compatibility and provenance. |
| Content Pack | A named distribution unit containing definitions, variants, overrides and dependencies. | Versioned manifest with deterministic load and conflict rules. |
| Runtime Instance | A placed block, held item, machine or prop using resolved definitions and current state. | Stores gameplay state and only the minimum presentation token required for continuity. |

## 1.3 What This System Is Not

- It is not permission to identify game content by filenames.
- It is not a system where the newest file silently wins without diagnostics.
- It is not an excuse to copy a complete asset for every colour or weathering difference.
- It is not a gameplay editor hidden inside a visual override screen.
- It is not a guarantee that any arbitrary replacement is compatible with existing collision, sockets or animations.
- It is not a requirement that saves permanently embed all visual data.
- It is not a public mod marketplace or player-generated-content system in the first implementation.

# 2. Player Decision and Direction Summary

| Area | Locked Decision |
| --- | --- |
| Developer Control | The developer section allows manual replacement of block and item models, textures, materials, animations, icons, effects and other presentation fields. |
| Gameplay Preservation | Visual replacement keeps the original stable gameplay ID unless the developer explicitly creates a new asset or enters a separate gameplay-edit workflow. |
| Partial Overrides | An override can replace one field, one clip, one material slot, one state response or the complete presentation profile. |
| Base Protection | Built-in assets remain available as read-only fallbacks. Project edits are stored as separate override records rather than destructively overwriting the source. |
| Resolution Hierarchy | Built-in -> project override -> enabled content-pack override -> permitted world-specific override. Temporary preview overrides sit above this order but are not saved or shipped. |
| Provenance | The Forge shows the source layer, pack, version and record that supplied every resolved field. |
| Variants | Use parent definitions, material DNA, overlays and targeted geometry changes to create families. Do not duplicate complete models for minor differences. |
| State Boundary | Active, powered, damaged, wet, burning and similar runtime truth comes from gameplay state contracts; Forge data only presents it. |
| Registry Linking | All cross-system links use stable namespace IDs and validated references. Display names and paths can change. |
| Conflict Handling | Conflicts are deterministic, visible and reviewable. Equal-priority field conflicts must not resolve through nondeterministic load order. |
| Fallback | Missing or invalid override fields inherit from the next valid layer. Critical missing contracts block approval but should not corrupt the runtime asset. |
| Save Safety | Existing saves continue to identify the same gameplay definitions after visual replacements. World-specific visual choices store stable pack/variant tokens only where required. |
| Hot Reload | Approved development overrides can rebake and refresh controlled preview environments without restarting the entire game where technically safe. |
| Legacy Migration | Existing manually created models and textures can be wrapped or reconstructed as Forge sources while retaining their stable gameplay IDs. |
| Future Modding | Content-pack foundations are included, but public creator permissions, signing, distribution and moderation remain deferred. |
| MVP | Demonstrate field-level override, deterministic variant selection, conflict detection, revert, fallback, hot reload and save compatibility across representative assets. |

# 3. System Architecture and Conceptual Model

## 3.1 Resolution Flow

```text
Gameplay definition ID
    -> presentation contract required by that definition
    -> base presentation profile
    -> inherited parent/family data
    -> project override patch
    -> enabled content-pack patches in deterministic order
    -> permitted world-specific patch
    -> variant selection and compatible overlay composition
    -> validation and fallback resolver
    -> baked runtime presentation products
    -> runtime instance using authoritative gameplay state
```

The resolver does not build gameplay behaviour. It answers a presentation question: given this stable gameplay definition, enabled content configuration, world context and current authoritative state, which valid model, materials, clips, effects, icons and sockets should be shown?

## 3.2 Core Record Types

| Record Type | Purpose | Example |
| --- | --- | --- |
| Gameplay Definition | Owns functional identity and system links. | `block.machine.basic_furnace` |
| Presentation Contract | Declares required parts, sockets, states, orientations and representation forms. | `contract.machine.furnace.basic` |
| Presentation Profile | Points to approved static and animated visual products. | `presentation.machine.basic_furnace.default` |
| Override Record | Replaces selected fields on a target profile or definition link. | `override.project.basic_furnace.visual_v2` |
| Variant Set | Defines selectable variants, dimensions, weights and fallbacks. | `variantset.chute.wood_family` |
| Material DNA | Supplies shared palette, texture and surface behaviour. | `material.wood.oak` |
| Content-Pack Manifest | Declares pack identity, version, dependencies, records and load rules. | `pack.leyforge.project_visuals` |
| Migration Record | Converts old IDs, fields or versions to current contracts. | `migration.presentation.v1_to_v2` |
| Resolution Report | Records the final source and warnings for every field. | Generated developer/debug output. |

## 3.3 Gameplay Contract and Presentation Contract

A gameplay definition may require presentation capabilities without owning their art. A basic furnace contract may require:

- A world-placement form with a one-block footprint.
- Front-facing orientation.
- An interaction anchor.
- Input and output port markers.
- States for inactive, active, output blocked and damaged.
- A safe static fallback when animation is unavailable.
- An inventory icon presentation.
- A collision profile compatible with the placement footprint.

The presentation profile can satisfy those requirements with many different visual designs. This is how the Forge permits complete visual overhaul while the furnace remains the same functional object.

## 3.4 Resolution Report

Every inspected asset should be able to produce a report similar to:

```text
Target: block.machine.basic_furnace
Gameplay definition: built-in registry v0.4
Presentation contract: contract.machine.furnace.basic v2
Model: project override / override.project.furnace_2026_visual
Materials: project override / override.project.furnace_2026_visual
Collision: inherited from built-in presentation
Animation clip ignite: content pack / pack.arcane_industry v1.2
Animation clip process: project override
Audio: inherited from built-in presentation
Variant: culture.human_forest
Validation: valid with two warnings
```

# 4. Stable Gameplay Identity and Presentation Identity

## 4.1 Stable Gameplay ID

Stable gameplay IDs are the references used by saves, recipes, world blocks, inventories, quests, automation networks, NPC projects and structures. Once an ID is released into persistent content, it should not change casually.

```text
block.terrain.stone
block.construction.oak_planks
block.logistics.wooden_chute
block.machine.basic_furnace
item.tool.iron_pickaxe
item.material.iron_ingot
```

## 4.2 Presentation ID

Presentation IDs identify reusable visual packages. They may be replaced or versioned independently from gameplay identity.

```text
presentation.block.stone.default
presentation.logistics.wooden_chute.default
presentation.machine.basic_furnace.default
presentation.item.iron_pickaxe.default
```

One gameplay definition normally points to one default presentation profile, but multiple gameplay definitions may share a profile where their appearance and contract are genuinely identical. Conversely, one definition may select among multiple valid variants or representations.

## 4.3 Identity Separation Example

| Retained Gameplay Identity | Replaceable Presentation Identity |
| --- | --- |
| `block.machine.basic_furnace` | `presentation.machine.basic_furnace.default` |
| Fuel rules | Voxel body and named parts |
| Processing recipes | Materials, palette and emissive masks |
| Inventory slots | Animation and effect profile |
| Power and automation behaviour | Visible port geometry and state indicators |
| NPC job compatibility | Interaction marker presentation |
| Save data | Icon, thumbnail and dropped representation |

## 4.4 Display Names and Localisation

Display names are player-facing text and should use localisation keys. They may change without changing IDs. The Forge can show both the display name and stable ID, but it must never use the display name as a unique technical key.

# 5. Definition Layers, Editable Sources and Runtime Products

## 5.1 Layered Data Model

| Layer | Contains | Editing Rule |
| --- | --- | --- |
| Gameplay Registry | Functional definitions and authoritative system references. | Edited through relevant system tooling, not through a normal visual override. |
| Presentation Registry | Profile links, contracts, variants and approved product references. | Managed by Forge and registry integration. |
| Editable Forge Source | Voxel volumes, textures, masks, palettes, parts, timelines and source metadata. | Non-destructive, versioned authoring data. |
| Override Patch | Only fields that differ from the inherited target. | Stored separately with provenance and compatibility metadata. |
| Baked Runtime Product | Optimised meshes, textures, materials, clips, icons and collision products. | Generated and replaceable; not the canonical source. |
| Runtime Cache | Resolved and loaded products for active worlds or previews. | Disposable and invalidated by dependency hashes. |

## 5.2 Non-Destructive Source Rule

Project overrides should not overwrite built-in source records. Even when the Forge presents the workflow as editing an asset, it should create or update a project override layer. This gives the developer reliable compare, revert and fallback behaviour.

## 5.3 Baked Products Are Not Identity

Baked files may be renamed, moved, regenerated or combined. Their current path is an implementation detail. Registries resolve stable product references or generated cache keys rather than storing fragile absolute paths in saves or gameplay data.

## 5.4 Source and Product Hashes

A baked product should be traceable to:

- Source asset ID and version.
- Parent and inherited dependency versions.
- Override record IDs.
- Material and animation dependencies.
- Bake settings and tool version.
- Content-pack version.
- Result checksum or content hash.

This supports reproducible builds, cache invalidation and debugging.

# 6. Parent Definitions, Inheritance and Visual Families

## 6.1 Parent Family Purpose

Parent definitions provide shared fields so related assets stay consistent. A wooden chute family can define connection masks, default pivots, icon framing, collision approach and state contract. Oak, pine and fae-living-wood variants inherit those fields and replace only the relevant material or trim data.

## 6.2 Inheritance Order

```text
Base presentation template
    -> category family
    -> material or culture family
    -> specific presentation profile
    -> project/content/world override fields
    -> selected variants and runtime state layers
```

Each layer should store only intentional differences. The inspector must show inherited fields separately from locally authored fields.

## 6.3 Parent Selection Rules

Choose a parent when assets share:

- Placement and orientation rules.
- Connection topology.
- Required parts or sockets.
- Animation/state contracts.
- Collision family.
- Material role structure.
- Icon and preview logic.
- Visual category and player expectations.

Do not force inheritance between assets merely because they look vaguely similar. A chute and pipe may both transport resources, but their connection profiles, item presentation and animation contracts may differ enough to require separate parents.

## 6.4 Inheritance Safety

A parent change can affect many descendants. The Forge should display impacted children before approval and require a batch validation report. A breaking parent edit may require a new contract version rather than silently altering every child.

# 7. Override Scopes, Access and Authorisation

## 7.1 Override Scopes

| Scope | Purpose | Persistence |
| --- | --- | --- |
| Preview Override | Temporary experimentation in the current Forge session. | Not saved to production data. |
| Project Override | The active Leyforge development replacement layer. | Version controlled and shipped as approved project content. |
| Content-Pack Override | Replacement or extension supplied by an enabled pack. | Enabled by project/world configuration. |
| World-Specific Override | Presentation selected for one world or server where permitted. | Stored by stable pack/override reference in world metadata. |
| Debug Override | Diagnostic replacement used to expose sockets, states or missing references. | Development-only and never shipped. |

## 7.2 Access Tiers

| Access Tier | Allowed Actions |
| --- | --- |
| Viewer | Inspect IDs, provenance, resolved fields, dependencies and validation. |
| Artist/Creator | Create and edit Forge source assets and draft overrides within allowed categories. |
| Developer | Edit project overrides, contract-sensitive presentation fields, registry links and content-pack manifests. |
| Lead/Approver | Approve release status, exceptions, breaking migrations and project-level conflict resolutions. |
| Future Mod Creator | Create pack-scoped content within restricted schemas and permissions. |

## 7.3 Authorisation Boundary

Changing a model or texture is normally a presentation edit. Changing inventory capacity, recipe outputs, power consumption, mining hardness, NPC permissions or authoritative state is a gameplay edit. The Forge may link to the correct registry editor, but it must label the transition clearly and require the other system's validation.

# 8. Field-Level Override Data Model

## 8.1 Patch-Based Override

An override record contains only fields that intentionally differ. An empty field does not automatically mean remove the inherited value. The override must distinguish:

- Inherit.
- Replace.
- Clear/remove, where permitted.
- Merge by declared key.
- Append, where permitted.
- Disable, where a feature may be explicitly disabled.

## 8.2 Core Override Fields

```text
override_id
target_id
target_type
source_layer
content_pack_id
priority
parent_override_id
enabled
schema_version
contract_version_required
changed_fields
field_operations
dependency_refs
compatibility_range
author
created_at
modified_at
review_status
change_summary
validation_exceptions
checksum
```

## 8.3 Field Operation Rules

| Operation | Meaning | Example |
| --- | --- | --- |
| Inherit | Use the next valid lower layer. | Keep built-in collision. |
| Replace | Replace the complete field value. | Replace `model_ref`. |
| Clear | Remove an optional field explicitly. | Remove an ambient particle effect. |
| Merge by Key | Merge entries with stable internal keys. | Replace only `clip.ignite` in an animation map. |
| Append | Add entries where order is meaningful and schema permits it. | Add an optional preview environment. |
| Disable | Keep the inherited field known but prevent its use. | Disable nonessential ambient sound. |

Arrays should default to replacement unless their schema explicitly declares a stable-key merge. Silent index-based merging is too fragile for long-term content.

## 8.4 Explicit Null and Missing Data

The data format must distinguish an omitted field from an explicit clear. Otherwise, a creator attempting to remove an optional effect could accidentally inherit it again, or an old record could unintentionally clear a newly added parent field.

# 9. Resolution Order, Provenance and Fallback

## 9.1 Locked Resolution Hierarchy

```text
1. Built-in presentation definition
2. Project visual override
3. Enabled content-pack overrides
4. Permitted world-specific override
5. Temporary preview/debug override during development only
```

Temporary preview and debug layers are not valid shipping dependencies and are never written as permanent save identity.

## 9.2 Ordering Within a Layer

Within the same layer, resolution uses:

1. Declared dependency order.
2. Explicit pack or override priority.
3. Stable deterministic tie-breaker for diagnostics only.
4. Conflict status when equal-priority records replace the same field without an authorised relationship.

A deterministic tie-breaker prevents nondeterministic builds, but it does not make an unresolved design conflict acceptable for release.

## 9.3 Field Provenance

Every final field should retain provenance metadata:

- Source record ID.
- Source layer.
- Content-pack ID and version.
- Parent field or default used.
- Last editor and approval state where available.
- Validation warnings or exception record.

## 9.4 Fallback Behaviour

- Invalid override field -> inherit the next valid field.
- Missing optional variant -> use the parent/default variant.
- Missing animation clip -> use a safe static or fallback clip defined by the contract.
- Missing icon -> generate or use a standard placeholder only in development; release approval requires an accepted icon.
- Missing content pack -> gameplay definition remains and uses the last valid lower-layer presentation.
- Incompatible collision/footprint -> block the override from becoming active unless a migration is approved.
- Invalid state binding -> retain the previous valid binding or contract fallback.

## 9.5 Failure Must Be Visible

Fallback protects the game from broken content, but it should not hide development problems. The Forge and validation logs must show that fallback occurred, why it occurred and which field was rejected.

# 10. New Asset, Duplicate, Variant and Override Decision Rules

## 10.1 Decision Matrix

| Intention | Correct Action |
| --- | --- |
| Replace the current furnace visuals everywhere while keeping furnace behaviour. | Edit as Project Override. |
| Create a second furnace with different recipes or capacity. | Create a New Gameplay Asset and a new presentation profile. |
| Make an oak version and pine version with the same chute behaviour. | Create or extend a Variant Set or material-family child. |
| Use an existing sword as a starting point for a new weapon identity. | Duplicate as New Asset and assign a new stable gameplay ID. |
| Test a colour or animation change without saving it. | Use a Preview Override. |
| Change only the icon while keeping all world visuals. | Create a Field-Level Override for the icon presentation. |
| Change the footprint from one block to two blocks. | Use a contract-sensitive structural edit with placement migration, not a normal cosmetic override. |

## 10.2 New Asset Rule

Create a new asset when gameplay identity, placement identity, recipe identity, player-facing function or long-term content reference must be distinct.

## 10.3 Variant Rule

Use a variant when the object is still understood as the same gameplay definition and the differences can be selected through declared visual dimensions or controlled world context.

## 10.4 Override Rule

Use an override when the target should resolve to a new approved presentation without creating another player-facing content entry.

# 11. Model and Geometry Overrides

## 11.1 Supported Geometry Replacements

- Entire voxel model.
- One named part.
- Static geometry set.
- Generated construction-shape source.
- Directional connection geometry.
- LOD geometry.
- Held or dropped item geometry.
- Damage or special-state geometry layer.

## 11.2 Geometry Compatibility Checks

A geometry override must be checked against:

- World scale and origin.
- Placement footprint.
- Rotation and facing rules.
- Required connection masks.
- Required pivots and part names.
- Interaction anchors.
- Animation tracks.
- Occlusion and face-culling rules.
- Collision profile.
- Icon and held-item framing.
- Structure and blueprint use.

## 11.3 Part Preservation

When a model replaces an asset used by 21C animations, the required part and pivot contract must remain valid or be explicitly remapped. Removing `part.gear_drive` while inheriting an animation track that targets it is an invalid unresolved reference.

## 11.4 Geometry Override Example

A wooden chute redesign may replace:

- Side-wall silhouette.
- Visible nails or brackets.
- Lip and channel shape.
- Culture trim layer.

It should retain or correctly remap:

- Input and output connection faces.
- Directional orientation.
- Item-flow guide.
- Selection bounds.
- Placement footprint.
- Any filter or upgrade socket used by gameplay.

# 12. Texture, Palette and Material Overrides

## 12.1 Supported Surface Replacements

- Standard 32 x 32 block faces.
- Palette roles and colour values.
- Material DNA reference.
- Local material-role override.
- Albedo, emission, cut-out, roughness, metallic, height and normal channels.
- Connected-texture set.
- Deterministic variation masks.
- Culture, biome, weathering, damage or corruption overlay.

## 12.2 Material Inheritance

A model should refer to semantic material roles such as `primary_body`, `metal_trim`, `hot_core`, `rune_emission` or `glass_window` rather than hard-coding unrelated material files into every part. Variants and overrides can then substitute approved Material DNA while retaining the model.

## 12.3 Palette Compatibility

An override that removes a palette role used by animation or state layers must provide a remap. For example, an active furnace may animate `hot_core.emission_strength`; replacing the material without that role would break the presentation contract.

## 12.4 Connected and Generated Families

For construction blocks, a material override should propagate to eligible stairs, slabs, beams, pillars, roofs and walls through generated family rules where practical. One plank palette change should not require manually editing every shape unless a shape has an intentional custom override.

# 13. Animation, Effect, Audio and State-Binding Overrides

## 13.1 Dynamic Presentation Fields

- Complete animation set.
- Individual clip.
- Individual track with stable track key.
- Playback speed profile.
- Voxel-frame set.
- Material animation profile.
- Visibility/geometry-state mapping.
- Particle profile and socket mapping.
- Light profile.
- Audio cue and socket mapping.
- Runtime state binding.
- Transition rule.
- LOD policy within approved limits.
- Accessibility alternative.

## 13.2 Clip Merge Rules

Animation maps merge by stable clip ID. A project override may replace `clip.furnace.ignite` while inheriting `clip.furnace.process` and `clip.furnace.shutdown`. Track-level merging is permitted only where tracks have stable keys and the editor can validate the result.

## 13.3 State Contract Protection

The override may choose a different visual response to `output_blocked`, but it may not rename or delete the gameplay state value from the contract. If a critical state loses its only readable presentation, the Forge should block approval or require a documented accessibility-safe exception.

## 13.4 Effect and Audio Fallback

Missing nonessential particles or sounds can fall back silently at runtime after logging. Missing critical warning presentation must use a contract fallback such as a visible material indicator, UI marker or safe default cue.

# 14. Collision, Placement, Pivots, Sockets and Contract-Sensitive Overrides

## 14.1 Cosmetic Versus Contract-Sensitive Fields

| Field | Typical Classification | Approval Requirement |
| --- | --- | --- |
| Texture or palette | Cosmetic presentation | Standard visual validation. |
| Static model within existing bounds | Cosmetic presentation | Scale, silhouette and clipping validation. |
| Pivot used only by visual animation | Presentation contract | Animation remap and clip validation. |
| Effect or sound socket | Presentation contract | Socket reference and state validation. |
| Interaction anchor | Gameplay-facing presentation contract | Interaction and NPC test required. |
| Collision | Contract-sensitive | Placement, movement, combat and save validation. |
| Placement footprint | Structural/gameplay-facing | Explicit gameplay/structure migration required. |
| Automation port location | Gameplay-facing contract | Network, orientation and existing-world validation. |

## 14.2 Developer Freedom With Explicit Risk

The developer Forge may permit collision and footprint replacement, but it must not label those edits as harmless cosmetics. The interface should elevate them into a contract-sensitive workflow and show affected systems.

## 14.3 Required Socket Categories

- Interaction.
- Item input/output.
- Power or mana connection presentation.
- Effect.
- Audio.
- Light.
- Held-item grip.
- Projectile or tool origin where applicable.
- NPC work position.
- Structure attachment or modular connection.

## 14.4 Existing-World Placement

Changing collision or footprint for an asset already placed in saves can cause overlaps, inaccessible inventories or broken automation. Activation requires a migration policy such as preserve old collision until replaced, validate and relocate, convert to legacy visual, or block the breaking override.

# 15. Block, Item and Multi-Presentation Integration

## 15.1 Linked but Separate Records

A placeable furnace can involve:

- Block gameplay definition.
- Block presentation profile.
- Block item-form definition.
- Inventory icon profile.
- Held placement preview.
- Dropped-item presentation.
- UI inspection thumbnail.

These forms may share Forge source data, but each has its own scale, camera, pose or contract.

## 15.2 One Source, Multiple Representations

The Forge should permit one authored voxel source to produce:

- World mesh.
- Inventory icon.
- Hand or placement ghost.
- Dropped item.
- Blueprint thumbnail.
- Codex preview.

A field override can target one representation or the shared source. The inspector must warn when changing the shared source will rebake all representations.

## 15.3 Item Instance State

Quality, durability, enchantment and charge are gameplay instance data. The presentation resolver may select overlays or variants from those values, but it may not invent or save them as purely visual metadata.

## 15.4 Block State and Item Form Consistency

The item icon should still identify the block even if it cannot show every world state. Culture or material variants may use matching icons when the distinction matters to inventory and construction selection.

# 16. Variant System Identity and Classification

## 16.1 Variant Definition

A variant is a declared alternative presentation that remains within the same gameplay identity or parent family. It differs from an override because an override changes resolution for a target, while a variant creates selectable alternatives under that target.

## 16.2 Variant Categories

| Category | Examples | Typical Selection Source |
| --- | --- | --- |
| Material | Oak, pine, iron, steel, mythril. | Recipe input, construction choice, family selection. |
| Culture | Human forest, dwarven forge, elven living wood, goblin scrap. | Structure culture, faction, blueprint or creator choice. |
| Biome | Mossy temperate, dusty desert, damp swamp, frozen. | World context or explicit build palette. |
| Condition | New, weathered, damaged, repaired, burnt, ruined. | Runtime state, structure state or stored condition token. |
| Magic | Uncharged, charged, warded, corrupted, cleansed, overcharged. | Authoritative magic state. |
| Quality/Rarity | Crude, standard, refined, masterwork, legendary. | Authoritative item quality or rarity. |
| Season | Spring bloom, autumn leaves, winter snow. | World season and environment. |
| Seed Variation | Knot, crack, grain, edge wear, minor clutter. | Deterministic seed selector. |
| Upgrade | Reinforced frame, speed module, mana coil. | Installed gameplay upgrade. |
| Presentation Theme | Development test, accessibility-safe, low-spec simplified. | Project or player presentation setting. |

## 16.3 Variant Identity Rule

A variant may change silhouette when required, but it should remain recognisable as the same functional object unless it deliberately belongs to a new gameplay definition.

# 17. Material, Culture, Biome, Condition, Magic and Quality Variants

## 17.1 Material Variants

Material variants should prefer shared geometry and material-role substitution. Geometry changes are justified for thickness, joinery, crystal growth, metal reinforcement or other material-specific construction that affects silhouette.

## 17.2 Culture Variants

Culture variants can change:

- Trim shapes and motifs.
- Palette and material families.
- Roof, beam and bracket profiles.
- Rune or symbol language.
- Tool marks and construction style.
- Approved decorative attachments.

They must preserve required sockets, footprints and connection topology unless the culture version is a separate gameplay/structure definition.

## 17.3 Biome and Environment Variants

Biome presentation should usually use overlays, palette shifts and controlled attachments:

- Moss and dampness.
- Desert dust and bleaching.
- Snow and frost accumulation.
- Swamp grime.
- Salt weathering.
- Ashfall.
- Leyline glow or magical residue.

Biome variation must not make player-built materials unpredictably change identity. World settings or creator controls should decide whether built objects inherit local environmental overlays.

## 17.4 Condition Variants

Condition variants can be persistent structure states or runtime visual layers. Damage percentage should not require a unique complete model for every value. Use staged damage profiles, decals, material masks, removable parts and limited geometry variants.

## 17.5 Magic Variants

Magic variants may use:

- Emissive palette roles.
- Rune overlays.
- Floating or rotating parts.
- Material substitution.
- Particle and light profiles.
- Corruption or cleansing layers.

The selected magical state comes from authoritative magic, upgrade or world-state data.

## 17.6 Quality and Rarity Variants

Quality presentation should remain controlled. A masterwork sword may gain cleaner edges, better wrapping, subtle trim and refined material response. It should not become visually unrecognisable or create excessive particle noise for common use.

# 18. Runtime States Versus Persistent Variants

## 18.1 Distinction

| Concept | Example | Storage Rule |
| --- | --- | --- |
| Runtime State | Furnace is processing now. | Stored by gameplay system as required. |
| Persistent Condition | Structure is permanently burnt until repaired. | Stored as structure/block state. |
| Selected Variant | Player chose dwarven trim. | Store stable variant token if not derivable. |
| Deterministic Variation | This plank has knot pattern 3 from world seed. | Derive from stable seed unless explicit reroll must persist. |
| Override | Project replaced the base furnace model. | Project/content configuration, not per-instance save data. |

## 18.2 State Layers Are Not Variant Explosion

Powered, active, wet, damaged and corrupted should generally be layered through 21C state presentation rather than multiplied into full combinations such as `oak_furnace_active_damaged_wet_corrupted`. Variant data describes reusable choices; state layers describe current authoritative conditions.

## 18.3 Stored Variant Token

Store a stable variant token when:

- The player deliberately selected the appearance.
- The variant affects inventory distinction.
- The choice is not safely derivable from world context.
- A structure blueprint requires a specific culture/material appearance.
- Rerolling after reload would be visibly disruptive.

# 19. Deterministic Variant Selection and World Seeds

## 19.1 Deterministic Rule

The same stable inputs should select the same procedural visual variation. A typical selector may combine:

```text
world_seed
+ dimension_id
+ block_position or persistent_entity_id
+ gameplay_definition_id
+ variant_group_id
+ optional culture/biome context
```

## 19.2 Selection Sources

| Source | Use |
| --- | --- |
| Explicit Variant ID | Player, blueprint, item or structure deliberately selected it. |
| Gameplay Attribute | Quality, upgrade, material input or faction data chooses it. |
| World Context | Biome, season, culture territory or weather adds permitted layers. |
| Deterministic Seed | Minor non-gameplay variation such as knots or cracks. |
| Default Fallback | Used when no valid selector matches. |

## 19.3 Multiplayer Determinism

Clients should not independently choose random variants using local random state. The variant must be derived from shared stable inputs or supplied by the authority when the choice is gameplay-significant or explicitly selected.

## 19.4 Rerolling

A developer preview can reroll variants freely. Production rerolling should be explicit. If a player-facing system later permits rerolling decorative variation, it should store a stable reroll token rather than relying on transient random state.

# 20. Variant Composition, Compatibility and Combinatorial Control

## 20.1 Composition Order

A recommended visual composition order is:

```text
base geometry and material family
    -> selected material/culture geometry variant
    -> deterministic seed variation
    -> biome/season environment overlay
    -> persistent condition layer
    -> runtime functional and magic state layers
    -> critical warnings and accessibility presentation
```

## 20.2 Compatibility Tags

Variants and overlays should declare compatibility tags such as:

- `supports.snow_overlay`
- `supports.corruption_layer`
- `requires.material_role.hot_core`
- `requires.part.gear_drive`
- `forbids.transparent_body`
- `culture.dwarven`
- `shape.chute.straight`
- `contract.machine.furnace.v2`

## 20.3 Combinatorial Control Rules

- Prefer one base plus layered differences over complete combination assets.
- Use geometry variants only when silhouette or construction meaning changes.
- Limit simultaneous cosmetic overlays to a readable budget.
- Critical warning presentation may override lower-priority cosmetic layers.
- Do not generate combinations that fail contract tags.
- The Forge should preview high-risk combinations and report untested combinations.
- A content family may define approved combinations instead of allowing every theoretical mix.

## 20.4 First-Pass Layer Budget

A normal asset should aim for:

- One base profile.
- One selected material/culture geometry variant.
- One deterministic surface variation.
- Up to two ordinary environmental/condition overlays.
- Required runtime state layers.
- One critical warning layer that can suppress lower-priority decoration.

This is an authoring guideline rather than a permanent engine limit. 21F will define measured runtime budgets.

# 21. Registry Architecture and Core Contracts

## 21.1 Registry Roles

| Registry | Owns |
| --- | --- |
| Block Registry | Block identity, placement, mining, states, shape family and system links. |
| Item Registry | Inventory identity, stacks, durability, quality, equipment and block-item links. |
| Presentation Registry | Models, materials, animation profiles, icons, variants and presentation contracts. |
| Material Registry | Material DNA, palettes, channels, surface and shader behaviour. |
| Animation Registry | Clips, effects, state-binding profiles and runtime presentation graphs. |
| Structure Registry | Blueprint references, material substitution, culture palettes and construction states. |
| Content-Pack Registry | Enabled manifests, versions, dependencies, load order and permissions. |
| Migration Registry | ID aliases, version transformations and deprecation paths. |

## 21.2 Registry Link Example

```text
block.machine.basic_furnace
    presentation_profile_id: presentation.machine.basic_furnace.default
    presentation_contract_id: contract.machine.furnace.basic_v2
    block_item_id: item.block.basic_furnace
    recipe_set_id: recipeset.furnace.basic
    automation_profile_id: automation.machine.furnace.basic
```

The Forge edits `presentation_profile_id` through an approved override or edits the referenced profile fields. It does not replace the recipe or automation profile during a normal visual edit.

## 21.3 Registry Validation

Validation checks:

- Unique stable IDs.
- Required parent references.
- Valid presentation contract version.
- No missing model/material/animation references.
- Compatible block/item forms.
- Valid state bindings.
- Valid content-pack dependencies.
- No unresolved critical conflicts.
- Valid fallback chain.
- Migration coverage for deprecated IDs.

# 22. Stable IDs, Namespaces, Display Names and File Paths

## 22.1 Naming Convention

Use lowercase stable namespace IDs:

```text
namespace.category.name
namespace.category.subcategory.name
```

Examples:

```text
block.logistics.wooden_chute
presentation.logistics.wooden_chute.default
variantset.logistics.wooden_chute.materials
override.project.wooden_chute.visual_v2
material.wood.oak
clip.machine.furnace.ignite
contract.machine.furnace.basic_v2
pack.leyforge.project_visuals
```

## 22.2 ID Stability

After an ID is used in released saves or content, renaming it requires an explicit migration or alias. File reorganisation, display-name changes and visual replacement do not justify changing the stable gameplay ID.

## 22.3 File Paths

File paths should be generated or resolved from manifests where practical. A path is not identity. Moving a source file should update development metadata without breaking world saves, recipes or structure blueprints.

## 22.4 Human-Readable Labels

The Forge should show:

- Display name.
- Stable ID.
- Asset category.
- Source layer.
- Content pack.
- Review status.
- Current contract version.

# 23. References, Dependencies, Aliases, Deprecation and Replacement

## 23.1 Dependency Types

- Parent presentation.
- Material DNA.
- Palette.
- Model or named-part library.
- Animation and state-binding profile.
- Effect, light and audio profile.
- Presentation contract.
- Item/block linked form.
- Structure or blueprint family.
- Content-pack dependency.

## 23.2 Dependency Graph

The Forge should display direct dependencies and impacted dependants. Replacing a shared material can affect hundreds of assets, while replacing one local palette should affect only its target. Approval should reflect that impact radius.

## 23.3 Aliases

Aliases map an old stable ID to a current ID when a rename or consolidation is unavoidable. Alias chains should be flattened and validated. Aliases are migration tools, not a substitute for disciplined naming.

## 23.4 Deprecation States

| State | Behaviour |
| --- | --- |
| Active | Available for new content and existing saves. |
| Legacy | Supported for existing content but discouraged for new use. |
| Deprecated | Scheduled for replacement; migration path required. |
| Redirected | Old ID resolves through an alias to a replacement. |
| Removed | Only permitted after migration and compatibility policy are satisfied. |

## 23.5 Replacement Versus Override

A replacement migration changes identity references. An override changes the presentation resolved by the same identity. The Forge should use precise language so creators do not accidentally perform the wrong operation.

# 24. Content Packs, Manifests and Distribution Units

## 24.1 Content-Pack Purpose

A content pack is a versioned unit that may contain:

- New presentation profiles.
- New variants.
- Field-level overrides.
- New materials and palettes.
- Animation/effect profiles.
- Optional new gameplay definitions when permitted by broader mod schemas.
- Migration and alias records.
- Preview thumbnails and documentation.

## 24.2 Manifest Fields

```text
pack_id
display_name
version
author
schema_version
target_game_version
required_packs
optional_packs
incompatible_packs
load_priority
included_definition_ids
override_ids
variant_set_ids
migration_ids
multiplayer_policy
permissions_required
checksum_or_signature
review_status
```

## 24.3 Project Visual Pack

The main development override layer may be represented internally as `pack.leyforge.project_visuals`. This allows project visuals to use the same manifest, validation and versioning foundations as future content packs while retaining higher trust and developer permissions.

## 24.4 Pack Enablement

Enabling or disabling a pack should generate a preview of:

- Added definitions.
- Replaced fields.
- Conflicts.
- Missing dependencies.
- Affected saves/worlds.
- Fallback results if disabled.
- Required rebakes or cache invalidation.

# 25. Load Order, Conflict Detection and Merge Rules

## 25.1 Conflict Categories

| Conflict | Example | Default Response |
| --- | --- | --- |
| Duplicate Stable ID | Two packs define the same new presentation ID. | Block enablement unless one explicitly overrides the other. |
| Same Field Override | Two equal-priority packs replace `model_ref`. | Flag unresolved conflict for user/developer choice. |
| Contract Version Conflict | Override requires furnace contract v3 but game supplies v2. | Reject override and fall back. |
| Missing Dependency | Animation references absent named part. | Reject affected field and report. |
| Incompatible Variant | Snow overlay applied to unsupported transparent material. | Skip overlay and use declared fallback. |
| Migration Conflict | Two packs redirect the same old ID differently. | Block world load or pack combination until resolved. |
| Load Cycle | Pack A requires B while B requires A in invalid order. | Block enablement and show cycle. |

## 25.2 Merge Rules by Data Type

| Data Type | Default Rule |
| --- | --- |
| Scalar value | Highest valid resolved replacement wins. |
| Stable-key map | Merge by key; conflicting key follows priority/conflict rules. |
| Ordered array | Replace unless schema explicitly allows append. |
| Variant list | Merge by stable variant ID with duplicate conflict checks. |
| Animation clips | Merge by clip ID; tracks merge only by declared stable track key. |
| State bindings | Merge by state/binding key with critical-state validation. |
| Tags | Union for additive tags; explicit remove operation required to delete inherited tags. |
| Dependencies | Union plus validation; a patch cannot silently remove required dependencies. |

## 25.3 Conflict Resolution Choices

An authorised developer can:

- Choose one pack's field.
- Change pack priority.
- Create a project-level compatibility override.
- Disable one conflicting pack.
- Update dependency/version requirements.
- Record an approved exception.

The chosen resolution should be stored as data, not merely remembered in editor state.

# 26. Developer Editing, Compare, Revert and Promotion Workflow

## 26.1 Edit Existing Asset as Project Override

1. Open the asset from the browser or in-world developer inspector.
2. Review gameplay identity, presentation contract and resolved provenance.
3. Choose **Edit as Project Override**.
4. Select the fields to replace or begin with a draft full-profile override.
5. Edit models, textures, materials, animations or presentation metadata.
6. Validate required parts, sockets, states, collision and linked representations.
7. Compare base, current approved and draft override.
8. Preview representative variants and runtime states.
9. Save the draft override and rebake affected products.
10. Promote to review, approve or revert.

## 26.2 Safe Commands

- Open Original Read-Only.
- Edit as Project Override.
- Duplicate as New Asset.
- Create Variant From Current.
- Compare Resolved Layers.
- Compare With Last Approved.
- Revert Selected Field.
- Revert Selected Variant.
- Revert Entire Override.
- Disable Override.
- Promote Preview to Project Override.
- Convert Override to New Asset.
- Validate Existing Saves.
- Generate Compatibility Override.

## 26.3 Selective Revert

Reverting the furnace model should not automatically revert its approved animation override. Each field and stable-key child should be independently revertible where the schema supports it.

## 26.4 Promotion

A preview override becomes a project override only after it receives a stable override ID, target, schema version, provenance, dependency set and validation result. Temporary editor state must not be promoted through an opaque copy.

# 27. Approval Status, Review History and Change Provenance

## 27.1 Lifecycle Status

| Status | Meaning |
| --- | --- |
| Draft | Work in progress; not used by production worlds. |
| Preview Approved | Safe for controlled test scenes. |
| Review | Awaiting visual, technical or gameplay-contract review. |
| Approved | Active in the project/content configuration. |
| Deprecated | Still resolves but should be replaced. |
| Disabled | Stored but excluded from resolution. |
| Rejected | Retained in history but cannot become active. |

Planning status such as POC Required, Alpha, Beta or Final Game remains separate from review lifecycle.

## 27.2 Change Record

Each approval should retain:

- Previous resolved version.
- New override/variant version.
- Change summary.
- Changed fields.
- Validation report.
- Known exceptions.
- Reviewer/approver.
- Date and tool version.
- Linked migration or compatibility record.

## 27.3 Provenance in Exported Builds

Shipping builds do not need full editor history loaded at runtime, but build manifests should retain enough provenance to identify which pack and version supplied a problematic asset.

# 28. Hot Reload, Cache Invalidation and Live Preview

## 28.1 Hot-Reload Goals

The developer should be able to update an approved or preview visual and see it in a controlled test environment without rebuilding unrelated game content.

## 28.2 Dependency-Based Invalidation

Changing a field invalidates only dependent products where safe:

| Change | Expected Invalidation |
| --- | --- |
| Palette colour | Materials, affected textures, icons and previews. |
| Voxel model | Mesh, collision if generated, icons, previews and dependent animations if part topology changed. |
| One animation clip | That clip and presentation profile cache. |
| Material DNA parent | All inheriting products using affected roles. |
| Content-pack priority | Resolved profiles and caches for affected targets. |
| Presentation contract | All implementations and tests of that contract. |

## 28.3 Live Instance Refresh

Safe visual fields may refresh on existing runtime instances. Contract-sensitive changes such as collision, footprint or network port location should require controlled respawn, world reload or migration rather than unsafe in-place mutation.

## 28.4 Cache Key

A runtime cache key should include stable source identity, resolved override/variant versions, relevant context selectors, bake settings and tool/schema version.

# 29. Versioning, Migrations and Save Compatibility

## 29.1 Version Categories

- Schema version.
- Gameplay definition version.
- Presentation contract version.
- Forge source version.
- Baked product version/hash.
- Override record version.
- Content-pack version.
- World content-configuration version.

## 29.2 Save Identity Rule

A save normally stores:

- Stable gameplay definition ID.
- Gameplay runtime state.
- Persistent entity or block identity as required.
- Explicit variant token only when the choice must persist.
- World content-pack configuration and versions where permitted.

It should not store absolute model, texture or animation file paths.

## 29.3 Visual Replacement Compatibility

Replacing a furnace model through a project override should update its appearance in an existing save without changing the saved furnace ID. Processing progress, contents, fuel and connected automation remain intact because they belong to gameplay state.

## 29.4 Breaking Presentation Changes

A presentation change becomes migration-sensitive when it alters:

- Placement footprint.
- Collision with gameplay impact.
- Required interaction anchors.
- Automation, power or mana connection locations.
- Persistent selected variant IDs.
- Contract version.
- Linked block/item representation identity.

## 29.5 Missing Pack Behaviour

When a world-specific pack is missing:

1. Keep gameplay definitions that still exist in the base/project registries.
2. Resolve presentation through the next valid lower layer.
3. Replace missing optional variants with declared defaults.
4. Warn the user/developer about changed appearance.
5. Block loading only when a pack supplied required gameplay definitions or an unresolved migration makes safe continuation impossible.

# 30. Legacy Asset Migration and Visual Overhaul Conversion

## 30.1 Migration Goal

The current game can continue using manually coded/imported visuals while they are progressively converted to Forge-managed sources. Migration should not require every asset to be rebuilt before the first improved building can ship.

## 30.2 Legacy Wrapper Workflow

1. Identify the existing stable gameplay definition.
2. Inventory its model, textures, materials, animations, collision, icon and state references.
3. Create a presentation contract from actual gameplay requirements.
4. Create a Forge presentation profile that initially references the legacy products.
5. Validate the wrapper without changing appearance.
6. Reconstruct or import editable Forge sources one field at a time.
7. Create project overrides for the improved fields.
8. Compare old and new in representative worlds.
9. Approve the override and retain fallback until migration is stable.
10. Deprecate legacy products only after all dependants are converted.

## 30.3 Migration Priority

The first migration should focus on assets needed to finish buildings and prove the Forge:

- Core terrain and construction materials.
- Stairs, slabs, beams, roofs, windows and doors.
- Furnace and workbench.
- Storage and village props.
- Wooden chute and basic automation pieces.
- Mana crystal, mana furnace and ward lantern.
- Core tools and item icons.

## 30.4 No Big-Bang Requirement

Legacy and Forge-managed presentation may coexist during development. The registry must show which assets are wrapped, partially migrated or fully Forge-native.

# 31. Blueprint Designer, Structures, Worldgen and Generated Families

## 31.1 Blueprint References

Blueprints should reference stable block/material family IDs, not baked mesh paths. A project override can therefore improve the block visuals across existing blueprints without editing each structure.

## 31.2 Material Substitution

A structure blueprint may specify:

- Exact block ID.
- Material family tag.
- Culture palette.
- Approved variant set.
- Condition/state requirement.

The resolver selects the correct presentation after the structure system chooses the actual gameplay block/material definition.

## 31.3 Generated Shape Families

When a base construction material changes, eligible generated shapes should rebake through shared family rules. Custom shape overrides remain attached to their specific shape profile.

## 31.4 Worldgen Variants

World generation can select culture, biome and seed variants deterministically. The result must not depend on local file order or client-only random values.

## 31.5 Structure Damage and Repair

Structure condition is authoritative world state. Visual profiles provide compatible damaged, burnt, ruined, scaffold and repaired layers. Blueprint identity remains stable throughout those states.

# 32. Multiplayer, Server Content and Client Consistency

## 32.1 Authoritative Content Configuration

A multiplayer world or server should define the enabled gameplay and presentation content configuration. Clients must know which packs and versions are required, optional or cosmetic.

## 32.2 Pack Categories

| Category | Multiplayer Rule |
| --- | --- |
| Gameplay Pack | Must match authority; can affect definitions and saves. |
| Contract-Sensitive Presentation Pack | Must match when collision, sockets or critical state presentation changes. |
| Cosmetic Presentation Pack | May be client-selectable only if it cannot hide critical states or alter gameplay readability. |
| Accessibility Presentation Pack | May be client-selectable within approved state-communication rules. |

## 32.3 Critical State Consistency

Clients may use different approved cosmetic styling, but they must still receive and present authoritative states such as burning, overloaded, hostile, blocked or corrupted. A cosmetic pack cannot remove required warning channels.

## 32.4 Content Handshake

The connection process should compare:

- Required pack IDs and versions.
- Gameplay schema compatibility.
- Presentation contract compatibility.
- Checksums/signatures where required.
- Approved cosmetic divergence policy.

Exact networking implementation is deferred to 21F and later multiplayer engineering documents.

# 33. Permissions, Security and Future Modding Boundaries

## 33.1 Developer-First Rule

The first Forge version is a trusted developer tool. It may expose powerful overrides, registry remapping and contract-sensitive edits that are not appropriate for unrestricted player access.

## 33.2 Future Mod Permissions

A future mod edition may permit:

- New presentation profiles.
- Palette and material variants.
- Model, texture and animation overrides within contracts.
- New content-pack manifests.
- Restricted world-specific visual packs.

It may restrict:

- Core gameplay ID replacement.
- Save migrations.
- Collision and footprint changes.
- Authoritative state contract edits.
- Security-sensitive scripts.
- Unbounded shaders, particles or resource usage.

## 33.3 No Arbitrary Runtime Code

Visual content packs should prefer declarative resources and approved behaviours. Arbitrary executable scripts require a separate trust, sandbox and security model and are not part of the first Forge plan.

## 33.4 Ownership and Distribution Metadata

Future distribution may require author, licence, dependency, version, checksum/signature and attribution fields. These are included in manifest planning without designing a marketplace now.

# 34. Validation, Diagnostics, Release Gates and Recovery

## 34.1 Validation Categories

| Category | Checks |
| --- | --- |
| Identity | Unique IDs, valid namespace, no accidental gameplay-ID change. |
| Contract | Required parts, sockets, states, forms and versions exist. |
| Geometry | Scale, footprint, orientation, connection profiles and bounds. |
| Materials | Required roles, channels, palette references and shader class. |
| Animation | Valid parts, pivots, tracks, clips, state bindings and fallbacks. |
| Registry | Valid parents, dependencies, linked block/item forms and manifests. |
| Variants | Valid selectors, weights, compatibility, defaults and composition. |
| Conflict | No unresolved critical duplicate or same-field conflicts. |
| Save | Existing identities resolve; variant tokens and migrations remain valid. |
| Performance | Product budgets, layer counts, variant counts and cache impact. |
| Accessibility | Critical states retain readable non-motion/non-audio alternatives. |

## 34.2 Warning Levels

- **Info:** Valid inheritance, fallback or optional simplification.
- **Warning:** Review recommended; asset can remain in controlled preview.
- **Error:** Affected field rejected and fallback used.
- **Release Blocker:** Stable identity, migration, contract, save or critical-state failure prevents approval.

## 34.3 Recovery Tools

- Revert selected field.
- Revert to last approved override.
- Disable conflicting pack.
- Restore base presentation.
- Rebuild derived products.
- Clear runtime cache.
- Repair missing references through remap wizard.
- Run alias/migration repair.
- Export resolution and dependency report.
- Open affected save in compatibility test mode.

## 34.4 Release Gates

A project override cannot ship when it:

- Breaks a stable gameplay reference.
- Has no valid fallback.
- Changes collision/footprint without approved migration.
- Removes required critical-state presentation.
- Leaves unresolved equal-priority conflicts.
- Produces duplicate IDs or missing dependencies.
- Cannot load representative existing saves.
- Exceeds approved runtime budgets without exception.

# 35. Minimum Viable 21D Scope

## 35.1 Required MVP Features

- Stable gameplay and presentation IDs.
- Base presentation plus project override layer.
- Field-level inherit, replace, clear and stable-key merge operations.
- Provenance display for every resolved field.
- Model, texture/material and animation clip override.
- Variant set with explicit and deterministic selection.
- Material, culture/biome overlay and condition/state compatibility.
- Registry link validation.
- Compare base/current/draft.
- Revert selected field and entire override.
- Safe fallback after disabling or breaking an override.
- Basic content-pack manifest and deterministic priority.
- Conflict detection for duplicate IDs and same-field overrides.
- Hot reload in a controlled preview scene.
- Existing-save compatibility test.
- Legacy wrapper state for partially migrated assets.

## 35.2 Required MVP Test Assets

| Asset | Required Proof |
| --- | --- |
| Stone/Plank Construction Block | Texture/material override propagates to generated family and existing blueprint references. |
| Wooden Chute | Model override preserves connection contract; oak/pine or culture variant resolves deterministically. |
| Basic Furnace | Model, texture and one clip override while recipes, contents, fuel and save identity remain intact. |
| Iron Pickaxe | World/held/icon representations can be replaced selectively while item identity remains stable. |
| Mana Conduit or Ward Lantern | Material/emission variant and corruption/charged state layers remain compatible. |
| Conflict Test Asset | Two packs attempt to replace the same field and the Forge produces deterministic diagnostics and an explicit resolution workflow. |

## 35.3 Explicit MVP Deferrals

- Public mod browser or marketplace.
- Remote pack distribution.
- Arbitrary user scripts.
- Full cryptographic signing infrastructure.
- Complex per-player cosmetic entitlement systems.
- Automatic migration for every possible footprint change.
- Cross-game asset-pack standard.
- Full NPC, creature and monster creator integration.

# 36. Success Criteria and Acceptance Rules

The 21D system is successful when:

- A developer can replace an existing furnace's model, textures and animation without changing its gameplay ID or recipes.
- Existing saves load the same furnace inventory and processing state with the new approved presentation.
- The Forge clearly shows which fields are inherited and which are overridden.
- Reverting one field restores inheritance without deleting unrelated approved changes.
- Disabling an invalid override falls back to a valid base presentation.
- A wooden chute variant keeps direction and connection behaviour across material or culture presentations.
- Minor seed variation is deterministic across reloads and multiplayer clients.
- Runtime states layer over variants without requiring complete combination assets.
- Content-pack conflicts are detected before release and resolved through stored data.
- Blueprint and structure references survive visual replacement because they reference stable gameplay definitions.
- Contract-sensitive collision, footprint or socket changes are elevated into explicit validation and migration workflows.
- Legacy assets can be wrapped and migrated gradually rather than through a risky all-at-once conversion.
- The resolver produces reproducible runtime products and useful provenance reports.
- No visual override can silently change authoritative simulation values.

## 36.1 Asset Acceptance Questions

Before an override or variant is approved, reviewers should answer:

1. Does the target retain the correct stable gameplay identity?
2. Are overridden and inherited fields clearly declared?
3. Does the presentation satisfy the current contract?
4. Are required parts, pivots, sockets, states and forms valid?
5. Does the asset remain recognisable and readable?
6. Are variant selection and fallback deterministic?
7. Are state layers compatible with the selected variant?
8. Do existing blueprints, items and saves still resolve?
9. Are conflicts and dependency impacts understood?
10. Can the change be selectively reverted?
11. Does the runtime use baked products rather than editable source data?
12. Are performance and accessibility requirements met?

# 37. Relationships With Documents 21E-21G

| Document | Relationship to 21D |
| --- | --- |
| 21E - Forge UI/UX and Creator Workflow | Defines the asset browser, provenance inspector, override editor, compare views, conflict UI, variant manager, approval screens and recovery interactions required to operate 21D. |
| 21F - Forge Technical Implementation Plan | Defines Godot Resource classes, registries, manifests, resolver algorithms, cache keys, import/bake pipeline, hot reload, tests, packaging and performance implementation. |
| 21G - Visual Overhaul and Asset Migration Plan | Uses 21D workflows to audit, wrap, replace, approve and retire the current terrain, building, item, machine and magic visuals in production order. |

Later NPC, creature and monster creator documents may reuse stable identities, presentation contracts, variants, content packs, state bindings and override resolution while adding skeletal or creature-specific requirements.

# Appendix A. Override Record Field Template

| Field | Type | Required | Purpose |
| --- | --- | --- | --- |
| Override ID | Stable ID | Yes | Unique override identity. |
| Target ID | Stable ID | Yes | Presentation profile or permitted definition link being patched. |
| Target Type | Enum | Yes | Presentation, material, animation, variant set, registry link or other approved type. |
| Source Layer | Enum | Yes | Project, content pack, world or preview/debug. |
| Content Pack ID | Stable ID | Conditional | Pack that owns the override. |
| Priority | Integer | Yes | Deterministic ordering inside a layer. |
| Enabled | Boolean | Yes | Whether the record participates in resolution. |
| Schema Version | Version | Yes | Override schema compatibility. |
| Required Contract | Stable ID + version | Conditional | Presentation contract that must be satisfied. |
| Changed Fields | Map | Yes | Only intentional differences. |
| Field Operations | Map | Yes | Inherit, replace, clear, merge, append or disable. |
| Dependencies | ID list | Yes | Required profiles, materials, parts, clips, packs or contracts. |
| Compatibility Range | Version range | Recommended | Supported project/game versions. |
| Author | Text/ID | Recommended | Change provenance. |
| Change Summary | Text | Recommended | Human-readable intent. |
| Review Status | Enum | Yes | Draft, review, approved, deprecated, disabled or rejected. |
| Exceptions | ID list | Optional | Approved validation exceptions. |
| Checksum | Hash | Generated | Integrity and cache support. |

# Appendix B. Variant Set Field Template

| Field | Type | Purpose |
| --- | --- | --- |
| Variant Set ID | Stable ID | Unique family identity. |
| Parent Presentation ID | Stable ID | Base profile inherited by all variants. |
| Dimension | Enum | Material, culture, biome, condition, magic, quality, season, seed or upgrade. |
| Selector Source | Enum | Explicit, gameplay attribute, world context, deterministic seed or default. |
| Default Variant ID | Stable ID | Safe fallback. |
| Variant Entries | Stable-key map | Variants with weights, conditions and field patches. |
| Compatibility Tags | Tag set | Required, supported and forbidden combinations. |
| Composition Priority | Integer | Order relative to other dimensions/layers. |
| Seed Salt | Stable text/ID | Ensures reproducible random selection. |
| Persist Selection | Boolean | Whether a variant token must be stored. |
| Contract Version | Version | Required presentation contract. |
| Review Status | Enum | Lifecycle status. |

Example entry:

```text
variant_id: variant.chute.wood.oak
conditions:
  material_family: material.wood.oak
weight: 1.0
field_patch:
  material_dna_ref: material.wood.oak
  trim_palette_ref: palette.metal.iron_dark
compatibility:
  requires: [shape.chute.straight]
  supports: [overlay.weathering, overlay.snow]
```

# Appendix C. Presentation Registry Contract Template

| Field | Purpose |
| --- | --- |
| Contract ID and Version | Stable capability contract. |
| Gameplay Categories | Definitions allowed to use it. |
| Required Representations | World, icon, held, dropped, preview or other forms. |
| Required Parts | Named parts referenced by animation or interaction. |
| Required Pivots | Axles, hinges, doors, pistons or other transform origins. |
| Required Sockets | Interaction, input/output, power, mana, effects, audio, light, NPC work and grips. |
| Required State Inputs | Powered, active, blocked, damaged, heat, mana or other read-only values. |
| Required Critical Responses | Presentation that must remain readable. |
| Placement and Orientation | Footprint, facing and connection requirements. |
| Collision Class | Permitted collision contract. |
| Fallback Profile | Safe static or simplified presentation. |
| Supported Variant Dimensions | Variants allowed without a new contract. |
| Accessibility Requirements | Non-motion, non-audio and warning alternatives. |
| Migration Rules | Compatibility when the contract version changes. |

# Appendix D. Conflict and Resolution Matrix

| Scenario | Severity | Resolution |
| --- | --- | --- |
| Project override replaces model; content pack replaces texture. | Compatible | Resolve both fields and show mixed provenance. |
| Two equal-priority packs replace the same model. | Error/Conflict | Choose priority, disable one or create compatibility override. |
| Texture override removes required emission role. | Error | Reject material field and inherit fallback until remapped. |
| Model override removes animation pivot. | Error | Remap pivot/track or reject affected clip/model combination. |
| Biome overlay is unsupported by transparent material. | Warning/Error by contract | Skip overlay and use declared fallback. |
| Pack disabled after world used its optional visual variant. | Warning | Resolve default lower-layer presentation; preserve gameplay state. |
| Pack supplied unique gameplay definition and is missing. | Release/Load Blocker | Restore pack or run approved gameplay migration. |
| Footprint override affects placed structures. | Release Blocker | Approve structural migration or retain old contract. |
| Duplicate display name only. | Info/Warning | Allowed with clear IDs; improve naming if player-facing ambiguity exists. |
| Duplicate stable ID. | Release Blocker | Rename before release or supply explicit override relationship. |

# Appendix E. POC Override and Variant Test Matrix

| Test | Setup | Expected Result |
| --- | --- | --- |
| Furnace Model Override | Existing save with active furnace and inventory. | New model loads; inventory, fuel and process progress remain unchanged. |
| Clip-Only Override | Replace `clip.furnace.ignite`. | Other clips, effects and materials remain inherited. |
| Selective Revert | Revert furnace model only. | Model returns to base; approved clip override remains. |
| Broken Part Reference | Override model removes required gear part. | Validation rejects affected combination and uses fallback. |
| Chute Material Variant | Same chute definition with oak and pine variants. | Connections and orientation remain identical; selected material is deterministic. |
| Culture Variant in Blueprint | Forest-human and dwarven trims use same structure family. | Blueprint resolves correct visual family without changing block IDs. |
| Mana State Layer | Charged and corrupted layers combine on conduit. | Critical state remains readable and compatible with selected material variant. |
| Pack Conflict | Two packs replace the same texture field. | Conflict is reported and requires stored resolution. |
| Pack Removal | Disable optional visual pack used by a world. | World loads base presentation with warning and no gameplay loss. |
| Seed Determinism | Reload and connect second client. | Minor surface variant matches for the same stable inputs. |
| Legacy Wrapper | Existing imported asset is wrapped before reconstruction. | Appearance remains unchanged, registry provenance becomes visible. |
| Hot Reload | Change palette in controlled preview. | Dependent products refresh without rebuilding unrelated assets. |

# Appendix F. Glossary and Deferred Decisions

## Glossary

| Term | Meaning |
| --- | --- |
| Gameplay Definition | Stable functional record used by simulation, saves and cross-system references. |
| Presentation Profile | The visual and audible package resolved for a gameplay definition. |
| Presentation Contract | Required capabilities a profile must satisfy. |
| Override | A field-level patch that changes resolution for an existing target. |
| Variant | A selectable alternative inside one identity or family. |
| Provenance | Record of which layer, pack and version supplied a resolved field. |
| Fallback | Last valid inherited value used when a higher layer fails. |
| Content Pack | Versioned distribution unit containing definitions, variants or overrides. |
| Migration | Explicit transformation of IDs, schemas, contracts or saved data. |
| Legacy Wrapper | Forge registry/profile around an existing non-Forge visual asset. |
| Deterministic Variant | Visual difference selected reproducibly from stable inputs. |
| Contract-Sensitive Override | Presentation edit that can affect interaction, placement, collision or state readability. |

## Deferred Decisions

- Exact Godot `Resource` class structure and serialization format.
- Whether development manifests use JSON, YAML, native Godot resources or a hybrid source format.
- Final cache database and content-addressing method.
- Cryptographic signing and trusted distribution policy.
- Public mod-pack permissions and moderation.
- Final limits for active content packs and variant dimensions.
- Automated compatibility-patch generation depth.
- World-specific override UI and player-facing permissions.
- Cross-platform downloadable content delivery.
- Full NPC, creature and monster presentation contracts.
