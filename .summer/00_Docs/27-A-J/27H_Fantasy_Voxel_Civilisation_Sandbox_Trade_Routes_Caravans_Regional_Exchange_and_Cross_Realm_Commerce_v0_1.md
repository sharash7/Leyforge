# FANTASY VOXEL CIVILISATION SANDBOX

## DOCUMENT SET 27

# 27H - Trade Routes, Caravans, Regional Exchange and Cross-Realm Commerce

**Version 0.1 - Detailed Economic Design Bible and Spatial-Commerce Architecture Draft**

*A data-driven spatial-commerce system for trade routes, terrestrial caravan economics, imports and exports, regional specialisation, intermodal freight, cross-realm exchange, route profitability, distant trade simulation and persistent civilisation-scale economic consequences in Leyforge.*

> **Trade Route and Regional Exchange System Statement**
>
> Leyforge trade must move through the same physical world the player travels, builds, defends and reshapes. A profitable price difference does not teleport goods. A caravan requires real cargo, ownership, a valid economic mission, transport capacity, route access, time, labour, supplies, handling capability and enough capital or contractual support to complete the journey. Imports should relieve actual shortages only when they arrive. Exports should remove actual local stock when dispatched. Regional specialisation should create reasons to trade without making any world seed dependent on one mandatory foreign supplier. Maritime voyages, terrestrial travel and realm traversal remain owned by their specialist systems; 27H owns the economic network, shipment, mission, route-value and regional-exchange consequences built on top of those truths.

| Field | Locked Direction |
| --- | --- |
| Document Set | This is Document 27H in Document Set 27: Economy, Markets, Contracts, Trade and Public Finance. |
| Primary Ownership | Economic trade-route definitions, route opportunities, import/export planning, shipment/consignment records, terrestrial caravan economic missions, route profitability, regional exchange networks, intermodal economic chains and cross-realm commerce economics. |
| Physical-Transport Rule | 27H never moves a mount, wagon, ship, passenger or cargo stack by itself. Set 30 owns terrestrial movement; Set 26 owns maritime execution; realm/portal owners expose dimensional traversal. 27H consumes their authoritative travel, capacity and outcome interfaces. |
| Conservation Rule | Exported stock is reserved and removed from the origin through authoritative custody transfer. Imported stock is credited only after authoritative delivery. Expected arrivals are information, not inventory. |
| Market Rule | 27C owns local market state and supply-demand pressure. 27H decides whether trade opportunities and shipments connect markets; delivered imports/exports feed 27C through actual stock and expected-arrival events. |
| Price Rule | 27B owns reference value, contextual fair value, currency conversion and executable prices. 27H consumes those values to estimate and settle route economics. |
| Contract Rule | 27E owns accepted trade, freight, delivery, service and passenger contract obligations. 27H owns the spatial commercial mission that may fulfil those obligations. |
| Enterprise Rule | 27D owns enterprises, employment, wages, ownership and operator authority. 27H references the trader/caravan enterprise and its authorised assets, staff and funds. |
| Finance Rule | 27F owns credit, debt, letters of credit, insurance and claims. 27H supplies route exposure, dispatch, custody, loss, delay and realised-margin evidence. |
| Fiscal Rule | 27G owns tariffs, customs, tolls, duties and treasury posting. 27H includes those assessed costs in route economics but does not define tax policy. |
| Illicit-Economy Boundary | 27I will own embargo-evasion economics, black-market routing, smuggling networks, monopoly conflict and sanctions. 27H records lawful/restricted route access and disruption signals without finalising illicit systems. |
| Maritime Boundary | 26K/26N remain authoritative for maritime trade routes, cargo voyages, fleets, convoys, ports and naval route disruption. 27H supplies universal regional-exchange and intermodal economic contracts without replacing maritime execution. |
| Cross-Realm Boundary | Document 14 and realm-specific systems own portals, realm geography, survival rules and access mechanics. 27H owns economic exchange, shipment/custody and route-value consequences across valid realm links. |
| Cross-Set Contract | The Leyforge Document Sets 27-30 Cross-Set Interface Register v1.0 remains governing. New required interfaces are recorded in Section 58. |
| Engine Direction | Godot runtime with Summer Engine-assisted development under Set 25 governance. Trade state is authoritative, event-driven, persistent, deterministic where required and simulation-LOD aware. |
| Next Deliverable | 27I - Monopolies, Embargoes, Smuggling, Black Markets and Economic Conflict. |

# Document Purpose

Document 27H defines how economic value moves across space in Leyforge. Documents 27B-27G already establish value, prices, markets, merchants, enterprises, labour, contracts, finance, insurance, taxation and public treasuries. Earlier world, settlement and maritime documents establish roads, warehouses, ports, vehicles, vessels, portals, terrain, hazards and persistent settlements. What remained missing was the universal economic layer that turns those systems into regional trade networks without duplicating their physical execution.

The central design rule is simple: **trade is a chain of authoritative states, not a background teleport.** A settlement may have excess grain and another may have a shortage, but trade occurs only if someone discovers or predicts the opportunity, can acquire and reserve the grain, has legal and physical access to a route, obtains suitable transport, pays or secures required costs, survives the journey or accepts its risk, unloads at a valid destination and finally commits the sale, delivery or storage transfer. Distant simulation may batch these steps, but it must preserve quantity, ownership, custody, time, loss, delay, cost and outcome.

27H also makes geography economically meaningful. Regions differ because of resource distribution, climate, culture, infrastructure, skills, settlement development, magical conditions, realm access and history. Those differences create comparative economic strengths and trade demand. The system should encourage players to build roads, protect routes, establish depots, operate caravans, restore bridges, open ports, negotiate access, use portals and connect settlements. It must not make one rare resource corridor mandatory for basic progression; Set 25 capability and fallback rules remain authoritative for reachability.

The document supports both simple and deep play. A casual player may accept a caravan job, buy cheap goods in one settlement and sell them elsewhere, or see a merchant warn that an expected shipment is late. A trade-focused player may operate multiple enterprises, compare route margins, organise scheduled caravans, establish warehouses and hubs, combine road, sea and portal legs, finance shipments, insure cargo and shape regional economies. NPC settlements and factions use the same foundations at appropriate simulation detail.

# Design Sources, Authority and Supersession

| Source | Existing Direction | 27H Use / Boundary |
| --- | --- | --- |
| 00 - Master Game Design Bible | Living civilisations, trade, player freedom, settlement growth and world consequence. | Trade makes geography and civilisation interdependence visible without becoming mandatory accounting. |
| 01 - Core Gameplay Loop | Explore, gather, craft, build, interact, automate, defend, upgrade and expand. | Trade routes connect exploration, production, settlement needs, construction and defence into new goals. |
| 02 - Player Progression | Trading, exploration, leadership and animal handling are legitimate progression paths. | Route knowledge and trade capability may improve through progression without hard-locking basic commerce. |
| 04 - Items Registry | Physical trade goods, quality, condition, ownership, perishability and value references. | Shipment records reference actual items/lots and preserve condition/provenance. |
| 05 - Crafting and Recipe Registry | Production consumes real inputs and produces real outputs over time. | Export supply must originate from real production or stock; trade never substitutes free abstract output. |
| 06 - Resource Progression | Strategic resources, cultural goods, scarcity and long-term material identity. | Regional specialisation and cross-realm exchange preserve distinct resource roles. |
| 07 - NPC Village System | Named NPCs, settlements, warehouses, needs, jobs, schedules and distant simulation. | Supplies origin/destination actors, stock, labour and settlement demand; 27H does not redefine NPC AI identity. |
| 08 - Automation System | Physical logistics, warehouses, item routing, power and bounded distant flow. | Local logistics can feed or receive trade hubs; external trade remains a distinct authorised transfer. |
| 11 - Biomes and World Generation | Roads, terrain, climate, resources, regions and dynamic world state. | Provides route context and regional production conditions; 27H does not calculate terrain traversal. |
| 13 - Races, Peoples, Cultures and Factions | Culture, faction, law, territory, language and diplomacy are separate systems. | Trade access, preferences and permissions consume these identities without ancestry determinism. |
| 14 - Dimensions | Persistent realms, portals, hazards, societies, resources and cross-realm consequences. | Cross-realm trade uses valid realm access and constraints; 27H owns only economic exchange and shipment consequences. |
| 15 - Quest and Event System | Delivery, escort, trade, construction and world events are persistent objectives/consequences. | Routes and shipments expose objective modules, events, failures and history. |
| 16 - Combat, Gear and Defence | Threats, escorts, raids, ambushes, protection and persistent aftermath. | 27H consumes security/risk outcomes; tactical combat and escort behaviour remain outside Set 27. |
| 17 - UI/UX System | World-first maps, trade information, route knowledge, accessibility and truthful failure reasons. | Route planner, import/export summaries, caravan ledgers and uncertainty indicators follow the shared UI grammar. |
| 19-20 - Settlement and Building Systems | Roads, warehouses, markets, depots, services, projects and seven settlement needs. | Trade endpoints require real functioning capability; a decorative warehouse does not create trade capacity. |
| 25B-25E | Stable IDs, schemas, relationships, capabilities, packs, validation and release gates. | Route, shipment, trade-network and intermodal records use governed IDs and explicit source ownership. |
| 26J | Ports, cargo handling, crews, port calls and maritime civilisation. | Port nodes and handling capability become maritime/intermodal economic endpoints. |
| 26K | Physical maritime cargo, maritime trade routes, voyage/fleet missions, customs, blockades and regional maritime power. | 27H consumes maritime execution and supplies universal regional exchange, pricing, contract and market consequences. |
| 26N | Maritime progression, economy integration, contracts, markets and realm-linked maritime content. | Provides maritime extension facets and progression requirements; 27H avoids duplicate maritime registries. |
| 27A | Universal economy ownership, spatial-economy principles and Set 30/Set 26 interfaces. | Governing parent architecture. |
| 27B | Currency, barter, valuation, price and exchange. | Supplies acquisition/sale values, conversion and quote inputs for route economics. |
| 27C | Market state, supply/demand pressure, merchant stock and expected arrivals. | Supplies import/export opportunities; receives expected-arrival and delivered-stock consequences. |
| 27D | Labour, wages, households, enterprises and ownership. | Supplies operators, employees, enterprise authority, asset ownership and labour costs. |
| 27E | Contracts, delivery obligations, services, escrow, breach and evidence. | Supplies accepted freight/delivery obligations and settlement rules. |
| 27F | Credit, trade finance, insurance, collateral and claims. | Supplies financing and insurance; consumes route exposure and loss evidence. |
| 27G | Taxes, tariffs, tolls, customs, public finance and route-bound charges. | Supplies assessed fiscal costs and clearance results. |

> **Supersession Note**
>
> Once 27H is approved, any earlier assumption that regional trade can be represented as instant settlement-to-settlement stock transfer, that a price difference alone guarantees profitable trade, that expected imports count as delivered stock, or that terrestrial caravan travel may be simulated by Set 27 without Set 30 route truth is superseded. Existing POC fixtures may use simplified deterministic deliveries only when clearly marked as test scaffolding.

# Static Table of Contents

1. Locked Trade Route and Regional Exchange Identity  
2. Locked Decision Summary  
3. Scope and Explicit Non-Goals  
4. Canonical Trade and Route Terminology  
5. Source-of-Truth and Ownership Boundaries  
6. Spatial-Commerce Architecture  
7. Economic Route Definitions  
8. Route Endpoints, Legs, Corridors and Handoffs  
9. Route Discovery, Knowledge and Confidence  
10. Trade Opportunity Generation  
11. Imports, Exports and Residual Market Need  
12. Regional Specialisation and Comparative Suitability  
13. Export Readiness and Protected Local Supply  
14. Shipment, Consignment and Trade-Lot Architecture  
15. Shipment Lifecycle and Authoritative State Changes  
16. Cargo Ownership, Custody and Provenance  
17. Reservations, Booking and Capacity Commitments  
18. Acquisition, Consolidation and Origin Handling  
19. Terrestrial Caravan Economic Missions  
20. Caravan Enterprise, Ownership and Commercial Roles  
21. Set 30 Terrestrial Movement Handoff  
22. Scheduling, Frequency, Departures and Service Reliability  
23. Capacity, Load Factor and Marginal Cargo  
24. Route Cost Architecture  
25. Expected Margin, Realised Margin and Profitability  
26. Route Risk, Delay, Loss and Economic Exposure  
27. Freight, Delivery and Passenger Contract Integration  
28. Credit, Trade Finance and Insurance Integration  
29. Taxes, Tolls, Tariffs and Customs Integration  
30. Market Feedback and Expected-Arrival Integration  
31. Currency, Barter and Cross-Market Settlement  
32. Enterprises, Merchants, Producers and Buyers  
33. Warehouses, Depots, Handling and Storage Economics  
34. Trade Hubs, Relays and Transshipment  
35. Intermodal Trade Networks  
36. Maritime Commerce and Document Set 26 Integration  
37. Realm Gates, Portals and Dimensional Route Interfaces  
38. Cross-Realm Commerce  
39. Realm Materials, Stability, Containment and Return Logistics  
40. Culture, Diplomacy, Reputation and Access Boundary  
41. Survival, Provisions, Workforce and Set 29 Boundary  
42. Escorts, Security, Ambush and Conflict Boundary  
43. Blockades, Closures, Embargo Signals and 27I Boundary  
44. Regional Trade Networks and Settlement Consequences  
45. NPC and Faction Trade Decision Model  
46. Player Trade Roles and Career Paths  
47. Quests, Events and Persistent Trade History  
48. Trade Knowledge, Intelligence and Forecasting  
49. UI/UX, Maps, Ledgers and Player Trust  
50. Difficulty, Accessibility and Economy Assistance  
51. Simulation LOD and Distant Trade  
52. Persistence, Reconciliation and Recovery  
53. Multiplayer Authority and Transaction Safety  
54. Set 25 Schemas, Relationships and Validation  
55. Godot/Summer Engine Technical Architecture  
56. Validation Invariants and Acceptance Scenarios  
57. Production Classification, Risks and Open Decisions  
58. Cross-Set Interface Amendments  
- Appendix A. Economic Route Definition Template  
- Appendix B. Shipment and Consignment Runtime Template  
- Appendix C. Terrestrial Caravan Economic Mission Template  
- Appendix D. Intermodal and Cross-Realm Route Template  
- Appendix E. Initial Trade Reason-Code Catalogue  
- Appendix F. Cross-System Interface Matrix  
- Appendix G. 27H Completion Checklist

# 1. Locked Trade Route and Regional Exchange Identity

Trade routes are the **spatial exchange layer** of Leyforge's economy. They describe why and under what economic conditions goods, services or passengers move between places. They do not physically move them. A route links valid economic endpoints and consumes transport-system truth to determine whether exchange can occur, how much it costs, how long it is expected to take and what happens economically when the trip succeeds, fails, delays or changes mode.

> **Locked Rule**
>
> A trade route may create an opportunity, plan, reservation, expectation or contract, but only an authoritative transport result may create arrival. No route planner, distant simulation tick, price differential or UI forecast may credit destination inventory before the transport owner confirms delivery.

## 1.1 Player-Facing Promise

A player should be able to understand:

- why one settlement imports a good and another exports it;
- why a route is profitable or unprofitable;
- why a caravan cannot depart;
- why an expected delivery is late;
- why a road closure changed a market;
- why a shorter route can still cost more;
- why an under-filled caravan may not be worth sending;
- why a high-value cargo needs more security or insurance;
- why a port, bridge, depot or portal changes regional trade;
- why a settlement stopped exporting during a shortage;
- why a realm good is valuable after the return cost and stabilisation expense are considered;
- whether a route estimate is current knowledge or an uncertain forecast.

## 1.2 Identity Layers

| Layer | Meaning | Example |
| --- | --- | --- |
| Trade Opportunity | Temporary economic reason to move value between endpoints. | Iron surplus in Mining Town, shortage in River City. |
| Economic Route | Persistent economic relationship and leg graph between valid endpoints. | Mining Town -> East Road Depot -> River City. |
| Route Leg | One transport-mode segment delegated to a movement owner. | Wagon leg from town to port. |
| Shipment | Authoritative commercial movement record for goods/services/passengers. | 80 iron ingots reserved for River City. |
| Consignment | Ownership/custody grouping within a shipment. | Player-owned iron under merchant-caravan custody. |
| Caravan Economic Mission | Set 27 commercial assignment for a terrestrial convoy/vehicle group. | Deliver contracted grain and speculative cloth cargo. |
| Expected Arrival | Market-information projection generated from a valid shipment/route state. | 100 medicine due in 1.5 days, medium confidence. |
| Regional Trade Network | Summary of repeated economic exchange among routes/endpoints. | Western grain corridor. |
| Intermodal Chain | Shipment using more than one transport mode with explicit handoffs. | Wagon -> ship -> portal courier. |
| Cross-Realm Trade Chain | Economic route with one or more valid realm transitions. | Overworld mana tools -> Fae Realm herbs -> Overworld. |

# 2. Locked Decision Summary

| Area | Locked Decision |
| --- | --- |
| Route Model | Economic routes are persistent records composed of valid endpoints and one or more mode-specific legs. Physical traversal belongs to the leg owner. |
| Route Creation | Routes may be discovered, surveyed, historically known, negotiated, world-generated, player-created or institutionally chartered. Economic activation still requires viable endpoints and transport. |
| Trade Opportunity | Generated from residual market need/surplus, contract obligations, strategic/public demand, production plans, passenger/service demand and valid access. Price difference alone is insufficient. |
| Imports/Exports | Export removes/reserves real origin stock; import becomes real only at authoritative arrival. Regional summaries may aggregate but must reconcile. |
| Regional Specialisation | Emerges from resource access, climate, culture, skills, infrastructure, technology, magic, realm access and history. Never ancestry-essentialist and never a hard mandatory progression lock. |
| Protected Supply | Settlements do not export stock already reserved for provisions, projects, contracts, emergencies or policy minimums unless authorised override exists. |
| Caravan Ownership | Caravan economic missions belong to an enterprise/public body/actor with authority over cargo, funds and contracted transport. Set 30 owns physical caravan movement/formation. |
| Capacity | 27H consumes usable cargo/passenger capacity from Set 30/26. Economic load factor and booking use that value but do not alter vehicle physics. |
| Profitability | Expected and realised route margin include acquisition, sale value, wages, handling, storage, operating resources, maintenance allocation, finance, insurance, fiscal charges and realised losses. |
| Risk | Risk is a typed exposure profile built from signals supplied by world, conflict, weather, social/legal and transport owners. 27H values economic exposure but does not simulate the underlying hazard. |
| Scheduled Trade | Repeating routes are supported through service schedules and order policies. Each departure still requires real cargo, capacity, funds and access. No timer-generated goods. |
| Empty Returns | Backhaul opportunities are evaluated separately. A vehicle may return empty if no suitable trade exists; the economy does not invent return cargo for efficiency. |
| Intermodal Trade | Supported through explicit custody/handling handoffs. One shipment can have multiple legs without duplicating ownership or inventory. |
| Maritime Trade | 26K/26N own voyage/fleet/port execution. 27H integrates maritime legs into universal route economics and regional exchange. |
| Cross-Realm Trade | Supported when realm access is valid. Portal capacity, traversal rules, time effects and hazards come from realm owners; 27H values and records exchange. |
| Passenger Commerce | Passenger/service contracts are allowed, but people are never cargo items. Passenger identities/capacity come from owning systems. |
| Distant Trade | Uses bounded shipment batches and event checkpoints, never millions of simulated wheel rotations or unbounded merchant trades. |
| Information | Route estimates have source, timestamp, coverage and confidence. Unknown or stale access cannot be presented as certainty. |
| Player Complexity | Default UI offers clear route opportunity, expected margin and blockers. Advanced players may inspect full cost and network data. |
| Multiplayer | Server-authoritative reservations, dispatch, custody handoffs, arrivals and settlement. No client may create arrival or alter route cost truth. |

# 3. Scope and Explicit Non-Goals

## 3.1 In Scope

27H owns:

- economic route definitions and route-network records;
- economic route opportunity generation;
- import/export planning and regional exchange;
- shipment, consignment and commercial custody state;
- origin reservation and destination-arrival economic posting;
- terrestrial caravan economic missions;
- scheduled commercial service policies;
- load-factor and capacity-use economics;
- route cost, expected margin and realised margin;
- intermodal commercial handoffs;
- expected-arrival creation and updates to 27C;
- regional specialisation and trade-network summaries;
- cross-realm commerce economics;
- trade knowledge/forecast confidence;
- route-economy simulation LOD, persistence and reconciliation;
- Set 25 schema/validation contracts for the above.

## 3.2 Explicit Non-Goals

27H does not own:

- walking, riding, pathfinding, mount stamina, wagon physics, vehicle steering or breakdown mechanics - Set 30;
- ship movement, buoyancy, navigation, maritime convoy execution or naval operations - Set 26;
- portal construction, realm generation, realm survival rules or dimensional traversal mechanics - Document 14 and realm owners;
- market supply-demand calculation - 27C;
- price calculation or currency exchange - 27B;
- merchant personality or negotiation - Set 28;
- general business ownership, payroll or enterprise profit accounting - 27D;
- contract formation/breach - 27E;
- lending/insurance - 27F;
- tariffs/tolls/taxes - 27G;
- black markets, smuggling-route economics, sanctions, cartel conflict or embargo evasion - 27I;
- tactical combat, escort AI or ambush combat - Document 16/Set 30/creature systems;
- global instantaneous auction networks;
- background trade that creates stock to make a settlement look busy;
- mandatory manual route spreadsheets for ordinary players.

# 4. Canonical Trade and Route Terminology

| Term | Definition |
| --- | --- |
| Economic Endpoint | Valid place/service where goods, passengers, custody or settlement can originate, transfer or terminate. |
| Route Corridor | Known geographic or magical connection context containing one or more possible legs. |
| Route Leg | One movement-owned segment with declared origin, destination, mode, accessibility and travel result. |
| Economic Route | Set 27 record combining endpoint, commercial, cost, access and knowledge data over one or more legs. |
| Route Opportunity | Time-bounded economic proposition to move defined value because expected benefit/obligation exists. |
| Shipment | Authoritative economic movement record containing cargo/passenger/service commitments across route legs. |
| Consignment | Subset of a shipment sharing owner, custody, contract or destination terms. |
| Cargo Lot | Physical inventory grouping referenced by shipment; item quantity remains owned by inventory systems. |
| Dispatch | Authoritative state transition confirming cargo/custody left the origin under a valid transport mission. |
| Arrival | Authoritative transport-owner confirmation that a shipment or leg reached its destination/transfer point. |
| Handoff | Explicit custody/control transition between carriers, modes, facilities or realms. |
| Backhaul | Return-direction cargo or passenger opportunity using capacity that would otherwise travel empty. |
| Load Factor | Economically used capacity divided by transport-exposed usable capacity for the relevant class. |
| Route Reliability | Bounded historical/forecast measure of successful, timely movement under known conditions. |
| Route Risk Exposure | Economic interpretation of supplied hazard probabilities/severity, never the hazard simulation itself. |
| Import | Delivered value entering an economic region/market from outside the chosen scope. |
| Export | Dispatched value leaving an economic region/market for outside that scope. |
| Transshipment | Transfer through an intermediate hub without treating the hub as final consumption. |
| Intermodal Chain | Shipment using multiple transport modes with explicit transfer records. |
| Regional Specialisation | Persistent tendency for a region to efficiently supply particular goods/services due to valid world factors. |
| Trade Network | Set of routes/endpoints with repeated exchange and bounded aggregate statistics. |
| Realm Transition Leg | Transport-owned segment crossing a valid dimensional boundary. |

# 5. Source-of-Truth and Ownership Boundaries

27H follows the one-owner-per-truth rule.

| Question | Authoritative Owner | 27H Role |
| --- | --- | --- |
| How many items exist at origin? | Inventory/warehouse system | Reserve/reference quantity only. |
| What does the destination need? | 07/20 + 27C | Consume residual demand/market pressure. |
| What is an item worth? | 27B | Use value/quote in economic calculation. |
| Who owns the business/caravan assets? | 27D | Reference owner/operator authority. |
| What must a delivery contract satisfy? | 27E | Bind shipment to obligation and evidence. |
| Is shipment financed/insured? | 27F | Reference financing/policy/claim state. |
| What toll/tariff is due? | 27G | Include assessed amount/result. |
| Can a wagon traverse the route? | Set 30 | Consume accessibility/time/capacity/outcome. |
| Can a ship complete the voyage? | Set 26 | Consume voyage/port/fleet execution. |
| Can a portal/realm transition be used? | Document 14/realm owner | Consume access/capacity/hazard/time interfaces. |
| Is an NPC willing to trade/help? | Set 28 | Consume social permission/negotiation output. |
| Does injury/fatigue reduce travel capability? | Set 29 -> Set 30 | Consume resulting capacity/time through transport interface. |
| Is route attacked? | Combat/event/creature systems | Consume event outcome and economic loss. |
| Is trade illegal/smuggled? | 27I + law/social systems | Consume restriction and enforcement/evasion outcomes. |

# 6. Spatial-Commerce Architecture

27H uses six cooperating layers.

| Layer | Purpose | Examples |
| --- | --- | --- |
| Opportunity Layer | Detects valid reasons to exchange across space. | Grain shortage, iron surplus, construction contract, passenger demand. |
| Route Layer | Describes economic endpoints, legs, access and commercial characteristics. | Road route, road-to-port route, portal route. |
| Shipment Layer | Owns economic movement intent, cargo references, custody, obligations and settlement state. | 100 grain from A to B. |
| Transport Adapter Layer | Queries Set 30, Set 26 or realm owner and receives travel truth. | Capacity, ETA, accessibility, delay. |
| Market/Finance/Fiscal Layer | Prices, demand, contracts, finance, insurance and charges. | Quote, tariff, premium, freight contract. |
| Regional Summary Layer | Bounded aggregate history, trade flows and network health. | Top imports, route reliability, net trade volume. |

The architecture is event-driven. Markets do not poll every route every frame, and routes do not scan every inventory. Significant state changes publish bounded economic events such as `market.shortage_changed`, `shipment.dispatched`, `transport.delay_reported`, `route.access_changed`, `shipment.arrived`, `customs.assessed` and `contract.delivery_settled`.

# 7. Economic Route Definitions

An Economic Route is a reusable commercial relationship, not a guaranteed journey.

Minimum fields:

- stable route ID;
- route type/family;
- origin endpoint;
- destination endpoint;
- ordered route legs;
- allowed cargo/service classes;
- transport capability requirements;
- known access/permission requirements;
- handling/transfer points;
- expected cost model references;
- known toll/tariff/customs jurisdictions;
- route knowledge source and confidence;
- seasonal/event dependencies where exposed;
- fallback/alternate route references;
- production status and content-pack dependencies.

A route may exist while temporarily inactive. A bridge collapse, border closure, storm season, portal instability, shortage of suitable vehicles or missing crew can make the route unavailable without deleting its history.

# 8. Route Endpoints, Legs, Corridors and Handoffs

## 8.1 Endpoint Families

- settlement market/warehouse;
- enterprise warehouse or production site;
- mine/quarry/farm/resource depot;
- caravanserai/road depot;
- customs/border facility;
- port or harbour node;
- ferry/river crossing;
- rail or guided-transport terminal;
- portal/realm gate;
- specialist expedition base;
- temporary military/relief/logistics camp when valid.

An endpoint must expose actual capability. A visual roadside shed is not a trade depot unless its building/structure contract provides storage, access, handling and permission.

## 8.2 Route Leg Contract

Each leg declares:

- transport owner/system;
- mode class;
- start/end anchors;
- accessibility state;
- usable cargo/passenger capacity supplied by transport;
- expected/actual travel duration;
- required operating resources/services;
- risk/disruption signals;
- transfer/arrival event interface.

27H may compare legs economically but must not calculate physical movement values itself.

# 9. Route Discovery, Knowledge and Confidence

Trade networks should not be a perfect omniscient map.

Route knowledge may come from:

- personal travel;
- maps and surveys;
- merchants and caravaners;
- settlement records;
- faction/guild intelligence;
- port/road authorities;
- quest discoveries;
- scouts;
- magical observation where supported;
- previous shipments.

Every observation may carry:

- timestamp;
- source;
- spatial coverage;
- reliability/confidence;
- known seasonal limitations;
- known access requirements;
- last confirmed travel time;
- last confirmed disruption.

A player may know a route exists but not know its current safety, tolls or market conditions. Set 28 owns social truth/rumour provenance; 27H owns economic route observation freshness.

# 10. Trade Opportunity Generation

A trade opportunity exists when there is a plausible economic or contractual reason to move value and enough information to evaluate it.

Opportunity sources include:

- residual destination shortage from 27C;
- origin sellable surplus from 27C;
- accepted purchase/delivery contract from 27E;
- enterprise procurement plan from 27D/27C;
- public procurement/relief need from 27G;
- passenger/service demand;
- production input shortage;
- construction/project material demand;
- strategic faction supply request;
- backhaul capacity;
- event-driven emergency demand;
- cross-realm specialty demand.

## 10.1 Opportunity Validation

A price difference is only one input. A candidate opportunity must also consider:

- quantity available after reserves;
- destination ability/willingness to buy;
- route access;
- capacity;
- acquisition funds;
- handling/storage;
- time sensitivity and spoilage;
- expected operating cost;
- taxes/tolls/tariffs;
- finance/insurance cost;
- known risk;
- deadline/contract terms;
- return-trip implications;
- knowledge confidence.

# 11. Imports, Exports and Residual Market Need

Imports and exports are scope-relative labels, not special item types.

## 11.1 Export Rule

Stock may be exported only if it is economically available after:

- protected settlement reserves;
- active contracts;
- construction/project reservations;
- emergency stock;
- enterprise internal requirements;
- legal/export restrictions;
- storage/custody constraints.

Dispatch removes or changes custody of real origin stock. An export statistic cannot rise without an authoritative dispatch.

## 11.2 Import Rule

An expected shipment may reduce market panic through 27C's expected-arrival confidence, but it does not satisfy physical need until arrival and destination transfer commit.

# 12. Regional Specialisation and Comparative Suitability

Leyforge regions may develop persistent economic strengths through real world factors.

| Factor | Examples |
| --- | --- |
| Resource Base | Iron, timber, grain, herbs, mana crystals, fish, realm materials. |
| Climate/Biome | Crop suitability, preservation needs, livestock, fibre, timber type. |
| Culture/Knowledge | Specialist recipes, crafts, shipbuilding, runes, medicines. |
| Infrastructure | Roads, ports, warehouses, power, automation, markets, portals. |
| Labour/Skills | Smiths, farmers, miners, mages, traders, shipwrights. |
| Capital/Finance | Credit access, insurance, public investment. |
| Safety/Access | Stable routes, patrols, border rights, hazard levels. |
| History | Old trade towns, ruined roads, wars, restored corridors. |

Regional specialisation is a tendency, not a fixed monopoly. A player can intentionally build competing capability by investing in knowledge, infrastructure, labour and supply chains.

## 12.1 Reachability Rule

No essential progression chain may depend on a single remote trade source unless the game deliberately provides alternative local, quest, crafting, exploration or fallback access. Set 25 progression reachability remains authoritative.

# 13. Export Readiness and Protected Local Supply

A settlement should not starve itself merely because an external price is high.

`ExportReadyQuantity` is derived from:

`authoritative_stock - protected_reserves - committed_stock - internal_required_stock - safety_buffer`

All components are supplied by their owning systems. 27H never invents the reserve values.

Possible export states:

- `open_export`;
- `limited_export`;
- `contract_only`;
- `strategic_hold`;
- `emergency_embargo` (policy signal; detailed conflict/evasion in 27I);
- `no_surplus`;
- `access_blocked`.

# 14. Shipment, Consignment and Trade-Lot Architecture

A shipment is the persistent economic record of movement.

A shipment may contain multiple consignments where:

- different owners share a caravan;
- one carrier transports several merchants' goods;
- a public relief shipment shares transport with commercial cargo;
- different contract obligations share compatible handling;
- a multi-stop route unloads consignments at different endpoints.

Each consignment records:

- owner/principal;
- custodian/carrier;
- cargo lot references;
- origin and final destination;
- contract reference if any;
- declared/insured value reference;
- cargo condition requirements;
- legal/fiscal classifications;
- priority;
- handoff history;
- final settlement outcome.

# 15. Shipment Lifecycle and Authoritative State Changes

Recommended lifecycle:

1. `planned`
2. `awaiting_stock`
3. `stock_reserved`
4. `awaiting_capacity`
5. `booked`
6. `awaiting_clearance`
7. `ready_to_dispatch`
8. `dispatched`
9. `in_transit`
10. `at_transfer_hub` where intermodal
11. `delayed` / `partially_lost` / `blocked` where applicable
12. `arrived`
13. `unloading_or_handoff`
14. `delivered`
15. `financial_settlement_pending`
16. `closed`

Cancellation/failure states retain evidence rather than disappearing.

## 15.1 State Authority

- 27H can plan/book/reserve and create economic dispatch intent.
- Inventory/custody transfer must commit authoritative stock.
- Set 30/26/realm owner confirms movement departure/arrival.
- 27E decides contract completion where applicable.
- 27F decides claims/insurance.
- 27C receives expected/delivered market consequences.

# 16. Cargo Ownership, Custody and Provenance

Ownership and custody are separate.

Example:

- Player enterprise owns 50 mithril tools.
- Caravan company accepts custody under a freight contract.
- Border depot temporarily holds the goods under customs control.
- Maritime carrier receives them for a sea leg.
- Destination merchant receives ownership only after contract acceptance/payment terms are satisfied.

Each custody transition records actor, time, location, quantity, condition and evidence. This prevents cargo from being duplicated during intermodal transfers or save/load boundaries.

# 17. Reservations, Booking and Capacity Commitments

A shipment may reserve:

- origin inventory;
- carrier capacity;
- warehouse staging space;
- loading/unloading service capacity;
- scheduled departure slot;
- port/terminal service window;
- contract escrow/payment capacity;
- public relief priority where authorised.

Reservations expire or release under explicit rules. A cancelled shipment must return unconsumed stock/capacity to the correct owner without cloning it.

# 18. Acquisition, Consolidation and Origin Handling

A trader may source cargo through:

- own production;
- merchant purchases;
- market procurement orders;
- producer contracts;
- warehouse transfers;
- public procurement;
- barter;
- salvage/prize systems where lawful and owned elsewhere;
- cross-realm exchange.

Consolidation allows multiple smaller lots to become one shipment while preserving provenance and ownership. Handling costs can reflect loading labour, packaging, preservation, storage and special containment.

# 19. Terrestrial Caravan Economic Missions

A **Caravan Economic Mission** is the Set 27 commercial record that tells Set 30 what economic work a terrestrial transport group is intended to perform.

It may include:

- carrier/enterprise ID;
- shipment IDs;
- origin/destination/handoff endpoints;
- route/alternate route references;
- cargo priority and compatibility classes;
- passenger/service obligations;
- deadline/time window;
- transport budget;
- required capacity class;
- required stops/services exposed by Set 30;
- toll/customs obligations;
- risk tolerance/insurance reference;
- dispatch conditions;
- cancellation/abort conditions;
- expected-arrival publication rules.

The mission never specifies steering, pathfinding, mount stamina, wagon acceleration or combat behaviour.

# 20. Caravan Enterprise, Ownership and Commercial Roles

27D supplies the commercial actors.

Possible terrestrial trade operators:

- independent merchant;
- household trader;
- caravan enterprise;
- guild carrier;
- producer cooperative;
- settlement/public logistics office;
- faction supply service;
- player company;
- hired carrier under 27E contract.

Commercial roles may include:

- cargo owner/principal;
- carrier/operator;
- caravan master/manager;
- hired driver/handler supplied by NPC/job systems;
- quartermaster/logistics planner;
- guard/security provider;
- customs broker/agent where later supported;
- financier/insurer external to transport.

27H records which role bears which economic cost/risk under the contract. Set 28 owns interpersonal trust and companion contracts; Set 30 owns physical passenger/driver positions.

# 21. Set 30 Terrestrial Movement Handoff

Set 30 is authoritative for terrestrial transport execution.

## 21.1 27H -> Set 30

27H supplies:

- caravan mission ID;
- shipment/cargo references;
- required cargo/passenger capacity class;
- authorised origin/destination/waypoints;
- economic route preference/alternate route IDs;
- cargo priority/handling class;
- contract deadline/window;
- transport budget ceiling where relevant;
- toll/customs clearance state;
- cancellation/return policy;
- economic consequence callbacks required.

## 21.2 Set 30 -> 27H

Set 30 supplies:

- assigned mount/vehicle/transport asset references;
- usable cargo/passenger capacity;
- movement mode;
- route accessibility;
- expected and actual travel duration;
- terrain/service/stop requirements;
- operating-resource/service usage;
- asset condition and maintenance state;
- breakdown/delay state;
- departure and arrival events;
- cargo/passenger loss/damage events caused by transport where applicable;
- alternate-route/travel failure result.

## 21.3 Ownership Rule

27H may decide that Route A is economically preferable to Route B using the values Set 30 exposes. It may not decide that a wagon can climb a slope, cross a river, carry 2,000 kg or travel faster because the trade would be more profitable.

# 22. Scheduling, Frequency, Departures and Service Reliability

Repeated trade uses **service policies**, not magic restock timers.

A scheduled route may specify:

- review cadence;
- target departure interval;
- minimum cargo threshold;
- priority contracts;
- departure window;
- backhaul policy;
- reserve floor;
- maximum acceptable cost/risk;
- alternate route/carrier policy.

At each departure review, the system revalidates stock, capacity, access, finance and need. If those conditions fail, the departure is delayed or cancelled rather than spawning cargo.

# 23. Capacity, Load Factor and Marginal Cargo

Transport capacity is scarce economic infrastructure.

`LoadFactor = BookedCompatibleCapacity / UsableCompatibleCapacity`

The exact capacity unit belongs to the transport owner: volume, slots, mass, passenger seats or typed capability. 27H uses the exposed compatible measure.

Economic effects:

- low load factor raises cost per delivered unit;
- high load factor may improve efficiency but reduce flexibility;
- dangerous/fragile cargo may intentionally leave unused capacity;
- priority cargo may displace lower-priority speculative cargo under explicit policy;
- backhaul improves round-trip economics without being guaranteed.

# 24. Route Cost Architecture

Expected route cost is modular and explainable.

Potential components:

- cargo acquisition cost;
- loading/handling cost;
- packaging/preservation/containment;
- wages/contracted labour from 27D;
- transport operating resources from Set 30/26;
- maintenance allocation from asset owner;
- stable/berth/depot/warehouse fees;
- tolls/tariffs/duties/customs from 27G;
- finance cost from 27F;
- insurance premium from 27F;
- security/escort service contract cost;
- expected loss allowance;
- spoilage/condition degradation expectation;
- realm stabilisation cost;
- currency/exchange settlement cost from 27B;
- transfer/transshipment cost;
- return-leg or empty-return allocation.

No cost component may be invented by 27H when another system owns it.

# 25. Expected Margin, Realised Margin and Profitability

## 25.1 Expected Margin

A recommended planning relationship is:

`ExpectedMargin = ExpectedDestinationValue - AcquisitionValue - ExpectedRouteCosts - ExpectedLossValue`

This is a planning estimate, not guaranteed profit.

## 25.2 Realised Margin

`RealisedMargin = ActualSettlementValue - ActualAcquisitionCost - ActualCommittedCosts - ActualLosses - ContractAdjustments`

Actual settlement may be affected by:

- price movement before arrival;
- quality/condition changes;
- partial loss;
- delay penalties;
- contract-fixed price;
- taxes/tolls;
- exchange rates;
- claim payouts;
- unexpected repairs/services;
- buyer refusal under valid contract rules.

## 25.3 Profitability Readability

Player UI should break margin into understandable causes rather than show only a single green/red number.

# 26. Route Risk, Delay, Loss and Economic Exposure

27H interprets risk economically but does not generate the underlying hazard.

Risk channels may include:

- terrain/travel reliability from Set 30;
- weather/environment from world systems;
- conflict/ambush from combat/event systems;
- piracy/blockade from Set 26;
- legal/access uncertainty from governance/27G/27I;
- cargo spoilage/condition risk from item/survival systems;
- financial counterparty risk from 27F;
- portal/realm instability from Document 14/realm systems.

Route risk outputs may inform:

- expected loss allowance;
- insurance premium input;
- required reserve/contingency;
- carrier willingness;
- contract price;
- route choice;
- player warnings;
- schedule confidence.

# 27. Freight, Delivery and Passenger Contract Integration

27E remains contract authority.

27H may execute economic missions for:

- fixed-quantity delivery;
- recurring supply;
- freight carriage;
- courier/document delivery;
- passenger transport;
- construction/project supply;
- emergency relief;
- return/recovery transport;
- multimodal delivery;
- cross-realm delivery.

Contract terms may determine:

- who owns cargo during transit;
- who pays loading/tolls/insurance;
- acceptable delay;
- condition requirements;
- partial delivery rules;
- substitution;
- acceptance endpoint;
- compensation for breach.

People remain persistent persons, never cargo inventory entries.

# 28. Credit, Trade Finance and Insurance Integration

27F may support trade through:

- working-capital loans;
- purchase financing;
- letters of credit;
- invoice finance/factoring;
- cargo insurance;
- route insurance;
- caravan/vehicle insurance where applicable;
- trade credit;
- guarantees.

27H provides evidence:

- shipment reserved/dispatched;
- carrier/custody chain;
- route state;
- expected/actual arrival;
- loss/damage/delay;
- delivery acceptance;
- realised transaction value.

Insurance payouts never replace the physical lost goods; they settle financial claims under 27F.

# 29. Taxes, Tolls, Tariffs and Customs Integration

27G may apply fiscal obligations at route events such as:

- market purchase/sale;
- bridge/road passage;
- border crossing;
- port arrival/departure;
- import/export declaration;
- realm-gate jurisdiction;
- public warehouse/service use.

27H includes authorised assessments in cost and clearance state.

If a tariff is unpaid and the owning law/customs system blocks legal passage, 27H receives `clearance_denied` or equivalent. 27H does not simulate arrest, seizure or smuggling around the checkpoint.

# 30. Market Feedback and Expected-Arrival Integration

The clean chain is:

1. 27C identifies shortage/surplus/procurement opportunity.
2. 27H creates/evaluates route opportunity.
3. Shipment reserves real origin stock.
4. Transport owner confirms dispatch.
5. 27H publishes expected-arrival record to 27C.
6. Delay/access changes update ETA/confidence.
7. Transport owner confirms arrival.
8. Destination inventory receives actual stock.
9. 27C recalculates market state.
10. 27B recalculates contextual value/quotes as needed.

Expected arrival never becomes current stock before step 8.

# 31. Currency, Barter and Cross-Market Settlement

Trade may settle through:

- same currency;
- foreign currency exchange;
- mixed currency;
- barter;
- goods plus currency;
- credit/letter of credit;
- public voucher/contract settlement where valid;
- cross-realm exchange instrument if supported by 27B/realm content.

27H may compare total expected economic value after exchange costs. It does not define exchange rates.

# 32. Enterprises, Merchants, Producers and Buyers

27D and 27C supply the actors and market roles.

A producer may:

- sell locally;
- contract directly with distant buyer;
- sell to wholesaler;
- own its own transport;
- hire a carrier;
- deliver to a hub;
- export through a port;
- use a realm gate.

A merchant may operate regional networks, but no merchant gains stock from a route definition alone. Stock acquisition and sale remain authoritative transactions.

# 33. Warehouses, Depots, Handling and Storage Economics

Trade capacity depends on physical logistics.

Economic endpoint checks may include:

- compatible storage space;
- loading/unloading access;
- worker/service availability;
- ownership/permissions;
- preservation/containment;
- quarantine or hazardous-goods capacity;
- road/port/portal connection;
- operating condition;
- opening/service state.

Storage and handling costs may create meaningful hub choices. A safer, better-equipped depot may cost more but reduce delay/loss risk.

# 34. Trade Hubs, Relays and Transshipment

A trade hub is economically useful because it provides real services, not because it has a `hub` label.

Possible hub functions:

- consolidation/deconsolidation;
- warehousing;
- vehicle/mount change;
- port transfer;
- customs handling;
- repairs/provisioning;
- finance/insurance access;
- market information;
- caravan recruitment;
- realm stabilisation;
- security/patrol access.

Transshipment creates custody and handling events. Goods are not sold and rebought unless an actual market transaction occurs.

# 35. Intermodal Trade Networks

One shipment may move across multiple systems.

Example:

1. Mine warehouse -> wagon depot (Set 30).
2. Wagon depot -> coastal port (Set 30).
3. Port handling/manifest (26J).
4. Sea voyage (26K/26G).
5. Destination port -> portal terminal (Set 30).
6. Realm transition (Document 14/realm owner).
7. Final local delivery (realm movement owner).

27H owns the economic chain, consignment continuity, cost accumulation, expected-arrival state and final settlement. Each movement owner owns its leg.

# 36. Maritime Commerce and Document Set 26 Integration

Set 26 remains authoritative for maritime execution.

## 36.1 Set 26 -> 27H

Expected inputs include:

- valid port/endpoints;
- vessel/fleet/cargo capacity;
- port handling readiness;
- voyage route accessibility;
- expected/actual voyage duration;
- maritime operating/readiness cost inputs;
- customs/inspection execution result;
- blockade/piracy/storm disruption signals;
- cargo loss/damage/delay;
- dispatch/arrival/port-call events.

## 36.2 27H -> Set 26

27H supplies:

- shipment/consignment economic mission;
- cargo ownership/priority;
- destination and deadline;
- universal contract/payment references;
- regional market/import-export purpose;
- value/insurance/fiscal references;
- intermodal handoff requirements;
- economic consequence callbacks.

## 36.3 No Ownership Transfer

26K's maritime trade route record may remain more operationally detailed than 27H's universal economic route view. 27H references it as a mode-specific leg/provider rather than replacing it.

# 37. Realm Gates, Portals and Dimensional Route Interfaces

A dimensional trade leg requires a valid traversal provider.

Required exposed information may include:

- gate/portal endpoint identity;
- origin/destination realm;
- access permission;
- activation/readiness;
- transport/cargo compatibility;
- capacity/throughput;
- transit duration or time-offset semantics;
- energy/mana/material cost;
- containment/stabilisation requirement;
- closure/instability state;
- return-route capability;
- arrival event.

27H cannot assume portals are free, instant or universally cargo-compatible.

# 38. Cross-Realm Commerce

Cross-realm commerce should feel exceptional but still obey ordinary economic truth.

Possible motivations:

- unique realm resources;
- specialised cultural goods;
- food/medicine unsuited to one realm;
- portal materials;
- magical reagents;
- construction/repair supply;
- research specimens;
- diplomatic gifts;
- emergency relief;
- passenger migration/travel;
- services or expertise.

## 38.1 Cross-Realm Trade Rules

- Goods must physically leave one authoritative inventory and enter another.
- Realm traversal cost/time/capacity comes from realm systems.
- Native restrictions and faction permissions apply.
- Conversion between realm goods may not create infinite arbitrage through fixed value loops.
- Hazardous or unstable materials require declared containment/stabilisation when the item/realm system requires it.
- A return plan matters for expeditions and carriers where the realm owner exposes return constraints.
- Distant realm trade uses the same bounded shipment model as overworld trade.

# 39. Realm Materials, Stability, Containment and Return Logistics

Realm goods may impose economic costs such as:

- stabilisation processing;
- specialist containers;
- wards;
- temperature/pressure control;
- cleansing/quarantine;
- restricted handling;
- dedicated carriers;
- portal timing windows;
- return cargo constraints.

These costs preserve the identity of rare realm resources. A high nominal sale value may still be unprofitable after safe transport and stabilisation.

# 40. Culture, Diplomacy, Reputation and Access Boundary

Culture/faction/social systems may expose:

- trade rights;
- border access;
- guild membership requirements;
- preferred partner status;
- boycott/hostility state;
- merchant trust;
- negotiation outcome;
- language/communication constraints;
- cultural demand preferences.

27H uses those results to determine access, confidence and contract availability. It does not invent friendship, persuasion or diplomatic outcomes.

# 41. Survival, Provisions, Workforce and Set 29 Boundary

Trade operators and passengers exist in a survival world.

Set 29 may expose survival-related requirements such as:

- food/water requirement profiles where enabled;
- fatigue/recovery state;
- illness/injury availability;
- medicine/treatment demand;
- environmental protection requirements.

27H converts actual consumed supplies/services into route cost and cargo planning only when supplied by the owning systems. It does not define hunger or fatigue thresholds.

# 42. Escorts, Security, Ambush and Conflict Boundary

27H may economically request security but does not own tactical protection.

Economic security fields can include:

- declared cargo value;
- threat exposure signal;
- escort contract reference;
- security budget;
- insurance requirement;
- convoy/caravan priority;
- loss/delay outcome.

Combat/AI systems decide actual detection, ambush, combat, casualties and physical recovery. Set 30 owns physical caravan formation/movement; 27E owns security service contracts.

# 43. Blockades, Closures, Embargo Signals and 27I Boundary

Route access can change due to:

- destroyed roads/bridges;
- weather/disaster;
- faction war;
- border closure;
- quarantine;
- blockade;
- magical instability;
- legal embargo/sanction;
- infrastructure failure.

27H reacts by changing route availability, expected arrivals, alternate-route planning and economic cost.

27I will own the deeper economic-conflict layer: embargo strategy, sanctions, black-market rerouting, smuggling premiums, cartel access and deliberate evasion. 27H must leave hooks without pre-empting those rules.

# 44. Regional Trade Networks and Settlement Consequences

Trade-network summaries may expose:

- inbound/outbound volume by commodity family;
- import dependence;
- export concentration;
- route diversity;
- route reliability;
- average transit time;
- average realised transport cost;
- major hubs;
- strategic chokepoint dependence;
- known realm dependence;
- recent disruption history.

These are summaries of real shipments/markets, not autonomous wealth generators.

Possible settlement consequences are consumed by owning systems:

- improved market availability;
- access to specialist inputs;
- project completion;
- employment/business opportunities;
- public tariff/toll revenue;
- vulnerability to route disruption;
- new quests/events;
- regional influence.

# 45. NPC and Faction Trade Decision Model

NPC/faction trade planners should be bounded and explainable.

A candidate route/ship decision may consider:

- unmet need;
- available surplus;
- expected destination value;
- total route cost;
- reliability;
- deadline;
- risk tolerance;
- available funds/credit;
- transport capacity;
- strategic/public priority;
- relationship/access result;
- existing contract obligation;
- diversification/route dependence;
- backhaul potential.

The decision engine chooses among valid options; it does not invent missing stock, permission or transport.

## 45.1 Anti-Churn Rule

NPCs should not constantly cancel and replan routes because of tiny price changes. Use hysteresis, minimum commitment windows, sunk reservation awareness and bounded reevaluation intervals.

# 46. Player Trade Roles and Career Paths

Supported roles include:

- wandering trader;
- caravan operator;
- merchant-company owner;
- producer-exporter;
- wholesaler;
- logistics contractor;
- trade-guild member;
- public quartermaster;
- relief supplier;
- port/intermodal trader;
- realm merchant;
- financier-insurer adjacent role through 27F;
- ruler shaping trade infrastructure/policy through 27G.

Players may engage at different depths. Owning one wagon should not require managing a regional balance sheet; owning a trade empire may expose advanced ledgers and delegated managers.

# 47. Quests, Events and Persistent Trade History

Trade events can create quests such as:

- delayed medicine caravan;
- broken bridge reroute;
- missing cargo;
- famine import request;
- new mine export contract;
- port closure;
- caravan escort request;
- realm-gate supply expedition;
- warehouse congestion;
- stranded passengers;
- contract dispute;
- emergency reconstruction supply.

Persistent history may record:

- route opened/restored;
- first major shipment;
- repeated successful service;
- catastrophic loss;
- blockade/closure;
- new hub founded;
- realm trade established;
- route abandoned;
- player company becoming dominant supplier.

# 48. Trade Knowledge, Intelligence and Forecasting

A route planner should distinguish **truth** from **forecast**.

Forecast inputs may include:

- current known market observations;
- shipment history;
- current access status;
- seasonal/weather outlook from owning systems;
- known toll/tariff schedule;
- current carrier capacity;
- expected arrivals;
- social intelligence/rumours.

Forecast output should include confidence and cause list.

Example:

> Expected margin: +18% (medium confidence). Main uncertainty: destination iron price observation is 3 days old; eastern bridge currently open; no return cargo confirmed.

# 49. UI/UX, Maps, Ledgers and Player Trust

## 49.1 Default Trade UI

A normal player-facing route panel should show:

- origin and destination;
- cargo and quantity;
- expected buy/acquisition value;
- expected destination value;
- expected major costs;
- expected margin band;
- travel-time estimate;
- route accessibility;
- capacity required/available;
- main risks;
- toll/customs summary;
- expected-arrival confidence;
- blockers;
- alternative routes if known.

## 49.2 Advanced Views

Optional expert views may include:

- cost breakdown;
- historical realised margins;
- commodity flows;
- route reliability;
- backhaul statistics;
- regional import/export dependence;
- hub utilisation;
- intermodal handoff timing;
- finance/insurance links.

## 49.3 Accessibility

- Do not rely on colour alone for profit/risk.
- Use readable route-state text and icons.
- Allow reduced information density.
- Provide clear reason codes for blocked departure/arrival.
- Offer assisted route suggestions without hiding actual costs.

# 50. Difficulty, Accessibility and Economy Assistance

Configurable profiles may adjust:

| Setting | Relaxed | Standard | Harsh/Advanced |
| --- | --- | --- | --- |
| Trade Information | Wider reliable hints | Knowledge-based | More uncertainty/staleness |
| Route Disruption | Reduced frequency/severity | Standard | Stronger/longer disruptions |
| Operating Costs | Lower but real | Standard | Higher scarcity/maintenance |
| Contract Deadlines | Generous | Standard | Tighter where appropriate |
| Loss Risk | Reduced | Standard | Higher where world systems support |
| Automation/Delegation | Strong suggestions | Standard | More management optional |

Relaxed mode must not reintroduce teleporting or infinite stock. Convenience comes through favourable conditions, clearer information and lower risk/cost.

# 51. Simulation LOD and Distant Trade

Trade simulation uses bounded tiers.

| LOD | Representation |
| --- | --- |
| Near / Interactive | Exact cargo lots, physical vehicles/vessels/NPCs, live loading, departure, travel events and arrival. |
| Settlement Loaded | Exact warehouse/market state with transport summaries outside visual range. |
| Regional Distant | Shipment batches, route-leg timers/checkpoints, aggregate handling, bounded incidents and conserved cargo. |
| Far / Strategic | Scheduled exchange batches and regional summaries using validated capacity/route availability; no per-actor simulation. |

## 51.1 Distant Processing Rule

Distant simulation may advance a shipment from one validated checkpoint to another. It may not skip a blocker that would have stopped the shipment: unavailable route, no stock, no capacity, expired permission, missing fuel/supply, destroyed hub or invalid portal.

# 52. Persistence, Reconciliation and Recovery

Persist at minimum:

- route definitions/knowledge state;
- shipment and consignment state;
- cargo/custody references;
- reservations;
- assigned carrier/transport references;
- current route leg;
- dispatch/arrival timestamps;
- expected-arrival records;
- accumulated costs;
- damage/loss/delay evidence;
- contract/finance/fiscal references;
- trade history summaries.

## 52.1 Promotion/Reconciliation

When a distant caravan becomes physically loaded:

- cargo quantity must match the distant record;
- owner/custodian must match;
- route leg and elapsed time must reconcile;
- vehicle capacity must remain valid;
- prior losses/damage must already be reflected;
- no duplicate copy may remain in origin/destination inventories.

Save validation should fail loudly if one authoritative consignment appears simultaneously delivered and in transit.

# 53. Multiplayer Authority and Transaction Safety

The authoritative host/server owns:

- shipment creation/commit;
- stock reservations;
- transport booking;
- custody handoff;
- dispatch/arrival confirmation integration;
- cost posting;
- market expected-arrival updates;
- delivery settlement;
- cancellation/release;
- network reconciliation.

Clients may request and preview but cannot commit destination arrival.

Company permissions may include:

- view route data;
- plan shipment;
- reserve stock;
- book carrier;
- authorise expense;
- dispatch;
- reroute;
- cancel;
- settle delivery.

All meaningful changes record actor and authority.

# 54. Set 25 Schemas, Relationships and Validation

27H proposes the following governed definition/runtime families.

## 54.1 Definition Families

- `economy.trade.route_profile.*`
- `economy.trade.route_cost_profile.*`
- `economy.trade.service_policy.*`
- `economy.trade.cargo_compatibility.*`
- `economy.trade.opportunity_policy.*`
- `economy.trade.realm_commerce_profile.*`

## 54.2 Runtime Families

- `trade_route_instance`
- `trade_opportunity`
- `shipment_instance`
- `consignment_instance`
- `caravan_economic_mission`
- `route_leg_economic_state`
- `transshipment_record`
- `expected_arrival_record`
- `regional_trade_summary`
- `trade_route_observation`

## 54.3 Relationship Examples

- `connects_economic_endpoint`
- `uses_transport_provider`
- `serves_market`
- `reserves_cargo_lot`
- `fulfilled_by_shipment`
- `expects_arrival_from`
- `handoff_to`
- `requires_clearance_from`
- `insured_by`
- `financed_by`
- `crosses_jurisdiction`
- `crosses_realm_boundary`
- `alternate_route_for`

Set 25 validators should reject duplicate ownership of travel time, item quantity, market pressure, tax rate, contract term or vehicle capacity inside 27H definitions.

# 55. Godot/Summer Engine Technical Architecture

Recommended services:

- `TradeRouteRegistryService` - resolves route definitions/providers;
- `TradeOpportunityService` - consumes markets/contracts and generates bounded opportunities;
- `ShipmentService` - authoritative shipment/consignment lifecycle;
- `TradeCapacityBroker` - queries transport providers and manages booking references;
- `TradeCostService` - assembles cost components from owning systems;
- `TradeMarginService` - expected/realised margin and explanations;
- `ExpectedArrivalService` - publishes/updates 27C arrival records;
- `TradeNetworkSummaryService` - bounded regional aggregation;
- `IntermodalHandoffService` - custody/leg transitions;
- `TradeReconciliationService` - save/promotion integrity checks;
- `TradeKnowledgeService` - route observation/confidence state.

## 55.1 Commands

Examples:

- `CreateTradeOpportunityRequest`
- `PlanShipmentCommand`
- `ReserveShipmentStockCommand`
- `BookTransportCapacityCommand`
- `AuthoriseShipmentDispatchCommand`
- `ReportTransportDepartureCommand`
- `ReportTransportDelayCommand`
- `ReportTransportArrivalCommand`
- `CommitHandoffCommand`
- `CommitDeliveryCommand`
- `RerouteShipmentCommand`
- `CancelShipmentCommand`

## 55.2 Events

Examples:

- `TradeOpportunityCreated`
- `ShipmentStockReserved`
- `TransportCapacityBooked`
- `ShipmentDispatched`
- `ExpectedArrivalPublished`
- `ShipmentDelayed`
- `RouteAccessChanged`
- `ShipmentPartiallyLost`
- `ShipmentArrived`
- `ShipmentHandoffCommitted`
- `ShipmentDelivered`
- `TradeMarginRealised`
- `RouteReliabilityUpdated`

Summer Engine may assist authoring schemas, validators, fixtures and tests. Runtime trade decisions must remain deterministic game logic over authoritative state, not external AI calls.

# 56. Validation Invariants and Acceptance Scenarios

## 56.1 Hard Invariants

- destination stock never increases before authoritative arrival/transfer;
- origin stock cannot remain spendable after committed dispatch;
- one cargo lot cannot be active in two incompatible shipments;
- booked capacity cannot exceed transport-exposed usable compatible capacity;
- route planning cannot override `route_inaccessible` from movement owner;
- expected arrival must reference a valid active shipment;
- expected arrival quantity cannot exceed remaining shipment quantity;
- cancelled shipment releases only reservations that still belong to it;
- realised margin uses committed transactions, not forecast values;
- tariffs/tolls are included only when 27G reports valid assessment;
- maritime arrival must originate from Set 26 result, not 27H timer;
- terrestrial arrival must originate from Set 30 result, not 27H timer;
- realm arrival must originate from valid realm traversal provider;
- distant simulation cannot produce negative stock or duplicate custody;
- a trade route cannot create a missing endpoint capability;
- passenger identities are never represented as ordinary cargo items.

## 56.2 Acceptance Scenario 1 - Basic Surplus-to-Shortage Caravan

1. Farm settlement has 500 grain.
2. 300 are protected for provisions and 100 committed to local bakery/project needs.
3. 100 are export-ready.
4. Nearby town has residual grain shortage in 27C.
5. 27H finds a valid road route and Set 30 exposes sufficient wagon capacity.
6. 80 grain are reserved and dispatched.
7. Origin stock/custody updates immediately.
8. 27C receives an expected arrival, not delivered stock.
9. Set 30 reports arrival.
10. 80 grain enter destination inventory and market state recalculates.

**Pass:** no duplicate grain; origin reserves remain protected; destination shortage falls only after delivery.

## 56.3 Acceptance Scenario 2 - Price Difference but No Profit

1. Iron sells for more in a distant city.
2. Acquisition cost is attractive.
3. Route requires high tolls, expensive repairs and an empty return.
4. 27H expected margin is negative.
5. Trader refuses or requires a higher contract price.

**Pass:** price difference alone does not force trade.

## 56.4 Acceptance Scenario 3 - Bridge Closure During Transit

1. Shipment is dispatched.
2. Set 30 reports bridge route inaccessible after a flood.
3. Expected arrival becomes delayed/uncertain.
4. 27C removes/weakens expected-arrival relief.
5. 27H evaluates known alternate route using new Set 30 estimate.
6. Player/NPC may reroute or wait.

**Pass:** no instant arrival and no Set 27 terrain override.

## 56.5 Acceptance Scenario 4 - Merchant Scheduled Route Has No Stock

1. Scheduled caravan policy reviews departure every 3 days.
2. Producer failed to deliver enough cloth.
3. Minimum cargo threshold is not met.
4. Departure is delayed.

**Pass:** schedule does not spawn cloth or reset merchant stock.

## 56.6 Acceptance Scenario 5 - Intermodal Road-to-Sea Delivery

1. Shipment moves by wagon to port under Set 30.
2. Port receives and records custody handoff.
3. 26J loads cargo; 26K/26G execute voyage.
4. 27H maintains one consignment identity and accumulates costs.
5. Destination port confirms arrival and handoff.

**Pass:** cargo appears only once at every stage; maritime ownership remains Set 26.

## 56.7 Acceptance Scenario 6 - Partial Cargo Loss

1. 100 medicine depart.
2. Transport owner reports 20 destroyed/damaged beyond acceptance.
3. Shipment remaining quantity becomes 80.
4. Expected arrival is reduced.
5. 27E evaluates partial delivery; 27F may open claim.
6. Destination receives 80 only.

**Pass:** insurance does not recreate the 20 items.

## 56.8 Acceptance Scenario 7 - High-Value Realm Trade

1. Realm herb has high destination value.
2. Portal provider requires mana, specialist container and limited throughput.
3. 27H includes those costs plus handling and stabilisation.
4. Expected margin remains positive only for small high-value batches.

**Pass:** realm scarcity is not trivialised by free instant transport.

## 56.9 Acceptance Scenario 8 - Cross-Realm Arbitrage Loop

1. Two currencies/goods appear to form a profitable A -> B -> realm -> A loop.
2. 27B exchange and 27H costs are applied at every real transaction/leg.
3. Inventory and fees are conserved.
4. If a deterministic zero-risk loop generates value without source, validator flags it for redesign.

**Pass:** no perpetual-value machine from route conversion.

## 56.10 Acceptance Scenario 9 - Public Relief Priority

1. Settlement has emergency medicine shortage.
2. 27G authorises relief procurement and funding.
3. 27E creates delivery obligation.
4. 27H books available caravan capacity ahead of lower-priority speculative cargo under policy.
5. Set 30 executes transport.

**Pass:** priority reallocates real capacity; displaced cargo is delayed, not deleted.

## 56.11 Acceptance Scenario 10 - Backhaul

1. Merchant delivers iron to farming region.
2. Return wagon would be empty.
3. 27C shows export-ready grain.
4. 27H finds compatible return cargo and recalculates round-trip margin.

**Pass:** backhaul improves economics only if real cargo exists and destination need is valid.

## 56.12 Acceptance Scenario 11 - Stale Market Knowledge

1. Player knows a distant city paid high prices for salt five days ago.
2. No current observation exists.
3. Route planner shows wide margin confidence band.
4. On arrival, actual 27B/27C price is lower due to another shipment.

**Pass:** UI never promised stale price as current truth.

## 56.13 Acceptance Scenario 12 - Distant Simulation Reconciliation

1. NPC caravan remains unloaded for ten days.
2. Distant system advances route checkpoints.
3. One delay and one handling fee are recorded.
4. Caravan promotes near player.
5. Physical cargo, ownership, current leg, elapsed time and asset assignment match summary.

**Pass:** no duplicate origin stock or phantom destination stock.

## 56.14 Acceptance Scenario 13 - Tariff Makes Alternate Route Better

1. Route A is physically faster.
2. 27G assesses a high border tariff on cargo class.
3. Route B is slower but avoids that jurisdiction.
4. 27H chooses B economically when allowed.

**Pass:** 27H uses fiscal truth without redefining tariff policy or movement time.

## 56.15 Acceptance Scenario 14 - Capacity Oversubscription

1. Two shipments attempt to book the same wagon capacity.
2. First booking reserves compatible capacity.
3. Second exceeds remaining capacity.
4. Second is queued, split or rejected.

**Pass:** no shipment assumes capacity beyond Set 30's exposed limit.

## 56.16 Acceptance Scenario 15 - Settlement Stops Exporting During Shortage

1. Town previously exported food.
2. Harvest failure raises local protected reserve and residual demand.
3. Export-ready quantity falls to zero.
4. Scheduled trade stops new food export.

**Pass:** profitable external price cannot bypass local reserve policy.

## 56.17 Acceptance Scenario 16 - Maritime Blockade Signal

1. 26K reports maritime route access denied by blockade.
2. 27H invalidates maritime leg and expected arrivals.
3. 27C shortage pressure rises.
4. Alternate terrestrial route may be evaluated if known.

**Pass:** 27H does not simulate blockade combat or ship movement.

## 56.18 Acceptance Scenario 17 - Multiplayer Double Dispatch Attempt

1. Two players attempt to dispatch the same reserved consignment.
2. Server commits first authorised dispatch.
3. Second receives `shipment_state_conflict`.

**Pass:** one cargo lot has one authoritative custody path.

## 56.19 Acceptance Scenario 18 - No Buyer at Destination

1. Speculative cargo arrives after local demand was already satisfied.
2. Destination merchant lacks purchasing capacity.
3. Shipment may store, seek another buyer, reroute or return.

**Pass:** arrival does not guarantee sale or infinite merchant funds.

# 57. Production Classification, Risks and Open Decisions

## 57.1 Recommended Production Scope

| Capability | Recommended Classification | Reason |
| --- | --- | --- |
| Basic route definition and endpoint binding | Core | Needed for physical regional trade. |
| Shipment/consignment conservation | Core | Prevents ghost imports/exports. |
| One terrestrial caravan economic mission | Core/Early | Required interface with Set 30 and regional economy. |
| Expected-arrival integration with 27C | Core/Early | Makes logistics affect markets before arrival without ghost stock. |
| Route-cost and margin explanation | Core | Gives player understandable trade decisions. |
| Scheduled recurring trade | Alpha | Useful once stable transport exists. |
| Regional trade-network summaries | Alpha | Adds civilisation-scale readability. |
| Intermodal road/sea trade | Alpha/Beta | Requires mature Set 26/30 integration. |
| Advanced trade hubs/relays | Beta | Depends on infrastructure breadth. |
| Cross-realm commerce | Beta/Full | Requires stable realm/portal systems. |
| Realm-specialised trade finance | Full/Optional | High dependency/cost. |
| Highly automated global trading companies | Full | Should follow stable local/regional economy. |

## 57.2 Major Risks

| Risk | Failure | Control |
| --- | --- | --- |
| Trade teleports | Geography becomes cosmetic. | Require transport-owner dispatch/arrival. |
| Markets globally equalise too fast | Regional identity disappears. | Capacity, time, cost, risk, knowledge and reserves limit arbitrage. |
| Caravans become spreadsheets | Casual players disengage. | Default opportunity cards and delegated schedules. |
| Distant trade duplicates stock | Economy integrity breaks. | Custody records, checkpoints and reconciliation gates. |
| Set 27 overrides Set 30 | Movement design conflicts. | Strict transport adapter; consume exposed values only. |
| Set 27 duplicates Set 26 | Maritime documents conflict. | Treat 26K route/voyage as maritime leg provider. |
| Cross-realm trade trivialises rare goods | Progression collapses. | Capacity, access, stabilisation, risk and return costs. |
| Scheduled trade becomes hidden restock | Physical economy promise breaks. | Revalidate stock/capacity every departure. |
| Price arbitrage creates infinite value | Economy exploit. | Real transaction costs, bounded quotes and invariant tests. |
| One trade route becomes mandatory | Seed/faction lockout. | Set 25 fallbacks and alternate sources. |

## 57.3 Open Decisions for Later 27I/27J or Final Integration

1. Final default trade-information radius and confidence decay.
2. Recommended standard-world maximum number of player-visible active route cards before grouping.
3. Whether recurring caravan schedules default to minimum-load or fixed-day behaviour.
4. Exact route-reliability smoothing window.
5. How much expected loss should be shown numerically versus categorical risk bands.
6. Default economic treatment of guards/security cost on merchant caravans.
7. Which portal/realm routes qualify for Core Production teaser versus later content.
8. Final settlement trade-dependence metrics used by 27J dashboards.
9. 27I rules for embargoes, sanctions, smuggling and illicit rerouting.
10. Final Set 30 transport-resource field names once Set 30 documents lock their implementation contract.

# 58. Cross-Set Interface Amendments

The Leyforge Document Sets 27-30 Cross-Set Interface Register v1.0 remains governing. These amendments add fields needed by 27H without transferring ownership.

## Amendment 27H-A - Set 30 Trade Mission / Transport Execution Interface

**Reason:** 27H must plan and settle terrestrial trade while Set 30 owns all physical land movement.

**27H -> Set 30:**

- `caravan_mission_id`;
- shipment/consignment references;
- authorised origin/destination/waypoint endpoint IDs;
- required compatible cargo/passenger capacity;
- cargo handling/priority class;
- contract deadline/window;
- preferred/alternate economic route IDs;
- toll/customs clearance state;
- transport budget/abort threshold where used;
- expected economic callbacks.

**Set 30 -> 27H:**

- assigned transport asset references;
- usable compatible capacity;
- route accessibility;
- expected/actual duration;
- movement mode;
- terrain/service/stop requirements;
- operating resource/service consumption;
- vehicle/mount condition;
- delay/breakdown state;
- departure/arrival events;
- transport-caused cargo/passenger loss/damage evidence;
- alternate-route failure/success result.

**Ownership transfer:** None.

## Amendment 27H-B - Set 28 Trade Access and Information Interface

**Reason:** Regional trade requires social/diplomatic access and imperfect communicated knowledge without 27H owning social simulation.

**Set 28 -> 27H:**

- trade-access/relationship permission outcome;
- negotiated social concession modifier where contract owner accepts it;
- merchant/carrier willingness/refusal result;
- rumour/information provenance and truth-confidence class;
- companion/agent authority to act for a principal.

**27H -> Set 28:**

- route/shipment outcome summaries;
- fulfilled/failed commercial interaction evidence;
- trade dependence/repeated contact signals;
- economic information observation with timestamp and coverage.

**Ownership transfer:** None.

## Amendment 27H-C - Set 29 Trade Survival Requirement Interface

**Reason:** Long journeys may consume provisions and be affected by illness/injury while 27H must not define survival mechanics.

**Set 29 -> 27H/Set 30:**

- authoritative provision requirement profile where enabled;
- workforce availability/incapacity summary;
- medicine/treatment requirement signals;
- environment/survival preparation requirement references.

**27H -> Set 29:**

- trip duration/cargo mission context;
- purchased/reserved provision budget and inventory references;
- medicine/relief demand generated by trade operations.

**Ownership transfer:** None.

## Amendment 27H-D - Realm Commerce Transport Provider Interface

**Reason:** Cross-realm trade needs a generic economic interface without assigning realm traversal to Set 27.

**Realm/Document 14 provider -> 27H:**

- realm endpoint identity;
- transition accessibility/readiness;
- cargo/passenger compatibility;
- throughput/capacity;
- expected/actual transit duration/time semantics;
- activation/energy/material requirement;
- containment/stabilisation requirement;
- hazard/disruption result;
- authoritative departure/arrival event;
- return-route capability.

**27H -> realm provider:**

- shipment/consignment reference;
- authorised cargo/passenger class;
- destination/return plan;
- custody handoff reference;
- economic priority and contract deadline.

**Ownership transfer:** None.

## Amendment 27H-E - Set 26 Universal Intermodal Handoff

**Reason:** Road/sea/realm chains require one conserved consignment across Set 26 and 27H.

**Set 26 -> 27H:** maritime leg/port-call ID, cargo accepted/released quantity, custody actor, departure/arrival, port handling result, voyage delay/loss/damage, usable capacity and access state.

**27H -> Set 26:** consignment ID, cargo owner/custodian, economic destination/deadline, contract/value/insurance/fiscal references and next-handoff endpoint.

**Constraint:** Neither side clones cargo at handoff. One side releases custody only when the other commits acceptance under the authoritative transaction.

**Ownership transfer:** None.

# Appendix A. Economic Route Definition Template

| Field | Purpose |
| --- | --- |
| route_id | Stable qualified ID. |
| display_name | Player-facing route name where known. |
| route_family | Local/regional/long-distance/intermodal/realm/etc. |
| origin_endpoint_ref | Valid economic/logistics endpoint. |
| destination_endpoint_ref | Valid endpoint. |
| leg_refs | Ordered transport-provider legs. |
| cargo_classes_allowed | Compatibility categories. |
| passenger_service_allowed | Boolean/capability reference. |
| access_requirements | Permits, faction rights, infrastructure, realm access. |
| handling_endpoint_refs | Hubs/depots/ports/gates. |
| cost_profile_ref | Economic cost aggregation profile. |
| fiscal_jurisdiction_refs | Known toll/tariff/customs areas. |
| alternate_route_refs | Known valid alternatives. |
| knowledge_source | Survey/map/history/etc. |
| knowledge_timestamp | Last confirmation. |
| knowledge_confidence | Confidence band. |
| production_status | Set 25 planning field. |
| pack_dependencies | Required content/providers. |

# Appendix B. Shipment and Consignment Runtime Template

| Field | Purpose |
| --- | --- |
| shipment_id | Persistent runtime identity. |
| principal_ref | Actor/enterprise/public authority initiating shipment. |
| carrier_ref | Current carrier/operator. |
| route_ref | Economic route. |
| current_leg_ref | Current transport-provider leg. |
| origin_ref | Origin endpoint. |
| destination_ref | Final destination. |
| consignment_refs | Child ownership/custody groups. |
| cargo_lot_refs | Physical inventory lot references. |
| reserved_quantity | Amount still reserved at origin. |
| dispatched_quantity | Amount under transit custody. |
| remaining_quantity | Current surviving quantity. |
| expected_arrival_ref | 27C integration record. |
| contract_refs | 27E obligations. |
| finance_refs | 27F financing. |
| insurance_refs | 27F policy/claim. |
| fiscal_refs | 27G assessments/receipts. |
| accumulated_costs | Posted real costs by category. |
| current_state | Lifecycle state. |
| delay_reason_codes | Active delay/blockers. |
| custody_history | Ordered handoff evidence. |
| dispatch_time | Authoritative departure time. |
| arrival_time | Authoritative final arrival time. |
| closure_outcome | Delivered/cancelled/lost/returned/etc. |

# Appendix C. Terrestrial Caravan Economic Mission Template

| Field | Purpose |
| --- | --- |
| mission_id | Set 27 mission identity. |
| operator_ref | Enterprise/actor with commercial authority. |
| shipment_refs | Cargo/passenger commercial records. |
| preferred_route_ref | Economic route preference. |
| alternate_route_refs | Approved fallback choices. |
| origin_ref | Dispatch endpoint. |
| destination_ref | Economic destination. |
| required_capacity_class | Set 30 query input. |
| cargo_priority_profile | Handling/priority only. |
| deadline_window | Contract/economic timing. |
| budget_limit | Maximum authorised transport spend. |
| clearance_refs | Toll/customs/permit state. |
| insurance_ref | Optional 27F policy. |
| dispatch_conditions | Stock/capacity/access/funding requirements. |
| abort_conditions | Cost/risk/deadline thresholds. |
| set30_execution_ref | Physical transport mission/result. |
| expected_arrival_ref | Market projection. |
| realised_cost | Final economic transport cost. |
| realised_outcome | Delivered/delayed/lost/returned/etc. |

# Appendix D. Intermodal and Cross-Realm Route Template

| Field | Purpose |
| --- | --- |
| chain_id | Intermodal shipment route identity. |
| origin_realm_ref | Realm/world of origin. |
| destination_realm_ref | Realm/world of destination. |
| economic_route_ref | Parent 27H route. |
| ordered_leg_refs | Set 30/26/realm-provider legs. |
| handoff_endpoint_refs | Warehouses, ports, terminals, gates. |
| custody_rules | Contract/custody transition references. |
| portal_gate_refs | Realm transition endpoints. |
| realm_compatibility | Cargo/passenger compatibility signals. |
| stabilisation_requirements | Item/realm supplied requirements. |
| return_route_required | Whether commercial mission requires return capability. |
| cross_realm_fiscal_refs | Tariff/customs/fees where valid. |
| expected_total_duration | Aggregated forecast from providers. |
| expected_total_cost | Aggregated economic cost. |
| confidence | Overall route forecast confidence. |

# Appendix E. Initial Trade Reason-Code Catalogue

| Reason Code | Meaning |
| --- | --- |
| `trade.no_exportable_stock` | Origin stock exists but none is economically export-ready. |
| `trade.stock_reserved` | Required stock is already committed. |
| `trade.no_destination_demand` | No current residual demand or contract reason. |
| `trade.no_buyer_capacity` | Destination buyer lacks funds/storage/authority. |
| `trade.route_unknown` | Route is not known sufficiently for planning. |
| `trade.route_inaccessible` | Movement owner reports no valid path/access. |
| `trade.transport_unavailable` | No compatible transport asset/provider. |
| `trade.capacity_insufficient` | Usable compatible capacity is below requirement. |
| `trade.departure_below_min_load` | Scheduled service minimum load not met. |
| `trade.clearance_denied` | Required legal/fiscal clearance is not satisfied. |
| `trade.toll_or_tariff_unfunded` | Required fiscal assessment cannot be paid/secured. |
| `trade.origin_handling_unavailable` | Loading/storage/service endpoint lacks capability. |
| `trade.destination_handling_unavailable` | Destination cannot safely receive cargo. |
| `trade.expected_margin_negative` | Forecast economic result is below policy threshold. |
| `trade.knowledge_stale` | Key route/market observation is outside confidence window. |
| `trade.contract_deadline_unreachable` | Current transport estimate cannot meet required window. |
| `trade.shipment_delayed` | Transport owner reports delay. |
| `trade.shipment_partially_lost` | Some consignment quantity is lost/destroyed. |
| `trade.shipment_lost` | Shipment cannot continue/deliver. |
| `trade.handoff_blocked` | Next carrier/hub cannot accept custody. |
| `trade.realm_gate_unavailable` | Realm provider reports transition unavailable. |
| `trade.realm_cargo_incompatible` | Cargo lacks required compatibility/containment. |
| `trade.return_route_unavailable` | Required return capability is not available. |
| `trade.multiplayer_authority_denied` | Requesting actor lacks shipment/company authority. |
| `trade.shipment_state_conflict` | Requested state change conflicts with authoritative shipment state. |
| `trade.reconciliation_failed` | Saved/distant/physical trade state cannot be reconciled safely. |

# Appendix F. Cross-System Interface Matrix

| System | Supplies to 27H | Receives from 27H |
| --- | --- | --- |
| 27B | values, quotes, currency/exchange | route settlement context, realised trade evidence |
| 27C | market state, residual demand, sellable surplus | expected arrivals, delivered imports/exports, route disruptions |
| 27D | enterprise authority, labour/wage/ownership | trade revenue/cost and commercial mission history |
| 27E | contract obligations/acceptance | shipment/delivery evidence |
| 27F | finance/insurance/claims | route exposure, dispatch, loss, delivery evidence |
| 27G | tolls/tariffs/customs/fees | crossing/shipment economic context |
| Set 28 | social access, negotiation, information provenance | trade outcomes and economic observation |
| Set 29 | survival/provision/workforce requirements | trip/mission demand and economic provisioning |
| Set 30 | terrestrial capacity, access, travel, condition, events | caravan economic mission and cargo requirements |
| Set 26 | maritime capacity/voyage/port/cargo results | universal shipment/value/contract/market context |
| Document 14/Realm | realm transition capability/outcome | cross-realm shipment/custody context |
| 07/20 | settlement needs, warehouses, endpoint capability | import/export delivery and trade-network effects |
| 15 | quest/event execution | route/shipment objective and history events |
| 16 | security/combat outcomes | cargo value/security mission context |
| Set 25 | IDs, schemas, packs, validation | governed trade definitions/runtime relationships |

# Appendix G. 27H Completion Checklist

- [x] Adopted Sets 27-30 Cross-Set Interface Register v1.0.
- [x] Preserved Set 30 ownership of terrestrial movement.
- [x] Preserved Set 26 ownership of maritime execution.
- [x] Preserved Document 14/realm ownership of dimensional traversal.
- [x] Defined economic route, shipment, consignment and caravan mission records.
- [x] Locked no-teleport import/export conservation.
- [x] Connected 27C expected-arrival and market feedback.
- [x] Connected 27B pricing/currency without duplicating valuation.
- [x] Connected 27D enterprises/labour/ownership.
- [x] Connected 27E contracts and delivery evidence.
- [x] Connected 27F finance/insurance and route exposure.
- [x] Connected 27G tolls/tariffs/customs.
- [x] Defined regional specialisation without hard progression lock.
- [x] Defined intermodal economic handoffs.
- [x] Defined cross-realm commerce boundaries and safeguards.
- [x] Defined simulation LOD, persistence and multiplayer authority.
- [x] Proposed Set 25 schema/relationship families.
- [x] Added deterministic validation invariants and acceptance scenarios.
- [x] Added cross-set amendments for Sets 28-30, Set 26 and realm providers.

---

**Document 27H Status:** Complete v0.1 design foundation.  
**Next Document:** **27I - Monopolies, Embargoes, Smuggling, Black Markets and Economic Conflict**
