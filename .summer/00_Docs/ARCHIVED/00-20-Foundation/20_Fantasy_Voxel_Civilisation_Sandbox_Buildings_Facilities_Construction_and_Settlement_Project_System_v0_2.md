# Fantasy Voxel Civilisation Sandbox

## 20 - Buildings, Facilities, Construction and Settlement Project System

### Universal Building Functions, Blueprint Forge Integration, NPC Construction, Runtime Structures and Civilisation Growth

**Version 0.2 - Revised Master Framework and Registry Architecture Draft**

A modular, database-ready framework for every functional building, facility, public space, utility, fortification, network project, district component and civilisation-scale construction project in Leyforge. Version 0.2 preserves the approved seven-needs settlement model and 120-definition universal catalogue while integrating the Unified Forge, Blueprint Forge, Godot/Summer Engine implementation direction and a clearer separation between gameplay definitions, editable voxel source, construction projects and persistent world instances.

## Master Framework Statement

| **Field** | **Locked Direction** |
|---|---|
| **Document Role** | Document 20 is the master gameplay and data-contract framework for the complete Document Set 20. It owns shared terminology, functional schemas, need integration, construction rules, runtime lifecycles, project-selection rules, source-of-truth boundaries and cross-document governance. |
| **Companion Role** | Documents 20A-20F own detailed universal building families and settlement-scale plans; 20G owns culture, faction, biome and realm packs; 20H owns the numbered 120-definition catalogue, stage matrix and production backlog. |
| **Forge Direction** | Official developer-authored building and structure source is created in Blueprint Forge as defined by Document 22I and implemented through Document 22K. Blueprint Forge does not decide what a building means to settlement simulation; it authors voxel and semantic source that satisfies Document 20 contracts. |
| **Player-Creator Direction** | Document 19 owns settlement growth, district planning and the restricted player-facing blueprint creators. Player blueprints use compatible data contracts and validators but do not receive unrestricted developer registry, migration, dependency or override authority. |
| **Core Philosophy** | Buildings are functional civilisation systems. A structure provides no abstract service merely because it resembles a house, workshop, tower or machine. Function requires validated semantic markers, routes, people, resources, equipment, permissions, networks, condition and operational state. |
| **Main Needs** | Housing, Provisions, Health, Work, Safety, Infrastructure and Morale remain the only seven main settlement needs. All other values are capacities, causes, risks, services, policies or progression systems beneath them. |
| **Resource Rule** | Construction, repair, production, maintenance and upgrades conserve real items and energy through authoritative transactions. Decorative geometry never creates stock, power, mana, labour or service capacity. |
| **Voxel Rule** | Editable official structures remain voxel-first. Runtime merged meshes, collision proxies, navigation caches, thumbnails and distant representations are derived bake products, not replacement source. |
| **Runtime Rule** | A universal definition, a Forge blueprint, a construction project and a placed structure instance are separate records with different authority and persistence. |
| **Simulation Rule** | Nearby structures, workers and construction are represented physically. Distant settlements use bounded, deterministic summaries that preserve resources, staffing, project progress, condition, ownership, services and history. |
| **POC Direction** | Use a 12-definition Core Infrastructure Proof, a 4-definition Raid Extension and the remaining 14 definitions as the Extended Forest Hamlet Vertical Slice. The existing 30-entry roster remains protected but is no longer treated as one indivisible first milestone. |
| **Engine Direction** | Godot is the runtime and editor host. Summer Engine assists development under reviewable change controls. Unreal-specific assumptions from earlier technical documents are superseded where they conflict with the current Godot/Summer direction. |
| **Scope Control** | Version 0.2 retains the 120 universal-definition ceiling from Document 20H. New roofs, palettes, ordinary sizes, damage states, cultural forms and decorative variations remain blueprint or pack variants unless they create a genuinely distinct functional contract. |

> **Locked Master Rule**  
> A settlement capability exists only when a valid universal function is resolved through an approved blueprint or equivalent runtime construction, instantiated through an authoritative project or world-placement process, and currently passes its activation contract. Appearance may communicate function; it never substitutes for it.

# Document Purpose

Document 20 establishes the shared language and rules that make all Leyforge buildings understandable to settlement AI, NPCs, players, quests, logistics, automation, magic, world generation, saves and the Unified Forge. It answers four different questions without collapsing them into one record:

1. **What function exists?** The universal building or project definition describes the settlement capability, need contribution, staffing, inputs, outputs, risks and validation contract.
2. **What editable structure satisfies it?** Blueprint Forge stores voxel composition, assets, material roles, semantic layers, construction stages, state deltas and placement rules.
3. **What is being built or changed?** The construction-project record stores site, reservations, labour, stage progress, blockers, ownership, contributors and consequences.
4. **What exists in the saved world?** The structure-instance record stores the resolved blueprint, transform, ownership, occupancy, condition, active services, damage, upgrades, local substitutions and history.

This separation is essential. A cottage definition may be satisfied by many official, cultural and player-created blueprints. One blueprint may be used by many projects. One completed blueprint may produce thousands of placed instances, each with different residents, damage, ownership and history. Conversely, a mixed-use blueprint may satisfy more than one compatible universal definition while keeping each functional capacity traceable.

Version 0.2 does not discard the previous building suite. It preserves the seven-needs model, stage ladder, universal catalogue, real-resource economy, visible NPC construction, autonomous planner, culture-pack system, district hierarchy and persistent damage. The revision primarily corrects authoring ownership and adds the contracts required by Blueprint Forge and Godot runtime baking.

# Design Sources and Dependencies

| **Source** | **Relevant Direction** | **How Document 20 Uses It** |
|---|---|---|
| **00 - Master Game Design Bible** | Voxel survival, living civilisations, magic, factories, multiple races, world shaping and player freedom. | Makes buildings the physical layer through which civilisation capability and world change become visible. |
| **01 - Core Gameplay Loop** | Explore, gather, craft, build, interact, automate, defend, upgrade and expand. | Converts resources and actions into staged projects, new services and future goals. |
| **03 - Blocks Registry** | Stable voxel blocks, shapes, functional blocks, materials and dynamic states. | Supplies the physical vocabulary referenced by Forge blueprint placements. |
| **04 - Items Registry** | Construction items, tools, furnishings, components, fuel, medicine, trade and magical resources. | Supplies conserved stock used by projects, activation and maintenance. |
| **05 - Crafting and Recipe Registry** | Project recipes, exact inputs, time, labour, stations, by-products, cancellation and consequences. | Owns authoritative resource transformations used by construction and repair stages. |
| **06 - Resource Progression** | Long-lived material relevance, strategic resources and advanced civilisation inputs. | Makes buildings and repairs major sustained resource sinks without invalidating earlier materials. |
| **07 - NPC Village System** | Named residents, households, jobs, warehouses, needs, projects, growth, raids and simulation LOD. | Supplies settlement demand, labour, occupancy, planner context and persistent consequences. |
| **08 - Automation System** | Logistics, machines, power, item flow, golems and bounded distant processing. | Requires typed storage, logistics and network endpoints in functional contracts and blueprints. |
| **09 - Magic System** | Mana, runes, wards, rituals, cleansing, portals and practical magical infrastructure. | Treats magic buildings as physical services with sources, risks, permissions and maintenance. |
| **10 - Creatures and Monsters** | Raids, camps, nests, pressure, mounts, bosses and world threats. | Connects structure protection, target value, refuge, creature markers and persistent aftermath. |
| **11 - Biomes and World Generation** | Terrain, climate, resources, roads, rivers, leylines and structure placement. | Constrains sites and provides world-placement, adaptation and relational-anchor contracts. |
| **12 - Structures** | Dynamic structures, worldgen, damage, restoration, ownership and state. | Provides the broader runtime structure foundation shared by settlement and non-settlement structures. |
| **13 - Races, Peoples, Cultures and Factions** | Separate ancestry, culture, faction, government, law and technology. | Keeps universal functions separate from culture packs, ownership overlays and signature content. |
| **14 - Dimensions** | Persistent realms, hazards, societies, resources and portal routes. | Requires realm-adapted construction, arrival, containment and interdimensional infrastructure. |
| **15 - Quest and Event System** | Requests, crises, contracts, failures, reconstruction and world evidence. | Lets projects and structures become objectives, causes, consequences and historical records. |
| **16 - Combat, Gear and Defence** | Guards, walls, gates, cover, siege, shelters, damage and aftermath. | Defines protection-chain contributions, damage groups and defence activation contracts. |
| **17 - UI/UX System** | World-first feedback, layered inspection, minimal top-level bars and accessible causes. | Keeps the seven-needs overview readable while exposing detailed blockers and service states. |
| **18 - Technical Implementation Plan** | Stable IDs, validated registries, saves, LOD, CI and migrations. | Retains general architecture principles; Unreal-specific implementation is superseded by Godot/Summer documents. |
| **19 - Settlement Growth and Player Voxel Blueprint System** | Player creators, settlement planning, parcels, districts, NPC construction and settlement growth. | Owns player-facing authoring and settlement orchestration using the contracts defined here. |
| **20A-20H** | Detailed building families, packs, catalogue, stages and backlog. | Populate and operationalise the shared master framework. |
| **21A-21G** | Voxel Asset Forge, materials, variants, overrides, UI, technical platform and migration. | Supplies shared Forge platform services and asset dependencies. |
| **22A-22H** | Entity Forge, rigs, animation, customisation and gameplay markers. | Supplies entity-scale, navigation, interaction and attachment compatibility. |
| **22I** | Blueprint Forge authoring, semantic layers, stages, states, inheritance and world placement. | Owns official editable structure source and validation previews. |
| **22J** | Unified Forge UI/UX and workflow. | Owns developer workspace interactions, manifest, dependency graph and lifecycle workflow. |
| **22K** | Godot/Summer technical implementation of Entity and Blueprint Forge. | Owns Resources, editor services, bake products, caches, migrations and runtime integration. |
| **22L** | Visual production and migration. | Owns migration of legacy buildings and production sequencing for official voxel content. |

# Static Table of Contents

1. Locked System Identity  
2. Locked Decision Summary  
3. Document Suite and Source-of-Truth Architecture  
4. Core Record Separation and Data Flow  
5. Universal Taxonomy and Registry Units  
6. Stable IDs, Namespaces and Versioning  
7. Seven Main Settlement Needs  
8. Demand, Capacity, Coverage and Status Calculation  
9. Shared Semantic Layer, Marker, Zone and Socket Contracts  
10. Material Roles, Packs and Visual Resolution  
11. Blueprint Forge Source and Runtime Bake Boundaries  
12. Construction Projects, Stage Graphs and Resource Conservation  
13. Shared Runtime Lifecycle and Operational State Model  
14. Activation Contracts and Partial Functionality  
15. Upgrade Inheritance, Conversion and Replacement  
16. Damage, Repair, Occupation, Corruption and Restoration  
17. Parcels, Terrain, Foundations, Access and Placement  
18. Roads, Utilities, Storage, Logistics, Power and Mana Networks  
19. Residents, Households, Jobs, Staffing and Entity Compatibility  
20. Production, Services, Inputs, Outputs and Maintenance  
21. Settlement Stage Ladder and Capability Expectations  
22. Required, Optional, Conditional and Strategic Project Pools  
23. Autonomous Project Selection and Planning  
24. Player Blueprints, Permissions and Existing-Town Integration  
25. Districts, Complexes, Megaprojects and Wonders  
26. World Generation, Ruins and Non-Settlement Structure Use  
27. Persistence, Simulation LOD and Multiplayer Authority  
28. Validation, Diagnostics and Forge Test Laboratory  
29. Content Production Lifecycle and Revision Governance  
30. Universal Category Index and Companion Ownership  
31. Revised POC and Vertical-Slice Scope  
32. Godot/Summer Engine Implementation Direction  
33. Balancing Principles and Scope Controls  
34. Staged Revision and Implementation Plan  
35. Open Questions and Deferred Decisions  
Appendix A. Universal Definition Field Template  
Appendix B. Blueprint Contract and Source Reference Template  
Appendix C. Construction Project Record Template  
Appendix D. Persistent Structure Instance Template  
Appendix E. Shared Semantic Registry Catalogue  
Appendix F. Lifecycle and State Precedence Matrix  
Appendix G. POC Acceptance Matrix  
Appendix H. Naming, Folder and Package Conventions  
Glossary

# 1. Locked System Identity

The Buildings, Facilities, Construction and Settlement Project System is the gameplay-side authority for structures that contribute to civilisation. It defines what a home, road, market, workshop, tower, warehouse, ward, district, hospital, portal or wonder means to the living world. It does not author the final voxel layout and it does not own the individual save-state instance.

> **Locked Rule**  
> A finished shell is not automatically a functioning building. A function activates only when the resolved structure contains the required semantic elements and the runtime instance passes its current people, resource, access, permission, network, condition and safety requirements.

## 1.1 Design Promise

A player should be able to see why a structure exists, what it provides, what it needs, who uses it, what is blocking it and what changed after an upgrade, raid or repair. The same rules must apply to official blueprints, culture variants, world-generated settlements and validated player designs.

## 1.2 Identity Layers

| **Layer** | **Meaning** | **Example** |
|---|---|---|
| **Universal Function** | Stable gameplay capability independent of visual style. | `building.residential.small_cottage` |
| **Official Blueprint Source** | Editable voxel and semantic structure authored in Blueprint Forge. | `blueprint.leyforge.riverward.small_cottage_a` |
| **Pack Resolution** | Culture, biome, faction, realm and history layers resolve material roles and permitted modules. | Riverward + temperate forest + Regional March overlay |
| **Construction Project** | Time-bounded plan to build, repair, convert, upgrade or restore at a site. | Cottage project on parcel A-12 |
| **Structure Instance** | Persistent saved world object with ownership, occupancy, condition and local deltas. | `structure_instance:<ULID>` |
| **Service Record** | Current calculated contribution and blockers exposed to settlement simulation. | Housing capacity 4; one bed invalid after roof damage |

## 1.3 What This System Is Not

- It is not a monolithic catalogue containing every culture-specific voxel design.
- It is not the Blueprint Forge editor itself.
- It is not the player-facing Blueprint Workshop.
- It is not a city-zone system that creates abstract population or services.
- It is not unrestricted voxel pasting that bypasses resources, terrain, ownership or navigation.
- It is not a full structural-engineering simulator.
- It does not make all buildings mandatory in every settlement.
- It does not require daily manual assignment of beds, workers, patrols, deliveries or recipes.

# 2. Locked Decision Summary

| **Area** | **Locked Decision** |
|---|---|
| **Document Split** | Keep one master Document 20 plus 20A-20H companion documents. |
| **Function Count** | Retain exactly 120 universal functional definitions in Version 0.2 unless formal change control approves a replacement or expansion. |
| **Need Model** | Retain seven top-level needs only. |
| **Blueprint Authority** | Blueprint Forge owns official editable source; Document 20 owns functional meaning; Document 19 owns restricted player authoring and settlement growth. |
| **Voxel Source** | Official structures remain voxel-first and non-destructively editable. |
| **Registry Authority** | Gameplay references stable IDs and registries, never fragile scene or file paths. |
| **Resource Authority** | Project Recipes and inventories conserve exact stock. |
| **Construction** | Projects use visible stages, reservations, labour and activation gates. |
| **Markers** | Shared semantic role, marker, zone and socket registries replace document-specific ad hoc names. |
| **Materials** | Semantic material roles resolve through pack layers; visuals do not alter function unless a declared module does. |
| **Upgrades** | Prefer parent-child inheritance and deltas over duplicated full blueprints. |
| **Dynamic States** | Damage, occupation, corruption, repair and restoration are instance/state deltas, not duplicate universal definitions. |
| **Planner** | Settlements choose from required, optional, conditional and strategic pools using readable scoring and constraints. |
| **NPC Agency** | Routine occupancy, staffing, hauling, maintenance and project work are NPC-managed. |
| **Player Freedom** | Player designs are accepted when functional, safe, permitted and compatible; aesthetic conformity is not a universal blocker. |
| **Worldgen** | World structures and settlements may use the same source blueprint format with separate placement profiles. |
| **Simulation LOD** | Detailed nearby and bounded distant simulation share conserved authoritative state. |
| **Multiplayer** | Server/host owns gameplay contracts, world placement and authoritative transactions. |
| **Production Tracking** | Document 20H records design, source, semantic, stage, state, bake, gameplay, test and pack-coverage maturity. |
| **POC Scope** | Split the protected 30-entry roster into Core Infrastructure Proof, Raid Extension and Extended Forest Hamlet content. |

# 3. Document Suite and Source-of-Truth Architecture

## 3.1 Document Ownership

| **Document** | **Authoritative Responsibility** | **Does Not Own** |
|---|---|---|
| **19** | Settlement growth, parcels, districts, player proposals, player-founded settlements and restricted player blueprint experiences. | Universal function definitions or unrestricted developer Forge authority. |
| **20** | Shared building/function schemas, seven needs, project rules, activation, runtime states, planner contracts and suite governance. | Complete detailed catalogue entries or final voxel source. |
| **20A-20F** | Detailed universal functional families and plans. | Culture-specific duplication or developer UI. |
| **20G** | Culture, faction, biome, realm, history and player-style pack composition. | Universal capability creation without a declared functional definition. |
| **20H** | Numbering, IDs, stages, ownership, scope and production status for 120 universal definitions. | Detailed family mechanics or blueprint layouts. |
| **22I** | Official Blueprint Forge source, semantic layers, modules, stages, states, inheritance, placement and preview. | Settlement need formulas or player-facing permissions. |
| **22K** | Godot Resources, editor services, baking, caches, registry integration, migrations, CI and runtime assembly. | Design balance or final content choices. |

## 3.2 Source-of-Truth Precedence

When two files appear to conflict, use the following precedence:

1. **Stable registry identity and catalogue ownership:** Document 20H.
2. **Shared functional contract and cross-suite rules:** Document 20.
3. **Detailed family rules:** owning companion 20A-20F.
4. **Culture/biome/faction/realm composition:** Document 20G.
5. **Official editable source structure:** approved Blueprint Forge asset.
6. **Placed-world truth:** authoritative structure-instance and voxel-world records.
7. **Player-facing presentation:** UI view models derived from the above.

An approved Blueprint Forge asset cannot silently redefine a universal function. If the source contains an extra service, that service must reference an approved module or additional universal definition. Likewise, a document cannot claim a door or workstation exists in a specific blueprint unless the approved source contains it.

## 3.3 Supersession Notes

- The previous statement that Document 19 decides official building shape and construction stages is superseded. Document 19 decides player-facing creation and settlement use; official developer source belongs to Blueprint Forge.
- Unreal-specific implementation details in Document 18 are superseded where they conflict with Godot/Summer documents 21F and 22K.
- `culture_kit.*` and `style_kit.*` are superseded as registry namespaces by the `pack.*` families defined in 20G, while legacy aliases remain migration inputs.
- The 30-entry POC roster remains valid as a vertical-slice target but is no longer one indivisible first engineering milestone.

# 4. Core Record Separation and Data Flow

## 4.1 Canonical Flow

```text
Universal Function Definition
        ↓ declares required capability and validation profile
Blueprint Forge Source
        ↓ resolves voxel composition, markers, stages, modules and states
Approved Blueprint Package
        ↓ selected by planner, player, worldgen or developer scenario
Construction / Placement Project
        ↓ consumes resources and labour or worldgen authority
Persistent Structure Instance
        ↓ calculates active services and world consequences
Settlement, Quest, AI, Network and UI Systems
```

## 4.2 Definition Versus Blueprint Versus Instance

| **Question** | **Definition** | **Blueprint Source** | **Project** | **Instance** |
|---|---|---|---|---|
| What does it mean? | Yes | References meaning | References goal | Stores active meaning |
| What blocks/assets form it? | No | Yes | Resolves stage deltas | Stores placed result/deltas |
| What materials are required? | Profiles/tags | Exact resolved counts | Reservations/consumption | Repair/maintenance state |
| Who is building it? | Labour profile | Work positions | Assigned workers | Builder history only |
| Who owns/uses it? | Allowed model | Default roles | Intended ownership | Current authoritative ownership |
| Is it damaged? | Damage contract | Damage groups/deltas | Repair goal | Current damage state |
| Is it operational? | Activation contract | Required semantic source | Commissioning checks | Current operational state |

## 4.3 Data Flow Rules

- Definitions are versioned and normally immutable during a running save except through controlled migration.
- Blueprint source is editable in Forge and produces revisioned approved packages.
- Projects snapshot or lock required source revisions where deterministic construction matters.
- Instances store stable IDs, revision references and local deltas rather than copying all definition data.
- Runtime products are regenerable from approved source and tool versions.
- UI never becomes the source of truth for project costs, capacity or state.

# 5. Universal Taxonomy and Registry Units

## 5.1 Registry Unit Types

| **Unit** | **Purpose** | **Namespace Example** |
|---|---|---|
| **Building Definition** | Occupied, service, production, storage, civic, magical or utility structure. | `building.crafting.village_blacksmith` |
| **Project Definition** | Modular construction that may not be an occupied building. | `project.defence.palisade_segment` |
| **Plan Definition** | Cluster, district, campus, complex, nexus or settlement arrangement. | `plan.district.residential` |
| **Module Definition** | Reusable declared functional subassembly. | `module.storage.secure_armoury` |
| **Blueprint Asset** | Approved voxel source satisfying one or more contracts. | `blueprint.leyforge.riverward.blacksmith_a` |
| **Pack Definition** | Culture, faction, biome, realm, government, faith or dynamic-state layer. | `pack.culture.riverward_frontier` |
| **Project Record** | Saved active construction/repair/upgrade task. | `construction_project:<ULID>` |
| **Structure Instance** | Saved placed structure. | `structure_instance:<ULID>` |

## 5.2 Universal Category Families

- Temporary and residential.
- Farming, food and livestock.
- Health, welfare, culture and hospitality.
- Extraction and raw processing.
- Crafting and artisan production.
- Trade, education and professional services.
- Governance, justice and administration.
- Safety, defence and emergency services.
- Storage, roads, transport, water and sanitation.
- Magic, ritual and dimensional infrastructure.
- Automation, power and advanced industry.
- Districts, complexes, megaprojects and wonders.

## 5.3 Function-Distinction Test

A new universal definition is justified only when it introduces at least one of the following that cannot be represented by a profile, module, upgrade or variant:

- A distinct service or production contract.
- A new planner behaviour or settlement-stage expectation.
- A new network role or required source binding.
- A distinct staffing, ownership or public-access model.
- A materially different risk, law or emergency model.
- A unique construction or maintenance consequence.
- A bounded civilisation or world-state effect.

A new roof, facade, colour, cultural motif, ordinary capacity increase, mirrored layout, biome material substitution or damage appearance does not pass this test by itself.

# 6. Stable IDs, Namespaces and Versioning

## 6.1 Canonical Namespaces

```text
building.<domain>.<name>
project.<domain>.<name>
plan.<kind>.<name>
module.<domain>.<name>
blueprint.<namespace>.<family>.<variant>
pack.<type>.<name>
marker.<domain>.<name>
zone.<domain>.<name>
socket.<network_or_role>.<name>
material_role.<domain>.<name>
construction_project:<ULID>
structure_instance:<ULID>
```

## 6.2 ID Rules

- IDs are lowercase ASCII with underscores inside segments.
- IDs describe stable function, not temporary visual appearance.
- Display names and localisation keys may change without changing stable IDs.
- Renames use migration aliases; old IDs are never silently reused for different content.
- Internal Blueprint Forge elements use stable local IDs so deltas survive reordering.
- Runtime instance IDs are globally unique and never derived only from position.
- Content-pack namespaces prevent collisions between official, player and mod content.

## 6.3 Version Fields

Each definition and blueprint package should record:

- `schema_version`
- `content_version`
- `contract_version`
- `source_revision`
- `minimum_game_version`
- `maximum_tested_game_version`
- `dependency_lock_hash`
- `migration_aliases`

A cosmetic source revision that leaves gameplay contracts unchanged may remain save-compatible. A contract revision that changes capacity, required markers or network semantics requires explicit migration or compatibility handling.

# 7. Seven Main Settlement Needs

The seven needs remain the only normal top-level settlement-health categories.

| **Need** | **Question Answered** | **Typical Building Contributions** | **Common Drill-Down Causes** |
|---|---|---|---|
| **Housing** | Can residents live somewhere safe and suitable? | Tents, huts, cottages, apartments, emergency shelters. | Beds, households, climate, privacy compatibility, damage, access, overcrowding. |
| **Provisions** | Can the settlement sustain food, water access, fuel and essential reserves? | Farms, kitchens, granaries, wells, fisheries, preservation. | Yield, reserve days, water reliability, fuel, spoilage, season, distribution. |
| **Health** | Can illness, injury, contamination and recovery be managed? | Healer huts, clinics, sanitation, quarantine, cleansing. | Staff, medicine, treatment capacity, clean water, outbreak load, emergency routes. |
| **Work** | Do residents have suitable productive roles, tools and training? | Extraction, workshops, markets, schools, industry, magic services. | Open jobs, skill gaps, tools, inputs, outputs, route burden, succession. |
| **Safety** | Can threats, crime, disaster and structural hazards be detected and managed? | Guard posts, towers, walls, gates, shelters, wards, emergency services. | Warning, readiness, breaches, patrol coverage, law, refuge, fire and disaster. |
| **Infrastructure** | Can people, goods, water, power, mana and services circulate reliably? | Roads, storage, bridges, utilities, logistics, civic records, networks. | Capacity, connectivity, condition, bottlenecks, permissions, maintenance. |
| **Morale** | Do residents have stability, trust, identity and hope? | Halls, shrines, inns, festivals, memorials, fair governance, wonders. | Recent outcomes, belonging, justice, overcrowding, culture access, fear, unfinished projects. |

## 7.1 Anti-Bloat Rule

The following do not become additional main need bars in Version 0.2:

- Water, sanitation, fuel or clothing.
- Employment, education, wealth or productivity.
- Governance, justice, diplomacy or taxation.
- Power, mana, research, automation or corruption.
- Culture, faith, prestige, beauty or entertainment.
- Transport, storage, traffic or district density.

They remain inspectable causes, services, capacities, policies, risks or progression values beneath the seven-needs model.

# 8. Demand, Capacity, Coverage and Status Calculation

## 8.1 Shared Calculation Pattern

Each service follows a common pattern:

```text
Raw Capacity
× Blueprint Validity
× Access and Coverage
× Staffing and Skill
× Input and Utility Availability
× Condition and Safety
× Permissions and Ownership
= Effective Capacity

Effective Capacity compared with Stage-Aware Demand
= Service Status and Planner Pressure
```

Not every factor applies to every structure. A road segment may not require staffing; a cottage may not require ongoing inputs; a portal requires several specialised factors.

## 8.2 Readable Status Bands

| **Band** | **Meaning** | **Default Player Interpretation** |
|---|---|---|
| **Thriving** | Capacity, resilience and reserve are comfortably above demand. | Expansion is safe; optional projects may be considered. |
| **Stable** | Current demand is met with ordinary reserve. | No urgent action. |
| **Strained** | Service functions but has little spare capacity or a growing weakness. | Investigate causes before growth or crisis. |
| **Critical** | Demand exceeds safe capacity or a key dependency is failing. | Planner prioritises repair, relief, import or emergency response. |
| **Collapsed** | Service is unavailable or consequences are active. | Residents adapt, flee, become injured or create crisis events according to system. |
| **Not Expected** | The capability is not required at the current stage, biome, culture or world setting. | No penalty. |

## 8.3 Coverage

Coverage may be based on:

- Reachable route cost rather than straight-line distance.
- Capacity shared across several consumers.
- District or settlement priority.
- Public/private permissions.
- Time windows and schedules.
- Warning or response time.
- Network throughput and weakest-link capacity.
- Realm, biome, hazard or culture compatibility.

The normal UI shows the most useful cause first, such as **No connected route**, **Two beds invalid after roof damage**, **Output buffer full**, **Ward reserve low**, or **No eligible healer**.

# 9. Shared Semantic Layer, Marker, Zone and Socket Contracts

Blueprint Forge may display many editable layers, but all gameplay-facing semantics resolve through shared registries.

## 9.1 Common Marker Families

```text
marker.entrance.*
marker.delivery.*
marker.household.*
marker.job.*
marker.guard.*
marker.social.*
marker.interaction.*
marker.storage.*
marker.repair.*
marker.construction.*
marker.worldgen.*
marker.creature.*
marker.quest.*
```

## 9.2 Common Zone Families

```text
zone.room.*
zone.work.*
zone.public.*
zone.private.*
zone.storage.*
zone.hazard.*
zone.guard.*
zone.refuge.*
zone.construction.*
zone.worldgen.*
zone.navigation.*
```

## 9.3 Common Socket Families

```text
socket.route.*
socket.storage.*
socket.item_logistics.*
socket.fluid.*
socket.mechanical_power.*
socket.thermal_power.*
socket.electrical_power.*
socket.mana.*
socket.ward.*
socket.portal.*
socket.module.*
socket.upgrade.*
```

## 9.4 Semantic Contract Rules

- Markers are typed, versioned and assigned stable internal IDs.
- Markers do not create capacity without the functional definition that interprets them.
- Zones may overlap only when declared compatible.
- Network sockets declare type, direction, capacity, ownership and connection rules.
- Entrance and navigation markers must be compatible with expected entity envelopes.
- A mixed-use structure must separate incompatible public, private and hazard routes.
- Missing optional semantics produce warnings; missing required semantics block approval or activation.
- Companion documents define family-specific profiles by referencing this common catalogue rather than inventing unrelated names.

# 10. Material Roles, Packs and Visual Resolution

## 10.1 Semantic Material Roles

Blueprints should reference roles where materials may vary:

```text
material_role.foundation.primary
material_role.foundation.wet
material_role.wall.primary
material_role.wall.secondary
material_role.structure.beam
material_role.floor.public
material_role.floor.private
material_role.roof.primary
material_role.roof.heavy
material_role.opening.public
material_role.trim.civic
material_role.defence.wall
material_role.road.local
material_role.storage.secure
material_role.magic.conduit
material_role.damage.patch
```

Exact role catalogues are maintained through Blueprint Forge and pack registries.

## 10.2 Resolution Order

1. Universal definition requirements.
2. Blueprint-authored defaults.
3. Primary culture pack.
4. Regional or subculture pack.
5. Biome and climate adaptation.
6. Faction, government, faith or economy overlay.
7. Realm adaptation.
8. History, occupation, corruption, repair or restoration state.
9. Approved settlement/player style override.
10. Deterministic age, weathering and decorative seed.

## 10.3 Functional Safety

A material substitution cannot violate declared support, fire, heat, pressure, water, corruption, containment, portal or accessibility requirements. When no valid material can resolve a required role, construction remains blocked with an exact diagnostic.

## 10.4 Pack Authority

The canonical namespaces are:

- `pack.foundation.*`
- `pack.culture.*`
- `pack.region.*`
- `pack.faction.*`
- `pack.government.*`
- `pack.faith.*`
- `pack.economy.*`
- `pack.biome.*`
- `pack.realm.*`
- `pack.overlay.*`
- `pack.hybrid.*`

Legacy `culture_kit.*` and `style_kit.*` references migrate into these families.

# 11. Blueprint Forge Source and Runtime Bake Boundaries

## 11.1 Official Editable Source

An approved Blueprint Forge source package may contain:

- Voxel block and shape placements.
- Forge-authored props, machines and functional assets.
- Nested modules and reusable sub-blueprints.
- Material roles and default palettes.
- Semantic markers, zones, sockets and network graphs.
- Construction stage membership and builder access.
- Upgrade inheritance and deltas.
- Damage, occupation, corruption and restoration deltas.
- Terrain and world-placement profiles.
- Icon and preview capture profiles.
- Dependencies, revision history, lifecycle and validation records.

## 11.2 Derived Runtime Products

Godot runtime products may include:

- Compressed voxel placement data.
- Chunk insertion manifests.
- Merged or batched meshes for non-editing views.
- Collision and interaction proxies.
- Navigation geometry and connectivity caches.
- Marker and socket lookup tables.
- Stage and state delta manifests.
- Material-resolution tables.
- World-placement acceleration data.
- Distant LOD meshes and summary profiles.
- Thumbnails, map icons and project-board images.

## 11.3 Boundary Rules

- Derived products may be deleted and regenerated without losing source.
- Gameplay systems resolve stable registry IDs rather than raw file paths.
- A bake failure never overwrites the last approved working package.
- Blueprint Forge lifecycle approval is separate from universal definition approval.
- Visual source edits cannot change gameplay contract fields without a recorded contract revision.
- The voxel world remains authoritative for placed block state where full voxel instances are loaded.

# 12. Construction Projects, Stage Graphs and Resource Conservation

## 12.1 Shared Construction Stage Vocabulary

The canonical stage vocabulary is:

1. Planning and approval.
2. Survey, site preparation and access.
3. Foundations, supports or anchors.
4. Primary structure or frame.
5. Enclosure, roof and weatherproofing.
6. Functional installation and networks.
7. Furnishing, equipment and finishing.
8. Inspection, commissioning and handover.
9. Complete and operational.

Small projects may merge stages. Specialist projects may insert stages such as **Excavation**, **Span Placement**, **Pressure Test**, **Attunement**, **Containment**, **Ward Tuning** or **Public Opening**.

## 12.2 Stage Graph Rules

- Stages may be linear or a directed acyclic graph.
- Each stage contains exact additions, removals, substitutions and semantic changes.
- Each stage references authoritative Project Recipes or generated resource requirements.
- Stage prerequisites may include earlier stages, permits, roads, utilities, specialist presence or world-state gates.
- Stages may activate limited explicit functions before full completion.
- Builder access and delivery markers must remain reachable for the work being performed.
- Cancellation releases unconsumed reservations and preserves already placed work.

## 12.3 Resource Trust

Construction uses authoritative transactions:

```text
Available Stock
→ Reserved to Project and Stage
→ Claimed by Delivery or Builder Task
→ Consumed by Successful Voxel/Asset Placement
→ Recorded in Contribution and History Ledger
```

No stage may duplicate stock through save/load, distance transitions, cancellation, blueprint rebase or multiplayer retries.

## 12.4 Project Types

- New construction.
- Network extension.
- Upgrade or expansion.
- Repair.
- Restoration.
- Conversion or adaptive reuse.
- Relocation where supported.
- Demolition and salvage.
- Emergency temporary works.
- Megaproject subproject.

# 13. Shared Runtime Lifecycle and Operational State Model

## 13.1 Primary Lifecycle

| **State** | **Meaning** |
|---|---|
| **Proposed** | Candidate exists but lacks approval or site. |
| **Planned** | Approved definition, blueprint and site are selected. |
| **Reserved** | Site and required stock for the next stage are reserved. |
| **Under Construction** | Physical work is active. |
| **Commissioning** | Structure is complete enough to validate function, staff, access and networks. |
| **Operational** | Minimum activation contract passes. |
| **Strained** | Operational but near a limit or with non-critical degradation. |
| **Paused** | Safe temporary stop due to staff, input, output, permission or schedule. |
| **Damaged** | Some physical or semantic function is reduced. |
| **Unsafe** | Hazard exceeds allowed operation or occupancy. |
| **Disabled** | Critical requirement is absent. |
| **Contested** | Ownership, authority or access is disputed. |
| **Abandoned** | No valid maintained use remains. |
| **Ruined** | Critical structure/function is destroyed. |
| **Under Repair** | Repair project is active. |
| **Under Conversion** | Function or ownership is being changed. |
| **Restored** | A previous damaged/ruined state has returned to a valid use. |

## 13.2 Secondary Operational States

Companion systems may add overlays such as:

- Waiting Input.
- Output Blocked.
- Understaffed.
- Overloaded.
- Contaminated.
- Corrupted.
- Breached.
- Alert.
- Engaged.
- Quarantined.
- Emergency Shutdown.
- Captured.
- Dormant.

Primary lifecycle and secondary operational state are stored separately where practical. A structure may be **Operational + Alert**, **Damaged + Output Blocked**, or **Contested + Under Repair**.

## 13.3 State Precedence

Safety-critical states override ordinary production. Ownership disputes override public access. Ruined state prevents normal activation. Emergency and quest logic may temporarily override ordinary schedules but must record authority and duration.

# 14. Activation Contracts and Partial Functionality

## 14.1 Activation Profile

Every universal function declares:

- Required semantic markers/zones/sockets.
- Minimum valid physical envelope or component profile.
- Required access and navigation.
- Minimum and target staffing.
- Required tools, equipment or inventories.
- Required inputs, fuel, water, power or mana.
- Output capacity and destination requirements.
- Ownership and permission conditions.
- Safety, hazard and containment limits.
- Required linked services or world bindings.
- Partial-function rules.

## 14.2 Partial Functionality

A structure can retain safe independent functions when another function fails. Examples:

- A blacksmith residence remains housing while the forge is out of fuel, if mixed-use safety remains valid.
- A warehouse retains undamaged storage zones after one roof section collapses.
- A town gate still creates a physical barrier if no guards are assigned, but it provides no staffed inspection service.
- A clinic can provide basic treatment while a specialist wing is unfinished.
- A ward tower can remain a lookout after mana depletion while magical protection is inactive.

Partial functionality must be explicit; systems do not infer arbitrary bonuses from remaining geometry.

## 14.3 Commissioning

Commissioning validates the resolved built result rather than trusting source metadata. It checks placed blocks/assets, reachable markers, networks, current ownership and required supplies. Commissioning may create an exact punch list instead of treating the whole structure as mysteriously invalid.

# 15. Upgrade Inheritance, Conversion and Replacement

## 15.1 Upgrade Models

- In-place child blueprint using deltas.
- Attached expansion module.
- Vertical extension.
- Parcel replacement.
- Capacity module installation.
- Network or utility upgrade.
- Cultural renovation.
- Functional conversion.
- Settlement-stage branch.

## 15.2 Delta Types

An upgrade may store:

- Added voxel cells/assets.
- Removed cells/assets.
- Material-role substitutions.
- Moved or replaced markers.
- Added network nodes or sockets.
- Changed zones and capacities.
- New construction stages.
- Changed damage groups.
- Migration of occupants, inventories and jobs.

## 15.3 Upgrade Safety

Before approval, the system verifies:

- Existing instance compatibility with expected parent revision.
- Temporary housing/service continuity.
- Inventory relocation and ownership.
- Builder access and staged stability.
- Route, utility and network capacity.
- Heritage or legal restrictions.
- Multiplayer authority and conflict state.

## 15.4 Replacement Versus New Definition

A visually larger or more ornate structure remains the same universal definition when it only raises capacity or quality. It becomes a separate universal definition only when it introduces a distinct functional model, planner role, network role or stage expectation.

# 16. Damage, Repair, Occupation, Corruption and Restoration

## 16.1 Damage Groups

Blueprint source may define semantic damage groups such as:

- Foundation/support.
- Structure/frame.
- Roof/weatherproofing.
- Entrance/access.
- Public room.
- Private/household room.
- Workstation/production.
- Storage.
- Network/control.
- Defence/perimeter.
- Magical/containment.
- Landmark/heritage.

Damage affects only capacities linked to the damaged group where possible.

## 16.2 State Deltas

Dynamic states should use deterministic deltas rather than complete duplicate blueprints:

- Destroyed or replaced cells.
- Rubble and debris placements.
- Disabled markers and sockets.
- Blocked routes.
- Changed ownership/access.
- Fire, contamination or corruption zones.
- Temporary repair scaffolds.
- Occupation banners and command markers.
- Restoration additions.

## 16.3 Repair

Repair projects:

- Identify damaged groups and lost capacities.
- Resolve exact materials from the current blueprint and substitutions.
- Reserve stock and assign labour.
- Preserve compatible repairs already completed.
- Recommission only affected functions where possible.
- Record contributor and event history.

## 16.4 Occupation and Conquest

Occupation may change:

- Owner and governing authority.
- Public/private/restricted access.
- Guards, banners and patrol markers.
- Storage permissions and tribute flows.
- Available services and laws.
- Resistance, sabotage and restoration projects.

Occupation does not silently transfer every private inventory or erase origin culture and build history.

## 16.5 Corruption and Restoration

Corruption may modify material roles, hazards, creature attraction, mana networks, access and service validity. Cleansing or restoration should reveal and preserve historical layers instead of replacing the structure with an unrelated pristine copy.

# 17. Parcels, Terrain, Foundations, Access and Placement

## 17.1 Parcel Record

A parcel may store:

- Stable parcel ID.
- Bounds and build volume.
- Allowed/preferred roles.
- Ownership, lease and easement.
- Frontage and route sockets.
- Terrain, slope and water profile.
- Utility prerequisites.
- Heritage/protection status.
- Height, underground and expansion limits.
- Current blueprint and runtime instance.

## 17.2 Terrain Adaptation Modes

- Flat placement.
- Leveled pad.
- Stepped foundation.
- Stilts/piles.
- Retaining wall.
- Carved into terrain.
- Bridged/span.
- Floating/anchored.
- Underground/cavern.
- Underwater/sealed.
- Reject site.

## 17.3 Placement Validation

Validation considers:

- Support and foundation rules.
- Collision and overlap.
- Entrances and route access.
- Water, flood, weather and biome hazards.
- World resources and protected areas.
- Future upgrade clearance.
- Network connections.
- Sightlines, defence and evacuation where relevant.
- Construction access and delivery.
- Legal, faction and player permissions.

A design may be valid as source but invalid at a specific site. Site diagnostics must distinguish source errors from placement conflicts.

# 18. Roads, Utilities, Storage, Logistics, Power and Mana Networks

## 18.1 Network Principle

Networks are explicit typed graphs. Visual adjacency may help authoring but does not replace validated endpoints and connection rules.

## 18.2 Common Network Contract

Every endpoint declares:

- Stable endpoint ID.
- Network type and subtype.
- Input/output/bidirectional direction.
- Capacity and rate.
- Accepted resources or energy.
- Ownership and permissions.
- Connection geometry/clearance.
- Failure and shutdown behaviour.
- Cross-chunk and distant-simulation behaviour.

## 18.3 Weakest-Link Rule

Effective service is normally limited by the weakest required connection. A warehouse with large storage but no loading route has low delivery throughput. A cistern with no distribution point provides reserve but limited public access. A mana battery with a broken conduit cannot power a ward.

## 18.4 Resource Conservation

Items, fluids, fuel, power and mana are not interchangeable abstractions. Each system uses its own authoritative quantities and transaction rules. Conversion devices declare efficiency, capacity, by-products and risk.

## 18.5 Building-Level Integration

Universal definitions declare required endpoint profiles. Blueprint Forge determines where valid endpoints exist. Construction creates them physically. Runtime network services connect and simulate them.

# 19. Residents, Households, Jobs, Staffing and Entity Compatibility

## 19.1 Entity Compatibility

Blueprints must declare intended entity envelopes and movement requirements:

- Standard humanoid.
- Small humanoid.
- Large humanoid.
- Wheelchair or mobility-aid-compatible route where supported.
- Quadruped/mount.
- Pack animal/cart.
- Flying/perching creature.
- Large creature or boss arena.

Doors, stairs, ladders, work positions, beds, guard posts and delivery areas are validated against expected users.

## 19.2 Households

Housing definitions may require:

- Permanent or temporary bed markers.
- Household grouping and privacy compatibility.
- Climate-safe enclosure.
- Reachable entrance and evacuation route.
- Storage or cooking links where required by profile.
- Ownership/assignment permissions.

Buildings provide capacity; NPC Village systems own household identity and assignment.

## 19.3 Jobs and Staffing

Each service may define:

- Minimum staffing.
- Target staffing.
- Maximum useful positions.
- Required profession/skill tags.
- Optional apprentice/support roles.
- Tools and equipment.
- Work schedules or emergency availability.
- Succession and training dependencies.

A building does not create a skilled worker. It creates valid job capacity and may contribute training opportunities.

## 19.4 Marker Authority

Entity Forge and Blueprint Forge share semantic interaction contracts. The building system consumes those contracts but does not own skeletons, animation or detailed AI behaviour.

# 20. Production, Services, Inputs, Outputs and Maintenance

## 20.1 Operational Contract

A producing or service building commonly requires:

```text
Valid Site
+ Reachable Staff
+ Required Tools/Equipment
+ Authorised Inputs
+ Output or Service Capacity
+ Required Utilities
+ Safe Condition
= Operational Function
```

## 20.2 Inputs and Outputs

- Input and output inventories contain real items.
- Recipes own exact transformations.
- Buildings own station availability, throughput modifiers, buffers and safety.
- Output blocking pauses safely after declared buffers fill.
- By-products are conserved where gameplay-relevant.
- Quality exists only where meaningful and should not create per-item bloat for ordinary materials.

## 20.3 Maintenance

Maintenance profiles may include:

- Routine inspection interval.
- Tools and replacement parts.
- Staff role.
- Access markers.
- Condition thresholds.
- Preventive maintenance benefits.
- Failure consequences.
- Distant-summary behaviour.

Maintenance should create strategic upkeep and repair work, not constant low-value chores.

## 20.4 Service Buildings

Non-producing buildings such as halls, guard posts, clinics and schools still require clear capacity, staffing, access, schedules, inventory or event contracts. They do not generate passive universal bonuses merely by existing.

# 21. Settlement Stage Ladder and Capability Expectations

| **Stage** | **Identity** | **Typical Capability Expectations** |
|---|---|---|
| **Camp** | Temporary survival and project staging. | Shelter, camp centre, supply staging and basic paths. |
| **Hamlet** | First permanent households and local production. | Permanent housing, food, water, storage, basic extraction and shared cooking. |
| **Village** | Stable local services and governance. | Protected reserves, workshops, basic health, civic authority, trade, education and defence. |
| **Fortified Village** | Village prepared for recurring threat or isolation. | Perimeter, warning, guards, refuge, repair and larger reserves. |
| **Town** | Dense specialised settlement with regional links. | Stronger utilities, trade, industry, professional services and administration. |
| **City** | District-scale settlement with complex services. | Campuses, transit, large health/civic systems, resilient utilities and advanced production. |
| **Capital** | Regional authority and civilisation coordination. | Major governance, strategic defence, diplomacy, high-volume logistics and culture institutions. |
| **Magical Metropolis** | Realm-connected, highly advanced civilisation centre. | Magitech, portals, regional mana/power, realm adaptation and world-shaping projects. |

## 21.1 Stage Rules

- Stages are capability profiles, not automatic visual swaps.
- A settlement advances when required capabilities, population, resilience and story/world conditions pass.
- Advancement unlocks eligible pools but does not force one architectural form.
- Settlements may temporarily fall below expected capacity without instantly losing identity.
- Culture, biome and faction can substitute valid equivalents.
- Player-founded and NPC settlements use the same capability language.

# 22. Required, Optional, Conditional and Strategic Project Pools

| **Pool** | **Meaning** | **Examples** |
|---|---|---|
| **Required** | Needed to satisfy a current stage capability or critical shortage. | Housing, water, reserve storage, key access. |
| **Optional** | Valuable but not universally required. | Inn, festival ground, specialist workshop. |
| **Conditional** | Eligible only when a site, resource, threat, culture, crisis or story condition exists. | Fishery, mine, quarantine, portal, customs office. |
| **Upgrade** | Improves or transforms existing capacity. | Cottage expansion, road paving, clinic wing. |
| **Repair/Recovery** | Restores damaged or lost capability. | Wall repair, well cleansing, bridge rebuild. |
| **Strategic** | Supports long-term policy, defence, trade or regional influence. | Fort, transit nexus, academy, ward core. |
| **Signature** | Culture/faction/realm identity project with bounded function. | Moot hall, rune hold, spirit grove. |
| **Megaproject** | Multi-subproject civilisation goal. | Wonder, floating district, realm gate. |
| **Player Proposal** | Validated player design submitted under current permissions. | Custom cottage, bridge, market or town plan. |

Required means a capability is required, not that one exact blueprint must be built.

# 23. Autonomous Project Selection and Planning

## 23.1 Planner Pipeline

1. Measure needs, services, capacity, reserves, risks and stage expectations.
2. Identify shortages, opportunities, damage, blocked routes and story obligations.
3. Generate eligible project candidates from universal definitions, plans, packs and approved blueprints.
4. Filter by site, terrain, law, ownership, knowledge, resources, specialists, routes, utilities and dependencies.
5. Score benefit, urgency, cost, disruption, maintenance, redundancy, culture, danger and future value.
6. Select or defer projects according to policy and authority.
7. Reserve site and next-stage stock.
8. Assign labour and logistics.
9. Re-evaluate after each meaningful stage, incident or capacity change.

## 23.2 Planner Score Categories

- Need/capability urgency.
- Population and migration pressure.
- Resource or terrain opportunity.
- Travel and logistics reduction.
- Threat and emergency pressure.
- Stage and story gates.
- Cost and material availability.
- Staffing and succession feasibility.
- Maintenance burden.
- Disruption and displacement.
- Culture/faction preference.
- Player policy and permissions.
- Redundancy and resilience.
- Future upgrade compatibility.

## 23.3 Anti-Spam Rules

The planner avoids redundant construction through:

- Capacity and coverage checks.
- Existing project awareness.
- Minimum spacing and parcel rules.
- Maintenance-budget limits.
- Diminishing value for duplicate optional services.
- Upgrade/repair preference where cheaper and safer.
- Culture and settlement-plan diversity weights.

# 24. Player Blueprints, Permissions and Existing-Town Integration

## 24.1 Restricted Creator Boundary

Player-facing blueprint creators may expose:

- Voxel and approved prop placement.
- Material roles and permitted palettes.
- Construction stages within safe limits.
- Required gameplay markers for selected definition profiles.
- Terrain and site testing.
- Cost preview.
- Local library, import/export and town-style assembly.

They do not expose unrestricted:

- Universal registry edits.
- Executable scripts.
- Arbitrary migration code.
- Server-authoritative gameplay overrides.
- Hidden dependencies or external file access.
- Developer-only worldgen guarantees.
- Project-wide dependency rewrites.

## 24.2 Submission Workflow

1. Player selects a universal function or compatible plan profile.
2. Creator loads the restricted schema and allowed assets.
3. Player builds and validates the blueprint.
4. The blueprint receives a player namespace, manifest and content hash.
5. Settlement authority checks law, parcel, culture acceptance, cost and current need.
6. Approved proposal enters planner/project pools.
7. NPCs construct it using the same resource and commissioning rules.

## 24.3 Existing Towns

Players may assist, propose, fund, donate, contract, persuade, govern or conquer depending on authority. They do not automatically gain permission to replace occupied homes, heritage sites, public roads, faction property or critical utilities.

# 25. Districts, Complexes, Megaprojects and Wonders

## 25.1 Planning Hierarchy

```text
Building → Parcel → Cluster → District → Campus/Complex → Settlement Plan → Megaproject/Wonder
```

Each layer coordinates functioning lower layers; it does not create abstract capacity by drawing a boundary.

## 25.2 Nested Blueprint and Plan Use

Blueprint Forge nested modules may support:

- Repeated houses or market stalls.
- Wall and tower modules.
- Campus wings.
- Road/utility spines.
- Fort sectors.
- Portal or power subassemblies.
- Wonder subprojects.

Plan records use roles, substitution rules, dependencies and placement ranges rather than requiring one rigid copied city.

## 25.3 Megaproject Rules

- Decompose into independently saved subprojects.
- Require enabling works, logistics and workforce support.
- Permit partial activation only where safe and declared.
- Track contributors, contracts and milestones.
- Create bounded regional/world effects.
- Remain damageable, capturable, maintainable and restorable.
- Never automatically maximise all needs or generate unlimited resources.

# 26. World Generation, Ruins and Non-Settlement Structure Use

The same Blueprint Forge format can author world structures, but the universal settlement registry only applies where a structure provides or can provide a recognised civilisation function.

## 26.1 Worldgen Placement Profiles

May include:

- Biome, region and realm tags.
- Terrain and foundation limits.
- Rotation/mirroring.
- Rarity and spacing.
- Road, river, coast, resource or leyline relationships.
- Settlement/faction ownership.
- Guaranteed progression relationships.
- Loot, encounter and restoration profiles.
- Fallback placement rules.

## 26.2 Ruins and Restoration

A world-generated ruin may:

- Remain a landmark or dungeon only.
- Contain dormant universal functions.
- Be claimed and restored into a settlement service.
- Become a project prerequisite or culture heritage site.
- Preserve origin, occupation and damage history.

The restoration project must validate current site, ownership, source compatibility and required resources rather than simply toggling a ruin flag.

# 27. Persistence, Simulation LOD and Multiplayer Authority

## 27.1 Persistent Instance Minimum

A structure instance should retain:

- Stable instance ID.
- Universal definition IDs.
- Blueprint ID and compatible revision.
- Transform and parcel/site.
- Resolved pack/palette tokens.
- Owner, authority and permissions.
- Occupants, staff and linked jobs by stable references.
- Inventory/network references.
- Construction, upgrade and repair history.
- Damage/state deltas.
- Current service/activation summary.
- Deterministic variant seeds.
- Migration and fallback information.

## 27.2 Simulation LOD

| **Level** | **Representation** |
|---|---|
| **Detailed Local** | Real voxel blocks, actors, inventories, networks, pathing, animations and construction tasks. |
| **Loaded Summary** | Full structure records with reduced actors and event-driven service updates. |
| **Settlement Aggregate** | Conserved stock, capacities, staffing pools, projects, condition and risks. |
| **Regional Abstract** | Stage, population, strategic services, trade, threat, major projects and history. |

Promotion and demotion reconcile through authoritative records. Distance must not duplicate or erase resources, workers, damage or project progress.

## 27.3 Multiplayer Authority

- Host/server validates blueprint packages and content hashes.
- Host/server owns placement, resource transactions, project progress and structure state.
- Cosmetic permitted variants may resolve locally only when they cannot change collision, markers, capacity or gameplay visibility.
- Shared projects preserve contribution ledgers and conflict-safe stage transactions.
- Incompatible required content blocks world join or uses an explicit approved fallback.

# 28. Validation, Diagnostics and Forge Test Laboratory

## 28.1 Validation Layers

1. Schema and identity.
2. Dependency and version.
3. Voxel/source integrity.
4. Semantic marker/zone/socket contracts.
5. Navigation and entity compatibility.
6. Construction stages and resource calculation.
7. Upgrade and state deltas.
8. Terrain and world placement.
9. Network connectivity and capacity.
10. Performance and bake limits.
11. Gameplay activation and settlement integration.
12. Package, save and multiplayer compatibility.

## 28.2 Severity

| **Severity** | **Result** |
|---|---|
| **Error** | Blocks approval, construction or runtime use. |
| **Warning** | May be accepted with recorded justification where policy allows. |
| **Advisory** | Suggests quality, accessibility, readability or performance improvement. |
| **Information** | Reports resolved state, capacity or dependency detail. |

## 28.3 Diagnostic Standard

Every diagnostic should include:

- Stable code.
- Severity.
- Affected element ID.
- Plain-language explanation.
- Why it matters.
- Suggested correction or valid exception path.
- Related definition/contract.

## 28.4 Test Laboratory Scenarios

Blueprint Forge should test structures under controlled scenarios such as:

- NPC entry, sleep, work and evacuation.
- Builder delivery and stage access.
- Warehouse loading and routing.
- Guard patrol, sight and alarm.
- Machine input/output and network loss.
- Fire, damage, breach and repair.
- Biome and material-pack preview matrix.
- Terrain slope, water, road and foundation placement.
- Distant LOD promotion/demotion.
- Save/load and migration.

# 29. Content Production Lifecycle and Revision Governance

## 29.1 Definition Lifecycle

```text
Idea → Draft → Reviewed → Approved → Locked → Deprecated → Legacy
```

## 29.2 Blueprint Production Lifecycle

```text
Not Started
→ Source Blockout
→ Semantic Pass
→ Material Roles Resolved
→ Construction Staged
→ Dynamic States Complete
→ Forge Validated
→ Runtime Baked
→ Gameplay Integrated
→ POC/Scenario Tested
→ Pack Coverage Complete
→ Shippable
```

## 29.3 Change Classes

| **Change** | **Required Review** |
|---|---|
| Display/localisation only | Content review. |
| Visual source with unchanged contract | Forge validation and visual review. |
| Marker, stage or network change | Functional contract and regression review. |
| Capacity, need or planner change | Design/balance review and save-impact analysis. |
| Stable ID or schema change | Migration plan, CI and compatibility review. |
| Catalogue addition/removal | Formal Document 20/20H change-control decision. |

## 29.4 AI-Assisted Changes

Summer Engine may assist with drafting data, validators, migrations, test fixtures and boilerplate. AI-generated changes require:

- Recorded prompt/task intent where practical.
- Diff review.
- Validator and test execution.
- Human approval for stable IDs, schema, migrations, gameplay contracts and destructive changes.

# 30. Universal Category Index and Companion Ownership

| **Catalogue Range** | **Category** | **Owner** |
|---|---|---|
| 1-30 | Temporary, residential, food, health, welfare, culture and hospitality. | 20A, with Hospital Complex in 20F. |
| 31-60 | Extraction, processing, crafting, trade, education and professional services. | 20B, with advanced industry/magic entries in 20E. |
| 61-80 | Governance, justice, administration, defence and emergency services. | 20C, with some major complexes in 20F. |
| 81-90 | Storage, roads, transport, water, sanitation and public utilities. | 20D. |
| 91-110 | Magic, ritual, portals, automation, power and advanced industry. | 20E. |
| 111-120 | Districts, complexes, megaprojects and wonders. | 20F. |
| All | Culture, faction, biome, realm and dynamic overlays. | 20G. |
| All numbered definitions | Stable IDs, stage, scope and production status. | 20H. |

Companion ownership is functional. A culture-specific blacksmith remains owned by 20B and adapted through 20G. A city-scale hospital complex belongs to 20F because its plan and shared services exceed one ordinary building family.

# 31. Revised POC and Vertical-Slice Scope

The existing 30 definitions marked **POC Required** remain the protected Forest Hamlet roster. Version 0.2 divides them into three delivery groups.

## 31.1 Core Infrastructure Proof - 12 Definitions

| **No.** | **Definition** | **Primary Proof** |
|---:|---|---|
| 1 | Campfire Site | Temporary centre, warmth/event marker and first construction state. |
| 2 | Small Tent | Temporary housing and occupant assignment. |
| 3 | Builder Supply Yard | Project stock, reservations and builder staging. |
| 6 | Small Cottage | Player-created housing blueprint, beds, ownership and save/reload. |
| 11 | Basic Farm Plot | Terrain-bound production and seasonal work. |
| 15 | Communal Kitchen | Inputs, fuel/water, batch service and provisions. |
| 31 | Lumber Camp | Real resource-zone binding and hauling. |
| 41 | Carpenter Workshop | Workstations, recipes, tools, buffers and staffing. |
| 82 | Village Warehouse | Shared stock, permissions, project reserves and delivery. |
| 85 | Dirt Path and Road Junction Set | Route graph, access and effective distance. |
| 88 | Village Well or Water Point | Source binding, capacity, access and Health/Provisions dependency. |
| 72 | Wooden Watchtower | Staged strategic structure, guard markers, warning and damage. |

## 31.2 Raid Extension - 4 Definitions

| **No.** | **Definition** | **Primary Proof** |
|---:|---|---|
| 61 | Village Hall | Requests, permissions, project approval and civic records. |
| 71 | Guard Post | Staffing, readiness, response and equipment access. |
| 73 | Palisade Segment | Modular network project, perimeter integrity and repair. |
| 74 | Village Gate | Access control, route integration, breach and state change. |

The Core Infrastructure Proof plus Raid Extension forms the **Technical POC Complete** milestone.

## 31.3 Extended Forest Hamlet Vertical Slice - 14 Additional Definitions

- Primitive Hut.
- Farmhouse.
- Barn.
- Granary.
- Healer Hut.
- Small Shrine or Community Hall.
- Mine Entrance.
- Mason Yard.
- Village Blacksmith.
- Market Stalls.
- Trading Post.
- Small School.
- Small Storehouse.
- Mage Hut or Rune Workshop.

These complete the original 30-entry target and broaden the slice without blocking early architecture validation.

## 31.4 POC Scenario

The integrated scenario is:

1. A player creates or edits a cottage in the restricted Blueprint Workshop.
2. The design validates against the universal cottage contract.
3. A Forest Hamlet approves it through the Village Hall.
4. Materials resolve through the Riverward/forest pack and are reserved in the Warehouse/Supply Yard.
5. NPCs deliver and construct visible stages using connected paths.
6. The finished cottage commissions, houses residents and survives save/load.
7. A watchtower, palisade, gate and guard post alter warning and raid outcomes.
8. Damage creates local capacity loss and repair projects.
9. Distant simulation preserves the same resources, state and history.

# 32. Godot/Summer Engine Implementation Direction

## 32.1 Recommended Runtime Records

Document 22K owns exact class names, but the gameplay architecture requires equivalents of:

- `BuildingDefinitionResource`
- `ProjectDefinitionResource`
- `PlanDefinitionResource`
- `BlueprintSourceResource`
- `BlueprintRuntimeManifest`
- `MaterialRoleRegistry`
- `SemanticMarkerRegistry`
- `ConstructionStageDefinition`
- `ConstructionProjectRecord`
- `StructureInstanceRecord`
- `StructureServiceState`
- `SettlementStageDefinition`
- `PackManifestResource`

## 32.2 Service Boundaries

- Registry resolution service.
- Blueprint package resolver.
- Validation service.
- Construction and reservation service.
- Voxel-world placement service.
- Structure-instance service.
- Settlement service calculator.
- Autonomous planner.
- Network adapter services.
- Save/migration service.
- Forge bake and dependency services.

## 32.3 Implementation Principles

- GDScript first unless profiling justifies GDExtension.
- Resource and service architecture rather than hard-coded scene paths.
- Main-thread Godot scene/voxel changes; heavy data baking may operate on copied immutable data.
- Deterministic seeds and stable IDs.
- Event-driven recalculation rather than scanning every structure every frame.
- Bounded asynchronous work and clear diagnostics.
- Golden-content tests for cottage, warehouse, watchtower, bridge, workshop and camp structures.

# 33. Balancing Principles and Scope Controls

## 33.1 Player-Facing Balance

- Show causes and choices rather than opaque penalties.
- Allow temporary strain without immediate cascade failure.
- Make several valid solutions possible through building, trade, automation, magic, policy or alliances.
- Keep earlier structures useful through local service, upgrades, low maintenance or cultural value.
- Avoid mandatory optimal grids and wall spam.
- Let player creativity vary form while protecting function and safety.
- Make major failures consequences of readable pressure, attack, neglect, risky systems or harsh settings.

## 33.2 Content Scope

- Keep the 120 universal functions stable through POC/Alpha unless a critical gap is proven.
- Expand visual variety through Blueprint Forge, modules and packs.
- Prefer one flexible definition with profiles over several near-duplicates.
- Defer final exact costs, throughput and capacity until representative voxel blueprints exist.
- Do not require all cultures, realms, districts or wonders for POC.
- Reuse shared marker and network registries across documents.

## 33.3 Performance Scope

- Do not make every decorative block a node or independent simulation object.
- Use aggregate inventories and network transactions where appropriate.
- Separate render, navigation, network and simulation LOD.
- Recalculate only affected structures when dependencies change.
- Use baked lookup products while preserving editable source.

# 34. Staged Revision and Implementation Plan

## Stage 0 - Master Alignment

- Approve Document 20 v0.2.
- Approve source-of-truth and namespace rules.
- Register supersession notes for Document 19 and Unreal-specific assumptions.

## Stage 1 - Catalogue Revision

- Revise 20H to v0.2 without changing the 120-definition set.
- Correct stable-ID mismatches and legacy namespace examples.
- Add split POC tiers and Forge-aware production statuses.

## Stage 2 - Functional Companion Revision

- Revise 20A-20E using shared semantic contracts and activation templates.
- Replace outdated Blueprint Designer ownership language.
- Standardise runtime lifecycle and construction stage references.

## Stage 3 - Planning and Pack Revision

- Revise 20F for nested modules, plan graphs and delta-based megaprojects.
- Revise 20G for canonical `pack.*` manifests and Blueprint Forge preview/resolution.

## Stage 4 - Machine-Readable Schemas

- Create Godot Resources/JSON schema mirrors.
- Add registry validators and migration aliases.
- Round-trip representative entries.

## Stage 5 - Technical POC

- Implement Core Infrastructure Proof.
- Implement Raid Extension.
- Validate construction, save/load, damage, repair and LOD reconciliation.

## Stage 6 - Extended Vertical Slice

- Add remaining 14 Forest Hamlet definitions.
- Complete pack coverage and integrated gameplay scenario.

# 35. Open Questions and Deferred Decisions

The following remain deliberately open until prototypes or content production provide evidence:

- Exact capacity and reserve values by difficulty and settlement stage.
- Final material costs for each official blueprint.
- How much structural stability simulation is justified beyond support validation.
- Final route-congestion abstraction for dense cities.
- Exact limits for mixed-use capacity sharing.
- Final maintenance frequency and degradation rates.
- Public sharing, moderation and marketplace policy for player blueprints.
- Final mod scripting boundaries beyond data packs.
- Final realm-specific settlement rules and wonder effects.
- Exact number of official blueprint variants per universal definition.
- Final accessibility requirements for all creature/body envelopes.
- Whether certain advanced networks use continuous quantities or discrete batches.

Deferred decisions must not block stable IDs, contract separation, resource conservation, Forge integration or the Technical POC.

# Appendix A. Universal Definition Field Template

| **Field** | **Purpose** |
|---|---|
| `definition_id` | Stable universal function ID. |
| `display_name_key` | Localised display name. |
| `definition_kind` | Building, project, plan or module. |
| `owner_document` | 20A-20H authority. |
| `contract_version` | Functional-contract revision. |
| `earliest_stage` | First eligible settlement stage. |
| `planner_class` | Required, optional, conditional, strategic, repair, upgrade or player proposal. |
| `primary_need` | Main need contribution. |
| `secondary_needs` | Additional contributions. |
| `capability_tags` | Functional and substitution tags. |
| `activation_profile` | Required markers, access, staff, inputs, networks and safety. |
| `partial_function_profile` | Explicit independently valid functions. |
| `capacity_profile` | Draft capacity and scaling rules. |
| `staffing_profile` | Minimum/target/maximum roles. |
| `input_output_profile` | Inventories, recipes, services and buffers. |
| `network_requirements` | Required and optional socket profiles. |
| `site_requirements` | Terrain, biome, source and parcel rules. |
| `construction_profile` | Stage and Project Recipe references. |
| `upgrade_family` | Parent, child, conversion and module links. |
| `damage_profile` | Damage groups and service effects. |
| `maintenance_profile` | Upkeep and condition rules. |
| `pack_compatibility` | Valid pack and substitution rules. |
| `blueprint_validation_profile` | Required source semantics. |
| `scope_status` | Technical POC, Extended Slice, Alpha, Beta, Final or Deferred. |
| `design_status` | Idea through Locked. |
| `notes` | Human-readable design intent. |

# Appendix B. Blueprint Contract and Source Reference Template

| **Field** | **Purpose** |
|---|---|
| `blueprint_id` | Stable source asset ID. |
| `schema_version` | Blueprint schema revision. |
| `source_revision` | Approved source revision. |
| `satisfied_definitions` | Universal functions and capacities. |
| `parent_blueprint_id` | Inheritance source if any. |
| `nested_modules` | Stable module references and connectors. |
| `bounds` | Editable local bounds and envelopes. |
| `voxel_layers` | Blocks, shapes and state placements. |
| `asset_placements` | Forge props, machines and functional assets. |
| `material_roles` | Semantic role assignments and defaults. |
| `markers_zones_sockets` | Shared semantic elements. |
| `construction_stages` | Stage graph and element membership. |
| `upgrade_deltas` | Add/remove/substitute/marker changes. |
| `state_deltas` | Damage, occupation, corruption and restoration. |
| `placement_profile` | Terrain, anchors, rotation and fallback rules. |
| `capture_profiles` | Icons, maps and project thumbnails. |
| `dependencies` | Locked stable references. |
| `validation_status` | Latest result and tool version. |
| `lifecycle_status` | Source production state. |
| `content_hash` | Package compatibility. |

# Appendix C. Construction Project Record Template

| **Field** | **Purpose** |
|---|---|
| `project_instance_id` | Persistent project ULID. |
| `project_kind` | New, repair, upgrade, conversion, demolition, restoration or network extension. |
| `definition_ids` | Target universal contracts. |
| `blueprint_id/revision` | Locked source package. |
| `site/parcel` | Authoritative location and transform. |
| `owner/authority` | Project sponsor and permissions. |
| `current_stage` | Active stage node. |
| `completed_stages` | Durable progress. |
| `reservations` | Exact item/resource reservations. |
| `delivered_stock` | Stock at site/stage buffers. |
| `assigned_workers` | Named NPCs or bounded labour records. |
| `work_positions` | Reachable active markers. |
| `blockers` | Structured diagnostic codes. |
| `contributors` | Player, settlement, guild and faction ledger. |
| `state` | Planned through Complete/Cancelled/Failed. |
| `history` | Stage, event, damage and decision log. |
| `distant_summary` | Deterministic progress data. |

# Appendix D. Persistent Structure Instance Template

| **Field** | **Purpose** |
|---|---|
| `structure_instance_id` | Persistent ULID. |
| `definition_ids` | Active universal functions. |
| `blueprint_id/revision` | Source identity. |
| `transform` | World placement. |
| `parcel_id` | Planning relationship. |
| `resolved_pack_stack` | Culture, biome, faction, realm and state layers. |
| `variant_seeds` | Deterministic visual/state seeds. |
| `owner/authority/permissions` | Current control and access. |
| `occupants/households` | Stable references. |
| `jobs/staff` | Stable references and assignments. |
| `inventories/networks` | Connected runtime records. |
| `condition` | Damage groups and maintenance. |
| `primary_lifecycle` | Operational, damaged, abandoned and so on. |
| `secondary_states` | Alert, blocked, contaminated and so on. |
| `service_snapshot` | Effective capacities and blockers. |
| `local_deltas` | Player edits, damage, repair, occupation and upgrades. |
| `history` | Build, ownership, event and restoration record. |
| `migration_state` | Compatibility and fallback details. |

# Appendix E. Shared Semantic Registry Catalogue

## E.1 Marker Examples

| **Family** | **Examples** |
|---|---|
| Entrances | Public, private, service, emergency, creature, vehicle. |
| Household | Bed, household anchor, cooking, personal storage, gathering. |
| Jobs | Primary work, support work, instructor, apprentice, operator, maintenance. |
| Delivery | Drop-off, loading, unloading, builder stock, emergency supply. |
| Guard | Guard post, patrol, rally, alarm, ranged position, gate control. |
| Social | Gathering, ceremony, audience, vendor, patient, learner. |
| Construction | Builder stand, scaffold anchor, stage access, inspection. |
| Worldgen | Origin, road link, water link, settlement link, encounter anchor. |

## E.2 Zone Examples

| **Family** | **Examples** |
|---|---|
| Rooms | Habitable, treatment, classroom, storage, secure, ritual. |
| Work | Clean, dirty, hot, mechanical, public service, animal. |
| Access | Public, private, restricted, emergency, maintenance. |
| Hazard | Fire, collapse, pressure, contamination, corruption, portal. |
| Defence | Perimeter, sight, refuge, breach, firing lane. |
| Construction | Work boundary, exclusion, delivery, crane/clearance. |

## E.3 Socket Examples

| **Family** | **Examples** |
|---|---|
| Routes | Footpath, service, cart, freight, emergency, water, rail. |
| Storage | Public input, project reserve, output, secure, waste. |
| Energy | Mechanical, thermal, electrical-like, mana, leyline. |
| Fluids | Water, wastewater, cooling, steam or profile-specific fluid. |
| Magic | Ward, ritual, portal, cleansing, containment. |
| Modules | Wall segment, tower, room wing, bridge span, utility spine. |

# Appendix F. Lifecycle and State Precedence Matrix

| **Higher Priority** | **Overrides or Constrains** | **Reason** |
|---|---|---|
| Ruined | Normal operation, occupancy and production | Critical physical function destroyed. |
| Unsafe/Breached | Production and public access | Protects entities and world state. |
| Contested/Captured | Ownership permissions and ordinary policy | Authority unresolved or changed. |
| Emergency Shutdown | Active recipe/network operation | Prevents escalating failure. |
| Under Construction/Conversion | Only explicitly partial functions | Structure is incomplete or changing. |
| Damaged/Strained | Capacity and safety margins | Some function remains. |
| Paused/Input Starved/Output Blocked | Current production/service cycle | Temporary operational blocker. |
| Operational | Normal function | All minimum requirements pass. |

# Appendix G. POC Acceptance Matrix

| **Area** | **Acceptance Result** |
|---|---|
| Registry | All 16 Technical POC definitions resolve through stable IDs and correct owners. |
| Blueprint Source | Cottage, warehouse, watchtower, palisade/gate and key infrastructure are authored in Blueprint Forge. |
| Player Creator | Cottage can be created or modified through the restricted player workflow. |
| Validation | Invalid entrances, beds, work positions, delivery routes, stage access and sockets report exact diagnostics. |
| Materials | Culture/biome roles resolve deterministically and produce exact project stock. |
| Construction | NPCs reserve, deliver and visibly build stages without duplication. |
| Commissioning | Completed structures activate only after runtime checks. |
| Settlement Effect | Housing, provisions, work, infrastructure and safety respond to functioning structures. |
| Raid | Warning, guards, palisade and gate materially alter the outcome. |
| Damage/Repair | Damage disables linked capacity and creates exact repair work. |
| Persistence | Project and structure state survives save/load. |
| LOD | Nearby/distant transitions preserve stock, workers, damage and progress. |
| Multiplayer Foundation | Host authority rejects incompatible gameplay packages and duplicate transactions. |
| Diagnostics | Errors and warnings are stable, readable and actionable. |

# Appendix H. Naming, Folder and Package Conventions

```text
res://forge/source/blueprints/<namespace>/<family>/
res://forge/source/packs/<type>/<name>/
res://forge/source/definitions/buildings/
res://forge/source/definitions/projects/
res://forge/source/definitions/plans/
res://forge/generated/blueprints/<content_hash>/
res://game/registries/settlement/
res://game/runtime/structures/
res://game/runtime/construction/
res://tests/golden/blueprints/
res://tests/scenarios/settlement/
```

Recommended file identity follows the stable ID where filesystem rules permit. Generated products are separated from canonical source and are safe to regenerate.

# Glossary

| **Term** | **Meaning** |
|---|---|
| **Activation Contract** | Requirements that must currently pass before a function contributes capacity or service. |
| **Blueprint Forge Source** | Editable voxel and semantic developer source for a reusable structure. |
| **Commissioning** | Runtime validation and handover after construction or major change. |
| **Construction Project** | Persistent record that turns a blueprint or delta into placed world change through resources and labour. |
| **Effective Capacity** | Current usable service after access, staffing, inputs, condition and permissions. |
| **Material Role** | Semantic construction/material purpose resolved through packs and available resources. |
| **Pack Stack** | Ordered culture, biome, faction, realm and state layers used to resolve presentation and bounded alternatives. |
| **Partial Functionality** | Explicit independent service that remains valid while another part of a structure fails or is incomplete. |
| **Semantic Marker** | Typed point or transform interpreted by gameplay systems. |
| **Semantic Zone** | Typed volume representing rooms, access, work, hazards or other spatial meaning. |
| **Socket** | Typed connection point for routes, modules, logistics, utilities, power, mana or other networks. |
| **Structure Instance** | Persistent placed-world record derived from a definition and blueprint package. |
| **Universal Definition** | Stable visual-style-independent settlement capability. |

---

**End of Document 20 v0.2**
