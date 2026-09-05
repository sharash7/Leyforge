# FANTASY VOXEL CIVILISATION SANDBOX

## DOCUMENT SET 27

# 27I - Monopolies, Embargoes, Smuggling, Black Markets and Economic Conflict

**Version 0.1 - Detailed Economic Design Bible and Restricted-Exchange Architecture Draft**

*A data-driven economic-conflict system for market power, monopolies, concessions, cartels, embargoes, sanctions, controlled goods, rationing, smuggling economics, black markets, fencing, illicit liquidity, strategic-resource denial, blockade effects, evasion pressure, recovery and persistent civilisation-scale economic consequences in Leyforge.*

> **Restricted Economy and Economic Conflict System Statement**
>
> Leyforge's restricted and illicit economy must emerge from real economic pressure rather than from a second shop list labelled "illegal." A monopoly exists because one actor or coalition controls meaningful supply, access, infrastructure, rights or distribution. An embargo matters because lawful routes, contracts, finance or market access are actually constrained. A black market appears when restricted demand remains strong enough, willing suppliers and intermediaries exist, risk raises costs, and some route or exchange channel remains possible. Smuggling may bypass a lawful restriction economically, but it does not teleport goods or decide whether guards, customs officers, patrols, vehicles or vessels succeed physically. Economic conflict should create shortages, substitutions, bargaining power, political pressure, illicit opportunity and recovery gameplay without allowing invisible goods, automatic corruption, infinite scarcity pricing or unavoidable progression deadlocks.

| Field | Locked Direction |
| --- | --- |
| Document Set | This is Document 27I in Document Set 27: Economy, Markets, Contracts, Trade and Public Finance. |
| Primary Ownership | Market power, monopoly/concession economics, cartel economic coordination, exclusive-access effects, restricted-goods economic state, embargo/sanction economic application, black-market institutions, smuggling premiums and economic missions, fencing/liquidity, evasion pressure, strategic economic conflict and recovery. |
| Restriction Rule | A restriction changes what economic actions are lawful, authorised, financeable, insurable or openly marketable. It does not delete physical goods already in the world and does not by itself determine arrest, confiscation or combat. |
| Black-Market Rule | Black markets form only from valid restricted demand, willing supply, access/intermediation capability, risk-bearing capacity and an exchange channel. They never generate contraband stock from nothing. |
| Smuggling Rule | 27I owns the economic mission, concealment cost, premium, expected exposure and commercial outcome. Set 30/Set 26/realm owners execute physical transport. Justice/security systems determine inspection, detection, seizure and legal consequences. |
| Market-Power Rule | Market power is contextual and contestable. It may derive from stock share, production capacity, route control, exclusive rights, infrastructure, knowledge, finance, network effects or strategic resources; no actor receives monopoly power solely from a label. |
| Price Rule | 27B remains authoritative for value and executable price formation. 27I supplies scarcity, restriction, market-power, risk and illicit-liquidity modifiers within bounded interfaces. |
| Market Rule | 27C remains authoritative for stock, demand, merchant policy, liquidity and ordinary market pressure. 27I adds restricted/illicit market contexts and market-power signals without duplicating stock truth. |
| Enterprise Rule | 27D owns enterprises, ownership, labour, sites and operating accounts. 27I may classify economic concentration, exclusive rights, cartel membership and illicit market roles attached to those actors. |
| Contract Rule | 27E owns general contracts and obligations. 27I defines whether a contract is restricted, sanctioned, covert or economically exposed, and consumes 27E breach/performance truth. |
| Finance Rule | 27F owns accounts, loans, insurance and financial instruments. 27I may restrict access, create illicit-finance demand signals and expose suspicious/evasion economic events, but does not define detailed laundering procedures. |
| Fiscal Rule | 27G owns tariffs, customs, taxes, permits and treasury policy. 27I owns evasion pressure, contraband economics, sanction/embargo market effects and illicit alternatives without redefining assessment or lawful collection. |
| Trade Rule | 27H owns universal route, shipment and regional-exchange economics. 27I adds restricted-route access, embargo state, covert shipment economic missions, illicit premiums and conflict/recovery overlays. |
| Social Boundary | Set 28 owns trust, secrecy relationships, persuasion, intimidation, loyalty, betrayal and social willingness. 27I consumes those outcomes as access/willingness/risk inputs. |
| Survival Boundary | Set 29 owns hunger, health, illness, treatment and survival effects. 27I may convert shortages into economic demand/relief pressure but never defines biological harm. |
| Movement Boundary | Set 30 owns terrestrial movement, vehicle/mount capacity, route traversal and physical interception outcomes. |
| Maritime Boundary | Set 26 owns vessels, piracy/naval patrols, blockades as physical maritime operations, ports and voyage outcomes. 27I owns their economic restriction, scarcity and illicit-trade consequences. |
| Legal/Justice Boundary | Existing governance, faction, law, crime, security and combat systems own legality, warrants, inspection authority, arrest, seizure, punishment, court outcome and violence. 27I records economic exposure and resulting losses/claims only after authoritative outcomes. |
| Cross-Set Contract | The Leyforge Document Sets 27-30 Cross-Set Interface Register v1.0 remains governing. New required interfaces are recorded in Section 61. |
| Engine Direction | Godot runtime with Summer Engine-assisted development under Set 25 governance. Restricted-economy state is deterministic, persistent, auditable, event-driven and simulation-LOD aware. |
| Next Deliverable | 27J - Economy UI, Simulation LOD, Multiplayer, Registries and Integration. |

# Document Purpose

Document 27I defines the economic systems that appear when access to goods, markets, routes, labour, finance, territory or strategic resources becomes concentrated, restricted or intentionally contested. Documents 27B-27H already establish value, prices, markets, merchants, enterprises, contracts, finance, public policy, tariffs, trade routes, shipments and regional exchange. Those systems explain ordinary commerce. 27I explains what happens when actors deliberately control, restrict, bypass or weaponise that commerce.

The document supports both lawful and unlawful play without making either a detached minigame. A guild may receive an exclusive mining concession and become a regional monopoly. A ruler may embargo a hostile faction. A war may close a bridge or sea lane and make medicine scarce. Merchants may reroute through neutral territory. A settlement may ration strategic stock. A player may discover that a banned magical reagent still has strong underground demand. A smuggling enterprise may pay more for transport because risk, secrecy and weak liquidity raise costs. A black-market trader may refuse a huge sale because they lack funds, buyers or safe storage. A rival monopoly may be broken by opening a new mine, building another road, importing substitutes, financing competitors, negotiating access or changing policy.

27I therefore treats economic conflict as **state applied to the real economy**, not as scripted price multipliers. Goods remain physical. Ownership remains authoritative. Routes remain spatial. Restrictions have jurisdiction and scope. Market power has measurable sources. Illicit exchange still needs stock, counterparties and delivery. Enforcement outcomes come from their owners. Recovery happens because production, infrastructure, policy, confidence, supply and alternatives change over time.

The system must also preserve player freedom. Economic conflict can create profitable specialist play for merchants, rulers, smugglers, privateers, guild leaders, industrialists and diplomats, but ordinary players should not be forced into forensic accounting. Default UI should explain the visible consequence: "iron is expensive because the east road is embargoed and the local forge guild controls most remaining supply." Advanced views may expose concentration, route dependency, sanction coverage, illicit liquidity and recovery forecasts.

# Design Sources, Authority and Supersession

| Source | Existing Direction | 27I Use / Boundary |
| --- | --- | --- |
| 00 - Master Game Design Bible | Player may help, ignore, exploit or conquer settlements; trade, war and world consequence are core. | Economic conflict supports multiple moral/political playstyles without assuming heroism. |
| 01 - Core Gameplay Loop | Explore, gather, craft, build, interact, automate, defend, upgrade, expand. | Economic conflict creates alternate goals: substitute, reroute, negotiate, outproduce, protect, evade, recover. |
| 02 - Player Progression | Trade, leadership, diplomacy, exploration and engineering are valid paths. | Players can gain better information/access/efficiency without hard-locking economic conflict behind level alone. |
| 04 - Items Registry | Trade goods, strategic resources, contraband tags, ownership and provenance exist on real items. | Restricted/illicit markets reference real item lots and preserve provenance. |
| 05 - Crafting and Recipe Registry | Production consumes real resources; culture/forbidden recipes may exist. | Restrictions can change access to inputs/outputs but never create recipe output abstractly. |
| 06 - Resource Progression | Strategic, culture, forbidden and dimension resources have distinct long-term roles. | Strategic-resource concentration and substitution are meaningful sources of conflict. |
| 07 - NPC Village System | Settlements have needs, warehouses, jobs, reputation, raids and persistent consequences. | Supplies local demand, reserve state and actors; 27I adds economic restriction/black-market consequences only. |
| 08 - Automation System | Production and logistics are physical and resource-conserving. | Industrial concentration can affect market power; sabotage/execution remains outside 27I. |
| 11 - Biomes and World Generation | Resources, roads, regions and territorial geography vary by seed. | Geographic chokepoints may create market power, but Set 25 fallback rules prevent required progression deadlocks. |
| 13 - Races, Peoples, Cultures and Factions | Factions own laws, diplomacy, territories, treaties and policies. | Supplies the authority and relationship context for embargoes, licences and sanctions; 27I executes economic effects. |
| 14 - Dimensions | Realms have resources, access rules, societies and routes. | Realm restrictions and contraband can exist; realm traversal remains external. |
| 15 - Quest and Event System | Political conflict, trade disruption, espionage and crises can generate quests/events. | 27I exposes economic conditions and outcomes for quest/event presentation. |
| 16 - Combat, Gear and Defence | Raids, escorts, capture and conflict have persistent aftermath. | Physical blockade/interception/combat outcomes are consumed as economic loss/access signals. |
| 17 - UI/UX System | Trade, crime, faction and risk information require world-first progressive disclosure. | 27I defines the economic facts/reasons UI must expose. |
| 19/20 - Settlement and Building Systems | Markets, warehouses, roads, ports, workshops and public services have functional requirements. | Exclusive facilities or constrained infrastructure may create market power only when actually operational. |
| Set 25 | Stable IDs, schema ownership, capabilities, relationships, validation, content packs and migrations. | Governs all 27I definitions/instances and prevents ad-hoc duplicate registries. |
| Set 26 | Ports, fleets, maritime trade, piracy, coast guards, navies, boarding and naval route disruption. | Supplies maritime restriction/interception truth; 27I owns universal economic consequences. |
| 27A | Physical economy, local markets, restricted/illicit economy boundary and cross-set ownership. | 27I completes the specialist restricted-economy scope promised in 27A. |
| 27B | Reference value, contextual value, price formation, currency, exchange and bounded modifiers. | 27I emits scarcity, market-power and illicit-risk factors; 27B calculates prices. |
| 27C | Market stock, supply/demand, merchant behaviour, liquidity and expected arrivals. | 27I adds market concentration, restricted access and black-market contexts while reusing 27C stock truth. |
| 27D | Labour, enterprises, ownership, property rights and operating accounts. | Supplies firms/owners/capacity; 27I adds market-power and illicit-role relationships. |
| 27E | Contracts, orders, obligations, delivery, breach and economic remedies. | Restricted/exclusive/covert agreements reuse 27E contracts; 27I adds policy/conflict classification. |
| 27F | Credit, banking, collateral, insurance, claims and financial risk. | Restrictions can affect finance/insurance access; 27I consumes financial capacity without redefining it. |
| 27G | Taxes, tariffs, customs, permits, treasuries, public policy and fiscal authority. | Supplies lawful restriction instruments and assessments; 27I models evasion/black-market economic response. |
| 27H | Routes, shipments, caravans, regional exchange and cross-realm commerce. | Supplies lawful spatial commerce; 27I overlays embargoes, restricted routing, covert commerce and economic conflict. |
| Cross-Set Interface Register v1.0 | Set 27 owns economics; Sets 28-30 own social, survival and movement mechanics. | Remains binding throughout 27I. |

Where an older source uses Unreal-specific implementation assumptions, the current Godot/Summer Engine direction and later revised source authority prevail. 27I does not transfer ownership of law, diplomacy, movement, combat, maritime systems, social AI or survival merely because those systems can create economic pressure.

# Static Table of Contents

1. Locked Restricted-Economy Identity  
2. Locked Decision Summary  
3. Scope and Explicit Non-Goals  
4. Canonical Terminology  
5. Source-of-Truth and Ownership Boundaries  
6. Restricted-Economy Architecture  
7. Restriction Definitions, Jurisdictions and Coverage  
8. Controlled, Licensed, Rationed, Restricted and Prohibited Goods  
9. Strategic Goods and Economic-Security Classification  
10. Market Access, Trading Rights and Participation Restrictions  
11. Monopoly and Market-Power Identity  
12. Market-Power Measurement and Concentration Signals  
13. Sources of Market Power  
14. Natural, Infrastructure and Network Monopolies  
15. Exclusive Rights, Concessions, Charters and Franchises  
16. Dominant Firms, Guilds and Public Monopolies  
17. Cartels, Pools and Coordinated Market Behaviour  
18. Exclusive Dealing, Tying, Refusal and Discriminatory Access  
19. Predatory, Scarcity and Exploitative Pricing Boundary  
20. Market-Power Effects on 27B/27C Pricing and Liquidity  
21. Contestability, Entry, Substitution and Monopoly Erosion  
22. Embargo Identity and Policy Application  
23. Sanctions, Denial Lists and Restricted Counterparties  
24. Import, Export, Transit and Service Restrictions  
25. Asset, Finance and Insurance Restrictions  
26. Tariff Escalation, Quotas, Rationing and Economic Controls  
27. Blockades, Closures and Physical-Conflict Handoffs  
28. Economic Warfare and Strategic Resource Denial  
29. Boycotts, Refusal Campaigns and Voluntary Economic Pressure  
30. Shortages, Substitution and Secondary Market Effects  
31. Black-Market Identity and Formation Conditions  
32. Underground Market Contexts, Venues and Networks  
33. Illicit Supply, Demand and Liquidity  
34. Black-Market Pricing and Risk Premiums  
35. Fences, Brokers, Fixers and Intermediaries  
36. Contraband Provenance, Custody and Resale  
37. Smuggling Economic Mission Architecture  
38. Covert Route Choice and Set 30/26 Handoff  
39. Concealment, Secrecy and Handling Cost Abstraction  
40. Evasion of Tariffs, Customs, Licences and Embargoes  
41. Bribes, Facilitation Payments and Social/Legal Boundary  
42. Detection, Inspection, Seizure and Enforcement Handoff  
43. Economic Loss, Forfeiture and Claim Consequences  
44. Illicit Finance Boundary and 27F Integration  
45. Fraud, Counterfeit and Misrepresentation Economic Interfaces  
46. Information, Rumours, Secrecy and Market Intelligence  
47. Reputation, Trust, Loyalty and Set 28 Boundary  
48. Survival Shortages, Relief and Set 29 Boundary  
49. Terrestrial Movement, Caravans and Set 30 Boundary  
50. Maritime Piracy, Blockades and Set 26 Integration  
51. Faction, Settlement and Public-Finance Consequences  
52. Player Economic-Conflict Roles and Playstyles  
53. NPC/Faction Economic-Conflict Decision Model  
54. Quests, Events and Persistent Economic History  
55. Crisis Escalation, De-escalation and Recovery  
56. UI/UX, Explainability and Accessibility  
57. Difficulty, World Settings and Assistance  
58. Simulation LOD, Persistence and Reconciliation  
59. Multiplayer Authority, Permissions and Anti-Exploit Rules  
60. Set 25 Schemas, Godot Architecture, Validation and Production Risks  
61. Cross-Set Interface Amendments  
- Appendix A. Restriction and Sanction Definition Template  
- Appendix B. Market-Power and Concentration Profile Template  
- Appendix C. Black-Market Context Template  
- Appendix D. Smuggling Economic Mission Template  
- Appendix E. Economic-Conflict Event Template  
- Appendix F. Initial Reason-Code Catalogue  
- Appendix G. Cross-System Interface Matrix  
- Appendix H. 27I Completion Checklist

# 1. Locked Restricted-Economy Identity

The Restricted Economy and Economic Conflict System is the **pressure, concentration and circumvention layer** of Leyforge's economy. It explains how ordinary markets change when access is controlled or contested and how alternative exchange emerges when lawful commerce cannot satisfy persistent demand.

> **Locked Rule**
>
> No monopoly, embargo, black market or smuggling system may create goods, demand, authority, detection or physical movement from a label alone. Every effect must resolve from authoritative stock, actors, rights, restrictions, routes, risk signals and outcomes owned by the appropriate systems.

## 1.1 Player-Facing Promise

A player should be able to understand:

- why one guild can influence iron prices more than another;
- whether that power comes from mines, workshops, route access, finance, exclusive rights or temporary scarcity;
- why a sanctioned faction can still possess old stock even though lawful new trade is blocked;
- why an embargo raises prices in some settlements but barely matters in others;
- why substitutes become more valuable during a shortage;
- why an underground market appeared;
- why black-market prices are high even when contraband is technically available;
- why a smuggling run cannot depart despite strong profit potential;
- why a fence refuses a rare item despite its high theoretical value;
- what economic loss followed an authoritative seizure or failed delivery;
- how opening a new mine, route, port, workshop or trade treaty can weaken a monopoly;
- how an economy recovers after conflict rather than remaining permanently broken.

## 1.2 Identity Layers

| Layer | Meaning | Example |
| --- | --- | --- |
| Restriction Definition | Authoritative economic rule applied by a valid authority/context. | Export ban on mana crystals to hostile faction. |
| Restriction Coverage | Resolved applicability to actor, good, route, service or transaction. | Transit allowed; final sale prohibited. |
| Market-Power Profile | Contextual concentration/contestability summary. | Forge Guild controls 72% of local steel supply and only furnace access. |
| Exclusive Right | Recognised economic privilege from another authority. | Royal salt concession. |
| Embargo State | Active cross-party restriction on specified commerce. | No lawful grain exports to Ash Marches. |
| Sanction State | Targeted restriction on actors, organisations, assets, finance or services. | Guild treasury denied banking services. |
| Black-Market Context | Alternative market for restricted/illicit exchange. | Underground reagent market in capital district. |
| Illicit Liquidity | Ability to find counterparties and settle covert exchange. | Low liquidity for forbidden relics. |
| Smuggling Economic Mission | Commercial plan to move restricted goods while accepting evasion exposure. | Move medicine across embargoed border. |
| Evasion Exposure | Economic risk/cost state consumed from legal/security/transport signals. | High inspection pressure, medium route uncertainty. |
| Economic-Conflict State | Persistent record of deliberate market/route/resource pressure. | Rival faction sanctions plus bridge closure. |
| Recovery State | Measured restoration of access, stock, capacity, confidence and alternatives. | Post-war grain corridor reopening. |

# 2. Locked Decision Summary

| Area | Locked Decision |
| --- | --- |
| Core Model | Restrictions and economic conflict are overlays on the normal economy. They change permitted access, risk, cost, availability and behaviour without replacing stock/price/route truth. |
| Monopoly | Monopoly is contextual market power, not a permanent global tag. A firm can dominate one good in one region while having little power elsewhere. |
| Concentration | Use explainable share, capacity, access and contestability indicators rather than one opaque monopoly score. |
| Natural Monopoly | Allowed where infrastructure/capability has high fixed cost or singular geography, but power remains challengeable through substitutes, new infrastructure, policy or technology where plausible. |
| Concessions | Exclusive rights may be lawful and temporary/permanent according to owning governance systems. 27I models economic effects only. |
| Cartels | Coordinated enterprises may share quotas, prices, territories or procurement policies through economic coordination records. Social conspiracy and criminal determination remain external. |
| Price Abuse | 27I emits market-power/scarcity/exclusivity signals. 27B determines price; policy/justice systems decide whether behaviour is illegal or merely unpopular. |
| Embargo | An embargo blocks or limits specified authorised commerce between scoped actors/jurisdictions. It does not erase inventories or automatically close every physical route. |
| Sanctions | May target goods, services, finance, insurance, contracts, actors, organisations or jurisdictions. Effects resolve through owned systems. |
| Quotas/Rationing | Supported as policy-constrained quantities and priority rules. Goods remain real and reservations remain authoritative. |
| Black Market | Forms only when restricted demand, willing supply, intermediary/access capability and settlement means exist. Liquidity may be poor. |
| Illicit Stock | Always references real stock, theft/ownership provenance or authorised economic state. No infinite "contraband inventory." |
| Smuggling | Economic mission uses 27H shipment principles plus restriction/evasion overlay. Physical movement and detection remain external. |
| Risk Premium | Illicit prices and wages may include expected loss, delay, secrecy, low liquidity, replacement cost and counterpart risk. Premiums are bounded and explainable. |
| Bribery | 27I may represent a proposed payment/value transfer and economic cost. Set 28/legal systems decide willingness, legitimacy, discovery and consequences. |
| Seizure | 27I never initiates seizure. When an authoritative owner reports seizure/confiscation, 27I posts economic loss, contract, insurance, stock and market consequences. |
| Counterfeit/Fraud | Economic value/confidence consequences may be modelled, but item authenticity, deception, crime and investigation mechanics remain with their owners. |
| Finance | Legitimate financial access can be restricted by sanctions. 27F owns accounts/instruments and reports denial/freeze/claim outcomes. No detailed laundering simulator in Core. |
| Economic Warfare | Supported through trade denial, procurement pressure, strategic stockpiling, route restriction, sanctions, subsidies, counter-sanctions and resource competition. Physical war remains external. |
| Recovery | Economic conflict should be reversible through supply restoration, alternatives, policy change, infrastructure, confidence, treaty, replacement capacity and time. |
| Seed Safety | No economic restriction may make a mandatory progression capability permanently unreachable without Set 25-approved fallback. |
| NPC Simulation | NPCs/factions use bounded policy/response heuristics. They do not optimise perfect global markets or coordinate omniscient cartels. |
| Multiplayer | Restrictions, illicit trades, cartel policies, smuggling missions and economic losses are server-authoritative, permissioned and auditable. |
| Accessibility | Players can reduce illicit/crime-adjacent depth or economic-conflict severity while preserving ordinary trade/progression. |

# 3. Scope and Explicit Non-Goals

## 3.1 In Scope

27I owns:

- market-power and concentration economic analysis;
- monopoly/dominance economic state;
- exclusive concessions/rights economic effects;
- cartel/pool economic coordination records;
- restricted-good and controlled-market economic classifications;
- embargo and sanction economic application;
- quotas, rationing and access restriction interfaces;
- black-market contexts and illicit liquidity;
- smuggling economic missions and risk/cost premiums;
- fencing/intermediation economic roles;
- evasion pressure and economic consequences;
- strategic-resource denial and economic warfare;
- boycott/refusal economic pressure;
- shortage/substitution/recovery economic states;
- distant simulation, persistence and reconciliation of those systems;
- Set 25 schema/validation proposals for those systems.

## 3.2 Explicit Non-Goals

27I does not own:

- laws, crimes, legal codes, warrants, courts, arrests, imprisonment or punishment;
- persuasion, trust, betrayal, intimidation, loyalty or secret-society relationships - Set 28/social owners;
- stealth movement, concealment animation, wagon hiding spots, route pathfinding or vehicle handling - Set 30;
- ship concealment, naval interception, piracy combat, boarding or coast-guard patrol behaviour - Set 26;
- combat, guard tactics, searches, raids or physical confiscation - combat/security/justice owners;
- hunger, illness, injury or medical consequences of shortages - Set 29;
- ordinary price formation - 27B;
- ordinary market stock/demand - 27C;
- enterprise ownership/payroll - 27D;
- general contract law - 27E;
- detailed banking/insurance - 27F;
- tariff/tax assessment - 27G;
- ordinary trade routes/shipments - 27H;
- a real-world organised-crime simulator;
- step-by-step real-world evasion, concealment or money-laundering procedures;
- infinite scarcity multipliers or unavoidable monopoly progression locks;
- omniscient enforcement or omniscient smugglers.

# 4. Canonical Terminology

| Term | Definition |
| --- | --- |
| Restriction | Rule or condition limiting an otherwise possible economic action. |
| Controlled Good | Good requiring permission, licence, quota, ration, age/status/capability or other authorised condition. |
| Restricted Good | Good whose trade/use is limited for specified actors, jurisdictions, routes or contexts. |
| Prohibited Good | Good whose defined transaction/use is disallowed by the relevant authority/context. |
| Strategic Good | Good important enough to security, survival, industry, magic or infrastructure that authorities/factions track access deliberately. |
| Market Power | Ability to influence price, availability, terms or access because alternatives are limited. |
| Concentration | Degree to which supply/capacity/access is controlled by a small number of actors. |
| Contestability | Practical ability of competitors, substitutes, imports or new infrastructure to challenge existing market power. |
| Monopoly | Context in which one actor has dominant effective control over a relevant market or capability. |
| Monopsony | Context in which one buyer has dominant effective purchasing power. |
| Concession | Authorised right to exploit/provide a resource/service within defined scope. |
| Exclusive Right | Permission reserving specified economic activity to one or more holders. |
| Cartel | Economic coordination among otherwise separate actors to influence price, quantity, territory, procurement or access. |
| Embargo | Policy preventing or limiting specified commerce with a jurisdiction/faction/actor. |
| Sanction | Targeted economic restriction applied to actors, assets, services, finance or transactions. |
| Quota | Maximum/minimum authorised quantity within a period or scope. |
| Ration | Allocation rule distributing limited goods among eligible consumers. |
| Black Market | Market context where restricted or prohibited exchange occurs outside ordinary authorised channels. |
| Illicit Liquidity | Ease of finding willing counterparties and settling underground trades. |
| Fence | Economic intermediary willing to purchase/resell goods with problematic ownership, legality or provenance, subject to other systems' authority. |
| Smuggling Mission | Economic shipment intended to bypass or avoid a valid restriction. |
| Evasion Exposure | Expected economic risk/cost arising from attempting restricted exchange. |
| Seizure Event | Authoritative external outcome removing custody/control under law/conflict; 27I consumes it, never invents it. |
| Economic Warfare | Deliberate use of economic access, supply, finance, infrastructure or policy to weaken or compel another actor. |
| Recovery | Restoration of stock, capacity, access, substitutes, confidence and normal market function after disruption. |

# 5. Source-of-Truth and Ownership Boundaries

The following state remains authoritative in its owning system:

| Truth | Owner | 27I Consumes / Adds |
| --- | --- | --- |
| Item quantity, owner, condition, provenance | Items/inventory/27C/27D | restriction/illicit classification and market consequence |
| Price and currency | 27B | market-power/restriction/risk modifiers |
| Market stock, demand, merchant liquidity | 27C | concentration, restricted availability, underground context |
| Enterprise assets/labour/ownership | 27D | dominance, cartel/exclusive-role relationships |
| Contract obligations | 27E | restriction/covert/sanction classification |
| Accounts, loans, insurance | 27F | access restriction/suspicious-event hooks |
| Taxes, tariffs, customs, permits | 27G | evasion/black-market response |
| Routes, shipments, expected arrivals | 27H | restricted/covert overlay and illicit mission |
| Law, treaty, diplomacy | 13/governance/justice | authority/coverage decision |
| Social trust/willingness | Set 28 | access/partner willingness/risk input |
| Survival state | Set 29 | shortage demand/relief economic signal |
| Land traversal | Set 30 | capacity, travel, checkpoint/delay outcome |
| Maritime execution | Set 26 | port/voyage/blockade/interception outcome |
| Combat/security outcome | 16/justice/security | loss, delay, seizure, closure evidence |

**No duplicate truth rule:** 27I may cache derived summaries for performance, but it may not maintain a second inventory, second account balance, second route graph or second legal code.

# 6. Restricted-Economy Architecture

The system uses layered records rather than one global "illegal economy" flag.

| Layer | Purpose |
| --- | --- |
| Policy/Restriction Definition | States what economic action is limited and by whom. |
| Coverage Resolver | Determines whether a proposed actor/good/service/route/transaction falls inside scope. |
| Market-Power Analyzer | Derives concentration, dependency and contestability from ordinary market/enterprise/route truth. |
| Market Context Overlay | Marks ordinary or underground market context, access and liquidity. |
| Illicit Mission Overlay | Adds restriction/evasion exposure to a valid shipment/contract. |
| Economic Conflict Record | Tracks deliberate cross-actor pressure and resulting economic state. |
| Consequence Processor | Posts verified losses, scarcity signals, expected-arrival changes, contract/insurance events and recovery state. |
| LOD Summary | Stores bounded regional restriction/underground/conflict state when detailed actors are unloaded. |

Important architecture rule: **restriction evaluation occurs before transaction commitment, while enforcement consequences occur only after an authoritative enforcement result.** A prohibited sale request can be denied by a lawful merchant without simulating police. A smuggling sale can be economically possible in a black-market context, but physical inspection or arrest is not resolved by 27I.

# 7. Restriction Definitions, Jurisdictions and Coverage

A restriction definition must identify:

- issuing authority or source;
- legal/political status reference;
- jurisdiction or institutional scope;
- effective and expiry times;
- target actor/faction/organisation filters;
- good/service/finance/route categories affected;
- transaction directions affected: produce, possess, buy, sell, import, export, transit, finance, insure, transport or service;
- quantity thresholds/quotas if applicable;
- licence/exemption references;
- severity/economic classification;
- known/public/secret information state supplied by owning systems;
- priority and conflict-resolution rules;
- suspension/repeal state.

Coverage must be resolved from explicit criteria. A ban on exporting mana crystals to Faction A does not automatically ban domestic possession, sales to neutral settlements, or transit unrelated to Faction A unless the restriction says so.

# 8. Controlled, Licensed, Rationed, Restricted and Prohibited Goods

Use graduated control rather than one binary legality flag.

| Classification | Economic Meaning | Example |
| --- | --- | --- |
| Open | Ordinary market rules. | Timber. |
| Monitored | Trade allowed but recorded/observed. | Large weapon shipments. |
| Licensed | Seller/buyer/carrier needs valid permission. | High-tier portal catalyst. |
| Quota-Limited | Quantity constrained per actor/period/route. | Rare medicinal herb during crisis. |
| Rationed | Allocation based on priority/eligibility. | Grain during siege. |
| Restricted Counterparty | Trade limited by who receives/provides it. | Strategic steel to hostile faction. |
| Transit Restricted | Movement through a jurisdiction requires permission. | Dangerous alchemical fuel. |
| Prohibited Transaction | Specific trade/use disallowed. | Forbidden cursed relic sale. |
| Embargoed | Commerce blocked by cross-actor policy. | Imports from enemy state. |

The item itself need not become universally illegal. Restrictions are contextual relationships between item/category, actor, action, place and time.

# 9. Strategic Goods and Economic-Security Classification

Strategic status is an economic/policy facet used when access materially affects:

- settlement survival;
- military supply;
- critical infrastructure;
- automation capacity;
- magic networks;
- portal/realm access;
- medicine/health service capacity;
- energy/fuel;
- high-tier construction;
- major public projects.

Strategic status may increase reserve targets, reduce export readiness, trigger procurement or rationing, increase insurance/security demand or motivate embargoes. It does not itself change item statistics.

# 10. Market Access, Trading Rights and Participation Restrictions

Markets may require economic participation rights such as:

- stall/vendor licence;
- guild membership;
- settlement permission;
- faction access;
- concession right;
- public procurement eligibility;
- trading charter;
- reputation threshold supplied by Set 28/factions;
- security clearance supplied externally;
- realm/port access supplied by the relevant owner.

27I resolves whether a proposed economic actor can lawfully participate. It does not determine the social reason for acceptance/rejection.

# 11. Monopoly and Market-Power Identity

A monopoly is not merely "one seller exists." It is meaningful power to influence terms because alternatives are weak.

A local monopoly may exist even with several tiny alternative sellers if one operator controls the only high-volume mine, forge, warehouse, portal, port service or transport corridor. Conversely, a seller with 100% current stock may have little durable power if imports or substitutes can arrive cheaply tomorrow.

**Locked monopoly test:** evaluate control plus contestability, not seller count alone.

# 12. Market-Power Measurement and Concentration Signals

27I should derive several explainable indicators:

- sellable stock share;
- productive-capacity share;
- procurement/buyer share for monopsony;
- critical infrastructure share;
- route/access share;
- exclusive-right coverage;
- substitute availability;
- import contestability;
- time/cost to new entry;
- switching cost;
- stockpiled strategic reserves;
- financial capacity where relevant;
- information/network advantage;
- duration/persistence of dominance.

Recommended output bands:

| Band | Meaning |
| --- | --- |
| Competitive | Multiple meaningful alternatives. |
| Concentrated | Few major actors; some bargaining power. |
| Dominant | One actor materially influences terms. |
| Near-Monopoly | Alternatives exist but are weak/slow/expensive. |
| Monopoly | One actor controls practical supply/access for the current context. |

These are diagnostics, not automatic legality judgments.

# 13. Sources of Market Power

Market power can arise from:

- superior production efficiency;
- ownership of rare deposits;
- large accumulated stock;
- exclusive recipes/knowledge;
- scarce specialist labour;
- ownership/control of workshops or infrastructure;
- route chokepoints;
- port, bridge, rail, portal or warehouse access;
- patents/charters/concessions where the world supports them;
- exclusive faction rights;
- finance/working-capital advantages;
- network effects and established buyer relationships;
- public monopoly;
- wartime scarcity;
- destruction/disruption of competitors;
- temporary first-mover advantage.

Power gained legitimately through investment can still have consequences; 27I does not assume dominance is automatically criminal.

# 14. Natural, Infrastructure and Network Monopolies

Some services may naturally concentrate because duplicate infrastructure is expensive or impossible at small scale:

- bridge/tunnel crossings;
- aqueduct/utility distribution;
- major port terminals;
- realm gates;
- rail corridors;
- large public warehouses;
- rare magical stabilisation facilities.

Economic controls can include access obligations, regulated fees, concessions, public ownership, competing substitutes or new infrastructure. The governance owner decides which controls are lawful; 27I models their economic effects.

# 15. Exclusive Rights, Concessions, Charters and Franchises

Exclusive economic rights must reference a valid ownership/governance source and specify:

- holder(s);
- activity/resource/service;
- geographic/institutional scope;
- start/end/renewal;
- fee/royalty/tribute obligations;
- performance conditions;
- transferable/subcontractable status;
- access obligations;
- revocation/suspension trigger references;
- public visibility/knowledge state.

An exclusive right can create scarcity or investment incentives. It never creates physical production capacity by itself.

# 16. Dominant Firms, Guilds and Public Monopolies

Dominant actors can be:

- private enterprises;
- cooperatives;
- guilds;
- temples/orders;
- settlement authorities;
- faction governments;
- player companies;
- mixed public/private entities.

Actor type changes policy and social context, not the underlying economic model. Public ownership does not make scarcity disappear; private ownership does not automatically imply abuse.

# 17. Cartels, Pools and Coordinated Market Behaviour

A cartel economic record may coordinate:

- target price bands;
- output quotas;
- purchase limits;
- territories/customer allocation;
- shared procurement;
- shared storage/reserves;
- coordinated embargo/refusal;
- common transport/warehouse access;
- emergency supply pooling.

Cartel membership requires actual actors and an authorised/accepted relationship or externally supplied covert coordination state. 27I may model the economic policy once such coordination exists, but Set 28/faction/legal systems own trust, secrecy, conspiracy and betrayal.

Cartels can be unstable. Incentives to defect rise when members can earn more by exceeding quota, selling secretly or switching allies. The decision to betray remains social; 27I exposes the economic incentive.

# 18. Exclusive Dealing, Tying, Refusal and Discriminatory Access

Supported economic policies include:

- exclusive supplier agreements;
- exclusive buyer agreements;
- bundled/conditional sales;
- membership-only access;
- preferred-customer tiers;
- faction-based refusal;
- quota allocation;
- priority access during shortage;
- denial of critical infrastructure/service.

27E owns the contract where one exists. 27I measures market consequences and alternative availability.

# 19. Predatory, Scarcity and Exploitative Pricing Boundary

27I should not use moral labels as formula inputs. Instead it exposes facts:

- concentration level;
- margin versus ordinary baseline;
- scarcity level;
- replacement/import availability;
- buyer alternatives;
- duration;
- emergency context;
- regulated cap if any;
- inventory hoarding/reserve decisions;
- cost change versus markup change.

27B calculates price. Governance/legal systems decide whether behaviour violates a rule. Set 28 determines social anger/trust consequences.

# 20. Market-Power Effects on 27B/27C Pricing and Liquidity

27I outputs bounded modifiers such as:

- `market_power_markup_pressure`;
- `buyer_power_discount_pressure`;
- `restricted_supply_pressure`;
- `exclusive_access_pressure`;
- `illicit_risk_premium`;
- `illicit_liquidity_discount`;
- `sanction_counterparty_cost`;
- `embargo_shortage_signal`.

27B applies them within its modifier precedence/caps. 27C remains responsible for stock and demand. 27I must not apply a second independent price after 27B returns the quote.

# 21. Contestability, Entry, Substitution and Monopoly Erosion

Market power should weaken when alternatives improve. Possible counters include:

- new producers;
- new mines/resources;
- substitute goods;
- recycling/recovery;
- new roads/ports/bridges/portals;
- imports;
- public production;
- cooperative pooling;
- technology/magic improving production;
- contract expiry;
- concession revocation;
- faction/treaty change;
- monopoly capacity damage;
- player investment.

This makes monopoly conflict playable through building and production, not only political menus.

# 22. Embargo Identity and Policy Application

An embargo definition should include:

- issuer(s);
- target(s);
- affected goods/services/finance/transport categories;
- direction: import/export/both/transit/service;
- jurisdictions/endpoints;
- start/end/condition;
- exceptions/humanitarian allowances where configured;
- enforcement owner references;
- known/public information state;
- penalty/economic treatment references;
- treaty/alliance propagation rules supplied by faction systems.

Economic coverage must be evaluated per transaction/route. An embargo does not automatically destroy pre-existing contracts; 27E evaluates contractual consequences using the restriction event.

# 23. Sanctions, Denial Lists and Restricted Counterparties

Sanctions may target:

- individual actors;
- enterprises;
- factions;
- public bodies;
- vessels/vehicles/assets when supported by owners;
- financial accounts/institutions;
- insurance coverage;
- procurement eligibility;
- market participation;
- specific goods/services;
- ownership/control relationships.

27I maintains the economic target/coverage layer. 27F, 27G, 27H and market services execute their own valid denial/freeze/refusal actions.

# 24. Import, Export, Transit and Service Restrictions

Restrictions can apply independently to:

- purchase;
- sale;
- import;
- export;
- transit;
- carriage/transport service;
- storage/warehousing;
- repair/service provision;
- finance;
- insurance;
- brokerage/intermediation;
- public procurement.

This enables nuanced conflict: a neutral state might permit transit while banning domestic resale, or allow medicine imports while banning weapons.

# 25. Asset, Finance and Insurance Restrictions

27I may emit restriction decisions such as:

- financial service denied;
- account action restricted by externally authorised sanction;
- loan/letter-of-credit unavailable;
- insurance prohibited or priced with sanction exposure;
- collateral/asset transfer restricted;
- payment channel unavailable.

27F owns actual account/instrument mutations. 27I never edits balances directly.

# 26. Tariff Escalation, Quotas, Rationing and Economic Controls

Not every conflict needs a total embargo. Economic pressure can escalate through:

- higher tariffs;
- selective duties;
- import/export quotas;
- licensing delays/costs;
- rationing;
- strategic reserve mandates;
- preferential procurement;
- subsidy support;
- price controls where authorised;
- transit fees;
- service denial.

27G owns lawful policy and treasury mechanics. 27I evaluates resulting market pressure, evasion incentive and underground substitution.

# 27. Blockades, Closures and Physical-Conflict Handoffs

A blockade or closure has two layers:

1. **Physical state** - route, port, bridge, gate, corridor or realm transition is actually inaccessible/controlled. Owned by Set 30, Set 26, combat/world/realm systems.
2. **Economic state** - expected arrivals fail, costs rise, trade shifts, stock falls, black markets grow, substitutes appear, contracts breach and market power changes. Owned by Set 27/27I.

Never infer total physical closure solely from an embargo policy. Likewise, physical closure can create scarcity even without a formal embargo.

# 28. Economic Warfare and Strategic Resource Denial

Economic warfare can include:

- denying exports of strategic inputs;
- purchasing scarce stock before rivals;
- competing for supplier contracts;
- subsidising domestic alternatives;
- building rival infrastructure;
- closing access rights;
- sanctioning finance/insurance;
- targeted tariffs;
- reserve accumulation;
- aid to an ally;
- convoy protection;
- counter-embargoes;
- lawful confiscation outcomes supplied externally;
- destruction/sabotage outcomes supplied externally.

The economic system records material effects. It does not choose war declarations, military targets or tactics.

# 29. Boycotts, Refusal Campaigns and Voluntary Economic Pressure

Voluntary refusal may come from:

- cultural norms;
- faction calls;
- guild policy;
- player/company policy;
- social movements/events;
- moral response to world events.

Set 28/faction/event systems determine who joins or abandons a boycott. 27I aggregates resulting demand/supply access effects and exposes economic incentives to comply or defect.

# 30. Shortages, Substitution and Secondary Market Effects

Restriction pressure propagates through ordinary economic links:

- direct shortage;
- higher substitute demand;
- production bottlenecks;
- wage changes in affected sectors;
- warehouse drawdown;
- reserve release;
- delayed projects;
- reduced exports;
- increased imports from neutral markets;
- repair/recycling demand;
- black-market formation;
- public relief/procurement;
- increased route value and insurance demand.

These effects should be bounded and traceable. One embargo should not multiply every commodity price globally.

# 31. Black-Market Identity and Formation Conditions

A black market exists only when all required conditions pass:

1. valid restricted/prohibited/avoided demand exists;
2. willing supply or source exists;
3. at least one intermediary/direct counterparty channel exists;
4. economic access/meeting/delivery is possible;
5. settlement/payment is possible;
6. expected reward exceeds policy/risk threshold for participating actors;
7. the market has non-zero liquidity/capacity.

If one condition fails, demand may remain unmet rather than spawning a magic vendor.

# 32. Underground Market Contexts, Venues and Networks

Black markets may appear through different fiction/presentation while sharing one economic model:

- discreet merchant/fence;
- hidden market district;
- travelling broker;
- faction camp;
- guild backroom;
- remote trade post;
- maritime pirate-linked port context;
- realm-border exchange;
- direct trusted network.

The venue does not create inventory. It provides economic access to participants, storage, information or settlement capability when its external requirements are valid.

# 33. Illicit Supply, Demand and Liquidity

Illicit supply uses real stock and may originate from:

- lawful stock diverted to restricted buyers;
- production intended for underground sale;
- imports through restricted channels;
- stolen/seized/looted goods whose provenance is supplied externally;
- old stock made restricted after policy change;
- counterfeit/forged goods supplied by other systems.

Illicit demand can arise from:

- unavailable essential goods;
- luxury/status goods;
- forbidden magic;
- strategic equipment;
- tax/tariff avoidance;
- sanctioned counterparties;
- faction needs;
- collector demand;
- desperation during crisis.

Liquidity is reduced by narrow buyer pools, secrecy, high risk, unusual goods, low trust and difficult payment. High theoretical value does not guarantee a buyer.

# 34. Black-Market Pricing and Risk Premiums

27I supplies factors to 27B rather than calculating a second price engine.

Potential drivers:

- ordinary fair value;
- restriction scarcity;
- expected confiscation/loss exposure;
- low liquidity;
- intermediary margin;
- concealment/handling cost abstraction;
- route difficulty;
- finance/payment friction;
- information asymmetry;
- provenance discount;
- urgency;
- replacement difficulty;
- sanctions/embargo severity;
- trust/relationship modifier supplied by Set 28.

A stolen relic may be worth less to a fence than to a lawful collector because resale risk and buyer scarcity are high. A banned medicine may cost more because demand is urgent and supply constrained. Both remain explainable outcomes.

# 35. Fences, Brokers, Fixers and Intermediaries

Economic roles include:

- fence: purchases/resells problematic goods;
- broker: connects buyer/seller without necessarily taking ownership;
- fixer: arranges access/services using social results supplied by Set 28;
- covert carrier: provides restricted transport contract capacity;
- wholesaler: aggregates underground stock;
- money/value intermediary: provides settlement service through 27F/27B-compatible channels;
- information broker: sells economic information with provenance/confidence.

Each role requires an actual actor/enterprise, funds/capacity and permission/access state. Names are role descriptors, not automatic criminal alignment.

# 36. Contraband Provenance, Custody and Resale

Contraband state should be contextual and preserve provenance:

- item/lot identity;
- owner;
- current custodian;
- source event;
- restriction references;
- known/unknown provenance fields;
- last lawful transaction where relevant;
- current market context;
- seizure/claim flags supplied externally;
- contract/insurance references.

Moving an item into a black-market inventory does not erase ownership history unless another authoritative system changes it.

# 37. Smuggling Economic Mission Architecture

A smuggling mission extends a valid 27H shipment/contract with restricted-exchange intent.

Minimum economic fields:

- mission ID;
- principal/operator;
- cargo lot/consignment refs;
- restriction refs being bypassed;
- origin/destination;
- economic route/alternate route refs;
- transport-provider execution ref;
- declared versus actual commercial classification where supported by other systems;
- budget limit;
- expected sale value;
- expected legal-market alternative;
- risk/exposure bands from external systems;
- intermediary/service costs;
- insurance/finance availability;
- deadline;
- abort thresholds;
- outcome evidence;
- realised loss/profit.

The system deliberately abstracts concealment and evasion mechanics. 27I needs costs and risk signals, not real-world procedural methods.

# 38. Covert Route Choice and Set 30/26 Handoff

27I may choose among **economically valid route options** using inputs such as:

- cost;
- expected duration;
- restriction coverage;
- inspection/exposure band supplied externally;
- known closure;
- capacity;
- reliability;
- handling endpoints;
- black-market access at destination.

Set 30/Set 26 decide whether movement succeeds and return authoritative events such as delayed, diverted, inspected, seized, damaged, arrived or lost. 27I cannot simulate around those outcomes.

# 39. Concealment, Secrecy and Handling Cost Abstraction

The economic layer may represent:

- specialist packaging/handling cost;
- lower effective cargo capacity;
- additional loading time;
- trusted-intermediary fee;
- route-information fee;
- secrecy wage premium;
- storage premium;
- spoilage/condition risk;
- reduced insurance access.

These are game abstractions. Specific concealment technique, inspection mechanics and stealth behaviour remain outside 27I.

# 40. Evasion of Tariffs, Customs, Licences and Embargoes

27I can create an evasion economic decision when a lawful obligation/restriction from 27G/other authority exists.

Decision inputs may include:

- lawful total cost;
- expected illicit premium/cost;
- delay difference;
- actor risk tolerance;
- social willingness from Set 28;
- enforcement exposure band;
- contract urgency;
- item perishability;
- availability of lawful alternatives;
- expected loss if caught supplied by policy/justice outcomes.

NPCs do not automatically evade because it is cheaper. Personality, morality, loyalty and law response remain outside 27I.

# 41. Bribes, Facilitation Payments and Social/Legal Boundary

27I may model a **proposed value transfer** associated with attempted access or favourable treatment. It can answer:

- what is being offered;
- value/currency/item source;
- who pays;
- who would receive;
- economic cost to payer;
- contract/transaction context;
- whether funds/items exist.

27I cannot answer:

- whether the recipient is corrupt;
- whether they accept;
- whether persuasion succeeds;
- whether the act is criminal;
- whether anyone observes/reports it;
- what punishment follows.

Those outcomes come from Set 28/legal/security owners. If accepted authoritatively, 27I posts the value transfer and economic consequence.

# 42. Detection, Inspection, Seizure and Enforcement Handoff

External systems expose events such as:

- inspection requested/completed;
- cargo cleared;
- cargo delayed;
- prohibited cargo detected;
- cargo seized/confiscated;
- fine/assessment created;
- actor detained/unavailable;
- route closed;
- asset released;
- case dismissed/reversed;
- loss confirmed.

27I consumes these events to update inventory access, expected arrivals, contracts, insurance claims, market scarcity, enterprise losses and black-market confidence. It does not roll its own detection chance.

# 43. Economic Loss, Forfeiture and Claim Consequences

After an authoritative external outcome, 27I/related Set 27 owners may post:

- lost stock/custody status;
- shipment failure;
- contract breach/force-majeure context;
- insurance claim trigger;
- enterprise loss;
- market expected-arrival cancellation;
- price/scarcity pressure;
- public forfeiture receipt when 27G says so;
- debt/default pressure;
- reputation/social evidence to Set 28;
- historical event record.

No double counting: one seized lot cannot simultaneously remain in merchant sellable stock and public confiscated stock.

# 44. Illicit Finance Boundary and 27F Integration

27I may require economic capabilities such as:

- payment outside ordinary sanctioned institutions;
- credit from high-risk counterparties;
- trade credit;
- escrow-like trusted intermediary;
- finance denial due to sanctions;
- insurance denial/exclusion;
- suspicious payment/event markers.

27F remains authoritative for accounts, credit, instruments, settlement and insurance. Core 27I does **not** implement detailed laundering chains intended to obscure real-world funds; it only needs game-level provenance/risk and alternative settlement capability.

# 45. Fraud, Counterfeit and Misrepresentation Economic Interfaces

Where other systems create forged/counterfeit/misrepresented goods or documents, 27I can model:

- expected discount/premium;
- buyer uncertainty;
- lower liquidity;
- confidence damage;
- market shock after discovery;
- claim/contract consequences;
- currency confidence signal to 27B;
- merchant refusal reasons.

Authenticity checks, deception skill, forgery crafting and investigation remain with their owners.

# 46. Information, Rumours, Secrecy and Market Intelligence

Restricted markets are information-poor by design. Economic information records should track:

- subject;
- source/provenance;
- timestamp;
- coverage;
- confidence;
- public/private/secret access supplied externally;
- whether it is direct observation, report, rumour or forecast;
- known restriction version;
- known price/liquidity band;
- route/access confidence.

Set 28 owns who shares, lies, withholds or trusts information. 27I owns how stale/uncertain information affects economic planning.

# 47. Reputation, Trust, Loyalty and Set 28 Boundary

Set 28 supplies bounded outputs such as:

- trust/willingness to transact;
- willingness to keep information confidential;
- willingness to join/leave a boycott/cartel/covert network;
- relationship concession/refusal;
- betrayal/reporting outcome;
- social memory consequence.

27I supplies:

- transaction outcome;
- monopoly/exclusion evidence;
- boycott compliance/defection economic incentive;
- smuggling mission success/failure evidence;
- unpaid obligation/loss evidence;
- repeated underground-contact history;
- scarcity/price consequence observations.

# 48. Survival Shortages, Relief and Set 29 Boundary

Economic conflict may create shortages of food, fuel, medicine, clothing or shelter materials. 27I can expose:

- shortage severity;
- affordability/access;
- ration availability;
- relief stock/funding demand;
- black-market substitution;
- import dependency;
- recovery forecast.

Set 29 decides physiological effects. 27G/settlement systems decide relief policy and allocation rules.

# 49. Terrestrial Movement, Caravans and Set 30 Boundary

Set 30 supplies:

- valid route/accessibility state;
- vehicle/mount capacity;
- physical journey duration;
- checkpoint/inspection encounter result where integrated;
- breakdown/delay;
- arrival/diversion/loss result;
- passenger/cargo compatibility.

27I supplies:

- smuggling/restricted economic mission;
- cargo restriction context;
- preferred/alternate economic route references;
- commercial deadline;
- budget;
- economic abort threshold;
- expected sale/contract value;
- risk-information context.

No ownership transfer occurs.

# 50. Maritime Piracy, Blockades and Set 26 Integration

Set 26 owns:

- vessel movement and cargo handling;
- ports/harbours;
- piracy encounter execution;
- coast-guard/naval patrols;
- boarding/interception;
- physical blockade presence;
- voyage loss/damage/capture;
- wreck/salvage state.

27I owns:

- embargo/sanction application to maritime commerce;
- black-market port economic contexts;
- contraband cargo value/risk;
- smuggling commercial mission overlay;
- blockade scarcity/route-price effects;
- pirate-market/fence economic interfaces where Set 26 supplies the actors/events;
- recovery when routes reopen.

# 51. Faction, Settlement and Public-Finance Consequences

Economic conflict can affect:

- treasury revenue;
- customs collections;
- public procurement cost;
- subsidy/relief spending;
- settlement affordability;
- project delays;
- enterprise closures/booms;
- employment;
- strategic reserves;
- import dependence;
- faction leverage;
- treaty incentives;
- occupation economics;
- public confidence signals.

27I sends economic summaries. Governance systems decide policy, legitimacy, diplomacy and political consequence.

# 52. Player Economic-Conflict Roles and Playstyles

Supported player fantasies include:

- competitive merchant breaking a monopoly through imports;
- industrialist creating substitute supply;
- guild leader operating an exclusive concession;
- ruler applying or lifting embargoes where authorised;
- public official managing strategic reserves;
- caravan operator servicing high-risk restricted routes;
- smuggler taking covert commercial contracts;
- fence/broker trading low-liquidity goods;
- financier supporting lawful alternatives;
- relief trader supplying crisis settlements;
- economic saboteur only where other systems provide the underlying legal/combat actions;
- neutral trader navigating competing sanctions;
- black-market investigator/observer through quest systems.

No role is mandatory for progression.

# 53. NPC/Faction Economic-Conflict Decision Model

Economic actors evaluate bounded inputs:

- current stock/reserve;
- market power/dependency;
- profit opportunity;
- lawful alternatives;
- sanctions/restriction coverage;
- route availability;
- financial capacity;
- contract obligations;
- survival/public priority;
- known enforcement exposure;
- relationship/willingness from Set 28;
- faction policy;
- risk tolerance/personality supplied externally;
- expected recovery duration.

Decision outputs may include:

- comply;
- seek exemption;
- import substitute;
- release reserve;
- increase production;
- reroute;
- delay/cancel contract;
- join boycott/cartel;
- defect from cartel;
- attempt covert trade if social/legal owner permits willingness;
- exit market;
- request public aid.

**Anti-omniscience rule:** actors use known information and local/regional summaries, not perfect global truth.

# 54. Quests, Events and Persistent Economic History

27I exposes quest/event hooks such as:

- break a monopoly by restoring alternate infrastructure;
- negotiate access to a concession;
- deliver relief during embargo;
- investigate missing shipments;
- escort lawful neutral cargo;
- establish substitute production;
- reopen a trade corridor;
- survive a price shock;
- smuggle a restricted but essential good where the narrative supports it;
- recover seized/lost commercial value through lawful processes;
- expose or join a cartel;
- counter an economic blockade;
- manage post-conflict reconstruction.

Persistent history should record cause and outcome so a market remembers why prices changed.

# 55. Crisis Escalation, De-escalation and Recovery

Economic conflict should use staged pressure rather than binary permanent collapse.

Suggested state model:

1. Normal / Competitive  
2. Tension / Concentration Rising  
3. Restriction / Targeted Pressure  
4. Disruption / Shortage  
5. Severe Dislocation / Underground Expansion  
6. Stabilisation  
7. Recovery  
8. New Equilibrium

Recovery inputs include:

- restriction lifted/expired;
- route reopened;
- new supplier/substitute;
- repaired infrastructure;
- reserve release;
- aid/imports;
- new enterprise entry;
- restored finance/insurance;
- settlement production recovery;
- confidence improvement;
- contract backlog completion;
- reduced underground risk premium as lawful supply returns.

Prices, liquidity and output should normalise over time rather than snap instantly unless the underlying data actually changes immediately.

# 56. UI/UX, Explainability and Accessibility

Default player-facing views should answer **what, why, what can I do?**

Examples:

- "Iron: Very Expensive - East Road embargoed; Forge Guild controls most local supply; mine stock low."
- "Medicine: Restricted - relief licence holders receive priority."
- "Black-market availability: Low - few known sellers; high risk; no recent deliveries."
- "Caravan cannot depart - destination trade is embargoed and no authorised exemption is attached."
- "Smuggling contract expected margin: High - but route exposure and seizure-loss risk are high."
- "Monopoly pressure falling - new south mine and river imports increased alternatives."

Advanced views may show:

- concentration bands;
- supplier shares;
- route dependency;
- restriction coverage graph;
- sanctioned counterparties;
- underground liquidity;
- expected loss components;
- recovery trend;
- historical policy timeline.

Accessibility requirements:

- never communicate legal/restriction state by colour alone;
- use plain-language reason codes;
- allow reduced market/conflict information density;
- expose uncertainty explicitly;
- avoid rapid flashing crime-alert UI;
- support screen-reader/localisation-ready labels;
- allow economic-conflict assistance presets.

# 57. Difficulty, World Settings and Assistance

World settings may independently scale:

- monopoly formation strength;
- price volatility from restrictions;
- cartel frequency;
- embargo/sanction frequency;
- black-market availability;
- enforcement exposure severity supplied to 27I;
- loss severity after external seizure;
- strategic-resource pressure;
- rationing depth;
- NPC economic adaptation speed;
- recovery speed;
- player tax/customs friction;
- illicit-economy visibility;
- economic conflict event frequency.

Recommended presets:

| Preset | Direction |
| --- | --- |
| Peaceful/Builder | Minimal embargo/black-market pressure; monopolies weak/easy to contest; essential goods protected. |
| Standard | Meaningful but recoverable restrictions and market power. |
| Harsh Economy | Stronger shortages, slower recovery, higher route dependence and strategic pressure. |
| Political Sandbox | More active sanctions, cartels, concessions and faction economic conflict. |
| Trade Simulator | Deep market-power, information, illicit liquidity and policy systems exposed. |

No preset may remove Set 25 reachability guarantees for mandatory progression.

# 58. Simulation LOD, Persistence and Reconciliation

## 58.1 Detailed/Near Simulation

Near active players, track:

- exact merchant/warehouse stock;
- exact underground participants when loaded;
- individual shipments;
- detailed restriction coverage;
- explicit cartel/exclusive contracts;
- player-visible transactions;
- enforcement result events;
- exact custody/provenance.

## 58.2 Settlement/Regional Summary

At distance, aggregate:

- concentration by major commodity family;
- strategic stock bands;
- active restrictions;
- lawful/illicit market capacity;
- route availability summary;
- underground liquidity band;
- expected arrivals;
- major enterprise capacity;
- conflict/recovery stage;
- unresolved authoritative events.

## 58.3 Bounded Catch-Up

Distant catch-up may calculate net production/consumption/trade/conflict changes in bounded time slices. It must not generate a long chain of invisible contraband transactions. Use deterministic aggregated flows with conservation and maximum work limits.

## 58.4 Reconciliation Gate

When promoting a region to detailed simulation:

1. validate inventories and ownership;
2. materialise only supported actors/shipments;
3. reconcile market summaries against exact stock;
4. preserve restriction/conflict history;
5. resolve expected arrivals from actual shipment state;
6. block promotion on unrecoverable quantity contradictions rather than guessing.

# 59. Multiplayer Authority, Permissions and Anti-Exploit Rules

Server/authoritative host owns:

- restriction activation state;
- cartel/exclusive policy state;
- black-market market context;
- underground transaction commitment;
- smuggling mission dispatch/outcome posting;
- market-power summaries;
- seized/lost stock consequence posting;
- sanction coverage;
- economic conflict/recovery state.

Permissions may include:

- adopt economic restriction;
- grant concession;
- manage company market policy;
- join/leave commercial coalition;
- accept restricted contract;
- dispatch covert shipment;
- spend enterprise funds;
- access underground market;
- view sensitive economic intelligence.

Anti-exploit invariants:

- no client-created contraband stock;
- no duplicate lawful + black-market sale of one lot;
- no reusing one exemption for multiple consumed transactions unless explicitly reusable;
- no clearing sanctions by relogging/changing UI;
- no infinite cartel profit from self-trading;
- no smuggling arrival without transport-owner arrival;
- no insurance payout without 27F-valid policy/claim;
- no treasury forfeiture without 27G/justice-valid event;
- no market-power bonus stacked twice through 27B and 27C;
- no hidden player-company action without authority/audit where multiplayer rules require it.

# 60. Set 25 Schemas, Godot Architecture, Validation and Production Risks

## 60.1 Proposed Set 25 Definition Families

Suggested governed definition/runtime families:

- `economy.restriction_definition`
- `economy.restriction_scope`
- `economy.market_power_profile`
- `economy.exclusive_right`
- `economy.cartel_policy`
- `economy.embargo_definition`
- `economy.sanction_definition`
- `economy.black_market_context`
- `economy.illicit_role_profile`
- `economy.smuggling_mission`
- `economy.evasion_exposure`
- `economy.economic_conflict_state`
- `economy.recovery_profile`

Set 25 remains authoritative for IDs, namespace ownership, schema validation, aliases, migrations, pack manifests and relationship vocabulary.

## 60.2 Core Relationships

Proposed relationships include:

- `restricts_actor`
- `restricts_item_family`
- `restricts_transaction_type`
- `applies_in_jurisdiction`
- `targets_counterparty`
- `grants_exclusive_right_to`
- `coordinates_with`
- `dominates_market_context`
- `supplies_black_market`
- `brokers_for`
- `bypasses_restriction`
- `depends_on_route`
- `depends_on_infrastructure`
- `creates_shortage_signal`
- `creates_recovery_signal`

## 60.3 Godot Runtime Services

Recommended logical services:

| Service | Responsibility |
| --- | --- |
| EconomyRestrictionService | Resolve active restriction coverage. |
| MarketPowerService | Calculate concentration/contestability summaries. |
| EconomicConflictService | Maintain embargo/sanction/conflict/recovery state. |
| UndergroundMarketService | Maintain black-market contexts, liquidity and access. |
| IllicitTradeService | Validate economic smuggling/restricted transaction missions. |
| EconomyConsequenceService | Consume external outcomes and post Set 27 consequences. |
| EconomyIntelService | Manage source/timestamp/confidence for restricted-market information. |
| EconomyConflictLODService | Aggregate/demote/promote distant conflict state. |

These services operate on data records, not scene-node authority. UI sends commands and reads view models.

## 60.4 Example Commands and Events

Commands:

- `RequestGrantExclusiveRight`
- `RequestAdoptRestriction`
- `RequestLiftRestriction`
- `RequestJoinCartelPolicy`
- `RequestUndergroundTrade`
- `RequestDispatchRestrictedShipment`
- `RequestApplyExemption`
- `RequestReleaseStrategicReserve`

Events:

- `RestrictionActivated`
- `RestrictionExpired`
- `MarketPowerBandChanged`
- `ExclusiveRightGranted`
- `BlackMarketFormed`
- `BlackMarketLiquidityChanged`
- `RestrictedShipmentDispatched`
- `RestrictedShipmentArrived`
- `RestrictedShipmentSeized`
- `EmbargoShortageEscalated`
- `AlternativeSupplyEstablished`
- `EconomicConflictStageChanged`
- `EconomicRecoveryAdvanced`

## 60.5 Validation Invariants

1. Every restriction has valid issuer/source, scope and lifecycle.  
2. Restriction coverage is contextual; no global item illegality is inferred without scope.  
3. Market-power state derives from ordinary economic truth.  
4. Black markets cannot own stock not present in authoritative inventories.  
5. Underground sale atomically transfers the same real value/stock as lawful sale.  
6. Smuggling missions require a valid 27H shipment/transport handoff.  
7. 27I never determines inspection/arrest/seizure on its own.  
8. Seizure economic loss posts only after authoritative event.  
9. Sanction denial cannot directly mutate 27F balances outside 27F.  
10. Embargo expected-arrival removal must reference affected shipments/routes.  
11. One market-power modifier cannot be applied twice to one quote.  
12. Restrictions must preserve mandatory progression reachability or expose approved fallback.  
13. Distant illicit trade remains bounded and conserves quantities/value.  
14. Multiplayer restricted transactions require valid authority.  
15. Recovery cannot restore stock/capacity that has no source.  
16. Historical restrictions remain traceable for persistent consequence.  
17. Cartel membership/policy cannot silently rewrite independent enterprise ownership.  
18. Illicit liquidity may reach zero; the system must allow unmet underground demand.  
19. Public confiscation/forfeiture requires an external lawful outcome reference.  
20. UI uncertainty must reflect information confidence rather than showing hidden omniscient state.

## 60.6 Deterministic Acceptance Scenarios

| Scenario | Expected Result |
| --- | --- |
| 1. Sole supplier, easy imports | High stock share but only modest durable market power because contestability is high. |
| 2. Sole supplier, closed bridge | Market power rises because practical alternatives disappear; 27B price pressure remains bounded. |
| 3. New rival mine opens | Concentration and monopoly pressure decline after real capacity enters the market. |
| 4. Embargo starts | Existing target-owned stock remains; new lawful covered trade is denied; affected shipments update according to state. |
| 5. Medicine humanitarian exemption | Covered exempt shipment proceeds while other embargoed goods remain restricted. |
| 6. Black-market formation | Restricted demand + stock + willing network + route + payment creates an underground context; no stock is spawned. |
| 7. No underground buyer | High-value contraband remains unsold because illicit liquidity is zero/too low. |
| 8. Smuggling dispatch | Real stock is reserved/dispatched once; destination receives nothing until Set 30/26 reports arrival. |
| 9. Authoritative seizure | Shipment stock is removed/transferred according to external result; 27C expected arrival cancels; enterprise loss posts once. |
| 10. Bribe proposal refused | No value transfer occurs because Set 28/legal owner did not return acceptance. |
| 11. Cartel self-trading exploit | Internal circular trades do not create net demand/profit or infinite price pressure. |
| 12. Sanctioned bank access | 27I resolves restriction; 27F performs denial/freeze behaviour without 27I editing balances. |
| 13. Maritime blockade | Set 26 reports route disruption; 27H expected arrivals change; 27I models scarcity/black-market response. |
| 14. Distant region catch-up | Aggregated underground flow conserves stock/value and promotes cleanly to detailed state. |
| 15. Essential progression good embargoed | Approved substitute/fallback/import/quest path remains available under Set 25 reachability validation. |
| 16. Monopoly concession expires | Exclusive-right pressure ends; market power recalculates from remaining real capacity. |
| 17. Recovery after route reopening | Imports resume, stock rebuilds, underground premium/liquidity pressure declines gradually. |
| 18. Multiplayer duplicate sale attempt | Second transaction fails because the authoritative lot is already reserved/transferred. |
| 19. Counterfeit discovery event | Economic confidence/price/liquidity consequences update only after authenticity owner emits discovery. |
| 20. Secret restriction unknown to player | UI shows observed transaction refusal/uncertainty, not hidden full policy details until learned. |

## 60.7 Production Classification

Recommended classification:

**Core/early production:**

- contextual restricted goods;
- simple licences/embargoes;
- market concentration summary;
- strategic reserves/shortage signals;
- basic black-market context;
- smuggling economic mission handoff;
- reason codes and UI explanations;
- authoritative enforcement-result consumption;
- recovery.

**Expansion/advanced:**

- sophisticated cartels;
- multi-layer sanctions;
- financial restrictions;
- complex concessions;
- advanced monopsony;
- detailed underground network simulation;
- reinsurance/sanction interactions;
- complex public price controls;
- multi-faction economic warfare planning.

## 60.8 Major Risks and Redesign Triggers

| Risk | Consequence | Control / Trigger |
| --- | --- | --- |
| Black market becomes infinite vendor | Breaks physical economy. | Require real stock, liquidity and counterparties. |
| Monopoly is just a price multiplier | Feels arbitrary. | Derive power from share/access/contestability. |
| Embargo globally deletes goods | Breaks persistence and logic. | Restrict transactions/routes, never existence. |
| Illicit system duplicates crime design | Ownership conflicts. | Consume legal/social/security outcomes only. |
| Smuggling becomes real-world procedural tutorial | Unnecessary and unsafe scope. | Keep concealment/evasion abstract and game-system oriented. |
| Economic conflict hard-locks progression | Bad seeds/events become unwinnable. | Set 25 capability/fallback validation. |
| Sanctions bypass 27F authority | Account corruption. | 27I emits restriction; 27F mutates finance state. |
| Market-power calculation too expensive | Large worlds slow down. | Commodity-family aggregation and event-driven recalculation. |
| Cartels perfectly coordinate | NPCs feel omniscient. | Bounded information and Set 28 willingness. |
| Underground demand cascades globally | Unrealistic volatility. | Local/regional scope, caps, substitution and LOD. |
| Recovery is instant | Conflict lacks consequence. | Restore through real stock/capacity/confidence. |
| Recovery is impossible | World stagnates. | Multiple recovery paths and policy expiry. |

# 61. Cross-Set Interface Amendments

The following additions are proposed for the final Sets 27-30 integration pass. They add required fields without transferring ownership.

## Amendment 27I-A - Set 28 Restricted-Trade Willingness and Secrecy Interface

**Reason:** Black markets, boycotts, cartels and bribery proposals require social willingness without 27I owning personality, trust or betrayal.

**Set 28 -> 27I:**

- willingness/refusal to enter restricted transaction;
- confidentiality/secrecy willingness band;
- trust/reputation modifier for underground access;
- willingness to join/leave cartel/boycott/covert network;
- acceptance/refusal of proposed inducement/payment;
- betrayal/reporting/social consequence outcome;
- information-sharing truth/provenance result.

**27I -> Set 28:**

- restricted transaction outcome;
- economic incentive/cost of compliance/defection;
- monopoly/exclusion evidence;
- underground interaction history;
- smuggling success/failure/seizure economic evidence;
- scarcity/price observations.

**Ownership transfer:** None.

## Amendment 27I-B - Set 29 Essential-Goods Shortage Interface

**Reason:** Embargoes and market concentration can create shortages, but 27I must not own survival effects.

**27I -> Set 29:**

- availability/affordability band for enabled survival goods;
- ration/relief access state;
- medicine/provision shortage economic signal;
- expected duration/confidence of shortage;
- substitute-goods availability.

**Set 29 -> 27I:**

- enabled survival-demand requirement profile;
- urgency/essentiality signal;
- treatment/provision demand quantities at appropriate abstraction;
- incapacity/workforce impact summary.

**Ownership transfer:** None.

## Amendment 27I-C - Set 30 Restricted Terrestrial Shipment Interface

**Reason:** Smuggling/evasion economics need physical journey outcomes without Set 27 owning movement or detection.

**27I/27H -> Set 30:**

- restricted shipment/mission ID;
- cargo compatibility/quantity/capacity requirement;
- origin/destination/route options;
- deadline;
- authorised economic route and alternate refs;
- restriction/exposure context as tags/bands only;
- commercial abort/budget thresholds.

**Set 30 -> 27I/27H:**

- actual departure/arrival/diversion;
- capacity used;
- journey duration;
- physical delay/breakdown;
- inspection/interception outcome reference supplied by owning security system;
- loss/damage/seizure evidence reference;
- route accessibility state.

**Ownership transfer:** None.

## Amendment 27I-D - Set 26 Restricted Maritime Commerce Interface

**Reason:** Maritime blockades, piracy-linked markets and contraband voyages require a conserved economic handoff.

**27I/27H -> Set 26:**

- restricted consignment/mission ref;
- cargo owner/custodian;
- embargo/sanction tags relevant to economic planning;
- value/contract/insurance refs;
- destination/deadline;
- commercial abort thresholds.

**Set 26 -> 27I/27H:**

- port acceptance/refusal;
- voyage departure/arrival;
- physical blockade/accessibility state;
- inspection/interception/boarding outcome reference;
- cargo loss/damage/capture/seizure evidence;
- voyage delay/diversion;
- custody handoff result.

**Ownership transfer:** None.

## Amendment 27I-E - Legal/Justice Economic Enforcement Result Interface

**Reason:** 27I needs authoritative consequences without owning enforcement.

**Legal/Justice/Security -> 27I:**

- restriction legality/authority reference;
- inspection result;
- seizure/confiscation result and affected asset refs;
- fine/assessment/forfeiture reference;
- detention/incapacity result where economically relevant;
- release/appeal/reversal result;
- case visibility/publicity state where exposed.

**27I -> Legal/Justice/Security:**

- transaction/shipment/asset provenance;
- restriction coverage result;
- economic value reference;
- party/custody history;
- contract/enterprise references;
- economic consequence summary.

**Ownership transfer:** None.

# Appendix A. Restriction and Sanction Definition Template

| Field | Purpose |
| --- | --- |
| restriction_id | Stable qualified ID. |
| restriction_type | Licence/quota/embargo/sanction/prohibition/etc. |
| issuer_ref | Valid authority/source. |
| jurisdiction_refs | Spatial/institutional coverage. |
| target_actor_filters | Counterparties affected. |
| item_family_filters | Goods/resources affected. |
| service_filters | Finance/insurance/storage/transport/etc. |
| transaction_filters | Buy/sell/import/export/transit/etc. |
| quantity_limit | Optional quota/ration value. |
| exemption_refs | Valid exceptions. |
| start_time | Effective time. |
| expiry_condition | Time/event/authority condition. |
| enforcement_owner_ref | External enforcement provider. |
| knowledge_state_ref | Public/known/secret interface. |
| priority | Conflict resolution precedence. |
| status | Draft/active/suspended/expired/repealed. |
| production_status | Set 25 planning metadata. |

# Appendix B. Market-Power and Concentration Profile Template

| Field | Purpose |
| --- | --- |
| profile_id | Runtime/profile identity. |
| market_context_ref | 27C market context. |
| commodity_family_ref | Relevant good/service family. |
| evaluation_time | Last calculation. |
| seller_share_summary | Sellable stock/volume concentration. |
| production_capacity_share | Capacity concentration. |
| buyer_share_summary | Buyer/monopsony concentration. |
| infrastructure_control | Critical facility/route share. |
| exclusive_right_refs | Rights affecting contestability. |
| substitute_availability | Alternative-good band. |
| import_contestability | Route/import alternative band. |
| entry_barrier_band | Time/cost/capability to enter. |
| market_power_band | Competitive through Monopoly. |
| explanation_reasons | Human-readable causes. |
| trend | Rising/stable/falling. |

# Appendix C. Black-Market Context Template

| Field | Purpose |
| --- | --- |
| black_market_id | Persistent underground-market identity. |
| region/settlement_ref | Economic scope. |
| market_family | Goods/services covered. |
| restriction_refs | Causes of underground demand. |
| participant_refs | Known actors/roles where detailed. |
| stock_refs | Authoritative accessible stock references. |
| demand_summary | Restricted residual demand. |
| liquidity_band | Counterparty/settlement capability. |
| access_requirements | Set 28/faction/quest permissions. |
| payment_capabilities | 27B/27F settlement options. |
| route_access_summary | 27H/30/26 compatibility. |
| risk_premium_inputs | External exposure/cost bands. |
| information_confidence | Knowledge quality. |
| current_state | Forming/active/disrupted/dormant/collapsed. |
| history | Major changes/events. |

# Appendix D. Smuggling Economic Mission Template

| Field | Purpose |
| --- | --- |
| mission_id | Stable runtime identity. |
| principal_ref | Actor/enterprise commissioning mission. |
| operator_ref | Carrier/broker responsible economically. |
| shipment_ref | Parent 27H shipment/consignment. |
| cargo_lot_refs | Real item/lot references. |
| restriction_refs | Restrictions intended to be bypassed. |
| origin_ref | Origin endpoint. |
| destination_ref | Destination endpoint. |
| preferred_route_ref | Economic route option. |
| alternate_route_refs | Approved alternatives. |
| transport_execution_ref | Set 30/26 provider record. |
| expected_revenue | 27B-derived expected settlement. |
| expected_lawful_cost | Comparison baseline. |
| illicit_service_costs | Abstract intermediary/handling costs. |
| exposure_band | External risk summary. |
| expected_loss_value | Economic risk estimate. |
| contract_refs | 27E obligations. |
| finance/insurance_refs | 27F instruments if valid. |
| deadline | Commercial timing. |
| abort_thresholds | Cost/risk/deadline limits. |
| actual_outcome | Arrived/delayed/diverted/seized/lost/etc. |
| realised_profit_loss | Posted final economic result. |

# Appendix E. Economic-Conflict Event Template

| Field | Purpose |
| --- | --- |
| conflict_id | Persistent economic-conflict identity. |
| initiator_refs | Factions/authorities/coalitions. |
| target_refs | Affected actors/jurisdictions. |
| conflict_type | Embargo/sanction/resource denial/boycott/etc. |
| policy_refs | Governing restrictions. |
| strategic_good_refs | Key affected families. |
| route_refs | Affected trade corridors. |
| market_refs | Affected markets. |
| finance_refs | Restricted financial channels. |
| start_time | Activation. |
| escalation_stage | Current pressure state. |
| shortage_signals | Current material effects. |
| underground_signals | Black-market response. |
| recovery_conditions | Conditions for stabilisation/recovery. |
| end_time | Resolution when complete. |
| history | Major stage/outcome events. |

# Appendix F. Initial Reason-Code Catalogue

| Reason Code | Meaning |
| --- | --- |
| `restrict.not_applicable` | Restriction does not cover this action/context. |
| `restrict.active` | Applicable active restriction blocks/limits action. |
| `restrict.licence_required` | Required licence/permission missing. |
| `restrict.quota_exceeded` | Authorised quantity limit exhausted. |
| `restrict.counterparty_sanctioned` | Proposed counterparty is covered by sanction. |
| `restrict.import_embargoed` | Import is blocked by active embargo. |
| `restrict.export_embargoed` | Export is blocked by active embargo. |
| `restrict.transit_denied` | Transit through jurisdiction is not authorised. |
| `restrict.exemption_valid` | Valid exemption allows covered transaction. |
| `restrict.exemption_invalid` | Exemption missing, expired or outside scope. |
| `market_power.concentrated` | Market alternatives are limited. |
| `market_power.dominant_supplier` | One supplier has dominant practical control. |
| `market_power.imports_contestable` | Imports materially constrain dominance. |
| `market_power.substitute_available` | Substitute limits market power. |
| `black_market.no_restricted_demand` | No meaningful underground demand exists. |
| `black_market.no_supply` | No real accessible stock/supplier. |
| `black_market.no_counterparty` | No willing buyer/seller/intermediary. |
| `black_market.no_liquidity` | Market cannot settle meaningful transaction. |
| `black_market.access_denied` | Required underground/social access unavailable. |
| `black_market.low_confidence` | Information is stale/uncertain. |
| `smuggling.no_shipment` | No valid underlying shipment/consignment. |
| `smuggling.transport_unavailable` | No compatible Set 30/26 transport execution. |
| `smuggling.exposure_too_high` | Actor policy rejects current expected exposure. |
| `smuggling.margin_too_low` | Expected reward does not cover costs/risk. |
| `smuggling.departed` | Authoritative transport departure confirmed. |
| `smuggling.delayed` | Transport/provider reports delay. |
| `smuggling.seized` | External enforcement owner confirms seizure. |
| `smuggling.arrived` | Transport/provider confirms destination arrival. |
| `economic_conflict.shortage_rising` | Restriction/disruption is worsening shortage. |
| `economic_conflict.alternative_supply` | New substitute/import/capacity reduces pressure. |
| `economic_conflict.recovery_active` | Market/access restoration is progressing. |
| `economic_conflict.progression_fallback_required` | Restriction threatens required capability reachability. |
| `economic_conflict.authority_denied` | Requester lacks policy/company authority. |
| `economic_conflict.reconciliation_failed` | Detailed and summary economic state cannot reconcile safely. |

# Appendix G. Cross-System Interface Matrix

| System | Supplies to 27I | Receives from 27I |
| --- | --- | --- |
| 27B | value, price, currency/exchange | market-power, restriction, illicit-risk modifier signals |
| 27C | stock, demand, merchant liquidity, market contexts | restricted availability, underground context, concentration overlays |
| 27D | enterprises, ownership, capacity, labour | dominance/cartel/exclusive-role economic state |
| 27E | contracts/obligations/performance | restriction/covert classification and economic-conflict evidence |
| 27F | finance/insurance/account outcomes | sanction/illicit-finance access signals and risk evidence |
| 27G | tariffs/customs/licences/treasury policy | evasion/black-market pressure and conflict effects |
| 27H | routes/shipments/expected arrivals | embargo/covert-route overlay and restricted mission context |
| Set 28 | trust, secrecy, willingness, betrayal/information outcomes | economic incentives/outcomes/history |
| Set 29 | essential-demand/health/workforce signals | shortage/availability/relief economic state |
| Set 30 | terrestrial travel/capacity/outcome | restricted shipment mission context |
| Set 26 | maritime access/voyage/interception/blockade outcomes | contraband/embargo economic context |
| 13/Governance | authority, treaty, diplomacy, policy legitimacy | economic pressure/consequence summaries |
| Justice/Security/16 | inspection, seizure, arrest, combat/closure outcomes | provenance/value/restriction context |
| 15 | quest/event state | economic-conflict objective and consequence events |
| 07/20 | settlement needs, reserves, facilities | shortage/access/recovery effects |
| Set 25 | schemas, IDs, capabilities, validation | governed restricted-economy definitions/relationships |

# Appendix H. 27I Completion Checklist

- [x] Adopted Sets 27-30 Cross-Set Interface Register v1.0.
- [x] Preserved Set 28 ownership of trust, secrecy, persuasion and betrayal.
- [x] Preserved Set 29 ownership of survival/health effects.
- [x] Preserved Set 30 ownership of terrestrial movement and physical route execution.
- [x] Preserved Set 26 ownership of maritime operations, piracy, naval interception and blockade execution.
- [x] Preserved justice/governance ownership of legality, inspection, seizure, arrest and punishment.
- [x] Defined contextual market power, monopoly, concessions and cartel economics.
- [x] Defined embargo, sanction, quota, ration and restricted-market economic effects.
- [x] Defined black-market formation from real demand, supply, access and liquidity.
- [x] Defined smuggling economic missions without duplicating movement/detection mechanics.
- [x] Defined fencing/intermediary roles and illicit liquidity.
- [x] Defined strategic-resource denial and economic warfare boundaries.
- [x] Defined shortage, substitution, de-escalation and recovery.
- [x] Connected 27B pricing without duplicating the price engine.
- [x] Connected 27C stock/demand/liquidity without duplicate inventory.
- [x] Connected 27D enterprises and ownership.
- [x] Connected 27E contracts and delivery obligations.
- [x] Connected 27F financial access, insurance and claim outcomes.
- [x] Connected 27G tariffs/customs/licences/public finance.
- [x] Connected 27H shipments/routes/expected arrivals.
- [x] Defined simulation LOD, persistence and reconciliation.
- [x] Defined multiplayer authority and anti-exploit invariants.
- [x] Proposed Set 25 schema/relationship families.
- [x] Added 20 deterministic validation scenarios.
- [x] Added cross-set amendments for Sets 28-30, Set 26 and legal/justice handoff.

---

**Document 27I Status:** Complete v0.1 design foundation.  
**Next Document:** **27J - Economy UI, Simulation LOD, Multiplayer, Registries and Integration**
