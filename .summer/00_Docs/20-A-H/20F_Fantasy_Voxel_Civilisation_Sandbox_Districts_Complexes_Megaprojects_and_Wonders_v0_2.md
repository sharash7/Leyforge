# Fantasy Voxel Civilisation Sandbox

## 20F - Districts, Complexes, Megaprojects and Wonders

### Detailed Settlement Composition Registry, Blueprint Forge Plan Architecture and Civilisation-Scale Project Rules

**Version 0.2 - Unified Forge and Runtime Integration Revision**

*A controlled registry for parcels, clusters, districts, campuses, strategic complexes, regional nexuses, megaprojects and wonders. Version 0.2 preserves real buildings, resources, NPCs and voxel construction while integrating official Blueprint Forge plan authoring, nested source graphs, deterministic Godot/Summer Engine baking and scalable settlement simulation.*

| **Field** | **Locked Direction** |
|---|---|
| Document Scope | Detailed rules and registry entries for catalogue definitions 23, 59, 63, 69, 78 and 111-120 from Document 20H v0.2, plus shared parcel, cluster, district, campus, complex, nexus, megaproject and wonder contracts. |
| Needs Lock | Housing, Provisions, Health, Work, Safety, Infrastructure and Morale remain the only main settlement needs. Density, prestige, education, administration, transit, defence coverage, project momentum and wonder influence remain capacities and causes. |
| Core Philosophy | Plans coordinate real structures, networks, services, people and construction phases. A boundary, colour, label or giant decorative model creates no beds, jobs, safety, production, power, mana or prestige by itself. |
| Planning Ladder | Building -> Parcel -> Cluster -> District -> Campus/Complex -> Settlement Plan -> Megaproject/Wonder. Each layer coordinates the layer below while preserving ownership, access, physical state and exact resources. |
| Official Authoring | Blueprint Forge owns editable official voxel and plan sources, nested modules, semantic layers, parcel roles, route/utility spines, phase graphs, terrain rules, dynamic states, dependencies, validation and runtime bake inputs. |
| Player Creator | Document 19 exposes restricted compatible building, cluster and settlement-plan authoring. Player content may satisfy approved roles but cannot change universal definitions, registry IDs, world-state effects, migrations, server authority or protected content. |
| NPC Growth | Settlement planners select and phase 20F projects using real needs, density, travel, services, terrain, infrastructure, threat, specialists, law, culture, resources, logistics, maintenance, disruption and expansion space. |
| Construction | Complexes and megaprojects are graphs of independently saved subprojects. Enabling works, roads, utilities, supply yards, workforce support, partial activation, commissioning, damage and restoration remain visible. |
| Simulation | Nearby districts use real voxel structures, routes, utilities, residents and construction. Distant simulation preserves parcels, capacities, resources, subproject progress, maintenance, risk, ownership and history through bounded summaries. |
| Delivery Scope | 20F adds no full Technical POC Core, Raid Extension or Extended Forest Hamlet catalogue definition. Reduced plan-validation fixtures reuse the existing hamlet; the first full post-POC Alpha targets are Farmstead Cluster and Market Square and Civic Centre. |
| Engine Direction | Godot/Summer Engine runtime records and bake products are deterministic derivatives of approved Forge source and registry data. Generated scenes, graphs, coverage maps and caches are disposable, rebuildable runtime products. |

> **Locked Scope Rule**
>
> Districts, complexes and wonders coordinate functioning lower-level content; they do not replace it. A residential district has no Housing without valid homes, a hospital campus has no treatment without health facilities, a citadel has no defence without staffed and supplied structures, and a wonder has no maintained effect without completed, authorised and functioning subprojects.

## Revision 0.2 Summary

Version 0.2 is an integration and clarification revision rather than a redesign of the approved city-scale planning vision. It preserves all 15 universal definitions owned by 20F while connecting them to Documents 20 v0.2, 20H v0.2, Blueprint Forge and the Godot/Summer Engine runtime.

Key changes are:

- Official developer plan, complex, district, megaproject and wonder authoring is assigned to 22I Blueprint Forge.
- Universal function definitions, editable Forge sources, runtime bake products, construction projects and persistent placed records are explicitly separated.
- Parcel roles, route and utility spines, nested modules, project dependencies, phase graphs and dynamic states receive shared semantic contracts.
- Clusters and districts remain adaptive plans that select and coordinate real blueprints rather than SimCity-style zones that spawn abstract capacity.
- Complexes and campuses use nested blueprints and shared-service accounting without double-counting component buildings.
- Megaprojects and wonders become graphs of independently saved, damageable, occupiable and restorable subprojects with bounded maintained effects.
- Blueprint inheritance and deltas support expansions, branches, culture/biome resolution, damage, occupation, corruption and restoration without duplicating whole sources.
- Terrain adaptation, site selection, world-generation placement and regional anchors align with Blueprint Forge placement contracts.
- Player-facing creators remain restricted compatible layers rather than unrestricted project-wide developer tools.
- The delivery plan is corrected: 20F contributes no full technical or Forest Hamlet definition; its first complete production targets begin in post-POC Alpha.
- Godot/Summer Engine resource boundaries, deterministic baking, persistence, simulation LOD, multiplayer authority and validation diagnostics are made explicit.

# Document Purpose

Document 20F defines how Leyforge moves from individual buildings to coherent farmsteads, neighbourhoods, industrial quarters, campuses, citadels, regional transport hubs, capitals, floating districts and civilisation-defining wonders. It gives NPC settlements, developers and authorised player creators a shared planning language for grouping real sources, reserving land, connecting roads and utilities, sequencing construction, sharing services, adapting to terrain and preserving local identity.

The document separates plan intent from art and runtime state. 20F defines what a Farmstead Cluster, Residential District, Hospital Campus, Citadel, Ward Core or Wonder must coordinate and how it contributes to settlement simulation. Blueprint Forge owns the official editable voxel and semantic source. The deterministic bake produces runtime placement and network products. Construction projects consume real resources and labour. Persistent plan and structure records own live occupancy, service, condition, ownership, damage and history.

Leyforge should support impressive civilisation growth without becoming a conventional top-down city builder where a coloured zone creates buildings or where players must optimise traffic percentages every minute. Every district remains a collection of voxel structures, parcels, paths, NPCs, inventories, utilities and events. The player shapes goals, styles and major layouts while residents handle routine occupancy, work, maintenance and local adaptation.

# Design Sources and Dependencies

| **Source** | **20F Dependency** |
|---|---|
| 00 - Master Game Design Bible | Civilisation growth, player freedom, city-scale escalation, floating cities and world-shaping projects. |
| 01 - Core Gameplay Loop | Build, interact, automate, defend, upgrade and expand must remain connected through visible world response. |
| 02 - Player Progression | Settlement leadership, city scale, regional influence, portals, golems, wonders and world-shaping progression. |
| 03-06 - Blocks, Items, Recipes and Resources | Voxel construction, semantic components, exact project stock, material roles, strategic resources, commissioning and repairs. |
| 07 - NPC Village System | Population, jobs, homes, warehouses, projects, governance, migration, raids, persistent history and simulation LOD. |
| 08-09 - Automation and Magic | High-volume supply, power, mana, wards, portals, golems, floating infrastructure, risks and civilisation-scale networks. |
| 10-11 - Creatures, Biomes and World Generation | Threats, sieges, terrain, climate, water, resources, leylines, settlement sites, verticality and regional links. |
| 12 - Structures | Persistent structure identity, dynamic state, damage, restoration, world placement, ownership and runtime evidence. |
| 13-14 - Cultures, Factions and Dimensions | Governance, architecture, district preferences, realm rules, politics, signature complexes and wonders. |
| 15-17 - Events, Combat and UI/UX | Major projects, sabotage, ceremonies, siege, evacuation, overlays, project graphs, permissions and readable causes. |
| 18 - Technical Implementation Plan | Superseded where engine-specific by 20 v0.2, 21F and 22K; stable IDs, saves, bounded processing and diagnostics remain relevant. |
| 19 - Settlement Growth and Restricted Player Voxel Blueprint System | Player settlement planning, parcel proposals, restricted compatible creators, NPC construction and settlement governance. |
| 20 / 20H v0.2 | Shared lifecycle, semantic contracts, stable catalogue IDs, stage mapping, delivery scope, production states and change control. |
| 20A-20E | Lower-level housing, health, work, trade, governance, defence, storage, roads, utilities, power, mana and automation functions. |
| 20G | Culture, faction, biome, realm and history packs that resolve materials, layouts, substitutions and signature content. |
| 21A-21G | Asset Forge sources, material roles, variants, overrides, icons, lifecycle and visual migration. |
| 22A-22H | Entity Forge bodies, animation, equipment, AI markers, navigation and simulation LOD for plan users and workers. |
| 22I | Blueprint Forge official building, structure, plan, construction-stage, state and world-placement authoring. |
| 22J | Unified Forge workflow, project manifest, dependency graph, validation, revision history, testing and packaging. |
| 22K | Godot/Summer Engine implementation, schema, deterministic bake, persistence, migration and multiplayer authority. |
| 22L | Entity and Blueprint visual production and migration sequencing. |

# Static Table of Contents

- 1. Locked 20F Identity
- 2. Scope Boundaries and Anti-Micromanagement Rules
- 3. Source-of-Truth and Record Separation
- 4. Seven-Needs Integration
- 5. Planning Scales and Ownership Hierarchy
- 6. Shared Plan, Parcel, Phase and Runtime Data Model
- 7. Blueprint Forge Plan and Complex Authoring Model
- 8. Nested Sources, Modules, Inheritance and Substitution
- 9. Parcels, Density, Mixed Use and Substitution Rules
- 10. Roads, Utilities, Service Coverage and Effective Distance
- 11. Project Pools, Dependencies, Phases and Partial Activation
- 12. Campuses, Complexes, Mixed Ownership and Public Access
- 13. Megaproject Lifecycle, Contracts, Workforce and Disruption
- 14. Wonders, Regional Effects and World-State Consequences
- 15. Site Selection, Terrain Adaptation and World Placement
- 16. Damage, Occupation, Abandonment, Restoration and Transformation
- 17. NPC Planner and Project Selection
- 18. Restricted Player Plan and Source Validation
- 19. Construction, Upgrade, Conversion and Replacement
- 20. Runtime Lifecycle, Persistence and Simulation LOD
- 21. Godot/Summer Engine Implementation Architecture
- 22. Settlement-Stage Expectations
- 23. Detailed Registry Summary
- 24. Civic, Health, Education and Defence Complex Entries
- 25. Cluster, District, Campus and Nexus Entries
- 26. Megaproject and Wonder Entries
- 27. Post-POC Alpha Implementation Scope
- 28. Balancing, Performance and Simulation LOD
- 29. Validation and Diagnostic Code Catalogue
- 30. Open Questions for Later Balancing
- Appendix A. 20F Functional and Plan Field Template
- Appendix B. Plan-Kind and Capability Matrix
- Appendix C. Post-POC Alpha Acceptance Checklist
- Appendix D. Cross-System Dependency Matrix
- Appendix E. Suggested Godot Resources and Runtime Records

# 1. Locked 20F Identity

20F is the settlement-composition and civilisation-scale project layer of the universal building registry. It does not own ordinary cottages, workshops, roads, machines or wards. It owns the reusable plans, large institutions and civilisation projects that arrange those definitions into coherent places, coordinate shared services and guide multi-stage growth.

> **Locked Rule**
>
> A cluster, district, campus, complex, nexus, megaproject or wonder provides only the completed and functioning services of its component structures plus explicitly authored coordination or regional effects. Plan boundaries, prestige labels, decorative scale and unfinished shells provide no hidden capacity.

| **Identity Layer** | **Design Meaning** | **Player-Facing Result** |
|---|---|---|
| Adaptive composition | Plans define roles, sockets, constraints and ranges rather than one rigid pasted layout. | The same farmstead or district can fit different terrain, cultures and player styles. |
| Real lower-level content | Homes, workplaces, roads, utilities and defences remain actual sources and runtime instances. | City growth stays voxel-based, inspectable and damageable. |
| Phased civilisation growth | Large projects split into enabling works, buildings, networks, tests and commissioning. | Players watch towns become cities rather than seeing instant stage swaps. |
| Shared services | Campuses and districts coordinate access, utilities, stores, logistics and emergency coverage. | Scale creates bounded efficiencies without abstract free production. |
| Political and social scale | Authority, land, contracts, laws, culture and public access shape major projects. | Capitals and wonders create stories, factions and consequences. |
| Persistent world memory | Complexes can be damaged, occupied, abandoned, restored, corrupted or repurposed. | The world visibly remembers wars, disasters and civilisations. |
| Scalable simulation | Nearby sites remain physical while distant plans use conserved aggregates and project records. | Cities, capitals and multiple realms remain technically feasible. |

# 2. Scope Boundaries and Anti-Micromanagement Rules

- The seven needs remain the only top-level needs. District prestige, education, administration, transit, density, culture, power, mana and project momentum remain drill-down information.

- A district template is not a zone that automatically spawns buildings. It reserves and scores parcels, then selects actual approved blueprints through settlement projects.

- A cluster can be organic, irregular, mixed-use, low-density, vertical, underground or culture-specific. The system must not assume a modern rectangular street grid.

- Players do not manually assign every household, shop, classroom, hospital bed, cart route or guard shift. NPC schedules and settlement policies handle routine use.

- The district planner uses service coverage and effective travel, but the UI shows causes such as **No nearby water**, **Freight route blocked**, **Housing far from work**, or **Emergency access weak**, not a wall of optimisation percentages.

- Plans may contain required roles, optional roles and substitution rules. A culture can satisfy a town centre through a moot, temple court, market grove or clan hall rather than one fixed city hall.

- Complexes and campuses coordinate real buildings. They may share utilities, grounds, stores and staff support, but they do not duplicate the component buildings' outputs.

- Megaproject costs are split across manageable subprojects and supply contracts. The player is not expected to hand-mine every block of a capital wonder.

- Major projects can create temporary disruption, worker demand, traffic and political conflict, but routine daily construction administration remains automated.

- Wonders have bounded, authored effects. No wonder permanently maxes all needs, prevents all threats, creates unlimited resources or replaces normal infrastructure.

- Distant city simulation does not pathfind every resident or move every block. It preserves population, inventory, capacities, parcels, projects, routes, risks and history.

- Player plans may be visually unconventional. Validation protects function, safety, access, phasing, resource conservation and save stability rather than enforcing a developer aesthetic.

| **Explicit Non-Goals** |
|---|
| 20F does not require SimCity-style automatic zoning, manual traffic-light design, individual rent markets, mandatory grid streets, a district happiness bar, abstract service buildings with no interiors, instant city upgrades, unlimited global wonder buffs or continuous simulation of every distant resident. |

# 3. Source-of-Truth and Record Separation

| **Layer** | **Authority** | **20F Example** |
|---|---|---|
| Universal function or plan definition | Documents 20/20H and this companion | What a Hospital Complex, Farmstead Cluster, Citadel or Wonder must coordinate. |
| Official editable source | Blueprint Forge | Voxel modules, parcel roles, semantic layers, route/utility spines, phase graph, state deltas and placement rules. |
| Runtime bake product | Deterministic Forge bake | Parcel graph, placement candidates, service links, subproject graph, coverage, navigation and validation tables. |
| Construction project graph | Settlement runtime | Resources, labour, contracts, stages, blockers, subprojects, commissioning and contributors. |
| Persistent plan/complex instance | World save | Parcels, component instances, occupancy, shared services, ownership, condition, damage, history and active effects. |
| Restricted player source | Document 19 compatible creator | Approved building, cluster or settlement-plan source using permitted roles and trusted registries. |

## 3.1 Separation Rules

- A universal definition describes capability, requirements and planner meaning; it does not contain one finished city layout.
- Blueprint Forge source stores editable voxel and semantic intent; it does not own live residents, inventories, project stock, laws or world-state effects.
- Runtime bake products are disposable and reproducible from approved source, registry and pack versions.
- A construction project graph owns real resource reservations, labour, contracts, dependencies and stage progress.
- Persistent plan and structure records own live occupancy, staff, services, networks, condition, damage, ownership and history.
- Player-authored plans cannot change universal catalogue IDs, effect profiles, required service rules, migration aliases, protected sites or server authority.

## 3.2 Canonical Flow

```text
20F Function or Plan Definition
        -> Blueprint Forge Source Graph
        -> Deterministic Plan / Placement / Network Bake
        -> Settlement Project and Subproject Graph
        -> Persistent Structures, Parcels and Plan Instance
        -> Shared Services, Coordination and Bounded Effects
        -> Needs, Planner, Events, Quests, UI and World History
```

# 4. Seven-Needs Integration

| **Need** | **20F Contribution** | **Typical Failure Causes** |
|---|---|---|
| Housing | Residential districts and floating/vertical plans coordinate actual homes, local services, routes and utilities. | Empty parcels, insufficient beds, weak utilities, unsafe access, overcrowding or jobs too distant. |
| Provisions | Farmstead clusters, logistics nexuses and city planning connect food production, storage and distribution. | No water, storage, route, workforce, land or distribution capacity. |
| Health | Hospital complexes/campuses, sanitation, emergency routes and district planning increase treatment access. | Staff shortage, contaminated utilities, blocked emergency route, no medicine or unsafe industry. |
| Work | Universities, artisan districts, logistics hubs, civic complexes and megaprojects create real jobs and training. | No workplaces, specialists, inputs, freight, power, permissions or housing access. |
| Safety | Forts, citadels, ward networks, refuges, patrol routes and resilient utilities coordinate defence. | Coverage gaps, empty stores, unstaffed gates, no evacuation, broken relay or siege damage. |
| Infrastructure | Roads, utilities, civic coordination, campuses, transit and megaproject networks directly contribute. | Weak enabling works, overloaded services, disconnected districts, maintenance or incomplete phases. |
| Morale | Public centres, campuses, capital authority, culture identity, ceremonies and wonders support belonging and confidence. | Exclusion, unfinished prestige project, exploitation, repeated disruption, occupation or cultural rejection. |

# 5. Planning Scales and Ownership Hierarchy

| **Scale** | **What It Owns** | **What It Does Not Own** | **Example** |
|---|---|---|---|
| Building | One structure's rooms, markers, service and runtime state. | Neighbouring parcels or city road hierarchy. | Cottage, clinic, blacksmith. |
| Parcel | One buildable site, frontage, access, terrain and allowed roles. | A functioning service by itself. | Corner shop parcel, farm plot. |
| Cluster | Several parcels/buildings with shared yard, access or purpose. | Town-wide service policy. | Farmstead, market square. |
| District | Many parcels, road hierarchy, utilities, service targets and expansion. | Abstract beds/jobs or automatic buildings. | Residential quarter, artisan district. |
| Campus / Complex | One large institution or strategic group with shared grounds and support. | Unrelated city services outside its boundary. | Hospital campus, fort, civic complex. |
| Nexus | Several transport, logistics or network modes coordinated at one regional hub. | Teleporting stock between disconnected inventories. | Regional transit nexus. |
| Settlement Plan | City-wide centres, districts, perimeter, expansion and project pools. | Predetermined placement of every future building. | River town plan, mountain capital. |
| Megaproject | A graph of major subprojects, contracts, networks and commissioning. | Instant service from one blueprint placement. | City ward core, floating district. |
| Wonder | Unique culture/world project with bounded regional effects and history. | Unlimited or universal need satisfaction. | Leyline Crown, World Tree. |

## 5.1 Ownership Rules

- Individual buildings retain their own owner, staff, inventory and permissions even when inside a cluster or district.

- Public roads and utilities can cross private, guild, faction or household parcels through easements and laws.

- A campus may contain public, restricted, residential and service zones.

- Megaproject subprojects can have different sponsors and contribution ledgers while sharing one master project record.

- Conquest, annexation or faction change can transfer plan authority without silently transferring every private inventory.

- Player-founded settlements receive broader planning authority, but NPC rights, faction law and multiplayer ownership remain explicit.

# 6. Shared Plan, Parcel, Phase and Runtime Data Model

## 6.1 Definition Layers

| **Definition** | **Purpose** |
|---|---|
| ParcelRoleDefinition | Describes an allowed/required site role, size range, frontage, access, service and substitution tags. |
| ClusterPlanDefinition | Coordinates a small set of related parcels, shared space and project order. |
| DistrictTemplateDefinition | Defines parcel pools, density, route hierarchy, service targets, incompatibilities and expansion. |
| CampusComplexDefinition | Defines an anchor institution or strategic complex with support roles, shared utilities and access. |
| NexusPlanDefinition | Coordinates multiple network/transport modes, buffers and transfer rules. |
| MegaprojectDefinition | Defines subproject graph, milestones, contracts, workforce, commissioning, effects, risks and world-state gates. |
| WonderEffectProfile | Defines bounded maintained effects, influence area, stacking, politics, damage and restoration. |
| RuntimePlanRecord | Stores placed boundary, parcels, components, services, phases, owner, history, damage and current blockers. |
| RuntimeMegaprojectRecord | Stores subprojects, resources, contracts, contributors, milestones, activation, incidents and world effects. |

## 6.2 Common Capacity Direction

| **Capability** | **Calculation Direction** | **Player-Facing Example** |
|---|---|---|
| Parcel occupancy | Valid completed building footprint and access within an approved parcel role. | 18/24 residential parcels occupied. |
| Service coverage | Real source capacity distributed through valid distance/routes/utilities to consumers. | West quarter clinic access: Strained. |
| District functionality | Component capacity x access/utilities/staffing/condition, aggregated without duplication. | Artisan district output blocked by freight road. |
| Coordination benefit | Explicit bounded reduction in travel, shared-service cost or response time. | Shared warehouse reduces haul time by 18%. |
| Project progress | Completed weighted subprojects and commissioning gates, not visual shell percentage alone. | Ward Core: 7/11 critical subprojects operational. |
| Wonder influence | Authored effect x completion x maintenance x ownership x world state within bounded area. | Leyline stability improved in 3 linked regions. |
| Disruption | Construction traffic, land use, noise/hazard, workforce draw and service closures, reduced by planning and mitigation. | Civic plaza route closed for 2 build stages. |

# 7. Blueprint Forge Plan and Complex Authoring Model

Blueprint Forge is the official developer environment for authoring 20F content. It combines voxel building sources with plan-level semantic data so a district or megaproject can be inspected, tested, migrated and baked as one dependency graph without collapsing its component buildings into a single monolith.

## 7.1 Plan Source Layers

| **Layer** | **Purpose** | **Examples** |
|---|---|---|
| Boundary and reservation | Defines the authored plan envelope and adaptable expansion space. | Cluster boundary, campus grounds, district corridor, wonder exclusion zone. |
| Parcel roles | Declares required, optional and conditional sites. | Housing, public hall, workshop, clinic, storage, utility, culture, defence. |
| Anchor sources | References official building or structure blueprints. | City Hall, Hospital, Keep, Ward Core, portal station. |
| Route spine | Defines entrances, primary roads, service access, emergency and freight hierarchy. | Public street, cart loop, patrol route, evacuation corridor. |
| Utility spine | Defines required capacities and connection points without inventing service. | Water, sanitation, power, mana, logistics, signal and waste. |
| Shared-space layers | Defines plazas, yards, courts, gardens, parade areas and ceremonial approaches. | Market square, hospital courtyard, university quad, wonder avenue. |
| Phase and dependency graph | Orders surveys, enabling works, subprojects, commissioning and partial activation. | Utilities before occupancy; core ward before district relays. |
| Dynamic states | Defines authored deltas for damage, occupation, corruption, restoration and events. | Breached citadel sector, occupied civic centre, festival market state. |
| Placement and adaptation | Defines terrain, climate, orientation, foundation and world-generation constraints. | River frontage, slope terraces, floating anchors, leyline alignment. |

## 7.2 Semantic Plan Contracts

Canonical plan semantics use stable namespaced identifiers such as:

```text
parcel.role.*
anchor.structure.*
anchor.worldgen.*
route.public.*
route.service.*
route.freight.*
route.emergency.*
route.patrol.*
utility.water.*
utility.sanitation.*
utility.power.*
utility.mana.*
utility.logistics.*
zone.public.*
zone.private.*
zone.secure.*
zone.hazard.*
zone.ceremonial.*
phase.project.*
dependency.hard.*
dependency.soft.*
effect.regional.*
```

Definitions in 20F declare which contracts are required; Blueprint Forge assigns them to source elements; the bake resolves them into compact runtime tables.

## 7.3 Forge Test Laboratory

Every 20F source should support tests for:

- Parcel-role satisfaction and substitution.
- Terrain adaptation across representative slopes, rivers, coast, caves and vertical sites.
- Route continuity for residents, workers, carts, guards, emergency responders and Entity Forge body profiles.
- Utility and logistics weakest links.
- Construction order and partial activation.
- Shared-service allocation without double-counting.
- Damage, breach, occupation, evacuation and restoration.
- Deterministic seeds and stable element references.
- Performance at near, medium and far simulation LOD.
- Capture thumbnails, maps and phase previews from the live Forge source rather than separate artwork.

# 8. Nested Sources, Modules, Inheritance and Substitution

## 8.1 Nested Source Rules

- A complex source references component blueprint sources by stable ID rather than copying their voxel data into the plan.
- A nested module retains its own source version, sockets, construction stages, dynamic states and runtime instance identity.
- Shared grounds, route spines and utility backbones are owned by the plan source and are not duplicated inside every component building.
- The dependency graph records which plan or module must rebake when a child source changes.
- A plan can expose substitution slots so culture packs, biome adaptations or approved player sources can fill compatible roles.

## 8.2 Inheritance Types

| **Inheritance Type** | **Use** | **Example** |
|---|---|---|
| Plan child | Adds or changes roles while retaining a parent plan. | Farmstead Cluster -> irrigated terrace farmstead. |
| Module child | Specialises a reusable nested source. | Hospital wing -> magical cleansing wing. |
| Phase delta | Adds work to an existing commissioned plan. | Market square gains permanent stalls and drainage. |
| Upgrade delta | Expands capacity or introduces a new network role. | Town fort -> city citadel. |
| Culture/biome resolution | Resolves material roles, silhouettes, spacing and adaptation. | Riverward timber market -> desert shade court. |
| Damage/occupation delta | Changes condition, control and access while retaining origin history. | Captured civic centre with barricaded council chamber. |
| Restoration/repurpose delta | Repairs or converts without deleting history. | Ruined university restored as guild campus. |

## 8.3 Substitution and Double-Counting Rules

- A replacement must satisfy the required universal capability tags, markers, routes, capacities, ownership and commissioning profile.
- One component may satisfy multiple compatible roles only when its capacity is explicitly divided and not counted twice.
- Shared utilities and stores are allocated once across all consumers.
- A culture-specific hall may replace a city hall only when governance, public access, records and planning functions remain valid.
- A large decorative landmark cannot satisfy a wonder or civic role without the required operational contracts.
- Player sources may occupy substitution slots only after restricted validation, permission and pack compatibility checks.

# 9. Parcels, Density, Mixed Use and Substitution Rules

## 9.1 Parcel Data

A parcel can record:

- Stable parcel ID and district/cluster membership.
- Allowed and preferred building-role tags.
- Footprint and height ranges.
- Frontage and entrance direction.
- Ground, underground, vertical or floating volume.
- Required route class.
- Utility/service prerequisites.
- Neighbour compatibility and exclusion buffers.
- Ownership, lease, easement and approval.
- Heritage/protected status.
- Terrain adaptation policy.
- Expansion or subdivision potential.
- Occupied blueprint and runtime state.

## 9.2 Density Bands

- Rural or dispersed.
- Low-density.
- Medium-density.
- Dense urban.
- Vertical/stacked.
- Underground/cavern.
- Floating/elevated.

Density changes parcel size, road demand, service expectations and building pools. It does not directly create population.

## 9.3 Mixed Use

Mixed-use blueprints and clusters are encouraged where functionally valid:

- Shop below, residence above.
- Workshop with artisan household.
- Inn with stable and market frontage.
- Civic hall with archive and public square.
- University faculty housing.
- Fort with town gate and customs.
- Farmhouse with food processing and workers.

The validator checks fire, noise, contamination, public/private access, freight and utility conflicts rather than banning mixed use by default.

## 9.4 Substitution Rules

A required role can accept:

- Exact building family.
- Valid upgrade or branch.
- Culture-specific replacement.
- Mixed-use blueprint containing the required service markers.
- Shared district service within acceptable travel/capacity.
- Magical or technological equivalent where progression allows.
- Player-created blueprint approved for the role.

Substitutions cannot double-count one capacity across incompatible roles.

# 10. Roads, Utilities, Service Coverage and Effective Distance

District plans reference the real route and utility systems owned by 20D/20E.

## 10.1 Route Hierarchy

- Regional approach.
- Primary avenue or freight road.
- Secondary street.
- Local lane/path.
- Service/loading route.
- Emergency route.
- Patrol/perimeter route.
- Water, rail, lift, portal or sky route where available.

## 10.2 Coverage Rules

- Straight-line radius is only a fast approximation.
- Final service uses route access, slope, gates, danger, congestion abstraction, utilities and capacity.
- Public services can have district priority or emergency overrides.
- A district may share a service outside its boundary when travel and capacity remain valid.
- Redundancy matters for hospitals, citadels, ward cores, floating anchors and capital utilities.
- A district does not fail because one decorative road is incomplete if a valid alternative route exists.

## 10.3 Player-Facing Causes

Examples:

- **Housing expansion blocked: no water capacity.**
- **Hospital emergency route crosses freight queue.**
- **University has classrooms but no faculty housing.**
- **Northern wall sector has no repair access.**
- **Market crowd capacity exceeds sanitation service.**
- **Floating platform has one anchor below redundancy target.**

# 11. Project Pools, Dependencies, Phases and Partial Activation

## 11.1 Project Pools

Plans expose several candidate pools:

- Required capability projects.
- Optional service projects.
- Conditional terrain/resource projects.
- Upgrade or conversion projects.
- Density and expansion projects.
- Repair/restoration projects.
- Culture/story signature projects.
- Megaproject subprojects.
- Temporary enabling and mitigation projects.

## 11.2 Dependency Types

- Hard prerequisite.
- Soft preference.
- Resource supply.
- Route/access.
- Utility/power/mana.
- Specialist/workforce.
- Governance/permission.
- Culture/faction/story.
- Safety/containment.
- Environmental/terrain.
- Commissioning/test.
- Seasonal/event window.

## 11.3 Phase Vocabulary

1. Concept, survey and consultation.
2. Authority, land and route reservation.
3. Enabling works and supply yards.
4. Foundations, earthworks or anchors.
5. First functioning component.
6. Shared roads, utilities and logistics.
7. Additional buildings/sectors.
8. Safety, redundancy and emergency systems.
9. Public/cultural finish.
10. Testing, commissioning and activation.
11. Expansion, maintenance and transformation.

Small clusters merge phases. Wonders split phases into many independent subprojects.

## 11.4 Partial Activation

- A farmstead can produce after its first field, water and storage function.
- A hospital can treat patients before all specialist wings open.
- A university can teach before every research faculty exists.
- A fort can defend one approach while later walls are built.
- A district can house residents after the first service-complete block.
- A ward core can protect linked districts before full city coverage.
- A floating platform cannot accept residents until support, utilities and evacuation pass commissioning.

# 12. Campuses, Complexes, Mixed Ownership and Public Access

Complex planning must support institutions that contain multiple use types and owners.

## 12.1 Access Zones

- Public.
- Staff.
- Resident/student/patient.
- Service and delivery.
- Restricted.
- Secure command/archive.
- Hazard/containment.
- Emergency-only.
- Ceremonial.
- Maintenance.

## 12.2 Shared Services

Possible shared services include:

- Water and sanitation.
- Power/mana.
- Kitchen and food delivery.
- Storage and loading.
- Staff housing.
- Public transport.
- Records and administration.
- Security.
- Gardens/courtyards.
- Waste and maintenance.
- Emergency response.

Shared service capacity must be divided across consumers and cannot be counted separately for each building.

## 12.3 Continuity

Large complexes should avoid one point of failure where practical:

- Multiple entrances.
- Backup water/power.
- Protected records.
- Alternative command.
- Emergency stores.
- Fire separation.
- Evacuation/refuge.
- Isolatable wings.
- Route redundancy.

# 13. Megaproject Lifecycle, Contracts, Workforce and Disruption

## 13.1 Lifecycle

1. Discovery or civilisation goal.
2. Feasibility study.
3. Political/faction support or conquest authority.
4. Site selection and land claims.
5. Design competition or player plan approval.
6. Supply-chain and contract setup.
7. Worker housing, food, safety and logistics.
8. Enabling infrastructure.
9. Subproject construction.
10. Testing and partial activation.
11. Commissioning event.
12. Operation, maintenance and ceremonies.
13. Damage, capture, corruption, restoration or expansion.

## 13.2 Contracts and Contributions

Megaprojects can accept:

- Settlement budget.
- Player donations or sales.
- Faction contributions.
- Guild contracts.
- Automated supply quotas.
- Trade-route deliveries.
- Quest rewards or story artefacts.
- Specialist pledges.
- Realm material shipments.
- Multiplayer contribution ledgers.

The UI shows promised, delivered, reserved, consumed and missing resources.

## 13.3 Workforce

Large projects may require:

- Builders, masons and carpenters.
- Engineers and architects.
- Logistics and warehouse staff.
- Specialists tied to the project.
- Guards and safety workers.
- Cooks, healers and temporary housing staff.
- Golems or machines where legal and available.
- Visiting faction or culture experts.

Workers remain named or represented by bounded labour pools at distance. The project cannot consume impossible labour without affecting other settlement work.

## 13.4 Disruption and Mitigation

Possible disruption:

- Road closures and freight congestion.
- Noise, dust, pollution or mana interference.
- Temporary worker housing demand.
- Food and tool shortages.
- Land displacement.
- Safety incidents.
- Faction or cultural conflict.
- Reduced maintenance elsewhere.
- Creature or enemy attraction.

Mitigation projects can include bypass roads, temporary markets, worker camps, extra clinics, protective wards, environmental controls and staged closures.

# 14. Wonders, Regional Effects and World-State Consequences

## 14.1 Allowed Effect Families

A wonder may provide a limited selection of:

- Culture identity and Morale.
- Tourism, pilgrimage or trade attraction.
- Research or knowledge access.
- Regional power/mana stability.
- Environmental blessing, cleansing or transformation.
- Defence warning or bounded protection.
- Portal/realm access.
- Production or resource-processing improvement.
- Diplomacy and faction influence.
- Story, ritual or boss progression.
- Settlement migration appeal.
- Unique crafting or construction capability.

## 14.2 Effect Boundaries

Every effect declares:

- Area or linked regions.
- Maximum capacity.
- Required maintenance and staffing.
- Required power/mana/resources.
- Stacking rule.
- Friendly, neutral and hostile interaction.
- Damage and corruption response.
- Ownership and capture.
- World-setting modifiers.
- Save and migration behaviour.

## 14.3 World Memory

A wonder can become:

- Complete and celebrated.
- Incomplete for generations.
- Damaged by disaster.
- Captured or contested.
- Corrupted.
- Dormant.
- Repurposed.
- Cleansed or restored.
- A ruin, dungeon or story anchor.
- A source of refugees, pilgrimage, trade or war.

# 15. Site Selection, Terrain Adaptation and World Placement

20F plans are not pasted onto a perfectly flat map. Blueprint Forge stores adaptation intent, while world generation and the settlement planner resolve actual terrain, ownership, ecology, routes, resources and strategic constraints.

## 15.1 Site Evaluation

| **Factor** | **Examples** | **Planner / Forge Result** |
|---|---|---|
| Terrain and foundations | Slope, soil, bedrock, caves, cliffs, water and floating support. | Accept, terrace, bridge, retain, raise, excavate, anchor or reject. |
| Existing settlement fabric | Homes, roads, heritage, farms, utilities and protected sites. | Fit, reroute, compensate, preserve, relocate or choose another site. |
| Routes and logistics | Regional approach, freight, public, emergency, patrol and construction access. | Required enabling works and phase order. |
| Utilities and sources | Water, sanitation, power, mana, logistics, waste and communication. | Capacity check, upgrades, redundancy and service corridors. |
| Hazard and defence | Flood, fire, pollution, raids, siege, corruption, unstable realms and airspace. | Buffers, barriers, evacuation, containment and risk score. |
| Culture, law and politics | Sacred ground, ownership, jurisdiction, public access, faction claims and consent. | Permission, negotiation, compensation, contest or prohibition. |
| Future expansion | Adjacent parcels, vertical growth, route sockets and maintenance access. | Reserve corridors and optional branches. |

## 15.2 Terrain Adaptation Modes

- Conform to terrain with irregular parcels and paths.
- Terrace and retain slopes.
- Raise on stilts, piers or platforms.
- Bridge or span water and ravines.
- Excavate underground or into cliffs.
- Stack vertically with lifts and service cores.
- Suspend or float with validated anchor/load systems.
- Preserve major terrain and route around it.
- Use authored fallback modules when a preferred component cannot fit.

## 15.3 World-Generation Placement

- World-generated plans use the same approved source, semantic contracts and validation as settlement-built plans.
- Placement may reserve future expansion parcels without instantly constructing them.
- Generated structures receive persistent plan and structure instance IDs on first materialisation.
- Terrain adaptation produces recorded deltas and foundations rather than silently deforming the source asset.
- Ruined, abandoned, occupied or incomplete generation states use authored dynamic deltas and preserved project history.
- A generated wonder or citadel cannot overlap protected resources, portals, settlements or critical routes without an explicit authored relationship.

# 16. Damage, Occupation, Abandonment, Restoration and Transformation

## 16.1 Damage Granularity

- Individual building damage.
- Network segment failure.
- District service outage.
- Subproject damage.
- Landmark/core damage.
- Partial collapse.
- Fire/flood/corruption zones.
- Occupied or hostile parcel.
- Lost records or control.

## 16.2 Occupation and Conquest

- Military occupation can control gates, command, stores and public access without instantly owning every home or shop.
- Civic and wonder effects can change under disputed legitimacy.
- Resistance, fear, tribute, collaboration and sabotage remain faction/social systems.
- A captured portal or grid can be disabled for safety rather than immediately usable.
- Players can conquer, liberate, negotiate or restore according to world rules.

## 16.3 Restoration

Restoration can:

- Reuse surviving blocks and foundations.
- Preserve historical damage.
- Recover archives and blueprints.
- Change owner/culture palette.
- Convert a ruin into a new complex.
- Reconnect utilities and roads.
- Unlock heritage, tourism or story value.
- Require cleansing or containment.
- Split the project into stabilise, repair, restore and reactivate phases.

# 17. NPC Planner and Project Selection

## 17.1 Plan-Level Scoring

A draft plan score can include:

- Settlement-stage requirement.
- Need deficit and trend.
- Population/density pressure.
- Service travel time.
- Parcel and terrain suitability.
- Road/utility capacity.
- Available housing for workers.
- Specialist availability.
- Supply-chain capacity.
- Security and environmental risk.
- Existing partial plan value.
- Maintenance and operating burden.
- Culture/faction preference.
- Player priority or submitted plan.
- Story/world-event weight.
- Future expansion and redundancy.
- Disruption penalty.
- Duplicate capacity penalty.
- Regional opportunity.

## 17.2 Typical Planner Triggers

| **Observed Problem or Opportunity** | **Likely 20F Response** |
|---|---|
| Farms, barns and homes are scattered with long haul times. | Farmstead Cluster. |
| Trade, hall and public requests have no shared centre. | Market Square and Civic Centre. |
| Workshops conflict with homes and freight is blocked. | Artisan/Industrial District. |
| Housing expands without water, services or local roads. | Residential District. |
| City defence has gaps and no central refuge/command. | Citadel and Fortified Perimeter. |
| Clinic or school cannot expand and support traffic is chaotic. | Hospital/University Campus. |
| Regional routes terminate in disconnected warehouses/stations. | Logistics and Transit Nexus. |
| Capital faces realm threats or needs controlled inter-city travel. | Ward Core or Portal Nexus. |
| Metropolis lacks buildable land or needs air routes. | Floating District Anchor/Skyport. |
| Culture arc and regional supply can support a defining project. | Culture Wonder or Leyline Crown. |

## 17.3 Player Influence

Players may:

- Submit a plan or alternate layout.
- Reserve preferred growth sectors.
- Set district style and density.
- Approve or reject optional projects where authority permits.
- Fund or contract subprojects.
- Build enabling roads/utilities.
- Protect workers and supply lines.
- Choose wonder branch/effect within story and culture limits.
- Open or restrict public access.
- Blend local and custom styles.
- Restore, convert or dismantle inherited plans.

NPC settlements retain agency and can reject designs due to law, trust, cost, culture, safety or land.

# 18. Restricted Player Plan and Source Validation

## 18.1 Shared Validation

- Stable plan ID and schema version.
- Valid plan kind and boundary.
- Required parcel roles and substitution tags.
- Real lower-level blueprint references.
- Route and utility graph.
- Terrain and expansion policy.
- Construction phases and dependency graph.
- Public, private, service, restricted and emergency access.
- Capacity without double-counting.
- Ownership, permissions and laws.
- Damage, repair and conversion anchors.
- Performance and world/server limits.
- Save-safe imported content and stable IDs.

## 18.2 Cluster Validation

- Every required role can fit a valid parcel.
- Shared yard/open space is reachable.
- Water, storage and waste relationships are safe.
- Phases can activate without inaccessible future blocks.
- Terrain adaptation does not erase fields, routes or entrances.
- Optional roles do not block required expansion.

## 18.3 District Validation

- Parcel counts and density bands are within limits.
- Route hierarchy connects all required frontage.
- Utilities and services can reach expected demand.
- Hazard/incompatibility buffers are valid.
- Emergency access exists.
- Freight does not rely on pedestrian-only routes.
- Expansion and conversion are possible.
- No abstract capacity is assigned to empty zoning.

## 18.4 Complex/Campus Validation

- Anchor and support buildings are declared.
- Public and restricted circulation are separated where required.
- Utilities and shared service budgets are explicit.
- Emergency, maintenance and loading routes exist.
- Partial activation order is safe.
- Duplicate capacity between anchor and campus is prevented.

## 18.5 Megaproject/Wonder Validation

- Subproject graph has no impossible dependency cycle.
- Enabling infrastructure and worker support are included.
- Resource, labour and specialist costs are bounded.
- Partial effects and commissioning gates are declared.
- Redundancy, shutdown, evacuation and containment exist where relevant.
- Regional effects are bounded and maintainable.
- Damage, capture, corruption, abandonment and restoration states are defined.
- Imported plans cannot execute arbitrary code or bypass world authority.

| **Validation Principle** |
|---|
| A player plan can be organic, asymmetrical, culturally blended or visually unusual. Validation protects real function, access, safety, resource conservation, phasing, performance and persistence - not one official city shape. |

# 19. Construction, Upgrade, Conversion and Replacement

## 19.1 Upgrade Types

- Add parcels or sectors.
- Increase density.
- Upgrade route hierarchy.
- Extend water, sanitation, power or mana.
- Add specialist wing.
- Add security/ward/refuge.
- Convert temporary to permanent.
- Repurpose district role.
- Attach transit or logistics.
- Restore heritage.
- Add vertical/underground/floating layer.
- Commission regional effect.

## 19.2 Conversion Rules

Examples:

- Farmstead -> agricultural district.
- Market square -> civic/market district.
- Artisan quarter -> industrial or clean-magitech district.
- Residential quarter -> mixed-use dense neighbourhood.
- Fort -> citadel or civic castle.
- Academy -> university campus.
- Clinic cluster -> hospital campus.
- Transit hub -> regional nexus.
- Ward network -> city-wide core.
- Ruined palace -> council complex, museum or occupied fortress.
- Incomplete wonder -> restored, repurposed or corrupted world structure.

Conversion preserves component history and inventories unless an explicit demolition/transfer step consumes them.

## 19.3 Demolition and Relocation

- Plans may remove or relocate optional buildings through valid projects.
- Residents and jobs need replacement capacity before forced clearance under normal laws.
- Materials can be recovered based on condition, skill and world settings.
- Heritage or sacred structures may require authority or create reputation consequences.
- Roads and utilities must be rerouted before critical removal.
- Megaproject cores usually require decommissioning, not instant block breaking.

# 20. Runtime Lifecycle, Persistence and Simulation LOD

## 20.1 Shared Runtime States

| **State** | **Meaning** | **Typical Result** |
|---|---|---|
| Proposed | Candidate plan exists but has no approved site or authority. | Survey, consultation and feasibility. |
| Approved | Site, authority and initial project graph are accepted. | Reservations and contracts may begin. |
| Enabling Works | Roads, utilities, supply yards, foundations or anchors are under construction. | No final service; some infrastructure may activate. |
| Active Construction | One or more component subprojects are progressing. | Real stock and labour consumed; visible stages. |
| Partially Operational | Minimum commissioned components provide bounded service. | Occupancy or service limited to valid areas. |
| Commissioning | Tests, staff, routes, utilities, safety and records are being validated. | Service may remain restricted. |
| Operational | Required component and coordination contracts pass. | Normal service and planner contribution. |
| Strained | Demand, route, utility, staffing or maintenance approaches limits. | Reduced resilience and new project pressure. |
| Degraded | Damage or missing components reduces capability. | Partial service and repair priorities. |
| Contested / Occupied | Authority or access is disputed or controlled by another faction. | Changed permissions, services, law and events. |
| Abandoned / Ruined | Maintenance and critical capability have failed. | No normal service; salvage, occupation or restoration. |
| Under Restoration / Conversion | A new project graph is changing the saved plan. | Temporary disruption and staged reactivation. |

## 20.2 Persistent Records

A persistent plan instance stores:

- Stable plan-instance ID, definition ID, source ID, source version and content hash.
- Boundary, terrain-adaptation delta, parcel IDs and nested structure-instance IDs.
- Route, utility and shared-service graph references.
- Owner, sponsors, authorities, permissions and mixed-ownership rules.
- Subproject graph, completed stages, reservations, contributors and work history.
- Current occupancy, staff, service allocation, capacity, blockers and commissioning state.
- Damage, breaches, contamination, occupation, restoration and world-event history.
- Bounded regional effect state where applicable.
- Migration aliases for replaced source, parcel, module and graph-element IDs.

## 20.3 Simulation LOD

### Near

- Real voxel structures, NPC routes, deliveries, construction, service interactions and damage are materialised.
- Shared-service and route graphs update in bounded incremental jobs.
- Player edits, combat, emergencies and construction use authoritative local events.

### Medium

- Component structures remain loaded as simplified scenes or proxies.
- Occupancy, work, travel, utilities and projects use aggregated schedules and graph summaries.
- Important incidents can promote selected areas to near simulation.

### Far or Unloaded

- The plan uses conserved parcel, population, inventory, capacity, project and risk records.
- No individual NPC pathfinding, traffic, machine animation or voxel damage propagation runs continuously.
- Updates occur on bounded intervals or event triggers and preserve the same authoritative totals.

## 20.4 Promotion and Demotion

- Promotion reconstructs runtime products from stable source, bake hash, structure records and plan state.
- Demotion serialises outstanding tasks, inventories, occupancy, damage and project state before releasing scenes.
- Promotion must not reroll deterministic parcel choices, damage masks, project outcomes or resident assignments.
- Critical battles, disasters, capture and megaproject milestones can pin selected plan elements at a higher LOD temporarily.

# 21. Godot/Summer Engine Implementation Architecture

## 21.1 Suggested Resources and Records

| **Resource / Record** | **Responsibility** |
|---|---|
| `SettlementPlanDefinition` | Stable functional plan identity, role requirements, stages, planner class and validation profile. |
| `ForgePlanSource` | Editable boundary, parcels, anchors, routes, utilities, modules, phase graph, dynamic states and placement rules. |
| `PlanBakeProduct` | Deterministic compact parcel, dependency, service, route, utility, coverage and placement tables. |
| `ParcelRuntimeRecord` | Location, role, owner, source/structure assignment, access, services, condition and history. |
| `PlanRuntimeRecord` | Component instances, subprojects, shared services, occupancy, ownership, effects, condition and history. |
| `MegaprojectRuntimeRecord` | Contracts, resources, contributors, milestones, commissioning, disruption, incidents and world effects. |
| `WonderEffectProfile` | Bounded effect, area, maintenance, stacking, ownership, capture, damage and world-state rules. |
| `TerrainAdaptationRecord` | Foundations, cuts, fills, retaining, bridges, anchors and source-to-world transforms. |

## 21.2 Service Boundaries

- `ForgeBakeService` validates and bakes approved plan sources into deterministic runtime products.
- `SettlementPlannerService` evaluates needs, sites, project pools, cost, culture, law, risk and expansion.
- `ParcelService` manages reservation, ownership, occupancy, subdivision, heritage and replacement.
- `ProjectGraphService` resolves subprojects, dependencies, resources, labour, contracts and commissioning.
- `SharedServiceService` allocates water, sanitation, power, mana, logistics, emergency and public capacity without double-counting.
- `RouteAndCoverageService` resolves effective access, travel, freight, patrol, evacuation and service coverage.
- `MegaprojectService` resolves milestones, disruption, regional effects, political support and persistent incidents.
- `WorldPlacementService` resolves terrain, generation, adaptation, protected sites and regional anchors.
- `PlanLODService` promotes and demotes physical scenes while preserving authoritative records.
- `SaveMigrationService` preserves plan, parcel, module, source and graph-element identities across revisions.

## 21.3 Implementation Principles

- Use versioned custom Godot `Resource` classes for authored definitions, source graphs and effect profiles.
- Store runtime plan and project state in compact data records rather than one Node per parcel or semantic marker.
- Materialise only nearby geometry, NPCs, effects and interactive nodes; distant simulation consumes the same authoritative records.
- Run placement, validation, graph bake and planner work asynchronously and incrementally, committing scene-tree changes on controlled main-thread stages.
- Use stable `StringName` IDs and ULIDs for definitions, source elements, parcels, subprojects and placed instances.
- Cache deterministic bake products by source hash, dependency versions, pack resolution and engine schema.
- Treat Summer Engine-generated scripts, resources, tests and migrations as reviewable Godot project files, not opaque runtime authority.
- Maintain golden fixtures for Farmstead Cluster, Market Square, Citadel breach, Campus shared services, Ward Core partial activation and Wonder restoration.
- Require migration tests whenever nested source, parcel, route, utility or phase element identities change.

# 22. Settlement-Stage Expectations

| **Stage** | **20F Planning Expectation** | **Typical 20F Content** | **Scope Guard** |
|---|---|---|---|
| Camp | No formal district requirement. A simple cluster fixture may guide tents and supply. | Reduced planning only. | Do not add city planning to survival opening. |
| Hamlet | Informal clusters and reserved expansion. | Early farmstead ideas, paths and central gathering. | No penalty for organic growth. |
| Village | First validated clusters and a recognisable centre. | Farmstead Cluster; Market Square and Civic Centre. | These remain flexible, not mandatory identical layouts. |
| Fortified Village | Defence, storage and emergency projects begin coordinating across sites. | Guard compound or early perimeter planning through lower-level definitions. | Full citadel not required. |
| Town | District templates emerge as density, trade and production grow. | Artisan/Industrial District; Residential District; Fort/Keep. | A small town may use only one formal district. |
| City | Multiple functioning districts and specialist complexes. | Hospital Complex; University; City Hall; Citadel; Campus; Transit Nexus. | Not every city needs every complex. |
| Capital | Regional authority, redundancy and first megaprojects. | Palace/High Council; Ward Core/Portal Nexus; Culture Wonder. | Capital identity may use culture-specific replacements. |
| Magical Metropolis | Vertical, floating, realm-linked and world-shaping planning. | Floating District Anchor/Skyport; expanded nexus/wonder systems. | Ordinary homes, roads and farms remain necessary local systems. |

# 23. Detailed Registry Summary

| **No.** | **Stable ID** | **Definition** | **Earliest Stage** | **Primary Need** | **Project Class** | **Status** |
|---:|---|---|---|---|---|---|
| 23 | building.health.hospital_complex | Hospital Complex | City | Health | Optional | Beta |
| 59 | building.education.academy_university | Academy or University | City | Work | Optional | Beta |
| 63 | building.governance.city_hall | City Hall or Civic Complex | City | Infrastructure | Upgrade | Beta |
| 69 | building.governance.palace_high_council | Palace or High Council Complex | Capital | Morale | Megaproject | Final |
| 78 | building.safety.fort_keep | Fort or Keep | Town | Safety | Conditional | Beta |
| 111 | plan.cluster.farmstead | Farmstead Cluster | Village | Provisions | District | Alpha |
| 112 | plan.cluster.market_civic_centre | Market Square and Civic Centre | Village | Morale | District | Alpha |
| 113 | plan.district.artisan_industrial | Artisan or Industrial District Template | Town | Work | District | Beta |
| 114 | plan.district.residential | Residential District Template | Town | Housing | District | Beta |
| 115 | plan.complex.citadel_fortified_perimeter | Citadel and Fortified Perimeter Complex | City | Safety | District | Beta |
| 116 | plan.campus.hospital_university | Hospital or University Campus | City | Health | District | Beta |
| 117 | plan.nexus.regional_logistics_transit | Regional Logistics and Transit Nexus | City | Infrastructure | District | Beta |
| 118 | project.megaproject.city_ward_portal_nexus | City-Wide Ward Core or Portal Nexus | Capital | Safety | Megaproject | Final |
| 119 | project.megaproject.floating_district_anchor_skyport | Floating District Anchor or Skyport | Magical Metropolis | Infrastructure | Megaproject | Final |
| 120 | project.wonder.culture_wonder_leyline_crown | Culture Wonder or Leyline Crown | Capital | Morale | Megaproject | Final |

# 24. Civic, Health, Education and Defence Complex Entries

### 23. Hospital Complex

building.health.hospital_complex

| **Catalogue role** | Health / Civic Service Complex \| City \| Complex \| Optional \| Beta |
|---|---|
| **Need contribution** | Primary: Health \| Secondary: Infrastructure, Work, Morale |
| **Purpose** | Provides city-scale diagnosis, surgery, recovery, maternity, emergency care, isolation and disaster capacity by coordinating multiple specialist rooms or buildings around shared utilities, records and logistics. |
| **Composition / modules** | Core hospital hall or ward block; emergency intake; treatment and surgery rooms; recovery wards; pharmacy/medicine store; sanitation and clean-water service; staff areas; optional quarantine, rehabilitation, morgue, magical cleansing or teaching annexes. |
| **Capacity / service** | Draft treatment, bed, surgery, isolation and emergency capacity is derived from validated rooms, staff, medicine, clean water, sanitation, power or mana where required, route access and condition. Decorative beds or empty towers add no service. |
| **Jobs and users** | Physician or senior healer, surgeons, healers, nurses/attendants, apothecaries, sanitation workers, porters, cooks, clerks, maintenance workers, guards and optional healing mages. |
| **Inputs** | Medicine, herbs, bandages, clean water, food, linens, fuel/power, surgical tools, cleaning supplies, records, repair materials and optional mana/reagents. |
| **Outputs / services** | Treatment, surgery, recovery, outbreak response, emergency triage, training, public-health data, morale support and disaster resilience. |
| **Required semantic plan/source contract** | Emergency intake, public entrance, clean and contaminated circulation, treatment points, surgery, recovery beds, medicine storage, staff stations, kitchen/food link, sanitation, waste route, ambulance/cart access, fire exits and optional quarantine/cleansing zones. |
| **Placement and utilities** | Central enough for emergency access but separated from heavy pollution, uncontrolled portals and siege chokepoints. Requires reliable roads, water, sanitation, food, storage, emergency power and room for future wards. |
| **Official Blueprint Forge source** | Nested hospital-complex source assembled from emergency intake, treatment, surgery, recovery, pharmacy, sanitation, logistics, staff, isolation and optional teaching/cleansing modules. The source carries clean/dirty circulation layers, utility sockets, phased wing activation and damaged, contaminated, occupied and restored deltas. |
| **Construction / phasing profile** | 8-12 phases: site and utilities; core shell; emergency/treatment wing; clean services; recovery wards; stores and staff; sanitation/waste; optional specialist annexes; inspection and commissioning. Basic clinic functions may activate before the full complex. |
| **Upgrade and branch links** | Regional Hospital, Teaching Hospital, Military Hospital, Magical Healing Campus, Corruption-Cleansing Institute or disaster-response medical centre. |
| **Planner triggers and failure states** | Selected when city population, travel distance, casualty history, disease risk or specialist demand exceeds clinics. It underperforms when staff, medicine, water, sanitation, access or clean separation fail. |
| **Restricted player-source validation** | Must prove patient flow, staff flow, clean/dirty separation, emergency access, bed and treatment markers, medicine security, utilities, waste handling, fire/evacuation and partial activation order. |
| **Culture and style variation** | Courtyard hospital, monastic healing campus, dwarven underground infirmary, fae restorative grove, desert shade-and-water hospital, arcane clinical tower or distributed neighbourhood health campus. |

### 59. Academy or University

building.education.academy_university

| **Catalogue role** | Education / Research Complex \| City \| Complex \| Optional \| Beta |
|---|---|
| **Need contribution** | Primary: Work \| Secondary: Morale, Infrastructure |
| **Purpose** | Provides advanced teaching, specialist succession, research, archives and professional coordination across several faculties without making education a separate settlement need. |
| **Composition / modules** | Teaching halls; library/archive; laboratories or workshops; faculty offices; student commons; practical yards; storage; optional dormitories, observatory, medical, magical, engineering, agricultural, military or dimensional faculties. |
| **Capacity / service** | Draft student places, faculty positions, research slots and knowledge output depend on validated teaching/research markers, staff, books/data, tools, utilities, safety and available specialist pathways. |
| **Jobs and users** | Professors, teachers, researchers, librarians, archivists, laboratory staff, technicians, administrators, groundskeepers, guards and apprentices/students. |
| **Inputs** | Books, records, maps, research materials, tools, specimens, components, food, maintenance, power/mana where relevant and funding or patronage according to governance. |
| **Outputs / services** | Training, specialist succession, research progress, recipe and knowledge unlocks, maps, cultural prestige, public lectures, skilled migration and story/faction opportunities. |
| **Required semantic plan/source contract** | Teaching rooms, research stations, library/archive, practical training areas, staff offices, student access, secure/restricted stores, utility links, public lecture point, emergency exits and optional dormitory/meal links. |
| **Placement and utilities** | Accessible from housing and civic routes, protected from industrial hazards and able to expand by faculty. Some cultures may place it inside a temple, palace, guild quarter, cave, forest or floating district. |
| **Official Blueprint Forge source** | Campus-scale source assembled from teaching, archive, laboratory/workshop, faculty, student-support, public-event and optional residence modules. Faculty branches inherit the shared campus spine while retaining stable rooms, network elements, knowledge anchors and staged commissioning. |
| **Construction / phasing profile** | 9-14 phases: enabling works; core hall/library; first teaching wing; staff and records; practical/research facilities; utilities; public grounds; additional faculties; final commissioning. Basic academy services activate before university completion. |
| **Upgrade and branch links** | Grand University, Guild University, Arcane University, Military Academy Campus, Agricultural College, Dimensional Institute or distributed collegiate system. |
| **Planner triggers and failure states** | Selected when the city has stable basic needs, enough students and specialists, research demand and sustained resources. It can fail through faculty loss, archive damage, political restriction, unsafe research or insufficient utilities. |
| **Restricted player-source validation** | Must prove genuine teaching/research capacity, safe specialist rooms, library/knowledge storage, public and restricted circulation, staff/student support, accessibility and phased faculty activation. |
| **Culture and style variation** | Stone collegiate court, tower academy, guild campus, monastery university, forest memory grove, dwarven archive-forge, desert observatory college or floating magitech institute. |

### 63. City Hall or Civic Complex

building.governance.city_hall

| **Catalogue role** | Governance / Civic Service Complex \| City \| Complex \| Upgrade \| Beta |
|---|---|
| **Need contribution** | Primary: Infrastructure \| Secondary: Morale, Work |
| **Purpose** | Coordinates city districts, laws, records, planning, public services, budgets, disputes, permits and regional administration through a physical civic centre rather than an abstract menu bonus. |
| **Composition / modules** | Public chamber; council or assembly room; clerk offices; records/archive; planning and blueprint office; district-service offices; reception; secure records; optional court, customs, treasury, embassy, emergency command or civic plaza annexes. |
| **Capacity / service** | Draft administrative case load, district coordination and project approval capacity depends on offices, records, staff, communications, public access, security and utility reliability. |
| **Jobs and users** | Mayor, council members, elected or appointed leaders, clerks, planners, architects, record keepers, magistrates, tax/customs staff, diplomats, messengers, guards and maintenance staff. |
| **Inputs** | Records, maps, stationery, public notices, treasury funds or resource budgets, food/fuel for staff, communications, security and maintenance supplies. |
| **Outputs / services** | Laws, permits, district coordination, project approvals, records, dispute handling, public meetings, service priorities, diplomacy and civic event capacity. |
| **Required semantic plan/source contract** | Public entrance and queue, council/assembly chamber, offices, records store, blueprint/planning room, secure meeting room, notice/public interaction point, staff circulation, archive fire protection, emergency command and plaza/road sockets. |
| **Placement and utilities** | Prominent, accessible and defensible civic parcel connected to public transport, market, records and emergency routes. It should not be the only route through the city or an unavoidable military choke point. |
| **Official Blueprint Forge source** | Civic-complex source containing public chamber, assembly/council, records, planning office, service desks, secure administration, plaza and optional court/customs/embassy/emergency-command modules. Public, official, secure and service circulation are authored as separate semantic layers. |
| **Construction / phasing profile** | 8-12 phases: civic site and plaza; core hall; public chamber; offices; records/planning; secure services; annexes; utilities and communications; ceremonial finish; commissioning. Town-hall services may remain active during expansion. |
| **Upgrade and branch links** | Capital Council Complex, Distributed Borough Administration, Palace/High Council Complex, Civic Castle, Grand Court or culture-specific assembly precinct. |
| **Planner triggers and failure states** | Selected when district count, population, service complexity and regional authority exceed the Town Hall. It becomes strained when staff, records, communications, public access or political legitimacy fail. |
| **Restricted player-source validation** | Must provide public and secure circulation, real staff/work markers, protected records, district-planning capacity, assembly space, emergency access and continuity during phased construction. |
| **Culture and style variation** | Republican forum, clan moot complex, merchant council hall, dwarven thane court, fae seasonal assembly, temple-government precinct, bureaucratic tower or distributed neighbourhood halls. |

### 69. Palace or High Council Complex

building.governance.palace_high_council

| **Catalogue role** | Governance / Capital Authority Complex \| Capital \| Megaproject \| Final |
|---|---|
| **Need contribution** | Primary: Morale \| Secondary: Safety, Infrastructure |
| **Purpose** | Provides culture-defining capital leadership, diplomacy, ceremonial authority, strategic coordination and secure continuity of government. It supports monarchy, council, senate, clan, theocracy or other governance forms rather than assuming a single palace model. |
| **Composition / modules** | High council or throne chamber; leadership offices/residences where appropriate; diplomatic halls; secure archives; strategic command; ceremonial courts; staff/service areas; gardens or public approach; optional treasury, court, temple, guard, portal or refuge annexes. |
| **Capacity / service** | Draft diplomatic, governance, ceremonial and crisis-command capacity depends on valid chambers, staff, records, security, communications, utilities, public legitimacy and protected continuity spaces. |
| **Jobs and users** | Ruler or high council, ministers, diplomats, advisors, scribes, archivists, servants, cooks, guards, ceremonial staff, planners, messengers and culture-specific offices. |
| **Inputs** | Food, fuel, luxury/cultural goods, records, treasury resources, security equipment, communications, maintenance, diplomatic gifts and optional mana/power. |
| **Outputs / services** | Capital governance, diplomacy, law, succession/continuity, major project authority, ceremonies, faction prestige, story access and regional crisis coordination. |
| **Required semantic plan/source contract** | Public ceremonial approach, controlled audience area, high council/throne chamber, offices, diplomatic suites, secure archive, command centre, private/service circulation, guard posts, evacuation/refuge, utility redundancy and landmark sockets. |
| **Placement and utilities** | Capital landmark with controlled public access, secure logistics, multiple evacuation routes and separation between ceremonial, residential, administrative and strategic zones. It may integrate a citadel without becoming inaccessible to citizens. |
| **Official Blueprint Forge source** | Capital authority source assembled from ceremonial, governance, residence-support, diplomacy, treasury, guard, archive and public-realm modules. Inheritance supports council, palace, conclave or occupation branches while legitimacy and law remain runtime records rather than visual properties. |
| **Construction / phasing profile** | 12+ subprojects: site/terraces; public approach; administrative core; council/throne hall; diplomatic wing; archives; service/residential wings; security and refuge; utilities; cultural art; commissioning and ceremonial activation. |
| **Upgrade and branch links** | Grand Palace, High Senate, Sacred Council Precinct, Floating Palace, Realm Embassy Court or World Council Complex. |
| **Planner triggers and failure states** | Selected after capital status, stable governance, diplomacy and major supply chains. Failure can involve legitimacy crisis, occupation, archive loss, faction conflict, siege or incomplete ceremonial commitments. |
| **Restricted player-source validation** | Must declare governance model and separate required public, diplomatic, secure, service and emergency flows; prove continuity, records, staffing, access, utilities and phased use. Visual grandeur alone grants no authority. |
| **Culture and style variation** | Royal palace, senate forum, clan ring-fort, dwarven high hall, fae seasonal court, merchant conclave, mage council citadel, floating celestial court or underground ancestral complex. |

### 78. Fort or Keep

building.safety.fort_keep

| **Catalogue role** | Safety / Military Strongpoint Complex \| Town \| Complex \| Conditional \| Beta |
|---|---|
| **Need contribution** | Primary: Safety \| Secondary: Infrastructure, Morale |
| **Purpose** | Provides a durable command, refuge, reserve and defensive strongpoint for a town or strategic route. It does not automatically create a complete perimeter or replace guards, roads, supply and civilian evacuation. |
| **Composition / modules** | Keep or command block; gate/controlled entry; barracks; armoury; secure stores; well/cistern; watch positions; refuge; signal; training/service yard; optional stables, dungeon cells, ward tower, siege platforms or tunnel access. |
| **Capacity / service** | Draft garrison, refuge, command, reserve and defence capacity is derived from validated rooms, staff, weapons, stores, water, routes, sightlines, condition and integration with the wider defence plan. |
| **Jobs and users** | Commander, guards/soldiers, quartermaster, armourer, scout, healer, cook, stablehand, engineer, signaler, clerk and maintenance crew. |
| **Inputs** | Food, water, fuel, weapons, armour, ammunition, medicine, repair blocks, tools, animals, communications and optional ward mana. |
| **Outputs / services** | Garrison readiness, command, protected reserves, refuge, patrol coordination, signal coverage, route control and siege resilience. |
| **Required semantic plan/source contract** | Controlled gate, command point, barracks beds, armoury, secure store, water source/reserve, refuge capacity, watch/signal positions, patrol sockets, repair access, evacuation and optional wall/perimeter connections. |
| **Placement and utilities** | Strategic high ground, route crossing, border, harbour or town edge with access to settlement logistics. It must not trap civilians or block all normal trade and emergency movement. |
| **Official Blueprint Forge source** | Fort/keep source assembled from perimeter, gate, command, barracks, armoury, stores, refuge, water, repair, patrol and optional ward/siege modules. Stable wall-sector, gate, tower and breach-group IDs support siege damage, capture, occupation and staged restoration. |
| **Construction / phasing profile** | 8-12 phases: site/earthworks; walls/foundation; keep shell; gate and watch; stores/water; barracks/command; refuge; defences; optional annexes; commissioning. |
| **Upgrade and branch links** | Citadel and Fortified Perimeter Complex, Border Fortress, Harbour Fort, Mountain Fortress, Civic Castle or warded magical bastion. |
| **Planner triggers and failure states** | Selected when threat, border, route, wealth or political control justifies it. It is costly and can increase raid value, fear, occupation pressure or maintenance burden. |
| **Restricted player-source validation** | Must prove garrison logistics, controlled access, refuge, water, stores, patrol connection, evacuation, repairability and realistic defence coverage. Thick walls alone do not create readiness. |
| **Culture and style variation** | Timber hill fort, stone keep, dwarven gate-fort, desert kasbah, forest ring-fort, cliff fortress, harbour castle, floating guard platform or rune-bastion. |

# 25. Cluster, District, Campus and Nexus Entries

### 111. Farmstead Cluster

plan.cluster.farmstead

| **Catalogue role** | Cluster Plan / Agriculture \| Village \| Cluster \| District \| Alpha |
|---|---|
| **Need contribution** | Primary: Provisions \| Secondary: Housing, Work, Infrastructure |
| **Purpose** | Coordinates one or more farm households, fields, barn/animal areas, storage, water and access as a terrain-adaptive production cluster rather than a single pasted farm model. |
| **Composition / modules** | Required parcel roles usually include farmhouse or worker housing, crop plots and route access. Optional roles include barn, paddock, orchard, well/irrigation, granary, tool shed, apiary, smokehouse, wind/water mill or seasonal worker shelter. |
| **Capacity / service** | Cluster output is the sum of functioning component buildings and plots, modified by travel, water, soil, storage, staffing, animals, weather and route access. The plan itself produces no food. |
| **Jobs and users** | Farmers, animal handlers, millers, haulers, cooks/preservers, maintainers, seasonal workers and household residents. |
| **Inputs** | Land, seed, tools, water, feed, building materials, storage, roads and optional power/automation. |
| **Outputs / services** | Food, fibre, livestock goods, local housing, seasonal reserve, by-products and visible rural settlement identity. |
| **Required semantic plan/source contract** | Cluster boundary, parcel roles, field/animal zones, water point, central work yard, storage link, primary/secondary paths, expansion edge, waste/compost separation and optional utility sockets. |
| **Placement and utilities** | Fertile or culture-suitable terrain with water, sunlight/climate, safe access and enough expansion. It should not place animals or waste upstream of public water or block future settlement routes. |
| **Official Blueprint Forge source** | Adaptive cluster-plan source with parcel roles for farmhouse, fields, livestock, storage, processing, water, service yard and route spine. Required and optional roles, substitution tags, terrain adaptation and construction order allow organic farmsteads without one pasted layout. |
| **Construction / phasing profile** | Phased: survey and access; first shelter/farmhouse; initial field and water; storage/barn; additional plots/animals; processing or automation; landscape/culture finish. |
| **Upgrade and branch links** | Agricultural Hamlet, Irrigated Farmstead, Orchard/Vineyard Cluster, Ranch, Automated Farm Cluster, Magical Crop Sanctuary or regional estate. |
| **Planner triggers and failure states** | Selected when provisions demand, suitable land and workers justify a coordinated rural cluster. It adapts or rejects sites with poor soil, unsafe distance, no water or route conflict. |
| **Restricted player-source validation** | Must define required and optional parcel roles, reachability, water, field clearance, animal/waste separation, storage and phased activation. A decorative farmhouse cannot satisfy the cluster alone. |
| **Culture and style variation** | Mixed family farm, communal longfields, terrace farm, wetland rice cluster, orchard estate, dwarven fungus farm, fae living grove, desert irrigation compound or floating greenhouse farm. |

### 112. Market Square and Civic Centre

plan.cluster.market_civic_centre

| **Catalogue role** | Cluster Plan / Trade and Civic Life \| Village \| Cluster \| District \| Alpha |
|---|---|
| **Need contribution** | Primary: Morale \| Secondary: Work, Infrastructure |
| **Purpose** | Coordinates market, civic, notice, social and route functions around a public space that can grow from village stalls into a formal town centre. |
| **Composition / modules** | Public square/green; market stalls or hall; village/town hall link; notice/request board; warehouse/loading link; well/fountain or gathering point; roads; optional inn, shrine, school, guard post, stage, monument, customs or public garden. |
| **Capacity / service** | Trade and civic capacity comes from functioning market, hall, storage, access, staff, public-space and safety components. Open space alone grants morale and event value only when usable and connected. |
| **Jobs and users** | Merchants, market manager, clerks, leaders, guards, haulers, entertainers, cleaners, innkeepers, crafters and visiting traders. |
| **Inputs** | Goods, stalls, records, lighting, cleaning/maintenance, security, water, event supplies and route capacity. |
| **Outputs / services** | Trade, public requests, meetings, festivals, social gathering, visitor orientation, civic identity, reputation and local service access. |
| **Required semantic plan/source contract** | Public-space boundary, stall parcels, civic frontage, notice point, road/junction sockets, loading/service access, crowd/assembly zones, emergency route, lighting, waste and optional event stage. |
| **Placement and utilities** | Central or highly connected parcel with room for crowds, deliveries and future buildings. Heavy freight should use service access rather than crossing pedestrian space where possible. |
| **Official Blueprint Forge source** | Adaptive civic-centre plan with market edges, public square, hall/authority anchor, storage/loading, vendor positions, roads, sanitation, emergency access and optional inn, shrine or guard modules. Event layouts and market-day states remain authored deltas over the same stable plan. |
| **Construction / phasing profile** | Phased: route and cleared square; notice/temporary stalls; hall frontage and basic market; storage/service; lighting/water/safety; permanent hall/stalls; optional culture and prestige modules. |
| **Upgrade and branch links** | Town Market and Civic District, Covered Bazaar, Merchant Forum, Festival Square, Canal Market, Civic Plaza or culture-specific central precinct. |
| **Planner triggers and failure states** | Selected when dispersed trade, public requests and civic travel need a shared centre. It becomes strained through crowding, blocked deliveries, poor sanitation, unsafe routes or insufficient storage. |
| **Restricted player-source validation** | Must separate public circulation from loading where required, provide valid stalls/services, civic access, emergency routes, waste handling and flexible event space. Decorative plaza blocks do not create trade capacity. |
| **Culture and style variation** | Village green, covered bazaar, clan moot market, dwarven trade cavern, fae seasonal clearing, desert caravan square, harbour market or vertical city atrium. |

### 113. Artisan or Industrial District Template

plan.district.artisan_industrial

| **Catalogue role** | District Plan / Production \| Town \| District \| District \| Beta |
|---|---|
| **Need contribution** | Primary: Work \| Secondary: Infrastructure, Safety |
| **Purpose** | Coordinates workshops, industry, storage, freight, worker access, hazard separation and expansion so production scales without scattering incompatible buildings through housing. |
| **Composition / modules** | Production parcels; shared yards; storage/depot links; service and freight roads; power/water/mana spine where available; maintenance/fire access; worker amenities; optional guild, market outlet, training, waste treatment, guard or research buildings. |
| **Capacity / service** | District output is aggregated from real workplaces and networks. The template reduces travel and enables shared services but does not create abstract production. |
| **Jobs and users** | Artisans, labourers, engineers, haulers, warehouse staff, maintenance workers, sanitation workers, inspectors, guards, apprentices and managers. |
| **Inputs** | Land, routes, storage, utilities, raw materials, workforce, safety equipment, maintenance and permitted industrial processes. |
| **Outputs / services** | Craft goods, industrial products, jobs, training, trade stock, by-products, noise, waste and city-scale production capacity. |
| **Required semantic plan/source contract** | District boundary, parcel classes, freight hierarchy, public/worker access, utility spine, buffers, hazard zones, shared yards, emergency routes, waste route, expansion sectors and optional mixed-use edge. |
| **Placement and utilities** | Downwind/downstream or otherwise safely separated according to industry while still connected to housing, warehouse and trade. Terrain, water, resource deposits and existing culture affect form. |
| **Official Blueprint Forge source** | District-template source containing parcel pools, freight and public route hierarchy, utility spine, hazard buffers, storage/logistics nodes, emergency routes and compatible artisan/industrial role tags. It guides real projects rather than spawning abstract zoned buildings. |
| **Construction / phasing profile** | Phased enabling infrastructure; first artisan yard; storage and utilities; additional workshops; heavy industry branch; waste/safety; district services; density or automation upgrades. |
| **Upgrade and branch links** | Artisan Quarter, Foundry District, Magitech Industry District, Harbour Industry, Underground Works, Clean Production District or regional manufacturing zone. |
| **Planner triggers and failure states** | Selected when production buildings compete for land, routes and utilities or hazards threaten mixed settlement areas. It is rejected if staffing, logistics, buffers or waste handling are impossible. |
| **Restricted player-source validation** | Must define compatible/incompatible parcel roles, freight and worker circulation, utility capacity, hazard buffers, fire/emergency access, waste and phased activation. Zoning colour alone creates no service. |
| **Culture and style variation** | Medieval artisan lanes, canal industry, dwarven forge district, forest craft grove, desert kiln quarter, steamworks, arcane industry terrace or vertical factory district. |

### 114. Residential District Template

plan.district.residential

| **Catalogue role** | District Plan / Housing and Local Services \| Town \| District \| District \| Beta |
|---|---|
| **Need contribution** | Primary: Housing \| Secondary: Infrastructure, Morale |
| **Purpose** | Coordinates mixed housing, local services, paths, public space and future expansion while allowing culture, terrain and player style to determine actual architecture and density. |
| **Composition / modules** | Housing parcels across one or more density bands; local paths/streets; water and sanitation; small food/service access; public space; emergency route; optional school, shrine/community hall, clinic, market corner, workshop edge, garden or transit stop. |
| **Capacity / service** | Housing and service capacity is the sum of functioning homes and facilities, modified by access, utilities, safety, overcrowding, travel and district condition. The plan itself creates no beds. |
| **Jobs and users** | Residents, local merchants, teachers, healers, service workers, maintenance crews, guards, cleaners and district representatives. |
| **Inputs** | Land, housing blueprints, roads, water, sanitation, lighting, service buildings, maintenance, safety coverage and culture/style rules. |
| **Outputs / services** | Usable housing, neighbourhood services, local morale, population growth capacity, safe circulation and coherent expansion. |
| **Required semantic plan/source contract** | District boundary, housing parcel sizes, frontage rules, density bands, local centre, public space, route hierarchy, utility/service coverage, emergency access, expansion sectors and incompatible-use buffers. |
| **Placement and utilities** | Safe and reasonably connected terrain with access to work and civic services. Avoid heavy hazard exposure, flood zones, unstable magical sites and freight routes through local public spaces. |
| **Official Blueprint Forge source** | Residential-district template with housing parcel pools, mixed-use permissions, local services, public space, route hierarchy, utility capacity, accessibility, emergency coverage and staged density branches. Population comes only from completed valid housing sources. |
| **Construction / phasing profile** | Phased roads/utilities; first housing cluster; local water/service; additional housing; public/community space; density upgrade; transit or mixed-use edge; prestige/landscape improvements. |
| **Upgrade and branch links** | Dense Urban Quarter, Garden District, Worker Housing District, Noble/Administrative Quarter, Mixed-Use Neighbourhood, Underground Residential District or floating neighbourhood. |
| **Planner triggers and failure states** | Selected when housing demand, travel distance or unplanned sprawl requires coordinated parcels and services. It can remain low density where culture or terrain prefers it. |
| **Restricted player-source validation** | Must prove real bed capacity through building definitions, safe routes, utility/service coverage, emergency access, reasonable work/service travel and future expansion. Empty residential zoning grants nothing. |
| **Culture and style variation** | Row-house quarter, courtyard district, clan compounds, terraced hillside homes, forest canopy village, dwarven residential cavern, canal neighbourhood, desert shaded lanes or floating platforms. |

### 115. Citadel and Fortified Perimeter Complex

plan.complex.citadel_fortified_perimeter

| **Catalogue role** | Defence Plan / City Perimeter \| City \| Complex/Network \| District \| Beta |
|---|---|
| **Need contribution** | Primary: Safety \| Secondary: Infrastructure, Morale |
| **Purpose** | Coordinates layered walls, gates, towers, command, refuge, strategic storage, patrols and optional wards as a city defence system built from real structures and network segments. |
| **Composition / modules** | Perimeter sectors; gates; watch/signal towers; patrol routes; fort/keep or command; armoury and reserve stores; refuge/evacuation; repair yards; optional moat, terrain defence, harbour fort, ward relays, siege platforms or outer settlements. |
| **Capacity / service** | Defence is calculated from actual coverage, readiness, stores, staffing, routes, condition, sightlines, gate control, refuge and redundancy. A closed ring of decorative walls does not guarantee safety. |
| **Jobs and users** | Commanders, guards, engineers, builders, quartermasters, scouts, signalers, healers, firefighters, warders and logistics workers. |
| **Inputs** | Stone/timber/metal, weapons, ammunition, food, water, medicine, repair stock, labour, roads, communications and optional mana/power. |
| **Outputs / services** | Layered defence, warning, controlled access, protected reserves, refuge, command, siege resilience and visible city identity. |
| **Required semantic plan/source contract** | Perimeter graph, sectors, gates, tower coverage, patrol path, command node, refuge, reserve stores, repair access, emergency exits, civilian routes, weak points, optional ward sockets and expansion gates. |
| **Placement and utilities** | Adapts to terrain, waterways, cliffs, existing roads and districts. Must preserve trade, evacuation and future expansion rather than enclosing the city into an unusable trap. |
| **Official Blueprint Forge source** | Nested citadel/perimeter plan combining fort/keep, wall sectors, gates, towers, command, stores, refuge, utilities, internal routes and urban interfaces. The source bakes sector graphs, coverage, breach groups, evacuation and independently repairable subprojects. |
| **Construction / phasing profile** | Sector-based subprojects: survey/earthworks; priority gates; towers/signals; first wall sectors; command/store/refuge; remaining perimeter; utilities/wards; strengthening and prestige. Partial sectors function independently. |
| **Upgrade and branch links** | Capital Citadel, Star Fortress, Mountain Gate Complex, Harbour Defence, Layered Ward Perimeter, Floating Bastion or culture-specific defensive landscape. |
| **Planner triggers and failure states** | Selected when city value, threat, faction conflict or strategic position justifies major defence. High cost, maintenance and political symbolism prevent it from being an automatic stage requirement. |
| **Restricted player-source validation** | Must expose real coverage and gaps, civilian/trade access, patrol and repair routes, refuge, supplies, gate logic, emergency exits and phased completion. The validator should not require a perfect geometric ring. |
| **Culture and style variation** | Stone city walls, earthwork ramparts, dwarven mountain gate, living thorn perimeter, canal defence, desert citadel, ward lattice, floating barrier or distributed hill forts. |

### 116. Hospital or University Campus

plan.campus.hospital_university

| **Catalogue role** | Campus Plan / Specialist Services \| City \| Campus \| District \| Beta |
|---|---|
| **Need contribution** | Primary: Health \| Secondary: Work, Infrastructure, Morale |
| **Purpose** | Provides a reusable campus-planning framework for a hospital complex, university or another multi-building specialist institution with shared grounds, utilities, housing, logistics and expansion. |
| **Composition / modules** | One anchor complex (normally definition 23 or 59); support buildings; service yards; utilities; storage; public entrance; staff/student/patient housing where needed; open grounds; emergency/service routes; optional chapel/shrine, library, kitchens, gardens, workshops or transport stop. |
| **Capacity / service** | The campus coordinates access, shared services and expansion. Medical, education or research capacity still comes from functioning component definitions. |
| **Jobs and users** | Anchor institution staff plus groundskeepers, administrators, cooks, haulers, maintenance, guards, cleaners, transport workers and residents/students/patients. |
| **Inputs** | Anchor building, land, roads, utilities, shared stores, housing/food support, maintenance, security and branch-specific supplies. |
| **Outputs / services** | Improved specialist access, expansion, shared utilities, staff support, public grounds, resilience, teaching/recovery environment and coherent institutional identity. |
| **Required semantic plan/source contract** | Campus boundary, anchor parcel, support parcel roles, public entrance, service entrance, emergency route, utility spine, shared green/court, housing/food links, expansion parcels and restricted zones. |
| **Placement and utilities** | Large city parcel or multiple linked parcels with reliable transit, utilities and future growth. Hospital variants prioritise emergency access; university variants prioritise public/student movement and research safety. |
| **Official Blueprint Forge source** | Campus plan that coordinates one or more hospital or university anchors with support buildings, grounds, utilities, transit, stores, staff/resident support and expansion parcels. Branch profiles prevent double-counting shared services and preserve independent building ownership. |
| **Construction / phasing profile** | Enabling works; anchor complex phase; utilities/roads; first support building; grounds; staff housing/services; specialist annexes; expansion and prestige. The anchor can operate before full campus completion. |
| **Upgrade and branch links** | Teaching Hospital Campus, Grand University, Arcane Research Campus, Military Medical Academy, Distributed City Campus or realm-specific institute. |
| **Planner triggers and failure states** | Selected when one anchor complex is constrained by land, support services, traffic or future expansion. It is not required merely because the city owns a clinic or school. |
| **Restricted player-source validation** | Must identify anchor and support roles, separate public/service/emergency flows, prove utility and housing/food links, preserve expansion and avoid granting duplicate anchor capacity. |
| **Culture and style variation** | Collegiate courtyards, pavilion hospital, monastery campus, forest learning grove, subterranean institute, canal medical campus, floating academy or distributed urban campus. |

### 117. Regional Logistics and Transit Nexus

plan.nexus.regional_logistics_transit

| **Catalogue role** | Regional Infrastructure Plan / Freight and Travel \| City \| Nexus \| District \| Beta |
|---|---|
| **Need contribution** | Primary: Infrastructure \| Secondary: Work, Provisions |
| **Purpose** | Coordinates multiple regional transport and freight modes around storage, customs, distribution and passenger access without treating all movement as one magical inventory. |
| **Composition / modules** | Major road junction; freight/warehouse district; cart or rail terminal; harbour/dock where conditional; passenger station; customs/security; distribution centre; maintenance; route control; optional portal freight, skyport, caravanserai or market links. |
| **Capacity / service** | Throughput is limited by each real mode, loading point, storage buffer, staff, route, ownership, power and destination. The nexus improves transfers but cannot exceed its weakest connections. |
| **Jobs and users** | Logistics managers, dispatchers, warehouse staff, drivers, animal handlers, dock/rail workers, customs, guards, maintenance, couriers and traders. |
| **Inputs** | Routes, vehicles, fuel/power, warehouses, loading equipment, records, staff, maintenance, security and trade agreements. |
| **Outputs / services** | Regional freight, passenger travel, imports/exports, route transfers, emergency logistics, trade growth and reduced long-distance hauling. |
| **Required semantic plan/source contract** | Nexus boundary, mode-specific terminals, transfer buffers, public and freight circulation, storage, customs, control, maintenance, emergency route, utility spine, future mode sockets and destination links. |
| **Placement and utilities** | City edge, harbour, river, rail corridor or major road intersection with enough land and safe separation from housing. It must connect into city streets without sending heavy freight through pedestrian centres. |
| **Official Blueprint Forge source** | Regional nexus plan assembled from road, cart, rail, water, air or portal interchange modules, freight/passenger buffers, warehouses, customs, dispatch, utility and emergency systems. Typed transfer graphs preserve exact inventories, manifests and mode changes. |
| **Construction / phasing profile** | Phased main road and warehouse; first terminal; loading/transfer; customs/control; second mode; maintenance; distribution; passenger services; optional advanced links. |
| **Upgrade and branch links** | Capital Transit Nexus, Multimodal Port, Portal Freight Nexus, Skyport Logistics Complex, Regional Caravan Hub or subterranean rail exchange. |
| **Planner triggers and failure states** | Selected when trade, travel and freight are blocked by disconnected terminals, repeated transfers or warehouse congestion. It is conditional on genuine regional routes and demand. |
| **Restricted player-source validation** | Must preserve separate inventories and route modes, prove transfer paths, buffers, ownership, passenger safety, heavy freight clearance, emergency access and phased activation. |
| **Culture and style variation** | Caravan crossroads, canal port, rail depot city, dwarven underground exchange, desert trade oasis, harbour metropolis, portal-linked freight court or vertical sky transit hub. |

# 26. Megaproject and Wonder Entries

### 118. City-Wide Ward Core or Portal Nexus

project.megaproject.city_ward_portal_nexus

| **Catalogue role** | Megaproject / Magical City Network \| Capital \| Megaproject \| Megaproject \| Final |
|---|---|
| **Need contribution** | Primary: Safety \| Secondary: Infrastructure, Work |
| **Purpose** | Creates a civilisation-scale magical network through either a city-wide defensive ward core or a multi-station portal nexus. The two branches share project governance and network rules but have different components and risks. |
| **Composition / modules** | Ward branch: core, batteries, leyline/power links, district relays, perimeter anchors, control, maintenance and emergency bypass. Portal branch: central control, multiple portal stations, destination anchors, customs/security, freight/passenger buffers, containment and grid support. |
| **Capacity / service** | Ward protection or portal throughput is derived from functioning subprojects, source energy, relays/stations, operators, condition, security and district coverage. The megaproject record adds coordination, not free capacity. |
| **Jobs and users** | High mages, rune engineers, grid operators, portal keepers or warders, security/customs, maintenance, researchers, planners, logistics staff and emergency teams. |
| **Inputs** | Rare magical materials, mana/power, runes, stabilisers, district sites, specialist labour, records, trade/faction agreements, construction stock and ongoing maintenance. |
| **Outputs / services** | City-scale protection, controlled travel/freight, regional influence, research, emergency routing, story access and major political consequences. |
| **Required semantic plan/source contract** | Core/nexus site, subproject graph, district anchors/stations, source links, control and emergency shutdown, maintenance routes, secure stores, coverage/destination map, public and restricted access, containment and fallback systems. |
| **Placement and utilities** | Capital-scale network across several protected sites. It must account for districts, terrain, leylines, threat, evacuation, ownership and sabotage rather than hiding all function inside one tower. |
| **Official Blueprint Forge source** | Megaproject source graph for a city ward core or portal nexus, including central control, sources, district relays/stations, maintenance, security, shutdown, redundancy and phased commissioning. Each node remains an independently saved and damageable subproject. |
| **Construction / phasing profile** | 12+ staged subprojects: research/authority; source/grid upgrades; core shell; first relay/station; district links; control/security; redundancy; additional nodes; testing; partial activation; final attunement and commissioning. |
| **Upgrade and branch links** | Regional Ward Network, Inter-City Portal Network, Realm Transit Authority, World Shield component or Leyline Crown integration. |
| **Planner triggers and failure states** | Selected only after capital governance, stable energy, specialists, district infrastructure and story/faction gates. Costs require automation, contracts, trade and long-term construction. |
| **Restricted player-source validation** | Must choose branch, define every subproject and network dependency, preserve exact source/destination or coverage state, provide shutdown/redundancy, security, maintenance and partial-failure behaviour. |
| **Culture and style variation** | Central crystal ward, ring of runic towers, living-tree protective lattice, dwarven resonance grid, grand portal concourse, mirror-gate network, celestial arch system or shadow-threshold authority. |

### 119. Floating District Anchor or Skyport

project.megaproject.floating_district_anchor_skyport

| **Catalogue role** | Megaproject / Elevated Settlement and Air Transit \| Magical Metropolis \| Megaproject \| Megaproject \| Final |
|---|---|
| **Need contribution** | Primary: Infrastructure \| Secondary: Safety, Work, Housing |
| **Purpose** | Supports a persistent elevated or floating district and/or major air-travel terminal through physical anchors, lift, utilities, logistics, evacuation and maintenance rather than a free-floating decorative platform. |
| **Composition / modules** | Primary anchor or lift system; stabilisers; platform/substructure; skyport berths; vertical transit; freight and passenger terminals; utilities; housing/service parcels; emergency descent/evacuation; maintenance; optional ward, portal or weather-control links. |
| **Capacity / service** | Supported mass/parcel capacity, berth throughput and utility service are bounded by anchors, power/mana, redundancy, weather, maintenance, logistics and evacuation. Added buildings consume real capacity. |
| **Jobs and users** | Anchor engineers, mages, skyship crews, dock workers, transit operators, maintenance, weather watchers, guards, logistics staff, builders and district residents/workers. |
| **Inputs** | Endgame materials, enormous power/mana, stabilisers, structural blocks, skyship components, logistics, specialist labour, maintenance parts and political authority. |
| **Outputs / services** | New buildable district space, air routes, sky trade, strategic mobility, prestige, unusual housing/industry and access to high-altitude or floating content. |
| **Required semantic plan/source contract** | Anchor sites, support/load graph, platform parcels, utility backbone, vertical transit, berths, freight/passenger separation, maintenance crawlways, weather sensors, emergency descent, refuge and exclusion airspace. |
| **Placement and utilities** | Requires clear airspace and compatible terrain/leyline/technology. Ground anchors and approach routes must avoid crushing existing districts, blocking flight or creating impossible evacuation. |
| **Official Blueprint Forge source** | Megaproject source graph for anchors, lift/stabilisation, platforms, utility spine, vertical transit, skyport berths, parcels, maintenance and emergency descent. Stable support/load elements allow staged occupancy, damage isolation, controlled evacuation and expansion. |
| **Construction / phasing profile** | Many subprojects: survey/airspace; ground anchor; energy plant; first lift/platform; stabilisers; utility spine; transit; initial parcels; skyport; redundancy; expansion platforms; commissioning. |
| **Upgrade and branch links** | Floating Residential District, Sky Industry, Airship Capital Port, Mobile Platform, Celestial Observatory City or inter-realm aerial nexus. |
| **Planner triggers and failure states** | Selected only when metropolis density, technology/magic, air routes or story goals justify extreme cost and risk. Failure may force evacuation, controlled descent, isolation or catastrophic regional events under severe conditions. |
| **Restricted player-source validation** | Must prove support/load budgets, redundancy, utilities, vertical logistics, evacuation, weather tolerance, maintenance access and staged occupancy. Visual levitation effects alone provide no structural capacity. |
| **Culture and style variation** | Rune-lifted island, chained sky citadel, crystal buoyancy platform, giant living canopy, dwarven suspended cavern, airship tower, celestial ring or storm-riding city. |

### 120. Culture Wonder or Leyline Crown

project.wonder.culture_wonder_leyline_crown

| **Catalogue role** | Wonder / Civilisation-Defining World Project \| Capital \| Megaproject \| Megaproject \| Final |
|---|---|
| **Need contribution** | Primary: Morale \| Secondary: Infrastructure, Safety, Work |
| **Purpose** | Represents a culture-defining civilisation achievement with bounded regional or world-state effects. The Leyline Crown is one branch; other cultures may build a world tree sanctuary, colossal archive, ancestral mountain, celestial forge or comparable wonder. |
| **Composition / modules** | Unique landmark core; public/ceremonial approach; specialist and maintenance spaces; supporting power/mana/logistics; archives or control; district and regional subprojects; story artefacts; optional pilgrimage, trade, research, defence or environmental components. |
| **Capacity / service** | Effects are authored, bounded and dependent on completed subprojects, maintenance, staffing, resources, ownership and world state. A wonder can provide prestige and one or more major services but cannot solve all seven needs. |
| **Jobs and users** | Architects, master builders, culture leaders, scholars, engineers, mages, artists, priests or equivalent practitioners, logisticians, guards, maintenance and visiting workers. |
| **Inputs** | Civilisation-scale quantities of resources, rare culture/realm materials, specialist labour, trade contracts, political support, story artefacts, power/mana and long-term maintenance. |
| **Outputs / services** | Culture identity, morale, tourism/pilgrimage, diplomacy, research, regional service or environmental change, story progression and a persistent world landmark. |
| **Required semantic plan/source contract** | Wonder boundary, core, subproject graph, ceremonial/public routes, control/maintenance, utility sources, safety and evacuation, regional anchors, effect profile, ownership, damage/corruption states and world-state links. |
| **Placement and utilities** | A unique strategic and symbolic site selected through culture, terrain, history, leylines, faction politics and world events. It should reshape planning but not invalidate surrounding settlements. |
| **Official Blueprint Forge source** | Unique wonder source graph containing landmark core, ceremonial/public approach, utility and logistics support, specialist spaces, regional anchors, effect profile, maintenance, capture, corruption and restoration states. Effects remain bounded and derive from completed functioning subprojects. |
| **Construction / phasing profile** | Long multi-era project: discovery/design; coalition and site; enabling infrastructure; foundations; major substructures; specialist works; regional links; cultural art/ritual; testing; partial effects; final commissioning and recurring ceremonies/maintenance. |
| **Upgrade and branch links** | Wonders normally evolve through restoration, additional wings, attunement, cultural succession, realm linkage or corruption/cleansing rather than a simple linear tier. |
| **Planner triggers and failure states** | Selected through capital status, culture story, major research, rare materials and political consensus or conquest. Rival factions may support, sabotage, contest or attempt to claim it. |
| **Restricted player-source validation** | Must define bounded effects, required subprojects, costs, maintenance, staff, world-state interactions, capture/damage/restoration and save-safe consequences. Size and rarity alone grant no global bonus. |
| **Culture and style variation** | Leyline Crown, World Tree Sanctuary, Grand Archive of Ages, Colossal Golem Foundry, Celestial Orrery, Ancestral Mountain Hall, Eternal Beacon, Dream Spire, Ocean Heart or culture-authored player wonder. |

# 27. Post-POC Alpha Implementation Scope

20F contributes no complete catalogue definition to the Technical POC Core, Raid Extension or Extended Forest Hamlet roster. Its systems should still be represented by reduced fixtures during those milestones so later city-scale work does not require a second planning architecture.

## 27.1 Technical and Forest Hamlet Fixtures

- Treat the existing hamlet as a small plan instance containing parcels, routes, public centre, construction sites and optional expansion reservations.
- Use the watchtower raid to test perimeter/evacuation coverage, project dependencies and damage-history references without creating the full Citadel definition.
- Use the Village Hall, market area and roads to test public/service route layers and a tiny shared civic-centre fixture without promoting catalogue definition 112.
- Verify that a player-authored compatible cottage or workshop can fill an approved parcel role through Document 19 restrictions.
- Preserve plan, parcel and subproject identities through save/load, damage, repair and Blueprint Forge rebake.

## 27.2 Alpha Slice A - Farmstead Cluster

The first complete 20F production target is catalogue definition 111, `plan.cluster.farmstead`.

Acceptance focus:

- Adaptive required/optional parcel roles.
- Farmhouse, field, barn/storage, water and route substitutions.
- Terrain adaptation across flat, river-edge and moderate-slope sites.
- Real construction order and partial activation.
- Shared storage and water without double-counting.
- Culture/biome material and layout resolution.
- NPC planner construction and restricted player-compatible variant.
- Save/load, damage, expansion and migration stability.

## 27.3 Alpha Slice B - Market Square and Civic Centre

The second complete target is catalogue definition 112, `plan.cluster.market_civic_centre`.

Acceptance focus:

- Public square and market-edge parcel roles.
- Hall/authority anchor, vendors, loading, storage, sanitation and emergency routes.
- Market-day/event dynamic state.
- Public, official, service and secure circulation.
- Shared capacity allocation and crowd/performance limits.
- Culture, faction and biome resolution.
- Player-created compatible stall/building sources.
- Damage, occupation and restoration.

## 27.4 Explicit Deferrals

- Full City Hall, Hospital Complex, University, Fort/Keep and campus production.
- Full artisan/residential district simulation.
- Regional multimodal transit nexus.
- Capital ward/portal nexus.
- Floating district and skyport.
- Full wonder effects and world-state transformation.
- Automatic generation of complete cities from one plan click.

These remain designed and registry-approved but should not displace the core survival, settlement, Forge and Forest Hamlet milestones.

# 28. Balancing, Performance and Simulation LOD

## 28.1 Balance Principles

- Plans reduce coordination cost; they do not multiply output for free.

- A district may improve travel and shared-service efficiency, but the benefit is bounded and must come from a valid layout or service.

- Required plan roles should be few and readable. Optional pools create variety.

- The planner should prefer completing, repairing or using existing capacity before endless sprawl.

- Organic settlements remain valid. Formal districts appear when scale and pressure justify them.

- Higher density increases land efficiency but also route, utility, safety and service demand.

- Large institutions require stable provisions, housing and staff support; they should not consume the entire settlement workforce.

- Megaprojects are long-term civilisation goals, not mandatory gates for ordinary play.

- Older districts and buildings can be renovated, repurposed or preserved rather than automatically demolished.

- Wonders have one clear identity and limited effect families. Maintenance and ownership matter.

- City growth must retain readable silhouettes, roads, landmarks and district identities.

- Player plans must not gain bonuses from excessive empty space, decorative block count or hidden inaccessible markers.

## 28.2 Performance Guards

- Plan validation and placement use bounded jobs with cancellation and progress reporting.
- A district source declares maximum parcels, nested sources, route elements, utility elements, state deltas and preview cost.
- Runtime uses compact plan/graph records rather than one active node per parcel, phase or semantic marker.
- Service coverage caches invalidate only when source, route, utility, capacity, damage or ownership changes.
- Far simulation batches travel, production, occupancy and project updates while preserving exact resources and named important NPCs.
- Megaproject effects use bounded regions and explicit linked targets rather than scanning the entire world.
- Forge validation warns when a plan exceeds target source, bake, runtime or save budgets.


# 29. Validation and Diagnostic Code Catalogue

| **Code** | **Severity** | **Meaning / Example Correction** |
|---|---|---|
| `D20F_PLAN_BOUNDARY_INVALID` | Blocker | Close or correct the plan boundary, vertical volume or adaptation envelope. |
| `D20F_REQUIRED_PARCEL_ROLE_MISSING` | Blocker | Add a valid parcel or approved substitution for the required role. |
| `D20F_PARCEL_ROLE_INCOMPATIBLE` | Blocker | Change the assigned source or parcel rules to a compatible role profile. |
| `D20F_PARCEL_OVERLAP` | Blocker | Resolve incompatible parcel, structure, protected-site or route overlap. |
| `D20F_ANCHOR_SOURCE_MISSING` | Blocker | Restore the referenced official or approved compatible source. |
| `D20F_NESTED_SOURCE_VERSION_MISMATCH` | Blocker | Rebind or migrate the nested source to a compatible approved version. |
| `D20F_ROUTE_SPINE_DISCONNECTED` | Blocker | Connect public/service/freight/emergency routes to required anchors. |
| `D20F_EMERGENCY_ROUTE_MISSING` | Blocker | Add a valid evacuation or emergency-response route for the selected profile. |
| `D20F_UTILITY_CAPACITY_MISSING` | Blocker | Add or upgrade the required water, sanitation, power, mana, logistics or waste capacity. |
| `D20F_SHARED_SERVICE_DOUBLE_COUNT` | Blocker | Allocate shared capacity once across consumers instead of duplicating it. |
| `D20F_DEPENDENCY_CYCLE` | Blocker | Remove or redesign circular hard prerequisites in the project graph. |
| `D20F_PHASE_ORPHAN_SUBPROJECT` | Blocker | Attach the subproject to a valid phase and dependency path. |
| `D20F_PARTIAL_ACTIVATION_UNSAFE` | Blocker | Add the missing route, utility, staff, safety or commissioning gate. |
| `D20F_TERRAIN_ADAPTATION_FAIL` | Blocker | Change the site, foundations, terraces, supports, bridges or allowed adaptation mode. |
| `D20F_PROTECTED_SITE_CONFLICT` | Blocker | Relocate, preserve or obtain explicit authored permission for the protected site. |
| `D20F_EXPANSION_CORRIDOR_BLOCKED` | Warning | Reserve or reroute the planned future road, utility or parcel connection. |
| `D20F_MIXED_USE_HAZARD_CONFLICT` | Blocker | Separate housing/public access from incompatible noise, fire, contamination or freight. |
| `D20F_ACCESS_ZONE_CONFLICT` | Blocker | Correct public, private, secure, service, ceremonial or hazard circulation. |
| `D20F_SUPPORT_LOAD_OVERLIMIT` | Blocker | Reduce floating/elevated load or increase validated anchors and redundancy. |
| `D20F_WONDER_EFFECT_UNBOUNDED` | Blocker | Define area, capacity, maintenance, stacking, ownership and failure behaviour. |
| `D20F_EFFECT_SOURCE_INACTIVE` | Runtime Warning | Restore the required completed subproject, staff, energy, ownership or maintenance. |
| `D20F_OCCUPATION_STATE_INCOMPLETE` | Blocker | Define access, authority, services, banners, resistance and restoration behaviour. |
| `D20F_RESTORATION_HISTORY_LOSS` | Blocker | Preserve origin source, owners, damage and historical state through conversion. |
| `D20F_STATE_DELTA_ORPHAN_ELEMENT` | Blocker | Repair dynamic-state references to stable plan, parcel, route or module IDs. |
| `D20F_BAKE_HASH_MISMATCH` | Blocker | Rebuild runtime plan products from matching approved source and dependencies. |
| `D20F_MIGRATION_PARCEL_LOST` | Blocker | Resolve the missing parcel or provide an explicit migration alias/replacement. |
| `D20F_RUNTIME_COMPONENT_DUPLICATE` | Blocker | Restore one authoritative structure instance per placed component. |
| `D20F_PLAN_BUDGET_EXCEEDED` | Warning/Blocker | Reduce parcel, module, state, graph or preview complexity for the target milestone. |

# 30. Open Questions for Later Balancing

These do not block Version 0.1:

1. Exact parcel-size bands and district caps by settlement stage.
2. How much coordination benefit clusters and districts provide.
3. Whether district boundaries are player-visible by default or only in planning overlays.
4. How organic roads are converted into formal route hierarchy.
5. Exact service-travel thresholds for clinics, markets, schools and emergency response.
6. How rent, property value or land price may work, if included at all.
7. How governance handles compulsory purchase, easements and relocation.
8. How many active construction phases a settlement can support.
9. How visiting workers are housed and fed during megaprojects.
10. Exact morale and political consequences of long unfinished projects.
11. Whether rival plans can be voted on or negotiated by NPC councils.
12. How district-level laws differ from settlement-wide laws.
13. How historical preservation affects upgrades and demolition.
14. How player-created wonders are moderated in multiplayer.
15. Exact bounded effect profiles for each universal wonder branch.
16. Whether a city can support multiple wonders and how stacking works.
17. How floating district mass, wind and weather are abstracted.
18. How damaged floating districts descend or evacuate safely.
19. How occupation changes city-hall, palace and wonder effects.
20. How much distant simulation can alter a player-designed layout.
21. Which capital complexes should receive unique universal definitions in later versions.
22. How random world events can propose or interrupt megaprojects.
23. How regional settlements contribute to a capital project.
24. Whether failed wonders can permanently alter biomes or dimensions.
25. Exact city performance budgets, resident caps and district-count settings.

# Appendix A. 20F Functional and Plan Field Template

| **Field** | **Purpose** |
|---|---|
| Stable ID and catalogue number | Immutable function/plan identity and 20H link. |
| Plan kind and owner | Building complex, cluster, district, campus, nexus, megaproject or wonder. |
| Earliest stage and delivery scope | Progression and production milestone. |
| Needs and planner class | Settlement contribution and project eligibility. |
| Required, optional and conditional roles | Component capabilities and substitutions. |
| Parcel and boundary profile | Footprint, height, density, frontage, access and expansion. |
| Route and utility spine | Public, service, freight, emergency, patrol, water, sanitation, power, mana and logistics. |
| Shared-service rules | Capacity allocation, double-count prevention, redundancy and service coverage. |
| Phase and dependency graph | Enabling works, subprojects, commissioning, partial activation and milestones. |
| Official Forge source profile | Nested sources, modules, material roles, states, terrain adaptation and dependencies. |
| Restricted player profile | Allowed creator controls, permissions and blocking validation. |
| Planner and construction rules | Site scoring, costs, labour, contracts, disruption and project selection. |
| Runtime/persistence profile | Parcels, component instances, occupancy, damage, effects, LOD and migration. |
| Diagnostics and tests | Validation codes, golden fixtures and acceptance criteria. |

# Appendix B. Plan-Kind and Capability Matrix

| **Plan Kind** | **Coordinates** | **May Add** | **Cannot Invent** |
|---|---|---|---|
| Cluster | Small related parcel/building group and shared yard/access. | Bounded travel or shared-space benefit. | Beds, jobs, output or storage absent from components. |
| District | Parcel pool, route hierarchy, utilities, services and expansion. | Bounded coordination and travel efficiency. | Automatic buildings, population or abstract service capacity. |
| Campus / Complex | Anchor institution plus support buildings, grounds and shared services. | Explicit shared-service efficiency and continuity. | Duplicate each component's capacity. |
| Nexus | Multiple transport/logistics/network modes and transfer buffers. | Transfer coordination and throughput within real links. | Teleportation or duplicated stock without valid portal contract. |
| Megaproject | Large subproject graph, contracts, milestones and commissioning. | Explicit regional capability from functioning nodes. | Instant completion or free resources. |
| Wonder | Unique project with bounded maintained influence and world history. | Authored regional/cultural effect. | Universal need satisfaction or unlimited global buffs. |

# Appendix C. Post-POC Alpha Acceptance Checklist

- [ ] The Forest Hamlet can be represented as a persistent plan instance without changing its existing building functions.
- [ ] Parcel, route, utility and subproject IDs survive save/load and deterministic rebake.
- [ ] Farmstead Cluster adapts to at least three representative terrains without invalid hidden capacity.
- [ ] Farmstead roles can be satisfied by official culture variants and an approved restricted player source.
- [ ] Farmstead partial activation provides only completed farm, water, storage and housing functions.
- [ ] Market Square and Civic Centre separates public, service, official and emergency circulation.
- [ ] Market event states do not duplicate inventories, vendors or public capacity.
- [ ] Shared water, storage, sanitation and route capacity is allocated once and exposes bottlenecks.
- [ ] NPC planners can select, phase, build, commission, expand and repair both Alpha plans.
- [ ] Damage, occupation and restoration preserve original source and project history.
- [ ] Culture/biome pack changes rebake deterministic presentation without replacing stable function IDs.
- [ ] Far simulation preserves parcels, structures, people, resources, projects, damage and history.
- [ ] Restricted player plans cannot alter universal effects, registry IDs, migration or server authority.
- [ ] Forge Test Laboratory reports clear diagnostics for invalid parcels, routes, utilities, phases and terrain adaptation.

# Appendix D. Cross-System Dependency Matrix

| **20F Area** | **Primary Dependencies** | **Required Contract** |
|---|---|---|
| Parcels and settlement growth | 07 NPC, 11 Worldgen, 19 Player Settlement | Ownership, land, roles, access, adaptation, occupancy and expansion. |
| Buildings and services | 20A-20E, 12 Structures | Valid component sources, runtime instances, staff, resources, networks and condition. |
| Routes and utilities | 20D, 20E, 08 Automation | Typed graphs, capacities, weakest links, loading, maintenance and redundancy. |
| Defence and emergencies | 20C, 16 Combat | Perimeter, gates, patrol, refuge, evacuation, stores, damage and siege. |
| Culture and realm composition | 13-14, 20G | Pack resolution, materials, layout preferences, laws, physical rules and signature content. |
| Entities and navigation | 07 NPC, 22 Entity Forge | Body-profile clearance, jobs, interaction points, crowds, mounts and simulation LOD. |
| Blueprint Forge | 22I-22L | Source graph, nested modules, lifecycle, validation, bake, migration and production sequencing. |
| Events and world state | 15 Quests/Events | Milestones, contracts, sabotage, ceremonies, capture, disasters and persistent consequences. |

# Appendix E. Suggested Godot Resources and Runtime Records

| **Type** | **Key Fields** |
|---|---|
| `SettlementPlanDefinition` | ID, plan kind, stage, needs, roles, substitutions, planner profile and validation profile. |
| `ForgePlanSource` | Source ID/version, boundary, parcels, anchors, routes, utilities, modules, phases, states, placement and dependencies. |
| `PlanBakeProduct` | Hash, resolved parcels, graphs, coverage, placement candidates, commissioning gates and diagnostics. |
| `ParcelRuntimeRecord` | ULID, plan, role, owner, location, source/structure, access, services, state and history. |
| `PlanRuntimeRecord` | ULID, definition/source, parcels, structures, services, occupancy, projects, condition, effects and history. |
| `ProjectGraphRecord` | Subprojects, dependencies, reservations, labour, contracts, contributors, milestones and blockers. |
| `MegaprojectRuntimeRecord` | Political support, sites, contracts, milestones, disruption, incidents, effects and maintenance. |
| `WonderEffectProfile` | Area, targets, capacity, maintenance, stacking, ownership, capture, damage and world-state hooks. |
| `TerrainAdaptationRecord` | Source transform, foundations, cuts/fills, retaining, bridges, anchors and migration references. |
| `PlanMigrationMap` | Source, parcel, module, route, utility and phase aliases/replacements. |

---

**End of Document 20F - Districts, Complexes, Megaprojects and Wonders - Version 0.2**
