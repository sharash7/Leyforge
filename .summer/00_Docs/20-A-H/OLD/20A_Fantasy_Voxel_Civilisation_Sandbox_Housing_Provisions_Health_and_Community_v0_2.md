# Fantasy Voxel Civilisation Sandbox

## 20A - Housing, Provisions, Health and Community

### Detailed Functional Registry, Blueprint Forge Contracts and Settlement Service Rules

**Version 0.2 - Unified Forge and Runtime Integration Revision**

*A controlled registry for homes, households, food production, reserves, livestock support, healthcare, welfare, hospitality, culture and community projects. Version 0.2 preserves the approved seven-needs model while integrating Blueprint Forge source authoring, semantic contracts, staged construction, runtime baking, persistent structure records and the revised Technical POC scope.*

| **Field** | **Locked Direction** |
|---|---|
| Document Scope | Detailed rules and registry entries for catalogue definitions 1-2, 4-22 and 24-30 from Document 20H v0.2, plus dependencies on Builder Supply Yard (3) and Hospital Complex (23). |
| Needs Lock | Housing, Provisions, Health, Work, Safety, Infrastructure and Morale remain the only main settlement needs. Privacy, variety, sanitation, culture, guest lodging, livestock welfare and reserves remain sub-calculations or service details. |
| Source-of-Truth Rule | 20A owns functional meaning and service requirements; Blueprint Forge owns official editable voxel source; the runtime bake owns derived products; structure instances own save-state; Document 19 exposes only a restricted compatible player creator. |
| Resource Rule | Food, medicine, fuel, livestock products, construction materials and other goods remain conserved. Capacity, decorations and distant simulation cannot invent resources. |
| Blueprint Forge Direction | Every official source uses typed semantic layers, material roles, construction stage deltas, state deltas, dependency records, validators and deterministic bake products. |
| Player Blueprint Direction | Eligible player designs may satisfy existing 20A definitions after restricted validation. They cannot create new universal functions, bypass resources or expose developer-only registry and migration controls. |
| NPC Growth Direction | Settlements choose required, optional, conditional, upgrade and recovery projects using stage, demand, shortages, households, terrain, culture, risk, access, resources, maintenance and available specialists. |
| Simulation Direction | Nearby NPCs visibly sleep, eat, work, receive care and attend events. Distant settlements preserve named residents, stock, capacity, service states, incidents and history through bounded summaries. |
| POC Direction | 20A contributes five Core Infrastructure definitions and six Extended Forest Hamlet definitions. No 20A entry belongs to the Raid Extension. |
| Balance Direction | Use readable capacity bands and exact blocker causes. Final voxel costs compile from approved source blueprints; final throughput and reserve values remain balance data. |

> **Locked Scope Rule**
>
> A building may contribute to several needs, but it does not create a new need meter. A completed visual shell grants no housing, food, treatment or morale service unless its required markers, zones, routes, staff, stock, utilities, permissions and runtime state validate.

## Revision 0.2 Summary

Version 0.2 is a structural integration pass rather than a redesign of domestic settlement gameplay. It preserves the approved building families, seven-needs model, resource conservation, NPC autonomy and detailed registry entries while changing how those rules connect to the Unified Forge and runtime.

The principal changes are:

- Official developer blueprints are now authored in Blueprint Forge, not owned by the restricted player-facing creator.
- Universal definitions, editable source blueprints, construction projects, runtime bake products and placed structure instances are explicitly separated.
- Shared `marker.*`, `zone.*`, `socket.*` and `material_role.*` contracts replace local or implied marker naming.
- Housing, food, health and community entries now identify Blueprint Forge source expectations and persistent runtime data.
- Construction stages use the shared Document 20 vocabulary and compile into per-stage deltas.
- Upgrades can use inherited source, attached modules or explicit upgrade deltas rather than duplicating entire structures.
- Damage, contamination, occupation, abandonment, repair and restoration can invalidate only affected service regions where semantic data allows.
- The old eleven-entry POC block is divided into five Technical POC Core entries and six Extended Forest Hamlet entries.
- Godot/Summer Engine records, validators and bake products are described without replacing the human-readable design rules.

# Document Purpose

Document 20A is the definitive functional specification for the domestic and social side of Leyforge settlements. It defines what makes housing suitable, how households receive capacity, how settlements produce and protect provisions, how livestock facilities connect creatures to civilisation, how care and emergency welfare work, and how community spaces produce meaningful social opportunities without becoming an entertainment treadmill.

The document also defines the contract between gameplay and authoring. A universal definition explains what a cottage, farm, granary, healer hut or community hall means. Blueprint Forge supplies one or more editable voxel sources that satisfy that definition. A construction project turns a selected source into visible stages and exact resource reservations. The bake pipeline creates efficient Godot runtime products. A persistent structure instance then stores ownership, occupants, stock, service state, damage and history.

The goal remains depth without routine micromanagement. NPCs manage ordinary sleeping, eating, treatment, animal care and community schedules. Players make meaningful decisions when demand, shortage, damage, culture, migration, crisis, expansion or design creates a visible problem or opportunity.

# Design Sources and Dependencies

| **Source** | **20A Dependency** |
|---|---|
| 03 - Blocks Registry | Functional blocks, voxel material families, doors, beds, stations, storage, crop cells, fluids, hazards, damage states and block entities. |
| 04 - Items Registry | Food, medicine, tools, bedding, fuel, household goods, culture goods, livestock feed, water containers and ownership. |
| 05 - Crafting and Recipe Registry | Cooking, milling, preserving, treatment supplies, construction stages, repair recipes, batch transactions and by-products. |
| 06 - Resource Progression | Food/fuel availability, material progression, preservation, medicine inputs, rare culture goods and advanced construction substitutions. |
| 07 - NPC Village System | Named residents, households, jobs, schedules, consumption, health, morale, migration, memories, death, requests and simulation LOD. |
| 08 - Automation System | Farm, kitchen, storage and delivery automation; machine interfaces; item routing; power dependencies and bounded throughput. |
| 09 - Magic System | Magical food, cleansing, healing, ritual spaces, enchanted housing, wards, corruption treatment and late-game branches. |
| 10 - Creatures and Monsters | Livestock and mount profiles, creature size, feed, disease, raids, dangerous wildlife and animal entity LOD. |
| 11 - Biomes and World Generation | Soil, seasons, climate, water, coastlines, terrain, crop suitability, fishing sites, settlement placement and environmental hazards. |
| 12 - Structures | Persistent structure identity, damage, repair, restoration, occupation, ruin and world-state evidence. |
| 13 - Races, Peoples, Cultures and Factions | Household compatibility, food traditions, care customs, community profiles, faith/philosophy, governance and mixed settlements. |
| 15 - Quest and Event System | Migration, famine, harvests, outbreaks, disasters, festivals, mourning, visitors, recovery and persistent outcomes. |
| 16 - Combat, Gear and Defence | Injuries, raids, refuge, emergency care, fire, evacuation, protected reserves and persistent damage. |
| 17 - UI/UX System | Seven-needs overview, household and service inspection, blocker text, reserve days, patient load, event schedules and blueprint diagnostics. |
| 19 - Settlement Growth and Player Voxel Blueprint System | Settlement growth, project selection and the restricted in-world/main-menu creator that authors compatible player designs. |
| 20 v0.2 | Shared record separation, semantic namespaces, construction stages, runtime states, packs, project planning and persistence rules. |
| 20H v0.2 | Stable IDs, catalogue numbers, owner, stage, planner class, revised POC scope and Forge production status. |
| 20B-20G | Workplaces; governance/safety; storage/routes/water/sanitation; magic/industry; complexes; culture/biome/faction/realm packs. |
| 21A-21G | Voxel Asset Forge material, block, item, prop, variant, registry, UI and runtime visual foundations. |
| 22I | Blueprint Forge source authoring, semantic layers, construction stages, upgrades, dynamic states, terrain adaptation and validation. |
| 22J | Unified Forge navigation, dependency graph, lifecycle, Test Laboratory and creator workflow. |
| 22K | Godot/Summer Engine resource architecture, deterministic bake, caches, runtime products, migrations, diagnostics and CI gates. |

# Static Table of Contents

- 1. Locked 20A Identity
- 2. Scope Boundaries and Anti-Micromanagement Rules
- 3. Source-of-Truth and Record Separation
- 4. Seven-Needs Integration
- 5. Shared Capacity, Coverage and Service Model
- 6. 20A Semantic Marker, Zone and Socket Contracts
- 7. Housing, Households and Accommodation
- 8. Provisions, Production, Processing and Reserves
- 9. Livestock and Animal-Support Rules
- 10. Health, Welfare and Emergency Care
- 11. Community, Culture, Hospitality and Morale
- 12. NPC Planner and Project Selection
- 13. Blueprint Forge Authoring and Official Source Validation
- 14. Restricted Player-Creator Validation
- 15. Construction Stages, Commissioning and Partial Activation
- 16. Upgrade Inheritance, Conversion and Replacement
- 17. Damage, Contamination, Occupation, Repair and Restoration
- 18. Networks and Cross-System Service Dependencies
- 19. Settlement-Stage Expectations
- 20. Detailed Registry Summary
- 21. Temporary and Residential Entries
- 22. Farming, Food and Livestock Entries
- 23. Health and Welfare Entries
- 24. Community, Culture and Hospitality Entries
- 25. Technical POC and Extended Forest Hamlet Scope
- 26. Simulation LOD, Persistence and Multiplayer Authority
- 27. Balancing, Diagnostics and Anti-Exploit Rules
- 28. Godot/Summer Engine Implementation Direction
- 29. Open Questions for Later Balancing
- Appendix A. 20A Functional Definition Field Template
- Appendix B. 20A Semantic Contract Matrix
- Appendix C. POC Acceptance Checklist
- Appendix D. Cross-System Dependency Matrix
- Appendix E. Validation and Diagnostic Code Catalogue

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

| **Layer** | **Authority** | **20A Relationship** |
|---|---|---|
| Universal function | 20A and 20H | Stable identity, stage, needs, capacity model, planner class and validation profile. |
| Official source blueprint | 22I Blueprint Forge | Voxel composition, modules, semantic layers, material roles, stages, states, placement and source dependencies. |
| Runtime bake | 22K Forge pipeline | Collision, navigation, marker tables, room/service proxies, stage products, LODs and diagnostics. |
| Player-authored source | Document 19 restricted creator | Compatible source using permitted markers, materials, stages and pack fields; no registry replacement. |
| Pack resolution | 20G | Culture, region, biome, faction, realm, history and approved player-style resolution. |
| Construction project | 20 / NPC settlement runtime | Site, selected source, resolved materials, reservations, labour, stage progress and blockers. |
| Structure instance | Runtime/save system | Ownership, occupants, staff, inventories, condition, service state, history and source version. |
| Household/service records | 07 plus domain systems | Named residents, household membership, patients, events, recipes, livestock, service queues and need contribution. |

## 3.3 Non-Duplication Rules

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
| Housing | Primary authority for permanent and temporary accommodation capacity. | Suitable beds, household compatibility, climate, access, condition, spare capacity, displacement and overcrowding. | Privacy, guest rooms, furnishing, heating or density. |
| Provisions | Primary authority for food production, processing, service and protected reserve behaviour. | Net flow, reserve days, water/fuel, preservation, variety, season, route and contamination. | Food, water, fuel, clothing and winter stock as separate bars. |
| Health | Primary authority for treatment, recovery and emergency welfare; linked to sanitation and magical cleansing. | Patients, severity, staff, beds, medicine, clean routes, water, sanitation and outbreak load. | Medicine, hygiene, sanitation and corruption care as separate bars. |
| Work | Secondary contribution through farming, cooking, milling, care, hospitality and culture jobs. | Staff, skills, tools, workplace safety, inputs, outputs and travel. | Employment or specialist count as a separate need. |
| Safety | Secondary contribution through shelter, safe food, refuge, evacuation and care. | Fire, collapse, contamination, weather, emergency access and household protection. | Fire safety, refuge or quarantine as separate needs. |
| Infrastructure | Strong dependency on storage, roads, water, sanitation, power, mana and district services. | Route access, utility capacity, service coverage, loading, maintenance and network failure. | Roads, water, sanitation and power as separate needs. |
| Morale | Primary authority for community/event capacity and a secondary outcome of stable housing, food and health. | Compatibility, access, events, hospitality, mourning, memories, recent history and exclusion. | Fun, beauty, spirituality, socialising or tourism as separate needs. |

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
- Distant summaries use the same conserved authoritative totals as local simulation.

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

## 7.1 Suitable Housing Contract

A permanent housing place is credited only when:

1. A compatible permanent bed or household place exists.
2. It belongs to a valid habitable room or dwelling unit.
3. The entrance and internal route are reachable by the assigned resident envelope.
4. The shell meets current weather and climate requirements.
5. Fire, collapse, contamination and hostile-occupation checks pass.
6. Required heat, light, water or other stage-aware support is available.
7. Ownership and permission allow the household assignment.
8. The place is not already reserved for an incompatible occupant or service.

## 7.2 Household Records

Household identity is separate from the structure. A household record can contain members, relationships, culture, accessibility, privacy preferences, shared inventory permissions, preferred home, temporary displacement and historical homes.

A structure instance stores the dwelling units and assignments it currently hosts. This allows a household to survive relocation, disaster, blueprint replacement or settlement migration without losing identity.

## 7.3 Accommodation Types

| **Type** | **Counts Toward Permanent Housing** | **Typical Use** |
|---|---:|---|
| Temporary sleep place | No, except under emergency rules | Tent, expedition bedroll, construction camp. |
| Permanent household place | Yes | Hut, cottage, farmhouse, longhouse unit, townhouse or apartment. |
| Guest lodging | No | Inn guest room, diplomatic or visitor accommodation. |
| Worker accommodation | Conditional | Seasonal workforce, megaproject camp or short-term guild lodging. |
| Recovery bed | No | Healer hut or clinic. |
| Refuge bed | Temporary emergency capacity | Disaster, raid or displacement. |
| Quarantine bed | No | Isolation and treatment only. |
| Guard or duty bunk | Normally no civilian housing | Barracks or duty post owned by 20C. |

## 7.4 Overcrowding and Displacement

Overcrowding is a strain state rather than an instant failure. It may reduce suitability, sleep quality and morale and can increase health or fire risk, but residents remain assigned until relocation, expansion or emergency policy resolves the shortage.

Damage or occupation may invalidate individual rooms, beds, entrances or service routes. Semantic room and route data allows the runtime to preserve unaffected dwelling units where safe instead of disabling the whole building.

## 7.5 Mixed-Use Housing

Shop-houses, farmhouses and other mixed-use sources must separate incompatible private, public, delivery and hazard routes. Housing capacity is calculated independently from the attached workplace or service. One side can pause or suffer damage without inventing or deleting the other side's capacity.

# 8. Provisions, Production, Processing and Reserves

Provisions is a settlement security category, not only a food count. It considers conserved food stock, net production, water and fuel dependency, preservation, reserve protection, route reliability, season, contamination and emergency demand.

## 8.1 Provision Chain

```text
Source or Import
    -> Harvest / Catch / Animal Output
    -> Accessible Storage
    -> Processing / Cooking / Preservation
    -> Household or Service Distribution
    -> Consumption
    -> Waste / By-product / Reserve Update
```

## 8.2 Production Rules

- Farms bind to valid terrain, soil, climate, water and crop profiles.
- Fisheries bind to real water and ecology profiles.
- Livestock output requires supported animals, feed, water and care.
- Recipes own exact inputs, outputs, time and by-products.
- Buildings own stations, staff, buffers, route, safety and service capacity.
- Daily consumption may be batched, but important resources remain integer-conserved.
- No building produces from an unbound decorative field, empty pond or painted machine.

## 8.3 Reserve and Reservation Rules

- Food stock can be available, household-owned, workplace-owned, project-reserved, trade-bound or emergency-reserved.
- A granary changes capacity, protection and spoilage risk; it does not create food.
- Emergency policy may release protected stock with an explicit record and consequence.
- Persistent shortages create planner pressure for production, processing, storage, route, trade or policy changes.
- Spoilage, theft, contamination and destruction require defined events or transactions.

## 8.4 Food Variety

Food variety is a morale, health-risk and resilience modifier rather than a separate need. A settlement can survive on a narrow staple supply but becomes more vulnerable to crop failure and may receive reduced morale or cultural compatibility. Exact expectations vary by stage, culture, world settings and available ecology.

## 8.5 Service and Distribution

Households may cook privately, use a communal kitchen, buy prepared food, receive institutional meals or use culture-specific equivalents. The simulation chooses valid service routes according to ownership, access, schedule, capacity and policy. The player sees shortages and bottlenecks rather than assigning each meal.

# 9. Livestock and Animal-Support Rules

- Livestock, mounts and draft creatures use Entity Forge body, movement and interaction profiles.
- A stable, barn or paddock declares supported creature envelopes and occupancy types.
- Feed, water, shelter, access and care are real service dependencies.
- Human and animal routes must avoid unsafe conflicts where profiles require separation.
- Breeding, taming, veterinary detail and creature-specific outputs remain linked systems; 20A owns facility-facing requirements.
- Pens and stables may support Work, Provisions and Infrastructure depending on the assigned creature profile.
- Occupancy is limited by compatible markers, enclosure, route and welfare profile, not visible empty floor area.
- Distant simulation preserves important named animals and bounded herd records, feed, health events and outputs without pathfinding every creature.
- Damage can breach an enclosure, invalidate feed storage or block service access and may create escape, injury or recovery events.

# 10. Health, Welfare and Emergency Care

## 10.1 Care Layers

| **Layer** | **Rule** |
|---|---|
| Routine care | Staff, treatment markers, medicine, clean access and recovery capacity handle ordinary injury and illness. |
| Prevention | Safe food, clean water, sanitation, shelter and hazard control modify risk through linked systems. |
| Outbreak response | Quarantine or mode-specific refuge activates when a relevant incident exists. |
| Emergency care | Raid, disaster and mass-casualty loads can temporarily change priorities and capacity. |
| Magical harm | Cleansing and corruption treatment link to 20E and 09 rather than duplicating those systems. |
| Permanent consequence | Death, disability, migration, fear and mourning follow NPC, combat, world-setting and event rules. |

## 10.2 Patient and Treatment Records

A patient remains a named entity record. Treatment queues reference patient, severity, treatment profile, responsible facility, staff, consumed supplies, progress, outcome and incident. Distant simulation may resolve bounded treatment intervals but may not replace named outcomes with unexplained population changes.

## 10.3 Clean and Dirty Separation

Care sources declare clean, treatment, recovery, contaminated and service routes where required. Profiles may be simple for a healer hut and more rigorous for a clinic. A culture-specific treatment house can use different rooms or rituals while still satisfying the functional contract.

## 10.4 Emergency Welfare

Worker/refugee shelters and quarantine/emergency shelters provide temporary capacity. They should activate when migration, disaster, outbreak, housing loss or project labour creates real demand. Keeping temporary shelter as permanent housing may create privacy, health or morale strain but does not instantly evict occupants.

# 11. Community, Culture, Hospitality and Morale

Morale begins with the outcomes of the other six needs and recent settlement history. Community facilities add social capacity, identity, hospitality, counselling, ritual, remembrance, performances and positive events. They are not passive generators that require one building every fixed number of residents.

## 11.1 Community Function Profiles

| **Universal Function** | **Possible Expression** |
|---|---|
| Assembly and identity | Shrine, ancestor hall, civic lodge, spirit grove, secular hall or clan house. |
| Hospitality | Tavern, feast lodge, tea house, caravanserai, bath inn or traveller sanctuary. |
| Celebration | Market green, ritual meadow, festival square, amphitheatre court or floating platform. |
| Mourning and memory | Cemetery, ancestor wall, cremation garden, spirit forest or memory archive. |
| Performance and culture | Theatre, saga hall, museum, music court, dream stage or lecture hall. |

## 11.2 Active Use Rule

A structure contributes through valid access, cultural compatibility, current capacity and actual or scheduled use. An unused or inaccessible hall provides little or no active morale service. Recent successful events, counselling, mourning, visitor hosting and ceremonies create bounded modifiers and memories.

## 11.3 Culture and Faith Boundaries

20A defines the universal functional slot. 20G and 13 define culture, faith, government and faction expression. No ancestry receives one automatic architecture or belief. Mixed settlements may support several compatible community profiles or develop a hybrid form over time.

## 11.4 Hospitality and Visitors

Guest beds and public service positions support trade, migration, quests and diplomacy but do not become permanent household capacity. Visitor demand can create work and morale opportunities while also consuming food, water, security and route capacity.

# 12. NPC Planner and Project Selection

## 12.1 Planner Pipeline

1. Measure housing suitability, provision security, patient load, livestock support, community access and recent incidents.
2. Identify exact causes: missing capacity, inaccessible service, no staff, no stock, unsafe condition, seasonal risk, culture mismatch or network failure.
3. Filter eligible definitions by stage, project class, site, terrain, culture, law, knowledge, ownership, specialists and source availability.
4. Score build, upgrade, repair, conversion, trade, recruitment, policy and temporary-response alternatives.
5. Select an approved official or player source through Blueprint Forge/runtime registries.
6. Reserve site, source version, material roles, resources, workers and construction stages.
7. Commission the completed structure and recalculate services.
8. Record why it was selected and avoid redundant spam while existing projects or spare capacity can solve the demand.

## 12.2 Project Classes

| **Class** | **20A Examples** | **Rule** |
|---|---|---|
| Required | Permanent housing, farm plot, kitchen, granary and healer access at expected stages. | Chosen when a stage-critical capability is missing; approved equivalents may satisfy it. |
| Optional | Farmhouse, barn, mill, bakery, inn, festival grounds. | Scored from local demand, opportunity, culture, economy and available resources. |
| Conditional | Fishery, refugee shelter, quarantine shelter, cemetery. | Enters the pool only when environment, crisis, demographics, culture or story permit. |
| Upgrade | Hut to cottage, healer hut to clinic, kitchen or farm expansion. | Used when existing site and continuity make an upgrade better than a separate build. |
| Repair/Recovery | Roof repair, contamination cleanup, shelter restoration. | Selected when damaged service is cheaper or more important than replacement. |
| Player Proposal | Approved cottage, farm, hall or inn source. | Requires functional, legal, site, cost and pack validation. |

## 12.3 Planner Anti-Spam Rules

- Existing spare capacity and active projects reduce duplicate scores.
- Travel and district coverage matter more than raw building count.
- Temporary crisis structures are not automatically made permanent.
- A single high-capacity source may be preferred over many tiny copies when routes and culture allow.
- Culture and player style influence source choice but cannot override function or safety.
- Persistent maintenance burden, displacement and construction disruption reduce project score.

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

Commissioning revalidates the resolved source in its actual site and state. It checks access, markers, utilities, inventories, staff, permissions and safety. A built shell that fails commissioning remains **Dormant**, **Paused** or **Unsafe** with exact reasons.

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

| **Dependency** | **20A Use** | **Owner** |
|---|---|---|
| Roads and paths | Household, work, delivery, patient, guest, animal and emergency access. | 20D |
| Shared storage | Food, medicine, fuel, tools, emergency reserve, project stock and service buffers. | 20D |
| Water | Drinking/service access, cooking, care, washing, animals and irrigation. | 20D |
| Sanitation and wastewater | Housing density, care cleanliness, food safety and bathhouse operation. | 20D |
| Power and heat | Mills, kitchens, preservation, dense housing, clinics and advanced services. | 20D/20E |
| Mana and cleansing | Magical care, preservation, warded refuge and culture-specific services. | 20E |
| Workplaces and trade | Tools, containers, clothes, medicine, imported food and specialist succession. | 20B |
| Governance and safety | Housing rights, emergency policy, public access, reserve release, evacuation and protected sites. | 20C |
| District plans | Service distribution, density, campus-scale health and community coverage. | 20F |
| Culture/biome/realm packs | Household forms, food practices, care expression, material roles and functional replacements. | 20G |

## 18.1 Weakest-Link Rule

A service is limited by the weakest required link. A clinic with medicine but no clean water is limited. A farm with good soil but no worker route is inaccessible. A cottage with beds but an unsafe roof is unsuitable. Redundant routes, stores and utilities can reduce total failure.

## 18.2 Resource Authority

20A requests and consumes goods through shared inventory and transaction services. It does not maintain hidden duplicate food, medicine or fuel totals inside a building script.

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

| **No.** | **Stable ID** | **Definition** | **Earliest Stage** | **Primary Need** | **Planner Class** | **Delivery Scope** |
|---:|---|---|---|---|---|---|
| 1 | `building.temporary.campfire_site` | Campfire Site | Camp | Morale | Required | Technical POC - Core |
| 2 | `building.residential.small_tent` | Small Tent | Camp | Housing | Required | Technical POC - Core |
| 4 | `building.residential.worker_refugee_shelter` | Worker or Refugee Shelter | Camp | Housing | Conditional | Alpha |
| 5 | `building.residential.primitive_hut` | Primitive Hut | Hamlet | Housing | Required | Extended Slice |
| 6 | `building.residential.small_cottage` | Small Cottage | Hamlet | Housing | Required | Technical POC - Core |
| 7 | `building.residential.farmhouse` | Farmhouse | Hamlet | Housing | Optional | Extended Slice |
| 8 | `building.residential.communal_longhouse` | Communal Longhouse | Hamlet | Housing | Optional | Alpha |
| 9 | `building.residential.townhouse_shop_house` | Townhouse or Shop-House | Town | Housing | Optional | Beta |
| 10 | `building.residential.apartment_house` | Apartment House | City | Housing | Optional | Beta |
| 11 | `building.food.basic_farm_plot` | Basic Farm Plot | Hamlet | Provisions | Required | Technical POC - Core |
| 12 | `building.food.irrigated_terraced_farm` | Irrigated or Terraced Farm | Village | Provisions | Optional | Alpha |
| 13 | `building.food.barn` | Barn | Hamlet | Provisions | Optional | Extended Slice |
| 14 | `building.food.granary` | Granary | Village | Provisions | Required | Extended Slice |
| 15 | `building.food.communal_kitchen` | Communal Kitchen | Hamlet | Provisions | Required | Technical POC - Core |
| 16 | `building.food.grain_millhouse` | Grain Millhouse | Village | Provisions | Optional | Alpha |
| 17 | `building.food.bakery_food_workshop` | Bakery or Food Workshop | Village | Provisions | Optional | Alpha |
| 18 | `building.food.preserving_house` | Preserving House | Town | Provisions | Optional | Beta |
| 19 | `building.livestock.stable_paddock` | Stable and Paddock | Hamlet | Work | Optional | Alpha |
| 20 | `building.food.fishery_fishing_dock` | Fishery or Fishing Dock | Hamlet | Provisions | Conditional | Alpha |
| 21 | `building.health.healer_hut` | Healer Hut | Village | Health | Required | Extended Slice |
| 22 | `building.health.clinic_infirmary` | Clinic or Infirmary | Town | Health | Optional | Beta |
| 24 | `building.welfare.quarantine_emergency_shelter` | Quarantine or Emergency Shelter | Village | Health | Conditional | Alpha |
| 25 | `building.community.small_shrine_hall` | Small Shrine or Community Hall | Village | Morale | Optional | Extended Slice |
| 26 | `building.hospitality.tavern_inn` | Tavern or Inn | Village | Morale | Optional | Alpha |
| 27 | `building.community.bathhouse_laundry` | Bathhouse and Laundry | Town | Health | Optional | Beta |
| 28 | `building.community.festival_grounds` | Festival or Community Grounds | Village | Morale | Optional | Alpha |
| 29 | `building.community.memorial_cemetery` | Memorial and Cemetery | Village | Morale | Conditional | Alpha |
| 30 | `building.community.cultural_hall_theatre` | Cultural Hall or Theatre | Town | Morale | Optional | Beta |

Catalogue numbers **3** and **23** are intentionally absent from 20A ownership. Builder Supply Yard is owned by 20D; Hospital Complex is owned by 20F. Their services remain critical dependencies for construction staging and city-scale care.

# 21. Temporary and Residential Entries

### 1. Campfire Site

`building.temporary.campfire_site`

| **Catalogue role**                      | Temporary / Community \| Camp \| Micro \| Required \| Technical POC - Core                                                                                        |
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

| **Catalogue role**                      | Residential / Temporary \| Camp \| Small \| Required \| Technical POC - Core                                                                              |
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

| **Catalogue role**                      | Residential / Welfare \| Camp \| Medium \| Conditional \| Alpha                                                                |
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

| **Catalogue role**                      | Residential \| Hamlet \| Small \| Required \| Extended Slice                                                               |
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

| **Catalogue role**                      | Residential \| Hamlet \| Small \| Required \| Technical POC - Core                                                                                     |
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

| **Catalogue role**                      | Residential / Food \| Hamlet \| Medium \| Optional \| Extended Slice                                                                                    |
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

| **Catalogue role**                      | Residential / Community \| Hamlet \| Large \| Optional \| Alpha                                                                            |
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

| **Catalogue role**                      | Residential / Mixed Use \| Town \| Medium \| Optional \| Beta                                                                                    |
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

| **Catalogue role**                      | Residential / Urban \| City \| Large \| Optional \| Beta                                                                              |
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
| **Pack and style resolution**         | Row blocks, courtyard compounds, cliff dwellings, cavern terraces, living towers and floating residential modules.                    |

# 22. Farming, Food and Livestock Entries

### 11. Basic Farm Plot

`building.food.basic_farm_plot`

| **Catalogue role**                      | Food / Agriculture \| Hamlet \| Parcel \| Required \| Technical POC - Core                                                                               |
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

| **Catalogue role**                      | Food / Agriculture \| Village \| Large Parcel \| Optional \| Alpha                                                                        |
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

| **Catalogue role**                      | Food / Livestock \| Hamlet \| Medium \| Optional \| Extended Slice                                                              |
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

| **Catalogue role**                      | Food / Storage \| Village \| Small \| Required \| Extended Slice                                                                                                     |
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

| **Catalogue role**                      | Food / Community \| Hamlet \| Small \| Required \| Technical POC - Core                                                                                                  |
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

| **Catalogue role**                      | Food / Processing \| Village \| Medium \| Optional \| Alpha                                                                         |
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

| **Catalogue role**                      | Food / Artisan \| Village \| Small \| Optional \| Alpha                                                                                     |
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

| **Catalogue role**                      | Food / Processing \| Town \| Medium \| Optional \| Beta                                                                                      |
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

| **Catalogue role**                      | Livestock / Transport \| Hamlet \| Medium Parcel \| Optional \| Alpha                                                                   |
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

| **Catalogue role**                      | Food / Water \| Hamlet \| Medium \| Conditional \| Alpha                                                                            |
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
| **Pack and style resolution**         | River jetty, coastal pier, stilt village dock, ice fish house, cavern platform and floating kelp farm.                              |

# 23. Health and Welfare Entries

### 21. Healer Hut

`building.health.healer_hut`

| **Catalogue role**                      | Health \| Village \| Small \| Required \| Extended Slice                                                                                            |
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

| **Catalogue role**                      | Health \| Town \| Medium \| Optional \| Beta                                                                                                                         |
|-----------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Health \| Secondary: Infrastructure, Safety                                                                                                                 |
| **Purpose**                             | Expands treatment, triage and short-term recovery for a town, military site or dense district.                                                                       |
| **Capacity / service**                  | Several treatment/recovery positions with triage and medicine support; exact capacity derives from staff, beds and utilities.                                        |
| **Jobs and users**                      | Healer/physician, nurse/orderly, apothecary and optional cleaner or porter.                                                                                          |
| **Inputs**                              | Medicine, clean water, fuel/power, linens, food and sanitation supplies.                                                                                             |
| **Outputs / services**                  | Higher treatment throughput, reduced death/recovery time, outbreak detection and emergency response support.                                                         |
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

| **Catalogue role**                      | Health / Welfare \| Village \| Medium \| Conditional \| Alpha                                                                                                  |
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
| **Pack and style resolution**         | Isolation cabins, monastery ward, earth shelter, ship quarantine pier, warded pavilion and portable relief hall.                                               |

# 24. Community, Culture and Hospitality Entries

### 25. Small Shrine or Community Hall

`building.community.small_shrine_hall`

| **Catalogue role**                      | Community / Culture \| Village \| Small \| Optional \| Extended Slice                                                                         |
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

| **Catalogue role**                      | Hospitality \| Village \| Medium \| Optional \| Alpha                                                                                                  |
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

| **Catalogue role**                      | Health / Community \| Town \| Medium \| Optional \| Beta                                                                              |
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

| **Catalogue role**                      | Community / Public Space \| Village \| Parcel \| Optional \| Alpha                                                           |
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

| **Catalogue role**                      | Community / Welfare \| Village \| Parcel \| Conditional \| Alpha                                                                                          |
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

| **Catalogue role**                      | Community / Culture \| Town \| Large \| Optional \| Beta                                                                                           |
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
| **Pack and style resolution**         | Amphitheatre, clan saga hall, masked theatre, music court, memory gallery, dream theatre and floating performance arena.                           |


# 25. Technical POC and Extended Forest Hamlet Scope

20A contributes eleven of the protected thirty Forest Hamlet definitions. Version 0.2 divides them into five Core Infrastructure proofs and six Extended Slice entries.

## 25.1 Technical POC Core - Five Definitions

| **No.** | **Definition** | **Primary Proof** |
|---:|---|---|
| 1 | Campfire Site | Settlement centre, interaction marker, fuel, fire safety and first staged project. |
| 2 | Small Tent | Temporary housing, protected volume, occupant assignment and condition. |
| 6 | Small Cottage | Restricted player blueprint, household capacity, ownership, source versioning and save migration. |
| 11 | Basic Farm Plot | Terrain-bound production, seasonal state, work access and conserved harvest. |
| 15 | Communal Kitchen | Inputs, water/fuel, recipes, service capacity, staff and blocked-state diagnostics. |

These five connect to Builder Supply Yard, Village Warehouse, paths, water and the wider Core Infrastructure proof defined by Document 20 and 20H.

## 25.2 Extended Forest Hamlet - Six Definitions

| **No.** | **Definition** | **Primary Proof** |
|---:|---|---|
| 5 | Primitive Hut | Transition from temporary to permanent housing. |
| 7 | Farmhouse | Mixed-use household and agricultural support. |
| 13 | Barn | Farm storage, animal access and entity compatibility. |
| 14 | Granary | Protected reserve, reservation and spoilage behaviour. |
| 21 | Healer Hut | Named treatment, medicine and recovery service. |
| 25 | Small Shrine or Community Hall | Culture-neutral community capacity and active morale events. |

## 25.3 20A POC Scenario

1. A camp establishes a Campfire Site and Small Tent.
2. Builder stock and a route/water link become available through 20D.
3. The player authors or edits a Small Cottage through the restricted creator.
4. The source validates, resolves material roles and becomes a construction project.
5. NPC builders complete visible stages and commission the dwelling.
6. A household is assigned and persists through save/load.
7. A Basic Farm Plot produces conserved food according to season and work.
8. The Communal Kitchen consumes stock, water and fuel and provides batch meals.
9. The extended slice adds protected reserve, healthcare and community identity.
10. Raid damage may reduce housing, reserve, treatment or community capacity and create repair projects without deleting structure identity.

## 25.4 Acceptance Lock

- All eleven protected definitions have stable records, correct scope labels and at least one approved source or validated test fixture.
- The five Core entries complete source-to-bake-to-project-to-instance flow.
- Cottage proves restricted player creation, semantic validation, pack resolution, construction stages, persistent household assignment and source migration.
- Farm and Kitchen preserve exact input/output transactions locally and at distance.
- Granary changes reserve safety and spoilage risk without generating food.
- Healer Hut preserves named patients, medicine use and outcomes.
- Community Hall supports culture-neutral and pack-resolved profiles without one mandatory religion.
- Damage and repair alter only affected functions where semantic data permits.
- Save/load preserves source ID/version, pack resolution, household, stock, service state, damage and history.

# 26. Simulation LOD, Persistence and Multiplayer Authority

## 26.1 Simulation Ranges

| **Range** | **Simulation Direction** |
|---|---|
| Near player | Visible sleep, food collection, work, treatment, animal care, events and construction. Interactions may bundle several authoritative transactions. |
| Loaded settlement | Bounded household consumption, production cycles, service queues, access checks and event updates. |
| Distant settlement | Multi-hour or daily summaries using named population, stock, capacity, staff, condition, route and incident state. |
| Very distant or inactive realm | Bounded event summaries with conservation, identity, project state and persistent consequences. |

## 26.2 Persistent Minimum

Every placed 20A structure retains at least:

- Stable structure-instance ID.
- Universal definition ID and version.
- Source blueprint ID and source version.
- Resolved pack and material-role references.
- Owner, access and permission profile.
- Household, resident, guest, animal, staff or patient links as applicable.
- Authoritative inventories or inventory references.
- Construction and commissioning history.
- Primary lifecycle and secondary operational states.
- Damage groups, contamination, repair and occupation history.
- Relevant event, service and contribution records.

## 26.3 Multiplayer Authority

The authoritative host owns construction, inventory transactions, household assignment, patient outcomes, livestock ownership, service state and damage. Clients may predict local presentation but cannot create capacity, resources, beds or treatment outcomes by modifying visual source data.

Compatible source and pack hashes are checked before joining a shared world. Cosmetic deterministic variation may differ only where the server permits and where it does not affect function or collision.

# 27. Balancing, Diagnostics and Anti-Exploit Rules

## 27.1 Balance Principles

- Earlier housing and food systems remain useful as low-cost or specialised options.
- Larger buildings gain capacity but also require more land, utilities, staff, routes and maintenance.
- Community services provide bounded active benefits and cannot permanently maximise Morale.
- Food security should reward diversity and reserves without demanding constant variety optimisation.
- Health systems reduce risk and improve recovery but do not erase serious consequences automatically.
- Culture-specific equivalents should be different, not simply stronger.
- Exact values are data-driven and tuned after voxel scale, travel, season and population tests.

## 27.2 Anti-Exploit Rules

- Duplicate beds cannot overlap or occupy invalid zones.
- Markers outside the source bounds or disconnected from valid routes do not count.
- Decorative crop blocks do not create production.
- Decorative food, medicine or animal props do not create stock or capacity.
- One guest or treatment bed cannot simultaneously count as a permanent household place.
- Splitting one room with invisible zones cannot bypass fire, climate, privacy or route rules.
- A community hall cannot stack unlimited passive bonuses through duplicate focal markers.
- Player sources cannot lower resource costs by hiding required functional modules outside construction stages.
- Source revision cannot retroactively repair or refill existing world instances.

## 27.3 Diagnostic Standard

Every blocking diagnostic should include:

- Stable code.
- Severity.
- Affected source element or runtime instance.
- Human-readable reason.
- Expected requirement.
- Current resolved value.
- Suggested correction where safe.
- Whether the issue blocks source approval, construction, commissioning or only one service.

# 28. Godot/Summer Engine Implementation Direction

## 28.1 Recommended Resource Records

| **Resource or Record** | **Purpose** |
|---|---|
| `BuildingDefinition20A` | Immutable functional identity, need/service profile, planner and validator references. |
| `HousingProfile` | Bed types, household compatibility, climate and suitability rules. |
| `ProvisionServiceProfile` | Production, processing, reserve, service and consumption integration. |
| `LivestockFacilityProfile` | Creature envelopes, occupancy, feed/water and route requirements. |
| `HealthServiceProfile` | Treatment, recovery, staff, supplies, sanitation and patient logic. |
| `CommunityServiceProfile` | Gathering/event capacity, compatibility, attendance and bounded morale outcomes. |
| `BlueprintSourceDefinition` | Editable Forge source reference, semantic layers, stages, states and dependencies. |
| `BuildingBakeManifest` | Derived marker tables, room/service proxies, collision/nav products and state products. |
| `ConstructionProjectRecord` | Site, source, resolved materials, reservations, labour, stage and blockers. |
| `StructureInstanceRecord` | Persistent placed structure identity and state. |
| `HouseholdAssignmentRecord` | Household-to-dwelling unit and bed assignments. |
| `ServiceRuntimeRecord` | Current staff, queues, inputs, outputs, condition and summary state. |

## 28.2 Service Boundaries

- Definition registry resolves immutable 20A function data.
- Blueprint registry resolves approved source IDs and versions.
- Forge bake service produces runtime manifests and caches.
- Construction service owns stage progression and material transactions.
- Structure service owns placed instance lifecycle and damage.
- Household service owns people and assignments.
- Inventory/logistics service owns stock and movement.
- Production service owns recipe transactions.
- Health service owns patient treatment and outcomes.
- Event service owns festivals, mourning, hospitality and incidents.
- Settlement planner owns project scoring but does not mutate definitions.

## 28.3 Implementation Principles

- Use stable IDs, typed resources and registries rather than path-based gameplay links.
- Keep source resources immutable during runtime; store changing state in records.
- Compile marker and room queries into efficient bake tables.
- Update settlement service summaries on relevant events and bounded ticks, not every frame.
- Preserve deterministic transactions and save migrations.
- Test Core Infrastructure definitions as golden fixtures before broad content production.
- Use Summer Engine AI assistance for schema drafting, validators, tests and documentation, with human review for migrations, data authority and gameplay balance.

# 29. Open Questions for Later Balancing

- Final resident and footprint ranges after voxel scale and navigation tests.
- Exact household privacy and communal-living preferences per approved culture pack.
- Final meal, crop, spoilage and reserve-day values by difficulty and season length.
- How clothing basics and household fuel should contribute inside Provisions without adding routine chores.
- Guest lodging, tourism and migration demand at Town and City scale.
- Treatment throughput, recovery duration and severity after combat and disease prototypes.
- District travel thresholds for clinics, kitchens, hospitality and community venues.
- Frequency and variety of NPC-initiated festivals, performances and remembrance events.
- Final animal facility occupancy and route envelopes for mounts, livestock and unusual fantasy creatures.
- Which magical food, care and housing branches remain 20E upgrades versus 20G pack replacements.
- How much historical household and memorial data should remain in very old saves before archival aggregation.

# Appendix A. 20A Functional Definition Field Template

| **Field Group** | **Required Fields** |
|---|---|
| Identity | `catalogue_no`, `stable_id`, `display_name_key`, `family`, `category`, `owner_document`, `definition_version`, aliases. |
| Progression | Earliest stage, planner class, delivery scope, prerequisites, unlocks, upgrade/branch links and world-setting gates. |
| Needs and service | Primary need, secondary needs, capacity type, demand profile, coverage/access rules and status causes. |
| Operation | Jobs, staff, skills, inputs, outputs, services, recipe links, inventories, tools, utilities and maintenance. |
| Semantic contract | Required/optional markers, zones, sockets, entity envelopes, incompatibilities and validator profile. |
| Source requirements | Source blueprint family, module rules, material roles, construction stage profile, state/damage deltas and placement profile. |
| Construction | Resource compilation, labour roles, partial activation, commissioning, repair, conversion and demolition continuity. |
| Runtime | Persistent fields, lifecycle, secondary states, service record type, simulation-LOD summary and event hooks. |
| Governance | Ownership, permissions, public/private access, emergency policy, culture compatibility and restricted player submission. |
| Presentation | UI category, icon/capture profile, descriptions, warnings, codex links and accessibility/readability notes. |
| Production | Definition status, source lifecycle, bake status, gameplay status, test status, balance status and migration state. |

# Appendix B. 20A Semantic Contract Matrix

| **Family** | **Required Markers** | **Required Zones** | **Common Sockets** | **Critical State Checks** |
|---|---|---|---|---|
| Temporary shelter | Entrance, temporary sleep, household anchor. | Protected interior, private circulation. | Footpath, optional heat. | Wet/collapsed, unsafe fire, blocked entrance. |
| Permanent housing | Entrance, permanent beds, household anchor, personal storage. | Habitable room, private route. | Footpath, water/heat where expected, upgrade. | Roof/shell, fire, contamination, occupation. |
| Farm | Work/tool, cultivated/harvest markers. | Cultivated parcel, service route. | Water, storage output, farm module. | Season, water, soil, access, blight/damage. |
| Food processing | Workstation, input/output, operator, maintenance. | Clean/hot/dirty as required. | Storage, water, fuel/power, waste. | Input starved, output blocked, unsafe, contaminated. |
| Livestock | Creature occupancy, feed, water, handler. | Animal work/enclosure, human service route. | Route, storage, enclosure module. | Feed/water, breach, incompatible creature, disease. |
| Health | Treatment, recovery, medicine, staff. | Treatment/recovery, clean/dirty, emergency route. | Water, sanitation, emergency supply, mana if used. | Overload, contamination, no staff/medicine, unsafe access. |
| Community | Gathering, focal/speaker/performer as profile requires. | Public gathering, service/backstage if used. | Public route, service delivery, temporary event modules. | Capacity, egress, compatibility, occupation/damage. |

# Appendix C. POC Acceptance Checklist

- Five 20A Core definitions and six Extended Slice definitions use the scope labels from 20H v0.2.
- Every Core definition has approved functional data, one source or golden fixture, construction stages, bake products and scenario tests.
- Cottage can be authored in both restricted player creation modes using the same compatible source contract.
- Housing capacity is denied when beds, habitable zone, access, shell, permissions or safety fail.
- Farm output, kitchen processing and household/service consumption conserve resources.
- Core structures preserve source ID/version, resolved pack, construction history and runtime state through save/load.
- Granary changes reserve protection and spoilage risk rather than producing food.
- Healer Hut uses staff, medicine, treatment/recovery capacity and named patients.
- Community Hall supports culture-neutral and pack-resolved functional profiles.
- NPC planner selects required versus optional/conditional projects without redundant spam.
- Damage and repair reduce and restore affected capacity without replacing the structure identity.
- Distant simulation produces the same net resource and patient outcomes as bounded local test cases within accepted tolerance.

# Appendix D. Cross-System Dependency Matrix

| **20A System** | **Required External Systems** | **Primary Data Exchange** |
|---|---|---|
| Housing | NPC households, Blueprint Forge, routes, climate, utilities, permissions and saves. | Residents, beds, units, suitability, assignments, condition and migration capacity. |
| Food production | Biomes/soil, items, recipes, jobs, storage, weather/seasons and water. | Crop/animal/site state, output items, labour, season and risk. |
| Food processing and reserve | Recipes, fuel/power, water, storage/logistics and automation. | Batch transactions, stock, spoilage, reserve days and blocked states. |
| Livestock | Entity Forge, creatures, feed/water, jobs, routes and ownership. | Animal identity/herd, occupancy, feed, health, output and enclosure state. |
| Health | NPC health, medicine, water/sanitation, combat/events and magic cleansing. | Patients, severity, staff, treatment, supplies, recovery and outcome. |
| Community and morale | Culture/faction, quests/events, governance, reputation and UI. | Capacity, compatibility, events, attendance, memories and morale modifiers. |
| Official sources | Blueprint Forge, Asset Forge, packs, validators and bake service. | Source ID/version, modules, roles, semantics, stages, states and runtime products. |
| Player sources | Document 19 creator, registries, permissions and multiplayer content checks. | Compatible source ID/version, creator, validation, pack choices and approval state. |

# Appendix E. Validation and Diagnostic Code Catalogue

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
| `20A-RESOURCE-CONSERVATION` | Fatal | A transaction creates, duplicates or deletes authoritative stock without a valid rule. |
