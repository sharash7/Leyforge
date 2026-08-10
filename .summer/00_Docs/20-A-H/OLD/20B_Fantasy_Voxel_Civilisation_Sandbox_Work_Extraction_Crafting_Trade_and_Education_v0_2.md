# Fantasy Voxel Civilisation Sandbox

## 20B - Work, Extraction, Crafting, Trade and Education

### Detailed Functional Registry, Blueprint Forge Contracts and Settlement Production Rules

**Version 0.2 - Unified Forge and Runtime Integration Revision**

*A controlled registry for resource work, extraction, processing, artisan production, trade, education, knowledge and professional organisations. Version 0.2 preserves real resource conservation and NPC autonomy while integrating official Blueprint Forge source authoring, semantic contracts, construction-stage graphs, deterministic Godot runtime baking and the revised Technical POC scope.*

| **Field** | **Locked Direction** |
|---|---|
| Document Scope | Detailed rules and registry entries for catalogue definitions 31-38, 41-47, 51-58 and 60 from Document 20H v0.2. |
| Needs Lock | Housing, Provisions, Health, Work, Safety, Infrastructure and Morale remain the only main settlement needs. Education, skill, employment, productivity, commerce and wealth remain causes, services and progression data. |
| Primary Focus | Resource sites, raw processing, workshops, artisan production, markets, regional trade, schools, apprenticeships, libraries, archives, guilds and professional continuity. |
| Resource Rule | Extraction binds to real world resources; recipes consume exact inputs and create exact outputs and by-products; trade transfers owned stock; training consumes real time, tools and materials. |
| Official Authoring | Blueprint Forge owns editable official voxel sources, semantic layers, modules, material roles, construction stages, variants, placement and validation. |
| Player Creator | Document 19 exposes a restricted compatible creator. Player designs may satisfy approved definitions but cannot replace registries, forge lifecycle, migrations or authoritative production rules. |
| NPC Growth | Settlements select projects from required, optional and conditional pools using shortages, resource opportunity, production bottlenecks, staffing, succession, routes, safety, culture, cost and policy. |
| Simulation | Nearby workers, customers and learners act visibly. Distant settlements process bounded production, trade and training summaries while preserving stock, people, ownership, projects and history. |
| POC Direction | 20B contributes two Technical POC Core definitions and six Extended Forest Hamlet definitions. The first proof connects forestry and carpentry; the extended slice adds mining, masonry, smithing, trade and schooling. |
| Engine Direction | Godot/Summer Engine runtime products are deterministic derivatives of Forge source and registry data; they are never the editable source of truth. |

> **Locked Scope Rule**
>
> Work is one main need, not a collection of separate Employment, Skill, Education, Productivity, Trade, Wealth, Research or Tool bars. A finished workshop, school or market provides no output merely because its voxel shell exists. Valid workers, tools, stock, routes, permissions, semantic contracts, safety and commissioning must pass.

## Revision 0.2 Summary

Version 0.2 is an architectural integration pass rather than a redesign of production gameplay. It preserves all 24 approved 20B definitions and the existing work, extraction, trade and knowledge philosophy while connecting them to Documents 20 v0.2, 20H v0.2 and the Unified Forge.

Key changes are:

- Official developer source authoring is moved from the old generic Blueprint Workshop assumption into 22I Blueprint Forge.
- Universal definitions, Forge source, runtime bake products, projects and persistent structure instances are explicitly separated.
- Shared marker, zone, socket, resource-site and material-role contracts replace ad hoc blueprint-marker wording.
- Extraction sites now require explicit world-resource bindings and runtime conservation records.
- Workshops use shared workstation, input, output, tool, hazard and service-route contracts.
- Trade structures use real stock, ownership, manifests, contracts and route links rather than generated merchant inventory.
- Education and succession preserve named teachers, learners, curricula and professional continuity.
- Construction, upgrade, conversion, damage, occupation, restoration and pack resolution align with Blueprint Forge inheritance and deltas.
- The former eight-entry POC block is divided into two Technical POC Core definitions and six Extended Forest Hamlet definitions.
- Godot/Summer Engine resource boundaries, diagnostics, deterministic baking and test fixtures are made explicit.

# Document Purpose

Document 20B defines the productive, commercial and knowledge-bearing facilities that turn geography, resources, workers, tools and learning into settlement capability. It explains what makes a resource site valid, how workplaces execute real recipes, how trade moves owned goods, how education develops people and how professional organisations coordinate rather than invent capacity.

The document deliberately separates function from art. 20B defines what a lumber camp, mine entrance, carpenter, blacksmith, market, school or guild must accomplish. Blueprint Forge defines the official editable voxel source. Document 19 provides restricted player-compatible authoring. The runtime owns placed state, stock, workers, tasks, damage and history.

The goal remains depth without daily shift micromanagement. NPCs choose ordinary jobs, production cycles, deliveries, sales, lessons and apprenticeships from policies and priorities. The player intervenes when shortages, hazards, opportunities, contracts, specialist gaps, project needs, laws or strategic choices matter.

# Design Sources and Dependencies

| **Source** | **20B Dependency** |
|---|---|
| 03 - Blocks Registry | Workstations, storage blocks, placed functional components, shapes, hazards, damage states, access, material roles and block entities. |
| 04 - Items Registry | Tools, raw resources, refined materials, goods, books, records, quality, durability, ownership and manifests. |
| 05 - Crafting and Recipe Registry | Authoritative inputs, outputs, by-products, time, station profiles, batches, unlocks, project recipes and NPC production. |
| 06 - Resource Progression | Deposits, material tiers, grades, purity, fuels, renewable zones, old-material uses and progression gates. |
| 07 - NPC Village System | Named workers, jobs, skills, schedules, tools, warehouses, requests, trade, teaching, succession, memories and simulation LOD. |
| 08 - Automation System | Machine connections, logistics, buffers, power, throughput and advanced automated branches primarily owned by 20E. |
| 11 - Biomes and World Generation | Resource-zone generation, ecology, renewability, terrain, routes, weather and strategic-site placement. |
| 12 - Structures | Runtime structure identity, dynamic state, damage, repair, restoration, world evidence and structure LOD. |
| 15 - Quest and Event System | Contracts, discoveries, shortages, accidents, trade events, lost knowledge, guild disputes and persistent consequences. |
| 17 - UI/UX System | Work causes, job/service panels, production orders, trade ledgers, knowledge views, warnings and overlays. |
| 19 - Settlement Growth and Player Voxel Blueprint System | Settlement projects, parcels, player proposals, player-founded settlements and restricted player-facing creation flows. |
| 20 v0.2 | Shared namespaces, source-of-truth split, semantic contracts, construction stages, runtime lifecycle, planner and POC rules. |
| 20H v0.2 | Stable catalogue IDs, stage ownership, delivery scope and Forge-aware production tracking. |
| 20A / 20C / 20D / 20E / 20F / 20G | Households and provisions; law and safety; storage/routes/utilities; advanced industry and magic; campuses/complexes; culture and realm composition. |
| 21A-21G | Voxel Asset Forge source conventions, material systems, overrides, lifecycle, UI/UX and asset migration. |
| 22I - Blueprint Forge | Official building authoring, semantic layers, nested modules, inheritance, stages, states and world placement. |
| 22J - Unified Forge UI/UX | Manifest, dependency graph, validation, test laboratory, revision comparison and packaging workflow. |
| 22K - Forge Technical Plan | Godot Resources, registries, baking, caches, migrations, diagnostics, CI and runtime products. |
| 22L - Production and Migration | Visual production priorities, source migration, state coverage, review gates and release packaging. |

# Static Table of Contents

- 1. Locked 20B Identity
- 2. Scope Boundaries and Anti-Micromanagement Rules
- 3. Source-of-Truth and Record Separation
- 4. Seven-Needs Integration
- 5. Shared Work, Capacity and Service Model
- 6. 20B Semantic Marker, Zone, Socket and Resource-Binding Contracts
- 7. Jobs, Staffing, Skills, Tools and Succession
- 8. Extraction and Raw-Processing Rules
- 9. Crafting and Artisan-Production Rules
- 10. Trade, Contracts and Commerce Rules
- 11. Education, Knowledge, Apprenticeship and Guild Rules
- 12. Resource Conservation, Buffers, Quality and By-products
- 13. NPC Planner and Project Selection
- 14. Blueprint Forge Authoring and Official Source Validation
- 15. Restricted Player-Creator Validation
- 16. Construction Stages, Commissioning and Partial Activation
- 17. Upgrade Inheritance, Conversion and Replacement
- 18. Damage, Hazards, Occupation, Repair and Restoration
- 19. Networks and Cross-System Service Dependencies
- 20. Settlement-Stage Expectations
- 21. Detailed Registry Summary
- 22. Extraction and Raw-Processing Entries
- 23. Crafting and Artisan Entries
- 24. Trade and Professional-Service Entries
- 25. Education and Knowledge Entries
- 26. Technical POC and Extended Forest Hamlet Scope
- 27. Simulation LOD, Persistence and Multiplayer Authority
- 28. Balancing, Diagnostics and Anti-Exploit Rules
- 29. Godot/Summer Engine Implementation Direction
- 30. Open Questions for Later Balancing
- Appendix A. 20B Functional Definition Field Template
- Appendix B. Production and Knowledge Chain Matrix
- Appendix C. POC Acceptance Checklist
- Appendix D. Cross-System Dependency Matrix
- Appendix E. Validation and Diagnostic Code Catalogue

# 1. Locked 20B Identity

20B is the productive labour, commerce and knowledge layer of the universal settlement registry. Its definitions make resource gathering, transformation, exchange and learning physical and inspectable. They do not replace items, recipes, NPC identities, terrain, logistics, law or player creativity; they connect those systems through valid places, markers, routes, stock and persistent state.

> **Locked Rule**
>
> A 20B structure must expose a measurable resource, job, production, trade, training, knowledge or professional service. Visual machinery, shelves, market dressing or classroom furniture provide no capability unless the required contracts, people, stock, routes, permissions, utilities and commissioning state validate.

| **Identity Layer** | **Design Meaning** | **Player-Facing Result** |
|---|---|---|
| Real Workplaces | Jobs require valid sites, positions, workers, tools, stock, routes and safety. | A smithy without fuel or metal pauses with a clear cause. |
| Bound Resources | Extraction connects to actual renewable zones, deposits, terrain or generated resource state. | Mines and camps cannot produce from decorative terrain. |
| Conserved Production | Recipes consume exact inputs and create exact outputs and by-products. | Project materials and trade goods remain trustworthy. |
| Owned Commerce | Markets and trading posts transfer physical stock under permissions and contracts. | Merchant inventories do not refill from nowhere. |
| Knowledge Continuity | Teachers, apprentices, books, records and guilds preserve specialist succession. | Growth is not permanently dependent on one irreplaceable NPC. |
| Forge Authorship | Official layouts, stages and states are authored and validated in Blueprint Forge. | Many voxel designs may satisfy one stable function safely. |
| Scalable Simulation | Near activity is visible; distant work uses authoritative summaries. | Large settlements remain feasible without resource duplication. |

# 2. Scope Boundaries and Anti-Micromanagement Rules

| **Included in 20B** | **Handled through linked systems** | **Not routine player work** |
|---|---|---|
| Resource sites, raw processing, workshops, markets, trading posts, schools, archives and guilds. | Recipes in 05; households in 20A; law/safety in 20C; storage/logistics in 20D; advanced machines and magic in 20E; culture in 20G. | Assigning every shift, moving every stack, confirming each recipe cycle, setting each sale or scheduling every lesson. |
| Staffing, skills, tools, service capacity, production state, contracts, learning and succession. | Personal traits and schedules in 07; detailed economy balancing in commerce data; final prices and rates in balance tables. | New top-level Employment, Education, Productivity, Wealth, Trade, Skill, Tool or Research needs. |
| Official source validation, stages, damage states and runtime contracts. | Exact art and pack expression in Blueprint Forge and 20G; runtime instancing in Godot. | One mandatory developer floor plan or free output from decorative volume. |

- The seven needs remain the only top-level settlement needs.
- Ordinary task assignment, recipe selection, restocking, sales and lessons remain NPC-managed under policy and priority.
- Players may set project priorities, stock targets, contracts, permissions, protected zones and strategic production orders where authority allows.
- Exact block and component costs compile from the resolved construction-stage graph.
- A structure may be complete but dormant because workers, tools, inputs, output capacity, routes, utilities, law or commissioning are missing.
- Work capacity counts only suitable reachable jobs, not every decorative station or unstaffed building.
- Education creates progression and succession, not a compulsory survival bar for every settlement.
- Trade moves real stock and records loss, theft, delay or failure through explicit events.
- Culture and faction differences resolve through packs, laws and validated functional alternatives rather than duplicated universal entries.
- Distant simulation batches tasks but preserves important resources, people, contracts, knowledge, damage and history.

> **Explicit Non-Goals**
>
> 20B does not require manual shift rosters, realistic labour-law accounting, individual wage negotiation, continuous market speculation, full industrial engineering, one transaction for every distant hammer strike, a unique building for every craft or unlimited passive research from decorative bookshelves.

# 3. Source-of-Truth and Record Separation

## 3.1 Record Chain

```text
20B Universal Definition
        -> Blueprint Forge Editable Source
        -> Validated Construction and State Graph
        -> Deterministic Runtime Bake Products
        -> Construction Project Instance
        -> Persistent Structure Instance
        -> Job / Production / Trade / Learning Runtime Records
```

## 3.2 Responsibility Boundaries

| **Layer** | **Authority** | **20B Relationship** |
|---|---|---|
| Universal function | 20B and 20H | Stable ID, needs, planner role, stage, capacity logic and validation profile. |
| Official source blueprint | 22I Blueprint Forge | Voxel composition, modules, semantic layers, stages, states, placement and dependencies. |
| Runtime bake | 22K Forge pipeline | Collision, navigation, marker tables, work/resource proxies, stage products, LODs and diagnostics. |
| Player-authored source | Document 19 restricted creator | Compatible source using permitted profiles; no registry or migration authority. |
| Resource/item/recipe data | 03-06 | Blocks, items, deposits, recipes, outputs, quality, durability and progression. |
| Pack resolution | 20G | Culture, biome, faction, realm, history and approved player-style composition. |
| Construction project | 20 runtime | Site, source, resolved materials, reservations, labour, stages and blockers. |
| Structure instance | Runtime/save system | Ownership, staff, inventories, condition, permissions, source version and history. |
| Domain records | 07 plus production/trade/education services | Workers, jobs, cycles, contracts, learners, books, organisations and outcomes. |

## 3.3 Non-Duplication Rules

- The universal definition never contains a complete voxel source.
- Blueprint source never owns authoritative item or production totals.
- Runtime bake products are disposable derivatives and can be regenerated.
- Structure identity persists through source revision, pack changes, repair and migration.
- Resource zones and deposits retain their own identity and are referenced rather than copied into the building.
- Player blueprints receive unique `blueprint.*` IDs but normally satisfy existing `building.*` definitions.
- A workstation module does not become a new universal building unless it changes planner, capacity, risk or progression behaviour.
- One structure may host multiple compatible services, but shared routes, staff, stock and utilities are divided explicitly.

# 4. Seven-Needs Integration

| **Need** | **20B Authority or Contribution** | **Important Drill-Down Causes** | **Not a Separate Main Need** |
|---|---|---|---|
| Housing | Indirect through worker travel, mixed-use buildings and specialist attraction; 20A owns capacity. | Worker commute, temporary labour housing, attached residence and displacement. | Worker housing as a separate bar. |
| Provisions | Fuel yards, markets, trade and some artisan outputs support food, fuel, clothing and containers. | Fuel stock, trade relief, clothing, containers and project competition. | Fuel or clothing as separate needs. |
| Health | Workplace safety, contamination control and professional standards reduce injury and illness. | Heat, dust, collapse, wastewater, overwork, tool condition and treatment access. | Workplace safety or pollution as separate needs. |
| Work | Primary authority for suitable jobs, functioning sites, staffing, tools, inputs, training and productive labour. | Open jobs, unemployment, specialist gaps, paused sites, apprenticeship capacity and travel. | Employment, skill or productivity as separate needs. |
| Safety | Extraction supports, firebreaks, guarded trade, crowd routes and hazardous-work separation support Safety. | Collapse, fire, theft, hostile routes, unsafe tools, crowding and missing emergency access. | Mine safety, market security or fire risk as separate needs. |
| Infrastructure | Storage, loading, roads, water, power, waste and networks determine effective throughput. | Route blocks, full outputs, weak utilities, loading bottlenecks and maintenance. | Logistics or power as separate needs. |
| Morale | Meaningful work, fair trade, education and professional identity support stability. | Unemployment, exploitation, school access, guild conflict, fair prices and cultural acceptance. | Education, wealth or prestige as separate needs. |

# 5. Shared Work, Capacity and Service Model

## 5.1 Status Bands

- **Thriving** - suitable work and service comfortably meet demand with resilient inputs, skills and routes.
- **Stable** - normal demand is met and current blockers are minor.
- **Strained** - service operates but staffing, stock, tools, routes, safety or succession are near a limit.
- **Critical** - important production, trade or knowledge continuity is failing now.
- **Collapsed** - no safe or valid service remains for the affected capability.

## 5.2 Shared Calculations

| **Model** | **Calculation Direction** | **Player-Facing Example** |
|---|---|---|
| Work coverage | Suitable active jobs and training places compared with workers, unemployment and specialist demand. | Work: Strained - 3 open jobs; no blacksmith. |
| Production readiness | Valid source/site + staff + tools + inputs + output capacity + utilities + safe access + permission. | Carpenter: Paused - output storage full. |
| Effective throughput | Recipe rate modified by worker skill, tools, station, input grade, power, maintenance, safety and logistics. | Sawmill: 68% - blade worn; log intake stable. |
| Resource availability | Reachable authorised resource-zone state adjusted by depletion, renewal, hazard, terrain, route and policy. | Lumber zone: Sustainable; northern section closed. |
| Trade capacity | Vendors/contracts, stock, public/loading access, routes, permissions, security and destination capacity. | Trading Post: 1 of 2 routes active. |
| Training capacity | Instructor, learner positions, curriculum, tools/materials, linked practice and attendance. | Trade School: 6/10 seats; no master mason course. |
| Knowledge access | Preserved items/records, catalogue, staff, reading/research positions and permissions. | Archive: public collection open; maps restricted. |

## 5.3 Operational Contract

A production or service function activates only when its minimum contract passes. A shell may still provide storage, cover or public space where safely valid, but it cannot claim normal Work or output from a paused production function.

## 5.4 Capacity Trust Rules

- Visual size and repeated decorative stations do not create unlimited job capacity.
- Staff beyond marked and supported positions do not increase throughput.
- Input and output buffers contain real authoritative stock.
- One worker cannot perform incompatible simultaneous jobs.
- One tool or machine component cannot be used by several active cycles at once unless the item profile permits it.
- Production summaries must reconcile inputs, outputs, by-products, waste and recorded loss.
- Coverage and commute use real routes and permissions, not straight-line radius alone.

# 6. 20B Semantic Marker, Zone, Socket and Resource-Binding Contracts

## 6.1 Marker Families

```text
marker.entrance.public
marker.entrance.worker
marker.entrance.service
marker.entrance.emergency
marker.job.primary
marker.job.support
marker.job.supervisor
marker.job.maintenance
marker.job.instructor
marker.job.apprentice
marker.workstation.primary
marker.workstation.secondary
marker.workstation.practice
marker.tool.store
marker.storage.input
marker.storage.output
marker.storage.byproduct
marker.storage.secure
marker.loading.pickup
marker.loading.dropoff
marker.trade.vendor
marker.trade.customer
marker.trade.contract
marker.trade.manifest
marker.education.instructor
marker.education.learner
marker.knowledge.reading
marker.knowledge.research
marker.knowledge.archive
marker.extraction.muster
marker.extraction.face
marker.extraction.support_check
marker.repair.access
marker.construction.builder
marker.construction.inspection
```

## 6.2 Zone Families

```text
zone.work.clean
zone.work.dirty
zone.work.hot
zone.work.heavy
zone.work.public_service
zone.work.training
zone.storage.raw
zone.storage.finished
zone.storage.secure
zone.storage.hazardous
zone.public.market
zone.public.learning
zone.private.staff
zone.resource.forestry
zone.resource.quarry
zone.resource.mine
zone.resource.clay_sand
zone.hazard.fire
zone.hazard.dust
zone.hazard.collapse
zone.hazard.contamination
zone.hazard.machinery
zone.navigation.public
zone.navigation.worker
zone.navigation.service
zone.navigation.emergency
```

## 6.3 Socket Families

```text
socket.route.footpath
socket.route.service
socket.route.cart
socket.route.freight
socket.route.emergency
socket.storage.input
socket.storage.output
socket.storage.byproduct
socket.storage.contract
socket.mechanical_power.input
socket.electrical_power.input
socket.thermal_power.heat
socket.mana.input
socket.fluid.water
socket.fluid.wastewater
socket.ventilation.exhaust
socket.resource.zone
socket.resource.level
socket.module.workbay
socket.module.market_stall
socket.module.training_bay
socket.module.archive
socket.upgrade.extension
```

## 6.4 Resource-Binding Contracts

A resource-dependent facility references an authoritative world or bounded-resource record containing:

- Resource-site ID and profile.
- Spatial boundary, origin or portal/shaft link.
- Current quantity, grade, purity or renewable state.
- Allowed extraction method and tool tier.
- Ownership, law, protection and faction claims.
- Terrain, ecological, corruption and hazard state.
- Route and staging access.
- Depletion, renewal, replanting or restoration rules.
- Historical extraction and world evidence.

## 6.5 Contract Rules

- Decoration never satisfies a resource binding.
- Workstations declare supported recipe or service tags and capacity.
- Public, worker, loading and emergency routes may be independently validated.
- Clean output cannot silently cross a dirty or hazardous zone without an allowed transition.
- Machine and hot-work clearances are included in bake-time collision and navigation validation.
- Entity Forge body and movement envelopes determine worker, customer, mount and vehicle compatibility.
- Sockets declare direction, capacity, ownership, filter and network class.
- Semantic elements use stable internal IDs to support source revisions and save migration.

# 7. Jobs, Staffing, Skills, Tools and Succession

## 7.1 Staffing Rules

- Every workplace defines minimum, target and supported maximum staffing.
- Minimum staffing unlocks basic service; target staffing gives intended baseline capacity.
- Additional staff help only when valid work positions, tools, stock and routes support them.
- NPC job selection uses settlement priorities, suitability, skill, traits, household obligations, travel, danger, law and culture.
- Players may protect or prioritise key roles where authority allows, but routine reassignment remains automatic.
- Named specialists and apprentices remain persistent world characters.

| **Staffing State** | **Result** | **Planner Response** |
|---|---|---|
| No eligible worker | No operation. | Recruit, train, reassign, contract or delay. |
| Below minimum | Function unavailable. | Flag critical labour or specialist blocker. |
| Minimum met | Basic service. | Operate at reduced or baseline capacity. |
| Target met | Intended throughput. | Maintain supply, safety and succession. |
| Above target | Useful only with supported positions. | Expand, add shifts or reassign surplus. |
| Skill gap | Restricted tasks or reduced efficiency. | Train, simplify tasks or seek a master. |
| Tool gap | Worker present but task invalid. | Reserve, craft, buy, repair or deliver tools. |

## 7.2 Skill and Quality

Low skill normally reduces speed, yield, quality or recipe access rather than causing arbitrary catastrophic failure. Master workers can improve training, complex recipes, quality, waste reduction and emergency recovery. Exact effects remain balance data.

## 7.3 Tool Authority

Tools are real items with ownership, durability and suitability. A workplace may lend shared tools, require personal tools or reserve specialist equipment. Broken or missing tools create explicit blockers; they are not invisible productivity penalties.

## 7.4 Succession

Succession risk considers current specialists, health/availability, apprentices, teachers, migration, books/knowledge and time to competence. Schools, trade schools, guilds, visiting masters and player teaching can reduce risk without making education a compulsory main need.

# 8. Extraction and Raw-Processing Rules

## 8.1 Extraction Pipeline

1. World generation or surveying identifies a valid resource site.
2. Ownership, law, danger, ecology, tool tier, route and settlement need are checked.
3. A compatible facility source is selected and bound to the site.
4. Construction establishes safe access, staging, tools and service routes.
5. Workers extract actual blocks or consume bounded resource state through authoritative tasks.
6. Output enters real inventories and by-products or terrain effects are recorded.
7. Depletion, renewal, collapse, flooding, pollution, corruption and faction conflict alter future capacity.

## 8.2 Extraction Forms

- Direct block-by-block harvesting.
- Bounded node or zone depletion with visible world evidence.
- Renewable forestry or gathering zones.
- Quarry faces and benches.
- Underground headings and levels.
- Water, clay, sand, salt or surface-resource works.
- Hybrid visible and aggregate systems for large deposits.

## 8.3 Fairness and Ecology

Protected groves, heritage sites, settlement reserves, laws and player policies may restrict extraction. Sustainable forestry, replanting, drainage, supports, spoil control and restoration reduce long-term risk. Normal resources do not vanish without recorded extraction or world events.

# 9. Crafting and Artisan-Production Rules

| **Layer** | **Authority** | **Examples** |
|---|---|---|
| Recipe | Document 05 | Inputs, outputs, by-products, time, batch, station tags and unlocks. |
| Universal facility | 20B | Jobs, supported stations, buffers, service, hazards, planner role and progression. |
| Source blueprint | Blueprint Forge | Voxel layout, modules, semantic contracts, stages, states and placement. |
| Runtime production | Godot services | Orders, workers, stock, cycles, condition, transactions and diagnostics. |

- Workplaces choose orders from settlement projects, stock targets, contracts, repairs and player policies.
- A cycle reserves inputs and required tools before authoritative completion.
- Output enters defined buffers and retains ownership or project reservation.
- Blocked outputs pause safely after supported internal capacity fills.
- Quality is stored only where meaningful and is derived from registered factors.
- By-products remain real when strategically relevant; trivial residue may aggregate under defined waste categories.
- Universal families may support profile modules without multiplying definitions for every craft specialisation.

# 10. Trade, Contracts and Commerce Rules

## 10.1 Trade Principles

- Trade transfers real owned stock.
- Vendors require authority to sell or exchange listed goods.
- Imports enter a valid destination inventory and ownership ledger.
- Exports leave stock only through an authorised transaction.
- Caravans, boats, rails and portals are route implementations across 20D and 20E.
- Prices may respond to supply, demand, route danger, quality, culture and reputation, but important causes remain visible.
- Trade failure, theft, loss or delay creates a recorded event and does not silently erase goods.

## 10.2 Trade Modes

| **Mode** | **Stock and Ownership Rule** | **Typical Facility** |
|---|---|---|
| Local sale or barter | Vendor or settlement offers physical listed stock. | Market stalls or shops. |
| Import | Purchased or contracted goods enter controlled storage. | Trading post or exchange. |
| Export | Approved surplus or contract stock leaves authorised storage. | Trading post, caravanserai or exchange. |
| Consignment | Original owner retains title until sale or expiry. | Market or guild. |
| Project contract | Goods are reserved for a named project or service. | Trading post, guild or exchange. |
| Emergency requisition | Law permits withdrawal with history and consequences. | Civic/trade system during crisis. |
| Tax, toll or tribute | Transfer follows policy, route and authority. | Linked to 20C governance/customs. |

## 10.3 Public-Service and Loading Separation

Markets need safe public circulation and stock/service access. Larger facilities separate customer routes, loading, secure records, hazardous goods and emergency egress. A market that cannot be supplied may still host social events, but it does not invent sale stock.

# 11. Education, Knowledge, Apprenticeship and Guild Rules

## 11.1 Basic Education

A school requires a teacher or approved instructor, learner positions, curriculum or knowledge access, materials, safe routes and active attendance. It may support literacy, numeracy, settlement knowledge and apprenticeship readiness without becoming an eighth need.

## 11.2 Apprenticeship

Apprenticeship links a named master or instructor, learner, curriculum, practice station, tools/materials and often a real workplace. Progress survives save/load and distant simulation. Completion grants skill or qualification according to progression rules, not merely time spent inside a building.

## 11.3 Knowledge Storage

Books, maps, recipes, plans and records are physical or authoritative knowledge records with ownership, condition, catalogue state and permissions. A library improves access and preservation; it does not grant every knowledge item automatically.

## 11.4 Guilds and Professional Organisations

Guilds coordinate contracts, standards, membership, training, records and political interests for a selected professional profile. They may create benefits and conflicts, but a generic hall cannot grant every profession's services at once.

# 12. Resource Conservation, Buffers, Quality and By-products

| **Component** | **Rule** |
|---|---|
| Resource site | Output is limited by actual blocks, bounded deposit state or renewable profile. |
| Input buffer | Contains real items reserved for valid orders. Empty input means no cycle. |
| Tools/components | Reusable items have ownership, suitability and condition. |
| Work-in-progress | Active cycle persists through interruption, save and load. |
| Output buffer | Receives exact output and by-products until moved or consumed. |
| Quality | Stored only where meaningful and derived from declared factors. |
| By-product/waste | Created by recipe and routed, stored, recycled or disposed through valid systems. |
| Reservation | Project, contract or emergency stock is protected according to policy. |
| Ownership ledger | Records player, household, workplace, settlement, guild, faction or merchant ownership. |
| Loss | Occurs only through spoilage, theft, waste, fire, damage, hazard or explicit event. |

> **Resource Trust Rule**
>
> Important resources must remain traceable: where they came from, which site or order consumed them, what was produced, who owns the result and why a cycle stopped. Summary simulation may batch transactions but cannot create, duplicate or silently delete stock.

# 13. NPC Planner and Project Selection

## 13.1 Planner Pipeline

1. Measure Work coverage, unemployment, production blockers, resource opportunities, project demand, trade routes and succession risk.
2. Filter definitions by stage, site/resource binding, law, culture, research, ownership, safety, utilities and space.
3. Score benefit against resource cost, staffing feasibility, travel, logistics, maintenance, risk and redundancy.
4. Select a compatible official, settlement or approved player source.
5. Reserve parcel/site and construction stock.
6. Build through visible stages and commission the service.
7. Re-evaluate jobs, orders, trade, training and downstream projects.

## 13.2 Project Classes

| **Class** | **Examples** | **Selection Direction** |
|---|---|---|
| Required | Carpenter, mason and blacksmith at expected village capability. | Fill a stage-critical functional gap with an approved equivalent. |
| Optional | Sawmill, market, school, pottery, weaver or guild. | Score opportunity, economy, culture, demand and available labour. |
| Conditional | Quarry, clay works, mine, caravanserai or deep mine. | Require real site, route, demographic, strategic or story conditions. |
| Upgrade | Workshop expansion, deeper mine, covered market or training extension. | Prefer safe lower-cost improvement where continuity is preserved. |
| Player proposal | Approved worksite, market, school or guild source. | Must pass function, cost, site, law, pack and performance validation. |

## 13.3 Planner Anti-Spam Rules

- Do not build redundant production while the true bottleneck is stock, route, staff, tools or demand.
- Do not open extraction sites without a verified resource and hauling plan.
- Do not build specialist institutions without plausible staff or succession value.
- Prefer repair, conversion, added shifts, improved logistics or shared services when they solve the actual problem.
- Account for hazards, housing travel, maintenance and opportunity cost.

# 14. Blueprint Forge Authoring and Official Source Validation

## 14.1 Required Source Layers

An official 20B source may contain:

- Voxel structural and detail layers.
- Nested workbay, stall, yard, archive or training modules.
- Semantic markers, zones and typed sockets.
- Material roles and pack-exposed substitutions.
- Terrain or resource-site bindings.
- Construction-stage graph and partial activation rules.
- Functional state and damage deltas.
- Upgrade, conversion and extension links.
- Collision, navigation and Entity Forge envelope tests.
- Icon, thumbnail and inspection camera presets.
- Dependency, lifecycle, performance and package metadata.

## 14.2 Validation Layers

| **Layer** | **Examples** |
|---|---|
| Structural | Connected source volume, foundations, support, safe openings and stage coherence. |
| Semantic | Correct markers, stable element IDs, compatible zones and no unsupported duplicates. |
| Resource | Valid site binding, extraction boundary, deposit profile and world evidence contract. |
| Production | Supported workstation, input/output/tool buffers and recipe tags. |
| Access | Worker, public, service, loading and emergency routes as required. |
| Hazard | Fire, heat, dust, collapse, machinery, contamination, ventilation and exclusion rules. |
| Network | Storage, route, power, water, waste, ventilation and automation sockets. |
| Pack | Material-role resolution, silhouette and culture/biome compatibility. |
| Runtime | Deterministic bake, diagnostics, persistence references and budget compliance. |

## 14.3 Source Lifecycle

```text
Draft
-> Voxel Blockout
-> Semantic Pass
-> Resource/Production Contract Pass
-> Construction Staged
-> State Variants Complete
-> Pack Resolution Tested
-> Forge Validated
-> Runtime Baked
-> Gameplay Integrated
-> POC/Regression Tested
-> Shippable
```

# 15. Restricted Player-Creator Validation

## 15.1 Allowed Player Controls

- Voxel layout within declared bounds and budgets.
- Approved modules, workstations and semantic profiles.
- Material roles and unlocked pack palettes.
- Entrance, loading and internal route arrangement.
- Supported construction stages and optional extensions.
- Compatible visual style, signs, furnishing and decoration.
- Selected profession, production or training profile where the universal definition permits alternatives.

## 15.2 Restricted Controls

- Stable-ID or universal-registry replacement.
- Inventing unsupported recipe output, storage or worker capacity.
- Creating resource sites or moving deposits through visual placement.
- Disabling authoritative hazards, ownership or conservation.
- Arbitrary script execution or unrestricted runtime code.
- Migration aliases, package trust or server authority.
- Hidden markers outside permitted creator profiles.

## 15.3 Validation Profiles

| **Profile** | **Blocking Requirements** |
|---|---|
| Extraction | Real resource binding, work boundary, staging, tools, safe access, delivery and hazard controls. |
| Workshop | Supported stations, worker route, tools, input/output, utilities, service access and hazards. |
| Market/trade | Vendor/customer service, stock authority, public flow, loading, ownership, contracts and security. |
| School/training | Instructor/learner markers, curriculum/materials, safe routes and profile-specific practice. |
| Library/archive | Knowledge storage, permissions, reading/research access and environmental/fire security. |
| Guild/professional | Selected profession, real members/workplaces, records, contracts and supported services. |

A draft may be saved while invalid. NPC planners and gameplay services cannot use it until all blocking diagnostics pass.

# 16. Construction Stages, Commissioning and Partial Activation

## 16.1 Shared Stage Vocabulary

1. Planning and approval.
2. Survey, resource/site or route binding.
3. Site preparation and safety works.
4. Foundation, supports or work boundary.
5. Structure, shelter or primary yard.
6. Workstations, loading and utility installation.
7. Tools, buffers, records and specialist equipment.
8. Hazard controls and inspection.
9. Staffing, stock and commissioning.
10. Complete, expandable and maintainable operation.

Small facilities merge stages. Mines, markets and complex industrial sites may split them into independent subprojects.

## 16.2 Resource and Labour Rules

- Costs compile from the resolved stage graph and selected materials/components.
- Project stock remains exact and reserved in authoritative inventories.
- Builder labour is separate from future operating staff.
- Specialist participation may be required for commissioning rather than every construction stage.
- Interrupted stages preserve consumed stock, completed voxels and current safety state.

## 16.3 Partial Activation

- A lumber camp can stage logs after safe access and storage exist before full shelter is complete.
- A mine entrance may open one safe heading while later supports or systems expand.
- A workshop may accept orders once one complete workbay, tools and buffers pass.
- A market may open a subset of stalls while later modules are built.
- A school may teach in one valid room before all optional facilities complete.

## 16.4 Commissioning

Commissioning validates source version, site/resource binding, workers, tools, stock, routes, utilities, safety, permissions and initial service profile. Visual completion alone is not commissioning.

# 17. Upgrade Inheritance, Conversion and Replacement

## 17.1 Upgrade Models

- Child source inheriting a parent.
- Additive workbay, yard, stall or classroom module.
- Construction-stage delta.
- Capacity or utility upgrade using real components.
- Resource-site expansion or new level link.
- Profile conversion where compatible.
- Full parcel replacement with service continuity planning.
- Pack or culture re-resolution without functional duplication.

## 17.2 Examples

- Lumber camp gains a saw/storage module but remains distinct from a full sawmill definition.
- Mine Entrance links to a separately recorded Deep Mine Complex.
- Carpenter Workshop adds a furniture or component bay.
- Market Stalls inherit into a weather-protected cluster; Covered Market remains a different larger service model.
- Small School adds an outdoor lesson or archive module; Trade School adds specialist practice bays.
- Guild Hall changes professional profile only through explicit conversion, member and record migration.

## 17.3 Continuity Rules

Upgrades protect workers, apprentices, stock, contracts, knowledge and active projects. A replacement cannot delete work-in-progress, goods or records. Temporary closure and rerouting are planned where service cannot continue safely.

# 18. Damage, Hazards, Occupation, Repair and Restoration

## 18.1 Damage Groups

- Structural shell or support.
- Workstation or machine component.
- Input/output/tool storage.
- Loading and route access.
- Resource-site access or extraction face.
- Power, water, ventilation or waste link.
- Public/service or training area.
- Records, books, manifests or knowledge storage.
- Fire, dust, contamination, flood, collapse or corruption containment.

## 18.2 Operational States

```text
Ready
Running
Waiting Input
Blocked Output
Understaffed
Tool Missing
Route Blocked
Resource Depleted
Unsafe
Contaminated
Damaged
Under Repair
Closed by Law
Occupied or Contested
Abandoned
Ruined
Restoring
Converting
```

## 18.3 Persistent Consequence

Damage affects only the functions whose semantic elements or routes fail where possible. Occupation may transfer public access, contracts and production policy without silently transferring private goods. Lost books, destroyed tools, stolen stock and collapsed headings are explicit persistent events.

## 18.4 Repair and Restoration

Repair uses real components, tools, labour and access. Restoration can preserve heritage, return original function, convert to a new compatible service or leave a readable ruin. Source revisions and repairs use stable element IDs and migration rules.

# 19. Networks and Cross-System Service Dependencies

| **Dependency** | **20B Use** | **Failure Example** |
|---|---|---|
| Storage and reservations | Inputs, outputs, tools, contracts, books and project stock. | Output full; project stock protected. |
| Roads and freight | Worker access, hauling, customers, caravans and emergency routes. | Cart route blocked at narrow bridge. |
| Water and sanitation | Pottery, tannery, glass/brick, worker health and public markets. | Tannery paused - wastewater unavailable. |
| Mechanical/power | Sawmills, powered tools and advanced production. | Mill idle - drive network disconnected. |
| Mana and advanced industry | Magical tools, automation and late branches in 20E. | Rune-assisted process has no mana. |
| Governance/law | Ownership, trade, protected sites, contracts, guilds and closure. | Mine closed by sacred-site law. |
| Housing/provisions | Worker suitability, travel and labour resilience. | Specialist leaves due to no suitable home. |
| Defence/emergency | Route security, fire response, mine rescue and protected stock. | Caravan delayed by raid threat. |

## 19.1 Weakest-Link Rule

Effective service is normally limited by the weakest required link. A skilled worker cannot produce without tools or input; a full warehouse cannot help a workshop with no route; a market cannot sell stock it does not own.

## 19.2 Resource Authority

Items and quantities remain authoritative in inventory and transaction services. Presentation belts, carried props, shelf dressing and workstation animations are visual representations of that state.

# 20. Settlement-Stage Expectations

| **Stage** | **20B Minimum Expectations** | **Typical Optional or Conditional Growth** |
|---|---|---|
| Camp | Temporary gathering and manual work; no required permanent 20B structure. | Survey stakes, temporary harvesting or expedition worksite. |
| Hamlet | Local resource work and simple tool/component support when opportunities exist. | Lumber camp, mine entrance, clay/sand works, fuel yard. |
| Village | Carpenter, mason and blacksmith capability or valid alternatives; basic trade and learning become available. | Sawmill, quarry, ore sorting, pottery, weaving, market, trading post, school, trade school. |
| Fortified Village | Protected strategic production and reliable repair/guard supply. | Guarded stores, secured mine access, emergency contracts and training. |
| Town | Broader specialisation, advanced materials, regional commerce and preserved knowledge. | Deep mine, glass/brick works, market hall, caravanserai, library and guilds. |
| City | District-scale labour, exchanges, professional institutions and advanced production links. | Merchant exchange, specialist colleges and large trade networks. |
| Capital | Regional standards, strategic contracts, major archives and professional power. | Grand guilds, royal/faction workshops and interregional exchanges. |
| Magical Metropolis | Realm-linked resources, advanced knowledge and magitech production without replacing ordinary work. | Dimensional trade, magical archives and specialised cross-realm institutions. |

# 21. Detailed Registry Summary

| **No.** | **Stable ID** | **Definition** | **Earliest Stage** | **Primary Need** | **Planner Class** | **Delivery Scope** |
|---:|---|---|---|---|---|---|
| 31 | `building.extraction.lumber_camp` | Lumber Camp | Hamlet | Work | Optional | Technical POC - Core |
| 32 | `building.extraction.sawmill` | Sawmill | Village | Work | Optional | Alpha |
| 33 | `building.extraction.quarry_stone_yard` | Quarry and Stone Yard | Village | Work | Conditional | Alpha |
| 34 | `building.extraction.clay_sand_works` | Clay or Sand Works | Hamlet | Work | Conditional | Alpha |
| 35 | `building.extraction.mine_entrance` | Mine Entrance | Hamlet | Work | Conditional | Extended Slice |
| 36 | `building.extraction.deep_mine_complex` | Mine Shaft or Deep Mine Complex | Town | Work | Conditional | Beta |
| 37 | `building.extraction.ore_sorting_yard` | Ore Sorting Yard | Village | Work | Optional | Alpha |
| 38 | `building.extraction.charcoal_fuel_yard` | Charcoal Burner and Fuel Yard | Hamlet | Provisions | Optional | Alpha |
| 41 | `building.crafting.carpenter_workshop` | Carpenter Workshop | Village | Work | Required | Technical POC - Core |
| 42 | `building.crafting.mason_yard` | Mason Yard | Village | Work | Required | Extended Slice |
| 43 | `building.crafting.village_blacksmith` | Village Blacksmith | Village | Work | Required | Extended Slice |
| 44 | `building.crafting.pottery_kiln` | Pottery and Kiln | Village | Work | Optional | Alpha |
| 45 | `building.crafting.weaver_tailor` | Weaver and Tailor Workshop | Village | Work | Optional | Alpha |
| 46 | `building.crafting.tannery_leatherworker` | Tannery and Leatherworker | Village | Work | Optional | Alpha |
| 47 | `building.crafting.glass_brick_works` | Glassworks or Brickworks | Town | Work | Optional | Beta |
| 51 | `building.trade.market_stalls` | Market Stalls | Village | Work | Optional | Extended Slice |
| 52 | `building.trade.trading_post` | Trading Post | Village | Infrastructure | Optional | Extended Slice |
| 53 | `building.trade.covered_market_hall` | Covered Market or Market Hall | Town | Work | Optional | Beta |
| 54 | `building.trade.caravanserai_coach_inn` | Caravanserai or Coach Inn | Town | Infrastructure | Conditional | Beta |
| 55 | `building.trade.merchant_exchange` | Merchant Guild or Trade Exchange | City | Work | Optional | Beta |
| 60 | `building.professional.guild_hall` | Guild Hall or Professional Lodge | Town | Work | Optional | Beta |
| 56 | `building.education.small_school` | Small School | Village | Work | Optional | Extended Slice |
| 57 | `building.education.trade_school` | Apprentice or Trade School | Village | Work | Optional | Alpha |
| 58 | `building.education.library_archive` | Library or Archive | Town | Morale | Optional | Beta |

# 22. Extraction and Raw-Processing Entries

### 31. Lumber Camp

`building.extraction.lumber_camp`

| **Catalogue role**                      | Extraction / Forestry \| Hamlet \| Parcel \| Optional \| Technical POC - Core                                                                                                                                 |
|-----------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Work \| Secondary: Provisions, Infrastructure                                                                                                                                                |
| **Purpose**                             | Creates a controlled forestry job site with tool access, log staging and cutting-zone rules instead of letting a decorative woodpile generate timber.                                                 |
| **Capacity / service**                  | Draft small-team capacity: 1-4 foresters or lumberjacks, one active cutting zone and a limited log staging area. Output depends on reachable trees, regrowth policy, tools and hauling.               |
| **Jobs and users**                      | Forester, lumberjack, hauler and optional surveyor or nature specialist.                                                                                                                              |
| **Inputs**                              | Axes and saws, tool repairs, food for remote crews, optional seedlings, carts and safety equipment.                                                                                                   |
| **Outputs / services**                  | Logs, sticks, bark, sap, firewood and forestry information; may also reserve seed stock or mark protected trees.                                                                                      |
| **Required semantic contract**          | Job board, tool store, log staging, worker shelter, delivery socket, cutting-zone anchor and safe route to the forest.                                                                                |
| **Blueprint Forge source profile**          | Voxel worksite source with forestry boundary anchors, harvest and replant zones, worker/tool positions, log staging, delivery socket, shelter module, terrain-aware placement and active, depleted, storm-damaged and abandoned states. |
| **Runtime products, persistence and LOD**   | Persist bound forestry zone, approved harvest policy, workers, tools, staged and output stock, route state, regeneration/replanting actions, ecological condition and ownership. Distant output remains bounded by the same zone state. |
| **Placement and utilities**             | Forest edge or managed woodland with road/path access; must bind to an allowed forestry zone and respect protected, sacred or exhausted areas.                                                        |
| **Construction profile**                | 4 stages: clear and mark site; tool/supply shelter; log staging; activation and cutting-zone approval.                                                                                                |
| **Upgrade, inheritance and branch links**            | Sawmill link, forester lodge, managed plantation, cart loading yard or magical living-wood branch through 20G/20E.                                                                                    |
| **Planner triggers and failure states** | Selected when timber demand exceeds imports or casual gathering. Output falls when the zone is depleted, unsafe, inaccessible, overprotected or lacks tools/hauling.                                  |
| **Restricted player-creator validation**         | Must include a real zone anchor, safe storage and delivery route. Decorative trees or logs do not create resources; player designs cannot claim forestry output without valid nearby resource access. |
| **Pack and style resolution**         | Open timber camp, woodland lodge, cliff rope-yard, underground fungal wood works, living-tree stewardship site or nomadic cutting camp.                                                               |

### 32. Sawmill

`building.extraction.sawmill`

| **Catalogue role**                      | Extraction / Raw Processing \| Village \| Medium \| Optional \| Alpha                                                                                                     |
|-----------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Work \| Secondary: Infrastructure                                                                                                                                |
| **Purpose**                             | Processes logs into consistent planks, beams, boards and by-products with better yield and throughput than hand crafting.                                                 |
| **Capacity / service**                  | One or more saw stations with draft village throughput based on staff, power method and input/output buffers. It improves conversion efficiency but never creates timber. |
| **Jobs and users**                      | Sawyer, carpenter, mechanic, hauler and maintenance worker.                                                                                                               |
| **Inputs**                              | Logs, blades, lubricant or maintenance parts, mechanical/fuel/water power where required and recipe knowledge.                                                            |
| **Outputs / services**                  | Planks, beams, boards, shafts, sawdust, bark waste and construction components.                                                                                           |
| **Required semantic contract**          | Log intake, saw workstation, safety clearance, operator point, output racks, by-product bin, power socket and delivery route.                                             |
| **Blueprint Forge source profile**          | Modular mill source with log intake, blade or cutting station, output bays, mechanical/power sockets, maintenance clearance, hazard zones, optional yard modules and idle, running, jammed, damaged and upgraded state deltas. |
| **Runtime products, persistence and LOD**   | Persist recipe cycles, operator, inputs, outputs, by-products, drive/power state, blade/tool condition, buffers, blockers and maintenance. Moving parts are presentation over authoritative transactions. |
| **Placement and utilities**             | Near timber storage and road/water power access; requires noise, blade and fire separation from dense housing.                                                            |
| **Construction profile**                | 6 stages: foundation; frame; intake/storage; saw mechanism; power and safety; commissioning. Manual or water-powered variants may merge stages.                           |
| **Upgrade, inheritance and branch links**            | Powered sawmill, carpenter complex, automated lumber plant through 20E or culture-specific precision mill.                                                                |
| **Planner triggers and failure states** | Selected when building demand, timber waste or carpenter bottlenecks justify it. Pauses with no logs, dull/broken blades, blocked output, lost power or unsafe machinery. |
| **Restricted player-creator validation**         | Must resolve a supported saw process, operator access, guarded blade zone and separated input/output. A static saw prop cannot provide processing bonuses.                |
| **Pack and style resolution**         | Waterwheel mill, hand-frame saw house, dwarven gear saw, fae shaping grove, desert wind saw or mana-guided precision mill.                                                |

### 33. Quarry and Stone Yard

`building.extraction.quarry_stone_yard`

| **Catalogue role**                      | Extraction / Stone \| Village \| Large Parcel \| Conditional \| Alpha                                                                                                              |
|-----------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Work \| Secondary: Infrastructure                                                                                                                                         |
| **Purpose**                             | Combines a controlled stone extraction face with staging, sorting and basic stone supply for roads, walls and building projects.                                                   |
| **Capacity / service**                  | Draft 2-8 workers across one bound quarry zone; output depends on exposed stone, tool tier, safe benches, hauling and local geology.                                               |
| **Jobs and users**                      | Quarry worker, miner, stone sorter, mason, hauler and surveyor.                                                                                                                    |
| **Inputs**                              | Picks, hammers, wedges, supports, carts, repair supplies and optional blasting or magic permits at later tiers.                                                                    |
| **Outputs / services**                  | Rough stone, rubble, gravel, selected blocks, decorative stone and quarry by-products.                                                                                             |
| **Required semantic contract**          | Quarry-zone anchor, safe work benches, tool store, stone piles, spoil zone, loading socket, warning boundary and emergency route.                                                  |
| **Blueprint Forge source profile**          | Terrain-bound quarry source using extraction-face anchors, safe benches, stone staging, lifting/loading positions, drainage and exclusion zones, retaining modules and active, exhausted, flooded, unstable and restored states. |
| **Runtime products, persistence and LOD**   | Persist quarry face or deposit binding, safe working sectors, workers, tools, output, spoil, route and geotechnical condition. Distant simulation consumes bounded resource state and leaves world evidence. |
| **Placement and utilities**             | Valid rock face or shallow deposit with slope and collapse checks; should avoid undermining roads, homes, sacred ground or waterworks.                                             |
| **Construction profile**                | 5-7 stages: survey and boundary; access ramp; work face; storage/spoil; loading; safety inspection; optional crane.                                                                |
| **Upgrade, inheritance and branch links**            | Deep quarry, stone-cutting complex, automated quarry through 20E or culture-specific underground hall.                                                                             |
| **Planner triggers and failure states** | Eligible only where usable stone exists. Selected for sustained construction demand; output falls with exhausted faces, unsafe slopes, tool shortage, blocked hauling or flooding. |
| **Restricted player-creator validation**         | A player blueprint must bind to real stone terrain, define safe extraction and spoil areas, and preserve reachable work paths. It cannot mine arbitrary protected blocks.          |
| **Pack and style resolution**         | Open pit, stepped cliff quarry, underground chamber, river-stone works, crystal-cut yard or giant-carved stone face.                                                               |

### 34. Clay or Sand Works

`building.extraction.clay_sand_works`

| **Catalogue role**                      | Extraction / Earth Materials \| Hamlet \| Parcel \| Conditional \| Alpha                                                                                         |
|-----------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Work \| Secondary: Infrastructure                                                                                                                       |
| **Purpose**                             | Provides a flexible earth-material extraction family for clay, sand, gravel, salt or similar local deposits without duplicating one building for every material. |
| **Capacity / service**                  | Small crew and one bound deposit zone; yield and hazards use the selected resource profile.                                                                      |
| **Jobs and users**                      | Digger, washer, sorter, hauler and optional potter or mason.                                                                                                     |
| **Inputs**                              | Shovels, baskets/carts, water for washing where used, supports, drying space and maintenance.                                                                    |
| **Outputs / services**                  | Clay, sand, gravel, salt or related raw material plus rejects and washed grades.                                                                                 |
| **Required semantic contract**          | Deposit anchor, excavation zone, sorting/washing point, drying or stock piles, tool store and loading path.                                                      |
| **Blueprint Forge source profile**          | Resource-site source with clay, sand, gravel, salt or ash profile binding, dig/harvest zones, drying or washing modules, stock bays, water/waste sockets and weather, depletion, flood and contamination states. |
| **Runtime products, persistence and LOD**   | Persist resource profile and zone quantity/renewal, labour, water use, stock, waste, weather and contamination. A visual pit cannot create output without an authoritative site binding. |
| **Placement and utilities**             | Only eligible on a valid deposit with erosion, flood, collapse and protected-water checks.                                                                       |
| **Construction profile**                | 4-6 stages depending on material: survey; access; extraction area; processing/staging; drainage; inspection.                                                     |
| **Upgrade, inheritance and branch links**            | Pottery/kiln supply chain, brickworks, glassworks, salt house or automated earthworks through 20E.                                                               |
| **Planner triggers and failure states** | Selected when local material demand and deposit quality justify operation. Flooding, contamination, depleted layers, unstable walls or no hauling can pause it.  |
| **Restricted player-creator validation**         | Must use a supported resource profile and real deposit. Visual sand or clay decoration alone does not create output.                                             |
| **Pack and style resolution**         | River clay pit, dune works, salt pan, cavern silt basin, volcanic ash yard or magically separated earthworks.                                                    |

### 35. Mine Entrance

`building.extraction.mine_entrance`

| **Catalogue role**                      | Extraction / Mining \| Hamlet \| Medium \| Conditional \| Extended Slice                                                                                                           |
|-----------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Work \| Secondary: Safety, Infrastructure                                                                                                                               |
| **Purpose**                             | Creates controlled access, staffing, storage and safety for an underground mine network while leaving the actual ore inside the voxel world.                                     |
| **Capacity / service**                  | Draft 1-6 miners using one connected mine zone; capacity depends on reachable headings, ventilation, support, tool tier, light and hauling.                                      |
| **Jobs and users**                      | Miner, foreman, surveyor, support worker, hauler and guard where threats exist.                                                                                                  |
| **Inputs**                              | Picks, lights, supports, carts, food, repair materials and optional pumps or ventilation.                                                                                        |
| **Outputs / services**                  | Mined stone, ore, gems, clues, cave resources and underground route access.                                                                                                      |
| **Required semantic contract**          | Portal/entrance anchor, job board, tool store, ore staging, support inspection, ventilation/light, delivery socket and emergency muster point.                                   |
| **Blueprint Forge source profile**          | Voxel entrance and mine-support source with underground route anchor, controlled threshold, muster and tool areas, ore staging, ventilation/light sockets, collapse groups, emergency access and sealed, breached, occupied and restored states. |
| **Runtime products, persistence and LOD**   | Persist connected mine graph, open/closed headings, workers, supports, ventilation/light, ore staging, incidents, threats and emergency state. Surface structure damage can close access without deleting underground state. |
| **Placement and utilities**             | At a valid cave, shaft or carved route with stable terrain, surface access and no ownership conflict.                                                                            |
| **Construction profile**                | 6 stages: survey; portal supports; access tunnel; storage/tool area; lighting/safety; commissioning and mine-zone binding.                                                       |
| **Upgrade, inheritance and branch links**            | Deep mine complex, minecart depot, ore sorting yard, automated mine through 20E or culture-specific hold entrance.                                                               |
| **Planner triggers and failure states** | Only eligible with useful underground resources or strategic access. Can pause after collapse, flooding, gas, hostile occupation, missing supports, no tools or blocked hauling. |
| **Restricted player-creator validation**         | Must connect to a real mine volume and safe reachable route. Decorative tunnel mouths do not generate ore or teleport miners to abstract resources nearby.                       |
| **Pack and style resolution**         | Timber portal, stone adit, dwarven gate, desert sink mine, fae root tunnel, ice shaft or rune-stabilised crystal entrance.                                                       |

### 36. Mine Shaft or Deep Mine Complex

`building.extraction.deep_mine_complex`

| **Catalogue role**                      | Extraction / Advanced Mining \| Town \| Large Complex \| Conditional \| Beta                                                                                                            |
|-----------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Work \| Secondary: Safety, Infrastructure                                                                                                                                      |
| **Purpose**                             | Supports deeper extraction through lifts, ventilation, pumps, rails, support crews and specialised safety systems.                                                                      |
| **Capacity / service**                  | Multiple crews, levels and resource headings; throughput is limited by lift/rail capacity, ventilation, power, maintenance and danger.                                                  |
| **Jobs and users**                      | Mine foreman, miners, engineers, pump workers, rail operators, surveyors, rescuers and guards.                                                                                          |
| **Inputs**                              | Heavy supports, rails/carts, power, fuel, tools, spare parts, pumps, lights and safety supplies.                                                                                        |
| **Outputs / services**                  | Large volumes of ore and stone, rare deep resources, survey data and strategic underground access.                                                                                      |
| **Required semantic contract**          | Shaft/lift, level sockets, ventilation network, pump/drainage, ore loading, maintenance bay, rescue station, tool stores and restricted zones.                                          |
| **Blueprint Forge source profile**          | Nested complex source composed from shaft collar, lift, level, pump, ventilation, rail/loading, rescue and maintenance modules, with phased commissioning, sector damage, level closure, expansion sockets and deep-site binding. |
| **Runtime products, persistence and LOD**   | Persist independently operating levels and modules, lift/rail throughput, ventilation, pumping, crews, stores, hazards, closures and expansion history. Distant simulation aggregates per level while retaining incidents and named crews. |
| **Placement and utilities**             | Valid deep resource body and geologically stable shaft location with strong road/logistics access and risk permissions.                                                                 |
| **Construction profile**                | 8-12 stages built as subprojects: shaft collar; lift; ventilation; first level; loading; pumps; safety; expansion levels.                                                               |
| **Upgrade, inheritance and branch links**            | Automated deep mine, underground industrial district, dimensional bore or culture-specific mountain hold through 20E/20F/20G.                                                           |
| **Planner triggers and failure states** | Selected when shallow sources cannot meet demand and technology, specialists, capital and safety capacity exist. Major incidents can close levels without destroying the whole complex. |
| **Restricted player-creator validation**         | Player plans must prove shaft clearance, emergency egress, ventilation/pump coverage and loading logistics. Deep output requires actual generated resource access.                      |
| **Pack and style resolution**         | Timber shaft, steel headframe, dwarven lift hall, golem-mined cavern, leyline bore or void-shielded deep works.                                                                         |

### 37. Ore Sorting Yard

`building.extraction.ore_sorting_yard`

| **Catalogue role**                      | Extraction / Raw Processing \| Village \| Parcel \| Optional \| Alpha                                                                                  |
|-----------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Work \| Secondary: Infrastructure                                                                                                             |
| **Purpose**                             | Grades, separates, stores and prepares raw ore batches before smelting, trade or specialist processing.                                                |
| **Capacity / service**                  | One or more sorting tables and stock bays; improves batch consistency and can recover minor by-products based on skill and tools.                      |
| **Jobs and users**                      | Ore sorter, assayer, miner, hauler and optional merchant or smith.                                                                                     |
| **Inputs**                              | Raw ore, sample tools, hammers/screens, containers, labels and optional water or mechanical separation.                                                |
| **Outputs / services**                  | Graded ore batches, waste rock, concentrates, trade samples and processing records.                                                                    |
| **Required semantic contract**          | Raw intake, sorting/assay workstation, grade bins, waste pile, secure valuable stock, output/loading socket and records point.                         |
| **Blueprint Forge source profile**          | Open-yard or shed source with intake, grading stations, category buffers, waste/by-product areas, worker circulation, freight sockets and profile-driven sorting modules for ore, stone, crystal or salvage. |
| **Runtime products, persistence and LOD**   | Persist intake batches, grading results, category stock, waste, staff, tool state and blocked outputs. Sorting never changes total material except through registered recipes or losses. |
| **Placement and utilities**             | Between mine transport and furnace/warehouse routes; requires dust, runoff and theft controls.                                                         |
| **Construction profile**                | 4-6 stages: level yard; stock bays; sorting stations; secure storage; drainage/dust; activation.                                                       |
| **Upgrade, inheritance and branch links**            | Crusher/concentrator through 20E, assay office, rail loading yard or magical purity laboratory.                                                        |
| **Planner triggers and failure states** | Selected when ore volume, grade variation, smelter efficiency or trade value justify it. Blocked bins, absent sorters or contamination reduce benefit. |
| **Restricted player-creator validation**         | Must expose distinct intake, processing and grade outputs; a single generic stockpile cannot claim sorting efficiency.                                 |
| **Pack and style resolution**         | Hand-picking yard, water sluice, dwarven assay court, crystal resonance sorter or goblin scrap grading yard.                                           |

### 38. Charcoal Burner and Fuel Yard

`building.extraction.charcoal_fuel_yard`

| **Catalogue role**                      | Extraction / Fuel \| Hamlet \| Parcel \| Optional \| Alpha                                                                                         |
|-----------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Provisions \| Secondary: Work, Infrastructure                                                                                             |
| **Purpose**                             | Converts wood or approved biomass into reliable early fuel and stores it safely for homes, kitchens, kilns and smithies.                           |
| **Capacity / service**                  | Small batch kilns or clamps plus protected fuel storage; throughput depends on wood supply, burn time, staff and fire safety.                      |
| **Jobs and users**                      | Charcoal burner, fuel keeper, forester and hauler.                                                                                                 |
| **Inputs**                              | Logs or biomass, ignition fuel, soil/clay cover or kiln parts, water/fire tools and containers.                                                    |
| **Outputs / services**                  | Charcoal, ash, heat by-products, fuel stock and possible wood vinegar/tar at advanced variants.                                                    |
| **Required semantic contract**          | Kiln/clamp, safe burn zone, raw wood stack, finished fuel store, ash/by-product area, firebreak, water point and delivery socket.                  |
| **Blueprint Forge source profile**          | Outdoor hazardous-work source with kiln or mound modules, fuel/wood staging, cooling zones, firebreaks, smoke/wind placement rules, output storage and safe, active, cooling, fire and abandoned states. |
| **Runtime products, persistence and LOD**   | Persist active burn batches, fuel, wood input, charcoal/output, emissions or hazard state, worker assignment, cooling and fire history. Distant processing uses bounded recipe transactions. |
| **Placement and utilities**             | Downwind or edge parcel away from dense housing, with road access and strong fire separation.                                                      |
| **Construction profile**                | 4-6 stages: clear/firebreak; raw store; kiln/clamp; finished store; safety equipment; activation.                                                  |
| **Upgrade, inheritance and branch links**            | Fuel depot through 20D, coke/industrial fuel plant through 20E, alchemical charcoal works or culture-specific kiln.                                |
| **Planner triggers and failure states** | Selected when fuel demand, winter risk or smithing grows. Fire, rain, wood shortage, blocked storage or unattended burns can interrupt production. |
| **Restricted player-creator validation**         | Must include supported conversion process, firebreak and segregated raw/finished stock. A decorative kiln does not produce fuel.                   |
| **Pack and style resolution**         | Earth mound, brick retort, forest charcoal camp, underground smokeless kiln, volcanic burner or rune-sealed clean kiln.                            |

# 23. Crafting and Artisan Entries

### 41. Carpenter Workshop

`building.crafting.carpenter_workshop`

| **Catalogue role**                      | Crafting / Woodwork \| Village \| Medium \| Required \| Technical POC - Core                                                                                                                |
|-----------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Work \| Secondary: Infrastructure                                                                                                                                          |
| **Purpose**                             | Produces wooden building components, furniture, repairs and blueprint parts from processed timber.                                                                                  |
| **Capacity / service**                  | Draft 1-3 carpenters, one main bench and limited assembly space; throughput scales with tools, skill, sawmill support and stock.                                                    |
| **Jobs and users**                      | Carpenter, joiner, furniture maker, apprentice and hauler.                                                                                                                          |
| **Inputs**                              | Planks, beams, boards, nails or fasteners, glue or resin, tools, recipes and optional power.                                                                                        |
| **Outputs / services**                  | Construction components, doors and windows, furniture, handles, crates, repairs and project bundles.                                                                                |
| **Required semantic contract**          | Carpentry bench, cutting and assembly area, tool rack, material intake, output racks, safe circulation and delivery socket.                                                         |
| **Blueprint Forge source profile**          | Golden workshop source with carpenter benches, tool store, input and output buffers, delivery and repair sockets, public/service separation, optional timber yard module, construction stages and idle, active, blocked and damaged states. |
| **Runtime products, persistence and LOD**   | Persist workers, tools, recipes/orders, project reservations, input/output stock, work-in-progress, condition and blockers. This is the golden worksite save, migration and deterministic bake fixture. |
| **Placement and utilities**             | Accessible workshop parcel near timber storage and builder supply routes; fire and saw safety required.                                                                             |
| **Construction profile**                | 6 stages: foundation; shell; material store; benches and tools; output and loading; inspection. Basic repair work may activate before full furnishing.                              |
| **Upgrade, inheritance and branch links**            | Joinery shop, furniture guild, sawmill complex, machine-assisted woodworks or living-wood workshop through 20E or 20G.                                                              |
| **Planner triggers and failure states** | Required by Village stage or an equivalent building-component provider. Pauses with no timber, missing tools, blocked output, no carpenter or unsafe machinery.                     |
| **Restricted player-creator validation**         | Must provide a valid workbench, safe material flow and input or output capacity. Player designs may combine with housing or a shopfront only when hazards and routes are separated. |
| **Pack and style resolution**         | Open timber yard, guild joinery, dwarven precision shop, fae living-wood studio, ship carpenter or clockwork woodworks.                                                             |

### 42. Mason Yard

`building.crafting.mason_yard`

| **Catalogue role**                      | Crafting / Stonework \| Village \| Parcel \| Required \| Extended Slice                                                                                   |
|-----------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Work \| Secondary: Infrastructure                                                                                                              |
| **Purpose**                             | Shapes stone into construction blocks, road pieces, walls, monuments and repair materials.                                                              |
| **Capacity / service**                  | Draft 1-4 masons with several cutting or carving stations and heavy stock bays; output depends on stone supply, tools and hauling.                      |
| **Jobs and users**                      | Mason, stonecutter, sculptor, apprentice and hauler.                                                                                                    |
| **Inputs**                              | Rough stone, mortar or binder ingredients, chisels, hammers, saws, water and templates.                                                                 |
| **Outputs / services**                  | Cut stone, bricks, slabs, stairs, road pieces, wall components, carved blocks and rubble or by-products.                                                |
| **Required semantic contract**          | Stone intake, cutting benches, heavy stock bays, template point, output loading, dust or water control and safe crane or lift area where used.          |
| **Blueprint Forge source profile**          | Yard-and-shed source with stone intake, cutting and finishing stations, heavy stock zones, lifting clearance, dust hazard, freight route, scaffold/component modules and active, dust-overload, blocked and damaged states. |
| **Runtime products, persistence and LOD**   | Persist workers, tools, stone/component orders, heavy stock, output, dust/safety state, condition and construction-project links. Distant production batches the same recipes and reservations. |
| **Placement and utilities**             | Edge artisan or industrial parcel with heavy-cart access, noise or dust separation and stable ground.                                                   |
| **Construction profile**                | 5-7 stages: level yard; stock bays; shelter; workstations; water or dust control; loading; inspection.                                                  |
| **Upgrade, inheritance and branch links**            | Stoneworks, sculpture atelier, roadworks depot, mechanised cutter through 20E or monumental works through 20F.                                          |
| **Planner triggers and failure states** | Required for sustained stone construction or equivalent imported supply. Pauses with no stone, broken tools, blocked heavy access or unsafe stockpiles. |
| **Restricted player-creator validation**         | Must provide heavy-material circulation, safe work clearances and true input or output staging; decorative stone piles do not create masonry capacity.  |
| **Pack and style resolution**         | Open yard, covered carving hall, dwarven stone hall, desert adobe and stone court, giant-scale cutter or rune-guided sculpting yard.                    |

### 43. Village Blacksmith

`building.crafting.village_blacksmith`

| **Catalogue role**                      | Crafting / Metalwork \| Village \| Medium \| Required \| Extended Slice                                                                                        |
|-----------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Work \| Secondary: Safety, Infrastructure                                                                                                           |
| **Purpose**                             | Provides tools, fittings, repairs and basic guard equipment, making metal progression and village maintenance visible.                                       |
| **Capacity / service**                  | Draft 1-2 smiths plus an apprentice, with one forge and anvil line; output depends on fuel, ingots, tools, recipes, ventilation and skill.                   |
| **Jobs and users**                      | Blacksmith, toolsmith, farrier, apprentice, hauler and optional guard quartermaster.                                                                         |
| **Inputs**                              | Fuel, ingots or metal stock, flux, water, tools, repair parts and known recipes.                                                                             |
| **Outputs / services**                  | Tools, nails and fittings, repair services, simple weapons and armour, horseshoes and construction components.                                               |
| **Required semantic contract**          | Forge, anvil, quench, fuel store, metal intake, tool rack, output rack, chimney or ventilation, firebreak and service counter.                               |
| **Blueprint Forge source profile**          | Hot-work source with forge, anvil, quench, fuel and metal stores, chimney/ventilation, firebreak, tool display and guard-supply modules, plus cold, lit, active, overheated, damaged and extinguished states. |
| **Runtime products, persistence and LOD**   | Persist blacksmith identity, workers/apprentices, fuel, metal, recipes, tool condition, heat/fire state, guard or project orders, output ownership and damage. Visual fire state follows authoritative operation. |
| **Placement and utilities**             | Road-accessible artisan edge with fire separation, water and nearby fuel or metal logistics.                                                                 |
| **Construction profile**                | 7 stages: foundation; heat-safe shell; chimney; forge; anvil and quench; stores and output; inspection and activation.                                       |
| **Upgrade, inheritance and branch links**            | Town forge, armourer or weaponsmith specialisation, foundry link through 20E or rune forge branch through 20E.                                               |
| **Planner triggers and failure states** | Required by Village stage unless trade reliably supplies tools and repairs. Pauses without a smith, fuel, metal, tools, safe ventilation or output capacity. |
| **Restricted player-creator validation**         | Must include a heat-safe work triangle, ventilation, quench and protected stores. A decorative forge cannot produce metal goods or count as a smithy.        |
| **Pack and style resolution**         | Open village smithy, dwarven forge hall, nomad wagon forge, volcanic forge, fae cold-forge or water-powered hammer shop.                                     |

### 44. Pottery and Kiln

`building.crafting.pottery_kiln`

| **Catalogue role**                      | Crafting / Ceramics \| Village \| Small-Medium \| Optional \| Alpha                                                                                           |
|-----------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Work \| Secondary: Provisions, Infrastructure                                                                                                        |
| **Purpose**                             | Turns clay and similar earth materials into vessels, tiles, bricks, storage goods and culture products.                                                       |
| **Capacity / service**                  | One kiln and several preparation stations; batch output depends on clay, fuel, drying time, skill and firing control.                                         |
| **Jobs and users**                      | Potter, kiln worker, brickmaker, decorator and apprentice.                                                                                                    |
| **Inputs**                              | Clay, temper, water, fuel, glazes or pigments, moulds and recipes.                                                                                            |
| **Outputs / services**                  | Pots, jars, pipes, tiles, bricks, crucibles, storage containers and ceramic trade goods.                                                                      |
| **Required semantic contract**          | Clay intake, mixing and forming bench, drying racks, kiln, fuel store, cooling and output, water and fire clearance.                                          |
| **Blueprint Forge source profile**          | Kiln workshop source with clay preparation, shaping, drying, firing, cooling and output zones, fuel/power and exhaust sockets, fire separation, batch-state visual deltas and pottery or brick profile modules. |
| **Runtime products, persistence and LOD**   | Persist batches through preparation, drying, firing and cooling, including fuel/power, worker, stock, output quality where meaningful, heat state and maintenance. |
| **Placement and utilities**             | Near clay supply and water, with smoke or fire separation and road access for fragile goods.                                                                  |
| **Construction profile**                | 5-7 stages: yard or foundation; preparation; drying; kiln and chimney; stores; firing inspection.                                                             |
| **Upgrade, inheritance and branch links**            | Brickworks, glass and ceramic complex, porcelain studio, magical kiln or industrial materials plant through 20E.                                              |
| **Planner triggers and failure states** | Selected when storage containers, tiles, brick demand or cultural trade justify it. Firing can fail with wet wares, wrong fuel, poor skill or a damaged kiln. |
| **Restricted player-creator validation**         | Must include a valid kiln cycle and drying or handling path; decorative pots do not create production.                                                        |
| **Pack and style resolution**         | Open pottery court, cliff kiln, subterranean ceramic hall, sun-fired adobe works, dragon-heat kiln or rune-temperature kiln.                                  |

### 45. Weaver and Tailor Workshop

`building.crafting.weaver_tailor`

| **Catalogue role**                      | Crafting / Textiles \| Village \| Medium \| Optional \| Alpha                                                                                                            |
|-----------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Work \| Secondary: Morale, Provisions                                                                                                                           |
| **Purpose**                             | Processes fibre and cloth into clothing, sacks, bedding, banners, sails and cultural textiles.                                                                           |
| **Capacity / service**                  | Draft 1-4 workers across spinning, weaving and sewing stations; modules may specialise while sharing one functional definition.                                          |
| **Jobs and users**                      | Spinner, weaver, tailor, dyer, embroiderer and apprentice.                                                                                                               |
| **Inputs**                              | Fibre, yarn, cloth, leather trims, dyes, needles, loom parts and patterns.                                                                                               |
| **Outputs / services**                  | Clothing basics, sacks, bedding, banners, uniforms, trade textiles and repair services.                                                                                  |
| **Required semantic contract**          | Fibre intake, spinning, weaving or sewing stations, dye and clean area if used, pattern storage, finished-goods racks and public or service access.                      |
| **Blueprint Forge source profile**          | Clean artisan source with loom, cutting, sewing, dye or washing modules, cloth and finished-goods buffers, customer or delivery access, lighting and colour-safe pack resolution. |
| **Runtime products, persistence and LOD**   | Persist profile, workers, tools, cloth/dye inputs, orders, outputs, quality where meaningful, water/waste dependencies and public-service state. |
| **Placement and utilities**             | Artisan or residential-compatible parcel; dyeing requires water, drainage and clean or dirty separation.                                                                 |
| **Construction profile**                | 5-7 stages depending on modules; basic sewing may activate before loom or dye additions.                                                                                 |
| **Upgrade, inheritance and branch links**            | Textile mill through 20E, fashion house, banner guild, sail loft or magical thread workshop.                                                                             |
| **Planner triggers and failure states** | Selected for clothing resilience, sacks and logistics, morale or culture goods, uniforms or trade. Pauses with missing fibre, tools, patterns, staff or blocked outputs. |
| **Restricted player-creator validation**         | Capacity derives from actual supported stations. Player mixed-use designs must separate dyes, public shop and living routes where needed.                                |
| **Pack and style resolution**         | Longhouse loom room, guild tailor, desert dye court, spider-silk atelier, living-fibre studio or rune-embroidered workshop.                                              |

### 46. Tannery and Leatherworker

`building.crafting.tannery_leatherworker`

| **Catalogue role**                      | Crafting / Leather \| Village \| Medium \| Optional \| Alpha                                                                                              |
|-----------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Work \| Secondary: Health, Infrastructure                                                                                                        |
| **Purpose**                             | Processes hides into leather and finished goods while explicitly managing odour, wastewater and contamination risk.                                       |
| **Capacity / service**                  | Draft 1-4 workers with dirty tanning and cleaner finishing zones; batch output depends on hides, reagents, water and time.                                |
| **Jobs and users**                      | Tanner, leatherworker, saddler, armour crafter, cleaner and apprentice.                                                                                   |
| **Inputs**                              | Hides, water, lime, tannin, salt or culture alternatives, fuel, tools and patterns.                                                                       |
| **Outputs / services**                  | Leather, straps, belts, bags, armour pieces, saddles, boots, machine belts and by-products.                                                               |
| **Required semantic contract**          | Dirty intake, soaking and tanning vats, drying, clean finishing bench, waste and drainage, output store, ventilation and delivery route.                  |
| **Blueprint Forge source profile**          | Dirty-industry source with separated hide intake, soaking, scraping, drying and leatherwork zones, water and wastewater sockets, ventilation, odour/exclusion rules, clean output route and contamination states. |
| **Runtime products, persistence and LOD**   | Persist hide batches, clean/dirty process stage, workers, water and wastewater use, outputs, odour/contamination, safety and condition. Health effects arise from actual service and hazard state. |
| **Placement and utilities**             | Downstream or edge industrial parcel with drainage, odour separation, water and safe waste handling.                                                      |
| **Construction profile**                | 6-8 stages: drainage; shell; dirty vats; drying; clean workshop; stores; safety and sanitation inspection.                                                |
| **Upgrade, inheritance and branch links**            | Leather guild, saddlery, armour workshop, chemical tannery through 20E or magical hide treatment.                                                         |
| **Planner triggers and failure states** | Selected when hides and leather demand justify cost. Health penalties can arise from failed drainage, contamination, overcrowded vats or poor separation. |
| **Restricted player-creator validation**         | Must prove dirty-to-clean flow, water and waste treatment; a generic crafting table cannot claim tanning capacity.                                        |
| **Pack and style resolution**         | Bark tannery, desert salt yard, underground fungal tannery, alchemical hideworks, beast-clan leather lodge or rune-cleansing tannery.                     |

### 47. Glassworks or Brickworks

`building.crafting.glass_brick_works`

| **Catalogue role**                      | Crafting / Construction Materials \| Town \| Large \| Optional \| Beta                                                                                                                               |
|-----------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Work \| Secondary: Infrastructure                                                                                                                                                           |
| **Purpose**                             | Produces high-heat construction materials such as glass, bricks, tiles and specialised blocks through one profile-selected facility family.                                                          |
| **Capacity / service**                  | Town-scale batch furnaces and forming lines; the selected profile controls inputs, temperature, hazards, outputs and required skill.                                                                 |
| **Jobs and users**                      | Glassblower, brickmaker, furnace worker, kiln specialist, quality inspector and hauler.                                                                                                              |
| **Inputs**                              | Sand or clay, fuel or power, flux and additives, moulds, water, tools and recipes.                                                                                                                   |
| **Outputs / services**                  | Glass panes, bottles, lenses, bricks, tiles, glazed blocks and trade goods.                                                                                                                          |
| **Required semantic contract**          | Material intake, furnace or kiln, hot work zone, forming or moulding, cooling or annealing, fuel or power, output storage, ventilation and fire safety.                                              |
| **Blueprint Forge source profile**          | High-heat modular source supporting glass or brick profiles through furnace/kiln, batch preparation, moulding, annealing or drying, fuel/power, exhaust, safe storage, heat zones and profile-specific stage/state deltas. |
| **Runtime products, persistence and LOD**   | Persist selected production profile, furnace/kiln batch, fuel/power, inputs, outputs, heat, emissions, maintenance and module condition. Profile changes require safe conversion and migration. |
| **Placement and utilities**             | Industrial edge with heavy logistics, high-heat separation, water and emissions or waste controls.                                                                                                   |
| **Construction profile**                | 7-9 stages; furnace commissioning and safety inspection precede production.                                                                                                                          |
| **Upgrade, inheritance and branch links**            | Industrial materials plant through 20E, crystal glassworks, enchanted lensworks or regional brick complex.                                                                                           |
| **Planner triggers and failure states** | Selected when urban construction, windows, laboratories, bottles or trade justify it. Can be disabled by fuel shortage, a damaged furnace, unsafe heat, no specialist or blocked cooling and output. |
| **Restricted player-creator validation**         | Player blueprint must select a supported production profile and include the complete heat and handling path; one structure may contain both only if capacity and safety are validated separately.    |
| **Pack and style resolution**         | Roman-style glasshouse, desert sun glassworks, dwarven furnace hall, volcanic brickworks, crystal blower or mana-flame kiln.                                                                         |

# 24. Trade and Professional-Service Entries

### 51. Market Stalls

`building.trade.market_stalls`

| **Catalogue role**                      | Trade / Local Market \| Village \| Cluster \| Optional \| Extended Slice                                                                                                          |
|-----------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Work \| Secondary: Morale, Provisions                                                                                                                                  |
| **Purpose**                             | Creates flexible vendor slots for local exchange, rotating markets and temporary commerce without inventing infinite stock.                                                     |
| **Capacity / service**                  | Draft 2-8 vendor slots plus public circulation; active capacity depends on assigned merchants, stock, schedule and accessible storage.                                          |
| **Jobs and users**                      | Vendor, merchant, farmer or crafter sellers, market keeper, guard and hauler during market periods.                                                                             |
| **Inputs**                              | Actual sale stock, stall fees or permissions, containers, signage and optional event supplies.                                                                                  |
| **Outputs / services**                  | Local trade access, price discovery, item exchange, temporary jobs, social activity and request generation.                                                                     |
| **Required semantic contract**          | Vendor slots, counters or display, customer standing, market storage and drop-off, road or public-space sockets, signage and emergency circulation.                             |
| **Blueprint Forge source profile**          | Modular stall-cluster source with vendor, customer, display, stock and cash/ledger markers, public circulation, weather cover, temporary setup stages, pack-resolved stall modules and open, closed, busy, damaged and festival states. |
| **Runtime products, persistence and LOD**   | Persist stall owners, vendors, listed stock, prices/contracts, opening policy, customer/service summaries, fees, theft or damage events and temporary-module state. Trade moves real owned stock. |
| **Placement and utilities**             | Village centre, square or festival ground with foot traffic and no blocked road access.                                                                                         |
| **Construction profile**                | 3 stages: public-space preparation; stall frames and counters; permissions and market activation. Individual stalls can be added modularly.                                     |
| **Upgrade, inheritance and branch links**            | Covered market hall, specialised market district, auction square or culture-specific bazaar.                                                                                    |
| **Planner triggers and failure states** | Selected when local surplus, shortages, population or visitor demand justify trade. Empty stalls provide no stock; theft, weather, blocked routes or no vendors reduce service. |
| **Restricted player-creator validation**         | Vendor capacity comes from reachable marked stalls and real stock access. Decorative kiosks cannot create merchants or goods.                                                   |
| **Pack and style resolution**         | Open weekly market, covered bazaar, floating stalls, underground trade court, fae barter circle or caravan pop-up market.                                                       |

### 52. Trading Post

`building.trade.trading_post`

| **Catalogue role**                      | Trade / Regional Exchange \| Village \| Medium \| Optional \| Extended Slice                                                                                                  |
|-----------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Infrastructure \| Secondary: Work, Provisions                                                                                                                      |
| **Purpose**                             | Handles imports, exports, contracts, caravan loading and reputation-based regional trade between the settlement and outside partners.                                       |
| **Capacity / service**                  | Draft one trade counter, contract board, secure stock room and loading bay; route slots determine simultaneous trade links.                                                 |
| **Jobs and users**                      | Merchant, trade clerk, quartermaster, hauler, guard and interpreter where relevant.                                                                                         |
| **Inputs**                              | Actual export stock, currency or barter goods, contracts, route access, storage space and permissions.                                                                      |
| **Outputs / services**                  | Imports, sales revenue, contracts, trade reputation, caravan visits, price information and shortage relief.                                                                 |
| **Required semantic contract**          | Public counter, contract or request board, secure trade store, loading and unloading socket, ledger, merchant work point, road or caravan connection and guard point.       |
| **Blueprint Forge source profile**          | Trade-service source with public counter, contract board, secure stock, manifests, loading area, visitor and staff routes, caravan/freight socket, optional lodging/guard modules and active, embargoed, looted and occupied states. |
| **Runtime products, persistence and LOD**   | Persist operators, manifests, contracts, import/export stock, loading tasks, route/caravan links, permissions, taxes/customs references and incidents. No background merchant inventory is invented. |
| **Placement and utilities**             | Settlement edge or main road with strong warehouse access, turning and loading space and controlled public entry.                                                           |
| **Construction profile**                | 6 stages: foundation; shell; counter and office; secure store; loading bay; ledger and route activation.                                                                    |
| **Upgrade, inheritance and branch links**            | Covered market, caravanserai, merchant exchange, customs facility through 20C or 20D, or portal trade station through 20E.                                                  |
| **Planner triggers and failure states** | Selected when a viable route, surplus, shortage or diplomatic opportunity exists. Pauses when routes are unsafe, stock unavailable, permissions revoked or storage blocked. |
| **Restricted player-creator validation**         | Must connect to a real road or route and physical stock. Player designs cannot create off-map trade without an approved route profile and ownership controls.               |
| **Pack and style resolution**         | Frontier post, caravan lodge, river trade house, subterranean trade gate, fae exchange grove or dimensional embassy market.                                                 |

### 53. Covered Market or Market Hall

`building.trade.covered_market_hall`

| **Catalogue role**                      | Trade / Urban Market \| Town \| Large \| Optional \| Beta                                                                                                                            |
|-----------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Work \| Secondary: Infrastructure, Morale                                                                                                                                   |
| **Purpose**                             | Provides dense permanent commerce, specialist vendors, protected public circulation and market administration at town scale.                                                         |
| **Capacity / service**                  | Multiple permanent and rotating vendor bays, central storage links and large visitor throughput; exact capacity comes from validated stalls and routes.                              |
| **Jobs and users**                      | Market master, merchants, vendors, porters, clerks, cleaners and guards.                                                                                                             |
| **Inputs**                              | Vendor stock, leases or fees, utilities, cleaning, security, storage and logistics.                                                                                                  |
| **Outputs / services**                  | Specialist trade, market taxes or fees, visitor attraction, price visibility, contracts and urban morale.                                                                            |
| **Required semantic contract**          | Vendor bays, public aisles, loading or service route, storage sockets, market office, sanitation, exits, signage and optional auction or event space.                                |
| **Blueprint Forge source profile**          | Large public-market source with nested stall modules, circulation and crowd zones, loading/service spine, sanitation and emergency routes, administration, event states and partial-wing operation. |
| **Runtime products, persistence and LOD**   | Persist stall leases, vendors, stock, crowd/event load, loading/service capacity, sanitation, security and wing condition. Distant simulation aggregates transactions without losing owner or contract records. |
| **Placement and utilities**             | High-centrality town parcel or market district with road, transit, warehouse and emergency access.                                                                                   |
| **Construction profile**                | 7-9 stages; the public shell and some stalls can open before full specialist wings.                                                                                                  |
| **Upgrade, inheritance and branch links**            | Grand market, trade district, auction house, regional exchange or culture-specific bazaar complex through 20F or 20G.                                                                |
| **Planner triggers and failure states** | Selected when stall congestion, trade volume and town population justify a permanent hall. Service degrades with empty vendors, poor logistics, crime, sanitation or blocked access. |
| **Restricted player-creator validation**         | Must meet crowd-flow, loading, vendor and storage requirements. Empty decorative arcades do not provide market capacity.                                                             |
| **Pack and style resolution**         | Timber market hall, stone bazaar, canal market, underground trade cavern, living canopy market or portal-linked exchange.                                                            |

### 54. Caravanserai or Coach Inn

`building.trade.caravanserai_coach_inn`

| **Catalogue role**                      | Trade / Route Support \| Town \| Large Complex \| Conditional \| Beta                                                                          |
|-----------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Infrastructure \| Secondary: Morale, Work                                                                                             |
| **Purpose**                             | Supports long-distance caravans, coaches or pack animals through secure lodging, yards, storage, repairs and route information.                |
| **Capacity / service**                  | One or more caravan groups based on yard, guest beds, animal stalls and loading bays; not required for settlements without overland trade.     |
| **Jobs and users**                      | Innkeeper, stablehand, caravan master, cook, guard, mechanic or cartwright and clerk.                                                          |
| **Inputs**                              | Food, feed, water, bedding, repair parts, fuel, guest supplies and secure storage.                                                             |
| **Outputs / services**                  | Safer trade routes, visitor lodging, animal support, caravan turnaround, rumours, contracts and regional commerce.                             |
| **Required semantic contract**          | Controlled gate, caravan yard, loading bays, animal stalls, guest beds, kitchen or service, secure store, repair point and road route sockets. |
| **Blueprint Forge source profile**          | Mixed hospitality-logistics source with guest, stable, freight, yard, service and public zones, secure cargo, caravan assembly, route sockets, overnight capacity and weather/raid/closure states. |
| **Runtime products, persistence and LOD**   | Persist guests, caravan parties, animals/vehicles, cargo ownership, contracts, feed/lodging stock, route state, security and incidents. Entity detail and freight summaries can use independent LOD. |
| **Placement and utilities**             | Town edge or major junction with turning space, warehouse access, water and security.                                                          |
| **Construction profile**                | 8-10 stages often split into yard and gate, stable, inn, storage and repair subprojects.                                                       |
| **Upgrade, inheritance and branch links**            | Regional caravan hub, freight depot through 20D, merchant enclave or portal logistics centre through 20E.                                      |
| **Planner triggers and failure states** | Eligible only on active caravan or coach routes. Demand falls if routes shift; raids, disease, feed shortages or no secure storage reduce use. |
| **Restricted player-creator validation**         | Must prove large-vehicle or animal access, guest and cargo separation, secure circulation and route connection.                                |
| **Pack and style resolution**         | Walled desert caravanserai, forest coaching inn, mountain mule lodge, river barge rest, air-caravan dock or realm-traveller court.             |

### 55. Merchant Guild or Trade Exchange

`building.trade.merchant_exchange`

| **Catalogue role**                      | Trade / Finance and Coordination \| City \| Large \| Optional \| Beta                                                                                                            |
|-----------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Work \| Secondary: Infrastructure, Morale                                                                                                                               |
| **Purpose**                             | Coordinates regional contracts, merchant membership, trade information, finance, dispute handling and large-volume exchange.                                                     |
| **Capacity / service**                  | City-level clerks, meeting rooms, contract desks and secure records; affects the number and quality of trade contracts rather than directly producing goods.                     |
| **Jobs and users**                      | Guild master, merchant, broker, clerk, accountant, appraiser, translator and guard.                                                                                              |
| **Inputs**                              | Records, fees, currency or credit backing, market data, secure communications and member stock guarantees.                                                                       |
| **Outputs / services**                  | Advanced contracts, trade coordination, financing, reputation, price intelligence, merchant politics and regional influence.                                                     |
| **Required semantic contract**          | Public exchange floor, contract desks, meeting rooms, secure archive or ledger, treasury or deposit point, communications and guarded access.                                    |
| **Blueprint Forge source profile**          | Civic-commercial source with exchange floor, contract/ledger services, secure records, meeting and negotiation rooms, member/public permissions, optional vault and communications modules and crisis or occupation states. |
| **Runtime products, persistence and LOD**   | Persist members, contracts, ledgers, secure records, market indices or auction state where enabled, permissions, disputes and faction/political history. It coordinates trade but does not create goods. |
| **Placement and utilities**             | Central commercial district near market, bank or treasury, administration and regional transport.                                                                                |
| **Construction profile**                | 8-10 stages with secure records and authority commissioning before advanced contracts unlock.                                                                                    |
| **Upgrade, inheritance and branch links**            | Grand exchange, national trade ministry, interrealm commerce council or culture and faction merchant palace through 20F or 20G.                                                  |
| **Planner triggers and failure states** | Selected when city trade volume, routes and merchant population justify coordination. Corruption, insolvency, war or broken communications can reduce trust and contract access. |
| **Restricted player-creator validation**         | Must include secure records and contract service; decorative grand halls do not generate finance or regional trade capacity.                                                     |
| **Pack and style resolution**         | Guild exchange, counting house, clan merchant council, floating auction hall, subterranean gem exchange or portal trade senate.                                                  |

### 60. Guild Hall or Professional Lodge

`building.professional.guild_hall`

| **Catalogue role**                      | Professional / Organisation \| Town \| Medium-Large \| Optional \| Beta                                                                                                                      |
|-----------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Work \| Secondary: Infrastructure, Morale                                                                                                                                           |
| **Purpose**                             | Organises a recognised profession through contracts, training, standards, membership, representation and specialist identity.                                                                |
| **Capacity / service**                  | One profession or compatible group profile with meeting, office, training and contract capacity; it coordinates rather than replaces actual workplaces.                                      |
| **Jobs and users**                      | Guild master, clerk, trainer, inspectors, members and contract officer.                                                                                                                      |
| **Inputs**                              | Membership fees or support, records, tools and materials for training, meeting supplies and linked profession data.                                                                          |
| **Outputs / services**                  | Professional contracts, training, quality standards, specialist recruitment, dispute support, reputation and culture or faction identity.                                                    |
| **Required semantic contract**          | Guild office, contract board, meeting hall, records, training or demonstration point, secure member storage and public entrance.                                                             |
| **Blueprint Forge source profile**          | Profession-profile source with contract office, meeting hall, records, member storage, demonstration/training points, public access and modular identity overlays without granting unrelated guild capabilities. |
| **Runtime products, persistence and LOD**   | Persist profession profile, members, leadership, contracts, standards, training links, records, dues or shared stock and political state. One instance cannot claim every professional profile. |
| **Placement and utilities**             | Near the relevant district or civic centre with access to member workplaces and market or governance routes.                                                                                 |
| **Construction profile**                | 6-8 stages; a basic contract office can activate before the ceremonial hall or expanded training rooms.                                                                                      |
| **Upgrade, inheritance and branch links**            | Grand guild, professional college, faction order, regional standards office or specialist headquarters through 20F or 20G.                                                                   |
| **Planner triggers and failure states** | Selected when enough workers and contracts exist to justify organisation. Empty membership or no linked profession provides little benefit; political conflict can split or suppress guilds. |
| **Restricted player-creator validation**         | Must select a recognised profession profile and connect to real workers or workplaces; a generic meeting room cannot grant all guild benefits at once.                                       |
| **Pack and style resolution**         | Craft guild hall, clan lodge, merchant fraternity, ranger lodge, mage order, underground union hall or floating professional conclave.                                                       |

# 25. Education and Knowledge Entries

### 56. Small School

`building.education.small_school`

| **Catalogue role**                      | Education / Basic Learning \| Village \| Small \| Optional \| Extended Slice                                                                                                                               |
|-----------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Work \| Secondary: Morale                                                                                                                                                                       |
| **Purpose**                             | Provides basic literacy, numeracy, settlement knowledge and supervised learning for children or adults without creating a separate Education need bar.                                                   |
| **Capacity / service**                  | Draft one teacher and 6-20 learners based on classroom markers; attendance uses schedules and household or work rules.                                                                                   |
| **Jobs and users**                      | Teacher, scribe, elder, visiting specialist and optional assistant.                                                                                                                                      |
| **Inputs**                              | Teaching materials, books or slates, fuel or light, maintenance and curriculum or knowledge access.                                                                                                      |
| **Outputs / services**                  | Basic education coverage, literacy, improved apprenticeship readiness, record use, morale and limited knowledge unlocks.                                                                                 |
| **Required semantic contract**          | Teaching point, learner seating, storage, board or library point, safe exits, light or heat and optional outdoor lesson space.                                                                           |
| **Blueprint Forge source profile**          | Compact learning source with instructor, learner, board/library, materials, safe exits, light/heat, optional outdoor lesson module and open, closed, event-use, damaged and repurposed states. |
| **Runtime products, persistence and LOD**   | Persist teacher, learners, curriculum, materials, attendance summary, lesson progress, condition and temporary community use. Named learner progress survives distant aggregation. |
| **Placement and utilities**             | Accessible residential or civic area with safe routes and manageable noise.                                                                                                                              |
| **Construction profile**                | 5 stages: foundation; shell; classroom; teaching and storage furnishings; staffing and curriculum activation.                                                                                            |
| **Upgrade, inheritance and branch links**            | Trade school, library or archive, academy campus through 20F or culture-specific learning house.                                                                                                         |
| **Planner triggers and failure states** | Selected when population, children, literacy needs, specialist succession or culture priorities justify it. No teacher or materials means no active service, though the room can host community lessons. |
| **Restricted player-creator validation**         | Capacity comes from reachable teaching and learner markers. Player designs may be a schoolhouse, tutor lodge or outdoor learning grove if the profile is satisfied.                                      |
| **Pack and style resolution**         | One-room school, clan teaching hall, monastery class, apprenticeship courtyard, oral-tradition fire circle or rune-learning chamber.                                                                     |

### 57. Apprentice or Trade School

`building.education.trade_school`

| **Catalogue role**                      | Education / Vocational Training \| Village \| Medium \| Optional \| Alpha                                                                                                      |
|-----------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Work \| Secondary: Morale                                                                                                                                             |
| **Purpose**                             | Trains apprentices and converts experienced workers into a sustainable specialist pipeline for settlement jobs.                                                                |
| **Capacity / service**                  | One or more training bays and draft 4-16 learners; capacity and available courses depend on instructors, linked workshops, tools and curriculum.                               |
| **Jobs and users**                      | Master craftsperson, instructor, apprentice coordinator, scribe and visiting specialist.                                                                                       |
| **Inputs**                              | Training tools, practice materials, books or patterns, instructor time, linked workplace access and maintenance.                                                               |
| **Outputs / services**                  | Apprentices, skill progression, replacement specialists, reduced hiring dependency and unlocked vocational recipes.                                                            |
| **Required semantic contract**          | Instruction point, learner stations, practice work areas, tool and material store, records, safety zones and optional sockets to partner workshops.                            |
| **Blueprint Forge source profile**          | Vocational source with profile-specific training bays, instructor and learner markers, practice stock, tool storage, safety zones, records and sockets to partner workshops or yards. |
| **Runtime products, persistence and LOD**   | Persist supported courses, instructors, apprentices, practice materials, partner workplaces, progress, certification/skill outcomes, condition and specialist succession risk. |
| **Placement and utilities**             | Near the artisan district and participating workshops with safe learner routes.                                                                                                |
| **Construction profile**                | 6-8 stages; classroom service may activate before all specialist training bays.                                                                                                |
| **Upgrade, inheritance and branch links**            | Guild academy, engineering school, military school through 20C, magical academy through 20E or 20F, or university through 20F.                                                 |
| **Planner triggers and failure states** | Selected when missing specialists, an aging workforce, unemployment or growth creates succession demand. Training slows without masters, tools, practice stock or linked jobs. |
| **Restricted player-creator validation**         | Must specify supported training profiles and safe learner workstations; seating alone does not generate skilled workers.                                                       |
| **Pack and style resolution**         | Apprentice guild, master-and-student yard, clan craft school, mobile caravan school, memory-teaching hall or golem-assisted training lab.                                      |

### 58. Library or Archive

`building.education.library_archive`

| **Catalogue role**                      | Education / Knowledge \| Town \| Large \| Optional \| Beta                                                                                                             |
|-----------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Morale \| Secondary: Work, Infrastructure                                                                                                                     |
| **Purpose**                             | Stores books, maps, records, recipes, settlement history and research references as physical knowledge rather than a passive global unlock list.                       |
| **Capacity / service**                  | Collection capacity, reading or research seats and secure archive sections; service depends on staff, preserved records, access and relevant knowledge items.          |
| **Jobs and users**                      | Librarian, archivist, scribe, historian, researcher, cartographer and guard for restricted collections.                                                                |
| **Inputs**                              | Books, maps, records, ink and paper, maintenance, climate or fire protection and cataloguing labour.                                                                   |
| **Outputs / services**                  | Knowledge access, recipe and research support, historical continuity, map information, education service and story progression.                                        |
| **Required semantic contract**          | Public stacks, reading or research points, catalogue desk, secure archive, map or record storage, fire and climate protection and accessibility.                       |
| **Blueprint Forge source profile**          | Knowledge-service source with collection modules, public reading, research, archive and restricted zones, environmental protection, records desk, fire/flood security, expansion sockets and intact, damaged, looted and restored states. |
| **Runtime products, persistence and LOD**   | Persist exact knowledge items and records, catalogue/index state, permissions, staff, readers/research tasks, environmental condition, loss, theft and restoration history. |
| **Placement and utilities**             | Civic or education district with a safe, dry, low-risk environment and strong fire or security protection.                                                             |
| **Construction profile**                | 7-9 stages; public reading service can open before the secure archive or specialist wings.                                                                             |
| **Upgrade, inheritance and branch links**            | Grand library, university library, restricted archive, magical memory hall through 20E or capital knowledge complex through 20F.                                       |
| **Planner triggers and failure states** | Selected when knowledge stock, research, literacy and town governance justify it. Fire, moisture, theft, corruption or absent staff can damage access and collections. |
| **Restricted player-creator validation**         | Must store actual knowledge records or items and provide controlled access; decorative shelves alone do not unlock recipes.                                            |
| **Pack and style resolution**         | Scriptorium, oral-history hall, crystal memory archive, living library, stone rune archive, dream library or subterranean map vault.                                   |



# 26. Technical POC and Extended Forest Hamlet Scope

20B contributes eight of the protected thirty Forest Hamlet definitions. Version 0.2 divides them into two core production proofs and six extended-slice capabilities.

## 26.1 Technical POC Core - Two Definitions

| **No.** | **Definition** | **Proof Responsibility** |
|---:|---|---|
| 31 | Lumber Camp | Real resource-zone binding, worker task, tool use, log output, staging, route and distant conservation. |
| 41 | Carpenter Workshop | Golden worksite source, construction order, exact inputs/outputs, worker/tool/buffer state and save/migration. |

## 26.2 Extended Forest Hamlet - Six Definitions

| **No.** | **Definition** | **Extended Proof** |
|---:|---|---|
| 35 | Mine Entrance | Underground access, resource link, hazard/safety and ore staging. |
| 42 | Mason Yard | Stone component production and construction-project integration. |
| 43 | Village Blacksmith | Fuel/heat, tool/guard orders, hazards and specialist work. |
| 51 | Market Stalls | Real local trade stock, vendors, public circulation and temporary modules. |
| 52 | Trading Post | Contracts, manifests, freight/loading and regional route state. |
| 56 | Small School | Teacher/learner identity, curriculum, materials, attendance and succession. |

## 26.3 Core Scenario

1. A valid forestry zone is generated and recorded.
2. The settlement selects and constructs a Lumber Camp source.
3. A named worker harvests bounded timber and stages logs.
4. Logistics moves exact logs to the Carpenter Workshop.
5. The carpenter consumes logs through registered recipes and creates exact construction components.
6. A settlement project reserves those components and receives them without duplication.
7. Save/load, distance transitions and a source revision preserve the site, worker, stock and project history.

## 26.4 Extended Scenario

The Forest Hamlet adds mining, masonry and smithing to support watchtower and palisade construction, opens local market stalls and a trading post for shortages and surplus, and operates a small school that begins specialist succession. Raid damage can interrupt routes or production, creating clear repair and resupply responses.

## 26.5 Acceptance Lock

- Both core definitions complete source-to-bake-to-project-to-instance flow.
- Resource and production totals reconcile exactly.
- Worker, tool, input, output and blocked-state diagnostics are readable.
- The six extended entries integrate without changing the core record contracts.
- Player-compatible sources cannot create deposits, stock or unsupported capacity.

# 27. Simulation LOD, Persistence and Multiplayer Authority

## 27.1 Simulation Ranges

| **Range** | **Behaviour** |
|---|---|
| Immediate | Full workers, animations, interaction, local pathing, carried props and physical state. |
| Local settlement | Simplified paths and presentation; authoritative jobs, cycles, stock and service remain active. |
| Regional | Batched tasks, production, trade and learning using the same capacities, routes and transactions. |
| Distant | Scheduled summaries with preserved people, stock, contracts, knowledge, risk and history. |
| Dormant realm/region | Event-driven or bounded interval updates; no continuous visual simulation. |

## 27.2 Persistent Minimum

Every 20B instance preserves:

- Stable structure-instance and source IDs/version.
- Universal definition and resolved pack data.
- Ownership, permissions and profession/production profile.
- Staff, learners and organisation links.
- Resource-site binding where required.
- Input, output, tool, by-product and secure stock references.
- Active orders, cycles, contracts or curricula.
- Condition, hazards, routes, utilities and blockers.
- Construction, upgrade, damage, occupation and repair history.
- Important production, trade, knowledge and incident events.

## 27.3 Multiplayer Authority

The authoritative host/server owns resource depletion, inventory transactions, job assignment, cycle completion, trade transfer, training progress, damage and project state. Clients may predict presentation and UI but cannot complete production or transfer goods independently.

# 28. Balancing, Diagnostics and Anti-Exploit Rules

## 28.1 Balance Principles

- Earlier tools and facilities remain useful through low cost, local flexibility and repairability.
- Higher throughput requires proportional site, staff, logistics, maintenance, safety and progression.
- Optional education and trade create opportunities rather than mandatory bars.
- Specialist scarcity creates decisions but should have several recovery paths.
- Work travel, hazard and maintenance matter without becoming constant punishment.
- Exact rates, prices and skill modifiers remain balance data separate from structural rules.

## 28.2 Anti-Exploit Rules

- Decorative deposits, machines, shelves and stalls grant no output or stock.
- Duplicate unsupported work markers do not multiply capacity.
- Resource zones cannot be rebound or copied to duplicate remaining quantity.
- Cancelled cycles return or account for reserved inputs according to recipe state.
- Player sources cannot hide inaccessible buffers or bypass hazards.
- Trade cannot sell the same owned item through multiple listings simultaneously.
- Training cannot advance without a valid instructor/curriculum/practice contract.
- Distant and local simulation must reconcile at transition boundaries.

## 28.3 Diagnostic Standard

Diagnostics identify severity, source element, blocking rule, affected service, suggested correction and whether the issue blocks source approval, construction, commissioning or runtime operation.

Example messages:

- `B20_RESOURCE_BINDING_MISSING - Lumber Camp has no valid forestry zone.`
- `B20_OUTPUT_ROUTE_BLOCKED - Carpenter output cannot reach an authorised store.`
- `B20_HAZARD_CLEARANCE_FAIL - Forge heat zone overlaps public circulation.`
- `B20_TRADE_STOCK_UNOWNED - Listed goods have no authorised seller.`
- `B20_INSTRUCTOR_MISSING - Small School has learners but no valid instructor.`

# 29. Godot/Summer Engine Implementation Direction

## 29.1 Recommended Resource Records

```text
WorkFacilityDefinitionResource
ResourceBindingProfileResource
WorkstationProfileResource
ProductionServiceProfileResource
TradeServiceProfileResource
EducationServiceProfileResource
ProfessionProfileResource
HazardProfileResource
BlueprintSourceResource
BlueprintBakeManifestResource
```

Runtime records may include:

```text
StructureInstanceRecord
ResourceSiteRecord
JobAssignmentRecord
ProductionOrderRecord
ProductionCycleRecord
InventoryTransactionRecord
TradeContractRecord
MarketListingRecord
LearningCourseRecord
LearnerProgressRecord
GuildOrganisationRecord
```

## 29.2 Service Boundaries

- `WorkforceService` owns job suitability, assignment and staffing summaries.
- `ResourceSiteService` owns site binding, depletion, renewal and world evidence.
- `ProductionService` owns order reservation, cycles and exact outputs.
- `InventoryService` owns stock, reservations, ownership and authoritative transfer.
- `TradeService` owns listings, contracts, price rules, manifests and completion.
- `KnowledgeService` owns knowledge items, catalogues, permissions and research access.
- `EducationService` owns courses, instructors, learners, progress and outcomes.
- `StructureService` owns placed source references, semantic elements, condition and state.
- `SettlementPlannerService` owns project choice and priorities.

## 29.3 Implementation Principles

- Use stable Godot `Resource` definitions and versioned runtime records.
- Keep editor-only Forge data out of runtime packages unless explicitly required.
- Bake semantic tables, navigation, collision, resource proxies and diagnostic manifests deterministically.
- Use event-driven and bounded updates instead of per-frame settlement economy simulation.
- Make production and trade transactions atomic and journalled.
- Store aliases and migration paths for renamed profiles and source elements.
- Summer Engine agents may draft content and code, but stable IDs, resource rules and migrations require reviewable diffs and validation.

# 30. Open Questions for Later Balancing

- Final worker-to-station throughput curves and diminishing returns.
- Resource-zone scale, regeneration and visible depletion pacing by biome.
- Tool durability and replacement frequency for NPC production.
- Wage, price, barter and tax depth by world setting.
- Quality-system breadth for ordinary versus specialist goods.
- Market crowd and transaction abstraction thresholds.
- Education duration, age rules and adult retraining options.
- Guild politics, monopolies and labour disputes at city scale.
- Cross-realm trade and knowledge restrictions.
- Accessibility rules for diverse Entity Forge body plans in standard workplaces.
- Exact POC content budgets and performance thresholds.

# Appendix A. 20B Functional Definition Field Template

| **Field** | **Purpose** |
|---|---|
| Stable ID and catalogue number | Immutable function identity and 20H link. |
| Name, category and owner | Human-readable family and companion authority. |
| Earliest stage and delivery scope | Progression and production milestone. |
| Needs and planner class | Settlement contribution and project eligibility. |
| Purpose and capacity model | What the facility does and how output/service is bounded. |
| Jobs, skills and users | Minimum/target staff, suitability, learners, customers or members. |
| Inputs, outputs and ownership | Conserved stock, by-products, contracts and authority. |
| Resource/site binding | Deposit, zone, route or world-state dependency. |
| Semantic contract | Markers, zones, sockets, buffers, hazards and module rules. |
| Official Forge source profile | Source, stages, states, placement, inheritance and dependencies. |
| Restricted player profile | Allowed creator controls and blocking validation. |
| Planner and construction rules | Triggers, stages, partial activation, commissioning and cost source. |
| Runtime/persistence profile | Authoritative records, LOD, damage, migration and multiplayer. |
| Diagnostics and tests | Validation codes, golden fixtures and acceptance checks. |

# Appendix B. Production and Knowledge Chain Matrix

| **Chain** | **Source / Input** | **20B Facility** | **Output / Service** | **Primary Dependencies** |
|---|---|---|---|---|
| Timber | Forestry zone | Lumber Camp | Logs and forestry state | Tools, routes, ecology, storage. |
| Wood components | Logs | Sawmill / Carpenter | Planks, beams, parts, furniture | Recipes, tools, power, project orders. |
| Stone | Quarry/deposit | Quarry / Mason Yard | Stone and shaped components | Site, lifting, freight, dust safety. |
| Ore | Underground/deposit | Mine / Ore Sorting | Ore grades and stone | Supports, light, hauling, safety. |
| Tools and fittings | Fuel + metal | Village Blacksmith | Tools, fittings and guard items | Heat, ventilation, skill, stock. |
| Local trade | Owned goods | Market Stalls | Sales, barter and social service | Vendors, public access, permissions. |
| Regional trade | Manifests/contracts | Trading Post | Imports, exports and deliveries | Freight routes, storage, law, security. |
| Basic learning | Teacher + curriculum | Small School | Literacy and readiness | Materials, attendance, safe access. |
| Vocational succession | Master + practice | Trade School | Apprentices and specialists | Tools, materials, partner workplaces. |
| Knowledge preservation | Books/records | Library / Archive | Access, research and history | Staff, catalogue, permissions, protection. |

# Appendix C. POC Acceptance Checklist

- [ ] Lumber Camp binds to a real forestry zone and cannot operate from decoration alone.
- [ ] A named worker uses a valid job, route and tool contract.
- [ ] Harvested logs enter authoritative staging stock and reduce or update site state.
- [ ] Carpenter Workshop validates source, workbench, tools, buffers, service route and safety.
- [ ] A registered recipe consumes exact logs and creates exact components.
- [ ] Project reservations and output delivery preserve ownership and totals.
- [ ] Save/load preserves workers, tools, stock, cycles, source version and project history.
- [ ] Near, local and distant simulation reconcile without duplication.
- [ ] Mine, mason, blacksmith, market, trading post and school integrate in the extended slice.
- [ ] Player-compatible sources cannot create resource sites, unsupported capacity or free goods.
- [ ] Forge Test Laboratory covers collision, navigation, markers, hazards, stages and state variants.
- [ ] Multiplayer host authority prevents duplicate cycle or trade completion.

# Appendix D. Cross-System Dependency Matrix

| **System** | **Data received by 20B** | **Data provided by 20B** |
|---|---|---|
| Blocks/Items/Recipes/Resources | Components, tools, goods, deposits, recipes and progression. | Station/service requirements, orders and usage context. |
| NPC Village | Workers, skills, schedules, traits, households and memories. | Jobs, staffing demand, production, training and specialist risk. |
| World Generation | Terrain, deposits, zones, ecology and route opportunities. | Site binding, extraction state and world evidence. |
| Storage/Logistics | Inventories, reservations, routes, loading and deliveries. | Input/output demand, contracts, manifests and blockers. |
| Governance/Safety | Ownership, law, permissions, protected sites and response. | Hazard, trade, guild, work and incident context. |
| Automation/Magic | Power, machines, mana and advanced processing. | Worksite and production contracts for advanced branches. |
| Structures/Blueprint Forge | Source assets, markers, stages, states, bakes and placement. | Functional profiles, validators and runtime requirements. |
| Culture/Faction/Realm | Packs, laws, styles, practices and compatibility. | Universal functions and bounded replacement contracts. |
| Quest/Event | Contracts, discoveries, incidents and story state. | Shortages, accidents, trade outcomes and knowledge hooks. |
| UI/UX | Presentation, overlays and interaction patterns. | Work causes, orders, ledgers, courses and diagnostics. |

# Appendix E. Validation and Diagnostic Code Catalogue

| **Code** | **Meaning** | **Default Severity** |
|---|---|---|
| B20_SOURCE_DEFINITION_MISSING | Source does not reference an approved 20B definition. | Blocking |
| B20_RESOURCE_BINDING_MISSING | Resource-dependent source has no valid site or zone. | Blocking |
| B20_RESOURCE_PROFILE_MISMATCH | Facility and site resource profiles are incompatible. | Blocking |
| B20_WORKSTATION_MISSING | Required workstation or service point is absent. | Blocking |
| B20_WORKER_ROUTE_INVALID | Worker cannot safely reach the assigned station. | Blocking |
| B20_TOOL_STORE_MISSING | Required tool authority or store is absent. | Blocking/Runtime |
| B20_INPUT_BUFFER_MISSING | Required input inventory contract is absent. | Blocking |
| B20_OUTPUT_BUFFER_MISSING | Required output inventory contract is absent. | Blocking |
| B20_OUTPUT_ROUTE_BLOCKED | Output cannot reach an authorised destination. | Runtime Critical |
| B20_HAZARD_CLEARANCE_FAIL | Heat, dust, machinery, collapse or contamination clearance fails. | Blocking |
| B20_LOADING_CLEARANCE_FAIL | Freight or loading envelope is invalid. | Blocking |
| B20_TRADE_STOCK_UNOWNED | Listed stock has no valid seller or transfer authority. | Blocking/Runtime |
| B20_PUBLIC_FLOW_INVALID | Market or school public circulation/egress fails. | Blocking |
| B20_INSTRUCTOR_MISSING | Education service has no valid instructor. | Runtime Critical |
| B20_CURRICULUM_MISSING | Course has no valid curriculum or knowledge prerequisite. | Runtime Warning/Critical |
| B20_ARCHIVE_PROTECTION_FAIL | Knowledge storage lacks required environmental or security protection. | Blocking |
| B20_DUPLICATE_CAPACITY_MARKER | Unsupported duplicate marker attempts to multiply capacity. | Blocking |
| B20_TRANSACTION_RECONCILIATION_FAIL | Inputs, outputs and recorded losses do not balance. | Critical |
| B20_BAKE_NONDETERMINISTIC | Identical source inputs produced different runtime products. | Blocking |
| B20_SAVE_REFERENCE_STALE | Persistent element reference requires migration. | Migration Required |
