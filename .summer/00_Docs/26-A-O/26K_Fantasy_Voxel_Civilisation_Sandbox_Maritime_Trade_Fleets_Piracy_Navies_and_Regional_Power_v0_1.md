# FANTASY VOXEL CIVILISATION SANDBOX

## DOCUMENT SET 26

# 26K - Maritime Trade, Fleets, Piracy, Navies and Regional Power

*Version 0.1 - Detailed Design Bible and Technical Foundation Draft*
A systemic maritime-economy and regional-power framework for physical cargo, trade routes, freight and passenger contracts, merchant operations, convoy organisation, persistent fleets, customs, smuggling, piracy, privateering, patrols, navies, blockades, diplomacy, strategic access, simulation LOD and world-state consequences.
Working design document - maritime trade, fleet organisation, piracy, naval administration and regional influence foundation

| Field | Locked Direction |
| --- | --- |
| Document Role | Document 26K is the gameplay and data-contract authority for maritime trade routes, cargo voyages, merchant operations, fleet organisation, convoy and patrol missions, customs and smuggling interfaces, piracy, privateering, naval institutions, blockades, maritime diplomacy and regional-power consequences. |
| Core Philosophy | Maritime wealth and power must emerge from real ports, vessels, crews, cargo, routes, information, permissions, supplies and persistent risk. A fleet, trade lane or blockade cannot exist only as a map icon or invisible regional modifier. |
| Economy Direction | Use a physical, transaction-safe economy. Cargo originates from authoritative inventories and production, is reserved into Cargo Lots, loaded onto actual vessels or distant summaries, transported, unloaded and settled without duplication. Market values respond to supply, demand, risk, access and culture, but final numeric balance belongs to 26N and later tuning. |
| Route Direction | Trade Routes are persistent relationships between valid Port Nodes or specialist maritime endpoints. Routes declare path knowledge, vessel requirements, seasonal windows, hazards, legal access, service needs and expected cargo demand; they do not teleport goods. |
| Fleet Direction | A Fleet Instance is a persistent organisation of identifiable vessels, crews, command, mission, formation, supply plan and authority. Membership may change, but vessels and people retain their own identities, condition, cargo and histories. |
| Piracy Direction | Piracy is a behaviour, economy and political status rather than a creature category or biologically determined faction. Pirates require vessels, crews, intelligence, havens, markets, supplies, motives and targets, and may raid, steal, extort, smuggle, ransom or take prizes subject to later 26L encounter execution. |
| Navy Direction | Navies, coast guards, customs cutters and faction patrol forces are institutions sustained by settlements, taxes, stock, shipyards, crews, doctrine, intelligence and political authority. A faction does not gain naval power from owning a flag or abstract technology tier alone. |
| Regional-Power Direction | Regional maritime power is a multi-vector profile derived from access, logistics, commerce, shipbuilding, security, intelligence, diplomacy, resilience and magical reach. No single score may silently grant control over ports, routes or populations. |
| Conflict Boundary | 26K defines strategic missions, threat, pursuit, interception intent, blockade coverage, surrender offers, prizes, capture claims and economic aftermath. Document 26L owns weapons, ramming, boarding, crew combat, physical damage, flooding, fire, sinking and tactical encounter resolution. |
| Port Boundary | 26J remains authoritative for Port Calls, berths, services, crews, facilities, shipyards, port authority and operational access. 26K consumes those capabilities to create routes, contracts, fleets, trade competition and regional influence. |
| World and Lore Boundary | Atlas Set 24 owns named regions, cultures, factions, ports, historical powers and authored maritime conflicts. 26K supplies executable contracts without inventing or replacing final Atlas canon. |
| Technical Direction | Implement in Godot using GDScript-first registry and simulation services, authoritative transaction commands, deterministic route/fleet summaries and promotion into physical vessels and NPCs near players. Summer Engine work remains reviewable, evidence-backed and migration-safe. |
| Production Direction | All identities, extensions, relationships, capability queries, package dependencies, migration behaviour and validation evidence follow Document Set 25. Detailed maritime progression, content rosters and balance values remain coordinated with 26N. |

# DOCUMENT SET 26 - OCEANS, MARITIME CIVILISATION, VESSELS AND NAVAL SYSTEMS EXPANSION

# Document Purpose

Document 26K defines why Leyforge civilisations send vessels across rivers, coasts, open seas and realm-linked waters, how those voyages conserve real resources, how multiple vessels become fleets, how lawful and unlawful maritime organisations compete, and how control of ports and routes changes settlements, factions and regional history. It converts the environmental, vessel and port foundations of Documents 26B-26J into persistent economic and political motion.
The system begins with physical truth. A settlement produces grain, timber, metal, tools, preserved food, mana goods or cultural products. A port exposes valid storage, cargo-handling, clearance and berth capacity. A vessel exposes cargo volume, mass, certification, crew and operational limits. A route exposes known path segments, conditions and legal access. Only then may a Cargo Contract reserve stock, load a manifest, travel and deliver. Distant simulation may summarise these steps, but it must preserve quantity, provenance, ownership, time, risk, damage and outcome.
Fleets use the same principle. A fleet is not a decorative formation or a generic regional strength number. It is a persistent organisational record that references real vessels, crews, commanders, ports, supply plans and missions. Merchant convoys, fishing groups, relief flotillas, exploration expeditions, pirate bands, customs patrols and naval squadrons share a common fleet foundation while retaining different laws, goals, risk tolerances and capability requirements.
Piracy and naval power must remain systemic and morally contextual. A pirate crew may be a desperate raider, an organised criminal enterprise, a rebellious coastal faction, a state-sponsored privateer, a corrupt official force or a player-founded outlaw company. A navy may protect trade, enforce an empire, blockade a rival, suppress piracy, seize contraband, escort refugees or threaten neutral ports. Cultures and factions define laws and interpretations; ancestry never determines morality or maritime competence.
Document 26K deliberately stops before tactical naval combat. It determines why fleets meet, which side detects or intercepts the other, what each side intends, what strategic constraints apply and what economic or political consequences follow. Document 26L determines how physical combat, boarding, damage, flooding, fire, surrender and sinking are executed. Document 26M supplies marine ecology and fishing content, 26N supplies detailed registries and progression, and 26O consolidates final UI, multiplayer and technical implementation.

# Design Sources, Authority and Supersession

| Source | Authority Consumed by 26K | 26K Boundary |
| --- | --- | --- |
| 00-02 - Master, Loop and Progression | Sandbox freedom, living civilisations, multi-track progression, meaningful world consequences and multiple valid player roles. | Maritime commerce and power become optional connected paths rather than mandatory replacement progression. |
| 07-08 - NPC Villages and Automation | Persistent people, settlements, inventories, jobs, warehouses, production, permissions, logistics and simulation LOD. | 26K extends these systems into maritime organisations, cargo flows and fleet missions without creating duplicate economies. |
| 13 - Races, Peoples, Cultures and Factions | Separate ancestry, culture, faction, government, territory, law, diplomacy and historical identity. | Trade preference, piracy status, naval institutions and treaties belong to culture/faction/politics, never biological destiny. |
| 15 - Quest and Event System | Authored and simulation-driven contracts, events, contribution, failure, world evidence and persistent aftermath. | 26K exposes maritime objectives, incidents and political consequences through the shared quest/event foundation. |
| 19-20 - Settlement and Building Systems | Seven needs, capabilities, facilities, projects, districts, services, stock and authoritative activation contracts. | Trade and maritime power change settlements through real services and resources; no abstract port zone creates prosperity. |
| 24C/24E/24I/24K - Atlas Environment, Peoples, Structures and History | Authored marine geography, peoples, factions, ports, routes, conflicts, laws, trade traditions and world history. | 26K operationalises approved content and cannot invent final named powers or overwrite canon. |
| 25A-25L - Production Governance | Qualified IDs, source ownership, relationships, capabilities, packs, migration, validation, production scope, evidence and backlog controls. | All 26K definitions and runtime records must enter through governed extension facets and release gates. |
| 26B-26D - Water, Worldgen and Marine Climate | Water-body identity, routes, depth, islands, currents, tides, storms, ice, visibility and environmental change. | 26K consumes conditions and route effects; it does not simulate water or weather independently. |
| 26F-26G - Vessel Architecture and Movement | Vessel identity, cargo capacity, mass, certification, propulsion, range, navigation and near/far voyage boundaries. | 26K assigns missions and loads only compatible vessels; physical vessel behaviour remains 26F-26G-owned. |
| 26H-26I - Shipwright Work and Vessel Forge | Construction, repair, refit, salvage, approved blueprints, variants and provenance. | Fleet procurement references approved designs and real projects; 26K does not spawn uncosted vessels. |
| 26J - Maritime Civilisation | Ports, Port Nodes, Port Calls, facilities, crews, services, shipyards, authorities and operational access. | 26K owns route, cargo, fleet and regional-power use of those endpoints; 26J remains operational port truth. |
| 26L-26O - Later Maritime Documents | Combat execution, marine ecology, detailed registries/progression and final technical/UI consolidation. | 26K provides explicit handoffs and does not pre-empt those authorities. |

> **Supersession Rule**
>
> Any earlier rule that creates maritime income from decorative ships, moves cargo without a conserved source and destination, treats a fleet as an untraceable strength number, or assigns piracy/naval morality by ancestry is superseded. Existing inventory, economy, settlement, faction, quest and simulation contracts remain valid and are extended rather than replaced.

# Static Table of Contents

1. Locked Maritime Trade and Regional-Power Identity
2. Design Principles and Experience Targets
3. Explicit Non-Goals
4. Source-of-Truth and Ownership Boundaries
5. Canonical Terminology
6. Record Architecture and Data Separation
7. Maritime Economy and Resource-Conservation Model
8. Commodity, Cargo and Passenger Categories
9. Cargo Lots, Manifests, Ownership and Provenance
10. Supply, Demand, Prices and Market Memory
11. Freight, Trade, Passenger and Service Contracts
12. Maritime Routes, Lanes, Segments and Endpoints
13. Route Knowledge, Charts, Intelligence and Confidence
14. Voyage and Trade Transaction Lifecycle
15. Merchant Operations, Guilds and Maritime Enterprises
16. Fleet Architecture and Persistent Fleet Records
17. Fleet Types, Mission Profiles and Doctrine
18. Fleet Membership, Formation, Command and Signals
19. Fleet Readiness, Supply, Maintenance and Endurance
20. Convoys, Escorts, Scheduling and Shared Risk
21. Distant Fleet and Route Simulation
22. Fishing, Harvest and Ecological Boundary
23. Customs, Declarations, Tariffs and Inspection
24. Contraband, Smuggling and Concealment
25. Piracy Identity, Motives and Lifecycle
26. Pirate Havens, Intelligence, Fences and Support Networks
27. Pirate Threat Generation and Target Selection
28. Prize Taking, Ransom, Extortion and Reputation
29. Privateering, Letters of Marque and State Sponsorship
30. Naval and Maritime-Security Institutions
31. Patrols, Interdiction, Pursuit and Search
32. Naval Bases, Logistics, Recruitment and Procurement
33. Blockades, Embargoes, Chokepoints and Access Denial
34. Maritime Diplomacy, Treaties and Port Rights
35. Maritime Claims, Jurisdiction and Contested Waters
36. Regional Maritime Power and Influence Profiles
37. War, Escalation, Deterrence and Strategic Outcomes
38. Player Roles and Maritime Career Paths
39. NPC and Faction Maritime Decision Model
40. Settlement Needs, Economy and Civilisation Consequences
41. Automation, Magic, Golems and Specialist Infrastructure
42. Quests, Events, Rumours and Emergent Maritime Stories
43. Difficulty, Accessibility and World Settings
44. Persistence, Simulation LOD and Promotion/Demotion
45. Multiplayer Authority, Ownership and Contribution
46. UI/UX Requirements and Player Feedback
47. Godot/Summer Engine Technical Architecture
48. Set 25 Schemas, Relationships, Capabilities and Packs
49. Validation, Reason Codes, Evidence and Release Gates
50. Prototype Laboratories and Acceptance Tests
51. Performance, Scalability and Production Budgets
52. Staged Implementation Plan
53. Cross-Document Integration and Main-Document Amendments
54. Formal Handoff to 26L
- Appendix A. Maritime Economy, Cargo and Contract Record Templates
- Appendix B. Fleet, Mission, Piracy and Navy Record Templates
- Appendix C. Capability, Relationship and Mission Catalogue
- Appendix D. Validation and Reason-Code Catalogue
- Appendix E. Example Maritime Scenarios
- Appendix F. Completion Checklist

# 1. Locked Maritime Trade and Regional-Power Identity

The Maritime Trade, Fleets, Piracy, Navies and Regional Power System is the economic, organisational and political layer of Leyforge's maritime expansion. It makes water routes meaningful by connecting physical production and shortage to vessels, ports, contracts, law, danger, diplomacy and long-term faction change.

> **Locked Rule**
>
> No maritime organisation, route or power may create capability merely because it has a label, icon or high-level score. Every meaningful outcome must resolve from identifiable ports, vessels, crews, cargo, knowledge, supplies, permissions, relationships, environmental conditions and persistent history.

| Identity Layer | Design Meaning | Player-Facing Result |
| --- | --- | --- |
| Physical Maritime Economy | Goods originate, move and arrive through authoritative inventories and transactions. | Trading and raiding visibly affect warehouses, settlements and vessels rather than changing unexplained numbers. |
| Persistent Organisations | Companies, fleets, pirate bands and naval commands reference real members, assets, leaders and obligations. | Players can inspect who is acting, what they own, what they need and what changed. |
| Geographic Opportunity | Routes depend on actual coasts, islands, currents, ports, chokepoints and seasonal conditions. | Different seeds create different strategic and commercial worlds. |
| Law and Political Context | Customs, contraband, piracy, privateering, patrols and blockades depend on faction law and diplomacy. | The same action may be lawful, tolerated or criminal in different jurisdictions. |
| Strategic Consequence | Access, supply, shipbuilding, security, trade and diplomacy influence settlement and faction power. | Maritime choices change shortages, prices, migration, alliances, war and regional history. |
| Player Freedom | Players may trade, escort, smuggle, raid, patrol, negotiate, blockade, build a company or remain independent. | No heroic or imperial role is assumed, but all choices have coherent consequences. |
| Scalable Simulation | Nearby vessels and cargo are physical; distant routes and fleets use bounded deterministic summaries. | Large maritime networks remain possible without losing identity or resource truth. |

# 2. Design Principles and Experience Targets

- **Conservation before profit:** income is valid only after source stock, cargo reservation, transport, delivery and settlement are resolved.
- **Geography matters:** route distance, currents, tides, weather, port depth, chokepoints and realm transitions influence opportunity and risk.
- **Information is a resource:** charts, rumours, sightings, prices, patrol patterns and storm forecasts have confidence and age.
- **No universal market oracle:** players and NPCs know only discovered, reported or contract-provided information unless accessibility or world settings simplify it.
- **Organisation without spreadsheet burden:** high-level orders, schedules and policies are supported while deep inspection remains available.
- **Piracy is systemic:** unlawful maritime behaviour emerges from motives, opportunity, law, support and consequences rather than generic hostile spawns.
- **Navies consume civilisation:** fleets require taxes or budgets, shipyards, provisions, crews, repairs, intelligence and political support.
- **Strategic abstraction remains explainable:** distant simulation records inputs, decisions, random seeds, modifiers, incidents and outcomes.
- **Cultural variety without hardcoding:** cargo preferences, laws, ranks, ship types and doctrine are data-driven culture/faction layers.
- **Persistent aftermath:** lost cargo, closed routes, captured vessels, shortages, blockades, treaties and destroyed organisations remain in world history.

## 2.1 Player Experience Bands

| Band | Expected Experience |
| --- | --- |
| Local Trade | Move small cargo between nearby settlements, learn prices and establish trusted relationships. |
| Professional Voyage | Accept freight or passenger contracts, prepare a vessel and crew, choose a route and manage risk. |
| Maritime Enterprise | Own or manage multiple vessels, negotiate regular routes, employ captains and coordinate maintenance. |
| Convoy and Security | Group vessels, hire escorts, respond to piracy and plan departure windows. |
| Outlaw or Privateer | Smuggle, raid, extort or seize prizes under criminal, rebel or state-sponsored status. |
| Naval Service | Patrol, escort, interdict, blockade, defend ports and execute faction maritime policy. |
| Regional Power | Shape trade access, alliances, shortages, port rights, maritime law and the balance between factions. |

# 3. Explicit Non-Goals

- Creating an isolated stock-market minigame disconnected from physical production and settlement needs.
- Using one global price for every settlement, culture, season and world state.
- Simulating real-world macroeconomics, taxation law or naval doctrine beyond what supports readable gameplay.
- Teleporting cargo between ports because a route timer completed.
- Requiring players to manually enter every crate, wage or accounting line during ordinary play.
- Treating every ship travelling together as a permanent Fleet Instance.
- Granting naval dominance from vessel count without readiness, supply, geography, leadership or opposition.
- Assigning piracy, lawfulness, trade skill or naval culture by ancestry.
- Defining physical naval weapons, boarding controls, hull damage or sinking; these belong to 26L.
- Defining full fish populations, breeding, harvest sustainability or marine-resource rosters; these belong to 26M.
- Locking final commodity lists, price values, progression tiers or faction rosters before 26N and Atlas integration.
- Allowing inaccessible optional packs to become required for base progression or save recovery.

# 4. Source-of-Truth and Ownership Boundaries

| Question | Owning Authority | 26K Responsibility |
| --- | --- | --- |
| What goods exist and how are they produced? | 03-06, 24 and 25H-25J; detailed maritime additions in 26N. | Reference qualified IDs, cargo facets, sources and uses. |
| What does a settlement need or produce? | 07, 19-20 and Atlas settlement/culture content. | Create demand, surplus and contract opportunities from real state. |
| Where are oceans, ports and route corridors? | 26C and 26J, with Atlas authored context. | Bind trade routes and missions to valid endpoints and corridors. |
| What are the current wind, storm, tide, ice and visibility conditions? | 26D. | Consume forecasts and actual conditions in route and mission risk. |
| Can a vessel carry and complete the voyage? | 26F-26G. | Query capacity, certification, range, crew and loading constraints. |
| How is a vessel built, repaired or refitted? | 26H-26I and 26J shipyards. | Issue procurement and maintenance requirements; never spawn capability. |
| How does a port process a call? | 26J. | Supply contract, cargo, fleet and authority context to the Port Call. |
| How is a naval encounter physically resolved? | 26L. | Generate strategic encounter context and consume its authoritative outcome. |
| What marine resources may be harvested? | 26M. | Create market and fleet interfaces only after ecology authorises supply. |
| What unlocks, balances and registry rosters ship? | 26N and Set 25 governance. | Provide domain contracts, capability needs and validation evidence. |
| What is finally displayed, replicated and implemented? | 26O. | Declare requirements and preliminary service boundaries. |

> **Boundary Test**
>
> When a rule answers why goods or fleets move, who authorises them, what strategic mission exists, or how the regional economy reacts, 26K usually owns it. When it answers how a ship sails, how a port berths it, how a cannon damages it, or how fish spawn, another document owns the truth.

# 5. Canonical Terminology

| Term | Definition |
| --- | --- |
| Commodity Definition | Data definition for a tradable good or service category; it is not a physical stack. |
| Cargo Lot | Reserved quantity of one compatible item/resource family with ownership, source, quality, condition and provenance. |
| Manifest | Authoritative list of cargo, passengers, mail, restricted goods and declared ownership assigned to a vessel or voyage. |
| Cargo Transfer | Atomic or staged movement between authoritative inventories, vessel holds, port storage or recipients. |
| Maritime Contract | Persistent agreement for cargo, passenger, escort, patrol, supply, salvage or other maritime work. |
| Trade Route | Persistent relationship between valid maritime endpoints with route requirements, knowledge and legal context. |
| Route Instance | World/save binding of a route definition or generated connection with current state, traffic and history. |
| Sea Lane | Frequently used corridor or route family; not guaranteed safe or exclusive. |
| Voyage | One vessel or fleet movement from departure preparation through arrival or termination. |
| Maritime Enterprise | Persistent player/NPC/faction organisation operating vessels, contracts or services. |
| Fleet | Persistent mission-oriented organisation referencing two or more vessels, or one command vessel with attached support craft when the profile allows. |
| Flotilla/Convoy/Squadron | Mission/cultural labels mapped to Fleet Profiles; they do not create separate technical foundations by name alone. |
| Fleet Mission | Versioned mission definition plus runtime order, targets, route, constraints and completion conditions. |
| Readiness | Resolved ability of a vessel or fleet to perform a declared mission now. |
| Customs Declaration | Statement of cargo, passengers, origin, destination, permits and obligations presented to an authority. |
| Contraband | Good, passenger, knowledge or capability prohibited or restricted by a specific jurisdiction or treaty. |
| Smuggling | Intentional concealment or misdeclaration intended to bypass lawful inspection, access or obligation. |
| Piracy | Unauthorised maritime predation or coercion under the applicable political/legal context. |
| Privateer | Actor authorised by one power to conduct otherwise piratical actions against declared targets under a bounded commission. |
| Prize | Captured vessel or cargo subject to ownership, law, claim and physical custody. |
| Navy | Faction institution organised for maritime security, coercion, war or strategic protection. |
| Patrol Area | Defined spatial/route responsibility with schedule, detection and endurance requirements. |
| Blockade | Sustained mission to restrict maritime access to one or more endpoints or corridors. |
| Embargo | Political/economic rule restricting trade; enforcement may be diplomatic, customs-based or naval. |
| Maritime Influence | Evidence-based regional profile of access, commerce, logistics, security, intelligence, diplomacy, resilience and reach. |
| Interception Opportunity | Detected route/fleet convergence allowing an actor to attempt contact; physical resolution may become a 26L encounter. |

# 6. Record Architecture and Data Separation

| Record | Purpose | Authority/Mutability |
| --- | --- | --- |
| Commodity Definition | Trade-facing facets, categories, restrictions, quality/condition handling and market tags. | Versioned definition referencing item/resource IDs. |
| Cargo Lot | Reserved physical quantity, source, owner, quality, condition, container and provenance. | Persistent transactional runtime record. |
| Manifest | Voyage-facing cargo/passenger declaration and hold assignments. | Persistent runtime record tied to a vessel/voyage. |
| Maritime Contract Definition | Reusable objective, terms, required capabilities and settlement logic. | Versioned definition. |
| Maritime Contract Instance | Parties, cargo/service, route, deadlines, payment, obligations, state and history. | Persistent runtime state. |
| Route Definition | Reusable route family, requirements, endpoints or selection grammar. | Versioned definition. |
| Route Instance | World-bound endpoints, segments, legal context, knowledge, traffic, hazards and state. | Persistent generated/runtime binding. |
| Voyage Record | Departure, route, vessel/fleet, manifest, conditions, incidents and arrival/termination. | Persistent runtime/history record. |
| Enterprise Record | Organisation identity, ownership, reputation, policies, vessels, contracts and accounts. | Persistent runtime state. |
| Fleet Profile | Mission/category requirements, command, formation, readiness and LOD rules. | Versioned definition. |
| Fleet Instance | Members, commander, mission, route, supply, formation, authority, readiness and history. | Persistent runtime state. |
| Fleet Mission Order | Specific goal, target, constraints, rules of engagement and completion state. | Persistent runtime command record. |
| Piracy Organisation Record | Band identity, law status, haven, members, intelligence, targets, supplies and history. | Persistent faction/organisation runtime state. |
| Naval Command Record | Institutional command, jurisdiction, assets, doctrine, bases, budget/supply and current orders. | Persistent faction organisation state. |
| Blockade Record | Target endpoints, coverage, participating fleets, legality, endurance and effects. | Persistent event/mission state. |
| Treaty/Maritime Right Record | Passage, port, inspection, trade, escort, salvage, fishing or military rights. | Versioned or runtime political relationship. |
| Regional Maritime Profile | Derived capability and influence vectors with evidence and uncertainty. | Calculated/persisted summary; never sole authority. |
| Distant Route/Fleet Summary | Bounded stock, progress, risk, incidents and decision evidence. | Derived/persisted simulation state. |

## 6.1 Separation Rule

A Commodity Definition does not own a physical stack. A Cargo Lot does not decide market price. A Manifest does not grant vessel capacity. A Trade Route does not move goods. A Fleet Profile does not own vessels. A Fleet Instance does not override member condition. A Regional Maritime Profile summarises evidence but cannot create missing ports, fleets, treaties or supplies.

# 7. Maritime Economy and Resource-Conservation Model

Maritime trade extends the existing inventory, recipe, warehouse, settlement and automation economy. It does not introduce a second abstract resource pool. Every transferable good remains an item stack, block item, resource unit, creature/livestock record, passenger record, knowledge package or declared service output owned by its source system.

| Stage | Required Transaction Truth |
| --- | --- |
| Production/Acquisition | Goods exist in an authoritative source inventory or validated service output. |
| Offer | Seller or contracting authority exposes only available, permitted quantity and terms. |
| Reservation | Accepted quantity is reserved so local consumption, crafting or another contract cannot spend it. |
| Lot Creation | Compatible reserved stacks are represented by one or more Cargo Lots preserving source and quality. |
| Loading | Cargo Transfer moves quantity into compatible vessel holds or containers; mass and capacity recalculate. |
| Transit | Cargo condition, ownership and location move with the vessel or distant voyage summary. |
| Incident | Loss, theft, spoilage, contamination, damage or seizure changes the same Cargo Lot records. |
| Unloading | Cargo Transfer moves surviving quantity into destination storage or recipient custody. |
| Settlement | Payment, reputation, obligations, taxes and contribution resolve from delivered evidence. |
| Closure | Reservations release, manifests close and history records final quantities and causes. |

> **Conservation Rule**
>
> A completed maritime transaction must reconcile source quantity, loaded quantity, in-transit changes, delivered quantity and remaining or lost quantity. Any unexplained increase, disappearance or duplicate ownership is a release-blocking defect.

## 7.1 Currency, Barter and Obligations

- Currency is an item or account relationship owned by the broader economy and registry system; 26K does not define a universal mandatory coin.
- Contracts may use currency, barter, service exchange, tribute, debt, reputation, access rights or mixed compensation.
- Promises and credit require explicit parties, limits, due state, default consequences and save persistence.
- Distant simulation may aggregate identical payments, but it may not erase ownership or generate unlimited liquidity.
- World settings may simplify costs and obligations without changing cargo conservation.

# 8. Commodity, Cargo and Passenger Categories

| Category | Examples and Role | Required Handling Facets |
| --- | --- | --- |
| Dry Bulk | Ore, coal, grain, salt, sand, stone or timber chips. | Bulk compatibility, contamination, moisture, loading method and hold residue. |
| Packaged General Cargo | Tools, ingots, cloth, pottery, furniture or machine parts. | Container or stack form, fragility, theft value and transfer method. |
| Long or Heavy Cargo | Logs, beams, large machines, construction modules or siege parts. | Dimensions, securing points, deck or hold compatibility and handling equipment. |
| Perishable Cargo | Fresh food, medicine, plants or alchemical ingredients. | Spoilage rate, temperature, humidity, time and preservation. |
| Liquid Cargo | Freshwater, oil, fuel, alchemical liquid or mana solution. | Tank compatibility, leakage, purity, contamination and hazard rules. |
| Hazardous or Unstable Cargo | Explosives, poison, corruption, volatile mana or realm materials. | Separation, permits, containment, warning, risk and emergency response. |
| Living Cargo | Livestock, mounts, creatures or plants. | Space, food, water, ventilation, welfare, containment and mortality. |
| Passengers | Workers, migrants, soldiers, pilgrims, diplomats or travellers. | Capacity, accommodation, provisions, safety, permission and identity. |
| Mail and Knowledge | Letters, charts, research, orders, legal papers or cultural texts. | Confidentiality, ownership, discovery state and delivery evidence. |
| Treasure and High Value | Relics, gems, currency, artefacts or tribute. | Security, declaration, escrow and theft consequence. |
| Salvage and Wreck Material | Recovered components, cargo, logs or historical objects. | Claim, provenance, contamination, ownership and restoration restrictions. |
| Magical or Realm Cargo | Mana cores, ritual objects, portal materials or realm-sensitive goods. | Stability, warding, realm compatibility, legal or cultural restrictions and pack dependency. |

## 8.1 Cargo Facet Rule

An item becomes maritime cargo through declared facets and relationships, not through a duplicate maritime item. The same Iron Ingot remains the canonical item while a Cargo Lot records its quantity, owner, quality, source, container and voyage state.

# 9. Cargo Lots, Manifests, Ownership and Provenance

| Field Group | Required Fields |
| --- | --- |
| Identity | cargo_lot_id; commodity or item references; schema version; source pack. |
| Quantity and Form | quantity; unit; stack or container IDs; dimensions; mass; volume; batch or quality. |
| Ownership | legal owner; custodian; seller; buyer; lien or claim; theft or seizure state. |
| Origin | source settlement, structure or inventory; production or salvage record; creation transaction. |
| Destination | contract recipient; target storage; fallback destination; transfer permissions. |
| Condition | freshness; damage; contamination; purity; temperature; sealing; living-cargo state. |
| Legal State | declared category; permits; contraband by jurisdiction; customs status; treaty exemptions. |
| Security | lock or seal; guard requirement; concealment; risk category; inspection history. |
| Manifest Binding | voyage_id; vessel_id; hold or container assignment; load and unload records. |
| History | transfers; incidents; losses; splits or merges; final settlement and evidence. |

## 9.1 Split, Merge and Substitution

- Cargo Lots may split when transferred, sold, damaged or delivered in part; child lots preserve lineage.
- Lots may merge only when item identity, ownership, quality, condition, legal status and provenance rules allow it.
- Contract substitutions use declared capability or tag relationships and acceptance tolerances; the system cannot silently replace a requested good with unrelated stock.
- Manifest edits after clearance create an auditable change and may require reinspection.
- NPCs and players use the same cargo records and transaction rules.

# 10. Supply, Demand, Prices and Market Memory

Prices and trade opportunities reflect local world state rather than a universal catalogue. A settlement with grain surplus, damaged roads and a medicine shortage should value goods differently from a secure agricultural capital. Exact formulas and values remain balance work for 26N and implementation tuning, but the input model is locked here.

| Input | Effect |
| --- | --- |
| Physical and Reserved Stock | Available supply excludes protected needs, project reserves and other contracts. |
| Production and Consumption Trend | Sustained surplus or deficit changes offers gradually. |
| Settlement Needs | Provisions, Health, Work, Safety, Infrastructure, Housing and Morale may create demand. |
| Culture or Faction Preference | Approved preferences alter demand, legality or prestige without overriding survival truth. |
| Quality, Freshness and Provenance | Better, trusted or culturally valued goods may command different terms. |
| Distance and Handling | Travel time, loading, crew, maintenance, fuel and preservation add cost. |
| Route Risk | Storms, piracy, war, blockades, monsters and unreliable ports affect willingness and reward. |
| Access and Law | Tariffs, embargoes, permits, faction standing and smuggling risk alter legal terms. |
| Recent Transactions | Market memory dampens instant oscillation and prevents repetitive infinite-profit loops. |
| World Events | Famine, festivals, construction, migration, war, disaster and realm events create bounded shocks. |
| Information Confidence | Displayed estimates include age and confidence; unknown markets do not reveal exact future prices. |

> **Market Integrity Rule**
>
> Price differences must correspond to actual demand, supply, access, quality, risk or policy. Buying and immediately reselling the same unchanged lot through a closed loop must not create infinite value after fees, capacity and market memory are considered.

## 10.1 Market Presentation

- Players see ranges, trends, known causes, confidence and legal warnings rather than unexplained exact predictions.
- Accessibility or world settings may expose clearer estimates or simplified stable prices.
- NPC traders may act on incomplete or biased information, but their knowledge source must be recorded.
- Critical settlement shortages remain visible even when no profitable contract is offered.

# 11. Freight, Trade, Passenger and Service Contracts

| Contract Family | Primary Purpose | Distinct Requirements |
| --- | --- | --- |
| Sale or Purchase | Transfer ownership of specified goods at source or destination. | Quantity, quality, terms, custody and acceptance. |
| Freight | Transport another party's cargo for compensation. | Manifest, custody, route, deadline and loss or damage terms. |
| Charter | Hire vessel or capacity for a period or mission. | Vessel capability, crew, authority, permitted use and return state. |
| Passenger Passage | Transport identifiable passengers or cohorts. | Accommodation, provisions, safety, destination and consent or authority. |
| Migration or Refugee Movement | Relocate households or populations. | Settlement acceptance, welfare, capacity, event consequences and identity preservation. |
| Escort or Convoy | Protect or accompany specified vessels or route. | Rendezvous, formation, schedule, threat rules and completion evidence. |
| Patrol or Search | Observe and act within a declared area. | Jurisdiction, detection capability, endurance and reporting. |
| Supply or Relief | Deliver critical stock to a settlement, fleet or structure. | Priority, reservation, emergency access and partial-success rules. |
| Smuggling | Move restricted cargo or people covertly. | Concealment, contact, inspection risk and criminal consequences. |
| Privateering or Bounty | Pursue authorised targets or recover prizes. | Commission, target scope, expiry, evidence and prize law. |
| Salvage or Tow | Recover, stabilise or move vessels or cargo. | Claim, hazard, equipment, custody and 26H work interface. |
| Exploration or Survey | Chart routes, hazards, regions or realm paths. | Knowledge objectives, instruments, reporting and discovery rights. |

## 11.1 Contract Lifecycle

| State | Meaning |
| --- | --- |
| Generated or Offered | Valid world condition creates an offer with parties and evidence. |
| Negotiating | Terms, substitutions, route, risk, payment and authority may change. |
| Accepted | Parties commit; required resources or capacity may be reserved. |
| Preparing | Cargo, crew, vessel, permissions, charts and schedule are assembled. |
| Active | Voyage or service has begun and authoritative progress is tracked. |
| Paused or Blocked | A named requirement prevents progress without erasing obligations. |
| Completed | Acceptance evidence and settlement transactions pass. |
| Partial | Declared partial-delivery or rescue terms resolve. |
| Failed or Breached | A party, deadline or condition failed; consequences and follow-up persist. |
| Cancelled or Transferred | Authority-approved cancellation or transfer records costs and custody. |
| Disputed | Ownership, loss, delivery or legality requires law, diplomacy, quest or evidence resolution. |

# 12. Maritime Routes, Lanes, Segments and Endpoints

Routes bind valid endpoints through a sequence of navigable segments. They may be generated, discovered, culturally known, charted by players, maintained by factions or temporarily opened by events. A route does not imply guaranteed safety or permanent access.

| Route Layer | Purpose |
| --- | --- |
| Endpoint | Port Node, anchorage, resource site, fleet rendezvous, realm gate or approved specialist destination. |
| Approach Segment | 26J-managed access from open route to berth or anchorage. |
| Local Water Segment | River, lake, canal, coast or archipelago movement with specific constraints. |
| Open-Water Segment | Longer sea or ocean movement using 26C route graph and 26D conditions. |
| Chokepoint Segment | Narrow strait, channel, lock, reef pass, ice opening or realm corridor with strategic value. |
| Transfer Segment | Cargo or passenger transition between vessel classes, river and ocean systems or land logistics. |
| Realm Segment | Portal or dimension-linked route requiring stability, rights and vessel compatibility. |
| Fallback or Refuge Segment | Safe harbour, anchorage or alternate path used when primary route closes. |

## 12.1 Route Requirements

- Vessel size, draft, propulsion, range and environmental certification.
- Crew and navigation capability plus charts or local knowledge.
- Expected tides, currents, winds, storms, ice and visibility windows.
- Port rights, jurisdiction, permits, embargoes and faction relationships.
- Provisioning, fuel or mana, repair and refuge requirements.
- Known threat, piracy, war, creature and hazard profiles.
- Cargo-specific preservation, containment and time constraints.
- Optional pack or realm dependencies and fallback behaviour.

# 13. Route Knowledge, Charts, Intelligence and Confidence

| Knowledge Source | What It Provides | Limit |
| --- | --- | --- |
| Direct Travel | Observed segments, depths, hazards, ports and travel times. | May become stale after storms, works, war or seasons. |
| Charts and Pilot Books | Authored or recorded route guidance and hazard notes. | Quality, date, culture and copying errors matter. |
| Port Information | Berths, services, closures, prices, laws and departures. | 26J authority; may be incomplete or controlled. |
| Weather and Tide Forecasts | Expected environmental windows. | 26D confidence and forecast horizon. |
| Merchant Reports | Demand, traffic, danger and route profitability. | May be biased, delayed or commercially sensitive. |
| Scouts and Patrols | Sightings, pirate activity, blockades and fleet movement. | Coverage, detection and reporting delay. |
| Magic or Divination | Specialist information on weather, ships, routes or realms. | Mana, risk, countermeasures, law and progression. |
| Rumours and Spies | Potential opportunities, plans or hidden routes. | Uncertain, deceptive or politically manipulated. |

## 13.1 Confidence States

| State | Meaning |
| --- | --- |
| Unknown | No usable information. |
| Rumoured | Unverified claim or approximate location. |
| Observed | Direct evidence with limited coverage. |
| Charted | Mapped route or endpoint with known date and quality. |
| Current | Recently verified operational information. |
| Degraded | Known but stale, damaged or affected by major change. |
| Compromised | Evidence may be false, manipulated or intercepted. |

> **Information Rule**
>
> AI and UI must not use omniscient route, cargo, price or fleet knowledge unless the world setting explicitly enables it. Decisions record the knowledge evidence available at the time.

# 14. Voyage and Trade Transaction Lifecycle

1. Identify a valid opportunity, contract, mission or self-directed destination.
2. Resolve route options and required knowledge confidence.
3. Select a vessel or fleet whose certification, capacity and range fit the mission.
4. Resolve crew, command, watch, provisions, fuel or mana, repair stock and permits.
5. Reserve cargo or passengers and create Cargo Lots and a draft Manifest.
6. Open the 26J Port Call and execute authoritative loading and clearance transactions.
7. Commit departure only after route, weather window, berth, crew and vessel readiness pass.
8. Simulate physical or distant travel while preserving progress, cargo, condition and decisions.
9. Generate bounded environmental, economic, social, creature, piracy or political incidents.
10. Promote to a physical encounter when players or high-detail conditions require it.
11. Arrive through a valid Port Call, anchorage or specialist endpoint.
12. Unload, inspect, accept, settle payment or obligations and update market or settlement state.
13. Record voyage history, losses, discoveries, reputation, route knowledge and follow-up events.

## 14.1 Voyage Outcomes

| Outcome | Required Result |
| --- | --- |
| Successful | Cargo, passengers or services are accepted and terms and histories settle. |
| Delayed | Time and condition consequences apply while voyage remains active. |
| Diverted | Fallback endpoint and reason are recorded and contract terms reevaluate. |
| Partial Delivery | Delivered and missing quantities reconcile separately. |
| Seized or Captured | Custody and claim transfer through law or combat outcome; nothing is deleted. |
| Abandoned | Vessel, cargo and passenger state persist at a valid world location or summary. |
| Lost | Physical or distant evidence records cause, salvage possibility and world consequences. |
| Disputed | Contract remains unresolved pending law, diplomacy, quest or evidence. |

# 15. Merchant Operations, Guilds and Maritime Enterprises

| Enterprise Model | Characteristics |
| --- | --- |
| Independent Captain | One vessel or small partnership; flexible contracts and personal reputation. |
| Player Maritime Company | Player-owned organisation with vessels, employees, policies, routes and stock permissions. |
| Settlement Fleet | Community-owned vessels serving local trade, fishing, ferries, relief or defence. |
| Merchant Guild or League | Member organisation coordinating standards, information, convoys and political influence. |
| Faction Trading Company | State or faction-backed enterprise with privileges, obligations and geopolitical goals. |
| Temple or Scholarly Expedition | Mission-led organisation moving pilgrims, knowledge, relics or researchers. |
| Relief or Rescue Organisation | Non-commercial fleet prioritising emergencies and public service. |
| Criminal or Smuggling Network | Covert enterprise using contacts, hidden storage, corruption and illicit routes. |

## 15.1 Enterprise State

- Identity, ownership, members, headquarters or home ports and authorised representatives.
- Vessels, crews, route licences, contracts, warehouses and service relationships.
- Policies for risk, legal compliance, cargo priorities, wages, maintenance and emergency aid.
- Reputation by settlement, culture, faction, guild and criminal network.
- Accounts and obligations referencing real payments, debt, taxes, tribute and contract state.
- History of voyages, losses, rescues, crimes, disputes, treaties and organisational changes.
- Promotion and dissolution rules preserving assets, contracts and people.

> **Enterprise Rule**
>
> An enterprise may coordinate ownership and policy, but it cannot merge all vessel inventories, crews or condition into one untraceable pool.

# 16. Fleet Architecture and Persistent Fleet Records

A Fleet Instance exists when vessels deliberately operate under a shared command, mission and coordination contract. Vessels passing near each other or using the same route remain independent unless grouped by an authoritative action or generated mission.

| Fleet Field Group | Required Data |
| --- | --- |
| Identity | fleet_id; name; profile; source organisation; founding event; lifecycle state. |
| Authority | owner or sponsor; commander; delegated officers; command hierarchy; legal status. |
| Membership | vessel IDs; attached craft; crew IDs; temporary members; join and leave history. |
| Mission | mission order ID; objectives; targets; route; schedule; completion and failure rules. |
| Formation | relative roles or positions; spacing; speed policy; signal plan; regroup rules. |
| Readiness | member readiness; supply; repairs; crew; charts; weather; mission capability. |
| Logistics | home and support ports; tenders; resupply plan; maintenance windows; prize or cargo handling. |
| Engagement Policy | contact, avoidance, inspection, escort, surrender, pursuit or force constraints; tactical execution is deferred to 26L. |
| Knowledge | known routes; sightings; target intelligence; confidence; last update. |
| LOD State | physical members; abstract members; current route segment; promotion triggers. |
| History | voyages, contacts, losses, captures, rescues, reputation and dissolution. |

## 16.1 Fleet Lifecycle

| State | Meaning |
| --- | --- |
| Proposed | Organisation plans a fleet but members and orders are not committed. |
| Assembling | Vessels travel to rendezvous and prepare. |
| Ready | Minimum mission readiness and command are satisfied. |
| Active | Fleet operates under a committed mission. |
| Dispersed | Members are separated but fleet identity and order remain recoverable. |
| Regrouping | Members seek rendezvous under declared rules. |
| Degraded | Loss, damage, shortage or command failure limits mission. |
| Interned or Impounded | Authority prevents lawful departure or operation. |
| Captured or Defected | Control relationship changes through authoritative outcomes. |
| Completed | Mission ends and members may return or receive new orders. |
| Dissolved | Organisation closes while vessels, crews and history retain identity. |

# 17. Fleet Types, Mission Profiles and Doctrine

| Fleet or Mission Family | Typical Purpose | Key Capabilities |
| --- | --- | --- |
| Merchant Convoy | Move valuable cargo or passengers through shared risk. | Scheduling, cargo compatibility, escort or communication and refuge. |
| Ferry or Transport Group | Regular local movement of people, livestock or goods. | Reliable route, safe capacity, timetable and port turnaround. |
| Fishing or Harvest Fleet | Coordinate approved marine harvesting and landing. | 26M ecology permission, storage, preservation and weather limits. |
| Exploration Expedition | Survey regions, routes, ruins or realm access. | Navigation, endurance, research, rescue and specialist vessels. |
| Relief or Evacuation Flotilla | Deliver aid or remove people from danger. | Capacity, medical, priority access, supplies and settlement coordination. |
| Salvage or Towing Group | Recover wrecks, cargo or disabled vessels. | 26H tools, claims, tow capability and hazard support. |
| Escort Force | Protect named vessels, a route or an event. | Detection, endurance, signals, response and later 26L capability. |
| Customs or Coast-Guard Patrol | Inspect, rescue, enforce access and deter crime. | Jurisdiction, detection, boarding intent and legal evidence. |
| Pirate Band | Predate, extort, raid or seize prizes. | Intelligence, concealment, haven, pursuit and sale or ransom network. |
| Privateer Squadron | Attack commission-approved targets. | Valid authority, target identification, prize rules and reporting. |
| Naval Patrol or Squadron | Secure routes, escort, show force or interdict. | Command, logistics, intelligence, readiness and combat capability. |
| Blockade Force | Restrict access to endpoints or chokepoints. | Coverage, endurance, detection, resupply and political authority. |
| Invasion or Occupation Fleet | Move military force and sustain operations. | Transport, escort, supply, landing support and 26L or ground-system integration. |

## 17.1 Doctrine as Data

Doctrine is a policy or profile that influences vessel selection, formation, risk tolerance, logistics, contact response and mission priorities. It does not directly add statistics or guarantee victory. Culture, faction, commander, experience, scarcity and current orders may layer doctrine within declared precedence rules.

# 18. Fleet Membership, Formation, Command and Signals

| Layer | Rule |
| --- | --- |
| Membership Admission | Vessel certification, owner permission, mission compatibility, crew readiness and rendezvous must pass. |
| Command Vessel | Optional; command may be shore-based, distributed or assigned to a designated vessel. |
| Role Assignment | Lead, cargo, escort, scout, tender, medical, transport, salvage or specialist roles reference actual capability. |
| Formation | Relative positions are guidance or AI goals using 26G movement; they are not rigid physical attachments. |
| Speed Policy | Fleet may use slowest-member, staggered, split-group or priority-vessel policies. |
| Signals | Flags, lights, horns, messengers, magic or other culture and faction profiles convey orders with range, delay and failure. |
| Command Loss | Succession rules, delegated authority and mission policy determine behaviour; the fleet does not become instantly mindless. |
| Separation | Weather, damage, combat or navigation may split members; regroup and fallback rules apply. |
| Join or Leave | Membership changes are transactional and cannot duplicate mission rewards or cargo custody. |

## 18.1 Player Control Boundary

- Players may personally command one vessel while issuing high-level orders to the fleet.
- Detailed helm and station control remain 26G and 26J systems.
- Fleet AI may execute formation, rendezvous, escort and route goals but cannot invent fuel, repairs, charts or legal authority.
- Optional tactical assistance may simplify formation and signals without changing authoritative outcomes.
- In multiplayer, command rights, vessel ownership and mission authority are explicit and recoverable after disconnect.

# 19. Fleet Readiness, Supply, Maintenance and Endurance

| Readiness Domain | Evidence |
| --- | --- |
| Member Availability | Required vessels are present, not reserved elsewhere and operational. |
| Vessel Suitability | Capacity, certification, range, speed, handling and equipment fit the mission. |
| Crew and Command | Safe or effective manning, officers, watches, health, morale and command succession. |
| Provisions | Food, water, medicine and accommodation for expected duration plus reserve policy. |
| Power, Fuel or Mana | Propulsion and specialist systems have supply and compatible storage. |
| Maintenance | Condition, spares, tools, repair stock and shipyard requirements. |
| Cargo or Passenger State | Loads fit mass, volume, segregation, safety and contract requirements. |
| Knowledge | Route, weather, tide, target and legal information meet confidence requirements. |
| Access and Law | Departure, passage, port, commission and mission authority are valid. |
| Communication | Signals and reporting support command at intended separation. |
| Resilience | Refuge, tow, rescue, medical and fallback plans fit declared risk. |

## 19.1 Readiness Outcomes

| State | Meaning |
| --- | --- |
| Mission Ready | All mandatory requirements pass. |
| Conditionally Ready | Declared limits, warnings or accepted risk apply. |
| Degraded Ready | Mission can proceed with measurable performance or coverage reduction. |
| Blocked | One or more hard requirements fail. |
| Unknown | Evidence is stale, unavailable or unvalidated. |

> **Readiness Rule**
>
> A fleet-level readiness summary must expose member-level blockers and cannot hide an uncrewed, overloaded, damaged or inaccessible vessel behind stronger members.

# 20. Convoys, Escorts, Scheduling and Shared Risk

Convoys coordinate departure, route, information and mutual support. They reduce some risks while increasing visibility, congestion and scheduling cost. Escort capability affects detection, deterrence and response, not guaranteed immunity.

| Convoy Element | Contract |
| --- | --- |
| Rendezvous | Defined place and window, joining conditions and late-member policy. |
| Manifest Summary | Cargo or passenger risk categories without exposing hidden details to unauthorised members. |
| Sailing Order | Lead, centre, flank, rear, scout and support roles appropriate to the route. |
| Speed and Separation | Maximum spacing, regroup conditions and split policy. |
| Threat Response | Avoid, signal, regroup, flee, negotiate or promote to a 26L encounter under mission policy. |
| Port Coordination | Berth and service reservation and staggered Port Calls use 26J capacity. |
| Contribution | Escort time, risk, rescue, delivery and losses are recorded per participant. |
| Termination | Destination, route split, emergency refuge or mission cancellation closes shared state. |

## 20.1 Escort Compensation

Escort payment may be fixed, time-based, cargo-value-based, risk-based, contribution-based or politically funded. The contract must avoid rewarding duplicate membership or counting the same protected delivery multiple times.

# 21. Distant Fleet and Route Simulation

Distant simulation preserves the same logical stages as physical play while replacing per-frame movement, individual crate actors and routine NPC actions with bounded steps. It is not a separate rule set and cannot produce outcomes that a promoted physical fleet could not reconcile.

| Summary Domain | Preserved State |
| --- | --- |
| Identity | Vessels, crews, fleet, enterprise, contracts and route IDs. |
| Progress | Route segment, distance or time progress, schedule and weather window. |
| Cargo | Lot quantities, condition, ownership, manifest and hold or container assignment. |
| Resources | Provisions, fuel or mana, repair stock, ammunition interfaces and consumables. |
| Condition | Vessel damage summary, crew health, fatigue, morale and maintenance state. |
| Knowledge | Available charts, forecasts, sightings and decision confidence. |
| Decision Evidence | Mission policy, chosen response, random seed, modifiers and reason codes. |
| Incidents | Event IDs, outcomes, losses, diversions, contacts and unresolved encounter hooks. |
| Authority | Owner, commander, legal status, permits, treaties and multiplayer locks. |

## 21.1 Promotion and Reconciliation

- Promotion occurs near players, important events, tactical encounters, detailed ports, rescue or authored scenes.
- The system reconstructs vessel transforms and formation from route and local-water context without changing cargo totals.
- Any unresolved high-impact incident becomes a physical or explicit decision event rather than a hidden roll.
- Demotion requires stable movement, no active player station, no unresolved transfer or combat and serialisable member state.
- Reconciliation failure quarantines the affected voyage or fleet instead of guessing or duplicating resources.

# 22. Fishing, Harvest and Ecological Boundary

26K owns the commercial and fleet-management interface for fishing and marine harvesting, but Document 26M owns species, habitats, population pressure, migration, seasons, sustainable yield and ecological consequences.

| 26K May Define | 26K Must Receive from 26M |
| --- | --- |
| Fishing fleet organisation, contracts, route scheduling and port landing. | Valid target species or resource IDs and harvest methods. |
| Cargo preservation, market demand and crew or vessel requirements. | Population availability, season, habitat, legal or ecological limits and bycatch. |
| Quota or permit relationship and enforcement interface. | Sustainable thresholds, depletion and recovery state. |
| Trade consequences of good or poor catches. | Actual catch yield, condition, ecosystem effects and creature encounters. |

> **Ecology Rule**
>
> No trade demand, fleet size or faction policy may create marine resources that 26M reports as unavailable. Overharvest may remain a player or faction choice, but its physical and ecological consequences must persist.

# 23. Customs, Declarations, Tariffs and Inspection

| Function | Requirement |
| --- | --- |
| Entry Declaration | Vessel, crew or passengers, origin, destination, cargo categories, ownership and purpose. |
| Cargo Declaration | Manifest or authorised summary with permits and exemptions. |
| Inspection Selection | Risk, law, intelligence, history, random policy and capacity determine inspection. |
| Physical Inspection | Reachable holds and containers, seals, papers and specialist detection; no omniscient scan by default. |
| Tariff or Duty Assessment | Jurisdiction-specific terms referencing declared or detected goods and treaty rights. |
| Quarantine or Health | 26J medical and quarantine service plus cargo or passenger risk profiles. |
| Seizure or Hold | Authority creates custody and evidence records; goods are not deleted. |
| Appeal or Dispute | Dialogue, reputation, law, diplomacy, bribery or corruption and quest systems may resolve. |
| Clearance | Port Call and route access update only after required actions complete. |

## 23.1 Tariff Philosophy

- Tariffs are policy and economy inputs, not unavoidable busywork for every small transaction.
- World settings may simplify or disable detailed customs while preserving ownership and contraband state.
- Treaties, citizenship, guild status, emergency relief and faction standing may alter terms through explicit relationships.
- Corruption and bribery are faction or NPC behaviours with evidence and consequences, not universal shortcuts.
- Customs capacity is physical and staffed through 26J; an overwhelmed port may inspect less effectively.

# 24. Contraband, Smuggling and Concealment

| Smuggling Layer | Examples |
| --- | --- |
| Restricted Cargo | Forbidden magic, weapons, protected artefacts, untaxed goods, stolen cargo or disease-risk items. |
| Restricted Passenger | Fugitives, spies, deserters, refugees under hostile law, banned specialists or captured people. |
| Restricted Knowledge | Maps, military orders, rituals, research or faction secrets. |
| Concealment | Hidden compartments, false containers, camouflage, forged papers, magical masking or route avoidance. |
| Network Support | Contacts, corrupt officials, covert berths, safe houses, fences and secret routes. |
| Detection | Inspection skill, intelligence, seals, scent, magic, weight or volume discrepancy and behaviour. |
| Consequences | Fines, seizure, arrest, reputation, access loss, faction reaction, quest or conflict escalation. |

## 24.1 Fairness and Explainability

- Concealment and detection use declared capabilities, evidence and uncertainty rather than arbitrary discovery.
- The UI communicates known risk and inspection strength without revealing hidden random outcomes.
- Players may choose legal alternatives, bribery, diplomacy, stealth, force or route changes where fiction permits.
- Smuggling success does not erase contraband provenance or future investigation.
- NPC smugglers use the same capacity, route, law and detection rules as players.

# 25. Piracy Identity, Motives and Lifecycle

Piracy is a legal-political classification applied to unauthorised maritime predation. It may be temporary, disputed, local or faction-wide. A crew considered pirates by one authority may be rebels, privateers, freedom fighters, raiders or legitimate naval auxiliaries elsewhere.

| Lifecycle State | Meaning |
| --- | --- |
| Emergent Predation | Individuals or crews begin opportunistic theft or extortion under pressure or opportunity. |
| Band Formation | Persistent organisation, leader, vessels, haven, contacts and target policy form. |
| Established Network | Intelligence, fences, recruitment, supply and multiple vessels support repeated operations. |
| Territorial Pressure | Band controls or threatens routes, anchorages, islands or coastal communities. |
| Political Alignment | Band allies, rebels, receives sponsorship, becomes privateer force or negotiates recognition. |
| Suppressed or Dispersed | Loss of vessels, haven, leadership, market or support reduces operations. |
| Reformed or Integrated | Members receive amnesty, employment, settlement or lawful commission. |
| Escalated Power | Band becomes a pirate polity, faction navy or regional authority where Atlas and politics support it. |
| Destroyed or Dissolved | Organisation ends while survivors, wrecks, claims and history persist. |

## 25.1 Motive Families

| Motive | Potential Behaviour |
| --- | --- |
| Survival or Scarcity | Steal food, water, medicine, fuel or repair materials. |
| Profit | Target valuable cargo, ransom, prizes and smuggling. |
| Political Rebellion | Attack a state, tax routes, aid allies or disrupt occupation. |
| Cultural Tradition | Conduct approved raiding under culture or faction law; still contextual and contestable. |
| Revenge | Target a settlement, company, faction or named vessel. |
| Religious or Magical Goal | Seize relics, prevent forbidden trade or serve a cult or power. |
| State Sponsorship | Operate covertly or under privateering commission. |
| Player Organisation | Follow declared policies, reputation and member decisions. |

> **Identity Rule**
>
> Pirate status is attached to actions, organisation, jurisdiction and political recognition. It is never inherited from ancestry, creature category, vessel silhouette or a permanent universal morality tag.

# 26. Pirate Havens, Intelligence, Fences and Support Networks

| Support Element | Function |
| --- | --- |
| Haven or Hidden Anchorage | Shelter, repair, recruitment, storage and reduced detection; must exist physically or as a valid distant site. |
| Fence or Black Market | Converts stolen or contraband goods into trade opportunities under risk and demand. |
| Informants or Spotters | Report routes, cargo, patrols and departure schedules with confidence and delay. |
| Suppliers | Provide food, water, weapons interfaces, fuel, rope, medicine and replacement crew. |
| Corrupt Officials | Manipulate inspections, records, warnings or access under NPC and faction consequence rules. |
| Sympathetic Settlements | Offer refuge, recruits, information or political legitimacy. |
| Prisoner or Ransom Network | Holds and negotiates identifiable captives subject to personhood and quest systems. |
| Salvage or Repair Capacity | Uses 26H and 26J facilities or improvised work; cannot restore vessels without resources. |
| Signal or Communication Network | Coordinates sightings, rendezvous and warnings. |

## 26.1 Haven Vulnerability

A pirate organisation weakens when its havens, fences, suppliers, intelligence or political protection are lost. Clearing one vessel spawn is not sufficient to erase an established network, while eliminating a tiny opportunistic band need not create an endless replacement faction.

# 27. Pirate Threat Generation and Target Selection

| Input | Effect on Target Selection |
| --- | --- |
| Cargo Value and Type | High-value, scarce, ransom-worthy or needed supplies attract different motives. |
| Vessel Vulnerability | Speed, escort, crew, condition, visibility and route predictability affect opportunity. |
| Route Knowledge | Pirates require sightings, informants, patrol gaps or habitual traffic. |
| Distance to Haven | Endurance, repair and escape limits reduce viable targets. |
| Law or Patrol Pressure | Strong detection and response can deter, redirect or increase desperation. |
| Faction Relations | Allies, sponsors, declared enemies and protected groups change target policy. |
| Weather and Geography | Fog, islands, chokepoints, currents and storms create ambush or avoidance opportunities. |
| Reputation and History | Prior resistance, ransom, tribute, revenge and player actions influence behaviour. |
| Needs and Organisation State | Shortage, recruitment, leadership and strategic goals alter priorities. |

## 27.1 Threat Escalation

| Level | Typical Evidence |
| --- | --- |
| Rumour | Missing cargo, distant sightings or unreliable reports. |
| Local Predation | Single craft or small band targets weak traffic. |
| Route Pressure | Repeated attacks, extortion or avoidance changes traffic. |
| Organised Campaign | Multiple vessels, intelligence and a haven network pursue policy. |
| Regional Crisis | Ports, trade, settlement supply and faction diplomacy are significantly affected. |

> **Spawn Boundary**
>
> 26K may request a valid pirate vessel or fleet from approved definitions and world-state conditions. It may not spawn attackers directly beside a target, ignore 26I or 26J procurement rules without an explicit authored or worldgen provenance, or replace established organisation state with random waves.

# 28. Prize Taking, Ransom, Extortion and Reputation

| Action | Strategic Contract | 26L Boundary |
| --- | --- | --- |
| Demand Tribute or Toll | Offer terms, deadline, legal context and reputation consequences. | Communication and any resulting combat execution. |
| Demand Surrender | Declare desired vessel, cargo or person custody and acceptable response. | Boarding, resistance, physical capture and damage. |
| Seize Cargo | Create claim and custody transfer for physically controlled lots. | How holds are reached and defended. |
| Take Vessel as Prize | Create provisional prize claim, prize-crew requirement and destination. | Physical disabling, boarding and capture. |
| Ransom Captives or Vessel | Create identifiable custody, negotiation and exchange terms. | Combat injuries and tactical rescue. |
| Extort Route or Settlement | Apply threatened recurring demand through event or contract state. | Any assault or siege action. |
| Release or Parole | Record agreement, reputation and future obligations. | Physical transfer or release scene where required. |

## 28.1 Ownership and Evidence

- Control is not automatic legal ownership; prize status depends on applicable law, commission, recognition and custody.
- Stolen cargo retains original provenance and claim relationships even after fencing or resale.
- Captives remain persistent people, never cargo stacks.
- Reputation changes distinguish cruelty, restraint, reliability, betrayal, rescue and political context.
- World settings may reduce capture and ransom complexity while preserving personhood and inventory conservation.

# 29. Privateering, Letters of Marque and State Sponsorship

| Commission Field | Requirement |
| --- | --- |
| Issuer | Recognised faction, government or authority with power to grant the commission. |
| Holder | Enterprise, captain, fleet or named organisation. |
| Targets | Specific factions, flags, routes, cargo classes or periods; no universal attack permission. |
| Territory or Waters | Where the commission is recognised or claimed to apply. |
| Permitted Actions | Interception, inspection, seizure, destruction or escort as explicitly declared. |
| Prize Rules | Reporting, custody, adjudication, shares and prohibited conduct. |
| Duration | Start, expiry, revocation and wartime or diplomatic dependencies. |
| Evidence | Logs, witnesses, captured papers, manifests and encounter outcomes. |
| Consequences | Other factions may still classify the holder as pirate or enemy. |

## 29.1 Revocation and Abuse

A revoked or exceeded commission changes legal status but does not rewrite past actions. Privateers may become pirates, naval auxiliaries, merchants, prisoners or political actors depending on choices and recognition.

# 30. Naval and Maritime-Security Institutions

| Institution | Primary Responsibilities |
| --- | --- |
| Harbour Guard | Local berth, waterfront and immediate port security under 26J authority. |
| Customs Service | Cargo and passenger inspection, tariffs, seizures and records. |
| Coast Guard or Maritime Watch | Rescue, patrol, law enforcement, navigation safety and coastal defence. |
| River or Canal Patrol | Protect inland waterways, ferries, locks and trade. |
| Faction Navy | Strategic defence, war, escort, blockade, projection and major patrol. |
| Private or Guild Security | Contract escort, convoy protection and asset defence. |
| Religious or Magical Order | Protect sacred routes, realm gates, pilgrims or dangerous cargo under approved lore. |
| Militia or Levy Fleet | Temporary locally supplied vessels and crews with limited readiness. |
| Allied or Coalition Command | Coordinates multiple factions under treaty and shared mission. |

## 30.1 Institutional Requirements

- Political authority and declared jurisdiction.
- Funding, taxation, tribute, guild contribution or another real support relationship.
- Ports and bases with provisioning, repair and crew administration.
- Approved vessels, construction history, crews, officers and training.
- Doctrine, command, records, signals and rules of engagement.
- Intelligence, charts, patrol areas and reporting.
- Recruitment legitimacy, morale and faction or civilian response.
- Persistent consequences for defeat, abuse, shortage, mutiny or political change.

> **Institution Rule**
>
> A faction tag such as naval_power may summarise an achieved capability, but it cannot create fleets, readiness, supply or control by itself.

# 31. Patrols, Interdiction, Pursuit and Search

| Mission Phase | Strategic Logic |
| --- | --- |
| Assignment | Authority, area or route, targets, duration and permitted actions are declared. |
| Preparation | Vessels, crews, supply, intelligence and support ports pass readiness. |
| Patrol | Fleet follows route or pattern with detection checks based on real sensors, visibility and knowledge. |
| Contact Classification | Unknown, merchant, ally, suspect, pirate, enemy, distress or hazard with confidence. |
| Challenge or Inspection Intent | Signal, request identity, order stop or diversion, or escort. |
| Pursuit or Evasion | 26G movement and route choices determine interception opportunity. |
| Encounter Promotion | Physical 26L encounter begins when force, boarding or combat is required. |
| Resolution | Consume encounter, inspection, surrender or escape outcome. |
| Report and Follow-Up | Update knowledge, law, reputation, bounty, route safety and mission state. |

## 31.1 Detection Principles

- Detection depends on distance, visibility, vessel signature, lights, smoke, magic, lookout skill, terrain and intelligence.
- Identification is separate from detection and may remain uncertain.
- Fleets cannot pursue indefinitely without endurance, route knowledge and support.
- Players receive readable cues and uncertainty while hidden information remains possible.
- Distant patrol results retain the same evidence and may promote high-impact contacts.

# 32. Naval Bases, Logistics, Recruitment and Procurement

| Support Domain | Required Foundation |
| --- | --- |
| Basing | 26J Port or Facility capability, berths, security, administration and access. |
| Procurement | 26I approved designs, 26H construction and real material and labour budgets. |
| Repair and Refit | 26J service capacity and 26H work execution. |
| Crew | 26J recruitment, contracts, training, housing, health and safe manning. |
| Supply | Food, water, fuel or mana, medicine, tools, spares and mission-specific cargo. |
| Command and Records | Offices, signals, charts, orders, archives and legal authority. |
| Intelligence | Scouts, reports, signals, spies and route observation. |
| Reserve and Mothball | Lay-up, readiness tiers, reactivation cost and condition decay. |
| Allied Support | Treaty-defined port and supply rights. |

## 32.1 Procurement Choice

Naval procurement selects vessel families based on mission capability, geography, available materials, shipyard limits, doctrine, crew availability, maintenance burden and political priorities. It may not simply select the highest tier or largest hull.

# 33. Blockades, Embargoes, Chokepoints and Access Denial

A blockade is a sustained strategic mission, not an instant port-off switch. Its effectiveness depends on location, coverage, detection, endurance, opposition, weather, alternate routes, port geography and political legitimacy.

| Blockade Domain | Evidence |
| --- | --- |
| Target | Port Node, harbour approaches, strait, canal, realm gate or route segment. |
| Authority or Legality | Issuer, war or treaty state, recognition and neutral-faction response. |
| Coverage | Fleet positions, patrol intervals, detection range and gaps. |
| Endurance | Provisioning, crew fatigue, maintenance, storms and resupply. |
| Interception Capability | Speed, route knowledge, signals and readiness; combat is deferred to 26L. |
| Alternatives | Hidden routes, land transfer, small craft, magic, neutral ports or smuggling. |
| Port Response | Rationing, storage, escorts, defence interfaces, diplomacy and relief. |
| Economic Effects | Reduced traffic, higher risk, shortages, price changes and contract generation. |
| Political Effects | Neutral anger, alliance pressure, surrender, escalation or propaganda. |

## 33.1 Blockade Effectiveness States

| State | Meaning |
| --- | --- |
| Declared | Political state exists but physical enforcement is not established. |
| Partial | Some traffic is deterred or intercepted while meaningful gaps remain. |
| Effective | Most eligible traffic faces credible interception under current conditions. |
| Leaky | Smuggling, alternate routes or weak coverage allow significant passage. |
| Broken | Opposition, weather, supply or retreat ends practical coverage. |
| Lifted | Authority ends the blockade and consequences transition to aftermath. |

> **Blockade Rule**
>
> A blockade can restrict route confidence and traffic only to the extent supported by actual fleet coverage and political enforcement. It never deletes cargo, freezes all port services or guarantees successful interception.

# 34. Maritime Diplomacy, Treaties and Port Rights

| Right or Agreement | Possible Terms |
| --- | --- |
| Passage Rights | Which vessels, routes, cargo and times may transit. |
| Port Access | Berth, repair, provisioning, refuge and military-use permissions. |
| Trade Agreement | Tariffs, preferred goods, quotas, embargo exemptions and dispute process. |
| Convoy or Escort Pact | Shared protection, schedules, contributions and command. |
| Anti-Piracy Cooperation | Information sharing, pursuit rights, extradition and prize handling. |
| Inspection or Search Rights | Who may stop or inspect which vessels and where. |
| Fishing or Harvest Rights | 26M-supported resource access, quotas and conservation duties. |
| Salvage or Wreck Rights | Claims, historical protections and recovery shares. |
| Naval Basing Rights | Duration, capacity, supply, law and political consequences. |
| Neutrality or Non-Aggression | Protected traffic, prohibited support and response to violations. |
| Blockade or Embargo Recognition | Whether third parties comply, challenge or remain neutral. |
| Realm or Portal Access | Specialist vessel, cargo, quarantine and magical-security conditions. |

## 34.1 Treaty Behaviour

- Treaties are explicit relationship records with parties, scope, duration, conditions and breach state.
- Rights are queried by ports, routes, fleets, customs and missions rather than copied into each record.
- Breach creates evidence, diplomacy and quest or event consequences; it does not automatically start total war.
- Unrecognised authorities may issue claims that only allies or controlled ports enforce.
- Players may negotiate, respect, exploit or violate treaties subject to authority and faction systems.

# 35. Maritime Claims, Jurisdiction and Contested Waters

Leyforge does not require a single modern legal model. Cultures and factions may claim harbour waters, rivers, islands, straits, fishing grounds, realm gates or broader sea regions through different traditions. The simulation uses typed claims and enforcement evidence rather than assuming universal territorial-water distances.

| Claim Type | Example Scope | Required Evidence |
| --- | --- | --- |
| Port or Harbour Jurisdiction | Berths, approaches and local anchorage. | Authority, settlement ownership and 26J service control. |
| River or Canal Control | Locks, crossings and navigable corridor. | Structures, patrols, settlements and recognised law. |
| Island or Coastal Claim | Named coast, archipelago or resource area. | Atlas or faction history, settlements and capability. |
| Chokepoint Right | Strait, reef pass, ice route or realm corridor. | Access control, navigation support or force. |
| Fishing or Harvest Claim | Habitat or seasonal resource ground. | Culture or treaty and 26M ecology relationship. |
| Sacred or Protected Water | Cultural, magical or historical exclusion. | Atlas canon and faction or culture authority. |
| Open or Neutral Water | No accepted exclusive claim. | Treaty or lack of enforceable claim. |
| Contested Water | Overlapping incompatible claims. | Multiple valid claim records and active dispute. |

## 35.1 Claim versus Control

A claim describes political assertion; control describes current ability to observe, service, patrol, enforce or influence. Neither is reduced to a single ownership field.

# 36. Regional Maritime Power and Influence Profiles

Regional maritime power is represented by evidence-backed vectors. A faction may be commercially dominant but militarily weak, possess excellent shipyards but poor crews, or control one chokepoint while lacking broad ocean reach.

| Vector | Evidence Sources | Potential Effects |
| --- | --- | --- |
| Access | Ports, routes, passage rights, charts and realm gateways. | Where the power can operate and trade. |
| Commercial Capacity | Cargo throughput, merchant fleet, contracts, markets and obligations. | Supply, wealth, employment and bargaining power. |
| Logistics | Provisioning, repair, bases, tenders, warehouses and route resilience. | Fleet endurance and recovery. |
| Shipbuilding | Shipyards, designs, materials, labour and production queues. | Replacement, expansion and specialised vessels. |
| Security | Patrols, escorts, intelligence, law and threat suppression. | Route confidence and civilian traffic. |
| Naval Force | Ready fleets, crews, doctrine, bases and mission capability. | Deterrence, blockade and conflict options. |
| Intelligence | Sightings, charts, signals, spies and forecast access. | Decision quality and interception opportunity. |
| Diplomacy | Treaties, port rights, alliances, legitimacy and reputation. | Access without force and coalition capacity. |
| Resilience | Fallback ports, reserve stock, repair, alternate routes and disaster response. | Ability to survive loss, storms and blockades. |
| Magical or Realm Reach | Mana support, wards, portals, realm vessels and specialist knowledge. | Advanced routes and threats without invalidating mundane systems. |

## 36.1 Influence Calculation Rules

- Profiles cite contributing definitions and instances, current state, confidence and last update.
- Influence may be spatial by region, route, port or relationship rather than universal.
- No vector grants direct ownership or loyalty; it modifies options, probabilities, prices, contracts and diplomacy through declared rules.
- Destroyed, captured, inaccessible or unsupplied assets reduce relevant evidence after reconciliation.
- UI summaries may use labels, but detailed vectors and causes remain inspectable.
- Atlas and quest outcomes may reshape profiles through explicit world-state events.

# 37. War, Escalation, Deterrence and Strategic Outcomes

| Strategic State | Meaning |
| --- | --- |
| Peace or Normal Competition | Trade, tariffs, patrols and disputes occur without authorised force. |
| Tension | Increased inspections, escorts, intelligence and political warnings. |
| Maritime Incident | Seizure, collision, raid or violation creates a bounded dispute. |
| Limited Hostility | Specified targets, routes or missions are contested. |
| Privateering or Proxy Conflict | Sponsored actors attack under partial deniability. |
| Declared Maritime War | Naval missions, blockades and enemy-target rules become authorised. |
| Regional War | Ports, settlements, land forces and alliances connect to maritime conflict. |
| Ceasefire or Armistice | Force is limited while claims, prizes and access remain unresolved. |
| Peace or Settlement | Treaty resolves some rights, reparations, access and aftermath. |

## 37.1 Deterrence

Deterrence derives from known readiness, reputation, alliances, geography, response time and willingness. Hidden weakness, false intelligence or political constraint may reduce real capability. A large fleet does not automatically intimidate every faction, and peaceful strength may prevent conflict without combat.

## 37.2 Strategic Outcome Inputs

- 26L encounter results, captures, casualties, damage and wrecks.
- Port closures, repairs, provisioning and shipyard replacement capacity.
- Cargo shortages, disrupted contracts, market confidence and migration.
- Leadership, morale, faction legitimacy and civilian response.
- Treaties, neutral reactions, privateering status and evidence of violations.
- Player and NPC contributions, rescues, atrocities, betrayals and negotiated solutions.

# 38. Player Roles and Maritime Career Paths

Document 26K must support maritime play as a set of connected sandbox careers rather than a mandatory linear profession. The same character may move between trading, navigation, fleet leadership, privateering, diplomacy, rescue, smuggling, naval service and regional politics as knowledge, reputation, vessels, crews and circumstances change.

| Career Path | Primary Activities | Core Dependencies | Typical Consequences |
| --- | --- | --- | --- |
| Independent Trader | Buy, transport, sell, negotiate contracts, discover shortages and build trusted routes. | Cargo capacity, charts, market knowledge, crew, port access and capital. | Profit, market change, reputation, route growth, debt or loss. |
| Freight Captain | Accept delivery contracts and manage schedules, manifests and customer property. | Reliable vessel, handling facilities, insurance or bonds, crew readiness. | Contract standing, penalties, repeat business and cargo claims. |
| Passenger or Ferry Operator | Carry travellers, migrants, specialists, messengers and pilgrims. | Habitability, safety, passenger permissions, route knowledge and schedule. | Migration, story access, reputation, rescue obligations and political scrutiny. |
| Fleet Owner or Commodore | Coordinate multiple vessels, captains, routes, escorts and reserves. | Fleet record, command permissions, communications, supply and administrative support. | Regional influence, operating cost, political attention and strategic exposure. |
| Smuggler | Move restricted cargo or people through concealment, false documentation and covert routes. | Contraband knowledge, hidden spaces, contacts, timing and deception. | Profit, crime evidence, faction trust, seizure, blackmail or amnesty opportunities. |
| Pirate or Raider | Threaten, intercept, extort, seize or ransom maritime targets. | Crew loyalty, haven access, intelligence, combat capability and prize disposal. | Fear, infamy, retaliation, bounty, political sponsorship or faction hostility. |
| Privateer | Attack authorised targets under a valid commission. | Letter of marque, jurisdiction, prize rules, evidence and sponsor relationship. | Legal protection within scope, diplomatic incidents when scope is exceeded. |
| Naval Officer or Sailor | Patrol, escort, blockade, defend ports, pursue threats and execute state missions. | Naval institution, rank, orders, supply, doctrine and legal authority. | Promotion, discipline, faction outcomes, war escalation and public legitimacy. |
| Harbour or Customs Agent | Inspect manifests, assess dues, detect contraband and administer access. | Port authority, law knowledge, evidence tools and secure records. | Revenue, corruption risks, dispute resolution and regional control. |
| Maritime Diplomat or Envoy | Negotiate port rights, passage, treaties, embargoes, releases and ceasefires. | Faction standing, credible information, transport and authority. | Changed access, alliance, trade, conflict reduction or political backlash. |
| Explorer and Route Pioneer | Survey unknown waters, chart hazards and establish new routes. | Navigation skill, expedition vessel, supplies, instruments and 26C/26D knowledge. | New markets, discoveries, claims, hazards, quests and strategic competition. |

> **Career Freedom Rule**
>
> No character class permanently grants or forbids a maritime career. Careers emerge from owned or commanded capabilities, skills, knowledge, contracts, relationships, law and world state. A player may eventually master multiple paths, while reputation and past conduct still create believable consequences.

## 38.1 Career Progression

- Early maritime participation may begin as hired crew, dock labour, local fisher, courier, ferry assistant or passenger rather than requiring immediate vessel ownership.
- Mid-game progression opens independent command, regional contracts, specialised cargo, convoy participation, exploration and limited fleet administration.
- Late-game progression may include major fleets, transregional trade networks, privateering, naval command, treaty influence, colonial or restoration projects and civilisation-scale logistics.
- Progression must preserve small-vessel and local-trade viability through shallow routes, low operating costs, specialist access, speed, discretion and cultural value.
- Failure may create debt, damaged reputation, seized property, crew desertion, legal cases, rescue quests or changed careers rather than deleting all maritime progression.

## 38.2 Crew and Command Roles for Players

A player may operate directly, delegate to NPC officers, issue fleet-level orders or remain ashore while authorised captains execute missions. Delegation must expose expected route, cargo, readiness, risk, authority limits, recall conditions and reporting cadence before departure. The simulation must never imply that an unstaffed vessel or unsupported fleet operates through invisible competence.

# 39. NPC and Faction Maritime Decision Model

NPC captains, merchants, pirate leaders, harbour authorities and naval institutions require bounded, explainable decision models. They should respond to actual markets, routes, weather, laws, readiness, intelligence, faction goals and risk rather than spawning ships only to decorate the horizon.

| Decision Layer | Questions Evaluated | Authoritative Inputs |
| --- | --- | --- |
| Need or Opportunity | What shortage, surplus, contract, threat, political objective or discovery justifies action? | Markets, settlement needs, contracts, events, faction strategy and rumours. |
| Capability | Which vessel, crew, port, cargo, escort, chart and budget can perform the mission? | 26F-26J records, fleet readiness, permissions and stock. |
| Route Feasibility | Can the mission reach its endpoints under current draft, weather, hazard and access conditions? | 26C route graph, 26D forecast, 26G capability and port rights. |
| Expected Value | What material, political, defensive, informational or social benefit is expected? | Prices, needs, influence, threat reduction, treaty goals and story state. |
| Risk and Confidence | What is known, uncertain, hostile, illegal or likely to fail? | Route confidence, pirate pressure, weather, intelligence age and evidence. |
| Opportunity Cost | What other voyage, defence, repair or settlement need will be delayed? | Fleet schedule, workforce, reserve stock, budget and strategic priorities. |
| Authority and Ethics | Is the action permitted by law, doctrine, contract, culture and current orders? | Faction law, treaties, command hierarchy, reputation and player policy. |
| Commitment | What conditions trigger departure, delay, reroute, abort, surrender or request for help? | Mission thresholds, forecasts, supply margins, threat changes and communication. |

## 39.1 Bounded Planning

- Decision evaluation occurs at scheduled planning points or material state changes, not every frame.
- Each mission proposal stores its input snapshot, chosen option, rejected alternatives, confidence and reason codes.
- NPCs may make imperfect decisions because their information is incomplete, delayed, biased or deceptive; they must not use omniscient world state.
- Distant NPC fleets use the same mission contracts and outcome logic as local fleets, with reduced path and encounter detail.
- Critical authored stories may constrain priorities or options, but they still bind to real vessels, crews, ports, cargo and route state.
- Player-founded settlements may expose policy controls such as risk tolerance, preferred partners, prohibited cargo, escort rules and reserve requirements.

## 39.2 Faction Maritime Strategy

Faction strategy sets weighted goals such as feed coastal settlements, maintain open routes, protect pilgrimage traffic, expand trade, interdict rivals, suppress piracy, support allies, contest a strait, evacuate civilians or project naval power. The strategy layer proposes missions; it does not directly teleport resources or predetermine tactical outcomes.

## 39.3 Explainability

Players with appropriate knowledge or authority should be able to inspect why an NPC voyage was proposed, delayed, cancelled, rerouted or lost. Explanations may withhold secret intelligence or hostile plans, but visible outcomes must never appear arbitrary when the relevant causes are known.

# 40. Settlement Needs, Economy and Civilisation Consequences

Maritime systems feed the established seven settlement needs rather than creating a separate naval-needs dashboard. Ports, fleets and routes contribute through actual services, cargo, labour, access and risk. Their value is calculated from current operational state, not from decorative vessel counts.

| Main Need | Maritime Contributions | Common Failure Effects |
| --- | --- | --- |
| Housing | Crew housing, migrant transport, floating accommodation where approved and waterfront residential access. | Overcrowding, displaced crews, recruitment failure and morale loss. |
| Provisions | Fishing, food imports, freshwater delivery, salt, fuel and emergency relief. | Shortages, rationing, price spikes, sickness and migration. |
| Health | Medical evacuation, quarantine, clean-water supply, rescue and specialist transport. | Disease spread, untreated injuries, port closure and mortality. |
| Work | Dock labour, fishing, shipbuilding, trade, navigation, customs, repair and fleet service. | Unemployment, skill loss, emigration, stalled projects and crime pressure. |
| Safety | Patrols, rescue, lighthouses, escorts, sea walls, evacuation and threat intelligence. | Piracy, wrecks, raids, isolation and fear. |
| Infrastructure | Ports, channels, ferries, warehouses, shipyards, beacons and maritime routes. | Congestion, inaccessible trade, vessel damage and delayed construction. |
| Morale | Festivals, returning fleets, cultural exchange, pilgrimage, successful rescue and maritime identity. | Mourning, fear, humiliation, isolation and unrest. |

> **No Abstract Prosperity Rule**
>
> Maritime prosperity must be traceable to delivered goods, fulfilled services, safe access, employment, knowledge, reputation and infrastructure. A route or fleet icon alone does not create settlement capacity.

## 40.1 Regional Market Consequences

- Reliable maritime routes reduce selected scarcity, improve diversity and allow specialisation, but also increase dependence on external supply.
- Blockades, storms, piracy and port damage may shift demand to land routes, substitutes, rationing, local production or emergency magic.
- Large exports can enrich producers while creating local shortages, labour displacement, ecological pressure or political resentment.
- Trade concentration can elevate one port, weaken another, encourage migration and change faction influence.
- Insurance, warehousing, shipbuilding, customs and finance-like services may emerge from repeated maritime activity without creating free resources.
- Persistent market memory records severe shortages, exploitation, dependable relief and contract betrayal.

## 40.2 Settlement Growth and Project Integration

Maritime capability may unlock settlement projects such as fishing piers, ferries, warehouses, lighthouses, rescue stations, customs houses, shipyards and defensive harbour works. These remain Document 20 universal functions and Document 19/20 construction projects, while 26J and 26K provide maritime activation and economic contracts.

## 40.3 Collapse, Recovery and Adaptation

A settlement whose maritime network fails should seek alternatives according to resources, knowledge and policy: repair the port, charter neutral shipping, build a smaller landing, negotiate passage, clear pirates, ration goods, switch production or migrate. Recovery should generate projects and quests rather than applying an unexplained permanent penalty.

# 41. Automation, Magic, Golems and Specialist Infrastructure

Automation and magic can scale maritime trade and fleet administration, but they remain physical, permissioned and resource-conserving. They may reduce labour or risk without fabricating cargo, crews, legal authority, information or political legitimacy.

| System | Valid Maritime Uses | Required Boundaries |
| --- | --- | --- |
| Cargo Automation | Cranes, conveyors, pumps, sorters, warehouses, manifests and vessel loading plans. | Transfers use actual inventory transactions, capacity, ownership and route access. |
| Fleet Logistics Automation | Provisioning templates, spare-part kits, maintenance queues and dispatch preparation. | Does not certify readiness when stock, crew or vessel condition is missing. |
| Navigation Magic | Forecasting, route revelation, current sensing, beacon links and limited hazard warning. | Knowledge confidence, mana cost, interference and counterplay remain explicit. |
| Communication Magic | Fleet signals, dispatches, distress calls and command relays. | Range, latency, infrastructure, interception and failure modes are represented. |
| Cargo Preservation | Cooling, stasis, wards, purification and contamination control. | Consumes power or reagents and cannot erase pre-existing spoilage or illegal provenance. |
| Defensive Wards | Protect cargo, ports, routes or vessels against defined threats. | Coverage, upkeep, permissions and vulnerabilities are visible. |
| Golems and Construct Labour | Loading, towing assistance, repair, dredging, patrol support and repetitive shipyard work. | Task profiles, access, inventories, maintenance, law and public reaction apply. |
| Portal Logistics | Late-game transfer between approved maritime endpoints. | Remains a separate high-tier network with capacity, cost, stability and jurisdiction; it does not make vessels obsolete. |

## 41.1 Information Integrity

Magical or automated market reports must identify source age, coverage and confidence. They may aggregate known prices and route states but cannot reveal hidden inventories, secret fleets or undiscovered locations without a valid sensing, espionage or authored-story source.

## 41.2 Automation Risk

- Misconfigured cargo routing may create delay, spoilage, ownership disputes or overload, but ordinary systems warn and pause before destructive failure.
- Unstable mana, forbidden labour, corrupted navigation or hostile signal interference may create higher risks where supported by explicit content and settings.
- Automated fleet missions retain human or authorised-command accountability. The system cannot use “automation” to bypass treaties, customs or player permissions.
- Distant automation reconciles exact inventory totals and transaction histories when promoted to local simulation.

## 41.3 Old and New Technology

Mechanical cranes, sails, paper charts and human pilots remain useful beside mana systems through low cost, independence, cultural preference, stealth, repairability and resistance to magical disruption. Progression expands options rather than making every earlier maritime technology worthless.

# 42. Quests, Events, Rumours and Emergent Maritime Stories

Document 26K supplies the strategic and economic state that maritime quests and events express. Document 15 remains the quest/event authority, while 26K defines valid maritime causes, objectives, evidence and consequences.

| Story Source | Example Quest or Event | Persistent Evidence |
| --- | --- | --- |
| Market Shortage | Deliver grain before reserves fail, negotiate a substitute or expose hoarding. | Changed stock, prices, reputation, health and settlement memory. |
| Missing Vessel | Search its planned route, question ports, follow wreckage or ransom demands. | Discovery state, survivors, wreck, cargo claims and family outcomes. |
| Pirate Pressure | Escort a convoy, infiltrate a haven, pay tribute, negotiate or remove support. | Threat profile, pirate reputation, route confidence and political response. |
| Customs Dispute | Prove cargo provenance, pay duties, expose corruption or smuggle it through. | Evidence, fines, legal standing, seized goods and faction relations. |
| Blockade | Run supplies, negotiate passage, break political support or evacuate civilians. | Market shock, access changes, casualties, treaty state and war escalation. |
| Privateering Abuse | Investigate attacks outside a commission and decide whether to prosecute or conceal them. | Prize records, sponsor liability, diplomatic incident and public trust. |
| Fleet Expedition | Chart a new route, establish resupply, reach a remote culture or recover an expedition. | Maps, claims, discoveries, new contracts and route nodes. |
| Port Disaster | Respond to fire, storm surge, collision, contamination or wreck obstruction. | Damage, rescue history, closure, repairs and memorials. |
| Naval Crisis | Carry orders, gather intelligence, reinforce a chokepoint or broker a ceasefire. | Fleet positions, access rights, war state and leadership reputation. |

## 42.1 Rumours and Intelligence

Rumours may concern prices, safe routes, pirate sightings, embargoes, storms, rich cargoes, lost vessels or naval mobilisation. Every rumour stores source, age, confidence, scope and possible deception. Accepting a rumour does not silently make it true.

## 42.2 Emergent Story Composition

- A real shortage, route disruption, available vessel, affected settlement and willing actor may compose a valid contract or quest.
- Generated content must bind to existing entities and must not invent cargo, ports, crews, laws or factions that do not exist.
- Quest objectives may be solved through trade, escort, diplomacy, rescue, investigation, construction, magic, stealth, combat or delegation where plausible.
- Failure should usually change the world and create follow-up conditions rather than simply resetting the task.
- Major maritime events progress through warning, preparation, onset, escalation, resolution, aftermath and remembered history.

## 42.3 Player-Created Objectives

Players may pin routes, schedule voyages, create convoy rendezvous, define procurement targets, set patrol zones or request cargo. These are planning objectives, not fabricated quests, and remain linked to actual permissions, stock and capabilities.

# 43. Difficulty, Accessibility and World Settings

Maritime economy and regional power must scale from relaxed exploration and creative trading to harsh logistics, political conflict and dangerous piracy. Settings should alter pressure, assistance and consequence without changing registry identity or silently breaking resource conservation.

| Setting Family | Example Options | Design Effect |
| --- | --- | --- |
| Market Volatility | Stable, moderate, dynamic. | Controls price response speed and magnitude, not whether real stock exists. |
| Contract Strictness | Forgiving, standard, strict. | Adjusts deadlines, penalties, grace periods and required documentation. |
| Piracy Pressure | Off, low, standard, severe, custom. | Changes generation and escalation weights while preserving existing authored threats. |
| Naval Conflict | Peaceful, defensive only, dynamic, total-war capable. | Controls strategic conflict generation and civilian exposure. |
| Customs and Law Detail | Simplified, standard, detailed. | Adjusts declarations and procedures while keeping ownership and crime understandable. |
| Fleet Administration | Assisted, standard, detailed. | Changes automatic scheduling, provisioning suggestions and inspection depth. |
| Distant Voyage Risk | Reduced, standard, harsh. | Adjusts bounded risk resolution, never arbitrary loss without cause evidence. |
| Economic Consequences | Soft, standard, persistent. | Controls duration and severity of shortages, debt and market memory. |
| Information Assistance | Strong forecasts, standard confidence, limited knowledge. | Changes presentation and aid, not hidden world truth. |
| Peaceful Maritime Play | Enabled or disabled. | Allows trade, fishing, exploration, rescue and port growth without hostile interdiction. |

## 43.1 Accessibility Requirements

- All route, market, fleet, legal and threat states require text or shape cues in addition to colour.
- Charts and fleet maps must support scalable labels, high contrast, simplified layers and reduced animated movement.
- Time-critical contract, pursuit and blockade information must support extended windows or reduced pressure settings.
- Complex fleet commands require presets, confirmation summaries, undo where safe and controller-accessible focus order.
- Audio warnings need captions and direction-independent alternatives.
- Uncertain information must use explicit language and confidence labels rather than subtle visual opacity alone.
- Players may choose reduced notification density while preserving critical safety, legal and irreversible-action warnings.

## 43.2 Assisted Administration

Assistance may suggest profitable routes, compatible cargo, convoy schedules, provisioning, legal requirements and safer alternatives. It must state assumptions and cannot execute purchases, declarations, departures or hostile orders without the configured authority and confirmation.

# 44. Persistence, Simulation LOD and Promotion/Demotion

Maritime trade and fleets must persist across very large worlds without simulating every vessel, sailor and cargo stack physically at all times. The system uses identity-preserving levels of detail with exact resource reconciliation.

| Simulation Level | Representation | Required Preserved State |
| --- | --- | --- |
| Detailed Local | Physical vessels, crews, cargo, ports, weather response and player interaction. | Full transforms, inventories, tasks, condition, permissions and encounter state. |
| Reduced Local | Simplified movement, grouped crew work and bounded service processes. | Vessel identity, route progress, stock, readiness, hazards and active transactions. |
| Route Transit | Fleet or vessel advances through route segments and scheduled decision points. | Mission, manifests, timing, capability, forecast snapshot, risk, communication and events. |
| Regional Summary | Aggregated traffic, market flow, patrol coverage and threat pressure. | Conserved cargo totals, origin/destination, faction ownership, losses, closures and history. |
| Dormant Record | No active simulation until a trigger or scheduled update. | Stable identity, last state, commitments, unresolved claims and next due evaluation. |

> **LOD Conservation Rule**
>
> Promotion and demotion may change representation but never ownership, cargo quantity, vessel identity, crew identity, contract obligations, legal status, damage, route history or authoritative outcomes.

## 44.1 Distant Voyage Resolution

1. Validate that the mission remains legal, staffed, supplied and route-capable.
2. Advance only to the next bounded route or schedule decision point.
3. Apply weather, market, threat, maintenance and event inputs using stored snapshots and current authoritative summaries.
4. Reserve or commit fuel, provisions, fees and cargo transactions at the correct points.
5. Create encounter or exception records when thresholds are met.
6. Pause, reroute, request help, promote to detailed simulation or resolve through an approved abstract outcome contract.
7. Record evidence, changes and next evaluation time.

## 44.2 Promotion Triggers

- A player approaches, boards, observes or directly interacts.
- A high-consequence encounter, disaster, capture, rescue, blockade breach or authored event requires physical resolution.
- A vessel reaches a detailed port or enters a shared multiplayer relevance zone.
- State inconsistency, invalid migration or disputed transaction requires inspection.
- A debugging or testing tool explicitly requests promotion.

## 44.3 Recovery and Reconciliation

Interrupted route updates, port transactions and encounter promotions use journals or transaction records so they can resume or roll back safely. Reconciliation must prefer preserved authoritative records over visual estimates, and any unresolved discrepancy quarantines the affected transaction rather than duplicating or deleting cargo.

# 45. Multiplayer Authority, Ownership and Contribution

Multiplayer maritime play uses one authoritative world simulation. Clients submit validated requests for purchases, loading, contracts, departures, fleet orders, customs declarations, piracy actions and naval missions; they do not directly mutate persistent cargo or fleet state.

| Authority Area | Required Rule |
| --- | --- |
| Vessel Command | Only the authorised captain, helm owner, officer role or configured shared-command policy may issue movement and mission orders. |
| Fleet Command | Fleet membership and orders require owner, faction or delegated commodore authority. |
| Cargo Ownership | Each lot retains owner, custodian, contract, reservation and permission state through transfers. |
| Trade Transaction | Prices, stock, payment, duties and manifest changes commit atomically on the authority. |
| Contracts | Acceptance, contribution, completion, failure and reward scope are explicit for individuals, parties, settlements or factions. |
| Hostile Action | Piracy, interdiction, blockade and privateering requests validate jurisdiction, commission, target and PvP/world settings. |
| Port Services | Berth, loading, repairs and customs operations use locks or reservations to prevent conflicting actions. |
| Disconnect Recovery | Authority transfers, safe pause, NPC takeover or abort rules are declared before voyage or encounter. |
| Split-Screen | Each local player has separate UI, focus and permissions while sharing the authoritative world. |

## 45.1 Contribution Ledgers

Convoys, escorts, relief voyages, blockades, battles and port projects may track cargo supplied, distance escorted, threats deterred, rescues, repairs, intelligence, command, losses and treaty outcomes. Contribution never grants ownership of cargo or vessels unless the governing contract explicitly does so.

## 45.2 Shared Fleets and Organisations

- Player organisations may own vessels, warehouses, contracts and fleet policies through explicit roles and permissions.
- High-impact actions such as selling a fleet vessel, declaring piracy, accepting a naval commission or starting a blockade require configurable confirmation or multi-role approval.
- Personal and organisation reputation remain distinct but influence each other through attributable actions.
- Disputes preserve audit records for server administration, recovery and player trust.

## 45.3 PvP and Consent Boundaries

World settings govern whether players may attack, seize, blockade, inspect or smuggle against one another. Peaceful or cooperative worlds retain trade, convoys, customs, rescue, NPC piracy and strategic play without forced player-versus-player theft.

# 46. UI/UX Requirements and Player Feedback

The maritime interface follows Document 17’s world-first and progressive-disclosure rules. Normal sailing and port life remain visually open, while charts, manifests, fleet boards, market panels and legal records provide depth on demand.

| Interface or View | Required Information |
| --- | --- |
| Market Board | Known buy/sell offers, stock confidence, trends, duties, restrictions, contract links and source age. |
| Cargo Manifest | Lots, quantity, owner, custodian, destination, condition, hazard, legality, reservation and location. |
| Voyage Planner | Endpoints, route options, confidence, distance, timing, weather, draft limits, costs, threats, port rights and alternatives. |
| Fleet Overview | Members, captains, missions, formation, readiness, cargo, supplies, damage, communication and exceptions. |
| Contract Journal | Parties, obligations, deadlines, cargo, payment, penalties, progress, evidence and negotiation options. |
| Customs Panel | Declarations, duties, prohibited goods, inspection state, evidence, disputes and release requirements. |
| Piracy and Threat Layer | Known sightings, confidence, recent attacks, suspected havens, bounties, patrol coverage and safe-route advice. |
| Naval Command View | Mission objectives, legal authority, readiness, patrol zones, blockade rules, signals and escalation limits. |
| Regional Power View | Evidence-based vectors, trends, contested areas, route dependence, alliances and confidence—not a single unexplained score. |
| After-Action Report | Cause, sequence, cargo changes, casualties, captures, legal effects, market consequences, contribution and follow-up. |

## 46.1 World Cues

- Cargo visibly loads, unloads, shifts storage location and appears in appropriate deck or hold representations where budgets allow.
- Busy ports show traffic, queues, signals, warehouse activity, customs presence and changing labour demand.
- Pirate pressure appears through rumours, missing vessels, damaged survivors, escort demand, altered routes and visible patrols.
- Blockades appear through controlled approaches, signals, inspections, diverted merchants and shortage effects.
- Markets communicate abundance or scarcity through stock, prices, NPC dialogue, warehouse activity and settlement behaviour.
- No critical legal, ownership or danger state relies only on environmental cues.

## 46.2 Notifications

Notifications are grouped by urgency and scope: immediate safety or authority conflict; voyage exception; contract or cargo change; market intelligence; strategic report. Routine successful ticks remain in searchable logs rather than producing constant pop-ups.

## 46.3 Irreversible Actions

Selling registered vessels, abandoning cargo, declaring contraband, accepting privateering authority, initiating piracy, enforcing a blockade or committing a fleet to dangerous transit must present the target, authority, known consequences, uncertainty and cancellation boundary before confirmation.

# 47. Godot/Summer Engine Technical Architecture

Implementation uses Godot as the runtime and editor host, with Summer Engine assisting reviewed development. Earlier Unreal-specific directions are superseded where they conflict, while stable-ID, authority, persistence, validation, modularity and simulation-LOD principles remain binding.

| Service or Module | Primary Responsibility |
| --- | --- |
| MaritimeMarketService | Market summaries, offers, price evaluation, stock confidence and market memory. |
| CargoManifestService | Cargo lots, manifests, ownership, reservations, condition and transfers. |
| MaritimeContractService | Trade, freight, passenger, service, charter, escort and relief contract lifecycle. |
| MaritimeRouteService | Route definitions, feasibility, knowledge, timing and segment progression. |
| VoyageTransactionService | Atomic departure, transit, arrival, port-call and exception transactions. |
| FleetService | Fleet identity, membership, formation, mission, command, readiness and schedule. |
| MaritimeThreatService | Piracy pressure, intelligence, target evaluation, havens and bounties. |
| CustomsAndJurisdictionService | Declarations, tariffs, contraband, inspection, jurisdiction and disputes. |
| NavalStrategyService | Patrols, escorts, blockades, procurement, strategic goals and regional response. |
| RegionalMaritimePowerService | Evidence vectors, trends, claims, access and influence summaries. |
| DistantMaritimeSimulationService | Bounded route and regional updates, promotion and reconciliation. |
| MaritimePresentationService | View models, chart layers, reports, reason text and knowledge-aware presentation. |
| MaritimeValidationService | Cross-record validation, reason codes, evidence bundles and release gates. |

## 47.1 Data and Runtime Boundaries

- Definitions, runtime records, save deltas, summaries and UI view models remain separate data layers.
- Stable IDs and typed relationships are resolved through Set 25 registries rather than scene paths or display names.
- Vessels, cargo lots, crews, ports, fleets, contracts and missions use persistent identities independent of loaded Nodes.
- No Node is created for every cargo unit, market entry, route segment or distant vessel.
- Event-driven invalidation updates affected summaries after stock, route, weather, port, law, vessel or faction changes.
- Heavy route, market and fleet planning work is bounded, scheduled and asynchronous where safe.
- Authoritative commits occur on the main authority context after validation; background workers never mutate world state directly.

## 47.2 Suggested Godot Data Forms

| Data Form | Suggested Use |
| --- | --- |
| Resource Definitions | Cargo categories, contract templates, route profiles, mission profiles, law profiles and capability facets. |
| RefCounted Runtime Models | Short-lived planning results, validators, manifests and report builders. |
| Persistent Save Records | Cargo lots, contracts, fleets, missions, power profiles, claims and market memory. |
| Nodes | Loaded physical vessels, ports, actors and world interaction roots only. |
| Signals or Typed Events | Committed transaction and material state-change notifications. |
| WorkerThreadPool Tasks | Bounded route comparison, market aggregation and distant batch planning from immutable snapshots. |

## 47.3 Commands and Events

```yaml
commands:
  - maritime.accept_contract
  - maritime.transfer_cargo
  - maritime.submit_declaration
  - maritime.plan_voyage
  - maritime.depart_voyage
  - maritime.create_fleet
  - maritime.assign_fleet_mission
  - maritime.issue_patrol_order
  - maritime.establish_blockade
  - maritime.grant_privateering_commission
events:
  - maritime.cargo_transferred
  - maritime.contract_changed
  - maritime.voyage_departed
  - maritime.voyage_exception
  - maritime.voyage_arrived
  - maritime.fleet_readiness_changed
  - maritime.piracy_pressure_changed
  - maritime.blockade_state_changed
  - maritime.market_shock_recorded
  - maritime.regional_power_changed
```

## 47.4 Summer Engine Use

Summer Engine may assist code generation, tests, migrations, schema population and tooling, but changes must remain reviewable, deterministic and covered by validation. It must not invent registry IDs, bypass transaction services, rewrite save data without migrations or silently change economic balance.

# 48. Set 25 Schemas, Relationships, Capabilities and Packs

Document 26K extends the production-governance architecture established by Set 25. It does not create a separate unqualified-ID system or bypass canonical registries, relationship validation, capability checks, package manifests, provenance or release gates.

## 48.1 Required Domain Facets

| Facet | Purpose | Example Fields |
| --- | --- | --- |
| maritime_economy_facet | Marks content participating in maritime markets. | commodity_tags, market_regions, perishability, legal_classes, handling_profile. |
| cargo_facet | Defines transport-facing properties. | volume, slot_use, mass_ref, hazard_tags, preservation, concealment, passenger_rules. |
| maritime_route_facet | Defines route compatibility and transit behaviour. | endpoint_types, depth_band, weather_exposure, knowledge, seasonal_state. |
| maritime_contract_facet | Defines reusable obligation structures. | parties, cargo_query, service, deadline, payment, penalties, evidence. |
| fleet_facet | Defines fleet roles and membership compatibility. | mission_tags, command_rules, formation_roles, readiness_requirements. |
| piracy_facet | Defines systemic pirate behaviour without ancestry assumptions. | motives, target_preferences, haven_needs, escalation, surrender_rules. |
| naval_facet | Defines institutional maritime-security capability. | doctrine, jurisdiction, patrol_profiles, logistics, command, escalation. |
| customs_facet | Defines legal treatment of cargo or passengers. | declaration, tariff, prohibition, licence, evidence, inspection_rules. |
| regional_power_facet | Defines evidence vectors and influence contribution. | trade, access, naval_presence, logistics, legitimacy, confidence. |

## 48.2 Required Relationships

| Relationship | From | To | Purpose |
| --- | --- | --- | --- |
| maritime:carried_by | cargo_lot or passenger_group | vessel_instance | Current transport custody and location. |
| maritime:listed_on | cargo_lot | manifest | Authoritative manifest membership. |
| maritime:fulfills | cargo_lot or voyage | contract_instance | Connects real delivery or service to obligation. |
| maritime:travels_via | voyage or fleet_mission | maritime_route | Binds movement to route knowledge and conditions. |
| maritime:member_of | vessel_instance | fleet_instance | Persistent fleet membership. |
| maritime:commanded_by | vessel or fleet | npc, player or organisation | Authority and responsibility. |
| maritime:protected_by | voyage, route or port | escort, patrol or treaty | Security contribution. |
| maritime:interdicted_by | route, port or voyage | blockade or patrol mission | Access denial or inspection state. |
| maritime:authorised_by | privateer mission or customs action | commission, law or order | Legal authority evidence. |
| maritime:subject_to | cargo, vessel or actor | jurisdiction or law profile | Applicable legal context. |
| maritime:influences | fleet, port, route or treaty | regional_power_profile | Evidence contribution. |
| maritime:supported_by | fleet or mission | port, naval_base or supply_contract | Logistics dependency. |

## 48.3 Capability Identities

| Capability ID | Meaning |
| --- | --- |
| capability.maritime.trade.execute | May perform authoritative maritime buy, sell and delivery transactions. |
| capability.maritime.cargo.general | May carry standard cargo under declared limits. |
| capability.maritime.cargo.hazardous | May safely and legally carry matched hazardous cargo. |
| capability.maritime.passenger.transport | May carry passenger groups under habitability and safety rules. |
| capability.maritime.fleet.command | May create or command qualifying fleet missions. |
| capability.maritime.customs.inspect | May perform authorised maritime inspection. |
| capability.maritime.patrol.execute | May conduct a valid patrol or escort mission. |
| capability.maritime.privateering.execute | May act under an active scoped commission. |
| capability.maritime.blockade.enforce | May contribute to an authorised blockade. |
| capability.maritime.route.deep_ocean | May operate on deep-ocean route segments. |
| capability.maritime.relief.deliver | May perform emergency settlement-supply missions. |
| capability.maritime.strategy.plan | May create faction or organisation maritime mission proposals. |

## 48.4 Pack and Manifest Rules

- Core maritime schemas and reason-code namespaces belong in the approved Set 26 integration pack.
- Optional culture, faction, biome, realm, vessel, mission and economy packs declare dependencies and compatibility explicitly.
- A pack may add commodities, routes, laws, pirate profiles or naval doctrines but cannot override canonical identity without authorised governance.
- Procedural-generation versions, market-balance versions and mission-profile versions are pinned in manifests.
- Missing optional content quarantines affected definitions or missions without corrupting unrelated saves.
- Every released pack includes provenance, schema version, validation evidence, migration policy and rollback information.

# 49. Validation, Reason Codes, Evidence and Release Gates

Every material maritime action must produce machine-readable validation results and player-readable explanations. Silent substitution, unexplained denial and “false success” are prohibited.

## 49.1 Validation Groups

| Group | Examples |
| --- | --- |
| Identity and Reference | Missing ID, invalid relationship, deleted port, duplicate fleet member or unresolved optional pack. |
| Cargo and Manifest | Quantity mismatch, ownership conflict, capacity exceeded, invalid hazard handling or undeclared lot. |
| Contract | Missing party, impossible objective, expired authority, ambiguous evidence or reward without payer. |
| Route and Voyage | Unknown endpoint, incompatible draft, closed segment, insufficient confidence, no legal access or no reserve margin. |
| Fleet | Invalid command, member unavailable, formation conflict, readiness below mission threshold or unsupported supply. |
| Piracy and Privateering | Invalid target, missing hostile intent, expired commission, jurisdiction mismatch or prohibited world setting. |
| Customs and Law | Missing declaration, invalid tariff, unsupported licence, evidence conflict or unlawful inspection. |
| Naval and Blockade | No authority, insufficient coverage, invalid chokepoint, neutral-rights conflict or escalation breach. |
| LOD and Persistence | Conservation mismatch, unresolved transit, promotion conflict, stale snapshot or migration failure. |
| Presentation | Missing localisation, inaccessible colour-only cue, absent reason text or unknown confidence state. |

## 49.2 Core Reason Codes

| Reason Code | Meaning |
| --- | --- |
| maritime.cargo.capacity_exceeded | The destination vessel or storage cannot accept the cargo quantity or handling class. |
| maritime.cargo.ownership_denied | The requester lacks authority to transfer, sell, abandon or declare the cargo. |
| maritime.manifest.quantity_mismatch | Manifest totals do not match authoritative cargo lots. |
| maritime.contract.requirement_unresolved | A contract references an impossible, missing or ambiguous obligation. |
| maritime.route.capability_missing | The vessel or fleet lacks a required route capability. |
| maritime.route.access_closed | A port, segment, treaty or blockade currently prevents legal passage. |
| maritime.voyage.reserve_insufficient | Fuel, provisions, crew, maintenance or emergency margin is below policy. |
| maritime.fleet.command_denied | The requester lacks fleet-command authority. |
| maritime.fleet.member_unavailable | A vessel or captain is committed, damaged, impounded or otherwise unavailable. |
| maritime.piracy.target_invalid | The proposed target is not valid under threat, encounter or world-setting rules. |
| maritime.privateering.commission_invalid | The commission is absent, expired, revoked, outside jurisdiction or excludes the target. |
| maritime.customs.declaration_incomplete | Required cargo or passenger information is missing. |
| maritime.blockade.coverage_insufficient | The authorised forces cannot presently enforce the declared blockade conditions. |
| maritime.blockade.neutral_rights_conflict | The proposed action conflicts with known treaty or neutral-access rules. |
| maritime.transit.reconciliation_failed | Distant and detailed records could not be reconciled safely. |
| maritime.market.source_stale | Displayed intelligence is older than the allowed confidence window. |

## 49.3 Evidence Bundles

- Resolved IDs, versions and source packs.
- Input snapshots for market, route, weather, vessel, crew, cargo, law, faction and threat state.
- Validation results, warnings, accepted risks and user confirmations.
- Transaction journals and before/after inventory totals.
- Mission proposal, chosen route, rejected alternatives and confidence.
- Encounter, customs, blockade or privateering authority evidence.
- Promotion/demotion and reconciliation logs.
- Performance measurements and deterministic replay seeds where applicable.
- Accessibility and localisation checks for all surfaced reason codes.

## 49.4 Release Gates

1. Schema, ID and relationship validation passes.
2. Cargo and currency conservation tests pass across local, distant, save/load and migration flows.
3. No voyage, fleet, piracy or naval mission can execute without required capabilities, authority and route validation.
4. Distant and local simulations reconcile deterministically within declared boundaries.
5. Set 25 dependency, pack, provenance and migration checks pass.
6. All critical errors and irreversible actions expose accessible player-readable explanations.
7. Performance budgets pass in representative busy-port, convoy, piracy and blockade scenarios.
8. No high-severity data-loss, duplication, authority, legal-scope or save-migration defect remains open.

# 50. Prototype Laboratories and Acceptance Tests

Implementation must be proven through bounded laboratories before broad world content is admitted. Each laboratory records exact inputs, deterministic seeds, expected outputs, performance and evidence.

| Laboratory | Purpose | Minimum Acceptance |
| --- | --- | --- |
| Cargo Conservation Lab | Load, unload, transfer, sell, seize, abandon and recover mixed cargo lots. | No duplication, loss, ownership drift or manifest mismatch across save/load. |
| Market Response Lab | Apply deliveries, shortages, blockades and substitute goods. | Prices and availability respond within bounds and preserve actual stock. |
| Contract Lifecycle Lab | Run trade, freight, passenger, escort and relief contracts. | Negotiation, reservation, completion, failure, penalties and evidence remain consistent. |
| Route Feasibility Lab | Compare river, coast, open-sea and seasonal alternatives. | Capability, access, forecast and confidence produce explainable route results. |
| Fleet Readiness Lab | Assemble mixed vessels with incomplete crews, supply and repairs. | Mission eligibility and blockers match actual member state. |
| Convoy Transit Lab | Move merchant vessels with escorts through multiple segments. | Schedule, shared risk, separation, delay and arrival reconcile. |
| Piracy Pressure Lab | Generate targets from wealth, vulnerability, intelligence and support. | Threats are systemic, bounded and not ancestry-coded. |
| Privateering Lab | Issue, use, exceed, revoke and dispute commissions. | Legal scope, prize records and diplomatic consequences remain traceable. |
| Customs Lab | Declare, inspect, conceal, seize and appeal cargo. | Authority, evidence, tariffs and ownership are preserved. |
| Blockade Lab | Enforce a chokepoint with partial coverage and neutral shipping. | Access results reflect actual presence, doctrine, intelligence and treaty constraints. |
| Distant Simulation Lab | Advance many fleets over long time spans and promote selected encounters. | Conservation, identity and outcomes match deterministic replay. |
| Multiplayer Authority Lab | Issue conflicting cargo, fleet and customs commands. | Only authorised atomic commits succeed; disconnect recovery is safe. |
| Regional Consequence Lab | Disrupt and restore a major route. | Markets, settlement needs, influence and quests change through traceable evidence. |

## 50.1 Core Acceptance Scenario

1. A coastal settlement has a real grain shortage and publishes a freight contract.
2. A merchant purchases or reserves real grain at an exporting port and loads it into manifest-linked cargo lots.
3. The voyage planner compares a fast exposed route and a safer escorted route using known weather, piracy and access information.
4. The player forms a convoy with an NPC escort and departs after crew, cargo, legal and readiness checks.
5. A storm delay and pirate-pressure change create an explainable route exception without deleting cargo.
6. The convoy reaches a customs-controlled destination, submits declarations and unloads the contracted quantity.
7. Payment, duties, contributions, market stock and settlement Provisions update atomically.
8. The route gains confidence, the merchant’s reliability changes and the shortage leaves persistent history.
9. Save/load and distant simulation reproduce the same conserved state.

## 50.2 Failure Scenarios

- Departure is blocked by missing crew, overloaded cargo, closed access, expired contract or insufficient reserve, each with highlighted cause.
- A cargo owner denies transfer and no inventory changes occur.
- A convoy member falls behind and the mission policy chooses wait, detach, reroute or abort as configured.
- A privateer attacks an excluded neutral target and loses legal protection through traceable evidence.
- A blockade claims control without sufficient presence and produces only partial interdiction confidence.
- A corrupted optional pack quarantines affected missions while unrelated ports, fleets and cargo remain loadable.
- An interrupted transit commit recovers without duplication or lost contract progress.

# 51. Performance, Scalability and Production Budgets

Maritime systems must support many routes, markets, contracts and distant fleets without converting the world into an unbounded economic simulation. Budgets are first-pass engineering targets and require profiling in packaged Godot builds.

| Budget Area | First-Pass Direction |
| --- | --- |
| Detailed Fleets | Only vessels near relevant players, ports or high-consequence events use full physical and crew simulation. |
| Route Updates | Distant voyages advance at bounded decision points and are batch-scheduled across frames. |
| Market Recalculation | Event-driven for affected commodities and regions; no full-world price recomputation every frame. |
| Fleet Planning | Factions evaluate a bounded candidate set at scheduled strategy ticks. |
| Threat Generation | Piracy profiles evaluate eligible routes and targets through regional summaries, not every vessel pair. |
| Cargo Representation | Stacks and lots remain data records; visual cargo is pooled and budgeted. |
| History | Summaries retain important provenance and consequences while routine entries compact under explicit rules. |
| UI | Maps and tables virtualise long lists, cluster distant traffic and request detail on demand. |
| Networking | Replicate authoritative deltas and relevance summaries, not every distant transit tick. |
| Save Size | Seed/reconstructable route definitions plus deltas; persistent identities and transactions stored compactly. |

## 51.1 Scalability Tiers

| Tier | Scope | Expected Representation |
| --- | --- | --- |
| Local Harbour | One active port, nearby traffic and a handful of detailed voyages. | Full physical and UI detail. |
| Regional Sea | Several ports, routes, merchant fleets, pirates and patrols. | Mixed detailed and route-summary simulation. |
| Multi-Region World | Many maritime regions, factions and distant fleets. | Regional summaries with selective promotion. |
| Civilisation Scale | Large trade networks, wars, blockades and realm-linked routes. | Strategic summaries, bounded schedules and high-consequence detail only. |

## 51.2 Redesign Triggers

- Market outcomes cannot be traced to actual stock or transactions.
- Cargo reconciliation produces duplication or unexplained loss.
- Distant simulation outcomes change when frame rate or load order changes.
- Fleet planning scales quadratically with world fleet count.
- Piracy or naval missions spawn without real logistics, routes or authority.
- Regional power collapses into one opaque score that cannot explain its contributors.
- Players must micromanage every vessel to prevent routine failure despite configured delegation.
- A save or optional-pack failure corrupts unrelated maritime state.
- UI cannot explain why route, trade, customs or blockade actions are unavailable.

# 52. Staged Implementation Plan

| Stage | Scope | Exit Criteria |
| --- | --- | --- |
| 26K-0 Contracts and Test Data | Schemas, IDs, relationships, reason codes, sample ports, cargo, routes and missions. | Set 25 validation passes and test fixtures are deterministic. |
| 26K-1 Cargo and Markets | Cargo lots, manifests, ownership, stock, offers and atomic trade. | Conservation and market-response laboratories pass. |
| 26K-2 Contracts and Voyages | Trade/freight contracts, voyage planning, departure, transit and arrival. | Core delivery loop works locally and through save/load. |
| 26K-3 Fleet Foundation | Fleet records, membership, command, readiness, formations and schedules. | Mixed-fleet readiness and convoy tests pass. |
| 26K-4 Distant Maritime Simulation | Route-transit LOD, promotion, demotion and reconciliation. | Deterministic distant simulation lab passes. |
| 26K-5 Customs and Law | Declarations, tariffs, inspections, contraband and jurisdiction. | Customs and multiplayer authority labs pass. |
| 26K-6 Piracy and Privateering | Threat profiles, target selection, havens, ransom, prizes and commissions. | Piracy is systemic, explainable and politically scoped. |
| 26K-7 Navies and Security | Patrols, escorts, naval bases, procurement and strategic missions. | Naval missions use real fleets, supply and authority. |
| 26K-8 Blockades and Regional Power | Chokepoint control, embargo effects, influence vectors and diplomacy hooks. | Regional consequence and blockade labs pass. |
| 26K-9 UI, Accessibility and Multiplayer | Charts, market/fleet views, notifications, shared command and contribution. | Document 17 and Set 25 player-trust gates pass. |
| 26K-10 Production Admission | Migration, performance, content packs, QA evidence and downstream handoff. | No critical gate remains open; 26L inputs are stable. |

## 52.1 Production Sequencing Rules

- Do not build tactical piracy or naval combat before 26L defines encounter execution and damage contracts.
- Do not populate hundreds of commodities or route profiles before 26N defines production registry scope and balancing.
- Do not make a full strategic dashboard before the underlying records and reason codes are authoritative.
- Build the conserved cargo and voyage transaction spine before market complexity.
- Prove one merchant route, convoy, pirate threat and patrol loop before regional-scale simulation.
- Keep all prototype shortcuts behind replaceable adapters and never compromise stable IDs, transactions, saves or authority.

# 53. Cross-Document Integration and Main-Document Amendments

Document 26K creates maritime-facing contracts that later main-document revisions must incorporate. It does not directly overwrite those documents.

| Document or Set | Required Integration |
| --- | --- |
| 00 Master Game Design Bible | Add maritime survival, trade, fleets and regional power as expressions of the four existing pillars. |
| 01 Core Gameplay Loop | Add voyage planning, cargo movement, port interaction, convoy defence and maritime expansion loops. |
| 02 Player Progression | Add navigation, seamanship, trade, fleet leadership, customs, piracy and naval progression paths. |
| 03 Blocks Registry | Add cargo, customs, signal, fleet-command and strategic-maritime block facets where physical blocks are required. |
| 04 Items Registry | Add cargo-handling, documentation, navigation, signal, legal and maritime trade items. |
| 05 Recipe Registry | Add cargo packs, provisions, preservation, fleet supply, signal and maritime-service recipes. |
| 06 Resource Progression | Add marine and imported resources, strategic maritime goods and long-route supply identities. |
| 07 NPC Village System | Add maritime jobs, migration, fleet employment, port economy and regional supply consequences. |
| 08 Automation System | Add port cargo flow, fleet provisioning, manifest-aware logistics and bounded distant transfers. |
| 09 Magic System | Add maritime communication, preservation, route sensing, wards and portal-logistics boundaries. |
| 10 Creatures and Monsters | Use 26M for ecology; expose creature-caused route pressure without duplicating species authority. |
| 11 Biomes and World Generation | Bind routes, chokepoints, claims, safe harbours and traffic summaries to 26C geography. |
| 12 Structures | Add pirate havens, naval bases, customs sites, beacons and strategic chokepoint structures. |
| 13 Races, Cultures and Factions | Add culture/faction maritime doctrine, law, trade preference and political goals without ancestry determinism. |
| 14 Dimensions | Add realm routes, interdimensional shipping constraints, native jurisdictions and specialist logistics. |
| 15 Quest and Event System | Add maritime contract, shortage, convoy, piracy, customs, blockade and war event templates. |
| 16 Combat, Gear and Defence | Receive tactical encounter, boarding, prize, blockade and aftermath links through 26L. |
| 17 UI/UX System | Add market, manifest, voyage, fleet, customs, threat, blockade and regional-power interfaces. |
| 18 Technical Plan | Replace remaining engine-specific assumptions with Godot/Summer services, LOD and authoritative transactions. |
| 19-20 Settlement and Buildings | Add port economy, maritime capability gates, naval facilities and waterfront project effects. |
| 21-23 Forge and Presentation | Author cargo, vessel, fleet, faction, signal, icon, audio and VFX content through existing Forge contracts. |
| 24 Atlas | Provide authored maritime cultures, regions, routes, threats, commodities and political context. |
| 25 Governance | Register 26K schemas, relationships, capabilities, packs, validation evidence and amendment obligations. |

## 53.1 Integration Priority

1. Preserve Set 25 identity, relationship and package governance.
2. Amend registries for cargo, contracts, routes, fleets, law and mission facets.
3. Integrate ports, settlement needs and NPC professions.
4. Integrate quest, event, diplomacy and faction strategy.
5. Integrate 26L tactical outcomes and 26M ecology.
6. Complete 26N progression, registry population and economy balancing.
7. Consolidate implementation, performance, UI and QA in 26O.

# 54. Formal Handoff to 26L

Document 26L — Naval Combat, Boarding, Damage, Flooding, Fire and Siege — receives the tactical encounter requirements created by 26K. Document 26K remains authoritative for why an encounter exists, who owns the participants and cargo, what legal and strategic context applies, and how the outcome affects contracts, markets, fleets, diplomacy and regional power.

| 26K Supplies to 26L | 26L Must Return |
| --- | --- |
| Encounter context: piracy, escort, patrol, interception, blockade, war, mutiny, rescue or prize action. | Resolved tactical outcome, time, location and encounter evidence. |
| Participant vessel, fleet, crew, cargo, command, readiness, faction and legal records. | Casualties, injuries, captures, surrender, escape, rescue and command changes. |
| Objectives, target priority, rules of engagement, jurisdiction, commission and escalation limits. | Objective completion, violations, attribution and legal evidence. |
| Known weather, sea state, route, visibility and terrain context from 26C/26D. | Material environmental consequences created during the encounter. |
| Cargo manifests, ownership, prize eligibility and protected or hazardous contents. | Cargo damage, loss, seizure, jettison, contamination and new custody. |
| Fleet mission, formation, signals, reinforcement and withdrawal policies. | Formation disruption, pursuit result, reinforcement arrival and withdrawal state. |
| Strategic importance of route, port, chokepoint, convoy or blockade. | Control change, wreck obstruction, route hazard and blockade contribution. |
| Persistence and LOD requirements for promotion and demotion. | Save-safe aftermath records suitable for detailed or distant continuation. |

> **26K/26L Boundary Rule**
>
> 26K may estimate risk and create strategic encounters, but it never invents tactical casualties, damage, captures or victories. 26L resolves those outcomes. Conversely, 26L may not create or erase cargo ownership, commissions, treaties, market effects or regional power without returning evidence to the authoritative 26K and connected systems.

## 54.1 Mandatory 26L Topics

- Naval weapon roles, firing solutions, ammunition, crews, recoil, arcs and counterplay.
- Structure-aware voxel damage, penetration, armour, splintering and critical systems.
- Flooding, pumps, compartment damage, fire, smoke, contamination and sinking.
- Boarding approach, grappling, deck combat, surrender, capture, prize crews and rescue.
- Morale, command, signals, formations, pursuit, withdrawal and encounter objectives.
- Coastal batteries, harbour defence, siege, amphibious interaction and wreck aftermath.
- Multiplayer authority, accessibility, LOD and deterministic abstract encounter contracts.
- Evidence returned to cargo, contracts, customs, privateering, fleets, diplomacy and regional power.

## 54.2 Set 26 Forward Dependencies

After 26L, Document 26M supplies marine ecology, fishing, sea creatures, underwater dungeons and bosses; 26N consolidates maritime progression, registries, magic, automation, economy, quests and events; and 26O completes UI/UX, multiplayer, Godot/Summer implementation, performance, QA and main-document integration.

# Appendix A. Maritime Economy, Cargo and Contract Record Templates

```yaml
maritime_cargo_lot:
  id: cargo_lot:<ULID>
  definition_id: item.<qualified_id>
  quantity: 0
  unit_profile_id: cargo_profile.<qualified_id>
  owner_id: entity_or_organisation:<id>
  custodian_id: entity_or_organisation:<id>
  current_container_id: vessel_or_storage:<id>
  manifest_id: manifest:<id>
  contract_ids: []
  origin:
    port_id: port:<id>
    transaction_id: transaction:<id>
  destination_port_id: port:<id> | null
  condition:
    quality: standard
    spoilage: 0.0
    contamination_tags: []
    damage_fraction: 0.0
  legal:
    declaration_state: undeclared
    jurisdiction_tags: []
    contraband_tags: []
    licence_ids: []
  handling:
    hazard_tags: []
    preservation_required: []
    stowage_tags: []
  provenance_log_ref: history:<id>
  save_version: 1
```

```yaml
maritime_contract_instance:
  id: maritime_contract:<ULID>
  template_id: maritime_contract_template.<qualified_id>
  issuer_id: entity_or_organisation:<id>
  contractor_ids: []
  beneficiary_ids: []
  contract_type: freight
  origin_port_id: port:<id>
  destination_port_id: port:<id>
  cargo_query:
    required_definition_or_tags: []
    quantity: 0
    quality_minimum: standard
  service_requirements: []
  accepted_at: world_time
  deadline: world_time | null
  payment:
    payer_id: entity_or_organisation:<id>
    currency_and_amount: []
    non_currency_rewards: []
  penalties: []
  reservations: []
  contribution_policy_id: contribution_policy.<id>
  evidence_requirements: []
  state: offered
  failure_or_cancel_reason_codes: []
  history_ref: history:<id>
  save_version: 1
```

```yaml
maritime_voyage_instance:
  id: voyage:<ULID>
  operator_id: entity_or_organisation:<id>
  lead_vessel_id: vessel_instance:<id>
  fleet_id: fleet:<id> | null
  route_id: maritime_route:<id>
  route_revision: 1
  origin_port_id: port:<id>
  destination_port_id: port:<id>
  planned_departure: world_time
  actual_departure: world_time | null
  expected_arrival_window: [world_time, world_time]
  manifest_ids: []
  passenger_group_ids: []
  contract_ids: []
  readiness_snapshot_id: evidence:<id>
  forecast_snapshot_id: evidence:<id>
  legal_access_snapshot_id: evidence:<id>
  transit_state:
    segment_index: 0
    progress: 0.0
    simulation_level: route_transit
  exception_records: []
  state: planned
  history_ref: history:<id>
  save_version: 1
```

# Appendix B. Fleet, Mission, Piracy and Navy Record Templates

```yaml
maritime_fleet_instance:
  id: fleet:<ULID>
  display_name_key: loc.fleet.<id>.name
  owner_id: entity_or_organisation:<id>
  commander_id: entity:<id> | null
  faction_id: faction:<id> | null
  fleet_type: merchant_convoy
  member_vessel_ids: []
  flagship_vessel_id: vessel_instance:<id> | null
  formation_profile_id: fleet_formation.<id>
  command_policy_id: fleet_command_policy.<id>
  signal_profile_id: maritime_signal_profile.<id>
  readiness_summary_id: readiness_summary:<id>
  current_mission_id: fleet_mission:<id> | null
  home_port_id: port:<id> | null
  support_port_ids: []
  legal_status_tags: []
  history_ref: history:<id>
  save_version: 1
```

```yaml
fleet_mission_instance:
  id: fleet_mission:<ULID>
  mission_profile_id: fleet_mission_profile.<qualified_id>
  fleet_id: fleet:<id>
  issuer_id: entity_or_organisation:<id>
  authority_evidence_ids: []
  objective_records: []
  route_or_zone_refs: []
  rules_of_engagement_id: roe:<id> | null
  escalation_limit_id: escalation_policy:<id>
  readiness_thresholds: {}
  supply_contract_ids: []
  departure_conditions: []
  abort_conditions: []
  reinforcement_policy_id: reinforcement_policy:<id> | null
  state: proposed
  confidence: 0.0
  reason_codes: []
  history_ref: history:<id>
  save_version: 1
```

```yaml
piracy_pressure_profile:
  id: piracy_pressure:<region_id>
  region_id: marine_region:<id>
  active_group_ids: []
  motive_weights:
    profit: 0.0
    survival: 0.0
    political: 0.0
    revenge: 0.0
  intelligence_confidence: 0.0
  known_haven_ids: []
  support_network_refs: []
  target_preference_tags: []
  recent_attack_records: []
  patrol_pressure: 0.0
  faction_sponsorship_refs: []
  escalation_state: latent
  last_evaluated_at: world_time
  save_version: 1
```

```yaml
naval_strategy_profile:
  id: naval_strategy:<faction_id>
  faction_id: faction:<id>
  strategic_goal_weights:
    route_security: 0.0
    port_defence: 0.0
    trade_expansion: 0.0
    piracy_suppression: 0.0
    rival_interdiction: 0.0
    civilian_relief: 0.0
  doctrine_id: naval_doctrine:<id>
  authorised_mission_profiles: []
  home_base_ids: []
  reserve_policy_id: reserve_policy:<id>
  procurement_priorities: []
  active_claim_ids: []
  treaty_constraints: []
  escalation_policy_id: escalation_policy:<id>
  intelligence_confidence: 0.0
  last_planning_time: world_time
  save_version: 1
```

# Appendix C. Capability, Relationship and Mission Catalogue

| Catalogue Family | Initial Entries |
| --- | --- |
| Cargo Handling | general, bulk dry, liquid, refrigerated, living cargo, passenger, hazardous, magical, dimensional, concealed. |
| Maritime Contracts | sale, purchase, freight, charter, passenger, ferry, escort, relief, salvage delivery, naval supply, exploration supply. |
| Fleet Missions | convoy, escort, patrol, reconnaissance, search and rescue, customs interception, blockade, blockade running, privateering, naval transport, evacuation. |
| Piracy Profiles | opportunist, extortionist, prize-taker, coastal raider, politically sponsored, survival-driven, cultic or forbidden where authored. |
| Naval Doctrines | coastal defence, trade protection, river control, blue-water projection, privateer reliance, convoy doctrine, magical interdiction. |
| Legal Status | merchant, passenger, fishing, diplomatic, neutral, naval, privateer, suspected pirate, seized, impounded, quarantined. |
| Regional Power Vectors | port access, shipyard capacity, merchant throughput, naval presence, route knowledge, logistics resilience, alliance access, legitimacy. |
| Route Threats | weather, current, shoal, ice, piracy, war, blockade, contamination, magical instability, creature pressure through 26M. |

## Appendix C.1 Mission Compatibility Principle

Mission profiles query capabilities, relationships, law and environment. They never assume that a display-name vessel class, culture or ancestry automatically succeeds. A converted fishing boat may qualify for local rescue; a large warship may fail a shallow river patrol.

# Appendix D. Validation and Reason-Code Catalogue

| Namespace | Purpose | Examples |
| --- | --- | --- |
| maritime.identity.* | Stable references and versions. | missing_definition, duplicate_member, stale_revision. |
| maritime.cargo.* | Cargo quantity, handling, ownership and condition. | capacity_exceeded, hazard_unsupported, ownership_denied. |
| maritime.manifest.* | Manifest consistency. | quantity_mismatch, undeclared_lot, destination_conflict. |
| maritime.market.* | Market knowledge and transaction constraints. | source_stale, stock_changed, payment_insufficient. |
| maritime.contract.* | Obligation validity and lifecycle. | requirement_unresolved, deadline_passed, party_unavailable. |
| maritime.route.* | Route compatibility, access and confidence. | capability_missing, access_closed, confidence_low. |
| maritime.voyage.* | Departure, transit and arrival. | reserve_insufficient, departure_blocked, arrival_port_unavailable. |
| maritime.fleet.* | Membership, command, readiness and formation. | command_denied, member_unavailable, readiness_low. |
| maritime.piracy.* | Threat and target validity. | target_invalid, support_missing, pressure_capped. |
| maritime.privateering.* | Commission scope and evidence. | commission_invalid, target_excluded, prize_evidence_missing. |
| maritime.customs.* | Declarations, duties and inspection. | declaration_incomplete, licence_missing, inspection_unauthorised. |
| maritime.blockade.* | Authority, coverage and legal constraints. | coverage_insufficient, neutral_rights_conflict, chokepoint_invalid. |
| maritime.transit.* | LOD and reconciliation. | snapshot_stale, reconciliation_failed, promotion_conflict. |
| maritime.presentation.* | Player-trust and accessibility. | reason_text_missing, colour_only_state, confidence_unlabelled. |

# Appendix E. Example Maritime Scenarios

## E.1 The Grain Convoy

A storm-damaged island settlement has ten days of grain remaining. Two merchants compete for a relief contract, but pirate sightings have reduced route confidence. The player may supply cargo, captain a vessel, organise an escort, negotiate temporary naval protection, purchase intelligence, choose a longer route or expose a merchant attempting to inflate prices. The delivered quantity, timing, customs duties, losses and contribution determine payment, Provisions recovery, market memory and regional trust.

## E.2 The Questionable Prize

A privateer arrives with a captured merchant and claims the target served an enemy faction. Its commission allows attacks on military supply, but the manifest includes neutral passengers and disputed cargo. The player may investigate provenance, support the privateer, release the vessel, compensate owners, conceal evidence or escalate the matter diplomatically. Document 26L supplies capture and damage evidence; 26K resolves prize law, ownership, reputation and treaty effects.

## E.3 The Narrow Strait

Two powers contest a strait connecting major trade regions. One declares a blockade but can only cover part of the channel. Merchants reroute, prices rise and neutral ships demand guarantees. The player may run the blockade, reinforce it, chart a hazardous alternate passage, broker inspection rights or sabotage logistics. Control remains evidence-based and may be partial rather than flipping through a single capture point.

## E.4 The Pirate Haven

Pirate pressure persists because a hidden cove offers repair, water, informants and a fence for captured goods. Destroying ships at sea reduces immediate attacks but not the support network. The player may negotiate tribute, infiltrate the market, cut supply, convert the haven into a legal port, sponsor a rival, expose state support or attack it. Outcomes change piracy motives, route confidence, local work and faction politics.

## E.5 The Lost Expedition

An exploration fleet misses its reporting window after a magical storm. Its last chart confidence is low and several ports report conflicting sightings. The player may lead a search, contract salvagers, follow drifting cargo, question survivors or use magical communication. The fleet may be delayed, wrecked, captured, stranded or intentionally silent; rumours alone do not choose the answer.

## E.6 Peaceful Maritime World

With piracy and naval conflict disabled, maritime play still supports local ferries, cargo contracts, fishing, migration, exploration, rescue, port growth, cultural exchange, storms, customs if enabled and regional trade. The strategic layer focuses on reliability, access, shortages, environmental risk and cooperation rather than forced combat.

# Appendix F. Document 26K Completion Checklist

- Maritime economy conserves real cargo, currency, ownership and services.
- Markets respond to stock, demand, access, information and world events without arbitrary global prices.
- Cargo lots, manifests, contracts, voyages, fleets, missions and power profiles have separate stable records.
- Routes bind to 26C geography, 26D environment and 26G vessel capability.
- Ports, crews and shipyards remain owned by 26J.
- Fleet membership, command, readiness, supply and distant simulation are defined.
- Piracy uses motives, support, intelligence and politics rather than ancestry or generic spawn pressure.
- Privateering has commissions, jurisdiction, evidence and diplomatic consequences.
- Navies require institutions, bases, crews, vessels, logistics, doctrine and authority.
- Blockades and regional power are evidence-based and may be partial or uncertain.
- Customs, contraband, smuggling, tariffs and inspection preserve ownership and legal scope.
- Settlement consequences feed the seven established needs.
- Automation and magic scale systems without creating free cargo, crews or knowledge.
- Quest and event hooks bind to real world state.
- Difficulty and accessibility support relaxed through harsh maritime play.
- LOD promotion and demotion preserve identity and resource conservation.
- Multiplayer authority and contribution rules are explicit.
- Godot/Summer architecture avoids Node-per-record and unbounded world recalculation.
- Set 25 facets, relationships, capabilities, packs, validation and release gates are defined.
- Prototype laboratories and staged implementation gates are complete.
- The 26K/26L boundary is explicit and tactical outcomes are deferred correctly.
- Formal handoff inputs and outputs for 26L are complete.

**End of Document 26K — Maritime Trade, Fleets, Piracy, Navies and Regional Power — Version 0.1**
