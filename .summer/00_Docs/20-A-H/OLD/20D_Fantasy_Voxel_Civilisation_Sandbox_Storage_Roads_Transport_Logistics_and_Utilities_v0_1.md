**Fantasy Voxel Civilisation Sandbox**

**20D - Storage, Roads, Transport, Logistics and Utilities**

**Version 0.1 - Detailed Building Family and Settlement Infrastructure Registry Draft**

*A controlled registry for shared storage, project reserves, paths, roads, bridges, freight, water access, sanitation and public utility networks, allowing settlements to move real resources and function at scale without turning the player into a warehouse clerk, traffic controller or plumbing engineer.*

| **Field** | **Locked Direction** |
|---|---|
| Document Scope | Detailed rules and registry entries for catalogue definition 3 and definitions 81-90 from Document 20H, plus cross-document storage, access, transport, logistics, water and sanitation dependencies. |
| Needs Lock | Housing, Provisions, Health, Work, Safety, Infrastructure and Morale remain the only main settlement needs. Storage, route quality, water access, sanitation, freight capacity and maintenance are causes and sub-calculations, not extra need meters. |
| Primary Focus | Builder supply, shared storage, warehouses, specialised depots, paths, roads, bridges, docks, loading, hauling, water points, cisterns, aqueducts, pumps, drainage, sanitation, waste and public service coverage. |
| Resource Rule | Physical goods remain conserved. Storage contains owned stock; projects reserve exact stock; transport moves stock between valid inventories; utilities provide bounded capacity from real sources and infrastructure. |
| Player Blueprint Direction | Eligible player-made blueprints and network layouts may replace developer versions after storage markers, ownership, loading, access, route sockets, slopes, clearances, water safety, flow, maintenance and hazard rules validate. |
| NPC Growth Direction | Settlements select infrastructure projects using shortages, travel cost, blocked access, storage pressure, water demand, sanitation load, terrain, trade routes, threat, weather, staffing, resources, maintenance and future expansion. |
| Simulation Direction | Nearby NPCs visibly carry, load, unload, draw water, maintain roads and respond to blockages. Distant settlements process bounded inventory transfers, route capacity, utility coverage, deterioration and event summaries. |
| POC Direction | Prove Builder Supply Yard, Small Storehouse, Village Warehouse, Dirt Path and Road Junction Set and Village Well in the Forest Hamlet loop, including exact stock, project reservations, NPC access, warehouse deliveries and saved state. |
| Balance Direction | Show readable causes such as storage fullness, route blocked, loading bottleneck, water capacity, contamination risk and repair backlog. Avoid individual thirst bars, manual item-by-item delivery orders and road placement as busywork. |

| **Locked Scope Rule** |
|---|
| **Infrastructure is one main need, not a bundle of separate warehouse, road, water, sanitation and transport bars.** The village overview shows the highest-value causes and blockers. Detailed screens expose stock categories, route state, coverage and maintenance only when the player inspects them. |

# Document Purpose

Document 20D turns the physical support backbone of the settlement catalogue into implementable building-family and network rules. It defines where shared resources are kept, how construction projects reserve them, how NPCs and vehicles reach homes and workplaces, how roads and crossings shape effective distance, how goods move without duplication, and how water and sanitation scale from a small hamlet to dense towns and cities.

The document deliberately avoids making the player approve every crate movement, assign every hauler, refill every household bucket or design a realistic sewer network. NPCs handle routine movement and consumption through policies, routes, priorities and service capacities. The player becomes involved when a shortage, bottleneck, route failure, project, disaster, trade opportunity, ownership conflict or major expansion creates a meaningful decision.

# Design Sources and Dependencies

| **Source** | **20D Dependency** |
|---|---|
| 03 - Blocks Registry | Storage blocks, roads, paths, stairs, bridges, doors, loading blocks, water blocks, drainage pieces, damage states, ownership and network connection rules. |
| 04 - Items Registry | Construction materials, food, tools, fuel, water containers, repair supplies, trade goods, project stock, waste, filters and utility components. |
| 05 - Crafting and Recipe Registry | Project recipes, reservations, loading/unloading, repairs, preservation, utility construction, batching and exact resource transactions. |
| 06 - Resource Progression | Resource categories, bulk materials, fuel, water, strategic stock, by-products, renewable supply and late-game logistics demands. |
| 07 - NPC Village System | Warehouses, inventories, haulers, builders, water access, project reserves, permissions, schedules, shortages, repairs and simulation LOD. |
| 08 - Automation System | Chutes, belts, carts, pipes, sorting, power, warehouse permissions, network flow, distribution centres and near/far item movement. |
| 09 - Magic System | Mana storage and conduits, ward supply, cleansing, magical water, portal logistics and later utility branches owned mainly by 20E. |
| 10 - Creatures and Monsters | Road danger, raids, theft, damaged stores, contaminated water, transport animals, route pressure and protected logistics. |
| 11 - Biomes and World Generation | Terrain, slope, rivers, coasts, water tables, rainfall, roads, bridges, harbours, floods, climate and buildable route corridors. |
| 12 - Structures | Blueprint volumes, network pieces, sockets, markers, ownership, dynamic states, damage, repair, restoration and structure LOD. |
| 13 - Races, Peoples, Cultures and Factions | Culture-specific roads, water customs, storage forms, public/private ownership, trade routes, sanitation expectations and transport traditions. |
| 15 - Quest and Event System | Shortages, deliveries, blocked roads, bridge collapse, drought, contamination, caravan events, repairs and infrastructure story consequences. |
| 16 - Combat, Gear and Defence | Emergency routes, gate access, supply lines, siege damage, protected warehouses, firefighting water and civilian evacuation. |
| 17 - UI/UX System | Village needs overview, warehouse ledger, route overlay, water/sanitation coverage, project stock, alerts and readable causes. |
| 19 - Settlement Growth and Player Voxel Blueprint System | Shared in-game and main-menu editors, network drawing, material tokens, construction stages, player submissions, parcel connections and validation. |
| 20 / 20H | Seven-needs lock, stable IDs, catalogue ownership, project classes, stage mapping, POC roster, blueprint targets and anti-bloat rules. |
| 20A / 20B / 20C / 20E / 20F / 20G | Household demand; production and trade; emergency access and defence; advanced automation/power/mana; district-scale networks; culture and realm variants. |

# Static Table of Contents

- 1. Locked 20D Identity
- 2. Scope Boundaries and Anti-Micromanagement Rules
- 3. Seven-Needs Integration
- 4. Shared Storage, Route and Utility Model
- 5. Runtime, Network and Service States
- 6. Storage Categories, Ownership, Reservations and Permissions
- 7. Paths, Roads, Access and Effective Distance
- 8. Bridges, Crossings, Terrain Adaptation and Weather
- 9. Transport Modes, Loading and Freight
- 10. Logistics, Deliveries, Priorities and Overflow
- 11. Water Sources, Wells, Cisterns, Aqueducts and Pumps
- 12. Sanitation, Drainage, Waste and Pollution
- 13. Maintenance, Damage, Hazards and Recovery
- 14. NPC Planner and Project Selection
- 15. Player Blueprint and Network Validation
- 16. Construction, Upgrade, Conversion and Replacement
- 17. Settlement-Stage Expectations
- 18. Detailed Registry Summary
- 19. Builder Supply and Storage Entries
- 20. Roads, Bridges and Transport Entries
- 21. Water and Sanitation Entries
- 22. POC Implementation Scope
- 23. Balancing and Simulation LOD
- 24. Open Questions for Later Balancing
- Appendix A. 20D Data Field Template
- Appendix B. Network and Service-Capacity Matrix
- Appendix C. POC Acceptance Checklist
- Appendix D. Cross-System Dependency Matrix

# 1. Locked 20D Identity

Document 20D is the settlement circulation, supply and public-service layer of the building registry. Its facilities and network projects make stock, access, transport, water and sanitation physically readable in the voxel world. They do not replace inventories, recipes, NPC jobs, automation or world generation; they give those systems shared places, routes, capacities, ownership and consequences.

| **Locked Rule** |
|---|
| A storage or infrastructure project only provides its advertised capacity when its physical markers, access, ownership, condition, staffing where required, source connections and operational states are valid. Decorative crates do not create inventory, disconnected roads do not provide route access, and a dry well does not provide water. |

| **Identity Layer** | **Design Meaning** | **Player-Facing Result** |
|---|---|---|
| Conserved Stock | Shared stores hold actual items with ownership, categories, reservations and transaction history. | Deliveries, theft, construction, trade and shortages use the same real stock. |
| Readable Access | Paths, roads, crossings, doors, loading points and route classes determine who and what can reach a site. | The player can see why a worker, cart, guard or caravan is delayed. |
| Scalable Logistics | Haulers, carts, animals, boats, machines and later advanced networks move goods through common contracts. | Settlements grow from hand-carrying to regional distribution without replacing earlier routes. |
| Public Utilities | Water, drainage, sanitation and waste are bounded services with sources, coverage, condition and maintenance. | Dense settlements require infrastructure, but the player does not manage individual thirst or bathroom use. |
| Terrain Integration | Roads and utilities adapt to slopes, rivers, coasts, caves, climate and settlement form. | Villages feel built into the world instead of pasted onto flat ground. |
| Persistent Consequence | Blocked routes, full stores, drought, contamination, fire, floods and damaged bridges create projects and history. | Infrastructure failures are visible, repairable and meaningful. |
| Scalable Simulation | Nearby movement is visible; distant movement and services use preserved summaries. | Large worlds remain performant without duplicating or deleting resources. |

# 2. Scope Boundaries and Anti-Micromanagement Rules

- The seven needs remain the only top-level needs. Storage, route capacity, water, sanitation, waste and transport are causes, services and statistics.

- Water is primarily a settlement access and capacity system. NPCs do not require a constantly ticking personal thirst meter by default.

- Households, workplaces and public facilities consume supplies through scheduled or event-driven transactions rather than one simulation transaction for every bite, sip or bucket.

- The player sets policies, priorities, permissions, route classes, project reservations and automation connections where allowed. Routine hauling and restocking remain NPC-managed.

- Storage capacity is created by validated storage markers and containers, not decorative floor area or arbitrary building volume.

- Roads reduce effective travel cost and unlock transport modes; they do not require manual traffic lights, lane scheduling or realistic traffic simulation.

- A path does not need to be perfectly paved to function. Early settlements use desire paths and dirt routes; upgrades improve reliability, capacity, weather resistance and safety.

- Transport is resource-conserving. Items move from one inventory to another through authoritative transactions; no route creates duplicate stock.

- Utilities use readable capacity bands and weakest-link logic. A large reservoir cannot provide full service if its intake, pump, distribution or access point is broken.

- Sanitation is abstracted at household, building, district and settlement levels. Individual toilet use, hygiene meters and detailed sewage chemistry are outside Version 0.1.

- Culture and biome variants can replace the physical form of a service without duplicating the universal function. A spring shrine, communal cistern, snow-melt tank or underground well may all satisfy water access when their validated service profiles are equivalent.

| **Explicit Non-Goals** |
|---|
| 20D does not require manual crate sorting, individual hydration bars, realistic vehicle traffic, full fluid dynamics for every pipe, municipal tax accounting, household bathroom schedules, exact sewage chemistry, or continuous pathfinding for every distant hauler. |

# 3. Seven-Needs Integration

| **Need** | **20D Contribution** | **Typical Failure Causes** |
|---|---|---|
| Housing | Roads, water, drainage, waste collection and deliveries make housing usable and reachable. | Isolated homes, no water access, flooding, waste buildup, blocked entrances or unsafe paths. |
| Provisions | Stores protect food, fuel and seasonal reserves; water systems provide bounded access; logistics move supplies. | Empty stores, spoilage, broken route, dry source, contaminated water, no fuel depot or project stock consuming reserves. |
| Health | Clean water, drainage, waste removal, dry storage, contamination control and emergency access support health. | Polluted source, stagnant drainage, vermin, spoiled food, waste overflow, floodwater or no clinic route. |
| Work | Roads, loading, storage, hauling and utility access connect workers, inputs and outputs. | Long travel, missing loading point, full output buffer, no tool stock, disconnected worksite or route danger. |
| Safety | Reliable roads support patrols and evacuation; bridges and stores require protection; water supports firefighting. | Collapsed crossing, dark route, raid on warehouse, unsafe dock, flood, fire, contamination or blocked gate approach. |
| Infrastructure | Storage, access, transport, water, sanitation and maintenance directly provide the need. | Insufficient capacity, damaged network, poor condition, missing staff, blocked permissions, no source or no repair stock. |
| Morale | Reliable clean services, short travel, tidy public areas and successful deliveries improve confidence. | Filth, smell, repeated shortages, lost goods, muddy roads, isolation, unfair access or visible neglect. |

# 4. Shared Storage, Route and Utility Model

The player-facing settlement overview should surface a small number of understandable causes rather than displaying a separate meter for every network. Detailed overlays and facility screens provide the deeper information.

| **Model** | **Calculation Direction** | **Player-Facing Example** |
|---|---|---|
| Effective storage | Valid storage capacity multiplied by condition, access, permissions and any required staffing or category compatibility. | Construction stock: 72% full; 40 stone blocked by private access. |
| Reserve security | Reserved quantity compared with project, emergency and seasonal targets, modified by theft, damage and spoilage risk. | Watchtower reserve: complete; food reserve: 4 days below target. |
| Route access | Connected route nodes, passable width, slope, surface, clearance, ownership, danger and destination sockets. | Carpenter: reachable by foot; carts blocked at narrow bridge. |
| Effective travel cost | Physical distance modified by route class, terrain, weather, congestion abstraction, vehicle and danger. | Warehouse trip: 58 seconds by path; 24 seconds by cart road. |
| Delivery throughput | Transport capacity, loading capacity, hauler availability, route quality, safety and destination buffer. | Iron delivery: 12 items/min; forge output buffer full. |
| Water coverage | The lowest valid capacity among source yield, extraction, storage, distribution and access points compared with stage-aware demand. | Water: Stable; well at 68% of peak capacity. |
| Sanitation coverage | Collection, drainage, treatment/disposal, maintenance and safe separation compared with generated load. | Sanitation: Strained; market drains overloaded after rain. |
| Maintenance backlog | Condition loss and faults weighted by service criticality, repair materials, workers and route access. | 3 critical repairs: bridge support, well cover, warehouse roof. |

| **Weakest-Link Rule** |
|---|
| Network service is normally limited by the weakest required link. A route with a strong road but blocked gate is blocked. A water system with a full cistern but broken pump has no pumped output. Optional redundant links can prevent total failure. |

# 5. Runtime, Network and Service States

## 5.1 Shared Facility States

| **State** | **Meaning** | **Typical Causes** |
|---|---|---|
| Planned | Site or network route is approved but construction has not begun. | Awaiting resources, labour, permission or season. |
| Supplied | Required stock for the next stage is reserved and reachable. | Warehouse reservation and valid route. |
| Building | NPCs or players are actively completing construction stages. | Builders assigned and worksite accessible. |
| Operational | Required markers, access, condition and service links are valid. | Normal use. |
| Strained | Service functions but demand, route, staffing or condition is near its limit. | High load, partial blockage, bad weather or low maintenance. |
| Blocked | Inventory or service exists but cannot be used or moved. | Full destination, closed access, broken route, ownership or danger. |
| Degraded | Damage or maintenance reduces capacity. | Wear, fire, flood, siege, contamination or neglect. |
| Contaminated | Stock, water or site carries health or magic risk. | Spoilage, waste, poison, corruption or floodwater. |
| Disabled | Core source, connection, marker or ownership is invalid. | Dry well, collapsed bridge, destroyed loading point or disputed control. |
| Abandoned | The facility no longer has valid users, ownership or maintenance. | Settlement decline, evacuation, conquest or route loss. |

## 5.2 Storage States

- Empty
- Available
- Reserved
- Full
- Overfilled or spill risk where permitted
- Locked or restricted
- Spoiled or contaminated
- Damaged
- Under audit
- Looted

## 5.3 Route States

- Open
- Slow
- Restricted
- Dangerous
- Flooded
- Snowed or buried
- Breached
- Collapsed
- Blocked
- Closed by law or ownership
- Under construction
- Under repair

## 5.4 Utility States

- Source available
- Source low
- Stored reserve
- Distributed
- Capacity strained
- Leak or loss
- Contamination warning
- Maintenance required
- Partial outage
- Full outage
- Emergency-only operation

# 6. Storage Categories, Ownership, Reservations and Permissions

Storage must remain understandable to NPCs, players, automation and save data. The system uses shared inventory contracts with category and permission fields rather than a bespoke script for every chest or warehouse.

## 6.1 Core Storage Categories

| **Category** | **Typical Contents** | **Priority Uses** |
|---|---|---|
| Food and water supplies | Fresh food, preserved food, ingredients, filled containers. | Daily consumption, emergency reserve, trade. |
| Construction | Logs, planks, stone, bricks, glass, fasteners and project components. | Blueprint projects, repairs, district work. |
| Tools and workplace stock | Tools, replacement parts, station components and consumables. | Jobs, maintenance, specialist services. |
| Fuel and heat | Firewood, charcoal, coal, oil-like fuels and later power inputs. | Cooking, heating, smelting, emergency warmth. |
| Guard and emergency | Weapons, armour, ammunition, medicine, fire tools and refuge stock. | Defence, rescue and crisis response. |
| Magic stock | Mana crystals, dust, runes, wards, catalysts and protected reagents. | Magic infrastructure and 20E systems. |
| Trade goods | Surplus, contracts, imports, exports and taxed goods. | Markets, caravans and faction exchange. |
| Project reserve | Exact items reserved to a named project stage. | Construction cannot consume unrelated reserves. |
| Restricted or hazardous | Poison, explosives, cursed goods, contraband and unstable materials. | Controlled access, special stores and laws. |
| Waste and by-products | Slag, ash, spoiled goods, scrap, refuse and recyclable materials. | Disposal, recovery, processing or hazard control. |

## 6.2 Ownership and Transaction Types

| **Ownership / transaction** | **Rule** |
|---|---|
| Personal | Belongs to one character; NPCs cannot use it without permission, theft or emergency law. |
| Household | Shared by a household according to culture and settlement policy. |
| Workplace | Reserved for one job site or production chain. |
| Settlement public | Available to approved public consumption and projects. |
| Project reserved | Locked to a project, stage and contribution ledger unless emergency override applies. |
| Emergency reserve | Protected for famine, raid, fire, disaster or evacuation policy. |
| Trade or contract | Held for a buyer, seller, caravan, delivery or price agreement. |
| Faction or government | Controlled by law, authority or occupation profile. |
| Donated | Ownership transfers to the settlement or named project. |
| Loaned | Ownership remains with the lender and return/consumption rules are recorded. |

## 6.3 Reservation Rules

- A project reserves exact item IDs or valid material tags from reachable authorised storage.

- Reservations reduce available stock but do not move items until builders or logistics claim them.

- Daily consumption does not take project stock unless an emergency policy explicitly overrides the reservation.

- A cancelled project releases unconsumed stock and records already consumed stages.

- Multiplayer contributions remain attributed in the warehouse ledger.

- Damaged, stolen or contaminated reserved stock creates a visible project blocker rather than silently replacing itself.

## 6.4 Access and Permissions

- Public, household, workplace, guard, guild, faction, player, automation and emergency access are separate permission flags.

- A building can contribute storage capacity but still provide little effective service when routes or permissions block intended users.

- NPCs may use player storage only when donation, contract, settlement law, shared ownership or explicit access allows it.

- Automation import and export require trusted connections, valid direction and category filters.

# 7. Paths, Roads, Access and Effective Distance

Roads are not cosmetic strips. They form a network graph connecting entrances, parcels, loading points, gates, bridges, docks, public spaces and district routes.

## 7.1 Route Classes

| **Route Class** | **Typical Users** | **Minimum Function** |
|---|---|---|
| Footpath | Residents, workers, small carried loads. | Walkable clearance and valid destination. |
| Service path | Builders, haulers, animals and maintenance workers. | Wider clearance and worksite/loading access. |
| Cart road | Handcarts, wagons, patrols and bulk goods. | Width, turning, slope and bridge compatibility. |
| Heavy freight road | Large wagons, machinery and military supply. | Durable surface, wider clearance and strong crossings. |
| Emergency route | Guards, healers, fire/rescue and evacuation. | Reliable priority access with limited blockage. |
| Public street | Customers, services, households and civic movement. | Connected buildings, lighting and stage-appropriate surface. |
| Water route | Boats, ferries, fishing and trade. | Navigable water, safe berth and route ownership. |
| Rail or guided route | Minecarts, industrial freight and later transit. | Owned mainly by 20E once powered/automated; 20D provides stations and corridors. |
| Portal route | Late-game freight and travel. | Owned by 20E; 20D exposes logistics and destination requirements. |

## 7.2 Effective Distance

NPC planning uses effective travel cost rather than straight-line distance.

Factors include:

- Surface and route class.
- Slope, stairs and elevation.
- Mud, snow, rain, ice, heat or sand.
- Light and threat.
- Gates, doors, permissions and opening hours.
- Bridge and crossing capacity.
- Carried load or vehicle.
- Congestion abstraction at dense settlements.
- Injury, mobility and culture-specific movement.
- Construction or damage.
- Patrol, emergency and priority access.

The player sees simple causes such as **No connected route**, **Foot access only**, **Cart route blocked**, **Unsafe at night**, or **Bridge overloaded**, not raw pathfinding costs.

## 7.3 Route Quality Bands

- Informal
- Basic
- Reliable
- Durable
- High-capacity
- Protected
- Advanced or magical

Earlier routes remain useful as local and low-cost access even after cities gain better roads.

# 8. Bridges, Crossings, Terrain Adaptation and Weather

A network blueprint can contain segments, nodes, supports, landings, retaining walls, drainage and sockets rather than one fixed monolithic structure.

## 8.1 Crossing Types

- Ford or shallow crossing.
- Stepping-stone crossing.
- Timber footbridge.
- Timber cart bridge.
- Stone arch bridge.
- Causeway.
- Raised wetland boardwalk.
- Suspension bridge.
- Drawbridge.
- Tunnel.
- Mountain stair or switchback.
- Ferry.
- Aqueduct bridge.
- Underground passage.
- Magical or portal crossing owned by 20E.

## 8.2 Validation Factors

- Span length and support points.
- Bank or landing stability.
- Clearance above water or route.
- Flood and debris risk.
- Width and load class.
- Guardrails or safe edges where appropriate.
- Navigation below and across.
- Foundation material.
- Weather and biome.
- Future expansion sockets.
- Damage and repair access.
- Ownership and toll/customs links where used.

## 8.3 Weather Effects

- Dirt paths become slower in prolonged rain unless drained.
- Snow and ice reduce speed and safety until cleared, adapted or magically treated.
- Floods can close fords, damage bridges and contaminate wells.
- Heat and drought reduce exposed water sources.
- Sand, ash, corruption growth and vegetation can obstruct neglected routes.
- Roads and drainage reduce weather disruption but create maintenance demand.

# 9. Transport Modes, Loading and Freight

The transport ladder supports visible progression without making every village require advanced machinery.

| **Mode** | **Typical Stage** | **Strength** | **Limitation** |
|---|---|---|---|
| Hand carry | Camp onward | No dedicated vehicle; works anywhere passable. | Low capacity and high labour cost. |
| Basket, barrow or handcart | Hamlet onward | Cheap local hauling. | Requires suitable path width and manageable slope. |
| Pack animal | Hamlet/Village | Good cross-country flexibility. | Needs animal, handler, feed and safe route. |
| Wagon or caravan | Village/Town | Regional bulk transport and trade. | Requires cart roads, turning, gates and crossings. |
| Boat or ferry | Conditional | Efficient water transport. | Requires navigable water, dock/landing and weather safety. |
| Minecart or rail | Town/industry | Reliable heavy freight. | Infrastructure and advanced ownership mainly in 20E. |
| Belt, chute or pipe | Automation path | Continuous local flow. | Power, filters, ports and machine rules from 08/20E. |
| Golem or magical carrier | Late magic | Programmable or specialist movement. | Mana, control, laws and risk from 09/20E. |
| Portal freight | Late game | Very fast long-distance logistics. | High cost, security, stabilisation and realm rules. |

## 9.1 Loading and Unloading

A facility that claims freight service requires valid markers:

- Loading zone.
- Unloading zone.
- Vehicle or animal clearance.
- Buffer inventory.
- Staff or automation interface.
- Category and ownership filters.
- Safe pedestrian separation where relevant.
- Route socket.
- Overflow behaviour.
- Emergency access.

Loading capacity can become the bottleneck even when the road and warehouse are large.

## 9.2 Transport Jobs

- Hauler.
- Porter.
- Carter.
- Teamster.
- Courier.
- Dock worker.
- Boat operator.
- Warehouse keeper.
- Quartermaster.
- Route maintainer.
- Logistics specialist.
- Caravan leader.

NPCs choose routine delivery tasks from priority queues. Players may set broad policies such as **Food first**, **Project materials**, **Emergency reserve**, **Trade export cap**, or **Do not use player stock**.

# 10. Logistics, Deliveries, Priorities and Overflow

## 10.1 Delivery Task Model

A delivery task records:

- Source inventory.
- Destination inventory.
- Item or category.
- Quantity.
- Ownership transfer.
- Reservation or contract.
- Priority.
- Allowed transport modes.
- Route requirements.
- Expiry or deadline.
- Risk and escort requirement.
- Completion and contribution history.

## 10.2 Default Priority Bands

1. Immediate safety and medical emergency.
2. Starvation, water and essential provisions.
3. Active defence and emergency repair.
4. Active project reservation.
5. Workplace input preventing critical service.
6. Normal household and workplace restock.
7. Trade contract.
8. Surplus export.
9. Low-priority redistribution and waste.

World settings, laws, conquest and player authority may change priorities, but the game should show the reason.

## 10.3 Overflow Rules

- Pause input when destination capacity is full.
- Reroute to an allowed equivalent store.
- Hold at source.
- Use an overflow yard or temporary cache.
- Spill physical items only for specific systems or harsh settings.
- Mark perishable loss or hazard risk.
- Create a new storage project when persistent pressure is high.

## 10.4 Logistics Failure Causes

- Source empty or stock reserved elsewhere.
- Destination full.
- No compatible category.
- No authorised ownership transfer.
- Loading marker blocked.
- No valid route for the selected mode.
- Hauler or vehicle unavailable.
- Threat too high.
- Weather closure.
- Damaged bridge, gate or dock.
- Schedule or curfew restriction.
- Automation power or filter failure.

# 11. Water Sources, Wells, Cisterns, Aqueducts and Pumps

Water is treated as settlement access, capacity, quality and resilience. It supports provisions, health, farming, livestock, production, firefighting, rituals and some automation.

## 11.1 Water Source Types

- Surface river, stream, lake or spring.
- Groundwater well.
- Rain collection.
- Snow or ice melt.
- Cistern or reservoir.
- Aqueduct.
- Hand pump.
- Mechanical pump.
- Powered pump.
- Magical source or purification system.
- Imported water in extreme conditions.

## 11.2 Water Service Chain

Source -> Intake -> Extraction -> Storage -> Distribution -> Access Point -> Consumer

Any required broken link reduces service. A simple village well combines several links in one facility. Town-scale systems separate them.

## 11.3 Water Quality

Quality uses readable states:

- Clean.
- Acceptable.
- Questionable.
- Contaminated.
- Corrupted or magically unstable.
- Unusable.

Quality can be affected by:

- Waste proximity.
- Flooding.
- Dead creatures.
- Industry.
- Saltwater intrusion.
- Corruption.
- Drought concentration.
- Damaged cover or lining.
- Poor maintenance.
- Ritual or alchemical effects.

## 11.4 Water Demand

Demand is calculated in settlement batches from:

- Population.
- Climate and season.
- Farming and livestock.
- Workshops and industry.
- Fire reserve.
- Healing and sanitation.
- Culture and settlement stage.
- Tourism or caravans.
- Emergency events.

The game does not need to simulate each sip. Nearby NPCs can still visibly visit wells or carry containers as part of schedules.

## 11.5 Access and Fairness

Water points have capacity, queue abstraction, route access and ownership. Public water can be restricted, taxed, rationed, contaminated, monopolised or defended, creating political and story consequences without adding another top-level need.

# 12. Sanitation, Drainage, Waste and Pollution

Sanitation begins simple and becomes important as density, industry and population grow.

## 12.1 Early Settlement Solutions

- Latrine zones.
- Composting.
- Waste pits placed away from water.
- Ash and refuse collection.
- Animal manure management.
- Drainage ditches.
- Wash areas.
- Burial or safe disposal rules.
- Periodic NPC maintenance.

## 12.2 Town and City Solutions

- Covered drains.
- Sewers.
- Waste carts.
- Treatment ponds.
- Compost works.
- Recycling and salvage yards.
- Industrial waste stores.
- Public bath and laundry links.
- Street cleaning.
- Floodwater channels.
- Magical cleansing where culturally available.

## 12.3 Sanitation Load

Generated load depends on:

- Population and density.
- Markets, inns and visitors.
- Livestock.
- Food processing.
- Workshops and industry.
- Rainfall and flooding.
- Disease events.
- Waste reuse.
- Culture and world settings.

## 12.4 Failure Effects

- Health pressure.
- Morale loss.
- Vermin and creature attraction.
- Water contamination.
- Flooding.
- Smell and visual neglect.
- Fire load.
- Corruption or magical instability.
- Faction concern.
- Reduced trade and migration appeal.

## 12.5 Simplification Rule

Sanitation uses coverage, capacity, placement and events. It does not require personal hygiene bars or real-time sewage particles through every block.

# 13. Maintenance, Damage, Hazards and Recovery

Infrastructure is allowed to deteriorate, but routine maintenance should not become constant punishment.

## 13.1 Maintenance Sources

- Weather exposure.
- Traffic and load.
- Water and erosion.
- Fire.
- Siege or creatures.
- Rot, rust and pests.
- Blocked drains.
- Flooding.
- Ice and freeze-thaw.
- Contamination.
- Magical corruption.
- Overloaded automation.
- Neglect or abandonment.

## 13.2 Maintenance Policy

- Normal facilities warn and degrade before catastrophic failure.
- Critical networks receive higher NPC repair priority.
- Preventive maintenance consumes small scheduled resources when available.
- Harsh settings may increase wear; relaxed settings may reduce or disable routine deterioration.
- Repeated overload or ignored warnings can create major failures.
- Repairs consume real blocks, components and labour.
- Player or leadership policy can protect heritage routes, emergency links or strategic stores.

## 13.3 Criticality Bands

- Local convenience.
- Household service.
- Production support.
- Settlement essential.
- Emergency critical.
- Regional strategic.

A damaged decorative lane is lower priority than a collapsed bridge isolating the clinic or a contaminated well.

## 13.4 Recovery

Recovery can include:

- Temporary bypass.
- Emergency cache.
- Water rationing.
- Alternative route.
- Ferry or temporary bridge.
- Repair scaffold.
- Clean-up project.
- Quarantine.
- Stock relocation.
- Rebuild or upgrade.
- Abandonment and relocation.

# 14. NPC Planner and Project Selection

The settlement planner evaluates capability gaps and chooses projects from required, optional, conditional, upgrade and district pools.

## 14.1 Project Scoring

A draft score can include:

- Stage requirement.
- Population and demand.
- Storage pressure.
- Days of provisions remaining.
- Project backlog.
- Travel cost and route failures.
- Water coverage and resilience.
- Sanitation load.
- Production bottleneck.
- Trade opportunity.
- Threat and emergency access.
- Terrain suitability.
- Available staff and tools.
- Available construction resources.
- Maintenance burden.
- Culture preference.
- Player or faction priority.
- Future parcel and district plan.
- Duplicate capacity penalty.
- Risk and environmental impact.

## 14.2 Typical Planner Triggers

| **Problem** | **Likely Project Response** |
|---|---|
| Construction stock scattered or being consumed | Builder Supply Yard or Small Storehouse. |
| Daily goods exceed local storage | Small Storehouse, Specialised Depot or Warehouse upgrade. |
| Projects compete with food and repair stock | Village Warehouse with category zones and reservations. |
| Workers spend too much time walking | Path connection, junction, bridge or service route. |
| Carts cannot reach production sites | Road upgrade, widening, turning space or stronger bridge. |
| Water coverage is low | Well, water point, cistern, pump or distribution project. |
| Drought or fire risk is high | Cistern/reservoir, secondary source or emergency reserve. |
| Dense settlement has health pressure | Drainage, waste collection or sanitation system. |
| Trade is limited by water access | Dock or harbour when terrain and routes support it. |
| Warehouse is full but goods cannot move | Loading improvement, route repair, depot or distribution centre. |

## 14.3 Player Influence

The player may:

- Donate or sell project resources.
- Submit alternative blueprints.
- Reserve land or routes.
- Set broad logistics priorities.
- Grant automation access.
- Build roads or utilities directly.
- Repair blockages.
- Establish trade routes.
- Protect caravans.
- Choose between competing growth approaches.
- Impose or negotiate access policies where authority allows.

The settlement should still choose routine tasks and maintenance on its own.

# 15. Player Blueprint and Network Validation

Player designs use the same functional checks as official blueprints. Main-menu designs can be tested against synthetic terrain and service profiles; in-world designs also validate live ownership, terrain, roads, sources, hazards and settlement rules.

## 15.1 Shared Validation

- Stable blueprint or network ID.
- Allowed footprint, height and segment limits.
- Valid construction stages.
- Material tokens resolve to valid blocks/items.
- Required markers and sockets exist.
- Entrances and service points are reachable.
- No protected parcel or route is illegally blocked.
- Damage, repair and upgrade anchors are valid.
- Ownership and public/private circulation are declared.
- Capacity comes only from valid functional markers.
- World and server content restrictions are respected.

## 15.2 Storage Validation

- Storage zones or containers.
- Category compatibility.
- Public, private and restricted access.
- Loading/unloading point.
- Ledger or control marker where required.
- Safe aisles and worker reach.
- Fire, moisture, vermin and contamination rules.
- Project reserve zone for warehouses.
- Overflow behaviour.
- Automation ports where declared.

## 15.3 Road and Bridge Validation

- Connected start/end nodes.
- Route class and width.
- Slope and step limits.
- Vehicle clearance.
- Turning space where needed.
- Bridge supports, landings and load class.
- No invalid intersection with doors, parcels or protected structures.
- Emergency and maintenance access.
- Drainage and weather adaptation where required.
- Segment cost and stage completeness.

## 15.4 Dock Validation

- Navigable water.
- Berth and approach clearance.
- Safe loading edge.
- Dry storage/loading access.
- Route connection to settlement.
- Flood/tide or water-level tolerance appropriate to world rules.
- Rescue access and lighting.
- Ownership and customs hooks where used.

## 15.5 Water and Sanitation Validation

- Valid source or intake.
- Safe separation from waste and contamination.
- Access point and route.
- Capacity markers.
- Cover, lining, filter or treatment markers where required.
- Drainage destination.
- Maintenance access.
- Overflow/flood handling.
- Hazard and restricted zones.
- No service credit from decorative water alone.

| **Validation Principle** |
|---|
| A player design may be visually unusual and still be valid. The validator protects function, accessibility, resource conservation, safety and save stability; it should not force one architectural style. |

# 16. Construction, Upgrade, Conversion and Replacement

## 16.1 Construction Stages

Typical infrastructure projects use:

1. Survey and route/site reservation.
2. Clearing, excavation or foundation.
3. Primary structure or network segments.
4. Surface, containers, lining or supports.
5. Functional markers and access.
6. Utility, drainage, loading or control components.
7. Inspection, activation and connection.
8. Optional finish, lighting, culture detail or prestige.

Micro projects may use two to four stages. Large roads, aqueducts and sanitation networks are split into independently useful segments.

## 16.2 Network Construction

- Segments reserve and consume exact resources.
- NPCs build from reachable completed segments.
- Junctions, bridges, gates and stations are explicit nodes.
- A partially built route can provide limited foot access when safe.
- Function activates per completed valid segment rather than waiting for an entire city network.
- Failed or cancelled routes preserve built blocks and records.
- Player edits trigger local revalidation rather than rebuilding the whole network record.

## 16.3 Upgrade Types

- Capacity expansion.
- Material durability.
- Weather resistance.
- Loading and throughput.
- Category specialisation.
- Security and access.
- Automation connection.
- Water storage or pressure.
- Sanitation treatment.
- Route class.
- Bridge load class.
- Lighting and safety.
- Magical or dimensional branch owned mainly by 20E.

## 16.4 Conversion and Replacement

Examples include:

- Supply yard to construction depot.
- Storehouse to granary or tool depot.
- Warehouse to trade, food, guard or automated branch.
- Dirt road to gravel/stone road.
- Ford to bridge.
- Well to covered pump house.
- Waste pit to managed sanitation utility.
- Dock to harbour.
- Temporary bypass removed after permanent repair.

Conversion must preserve or explicitly transfer owned stock and project reservations.

# 17. Settlement-Stage Expectations

| **Stage** | **Expected 20D Capability** | **Required or Typical Projects** | **Not Required Yet** |
|---|---|---|---|
| Camp | Shared build stock and basic access. | Builder Supply Yard or equivalent; informal paths. | Permanent warehouse, sanitation network or formal road system. |
| Hamlet | Basic shared storage, reliable water and paths between homes, food and work. | Small Storehouse; Village Well or valid water point; dirt paths. | Sewers, paved streets, harbours or powered distribution. |
| Village | Category storage, project reserves, recognised junctions and access to core services. | Village Warehouse; Dirt Path/Road Junction Set; route to hall, market, work and defence. | Town-scale aqueduct or automated distribution. |
| Fortified Village | Protected stores, emergency access, gates and resilient critical routes. | Warehouse security, perimeter road links, fire-water access, bridge repair priority. | Full urban sanitation unless density demands it. |
| Town | Durable roads, specialised depots, drainage/sanitation and conditional water or harbour systems. | Stone Road/Bridge upgrades; Specialised Depot; sanitation or expanded water where demand requires. | Every town does not need a harbour, rail or aqueduct. |
| City | Multiple warehouses, district logistics, high-capacity utilities and distribution. | Automated Distribution Centre or equivalent; district water/sanitation and major routes. | Portal logistics unless magic progression supports it. |
| Capital | Redundant strategic stores, regional routes, protected water and civic utility coordination. | National or faction branches through 20F/20G; multiple backup networks. | One universal layout; culture and terrain should strongly vary. |
| Magical Metropolis | Networked logistics, advanced mana/portal support and exceptional resilience. | 20E/20F advanced systems linked to 20D storage, route and utility contracts. | Basic infrastructure is not deleted; it remains local and fallback capacity. |

# 18. Detailed Registry Summary

| **No.** | **Stable ID** | **Definition** | **Earliest Stage** | **Primary Need** | **Project Class** | **Status** |
|---:|---|---|---|---|---|---|
| 3 | building.infrastructure.builder_supply_yard | Builder Supply Yard | Camp | Infrastructure | Required | POC Required |
| 81 | building.storage.small_storehouse | Small Storehouse | Hamlet | Infrastructure | Required | POC Required |
| 82 | building.storage.village_warehouse | Village Warehouse | Village | Infrastructure | Required | POC Required |
| 83 | building.storage.specialised_depot | Specialised Depot or Silo | Village | Infrastructure | Optional | Alpha |
| 84 | building.storage.automated_distribution_centre | Automated Distribution Centre | City | Infrastructure | Optional | Beta |
| 85 | project.transport.dirt_path_junction_set | Dirt Path and Road Junction Set | Camp | Infrastructure | Required | POC Required |
| 86 | project.transport.stone_road_bridge_set | Stone Road and Bridge Set | Village | Infrastructure | Upgrade | Alpha |
| 87 | building.transport.dock_harbour | Dock or Harbour | Town | Infrastructure | Conditional | Beta |
| 88 | building.utility.village_well | Village Well or Water Point | Hamlet | Provisions | Required | POC Required |
| 89 | project.utility.cistern_aqueduct_pump | Cistern, Aqueduct or Pump System | Town | Infrastructure | Conditional | Beta |
| 90 | project.utility.sanitation_waste_system | Sanitation and Waste Utility | Town | Infrastructure | Optional | Beta |

Catalogue definition 3 is included because Document 20H assigns the POC Builder Supply Yard to 20D. Advanced rail, powered conveyors, portal freight, mana distribution and major industrial utilities are primarily owned by 20E. District-scale transit, utility campuses and regional megaprojects are owned by 20F.

# 19. Builder Supply and Storage Entries

### 3. Builder Supply Yard

building.infrastructure.builder_supply_yard

| **Catalogue role** | Construction / Storage Support \| Camp \| Small \| Required \| POC Required |
|---|---|
| **Need contribution** | Primary: Infrastructure \| Secondary: Work, Safety |
| **Purpose** | Establishes a visible project staging area where construction materials, scaffolds, tools and blueprint anchors can be reserved before a permanent warehouse exists. |
| **Capacity / service** | Draft low shared capacity for one or two active early projects, determined by valid supply crates, material bays and scaffold markers. |
| **Jobs and users** | Builder, foreman, hauler, carpenter, mason, player contributor and settlement planner. |
| **Inputs** | Construction blocks, scaffolding, tools, rope, fasteners, blueprint/project records and repair supplies. |
| **Outputs / services** | Project staging, builder task pickup, visible reserved stock, temporary repair supply and construction progress feedback. |
| **Required blueprint markers** | Project anchor, supply crate, material bays, tool rack, scaffold stack, builder work point, loading edge and route socket. |
| **Placement and utilities** | Near the settlement centre or active project area on accessible ground. It requires a path and must not obstruct future roads or building parcels. |
| **Construction profile** | 3 stages: clear/mark site; place crates, bays and scaffold; activate project ledger and builder access. |
| **Upgrade and branch links** | Construction depot, Small Storehouse, Village Warehouse or temporary mobile project camp. |
| **Planner triggers and failure states** | Required in the POC before staged NPC construction. Fails when stock is inaccessible, markers are buried/blocked, ownership is invalid or the active project moves beyond practical hauling range. |
| **Player-blueprint validation** | Must expose visible project stock, safe worker access, route/loading space and one valid project anchor. Decorative scaffold piles alone do not create reservation capacity. |
| **Culture and style variation** | Timber yard, stone mason staging court, nomad pack camp, dwarven material alcove, fae living scaffold grove or magical floating supply rack. |

### 81. Small Storehouse

building.storage.small_storehouse

| **Catalogue role** | Storage / Shared Supply \| Hamlet \| Small \| Required \| POC Required |
|---|---|
| **Need contribution** | Primary: Infrastructure \| Secondary: Provisions, Work |
| **Purpose** | Provides protected shared storage for food, tools, fuel, construction stock and household overflow before the settlement can support a full warehouse. |
| **Capacity / service** | Draft several category zones or containers; exact capacity derives from valid storage markers, containers and access rather than building footprint. |
| **Jobs and users** | Part-time keeper, elder, hauler, builder, farmer, household representatives and player contributor. |
| **Inputs** | Donated or settlement-owned items, containers, shelving, labels, locks, light and maintenance supplies. |
| **Outputs / services** | Shared stock, reduced spoilage/exposure, basic category separation, household/project access and shortage visibility. |
| **Required blueprint markers** | Public entrance, storage markers, food-safe zone, tool/construction zone, ledger or simple record point, keeper position and path/loading socket. |
| **Placement and utilities** | Central and dry, connected to homes, food and project routes; avoid floodplain, fire source and animal contamination. |
| **Construction profile** | 5 stages: foundation; shell; roof/door; containers and category zones; ledger, inspection and activation. |
| **Upgrade and branch links** | Village Warehouse, Granary, Tool Depot, Fuel Store, Guard Store or culture-specific communal cache. |
| **Planner triggers and failure states** | Triggered by scattered stock, spoilage, theft, project delay or household overflow. Underperforms when full, wet, damaged, unlabelled, inaccessible or permissions block intended users. |
| **Player-blueprint validation** | Must contain reachable valid storage markers, dry protected interior, public/shared access, category compatibility and loading space. Empty decorative shelving does not count. |
| **Culture and style variation** | Raised timber store, underground cool cellar, communal longhouse store, clay granary room, stone vault or living-tree hollow. |

### 82. Village Warehouse

building.storage.village_warehouse

| **Catalogue role** | Storage / Logistics \| Village \| Large \| Required \| POC Required |
|---|---|
| **Need contribution** | Primary: Infrastructure \| Secondary: Provisions, Work, Safety |
| **Purpose** | Becomes the authoritative village inventory hub for category storage, project reservations, deliveries, donations, contracts, emergency reserves and automation permissions. |
| **Capacity / service** | Draft multiple storage zones, secure reserve capacity, loading service and ledger throughput. Exact values derive from containers, zones, condition, staffing, access and permissions. |
| **Jobs and users** | Warehouse keeper, quartermaster, hauler, merchant liaison, builder, guard, automation specialist and player contributor. |
| **Inputs** | All allowed public categories, records, labels, locks, pallets/crates, light, repair materials and optional security equipment. |
| **Outputs / services** | Shared inventory truth, project reservation, contribution ledger, donation/sale/contract handling, emergency stock, category alerts and trusted automation input/output. |
| **Required blueprint markers** | Public counter, ledger, loading point, multiple category zones, secure reserve, project stock area, staff station, public/private circulation, road socket and optional automation ports. |
| **Placement and utilities** | Connected to main road, market, production and construction routes; enough loading clearance; protected from flood, fire and direct raid approach where practical. |
| **Construction profile** | 7 stages: site/foundation; structural shell; weatherproofing; storage zones; loading and staff areas; ledger/reserve/security; inspection and activation. |
| **Upgrade and branch links** | Construction Warehouse, Food Warehouse, Trade Warehouse, Armoury link, Automated Distribution Centre, Magical Vault or district warehouse. |
| **Planner triggers and failure states** | Required for normal Village project reservation. Fails or degrades when full, understaffed, looted, burned, permissions conflict, loading is blocked, categories are contaminated or save ledger state is invalid. |
| **Player-blueprint validation** | Must separate public, secure, project and loading functions; expose category zones, valid routes and ledger/control markers; automation ports cannot bypass ownership. |
| **Culture and style variation** | Timber hall, fortified stone depot, canal warehouse, subterranean vault, merchant courtyard, fae root-cellar network or arcane indexed store. |

### 83. Specialised Depot or Silo

building.storage.specialised_depot

| **Catalogue role** | Storage / Specialised \| Village \| Medium \| Optional \| Alpha |
|---|---|
| **Need contribution** | Primary: Infrastructure \| Secondary: Provisions, Work |
| **Purpose** | Stores one or a small set of resource categories more safely or efficiently than a general warehouse, reducing congestion and supporting industry, food reserves or emergency stock. |
| **Capacity / service** | Draft high category-specific capacity with storage-quality modifiers such as dry, cool, sealed, ventilated, secure or hazardous. |
| **Jobs and users** | Keeper, farmer, fuel handler, quartermaster, hauler, specialist worker and automation operator. |
| **Inputs** | Approved category stock, maintenance items, containers, seals, filters, pest control and optional power/temperature inputs. |
| **Outputs / services** | Higher effective category capacity, preservation, bulk loading, safer hazard separation and reduced warehouse pressure. |
| **Required blueprint markers** | Category-specific storage markers, loading point, access control, safety/ventilation markers where needed, inspection point and route socket. |
| **Placement and utilities** | Near its production/consumer chain but separated from incompatible hazards. Food silos avoid contamination; fuel depots avoid homes and fire sources. |
| **Construction profile** | 5-7 stages depending on branch, including foundation, shell/tank/silo, category fittings, loading, safety and activation. |
| **Upgrade and branch links** | Granary, Timber Yard, Stone Yard, Fuel Depot, Cold Store, Hazard Store, Guard Supply Depot or district bulk depot. |
| **Planner triggers and failure states** | Selected when one category repeatedly fills general storage, spoils, creates danger or limits production. Fails when wrong stock is inserted, safety separation is invalid or maintenance is ignored. |
| **Player-blueprint validation** | Must declare accepted categories and prove appropriate environment, loading, containment and access. General empty volume does not earn specialised capacity. |
| **Culture and style variation** | Grain tower, underground ice cellar, open timber seasoning yard, clay amphora store, stone fuel bunker, rune-sealed vault or giant seed pod. |

### 84. Automated Distribution Centre

building.storage.automated_distribution_centre

| **Catalogue role** | Storage / Advanced Logistics \| City \| Large \| Optional \| Beta |
|---|---|
| **Need contribution** | Primary: Infrastructure \| Secondary: Work, Provisions |
| **Purpose** | Coordinates high-volume storage, sorting, district replenishment and automated or vehicle-based freight once manual warehouse labour becomes a city-scale bottleneck. |
| **Capacity / service** | Draft high storage and transfer capacity split across buffers, sorting lanes, dispatch points and network interfaces; actual throughput is bounded by power, ports, routes and destinations. |
| **Jobs and users** | Logistics manager, warehouse staff, sorter, maintenance worker, dispatcher, hauler, engineer, automation operator and guards. |
| **Inputs** | Bulk stock, machine components, filters, power or mana where used, route schedules, maintenance parts and network permissions. |
| **Outputs / services** | Automated sorting, district dispatch, priority restocking, contract staging, route balancing and high-capacity loading. |
| **Required blueprint markers** | Intake and dispatch points, category buffers, sorter/control stations, staff paths, maintenance zones, multiple freight sockets, emergency stop and secure ledger. |
| **Placement and utilities** | Industrial or logistics district with heavy-road, rail, belt, water or portal-compatible corridors. It must not route dangerous freight through dense housing without safeguards. |
| **Construction profile** | 8-10 stages with manual storage activating before full sorting, powered dispatch and advanced network links. |
| **Upgrade and branch links** | Regional Logistics Hub, Portal Freight Nexus or culture-specific magitech distribution complex through 20E/20F. |
| **Planner triggers and failure states** | Selected when city warehouses are full, hauling labour is excessive, districts starve despite surplus or trade throughput is blocked. Pauses safely on power or output failure by default. |
| **Player-blueprint validation** | Must prove directional flow, buffers, maintenance access, staff safety, ownership, emergency shutdown and compatible network ports. Decorative conveyors do not create throughput. |
| **Culture and style variation** | Mechanical sorting hall, canal exchange warehouse, dwarven rail depot, golem-dispatch court, rune-indexed vault or portal distribution chamber. |

# 20. Roads, Bridges and Transport Entries

### 85. Dirt Path and Road Junction Set

project.transport.dirt_path_junction_set

| **Catalogue role** | Transport / Network \| Camp \| Network \| Required \| POC Required |
|---|---|
| **Need contribution** | Primary: Infrastructure \| Secondary: Work, Safety |
| **Purpose** | Provides the first formal route graph connecting settlement centre, homes, farms, stores, workplaces, hall, defences and future parcels. |
| **Capacity / service** | Foot and light service access; selected segments may support handcarts depending on width, slope and weather. Capacity derives from connected valid nodes, not total path blocks. |
| **Jobs and users** | All residents, builders, haulers, guards, animals, visitors and the player. |
| **Inputs** | Clearing labour, soil/gravel, edging or drainage where needed, signs/markers and repair tools. |
| **Outputs / services** | Reduced effective distance, valid parcel sockets, route finding, builder access, patrol connection and visible settlement organisation. |
| **Required blueprint markers** | Segment nodes, junctions, parcel sockets, route class, width/clearance, slope profile and optional signs/drainage. |
| **Placement and utilities** | Adapt to terrain and existing desire paths; avoid blocking water flow, entrances, expansion parcels, farms and protected sites. |
| **Construction profile** | 2 stages per segment: survey/clear; surface/edge and connect. Junctions or culverts may add stages. |
| **Upgrade and branch links** | Gravel path, Stone Road and Bridge Set, street, service lane, patrol path, boardwalk or culture-specific route. |
| **Planner triggers and failure states** | Required for the POC access graph. New paths are selected when key entrances are disconnected or travel cost is excessive. Mud, flood, obstruction and unsafe slope reduce service. |
| **Player-blueprint validation** | Must connect real route nodes and preserve passable clearance. Decorative stripes that do not create valid navigation provide no route service. |
| **Culture and style variation** | Forest track, packed-earth lane, gravel terrace, plank boardwalk, root path, carved tunnel path or nomad marker trail. |

### 86. Stone Road and Bridge Set

project.transport.stone_road_bridge_set

| **Catalogue role** | Transport / Durable Network \| Village \| Network \| Upgrade \| Alpha |
|---|---|
| **Need contribution** | Primary: Infrastructure \| Secondary: Safety, Work |
| **Purpose** | Upgrades key routes and crossings for carts, weather reliability, evacuation, trade, patrols and heavier settlement growth. |
| **Capacity / service** | Draft cart and medium freight access with higher weather resistance and crossing load. Exact service depends on width, slope, supports, drainage and connected destinations. |
| **Jobs and users** | Road crew, mason, builder, hauler, guards, merchants, carts, livestock and emergency responders. |
| **Inputs** | Stone, gravel, timber or metal supports, mortar, drainage pieces, labour, tools and repair stock. |
| **Outputs / services** | Faster travel, reduced mud/weather loss, stronger crossings, heavy-route access, safer public streets and lower haul labour. |
| **Required blueprint markers** | Road nodes, junctions, surface class, curbs/edges where used, drainage, bridge supports/landings, load class and maintenance points. |
| **Placement and utilities** | Prioritise main routes, gates, warehouse, market, clinic, production and bridge chokepoints. Avoid paving every low-use path without demand. |
| **Construction profile** | Segment-based 3-6 stages: survey; foundation; supports/drainage; surface; safety/edges; inspection. |
| **Upgrade and branch links** | Paved city street, heavy freight road, causeway, drawbridge, aqueduct bridge, tunnel road or monumental avenue. |
| **Planner triggers and failure states** | Selected when dirt routes fail under weather/load, carts are blocked or critical crossings create risk. Damage, flooding, collapsed supports or blocked gates break continuity. |
| **Player-blueprint validation** | Must prove connected route class, vehicle clearance, support/load, safe landings and drainage where required. Visual stone surfacing alone does not grant heavy capacity. |
| **Culture and style variation** | Cobble road, fitted dwarfstone, brick avenue, raised desert causeway, living-root bridge, ice-resistant road or rune-stabilised crossing. |

### 87. Dock or Harbour

building.transport.dock_harbour

| **Catalogue role** | Transport / Water Trade \| Town \| Large \| Conditional \| Beta |
|---|---|
| **Need contribution** | Primary: Infrastructure \| Secondary: Work, Provisions |
| **Purpose** | Connects the settlement to fishing, ferries, waterborne trade, exploration and regional freight where suitable navigable water exists. |
| **Capacity / service** | Draft berth, passenger and freight capacity based on valid docks, water approach, loading points, storage, workers and route safety. |
| **Jobs and users** | Dock worker, fisher, sailor, ferryman, harbourmaster, merchant, customs officer, shipwright link, guards and travellers. |
| **Inputs** | Timber/stone, ropes, mooring hardware, lights, repair materials, cargo handling tools, records and optional fuel. |
| **Outputs / services** | Boat access, fishing support, ferry route, water trade, freight loading, visitor arrival and coastal/river expansion. |
| **Required blueprint markers** | Navigable approach, berths, mooring points, safe edges, loading/unloading, dry access, storage buffer, route socket, lighting and rescue marker. |
| **Placement and utilities** | Stable shore or river parcel with adequate depth/current and road connection. Flood, ice, monsters, tides or storms may require adaptations. |
| **Construction profile** | 7-9 stages: survey/shore works; piles/foundation; deck/quay; berths; loading; storage/service; safety/lights; inspection. |
| **Upgrade and branch links** | Fishing Dock, Ferry Landing, Trade Harbour, Shipyard, Harbour Fort, Canal Port or Sky/Portal freight link through later documents. |
| **Planner triggers and failure states** | Conditional on water route value. Selected when water reduces travel or unlocks trade. Fails with blocked approach, unsafe water, damaged berth, no staff, route danger or disconnected road. |
| **Player-blueprint validation** | Must connect navigable water to safe land access and prove berth, loading, rescue and clearance. Decorative piers without route markers provide no harbour service. |
| **Culture and style variation** | Timber river dock, stone quay, floating village harbour, cavern port, fae lily-pad landing, desert canal station or ice harbour. |

# 21. Water and Sanitation Entries

### 88. Village Well or Water Point

building.utility.village_well

| **Catalogue role** | Utility / Water \| Hamlet \| Micro \| Required \| POC Required |
|---|---|
| **Need contribution** | Primary: Provisions \| Secondary: Health, Infrastructure |
| **Purpose** | Provides the first reliable public water access point and proves settlement water capacity without individual thirst micromanagement. |
| **Capacity / service** | Draft Hamlet-scale daily capacity based on valid source, well/pump marker, condition, quality and reachable access. |
| **Jobs and users** | Residents, cook, healer, farmer, animal handler, builder, fire responder and maintenance worker. |
| **Inputs** | Valid groundwater/spring/surface source, lining, cover, bucket/pump, rope, maintenance supplies and optional filter. |
| **Outputs / services** | Public water access, household provision support, cooking, limited farming/livestock support and emergency firefighting reserve. |
| **Required blueprint markers** | Valid source/intake, draw or pump point, safe standing/access area, cover/lining, drainage, contamination buffer and path socket. |
| **Placement and utilities** | Reachable from homes and kitchen but separated from latrines, waste, livestock runoff, industry and flood contamination. |
| **Construction profile** | 4 stages: survey/source confirmation; excavation/lining; draw/pump and cover; drainage, inspection and activation. |
| **Upgrade and branch links** | Covered Well, Pump House, Cistern, Aqueduct connection, magical purification or district water system. |
| **Planner triggers and failure states** | Required at Hamlet unless a valid culture/biome equivalent exists. Fails when dry, contaminated, collapsed, blocked, frozen without adaptation or access is unsafe. |
| **Player-blueprint validation** | Must bind to a real water source and expose safe access, quality and drainage. Decorative water blocks or an unreachable hole provide no service. |
| **Culture and style variation** | Stone well, spring house, communal cistern, snow-melt tank, root-filter pool, cave reservoir or shrine-protected water point. |

### 89. Cistern, Aqueduct or Pump System

project.utility.cistern_aqueduct_pump

| **Catalogue role** | Utility / Water Network \| Town \| Network/Complex \| Conditional \| Beta |
|---|---|
| **Need contribution** | Primary: Infrastructure \| Secondary: Provisions, Health |
| **Purpose** | Expands water storage, transport, pressure and resilience when a dense settlement, drought, elevation, industry or firefighting demand exceeds local water points. |
| **Capacity / service** | Draft network capacity bounded by source, intake, pump/lift, storage, distribution and access. Redundancy can preserve partial service during faults. |
| **Jobs and users** | Water keeper, engineer, mason, maintenance crew, pump operator, sanitation worker, fire responder and district users. |
| **Inputs** | Water source, stone/brick/wood/metal components, seals, pumps, mechanical/powered inputs where used, filters and repair stock. |
| **Outputs / services** | Stored reserve, elevated or remote distribution, irrigation, public access, industry supply, firefighting and drought resilience. |
| **Required blueprint markers** | Intake, source link, tank/cistern, channel/pipe segments, pump/lift where required, access points, overflow/drainage, controls and maintenance nodes. |
| **Placement and utilities** | Terrain-dependent. Aqueducts require gradient/support; pumps require power or labour; cisterns require protected storage and distribution access. |
| **Construction profile** | Segment-based 6-10 stages, with source and local storage activating before full distribution. |
| **Upgrade and branch links** | Reservoir, water tower, pressure network, irrigation system, industrial water, magical purification or realm-specific water utility. |
| **Planner triggers and failure states** | Selected when wells are strained, drought risk is high, districts lack access, fire reserve is low or production requires water. Weakest-link faults reduce output. |
| **Player-blueprint validation** | Must prove source, direction/gradient or pump, storage, distribution, overflow, maintenance and contamination separation. Decorative channels provide no network capacity. |
| **Culture and style variation** | Roman-style aqueduct, qanat, dwarven pressure tunnel, rooftop rain network, living-root waterway, canal system or rune-driven pump. |

### 90. Sanitation and Waste Utility

project.utility.sanitation_waste_system

| **Catalogue role** | Utility / Sanitation \| Town \| Network/Facility \| Optional \| Beta |
|---|---|
| **Need contribution** | Primary: Infrastructure \| Secondary: Health, Morale |
| **Purpose** | Manages drainage, refuse, wastewater, manure and by-products once density and industry make informal disposal unsafe or inefficient. |
| **Capacity / service** | Draft district or town load capacity determined by collection, drainage, treatment/disposal, maintenance, route access and safe separation. |
| **Jobs and users** | Sanitation worker, waste hauler, drain maintainer, recycler, composter, healer/public-health liaison, engineer and maintenance crew. |
| **Inputs** | Collection tools, carts/containers, drain blocks, filters, treatment materials, fuel/power where used and repair stock. |
| **Outputs / services** | Waste removal, drainage, compost/recovery, reduced contamination, flood control, cleaner streets and safer dense settlement growth. |
| **Required blueprint markers** | Collection points, route sockets, drains/channels, treatment or disposal area, clean/dirty separation, overflow, maintenance access and hazard zones. |
| **Placement and utilities** | Downstream/downhill or otherwise safely separated from clean water and housing according to system type; connected to service routes. |
| **Construction profile** | 6-10 stages split across collection, drains, treatment/disposal, route connection, safety and activation. |
| **Upgrade and branch links** | Covered sewer, compost works, recycling/salvage facility, industrial treatment, magical cleansing or city sanitation department through 20F. |
| **Planner triggers and failure states** | Selected when density, markets, livestock, rain, disease or industry creates Health/Infrastructure pressure. Fails through blockage, overflow, no collection labour, contamination leak or unsafe disposal. |
| **Player-blueprint validation** | Must expose a complete safe flow from collection to treatment/disposal, with maintenance and clean-water separation. Hidden holes do not create sanitation capacity. |
| **Culture and style variation** | Compost village system, canal drainage, stone sewer, desert dry-latrine network, fungal recycler, golem collection route or purification garden. |

# 22. POC Implementation Scope

The 20D POC proves five connected definitions:

| **Definition** | **POC Proof** | **Minimum Runtime Dependencies** |
|---|---|---|
| Builder Supply Yard | Visible construction stock, project anchor and builder pickup. | Project record, reserved inventory, builder task, path access. |
| Small Storehouse | Protected shared stock and category access. | Inventory, ownership, storage markers, basic UI. |
| Village Warehouse | Authoritative village stock, ledger, project reserves and deliveries. | Category inventory, permissions, transaction ledger, loading, save/load. |
| Dirt Path and Road Junction Set | Entrances and projects connect through a persistent route graph. | Network nodes, reachability, terrain placement and segment save state. |
| Village Well or Water Point | Water access and capacity support the Hamlet/Village needs summary. | Source validation, quality, access, demand summary and UI cause. |

## 22.1 POC Sequence

1. Place or generate the Forest Hamlet centre and informal access route.
2. Construct the Builder Supply Yard from exact materials.
3. Deliver wood and stone to the yard and reserve them for a project.
4. Construct the Small Storehouse and move shared stock into protected categories.
5. Extend dirt paths to homes, farm, mine, workshops, hall and watchtower site.
6. Construct the Village Well and validate source, access and contamination separation.
7. Upgrade to the Village Warehouse with category zones, ledger, loading and project reserve.
8. Deliver iron and construction materials manually or through the first automation chain.
9. Reserve exact watchtower resources in the warehouse.
10. Builders claim and carry stock through the route graph to visible construction stages.
11. Save and reload during delivery and construction without duplicating or losing stock.
12. Complete the watchtower and verify that warning, guard response and raid outcome change.
13. Damage or block one route/storage element and verify a readable failure and repair task.
14. Submit one player-made storehouse or path layout and validate it in-world.

## 22.2 POC UI

- Settlement Infrastructure status with top causes.
- Small Storehouse inventory categories.
- Village Warehouse ledger, reserved/project stock and permissions.
- Project delivery progress.
- Route overlay showing connected, slow and blocked links.
- Water access status and quality.
- Storage full, route blocked, source dry/contaminated and repair alerts.
- Player blueprint validation reasons.

## 22.3 POC Explicit Deferrals

- Full cart physics and traffic.
- Harbours.
- Town sanitation networks.
- Aqueducts and powered pumps.
- Automated distribution centre.
- Rail.
- Portal freight.
- Detailed sewage flow.
- City district logistics.
- Seasonal water balancing beyond simple source modifiers.
- Large-scale trade caravans beyond bounded event logic.

# 23. Balancing and Simulation LOD

## 23.1 Balance Principles

- Exact construction costs come from approved voxel blueprints and material tokens.

- Storage uses category and marker capacity rather than arbitrary building volume.

- Earlier stores and paths remain useful as local, cheap and fallback infrastructure.

- Larger infrastructure adds capacity, resilience and coordination but also maintenance, staffing, land and threat value.

- Water and sanitation expectations are stage-aware. A Hamlet is not penalised for lacking city sewers.

- Distance matters but should not force perfect urban planning. Reasonable paths and route upgrades solve most problems.

- Road spam receives diminishing benefit when it does not connect demand, capacity or critical routes.

- Utilities should warn and degrade before catastrophic failure under normal settings.

- Automation reduces hauling but does not invalidate NPC logistics, ownership, access or storage.

- Player-made designs compete through function and style, not hidden bonuses for decorative size.

## 23.2 Update Rates

| **State** | **Suggested Update Approach** |
|---|---|
| Immediate blockage, theft, spill, fire or collapse | Event-driven / real time nearby. |
| Nearby hauler task and loading | Every few seconds or task events. |
| Storage totals and reservations | Transaction-driven. |
| Route reachability | On network edit, damage, closure or periodic bounded refresh. |
| Water and sanitation summary | Hourly or daily settlement tick, plus event changes. |
| Routine maintenance | Daily or multi-day summary. |
| Distant deliveries | Abstract batches with conserved source/destination stock. |
| Distant route and utility events | Daily or event-driven risk checks. |
| Growth-stage eligibility | Daily or when a critical capability changes. |

## 23.3 Simulation LOD

### Near

- NPCs carry visible item bundles or use carts where implemented.
- Doors, loading points, wells and work markers are used physically.
- Network edits update local pathing.
- Damage and repairs place real blocks.
- Item transactions remain authoritative.

### Medium

- Movement may be simplified between route nodes.
- Loading animation and item visuals can be reduced.
- Production and deliveries use shorter summary intervals.
- Named NPC assignments and inventory remain preserved.

### Far or Unloaded

- Settlement records process bounded transfers and service summaries.
- No resource is created because an animation was skipped.
- Route class, condition, danger and capacity modify abstract delivery.
- Projects consume reserved stock stage by stage.
- Major failures create persistent events, damage and repair needs.
- Returning players see the correct physical state applied to the voxel world.

# 24. Open Questions for Later Balancing

These do not block Version 0.1:

1. Exact slot and category capacities for each blueprint tier.
2. Whether block stacks remain the only storage unit or some bulk materials use compact bulk records.
3. Exact travel-speed modifiers by route surface and weather.
4. How much cart and animal transport is physically simulated near players.
5. Whether public water containers are physical items or mostly abstracted after access is proven.
6. Exact sanitation thresholds by population, density, climate and difficulty.
7. How frequently routine road and utility maintenance consumes resources.
8. Whether tolls, fares and public utility fees are used outside certain cultures or factions.
9. How road congestion is abstracted in cities.
10. Exact bridge load and failure calculations.
11. How water tables and drought are represented by world generation.
12. How much pollution and waste affects biome state.
13. Whether player-built private logistics can be contracted by NPC settlements.
14. How multiplayer disputes over roads, easements and warehouse access are resolved.
15. Which utility branches belong in 20D versus advanced 20E or complex-scale 20F records.
16. How magical purification interacts with mundane sanitation without making mundane infrastructure obsolete.

# Appendix A. 20D Data Field Template

| **Field Group** | **Required Fields** |
|---|---|
| Identity | Stable ID; family; display name; category; subcategory; owner document; tags; planning status. |
| Stage and project | Earliest stage; project class; prerequisites; planner triggers; priority tags; culture/biome conditions. |
| Needs | Primary need; secondary needs; capacity type; demand model; failure causes; status labels. |
| Physical blueprint | Footprint; height; segments; material tokens; stages; markers; sockets; clearance; terrain adaptation. |
| Storage | Categories; marker capacity; container links; ownership; permissions; reserves; spoilage; hazard controls; overflow. |
| Access and routes | Route class; network nodes; width; slope; clearance; vehicle types; danger; gates; bridges; loading. |
| Transport | Allowed modes; load capacity; staff; vehicles/animals; source/destination buffers; delivery priority; escort. |
| Water | Source; yield; quality; intake; storage; distribution; access points; demand; contamination; emergency reserve. |
| Sanitation | Generated load; collection; drainage; treatment/disposal; maintenance; clean-water separation; overflow; reuse. |
| Jobs and staffing | Jobs; minimum staff; skill preference; schedules; emergency roles; remote/abstract rules. |
| Inputs and outputs | Construction resources; operational inputs; services; outputs; by-products; maintenance items. |
| Runtime | Condition; activation; fullness; blockage; source state; service coverage; backlog; contamination; history. |
| Ownership and authority | Owner; public/private; faction; player permissions; automation permission; contract; law restrictions. |
| Upgrade and conversion | Previous/next family; branch; conversion rules; stock transfer; network migration; replacement conditions. |
| UI | Summary label; causes; alerts; overlay data; interaction screen; tutorial note; validation errors. |
| LOD and save | Near behaviour; medium summary; far tick; persistent stock; network state; migration/version fields. |

# Appendix B. Network and Service-Capacity Matrix

| **Capability** | **Source / Facility** | **Required Links** | **Primary Outputs** | **Common Blockers** |
|---|---|---|---|---|
| Temporary project supply | Builder Supply Yard | Path, project anchor, stock | Builder pickup, visible reserves | No access, stock stolen, project moved. |
| Shared basic storage | Small Storehouse | Path, valid markers, permissions | Protected stock and categories | Full, wet, blocked, private. |
| Village inventory truth | Village Warehouse | Road/loading, keeper/ledger, zones | Reservations, deliveries, alerts | Full, looted, permissions, no route. |
| Specialised bulk storage | Depot/Silo | Category input, loading, safety | High category capacity/preservation | Wrong stock, contamination, hazard. |
| City distribution | Distribution Centre | Power/network, buffers, routes | Sorting and dispatch | Output blocked, power loss, filter error. |
| Foot access | Dirt path | Connected nodes | Lower travel cost and reachability | Mud, obstruction, unsafe slope. |
| Cart/heavy access | Stone road/bridge | Width, slope, supports, gates | Bulk freight and reliability | Collapsed bridge, narrow gate, flood. |
| Water transport | Dock/Harbour | Navigable water, berth, road | Ferry, fishing and trade | Storm, depth, damage, route danger. |
| Basic water | Village Well | Valid source, access, quality | Public water capacity | Dry, contaminated, frozen, blocked. |
| Expanded water | Cistern/Aqueduct/Pump | Source, storage, distribution | District water and resilience | Weakest-link fault, no power, leak. |
| Sanitation | Waste Utility | Collection, route, disposal/treatment | Cleanliness, drainage, reduced disease | Overflow, blockage, no staff, contamination. |

# Appendix C. POC Acceptance Checklist

- [ ] Builder Supply Yard stores and visibly reserves exact project resources.
- [ ] Builder NPC can claim stock and reach the project through the route graph.
- [ ] Small Storehouse capacity comes from valid storage markers.
- [ ] Village Warehouse separates available, reserved, emergency and restricted stock.
- [ ] Warehouse ledger records player and automation deliveries.
- [ ] Project cancellation releases unconsumed reserved stock.
- [ ] Save/load during transfer does not duplicate or lose items.
- [ ] Dirt path segments connect real entrance and parcel nodes.
- [ ] A blocked path produces a readable route failure and alternate task where available.
- [ ] Village Well binds to a valid source and contributes water access.
- [ ] Contamination or blocked access changes the visible water cause.
- [ ] Watchtower project draws reserved resources from the warehouse stage by stage.
- [ ] Nearby NPC hauling is visible without requiring manual task assignment.
- [ ] Distant or unloaded transfer remains resource-conserving.
- [ ] Player-made storehouse blueprint validates markers, access and capacity.
- [ ] Player-made route validates connection, slope and clearance.
- [ ] Infrastructure overview shows Stable, Strained or Critical with causes rather than extra top-level needs.
- [ ] Damage and repair preserve inventory, route and project history.
- [ ] Automation cannot bypass warehouse ownership or reservation rules.
- [ ] POC functions with controller-ready UI and survives a full save migration test.

# Appendix D. Cross-System Dependency Matrix

| **20D System** | **Primary Dependencies** | **Dependent Systems** |
|---|---|---|
| Storage and ownership | Items, village inventory, permissions, saves | Projects, households, production, trade, defence, quests. |
| Project reservations | Recipes, warehouse ledger, builder AI | Blueprint construction, repairs, settlement growth. |
| Route graph | Voxel world, navigation, structures, parcels | NPC schedules, hauling, guards, trade, emergency response. |
| Transport tasks | Inventory transactions, NPC jobs, route graph | Production, markets, automation, village needs. |
| Water service | Worldgen source, blocks, utility markers | Provisions, Health, farming, fire response, industry. |
| Sanitation | Population/density, waste outputs, routes, water | Health, Morale, biome state, events and migration. |
| Maintenance | Damage states, items, jobs, priorities | Every building and network family. |
| Player blueprints | Document 19 editors and validators | All 20D definitions and settlement planners. |
| Automation links | 08 and 20E networks, power and filters | Warehouse input/output and city logistics. |
| Culture variants | 13 and 20G palettes and traditions | Architecture, service expectations and substitutions. |
