# LEYFORGE

## 20B — Work, Extraction, Crafting, Trade and Education

### Workplace Capacity, Resource-Site Binding, Artisan Production, Commerce Infrastructure, Vocational Training, Knowledge Institutions and Professional-Service Contracts

**Version 1.0 — Reconciled Production Companion Draft**  
**Date:** 8 August 2026  
**Production Status:** Active Document Set 20 v1.0 Reconciliation  
**Supersedes:** `20B_Fantasy_Voxel_Civilisation_Sandbox_Work_Extraction_Crafting_Trade_and_Education_v0_2` for active production direction  
**Master Authority:** Document 20 v1.0  
**Settlement Planning / Growth:** Document 19 v1.0  
**Persistent Structure State:** Document 12 v1.0  
**Official Blueprint Source:** Document 22I Blueprint Forge  
**Player Progression / Skill Outcomes:** Document 02 v1.0  
**Canonical Blocks / Items / Recipes / Resources:** Documents 03–06 v1.0  
**People / Jobs / Schedules / Local Task Execution:** Document 07 v1.0  
**Automation / Fixed Logistics / Machine Execution:** Document 08 v1.0  
**World / Resources / Ecology:** Documents 10–11 v1.0  
**Culture / Government / Law / Professional Institutions:** Document 13 v1.0  
**Quest / Event / Chronicle:** Document 15 v1.0  
**UI / Player Trust:** Document 17 v1.0  
**Godot + Summer Engine Technical Authority:** Document 18 v1.0  
**Economy / Markets / Merchants / Wages / Businesses / Contracts / Trade / Finance:** Set 27  
**Dialogue / Social Willingness / Delegation / Knowledge / Language / Belief:** Set 28  
**Health / Stamina / Fatigue / Biological Work Capacity:** Set 29  
**Movement / Route Accessibility / Travel / Caravan Physical Execution:** Set 30, with Set 26 specialist maritime/vessel transport  
**Production Governance / Registry / Lifecycle:** Set 25  
**Project Lead and Final Authority:** Ash

A production companion for the productive, commercial and knowledge-supporting side of Leyforge settlements. 20B defines **physical workplace and service capacity** for extraction sites, raw processing, artisan workshops, market/trade infrastructure, schools, archives and professional facilities while preserving strict ownership boundaries with workers, recipes, resources, businesses, markets, contracts, knowledge, progression, biology and movement.

> **20B Functional Rule**
>
> **A 20B building creates a valid place and bounded capacity for work, extraction, production, commerce, training or professional service. It does not manufacture workers, resources, recipes, prices, wages, contracts, knowledge, skill XP, stamina or route success. Those truths remain with their owners.**

> **Workplace / Worker Separation Rule**
>
> **20B owns compatible jobsites, stations, staffing requirements and workplace capacity. Document 07 owns persistent workers, job identity, schedules, task selection and local labour execution. Set 28 owns willingness/delegation where social consent matters; Set 27 owns employment agreements, wages, payroll and employer-side economic demand.**

> **Extraction / Resource Separation Rule**
>
> **A mine, quarry, lumber camp, clay works or similar facility must bind to a real approved world resource source. Documents 06/11 and specialist resource/ecology systems own the resource's existence, quantity, renewability and provenance. 20B owns the facility's safe extraction/service interface, not an invisible source of free material.**

> **Crafting / Transformation Separation Rule**
>
> **20B owns workshop capacity, workstations, safe buffers, operator requirements and production-service availability. Document 05 owns the exact transformation from authoritative inputs to authoritative outputs. Document 08 owns automated machine/network execution. A workshop cannot fabricate an unregistered recipe or duplicate stock.**

> **Commerce / Economy Separation Rule**
>
> **20B owns physical market, trading, loading, inspection, meeting and professional-service spaces. Set 27 owns market instances, merchant policy, sellable stock, supply/demand, price, barter value, wages, businesses, contracts, payments, trade routes and public finance. A market hall does not own the market simply because it contains stalls.**

> **Education / Progression / Knowledge Separation Rule**
>
> **20B owns educational and vocational facility capacity, approved curriculum opportunities, instructor/learner positions and session evidence. Document 02 owns player skill/progression outcomes. Set 28C owns individual knowledge, beliefs, language competence and informational state. Document 07 owns NPC skill/job state where applicable. A classroom cannot grant skill XP or knowledge merely because someone stands inside it.**

> **Biological Work Rule**
>
> **Set 29 owns Health, Stamina, Fatigue and biological work-capacity effects. 20B may require a worker-capacity snapshot and expose workload/hazard context, but it never directly drains Stamina, adds Fatigue or heals a worker.**

> **Canonical Construction Rule**
>
> **20B construction references canonical Blocks directly when placed and recovered identity is the same Block. Inventory and project logistics use generated Block Inventory Projections. Duplicate recoverable Block Items are forbidden under FR-00-20-006.**

> **POC Retirement Rule**
>
> **The Forest Hamlet lumber-camp/carpenter/watchtower support chain remains Archived Validation only. Generic workplaces, extraction, crafting, markets, schools, trade and succession mechanics survive. Legacy POC/Legacy Alpha Provenance/Legacy Beta Provenance labels are provenance, not current production lifecycle authority.**

---

# Revision 1.0 Summary

Version 1.0 is a targeted production reconciliation of the strong 20B v0.2 design.

It preserves:

- all **24 protected 20B stable building/function IDs** in the current 31–60 catalogue range;
- real resource-site binding;
- exact resource conservation;
- meaningful workplaces;
- extraction hazards and site validity;
- artisan workshop semantics;
- market/trading infrastructure;
- schools, archives, apprenticeship and guild/professional facilities;
- semantic markers/zones/sockets;
- Blueprint Forge source contracts;
- staged construction and commissioning;
- damage/repair/restoration;
- distant simulation and multiplayer authority;
- source/version/migration safety.

It changes or clarifies:

- **Document 07**, not 20B, owns workers, job identity, schedules, task selection and local labour execution;
- **Set 27**, not 20B, owns wages, employment agreements, employer budgets, businesses, markets, merchants, prices, listings, contracts, trade economics and financial settlement;
- **Set 28**, not 20B, owns willingness/delegation and individual informational knowledge/belief;
- **Document 02**, not 20B, owns player skill XP, progression, perk and mastery outcomes;
- **Set 29**, not 20B, owns Stamina, Fatigue, Health and biological work-capacity outcome;
- **Set 30/26**, not 20B, owns physical travel/access, caravan/vessel movement and arrival;
- **Document 05** remains the transformation owner, so workshop service capacity cannot replace recipe authority;
- **Document 08** remains automation/machine-network execution owner;
- **Document 19** owns settlement planner candidate selection and growth readiness;
- **Document 20** owns the authoritative ConstructionProject and service activation;
- **Document 12** owns the resulting persistent StructureInstance;
- legacy milestone labels become provenance pending 20H v1.0.

---

# Document Purpose

Document 20B is the detailed functional specification for **Work, extraction, artisan production, commerce infrastructure, education and professional-service facilities** inside Document 20.

It answers:

1. What makes a workplace a valid source of settlement Work capacity?
2. How does a resource-facing facility bind to a real forest, quarry, clay/sand source, ore deposit or other approved provider?
3. What must an artisan workshop provide before manual or automated production can occur safely and lawfully?
4. What physical infrastructure supports markets, trading posts, caravanserais, exchanges and professional services without duplicating Set 27?
5. How do schools, trade schools, archives and professional lodges support teaching, succession and knowledge access without owning progression or individual knowledge state?
6. How do hazards, damage, staffing, tools, utilities, stock, access and specialist systems constrain real throughput?

The design target remains **productive depth without factory-manager micromanagement**.

Residents should normally manage:

- shifts;
- ordinary station selection;
- routine tool replacement;
- ordinary hauling;
- repeat production orders;
- routine buying/selling;
- ordinary teaching sessions

through their owning systems and policies.

The player acts when:

- a resource source is exhausted or inaccessible;
- a specialist is missing;
- a key tool or machine breaks;
- production is bottlenecked;
- a contract/import route matters;
- a dangerous facility needs redesign;
- a settlement lacks training/succession;
- a player wants to specialise production;
- a new district/industry changes the settlement's strategic direction.

---

# Design Sources and Dependencies

| Source | 20B Production Dependency |
|---|---|
| 02 v1.0 | Use-based skills, teaching/training support, knowledge/research progression framework and player progression ownership. |
| 03–04 v1.0 | Canonical Blocks/Items, tools, equipment, inventories, Block Inventory Projections and distinct carried components. |
| 05 v1.0 | Exact recipes, transformations, reservations, outputs and by-products. |
| 06 v1.0 | Resource providers, progression capability, provenance, renewability and material ecology. |
| 07 v1.0 | Persistent workers, jobs, schedules, task selection, local labour execution and settlement rosters. |
| 08 v1.0 | Fixed automation, logistics, machines and network execution. |
| 10–11 v1.0 | Ecology, forests, deposits, terrain, world resource context and site suitability. |
| 12 v1.0 | Persistent StructureInstance, damage, restoration and world physical history. |
| 13 v1.0 | Law, land, culture, government, professional institutions and organisational context. |
| 15 v1.0 | Contracts/events/shortages/discoveries as quest/event hooks without owning economic truth. |
| 17 v1.0 | Work/service view models, blocker reasons, market knowledge filtering and accessibility. |
| 18 v1.0 | Godot/Summer services, save/LOD/authority, transactions, evidence and repository-honesty rules. |
| 19 v1.0 | Settlement planner, districts, parcels, project pools, growth readiness and player-blueprint workflow. |
| 20 v1.0 | Master seven-needs, ConstructionProject and function activation authority. |
| 20H v0.2 baseline pending 20H v1.0 reconciliation baseline | Protected stable catalogue IDs pending final 20H v1.0 lifecycle/catalogue reconciliation. |
| 22I | Official Blueprint Forge source. |
| Set 25 | Registry, lifecycle, packs, validation, migrations and Archived Validation governance. |
| Set 27 | Prices, markets, merchants, stock policy, wages, employment agreements, businesses, contracts, trade routes and finance. |
| Set 28 | Social willingness/delegation, knowledge/belief, language competence and social consequences. |
| Set 29 | Health/Stamina/Fatigue and biological work capacity. |
| Set 30 | Worker/customer/caravan route access, travel and arrival; Set 26 owns specialist maritime transport. |

---

# Static Table of Contents

1. Locked 20B Identity  
2. Scope Boundaries and Anti-Micromanagement Rules  
3. Source-of-Truth and Record Separation  
4. Seven-Needs Integration  
5. Shared Work, Capacity and Service Model  
6. Semantic Marker, Zone, Socket and Resource-Binding Contracts  
7. Jobs, Staffing, Skills, Tools and Biological Work Capacity  
8. Extraction and Raw-Processing Rules  
9. Crafting and Artisan-Production Rules  
10. Trade, Markets, Contracts and Commerce Infrastructure  
11. Education, Knowledge, Apprenticeship and Professional Succession  
12. Resource Conservation, Buffers, Quality and By-products  
13. Settlement Planner Handoff  
14. Blueprint Forge Authoring and Official Source Validation  
15. Restricted Player-Creator Validation  
16. Construction Stages, Commissioning and Partial Activation  
17. Upgrade Inheritance, Conversion and Replacement  
18. Damage, Hazards, Occupation, Repair and Restoration  
19. Networks and Cross-System Service Dependencies  
20. Settlement-Stage Expectations  
21. Detailed Registry Summary  
22. Extraction and Raw-Processing Entries  
23. Crafting and Artisan Entries  
24. Trade and Professional-Service Entries  
25. Education and Knowledge Entries  
26. Archived Validation Scope  
27. Simulation LOD, Persistence and Multiplayer Authority  
28. Balancing, Diagnostics and Anti-Exploit Rules  
29. Godot + Summer Engine Implementation Direction  
30. Open Questions for Later Balancing  
Appendices A–F

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

| Layer | Authority | 20B Relationship |
|---|---|---|
| Universal function | Document 20 / 20B detailed owner | Stable function identity, needs contribution, capacity/activation contract and semantic requirements. |
| Official source blueprint | 22I Blueprint Forge | Voxel composition, modules, semantic layers, stages, states, placement and dependencies. |
| Player-authored source | Document 19 | Restricted compatible source; cannot create new universal functions or resource sources. |
| Construction project | Document 20 | Site, source revision, reservations, work/stages, blockers, commissioning and project history. |
| Persistent structure | Document 12 | StructureInstance, physical condition, damage/restoration and world deltas. |
| Workers / jobs / tasks | Document 07 | Persistent workers, occupational/job state, schedules, task selection and local labour execution. |
| Employment economics | Set 27D | Labour demand, employment agreements, compensation, payroll and employer affordability. |
| Markets / merchants / prices | Set 27B/27C | Value/price formation, market instances, merchant economic policy, available-for-sale stock and supply/demand. |
| Contracts / trade | Set 27E/27H | Persistent obligations, payment, breach/enforcement, caravans, trade routes and regional exchange. |
| Social assignment | Set 28 | Willingness, delegation, social pressure and relationship consequences. |
| Knowledge state | Set 28C | Individual knowledge/belief, information provenance, language competence and comprehension. |
| Progression | Document 02 | Player skill XP, perks, mastery, progression milestones and knowledge/research progression framework. |
| Biology | Set 29 | Health, Stamina, Fatigue and biological work-capacity modifiers. |
| Movement | Set 30 / Set 26 | Physical route eligibility, path/travel and arrival. |
| Resources / recipes | Documents 03–06 | Canonical resources, tools, items, deposits/providers, recipes, outputs and by-products. |
| Automation | Document 08 | Machine/network execution, automated production and fixed logistics. |
| Pack/culture resolution | 20G + 13 + Set 25 | Culture/biome/realm expression and governed source resolution. |

## 3.3## 3.3 Non-Duplication Rules

- The universal definition never contains a complete voxel source.
- Blueprint source never owns authoritative item or production totals.
- Runtime bake products are disposable derivatives and can be regenerated.
- Structure identity persists through source revision, pack changes, repair and migration under Document 12.
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
| Work | Primary building-function authority for suitable workplace capacity, functioning sites, station/tool/input/training requirements and productive service availability; Document 07/Set 27/29 own worker/job/economic/biological state. | Open jobs, unemployment, specialist gaps, paused sites, apprenticeship capacity and travel. | Employment, skill or productivity as separate needs. |
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
- Coverage and commute use real routes and permissions, not straight-line radius alone.## 5.6 Capacity Is Not Worker, Transaction or Progression Outcome

20B can report that a facility has:

- two valid smithing stations;
- one vacant instructor position;
- four apprentice places;
- a functioning market hall;
- a bound quarry;
- available loading capacity.

That does **not** mean:

- a worker has been assigned;
- an employment agreement exists;
- wages have been paid;
- a sale has occurred;
- a recipe has completed;
- a learner gained skill XP;
- a person learned a fact;
- Stamina/Fatigue changed.

Those outcomes remain with their owners.

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

# 7. Jobs, Staffing, Skills, Tools and Biological Work Capacity

20B owns **workplace positions and requirements**.

It does not own the worker.

## 7.1 Workplace Position

A workplace position may declare:

- role/job compatibility;
- minimum skill/capability;
- tool/equipment requirement;
- workstation/socket;
- hazard profile;
- shift/availability envelope;
- access requirement;
- required inputs/outputs;
- supervisor/instructor relationship;
- physical/body compatibility.

## 7.2 Worker and Job Ownership

Document 07 owns:

- persistent worker identity;
- job/occupation state;
- schedule;
- task selection;
- local work execution;
- settlement roster.

20B supplies:

- workplace demand;
- compatible positions;
- station capacity;
- facility blockers;
- work opportunity.

## 7.3 Employment Economics

Set 27D owns:

- employment agreements;
- wage/compensation terms;
- payroll;
- employer affordability;
- labour-market pressure;
- enterprise labour cost.

A filled 20B position does not imply the worker is economically employed under a wage contract.

Valid labour may also occur through:

- household contribution;
- communal obligation;
- guild duty;
- public service;
- slavery/forced labour only if future legal/content policy explicitly supports it;
- volunteer/quest assistance;
- player self-work;
- automation.

The legal/social/economic interpretation belongs to its respective owners.

## 7.4 Social Willingness and Delegation

Set 28 owns voluntary assignment and social willingness where required.

A planner, employer or ruler can propose or authorise a role without forcing the underlying social decision outside the applicable rules.

## 7.5 Skill and Progression

Document 02 owns player skill/progression outcomes.

20B may expose:

- relevant skill family;
- required proficiency;
- practice quality;
- instructor availability;
- station sophistication;
- completion evidence.

The progression owner decides:

- XP;
- skill increase;
- perks;
- mastery;
- recipe/technique progression eligibility.

## 7.6 Biological Work Capacity

Set 29 owns:

- Health;
- Stamina;
- Fatigue;
- injury;
- disease;
- environmental biological impairment.

20B may query a bounded `WorkCapacityModifier`/availability summary.

It may expose work context such as:

- heavy labour;
- heat;
- dust;
- toxic exposure;
- prolonged exertion;
- shift duration.

Set 29 converts those facts into biological consequence.

## 7.7 Tools

Tools are canonical Item/Block identities.

20B defines:

- compatible tool capability;
- station/tool requirement;
- safe use context.

Item systems own:

- tool identity;
- durability;
- condition;
- ownership.

A broken or missing tool can pause a facility without 20B inventing a replacement.

## 7.8 Succession

A settlement should not become permanently dependent on one irreplaceable specialist.

Recovery paths may include:

- apprenticeship;
- school/trade school;
- another specialist;
- migration;
- hired contractor;
- purchased training;
- books/research;
- player mastery;
- automation;
- culture-specific equivalent.

The actual progression/knowledge/social/economic outcomes remain with their owners.

# 8. Extraction and Raw-Processing Rules

Extraction facilities connect settlement labour to **real world resource sources**.

20B owns the facility and extraction-service capacity.

Documents 06/10/11 and specialist systems own the underlying source.

## 8.1 Valid Source Types

A facility may bind to:

- forest/forestry zone;
- quarryable stone body;
- clay/sand source;
- ore/mineral deposit;
- underground mineable region;
- biomass/fuel source;
- salvage field;
- future culture/realm-specific resource provider.

## 8.2 Resource Binding Contract

A valid binding records:

- facility ref;
- source/provider ref;
- source revision;
- extraction method/capability;
- legal/ownership permission;
- access route;
- loading/staging endpoint;
- environmental/hazard profile;
- allowed resource outputs;
- remaining/renewal evidence ref;
- current blocker state.

The binding does not copy authoritative source quantity into 20B.

## 8.3 No Decorative Extraction

Decorative or blueprint-authored:

- ore veins;
- trees;
- quarry faces;
- logs;
- stockpiles

cannot become a production source merely because they visually resemble one.

The world/resource owner must confirm the source.

## 8.4 Extraction Transaction

Conceptual flow:

```text
Valid Source
→ valid worker/tool/machine
→ access
→ extraction request
→ source owner validates quantity/renewal/protection
→ authoritative resource change
→ output Item/Block/resource created
→ staging/storage transaction
→ evidence returned to 20B
```

## 8.5 Forestry

Lumber camps may consume:

- harvestable-tree population/zone;
- sustainable yield policy;
- route;
- tool capability;
- replanting/rotation policy;
- ecology constraints.

Document 10/11/06 owns forest/ecology/source truth.

## 8.6 Mining and Quarrying

Mines/quarries may require:

- support;
- ventilation;
- drainage;
- light;
- access/haulage;
- hazard clearance;
- tool tier;
- ore/stone source.

20B owns the facility requirements.

Document 06/11 owns resource/geology truth.

Document 12 owns constructed supports/physical structure.

Set 30 owns worker/cart access.

Set 29 owns dust/heat/exertion biological consequence.

## 8.7 Raw Processing

Facilities such as:

- Sawmill;
- Ore Sorting Yard;
- Charcoal/Fuel Yard

provide processing-service capacity.

Document 05 owns the transformation.

Document 08 owns automated machine execution where automation is used.

## 8.8 Depletion and Renewal

20B may display:

- healthy;
- declining;
- depleted;
- regenerating;
- restricted;
- inaccessible.

The source owner commits the actual state.

LOD cannot restore a depleted mine or forest automatically.

# 9. Crafting and Artisan-Production Rules

20B artisan buildings turn valid stations, workers, tools and inputs into **production opportunity**.

Document 05 owns exact transformations.

## 9.1 Artisan Facility Contract

A production facility can require:

- valid workstation;
- operator position;
- skill/capability;
- tools;
- authoritative input buffer;
- output buffer;
- route/loading access;
- heat/ventilation/water/power/mana where relevant;
- hazard separation;
- recipe eligibility;
- legal/ownership permission.

## 9.2 Manual Production Flow

```text
Production Order / Need
→ recipe selected by owning production/task logic
→ inputs reserved
→ worker/tool/station validated
→ worker physically reaches station
→ work occurs
→ Document 05 commits exact transformation
→ outputs/by-products enter authoritative storage
→ evidence updates facility throughput
```

## 9.3 Automation Boundary

If a machine performs the transformation:

- Document 08 owns machine/network execution;
- Document 05 owns transformation identity/transaction;
- 20B owns the building/facility's compatible service context.

A workshop does not become the automation system.

## 9.4 Quality

Where quality exists, it may depend on:

- material grade;
- tool/station quality;
- worker skill;
- recipe;
- environment;
- process stability.

The owning Item/Recipe/Progression systems commit the quality result.

20B exposes the facility conditions.

## 9.5 By-products and Waste

By-products are real outputs.

Waste does not vanish because the building is distant.

Waste may require:

- storage;
- removal;
- treatment;
- recycling;
- disposal.

20D/08/05 and specialist systems own the actual logistics/transformation.

## 9.6 Multiple Services in One Workshop

A structure can host several compatible workstations.

Each service has independently traceable:

- capacity;
- staff;
- stock;
- hazards;
- utilities;
- output.

Shared space cannot be counted twice beyond validated physical capacity.

# 10. Trade, Markets, Contracts and Commerce Infrastructure

20B owns **commerce infrastructure**.

Set 27 owns the economy.

This distinction is one of the major v1.0 reconciliations.

## 10.1 What 20B Owns

A market/trade facility may provide:

- stall/vendor positions;
- public/customer circulation;
- inspection space;
- secure storage interface;
- loading/unloading;
- caravan accommodation;
- contract/meeting room;
- customs/checkpoint interface;
- records office;
- professional service rooms;
- display/auction space;
- hospitality integration.

## 10.2 What Set 27 Owns

Set 27 owns:

- currency/barter/value;
- price formation;
- market instances;
- merchant economic policy;
- available-for-sale stock;
- demand/supply pressure;
- liquidity/turnover;
- businesses/enterprise budgets;
- employment economics;
- contracts/escrow/breach/enforcement;
- caravans/trade routes/regional exchange;
- taxation/tariffs/public finance;
- credit/debt/insurance;
- embargo/smuggling/black markets.

20B does not duplicate any of those formulas.

## 10.3 Market Hall Is Not Market State

A Covered Market can be:

- empty;
- inactive;
- understocked;
- illegal;
- closed;
- occupied;
- inaccessible.

The building may be perfectly intact while Set 27 reports no functioning market.

Conversely, an informal market may operate outdoors if Set 27 and the world rules allow it.

## 10.4 Merchant Stock

Physical goods remain authoritative inventory.

A stall does not regenerate stock.

`AvailableForSale` is a Set-27 derived subset after:

- ownership;
- reservations;
- protected reserves;
- obligations;
- capacity.

## 10.5 Trading Post

A Trading Post can provide:

- regional exchange interface;
- cargo staging;
- manifest/check-in space;
- courier/caravan service positions;
- secure trade storage;
- contract meeting point.

Set 27 owns the actual trade relationship and economic delivery obligation.

Set 30/26 owns physical journey execution.

## 10.6 Caravanserai / Coach Inn

The facility may provide:

- traveller accommodation;
- animal/vehicle support;
- cargo holding;
- rest/service space;
- merchant meeting capacity.

20A owns hospitality/accommodation functions where relevant.

Set 27 owns commercial transactions.

Set 30 owns caravan/land movement.

## 10.7 Merchant Exchange / Professional Guild Hall

These buildings may host:

- merchant/business services;
- professional meetings;
- notices;
- contract negotiation;
- training;
- arbitration space.

Document 13 may own formal institution/governance status.

Set 27 owns economic enterprise/market/contracts.

Set 28 owns social negotiation/willingness.

20B owns the physical/professional service opportunity.

## 10.8 Market Knowledge

Live authoritative price comes from Set 27.

A person's belief about a distant price belongs to Set 28C knowledge.

UI must distinguish:

- live confirmed market data;
- delayed report;
- rumour;
- estimate;
- unknown.

# 11. Education, Knowledge, Apprenticeship and Professional Succession

20B owns **education/training facility capacity and instructional opportunity**.

It does not own the learner's final progression or knowledge state.

## 11.1 Education Facility Contract

A school/trade school/archive may require:

- instructor position;
- learner places;
- safe accessible teaching area;
- curriculum reference;
- books/materials/tools;
- practice station;
- schedule/session capacity;
- permissions;
- language/comprehension support where required.

## 11.2 Instruction Session

A session can produce evidence such as:

- learner attended;
- instructor valid;
- curriculum delivered;
- practice completed;
- material consumed;
- assessment passed;
- course milestone completed.

The relevant owner converts that evidence into outcome.

## 11.3 Player Progression

Document 02 owns:

- skill XP;
- skill progression;
- perk eligibility;
- mastery;
- progression milestones;
- knowledge/research progression framework.

Training is a valid progression source, not a bypass around use/practice/world requirements.

## 11.4 Individual Knowledge

Set 28C owns:

- individual informational knowledge;
- beliefs;
- claims;
- evidence/provenance;
- language competence;
- comprehension;
- information propagation.

A library can expose books/records/access.

It cannot directly set:

`person.knows_everything = true`.

## 11.5 Physical Books / Records

Items/document systems own the physical object.

Set 28C may own the informational content/knowledge state.

Document 15/13 may own historical/political truth referenced by the record.

20B owns:

- archive/library service;
- storage/access conditions;
- cataloguing/study positions.

## 11.6 Apprenticeship

An apprenticeship may require:

- valid mentor/master;
- learner;
- workplace;
- practice materials;
- time/session milestones;
- social agreement;
- economic agreement where paid/contracted;
- skill/progression eligibility.

Owners:

- workplace/service — 20B;
- worker/job — Document 07;
- social agreement — Set 28;
- employment/pay — Set 27;
- progression — Document 02;
- biological capacity — Set 29.

## 11.7 Professional Succession

A settlement may become vulnerable if:

- one smith dies/leaves;
- one healer retires;
- one navigator migrates;
- one engineer is injured.

20B exposes succession risk based on training/service capacity.

The planner may respond through Document 19.

No replacement NPC is spawned solely to satisfy a building.

## 11.8 Research Boundary

Libraries/archives/trade schools can support research.

They do not own:

- world truth;
- recipe identity;
- magic rules;
- technology progression;
- quest completion.

They expose valid research/instruction infrastructure to the owning progression/knowledge/system.

# 12. Resource Conservation, Buffers, Quality and By-products

20B follows the global conservation rule.

## 12.1 Buffer States

Facility stock may be:

- available;
- reserved;
- in transit;
- in process;
- output-ready;
- quarantined;
- waste/by-product;
- contract-bound;
- inaccessible.

The authoritative inventory/transaction owner stores the quantities.

## 12.2 Reservation

A production order may reserve:

- inputs;
- station time;
- output capacity;
- worker time;
- transport;
- contract quantity.

Reservation does not equal consumption.

## 12.3 Atomic Transformation

Document 05 commits:

- input consumption;
- output creation;
- by-products;
- state changes.

A cancelled/failed process follows recipe/transaction recovery rules.

## 12.4 Economic Reservation

Set 27 may reserve goods/money against:

- listing;
- contract;
- shipment;
- payroll;
- tax;
- procurement.

20B consumes availability evidence.

## 12.5 Quality and Provenance

Outputs can preserve:

- source/material provenance;
- producer/workshop ref;
- quality;
- culture/technique;
- batch;
- legal/contract provenance.

20B may contribute facility/producer context without becoming the Item owner.

## 12.6 Distant Conservation

Distant simulation may aggregate cycles.

It must preserve:

```text
Opening Stock
+ Authoritative Inflow
+ Authoritative Production
- Authoritative Consumption/Outflow
= Closing Stock
```

within declared transformations/by-products.

# 13. Settlement Planner Handoff

Document 19 owns the settlement planner and project selection.

20B supplies function-side pressures/opportunities.

## 13.1 20B Planner Signals

20B may expose:

- unemployment/open-workplace mismatch;
- missing specialist;
- succession risk;
- resource-source opportunity;
- exhausted/depleted source;
- production bottleneck;
- missing artisan capability;
- market-space deficit;
- trade-access opportunity;
- education/training deficit;
- damaged/unsafe workplace;
- output/logistics bottleneck.

## 13.2 External Inputs

Document 19 also consumes:

- worker roster/jobs — Document 07;
- economic labour demand, wages, business profitability, market/trade signals — Set 27;
- social willingness/institutional conflict — Set 28/13;
- fatigue/health/work capacity — Set 29;
- routes/travel — Set 30/26;
- resources/world — 06/10/11;
- storage/utilities — 20D/08;
- law/land — 13.

## 13.3 Planner Output

The planner creates a `SettlementProjectProposal`.

Document 20 validates and creates an authoritative ConstructionProject.

20B does not:

- choose final settlement-wide priority;
- pay wages;
- create a business;
- assign a worker;
- create a market;
- alter resource quantity;
- complete training/progression.

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

Commissioning validates source version, site/resource binding, workers, tools, stock, routes, utilities, safety, permissions and initial service profile. Visual completion alone is not commissioning.## 16.5 v1.0 Construction Ownership

Document 20 v1.0 owns the authoritative ConstructionProject.

20B defines commissioning requirements for the target workplace/service.

Construction consumes:

- canonical Blocks and Block Inventory Projections;
- genuine distinct Items/components;
- Document-07 labour;
- Set-27 procurement/finance/employment contracts where relevant;
- Set-28 consent/assignment where relevant;
- Set-29 biological availability;
- Set-30/26 physical access/arrival;
- Document-12 StructureInstance commits.

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

Repair uses real components, tools, labour and access. Restoration can preserve heritage, return original function, convert to a new compatible service or leave a readable ruin. Source revisions and repairs use stable element IDs and migration rules.## 18.6 Hazard Ownership Boundaries

20B defines workplace hazard zones and safe-layout requirements.

The resulting consequences are external:

- physical structure damage — Document 12 / Document 16 or environment owner;
- worker Health/injury/toxin/Fatigue — Set 29;
- evacuation/access — Set 30;
- legal/insurance/economic consequence — Document 13 / Set 27;
- social consequences — Set 28.

A hazard marker does not directly damage or fatigue a person.

# 19. Networks and Cross-System Service Dependencies

| Dependency | 20B Use | Authoritative Owner |
|---|---|---|
| Workers/jobs | Staff positions, operator/instructor availability. | Document 07. |
| Employment/pay | Wage, employment agreement, payroll and labour-market pressure. | Set 27D. |
| Markets/prices | Merchant availability, live market state, sellable stock, price/supply-demand. | Set 27B/27C. |
| Contracts | Production orders, service obligations, procurement, breach/enforcement. | Set 27E. |
| Regional trade | Caravans, imports/exports and route economics. | Set 27H; movement Set 30/26. |
| Social assignment | Willingness, delegation, negotiation and relationship consequence. | Set 28. |
| Knowledge/language | Individual knowledge, belief, reports, comprehension. | Set 28C. |
| Progression | Skill XP, perks, mastery, player training outcome. | Document 02. |
| Biological capacity | Health, Stamina, Fatigue and work-capacity modifier. | Set 29. |
| Routes/access | Worker, customer, learner, caravan access and travel. | Set 30/26. |
| Resources | Source identity, provenance, renewability and progression. | Document 06/11/10 specialist. |
| Recipes | Exact transformations. | Document 05. |
| Stock/inventory | Physical goods, reservations and ownership. | Item/inventory owners. |
| Automation | Machine cycles, fixed logistics, automated execution. | Document 08. |
| Storage/roads/utilities | Buffers, roads, freight, water, power. | 20D + specialist owner. |
| Magic/advanced industry | Mana, enchanted production, advanced machines. | Document 09/20E/08. |
| Law/land/institutions | Work legality, land rights, professional/government context. | Document 13/20C. |
| Planning | Districts, project pools, proposals, growth readiness. | Document 19. |

## 19.1 Weakest-Link Rule

A facility's effective capacity is constrained by required dependencies.

Examples:

- mine + ore + no safe access = offline;
- smithy + worker + no fuel = paused;
- market hall + stalls + no merchant stock = empty market space;
- school + classroom + no instructor = unavailable teaching;
- trade school + instructor + no practice materials = constrained;
- caravanserai + cargo capacity + impassable road = no physical caravan arrival.

## 19.2 No Cross-System Formula Copies

20B does not duplicate:

- price formula;
- wage formula;
- Stamina/Fatigue formula;
- movement speed/path cost;
- knowledge confidence;
- XP curve;
- recipe yield.

It consumes owner outputs.

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

| **No.** | **Stable ID** | **Definition** | **Earliest Stage** | **Primary Need** | **Planner Class** | **Legacy Scope Provenance** |
|---:|---|---|---|---|---|---|
| 31 | `building.extraction.lumber_camp` | Lumber Camp | Hamlet | Work | Optional | Legacy POC Core Provenance |
| 32 | `building.extraction.sawmill` | Sawmill | Village | Work | Optional | Legacy Legacy Alpha Provenance Provenance |
| 33 | `building.extraction.quarry_stone_yard` | Quarry and Stone Yard | Village | Work | Conditional | Legacy Legacy Alpha Provenance Provenance |
| 34 | `building.extraction.clay_sand_works` | Clay or Sand Works | Hamlet | Work | Conditional | Legacy Legacy Alpha Provenance Provenance |
| 35 | `building.extraction.mine_entrance` | Mine Entrance | Hamlet | Work | Conditional | Legacy Extended-Slice Provenance |
| 36 | `building.extraction.deep_mine_complex` | Mine Shaft or Deep Mine Complex | Town | Work | Conditional | Legacy Legacy Beta Provenance Provenance |
| 37 | `building.extraction.ore_sorting_yard` | Ore Sorting Yard | Village | Work | Optional | Legacy Legacy Alpha Provenance Provenance |
| 38 | `building.extraction.charcoal_fuel_yard` | Charcoal Burner and Fuel Yard | Hamlet | Provisions | Optional | Legacy Legacy Alpha Provenance Provenance |
| 41 | `building.crafting.carpenter_workshop` | Carpenter Workshop | Village | Work | Required | Legacy POC Core Provenance |
| 42 | `building.crafting.mason_yard` | Mason Yard | Village | Work | Required | Legacy Extended-Slice Provenance |
| 43 | `building.crafting.village_blacksmith` | Village Blacksmith | Village | Work | Required | Legacy Extended-Slice Provenance |
| 44 | `building.crafting.pottery_kiln` | Pottery and Kiln | Village | Work | Optional | Legacy Legacy Alpha Provenance Provenance |
| 45 | `building.crafting.weaver_tailor` | Weaver and Tailor Workshop | Village | Work | Optional | Legacy Legacy Alpha Provenance Provenance |
| 46 | `building.crafting.tannery_leatherworker` | Tannery and Leatherworker | Village | Work | Optional | Legacy Legacy Alpha Provenance Provenance |
| 47 | `building.crafting.glass_brick_works` | Glassworks or Brickworks | Town | Work | Optional | Legacy Legacy Beta Provenance Provenance |
| 51 | `building.trade.market_stalls` | Market Stalls | Village | Work | Optional | Legacy Extended-Slice Provenance |
| 52 | `building.trade.trading_post` | Trading Post | Village | Infrastructure | Optional | Legacy Extended-Slice Provenance |
| 53 | `building.trade.covered_market_hall` | Covered Market or Market Hall | Town | Work | Optional | Legacy Legacy Beta Provenance Provenance |
| 54 | `building.trade.caravanserai_coach_inn` | Caravanserai or Coach Inn | Town | Infrastructure | Conditional | Legacy Legacy Beta Provenance Provenance |
| 55 | `building.trade.merchant_exchange` | Merchant Guild or Trade Exchange | City | Work | Optional | Legacy Legacy Beta Provenance Provenance |
| 60 | `building.professional.guild_hall` | Guild Hall or Professional Lodge | Town | Work | Optional | Legacy Legacy Beta Provenance Provenance |
| 56 | `building.education.small_school` | Small School | Village | Work | Optional | Legacy Extended-Slice Provenance |
| 57 | `building.education.trade_school` | Apprentice or Trade School | Village | Work | Optional | Legacy Legacy Alpha Provenance Provenance |
| 58 | `building.education.library_archive` | Library or Archive | Town | Morale | Optional | Legacy Legacy Beta Provenance Provenance |## 21.1 Production Lifecycle Note

The **24 20B stable IDs and catalogue numbers** remain protected.

The legacy scope-provenance field is not current Set-25 production status.

20H v1.0 will freeze current lifecycle classifications without renumbering or deleting valid functions merely because their prior provenance was POC/Legacy Alpha Provenance/Legacy Beta Provenance.

## 21.2 Catalogue Range Boundary

The intentional number gaps in 31–60 remain protected for definitions owned by other Set-20 companions or existing catalogue structure.

20B does not claim every number in the range.

# 22. Extraction and Raw-Processing Entries

### 31. Lumber Camp

`building.extraction.lumber_camp`

| **Catalogue role**                      | Extraction / Forestry \| Hamlet \| Parcel \| Optional \| Legacy POC Core Provenance                                                                                                                                 |
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

| **Catalogue role**                      | Extraction / Raw Processing \| Village \| Medium \| Optional \| Legacy Legacy Alpha Provenance Provenance                                                                                                     |
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

| **Catalogue role**                      | Extraction / Stone \| Village \| Large Parcel \| Conditional \| Legacy Legacy Alpha Provenance Provenance                                                                                                              |
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

| **Catalogue role**                      | Extraction / Earth Materials \| Hamlet \| Parcel \| Conditional \| Legacy Legacy Alpha Provenance Provenance                                                                                         |
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

| **Catalogue role**                      | Extraction / Mining \| Hamlet \| Medium \| Conditional \| Legacy Extended-Slice Provenance                                                                                                           |
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

| **Catalogue role**                      | Extraction / Advanced Mining \| Town \| Large Complex \| Conditional \| Legacy Legacy Beta Provenance Provenance                                                                                                            |
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

| **Catalogue role**                      | Extraction / Raw Processing \| Village \| Parcel \| Optional \| Legacy Legacy Alpha Provenance Provenance                                                                                  |
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

| **Catalogue role**                      | Extraction / Fuel \| Hamlet \| Parcel \| Optional \| Legacy Legacy Alpha Provenance Provenance                                                                                         |
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
| **Pack and style resolution**         | Earth mound, brick retort, forest charcoal camp, underground smokeless kiln, volcanic burner or rune-sealed clean kiln.                            |## 22.1 v1.0 Extraction Ownership Note

Every extraction entry in this section is a **facility/service definition**, not a resource definition.

For all extraction entries:

- Document 06/11/specialist owners supply the real source;
- Document 07 supplies the worker;
- Set 29 supplies biological availability;
- Set 30 supplies physical access;
- Document 05 owns transformations;
- Document 08 owns automated machinery where used;
- Set 27 owns labour cost, enterprise economics and resource market value.

A decorative or blueprint-authored resource face cannot be harvested as an infinite source.

# 23. Crafting and Artisan Entries

### 41. Carpenter Workshop

`building.crafting.carpenter_workshop`

| **Catalogue role**                      | Crafting / Woodwork \| Village \| Medium \| Required \| Legacy POC Core Provenance                                                                                                                |
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

| **Catalogue role**                      | Crafting / Stonework \| Village \| Parcel \| Required \| Legacy Extended-Slice Provenance                                                                                   |
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

| **Catalogue role**                      | Crafting / Metalwork \| Village \| Medium \| Required \| Legacy Extended-Slice Provenance                                                                                        |
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

| **Catalogue role**                      | Crafting / Ceramics \| Village \| Small-Medium \| Optional \| Legacy Legacy Alpha Provenance Provenance                                                                                           |
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

| **Catalogue role**                      | Crafting / Textiles \| Village \| Medium \| Optional \| Legacy Legacy Alpha Provenance Provenance                                                                                                            |
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

| **Catalogue role**                      | Crafting / Leather \| Village \| Medium \| Optional \| Legacy Legacy Alpha Provenance Provenance                                                                                              |
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

| **Catalogue role**                      | Crafting / Construction Materials \| Town \| Large \| Optional \| Legacy Legacy Beta Provenance Provenance                                                                                                                               |
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
| **Pack and style resolution**         | Roman-style glasshouse, desert sun glassworks, dwarven furnace hall, volcanic brickworks, crystal blower or mana-flame kiln.                                                                         |## 23.1 v1.0 Artisan Ownership Note

All artisan entries provide:

- valid stations;
- work capacity;
- safe process space;
- buffers;
- tool/operator requirements;
- compatible recipe opportunities.

Document 05 owns exact recipes and output.

Document 07 owns worker/task execution.

Set 27 owns wages/business economics/sales.

Document 02 owns player skill progression from practice.

No workshop directly writes those external states.

# 24. Trade and Professional-Service Entries

### 51. Market Stalls

`building.trade.market_stalls`

| **Catalogue role**                      | Trade / Local Market \| Village \| Cluster \| Optional \| Legacy Extended-Slice Provenance                                                                                                          |
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

| **Catalogue role**                      | Trade / Regional Exchange \| Village \| Medium \| Optional \| Legacy Extended-Slice Provenance                                                                                                  |
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

| **Catalogue role**                      | Trade / Urban Market \| Town \| Large \| Optional \| Legacy Legacy Beta Provenance Provenance                                                                                                                            |
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

| **Catalogue role**                      | Trade / Route Support \| Town \| Large Complex \| Conditional \| Legacy Legacy Beta Provenance Provenance                                                                          |
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

| **Catalogue role**                      | Trade / Finance and Coordination \| City \| Large \| Optional \| Legacy Legacy Beta Provenance Provenance                                                                                                            |
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

| **Catalogue role**                      | Professional / Organisation \| Town \| Medium-Large \| Optional \| Legacy Legacy Beta Provenance Provenance                                                                                                                      |
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
| **Pack and style resolution**         | Craft guild hall, clan lodge, merchant fraternity, ranger lodge, mage order, underground union hall or floating professional conclave.                                                       |## 24.1 v1.0 Commerce / Professional Ownership Note

Market Stalls, Trading Posts, Covered Markets, Caravanserais, Merchant Exchanges and Guild/Professional Lodges provide **physical/professional service capacity**.

Set 27 owns:

- merchants;
- markets;
- prices;
- sellable stock;
- business ownership;
- employment economics;
- contracts;
- trade routes;
- payments.

Set 28 owns social negotiation/willingness.

Document 13 owns formal institution, law and political status.

A completed commerce building can exist while its economic service remains inactive.

# 25. Education and Knowledge Entries

### 56. Small School

`building.education.small_school`

| **Catalogue role**                      | Education / Basic Learning \| Village \| Small \| Optional \| Legacy Extended-Slice Provenance                                                                                                                               |
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

| **Catalogue role**                      | Education / Vocational Training \| Village \| Medium \| Optional \| Legacy Legacy Alpha Provenance Provenance                                                                                                      |
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

| **Catalogue role**                      | Education / Knowledge \| Town \| Large \| Optional \| Legacy Legacy Beta Provenance Provenance                                                                                                             |
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
| **Pack and style resolution**         | Scriptorium, oral-history hall, crystal memory archive, living library, stone rune archive, dream library or subterranean map vault.                                   |## 25.1 v1.0 Education / Knowledge Ownership Note

Schools, Trade Schools and Libraries/Archives provide **instructional, study and knowledge-access infrastructure**.

They do not own:

- player XP or skill progression — Document 02;
- individual factual knowledge/belief/language competence — Set 28C;
- NPC worker identity/job state — Document 07;
- paid apprenticeship/employment terms — Set 27;
- social willingness/mentor relationship — Set 28.

Where legacy entry wording says a facility “creates specialists,” interpret it as **provides validated training/succession opportunity**. The owning progression/person systems commit the actual specialist growth.

# 26. Archived Validation Scope

The former Legacy POC Provenance / Legacy Extended-Slice Provenance / Legacy Alpha Provenance / Legacy Beta Provenance scope labels are no longer active production authority.

They remain provenance.

## 26.1 Archived Forest-Hamlet Productive Chain

The historical fixture may continue to test:

- Lumber Camp;
- Carpenter Workshop;
- real logs;
- real recipes;
- real worker route/task;
- project materials;
- storage;
- save/LOD.

The former expanded fixture may also test:

- Mine Entrance;
- Mason Yard;
- Village Blacksmith;
- Market Stalls;
- Trading Post;
- Small School.

## 26.2 What Is Archived

Normal production does not require:

- Forest Hamlet;
- one named lumberjack/carpenter;
- fixed resource locations;
- fixed watchtower demand;
- fixed market;
- fixed school;
- fixed progression order.

## 26.3 What Is Preserved

Preserve:

- real source binding;
- real work;
- exact production;
- real stock;
- physical commerce infrastructure;
- training/succession opportunity;
- damage/repair;
- save/LOD;
- generated-settlement applicability.

## 26.4 Production Test Requirement

Retained functions must work in arbitrary generated settlements and player-founded settlements without POC identities.

# 27. Simulation LOD, Persistence and Multiplayer Authority

20B service state can simplify at distance without creating a second economy or work simulation.

## 27.1 Local Detail

Nearby simulation may show:

- workers travelling;
- tools being used;
- mining/chopping/crafting animation;
- goods moving;
- customers at stalls;
- teachers/learners using stations.

## 27.2 Distant Summary

Distant simulation may aggregate:

- workplace utilisation;
- extraction batches;
- production orders;
- staffing;
- education session evidence;
- commerce facility availability.

Set 27 remains owner of distant economic transactions.

Document 07 remains worker/job owner.

Set 29 remains biological owner.

## 27.3 Persistent Minimum

Persist/reference as required:

- StructureInstance ref;
- service/function record;
- source blueprint/version;
- resource binding refs;
- job/workplace position refs;
- production-order/transaction refs;
- external market/business/contract refs;
- educational session/curriculum refs;
- damage/hazard state;
- source revisions.

Do not duplicate external owner records wholesale.

## 27.4 LOD Invariants

LOD cannot:

- create resources;
- restore depleted source;
- create a worker;
- assign a job;
- pay wages;
- refill a merchant;
- create a sale;
- finish a contract;
- teach skill XP;
- grant knowledge;
- erase Fatigue;
- make an inaccessible route accessible.

## 27.5 Multiplayer

Host/server authority commits:

- public ConstructionProjects;
- source bindings;
- resource extraction transactions;
- production transformations;
- public service activation;
- authoritative inventories.

Set 27 owns authoritative economy.

Document 07 owns workers/jobs.

Sets 28–30 own social/knowledge, biology and movement.

Clients may predict presentation only.

# 28. Balancing, Diagnostics and Anti-Exploit Rules

## 28.1 Balance Principles

- Low-tech workshops remain useful after advanced industry appears.
- Higher throughput requires proportional source, staff, tools, logistics, safety and maintenance.
- Automation complements rather than invalidates manual artisan play.
- Trade provides alternatives to local production without becoming free teleportation of goods.
- Education creates optional resilience/succession rather than a mandatory extra need bar.
- Specialist scarcity should have multiple recovery routes.
- Dangerous work matters without requiring constant manual shift management.
- Economic profitability does not automatically equal settlement Work coverage.

## 28.2 Anti-Exploit Rules

- Decorative resource props do not generate resources.
- Rebinding one resource source to multiple facilities cannot duplicate extraction.
- Decorative machines/stations do not create output.
- Duplicate work markers do not multiply capacity beyond valid physical positions.
- A building cannot create market stock or price.
- One Item cannot be sold simultaneously through multiple conflicting reservations.
- A school cannot grant XP/knowledge without a valid learning event and owner acceptance.
- A guild hall cannot manufacture a guild/faction or relationship state.
- Distant simulation cannot create free resources, money, knowledge or training.
- Player blueprints cannot create new resource providers or hidden buffers.
- Construction follows canonical Block/Item identity.

## 28.3 v1.0 Diagnostic Families

Add or retain reason-coded diagnostics for:

- source binding;
- input/output route;
- hazard clearance;
- worker/station compatibility;
- external employment agreement;
- market/economic state;
- contract state;
- knowledge/progression owner handoff;
- biological work capacity;
- movement access;
- canonical Block/Item identity;
- POC leakage.

Recommended additional codes:

| Code | Severity | Meaning |
|---|---|---|
| `20B-WORKER-OWNER-VIOLATION` | Fatal | 20B attempted to own/replace Document-07 worker/job state. |
| `20B-ECON-OWNER-VIOLATION` | Fatal | 20B attempted to own price/wage/market/contract state belonging to Set 27. |
| `20B-KNOWLEDGE-OWNER-VIOLATION` | Fatal | 20B attempted to directly set Set-28C individual knowledge/belief state. |
| `20B-PROGRESSION-OWNER-VIOLATION` | Fatal | Training facility attempted to award progression outside Document 02. |
| `20B-BIOLOGY-OWNER-VIOLATION` | Fatal | Workplace logic attempted to directly change Stamina/Fatigue/Health. |
| `20B-RESOURCE-SOURCE-INVALID` | Error | Extraction facility lacks a valid authoritative source binding. |
| `20B-MOVE-ACCESS-STALE` | Warning/Error | Required movement/access evidence is stale or invalid. |
| `20B-BLOCKITEM-DUPLICATE` | Fatal | Construction/source references a duplicate fake Item for a recoverable Block. |
| `20B-POC-LEAK` | Fatal | Active production depends on a retired POC identity. |

# 29. Godot + Summer Engine Implementation Direction

Document 18 v1.0 is the technical authority.

20B defines logical records/interfaces and does not invent exact repository paths.

## 29.1 Logical Definition / Record Types

Implementation may require equivalents of:

- `WorkFacilityProfile`
- `ResourceBindingProfile`
- `ExtractionServiceProfile`
- `ArtisanServiceProfile`
- `CommerceFacilityProfile`
- `EducationFacilityProfile`
- `ProfessionalServiceProfile`
- `WorkplacePositionProfile`
- `InstructionSessionRecord`
- `ResourceBindingRecord`
- `BuildingServiceRecord`

Exact class/resource names require repository mapping.

## 29.2 Public Service Boundaries

Logical service ownership:

- Building/Function service — 20B capacity/activation;
- Worker/job/task — Document 07;
- Recipes/transactions — Document 05;
- Resources/providers — Document 06/world/specialist;
- Automation — Document 08;
- Economy — Set 27;
- Social assignment — Set 28;
- Knowledge — Set 28C;
- Progression — Document 02;
- Biology — Set 29;
- Movement — Set 30/26;
- Structure — Document 12;
- Planning — Document 19;
- ConstructionProject — Document 20.

## 29.3 Event-Driven Evaluation

Re-evaluate affected service when revisions change:

- resource source;
- stock;
- station/tool;
- staff;
- route;
- hazard;
- utility;
- economic service;
- contract;
- curriculum/instructor;
- structure condition.

No settlement-wide per-frame market/work simulation is required.

## 29.4 SceneTree Boundary

Godot Nodes may represent:

- workers;
- tools;
- machines;
- stalls;
- customers;
- teachers;
- learners;
- mining/crafting visuals.

Persistent workplace/economic/knowledge/progression truth survives Node unload.

## 29.5 Summer Engine

Summer Engine may assist with:

- source audit;
- schemas;
- validators;
- migrations;
- tests;
- diagnostic tools.

All implementation follows Document-18/Set-25 bounded task and evidence contracts.

# 30. Open Questions for Later Balancing

- final worker-to-station throughput curves;
- resource-zone scale, depletion and regeneration pacing by resource type;
- NPC tool-durability/replacement frequency;
- wage and labour-market tuning under Set 27;
- business profitability and bankruptcy depth;
- quality-system breadth for ordinary versus specialist goods;
- market crowd/transaction abstraction thresholds;
- training-session duration and practice requirements;
- NPC skill succession depth;
- paid versus communal apprenticeship prevalence;
- guild/professional institutional depth;
- library/archive information classification and access rules;
- cross-realm trade and knowledge restrictions;
- Set-29 work-fatigue curves for heavy/hazardous occupations;
- Set-30 commute thresholds before workplace capacity becomes impractical;
- exact Set-25 Core Required/Core Conditional classification for the 24 20B definitions during 20H v1.0.

These questions do not reopen the ownership boundaries locked above.

# Appendix A — 20B Functional Definition Field Template

| Field Group | Required Fields |
|---|---|
| Identity | `catalogue_no`, `stable_id`, `display_name_key`, category, owner, definition version, aliases. |
| Lifecycle | Set-25 production status, legacy provenance, prerequisites, branch/upgrade links and world/profile gates. |
| Needs / Service | Primary/secondary need, service/capacity type, activation profile and planner-facing evidence. |
| Workplace | Position profiles, skill/capability requirements, tools, station refs, body/access requirements and hazards. |
| Resource Binding | Provider/source classes, binding profile, legal/environment conditions and authoritative source refs. |
| Production | Recipe capability refs, input/output endpoints, buffers, utilities, hazards and quality-context inputs. |
| Commerce | Physical stall/loading/inspection/meeting/professional service profiles; Set-27 refs rather than copied economic state. |
| Education | Instructor/learner positions, curriculum refs, practice stations, session evidence and progression/knowledge handoff refs. |
| Source | Blueprint source profile, material roles, stages, state/damage deltas and placement profile. |
| Construction | Stage requirements, Block/Item refs, labour, commissioning, repair/conversion/demolition continuity. |
| External Interfaces | 07 workers, 27 economy, 28 social/knowledge, 29 biology, 30 movement, 05 recipes, 06 resources, 08 automation. |
| Runtime | Service record, external refs, revisions, LOD and evidence links. |
| Production | Bake/test/migration state, lifecycle classification and evidence. |

# Appendix B — Production and Knowledge Chain Matrix

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
| Knowledge preservation | Books/records | Library / Archive | Access, research and history | Staff, catalogue, permissions, protection. |## Appendix B.1 v1.0 Chain Ownership

The table above describes **facility participation**, not ownership transfer.

- Resource truth stays with Documents 06/10/11 and specialist owners.
- Transformation stays with Document 05.
- Worker/task stays with Document 07.
- Trade stays with Set 27.
- Learning progression stays with Document 02.
- Individual knowledge stays with Set 28C.
- Movement stays with Set 30/26.

# Appendix C — Production Acceptance Checklist

- [ ] Lumber Camp binds to a real authoritative forestry/resource source.
- [ ] A workplace position does not create/replace a Document-07 worker/job record.
- [ ] Worker economic terms come from Set 27 rather than 20B.
- [ ] Heavy work consumes Set-29 biological capacity only through approved interfaces.
- [ ] Set-30/26 access is required where physical arrival matters.
- [ ] Extraction reduces/updates the authoritative source and creates exact real outputs.
- [ ] Artisan transformations use Document-05 recipes and exact transactions.
- [ ] Automation uses Document 08 rather than a duplicate 20B machine loop.
- [ ] Market buildings do not own price, market state or merchant stock.
- [ ] Trading Posts/Caravanserais consume Set-27 trade and Set-30/26 journey evidence.
- [ ] Schools/Trade Schools provide training opportunity but do not directly award player XP.
- [ ] Libraries/Archives provide information access but do not directly set individual knowledge.
- [ ] Project/inventory/output reservations preserve conservation.
- [ ] Save/load preserves source refs, workplace/service state and external record references.
- [ ] Near/distant simulation reconciles without resources, money, XP or knowledge duplication.
- [ ] Player sources cannot create resource sites, unsupported capacity or free goods.
- [ ] Canonical Block Inventory Projections replace fake block Items.
- [ ] Multiplayer host authority prevents duplicate extraction/production/trade completion.
- [ ] Retired POC identities are absent from normal production dependencies.

# Appendix D — Cross-System Dependency Matrix

| 20B Area | External Owners | Primary Exchange |
|---|---|---|
| Workplaces | 07, 27D, 28, 29, 30 | Positions/capacity ↔ worker/job, employment, willingness, biology and arrival. |
| Extraction | 06/10/11, 05, 07, 29, 30 | Resource binding ↔ authoritative source, extraction transaction, worker capacity and access. |
| Artisan production | 05, 07, 08, 27, 29, 30 | Station capacity ↔ recipes, worker/machine execution, economic context, biology and access. |
| Markets | 27B/27C/27D | Physical commerce capacity ↔ market, merchant, business and stock state. |
| Contracts/trade | 27E/27H, 30/26 | Physical service/loading ↔ obligations, shipments, economic route and actual travel. |
| Education | 02, 07, 28/28C, 29, 30 | Teaching capacity/session evidence ↔ progression, people, knowledge/social state, biology and access. |
| Professional/guild facilities | 13, 27, 28 | Venue/service capacity ↔ institution, economic and social state. |
| Projects | 19, 20, 12 | Proposal → ConstructionProject → StructureInstance/service activation. |
| Official source | 22I, 25, 18 | Blueprint source/version, semantics, lifecycle, bake/validation. |

# Appendix E — Validation and Diagnostic Code Catalogue

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

# Appendix F — v1.0 Ownership Quick Reference

```text
20B:
    workplace capacity
    extraction-facility binding/service
    artisan-workshop capacity
    commerce infrastructure
    education/training facility capacity
    professional-service venue capacity

Document 07:
    workers
    jobs
    schedules
    task selection
    local labour execution

Document 02:
    player skill XP
    perks
    mastery
    progression outcomes

Document 05:
    exact transformations
    recipe consumption/output

Document 06 / World:
    resource identity
    source/provider truth
    provenance / renewability

Document 08:
    machine/network execution
    fixed automation logistics

Set 27:
    wages
    employment agreements
    businesses
    market state
    merchant policy
    prices
    trade
    contracts
    finance

Set 28:
    social willingness
    delegation
    negotiation
    relationships

Set 28C:
    individual knowledge
    beliefs
    information provenance
    language competence

Set 29:
    Health
    Stamina
    Fatigue
    biological work capacity

Set 30 / Set 26:
    physical route access
    journey
    arrival
    caravan / specialist vessel movement

Document 19:
    settlement planner
    project proposal
    growth readiness

Document 20:
    service activation
    ConstructionProject

Document 12:
    persistent StructureInstance
```

---

# Supersession and Preservation Notes

## Preserved from v0.2

- all 24 protected 20B function IDs;
- real resource binding;
- work/service capacity;
- tools/skills/staffing requirements;
- artisan production spaces;
- commerce infrastructure;
- schools/trade schools/libraries;
- succession concept;
- semantic markers/zones/sockets;
- official/player blueprint compatibility;
- staged construction;
- upgrades/conversions;
- hazards/damage/repair;
- persistence/LOD/multiplayer principles.

## Reconciled in v1.0

- workers/jobs/tasks → Document 07;
- employment/wages/businesses/markets/prices/contracts/trade → Set 27;
- social assignment/willingness → Set 28;
- individual knowledge → Set 28C;
- player progression/training outcome → Document 02;
- Health/Stamina/Fatigue/work capacity → Set 29;
- movement/access/travel → Set 30/26;
- transformations → Document 05;
- automation → Document 08;
- planner → Document 19;
- ConstructionProject/function activation → Document 20;
- StructureInstance → Document 12;
- canonical Block/Item handling → FR-00-20-006;
- lifecycle → Set 25 / 20H v1.0.

## Archived

- Forest Hamlet as mandatory workplace chain;
- fixed lumber-camp/carpenter/watchtower progression;
- active POC/Legacy Alpha Provenance/Legacy Beta Provenance delivery scope;
- 20B ownership of market/prices/contracts;
- 20B ownership of learner progression/knowledge;
- 20B ownership of worker Stamina/Fatigue.

---

# Production Acceptance Criteria

Document 20B v1.0 is accepted when:

- [x] all 24 protected 20B stable IDs are retained;
- [x] Work remains one of the seven needs without creating Employment/Education/Trade bars;
- [x] workplace capacity and worker/job identity are separated;
- [x] employment economics is handed to Set 27;
- [x] market/trade/contracts/prices are handed to Set 27;
- [x] individual knowledge is handed to Set 28C;
- [x] player progression/training outcomes are handed to Document 02;
- [x] Stamina/Fatigue/work capacity is handed to Set 29;
- [x] movement/access is handed to Set 30/26;
- [x] extraction requires real authoritative resource source binding;
- [x] transformations remain Document-05-owned;
- [x] automation remains Document-08-owned;
- [x] planner ownership is handed to Document 19;
- [x] ConstructionProject/function activation remains Document-20-owned;
- [x] StructureInstance remains Document-12-owned;
- [x] canonical Block/Item identity is enforced;
- [x] LOD cannot fabricate resources, money, workers, XP or knowledge;
- [x] legacy POC/Legacy Alpha Provenance/Legacy Beta Provenance labels are provenance only;
- [x] Godot/Summer implementation consumes Document 18 v1.0.

---

# Completion Statement

**Document 20B v1.0 reconciles Leyforge's productive settlement infrastructure with the completed economy, social, biological, movement and progression ownership contracts.**

A mine can provide **extraction capacity** without spawning ore.

A workshop can provide **production capacity** without owning the recipe.

A workplace can provide **jobs** without creating a worker or wage.

A market hall can provide **commerce infrastructure** without setting prices.

A trading post can support **regional exchange** without teleporting a caravan.

A school can provide **training opportunity** without awarding skill XP.

A library can provide **knowledge access** without writing beliefs directly into a person's mind.

And every one of these systems can continue operating at distance without creating free resources, money, experience or knowledge.

**Next Document Set 20 reconciliation: 20C — Governance, Safety, Defence, Justice and Emergency Services.**
