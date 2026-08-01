**Fantasy Voxel Civilisation Sandbox**

**20F - Districts, Complexes, Megaprojects and Wonders**

**Version 0.1 - Detailed Settlement Planning and Civilisation Project Registry Draft**

*A controlled registry for multi-building clusters, districts, campuses, civic and defensive complexes, regional nexuses, capital megaprojects and culture-defining wonders - allowing settlements and players to plan at city scale without replacing real buildings, resources, NPCs or voxel construction with abstract bonuses.*

| **Field** | **Locked Direction** |
|---|---|
| Document Scope | Detailed rules and registry entries for catalogue definitions 23, 59, 63, 69, 78 and 111-120 from Document 20H, plus shared planning rules for parcels, clusters, districts, campuses, complexes, regional nexuses, megaproject subprojects and wonders. |
| Needs Lock | Housing, Provisions, Health, Work, Safety, Infrastructure and Morale remain the only main settlement needs. District density, prestige, education, administration, transit, defence coverage, project momentum and wonder influence are calculations, capacities and causes - not additional need bars. |
| Core Philosophy | A plan coordinates real structures, networks, services, people and construction phases. It never creates beds, food, jobs, safety, trade, power, mana or prestige merely because a coloured district boundary or giant model was placed. |
| Planning Ladder | Building -> Parcel -> Cluster -> District -> Campus/Complex -> Settlement Plan -> Megaproject/Wonder. Each layer coordinates the layer below while preserving ownership, access, physical state and exact resources. |
| Player Blueprint Direction | Players may create clusters, district templates, campuses, complex plans, settlement plans and megaproject layouts both in-world and from the main menu. Designs may use required roles, optional roles, substitution rules, road/utility spines, phases, style kits and terrain adaptation. |
| NPC Growth Direction | Settlement planners select and phase 20F projects using real needs, density, travel, services, terrain, infrastructure, threats, specialists, laws, culture, story, resources, logistics, maintenance, disruption and expansion space. |
| Construction Direction | Complexes and megaprojects are graphs of independently saved subprojects. Enabling works, roads, utilities, supply yards, workforce support, partial activation, commissioning, damage and restoration all remain visible. |
| Simulation Direction | Nearby districts use real voxel buildings, traffic tasks, utilities, residents and construction. Distant simulation preserves parcel occupancy, capacities, resources, subproject progress, maintenance, risk, ownership and history through bounded summaries. |
| POC / Alpha Direction | Document 20F adds no new full POC building to the protected 30-definition roster. The first post-POC Alpha proves one adaptive Farmstead Cluster and one Market Square and Civic Centre; POC may use reduced plan-validation fixtures only. |
| Balance Direction | City-scale planning should create meaningful choices, not compulsory optimisation. Mixed-use, culture-specific, organic and low-density settlements remain valid. Megaprojects require automation, trade, contracts and time, but routine player intervention is limited to priorities, blockers and major decisions. |

| **Locked Scope Rule** |
|---|
| **Districts, complexes and wonders coordinate functioning lower-level content; they do not replace it.** A residential district has no housing without valid homes, a hospital campus has no treatment without health facilities, a citadel has no defence without staffed and supplied structures, and a wonder has no effect without completed, maintained and authorised subprojects. |

# Document Purpose

Document 20F defines how Leyforge moves from individual buildings to coherent farmsteads, neighbourhoods, industrial quarters, campuses, citadels, regional transit hubs, capitals, floating districts and wonders. It gives NPC settlements and players a shared planning language for grouping real blueprints, reserving land, connecting roads and utilities, sequencing construction, sharing services, adapting to terrain and preserving local identity.

The document also establishes strict scope boundaries. Leyforge should support impressive city growth without becoming a conventional top-down city-builder where zones automatically spawn buildings or where players must optimise traffic percentages every minute. Every district remains a collection of voxel structures, parcels, paths, NPCs, inventories, utilities and events. The player shapes goals, styles and major layouts while residents handle routine occupancy, work, maintenance and local adaptation.

# Design Sources and Dependencies

| **Source** | **20F Dependency** |
|---|---|
| 00 - Master Game Design Bible | Civilisation growth, player freedom, city-scale escalation, floating cities and world-shaping projects. |
| 01 - Core Gameplay Loop | Build, interact, automate, defend, upgrade and expand must remain connected through visible world response. |
| 02 - Player Progression | Settlement leadership, city scale, regional influence, portals, golems, wonders and world-shaping progression. |
| 03 - Blocks Registry | Voxel construction, shapes, damage states, functional markers, roads, walls, utilities, magic blocks and material families. |
| 04 - Items Registry | Exact construction resources, project stock, tools, cultural goods, machine parts, medicines, trade goods and rare wonder components. |
| 05 - Crafting and Recipe Registry | Project recipes, subproject stages, reservations, batch production, commissioning, repairs, rituals and megaproject costs. |
| 06 - Resource Progression | City-scale supply, older-material reuse, strategic resources, realm materials, automation deposits and endgame civilisation inputs. |
| 07 - NPC Village System | Population, jobs, homes, warehouses, projects, reputation, laws, families, migration, raids and simulation LOD. |
| 08 - Automation System | High-volume supply, logistics, power, golems, networks, risk and civilisation-scale throughput. |
| 09 - Magic System | Wards, rituals, leylines, portals, magical districts, floating structures, corruption, golems and world-state effects. |
| 10 - Creatures and Monsters | Siege, raids, patrols, creature routes, evacuation, district danger, magical threats and wonder attraction. |
| 11 - Biomes and World Generation | Terrain, climate, water, roads, resources, leylines, settlement sites, verticality, underground space and regional links. |
| 12 - Structures | Dynamic blueprint volumes, ownership, states, damage, restoration, markers, sockets, generation and structure LOD. |
| 13 - Races, Peoples, Cultures and Factions | Governance, architecture, district preferences, social organisation, signature complexes, diplomacy, laws and culture wonders. |
| 14 - Dimensions | Realm routes, persistent destinations, floating/realm infrastructure, hazards, resources and regional inactive simulation. |
| 15 - Quest and Event System | Major projects, contracts, political support, sabotage, ceremonies, disasters, restoration and persistent consequences. |
| 16 - Combat, Gear and Defence | Forts, walls, refuges, strategic stores, siege damage, command, evacuation and aftermath. |
| 17 - UI/UX System | Settlement map, parcel/district overlays, service causes, project graphs, permissions, milestones and readable alerts. |
| 18 - Technical Implementation Plan | Stable definitions/runtime records, simulation LOD, authoritative transactions, structure volumes, saves and performance budgets. |
| 19 - Settlement Growth and Player Voxel Blueprint System | In-world and main-menu planning, parcels, road graphs, clusters, district templates, settlement plans, player submissions and validators. |
| 20 / 20H | Seven-needs lock, stable IDs, catalogue ownership, settlement-stage matrix, project classes, POC lock and production waves. |
| 20A-20E / 20G | Lower-level housing/health/community; work/trade/education; governance/defence; storage/routes/utilities; magic/automation; culture, biome, faction and realm packs. |

# Static Table of Contents

- 1. Locked 20F Identity
- 2. Scope Boundaries and Anti-Micromanagement Rules
- 3. Seven-Needs Integration
- 4. Planning Scales and Ownership Hierarchy
- 5. Shared Plan, Parcel, Phase and Runtime Data Model
- 6. Parcels, Density, Mixed Use and Substitution Rules
- 7. Roads, Utilities, Service Coverage and Effective Distance
- 8. Project Pools, Dependencies, Phases and Partial Activation
- 9. Campuses, Complexes, Mixed Ownership and Public Access
- 10. Megaproject Lifecycle, Contracts, Workforce and Disruption
- 11. Wonders, Regional Effects and World-State Consequences
- 12. Damage, Occupation, Abandonment, Restoration and Transformation
- 13. NPC Planner and Project Selection
- 14. Player Plan and Blueprint Validation
- 15. Construction, Upgrade, Conversion and Replacement
- 16. Settlement-Stage Expectations
- 17. Detailed Registry Summary
- 18. Civic, Health, Education and Defence Complex Entries
- 19. Cluster, District, Campus and Nexus Entries
- 20. Megaproject and Wonder Entries
- 21. Post-POC Alpha Implementation Scope
- 22. Balancing, Performance and Simulation LOD
- 23. Open Questions for Later Balancing
- Appendix A. 20F Data Field Template
- Appendix B. Plan-Kind and Capability Matrix
- Appendix C. Post-POC Alpha Acceptance Checklist
- Appendix D. Cross-System Dependency Matrix
- Appendix E. Suggested Godot Resource and Runtime Records

# 1. Locked 20F Identity

20F is the settlement composition and civilisation-scale project layer of the building registry. It does not own ordinary cottages, workshops, roads, machines or wards. It owns the reusable plans and large complexes that arrange those definitions into coherent places, coordinate shared services and guide multi-stage growth.

| **Locked Rule** |
|---|
| A cluster, district, campus, complex, nexus, megaproject or wonder only provides the sum of its completed and functioning component services, plus explicitly defined coordination or regional effects. Plan boundaries, prestige labels, decorative scale and unfinished shells provide no hidden capacity. |

| **Identity Layer** | **Design Meaning** | **Player-Facing Result** |
|---|---|---|
| Adaptive Composition | Plans define roles, sockets, rules and ranges rather than one rigid pasted layout. | The same farmstead or district can fit different seeds, cultures and player styles. |
| Real Lower-Level Content | Homes, workplaces, roads, utilities and defences remain actual blueprints and runtime records. | City growth stays voxel-based and inspectable. |
| Phased Civilisation Growth | Large projects split into enabling works, buildings, networks and commissioning. | Players watch towns become cities rather than seeing instant stage swaps. |
| Shared Services | Campuses and districts coordinate access, utilities, storage, logistics and emergency coverage. | Large settlements gain efficiency without abstract free production. |
| Political and Social Scale | Authority, land, contracts, laws, culture and public access shape major projects. | Capitals and wonders create stories, factions and consequences. |
| Persistent World Memory | Complexes can be damaged, occupied, abandoned, restored, corrupted or repurposed. | The world visibly remembers wars, disasters and civilisations. |
| Scalable Simulation | Nearby sites remain physical while distant districts and subprojects use conserved aggregates. | Cities, capitals and multiple realms remain technically feasible. |

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

# 3. Seven-Needs Integration

| **Need** | **20F Contribution** | **Typical Failure Causes** |
|---|---|---|
| Housing | Residential districts and floating/vertical plans coordinate actual homes, local services, routes and utilities. | Empty parcels, insufficient beds, weak utilities, unsafe access, overcrowding or jobs too distant. |
| Provisions | Farmstead clusters, logistics nexuses and city planning connect food production, storage and distribution. | No water, storage, route, workforce, land or distribution capacity. |
| Health | Hospital complexes/campuses, sanitation, emergency routes and district planning increase treatment access. | Staff shortage, contaminated utilities, blocked emergency route, no medicine or unsafe industry. |
| Work | Universities, artisan districts, logistics hubs, civic complexes and megaprojects create real jobs and training. | No workplaces, specialists, inputs, freight, power, permissions or housing access. |
| Safety | Forts, citadels, ward networks, refuges, patrol routes and resilient utilities coordinate defence. | Coverage gaps, empty stores, unstaffed gates, no evacuation, broken relay or siege damage. |
| Infrastructure | Roads, utilities, civic coordination, campuses, transit and megaproject networks directly contribute. | Weak enabling works, overloaded services, disconnected districts, maintenance or incomplete phases. |
| Morale | Public centres, campuses, capital authority, culture identity, ceremonies and wonders support belonging and confidence. | Exclusion, unfinished prestige project, exploitation, repeated disruption, occupation or cultural rejection. |

# 4. Planning Scales and Ownership Hierarchy

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

## 4.1 Ownership Rules

- Individual buildings retain their own owner, staff, inventory and permissions even when inside a cluster or district.

- Public roads and utilities can cross private, guild, faction or household parcels through easements and laws.

- A campus may contain public, restricted, residential and service zones.

- Megaproject subprojects can have different sponsors and contribution ledgers while sharing one master project record.

- Conquest, annexation or faction change can transfer plan authority without silently transferring every private inventory.

- Player-founded settlements receive broader planning authority, but NPC rights, faction law and multiplayer ownership remain explicit.

# 5. Shared Plan, Parcel, Phase and Runtime Data Model

## 5.1 Definition Layers

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

## 5.2 Common Capacity Direction

| **Capability** | **Calculation Direction** | **Player-Facing Example** |
|---|---|---|
| Parcel occupancy | Valid completed building footprint and access within an approved parcel role. | 18/24 residential parcels occupied. |
| Service coverage | Real source capacity distributed through valid distance/routes/utilities to consumers. | West quarter clinic access: Strained. |
| District functionality | Component capacity x access/utilities/staffing/condition, aggregated without duplication. | Artisan district output blocked by freight road. |
| Coordination benefit | Explicit bounded reduction in travel, shared-service cost or response time. | Shared warehouse reduces haul time by 18%. |
| Project progress | Completed weighted subprojects and commissioning gates, not visual shell percentage alone. | Ward Core: 7/11 critical subprojects operational. |
| Wonder influence | Authored effect x completion x maintenance x ownership x world state within bounded area. | Leyline stability improved in 3 linked regions. |
| Disruption | Construction traffic, land use, noise/hazard, workforce draw and service closures, reduced by planning and mitigation. | Civic plaza route closed for 2 build stages. |

# 6. Parcels, Density, Mixed Use and Substitution Rules

## 6.1 Parcel Data

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

## 6.2 Density Bands

- Rural or dispersed.
- Low-density.
- Medium-density.
- Dense urban.
- Vertical/stacked.
- Underground/cavern.
- Floating/elevated.

Density changes parcel size, road demand, service expectations and building pools. It does not directly create population.

## 6.3 Mixed Use

Mixed-use blueprints and clusters are encouraged where functionally valid:

- Shop below, residence above.
- Workshop with artisan household.
- Inn with stable and market frontage.
- Civic hall with archive and public square.
- University faculty housing.
- Fort with town gate and customs.
- Farmhouse with food processing and workers.

The validator checks fire, noise, contamination, public/private access, freight and utility conflicts rather than banning mixed use by default.

## 6.4 Substitution Rules

A required role can accept:

- Exact building family.
- Valid upgrade or branch.
- Culture-specific replacement.
- Mixed-use blueprint containing the required service markers.
- Shared district service within acceptable travel/capacity.
- Magical or technological equivalent where progression allows.
- Player-created blueprint approved for the role.

Substitutions cannot double-count one capacity across incompatible roles.

# 7. Roads, Utilities, Service Coverage and Effective Distance

District plans reference the real route and utility systems owned by 20D/20E.

## 7.1 Route Hierarchy

- Regional approach.
- Primary avenue or freight road.
- Secondary street.
- Local lane/path.
- Service/loading route.
- Emergency route.
- Patrol/perimeter route.
- Water, rail, lift, portal or sky route where available.

## 7.2 Coverage Rules

- Straight-line radius is only a fast approximation.
- Final service uses route access, slope, gates, danger, congestion abstraction, utilities and capacity.
- Public services can have district priority or emergency overrides.
- A district may share a service outside its boundary when travel and capacity remain valid.
- Redundancy matters for hospitals, citadels, ward cores, floating anchors and capital utilities.
- A district does not fail because one decorative road is incomplete if a valid alternative route exists.

## 7.3 Player-Facing Causes

Examples:

- **Housing expansion blocked: no water capacity.**
- **Hospital emergency route crosses freight queue.**
- **University has classrooms but no faculty housing.**
- **Northern wall sector has no repair access.**
- **Market crowd capacity exceeds sanitation service.**
- **Floating platform has one anchor below redundancy target.**

# 8. Project Pools, Dependencies, Phases and Partial Activation

## 8.1 Project Pools

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

## 8.2 Dependency Types

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

## 8.3 Phase Vocabulary

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

## 8.4 Partial Activation

- A farmstead can produce after its first field, water and storage function.
- A hospital can treat patients before all specialist wings open.
- A university can teach before every research faculty exists.
- A fort can defend one approach while later walls are built.
- A district can house residents after the first service-complete block.
- A ward core can protect linked districts before full city coverage.
- A floating platform cannot accept residents until support, utilities and evacuation pass commissioning.

# 9. Campuses, Complexes, Mixed Ownership and Public Access

Complex planning must support institutions that contain multiple use types and owners.

## 9.1 Access Zones

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

## 9.2 Shared Services

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

## 9.3 Continuity

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

# 10. Megaproject Lifecycle, Contracts, Workforce and Disruption

## 10.1 Lifecycle

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

## 10.2 Contracts and Contributions

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

## 10.3 Workforce

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

## 10.4 Disruption and Mitigation

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

# 11. Wonders, Regional Effects and World-State Consequences

## 11.1 Allowed Effect Families

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

## 11.2 Effect Boundaries

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

## 11.3 World Memory

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

# 12. Damage, Occupation, Abandonment, Restoration and Transformation

## 12.1 Damage Granularity

- Individual building damage.
- Network segment failure.
- District service outage.
- Subproject damage.
- Landmark/core damage.
- Partial collapse.
- Fire/flood/corruption zones.
- Occupied or hostile parcel.
- Lost records or control.

## 12.2 Occupation and Conquest

- Military occupation can control gates, command, stores and public access without instantly owning every home or shop.
- Civic and wonder effects can change under disputed legitimacy.
- Resistance, fear, tribute, collaboration and sabotage remain faction/social systems.
- A captured portal or grid can be disabled for safety rather than immediately usable.
- Players can conquer, liberate, negotiate or restore according to world rules.

## 12.3 Restoration

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

# 13. NPC Planner and Project Selection

## 13.1 Plan-Level Scoring

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

## 13.2 Typical Planner Triggers

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

## 13.3 Player Influence

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

# 14. Player Plan and Blueprint Validation

## 14.1 Shared Validation

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

## 14.2 Cluster Validation

- Every required role can fit a valid parcel.
- Shared yard/open space is reachable.
- Water, storage and waste relationships are safe.
- Phases can activate without inaccessible future blocks.
- Terrain adaptation does not erase fields, routes or entrances.
- Optional roles do not block required expansion.

## 14.3 District Validation

- Parcel counts and density bands are within limits.
- Route hierarchy connects all required frontage.
- Utilities and services can reach expected demand.
- Hazard/incompatibility buffers are valid.
- Emergency access exists.
- Freight does not rely on pedestrian-only routes.
- Expansion and conversion are possible.
- No abstract capacity is assigned to empty zoning.

## 14.4 Complex/Campus Validation

- Anchor and support buildings are declared.
- Public and restricted circulation are separated where required.
- Utilities and shared service budgets are explicit.
- Emergency, maintenance and loading routes exist.
- Partial activation order is safe.
- Duplicate capacity between anchor and campus is prevented.

## 14.5 Megaproject/Wonder Validation

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

# 15. Construction, Upgrade, Conversion and Replacement

## 15.1 Upgrade Types

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

## 15.2 Conversion Rules

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

## 15.3 Demolition and Relocation

- Plans may remove or relocate optional buildings through valid projects.
- Residents and jobs need replacement capacity before forced clearance under normal laws.
- Materials can be recovered based on condition, skill and world settings.
- Heritage or sacred structures may require authority or create reputation consequences.
- Roads and utilities must be rerouted before critical removal.
- Megaproject cores usually require decommissioning, not instant block breaking.

# 16. Settlement-Stage Expectations

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

# 17. Detailed Registry Summary

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

# 18. Civic, Health, Education and Defence Complex Entries

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
| **Required plan or blueprint markers** | Emergency intake, public entrance, clean and contaminated circulation, treatment points, surgery, recovery beds, medicine storage, staff stations, kitchen/food link, sanitation, waste route, ambulance/cart access, fire exits and optional quarantine/cleansing zones. |
| **Placement and utilities** | Central enough for emergency access but separated from heavy pollution, uncontrolled portals and siege chokepoints. Requires reliable roads, water, sanitation, food, storage, emergency power and room for future wards. |
| **Construction / phasing profile** | 8-12 phases: site and utilities; core shell; emergency/treatment wing; clean services; recovery wards; stores and staff; sanitation/waste; optional specialist annexes; inspection and commissioning. Basic clinic functions may activate before the full complex. |
| **Upgrade and branch links** | Regional Hospital, Teaching Hospital, Military Hospital, Magical Healing Campus, Corruption-Cleansing Institute or disaster-response medical centre. |
| **Planner triggers and failure states** | Selected when city population, travel distance, casualty history, disease risk or specialist demand exceeds clinics. It underperforms when staff, medicine, water, sanitation, access or clean separation fail. |
| **Player-plan validation** | Must prove patient flow, staff flow, clean/dirty separation, emergency access, bed and treatment markers, medicine security, utilities, waste handling, fire/evacuation and partial activation order. |
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
| **Required plan or blueprint markers** | Teaching rooms, research stations, library/archive, practical training areas, staff offices, student access, secure/restricted stores, utility links, public lecture point, emergency exits and optional dormitory/meal links. |
| **Placement and utilities** | Accessible from housing and civic routes, protected from industrial hazards and able to expand by faculty. Some cultures may place it inside a temple, palace, guild quarter, cave, forest or floating district. |
| **Construction / phasing profile** | 9-14 phases: enabling works; core hall/library; first teaching wing; staff and records; practical/research facilities; utilities; public grounds; additional faculties; final commissioning. Basic academy services activate before university completion. |
| **Upgrade and branch links** | Grand University, Guild University, Arcane University, Military Academy Campus, Agricultural College, Dimensional Institute or distributed collegiate system. |
| **Planner triggers and failure states** | Selected when the city has stable basic needs, enough students and specialists, research demand and sustained resources. It can fail through faculty loss, archive damage, political restriction, unsafe research or insufficient utilities. |
| **Player-plan validation** | Must prove genuine teaching/research capacity, safe specialist rooms, library/knowledge storage, public and restricted circulation, staff/student support, accessibility and phased faculty activation. |
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
| **Required plan or blueprint markers** | Public entrance and queue, council/assembly chamber, offices, records store, blueprint/planning room, secure meeting room, notice/public interaction point, staff circulation, archive fire protection, emergency command and plaza/road sockets. |
| **Placement and utilities** | Prominent, accessible and defensible civic parcel connected to public transport, market, records and emergency routes. It should not be the only route through the city or an unavoidable military choke point. |
| **Construction / phasing profile** | 8-12 phases: civic site and plaza; core hall; public chamber; offices; records/planning; secure services; annexes; utilities and communications; ceremonial finish; commissioning. Town-hall services may remain active during expansion. |
| **Upgrade and branch links** | Capital Council Complex, Distributed Borough Administration, Palace/High Council Complex, Civic Castle, Grand Court or culture-specific assembly precinct. |
| **Planner triggers and failure states** | Selected when district count, population, service complexity and regional authority exceed the Town Hall. It becomes strained when staff, records, communications, public access or political legitimacy fail. |
| **Player-plan validation** | Must provide public and secure circulation, real staff/work markers, protected records, district-planning capacity, assembly space, emergency access and continuity during phased construction. |
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
| **Required plan or blueprint markers** | Public ceremonial approach, controlled audience area, high council/throne chamber, offices, diplomatic suites, secure archive, command centre, private/service circulation, guard posts, evacuation/refuge, utility redundancy and landmark sockets. |
| **Placement and utilities** | Capital landmark with controlled public access, secure logistics, multiple evacuation routes and separation between ceremonial, residential, administrative and strategic zones. It may integrate a citadel without becoming inaccessible to citizens. |
| **Construction / phasing profile** | 12+ subprojects: site/terraces; public approach; administrative core; council/throne hall; diplomatic wing; archives; service/residential wings; security and refuge; utilities; cultural art; commissioning and ceremonial activation. |
| **Upgrade and branch links** | Grand Palace, High Senate, Sacred Council Precinct, Floating Palace, Realm Embassy Court or World Council Complex. |
| **Planner triggers and failure states** | Selected after capital status, stable governance, diplomacy and major supply chains. Failure can involve legitimacy crisis, occupation, archive loss, faction conflict, siege or incomplete ceremonial commitments. |
| **Player-plan validation** | Must declare governance model and separate required public, diplomatic, secure, service and emergency flows; prove continuity, records, staffing, access, utilities and phased use. Visual grandeur alone grants no authority. |
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
| **Required plan or blueprint markers** | Controlled gate, command point, barracks beds, armoury, secure store, water source/reserve, refuge capacity, watch/signal positions, patrol sockets, repair access, evacuation and optional wall/perimeter connections. |
| **Placement and utilities** | Strategic high ground, route crossing, border, harbour or town edge with access to settlement logistics. It must not trap civilians or block all normal trade and emergency movement. |
| **Construction / phasing profile** | 8-12 phases: site/earthworks; walls/foundation; keep shell; gate and watch; stores/water; barracks/command; refuge; defences; optional annexes; commissioning. |
| **Upgrade and branch links** | Citadel and Fortified Perimeter Complex, Border Fortress, Harbour Fort, Mountain Fortress, Civic Castle or warded magical bastion. |
| **Planner triggers and failure states** | Selected when threat, border, route, wealth or political control justifies it. It is costly and can increase raid value, fear, occupation pressure or maintenance burden. |
| **Player-plan validation** | Must prove garrison logistics, controlled access, refuge, water, stores, patrol connection, evacuation, repairability and realistic defence coverage. Thick walls alone do not create readiness. |
| **Culture and style variation** | Timber hill fort, stone keep, dwarven gate-fort, desert kasbah, forest ring-fort, cliff fortress, harbour castle, floating guard platform or rune-bastion. |

# 19. Cluster, District, Campus and Nexus Entries

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
| **Required plan or blueprint markers** | Cluster boundary, parcel roles, field/animal zones, water point, central work yard, storage link, primary/secondary paths, expansion edge, waste/compost separation and optional utility sockets. |
| **Placement and utilities** | Fertile or culture-suitable terrain with water, sunlight/climate, safe access and enough expansion. It should not place animals or waste upstream of public water or block future settlement routes. |
| **Construction / phasing profile** | Phased: survey and access; first shelter/farmhouse; initial field and water; storage/barn; additional plots/animals; processing or automation; landscape/culture finish. |
| **Upgrade and branch links** | Agricultural Hamlet, Irrigated Farmstead, Orchard/Vineyard Cluster, Ranch, Automated Farm Cluster, Magical Crop Sanctuary or regional estate. |
| **Planner triggers and failure states** | Selected when provisions demand, suitable land and workers justify a coordinated rural cluster. It adapts or rejects sites with poor soil, unsafe distance, no water or route conflict. |
| **Player-plan validation** | Must define required and optional parcel roles, reachability, water, field clearance, animal/waste separation, storage and phased activation. A decorative farmhouse cannot satisfy the cluster alone. |
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
| **Required plan or blueprint markers** | Public-space boundary, stall parcels, civic frontage, notice point, road/junction sockets, loading/service access, crowd/assembly zones, emergency route, lighting, waste and optional event stage. |
| **Placement and utilities** | Central or highly connected parcel with room for crowds, deliveries and future buildings. Heavy freight should use service access rather than crossing pedestrian space where possible. |
| **Construction / phasing profile** | Phased: route and cleared square; notice/temporary stalls; hall frontage and basic market; storage/service; lighting/water/safety; permanent hall/stalls; optional culture and prestige modules. |
| **Upgrade and branch links** | Town Market and Civic District, Covered Bazaar, Merchant Forum, Festival Square, Canal Market, Civic Plaza or culture-specific central precinct. |
| **Planner triggers and failure states** | Selected when dispersed trade, public requests and civic travel need a shared centre. It becomes strained through crowding, blocked deliveries, poor sanitation, unsafe routes or insufficient storage. |
| **Player-plan validation** | Must separate public circulation from loading where required, provide valid stalls/services, civic access, emergency routes, waste handling and flexible event space. Decorative plaza blocks do not create trade capacity. |
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
| **Required plan or blueprint markers** | District boundary, parcel classes, freight hierarchy, public/worker access, utility spine, buffers, hazard zones, shared yards, emergency routes, waste route, expansion sectors and optional mixed-use edge. |
| **Placement and utilities** | Downwind/downstream or otherwise safely separated according to industry while still connected to housing, warehouse and trade. Terrain, water, resource deposits and existing culture affect form. |
| **Construction / phasing profile** | Phased enabling infrastructure; first artisan yard; storage and utilities; additional workshops; heavy industry branch; waste/safety; district services; density or automation upgrades. |
| **Upgrade and branch links** | Artisan Quarter, Foundry District, Magitech Industry District, Harbour Industry, Underground Works, Clean Production District or regional manufacturing zone. |
| **Planner triggers and failure states** | Selected when production buildings compete for land, routes and utilities or hazards threaten mixed settlement areas. It is rejected if staffing, logistics, buffers or waste handling are impossible. |
| **Player-plan validation** | Must define compatible/incompatible parcel roles, freight and worker circulation, utility capacity, hazard buffers, fire/emergency access, waste and phased activation. Zoning colour alone creates no service. |
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
| **Required plan or blueprint markers** | District boundary, housing parcel sizes, frontage rules, density bands, local centre, public space, route hierarchy, utility/service coverage, emergency access, expansion sectors and incompatible-use buffers. |
| **Placement and utilities** | Safe and reasonably connected terrain with access to work and civic services. Avoid heavy hazard exposure, flood zones, unstable magical sites and freight routes through local public spaces. |
| **Construction / phasing profile** | Phased roads/utilities; first housing cluster; local water/service; additional housing; public/community space; density upgrade; transit or mixed-use edge; prestige/landscape improvements. |
| **Upgrade and branch links** | Dense Urban Quarter, Garden District, Worker Housing District, Noble/Administrative Quarter, Mixed-Use Neighbourhood, Underground Residential District or floating neighbourhood. |
| **Planner triggers and failure states** | Selected when housing demand, travel distance or unplanned sprawl requires coordinated parcels and services. It can remain low density where culture or terrain prefers it. |
| **Player-plan validation** | Must prove real bed capacity through building definitions, safe routes, utility/service coverage, emergency access, reasonable work/service travel and future expansion. Empty residential zoning grants nothing. |
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
| **Required plan or blueprint markers** | Perimeter graph, sectors, gates, tower coverage, patrol path, command node, refuge, reserve stores, repair access, emergency exits, civilian routes, weak points, optional ward sockets and expansion gates. |
| **Placement and utilities** | Adapts to terrain, waterways, cliffs, existing roads and districts. Must preserve trade, evacuation and future expansion rather than enclosing the city into an unusable trap. |
| **Construction / phasing profile** | Sector-based subprojects: survey/earthworks; priority gates; towers/signals; first wall sectors; command/store/refuge; remaining perimeter; utilities/wards; strengthening and prestige. Partial sectors function independently. |
| **Upgrade and branch links** | Capital Citadel, Star Fortress, Mountain Gate Complex, Harbour Defence, Layered Ward Perimeter, Floating Bastion or culture-specific defensive landscape. |
| **Planner triggers and failure states** | Selected when city value, threat, faction conflict or strategic position justifies major defence. High cost, maintenance and political symbolism prevent it from being an automatic stage requirement. |
| **Player-plan validation** | Must expose real coverage and gaps, civilian/trade access, patrol and repair routes, refuge, supplies, gate logic, emergency exits and phased completion. The validator should not require a perfect geometric ring. |
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
| **Required plan or blueprint markers** | Campus boundary, anchor parcel, support parcel roles, public entrance, service entrance, emergency route, utility spine, shared green/court, housing/food links, expansion parcels and restricted zones. |
| **Placement and utilities** | Large city parcel or multiple linked parcels with reliable transit, utilities and future growth. Hospital variants prioritise emergency access; university variants prioritise public/student movement and research safety. |
| **Construction / phasing profile** | Enabling works; anchor complex phase; utilities/roads; first support building; grounds; staff housing/services; specialist annexes; expansion and prestige. The anchor can operate before full campus completion. |
| **Upgrade and branch links** | Teaching Hospital Campus, Grand University, Arcane Research Campus, Military Medical Academy, Distributed City Campus or realm-specific institute. |
| **Planner triggers and failure states** | Selected when one anchor complex is constrained by land, support services, traffic or future expansion. It is not required merely because the city owns a clinic or school. |
| **Player-plan validation** | Must identify anchor and support roles, separate public/service/emergency flows, prove utility and housing/food links, preserve expansion and avoid granting duplicate anchor capacity. |
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
| **Required plan or blueprint markers** | Nexus boundary, mode-specific terminals, transfer buffers, public and freight circulation, storage, customs, control, maintenance, emergency route, utility spine, future mode sockets and destination links. |
| **Placement and utilities** | City edge, harbour, river, rail corridor or major road intersection with enough land and safe separation from housing. It must connect into city streets without sending heavy freight through pedestrian centres. |
| **Construction / phasing profile** | Phased main road and warehouse; first terminal; loading/transfer; customs/control; second mode; maintenance; distribution; passenger services; optional advanced links. |
| **Upgrade and branch links** | Capital Transit Nexus, Multimodal Port, Portal Freight Nexus, Skyport Logistics Complex, Regional Caravan Hub or subterranean rail exchange. |
| **Planner triggers and failure states** | Selected when trade, travel and freight are blocked by disconnected terminals, repeated transfers or warehouse congestion. It is conditional on genuine regional routes and demand. |
| **Player-plan validation** | Must preserve separate inventories and route modes, prove transfer paths, buffers, ownership, passenger safety, heavy freight clearance, emergency access and phased activation. |
| **Culture and style variation** | Caravan crossroads, canal port, rail depot city, dwarven underground exchange, desert trade oasis, harbour metropolis, portal-linked freight court or vertical sky transit hub. |

# 20. Megaproject and Wonder Entries

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
| **Required plan or blueprint markers** | Core/nexus site, subproject graph, district anchors/stations, source links, control and emergency shutdown, maintenance routes, secure stores, coverage/destination map, public and restricted access, containment and fallback systems. |
| **Placement and utilities** | Capital-scale network across several protected sites. It must account for districts, terrain, leylines, threat, evacuation, ownership and sabotage rather than hiding all function inside one tower. |
| **Construction / phasing profile** | 12+ staged subprojects: research/authority; source/grid upgrades; core shell; first relay/station; district links; control/security; redundancy; additional nodes; testing; partial activation; final attunement and commissioning. |
| **Upgrade and branch links** | Regional Ward Network, Inter-City Portal Network, Realm Transit Authority, World Shield component or Leyline Crown integration. |
| **Planner triggers and failure states** | Selected only after capital governance, stable energy, specialists, district infrastructure and story/faction gates. Costs require automation, contracts, trade and long-term construction. |
| **Player-plan validation** | Must choose branch, define every subproject and network dependency, preserve exact source/destination or coverage state, provide shutdown/redundancy, security, maintenance and partial-failure behaviour. |
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
| **Required plan or blueprint markers** | Anchor sites, support/load graph, platform parcels, utility backbone, vertical transit, berths, freight/passenger separation, maintenance crawlways, weather sensors, emergency descent, refuge and exclusion airspace. |
| **Placement and utilities** | Requires clear airspace and compatible terrain/leyline/technology. Ground anchors and approach routes must avoid crushing existing districts, blocking flight or creating impossible evacuation. |
| **Construction / phasing profile** | Many subprojects: survey/airspace; ground anchor; energy plant; first lift/platform; stabilisers; utility spine; transit; initial parcels; skyport; redundancy; expansion platforms; commissioning. |
| **Upgrade and branch links** | Floating Residential District, Sky Industry, Airship Capital Port, Mobile Platform, Celestial Observatory City or inter-realm aerial nexus. |
| **Planner triggers and failure states** | Selected only when metropolis density, technology/magic, air routes or story goals justify extreme cost and risk. Failure may force evacuation, controlled descent, isolation or catastrophic regional events under severe conditions. |
| **Player-plan validation** | Must prove support/load budgets, redundancy, utilities, vertical logistics, evacuation, weather tolerance, maintenance access and staged occupancy. Visual levitation effects alone provide no structural capacity. |
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
| **Required plan or blueprint markers** | Wonder boundary, core, subproject graph, ceremonial/public routes, control/maintenance, utility sources, safety and evacuation, regional anchors, effect profile, ownership, damage/corruption states and world-state links. |
| **Placement and utilities** | A unique strategic and symbolic site selected through culture, terrain, history, leylines, faction politics and world events. It should reshape planning but not invalidate surrounding settlements. |
| **Construction / phasing profile** | Long multi-era project: discovery/design; coalition and site; enabling infrastructure; foundations; major substructures; specialist works; regional links; cultural art/ritual; testing; partial effects; final commissioning and recurring ceremonies/maintenance. |
| **Upgrade and branch links** | Wonders normally evolve through restoration, additional wings, attunement, cultural succession, realm linkage or corruption/cleansing rather than a simple linear tier. |
| **Planner triggers and failure states** | Selected through capital status, culture story, major research, rare materials and political consensus or conquest. Rival factions may support, sabotage, contest or attempt to claim it. |
| **Player-plan validation** | Must define bounded effects, required subprojects, costs, maintenance, staff, world-state interactions, capture/damage/restoration and save-safe consequences. Size and rarity alone grant no global bonus. |
| **Culture and style variation** | Leyline Crown, World Tree Sanctuary, Grand Archive of Ages, Colossal Golem Foundry, Celestial Orrery, Ancestral Mountain Hall, Eternal Beacon, Dream Spire, Ocean Heart or culture-authored player wonder. |

# 21. Post-POC Alpha Implementation Scope

20F does not expand the protected POC roster. Its first implementation work begins immediately after the Camp -> Hamlet -> Village cause-and-effect loop is reliable.

## 21.1 Alpha Slice A - Farmstead Cluster

The first cluster test should:

1. Load three terrain presets: flat meadow, gentle slope and river-edge terrace.
2. Reserve a flexible cluster boundary and entry route.
3. Select one valid farmhouse blueprint from an approved pool.
4. Place initial field, water and storage roles.
5. Compile exact construction resources by phase.
6. Allow NPC builders to complete the first functioning phase.
7. Produce and store real crops after staffing and water are valid.
8. Add optional barn or orchard without invalidating existing routes.
9. Save/reload during partial construction.
10. Replace one developer farmhouse with a player-made equivalent.
11. Damage one route or storage component and create a repair response.
12. Verify that the cluster contributes only the capacities of its components.

## 21.2 Alpha Slice B - Market Square and Civic Centre

The second cluster test should:

1. Reserve a central public-space boundary around existing roads.
2. Place temporary stalls and notice/request board first.
3. Connect Village Hall and Warehouse through real frontage and loading routes.
4. Support public, merchant, guard and service circulation.
5. Run one market day or festival event.
6. Show crowd, delivery, sanitation and safety causes without a new need bar.
7. Add a player-designed stall or civic frontage.
8. Upgrade one side into a permanent market hall or inn.
9. Preserve event and project history after save/load.
10. Verify that market capacity comes from real stalls, merchants, stock and access.

## 21.3 Alpha Technical Fixtures

Before full district content:

- Parcel role data and substitution tags.
- Cluster boundary and terrain adaptation.
- Required/optional project pools.
- Road and utility socket validation.
- Phased construction and partial activation.
- Plan runtime record and save migration.
- District service aggregation without double-counting.
- Player plan import/export in main-menu and in-world modes.
- Debug overlay for parcels, access, utilities and blockers.
- Performance test with several inactive clusters at distance.

## 21.4 Explicit Deferrals

- Full city procedural generation.
- Hospital, university and city-hall production assets.
- Real traffic simulation.
- Citadel perimeter AI.
- Regional transit nexus.
- Capital politics.
- Full megaproject contracts.
- Floating districts.
- Wonders and regional effects.
- Cross-realm city logistics.
- Large multiplayer city governance.

# 22. Balancing, Performance and Simulation LOD

## 22.1 Balance Principles

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

## 22.2 Suggested Update Rates

| **State** | **Suggested Update Approach** |
|---|---|
| Local construction, damage, gate closure or emergency | Event-driven / real time nearby. |
| Parcel occupancy and building activation | On project/building change. |
| Route and service aggregation | On network change plus bounded periodic refresh. |
| District needs and project scoring | Hourly or daily settlement tick. |
| Campus staffing and capacity | Work/production cycles and daily summary. |
| Megaproject resources and subprojects | Transaction-driven with daily planning update. |
| Political support, migration and regional effects | Multi-day or event-driven. |
| Distant district simulation | Daily bounded aggregate. |
| Wonder maintenance and regional state | Daily/weekly or event-driven depending on effect. |

## 22.3 Simulation LOD

### Near

- Real voxel buildings, roads, utilities and construction stages.
- NPC movement, work, crowds, deliveries and emergency responses.
- Physical damage and repair.
- Visible project supply and scaffolding.
- Local route and service validation.

### Medium

- Movement simplified between plan nodes.
- Building and service cycles aggregated at shorter intervals.
- Critical named NPCs, projects and inventories preserved.
- Reduced crowd and transport visuals.
- District causes remain available to UI.

### Far or Unloaded

- Parcel occupancy, population, jobs, stock, service capacities and maintenance persist in compact records.
- District travel and utility costs use bounded graph summaries.
- Megaproject subprojects consume only reserved delivered resources.
- No plan creates buildings or population without valid project transactions.
- Major accidents, attacks, migration, occupation and construction milestones create persistent events.
- Returning players see the correct voxel and ownership state promoted from records.

## 22.4 Performance Guards

- Cap active detailed districts per player area.
- Use hierarchical route graphs and service summaries.
- Validate plan edits incrementally.
- Generate construction task batches rather than one task per distant block.
- Keep plan definitions immutable; store only runtime deltas.
- Use parcel and district spatial indexes.
- Limit simultaneous megaproject subproject work by world settings and workforce.
- Profile dense city scenes in packaged Godot builds.
- Preserve deterministic state through promotion/demotion.

# 23. Open Questions for Later Balancing

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

# Appendix A. 20F Data Field Template

| **Field Group** | **Required Fields** |
|---|---|
| Identity | Stable ID; display name; plan kind; owner document; category; tags; schema version; planning status. |
| Stage and authority | Earliest stage; project class; governance authority; law/faction gates; story/research prerequisites. |
| Boundary and terrain | Plan boundary; parcel volumes; height/depth; slope; terrain policy; water/airspace; exclusions; expansion sectors. |
| Parcel roles | Required roles; optional roles; substitutions; footprint ranges; frontage; density; mixed-use; compatibility. |
| Routes and utilities | Route hierarchy; service/loading/emergency sockets; water; sanitation; power; mana; transit; redundancy. |
| Component definitions | Anchor buildings; support buildings; network pieces; public spaces; temporary enabling works; signature modules. |
| Capacity and needs | Primary/secondary needs; component aggregation; coordination effects; service targets; travel; demand; no-double-count rules. |
| Project graph | Phases; subprojects; hard/soft dependencies; partial activation; commissioning; cancellation; conversion. |
| Resources and labour | Exact/project-tag resources; reserves; contracts; workforce; specialists; tools; machines/golems; operating inputs. |
| Ownership and access | Public/private/guild/faction; leases/easements; restricted zones; contributor ledger; permissions. |
| Risk and continuity | Hazards; disruption; emergency routes; shutdown; refuge; containment; maintenance; redundancy; failure states. |
| Culture and style | Style kit; palette; landmark rules; cultural substitutions; prohibited/required forms; signage/banners. |
| Runtime | Parcels; placed components; occupants; services; routes; phase progress; blockers; condition; owner; history. |
| Effects | District coordination; regional/wonder effects; area; cap; maintenance; stacking; capture/damage/corruption. |
| UI and validation | Map legend; causes; project graph; alerts; validation errors; tutorial; contribution and milestone displays. |
| LOD and save | Near behaviour; medium aggregate; far tick; promotion/demotion; stable references; migration and recovery. |

# Appendix B. Plan-Kind and Capability Matrix

| **Plan Kind** | **Typical Scale** | **Required Proof** | **Partial Activation** | **Primary Risk** |
|---|---|---|---|---|
| Cluster | 2-8 related parcels | Required roles, access, shared resource/service. | Usually after first working building/plot. | Terrain fit and route conflict. |
| District | Many parcels and roads | Real buildings, route hierarchy, utilities, service access. | Block-by-block or sector-by-sector. | Sprawl, overload, hazard incompatibility. |
| Campus | Anchor plus support buildings | Anchor capacity, shared services, public/service/emergency flows. | Anchor may open before annexes. | Shared-service bottleneck. |
| Complex | Strategic multi-use structure group | Staffing, stores, access, command/records/refuge or specialist service. | Core service before prestige modules. | Single-point failure or public exclusion. |
| Nexus | Multiple transport/network modes | Separate modes, transfer buffers, control, ownership and routes. | First terminal before full multimodal hub. | Weakest link and congestion. |
| Megaproject | Multiple districts/subprojects | Enabling works, contracts, workforce, networks, commissioning. | Explicit milestone effects only. | Cost, disruption, politics and systemic failure. |
| Wonder | Unique regional/world project | Bounded effects, complete subproject graph, maintenance and world-state rules. | Limited authored effects at milestones. | Overpowered effects, capture, corruption or abandonment. |

# Appendix C. Post-POC Alpha Acceptance Checklist

- [ ] Farmstead Cluster adapts to at least three terrain presets.
- [ ] Required and optional parcel roles are data-driven.
- [ ] Cluster capacity equals component capacity without duplication.
- [ ] NPC planner can choose a valid farmhouse/field/water/storage combination.
- [ ] Construction phases consume exact reserved resources.
- [ ] First functioning farm phase activates before full cluster completion.
- [ ] Market/Civic Centre separates public, service and emergency circulation.
- [ ] Market capacity depends on real merchants, stalls, stock and access.
- [ ] Player-created building can substitute for one approved cluster role.
- [ ] Main-menu plan can be imported and proposed in-world.
- [ ] Invalid plans show specific parcel, route, utility or dependency errors.
- [ ] Save/load preserves boundaries, parcels, roles, phases and history.
- [ ] Damage to a component changes cluster service and creates repair work.
- [ ] Distant simulation conserves stock and project progress.
- [ ] Cluster planning does not add a new visible need.
- [ ] Organic settlement buildings remain usable outside formal clusters.
- [ ] Planner prefers repair/completion before unnecessary expansion.
- [ ] Controller-ready planning overlay shows parcels, phases and blockers.
- [ ] Stable IDs survive a schema migration fixture.
- [ ] Performance remains within the post-POC target with several distant clusters.

# Appendix D. Cross-System Dependency Matrix

| **20F System** | **Primary Dependencies** | **Dependent Systems** |
|---|---|---|
| Parcel and plan definitions | 19 blueprint system, worldgen, structures, stable IDs | Settlement planner, player towns, culture packs. |
| Cluster composition | Buildings 20A-20E, roads/utilities, NPC projects | Food, trade, housing, defence and early growth. |
| District aggregation | Need system, routes, utilities, runtime buildings | City UI, project selection, migration and services. |
| Complex/campus capacity | Anchor definitions, staffing, shared utilities | Health, education, governance, defence. |
| Megaproject graph | Recipes, reservations, contracts, automation, governance | Capital progression, quests, regional effects. |
| Wonder effects | Magic, factions, biomes, dimensions, story and saves | World state, diplomacy, migration, exploration. |
| Damage/restoration | Voxel state, combat, events, ownership, migration | Ruins, quests, faction outcomes and history. |
| Player plan validation | Main-menu/in-world editor, permissions, mod safety | Custom towns, multiplayer and content sharing. |
| Simulation LOD | Settlement records, route summaries, save system | Large cities, remote capitals and persistent realms. |
| Culture replacements | 13 and 20G | Unique district forms, governance and wonders. |

# Appendix E. Suggested Godot Resource and Runtime Records

| **Godot Resource / Record** | **Purpose** |
|---|---|
| ParcelRoleDefinition.gd | Allowed role tags, footprint, frontage, access, utilities, substitutions and compatibility. |
| ClusterPlanDefinition.gd | Required/optional parcel roles, shared space, routes, phases and terrain adaptation. |
| DistrictTemplateDefinition.gd | Density, parcel pools, route hierarchy, utilities, service targets, hazards and expansion. |
| CampusComplexDefinition.gd | Anchor/support roles, shared services, access zones, continuity and phased activation. |
| NexusPlanDefinition.gd | Transport modes, terminals, buffers, transfer rules, control and future sockets. |
| MegaprojectDefinition.gd | Subproject graph, milestones, resources, labour, contracts, effects, risks and commissioning. |
| WonderEffectProfile.gd | Bounded regional effects, maintenance, stacking, ownership, damage and world-state hooks. |
| RuntimeParcelRecord.gd | Placed parcel, owner, blueprint, condition, access, utilities and history. |
| RuntimePlanRecord.gd | Boundary, components, capacities, routes, phases, blockers, owner and change history. |
| RuntimeMegaprojectRecord.gd | Subprojects, contributors, resources, contracts, milestones, incidents and activation. |
| SettlementPlanValidator.gd | Functional, access, phasing, safety, capacity, authority and content validation. |
| DistrictServiceAggregator.gd | Event-driven aggregation of real building and network capacities without duplication. |
| PlanLODController.gd | Promotion/demotion between physical local state and compact distant summaries. |
| SettlementPlannerViewModel.gd | UI-ready map, causes, project graph, permissions, costs and validation messages. |
