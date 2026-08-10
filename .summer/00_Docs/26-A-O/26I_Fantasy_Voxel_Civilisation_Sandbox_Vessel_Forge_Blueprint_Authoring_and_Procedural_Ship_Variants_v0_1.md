# FANTASY VOXEL CIVILISATION SANDBOX
## DOCUMENT SET 26
# 26I - Vessel Forge, Blueprint Authoring and Procedural Ship Variants
*Version 0.1 - Detailed Design Bible and Technical Foundation Draft*

A unified Forge extension for authoring freeform voxel vessel blueprints, semantic structural roles, compartments, components, construction stages, movement-test profiles, material and culture families, deterministic procedural ship variants, player design libraries, preview products, validation evidence, runtime bakes, content packs and safe production integration.

Working design document - vessel blueprint, variant, creator and Forge integration foundation

| Field | Locked Direction |
| --- | --- |
| Document Role | Document 26I is the authoring authority for Vessel Forge source, vessel-blueprint families, semantic layers, procedural variants, preview configurations, test scenarios, package products and player-design intake. It does not become vessel runtime authority. |
| Core Philosophy | A vessel blueprint is not a frozen model or a single craftable boat item. It is editable voxel source plus explicit structural, functional, construction, variant and validation data that can produce many persistent Vessel Instances without replacing freeform building. |
| Forge Direction | Vessel Forge is a specialised workspace inside the existing Unified Forge established by Sets 21-23. It reuses the shared project manifest, stable IDs, material libraries, voxel tools, semantic markers, revision history, Icon Capture Studio, Test Laboratory, dependency graph, packaging and bake services. |
| Developer Direction | The full developer workspace may author official families, schemas, procedural grammars, world-content packages, migrations and approval evidence. It retains stronger permissions than any shipped player creator. |
| Player-Creator Direction | Provide two restricted but first-class player workflows: an in-world Shipwright Design Mode tied to a real assembly/worksite, and a world-independent Vessel Design Workshop for planning, libraries, safe sharing and test previews. Both use compatible contracts without exposing registry, migration, worldgen or unrestricted script authority. |
| Structural Boundary | 26F owns vessel architecture, local grids, roles, compartments, commissioning and Vessel Instance identity. 26I authors inputs and previews against 26F validators but may not redefine structural truth or certify a vessel by itself. |
| Movement Boundary | 26G owns buoyancy, stability, propulsion, steering, environmental forces, navigation and operational certification. Vessel Forge may run bounded preview adapters and store intended-use profiles, but production certification remains 26G-owned. |
| Construction Boundary | 26H owns world execution of construction, repair, refit and salvage. 26I authors stages, work metadata, support profiles and project-intake products but does not reserve stock, move workers or commit world resources. |
| Variant Direction | Use inheritance, material roles, modules, parameter sets, state deltas and seeded decoration before duplicating full ships. A geometry variant is justified only when hull form, silhouette, function, scale or construction meaning changes. |
| Procedural Direction | Procedural vessels are deterministic, inspectable and bakeable into explicit source revisions. No opaque generator may output an uneditable scene or bypass validators, provenance, budgets or package dependencies. |
| Technical Direction | Implement in Godot with GDScript-first shared Forge services and Summer Engine-assisted development under reviewable change controls. Canonical source remains voxel and data driven; meshes, collision, thumbnails, hydrostatic samples and LOD products are rebuildable outputs. |
| Scope Boundary | 26I does not define port economies, crew simulation, trade fleets, piracy, navies, naval combat, marine ecology or final progression. It exposes blueprint contracts consumed by 26J-26O. |

# DOCUMENT SET 26 - OCEANS, MARITIME CIVILISATION, VESSELS AND NAVAL SYSTEMS EXPANSION
# Document Purpose
Document 26I defines how Leyforge authors, tests, varies, packages and shares reusable vessel designs. It is the authoring bridge between the block-built vessel architecture established by 26F, the movement and certification model established by 26G, and the resource-conserving shipwright workflow established by 26H. The document specialises the existing Blueprint Forge rather than introducing an incompatible ship-design application.

The same foundation must support an official developer-authored fishing skiff, a culture-specific merchant sloop family, an NPC shipyard production plan, a player-created exploration vessel, a restored ancient hull, a damaged wreck variant and a deterministic fleet of related ships. These results may look and perform differently, but they must resolve through explicit source, stable IDs, declared dependencies and the same runtime intake contracts.

Vessel Forge must protect Leyforge's defining creative freedom. Players are not required to assemble ships from a restrictive kit of special hull blocks. Ordinary approved blocks, shapes and components remain valid where their material and connection capabilities support the assigned role. Forge tools help authors declare meaning, detect problems, create construction stages, preview movement evidence and derive reusable designs without turning every creative choice into a hidden formula.

The authoring system also addresses production scale. Leyforge cannot rely on hand-authoring every fishing boat, ferry, cargo vessel, pirate ship, naval hull, cultural style, damaged state and local variation as a complete independent asset. Controlled inheritance, modules, role-based palettes, parameterised hull grammars, seeded detail and state deltas allow broad variety while preserving readability, performance, provenance and validation.

A blueprint never becomes a live vessel merely because it passed an editor preview. An approved design is an immutable versioned source definition. 26H may resolve it into a site-specific construction project. 26F may commission the resulting assembly into a persistent Vessel Instance. 26G may then certify its actual current loading and environment. Existing player vessels are not silently regenerated when their source blueprint changes.
# Design Sources, Authority and Supersession

| Source | Authority Consumed by 26I | 26I Boundary |
| --- | --- | --- |
| 26A - Maritime Expansion Foundation | Dedicated Vessel Forge workspace, arbitrary-block shipbuilding, procedural/cultural variants, icons, stages, manifests and validation. | 26I operationalises the authoring scope without committing all generated vessel families to Core Production. |
| 26B - Water and Fluid Overhaul | Sealing, permeability, compartment fluids, pumping, water-body queries and bounded liquid simulation. | Forge previews call approved fluid interfaces; 26B remains liquid truth. |
| 26C - Marine World Generation | Marine regions, coasts, islands, harbour suitability, routes, wreck sockets and deterministic world identity. | 26I may preview placement contexts and variant filters; it does not place ports or regenerate oceans. |
| 26D - Marine Climate | Wind, waves, currents, tides, storms, ice, forecasting and sea-state queries. | Vessel Forge selects scenario inputs; 26D remains environmental authority. |
| 26E - Aquatic Player Interaction | Swimming, diving, ladders, boarding, underwater work and accessibility. | Forge validates authored access markers and work contexts; character movement remains 26E-owned. |
| 26F - Vessel Architecture | Vessel-local grids, structural roles, material facets, surfaces, compartments, components, commissioning and identity. | 26I authors source compatible with 26F and displays validator evidence. It does not approve structure through local editor guesses. |
| 26G - Vessel Movement | Mass, buoyancy, stability, propulsion, steering, anchoring, navigation, environment forces and certification. | 26I runs preview adapters and stores intended profiles. Actual instance certification is never baked into blueprint truth. |
| 26H - Shipwright Work | Worksites, stages, tasks, tools, NPC labour, repair, refit, salvage and project intake. | 26I exports design and work metadata. It does not execute or simulate hidden world labour. |
| 21A-21G - Voxel Asset Forge | Voxel source, materials, variants, overrides, UI, technical foundation, migration and generated products. | Vessel Forge extends these shared services and does not fork the asset pipeline. |
| 22A-22L - Entity and Blueprint Forge | Unified Forge workspaces, semantic blueprints, modules, markers, networks, inheritance, test lab, Godot implementation and player/developer boundary. | 26I specialises Blueprint Forge for mobile voxel vessels while preserving all shared governance. |
| 23A-23J - Presentation Forge | Anchors, sockets, paths, events, audio/VFX bindings, preview laboratories, accessibility and package production. | 26I stores stable references and test contexts; presentation assets remain owned by Set 23. |
| 19 and 20 - Settlement/Blueprint and Building Systems | Dual player blueprint creators, stage/resource contracts, functional semantics, developer versus player authority and instance separation. | 26I mirrors these proven layers for vessels and keeps blueprint, project and instance separate. |
| 25A-25L - Production Governance | Qualified IDs, schemas, relationships, capabilities, packs, migrations, validation, budgets, evidence and Summer Engine tasks. | Every 26I source, package, validator and production recommendation extends the Set 25 kernel. |

> **Supersession Rule**
>
> Where earlier documents imply that a vessel blueprint is only a copied block volume, that procedural generation may output opaque scenes, that a player creator may modify canonical registries, or that updating a blueprint should rebuild existing ships automatically, this document supersedes those implications. It does not supersede the shared Forge, registry, construction or runtime authorities listed above.

# Static Table of Contents
- 1. Locked Vessel Forge Identity
- 2. Design Principles and Experience Targets
- 3. Explicit Non-Goals
- 4. Source-of-Truth and Ownership Boundaries
- 5. Canonical Terminology
- 6. Record Architecture and Data Separation
- 7. Forge Workspace Architecture and Authoring Modes
- 8. Users, Roles, Permissions and Player Boundaries
- 9. Vessel Blueprint Categories, Families and Scale Bands
- 10. Stable IDs, Namespaces, Versioning and Internal Element Identity
- 11. Coordinate Frames, Bounds, Reference Planes and Authoring Volumes
- 12. Physical Voxel Composition, Shapes and Nested Source
- 13. Structural Role Layers, Inference Hints and Manual Overrides
- 14. Hull Surfaces, Openings, Sealing and Reference Waterlines
- 15. Compartments, Access, Habitability and Emergency Paths
- 16. Functional Components, Stations and Service Graphs
- 17. Propulsion, Steering, Anchoring and Navigation Authoring
- 18. Masts, Sails, Rigging, Lines and Flexible Structures
- 19. Spatial Anchors, Sockets, Regions, Paths and Event Hooks
- 20. Material Roles, Palettes, Substitution and Provenance
- 21. Construction Stages, Work Metadata and Project Export
- 22. Worksite, Launch, Support and Dry-Dock Profiles
- 23. Inheritance, Modules, Deltas, Upgrades and Refit Families
- 24. Importing Freeform Builds and Exporting Vessel Snapshots
- 25. Player Vessel Design Workshop and In-World Design Mode
- 26. Developer Authoring Workflow and Review Loop
- 27. Guided Templates, Symmetry, Mirroring and Assisted Editing
- 28. Procedural Vessel Family Architecture
- 29. Deterministic Parameters, Seeds and Generated Element Identity
- 30. Hull-Form Grammars, Sections and Fairing Assistance
- 31. Module Libraries, Connectors and Compatibility Contracts
- 32. Culture, Faction, Biome and Realm Variant Layers
- 33. Intended-Use, Loadout and Operational Variant Profiles
- 34. Age, Damage, Wreck, Repair and Restoration Variants
- 35. Procedural Decoration, Cargo, Clutter and Presentation Sockets
- 36. Variant Composition, Combinatorial Control and Family Budgets
- 37. 26F Structural and Commissioning Test Laboratory
- 38. 26G Buoyancy, Stability and Movement Preview Laboratory
- 39. 26H Construction, Support and Work-Package Laboratory
- 40. Environment, Scenario and Preview Matrix
- 41. UI/UX, Progressive Disclosure and Accessibility
- 42. Icon Capture, Miniatures, Maps and Codex Products
- 43. Validation, Reason Codes, Evidence and Release Gates
- 44. Lifecycle, Approval, Revision History and Collaborative Review
- 45. Packaging, Import, Export, Sharing and Package Safety
- 46. Migration, Existing Worlds, Compatibility and Recovery
- 47. Runtime Baking, Caches, Dependency Invalidation and Hot Reload
- 48. Godot/Summer Engine Technical Architecture
- 49. Performance, Scalability, Testing and Production Batches
- 50. Cross-Document Integration and 26J Handoff
- Appendix A. Core Vessel Blueprint Record Templates
- Appendix B. Procedural Family and Generator Templates
- Appendix C. Semantic Layer and Marker Catalogue
- Appendix D. Validation and Reason-Code Catalogue
- Appendix E. Test Laboratory and Preview Matrix
- Appendix F. Player Blueprint Package Contract
- Appendix G. Completion Checklist

# 1. Locked Vessel Forge Identity
Vessel Forge is the vessel-specialist workspace inside the unified Leyforge Forge. It creates canonical editable vessel-blueprint source and authoring evidence. It does not replace Asset Forge, Entity Forge, Blueprint Forge, Presentation Forge, Shipwright gameplay, vessel runtime architecture or movement simulation.
> **Locked Rule**
>
> A Vessel Forge blueprint must remain an editable, inspectable and versioned voxel design whose physical composition, semantic meaning, construction plan, procedural rules and generated products are separate layers. A changed visual palette must not rewrite structural roles; a changed blueprint must not rewrite an existing Vessel Instance; and a successful preview must not impersonate runtime certification.

| Identity Layer | Meaning | Result |
| --- | --- | --- |
| Editable Voxel Source | Sparse vessel-local cells, shaped pieces, nested modules and explicit component placements. | Design remains inspectable, diffable and rebuildable. |
| Semantic Vessel Contract | Roles, compartments, surfaces, openings, components, access, sockets and intended-use profiles. | 26F-26H can understand the design without inferring everything from appearance. |
| Variant Family | Controlled inheritance, parameters, palettes, modules, states and deterministic selections. | Many ships can share a coherent family without copy-paste drift. |
| Authoring Evidence | Validation reports, scenario outputs, preview captures, dependency locks and approvals. | Production decisions remain reviewable and testable. |
| Generated Products | Meshes, collision proxies, hydrostatic samples, icons, LODs and compact runtime manifests. | Runtime can be efficient while source remains voxel-first. |
| Persistent Instance Separation | A built ship stores identity, state, loading, damage, occupants and history outside the blueprint. | Worlds remember unique vessels and never reduce them to regenerated templates. |

# 2. Design Principles and Experience Targets
- Preserve arbitrary-block creativity while making structural and operational consequences understandable.
- Reuse the Unified Forge interaction grammar, library, manifest, dependency and lifecycle systems.
- Offer simple guided workflows for small craft and expert inspection for complex vessels.
- Use explicit semantic layers instead of relying on visual guessing or hidden hardcoded ship classes.
- Generate variety through controlled parameters and modules, not uncontrolled random noise.
- Make every generated result reproducible, inspectable and convertible into explicit source.
- Keep official developer authoring and player-facing creation compatible but appropriately permissioned.
- Test structure, movement and construction through adapters owned by 26F-26H.
- Protect player worlds, blueprint libraries and vessel history through stable IDs and migrations.
- Avoid a tool-first production trap: the first Forge delivery must produce playable, constructible vessel content.

## 2.1 Experience Bands

| Band | Typical User | Expected Experience |
| --- | --- | --- |
| Guided Small Craft | New player or content contributor. | Choose a template, resize within limits, paint materials, place required components, receive direct fixes and export a buildable plan. |
| Creative Freeform | Builder/player designer. | Shape arbitrary hulls, import an assembly, assign roles, define stages and test multiple loadouts. |
| Systemic Specialist | Shipwright, technical designer or reviewer. | Inspect structural graphs, compartments, mass estimates, work faces, service networks and evidence. |
| Family Author | Developer content designer. | Create inheritance trees, modules, procedural grammars, culture packs, batch previews and release packages. |
| Production Maintainer | Registry/package owner. | Manage migrations, dependency locks, validation gates, budgets and replacement policies. |

# 3. Explicit Non-Goals
- Creating a second asset database, second blueprint format or second presentation pipeline.
- Replacing freeform in-world shipbuilding with mandatory templates.
- Running full fluid, wave or rigid-body simulation inside every editor frame.
- Embedding authoritative economy, crew AI, combat outcome, quest logic or route selection inside a blueprint.
- Allowing player packages to execute arbitrary scripts or mutate canonical namespaces.
- Generating complete opaque scenes that cannot be edited or traced to source parameters.
- Using procedural variety to disguise missing core vessel families or inadequate art direction.
- Guaranteeing that every valid structure is useful, fast or suitable for every sea condition.
- Automatically applying blueprint revisions to already built vessels.
- Authoring final ports, fleets, piracy, navies, marine ecology or the full maritime progression layer.

# 4. Source-of-Truth and Ownership Boundaries

| Truth | Owning Authority | 26I Rights |
| --- | --- | --- |
| Block, item, material and component identity | 03-06 and Set 25 registries. | Reference, filter, preview and request approved extensions. |
| Forge source, project manifest, dependencies and generated presentation products | Sets 21-23. | Extend with vessel source types and specialist bake jobs. |
| Vessel structural model and commissioning | 26F. | Author compatible data, call validators and display evidence. |
| Buoyancy, stability, movement and navigation certification | 26G. | Run bounded preview scenarios through an adapter; store no false certification. |
| Construction, repair, refit and salvage execution | 26H. | Author stage/work metadata and export project intake. |
| Live vessel inventories, occupants, fluids, damage and history | Runtime systems and Vessel Instance records. | Never edit directly from blueprint source. |
| Player personal designs | Player Blueprint Library under restricted schema. | Import, validate, migrate and package through safe services. |
| Official vessel definitions and procedural families | Vessel Forge namespace owner. | Create, approve, deprecate and migrate under Set 25 governance. |
| Ports, crews, fleets and naval content | 26J-26L. | Expose intended-use tags and component/socket contracts only. |

> **No Authority Leakage**
>
> The viewport may visualise data from other systems, but presentation does not become ownership. A green buoyancy preview is evidence from a selected scenario and revision; it is not a permanent property guaranteeing that every constructed instance will float under every load.

# 5. Canonical Terminology

| Term | Definition |
| --- | --- |
| Vessel Blueprint | Immutable approved definition containing source composition and semantic vessel contracts. |
| Vessel Blueprint Revision | Versioned snapshot of one blueprint source and dependency lock. |
| Vessel Family | Related blueprints and generated variants sharing design language, modules or inheritance. |
| Base Hull | Core geometry and structural semantics before use, culture, loadout or state layers. |
| Variant Profile | Rules that modify permitted source, materials, modules, decoration or state without changing identity unexpectedly. |
| Procedural Family Definition | Deterministic parameter grammar that generates valid candidate blueprint revisions. |
| Generated Candidate | Unapproved explicit result produced from a family definition and seed. |
| Baked Variant | Generated result frozen into ordinary editable blueprint source. |
| Player Blueprint | Restricted personal/community design using safe references and owned namespace. |
| Authoring Layer | Separately editable physical, structural, compartment, component, network, construction or presentation data. |
| Reference Plane | Declared centreline, baseline, deck plane, intended waterline or station plane used for authoring. |
| Station | Longitudinal cross-section location used by hull grammar and review tools; distinct from a gameplay workstation. |
| Module | Nested reusable vessel sub-blueprint with declared connectors and compatibility. |
| Role Hint | Authored evidence assisting 26F inference; not a replacement for structural validation. |
| Intended-Use Profile | Design target such as river, sheltered coastal, open-sea cargo or fast patrol; not runtime approval. |
| Preview Scenario | Versioned environment, load, damage and control inputs used to request 26F-26H evidence. |
| Source Bake | Deterministic conversion from editable source to runtime/editor products. |
| Family Budget | Limits on variation dimensions, modules, materials, geometry and products to control production complexity. |

# 6. Record Architecture and Data Separation

| Record | Purpose | Mutability |
| --- | --- | --- |
| Vessel Blueprint Definition | Stable family identity, source, semantic layers, profiles and dependencies. | Draft-editable; immutable after approved revision. |
| Blueprint Revision Record | Hash, schema, parent, author, change summary and dependency lock. | Immutable. |
| Procedural Family Definition | Parameters, constraints, grammar, module pools and validation policy. | Versioned authoring source. |
| Generated Candidate Record | Seed, resolved parameters, generated elements, warnings and source hash. | Mutable until accepted or discarded. |
| Variant Profile | Culture, biome, role, state, material or decoration composition rules. | Versioned definition. |
| Preview Scenario Definition | Environment, loading, damage, support, controls and expected evidence. | Reusable/versioned. |
| Validation Evidence Bundle | Reports from Forge, 26F, 26G and 26H adapters plus budget/provenance checks. | Immutable for submitted revision. |
| Baked Product Manifest | Generated mesh, collision, sample, thumbnail, LOD and cache products. | Rebuildable. |
| Player Blueprint Package | Restricted source, references, thumbnails, declared dependencies and safety report. | Versioned user content. |
| Construction Intake Product | Resolved stage, material-role, support and work metadata exported to 26H. | Generated per blueprint revision/profile. |
| Vessel Instance | One commissioned ship with unique state and history. | Runtime mutable; not owned by 26I. |

## 6.1 Definition, Project and Instance Separation
The Vessel Blueprint states what may be built. A resolved construction intake binds it to material and work metadata. A 26H project states what is being built at a site. A 26F Vessel Instance records what was actually commissioned. The same blueprint may produce thousands of different instances; a unique player ship may have no source blueprint until deliberately captured.
# 7. Forge Workspace Architecture and Authoring Modes
```text
Leyforge Forge
├── Asset Forge
├── Entity Forge
├── Blueprint Forge
│   ├── Building and World Blueprints
│   └── Vessel Forge
│       ├── Vessel Composition
│       ├── Structural Roles and Hull Semantics
│       ├── Compartments and Access
│       ├── Components and Service Networks
│       ├── Construction and Refit Stages
│       ├── Variants and Procedural Families
│       ├── Vessel Test Laboratory
│       └── Package and Runtime Bake
├── Presentation Forge
├── Review
└── Project Settings
```

| Authoring Mode | Primary Purpose |
| --- | --- |
| Composition Mode | Place/edit voxel cells, shapes, props and nested modules. |
| Structural Mode | Assign roles, inference hints, support groups, hull surfaces and critical groups. |
| Compartment Mode | Author bulkheads, openings, zones, access, habitability and emergency routes. |
| Component Mode | Place functional components, sockets, clearances and attachment contracts. |
| Network Mode | Author service graph endpoints and allowed routes. |
| Construction Mode | Define stage graphs, work faces, temporary supports and project metadata. |
| Variant Mode | Create inheritance, palettes, parameter sets, state deltas and batch combinations. |
| Generator Mode | Edit procedural family graphs and inspect explicit generated candidates. |
| Test Mode | Run selected 26F-26H scenarios and compare evidence. |
| Review Mode | Compare revisions, comments, conflicts, evidence and approval status. |
| Capture Mode | Create icons, miniatures, diagrams and presentation products. |

# 8. Users, Roles, Permissions and Player Boundaries

| Role | Capabilities |
| --- | --- |
| Viewer | Preview source, variants, dependencies, evidence and approved products. |
| Contributor | Create drafts and edit permitted official namespaces. |
| Vessel Designer | Edit composition, semantics, stages, modules and test profiles. |
| Procedural Family Author | Edit generators, constraints, parameter schemas and batch matrices. |
| Reviewer/Shipwright Specialist | Review 26F/26H evidence, construction feasibility and material roles. |
| Movement Reviewer | Review 26G preview evidence, intended-use limits and scenario coverage. |
| Maintainer | Manage schemas, migrations, package versions, deprecation and dependency locks. |
| Administrator | Manage namespace ownership, global settings and release gates. |
| Player Creator | Use restricted personal blueprint tools and safe package features. |

## 8.1 Developer Versus Player Authority

| Capability | Developer Vessel Forge | Player Vessel Design Tools |
| --- | --- | --- |
| Canonical namespaces | Yes, by permission. | No; personal/community namespace only. |
| Registry/schema editing | Yes, governed. | No. |
| Worldgen and NPC production pools | Yes. | No direct access; submission/review may promote content. |
| Migration authoring | Yes. | Only automatic supported migration. |
| Procedural generator authoring | Full bounded graph/parameter access. | Preset parameters and permitted module pools only by default. |
| Semantic vessel roles | Full. | Safe supported subset with guided validation. |
| Construction stages | Full. | Personal stages within limits; no arbitrary transaction code. |
| Scripts/plugins | Reviewed developer add-ons only. | Prohibited in shareable packages. |
| Packaging | Official and development packages. | Script-free personal/community packages. |
| Approval | May submit/approve by role. | May save/share; official promotion requires review. |

# 9. Vessel Blueprint Categories, Families and Scale Bands

| Category | Examples | Authoring Emphasis |
| --- | --- | --- |
| Simple Watercraft | Raft, coracle, canoe, punt, rowboat. | Minimal structure, hand propulsion, easy player templates. |
| Working Small Craft | Fishing boat, tender, ferry, pilot boat. | Cargo/work stations, coastal use and NPC production. |
| Sailing Vessels | Sloop, cutter, dhow-like, junk-like, longship-inspired forms. | Rig, sail plan, wind profiles and culture identity. |
| Cargo and Trade Vessels | Barge, coaster, merchant vessel, bulk carrier fantasy equivalents. | Hold volumes, loading, stability and route classes. |
| Exploration Vessels | Survey ship, diving support, ice vessel, realm expedition ship. | Specialist components and hazard profiles. |
| Military-Capable Hulls | Patrol craft, escort, warship, siege barge. | Hardpoints and defence contracts; combat implementation deferred to 26L. |
| Magitech Vessels | Mana drive ship, rune vessel, hybrid engine/sail craft. | Power, mana, stability and failure interfaces. |
| Submersible/Specialist | Diving bell carrier, submersible, floating platform. | Special physics profiles and likely later production tiers. |
| Historic/Wreck/Restoration | Ancient hull, derelict, ruined ship, museum vessel. | State deltas, missing evidence and provenance. |

| Scale Band | Typical Authoring Scope | Default Tool Behaviour |
| --- | --- | --- |
| V0 Micro | 1-2 occupants; very small craft. | Guided template and direct cell editing. |
| V1 Small | Small crew; local water use. | Full source with simplified graphs. |
| V2 Medium | Working/coastal vessel. | Compartments, components, stages and scenarios required. |
| V3 Large | Open-sea merchant or military hull. | Module editing, batch validation and stricter budgets. |
| V4 Very Large | Major fleet or civilisation project. | Special approval, segmented source and production evidence. |
| V5 Extraordinary | Floating fortress, city ship, realm vessel. | Deferred/conditional; requires explicit architecture review. |

# 10. Stable IDs, Namespaces, Versioning and Internal Element Identity
```yaml
leyforge.core.blueprint.vessel.merchant_sloop
leyforge.riverward.vessel.fishing_boat_small
player.<account_or_local_namespace>.vessel.blueprint.<slug>
leyforge.core.vessel_family.coastal_workboat
leyforge.core.vessel_variant_profile.weathered_coastal
leyforge.core.vessel_generator.merchant_sloop_family
```

Every persistent source element that may be referenced by a child, state, stage, generator or migration receives stable internal identity. Element IDs survive ordinary movement or property changes and are retired through explicit deletion records rather than positional guessing.

| Identity Type | Example | Rule |
| --- | --- | --- |
| Blueprint ID | `leyforge.core.blueprint.vessel.merchant_sloop` | Stable logical definition. |
| Revision ID | Qualified ID plus semantic version/hash. | Immutable source snapshot. |
| Element ID | `elem.frame.014` | Stable within blueprint lineage. |
| Module Instance ID | `module.forecastle.01` | Stable nested-source reference. |
| Stage ID | `stage.hull_close` | Stable construction mapping. |
| Parameter ID | `param.length_station_count` | Stable generator control. |
| Variant Channel | `variant.culture_palette` | Deterministic resolution channel. |
| Preview Scenario ID | `scenario.open_sea_loaded_gale` | Repeatable test identity. |

## 10.1 Version Compatibility
- Schema version identifies data shape.
- Blueprint semantic version identifies author intent.
- Dependency lock records exact required revisions or compatible ranges.
- Bake version identifies generated-product format.
- Runtime compatibility profile states which game/registry versions may consume the source.
- Player packages preserve original source and run migrations into a new revision rather than editing the only copy.

# 11. Coordinate Frames, Bounds, Reference Planes and Authoring Volumes

| Frame/Plane | Purpose |
| --- | --- |
| Vessel Local Frame | Matches 26F vessel coordinates and orientation. |
| Centreline Plane | Port/starboard authoring, symmetry and structural review. |
| Baseline | Vertical reference for draft, hull stations and construction support. |
| Intended Waterline | Design target for previews; not actual runtime waterline. |
| Primary Deck Plane | Reference for access and module alignment. |
| Station Planes | Longitudinal sections for hull grammar and diagnostics. |
| Component Local Frames | Mount orientation and moving/rotating subassemblies. |
| Construction Work Volumes | Scaffold, crane, worker and support envelopes. |
| Clearance Volumes | Propeller, rudder, sail, oar, weapon or machinery operation spaces. |
| Presentation Bounds | Icon framing and LOD product generation. |

Bounds are sparse and may be segmented for large vessels. Editing outside declared bounds requires an explicit expansion operation so nested modules, stages, generator parameters, previews and budgets can be revalidated.
# 12. Physical Voxel Composition, Shapes and Nested Source
Vessel composition reuses approved blocks, shaped blocks, Forge assets and component definitions. It does not create a special duplicate block identity merely because a block is placed on a ship. Local source stores stable references, rotation, shape, state defaults, material-role binding and element identity.

| Source Element | Stored Data |
| --- | --- |
| Voxel Cell | Block ID/material role, local cell, shape, rotation, default state, element ID. |
| Compound Asset | Asset ID, local transform, attachment, clearance and state profile. |
| Functional Component | Component definition, mount, ports, control references and role. |
| Nested Module | Blueprint/module revision, transform, connector mapping and override delta. |
| Flexible Structure Source | Topology/anchor references for sails, lines or bounded flexible elements. |
| Procedural Region | Generator channel, bounds, rules, seed and baked placements where required. |

## 12.1 Shape-Aware Authoring
- Slabs, stairs, slopes and curved-looking voxel families contribute partial volume and surface orientation through registered shape facets.
- Beams and posts may declare directional connection semantics.
- Windows, grates and doors retain opening/sealing states.
- Decorative props never gain structural or sealing roles without an explicit compatible facet.
- The Forge flags visual intersections, isolated cells and unsupported compound assets but does not assume all disconnected decoration is invalid.

# 13. Structural Role Layers, Inference Hints and Manual Overrides

| Layer | Examples | Authority Meaning |
| --- | --- | --- |
| Primary Structure | Keel/spine, frames, longitudinal supports, load paths. | Authored role intent consumed by 26F. |
| Hull Boundary | Outer shell, inner shell, armour, sacrificial covering. | Assists surface and sealing analysis. |
| Deck/Bulkhead | Decks, partitions, collision bulkheads and watertight boundaries. | Assists compartments and access. |
| Superstructure | Cabins, towers, deckhouses and non-primary upperworks. | Mass/access and damage grouping. |
| Ballast/Load Zones | Fixed ballast, adjustable ballast and cargo-design zones. | Preview and operational configuration intent. |
| Critical Groups | Steering foundation, mast step, engine bed, pump room. | Dependency and damage review. |
| Decorative/Excluded | Pure decoration, temporary guide or non-vessel work element. | Prevents accidental role inference. |

## 13.1 Inference Assistance
Vessel Forge may suggest roles from symmetry, orientation, neighbourhood, material suitability and selected templates. Suggestions display confidence and reasons. An author may accept, reject or override them, but 26F still validates the completed design. Batch actions never silently overwrite approved manual role assignments.
## 13.2 Role Coverage Views
- Heat map by role and confidence.
- Unassigned structural-looking cells.
- Role/material suitability conflicts.
- Primary-support continuity.
- Critical component foundation coverage.
- Role changes between revisions.

# 14. Hull Surfaces, Openings, Sealing and Reference Waterlines
The authoring workspace exposes hull-surface and sealing layers derived through 26F-compatible analysis. Authors may mark intentional openings, closures, scuppers, hatches, sea chests, vents and permeable areas. A declared opening is not a leak when its state and control contract are valid; an undeclared gap receives a diagnostic.

| Authored Element | Required Data |
| --- | --- |
| Hull Surface Group | Element membership, inside/outside expectation, material/seal role. |
| Opening | Boundary, purpose, default state, closure component and access. |
| Closure | Door/hatch/gate ID, sealing class, controls and failure state. |
| Drain/Scupper | Flow direction, capacity reference and compartment relationship. |
| Intended Waterline | Reference plane and design-load scenario. |
| Freeboard Target Zone | Desired minimum band by intended-use profile. |
| Underwater Service Opening | Intake/output role, valve, grate and maintenance access. |

## 14.1 Seal Preview
Seal preview reports suspected gaps, conflicting surfaces, openings below intended waterline, inaccessible closures and material limitations. It may run bounded fluid tests through 26B but stores only evidence and source metadata, not live fluid state.
# 15. Compartments, Access, Habitability and Emergency Paths
Compartment authoring combines explicit boundary intent with 26F discovery. Authors may name design compartments, declare expected lineage and attach uses such as hold, engine room, crew space, ballast tank, magazine, pump room or void. Actual commissioned compartments remain 26F runtime records.

| Semantic Data | Purpose |
| --- | --- |
| Expected Compartment Zone | Author intent and stable design reference. |
| Bulkhead Boundary Group | Defines intended separating structure. |
| Door/Hatch Connection | Access, sealing and emergency-state rules. |
| Primary Route | Normal crew/passenger movement. |
| Emergency Route | Escape, rescue or damage-control path. |
| Vertical Access | Ladder, stair, lift or climb marker. |
| Headroom/Clearance Zone | Entity compatibility and work access. |
| Habitability Marker | Berth, shelter, light, ventilation and service expectations. |
| Restricted Zone | Ownership, hazard or specialist access intent. |

## 15.1 Compartment Comparison
The Test Laboratory overlays expected compartments against 26F-discovered compartments and highlights splits, merges, leaks, disconnected access, trapped spaces and state-dependent changes.
# 16. Functional Components, Stations and Service Graphs
Functional components remain definitions owned by their gameplay registries. Vessel Forge places instances and declares mounts, clearances, ports, controls and service relationships. A decorative wheel does not become a helm; a visual crate does not become inventory; a modelled engine does not create thrust without an approved component contract.

| Component Family | Authoring Requirements |
| --- | --- |
| Helm/Control | Control station, authority scope, sight/access and steering-provider links. |
| Propulsion | Mount, thrust/origin contract, power/fuel/mana, clearances and controls. |
| Steering | Rudder/fin/thrust vector provider, articulation limits and damage group. |
| Pumps and Damage Control | Fluid endpoints, capacity reference, power, controls and maintenance. |
| Storage/Hold | Capacity class, access, loading route, ownership and cargo-zone relationship. |
| Crew/Passenger | Berths, stations, seating, shelter and emergency access. |
| Navigation | Instrument mount, knowledge inputs and observation requirements. |
| Anchoring/Mooring | Anchor/winch/bollard sockets, line paths and load foundation. |
| Power/Mana | Source, storage, network ports, safety zones and failure handling. |
| Defence/Weapon Hardpoint | Mount and clearance contract only; combat rules deferred to 26L. |

## 16.1 Typed Service Graphs
- Mechanical power.
- Electrical-like power where supported.
- Fuel and fluid service.
- Mana and rune control.
- Command and control.
- Item/logistics transfer.
- Damage-control and bilge service.
- Navigation/sensor information.

# 17. Propulsion, Steering, Anchoring and Navigation Authoring

| Authoring Profile | Fields |
| --- | --- |
| Sail Plan | Sail elements, mast/yard anchors, control lines, reef states and wind limits. |
| Oar/Paddle Bank | Stations, stroke clearance, crew compatibility and side grouping. |
| Paddle Wheel | Axis, immersion target, drive connection and guard clearance. |
| Propeller/Thruster | Shaft/drive, thrust axis, water clearance and damage zone. |
| Mana Drive | Core, field anchors, power path, stabilisation and failure references. |
| Rudder/Steering Surface | Pivot, range, water exposure, control link and structural foundation. |
| Anchor System | Anchor type, line/chain path, winch/capstan, hawse and storage. |
| Mooring Layout | Bollards/cleats, fairleads, line paths and safe access. |
| Navigation Fit | Helm, chart table, compass/instruments, lookout and signal points. |

The Forge validates provider arrangement and requests 26G preview evidence. It does not calculate permanent thrust or handling statistics from author-authored numbers alone; gameplay components and current vessel state remain authoritative.
# 18. Masts, Sails, Rigging, Lines and Flexible Structures
Flexible maritime elements require explicit topology rather than thousands of unconstrained physics objects. The source defines named anchors, segments, control groups, visual surfaces, damage sections and LOD behaviour. Runtime physics may use simplified ropes, bones, curves or aggregate forces according to approved profiles.

| Source Type | Authoring Model |
| --- | --- |
| Mast/Spar | Voxel/compound rigid source with structural foundation and attachment sockets. |
| Standing Rigging | Anchor-to-anchor support lines with tension class and failure sections. |
| Running Rigging | Control paths, interaction points and animation state references. |
| Sail | Bounded surface/topology, material, reef states, wind-force profile reference and damage regions. |
| Tow/Mooring Line | Socket roles, length class, load class and runtime provider reference. |
| Net/Cargo Sling | Bounded flexible visual/interaction profile; not a general cloth simulator. |

## 18.1 Rig Variant Rules
- Rig changes that materially alter propulsion or centre of effort create a new variant/revision and invalidate movement evidence.
- Culture presentation may replace shapes and materials only within compatible force/mount contracts.
- Damaged sails and broken rigging use state deltas and named sections.
- LOD may collapse individual lines into grouped presentation while preserving gameplay provider state.

# 19. Spatial Anchors, Sockets, Regions, Paths and Event Hooks
Vessel Forge extends the shared 23B semantic anchor system rather than storing raw node paths. Anchors survive model, material, variant and LOD changes through stable roles and remapping.

| Family | Examples |
| --- | --- |
| Structural | `vessel.keel_reference`, `vessel.mast_step`, `vessel.engine_bed`, `vessel.lift_point.*`. |
| Movement | `vessel.thrust_origin.*`, `vessel.rudder_pivot.*`, `vessel.anchor_drop.*`. |
| Crew | `vessel.helm`, `vessel.lookout.*`, `vessel.oar_station.*`, `vessel.damage_control.*`. |
| Access | `vessel.boarding.*`, `vessel.ladder.*`, `vessel.emergency_exit.*`. |
| Cargo | `vessel.loading_port.*`, `vessel.hold.*`, `vessel.crane_pick.*`. |
| Presentation | `vessel.wake.*`, `vessel.spray.*`, `vessel.flag.*`, `vessel.bell`, `vessel.light.*`. |
| Combat Future | `vessel.hardpoint.*`, `vessel.boarding_hook.*`, `vessel.damage_fx.*`. |
| Construction | `work.delivery.*`, `work.scaffold.*`, `work.cradle.*`, `work.inspect.*`. |

## 19.1 Event Hook Boundary
Blueprints reference governed presentation events such as launch, sail-set, engine-start, leak-warning, grounding, stage-complete and damage-state-change. They do not call audio, VFX or gameplay methods directly.
# 20. Material Roles, Palettes, Substitution and Provenance

| Material Role | Typical Requirements |
| --- | --- |
| `hull_primary` | Seal suitability, durability, repair family and appearance. |
| `frame_primary` | Structural support suitability and compatible fasteners. |
| `deck_primary` | Walkable surface, weather response and repair. |
| `bulkhead_primary` | Partition/seal role and opening compatibility. |
| `armour_outer` | Protection role, mass implications and attachment. |
| `ballast_fixed` | Density, containment and placement constraints. |
| `rig_structural` | Mast/spar or support-line compatibility. |
| `sail_cloth` | Sail profile compatibility, wear and culture palette. |
| `trim_decorative` | Visual identity without structural assumptions. |
| `realm_stabiliser` | Special capability/exclusion/fallback contract. |

Role resolution uses Set 25 capabilities, suitability, exclusions and fallbacks. A palette may choose exact materials, families or bounded substitutions. The editor shows changes to estimated mass, sealing, repair and construction evidence when a palette changes.
## 20.1 Provenance
- Every official palette records owning culture/pack and source revision.
- Generated candidates record the exact resolved materials and fallback reasons.
- Player designs store references and optional substitutions rather than copying protected source assets.
- Imported packages preserve creator, licence, dependency and migration metadata.
- AI-assisted palette suggestions are marked in the change ledger and require ordinary validation.

# 21. Construction Stages, Work Metadata and Project Export
Vessel Forge authors a logical construction stage graph compatible with 26H. Stages identify which final cells/components appear, which temporary supports exist, what work faces and tools are needed, and which inspections or prerequisites gate progression. Exact world transactions are resolved and committed by 26H.

| Stage Data | Purpose |
| --- | --- |
| Stage ID and Order/Dependencies | Stable graph and branching/rework relationships. |
| Added/Removed Elements | Final source delta for the stage. |
| Temporary Elements | Scaffold, cradle, shore, template and guide roles. |
| Material Roles and Components | Inputs resolved later through palettes and recipes. |
| Work Faces/Zones | Where actors/tools must reach. |
| Tool/Skill Capabilities | Required work methods without hardcoding one item where tags suffice. |
| Support Requirements | Static support envelope before/after commit. |
| Inspection Gate | Seal, alignment, structural, component or launch review. |
| Partial Function | Which systems may activate during fit-out. |
| Cancellation/Rework Metadata | Safe rollback, salvage and conflict behaviour. |

## 21.1 Stage Playback
The stage scrubber shows final geometry, temporary work, worker access, delivery paths, material totals, role coverage and expected validation changes at every step. A stage that traps its builders, removes required support too early or references a later component fails authoring validation.
# 22. Worksite, Launch, Support and Dry-Dock Profiles

| Profile | Authored Information |
| --- | --- |
| Beach/Bank Build | Slope range, tide/water relationship, launch direction and simple support. |
| Slipway | Cradle connectors, track/run alignment, launch envelope and haul-out compatibility. |
| Building Berth | Foundation/support zones, crane reach, stock/delivery and water transfer. |
| Graving Dock | Dock floor supports, gate clearance, pump/drain interfaces and work access. |
| Floating Dock | Dock connector positions, combined bounds and support/load interfaces. |
| Alongside Fit-Out | Mooring, gangway, crane and restricted underwater work zones. |
| Magical/Realm Support | Named provider capabilities, mana, failure and legality references. |

A blueprint may support several worksite profiles. 26H selects and validates the actual site. Forge previews expose incompatibilities but never guarantee that every generated coastline or shipyard can build the design.
# 23. Inheritance, Modules, Deltas, Upgrades and Refit Families
```text
Base Coastal Workboat
├── Fishing Workboat
│   ├── Riverward Fishing Variant
│   └── Cold-Coast Fishing Variant
├── Passenger Ferry
└── Harbour Utility Boat
    └── Mana-Assisted Utility Variant
```

| Delta Type | Examples |
| --- | --- |
| Physical | Add/remove/move/replace voxel elements. |
| Semantic | Change role, zone, marker or expected compartment. |
| Component | Add engine, change rig, replace pump or alter helm. |
| Network | Add/remove endpoint or route. |
| Construction | Add stage, modify work face or change support. |
| Variant | Change palette, parameter, module pool or decoration channel. |
| State | Damage, age, occupation, corruption or restoration. |
| Profile | Change intended use, load scenario or supported worksite. |

## 23.1 Rebase and Conflict Handling
- Safe parent changes inherit automatically only when no child override conflicts.
- Moved/removed internal elements produce explicit remap tasks.
- Generated children preserve parameter and generator revision evidence.
- Side-by-side hull sections and role maps show conflicts.
- Approved child source is never silently overwritten.

## 23.2 Refit Blueprint Families
A refit profile may define an allowed transition between two revisions, required removed/added elements, 26H work stages, identity-continuity recommendation and invalidated 26G evidence. It does not itself decide whether one world vessel retains identity; 26H/26F apply runtime continuity rules.
# 24. Importing Freeform Builds and Exporting Vessel Snapshots
A player or developer may select a candidate assembly, invoke the 26F scan and import an explicit vessel-source snapshot into Vessel Forge. The import records provenance, original world/instance references where permitted, unresolved roles, components, compartments, material bindings and source warnings.
1. Select connected assembly or commissioned vessel revision through an authorised command.
2. Copy eligible source cells and referenced definitions into vessel-local source data.
3. Record stable mappings from world/local cells to new source element IDs.
4. Import explicit role overrides and component semantics; do not copy mutable inventories or NPC state.
5. Run dependency, structure, sealing, access and source-budget validation.
6. Choose personal blueprint, official draft or one-time archived snapshot destination.
7. Create a new blueprint revision; never make the live Vessel Instance the editable source.
8. Export construction/stage authoring as a separate deliberate step.

## 24.1 Snapshot Limitations
- Cargo contents, crew, damage history and quest bindings remain instance data.
- Instance-specific wear may become an optional state/variant, not the base blueprint automatically.
- Unknown or missing pack content enters quarantine with placeholders and references.
- Protected official content cannot be repackaged as self-contained player source without rights.

# 25. Player Vessel Design Workshop and In-World Design Mode
## 25.1 Main-Menu Vessel Design Workshop
The world-independent Workshop lets players create and organise vessel designs without loading a save. It uses unlocked or permitted content libraries, neutral test water, selectable environment presets and safe parameter templates. Drafting is free; building in survival still consumes real resources and knowledge.
- Create from blank hull, approved template, personal design or imported safe package.
- Edit voxel composition and supported semantic layers.
- Use symmetry, section and palette tools.
- Define personal construction stages within safe schema.
- Run bounded structure/movement/construction previews.
- Save variants, thumbnails and personal collections.
- Export script-free packages and dependency lists.

## 25.2 In-World Shipwright Design Mode
The in-world mode operates against a real candidate assembly or registered worksite. It can capture terrain/water/support context, current unlocked materials, available stock, permissions and shipyard capability. It may project ghost plans and submit a design to 26H, but does not spend resources until the world project begins.
- Select/capture a connected assembly.
- Compare current versus target blueprint.
- Assign roles and components with direct world highlights.
- Resolve a material palette from known stock or leave permitted substitutions.
- Preview work stages, blockers and project cost.
- Submit a new build, refit or personal-blueprint capture.

## 25.3 Player Safety and Knowledge Rules
- Unknown blocks/components remain hidden, hinted or unresolved according to knowledge state.
- Players cannot bypass progression by importing unavailable gameplay definitions.
- Community packages may contain references to locked content but cannot grant it.
- Invalid designs remain editable and explainable rather than being destroyed.
- World/server settings may restrict blueprint sharing, size, complexity and vessel operation.

# 26. Developer Authoring Workflow and Review Loop
1. Choose or create vessel family, blueprint or procedural-family definition.
2. Set stable identity, namespace, parent, intended-use and scale profile.
3. Define local frame, bounds, stations, design planes and source modules.
4. Compose voxel hull and functional assets.
5. Author structural roles, surfaces, compartments, access and critical groups.
6. Place components, service graphs, anchors, sockets and presentation hooks.
7. Define palettes, variants, parameters, construction stages and support profiles.
8. Run source validation and resolve missing dependencies.
9. Run selected 26F, 26G and 26H laboratory scenarios.
10. Compare family matrix, culture/state variants and performance budgets.
11. Capture icons/diagrams and generate runtime products.
12. Submit revision with evidence; review, approve and package through Set 25 gates.

## 26.1 Review Questions
- Does the design remain recognisable across intended palettes and LODs?
- Do role hints agree with structure and material capabilities?
- Are compartments, openings and emergency routes coherent?
- Can the selected worksites and stage graph actually construct it?
- Does the intended-use scenario have adequate preview evidence?
- Are procedural variants meaningfully distinct without exploding production cost?
- Can missing optional dependencies fall back safely?
- Will source changes preserve existing world vessels and child blueprints?

# 27. Guided Templates, Symmetry, Mirroring and Assisted Editing

| Tool | Purpose | Safety Rule |
| --- | --- | --- |
| Centreline Symmetry | Mirror selected source across vessel centreline. | Preserve stable mirrored element pairing and surface orientation. |
| Radial/Repeated Placement | Oar stations, ribs, windows, stanchions. | Generate explicit elements with deterministic IDs. |
| Station Section Editor | Edit longitudinal hull cross-sections. | Fairing output remains voxel source and is fully reviewable. |
| Deck/Floor Fill | Fill bounded walkable surfaces. | Does not cross exclusions/openings silently. |
| Bulkhead Wizard | Create boundary with doors/hatches. | Runs compartment/access validation. |
| Role Paint/Selection | Assign structural/semantic roles by element or region. | Shows material and overlap conflicts. |
| Component Placement Guide | Snap approved component mounts and clearances. | Never creates the gameplay component without explicit placement. |
| Repair/Refit Diff Tool | Compare source revisions and derive work deltas. | All generated changes require acceptance. |
| Suggestion Assistant | Propose fixes, stages or palettes. | No silent commit; provenance and reasons recorded. |

## 27.1 Creative Freedom Rule
Assistance defaults to optional. Authors may build asymmetrical, unconventional or fantastical vessels. The tool reports consequences and incompatible intended-use assumptions rather than enforcing a single historical ship shape.
# 28. Procedural Vessel Family Architecture
A Procedural Vessel Family Definition is a controlled source generator, not a runtime random ship spawner by itself. It declares a parameter schema, hull grammar, module pools, constraints, material roles, semantic-generation rules, stage-generation rules, scenario policy and family budget. Each generated candidate becomes explicit source with its own identity and evidence.
```text
Procedural Vessel Family
├── Parameter Schema
├── Hull Grammar
├── Structural Role Generator
├── Module Pools and Connectors
├── Component/Loadout Rules
├── Material and Culture Profiles
├── Construction Stage Generator
├── Decoration Channels
├── Constraint/Repair Passes
├── Preview Scenario Policy
└── Candidate Approval/Bake Policy
```

## 28.1 Generator Output Classes

| Output | Use |
| --- | --- |
| Preview Candidate | Temporary editor result for exploration. |
| Named Official Variant | Approved explicit blueprint revision. |
| Seeded NPC Production Variant | Deterministic blueprint source resolved for a settlement/faction. |
| Player Parameter Variant | Personal design derived from permitted presets. |
| Batch Test Corpus | Non-shipped candidates for validator/performance coverage. |
| Worldgen Wreck/Derelict Source | Approved variant plus explicit state profile, consumed by later world content. |

# 29. Deterministic Parameters, Seeds and Generated Element Identity

| Parameter Family | Examples |
| --- | --- |
| Principal Dimensions | Length stations, beam, depth, freeboard target. |
| Hull Form | Bow/stern family, fullness, chine/rounding approximation, sheer/deck line. |
| Structural Spacing | Frame/rib spacing, deck supports, bulkhead count. |
| Capacity | Hold length, crew-space target, passenger/cargo ratio. |
| Propulsion | Rig family, sail count, oar bank, engine slot, mana drive option. |
| Culture/Style | Palette, prow/stern motifs, roof/deckhouse forms, ornament density. |
| Environment | River draft, coastal freeboard, ice reinforcement, realm protection. |
| State | Age, wear, damage, repairs, occupation and clutter. |

```text
candidate_seed = hash(
  procedural_family_revision,
  owning_context_id,
  world_or_library_seed,
  requested_variant_channel
)

element_id = hash(
  generator_node_id,
  semantic_role,
  station_index,
  local_ordinal
)
```

Generated element identity must be stable when unrelated parameters change. Where a change necessarily restructures the hull, the generator emits lineage/remap evidence instead of pretending all elements survived.
## 29.1 Randomness Restrictions
- No use of wall-clock time for production generation.
- No client-local random selection for authoritative variants.
- Every random channel is named and independently seeded.
- Changing decoration seed does not change hull structure.
- Changing culture palette does not silently change component capability.
- Generator repairs and constraint fallbacks are recorded with reason codes.

# 30. Hull-Form Grammars, Sections and Fairing Assistance
Hull grammars provide a design language for generated and assisted source while retaining voxel editability. A grammar may define station sections, longitudinal curves, deck lines, stem/stern profiles and rules for converting continuous design intent into approved voxel shapes.

| Grammar Layer | Examples |
| --- | --- |
| Station Layout | Named bow, midship, transition and stern stations. |
| Cross-Section Profile | Flat-bottom, V-like, rounded voxel approximation, multi-chine, barge form. |
| Longitudinal Form | Sheer, rocker, taper and fullness progression. |
| Deck/Superstructure Envelope | Deck heights, cabin zones and reserved clearances. |
| Structural Skeleton | Keel/spine, frame placement and longitudinal supports. |
| Shell Resolution | Allowed blocks/shapes, thickness and surface continuity. |
| Opening Exclusions | Propulsion, rudder, intake, hatch and loading openings. |

## 30.1 Fairing Assistance
Fairing tools identify abrupt surface steps, inconsistent mirrored sections and avoidable drag/silhouette discontinuities. They suggest explicit voxel edits and show impact estimates. They do not prohibit intentionally stepped fantasy hulls or claim real naval-architecture precision.
# 31. Module Libraries, Connectors and Compatibility Contracts

| Module Family | Examples |
| --- | --- |
| Bow/Stern | Prow, transom, steering stern, ram-compatible future form. |
| Midbody | Cargo bay, passenger section, oar section, engine room. |
| Deckhouse | Cabin, chart room, galley, crew quarters. |
| Propulsion | Mast/rig set, paddle-wheel assembly, engine/shaft set, mana drive. |
| Utility | Pump room, crane, diving support, fishing gear, cold-storage module. |
| Defence Future | Armour section, hardpoint foundation, boarding protection. |
| Shipyard/Construction | Cradle adapter, lift points, stage templates. |

Each connector declares coordinate frame, boundary shape, structural role continuity, surface/seal contract, deck/access alignment, service ports, allowed scale/material profiles and conflict exclusions.
## 31.1 Module Rules
- Nested modules retain source identity and may expose bounded overrides.
- Circular dependencies are prohibited.
- Connector compatibility is validated before placement.
- A module may be flattened into explicit source for custom editing, preserving provenance.
- Module variants cannot change connector contract without a new compatible version.
- Player packages may reference approved modules but cannot redefine official connector semantics.

# 32. Culture, Faction, Biome and Realm Variant Layers

| Variant Layer | May Change | Must Preserve Unless New Blueprint |
| --- | --- | --- |
| Culture | Materials, silhouettes within family, ornament, sail pattern, deckhouse style, naming and module preferences. | Stable structural/function contracts and required clearances. |
| Faction | Banners, colours, occupation props, permitted loadouts and condition. | Underlying culture/blueprint identity unless deliberate conversion. |
| Biome/Climate | Roofing, drainage, ice reinforcement, ventilation, corrosion protection and palette. | Required role capability and safe work/component access. |
| Realm/Magic | Stabilisers, wards, special materials, conduits and presentation. | Explicit realm capability/exclusion contracts. |
| History/Age | Repairs, patina, replaced sections, clutter and wear. | Provenance and state lineage. |

## 32.1 Culture Pack Structure
```yaml
vessel_culture_pack
  palette_profiles
  permitted_hull_families
  preferred_modules
  rig_and_sail_profiles
  ornament_and_flag_sets
  naming_profiles
  construction_techniques
  variant_weights
  exclusions_and_fallbacks
  preview_matrix
```

Culture packs may prefer or exclude vessel forms according to lore and technology, but ancestry never hardcodes morality or ship capability. Faction ownership is a separate layer.
# 33. Intended-Use, Loadout and Operational Variant Profiles

| Profile Type | Examples | Boundary |
| --- | --- | --- |
| Water/Route Use | River, lake, harbour, sheltered coast, open sea, ice, realm route. | Design target only; 26G certifies instances. |
| Civil Use | Fishing, ferry, cargo, salvage, exploration, construction support. | 26J/26K own economy and fleet use. |
| Military-Capable | Patrol, escort, troop transport, siege support. | 26L owns combat systems and balance. |
| Loading Profile | Light, standard cargo, maximum cargo, passenger, ballast configuration. | Preview scenario, not fixed runtime load. |
| Crew Profile | Minimum operation, standard crew, passenger evacuation. | Later crew system owns staffing. |
| Hazard Profile | Storm, cold, corruption, dimensional exposure. | Environmental systems remain authoritative. |

A loadout variant may add/remove components, modules and stages. Presentation-only occupation sets are separate from gameplay loadouts. The editor labels which changes invalidate structural, movement or construction evidence.
# 34. Age, Damage, Wreck, Repair and Restoration Variants

| State Layer | Authored Content |
| --- | --- |
| New/Refined | Clean material, complete fit-out and baseline presentation. |
| Working/Worn | Patina, patches, ordinary replacements and reduced presentation quality. |
| Damaged | Missing/changed elements by named damage group, disabled components and hazards. |
| Flooded/Grounded/Capsized | Scenario/state presentation and access deltas; runtime truth remains external. |
| Derelict/Wreck | Collapsed sections, debris sockets, salvage markers, missing components and discovery evidence. |
| Occupied/Captured | Banners, traps, storage ownership defaults and faction props. |
| Repaired | Documented replacements and residual limitations. |
| Restored | Target revision, recreated sections, provenance labels and staged restoration. |

## 34.1 State Delta Rule
State variants store deltas from a named source revision. A wreck is not generated by randomly deleting arbitrary cells without ensuring stable debris, access, salvage and world-placement evidence. Later 26L damage may produce instance-specific wrecks not identical to authored state variants.
# 35. Procedural Decoration, Cargo, Clutter and Presentation Sockets

| Socket Channel | Possible Contents | Restrictions |
| --- | --- | --- |
| Deck Clutter | Coils, barrels, tools, nets, spare parts. | Path, control and emergency-route exclusions. |
| Hold Staging | Empty crates, sample cargo presentation, dunnage. | Does not create real inventory or cargo mass. |
| Crew Life | Hammocks, cookware, charts, personal items. | Capacity and culture filters; not persistent NPC possessions. |
| Faction/Culture | Banners, shields, carvings, lanterns. | Rights and palette filters. |
| Damage/Wear | Patches, broken rails, stains, loose debris. | Must correspond to allowed state profile. |
| Wild/Abandoned | Plants, nests, sediment, barnacles. | Biome/time and collision/path rules. |
| Magic | Runes, glow emitters, ward ornaments. | Presentation bindings do not create mana function. |

Each socket defines stable seed channel, count range, asset tags, orientation, collision exclusions, ownership/state filters and LOD policy. The resolved selection is stored or reproducible from authoritative inputs.
# 36. Variant Composition, Combinatorial Control and Family Budgets
Variant layers compose in a declared order. The Forge calculates the theoretical and approved combination counts and requires exclusions or baked signature variants when uncontrolled multiplication would exceed family budgets.
```text
Base Blueprint
  -> Geometry/Scale Variant
  -> Culture Palette and Modules
  -> Intended-Use/Loadout
  -> Biome/Realm Adaptation
  -> Age/State Delta
  -> Seeded Decoration
  -> Local Approved Override
```

| Control | Purpose |
| --- | --- |
| Compatibility Matrix | Prevents invalid layer combinations. |
| Priority/Precedence | Resolves which layer owns a field. |
| Signature Variant | Hand-approved exception with deliberate unique source. |
| Family Budget | Caps geometry variants, modules, materials, state products and captures. |
| Batch Validator | Tests every approved combination or statistically complete bounded sample. |
| Fallback Profile | Defines safe material/module/presentation result when optional content is absent. |
| Promotion Rule | States when a generated candidate becomes named official content. |

# 37. 26F Structural and Commissioning Test Laboratory

| Scenario/Test | Evidence |
| --- | --- |
| Connected Assembly | Disconnected groups, excluded work/support cells and source bounds. |
| Role Coverage | Unassigned cells, conflicts, confidence and suitability. |
| Primary Support | Structural graph continuity and critical foundation links. |
| Surface/Opening | Hull surfaces, gaps, closure states and below-waterline openings. |
| Compartment Discovery | Expected versus discovered spaces, lineage and access. |
| Component Foundation | Mount, socket, clearance and support validity. |
| Commissioning Dry Run | Candidate scan stages, blockers, warnings and source transaction readiness. |
| Scale/Budget | Cell, element, graph and nested-module limits. |

These tests call versioned 26F validator adapters. The evidence records adapter version, blueprint revision, material resolution, scenario and result hash.
# 38. 26G Buoyancy, Stability and Movement Preview Laboratory

| Preview | Inputs | Outputs |
| --- | --- | --- |
| Lightship Float | Resolved source and fixed equipment. | Estimated draft, trim, list, freeboard and stability indicators. |
| Design Cargo Load | Cargo-zone mass profile. | Waterline/stability changes and capacity warnings. |
| Ballast Cases | Fixed/adjustable ballast parameters. | Trim and righting comparison. |
| Propulsion Test | Provider arrangement and environment. | Thrust/turning/clearance evidence. |
| Wind and Sail Matrix | Wind angles/strength and sail states. | Drive/heel preview and handling warnings. |
| Wave/Storm Case | Selected 26D sea-state scenario. | Motion/stability/downflooding indicators. |
| Shallow/Grounding | Depth/slope/contact scenario. | Grounding and refloat constraints. |
| Damage/Flooding Case | Selected breach/compartment fluid scenario. | Progressive loss-of-stability evidence. |

> **Preview Limitation**
>
> Laboratory values are design estimates for a fixed source, palette and load scenario. Runtime block edits, cargo, damage, fluids, weather, component condition and crew actions can change actual behaviour. Only 26G certifies an operational Vessel Instance.

# 39. 26H Construction, Support and Work-Package Laboratory

| Test | Evidence |
| --- | --- |
| Stage Reachability | Worker routes, work faces, vertical access and trapped-space checks. |
| Temporary Support | Cradle/shore/scaffold continuity through each stage. |
| Material Resolution | Exact role resolution, substitutions, exclusions and estimated quantities. |
| Tool/Skill Coverage | Required capabilities and specialist stages. |
| Component Installation | Access, lift/clearance, isolation and commissioning order. |
| Seal/Pressure Test Stages | When compartments can be tested and corrected. |
| Launch Sequence | Support removal, transfer state, clearance and required reviews. |
| Refit Diff | Removed/added elements, support, resource and certification invalidation. |

A green construction preview means the authored stage graph is feasible in the selected laboratory profile. The real 26H worksite survey may still reject terrain, route, stock, weather, permissions or shipyard capability.
# 40. Environment, Scenario and Preview Matrix

| Scenario Family | Representative Presets |
| --- | --- |
| Water | Still tank, river current, harbour wake, coastal swell, open-sea waves. |
| Climate | Temperate calm, rain, gale, warm-sea storm, polar cold/ice. |
| Loading | Empty, standard, asymmetric cargo, maximum design load, passenger evacuation. |
| Damage | Minor leak, steering loss, mast loss, compartment breach, fire aftermath. |
| Worksite | Beach, slipway, berth, dry dock, floating dock. |
| Crew/Access | Minimum crew routes, standard operation, boarding, evacuation, damage control. |
| Culture/Palette | Every approved material/culture/realm profile. |
| Performance | Near full detail, medium LOD, distant product, multiplayer compatibility. |

## 40.1 Scenario Records
Scenarios are versioned data resources with stable IDs, authoritative-provider versions, required evidence and expected tolerance bands. Test results are reproducible and comparable across revisions.
# 41. UI/UX, Progressive Disclosure and Accessibility

| Area | Requirements |
| --- | --- |
| Viewport | Clear voxel scale, water/reference planes, ghosted internals, layer isolation and state scrubber. |
| Outliner | Cells/groups/modules/components/markers/stages with stable IDs and filters. |
| Inspector | Source field ownership, inheritance, override, reason and dependency links. |
| Diagnostics | Clickable issue list, severity, affected elements, provider and suggested actions. |
| Variant Matrix | Compare parameters, palettes, states, icons and evidence side by side. |
| Generator Graph | Readable nodes, bounded parameters, output counts, seed and fallback trace. |
| Test Dashboard | Scenario queue, result history, diff, confidence and stale evidence. |
| Player Creator | Simplified terms, guided requirements, world-first explanation and hidden developer fields. |

## 41.1 Accessibility
- Non-colour role and validation patterns.
- Scalable text and adjustable panel density.
- Keyboard-first complete operation and controller support for player creator/basic preview.
- Reduced-motion water, sail and state previews.
- Alternative numeric/table views for 3D overlays.
- Searchable commands and remappable shortcuts.
- Captions/text equivalents for sound-warning preview.
- Clear focus, undo, recovery and destructive-action confirmation.

# 42. Icon Capture, Miniatures, Maps and Codex Products

| Product | Default Capture |
| --- | --- |
| Blueprint Library Icon | Isometric completed vessel at standard waterline. |
| Construction Project Icon | Selected construction stage on cradle/slipway. |
| Variant Comparison | Matched camera across culture/loadout/state variants. |
| Map/Chart Symbol | Simplified silhouette/top view. |
| Codex Image | Cinematic environment preset with approved state. |
| Technical Diagram | Side/top/station views with optional role/compartment overlays. |
| Generator Contact Sheet | Batch grid of generated candidates with parameter labels. |
| Player Share Thumbnail | Safe deterministic capture without hidden world/player data. |

Capture profiles store camera, environment, water state, variant, stage, lighting, background, resolution and dependency hash. Linked captures regenerate when source changes; locked captures warn when stale.
# 43. Validation, Reason Codes, Evidence and Release Gates

| Validation Family | Examples |
| --- | --- |
| Identity/Schema | Duplicate ID, invalid version, unstable element identity. |
| Dependency | Missing block, component, module, material, scenario or event. |
| Source Geometry | Out of bounds, overlap, illegal shape/state, isolated required group. |
| Structural Semantics | Missing roles, incompatible material, broken support, invalid critical group. |
| Hull/Compartment | Gap, opening conflict, compartment mismatch, trapped space. |
| Component/Network | Missing mount, blocked clearance, disconnected service or invalid socket. |
| Construction | Unreachable stage, unsupported transition, missing work face or early support removal. |
| Variant/Generator | Unbounded parameter, invalid combination, unstable output, missing fallback. |
| Preview Coverage | Missing required scenario, stale adapter, failed evidence or tolerance regression. |
| Performance | Source/product budget exceeded, excessive nested depth, transparent/flexible cost. |
| Package/Safety | Forbidden script, rights issue, unresolved dependency, namespace violation. |
| Presentation/Accessibility | Missing icon, ambiguous critical cue, inaccessible creator flow. |

## 43.1 Severity

| Severity | Meaning |
| --- | --- |
| Info | Advisory or optimisation opportunity. |
| Warning | Valid but constrained, risky or incomplete evidence. |
| Error | Cannot approve affected revision or output. |
| Blocker | Unsafe/corrupt authority, identity, transaction or package condition. |

## 43.2 Evidence Bundle
- Source/revision/dependency hashes.
- Validator and adapter versions.
- Resolved material/variant parameters.
- Required scenario results and comparison baselines.
- Construction stage and support report.
- Performance and package budget report.
- Accessibility and presentation checklist.
- Provenance, rights and AI-change ledger references.
- Reviewer decisions, accepted warnings and expiry/staleness policy.

# 44. Lifecycle, Approval, Revision History and Collaborative Review

| Lifecycle | Meaning |
| --- | --- |
| Concept | Unstructured idea or experimental source. |
| Draft | Stable ID assigned; incomplete semantics/evidence. |
| Functional | Required source layers exist and basic validators pass. |
| Family Review | Inheritance, generator and variant matrix reviewed. |
| Construction Review | 26H stage/work evidence accepted. |
| Movement Review | Required 26G design scenarios accepted. |
| Visual/Presentation Review | Silhouette, materials, captures and accessibility reviewed. |
| Approved | Eligible for package and production use. |
| Deprecated | Retained for migration/legacy; replacement identified. |
| Quarantined | Unsafe/missing dependencies or migration failure. |

## 44.1 Revision Tools
- Layer/region/module locks for concurrent work.
- Field-level and element-level history.
- Side-by-side voxel, section, role, compartment and evidence diff.
- Comment anchors attached to stable elements or scenarios.
- Revert individual fields/layers without discarding unrelated changes.
- AI-assisted changes shown as a reviewable patch.
- Approval revocation when owned evidence becomes stale.

# 45. Packaging, Import, Export, Sharing and Package Safety

| Package Type | Contents | Use |
| --- | --- | --- |
| Official Thin Package | Source plus shared ID references, products, evidence and migrations. | Core/expansion content. |
| Official Self-Contained Development Package | Permitted dependencies included. | Transfer, archive or controlled collaboration. |
| Player Blueprint Package | Restricted source, stable references, safe parameters, thumbnail, manifest and validation report. | Personal/community sharing. |
| Family Parameter Pack | Permitted preset values and palette/module selections. | Player variation without generator-code access. |
| Review Package | Source diff, evidence and products without release admission. | External review/testing. |
| Legacy Archive | Original source/products and migration notes. | Recovery and historical compatibility. |

## 45.1 Player Package Restrictions
- No scripts, native code, shaders with unapproved capabilities or arbitrary file paths.
- No canonical namespace claims.
- No embedded inventories, NPCs, credentials or personal world data.
- No hidden unlock grants or gameplay-definition overrides.
- Bounded source size, nested depth, flexible elements and capture products.
- Dependencies resolved by stable IDs with clear missing-content behaviour.
- Server may require local validation, allowlist or conversion before use.

# 46. Migration, Existing Worlds, Compatibility and Recovery

| Change | Default Existing-World Policy |
| --- | --- |
| Presentation-only product update | May hot-update compatible presentation. |
| Safe source metadata clarification | New placements; optional evidence refresh. |
| Blueprint geometry change | New revision; existing vessels unchanged. |
| Component/role contract change | Explicit compatibility review and refit/migration path. |
| Removed dependency | Fallback, quarantine or approved replacement migration. |
| Generator revision | Existing generated blueprints preserve baked source/old revision. |
| Schema migration | Copy source, migrate transactionally, validate, preserve original backup. |
| Player package failure | Open read-only/quarantine with diagnostics; never delete source. |

## 46.1 Recovery Tools
- Autosave snapshots and atomic source writes.
- Open last-known-good revision.
- Rebuild all generated products from source.
- Resolve missing dependency with alias/replacement.
- Flatten nested modules into preserved explicit source.
- Bake generated candidate into source before generator removal.
- Export quarantine report and original package.
- Re-run migration after provider/pack restoration.

# 47. Runtime Baking, Caches, Dependency Invalidation and Hot Reload

| Product | Purpose |
| --- | --- |
| Sparse Source Chunk Product | Efficient runtime/local-grid construction input. |
| Merged Render Meshes | Near/medium vessel rendering by material/LOD group. |
| Collision/Interaction Proxies | Authoritative-compatible runtime collision products. |
| Structural Analysis Cache | Role/group adjacency and provider input acceleration. |
| Hydrostatic Sample Product | Bounded 26G preview/runtime acceleration derived from source. |
| Compartment/Access Seed Product | Hints for runtime discovery and promotion. |
| Component/Socket Manifest | Stable attachment and service resolution. |
| Construction Stage Product | Compact element deltas and work metadata. |
| Icons/Thumbnails/Diagrams | UI and documentation products. |
| Distant LOD/Impostor | Far rendering and fleet summary presentation. |

Cache keys include source revision, dependency hashes, palette/variant profile, bake version and relevant provider versions. A changed sail material should not rebuild unrelated collision; a changed hull cell invalidates structural, hydrostatic, collision, mesh and possibly stage products.
## 47.1 Hot Reload
Hot reload is permitted in Forge laboratories and controlled development worlds. Approved production worlds do not replace persistent vessels from blueprint hot reload. Runtime development adapters may spawn a disposable preview instance from the new revision.
# 48. Godot/Summer Engine Technical Architecture

| Service/Resource | Responsibility |
| --- | --- |
| `VesselBlueprintDefinition` | Canonical source and semantic-layer references. |
| `VesselBlueprintRevision` | Immutable revision, hashes and dependency lock. |
| `VesselSourceVolume` | Sparse chunked local voxel elements and shapes. |
| `VesselSemanticLayerSet` | Roles, surfaces, compartments, access and critical groups. |
| `VesselComponentLayout` | Functional placements, sockets, clearances and service graphs. |
| `VesselConstructionProfile` | Stages, work faces, supports and 26H export data. |
| `VesselVariantProfile` | Layer composition, compatibility and fallbacks. |
| `ProceduralVesselFamilyDefinition` | Parameters, grammar, modules, generators and budgets. |
| `VesselPreviewScenario` | Versioned test inputs and required evidence. |
| `VesselForgeSession` | Transactional edit state, undo/redo and dirty regions. |
| `VesselForgeValidationService` | Local validators and provider-adapter orchestration. |
| `VesselGeneratorService` | Deterministic explicit-candidate generation. |
| `VesselBakeService` | Job graph for source/runtime products. |
| `VesselPlayerPackageService` | Restricted import/export and safety validation. |

## 48.1 Recommended Add-on Boundaries
```text
addons/leyforge_forge_core/
addons/leyforge_blueprint_forge/
addons/leyforge_vessel_forge/
addons/leyforge_vessel_preview_adapters/
addons/leyforge_player_vessel_creator/
addons/leyforge_presentation_forge/

content/vessel_blueprints/
content/vessel_families/
content/vessel_modules/
content/vessel_variants/
content/vessel_scenarios/
generated/vessel_products/
```

## 48.2 Engineering Rules
- GDScript first; GDExtension only after measured bounded need.
- No Node per source voxel, generator element or validation issue.
- Large source volumes use chunked sparse data and dirty-region operations.
- Long bake/test jobs are cancellable, resumable where practical and report progress.
- Provider adapters communicate through versioned data contracts, not direct private calls.
- Summer Engine output is ordinary reviewable Godot code/data with tests and an AI change ledger.
- Generated products are disposable; canonical source and migrations are protected.

# 49. Performance, Scalability, Testing and Production Batches

| Budget Axis | Tracked Measures |
| --- | --- |
| Source | Cells, shapes, modules, layers, internal IDs and source bytes. |
| Semantics | Role groups, compartments, markers, zones, paths and graph edges. |
| Flexible Systems | Sails, line segments, anchors and state sections. |
| Generator | Candidate count, parameter combinations, generation time and repair passes. |
| Validation | Scenario count, adapter cost, batch duration and evidence size. |
| Products | Mesh surfaces, materials, collision, LODs, icons and cache bytes. |
| Runtime Preview | Frame time, memory, promotion time and multiplayer payload. |
| Player Package | Compressed size, nested depth, source complexity and import time. |

## 49.1 Redesign Triggers
- A common medium vessel cannot be edited interactively on target developer hardware.
- Batch generation cannot reproduce identical source and element IDs from the same inputs.
- Valid child families regularly break when parents receive ordinary safe edits.
- Laboratory adapters require full game-world simulation to provide basic evidence.
- Player packages can bypass unlocks, permissions or namespace rules.
- Baked products become the only practical copy of source.
- Variant combinations grow faster than validation and production capacity.
- Existing vessels require regeneration to remain loadable after ordinary blueprint updates.

## 49.2 Staged Implementation

| Batch | Scope | Exit Evidence |
| --- | --- | --- |
| I0 - Shared Forge Alignment | Register vessel content types, source resources, library filters and manifest contracts. | Open/save/undo/dependency proof. |
| I1 - Core Vessel Source | Composition, frames, roles, surfaces, compartments and component layout. | Small craft authored and 26F-validated. |
| I2 - Construction Integration | Stages, work metadata, support profiles and 26H export. | NPC-buildable small vessel intake. |
| I3 - Movement Preview | 26G scenario adapter, load cases and evidence dashboard. | Repeatable float/stability/propulsion comparisons. |
| I4 - Player Creators | Workshop, in-world capture, personal library and safe package. | Player design survives export/import/build flow. |
| I5 - Variants and Modules | Inheritance, palettes, modules, state deltas and family matrix. | Coherent vessel family across cultures/states. |
| I6 - Procedural Families | Parameter schema, hull grammar, candidate generation and bake-to-source. | Deterministic batch corpus and named variants. |
| I7 - Production Hardening | Bakes, LOD, migrations, CI, accessibility and budgets. | Approved package with complete evidence. |

# 50. Cross-Document Integration and 26J Handoff

| Document/System | Required 26I Output |
| --- | --- |
| 03-06 Registries | Vessel blueprint, module, material-role, component and recipe relationship extensions. |
| 07/19/20 NPC and Settlement | Blueprint pools, project previews and shipyard construction intake references. |
| 21-23 Forge | Vessel workspace, source types, anchors/events, captures, products and package integration. |
| 25B-25E | Qualified IDs, schemas, relationships, packs, migrations and validation evidence. |
| 25K/25L | Asset-package contracts, budgets, backlog tasks and source-of-truth audit. |
| 26F | Source roles, local elements, compartments, components and commissioning test inputs. |
| 26G | Intended-use/load scenarios, provider layouts and movement-preview inputs. |
| 26H | Stages, material roles, support/work metadata and construction/refit intake. |
| 26J | Shipyard blueprint access, NPC production families, port-service modules and cultural vessel libraries. |
| 26K | Fleet/trade/piracy/navy intended-use profiles and approved variant pools. |
| 26L | Hardpoint, damage-group, wreck-state and repair/refit blueprint contracts. |
| 26M-26N | Fishing, ecology, exploration, progression, quest and magic variant requirements. |
| 26O | Technical consolidation, UI, multiplayer, QA, migrations and final main-document amendments. |

## 50.1 Formal Handoff to 26J
- 26J may select approved vessel blueprints and procedural-family presets for cultures, ports and shipyards but may not edit 26I source at runtime.
- NPC shipyards require explicit construction-capability, worksite and material-profile compatibility before accepting a design.
- Port facilities may expose repair/refit services against blueprint and 26H contracts without owning vessel source.
- Culture and faction vessel libraries reference approved profiles, weights, exclusions and fallbacks rather than hardcoded scenes.
- Generated NPC vessel variants must resolve deterministically to explicit blueprint revisions before construction or spawning.
- Existing NPC or player Vessel Instances remain persistent identities independent from later library changes.
- 26J must provide crew, port, settlement and service requirements back to 26I only through governed schema extensions.

> **26J Boundary**
>
> Vessel Forge decides how reusable vessel designs and deterministic families are authored, validated and packaged. Document 26J decides how ports, shipyards, crews and maritime settlements acquire, build, maintain and use those approved designs.

# Appendix A. Core Vessel Blueprint Record Templates
```yaml
vessel_blueprint:
  blueprint_id: leyforge.core.blueprint.vessel.merchant_sloop
  schema_version: 1
  semantic_version: 0.1.0
  family_id: leyforge.core.vessel_family.merchant_sloop
  parent_blueprint_id: null
  category: sailing_merchant
  scale_band: V2
  lifecycle_state: draft
  intended_use_profiles:
    - sheltered_coastal
    - open_sea_cargo
  local_frame:
    forward_axis: +Z
    up_axis: +Y
    centreline_x: 0
    baseline_y: 0
    intended_waterline_y: 3.0
  source_volume_ref: source:vessel/merchant_sloop/base
  semantic_layers_ref: semantics:vessel/merchant_sloop/base
  component_layout_ref: components:vessel/merchant_sloop/base
  construction_profile_ref: construction:vessel/merchant_sloop/base
  variant_profiles:
    - leyforge.core.vessel_variant_profile.riverward_merchant
  dependencies: []
  required_scenarios: []
  bake_profile: vessel_standard_v1
  planning_status: expansion_required
```

```yaml
vessel_blueprint_revision:
  revision_id: leyforge.core.blueprint.vessel.merchant_sloop@0.1.0+<hash>
  blueprint_id: leyforge.core.blueprint.vessel.merchant_sloop
  parent_revision_id: null
  source_hash: <sha256>
  dependency_lock_hash: <sha256>
  generator_provenance: null
  authoring_provenance:
    human_authors: []
    ai_change_ledger_refs: []
  validation_evidence_refs: []
  baked_product_manifest_ref: null
  approval_record_ref: null
```

```yaml
vessel_source_element:
  element_id: elem.frame.014
  element_type: voxel_cell
  local_cell: [2, 1, 18]
  block_or_role_ref: role:frame_primary
  shape_id: shape.beam.vertical
  rotation: north
  semantic_roles:
    - vessel.structure.frame
  construction_stage_id: stage.primary_frames
  inherited_from: null
  generator_lineage: null
```

# Appendix B. Procedural Family and Generator Templates
```yaml
procedural_vessel_family:
  generator_id: leyforge.core.vessel_generator.coastal_workboat
  schema_version: 1
  family_id: leyforge.core.vessel_family.coastal_workboat
  parameter_schema:
    length_stations: {type: int, min: 8, max: 18, default: 12}
    beam_cells: {type: int, min: 5, max: 11, default: 7}
    propulsion_profile: {type: enum, values: [oar, sail, hybrid]}
    cargo_ratio: {type: float, min: 0.1, max: 0.65, default: 0.35}
  grammar_nodes: []
  module_pools: []
  constraint_passes: []
  repair_passes: []
  variant_channels: []
  required_validation_policy: vessel_family_standard
  family_budget_id: budget.vessel_family.medium
  output_policy: explicit_candidate_source
```

| Generator Stage | Required Output |
| --- | --- |
| Parameter Resolve | Typed values, source and fallback trace. |
| Frame/Hull Generate | Explicit source elements with stable lineage. |
| Semantic Generate | Roles, surfaces, compartments, access and critical groups. |
| Module Resolve | Connector-compatible explicit module instances. |
| Component Resolve | Approved component placements and service graphs. |
| Stage Generate | Construction deltas, work faces and supports. |
| Decoration Resolve | Independent named seed channels. |
| Constraint/Repair | Recorded fixes, warnings and rejected candidates. |
| Evidence Queue | Required 26F-26H scenarios and budgets. |
| Candidate Freeze | Immutable explicit source revision for review. |

# Appendix C. Semantic Layer and Marker Catalogue

| Layer Family | Representative Roles |
| --- | --- |
| Structure | `vessel.structure.keel`, `.spine`, `.frame`, `.longitudinal`, `.hull_shell`, `.deck`, `.bulkhead`, `.armour`, `.ballast`. |
| Surface/Openings | `vessel.surface.outer`, `.inner`, `vessel.opening.hatch`, `.door`, `.scupper`, `.intake`, `.exhaust`. |
| Compartments | `vessel.compartment.hold`, `.crew`, `.engine`, `.pump`, `.ballast`, `.magazine`, `.void`. |
| Access | `vessel.access.route`, `.ladder`, `.boarding`, `.emergency`, `.maintenance`. |
| Components | `vessel.component.helm`, `.propulsion`, `.steering`, `.pump`, `.storage`, `.navigation`, `.anchor`. |
| Networks | `vessel.network.mechanical`, `.power`, `.fuel`, `.fluid`, `.mana`, `.control`, `.logistics`. |
| Construction | `work.face`, `.delivery`, `.scaffold`, `.cradle`, `.shore`, `.inspect`, `.lift`. |
| Presentation | `vessel.presentation.wake`, `.spray`, `.flag`, `.light`, `.bell`, `.damage_fx`. |
| Future Combat | `vessel.hardpoint`, `.boarding`, `.defence`, `.damage_group`. |

# Appendix D. Validation and Reason-Code Catalogue

| Code | Severity | Meaning |
| --- | --- | --- |
| VFORGE-ID-001 | Error | Duplicate or invalid qualified blueprint ID. |
| VFORGE-ELEM-001 | Blocker | Internal element identity collision or unstable remap. |
| VFORGE-DEP-001 | Error | Required source dependency unresolved. |
| VFORGE-SRC-001 | Error | Source element outside declared bounds. |
| VFORGE-ROLE-001 | Error | Required structural role absent or incompatible. |
| VFORGE-SEAL-001 | Error | Unintended hull gap or unresolved opening closure. |
| VFORGE-COMP-001 | Warning | Expected/discovered compartment mismatch. |
| VFORGE-ACCESS-001 | Error | Required control, berth or emergency point unreachable. |
| VFORGE-MOUNT-001 | Error | Functional component lacks valid foundation or clearance. |
| VFORGE-NET-001 | Error | Required typed service connection invalid. |
| VFORGE-STAGE-001 | Error | Construction stage cannot be reached or safely supported. |
| VFORGE-VAR-001 | Error | Variant combination violates compatibility matrix. |
| VFORGE-GEN-001 | Blocker | Generator result is non-deterministic for identical inputs. |
| VFORGE-GEN-002 | Error | Generator produced opaque/uneditable output. |
| VFORGE-PREV-001 | Warning | Required preview evidence missing or stale. |
| VFORGE-PKG-001 | Blocker | Player package contains forbidden executable content. |
| VFORGE-BUDGET-001 | Warning | Family/source/product budget exceeded. |
| VFORGE-MIG-001 | Blocker | Migration cannot preserve original source or identity. |

# Appendix E. Test Laboratory and Preview Matrix

| Matrix Axis | Minimum Production Coverage |
| --- | --- |
| Structural | Connected assembly, role coverage, support, surface/opening and compartment discovery. |
| Loading | Lightship, standard design load, asymmetric load and maximum intended load. |
| Environment | Still water, current, coastal swell and one intended severe condition. |
| Propulsion | Every supported provider state and steering arrangement. |
| Construction | All stages, support transitions, launch and at least one refit diff. |
| Variants | Every approved material/culture geometry combination or bounded complete sample. |
| States | Intact, representative damage, repair/restoration and wreck where authored. |
| Access | Normal operation, boarding, emergency evacuation and damage-control routes. |
| Performance | Near, medium and distant products on target profiles. |
| Multiplayer | Content compatibility and deterministic variant resolution. |

# Appendix F. Player Blueprint Package Contract
```yaml
player_vessel_blueprint_package:
  package_format: leyforge.player_vessel_blueprint
  format_version: 1
  package_id: player.local.vessel_package.example
  creator_display_name: optional
  blueprint_source_revision: <embedded restricted source>
  allowed_reference_ids: []
  required_pack_ids: []
  thumbnails: []
  parameter_presets: []
  validation_summary: {}
  rights_and_credits: []
  contains_scripts: false
  contains_world_state: false
  contains_unlock_grants: false
  safety_hash: <sha256>
```

- Import always creates a new local package record; it never overwrites an existing design without confirmation.
- Missing dependencies preserve source and show placeholders/reasons.
- Server use may require revalidation and complexity limits.
- Official promotion creates a governed canonical revision with separate provenance; it does not seize or erase the player original.

# Appendix G. Completion Checklist
- [x] Vessel Forge defined as an extension of the Unified Forge rather than a competing application.
- [x] Blueprint, revision, procedural family, generated candidate, construction intake and Vessel Instance separated.
- [x] Full developer and restricted player authoring boundaries defined.
- [x] Main-menu and in-world player vessel-design workflows included.
- [x] Voxel source, structural roles, surfaces, compartments, components and service graphs covered.
- [x] Rigging, sails, sockets, events and Presentation Forge integration covered.
- [x] Material roles, culture/biome/realm variants and provenance covered.
- [x] Construction stages, supports, work metadata and 26H export covered.
- [x] Inheritance, modules, upgrades, refits and freeform snapshot intake covered.
- [x] Deterministic procedural family architecture and bake-to-source rule defined.
- [x] Variant composition and combinatorial budgets defined.
- [x] 26F, 26G and 26H Test Laboratory adapters and evidence boundaries defined.
- [x] UI/UX, icon capture, accessibility, review and lifecycle covered.
- [x] Packaging, player sharing, safety, migrations and existing-world protection covered.
- [x] Runtime baking, caches, Godot/Summer architecture and performance gates covered.
- [x] Set 25 governance and formal 26J handoff completed.

> **Document 26I Completion Statement**
>
> Document 26I establishes Vessel Forge as Leyforge's unified, voxel-first authoring authority for reusable vessel designs and deterministic ship families. It preserves arbitrary-block creativity; separates source, project and instance truth; integrates developer and restricted player creation; authors structural, compartment, component, construction, variant and presentation contracts; makes generated vessels explicit and reproducible; delegates runtime validation to 26F-26H; protects existing worlds and player vessels; and provides the source packages required by ports, shipyards, crews and maritime civilisation in Document 26J.

