# LEYFORGE

## 20A — Housing, Provisions, Health and Community

### Functional Registry, Household-Service Capacity, Food Security, Care Facilities, Community Infrastructure and Blueprint/Project Contracts

**Version 1.0 — Reconciled Production Companion Draft**  
**Date:** 8 August 2026  
**Production Status:** Active Document Set 20 v1.0 Reconciliation  
**Supersedes:** `20A_Fantasy_Voxel_Civilisation_Sandbox_Housing_Provisions_Health_and_Community_v0_2` for active production direction  
**Master Authority:** Document 20 v1.0  
**Settlement Planning / Growth:** Document 19 v1.0  
**Persistent Structure State:** Document 12 v1.0  
**Official Blueprint Source:** Document 22I Blueprint Forge  
**Canonical Blocks / Items / Recipes / Resources:** Documents 03–06 v1.0  
**People / Households / Jobs:** Document 07 v1.0  
**World / Ecology:** Documents 10–11 v1.0  
**Culture / Government / Law:** Document 13 v1.0  
**Events / Conflict:** Documents 15–16 v1.0  
**UI / Player Trust:** Document 17 v1.0  
**Godot + Summer Engine Technical Authority:** Document 18 v1.0  
**Economy / Markets / Contracts / Trade / Finance:** Set 27  
**Dialogue / Relationships / Trust / Consent / Social Assignment:** Set 28  
**Health / Stamina / Hunger / Hydration / Nutrition / Disease / Treatment / Biological Outcomes:** Set 29  
**Movement / Accessibility / Travel:** Set 30, with Set 26 specialist aquatic/vessel movement  
**Maritime Facilities / Fisheries / Port Services:** Set 26, especially 26J/26M  
**Production Governance / Registry / Lifecycle:** Set 25  
**Project Lead and Final Authority:** Ash

A production companion for the domestic and social-function side of Leyforge settlements. 20A defines **functional capacity and settlement-facing service contracts** for housing, food-production/support, reserves, livestock facilities, healthcare facilities, refuge, hospitality and community spaces while preserving strict ownership boundaries with the people, economy, social, biological, movement, ecology and maritime systems.

> **20A Functional Rule**
>
> **A 20A building supplies a physical/service opportunity. It does not manufacture the people, relationships, biological outcomes, market transactions or movement results that use that opportunity. Housing supplies valid accommodation capacity; Document 07 owns the household and residence record. A clinic supplies valid treatment capacity; Set 29 owns the patient and biological treatment result. A community hall supplies usable gathering/event capacity; Set 28/13 own social willingness, relationships and cultural interpretation.**

> **Housing / Household Separation Rule**
>
> **20A decides whether a dwelling place is physically and functionally suitable. Document 07 owns who belongs to which household and where a resident is operationally housed; Set 28 owns relationship, consent and willingness where social choice matters. A bed marker cannot create a household.**

> **Provisions / Biology Separation Rule**
>
> **20A owns settlement-facing food-production, preparation, preservation, distribution and reserve capacity. Items/Recipes own the food and transformations; Set 29 owns hunger, hydration, nutrition and biological consequences. A full granary improves provision security but does not directly edit Hunger or Health.**

> **Care / Biology Separation Rule**
>
> **20A owns healthcare-facility eligibility, staffed/equipped treatment slots, clean/dirty routes, recovery space, quarantine/refuge capacity and service availability. Set 29 owns injury, disease, toxin, Health, treatment eligibility and biological treatment outcome. A healer hut cannot heal by changing an NPC's Health record itself.**

> **Community / Social Separation Rule**
>
> **20A owns compatible public/community capacity, event space, hospitality positions and function activation. Set 28 owns Trust, Loyalty, social memory, dialogue, willingness and relationship consequence; Document 13 owns cultural/political meaning. A theatre does not passively add friendship or loyalty because it exists.**

> **Canonical Construction Rule**
>
> **20A projects reference canonical Blocks directly when the placed and recovered identity is the same Block. Construction inventory uses the generated Block Inventory Projection. Duplicate recoverable Block Items are prohibited under FR-00-20-006.**

> **POC Retirement Rule**
>
> **The Forest Hamlet domestic-service sequence remains Archived Validation only. The generic cottage, farm, kitchen, granary, healer, hall and related functions survive. Legacy POC/Legacy Alpha Provenance/Legacy Beta Provenance labels are provenance, not current production lifecycle authority.**

---

# Revision 1.0 Summary

Version 1.0 is a targeted production reconciliation of the strong 20A v0.2 design.

It preserves:

- the existing 28 owned catalogue definitions in the 1–30 range;
- the seven-needs model;
- suitable-housing contracts;
- food/reserve conservation;
- livestock-facility support;
- healer/clinic/quarantine facility design;
- culture-neutral community functions;
- semantic markers/zones/sockets;
- Blueprint Forge source contracts;
- staged construction;
- partial activation;
- damage/repair/restoration;
- LOD and multiplayer authority;
- the 20A detailed registry entries.

It changes or clarifies:

- **Document 19**, not 20A, owns settlement planner project selection, project pools and growth-readiness orchestration;
- **Document 20 v1.0** owns authoritative ConstructionProjects and service activation;
- **Document 12** owns the persistent StructureInstance and physical damage/history;
- **Document 07** owns household/person/job identity and operational residence assignment;
- **Set 28** owns social consent, Trust/relationships, social assignments and social outcomes;
- **Set 29** owns Health, hunger/hydration/nutrition, injury, disease, toxins and treatment outcome;
- **Set 30** owns mover-specific access/travel rather than 20A treating a route marker as proof of reachability;
- **Set 27** owns market/import/wage/contract truth;
- **Set 26** owns marine ecology, fish-population truth and specialist port/vessel services around Fishing Dock/Fishery;
- legacy delivery-scope labels become provenance pending the final 20H v1.0 lifecycle/catalogue audit;
- Godot/Summer implementation follows Document 18 v1.0 and no longer invents repository paths.

---

# Document Purpose

Document 20A is the detailed functional specification for **Housing, Provisions, Health-support facilities and Community infrastructure** inside the Document-20 universal building system.

It answers:

1. What makes a bed/dwelling count as settlement Housing?
2. What physical/service chain allows a settlement to produce, process, preserve, store and distribute Provisions?
3. What must a healthcare building physically provide before Set 29 can use it as a valid treatment environment?
4. What functional spaces support hospitality, gatherings, remembrance, culture and Morale without duplicating Set 28's social simulation?
5. What semantic markers, zones, sockets, construction stages, runtime records and validators must official or player-authored sources satisfy?

The design target remains **depth without daily micromanagement**.

Residents should normally manage:

- sleeping;
- ordinary meals;
- work attendance;
- routine animal care;
- routine treatment;
- ordinary community attendance

through their owning systems.

The player acts when:

- Housing becomes strained;
- food security fails;
- routes or utilities break;
- a disease/outbreak creates facility pressure;
- migration/disaster creates refuge demand;
- a culture wants a community function;
- a district needs better access;
- a building is damaged;
- an upgrade or player blueprint creates a meaningful choice.

---

# Design Sources and Dependencies

| Source | 20A Production Dependency |
|---|---|
| 03 v1.0 | Canonical Block identity, block states and Block Inventory Projections. |
| 04 v1.0 | Distinct food, medicine, tools, household goods, feed, containers and other genuine Item identities. |
| 05 v1.0 | Cooking, preserving, processing, treatment-supply and construction transformations/transactions. |
| 06 v1.0 | Resource providers, food/material capability, provenance and substitution. |
| 07 v1.0 | Persistent residents, households, residences, jobs, schedules, labour availability and migration. |
| 08 v1.0 | Farm/food automation, fixed logistics, storage-network integration and machine support. |
| 09 v1.0 | Magical preservation, cleansing, healing support, wards and ritual infrastructure. |
| 10 v1.0 | Livestock/wildlife ecology, taming/husbandry and creature population relationships. |
| 11 v1.0 | Soil, climate, hydrology, terrain, seasonal/environmental site context. |
| 12 v1.0 | Persistent StructureInstances, condition, damage, restoration and world deltas. |
| 13 v1.0 | Culture, household law, land, governance, faith/philosophy expression and public authority. |
| 15–16 v1.0 | Outbreak/disaster/raid/event evidence, combat damage and recovery pressure. |
| 17 v1.0 | Need/service view models, blocker explanations, knowledge/freshness and accessibility. |
| 18 v1.0 | Godot/Summer services, records, save/LOD, authority, validation and repository-honesty rule. |
| 19 v1.0 | Parcels, districts, settlement planning, project pools, growth readiness and player blueprint workflow. |
| 20 v1.0 | Master seven-needs, functional activation and ConstructionProject authority. |
| 20H v0.2 baseline pending 20H v1.0 reconciliation baseline | Protected stable IDs/catalogue numbers pending 20H v1.0 lifecycle and maritime audit. |
| 20B–20G | Work/trade, governance/safety, storage/utilities, magic/industry, complexes and pack expression. |
| 22I | Official Blueprint Forge source authoring. |
| Set 25 | Qualified IDs, lifecycle, pack governance, validation and Archived Validation policy. |
| Set 26 | Fishery/marine ecology, waterfront/port service and specialist vessel interfaces. |
| Set 27 | Food/medicine prices, import contracts, hospitality trade and finance. |
| Set 28 | Social willingness, relationships, community attendance interpretation, hospitality/social consequence. |
| Set 29 | Hunger, hydration, nutrition, Health, disease, injury, treatment and biological outcomes. |
| Set 30 | Physical movement, accessibility, travel time and arrival. |

---

# Static Table of Contents

1. Locked 20A Identity  
2. Scope Boundaries and Anti-Micromanagement Rules  
3. Source-of-Truth and Record Separation  
4. Seven-Needs Integration  
5. Shared Capacity, Coverage and Service Model  
6. Semantic Marker, Zone and Socket Contracts  
7. Housing, Households and Accommodation  
8. Provisions, Production, Processing and Reserves  
9. Livestock and Animal-Support Rules  
10. Health, Welfare and Emergency Care  
11. Community, Culture, Hospitality and Morale  
12. Settlement Planner Handoff  
13. Blueprint Forge Authoring and Official Source Validation  
14. Restricted Player-Creator Validation  
15. Construction Stages, Commissioning and Partial Activation  
16. Upgrade Inheritance, Conversion and Replacement  
17. Damage, Contamination, Occupation, Repair and Restoration  
18. Networks and Cross-System Service Dependencies  
19. Settlement-Stage Expectations  
20. Detailed Registry Summary  
21. Temporary and Residential Entries  
22. Farming, Food and Livestock Entries  
23. Health and Welfare Entries  
24. Community, Culture and Hospitality Entries  
25. Archived Validation Scope  
26. Simulation LOD, Persistence and Multiplayer Authority  
27. Balancing, Diagnostics and Anti-Exploit Rules  
28. Godot + Summer Engine Implementation Direction  
29. Open Questions for Later Balancing  
Appendices A–F

# 1. Locked 20A Identity

20A is the household, sustenance, care and community layer of the universal settlement registry. It makes population growth physical and inspectable: residents require suitable accommodation; food must be grown, gathered, processed, stored and distributed; animals require real space and supply; injuries and crises require functioning care; and communities require usable places for assembly, hospitality, memory and culture.

> **Locked Rule**
>
> A 20A definition must expose a measurable household capacity, resource-conserving production or reserve role, treatment or welfare service, creature-support function, event capacity or persistent settlement consequence. Pure decoration remains a source-blueprint component or pack variation.

| **Identity Layer** | **Design Meaning** | **Player-Facing Result** |
|---|---|---|
| Household Foundation | Valid beds, household anchors, climate protection, access, permissions and condition create suitable housing. | Population growth depends on actual homes rather than an abstract population cap. |
| Sustenance Chain | Production, processing, storage and service use real inputs, workers, routes and outputs. | Food shortages can be solved through farming, trade, automation, policy or player delivery. |
| Care and Recovery | Healers, clinics and emergency facilities consume supplies and provide bounded treatment or refuge. | Raids, disease and disasters create understandable consequences and recovery choices. |
| Community Identity | Halls, inns, festivals, memorials and cultural venues provide active social and event capacity. | Morale responds to access, compatibility and recent use rather than passive building count. |
| Forge-Authored Source | Official layouts are editable voxel sources with semantic data, stage graphs and state deltas. | Buildings can vary visually while retaining reliable NPC, service and save behaviour. |
| Player Expression | Restricted player designs may satisfy existing contracts after validation. | Players can create distinctive settlements without bypassing simulation or registry rules. |
| Scalable Simulation | Detailed local behaviour and distant summaries preserve the same authoritative identities and resources. | Large settlements remain feasible without fabricating or deleting important state. |

# 2. Scope Boundaries and Anti-Micromanagement Rules

| **Included** | **Handled as a sub-calculation or linked system** | **Not a routine top-level need or player chore** |
|---|---|---|
| Homes, beds, households, food production, cooking, reserves, livestock support, care, refuge, hospitality, culture and public gatherings. | Privacy, variety, climate comfort, sanitation, clothing basics, guest beds, mourning, festivals, animal welfare, service queues and seasonal reserves. | Separate privacy, entertainment, hygiene, nutrition, religion, tourism, water, animal-welfare or medical-supply need bars. |
| Real item production and consumption at conserved settlement totals. | Nearby visible interactions, batched household transactions, recipe cycles and distant summaries. | Moving every meal, assigning every bed daily or issuing every care action manually. |
| Functional source and runtime contracts. | Exact art, layout and pack expression through Blueprint Forge and 20G. | One fixed developer floor plan for each function or free capacity from visual volume. |

- The seven main needs remain the only top-level settlement needs.
- Water and sanitation are critical dependencies owned by 20D, not new 20A needs.
- Ordinary household assignment, meals, animal care and routine treatment are NPC-managed.
- The player may inspect deeply, set policies, approve designs and respond to meaningful shortages or crises.
- Exact resource costs compile from resolved source-blueprint stages rather than being universal fixed numbers.
- A structure can be visually complete but functionally dormant when staffing, stock, access, utilities, permission or commissioning fails.
- Guest lodging, worker shelters, recovery beds and quarantine beds do not automatically count as permanent household capacity.
- Community structures provide opportunities and active events; they do not demand constant player-supplied entertainment.
- Culture and realm differences resolve through packs and validated functional replacements rather than duplicated universal definitions.
- Distant simulation may batch interactions but must preserve ownership, named residents, important stock, patients, project state and history.

> **Explicit Non-Goals**
>
> 20A does not require nutrition macros, individual thirst, toilet schedules, room-beauty scoring, manual meal distribution, detailed hospital administration, daily festival management, unlimited passive morale bonuses or continuous distant pathfinding.

# 3. Source-of-Truth and Record Separation

## 3.1 Record Chain

```text
20A Universal Definition
        -> Blueprint Forge Editable Source
        -> Validated Construction Stage Graph
        -> Deterministic Runtime Bake Products
        -> Construction Project Instance
        -> Persistent Structure Instance
        -> Household / Production / Service Runtime Records
```

## 3.2 Responsibility Boundaries

| Layer | Authority | 20A Relationship |
|---|---|---|
| Universal function | Document 20 / 20A detailed owner | Stable function identity, seven-needs mapping, capacity/activation contract and 20A semantic requirements. |
| Official source blueprint | 22I Blueprint Forge | Voxel composition, modules, semantic layers, material roles, stages, dynamic-state source and source dependencies. |
| Player-authored source | Document 19 | Restricted compatible player product; cannot create new universal functions. |
| Construction project | Document 20 | Site, source revision, reservations, work/stages, blockers, commissioning and project history. |
| Persistent physical structure | Document 12 | StructureInstance, placed-world identity, physical condition, damage/restoration and world deltas. |
| People/households/jobs | Document 07 | Resident identity, household identity, residence/job operational records and labour availability. |
| Social state | Set 28 | Trust/relationships, willingness, social assignments, dialogue and social outcome. |
| Biological state | Set 29 | Hunger/hydration/nutrition, Health, injury, disease, toxin, treatment and biological outcome. |
| Economy | Set 27 | Prices, purchases, wages, hospitality trade, contracts, imports and finance. |
| Movement | Set 30 / Set 26 specialist | Mover-specific reachability, route/travel and arrival. |
| Pack/culture resolution | 20G + 13 + Set 25 | Cultural/biome/realm expression and governed content-pack resolution. |
| Runtime presentation/bake | 22K/18/17 | Derived runtime products and player-facing view models; not gameplay ownership. |

## 3.3## 3.3 Non-Duplication Rules

- The universal definition never stores a complete voxel layout.
- The source blueprint never owns the final settlement need calculation.
- The construction project references, but does not become, the source blueprint.
- The runtime instance keeps stable identity even when its source is revised, migrated, repaired or visually re-resolved.
- A player design receives a unique `blueprint.*` ID but normally validates against an existing `building.*` definition.
- Pack variants do not create new universal definitions unless their function genuinely differs.
- Runtime bake products are derived and may be regenerated; editable source and persistent state are never replaced by the bake.

# 4. Seven-Needs Integration

| **Need** | **20A Authority or Contribution** | **Important Drill-Down Causes** | **Not a Separate Main Need** |
|---|---|---|---|
| Housing | Primary building-function authority for permanent and temporary accommodation capacity; Document 07 owns residents/households. | Suitable beds, household compatibility, climate, access, condition, spare capacity, displacement and overcrowding. | Privacy, guest rooms, furnishing, heating or density. |
| Provisions | Primary building/service authority for food production, processing, distribution and protected reserve behaviour; Set 29 owns nutrition biology. | Net flow, reserve days, water/fuel, preservation, variety, season, route and contamination. | Food, water, fuel, clothing and winter stock as separate bars. |
| Health | Primary building/service authority for treatment-space, care capacity, recovery-space and emergency-welfare facilities; Set 29 owns treatment/biological outcomes. | Patients, severity, staff, beds, medicine, clean routes, water, sanitation and outbreak load. | Medicine, hygiene, sanitation and corruption care as separate bars. |
| Work | Secondary contribution through farming, cooking, milling, care, hospitality and culture jobs. | Staff, skills, tools, workplace safety, inputs, outputs and travel. | Employment or specialist count as a separate need. |
| Safety | Secondary contribution through shelter, safe food, refuge, evacuation and care. | Fire, collapse, contamination, weather, emergency access and household protection. | Fire safety, refuge or quarantine as separate needs. |
| Infrastructure | Strong dependency on storage, roads, water, sanitation, power, mana and district services. | Route access, utility capacity, service coverage, loading, maintenance and network failure. | Roads, water, sanitation and power as separate needs. |
| Morale | Primary building/service authority for community/event capacity and Morale-facing opportunities; Set 28/13 own social/cultural interpretation. | Compatibility, access, events, hospitality, mourning, memories, recent history and exclusion. | Fun, beauty, spirituality, socialising or tourism as separate needs. |

# 5. Shared Capacity, Coverage and Service Model

The normal settlement view uses readable status bands. Detailed views expose causes, capacity and trends without forcing the player to interpret raw simulation values.

## 5.1 Status Bands

- **Thriving** - capacity, resilience and recent outcomes comfortably exceed current demand.
- **Stable** - demand is met with a reasonable reserve or recovery margin.
- **Strained** - service functions but has a clear shortage, travel, staffing, condition or seasonal risk.
- **Critical** - current demand is not being met or failure is imminent.
- **Collapsed** - no safe or valid service remains for the affected population or area.

## 5.2 Shared Calculations

| **Model** | **Calculation Direction** | **Player-Facing Example** |
|---|---|---|
| Suitable housing | Valid permanent household capacity adjusted by occupant compatibility, climate, access, permissions, damage and utilities. | Housing: Strained - 42 residents / 38 suitable places. |
| Provision security | Current conserved stock and net flow, usable reserve days, source diversity, preservation, route reliability and season. | Provisions: Stable - 11 days food; water secure; winter fuel low. |
| Treatment coverage | Staffed and supplied treatment/recovery capacity compared with current patients, travel, sanitation and severity. | Health: Critical - 7 patients; 3 treatment slots; medicine low. |
| Community coverage | Accessible compatible gathering/event capacity and recent use, not passive structure count. | Morale: Improving - harvest feast completed; east quarter lacks access. |
| Livestock support | Suitable animal space, feed, water, route and care compared with assigned animals. | Stable: 6 mounts / 8 suitable places; feed reserve 5 days. |
| Facility service | Minimum required markers, routes, staff, stock, utilities, permissions and safe condition. | Kitchen paused - water unavailable. |

## 5.3 Default Provision Reserve Bands

| **Settlement Stage** | **Draft Reserve Target** | **Purpose** |
|---|---|---|
| Camp | 1-2 days | Immediate weather and travel interruption. |
| Hamlet | 3-5 days | Short production or delivery gaps. |
| Village | 7-10 days | Seasonal planning and minor threat resilience. |
| Fortified Village | 10-14 days | Raid or isolation resilience. |
| Town | 14-21 days | Denser population and trade disruption. |
| City | 21-30 days | District resilience and larger emergencies. |
| Capital | 30-45 days | Regional, political and military obligations. |
| Magical Metropolis | 45-60 days or equivalent secured supply | Realm logistics, magical risk and very large populations. |

Targets are balance drafts and scale with difficulty, seasons, trade, culture, preservation, automation and world settings. They are not manual stocking quotas for each household.

## 5.4 Capacity Trust Rules

- Visual size never grants capacity by itself.
- Duplicate markers beyond supported limits are ignored or rejected.
- One physical capacity cannot be counted by two incompatible services at the same time.
- Mixed-use structures divide shared routes, utilities and storage explicitly.
- A facility may be partially functional when one service region remains valid.
- Coverage uses route-aware access and capacity, not only circular radius.
- Distant summaries use the same conserved authoritative totals as local simulation.## 5.5 Capacity Is Not Outcome

20A service capacity is an input to other systems.

Examples:

- `SuitableHousingCapacity` does not assign a household by itself.
- `ProvisionAvailability` does not directly restore Hunger/Hydration/Nutrition.
- `TreatmentCapacity` does not directly change Health or remove disease.
- `CommunityCapacity` does not directly add Trust, Loyalty or Friendship.
- `FisheryCapacity` does not create fish populations or catch from an empty ecology source.

Where an external owner consumes a 20A capacity, the resulting state change is committed by that owner and returned as evidence/snapshot.

# 6. 20A Semantic Marker, Zone and Socket Contracts

20A uses the shared Document 20 registries and adds profile-specific interpretations. Exact IDs are registry data rather than strings embedded directly in gameplay scripts.

## 6.1 Marker Families

```text
marker.entrance.public
marker.entrance.private
marker.entrance.service
marker.entrance.emergency
marker.household.anchor
marker.household.bed.temporary
marker.household.bed.permanent
marker.household.bed.guest
marker.household.storage.personal
marker.household.cooking
marker.social.gathering
marker.social.focal
marker.social.speaker
marker.social.performer
marker.job.primary
marker.job.support
marker.job.maintenance
marker.interaction.cook
marker.interaction.treatment
marker.interaction.wash
marker.storage.input
marker.storage.output
marker.storage.reserve
marker.storage.medicine
marker.creature.occupancy
marker.creature.feed
marker.creature.water
marker.delivery.service
marker.repair.access
marker.construction.builder
marker.construction.inspection
```

## 6.2 Zone Families

```text
zone.room.habitable
zone.room.recovery
zone.room.treatment
zone.room.guest
zone.public.gathering
zone.private.household
zone.work.clean
zone.work.dirty
zone.work.hot
zone.work.animal
zone.storage.food
zone.storage.medicine
zone.storage.secure
zone.hazard.fire
zone.hazard.contamination
zone.refuge.general
zone.refuge.quarantine
zone.navigation.public
zone.navigation.private
zone.navigation.service
zone.navigation.emergency
```

## 6.3 Socket Families

```text
socket.route.footpath
socket.route.service
socket.route.cart
socket.route.emergency
socket.storage.public_input
socket.storage.output
socket.storage.project_reserve
socket.fluid.water
socket.fluid.wastewater
socket.thermal_power.heat
socket.mechanical_power.input
socket.electrical_power.input
socket.mana.input
socket.module.room
socket.module.farm
socket.module.animal_enclosure
socket.upgrade.extension
```

## 6.4 Contract Rules

- Permanent beds require a valid habitable zone and compatible access.
- Treatment and quarantine markers never count as permanent household beds.
- Food service requires real input and output authority even when the visual station is part of a larger module.
- Clean and dirty routes may cross only where a profile explicitly allows and validates the transition.
- Creature markers declare body-size, movement and interaction envelopes compatible with Entity Forge profiles.
- A public community source must expose safe gathering and egress capacity rather than relying only on floor area.
- Network sockets declare direction, capacity, ownership and allowed service classes.
- All markers and modules use stable internal element IDs so source revisions can migrate persistent references.

# 7. Housing, Households and Accommodation

20A owns **dwelling suitability and accommodation capacity**.

Document 07 owns:

- the resident;
- the household;
- the operational residence record;
- bed/home assignment bookkeeping;
- migration and displacement execution.

Set 28 owns social willingness/relationship constraints where assignment is not purely administrative.

Set 29 consumes shelter/environment facts for biological outcomes.

## 7.1 Suitable Housing Contract

A permanent housing place can be credited only when:

1. A compatible permanent bed or approved household place exists.
2. It belongs to a valid habitable room or dwelling unit.
3. The intended occupant can physically access the entrance and internal route through Set-30 movement/accessibility rules.
4. The shell meets the active climate/weather protection profile.
5. Fire, collapse, contamination and hostile-occupation checks pass.
6. Required heat, light, water or other stage-aware support is available.
7. Ownership/legal permission is valid.
8. The place is not reserved for an incompatible occupant or service.
9. Any required accessibility/body-envelope constraints pass.
10. The StructureInstance and service evidence revisions are current enough for assignment.

The result is a **housing-suitability/capacity fact**.

Document 07 then decides how actual residence assignments are represented operationally.

## 7.2 Household Identity

A household is not a building record.

Household identity can persist through:

- moving house;
- disaster;
- occupation;
- renovation;
- settlement migration;
- blueprint replacement;
- temporary refuge.

Document 07 owns household membership and residence history.

Document 12 owns the physical structure.

20A exposes the valid dwelling units/places available inside that structure.

## 7.3 Accommodation Types

| Type | Counts Toward Permanent Housing | Typical Use |
|---|---:|---|
| Temporary sleep place | No, except explicit emergency policy | Tent, expedition bedroll, construction camp. |
| Permanent household place | Yes | Hut, cottage, farmhouse, longhouse unit, townhouse, apartment. |
| Guest lodging | No | Inn guest room, visitor/diplomatic accommodation. |
| Worker accommodation | Conditional | Seasonal workforce, megaproject camp, guild lodging. |
| Recovery bed | No | Healer/clinic care. |
| Refuge bed | Temporary emergency capacity | Disaster, raid, displacement. |
| Quarantine bed | No | Isolation/treatment. |
| Guard/duty bunk | Normally no civilian housing | Barracks/duty post owned under 20C. |

## 7.4 Overcrowding and Displacement

Overcrowding is a strain state, not an instant deletion of residence.

It can contribute external evidence for:

- reduced sleep/rest opportunity;
- disease/transmission risk;
- fire/evacuation risk;
- social/privacy friction;
- Morale pressure.

The biological or social consequences belong to Set 29/28.

Damage may invalidate:

- one bed;
- one room;
- one unit;
- one entrance;
- one utility dependency

without disabling the entire building where semantic data permits partial validity.

## 7.5 Mixed-Use Housing

Farmhouses, shop-houses and similar mixed-use structures must separate incompatible:

- public/private access;
- delivery;
- hazardous work;
- household circulation;
- noise/heat/contamination

according to their profiles.

Housing capacity remains independently traceable from attached workplace/service capacity.

## 7.6 Shelter Evidence to Set 29

20A may expose a shelter snapshot containing:

- structure/dwelling ref;
- protection profile;
- temperature/weather buffering capability;
- wetness protection;
- crowding band;
- fire/contamination state;
- sleeping-place validity;
- current access state;
- source revisions.

Set 29 interprets those facts into biological consequences.

# 8. Provisions, Production, Processing and Reserves

**Provisions** is the settlement-facing security of food and related essential supply chains.

It is not the Set-29 biological nutrition system and it is not the Set-27 market system.

20A owns:

- food-production facility capacity;
- preparation/processing facility capacity;
- preservation facility capacity;
- settlement service/distribution capacity;
- reserve-storage relationships at the functional-building layer;
- reserve-coverage presentation derived from real stock/flow evidence.

Documents 04–06 and 08 own the real goods/recipes/logistics.

Set 27 owns purchase/import/market/contract/price truth.

Set 29 owns consumption biology.

## 8.1 Provision Chain

```text
Ecological / Farm / Trade Source
    → Harvest / Catch / Animal Output
    → Authoritative Inventory / Storage
    → Processing / Cooking / Preservation
    → Household / Institution / Hospitality Distribution
    → Authoritative Consumption
    → Set-29 Biological Update
    → Waste / By-product / Reserve Update
```

Every arrow represents a real owner transaction or evidence handoff.

## 8.2 Production Rules

- Farms bind to valid terrain, soil, climate, water and crop profiles.
- Fisheries bind to real water and Set-26/Document-10 ecology.
- Livestock output requires real animals/herd records, feed/water/care and valid harvest/production rules.
- Document 05 owns exact recipe transformations.
- 20A buildings own stations, space, safe service capacity and compatible endpoints.
- Set 27 may source missing inputs through trade/contracts, but 20A does not invent a price.
- Distant simulation may batch transactions but cannot fabricate net stock.

## 8.3 Reserve and Reservation Rules

Food/essential stock can be:

- available;
- household-held;
- workplace-held;
- project-reserved;
- trade-bound;
- emergency-reserved;
- quarantined/contaminated;
- inaccessible.

A granary changes:

- protected capacity;
- storage suitability;
- reserve organisation;
- spoilage/exposure risk;
- emergency access

but does not create food.

## 8.4 Food Variety and Resilience

Variety may affect:

- cultural compatibility;
- resilience to source failure;
- menu/service options;
- Set-29 nutritional diversity where its biological model uses it;
- Morale/social experience where Set 28/20 service rules use it.

20A does not create a separate Variety need bar.

## 8.5 Household and Public Distribution

Residents may obtain meals through:

- household cooking;
- communal kitchen;
- bakery/food workshop;
- inn/tavern;
- institutional meal service;
- market purchase;
- emergency rationing;
- cultural equivalents.

The owning people/economy/social systems choose and authorise behaviour.

20A exposes whether the physical service is available and what capacity/stock endpoints it has.

## 8.6 Provision Summary to Other Systems

A settlement-facing provision snapshot may expose:

- accessible food stock by broad suitability class;
- current service throughput;
- reserve days/band;
- source diversity;
- seasonal risk;
- preservation state;
- route failures;
- contamination;
- import dependency;
- confidence/freshness.

Set 29 consumes appropriate food availability/demand through its canonical interfaces rather than 20A editing Hunger/Nutrition.

# 9. Livestock and Animal-Support Rules

20A owns facility-facing support for livestock, mounts and work animals.

Document 10 owns:

- creature family/ecology;
- taming/husbandry eligibility;
- breeding ecology;
- herd/population identity;
- creature-resource relationships.

Set 29 owns biological state where applicable.

Set 30 owns physical movement.

## 9.1 Facility Requirements

A stable, barn, paddock or related source can declare:

- supported creature envelopes;
- occupancy positions;
- enclosure profile;
- feed/water endpoints;
- shelter;
- handler/work positions;
- loading/route connections;
- quarantine/separation capability.

## 9.2 No Floor-Area Capacity Exploit

Animal capacity derives from:

- valid occupancy;
- enclosure;
- route;
- body envelope;
- welfare/shelter profile;
- feed/water service

not visible empty floor area.

## 9.3 Breaches and Failure

Damage can create:

- enclosure breach;
- blocked feed;
- unsafe access;
- loss of shelter;
- contamination;
- escape opportunity.

Document 10/29/30 resolve creature/ecological/biological/movement consequences.

## 9.4 Distant Simulation

Distant facilities preserve:

- important named animals;
- bounded herd/cohort refs;
- feed/water service;
- occupancy;
- facility condition;
- production/harvest transactions.

They do not pathfind every animal at distance.

# 10. Health, Welfare and Emergency Care

20A defines **healthcare facility capability**.

Set 29 remains the biological authority.

That separation is mandatory.

## 10.1 Care Layers

| Layer | 20A Facility Role | Set-29 Biological Role |
|---|---|---|
| Routine care | Treatment space, staff slots, medicine storage, clean access, recovery beds. | Injury/disease state, treatment eligibility, treatment application and recovery. |
| Prevention | Safe facility environment, sanitation/water dependency, isolation capability. | Exposure, infection, disease/toxin/Health consequences. |
| Outbreak response | Quarantine/refuge capacity, clean/dirty routes, surge configuration. | Infection/exposure state, disease progression, treatment. |
| Emergency care | Triage space, emergency access, surge beds, supply endpoints. | Patient severity, Health/injury state and outcome. |
| Magical care | Valid mana/ritual/cleansing facility interfaces. | Biological consequence only after valid magic/treatment interface. |
| Permanent consequence | Facility records capacity and service history. | Death/disability/recovery biological truth remains Set 29, with other owners for social/history consequences. |

## 10.2 Patient Records

The patient is a persistent person/creature record, not a 20A record.

20A may own or project a **facility queue/service assignment record** containing:

- patient ref;
- requested treatment profile;
- facility ref;
- treatment-slot reservation;
- assigned staff role;
- medicine/equipment availability;
- clean-route status;
- start/interrupt/complete service evidence refs.

It does not own the patient's Health, disease or injury.

## 10.3 Treatment Flow

```text
Set 29 identifies biological treatment need
    → eligible care action/profile
    → 20A checks facility/service capacity
    → Document 07 / Set 28 provides eligible staff assignment/willingness
    → inventory/recipe owners provide medicine/equipment
    → Set 30 provides physical access/arrival
    → Set 29 validates and commits treatment
    → 20A updates facility occupancy/throughput
```

## 10.4 Clean and Dirty Separation

Care sources declare where required:

- clean route/zone;
- treatment zone;
- recovery zone;
- contaminated/dirty route;
- isolation;
- medicine/linen storage;
- waste handling;
- water/sanitation;
- emergency access.

Set 29 consumes those environmental facts when resolving exposure/treatment safety.

## 10.5 Emergency Welfare

Worker/refugee and quarantine/emergency shelters can provide temporary capacity during:

- migration;
- disaster;
- outbreak;
- raid;
- housing loss;
- large construction labour influx.

Keeping emergency shelter as permanent accommodation can expose housing, social and biological strain, but the consequences belong to their owners.

## 10.6 Population Health Interface

Set 29 may expose `PopulationHealthSummary`-style evidence including:

- health-pressure band;
- treatment backlog;
- food/medicine demand;
- workforce biological availability;
- urgent cases.

20A uses this to report facility pressure and functional deficits.

It does not recalculate population biology.

# 11. Community, Culture, Hospitality and Morale

20A defines **usable community/hospitality infrastructure**.

It does not own the full social simulation.

Morale remains one of the seven settlement needs, but its causes can include:

- housing/security;
- provision stability;
- health/recovery;
- social relationships;
- recent events;
- cultural compatibility;
- public gathering opportunity;
- grief/memorial needs;
- exclusion/conflict;
- hospitality and celebration.

## 11.1 Community Function Profiles

| Universal Function | Possible Expression |
|---|---|
| Assembly / identity | Shrine, ancestor hall, civic lodge, spirit grove, secular hall, clan house. |
| Hospitality | Tavern, feast lodge, tea house, caravanserai, bath inn, traveller sanctuary. |
| Celebration | Market green, ritual meadow, festival square, amphitheatre court, floating platform. |
| Mourning / memory | Cemetery, ancestor wall, cremation garden, spirit forest, memory archive. |
| Performance / culture | Theatre, saga hall, museum, music court, dream stage, lecture hall. |

20G/13 select culturally appropriate expression without turning ancestry into a fixed architectural stereotype.

## 11.2 Active Use Rule

A community structure contributes settlement-facing opportunity only when:

- physically safe;
- accessible;
- permitted;
- compatible with the current function/profile;
- available within capacity;
- actually scheduled/used where active use is required.

A permanently unused hall is not an infinite Morale generator.

## 11.3 Social Ownership

Set 28 owns:

- whether a person wants to attend;
- social relationship consequences;
- Trust/Loyalty;
- dialogue;
- social memory;
- companion/social assignment behaviour.

20A may expose:

- venue capacity;
- available event type;
- accessibility;
- current booking/use;
- visitor bed/service capacity.

## 11.4 Culture, Faith and Political Meaning

Document 13 owns:

- culture/faction identity;
- law;
- public authority;
- formal religion/philosophy/worldview context.

Document 09 owns actual magical ritual effects.

A Shrine/Community Hall can host different profiles without 20A asserting one belief system.

## 11.5 Hospitality and Visitors

Guest beds/public service positions can support:

- trade;
- migration;
- quests;
- diplomacy;
- travellers;
- festivals.

They do not become permanent household Housing capacity.

Set 27 owns commercial hospitality transactions.

Set 28 owns social interaction/willingness.

# 12. Settlement Planner Handoff

Document 19 v1.0 owns the settlement planner.

20A supplies **function-side facts**.

## 12.1 20A Planner Inputs

20A may expose:

- Housing capacity/deficit;
- Provisions reserve/security;
- food-processing bottlenecks;
- livestock-support deficit;
- treatment capacity/backlog;
- emergency/refuge capacity;
- community/hospitality coverage;
- damaged/offline services;
- functional upgrade/repair opportunities;
- site/function dependencies.

## 12.2 External Planner Inputs

Document 19 also consumes:

- people/household pressure — Document 07;
- economy/trade/import opportunity — Set 27;
- social/cultural willingness — Set 28/13;
- biological health/nutrition pressure — Set 29;
- route accessibility — Set 30/26;
- world/terrain/ecology — 10/11/26;
- materials/labour — 03–08/07;
- law/land — 13.

## 12.3 Planner Output

Document 19 produces a `SettlementProjectProposal`.

Document 20 then owns authoritative ConstructionProject intake.

20A does not:

- score the final settlement-wide project pool;
- reserve a parcel by itself;
- spend resources;
- assign/teleport workers;
- commission a structure outside Document-20 authority.

## 12.4 Required / Optional / Conditional Metadata

20A continues to define function metadata used by the planner.

This metadata does not mean one exact building must exist.

Approved equivalents can satisfy the capability.

# 13. Blueprint Forge Authoring and Official Source Validation

## 13.1 Required Source Layers

An official 20A source normally contains:

- Voxel composition and nested modules.
- Material roles and pack-resolution allowances.
- Stable internal element IDs.
- Room, public/private, work, storage, hazard and refuge zones as appropriate.
- Entrances, household, job, interaction, storage, creature, repair and construction markers.
- Route, storage, water, wastewater, energy, mana or module sockets where required.
- Construction stage graph and stage deltas.
- Operational, damage, contamination, occupation, repair and restoration deltas where required.
- Placement, terrain, climate and entity-envelope profiles.
- Icon/thumbnail capture view and readability checks.
- Validator profile, dependencies, lifecycle state and source version.

## 13.2 Validation Layers

| **Layer** | **Examples** |
|---|---|
| Schema | Required fields, valid stable IDs, version and dependency references. |
| Semantic | Beds belong to habitable zones; treatment markers belong to care zones; animal markers fit the enclosure. |
| Access | Entrances, internal routes, emergency exits and service paths fit expected entities. |
| Network | Water, waste, storage, delivery, power or mana sockets have valid type and direction. |
| Construction | Stage deltas are ordered, resource-conserving and leave safe partial states. |
| State | Damage, contamination and occupation deltas preserve source identity and declare affected functions. |
| Placement | Terrain, climate, water-edge, farm or district requirements pass. |
| Performance | Voxel count, modules, collision, navigation, state variants and bake products remain inside budgets. |
| Presentation | Silhouette, icon framing, interaction readability and accessibility checks pass. |

## 13.3 Source Lifecycle

```text
Draft
-> Voxel Blockout
-> Semantic Pass
-> Material Roles Resolved
-> Construction Staged
-> State Variants Complete
-> Forge Validated
-> Runtime Baked
-> Gameplay Integrated
-> Scenario Tested
-> Shippable
```

A source may enter early testing before all visual variants are complete, but it cannot claim a production gate whose required validators have not passed.

# 14. Restricted Player-Creator Validation

Document 19 exposes a constrained creator that can author compatible voxel sources using approved systems. It is not the developer Blueprint Forge.

## 14.1 Allowed Player Controls

- Voxel layout within permitted bounds.
- Approved material roles and unlocked material substitutions.
- Required and optional marker placement from the selected functional profile.
- Permitted room, route and hazard zones.
- Supported construction stages or automatically generated stages.
- Approved module, door, furniture, station and decoration placement.
- Settlement style, culture-compatible pack and personal blueprint metadata.

## 14.2 Restricted Controls

Players do not receive unrestricted access to:

- Universal definition IDs or registry replacement.
- Validator bypasses.
- Arbitrary scripts or executable content.
- Save migration aliases.
- Hidden developer markers or quest authority.
- Unbounded service capacity values.
- Unsafe network types or forbidden content without world/server permission.
- Project-wide dependency or package signing controls.

## 14.3 Validation Profiles

| **Profile** | **Blocking Checks** | **Flexible Elements** |
|---|---|---|
| Housing | Suitable bed type, habitable zone, reachable entrance, climate protection, household route, fire/collapse safety and required utilities. | Footprint, room arrangement, roof, openings, materials, decoration and culture style. |
| Farm | Cultivated region, work/tool access, crop/soil profile, water dependency, output and terrain/ecology rules. | Field shape, terraces, fences, sheds and palette. |
| Food processing | Required station, input/output, water/fuel/power, clean/hot zones, ventilation and worker/service route. | Interior arrangement, storefront, attached residence and visual equipment. |
| Health | Treatment/recovery markers, clean access, medicine storage, water/sanitation and evacuation appropriate to capacity. | Architectural style, garden, waiting area and culture-specific care spaces. |
| Community | Gathering capacity, safe access/egress, focal/event profile and culture-compatible function. | Religious or secular expression, landscape, seating and decoration. |

A draft may be saved while invalid. NPC planners and service calculations cannot use it until all blocking errors pass and the source reaches an allowed lifecycle state.

# 15. Construction Stages, Commissioning and Partial Activation

## 15.1 Shared Stage Vocabulary

```text
Planning
Site Preparation
Foundation
Structure
Enclosure
Functional Installation
Furnishing and Equipment
Commissioning
Complete
```

Each family may merge or specialise stages. A farm can use **Plot Preparation**, **Irrigation** and **Planting**. A tent may merge most structural stages. A clinic can add **Clean Utilities and Inspection**. A community hall can add **Dedication or Opening**.

## 15.2 Resource and Labour Rules

- Exact resources compile from resolved source elements and stage deltas.
- Reservations point to real authorised stock.
- Consumed resources remain recorded by project stage and contributor.
- Builders require valid construction markers, access and tools.
- Furnishings, stations and service items activate only when installed and commissioned.
- Cancelled or converted projects preserve completed work and release unconsumed reservations.

## 15.3 Partial Activation

| **Family** | **Earliest Safe Partial Function** |
|---|---|
| Tent or shelter | Weather cover plus reachable sleep markers. |
| Permanent housing | Weatherproof habitable zone, entrance and safe permanent beds. |
| Farm plot | Prepared cultivated region, crop/seed input and worker access. |
| Kitchen or workshop | Safe station, required input/output and active water/fuel/power. |
| Granary | Enclosed, protected storage with valid access and category markers. |
| Healer hut | Clean treatment position, staff, medicine and reachable recovery capacity. |
| Community hall | Safe gathering capacity, access/egress and active functional profile. |

## 15.4 Commissioning

Commissioning revalidates the resolved source in its actual site and state. It checks access, markers, utilities, inventories, staff, permissions and safety. A built shell that fails commissioning remains **Dormant**, **Paused** or **Unsafe** with exact reasons.## 15.5 Authoritative Construction Ownership

Document 20 v1.0 owns the ConstructionProject.

20A defines what a domestic/food/health/community function requires during commissioning.

The project consumes:

- canonical Block references/Block Inventory Projections;
- genuine Items/components;
- labour evidence from Document 07;
- economic contracts from Set 27 where applicable;
- social consent/assignment from Set 28 where applicable;
- worker biological availability from Set 29;
- physical arrival/access from Set 30;
- StructureInstance commits through Document 12.

# 16. Upgrade Inheritance, Conversion and Replacement

## 16.1 Upgrade Models

- In-place child blueprint inheriting the existing source.
- Attached room, service or farm module.
- Stage delta added to an existing structure.
- Internal conversion without full shell replacement.
- Parcel replacement that preserves household/service continuity.
- Functional branch with a different universal definition.

## 16.2 Examples

| **From** | **To or Branch** | **Preferred Representation** |
|---|---|---|
| Tent | Primitive Hut | New permanent source or replacement project; preserve occupants during transition. |
| Primitive Hut | Small Cottage | Inherited child source or staged replacement delta where footprint permits. |
| Farmhouse | Farmstead cluster | Attached modules and cluster plan rather than one giant definition. |
| Basic Farm Plot | Irrigated/Terraced Farm | Terrain and water stage delta or replacement plan. |
| Communal Kitchen | Larger food workshop | Attached processing/service module or new building where continuity demands. |
| Healer Hut | Clinic | Upgrade branch or replacement with temporary care continuity. |
| Community Hall | Culture-specific hall | Pack-resolved source or functional replacement under 20G. |

## 16.3 Continuity Rules

Residents, patients, animals, stock and active services require temporary capacity or a safe staged transfer before destructive upgrades. The project planner must show displacement, downtime, route and resource consequences before approval.

# 17. Damage, Contamination, Occupation, Repair and Restoration

## 17.1 Damage Groups

- Foundation and terrain support.
- Structure and enclosure.
- Roof/weather protection.
- Entrances and internal routes.
- Household rooms or units.
- Stations and equipment.
- Storage and reserves.
- Water, waste, heat, power or mana links.
- Animal enclosure.
- Public/event capacity.

Semantic data allows the runtime to disable affected capacity rather than using one binary intact/destroyed state.

## 17.2 Secondary States

```text
Vacant
Assigned
Overcrowded
Input Starved
Output Blocked
Contaminated
Overloaded
Unsafe
Contained
Breached
Occupied
Abandoned
Under Repair
Under Conversion
```

## 17.3 Repair and Restoration

- Repair projects consume real materials and labour.
- Temporary patches can restore limited service and create later maintenance debt.
- Contamination requires cleanup, disposal, medicine or magical cleansing as appropriate.
- Occupation can change access, household displacement, stock control and community use without changing origin identity.
- Restoration may preserve heritage, return original use, adapt the structure or maintain a ruin memorial.
- Source revision and runtime repair are separate: editing the source does not heal existing world damage.

# 18. Networks and Cross-System Service Dependencies

| Dependency | 20A Use | Authoritative Owner |
|---|---|---|
| Roads / paths / entrances | Resident, delivery, patient, guest, animal and emergency access requirement. | Physical infrastructure: Document 20/12; mover accessibility: Set 30. |
| Shared storage | Food, medicine, fuel, tools, emergency reserve and service buffers. | Storage function: 20D; actual stock/inventory owner. |
| Water | Cooking, care, washing, livestock, irrigation and facility support. | 20D + Set 26 fluid/water specialist where applicable; Set 29 owns biological hydration. |
| Sanitation / wastewater | Dense housing, food safety, care cleanliness and bathhouse function. | 20D/Set 29 exposure interface. |
| Power / heat | Mills, kitchens, preservation, dense housing, clinics and services. | 20D/20E/08 according to provider. |
| Mana / cleansing | Magical care, preservation, warded refuge, ritual/community support. | Document 09/20E. |
| Workplaces / production | Tools, clothes, containers, medicine, food production. | 20B + 05/08. |
| Markets / imports / hospitality commerce | Purchase/sale/import/procurement. | Set 27. |
| Social willingness / attendance | Community use, hospitality, assignments. | Set 28. |
| Biological need/outcome | Hunger/nutrition, injury, disease, treatment. | Set 29. |
| Physical travel | Who can actually reach/use facility. | Set 30 / Set 26 specialist. |
| Governance / law | Public/private rights, emergency authority, land use. | Document 13/20C. |
| District plan | Where service is desired and project candidate context. | Document 19/20F. |
| Culture / biome / realm expression | Architecture and functional replacements. | 20G/13/24. |
| Fisheries / marine ecology | Fish source/catch/ecology truth. | Document 10 + Set 26M. |
| Port / berth service | Waterfront operational interface. | Set 26J. |

## 18.1 Weakest-Link Rule

A service is limited by the weakest required link.

Examples:

- clinic + medicine + no clean water = constrained/offline;
- farm + good soil + no valid worker/access route = inaccessible;
- cottage + beds + unsafe roof = unsuitable;
- fishery + dock + depleted/closed fish source = no valid catch flow;
- tavern + room + no merchant/food/permission = limited hospitality service.

## 18.2 Resource Authority

20A never maintains hidden duplicate totals for:

- food;
- medicine;
- fuel;
- fish;
- livestock output;
- imported goods.

Authoritative goods remain in inventory/resource/transaction systems.

## 18.3 Revision / Freshness

Service activation can depend on external snapshots.

A stale route, patient-load or stock snapshot must not be presented as current certainty.

Document 17 displays freshness/unknown status where required.

# 19. Settlement-Stage Expectations

| **Stage** | **Minimum 20A Expectations** | **Typical Optional or Conditional Growth** |
|---|---|---|
| Camp | Campfire centre and temporary weather-protected sleep capacity. | Worker/refugee shelter, expedition provisions. |
| Hamlet | Permanent housing, local food production and shared cooking; water and basic storage supplied through 20D. | Farmhouse, barn, stable, fishery, longhouse. |
| Village | Protected reserve, basic healer access and at least one compatible community/assembly option. | Mill, bakery, inn, festival ground, cemetery, quarantine shelter. |
| Fortified Village | Reserve and emergency capacity suitable for isolation and raid risk. | Additional refuge, guarded reserve, field care and recovery events. |
| Town | Denser housing and stronger health/community services with mature utilities. | Townhouse/shop-house, clinic, preserving house, bathhouse, theatre. |
| City | Urban housing and distributed service networks; Hospital Complex is owned by 20F. | Apartments, district venues, specialised food chains and campuses. |
| Capital | Culture-defining institutions and resilient regional provisions and health services. | Grand halls, memorials, visitor districts and ceremonial food complexes. |
| Magical Metropolis | Realm-scale resilience and magical/vertical adaptation without replacing core needs. | Living towers, magical preservation, portal hospitality and floating community precincts. |

# 20. Detailed Registry Summary

| **No.** | **Stable ID** | **Definition** | **Earliest Stage** | **Primary Need** | **Planner Class** | **Legacy Scope Provenance** |
|---:|---|---|---|---|---|---|
| 1 | `building.temporary.campfire_site` | Campfire Site | Camp | Morale | Required | Legacy POC Core Provenance |
| 2 | `building.residential.small_tent` | Small Tent | Camp | Housing | Required | Legacy POC Core Provenance |
| 4 | `building.residential.worker_refugee_shelter` | Worker or Refugee Shelter | Camp | Housing | Conditional | Legacy Legacy Alpha Provenance Provenance |
| 5 | `building.residential.primitive_hut` | Primitive Hut | Hamlet | Housing | Required | Legacy Extended-Slice Provenance |
| 6 | `building.residential.small_cottage` | Small Cottage | Hamlet | Housing | Required | Legacy POC Core Provenance |
| 7 | `building.residential.farmhouse` | Farmhouse | Hamlet | Housing | Optional | Legacy Extended-Slice Provenance |
| 8 | `building.residential.communal_longhouse` | Communal Longhouse | Hamlet | Housing | Optional | Legacy Legacy Alpha Provenance Provenance |
| 9 | `building.residential.townhouse_shop_house` | Townhouse or Shop-House | Town | Housing | Optional | Legacy Legacy Beta Provenance Provenance |
| 10 | `building.residential.apartment_house` | Apartment House | City | Housing | Optional | Legacy Legacy Beta Provenance Provenance |
| 11 | `building.food.basic_farm_plot` | Basic Farm Plot | Hamlet | Provisions | Required | Legacy POC Core Provenance |
| 12 | `building.food.irrigated_terraced_farm` | Irrigated or Terraced Farm | Village | Provisions | Optional | Legacy Legacy Alpha Provenance Provenance |
| 13 | `building.food.barn` | Barn | Hamlet | Provisions | Optional | Legacy Extended-Slice Provenance |
| 14 | `building.food.granary` | Granary | Village | Provisions | Required | Legacy Extended-Slice Provenance |
| 15 | `building.food.communal_kitchen` | Communal Kitchen | Hamlet | Provisions | Required | Legacy POC Core Provenance |
| 16 | `building.food.grain_millhouse` | Grain Millhouse | Village | Provisions | Optional | Legacy Legacy Alpha Provenance Provenance |
| 17 | `building.food.bakery_food_workshop` | Bakery or Food Workshop | Village | Provisions | Optional | Legacy Legacy Alpha Provenance Provenance |
| 18 | `building.food.preserving_house` | Preserving House | Town | Provisions | Optional | Legacy Legacy Beta Provenance Provenance |
| 19 | `building.livestock.stable_paddock` | Stable and Paddock | Hamlet | Work | Optional | Legacy Legacy Alpha Provenance Provenance |
| 20 | `building.food.fishery_fishing_dock` | Fishery or Fishing Dock | Hamlet | Provisions | Conditional | Legacy Legacy Alpha Provenance Provenance |
| 21 | `building.health.healer_hut` | Healer Hut | Village | Health | Required | Legacy Extended-Slice Provenance |
| 22 | `building.health.clinic_infirmary` | Clinic or Infirmary | Town | Health | Optional | Legacy Legacy Beta Provenance Provenance |
| 24 | `building.welfare.quarantine_emergency_shelter` | Quarantine or Emergency Shelter | Village | Health | Conditional | Legacy Legacy Alpha Provenance Provenance |
| 25 | `building.community.small_shrine_hall` | Small Shrine or Community Hall | Village | Morale | Optional | Legacy Extended-Slice Provenance |
| 26 | `building.hospitality.tavern_inn` | Tavern or Inn | Village | Morale | Optional | Legacy Legacy Alpha Provenance Provenance |
| 27 | `building.community.bathhouse_laundry` | Bathhouse and Laundry | Town | Health | Optional | Legacy Legacy Beta Provenance Provenance |
| 28 | `building.community.festival_grounds` | Festival or Community Grounds | Village | Morale | Optional | Legacy Legacy Alpha Provenance Provenance |
| 29 | `building.community.memorial_cemetery` | Memorial and Cemetery | Village | Morale | Conditional | Legacy Legacy Alpha Provenance Provenance |
| 30 | `building.community.cultural_hall_theatre` | Cultural Hall or Theatre | Town | Morale | Optional | Legacy Legacy Beta Provenance Provenance |

Catalogue numbers **3** and **23** are intentionally absent from 20A ownership. Builder Supply Yard is owned by 20D; Hospital Complex is owned by 20F. Their services remain critical dependencies for construction staging and city-scale care.## 20.1 Production Lifecycle Note

The stable IDs and catalogue numbers in this table are protected.

The legacy scope-provenance column is **not** the Set-25 lifecycle classification.

20H v1.0 will assign/freeze current production classifications such as:

- Core Required;
- Core Conditional;
- Teaser Only;
- Later Expansion;
- Archived Validation

or the exact currently approved Set-25 equivalents.

No stable ID is deleted or renumbered merely because its old provenance was `POC`, `Legacy Alpha Provenance`, `Legacy Beta Provenance` or another milestone label.

# 21. Temporary and Residential Entries

### 1. Campfire Site

`building.temporary.campfire_site`

| **Catalogue role**                      | Temporary / Community \| Camp \| Micro \| Required \| Legacy POC Core Provenance                                                                                        |
|-----------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Morale \| Secondary: Provisions, Safety                                                                                                          |
| **Purpose**                             | Creates the first recognised settlement centre and a shared point for warmth, cooking, light, meetings and early identity.                                |
| **Capacity / service**                  | Supports a small camp gathering and one shared cooking/heating point; capacity scales with seating and cook attachments rather than creating housing.     |
| **Jobs and users**                      | No permanent job required; temporary cook, leader, guard or storyteller use points may be assigned.                                                       |
| **Inputs**                              | Fuel, raw or prepared food, optional kindling and weather cover.                                                                                          |
| **Outputs / services**                  | Cooked food batches, warmth, light, social gathering, early warning point and settlement-centre anchor.                                                   |
| **Required semantic contract**          | Fire/cook marker, safe standing ring, seating or gathering points, smoke clearance, settlement-centre anchor.                                             |
| **Blueprint Forge source profile**          | Voxel source, safe fire/hazard zone, cooking and heat interactions, gathering markers, fuel input, settlement-centre anchor, two-stage construction delta, and lit, unlit, wet and damaged visual states. |
| **Runtime products, persistence and LOD**   | Bake products include interaction points, fire hazard proxy, nav exclusion, light/heat service anchor and stage/state deltas. Persist fuel, current safety state, centre ownership and relevant event history. |
| **Placement and utilities**             | Outdoor, ventilated, reachable, clear of flammable blocks; optional shelter or windbreak; no utility network required.                                    |
| **Construction profile**                | 2 stages: cleared site and fire ring; activation with fuel. Decorative seating and shelter are later additions.                                           |
| **Upgrade, inheritance and branch links**            | Can anchor a temporary camp cluster, communal kitchen, village square, festival ground or ritual site; the campfire itself remains reusable.              |
| **Planner triggers and failure states** | Selected immediately when founding a camp or replacing a destroyed centre. Fails when flooded, smothered, out of fuel or unsafe from nearby fire hazards. |
| **Restricted player-creator validation**         | Must expose safe access, fire clearance, one cook position and one gathering zone. Decorative-only fires do not count.                                    |
| **Pack and style resolution**         | Stone rings, braziers, rune embers, communal hearths, spirit fires and portable fire pits are style variants.                                             |

### 2. Small Tent

`building.residential.small_tent`

| **Catalogue role**                      | Residential / Temporary \| Camp \| Small \| Required \| Legacy POC Core Provenance                                                                              |
|-----------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Housing \| Secondary: Safety                                                                                                             |
| **Purpose**                             | Provides the first weather-protected sleeping space without pretending to be permanent housing.                                                   |
| **Capacity / service**                  | Normally 1-2 residents or one compact household; harsh climates may reduce suitability without insulation or heat.                                |
| **Jobs and users**                      | Residents only; no workplace required.                                                                                                            |
| **Inputs**                              | Cloth or hide, poles, rope, bedding and optional ground mat or heating fuel.                                                                      |
| **Outputs / services**                  | Temporary suitable beds, weather cover and reduced exposure.                                                                                      |
| **Required semantic contract**          | Entrance, sleep spots, protected interior volume, optional storage point and heat-safe zone.                                                      |
| **Blueprint Forge source profile**          | Voxel source or approved parametric shelter module, protected interior zone, temporary sleep markers, entrance, weather-cover profile, bedding stage delta, compact entity-envelope test and collapsed/wet damage states. |
| **Runtime products, persistence and LOD**   | Bake products include protected-volume test, entrance and sleep anchors, simple collision/nav data and temporary-housing capacity. Persist occupant assignment, condition, suitability and source blueprint version. |
| **Placement and utilities**             | Requires reasonably dry ground, access and safe spacing from fires; terrain levelling should be minimal.                                          |
| **Construction profile**                | 3 stages: site/pegs; frame and cover; bedding/activation.                                                                                         |
| **Upgrade, inheritance and branch links**            | Worker/refugee shelter, primitive hut, expedition tent or culture-specific portable dwelling.                                                     |
| **Planner triggers and failure states** | Chosen during founding, migration, disaster or temporary labour surges. Becomes strained when overcrowded, damaged, wet or seasonally unsuitable. |
| **Restricted player-creator validation**         | Must contain valid sleep markers, weatherproof cover, reachable entrance and no exposed dangerous blocks.                                         |
| **Pack and style resolution**         | Canvas, hide, woven reed, nomadic felt, leaf canopy and magical membrane variants.                                                                |

### 4. Worker or Refugee Shelter

`building.residential.worker_refugee_shelter`

| **Catalogue role**                      | Residential / Welfare \| Camp \| Medium \| Conditional \| Legacy Legacy Alpha Provenance Provenance                                                                |
|-----------------------------------------|--------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Housing \| Secondary: Health, Morale                                                                                  |
| **Purpose**                             | Provides fast communal accommodation for builders, seasonal workers, refugees, evacuees or disaster survivors.                 |
| **Capacity / service**                  | Usually 4-12 temporary residents; privacy and household compatibility are lower than permanent homes.                          |
| **Jobs and users**                      | Optional steward, quartermaster, healer or guard; residents may be unassigned, temporary or emergency workers.                 |
| **Inputs**                              | Basic construction materials, bedding, lighting, fuel and periodic provisions.                                                 |
| **Outputs / services**                  | Emergency beds, protected gathering, triage or registration capacity and reduced homelessness pressure.                        |
| **Required semantic contract**          | Multiple beds, safe aisles, entrances, communal storage, optional treatment or registration point.                             |
| **Blueprint Forge source profile**          | Modular voxel source with repeatable bed bays, circulation and refuge zones, steward/triage options, rapid construction stages, temporary-service activation and dismantle/reuse deltas. |
| **Runtime products, persistence and LOD**   | Persist bed occupancy, temporary resident status, service mode, condition and dismantle eligibility. Distant simulation uses bed capacity and welfare-service totals without individual bed pathing. |
| **Placement and utilities**             | Near storage, work sites or safe civic areas; must not block future permanent parcels.                                         |
| **Construction profile**                | 3-4 rapid stages with reusable modules and minimal decoration.                                                                 |
| **Upgrade, inheritance and branch links**            | Dormitory, longhouse, apartment, quarantine shelter or dismantling/reuse once crisis ends.                                     |
| **Planner triggers and failure states** | Triggered by migration, disaster, labour recruitment or housing loss. Penalised if kept as long-term housing without upgrades. |
| **Restricted player-creator validation**         | Must meet minimum bed spacing, safe exits, access and climate protection. Decorative tents cannot claim shelter capacity.      |
| **Pack and style resolution**         | Barracks, bunkhouse, communal pavilion, refugee cabins and magical emergency ward variants.                                    |

### 5. Primitive Hut

`building.residential.primitive_hut`

| **Catalogue role**                      | Residential \| Hamlet \| Small \| Required \| Legacy Extended-Slice Provenance                                                               |
|-----------------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Housing \| Secondary: Safety                                                                                    |
| **Purpose**                             | Provides the first permanent, repairable home and proves the transition from camp to hamlet.                             |
| **Capacity / service**                  | Normally 1-3 residents; one household; basic storage and heat/light support.                                             |
| **Jobs and users**                      | Residents only, with optional micro work point such as mending or food preparation.                                      |
| **Inputs**                              | Foundation material, wall and roof tokens, door, bedding, light/heat and basic fittings.                                 |
| **Outputs / services**                  | Permanent suitable beds, household assignment and improved climate protection.                                           |
| **Required semantic contract**          | Door, household beds, protected room, heat/light point, private storage and reachable exterior path.                     |
| **Blueprint Forge source profile**          | Voxel dwelling source with habitable room zone, permanent household markers, heat/light and personal-storage positions, weatherproofing stage gate, roof/wall damage groups and repair deltas. |
| **Runtime products, persistence and LOD**   | Persist household assignment, suitable beds, heat/light support, condition and repair history. Damage can invalidate only affected beds or routes where semantic room data allows. |
| **Placement and utilities**             | Flat or minor-levelled parcel, road/path socket and safe drainage.                                                       |
| **Construction profile**                | 4 stages: foundation; shell; roof/door; bedding and activation.                                                          |
| **Upgrade, inheritance and branch links**            | Small cottage, farmhouse, woodland cabin or culture-specific house family.                                               |
| **Planner triggers and failure states** | Required when camp residents need permanent homes. Fails if roof, access, beds or climate protection are invalid.        |
| **Restricted player-creator validation**         | Must be enclosed enough for local weather, reachable, contain approved beds and avoid blocked exits or internal hazards. |
| **Pack and style resolution**         | Material palette, roof form, window style and plan may change; the functional household profile remains stable.          |

### 6. Small Cottage

`building.residential.small_cottage`

| **Catalogue role**                      | Residential \| Hamlet \| Small \| Required \| Legacy POC Core Provenance                                                                                     |
|-----------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Housing \| Secondary: Morale                                                                                                          |
| **Purpose**                             | Standard permanent household building and the main test case for player-designed housing blueprints.                                           |
| **Capacity / service**                  | Usually 2-5 residents; one household; better privacy, storage and resilience than a hut.                                                       |
| **Jobs and users**                      | Residents; optional home industry marker without replacing a dedicated workplace.                                                              |
| **Inputs**                              | Foundation, structural frame, walls, roof, windows/door, beds, heat/light and household fittings.                                              |
| **Outputs / services**                  | Suitable household beds, privacy, spare-capacity potential and positive morale when maintained.                                                |
| **Required semantic contract**          | Entrance, beds, household room, heat/light, storage, optional cooking or work point, road socket.                                              |
| **Blueprint Forge source profile**          | Primary restricted-creator reference source with full household contract, material roles, room and route semantics, construction stages, inspection data, upgrade sockets, damage/repair deltas and deterministic thumbnail capture. |
| **Runtime products, persistence and LOD**   | Persist source and resolved pack IDs, household, beds, permissions, storage links, construction history, damage groups and player authorship. This is the golden residential save/migration fixture. |
| **Placement and utilities**             | Residential parcel with safe access, drainage and required climate adaptation.                                                                 |
| **Construction profile**                | 5 stages: foundation; frame; shell; weatherproofing; furnishing/inspection.                                                                    |
| **Upgrade, inheritance and branch links**            | Farmhouse, townhouse/shop-house, larger cottage, assisted housing or culture-specific branch.                                                  |
| **Planner triggers and failure states** | Selected for permanent housing growth, replacement of huts or family formation. Loses contribution when overcrowded, damaged or inaccessible.  |
| **Restricted player-creator validation**         | Capacity comes from valid beds and room suitability, not footprint alone. Player designs must pass weather, access, fire and household checks. |
| **Pack and style resolution**         | Highly variable exterior and room arrangement; palettes and style kits should make cottages the main expression of local architecture.         |

### 7. Farmhouse

`building.residential.farmhouse`

| **Catalogue role**                      | Residential / Food \| Hamlet \| Medium \| Optional \| Legacy Extended-Slice Provenance                                                                                    |
|-----------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Housing \| Secondary: Work, Provisions                                                                                                       |
| **Purpose**                             | Combines a household with nearby agricultural work, storage and oversight without merging all farm facilities into one abstract building.             |
| **Capacity / service**                  | Usually 3-6 residents and 1-3 farm workers; modest crop/tool storage.                                                                                 |
| **Jobs and users**                      | Farmer, farmhand, herder or household producer.                                                                                                       |
| **Inputs**                              | Household provisions, farm tools, seeds, fuel and repair materials.                                                                                   |
| **Outputs / services**                  | Housing plus farm supervision, local tool storage and reduced travel time to fields/barn.                                                             |
| **Required semantic contract**          | Household beds, entrance, heat/light, farm work point, tool storage, field/barn sockets and road access.                                              |
| **Blueprint Forge source profile**          | Mixed-use source with separate household and farm-support layers, household/private routes, farm work and storage markers, field/barn sockets, staged activation and optional attached-module inheritance. |
| **Runtime products, persistence and LOD**   | Persist household and job links separately, including farm parcel sockets and attached-module versions. Distant simulation preserves housing and farm-support capacities without merging their ownership. |
| **Placement and utilities**             | Adjacent to farm parcels, barn or orchard; may sit at cluster edge rather than centre.                                                                |
| **Construction profile**                | 6 stages, with home shell activating before optional farm porch, storage or decorative finish.                                                        |
| **Upgrade, inheritance and branch links**            | Farmstead cluster, manor farm, irrigated estate or automated farm residence.                                                                          |
| **Planner triggers and failure states** | Selected when agriculture is important and worker travel is high. Underperforms without nearby productive parcels.                                    |
| **Restricted player-creator validation**         | Must satisfy full housing checks and provide at least one agricultural work or storage marker; a house near a field is not automatically a farmhouse. |
| **Pack and style resolution**         | Courtyard, longhouse, stilt farm, hill terrace, orchard lodge and living-wood farm variants.                                                          |

### 8. Communal Longhouse

`building.residential.communal_longhouse`

| **Catalogue role**                      | Residential / Community \| Hamlet \| Large \| Optional \| Legacy Legacy Alpha Provenance Provenance                                                                            |
|-----------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Housing \| Secondary: Morale, Provisions                                                                                          |
| **Purpose**                             | Provides dense early communal housing for cultures or settlements that prefer shared living and meals.                                     |
| **Capacity / service**                  | Usually 8-20 residents across several households or one extended household; shared hearth and storage.                                     |
| **Jobs and users**                      | Optional steward, cook, elder or craft worker; residents use shared schedules.                                                             |
| **Inputs**                              | Large structural material demand, bedding, fuel and communal provisions.                                                                   |
| **Outputs / services**                  | High housing capacity, shared social space, efficient heating and communal meal support.                                                   |
| **Required semantic contract**          | Multiple household zones or beds, shared hearth, safe aisles, storage, gathering area and several exits for larger versions.               |
| **Blueprint Forge source profile**          | Communal-housing source with household cluster markers, shared cooking/gathering zones, privacy compatibility data, emergency exits, capacity modules and conversion deltas. |
| **Runtime products, persistence and LOD**   | Persist resident group, household compatibility, communal capacity, emergency use and conversion state. Runtime aggregation may use bed-bay or room modules at city LOD. |
| **Placement and utilities**             | Central or cluster parcel with strong path access and fire clearance.                                                                      |
| **Construction profile**                | 6-7 stages; foundations/frame are substantial, while household areas may activate in phases.                                               |
| **Upgrade, inheritance and branch links**            | Communal hall, dormitory, courtyard housing or apartment branch.                                                                           |
| **Planner triggers and failure states** | Useful under rapid population growth, limited land or communal culture preference. Morale may fall if imposed on privacy-focused cultures. |
| **Restricted player-creator validation**         | Must define household compatibility, exits, circulation and heating safety; simple bed spam does not create valid capacity.                |
| **Pack and style resolution**         | Great hall, clan house, earth lodge, tree hall, cavern hall and nomadic communal pavilion variants.                                        |

### 9. Townhouse or Shop-House

`building.residential.townhouse_shop_house`

| **Catalogue role**                      | Residential / Mixed Use \| Town \| Medium \| Optional \| Legacy Legacy Beta Provenance Provenance                                                                                    |
|-----------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Housing \| Secondary: Work, Infrastructure                                                                                              |
| **Purpose**                             | Introduces compact mixed-use urban parcels with residence and a compatible public or productive ground floor.                                    |
| **Capacity / service**                  | Usually 3-6 residents plus 1-4 workplace or retail jobs.                                                                                         |
| **Jobs and users**                      | Merchant, artisan, service worker or professional, depending on approved ground-floor module.                                                    |
| **Inputs**                              | Household provisions plus workplace inputs defined by the attached shop/work module.                                                             |
| **Outputs / services**                  | Housing, local service or production, active streets and reduced travel demand.                                                                  |
| **Required semantic contract**          | Separate or controlled public/private entrances, household beds, service/work markers, storage, street socket and fire escape as scale requires. |
| **Blueprint Forge source profile**          | Mixed-use vertical source with public frontage, private household route, compatible workplace socket, fire and noise separation, street/utility sockets, floor or room modules and upgrade inheritance. |
| **Runtime products, persistence and LOD**   | Persist residential units and ground-floor service link separately. Public access, household ownership and workplace operation remain independently enabled or damaged. |
| **Placement and utilities**             | Street frontage in town or denser village centre; compatible neighbouring use and delivery access required.                                      |
| **Construction profile**                | 6-8 stages; shell can be shared while residence and shop activate separately.                                                                    |
| **Upgrade, inheritance and branch links**            | Apartment house, merchant house, guild row, courtyard block or specialised urban branch.                                                         |
| **Planner triggers and failure states** | Selected when land value, street activity and mixed-use demand rise. Can fail through incompatible hazards, noise or blocked private access.     |
| **Restricted player-creator validation**         | Player blueprint must separate household safety from public/work hazards and satisfy both attached functional profiles.                          |
| **Pack and style resolution**         | Timber-framed, stone arcade, bazaar courtyard, canal house, tower-house and magical vertical variants.                                           |

### 10. Apartment House

`building.residential.apartment_house`

| **Catalogue role**                      | Residential / Urban \| City \| Large \| Optional \| Legacy Legacy Beta Provenance Provenance                                                                              |
|-----------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Housing \| Secondary: Infrastructure, Morale                                                                                 |
| **Purpose**                             | Provides high-capacity urban housing while creating service, evacuation and infrastructure requirements appropriate to cities.        |
| **Capacity / service**                  | Usually 12-40 residents in multiple households; exact capacity derives from valid units, beds, circulation and utilities.             |
| **Jobs and users**                      | Caretaker or steward optional; residents retain external jobs.                                                                        |
| **Inputs**                              | Household provisions, maintenance materials, lighting/heating and stage-appropriate utility service.                                  |
| **Outputs / services**                  | Dense housing capacity, efficient land use and district population support.                                                           |
| **Required semantic contract**          | Household units, beds, corridors/stairs, entrances/exits, waste/service points, shared space and street/utility sockets.              |
| **Blueprint Forge source profile**          | Multi-unit source or nested apartment module set with unit IDs, shared circulation, utility/service spine, emergency routes, density validation, wing-level damage and runtime aggregation products. |
| **Runtime products, persistence and LOD**   | Persist unit occupancy, shared-service state, wing condition and evacuation availability. Distant simulation aggregates by unit or wing while retaining named household assignments. |
| **Placement and utilities**             | Urban district with road, safety, water/sanitation and emergency access expected by city stage.                                       |
| **Construction profile**                | 8+ stages, often wing-by-wing; partial occupancy allowed only after inspected routes and utilities are complete.                      |
| **Upgrade, inheritance and branch links**            | Courtyard block, assisted housing, noble apartments, worker housing or magical vertical residence.                                    |
| **Planner triggers and failure states** | Selected under urban housing pressure and limited parcels. Becomes unsafe or low-morale when services, exits or maintenance fail.     |
| **Restricted player-creator validation**         | Capacity is denied for unreachable rooms, missing exits, unsafe vertical routes, invalid households or absent required city services. |
| **Pack and style resolution**         | Row blocks, courtyard compounds, cliff dwellings, cavern terraces, living towers and floating residential modules.                    |## 21.1 v1.0 Housing Reconciliation Note

Every residential entry in this section provides **dwelling capacity** only.

Document 07 owns:

- household membership;
- residence assignment;
- migration.

Set 28 owns social willingness where relevant.

Set 29 owns biological shelter/sleep/exposure outcomes.

A detailed registry row that says a structure “houses N residents” means **design/capacity intent**, not that 20A directly creates or assigns those residents.

# 22. Farming, Food and Livestock Entries

### 11. Basic Farm Plot

`building.food.basic_farm_plot`

| **Catalogue role**                      | Food / Agriculture \| Hamlet \| Parcel \| Required \| Legacy POC Core Provenance                                                                               |
|-----------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Provisions \| Secondary: Work                                                                                                           |
| **Purpose**                             | Creates the first dependable renewable food source and a clear settlement project that reacts to soil, climate and labour.                       |
| **Capacity / service**                  | Typical small plot supports part of 2-6 residents depending on crop, season, fertility and skill; several plots combine into a farmstead.        |
| **Jobs and users**                      | Farmer or farmhand; temporary harvest labour may assist.                                                                                         |
| **Inputs**                              | Seeds/planting stock, tools, labour, water access or rainfall and optional fertiliser.                                                           |
| **Outputs / services**                  | Crops, seed return, straw/fibre and seasonal food supply.                                                                                        |
| **Required semantic contract**          | Crop rows or planting cells, access lane, tool/work point, harvest zone and optional water socket.                                               |
| **Blueprint Forge source profile**          | Terrain-bound parcel source with cultivated-cell layer, crop rows or planting regions, work and tool markers, water/route sockets, seasonal state references, harvest visuals and soil/terrain adaptation rules. |
| **Runtime products, persistence and LOD**   | Persist crop profile, planted cells or bounded parcel state, season, labour assignment, water access, harvest stock and damage. Distant output remains resource-conserving. |
| **Placement and utilities**             | Valid soil, light, slope and climate; reachable from storage and protected from trampling or hostile animals.                                    |
| **Construction profile**                | 3 stages: clear/prepare; plant/irrigate; first operational crop cycle. Growth is not construction progress.                                      |
| **Upgrade, inheritance and branch links**            | Irrigated/terraced farm, orchard, herb garden, greenhouse or automated farm.                                                                     |
| **Planner triggers and failure states** | Required when provisions fall below reserve targets. Can lie fallow through season, crop rotation or labour shortage rather than being “broken.” |
| **Restricted player-creator validation**         | Must contain enough valid cultivated cells and access. Decorative gardens do not count unless configured as edible production.                   |
| **Pack and style resolution**         | Field geometry, crop family, terraces, raised beds, paddies, fungal beds and magical cultivation vary by biome/culture.                          |

### 12. Irrigated or Terraced Farm

`building.food.irrigated_terraced_farm`

| **Catalogue role**                      | Food / Agriculture \| Village \| Large Parcel \| Optional \| Legacy Legacy Alpha Provenance Provenance                                                                        |
|-----------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Provisions \| Secondary: Infrastructure, Work                                                                                    |
| **Purpose**                             | Expands agriculture where water control, slopes or higher yields justify infrastructure investment.                                       |
| **Capacity / service**                  | Usually supports a meaningful village food share; capacity depends on cultivated area and water reliability rather than one fixed output. |
| **Jobs and users**                      | Farmers, irrigation worker, hauler and optional agricultural specialist.                                                                  |
| **Inputs**                              | Seeds, tools, labour, water network, repair materials and optional fertiliser or mana support.                                            |
| **Outputs / services**                  | Higher or more reliable crop output, specialty crops and reduced drought/slope penalties.                                                 |
| **Required semantic contract**          | Cultivated terraces/plots, channels or water sockets, access routes, maintenance points and storage connection.                           |
| **Blueprint Forge source profile**          | Parametric or modular farm source with irrigation/terrace semantics, retaining and water roles, cultivated regions, maintenance access, seasonal/damage deltas and terrain-conditioned generation rules. |
| **Runtime products, persistence and LOD**   | Persist water/terrace modules, cultivated capacity, crop state, maintenance and terrain bindings. Runtime bake includes placement and drainage proxies as required. |
| **Placement and utilities**             | Slope-appropriate or water-connected terrain; must not create uncontrolled flooding or block roads.                                       |
| **Construction profile**                | 5-7 stages: survey; retaining/levelling; channels; soil; planting; inspection.                                                            |
| **Upgrade, inheritance and branch links**            | Farmstead cluster, automated farm, magical greenhouse or regional irrigation network.                                                     |
| **Planner triggers and failure states** | Chosen for food pressure, poor flat land, drought risk or agricultural specialisation. Pauses if water rights or network capacity fail.   |
| **Restricted player-creator validation**         | Requires continuous water logic, reachable terraces and stable retaining/foundation rules; visual channels alone are insufficient.        |
| **Pack and style resolution**         | Rice terraces, step gardens, canal fields, desert qanat farms, cavern fungus terraces and ley-fed gardens.                                |

### 13. Barn

`building.food.barn`

| **Catalogue role**                      | Food / Livestock \| Hamlet \| Medium \| Optional \| Legacy Extended-Slice Provenance                                                              |
|-----------------------------------------|-------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Provisions \| Secondary: Infrastructure, Work                                                                        |
| **Purpose**                             | Protects feed, tools, harvests and livestock support functions without replacing the separate granary or animal yard systems. |
| **Capacity / service**                  | Small-to-medium farm storage plus shelter for a limited livestock group or equipment set, depending on blueprint profile.     |
| **Jobs and users**                      | Farmer, herder, stablehand or hauler.                                                                                         |
| **Inputs**                              | Feed, bedding, repair materials and optional lighting/heating.                                                                |
| **Outputs / services**                  | Protected feed and harvest storage, livestock shelter, farm-tool access and reduced spoilage/weather loss.                    |
| **Required semantic contract**          | Large access door, feed/storage zones, animal or equipment bays, ventilation, work point and farm-road socket.                |
| **Blueprint Forge source profile**          | Voxel farm-support source with animal or harvest zones, feed and tool storage, creature entrances, human service routes, ventilation/hazard data, attachment sockets and damage/repair states. |
| **Runtime products, persistence and LOD**   | Persist stored feed/harvest, animal occupancy, assigned workers, enclosure condition and linked paddock. Distant simulation preserves animal totals, feed and output summaries. |
| **Placement and utilities**             | Near fields, paddock and farmhouse; downwind/away from dense housing where appropriate.                                       |
| **Construction profile**                | 5 stages: foundation; frame; walls; roof/doors; bays/storage activation.                                                      |
| **Upgrade, inheritance and branch links**            | Stable/paddock, specialised livestock barn, farmstead cluster or automated feed store.                                        |
| **Planner triggers and failure states** | Selected when farm storage, animals or harvest handling are bottlenecks. Fire, pests and feed shortage are key failure risks. |
| **Restricted player-creator validation**         | Must separate safe storage and animal/equipment circulation; storage capacity comes from marked zones and containers.         |
| **Pack and style resolution**         | Timber barn, stone byre, reed loft, cavern pens, living-root shelter and climate-sealed variants.                             |

### 14. Granary

`building.food.granary`

| **Catalogue role**                      | Food / Storage \| Village \| Small \| Required \| Legacy Extended-Slice Provenance                                                                                                     |
|-----------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Provisions \| Secondary: Infrastructure, Safety                                                                                                           |
| **Purpose**                             | Creates protected staple reserves and makes seasonal food security visible and measurable.                                                                         |
| **Capacity / service**                  | Provides protected dry-food capacity sized by containers/marked volume; supports reserve-days calculations rather than producing food.                             |
| **Jobs and users**                      | Storekeeper, farmer or hauler; may be unstaffed at small scale.                                                                                                    |
| **Inputs**                              | Grain or dry food, pest control, maintenance materials and ledger access.                                                                                          |
| **Outputs / services**                  | Reduced spoilage and theft, project/emergency reserve separation and clearer provision forecasting.                                                                |
| **Required semantic contract**          | Protected storage zones, intake/output, ledger point, ventilation/pest protection and path/warehouse socket.                                                       |
| **Blueprint Forge source profile**          | Protected-storage source with staple category markers, secure access, ledger/inspection point, ventilation and pest-control semantics, delivery sockets, reserved/full/spoiled/contaminated states and roof/fire damage groups. |
| **Runtime products, persistence and LOD**   | Persist exact stock and reservations through storage authority, plus condition, contamination, access and reserve profile. The structure never creates food from capacity alone. |
| **Placement and utilities**             | Dry, raised or drained site with guarded access; near farms and kitchen but separated from fire risks.                                                             |
| **Construction profile**                | 5 stages: raised/foundation; shell; roof; storage bins; sealing/inspection.                                                                                        |
| **Upgrade, inheritance and branch links**            | Specialised silo/depot (20D), town reserve house, automated food warehouse or magical cold/dry vault.                                                              |
| **Planner triggers and failure states** | Required at Village when food production exceeds safe household storage or seasonal reserve targets rise. Fails through moisture, pests, fire or untracked access. |
| **Restricted player-creator validation**         | Must contain valid protected food storage and access; empty decorative towers do not provide reserve capacity.                                                     |
| **Pack and style resolution**         | Raised granaries, stone silos, clay bins, cliff stores, fungal vaults and rune-sealed reserve houses.                                                              |

### 15. Communal Kitchen

`building.food.communal_kitchen`

| **Catalogue role**                      | Food / Community \| Hamlet \| Small \| Required \| Legacy POC Core Provenance                                                                                                  |
|-----------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Provisions \| Secondary: Morale, Health                                                                                                                 |
| **Purpose**                             | Converts stored ingredients into safe batch meals and provides an early communal service without simulating every bite as a separate player task.                |
| **Capacity / service**                  | One or more cook stations serving a small hamlet; throughput depends on cooks, fuel, inputs and meal storage.                                                    |
| **Jobs and users**                      | Cook, baker apprentice, steward or rotating resident duty.                                                                                                       |
| **Inputs**                              | Food ingredients, water access, fuel, cookware and optional preservation ingredients.                                                                            |
| **Outputs / services**                  | Cooked meals, improved food value/variety, social mealtime and reduced foodborne-risk when operational.                                                          |
| **Required semantic contract**          | Cook station, food input/output, water point/socket, fuel storage, tables or collection point, ventilation and fire safety.                                      |
| **Blueprint Forge source profile**          | Service source with cook stations, food input/output and serving markers, water/fuel sockets, clean and hot work zones, public seating, five-stage commissioning profile and active/idle/blocked/unsafe state visuals. |
| **Runtime products, persistence and LOD**   | Persist work cycle, recipe, input/output transactions, service queue summary, staff, condition and blocker. Near simulation may show meals and seating; distant simulation batches service. |
| **Placement and utilities**             | Central and accessible, near food storage and water, separated from flammable/unsanitary uses.                                                                   |
| **Construction profile**                | 5 stages: shell; hearth/ventilation; work surfaces; storage/water; furniture/inspection.                                                                         |
| **Upgrade, inheritance and branch links**            | Bakery/food workshop, tavern/inn kitchen, preserving house or district food hall.                                                                                |
| **Planner triggers and failure states** | Required when settlement grows beyond household cooking or raw-food dependence becomes unsafe/inefficient. Pauses from fuel, water, cook or ingredient shortage. |
| **Restricted player-creator validation**         | Must provide safe cook path, ventilation, input/output and water logic; a decorative hearth alone is not a kitchen.                                              |
| **Pack and style resolution**         | Communal hearth, outdoor cookhouse, clay oven court, feast hall kitchen, steam kitchen and mana-heated kitchen.                                                  |

### 16. Grain Millhouse

`building.food.grain_millhouse`

| **Catalogue role**                      | Food / Processing \| Village \| Medium \| Optional \| Legacy Legacy Alpha Provenance Provenance                                                                         |
|-----------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Provisions \| Secondary: Work, Infrastructure                                                                              |
| **Purpose**                             | Processes grain and similar crops into higher-value cooking inputs using mechanical, water, wind or powered milling.                |
| **Capacity / service**                  | Throughput depends on mill mechanism, power and worker; supports one village-scale grain chain.                                     |
| **Jobs and users**                      | Miller, mechanic/maintenance worker and hauler.                                                                                     |
| **Inputs**                              | Grain, power source, sacks/containers and maintenance parts.                                                                        |
| **Outputs / services**                  | Flour or meal, bran/by-products and improved bakery/kitchen supply.                                                                 |
| **Required semantic contract**          | Mill mechanism, input/output, power socket, maintenance access, safe work zone and delivery route.                                  |
| **Blueprint Forge source profile**          | Processing source with mill mechanism module, grain input/output, operator and maintenance markers, mechanical/wind/water power compatibility, hazard clearance, rotating-state preview and safe-stop delta. |
| **Runtime products, persistence and LOD**   | Persist active recipe, input/output stock, power/source binding, operator, condition and maintenance. Rotating geometry is presentation; authoritative production uses bounded transactions. |
| **Placement and utilities**             | Near water/wind/power opportunity or connected network; noise and moving parts should be considered near housing.                   |
| **Construction profile**                | 6 stages: foundation; mill structure; mechanism; power connection; storage; inspection.                                             |
| **Upgrade, inheritance and branch links**            | Powered mill, industrial food plant (20E) or district grain complex.                                                                |
| **Planner triggers and failure states** | Selected when grain surplus and kitchen/bakery demand justify processing. Stops cleanly on blocked output or lost power.            |
| **Restricted player-creator validation**         | Must include approved processing mechanism and power/input/output links; visual wheel without functional connection does not count. |
| **Pack and style resolution**         | Watermill, windmill, animal mill, hand quern hall, rune mill and compact urban mill.                                                |

### 17. Bakery or Food Workshop

`building.food.bakery_food_workshop`

| **Catalogue role**                      | Food / Artisan \| Village \| Small \| Optional \| Legacy Legacy Alpha Provenance Provenance                                                                                     |
|-----------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Provisions \| Secondary: Work, Morale                                                                                              |
| **Purpose**                             | Produces bread, prepared foods or a culture-specific staple beyond basic communal meals.                                                    |
| **Capacity / service**                  | Small specialist workshop serving village demand; throughput depends on recipe, worker, fuel and processed inputs.                          |
| **Jobs and users**                      | Baker, cook, confectioner or culture-specific food artisan.                                                                                 |
| **Inputs**                              | Flour or relevant ingredients, water, fuel, containers and recipe knowledge.                                                                |
| **Outputs / services**                  | Bread/prepared foods, trade goods, food variety and festival supplies.                                                                      |
| **Required semantic contract**          | Oven/cook station, preparation bench, ingredient storage, output display/collection, ventilation and water.                                 |
| **Blueprint Forge source profile**          | Food workshop source with recipe stations, clean/hot work zones, display or serving options, input/output storage, water/fuel/power sockets, public/private separation and operational-state variants. |
| **Runtime products, persistence and LOD**   | Persist recipes, staff, stock, public service state, quality where meaningful, condition and blocked cause. Nearby customers are presentation layered over conserved sales/service records. |
| **Placement and utilities**             | Near market or kitchen/storage route with safe fire and delivery access.                                                                    |
| **Construction profile**                | 5-6 stages; functional oven and work surfaces activate before final storefront decoration.                                                  |
| **Upgrade, inheritance and branch links**            | Tavern kitchen, preserving house, urban food hall or industrial food plant.                                                                 |
| **Planner triggers and failure states** | Selected for food variety, trade, morale or population demand; not a required survival building if communal kitchen capacity is sufficient. |
| **Restricted player-creator validation**         | Must satisfy recipe station, ventilation and storage markers; player designs may be workshop-only or mixed shop-house when safe.            |
| **Pack and style resolution**         | Bread ovens, noodle house, smoke-cookhouse, sweetmaker, fungal bakery, spirit-kitchen and magical confectioner.                             |

### 18. Preserving House

`building.food.preserving_house`

| **Catalogue role**                      | Food / Processing \| Town \| Medium \| Optional \| Legacy Legacy Beta Provenance Provenance                                                                                      |
|-----------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Provisions \| Secondary: Health, Work                                                                                               |
| **Purpose**                             | Extends reserve life through drying, smoking, salting, pickling, fermentation, chilling or magical preservation.                             |
| **Capacity / service**                  | Town-scale preservation batches; increases usable reserve days and reduces seasonal waste rather than producing food from nothing.           |
| **Jobs and users**                      | Preserver, cook, alchemist or cold-store keeper depending on method.                                                                         |
| **Inputs**                              | Fresh food, salt/smoke/fuel/containers or magical reagents, water and recipes.                                                               |
| **Outputs / services**                  | Preserved food, trade goods, reduced spoilage and emergency reserves.                                                                        |
| **Required semantic contract**          | Preparation, process stations, clean/dirty separation, storage, ventilation/drainage and input/output.                                       |
| **Blueprint Forge source profile**          | Preservation source with profile-selectable smoking, drying, salting, fermenting or cooling modules, clean/dirty routes, storage and waste sockets, contamination states and ventilation/temperature safety data. |
| **Runtime products, persistence and LOD**   | Persist preservation mode, batch state, environmental requirement, stock, spoilage/contamination and maintenance. Distant ticks use the same recipe totals and safety rules. |
| **Placement and utilities**             | Near food logistics and water; method-specific smoke, waste, cold or magic safety rules apply.                                               |
| **Construction profile**                | 6-7 stages with process equipment and sanitary inspection before operation.                                                                  |
| **Upgrade, inheritance and branch links**            | Cold store, industrial food plant, magical preservation vault or regional reserve complex.                                                   |
| **Planner triggers and failure states** | Selected for seasonal surplus, long routes, winter risk or trade. Can create health risk if sanitation, temperature or recipe control fails. |
| **Restricted player-creator validation**         | Must include a supported preservation method and hygienic flow; generic storage does not claim preservation bonus.                           |
| **Pack and style resolution**         | Smokehouse, salt house, fermentation cellar, icehouse, sun-drying court and time-rune pantry.                                                |

### 19. Stable and Paddock

`building.livestock.stable_paddock`

| **Catalogue role**                      | Livestock / Transport \| Hamlet \| Medium Parcel \| Optional \| Legacy Legacy Alpha Provenance Provenance                                                                   |
|-----------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Work \| Secondary: Provisions, Infrastructure                                                                                  |
| **Purpose**                             | Provides safe animal housing, feeding, breeding or transport-animal support as one linked facility family.                              |
| **Capacity / service**                  | Draft range: 2-8 large mounts/work animals or a larger number of small livestock, depending on marked stalls and grazing space.         |
| **Jobs and users**                      | Stablehand, herder, breeder, courier or animal healer.                                                                                  |
| **Inputs**                              | Feed, water, bedding, fencing, tools and medicine as needed.                                                                            |
| **Outputs / services**                  | Animal safety, mounts/work beasts, manure/by-products and transport or farming capacity.                                                |
| **Required semantic contract**          | Stalls/pens, gates, feed/water, paddock zone, grooming/work point, path/road socket and manure/waste handling.                          |
| **Blueprint Forge source profile**          | Entity-compatible enclosure and stable source with creature size profiles, occupancy, feed, water and grooming markers, paddock boundary, animal/human routes, vehicle or mount socket and breach/damage states. |
| **Runtime products, persistence and LOD**   | Persist animal identities or bounded herd records, occupancy, feed/water, ownership, enclosure condition and route compatibility. Rendering, AI and simulation LOD may change independently. |
| **Placement and utilities**             | Accessible edge parcel with suitable ground, drainage and separation from dense housing where appropriate.                              |
| **Construction profile**                | 5-6 stages: fence/paddock; shelter; stalls; feed/water; work points; inspection.                                                        |
| **Upgrade, inheritance and branch links**            | Large stable, caravan yard, beast-training ground, sanctuary or automated feed system.                                                  |
| **Planner triggers and failure states** | Selected when owned animals lack capacity or transport/farming demand rises. Welfare and escape risk worsen if overcrowded or underfed. |
| **Restricted player-creator validation**         | Capacity derives from valid stalls/pens and access; decorative fences do not create animal service.                                     |
| **Pack and style resolution**         | Open corrals, stone stables, cliff roosts, underground pens, living enclosures and magical creature wards.                              |

### 20. Fishery or Fishing Dock

`building.food.fishery_fishing_dock`

| **Catalogue role**                      | Food / Water \| Hamlet \| Medium \| Conditional \| Legacy Legacy Alpha Provenance Provenance                                                                            |
|-----------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Provisions \| Secondary: Work, Infrastructure                                                                              |
| **Purpose**                             | Creates a water-dependent food and trade branch without forcing inland settlements to build irrelevant structures.                  |
| **Capacity / service**                  | Output depends on water biome, stock pressure, boats/nets, season and workers; small versions serve a hamlet.                       |
| **Jobs and users**                      | Fisher, boat worker, fish processor or dockhand.                                                                                    |
| **Inputs**                              | Fishing tools, bait/nets, boats where required, containers, fuel and maintenance materials.                                         |
| **Outputs / services**                  | Fish or water resources, trade goods and optional transport access.                                                                 |
| **Required semantic contract**          | Water-edge work points, safe landing, gear storage, catch input/output, path socket and optional boat moorings.                     |
| **Blueprint Forge source profile**          | Water-edge source with fishing work zones, boat or bank access, catch input/output, storage and cleaning markers, route/water sockets, tide/flood/season placement rules and damaged-dock states. |
| **Runtime products, persistence and LOD**   | Persist water-site binding, workers, craft/boat links, catch stock, season and dock condition. Distant catch output remains bounded by the same ecology and route state. |
| **Placement and utilities**             | Valid fishable water, stable shore/depth, safe access and non-conflicting route; can be river, lake, coast or cavern water.         |
| **Construction profile**                | 4-6 stages: shore works; deck/shelter; moorings; storage/work; inspection.                                                          |
| **Upgrade, inheritance and branch links**            | Harbour fishery, hatchery, preserving house link or culture-specific aquatic farm.                                                  |
| **Planner triggers and failure states** | Only eligible when local water and ecology support it. Overfishing, storms, pollution or hostile water creatures can reduce output. |
| **Restricted player-creator validation**         | Must connect to valid water and safe work/landing points; decorative docks do not generate fish.                                    |
| **Pack and style resolution**         | River jetty, coastal pier, stilt village dock, ice fish house, cavern platform and floating kelp farm.                              |## 22.1 v1.0 Food / Livestock / Maritime Reconciliation Note

For entries 11–19:

- exact crops/food/items come from Documents 04–06;
- recipes/processing come from Document 05;
- livestock ecology/husbandry comes from Document 10;
- animal biology comes from Set 29;
- worker movement comes from Set 30;
- market/import value comes from Set 27.

For **#20 Fishery or Fishing Dock**:

- 20A owns the settlement-facing Provisions/work-facility function;
- Set 26M / Document 10 own marine ecology and sustainable fish-source truth;
- Set 26J owns specialist port/berth/vessel-service behaviour where the site also functions as a port;
- Set 30/26 owns physical access/movement;
- catch becomes real only through an authoritative harvest/transaction chain.

A decorative dock beside empty water cannot generate fish.

# 23. Health and Welfare Entries

### 21. Healer Hut

`building.health.healer_hut`

| **Catalogue role**                      | Health \| Village \| Small \| Required \| Legacy Extended-Slice Provenance                                                                                            |
|-----------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Health \| Secondary: Morale                                                                                                              |
| **Purpose**                             | Provides the first formal treatment service, medicine storage and recovery capacity.                                                              |
| **Capacity / service**                  | One healer work point and 1-2 recovery beds; sufficient for routine village injuries, not a major outbreak or battle.                             |
| **Jobs and users**                      | Healer, herbalist or apprentice.                                                                                                                  |
| **Inputs**                              | Medicine, bandages, clean water, fuel/light and optional herbs or magical components.                                                             |
| **Outputs / services**                  | Treatment, recovery, diagnosis/events, medicine crafting or dispensing and health reassurance.                                                    |
| **Required semantic contract**          | Treatment station, medicine storage, recovery bed, clean-water access, handwashing/clean zone and safe entrance.                                  |
| **Blueprint Forge source profile**          | Care-service source with treatment marker, recovery bed, medicine storage, clean work zone, water/sanitation dependency, patient/staff circulation, five-stage commissioning and active/overloaded/contaminated states. |
| **Runtime products, persistence and LOD**   | Persist patients, treatment queue, staff, medicine consumption, recovery progress, condition and contamination. Patient identity is preserved even when treatment is summary-simulated. |
| **Placement and utilities**             | Quiet, accessible central site near water and emergency routes; separated from major pollution or industry.                                       |
| **Construction profile**                | 5 stages: shell; clean interior; treatment station; medicine/recovery; inspection.                                                                |
| **Upgrade, inheritance and branch links**            | Clinic/infirmary, hospital campus (20F), quarantine shelter or magical healing branch (20E).                                                      |
| **Planner triggers and failure states** | Required when population, injury history or stage expectations exceed informal care. Becomes overloaded when patients exceed staff/beds/medicine. |
| **Restricted player-creator validation**         | Must have treatment, storage, clean access and recovery capacity; decorative herb shelves do not create health service.                           |
| **Pack and style resolution**         | Herbal hut, surgeon house, clan healer lodge, spirit clinic, alchemical dispensary and rune-healing room.                                         |

### 22. Clinic or Infirmary

`building.health.clinic_infirmary`

| **Catalogue role**                      | Health \| Town \| Medium \| Optional \| Legacy Legacy Beta Provenance Provenance                                                                                                                         |
|-----------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Health \| Secondary: Infrastructure, Safety                                                                                                                 |
| **Purpose**                             | Expands treatment, triage and short-term recovery for a town, military site or dense district.                                                                       |
| **Capacity / service**                  | Several treatment/recovery positions with triage and medicine support; exact capacity derives from staff, beds and utilities.                                        |
| **Jobs and users**                      | Healer/physician, nurse/orderly, apothecary and optional cleaner or porter.                                                                                          |
| **Inputs**                              | Medicine, clean water, fuel/power, linens, food and sanitation supplies.                                                                                             |
| **Outputs / services**                  | Higher treatment/triage capacity, outbreak-response support and emergency-care throughput; Set 29 owns resulting biological recovery, death-risk and disease outcomes.                                                         |
| **Required semantic contract**          | Reception/triage, treatment stations, recovery beds, medicine store, clean/dirty separation, water/sanitation and emergency access.                                  |
| **Blueprint Forge source profile**          | Multi-room care source with reception/triage, treatment and recovery zones, clean/dirty routes, medicine and linen stores, water/sanitation/emergency sockets, wing-level activation and contamination/damage deltas. |
| **Runtime products, persistence and LOD**   | Persist room/wing capacity, patients, staff, supplies, utility state, contamination and emergency load. Distant simulation aggregates treatment while preserving named outcomes and shortages. |
| **Placement and utilities**             | Road-connected service area with reliable water, sanitation and low hazard exposure.                                                                                 |
| **Construction profile**                | 6-8 stages; clean utilities and inspected care routes required before activation.                                                                                    |
| **Upgrade, inheritance and branch links**            | Hospital complex (20F), specialised cleansing clinic (20E), hospice or military infirmary.                                                                           |
| **Planner triggers and failure states** | Selected when healer hut is overloaded, district access is poor or threat/industry raises injury load. Fails through staff, medicine, sanitation or access shortage. |
| **Restricted player-creator validation**         | Player design must meet bed spacing, clean routes, staff access, utility and evacuation rules appropriate to capacity.                                               |
| **Pack and style resolution**         | Courtyard clinic, monastic infirmary, field-surgery hall, bath-clinic, alchemical clinic and mana-assisted infirmary.                                                |

### 24. Quarantine or Emergency Shelter

`building.welfare.quarantine_emergency_shelter`

| **Catalogue role**                      | Health / Welfare \| Village \| Medium \| Conditional \| Legacy Legacy Alpha Provenance Provenance                                                                                                  |
|-----------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Health \| Secondary: Safety, Housing                                                                                                                  |
| **Purpose**                             | Provides flexible isolation, disaster shelter or evacuation capacity without creating a permanent always-on “panic” need.                                      |
| **Capacity / service**                  | Typically 4-16 temporary occupants, with capacity profile chosen as quarantine, disaster shelter or mixed emergency use.                                       |
| **Jobs and users**                      | Temporary healer, steward, guard or relief worker.                                                                                                             |
| **Inputs**                              | Beds, provisions, clean water, medicine, fuel, security and sanitation supplies.                                                                               |
| **Outputs / services**                  | Isolation, emergency beds, safe evacuation capacity and reduced outbreak/disaster spread.                                                                      |
| **Required semantic contract**          | Controlled entrances, separated bed zones, clean/dirty route if quarantine, supply point, water/sanitation and guard/triage point.                             |
| **Blueprint Forge source profile**          | Mode-aware welfare source with separable refuge or quarantine zones, controlled entrances, emergency supply and triage markers, sanitation/water dependencies, wing activation, contained/breached states and rapid-build modules. |
| **Runtime products, persistence and LOD**   | Persist current mode, occupants, isolation groups, supplies, authority, containment integrity and incident history. Dormant operation has low upkeep and no invented active service demand. |
| **Placement and utilities**             | Accessible but separable from dense population; safe from the hazard it is intended to answer.                                                                 |
| **Construction profile**                | Rapid 4-6 stages; may reuse modular shelters and activate by wing.                                                                                             |
| **Upgrade, inheritance and branch links**            | Clinic wing, refugee centre, permanent emergency bunker (20C) or dismantling/reuse after crisis.                                                               |
| **Planner triggers and failure states** | Triggered by outbreak, refugee arrival, disaster warning, damaged housing or event requirement. Dormant when not needed and should not consume heavy staffing. |
| **Restricted player-creator validation**         | Mode-specific checks apply; a quarantine design must prevent uncontrolled circulation, while a storm shelter must meet hazard protection.                      |
| **Pack and style resolution**         | Isolation cabins, monastery ward, earth shelter, ship quarantine pier, warded pavilion and portable relief hall.                                               |## 23.1 v1.0 Health Ownership Note

All health entries in this section describe **facility capability**, not biological ownership.

A Healer Hut, Clinic/Infirmary or Quarantine/Emergency Shelter may expose:

- treatment slots;
- recovery beds;
- isolation;
- medicine storage;
- clean/dirty routes;
- staff roles;
- sanitation/water dependency;
- surge capacity.

Set 29 owns:

- Health;
- injury;
- disease;
- toxin;
- treatment eligibility;
- treatment application;
- recovery;
- death/biological outcome.

Where a legacy row uses outcome-oriented wording, interpret it as the **capacity to support the corresponding Set-29 resolution**, not permission for 20A to edit biological state.

# 24. Community, Culture and Hospitality Entries

### 25. Small Shrine or Community Hall

`building.community.small_shrine_hall`

| **Catalogue role**                      | Community / Culture \| Village \| Small \| Optional \| Legacy Extended-Slice Provenance                                                                         |
|-----------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Morale \| Secondary: Health, Safety                                                                                                |
| **Purpose**                             | Provides a culture-neutral functional slot for worship, assembly, remembrance, ritual, counselling or shared identity.                      |
| **Capacity / service**                  | Small gathering of roughly 6-20 users, depending on seating/standing markers; service depends on events and cultural compatibility.         |
| **Jobs and users**                      | Elder, priest, ritualist, community leader, counsellor or rotating host.                                                                    |
| **Inputs**                              | Optional offerings, culture goods, light/fuel, maintenance and event supplies.                                                              |
| **Outputs / services**                  | Morale support, community meetings, small rituals, counselling, cultural progression and emergency gathering.                               |
| **Required semantic contract**          | Gathering/seating, focal/ritual point, entrance, culture slot, optional speaker/leader and safe assembly routes.                            |
| **Blueprint Forge source profile**          | Public/community source with gathering capacity, focal or ritual marker, culture slot, speaker/leader position, public access and emergency assembly routes, dedication stage and occupation/damage overlays. |
| **Runtime products, persistence and LOD**   | Persist culture/service profile, scheduled or active events, attendance summary, ownership, dedication and damage/occupation history. Morale comes from use and compatibility, not passive existence. |
| **Placement and utilities**             | Accessible civic or residential centre; belief-specific versions may have orientation, landscape or mana requirements.                      |
| **Construction profile**                | 5 stages: site/foundation; hall/shell; weatherproofing; focal furnishings; activation/dedication.                                           |
| **Upgrade, inheritance and branch links**            | Cultural hall/theatre, temple/monastery via 20G or ritual/magic facility via 20E.                                                           |
| **Planner triggers and failure states** | Selected for morale, identity, story or governance need. Should not penalise cultures whose equivalent is a grove, plaza or ancestor house. |
| **Restricted player-creator validation**         | Must provide a valid community function and gathering capacity; no universal religion object is mandatory.                                  |
| **Pack and style resolution**         | Shrine, ancestor room, clan hall, spirit grove, civic lodge, meditation garden and secular meeting hall are equivalent profiles.            |

### 26. Tavern or Inn

`building.hospitality.tavern_inn`

| **Catalogue role**                      | Hospitality \| Village \| Medium \| Optional \| Legacy Legacy Alpha Provenance Provenance                                                                                                  |
|-----------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Morale \| Secondary: Provisions, Work                                                                                                         |
| **Purpose**                             | Combines public meals, social activity and optional guest lodging, supporting local life and travel without becoming a universal survival requirement. |
| **Capacity / service**                  | Small village versions serve a gathering crowd and 0-8 guest beds; tavern-only and inn profiles are both valid.                                        |
| **Jobs and users**                      | Innkeeper, cook, server, brewer or stablehand depending on modules.                                                                                    |
| **Inputs**                              | Food, drink, fuel, linens, cleaning supplies and optional trade goods.                                                                                 |
| **Outputs / services**                  | Meals, social service, guest beds, rumours/quests, trade activity and visitor support.                                                                 |
| **Required semantic contract**          | Public room, service counter, kitchen link, storage, seating, optional guest beds, toilets/sanitation and road frontage.                               |
| **Blueprint Forge source profile**          | Hospitality source with public social zone, food/drink service, vendor and guest-lodging profiles, public/private/service routes, storage and delivery sockets, sign/icon capture framing and open/closed/full states. |
| **Runtime products, persistence and LOD**   | Persist staff, guest occupancy, food/service stock, public access, rumours/events and condition. Guest beds remain distinct from permanent housing capacity. |
| **Placement and utilities**             | Village centre, road junction or caravan route with delivery and noise compatibility.                                                                  |
| **Construction profile**                | 6-7 stages; public room may activate before guest wing or decoration.                                                                                  |
| **Upgrade, inheritance and branch links**            | Coaching inn, guild lodge, city hotel, caravanserai or culture-specific hospitality branch.                                                            |
| **Planner triggers and failure states** | Selected under visitor, trade, morale or meal-capacity demand. Can increase noise, crime or fire risk if poorly managed.                               |
| **Restricted player-creator validation**         | Must distinguish guest beds from permanent housing and meet kitchen/public/escape rules; an inn is not required for every village.                     |
| **Pack and style resolution**         | Alehouse, tea house, feast lodge, caravan inn, bath inn, mushroom tavern and magical traveller house.                                                  |

### 27. Bathhouse and Laundry

`building.community.bathhouse_laundry`

| **Catalogue role**                      | Health / Community \| Town \| Medium \| Optional \| Legacy Legacy Beta Provenance Provenance                                                                              |
|-----------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Health \| Secondary: Infrastructure, Morale                                                                                  |
| **Purpose**                             | Provides shared washing, bathing and linen services where density and culture justify them, without creating individual hygiene bars. |
| **Capacity / service**                  | Town service capacity based on water, heat, staff and wash stations; improves health risk and morale at district level.               |
| **Jobs and users**                      | Bath attendant, launderer, cleaner, healer or boiler worker.                                                                          |
| **Inputs**                              | Water, heat/fuel/power, soap/cleaning goods, linens and drainage capacity.                                                            |
| **Outputs / services**                  | Sanitation support, clean linens, social/recreation service and clinic/hospital support.                                              |
| **Required semantic contract**          | Clean/dirty intake, wash/bath stations, heat, water, drainage, changing/private zones and safe public access.                         |
| **Blueprint Forge source profile**          | Public health source with changing/washing zones, water input and wastewater output, heat or power socket, clean/dirty circulation, privacy rules, capacity modules and contaminated/closed states. |
| **Runtime products, persistence and LOD**   | Persist service capacity, water/heat state, staff, usage summary, contamination and maintenance. No individual hygiene meter is required. |
| **Placement and utilities**             | Reliable water/drainage utility, suitable district access and separation from contaminated industry.                                  |
| **Construction profile**                | 6-8 stages; utilities and drainage must be commissioned before use.                                                                   |
| **Upgrade, inheritance and branch links**            | Public baths, healing baths, steam house, district laundry or magical cleansing spa.                                                  |
| **Planner triggers and failure states** | Selected when town density, clinic needs, culture or sanitation pressure justify it. Does not become a mandatory personal need meter. |
| **Restricted player-creator validation**         | Requires functional water, heat and drainage; privacy and accessibility rules depend on culture/world settings.                       |
| **Pack and style resolution**         | Roman-style baths, sauna, hot spring, river washhouse, steam cave, ritual cleansing pools and rune-heated bath.                       |

### 28. Festival or Community Grounds

`building.community.festival_grounds`

| **Catalogue role**                      | Community / Public Space \| Village \| Parcel \| Optional \| Legacy Legacy Alpha Provenance Provenance                                                           |
|-----------------------------------------|------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Morale \| Secondary: Work                                                                                           |
| **Purpose**                             | Provides flexible outdoor or semi-covered space for festivals, markets, ceremonies, meetings, training and temporary events. |
| **Capacity / service**                  | Variable gathering capacity defined by clear area, entrances and event layout; no permanent daily staffing required.         |
| **Jobs and users**                      | Event host, performers, vendors, guards and temporary workers during events.                                                 |
| **Inputs**                              | Event supplies, food, decorations, lighting, security and cleanup labour.                                                    |
| **Outputs / services**                  | Morale events, culture milestones, temporary trade, social gathering and story triggers.                                     |
| **Required semantic contract**          | Open event area, entrances, assembly points, temporary stall/stage sockets, lighting and emergency routes.                   |
| **Blueprint Forge source profile**          | Open-space plan source with event boundary, performer/vendor/gathering slots, emergency access, temporary module sockets, terrain and weather profile, booked/active/closed state and restoration data. |
| **Runtime products, persistence and LOD**   | Persist bookings/events, temporary modules, attendance summary, terrain condition and damage. The empty grounds provide only declared open-space capacity. |
| **Placement and utilities**             | Central green, edge field or civic plaza with safe crowd access and minimal route conflict.                                  |
| **Construction profile**                | 3-5 stages: clear/grade; paths/boundary; stage or sockets; lighting/decoration; approval.                                    |
| **Upgrade, inheritance and branch links**            | Civic square, tournament ground, cultural precinct or district festival venue.                                               |
| **Planner triggers and failure states** | Selected for morale, culture, tourism or event requirements; remains useful between events as public space.                  |
| **Restricted player-creator validation**         | Must provide safe crowd flow and event sockets; empty inaccessible terrain does not count.                                   |
| **Pack and style resolution**         | Village green, dance circle, feast field, market court, floating platform, cavern forum and seasonal ritual meadow.          |

### 29. Memorial and Cemetery

`building.community.memorial_cemetery`

| **Catalogue role**                      | Community / Welfare \| Village \| Parcel \| Conditional \| Legacy Legacy Alpha Provenance Provenance                                                                                          |
|-----------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Morale \| Secondary: Health, Infrastructure                                                                                                      |
| **Purpose**                             | Handles remembrance, burial/cremation or culture-specific death rites, making loss visible without simulating graphic detail.                             |
| **Capacity / service**                  | Provides rite and memorial capacity; burial plots, crypts or alternatives depend on culture and land availability.                                        |
| **Jobs and users**                      | Caretaker, priest/ritualist, undertaker or historian as culture requires.                                                                                 |
| **Inputs**                              | Maintenance, rite goods, markers, fuel for cremation where used and optional offerings.                                                                   |
| **Outputs / services**                  | Mourning resolution, history, memorial events, safe body handling and cultural continuity.                                                                |
| **Required semantic contract**          | Rite/focal point, memorial or plot zones, paths, records, storage and culturally appropriate boundaries.                                                  |
| **Blueprint Forge source profile**          | Landscape or structure source with memorial/burial plots, ceremony and visitor markers, protected heritage zones, expansion rules, culture and faith slots, desecrated/occupied/restored overlays and persistent named records. |
| **Runtime products, persistence and LOD**   | Persist named memorial/burial records, plot capacity, heritage ownership, ceremonies, damage/desecration and restoration history. Distant simulation never discards identity records. |
| **Placement and utilities**             | Culture-appropriate quiet site, safe drainage and access; may be outside walls, in crypts, gardens or sacred landscapes.                                  |
| **Construction profile**                | 4-6 stages, expandable by plots or memorial modules.                                                                                                      |
| **Upgrade, inheritance and branch links**            | Mausoleum, remembrance garden, ancestor hall, catacomb or capital monument.                                                                               |
| **Planner triggers and failure states** | Triggered by deaths, cultural requirements or memorial events. Lack of an accepted rite can prolong morale penalties, but not every culture needs graves. |
| **Restricted player-creator validation**         | Must use culture-approved body/rite profile and safe access; player designs cannot claim incompatible rites by decoration alone.                          |
| **Pack and style resolution**         | Cemetery, cremation garden, ancestor wall, sky platform, mushroom grove, ossuary, memory crystal hall and spirit forest.                                  |

### 30. Cultural Hall or Theatre

`building.community.cultural_hall_theatre`

| **Catalogue role**                      | Community / Culture \| Town \| Large \| Optional \| Legacy Legacy Beta Provenance Provenance                                                                                           |
|-----------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Morale \| Secondary: Work, Infrastructure                                                                                                 |
| **Purpose**                             | Supports performances, education, civic gatherings, exhibitions and culture-specific public life at town scale.                                    |
| **Capacity / service**                  | Medium-to-large audience with backstage/service capacity; output depends on staff, programme and access rather than passive existence.             |
| **Jobs and users**                      | Performers, host, curator, technicians, teachers, guards and maintenance staff.                                                                    |
| **Inputs**                              | Culture goods, instruments/props, lighting/power, event supplies and maintenance.                                                                  |
| **Outputs / services**                  | Morale events, culture progression, tourism, education links, reputation and story content.                                                        |
| **Required semantic contract**          | Audience area, stage/focal space, entrances/exits, backstage/service, storage, accessible routes and street/civic sockets.                         |
| **Blueprint Forge source profile**          | Large public venue source with stage/focal area, audience and service zones, emergency egress, backstage/storage markers, culture and performance slots, event-state variants and district-scale route validation. |
| **Runtime products, persistence and LOD**   | Persist event schedule, active production, audience capacity, staff, public access, condition and cultural profile. Large crowds may use aggregate presentation without losing event outcomes. |
| **Placement and utilities**             | Town civic or cultural district with strong transport and safety access.                                                                           |
| **Construction profile**                | 7-9 stages; hall shell and assembly function may activate before advanced stage equipment/decor.                                                   |
| **Upgrade, inheritance and branch links**            | Grand theatre, museum/gallery, civic complex, festival precinct or capital cultural wonder.                                                        |
| **Planner triggers and failure states** | Selected after basic needs stabilise or when culture/story/tourism demands rise. Provides little benefit if permanently unstaffed or inaccessible. |
| **Restricted player-creator validation**         | Must satisfy crowd, exit, stage/focal and service requirements; player design may choose theatre, gallery, lecture hall or mixed cultural profile. |
| **Pack and style resolution**         | Amphitheatre, clan saga hall, masked theatre, music court, memory gallery, dream theatre and floating performance arena.                           |## 24.1 v1.0 Community / Social Ownership Note

Community, hospitality and culture entries supply:

- valid venue;
- capacity;
- scheduling opportunity;
- guest/service positions;
- public/private access;
- event-support infrastructure.

Set 28 owns:

- whether people attend/agree;
- Trust/Loyalty;
- relationship change;
- dialogue/social memory.

Document 13 owns cultural/political meaning.

Set 27 owns commercial hospitality transactions.

Therefore a completed tavern, shrine, festival ground or theatre cannot directly set social relationship values.

# 25. Archived Validation Scope

The former `Legacy POC Provenance`, `Legacy Forest-Hamlet Expansion Provenance`, `Legacy Alpha Provenance` and `Legacy Beta Provenance` delivery labels no longer control production scope.

They remain provenance.

## 25.1 Archived Forest-Hamlet Domestic-Service Fixture

The old fixture may continue to validate generic capabilities such as:

- Campfire Site;
- Small Tent;
- Small Cottage;
- Basic Farm Plot;
- Communal Kitchen;
- Granary;
- Healer Hut;
- Small Shrine/Community Hall;
- Barn/Farmhouse;
- related damage/repair and settlement pressure.

## 25.2 What Is Archived

Normal production does not require:

- Forest Hamlet;
- fixed named villagers;
- fixed watchtower/raid chain;
- fixed cottage;
- fixed farm;
- fixed resource sites;
- fixed progression timing.

## 25.3 What Is Preserved

Preserve:

- real Housing capacity;
- real food production/stock;
- real clinic/treatment capacity;
- real community venue capacity;
- real construction;
- real NPC use;
- damage/repair;
- save/LOD;
- generated settlement applicability.

## 25.4 Production Acceptance Lock

Every retained generic function must work in a seed-generated settlement or player-founded settlement without requiring POC identities.

# 26. Simulation LOD, Persistence and Multiplayer Authority

20A service state can simplify at distance without changing truth.

## 26.1 Local Detail

Nearby simulation may show:

- residents entering homes;
- meal-service use;
- cooks/farmers working;
- patients arriving;
- treatment-room occupancy;
- animals using stable/paddock areas;
- public/community events;
- visitors using hospitality services.

## 26.2 Distant Summary

Distant simulation may aggregate:

- housing occupancy/capacity;
- provision production/consumption flow;
- reserve bands;
- facility treatment throughput;
- emergency/refuge occupancy;
- livestock-facility support;
- community-event usage summaries.

## 26.3 Persistent Minimum

Persist/reference as required:

- StructureInstance ref;
- function/service record;
- source blueprint version;
- dwelling/service capacities;
- resident/household refs rather than copies;
- authoritative stock refs rather than duplicate totals;
- facility queue/reservation refs;
- damage/condition evidence;
- active emergency mode;
- important event/history refs;
- source revisions.

## 26.4 LOD Invariants

LOD cannot:

- invent a resident;
- reassign a household without owner action;
- create food;
- remove Hunger/Nutrition state;
- heal an injury/disease;
- manufacture medicine;
- create Trust;
- generate fish from a depleted source;
- turn an inaccessible building into an accessible one;
- repair damage.

## 26.5 Multiplayer Authority

Host/server authority commits:

- ConstructionProjects;
- structure edits;
- resource reservations/transactions;
- building service activation;
- public player-blueprint admission.

Document 07 owns person/household state.

Sets 27–30 own their respective economic/social/biological/movement state.

Clients may predict presentation but cannot create service capacity or biological/social outcomes through visual state.

# 27. Balancing, Diagnostics and Anti-Exploit Rules

## 27.1 Balance Principles

- Early domestic buildings remain useful after expansion.
- Large buildings gain efficiency/capacity but incur larger cost, route and maintenance exposure.
- Mixed-use structures trade density for complexity.
- Emergency buildings are valuable without becoming mandatory permanent housing.
- Food security rewards diversity/resilience without requiring daily player micromanagement.
- Care facilities matter without erasing injury/disease consequence.
- Community facilities provide bounded opportunity rather than passive infinite Morale.
- Cultural equivalents remain valid when they satisfy the same function.

## 27.2 Anti-Exploit Rules

- Visual floor area does not grant Housing.
- Bed-marker spam does not create unlimited capacity.
- One bed cannot count simultaneously as permanent housing, guest lodging and treatment recovery.
- A painted/decorative farm does not produce food.
- A granary does not create stock.
- A fishery does not create fish without valid ecology/harvest source.
- A clinic does not directly edit Health.
- A community building does not directly edit Trust/Loyalty.
- Player blueprints cannot invent new semantic markers/functions.
- Construction uses canonical Blocks and real Items; no fake block-item duplicates.
- Distant simulation cannot create free outputs.

## 27.3 Diagnostic Families

Use reason-coded diagnostics for:

- Housing suitability;
- food source/input/output;
- livestock support;
- health-facility staffing/supplies/cleanliness;
- community capacity/egress/profile;
- player blueprint validation;
- source/stage/state migration;
- resource conservation;
- external-snapshot freshness;
- movement access;
- social permission;
- biological ownership violations;
- maritime/fish-source binding.

# 28. Godot + Summer Engine Implementation Direction

Document 18 v1.0 is the technical authority.

20A defines logical records and interfaces, not exact repository paths.

## 28.1 Logical Definition / Record Types

Implementation may require equivalents of:

- `BuildingFunctionDefinition20A`
- `HousingSuitabilityProfile`
- `ProvisionServiceProfile`
- `LivestockFacilityProfile`
- `HealthFacilityProfile`
- `CommunityFacilityProfile`
- `BuildingServiceRecord`
- `FacilityQueueOrReservation`
- `ServiceEvidenceSnapshot`
- 20A semantic marker/zone/socket profiles

Exact class/resource names require repository mapping.

## 28.2 Service Ownership

- Building/Function service owns 20A capacity/activation.
- Document 07 owns resident/household/job records.
- Inventory/Recipes own stock and transformations.
- Set 27 owns economy.
- Set 28 owns social state/consent.
- Set 29 owns biological state/treatment outcomes.
- Set 30/26 owns physical movement/access.
- Document 10/26M owns creature/marine ecology.
- Document 12 owns StructureInstance condition/history.
- Document 19 owns settlement planning.
- Document 20 owns ConstructionProject.
- Event systems own event history/quest consequences where applicable.

## 28.3 Event-Driven Evaluation

Recalculate a service when relevant revisions change:

- structure condition;
- marker/zone validity;
- stock;
- staff;
- route/access;
- utility;
- authority;
- biological demand;
- social permission;
- ecology source;
- emergency state.

Do not recalculate every building every frame.

## 28.4 SceneTree Boundary

Godot Nodes may represent:

- visible beds;
- workstations;
- patients;
- crowds;
- animals;
- doors;
- facility UI.

Persistent service truth survives Node unload.

## 28.5 Summer Engine

Summer Engine may assist with:

- schemas;
- validators;
- migration;
- tests;
- source audits;
- diagnostics.

It does not decide production ownership or publish canonical content without review.

# 29. Open Questions for Later Balancing

The following remain balance/content decisions rather than architecture gaps:

- final resident/footprint ranges for each housing definition;
- communal-living/privacy preferences per approved culture pack;
- final food-production rates and seasonal curves;
- exact reserve-day targets by Simulation Depth/difficulty/world rules;
- clothing/fuel contribution beneath Provisions without extra need bars;
- settlement meal-service batching granularity;
- guest demand/tourism scaling;
- treatment-slot and recovery-bed capacities;
- facility staffing ratios;
- Set-29 treatment-duration/outcome tuning;
- district travel thresholds for care/community/food;
- community-event frequency and capacity;
- animal facility occupancy by creature profile;
- fishery capacity versus Set-26 marine stock/seasonality;
- magical food/care/housing upgrades versus pack replacements;
- historical household/memorial archival depth;
- exact Set-25 Core Required/Core Conditional classification for 20A definitions during 20H v1.0 reconciliation.

These questions do not reopen the ownership boundaries locked above.

# Appendix A — 20A Functional Definition Field Template

| Field Group | Required Fields |
|---|---|
| Identity | `catalogue_no`, `stable_id`, `display_name_key`, family/category, owner, definition version, aliases. |
| Lifecycle | Set-25 production status, legacy provenance, prerequisites, upgrade/branch links, world/profile gates. |
| Needs / Service | Primary/secondary need, capacity type, activation profile, demand evidence refs, coverage/access rules and blockers. |
| Operation | Staff roles, inputs/outputs, recipe refs, stock endpoints, utilities, maintenance and emergency modes. |
| Semantic Contract | Required/optional markers, zones, sockets, entity envelopes and validator profile. |
| Source | Blueprint source profile, material roles, stages, state/damage deltas, placement profile. |
| Construction | Stage requirements, Block/Item refs, labour, commissioning, repair/conversion/demolition continuity. |
| External Interfaces | Document-07 people, Set-27 economy, Set-28 social, Set-29 biology, Set-30 movement, Set-26 maritime/ecology. |
| Runtime | Service record, persistent refs, revisions, LOD summary and evidence links. |
| Presentation | UI category, reason codes, warnings, knowledge/freshness and accessibility. |
| Production | Source status, bake status, gameplay/test/balance/migration state and evidence. |

# Appendix B — 20A Semantic Contract Matrix

| **Family** | **Required Markers** | **Required Zones** | **Common Sockets** | **Critical State Checks** |
|---|---|---|---|---|
| Temporary shelter | Entrance, temporary sleep, household anchor. | Protected interior, private circulation. | Footpath, optional heat. | Wet/collapsed, unsafe fire, blocked entrance. |
| Permanent housing | Entrance, permanent beds, household anchor, personal storage. | Habitable room, private route. | Footpath, water/heat where expected, upgrade. | Roof/shell, fire, contamination, occupation. |
| Farm | Work/tool, cultivated/harvest markers. | Cultivated parcel, service route. | Water, storage output, farm module. | Season, water, soil, access, blight/damage. |
| Food processing | Workstation, input/output, operator, maintenance. | Clean/hot/dirty as required. | Storage, water, fuel/power, waste. | Input starved, output blocked, unsafe, contaminated. |
| Livestock | Creature occupancy, feed, water, handler. | Animal work/enclosure, human service route. | Route, storage, enclosure module. | Feed/water, breach, incompatible creature, disease. |
| Health | Treatment, recovery, medicine, staff. | Treatment/recovery, clean/dirty, emergency route. | Water, sanitation, emergency supply, mana if used. | Overload, contamination, no staff/medicine, unsafe access. |
| Community | Gathering, focal/speaker/performer as profile requires. | Public gathering, service/backstage if used. | Public route, service delivery, temporary event modules. | Capacity, egress, compatibility, occupation/damage. |

# Appendix C — Production Acceptance Checklist

- Seven needs remain exactly Housing, Provisions, Health, Work, Safety, Infrastructure and Morale.
- 20A Housing capacity is separated from Document-07 household/residence identity.
- Permanent Housing fails when bed/habitable/access/climate/permission/safety contracts fail.
- Provisions remains resource-conserving and cannot edit Set-29 Hunger/Nutrition directly.
- Farm/fishery output requires valid source relationships.
- Fishery/Fishing Dock consumes Set-26 marine ecology/port interfaces where applicable.
- Granary modifies storage/reserve security rather than creating food.
- Health facilities provide capacity only; Set 29 owns treatment/biological outcome.
- Community facilities provide opportunity/capacity only; Set 28 owns Trust/relationship outcomes.
- Player blueprints use existing approved functions/semantics and cannot create new service types.
- Construction uses canonical Blocks/Block Inventory Projections and genuine distinct Items.
- Damage/repair affects only valid semantic regions where supported.
- LOD preserves people, stock, biological state, social state, service history and physical damage.
- Multiplayer authority prevents client-created capacity/resources/outcomes.
- Legacy POC/Legacy Alpha Provenance/Legacy Beta Provenance labels are provenance only.
- All retained generic functions operate in non-POC generated settlements.

# Appendix D — Cross-System Dependency Matrix

| 20A System | External Owners | Primary Exchange |
|---|---|---|
| Housing | 07, 12, 13, 29, 30 | Dwelling suitability/capacity ↔ resident/residence, structure, permission, shelter-biology and movement facts. |
| Food production | 04–06, 08, 10/26M, 27, 29, 30 | Source/recipe/stock/logistics/economy/nutrition/access evidence. |
| Food processing / reserve | 05, 08, 20D, 27, 29 | Transactions, stock, storage, import/economic context, biological demand. |
| Livestock facilities | 10, 29, 30 | Creature/herd refs, support capacity, biology and movement. |
| Health facilities | 07, 28, 29, 30, 20D | Staff assignment/willingness, patient/treatment need/outcome, access, sanitation/water. |
| Community / hospitality | 13, 15, 27, 28, 30 | Cultural/event/economic/social/access evidence. |
| Official sources | 22I, 25, 18 | Source ID/version, semantics, stages, pack/lifecycle/validation. |
| Player sources | 19, 25 | Player blueprint revision, validation, dependencies and admission state. |
| Projects | 19, 20, 07, 27–30 | Proposal → ConstructionProject → labour/economy/social/biology/movement evidence. |
| Maritime fishery | 10, 26J/26M, 27, 29, 30 | Ecology/catch source, port service, trade, nutrition demand and access. |

# Appendix E — Validation and Diagnostic Code Catalogue

| **Code** | **Severity** | **Meaning** |
|---|---|---|
| `20A-HOUSING-NO-HABITABLE-ZONE` | Error | A permanent bed is not inside a valid habitable zone. |
| `20A-HOUSING-ENTRANCE-BLOCKED` | Error | An assigned dwelling unit has no compatible reachable entrance. |
| `20A-HOUSING-BED-CONFLICT` | Error | One bed/place is assigned to incompatible or multiple active uses. |
| `20A-HOUSING-CLIMATE-FAIL` | Error | The dwelling does not meet current biome/stage protection requirements. |
| `20A-FOOD-SOURCE-UNBOUND` | Error | Farm or fishery has no valid world/terrain/ecology binding. |
| `20A-FOOD-INPUT-MISSING` | Warning/Error | A processing or service cycle lacks required conserved input. |
| `20A-FOOD-OUTPUT-BLOCKED` | Warning | Output buffer or authorised route cannot accept production. |
| `20A-FOOD-CONTAMINATED` | Error | Stock or service zone fails contamination safety. |
| `20A-LIVESTOCK-ENVELOPE-FAIL` | Error | Creature profile does not fit route, occupancy or interaction markers. |
| `20A-LIVESTOCK-BREACH` | Warning/Error | Enclosure integrity or access control has failed. |
| `20A-HEALTH-NO-STAFF` | Error | Minimum eligible treatment staff are unavailable. |
| `20A-HEALTH-NO-MEDICINE` | Warning/Error | Required treatment supply is unavailable. |
| `20A-HEALTH-CLEAN-ROUTE-FAIL` | Error | Care profile lacks required clean/dirty separation or sanitation. |
| `20A-HEALTH-OVERLOADED` | Warning | Current patient demand exceeds safe staffed capacity. |
| `20A-COMMUNITY-EGRESS-FAIL` | Error | Public capacity exceeds safe accessible exits/routes. |
| `20A-COMMUNITY-PROFILE-MISSING` | Warning/Error | No valid community/culture function is assigned. |
| `20A-SOURCE-STAGE-GAP` | Error | Construction stage graph omits a required functional element transition. |
| `20A-SOURCE-STATE-ORPHAN` | Error | A state delta references a missing stable source element. |
| `20A-RUNTIME-SOURCE-MIGRATION` | Error | A placed instance cannot resolve its stored source/version migration. |
| `20A-RESOURCE-CONSERVATION` | Fatal | A transaction creates, duplicates or deletes authoritative stock without a valid rule. |Additional v1.0 codes:

| Code | Severity | Meaning |
|---|---|---|
| `20A-HOUSING-RESIDENCE-OWNER-VIOLATION` | Fatal | 20A attempted to own/replace Document-07 resident/household truth. |
| `20A-HEALTH-BIOLOGY-OWNER-VIOLATION` | Fatal | 20A attempted to commit Set-29 biological/treatment outcome directly. |
| `20A-COMMUNITY-SOCIAL-OWNER-VIOLATION` | Fatal | Building/community logic attempted to set Set-28 Trust/relationship state directly. |
| `20A-PROVISIONS-NUTRITION-OWNER-VIOLATION` | Fatal | Provision service attempted to mutate Set-29 hunger/nutrition directly. |
| `20A-MOVE-ACCESS-STALE` | Warning/Error | Required Set-30/26 access evidence is stale or invalid. |
| `20A-FISHERY-SOURCE-INVALID` | Error | Fishery has no valid ecology/harvest source or specialist marine binding. |
| `20A-BLOCKITEM-DUPLICATE` | Fatal | Construction/source references a duplicate fake Item for a recoverable Block. |
| `20A-POC-LEAK` | Fatal | Active production definition depends on retired Forest-Hamlet/POC identity. |

# Appendix F — v1.0 Ownership Quick Reference

```text
20A:
    dwelling/service capacity
    food-service / reserve facility capacity
    livestock-facility capacity
    healthcare-facility capacity
    community/hospitality facility capacity

Document 07:
    people
    households
    residences
    jobs
    labour availability

Set 27:
    prices
    purchases
    wages
    contracts
    imports
    finance

Set 28:
    consent
    willingness
    Trust / Loyalty
    relationships
    dialogue
    social assignment

Set 29:
    Hunger / Hydration / Nutrition
    Health
    injury
    disease / toxin
    treatment
    biological outcome

Set 30 / 26:
    physical accessibility
    journey / path
    arrival
    specialist aquatic/vessel movement

Document 10 / Set 26M:
    creature / marine ecology
    populations
    husbandry eligibility
    fish source truth

Document 19:
    settlement planner
    parcels / districts
    project proposal
    growth readiness

Document 20:
    function activation
    authoritative ConstructionProject

Document 12:
    persistent StructureInstance
    physical damage / restoration
```

---

# Supersession and Preservation Notes

## Preserved from v0.2

- all protected 20A stable IDs/catalogue numbers;
- Housing/Provisions/Health/Morale-facing building families;
- semantic marker/zone/socket architecture;
- suitable-housing validation;
- provision/reserve design;
- livestock-facility design;
- healer/clinic/quarantine design;
- community/hospitality/cultural design;
- Blueprint Forge source requirements;
- restricted player blueprint support;
- staged construction/commissioning;
- partial activation;
- upgrades/conversions;
- damage/repair/restoration;
- LOD/persistence/multiplayer principles.

## Reconciled in v1.0

- planner ownership → Document 19;
- ConstructionProject/function activation → Document 20;
- StructureInstance → Document 12;
- households/residence/jobs → Document 07;
- economy → Set 27;
- social → Set 28;
- biology/treatment/nutrition → Set 29;
- movement/access → Set 30/26;
- fishery marine ecology/port interfaces → Set 26/Document 10;
- Block/Item identity → FR-00-20-006;
- technical implementation → Document 18;
- production lifecycle → Set 25 / final 20H v1.0 audit.

## Archived

- Forest Hamlet as mandatory context;
- active POC/Legacy Alpha Provenance/Legacy Beta Provenance/Extended-Slice delivery scope;
- any implication that a clinic owns patient Health;
- any implication that a community building directly owns Trust;
- any implication that 20A owns settlement-wide planner selection.

---

# Production Acceptance Criteria

Document 20A v1.0 is accepted when:

- [x] all original 20A functional families are preserved unless explicitly superseded;
- [x] seven-needs lock is preserved;
- [x] Housing capacity and household identity are separated;
- [x] Provisions and Set-29 nutrition biology are separated;
- [x] Health-facility capacity and Set-29 treatment outcome are separated;
- [x] Community capacity and Set-28 social state are separated;
- [x] planner ownership is handed to Document 19;
- [x] ConstructionProject ownership is handed to Document 20;
- [x] StructureInstance ownership is handed to Document 12;
- [x] canonical Block/Item rule is applied;
- [x] Set-27 economy boundaries are explicit;
- [x] Set-30 movement/access boundaries are explicit;
- [x] Set-26 fishery/maritime boundaries are explicit;
- [x] legacy POC/Legacy Alpha Provenance/Legacy Beta Provenance labels are provenance only;
- [x] stable IDs/catalogue numbers remain protected pending 20H v1.0;
- [x] LOD cannot fabricate food, treatment, households, Trust or accessibility;
- [x] Godot/Summer implementation uses Document 18 v1.0.

---

# Completion Statement

**Document 20A v1.0 reconciles Leyforge's domestic settlement infrastructure with the production ownership model without discarding the strong v0.2 functional registry.**

A house can provide **Housing capacity** without owning the household.

A granary can provide **food-security capacity** without editing Hunger.

A clinic can provide **treatment capacity** without editing Health.

A community hall can provide **social opportunity** without manufacturing Trust.

A fishing dock can support **Provisions** without spawning fish from an empty sea.

And every one of those functions can remain meaningful when the structure is damaged, distant, rebuilt, player-designed, culturally reskinned or used inside a much larger settlement.

**Next Document Set 20 reconciliation: 20B — Work, Extraction, Crafting, Trade and Education.**
