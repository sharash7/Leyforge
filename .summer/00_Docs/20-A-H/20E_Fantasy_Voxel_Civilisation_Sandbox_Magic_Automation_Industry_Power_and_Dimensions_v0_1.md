**Fantasy Voxel Civilisation Sandbox**

**20E - Magic, Automation, Industry, Power and Dimensions**

**Version 0.1 - Detailed Building Family and Civilisation Infrastructure Registry Draft**

*A controlled registry for magical services, ritual and realm infrastructure, extraction, industry, power generation, automation, constructed labour and regional networks - keeping every system physical, resource-conserving, inspectable and connected to living settlements.*

| **Field** | **Locked Direction** |
|---|---|
| Document Scope | Detailed rules and registry entries for catalogue definitions 39, 40, 48-50 and 91-110 from Document 20H, with cross-system requirements for mana, power, machines, wards, portals, golems, hazardous industry and dimensional containment. |
| Needs Lock | Housing, Provisions, Health, Work, Safety, Infrastructure and Morale remain the only main settlement needs. Mana, power, research, automation, corruption, portal access and industrial output are causes, services, capacities and risks - not additional need bars. |
| Core Philosophy | Magic is practical infrastructure and automation is civilisation-scale labour support. Neither system replaces ordinary tools, NPC jobs, trade, roads, storage, health care, farming or player creativity. |
| Resource Rule | Mines, machines, rituals, wards, batteries, factories, portals and golems consume, transform, store or move real resources and energy through authoritative transactions. Decorative effects never generate capacity. |
| Player Blueprint Direction | Eligible player-created magical, industrial and automated blueprints may replace developer layouts after markers, ports, source binding, buffers, access, maintenance, safety, containment, shutdown and ownership rules validate. |
| NPC Growth Direction | Settlements select 20E projects using real demand, specialists, knowledge, terrain, resources, power/mana, logistics, law, culture, threat, risk, maintenance and future network plans. |
| Progression Direction | Manual tools -> copper mechanisms -> renewable mechanical power -> fuel/steam industry -> mana infrastructure -> magitech -> golems, leylines, portals and regional civilisation systems. Earlier branches remain useful. |
| Simulation Direction | Nearby systems show moving parts, item flow, mana/power state, workers, warnings and physical damage. Distant settlements preserve resources, energy budgets, production, projects, risks and consequences through bounded summaries. |
| POC Direction | The full POC building is the Mage Hut or Rune Workshop. Reduced test fixtures for a basic ward, small mana buffer and furnace/mana-furnace process connect the warehouse and watchtower loop without promoting every Alpha definition to POC production scope. |
| Balance Direction | Failures must be readable: no input, no power, low mana, blocked output, missing specialist, unsafe heat, impurity, overload, ward breach or destination instability. Normal systems warn and shut down before catastrophic failure. |

| **Locked Scope Rule** |
|---|
| **20E adds deep infrastructure beneath the seven needs; it does not add separate Power, Mana, Magic, Research, Industry, Automation, Portal or Corruption needs.** These systems appear as capacity, service, production, risk, law and progression information inside Work, Safety and Infrastructure drill-downs. |


# Document Purpose

Document 20E converts the magic, automation, industrial, power and dimensional parts of the universal building catalogue into implementable settlement rules. It defines what makes a magical or industrial facility functional, how energy and resources move, how specialists and machines cooperate, how risks remain fair and readable, how player-made blueprints are validated, and how settlements escalate from a single village mage to regional power and realm infrastructure.

The document deliberately avoids turning Leyforge into a separate spreadsheet-heavy factory simulator or a menu-only magic game. Machines and magical infrastructure exist as voxel structures with real inputs, outputs, ports, work positions, ownership, damage and construction stages. NPCs operate, repair, teach, regulate and react to them. The player may build, automate, redesign, restrict, exploit or destroy them, but cannot bypass the world economy by placing decorative machinery or glowing crystals.

# Design Sources and Dependencies

| **Source** | **20E Dependency** |
|---|---|
| 03 - Blocks Registry | Machine blocks, functional stations, mana blocks, conduits, runes, wards, portals, damage states, shape families, ports and block entities. |
| 04 - Items Registry | Machine parts, fuels, ores, mana resources, runes, catalysts, batteries, tools, enchanted gear, hazardous goods and realm materials. |
| 05 - Crafting and Recipe Registry | Machine, smelting, rune, alchemy, ritual, project, repair and dimension recipes with time, power, failure, by-products and exact transactions. |
| 06 - Resource Progression | Copper/iron/steel industry; mana crystal chain; Arcane Alloy, Mythril, Voidstone and Celestial Metal; fuels, deposits, purity and stabilisation. |
| 07 - NPC Village System | Named specialists, jobs, warehouses, project reservations, trust, laws, hazards, repairs, growth, near/far simulation and permanent consequences. |
| 08 - Automation System | Power, machines, logistics, ports, throughput, buffers, upgrades, golems, permissions, village supply, visible flow and simulation LOD. |
| 09 - Magic System | Mana, runes, wards, alchemy, rituals, teaching, magitech, healing, corruption, portals, leylines, golems and forbidden paths. |
| 10 - Creatures and Monsters | Threat attraction, ward categories, magical creatures, raids, sabotage, golems, realm hazards and creature-derived inputs. |
| 11 - Biomes and World Generation | Resource nodes, water/wind, fuel, leylines, mana density, corruption, terrain, climate, realm anchors and strategic sites. |
| 12 - Structures | Dynamic blueprints, markers, sockets, ownership, state transitions, repair, restoration, damage, world evidence and structure LOD. |
| 13 - Races, Peoples, Cultures and Factions | Magic laws, industrial attitudes, labour traditions, cultural schools, forbidden practices, ownership and signature replacements. |
| 14 - Dimensions | Persistent realms, portal routes, hazards, stabilisation, realm resources, societies, inactive simulation and destination state. |
| 15 - Quest and Event System | Research, shortages, discoveries, accidents, corruption, breach events, sabotage, faction reactions and project consequences. |
| 16 - Combat, Gear and Defence | Guard supply, enchanted gear, siege industry, wards, strategic targets, explosions, breaches and emergency shutdown. |
| 17 - UI/UX System | Machine panels, network overlays, warnings, research, permissions, ward coverage, portal controls and readable settlement causes. |
| 19 - Settlement Growth and Player Voxel Blueprint System | In-world and main-menu blueprint creation, network pieces, material tokens, stages, validation, custom town styles and NPC project acceptance. |
| 20 / 20H | Seven-needs lock, stable IDs, catalogue ownership, stage mapping, project classes, POC roster, blueprint targets and change control. |
| 20A-20D / 20F / 20G | Food/health/community; production/trade/education; governance/defence/law; storage/routes/utilities; complexes/megaprojects; culture and realm packs. |


# Static Table of Contents

- 1. Locked 20E Identity
- 2. Scope Boundaries and Anti-Micromanagement Rules
- 3. Seven-Needs Integration
- 4. Shared Magic, Power, Machine and Realm Model
- 5. Runtime, Production and Network States
- 6. Sites, Sources, Ports, Buffers and Functional Markers
- 7. Mana, Purity, Storage, Conduits and Wards
- 8. Power Generation, Transmission, Storage and Control
- 9. Machines, Recipes, Throughput and Automation
- 10. Industry, Heat, Pressure, Waste and Environment
- 11. Specialists, NPC Labour, Golems and Social Consequences
- 12. Knowledge, Research, Laws, Ownership and Forbidden Paths
- 13. Portals, Dimensions, Realm Materials and Containment
- 14. Risk, Maintenance, Failure and Recovery
- 15. NPC Planner and Project Selection
- 16. Player Blueprint and Network Validation
- 17. Construction, Upgrade, Conversion and Replacement
- 18. Settlement-Stage Expectations
- 19. Detailed Registry Summary
- 20. Magical Extraction and Advanced Industry Entries
- 21. Magic, Ritual and Dimensional Entries
- 22. Automation, Power and Advanced Industry Entries
- 23. POC Implementation Scope
- 24. Balancing and Simulation LOD
- 25. Open Questions for Later Balancing
- Appendix A. 20E Data Field Template
- Appendix B. Power, Mana and Facility Contract Matrix
- Appendix C. POC Acceptance Checklist
- Appendix D. Cross-System Dependency Matrix

# 1. Locked 20E Identity

20E is the civilisation capability and escalation layer of the building registry. It provides the structures that turn knowledge, resources, workers, machines and magic into larger production, settlement protection, travel, research and regional influence. Every entry must remain physical, inspectable and connected to real world state.

| **Locked Rule** |
|---|
| A facility only provides its advertised production, protection, energy, research, labour or travel capacity when its required source, markers, ports, buffers, staff, knowledge, ownership, safety and condition are valid. A model of a turbine does not create power; a crystal pile does not store mana; an empty portal arch does not create a destination. |

| **Identity Layer** | **Design Meaning** | **Player-Facing Result** |
|---|---|---|
| Practical Magic | Mana, runes, wards, rituals, healing, portals and leylines are buildable infrastructure. | Magic powers and protects settlements rather than existing only in combat menus. |
| Conserved Production | Machines and industry transform exact inputs into exact outputs and by-products. | Automation scales work without duplicating resources. |
| Visible Energy | Sources, transmission, storage, controls and consumers have physical states and feedback. | Players can diagnose why a network works or fails. |
| Named Expertise | Mages, engineers, alchemists, operators and maintainers are persistent NPCs with real jobs. | Buildings create social roles, teaching and succession rather than anonymous bonuses. |
| Risk and Choice | Heat, pressure, pollution, corruption, overload, breach, labour displacement and forbidden paths have counterplay. | Powerful growth creates meaningful decisions and consequences. |
| Realm Connection | Portals and dimensional facilities bind to persistent destinations, hazards, permissions and supplies. | Other realms become part of civilisation logistics and story, not disposable levels. |
| Scalable Simulation | Nearby systems animate physically while distant systems preserve bounded summaries and history. | Cities and multiple realms remain feasible without false production. |


# 2. Scope Boundaries and Anti-Micromanagement Rules

- The seven needs remain the only top-level settlement needs.
- Power and mana are network resources and service capacities, not happiness-style needs.
- Research and magic schools are progression systems, not mandatory bars for every village.
- NPCs perform routine operation, refuelling, maintenance and safe shutdown according to jobs and policy. The player intervenes at bottlenecks, projects, accidents, laws, upgrades and strategic choices.
- Nearby item and energy flow may be visually represented, but authoritative totals use integer or bounded data transactions.
- Machines do not need realistic engineering simulation. They need readable inputs, outputs, power, buffers, speed, safety, condition and recipe state.
- Mechanical, industrial and magical branches coexist. Mana does not automatically replace water, wind, fuel or NPC labour.
- Not every settlement needs magic, steam, portals, golems or factories. Culture, geography, specialists, research, threat and player choice determine development.
- Catastrophic failures are limited to ignored warnings, harsh settings, unstable materials, forbidden systems or major events. Normal equipment warns and shuts down.
- Distant settlements do not simulate every shaft rotation, spell particle or golem step. They preserve production, energy, staffing, risk and history through summaries.
- Player-made designs receive no capacity from visual size alone. Functional markers, ports and real components define service.
- Full realm ecology, complete fluid/heat simulation, autonomous artificial intelligence for each machine and unlimited portal routing are outside Version 0.1.

| **Explicit Non-Goals** |
|---|
| 20E does not require real electrical engineering, continuous mana-particle simulation, manual shift scheduling, individual machine programming, mandatory factory ratios, automatic replacement of villagers, a unique building for every spell school, or a portal that ignores destination state and ownership. |


# 3. Seven-Needs Integration

| **Need** | **20E Contribution** | **Typical Failure Causes** |
|---|---|---|
| Housing | Advanced power, heating, lighting, lifts or magical stability can support dense or unusual housing. | Grid outage, unsafe industry nearby, failed climate control or realm hazard. |
| Provisions | Automated farms, pumps, mills, preservation, logistics and controlled climates scale food resilience. | No water/power, seed/input shortage, blocked output, pollution or climate failure. |
| Health | Alchemy, healing, cleansing, clean industry and containment support treatment and hazard recovery. | Reagent shortage, contamination, corruption, unsafe waste or no specialist. |
| Work | Extraction, industry, machine shops, academies, magic services and automation create jobs and outputs. | No inputs, tools, specialist, power/mana, recipe, buffer or safe access. |
| Safety | Wards, warning relays, containment, reliable power, shutdown, protected stores and portal control reduce risk. | Ward empty, overload, breach, fire, sabotage, impurity, unstable destination or illegal use. |
| Infrastructure | Power, mana, machines, networks, portal routes and grid control directly provide the need. | Weak source, broken transmission, no storage, maintenance backlog, conflicting ownership or blocked logistics. |
| Morale | Rituals, teaching, visible progress, culture magic and reliable services build confidence; accidents and displacement reduce it. | Forbidden practice, repeated outages, pollution, fear of golems, exploitation or magical disaster. |


# 4. Shared Magic, Power, Machine and Realm Model

All 20E facilities use a small set of interoperable contracts so the game does not require a unique simulation for each building.

## 4.1 Energy and Production Chain

Source -> Extraction/Generation -> Transmission -> Storage/Buffer -> Control -> Consumer/Recipe -> Output/Service -> Waste/Risk

Examples:

- River flow -> Waterwheel -> Shaft -> Mill -> Processed grain.
- Coal and water -> Steam plant -> Power network -> Factory -> Machine components and heat/waste.
- Mana crystal -> Refinement -> Battery -> Conduit -> Ward -> Protected radius and mana drain.
- Leyline -> Relay -> Regional grid -> Portal station -> Travel capacity and stabilisation demand.

## 4.2 Common Capacity Calculations

| **Capability** | **Calculation Direction** | **Player-Facing Example** |
|---|---|---|
| Production throughput | Recipe base rate x machine/module x power x staffing x condition x input/output availability. | Mana furnace: 6 iron/min; output blocked. |
| Power service | Minimum of generation, transmission, storage discharge and control allocation compared with active demand. | Mechanical network: Strained, 82/90 power units. |
| Mana service | Accepted mana quantity and purity through valid storage/conduits, modified by stabilisation and risk. | Ward reserve: 9 hours at current threat. |
| Ward coverage | Anchor profile x mana x rune quality x relay links x tuning, reduced by interference and damage. | Northern ward: 74% coverage; relay damaged. |
| Research capacity | Valid specialist time x workstations x knowledge/material access x safety. | Portal research paused: missing stabilised shard. |
| Portal throughput | Frame/anchor capacity x mana x stability x operator x destination availability x cooldown. | Destination closed: storm in target realm. |
| Golem labour | Active permitted constructs x charge x task profile x route/access x maintenance. | 3 construction golems; 1 charging. |
| Risk | Base hazard x load x impurity x damage x environment x forbidden modifiers, reduced by safety, staff and containment. | Foundry heat risk: Strained; cooling low. |


## 4.3 Capacity Does Not Equal Free Output

A building may have high maximum capacity but produce nothing when input, energy, staffing, knowledge, permission, destination or output space is missing. The UI shows the current limiting cause.

# 5. Runtime, Production and Network States

## 5.1 Shared Facility States

| **State** | **Meaning** |
|---|---|
| Planned | Approved but not supplied or built. |
| Supplied | Next construction stage is reserved and reachable. |
| Building | Player/NPC construction is active. |
| Dormant | Structure is complete but lacks specialist, source, attunement, research or permission. |
| Idle | Functional and ready, with no active demand or recipe. |
| Active | Producing, powering, protecting, researching or transporting normally. |
| Strained | Working near a capacity, safety, maintenance or supply limit. |
| Input Starved | Required material, fuel, mana, water or reagent is missing. |
| Output Blocked | Buffer or destination cannot accept output. |
| Unpowered / Low Mana | Energy input is absent or below the active requirement. |
| Under Maintenance | Temporarily unavailable for planned repair or tuning. |
| Degraded | Damage or wear reduces capacity. |
| Unstable | Purity, pressure, heat, corruption or resonance is outside safe range. |
| Overloaded | Demand exceeds safe source/transmission/control capacity. |
| Contaminated / Corrupted | Materials, mana, site or outputs carry a hazard. |
| Contained | A hazard is isolated and monitored but not removed. |
| Breached | Containment, ward or portal safety has failed. |
| Emergency Shutdown | Automatic or authorised safe stop. |
| Disabled | Core function cannot operate until repaired, reconnected or reauthorised. |
| Abandoned | No valid ownership, staffing or maintenance remains. |


## 5.2 State Priority

Safety-critical states override normal production. A breached portal, unstable ritual, overheated foundry or damaged mana store enters emergency behaviour before it can continue output.

# 6. Sites, Sources, Ports, Buffers and Functional Markers

## 6.1 Site Bindings

Facilities may require one or more verified world bindings:

- Ore, stone, crystal or long-term resource deposit.
- River flow, water drop or navigable water.
- Wind exposure.
- Fuel route or heat source.
- Mana density or refined mana supply.
- Leyline node/crossing.
- Portal origin and destination anchor.
- Realm-specific atmosphere, gravity, material or hazard protection.
- Safe distance from homes, food, water or public routes.
- Industrial, magical, academic or restricted parcel permissions.

## 6.2 Common Functional Markers

- Entrance and worker/service positions.
- Input inventory and output inventory.
- Power/mana input and optional output.
- Machine/module slots.
- Control, tuning or recipe station.
- Maintenance access and replacement-part storage.
- Safety boundary and emergency shutdown.
- Ventilation, cooling, drainage or waste.
- Loading/logistics sockets.
- Research/teaching markers.
- Ward, ritual, leyline or portal anchors.
- Containment, quarantine or decontamination.
- Secure ownership and restricted access.

## 6.3 Ports and Buffers

Ports are typed and directional. A valid connection records resource/energy type, ownership, capacity, filters, side/direction, state and cross-chunk behaviour. Buffers prevent a single temporary blockage from instantly breaking a network, but they do not create items or energy.

# 7. Mana, Purity, Storage, Conduits and Wards

## 7.1 Physical Mana Chain

Raw Mana Crystal -> Mana Shard -> Mana Dust or Refined Charge -> Rune/Core/Battery -> Conduit/Device -> Service

Mana can also come from approved realm resources, leyline infrastructure or culture-specific methods. All sources declare purity, stability, capacity, risk and accepted uses.

## 7.2 Mana Quality

- Stable/Clean.
- Mixed.
- Impure.
- Unstable.
- Corrupted.
- Forbidden or realm-specific.

Quality can influence efficiency, ritual stability, output quality, corruption risk, maintenance and faction response. The player sees quality bands and causes rather than hidden random failure.

## 7.3 Mana Storage and Transmission

- Storage capacity derives from valid vessels or batteries.
- Charge/discharge rate is separate from total capacity.
- Conduits have throughput, range/loss, ownership and damage.
- Incompatible mana types require separation, purification or stabilisation.
- Networks can prioritise wards, health, industry, portals or emergency reserve.
- Normal overload warns, throttles and shuts down. Unstable/forbidden systems may breach under ignored warnings.

## 7.4 Wards

Ward profiles may protect against creature classes, corruption, weather, intrusion, portal effects or specific magic. Coverage is not universal armour. Each ward declares area, accepted threats, mana cost, counterplay, relay rules and failure state.

# 8. Power Generation, Transmission, Storage and Control

## 8.1 Power Families

| **Family** | **Strength** | **Limitation / Identity** |
|---|---|---|
| Manual / Hand-Crank | Immediate, cheap, controllable and reliable. | Low output and labour demand. |
| Mechanical Water/Wind | Renewable and visible. | Terrain, weather, season and transmission constraints. |
| Fuel / Thermal | Portable and familiar. | Fuel logistics, heat, smoke and waste. |
| Steam / Pressure | Higher sustained industrial output. | Water, pressure, maintenance and safety. |
| Electrical-like / Generator | Flexible distribution where the setting uses it. | Components, transmission and control complexity. |
| Mana | Compact, magical and supports unique devices. | Purity, storage, corruption, specialist and political risk. |
| Leyline | High-capacity regional infrastructure. | Fixed geography, strategic conflict and stabilisation. |
| Dimensional / Realm Fuel | Powerful specialised late-game source. | Hazard, containment, scarcity and realm consequences. |


## 8.2 Common Power Contract

Every source declares:

- Power type and output.
- Fuel/source condition.
- Minimum and maximum safe load.
- Transmission type.
- Storage compatibility.
- Heat, waste, noise or magical side effects.
- Shutdown and overload response.
- Maintenance and operator requirements.
- Ownership and priority permissions.

## 8.3 Mixed Networks

Mechanical, industrial and mana networks may interact through converter or hybrid devices, but one energy type should not silently power every consumer. Conversion has efficiency, cost, capacity and risk.

# 9. Machines, Recipes, Throughput and Automation

- Machines use the shared Recipe Registry and add time, batch size, power, buffers, ports, modules, maintenance and risk.
- Simple machines can auto-configure common input/output sides. Advanced machines expose side/port controls.
- A blocked output normally fills an internal buffer and pauses safely.
- Batching is recipe- and machine-specific.
- Quality can be affected by material quality, station quality, specialist skill, maintenance and magic.
- Machine upgrades include speed, efficiency, quality, filter, power, durability, range, safety, stability and rune slots.
- Automation supports NPC labour: it reduces repetitive hauling and processing, creates operators/engineers and stabilises supply. It does not remove builders, farmers, miners, mages, merchants or maintainers.
- Distant production uses the same input/output transaction totals as visible production.

# 10. Industry, Heat, Pressure, Waste and Environment

Industrial facilities can generate:

- Heat and fire risk.
- Pressure and explosion risk.
- Smoke, ash, dust or fumes.
- Slag, scrap, polluted water or hazardous residue.
- Noise and creature attraction.
- Land damage, subsidence or over-extraction.
- Mana leakage, corruption or dimensional residue.
- High strategic value and raid/sabotage pressure.

These effects are configurable and must have counterplay: filters, cooling, maintenance, safer recipes, distance, containment, recycling, wards, specialist staffing and shutdown. Not every machine needs pollution, and normal infrastructure should not constantly fail for flavour.

# 11. Specialists, NPC Labour, Golems and Social Consequences

## 11.1 Specialist Families

- Miner and extraction engineer.
- Metallurgist, foundry worker and smith.
- Machinist, mechanic and power engineer.
- Operator, dispatcher and maintenance worker.
- Mage, rune specialist, warder and mana technician.
- Alchemist, healer and cleansing practitioner.
- Ritualist and culture/religious specialist.
- Magical researcher, leyline scholar and portal keeper.
- Dimensional scholar and containment specialist.
- Golemancer/controller.

## 11.2 Staffing Rules

Skill affects speed, quality, waste, stability, teaching and emergency response. Low skill should usually reduce efficiency rather than cause arbitrary catastrophe. Critical facilities can require minimum specialist coverage.

## 11.3 Golems

Golems use task profiles, inventories, charge/fuel, allowed zones, ownership, priorities and emergency shutdown. They are specialised workers, not universally superior villagers. Culture, law, employment, religion, scarcity and player behaviour affect acceptance.

Forbidden labour branches - necromantic workers, blood engines, corruption constructs or forced labour - require explicit law, morality, fear, rebellion and faction consequences and are mainly culture/faction branches in 20G.

# 12. Knowledge, Research, Laws, Ownership and Forbidden Paths

## 12.1 Knowledge Gates

Buildings and recipes may require:

- NPC teaching.
- Books, ruins or research notes.
- Experimentation.
- Faction trust or trade.
- Boss or event outcomes.
- Culture traditions.
- Realm discoveries.
- Settlement stage and specialist institutions.

Level alone does not grant every magical or industrial capability.

## 12.2 Ownership and Authority

Facilities support personal, household, workplace, settlement, guild, faction, government, shared multiplayer and restricted ownership. Networks and outputs cannot bypass permissions. Public wards and grids may use civic priorities; private facilities may require contracts or fees.

## 12.3 Laws and Forbidden Systems

Settlements can regulate:

- Hazardous industry near homes or water.
- Mana storage and portal operation.
- Summoning and realm contact.
- Blood, necromantic, shadow, corruption or void practices.
- Golem labour and constructed beings.
- Strategic resource extraction.
- Weapon and siege production.
- Environmental damage and waste.

Illegal operation can create witnesses, investigation, fines, closure, confiscation, fear, faction anger, sabotage or rebellion rather than merely a red UI icon.

# 13. Portals, Dimensions, Realm Materials and Containment

- A portal binds to persistent origin and destination anchors. It is not a generic teleport effect.
- Destination state matters: danger, ownership, weather, siege, corruption, unloaded simulation and route closure.
- Portal stations require arrival clearance, permissions, energy, stabilisation, cooldown and emergency shutdown.
- Freight transfers preserve ownership and exact inventory quantities.
- Realm materials may require cleansing, cooling, binding, purification, shielding or quarantine before ordinary use.
- Major dimensions have their own societies, resources, hazards and infrastructure. 20E structures connect them to settlements without replacing the full Dimension System.
- Containment facilities separate intake, study, storage, decontamination and emergency response.
- Full dimensional research and portal networks are late-game conditional systems, not required for ordinary villages.

# 14. Risk, Maintenance, Failure and Recovery

## 14.1 Risk Families

- Mechanical entanglement or impact.
- Heat, fire, pressure and explosion.
- Fuel shortage or toxic output.
- Power overload and transmission damage.
- Mana impurity, overcharge or corruption.
- Ward interference or breach.
- Ritual interruption or unstable result.
- Portal misalignment or destination hazard.
- Dimensional contamination or creature breach.
- Golem control failure or sabotage.
- Theft of strategic resources.
- Social unrest, labour displacement and faction conflict.

## 14.2 Fair Failure Rule

Under normal settings, systems provide visible warning, throttling, buffer use and safe shutdown before severe damage. Catastrophic outcomes require unstable designs, ignored warnings, forbidden resources, attack, disaster or harsher world settings.

## 14.3 Recovery Options

- Shut down and isolate.
- Reroute power/mana or logistics.
- Use stored reserve.
- Repair or replace component.
- Purify or cleanse stock.
- Quarantine workers/materials.
- Retune runes or wards.
- Close destination.
- Evacuate and contain.
- Rebuild, downgrade or convert.
- Investigate sabotage or law breach.

# 15. NPC Planner and Project Selection

The settlement planner evaluates whether a 20E project creates more benefit than cost, risk and maintenance.

## 15.1 Scoring Factors

- Stage capability gap.
- Verified demand and shortage.
- Resource node or terrain opportunity.
- Existing power/mana availability.
- Logistics and warehouse capacity.
- Required specialist and succession.
- Knowledge/research unlock.
- Threat and defence need.
- Health/corruption pressure.
- Trade or faction opportunity.
- Construction resources and labour.
- Maintenance and fuel burden.
- Environmental and social risk.
- Culture preference or prohibition.
- Player/faction priority.
- Existing duplicate capacity.
- Future district or regional plan.

## 15.2 Typical Planner Triggers

| **Problem / Opportunity** | **Likely Response** |
|---|---|
| Repeated demand for mana, runes or magical repairs | Mage Hut, Mana Store or Rune Forge. |
| Magical attacks or corruption | Ward Relay, Cleansing Shrine or containment project. |
| Ore demand exceeds hand processing | Furnace, Foundry or automated extraction. |
| Machines frequently lack power | Water/Wind House, Steam Plant, storage or grid upgrade. |
| Repetitive processing consumes too much labour | Mechanical Processing Mill or Factory. |
| City hauling and sorting are blocked | Logistics Hub or Distribution Centre link. |
| Food demand and climate/land limits grow | Automated Farm or Greenhouse. |
| Specialist knowledge is being lost | Magic Academy, Machine Workshop or research institution. |
| Stable realm access creates trade/story opportunity | Portal Station or Dimensional Facility. |
| Labour shortage with accepted law/culture | Golem Workshop or targeted automation. |
| Multiple networks compete and cascade-fail | Regional Grid Control. |


# 16. Player Blueprint and Network Validation

## 16.1 Shared Validation

- Stable definition and blueprint ID.
- Valid footprint, height, stages and material tokens.
- Reachable public/staff entrances and work positions.
- Required source/world binding.
- Input/output inventories and typed ports.
- Buffers, controls, maintenance and shutdown.
- Safety/containment and emergency access.
- Ownership, public/private circulation and law tags.
- Damage, repair and upgrade anchors.
- No capacity from decorative components.
- Multiplayer and save-safe deterministic state.

## 16.2 Category Validation

| **Category** | **Additional Checks** |
|---|---|
| Extraction | Real node binding, reserve/depletion, safe work face, supports, output staging and hazard zone. |
| Industry | Complete material/energy flow, heat/ventilation/cooling, waste, loading, maintenance and worker separation. |
| Power | Valid source, transmission, output, controls, safe load, relief/shutdown and storage compatibility. |
| Mana/Wards | Accepted mana/purity, storage/conduit, rune/anchor geometry, coverage, cost, counterplay and containment. |
| Ritual | Geometry, anchors, participant access, catalysts, world conditions, failure profile and forbidden flags. |
| Portal | Origin/destination binding, arrival volume, cooldown, stabilisation, security, freight ownership and emergency closure. |
| Golem | Assembly/charge, construct types, control, allowed zones, task limits, ownership, shutdown and social/legal status. |
| Dimensional | Hazard profile, independent containment, decontamination, redundant utilities, emergency response and persistent breach. |

| **Validation Principle** |
|---|
| Player creativity controls form and style. Validation protects function, resource conservation, access, safety, ownership, world persistence and counterplay - not one official architectural layout. |


# 17. Construction, Upgrade, Conversion and Replacement

## 17.1 Construction Stages

Typical 20E projects use:

1. Survey, research and site reservation.
2. Foundations, shielding or source access.
3. Structural shell and heavy supports.
4. Machines, anchors, frames or workstations.
5. Inputs, outputs, storage and logistics.
6. Power/mana, controls and transmission.
7. Cooling, ventilation, waste, wards or containment.
8. Specialist spaces, teaching or public service.
9. Testing, tuning and safe commissioning.
10. Optional efficiency, prestige or advanced branch.

Complex facilities and regional networks use independent subprojects so partial useful capacity can activate before full completion.

## 17.2 Upgrade Families

- Capacity and throughput.
- Efficiency and yield.
- Quality and precision.
- Power type or hybrid conversion.
- Storage and buffer.
- Automation and logistics.
- Safety, stability and containment.
- Research and recipe family.
- Ward, rune or mana integration.
- Realm adaptation.
- Labour/golem support.
- Environmental mitigation.

## 17.3 Conversion

Conversions preserve built history, owned stock and active reservations where compatible. Examples include basic furnace -> mana furnace, smithy -> rune forge, watermill -> powered processing mill, warehouse link -> logistics hub, academy -> portal faculty, and power station -> regional grid source.

# 18. Settlement-Stage Expectations

| **Stage** | **Expected 20E Capability** | **Typical / Conditional Projects** | **Not Required Yet** |
|---|---|---|---|
| Camp | Discovery, salvage and hand tools only. | Temporary magical clue or manual device. | No permanent 20E building is required. |
| Hamlet | Simple processing and optional local practitioner. | Basic furnace, hand mechanism or culture-specific magic contact. | No grid, factory, portal or academy. |
| Village | First stable specialist services and local power/processing. | Mage Hut, Furnace, Water/Wind House, Mechanical Workshop, Mana Mine if conditions fit. | Every village does not need magic or automation. |
| Fortified Village | Resilient supply, repair and protective infrastructure. | Ward Relay, Mana Store, protected furnace, redundant power, machine repairs. | Full town industry remains optional. |
| Town | Specialised industry, research and utility branches. | Foundry, Machine Workshop, Rune Forge, Ritual Hall, Steam Plant, Logistics Hub, Automated Farm. | Portal and leyline networks remain conditional. |
| City | Advanced research, factories, portals, golems and high-capacity networks. | Magic Academy, Leyline Relay, Portal Station, Automated Factory, Golem Centre. | Regional control is not required without multiple networks. |
| Capital | Regional coordination, realm safety and strategic infrastructure. | Dimensional Facility, Regional Grid Control and 20F capital complexes. | One universal magic/industry form is not mandated. |
| Magical Metropolis | World-shaping magitech, realm logistics and civilisation-scale networks. | 20E systems connected to 20F portal, ward, floating and leyline megaprojects. | This remains an endgame sandbox state, not a mandatory ending. |


# 19. Detailed Registry Summary

| **No.** | **Stable ID** | **Definition** | **Earliest Stage** | **Primary Need** | **Project Class** | **Status** |
|---:|---|---|---|---|---|---|
| 39 | building.extraction.mana_crystal_site | Mana Crystal Mine or Extractor | Village | Work | Conditional | Alpha |
| 40 | building.extraction.automated_mine_quarry | Automated Mine or Quarry Site | Town | Work | Conditional | Beta |
| 48 | building.industry.foundry_steelworks | Foundry or Steelworks | Town | Work | Optional | Beta |
| 49 | building.industry.machine_workshop | Machine Workshop | Town | Work | Optional | Beta |
| 50 | building.magic.rune_forge | Rune Forge or Enchanted Smithy | Town | Work | Conditional | Beta |
| 91 | building.magic.mage_hut_rune_workshop | Mage Hut or Rune Workshop | Village | Work | Conditional | POC Required |
| 92 | building.magic.alchemy_laboratory | Alchemy Laboratory | Village | Work | Conditional | Alpha |
| 93 | project.magic.ward_stone_relay | Ward Stone or Defence Relay | Village | Safety | Conditional | Alpha |
| 94 | building.magic.mana_store_battery | Mana Store or Battery House | Village | Infrastructure | Conditional | Alpha |
| 95 | building.magic.ritual_circle_hall | Ritual Circle or Hall | Town | Morale | Conditional | Beta |
| 96 | building.magic.magic_academy_tower | Magic Academy or Research Tower | City | Work | Conditional | Beta |
| 97 | building.magic.healing_cleansing_shrine | Healing or Cleansing Shrine | Town | Health | Conditional | Beta |
| 98 | building.magic.leyline_observatory_relay | Leyline Observatory or Relay | City | Infrastructure | Conditional | Beta |
| 99 | building.magic.portal_station_sanctum | Portal Station or Sanctum | City | Infrastructure | Conditional | Beta |
| 100 | building.magic.dimensional_research_containment | Dimensional Research and Containment Facility | Capital | Safety | Conditional | Final |
| 101 | building.automation.hand_crank_workshop | Hand-Crank or Mechanical Workshop | Village | Work | Optional | Alpha |
| 102 | building.power.waterwind_power_house | Waterwheel or Wind Power House | Village | Infrastructure | Conditional | Alpha |
| 103 | building.industry.furnace_mana_furnace | Furnace or Mana Furnace Facility | Village | Work | Conditional | Alpha |
| 104 | building.automation.mechanical_processing_mill | Mechanical Processing Mill | Village | Work | Optional | Alpha |
| 105 | building.logistics.conveyor_cart_hub | Conveyor or Cart Logistics Hub | Town | Infrastructure | Optional | Beta |
| 106 | building.power.steam_generator_plant | Steam or Generator Plant | Town | Infrastructure | Optional | Beta |
| 107 | building.automation.automated_farm_greenhouse | Automated Farm or Greenhouse | Town | Provisions | Optional | Beta |
| 108 | building.industry.automated_factory_assembly | Automated Factory or Assembly Hall | City | Work | Optional | Beta |
| 109 | building.automation.golem_workshop_labour_centre | Golem Workshop or Labour Centre | City | Work | Conditional | Beta |
| 110 | building.power.regional_grid_control | Regional Power or Mana Grid Control | Capital | Infrastructure | Megaproject | Final |


# 20. Magical Extraction and Advanced Industry Entries

### 39. Mana Crystal Mine or Extractor

building.extraction.mana_crystal_site

| **Field** | **Definition** |
|---|---|
| **Catalogue role** | Extraction / Magical Resource / Village / Complex / Conditional / Alpha |
| **Need contribution** | Primary: Work / Secondary: Safety, Infrastructure |
| **Purpose** | Extracts raw mana crystal or related magical deposits while preserving purity, controlling instability and exposing the resource as a physical civilisation input rather than an abstract currency. |
| **Capacity / service** | Draft yield is determined by the bound deposit, grade, purity, extraction method, staffing, tools, power, stabilisation and safe output capacity. Hand-mined veins and long-term extraction nodes use the same resource-conservation rules. |
| **Jobs and users** | Miner, crystal cutter, rune specialist, safety warden, hauler, engineer, surveyor and guard where the deposit attracts threats. |
| **Inputs** | Mining tools, supports, containers, light, stabilising runes, repair stock, optional mechanical or mana power and any realm-specific protective supplies. |
| **Outputs / services** | Raw mana crystal, shards, dust-bearing fragments, stone by-products, purity data, unstable residue and occasional rare catalysts according to the resource definition. |
| **Required blueprint markers** | Bound resource node, extraction face, safe work positions, support/inspection points, output staging, purity test point, hazard boundary, loading socket and optional power/mana ports. |
| **Placement and utilities** | Requires a verified magical deposit and safe route. Placement must account for cave support, mana leakage, creature attraction, water, corruption, settlement distance and future extraction footprint. |
| **Construction profile** | 6-8 stages: survey and claim; safe access; supports and work face; staging/storage; stabilisation and power; inspection; optional expansion modules. |
| **Upgrade and branch links** | Crystal Mine Office, Stabilised Extractor, Automated Mana Mine, Purification Annex, Deep Crystal Works or realm-specific extraction branch. |
| **Planner triggers and failure states** | Selected when a known deposit, mage specialist and sustained mana demand justify the risk. It pauses or degrades when the node is exhausted, unsupported, contaminated, inaccessible, overloaded or legally restricted. |
| **Player-blueprint validation** | Must bind to a real deposit, expose reachable extraction and output markers, preserve exact yield, define hazard/stabilisation zones and prevent decorative crystals from granting production. |
| **Culture, biome and realm variation** | Surface crystal quarry, cavern lattice mine, dwarven resonance shaft, fae harvesting grove, desert geode works, floating shard platform or warded voidstone excavation. |


### 40. Automated Mine or Quarry Site

building.extraction.automated_mine_quarry

| **Field** | **Definition** |
|---|---|
| **Catalogue role** | Extraction / Automation / Town / Complex / Conditional / Beta |
| **Need contribution** | Primary: Work / Secondary: Infrastructure, Safety |
| **Purpose** | Scales bulk extraction from a verified long-term deposit using powered machinery, logistics and specialist maintenance without creating infinite resources or deleting the need for NPC oversight. |
| **Capacity / service** | Draft throughput depends on deposit reserve, machine heads, power, maintenance, output buffers, route capacity, worker supervision and environmental constraints. |
| **Jobs and users** | Mining engineer, machine operator, mechanic, surveyor, hauler, safety inspector, power worker and guards. |
| **Inputs** | Power, machine components, extraction heads, lubricants or magical equivalents, supports, replacement parts, tools, filters and route capacity. |
| **Outputs / services** | Bulk raw ore/stone, graded material, by-products, waste, dust/slag precursors, survey depletion data and optional rare finds. |
| **Required blueprint markers** | Deposit binding, extraction modules, machine clearance, power input, control station, maintenance bay, input/output buffers, waste zone, loading network and emergency shutdown. |
| **Placement and utilities** | Requires a large deposit or quarry zone, heavy access and safe separation from housing. Noise, pollution, subsidence, corruption and faction claims affect suitability. |
| **Construction profile** | 8-10 stages, with a manual or low-power extraction phase activating before full machines, sorting and heavy logistics. |
| **Upgrade and branch links** | Deep Automated Mine, Precision Quarry, Arcane Extractor, Regional Mining Complex or dimensional resource branch. |
| **Planner triggers and failure states** | Selected when manual extraction cannot meet verified demand and the settlement has power, maintenance and safe logistics. It pauses on depleted reserve, no power, blocked output or unsafe instability. |
| **Player-blueprint validation** | Must bind to a finite or regenerating resource record, prove machine clearance, power, control, maintenance, output and waste routes, and preserve depletion across save/load and LOD. |
| **Culture, biome and realm variation** | Steam quarry, rail mine, water-powered cutting works, golem excavation yard, rune-bore mine, underground industrial complex or floating extraction rig. |


### 48. Foundry or Steelworks

building.industry.foundry_steelworks

| **Field** | **Definition** |
|---|---|
| **Catalogue role** | Industry / Metal Processing / Town / Large / Optional / Beta |
| **Need contribution** | Primary: Work / Secondary: Infrastructure, Safety |
| **Purpose** | Processes large metal batches, alloys and heavy structural components for town industry, fortifications, machines, rails and civilisation-scale projects. |
| **Capacity / service** | Draft batch and throughput values depend on furnaces, heat source, fuel/power, material quality, ventilation, staffing, moulds, cooling and output storage. |
| **Jobs and users** | Metallurgist, foundry worker, blacksmith, furnace operator, engineer, hauler, inspector and fire/safety crew. |
| **Inputs** | Ore or ingots, coal/charcoal or other heat source, fluxes, alloy materials, moulds, water/cooling, tools, power and repair components. |
| **Outputs / services** | Ingots, plates, beams, machine frames, rails, cast parts, slag, heat, smoke and recoverable by-products. |
| **Required blueprint markers** | Furnace line, crucible/pour stations, mould floor, fuel/power input, ventilation, cooling, material buffers, slag/waste zone, loading, maintenance and emergency shutoff. |
| **Placement and utilities** | Industrial district with heavy roads, water/cooling or equivalent, strong fire separation and room for waste/expansion. It should not be embedded in dense housing without advanced safeguards. |
| **Construction profile** | 8-10 stages: heavy foundations; shell and chimneys; furnace/casting line; power/fuel; cooling/ventilation; buffers; safety; activation. |
| **Upgrade and branch links** | Steelworks, Precision Foundry, Automated Foundry, Arcane Alloy Works, Mythril Forge Annex or regional industrial complex. |
| **Planner triggers and failure states** | Selected when metal demand, machine production, defence or megaprojects exceed village smithy capacity. Output pauses safely when buffers, cooling, fuel or staffing fail. |
| **Player-blueprint validation** | Must prove complete heat/material flow, safe worker circulation, ventilation/cooling, waste handling, maintenance access and authoritative batch transactions. |
| **Culture, biome and realm variation** | Open charcoal foundry, dwarven deep forge, water-cooled riverside works, steam steelworks, lava-assisted forge or mana-stabilised alloy hall. |


### 49. Machine Workshop

building.industry.machine_workshop

| **Field** | **Definition** |
|---|---|
| **Catalogue role** | Industry / Engineering / Town / Medium / Optional / Beta |
| **Need contribution** | Primary: Work / Secondary: Infrastructure |
| **Purpose** | Builds, repairs and upgrades machine components, power parts, transport modules and automation systems while supporting NPC engineers and maintenance crews. |
| **Capacity / service** | Draft assembly slots, repair queues and quality are determined by benches, tooling, specialist skill, component stock, power, precision and maintenance. |
| **Jobs and users** | Engineer, machinist, mechanic, toolmaker, drafter, rune technician where applicable, apprentice and storekeeper. |
| **Inputs** | Frames, gears, plates, rods, belts, pipes, coils, filters, tools, lubricants, fasteners, power and blueprint/research knowledge. |
| **Outputs / services** | Machine assemblies, replacement parts, upgrades, repair services, calibration, maintenance kits and engineering knowledge. |
| **Required blueprint markers** | Assembly benches, precision tools, parts storage, test area, power ports, maintenance pit, input/output buffers, design station and safe machine clearance. |
| **Placement and utilities** | Connected to industry and logistics but accessible to village repair crews. Noise and heavy testing require separation from homes unless culturally adapted. |
| **Construction profile** | 6-8 stages: shell; benches/storage; tooling; power/test zone; safety; specialist activation; optional annexes. |
| **Upgrade and branch links** | Engineering Hall, Precision Machine Shop, Magitech Workshop, Golem Component Annex or Factory Design Office. |
| **Planner triggers and failure states** | Selected when the settlement owns several machines, suffers repair delays or unlocks advanced automation. It underperforms without specialist skill, precision tools, power or component stock. |
| **Player-blueprint validation** | Must contain reachable work and test markers, real component buffers, maintenance access, declared power needs and safe clearance for the largest supported assembly. |
| **Culture, biome and realm variation** | Clockwork shop, dwarven machinist hall, water-driven engineering house, rune-engineering atelier, nomad repair caravan or city machine laboratory. |


### 50. Rune Forge or Enchanted Smithy

building.magic.rune_forge

| **Field** | **Definition** |
|---|---|
| **Catalogue role** | Magic / Enchanted Production / Town / Medium / Conditional / Beta |
| **Need contribution** | Primary: Work / Secondary: Safety, Infrastructure |
| **Purpose** | Combines smithing, rune inscription, mana control and specialist knowledge to create enchanted tools, gear, conduits, ward parts and magitech components. |
| **Capacity / service** | Draft inscription and forging capacity depends on forge quality, rune stations, mana purity, specialist skill, stabilisation, item quality and safe output storage. |
| **Jobs and users** | Rune smith, enchanter, blacksmith, mana technician, researcher, apprentice and safety warden. |
| **Inputs** | Metal items/components, runes, mana dust/crystals, catalysts, fuel or heat, enchantment knowledge, tools and stabilisation materials. |
| **Outputs / services** | Enchanted gear, machine runes, ward components, conduits, rune plates, repaired magical items, residue and occasional failed/junk outputs under risky recipes. |
| **Required blueprint markers** | Forge/anvil, rune table, mana input/store, inscription station, cooling/stabilisation, protected test zone, input/output storage, ward link and emergency shutdown. |
| **Placement and utilities** | Town artisan or magical district with road, fuel/heat, mana and safe separation. Forbidden enchantments may require restricted ownership and law checks. |
| **Construction profile** | 7-9 stages, with mundane smithing usable before mana systems, rune stations and advanced enchantment activate. |
| **Upgrade and branch links** | Arcane Alloy Forge, Mythril Rune Forge, Culture-Specific Enchanted Smithy, Forbidden Forge or city magitech works. |
| **Planner triggers and failure states** | Selected when a trained specialist, rune knowledge, mana supply and demand for enchanted equipment exist. It can shut down on instability, impurity, ward failure or illegal recipe use. |
| **Player-blueprint validation** | Must prove mundane forge safety plus mana flow, rune work zone, stabilisation, protected testing, ownership and recipe/risk declarations. |
| **Culture, biome and realm variation** | Dwarven rune anvil, fae song-forge, desert glyph furnace, celestial smithy, shadow-bound forge or hybrid industrial enchantment hall. |


# 21. Magic, Ritual and Dimensional Entries

### 91. Mage Hut or Rune Workshop

building.magic.mage_hut_rune_workshop

| **Field** | **Definition** |
|---|---|
| **Catalogue role** | Magic / First Settlement Service / Village / Small / Conditional / POC Required |
| **Need contribution** | Primary: Work / Secondary: Safety, Infrastructure, Morale |
| **Purpose** | Provides the first practical village magic service: a named mage, basic rune crafting, mana handling, teaching, magical repairs and support for early wards and automation. |
| **Capacity / service** | Draft one specialist work slot, one teaching/service point, a small protected mana store and limited rune/repair throughput. |
| **Jobs and users** | Village mage, rune specialist or culture-equivalent practitioner; optional apprentice, helper and visiting researcher. |
| **Inputs** | Mana shards/dust, blank rune materials, tools, books/knowledge, catalysts, repair stock and optional ward/conduit components. |
| **Outputs / services** | Basic runes, teaching, mana identification, magical repairs, ward support, recipe unlocks, research hints and community magical services. |
| **Required blueprint markers** | Rune table, small mana store, safe work zone, teaching point, input/output storage, mage job marker, public service point and optional conduit/ward sockets. |
| **Placement and utilities** | Reachable from warehouse, hall and watchtower while keeping a safe buffer from homes if unstable work is performed. Culture and village law determine public access. |
| **Construction profile** | 6 stages: foundation/shell; roof/door; worktable/storage; mana-safe zone; teaching/service markers; inspection and mage activation. |
| **Upgrade and branch links** | Rune Workshop, Alchemy Laboratory, Ward Hall, Mana Engineering Annex, Magic Academy feeder or culture-specific magical house. |
| **Planner triggers and failure states** | Conditional on mage arrival, magical discovery, reputation, culture or player action. It remains dormant without a valid specialist or safe mana stock. |
| **Player-blueprint validation** | Must expose reachable work, teaching and storage markers, real mana inventory, a protected rune zone and explicit risk/permission fields. Decorative books and crystals do not grant service. |
| **Culture, biome and realm variation** | Forest hedge-mage hut, dwarven rune chamber, fae living atelier, desert astrologer house, nomad ritual wagon, village shrine-workshop or subterranean crystal study. |


### 92. Alchemy Laboratory

building.magic.alchemy_laboratory

| **Field** | **Definition** |
|---|---|
| **Catalogue role** | Magic / Alchemy and Medicine / Village / Medium / Conditional / Alpha |
| **Need contribution** | Primary: Work / Secondary: Health, Safety |
| **Purpose** | Processes herbs, monster resources, minerals, essences and mana reagents into medicines, catalysts, preservation agents, utility mixtures and controlled magical compounds. |
| **Capacity / service** | Draft recipe slots, batch size and failure risk depend on benches, vessels, ventilation, ingredient purity, alchemist skill, heat/mana, storage and safety. |
| **Jobs and users** | Alchemist, herbalist, healer liaison, reagent keeper, apprentice and safety assistant. |
| **Inputs** | Herbs, water, monster drops, minerals, essences, containers, fuel/heat, mana, catalysts, filters and recipe knowledge. |
| **Outputs / services** | Medicines, potions, catalysts, solvents, preservation goods, dyes, cleansing agents, by-products, waste and risky failures. |
| **Required blueprint markers** | Alchemy bench, heat/mana source, water point, reagent storage, hazardous store, ventilation, wash/clean-up point, output shelf, waste zone and emergency station. |
| **Placement and utilities** | Near healer or magical services but separated from food and dense housing when hazardous recipes are allowed. Clean water and safe waste handling improve reliability. |
| **Construction profile** | 6-8 stages: shell; benches/water; storage; heat/mana; ventilation/safety; specialist activation; optional containment annex. |
| **Upgrade and branch links** | Advanced Alchemy Lab, Apothecary Laboratory, Industrial Reagent Works, Cleansing Annex or Forbidden Alchemy Cell. |
| **Planner triggers and failure states** | Selected when a trained alchemist, reagent supply and medicine/magic demand exist. Risky recipes may be restricted by law, reputation or world settings. |
| **Player-blueprint validation** | Must separate clean, reagent, hazardous and waste functions; declare recipe risks; provide ventilation/wash access and prevent invalid decorative vessels from creating capacity. |
| **Culture, biome and realm variation** | Herbal cottage lab, stone apothecary, fungal alchemy room, fae distillation garden, industrial chemical hall or warded occult laboratory. |


### 93. Ward Stone or Defence Relay

project.magic.ward_stone_relay

| **Field** | **Definition** |
|---|---|
| **Catalogue role** | Magic / Protective Network / Village / Network / Conditional / Alpha |
| **Need contribution** | Primary: Safety / Secondary: Infrastructure |
| **Purpose** | Creates local protective, warning, cleansing or deterrent coverage through a physical ward anchor connected to mana, runes, settlement permissions and defence systems. |
| **Capacity / service** | Draft radius or route coverage depends on anchor quality, rune pattern, mana supply, terrain, obstructions, linked relays, specialist tuning and active threat category. |
| **Jobs and users** | Warder, village mage, rune technician, guard liaison and maintenance worker. |
| **Inputs** | Ward stone/frame, runes, mana, stabilisers, repair materials, tuning tools and optional signal or watchtower link. |
| **Outputs / services** | Ward coverage, threat warning, creature deterrence, corruption resistance, protected routes or structure shielding according to the ward profile. |
| **Required blueprint markers** | Ward anchor, mana input/store, rune/control point, coverage origin, relay sockets, maintenance access, protected boundary and optional alarm/defence links. |
| **Placement and utilities** | At gates, watchtowers, roads, shrines, warehouses, farms or district boundaries according to the coverage profile. Overlapping wards can provide redundancy or interference. |
| **Construction profile** | 4-6 stages per anchor: foundation; stone/frame; rune installation; mana connection; tuning; activation. |
| **Upgrade and branch links** | Linked Relay, Ward Tower, District Ward, Anti-Corruption Barrier, Portal Ward or City Shield component owned partly by 20F. |
| **Planner triggers and failure states** | Selected after repeated magical/creature threats, corruption exposure or cultural ritual demand. It becomes dormant when mana is empty, runes are damaged or ownership changes. |
| **Player-blueprint validation** | Must define ward profile, coverage, exclusions, mana cost, relay connection, public/hostile ownership and counterplay. Decorative glowing stones provide no protection. |
| **Culture, biome and realm variation** | Runed monolith, lantern relay, shrine ward, carved gate seal, living tree ward, crystal pylon or subterranean resonance anchor. |


### 94. Mana Store or Battery House

building.magic.mana_store_battery

| **Field** | **Definition** |
|---|---|
| **Catalogue role** | Magic / Energy Storage / Village / Small/Medium / Conditional / Alpha |
| **Need contribution** | Primary: Infrastructure / Secondary: Safety, Work |
| **Purpose** | Stores refined mana safely, buffers unstable supply and distributes bounded energy to workshops, wards, furnaces, lights and emergency systems. |
| **Capacity / service** | Draft storage, charge/discharge and purity limits derive from valid batteries/vessels, containment, conduits, controls, condition and specialist oversight. |
| **Jobs and users** | Mana keeper, rune technician, engineer, warder, inspector and guard for valuable stock. |
| **Inputs** | Mana crystals/shards/dust or other accepted fuel, battery vessels, runes, stabilisers, cooling/containment, maintenance parts and permissions. |
| **Outputs / services** | Buffered mana, emergency reserve, network smoothing, purity separation, controlled discharge and charge/usage records. |
| **Required blueprint markers** | Mana storage units, intake, output conduits, control/tuning point, purity zones, containment, vent/relief, maintenance aisle, secure access and emergency shutdown. |
| **Placement and utilities** | Near consumers but separated from homes and flammable stock according to storage tier. High-value or unstable stores require security and ward coverage. |
| **Construction profile** | 5-7 stages: shell/containment; storage vessels; controls; intake/output; safety; inspection; optional network expansion. |
| **Upgrade and branch links** | Arcane Battery House, District Mana Vault, Leyline Buffer, Portal Reserve or hybrid grid storage. |
| **Planner triggers and failure states** | Selected when intermittent mana supply, wards or machines need reliable power. It degrades with impurity, overcharge, damaged containment, theft or incompatible fuels. |
| **Player-blueprint validation** | Must count only valid storage units, declare accepted mana types/purity, prove controlled intake/output, containment, shutdown and ownership. Empty crystal decorations do not add capacity. |
| **Culture, biome and realm variation** | Crystal vault, rune-cellar, fae reservoir, dwarven capacitor hall, water-cooled mana house, floating battery shrine or protected city substation. |


### 95. Ritual Circle or Hall

building.magic.ritual_circle_hall

| **Field** | **Definition** |
|---|---|
| **Catalogue role** | Magic / Ritual and Community / Town / Medium/Large / Conditional / Beta |
| **Need contribution** | Primary: Morale / Secondary: Safety, Work |
| **Purpose** | Supports staged communal or specialist rituals affecting weather, protection, cleansing, summoning, research, culture, story events and world-state change. |
| **Capacity / service** | Draft participant slots, ritual scale, stability and cooldown depend on circle geometry, anchors, mana, catalysts, leader skill, assistants, site conditions and permissions. |
| **Jobs and users** | Ritual leader, mage, assistants, culture/religious specialist, warder, musicians or participants according to ritual profile. |
| **Inputs** | Mana, catalysts, offerings or components, prepared runes, participants, knowledge, time and environmental conditions. |
| **Outputs / services** | Ritual effects, buffs, cleansing, weather or story outcomes, realm contact, community morale, risk and persistent world evidence. |
| **Required blueprint markers** | Primary circle, anchor points, participant positions, leader point, catalyst/offerings, mana input, public boundary, observation/safety zone and emergency break. |
| **Placement and utilities** | May require leyline, shrine, open sky, underground chamber, water, cultural district or safe distance depending on ritual family. |
| **Construction profile** | 6-9 stages: site preparation; circle/foundation; anchors; participant/public space; mana/safety; cultural finish; attunement and activation. |
| **Upgrade and branch links** | Grand Ritual Hall, Weather Circle, Cleansing Sanctuary, Summoning Hall, Realm Gate Ritual Site or culture-specific ceremonial complex. |
| **Planner triggers and failure states** | Selected by culture, story, threat, research or major event. It should not run automatically without a valid ritual project, resources and participants. |
| **Player-blueprint validation** | Must validate geometry/anchors, participant access, mana/catalysts, ritual profile, public safety, failure consequences and forbidden flags. |
| **Culture, biome and realm variation** | Open stone circle, temple hall, grove ritual, desert star court, cavern resonance chamber, floating sigil platform or ancestral amphitheatre. |


### 96. Magic Academy or Research Tower

building.magic.magic_academy_tower

| **Field** | **Definition** |
|---|---|
| **Catalogue role** | Magic / Education and Research / City / Large / Conditional / Beta |
| **Need contribution** | Primary: Work / Secondary: Morale, Infrastructure |
| **Purpose** | Trains advanced magical specialists, coordinates research, preserves spell knowledge and supports city-scale rune, ward, portal and magitech progression. |
| **Capacity / service** | Draft teaching, research and specialist slots depend on classrooms/labs, library access, faculty, mana, safety, housing links and research equipment. |
| **Jobs and users** | Master mage, school specialists, researchers, librarians, rune engineers, apprentices, warders, custodians and guards. |
| **Inputs** | Books/research, mana, reagents, artefacts, teaching supplies, specialist staff, maintenance, security and project funding. |
| **Outputs / services** | Trained specialists, research progress, recipes/spells, portal/leyline knowledge, teaching services, artefact analysis and story unlocks. |
| **Required blueprint markers** | Classrooms, research stations, library/archive, mana network, safe practice zones, faculty points, student points, restricted stores, public service desk and emergency containment. |
| **Placement and utilities** | City academic or magical district with resilient access, mana supply, fire/ward protection and separation between public teaching and hazardous research. |
| **Construction profile** | 9-12 stages, with basic teaching and library functions activating before advanced laboratories and towers. |
| **Upgrade and branch links** | Grand Academy, School-Specific College, Arcane University, Observatory Annex, Portal Faculty or dimensional institute. |
| **Planner triggers and failure states** | Selected when city population, specialists, research demand, culture and mana infrastructure support it. It loses output when faculty, archives, mana or safety fail. |
| **Player-blueprint validation** | Must prove teaching/research capacity, controlled practice areas, library/knowledge storage, staff/student access, mana and emergency separation. |
| **Culture, biome and realm variation** | Wizard tower campus, dwarven rune college, fae memory grove, desert observatory school, floating academy or underground crystal university. |


### 97. Healing or Cleansing Shrine

building.magic.healing_cleansing_shrine

| **Field** | **Definition** |
|---|---|
| **Catalogue role** | Magic / Health and Recovery / Town / Medium / Conditional / Beta |
| **Need contribution** | Primary: Health / Secondary: Morale, Safety |
| **Purpose** | Provides magical healing support, corruption cleansing, curse stabilisation and recovery services that complement rather than replace mundane healers and hospitals. |
| **Capacity / service** | Draft treatment slots, cleansing strength and recovery rate depend on healer/practitioner skill, mana, purity, beds/ritual points, medicine and contamination controls. |
| **Jobs and users** | Healing mage, priest/culture practitioner, healer, alchemist liaison, warder, attendant and cleaner. |
| **Inputs** | Mana, medicines, cleansing reagents, ritual components, clean water, linens, knowledge and protective supplies. |
| **Outputs / services** | Healing support, corruption reduction, curse stabilisation, recovery buffs, morale, diagnosis and magical incident response. |
| **Required blueprint markers** | Treatment/recovery points, cleansing circle, mana input, clean store, contaminated intake, practitioner station, public waiting, isolation and waste/ritual disposal. |
| **Placement and utilities** | Near health services and public access but with isolation for corruption or curse cases. Water quality, ward protection and emergency route matter. |
| **Construction profile** | 6-8 stages: shell/sanctuary; treatment space; mana/cleansing; clean/contaminated separation; staff; activation. |
| **Upgrade and branch links** | Cleansing Hospital Wing, Regional Sanctuary, Anti-Corruption Centre, Spirit Healing House or realm-specific recovery facility. |
| **Planner triggers and failure states** | Selected after magical injuries, corruption exposure, cultural demand or story events. It cannot solve every illness and may require rare reagents or cooldowns. |
| **Player-blueprint validation** | Must separate clean and contaminated flows, expose valid treatment points, declare supported conditions, mana cost, practitioner requirements and failure limits. |
| **Culture, biome and realm variation** | Light shrine, nature healing grove, rune clinic, ancestral spirit house, crystal purification chamber or shadow-cleansing sanctuary. |


### 98. Leyline Observatory or Relay

building.magic.leyline_observatory_relay

| **Field** | **Definition** |
|---|---|
| **Catalogue role** | Magic / Regional Network / City / Large / Conditional / Beta |
| **Need contribution** | Primary: Infrastructure / Secondary: Work, Safety |
| **Purpose** | Maps, measures and stabilises regional mana flows, links high-capacity magical networks and unlocks strategic placement for advanced wards, portals and magitech. |
| **Capacity / service** | Draft sensing range, relay throughput and stabilisation depend on leyline proximity, instruments, altitude/depth, mana quality, specialist staffing, anchors and network condition. |
| **Jobs and users** | Leyline scholar, rune engineer, surveyor, mage, technician, maintenance worker and guard. |
| **Inputs** | Mana instruments, runes, crystals, charts, stabilisers, power/mana, research, maintenance parts and regional access rights. |
| **Outputs / services** | Leyline maps, network relay, stability, forecasting, research, anomaly alerts, regional project unlocks and controlled high-capacity mana transfer. |
| **Required blueprint markers** | Observation instruments, leyline anchor, relay ports, control room, map/research station, stabilisation ring, maintenance access and emergency disconnect. |
| **Placement and utilities** | Requires a valid leyline node, crossing or strong survey location. Terrain, corruption, faction territory and interference determine suitability. |
| **Construction profile** | 8-11 stages: survey; foundation/tower; instruments; anchor; relay; control/research; safety/stabilisation; attunement. |
| **Upgrade and branch links** | Regional Leyline Relay, City Mana Nexus component, Dimensional Resonance Observatory or Leyline Crown subproject through 20F. |
| **Planner triggers and failure states** | Selected after regional mana demand or anomalies justify the cost. It can create political conflict over strategic energy and must not provide infinite free mana. |
| **Player-blueprint validation** | Must bind to a real leyline record, declare sensing/relay profiles, prove control, stabilisation, limits, failure states and network ownership. |
| **Culture, biome and realm variation** | Mountain observatory, underground resonance chamber, forest node shrine, floating crystal spire, desert star-ley tower or dwarven deep relay. |


### 99. Portal Station or Sanctum

building.magic.portal_station_sanctum

| **Field** | **Definition** |
|---|---|
| **Catalogue role** | Magic / Travel and Logistics / City / Large / Conditional / Beta |
| **Need contribution** | Primary: Infrastructure / Secondary: Safety, Work |
| **Purpose** | Anchors controlled portal travel and freight through a physical station with power, destination records, permissions, arrival safety, stabilisation and shutdown. |
| **Capacity / service** | Draft traveller/freight throughput, range and destination count depend on portal frame, anchors, mana, stabilisation, operators, cooldowns, security and destination state. |
| **Jobs and users** | Portal keeper, mage, rune engineer, customs/security staff, logistics operator, maintenance worker and containment specialist. |
| **Inputs** | Mana, portal components, destination key/attunement, stabilisers, permits, maintenance parts, ward power and optional realm fuel. |
| **Outputs / services** | Controlled travel, freight transfer, route connection, realm access, visitor flow, trade and emergency evacuation according to permissions. |
| **Required blueprint markers** | Portal frame, origin anchor, destination control, arrival/departure zones, mana/store, ward ring, customs/security, loading buffer, emergency shutdown and containment boundary. |
| **Placement and utilities** | Major transport or magical district with protected approaches, emergency route, freight handling and safe separation from housing. Destination hazards affect station design. |
| **Construction profile** | 9-12 stages, with station shell and logistics usable before the portal frame is attuned and authorised. |
| **Upgrade and branch links** | Multi-Destination Station, Portal Freight Hub, Realm Embassy Gate, Capital Nexus component or dimensional logistics complex. |
| **Planner triggers and failure states** | Selected after portal knowledge, destination anchor, city infrastructure, political permission and stable mana exist. It closes on destination danger, instability, attack or insufficient power. |
| **Player-blueprint validation** | Must prove frame/anchor geometry, safe arrival volume, destination binding, mana, cooldown, security, freight ownership, shutdown and failure containment. |
| **Culture, biome and realm variation** | Stone gate sanctum, mirror hall, root arch, dwarven ring gate, celestial doorway, shadow threshold or industrial portal terminal. |


### 100. Dimensional Research and Containment Facility

building.magic.dimensional_research_containment

| **Field** | **Definition** |
|---|---|
| **Catalogue role** | Magic / Realm Research and Hazard Control / Capital / Complex / Conditional / Final |
| **Need contribution** | Primary: Safety / Secondary: Work, Infrastructure |
| **Purpose** | Studies realm materials, portals, creatures, anomalies and environmental rules while containing hazardous samples and protecting the capital from dimensional breach. |
| **Capacity / service** | Draft laboratory, sample, chamber and containment capacity depend on specialist staff, ward/power redundancy, isolation cells, realm protections, monitoring and emergency systems. |
| **Jobs and users** | Dimensional scholar, containment mage, engineer, alchemist, creature specialist, healer, guard, archivist and emergency team. |
| **Inputs** | Realm samples, artefacts, mana/power, filters, seals, protective gear, research, maintenance and legal/faction authority. |
| **Outputs / services** | Realm knowledge, stabilised materials, containment services, portal safety, countermeasures, research unlocks, story progression and hazardous waste. |
| **Required blueprint markers** | Secure intake, quarantine, research labs, independent containment cells, redundant wards/power, observation, decontamination, archive, emergency route, lockdown controls and disposal. |
| **Placement and utilities** | Capital or remote strategic complex with strong transport but layered separation from civilians. Realm-specific hazards may require underground, isolated, floating or pocket-space construction. |
| **Construction profile** | 12+ staged subprojects: perimeter; utilities; labs; cells; wards; decontamination; control; archive; emergency systems; commissioning. |
| **Upgrade and branch links** | Realm-Specific Wing, Portal Safety Command, Anti-Breach Bastion, Capital Dimensional Institute or 20F megaproject link. |
| **Planner triggers and failure states** | Selected after stable realm access, repeated anomalies or capital research goals. High maintenance and political risk prevent routine early construction. |
| **Player-blueprint validation** | Must prove independent containment, redundant shutdown, safe circulation, hazard profiles, sample ownership, decontamination, emergency response and persistent breach consequences. |
| **Culture, biome and realm variation** | Arcane research citadel, dwarven sealed vault, celestial observatory lab, void quarantine fortress, dream containment monastery or floating isolation complex. |


# 22. Automation, Power and Advanced Industry Entries

### 101. Hand-Crank or Mechanical Workshop

building.automation.hand_crank_workshop

| **Field** | **Definition** |
|---|---|
| **Catalogue role** | Automation / Entry Mechanisms / Village / Small / Optional / Alpha |
| **Need contribution** | Primary: Work / Secondary: Infrastructure |
| **Purpose** | Introduces manual and simple mechanical power, gears, shafts, chutes and machine maintenance without requiring a full industrial grid. |
| **Capacity / service** | Draft component and power output depends on workstations, cranks, operator stamina/shift abstraction, gearing, tools and maintenance. |
| **Jobs and users** | Mechanic, carpenter/blacksmith liaison, engineer, operator, apprentice and maintenance worker. |
| **Inputs** | Copper/iron parts, wood, gears, shafts, belts, tools, lubricant, fasteners and labour. |
| **Outputs / services** | Simple mechanisms, manual power, chutes, repairs, machine frames, educational demonstrations and early automation components. |
| **Required blueprint markers** | Mechanic bench, crank/shaft test point, parts store, assembly point, output store, tool rack, maintenance area and optional machine port. |
| **Placement and utilities** | Near carpenter/blacksmith and early production with safe moving-part clearance and route access. |
| **Construction profile** | 5-6 stages: shell; benches/storage; crank/shaft; test/safety; specialist activation; optional expansion. |
| **Upgrade and branch links** | Machine Workshop, Powered Mechanism Hall, Water/Wind connection, Rune-Control Annex or mobile repair shop. |
| **Planner triggers and failure states** | Selected when copper mechanisms are unlocked or hauling/processing bottlenecks appear. It remains useful for cheap, reliable and emergency manual systems. |
| **Player-blueprint validation** | Must expose real moving/power markers, safe clearance, parts inventory and bounded output. Decorative gears do not generate power. |
| **Culture, biome and realm variation** | Village tinker shed, dwarven gear room, water-clock workshop, nomad crank cart, fae living mechanism house or rune-assisted mechanic hut. |


### 102. Waterwheel or Wind Power House

building.power.waterwind_power_house

| **Field** | **Definition** |
|---|---|
| **Catalogue role** | Power / Renewable Mechanical / Village / Medium / Conditional / Alpha |
| **Need contribution** | Primary: Infrastructure / Secondary: Work |
| **Purpose** | Provides visible renewable mechanical power from suitable water flow or wind exposure for mills, workshops, pumps and early automation. |
| **Capacity / service** | Draft power output is bounded by source strength, wheel/turbine area, gearing, weather/season, maintenance, transmission loss and obstruction. |
| **Jobs and users** | Miller/power operator, mechanic, engineer, waterway/grounds keeper and maintenance worker. |
| **Inputs** | Valid water or wind source, wheel/sails, shafts/gears, structural materials, lubricant, repair parts and optional storage/buffer mechanisms. |
| **Outputs / services** | Mechanical power, motion, water pumping or direct machine drive, with variable output and source telemetry. |
| **Required blueprint markers** | Source binding, wheel/sail clearance, axle/shaft output, control/brake, maintenance access, transmission socket, safety zone and optional buffer. |
| **Placement and utilities** | Waterwheel requires sufficient flow/drop and bank support; wind power requires exposure and clearance. Both must avoid blocking navigation or protected terrain. |
| **Construction profile** | 6-8 stages: foundations; source structure/tower; wheel/sails; gearing; transmission; control/safety; commissioning. |
| **Upgrade and branch links** | Larger Waterwheel, Windmill Array, Pump House, Mechanical Power Station, Hybrid Mana Assist or district shaft network. |
| **Planner triggers and failure states** | Selected when terrain provides a reliable source and machines need sustained power. Output varies with season/weather and pauses on obstruction or structural damage. |
| **Player-blueprint validation** | Must bind to real water/wind data, prove clearance, direction, power output, brake/shutdown, maintenance and connection. Visual motion without a source produces no power. |
| **Culture, biome and realm variation** | River wheelhouse, undershot/overshot mill, cliff windmill, desert wind tower, cavern water turbine, fae leaf-sail or rune-stabilised renewable house. |


### 103. Furnace or Mana Furnace Facility

building.industry.furnace_mana_furnace

| **Field** | **Definition** |
|---|---|
| **Catalogue role** | Industry / Core Processing / Village / Medium / Conditional / Alpha |
| **Need contribution** | Primary: Work / Secondary: Infrastructure, Safety |
| **Purpose** | Processes ore and materials through a shared furnace family, with mundane fuel first and an optional mana branch proving magical infrastructure in the settlement supply chain. |
| **Capacity / service** | Draft recipe slots, heat, batch size and efficiency depend on furnace modules, fuel/mana, airflow, operator skill, material quality, output buffer and upgrades. |
| **Jobs and users** | Furnace operator, smelter, blacksmith liaison, mana technician for magical branch, hauler and maintenance worker. |
| **Inputs** | Raw ore/materials, fuel or mana, flux/catalysts, containers, tools, cooling and maintenance parts. |
| **Outputs / services** | Ingots/refined materials, by-products, slag/ash/residue, heat and recipe-specific magical outputs. |
| **Required blueprint markers** | Input buffer, furnace chamber, fuel or mana port, operator point, output buffer, ventilation/cooling, waste zone, control and emergency shutdown. |
| **Placement and utilities** | Near mine/warehouse and road/logistics, with fire/heat separation. Mana branch requires safe store/conduit and stabilisation. |
| **Construction profile** | 6-8 stages, with basic fuel furnace operational before mana upgrade, improved controls and automation ports. |
| **Upgrade and branch links** | Improved Furnace, Mana Furnace, Blast Furnace, Foundry Feed Furnace, Arcane Alloy Furnace or culture-specific forge. |
| **Planner triggers and failure states** | Selected when ore supply and metal demand justify local processing. It stops on no fuel/power, blocked output, unsafe heat, damaged chamber or unstable mana. |
| **Player-blueprint validation** | Must prove input-output conservation, heat/fuel or mana source, ventilation/cooling, waste, operator safety, buffers and deterministic recipes. |
| **Culture, biome and realm variation** | Stone furnace house, charcoal smelter, dwarven forge furnace, lava kiln, crystal mana furnace, rune-lined smelter or compact industrial furnace. |


### 104. Mechanical Processing Mill

building.automation.mechanical_processing_mill

| **Field** | **Definition** |
|---|---|
| **Catalogue role** | Automation / Modular Processing / Village / Medium / Optional / Alpha |
| **Need contribution** | Primary: Work / Secondary: Infrastructure |
| **Purpose** | Uses interchangeable powered modules to crush, saw, mill, press or perform other simple repeatable processing at greater scale than hand stations. |
| **Capacity / service** | Draft throughput depends on selected module, power, input/output buffers, operator/maintenance, material hardness and machine condition. |
| **Jobs and users** | Mill operator, mechanic, production specialist, hauler and maintenance worker. |
| **Inputs** | Raw materials, power, machine module, tools, replacement parts, lubricant and recipe-specific consumables. |
| **Outputs / services** | Processed materials, improved yield, by-products, waste and production telemetry. |
| **Required blueprint markers** | Power input, module slot, input hopper/buffer, processing area, output buffer, waste/by-product port, operator/control and maintenance clearance. |
| **Placement and utilities** | Near relevant raw supply and warehouse with route/power access. Noise/dust or food hygiene determines district placement. |
| **Construction profile** | 6-7 stages: shell/foundation; power train; buffers; module; controls/safety; activation. |
| **Upgrade and branch links** | Multi-Module Mill, High-Efficiency Processor, Rune-Control Mill, Industrial Processing Plant or culture-specific machine. |
| **Planner triggers and failure states** | Selected when a repeated processing chain creates labour or yield pressure. The planner avoids duplicate mills without distinct demand or module role. |
| **Player-blueprint validation** | Must declare module/recipe family, prove power, buffers, maintenance and by-product handling. One decorative machine cannot process every material. |
| **Culture, biome and realm variation** | Water-powered sawmill, crusher house, grain roller, textile fulling mill, stone polisher, rune press or compact urban processor. |


### 105. Conveyor or Cart Logistics Hub

building.logistics.conveyor_cart_hub

| **Field** | **Definition** |
|---|---|
| **Catalogue role** | Automation / Logistics Control / Town / Medium/Large / Optional / Beta |
| **Need contribution** | Primary: Infrastructure / Secondary: Work |
| **Purpose** | Connects belts, chutes, carts, roads, storage and production through visible transfer points, sorting, buffers and permissions. |
| **Capacity / service** | Draft transfer rate depends on connected network types, loading points, filters, buffers, power where required, staff, route condition and destination capacity. |
| **Jobs and users** | Logistics operator, dispatcher, hauler, cart driver, mechanic, sorter and warehouse liaison. |
| **Inputs** | Items, carts/containers, belts/chutes, filters, power/control parts, schedules, maintenance and ownership rules. |
| **Outputs / services** | Routed goods, sorted buffers, cart dispatch, network transfer, bottleneck alerts and delivery records. |
| **Required blueprint markers** | Multiple intake/output ports, buffers, filter/control station, cart loading, road/network sockets, staff path, maintenance and emergency bypass. |
| **Placement and utilities** | Between industrial sites and warehouses with enough route/turning clearance. It should not obstruct public streets or bypass settlement ownership. |
| **Construction profile** | 7-9 stages, with manual cart transfer active before powered sorting and advanced network links. |
| **Upgrade and branch links** | Freight Depot, Automated Sorting Hub, Rail Exchange, Portal Freight Interface or Regional Logistics Nexus. |
| **Planner triggers and failure states** | Selected when routes intersect, hauling labour is high or storage/production has persistent blocked flow. It pauses safely when destinations are full. |
| **Player-blueprint validation** | Must prove directional flow, buffers, route/network compatibility, filters, ownership, maintenance and blocked-output behaviour. |
| **Culture, biome and realm variation** | Cart exchange yard, canal transshipment hall, belt depot, dwarven rail loader, golem dispatch court or rune-sorted logistics hub. |


### 106. Steam or Generator Plant

building.power.steam_generator_plant

| **Field** | **Definition** |
|---|---|
| **Catalogue role** | Power / Industrial Generation / Town / Large / Optional / Beta |
| **Need contribution** | Primary: Infrastructure / Secondary: Safety, Work |
| **Purpose** | Provides higher-output controllable power for town industry, pumping, lighting and automation, with visible fuel, heat, pressure, maintenance and pollution trade-offs. |
| **Capacity / service** | Draft output depends on generator modules, fuel, water/cooling, pressure/heat, efficiency, staff, transmission and safety limits. |
| **Jobs and users** | Power engineer, boiler/operator, mechanic, fuel handler, water technician, inspector and fire/emergency crew. |
| **Inputs** | Fuel, water/cooling or equivalent, boiler/generator parts, lubricants, filters, maintenance, control components and labour. |
| **Outputs / services** | Mechanical/electrical-like power according to setting, heat, pressure, smoke/waste, grid telemetry and emergency reserve when buffered. |
| **Required blueprint markers** | Fuel intake, water/cooling, boiler/generator, transmission output, controls, pressure relief, ventilation, waste, maintenance, fire access and shutdown. |
| **Placement and utilities** | Industrial or utility district with fuel/water logistics and separation from dense housing. Pollution, noise and strategic threat affect site choice. |
| **Construction profile** | 9-11 stages: heavy foundation; boiler/generator; fuel/water; transmission; control; ventilation/waste; safety; commissioning. |
| **Upgrade and branch links** | High-Efficiency Plant, Multi-Generator Station, Hybrid Mana Generator, District Power Station or Regional Grid source. |
| **Planner triggers and failure states** | Selected when renewable/manual power cannot meet sustained demand. It creates maintenance and fuel demand and should shut down before normal overload becomes catastrophic. |
| **Player-blueprint validation** | Must prove complete fuel-water-power-waste chain, pressure relief, controls, maintenance, safe access, output limits and authoritative energy accounting. |
| **Culture, biome and realm variation** | Steam hall, combustion generator, geothermal plant, lava turbine, arcane turbine, dwarven pressure works or magitech hybrid station. |


### 107. Automated Farm or Greenhouse

building.automation.automated_farm_greenhouse

| **Field** | **Definition** |
|---|---|
| **Catalogue role** | Automation / Scaled Provisions / Town / Complex / Optional / Beta |
| **Need contribution** | Primary: Provisions / Secondary: Infrastructure, Work |
| **Purpose** | Scales crop production through irrigation, powered tools, controlled climate, logistics, golem support or magic while retaining soil, seed, water, season and maintenance rules. |
| **Capacity / service** | Draft crop area, cycles and yield depend on valid farm beds, light/climate, water, seeds, fertility, power/mana, machine modules, staff and output storage. |
| **Jobs and users** | Farmer, horticulturist, irrigation worker, automation operator, mechanic, mage/alchemist for magical branch and hauler. |
| **Inputs** | Seeds, water, fertility inputs, power/mana, tools, machine parts, light/heat/cooling, pest control and maintenance. |
| **Outputs / services** | Crops, herbs, seeds, by-products, controlled-season production, research data and reduced labour per unit. |
| **Required blueprint markers** | Farm beds, irrigation, climate/light controls, seed/input store, output store, worker paths, machine/golem zones, power/mana and maintenance. |
| **Placement and utilities** | Suitable land or constructed greenhouse parcel with water/logistics. Climate control can reduce but not erase all biome constraints. |
| **Construction profile** | 8-10 stages, with manual beds and water active before automation, climate control and advanced modules. |
| **Upgrade and branch links** | Industrial Greenhouse, Magical Crop Sanctuary, Vertical Farm, Golem Farm or Realm Agriculture Facility. |
| **Planner triggers and failure states** | Selected when food demand, climate, land scarcity or specialist crops justify capital and utility cost. It fails on water, power, disease, blocked output or climate-control loss. |
| **Player-blueprint validation** | Must count real crop beds, prove water/light/climate, access, inputs/outputs, maintenance and declared automation. Decorative glass buildings do not generate food. |
| **Culture, biome and realm variation** | Glasshouse, terrace irrigation complex, underground mushroom automation, fae living greenhouse, desert hydroponic-like garden or floating mana farm. |


### 108. Automated Factory or Assembly Hall

building.industry.automated_factory_assembly

| **Field** | **Definition** |
|---|---|
| **Catalogue role** | Industry / Advanced Production / City / Large / Optional / Beta |
| **Need contribution** | Primary: Work / Secondary: Infrastructure, Safety |
| **Purpose** | Coordinates multiple powered production steps, assembly stations and logistics for bulk machine parts, construction components and advanced goods. |
| **Capacity / service** | Draft lines, batch throughput and product families depend on floor modules, power, recipes, buffers, logistics, operators, maintenance, quality controls and output demand. |
| **Jobs and users** | Factory manager, engineers, operators, mechanics, quality inspector, logistics staff, specialists and safety crew. |
| **Inputs** | Components, raw/refined materials, power, recipes, tools, machine modules, maintenance parts, containers and logistics capacity. |
| **Outputs / services** | Bulk assemblies, machine components, construction parts, advanced goods, by-products, waste, heat and production records. |
| **Required blueprint markers** | Input docks, line/module slots, power/control, work/safety aisles, buffers, quality station, output dispatch, waste, maintenance and emergency shutdown. |
| **Placement and utilities** | Industrial district with heavy logistics, power, fire/emergency routes and separation from housing. Expansion corridors and district services are important. |
| **Construction profile** | 10-14 stages or subprojects; one production line may activate before the full hall is complete. |
| **Upgrade and branch links** | Specialised Factory, Magitech Assembly Hall, Regional Production Complex, Golem-Integrated Factory or 20F industrial campus. |
| **Planner triggers and failure states** | Selected when city demand and supply chains justify scale. The planner penalises a factory without stable inputs, power, output markets or maintenance labour. |
| **Player-blueprint validation** | Must declare supported product families, prove line flow, buffers, power, maintenance, staff safety, output demand and deterministic transactions. |
| **Culture, biome and realm variation** | Steam factory, dwarven assembly cavern, rune-line hall, canal factory, golem-assisted works, celestial precision plant or modular urban manufactory. |


### 109. Golem Workshop or Labour Centre

building.automation.golem_workshop_labour_centre

| **Field** | **Definition** |
|---|---|
| **Catalogue role** | Automation / Constructed Labour / City / Large / Conditional / Beta |
| **Need contribution** | Primary: Work / Secondary: Infrastructure, Safety |
| **Purpose** | Builds, charges, assigns and maintains specialised constructed workers under explicit ownership, allowed zones, task profiles, laws and social consequences. |
| **Capacity / service** | Draft golem assembly, active labour slots and charge capacity depend on workshops, cores, materials, mana/power, controllers, specialists, storage and maintenance. |
| **Jobs and users** | Golemancer, rune engineer, machinist, controller, maintenance worker, ethicist/law officer where relevant and guard. |
| **Inputs** | Frames/bodies, cores, runes, mana/power, tools, task profiles, replacement parts, permitted materials and research. |
| **Outputs / services** | Constructed workers, repairs, charging, task programming, labour capacity, specialised tools and social/political effects. |
| **Required blueprint markers** | Assembly bays, core/rune station, charging, control room, allowed-zone map, storage, test yard, maintenance, shutdown and secure access. |
| **Placement and utilities** | Industrial/magical district with safe test space and strong ownership controls. Cultures may welcome, restrict or reject golem labour. |
| **Construction profile** | 9-12 stages, with repair/charging functions activating before full new-golem assembly. |
| **Upgrade and branch links** | Specialist Golem Yard, Regional Labour Command, Siege/Construction Golem Annex, Ethical Civic Golem Service or forbidden construct branch. |
| **Planner triggers and failure states** | Selected after research, materials, law and sustained labour need. It must not make named NPCs irrelevant and may create unemployment, fear, faction or rebellion consequences. |
| **Player-blueprint validation** | Must declare construct types, task limits, ownership, allowed zones, charge/fuel, emergency shutdown, control security and forbidden flags. |
| **Culture, biome and realm variation** | Clay golem yard, clockwork construct hall, rune-carved stone workshop, living wood guardian grove, crystal automaton lab or necromantic forbidden facility. |


### 110. Regional Power or Mana Grid Control

building.power.regional_grid_control

| **Field** | **Definition** |
|---|---|
| **Catalogue role** | Power / Regional Coordination / Capital / Megaproject / Megaproject / Final |
| **Need contribution** | Primary: Infrastructure / Secondary: Safety, Work |
| **Purpose** | Coordinates multiple power and mana sources, storage, priorities, districts and emergency isolation across a capital or region without creating energy from nothing. |
| **Capacity / service** | Draft network scale depends on connected sources, transmission, substations, storage, operators, redundancy, control throughput, security and regional infrastructure. |
| **Jobs and users** | Grid controller, power engineer, mana engineer, dispatcher, maintenance coordinator, warder, security staff and emergency command. |
| **Inputs** | Telemetry, power/mana from real sources, control components, communication/signal links, staffing, maintenance, security and backup supplies. |
| **Outputs / services** | Priority dispatch, load balancing, fault isolation, reserve activation, district service summaries, emergency shutdown and regional planning data. |
| **Required blueprint markers** | Control hall, network map, source/load interfaces, priority controls, backup power/mana, communication, security, maintenance, emergency command and isolation systems. |
| **Placement and utilities** | Capital utility/governance complex with protected access, redundant routes and links to district/region substations. It is a strategic raid and sabotage target. |
| **Construction profile** | 12+ staged subprojects: control centre; communications; source links; storage; substations; security; redundancy; commissioning. |
| **Upgrade and branch links** | Realm Grid Command, Leyline Network Authority, Portal-Energy Coordination or 20F civilisation-scale power nexus. |
| **Planner triggers and failure states** | Selected only after a capital has multiple networks whose unmanaged failures or competition create regional risk. It adds coordination, not raw generation. |
| **Player-blueprint validation** | Must bind to actual networks, preserve source/load conservation, prove priorities, isolation, redundancy, authority, multiplayer permissions and persistent fault history. |
| **Culture, biome and realm variation** | Industrial control hall, magical crystal command, dwarven deep-grid chamber, floating network spire, temple-administered ley authority or hybrid civic grid palace. |


# 23. POC Implementation Scope

Document 20H protects only catalogue definition 91, the Mage Hut or Rune Workshop, as a full 20E POC building. The existing game vision still requires the vertical slice to demonstrate practical mana infrastructure. To avoid silently expanding the 30-definition POC roster, the following are reduced test fixtures or modules rather than production-complete settlement blueprints:

- One basic ward stone or ward lantern using the rule set of definition 93.
- One small mana buffer or secure crystal store using a subset of definition 94.
- One furnace with an optional mana-furnace process using a subset of definition 103.
- One short mana conduit connection.
- The village mage and basic rune workflow inside definition 91.

These fixtures prove the contracts and can later be promoted into full Alpha buildings without changing IDs or save meaning.

## 23.1 POC Cause-and-Effect Sequence

1. The player discovers a mana crystal clue or small deposit near the Forest Hamlet.
2. A village mage, ruin, book or quest reveals the first practical rune knowledge.
3. The settlement or player constructs the Mage Hut or Rune Workshop from exact staged resources.
4. The warehouse stores mana crystal/shards and only releases project or recipe stock through permission.
5. The mage converts approved inputs into a basic rune or ward component.
6. A limited furnace or mana-furnace process demonstrates input, power/mana, output and by-product state.
7. The player places and connects the ward fixture to the watchtower or village approach.
8. The UI shows mana source, reserve, consumption, coverage and any missing link.
9. The completed ward changes warning, guard readiness, creature behaviour or raid damage without guaranteeing victory.
10. Save/load during crafting, charging and ward operation preserves exact resources, project state and network charge.
11. A blocked output, empty mana store or damaged conduit produces a readable failure and repair task.
12. Distant simulation preserves ward drain and village outcome without running particles or individual conduit updates.

## 23.2 POC UI

- Mage Hut interaction: services, teaching, known recipes, inputs/outputs and specialist state.
- Rune crafting panel with exact inputs, time, mana and output.
- Mana storage summary: quantity, purity, reserve and ownership.
- Ward overlay: anchor, coverage, accepted threat type, drain and damaged links.
- Furnace/mana-furnace panel: input, output, fuel/mana, time and blocked state.
- Settlement Infrastructure/Safety drill-down showing the ward as a cause, not a new need bar.
- Blueprint validation reasons for the player-made Mage Hut.

## 23.3 POC Explicit Deferrals

- Full alchemy tree.
- Full machine workshop and automation catalogue.
- Golem gameplay.
- Leylines.
- Portals and dimensions.
- Ritual systems beyond a non-functional visual/lore teaser.
- Steam/grid simulation.
- Automated mine, factory or farm.
- Multiple mana types and advanced purity processing.
- Forbidden magic and corruption production chains.
- City-scale network controls.

# 24. Balancing and Simulation LOD

## 24.1 Balance Principles

- Exact building costs come from approved voxel stages and non-block components.
- Production recipes preserve input/output quantities and by-products.
- Maximum capacity is separate from current throughput.
- Earlier power and production remain useful as cheap, stable, repairable or local options.
- Magic provides unique functions and compact infrastructure but carries purity, knowledge and social constraints.
- Automation reduces repetitive labour but creates operator, maintenance, logistics and power demand.
- The planner should not build a factory without inputs, market, output storage or power.
- The planner should not build a portal without a safe destination, anchor, authority and sustained energy.
- Normal facilities warn and shut down before catastrophic failure.
- Risky materials and forbidden branches provide greater capability only with explicit counterplay and consequences.
- Research institutions unlock options; they do not passively grant every recipe.
- Golems add specialist labour but do not erase named NPC value, families, politics or jobs.
- Player blueprints compete through validated form, capacity and efficiency, not hidden bonuses for size or decoration.

## 24.2 Suggested Update Rates

| **State** | **Suggested Update Approach** |
|---|---|
| Immediate overload, breach, fire, attack or shutdown | Event-driven / real time nearby. |
| Nearby machine cycle and visible item movement | Recipe/task events or short bounded ticks. |
| Inventory and energy transactions | Authoritative transaction-driven updates. |
| Power/mana network allocation | On topology/load change plus bounded refresh. |
| Ward drain and coverage | On threat/topology change plus slow service tick. |
| Routine production | Recipe cycle or summary batch. |
| Research and teaching | Scheduled work blocks or daily progress. |
| Maintenance and impurity | Daily or multi-day summary plus event changes. |
| Distant production | Abstract batches preserving source, output, staff and power totals. |
| Distant risk and realm events | Daily or event-driven checks. |
| Growth/project eligibility | Daily or when a critical capability changes. |


## 24.3 Simulation LOD

### Near

- Machines animate, items move visibly where supported and workers use real markers.
- Mana/power visuals reflect authoritative state.
- Heat, sound, smoke, runes and warnings are readable.
- Damage, repairs and construction place real voxel blocks.
- Portal/ward boundaries and controls are physical.

### Medium

- Item visuals and worker paths can be simplified between network nodes.
- Production uses larger batches while preserving totals.
- Effects reduce detail but maintain state and alerts.
- Named staff, ownership, recipes and buffers remain exact.

### Far or Unloaded

- Facilities process bounded recipe, energy, staffing and maintenance summaries.
- No output is created unless inputs, capacity and energy exist.
- Ward and portal services consume reserves and respect destination state.
- Major accidents, sabotage, shortages or breaches create persistent events and damage.
- Returning players see the correct physical state promoted into the voxel world.

# 25. Open Questions for Later Balancing

These do not block Version 0.1:

1. Exact unit system for mechanical power, industrial power and mana.
2. Whether the UI uses one abstract energy unit per family or translated player-friendly rates.
3. Conversion efficiencies between mechanical, generated and mana power.
4. Exact purity grades and how often mixing creates risk.
5. Conduit range, loss and cross-chunk behaviour.
6. Ward coverage geometry and overlap/interference rules.
7. How much pollution changes biome state on default settings.
8. Exact maintenance frequency for machines and magical infrastructure.
9. Whether ordinary fuel furnaces and mana furnaces share one runtime class or linked definitions.
10. How many recipe/module families one processing mill can accept.
11. Exact operator staffing requirements versus unattended automation.
12. How golem labour affects migration, wages, morale and politics.
13. Portal cooldown, freight capacity and destination closure rules.
14. How realm time differences or inactive simulation affect portal routes.
15. Which forbidden facilities may appear in standard versus mature/harsh world presets.
16. How faction ownership of leylines and strategic deposits is contested.
17. Whether regional grid control is a building, distributed plan or both at implementation time.
18. How player-owned factories contract with NPC settlements and reserve stock.
19. How multiplayer permissions handle shared grids, emergency shutdown and sabotage.
20. Which 20E definitions receive parametric blueprint generation first.

# Appendix A. 20E Data Field Template

| **Field Group** | **Required Fields** |
|---|---|
| Identity | Stable ID; family; display name; category; subcategory; owner document; tags; planning status. |
| Stage and project | Earliest stage; project class; prerequisites; planner triggers; priority; culture/biome/realm conditions. |
| Needs and service | Primary need; secondary needs; capacity type; demand; current limit; failure causes; status labels. |
| Physical blueprint | Footprint; height; segments/modules; material tokens; stages; markers; sockets; clearance; terrain adaptation. |
| Sources and bindings | Deposit; water/wind; fuel; mana; leyline; portal anchor; realm; world condition; depletion/reserve. |
| Inventories | Input; output; buffer; by-products; waste; accepted tags; ownership; reservations; overflow. |
| Energy | Power/mana type; generation; demand; transmission; storage; purity; safe load; priorities; conversion. |
| Machine/recipe | Recipe families; batch; time; throughput; quality; module slots; blocked behaviour; automation support. |
| Magic | Schools/tags; runes; ward profile; ritual geometry; catalysts; corruption; stabilisation; teaching/research. |
| Jobs and staffing | Jobs; minimum staff; skills; schedules; teaching; emergency roles; remote simulation. |
| Risk and environment | Heat; pressure; fire; pollution; noise; corruption; breach; creature attraction; mitigation; world settings. |
| Ownership and law | Owner; public/private; faction; permissions; strategic status; forbidden flags; crime/consequence hooks. |
| Maintenance and repair | Condition; intervals; repair items; specialist; shutdown; redundancy; damage states; recovery. |
| Upgrade and conversion | Previous/next; branch; module; stock transfer; network migration; replacement; realm adaptation. |
| UI | Summary; causes; alerts; panel fields; overlay; tutorial; validation errors; knowledge visibility. |
| LOD and save | Near behaviour; medium batch; far tick; transaction state; topology; destination state; migration/version. |


# Appendix B. Power, Mana and Facility Contract Matrix

| **Capability** | **Source / Facility** | **Required Links** | **Primary Outputs** | **Common Blockers** |
|---|---|---|---|---|
| First practical magic | Mage Hut / Rune Workshop | Specialist, mana stock, rune bench, warehouse access | Runes, teaching, repairs, ward support | No mage, no knowledge, unsafe store. |
| Local ward | Ward Stone / Relay | Mana, rune/anchor, coverage, tuning | Warning/protection | Empty store, broken relay, wrong threat profile. |
| Mana reserve | Mana Store / Battery | Accepted fuel, containment, conduits, control | Buffered mana | Impurity, overcharge, theft, damaged vessel. |
| Basic processing | Furnace / Mana Furnace | Input, fuel/mana, operator, output | Ingots/refined materials | No input, no energy, blocked output, heat risk. |
| Renewable power | Water/Wind House | Valid source, wheel/sails, transmission | Mechanical power | Low flow/wind, obstruction, broken shaft. |
| Industrial power | Steam/Generator Plant | Fuel, water/cooling, controls, transmission | High sustained power | Fuel/water shortage, pressure, maintenance. |
| Modular automation | Processing Mill | Power, module, buffers, recipe | Processed materials | Wrong module, no power, output full. |
| Enchanted production | Rune Forge | Forge, mana, runes, specialist, safety | Enchanted gear/components | Impurity, missing rune, ward failure. |
| City travel | Portal Station | Origin/destination, mana, stability, operator | Travel/freight | Destination closed, cooldown, instability. |
| Constructed labour | Golem Centre | Bodies/cores, charge, control, law | Task labour | No charge, invalid zone, control/law conflict. |
| Regional coordination | Grid Control | Actual sources/loads, telemetry, authority | Priority and fault isolation | Lost links, sabotage, authority conflict. |
| Realm safety | Dimensional Facility | Containment, wards/power, decontamination | Research and hazard control | Breach, no redundancy, unknown hazard. |


# Appendix C. POC Acceptance Checklist

- [ ] Mage Hut or Rune Workshop has a stable registry entry and validated voxel blueprint.
- [ ] Blueprint contains reachable rune, teaching, storage, mage and public-service markers.
- [ ] Construction consumes exact staged resources from reserved stock.
- [ ] Village mage is a persistent named NPC with a valid job and schedule.
- [ ] Mana crystal/shards are real inventory items with ownership and quantity.
- [ ] Basic rune recipe preserves exact inputs, time, mana and output.
- [ ] Small mana buffer counts only valid storage markers/components.
- [ ] Limited furnace/mana-furnace process shows input, output, fuel/mana and blocked state.
- [ ] Ward fixture exposes anchor, threat profile, mana drain and coverage.
- [ ] Ward improves the watchtower/raid scenario without guaranteeing victory.
- [ ] Empty mana, broken conduit or damaged ward creates a readable failure.
- [ ] Warehouse permissions and reservations cannot be bypassed by the magical process.
- [ ] Save/load during crafting, charging and active ward service does not duplicate or lose resources.
- [ ] Distant simulation consumes mana and preserves ward state.
- [ ] Player-made Mage Hut can be created in-world and from the main menu.
- [ ] Player blueprint validation rejects missing safe zone, storage, access or work markers.
- [ ] UI shows causes under Work, Safety and Infrastructure without creating a new Mana need.
- [ ] Normal instability warns and shuts down before catastrophic damage.
- [ ] Damage and repair preserve building, inventory and project history.
- [ ] POC uses Godot data resources or imported structured data with stable IDs and versioning.

# Appendix D. Cross-System Dependency Matrix

| **20E System** | **Primary Dependencies** | **Dependent Systems** |
|---|---|---|
| Extraction | Worldgen deposits, blocks, resources, jobs, logistics | Industry, trade, magic, projects and faction conflict. |
| Industry and machines | Recipes, items, power, inventories, ports, specialists | Construction, defence, automation, economy and cities. |
| Power networks | Sources, world conditions, transmission, storage, control | Machines, pumps, lighting, logistics, wards and housing services. |
| Mana networks | Resources, purity, storage, conduits, runes, ownership | Wards, healing, furnaces, portals, golems and rituals. |
| Research and teaching | NPCs, knowledge items, quests, institutions | Recipes, specialists, realms, culture stories and progression. |
| Wards | Mana, runes, threat profiles, structures, combat | Village safety, roads, portals, raids and corruption. |
| Portals | Dimensions, anchors, mana, permissions, logistics | Travel, trade, faction arcs, realm settlements and events. |
| Golems | Magic/automation, jobs, law, ownership, maintenance | Construction, logistics, farming, warfare and social simulation. |
| Dimensional containment | Realm rules, hazards, health, defence, research | Portal safety, materials, stories and capital progression. |
| Player blueprints | Document 19 editor/validation and 20H IDs | All 20E facilities and culture/realm packs. |
| Simulation LOD | Technical architecture, saves, transactions and world streaming | Every active machine, network, ward, project and realm route. |
