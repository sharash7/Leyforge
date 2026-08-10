# FANTASY VOXEL CIVILISATION SANDBOX

## DOCUMENT SET 26

# 26J - Ports, Harbours, Shipyards, Crews and Maritime Civilisation

*Version 0.1 - Detailed Design Bible and Technical Foundation Draft*

A civilisation-scale maritime framework for ports, natural harbours, anchorages, docks, quays, shipyards, warehouses, harbour services, navigation networks, rescue infrastructure, maritime jobs, persistent crews, NPC vessel construction, port calls, settlement growth, simulation LOD and production integration.

Working design document - maritime settlement, port-service, crew and NPC shipbuilding foundation

| Field | Locked Direction |
| --- | --- |
| Document Role | Document 26J is the gameplay and data-contract authority for ports, harbours, shipyards, maritime facilities, port services, maritime jobs, crew organisation, NPC shipbuilding intake, port calls and maritime-settlement capability. |
| Core Philosophy | A port is not waterfront scenery and a crew is not an invisible vessel statistic. Maritime civilisation exists only when physical structures, safe approaches, people, supplies, permissions, services, routes and persistent world state connect. |
| Settlement Direction | Maritime development overlays the existing Camp-to-Magical-Metropolis settlement ladder. Port capability is a separate profile; it does not replace the seven settlement needs or create a detached zone-based city simulator. |
| Port Direction | Use a network of Harbour Instances, Port Nodes, Approach Channels, Anchorages, Berths, Facilities and Service Instances. Each exposes explicit capacity, environmental limits, staffing, stock, permissions, condition and route relationships. |
| Shipyard Direction | NPC and player shipyards consume exact resources and use 26I-approved vessel blueprints through 26H construction projects. No functional vessel appears merely because a decorative hull or abstract production timer exists. |
| Crew Direction | Use a hybrid persistent crew model. Important officers, specialists and interacted sailors remain named individuals; ordinary low-importance crew may use bounded cohort records at distance and promote to individuals when simulation or story requires it. |
| Station Direction | Crew effectiveness comes from reachable vessel stations, relevant skills, tools, health, fatigue, authority and supplies. A listed job title alone provides no vessel capability. |
| Command Direction | Players directly control a vessel from valid stations or issue readable high-level orders to assigned crew. The system avoids mandatory minute-by-minute crew micromanagement while preserving shortages, mistakes, fatigue and specialisation. |
| Resource Direction | Construction, repair, provisioning, fuel, freshwater, food, medicine, rope, cloth, sealant, ammunition, mana and cargo use normal authoritative inventories and transactions. Decorative props never create stock or service capacity. |
| Route Boundary | 26J defines port endpoints, safe approach support, berth/service capacity and port-call execution. 26K owns route economies, fleets, piracy, navies, trade competition, blockades and regional maritime power. |
| Content Boundary | Atlas Set 24 owns named cultures, regions, settlements and authored maritime content. 26J defines executable maritime-civilisation contracts and may not overwrite Atlas canon or invent final content rosters. |
| Technical Direction | Implement in Godot with GDScript-first data/services and Summer Engine-assisted development under reviewable changes. Nearby ports and crews are physical; distant operations use deterministic summaries preserving identity and resources. |
| Production Direction | All definitions use Set 25 qualified IDs, schemas, relationships, capability contracts, pack manifests, migration rules, validation evidence and release gates. Detailed maritime registry population remains coordinated with 26N. |

# DOCUMENT SET 26 - OCEANS, MARITIME CIVILISATION, VESSELS AND NAVAL SYSTEMS EXPANSION

# Document Purpose

Document 26J defines the civilisation systems that allow Leyforge's oceans and vessels to matter beyond personal travel. It turns suitable coasts, rivers and islands into living maritime places where vessels can approach, anchor, berth, load, repair, provision, recruit, receive orders, survive emergencies and become part of settlement growth. It also defines the people who operate those systems: shipwrights, harbourmasters, pilots, sailors, captains, navigators, quartermasters, engineers, dockworkers, fishers, divers, salvagers and supporting trades.

The document consumes the environmental, vessel and Forge foundations established by 26B-26I. Document 26C determines the generated marine region, coast, depth, harbour suitability and route context. Document 26D determines wind, waves, tides, currents, storms, visibility and ice. Documents 26F-26G determine whether a vessel structurally exists and can operate. Documents 26H-26I determine how vessels are built and which reusable designs a shipyard may use. Document 26J connects those systems to settlements, NPC labour, services, permissions, inventories and persistent world history.

The system must preserve Leyforge's living-world promise. A shipyard cannot produce vessels from an abstract progress bar while timber, rope, tools and workers are absent. A harbour cannot safely service deep-draft ships merely because a building is labelled Port. A crew cannot sail through a storm because a captain NPC exists somewhere in the settlement. Capability must be resolved through physical and semantic evidence that players can inspect and improve.

Maritime civilisation is also broader than commerce or warfare. A port may sustain fishing, ferries, rescue, migration, research, pilgrimage, exploration, salvage, diplomacy, realm travel, coast defence or cultural life. Document 26J establishes the shared port and crew foundation for these uses while deferring route-market simulation and regional fleet conflict to 26K, naval combat execution to 26L, marine ecology and fishing content to 26M, detailed progression and registry population to 26N, and final UI/technical consolidation to 26O.

# Design Sources, Authority and Supersession

| Source | Authority Consumed by 26J | 26J Boundary |
| --- | --- | --- |
| 00-02 - Master, Loop and Progression | Sandbox freedom, living civilisations, interconnection, classless growth and multiple valid playstyles. | Maritime life becomes an additional connected path, not a mandatory replacement for land progression. |
| 07 - NPC Village System | Persistent NPCs, jobs, schedules, inventories, needs, projects, reputation, permissions and simulation LOD. | 26J extends these contracts with maritime jobs, crews, port services and voyage-facing state. |
| 11-12 - Worldgen and Structures | Coastal terrain, water, roads, structures, ownership, damage, restoration and generated placement. | 26J defines operational port/harbour structures; world placement still consumes 26C and general structure rules. |
| 19-20 - Settlement and Building Systems | Seven needs, universal functions, Blueprint Forge source, projects, instances, staffing, resources and activation contracts. | Maritime facilities are functional building/service definitions using the same separation and do not create abstract city zones. |
| 24C/24E/24I - Atlas Marine, Peoples and Structures | Authored marine environments, cultures, factions, named places and structure context. | 26J operationalises eligible content without becoming lore authority. |
| 25A-25L - Production Governance | Qualified IDs, schemas, capabilities, packs, validation, scope, budgets, backlog and source integrity. | All 26J records and extensions must enter through these contracts. |
| 26B - Water and Fluids | Water-body identity, local fluids, pumps, containment, contamination and flooding. | Ports consume fluid queries and infrastructure; 26B remains water truth. |
| 26C - Marine World Generation | Harbour suitability, coasts, depth bands, route graphs, islands, freshwater and structure sockets. | 26J binds Port Instances to generated contexts and may request bounded terrain works; it does not regenerate marine geography. |
| 26D - Marine Climate | Tides, currents, waves, storms, fog, ice, forecasts and warnings. | 26J owns port response, service limits and warning use; 26D owns environmental state. |
| 26E - Aquatic Interaction | Swimming, diving, rescue, ladders, underwater work and accessibility. | Port access and rescue markers must be compatible; character movement remains 26E-owned. |
| 26F-26G - Vessel Architecture and Movement | Vessel identity, structure, compartments, mass, draft, stability, propulsion, steering and certification. | Ports query actual vessel characteristics and certification; they never infer capability from visual size alone. |
| 26H - Shipwright Work | Worksites, shipyard tools, construction, repair, refit, salvage and labour execution. | 26J owns facility/service availability and NPC orders; 26H owns task execution. |
| 26I - Vessel Forge | Approved vessel designs, procedural families, stages, variants and construction intake. | 26J selects compatible approved revisions and profiles; it does not edit Forge source at runtime. |
| 26K-26O - Later Maritime Documents | Trade/fleets/power, combat, ecology, progression/registries and technical/UI integration. | 26J provides explicit handoff contracts and avoids pre-empting their detailed rules. |

> **Supersession Rule**
>
> Any earlier rule that treats a port as a decorative structure, a crew as a single vessel stat, or NPC shipbuilding as an uncosted spawn is superseded. Existing generic settlement, job, project, inventory, structure and simulation contracts remain valid and are extended rather than duplicated.

# Static Table of Contents

1. Locked Maritime Civilisation Identity
2. Design Principles and Experience Targets
3. Explicit Non-Goals
4. Source-of-Truth and Ownership Boundaries
5. Canonical Terminology
6. Record Architecture and Data Separation
7. Maritime Settlement and Port Capability Bands
8. Port Formation, Recognition and Lifecycle
9. Harbour Site Evaluation and Generated Context
10. Port Nodes, Zones and Connectivity
11. Anchorages, Moorings, Berths, Piers, Quays and Docks
12. Approach Channels, Depth, Tides and Pilotage
13. Breakwaters, Sea Walls, Dredging and Harbour Works
14. Port Facility and Service Taxonomy
15. Warehouses, Cargo Interfaces and Logistics
16. Provisioning, Freshwater, Fuel, Mana and Consumables
17. Shipyards, Slipways, Dry Docks and Production Capacity
18. NPC Vessel Orders, Selection and Construction Intake
19. Vessel Launch, Commissioning, Acceptance and Readiness
20. Repair, Refit, Salvage and Lay-Up Services
21. Lighthouses, Beacons, Signals, Charts and Harbour Information
22. Rescue, Fire, Medical, Quarantine and Emergency Services
23. Harbour Authority, Access, Law, Customs and Permissions
24. Maritime Jobs, Professions and Skill Families
25. Crew Architecture and Persistent Crew Records
26. Crew Stations, Manning and Vessel Capability
27. Recruitment, Contracts, Pay, Obligations and Reputation
28. Training, Experience, Fatigue, Health, Morale and Discipline
29. Watches, Schedules, Shore Leave and Crew Accommodation
30. Command, Orders, Delegation and Player Control Boundaries
31. Crew Profiles by Vessel Role and Scale
32. Port Calls, Turnaround and Service Transactions
33. NPC Vessel Use, Voyages and Distant Operation Boundary
34. Seven Settlement Needs and Maritime Capability
35. Maritime Districts, Growth and Settlement Planning
36. Culture, Faction, Biome and Realm Adaptation
37. Automation, Magic, Golems and Specialist Infrastructure
38. Incidents, Disasters, Damage and Persistent Aftermath
39. Difficulty, Accessibility and World Settings
40. Simulation LOD, Persistence and Promotion/Demotion
41. Multiplayer Authority, Ownership and Contribution
42. UI/UX Requirements and Player Feedback
43. Godot/Summer Engine Technical Architecture
44. Set 25 Schemas, Relationships, Capabilities and Packs
45. Validation, Reason Codes, Evidence and Release Gates
46. Prototype Laboratories and Acceptance Tests
47. Performance, Scalability and Production Budgets
48. Staged Implementation Plan
49. Cross-Document Integration and Main-Document Amendments
50. Formal Handoff to 26K
- Appendix A. Port, Harbour and Facility Record Templates
- Appendix B. Crew, Job, Contract and Assignment Templates
- Appendix C. Shipyard Order and Port-Call Templates
- Appendix D. Capability and Service Catalogue
- Appendix E. Validation and Reason-Code Catalogue
- Appendix F. Example Port Profiles
- Appendix G. Completion Checklist

# 1. Locked Maritime Civilisation Identity

The Ports, Harbours, Shipyards, Crews and Maritime Civilisation System is the social and infrastructural layer that converts water access into persistent civilisation capability. It defines where vessels can safely arrive, what services exist, who performs them, which resources are consumed, how settlements benefit, and how maritime people remain part of the same living NPC world as farmers, builders, guards, merchants and mages.

> **Locked Rule**
>
> A waterfront structure provides no maritime capability merely because it resembles a dock, warehouse or lighthouse. Capability activates only when the resolved site, physical structure, route, berth, staff, tools, stock, networks, permissions, environmental window and condition satisfy its declared contract.

| Identity Layer | Design Meaning | Player-Facing Result |
| --- | --- | --- |
| Living Port | Berths, facilities, workers, storage, routes and authorities form an operational network. | Players can read why a port functions, what it lacks and how it changes a settlement. |
| Physical Maritime Economy | Cargo, provisions, tools, fuel and vessel materials are real items in real stores. | Ships and ports visibly depend on production rather than invisible bonuses. |
| Persistent Crews | Important sailors have identity, jobs, skills, needs, relationships, injuries and history. | Vessels feel inhabited and loss, success or loyalty matters. |
| Civilisation Growth | Maritime capability contributes to existing settlement needs, jobs, safety, infrastructure and culture. | Coastal settlements develop distinct strengths without using a separate city game. |
| World Connectivity | Ports connect water routes to roads, warehouses, villages, islands, realms and rescue networks. | Geography changes trade, migration, exploration and regional opportunity. |
| Risk and Recovery | Storms, fires, wrecks, shortages, disease, conflict and neglect leave persistent aftermath. | Preparation, maintenance and emergency services change outcomes. |
| Scalable Simulation | Nearby operations are physical; distant ports and voyages use bounded summaries. | Large maritime worlds remain possible while important people and ships keep identity. |

# 2. Design Principles and Experience Targets

- **World-first readability:** silhouettes, channel markers, cranes, lights, smoke, bells, flags, worker movement and vessel traffic communicate port state before menus are opened.
- **No abstract capability from appearance:** activation contracts determine services and settlement contribution.
- **Same-world consistency:** maritime workers use the same NPC identity, needs, inventory, job, project, reputation and consequence systems as land workers.
- **Player freedom:** players may found, support, visit, ignore, exploit, blockade, conquer, restore or specialise ports subject to later faction and conflict rules.
- **Bounded management:** high-level service and crew orders are available; routine tasks may be delegated without erasing resource shortages or worker limits.
- **Seed-responsive geography:** good harbours are valuable, poor coasts remain usable through smaller facilities or expensive works, and no fixed POC port is guaranteed.
- **Culture without biological determinism:** maritime architecture, law, labour and navigation traditions belong to culture/faction/history, not ancestry stereotypes.
- **Graceful absence:** worlds or packs without advanced maritime content remain valid; required base progression cannot silently depend on optional ports.
- **Persistent provenance:** every built, generated, repaired, salvaged or transferred vessel and facility records how it entered the world.
- **Production restraint:** capability bands, reusable families and variants prevent every waterfront settlement from needing a unique code path.

## 2.1 Player Experience Bands

| Band | Expected Experience |
| --- | --- |
| Arrival | Identify safe water, approach markers, berth availability, port authority and immediate hazards. |
| Service | Request mooring, unload cargo, provision, repair, recruit, gather information or accept a local contract. |
| Ownership | Build or improve waterfront facilities, assign staff, set permissions and connect storage/logistics. |
| Shipbuilding | Select an approved design, reserve materials, support shipwrights, inspect stages and launch a real vessel. |
| Crew Leadership | Recruit a suitable crew, assign roles, set watches, manage readiness and respond to incidents. |
| Settlement Development | Use maritime capability to improve the seven needs, unlock specialists and shape local identity. |
| Regional Influence | Provide the port endpoint and service capacity later used by fleets, trade, diplomacy, piracy and naval power. |

# 3. Explicit Non-Goals

- Creating a separate maritime population simulator disconnected from Document 07.
- Replacing Camp-to-Magical-Metropolis growth with a port-only settlement ladder.
- Allowing a single Port Level number to substitute for structures, services, people or resources.
- Spawning NPC vessels without blueprint provenance, resource cost, construction history or an explicit worldgen exception.
- Defining final trade prices, route profitability, tariffs, fleet missions, piracy, privateering, blockades or naval strategy; these belong primarily to 26K and 26N.
- Defining naval weapon operation or boarding combat; these belong to 26L.
- Defining the complete fishing and marine-harvest system; this belongs to 26M.
- Requiring players to individually schedule every sailor task, meal, rope adjustment or crate movement.
- Simulating every distant dockworker and cargo item as a full actor.
- Assuming all cultures use historical Earth port layouts, ranks or maritime law.
- Promising that every coastline can support every vessel class at reasonable cost.
- Allowing decorative cargo, crew props or docked ships to create authoritative stock, labour or transport capacity.

# 4. Source-of-Truth and Ownership Boundaries

| Truth | Owning Authority | 26J Rights |
| --- | --- | --- |
| Named marine regions, cultures, factions and places | Atlas and approved content sources. | Reference and operationalise eligible definitions. |
| Water-body, coast, seafloor and harbour-suitability context | 26B-26C. | Bind Port/Harbour Instances and request approved local works. |
| Weather, tide, current, wave, storm, fog and ice state | 26D. | Apply service limits, warnings and incident response. |
| Vessel structure, identity and compartments | 26F. | Query vessel characteristics and bind berth/crew/service records. |
| Vessel movement and operational certification | 26G. | Use draft, handling, propulsion and certification data for access/readiness. |
| Shipwright task execution, repair/refit/salvage work | 26H. | Provide sites, services, staff, orders and stock. |
| Vessel blueprint and procedural-family source | 26I. | Select approved immutable revisions and profiles. |
| Settlement needs, residents and generic jobs | 07/19/20. | Add maritime facets, services, jobs and capability contributions. |
| Route economy, fleets, piracy, navies and regional power | 26K. | Expose port nodes, service capacity, crew and vessel readiness endpoints. |
| Naval combat and boarding | 26L. | Expose stations, port defences and aftermath interfaces only. |
| Marine ecology and fishing content | 26M. | Expose port and crew service interfaces. |
| Maritime progression and detailed registries | 26N. | Provide approved definitions, relationships and requirements for registry population. |
| Final UI, multiplayer and technical consolidation | 26O. | Specify domain requirements and preliminary service architecture. |

> **Boundary Test**
>
> When a rule answers what a port or crew can provide and what it requires, 26J usually owns the contract. When it answers where an ocean exists, how a vessel moves, what a route earns, how a cannon damages a hull or which fish inhabits a reef, another Set 26 document owns the truth.

# 5. Canonical Terminology

| Term | Definition |
| --- | --- |
| Harbour | A naturally or artificially sheltered water space with approach, anchorage and service context. A harbour may exist without a settlement. |
| Port | An operational maritime settlement/service network using one or more harbours, riverbanks, canals or offshore facilities. |
| Port Node | Stable route/service endpoint representing access to a Port Instance at a specific water/land interface. |
| Harbour Instance | Persistent binding between generated marine context and operational harbour state. |
| Approach Channel | Validated route segment from navigable water to an anchorage or berth with depth, width, clearance, tide and hazard limits. |
| Anchorage | Area where eligible vessels may safely anchor under declared conditions. |
| Mooring | Fixed or managed attachment point or field for holding vessels. |
| Berth | Assigned vessel position with access, depth, clearance, load and service contracts. |
| Pier/Jetty | Projecting access structure supporting berths or landings. |
| Quay/Wharf | Shore-parallel loading and vessel-access structure. |
| Dock | Context-sensitive physical/service area for berthing, loading, repair or protected water; exact subtype must be declared. |
| Shipyard | Facility network able to construct, repair, refit, haul or service vessels within capability limits. |
| Port Facility | Physical Structure Instance providing one or more maritime functions when activated. |
| Port Service | Current service offer resolved from facilities, staff, stock, networks, access, permissions and condition. |
| Harbour Authority | Settlement/faction/owner record responsible for operational rules, access, safety and enforcement. |
| Crew | Persistent group assigned to a vessel, port service or voyage under a Crew Record. |
| Crew Cohort | Bounded grouped representation for ordinary low-importance crew in distant simulation; promotable to named NPCs. |
| Officer/Specialist | Named persistent crew member holding command, navigation, engineering, medical or other high-impact authority. |
| Station Assignment | Binding between an NPC/crew slot and a reachable vessel or port station. |
| Safe Manning | Minimum current crew/station coverage required for a declared operation under stated conditions. |
| Effective Manning | Crew level allowing normal performance without severe workload/fatigue penalties. |
| Port Call | Persistent transaction/event record for arrival, clearance, berth, services, cargo/people transfer and departure. |
| Maritime Capability Profile | Port-facing capability offers, constraints and limits separate from settlement stage. |
| Turnaround | Time and work from arrival readiness to departure readiness. |
| Home Port | Port relationship used for maintenance, crew administration, records and default support; not permanent ownership. |

# 6. Record Architecture and Data Separation

| Record | Purpose | Authority/Mutability |
| --- | --- | --- |
| Port Definition | Universal maritime function and capability profile independent of one location. | Versioned definition. |
| Harbour Instance | Generated/constructed harbour context, condition, channels, hazards and history. | Persistent runtime state. |
| Port Instance | Operational settlement/service network and ownership binding. | Persistent runtime state. |
| Port Node | Route endpoint, water/land interfaces and discovery/access state. | Persistent generated/runtime binding. |
| Facility Definition | Universal maritime facility function, activation contract and service facets. | Versioned definition owned with Document 20 extensions. |
| Facility Blueprint | Editable voxel/semantic source authored in Blueprint Forge. | Immutable approved revision; Sets 21-23/20. |
| Facility Instance | Placed physical facility with staff, stock, networks, condition and local deltas. | Persistent runtime state. |
| Berth Record | Depth, dimensions, access, service connections, assignment, restrictions and condition. | Persistent runtime state. |
| Port Service Instance | Resolved current service capacity, queue, limits, price/policy references and blockers. | Runtime calculated/persisted where needed. |
| Shipyard Instance | Facility network, work areas, staff, tools, stock, production queue and supported vessel profiles. | Persistent runtime state. |
| Vessel Production Order | Approved request selecting a blueprint revision, purpose, client, priority, materials and acceptance profile. | Persistent project-intake record. |
| Crew Record | Crew identity, membership, hierarchy, contracts, readiness, morale, history and vessel assignment. | Persistent runtime state. |
| Crew Assignment | NPC/cohort-to-role/station/watch binding. | Mutable authoritative state. |
| Port Call Record | Arrival, authority, vessel, berth, services, transfers, incidents and departure. | Persistent history/transaction state. |
| Harbour Incident Record | Storm, collision, fire, grounding, contamination, rescue or security event. | Persistent event/history state. |
| Distant Port Summary | Bounded capacity, stock, workforce, queue, condition, risk and activity totals. | Derived/persisted simulation state. |

## 6.1 Definition, Blueprint, Project and Instance Rule

A universal Dry Dock definition states what the facility means. Blueprint Forge stores an editable culture-specific dry-dock structure. A construction project reserves resources and builds it at a surveyed site. A Facility Instance records the completed dock, current gate, pumps, workers, damage and service queue. A Port Service Instance then calculates whether dry-dock service is presently available. These records must never be collapsed into one mutable object.

# 7. Maritime Settlement and Port Capability Bands

Port capability is evaluated separately from settlement stage. A small island village may operate an exceptional sheltered harbour, while a large inland city may have no maritime capability. The following bands are planning and capability categories, not automatic levels or mandatory linear upgrades.

| Band | Working Name | Typical Capability | Not Guaranteed |
| --- | --- | --- | --- |
| P0 | Water Access | Beach landing, ford, riverbank or temporary small-craft access. | Permanent berth, shelter or services. |
| P1 | Landing and Anchorage | Simple jetty/landing, known anchorage, basic signals and manual cargo transfer. | All-tide access, repair or formal authority. |
| P2 | Sheltered Harbour | Managed moorings, small berths, local storage, pilot knowledge, rescue and small-vessel support. | Ocean-going shipyard or heavy cargo handling. |
| P3 | Working Port | Multiple berths, warehouses, harbour authority, provisioning, repairs, fish/cargo handling and route support. | Major vessels, deep-water access or strategic fleet support. |
| P4 | Regional Harbour | Specialised shipyard, dry-dock/haul capability, lighthouses, customs, medical/quarantine and route coordination. | Every advanced magical or military service. |
| P5 | Major Ocean Port | Deep approaches, heavy handling, major ship construction, broad services, large crew market and resilient harbour works. | Maritime-capital status or realm access. |
| P6 | Maritime Capital / Realm Gateway | Civilisation-scale maritime administration, specialist academies, grand shipyards, high-capacity logistics and optional realm-linked infrastructure. | Universal safety, infinite capacity or automatic political dominance. |

> **Band Rule**
>
> A Port Instance receives a band only as a summary of its resolved capabilities. The band never grants missing structures, workers, depth, stock or permissions. Individual services retain their own capability limits and may be damaged or unavailable.

# 8. Port Formation, Recognition and Lifecycle

| Lifecycle State | Meaning |
| --- | --- |
| Potential Site | Generated location has water/land suitability but no recognised maritime function. |
| Landing | Repeated or constructed small-craft use creates a known access point. |
| Recognised Anchorage | Safe-use evidence, markers or local knowledge establish an anchorage. |
| Developing Harbour | Projects add shelter, access, storage, authority or service facilities. |
| Operational Port | Minimum port activation contract is met and a Port Instance is registered. |
| Expanding Port | Facilities, workforce, channels and route relationships increase. |
| Constrained Port | Capacity blocked by depth, silt, damage, labour, law, route loss or environment. |
| Damaged/Emergency Port | Incident reduces access/services and activates recovery priorities. |
| Occupied/Contested Port | Ownership or access is disputed; service state depends on law/conflict systems. |
| Declining Port | Routes, population, resources or maintenance fall below sustainable operation. |
| Abandoned Port | No operational authority/services; structures and history persist. |
| Restored/Converted Port | A former port is repaired or assigned a new compatible purpose. |

## 8.1 Port Recognition Contract

- At least one valid Port Node connected to a Water Body or navigable route.
- At least one safe access method for the declared vessel band under stated conditions.
- A recognised authority/owner or explicit ungoverned status.
- One physical landing, anchorage or berth service.
- A route from water access to at least one storage, settlement or service point.
- Inspectable current condition, environmental restrictions and permissions.
- Persistent identity, history and source provenance.

# 9. Harbour Site Evaluation and Generated Context

| Input | Source | Use in 26J |
| --- | --- | --- |
| Water Body and Marine Region | 26B/26C | Harbour identity, salinity, water level, route scope and environmental context. |
| Coast Segment / Riverbank | 26C | Shore morphology, sediment, erosion, freshwater, exposure and build constraints. |
| Bathymetry and Seafloor | 26C | Approach depth, berth depth, anchor holding, dredging and foundation feasibility. |
| Fetch and Exposure | 26C/26D | Wave shelter, breakwater demand and service limits. |
| Tides and Currents | 26D | Tidal windows, under-keel clearance, mooring loads and pilot requirements. |
| Storm/Swell/Ice Susceptibility | 26D | Harbour works, seasonal closure, emergency plans and maintenance. |
| Freshwater and Land Access | 26C/settlement | Provisioning, population support, roads and logistics. |
| Terrain, Claims and Protected Edits | 11/19/20 | Project surveys, land ownership, heritage and player-edit protection. |
| Culture/Faction Context | 13/24 | Architecture, law, labour traditions, approved services and authority. |
| Ecology/Heritage Constraints | 24/26M | Dredging, pollution, sacred areas, spawning grounds and salvage restrictions. |

## 9.1 Suitability Outcomes

| Outcome | Meaning |
| --- | --- |
| Naturally Excellent | Shelter, depth, land access and approach support broad capability with limited works. |
| Suitable with Works | Viable after breakwater, dredging, piers, causeways, retaining or other projects. |
| Limited/Specialised | Supports small craft, tidal use, seasonal use or one specialist service. |
| Unsafe for Permanent Port | May support emergency landing or temporary anchorage only. |
| Protected/Forbidden | Ecology, culture, law, magic, hazard or world rules exclude construction/use. |

# 10. Port Nodes, Zones and Connectivity

A Port Instance is a graph rather than one building. Port Nodes and typed routes connect water approaches, berths, facilities, storage, roads, settlement districts and emergency areas. Zones assist planning and validation but do not create population, stock or services by themselves.

| Node/Zone | Purpose |
| --- | --- |
| Seaward Approach Node | Connects regional route graph to harbour approach. |
| Pilot Boarding Node | Safe location for pilot transfer where required. |
| Anchorage Zone | Permitted holding area with depth, shelter and capacity. |
| Berth/Mooring Node | Assigned vessel interface with physical connectors and restrictions. |
| Cargo Transfer Zone | Crane, ramp, conveyor, labour and temporary staging area. |
| Passenger Landing Zone | Safe embark/disembark, queues, shelter and accessibility path. |
| Shipyard Work Zone | 26H worksite-compatible berth, slip, dock or support area. |
| Hazardous Goods Zone | Separated storage/transfer under declared safety rules. |
| Customs/Inspection Zone | Authority, document, quarantine and inspection interfaces. |
| Rescue/Emergency Zone | Launch, treatment, muster, firefighting and evacuation access. |
| Land Logistics Node | Connects port to road, rail, canal, automation or settlement storage. |
| Public Waterfront Zone | Markets, services and morale spaces that remain distinct from operational work zones. |

# 11. Anchorages, Moorings, Berths, Piers, Quays and Docks

| Interface | Core Fields | Operational Risks |
| --- | --- | --- |
| Open Anchorage | Boundary, holding ground, depth, swing radius, weather limits, capacity, access law. | Drag, collision, exposure, poor rescue access. |
| Sheltered Anchorage | Shelter profile, depth, markers, tender access, authority. | Congestion, silt, tide/current constraints. |
| Mooring Buoy/Pile | Load band, attachment types, inspection, owner, service access. | Failure, chafe, incompatible vessel loads. |
| Jetty/Pier Berth | Length, depth, clearance, fenders, ladders, utilities, route capacity. | Wave motion, fire, crowding, structural damage. |
| Quay/Wharf Berth | Edge length, deck load, cranes, warehouses, water access and security. | Overloading, collision, blocked land routes. |
| Floating Dock/Pontoon | Buoyancy, joints, tide range, access gangways and load limits. | Storm detachment, instability, ice. |
| Tidal Berth | Drying support, bottom type, tide windows and vessel suitability. | Grounding damage, missed departure window. |
| Canal/River Berth | Current, bank stability, locks/bridges, width and passing limits. | Flood, bank erosion, navigation blockage. |
| Offshore Platform Berth | Wave/current limits, transfer systems, emergency refuge and route. | Isolation, severe-weather closure. |

## 11.1 Berth Compatibility

Berth assignment compares actual vessel draft, length, beam, height/overhead clearance, displacement, fender/attachment needs, boarding interfaces, hazardous state, propulsion restrictions, certification and current environment. A vessel class name or blueprint family is never sufficient by itself.

# 12. Approach Channels, Depth, Tides and Pilotage

| Requirement | Rule |
| --- | --- |
| Under-Keel Clearance | Use actual loaded draft plus sea-state/tide/squat safety allowance from 26G/26D profiles. |
| Channel Width | Depends on vessel beam, handling, traffic direction, current, wind, bank effects and assistance. |
| Overhead Clearance | Bridges, cables, gates, ice and magical fields must be checked against current vessel height/configuration. |
| Tidal Window | A time-bounded access condition calculated from 26D tide predictions and uncertainty. |
| Pilot Requirement | May be imposed by port law, vessel band, local complexity, visibility, damage or captain knowledge. |
| Tow/Tug Assistance | Required when vessel manoeuvrability, current, berth, damage or port rules exceed safe self-control. |
| Closure | Authority may close channels for storm, wreck, works, contamination, conflict or insufficient navigation support. |
| Explainability | Rejected access must name the limiting segment, current value, required value and potential alternatives. |

## 12.1 Local Maritime Knowledge

Pilots and experienced local navigators provide knowledge capability, not magical immunity. Their value may include hazard confidence, tidal timing, route choice, signal interpretation and berth manoeuvre assistance. Unknown or changed conditions reduce confidence and may require survey, sounding or escort.

# 13. Breakwaters, Sea Walls, Dredging and Harbour Works

| Work | Function | Persistent Consequence |
| --- | --- | --- |
| Breakwater | Reduces wave exposure for defined directions/conditions. | Can alter sediment, ecology, navigation and maintenance demand. |
| Sea Wall/Revetment | Protects waterfront structures from erosion, wave and surge. | May redirect water or increase damage elsewhere. |
| Mole/Causeway | Provides shelter, access and structures. | Changes current, sediment and route geometry. |
| Dredging | Increases/maintains depth in bounded channels or berths. | Creates spoil, labour cost, ecology/legal effects and recurring siltation. |
| Training Wall/Channel Guide | Shapes river flow and navigation. | May affect banks, flooding and habitats. |
| Lock/Gate/Tidal Basin | Controls water level/access within 26B limits. | Requires power, staffing, maintenance and emergency rules. |
| Harbour Boom/Barrier | Controls debris, ice, access or security. | Can obstruct rescue or traffic when mismanaged. |
| Beacon/Marker Works | Improves approach readability and knowledge. | Requires maintenance and may become misleading when damaged. |

> **No Free Terrain Rewrite**
>
> Large harbour works are staged world projects using exact materials, surveys, protected-edit rules and 26B-26D consequences. The port planner may propose them but may not silently reshape coastlines or erase ecology, structures or player work.

# 14. Port Facility and Service Taxonomy

| Family | Example Facilities | Primary Services |
| --- | --- | --- |
| Access and Berthing | Landing, jetty, pier, quay, pontoon, mooring field, passenger terminal. | Berth/landing assignment, boarding and vessel access. |
| Cargo and Storage | Warehouse, bonded store, cold store, silo, tank, yard, crane house. | Transfer, staging, preservation, secure storage and route handoff. |
| Shipbuilding and Repair | Slipway, building berth, dry dock, floating dock, boatyard, forge, sawmill, sail loft, ropewalk. | Construction, repair, refit, haul-out, rigging and component work. |
| Provisioning | Chandlery, victualling store, water cistern, fuel depot, mana station, market. | Food, water, tools, spares, fuel, mana and consumables. |
| Navigation and Authority | Harbourmaster office, pilot station, signal tower, lighthouse, chart house, customs post. | Clearance, pilotage, information, signals, law and records. |
| Safety and Health | Lifeboat house, fire station, infirmary, quarantine house, pump house, refuge. | Rescue, firefighting, treatment, isolation and emergency support. |
| Crew and Community | Sailor hostel, barracks, guild hall, training school, bathhouse, shrine, public market. | Housing, recruitment, training, morale, health and culture. |
| Specialist/Advanced | Diving bell station, salvage yard, arcane dock, realm gate quay, golem crane yard. | Specialised environment, magic, automation or realm capability. |

## 14.1 Service Activation Contract

| Activation Input | Examples |
| --- | --- |
| Physical Structure | Required markers, work zones, storage, access, safety and service interfaces exist. |
| Environment | Depth, tide, weather, water, land and hazard limits currently allow operation. |
| Staff | Required jobs, skills, authority, health and schedules are present. |
| Tools/Equipment | Cranes, pumps, tools, lines, vehicles, instruments or magical devices are functional. |
| Stock/Energy | Required materials, fuel, water, mana, medicine or consumables exist and are reserved. |
| Networks | Road, storage, power, mana, water, waste, signal or automation links are available. |
| Permissions | Owner, law, reputation, contract and emergency-state rules permit use. |
| Condition | Damage, contamination, fire, blockage, occupation or maintenance does not exceed limits. |

# 15. Warehouses, Cargo Interfaces and Logistics

Port logistics extend normal storage and automation contracts. Cargo remains real inventory with ownership, provenance, hazard, quality, spoilage, security and destination. 26J defines transfer capability and port storage; 26K determines route demand and economic outcomes.

| Layer | Required Behaviour |
| --- | --- |
| Vessel Cargo Interface | Declared holds, hatches, cranes, ramps, pipes, conveyors or manual access. |
| Temporary Staging | Bounded quay/yard buffers with ownership, reservation and congestion. |
| Warehouse Intake | Typed storage, permissions, capacity, preservation and ledger entry. |
| Intermodal Transfer | Road, cart, rail, canal, golem, automation or settlement warehouse connection. |
| Hazard Separation | Fire, contamination, magic, explosive, living or forbidden cargo uses compatible areas. |
| Customs/Bonding | Cargo can be held pending inspection or authority release without changing ownership. |
| Loss and Damage | Spillage, theft, spoilage, breakage and contamination create evidence and consequences. |
| Distant Summary | Aggregate batches preserve item identity, quantity, owner, source, destination and reservations. |

## 15.1 Congestion

Berths, cranes, routes, workers and staging areas have finite capacity. Congestion causes queues and slower turnaround rather than deleting cargo or teleporting it. Emergency, perishable, passenger or authority cargo may receive priority under explicit policy.

# 16. Provisioning, Freshwater, Fuel, Mana and Consumables

| Supply | Port Requirement | Vessel/Crew Use |
| --- | --- | --- |
| Freshwater | Source, purification, cistern/tank, transfer interface and contamination control. | Drinking, cooking, cleaning, cooling and selected systems. |
| Food/Provisions | Warehouses, preservation, cooking, quality and loading access. | Voyage duration, crew health and morale. |
| Fuel | Compatible depot, containment, handling, fire safety and ownership. | Mechanical/thermal propulsion and onboard systems. |
| Mana/Arcane Charge | Approved source, purity, storage, conduits and stabilisation. | Mana drives, wards, instruments and specialist systems. |
| Rope/Cloth/Sealant | Chandlery/yard stock and craft support. | Rigging, sails, mooring, patches and maintenance. |
| Tools/Spares | Tool stores, workshops, replacement components and compatibility. | Routine maintenance and emergency repair. |
| Medicine | Protected stock, healer/medic access and expiration/quality. | Injury, illness, exposure and voyage readiness. |
| Ammunition/Defence Stock | Secure compatible store and authority rules. | Deferred detailed combat use; contributes to later readiness. |

> **Provisioning Rule**
>
> A voyage-readiness screen may summarise required supplies, but it may not create them. Every loaded quantity must come from an authoritative source, transfer and ownership transaction.

# 17. Shipyards, Slipways, Dry Docks and Production Capacity

| Shipyard Element | Capability Contribution |
| --- | --- |
| Design/Planning Office | Access to approved 26I designs, revisions, material profiles and work packages. |
| Building Berth/Slipway | Work envelope, supports, launch route and vessel-size limit. |
| Dry Dock/Graving Dock | Controlled dry work area, gate/closure, pumps, access and depth. |
| Floating Dry Dock/Lift | Mobile/limited lifting support with capacity and environmental limits. |
| Boatyard/Beach Site | Small-vessel construction and repair using simpler supports. |
| Timber/Material Yard | Reserved structural stock, seasoning, sorting and provenance. |
| Forge/Machine Shop | Metal, component, propulsion and steering work. |
| Ropewalk/Sail Loft/Rigging Yard | Ropes, sails, nets and rigging assemblies. |
| Cranes/Gantries/Haul Gear | Movement and placement of heavy elements. |
| Pump/Power/Mana Systems | Dewatering, tools, lighting and specialist production energy. |
| Inspection/Test Area | 26F-26H validation, leak tests, system tests and acceptance. |
| Skilled Workforce | Shipwrights, carpenters, smiths, riggers, engineers, mages, labour and inspectors. |

## 17.1 Shipyard Capability Profile

| Field | Meaning |
| --- | --- |
| supported_scale_bands | Maximum and preferred 26F vessel bands. |
| supported_work_types | New build, repair, refit, haul, salvage, restoration or specialist adaptation. |
| work_envelopes | Physical bounds, depth, launch route, overhead and access. |
| material_capabilities | Materials and processes the yard can safely use. |
| component_capabilities | Propulsion, steering, rigging, magic, automation and specialist system support. |
| workforce_capacity | Available skills, shifts, supervision and apprentices. |
| tool/equipment_capacity | Cranes, pumps, tools, power and precision. |
| queue_policy | Priority, ownership, emergencies and player/faction orders. |
| environmental_limits | Weather, tide, ice, surge, contamination and closure thresholds. |
| quality/inspection_profile | Supported workmanship and certification evidence. |

# 18. NPC Vessel Orders, Selection and Construction Intake

NPC vessel production begins with a justified Vessel Production Order. The order may originate from settlement needs, transport demand, fishing, rescue, exploration, faction policy, replacement loss, player contract or later fleet logic. 26J validates whether the port and shipyard can fulfil the order; 26K/26N own broader demand and economic prioritisation.

1. Create an order with client, purpose, intended capability, quantity, urgency, budget/resource authority and provenance.
2. Query approved 26I vessel families and explicit blueprint revisions through capability, culture, environment, scale and pack filters.
3. Apply exclusions for shipyard work envelope, unavailable materials, forbidden technology, legal rules and unsupported launch route.
4. Compare candidate construction demand, crew demand, operating support and intended-use evidence.
5. Choose a deterministic candidate and lock its blueprint revision, material profile and construction intake.
6. Reserve site, stock, labour and tools through an authoritative 26H project.
7. Build visibly or through bounded distant work summaries with exact transactions.
8. Inspect, launch, commission and accept the actual Vessel Instance.
9. Create or assign crew, home port, service records and readiness state.
10. Record completion, defects, substitutions, ownership and order history.

## 18.1 NPC Selection Rule

> **No Hardcoded Scene Spawn**
>
> An NPC order selects an approved design through capabilities, suitability, exclusions and fallbacks. It does not instantiate a hardcoded ship scene because a settlement reached a stage. Any exceptional generated historical vessel requires explicit worldgen provenance and must still resolve to a valid Vessel Instance record.

# 19. Vessel Launch, Commissioning, Acceptance and Readiness

| Gate | Owning Evidence |
| --- | --- |
| Construction Complete | 26H work packages, resource ledger and physical reconciliation. |
| Structural Commissioning | 26F scan, blockers, identity and compartment evidence. |
| Movement/Environment Certification | 26G load case, buoyancy, stability, propulsion and operating restrictions. |
| Port Acceptance | Berth/home-port compatibility, ownership, records and service support. |
| Crew Readiness | Safe manning, stations, skills, health, contracts and watch plan. |
| Provisioning Readiness | Food, water, fuel/mana, tools, medicine and mission-specific supplies. |
| Navigation Readiness | Charts/knowledge, instruments, destination access, weather and pilot rules. |
| Authority Clearance | Registration, law, customs, contract, quarantine and departure permission. |

A vessel may launch before full operational readiness for fitting-out, towing or tests, but its restrictions must be explicit. The port does not convert a failed gate into a hidden stat penalty; it presents blockers, accepted risk and permitted operations.

# 20. Repair, Refit, Salvage and Lay-Up Services

| Service | Port/Shipyard Responsibility | Boundary |
| --- | --- | --- |
| Emergency Afloat Repair | Berth, workers, tools, pumps, patches, stock and safe conditions. | 26H executes work. |
| Dry Repair | Haul/dock capacity, supports, survey access and queue. | 26H executes work; 26F/26G revalidate. |
| Refit | Compatible yard capability, approved change package, materials and crew/service planning. | 26H owns work; 26I owns reusable source changes. |
| Salvage Reception | Claim validation, lifting/unloading, hazardous isolation, storage and provenance. | 26H owns recovery/dismantling; law interfaces apply. |
| Restoration | Specialists, original-source evidence, approved substitutions and heritage rules. | 26H/26I provenance preserved. |
| Lay-Up | Secure berth/shore storage, reduced crew, preservation, periodic maintenance and ownership. | Vessel remains persistent but not voyage-ready. |
| Break-Up/Decommission | Authority, safe dismantling, material recovery and historical record. | Identity continuity rules from 26H apply. |

# 21. Lighthouses, Beacons, Signals, Charts and Harbour Information

| System | Function | Failure Effect |
| --- | --- | --- |
| Lighthouse/Leading Light | Long-range location, hazard or alignment information. | Reduced confidence, night/fog access limits and incident risk. |
| Buoys/Daymarks/Channel Markers | Local route, edge, hazard and direction guidance. | Channel uncertainty or closure. |
| Signal Tower/Flags/Lights | Port state, berth, storm, quarantine, distress and traffic instructions. | Miscommunication, delay or unsafe entry. |
| Bell/Horn/Magical Signal | Non-visual warning and accessibility support. | Reduced redundancy and severe-weather awareness. |
| Chart House/Notice Board | Known hazards, tide tables, closures, routes and local rules. | Outdated knowledge and lower planning confidence. |
| Sounding/Survey Service | Updates depth, wreck, silt, ice and channel evidence. | Stale approach limits. |
| Harbour Communications | Messenger, signal, rune or later network links. | Slower coordination and emergency response. |

## 21.1 Knowledge State

Port information can be unknown, rumoured, surveyed, current, stale or contradicted. Instruments and services improve confidence but do not reveal unsupported facts. Significant channel changes, wrecks, storms, sabotage or dredging invalidate affected chart evidence.

# 22. Rescue, Fire, Medical, Quarantine and Emergency Services

| Service | Required Capabilities |
| --- | --- |
| Rescue/Lifeboat | Alert reception, launch access, suitable craft, trained crew, search knowledge and treatment handoff. |
| Fire Response | Water/agent supply, pumps, tools, trained responders, access, isolation and hazardous-cargo knowledge. |
| Medical/Infirmary | Healers/medics, beds, medicine, sanitation, triage and evacuation route. |
| Quarantine | Separated berth/area, authority, supplies, observation, waste control and humane treatment. |
| Storm Refuge | Shelter capacity, moorings/berths, warning, queue, emergency stock and closure policy. |
| Wreck/Obstruction Response | Survey, marking, route closure, salvage order and environmental containment. |
| Evacuation/Muster | Accessible routes, assembly areas, passenger/crew counts and transport options. |
| Contamination Response | 26B fluid isolation, cleanup stock, medical/ecology interfaces and evidence. |

> **Emergency Priority**
>
> Emergency service may override ordinary queues and access rules only through explicit authority and auditable transactions. It does not erase ownership, loss, injury or later legal consequences.

# 23. Harbour Authority, Access, Law, Customs and Permissions

26J defines the operational interfaces required for maritime law. Exact tariffs, trade policy, smuggling economies, piracy, privateering, blockades and regional power are expanded in 26K/26N.

| Authority Function | Operational Rule |
| --- | --- |
| Port Entry | Vessel identity, state, origin, purpose, risk and permission are checked. |
| Berth Assignment | Authority or owner allocates finite compatible capacity and records responsibility. |
| Pilotage | Rules may require local pilot capability for declared conditions. |
| Customs/Inspection | Cargo/person records can be inspected or held through legal, privacy and faction rules. |
| Quarantine | Health/ecology risk can restrict movement using humane bounded processes. |
| Salvage Rights | Claims, ownership, rescue priority, sacred/heritage restrictions and evidence are recorded. |
| Hazardous Operations | Fuel, explosives, forbidden magic, waste, repairs and hot work require compatible zones/permits. |
| Emergency Closure | Channels, facilities or whole ports can close with reason, scope, review and alternatives. |
| Crime and Enforcement | Theft, damage, evasion, assault and sabotage connect to generic law/witness/reputation systems. |
| Foreign/Hostile Access | Faction and conflict state may restrict services while preserving later 26K/26L authority. |

## 23.1 Ungoverned and Informal Ports

A port may be communal, private, factional, contested, ungoverned or clandestine. Absence of formal authority does not remove ownership, reputation, danger or service constraints; it changes who can grant access and how disputes are resolved.

# 24. Maritime Jobs, Professions and Skill Families

| Job Family | Example Roles | Primary Capability |
| --- | --- | --- |
| Harbour Administration | Harbourmaster, clerk, customs officer, berth coordinator. | Clearance, records, queues, permissions and authority. |
| Navigation Support | Pilot, navigator, chartmaker, surveyor, signal keeper, lighthouse keeper. | Approach knowledge, route confidence, signals and charts. |
| Shipbuilding | Master shipwright, naval designer, carpenter, caulker, sawyer, smith, sailmaker, rigger. | Vessel construction, material work and inspection. |
| Engineering and Magic | Engineer, mechanic, pump tender, mana technician, runesmith, ward keeper. | Propulsion, power, pumps, mana and specialist systems. |
| Port Labour | Dockworker, crane operator, porter, warehouse worker, teamster, golem handler. | Cargo transfer, staging and infrastructure operation. |
| Vessel Operation | Captain, mate, helmsman, sailor, oarsman, engineer, quartermaster, lookout. | Command, movement, maintenance and daily operation. |
| Safety and Health | Rescue sailor, firefighter, medic, healer, quarantine officer, diver. | Emergency response, treatment and underwater work. |
| Harvest and Salvage | Fisher, net maker, diver, salvager, wreck surveyor. | Marine production and recovery interfaces; content extended by 26M. |
| Security/Defence | Port guard, marine, signal watch, armourer. | Safety and later combat readiness; combat rules remain 16/26L. |
| Community and Training | Instructor, guild officer, recruiter, hosteller, cook, priest/cultural specialist. | Training, recruitment, morale and cultural continuity. |

## 24.1 Job Activation

A maritime job requires a job definition, qualified NPC, reachable workplace/station, tools, schedule, authority and work demand. Jobs may cross-train and substitute within declared capability bands, but a generic worker cannot silently perform master shipwright, pilot or arcane engineer work.

# 25. Crew Architecture and Persistent Crew Records

> **Locked Crew Model**
>
> Important vessels use persistent crews. Named officers, specialists, story-linked sailors and interacted crew remain individual NPCs. Ordinary low-importance deck crew may be summarised into bounded cohorts only at appropriate simulation LOD, with stable origin, size, skill distribution, condition, contract and casualty state. Cohorts promote to individuals when interaction, combat, injury, story or persistent distinction requires it.

| Crew Layer | Stored State |
| --- | --- |
| Crew Identity | Crew ID, name/call sign, culture/faction, home port, formation history and reputation. |
| Membership | Named NPCs, cohorts, guests, passengers, prisoners only under lawful/personhood-safe systems, and temporary specialists. |
| Hierarchy | Captain/master, officers, watch leaders, specialists and ordinary crew; terminology may vary by culture. |
| Assignments | Vessel, role, station, watch, emergency duty and shore assignment. |
| Contracts | Employer, term, obligations, pay/support references, shares, permissions and termination rules. |
| Readiness | Safe/effective manning, health, fatigue, morale, skill coverage, tools and supplies. |
| Relationships | Loyalty, trust, fear, grievances, friendships, family/home ties and faction allegiance. |
| History | Voyages, rescues, losses, mutiny/rebellion events, promotions, injuries, awards and vessel transfers. |
| LOD State | Individual/cohort representation, last reconciliation and promotion triggers. |

## 25.1 Personhood Boundary

All people remain NPCs or cohort representations of people; they are never inventory items. Contracts, transport manifests and rescue records reference persons by stable identity. Captivity, forced labour, mutiny, desertion and rebellion require later law/story safeguards and must never be reduced to cargo handling.

# 26. Crew Stations, Manning and Vessel Capability

| Station Family | Typical Operators | Capability Exposed |
| --- | --- | --- |
| Command | Captain/master, mate, watch leader. | Orders, authority, emergency decisions and voyage coordination. |
| Helm/Steering | Helmsman, captain, pilot. | Manual steering and manoeuvre execution. |
| Navigation | Navigator, pilot, lookout, chart specialist. | Route, hazard, position, weather and approach knowledge. |
| Sail/Rigging | Sailors, riggers, watch crew. | Sail deployment, trim, reefing, repair and mast response. |
| Oar/Paddle | Oarsmen/sailors. | Human propulsion and manoeuvre. |
| Engineering/Propulsion | Engineer, mechanic, mana technician. | Engine/drive operation, fuel, cooling and fault response. |
| Anchoring/Mooring | Deck crew, boatswain, dockworkers. | Anchor, lines, fenders, towing and berth connection. |
| Cargo/Quartermaster | Quartermaster, cargo master, dockworkers. | Inventory, loading, balance, provisioning and ledger. |
| Maintenance/Damage Control | Carpenters, engineers, pump tenders, general crew. | Inspection, pumping, patching, fire response and isolation. |
| Medical | Medic/healer. | Treatment, triage and health readiness. |
| Lookout/Signal | Lookout, signaler. | Detection, communication and warning. |
| Weapons/Boarding | Gunner, marine, trained crew. | Detailed function deferred to 26L. |

## 26.1 Manning States

| State | Meaning |
| --- | --- |
| Unmanned | No valid crew; only stationary or explicitly automated safe states allowed. |
| Caretaker | Minimum maintenance/security crew while laid up or berthed. |
| Below Safe Manning | Critical station coverage missing; departure normally blocked or accepted-risk emergency only. |
| Safe Manning | Minimum declared operation possible under restricted conditions. |
| Effective Manning | Normal operation and watches without severe overwork. |
| Full/Enhanced Manning | Additional redundancy, specialist service, faster response or mission capability. |
| Overcrowded | Crew/passenger count exceeds safe accommodation, provision, escape or stability constraints. |

# 27. Recruitment, Contracts, Pay, Obligations and Reputation

| Recruitment Source | Notes |
| --- | --- |
| Port Labour Market | Available local sailors/specialists based on population, culture, wages/support and reputation. |
| Guild/Academy | Qualified graduates, apprentices, certifications and obligations. |
| Settlement Assignment | Faction/settlement crews assigned to public vessels. |
| Player Recruitment | Negotiated contract, reputation, purpose, vessel readiness and legal status. |
| Crew Transfer | Voluntary or authorised movement between vessels with contract/history. |
| Rescue/Refugee Integration | Requires consent, support, law and settlement capacity; not automatic labour conversion. |
| Companion/Story Recruitment | Authored relationship path with persistent identity. |
| Temporary Specialist | Pilot, diver, healer, mage, engineer or surveyor hired for one operation. |

## 27.1 Contract Structure

| Field | Purpose |
| --- | --- |
| parties | Crew/NPC, employer/owner, vessel/port and authority. |
| term/scope | Voyage, time period, mission, standing assignment or project. |
| obligations | Stations, watches, lawful orders, maintenance, rescue and conduct. |
| support | Food, water, lodging, treatment, equipment, shore leave and return terms. |
| compensation_reference | Wage/share/reward model owned by economy progression documents. |
| risk disclosure | Known voyage, conflict, hazard and forbidden-practice conditions. |
| termination/desertion | Notice, breach, emergency, incapacity, mutiny or lawful release. |
| reputation/faction effects | Trust, loyalty, fear, grievance and collective consequences. |

# 28. Training, Experience, Fatigue, Health, Morale and Discipline

| Factor | Gameplay Effect | Recovery/Improvement |
| --- | --- | --- |
| Role Skill | Speed, quality, judgement, fault handling and available actions. | Use, instruction, practice, books, guilds and specialists. |
| Local Knowledge | Approach, hazards, tides, signals and culture-specific procedures. | Experience, charts, pilots, surveys and teaching. |
| Fatigue | Slower work, mistakes, reduced awareness and morale pressure. | Rest, watches, food, safety and adequate crew. |
| Health/Injury | Station limitation, treatment need and persistent consequence. | Medicine, healers, rest, magic and rehabilitation. |
| Morale | Order compliance, endurance, initiative, retention and crisis response. | Fair support, success, leadership, rest, culture, pay and relationships. |
| Cohesion | Coordination and trust between crew members/watches. | Shared experience, stable leadership, training and conflict resolution. |
| Discipline/Authority | Ability to coordinate lawful orders without constant micromanagement. | Clear command, culture/law, training and reputation. |
| Fear/Trauma | May affect dangerous duties and future choices. | Safety, support, time, treatment and story resolution. |

> **Failure Fairness**
>
> Low skill or fatigue should usually reduce efficiency, confidence or available options before producing catastrophic random failure. Serious incidents require readable contributing conditions, warnings and recovery paths.

# 29. Watches, Schedules, Shore Leave and Crew Accommodation

| System | Rule |
| --- | --- |
| Watch Plan | Assigns station coverage across time, weather and operational state. |
| Port Watch | Reduced crew may remain aboard while others use shore services. |
| Emergency Muster | Overrides ordinary schedule and assigns damage-control/rescue stations. |
| Rest | Requires safe time and suitable accommodation aboard or ashore. |
| Meals/Water | Consume real provisions through vessel or port stores. |
| Shore Leave | Supports morale, relationships, trade and culture while creating availability and incident considerations. |
| Accommodation | Bunks, hammocks, cabins, shelters, sanitation, temperature and privacy contribute to sustained readiness. |
| Overnight Visitors/Passengers | Use declared capacity and permissions; do not become crew automatically. |
| Distant Schedule | Uses watch coverage and fatigue budgets rather than simulating every step. |

## 29.1 Settlement Housing Boundary

Crew accommodation aboard a vessel supports voyage readiness but does not automatically count as permanent settlement Housing. Long-term residents, families and shore-based crews require valid settlement housing unless an approved culture or mobile-community definition explicitly provides an equivalent living arrangement.

# 30. Command, Orders, Delegation and Player Control Boundaries

| Control Mode | Player Experience |
| --- | --- |
| Direct Station Control | Player personally operates helm, sail, engine, crane, pump or other valid station. |
| Captain/Command Orders | Player issues course, speed, sail state, anchor, berth, emergency and task-priority orders. |
| Standing Orders | Crew follows persistent safe defaults for watches, repairs, cargo, rescue and weather response. |
| Delegated Voyage | Qualified NPC captain/crew executes approved route/mission through 26K-compatible simulation. |
| Port Service Order | Player requests berth, loading, repair, provisioning or recruitment and receives queue/blocker feedback. |
| Emergency Override | High-priority order may accept risk but records authority, reason and consequence. |

> **No Mandatory RTS**
>
> The player is not required to select every sailor and click every rope. Crew convert high-level intent into station tasks when qualified, supplied and able. The player may inspect, specialise and intervene without the game hiding shortages or pretending an uncrewed ship is fully functional.

# 31. Crew Profiles by Vessel Role and Scale

| Vessel Use | Core Coverage | Common Specialists |
| --- | --- | --- |
| Raft/Small Boat | Operator, lookout awareness and manual propulsion/steering. | Fisher, guide or rescuer. |
| River/Coastal Workboat | Helm, local navigation, mooring, cargo/maintenance. | Pilot, fisher, diver or mechanic. |
| Sailing Trader/Explorer | Command, helm, navigation, sail/rigging, quartermaster, maintenance and watches. | Medic, scholar, cook, carpenter, mage. |
| Engine/Mana Vessel | Command, helm, navigation, engineering, fuel/mana, maintenance and deck crew. | Runesmith, pump specialist, artificer. |
| Passenger/Ferry | Command, helm, navigation, mooring, passenger safety, provisioning and emergency coverage. | Purser, healer, guide. |
| Salvage/Diving Vessel | Command, navigation, station keeping, lifting, pumps, divers and medical/rescue. | Wreck surveyor, mage, historian. |
| Large Cargo/Expedition Ship | Multiple watches across command, helm, navigation, propulsion, deck, cargo, maintenance, medical and lookout. | Specialist mission teams. |
| Combat-Capable Vessel | All operational coverage plus weapon, marine and damage-control roles. | Detailed combat staffing deferred to 26L. |

Exact counts are vessel-instance and operation dependent. Blueprint intended-use profiles may suggest station capacity, but safe manning is calculated from the actual Vessel Instance, current systems, environment, automation and mission.

# 32. Port Calls, Turnaround and Service Transactions

1. Detect/identify Port Node and current approach confidence.
2. Request entry, declare vessel state/purpose and receive restrictions.
3. Validate approach channel, pilot/tug need, weather/tide window and berth compatibility.
4. Create Port Call Record and reserve an anchorage or berth.
5. Execute arrival, mooring and gangway/access confirmation.
6. Perform inspection, customs, quarantine or authority steps as applicable.
7. Create service orders for cargo, passengers, provisions, repair, crew, charts or other needs.
8. Reserve stock, staff, tools and service queue capacity.
9. Execute authoritative transfers/work and record incidents or substitutions.
10. Recalculate vessel loading, stability, crew readiness and departure requirements.
11. Receive clearance, depart berth and close the Port Call Record with history.

## 32.1 Turnaround Status

| Status | Meaning |
| --- | --- |
| Awaiting Entry | Approach/authority/berth request not yet accepted. |
| Approaching | Channel/pilot/tug operation active. |
| Berthed/Anchored | Vessel secured and access state confirmed. |
| Service Queued | Orders accepted but resources/workers/space pending. |
| Servicing | Transfers, work or recruitment in progress. |
| Blocked | Specific permission, stock, worker, condition, route or environment failure. |
| Ready for Departure | Requested work complete and readiness gates pass. |
| Held | Authority, quarantine, damage, conflict or accepted contract prevents departure. |
| Departed/Closed | Port Call finalised and berth released. |

# 33. NPC Vessel Use, Voyages and Distant Operation Boundary

26J owns the readiness and crew/service state required before an NPC vessel may operate. 26K owns the mission, fleet, route economy and regional consequences. A distant vessel summary must reference a real Vessel Instance or approved generated historical instance, real crew state, real cargo/supply batches and a valid route/mission record.

| 26J Provides | 26K Consumes |
| --- | --- |
| Home port and Port Node relationships. | Route endpoints, mission generation and fleet planning. |
| Crew identity, station coverage and readiness. | Voyage risk, mission execution and fleet outcomes. |
| Vessel service, damage, fuel/provisions and departure state. | Operational range, route choice and resupply planning. |
| Port capacity, queues, closures and support services. | Trade/fleet congestion, rerouting and regional effects. |
| Port law/access interfaces. | Tariffs, smuggling, piracy, blockade and diplomacy. |
| Arrival/departure and Port Call execution. | Voyage continuation and economic/history results. |

# 34. Seven Settlement Needs and Maritime Capability

| Main Need | Maritime Contributions | Maritime Pressures |
| --- | --- | --- |
| Housing | Dockside homes, crew hostels, family housing, visitor lodging and valid mobile-community arrangements. | Displacement, overcrowding, transient population and storm damage. |
| Provisions | Fishing interfaces, markets, cold/preserved storage, freshwater, imported food and voyage provisioning. | Spoilage, contamination, route interruption and large crew demand. |
| Health | Infirmary, rescue, quarantine, sanitation, clean water and trained medics. | Injury, exposure, disease arrival, pollution and wreck emergencies. |
| Work | Shipyards, docks, warehouses, navigation, fishing, rescue, craft and service jobs. | Seasonality, dangerous work, skill shortages and boom/bust cycles. |
| Safety | Shelter, breakwaters, lighthouse, pilots, fire/rescue, guards, evacuation and storm plans. | Storms, fire, collisions, crime, raids, sea hazards and hazardous cargo. |
| Infrastructure | Berths, channels, roads, warehouses, cranes, utilities, signals, pumps and maintenance. | Silt, corrosion, congestion, network failure and high upkeep. |
| Morale | Markets, festivals, guilds, shore leave, shrines, public waterfront and community identity. | Long absences, casualties, unfair contracts, cultural conflict and decline. |

> **Seven-Needs Rule**
>
> Maritime systems do not add separate top-level needs such as Trade, Navy, Port Prestige or Seafaring. Those are capabilities, pressures, policies or progression layers beneath the existing seven needs.

# 35. Maritime Districts, Growth and Settlement Planning

Maritime districts coordinate physical buildings, roads, water access and services but do not create abstract output. They are planning and identity layers using Document 19-20 contracts.

| District/Cluster | Typical Functions |
| --- | --- |
| Landing Cluster | Jetty, small store, shelter, path and local boat service. |
| Working Waterfront | Quays, warehouses, cranes, workshops and labour access. |
| Shipyard Quarter | Slips/docks, yards, specialist workshops, material storage and worker housing. |
| Fishing Quarter | Landing, market, preservation, net/boat repair and 26M ecology links. |
| Passenger/Ferry Quarter | Safe terminals, waiting, lodging, route information and accessibility. |
| Authority/Navigation Quarter | Harbourmaster, customs, pilot, signals, charts and records. |
| Rescue/Health Quarter | Lifeboat, infirmary, quarantine, firefighting and refuge. |
| Naval/Security Quarter | Controlled berths, stores and defences; detailed navy role deferred to 26K/26L. |
| Arcane/Realm Waterfront | Mana services, wards, stabilisation and portal/realm interfaces under approved content. |
| Public Waterfront | Markets, culture, festivals and morale spaces separated safely from industrial hazards. |

## 35.1 Growth Gates

- Water/land access remains safe and reachable.
- Settlement needs can support added population and transient demand.
- Real materials, labour, maintenance and operating stock are available.
- Facilities resolve compatible routes and do not trap NPCs or vessels.
- Culture/faction law permits proposed functions.
- Harbour works do not violate hard ecology, heritage, player-edit or world constraints.
- Added vessel demand can be crewed, berthed, serviced and supplied.
- Expansion does not depend on unavailable optional packs without a declared fallback.

# 36. Culture, Faction, Biome and Realm Adaptation

| Layer | May Control | May Not Replace |
| --- | --- | --- |
| Culture | Architecture, terminology, work traditions, crew hierarchy, materials, ceremonies, training and preferred vessel families. | Universal personhood, resource conservation, safety or activation contracts. |
| Faction | Ownership, access, uniforms, priorities, security, diplomacy and approved services. | Culture identity or ancestry. |
| Biome/Climate | Foundations, shelter, ice handling, storm design, corrosion, water supply and seasonal operation. | Harbour suitability truth from 26C-26D. |
| Realm | Gravity/fluid/magic adaptations, stabilisation, portal quay and specialist protection. | 26F-26G vessel truth or dimension authority. |
| History/State | Ruined, occupied, abandoned, restored, ceremonial, industrial or wartime overlays. | Persistent instance history or actual damage. |

## 36.1 Examples as Contract Patterns

| Pattern | Contract Difference |
| --- | --- |
| Tidal Timber Harbour | Pile foundations, floating access, tide windows and renewable wood craft. |
| Stone Canal Port | Locks, towpaths, masonry quays, controlled water levels and barge specialisation. |
| Ice Harbour | Seasonal channels, icebreaking support, heated stores, freezing-spray maintenance and refuge. |
| Living Fae Harbour | Approved living materials, ecological permissions, non-destructive moorings and magical guidance. |
| Arcane Floating Port | Anchored/floating structures, mana stability, evacuation, service networks and drift control. |
| Underwater/Amphibious Port | Pressure, breathable interfaces, submerged berths and body-plan/accessibility adaptation. |

These are framework examples, not final Atlas content entries.

# 37. Automation, Magic, Golems and Specialist Infrastructure

| System | Allowed Role | Constraint |
| --- | --- | --- |
| Cargo Automation | Conveyors, cranes, carts, pipes, filters and warehouse routing. | Permissions, capacity, item conservation and vessel movement connectors. |
| Port Power | Water, wind, fuel, steam, mechanical and other approved networks. | No service without physical source and network. |
| Mana Infrastructure | Charging, wards, lights, stabilisation, signals and specialist docks. | Purity, risk, law, stock and 09/26N progression. |
| Pumps/Drainage | Dry docks, flood control, firefighting and contamination handling. | 26B fluid authority and energy capacity. |
| Golems | Heavy handling, maintenance, repetitive labour or hazardous support. | Job profiles, zones, ownership, safety and later progression. |
| Automated Lighthouses/Signals | Routine operation with maintenance and fault states. | Knowledge and authority remain explicit; no omniscient guidance. |
| Automated Vessel Operation | May reduce station workload for approved systems. | Does not erase safe-manning, damage-control, legal or emergency requirements unless explicitly certified. |

# 38. Incidents, Disasters, Damage and Persistent Aftermath

| Incident | Immediate Port Response | Persistent Aftermath |
| --- | --- | --- |
| Storm/Surge | Close channels, reinforce moorings, shelter vessels, rescue and evacuate. | Damage, silt, wrecks, shortages, repairs and history. |
| Fire/Explosion | Alarm, isolate fuel/cargo, pump, evacuate, treat injuries and control spread. | Burnt structures, lost stock, law/reputation and reconstruction. |
| Collision/Grounding | Stop traffic, rescue, survey, tow, mark hazard and assess vessel/structure. | Blocked berth/channel, salvage, repair and claims. |
| Flood/Containment Failure | Pumps, gates, barriers, evacuation and contamination control. | Water damage, mould/corrosion, displaced residents and works. |
| Contamination/Disease | Quarantine, isolate fluids/cargo, treatment and route warnings. | Health pressure, trade interruption, cleanup and trust effects. |
| Wreck/Obstruction | Mark/close route, rescue, claim, survey and salvage order. | New structure/ecology/history object and route change. |
| Labour Shortage/Strike/Desertion | Reduce services, negotiate, reprioritise and protect essentials. | Morale, reputation, contract and production consequences. |
| Raid/Siege/Occupation | Warnings, evacuation, security and later combat integration. | Damage, ownership, refugees, blockade and restoration. |
| Magical Instability | Shut networks, ward/isolate, call specialists and evacuate. | Corruption, altered access, legal and repair consequences. |

## 38.1 Incident Evidence

Major incidents record causes, warnings, decisions, participants, losses, rescues, transfers, damage, service outages, legal claims and follow-up projects. The world should display evidence through structures, NPC memory, notices, wrecks, memorials, shortages and changed routes.

# 39. Difficulty, Accessibility and World Settings

| Setting | Possible Controls |
| --- | --- |
| Maritime Management Detail | Crew needs, contract detail, service queues, maintenance and information density. |
| Port Incident Frequency | Storm damage, fire, collision, contamination, labour and emergency events. |
| Crew Consequence | Permanent death/injury, desertion, morale severity and recovery support. |
| Economic Pressure | Service scarcity, upkeep, wages/support and resource demand; final economy values deferred. |
| Navigation Assistance | Channel lines, berth guides, under-keel warnings, pilot automation and route confidence. |
| Time/Queue Support | Faster service, construction and crew recovery for relaxed play. |
| Accessibility | Text scale, non-colour signals, captions, controller support, simplified orders, reduced motion and timing assistance. |
| Peaceful Mode | Retains ports, shipyards, crews, rescue, exploration and settlement growth while reducing hostile pressure. |

> **Consistency Rule**
>
> Difficulty may scale costs, timing, failure frequency and consequences, but it may not allow silent resource duplication, identity loss, impossible route access or unexplained state changes.

# 40. Simulation LOD, Persistence and Promotion/Demotion

| LOD | Representation |
| --- | --- |
| LOD 0 - Interactive | Full vessels, NPCs, cargo batches, tools, routes, facilities, animations and immediate incidents. |
| LOD 1 - Local Reduced | Simplified movement/animation; authoritative tasks, stock, queues and crew remain active. |
| LOD 2 - Port Summary | Facilities/services use scheduled transactions; crews may cohort where eligible; vessels use berth/queue summaries. |
| LOD 3 - Regional Summary | Port capacity, stock bands, workforce, vessel calls, incidents and projects tick in bounded intervals. |
| LOD 4 - Dormant/Archived | Only essential state, next scheduled transitions and historical records persist until reactivation. |

## 40.1 Promotion Triggers

- Player approaches or opens a detailed interface.
- Important named NPC, story, vessel, incident or project becomes relevant.
- Combat, rescue, collision, fire, launch, commissioning or major transfer requires physical resolution.
- A cohort member becomes interacted with, injured, distinguished or story-bound.
- A discrepancy, migration or audit requires reconciliation.

## 40.2 Reconciliation Rule

Promotion reconstructs physical state from authoritative summaries without inventing resources, workers or vessels. Demotion records actual outcomes before actors are removed. Port queues, crew fatigue, project progress, stock and damage must reconcile exactly or fail safely with an audit record.

# 41. Multiplayer Authority, Ownership and Contribution

| Concern | Rule |
| --- | --- |
| World Authority | Server/host owns Port Instances, services, stock, crews, orders and Port Calls. |
| Port Ownership | Settlement, faction, player group or private owner controls permissions through explicit records. |
| Berth Reservation | Atomic lock prevents two vessels receiving the same exclusive berth. |
| Cargo/Service Transactions | Validated transfer and project commands preserve ownership and quantity. |
| Crew Command | Only authorised captain/officers/owners may issue scoped orders; station users control local actions. |
| Player Contribution | Materials, labour, funds and rescue/work contributions are ledgered separately. |
| Conflicting Orders | Authority hierarchy, locks and readable rejection prevent silent last-write wins. |
| Disconnect Recovery | Vessel/crew receives safe standing orders; transactions roll forward/back atomically. |
| Split Screen | Local-player UI and focus remain separate while sharing authoritative world state. |
| PvP/Conflict | Port seizure, sabotage and hostile actions use later law/combat permissions, never client trust. |

# 42. UI/UX Requirements and Player Feedback

| Surface | Minimum Information |
| --- | --- |
| Port Overview | Need contributions, facilities, services, queues, stock pressures, workforce, hazards and history. |
| Harbour Map | Approaches, depth confidence, channels, markers, anchorages, berths, closures and traffic. |
| Berth Request | Compatibility, restrictions, pilot/tug need, wait, cost/policy reference and reason codes. |
| Port Call | Arrival state, berth, services, transfers, blockers, incidents and departure readiness. |
| Shipyard Board | Supported designs/work, queues, materials, staff, projects, quality and worksite limits. |
| Vessel Order | Purpose, blueprint revision, candidate comparison, resource demand, crew demand and restrictions. |
| Crew Roster | Roles, watches, skill coverage, health, fatigue, morale, contracts and station assignments. |
| Recruitment | Available people, qualifications, terms, reputation, vessel conditions and obligations. |
| Readiness | Structural/movement certificates, safe manning, provisions, charts, weather, authority and accepted risks. |
| Emergency Panel | Alarm, closures, muster, rescue assets, affected areas, orders and cause/effect feedback. |

## 42.1 World Cues

- Flags, lights, bells, horns, rune signals and marker shapes communicate port state through multiple channels.
- Workers physically move cargo, tools and materials when nearby.
- Closed berths use barriers/signals and visible damage or hazard clues.
- Queues and congestion appear through vessels, staging stock and worker activity without becoming visual clutter.
- Crew readiness is visible through station occupancy, fatigue/injury animations, missing specialists and preparation tasks.
- Every critical denial includes plain-language cause and a route to further detail.

# 43. Godot/Summer Engine Technical Architecture

```text
PortCivilisationService
├── HarbourRegistryService
├── PortInstanceService
├── PortNodeAndApproachService
├── BerthAndAnchorageService
├── PortFacilityService
├── PortServiceResolver
├── ShipyardOrderService
├── CrewRegistryService
├── CrewAssignmentAndWatchService
├── PortCallTransactionService
├── PortIncidentService
├── MaritimeSettlementIntegrationService
├── MaritimeLODService
├── MaritimeMigrationService
└── MaritimeDiagnosticsService
```

| Layer | Recommended Direction |
| --- | --- |
| Definitions | Godot Resources or imported immutable records using Set 25 qualified IDs and schemas. |
| Instances | Compact serialisable records separate from scene Nodes. |
| Physical Representation | Facility scenes, voxel structures, NPC actors and vessel actors promoted near players. |
| Graphs | Port/approach/berth/service/route relationships stored as indexed data, not inferred every frame. |
| Tasks | Reuse generic NPC job/task and 26H work-package systems through adapters. |
| Transactions | Atomic inventory, berth, service, crew and project commands. |
| Queries | Capability-based filters for berth, service, crew, blueprint and shipyard compatibility. |
| LOD | Scheduled summaries with deterministic promotion/demotion and audit. |
| Events | Typed events for arrival, service, launch, crew change, incident, closure and recovery. |
| Summer Engine | May propose code/content changes but cannot bypass review, tests, source ownership or migration evidence. |

## 43.1 Engineering Rules

- No Node per berth slot, cargo stack, distant worker or service tick.
- No string-based job or capability checks in gameplay code.
- No port service may mutate another system's authoritative state directly; use commands/transactions.
- No scene path is a persistent identity.
- No procedural NPC vessel is accepted without explicit blueprint revision/provenance.
- All LOD transitions must be deterministic and resource-conserving.
- All asynchronous service/project work must be recoverable after save, crash or disconnect.
- Port and crew view models are read-only projections; UI sends validated commands.

# 44. Set 25 Schemas, Relationships, Capabilities and Packs

## 44.1 Proposed Schema Extensions

| Schema/Facet | Owner | Purpose |
| --- | --- | --- |
| leyforge.maritime.port_definition | 26J | Universal port capability and activation profile. |
| leyforge.maritime.harbour_instance | 26J runtime facet | Persistent harbour binding and condition. |
| leyforge.maritime.port_node | 26J/26C relationship | Route and service endpoint. |
| leyforge.maritime.berth_definition | 26J | Berth dimensions, environment, connectors and restrictions. |
| leyforge.maritime.port_service | 26J | Resolved service offer, capacity and blockers. |
| leyforge.maritime.shipyard_profile | 26J/26H | Supported vessel/work/material/component capability. |
| leyforge.maritime.vessel_order | 26J | NPC/player/faction construction request and locked design. |
| leyforge.maritime.crew_record | 26J/07 | Crew identity, membership, hierarchy, readiness and history. |
| leyforge.maritime.crew_assignment | 26J/07/26F | Role/station/watch binding. |
| leyforge.maritime.port_call | 26J | Arrival, services, transfers and departure history. |
| leyforge.maritime.harbour_incident | 26J/15 | Incident and aftermath record. |

## 44.2 Proposed Relationships

| Relationship | Example |
| --- | --- |
| operates_at / operated_by | Pilot operates at Port Instance. |
| home_port / home_port_of | Vessel or crew linked to support port. |
| contains_berth / berth_of | Port contains berth. |
| serves_water_body / served_by_port | Port Node serves Water Body. |
| supports_vessel_profile / supported_by_shipyard | Shipyard supports vessel scale/use/material profile. |
| assigned_to_vessel / crewed_by | Crew assigned to Vessel Instance. |
| assigned_to_station / station_manned_by | NPC/cohort assigned to station. |
| calls_at / port_call_of | Vessel Port Call at Port Instance. |
| provides_service / service_provided_by | Facility/port provides service. |
| requires_pilotage / pilots | Approach/port requires pilot capability. |
| connects_route / route_connected_by | Port Node connects route graph. |
| constructed_for / production_order_of | Vessel Instance constructed from order. |

## 44.3 Candidate Capability Identities

| Capability | Example Providers |
| --- | --- |
| leyforge.capability.maritime.safe_landing | Beach landing, jetty, passenger ramp. |
| leyforge.capability.maritime.safe_harbour | Shelter, anchorage, harbour works and authority. |
| leyforge.capability.maritime.berth.small/medium/large | Compatible berth/service group. |
| leyforge.capability.maritime.cargo_transfer | Labour, crane, ramp, pipe or conveyor service. |
| leyforge.capability.maritime.vessel_provisioning | Food, water, fuel/mana, tools and transfer. |
| leyforge.capability.maritime.vessel_repair | Afloat, haul-out or dry-dock repair profile. |
| leyforge.capability.maritime.vessel_construction | Shipyard profile and 26H worksite. |
| leyforge.capability.maritime.pilotage | Qualified pilot plus current local knowledge. |
| leyforge.capability.maritime.navigation_aid | Lighthouse, beacon, chart or signal network. |
| leyforge.capability.maritime.rescue | Craft, crew, launch, communication and treatment. |
| leyforge.capability.maritime.crew_recruitment | Population, contracts, lodging and role candidates. |
| leyforge.capability.maritime.safe_manning | Crew/station coverage for operation profile. |

## 44.4 Pack Boundaries

| Pack | Required Content |
| --- | --- |
| Base Port Framework | Schemas, generic facilities, service resolver, port nodes, berths, crew and Port Call contracts. |
| Culture Maritime Pack | Architecture, terminology, jobs/training variants, vessel-library references and laws. |
| Biome/Climate Port Pack | Foundations, works, hazards, maintenance and seasonal profiles. |
| Shipyard Pack | Facilities, tools, material capability, approved vessel-family references and work profiles. |
| Advanced Magic/Automation Pack | Mana, golem, portal, automated handling and specialist dependencies. |
| Optional Naval Pack | Security/naval facilities and crew facets consumed by 26K-26L. |
| Realm Maritime Pack | Dimension-specific environment, services and vessel support. |

# 45. Validation, Reason Codes, Evidence and Release Gates

| Validation Domain | Examples |
| --- | --- |
| Identity/Schema | Qualified IDs, owners, versions, facets and instance separation. |
| World Suitability | Water/body, depth, coast, approach, ecology, heritage and terrain compatibility. |
| Structure/Facility | Markers, routes, access, safety, networks, damage and activation contract. |
| Berth/Approach | Draft, dimensions, clearance, environment, markers, pilot/tug and closure. |
| Service | Staff, tools, stock, network, permission, condition, capacity and queue. |
| Shipyard | Work envelope, launch route, material/process, workforce and 26H intake. |
| Crew | Identity, contract, station, watch, skill, health, accommodation and safe manning. |
| Transactions | Cargo, provisions, resources, berth locks, contributions and recovery. |
| LOD/Persistence | Summary conservation, promotion/demotion, save/migration and history. |
| Accessibility/Presentation | Non-colour cues, readable reasons, controls, captions and information hierarchy. |
| Cross-Pack | Absent/removed/version-mismatched packs, fallbacks and quarantine. |

## 45.1 Core Reason Codes

| Code | Severity | Meaning |
| --- | --- | --- |
| PORT_NO_VALID_WATER_CONNECTION | Blocker | Port Node has no valid Water Body/route binding. |
| PORT_APPROACH_UNSAFE | Blocker | No eligible approach under current or supported conditions. |
| PORT_AUTHORITY_UNRESOLVED | Error | Operational authority/owner status is ambiguous. |
| BERTH_VESSEL_INCOMPATIBLE | Blocker | Actual vessel exceeds berth depth, size, clearance, load or connector limits. |
| BERTH_ENVIRONMENT_CLOSED | Restriction | Weather, tide, current, ice, wreck or incident closes berth/approach. |
| SERVICE_FACILITY_INACTIVE | Blocker | Physical facility fails activation contract. |
| SERVICE_STAFF_MISSING | Blocker | Required job/skill coverage unavailable. |
| SERVICE_STOCK_MISSING | Blocker | Required authoritative stock/energy unavailable. |
| SERVICE_PERMISSION_DENIED | Blocker | Owner/law/reputation/contract prevents use. |
| SHIPYARD_PROFILE_UNSUPPORTED | Blocker | Selected vessel/work exceeds yard capability. |
| SHIPYARD_BLUEPRINT_UNAPPROVED | Blocker | No approved explicit 26I blueprint revision. |
| SHIPYARD_LAUNCH_ROUTE_BLOCKED | Blocker | Built vessel cannot reach navigable water safely. |
| CREW_BELOW_SAFE_MANNING | Blocker | Required stations/roles not covered for operation. |
| CREW_FATIGUE_CRITICAL | Warning/Blocker | Watch plan cannot sustain safe operation. |
| CREW_CONTRACT_INVALID | Blocker | Assignment lacks valid consent/authority/term. |
| PORT_CALL_TRANSACTION_CONFLICT | Error | Berth/service/stock reservation conflict. |
| PORT_LOD_RECONCILIATION_FAILED | Save Blocker | Summary and physical state do not reconcile. |
| PORT_OPTIONAL_PACK_MISSING | Compatibility | Referenced service/design requires absent pack without valid fallback. |

## 45.2 Evidence Bundle

- Port/Harbour schema and ownership report.
- Generated-site suitability and approach evidence across seed corpus.
- Facility activation and route/access tests.
- Berth compatibility matrix using actual 26F-26G vessel cases.
- Shipyard construction/repair intake tests with 26H and 26I revisions.
- Crew safe-manning, station reachability, watches and cohort promotion tests.
- Port Call transaction and crash/disconnect recovery tests.
- Incident, damage, closure and restoration tests.
- LOD conservation and save migration reports.
- Accessibility, controller, localisation and non-colour signal evidence.
- Cross-pack combination and removal/quarantine tests.

# 46. Prototype Laboratories and Acceptance Tests

| Laboratory | Proof Target |
| --- | --- |
| J-LAB-01 Natural Anchorage | Small craft discovers, evaluates, anchors, weathers tide/current and departs with explainable limits. |
| J-LAB-02 Working Jetty | NPCs transfer real cargo between vessel, staging and warehouse without duplication/loss. |
| J-LAB-03 Berth Compatibility | Multiple vessel loads/sizes receive correct berth, wait, pilot/tide or rejection results. |
| J-LAB-04 Shipyard Build | NPC yard selects approved 26I design, consumes exact materials through 26H and launches persistent vessel. |
| J-LAB-05 Crew Readiness | Recruit, contract, assign stations/watches, detect shortages and operate under safe/effective manning. |
| J-LAB-06 Port Call | Arrival through departure completes services, queues, transfers and history atomically. |
| J-LAB-07 Storm Closure | 26D warning closes approach, shelters vessels, triggers rescue and leaves persistent damage. |
| J-LAB-08 Repair/Refit | Damaged vessel enters compatible service, work executes, certificates update and provenance remains. |
| J-LAB-09 Distant Port | Port demotes, processes bounded calls/projects, then promotes with exact reconciliation. |
| J-LAB-10 Multiplayer Conflict | Two players request berth/service/crew simultaneously without duplicate assignment or lost stock. |
| J-LAB-11 Optional Pack Removal | Advanced service/design quarantines safely while core port/save remains playable. |
| J-LAB-12 Accessibility | Port entry, alarms, berth guidance and crew blockers remain usable without colour/audio/motion dependence. |

## 46.1 Minimum End-to-End Scenario

1. A seed generates a suitable coastal harbour context and an inland-connected settlement.
2. The settlement builds a P1 landing and later a P2 sheltered harbour through real projects.
3. A small shipyard receives an order for a compatible workboat from an approved 26I revision.
4. Materials arrive through settlement stores; NPC shipwrights build and launch through 26H.
5. 26F commissions the vessel and 26G certifies its actual load/operating restrictions.
6. The port recruits a captain and crew, assigns stations and loads provisions.
7. The vessel performs a local voyage through a later 26K-compatible route and returns.
8. A storm closes the harbour, damages a marker and triggers rescue/repair priorities.
9. The world saves, reloads and preserves port, vessel, crew, stock, incident and project history.

# 47. Performance, Scalability and Production Budgets

| Budget Area | Direction |
| --- | --- |
| Port Graph | Index nodes/edges and update only affected service/capability dependencies. |
| Berth Solver | Cache static geometry; recalculate on vessel load, environment, damage or channel change. |
| NPC Actors | Use importance and distance budgets; cohorts only where identity rules permit. |
| Cargo Visuals | Show bounded representative batches near player; maintain authoritative aggregates. |
| Facility Simulation | Event/schedule driven rather than per-frame polling. |
| Distant Ports | Coarse ticks with deterministic queues, stock transactions and incident checks. |
| Vessel Traffic | Prioritise important/near vessels; route summaries at distance. |
| Navigation Aids | Shared spatial queries and LOD presentation, not independent AI actors. |
| UI | View models update on events/diffs and virtualise large rosters/queues. |
| Save | Store deltas, identities, queues and summaries; rebuild derived indexes/caches. |

## 47.1 Redesign Triggers

- Port capability can only be calculated by scanning all structures every tick.
- Berth assignment depends on hardcoded vessel names or scene sizes.
- Distant shipyards create resources or vessels without transaction reconciliation.
- Crew cohorts cannot promote without losing identity, casualties, contracts or history.
- One port with moderate traffic exceeds agreed NPC, navigation or save budgets.
- Optional maritime packs cannot be removed or quarantined safely.
- Port closure, incident or damage does not propagate clearly to services and routes.
- Players must use debug information to understand berth, crew or service failure.

# 48. Staged Implementation Plan

| Stage | Scope | Exit Evidence |
| --- | --- | --- |
| J0 - Contracts | Schemas, IDs, Port/Harbour/Facility/Crew records and reason codes. | Validation fixtures and source-of-truth review. |
| J1 - Landing and Port Node | Natural landing, anchorage, simple jetty, Port Node and basic authority. | Arrival/landing/save flow. |
| J2 - Berths and Services | Berth solver, storage, cargo transfer, provisioning and Port Call. | Atomic service and compatibility tests. |
| J3 - Shipyard Integration | Shipyard profiles, 26I selection, 26H order/build/launch. | NPC-built persistent vessel. |
| J4 - Crew Foundation | Crew records, jobs, contracts, stations, watches and readiness. | Crewed vessel departure and return. |
| J5 - Harbour Networks | Channels, pilotage, signals, lighthouse, rescue and closures. | Storm/incident response scenario. |
| J6 - Settlement Integration | Seven needs, districts, planner, growth and culture packs. | Maritime settlement progression corpus. |
| J7 - LOD and Multiplayer | Distant port/crew summaries, promotion, authority and recovery. | Soak, disconnect and reconciliation tests. |
| J8 - Production Hardening | Packs, migrations, accessibility, budgets, CI and 26K handoff. | Release evidence bundle and accepted integration obligations. |

# 49. Cross-Document Integration and Main-Document Amendments

| Document/System | Required Amendment from 26J |
| --- | --- |
| 00 - Master Bible | Add maritime civilisation/player fantasy and port/crew interconnection. |
| 01 - Core Loop | Add sail/arrive/service/crew/port-development loops without forcing them. |
| 02 - Progression | Add maritime skills, knowledge, reputation and crew leadership hooks; final mapping in 26N. |
| 03-06 Registries | Add port blocks, shipyard tools, supplies, recipes and material facets through 26N/Set 25. |
| 07 - NPC Village | Add maritime jobs, crew/cohort, port services, voyage absence, home port and shipyard orders. |
| 08-09 Automation/Magic | Add port logistics, cranes, pumps, mana services, signals and specialist facilities. |
| 11 - Worldgen | Consume 26C harbour contexts and port-placement/relationship contracts. |
| 12 - Structures | Add operational port/harbour/shipyard/lighthouse/rescue structure families and dynamic states. |
| 13 - Cultures/Factions | Add maritime traditions, authorities, crew law and port ownership without ancestry coupling. |
| 15 - Quests/Events | Add port calls, shipbuilding, rescue, closure, crew and incident objective/event modules. |
| 16 - Combat/Defence | Add port protection, crew/security and later 26L interfaces. |
| 17 - UI/UX | Add port, harbour, shipyard, crew, berth, Port Call and readiness views. |
| 18 Replacement | Add Godot services, authority, LOD, saves, traffic, crew cohorts and performance. |
| 19-20 Settlement/Buildings | Add maritime capability overlays, facility definitions, districts and activation contracts. |
| 21-23 Forge | Add port facility blueprints, markers, event sockets, captures and test contexts. |
| 24 Atlas | Reference operational contracts without changing authored world content. |
| 25 Set | Register schemas, relationships, capabilities, packages, validations and backlog. |
| 26I | Receive governed crew/port/service requirements for future blueprint schema extensions. |
| 26K | Consume port nodes, crews, services, shipyard capacity and Port Call contracts. |
| 26L-26O | Consume crew stations, emergency, settlement, UI, registry and technical requirements. |

# 50. Formal Handoff to 26K

- 26K may create route, fleet, trade, piracy, patrol, convoy, migration, blockade and naval-power logic only against real Port Nodes, Vessel Instances, Crew Records and service capacity.
- 26K may not treat a port band as unlimited cargo, repair, recruitment, supply or military capacity.
- Every fleet departure must pass 26J crew, provisioning, berth/approach, service and authority readiness interfaces unless an explicit emergency/hostile exception is recorded.
- Every fleet arrival creates or reconciles a Port Call, berth/anchorage demand, cargo/people transfer and service state.
- Port congestion, closure, damage, law, labour and shortages must be valid causes of rerouting, delay and regional consequence.
- Tariffs, market prices, piracy, privateering, smuggling, blockades and naval strategy belong to 26K/26N, but must use 26J operational facilities and permission interfaces.
- 26K must preserve individual important vessels and crews while allowing bounded fleet/route summaries at distance.
- NPC fleet demand may create Vessel Production Orders, but actual design selection, shipyard acceptance and construction remain 26J/26H/26I governed.
- 26K must return route demand, port pressure, mission types and fleet-service requirements through governed schema extensions rather than hardcoded port exceptions.

> **26K Boundary**
>
> Document 26J decides whether a port, shipyard and crew can operationally support a vessel. Document 26K decides why vessels travel, what fleets do, what routes carry, how piracy and navies alter regional power, and what economic or political consequences follow.

# Appendix A. Port, Harbour and Facility Record Templates

```yaml
port_definition:
  port_definition_id: leyforge.maritime.port.working_generic
  schema_version: 1
  capability_band_summary: P3
  activation_requirements:
    required_capabilities:
      - leyforge.capability.maritime.safe_landing
      - leyforge.capability.maritime.berth.small
      - leyforge.capability.maritime.cargo_transfer
    authority_required: true
    water_route_required: true
  allowed_facility_families: []
  settlement_need_contributions: []
  exclusions: []
  fallback_groups: []

port_instance:
  port_instance_id: port:<ULID>
  definition_id: leyforge.maritime.port.working_generic
  settlement_instance_id: settlement:<ULID>
  harbour_instance_ids: []
  port_node_ids: []
  authority_ref: faction_or_owner_ref
  facility_instance_ids: []
  service_instance_ids: []
  current_band_summary: P2
  lifecycle_state: operational
  closures: []
  incident_history: []
  save_version: 1

berth_record:
  berth_id: berth:<ULID>
  port_instance_id: port:<ULID>
  facility_instance_id: structure_instance:<ULID>
  berth_type: quay
  water_body_id: water_body:<stable_id>
  length_limit_m: balance_draft
  beam_limit_m: balance_draft
  depth_profile_ref: bathymetry_segment:<id>
  overhead_clearance_profile: null
  service_connectors: []
  environment_limits: []
  permissions: []
  current_assignment: null
  condition_state: operational
```

# Appendix B. Crew, Job, Contract and Assignment Templates

```yaml
crew_record:
  crew_id: crew:<ULID>
  display_name: Example Crew
  culture_id: null
  faction_id: null
  home_port_id: port:<ULID>
  assigned_vessel_id: vessel:<ULID>
  named_member_ids: []
  cohort_records: []
  hierarchy_profile_id: leyforge.maritime.crew_hierarchy.generic
  contract_ids: []
  readiness:
    manning_state: below_safe
    fatigue_band: rested
    morale_band: steady
    health_restrictions: []
  watch_plan_id: null
  history_event_ids: []
  lod_state: individual

crew_contract:
  contract_id: contract:<ULID>
  crew_or_npc_ref: crew:<ULID>
  employer_ref: player_or_faction_ref
  vessel_or_port_ref: vessel:<ULID>
  term_type: voyage
  obligations: []
  support_terms: []
  compensation_model_ref: economy_contract:<id>
  risk_disclosure_refs: []
  start_time: null
  end_conditions: []
  status: proposed

station_assignment:
  assignment_id: assignment:<ULID>
  vessel_id: vessel:<ULID>
  station_element_id: vessel_element:<stable_id>
  assignee_ref: npc_or_cohort_ref
  role_id: leyforge.core.job.maritime.helmsman
  watch_id: watch:<ULID>
  priority: normal
  current_validity: pending
  blockers: []
```

# Appendix C. Shipyard Order and Port-Call Templates

```yaml
vessel_production_order:
  order_id: vessel_order:<ULID>
  client_ref: settlement_or_player_or_faction
  purpose_profile_id: leyforge.maritime.use_profile.coastal_workboat
  requested_capabilities: []
  candidate_family_query: {}
  selected_blueprint_revision_id: null
  material_profile_id: null
  shipyard_instance_id: shipyard:<ULID>
  project_instance_id: null
  priority: normal
  resource_authority_ref: warehouse_or_contract
  acceptance_profile_id: leyforge.maritime.acceptance.coastal_workboat
  status: candidate_selection
  provenance: npc_order

port_call:
  port_call_id: port_call:<ULID>
  vessel_id: vessel:<ULID>
  crew_id: crew:<ULID>
  port_instance_id: port:<ULID>
  approach_channel_id: channel:<ULID>
  berth_or_anchorage_id: null
  authority_clearance_state: requested
  arrival_time: null
  requested_services: []
  service_order_ids: []
  cargo_transfer_ids: []
  passenger_manifest_ref: null
  incident_ids: []
  departure_readiness: blocked
  departure_time: null
  close_reason: null
```

# Appendix D. Capability and Service Catalogue

| Category | Candidate Capabilities |
| --- | --- |
| Access | safe_landing; safe_anchorage; berth.small; berth.medium; berth.large; tidal_berth; passenger_accessible_landing. |
| Navigation | pilotage; channel_marking; lighthouse_guidance; sounding; chart_service; storm_warning; signal_service. |
| Cargo | manual_transfer; crane_transfer; bulk_transfer; liquid_transfer; cold_storage; hazardous_storage; bonded_storage. |
| Provisioning | freshwater; food; preservation; fuel; mana_charge; tools; spares; medicine; crew_lodging. |
| Shipyard | small_vessel_build; large_vessel_build; afloat_repair; haul_out; dry_repair; rigging; engine; mana_drive; refit; restoration. |
| Crew | recruitment; training; certification; safe_manning; medical; shore_leave; contract_administration. |
| Safety | rescue; firefighting; quarantine; storm_refuge; contamination_response; wreck_marking; evacuation. |
| Authority | entry_clearance; berth_assignment; customs; salvage_claim; hazardous_work_permit; emergency_closure. |

# Appendix E. Validation and Reason-Code Catalogue

| Domain | Code Prefix | Examples |
| --- | --- | --- |
| Port Identity | PORT_ | PORT_AUTHORITY_UNRESOLVED; PORT_NODE_DUPLICATE; PORT_HISTORY_ORPHANED. |
| Approach | APPROACH_ | APPROACH_DEPTH_INSUFFICIENT; APPROACH_TIDE_WINDOW_CLOSED; APPROACH_MARKER_STALE. |
| Berth | BERTH_ | BERTH_OCCUPIED; BERTH_VESSEL_INCOMPATIBLE; BERTH_ACCESS_ROUTE_BLOCKED. |
| Facility/Service | SERVICE_ | SERVICE_FACILITY_INACTIVE; SERVICE_STAFF_MISSING; SERVICE_STOCK_MISSING. |
| Shipyard | SHIPYARD_ | SHIPYARD_PROFILE_UNSUPPORTED; SHIPYARD_BLUEPRINT_UNAPPROVED; SHIPYARD_LAUNCH_ROUTE_BLOCKED. |
| Crew | CREW_ | CREW_BELOW_SAFE_MANNING; CREW_STATION_UNREACHABLE; CREW_CONTRACT_INVALID. |
| Port Call | PORT_CALL_ | PORT_CALL_CLEARANCE_DENIED; PORT_CALL_TRANSACTION_CONFLICT; PORT_CALL_DEPARTURE_HELD. |
| Incident | INCIDENT_ | INCIDENT_RESPONSE_CAPABILITY_MISSING; INCIDENT_ROUTE_NOT_CLOSED; INCIDENT_HISTORY_INCOMPLETE. |
| LOD/Save | PORT_LOD_ | PORT_LOD_RECONCILIATION_FAILED; PORT_LOD_COHORT_PROMOTION_LOSS; PORT_SAVE_MIGRATION_BLOCKED. |
| Pack/Compatibility | PORT_PACK_ | PORT_OPTIONAL_PACK_MISSING; PORT_DEFINITION_QUARANTINED; PORT_FALLBACK_UNRESOLVED. |

# Appendix F. Example Port Profiles

| Profile | Context | Facilities and Services | Key Limits |
| --- | --- | --- | --- |
| River Ferry Landing | Small river settlement. | Ramp/jetty, shelter, small store, ferry berth, local pilot knowledge. | Draft, flood/current and passenger capacity. |
| Sheltered Fishing Harbour | Protected bay village. | Moorings, fish landing, market, cold/preserved store, boatyard, rescue. | Season, ecology, storm refuge and small-vessel focus. |
| Regional Trade Port | River mouth/coast town. | Quays, warehouses, cranes, customs, pilot, lighthouse, repair yard, crew services. | Channel/tide, congestion and maintenance. |
| Island Shipyard Port | Resource-rich island. | Building slips, material yard, workshops, dry dock, provisioning and worker housing. | Imported food/metal, labour and storm isolation. |
| Icebound Seasonal Harbour | Polar coast. | Ice markers, heated stores, refuge, repair, specialised pilot/rescue. | Seasonal closure and ice-capable vessels. |
| Arcane Realm Gateway Port | Major magical settlement. | Stabilised berths, mana services, wards, customs/quarantine, specialist shipyard and rescue. | Pack/progression, instability, law and high upkeep. |

# Appendix G. Completion Checklist

- Port/Harbour/Node/Berth/Facility/Service records are separated and use qualified IDs.
- Port capability overlays the existing settlement ladder and seven needs.
- Every service has physical, staff, stock, network, permission and condition requirements.
- Approach and berth decisions use actual 26C/26D/26F/26G evidence.
- Shipyards select explicit approved 26I revisions and execute through 26H projects.
- NPC-built vessels conserve resources and preserve provenance.
- Crew records preserve named people, bounded cohorts, contracts, stations, watches and history.
- Safe/effective manning is explainable and operation-specific.
- Port Calls preserve berth, service, cargo, incident and departure transactions.
- Port law interfaces exist without pre-empting 26K economy/power rules.
- Seven needs receive explicit maritime contributions and pressures.
- Culture/faction/biome/realm layers do not override universal contracts or personhood.
- Automation and magic provide physical supported services rather than abstract bonuses.
- Incidents create persistent evidence, service outages and recovery projects.
- LOD promotion/demotion conserves resources, crew, vessels, queues and history.
- Multiplayer authority and disconnect recovery prevent duplicate berth, stock or crew assignment.
- UI exposes cause, blockers, accepted risk and next actions through accessible channels.
- Set 25 schemas, relationships, capabilities, packs and validation evidence are proposed.
- Prototype laboratories cover port access, shipbuilding, crews, storms, LOD and pack removal.
- 26K handoff clearly separates operational port truth from route/fleet/regional-power truth.
