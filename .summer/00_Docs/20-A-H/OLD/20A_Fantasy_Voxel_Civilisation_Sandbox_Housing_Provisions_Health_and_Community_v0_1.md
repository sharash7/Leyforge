**Fantasy Voxel Civilisation Sandbox**

**20A - Housing, Provisions, Health and Community**

**Version 0.1 - Detailed Building Family and Service Registry Draft**

*A controlled registry for homes, food production, livestock support, healthcare, welfare, hospitality, culture and community projects, using the seven-needs model without turning settlement life into constant micromanagement.*

| **Field**                  | **Locked Direction**                                                                                                                                                            |
|----------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Document Scope             | Detailed rules and registry entries for catalogue definitions 1-2, 4-22 and 24-30 from Document 20H, plus cross-document service dependencies.                                  |
| Needs Lock                 | Only Housing, Provisions, Health, Work, Safety, Infrastructure and Morale are main settlement needs. This document does not create new top-level needs.                         |
| Primary Focus              | Housing, food production and reserves, livestock support, healthcare, emergency welfare, hospitality, culture and community life.                                               |
| Player Blueprint Direction | Every eligible family can accept approved player-made blueprints from the in-world designer or main-menu Blueprint Workshop when functional validation passes.                  |
| NPC Growth Direction       | Settlements choose required, optional and conditional projects from eligible pools according to stage, shortage, capacity, terrain, culture, risk and available resources.      |
| Simulation Direction       | Nearby residents and buildings act visibly; distant settlements use conserved resource totals, capacities, service states and event summaries.                                  |
| POC Direction              | Prove Camp to Village with campfire, tent, hut/cottage, farmhouse, farm plot, barn, granary, communal kitchen, healer hut and community hall, linked to water/storage from 20D. |
| Balance Direction          | Use readable capacity bands and service states. Exact block costs come from approved voxel blueprints; exact production values remain balance drafts.                           |

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr class="header">
<th><p><strong>Locked Scope Rule</strong></p>
<p>A building may contribute to several needs, but it does not create a new need meter. Food variety, privacy, sanitation, culture goods, guest lodging, livestock welfare and seasonal reserves are sub-calculations, service modifiers or event conditions under the seven-needs model.</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

# Document Purpose

Document 20A turns the universal catalogue into implementable building-family rules for the domestic and social side of settlement life. It defines what counts as valid housing, how food capacity and reserves are represented, how health services operate, how community buildings influence morale, and how player-created voxel blueprints can safely replace developer layouts without bypassing function, resource or settlement rules.

The goal is depth without routine micromanagement. NPCs should eat, sleep, recover, work, gather and socialise visibly, but the player responds to shortages, projects, opportunities and emergencies rather than distributing every meal, approving every bed or scheduling every bath.

# Design Sources and Dependencies

| **Source**                                                 | **20A Dependency**                                                                                                                             |
|------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------|
| 07 - NPC Village System                                    | Named residents, households, real consumption, jobs, schedules, warehouses, projects, morale, health, migration and near/far simulation.       |
| 12 - Structures                                            | Blueprint volumes, material palettes, functional markers, placement rules, dynamic states, repair and restoration.                             |
| 19 - Settlement Growth and Player Voxel Blueprint System   | Two player creation modes, shared blueprint format, validation, construction stages, material tokens, project records and settlement planning. |
| 20 - Buildings, Facilities and Settlement Project Registry | Seven-needs lock, shared building schema, stage rules, project selection and companion ownership.                                              |
| 20H - Detailed Building Catalogue and Stage Matrix         | Stable catalogue numbers, IDs, stage ownership, status and POC roster.                                                                         |
| 20B / 20D / 20E / 20F / 20G                                | Workplace modules, water/storage/utilities, magical branches, large complexes and culture-specific variants.                                   |

# Static Table of Contents

- 1\. Locked 20A Identity

- 2\. Scope Boundaries and Anti-Micromanagement Rules

- 3\. Seven-Needs Integration

- 4\. Shared Capacity and Service Model

- 5\. Building Runtime and Activation States

- 6\. Housing System Rules

- 7\. Provisions and Food-System Rules

- 8\. Livestock and Animal-Support Rules

- 9\. Health, Welfare and Emergency Rules

- 10\. Community, Culture, Hospitality and Morale

- 11\. NPC Planner and Project Selection

- 12\. Player Blueprint Validation

- 13\. Construction, Resources, Repair and Upgrades

- 14\. Settlement-Stage Expectations

- 15\. Detailed Registry Summary

- 16\. Temporary and Residential Entries

- 17\. Farming, Food and Livestock Entries

- 18\. Health and Welfare Entries

- 19\. Community, Culture and Hospitality Entries

- 20\. POC Implementation Scope

- 21\. Balancing and Simulation LOD

- 22\. Open Questions for Later Balancing

- Appendix A. 20A Data Field Template

- Appendix B. POC Acceptance Checklist

- Appendix C. Cross-System Dependency Matrix

# 1. Locked 20A Identity

Document 20A is the household, sustenance, care and community layer of the building registry. Its buildings make population growth physically believable: residents need valid homes; food must be produced, processed and stored; injuries require care; crises require shelter; and settlements need shared places that create identity and social stability.

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr class="header">
<th><p><strong>Locked Rule</strong></p>
<p>A 20A building must provide a measurable capacity, service, production role, household function, event space or settlement consequence. Pure decoration remains a blueprint/style component and does not become a separate universal registry entry.</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

| **Identity Layer**   | **Design Meaning**                                                                                           | **Player-Facing Result**                                                                                 |
|----------------------|--------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------|
| Household Foundation | Valid beds, household compatibility, climate protection and access create real housing capacity.             | Population growth, migration and family life depend on built homes rather than abstract population caps. |
| Sustenance Chain     | Farms, kitchens, mills, granaries and preserving facilities transform real resources into stable provisions. | Food supply becomes visible and can be helped, traded, automated or disrupted.                           |
| Care and Recovery    | Healers, clinics and emergency shelters provide treatment and crisis response.                               | Raids, disease, disasters and corruption create consequences with understandable responses.              |
| Community Identity   | Halls, shrines, inns, festivals, memorials and theatres create social and cultural life.                     | Morale is influenced by events and access rather than a mandatory entertainment treadmill.               |
| Player Expression    | Approved player blueprints can fulfil the same functional definitions.                                       | Players can design their own town style without breaking NPC logic or progression.                       |
| Scalable Simulation  | Detailed behaviour near the player and summary capacity at distance share the same conserved state.          | Large cities remain feasible without simulating every meal and footstep everywhere.                      |

# 2. Scope Boundaries and Anti-Micromanagement Rules

| **Included**                                                                                                                 | **Handled as a sub-calculation or linked system**                                                                                         | **Explicitly not a routine need**                                                                                                                    |
|------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------|
| Homes, beds, household assignment, food, water access, fuel, health care, emergency housing, community and culture services. | Privacy, food variety, sanitation, clothing basics, animal welfare, guest beds, mourning, festivals, seasonal reserves, service coverage. | Individual thirst, bathroom urgency, hygiene bars, nutrient macros, room beauty meters, daily manual meal distribution, daily manual bed assignment. |
| Real item consumption and production at conserved settlement totals.                                                         | Visible nearby collection/eating/working; batched household or settlement transactions; distant daily summaries.                          | One inventory transaction for every bite or every distant NPC path.                                                                                  |
| Building capacities, staff, inputs, access, utilities and damage.                                                            | District aggregation, warehouse links, job assignments, event schedules and culture compatibility.                                        | A unique need system or UI meter for every building family.                                                                                          |

- Ordinary daily life is NPC-managed. The player sees shortages, blockers, active projects and emergencies.

- A settlement is not penalised for services that its stage, culture, biome or world settings do not yet expect.

- Community buildings create opportunities and event capacity; they do not demand constant player-supplied entertainment.

- Exact voxel counts and final material costs are generated from approved blueprints, not hard-coded into the universal family entry.

- Capacity comes from functional markers and valid rooms, not from a building name or decorative shell.

# 3. Seven-Needs Integration

| **Need**       | **20A Role**                                                                                                     | **Key Sub-Calculations**                                                                            | **Not a Separate Need**                                                     |
|----------------|------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------|
| Housing        | Primary owner of residential capacity.                                                                           | Suitable beds, households, climate, access, damage, spare capacity and overcrowding.                | Privacy, furnishing quality, heating and guest rooms.                       |
| Provisions     | Primary owner of food production, processing, reserve life and some animal supply.                               | Food balance, reserve days, water access dependency, fuel, preservation, variety and seasonal risk. | Food, water, fuel, clothing and winter stock as separate bars.              |
| Health         | Primary owner of treatment, recovery and emergency isolation; depends on 20D sanitation/water and 20E cleansing. | Patients, staff, beds, medicine, clean access, outbreak load and recovery.                          | Hygiene, medicine, sanitation and corruption care as separate main needs.   |
| Work           | Secondary role through farm, kitchen, mill, healer, hospitality and culture jobs.                                | Staffing, tools, inputs, skill and job-site access.                                                 | Employment, tools and specialists as separate main needs.                   |
| Safety         | Secondary role through shelter, safe food, emergency spaces and assembly routes.                                 | Fire, evacuation, isolation, weather protection and public capacity.                                | Fire safety, shelter and quarantine as separate main needs.                 |
| Infrastructure | Dependency on storage, roads, water, drainage, power and district coverage.                                      | Access, utilities, service reach and maintenance.                                                   | Water, sanitation, power and roads as separate need bars.                   |
| Morale         | Primary owner of community/event capacity and secondary outcome of housing, food and health stability.           | Community access, culture compatibility, events, mourning, hospitality and recent history.          | Fun, beauty, spirituality, socialising and entertainment as separate needs. |

# 4. Shared Capacity and Service Model

The player-facing overview uses readable states - Thriving, Stable, Strained, Critical and Collapsed - while the simulation keeps capacity and cause data underneath. Percentages may appear in detailed screens, but the normal village view prioritises causes and trends.

| **Model**          | **Calculation Direction**                                                                                      | **Player-Facing Example**                                              |
|--------------------|----------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------|
| Housing capacity   | Valid suitable beds and household slots compared with residents, modified by access, climate and damage.       | Housing: Strained - 42 residents / 38 suitable beds.                   |
| Provision security | Net food flow plus usable reserve days, water reliability, fuel and seasonal modifiers.                        | Provisions: Stable - 11 days food, water secure, winter fuel low.      |
| Health coverage    | Treatment and recovery capacity compared with current patient load, staff, medicine and sanitation conditions. | Health: Stable - one injured, healer available, six treatments stored. |
| Community coverage | Accessible gathering/event capacity, culture compatibility and recent event use, not passive building count.   | Morale: Improving - harvest feast completed; community hall available. |
| Building service   | Minimum required staff, inputs, markers, access and utilities must pass before output is credited.             | Kitchen paused - water unavailable; granary functional - 72% full.     |

## 4.1 Default Provision Reserve Bands

| **Settlement Stage** | **Default Reserve Target**              | **Purpose**                                                           |
|----------------------|-----------------------------------------|-----------------------------------------------------------------------|
| Camp                 | 1-2 days                                | Survive immediate weather and travel interruption.                    |
| Hamlet               | 3-5 days                                | Cover short crop, hunting or delivery gaps.                           |
| Village              | 7-10 days                               | Support seasonal planning and minor threats.                          |
| Fortified Village    | 10-14 days                              | Withstand raids or temporary isolation.                               |
| Town                 | 14-21 days                              | Support denser population and trade disruption.                       |
| City                 | 21-30 days                              | Provide district resilience and larger emergency stock.               |
| Capital              | 30-45 days                              | Support political, military and regional obligations.                 |
| Magical Metropolis   | 45-60 days or equivalent secured supply | Account for realm logistics, magical risks and very large population. |

These are balance-draft targets, scaled by difficulty, season length, trade reliability, preservation technology and world settings. They do not require the player to manually stock every household.

# 5. Building Runtime and Activation States

| **State**          | **Meaning**                                                        | **Need Contribution**                                              |
|--------------------|--------------------------------------------------------------------|--------------------------------------------------------------------|
| Planned            | Approved site and ghost blueprint; resources may be reserved.      | No normal service yet.                                             |
| Under Construction | Stages are being supplied and built.                               | Only explicitly inspected partial functions count.                 |
| Functional         | Minimum markers, access, staff and required inputs/utilities pass. | Provides current capacity/service.                                 |
| Limited            | A non-critical blocker reduces output or suitability.              | Partial contribution with visible cause.                           |
| Paused             | Missing staff, input, power, water or output capacity.             | No production; existing housing/storage may remain usable if safe. |
| Damaged            | Structure is usable only if critical rooms/routes remain valid.    | Reduced capacity or risk penalty.                                  |
| Unsafe             | Fire, collapse, contamination, corruption or evacuation failure.   | Contribution suspended; residents/patients should relocate.        |
| Abandoned          | No owner/use and no maintained service.                            | No normal contribution; may become restoration project.            |
| Ruined             | Critical shell/function destroyed.                                 | No contribution until restored or replaced.                        |

# 6. Housing System Rules

- A bed counts only when reachable, inside a safe climate-appropriate space and assignable to a compatible resident or household.

- Housing quality changes suitability and morale but does not create dozens of independent comfort meters.

- Guest beds, worker beds, quarantine beds, recovery beds and permanent household beds are distinct marker types.

- Overcrowding is allowed as a temporary strain state; it should not instantly evict NPCs or stop all work.

- Mixed-use buildings must separate public/work hazards from private household routes.

- Player blueprints can substitute for developer homes when they pass the same capacity, access, fire and household validation.

| **Housing Factor**      | **Calculation**                                                           | **Typical Response**                                            |
|-------------------------|---------------------------------------------------------------------------|-----------------------------------------------------------------|
| Suitable capacity       | Valid household beds and units.                                           | Build or approve homes; repair invalid rooms.                   |
| Household compatibility | Family/relationship/culture profile and privacy rules.                    | Reassign household or choose suitable blueprint.                |
| Climate protection      | Weatherproofing, insulation/heat/cooling expectations by biome and stage. | Repair shell, add heat or use adapted palette/variant.          |
| Access and safety       | Doors, paths, vertical routes, fire/evacuation and local hazards.         | Clear route, add exit, repair stairs or move residents.         |
| Spare capacity          | Unused suitable beds/units.                                               | Supports migration and births; avoids forced emergency shelter. |
| Damage and maintenance  | Roof/wall/utility state.                                                  | Automatic repair project or player assistance.                  |

# 7. Provisions and Food-System Rules

Provisions is a settlement-level security category. Food items remain real and conserved, but consumption can be batched by household or daily settlement tick. Water, fuel, clothing basics and seasonal stock remain visible details inside Provisions rather than separate top-level needs.

1.  Produce or import raw food and essential supplies.

2.  Move them through accessible storage and logistics.

3.  Process or cook them where appropriate.

4.  Reserve protected stock for daily use, projects and emergencies.

5.  Consume through batched household or service transactions.

6.  Apply spoilage, preservation, shortage, season and event modifiers.

7.  Generate clear requests, project priorities and trade opportunities from the result.

| **Food Role** | **Building Families**                                         | **What Is Calculated**                                                     |
|---------------|---------------------------------------------------------------|----------------------------------------------------------------------------|
| Production    | Farm plots, irrigated farms, fisheries, livestock facilities. | Yield, season, labour, water, tools, ecology and damage.                   |
| Processing    | Kitchen, millhouse, bakery, preserving house.                 | Inputs, recipe, staff, fuel/power, throughput and output.                  |
| Reserve       | Granary and linked 20D storage.                               | Protected capacity, spoilage risk, access, reservation and days of supply. |
| Distribution  | Kitchen collection, inn, market and warehouse routes.         | Access, travel, schedule and blocked logistics.                            |
| Resilience    | Preservation, diversified sources, trade and emergency stock. | Shortage risk, season, route interruption and event response.              |

# 8. Livestock and Animal-Support Rules

- Livestock and mounts require capacity, feed, water, access and appropriate enclosure, but animal welfare is not a new main settlement bar.

- Pens and stables can contribute to Provisions, Work and Infrastructure according to the animal profile.

- Breeding, taming, magical creatures and veterinary depth remain linked systems; 20A defines the facility-facing requirements.

- Distant simulation tracks animal totals, feed, health events and production summaries rather than individual pathfinding.

# 9. Health, Welfare and Emergency Rules

| **Layer**              | **Rule**                                                                                                      |
|------------------------|---------------------------------------------------------------------------------------------------------------|
| Routine care           | Healer access, medicine and recovery capacity handle ordinary injuries and illness events.                    |
| Prevention             | Safe food, water and sanitation modify risk through linked systems; no individual hygiene meter is required.  |
| Outbreak/disaster      | Conditional shelters and quarantine activate only when relevant, reducing spread or exposure.                 |
| Overload               | Patients beyond treatment capacity receive slower recovery and higher risk; the UI identifies the bottleneck. |
| Magical harm           | Cleansing and corruption services link to 20E rather than duplicating magical systems in 20A.                 |
| Permanent consequences | NPC death, disability, migration and mourning follow world settings and the NPC Village System.               |

# 10. Community, Culture, Hospitality and Morale

Morale is derived first from stability in the other needs and recent events. Community facilities add identity, gathering capacity, rituals, hospitality, remembrance, performances and positive events. They are not a treadmill that forces the player to place entertainment buildings at fixed intervals.

| **Community Function**          | **Universal Profile**           | **Culture-Specific Expression**                                                   |
|---------------------------------|---------------------------------|-----------------------------------------------------------------------------------|
| Assembly and identity           | Small shrine or community hall. | Temple, ancestor hall, civic lodge, spirit grove or secular meeting house.        |
| Hospitality and visitors        | Tavern or inn.                  | Tea house, feast lodge, caravanserai, bath inn or traveller sanctuary.            |
| Celebration and flexible events | Festival/community grounds.     | Market green, dance ring, ritual meadow, amphitheatre court or floating platform. |
| Mourning and memory             | Memorial/cemetery.              | Graves, cremation garden, ancestor wall, spirit forest or memory crystal archive. |
| Performance and culture         | Cultural hall/theatre.          | Saga hall, theatre, museum, music court, dream stage or lecture hall.             |

# 11. NPC Planner and Project Selection

| **Project Class** | **20A Examples**                                                               | **Selection Rule**                                                                                  |
|-------------------|--------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------|
| Required          | Permanent housing, farm plot, kitchen, granary, healer hut at expected stages. | Chosen when a stage-critical capability is missing; equivalent approved definitions may satisfy it. |
| Optional          | Farmhouse, barn, mill, bakery, inn, festival ground.                           | Scored from local need, opportunity, culture, economy, terrain and available labour/resources.      |
| Conditional       | Fishery, refugee shelter, quarantine shelter, cemetery.                        | Eligible only when environmental, crisis, demographic, cultural or story conditions are true.       |
| Upgrade           | Hut to cottage; healer hut to clinic; kitchen to food workshop.                | Chosen when existing capacity is strained and upgrade is cheaper/safer than new construction.       |
| Player proposal   | Approved player cottage, hall, inn or farm design.                             | Must pass functional validation, local law/style policy, plot and cost checks.                      |

Planner scoring should combine shortage, population pressure, stage expectation, travel reduction, culture preference, event/story weight, resource cost, terrain difficulty, threat and maintenance burden. It should avoid repeatedly building redundant services simply because land is available.

# 12. Player Blueprint Validation

| **Validation Profile** | **Blocking Requirements**                                                                                                                     | **Flexible Elements**                                                                |
|------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------|
| Housing                | Valid permanent/temporary bed type, reachable entrance, weatherproof volume, household route, safe heat/fire and stage-appropriate utilities. | Footprint, room arrangement, roof, windows, materials, decoration and culture style. |
| Food production        | Valid cultivated/water cells, work access, crop/livestock profile, storage/output and terrain/ecology rules.                                  | Field shape, terrace layout, fences, sheds and palette.                              |
| Food processing        | Required station, input/output, water/fuel/power, ventilation/sanitation and worker route.                                                    | Interior layout, storefront, attached residence and decorative equipment.            |
| Health                 | Treatment/recovery markers, clean access, medicine storage, water/sanitation and capacity-appropriate evacuation.                             | Architectural style, garden, waiting room and culture-specific care spaces.          |
| Community              | Gathering capacity, safe entrances/exits, focal/event markers and culture-compatible profile.                                                 | Religious or secular expression, stage type, seating, landscaping and decoration.    |

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr class="header">
<th><p><strong>Approval Rule</strong></p>
<p>A draft can be saved while invalid, but NPC settlements cannot select it and it cannot claim functional capacity until all blocking checks pass. Servers and cultures may add stricter style, law, size or content rules without changing the shared blueprint format.</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

# 13. Construction, Resources, Repair and Upgrades

| **Rule**              | **20A Direction**                                                                                                                                                                  |
|-----------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Material tokens       | Use semantic roles such as foundation_primary, wall_primary, roof_primary, structural_beam, floor_primary, door_basic, furnishing_bed and utility_water.                           |
| Exact resources       | Calculated from resolved blueprint cells and components per stage; the family entry stores profiles and required markers, not fixed universal block counts.                        |
| Construction stages   | Use Planning, Site Preparation, Foundation, Frame, Shell, Weatherproofing, Functional Installation, Furnishing and Inspection; small buildings merge stages.                       |
| Partial activation    | Homes activate after safe access, weatherproof shell and valid beds; farms after prepared plots; kitchens after safe station/input/output; clinics after clean treatment capacity. |
| Repair                | Damage invalidates only affected capacity/routes where possible. Settlements may auto-create repair projects with resource reservations.                                           |
| Upgrade               | In-place, attached expansion, parcel replacement and branch conversion are supported when resident/service continuity and resource conservation are safe.                          |
| Demolition/relocation | Displaced residents, animals, patients, stock and services require temporary capacity before project approval.                                                                     |

# 14. Settlement-Stage Expectations

| **Stage**          | **20A Minimum Expectations**                                                                            | **Typical Optional / Conditional Growth**                                           |
|--------------------|---------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------|
| Camp               | Campfire centre and temporary weather-protected sleep capacity.                                         | Worker/refugee shelter, expedition food setup.                                      |
| Hamlet             | Permanent housing, local food production, shared cooking; water and basic storage supplied through 20D. | Farmhouse, barn, stable, fishery, communal longhouse.                               |
| Village            | Protected reserve storage, basic healer access and at least one compatible community/assembly option.   | Mill, bakery, inn, festival ground, cemetery, quarantine shelter.                   |
| Fortified Village  | Reserve and emergency capacity appropriate to isolation/raid risk.                                      | Expanded shelter, additional food processing, guarded granary, field care.          |
| Town               | Denser housing and stronger health/community services with utilities.                                   | Townhouse/shop-house, clinic, preserving house, bathhouse, theatre.                 |
| City               | Urban housing and large service networks; hospital complex is owned by 20F.                             | Apartment houses, district community venues, specialised food chains.               |
| Capital            | Culture-defining institutions and resilient regional provision/health capacity.                         | Grand halls, memorials, visitor districts, ceremonial food complexes.               |
| Magical Metropolis | Realm-scale resilience and magical/vertical adaptations without replacing core needs.                   | Living towers, time-preservation, portal hospitality, floating community precincts. |

# 15. Detailed Registry Summary

| **No.** | **Stable ID**                                 | **Definition**                  | **Earliest Stage** | **Primary Need** | **Class**   | **Status**   |
|---------|-----------------------------------------------|---------------------------------|--------------------|------------------|-------------|--------------|
| 1       | building.temporary.campfire_site              | Campfire Site                   | Camp               | Morale           | Required    | POC Required |
| 2       | building.residential.small_tent               | Small Tent                      | Camp               | Housing          | Required    | POC Required |
| 4       | building.residential.worker_refugee_shelter   | Worker or Refugee Shelter       | Camp               | Housing          | Conditional | Alpha        |
| 5       | building.residential.primitive_hut            | Primitive Hut                   | Hamlet             | Housing          | Required    | POC Required |
| 6       | building.residential.small_cottage            | Small Cottage                   | Hamlet             | Housing          | Required    | POC Required |
| 7       | building.residential.farmhouse                | Farmhouse                       | Hamlet             | Housing          | Optional    | POC Required |
| 8       | building.residential.communal_longhouse       | Communal Longhouse              | Hamlet             | Housing          | Optional    | Alpha        |
| 9       | building.residential.townhouse_shop_house     | Townhouse or Shop-House         | Town               | Housing          | Optional    | Beta         |
| 10      | building.residential.apartment_house          | Apartment House                 | City               | Housing          | Optional    | Beta         |
| 11      | building.food.basic_farm_plot                 | Basic Farm Plot                 | Hamlet             | Provisions       | Required    | POC Required |
| 12      | building.food.irrigated_terraced_farm         | Irrigated or Terraced Farm      | Village            | Provisions       | Optional    | Alpha        |
| 13      | building.food.barn                            | Barn                            | Hamlet             | Provisions       | Optional    | POC Required |
| 14      | building.food.granary                         | Granary                         | Village            | Provisions       | Required    | POC Required |
| 15      | building.food.communal_kitchen                | Communal Kitchen                | Hamlet             | Provisions       | Required    | POC Required |
| 16      | building.food.grain_millhouse                 | Grain Millhouse                 | Village            | Provisions       | Optional    | Alpha        |
| 17      | building.food.bakery_food_workshop            | Bakery or Food Workshop         | Village            | Provisions       | Optional    | Alpha        |
| 18      | building.food.preserving_house                | Preserving House                | Town               | Provisions       | Optional    | Beta         |
| 19      | building.livestock.stable_paddock             | Stable and Paddock              | Hamlet             | Work             | Optional    | Alpha        |
| 20      | building.food.fishery_fishing_dock            | Fishery or Fishing Dock         | Hamlet             | Provisions       | Conditional | Alpha        |
| 21      | building.health.healer_hut                    | Healer Hut                      | Village            | Health           | Required    | POC Required |
| 22      | building.health.clinic_infirmary              | Clinic or Infirmary             | Town               | Health           | Optional    | Beta         |
| 24      | building.welfare.quarantine_emergency_shelter | Quarantine or Emergency Shelter | Village            | Health           | Conditional | Alpha        |
| 25      | building.community.small_shrine_hall          | Small Shrine or Community Hall  | Village            | Morale           | Optional    | POC Required |
| 26      | building.hospitality.tavern_inn               | Tavern or Inn                   | Village            | Morale           | Optional    | Alpha        |
| 27      | building.community.bathhouse_laundry          | Bathhouse and Laundry           | Town               | Health           | Optional    | Beta         |
| 28      | building.community.festival_grounds           | Festival or Community Grounds   | Village            | Morale           | Optional    | Alpha        |
| 29      | building.community.memorial_cemetery          | Memorial and Cemetery           | Village            | Morale           | Conditional | Alpha        |
| 30      | building.community.cultural_hall_theatre      | Cultural Hall or Theatre        | Town               | Morale           | Optional    | Beta         |

Catalogue numbers 3 and 23 are intentionally absent: Builder Supply Yard is owned by 20D, and Hospital Complex is owned by 20F. Their dependencies remain referenced here.

# 16. Temporary and Residential Entries

### 1. Campfire Site

building.temporary.campfire_site

| **Catalogue role**                      | Temporary / Community \| Camp \| Micro \| Required \| POC Required                                                                                        |
|-----------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Morale \| Secondary: Provisions, Safety                                                                                                          |
| **Purpose**                             | Creates the first recognised settlement centre and a shared point for warmth, cooking, light, meetings and early identity.                                |
| **Capacity / service**                  | Supports a small camp gathering and one shared cooking/heating point; capacity scales with seating and cook attachments rather than creating housing.     |
| **Jobs and users**                      | No permanent job required; temporary cook, leader, guard or storyteller use points may be assigned.                                                       |
| **Inputs**                              | Fuel, raw or prepared food, optional kindling and weather cover.                                                                                          |
| **Outputs / services**                  | Cooked food batches, warmth, light, social gathering, early warning point and settlement-centre anchor.                                                   |
| **Required blueprint markers**          | Fire/cook marker, safe standing ring, seating or gathering points, smoke clearance, settlement-centre anchor.                                             |
| **Placement and utilities**             | Outdoor, ventilated, reachable, clear of flammable blocks; optional shelter or windbreak; no utility network required.                                    |
| **Construction profile**                | 2 stages: cleared site and fire ring; activation with fuel. Decorative seating and shelter are later additions.                                           |
| **Upgrade and branch links**            | Can anchor a temporary camp cluster, communal kitchen, village square, festival ground or ritual site; the campfire itself remains reusable.              |
| **Planner triggers and failure states** | Selected immediately when founding a camp or replacing a destroyed centre. Fails when flooded, smothered, out of fuel or unsafe from nearby fire hazards. |
| **Player-blueprint validation**         | Must expose safe access, fire clearance, one cook position and one gathering zone. Decorative-only fires do not count.                                    |
| **Culture and style variation**         | Stone rings, braziers, rune embers, communal hearths, spirit fires and portable fire pits are style variants.                                             |

### 2. Small Tent

building.residential.small_tent

| **Catalogue role**                      | Residential / Temporary \| Camp \| Small \| Required \| POC Required                                                                              |
|-----------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Housing \| Secondary: Safety                                                                                                             |
| **Purpose**                             | Provides the first weather-protected sleeping space without pretending to be permanent housing.                                                   |
| **Capacity / service**                  | Normally 1-2 residents or one compact household; harsh climates may reduce suitability without insulation or heat.                                |
| **Jobs and users**                      | Residents only; no workplace required.                                                                                                            |
| **Inputs**                              | Cloth or hide, poles, rope, bedding and optional ground mat or heating fuel.                                                                      |
| **Outputs / services**                  | Temporary suitable beds, weather cover and reduced exposure.                                                                                      |
| **Required blueprint markers**          | Entrance, sleep spots, protected interior volume, optional storage point and heat-safe zone.                                                      |
| **Placement and utilities**             | Requires reasonably dry ground, access and safe spacing from fires; terrain levelling should be minimal.                                          |
| **Construction profile**                | 3 stages: site/pegs; frame and cover; bedding/activation.                                                                                         |
| **Upgrade and branch links**            | Worker/refugee shelter, primitive hut, expedition tent or culture-specific portable dwelling.                                                     |
| **Planner triggers and failure states** | Chosen during founding, migration, disaster or temporary labour surges. Becomes strained when overcrowded, damaged, wet or seasonally unsuitable. |
| **Player-blueprint validation**         | Must contain valid sleep markers, weatherproof cover, reachable entrance and no exposed dangerous blocks.                                         |
| **Culture and style variation**         | Canvas, hide, woven reed, nomadic felt, leaf canopy and magical membrane variants.                                                                |

### 4. Worker or Refugee Shelter

building.residential.worker_refugee_shelter

| **Catalogue role**                      | Residential / Welfare \| Camp \| Medium \| Conditional \| Alpha                                                                |
|-----------------------------------------|--------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Housing \| Secondary: Health, Morale                                                                                  |
| **Purpose**                             | Provides fast communal accommodation for builders, seasonal workers, refugees, evacuees or disaster survivors.                 |
| **Capacity / service**                  | Usually 4-12 temporary residents; privacy and household compatibility are lower than permanent homes.                          |
| **Jobs and users**                      | Optional steward, quartermaster, healer or guard; residents may be unassigned, temporary or emergency workers.                 |
| **Inputs**                              | Basic construction materials, bedding, lighting, fuel and periodic provisions.                                                 |
| **Outputs / services**                  | Emergency beds, protected gathering, triage or registration capacity and reduced homelessness pressure.                        |
| **Required blueprint markers**          | Multiple beds, safe aisles, entrances, communal storage, optional treatment or registration point.                             |
| **Placement and utilities**             | Near storage, work sites or safe civic areas; must not block future permanent parcels.                                         |
| **Construction profile**                | 3-4 rapid stages with reusable modules and minimal decoration.                                                                 |
| **Upgrade and branch links**            | Dormitory, longhouse, apartment, quarantine shelter or dismantling/reuse once crisis ends.                                     |
| **Planner triggers and failure states** | Triggered by migration, disaster, labour recruitment or housing loss. Penalised if kept as long-term housing without upgrades. |
| **Player-blueprint validation**         | Must meet minimum bed spacing, safe exits, access and climate protection. Decorative tents cannot claim shelter capacity.      |
| **Culture and style variation**         | Barracks, bunkhouse, communal pavilion, refugee cabins and magical emergency ward variants.                                    |

### 5. Primitive Hut

building.residential.primitive_hut

| **Catalogue role**                      | Residential \| Hamlet \| Small \| Required \| POC Required                                                               |
|-----------------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Housing \| Secondary: Safety                                                                                    |
| **Purpose**                             | Provides the first permanent, repairable home and proves the transition from camp to hamlet.                             |
| **Capacity / service**                  | Normally 1-3 residents; one household; basic storage and heat/light support.                                             |
| **Jobs and users**                      | Residents only, with optional micro work point such as mending or food preparation.                                      |
| **Inputs**                              | Foundation material, wall and roof tokens, door, bedding, light/heat and basic fittings.                                 |
| **Outputs / services**                  | Permanent suitable beds, household assignment and improved climate protection.                                           |
| **Required blueprint markers**          | Door, household beds, protected room, heat/light point, private storage and reachable exterior path.                     |
| **Placement and utilities**             | Flat or minor-levelled parcel, road/path socket and safe drainage.                                                       |
| **Construction profile**                | 4 stages: foundation; shell; roof/door; bedding and activation.                                                          |
| **Upgrade and branch links**            | Small cottage, farmhouse, woodland cabin or culture-specific house family.                                               |
| **Planner triggers and failure states** | Required when camp residents need permanent homes. Fails if roof, access, beds or climate protection are invalid.        |
| **Player-blueprint validation**         | Must be enclosed enough for local weather, reachable, contain approved beds and avoid blocked exits or internal hazards. |
| **Culture and style variation**         | Material palette, roof form, window style and plan may change; the functional household profile remains stable.          |

### 6. Small Cottage

building.residential.small_cottage

| **Catalogue role**                      | Residential \| Hamlet \| Small \| Required \| POC Required                                                                                     |
|-----------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Housing \| Secondary: Morale                                                                                                          |
| **Purpose**                             | Standard permanent household building and the main test case for player-designed housing blueprints.                                           |
| **Capacity / service**                  | Usually 2-5 residents; one household; better privacy, storage and resilience than a hut.                                                       |
| **Jobs and users**                      | Residents; optional home industry marker without replacing a dedicated workplace.                                                              |
| **Inputs**                              | Foundation, structural frame, walls, roof, windows/door, beds, heat/light and household fittings.                                              |
| **Outputs / services**                  | Suitable household beds, privacy, spare-capacity potential and positive morale when maintained.                                                |
| **Required blueprint markers**          | Entrance, beds, household room, heat/light, storage, optional cooking or work point, road socket.                                              |
| **Placement and utilities**             | Residential parcel with safe access, drainage and required climate adaptation.                                                                 |
| **Construction profile**                | 5 stages: foundation; frame; shell; weatherproofing; furnishing/inspection.                                                                    |
| **Upgrade and branch links**            | Farmhouse, townhouse/shop-house, larger cottage, assisted housing or culture-specific branch.                                                  |
| **Planner triggers and failure states** | Selected for permanent housing growth, replacement of huts or family formation. Loses contribution when overcrowded, damaged or inaccessible.  |
| **Player-blueprint validation**         | Capacity comes from valid beds and room suitability, not footprint alone. Player designs must pass weather, access, fire and household checks. |
| **Culture and style variation**         | Highly variable exterior and room arrangement; palettes and style kits should make cottages the main expression of local architecture.         |

### 7. Farmhouse

building.residential.farmhouse

| **Catalogue role**                      | Residential / Food \| Hamlet \| Medium \| Optional \| POC Required                                                                                    |
|-----------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Housing \| Secondary: Work, Provisions                                                                                                       |
| **Purpose**                             | Combines a household with nearby agricultural work, storage and oversight without merging all farm facilities into one abstract building.             |
| **Capacity / service**                  | Usually 3-6 residents and 1-3 farm workers; modest crop/tool storage.                                                                                 |
| **Jobs and users**                      | Farmer, farmhand, herder or household producer.                                                                                                       |
| **Inputs**                              | Household provisions, farm tools, seeds, fuel and repair materials.                                                                                   |
| **Outputs / services**                  | Housing plus farm supervision, local tool storage and reduced travel time to fields/barn.                                                             |
| **Required blueprint markers**          | Household beds, entrance, heat/light, farm work point, tool storage, field/barn sockets and road access.                                              |
| **Placement and utilities**             | Adjacent to farm parcels, barn or orchard; may sit at cluster edge rather than centre.                                                                |
| **Construction profile**                | 6 stages, with home shell activating before optional farm porch, storage or decorative finish.                                                        |
| **Upgrade and branch links**            | Farmstead cluster, manor farm, irrigated estate or automated farm residence.                                                                          |
| **Planner triggers and failure states** | Selected when agriculture is important and worker travel is high. Underperforms without nearby productive parcels.                                    |
| **Player-blueprint validation**         | Must satisfy full housing checks and provide at least one agricultural work or storage marker; a house near a field is not automatically a farmhouse. |
| **Culture and style variation**         | Courtyard, longhouse, stilt farm, hill terrace, orchard lodge and living-wood farm variants.                                                          |

### 8. Communal Longhouse

building.residential.communal_longhouse

| **Catalogue role**                      | Residential / Community \| Hamlet \| Large \| Optional \| Alpha                                                                            |
|-----------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Housing \| Secondary: Morale, Provisions                                                                                          |
| **Purpose**                             | Provides dense early communal housing for cultures or settlements that prefer shared living and meals.                                     |
| **Capacity / service**                  | Usually 8-20 residents across several households or one extended household; shared hearth and storage.                                     |
| **Jobs and users**                      | Optional steward, cook, elder or craft worker; residents use shared schedules.                                                             |
| **Inputs**                              | Large structural material demand, bedding, fuel and communal provisions.                                                                   |
| **Outputs / services**                  | High housing capacity, shared social space, efficient heating and communal meal support.                                                   |
| **Required blueprint markers**          | Multiple household zones or beds, shared hearth, safe aisles, storage, gathering area and several exits for larger versions.               |
| **Placement and utilities**             | Central or cluster parcel with strong path access and fire clearance.                                                                      |
| **Construction profile**                | 6-7 stages; foundations/frame are substantial, while household areas may activate in phases.                                               |
| **Upgrade and branch links**            | Communal hall, dormitory, courtyard housing or apartment branch.                                                                           |
| **Planner triggers and failure states** | Useful under rapid population growth, limited land or communal culture preference. Morale may fall if imposed on privacy-focused cultures. |
| **Player-blueprint validation**         | Must define household compatibility, exits, circulation and heating safety; simple bed spam does not create valid capacity.                |
| **Culture and style variation**         | Great hall, clan house, earth lodge, tree hall, cavern hall and nomadic communal pavilion variants.                                        |

### 9. Townhouse or Shop-House

building.residential.townhouse_shop_house

| **Catalogue role**                      | Residential / Mixed Use \| Town \| Medium \| Optional \| Beta                                                                                    |
|-----------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Housing \| Secondary: Work, Infrastructure                                                                                              |
| **Purpose**                             | Introduces compact mixed-use urban parcels with residence and a compatible public or productive ground floor.                                    |
| **Capacity / service**                  | Usually 3-6 residents plus 1-4 workplace or retail jobs.                                                                                         |
| **Jobs and users**                      | Merchant, artisan, service worker or professional, depending on approved ground-floor module.                                                    |
| **Inputs**                              | Household provisions plus workplace inputs defined by the attached shop/work module.                                                             |
| **Outputs / services**                  | Housing, local service or production, active streets and reduced travel demand.                                                                  |
| **Required blueprint markers**          | Separate or controlled public/private entrances, household beds, service/work markers, storage, street socket and fire escape as scale requires. |
| **Placement and utilities**             | Street frontage in town or denser village centre; compatible neighbouring use and delivery access required.                                      |
| **Construction profile**                | 6-8 stages; shell can be shared while residence and shop activate separately.                                                                    |
| **Upgrade and branch links**            | Apartment house, merchant house, guild row, courtyard block or specialised urban branch.                                                         |
| **Planner triggers and failure states** | Selected when land value, street activity and mixed-use demand rise. Can fail through incompatible hazards, noise or blocked private access.     |
| **Player-blueprint validation**         | Player blueprint must separate household safety from public/work hazards and satisfy both attached functional profiles.                          |
| **Culture and style variation**         | Timber-framed, stone arcade, bazaar courtyard, canal house, tower-house and magical vertical variants.                                           |

### 10. Apartment House

building.residential.apartment_house

| **Catalogue role**                      | Residential / Urban \| City \| Large \| Optional \| Beta                                                                              |
|-----------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Housing \| Secondary: Infrastructure, Morale                                                                                 |
| **Purpose**                             | Provides high-capacity urban housing while creating service, evacuation and infrastructure requirements appropriate to cities.        |
| **Capacity / service**                  | Usually 12-40 residents in multiple households; exact capacity derives from valid units, beds, circulation and utilities.             |
| **Jobs and users**                      | Caretaker or steward optional; residents retain external jobs.                                                                        |
| **Inputs**                              | Household provisions, maintenance materials, lighting/heating and stage-appropriate utility service.                                  |
| **Outputs / services**                  | Dense housing capacity, efficient land use and district population support.                                                           |
| **Required blueprint markers**          | Household units, beds, corridors/stairs, entrances/exits, waste/service points, shared space and street/utility sockets.              |
| **Placement and utilities**             | Urban district with road, safety, water/sanitation and emergency access expected by city stage.                                       |
| **Construction profile**                | 8+ stages, often wing-by-wing; partial occupancy allowed only after inspected routes and utilities are complete.                      |
| **Upgrade and branch links**            | Courtyard block, assisted housing, noble apartments, worker housing or magical vertical residence.                                    |
| **Planner triggers and failure states** | Selected under urban housing pressure and limited parcels. Becomes unsafe or low-morale when services, exits or maintenance fail.     |
| **Player-blueprint validation**         | Capacity is denied for unreachable rooms, missing exits, unsafe vertical routes, invalid households or absent required city services. |
| **Culture and style variation**         | Row blocks, courtyard compounds, cliff dwellings, cavern terraces, living towers and floating residential modules.                    |

# 17. Farming, Food and Livestock Entries

### 11. Basic Farm Plot

building.food.basic_farm_plot

| **Catalogue role**                      | Food / Agriculture \| Hamlet \| Parcel \| Required \| POC Required                                                                               |
|-----------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Provisions \| Secondary: Work                                                                                                           |
| **Purpose**                             | Creates the first dependable renewable food source and a clear settlement project that reacts to soil, climate and labour.                       |
| **Capacity / service**                  | Typical small plot supports part of 2-6 residents depending on crop, season, fertility and skill; several plots combine into a farmstead.        |
| **Jobs and users**                      | Farmer or farmhand; temporary harvest labour may assist.                                                                                         |
| **Inputs**                              | Seeds/planting stock, tools, labour, water access or rainfall and optional fertiliser.                                                           |
| **Outputs / services**                  | Crops, seed return, straw/fibre and seasonal food supply.                                                                                        |
| **Required blueprint markers**          | Crop rows or planting cells, access lane, tool/work point, harvest zone and optional water socket.                                               |
| **Placement and utilities**             | Valid soil, light, slope and climate; reachable from storage and protected from trampling or hostile animals.                                    |
| **Construction profile**                | 3 stages: clear/prepare; plant/irrigate; first operational crop cycle. Growth is not construction progress.                                      |
| **Upgrade and branch links**            | Irrigated/terraced farm, orchard, herb garden, greenhouse or automated farm.                                                                     |
| **Planner triggers and failure states** | Required when provisions fall below reserve targets. Can lie fallow through season, crop rotation or labour shortage rather than being “broken.” |
| **Player-blueprint validation**         | Must contain enough valid cultivated cells and access. Decorative gardens do not count unless configured as edible production.                   |
| **Culture and style variation**         | Field geometry, crop family, terraces, raised beds, paddies, fungal beds and magical cultivation vary by biome/culture.                          |

### 12. Irrigated or Terraced Farm

building.food.irrigated_terraced_farm

| **Catalogue role**                      | Food / Agriculture \| Village \| Large Parcel \| Optional \| Alpha                                                                        |
|-----------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Provisions \| Secondary: Infrastructure, Work                                                                                    |
| **Purpose**                             | Expands agriculture where water control, slopes or higher yields justify infrastructure investment.                                       |
| **Capacity / service**                  | Usually supports a meaningful village food share; capacity depends on cultivated area and water reliability rather than one fixed output. |
| **Jobs and users**                      | Farmers, irrigation worker, hauler and optional agricultural specialist.                                                                  |
| **Inputs**                              | Seeds, tools, labour, water network, repair materials and optional fertiliser or mana support.                                            |
| **Outputs / services**                  | Higher or more reliable crop output, specialty crops and reduced drought/slope penalties.                                                 |
| **Required blueprint markers**          | Cultivated terraces/plots, channels or water sockets, access routes, maintenance points and storage connection.                           |
| **Placement and utilities**             | Slope-appropriate or water-connected terrain; must not create uncontrolled flooding or block roads.                                       |
| **Construction profile**                | 5-7 stages: survey; retaining/levelling; channels; soil; planting; inspection.                                                            |
| **Upgrade and branch links**            | Farmstead cluster, automated farm, magical greenhouse or regional irrigation network.                                                     |
| **Planner triggers and failure states** | Chosen for food pressure, poor flat land, drought risk or agricultural specialisation. Pauses if water rights or network capacity fail.   |
| **Player-blueprint validation**         | Requires continuous water logic, reachable terraces and stable retaining/foundation rules; visual channels alone are insufficient.        |
| **Culture and style variation**         | Rice terraces, step gardens, canal fields, desert qanat farms, cavern fungus terraces and ley-fed gardens.                                |

### 13. Barn

building.food.barn

| **Catalogue role**                      | Food / Livestock \| Hamlet \| Medium \| Optional \| POC Required                                                              |
|-----------------------------------------|-------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Provisions \| Secondary: Infrastructure, Work                                                                        |
| **Purpose**                             | Protects feed, tools, harvests and livestock support functions without replacing the separate granary or animal yard systems. |
| **Capacity / service**                  | Small-to-medium farm storage plus shelter for a limited livestock group or equipment set, depending on blueprint profile.     |
| **Jobs and users**                      | Farmer, herder, stablehand or hauler.                                                                                         |
| **Inputs**                              | Feed, bedding, repair materials and optional lighting/heating.                                                                |
| **Outputs / services**                  | Protected feed and harvest storage, livestock shelter, farm-tool access and reduced spoilage/weather loss.                    |
| **Required blueprint markers**          | Large access door, feed/storage zones, animal or equipment bays, ventilation, work point and farm-road socket.                |
| **Placement and utilities**             | Near fields, paddock and farmhouse; downwind/away from dense housing where appropriate.                                       |
| **Construction profile**                | 5 stages: foundation; frame; walls; roof/doors; bays/storage activation.                                                      |
| **Upgrade and branch links**            | Stable/paddock, specialised livestock barn, farmstead cluster or automated feed store.                                        |
| **Planner triggers and failure states** | Selected when farm storage, animals or harvest handling are bottlenecks. Fire, pests and feed shortage are key failure risks. |
| **Player-blueprint validation**         | Must separate safe storage and animal/equipment circulation; storage capacity comes from marked zones and containers.         |
| **Culture and style variation**         | Timber barn, stone byre, reed loft, cavern pens, living-root shelter and climate-sealed variants.                             |

### 14. Granary

building.food.granary

| **Catalogue role**                      | Food / Storage \| Village \| Small \| Required \| POC Required                                                                                                     |
|-----------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Provisions \| Secondary: Infrastructure, Safety                                                                                                           |
| **Purpose**                             | Creates protected staple reserves and makes seasonal food security visible and measurable.                                                                         |
| **Capacity / service**                  | Provides protected dry-food capacity sized by containers/marked volume; supports reserve-days calculations rather than producing food.                             |
| **Jobs and users**                      | Storekeeper, farmer or hauler; may be unstaffed at small scale.                                                                                                    |
| **Inputs**                              | Grain or dry food, pest control, maintenance materials and ledger access.                                                                                          |
| **Outputs / services**                  | Reduced spoilage and theft, project/emergency reserve separation and clearer provision forecasting.                                                                |
| **Required blueprint markers**          | Protected storage zones, intake/output, ledger point, ventilation/pest protection and path/warehouse socket.                                                       |
| **Placement and utilities**             | Dry, raised or drained site with guarded access; near farms and kitchen but separated from fire risks.                                                             |
| **Construction profile**                | 5 stages: raised/foundation; shell; roof; storage bins; sealing/inspection.                                                                                        |
| **Upgrade and branch links**            | Specialised silo/depot (20D), town reserve house, automated food warehouse or magical cold/dry vault.                                                              |
| **Planner triggers and failure states** | Required at Village when food production exceeds safe household storage or seasonal reserve targets rise. Fails through moisture, pests, fire or untracked access. |
| **Player-blueprint validation**         | Must contain valid protected food storage and access; empty decorative towers do not provide reserve capacity.                                                     |
| **Culture and style variation**         | Raised granaries, stone silos, clay bins, cliff stores, fungal vaults and rune-sealed reserve houses.                                                              |

### 15. Communal Kitchen

building.food.communal_kitchen

| **Catalogue role**                      | Food / Community \| Hamlet \| Small \| Required \| POC Required                                                                                                  |
|-----------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Provisions \| Secondary: Morale, Health                                                                                                                 |
| **Purpose**                             | Converts stored ingredients into safe batch meals and provides an early communal service without simulating every bite as a separate player task.                |
| **Capacity / service**                  | One or more cook stations serving a small hamlet; throughput depends on cooks, fuel, inputs and meal storage.                                                    |
| **Jobs and users**                      | Cook, baker apprentice, steward or rotating resident duty.                                                                                                       |
| **Inputs**                              | Food ingredients, water access, fuel, cookware and optional preservation ingredients.                                                                            |
| **Outputs / services**                  | Cooked meals, improved food value/variety, social mealtime and reduced foodborne-risk when operational.                                                          |
| **Required blueprint markers**          | Cook station, food input/output, water point/socket, fuel storage, tables or collection point, ventilation and fire safety.                                      |
| **Placement and utilities**             | Central and accessible, near food storage and water, separated from flammable/unsanitary uses.                                                                   |
| **Construction profile**                | 5 stages: shell; hearth/ventilation; work surfaces; storage/water; furniture/inspection.                                                                         |
| **Upgrade and branch links**            | Bakery/food workshop, tavern/inn kitchen, preserving house or district food hall.                                                                                |
| **Planner triggers and failure states** | Required when settlement grows beyond household cooking or raw-food dependence becomes unsafe/inefficient. Pauses from fuel, water, cook or ingredient shortage. |
| **Player-blueprint validation**         | Must provide safe cook path, ventilation, input/output and water logic; a decorative hearth alone is not a kitchen.                                              |
| **Culture and style variation**         | Communal hearth, outdoor cookhouse, clay oven court, feast hall kitchen, steam kitchen and mana-heated kitchen.                                                  |

### 16. Grain Millhouse

building.food.grain_millhouse

| **Catalogue role**                      | Food / Processing \| Village \| Medium \| Optional \| Alpha                                                                         |
|-----------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Provisions \| Secondary: Work, Infrastructure                                                                              |
| **Purpose**                             | Processes grain and similar crops into higher-value cooking inputs using mechanical, water, wind or powered milling.                |
| **Capacity / service**                  | Throughput depends on mill mechanism, power and worker; supports one village-scale grain chain.                                     |
| **Jobs and users**                      | Miller, mechanic/maintenance worker and hauler.                                                                                     |
| **Inputs**                              | Grain, power source, sacks/containers and maintenance parts.                                                                        |
| **Outputs / services**                  | Flour or meal, bran/by-products and improved bakery/kitchen supply.                                                                 |
| **Required blueprint markers**          | Mill mechanism, input/output, power socket, maintenance access, safe work zone and delivery route.                                  |
| **Placement and utilities**             | Near water/wind/power opportunity or connected network; noise and moving parts should be considered near housing.                   |
| **Construction profile**                | 6 stages: foundation; mill structure; mechanism; power connection; storage; inspection.                                             |
| **Upgrade and branch links**            | Powered mill, industrial food plant (20E) or district grain complex.                                                                |
| **Planner triggers and failure states** | Selected when grain surplus and kitchen/bakery demand justify processing. Stops cleanly on blocked output or lost power.            |
| **Player-blueprint validation**         | Must include approved processing mechanism and power/input/output links; visual wheel without functional connection does not count. |
| **Culture and style variation**         | Watermill, windmill, animal mill, hand quern hall, rune mill and compact urban mill.                                                |

### 17. Bakery or Food Workshop

building.food.bakery_food_workshop

| **Catalogue role**                      | Food / Artisan \| Village \| Small \| Optional \| Alpha                                                                                     |
|-----------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Provisions \| Secondary: Work, Morale                                                                                              |
| **Purpose**                             | Produces bread, prepared foods or a culture-specific staple beyond basic communal meals.                                                    |
| **Capacity / service**                  | Small specialist workshop serving village demand; throughput depends on recipe, worker, fuel and processed inputs.                          |
| **Jobs and users**                      | Baker, cook, confectioner or culture-specific food artisan.                                                                                 |
| **Inputs**                              | Flour or relevant ingredients, water, fuel, containers and recipe knowledge.                                                                |
| **Outputs / services**                  | Bread/prepared foods, trade goods, food variety and festival supplies.                                                                      |
| **Required blueprint markers**          | Oven/cook station, preparation bench, ingredient storage, output display/collection, ventilation and water.                                 |
| **Placement and utilities**             | Near market or kitchen/storage route with safe fire and delivery access.                                                                    |
| **Construction profile**                | 5-6 stages; functional oven and work surfaces activate before final storefront decoration.                                                  |
| **Upgrade and branch links**            | Tavern kitchen, preserving house, urban food hall or industrial food plant.                                                                 |
| **Planner triggers and failure states** | Selected for food variety, trade, morale or population demand; not a required survival building if communal kitchen capacity is sufficient. |
| **Player-blueprint validation**         | Must satisfy recipe station, ventilation and storage markers; player designs may be workshop-only or mixed shop-house when safe.            |
| **Culture and style variation**         | Bread ovens, noodle house, smoke-cookhouse, sweetmaker, fungal bakery, spirit-kitchen and magical confectioner.                             |

### 18. Preserving House

building.food.preserving_house

| **Catalogue role**                      | Food / Processing \| Town \| Medium \| Optional \| Beta                                                                                      |
|-----------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Provisions \| Secondary: Health, Work                                                                                               |
| **Purpose**                             | Extends reserve life through drying, smoking, salting, pickling, fermentation, chilling or magical preservation.                             |
| **Capacity / service**                  | Town-scale preservation batches; increases usable reserve days and reduces seasonal waste rather than producing food from nothing.           |
| **Jobs and users**                      | Preserver, cook, alchemist or cold-store keeper depending on method.                                                                         |
| **Inputs**                              | Fresh food, salt/smoke/fuel/containers or magical reagents, water and recipes.                                                               |
| **Outputs / services**                  | Preserved food, trade goods, reduced spoilage and emergency reserves.                                                                        |
| **Required blueprint markers**          | Preparation, process stations, clean/dirty separation, storage, ventilation/drainage and input/output.                                       |
| **Placement and utilities**             | Near food logistics and water; method-specific smoke, waste, cold or magic safety rules apply.                                               |
| **Construction profile**                | 6-7 stages with process equipment and sanitary inspection before operation.                                                                  |
| **Upgrade and branch links**            | Cold store, industrial food plant, magical preservation vault or regional reserve complex.                                                   |
| **Planner triggers and failure states** | Selected for seasonal surplus, long routes, winter risk or trade. Can create health risk if sanitation, temperature or recipe control fails. |
| **Player-blueprint validation**         | Must include a supported preservation method and hygienic flow; generic storage does not claim preservation bonus.                           |
| **Culture and style variation**         | Smokehouse, salt house, fermentation cellar, icehouse, sun-drying court and time-rune pantry.                                                |

### 19. Stable and Paddock

building.livestock.stable_paddock

| **Catalogue role**                      | Livestock / Transport \| Hamlet \| Medium Parcel \| Optional \| Alpha                                                                   |
|-----------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Work \| Secondary: Provisions, Infrastructure                                                                                  |
| **Purpose**                             | Provides safe animal housing, feeding, breeding or transport-animal support as one linked facility family.                              |
| **Capacity / service**                  | Draft range: 2-8 large mounts/work animals or a larger number of small livestock, depending on marked stalls and grazing space.         |
| **Jobs and users**                      | Stablehand, herder, breeder, courier or animal healer.                                                                                  |
| **Inputs**                              | Feed, water, bedding, fencing, tools and medicine as needed.                                                                            |
| **Outputs / services**                  | Animal safety, mounts/work beasts, manure/by-products and transport or farming capacity.                                                |
| **Required blueprint markers**          | Stalls/pens, gates, feed/water, paddock zone, grooming/work point, path/road socket and manure/waste handling.                          |
| **Placement and utilities**             | Accessible edge parcel with suitable ground, drainage and separation from dense housing where appropriate.                              |
| **Construction profile**                | 5-6 stages: fence/paddock; shelter; stalls; feed/water; work points; inspection.                                                        |
| **Upgrade and branch links**            | Large stable, caravan yard, beast-training ground, sanctuary or automated feed system.                                                  |
| **Planner triggers and failure states** | Selected when owned animals lack capacity or transport/farming demand rises. Welfare and escape risk worsen if overcrowded or underfed. |
| **Player-blueprint validation**         | Capacity derives from valid stalls/pens and access; decorative fences do not create animal service.                                     |
| **Culture and style variation**         | Open corrals, stone stables, cliff roosts, underground pens, living enclosures and magical creature wards.                              |

### 20. Fishery or Fishing Dock

building.food.fishery_fishing_dock

| **Catalogue role**                      | Food / Water \| Hamlet \| Medium \| Conditional \| Alpha                                                                            |
|-----------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Provisions \| Secondary: Work, Infrastructure                                                                              |
| **Purpose**                             | Creates a water-dependent food and trade branch without forcing inland settlements to build irrelevant structures.                  |
| **Capacity / service**                  | Output depends on water biome, stock pressure, boats/nets, season and workers; small versions serve a hamlet.                       |
| **Jobs and users**                      | Fisher, boat worker, fish processor or dockhand.                                                                                    |
| **Inputs**                              | Fishing tools, bait/nets, boats where required, containers, fuel and maintenance materials.                                         |
| **Outputs / services**                  | Fish or water resources, trade goods and optional transport access.                                                                 |
| **Required blueprint markers**          | Water-edge work points, safe landing, gear storage, catch input/output, path socket and optional boat moorings.                     |
| **Placement and utilities**             | Valid fishable water, stable shore/depth, safe access and non-conflicting route; can be river, lake, coast or cavern water.         |
| **Construction profile**                | 4-6 stages: shore works; deck/shelter; moorings; storage/work; inspection.                                                          |
| **Upgrade and branch links**            | Harbour fishery, hatchery, preserving house link or culture-specific aquatic farm.                                                  |
| **Planner triggers and failure states** | Only eligible when local water and ecology support it. Overfishing, storms, pollution or hostile water creatures can reduce output. |
| **Player-blueprint validation**         | Must connect to valid water and safe work/landing points; decorative docks do not generate fish.                                    |
| **Culture and style variation**         | River jetty, coastal pier, stilt village dock, ice fish house, cavern platform and floating kelp farm.                              |

# 18. Health and Welfare Entries

### 21. Healer Hut

building.health.healer_hut

| **Catalogue role**                      | Health \| Village \| Small \| Required \| POC Required                                                                                            |
|-----------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Health \| Secondary: Morale                                                                                                              |
| **Purpose**                             | Provides the first formal treatment service, medicine storage and recovery capacity.                                                              |
| **Capacity / service**                  | One healer work point and 1-2 recovery beds; sufficient for routine village injuries, not a major outbreak or battle.                             |
| **Jobs and users**                      | Healer, herbalist or apprentice.                                                                                                                  |
| **Inputs**                              | Medicine, bandages, clean water, fuel/light and optional herbs or magical components.                                                             |
| **Outputs / services**                  | Treatment, recovery, diagnosis/events, medicine crafting or dispensing and health reassurance.                                                    |
| **Required blueprint markers**          | Treatment station, medicine storage, recovery bed, clean-water access, handwashing/clean zone and safe entrance.                                  |
| **Placement and utilities**             | Quiet, accessible central site near water and emergency routes; separated from major pollution or industry.                                       |
| **Construction profile**                | 5 stages: shell; clean interior; treatment station; medicine/recovery; inspection.                                                                |
| **Upgrade and branch links**            | Clinic/infirmary, hospital campus (20F), quarantine shelter or magical healing branch (20E).                                                      |
| **Planner triggers and failure states** | Required when population, injury history or stage expectations exceed informal care. Becomes overloaded when patients exceed staff/beds/medicine. |
| **Player-blueprint validation**         | Must have treatment, storage, clean access and recovery capacity; decorative herb shelves do not create health service.                           |
| **Culture and style variation**         | Herbal hut, surgeon house, clan healer lodge, spirit clinic, alchemical dispensary and rune-healing room.                                         |

### 22. Clinic or Infirmary

building.health.clinic_infirmary

| **Catalogue role**                      | Health \| Town \| Medium \| Optional \| Beta                                                                                                                         |
|-----------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Health \| Secondary: Infrastructure, Safety                                                                                                                 |
| **Purpose**                             | Expands treatment, triage and short-term recovery for a town, military site or dense district.                                                                       |
| **Capacity / service**                  | Several treatment/recovery positions with triage and medicine support; exact capacity derives from staff, beds and utilities.                                        |
| **Jobs and users**                      | Healer/physician, nurse/orderly, apothecary and optional cleaner or porter.                                                                                          |
| **Inputs**                              | Medicine, clean water, fuel/power, linens, food and sanitation supplies.                                                                                             |
| **Outputs / services**                  | Higher treatment throughput, reduced death/recovery time, outbreak detection and emergency response support.                                                         |
| **Required blueprint markers**          | Reception/triage, treatment stations, recovery beds, medicine store, clean/dirty separation, water/sanitation and emergency access.                                  |
| **Placement and utilities**             | Road-connected service area with reliable water, sanitation and low hazard exposure.                                                                                 |
| **Construction profile**                | 6-8 stages; clean utilities and inspected care routes required before activation.                                                                                    |
| **Upgrade and branch links**            | Hospital complex (20F), specialised cleansing clinic (20E), hospice or military infirmary.                                                                           |
| **Planner triggers and failure states** | Selected when healer hut is overloaded, district access is poor or threat/industry raises injury load. Fails through staff, medicine, sanitation or access shortage. |
| **Player-blueprint validation**         | Player design must meet bed spacing, clean routes, staff access, utility and evacuation rules appropriate to capacity.                                               |
| **Culture and style variation**         | Courtyard clinic, monastic infirmary, field-surgery hall, bath-clinic, alchemical clinic and mana-assisted infirmary.                                                |

### 24. Quarantine or Emergency Shelter

building.welfare.quarantine_emergency_shelter

| **Catalogue role**                      | Health / Welfare \| Village \| Medium \| Conditional \| Alpha                                                                                                  |
|-----------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Health \| Secondary: Safety, Housing                                                                                                                  |
| **Purpose**                             | Provides flexible isolation, disaster shelter or evacuation capacity without creating a permanent always-on “panic” need.                                      |
| **Capacity / service**                  | Typically 4-16 temporary occupants, with capacity profile chosen as quarantine, disaster shelter or mixed emergency use.                                       |
| **Jobs and users**                      | Temporary healer, steward, guard or relief worker.                                                                                                             |
| **Inputs**                              | Beds, provisions, clean water, medicine, fuel, security and sanitation supplies.                                                                               |
| **Outputs / services**                  | Isolation, emergency beds, safe evacuation capacity and reduced outbreak/disaster spread.                                                                      |
| **Required blueprint markers**          | Controlled entrances, separated bed zones, clean/dirty route if quarantine, supply point, water/sanitation and guard/triage point.                             |
| **Placement and utilities**             | Accessible but separable from dense population; safe from the hazard it is intended to answer.                                                                 |
| **Construction profile**                | Rapid 4-6 stages; may reuse modular shelters and activate by wing.                                                                                             |
| **Upgrade and branch links**            | Clinic wing, refugee centre, permanent emergency bunker (20C) or dismantling/reuse after crisis.                                                               |
| **Planner triggers and failure states** | Triggered by outbreak, refugee arrival, disaster warning, damaged housing or event requirement. Dormant when not needed and should not consume heavy staffing. |
| **Player-blueprint validation**         | Mode-specific checks apply; a quarantine design must prevent uncontrolled circulation, while a storm shelter must meet hazard protection.                      |
| **Culture and style variation**         | Isolation cabins, monastery ward, earth shelter, ship quarantine pier, warded pavilion and portable relief hall.                                               |

# 19. Community, Culture and Hospitality Entries

### 25. Small Shrine or Community Hall

building.community.small_shrine_hall

| **Catalogue role**                      | Community / Culture \| Village \| Small \| Optional \| POC Required                                                                         |
|-----------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Morale \| Secondary: Health, Safety                                                                                                |
| **Purpose**                             | Provides a culture-neutral functional slot for worship, assembly, remembrance, ritual, counselling or shared identity.                      |
| **Capacity / service**                  | Small gathering of roughly 6-20 users, depending on seating/standing markers; service depends on events and cultural compatibility.         |
| **Jobs and users**                      | Elder, priest, ritualist, community leader, counsellor or rotating host.                                                                    |
| **Inputs**                              | Optional offerings, culture goods, light/fuel, maintenance and event supplies.                                                              |
| **Outputs / services**                  | Morale support, community meetings, small rituals, counselling, cultural progression and emergency gathering.                               |
| **Required blueprint markers**          | Gathering/seating, focal/ritual point, entrance, culture slot, optional speaker/leader and safe assembly routes.                            |
| **Placement and utilities**             | Accessible civic or residential centre; belief-specific versions may have orientation, landscape or mana requirements.                      |
| **Construction profile**                | 5 stages: site/foundation; hall/shell; weatherproofing; focal furnishings; activation/dedication.                                           |
| **Upgrade and branch links**            | Cultural hall/theatre, temple/monastery via 20G or ritual/magic facility via 20E.                                                           |
| **Planner triggers and failure states** | Selected for morale, identity, story or governance need. Should not penalise cultures whose equivalent is a grove, plaza or ancestor house. |
| **Player-blueprint validation**         | Must provide a valid community function and gathering capacity; no universal religion object is mandatory.                                  |
| **Culture and style variation**         | Shrine, ancestor room, clan hall, spirit grove, civic lodge, meditation garden and secular meeting hall are equivalent profiles.            |

### 26. Tavern or Inn

building.hospitality.tavern_inn

| **Catalogue role**                      | Hospitality \| Village \| Medium \| Optional \| Alpha                                                                                                  |
|-----------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Morale \| Secondary: Provisions, Work                                                                                                         |
| **Purpose**                             | Combines public meals, social activity and optional guest lodging, supporting local life and travel without becoming a universal survival requirement. |
| **Capacity / service**                  | Small village versions serve a gathering crowd and 0-8 guest beds; tavern-only and inn profiles are both valid.                                        |
| **Jobs and users**                      | Innkeeper, cook, server, brewer or stablehand depending on modules.                                                                                    |
| **Inputs**                              | Food, drink, fuel, linens, cleaning supplies and optional trade goods.                                                                                 |
| **Outputs / services**                  | Meals, social service, guest beds, rumours/quests, trade activity and visitor support.                                                                 |
| **Required blueprint markers**          | Public room, service counter, kitchen link, storage, seating, optional guest beds, toilets/sanitation and road frontage.                               |
| **Placement and utilities**             | Village centre, road junction or caravan route with delivery and noise compatibility.                                                                  |
| **Construction profile**                | 6-7 stages; public room may activate before guest wing or decoration.                                                                                  |
| **Upgrade and branch links**            | Coaching inn, guild lodge, city hotel, caravanserai or culture-specific hospitality branch.                                                            |
| **Planner triggers and failure states** | Selected under visitor, trade, morale or meal-capacity demand. Can increase noise, crime or fire risk if poorly managed.                               |
| **Player-blueprint validation**         | Must distinguish guest beds from permanent housing and meet kitchen/public/escape rules; an inn is not required for every village.                     |
| **Culture and style variation**         | Alehouse, tea house, feast lodge, caravan inn, bath inn, mushroom tavern and magical traveller house.                                                  |

### 27. Bathhouse and Laundry

building.community.bathhouse_laundry

| **Catalogue role**                      | Health / Community \| Town \| Medium \| Optional \| Beta                                                                              |
|-----------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Health \| Secondary: Infrastructure, Morale                                                                                  |
| **Purpose**                             | Provides shared washing, bathing and linen services where density and culture justify them, without creating individual hygiene bars. |
| **Capacity / service**                  | Town service capacity based on water, heat, staff and wash stations; improves health risk and morale at district level.               |
| **Jobs and users**                      | Bath attendant, launderer, cleaner, healer or boiler worker.                                                                          |
| **Inputs**                              | Water, heat/fuel/power, soap/cleaning goods, linens and drainage capacity.                                                            |
| **Outputs / services**                  | Sanitation support, clean linens, social/recreation service and clinic/hospital support.                                              |
| **Required blueprint markers**          | Clean/dirty intake, wash/bath stations, heat, water, drainage, changing/private zones and safe public access.                         |
| **Placement and utilities**             | Reliable water/drainage utility, suitable district access and separation from contaminated industry.                                  |
| **Construction profile**                | 6-8 stages; utilities and drainage must be commissioned before use.                                                                   |
| **Upgrade and branch links**            | Public baths, healing baths, steam house, district laundry or magical cleansing spa.                                                  |
| **Planner triggers and failure states** | Selected when town density, clinic needs, culture or sanitation pressure justify it. Does not become a mandatory personal need meter. |
| **Player-blueprint validation**         | Requires functional water, heat and drainage; privacy and accessibility rules depend on culture/world settings.                       |
| **Culture and style variation**         | Roman-style baths, sauna, hot spring, river washhouse, steam cave, ritual cleansing pools and rune-heated bath.                       |

### 28. Festival or Community Grounds

building.community.festival_grounds

| **Catalogue role**                      | Community / Public Space \| Village \| Parcel \| Optional \| Alpha                                                           |
|-----------------------------------------|------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Morale \| Secondary: Work                                                                                           |
| **Purpose**                             | Provides flexible outdoor or semi-covered space for festivals, markets, ceremonies, meetings, training and temporary events. |
| **Capacity / service**                  | Variable gathering capacity defined by clear area, entrances and event layout; no permanent daily staffing required.         |
| **Jobs and users**                      | Event host, performers, vendors, guards and temporary workers during events.                                                 |
| **Inputs**                              | Event supplies, food, decorations, lighting, security and cleanup labour.                                                    |
| **Outputs / services**                  | Morale events, culture milestones, temporary trade, social gathering and story triggers.                                     |
| **Required blueprint markers**          | Open event area, entrances, assembly points, temporary stall/stage sockets, lighting and emergency routes.                   |
| **Placement and utilities**             | Central green, edge field or civic plaza with safe crowd access and minimal route conflict.                                  |
| **Construction profile**                | 3-5 stages: clear/grade; paths/boundary; stage or sockets; lighting/decoration; approval.                                    |
| **Upgrade and branch links**            | Civic square, tournament ground, cultural precinct or district festival venue.                                               |
| **Planner triggers and failure states** | Selected for morale, culture, tourism or event requirements; remains useful between events as public space.                  |
| **Player-blueprint validation**         | Must provide safe crowd flow and event sockets; empty inaccessible terrain does not count.                                   |
| **Culture and style variation**         | Village green, dance circle, feast field, market court, floating platform, cavern forum and seasonal ritual meadow.          |

### 29. Memorial and Cemetery

building.community.memorial_cemetery

| **Catalogue role**                      | Community / Welfare \| Village \| Parcel \| Conditional \| Alpha                                                                                          |
|-----------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Morale \| Secondary: Health, Infrastructure                                                                                                      |
| **Purpose**                             | Handles remembrance, burial/cremation or culture-specific death rites, making loss visible without simulating graphic detail.                             |
| **Capacity / service**                  | Provides rite and memorial capacity; burial plots, crypts or alternatives depend on culture and land availability.                                        |
| **Jobs and users**                      | Caretaker, priest/ritualist, undertaker or historian as culture requires.                                                                                 |
| **Inputs**                              | Maintenance, rite goods, markers, fuel for cremation where used and optional offerings.                                                                   |
| **Outputs / services**                  | Mourning resolution, history, memorial events, safe body handling and cultural continuity.                                                                |
| **Required blueprint markers**          | Rite/focal point, memorial or plot zones, paths, records, storage and culturally appropriate boundaries.                                                  |
| **Placement and utilities**             | Culture-appropriate quiet site, safe drainage and access; may be outside walls, in crypts, gardens or sacred landscapes.                                  |
| **Construction profile**                | 4-6 stages, expandable by plots or memorial modules.                                                                                                      |
| **Upgrade and branch links**            | Mausoleum, remembrance garden, ancestor hall, catacomb or capital monument.                                                                               |
| **Planner triggers and failure states** | Triggered by deaths, cultural requirements or memorial events. Lack of an accepted rite can prolong morale penalties, but not every culture needs graves. |
| **Player-blueprint validation**         | Must use culture-approved body/rite profile and safe access; player designs cannot claim incompatible rites by decoration alone.                          |
| **Culture and style variation**         | Cemetery, cremation garden, ancestor wall, sky platform, mushroom grove, ossuary, memory crystal hall and spirit forest.                                  |

### 30. Cultural Hall or Theatre

building.community.cultural_hall_theatre

| **Catalogue role**                      | Community / Culture \| Town \| Large \| Optional \| Beta                                                                                           |
|-----------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Morale \| Secondary: Work, Infrastructure                                                                                                 |
| **Purpose**                             | Supports performances, education, civic gatherings, exhibitions and culture-specific public life at town scale.                                    |
| **Capacity / service**                  | Medium-to-large audience with backstage/service capacity; output depends on staff, programme and access rather than passive existence.             |
| **Jobs and users**                      | Performers, host, curator, technicians, teachers, guards and maintenance staff.                                                                    |
| **Inputs**                              | Culture goods, instruments/props, lighting/power, event supplies and maintenance.                                                                  |
| **Outputs / services**                  | Morale events, culture progression, tourism, education links, reputation and story content.                                                        |
| **Required blueprint markers**          | Audience area, stage/focal space, entrances/exits, backstage/service, storage, accessible routes and street/civic sockets.                         |
| **Placement and utilities**             | Town civic or cultural district with strong transport and safety access.                                                                           |
| **Construction profile**                | 7-9 stages; hall shell and assembly function may activate before advanced stage equipment/decor.                                                   |
| **Upgrade and branch links**            | Grand theatre, museum/gallery, civic complex, festival precinct or capital cultural wonder.                                                        |
| **Planner triggers and failure states** | Selected after basic needs stabilise or when culture/story/tourism demands rise. Provides little benefit if permanently unstaffed or inaccessible. |
| **Player-blueprint validation**         | Must satisfy crowd, exit, stage/focal and service requirements; player design may choose theatre, gallery, lecture hall or mixed cultural profile. |
| **Culture and style variation**         | Amphitheatre, clan saga hall, masked theatre, music court, memory gallery, dream theatre and floating performance arena.                           |

# 20. POC Implementation Scope

| **No.** | **Definition**                 | **POC Proof**                                      | **Required Dependencies**                        |
|---------|--------------------------------|----------------------------------------------------|--------------------------------------------------|
| 1       | Campfire Site                  | Settlement centre, gathering and shared cook/heat. | Fuel and fire safety.                            |
| 2       | Small Tent                     | Temporary housing validation.                      | Beds and weather cover.                          |
| 5       | Primitive Hut                  | First permanent house and staged construction.     | Path and basic light/heat.                       |
| 6       | Small Cottage                  | Player Blueprint Workshop to NPC-built home loop.  | Warehouse/project system; household assignment.  |
| 7       | Farmhouse                      | Mixed-use housing plus farm markers.               | Farm plot and tool storage.                      |
| 11      | Basic Farm Plot                | Seasonal food production and labour.               | Soil, seed, water/rain and storage.              |
| 13      | Barn                           | Farm storage/livestock support.                    | Feed and access.                                 |
| 14      | Granary                        | Protected reserve and spoilage reduction.          | Warehouse ledger/storage integration.            |
| 15      | Communal Kitchen               | Batch cooking and visible meals.                   | Well/water point from 20D, fuel and ingredients. |
| 21      | Healer Hut                     | Treatment, medicine and recovery.                  | Clean water and medicine items.                  |
| 25      | Small Shrine or Community Hall | Morale/culture event without mandatory religion.   | Culture profile and gathering event.             |

8.  Create approved developer reference blueprints for each POC definition.

9.  Create at least one player-made cottage blueprint in the main-menu workshop.

10. Place it in-world, resolve a local material palette and calculate stage resources.

11. Reserve resources from village storage, assign builders and construct visibly.

12. Activate housing only when access, shell and bed checks pass.

13. Run farm to granary to kitchen to household consumption with conserved totals.

14. Treat an injured NPC at the healer hut and show the Health cause summary.

15. Run a community event that changes Morale without creating a permanent entertainment demand.

16. Save, unload, abstract-simulate, reload and confirm capacities, stock and project history remain correct.

# 21. Balancing and Simulation LOD

| **Range**                   | **Simulation**                                                                                                                              |
|-----------------------------|---------------------------------------------------------------------------------------------------------------------------------------------|
| Near player                 | Visible residents collect food, work, sleep, receive treatment, attend events and build. Transactions can be grouped into coherent bundles. |
| Local loaded settlement     | Building cycles, household consumption, service queues and path/access checks run at bounded intervals or events.                           |
| Distant settlement          | Daily or multi-hour summary uses population, stock, capacity, staff, risk and project state; no individual pathfinding.                     |
| Very distant/inactive realm | Bounded event summaries with guaranteed resource conservation and persistent consequences.                                                  |

- Need summaries should update when relevant state changes and at a slow settlement tick, not every frame.

- Food and medicine remain integer-conserved resources even when distant simulation is abstract.

- Community events can be scheduled, story-driven or NPC-initiated; they do not require constant manual player activation.

- Large urban residential/service complexes aggregate by unit, wing or district where appropriate.

- Performance degradation that forces removal of identity, resource conservation or visible cause-and-effect is a redesign trigger.

# 22. Open Questions for Later Balancing

- Final resident capacity and footprint bands for each approved blueprint family after voxel scale tests.

- Default meal, crop, spoilage and reserve-day values by difficulty and season length.

- Household privacy and communal-living preferences for each culture pack in 20G.

- How guest lodging, tourism and migration interact with permanent housing capacity.

- Treatment throughput, recovery time and medical severity once combat and disease balance is playable.

- District service radius versus travel-time calculation for clinics, kitchens and community facilities in large cities.

- How often festivals and culture events should occur without becoming repetitive or exploitable.

- Which magical food, healing and housing branches belong as upgrades in 20E versus culture variants in 20G.

# Appendix A. 20A Data Field Template

| **Field Group** | **Required Fields**                                                                                                |
|-----------------|--------------------------------------------------------------------------------------------------------------------|
| Identity        | catalogue_no, stable_id, display_name_key, family, category, owner_document, version, status                       |
| Progression     | earliest_stage, project_class, prerequisites, unlocks, upgrade_from, upgrade_to, branch_tags                       |
| Needs           | primary_need, secondary_needs, capacity_type, capacity_value/profile, service_radius/profile, morale/event tags    |
| Operation       | jobs, staff_min/max, inputs, outputs/services, cycles, storage links, tool tags, recipe links                      |
| Blueprint       | size class, bounds rules, required markers, optional markers, room profile, sockets, terrain rules, palette tokens |
| Construction    | stage profile, resource calculation mode, scaffolding, labour roles, partial activation, repair/damage states      |
| Simulation      | near tick/event hooks, distant summary fields, risk events, blocker reasons, save fields                           |
| Governance      | ownership, permissions, public/private use, culture compatibility, law restrictions, player submission policy      |
| Presentation    | icon, UI category, description, warnings, codex links, planning notes                                              |

# Appendix B. POC Acceptance Checklist

- All 11 POC definitions have stable data records and reference blueprints.

- Cottage can be authored in both player creation modes using the same format.

- Housing capacity is denied when beds, access or shell validation fails.

- Farm output, food storage, kitchen processing and consumption conserve resources.

- Granary changes reserve/spoilage behaviour rather than producing food.

- Healer hut uses staff, medicine and recovery capacity and exposes clear blocker text.

- Community hall supports culture-neutral and culture-specific profiles.

- NPC planner can select required versus optional projects without duplicate spam.

- Construction uses reserved resources and visible stages nearby, summaries at distance.

- Damage/repair can reduce and restore capacity without duplicating buildings.

- Save/reload preserves household assignments, stock, service state, project history and player blueprint reference.

# Appendix C. Cross-System Dependency Matrix

| **20A System**          | **Required External Systems**                                                 | **Primary Data Exchange**                                                         |
|-------------------------|-------------------------------------------------------------------------------|-----------------------------------------------------------------------------------|
| Housing                 | NPC households, voxel blueprints, roads/access, climate, save system.         | Residents, beds, suitability, assignments, damage and migration capacity.         |
| Food production         | Biomes/soil, items, recipes, jobs, storage, weather/seasons.                  | Inputs, crop/animal state, output items, labour and risk.                         |
| Food processing/reserve | Recipes, fuel/power, water, storage/warehouse, automation.                    | Batch transactions, output, spoilage, reserve days and blocked outputs.           |
| Health                  | NPC health, medicine items, water/sanitation, combat/events, magic cleansing. | Patients, severity, treatment capacity, recovery and outcomes.                    |
| Community/morale        | Culture/faction, quests/events, governance, reputation, UI.                   | Event capacity, compatibility, attendance summary, memories and morale modifiers. |
| Player blueprints       | Document 19 editor, validation, content registry, multiplayer permissions.    | Blueprint ID/version, markers, palette, approved status and runtime reference.    |
