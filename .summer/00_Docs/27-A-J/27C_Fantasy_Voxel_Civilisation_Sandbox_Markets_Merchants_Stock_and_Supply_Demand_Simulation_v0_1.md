# FANTASY VOXEL CIVILISATION SANDBOX

## DOCUMENT SET 27

# 27C - Markets, Merchants, Stock and Supply-Demand Simulation

*Version 0.1 - Living Market, Merchant Behaviour and Economic Flow Foundation Draft*

A governing economic document for Leyforge that defines how local and regional markets emerge from real inventory, production, consumption, expected arrivals, reserve policy and information; how merchants decide what they can buy or sell; how shortages and surpluses become bounded market pressure; and how distant simulation preserves stock, ownership and economic history without creating ghost goods.

**Project Lead and Final Authority: Ash**

Architecture, systems planning, documentation and production support: GPT-5.6 Sol

---

| Markets and Merchant Simulation Statement |
| --- |
| **A Leyforge market is not a global price table and a merchant is not an infinite vending machine.** Markets are contextual economic views over real stock, real service capacity, real demand, real production, real expected arrivals and imperfect information. A merchant may sell only stock that exists and is economically available, may buy only when the merchant or sponsoring enterprise has funds, storage and interest, and must restock through production, procurement, trade or valid world-generation initialisation rather than a hidden timer. Supply and demand create bounded, explainable pressure that 27B converts into contextual fair value and executable quotes. Nearby trade is physically grounded; distant trade may aggregate lots and decisions, but every promoted result must reconcile to conserved quantities, ownership, time and history. |
| Field | Locked Direction |
| --- | --- |
| Document Set | This is Document 27C in Document Set 27: Economy, Trade and Commerce. |
| Document Scope | Owns market contexts/instances, commodity market facets, accessible/sellable stock, merchant economic policy, spot offers/orders, supply and demand aggregation, liquidity/turnover, substitution pressure, expected supply, market memory, market observations and the `market_pressure_signal` consumed by 27B. |
| Core Philosophy | Markets describe physical economic conditions; they never replace inventories, recipes, settlement needs, routes or actor identity. No global market oracle exists by default. |
| Stock Decision | Merchant stock is authoritative inventory. `AvailableForSale` is a derived subset after reservations, protected reserves, obligations and capacity rules. Expected arrivals are information, not stock. |
| Restocking Decision | No invisible periodic restock. Stock returns through production, procurement, transfers, route deliveries, worldgen bootstrap rules or explicit administrative/debug tools. |
| Demand Decision | Demand is a bounded economic intent derived from valid consumers, projects, services, production inputs, reserve targets and contracts. Demand does not automatically consume items or create purchases. |
| Supply-Demand Decision | 27C calculates an explainable, bounded market-pressure signal in [-1,+1] from stock coverage, flow balance, reserve pressure, expected arrivals, substitution and disruptions. 27B alone maps that signal into price movement. |
| Merchant Decision | Merchant behaviour uses data-driven target-stock bands, reserve floors, buy/sell interest, cash/storage limits, procurement policy, risk tolerance and market knowledge. Set 28 supplies social/personality outcomes; 27D owns enterprise ownership and profit accounting. |
| Liquidity Decision | Market depth is measured from credible accessible stock, purchasing capacity and recent authoritative volume. Tiny or self-generated trades cannot move a market as if they represented broad demand. |
| Information Decision | Actual market state and known market information are separate. Observations have source, timestamp, coverage and confidence. Rumours from Set 28 may be wrong without changing actual market truth. |
| Market Memory | Markets retain bounded rolling summaries of stock, volume, price observations, shortages, arrivals and disruptions. Memory supports trends and damping without storing every historical quote forever. |
| Settlement Boundary | 07/19/20 own people, warehouses, projects, buildings and needs. 27C reads their economic demand/supply interfaces and decides market availability; it does not redefine settlement simulation. |
| Route Boundary | 27H/Set 30/Set 26 own route/voyage/transport execution. 27C consumes expected-arrival, delay, loss and access information and reflects it in market state. |
| Contract Boundary | 27C owns short-lived spot orders/offers and procurement intents. 27E owns persistent contractual obligations, escrow, breach and enforcement. |
| Registry Direction | Set 25 remains canonical for IDs, schemas, field ownership, packs, relationships, migrations and validation. |
| Engine Direction | Market state is event-driven and deterministic in Godot. Summer Engine may assist authoring/tests but never invents runtime stock, demand, market pressure or merchant funds. |
| Production Direction | Local market contexts, real merchant stock, target-stock policies, bounded supply/demand pressure, simple market memory and explainable observations are Core candidates. Advanced auction/exchange behaviour is later/optional. |
| Final Authority | Ash retains final authority over market complexity, default stock bands, merchant policy families, smoothing values, production scope and any advanced market mechanisms. |
| Next Deliverable | 27D - Labour, Wages, Households, Businesses and Ownership. |

# Document Purpose

Document 27C turns the valuation and quote architecture of 27B into a living market system. Earlier Leyforge documents already establish physical inventories, warehouses, recipes, settlement needs, production chains, NPC merchants, ports, cargo and authoritative transactions. 27A and 27B deliberately stopped before defining how those facts become a local market state. This document closes that gap while preserving the ownership of NPC identity, settlement simulation, movement, contracts, labour, public finance and maritime execution.

The central distinction is between **economic truth**, **market availability**, **merchant policy** and **market information**. A settlement may physically own 1,000 grain, but only 150 may be released for sale because the warehouse protects a winter reserve and 300 are reserved for a construction or relief obligation. A trader may know a ship is expected tomorrow, but expected cargo is not sellable until it arrives. A player may hear that iron is scarce in a distant town, but that report may be old. These distinctions let the economy react to the world without producing unexplained numbers.

27C also establishes a practical simulation boundary. Leyforge does not need a real-time auction engine for every item in every village. Common goods use aggregated commodity-market state and merchant policies; important named items, contracts and singular objects remain individually represented. Nearby trade exposes exact stock and reservations. Distant markets use bounded summaries that conserve quantities and reconcile when loaded. The goal is a market that feels alive, readable and exploitable through legitimate preparation rather than one that demands constant spreadsheet management.

# Design Sources, Authority and Supersession

| Source | Relevant Direction | Treatment in 27C |
| --- | --- | --- |
| 00 - Master Game Design Bible | Living civilisations trade, consume resources and react to player production; trader is a valid player fantasy. | Markets must serve settlement and sandbox play rather than becoming an isolated financial minigame. |
| 01 - Core Gameplay Loop | Trade, gathering, crafting, automation, settlement support and expansion are connected solutions. | Market signals emerge from the same physical loops and create new goals rather than replacing them. |
| 02 - Player Progression | Trading is a use-based skill path; knowledge and reputation matter without fixed classes. | Trading skill improves appraisal, information handling and convenience, not hidden knowledge or stock creation. |
| 04 - Items Registry | Items have trade roles, quality/condition, ownership and physical inventory. | 27C never creates merchant stock from an item definition; stock comes from runtime holdings. |
| 05 - Crafting and Recipe Registry | Production uses real inputs, outputs, time, stations, fuel and by-products. | Producer supply and procurement demand read recipe throughput/capability rather than simulated free production. |
| 06 - Resource Progression | Scarcity, cultural preference and strategic use affect trade value; older materials remain useful. | Commodity facets and demand channels preserve long-term material identity. |
| 07 - NPC Village System | Merchants, warehouses, requests, needs, jobs, schedules, reputation and persistent identity. | 27C owns economic merchant policy and market availability; 07 remains identity, AI execution, schedules and warehouse truth. |
| 08 - Automation System | Automation moves and transforms real stock and can feed settlement warehouses. | Automated throughput changes supply only when outputs commit into authoritative storage. |
| 13 - Races, Peoples, Cultures and Factions | Culture, faction, territory and law are separate layers. | Preferences and access may modify demand/availability, never ancestry-based economic capability. |
| 15 - Quest and Event System | Shortages, contracts, markets, crises and route disruptions may generate quests/events. | 27C exposes market conditions and change events; quests cannot fabricate stock or demand. |
| 17 - UI/UX System | Trade UI should show stock, supply/demand, legality, trends, reasons and knowledge confidence. | 27C provides market summaries, availability reasons, observation freshness and advanced drill-down fields. |
| 19-20 - Settlement / Buildings | Warehouses, markets, shops, customs, services, construction and needs require real activation, stock and routes. | Market endpoints require valid facilities/permissions; a decorative market structure creates no economic capacity. |
| 25B-25C | Stable IDs, one editing authority per field, typed relationships, capabilities, suitability and completeness. | Market/merchant facets and runtime records register through Set 25 rather than duplicating item/NPC/structure fields. |
| 25E | Deterministic validation, seeded QA, performance/release gates. | Market tests include conservation, no-infinite-restock, bounded pressure and near/far reconciliation. |
| 25J | Production/resource chains preserve provenance and authoritative transformation. | 27C consumes chain throughput and stock provenance, never assigns phantom supply. |
| 26K | Maritime trade requires physical cargo, route knowledge, ports, crews and persistent risk; no universal market oracle. | Maritime market effects use 27C market state while 26K retains cargo/voyage/fleet authority. |
| 26N | Market summaries derive from inventory, production, consumption, expected arrivals, losses, restrictions and confidence. | Direct foundation for the market-state inputs formalised here. |
| 27A | Defines market scopes, supply/demand sources, merchant economic behaviour, imperfect information and physical conservation. | Governing parent architecture. |
| 27B | Defines RVU, fair value, price-pressure mapping, merchant spread boundary, quote lifecycle and required `market_pressure_signal`. | 27C produces market state and pressure; 27B produces value and executable price. |
| Sets 27-30 Cross-Set Interface Register v1.0 | Set 27 owns economy and consumes social/survival/movement interfaces. | Adopted; any additions are recorded as amendments, not silent ownership transfer. |
| 99 - POC Manual Testing Guide | Current runtime already has authoritative inventories, multi-settlement warehouses, automation, persistent item batches and transactions. | 27C extends proven physical state rather than inventing an abstract economy disconnected from implementation. |

> **Supersession Rule**
>
> Once 27C is approved, any earlier assumption that a merchant automatically restocks on a timer, has infinite purchase funds, exposes all settlement stock for sale, knows every regional price, or derives supply/demand from a fixed item rarity value is superseded. Earlier fixed-stock POC fixtures may remain as explicit bootstrap/test data, but production market state must resolve through the 27C availability and market-state rules.

# Static Table of Contents

1. Locked Market and Merchant Simulation Identity  

2. Locked Decision Summary  

3. Scope and Explicit Non-Goals  

4. Canonical Terminology  

5. Market System Architecture and State Separation  

6. Market Scopes, Types and Activation  

7. Market Context and Market Instance Records  

8. Commodity Facets, Families and Market Buckets  

9. Authoritative Stock Truth and Availability  

10. Protected Reserves, Reservations and Sellable Stock  

11. Expected Supply, Arrivals and Confidence  

12. Supply Measurement and Production Capacity  

13. Demand Architecture and Demand Intents  

14. Demand Sources, Priority and Urgency  

15. Demand Aggregation and Double-Counting Controls  

16. Supply-Demand Pressure Model  

17. Liquidity, Turnover, Volume and Market Depth  

18. Substitutes, Complements and Cross-Commodity Pressure  

19. Market Memory, Smoothing and Historical Windows  

20. Market Information, Observations, Rumours and Forecasts  

21. Merchant Economic Actor Architecture  

22. Merchant Policy Profiles and Merchant Types  

23. Buy Interest, Sell Interest and Refusal Rules  

24. Target Stock Bands, Bulk Limits and Spread Policy  

25. Procurement, Restocking and Replenishment  

26. Merchant Funds, Purchasing Capacity and Solvency Boundary  

27. Storefronts, Market Facilities and Service Capacity  

28. Spot Offers, Buy Orders and Short-Lived Market Orders  

29. Player Buying, Selling, Barter and Bulk Transactions  

30. NPC, Settlement and Business Market Participation  

31. Shortages, Surpluses, Shocks and Declared Crisis State  

32. Production, Crafting and Automation Integration  

33. Settlement Reserves, Projects, Households and Services Integration  

34. Routes, Caravans, Ports and Expected-Arrival Integration  

35. Culture, Law, Reputation and Social Interface Boundaries  

36. Trading Skill, Appraisal and Economic Knowledge  

37. UI/UX, Accessibility and Player Trust  

38. Difficulty, Economy Assistance and World Settings  

39. Simulation LOD, Persistence and Multiplayer Authority  

40. Set 25 Registry, Schema and Relationship Contracts  

41. Godot/Summer Engine Technical Direction  

42. Validation Invariants and Acceptance Scenarios  

43. Production Classification and Rollout Guidance  

44. Risks, Redesign Triggers and Scope Controls  

45. Open Decisions for 27D-27J  

46. Cross-Set Interface Amendments  

- Appendix A. Market and Merchant Record Templates  

- Appendix B. Market-Pressure Formula and Balance Reference  

- Appendix C. Merchant Policy Profile Library  

- Appendix D. Economic Reason-Code Additions  

- Appendix E. Validation and Deterministic Test Matrix  

- Appendix F. 27C Completion Checklist  

# 1. Locked Market and Merchant Simulation Identity

Markets and merchant simulation are the **availability, exchange-intent and local-economic-state layer** of Leyforge. They sit between physical world truth and 27B price formation. The world owns goods, people, buildings, routes and production. 27C interprets how much of that capability is economically accessible, who is willing and able to exchange it, how urgently consumers seek it, how confidently arrivals are expected and what the market remembers.

> **Locked Rule**
>
> No market, merchant, UI screen, distant-simulation summary or scheduled refresh may create goods, currency, service capacity, purchasing power or completed demand that does not trace to an authoritative source. A market can advertise, reserve, value, aggregate and route economic intent; it cannot invent economic truth.

## 1.1 Player-Facing Promise

A casual player should be able to trade in seconds: see the trader's actual available stock, see a readable price and major reason, buy/sell/barter, and move on. An economy-focused player should be able to inspect stock bands, recent volume, shortage causes, expected deliveries, substitute pressure and confidence; identify where production or transport can solve a shortage; and deliberately build profitable supply chains. Both experiences use the same underlying state.

## 1.2 Market Identity Layers

| Layer | Meaning | Example |
| --- | --- | --- |
| Physical Stock | Items actually held in inventories/storage. | 240 grain in a warehouse. |
| Economic Availability | Portion legally/operationally available for sale or purchase. | 80 grain released to market after reserves. |
| Supply Capacity | Credible future ability to produce/deliver. | Mill can produce 40 flour/day if grain and fuel continue. |
| Demand Intent | Valid desire/requirement to acquire goods/services. | Bakery seeks 20 grain; town reserve seeks 100. |
| Market State | Aggregated local context from supply, demand, arrivals, substitutes and disruption. | Grain shortage with moderate confidence. |
| Market Pressure | Bounded numeric signal supplied to 27B. | `+0.54` with low-stock and delayed-arrival reasons. |
| Merchant Policy | Actor/business rules for stock, buying, selling, reserves and procurement. | General trader protects 10 tools, buys up to target 30. |
| Market Information | What a particular observer currently knows. | Price board updated yesterday; caravan report uncertain. |
| Market Memory | Bounded historical summaries used for trends/damping. | Seven-day grain volume and shortage history. |

# 2. Locked Decision Summary

| Decision Area | 27C Lock |
| --- | --- |
| Global market | No default global market. Market contexts are local/regional and linked by actual information/transport networks. |
| Market activation | A player-facing trade market requires a valid merchant/service endpoint, permissions and capacity. Regional summaries may exist for simulation even when no stall is loaded. |
| Market inventory | Market listings resolve from authoritative stock. Listings are views/reservations, not duplicate inventories. |
| Sellable stock | `sellable = owned - hard reservations - protected reserves - unavailable/locked lots`, capped by access and service capacity. |
| Expected arrivals | Contribute to expectations only, weighted by confidence and ETA; never become sellable stock before delivery. |
| Restock | No hidden restock timer. Replenishment requires production, purchase, transfer, route delivery, valid bootstrap data or authorised administration. |
| Demand | Generated from valid consumer/project/service/production/reserve intents. Demand is not automatic purchase or consumption. |
| Demand priority | Priority influences urgency/reserve behaviour, not magical purchasing power. Essential demand can remain unmet. |
| Pressure output | Market pressure is [-1,+1], deterministic, explainable and damped. 27B maps it to prices. |
| Pressure evidence | Stock coverage and flow balance are primary; reserve lock, disruption, expected arrivals and substitutes are secondary. |
| Liquidity | Based on credible stock, purchasing capacity and authoritative turnover; self-trade/tiny volume is discounted for market influence. |
| Market memory | Rolling summaries, not permanent quote logs. Exact committed transactions remain auditable through transaction history boundaries. |
| Merchant funds | Merchants cannot buy without valid purchasing capacity. They may reduce quantity, barter, seek finance/contract or refuse. |
| Merchant stock floor | Merchants may protect operational/reserve stock and refuse to sell the last units. |
| Merchant pricing | 27C supplies spread/profile/availability; 27B composes executable quote. |
| Merchant social effects | Set 28 may change concession/access/refusal but not stock or market pressure. |
| Spot orders | 27C owns immediate/short-lived offers and market orders. Persistent obligations, deposits, escrow and breach become 27E contracts. |
| Substitutes | Use typed substitution groups/capabilities. Substitute availability reduces demand pressure only when the consumer can actually use the substitute. |
| Distant markets | Aggregate stock lots, demand buckets and flow summaries while preserving conservation and reconciliation. |
| Player market impact | Large player sales/purchases can move local conditions, but influence is volume/liquidity weighted and bounded. |
| Crisis state | Declared only from valid world/economic conditions; widens 27B volatility bounds but never removes floors/caps/audit rules. |
| Information | Actual market truth and observer knowledge are separate. No universal oracle by default. |
| Production target | Core: local merchants, physical stock, simple supply-demand, shortage/surplus feedback, expected arrivals, market memory and explainability. Advanced exchanges/auctions remain optional. |

# 3. Scope and Explicit Non-Goals

## 3.1 In Scope

- market definition/profile and runtime market-context records;

- commodity-market facets, aggregation families and substitution groups;

- authoritative available/sellable stock derivation;

- protected reserve and target-stock interfaces;

- supply capacity and expected-arrival interpretation;

- demand-intent records and aggregation;

- market-pressure calculation, smoothing, confidence and reason vectors;

- liquidity, turnover and market-depth summaries;

- market memory and price/stock/volume observations;

- merchant economic policy, buy/sell interest, stock bands and procurement intent;

- merchant purchasing-capacity checks and refusal reasons;

- spot offers, quote requests and short-lived buy/sell orders;

- local/regional market information and observer confidence;

- distant market aggregation and near/far reconciliation;

- market-facing registry fields, commands, events, diagnostics and QA;

## 3.2 Explicit Non-Goals

- currency denomination, barter valuation, fair-value mapping or quote arithmetic - 27B;

- household income, employer profit accounting, enterprise ownership, rent/property and wages - 27D;

- persistent contracts, escrow, breach and remedies - 27E;

- loans, banks, insurance and financial intermediation - 27F;

- tax/tariff rates, public procurement budgets and treasury policy - 27G;

- route profitability, caravan mission economics and cross-realm trade-network planning - 27H;

- monopoly control, embargoes, black-market liquidity and smuggling economics - 27I;

- final economy UI architecture, all multiplayer organisation permissions and final migration packaging - 27J;

- NPC personality, dialogue, trust and persuasion - Set 28;

- survival consumption formulas - Set 29;

- land movement/vehicle physics - Set 30;

- maritime voyage/port/vessel execution - Set 26;

- a real-world securities market, stock exchange or high-frequency trading simulation;

## 3.3 Complexity Boundary

The market system must answer useful gameplay questions: **Is this good available? Why is it expensive here? Who will buy it? What is likely to arrive? What shortage can I solve?** It does not need to solve every real economic behaviour. If a rule cannot produce a readable world consequence, meaningful decision, robust simulation or exploit safeguard, it should be simplified, aggregated or deferred.

# 4. Canonical Terminology

| Term | Definition |
| --- | --- |
| Market Definition | Reusable data describing a market service/category, supported commodities, geographic scope, policies and information rules. |
| Market Context | Specific runtime economic context in which supply, demand and observations are aggregated. |
| Market Instance | Persistent runtime record for an activated market context, its memory, links and state. |
| Commodity Facet | Economic classification attached to an item/resource/service through Set 25 relationships. |
| Commodity Bucket | Aggregation group in which economically fungible goods can contribute to one market signal without becoming the same item. |
| Owned Stock | Physical quantity held by an authoritative owner/container. |
| Accessible Stock | Owned stock that the market participant/service can legally and operationally access. |
| Protected Reserve | Stock intentionally withheld from ordinary sale to preserve operations, survival, contracts, projects or policy. |
| Reserved Stock | Stock already bound to a valid transaction/project/contract/reservation. |
| Sellable Stock | Accessible stock currently eligible for sale after reservations/reserves/locks. |
| Buy Capacity | Maximum quantity/value a participant can currently acquire given funds, storage, policy and permissions. |
| Supply Capacity | Credible rate/quantity that can be produced or delivered in the observation horizon. |
| Expected Arrival | Known incoming supply with quantity, ETA, route/source and confidence; not physical stock yet. |
| Demand Intent | Economic request/desire for a commodity/service from a valid source, with quantity, horizon, urgency and affordability context. |
| Target Stock | Preferred operating quantity/band used by an actor/settlement/enterprise. |
| Stock Coverage | Available/credible supply relative to target or expected demand over a defined horizon. |
| Turnover | Authoritative quantity/value exchanged in a market during a time window. |
| Liquidity | Practical ease of buying/selling meaningful quantity without exhausting stock/purchasing capacity. |
| Market Depth | Available quantity across price/participant bands within a local market context. |
| Market Pressure Signal | Bounded [-1,+1] 27C output representing shortage/surplus pressure before 27B value mapping. |
| Market Memory | Bounded rolling state summarising prior stock, demand, turnover, arrivals, disruptions and observations. |
| Price Observation | Historical committed transaction/quoted-market observation with source/time/confidence, as defined with 27B. |
| Procurement Intent | Non-contractual economic desire to replenish stock; may become a spot purchase or 27E contract. |
| Spot Offer | Immediate or short-validity offer to buy/sell a specified quantity. |
| Market Order | Short-lived instruction to seek execution under defined limits; not a persistent contractual obligation. |
| Crisis State | Explicit market condition justified by world/economic events that may activate wider 27B volatility bands. |
| Observer Market Knowledge | Market information available to a particular player/NPC/organisation, separate from actual market truth. |

# 5. Market System Architecture and State Separation

A market is a set of linked views and decisions, not a container that owns everything. The architecture keeps physical ownership, economic availability, aggregated state, information and price formation separate so each can change without corrupting the others.

| Layer | Owner | 27C Use |
| --- | --- | --- |
| Item/resource definitions | 03-06 / Set 25 replacement registries | Resolve commodity facets and capabilities. |
| Runtime inventories/storage | inventory/warehouse/structure owners | Read quantities, reservations, condition and access. |
| Production capability | recipes/automation/NPC/structures | Read credible throughput and constraints. |
| Consumer requirements | settlements/households/projects/Set 29/27D | Receive demand intents, not hidden consumption assumptions. |
| Transport/voyage state | Set 30 / Set 26 / 27H | Receive expected arrivals, ETA, capacity and disruption. |
| Market state | 27C | Aggregate supply/demand/liquidity/memory and expose pressure. |
| Value/quote | 27B | Convert market pressure and actor policy into fair value/quote. |
| Social concession | Set 28 | Apply bounded actor negotiation/access result. |
| Contract obligation | 27E | Persist obligations, escrow, breach and remedy. |

## 5.1 Event-Driven Market Updates

Market state changes primarily from facts: inventory transfer, production completion, consumption, reservation, project start, merchant policy change, delivery ETA change, route closure, settlement emergency, new substitute availability, shop activation/deactivation and committed trade. A scheduled maintenance tick may consolidate memory and distant summaries, but it must not be the only source of state change.

## 5.2 No Market-Owned Duplicate Inventory

A listing references source stock and a reservation/version token. It never copies the quantity into a second mutable inventory. If the source stock moves or becomes reserved elsewhere, the listing invalidates or requotes. This prevents common marketplace duplication bugs.

# 6. Market Scopes, Types and Activation

Market scope determines which stock, demand, participants and information may contribute. Scope is not merely geographic distance; it can also require route access, permissions, faction networks, realm connectivity or specialist capability.

| Market Type | Scope | Primary Use |
| --- | --- | --- |
| Merchant Stall / Shop | One merchant/enterprise endpoint and its accessible stock. | Exact local stock, direct player trade. |
| Producer Outlet | Workshop/farm/mine sells own surplus/output. | Lower intermediation, limited category breadth. |
| Settlement Market | Multiple authorised local participants/warehouses. | Town-level price/availability summary. |
| Specialist Market | Category-specific guild/dealer/service. | Rare goods, expertise, appraisal, limited liquidity. |
| Public Procurement Market | Settlement/faction seeks supplies. | Buy demand backed by valid budget/authority later 27G. |
| Trade Post / Frontier Market | Sparse participants and routes. | Higher spread, low liquidity, strong arrival effects. |
| Regional Trade Basin | Aggregate connected settlements/routes. | Distant simulation, trend/route planning; not direct inventory. |
| Port Market | Port-linked cargo/merchant services. | Consumes 26J/26K capacity, cargo and arrival state. |
| Realm Exchange Hub | Portal/realm-connected market context. | Requires valid dimensional access; cross-realm scarcity. |
| Temporary Event Market | Festival/fair/relief camp/siege market. | Time-bounded demand/supply profile from valid event. |

## 6.1 Activation Requirements

- valid market/merchant endpoint or simulation-defined regional context;

- authorised participants and access rules;

- storage or service capacity where physical exchange occurs;

- at least one supported commodity/service category;

- current world/settlement/route scope;

- authority owner for market-state mutation;

- information policy for player/NPC knowledge;

- pack/schema validity through Set 25;

A decorative stall without an active trader, storage and permissions may communicate culture but cannot create market stock or a trade interface. A regional market summary can exist without loaded stalls because it summarises already-valid distant participants.

# 7. Market Context and Market Instance Records

A single settlement may contain several market contexts. A bakery can participate in the local food market, a smith in the metal/tools market, and the settlement market board may aggregate observations across both. Context separation prevents one global settlement price from erasing specialist shortages or access restrictions.

## 7.1 Market Context Minimum Fields

| Field | Meaning |
| --- | --- |
| market_context_id | Stable runtime ID |
| market_definition_id | Reusable market profile |
| scope_type | stall / settlement / specialist / regional / port / realm |
| anchor_refs | Settlement, facility, route network or region anchors |
| participant_refs | Authorised participants or query rules |
| commodity_bucket_refs | Supported economic categories |
| jurisdiction_refs | Law/tax/access context references |
| information_policy_id | Who can observe what and at what freshness |
| update_policy_id | Event batching/smoothing policy |
| memory_profile_id | Rolling window configuration |
| state_version | Optimistic concurrency/version token |
| last_recomputed_at | World timestamp |
| reason_state | Top active shortage/surplus/disruption reasons |

## 7.2 Market Instance Lifetime

Market instances may persist while their physical presentation unloads. If a settlement is abandoned, occupied or disconnected, the market instance may enter suspended, degraded or archived state rather than disappearing. Historical observations remain bounded and queryable for world history, while active trading requires renewed capability.

# 8. Commodity Facets, Families and Market Buckets

Items remain distinct definitions. A commodity bucket exists only to aggregate economically comparable supply/demand. This is crucial: oak logs and another approved construction timber may both satisfy a `construction_timber` market bucket while retaining different crafting, cultural, quality and item identities.

## 8.1 Candidate Commodity Dimensions

- economic role: staple, industrial input, construction, medical, magical, luxury, strategic, cultural, contraband;

- fungibility: exact-only, family-substitutable, capability-substitutable, non-fungible;

- perishability/condition sensitivity;

- quality/purity sensitivity;

- normal turnover horizon;

- normal stock-coverage horizon;

- volatility profile from 27B;

- storage/handling constraints;

- consumer compatibility tags;

- regional/cultural preference tags;

## 8.2 Non-Fungible Goods

Named relics, unique quest objects, bespoke equipment and singular artefacts should not feed normal commodity stock pressure merely because they share a category tag. They may be appraised and sold through specialist/auction-like systems later, but their value is not inferred from bulk commodity turnover.

# 9. Authoritative Stock Truth and Availability

Physical stock is the foundation. 27C queries inventory/storage owners and derives economic availability without taking ownership of those quantities. Every market-facing quantity must be explainable back to a source container, aggregate lot or distant conserved summary.

## 9.1 Stock State Categories

| State | Rule |
| --- | --- |
| Owned | Exists in owner inventory/storage. |
| Accessible | Market endpoint has permission/route to use it. |
| Reserved | Committed to transaction/project/contract/production. |
| Protected | Held back by reserve/operational policy. |
| Locked | Seized, quest-bound, unsafe, inaccessible, contraband hold, etc. |
| Sellable | Accessible minus reserved/protected/locked quantities. |
| Inbound | Expected but not yet owned at destination. |
| Display/Advertised | UI exposure; always references sellable source quantity/version. |

## 9.2 Availability Formula

For an exact stock lot, the conceptual default is:

`SellableQty = max(0, AccessibleQty - HardReservations - ProtectedReserve - OperationalLocks)`

Additional category/site caps may reduce how much can be sold per quote because of service throughput, packaging, storage access or law. None may increase the underlying quantity.

## 9.3 Multi-Owner Market Stock

Settlement markets may aggregate offers from several owners. The market summary may show 300 units available while the transaction resolver still commits against exact owner lots in deterministic order or according to policy. Aggregation never merges ownership irreversibly.

# 10. Protected Reserves, Reservations and Sellable Stock

A living settlement must be allowed to keep essential goods. Otherwise a player could buy the final food stack from a village moments before winter and the settlement AI would appear irrational. Reserve policy is therefore a first-class economic input, not a hidden cheat.

## 10.1 Reserve Sources

- settlement survival/provision target;

- production input buffer;

- merchant operating stock;

- repair/maintenance reserve;

- guard/defence provisioning;

- construction/project reservation;

- festival/event stock;

- contract/quest reservation;

- emergency/public reserve from 27G;

- vessel/caravan provisioning from external owners;

## 10.2 Reserve Precedence

Hard reservations consume availability first. Safety/essential reserves then protect configured quantities. Merchant target stock influences buy/sell interest but is not automatically a hard lock. Emergency/public-policy overrides must come from their owning system and remain auditable.

## 10.3 Player Readability

A trader may show “12 available; more held for village reserve” rather than silently hiding the reason. Exact protected quantities may be restricted by knowledge/role, but refusal must still expose a truthful high-level cause such as `protected reserve`, `contract reserved`, `not authorised` or `not accessible`.

# 11. Expected Supply, Arrivals and Confidence

Expected arrivals influence expectations but never create present stock. A caravan scheduled with 100 iron can reduce shortage pressure before arrival only according to its quantity, ETA, route state and confidence. If it is delayed, rerouted, attacked or destroyed, the expectation changes and the market reacts.

## 11.1 Expected Arrival Fields

| Field | Purpose |
| --- | --- |
| source_ref | Producer, shipment, caravan, vessel, transfer or contract. |
| commodity_ref | Exact item/bucket expected. |
| quantity_expected | Expected delivered quantity. |
| eta_window | Earliest/latest or best-estimate arrival. |
| confidence | [0,1] confidence based on route/source state. |
| destination_ref | Market/storage/service endpoint. |
| reservation_status | Whether destination demand already owns/claims it. |
| risk/disruption_tags | Known delay/loss causes from route owners. |
| last_updated | Observation timestamp. |

## 11.2 Confidence Decay

Expected-arrival confidence decays when information becomes stale or the route loses visibility. A promised shipment with no recent status should stop suppressing shortage pressure indefinitely. Exact decay curves are balance profiles rather than universal constants.

# 12. Supply Measurement and Production Capacity

Supply has two major parts: stock already available and credible near-term capacity. Production capacity is not treated as finished goods. It contributes to planning and expected supply only when inputs, station capability, labour/power and scheduling are valid enough to justify confidence.

## 12.1 Supply Inputs

- sellable stock now;

- releasable surplus from settlement/business policy;

- confirmed production batches;

- credible production capacity within horizon;

- confirmed inbound transfers;

- authorised imports;

- recoverable substitute supply;

- seasonal/renewable supply forecasts where owning systems expose them;

## 12.2 Capacity Confidence

A sawmill capable of 100 planks/day does not contribute 100 planks/day if it lacks logs, power, labour or storage. Capacity confidence should be the minimum/combined validity of required inputs rather than a static machine stat. This preserves the resource-conservation promise.

# 13. Demand Architecture and Demand Intents

Demand is represented as **intent**, not as an invisible consumer that directly removes stock. A demand intent says a valid system wants a quantity within a horizon and may have urgency, substitution and affordability information. Whether it is fulfilled through purchase, internal transfer, production, rationing, quest, automation or contract is resolved by the relevant systems.

## 13.1 DemandIntent Minimum Fields

| Field | Meaning |
| --- | --- |
| source_ref | Household/settlement/project/recipe/service/merchant/contract etc. |
| commodity_or_capability | Exact item or accepted bucket |
| quantity_required | Quantity over horizon |
| horizon | When/over what period demand applies |
| urgency | Routine / elevated / critical or continuous value |
| priority_class | Essential, operational, discretionary, strategic etc. |
| substitute_set | Valid alternatives and conversion factors |
| affordability_context | Budget/purchasing-capacity reference where known |
| already_reserved_qty | Prevents duplicate market demand |
| internal_supply_qty | Expected self-supply before market |
| source_confidence | Validity/forecast confidence |
| reason_codes | Why demand exists |

## 13.2 Unmet Demand Is Allowed

If a settlement cannot afford or physically obtain medicine, the system records unmet demand and consequences; it does not fabricate a purchase. This enables quests, trade opportunities, migration, rationing and hardship to emerge from real conditions.

# 14. Demand Sources, Priority and Urgency

| Demand Source | Example | Ownership Boundary |
| --- | --- | --- |
| Survival / households | Food, heating fuel, medicine. | Set 29/27D supplies consumption requirement; 27C interprets market demand. |
| Settlement reserves | Provisions, repair stock, emergency supply. | 07/20/27G supplies target/policy. |
| Construction/projects | Stone, timber, iron, components. | 19/20 supplies staged requirements/reservations. |
| Production inputs | Ore, fuel, reagents, parts. | 05/08/workplace owners expose valid need. |
| Defence | Ammunition, medicine, food, repair materials. | 16/07 supplies readiness requirements. |
| Magic infrastructure | Mana goods, catalysts, ward parts. | 09/20 supplies actual service needs. |
| Culture/festivals | Foods, decorations, ritual goods. | 13/15 supplies event/cultural requirements. |
| Trade/procurement | Merchant/business seeks stock. | 27C policy; persistent purchase obligations move to 27E. |
| Travel/fleets | Food, fuel, repair stock, cargo demand. | 27H/Set 30/Set 26 supplies requirements. |
| Strategic stockpiling | Reserve accumulation during risk. | Owning settlement/faction/public policy supplies target. |

Urgency changes market pressure and procurement priority, but does not multiply the same quantity into several demand records. One project that is “critical” remains one project demand.

# 15. Demand Aggregation and Double-Counting Controls

Demand aggregation is one of the highest-risk areas for artificial scarcity. The same need may appear in a settlement need summary, a project reservation and a merchant procurement request. 27C therefore requires source IDs and reservation links so one physical requirement is counted once at each relevant stage.

## 15.1 Aggregation Order

1. collect valid demand intents for market scope.

2. remove expired/cancelled/invalid intents.

3. subtract already fulfilled or internally reserved quantity.

4. deduplicate intents sharing the same root requirement.

5. apply valid substitution coverage.

6. apply horizon/confidence weighting.

7. aggregate remaining demand by commodity bucket and priority.

8. retain source reason contributions for explainability.

## 15.2 Root Requirement ID

Where a requirement spawns downstream economic actions, all descendants should retain a `root_requirement_id`. Example: `village food reserve shortfall` may generate a merchant procurement intent and later a 27E delivery contract. Market demand counts the unresolved root quantity, not the sum of all representations.

# 16. Supply-Demand Pressure Model

27C must output the market-pressure contract required by 27B. The calculation is deterministic and bounded; the exact tuning profiles may differ by commodity. The goal is to reflect shortage/surplus direction and strength while resisting one-off noise.

## 16.1 Core Components

| Component | Meaning | Direction |
| --- | --- | --- |
| Stock Coverage | How current sellable/credible stock compares with target demand/stock horizon. | Low coverage -> positive pressure. |
| Flow Balance | Demand rate compared with confirmed replenishment/production rate. | Demand > supply -> positive. |
| Reserve Lock | Fraction of accessible stock withheld for valid reserves/obligations. | More locked stock -> positive. |
| Disruption | Route closure, production outage, disaster, siege/blockade or access loss. | Disruption -> positive for affected imports. |
| Expected Arrival Relief | Inbound quantity * confidence * ETA relevance. | Strong near arrival -> negative/relief. |
| Substitute Relief | Usable alternative supply weighted by compatibility/elasticity. | More alternatives -> negative/relief. |
| Surplus/Overflow | Stock exceeding target/capacity with low demand. | Surplus -> negative pressure. |

## 16.2 Recommended Deterministic Form

Let each component be normalised to [-1,+1] or [0,1] as appropriate. A profile supplies weights. A practical form is:

`raw = w_stock*stock + w_flow*flow + w_reserve*reserve + w_disruption*disruption - w_arrival*arrival_relief - w_substitute*substitute_relief + w_surplus*surplus_signal`

`target_signal = tanh(response_strength * raw)`

`market_pressure_signal = smooth(previous_signal, target_signal, responsiveness)`

All arithmetic is implemented in deterministic fixed-point/integer form or a deterministic lookup/curve implementation. The `tanh` notation describes the shape, not a requirement to use nondeterministic floating-point runtime math.

## 16.3 Stock-Coverage Signal

Stock coverage should use a ratio rather than raw quantity so 10 missing bread matters differently in a hamlet and a capital. A logarithmic ratio is recommended because it treats “half target” and “double target” symmetrically in pressure space before clamping.

## 16.4 Output Contract to 27B

- `market_pressure_signal` [-1,+1];

- supply reason list;

- demand reason list;

- observed volume/liquidity band;

- stock/availability confidence;

- expected-arrival confidence;

- substitution pressure;

- market-state timestamp;

- declared crisis/volatility override state if valid;

27C does not calculate the final price multiplier. 27B remains authoritative for volatility profiles, value mapping, actor spread, taxes/fees, currency conversion and quote settlement.

# 17. Liquidity, Turnover, Volume and Market Depth

A market with one rare item and one wealthy buyer is not equally liquid to a grain market with many sellers. Liquidity is therefore an economic summary rather than a universal stat. It helps merchant policies, UI confidence and anti-manipulation safeguards.

## 17.1 Liquidity Inputs

- sellable quantity across credible participants;

- active purchasing capacity across credible buyers;

- recent authoritative transaction volume;

- frequency of transactions;

- number/diversity of independent participants;

- storage/handling/service throughput;

- substitute availability;

- route connectivity and replenishment confidence;

## 17.2 Volume Credibility

Market-moving volume excludes or heavily discounts invalid/self-cancelling patterns such as the same owner selling goods to itself, repeated related-party transfers with no economic change, debug grants, migration corrections and transactions explicitly marked non-market. Multiplayer player-to-player trades may count only when ownership truly changes and the market context can legitimately observe them.

## 17.3 Market Depth Bands

Core UI can expose qualitative bands such as **thin, limited, normal, deep** instead of a full order book. Advanced systems may expose quantity-at-price bands later, but exact depth must still resolve to actual participants/stock.

# 18. Substitutes, Complements and Cross-Commodity Pressure

The economy should recognise alternatives without making every item interchangeable. A settlement short on oak logs may use another approved structural timber; a ritual requiring a specific pure crystal may accept no substitute. Substitution is capability- and consumer-specific.

## 18.1 Substitute Contract

- substitute group/capability ID;

- consumer compatibility;

- conversion ratio or effective quantity;

- quality/condition minimum;

- culture/legal acceptance;

- additional recipe/service cost if substitution requires conversion;

- elasticity/relief factor;

- knowledge requirement if the consumer must know the alternative;

## 18.2 Complementary Goods

Demand for one good may create bounded demand for complements when an owning recipe/project exposes the relationship. For example, higher tool production may raise handle or fuel inputs. 27C must read actual recipe/project requirements rather than invent generic correlations from historical prices.

# 19. Market Memory, Smoothing and Historical Windows

Market memory exists for three reasons: to make trends readable, prevent prices/state from oscillating wildly after one event, and support imperfect historical knowledge. It is deliberately bounded. Long-term world history records major crises/events separately rather than retaining every market sample forever.

## 19.1 Recommended Memory Windows (Balance Draft)

| Window | Default Role | Example Data |
| --- | --- | --- |
| Immediate | Current/last few market updates. | Sellable stock, active shortage reasons, arrivals. |
| Short | Approx. 1 in-game day. | Turnover, average pressure, transaction count. |
| Medium | Approx. 7 in-game days. | Trend, recurring shortage, normal volume. |
| Long | Approx. 30 in-game days or season profile. | Baseline comparison, structural surplus/deficit. |

Exact lengths remain tuning data and may scale with world time. The system stores aggregates such as min/max/weighted-average/volume/reason-frequency, not every sample.

## 19.2 Smoothing Rule

Current physical shortages must still matter immediately. Smoothing damps the economic pressure signal, not stock truth. UI should never imply “10 items available” because yesterday there were 10. Exact current availability remains exact.

# 20. Market Information, Observations, Rumours and Forecasts

Actual market state belongs to 27C. What the player or an NPC knows is an observer-specific information layer. This preserves exploration, scouting, merchant expertise, letters, market boards and rumours.

## 20.1 Observation Sources

- direct trade/inspection;

- market board or public posting;

- merchant conversation;

- trade guild/report;

- caravan/vessel manifest or arrival notice;

- settlement official report;

- player-owned network/ledger;

- quest/event clue;

- Set 28 rumour/gossip;

- remote magical/technical information service where approved;

## 20.2 Information Record

Every observation has source, observed market, commodity scope, timestamp, coverage, confidence and whether it is measured, reported, estimated or rumoured. Set 28 owns whether a communicated claim is truthful/lying/mistaken; 27C owns economic freshness and whether it corresponds to current market state.

## 20.3 Forecasts

Forecasts are ranges/likelihoods from known arrivals, production, events and trend state. They are never guaranteed future prices. Better trading skill or infrastructure may expose confidence/causes more clearly but cannot see undiscovered route losses or secret decisions.

# 21. Merchant Economic Actor Architecture

A merchant is an NPC/enterprise participant with economic policy. 27C does not own the NPC's personality, animation, schedule or life history; it owns the market-facing rules that decide what the participant can offer, wants to acquire and how it reacts economically to stock and funds.

## 21.1 MerchantEconomicPolicy Inputs

- supported commodity buckets;

- target stock bands;

- protected reserve floors;

- buy target and sell target;

- maximum storage/carry capacity;

- minimum/maximum trade quantity;

- spread/margin profile ID supplied to 27B;

- procurement/replenishment methods;

- risk tolerance/economic urgency;

- currency/payment acceptance via 27B;

- available purchasing-capacity source;

- market knowledge/information access;

- legal/permission restrictions;

- business operating state from 27D/structures;

- Set 28 social concession/refusal input;

## 21.2 Merchant Does Not Equal Building

A merchant may operate from a stall, shop, caravan, ship, temporary fair or settlement service. A building can remain after the enterprise/merchant leaves. A merchant can survive loss of a shop but may have no local service capacity until a replacement endpoint exists. 27D will formalise enterprise ownership and accounts.

# 22. Merchant Policy Profiles and Merchant Types

| Profile | Role | Economic Behaviour |
| --- | --- | --- |
| General Retailer | Broad household/basic goods. | Moderate stock targets, standard spread, local restock. |
| Producer Seller | Own output and needed inputs. | Sells surplus output; buys feedstock/components. |
| Specialist Dealer | Rare/technical/magical/quality goods. | Low volume, high expertise, selective acquisition. |
| Wholesaler / Factor | Bulk goods and merchant-to-merchant supply. | Large lots, lower unit spread, storage/route dependence. |
| Itinerant Trader | Mobile limited stock. | Route-dependent, small capacity, strong replenishment constraints. |
| Buyer / Procurer | Primarily acquires categories. | Backed by valid employer/settlement budget. |
| Quartermaster | Settlement/faction operational supply. | Protected reserves, policy access, later public-finance interface. |
| Broker / Agent | Matches participants, may not own goods. | Can issue referrals/spot intents; persistent agency terms later 27E. |
| Exchange Service | Currency conversion/value service. | 27B/27F rules; no free liquidity. |
| Port/Caravan Merchant | Cargo-linked regional trader. | Consumes 27H/26K route/arrival state. |

These are policy archetypes, not fixed professions or cultures. Culture/faction packs may configure them without assigning economic behaviour by ancestry.

# 23. Buy Interest, Sell Interest and Refusal Rules

Merchant interest is derived from current policy and state. A merchant can value an item highly yet refuse it because storage is full, funds are low, the category is unsupported or target stock is already exceeded. Conversely, a merchant may desperately want grain but be unable to pay, creating a procurement/credit/public-relief opportunity rather than an invisible purchase.

## 23.1 Sell Interest

Sell interest generally rises when stock exceeds sell target or storage pressure is high, and falls when stock approaches protected reserve. Essential/operational items may have a hard sell floor.

## 23.2 Buy Interest

Buy interest generally rises below target stock, with demand/customer pull, expected profitable use and strategic needs, and falls near capacity or when credible arrivals will satisfy the gap. Buying must still pass purchasing-capacity and storage checks.

## 23.3 Common Refusal Reasons

- unsupported commodity;

- stock protected/reserved;

- insufficient purchasing funds;

- storage full;

- quantity too small/large for policy;

- item condition/quality unacceptable;

- legality/permission blocked;

- merchant/service closed/unavailable;

- no accepted payment method;

- quote/stock changed;

- counterparty social refusal from Set 28;

# 24. Target Stock Bands, Bulk Limits and Spread Policy

A target stock band gives merchants readable behaviour without scripting every item. Recommended conceptual levels are `protected_floor`, `buy_target`, `neutral_band`, `sell_target`, and `capacity_ceiling`. Exact quantities may be absolute, days-of-cover, percentage-of-capacity or profile-derived.

## 24.1 Behaviour by Band

| State | Typical Behaviour |
| --- | --- |
| Below protected floor | Refuse ordinary sale; strong procurement intent; shortage reason. |
| Below buy target | High buy interest; reduced sell quantity; possible premium via 27B pressure/spread. |
| Neutral band | Normal buy/sell policy. |
| Above sell target | Higher sell quantity; reduced buy interest; possible surplus discount. |
| Near capacity ceiling | Strong sell/transfer intent; may refuse further purchases. |

## 24.2 Spread Boundary

27C selects the merchant spread/margin profile and may expose economic modifiers from liquidity, inventory burden or service type. 27B owns final bid/ask quote composition and anti-arbitrage safeguards. Set 28 may provide a bounded social concession after the economic policy stage.

## 24.3 Bulk Limits

Bulk availability is constrained by sellable stock, handling throughput and merchant policy. A bulk discount is never granted purely because the requested quantity is large; the transaction must actually reduce per-unit handling/marketing cost or satisfy a seller surplus policy. 27B remains authoritative for quote adjustment.

# 25. Procurement, Restocking and Replenishment

Restocking is a gameplay loop, not a timer. When a merchant falls below target, it creates procurement intents that can be satisfied through one or more valid channels.

## 25.1 Replenishment Channels

| Channel | Rule |
| --- | --- |
| Own Production | Merchant/enterprise produces through real recipes/workstations. |
| Local Purchase | Buys from players/NPCs/local producers using funds. |
| Internal Transfer | Moves stock from another owned/authorised store. |
| Spot Procurement | Posts short-lived buy interest in local market. |
| Contract Procurement | Creates persistent 27E delivery/order obligation. |
| Regional Shipment | 27H caravan/trade-route delivery. |
| Maritime Shipment | 26K/27H cargo voyage/port delivery. |
| Public Allocation | 27G/public policy transfers valid reserve stock/funds. |
| Worldgen Bootstrap | Initial seeded stock only at creation, explicitly marked and conserved thereafter. |

## 25.2 No Respawn Restock

A shop may have an authored initial stock profile when first generated, representing existing world history. After that initialisation, routine stock must come from world processes. Reloading, unloading/reloading a chunk, sleeping or reopening the shop must not regenerate stock.

## 25.3 Procurement Failure

If no supplier, route, funds or capacity exists, stock remains low. The merchant may reduce service, increase buy interest, create requests/contracts, switch substitutes or eventually close/degrade through 27D business rules.

# 26. Merchant Funds, Purchasing Capacity and Solvency Boundary

Merchants cannot buy unlimited goods. 27C requires a valid purchasing-capacity source: purse/account/enterprise/settlement budget as appropriate. 27D will define business accounting and 27F credit. 27C only decides whether current spot purchase capacity is available.

## 26.1 Purchasing Capacity

Purchasing capacity may be limited by:

- available currency/account balance;

- authorised budget cap;

- payment goods available for barter;

- storage capacity;

- daily/transaction policy limits;

- currency acceptance/exchange access;

- reserved funds for existing obligations;

- liquidity/credit facility supplied later by 27F;

## 26.2 Insufficient Funds Behaviour

A merchant may buy a smaller quantity, offer barter, decline, create a procurement contract request, seek finance through 27F or request public/owner funding. It may not silently create currency.

## 26.3 Solvency Boundary

Business profit/loss, bankruptcy and closure are 27D/27F. 27C exposes repeated insufficient-funds, unsold-stock and procurement-failure states as economic evidence those systems can consume.

# 27. Storefronts, Market Facilities and Service Capacity

Markets need places or service channels through which exchange can occur. Document 20 already establishes that functionality requires semantic markers, routes, people, stock, permissions and operational state. 27C consumes those activation contracts.

## 27.1 Facility Effects

A valid market facility may contribute:

- number of simultaneous trade interactions;

- handling/transfer throughput;

- storage access;

- commodity categories supported;

- inspection/appraisal capability;

- public price-board/observation freshness;

- currency exchange service;

- security/customs/legal access;

- opening hours/staff requirement;

- market reach or participant capacity;

## 27.2 Failure States

If the market building loses staff, route access, storage, power/mana where required, permissions or safe operation, trading degrades or stops. The market summary may still remember historical conditions; it must not continue executing physical trades as if the facility were operational.

# 28. Spot Offers, Buy Orders and Short-Lived Market Orders

27C supports short-lived market intents needed for ordinary commerce. These are deliberately simpler than 27E contracts.

## 28.1 Spot Offer

A spot offer specifies subject, quantity, direction, source/party, quote/limit terms, expiry and reservation behaviour. It is expected to execute immediately or expire shortly.

## 28.2 Market Order

A market order may instruct a valid market service to seek a buy/sell within quantity and price/quality limits for a bounded duration. It cannot contain long-term delivery obligations, penalties, escrow, staged milestones or breach remedies; those promote to a 27E contract.

## 28.3 No Global Auction House by Default

The game does not expose every player/NPC item in the world through one instant marketplace. Any remote order requires an information/service network and actual logistics for delivery. Local exchange and specialist auction/fair systems can exist as content later under the same physical rules.

# 29. Player Buying, Selling, Barter and Bulk Transactions

The normal transaction flow should remain fast while retaining strong authority.

1. player opens valid merchant/market endpoint.

2. 27C exposes current sellable stock and buy interests from authoritative state.

3. 27B creates executable quote using 27C market pressure and merchant policy.

4. player selects quantity/payment/barter legs.

5. server/host reserves source stock/payment.

6. revalidate market/merchant state and quote.

7. atomically transfer goods/payment/ownership.

8. record transaction and market observation.

9. update affected stock/demand/memory and invalidate stale quotes.

## 29.1 Large Player Sales

A player may legitimately flood a small market with goods. The market responds by filling target stock, reducing buy interest, exhausting merchant funds/storage and eventually creating surplus pressure. This creates a natural reason to seek larger markets or build trade routes. The system must not keep buying infinite stacks at unchanged terms.

## 29.2 Large Player Purchases

Bulk buying can deplete local sellable stock, reveal reserve floors and create shortage pressure. Protected settlement stock remains protected unless valid permissions/policy release it.

# 30. NPC, Settlement and Business Market Participation

NPCs and settlements should interact economically without requiring every villager to open a shop UI or maintain a personal price model. Named merchants use individual policy records; ordinary household/business demand can be aggregated by 27D/07 into demand batches.

## 30.1 Participation Modes

- direct merchant seller/buyer;

- producer outlet;

- household/consumer demand batch;

- settlement reserve buyer/releaser;

- project procurement demand;

- workshop input/output participant;

- public/faction procurement participant;

- caravan/vessel/route trader;

- temporary event/festival participant;

## 30.2 Internal Transfer vs Market Trade

Moving goods between two inventories under the same ownership/organisation may be an internal transfer rather than market turnover. It can affect local availability but should not be recorded as independent demand/price discovery unless an actual economic transfer/price occurred.

# 31. Shortages, Surpluses, Shocks and Declared Crisis State

Shortage and surplus are states derived from coverage/flow, not binary global flags. They may be category-specific and local. A town can have abundant timber and critically low medicine at the same time.

## 31.1 Shortage Lifecycle

- coverage falls or demand rises;

- market pressure increases with reasons;

- merchant buy interest/procurement grows;

- price may rise through 27B within normal band;

- players/NPCs receive requests/opportunities through 15/27E;

- production/routes/substitutes respond;

- arrival/consumption changes state;

- memory records duration/severity and returns toward baseline;

## 31.2 Surplus Lifecycle

Surplus may reduce buy interest, increase sell quantities, trigger storage pressure, processing/preservation, exports or production slowdown. It must not cause items to vanish merely to restore equilibrium; spoilage/waste requires owning systems.

## 31.3 Declared Crisis

A crisis state requires explicit justification such as siege, famine, catastrophic route loss, magical disaster, blockade or systemic production failure. It may activate wider 27B volatility bands and emergency procurement policies, but every effect remains capped and explainable.

# 32. Production, Crafting and Automation Integration

Production is one of the main ways players influence markets. The market reads committed outputs and credible throughput; it never anticipates infinite production merely because a machine exists.

## 32.1 Supply From Production

- actual finished output entering authorised storage;

- scheduled batch with reserved inputs and valid station;

- machine/NPC throughput with current inputs/power/labour;

- by-products where economically relevant;

- quality/condition distribution where it changes commodity compatibility;

## 32.2 Input Demand

Production demand comes from scheduled/targeted recipes and business plans, not every recipe the player has unlocked. A smith knowing 200 recipes does not create demand for every ingredient.

## 32.3 Automation Saturation

If automation greatly increases local output, merchant storage and demand can saturate. The player must expand consumption, processing, settlement growth or regional trade rather than selling infinite output into one local market. This is a core anti-infinite-profit control.

# 33. Settlement Reserves, Projects, Households and Services Integration

Settlement systems already track real needs, warehouses, projects and services. 27C converts unresolved economic requirements into market intents while preserving their source ownership.

## 33.1 Settlement Market Inputs

- warehouse stock and reservations;

- seven-needs service demand;

- population/household consumption batches;

- active construction/repair project requirements;

- guard/defence readiness stock;

- public reserve targets;

- local production/output forecasts;

- facility activation and staffing;

- culture/event demand;

- current affordability/budget from 27D/27G when available;

## 33.2 Internal Supply Before External Demand

Where appropriate, settlement planners should account for internal owned/expected supply before publishing external market demand. This prevents a village farm and its market buyer from both claiming the same shortage. The economic interface should show the residual unmet quantity after internal reservations.

## 33.3 Player Contribution

Player deliveries can satisfy direct settlement/project needs, sell to merchants, fill a public procurement order or feed automation. Each path records its actual destination and economic effect; one delivery cannot simultaneously count as a sale and an unmet-demand fulfilment unless the transaction explicitly performs both.

# 34. Routes, Caravans, Ports and Expected-Arrival Integration

27C needs transport information but never simulates movement. Route owners expose whether goods are expected, how much, when and with what confidence.

## 34.1 Set 30 / 27H Terrestrial Inputs

- route accessibility;

- travel/ETA state;

- vehicle/caravan usable capacity;

- operating readiness;

- delay/breakdown/interruption outcome;

- arrival/loss/damage result;

## 34.2 Set 26 Maritime Inputs

- port access/processing capacity;

- cargo lot quantity/condition/custody;

- voyage ETA/state;

- maritime route risk/disruption;

- customs/clearance hold where it blocks availability;

- loss/damage/delay outcome;

## 34.3 Blockade and Route Loss

A blockade does not directly increase a numeric price. Set 26/27H changes accessible routes, arrival confidence and delivered quantities; 27C converts that into supply/market pressure; 27B maps pressure into value/quotes. This chain keeps ownership clean and consequences auditable.

# 35. Culture, Law, Reputation and Social Interface Boundaries

Culture/law/social state can change what a market accepts, who can participate and how a merchant behaves toward a counterparty. It does not rewrite physical stock or global scarcity.

## 35.1 Culture / Faction Inputs

- preferred goods/categories;

- restricted/taboo goods;

- market days/facility norms;

- authorised currencies/payment forms;

- jurisdiction/access rules;

- strategic reserve preferences;

- specialist merchant availability;

## 35.2 Set 28 Inputs

- trust/relationship state;

- merchant willingness/refusal;

- negotiated concession class;

- rumour/truth/lie provenance;

- companion/representative social authority if later approved;

Set 28 may not increase merchant funds, create stock, alter `market_pressure_signal`, or satisfy demand. It affects social access/terms only.

## 35.3 Law / Illicit Boundary

27C can mark market goods as restricted and apply access/availability results from law/faction systems. 27I owns black-market discovery, illicit liquidity, smuggling and evasion economics.

# 36. Trading Skill, Appraisal and Economic Knowledge

Trading progression should make the player better at understanding and operating within markets, not grant supernatural market omniscience.

| Capability | Low Skill | Higher Skill |
| --- | --- | --- |
| Price understanding | Current quote and basic reason. | Fair-value estimate bands, trend/context breakdown. |
| Stock understanding | Visible merchant quantity. | Target-stock/availability band hints where discoverable. |
| Market comparison | Manual travel/notes. | Better remembered observations and comparison tools. |
| Information confidence | Simple “old/current” cues. | More precise age/source/confidence. |
| Substitutes | Obvious alternatives. | Better compatible substitute suggestions. |
| Bulk trade | Basic quantity selection. | Better planning/alerts; no automatic discount entitlement. |
| Procurement | Manual shopping. | Better market-search/filter and contract suggestions. |

Skill must never reveal secret stock, undiscovered markets, hidden routes or truthful rumours without a valid knowledge source.

# 37. UI/UX, Accessibility and Player Trust

Document 17 remains interface authority; 27C supplies truthful view models. The default trade view should remain compact, while economy-focused players can drill down.

## 37.1 Basic Merchant View

- item/service name and quantity available;

- buy/sell price from 27B;

- whether trader buys the selected item;

- major shortage/surplus reason icon/text;

- stock/reserve refusal explanation;

- payment compatibility;

- quote validity/change feedback;

## 37.2 Advanced Market View

- availability band and recent trend;

- recent observed volume/liquidity band;

- top supply/demand causes;

- expected-arrival summary with confidence;

- substitute availability;

- observation freshness/source;

- market scope and connected known markets;

- historical price/pressure trend where knowledge permits;

## 37.3 Accessibility

Shortage/surplus, trend, confidence and legality must use text/icons/shapes in addition to colour. Players may reduce market detail, hide trend graphs, increase text scale and receive plain-language reason summaries.

## 37.4 Trust Rule

If a merchant refuses a sale or quote changes, the interface should explain the authoritative reason: stock reserved, quantity changed, merchant funds exhausted, currency refused, market closed, route information stale, etc. “Price changed” without cause should be treated as a UX defect when the cause is known.

# 38. Difficulty, Economy Assistance and World Settings

| Setting | Example Modes | Rule |
| --- | --- | --- |
| Market volatility | Low / Standard / High | Scales response profiles within 27B caps; never changes stock truth. |
| Merchant liquidity assist | Off / Standard / Generous | May increase authored operating cash/target budgets but must remain conserved/audited. |
| Information assistance | Discovery / Assisted / Broad | Controls how easily nearby/regional observations are surfaced, not actual market truth. |
| Reserve strictness | Relaxed / Standard / Harsh | Changes settlement/merchant protected stock targets through owning policies. |
| Restock convenience | Physical only / Assisted procurement | Assistance can auto-create valid procurement actions; never spawn goods. |
| Price detail | Simple / Standard / Expert | Presentation only. |
| Market impact | Reduced / Standard / Strong | Scales how much local trade contributes to pressure memory within bounded rules. |
| Peaceful/cosy economy | Enabled option | Threat-driven shocks reduced; production/building/trade still function. |

A relaxed setting may make merchants easier to use, but it should not silently reintroduce infinite restock or infinite funds. Convenience should come from faster procurement, broader stock targets, lower spreads or richer starting conditions that remain auditable.

# 39. Simulation LOD, Persistence and Multiplayer Authority

## 39.1 Simulation Tiers

| Tier | Market Representation |
| --- | --- |
| Near / Interactive | Exact inventories, merchant actor, live reservations, spot quotes and physical transfers. |
| Settlement Loaded | Exact/aggregate warehouse lots, active merchants, event-driven market state. |
| Regional Distant | Aggregated commodity lots, demand buckets, production/consumption rates, expected arrivals and bounded transaction batches. |
| Deep Inactive | Compact stock/reserve/flow summaries, major obligations/events and scheduled catch-up bounds. |

## 39.2 Distant Transaction Rule

Distant simulation may aggregate many small trades into one conserved flow transaction when exact identity is not gameplay-significant. It must debit source stock/purchasing capacity, credit destination stock/payment, preserve net ownership/resource quantity and record enough provenance to reconcile on promotion. Named/unique items do not collapse into anonymous commodity flow.

## 39.3 Catch-Up

Long absences process bounded periods/aggregate flows rather than millions of individual merchant decisions. If required stock or route capacity runs out during catch-up, the simulation stops/changes state at the first bounded failure rather than continuing with negative inventory.

## 39.4 Multiplayer Authority

- authoritative host/server owns market state version and reservations;

- server validates source stock, merchant funds and permissions;

- clients request quotes/orders and render observations;

- simultaneous buyers use atomic reservation/commit;

- player-to-player market influence counts only committed ownership-changing trades;

- shared organisation stock/funds require 27D/27J role permissions;

- market history/observations derive from authoritative events;

# 40. Set 25 Registry, Schema and Relationship Contracts

27C registers economic facets/records through the Set 25 canonical kernel. It does not add market fields directly to every item/NPC/building schema when a relationship/facet is more appropriate.

## 40.1 Definition Families

- `economy.market.definition.*`;

- `economy.market.scope_profile.*`;

- `economy.market.commodity_facet.*`;

- `economy.market.bucket.*`;

- `economy.market.pressure_profile.*`;

- `economy.market.memory_profile.*`;

- `economy.market.liquidity_profile.*`;

- `economy.merchant.policy.*`;

- `economy.merchant.stock_band_profile.*`;

- `economy.merchant.procurement_profile.*`;

- `economy.market.information_policy.*`;

- `economy.market.order_policy.*`;

## 40.2 Runtime Record Families

- MarketInstanceRecord;

- CommodityMarketState;

- MarketStockView;

- DemandIntentRecord;

- SupplyCapacityRecord;

- ExpectedArrivalRecord;

- MerchantMarketState;

- ProcurementIntentRecord;

- SpotOfferRecord;

- MarketOrderRecord;

- MarketMemoryRecord;

- MarketObservationRecord;

- MarketPressureResult;

- MarketShockState;

## 40.3 Relationships

- `participates_in_market`;

- `supports_commodity_bucket`;

- `substitutes_for`;

- `requires_market_capability`;

- `sources_stock_from`;

- `publishes_market_observation`;

- `expects_arrival_from`;

- `procures_via`;

- `protected_by_reserve_policy`;

- `market_anchor_of`;

## 40.4 Field Ownership

27C references but never copy-authors item quantity, item condition, recipe input/output, settlement need, NPC personality, route ETA, tax rate, currency ratio, contract obligation or social trust. Validators should reject duplicate authoritative fields where Set 25 ownership rules would become ambiguous.

# 41. Godot/Summer Engine Technical Direction

## 41.1 Suggested Runtime Services

- `MarketContextService` - resolves market scope/participants/activation;

- `MarketStockService` - builds authoritative stock views/reserve availability;

- `EconomicDemandService` - receives/deduplicates demand intents;

- `MarketPressureService` - calculates bounded pressure/reasons;

- `MerchantPolicyService` - resolves buy/sell/procurement policy;

- `MarketOrderService` - manages spot offers/orders/reservations;

- `MarketMemoryService` - rolling summaries/observations;

- `MarketInformationService` - observer-specific freshness/confidence views;

- `MarketReconciliationService` - near/far promotion/demotion checks;

- `MarketDiagnosticsService` - debug overlays, conservation and reason traces;

## 41.2 Command/Event Pattern

Candidate commands include `RequestMarketQuote`, `CreateSpotOffer`, `CancelSpotOffer`, `SubmitMarketOrder`, `ReserveMarketStock`, `CommitMarketTrade`, `PublishProcurementIntent`, and `RequestMarketObservation`. Commands express intent. Only after authoritative success are events such as `MarketTradeCommitted`, `StockAvailabilityChanged`, `DemandIntentChanged`, `ExpectedArrivalChanged`, `MarketPressureChanged`, `MerchantProcurementRaised`, or `MarketShockDeclared` emitted.

## 41.3 Incremental Recompute

Market recomputation should be dependency-driven. An iron stock transfer should invalidate relevant iron/tool/metal buckets in affected market contexts, not recompute every commodity in the world. Contexts maintain dirty keys, batched updates and version tokens.

## 41.4 Determinism

Pressure calculations, aggregation, rolling windows and distant catch-up use deterministic order/rounding. Stable IDs and derived seeds govern any tie-break selection. Never use wall-clock timing or unordered dictionary iteration to resolve authoritative market outcomes.

## 41.5 Summer Engine Boundary

Summer Engine may help generate market profiles, test fixtures, validator code and documentation. Generated changes remain reviewable source. Runtime merchant decisions and market state are deterministic game services, not calls to an external AI model.

# 42. Validation Invariants and Acceptance Scenarios

## 42.1 Hard Invariants

- sellable quantity never exceeds accessible owned quantity;

- reserved/protected/locked stock is never sold without an authorised release;

- expected arrivals never become current stock before delivery;

- merchant purchase never exceeds authorised funds/storage/quantity policy;

- restock never occurs solely because time/chunk reload passed;

- market pressure always lies in [-1,+1];

- every non-zero pressure has at least one valid reason contribution;

- demand root requirements are not double-counted;

- self/internal transfers do not create artificial turnover where ownership/economic exchange did not change;

- distant aggregate flows conserve quantity/value/ownership and reconcile on load;

- stale observations never overwrite current market truth;

- 27B alone creates final executable price/quote arithmetic;

## 42.2 Scenario A - Village Grain Shortage

A settlement has 200 grain, but 150 are protected for provisions and 30 reserved for a bakery. Only 20 are sellable. Household/settlement demand exceeds confirmed production and the next caravan is uncertain. The market reports positive pressure with `low sellable stock`, `protected reserve` and `weak expected arrival`; the merchant refuses to sell below reserve. No stock is created.

## 42.3 Scenario B - Player Floods Iron Market

The player sells 400 iron ingots to a small town. The first trade commits against real merchant funds/storage. Stock rises above sell target; subsequent buy interest and price pressure decline. If the merchant runs out of funds or capacity, further sale is refused or redirected to another buyer/contract. Reloading the town does not reset demand.

## 42.4 Scenario C - Expected Caravan Delayed

A market expects 100 medicine with high confidence. Arrival relief reduces shortage pressure modestly. Set 30/27H reports breakdown and ETA uncertainty; expected-arrival confidence falls and shortage pressure increases before any physical stock changes. When the caravan arrives, destination inventory is credited and the expected-arrival record closes.

## 42.5 Scenario D - Automated Surplus

A player automation line produces planks into a settlement warehouse. Each committed output increases accessible stock. Local demand saturates, sell targets are exceeded and pressure becomes surplus. The machine continues only if its own output/storage rules allow; the market does not delete excess planks. Regional export becomes attractive.

## 42.6 Scenario E - Distant Market Catch-Up

A town remains unloaded for 20 in-game days. The distant economy batches production, consumption and trades. Halfway through, a route closes; expected imports cease and stock reaches reserve floor. Catch-up stops exporting at that point. When loaded, warehouse lots, merchant stock, market memory and shortages reconcile without negative or duplicated items.

## 42.7 Scenario F - Simultaneous Multiplayer Purchase

Two players attempt to buy the final 10 available mana shards. The server issues quotes against the same state version but only the first reservation/commit succeeds for the quantity. The second request requotes or fails with `stock changed`; neither receives duplicated shards.

## 42.8 Scenario G - Rumour vs Truth

Set 28 supplies a rumour that salt prices are rising at a port. The player's observation record stores low confidence and age. Actual 27C market state remains unchanged. When the player reaches the port, direct observation supersedes the rumour without retroactively altering prior market history.

## 42.9 Scenario H - Maritime Blockade

26K reports blockade/access loss and cancelled expected cargo. 27C lowers arrival confidence and accessible imported supply, raises shortage pressure with blockade reasons, and 27B widens/adjusts prices only within valid crisis profiles. No Set 26 ownership of cargo/vessels is transferred.

# 43. Production Classification and Rollout Guidance

Final production classification belongs to Set 25 integration, but 27C recommends the following.

| Capability | Recommendation | Reason |
| --- | --- | --- |
| Physical merchant stock and no timer restock | Core | Required for world-truth economy. |
| Sellable/protected/reserved stock separation | Core | Prevents village self-sabotage and duplication. |
| Local market contexts | Core | Required for regional scarcity. |
| Demand intents from settlement/projects/production | Core | Makes prices/opportunities systemic. |
| Bounded market-pressure signal | Core | Required by 27B contextual pricing. |
| Merchant target-stock/buy-sell policy | Core | Prevents infinite vending-machine behaviour. |
| Purchasing-capacity limits | Core | Prevents infinite merchant demand/money. |
| Expected arrival confidence | Core/Early Access | Important for route economy; can start simple. |
| Market memory/trends | Core/Early Access | Useful for readability/damping; initial windows can be small. |
| Regional distant market summaries | Core architecture, staged content | Needed for scalable world, can grow with settlement count. |
| Advanced standing orders | Early Access | Useful but not required for first market loop. |
| Auctions/specialist exchanges | Later/Optional | Adds complexity with limited core value. |
| Full sophisticated cross-elasticity model | Later/Optional | Simple typed substitutes are sufficient initially. |

## 43.1 Recommended First Playable Market Slice

1. one settlement market context.

2. one general merchant plus one producer seller.

3. grain/food, timber, iron and basic mana commodity buckets.

4. real stock/reserve derivation.

5. settlement/project demand intents.

6. simple expected delivery record.

7. market pressure to 27B quotes.

8. player buy/sell affecting stock and subsequent interest.

9. no-restock persistence across save/load.

10. plain-language shortage/surplus UI reasons.

# 44. Risks, Redesign Triggers and Scope Controls

| Risk | Consequence | Control / Redesign Trigger |
| --- | --- | --- |
| Merchants feel empty too often | Players cannot access basics. | Tune bootstrap stock, local production, procurement assistance and reserve targets; do not restore infinite timer stock. |
| Markets feel globally identical | Trade routes lack purpose. | Ensure context scope, production, culture, routes and demand differ by region. |
| Prices oscillate after every transaction | Economy feels random. | Use bounded pressure, market memory, volume/liquidity weighting and 27B volatility caps. |
| Market barely reacts | Trade opportunities feel fake. | Increase stock/flow sensitivity for relevant commodities; verify demand intents actually connect. |
| Player can bankrupt every merchant trivially | Selling becomes frustrating/exploitable. | Use multiple buyers, procurement contracts, wholesalers, settlement/public buyers and transparent purchasing capacity. |
| Protected reserves hide too much stock | Player perceives cheating. | Expose reserve reason and policy; allow gameplay routes to negotiate/policy-change where owned elsewhere. |
| Distant simulation creates ghost goods | Breaks core promise. | Conservation ledgers, aggregate-lot limits and promotion reconciliation gates. |
| Demand double counts | Artificial scarcity/inflation. | Root requirement IDs, reservations and dedup validators. |
| Self-trading manipulates market | Exploit. | Credible-volume rules and related-party/self-transfer filtering. |
| Expected arrivals suppress shortage forever | Market ignores failed logistics. | ETA relevance and confidence decay; route-state invalidation events. |
| Too many commodity buckets | Data/performance bloat. | Set 25 completeness checks; aggregate by gameplay-relevant capability. |
| Too few buckets | Different goods become identical. | Non-fungible/exact-only rules and category-specific facets. |
| Merchant AI becomes life-sim duplicate | Ownership conflict with 07/28/27D. | Keep 27C to economic policy/intents; consume identity/social/business state. |
| Economy becomes spreadsheet game | Casual players disengage. | Simple default merchant view, automation and optional expert panels. |

# 45. Open Decisions for 27D-27J

1. Exact household consumption/income aggregation and affordability behaviour - 27D.

2. Exact enterprise operating accounts, profit/loss, rent/property rights and closure - 27D.

3. Whether merchants are individual proprietors, enterprise employees or mixed by default - 27D.

4. Persistent procurement order conversion into contract, deposits and breach terms - 27E.

5. Credit-backed merchant purchasing capacity and overdraft/working-capital rules - 27F.

6. Public procurement buyer budgets, emergency reserve release and subsidy policy - 27G.

7. Final caravan import/export planning, route selection and route-profitability loop - 27H.

8. Regional merchant network strategy and cross-realm commerce - 27H.

9. Market concentration/monopoly thresholds and anti-competitive policy - 27I.

10. Black-market market-context discovery, liquidity and price premiums - 27I.

11. Final market UI screens, organisation permissions, save migration and diagnostics packaging - 27J.

12. Final Core/Early Access/Full Release classification and content-pack dependencies - Set 25 integration.

# 46. Cross-Set Interface Amendments

The governing Sets 27-30 Cross-Set Interface Register v1.0 plus 27A amendments and 27B Amendment 27B-IFACE-005 remain active. 27C proposes the following clarifications for final integration review.

## Amendment 27C-IFACE-006 - Transport Expected-Arrival Result

**Reason:** 27C needs future supply confidence without owning movement.

**Set 30 / Set 26 / 27H supplies:** shipment/caravan/vessel reference, expected quantity, ETA window, accessibility/readiness state, delay/loss outcome and confidence inputs.

**27C supplies:** economic expected-arrival record, market relief contribution, stock/demand consequence and observation state.

**Constraint:** Expected arrival never becomes physical destination stock before transport owner reports authoritative delivery.

**Ownership transfer:** None.

## Amendment 27C-IFACE-007 - Social Market Information Provenance

**Reason:** Market rumours require a shared truth/freshness boundary.

**Set 28 supplies:** speaker/source, claim text/semantic payload, truthful/lying/mistaken/unknown social provenance where known to the simulation.

**27C supplies:** actual market observation comparison, timestamp, economic staleness, coverage and confidence for the observer.

**Constraint:** A rumour cannot mutate actual market state.

**Ownership transfer:** None.

## Amendment 27C-IFACE-008 - Survival/Household Demand Intent

**Reason:** Set 29 and 27D will generate consumption requirements that 27C must aggregate without redefining survival.

**Set 29/27D supplies:** requirement ID, commodity/capability, quantity/horizon, urgency, valid substitutes and fulfilled/internal-supply amounts.

**27C supplies:** residual market demand, affordability/purchasing interpretation, shortage pressure and procurement opportunity.

**Ownership transfer:** None.

# Appendix A. Market and Merchant Record Templates

## A.1 MarketInstanceRecord

| Field | Meaning |
| --- | --- |
| market_instance_id | Unique runtime ID |
| definition_id | Market definition |
| scope_type | Local/specialist/settlement/regional/etc. |
| anchor_refs | Settlement/facility/region/route anchors |
| participant_query_or_refs | Valid participants |
| commodity_bucket_refs | Supported commodity markets |
| jurisdiction_refs | Legal/tax/access context |
| memory_profile_id | Rolling history policy |
| information_policy_id | Observation/publication rules |
| state_version | Concurrency/version |
| active_state | active/degraded/suspended/archived |
| last_update_at | World timestamp |
| dirty_bucket_keys | Incremental recompute set |

## A.2 CommodityMarketState

| Field | Meaning |
| --- | --- |
| market_instance_id | Owning market context |
| commodity_bucket_id | Economic aggregation bucket |
| sellable_qty | Current sellable quantity |
| protected_qty | Protected reserve quantity visible to aggregation policy |
| reserved_qty | Committed quantity |
| target_qty | Target/coverage baseline |
| demand_qty_horizon | Residual demand over horizon |
| supply_rate | Credible confirmed supply rate |
| demand_rate | Residual demand rate |
| expected_arrivals | Confidence-weighted inbound summary |
| substitute_relief | Compatible alternative supply pressure |
| liquidity_band | thin/limited/normal/deep or data profile |
| turnover_window | Authoritative recent volume |
| market_pressure_signal | [-1,+1] output |
| pressure_confidence | Evidence quality |
| reason_codes | Top supply/demand reasons |
| crisis_state | Optional declared state |
| last_updated | World timestamp |

## A.3 MerchantMarketState

| Field | Meaning |
| --- | --- |
| merchant_or_enterprise_ref | Economic participant |
| policy_id | Merchant economic policy |
| market_context_refs | Markets participated in |
| stock_source_refs | Authoritative storage/inventory sources |
| purchasing_capacity_ref | Funds/account/budget source |
| stock_band_state | Per commodity target/reserve/capacity state |
| active_buy_interests | Current interests |
| active_sell_interests | Current sellable interests |
| procurement_intents | Replenishment desires |
| service_capacity | Handling/interaction limit |
| economic_risk_state | Policy-level risk/operational status |
| last_policy_eval | World timestamp |

## A.4 DemandIntentRecord

| Field | Meaning |
| --- | --- |
| demand_intent_id | Unique runtime ID |
| root_requirement_id | Deduplication root |
| source_ref | Owning source |
| market_scope_hint | Eligible market context |
| subject_ref | Exact commodity/capability |
| quantity_required | Residual requested quantity |
| horizon | Demand horizon |
| urgency | Urgency class/value |
| priority_class | Essential/operational/discretionary/strategic |
| substitute_set_id | Valid substitutes |
| internal_supply_qty | Expected self-supply |
| reserved_qty | Already secured quantity |
| budget_ref | Optional affordability source |
| confidence | Forecast/requirement confidence |
| expires_at | Validity end |
| reason_codes | Why demand exists |

## A.5 ExpectedArrivalRecord

| Field | Meaning |
| --- | --- |
| arrival_id | Unique runtime ID |
| shipment_ref | Transport/voyage/contract reference |
| origin_ref | Origin market/storage |
| destination_ref | Destination market/storage |
| subject_ref | Commodity/item/lot |
| quantity_expected | Expected delivered quantity |
| eta_min/eta_max | ETA window |
| confidence | Current confidence |
| reservation_owner | If already allocated |
| route_state_hash | External-state version |
| status | planned/enroute/delayed/arrived/lost/cancelled |
| last_updated | World timestamp |

# Appendix B. Market-Pressure Formula and Balance Reference

## B.1 Recommended Component Normalisation

The following are balance-design shapes, not hard final constants. Each commodity pressure profile owns curve parameters and weights.

| Component | Suggested Normalisation |
| --- | --- |
| Stock coverage | Signed log ratio of target coverage to current credible stock, clamped [-1,+1]. |
| Flow balance | `(demand_rate - confirmed_supply_rate) / normal_turnover_rate`, clamped. |
| Reserve lock | Protected/accessible fraction mapped [0,+1]. |
| Disruption | Weighted valid disruption severity [0,+1]. |
| Arrival relief | Expected qty * confidence * ETA relevance / target horizon, clamped [0,1]. |
| Substitute relief | Usable substitute coverage * elasticity/compatibility, clamped [0,1]. |
| Surplus | Excess above sell/target/capacity bands mapped [-1,0]. |

## B.2 Example Balance-Draft Weights

A standard staple profile might weight stock coverage and flow balance most heavily, expected arrivals/substitutes moderately, and reserve/disruption as situational terms. A rare specialist good may rely more on stock and liquidity with weaker routine-flow smoothing. These values should be data-driven and verified through deterministic scenario tests rather than hard-coded in system logic.

## B.3 Pressure Confidence

A pressure result may include confidence based on how complete the source evidence is. Exact loaded stock and committed demand are high confidence; distant production forecasts and stale arrival notices are lower. Low confidence may damp market-memory influence and player-facing forecast certainty, but it must not overwrite exact current stock facts.

## B.4 Manipulation Damping

- ignore non-market/internal transfers for turnover;

- discount repeated self/related-party trades where appropriate;

- weight trade influence by market normal turnover/liquidity;

- cap single transaction contribution to memory/pressure;

- recompute from current physical stock after every committed trade;

- never let historical volume create current stock or demand;

# Appendix C. Merchant Policy Profile Library

The following are starter policy templates, not final named merchants. Values remain balance data.

| Profile ID | Type | Primary Categories | Policy Notes |
| --- | --- | --- | --- |
| merchant.general_retail | General Retail | Staples/basic goods | Moderate protected floors for essentials; buys below target; sells above reserve; standard liquidity. |
| merchant.producer_outlet | Producer Outlet | Own output + inputs | High sell interest in surplus output; strong buy interest in feedstock; narrow category set. |
| merchant.specialist | Specialist Dealer | Rare/technical goods | Low turnover, strict quality/appraisal, wider spread profile, selective procurement. |
| merchant.wholesale | Wholesaler | Bulk commodity lots | Large storage, lower unit spread, high route dependence, larger minimum lots. |
| merchant.itinerant | Itinerant Trader | Portable mixed stock | Small capacity, strong route/arrival dependence, limited reserve, high information value. |
| merchant.procurement | Procurement Buyer | Specific required goods | Buys up to funded requirement; may create 27E order when spot supply insufficient. |
| merchant.quartermaster | Quartermaster | Operational/public supply | Strong protected reserves and permission gates; budget/public policy from 27G. |
| merchant.port_factor | Port Factor | Cargo/wholesale | Port service/cargo dependency; expected maritime arrivals heavily influence policy. |
| merchant.exchange | Exchange Service | Currency | Uses 27B/27F liquidity and currency confidence; owns no commodity stock by default. |

# Appendix D. Economic Reason-Code Additions

| Code | Meaning |
| --- | --- |
| ECON_MARKET_INACTIVE | Required market/service endpoint is not active. |
| ECON_MARKET_ACCESS_DENIED | Counterparty lacks market access/permission. |
| ECON_STOCK_NOT_OWNED | Referenced stock is not owned by expected source. |
| ECON_STOCK_RESERVED | Quantity is reserved for another valid obligation. |
| ECON_STOCK_PROTECTED_RESERVE | Quantity is withheld by reserve policy. |
| ECON_STOCK_LOCKED | Quantity is not economically accessible. |
| ECON_STOCK_INSUFFICIENT_SELLABLE | Requested quantity exceeds sellable stock. |
| ECON_STOCK_CAPACITY_FULL | Buyer/storage cannot accept more stock. |
| ECON_EXPECTED_ARRIVAL_LOW_CONFIDENCE | Inbound supply exists but confidence is low. |
| ECON_EXPECTED_ARRIVAL_DELAYED | Arrival ETA was delayed. |
| ECON_EXPECTED_ARRIVAL_LOST | Expected shipment was lost/cancelled. |
| ECON_DEMAND_HIGH | Residual demand exceeds normal coverage. |
| ECON_DEMAND_CRITICAL | Essential/critical demand is strongly unmet. |
| ECON_DEMAND_DUPLICATE_ROOT | Demand intent duplicates an existing root requirement. |
| ECON_SUPPLY_SURPLUS | Sellable/credible supply exceeds target. |
| ECON_SUPPLY_PRODUCTION_OUTAGE | Expected production capacity is unavailable. |
| ECON_SUPPLY_ROUTE_DISRUPTION | Replenishment route/access is disrupted. |
| ECON_SUPPLY_SUBSTITUTE_AVAILABLE | Compatible substitute reduces pressure. |
| ECON_MARKET_THIN_LIQUIDITY | Market has low depth/turnover. |
| ECON_MERCHANT_NOT_BUYING | Merchant policy currently has no buy interest. |
| ECON_MERCHANT_NOT_SELLING | Merchant policy currently has no sell interest. |
| ECON_MERCHANT_FUNDS_LOW | Purchasing capacity is insufficient. |
| ECON_MERCHANT_TARGET_FILLED | Merchant target stock is already satisfied. |
| ECON_MERCHANT_PROCUREMENT_RAISED | Merchant raised a replenishment intent. |
| ECON_MARKET_INFO_STALE | Observed market information is stale. |
| ECON_MARKET_INFO_RUMOUR | Information source is rumour/unverified. |
| ECON_MARKET_CRISIS_ACTIVE | Valid crisis-state profile is active. |
| ECON_MARKET_SELF_TRADE_IGNORED | Transaction excluded from market-volume influence. |
| ECON_MARKET_RECONCILIATION_REQUIRED | Distant/local market state requires reconciliation. |
| ECON_MARKET_STATE_CHANGED | Market version changed before commit/requote required. |

# Appendix E. Validation and Deterministic Test Matrix

| Test ID | Test | Acceptance |
| --- | --- | --- |
| MKT-001 | Sellable stock conservation | 100 owned, 20 reserved, 30 protected -> <=50 sellable. |
| MKT-002 | No reload restock | Empty merchant remains empty after unload/reload without valid replenishment. |
| MKT-003 | Expected arrival not stock | Inbound 100 never appears in destination inventory before arrival commit. |
| MKT-004 | Demand dedup | Project demand + procurement child count only unresolved root quantity once. |
| MKT-005 | Pressure bound | All extreme inputs still produce [-1,+1]. |
| MKT-006 | Pressure explainability | Non-zero pressure emits at least one cause. |
| MKT-007 | Merchant funds | Buy cannot exceed authorised purchasing capacity. |
| MKT-008 | Merchant capacity | Merchant refuses/limits purchase when storage full. |
| MKT-009 | Player flood | Bulk sale lowers later buy interest and cannot be repeated infinitely. |
| MKT-010 | Self-trade filter | Internal/self trade does not inflate turnover/pressure. |
| MKT-011 | Arrival delay | Route delay changes confidence/pressure without changing stock. |
| MKT-012 | Substitute relief | Only compatible substitute demand reduces pressure. |
| MKT-013 | Protected reserve | Ordinary player purchase cannot consume protected floor. |
| MKT-014 | Distant catch-up | Aggregate trade conserves stock/value and stops at first insufficient supply/funds. |
| MKT-015 | Promotion reconciliation | Loaded inventories equal distant summary after promotion. |
| MKT-016 | Multiplayer race | Two buyers cannot both receive final stock. |
| MKT-017 | Stale info separation | Old observation does not overwrite actual current market state. |
| MKT-018 | Blockade chain | 26K access loss -> expected arrival/supply change -> 27C pressure -> 27B quote; no direct price mutation by 26K. |
| MKT-019 | Automation surplus | Committed production raises stock; uncommitted machine capacity does not. |
| MKT-020 | Save/load determinism | Same save/world time/input events reproduce same market state and pressure. |

# Appendix F. 27C Completion Checklist

- [x] Adopted 27A, 27B and Sets 27-30 ownership contracts.

- [x] Defined local/regional market scope without a global market oracle.

- [x] Defined authoritative stock/sellable/protected/reserved separation.

- [x] Locked no hidden timer restock.

- [x] Defined expected arrivals as confidence-weighted information, not stock.

- [x] Defined demand intents and root-requirement deduplication.

- [x] Defined bounded explainable market-pressure output required by 27B.

- [x] Defined liquidity/turnover/depth and anti-manipulation treatment.

- [x] Defined substitution and non-fungible boundaries.

- [x] Defined market memory and observer-specific information.

- [x] Defined merchant economic policy, stock bands and buy/sell refusal.

- [x] Defined merchant purchasing-capacity constraints.

- [x] Defined procurement/replenishment channels and 27E boundary.

- [x] Defined spot offers/orders without absorbing persistent contracts.

- [x] Integrated settlement/projects/production/automation.

- [x] Integrated terrestrial/maritime expected-arrival interfaces.

- [x] Preserved Set 28 social and Set 29 survival ownership.

- [x] Defined UI view-model requirements and accessibility.

- [x] Defined simulation LOD, multiplayer authority and reconciliation.

- [x] Defined Set 25 schemas/relationships and Godot service boundaries.

- [x] Added deterministic validation matrix and reason codes.

- [x] Recorded new cross-set interface amendments.

- [x] Handed off labour/household/business economics to 27D.
