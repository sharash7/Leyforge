# FANTASY VOXEL CIVILISATION SANDBOX

## DOCUMENT SET 26

# 26F - Voxel Vessel Architecture, Structural Roles and Commissioning

*Version 0.1 - Mobile Voxel Construct, Shipwright Scan and Commissioning Contract Draft*

A governing architecture for converting player- and NPC-built voxel assemblies into persistent mobile Vessel Instances while preserving ordinary block identity, material meaning, resource conservation, local-space structure, ownership, explainable validation, save safety and the creative freedom to build ships from almost any suitable material.

**Project Lead and Final Authority: Ash**

Architecture, systems planning, documentation and production support: GPT-5.6 Thinking

Prepared 6 August 2026

---

> **Voxel Vessel Architecture Statement**
>
> A Leyforge vessel must be a real construction before it becomes a vehicle. Players and NPCs may build with ordinary blocks, shaped pieces, functional components and cultural materials; a Shipwright Anchor and Shipwright tools then identify the intended vessel, establish its local frame, infer structural roles, detect spaces and compartments, expose every important weakness, and commission the approved assembly into one persistent Vessel Instance. Commissioning must never duplicate resources, erase contained state, silently reinterpret blocks or pretend that an invalid shape is seaworthy. The system should reward understandable construction, unusual materials, specialist knowledge, magic and experimentation without becoming a professional naval-architecture examination.

| Field | Locked Direction |
| --- | --- |
| Document Set | This is Document 26F in Document Set 26: Oceans, Maritime Civilisation, Vessels and Naval Systems Expansion. |
| Document Scope | Defines vessel concept layers, class and instance separation, candidate registration, Shipwright Anchor behaviour, voxel selection, local grids, coordinate frames, material aggregation, structural roles, structural graphs, hull and compartment discovery, component-role placement, validation, commissioning transactions, ownership, lifecycle, persistence, LOD, multiplayer authority, Godot/Summer Engine boundaries, prototype evidence and handoffs. |
| Core Philosophy | Vessels are persistent mobile voxel structures assembled from existing block and component definitions. Structural meaning is attached to vessel-local block instances; ordinary block IDs remain unchanged. |
| Construction Direction | Any transferable block may be attempted. Suitability, mass, sealing, strength, attachment and environmental properties determine consequences instead of an arbitrary whitelist of cosmetic ship blocks. Purpose-built vessel blocks remain useful for specialised function and readable construction. |
| Structural Direction | Use a simplified vessel-specific structural graph: primary spine, frames, hull shell, decks, bulkheads, supports, armour, ballast and attachments. Do not introduce universal real-time structural engineering for the whole voxel world. |
| Shipwright Direction | A Shipwright Anchor registers a bounded candidate. Shipwright tools establish bow, stern, up, centreline, keel intention and reference waterline, then run deterministic scans, role inference, compartment detection and explainable validation. |
| Commissioning Direction | Commissioning is an atomic transfer from static world construction to a persistent local-grid Vessel Instance. It preserves block definitions, instance state, inventories, attachments, ownership and provenance, or it rolls back safely. |
| Mobility Boundary | 26F may create a commissioned but immobilised Vessel Instance. Document 26G owns buoyancy, stability, propulsion, steering, movement certification and operational motion. Structural commissioning is not a promise that the vessel floats or sails well. |
| Blueprint Boundary | A vessel class, vessel blueprint, candidate assembly and commissioned Vessel Instance are separate records. Document 26I owns the dedicated Vessel Forge workflow; 26F defines the runtime-compatible semantic contracts it must author. |
| Repair Boundary | 26F defines structural identity and safe edit states. Document 26H owns detailed player/NPC construction, repair, refit, dry-dock, launching and salvage workflows. |
| Damage Boundary | 26F defines structural groups and damage-addressable local identities. Document 26L owns combat damage, breaches, flooding consequences, fire, sinking, capture and wreck conversion. |
| Registry Direction | Consume Set 25 qualified IDs, definition facets, capability contracts, mobile-frame identity, relationship graphs, pack manifests, validation suites and migration rules. No vessel-specific second registry kernel may be invented. |
| Engine Direction | Godot with Summer Engine remains the production direction. Vessel cells are compact data, not one Node per block. Generated meshes, collision, navigation and previews are replaceable bake products. |
| Production Direction | Vessel architecture is an expansion foundation with a smaller Core Candidate prototype. Production admission requires evidence for local-grid conversion, state conservation, moving-frame consistency, save migration and understandable Shipwright validation. |
| Final Authority | Ash retains final authority over vessel scope, creative restrictions, size bands, production tier, extraordinary craft, risk acceptance and release decisions. |
| Next Deliverable | 26G - Vessel Movement, Buoyancy, Propulsion, Steering and Navigation. |

# DOCUMENT SET 26 - OCEANS, MARITIME CIVILISATION, VESSELS AND NAVAL SYSTEMS EXPANSION

# Document Purpose

Document 26F defines what a vessel is inside Leyforge and how a static voxel construction becomes a persistent mobile construct without abandoning the game's block, item, structure, blueprint, ownership and save foundations. It is the bridge between ordinary construction and later sailing systems.

The original boat concept depends on a crucial promise: the player should not be restricted to a small set of prefabricated hull blocks merely because vehicles are technically easier to author that way. Oak, iron, stone, crystal, living wood, ice, bone, mushroom material, culture-specific blocks and future dimensional materials may all be attempted where their definitions expose the required vessel properties. The result may be efficient, slow, unstable, absorbent, magically supported, structurally poor or completely unfit for launch, but the system must explain why.

This document therefore separates three questions that are often incorrectly merged:

1. **What is physically present?** Existing block, shape, material, component and contained-state definitions answer this.
2. **What role is each local block serving in this vessel?** Vessel-local role assignments and the structural graph answer this without changing the block ID.
3. **What can the commissioned vessel actually do?** Later motion, propulsion, crew, economy, combat and progression documents answer this through capabilities and runtime state.

The proof of concept is retired. No vessel rule assumes one tutorial raft, one fixed harbour, a prebuilt Riverwood shipyard, a hardcoded coastline or a mandatory first ship. Production vessels may be player-built, NPC-built, generated from approved blueprints, restored from wrecks or imported through safe content packs. Their identities and construction outcomes must remain deterministic where authored or generated, persistent once created, and recoverable when data changes.

Document 26F does not define final water physics, ship handling, sail simulation, engines, detailed shipyard labour, complete naval combat, final vessel content rosters or the Vessel Forge interface. It creates the architecture and contracts those systems must consume.

# Design Sources, Authority and Supersession

| Source | Relevant Direction | Treatment in 26F |
| --- | --- | --- |
| Ash - locked project direction and design conversation | Freeform block-built ships; Shipwright tools; role assignment such as keel or hull; existing block IDs and properties should produce meaningful variation; Vessel Forge; NPC shipbuilding and crewed ships. | Applied as locked player fantasy and system intent. This document resolves the architecture needed to support it. |
| 26A - Maritime Expansion Foundation | Oceans are worlds; ships are constructions; hybrid arbitrary-block vessels; local voxel grids; Shipwright commissioning; persistent Vessel Instances; Set 25 governance. | Primary Set 26 authority for the vessel identity and document boundaries. |
| 26B - Water, Liquid and Fluid Simulation Overhaul | Water Body queries, local fluid cells, displacement, containment, sealing, pressure classes, compartments, breach interfaces and bounded flooding. | Supplies liquid-facing material fields and interfaces. 26F detects vessel-local spaces and surfaces but does not simulate flooding or buoyancy. |
| 26C - Marine World Generation | Stable Water Bodies, depth/access bands, harbours, coasts, structures, route contexts and generated marine identities. | Supplies world anchors and environmental context for construction sites and later vessel placement. |
| 26D - Marine Climate and Sea-State Systems | Wind, waves, currents, tides, storms, ice, hazard fields and forecast truth. | Supplies future load and operating context. 26F records structural interfaces; 26G and 26L consume live forces and damage consequences. |
| 26E - Aquatic Player Interaction | Swimming, falling overboard, rescue, vessel ladders, boarding handoff, underwater work and stable vessel-frame references. | Requires safe local-space transfer points, interaction sockets, ladders, rescue markers and persistent frame IDs. |
| 25A - Production Governance | POC retirement, decision control, production tiers, source-of-truth rules and evidence-based admission. | Controls status, approval and scope. This document does not silently place all vessels in Core Production. |
| 25B - Canonical Registry Kernel | Qualified IDs, namespaces, immutable definitions, facets, class/blueprint/instance separation, mobile-container identity and one mutable truth. | Controls identity and ownership. A commissioned vessel is a persistent instance, not a new authored definition. |
| 25C - Schemas and Completeness | Mobile-frame relationships, capability offers, suitability, fallbacks and the persistent mobile-construct completeness extension. | Provides the schema and completeness contract that 26F specialises for maritime vessels. |
| 25D - Packs and Migration | Content packs, manifests, dependencies, import/export, aliases, quarantine, migration and optional expansion removal. | Controls vessel definition and blueprint packaging plus safe recovery of commissioned instances. |
| 25E - Validation Architecture | Validator registries, evidence, seed QA, reachability, save/load, moving-container, multiplayer and performance gates. | Controls test suites, severity and release evidence. |
| 25F-25J - Scope and Physical Catalogues | Production classification, package dependencies, block/item families and resource provenance. | Vessel-specific fields and content proposals must map into these catalogues rather than bypass them. |
| 25K - Asset and Event Manifest Contract | Forge, animation, audio, VFX, sockets, events, budgets and provenance. | Controls presentation-facing vessel sockets and generated asset manifests. |
| 25L - Backlog and Source-of-Truth Audit | Summer Engine task contracts, dependency order, evidence and Set 26 integration closure. | Controls implementation task quality and final integrity audit. |
| 03 - Blocks Registry | One-metre voxel foundation, shapes, material families, block states, damage, ownership and parent definitions; no universal structural integrity by default. | Retains block identity and general behaviour. 26F adds vessel extension facets and local role assignments rather than rewriting every block as a ship block. |
| 04-06 - Items, Recipes and Resources | Physical tools, components, material progression, project recipes, substitutions, quality, durability and exact resource conservation. | Supplies Shipwright items, components and material meaning. Detailed recipes and progression are completed in 26N and revised main registries. |
| 07, 19 and 20 - NPCs, Blueprints, Buildings and Projects | Named workers, visible staged construction, blueprint/runtime separation, semantic markers, exact materials, terrain surveys, activation contracts and distant summaries. | Provides the construction and blueprint architecture later specialised by 26H-26I. |
| 12 - Structures | Dynamic structures, blueprint source, ownership, damage, restoration, world placement and LOD. | Static vessel candidates begin as structures; commissioned vessels become mobile-container instances while retaining structure provenance. |
| 16 - Combat, Gear and Defence | Damage packets, equipment, structure damage, raids, capture, aftermath and accessibility. | Supplies general damage architecture. 26F exposes addressable structural groups; 26L owns naval damage behaviour. |
| 17 - UI/UX | World-first interaction, progressive disclosure, reason codes, building previews, permissions, accessibility and trustworthy failure feedback. | Controls Shipwright scan presentation and commissioning feedback. |
| 21-23 - Unified Forge and Presentation Forge | Editable voxel source, semantic blueprints, generated bake products, sockets/events, audio/VFX separation and Godot-native tools. | Vessel Forge extends this system. 26F defines semantic vessel data and runtime contracts, not a separate editor. |
| 99 - Current Manual Testing Guide | Current Godot POC has chunked voxels, block/item registries, swimming, save recovery, safe construction and persistent NPC/world state, but no production vessel runtime. | Used only as a current implementation baseline. It does not override the design architecture or justify assuming moving vessels are already solved. |

# Supersession Rule

Document 26F supersedes broad or incomplete statements that imply a ship is either a static decorative structure, a single vehicle actor with a cosmetic hull, or a special set of mandatory ship-only blocks. It does not supersede the identities and state owned by blocks, materials, blueprints, structures, inventories, NPCs, fluids, combat or UI.

The following truths remain external and authoritative:

- Set 25's qualified IDs, facets, pack manifests, validation and migration rules.
- Document 03's base block and shape definitions.
- Documents 04-06's item, recipe and resource truth.
- Documents 19-20 and 22I's blueprint and construction-source separation.
- Document 26B's liquid, containment and flooding interfaces.
- Document 26E's character-side vessel interaction.
- Document 26G's movement, buoyancy, stability, propulsion and navigation.
- Document 26H's detailed construction, repair, refit and salvage workflows.
- Document 26I's Vessel Forge authoring workspace.
- Document 26L's naval damage, sinking and wreck behaviour.
- Document 26O's final Godot runtime, networking, budgets and release architecture.

# Static Table of Contents

1. Locked Voxel Vessel Architecture Identity
2. Design Principles and Experience Targets
3. Explicit Non-Goals
4. Source-of-Truth and System Ownership
5. Canonical Terminology
6. Vessel Concept Layers and Record Separation
7. Vessel Class and Structural Profile Definitions
8. Vessel Blueprint, Candidate and Instance Separation
9. Shipwright Anchor and Candidate Registration
10. Candidate Bounds, Inclusion and Connected-Assembly Rules
11. Vessel Local Voxel Grid Architecture
12. Semantic Axes, Origin and Coordinate Frames
13. Blocks, Shapes, Block Entities and Attachments
14. Vessel Material Extension Facet
15. Mass, Volume and Property Aggregation Outputs
16. Structural Role Taxonomy
17. Automatic Structural-Role Inference
18. Manual Assignment, Overrides and Locking
19. Vessel Structural Graph
20. Keel, Spine and Primary Longitudinal Support
21. Frames, Ribs, Stringers and Transverse Support
22. Hull Shell, Exterior Surfaces and Waterline Regions
23. Decks, Floors, Bulkheads and Compartment Boundaries
24. Superstructure, Armour, Ballast and Interior Roles
25. Openings, Closures, Windows and Penetrations
26. Functional Components and Component-Role Graph
27. Stations, Sockets, Zones and Service Paths
28. Compartment and Enclosed-Volume Discovery
29. Traversal, Access, Crew Space and Emergency Egress
30. Shipwright Scan Pipeline
31. Structural Validation Architecture
32. Errors, Warnings, Recommendations and Explainability
33. Vessel Scale and Complexity Bands
34. Intended Environment, Use and Class Profiles
35. Commissioning Readiness and Certification Layers
36. Atomic Commissioning Transaction
37. Contained State, Inventories, NPCs and Attachments
38. Naming, Ownership, Registration and Permissions
39. Vessel Structural Lifecycle State Model
40. Safe Editing, Refit and Conversion Boundaries
41. Decommissioning, Static Conversion and Identity Preservation
42. Persistence, Save Records, Migration and Recovery
43. Simulation LOD, Promotion and Demotion
44. Multiplayer Authority and Moving-Container Consistency
45. Godot/Summer Engine Technical Boundaries
46. Performance Budgets and Scalability Levers
47. Shipwright UI, Inspection and Player Feedback
48. Accessibility, Assistance and Creative Modes
49. Registry Facets, Relationships, Capabilities and Reason Codes
50. Prototype Laboratories and Acceptance Evidence
51. Production Classification and Set 25 Integration
52. Main-Document, Forge and Content Integration Matrix
53. Decision Register
54. Handoff to Document 26G
55. Open Decisions for Later Documents
Appendix A. Canonical Glossary
Appendix B. Vessel Class and Structural Profile Template
Appendix C. Candidate and Vessel Instance Record Templates
Appendix D. Structural Role Catalogue
Appendix E. Scan and Commissioning State Transition Matrix
Appendix F. Validation and Reason-Code Catalogue
Appendix G. Prototype and Performance Test Matrix
Appendix H. Completion Checklist

# 1. Locked Voxel Vessel Architecture Identity

The Voxel Vessel Architecture is the constructed-mobile-world layer of Leyforge. It allows an assembly made from normal voxel content to retain its material history and internal spaces while gaining a persistent local frame, vessel-specific structural interpretation and later movement capability.

> **Locked Rule**
>
> A commissioned vessel is not one mesh, one health bar or one blueprint pasted onto a vehicle actor. It is a persistent mobile-container instance whose authoritative local grid records actual block identities, states, components, spaces, ownership, provenance and approved changes.

| Identity Layer | Design Meaning | Player-Facing Result |
| --- | --- | --- |
| Ordinary Voxel Construction | The candidate is built from the same blocks, shapes, components, inventories and project systems used elsewhere. | Shipbuilding feels like Leyforge building, not a separate vehicle customiser. |
| Vessel-Local Meaning | Local role assignments identify how each block contributes without replacing its block definition. | An oak beam may serve as a keel in one ship and a mast support in another. |
| Structural Readability | A simplified structural graph explains continuity, support, sealing and compartment boundaries. | The player can understand weaknesses and improve the design. |
| Persistent Mobile Space | Local cells, rooms, components, cargo and occupants remain stable while the vessel changes world position. | The ship can be a home, workshop, transport, warship or moving project. |
| Civilisation Compatibility | NPC projects, crews, ports, ownership, trade, law and fleets use the same persistent vessel identity. | Ships belong to the living world rather than spawning as anonymous encounters. |
| Data-Driven Expansion | Classes, roles, material facets, components, blueprints and validators are registered and pack-safe. | New cultures and dimensions can add vessels without rewriting the kernel. |
| Evidence-Based Simulation | Expensive movement and collision systems are admitted only after prototypes meet budgets. | Creative ambition is preserved without pretending technical risks do not exist. |

## 1.1 Vessel Experience Promise

A player should be able to build a recognisable or strange craft, mark its intended forward direction and waterline, ask the Shipwright system to scan it, inspect highlighted hull gaps and weak load paths, accept or override non-critical classifications, and commission the approved assembly without losing a single contained item. The same player should later be able to inspect any block and learn its material, local role, structural group, compartment, condition and connected component.

## 1.2 Creative Freedom Promise

The system must permit experimentation, not guarantee success. A dense stone barge, a fragile glass skiff, an iron-clad living-wood cutter or a mana-supported tower ship may all be attempted. The validation system distinguishes:

- impossible conversion or corrupted state;
- structurally invalid construction;
- technically commissionable but operationally poor design;
- unusual design requiring a declared specialist or magical support;
- valid design with warnings;
- validated design awaiting 26G movement certification.

# 2. Design Principles and Experience Targets

| Principle | Requirement |
| --- | --- |
| Build First, Commission Second | A vessel begins as world construction and becomes mobile only through an explicit validated transaction. |
| Existing Blocks Keep Identity | Vessel roles are local metadata; they do not replace stable block IDs or duplicate material truth. |
| Explain Before Rejecting | Every blocker must identify affected cells, missing relationships, responsible rule and possible repair. |
| Simplify the Right Layer | Use cached voxel-derived graphs and aggregate properties, not universal finite-element simulation. |
| Preserve Conservation | Conversion, recommissioning and decommissioning must not create or delete blocks, items, fluids or contained inventory. |
| Separate Commissioning from Seaworthiness | Structural conversion can succeed while launch, stability or propulsion certification remains pending. |
| Respect Player Construction | Player edits are never silently replaced, cleaned up or moved to satisfy a validator. |
| Make Unusual Materials Meaningful | Material properties create trade-offs rather than an invisible ship-block whitelist. |
| Support NPC and Player Parity | NPC-built vessels use approved blueprints and the same validation contracts, with bounded labour abstraction. |
| Keep Runtime Truth Singular | One Vessel Instance service owns mutable local structure; UI, AI, quests and tools submit commands. |
| Preserve Recoverability | Failed scans, failed commissioning, schema changes and optional-pack removal must leave recoverable evidence. |
| Design for Later Movement | Local identities, attachments, occupants and spaces must remain coherent under translation and rotation. |

# 3. Explicit Non-Goals

Document 26F does not attempt to provide:

- full computational fluid dynamics or fluid-rigid-body coupling;
- final buoyancy, hydrostatics, stability, wave response or capsizing calculations;
- realistic stress tensors, fatigue crack propagation or finite-element analysis;
- universal structural integrity for every building in the world;
- final sail aerodynamics, rowing, engines, mana drives or steering;
- unrestricted edits while a vessel is moving;
- final shipyard, dry-dock, repair, refit or salvage gameplay;
- final naval combat, fire, flooding, sinking or wreck conversion;
- a complete ship content catalogue or fixed real-world naval terminology;
- guaranteed support for mobile cities, skyships, submarines or interdimensional arks in the first production release;
- one Node, RigidBody3D, collision shape or network object per vessel block;
- automatic redesign of an invalid vessel;
- hidden assistance that moves ballast, seals holes or deletes conflicting blocks without permission;
- client-authoritative commissioning, ownership or local-grid mutation;
- mandatory expert knowledge before a player can build a simple raft or boat.

# 4. Source-of-Truth and System Ownership

| Truth | Primary Owner | 26F Responsibility |
| --- | --- | --- |
| Block identity, shape and base state | Document 03 / canonical registries | Reference stable IDs and preserve local instance state. |
| Material physical properties | Material/block facets owned by revised 03, 06 and 26N | Specify required vessel fields and consume compiled values. |
| Vessel class/profile identity | 26F extension facet under Set 25 kernel | Define structural expectations and permitted roles. |
| Vessel blueprint source | 26I / Blueprint Forge using 19-20 contracts | Define the semantic data and validation interface the source must satisfy. |
| Candidate static construction | World/structure service | Read under commissioning lock; never maintain a duplicate mutable copy. |
| Commissioned local voxel grid | Vessel Instance service | Own authoritative local cells, roles, structural graph and instance deltas. |
| Water, local fluid cells and containment queries | 26B | Supply geometry and material interfaces; do not duplicate fluid state. |
| Movement, buoyancy and navigation | 26G | Export geometry, mass, volume, surfaces and component graph. |
| Construction, repair, refit and salvage workflow | 26H | Define safe state boundaries and identity-preserving commands only. |
| Crew, jobs and vessel civilisation | 26J | Expose stations, access and ownership interfaces. |
| Naval damage, flooding, fire and sinking | 26L | Expose local structural groups, compartments and damage-addressable cells. |
| Runtime transform and mobile-frame authority | 26O / rewritten 18 | Store one authoritative world transform and local/world conversion. |
| UI and accessibility infrastructure | Document 17 | Define Shipwright information and reason codes. |
| Definition/pack validation | Set 25 | Register schemas, suites, evidence and release gates. |

## 4.1 One Mutable Vessel Truth

The commissioned vessel's local grid is authoritative. Generated meshes, collision, navigation graphs, room graphs, hydrostatic caches, thumbnails, minimaps and distant summaries are derived products. If they disagree with the local grid, they are invalidated and rebuilt; they never overwrite the local grid.

## 4.2 Field Ownership Rule

A vessel extension facet may add vessel-specific material suitability, structural-profile or component-role fields only through an approved Set 25 schema. It may not reinterpret base hardness, inventory capacity, damage state, fuel value, ownership or any other field already owned elsewhere.

# 5. Canonical Terminology

| Term | Meaning |
| --- | --- |
| Vessel Class | Immutable definition describing broad structural interfaces, scale eligibility and required capability relationships, not a unique built ship. |
| Structural Profile | Reusable set of vessel-specific structural expectations such as primary spine, shell continuity, compartment policy and exceptional support rules. |
| Vessel Blueprint | Authored or player-saved local-grid construction plan with semantic roles, markers and stages; not a built object. |
| Static Assembly | World-bound voxel construction that has not been registered as a vessel candidate. |
| Shipwright Anchor | World object that identifies the candidate scope, stores authorisation and starts scan/commissioning workflows. |
| Vessel Candidate | Temporary registered interpretation of a static assembly under one Anchor and scan configuration. |
| Candidate Snapshot | Read-only hashed view of included world cells and contained state used for validation; invalidated by relevant edits. |
| Vessel Role Assignment | Instance-local semantic role attached to a candidate or commissioned cell, such as keel, hull or bulkhead. |
| Structural Graph | Cached graph of load-path and attachment relationships between local cells, structural groups and components. |
| Structural Group | Addressable connected set of cells with shared role or function, used for validation, damage, repair and LOD. |
| Compartment | Detected or authored enclosed volume bounded by vessel cells and closures. |
| Vessel Frame | Persistent local coordinate frame containing cells, attachments, spaces and occupants. |
| Commissioning | Atomic validated conversion from static world assembly to commissioned Vessel Instance. |
| Structural Commission | Creation of the persistent Vessel Instance in an immobilised or safely constrained state. |
| Movement Certification | 26G decision that the commissioned vessel meets the selected floating, stability, control and propulsion requirements. |
| Recommissioning | Revalidation after approved structural edits or refit while preserving vessel identity and history. |
| Decommissioning | Controlled conversion to a non-mobile structure or retired state while preserving provenance and recoverability. |

# 6. Vessel Concept Layers and Record Separation

| Layer | Mutable at Runtime? | Identity and Purpose |
| --- | --- | --- |
| Vessel Class Definition | No | Qualified definition such as `leyforge.core.vehicle.vessel_class.coastal_general`. Provides interfaces and defaults. |
| Structural Profile Definition | No | Qualified reusable rule set for structural expectations and exceptional construction. |
| Component-Role Definition | No | Qualified semantic role for control, propulsion mounting, pumping, cargo, rescue or other vessel service. |
| Vessel Blueprint | Authoring source only | Stable blueprint identity plus revision, local cells, role hints, stages, markers and dependencies. |
| Static Assembly | Yes, world-owned | Actual world blocks before commission. May differ from a blueprint. |
| Vessel Candidate | Temporary | Anchor-scoped scan configuration, snapshot hash, inferred roles, warnings and intended-use declaration. |
| Vessel Instance | Yes, save-owned | Persistent commissioned identity with local cells, roles, transform, ownership, history and runtime state. |
| Generated Runtime Caches | Replaceable | Meshes, collision, structural graph, compartments, nav, mass/volume and presentation products. |
| Distant Vessel Summary | Yes, derived/persistent summary | Bounded representation preserving identity, essential state and resource conservation at LOD. |

> **Separation Rule**
>
> A blueprint may create many Vessel Instances. A Vessel Instance may diverge from its source blueprint through approved edits, damage and refit. It retains the source blueprint ID and revision as provenance, but the blueprint never becomes runtime authority.

# 7. Vessel Class and Structural Profile Definitions

A Vessel Class describes the broad kind of mobile water construct the runtime may support. It should avoid forcing real-world hull silhouettes or exact block recipes. Classes express interfaces, scale limits, required structural capabilities and allowed exceptional rules.

Required fields include:

| Field | Purpose |
| --- | --- |
| `definition_id` | Qualified stable class ID. |
| `schema_id` | Approved vessel-class extension schema. |
| `display_name_key` | Localised class name. |
| `parent_class_id` | Optional inheritance from a broader mobile-construct class. |
| `structural_profile_id` | Default structural rule set. |
| `allowed_scale_bands` | Permitted candidate complexity bands. |
| `required_component_roles` | Minimum semantic components for commissioning or later certification. |
| `permitted_exception_interfaces` | Magical levitation, living hull, external float, modular raft or other declared alternatives. |
| `required_capabilities` | Testable capability requirements, not named block requirements. |
| `forbidden_tags` | World-only, non-transferable or unsafe content exclusions. |
| `validation_profile_ids` | Required validator suites. |
| `technical_binding_id` | Runtime class/service binding owned by rewritten Document 18/26O. |
| `planning_metadata` | Production tier, risk and review status kept outside shipped gameplay fields. |

Structural Profiles define expected relationships rather than one shape. Example profiles may include:

- flexible raft frame;
- shallow craft with distributed bottom support;
- keeled sailing hull;
- barge box hull;
- catamaran or multi-hull frame;
- armoured displacement hull;
- living organic vessel;
- magically supported vessel;
- future submersible pressure hull.

The presence of a profile does not guarantee support in the first release. Unsupported profiles remain definition-valid only when their required runtime interfaces and validation evidence are present.

# 8. Vessel Blueprint, Candidate and Instance Separation

| Question | Blueprint | Candidate | Vessel Instance |
| --- | --- | --- | --- |
| What is it? | Reusable authored construction source. | Temporary interpretation of one world assembly. | Persistent commissioned built object. |
| Does it own current blocks? | No. | No; references world cells through snapshot. | Yes; owns local cells. |
| Can it contain role hints? | Yes. | Yes; inferred and manually adjusted. | Yes; committed role assignments and later deltas. |
| Can it contain inventories? | Declares markers/capacities only. | Reads actual block-entity state. | Stores actual inventory references and state. |
| Can it move? | No. | No. | Only after 26G certification and runtime authority. |
| Can it be edited? | In authoring tools. | Static world edits invalidate/re-run scan. | Only through approved 26H safe-state workflow. |
| Does it receive a save ID? | Definition/revision ID, not instance ULID. | Temporary candidate ID. | Persistent instance ID. |
| Does it preserve history? | Revision history only. | Scan trace only. | Ownership, construction, refit, damage and voyage history. |

A player may commission a completely freeform assembly with no source blueprint. In that case, the Vessel Instance records `source_blueprint_id: null` and may later export an approved snapshot into a personal blueprint through 26H-26I. The absence of a blueprint never removes the need for validation and provenance.

# 9. Shipwright Anchor and Candidate Registration

The Shipwright Anchor is the explicit boundary between ordinary construction and vessel interpretation. It may be represented as a placed block, temporary project object, dry-dock service marker or Forge test anchor, but it always resolves to one stable Anchor record.

The Anchor stores or references:

- anchor instance ID and owner;
- world transform and protected scan volume;
- candidate selection mode;
- bow, stern, up and centreline markers;
- intended keel path or primary support mode;
- intended reference waterline;
- intended vessel class/profile and use declarations;
- included/excluded attachment groups;
- commissioning seam markers;
- permissions and settlement/project links;
- latest candidate snapshot hash;
- role overrides and locked assignments;
- scan status, warnings, blockers and evidence;
- reserved future Vessel Instance ID during commissioning.

## 9.1 Anchor Placement Rules

- The player or NPC project must have permission to register the target volume.
- The Anchor cannot claim blocks owned by another protected structure without explicit transfer authority.
- Two active Anchors may not own the same candidate cell.
- The scan volume must be bounded and within the current scale band's authoring limits.
- World terrain may lie inside the bounding volume but is excluded unless deliberately marked transferable and detached.
- A moving or already commissioned vessel cannot be registered as a new static candidate; it uses recommissioning through 26H.
- Destroying an Anchor does not destroy the assembly. It cancels the candidate and preserves the static world state.

# 10. Candidate Bounds, Inclusion and Connected-Assembly Rules

Candidate selection uses a deterministic attachment graph rather than a simple rectangular copy. The bounding volume limits work; connectivity determines inclusion.

## 10.1 Default Inclusion

A cell or attached object is included when it:

1. lies inside the Anchor's permitted scan scope;
2. references a transferable definition;
3. is connected to the candidate graph through an accepted attachment relationship;
4. is not explicitly excluded by commissioning seam, scaffold, world-foundation or owner rule;
5. passes permission and pack-availability checks.

## 10.2 Attachment Relationships

| Relationship | Default Treatment |
| --- | --- |
| Full-face block adjacency | Strong physical attachment. |
| Shape-declared attachment face | Strong or directional attachment according to shape data. |
| Fastener, bracket or joint component | Explicit attachment edge. |
| Rope, chain, sail or rigging link | Flexible attachment edge; may form a child component group. |
| Inventory or logical network connection only | Does not include the object physically. |
| Terrain contact | World support, excluded unless marked as removable launch support. |
| Dock, slipway, scaffold or brace | Excluded through commissioning seam by default. |
| Nested carried object | Remains inventory content, not a vessel cell. |
| Moored external craft | Separate instance linked by mooring relationship. |

## 10.3 Connectivity Rules

- The candidate must contain one primary connected structural assembly unless the selected profile explicitly permits multi-hull or modular connected groups.
- Disconnected decorative debris inside the scan box is ignored and reported.
- Multi-hull profiles require explicit cross-structure connectors and one shared vessel frame.
- Flexible sails, ropes and banners may be child attachment groups without being part of the rigid structural graph.
- External tenders, lifeboats and cargo modules remain separate instances or nested modules when their class requires independent identity.
- A candidate that remains physically attached to terrain through unmarked cells cannot commission; the scanner presents the exact cut list.

# 11. Vessel Local Voxel Grid Architecture

A commissioned vessel stores its voxel construction in a local grid independent of world terrain chunks. The grid preserves the familiar block coordinates while allowing the entire vessel frame to move through the world.

The local-grid record must support:

- sparse or palette-compressed occupied-cell storage;
- stable local cell addresses;
- block definition IDs and shape/rotation state;
- compact per-cell runtime state where required;
- vessel-local role assignments;
- structural-group and compartment membership;
- block-entity references;
- attachment and socket references;
- damage and repair deltas;
- local fluid-cell references from 26B where activated;
- blueprint/provenance information;
- deterministic cache invalidation regions;
- local bounds and occupancy masks;
- schema and migration version.

## 11.1 No Node-per-Cell Rule

Voxel cells are compact data. Rendering combines faces or approved model pieces; collision uses merged, clustered or simplified products; interactions resolve from local-grid queries. A complex block entity may have a runtime Node while relevant, but ordinary hull cells do not.

## 11.2 Stable Local Cell Address

A local address should use the Vessel Instance ID plus integer cell coordinate and optional subcell/attachment key. It must remain stable across world movement, LOD changes and mesh rebuilds. If a refit removes the cell, history may retain a tombstone or repair lineage; the address is not silently reassigned to an unrelated cell.

# 12. Semantic Axes, Origin and Coordinate Frames

Every candidate establishes semantic vessel axes:

- **Forward** points toward the bow.
- **Aft** points toward the stern.
- **Starboard** is right when facing forward.
- **Port** is left when facing forward.
- **Up** is the intended upper direction while commissioned at rest.
- **Down** points toward the intended keel/bottom region.

These semantics are independent of display language and authoring camera. The Godot binding may map them to engine axes, but saves and validators reason through semantic directions.

## 12.1 Origin Selection

The Vessel Frame origin is chosen deterministically from:

1. explicit Anchor reference point when valid;
2. declared design origin in an approved blueprint;
3. computed stable fallback near the structural centre and centreline.

The origin should not be recomputed after every refit. Changing the origin is a migration-sensitive operation because it affects local addresses, attachments and occupant transforms.

## 12.2 Frame Hierarchy

| Frame | Example | Authority |
| --- | --- | --- |
| World Frame | Overworld or realm coordinate space. | World/realm service. |
| Vessel Frame | One commissioned ship transform. | Vessel spatial-state service. |
| Articulated Child Frame | Rudder, crane, mast mechanism or turret. | Component service under Vessel authority. |
| Interior/Room Reference | Cabin or hold navigation reference. | Derived room graph; not a separate world transform truth. |
| Occupant Local Frame | Player/NPC standing on vessel. | Character authority with validated frame membership. |
| Carried/Nested Container | Chest inventory, cargo crate, lifeboat module. | Owning container/instance service. |

Transfers between frames are explicit transactions. A player boarding does not become a child Node merely because the scene tree says so; the authoritative frame-membership record changes only after collision, access and permission validation.

# 13. Blocks, Shapes, Block Entities and Attachments

Every included cell retains its original block definition. Shape-aware geometry is essential because slabs, slopes, stairs, beams, posts, windows, arches and future hull pieces contribute different solid volume, exposed faces, attachment areas and sealing behaviour.

Required cell data includes:

| Field | Purpose |
| --- | --- |
| `local_coord` | Stable integer cell address. |
| `block_definition_id` | Canonical block identity. |
| `shape_id` | Full cube or approved shape definition. |
| `rotation_state` | Local orientation. |
| `runtime_state` | Damage, open/closed, powered or other owned state references. |
| `vessel_role_ids` | One primary role plus compatible secondary roles. |
| `structural_group_id` | Cached structural membership. |
| `compartment_boundary_flags` | Derived face/closure information. |
| `block_entity_instance_id` | Optional complex state reference. |
| `attachment_edges` | Explicit links not derivable from adjacency. |
| `provenance` | Blueprint cell, player edit, NPC project, repair or refit source. |

## 13.1 Non-Transferable Definitions

World-only terrain generators, region anchors, settlement roots, portal world anchors, protected boss arenas, infinite-resource sources and other definitions may declare `mobile_transfer: forbidden`. The scan must report them before commissioning. An optional replacement or detachment workflow belongs to 26H; 26F never silently converts them.

# 14. Vessel Material Extension Facet

Any block intended to participate in vessel analysis requires an approved material or block extension facet. Most values should be inherited from the material family and shape, with definition-specific overrides only where justified.

| Field | Meaning |
| --- | --- |
| `dry_mass_per_solid_volume` | Base mass contribution before absorbed liquid or contained state. |
| `solid_volume_fraction_by_shape` | Occupied volume used for mass, displacement and collision caches. |
| `longitudinal_strength_band` | Resistance along the primary lengthwise load path. |
| `transverse_strength_band` | Resistance across frames and decks. |
| `shear_and_joint_band` | Resistance at attachments and changing load direction. |
| `rigidity_band` | Tendency to hold shape under distributed load. |
| `flexibility_band` | Capacity to deform without immediate failure; not simply inverse rigidity. |
| `impact_toughness_band` | Resistance to collision and shock. |
| `sealing_profile` | Face sealing, permeability and closure compatibility. |
| `absorption_profile` | Liquid uptake, saturation mass and degradation. |
| `corrosion_profile` | Salt, freshwater, magical and chemical degradation interfaces. |
| `fire_profile` | Ignition, spread and heat damage references owned by general systems. |
| `attachment_face_profile` | Which faces/shapes form valid structural joints. |
| `ballast_suitability` | Whether dense placement may intentionally provide low mass distribution. |
| `vessel_role_suitability` | Weighted suitability and hard exclusions for role inference. |
| `magic_conductivity_and_stability` | Interfaces for runes, wards, living or levitated structures. |
| `damage_multipliers_by_state` | How cracked, burnt, corroded or saturated states change vessel properties. |
| `repair_and_salvage_tags` | References to existing repair and material recovery systems. |

## 14.1 No Fake Precision Rule

Prototype values use named bands and testable curves until physical scale, movement and damage prototypes justify finer numbers. A value such as `high longitudinal strength` is acceptable when its gameplay effect and comparison set are defined. Pretending to know exact real-world engineering values for fantasy materials would reduce trust rather than improve simulation.

# 15. Mass, Volume and Property Aggregation Outputs

26F computes or caches geometry- and material-derived outputs for later systems. It does not decide final buoyancy or motion.

Required outputs include:

- dry structural mass by cell, group and whole vessel;
- contained block-entity and cargo mass interfaces;
- solid volume and external occupancy mask;
- candidate enclosed-volume regions;
- exterior surface faces and normal directions;
- below/near/above reference-waterline regions;
- primary structural graph and weak-link evidence;
- centre-of-mass input components, without final dynamic solution;
- dense/ballast distribution map;
- absorption and saturation potential;
- sealing boundary map;
- armour and sacrificial-layer map;
- component mount and force-transfer points;
- local bounds and collision-bake inputs;
- cache version, source hash and invalidated regions.

The 26G service combines these outputs with live water, cargo, crew, fuel, waves, wind and movement state. The same dry vessel may therefore have different operational mass and stability after loading.

# 16. Structural Role Taxonomy

A vessel-local cell may have one primary structural role and compatible secondary roles. Roles describe intent and graph behaviour; they are not cosmetic labels.

| Role Family | Example Roles | Main Purpose |
| --- | --- | --- |
| Primary Support | keel, spine, keelson, centre girder, raft frame | Carries or distributes the main longitudinal structure. |
| Transverse Support | frame, rib, crossbeam, floor timber | Connects sides and transfers loads across the vessel. |
| Longitudinal Secondary | stringer, chine support, deck beam line | Strengthens lengthwise continuity outside the primary spine. |
| Exterior Shell | hull shell, bottom shell, side shell, transom | Forms exterior boundary and contributes sealing. |
| Horizontal Structure | deck, platform, floor, ceiling | Supports occupants, cargo and components. |
| Space Boundary | bulkhead, partition, tank wall, pressure boundary | Separates compartments or controlled spaces. |
| Upper Structure | superstructure, cabin shell, tower support | Creates above-deck spaces and mounts. |
| Protection | armour, sacrificial layer, impact buffer, warded shell | Protects underlying structure. |
| Mass Control | ballast, trim mass, counterweight | Intentionally controls mass distribution. |
| Functional Support | mast step, engine bed, weapon foundation, pump bed | Transfers component loads into structure. |
| Interior/Finish | lining, furniture support, decoration | Provides use or presentation without primary structural credit. |
| Flexible Attachment | rigging, sail support, rope net, canopy | Uses attachment graph rather than rigid voxel support. |
| Temporary Construction | scaffold, brace, cradle, slipway contact | Supports building but is excluded from commissioned structure by default. |

## 16.1 Multi-Role Rules

- A hull plank may be both `hull_shell` and `longitudinal_secondary` when the profile permits.
- Armour is normally a secondary role over a supporting shell or frame.
- Ballast may also be structural if the material and attachment are valid.
- Decoration cannot be manually labelled as keel to bypass strength requirements.
- Role compatibility and required evidence are defined by registered role definitions and the selected Structural Profile.

# 17. Automatic Structural-Role Inference

The Shipwright scanner should classify most ordinary designs without requiring the player to paint every block.

## 17.1 Inference Inputs

- semantic axes and centreline;
- intended reference waterline;
- exterior and enclosed-volume analysis;
- relative height and longitudinal position;
- material/shape suitability;
- adjacency and attachment graph;
- blueprint role hints;
- component mount requirements;
- repeated patterns and symmetry evidence;
- user-locked role seeds;
- selected Structural Profile.

## 17.2 Example Inference

| Pattern | Likely Inference |
| --- | --- |
| Lowest continuous centreline beam | Keel or primary spine candidate. |
| Repeated transverse supports connected to spine and shell | Frames/ribs. |
| Exterior faces below reference waterline | Hull/bottom shell candidates. |
| Broad walkable horizontal layer above enclosed volume | Deck. |
| Vertical interior boundary spanning shell/deck | Bulkhead. |
| Dense low-mounted blocks | Ballast candidate. |
| Exterior high-strength layer over shell | Armour candidate. |
| Tall support connected to mast step or sail sockets | Mast support group. |
| Above-deck enclosed shell | Superstructure/cabin. |

Inference results have confidence values and reasons. Low-confidence cells remain unassigned or receive a neutral role; the system must not pretend certainty.

# 18. Manual Assignment, Overrides and Locking

The player may inspect and adjust inferred roles through Shipwright tools.

Allowed actions include:

- paint or select a role over cells/groups;
- lock a correct role against future rescans;
- clear an inferred role;
- split or merge structural groups;
- mark a commissioning seam or temporary support;
- declare a component foundation;
- mark a compartment boundary or intentional opening;
- define a multi-hull connector;
- request a profile-specific exception;
- restore automatic inference for selected cells.

## 18.1 Override Safety

Manual assignment changes intent, not material truth. A weak decorative block assigned as `primary_spine` still contributes its actual strength, joint and damage properties. Overrides that conflict with hard role requirements become errors; questionable but possible overrides produce warnings and retain an audit trace.

## 18.2 Expert and Assisted Modes

- **Guided Mode** shows only necessary decisions and recommends repairs.
- **Standard Mode** exposes role overlays, compartments and warnings.
- **Expert Mode** exposes graph edges, property bands, candidate hashes and exception contracts.
- **Creative/Test Mode** may relax operational blockers but clearly labels the resulting vessel unsupported for survival or multiplayer release profiles.

# 19. Vessel Structural Graph

The Structural Graph is a cached vessel-local graph used to reason about continuity, support and later damage propagation without performing full engineering simulation.

Graph nodes may represent:

- individual critical cells;
- compressed runs of equivalent structural cells;
- structural groups;
- component foundations;
- compartment boundary groups;
- flexible attachment roots.

Graph edges record:

- attachment type and face;
- strength and flexibility band;
- load-direction compatibility;
- joint/fastener modifiers;
- damage and saturation modifiers;
- temporary or permanent status;
- provenance and explanation.

## 19.1 Required Graph Questions

The graph must answer:

- Is every major shell region connected to a valid support path?
- Does the primary structure connect bow, central body and stern according to the profile?
- Are heavy components connected to supporting groups?
- Are decks and bulkheads attached rather than visually intersecting?
- Does a multi-hull design have valid cross-structure connections?
- Which groups become isolated if one critical edge fails?
- Which cells are unsupported decoration versus functional structure?
- Which local regions require recalculation after an edit or damage event?

# 20. Keel, Spine and Primary Longitudinal Support

The system uses **primary spine** as the general capability; a traditional keel is one common provider. This supports rafts, barges, catamarans, living hulls and magical craft without forcing every design into one historical form.

A valid primary-support solution may be:

- one continuous keel or keelson;
- multiple longitudinal girders connected by frames;
- a distributed raft lattice;
- twin or multi-hull spines connected by validated crossbeams;
- a rigid box hull with distributed bottom/side structure;
- a living structural core;
- a magical support lattice with physical fallback requirements declared by profile.

The scanner evaluates continuity, material bands, joints, unsupported spans, end connections and component loads. A purely decorative painted line does not satisfy the capability.

## 20.1 Keel Path Authoring

The Shipwright may mark a preferred keel path. The scanner then:

1. validates cell connectivity and material suitability;
2. expands the path into a primary support group where required;
3. checks frame and shell connections;
4. reports discontinuities and weak transitions;
5. permits profile-approved branches or multiple spines;
6. exports the group to 26G and 26L as a critical structural reference.

# 21. Frames, Ribs, Stringers and Transverse Support

Frames and transverse supports connect the primary structure to the shell, decks and component foundations. They help the game distinguish a hollow decorative shell from a constructed vessel without requiring historically exact framing patterns.

## 21.1 Support Expectations

- Structural Profiles define maximum unsupported spans by qualitative band or tested curve.
- Frames may be full-height ribs, partial braces, bulkhead-integrated supports, crossbeams or distributed lattice members.
- Slabs, stairs and shaped beams contribute according to their attachment faces and solid volume.
- Repeated support spacing may be inferred from patterns but is not required to be perfectly symmetrical.
- Strong bulkheads may count as frames when their profile and attachment satisfy both roles.
- A monolithic magical or living shell may use a profile-approved distributed-support provider rather than visible ribs.
- Unsupported decorative poles or furniture never count merely because they intersect the hull.

## 21.2 Stringers and Secondary Longitudinal Support

Secondary lengthwise supports reduce weak spans, connect frames and provide mounting lines. The scanner groups continuous or near-continuous runs and reports abrupt changes in material, joint quality or cross-section. Their exact engineering effect is resolved through the Structural Profile and later prototypes, not hidden real-world formulas.

# 22. Hull Shell, Exterior Surfaces and Waterline Regions

The Hull Shell is the set of exterior boundary cells intended to separate vessel interior or buoyant volume from surrounding water and weather. A shell may be conventional, open-topped, multi-hull, raft-like or magically supported.

## 22.1 Exterior Surface Discovery

The scanner determines exterior faces from occupied local cells, shape masks, authored openings and candidate enclosed space. It records:

- outward-facing local face and normal;
- solid and open fractions;
- sealing profile and current closure state;
- role and supporting group;
- reference-waterline region;
- damage, permeability and absorption modifiers;
- adjacent compartment or exterior zone;
- armour or sacrificial covering;
- presentation material and bake grouping.

## 22.2 Reference Waterline

The player or blueprint provides an intended reference waterline used for classification and scan feedback. It is not the actual floating waterline; 26G calculates that from mass and displacement.

The reference waterline allows 26F to identify:

- shell regions intended to remain below water;
- near-water openings requiring closure attention;
- upper hull and freeboard regions;
- candidate deck height;
- likely submerged component mounts;
- initial compartment and rescue-access expectations.

If 26G later finds the actual waterline materially different, it returns a movement-certification failure or warning rather than changing 26F's authored reference silently.

## 22.3 Shell Continuity

A structurally commissioned candidate does not necessarily need a completely sealed hull. Rafts, open boats and pontoon structures can be valid profiles. However, the selected profile must explain how it provides the required watertight or floatation capability. A conventional enclosed hull with unexplained gaps below the reference waterline receives hard blockers or severe warnings according to profile.

# 23. Decks, Floors, Bulkheads and Compartment Boundaries

Decks support occupants, cargo and components while bulkheads divide internal spaces and contribute transverse structure.

## 23.1 Deck Rules

A deck candidate is a mostly walkable local surface connected to supporting groups. The scanner considers:

- walkable top faces and clearance;
- material/shape load suitability;
- support spacing;
- openings, ladders, hatches and stairs;
- component foundations and cargo zones;
- drainage and exposed-weather state;
- upper/lower compartment relationship.

Decks may be partial or multi-level. A flat decorative ceiling does not automatically become a deck if it lacks access, support or intended use.

## 23.2 Bulkhead Rules

Bulkheads are continuous or closure-completed boundaries between compartments. They may provide:

- structural support;
- flooding isolation;
- fire isolation;
- pressure separation;
- cargo or crew zoning;
- access control;
- noise, contamination or magical containment.

Document 26F detects boundary geometry and closure references. Document 26B owns liquid transfer, while 26L owns breach and fire consequences.

## 23.3 Boundary Face Model

Compartment boundaries are face-based rather than inferred only from block centres. A stair, slab, open fence, damaged door or decorative window may leave partial openings. Shape and closure definitions must expose sealing masks or approved approximations.

# 24. Superstructure, Armour, Ballast and Interior Roles

## 24.1 Superstructure

Superstructure includes cabins, towers, bridges, raised decks and other above-main-deck construction. The role itself does not limit height, but the scanner reports:

- mass placed high above the reference waterline;
- weak supports or narrow attachment footprints;
- obstructed visibility and component arcs;
- excessive unsupported overhangs;
- blocked access or rescue routes;
- likely wind exposure for 26D/26G.

Final stability consequences belong to 26G.

## 24.2 Armour

Armour is an exterior or internal protective layer. It must attach to a supporting structure and cannot substitute for a missing hull unless its own definition/profile permits sealing and structural support.

Armour metadata may include:

- protected structural group;
- coverage faces;
- sacrificial versus integral type;
- impact, fire, magic and corrosion interfaces;
- repair access;
- added mass distribution;
- detachable or modular status.

## 24.3 Ballast

Ballast is intentional low-mounted mass used by later stability calculations. The scanner identifies dense low cells and allows the player to confirm them as ballast. It records accessibility, containment, attachment and removability. Loose cargo is never treated as fixed ballast unless secured through an approved cargo/ballast relationship.

## 24.4 Interior and Finish

Interior lining, furniture, decoration and non-structural utility pieces remain real cells or attachments but contribute little or no structural credit. They still affect mass, fire load, navigation, occupancy, salvage and visual identity.

# 25. Openings, Closures, Windows and Penetrations

Openings are explicit parts of vessel design rather than scanner mistakes. They include doors, hatches, windows, gunports, vents, drains, cable passages, moon pools and component penetrations.

Each opening record includes:

| Field | Meaning |
| --- | --- |
| opening ID | Stable vessel-local identity. |
| boundary group | Hull, deck, bulkhead or superstructure boundary. |
| aperture mask | Shape-aware open area. |
| closure component | Optional door, hatch, shutter, plug, ward or valve. |
| current closure state | Runtime-owned open, closed, damaged, jammed or absent. |
| sealing band | Water, air, fire, pressure or magical containment capability. |
| access profile | Player/NPC/cargo passage rules. |
| automation interface | Optional remote control or sensor link. |
| emergency role | Escape, drainage, ventilation, weapon or rescue use. |

## 25.1 Intentional Opening Rule

The Shipwright may label an opening intentional, but doing so only suppresses the "unclassified gap" warning. It does not make the opening watertight. Later systems consume its actual closure and position.

## 25.2 Window Rule

Transparent blocks or window components may form valid shell boundaries only when their sealing and attachment facets support the selected profile. Visual transparency alone provides no structural or watertight credit.

# 26. Functional Components and Component-Role Graph

Specialised vessel components provide distinct functions that ordinary structural blocks do not. They remain block, item, machine or entity definitions in the canonical registries and attach vessel extension facets.

Starter component-role families include:

| Family | Example Roles | 26F Responsibility |
| --- | --- | --- |
| Command and Control | helm, tiller, command station, control core | Validate placement, access, ownership and structural foundation. |
| Propulsion Mount | mast step, oarlock, paddle mount, engine bed, mana-drive mount | Record force-transfer group and local orientation. |
| Steering Mount | rudder stock, steering linkage, thruster mount | Record attachment, movement clearance and control path. |
| Navigation | chart table, compass mount, survey instrument, magical navigator | Record station and data-access interfaces. |
| Mooring and Ground Handling | anchor mount, capstan, bollard, tow point, mooring cleat | Record structural connection and external socket. |
| Flood Control | pump, bilge intake, drain, valve, flood sensor | Bind to compartments and liquid interfaces. |
| Cargo and Storage | hold marker, rack, tank, secure cargo point, crane socket | Bind capacity, access and securing relationships. |
| Crew and Passenger | bunk, seat, work station, galley, sanitation, shelter | Bind occupancy, route and service markers. |
| Rescue and Boarding | ladder, rail opening, davit, lifeline point, gangway socket | Bind 26E interaction and emergency paths. |
| Power and Mana | fuel store, battery, conduit, shaft, wire, rune network | Bind existing power/mana interfaces and structural mounts. |
| Weapons and Defence | weapon foundation, ammunition store, shield/ward node | Record mount arcs, supporting group and safety zones; behaviour belongs to 26L. |
| Research and Utility | workshop, forge, laboratory, diving support, map room | Record operational spaces and resource connections. |

## 26.1 Component Role Is Not Component Identity

A component role expresses the interface required by the vessel. Multiple definitions may provide it. For example, a wooden tiller, mechanical wheel, rune helm and living command organ may all provide a control capability at different bands.

# 27. Stations, Sockets, Zones and Service Paths

Vessel systems require more than block adjacency. The semantic graph includes:

- crew stations;
- component attachment sockets;
- external interaction sockets;
- cargo zones;
- maintenance access zones;
- hazard clearance zones;
- firing/rotation/animation clearance;
- power, mechanical, mana, liquid and control network paths;
- boarding and rescue connectors;
- compartment service relationships.

## 27.1 Socket Rules

Sockets are authored semantic references, not arbitrary scene-tree markers. They have stable qualified role IDs and vessel-local transforms. Generated mesh sockets may realise them in Godot, but the source remains the local-grid/component record.

## 27.2 Service Path Rules

A component may require a valid path to:

- control station;
- power or mana source;
- fuel or input storage;
- output or exhaust boundary;
- liquid intake/discharge;
- maintenance access;
- crew work station;
- protected compartment.

26F validates declared connectivity and obvious geometric conflicts. Runtime throughput and operation belong to the owning systems.

# 28. Compartment and Enclosed-Volume Discovery

Compartment discovery converts local cell geometry and closure state into a graph of bounded spaces. It is required for flooding, fire, atmosphere, crew navigation, cargo zones and damage explanation.

## 28.1 Discovery Process

1. Build a shape-aware solid-face occupancy map.
2. Identify open local volume within and near vessel bounds.
3. Flood-fill connected air/open spaces using boundary masks.
4. Mark spaces connected to exterior through openings.
5. Split spaces at bulkheads, decks, pressure boundaries and closed closures.
6. Assign stable compartment IDs using deterministic seed cells and provenance.
7. Bind authored room/zone markers and component relationships.
8. Generate adjacency through doors, hatches, vents, drains and penetrations.
9. Record confidence and unresolved narrow/partial geometry.

## 28.2 Compartment Classes

| Class | Meaning |
| --- | --- |
| Exterior-Open | Space continuously connected to outside. |
| Open Boat Interior | Deliberately open occupied space within hull sides. |
| Enclosed Dry Candidate | Sealed under current closure state, subject to 26B validation. |
| Floodable Compartment | Enclosed space with liquid/flooding interface. |
| Tank/Reservoir | Intentionally contains liquid or gas under a declared profile. |
| Pressure Boundary | Future specialised space requiring pressure-capable construction. |
| Service Void | Small inaccessible or maintenance-only space. |
| Unresolved Pocket | Geometry could not be classified confidently and requires review. |

## 28.3 Stable Compartment Identity

Compartment IDs should survive harmless mesh rebuilds and closure changes. Major structural edits may split or merge compartments through explicit migration records so inventory, occupants, damage and quest references can be reconciled.

# 29. Traversal, Access, Crew Space and Emergency Egress

26F provides structural access data for later NPC, crew and boarding systems.

Validation considers:

- walkable surfaces and clearance;
- ladders, stairs, hatches and doors;
- station reachability from valid crew-entry points;
- cargo transfer routes and size classes;
- emergency exits from occupied compartments;
- blocked or one-way routes;
- unsafe drops and exposed edges;
- underwater or external maintenance paths;
- accessibility alternatives where a vessel is intended for passenger service;
- separation between public, crew, restricted and hazardous zones.

A structurally commissioned unmanned raft may require little interior access. A passenger, merchant or naval profile may require multiple egress routes or generate severe warnings. Detailed crew pathfinding and work schedules belong to 26J and 26O.

# 30. Shipwright Scan Pipeline

The scan is deterministic for the same candidate snapshot, configuration and registry snapshot.

## 30.1 Scan Stages

| Stage | Output |
| --- | --- |
| 1. Authority and Dependency Check | Permissions, enabled packs, schemas and transferable definitions. |
| 2. Candidate Snapshot | Included cells, attachments, block entities, contained state and source hash. |
| 3. Connectivity Scan | Primary assembly, child groups, terrain contacts and commissioning seams. |
| 4. Semantic Frame | Forward/up axes, origin, centreline, reference waterline and local coordinates. |
| 5. Geometry Bake | Shape masks, solid volume, exterior faces, bounds and occupancy. |
| 6. Material Aggregation | Mass and vessel property facets with missing-data report. |
| 7. Role Inference | Primary/secondary role candidates with confidence and reasons. |
| 8. Structural Graph | Support groups, attachments, weak links and disconnected regions. |
| 9. Space Discovery | Compartments, openings, closures and adjacency. |
| 10. Component Graph | Stations, sockets, foundations, networks and service paths. |
| 11. Access Review | Walkable areas, routes, boarding, maintenance and egress. |
| 12. Profile Validation | Hard requirements, exclusions, warnings and recommendations. |
| 13. Commissioning Plan | Atomic transfer set, excluded supports, expected instance records and rollback plan. |
| 14. Evidence Report | Snapshot hash, registry hash, validator versions, reason codes and visual overlays. |

## 30.2 Incremental Rescan

Edits invalidate only affected geometry, graph and compartment regions when safe. Changes to axes, waterline, class profile, primary spine or major boundaries may require a full rescan. The UI explains whether a change is local or global.

# 31. Structural Validation Architecture

Validation is layered so technical corruption is not confused with ordinary design weakness.

| Layer | Example Checks | Typical Severity |
| --- | --- | --- |
| Identity | Registered IDs, schemas, packs, aliases and source provenance. | Load/compile blocker. |
| Authority | Ownership, permissions, Anchor conflicts and protected content. | Commissioning blocker. |
| Transfer | Transferable cells, block entities, inventories and world anchors. | Commissioning blocker. |
| Connectivity | Candidate graph, terrain detachment and multi-hull connectors. | Blocker or profile error. |
| Geometry | Valid shapes, local bounds, collision feasibility and unresolved cells. | Error/warning. |
| Material | Required vessel facets, invalid exclusions and unsupported fantasy materials. | Error/warning. |
| Structure | Spine, support, shell attachment, heavy mounts and weak links. | Error/warning. |
| Space | Compartment boundaries, unexplained gaps and closure conflicts. | Error/warning. |
| Components | Required roles, foundations, service paths and access. | Profile-dependent. |
| Player Trust | Explainability, highlighted cells and actionable repairs. | Release blocker if opaque. |
| Transaction | Conservation, rollback, journal and post-conversion verification. | Non-waivable blocker. |
| Performance | Scale-band budgets, cache generation and runtime representation. | Admission blocker. |

## 31.1 Hard Blockers

Examples include:

- missing or invalid Anchor authority;
- no included transferable assembly;
- overlapping active candidate ownership;
- unregistered or unavailable critical definition;
- world-only anchor or terrain still embedded in the transfer set;
- disconnected primary assembly without an allowed profile;
- required local-frame orientation unresolved;
- local bounds or complexity above supported band;
- missing required material facets for critical cells;
- no valid structural-support provider for the selected class;
- block entities or inventories that cannot be transferred safely;
- occupied spaces that cannot be reconciled during conversion;
- commissioning plan fails conservation or rollback checks;
- unsupported pack dependency would be orphaned at runtime.

## 31.2 Operational Warnings

Examples include:

- reference waterline crosses unsealed openings;
- thin or poorly supported shell regions;
- concentrated high mass or unsecured low mass;
- long unsupported deck spans;
- only one crew access or escape route;
- no pump, anchor, rescue point or navigation station for the intended use;
- exposed components without maintenance access;
- incompatible materials at joints;
- absorbent or corrosion-prone shell materials;
- weak bow/stern continuity;
- sparse compartmentalisation;
- large wind-exposed superstructure;
- uncertain role inference requiring review.

Warnings do not become harmless merely because the player accepts them. They remain part of the Vessel Instance's commissioning history and may affect later certification, insurance, law, NPC trust or sale value.

# 32. Errors, Warnings, Recommendations and Explainability

Every scan result uses one of four player-facing dispositions:

| Disposition | Meaning | Player Choice |
| --- | --- | --- |
| Blocker | Commissioning cannot preserve rules, authority or structural minimums. | Must repair, change profile or cancel. |
| Severe Warning | Commissioning is possible only under explicit risk/exception policy; later certification likely fails. | Confirm where world/profile settings permit. |
| Warning | Design may function poorly or become vulnerable. | Accept or improve. |
| Recommendation | Quality, comfort, redundancy or future capability suggestion. | Optional. |

## 32.1 Explainability Trace

Each result includes:

- stable reason code;
- local cells/groups/components affected;
- rule owner and validator version;
- observed value/band and required value/band;
- why the condition matters;
- likely downstream systems affected;
- suggested repair categories, not automatic redesign;
- whether a manual role change, physical rebuild, component, profile or specialist exception can resolve it;
- scan snapshot and registry hashes.

## 32.2 Visual Overlays

Overlays may show:

- included/excluded cells;
- terrain contacts and cut list;
- primary spine and support graph;
- hull exterior and reference-waterline regions;
- compartments and leaks/gaps;
- mass-density distribution;
- component foundations and service paths;
- access and egress routes;
- blockers, warnings and uncertain inference.

Critical information also appears as text, icons and inspectable lists. Colour alone is never required.

# 33. Vessel Scale and Complexity Bands

Scale bands protect performance and make requirements readable. Exact cell counts, dimensions and network budgets remain provisional until 26O prototypes are measured.

| Band | Intended Complexity | Typical Examples | Production Direction |
| --- | --- | --- | --- |
| Band 0 - Simple Floatable Construct | Very small, minimal systems, simple access. | Raft, coracle, improvised platform, tiny canoe-like build. | Core Candidate prototype. |
| Band 1 - Small Craft | One local crew area, limited cargo/components. | Rowboat, fishing boat, river skiff, small sailboat. | Strong early production candidate. |
| Band 2 - Vessel | Multiple compartments/stations and meaningful cargo. | Barge, cutter, merchant vessel, patrol ship, expedition vessel. | Expansion production target after core architecture. |
| Band 3 - Large Vessel | Large crew, many systems, complex damage and LOD. | Ocean merchant, warship, research ship, mobile workshop. | Requires performance and multiplayer evidence. |
| Band 4 - Mobile Complex | District-like spaces or civilisation-scale capability. | Floating fortress, ark, mobile settlement. | Deferred unless Ash approves after dedicated prototypes. |
| Extraordinary | Non-standard movement or containment. | Submersible, skyship, voidship, living titan vessel. | Separate capability/profile admission; not assumed. |

## 33.1 Band Is Not Hull Type

A stone raft and wooden skiff may share a scale band while using different Structural Profiles. Band controls budgets and representation; class/profile controls semantic requirements.

# 34. Intended Environment, Use and Class Profiles

During candidate registration, the Shipwright declares intended contexts. These declarations select validators and future certification targets; they do not prevent other use.

## 34.1 Environment Profiles

- sheltered pond/lake;
- river and canal;
- shallow coastal;
- open coastal/offshore;
- oceanic;
- storm-prone;
- polar/ice;
- magical/corrupted sea;
- realm-specific water;
- underwater-support platform;
- future submersible environment.

## 34.2 Use Profiles

- personal transport;
- fishing and harvesting;
- ferry/passenger;
- cargo and trade;
- exploration and survey;
- rescue and patrol;
- combat/escort;
- shipyard/support;
- mobile base/workshop;
- magical research;
- colonisation or migration;
- ceremonial/cultural.

A vessel can declare multiple intended uses. Each adds conditional completeness requirements. For example, passenger use may require protected access and egress; cargo use requires secured zones; rescue use requires boarding and towing interfaces.

# 35. Commissioning Readiness and Certification Layers

Commissioning is divided into understandable layers.

| Layer | Owner | Meaning |
| --- | --- | --- |
| Candidate Registered | 26F | Assembly, Anchor and permissions identified. |
| Scan Complete | 26F | Geometry, roles, structure, spaces and components analysed. |
| Structurally Ready | 26F | No commissioning blockers remain. |
| Commissioning Plan Ready | 26F/runtime | Transfer set, rollback, contained state and target instance prepared. |
| Structural Commissioned | 26F/runtime | Persistent Vessel Instance exists in immobilised/safe state. |
| Floatation Certified | 26G | Actual mass/displacement and water support are valid. |
| Control Certified | 26G | Steering/control interfaces meet intended profile. |
| Propulsion Certified | 26G | At least one valid propulsion capability exists where required. |
| Navigation/Route Certified | 26G/26K | Vessel may undertake selected route/environment class. |
| Crewed/Service Certified | 26J | Required stations, staff and supplies are valid for NPC operation. |
| Combat/Legal Certified | 26L/26J/26K | Weapons, safety and ownership meet local rules where applicable. |

> **No False Promise Rule**
>
> "Commissioned" means the construction is now a persistent Vessel Instance. It does not mean it will float upright, survive a storm, carry passengers legally or move under its own power.

# 36. Atomic Commissioning Transaction

Commissioning must be journalled and atomic because it removes blocks from world chunks and creates a persistent mobile container.

## 36.1 Pre-Commit Phase

1. Lock the candidate against world edits and inventory mutations.
2. Revalidate Anchor, ownership, dependencies and snapshot hash.
3. Reserve the persistent Vessel Instance ID.
4. Build the final local-cell map and provenance table.
5. Validate every block entity, inventory, attachment and occupant transfer.
6. Create the target Vessel Instance record in pending state.
7. Generate rollback plan and expected conservation ledger.
8. Confirm safe placement transform and collision clearance.
9. Request player/authority confirmation with final warnings.

## 36.2 Commit Phase

1. Write transaction journal start.
2. Copy authoritative candidate data into pending local-grid storage.
3. Transfer block-entity and inventory ownership references.
4. Transfer approved local fluid state or mark external fluid boundaries.
5. Remove included cells/attachments from world structures under transaction.
6. Spawn or activate the immobilised Vessel Instance representation.
7. Verify cell counts, item ledgers, instance links and spatial bounds.
8. Commit the Vessel Instance and world-chunk changes together.
9. Release locks and publish commissioning event/history.

## 36.3 Rollback Behaviour

If any protected check fails, the runtime restores the original world cells and contained state from the journal, removes the pending Vessel Instance, preserves the candidate and emits a recoverable failure report. Partial success is prohibited.

## 36.4 Conservation Ledger

The transaction records counts and identities for:

- block cells by definition/state;
- block entities;
- inventories and stacks;
- contained liquids where represented locally;
- attachments and nested containers;
- occupants and owned entities;
- project reservations and ownership links;
- power/mana network connections detached or transferred.

# 37. Contained State, Inventories, NPCs and Attachments

A candidate may contain far more than simple blocks. Commissioning must classify each contained object.

| Object | Required Treatment |
| --- | --- |
| Storage block inventory | Preserve instance ID and contents; change container/spatial owner. |
| Machine progress | Pause, transfer if supported, or block commissioning with explanation. |
| Power/mana network | Detach world connections; preserve internal network topology where valid. |
| NPC/player standing inside | Require safe state, consent/authority and valid local-frame placement. |
| Tamed creature/livestock | Transfer only through approved occupant/cargo relationship and space checks. |
| Loose dropped items | Collect into a transfer set, secure to cargo, or require clearing according to settings. |
| Active fire/hazard | Normally blocks commissioning or requires explicit emergency profile. |
| Local fluid cells | Transfer bounded internal fluid state only through 26B interface. |
| Quest/event marker | Rebind through stable local/spatial relationship or block if world-anchored. |
| Portal/realm anchor | World-anchored by default; transfer only through explicit mobile-interface support. |
| Attached scaffold/cradle | Exclude through commissioning seam. |
| Rope/mooring to world | Detach or convert to external socket relationship. |

## 37.1 Occupant Safety

The default player-facing workflow asks occupants to leave before commissioning. Advanced shipyards or multiplayer may permit occupied commissioning if every occupant receives a safe local placement and the server confirms consent/authority. No character is teleported, duplicated or trapped silently.

# 38. Naming, Ownership, Registration and Permissions

Commissioning creates a persistent social and legal object as well as a structure.

Required instance identity includes:

- persistent Vessel Instance ID;
- player-facing name and localisation-safe fallback;
- source blueprint ID/revision or freeform provenance;
- builder/commissioner identity;
- current owner and ownership type;
- settlement, faction or fleet affiliation where applicable;
- registration port/authority where applicable;
- flag, insignia or culture presentation references;
- access roles and permission profile;
- legal status, stolen/captured/disputed flags owned by later systems;
- commissioning timestamp and world location;
- structural profile and accepted warning record;
- refit lineage and history.

## 38.1 Ownership Types

Possible ownership models include:

- individual player;
- player group;
- NPC individual or household;
- settlement;
- faction or navy;
- merchant company;
- quest/event authority;
- abandoned/unclaimed;
- disputed/captured;
- shared public service.

## 38.2 Permission Actions

Separate permissions control:

- inspect;
- board;
- operate controls;
- access cargo;
- assign crew;
- edit/refit;
- commission/recommission;
- rename/register;
- attach/tow/moor;
- arm/disarm;
- sell/transfer/scrap.

The same person need not hold every permission. Multiplayer clients never infer ownership from who is physically aboard.

# 39. Vessel Structural Lifecycle State Model

| State | Meaning | Allowed Structural Actions |
| --- | --- | --- |
| Static Assembly | Ordinary world construction. | Normal building rules. |
| Candidate Registered | Anchor owns scan scope. | Static edits allowed but invalidate relevant scans. |
| Scan Blocked | Technical/authority dependency prevents valid scan. | Repair dependencies or cancel. |
| Scan Review | Roles, spaces and warnings available. | Adjust roles, seams, profile and physical build. |
| Structurally Ready | Commissioning blockers cleared. | Prepare transaction or continue edits. |
| Commissioning Locked | Candidate and contained state frozen. | No ordinary edits; cancel before commit. |
| Commissioned Immobilised | Vessel Instance exists but cannot move. | Inspect, connect shipyard services, begin 26G certification. |
| Docked Edit Lock | Safe-state refit boundary. | 26H-authorised edits and repairs. |
| Operational | Movement certified and runtime active. | No ordinary structural edits while moving. |
| Grounded/Beached/Cradled | Supported by terrain/structure under 26G/26H rules. | Limited repair or recovery. |
| Disabled | Cannot operate safely; structure persists. | Repair, tow, evacuate or abandon. |
| Structurally Compromised | Critical graph/compartment damage. | Emergency actions; 26L governs consequences. |
| Decommissioning | Preparing static conversion or retirement. | Transaction-locked. |
| Static Converted | Identity preserved as structure/museum/wreck-restoration source. | Structure rules. |
| Quarantined | Missing pack/schema or migration failure. | Safe inspection/recovery only. |

# 40. Safe Editing, Refit and Conversion Boundaries

A commissioned Vessel Instance cannot accept unrestricted block edits during motion. Editing a moving local grid would destabilise collision, navigation, mass and multiplayer authority.

26F locks the following baseline:

- ordinary structural placement/removal requires an approved safe state;
- the vessel must be immobilised through dock, dry dock, cradle, beaching, magical suspension or equivalent certified support;
- active movement, combat or severe hazard normally blocks structural edits;
- small non-structural inventory attachments may use separate runtime mounting rules;
- any structural edit invalidates affected caches and may require recommissioning;
- edits preserve local cell provenance and refit history;
- critical role removal may immediately downgrade certification or mark the vessel disabled;
- client prediction may show previews but the authority commits cells and resources;
- 26H owns detailed tools, labour, scaffolds, repair recipes, salvage and staged refit workflows.

# 41. Decommissioning, Static Conversion and Identity Preservation

A vessel may be retired, permanently grounded, converted into a building, displayed as a museum ship, incorporated into a port, dismantled or transformed into a restoration project. Decommissioning must preserve history rather than deleting the Vessel Instance and spawning unrelated blocks.

## 41.1 Static Conversion Transaction

A controlled static conversion:

1. confirms the vessel is safely immobilised and collision-clear;
2. reserves target world cells and structure identity;
3. snapshots local grid, contained state and history;
4. maps local cells to world coordinates;
5. validates terrain, ownership and protected-volume conflicts;
6. transfers local cells and block entities into a persistent structure instance;
7. preserves former Vessel Instance ID as lineage or linked retired identity;
8. verifies conservation and commits atomically;
9. archives movement certification and vessel-specific runtime state;
10. exposes optional restoration/recommissioning hooks.

## 41.2 Dismantling Boundary

Dismantling is a resource and labour workflow owned by 26H and the recipe/project systems. It does not occur by deleting the local grid. Salvage yield, damage loss, ownership and environmental consequences remain authoritative transactions.

## 41.3 Wreck Boundary

A wreck produced by damage or sinking is not the same as deliberate decommissioning. Document 26L determines whether the Vessel Instance remains a disabled mobile container, becomes a grounded/sunken wreck structure, fragments into multiple salvage instances or enters a restoration state.

# 42. Persistence, Save Records, Migration and Recovery

The Vessel Instance is a high-value player creation and requires stronger persistence guarantees than an ordinary transient actor.

## 42.1 Persistent Records

At minimum, saves preserve:

- Vessel Instance ID and schema version;
- class/profile and source blueprint provenance;
- local voxel palette, cells, shapes, rotations and runtime state;
- vessel-local role assignments and manual locks;
- structural groups and critical graph lineage;
- compartment IDs, boundaries and adjacency;
- component instances, sockets, stations and service relationships;
- block entities, inventories and nested containers;
- owner, permissions, settlement/faction/fleet links;
- authoritative world transform and current frame state;
- commissioning warnings and accepted exceptions;
- refit, repair, damage and decommissioning history;
- cache hashes and invalidation markers;
- optional-pack payloads and unknown extension quarantine;
- transaction journals and recovery metadata.

Derived meshes, collision, navigation and most scan caches may be rebuilt from source data, but retained hashes allow corruption and regression detection.

## 42.2 Save Transaction Safety

Vessel-local edits, cargo transactions, frame transfers and commissioning/decommissioning operations use atomic saves or journals compatible with the project's current save-recovery direction. A crash may lose an uncommitted action, but it must not leave both world blocks and duplicate vessel cells.

## 42.3 Migration Rules

- Stable block, component and role IDs resolve through aliases and tombstones.
- A changed local-grid schema runs versioned migration before activation.
- Missing optional definitions enter quarantine with original payload preserved.
- Unsupported vessel profiles load immobilised rather than disappearing.
- Compartment split/merge migrations emit explicit lineage records.
- Origin/frame changes require coordinate migration and attachment reconciliation.
- A failed migration preserves the original save and offers safe-mode inspection/export.
- Runtime may regenerate caches only after source migration succeeds.

## 42.4 Expansion Removal and Reactivation

If maritime packages are disabled, commissioned Vessel Instances are quarantined or converted through an approved recovery profile. Base blocks and inventories that remain known are not silently scattered into the world. Re-enabling compatible packages restores the original identity and state where possible.

# 43. Simulation LOD, Promotion and Demotion

Vessels must remain persistent when far from players without simulating every cell, occupant and component.

| LOD | Representation | Preserved Truth |
| --- | --- | --- |
| LOD 0 - Full Local | Local grid interaction, occupants, block entities, detailed collision, compartments and components. | Complete active state. |
| LOD 1 - Reduced Local | Simplified collision/visuals, reduced AI, bounded component updates, local grid retained. | Structure, cargo, ownership, damage and key services. |
| LOD 2 - Vessel Summary | Route/anchor position, aggregate condition, cargo ledger, crew summary, capability status. | Identity and authoritative resource/state totals. |
| LOD 3 - Fleet/Regional Summary | Group mission, route segment, risk, timing and event outcomes. | Vessel membership, essential cargo/crew/condition and history. |
| Quarantine/Safe Mode | No normal operation. | Full source payload and recovery metadata. |

## 43.1 Promotion

Promotion reconstructs the local presentation from the preserved Vessel Instance source. It reconciles:

- world transform and route position;
- local grid and damage state;
- cargo and component summaries;
- crew/occupant identities and placements;
- active fluids/fires/hazards through owning systems;
- nearby structures, terrain and Water Body context;
- pending events and transactions.

Promotion may change representation, not identity or conserved totals.

## 43.2 Demotion

Demotion requires:

- no unresolved player-critical interaction;
- no uncommitted structural transaction;
- bounded summarisation of components and occupants;
- conservation ledger reconciliation;
- retained critical damage/compartment state;
- stable route/anchor relationship;
- explanation of any approximated distant outcome.

# 44. Multiplayer Authority and Moving-Container Consistency

Moving voxel interiors create authority, latency and reconnection risks. The server/host owns:

- candidate registration and Anchor permissions;
- scan snapshot accepted for commissioning;
- role assignments and structural edits;
- Vessel Instance creation/destruction;
- local-grid mutation and block-entity ownership;
- authoritative Vessel Frame transform;
- occupant frame membership;
- cargo and component transactions;
- lifecycle and certification state;
- save/journal commits.

## 44.1 Client Responsibilities

Clients may:

- preview role painting and commissioning plans;
- display derived overlays and local interaction highlights;
- predict ordinary camera/character movement within approved tolerances;
- request edits, boarding, operation and inventory actions;
- cache read-only local-grid chunks for rendering.

Clients may not create cells, change ownership, commit role overrides, move the vessel, duplicate cargo or resolve commissioning.

## 44.2 Moving-Interior Consistency

The implementation must preserve:

- stable local positions for players, NPCs and items;
- explicit transfer between world and Vessel Frames;
- one authoritative transform hierarchy;
- collision and character movement that do not double-apply vessel velocity;
- safe reconnect placement when the vessel moved while disconnected;
- server correction without throwing occupants through geometry;
- deterministic local cell identity despite network relevance changes.

## 44.3 Join and Reconnection

A reconnecting player restores:

- vessel instance and frame membership;
- local transform and safe fallback location;
- current permission and ownership state;
- nearby compartment and hazard snapshot;
- active interaction or workstation state where recoverable;
- world fallback rescue path if the vessel no longer exists.

# 45. Godot/Summer Engine Technical Boundaries

The exact runtime architecture is finalised in 26O and the rewritten Document 18, but 26F locks the service boundaries required to avoid disposable prototypes.

## 45.1 Recommended Godot Responsibilities

| Service/Resource | Responsibility |
| --- | --- |
| VesselDefinitionRegistry | Compiled class, profile, role and extension definitions. |
| ShipwrightCandidateService | Anchor registration, snapshots, role inference and scan orchestration. |
| VesselLocalGridStore | Compact authoritative local cells and per-cell state. |
| VesselStructuralService | Structural graph, groups, support queries and cache invalidation. |
| VesselSpaceService | Exterior masks, openings, compartments and access graph. |
| VesselCommissioningService | Atomic world-to-vessel and vessel-to-world transactions. |
| VesselInstanceService | Lifecycle, ownership, local records and authoritative commands. |
| VesselSpatialFrameService | World transform, local/world conversion and nested frame membership. |
| VesselBakeService | Mesh, collision, occlusion, interaction and future nav bake products. |
| VesselLODService | Promotion, demotion and summary reconciliation. |
| VesselValidationService | Registered validators, reason codes and evidence reports. |
| VesselDebugLab | Structural overlays, cache inspection, conservation and frame tests. |

## 45.2 Data Types

Use versioned Godot `Resource` or equivalent serialisable definitions for immutable data, compact binary/structured records for local grids, and explicit save records for mutable instances. Scene files may present components or test rigs but are not the sole source of vessel identity.

## 45.3 Threading and Job Boundaries

Scan, mesh, collision and graph jobs may run off the main thread using immutable snapshots. They may not mutate the live world or Vessel Instance directly. Results return with source hashes and are discarded if the candidate changed.

Commissioning commit, scene-tree mutation, physics-server interaction and final authoritative state changes occur through controlled main-thread or engine-safe transactions.

## 45.4 Summer Engine Rule

Summer Engine may generate implementation tasks, tests, migration code and developer tools only from approved contracts. Every generated change remains reviewable in the ordinary Godot repository, names its source requirement and passes the same validation gates as human-authored work.

# 46. Performance Budgets and Scalability Levers

Exact budgets require packaged prototype evidence. 26F establishes what must be measured.

## 46.1 Budget Categories

- candidate scan time by scale band;
- incremental rescan time after local edits;
- local-grid memory per occupied cell;
- structural graph memory and rebuild cost;
- compartment detection time;
- mesh and collision bake time;
- active block-entity count;
- interaction query cost;
- multiplayer snapshot and delta bandwidth;
- save size and save/restore duration;
- LOD promotion/demotion time;
- commissioning transaction duration and rollback size;
- worst-case number of relevant vessels per player/port.

## 46.2 Scalability Levers

- scale-band cell and dimension caps;
- palette compression and run/region encoding;
- structural-group compression instead of cell-level graph everywhere;
- dirty-region incremental rebuilds;
- merged collision and interaction proxies;
- distance-based block-entity activation;
- compartment summarisation;
- capped concurrent scan jobs;
- phased commissioning preparation before short commit lock;
- reduced LOD presentation and abstract route simulation;
- server relevance filtering and delta replication;
- optional restriction of extraordinary shapes or moving subcomponents.

## 46.3 Player-Visible Performance Rule

A large scan may take measurable time, but the UI shows stages and permits safe cancellation before commit. The system must not freeze without explanation or hold a multiplayer world edit lock while performing work that could have been prepared from a snapshot.

# 47. Shipwright UI, Inspection and Player Feedback

The Shipwright experience extends the existing building and inspection grammar.

## 47.1 Main Workflow

1. Place or activate a Shipwright Anchor.
2. Preview candidate bounds and included/excluded cells.
3. Mark forward, up, centreline, reference waterline and profile.
4. Run scan with visible stages.
5. Review structural, shell, compartment, component and access overlays.
6. Apply role adjustments or physically rebuild.
7. Re-run affected validation.
8. Review final blocker/warning summary and conservation plan.
9. Confirm name, owner and commissioning.
10. Enter commissioned immobilised inspection and 26G certification flow.

## 47.2 Inspection Panels

A Vessel Inspector should expose layered summaries:

- identity and ownership;
- class/profile and intended uses;
- included cell and component totals;
- structural readiness;
- shell and compartment status;
- material/mass summary;
- critical groups and weak links;
- access and emergency routes;
- accepted warnings;
- source blueprint and refit history;
- pending certification and later-system requirements.

## 47.3 Cell Inspection

Pointing at a vessel cell can show:

- block/material identity;
- primary and secondary vessel roles;
- structural group;
- connected support path;
- compartment boundary faces;
- damage and sealing state;
- source/provenance;
- permitted edit/repair action;
- relevant reason codes.

# 48. Accessibility, Assistance and Creative Modes

Shipwright validation must support players who enjoy building but do not want dense engineering information.

Required options include:

- guided role assignment;
- automatic camera focus on reported cells;
- text descriptions for all overlays;
- non-colour patterns and symbols;
- adjustable overlay opacity and animation;
- reduced motion and reduced flashes;
- simplified terminology with optional expert definitions;
- controller-complete selection and painting;
- scalable text and narration-ready labels;
- confirmation delay or hold options for commissioning;
- undo/history for role edits before commissioning;
- warning-severity filters that never hide blockers;
- creative/test profile clearly separated from survival/multiplayer validation;
- optional symmetry helpers that preview but do not silently alter blocks;
- repair suggestions grouped by goal rather than exact forced design.

## 48.1 Assisted Construction Boundary

Assistance may suggest "strengthen this unsupported span" or "close these three hull openings". It may preview candidate cells and material alternatives. It may not consume resources, place blocks or change roles without an explicit player/NPC project action.

# 49. Registry Facets, Relationships, Capabilities and Reason Codes

## 49.1 Required Definition Families

26F proposes or consumes the following qualified definition families under Set 25:

- vehicle/vessel class;
- structural profile;
- vessel role;
- component role;
- attachment type;
- opening/closure profile;
- scale/complexity profile;
- intended environment/use profile;
- commissioning validator profile;
- spatial frame and transfer profile;
- capability definitions where testable;
- lifecycle state definitions;
- reason-code definitions;
- test fixtures and workload profiles.

Whether `vessel` becomes its own domain or remains a `vehicle` extension is an admission decision for 25B-25C and 26O. This document is compatible with either outcome.

## 49.2 Important Relationships

| Relationship | Example |
| --- | --- |
| `instance_of` | Vessel Instance -> Vessel Class. |
| `built_from_blueprint` | Vessel Instance -> Vessel Blueprint revision. |
| `uses_structural_profile` | Candidate/Class -> Structural Profile. |
| `cell_has_role` | Local cell -> Vessel Role. |
| `group_supports_group` | Frame group -> Hull shell group. |
| `component_mounted_to` | Helm/engine/mast -> Structural foundation. |
| `bounds_compartment` | Bulkhead/shell/opening -> Compartment. |
| `contains_component` | Vessel Instance -> Component Instance. |
| `owned_by` | Vessel Instance -> Player/settlement/faction/company. |
| `registered_at` | Vessel Instance -> Port/authority. |
| `member_of_fleet` | Vessel Instance -> Fleet binding. |
| `moored_to` | Vessel Instance -> Dock/anchor/other vessel. |
| `occupant_in_frame` | Character -> Vessel Frame. |
| `derived_from_refit` | Current structural revision -> Prior revision. |

## 49.3 Capability Candidates

Capabilities become registered only when their semantics are testable. Candidate families include:

- mobile_container.local_voxel_space;
- vessel.structural_continuity;
- vessel.shell_boundary;
- vessel.compartmentalisation;
- vessel.control_station;
- vessel.mooring_attachment;
- vessel.safe_boarding;
- vessel.cargo_securing;
- vessel.emergency_egress;
- vessel.maintenance_access;
- vessel.floatation_support (owned with 26G);
- vessel.propulsion and steering (owned with 26G);
- vessel.flood_control (owned with 26B/26L).

## 49.4 Standard Reason-Code Families

- `VSL_ID_*` identity/dependency;
- `VSL_AUTH_*` ownership/permission;
- `VSL_SEL_*` candidate selection;
- `VSL_FRAME_*` orientation/local frame;
- `VSL_MAT_*` material facet;
- `VSL_ROLE_*` role assignment;
- `VSL_STR_*` structural graph;
- `VSL_SHELL_*` shell/opening;
- `VSL_COMP_*` compartment;
- `VSL_COMPONENT_*` component/foundation;
- `VSL_ACCESS_*` access/egress;
- `VSL_TXN_*` commissioning transaction;
- `VSL_SAVE_*` persistence/migration;
- `VSL_NET_*` authority/reconnection;
- `VSL_PERF_*` budget/scale;
- `VSL_CERT_*` downstream certification.

# 50. Prototype Laboratories and Acceptance Evidence

The vessel architecture is high risk and must be proven through isolated laboratories before large content production.

| Laboratory | Required Scenario | Evidence |
| --- | --- | --- |
| Candidate Selection Lab | Freeform build attached to dock/scaffold with exclusions and cut list. | Deterministic included-cell set and explainable contacts. |
| Shape and Surface Lab | Cubes, slabs, stairs, slopes, beams and windows in one hull. | Correct volume, exterior faces, attachment and sealing masks. |
| Role Inference Lab | Raft, box barge, keeled hull, catamaran and unusual tower craft. | Useful classifications, confidence and manual override. |
| Structural Graph Lab | Break/support critical groups and multi-hull connectors. | Weak-link explanation and bounded incremental rebuild. |
| Compartment Lab | Doors, hatches, bulkheads, partial shapes and intentional openings. | Stable compartments, split/merge lineage and 26B interface. |
| State Transfer Lab | Chests, machines, inventories, mana networks and contained liquids. | No loss, duplication or orphaned references. |
| Commissioning Crash Lab | Interrupt every transaction phase. | Original world or committed vessel recovered, never both/none. |
| Freeform Material Lab | Wood, stone, iron, glass, absorbent and magical materials. | Properties affect reports without whitelist rejection. |
| Moving Frame Lab | Commissioned test vessel with players/NPCs/items under translation and rotation. | Stable local identities and no double-motion defects. |
| Multiplayer Lab | Two clients role-edit, board, commission and reconnect. | Server authority, conflict handling and safe recovery. |
| LOD Lab | Detailed vessel travels beyond relevance and returns. | Identity, cells, cargo and condition preserved. |
| Migration Lab | Change block aliases, role schema and compartment version. | Safe migration/quarantine and original-save preservation. |
| Scale Lab | Representative Band 0-3 cell/component counts. | Scan, memory, bake, save and network profiles. |
| Accessibility Lab | Controller, non-colour overlays, narration labels and guided mode. | Full workflow without mouse or colour dependence. |

## 50.1 Minimum Acceptance Rules

A Core Candidate architecture is not accepted until it can:

- register a static freeform assembly;
- preserve ordinary block IDs and shape states;
- infer useful roles and allow explicit correction;
- identify structural groups and at least simple compartments;
- explain all hard blockers with highlighted cells;
- commission atomically into a persistent local-grid instance;
- preserve inventories and block entities;
- save/load and recover after interrupted commissioning;
- maintain player position on an immobilised/moving-frame prototype;
- decommission or restore through an identity-preserving test;
- remain within approved provisional Band 0-1 budgets;
- pass keyboard, mouse and controller workflows.

# 51. Production Classification and Set 25 Integration

| Feature Package | Proposed Classification | Reason |
| --- | --- | --- |
| Vessel Local-Grid Data Model | Core Candidate Foundation | Required before any real functional vessel. |
| Static Candidate and Shipwright Anchor | Core Candidate | Proves the player fantasy without full ocean combat. |
| Basic Role Inference and Guided Validation | Core Candidate | Essential for accessibility and arbitrary-block construction. |
| Atomic Commissioning/Decommissioning | Core Candidate | Proves conservation and persistence. |
| Band 0-1 Structural Profiles | Core Candidate | Raft and small craft evidence. |
| Complex Compartments and Multi-Deck Vessels | Expansion | Requires broader performance and flooding evidence. |
| Band 2-3 Ships | Expansion | Depends on 26G-26O and multiplayer/LOD results. |
| Living/Magical Structural Exceptions | Expansion/Signature | Require 09, 26N and dedicated validators. |
| Mobile Fortress/Settlement | Deferred | Scope and performance risk. |
| Submersible Pressure Hull | Deferred Expansion | Requires dedicated pressure, life-support and motion systems. |
| Skyship/Dimensional Vessel | Deferred Signature | Requires separate movement/world-transfer contracts. |

## 51.1 Set 25 Deliverables Required

26F must eventually publish:

- registered schema and extension-facet proposals;
- namespace/domain admission decision;
- relationship and capability registrations;
- content-pack manifest dependencies;
- validator and test-suite definitions;
- save/migration/quarantine contracts;
- production-tier classification;
- representative block/material completeness requirements;
- performance workload profiles;
- source-of-truth and decision audit entries;
- Summer Engine implementation task decomposition.

# 52. Main-Document, Forge and Content Integration Matrix

| Source/Target | Required Integration |
| --- | --- |
| 00 - Master Bible | Add mobile voxel vessels as a player, builder, civilisation and world-shaping fantasy. |
| 01 - Core Loop | Add build -> scan -> commission -> certify -> crew/supply -> sail -> repair/upgrade loop. |
| 02 - Progression | Add Shipwright skill, structural knowledge, vessel certification and specialist exceptions. |
| 03 - Blocks | Add vessel material facet fields, transferability, attachment faces and role suitability. |
| 04 - Items | Add Shipwright Anchor/tool items and component instances without duplicating block identity. |
| 05 - Recipes | Add staged vessel projects, components and commissioning/refit transactions in later documents. |
| 06 - Resources | Add sealing, fibre, fastener, ballast, corrosion and maritime material uses. |
| 07 - NPC Village | Add Shipwright jobs and NPC project/ownership hooks in 26H/26J. |
| 08 - Automation | Add internal vessel networks, dock connections and component interfaces. |
| 09 - Magic | Add registered structural support, living hull and magical exception interfaces. |
| 11-12 - Worldgen/Structures | Define static candidate, shipyard/dock and structure-to-mobile boundary. |
| 15 - Quests/Events | Bind commissioning, registration, unsafe vessel, theft, recovery and history events. |
| 16 - Combat | Address structural groups and components for later naval damage. |
| 17 - UI/UX | Add Shipwright scan, overlays, warnings, transaction and inspector flows. |
| 18 Replacement | Implement local grids, spatial frames, authority, persistence, LOD and test architecture in Godot. |
| 19-20 | Reuse blueprint, project, semantic marker, terrain survey and runtime instance separation. |
| 21-22 | Add vessel-capable voxel/blueprint authoring roles, sockets and bake contracts. |
| 23 | Add derived vessel audio/VFX/animation event surfaces without owning gameplay truth. |
| 25H-25J | Admit block/item/resource families and progression chains selected for production. |
| 25K | Register asset budgets, sockets, events, icons and presentation dependencies. |
| 25L | Add implementation tasks, evidence owners and integrity checks. |
| 26G | Consume mass, volume, exterior, waterline, structural and component outputs. |
| 26H | Consume safe edit states, structural roles, provenance and transaction boundaries. |
| 26I | Author blueprints, role hints, markers, test contexts and compiled vessel source. |
| 26J-26K | Consume ownership, stations, access, class, cargo and fleet relationships. |
| 26L | Consume cell/group identities, shell faces, openings, compartments and critical graph. |
| 26N | Populate progression, registry content and magic/automation connections. |
| 26O | Finalise Godot services, budgets, multiplayer, persistence and release gates. |

# 53. Decision Register

| Decision ID | Decision | Status | Owner |
| --- | --- | --- | --- |
| DEC-26F-001 | Commissioned vessels use a persistent local voxel grid separate from terrain chunks. | Locked by 26A/confirmed | 26F |
| DEC-26F-002 | Ordinary block IDs remain unchanged; vessel roles are vessel-local semantic assignments. | Locked | 26F |
| DEC-26F-003 | A Shipwright Anchor bounds, authorises and snapshots a candidate assembly. | Locked | 26F |
| DEC-26F-004 | Candidate inclusion uses deterministic attachment connectivity plus explicit commissioning seams. | Approved Baseline | 26F |
| DEC-26F-005 | Vessel structural analysis uses a simplified cached graph, not universal real-time engineering. | Approved Baseline | 26F/26O |
| DEC-26F-006 | The general requirement is a primary support provider; a traditional keel is one provider. | Approved Baseline | 26F |
| DEC-26F-007 | Structural roles may be inferred and manually overridden, but overrides cannot change material truth. | Locked | 26F |
| DEC-26F-008 | Compartment discovery is shape- and closure-aware and produces stable vessel-local IDs. | Approved Baseline | 26F/26B |
| DEC-26F-009 | Structural commissioning creates an immobilised Vessel Instance; operational certification belongs to 26G and later systems. | Locked Resolution | 26F/26G |
| DEC-26F-010 | Commissioning and static conversion are atomic conservation transactions with rollback. | Non-Waivable | 26F/26O |
| DEC-26F-011 | Unrestricted structural edits are prohibited while moving; 26H defines safe refit workflows. | Confirmed 26A Baseline | 26F/26H |
| DEC-26F-012 | Scale bands control budgets but do not force hull shape or real-world vessel names. | Approved Baseline | 26F |
| DEC-26F-013 | Commissioning warnings persist in vessel history and may be consumed by law, trade and NPC trust systems. | Approved Baseline | 26F/26J/26K |
| DEC-26F-014 | Whether vessel becomes a new registry domain or a vehicle extension remains an admission decision. | Pending | 25B-25C/26O |
| DEC-26F-015 | Exact Band 0-3 block, dimension, component and bandwidth caps remain prototype-driven. | Pending | 26O/Ash |
| DEC-26F-016 | Occupied commissioning is optional advanced scope; default workflow clears occupants. | Approved Baseline | 26F/26O |
| DEC-26F-017 | Mobile complexes, submersibles and extraordinary craft remain deferred unless separately approved. | Locked Scope Control | Ash |

# 54. Handoff to Document 26G

Document 26G must consume the commissioned Vessel Instance and structural outputs defined here while owning all actual movement and water-support behaviour.

26G receives:

- stable Vessel Instance and Vessel Frame identity;
- local voxel occupancy and shape masks;
- dry structural mass and contained-mass interfaces;
- solid volume and exterior surface faces;
- reference waterline and intended environment profiles;
- candidate enclosed volumes and compartment graph;
- shell sealing/absorption interfaces from 26B facets;
- primary spine, structural groups and component foundations;
- ballast and dense-mass distribution;
- control, propulsion, steering, anchor, towing and mooring component-role graph;
- world/Vessel Frame transfer requirements;
- scale band and runtime budget class;
- structural lifecycle and certification layer model;
- reason-code and evidence interface.

26G owns:

- displacement and actual waterline;
- buoyancy sampling and support forces;
- centre of mass/centre of buoyancy and stability;
- draft, trim, list, capsizing and grounding;
- water/wave/current drag and force application;
- sails, oars, paddles, engines and mana-drive output;
- rudders, steering and control response;
- anchors, mooring, towing and docking movement;
- vessel movement state and operational certification;
- route navigation, shallow-water constraints and sea-worthiness bands.

26G may return certification blockers or warnings, but it may not silently change local cells, role assignments, ownership or source blueprint data.

> **26F Completion Statement**
>
> Document 26F establishes Leyforge's vessel architecture as a persistent mobile voxel-container system rather than a cosmetic vehicle layer. It defines class, blueprint, candidate and instance separation; Shipwright Anchors; deterministic connected-assembly selection; semantic local frames; compact local grids; shape-aware block storage; vessel material facets; mass, volume and surface outputs; structural roles; role inference and manual overrides; primary support, frames, hulls, decks, bulkheads, armour, ballast and openings; component, socket and service graphs; compartment and access discovery; explainable scan and validation stages; scale and intended-use profiles; structural commissioning distinct from movement certification; atomic conservation transactions; contained-state transfer; ownership and permissions; lifecycle, editing, decommissioning, persistence, LOD, multiplayer, Godot/Summer Engine and performance boundaries; Shipwright UI; accessibility; registry contracts; prototype laboratories; Set 25 integration; and the formal handoff to 26G. The set may now proceed to vessel movement without treating a blueprint as an instance, a role label as physical truth, or commissioning as proof that a ship will float.

# 55. Open Decisions for Later Documents

| Open Decision | Owner | Required Evidence |
| --- | --- | --- |
| Final registry domain: `vehicle` extension or dedicated `vessel` domain. | 25B-25C, 26O, Ash | Schema complexity, cross-vehicle reuse and migration impact. |
| Exact cell/dimension/component caps for each scale band. | 26O, Ash | Packaged scan, memory, physics, save and network profiling. |
| Minimum structural rules for the simplest raft and canoe-like craft. | 26F-26G | Guided-mode playtests and false-rejection analysis. |
| How much symmetry/pattern inference is useful without misclassifying creative builds. | 26I/26F | Diverse blueprint corpus. |
| Whether occupied commissioning enters the first multiplayer release. | 26O, Ash | Safety, consent, latency and crash-recovery tests. |
| How flexible rigging and sails are stored and damaged. | 26F, 26G, 26L, 26I | Animation/physics and network prototype. |
| Whether modular detachable sections are separate nested Vessel Instances. | 26F, 26H, 26O | Identity, collision, save and gameplay use cases. |
| How living hull growth modifies local cells and structural graphs. | 09, 26N, 26H | Magic/resource progression and mutation safety. |
| Legal/insurance treatment of accepted commissioning warnings. | 26J-26K | Economy, culture and accessibility review. |
| Pressure-hull and submersible structural profile. | Future expansion | 26B pressure, 26E life support and 26G motion evidence. |
| Mobile settlement/floating fortress architecture. | Future dedicated scope | NPC, LOD, performance, combat and save evidence. |

# Appendix A. Canonical Glossary

| Term | Canonical Use |
| --- | --- |
| Anchor | Shipwright Anchor record and world representation. |
| Attachment Edge | Physical or flexible relationship connecting cells/groups/components. |
| Candidate | Temporary Anchor-scoped interpretation of a static assembly. |
| Commissioning Seam | Marked boundary between transferred vessel content and world supports/dock/scaffold. |
| Commissioning Snapshot | Hash-bound read-only view used for validation and transaction preparation. |
| Compartment | Stable vessel-local bounded space. |
| Component Role | Functional vessel interface provided by one or more canonical components. |
| Local Cell | One occupied vessel-grid coordinate plus shape/state/role data. |
| Primary Spine | General structural continuity capability; may be a keel, lattice or multi-girder system. |
| Structural Group | Connected addressable set of cells with shared graph function. |
| Structural Profile | Reusable validation and relationship expectations for a vessel construction family. |
| Structural Commission | Persistent local-grid instance creation before operational movement certification. |
| Vessel Frame | Persistent local coordinate space owned by one Vessel Instance. |
| Vessel Instance | Save-owned commissioned mobile-container object. |
| Vessel Role | Vessel-local semantic interpretation of a cell. |

# Appendix B. Vessel Class and Structural Profile Template

```yaml
vessel_class:
  definition_id: leyforge.core.vehicle.vessel_class.example
  schema_id: leyforge.system.schema.vehicle.vessel_class.v1
  display_name_key: vessel.class.example.name
  parent_class_id: leyforge.core.vehicle.vessel_class.general_surface
  structural_profile_id: leyforge.core.vehicle.structural_profile.example
  allowed_scale_bands: [band_1, band_2]
  required_component_roles:
    - leyforge.system.component_role.vessel.control.primary
    - leyforge.system.component_role.vessel.mooring.basic
  required_capabilities:
    - capability_id: leyforge.system.capability.vessel.structural_continuity
      minimum_band: standard
  permitted_exception_interfaces: []
  forbidden_tags:
    - transfer.world_anchor
  validation_profile_ids:
    - leyforge.system.validation_profile.vessel.structural_standard
  technical_binding_id: leyforge.system.interface.runtime.vessel_mobile_container

structural_profile:
  definition_id: leyforge.core.vehicle.structural_profile.example
  primary_support_modes: [keel, distributed_box]
  required_role_families: [primary_support, transverse_support, exterior_shell]
  shell_policy: enclosed_or_declared_open_profile
  compartment_policy: optional
  maximum_unsupported_span_band: medium
  multi_hull_policy: forbidden
  exceptional_support_interfaces: []
  warning_thresholds:
    weak_joint_ratio: balance_draft
    unassigned_critical_cells: 0
```

# Appendix C. Candidate and Vessel Instance Record Templates

## C.1 Candidate Record

```yaml
vessel_candidate:
  candidate_id: candidate:<ulid>
  anchor_instance_id: structure_instance:<ulid>
  owner_id: player_or_settlement:<id>
  world_frame_id: world_instance:<id>
  scan_bounds: {min: [x,y,z], max: [x,y,z]}
  semantic_axes:
    forward: [x,y,z]
    up: [x,y,z]
  origin_world_cell: [x,y,z]
  reference_waterline_local: balance_draft
  intended_class_id: leyforge.core.vehicle.vessel_class.example
  structural_profile_id: leyforge.core.vehicle.structural_profile.example
  intended_environment_ids: []
  intended_use_ids: []
  included_world_cells: snapshot_reference
  excluded_contacts: []
  snapshot_hash: sha256:...
  registry_snapshot_hash: sha256:...
  role_assignments: []
  locked_role_assignments: []
  structural_graph_hash: sha256:...
  compartment_graph_hash: sha256:...
  validation_report_id: validation_report:<ulid>
  status: scan_review
```

## C.2 Vessel Instance Record

```yaml
vessel_instance:
  instance_id: vessel_instance:<ulid>
  class_id: leyforge.core.vehicle.vessel_class.example
  structural_profile_id: leyforge.core.vehicle.structural_profile.example
  source_blueprint_id: null
  source_blueprint_revision: null
  commissioning_candidate_id: candidate:<ulid>
  local_grid_record_id: vessel_grid:<ulid>
  vessel_frame_id: spatial_frame:<ulid>
  world_transform: authoritative_reference
  owner_id: player_or_settlement:<id>
  permission_profile_id: leyforge.core.authority_profile.vessel.private
  scale_band_id: band_1
  lifecycle_state: commissioned_immobilised
  structural_revision: 1
  accepted_warning_ids: []
  structural_group_record_id: vessel_structure:<ulid>
  compartment_record_id: vessel_compartments:<ulid>
  component_instance_ids: []
  block_entity_instance_ids: []
  inventory_container_ids: []
  current_certifications: []
  history_record_id: vessel_history:<ulid>
  schema_version: 1
  quarantine_payloads: []
```

# Appendix D. Structural Role Catalogue

| Role ID Suffix | Primary/Secondary | Typical Evidence | Common Conflict |
| --- | --- | --- | --- |
| `primary_support.keel` | Primary | Low continuous centreline support. | Disconnected segments or decorative-only material. |
| `primary_support.distributed_frame` | Primary | Connected lattice/box support. | No shared load path. |
| `transverse.frame` | Primary/Secondary | Crosswise support linking shell and spine. | Visual intersection without attachment. |
| `longitudinal.stringer` | Secondary | Lengthwise support connected across frames. | Unsupported cosmetic strip. |
| `shell.bottom` | Primary | Exterior lower boundary with support. | Open gaps or non-sealing material. |
| `shell.side` | Primary | Exterior side boundary. | Detached armour mistaken for shell. |
| `shell.transom` | Primary | Aft exterior boundary. | Open propulsion penetration. |
| `deck.main` | Primary/Secondary | Walkable supported horizontal surface. | No clearance or support. |
| `boundary.bulkhead` | Primary/Secondary | Interior vertical boundary. | Door/opening breaks seal. |
| `superstructure.support` | Secondary | Above-deck load path. | Excessive overhang/high mass. |
| `protection.armour` | Secondary | Layer attached over protected group. | No supporting shell. |
| `mass.ballast_fixed` | Secondary | Dense low secured cells. | Loose/unsecured cargo. |
| `foundation.mast` | Secondary | Strong local mount tied to spine/frames. | Isolated deck placement. |
| `foundation.engine` | Secondary | Heavy machinery bed and service clearance. | Weak support or blocked access. |
| `interior.finish` | Non-structural | Lining/decorative cell. | Used to fake structural requirement. |
| `temporary.scaffold` | Excluded | Construction support tagged temporary. | Accidentally included in transfer set. |

# Appendix E. Scan and Commissioning State Transition Matrix

| From | Trigger | To | Failure Behaviour |
| --- | --- | --- | --- |
| Static Assembly | Register Anchor | Candidate Registered | Preserve assembly; report permission/bounds error. |
| Candidate Registered | Run scan | Scan Review | Keep prior valid report if job cancelled. |
| Scan Review | Edit cells/roles/profile | Candidate Dirty | Invalidate affected caches only. |
| Candidate Dirty | Rescan | Scan Review | Preserve edits and reason trace. |
| Scan Review | Clear blockers | Structurally Ready | Warnings remain visible. |
| Structurally Ready | Prepare commissioning | Commissioning Locked | Unlock on cancelled preparation. |
| Commissioning Locked | Commit transaction | Commissioned Immobilised | Atomic rollback to static assembly. |
| Commissioned Immobilised | 26G certification | Operational or Docked | 26G reason codes; local grid unchanged. |
| Operational | Enter safe support state | Docked Edit Lock | No structural edits if support invalid. |
| Docked Edit Lock | Complete approved refit | Recommissioning Required | Preserve old revision until commit. |
| Recommissioning Required | Rescan/commit | Commissioned Immobilised | Roll back refit transaction on failure. |
| Any commissioned state | Missing dependency/migration failure | Quarantined | Preserve payload and immobilise. |
| Commissioned Immobilised | Static conversion commit | Static Converted | Atomic rollback on world conflict. |

# Appendix F. Validation and Reason-Code Catalogue

| Code | Default Severity | Meaning |
| --- | --- | --- |
| `VSL_AUTH_NO_COMMISSION_PERMISSION` | Blocker | Actor cannot commission selected property. |
| `VSL_SEL_TERRAIN_ATTACHED` | Blocker | Included assembly remains attached to world terrain outside approved seam. |
| `VSL_SEL_OVERLAPPING_ANCHOR` | Blocker | Candidate cells are already claimed by another active Anchor. |
| `VSL_FRAME_FORWARD_UNRESOLVED` | Blocker | Bow/forward direction is missing or invalid. |
| `VSL_FRAME_ORIGIN_UNSTABLE` | Error | No deterministic local origin can be established. |
| `VSL_MAT_REQUIRED_FACET_MISSING` | Blocker/Error | Critical block lacks vessel material fields. |
| `VSL_ROLE_PRIMARY_SUPPORT_MISSING` | Blocker | Selected profile has no valid primary support provider. |
| `VSL_ROLE_LOW_CONFIDENCE_REGION` | Warning | Scanner cannot classify a critical region confidently. |
| `VSL_STR_SUPPORT_PATH_BROKEN` | Blocker/Error | Critical shell/component group lacks valid support path. |
| `VSL_STR_WEAK_JOINT_CLUSTER` | Warning | Concentrated weak attachment edges detected. |
| `VSL_SHELL_UNCLASSIFIED_OPENING` | Warning/Blocker | Exterior boundary gap lacks declared opening role. |
| `VSL_SHELL_REFERENCE_WATERLINE_GAP` | Severe Warning | Intended waterline crosses unsealed boundary. |
| `VSL_COMP_UNRESOLVED_POCKET` | Warning | Space classification is uncertain. |
| `VSL_COMPONENT_FOUNDATION_INVALID` | Error | Functional component lacks valid structural mount. |
| `VSL_ACCESS_STATION_UNREACHABLE` | Warning/Error | Required station cannot be reached from crew entry. |
| `VSL_ACCESS_NO_EMERGENCY_EGRESS` | Warning/Error | Occupied profile lacks required escape path. |
| `VSL_TXN_CONSERVATION_MISMATCH` | Non-Waivable Blocker | Expected and transferred cells/items/state differ. |
| `VSL_TXN_BLOCK_ENTITY_TRANSFER_UNSUPPORTED` | Blocker | Contained block entity cannot move safely. |
| `VSL_SAVE_SCHEMA_UNSUPPORTED` | Quarantine | Vessel cannot activate under current schema. |
| `VSL_NET_FRAME_MEMBERSHIP_CONFLICT` | Error | Character/container has conflicting spatial owners. |
| `VSL_PERF_SCALE_BAND_EXCEEDED` | Blocker | Candidate exceeds approved runtime band. |
| `VSL_CERT_MOVEMENT_PENDING` | Information | Structurally commissioned but not certified by 26G. |

# Appendix G. Prototype and Performance Test Matrix

| Test ID | Scenario | Pass Condition |
| --- | --- | --- |
| 26F-T01 | Face-connected raft with temporary shore brace. | Brace excluded; raft selection stable. |
| 26F-T02 | Box hull with one hidden gap. | Gap highlighted with exact face and compartment effect. |
| 26F-T03 | Keeled hull using mixed beams/slopes. | Useful spine/frame/shell inference. |
| 26F-T04 | Catamaran with crossbeams. | One candidate with two hull groups and valid connector graph. |
| 26F-T05 | Stone-heavy craft. | Accepted for scan; material/mass warnings exported to 26G. |
| 26F-T06 | Glass window below reference waterline. | Seal/attachment checked from actual facet. |
| 26F-T07 | Chest and active machine aboard candidate. | State preserved or explicit blocker; never lost. |
| 26F-T08 | Interrupted commit after world-cell removal begins. | Journal restores one coherent state. |
| 26F-T09 | Two clients edit roles simultaneously. | Authority resolves conflict; no divergent committed roles. |
| 26F-T10 | Player reconnects on commissioned frame. | Safe local placement and correct frame membership. |
| 26F-T11 | Demote/promote Band 2 vessel. | Cell hash, cargo and critical state unchanged. |
| 26F-T12 | Disable optional material pack. | Vessel quarantined with original payload preserved. |
| 26F-T13 | Compartment split by new bulkhead. | Stable lineage and owning-system reconciliation. |
| 26F-T14 | Controller-only commissioning. | Entire workflow completable without pointer. |
| 26F-T15 | Maximum provisional Band 1 candidate. | Scan/save/bake within approved budgets. |

# Appendix H. Completion Checklist

- [x] Vessel architecture identity and non-goals defined.
- [x] Set 25 identity, schema, pack, validation and migration contracts consumed.
- [x] Class, Structural Profile, blueprint, candidate and instance separated.
- [x] Shipwright Anchor and connected-assembly selection defined.
- [x] Local voxel grid and semantic coordinate frames defined.
- [x] Shape, block entity, attachment and provenance handling defined.
- [x] Vessel material extension fields defined without duplicating base truth.
- [x] Structural role taxonomy, inference and overrides defined.
- [x] Structural graph, primary spine, frames, hull, decks and bulkheads defined.
- [x] Armour, ballast, openings and functional component graph defined.
- [x] Compartments, access and emergency egress interfaces defined.
- [x] Deterministic Shipwright scan and explainable validation defined.
- [x] Scale bands and intended environment/use profiles defined.
- [x] Structural commissioning separated from 26G movement certification.
- [x] Atomic commissioning, rollback and conservation ledger defined.
- [x] Inventories, block entities, fluids, occupants and attachments handled.
- [x] Ownership, permissions, lifecycle and safe edit boundaries defined.
- [x] Decommissioning and identity-preserving static conversion defined.
- [x] Persistence, migration, LOD, multiplayer and reconnection defined.
- [x] Godot/Summer Engine services and performance evidence defined.
- [x] Shipwright UI and accessibility requirements defined.
- [x] Registry, relationship, capability and reason-code direction defined.
- [x] Prototype laboratories and production classification defined.
- [x] Main-document and Forge integration matrix defined.
- [x] Decision register and open decisions recorded.
- [x] Formal handoff to Document 26G completed.
