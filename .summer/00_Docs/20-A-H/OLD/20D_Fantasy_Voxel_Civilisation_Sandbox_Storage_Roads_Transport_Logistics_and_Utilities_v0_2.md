# Fantasy Voxel Civilisation Sandbox

## 20D - Storage, Roads, Transport, Logistics and Utilities

### Detailed Functional Registry, Blueprint Forge Network Contracts and Settlement Infrastructure Rules

**Version 0.2 - Unified Forge and Runtime Integration Revision**

*A controlled registry for construction staging, shared storage, roads, crossings, freight, water access, sanitation and public utilities. Version 0.2 preserves exact resource conservation and NPC autonomy while integrating official Blueprint Forge network authoring, typed semantic contracts, deterministic Godot runtime baking and the revised Technical POC infrastructure scope.*

| **Field** | **Locked Direction** |
|---|---|
| Document Scope | Detailed rules and registry entries for catalogue definition 3 and definitions 81-90 from Document 20H v0.2. Advanced powered logistics and energy networks remain primarily owned by 20E; district and regional planning remains 20F. |
| Needs Lock | Housing, Provisions, Health, Work, Safety, Infrastructure and Morale remain the only main settlement needs. Storage, route quality, freight, water, sanitation and maintenance remain services, capacities and drill-down causes. |
| Primary Focus | Builder supply, shared and specialised storage, paths, roads, bridges, docks, loading, hauling, logistics, water sources, storage/distribution, drainage, sanitation, waste and maintenance. |
| Resource Rule | Physical goods, water-source capacity and recoverable outputs remain authoritative and conserved. Networks move or allocate real state; decorative volume never generates stock or utility service. |
| Official Authoring | Blueprint Forge owns editable official voxel sources, semantic route and utility layers, modules, material roles, construction stages, dynamic states, terrain adaptation, validation and dependency data. |
| Player Creator | Document 19 exposes restricted compatible building and local-network creation. Player designs may satisfy approved definitions but cannot replace registries, migrations, source trust or authoritative transaction rules. |
| NPC Growth | Settlements select infrastructure using shortages, effective travel, storage pressure, water/sanitation load, terrain, weather, trade, threats, staff, resources, maintenance and expansion plans. |
| Simulation | Nearby NPCs visibly carry, load, unload, draw water, maintain roads and respond to blockages. Distant settlements process bounded transfers, route capacities, utility allocation, deterioration and incident summaries while preserving exact stock and persistent network state. |
| POC Direction | 20D contributes four Technical POC Core definitions - Builder Supply Yard, Village Warehouse, Dirt Path and Road Junction Set, and Village Well or Water Point - plus Small Storehouse in the Extended Forest Hamlet slice. |
| Engine Direction | Godot/Summer Engine runtime products are deterministic derivatives of Forge source and registry data; derived navigation, network and inventory products are never editable source truth. |

> **Locked Scope Rule**
>
> Infrastructure is one main need, not a collection of warehouse, road, transport, water and sanitation bars. A decorative crate does not create inventory, a disconnected road does not create access, a pipe without source and destination does not create flow, and a pool of water does not automatically provide safe public service.

## Revision 0.2 Summary

Version 0.2 is an integration and clarification pass rather than a redesign of settlement logistics. It preserves all 11 approved 20D definitions while connecting them to Documents 20 v0.2, 20H v0.2, Blueprint Forge and the Godot/Summer Engine runtime.

Key changes are:

- Official developer storage, road, bridge, dock and utility source authoring is assigned to 22I Blueprint Forge.
- Universal definitions, editable Forge source, runtime bake products, construction projects and persistent structure/network instances are explicitly separated.
- The Builder Supply Yard canonical ID is corrected to `building.construction.builder_supply_yard`; `building.infrastructure.builder_supply_yard` remains a migration alias only.
- Shared inventory, loading, route, logistics, water, sanitation, maintenance and hazard contracts replace ad hoc marker naming.
- Roads and utilities are formal typed graphs with stable element IDs, sockets, capacities, direction, condition, permissions and terrain bindings.
- Resource movement remains atomic and journalled through authoritative inventories; route visuals never duplicate stock.
- Water service is bound to real sources, storage and distribution capacity; sanitation preserves generated load, treatment and consequences without personal micromanagement.
- Construction, inheritance, modular network upgrades, damage, occupation, repair and restoration align with Blueprint Forge deltas.
- The former five-entry POC block is divided into four Technical POC Core definitions and one Extended Forest Hamlet definition.
- Godot/Summer Engine services, deterministic baking, diagnostics, persistence, simulation LOD and regression fixtures are made explicit.

# Document Purpose

Document 20D defines the physical circulation and service backbone that lets a settlement build, store, move, supply and recover at increasing scale. It explains where shared stock is kept, how construction projects reserve it, how people and freight reach structures, how crossings and weather affect access, and how public water and sanitation become reliable without turning the player into a warehouse clerk, traffic controller or plumbing engineer.

The document separates function from art and runtime state. 20D defines what a storehouse, warehouse, route, bridge, dock, well or utility network must accomplish. Blueprint Forge defines the official editable voxel source and semantic graph. Document 19 provides restricted player-compatible authoring. The runtime owns placed inventories, route and network state, transactions, staff, source bindings, faults, damage and history.

The goal is meaningful infrastructure with readable bottlenecks. NPCs handle routine hauling, stocking, water access, collection and maintenance through jobs, priorities and permissions. The player becomes involved when a shortage, blocked route, project, trade opportunity, drought, contamination, flood, collapse, ownership conflict or major expansion creates a decision worth making.

# Design Sources and Dependencies

| **Source** | **20D Dependency** |
|---|---|
| 03 - Blocks Registry | Storage blocks, route surfaces, stairs, bridges, doors, loading pieces, water/drainage blocks, damage groups, material roles and placed functional blocks. |
| 04 - Items Registry | Construction materials, food, tools, fuel, containers, repair supplies, trade goods, filters, utility parts, waste and recovered outputs. |
| 05 - Crafting and Recipe Registry | Project costs, reservations, repairs, preservation, utility construction, batching and exact inventory transactions. |
| 06 - Resource Progression | Bulk materials, fuels, water-related components, strategic stock, by-products, renewable sources and late-game logistics demands. |
| 07 - NPC Village System | Named keepers, haulers, builders, operators and maintainers; inventories, permissions, jobs, schedules, shortages and simulation LOD. |
| 08 - Automation System | Chutes, belts, carts, pipes, sorting, control, warehouse permissions, network flow, distribution and local/far item movement. |
| 09 - Magic System | Mana logistics, magical purification, portal freight and advanced utility branches primarily detailed in 20E. |
| 10 - Creatures and Monsters | Route danger, raids, theft, contaminated sources, transport animals, damaged stores and protected logistics. |
| 11 - Biomes and World Generation | Terrain, slope, rivers, coasts, groundwater, rainfall, flood, climate, roads, crossings, harbours and source placement. |
| 12 - Structures | Persistent structure identity, network elements, state transitions, damage, repair, restoration, world evidence and structure LOD. |
| 13 - Races, Peoples, Cultures and Factions | Storage customs, road forms, water practice, ownership, trade, sanitation expectations and transport traditions. |
| 15 - Quest and Event System | Deliveries, shortages, blocked routes, bridge collapse, drought, contamination, caravan events, repairs and persistent consequences. |
| 16 - Combat, Gear and Defence | Supply lines, emergency routes, warehouse protection, siege damage, firefighting water and evacuation access. |
| 17 - UI/UX System | Settlement causes, warehouse ledger, route overlay, water/sanitation coverage, project stock, queues, faults and diagnostics. |
| 19 - Settlement Growth and Player Voxel Blueprint System | Settlement projects, parcels, player proposals, player-founded settlements and restricted player-facing creator flows. |
| 20 / 20H v0.2 | Seven-needs lock, shared lifecycles, stable IDs, catalogue ownership, stage mapping, delivery scope and change control. |
| 20A / 20B / 20C / 20E / 20F / 20G | Household demand; work/trade; emergency access; advanced automation/power/mana; district planning; culture/biome/realm packs. |
| 22I - Blueprint Forge | Official editable voxel source, semantic network layers, modules, stages, dynamic states, terrain adaptation, validation and packaging. |
| 22K - Forge Technical Plan | Deterministic bake products, graph compilation, dependency invalidation, runtime registries, migration and CI validation. |

# Static Table of Contents

- 1. Locked 20D Identity
- 2. Scope Boundaries and Anti-Micromanagement Rules
- 3. Source-of-Truth and Record Separation
- 4. Seven-Needs Integration
- 5. Shared Storage, Route and Utility Model
- 6. Shared Semantic Contracts and Network Graph Layers
- 7. Storage Categories, Ownership, Reservations and Permissions
- 8. Paths, Roads, Access and Effective Distance
- 9. Bridges, Crossings, Terrain Adaptation and Weather
- 10. Transport Modes, Loading and Freight
- 11. Logistics, Deliveries, Priorities and Overflow
- 12. Water Sources, Wells, Cisterns, Aqueducts and Pumps
- 13. Sanitation, Drainage, Waste and Pollution
- 14. Maintenance, Damage, Hazards and Recovery
- 15. NPC Planner and Project Selection
- 16. Blueprint Forge Authoring and Official Source Validation
- 17. Restricted Player-Creator Validation
- 18. Construction Stages, Commissioning and Partial Activation
- 19. Upgrade, Inheritance, Conversion and Replacement
- 20. Damage, Occupation, Repair and Restoration
- 21. Settlement-Stage Expectations
- 22. Detailed Registry Summary
- 23. Builder Supply and Storage Entries
- 24. Roads, Bridges and Transport Entries
- 25. Water and Sanitation Entries
- 26. Technical POC and Extended Forest Hamlet Scope
- 27. Simulation LOD, Persistence and Multiplayer Authority
- 28. Balancing, Diagnostics and Anti-Exploit Rules
- 29. Godot/Summer Engine Implementation Direction
- 30. Open Questions for Later Balancing
- Appendix A. 20D Functional Definition Field Template
- Appendix B. Network and Service-Capacity Matrix
- Appendix C. POC Acceptance Checklist
- Appendix D. Cross-System Dependency Matrix
- Appendix E. Validation and Diagnostic Code Catalogue

# 1. Locked 20D Identity

20D is the settlement circulation, supply and public-utility layer of the universal building registry. It gives inventories, projects, routes, transport and utilities real physical anchors and persistent network state. It does not replace items, recipes, NPC jobs, world generation, automation or the Blueprint Forge; it connects them through shared contracts.

> **Locked Rule**
>
> A 20D facility or network provides only the capacity validated from its physical source, semantic elements, connected graph, ownership, condition, access and required staff or energy. Decorative volume and visual connection alone never create stock, route access or utility output.

| **Identity Layer** | **Design Meaning** | **Player-Facing Result** |
|---|---|---|
| Conserved stock | Shared stores contain actual owned items with categories, reservations and transaction history. | Deliveries, theft, construction, trade and shortages use one trustworthy inventory truth. |
| Connected access | Paths, roads, crossings, entrances, loading points and clearances form a typed route graph. | Players can see why a person, cart, guard or caravan cannot reach a destination. |
| Scalable logistics | Hand carrying, carts, animals, boats, machines and magic use compatible transfer contracts. | Settlements grow without replacing every earlier route or inventing free throughput. |
| Public utilities | Water, drainage, sanitation and waste have real sources, capacities, coverage, maintenance and failure states. | Dense settlements need infrastructure without personal thirst or bathroom micromanagement. |
| Terrain integration | Networks adapt to slopes, rivers, coasts, caves, climate and damage. | Infrastructure belongs to the generated world and remains repairable. |
| Persistent consequence | Blockage, fullness, contamination, drought, flood, theft and collapse produce projects and history. | Failures are visible, diagnosable and recoverable. |
| Scalable simulation | Nearby movement is represented physically; distant movement uses conserved transactions and summaries. | Large worlds remain performant without duplicating or deleting resources. |

# 2. Scope Boundaries and Anti-Micromanagement Rules

- The seven needs remain the only top-level needs. Storage fullness, route capacity, water, sanitation, waste and transport are services and causes.
- Water is a settlement access and capacity service. Individual NPC thirst bars are not required by default.
- Household and workplace consumption uses scheduled or batched authoritative transactions rather than one transaction for every bite, sip or bucket.
- The player sets policies, permissions, route classes, project reservations, emergency priorities and automation connections where authority allows. Routine hauling and restocking remain NPC-managed.
- Storage capacity derives from valid typed containers and zones, not floor area or decorative shelves.
- Roads reduce effective travel cost and support transport classes; they do not require realistic traffic lanes or manual vehicle dispatch.
- Utilities use bounded flow and weakest-link logic, not full fluid dynamics.
- Sanitation is calculated at facility, district and settlement scales. Individual toilet use and detailed chemistry remain outside the intended simulation.
- Culture and biome variants may solve the same service differently after functional validation.
- Distant settlements do not pathfind every hauler or simulate every droplet. They preserve the same inventories, network capacity, faults and consequences through bounded updates.

| **Explicit Non-Goals** |
|---|
| 20D does not require manual crate sorting, individual hydration bars, realistic vehicle traffic, continuous fluid particles, exact sewer chemistry, household bathroom schedules, manual road-worker commands or persistent pathfinding for every distant delivery. |

# 3. Source-of-Truth and Record Separation

| **Layer** | **Authority** | **20D Example** |
|---|---|---|
| Universal definition | Documents 20/20H and this companion | What a Village Warehouse or Water Point must provide. |
| Official editable source | Blueprint Forge | Voxel source, route/utility graph, markers, sockets, modules, stages and states. |
| Runtime bake product | Deterministic Forge bake | Navigation edges, clearance tags, storage endpoints, network tables, collision and diagnostics. |
| Construction project | Settlement runtime | Reserved stock, work stages, builders, blockers and site state. |
| Persistent structure/network instance | World save | Placed inventories, connected elements, staff, condition, permissions, faults, damage and history. |
| Restricted player source | Document 19 compatible creator | Approved local storehouse, route or utility layout using permitted contracts. |

## 3.1 Separation Rules

- A definition describes function and requirements; it does not store a voxel layout.
- A Blueprint Forge source contains editable art and semantic intent; it does not own live world inventories or transactions.
- A bake product is disposable and reproducible from approved source and registry versions.
- A project records construction work and consumed resources; completion creates or changes persistent instances.
- A structure or network instance owns live stock, connections, condition, staff, permissions, faults and history.
- A player-authored source cannot alter universal IDs, item totals, source yields, migration aliases or server authority.

## 3.2 Canonical Flow

```text
20D Functional Definition
        -> Blueprint Forge Source
        -> Deterministic Network/Structure Bake
        -> Construction Project
        -> Persistent Structure and Network Elements
        -> Inventory / Route / Utility Service
        -> Needs, Planner, Events and UI
```

# 4. Seven-Needs Integration

| **Need** | **20D Contribution** | **Typical Failure Causes** |
|---|---|---|
| Housing | Roads, deliveries, water, drainage and waste service make homes reachable and usable. | Isolated homes, blocked entrances, flooding, no water access or waste buildup. |
| Provisions | Stores protect food/fuel and logistics move supplies; water provides bounded public access. | Empty stores, spoilage, dry/contaminated source, route loss or project stock consuming reserves. |
| Health | Clean water, drainage, waste handling, dry storage and emergency access reduce harm. | Polluted water, stagnant drainage, vermin, spoiled food, overflow or floodwater. |
| Work | Routes, loading, storage, hauling and utilities connect workers, inputs and outputs. | Long travel, full buffers, no loading point, disconnected site or unavailable tools. |
| Safety | Reliable routes support patrols, rescue and evacuation; protected stores reduce loss. | Collapsed crossing, dark route, warehouse raid, fire, flood or blocked emergency access. |
| Infrastructure | Storage, access, transport, water, sanitation and maintenance directly provide the need. | Insufficient capacity, broken network, source loss, access conflict or maintenance backlog. |
| Morale | Reliable clean services, shorter journeys and successful deliveries build confidence. | Filth, repeated shortages, muddy roads, lost goods, isolation or unfair access. |

# 5. Shared Storage, Route and Utility Model

| **Model** | **Calculation Direction** | **Player-Facing Example** |
|---|---|---|
| Effective storage | Valid typed capacity x condition x access x permissions x category compatibility. | Construction stock: 72% full; 40 stone blocked by private access. |
| Reserve security | Reserved quantity compared with project, emergency and seasonal targets, modified by loss/spoilage risk. | Watchtower reserve complete; food reserve four days below target. |
| Route access | Connected nodes, passable width, slope, surface, clearance, ownership, danger and destination sockets. | Carpenter reachable by foot; carts blocked at bridge. |
| Effective travel cost | Physical distance modified by route class, terrain, weather, load, vehicle, danger and closure. | Warehouse trip: 58 seconds by path; 24 seconds by cart road. |
| Delivery throughput | Haulers/vehicles x load x loading capacity x route state x destination buffer. | Iron delivery: 12 items/min; forge output buffer full. |
| Water coverage | Minimum valid capacity among source yield, extraction, storage, distribution and access compared with demand. | Water stable; well at 68% peak capacity. |
| Sanitation coverage | Collection, drainage, treatment/disposal, maintenance and route access compared with generated load. | Sanitation strained; market drains overloaded after rain. |
| Maintenance backlog | Faults and condition loss weighted by service criticality, materials, workers and access. | Three critical repairs: bridge support, well cover and warehouse roof. |

> **Weakest-Link Rule**
>
> A service is normally limited by its weakest required link. A strong road behind a closed gate is inaccessible. A full cistern behind a broken pump cannot provide pumped distribution. Redundant valid links can preserve partial service.

# 6. Shared Semantic Contracts and Network Graph Layers

## 6.1 Common Marker Families

- `marker.entrance.public`, `marker.entrance.staff`, `marker.entrance.service`
- `marker.loading.receive`, `marker.loading.dispatch`, `marker.delivery.dropoff`
- `marker.storage.category`, `marker.storage.secure`, `marker.storage.project_reserve`, `marker.storage.emergency_reserve`
- `marker.ledger.inventory`, `marker.control.routing`, `marker.inspection.service`
- `marker.builder.work`, `marker.maintenance.access`, `marker.repair.staging`
- `marker.water.source`, `marker.water.intake`, `marker.water.draw`, `marker.water.pump`, `marker.water.overflow`
- `marker.sanitation.collection`, `marker.sanitation.treatment`, `marker.sanitation.disposal`

## 6.2 Common Zone Families

- `zone.storage.food_safe`, `zone.storage.bulk`, `zone.storage.hazard`, `zone.storage.secure`
- `zone.loading`, `zone.queue`, `zone.turning`, `zone.public`, `zone.staff`
- `zone.clean`, `zone.dirty`, `zone.contamination_exclusion`, `zone.flood_risk`
- `zone.route.foot`, `zone.route.cart`, `zone.route.heavy`, `zone.route.emergency`, `zone.route.water`
- `zone.utility.maintenance`, `zone.utility.overflow`, `zone.utility.treatment`, `zone.utility.disposal`

## 6.3 Common Socket Families

- `socket.route.foot`, `socket.route.service`, `socket.route.cart`, `socket.route.heavy`, `socket.route.emergency`
- `socket.route.water`, `socket.berth`, `socket.bridge.support`, `socket.parcel.entrance`
- `socket.logistics.import`, `socket.logistics.export`, `socket.automation.import`, `socket.automation.export`
- `socket.utility.water.source`, `socket.utility.water.input`, `socket.utility.water.output`, `socket.utility.water.overflow`
- `socket.utility.waste.input`, `socket.utility.waste.output`, `socket.utility.drainage`

## 6.4 Graph Layers

| **Graph** | **Nodes / Edges** | **Authoritative Result** |
|---|---|---|
| Route graph | Entrances, junctions, gates, crossings, loading areas and route segments. | Reachability, effective cost, allowed users, width, slope, clearance and condition. |
| Logistics graph | Inventory endpoints, buffers, loading interfaces, transfer tasks and automation ports. | Authorised source/destination transfer and throughput. |
| Water graph | Sources, intakes, pumps, stores, controls, distribution and access points. | Capacity, quality, direction, reserve, pressure/gradient abstraction and coverage. |
| Sanitation graph | Collection, drains, transport, treatment, recovery and disposal. | Load movement, treatment capacity, overflow and contamination consequence. |

## 6.5 Contract Rules

- Every baked element receives a stable source-element ID so saves, damage and migrations can reference it.
- Visual adjacency is not enough; compatible typed sockets must connect.
- Route and utility elements declare direction, capacity, ownership, permissions, condition and supported classes.
- Network graphs may cross chunks, but authoritative updates remain bounded and deterministic.
- Duplicate hidden endpoints do not multiply service; capacity is derived from approved functional elements.

# 7. Storage Categories, Ownership, Reservations and Permissions

Storage must remain understandable to NPCs, players, automation and save data. The system uses shared inventory contracts with category and permission fields rather than a bespoke script for every chest or warehouse.

## 7.1 Core Storage Categories

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

## 7.2 Ownership and Transaction Types

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

## 7.3 Reservation Rules

- A project reserves exact item IDs or valid material tags from reachable authorised storage.

- Reservations reduce available stock but do not move items until builders or logistics claim them.

- Daily consumption does not take project stock unless an emergency policy explicitly overrides the reservation.

- A cancelled project releases unconsumed stock and records already consumed stages.

- Multiplayer contributions remain attributed in the warehouse ledger.

- Damaged, stolen or contaminated reserved stock creates a visible project blocker rather than silently replacing itself.

## 7.4 Access and Permissions

- Public, household, workplace, guard, guild, faction, player, automation and emergency access are separate permission flags.

- A building can contribute storage capacity but still provide little effective service when routes or permissions block intended users.

- NPCs may use player storage only when donation, contract, settlement law, shared ownership or explicit access allows it.

- Automation import and export require trusted connections, valid direction and category filters.

# 8. Paths, Roads, Access and Effective Distance

Roads are not cosmetic strips. They form a network graph connecting entrances, parcels, loading points, gates, bridges, docks, public spaces and district routes.

## 8.1 Route Classes

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

## 8.2 Effective Distance

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

## 8.3 Route Quality Bands

- Informal
- Basic
- Reliable
- Durable
- High-capacity
- Protected
- Advanced or magical

Earlier routes remain useful as local and low-cost access even after cities gain better roads.

# 9. Bridges, Crossings, Terrain Adaptation and Weather

A network blueprint can contain segments, nodes, supports, landings, retaining walls, drainage and sockets rather than one fixed monolithic structure.

## 9.1 Crossing Types

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

## 9.2 Validation Factors

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

## 9.3 Weather Effects

- Dirt paths become slower in prolonged rain unless drained.
- Snow and ice reduce speed and safety until cleared, adapted or magically treated.
- Floods can close fords, damage bridges and contaminate wells.
- Heat and drought reduce exposed water sources.
- Sand, ash, corruption growth and vegetation can obstruct neglected routes.
- Roads and drainage reduce weather disruption but create maintenance demand.

# 10. Transport Modes, Loading and Freight

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

## 10.1 Loading and Unloading

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

## 10.2 Transport Jobs

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

# 11. Logistics, Deliveries, Priorities and Overflow

## 11.1 Delivery Task Model

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

## 11.2 Default Priority Bands

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

## 11.3 Overflow Rules

- Pause input when destination capacity is full.
- Reroute to an allowed equivalent store.
- Hold at source.
- Use an overflow yard or temporary cache.
- Spill physical items only for specific systems or harsh settings.
- Mark perishable loss or hazard risk.
- Create a new storage project when persistent pressure is high.

## 11.4 Logistics Failure Causes

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

# 12. Water Sources, Wells, Cisterns, Aqueducts and Pumps

Water is treated as settlement access, capacity, quality and resilience. It supports provisions, health, farming, livestock, production, firefighting, rituals and some automation.

## 12.1 Water Source Types

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

## 12.2 Water Service Chain

Source -> Intake -> Extraction -> Storage -> Distribution -> Access Point -> Consumer

Any required broken link reduces service. A simple village well combines several links in one facility. Town-scale systems separate them.

## 12.3 Water Quality

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

## 12.4 Water Demand

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

## 12.5 Access and Fairness

Water points have capacity, queue abstraction, route access and ownership. Public water can be restricted, taxed, rationed, contaminated, monopolised or defended, creating political and story consequences without adding another top-level need.

# 13. Sanitation, Drainage, Waste and Pollution

Sanitation begins simple and becomes important as density, industry and population grow.

## 13.1 Early Settlement Solutions

- Latrine zones.
- Composting.
- Waste pits placed away from water.
- Ash and refuse collection.
- Animal manure management.
- Drainage ditches.
- Wash areas.
- Burial or safe disposal rules.
- Periodic NPC maintenance.

## 13.2 Town and City Solutions

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

## 13.3 Sanitation Load

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

## 13.4 Failure Effects

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

## 13.5 Simplification Rule

Sanitation uses coverage, capacity, placement and events. It does not require personal hygiene bars or real-time sewage particles through every block.

# 14. Maintenance, Damage, Hazards and Recovery

Infrastructure is allowed to deteriorate, but routine maintenance should not become constant punishment.

## 14.1 Maintenance Sources

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

## 14.2 Maintenance Policy

- Normal facilities warn and degrade before catastrophic failure.
- Critical networks receive higher NPC repair priority.
- Preventive maintenance consumes small scheduled resources when available.
- Harsh settings may increase wear; relaxed settings may reduce or disable routine deterioration.
- Repeated overload or ignored warnings can create major failures.
- Repairs consume real blocks, components and labour.
- Player or leadership policy can protect heritage routes, emergency links or strategic stores.

## 14.3 Criticality Bands

- Local convenience.
- Household service.
- Production support.
- Settlement essential.
- Emergency critical.
- Regional strategic.

A damaged decorative lane is lower priority than a collapsed bridge isolating the clinic or a contaminated well.

## 14.4 Recovery

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

# 15. NPC Planner and Project Selection

The settlement planner evaluates capability gaps and chooses projects from required, optional, conditional, upgrade and district pools.

## 15.1 Project Scoring

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

## 15.2 Typical Planner Triggers

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

## 15.3 Player Influence

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

# 16. Blueprint Forge Authoring and Official Source Validation

Official 20D sources are authored in Blueprint Forge as voxel structures and typed network graphs. The authoring view must make function visible, not hide it behind runtime code.

## 16.1 Required Source Layers

- Voxel shell, terrain supports and material roles.
- Entrances, loading areas, queue/turning clearances and maintenance access.
- Typed storage markers and zones with category and ownership profiles.
- Route nodes, segments, junctions, crossings and destination sockets.
- Water or sanitation sources, ports, direction, capacity and overflow.
- Construction-stage graph and temporary access.
- Damage groups, obstruction, contamination and repair deltas.
- Terrain-adaptation, flood, slope, bank and foundation rules.
- Pack-exposed material and module substitutions.
- Source version, dependencies, validation report and bake manifest.

## 16.2 Official Validation Layers

| **Layer** | **Examples** |
|---|---|
| Structural | Supports, foundations, span groups, collapse paths and safe access. |
| Semantic | Required markers, zones, sockets, categories, source bindings and maintenance. |
| Network | Connectivity, direction, capacity, class compatibility, cycles, dead ends and weakest links. |
| Inventory | Typed capacity, access, secure/public separation, reservations and loading. |
| Terrain | Slope, bank, floodplain, water depth/current, clearance, foundation and drainage. |
| Safety | Fire separation, contamination exclusion, clean/dirty routes, fall edges, emergency access and overflow. |
| Construction | Buildable stages, reachable work, temporary storage and valid partial service. |
| Runtime | Deterministic element IDs, navigation, collision, graph bake, state deltas and migration aliases. |
| Performance | Segment count, graph complexity, collision density, dynamic elements, LOD and streaming bounds. |

## 16.3 Bake Products

Runtime packages may contain:

- Simplified collision and navigation surfaces.
- Stable route nodes, edges and transport-class masks.
- Loading and inventory endpoint tables.
- Water and sanitation graph tables with capacity and direction.
- Terrain-binding and source-reference records.
- Damage, obstruction, contamination and repair element maps.
- LOD and distant-simulation summaries.
- Validation diagnostics, content hash and migration metadata.

The editable voxel and semantic source remains in the Forge package; runtime products can always be rebuilt.

# 17. Restricted Player-Creator Validation

Document 19 may expose approved 20D profiles for player-created storehouses, warehouses, local paths, crossings, docks, wells and utility segments. The player creator uses the same contract vocabulary but hides developer-only registry and migration controls.

## 17.1 Player-Allowed Controls

- Voxel layout within permitted size and performance budgets.
- Compatible material roles and unlocked pack palettes.
- Placement of required public, staff, loading, storage and maintenance elements.
- Local route and utility segments using permitted socket types.
- Category assignments within the selected building profile.
- Construction-stage grouping from approved stage templates.
- Cosmetic and allowed functional modules.

## 17.2 Player-Blocked Controls

- Universal stable IDs, catalogue ownership and schema versions.
- Arbitrary inventory capacity, water yield, flow, route class or throughput values.
- Hidden or inaccessible storage and endpoints.
- Removal of required contamination, overflow, support or emergency rules.
- Cross-settlement, cross-realm or protected-network authority without permission.
- Runtime scripts, migration aliases, source trust and authoritative transaction code.

## 17.3 Submission Result

A draft may be saved while invalid. NPC planners, shared worlds and functional activation require all blocker diagnostics to pass. Approval records source version, creator, target definition, allowed packs, performance budget, validation profile and content hash.

# 18. Construction Stages, Commissioning and Partial Activation

## 18.1 Shared Stage Vocabulary

1. Planning, survey and route/source verification.
2. Site preparation, clearing, earthworks and temporary access.
3. Foundation, supports, banks, lining or subgrade.
4. Structural shell, deck, road body, tank or primary channel.
5. Enclosure, weatherproofing, drainage and safety edges.
6. Functional installation: storage, loading, pumps, valves, drains, controls or treatment.
7. Network connection and route integration.
8. Commissioning, inspection, cleaning and initial stock/service.
9. Complete and operational.

Small sources merge stages; bridges, water networks and sanitation projects may split them into independently operable segments.

## 18.2 Partial Activation

- Builder Supply Yard activates after safe access, project anchor and at least one valid material bay.
- Storehouse activates only protected and reachable category zones.
- Warehouse can operate one receiving/storage wing while later reserve or automation modules are unfinished.
- A route segment becomes usable when both endpoints and its passability contract are valid.
- A bridge must not open to a transport class until the required supports, deck, edges and approaches pass.
- A well activates after source, lining, draw point, safe access and contamination separation pass.
- Water and sanitation networks activate completed connected branches, not visual future segments.

## 18.3 Commissioning

Commissioning verifies source binding, graph connectivity, inventories, permissions, staff where required, access, safety, overflow, maintenance, initial condition and runtime bake version. Failed checks produce explicit blockers rather than silently reducing service.

# 19. Upgrade, Inheritance, Conversion and Replacement

## 19.1 Upgrade Models

- In-place source inheritance and delta construction.
- Attached module expansion.
- Segment extension or network branch.
- Category/profile conversion.
- Parcel replacement while preserving stock and service continuity.
- Technology or magic retrofit through 20E-compatible sockets.
- Culture, biome or realm adaptation through 20G packs.

## 19.2 Typical Upgrade Families

| **From** | **To / Branch** | **Preserved State** |
|---|---|---|
| Builder Supply Yard | Small Storehouse, construction depot or mobile project camp | Project stock, ownership, ledger and contributor history. |
| Small Storehouse | Village Warehouse or specialised depot | Inventories, reservations, ownership and category mapping. |
| Village Warehouse | Expanded wings or automated distribution | Stock, transactions, permissions, staff and project links. |
| Dirt Path | Durable road, drained route or culture/biome adaptation | Route nodes, ownership, usage and historical alignment. |
| Simple crossing | Timber/stone bridge, causeway, ferry or tunnel | Route endpoints, travel history and project references. |
| Village Well | Covered well, pump house, cistern or network connection | Source binding, quality history and service users. |
| Informal waste service | Sanitation network or treatment facility | Load history, routes, incidents and recovered outputs. |

## 19.3 Safety Rules

- Inventory conversion maps every stack and reservation before construction begins.
- Critical services require temporary capacity or phased continuity before demolition.
- Network upgrades preserve stable element aliases or create explicit migration mappings.
- A larger visual source does not inherit higher capacity unless new validated elements are built.
- Downgrades and abandonment release or relocate stock and users through authoritative transactions.

# 20. Damage, Occupation, Repair and Restoration

## 20.1 Damage Families

- Roof/shell damage causing weather or spoilage exposure.
- Storage-container or secure-zone damage.
- Loading obstruction or destroyed service interface.
- Route surface wear, blockage, flood, ice, burial or collapse.
- Bridge support, deck, edge or approach failure.
- Water source, lining, pump, conduit, tank or control damage.
- Sanitation blockage, overflow, leak, treatment loss or contamination.
- Fire, raid, theft, sabotage, corruption or occupation state.

## 20.2 Functional Consequence

Damage invalidates only affected elements where possible. A warehouse with one damaged wing may retain other stock zones. A bridge closure removes its route edge but not unrelated roads. A water network fault reduces service according to the actual broken link. Contamination propagates only through defined connected systems and events.

## 20.3 Occupation and Access Change

Occupation may change ownership, warehouse permissions, tolls, route restrictions, stock seizure and utility priorities without rewriting the source blueprint. Original builder, culture, prior owners and transaction history remain preserved.

## 20.4 Repair and Restoration

Repair projects reference stable source elements, exact materials, labour, access and safety. Temporary patches may restore reduced route or utility service. Restoration can return the original source state, apply an approved child source, convert the function or preserve the ruin as world evidence.

# 21. Settlement-Stage Expectations

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

# 22. Detailed Registry Summary

| **No.** | **Stable ID** | **Definition** | **Earliest Stage** | **Primary Need** | **Project Class** | **Status** |
|---:|---|---|---|---|---|---|
| 3 | building.construction.builder_supply_yard | Builder Supply Yard | Camp | Infrastructure | Required | Technical POC - Core |
| 81 | building.storage.small_storehouse | Small Storehouse | Hamlet | Infrastructure | Required | Extended Slice |
| 82 | building.storage.village_warehouse | Village Warehouse | Village | Infrastructure | Required | Technical POC - Core |
| 83 | building.storage.specialised_depot | Specialised Depot or Silo | Village | Infrastructure | Optional | Alpha |
| 84 | building.storage.automated_distribution_centre | Automated Distribution Centre | City | Infrastructure | Optional | Beta |
| 85 | project.transport.dirt_path_junction_set | Dirt Path and Road Junction Set | Camp | Infrastructure | Required | Technical POC - Core |
| 86 | project.transport.stone_road_bridge_set | Stone Road and Bridge Set | Village | Infrastructure | Upgrade | Alpha |
| 87 | building.transport.dock_harbour | Dock or Harbour | Town | Infrastructure | Conditional | Beta |
| 88 | building.utility.village_well | Village Well or Water Point | Hamlet | Provisions | Required | Technical POC - Core |
| 89 | project.utility.cistern_aqueduct_pump | Cistern, Aqueduct or Pump System | Town | Infrastructure | Conditional | Beta |
| 90 | project.utility.sanitation_waste_system | Sanitation and Waste Utility | Town | Infrastructure | Optional | Beta |

Catalogue definition 3 is included because Document 20H assigns the POC Builder Supply Yard to 20D. Advanced rail, powered conveyors, portal freight, mana distribution and major industrial utilities are primarily owned by 20E. District-scale transit, utility campuses and regional megaprojects are owned by 20F.

# 23. Builder Supply and Storage Entries

### 3. Builder Supply Yard

building.construction.builder_supply_yard

| **Catalogue role** | Construction / Storage Support \| Camp \| Small \| Required \| Technical POC - Core |
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
| **Restricted player-creator validation** | Must expose visible project stock, safe worker access, route/loading space and one valid project anchor. Decorative scaffold piles alone do not create reservation capacity. |
| **Official Blueprint Forge source** | Open construction-staging source with project anchor, typed material bays, supply crates, tool and scaffold stores, builder/foreman positions, loading edge, route socket, temporary fencing and planned, supplied, active, depleted, moved, damaged and cleared state deltas. |
| **Runtime and persistence** | Persist project bindings, exact reserved stock, bay contents, ownership, builder claims, active stages, access, relocation, source version and construction history. Removing the yard never deletes or duplicates owned stock. |
| **Culture and style variation** | Timber yard, stone mason staging court, nomad pack camp, dwarven material alcove, fae living scaffold grove or magical floating supply rack. |

### 81. Small Storehouse

building.storage.small_storehouse

| **Catalogue role** | Storage / Shared Supply \| Hamlet \| Small \| Required \| Extended Slice |
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
| **Restricted player-creator validation** | Must contain reachable valid storage markers, dry protected interior, public/shared access, category compatibility and loading space. Empty decorative shelving does not count. |
| **Official Blueprint Forge source** | Small protected storage source with public/shared entrance, typed storage markers, food-safe and tool/construction zones, simple ledger, keeper position, loading edge, dry/flood-safe shell and empty, stocked, full, damp, looted, damaged and restored states. |
| **Runtime and persistence** | Persist actual inventories, category compatibility, ownership, permissions, reservations, condition, contamination, access, keeper links and transfer history. Distant simulation preserves exact totals and authorised withdrawals. |
| **Culture and style variation** | Raised timber store, underground cool cellar, communal longhouse store, clay granary room, stone vault or living-tree hollow. |

### 82. Village Warehouse

building.storage.village_warehouse

| **Catalogue role** | Storage / Logistics \| Village \| Large \| Required \| Technical POC - Core |
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
| **Restricted player-creator validation** | Must separate public, secure, project and loading functions; expose category zones, valid routes and ledger/control markers; automation ports cannot bypass ownership. |
| **Official Blueprint Forge source** | Golden warehouse source with public counter, secure staff circulation, multiple typed category zones, project reserve, emergency reserve, ledger/control station, loading yard, road and automation sockets, fire/flood separation and stocked, strained, blocked, looted, burning, occupied and repaired deltas. |
| **Runtime and persistence** | Persist authoritative category inventories, project and emergency reservations, ledger transactions, loading queues, staff, automation permissions, condition, security incidents and source version. Every import/export remains atomic and traceable. |
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
| **Restricted player-creator validation** | Must declare accepted categories and prove appropriate environment, loading, containment and access. General empty volume does not earn specialised capacity. |
| **Official Blueprint Forge source** | Profile-driven depot source selecting accepted categories, environmental controls, bulk storage modules, loading interface, containment/ventilation, inspection and maintenance access, with full, contaminated, leaking, unsafe and converted state families. |
| **Runtime and persistence** | Persist accepted categories, exact stock, preservation/containment state, temperature or hazard abstractions, loading queues, staff, maintenance and conversion profile. Invalid stock creates diagnostics instead of silent deletion. |
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
| **Restricted player-creator validation** | Must prove directional flow, buffers, maintenance access, staff safety, ownership, emergency shutdown and compatible network ports. Decorative conveyors do not create throughput. |
| **Official Blueprint Forge source** | Nested logistics source composed from receiving, sorting, buffer, storage, dispatch, control, maintenance and power/automation modules. It exposes typed import/export ports, queue lanes, routing rules, emergency bypass and partial-wing, jammed, unpowered, seized and restored states. |
| **Runtime and persistence** | Persist receiving/dispatch queues, typed buffers, route rules, exact inventories, power/automation allocation, operators, maintenance, jams, throughput summaries and transaction journal. Local and distant processing reconcile through the same atomic transfers. |
| **Culture and style variation** | Mechanical sorting hall, canal exchange warehouse, dwarven rail depot, golem-dispatch court, rune-indexed vault or portal distribution chamber. |

# 24. Roads, Bridges and Transport Entries

### 85. Dirt Path and Road Junction Set

project.transport.dirt_path_junction_set

| **Catalogue role** | Transport / Network \| Camp \| Network \| Required \| Technical POC - Core |
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
| **Restricted player-creator validation** | Must connect real route nodes and preserve passable clearance. Decorative stripes that do not create valid navigation provide no route service. |
| **Official Blueprint Forge source** | Parametric route-kit source containing path segments, corners, junctions, steps, ramps, parcel entrances, drainage edges, culvert adapters, wayfinding and route sockets. Each element has stable IDs, terrain-fit rules, passability tags and clear, muddy, flooded, obstructed, damaged and repaired deltas. |
| **Runtime and persistence** | Persist stable route nodes and segments, geometry/source references, route class, passability, width, slope, ownership, condition, obstructions, weather state and repair history. Cached path costs rebuild deterministically after state or terrain change. |
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
| **Restricted player-creator validation** | Must prove connected route class, vehicle clearance, support/load, safe landings and drainage where required. Visual stone surfacing alone does not grant heavy capacity. |
| **Official Blueprint Forge source** | Durable modular road-and-crossing source using road surface, shoulders, drainage, retaining walls, abutments, supports, span modules, rails, stairs and inspection access. It bakes route class, load, clearance and collapse groups and supports intact, worn, flooded, iced, breached and rebuilt states. |
| **Runtime and persistence** | Persist road and bridge elements, supports, load class, clearance, connected nodes, damage groups, closures, weather, maintenance and replacements. Collapse affects explicit spans and routes rather than only an abstract percentage. |
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
| **Restricted player-creator validation** | Must connect navigable water to safe land access and prove berth, loading, rescue and clearance. Decorative piers without route markers provide no harbour service. |
| **Official Blueprint Forge source** | Water-route source with navigable approach, berth modules, loading/unloading positions, public/service circulation, storage and customs sockets, rescue equipment, tide/flood clearances and open, storm-closed, blocked, burning, occupied, damaged and restored states. |
| **Runtime and persistence** | Persist berth and route bindings, vessel/boat clearances, loading queues, stock manifests, staff, water hazards, ownership, condition, closure and incident history. Freight transfers conserve exact stock between authorised inventories. |
| **Culture and style variation** | Timber river dock, stone quay, floating village harbour, cavern port, fae lily-pad landing, desert canal station or ice harbour. |

# 25. Water and Sanitation Entries

### 88. Village Well or Water Point

building.utility.village_well

| **Catalogue role** | Utility / Water \| Hamlet \| Micro \| Required \| Technical POC - Core |
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
| **Restricted player-creator validation** | Must bind to a real water source and expose safe access, quality and drainage. Decorative water blocks or an unreachable hole provide no service. |
| **Official Blueprint Forge source** | Golden public-water source with verified source/intake binding, draw or pump point, safe standing and queue zone, cover/lining, overflow and drainage, contamination exclusion, maintenance access and operational, low, dry, frozen, contaminated, damaged and cleansed states. |
| **Runtime and persistence** | Persist source binding, yield band, quality, reserve, draw capacity, users/service demand summary, contamination, freeze/drought state, maintenance, damage and history. Water capacity cannot be copied by duplicating the visual well. |
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
| **Restricted player-creator validation** | Must prove source, direction/gradient or pump, storage, distribution, overflow, maintenance and contamination separation. Decorative channels provide no network capacity. |
| **Official Blueprint Forge source** | Network project source assembled from source/intake, channel/pipe, pump/lift, cistern/reservoir, valve/control, distribution, overflow, public access and maintenance modules. Each segment has typed direction, capacity, pressure/gradient and stable state references. |
| **Runtime and persistence** | Persist all network elements, source/storage quantities, capacity, pressure/gradient abstraction, flow allocation, valves, faults, maintenance, quality and served endpoints. Service is limited by the weakest required link and authoritative source totals. |
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
| **Restricted player-creator validation** | Must expose a complete safe flow from collection to treatment/disposal, with maintenance and clean-water separation. Hidden holes do not create sanitation capacity. |
| **Official Blueprint Forge source** | Network/facility source with collection points, dirty-route sockets, drain/channel segments, treatment or disposal modules, recovery/compost outputs, overflow, clean/dirty separation, hazard exclusion and clear, blocked, overflowing, contaminated, damaged and restored states. |
| **Runtime and persistence** | Persist generated load, collection and drainage networks, treatment/disposal capacity, recovered outputs, contamination, staff, route access, blockages, overflow, maintenance and incident history. Distant updates preserve loads and consequences without per-item waste simulation. |
| **Culture and style variation** | Compost village system, canal drainage, stone sewer, desert dry-latrine network, fungal recycler, golem collection route or purification garden. |

# 26. Technical POC and Extended Forest Hamlet Scope

## 26.1 Technical POC Core - Four Definitions

| **Definition** | **Primary Proof** | **Critical Runtime Dependencies** |
|---|---|---|
| Builder Supply Yard | Project stock reservation, visible staging and builder collection. | Project records, inventory reservation, route access, construction task and save/load. |
| Village Warehouse | Authoritative village inventory, categories, ledger, loading and project reserves. | Inventory, ownership, atomic transactions, permissions, staff, loading and persistence. |
| Dirt Path and Road Junction Set | Persistent connected route graph between entrances, work and projects. | Stable nodes/segments, terrain placement, path-cost bake, condition and repair. |
| Village Well or Water Point | Real source-bound public water capacity and readable quality/access. | Source binding, capacity, contamination separation, service summary and diagnostics. |

## 26.2 Extended Forest Hamlet - One Definition

Small Storehouse proves the earlier protected shared-storage step and the upgrade/migration path into the Village Warehouse. It is not required to block the first technical system proof, but it remains part of the complete Forest Hamlet progression.

## 26.3 End-to-End Scenario

1. Generate the Forest Hamlet site and initial route anchors.
2. Build the Builder Supply Yard from exact stock and register the project anchor.
3. Deliver resources, reserve them to a named project and verify ownership/contribution history.
4. Build the Dirt Path network to homes, work sites, the well, warehouse site and watchtower site.
5. Build the Village Well, bind it to a real source and validate clean access and drainage.
6. Build the Village Warehouse with receiving, category storage, project reserve, ledger and loading.
7. Transfer stock from personal/shared stores into the warehouse without duplication.
8. Reserve watchtower resources and create builder delivery tasks through the route graph.
9. Save and reload during transfer and construction; reconcile exact stock, routes and project state.
10. Block or damage one path and verify rerouting, delay, readable diagnostics and a repair project.
11. Contaminate or disable the well and verify water-service pressure, response and recovery.
12. Complete the watchtower and confirm infrastructure enables the raid loop rather than granting defence directly.
13. In the extended slice, construct Small Storehouse first and upgrade/migrate its stock into the warehouse.
14. Validate one player-created storehouse or local path source under restricted creator rules.

## 26.4 Acceptance Outcome

The POC passes only when exact inventories, reservations, route connectivity, water source state and construction progress survive local/distant transitions and save/load without unexplained creation, deletion or reassignment.

# 27. Simulation LOD, Persistence and Multiplayer Authority

## 27.1 Simulation Ranges

| **Range** | **Behaviour** |
|---|---|
| Immediate | Visible carrying, carts/boats, loading, water drawing, maintenance, obstruction and physical state. |
| Local settlement | Simplified movement presentation; authoritative transfer, queues, service and condition remain active. |
| Regional | Batched deliveries and utility allocation using the same endpoints, capacities and transactions. |
| Distant | Scheduled summaries preserving stock, route/network state, staff, faults, projects and history. |
| Dormant realm/region | Event-driven or bounded interval updates; no continuous vehicle or fluid simulation. |

## 27.2 Persistent Minimum

Every 20D instance preserves:

- Stable structure/network instance IDs and source IDs/version.
- Universal definition and resolved pack data.
- Stable network element IDs and connection graph.
- Ownership, permissions and access policy.
- Exact inventories, categories, reservations and transaction references.
- Route class, passability, clearance, condition and closures.
- Water source binding, quality, storage and allocation where applicable.
- Sanitation load, collection, treatment, overflow and recovered outputs where applicable.
- Staff, queues, maintenance, damage, contamination and blockers.
- Construction, upgrade, occupation, repair and incident history.

## 27.3 Multiplayer Authority

The authoritative host/server owns inventory transfer, reservation, route availability, loading completion, water/source allocation, contamination, network fault, damage and project state. Clients may predict movement and UI but cannot complete transfers, create stock or alter service capacity independently.

# 28. Balancing, Diagnostics and Anti-Exploit Rules

## 28.1 Balance Principles

- Early paths and hand hauling remain useful through low cost and flexibility.
- Better roads, storage and utilities improve reliability and capacity but require construction, land, maintenance and staffing.
- Infrastructure pressure creates choices and projects, not constant punishment.
- Exact capacity, travel, spoilage, water and waste values remain external balance data.
- Redundancy matters for critical services but should not require duplicate everything.
- Culture, biome and realm solutions may differ without one universal best layout.

## 28.2 Anti-Exploit Rules

- Decorative crates, shelves, roads, pipes and water blocks provide no functional capacity.
- Hidden inaccessible markers do not count.
- The same item cannot exist in source and destination inventories during transfer.
- Cancelled or interrupted transfers reconcile held, carried and delivered quantities.
- Player sources cannot declare unsupported capacity, route class, water yield or disposal.
- Duplicate sockets and overlapping route elements do not multiply throughput.
- Copying a well source cannot copy its groundwater or spring binding.
- Distant and local simulation must reconcile at promotion/demotion boundaries.

## 28.3 Diagnostic Standard

Diagnostics identify severity, source element, graph or inventory involved, affected service, suggested correction and whether the issue blocks source approval, construction, commissioning or runtime operation.

Example messages:

- `D20_STORAGE_MARKER_UNREACHABLE - Project reserve cannot be reached from staff circulation.`
- `D20_ROUTE_SOCKET_DISCONNECTED - Warehouse loading point has no cart-capable route.`
- `D20_BRIDGE_SUPPORT_INVALID - Span exceeds validated support profile.`
- `D20_WATER_SOURCE_MISSING - Well has no authoritative source binding.`
- `D20_SANITATION_CLEAN_DIRTY_OVERLAP - Waste route crosses protected clean-water zone.`

# 29. Godot/Summer Engine Implementation Direction

## 29.1 Recommended Resource Records

```text
InfrastructureFacilityDefinitionResource
StorageServiceProfileResource
RouteElementDefinitionResource
TransportClassProfileResource
LogisticsEndpointProfileResource
WaterServiceProfileResource
SanitationServiceProfileResource
NetworkPortDefinitionResource
BlueprintSourceResource
BlueprintBakeManifestResource
```

Runtime records may include:

```text
StructureInstanceRecord
NetworkElementInstanceRecord
RouteGraphRecord
InventoryRecord
InventoryReservationRecord
InventoryTransactionRecord
DeliveryTaskRecord
LoadingQueueRecord
WaterSourceRecord
UtilityNetworkRecord
MaintenanceFaultRecord
```

## 29.2 Service Boundaries

- `InventoryService` owns exact stock, ownership, categories, reservations and atomic transfer.
- `LogisticsService` owns delivery tasks, loading queues, allowed modes and transfer completion.
- `RouteService` owns typed route graphs, reachability, effective cost, closure and route-class compatibility.
- `TransportService` owns vehicle/animal/vessel capacity and route usage contracts.
- `WaterService` owns source binding, quality, storage, allocation and public service coverage.
- `SanitationService` owns generated load, collection, treatment, recovered outputs and contamination consequence.
- `StructureService` owns placed source references, semantic elements, condition and state.
- `ConstructionService` owns projects, exact resources, stages and commissioning.
- `SettlementPlannerService` owns infrastructure project choice and priorities.

## 29.3 Implementation Principles

- Use stable Godot `Resource` definitions and versioned runtime records.
- Keep editor-only Forge voxel and graph-editing data out of runtime packages unless explicitly required.
- Bake navigation, route, endpoint, utility, damage and diagnostic tables deterministically.
- Use event-driven and bounded updates rather than per-frame settlement logistics simulation.
- Journal important inventory and utility transactions for debugging and recovery.
- Preserve stable element aliases when source graphs change.
- Use chunk-aware graph partitioning and cached summaries without changing authoritative totals.
- Summer Engine agents may draft content and code, but stable IDs, transaction rules, migrations and source bindings require reviewable diffs and validation.

# 30. Open Questions for Later Balancing

- Final storage-marker capacity and category rules by item volume/stack model.
- Route width, slope, clearance and transport-class thresholds after voxel tests.
- Travel-cost and weather penalties that remain readable without excessive slowdown.
- Loading and queue abstraction for busy towns and cities.
- Bridge load, wear, flood and collapse values after physics and combat testing.
- Water demand, source yield, drought and contamination bands by settlement stage and biome.
- Sanitation load and treatment detail appropriate for town/city gameplay.
- Spoilage and preservation breadth without inventory clutter.
- Toll, customs and route-ownership integration with 20C and economy systems.
- Cross-chunk and cross-realm utility limits.
- Accessibility and route requirements for diverse Entity Forge body plans and mounts.
- Exact POC graph, inventory and performance budgets.

# Appendix A. 20D Functional Definition Field Template

| **Field** | **Purpose** |
|---|---|
| Stable ID and catalogue number | Immutable function identity and 20H link. |
| Name, category and owner | Human-readable family and companion authority. |
| Earliest stage and delivery scope | Progression and production milestone. |
| Needs and planner class | Settlement contribution and project eligibility. |
| Purpose and capacity model | What is stored, moved or serviced and what limits capacity. |
| Staff and users | Keepers, haulers, operators, maintainers and service consumers. |
| Inputs, outputs and ownership | Conserved stock, source state, recovered outputs and authority. |
| Semantic contract | Markers, zones, sockets, categories, routes, hazards and maintenance. |
| Network profile | Graph type, elements, direction, class, capacity, condition and weakest links. |
| Official Forge source profile | Source, modules, stages, states, terrain adaptation, inheritance and dependencies. |
| Restricted player profile | Allowed creator controls and blocking validation. |
| Planner and construction rules | Triggers, stages, partial activation, commissioning and cost source. |
| Runtime/persistence profile | Authoritative records, LOD, damage, migration and multiplayer. |
| Diagnostics and tests | Validation codes, golden fixtures and acceptance checks. |

# Appendix B. Network and Service-Capacity Matrix

| **System** | **Authoritative Source** | **Required Links** | **Capacity Limiter** | **Typical Failure** |
|---|---|---|---|---|
| Shared storage | Typed inventory markers/containers | Entrance, staff/loading access | Valid capacity, category, condition and permissions | Full, inaccessible, wet, looted or restricted. |
| Project reserve | Inventory + project reservation | Warehouse/yard to project route | Exact reserved stock and available delivery | Missing, stolen, contaminated or route blocked. |
| Foot/cart road | Route source elements | Entrance/junction/crossing sockets | Width, slope, surface, clearance and condition | Mud, obstruction, closed gate or collapse. |
| Freight delivery | Source/destination inventories | Loading endpoints and allowed route | Hauler/mode, loading, route and output buffer | Queue, no carrier, danger or destination full. |
| Dock/harbour | Navigable water and berth | Water route + land/loading route | Berth, clearance, weather and staff | Storm closure, blocked water, damaged berth. |
| Public water | Real source/intake | Draw point or distribution | Source yield, quality, storage and access | Dry, frozen, contaminated or blocked. |
| Water network | Source + graph + storage | Intake, pump/gradient, distribution | Weakest required link | Broken pump, leak, empty source or valve closure. |
| Sanitation | Generated load + network | Collection, treatment/disposal | Collection, route, treatment and maintenance | Blockage, overflow, leak or no staff. |

# Appendix C. POC Acceptance Checklist

- [ ] Builder Supply Yard official source passes project-anchor, storage, loading, access, stage and state validation.
- [ ] Project reservations remove stock from general availability without moving or duplicating it.
- [ ] Village Warehouse contains authoritative category inventories, project reserve, ledger, loading and permissions.
- [ ] Every warehouse transaction records source, destination, quantity, ownership and result.
- [ ] Dirt Path and Junction elements form a persistent route graph with stable nodes and condition.
- [ ] Entrances, loading points and project sites connect through valid transport classes.
- [ ] Route blockage changes delivery time or availability and creates a readable repair task.
- [ ] Village Well binds to a real source and validates quality, access, drainage and contamination exclusion.
- [ ] Water failure changes settlement causes without creating individual thirst micromanagement.
- [ ] Save/load preserves exact stock, reservations, network elements, source binding, damage and history.
- [ ] Local and distant simulation reconcile without item or service duplication.
- [ ] Small Storehouse upgrades/migrates to the warehouse in the extended slice without losing ownership or reservations.
- [ ] Restricted player sources cannot create unsupported stock, water or route capacity.
- [ ] Deterministic rebake preserves stable element references or supplies explicit migration aliases.

# Appendix D. Cross-System Dependency Matrix

| **20D Area** | **Primary Dependencies** | **Required Contract** |
|---|---|---|
| Construction staging | 04 Items, 05 Recipes, 07 NPC, 20 runtime | Exact project stock, ownership, builders, routes, stages and history. |
| Storage | 04 Items, 07 NPC, 08 Automation | Typed inventory, permissions, reservations, loading and transactions. |
| Routes/crossings | 03 Blocks, 11 Worldgen, 12 Structures | Terrain fit, sockets, passability, navigation, damage, repair and LOD. |
| Freight/trade | 07 NPC, 20B Trade, 20C Customs, 08/20E automation | Manifests, authorised transfer, routes, loading, security and ownership. |
| Water | 11 Worldgen, 20A Health/Provisions, 20E power/magic | Real source, quality, storage, distribution, maintenance and contamination. |
| Sanitation | 20A Health, 20B/20E industry, 11 Worldgen | Generated load, routes, treatment, recovered outputs, pollution and incidents. |
| Emergency/defence | 20C, 16 Combat | Priority routes, protected stores, fire water, evacuation and siege damage. |
| Packs/realms | 13 Factions, 14 Dimensions, 20G Packs | Adapted materials, transport, sources and laws without hidden free capacity. |

# Appendix E. Validation and Diagnostic Code Catalogue

| **Code** | **Severity** | **Meaning / Example Correction** |
|---|---|---|
| `STORAGE_CAPACITY_UNTYPED` | Blocker | Add valid typed storage markers/containers for the selected profile. |
| `STORAGE_MARKER_UNREACHABLE` | Blocker | Connect staff or public circulation to the storage endpoint. |
| `STORAGE_CATEGORY_CONFLICT` | Warning/Blocker | Separate incompatible food, fuel, hazard or clean stock categories. |
| `STORAGE_SECURE_ZONE_EXPOSED` | Blocker | Separate reserve/restricted stock from unrestricted public access. |
| `LEDGER_SERVICE_MISSING` | Warning/Blocker | Add required inventory/project control marker for the facility tier. |
| `LOADING_CLEARANCE_FAIL` | Blocker | Provide valid mode width, turning, height and route connection. |
| `LOGISTICS_ENDPOINT_ORPHANED` | Blocker | Connect the import/export endpoint to an authorised inventory. |
| `ROUTE_SOCKET_DISCONNECTED` | Blocker | Connect compatible route sockets or mark the endpoint intentionally terminal. |
| `ROUTE_CLASS_UNSUPPORTED` | Warning/Blocker | Reduce declared transport class or increase width/slope/clearance/support. |
| `ROUTE_SLOPE_EXCEEDS_PROFILE` | Blocker | Add steps/switchback/ramp or select a compatible class. |
| `ROUTE_EMERGENCY_ACCESS_BLOCKED` | Warning/Blocker | Restore priority access or define an alternate emergency route. |
| `BRIDGE_SUPPORT_INVALID` | Blocker | Add compatible foundations, supports or shorten the span. |
| `BRIDGE_CLEARANCE_CONFLICT` | Blocker | Resolve water/road navigation or overhead clearance conflict. |
| `WATER_SOURCE_BINDING_MISSING` | Blocker | Bind the service to an authoritative groundwater, spring or surface source. |
| `WATER_CONTAMINATION_BUFFER_FAIL` | Blocker | Increase separation from waste, livestock, industry or flood risk. |
| `WATER_OVERFLOW_ROUTE_MISSING` | Warning/Blocker | Add safe drainage/overflow for the selected source or storage profile. |
| `UTILITY_DIRECTION_CONFLICT` | Blocker | Correct incompatible input/output or gradient/flow direction. |
| `UTILITY_WEAKEST_LINK_ZERO` | Blocker | Repair or connect the required zero-capacity element. |
| `SANITATION_CLEAN_DIRTY_OVERLAP` | Blocker | Separate waste collection/treatment from clean-water and public-safe zones. |
| `SANITATION_DISPOSAL_MISSING` | Blocker | Add treatment, recovery or authorised disposal endpoint. |
| `MAINTENANCE_ACCESS_MISSING` | Warning/Blocker | Add a safe route to inspect and repair critical elements. |
| `STATE_DELTA_ORPHAN_ELEMENT` | Blocker | Repair damage/dynamic-state references to stable source element IDs. |
| `BAKE_GRAPH_HASH_MISMATCH` | Blocker | Rebuild runtime graph products from matching approved source and registry versions. |
| `MIGRATION_NETWORK_ELEMENT_LOST` | Blocker | Resolve the missing element alias before loading the persistent instance. |

---

**End of Document 20D - Storage, Roads, Transport, Logistics and Utilities - Version 0.2**
