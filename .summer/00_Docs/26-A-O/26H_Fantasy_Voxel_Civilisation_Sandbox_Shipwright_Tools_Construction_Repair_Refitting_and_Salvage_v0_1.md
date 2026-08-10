# FANTASY VOXEL CIVILISATION SANDBOX

## DOCUMENT SET 26

# 26H - Shipwright Tools, Construction, Repair, Refitting and Salvage

*Version 0.1 - Detailed Design Bible and Technical Foundation Draft*

A data-driven shipbuilding and vessel-work architecture for freeform voxel vessels, covering shipwright professions, surveys, worksites, staged construction, resource conservation, scaffolds, launch and haul-out, damage diagnosis, emergency and dry-dock repair, identity-safe refitting, upgrades, decommissioning, wreck claims, salvage, restoration, NPC labour, multiplayer authority, persistence, performance and production validation.

Working design document - vessel creation, maintenance, transformation and recovery foundation

| Field | Locked Direction |
| --- | --- |
| Document Role | Document 26H is the gameplay and runtime authority for constructing, launching, hauling out, repairing, refitting, converting, decommissioning, salvaging and restoring vessels whose structural architecture is defined by 26F. |
| Core Philosophy | A vessel is built and maintained through visible work, real materials, qualified tools, accessible work locations and explainable validation. Creative freedom remains broad, but neither player placement nor NPC labour may create structure, function or recovered resources without authoritative transactions. |
| Structural Boundary | 26H creates and changes vessel cells, role assignments, components and work-state only through 26F-approved edit, commissioning and lifecycle interfaces. It does not independently redefine structural truth, compartment identity or Vessel Instance ownership. |
| Movement Boundary | 26H may immobilise, support, tow, launch or request re-certification, but 26G owns buoyancy, stability, propulsion, steering, navigation and operational certification. A refit cannot silently retain stale movement approval. |
| Forge Boundary | 26H consumes approved vessel blueprints and work metadata. Document 26I owns developer and player Vessel Forge authoring, blueprint inheritance, test environments, procedural variants and authoring UX. |
| Resource Direction | Construction, repair, refit and salvage conserve exact items, blocks, fluids, power and ownership through reservations and transactions. Planning previews are free; world execution is not. |
| NPC Direction | NPC shipwrights use the same project, tool, access, stock and validation rules as players, with bounded skill, schedule and simulation abstraction. They do not conjure hidden progress or bypass unsafe routes. |
| Salvage Direction | Salvage is a staged recovery discipline with ownership, hazard, stability, environment and capacity checks. Wrecks may be stripped, stabilised, raised, towed, restored, memorialised or abandoned without duplicating their contents. |
| Technical Direction | Godot/Summer Engine implementation uses immutable definitions, compact local-grid deltas, deterministic work packages, transactional inventories, service-based validation and explicit near/far promotion. No Node is created per vessel voxel or per construction task. |
| Scope Boundary | 26H does not define ports and maritime civilisation, crew simulation, fleet trade, piracy, naval combat, marine ecology or final maritime progression. Those belong to 26J-26O. |

# DOCUMENT SET 26 - OCEANS, MARITIME CIVILISATION, VESSELS AND NAVAL SYSTEMS EXPANSION

# Document Purpose

Document 26H defines how Leyforge vessels are physically made, changed, maintained and recovered. It converts the freeform local-grid vessel architecture of 26F into practical construction projects that players and NPCs can complete inside the world. It also creates the controlled editing boundary needed after a vessel has been commissioned, moved, damaged, grounded, capsized or wrecked.

The system supports both direct voxel creativity and civilisation-scale shipbuilding. A player may build a small raft by hand on a beach, assemble a fishing boat on a village slipway, commission a merchant vessel from an NPC shipyard, restore an ancient wreck, or organise a multi-stage naval construction project supplied by warehouses and automation. These experiences share one resource-conserving foundation rather than using unrelated crafting shortcuts.

Shipbuilding must remain understandable without requiring real-world shipwright knowledge. The game should explain why work is blocked, where a leak or unsupported section exists, which tool or material is needed, whether workers can reach the task, what will be invalidated by a refit, and what can be safely recovered from a wreck. Advanced players may inspect structure, compartments, mass and certification evidence in detail, while simpler projects can use guided recommendations and approved blueprints.

This document treats repair and refit as first-class world systems rather than inventory-button abstractions. Damage can be patched temporarily at sea, repaired properly alongside, or rebuilt in a dry dock. A vessel can preserve its identity through major changes when continuity rules are satisfied, or intentionally become a new vessel definition/instance when a conversion is too extensive. Salvage similarly preserves provenance: recovered blocks and components retain source, condition and ownership where relevant instead of becoming generic free loot.

# Design Sources, Authority and Supersession

| Source | Authority Consumed by 26H | 26H Boundary |
| --- | --- | --- |
| 26A - Maritime Expansion Foundation | Freeform block-built vessels, Shipwright tools, NPC shipyards, repair, salvage and living maritime civilisation. | 26H implements the physical work layer without absorbing later port, crew, fleet or combat ownership. |
| 26B - Water, Liquid and Fluid Overhaul | Flooding, pumping, sealing, permeability, corrosion, local fluid islands, dry spaces and liquid transactions. | 26H may schedule pumps, drains, sealing and dewatering; 26B remains fluid truth. |
| 26C - Marine World Generation | Coasts, beaches, harbours, bathymetry, wreck sockets, route access and persistent world deltas. | 26H validates worksites and salvage locations; it does not regenerate terrain or place final maritime settlements. |
| 26D - Marine Climate and Weather | Wind, waves, tides, currents, storms, surge, ice and weather windows. | 26H consumes work safety, launch, tow, salvage and exposure conditions; it does not own weather. |
| 26E - Swimming and Diving | Diving, underwater tools, towing, rescue, breathable spaces and player aquatic interaction. | 26H requests underwater work actions and hazard contexts; character physiology remains 26E-owned. |
| 26F - Vessel Architecture | Vessel local grids, structural roles, compartments, surfaces, components, commissioning, lifecycle, identity and edit boundaries. | 26H is the authorised workflow that creates/modifies those records. It cannot bypass 26F validation or write competing structure data. |
| 26G - Vessel Movement | Buoyancy, stability, movement, restraint, grounding, docking, towing, route simulation and certification. | 26H consumes motion lock and support state, and invalidates/re-requests certification after relevant changes. |
| 25A-25L - Production Governance | Qualified IDs, field ownership, relationships, capabilities, packs, migrations, validation, evidence, task contracts and source-of-truth audit. | 26H schemas and evidence extend the canonical kernel and use Set 25 release gates. |
| 03-06 - Blocks, Items, Recipes and Resources | Block/item separation, material identity, tools, components, project recipes, substitutions, provenance and exact resource use. | 26H adds maritime facets and project types rather than duplicating physical registries. |
| 07, 19 and 20 - NPC, Settlement and Building Systems | Named labour, warehouses, visible staged projects, surveys, work packages, blueprint contracts and functional activation. | Shipyards and vessel projects reuse shared project/labour logic while adding moving-structure and launch-specific rules. |
| 08 and 09 - Automation and Magic | Power, logistics, machines, mana, runes, wards, golems and authoritative networks. | 26H consumes supplies and service capabilities; it does not invent parallel power or mana. |
| 12 and 16 - Structures and Combat | Dynamic structures, damage, restoration, occupation, damage packets, repairs and aftermath. | 26H owns vessel-work execution; 26L owns naval damage and wreck creation. |
| 17 - UI/UX | World-first interaction, progressive disclosure, accessibility, permissions and trustworthy reasons. | 26H tools, overlays, project screens and salvage interfaces follow shared UX rules. |
| 18 replacement programme | Godot/Summer architecture, stable registries, authority, saves, LOD, migrations, testing and tooling. | Unreal-specific implementation assumptions are superseded where incompatible. |

> **Supersession Rule**
>
> Where earlier documents imply that boats are crafted as single inventory items, repaired by spending one generic resource, edited freely while moving, or salvaged through unrestricted block breaking, this document supersedes those implications for commissioned maritime vessels. It does not supersede the owners of physical definitions, inventories, fluids, weather, damage, settlements, power, magic or presentation assets.

# Static Table of Contents

- 1. Locked Shipwright System Identity
- 2. Design Principles and Player Experience Targets
- 3. Explicit Non-Goals
- 4. Source-of-Truth and Ownership Boundaries
- 5. Canonical Terminology
- 6. Record Architecture and Data Separation
- 7. Vessel Work Lifecycle
- 8. Worksite and Support-State Taxonomy
- 9. Construction Modes and Entry Paths
- 10. Shipwright Profession, Skills and Progression
- 11. Shipwright Tools and Equipment
- 12. Site Survey and Worksite Validation
- 13. Blueprint, Design and Project Intake
- 14. Material Roles, Substitution and Provenance
- 15. Construction Stage Graph
- 16. Work Packages, Tasks and Reservations
- 17. Scaffolds, Cradles, Shores and Temporary Supports
- 18. Primary Structure Construction
- 19. Hull Shell, Sealing and Caulking
- 20. Decks, Bulkheads, Compartments and Openings
- 21. Components, Propulsion, Control and Service Installation
- 22. Fit-Out, Access, Storage and Habitability
- 23. Inspection, Pre-Launch Review and Commissioning Handoff
- 24. Launching, Haul-Out, Dry Docking and Refloat
- 25. Resource Conservation and Authoritative Transactions
- 26. NPC Shipwright Labour and Shipyard Organisation
- 27. Quality, Workmanship, Defects and Rework
- 28. Damage Survey and Repair Classification
- 29. Emergency and Afloat Repair
- 30. Alongside, Slipway and Dry-Dock Repair
- 31. Refitting and Configuration Change
- 32. Upgrades, Conversions and Identity Continuity
- 33. Safe Editing of Commissioned Vessels
- 34. Decommissioning, Static Conversion and Break-Up
- 35. Salvage Rights, Claims and Permissions
- 36. Salvage Survey, Hazards and Stabilisation
- 37. Salvage Operations and Recovery Methods
- 38. Wreck Raising, Towing, Restoration and Memorialisation
- 39. Economy, Logistics and Contract Boundaries
- 40. Automation, Magic, Golems and Specialist Work
- 41. UI/UX, Overlays and Accessibility
- 42. Multiplayer Authority and Contribution
- 43. Persistence, LOD, Promotion and Recovery
- 44. Godot/Summer Engine Technical Architecture
- 45. Performance Budgets and Scalability
- 46. Registry Facets, Relationships and Capabilities
- 47. Validation, Reason Codes and Evidence
- 48. Prototype Laboratories and Test Programme
- 49. Production Scope and Staged Implementation
- 50. Cross-Document Integration and 26I Handoff
- Appendix A. Core Record Templates
- Appendix B. Construction Stage and Work-Package Templates
- Appendix C. Repair and Refit Classification Matrix
- Appendix D. Salvage Operation Matrix
- Appendix E. Validation and Reason-Code Catalogue
- Appendix F. Prototype and Performance Test Matrix
- Appendix G. Completion Checklist

# 1. Locked Shipwright System Identity

The Shipwright System is the physical vessel-work layer of Leyforge. It connects voxel creativity, crafting, materials, blueprints, NPC labour, shipyards, fluids, movement, damage, salvage and civilisation growth through visible, auditable projects. The system is responsible for turning a static set of resources and planned cells into a persistent vessel, and for maintaining that vessel after it enters the living world.

> **Locked Rule**
>
> A vessel cell, component, repair, upgrade or recovered resource exists only after an authoritative work action consumes or transfers the required source, passes ownership and safety checks, and commits the resulting local-grid or inventory change. Visual progress, animation, worker time or a completed timer cannot substitute for the transaction.

| Identity Layer | Design Meaning | Player-Facing Result |
| --- | --- | --- |
| Freeform Craft | Players may build unusual hulls from ordinary blocks, shapes and components. | Creative ships are possible without a mandatory prefabricated hull item. |
| Visible Construction | Projects show surveys, supports, stages, workers, materials and unfinished structure. | Ships feel built rather than spawned. |
| Civilisation Production | Shipyards, warehouses, specialists, trade and automation can support larger vessels. | Maritime growth becomes a settlement capability. |
| Maintenance and Consequence | Damage, wear, corrosion, flooding and poor workmanship create repair work. | Vessel history remains visible and operational choices matter. |
| Identity-Safe Change | Refits preserve vessel identity where continuity rules pass and create explicit transformations where they do not. | A beloved ship can evolve without corrupting saves or disguising a replacement. |
| Provenance-Preserving Salvage | Wrecks contain recoverable physical value, hazards, ownership and history. | Exploration and naval aftermath create meaningful recovery gameplay. |
| Scalable Simulation | Nearby work is physical; distant work uses deterministic summaries and reconciliation. | NPC shipyards can function across a large world. |

# 2. Design Principles and Player Experience Targets

| Principle | Required Experience |
| --- | --- |
| Creative freedom with readable consequences | The game permits nonstandard designs but explains access, sealing, support, mass and certification consequences. |
| One project truth | Player, NPC, automation and quest interfaces read the same project, stock and work-package state. |
| Planning is cheap; execution is physical | Blueprint drafting and previews cost no materials, while world construction consumes real stock and time. |
| No hidden conjuring | NPCs, golems and distant simulation cannot create cells or repairs without reservations and transaction evidence. |
| Safe failure | Interrupted work preserves consumed resources, completed cells and recoverable reservations without corrupting the vessel. |
| Progressive disclosure | Simple projects show guided next actions; expert views expose roles, support, compartments, mass impact and dependencies. |
| Maintenance is meaningful, not tedious | Routine minor upkeep can be delegated or automated; severe damage, unusual materials and major refits require decisions. |
| History matters | Repairs, replacements, salvaged parts, builders and major conversions may become vessel history records. |
| Shared-system reuse | Shipbuilding reuses blocks, items, recipes, settlement projects, permissions, tools, power and magic contracts. |
| Prototype-driven constants | Work speed, tool durability, scaffold costs, stage sizes, quality effects and salvage yields remain Balance Draft until tested. |

## 2.1 Experience Bands

| Band | Example | Expected Complexity |
| --- | --- | --- |
| Improvised | Raft, canoe-like craft, simple punt. | Direct placement, light tool checks, minimal staging, beach or water-edge launch. |
| Craft Vessel | Fishing boat, river trader, patrol boat. | Survey, staged hull, basic components, slipway, NPC assistance and commissioning. |
| Ship | Merchant ship, warship, exploration vessel. | Formal blueprint, work packages, multiple trades, dry dock/slipway, logistics and inspections. |
| Great Vessel | Large cultural flagship or specialist expedition ship. | Settlement project, extensive dependencies, modular construction, higher evidence and performance gates. |
| Exceptional Project | Ancient restoration, magical vessel, unusual realm-adapted design. | Specialist tools, hazards, rituals, optional packs and conditional certification. |

# 3. Explicit Non-Goals

- Full real-world naval architecture, finite-element structural analysis, exact timber seasoning or professional shipyard scheduling.
- Instant single-recipe spawning of a complete final vessel in survival play.
- Unrestricted editing of a moving or occupied commissioned vessel without support and authority checks.
- NPC construction that proceeds while routes, stock, tools, chunks or work cells are invalid.
- Generic repair kits that restore every material and component without compatible inputs or limits.
- Perfect one-to-one simulation of every hammer strike, nail, rope splice or paint coat.
- Automatic conversion of any static building into a vessel merely because it touches water.
- Guaranteed full recovery of all wreck contents regardless of damage, corrosion, depth, ownership or hazard.
- Duplicating 26I Vessel Forge authoring, 26J port economics, 26K fleets, or 26L naval damage and wreck-generation rules.
- Allowing presentation meshes, animations, particles or audio to become authoritative work progress.

# 4. Source-of-Truth and Ownership Boundaries

| Data/Decision | Canonical Owner | 26H Access |
| --- | --- | --- |
| Block/item/material definitions | Documents 03-06 and Set 25 registries. | Read facets; consume/transfer instances through transactions. |
| Vessel local cells, structural roles and compartments | 26F. | Write only through authorised construction/edit/commissioning commands. |
| Movement, support, certification and restraints | 26G. | Request motion lock, launch, tow, support validation and re-certification. |
| Fluid volume, flooding, pumps and dewatering | 26B. | Request operations; consume resulting state. |
| Weather, tide, wave and current | 26D. | Read for safe work and launch windows. |
| Damage and wreck creation | 26L. | Read damage/wreck evidence; submit repair, stabilisation and salvage changes. |
| Blueprint source and procedural vessel variants | 26I. | Consume approved blueprint revision and work metadata. |
| NPC identity, skills, schedules and needs | NPC/settlement systems and 26J. | Assign bounded work tasks and record contributions. |
| Inventories, warehouses and reservations | Item/storage/project systems. | Create reservations and atomic transfers. |
| Ownership, law, claims and faction response | Settlement/faction/crime systems and later maritime docs. | Enforce provided permissions and emit violations. |
| Presentation assets and work animations | Forge/Presentation systems. | Emit semantic events and sockets only. |

> **No Competing Truth Rule**
>
> 26H may cache derived workability, material counts, stage progress and access maps, but every cache must bind to source revisions. It cannot maintain a second editable copy of the vessel grid, inventory, damage record, fluid state, ownership or blueprint.

# 5. Canonical Terminology

| Term | Meaning |
| --- | --- |
| Shipwright Project | Persistent construction, repair, refit, conversion, decommission or salvage project targeting a site or Vessel Instance. |
| Worksite | Bounded world/vessel area with support state, access, permissions, hazards and work controls. |
| Project Plan | Resolved stage graph, requirements, work packages and expected changes bound to exact source revisions. |
| Work Package | Reviewable group of tasks sharing location, prerequisites, trade, materials and commit rules. |
| Work Task | Small authoritative unit of labour that reserves inputs and applies one bounded result. |
| Construction Cell Intent | Planned local-grid cell/shape/role/component change from a blueprint or direct design. |
| Temporary Support | Scaffold, shore, cradle, brace, cofferdam or restraint that enables work but is not final vessel structure unless converted. |
| Work Face | Reachable location from which an actor/tool can perform a task. |
| Material Role | Semantic requirement such as hull_shell_primary, frame_primary or sealant that resolves to qualified definitions. |
| Workmanship | Bounded quality evidence produced by materials, tools, skill, environment and process. |
| Defect | Known or latent project result that reduces quality, sealing, strength, alignment or reliability. |
| Repair Patch | Temporary or permanent bounded replacement/reinforcement applied to damage. |
| Refit | Controlled change to a commissioned vessel that preserves instance continuity when identity rules pass. |
| Conversion | Major change of vessel purpose, architecture or identity requiring explicit classification and possible new definition lineage. |
| Wreck | Non-operational persistent vessel-derived structure/state created under 26L or world generation. |
| Salvage Claim | Permission record controlling inspection, recovery, towing, dismantling or restoration rights. |
| Recovered Provenance | Source vessel/wreck, condition, recovery event and owner history attached where relevant. |
| Recommissioning | 26F structural validation after relevant work; followed by 26G operational certification when movement-relevant. |

# 6. Record Architecture and Data Separation

| Record | Purpose | Persistence |
| --- | --- | --- |
| Shipwright Project Definition | Authored project family, stage templates, required capabilities and validation profile. | Immutable definition. |
| Shipwright Project Instance | Target, site, owner, plan revision, stage, reservations, contributors, blockers and history. | Persistent runtime record. |
| Worksite Record | Bounds, support mode, access, hazards, tide/weather window and spatial references. | Persistent while project exists; partially reconstructable. |
| Resolved Project Plan | Exact cell/component deltas, material resolutions, dependency graph and expected outputs. | Persistent snapshot or reproducible by hashes. |
| Work Package Record | Task set, location, trade, priority, stock, route, progress and commit state. | Persistent until completed/cancelled. |
| Task Reservation | Exact items, tools, energy, space and actor locks for an atomic work action. | Transactional/short-lived with recovery log. |
| Construction Quality Record | Material, tool, worker, environment and inspection evidence by group/stage. | Persistent where outcome affects vessel. |
| Repair Record | Damage reference, diagnosis, treatment, replaced parts, residual limits and inspector. | Persistent vessel history. |
| Refit Record | Before/after revisions, changed groups, identity decision, invalidated certifications and migration evidence. | Persistent vessel history. |
| Salvage Project Record | Wreck identity, claim, hazards, stabilisation, recoveries, losses and final disposition. | Persistent world/history record. |
| Recovered Item Provenance | Source wreck/vessel, recovery event, condition and legal state. | Item-instance extension when required. |
| Work Evidence Bundle | Validation reports, transaction journal, build signature, tests and approval references. | Release/project evidence. |

## 6.1 Definition, Plan, Project and Result Separation

A blueprint or project definition describes what may be built. A resolved plan binds that intent to a specific material palette, site and source revision. A project instance records ongoing work. The completed Vessel Instance and its history are the result. These layers must not be collapsed: changing a blueprint must not retroactively alter a vessel already under construction unless an explicit project revision is accepted.

# 7. Vessel Work Lifecycle

| State | Meaning | Allowed Actions |
| --- | --- | --- |
| Draft/Unplaced | Design or direct-build intent exists outside an active world project. | Edit design, estimate, validate, choose site. |
| Site Survey | Terrain, water, support, access, permissions and hazards are being resolved. | Inspect/cancel; no material consumption. |
| Planned | Resolved plan and stage graph approved for exact site/source revisions. | Reserve stock, assign labour, begin. |
| Mobilising | Supports, access routes, stores, cranes, pumps or work zones are prepared. | Build temporary infrastructure. |
| Under Construction | Final vessel cells/components are being committed by stage. | Work, inspect, pause, revise under rules. |
| Pre-Launch Review | Required construction stages complete; inspection and transfer checks pending. | Correct defects, seal, clear supports. |
| Launch/Transfer | Static work assembly is atomically converted or moved into commissioned vessel workflow. | No conflicting edits; recover transaction on interruption. |
| Commissioned Immobilised | 26F Vessel Instance exists; 26G certification pending or stale. | Fit-out, inspect, certify, controlled refit. |
| Operational | Vessel may move under 26G. | Routine maintenance; major work requires valid restraint. |
| Repair/Refit Lock | Vessel supported and movement-authority disabled for controlled changes. | Repair, replace, extend, reconfigure. |
| Salvage Work | Wreck/vessel is under claim, stabilisation or recovery project. | Inspect, recover, raise, tow, dismantle, restore. |
| Decommissioned/Static | Vessel identity retained historically but no longer operational/mobile. | Convert, display, dismantle, restore later. |
| Completed/Archived | Project resolved and evidence/history frozen. | Read history; create new project for future work. |
| Quarantined | Missing schema, pack, source revision or corrupt transaction prevents safe work. | Recover/migrate/export; no destructive progression. |

# 8. Worksite and Support-State Taxonomy

| Worksite Type | Typical Use | Key Constraints |
| --- | --- | --- |
| Beach/Bank Site | Rafts and small craft. | Slope, tide, erosion, soft ground, launch path and environmental exposure. |
| Building Berth | Medium/large construction beside water. | Foundations, crane reach, stock access, launch route and permissions. |
| Slipway | Construction, haul-out and launch on inclined support. | Cradle compatibility, tide window, hauling capacity and clear run. |
| Graving Dry Dock | Large repair/refit in drained basin. | Gate integrity, pumps, water body connection, floor support and flooding safety. |
| Floating Dry Dock | Remote/large-vessel support. | Dock buoyancy, ballast control, alignment and combined stability. |
| Alongside Berth | Routine repair and fit-out. | Mooring, wake, access, load limits and no submerged-hull access without diving. |
| Anchored Work Zone | Emergency or remote work. | Sea state, anchor hold, transfer risk and limited tools. |
| Beached Vessel | Intentional small-craft repair or salvage. | Tide, ground contact, hull support and refloat path. |
| Underwater Worksite | Submerged structure, wreck or hull area. | Breath, pressure, visibility, current, tool medium and lift support. |
| Frozen/Ice Support | Cold-region construction or recovery. | Ice load, thaw risk, temperature and route closure. |
| Magical Support Field | Special culture/realm projects. | Explicit provider, mana, stability, failure and legal rules. |

## 8.1 Support-State Requirement

Major structure-changing work requires a support state declaring which parts of the assembly are held by terrain, cradle, shores, dock, mooring, anchor, lift, buoyancy or magic. A commissioned vessel cannot enter Repair/Refit Lock until 26G confirms movement is disabled and the work support envelope is valid for the planned changes.

# 9. Construction Modes and Entry Paths

| Mode | Entry | Primary Strength |
| --- | --- | --- |
| Direct Freeform Build | Player places vessel-intended blocks inside a registered worksite. | Maximum creativity and immediate experimentation. |
| Blueprint Project | Approved 26I blueprint resolves to site/material/stages. | Repeatability, NPC construction and exact planning. |
| NPC Commission | Settlement/faction selects blueprint or contract and manages project. | Civilisation production and player-as-client play. |
| Kit/Module Assembly | Prebuilt legal modules are connected through declared interfaces. | Faster progression without a single whole-ship item. |
| Restoration Project | Existing ruin/wreck is surveyed and reconstructed. | Historical content, salvage and partial unknown design. |
| Conversion Project | Static structure, barge, hull or existing vessel is transformed. | Reuse and evolving vessel identity. |
| Creative/Test Mode | Authoring/test environment with cost and danger disabled. | Design validation; never silently imported as survival completion. |

> **Mode Parity Rule**
>
> All survival modes converge on the same final 26F vessel architecture and validation. A blueprint, direct build or NPC commission may differ in planning convenience, but none receives weaker resource, ownership, safety or commissioning rules merely because of its entry path.

# 10. Shipwright Profession, Skills and Progression

Shipwright progression is classless and use-based, consistent with Document 02. Players and NPCs can learn shipbuilding through practice, instruction, research, culture knowledge, recovered plans and specialist facilities. Skill improves speed, efficiency, diagnosis and advanced options; low skill should not randomly destroy ordinary work when requirements are met.

| Skill/Knowledge Area | Gameplay Contribution |
| --- | --- |
| Shipwright Craft | General construction speed, plan interpretation and rework reduction. |
| Hull Carpentry/Masonry/Metalwork | Material-specific cutting, shaping, fastening and repair. |
| Caulking and Sealing | Leak diagnosis, sealant efficiency and pressure/waterproof capability. |
| Rigging and Sailmaking | Masts, spars, lines, sails and control-system installation. |
| Marine Engineering | Engines, shafts, wheels, propellers, pumps and automation. |
| Rune and Mana Engineering | Mana drives, wards, conduits and magical stabilisation. |
| Survey and Inspection | Worksite, alignment, damage, hidden defect and salvage assessment. |
| Salvage and Recovery | Hazard control, dismantling yield, lifting, towing and provenance handling. |
| Project Leadership | Worker coordination, priorities, quality gates and large-project throughput. |
| Cultural Shipbuilding Knowledge | Approved material roles, hull forms, decorations, laws and specialist techniques. |

## 10.1 Progression Unlock Sources

- Use-based skill growth from valid work actions.
- Shipwright NPC teaching and apprenticeships.
- Shipyard, guild, faction and culture reputation.
- Books, recovered plans, wreck analysis and maritime ruins.
- Research stations, Vessel Forge tests and engineering experiments.
- Dimension or magical-specialist knowledge for extraordinary materials/providers.
- Perks that improve guidance, delegation, repair efficiency, salvage safety or quality consistency.

# 11. Shipwright Tools and Equipment

| Tool Family | Primary Actions | Important Restrictions |
| --- | --- | --- |
| Survey Line/Plumb/Level | Alignment, reference plane, centreline and site measurements. | Does not create geometry or certify structure. |
| Shipwright Scanner/Anchor Tool | Select assembly, inspect roles, highlight surfaces/compartments and submit 26F scans. | Requires authority; cannot overwrite locked source fields. |
| Hammer/Mallet | Fasteners, frames, planks, braces and general assembly. | Material/tool tier and work-face access apply. |
| Adze/Axe/Saw | Shape timber and remove compatible vessel cells. | Produces authoritative drops/waste; durability applies. |
| Chisel/Drill/Auger | Openings, fastener holes, stone/metal shaping and fittings. | May invalidate sealing or structure until task completes. |
| Caulking Iron/Sealing Tool | Apply sealant, packing, resin, pitch, gasket or rune seal. | Requires compatible seam and material. |
| Wrench/Spanner/Rivet Tool | Mechanical components, plates, shafts and fasteners. | Component isolation and power lockout required. |
| Rigging Knife/Marlinspike | Rope, cable, net, sail and rig work. | Working-at-height and tension hazards apply. |
| Pump/Hose/Drain Controls | Dewater compartments, docks and cofferdams. | 26B owns volume and capacity truth. |
| Jack/Capstan/Winch/Crane | Move modules, supports, loads, masts, anchors and wreck sections. | Capacity, anchor points and stability required. |
| Rune Tuner/Chisel | Install, bind, diagnose or isolate magical vessel components. | Knowledge, mana safety and cultural/legal rules apply. |
| Diving Tool Set | Underwater cutting, fastening, patching and recovery. | 26E environment/physiology and medium compatibility apply. |
| Inspection Tools | Sounding hammer, pressure test, dye/smoke/mana tracer and scope. | Reveal evidence according to tool and knowledge; no omniscience. |

## 11.1 Tool Modes

| Mode | Use |
| --- | --- |
| Inspect | Read target, role, damage, dependencies, ownership, source and blockers. |
| Plan | Add non-authoritative cell/component/task intent to project plan. |
| Assign Role | Submit explicit 26F role override with evidence and validation. |
| Build/Repair | Perform task against reservation and work face. |
| Remove/Recover | Dismantle through project transaction rather than unrestricted break. |
| Configure | Set component orientation, service connection, access or project priority. |
| Test | Run bounded seal, alignment, component or commissioning checks. |

# 12. Site Survey and Worksite Validation

Every nontrivial project begins with a deterministic survey. The survey does not consume construction materials and must expose the world facts that affect the plan before work begins.

| Survey Layer | Checks |
| --- | --- |
| Identity and Authority | Target instance/site, owner, claim, permissions, faction law and protected edits. |
| Spatial Bounds | Project volume, vessel local frame/reference, world clearance and neighbouring structures. |
| Terrain/Foundation | Slope, bearing, excavation, fill, erosion, seabed and support points. |
| Water Connection | Water Body identity, depth, tide range, channel, launch/refloat route and contamination. |
| Weather Exposure | Wind, waves, storms, ice, temperature, rain and safe work windows. |
| Access and Routes | Worker paths, ladders, platforms, cargo routes, crane reach and emergency egress. |
| Utilities | Power, mana, pumps, lighting, air, fire response and storage interfaces. |
| Hazards | Flooding, pressure, unstable structure, tension, fire, poison, corruption, creatures and explosives. |
| Logistics | Warehouses, stock categories, delivery capacity, waste and recovered-material destinations. |
| Performance | Expected cells, components, tasks, active workers, local fluid islands and evidence burden. |

## 12.1 Survey Output

The survey produces stable reason codes, highlighted regions, support recommendations, expected cut/fill or temporary infrastructure, launch/haul conditions, capability requirements and a semantic hash. A relevant world edit, tide-profile revision, ownership change or source-definition update marks the survey stale rather than silently proceeding.

# 13. Blueprint, Design and Project Intake

26I blueprints and direct-build designs enter 26H through a versioned intake contract. The intake resolves material roles, construction stages, component dependencies, role hints, support requirements, work faces and final commissioning intent against the chosen site and installed packs.

| Intake Input | Required Treatment |
| --- | --- |
| Blueprint qualified ID/revision | Freeze exact source or accepted project branch; record content hash. |
| Vessel scale/profile | Select applicable task, support, validation and performance profiles. |
| Material palette | Resolve semantic roles to qualified definitions with suitability evidence. |
| Construction stages | Compile authored stages or generate compliant defaults. |
| Functional components | Resolve item/block/component definitions, mounts, sockets and service prerequisites. |
| Role hints/overrides | Pass to 26F as proposed evidence, not unquestioned truth. |
| Temporary support metadata | Separate from final vessel cells and resource totals. |
| Culture/faction pack | Apply permitted variants, decoration and law without changing base function silently. |
| Unknown/missing content | Block, substitute only through declared fallback, or quarantine optional content. |
| Project custom edits | Store as project branch/delta with clear provenance. |

> **Blueprint Update Rule**
>
> An updated blueprint does not automatically rewrite an active project. The project compares revisions, shows added/removed/changed work, and requires an explicit rebase decision with resource, identity, migration and certification consequences.

# 14. Material Roles, Substitution and Provenance

| Material Role | Examples of Required Facets |
| --- | --- |
| primary_spine/frame | Strength, fastening, role suitability, durability, workability. |
| hull_shell_primary | Sealing potential, permeability, damage behaviour, shape availability. |
| bulkhead/partition | Sealing, fire resistance, accessibility and structural compatibility. |
| deck/walkway | Load, friction, fire/weather, pathing and repairability. |
| fastener/binder | Material compatibility, corrosion, tensile/shear class and tool requirement. |
| sealant/gasket | Medium, pressure/depth, temperature, cure time, toxicity and lifespan. |
| armour/protection | Mass, resistance, mounting and repair route. |
| rigging/line | Tension, flexibility, weather, attachment and replacement length. |
| machinery foundation | Strength, vibration, alignment, heat and service access. |
| interior/fit-out | Fire, moisture, hygiene, culture, comfort and pathing. |

## 14.1 Substitution Rules

Substitution uses Set 25 capability, suitability, exclusion and fallback contracts. A tag match alone is insufficient for critical vessel roles. The resolver must show why a candidate is accepted, conditional or rejected, and how it changes cost, mass, quality, maintenance, sealing or certification expectations.

## 14.2 Provenance

Project inputs retain source and quality where gameplay-relevant. Salvaged timber, captured fittings, culturally marked components or corrupted materials may produce different history, law, repair or risk outcomes without needing separate duplicate base definitions.

# 15. Construction Stage Graph

| Default Stage | Purpose | Typical Outputs |
| --- | --- | --- |
| 0. Mobilisation | Secure site, routes, storage, supports, tools and safety. | Worksite ready; no final vessel requirement. |
| 1. Reference and Backbone | Establish centreline, keel/spine and primary datum. | Stable reference for later local-grid work. |
| 2. Primary Frames and Supports | Build ribs, frames, beams and major structural groups. | Structural skeleton. |
| 3. Hull Closure | Install shell/planking/plates and external closures. | Candidate exterior surface and enclosed volume. |
| 4. Internal Structure | Install decks, bulkheads, foundations, shafts and major openings. | Compartments, access and component mounts. |
| 5. Systems Installation | Power, propulsion, control, pumps, conduits, rig and service networks. | Functional component graph. |
| 6. Fit-Out | Storage, crew spaces, ladders, doors, lighting, safety and culture elements. | Usable interior and operational access. |
| 7. Sealing and Test | Caulk, pressure/fill tests, alignment, network isolation and defect correction. | Inspection evidence. |
| 8. Pre-Launch Completion | Remove/convert supports, clear loose stock, close temporary openings and calculate transfer manifest. | Ready for 26F commissioning. |
| 9. Launch and Commission | Execute atomic transfer/launch; create Vessel Instance and bind history. | Commissioned immobilised vessel. |
| 10. Operational Certification | 26G support/control/clearance tests and accepted limits. | Operational, restricted or blocked status. |

## 15.1 Stage Flexibility

Small craft may merge stages. Modular or magical projects may branch stages. Repair/refit projects use different templates. Regardless of presentation, dependency and transaction rules remain explicit. A later stage may begin early only when its prerequisites and work zones are safe, avoiding an unnecessarily rigid linear queue.

# 16. Work Packages, Tasks and Reservations

| Work Package Field | Meaning |
| --- | --- |
| package_id | Persistent project-scoped identity. |
| stage_id/trade | Stage grouping and required worker/tool capability. |
| target_region | World or vessel-local cells/components/zone. |
| prerequisites | Packages, support, access, isolation, weather and inspections. |
| material_requirements | Exact items or qualified substitution queries. |
| tool_requirements | Tool class, tier, condition and attachments. |
| energy/service_requirements | Power, mana, heat, pump, air, light or crane capability. |
| work_faces | Reachable positions and orientations for actors or machines. |
| task_order | Bounded task dependency graph and parallelism limit. |
| quality_profile | Allowed workmanship band, inspection and rework rules. |
| commit_policy | Per-cell, per-component, per-batch or atomic stage commit. |
| rollback/recovery | How interrupted reservation and partial work are restored. |

## 16.1 Task Transaction Sequence

- Validate project/source revisions, permissions, support and work face.
- Reserve exact input stack(s), tool use, service capacity and target cells.
- Move actor/material to work face through authoritative route/task state.
- Perform bounded work time and emit presentation events.
- Revalidate critical state before commit.
- Commit local-grid/component change and consume/transform inputs atomically.
- Produce by-products, drops, waste, removed parts or evidence.
- Release locks and update dependent packages, caches and inspections.

> **No Timer-Only Progress Rule**
>
> Elapsed time may satisfy labour duration, but it cannot complete a task unless the final commit succeeds. A worker animation, distant simulation tick or progress bar never substitutes for the transaction.

# 17. Scaffolds, Cradles, Shores and Temporary Supports

| Support Family | Function | Lifecycle |
| --- | --- | --- |
| Scaffold/Platform | Worker access, fall protection and tool placement. | Built from real materials; reusable/dismantlable according to recipe. |
| Shore/Brace | Hold frame/hull position during construction or repair. | Removed before launch unless converted to approved final structure. |
| Building Cradle | Supports hull and transfers load to slipway/ground. | Bound to hull profile/support map; may be reused or custom. |
| Launching Ways/Rollers | Reduce resistance and guide launch/haul. | World infrastructure; condition and lubrication may matter. |
| Cofferdam/Temporary Seal | Create dry local workspace. | 26B fluid interface; removal restores connection. |
| Mast/Module Gantry | Lift and align heavy or tall components. | Capacity and anchor points required. |
| Drydock Shores/Blocks | Support vessel after water removal. | Must match load/support envelope to avoid damage handoff. |
| Magical Suspension | Hold assembly through explicit provider. | Consumes mana and has failure/permission profile. |

## 17.1 Temporary Versus Final Cells

Temporary supports are separate project/world records unless explicitly converted through a final construction task. They are excluded from Vessel Instance selection by default and must not be accidentally commissioned as hull cells merely because they are connected.

# 18. Primary Structure Construction

Primary structure establishes the load paths and stable local frame consumed by 26F. Construction order should encourage readable shipbuilding without forcing one historical method. Timber frames, metal skeletons, stone barges, magical lattices and other approved cultures may use different stage templates.

| Structural Work | Core Validation |
| --- | --- |
| Reference line/keel/spine | Continuity, alignment, site support and intended Vessel Frame. |
| Frames/ribs/bulk supports | Attachment to valid structure, spacing profile and access. |
| Longitudinal beams/stringers | Connection, material suitability and interference. |
| Cross-beams/deck supports | Span/load suitability and component clearances. |
| Reinforcement/armour foundations | Mounting, mass effect and repair access. |
| Modular joins | Interface compatibility, fasteners, seal path and lineage. |
| Extraordinary structural provider | Explicit capability, source, failure and maintenance. |

## 18.1 Direct Building Guidance

For direct builds, the Shipwright overlay proposes likely centreline, primary spine, frames and hull boundary from placed geometry. Recommendations remain editable. The system should highlight unsupported islands, accidental terrain connections and ambiguous scaffolds before expensive later stages.

# 19. Hull Shell, Sealing and Caulking

| Sealing Layer | Purpose |
| --- | --- |
| Cell/shape occupancy | Determine whether geometry can form a continuous boundary. |
| Seam graph | Track joins between hull cells, shapes, closures and components. |
| Material permeability | Determine base leakage, absorption and saturation behaviour. |
| Fastener/binder compatibility | Prevent invalid joins and corrosion combinations. |
| Sealant application | Reduce leakage across eligible seams for rated conditions. |
| Openings/closures | Doors, hatches, ports, shafts and valves must expose closure state. |
| Test evidence | Low-pressure wet test, compartment fill test, dye/smoke/mana trace or profile-specific method. |

## 19.1 Seal Ratings

| Rating | Use |
| --- | --- |
| Splash Resistant | Deck/interior exposure; not an immersed hull boundary. |
| Shallow Watertight | Small craft and sheltered immersion. |
| Marine Watertight | Normal coastal/open-sea hull and closures. |
| Pressure Rated | Diving, deep salvage or specialist compartment; not implied by ordinary watertightness. |
| Magically Contained | Explicit ward/seal provider with mana and failure rules. |

> **Sealing Evidence Rule**
>
> A hull appearance does not prove watertightness. The seam graph, closure states, material facets and completed sealing tasks provide the evidence consumed by 26F and 26B.

# 20. Decks, Bulkheads, Compartments and Openings

Internal construction converts shell volume into usable and survivable spaces. 26H builds the cells and closures; 26F discovers and versions compartments from the completed structure.

| Element | Construction Requirement |
| --- | --- |
| Deck/walkway | Support, path width, headroom, load and hatch access. |
| Bulkhead | Boundary continuity, required sealing/fire rating and closure interfaces. |
| Door/hatch | Two-sided access, clearance, hinge/slide state, closure rating and emergency operation. |
| Ladder/stair | Reachability, slope/orientation, landing and moving-vessel compatibility. |
| Vent/air path | Breathable-space and smoke/pressure rules through owning systems. |
| Drain/bilge path | Low-point access, pump intake and contamination separation. |
| Service trunk | Protected route for power, mana, pipes, shafts or control lines. |
| Emergency egress | Alternative route or explicit accepted restriction for profile. |

## 20.1 Compartment Lineage During Work

Adding or removing bulkheads may split or merge compartments. 26H submits the structural delta; 26F resolves compartment lineage and returns affected inventories, fluids, markers and service references. The task cannot commit when lineage consequences cannot be migrated safely.

# 21. Components, Propulsion, Control and Service Installation

| Component Family | Installation Checks |
| --- | --- |
| Helm/rudder/control | Foundation, orientation, linkage, clearance, access and 26G provider interface. |
| Sail/rig/mast | Structural mount, stay/line sockets, working height, reef/furl access and clearance. |
| Oar/paddle station | Seat/work position, blade path, water reach and side grouping. |
| Engine/boiler/fuel system | Foundation, shaft/exhaust/cooling, heat, fire isolation, fuel route and maintenance. |
| Propeller/wheel/waterjet | External clearance, immersion, shaft/thrust line and guard. |
| Pump/valve/tank | 26B port, intake/output, power, maintenance and compartment link. |
| Battery/conduit/mana drive | Magic network, warding, stability, heat/corruption and access. |
| Anchor/mooring/tow fittings | Structural attachment, line route, handling mechanism and safe work zone. |
| Navigation instruments | Mount, visibility, power/knowledge and calibration. |
| Weapons/defence mounts | Foundation and arcs only; 26L owns weapon/combat operation. |

## 21.1 Installation Does Not Equal Activation

A placed component becomes an instance only after its installation transaction commits. It becomes operational only when its owning system validates power, service, control, permissions and state. 26H records workmanship, mount and access evidence; it does not fabricate provider output.

# 22. Fit-Out, Access, Storage and Habitability

| Fit-Out Area | Required Interface |
| --- | --- |
| Cargo/storage | Physical container instances, securing points, access and ownership. |
| Crew berths/seating | Reachable space, assigned capacity and emergency routes; detailed crew needs later. |
| Galley/provisions | Fire, ventilation, storage, water and service interfaces. |
| Lighting | Power/fuel/mana source, placement and maintenance. |
| Fire response | Water/sand/extinguisher storage, access and warning. |
| Medical/rescue | Treatment/storage markers and retrieval access. |
| Workshop/spares | Tool storage, workbench and compatible repair capability. |
| Sanitation/drainage | Abstracted or physical systems according to profile and settlement rules. |
| Culture/identity | Decoration, banners, figureheads and materials that do not fabricate function. |
| Passenger/animal spaces | Access, containment, ventilation and safety profile. |

# 23. Inspection, Pre-Launch Review and Commissioning Handoff

Pre-launch review binds the completed work to exact source revisions and determines whether the assembly is ready to enter 26F commissioning. It is not the same as operational certification.

| Inspection Layer | Required Evidence |
| --- | --- |
| Project completeness | All required final tasks complete; accepted omissions recorded. |
| Material/role resolution | No unresolved critical material role or invalid substitution. |
| Temporary support separation | Scaffolds, terrain, stock and construction machines excluded or intentionally converted. |
| Structural continuity | 26F candidate scan finds required connected groups and no blocker islands. |
| Hull/closure state | Required seam and opening tests pass for commissioning profile. |
| Component state | Installed instances resolve with mounts and no orphan inventory/service records. |
| Access/clearance | Workers, occupants and emergency routes satisfy selected profile. |
| Transfer manifest | All cells, block entities, inventories, fluids, NPCs, markers and networks classified for conversion. |
| Performance envelope | Cell/component/compartment counts within approved band. |
| Authority | Owner, contributors, registration intent and permissions confirmed. |

## 23.1 Commissioning Transaction

26H initiates the 26F atomic world-to-vessel conversion using the approved transfer manifest. On success, the project records the new Vessel Instance ID and enters commissioned immobilised state. On interruption, recovery must restore either the pre-transfer world assembly or the complete vessel, never a duplicated half-state.

# 24. Launching, Haul-Out, Dry Docking and Refloat

| Operation | Sequence Summary |
| --- | --- |
| Beach Launch | Clear route, confirm tide/depth, remove shores, apply controlled haul/slide, then 26G support. |
| Slipway Launch | Bind cradle, restrain vessel, open water route, release in stages and reconcile buoyancy. |
| Crane/Lift Launch | Validate lift points and capacity, transfer support atomically, lower to water and detach. |
| Dry-Dock Flood Launch | Close vessel, clear blocks/shores, flood through 26B, verify support, open gate and tow/propel. |
| Haul-Out | Secure vessel, align cradle/ways/lift, transfer support from water to worksite and lock motion. |
| Drydock Entry | Navigate/tow under 26G, restrain, close gate, pump water, place shores and confirm ground support. |
| Refloat Grounded Vessel | Stabilise, patch, unload/pump as needed, wait for tide or lift/tow, then resolve 26G contact. |
| Wreck Raise | Salvage plan supplies lift/seal/dewater forces; 26G/26B validate support transitions. |

> **No Teleport Launch Rule**
>
> Launching and haul-out are authoritative support-state transitions. Presentation may simplify small motions, but the vessel cannot appear at an unrelated water position or bypass blocked depth, route, mass or support requirements.

# 25. Resource Conservation and Authoritative Transactions

| Operation | Transaction Rule |
| --- | --- |
| Place final vessel cell | Consume compatible block item/component and create exact local-grid intent/result. |
| Shape/cut material | Consume source, create shaped part/cell and declared waste/by-product. |
| Fasten/seal | Consume fastener/sealant or tool charge as recipe defines; update seam/workmanship evidence. |
| Install component | Transfer item/component instance into vessel ownership and create installed state. |
| Remove intact part | Delete installed/local result and create recovered instance with condition/provenance. |
| Destructive removal | Create bounded drops/scrap/waste according to material, tool and damage. |
| Repair | Consume repair inputs and change damage/material/condition through owning-system command. |
| Replace | Remove old instance/cell, preserve recovery outputs, then install new source. |
| Distant progress | Use the same reservations and commit journal; no aggregate free materials. |
| Cancel project | Return unconsumed reservations; leave committed work and recoverable temporary structures. |

## 25.1 Quantity and Rounding

Authoritative inventories use integer item quantities and discrete cell/component results. Processes that conceptually consume partial bulk materials use defined batch or charge items, not hidden floating-point subtraction from stacks. Balance values may group nails, rope length, sealant or paint into practical units.

# 26. NPC Shipwright Labour and Shipyard Organisation

| NPC Role | Typical Responsibilities |
| --- | --- |
| Master Shipwright | Project leadership, plan approval, inspection, complex diagnosis and identity decisions. |
| Naval Architect/Designer | Blueprint adaptation, load/role review and 26I interaction where culture permits. |
| Carpenter/Framewright | Timber structure, decks, planking and repairs. |
| Smith/Riveter | Metal frames, plates, fasteners, anchors and fittings. |
| Caulker/Sealer | Seams, gaskets, coatings and leak tests. |
| Rigger/Sailmaker | Masts, spars, ropes, cables, sails and lifting rig. |
| Marine Engineer | Engines, pumps, shafts, wheels, propellers and automation. |
| Rune Engineer/Magewright | Mana systems, wards, magical seals and extraordinary materials. |
| Dock Labourer/Hauler | Stock movement, scaffolds, cranes, cleanup and launch operations. |
| Diver/Salvager | Underwater inspection, patching, cutting, recovery and rigging. |
| Inspector/Registrar | Evidence, legal approval, commissioning and certification coordination. |

## 26.1 NPC Work Rules

- Workers require a valid project assignment, schedule, tools, route, work face and safe environment.
- Workers physically collect or receive reserved inputs nearby; distant transfer may abstract travel but not inventory conservation.
- Skill affects speed, efficiency, diagnosis and quality consistency rather than granting free resources.
- A worker stops or chooses another valid task when blocked; they do not consume materials while unreachable.
- Danger, morale, wages, provisions and settlement needs are owned by NPC/26J systems but may constrain labour availability.
- Distant shipyards process bounded work packages and reconcile exact committed results on promotion.

# 27. Quality, Workmanship, Defects and Rework

| Quality Input | Possible Effect |
| --- | --- |
| Material quality/condition | Durability, sealing, mass consistency, appearance and maintenance. |
| Tool suitability/condition | Speed, waste, surface/fastener quality and task eligibility. |
| Worker skill/specialisation | Efficiency, diagnosis, advanced options and defect probability band. |
| Worksite/environment | Wetness, temperature, wave motion, lighting, contamination and access. |
| Plan/detail quality | Ambiguity, tolerance, module fit and generated work-face confidence. |
| Inspection coverage | Whether defects are discovered before launch or remain latent. |
| Rushed/forced work | Accepted time reduction with explicit quality/risk consequences. |
| Magic/automation support | Consistency, stabilisation or special risks through owning systems. |

## 27.1 Defect Families

| Defect | Example Consequence |
| --- | --- |
| Misalignment | Component inefficiency, vibration, poor fit or blocked installation. |
| Weak/incorrect fastening | Reduced connection capacity or accelerated damage. |
| Seal gap | Leak under rated exposure. |
| Material incompatibility | Corrosion, cracking, contamination or magical instability. |
| Inaccessible service point | Longer/blocked maintenance and emergency response. |
| Hidden obstruction | Path, compartment, shaft or moving-component conflict. |
| Incomplete coating/treatment | Weathering, fouling, rot or corrosion susceptibility. |
| Documentation mismatch | Stale plan/certification and uncertain provenance. |

Ordinary compliant work should not generate arbitrary defects merely to punish the player. Defects become meaningful when inputs, environment, haste, damage or specialist requirements justify them, and inspections must provide counterplay.

# 28. Damage Survey and Repair Classification

26L owns damage truth. 26H converts damage records into repairable work and determines which environment and capability are required.

| Repair Class | Purpose | Typical Location |
| --- | --- | --- |
| Class 0 - Maintenance | Wear, coating, lubrication, tightening and cleaning. | Underway/alongside when safe. |
| Class 1 - Emergency Patch | Stop immediate leakage, fire spread, detachment or control loss. | At sea/anchored with restrictions. |
| Class 2 - Field Repair | Restore limited function using accessible compatible materials. | Afloat, beached or remote. |
| Class 3 - Proper Repair | Return damaged group/component to approved service band. | Alongside/slipway/dry dock. |
| Class 4 - Structural Rebuild | Replace major cells/groups, bulkheads, foundations or alignment. | Supported dry worksite. |
| Class 5 - Restoration | Recover wrecked, ancient, corrupted or heavily incomplete vessel. | Dedicated salvage/shipyard project. |

## 28.1 Damage Survey Outputs

- Damage group and source record references.
- Immediate hazards and do-not-disturb regions.
- Residual strength/sealing/operation limits from owning systems.
- Required isolation, pumping, support and access.
- Repair options with materials, tools, location, duration and expected result.
- Temporary patch expiry/limit and permanent follow-up.
- Certification invalidations and reinspection requirements.
- Recoverable removed parts, waste and contamination handling.

# 29. Emergency and Afloat Repair

| Emergency Action | Effect and Limit |
| --- | --- |
| Plug/Wedge/Soft Patch | Reduces local leak; low pressure/area limit and may degrade. |
| Collision Mat/External Patch | Covers hull damage from outside; requires access and securing. |
| Brace/Shore | Temporarily supports damaged frame/bulkhead; occupies space and access. |
| Jury Rig | Restores limited control/propulsion/rig function through approved alternate configuration. |
| Isolate/Close | Shut valve, hatch, power, mana or compartment connection. |
| Dewater | Pump/bail through 26B with available capacity and discharge route. |
| Cut Away | Remove dangerous detached mast/rig/component; creates loss and salvage debris. |
| Fire/Corruption Containment | Use owning-system resources to limit spread before repair. |
| Ground/Beach Intentionally | Transfer support to terrain for survival/repair, accepting 26G/26L risk. |

> **Emergency Repair Rule**
>
> Emergency work may restore a bounded capability or prevent escalation, but it cannot silently clear permanent damage or renew expired certification. The vessel records the patch, limitation, installer and follow-up requirement.

# 30. Alongside, Slipway and Dry-Dock Repair

| Environment | Available Work |
| --- | --- |
| Alongside | Above-water structure, interior systems, rigging, accessible machinery, cargo and minor underwater diving. |
| Beached/Slipway | Small/medium hull access, keel work where supported, component replacement and repainting. |
| Dry Dock | Full external hull, openings, shafts, propulsors, deep structural groups, coatings and pressure tests. |
| Floating Dock | Large hull access with combined support/stability constraints. |
| Specialist Magical Yard | Extraordinary materials, curse/corruption cleansing and magical containment. |

## 30.1 Proper Repair Sequence

- Secure movement and establish support state.
- Unload/isolate fluids, cargo, energy and hazardous components as required.
- Survey and freeze exact damage/source revisions.
- Remove damaged material through recovery/destructive transaction.
- Prepare substrate/connection and resolve replacement material role.
- Install, fasten, seal and finish through work packages.
- Test repaired group/component and reconcile compartments/services.
- Recommission through 26F and re-certify affected 26G layers.

# 31. Refitting and Configuration Change

A refit changes a commissioned vessel while preserving continuity. Every refit begins from a frozen structural/load/component revision and declares expected deltas before any destructive task commits.

| Refit Family | Examples | Primary Invalidations |
| --- | --- | --- |
| Component Replacement | Engine, rudder, pump, mast, battery, helm. | Provider, service and movement certification. |
| Interior Refit | Cargo hold, berths, workshops, partitions. | Compartments, access, load envelope and crew capacity. |
| Hull Reinforcement | Frames, armour, bulkheads, extra sealing. | Mass, structure, compartments and stability. |
| Hull Extension/Reduction | Lengthen, add deck, remove superstructure. | Local-grid bounds, structure, mass, movement and identity review. |
| Propulsion Conversion | Sail to engine, hybrid drive, mana retrofit. | Power/fuel/mana, control, mount and certification. |
| Role Conversion | Trader to patrol, fishing to exploration, transport to hospital. | Functional/capability, ownership/law and possibly identity. |
| Realm Adaptation | Ice, corruption, pressure or magical environment systems. | Material/service profile and specialist certification. |
| Cultural Refit | Palette, ornament, rig style and approved components. | Mostly presentation/identity; function only where explicit. |

## 31.1 Refit Planning

The planner shows cells/components to add, remove, replace or preserve; temporary support; shifted compartments; inventory/fluid migration; estimated mass/stability change from 26G preview; service interruptions; resource recoveries; and certifications that will become stale. The player may stage a refit to keep parts of the vessel usable where safe.

# 32. Upgrades, Conversions and Identity Continuity

| Continuity Test | Preserve Vessel Instance When |
| --- | --- |
| Physical continuity | A substantial recognised core/lineage remains and transfer is not a disguised replacement. |
| Ownership continuity | Owner/registration transition is explicit and legal. |
| History continuity | Prior history, repairs and provenance remain attached. |
| Spatial/local-grid migration | Cell/component addresses can be migrated with validated lineage. |
| Referenced state migration | Inventories, NPC markers, quests, fluids and services can be rebound safely. |
| Semantic continuity | The result is still reasonably the same vessel despite changed capability/purpose. |
| Approval | Applicable owner/registrar/project rules accept continuity. |

## 32.1 New Identity Triggers

- Two vessels are permanently merged and no single lineage dominates.
- One vessel is split into independently persistent operational vessels.
- Almost all recognised structure is replaced through a planned reconstruction whose continuity is intentionally not claimed.
- A static structure is newly transformed into a vessel without prior Vessel Instance identity.
- A conversion changes identity under law, story or registry rules and the owner accepts new registration.
- Migration cannot preserve critical references safely.

> **Identity Decision Rule**
>
> Identity is not decided by an arbitrary percentage alone. The system uses structural lineage, references, ownership, project intent and explicit approval. The decision and reason are stored in the refit/conversion history.

# 33. Safe Editing of Commissioned Vessels

| Edit Condition | Rule |
| --- | --- |
| Underway | Only authorised operational interactions and emergency tasks; no unrestricted structural edits. |
| Moored/Anchored | Minor maintenance and accessible non-structural work if movement/environment limits permit. |
| Repair/Refit Lock | Major local-grid/component work after 26G motion lock and support validation. |
| Occupied/Loaded | Planner exposes affected occupants, inventories, fluids and routes; task blocks until migrated/cleared. |
| Powered/Pressurised | Lockout/isolation required for affected systems. |
| Compartment Boundary Edit | 26F lineage preview required before commit. |
| External Hull Below Water | Diving, cofferdam, beaching or dry-dock environment required unless approved emergency method. |
| Multiplayer | Exclusive target/task locks with visible owner and timeout/recovery. |

## 33.1 Edit Revision Model

Each committed structural task increments the relevant Vessel Structural Revision. Load-only or configuration changes use their owning revisions. Certification and derived caches bind to these revisions and become stale only when their declared dependencies change, avoiding unnecessary full rescans for cosmetic work.

# 34. Decommissioning, Static Conversion and Break-Up

| Disposition | Result |
| --- | --- |
| Lay-Up | Vessel remains an instance but is immobilised, stored and maintained at reduced readiness. |
| Museum/Memorial | Converted to protected static structure with history and selected interior function. |
| Houseboat/Stationary Facility | Mobile capability removed or restricted; may become settlement structure while preserving lineage. |
| Hulk/Storage | Operational systems removed; floating/static container under restrictions. |
| Break-Up | Controlled dismantling project recovers eligible parts/materials and closes active vessel identity. |
| Abandonment | Ownership/status changes; world/faction systems may later create wreck, claim or hazard. |
| Scuttle | Intentional sinking/damage request through 26L and law/permission rules; not a 26H deletion shortcut. |

## 34.1 Static Conversion

Static conversion uses 26F decommissioning and structure-instance interfaces. It preserves historical Vessel Instance identity, source blueprint, major events and provenance even when the runtime representation becomes terrain/structure-bound. Re-mobilisation requires a new project, structural review and operational certification.

# 35. Salvage Rights, Claims and Permissions

| Claim Type | Meaning |
| --- | --- |
| Owner Recovery | Registered owner retains recovery rights subject to law and location. |
| Contracted Salvage | Owner/faction grants bounded inspection/recovery/restoration rights. |
| Abandoned Claim | World law allows claim after conditions such as time, notice or discovery. |
| State/Faction Wreck | Protected military, cultural or legal property. |
| Sacred/Heritage Site | Recovery may be prohibited, negotiated or limited to restoration. |
| Enemy/Captured Wreck | War, piracy and prize rules later modify ownership and consequences. |
| Unregistered Ancient Wreck | Discovery, culture, ruin and faction systems determine competing claims. |
| Player Settlement Jurisdiction | Local law and ownership settings apply within controlled waters/shore. |

> **Permission Rule**
>
> Being able to physically reach or break a wreck does not prove legal ownership. Unauthorised recovery may still be technically possible under world settings, but it must create theft, reputation, faction, crime or conflict consequences rather than silently granting clean title.

# 36. Salvage Survey, Hazards and Stabilisation

| Survey Layer | Examples |
| --- | --- |
| Identity/provenance | Known vessel, faction, age, owner, blueprint and event history. |
| Structural state | Remaining groups, loose sections, collapse risk and tow/lift points. |
| Environment | Depth, pressure, current, waves, tide, visibility, seabed, ice and weather. |
| Fluid/air | Flooding, trapped air, contamination, pressure and pump/seal possibilities. |
| Cargo/contents | Known/unknown inventories, hazardous goods, quest items and living occupants. |
| Energy/magic | Fuel, heat, pressure, charged mana, curse, corruption or unstable ritual. |
| Ecology/security | Creatures, nests, traps, guards, rival salvagers and territorial claims. |
| Access | Diver routes, openings, cutting points, crane/tow reach and decompression/refuge. |
| Recovery value | Condition bands, material roles, unique components and historical importance. |

## 36.1 Stabilisation Actions

- Establish claim and exclusion/work zone.
- Anchor, shore, brace or secure loose wreck sections.
- Isolate power, fuel, mana, pressure and dangerous cargo.
- Patch openings or create controlled drainage/vent paths.
- Remove trapped occupants and creatures safely where applicable.
- Install lift bags, pontoons, cofferdams, pumps, lines or cranes.
- Clear sediment/debris through bounded excavation transactions.
- Mark do-not-cut structural groups and collapse triggers.
- Create environmental/weather/tide work window.

# 37. Salvage Operations and Recovery Methods

| Operation | Use | Primary Risks |
| --- | --- | --- |
| Inventory Recovery | Remove accessible cargo, records and personal items. | Ownership, traps, contamination, unstable access. |
| Component Removal | Recover engines, anchors, weapons, pumps, instruments or fittings. | Foundation release, mass shift, stored energy and damage. |
| Cell/Material Dismantling | Recover blocks, plates, beams, timber and scrap. | Collapse, tool compatibility, yield/condition and debris. |
| Cut Section Recovery | Detach bounded module for lift/tow. | Structural lineage, mass estimate and cut safety. |
| Pump and Refloat | Seal/dewater enough intact hull to regain support. | Leak rate, free surface, stability and depth. |
| Lift Bag/Pontoon Raise | Add external buoyancy providers. | Attachment, uncontrolled ascent, pressure expansion and current. |
| Crane/Winch Recovery | Lift whole vessel or sections. | Capacity, rigging, support and shore/dock stability. |
| Tow Submerged/Partly Floating | Move wreck to safer worksite. | Drag, route clearance, tow-line and environmental load. |
| Magical Recovery | Levitation, water displacement, binding or portal-assisted method. | Mana, instability, law and extraordinary failure. |
| In-Situ Restoration | Repair where found and preserve context. | Logistics, environment, security and heritage restrictions. |

## 37.1 Salvage Yield

Yield is derived from actual remaining cells/components, condition, recovery method, tools and damage. Destructive cutting may be faster but produce scrap. Careful disassembly may recover an intact component with provenance. The system never rolls a generic loot table that duplicates contents already represented by the wreck.

# 38. Wreck Raising, Towing, Restoration and Memorialisation

| Outcome | Result |
| --- | --- |
| Raised for Dismantling | Wreck reaches supported worksite and enters break-up project. |
| Raised for Restoration | Remaining structure becomes refit/restoration target with lineage review. |
| Refloated as Hulk | Limited floating/storage/tow state; not automatically operational. |
| Towed to Port | Distant/local tow uses 26G and later port intake rules. |
| Restored Vessel | 26F recommissioning and 26G certification succeed with preserved or new identity decision. |
| Static Memorial/Ruin | World structure preserves history, graves, culture or event evidence. |
| Resource Reef/Habitat | Intentional in-place disposition owned by ecology/law systems later. |
| Abandoned/Failed Recovery | Project closes or pauses; supports, claims and hazards persist appropriately. |

## 38.1 Restoration Unknowns

Ancient or incomplete wrecks may not reveal every original cell or component. Restoration can use known evidence, culture patterns, 26I reconstruction tools and player choices. Recreated sections are recorded as restoration work rather than falsely labelled original.

# 39. Economy, Logistics and Contract Boundaries

26H exposes costs, requirements, stock reservations, labour demand, completion evidence, recovered outputs and service capabilities. Documents 26J-26K own port economy, contracts, pricing, insurance, fleet demand, trade routes and political consequences.

| 26H Exposes | Later Systems Decide |
| --- | --- |
| Required materials/tools/services | Prices, wages, taxes, tariffs and market availability. |
| Work-package labour hours/capabilities | Hiring, shifts, guilds, crew/worker contracts and morale. |
| Shipyard capacity and occupied berth | Port allocation, queue policy and strategic priority. |
| Repair/refit estimates and blockers | Commercial quote, credit, insurance and faction subsidy. |
| Salvage recoveries and provenance | Sale legality, prize share, museum value and faction claims. |
| Completion/quality/evidence | Reputation, warranty, contract reward and political response. |

# 40. Automation, Magic, Golems and Specialist Work

| Support System | Valid Contributions |
| --- | --- |
| Warehouse/Logistics | Deliver and reserve project materials, remove waste and route recovered parts. |
| Cranes/Winches/Conveyors | Move heavy modules and stock through declared capacity/ports. |
| Machine Tools | Cut, shape, drill, rivet, coat or fabricate components through recipes. |
| Pumps/Drainage | Dewater docks, cofferdams, vessels and wrecks through 26B. |
| Golems | Perform approved repetitive tasks with zones, tools, priorities and supervision. |
| Mana Tools | Cut, bind, seal, lift, stabilise or inspect through explicit spells/components. |
| Wards | Protect worksite from weather, creatures, corruption, fire or intrusion within capability. |
| Portal Logistics | Late-game transfer of approved materials/components, not unrestricted whole-vessel teleport by default. |

> **Automation Parity Rule**
>
> Automation may reduce labour and improve consistency, but it uses the same work-package prerequisites, reservations, commit commands and evidence as manual work. A machine cannot produce completed vessel cells merely because it reports throughput.

# 41. UI/UX, Overlays and Accessibility

| Interface | Required Information |
| --- | --- |
| Shipwright Overlay | Vessel bounds, intended/final cells, roles, supports, seams, compartments, access and blockers. |
| Project Screen | Stages, packages, stock, workers, priorities, quality, inspections, costs and history. |
| Worksite View | Routes, work faces, cranes, hazards, tide/weather window and permissions. |
| Repair Planner | Damage map, repair classes, temporary limits, options, materials and invalidations. |
| Refit Diff | Add/remove/replace/preserve cells/components, mass preview, lineage and identity decision. |
| Salvage View | Claim, hazards, recoverable targets, structure stability, lift/tow plan and provenance. |
| Inspection Report | Pass/warn/block reasons with highlighted evidence and recommended actions. |
| Contribution Ledger | Player/NPC/material/tool/service contributions and transaction outcomes. |

## 41.1 Interaction and Accessibility

- Complete keyboard/mouse and controller navigation, including layer/target cycling and confirmation.
- Non-colour cues for planned, reserved, completed, damaged, unsafe and blocked states.
- Text and icon reasons for every blocker; world highlighting alone is insufficient.
- Adjustable overlay density, transparency, motion, flashes, audio cues and haptics.
- Hold/toggle options for repeated work and safe batch commands.
- Camera comfort for tall structures, below-water work, moving docks and interior spaces.
- Optional guided mode that proposes next valid package without automatically changing design.
- Screen-reader-ready labels and logical focus order for project tables and target lists.

# 42. Multiplayer Authority and Contribution

| Area | Authority Rule |
| --- | --- |
| Project ownership | One authoritative project record with owner/role permissions. |
| Plan edits | Revisioned proposals or exclusive edit sessions; accepted changes recompile dependencies. |
| Task execution | Server/host validates reservations, target lock, work face and final commit. |
| Cell/component locks | Bounded target locks prevent conflicting build/remove/repair. |
| Inventory contribution | Atomic transfer into project reservation with contributor ledger. |
| NPC orders | Authorised commands only; shared settlement rules may override individual access. |
| Launch/refit/identity decisions | Explicit high-impact permission and confirmation; no client-only transition. |
| Salvage claims | Claim scope replicated and enforced; contested actions emit legal/faction events. |
| Disconnect recovery | Reservations and target locks expire/recover safely; committed work remains. |
| Split-screen | Local players retain separate focus/UI while sharing world authority. |

# 43. Persistence, LOD, Promotion and Recovery

| Fidelity State | Treatment |
| --- | --- |
| Active Detailed | Visible workers, carried items, task animations, cell commits, fluid/environment checks and local hazards. |
| Reduced Local | Lower update rate and grouped tasks; exact transactions retained. |
| Distant Project | Deterministic work-package summaries using available labour, stock, services, safety and time. |
| Dormant/Blocked | No progress; next evaluation time and blockers persisted. |
| Promoting | Reconstruct supports, completed cells, remaining stock, workers and safe positions before visual continuation. |
| Quarantined | Preserve project/vessel/wreck payload while missing pack/schema/migration prevents work. |

## 43.1 Save Requirements

- Project/source IDs, revisions, hashes and accepted blueprint branch.
- Target site/Vessel Instance/Wreck identity and spatial references.
- Stage/package/task states and deterministic ordering inputs.
- Reservations, committed transactions, by-products and contribution ledger.
- Temporary supports, access, hazards and worksite services.
- Quality, defects, inspections, repair patches and residual limits.
- Refit lineage, identity decisions and invalidated certifications.
- Salvage claim, recoveries, losses and provenance.
- Migration version, recovery journal and last known safe checkpoint.

## 43.2 Interrupted Transaction Recovery

Every multi-record operation such as commissioning, compartment migration, major component replacement, launch, whole-wreck raise or static conversion uses a journaled transaction. Recovery either completes the operation from verified inputs or restores the last safe state. It must never duplicate cells, inventories, fluids, components or Vessel Instance identities.

# 44. Godot/Summer Engine Technical Architecture

| Service/Resource | Responsibility |
| --- | --- |
| ShipwrightProjectService | Project lifecycle, plan binding, stage/package state and commands. |
| WorksiteSurveyService | World/vessel survey, support, access, hazards and revision hash. |
| VesselWorkPlanner | Compile blueprint/direct intent into material-resolved dependency graph. |
| WorkReservationService | Inventory/tool/service/target locks and atomic commit coordination. |
| VesselEditService | Authorised 26F local-grid, role, component and compartment-lineage changes. |
| ConstructionSimulationService | Detailed/reduced/distant task scheduling and reconciliation. |
| QualityInspectionService | Workmanship evidence, defects, tests and repair classification. |
| RepairRefitService | Damage-to-work conversion, refit diff, invalidations and history. |
| SalvageService | Claims, survey, stabilisation, recovery, provenance and disposition. |
| LaunchTransferService | Support transitions, 26F commissioning and 26G restraint/launch handoff. |
| ShipwrightViewModelService | Read-only UI models, overlays, reason traces and permissions. |
| ShipwrightMigrationService | Schema/project/vessel lineage migration and quarantine recovery. |

> **Godot Object Boundary**
>
> Definitions and persistent records should use compact Resources/data records. Visible scaffolds, workers, cranes and effects may use Nodes when promoted, but project tasks, vessel cells, seam edges and salvage pieces are not represented by one permanent Node each.

## 44.1 Command Pattern

```yaml
command_id: leyforge.system.command.shipwright.commit_task
project_instance_id: project_instance:01J...
work_package_id: project.work_package.hull.port_03
task_id: task:01J...
actor_id: npc_instance:01J...
target_spatial_ref:
  frame: vessel_local
  vessel_instance_id: vessel_instance:01J...
  cells: [[12,4,-2],[13,4,-2]]
expected_revisions:
  project: 41
  vessel_structure: 18
  inventory: 227
  damage: 9
reservation_id: reservation:01J...
client_intent_nonce: 88721
```

# 45. Performance Budgets and Scalability

| Budget Area | Direction |
| --- | --- |
| Project cell count | Scale-band caps; plan stored as compressed runs/chunks and sparse deltas. |
| Task graph | Packages group cells; do not schedule one global actor job per voxel indefinitely. |
| Active workers | Bounded by worksite and profile; distant labour aggregated. |
| Pathfinding | Reuse settlement/vessel route graphs and bounded final approach searches. |
| Overlays | Stream/aggregate visible regions; avoid rendering every seam/role at full detail simultaneously. |
| Inspections | Incremental invalidation by changed groups/revisions rather than full scan after every cosmetic action. |
| Inventory reservations | Batch compatible materials while preserving exact quantities/contributors. |
| Fluid/weather queries | Query bounded work zones and scheduled windows; no per-task continuous sampling. |
| Salvage debris | Group noncritical scrap and use LOD while preserving authoritative totals. |
| Save size | Persist deltas, project state and evidence hashes; derived previews/caches reconstructable. |

## 45.1 Redesign Triggers

- A normal ship requires a task record for every hammer strike or fastener.
- Large project plans cannot stream or diff without loading the entire vessel volume.
- Distant construction diverges materially from detailed conservation after promotion.
- Repair/refit invalidates all vessel caches regardless of changed scope.
- Salvage creates thousands of persistent loose actors for ordinary debris.
- Multiplayer task locks require whole-vessel exclusivity for unrelated work.
- A Node-per-cell or Node-per-task design becomes necessary for base simulation.

# 46. Registry Facets, Relationships and Capabilities

## 46.1 Proposed Extension Facets

| Facet ID | Applies To | Representative Fields |
| --- | --- | --- |
| leyforge.maritime.extension.shipwright_material_facet | block/material/item | workability, fastener_compatibility, sealant_compatibility, treatment, recovery_profile, trade_requirements. |
| leyforge.maritime.extension.shipwright_tool_facet | item/tool | task_capabilities, material_tiers, medium_support, quality_modifier, durability_cost, safety_requirements. |
| leyforge.maritime.extension.vessel_blueprint_work_facet | blueprint | stage_graph, material_roles, support_profile, work_faces, role_hints, test_requirements. |
| leyforge.maritime.extension.shipwright_project_facet | project definition | project_family, required_capabilities, stage_template, commit_policy, quality_profile. |
| leyforge.maritime.extension.vessel_component_install_facet | component | mount_requirements, service_isolation, install_tasks, removal_tasks, inspection_profile. |
| leyforge.maritime.extension.salvage_facet | wreck/component/material | recovery_methods, hazard_profile, provenance_policy, legal_class, condition_yield. |

## 46.2 Relationship Types

| Relationship | Example |
| --- | --- |
| requires_capability | Hull sealing package requires marine_sealing. |
| uses_material_role | Blueprint stage uses hull_shell_primary. |
| resolves_to_definition | Role resolves to oak plank family under palette. |
| requires_worksite_profile | Keel rebuild requires supported_dry_hull. |
| invalidates_certification | Mast replacement invalidates sail/control/open-sea report. |
| repairs_damage_family | Patch definition repairs breach.small.plank. |
| replaces_component_family | Engine refit replaces propulsion provider family. |
| preserves_lineage_from | Restored vessel preserves lineage from wreck identity. |
| recovered_from_instance | Salvaged compass recovered from vessel/wreck instance. |
| requires_claim_profile | Ancient wreck recovery requires heritage permission. |
| produces_evidence | Pressure test produces sealing inspection evidence. |
| handoff_to_system | Commission project hands vessel to 26F then 26G. |

## 46.3 Capability Families

| Capability | Meaning |
| --- | --- |
| leyforge.system.capability.maritime.shipwright.survey | Resolve worksite, design, access and hazard evidence. |
| ...shipwright.structure.wood/metal/stone/magical | Construct and repair material-specific structure. |
| ...shipwright.sealing.marine | Create and test marine watertight seams/closures. |
| ...shipwright.rigging | Install and repair masts, lines and sails. |
| ...shipwright.engineering | Install and repair propulsion/pumps/control machinery. |
| ...shipwright.launch.small/ship/great | Execute support transition for scale band. |
| ...shipwright.drydock | Provide supported dry-hull work environment. |
| ...shipwright.salvage.surface/diving/heavy | Inspect, stabilise and recover wrecks by environment/scale. |
| ...shipwright.restoration | Reconstruct incomplete historic vessel with provenance. |
| ...shipwright.inspection.structural/sealing/systems | Produce required evidence for handoff. |

# 47. Validation, Reason Codes and Evidence

| Validation Layer | Examples |
| --- | --- |
| Schema/reference | Qualified IDs, facets, stages, tasks, materials, tools and relationship cardinality. |
| Plan completeness | Every final intent has material, task, dependency, support and commit policy. |
| Resource conservation | Inputs, outputs, by-products, recovery and cancellation balance. |
| Spatial safety | Bounds, work faces, routes, supports, clearances and protected edits. |
| Vessel integrity | 26F scan, compartment migration, component foundations and transfer manifest. |
| Operational consequence | 26G certification invalidation and preview trace. |
| Authority | Ownership, project roles, salvage claim and high-impact confirmations. |
| Persistence/migration | Save/reload, interrupted transactions, optional-pack removal and lineage. |
| LOD equivalence | Detailed versus distant completed work and stock conservation. |
| Performance | Scale-band task, overlay, inspection, path and save budgets. |
| Accessibility | Controller-only flow, non-colour reasons, scalable UI and comfort settings. |

## 47.1 Evidence Bundle

- Project/source manifest and semantic hashes.
- Survey and resolved-plan report.
- Material/capability suitability trace.
- Reservation and transaction journal.
- Stage/package completion and contributor ledger.
- Quality/defect/inspection reports.
- 26F commissioning and 26G invalidation/certification references.
- Save/migration/rollback test output.
- Packaged performance profile and platform/build signature.
- Approvals, accepted restrictions and unresolved warnings.

# 48. Prototype Laboratories and Test Programme

| Laboratory | Purpose |
| --- | --- |
| 26H-LAB-01 Small Beach Build | Direct-build raft/boat, support separation, launch and conservation. |
| 26H-LAB-02 Blueprint Slipway | NPC-built fishing boat from warehouse stock through all stages. |
| 26H-LAB-03 Dry-Dock Refit | Haul operational vessel, replace engine/bulkhead, recommission and re-certify. |
| 26H-LAB-04 Emergency Leak | Patch, brace and pump at sea, then proper harbour repair. |
| 26H-LAB-05 Compartment Migration | Add/remove bulkhead around inventories/fluids and verify lineage. |
| 26H-LAB-06 Major Extension | Lengthen hull and evaluate identity continuity plus mass/stability preview. |
| 26H-LAB-07 Wreck Salvage | Claim, survey, stabilise, recover cargo/component, raise and tow. |
| 26H-LAB-08 Restoration | Reconstruct incomplete ancient hull with original/recreated provenance. |
| 26H-LAB-09 Distant Shipyard | Demote active project, progress exact packages, promote and reconcile. |
| 26H-LAB-10 Multiplayer Yard | Concurrent workers, conflicting edits, disconnect recovery and contribution ledger. |
| 26H-LAB-11 Optional Pack Removal | Quarantine magical component/refit without losing vessel/project payload. |
| 26H-LAB-12 Scale Ceiling | Maximum provisional vessel project under packaged performance profile. |

# 49. Production Scope and Staged Implementation

| Stage | Scope | Exit Evidence |
| --- | --- | --- |
| H0 - Data Fixture | One material, tool, project, stage, task, reservation and reason-code fixture. | Schema/reference/conservation validation. |
| H1 - Direct Small Craft | Worksite, direct cell intent, supports, basic tools, launch and 26F handoff. | Playable small-craft build with save/recovery. |
| H2 - Blueprint and NPC Build | 26I intake adapter, stages, warehouse reservations, worker tasks and slipway. | NPC-built fishing vessel with exact stock. |
| H3 - Repair | Damage survey, emergency patch, proper replacement, inspection and history. | Damage-to-repair end-to-end test. |
| H4 - Refit | Controlled edit lock, component/hull changes, compartment migration and invalidations. | Operational vessel refit and re-certification. |
| H5 - Salvage | Claim, survey, recovery, provenance, raise/tow and disposition. | One persistent wreck recovery loop. |
| H6 - Distant Simulation | Project LOD, promotion/demotion and multi-settlement shipyard support. | Detailed/distant equivalence suite. |
| H7 - Hardening | Multiplayer, migrations, optional packs, performance, accessibility and release evidence. | Set 25 gate-ready evidence bundle. |

## 49.1 Core Production Recommendation

The first production maritime slice should include one improvised craft, one blueprint-built fishing/trade boat, one basic slipway or building berth, core timber/fastener/sealant roles, a shipwright tool set, one NPC shipwright team, emergency leak repair, one proper dry/shore repair, one engine or rig refit and one small wreck salvage. Great ships, floating dry docks, advanced magical restoration and mass fleet production remain later milestones.

# 50. Cross-Document Integration and 26I Handoff

| Document/System | Required 26H Integration |
| --- | --- |
| 03 Blocks | Shipwright material/workability/sealing/recovery facets and temporary support families. |
| 04 Items | Tools, fasteners, sealants, coatings, rigging, kits, recovered provenance and installed components. |
| 05 Recipes | Project, task, repair, refit, dismantle, treatment, launch and salvage transformations. |
| 06 Resources | Maritime material roles, long-term maintenance demand, salvage condition and strategic inputs. |
| 07/19/20 NPC and Settlements | Shipyard facilities, work packages, labour, warehouses, routes, project selection and service activation. |
| 08 Automation | Cranes, pumps, machine tools, logistics and project transactions. |
| 09 Magic | Rune tools, magical seals, lifts, wards, specialist risks and restoration. |
| 12 Structures | Slipways, dry docks, scaffolds, wreck/static conversion and dynamic state. |
| 15 Quests/Events | Commissions, shortages, repairs, launch events, salvage disputes and restoration arcs. |
| 16/26L Combat/Damage | Damage records, repairability, wreck identity and aftermath handoff. |
| 17 UI/UX | Shipwright overlays, project/repair/refit/salvage screens and accessibility. |
| 18 replacement | Services, commands, transactions, saves, LOD, validators and Summer task contracts. |
| 25 Set | Qualified schemas, pack manifests, capability/relationship graphs, gates and evidence. |
| 26I Vessel Forge | Blueprint work metadata, stage authoring, role hints, support profiles, test lab and project export. |
| 26J Ports | Shipyard service capacity, berths, dry docks, labour and civil contracts. |
| 26G Movement | Support transitions, towing, launch, stale certification and preview outputs. |

## 50.1 Formal Handoff to 26I

- 26I must author vessel blueprints without becoming the runtime project or inventory authority.
- Blueprints must expose stable local-grid cells/shapes, semantic material roles, proposed structural roles, component mounts, service paths, construction stages, optional work faces, support profiles and test requirements.
- 26I must preview 26F commissioning and 26G movement evidence, but production approval remains with the owning validators.
- Player-created blueprints may use restricted schemas and safe packages while sharing the same runtime intake contract.
- Procedural variants must produce deterministic source revisions and material/work metadata, not opaque generated scenes.
- Blueprint updates require diff/rebase support for active projects and existing vessels.
- 26I must provide laboratories for stage playback, support removal, access, sealing, component installation and export validation.

> **26I Boundary**
>
> The Vessel Forge decides what is authored and previewed. 26H decides how an approved design is physically executed in a world project. 26F decides whether the resulting assembly is a valid vessel. 26G decides whether the current vessel can operate in its intended environment.

# Appendix A. Core Record Templates

```yaml
shipwright_project_instance:
  instance_id: project_instance:01J...
  definition_id: leyforge.maritime.project.vessel_construction.standard
  owner_ref: player_instance:01J...
  target:
    kind: new_vessel_worksite
    worksite_id: worksite:01J...
  source_blueprint:
    definition_id: playerpack.ash.vessel.fishing_cutter_01
    revision: 7
    content_hash: sha256:...
  resolved_plan_revision: 3
  lifecycle_state: under_construction
  current_stage_id: stage.hull_closure
  project_revision: 41
  reservation_summary_ref: reservation_ledger:01J...
  contributor_ledger_ref: contribution_ledger:01J...
  accepted_restrictions: []
  history_refs: []
```

```yaml
shipwright_work_package:
  package_id: project.work_package.hull.port_03
  stage_id: stage.hull_closure
  trade_capability: leyforge.system.capability.maritime.shipwright.structure.wood
  target_cells: compressed_cell_set:...
  material_requirements:
    - role: hull_shell_primary
      resolved_definition_id: leyforge.core.block.construction.oak_plank
      quantity: 48
  tool_requirements:
    - capability: leyforge.system.capability.tool.saw.wood.tier_1
  prerequisites: [project.work_package.frame.port_03]
  work_faces: [work_face:01J...]
  commit_policy: per_batch
  status: ready
```

```yaml
salvage_project_instance:
  instance_id: salvage_project:01J...
  wreck_instance_id: wreck_instance:01J...
  claim_profile_id: leyforge.maritime.claim.owner_recovery
  claimant_ref: faction_instance:01J...
  survey_revision: 5
  hazard_refs: [hazard:stored_mana, hazard:unstable_port_frames]
  stabilisation_packages: [project.work_package.salvage_brace_port]
  recovery_ledger_ref: recovery_ledger:01J...
  disposition_intent: restore_and_recommission
  state: stabilising
```

# Appendix B. Construction Stage and Work-Package Templates

| Template | Mandatory Content |
| --- | --- |
| Mobilisation | Bounds, permissions, routes, storage, supports, hazards, cleanup and demobilisation. |
| Structural Batch | Target cells/groups, material roles, tools, work faces, sequence, quality and commit. |
| Sealing Batch | Seam set, sealant, surface preparation, environment, cure/test and rating. |
| Component Install | Item instance, foundation, fasteners, services, isolation, alignment, test and activation handoff. |
| Removal/Recovery | Target, support, isolation, removal method, outputs, provenance, cleanup and dependent invalidation. |
| Inspection | Scope, method, tool, evidence, pass bands, defects, rework and certification link. |
| Launch/Haul | Support map, restraints, route, tide/weather, force provider, authority and recovery. |
| Salvage Stabilisation | Claim, hazards, structure, support, environment, access and no-cut zones. |

# Appendix C. Repair and Refit Classification Matrix

| Change | Afloat Allowed | Dry Support Required | 26F Recommission | 26G Re-certify |
| --- | --- | --- | --- | --- |
| Coating/cleaning above water | Usually | No | No unless material facet changes | No |
| Minor rigging replacement | Often | No | Component inspection | Sail/control layer |
| Emergency hull patch | Yes under limits | No | Patch/history update | Restriction/stale as profile defines |
| Permanent hull cell replacement below water | Rare specialist | Usually | Yes | Support/stability/load |
| Bulkhead addition/removal | Only controlled specialist | Usually | Yes; compartment lineage | Stability/load/access |
| Engine replacement same family | Alongside possible | Not always | Component/mount | Propulsion/control/load |
| Major engine conversion | Controlled yard | Often | Yes | Full affected layers |
| Hull length extension | No | Yes | Full structural | Full operational |
| Interior furniture/cosmetic | Yes if accessible | No | Only if path/marker changes | Only load if significant |
| Armour installation | Limited | Often | Structure/mount | Mass/stability/clearance |
| Mast height increase | Alongside/yard | No/yard by scale | Rig/mount | Sail/stability/clearance |
| Restoration from wreck | No | Yes/stabilised site | Full commissioning | Full certification |

# Appendix D. Salvage Operation Matrix

| Target | Preferred Method | Expected Output | Common Blocker |
| --- | --- | --- | --- |
| Accessible cargo | Inventory transfer | Original item stacks/instances | Claim, trap, route, capacity. |
| Intact component | Controlled removal | Installed item/component with condition/provenance | Stored energy, foundation, lift. |
| Damaged component | Dismantle/scrap | Parts, scrap, residues | Contamination, tool, instability. |
| Hull cell family | Careful disassembly | Blocks/parts by condition | Collapse, depth, fastener access. |
| Collapsed mixed debris | Sort/process | Scrap and bounded recoveries | Performance, contamination, ownership. |
| Whole small wreck | Patch/lift/tow | Wreck/vessel target at worksite | Mass, support, route, weather. |
| Large wreck section | Cut and lift | Persistent module/section lineage | Cut safety, crane, current. |
| Historic remains | In-situ conservation | Restored site, evidence, selected artefacts | Culture law, damage risk. |
| Magical core | Specialist containment | Core/research/quest item | Instability, mana, corruption. |

# Appendix E. Validation and Reason-Code Catalogue

| Code | Default Severity | Meaning |
| --- | --- | --- |
| VSL_WRK_SITE_UNSURVEYED | Blocker | Worksite lacks a current survey bound to relevant revisions. |
| VSL_WRK_SITE_SUPPORT_INADEQUATE | Blocker | Support state cannot safely carry planned work/change. |
| VSL_WRK_SITE_ROUTE_BLOCKED | Error | Worker or material route to required work face is invalid. |
| VSL_WRK_PERMISSION_DENIED | Blocker | Actor lacks project, vessel, claim or site authority. |
| VSL_WRK_PLAN_SOURCE_STALE | Error | Blueprint/plan/source revision changed after approval. |
| VSL_WRK_MATERIAL_ROLE_UNRESOLVED | Blocker | Critical material role has no valid qualified provider. |
| VSL_WRK_MATERIAL_UNSUITABLE | Blocker/Warning | Candidate material fails or conditionally meets suitability. |
| VSL_WRK_TOOL_MISSING | Error | Required tool capability is unavailable. |
| VSL_WRK_SERVICE_UNAVAILABLE | Error | Power, mana, pump, crane, air or other service is unavailable. |
| VSL_WRK_TARGET_LOCKED | Information/Error | Another task or system owns the target region. |
| VSL_WRK_RESERVATION_FAILED | Error | Required items/tool/service capacity could not be reserved. |
| VSL_WRK_COMMIT_REVISION_CONFLICT | Error | Source state changed before task commit. |
| VSL_WRK_TEMP_SUPPORT_CONNECTED | Blocker | Temporary support would be accidentally commissioned. |
| VSL_WRK_TRANSFER_MANIFEST_INCOMPLETE | Blocker | Cell/entity/inventory/fluid/network transfer class unresolved. |
| VSL_WRK_SEAL_TEST_FAILED | Blocker/Warning | Seam/closure does not meet selected rating. |
| VSL_WRK_DEFECT_DETECTED | Warning/Error | Inspection found workmanship defect requiring decision/rework. |
| VSL_WRK_COMPARTMENT_MIGRATION_UNSAFE | Blocker | Affected compartment references cannot be migrated safely. |
| VSL_WRK_CERTIFICATION_INVALIDATED | Information | Structural/refit change marks specified 26G evidence stale. |
| VSL_WRK_LAUNCH_WINDOW_INVALID | Blocker/Warning | Depth, tide, weather, route or support prevents launch. |
| VSL_WRK_MOTION_LOCK_REQUIRED | Blocker | Vessel must enter valid repair/refit restraint state. |
| VSL_WRK_REPAIR_METHOD_TEMPORARY | Warning | Selected repair has explicit limit or expiry. |
| VSL_WRK_IDENTITY_REVIEW_REQUIRED | Blocker | Conversion/refit requires preserve/new identity decision. |
| VSL_WRK_SALVAGE_CLAIM_MISSING | Blocker/Legal Warning | No valid claim for requested recovery action. |
| VSL_WRK_SALVAGE_STRUCTURE_UNSTABLE | Blocker | Recovery/cutting would exceed current stabilisation evidence. |
| VSL_WRK_SALVAGE_CAPACITY_INSUFFICIENT | Blocker | Lift, tow, storage or workforce capacity is inadequate. |
| VSL_WRK_PROVENANCE_UNRESOLVED | Warning/Error | Recovered output cannot be assigned required source/legal state. |
| VSL_WRK_LOD_RECONCILIATION_FAILED | Quarantine | Detailed and distant project state cannot reconcile safely. |
| VSL_WRK_SCHEMA_UNSUPPORTED | Quarantine | Required project/facet/migration schema is unavailable. |
| VSL_WRK_PERF_BUDGET_EXCEEDED | Blocker | Project exceeds approved scale/task/evidence budget. |

# Appendix F. Prototype and Performance Test Matrix

| Test ID | Scenario | Pass Condition |
| --- | --- | --- |
| 26H-T01 | Direct-build small raft on beach. | Exact materials consumed; supports excluded; commissioning succeeds. |
| 26H-T02 | Blueprint fishing boat built by NPCs. | Stages, stock, routes, tools and cells reconcile after save/load. |
| 26H-T03 | Blocked worker route. | No progress or consumption until route repaired. |
| 26H-T04 | Cancel mid-stage. | Unconsumed reservations return; committed cells and temporary supports persist correctly. |
| 26H-T05 | Interrupt commissioning process. | Recovery yields either complete work assembly or one Vessel Instance, never duplicates. |
| 26H-T06 | Emergency patch active leak. | Leak reduction, patch limit and follow-up record are correct. |
| 26H-T07 | Replace submerged hull cells in dry dock. | Support, dewatering, resources, damage and sealing reconcile. |
| 26H-T08 | Add bulkhead around loaded compartments. | Lineage preview/migration preserves inventories and fluids. |
| 26H-T09 | Replace engine and move fuel route. | Component/service state and certification invalidations are correct. |
| 26H-T10 | Lengthen vessel hull. | Identity review, structural revision and 26G preview update correctly. |
| 26H-T11 | Two players work separate hull regions. | Concurrent valid commits; conflicts limited to overlapping targets. |
| 26H-T12 | Worker disconnect during reservation. | Lock and reservation recover without lost/duplicated items. |
| 26H-T13 | Recover intact compass from wreck. | Single original instance with wreck provenance and claim state. |
| 26H-T14 | Destructively scrap damaged engine. | No intact duplicate; correct parts/scrap outputs. |
| 26H-T15 | Raise and tow small wreck. | Support transition, identity and contents remain continuous. |
| 26H-T16 | Restore ancient wreck with recreated bow. | Original versus restored provenance and identity decision persist. |
| 26H-T17 | Distant project progresses then promotes. | Exact stock, completed cells, workers and tasks reconcile. |
| 26H-T18 | Remove optional magical pack during refit. | Project/vessel quarantines with payload preserved. |
| 26H-T19 | Controller-only construction and repair flow. | Plan, target, contribute, work, inspect and confirm without pointer. |
| 26H-T20 | Maximum provisional great-vessel project. | Packaged memory, task, save and UI budgets pass. |

# Appendix G. Completion Checklist

- [x] 26F, 26G and Set 25 authority boundaries consumed.
- [x] Shipwright identity, principles, experience bands and non-goals defined.
- [x] Canonical terms and record separation defined.
- [x] Project lifecycle, worksite taxonomy and support states defined.
- [x] Direct, blueprint, NPC, kit, restoration and conversion entry paths defined.
- [x] Shipwright skills, progression, tools and modes defined.
- [x] Deterministic site survey and blueprint intake defined.
- [x] Material roles, suitability, substitution and provenance defined.
- [x] Construction stages, work packages, tasks and reservation transactions defined.
- [x] Temporary supports, cradles, slipways and dry docks defined.
- [x] Primary structure, hull sealing, internal structure and component installation defined.
- [x] Fit-out, access, habitability and pre-launch inspections defined.
- [x] Commissioning, launch, haul-out, dry-docking and refloat handoffs defined.
- [x] Resource conservation and integer transaction rules defined.
- [x] NPC shipwright roles, labour and distant simulation rules defined.
- [x] Quality, defects, inspection and rework defined.
- [x] Damage surveys and repair classifications defined.
- [x] Emergency, afloat, alongside and dry-dock repair defined.
- [x] Refit, upgrade, conversion and identity continuity defined.
- [x] Safe editing, decommissioning, static conversion and break-up defined.
- [x] Salvage claims, surveys, stabilisation, methods, yields and restoration defined.
- [x] Economy, automation, magic and later-document boundaries defined.
- [x] UI/UX, accessibility, multiplayer and contribution rules defined.
- [x] Persistence, LOD, transaction recovery and quarantine defined.
- [x] Godot/Summer services, commands and no-per-cell-node boundary defined.
- [x] Performance budgets and redesign triggers defined.
- [x] Registry facets, relationships and capabilities defined.
- [x] Validation, reason codes, evidence and prototype laboratories defined.
- [x] Staged production scope and Core Production recommendation defined.
- [x] Cross-document matrix and formal 26I handoff completed.
