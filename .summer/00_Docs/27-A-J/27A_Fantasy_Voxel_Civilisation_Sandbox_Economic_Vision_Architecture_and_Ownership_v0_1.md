# FANTASY VOXEL CIVILISATION SANDBOX

## DOCUMENT SET 27

# 27A - Economic Vision, Architecture and Ownership

*Version 0.1 - Economy Foundation, Ownership and Integration Draft*

A governing foundation for a physical, regional, simulation-driven economy in Leyforge where resources, labour, trade, contracts, settlements, factions, transport and player choices create understandable value without reducing the living world to a spreadsheet or allowing abstract wealth to bypass real goods and services.

**Project Lead and Final Authority: Ash**

Architecture, systems planning, documentation and production support: GPT-5.6 Sol

---

> **Economic System Statement**
>
> Leyforge's economy must emerge from the same living world the player can mine, build, automate, defend and reshape. Goods have value because people, settlements, workshops, projects, armies, mages, travellers and industries can actually use them. Markets respond to real production, stock, consumption, access, risk, law, culture and information. Merchants cannot sell unlimited invisible stock, settlements cannot fund projects from nonexistent money, caravans cannot complete journeys without valid transport, and distant simulation cannot create or destroy wealth merely because the player was absent. The system should be deep enough to support traders, rulers, industrialists, smugglers and regional powers while remaining readable enough that a player can understand why a price, shortage, contract or settlement budget changed.

| Field | Locked Direction |
| --- | --- |
| Document Set | This is Document 27A in Document Set 27: Economy, Trade and Commerce. |
| Document Scope | Locks the economic vision, authority boundaries, terminology, source-of-truth model, physical-economy rules, record architecture, cross-set interfaces, simulation philosophy, production integration, risks, validation principles and handoff to specialist Documents 27B-27J. |
| Core Philosophy | Economic value comes from use, scarcity, production cost, access, risk, law, culture, information, timing and alternatives. Currency simplifies exchange but does not replace physical goods, labour, services or obligations. |
| Physical Economy Direction | Items, resources, storage, production, deliveries, maintenance and construction remain authoritative. Economic summaries derive from those truths; they do not silently mint goods. |
| Market Direction | Markets are local or regional state, not one global price table. Prices may vary by settlement, route, culture, law, season, danger, expected arrivals and current shortages while remaining explainable. |
| Merchant Direction | Merchants use owned or contractually available stock, economic policies and bounded planning. Personality, trust and relationship interpretation are consumed from Set 28 rather than redefined here. |
| Labour Direction | Labour has capacity, time, skill, schedule, compensation and opportunity cost. Set 27 owns wages and economic employment terms; NPC identity, social relationships and detailed task behaviour remain in their existing owners. |
| Contract Direction | Economic obligations are persistent records tied to real parties, goods, services, destinations, deadlines, ownership and outcomes. Quests may present contracts but do not become the economic source of truth. |
| Public Finance Direction | Taxes, tolls, tariffs, public budgets, reserves and expenditure use accountable treasury records. Buildings can enable services but do not generate abstract money merely by existing. |
| Trade Direction | Trade routes connect valid production, storage, market and transport endpoints. Set 30 supplies terrestrial movement and capacity; Set 26 supplies maritime transport and voyage truth. |
| Cross-Set Direction | The Leyforge Document Sets 27-30 Cross-Set Interface Register v1.0 is adopted as the governing contract. Set 27 consumes social, survival and movement interfaces without redefining them. |
| Registry Direction | All canonical definitions, instances, relationships, capabilities, packs, aliases and migrations comply with Set 25. Set 27 owns economic semantics, not the registry kernel. |
| Engine Direction | Godot with Summer Engine remains the development direction. The shipped economy is deterministic, reviewable game logic and data; Summer Engine is not a runtime economic decision-maker. |
| Production Direction | Document Set 27 defines the universal economic runtime. Production classification and release admission remain governed by Set 25; this document does not automatically place every advanced financial feature in Core Production. |
| Final Authority | Ash retains final authority over scope, canon, major economic mechanics, production tier, difficulty defaults, risk acceptance and release decisions. |
| Next Deliverable | 27B - Currency, Barter, Value and Price Formation. |

# Document Purpose

Document 27A establishes the governing vision and architecture for Leyforge's universal economy. Earlier documents deliberately reference trade, merchants, supply, demand, taxes, contracts, scarcity, caravans, markets and settlement wealth without defining one complete owner. Document Set 26 also proves that maritime commerce needs a universal economy beneath its specialised vessels, ports, fleets, tariffs and route risks. Document Set 27 closes that ownership gap.

This document does not attempt to finish every price formula, currency family, banking rule, tax schedule, wage curve or merchant strategy. Those belong to Documents 27B-27J. Instead, 27A establishes the rules those documents must not violate: physical conservation, clear ownership, local market state, persistent obligations, bounded simulation, explainability, seed independence, cross-system authority and player freedom.

The economy must support the project's four connected pillars rather than become a fifth isolated genre. Survival produces immediate needs. Civilisation creates households, services, labour and public budgets. Automation creates scalable supply and infrastructure. Fantasy RPG systems create rare goods, knowledge, factions, magical services and dimensional exchange. The economy gives those systems reasons to interact without replacing their gameplay.

A player may engage deeply as a merchant, caravan operator, producer, employer, landlord, guild leader, financier, public official, smuggler, pirate-connected trader, ruler or regional power. Another player may mostly build, explore, fight or use magic and interact with the economy only through understandable prices, requests and occasional trade. Both experiences must remain valid.

# Design Sources, Authority and Supersession

| Source | Relevant Direction | Treatment in 27A |
| --- | --- | --- |
| 00 - Master Game Design Bible | Living civilisations, trade, NPC jobs, village needs, player role freedom, automation supplying settlements and trade routes. | Establishes that economy is a civilisation-scale support system rather than a detached shop layer. |
| 01 - Core Gameplay Loop | Explore, gather, craft, build, interact, automate, defend, upgrade and expand; dedicated economy and reputation loop. | Economy must support every loop stage without imposing one required career. |
| 02 - Player Progression | Trading is a skill/progression path; players may become traders or rulers; materials remain physical and progression is multi-track. | Set 27 consumes progression hooks and exposes economic milestones without owning the overall progression system. |
| 03-06 - Blocks, Items, Recipes and Resources | Physical resources, item definitions, recipe transformations, trade tags, scarcity, culture goods, exact inputs/outputs and long-term material utility. | These remain the authoritative physical substrate of economic production and consumption. Set 27 does not redefine item/resource existence or recipes. |
| 07 - NPC Village System | Named NPCs, jobs, inventories, warehouses, needs, merchants, settlement growth, reputation and near/far simulation. | Economy consumes real settlement/NPC state and exposes prices, wages, contracts, business and market decisions. |
| 08 - Automation System | Physical logistics, power, storage, warehouse supply, permissions and distant summaries. | Automation creates and moves supply; Set 27 values and allocates it without inventing throughput. |
| 09 - Magic System | Magical resources, services, infrastructure, risk, portals and culture-specific magic. | Economic rules may value, tax, insure or trade magical goods and services but never define spell or mana mechanics. |
| 10 - Creatures and Monsters | Creature resources, livestock, threats, raids, ecology and world pressure. | Economy consumes authorised outputs, losses and risks; it does not create creature populations. |
| 11 - Biomes and World Generation | Regions, climate, roads, resource distribution, civilisation influence, seasons and dynamic world state. | Regional scarcity and trade opportunity derive from actual generated geography and state. |
| 12 - Structures | Markets, roads, warehouses, ports, ruins and other structures have ownership, damage and activation state. | Economic services require valid functional structures; appearance alone does not create market capacity. |
| 13 - Races, Peoples, Cultures and Factions | Cultures, factions, law, territory, trade preferences, governments and relationships are separate records. | Economy consumes cultural demand, law and political access; it does not encode ancestry-based economic behaviour. |
| 14 - Dimensions | Persistent realms, routes, hazards, societies and cross-realm logistics. | Set 27 supports cross-realm exchange only through valid routes, access and physical transfer. |
| 15 - Quest and Event System | Contracts, requests, shortages, markets, world events, persistent consequences and multiple solution paths. | Quests may expose economic opportunities and outcomes; the economy owns prices, payment, obligations and settlement/market state. |
| 16 - Combat, Gear and Defence | Supply lines, raids, theft, tribute, surrender, equipment demand, damage and aftermath. | Conflict changes stock, risk, insurance, budgets and routes; Set 27 does not own combat resolution. |
| 17 - UI/UX System | Trade, village, reputation, warehouse, explanation, accessibility and player-trust requirements. | Set 27 must expose explainable economic view-model data and reason codes rather than invent a competing interface architecture. |
| 19 - Settlement Growth and Player Blueprint System | Settlement stages, roads, warehouses, project costs, labour, player-founded settlements and permissions. | Economic capacity may influence growth and funding, while settlement planning and construction remain owned by 19/20. |
| 20 / 20A-20H - Buildings and Settlement Facilities | Markets, trade facilities, storage, customs, treasuries, transport, work, services and real-resource activation contracts. | Buildings provide physical/economic service capacity. Set 27 defines the economic behaviour those capabilities enable. |
| 21-23 - Forge and Presentation Sets | Editable asset source, semantic markers, UI/audio/VFX hooks and Godot authoring. | Set 27 references semantic services and presentation hooks but does not create parallel authoring systems. |
| 24A-24L - World Content Atlas | Regional resources, cultures, factions, infrastructure, economic history, scarcity and trade context. | Atlas supplies world-facing context and candidate content; Set 27 provides executable economic rules. |
| 25A-25L - Production Governance and Registry Spine | Stable IDs, field ownership, schemas, relationships, capabilities, packs, validation, migrations, production tiers and task contracts. | Governs identity and production admission. Set 27 registers economic domains/facets through Set 25 rather than creating a competing kernel. |
| 26A-26O - Maritime and Naval Expansion | Ports, cargo, maritime contracts, fleets, piracy, navies, customs, route risk and maritime economy integration. | Maritime systems consume the universal Set 27 economy while retaining ownership of vessel, voyage, port and naval mechanics. 26K/26N remain authoritative for maritime-specific execution. |
| 99 - Current Manual Testing Guide | Current POC already proves authoritative stock, warehouses, exact deliveries, persistent settlements, roads and physical logistics. | Used as implementation evidence that physical inventory, transactions and settlement state already exist and can support future economic layers. |
| Leyforge Sets 27-30 Cross-Set Interface Register v1.0 | Explicit ownership split for economy, social systems, survival and movement. | Adopted as the governing contract for parallel authoring. |

> **Supersession Rule**
>
> Any earlier text that describes economy only as a future system, assumes one universal price, implies unlimited merchant stock, or permits economic results without authoritative goods, labour, service capacity or ownership is superseded by Document Set 27 once the relevant specialist document is approved. Earlier documents retain ownership of their physical, social, combat, settlement, quest, movement and world systems.

# Static Table of Contents

1. Locked Economic System Identity  
2. Decision Status, Design Principles and Player Promise  
3. Scope and Explicit Non-Goals  
4. Source-of-Truth and Ownership Boundaries  
5. Cross-Set Interface Contract for Sets 27-30  
6. Canonical Economic Terminology  
7. Economic Architecture and Simulation Layers  
8. Record Architecture and Definition/Instance Separation  
9. Physical Economy, Conservation and Economic Truth  
10. Value, Utility and Price Architecture  
11. Currency and Barter Foundation  
12. Market, Supply, Demand and Information Foundation  
13. Merchants, Enterprises and Economic Decision Boundaries  
14. Labour, Wages, Households and Business Boundaries  
15. Contracts, Obligations and Enforcement Architecture  
16. Finance, Credit, Insurance and Public-Finance Boundaries  
17. Trade Routes, Logistics and Spatial Economy  
18. Regulated, Restricted and Illicit Economy Boundary  
19. Settlement, Faction and Regional Economic Integration  
20. Production, Automation and Resource-Progression Integration  
21. Quest, Event and World-History Integration  
22. Social, Reputation and Negotiation Integration  
23. Survival, Health and Consumption Integration  
24. Movement, Vehicles, Caravans and Transport Integration  
25. Maritime and Document Set 26 Integration  
26. Player Roles, Progression and Economic Career Paths  
27. Difficulty, Accessibility and Peaceful-Economy Settings  
28. Simulation LOD, Distant Economy and Reconciliation  
29. Multiplayer Authority, Ownership and Auditability  
30. UI/UX, Explainability and Player Trust  
31. Set 25 Registry, Schema, Relationship and Pack Contracts  
32. Godot/Summer Engine Technical Direction  
33. Validation Invariants, Reason Codes and Acceptance Scenarios  
34. Document Set 27 Map and Production Sequence  
35. Risks, Redesign Triggers and Scope Controls  
36. Open Decisions for Documents 27B-27J  
37. Cross-Set Interface Amendments  
- Appendix A. Economic Record Family Map
- Appendix B. Cross-System Interface Matrix
- Appendix C. Initial Economic Reason-Code Catalogue
- Appendix D. 27A Completion Checklist

# 1. Locked Economic System Identity

The Economy, Trade and Commerce system is the exchange, allocation, obligation and public-finance layer of Leyforge's living world. It answers how physical goods, labour, services, access, risk and information acquire economic meaning; how settlements and people decide what to produce, consume, store, buy, sell, import or protect; how obligations persist; and how regional conditions become understandable opportunities or shortages.

> **Locked Rule**
>
> Economic state must be caused by authorised world state. A market may summarise value, but it may not become a second inventory. A treasury may authorise spending, but it may not create construction materials. A contract may promise delivery, but it may not teleport cargo. A merchant may quote a price, but that quote does not prove stock exists. A distant simulation may aggregate transactions, but it must reconcile to conserved quantities, legitimate monetary sources/sinks and persistent ownership.

## 1.1 Economic Design Promise

A player should be able to ask an economic question and receive a useful answer:

- Why is iron expensive here?
- Why will this merchant not buy more grain?
- Why is the town treasury short of money even though the market is busy?
- Why did caravan insurance rise?
- Why did wages increase after a raid?
- Why can this settlement export timber but must import medicine?
- Why is a road repair economically urgent?
- Why did a blockade affect one town more than another?
- Why did an automated mine make a local good cheaper but increase demand for fuel and repairs?

The answer should trace back to visible or inspectable causes such as stock, production, consumption, labour, route access, law, expected arrivals, losses, demand, scarcity, quality, trust, contract commitments or policy.

## 1.2 Economic Identity Layers

| Layer | Design Meaning | Player-Facing Result |
| --- | --- | --- |
| Physical Production | Goods originate from gathering, farming, creatures, crafting, machines, services or authorised renewable sources. | Valuable goods feel connected to the world rather than spawned by shops. |
| Ownership and Custody | Items, money, cargo, buildings and obligations have owners or authorised custodians. | Theft, trade, contracts, inheritance and public stock have coherent consequences. |
| Consumption and Use | Households, settlements, projects, fleets, workshops, rituals and services consume real goods or capacity. | Demand comes from understandable needs. |
| Exchange | Barter, currency, contracts and services let actors trade unequal goods over time and distance. | Trading is useful without becoming mandatory. |
| Markets | Local/regional markets aggregate offers, needs, expectations and recent transactions. | Prices vary meaningfully without being random. |
| Labour | Work consumes time, skill and availability and can be compensated in money, goods, shares, privileges or obligations. | Economic growth depends on people and capacity, not only raw resources. |
| Public Finance | Governments/settlements may collect revenue and fund services, infrastructure, defence and relief. | Civilisation has an accountable material and financial backbone. |
| Risk and Finance | Credit, insurance, deposits and reserves shift timing and risk rather than create free value. | Advanced trade becomes strategic without replacing physical preparation. |
| Spatial Economy | Roads, caravans, ports, ships, portals and hazards change access and cost. | Geography matters to prosperity and scarcity. |
| Political Economy | Law, rights, tariffs, monopolies, embargoes and conflict alter who may trade and at what cost. | Factions and governance influence markets without hard-coded moral labels. |
| Economic Memory | Prices, contracts, losses, debts, shortages, investments and public decisions leave history. | The economy reacts to what actually happened. |

## 1.3 Player Freedom

Set 27 must support at least the following valid play identities without treating one as the intended path:

- casual buyer/seller;
- village supplier;
- specialist crafter;
- travelling merchant;
- caravan operator;
- warehouse/logistics manager;
- industrial producer;
- employer or workshop owner;
- landlord or property operator where later systems permit it;
- guild participant or leader;
- lender or insurer in advanced settings;
- public treasurer, mayor, ruler or faction official;
- smuggler, fence or black-market trader where law permits the gameplay path;
- conqueror extracting tribute or controlling trade, with political consequences;
- peaceful builder who mostly ignores deep economy management.

# 2. Decision Status, Design Principles and Player Promise

## 2.1 Source-Derived Locks

The following directions are already strongly established across the project and are treated as locked foundations rather than new optional proposals:

- Villages and NPCs use real inventories and stored resources.
- Automation conserves resources and may feed settlement warehouses.
- Resources have multiple long-term uses, including trade and strategic value.
- Scarcity and cultural preference can affect value.
- NPCs may be merchants, traders, producers, consumers, specialists and labourers.
- Settlements have markets, trade facilities, treasuries, roads, storage and customs-related infrastructure.
- Quests/events may arise from shortages, contracts, blocked routes and economic disruption.
- Reputation and permissions affect access to trade and services.
- World generation creates regional differences in resources, routes, cultures and hazards.
- Multiplayer gameplay uses an authoritative world-state model.
- Distant simulation is abstract but must preserve important quantities and consequences.
- Set 25 owns canonical identities, schemas, packs, validation and production status.
- Set 26 owns maritime movement, vessels, ports, fleets, piracy/naval execution and maritime-specific route mechanics.

## 2.2 Foundational Set 27 Resolutions

The following are approved architectural resolutions for Document Set 27 unless later specialist documents identify a contradiction requiring Ash's approval:

1. **No universal global price table.** Definitions may carry reference/value metadata, but executable prices are contextual.
2. **No infinite merchant stock by default.** Shops trade owned stock, commissioned stock, service capacity or clearly declared abstract categories backed by valid providers.
3. **No ghost currency.** Monetary balances require authorised sources, transfers and sinks. Debug/admin grants are explicitly non-diegetic.
4. **No ghost labour.** Wages and production cannot claim labour that is not represented by valid worker/service capacity.
5. **No ghost trade routes.** Route-based commerce requires valid endpoints and transport capability.
6. **No hidden per-frame macroeconomy.** Economic state changes at bounded event/tick scales suited to settlement simulation.
7. **Explainability over perfect realism.** A coherent reason code and trend is more valuable than an opaque econometric model.
8. **Local truth, regional summary.** Detailed local inventories and offers can aggregate into regional trends, never the reverse without a valid allocation process.
9. **Multiple exchange forms.** Currency, barter, in-kind payment, shares, obligations and service exchange are permitted.
10. **Advanced finance is optional depth.** Banking, credit and insurance may be gated by settlement/culture capability and world settings rather than required everywhere.

## 2.3 Economic Design Principles

- Physical resources matter.
- Older materials remain economically useful through persistent demand, maintenance, construction, culture and substitution.
- A shortage should create opportunities and consequences, not only punishment.
- Local abundance should be valuable as comparative advantage, not make a good worthless forever.
- Price changes should be bounded enough that players can plan.
- Economic information has provenance, age and confidence.
- Distant markets should not know hidden inventories automatically.
- Economic AI should use bounded heuristics, not unrestricted optimisation.
- Public finance should create visible trade-offs between services, reserves, defence, projects and relief.
- Players should be able to automate routine commerce without automating away all interesting decisions.
- Failure should usually create recoverable world state, follow-up opportunities and visible consequences.

# 3. Scope and Explicit Non-Goals

## 3.1 In Scope for Document Set 27

Set 27 owns the universal runtime rules for:

- currency and monetary exchange;
- barter and valuation;
- contextual pricing;
- market state and market memory;
- merchant economic behaviour;
- supply and demand;
- producer/consumer economic roles;
- labour compensation and wage economics;
- business and enterprise economics;
- contracts, deposits, payment obligations and breach economics;
- loans, credit and debt;
- banking/service finance where enabled;
- insurance and risk transfer where enabled;
- taxes, tolls, tariffs, tribute and public revenue;
- treasuries, public budgets and reserves;
- trade-route profitability;
- caravan economic planning and terrestrial trade abstraction;
- imports, exports and regional specialisation;
- settlement wealth and economic resilience;
- economic shocks, shortages, surpluses and recovery;
- monopolies, market concentration and economic access restrictions;
- black markets, fencing and smuggling economics;
- economic AI and simulation LOD;
- transaction authority and economic auditability;
- economy-facing registries, relationships, view-models and reason codes.

## 3.2 Explicit Non-Goals

Set 27 does not own:

- dialogue, friendship, romance or social memory mechanics;
- the underlying reputation system outside economic modifiers;
- NPC schedules, pathfinding or animation;
- hunger, disease, injury, fatigue or health rules;
- locomotion, mount handling, wagon physics or ship sailing;
- inventory implementation, item definitions or recipe transformations;
- construction mechanics or settlement-stage ownership;
- combat, theft execution, capture or law-enforcement combat;
- quest objective logic;
- culture, faction, government or legal identity definitions;
- maritime vessel, fleet, port or naval mechanics owned by Set 26;
- unrestricted real-world macroeconomic simulation;
- stock exchanges, derivatives or speculative instruments unless later approved as a specific fantasy/civilisation feature;
- mandatory daily accounting for every ordinary player;
- one fully simulated wallet/ledger for every distant background NPC when household/settlement aggregation gives the same gameplay result.

## 3.3 Complexity Boundary

The target is **deep systemic economy, not accounting software**. Complexity is admitted when it creates at least one of the following:

- meaningful player choice;
- visible settlement behaviour;
- trade or production opportunity;
- strategic infrastructure value;
- faction/political consequence;
- story/event generation;
- clearer balancing or anti-exploit control;
- meaningful specialisation;
- persistent world memory.

Complexity that exists only to imitate real bookkeeping should be simplified, aggregated or omitted.

# 4. Source-of-Truth and Ownership Boundaries

| Question | Owning Authority | Set 27 Responsibility |
| --- | --- | --- |
| What items/resources exist? | 03-06 and Set 25 catalogues. | Reference qualified IDs, economic facets and authorised quantities. |
| How are goods produced or transformed? | Recipes, automation, farming, creatures, magic and relevant owners. | Consume output/cost/throughput and translate it into supply/cost pressure. |
| What does a household or settlement physically need? | NPC/settlement systems and Set 29 for player/survival health inputs. | Convert valid needs and policies into economic demand. |
| What social relationship exists between buyer and seller? | Set 28 / existing reputation owners. | Consume trust, negotiation and access modifiers. |
| How does the player or caravan physically travel? | Set 30. | Calculate economic route choice/profit using provided time, capacity, accessibility and condition. |
| How does a ship sail or carry cargo? | Set 26. | Use maritime capacity, voyage and route outputs to calculate universal economic effects. |
| What does a market building provide? | 20/20B and runtime structure activation. | Use its valid service capacity for market access, stalls, storage and transaction throughput. |
| Who legally controls a territory? | Faction/government/law systems. | Apply economic rules such as tariff, tax, permit, embargo or contraband status. |
| What is the price here now? | Set 27. | Own contextual quote, transaction price, spread, market memory and explanation. |
| What is a wage or employment payment? | Set 27. | Own compensation valuation and economic employment terms. |
| What is a loan, debt or insurance claim? | Set 27. | Own financial obligation, payment and resolution rules. |
| What is a quest contract? | Quest system presents objective/state; Set 27 owns economic obligation where the agreement is economic. | Provide contract instance, payment, escrow/deposit and economic breach results. |
| How is a theft/raid physically resolved? | Combat, crime/law, NPC or event owner. | Consume authoritative loss/ownership change and update economic consequences. |
| How is money shown to the player? | Set 17 UI/UX presentation architecture. | Provide view-models, reasons, history and actions. |
| How are IDs/schemas/packs governed? | Set 25. | Register economic schemas/facets and comply with field ownership. |

> **Ownership Test**
>
> If a rule answers **what something is worth, what is owed, how exchange is authorised, how economic actors allocate scarce goods, or how a settlement/region financially reacts**, Set 27 usually owns it. If the rule answers **how the good is produced, how the person feels, how the body survives, how the vehicle moves, how the battle resolves or what the culture/law is**, another owner supplies the truth.

# 5. Cross-Set Interface Contract for Sets 27-30

Document Set 27 formally adopts the Leyforge Document Sets 27-30 Cross-Set Interface Register v1.0.

## 5.1 Set 27 -> Set 28 Economic Outputs

Set 27 exposes:

- price quote and valid duration;
- acceptable payment forms;
- merchant/business stock and service availability;
- wage/compensation offer;
- contract terms and economic obligations;
- credit/debt standing where known to the interacting party;
- economic access/permit status;
- trade opportunity and shortage context;
- economic consequences of negotiation outcomes.

Set 28 decides how characters communicate, persuade, trust, threaten, befriend or refuse. It must not independently recalculate market prices or create merchant stock.

## 5.2 Set 28 -> Set 27 Social Inputs

Set 27 may consume:

- trust;
- relationship state;
- fear/loyalty where economically relevant;
- negotiation/persuasion result;
- merchant personality/economic preference modifiers;
- social reputation/access;
- companion employment/contract acceptance.

Set 27 translates these into bounded economic modifiers. It does not redefine their social meaning.

## 5.3 Set 27 -> Set 29 Economic Outputs

Set 27 exposes:

- food/medicine availability and prices;
- service cost;
- shortage state;
- household/settlement purchasing ability;
- emergency relief budget;
- economic consequences of workforce downtime.

## 5.4 Set 29 -> Set 27 Survival Inputs

Set 27 may consume:

- food consumption requirements;
- medical-resource demand;
- illness/injury workforce availability;
- recovery time/capacity;
- survival-driven demand changes.

Set 27 does not decide health severity, hunger thresholds or treatment rules.

## 5.5 Set 27 -> Set 30 Economic Outputs

Set 27 exposes:

- cargo ownership;
- cargo priority;
- contract destination/deadline;
- route toll/customs obligation;
- caravan job;
- transport budget;
- trade-route demand and expected cargo.

## 5.6 Set 30 -> Set 27 Movement Inputs

Set 27 may consume:

- cargo capacity;
- passenger capacity;
- current/expected travel time;
- route accessibility;
- terrain traversal cost;
- vehicle/mount condition;
- movement mode;
- breakdown/delay state;
- range and required stops where relevant.

Set 27 does not define acceleration, steering, stamina use, mounting or pathfinding.

## 5.7 Interface Versioning Rule

Cross-set interfaces use stable semantic names and versioned contracts. A consuming set may request additional fields through the **Cross-Set Interface Amendments** section but may not silently reinterpret an existing field. Any ownership transfer requires explicit Ash approval.

# 6. Canonical Economic Terminology

| Term | Definition |
| --- | --- |
| Economic Actor | Player, NPC, household, business, settlement, faction, guild, public authority or other entity authorised to own, trade, owe or allocate economic value. |
| Economic Account | Authoritative monetary/obligation record for one actor or institution; not automatically equivalent to an inventory. |
| Currency Definition | Definition of a recognised medium of exchange, denomination family or ledger unit and its acceptance rules. |
| Wallet / Purse | Physical or account representation of currency owned by an actor. |
| Barter Offer | Proposed exchange of goods/services/obligations without requiring a common currency settlement. |
| Reference Value | Non-authoritative balancing or informational baseline used as one input to valuation; never the universal transaction price. |
| Price Quote | Time-bounded offer to buy/sell/provide a specified quantity under stated conditions. |
| Transaction Price | Actual value exchanged after an authorised transaction commits. |
| Market | Economic service/context connecting eligible buyers, sellers, goods, information and rules within a defined scope. |
| Market State | Current supply, demand, recent transactions, expected arrivals, restrictions, capacity and confidence for a market scope. |
| Market Memory | Bounded history of recent prices, volumes, shortages, surpluses and shocks used for trends and expectation. |
| Commodity Facet | Economic classification attached to an authorised item/resource/service family for market behaviour; it does not create the physical good. |
| Supply | Quantity/service capacity legitimately available or expected for an economic scope under known access rules. |
| Demand | Quantity/service capacity desired by valid consumers, projects, actors or policies at relevant value ranges. |
| Shortage | Demand materially exceeds accessible supply/reserve within a defined time horizon. |
| Surplus | Accessible supply materially exceeds current/near-term demand and reserve targets. |
| Merchant | Economic actor or profession authorised to buy, sell, broker or provide services using owned/commissioned capacity. |
| Enterprise | Persistent economic organisation owning assets, contracts, accounts, stock and policies. |
| Business Site | Valid structure/service endpoint used by an enterprise; the business record and building are not the same object. |
| Household | Economic grouping used for shared consumption, income, housing and reserves where individual accounting is unnecessary. |
| Wage | Compensation owed for labour/service capacity under employment or task terms. |
| Contract | Persistent agreement defining parties, obligations, consideration, conditions, deadlines, permissions and outcomes. |
| Deposit / Escrow | Value reserved or transferred under a contract pending stated conditions. |
| Debt | Persisting obligation to deliver value in the future. |
| Credit | Permission/capacity to incur debt under bounded terms. |
| Insurance / Risk Agreement | Contract that redistributes defined economic loss risk for consideration, evidence and exclusions. |
| Tax | Compulsory public revenue rule applied by a legitimate authority under current law/policy. |
| Tariff | Public charge/restriction tied to imported/exported goods or trade crossing a jurisdictional boundary. |
| Toll | Charge for access/use of a route, bridge, gate, port, service or controlled infrastructure. |
| Tribute | Politically imposed transfer that may arise from conquest, protection, treaty or coercion. |
| Treasury | Authoritative public account and reserve record for a settlement, faction or government. |
| Public Budget | Allocated treasury plan for services, projects, defence, relief, wages and reserves. |
| Trade Route | Persistent economic relationship between valid origin/destination market or logistics endpoints, with transport interfaces and current conditions. |
| Caravan | Terrestrial trade/transport operation whose physical movement is owned by Set 30 and economic mission/obligation is owned by Set 27. |
| Import / Export | Goods/services entering or leaving an economic scope through authorised exchange. |
| Economic Shock | Significant change to supply, demand, access, risk, law, production or expectations that alters economic state. |
| Economic Resilience | Ability of an actor/settlement/region to absorb shortages, losses or route disruption using reserves, substitutions, local production, alternative routes and finance. |
| Settlement Wealth | Derived profile of accessible assets, productive capacity, income, reserves, liabilities and service resilience; not one magical money score. |
| Black Market | Economic network enabling restricted or concealed exchange under specific legal/social conditions. |
| Economic Reason Code | Stable machine-readable explanation for a price, refusal, shortage, contract outcome, budget decision or transaction failure. |

# 7. Economic Architecture and Simulation Layers

The economy uses layered state so a nearby market stall can be physically grounded while distant regions remain computationally bounded.

| Layer | Owns / Represents | Example |
| --- | --- | --- |
| Definition Layer | Currency, commodity facets, contract templates, market profiles, tax rules, enterprise profiles, economic capability interfaces. | `economy.currency.*`, `economy.contract.freight.*` |
| Physical State Layer | Inventories, items, production, structures, routes, workers, vehicles and authoritative world state owned by their domains. | 42 iron ingots in Warehouse A. |
| Economic Runtime Layer | Accounts, offers, prices, reservations, contracts, debts, budgets, market state, enterprise policies. | Market offers 18 ingots at current ask price. |
| Local Market Layer | Detailed offers, local inventories, known buyers/sellers, transaction history and service capacity. | Town market / blacksmith district. |
| Settlement Summary Layer | Aggregated household consumption, business production, public finance, reserve targets and labour bands. | Town food reserve 9 days; construction labour tight. |
| Regional Layer | Trade flows, comparative surplus, access, route risk, expected arrivals and political restrictions. | Northern timber surplus feeding three towns. |
| Historical Layer | Major prices, shortages, contract breaches, bankruptcies, policy changes, trade disruptions and recovery. | Iron shock after mine collapse. |
| Presentation Layer | Player-facing quotes, trends, warnings, reasons and forecasts. | "Price high: low stock + guard rearmament + delayed caravan." |

## 7.1 Event-Driven Processing

The economy should react primarily to meaningful events and bounded scheduled updates rather than every actor recalculating every frame.

Representative events include:

- inventory quantity changed;
- production batch completed;
- household/settlement consumption batch processed;
- project reserved/released stock;
- merchant restocked or sold stock;
- contract created, accepted, delivered, breached or expired;
- wage period processed;
- route opened/closed;
- caravan departed/arrived/lost/delayed;
- raid or disaster destroyed stock;
- law/tax/tariff changed;
- settlement stage or market capability changed;
- public budget allocated;
- loan payment due/paid/missed;
- insurance claim accepted/rejected;
- significant market threshold crossed.

# 8. Record Architecture and Definition/Instance Separation

| Record Family | Purpose | Authority / Mutability |
| --- | --- | --- |
| Currency Definition | Denomination, acceptance, physical/ledger representation, issuer and constraints. | Versioned definition. |
| Currency Holding / Account | Owned quantity/balance and transaction history. | Persistent runtime state. |
| Commodity Economic Facet | Market tags, substitution group, reference value metadata and handling constraints. | Versioned extension facet referencing physical definitions. |
| Market Profile | Rules/capabilities for a market service or market type. | Versioned definition. |
| Market Instance | World-bound market participants, offers, state, capacity, memory and current modifiers. | Persistent runtime/generated state. |
| Price Quote | Actor, good/service, direction, quantity band, price, expiration, conditions and reason factors. | Ephemeral/persistent short-lived runtime record. |
| Trade Order / Offer | Intent to buy/sell/exchange under limits and access rules. | Runtime record. |
| Economic Transaction | Authoritative transfer of money/goods/services/rights with parties and provenance. | Immutable history event plus affected mutable state. |
| Enterprise Definition/Profile | Reusable policy/capability template. | Versioned definition. |
| Enterprise Instance | Ownership, sites, accounts, workers, stock, contracts, policies and history. | Persistent runtime state. |
| Household Economic Summary | Aggregated income, consumption, reserves and obligations where appropriate. | Persistent settlement/NPC-economic summary. |
| Employment Agreement | Role, employer, worker/service, wage/compensation, term and obligations. | Persistent runtime contract. |
| Contract Definition | Reusable economic agreement template and validation. | Versioned definition. |
| Contract Instance | Parties, obligations, consideration, deposits, deadlines, state, breach and history. | Persistent runtime state. |
| Debt / Credit Record | Principal/value owed, terms, creditor/debtor, collateral/guarantee and status. | Persistent runtime state. |
| Risk / Insurance Agreement | Covered subject, risks, premium/contribution, evidence and payout conditions. | Persistent runtime state. |
| Tax / Tariff / Toll Rule | Authority, basis, scope, rate/form, exemptions and destination treasury. | Policy/definition/runtime government state. |
| Treasury Record | Public funds, reserves, restricted funds, revenue and expenditure history. | Persistent runtime state. |
| Public Budget | Approved allocation of treasury resources for a period/project/service. | Persistent policy/runtime record. |
| Trade Route Economic Record | Origins, destinations, cargo classes, historical volume, expected cost, demand, route interface and risk. | Persistent generated/runtime state. |
| Caravan Economic Mission | Cargo/contract, transport references, budget, escorts/services, schedule and economic outcome. | Persistent runtime state; movement reference is external. |
| Economic Shock Record | Cause, scope, affected markets, duration/decay and history. | Runtime/event state. |
| Settlement Economic Profile | Derived production, consumption, labour, wealth/resilience, trade and public-finance summary. | Calculated/persisted summary. |

> **Definition/Instance Rule**
>
> A "merchant", "market", "bank", "guild", "currency" or "contract type" definition is not the mutable state of one world instance. Set 27 follows Set 25's separation between canonical definitions, generated bindings and persistent runtime records.

# 9. Physical Economy, Conservation and Economic Truth

## 9.1 Conservation Invariants

The following are hard invariants unless an explicit magical/system rule owns a documented exception:

- selling an item transfers ownership or consumes a valid service output;
- buying an item transfers legitimate currency/value and creates no duplicate stock;
- producing goods requires the inputs and process owned by the production system;
- market supply cannot exceed accessible/committed stock plus clearly flagged expected supply;
- a contract reservation cannot be spent twice;
- taxes move value to a treasury or authorised sink; they do not vanish without accounting classification;
- public spending debits treasury/reserved funds and still requires physical project/service inputs;
- distant transactions reconcile to valid source/destination aggregates;
- loans transfer or create a documented debt claim against real monetary authority; they do not secretly grant untracked wealth;
- insurance payouts come from authorised reserves, pooled risk capacity, public guarantee or explicitly modelled abstract service capacity;
- salvage, loot, confiscation and theft consume/transfer physical ownership outcomes from their authoritative systems.

## 9.2 Legitimate Economic Faucets and Sinks

Not every economy can be perfectly closed, especially when currency is issued or world content is generated. Therefore Set 27 distinguishes **physical conservation** from **monetary policy**.

Legitimate monetary sources/sinks may include:

- currency minting/issuance by an authorised polity or magical institution;
- quest/story grants with an explicit issuer/source;
- starter-world grants if a world setting uses them;
- taxes and fees entering treasuries;
- service fees paid to institutions;
- destroyed/lost physical coin;
- administrative or world migration corrections;
- demurrage/decay/maintenance fees where value is paid to a legitimate actor or sink class.

Every such mechanism must declare purpose, owner, balance effect and audit class. "Because the economy needs more money" is not a runtime source.

# 10. Value, Utility and Price Architecture

Document 27A locks the factors but defers exact formulas to 27B and 27C.

## 10.1 Value Factors

Potential value inputs include:

- direct utility;
- recipe/production demand;
- settlement need demand;
- strategic/military use;
- magical/ritual use;
- construction/project demand;
- rarity and renewable rate;
- production inputs and labour;
- tool/power/fuel requirements;
- quality, condition, freshness and purity;
- local accessible stock;
- expected supply/arrivals;
- substitution availability;
- storage burden and spoilage risk;
- transport cost/time;
- danger and route risk;
- legal restriction, tax or tariff;
- culture/faction preference;
- information confidence;
- season/weather/event timing;
- buyer urgency and seller reserve policy;
- recent transactions and market memory.

## 10.2 Reference Value Is Not Price

Definitions may store a **reference value** or balancing anchor to support UI, loot balancing, AI heuristics and migration. This value is not the authoritative price everywhere.

A market quote resolves contextual value from the reference plus current economic state. Specialist documents will define how aggressively contexts may move the quote and what safeguards prevent runaway values.

## 10.3 Explainability Requirement

Every player-visible non-trivial price quote should be able to expose a compact explanation such as:

- normal local supply;
- shortage;
- strong surplus;
- cultural preference;
- poor quality;
- urgent project demand;
- route disruption;
- tariff;
- trusted-customer concession;
- contraband risk;
- bulk discount;
- stale information;
- expected shipment soon.

The player does not need to see the hidden formula unless an advanced interface is enabled.

# 11. Currency and Barter Foundation

Document 27B will determine exact currency families and exchange rules. 27A locks the following architecture:

- barter is always representable;
- currency is optional by settlement/culture/context rather than assumed universal;
- multiple currencies may coexist;
- acceptance can depend on issuer, territory, trust, purity, denomination and law;
- physical coin, token, commodity money and ledger/account representations are all technically possible under one interface;
- a currency's economic acceptance does not redefine its physical item representation;
- exchange rates, if used, are contextual economic state;
- prices can be quoted in currency, barter value, mixed payment or obligation;
- exact coin-change friction may be simplified for playability where the currency design permits;
- no culture is forced into "primitive barter" or "advanced money" based on ancestry.

# 12. Market, Supply, Demand and Information Foundation

## 12.1 Market Scope

A market may operate at several scopes:

- individual merchant stall;
- workshop/business;
- settlement market;
- district/specialist market;
- faction network;
- regional trade basin;
- cross-realm exchange hub.

These scopes may share information and goods but are not one database row.

## 12.2 Supply

Supply is based on accessible stock and service capacity, including:

- owned inventory;
- business stock;
- settlement surplus released for sale;
- scheduled/expected deliveries with confidence;
- producer capacity available for order;
- authorised imports;
- valid substitutes.

Expected supply does not become sellable physical inventory until delivery/production commits.

## 12.3 Demand

Demand may arise from:

- households;
- NPC personal needs where individually modelled;
- settlement reserves;
- construction projects;
- repair/maintenance;
- workshops/recipes;
- guard/military provisioning;
- medicine/healthcare;
- festivals/cultural practices;
- magical infrastructure;
- fleets/caravans/travel;
- quests/contracts;
- strategic stockpiling;
- speculation only if later explicitly approved.

## 12.4 Market Information

Actors should not know every market perfectly. Information may have:

- source;
- timestamp;
- geographic coverage;
- confidence;
- legal/public/private status;
- intentional misinformation flags supplied by Set 28/quest systems;
- discovery requirements.

This preserves exploration, rumours, merchant expertise and scouting as meaningful systems.

# 13. Merchants, Enterprises and Economic Decision Boundaries

## 13.1 Merchant Economic Behaviour

Set 27 owns the economic portion of merchant decisions:

- what stock is available for sale;
- reserve minimums;
- target stock bands;
- buy/sell interest;
- markup/spread policy;
- bulk limits;
- contract acceptance based on capacity;
- restocking/procurement requests;
- route/market selection;
- risk tolerance as an economic parameter;
- business cash/reserve constraints;
- response to shortages/surpluses;
- business closure or reduced service when inputs fail.

Set 28 supplies personality, trust, relationship and negotiation outcomes that may modify these policies.

## 13.2 Enterprise Boundaries

An enterprise may own:

- accounts;
- inventory;
- workshops/leases/rights;
- contracts;
- employees/service agreements;
- trade-route participation;
- equipment/vehicles through external ownership systems;
- operating policies;
- debt and insurance;
- history and reputation references.

The building does not equal the enterprise. A destroyed shop may leave the enterprise alive but unable to operate locally. A player may own a building and lease it to an enterprise if later specialist rules permit.

# 14. Labour, Wages, Households and Business Boundaries

Set 27 owns the economic terms of labour, but not NPC AI execution.

## 14.1 Labour Inputs

Economic labour planning may query:

- available worker/service capacity;
- job skill/proficiency;
- schedule availability;
- injury/illness availability from Set 29;
- location/travel burden from Set 30/NPC systems;
- legal/permission requirements;
- tools/workstation capacity;
- employer funds/compensation stock;
- worker preference/relationship constraints from Set 28.

## 14.2 Compensation Forms

Compensation may include:

- currency wage;
- food/housing provision;
- production share;
- profit share;
- piece/task rate;
- contract lump sum;
- guild entitlement;
- public service obligation;
- tribute/coercion where the world legally/politically permits it and consequences are modelled.

Set 27 must not normalise exploitative arrangements as universally neutral; legality, consent and social response come from their respective systems.

## 14.3 Household Aggregation

Distant household economics should usually aggregate repeated small income and consumption rather than simulate thousands of coin transfers. Individual named NPCs may retain personal property and important obligations where gameplay needs it.

# 15. Contracts, Obligations and Enforcement Architecture

Economic contracts exist independently of quest presentation.

## 15.1 Contract Minimum Fields

A persistent economic contract should identify:

- contract ID and type;
- parties and roles;
- offered/accepted time;
- consideration/payment;
- goods/services/rights involved;
- quantity/quality/condition requirements;
- origin/destination/site where relevant;
- deadline/window;
- custody and ownership rules;
- deposits/escrow/reservations;
- permissions/licences;
- acceptable substitution;
- partial completion rules;
- cancellation rules;
- breach conditions;
- force-majeure/event handling where used;
- dispute/enforcement owner;
- completion state;
- history/evidence.

## 15.2 Enforcement Boundary

Set 27 owns the **economic consequence definition** of breach: unpaid balance, forfeited deposit, debt, damaged commercial reputation reference, loss of access, compensation claim or contract termination.

Set 28 owns social reaction/dialogue. Law/government owners determine legal process. Combat/crime systems resolve seizure/arrest/violence. Quest systems may create follow-up objectives.

# 16. Finance, Credit, Insurance and Public-Finance Boundaries

Advanced financial systems are supported architecturally but may not all be Core Production.

## 16.1 Credit and Debt

Credit may shift payment through time but must record:

- creditor;
- debtor;
- principal/value;
- repayment form;
- schedule;
- interest/fee if used;
- collateral/guarantee;
- default state;
- transfer/assignment rules if permitted;
- legal/social consequences through external systems.

## 16.2 Banking

A bank-like institution may provide one or more capabilities:

- secure deposits;
- account transfers;
- loans;
- currency exchange;
- escrow;
- letters of credit;
- treasury services;
- insurance underwriting or brokerage.

A "bank" building only enables these capabilities when its Set 20 activation contract, staff, security, accounts and policies are valid.

## 16.3 Insurance

Insurance redistributes defined risk. It does not erase loss.

An insurance system requires:

- covered subject;
- insured value basis;
- covered risks;
- exclusions;
- premium/contribution;
- evidence standard;
- fraud/dispute hooks;
- insurer reserves/capacity;
- payout/cap rules;
- cancellation/expiration.

## 16.4 Public Finance

Public finance must connect revenue to visible services and reserves.

Potential revenue sources include:

- taxes;
- market fees;
- tolls;
- tariffs/customs;
- rents/leases;
- public enterprise income;
- fines/forfeitures from legal systems;
- tribute;
- donations;
- grants/aid;
- borrowing where enabled.

Potential expenditures include:

- public wages;
- roads/infrastructure;
- healthcare/relief;
- defence;
- repairs;
- education;
- sanitation/utilities;
- emergency reserves;
- projects;
- debt service;
- subsidies or procurement.

# 17. Trade Routes, Logistics and Spatial Economy

Geography is an economic system input.

## 17.1 Route Economic Requirements

A trade route needs:

- valid origin and destination economic/logistics endpoints;
- cargo/service class;
- accessible path or corridor;
- transport provider/capability;
- loading/unloading/storage capacity;
- travel time;
- route risk;
- law/tolls/tariffs;
- expected costs;
- demand or contractual reason to move;
- known/estimated information confidence.

## 17.2 Transport Ownership Boundary

Set 27 calculates whether moving goods is economically desirable or contractually required. It does not calculate terrestrial physics.

Set 30 owns:

- mount/vehicle movement;
- cargo/passenger physical capacity;
- route traversal;
- travel time execution;
- vehicle condition/breakdown mechanics.

Set 26 owns equivalent maritime movement and vessel interfaces.

## 17.3 Comparative Advantage Without Hard Locks

Regional resource distribution, culture, skills, climate, infrastructure and history may make some regions efficient producers of particular goods. This should encourage trade without making one seed unwinnable. Set 25 capability/fallback rules and worldgen suitability must preserve access to required progression.

# 18. Regulated, Restricted and Illicit Economy Boundary

Set 27 owns the economic mechanics of restricted exchange, while law, faction, social and combat systems own their respective execution.

Economic features may include:

- prohibited goods;
- restricted licences;
- rationing;
- controlled prices where policy exists;
- embargoes;
- sanctions;
- monopolies/concessions;
- smuggling premiums;
- concealment service cost;
- fences and black-market liquidity;
- seizure economic loss;
- bribe value interfaces without defining persuasion or legal outcome;
- contraband route risk;
- scarcity caused by enforcement.

Black markets must arise from actual restriction, demand, access and network support; they should not simply be a second shop list labelled illegal.

# 19. Settlement, Faction and Regional Economic Integration

## 19.1 Settlement Economic Profile

A settlement economic summary may derive:

- population/household demand;
- productive capacity by major family;
- labour availability;
- stock/reserve bands;
- import dependence;
- export surplus;
- market capacity;
- route access;
- public revenue/expenditure;
- treasury reserve;
- debt/obligations;
- strategic shortages;
- resilience;
- wealth/income bands;
- recent shocks and recovery.

This profile is diagnostic/decision support. It must not become the only source of physical truth.

## 19.2 Settlement Wealth

"Wealth" should be multi-factor rather than a single pile of coin. At minimum it can consider:

- liquid monetary assets;
- accessible inventories/reserves;
- productive assets/capacity;
- infrastructure and market access;
- recurring income;
- liabilities;
- emergency resilience;
- valuable rights/claims where relevant.

The final formula belongs to later documents.

## 19.3 Faction Economy

Factions may have:

- trade policy;
- preferred/strategic goods;
- treasury/budget interfaces;
- market access;
- public procurement;
- embargoes/tariffs;
- regional routes;
- economic allies/rivals;
- war/relief demand.

Set 13 defines faction identity and politics. Set 27 executes the economic side of those policies.

# 20. Production, Automation and Resource-Progression Integration

The economy must reward production without letting automation create infinite wealth.

## 20.1 Production Cost Inputs

Economic production cost may consider:

- raw inputs;
- by-products/valuable recovery;
- fuel/power/mana;
- machine/station wear;
- labour/service capacity;
- tool/maintenance cost;
- facility cost/service fees;
- transport/storage;
- failure/waste;
- taxes/fees;
- opportunity cost.

Set 27 consumes these values; it does not change recipe outputs or machine throughput.

## 20.2 Automation Market Effects

Automation may:

- increase local supply;
- reduce unit labour pressure;
- increase fuel/power/maintenance demand;
- create new specialist jobs;
- lower prices within bounded market response;
- create export surplus;
- shift route burden;
- attract traders, competitors or political interest through external systems;
- create environmental/social costs where other systems authorise them.

## 20.3 Anti-Infinite-Profit Rule

Any automated loop capable of purchasing its own inputs and selling outputs must be tested for unbounded positive feedback. Legitimate profitable industry is expected; infinite arbitrage from fixed buy/sell tables is not.

# 21. Quest, Event and World-History Integration

Economic conditions may generate or modify quests/events such as:

- shortage relief;
- delivery contract;
- procurement request;
- emergency rationing;
- market opening/festival;
- caravan escort;
- route repair;
- trade dispute;
- contract breach;
- debt collection/renegotiation;
- public budget crisis;
- monopoly challenge;
- smuggling opportunity;
- embargo/blockade consequence;
- investment/project funding;
- business failure/recovery;
- disaster insurance claim;
- regional boom or crash.

The quest system owns objective presentation and progression. The economy owns the economic state that made the opportunity exist and the committed economic outcome.

Major economic events should leave history where relevant: market closures, debt crises, destroyed caravans, restored routes, new guild halls, changed trade rights, collapsed monopolies, famine relief or public investment.

# 22. Social, Reputation and Negotiation Integration

Set 27 consumes social state through Set 28 and existing reputation systems.

Economic interactions may be modified by:

- trust;
- personal relationship;
- village/faction reputation;
- fear/loyalty where relevant;
- cultural etiquette outcome;
- negotiation success/failure;
- merchant personality modifier;
- prior contract reliability;
- known criminal/commercial status.

Set 27 must avoid double-counting. For example, if Set 28 resolves a negotiated 5% concession, Set 27 should apply that result once rather than also independently inferring friendship discounts.

# 23. Survival, Health and Consumption Integration

Set 29 supplies the authoritative survival/health drivers that affect economic demand.

Representative economic consequences include:

- food demand;
- medicine demand;
- treatment-service demand;
- worker downtime;
- productivity/service capacity changes;
- emergency relief spending;
- migration appeal through settlement systems;
- insurance/compensation claims where enabled.

Set 27 never decides whether a character is hungry, injured, ill or cured.

# 24. Movement, Vehicles, Caravans and Transport Integration

Set 30 is required for terrestrial transport execution.

Set 27 consumes:

- valid movement mode;
- route accessibility;
- cargo capacity;
- passenger capacity;
- travel duration;
- terrain/road effect;
- vehicle/mount condition;
- interruption/breakdown state;
- route closure/detour;
- operating resource requirements exposed by Set 30.

Set 27 provides:

- cargo/contract priority;
- economic route selection score;
- permissible transport budget;
- expected revenue;
- toll/tariff/fee context;
- destination demand;
- delivery deadline;
- cargo ownership/custody.

This separation allows Set 27 and Set 30 to be authored in parallel.

# 25. Maritime and Document Set 26 Integration

Document Set 26 already defines extensive maritime commerce. Set 27 must universalise the underlying economic concepts without taking maritime execution away from 26K/26N.

## 25.1 Set 26 Remains Authoritative For

- vessel cargo topology and capacity;
- voyage state;
- sea route execution;
- port calls;
- maritime manifests where vessel-specific;
- fleets and convoys;
- piracy/privateering/naval institutions;
- maritime customs inspection execution;
- blockades as maritime missions;
- vessel maintenance/crew readiness mechanics;
- maritime salvage/prize custody execution.

## 25.2 Set 27 Supplies Universal Economic Rules For

- currency/barter;
- contextual value/prices;
- general market state;
- universal contract semantics where applicable;
- wages/compensation valuation;
- taxes/tariffs/tolls economic posting;
- debt/credit/insurance;
- public treasuries;
- general enterprise/accounts;
- settlement/regional supply-demand;
- economic consequences of route disruption;
- shared transaction/audit rules.

## 25.3 Compatibility Rule

Where 26K/26N already use a maritime-specific record, Set 27 should extend or reference it rather than force destructive replacement. Integration should occur through Set 25 aliases, facets and versioned migration when necessary.

# 26. Player Roles, Progression and Economic Career Paths

Set 27 does not own player level or skill progression, but it must expose meaningful economic milestones to Document 02 and future progression revisions.

| Career Band | Example Capabilities |
| --- | --- |
| Local Trader | Buy/sell, compare nearby prices, barter, fulfil simple requests. |
| Specialist Producer | Manufacture valued goods, secure inputs, sell surplus, take supply contracts. |
| Travelling Merchant | Plan routes, carry stock, manage risk and regional price differences. |
| Caravan Operator | Use wagons/mounts, hire labour/guards, manage cargo and schedules. |
| Business Owner | Operate workshop/market/storage sites, employ labour, manage stock and cash flow. |
| Guild / Network Operator | Coordinate multiple producers/merchants, standards, contracts and shared services. |
| Financier / Risk Manager | Use credit, deposits, insurance and investment where enabled. |
| Public Official / Ruler | Set budgets, collect revenue, fund projects, manage reserves and trade policy. |
| Regional Economic Power | Shape routes, imports, exports, sanctions, infrastructure and major supply chains. |

Players may switch paths or master multiple areas; no economic class lock is introduced.

# 27. Difficulty, Accessibility and Peaceful-Economy Settings

Economic depth must be configurable without breaking world state.

Potential world/economy settings include:

- price volatility: low / standard / high;
- merchant stock pressure: relaxed / standard / strict;
- household consumption abstraction;
- wage/upkeep frequency;
- contract deadline strictness;
- debt/interest enabled/disabled/simplified;
- insurance depth;
- taxes/public-finance depth;
- spoilage-driven market volatility through Set 29/recipes;
- trade-route danger multiplier through world/combat systems;
- black-market/contraband complexity;
- automatic accounting assistance;
- price explanation detail;
- economic notification frequency.

Peaceful/creative settings may reduce scarcity and penalties while preserving trade, markets, building services, NPC roles and economic identity.

Accessibility requirements include:

- non-colour trend indicators;
- plain-language reasons;
- sortable/searchable market data;
- optional simplified profit summaries;
- warnings before high-risk credit/contract commitments;
- readable denomination formatting;
- controller-accessible trade screens;
- no requirement for rapid timing to trade successfully.

# 28. Simulation LOD, Distant Economy and Reconciliation

## 28.1 Simulation Tiers

| Tier | Economic Detail |
| --- | --- |
| Immediate / Interactive | Actual inventories, offers, merchant stock, transactions, local jobs, active contracts and nearby transport. |
| Local Settlement | Batched household consumption, business production, wage cycles, market clearing and public finance with direct physical stock references. |
| Regional Abstract | Aggregated surplus/deficit, route flows, labour bands, public reserves, expected shipments and major contracts. |
| Distant / Dormant | Bounded scheduled updates, major obligations, shocks, route outcomes and persistent summaries only. |

## 28.2 Reconciliation Invariants

Promotion/demotion between LOD tiers must preserve:

- total authoritative quantities;
- ownership;
- currency/account balances;
- reserved stock;
- contract state;
- debt;
- treasury balances;
- major market trends;
- enterprise identity;
- route cargo in transit;
- economic history significant to gameplay.

A distant settlement cannot suddenly materialise expensive inventory because the local shop needs shelves filled when the player arrives.

## 28.3 Bounded Catch-Up

Long absences use aggregated periods and capped event resolution. The system should not process millions of individual purchases when a month of settlement history can be represented by validated aggregate flows plus exceptional events.

# 29. Multiplayer Authority, Ownership and Auditability

The authoritative server/host owns committed economic state.

Clients may request:

- quotes;
- purchases/sales;
- barter offers;
- contract acceptance;
- transfers;
- employment actions;
- treasury actions where permitted;
- trade-route or caravan orders;
- loan/insurance actions where enabled.

The server validates:

- actor identity;
- ownership/custody;
- permissions;
- quote validity;
- stock;
- balances;
- reservations;
- contract state;
- quantity limits;
- destination/capability;
- duplicate/replay protection.

Committed economic events should be auditable enough to debug:

- resource duplication;
- missing payments;
- double-spend;
- duplicated contract rewards;
- public-treasury abuse;
- reconnect race conditions;
- caravan reconciliation errors;
- migration mismatches.

Shared settlements and organisations require role-based permissions for spending, contracts, prices/policies and treasury actions. Exact policy belongs to later documents and multiplayer governance revisions.

# 30. UI/UX, Explainability and Player Trust

Set 17 owns interface architecture. Set 27 must provide trustworthy economy data.

Required economy-facing view models include:

- price quote;
- price trend;
- quote reasons;
- current stock/availability confidence;
- known demand/supply state;
- expected arrivals;
- transaction preview;
- taxes/fees/tolls;
- barter equivalence/shortfall;
- contract obligations;
- deadline/status;
- wage/compensation;
- business cashflow summary;
- treasury revenue/expenditure;
- trade-route estimated cost/revenue/risk;
- debt/credit status;
- insurance coverage/claim status;
- economic event history.

## 30.1 Player Trust Rules

- Never show a price without clarifying whether it is a quote, estimate or historical observation when ambiguity matters.
- Never silently consume goods/currency after a failed transaction.
- Show taxes/fees before confirmation where known.
- Explain why a merchant refuses a transaction.
- Explain whether stock is physically present, incoming or orderable.
- Warn when selling reserved/contract-critical stock if permissions allow the action.
- Mark uncertain/stale market information.
- Allow players to inspect major public-budget decisions when their role permits.

# 31. Set 25 Registry, Schema, Relationship and Pack Contracts

Set 27 must use Set 25 rather than inventing an incompatible economy registry.

## 31.1 Candidate Economic Domain/Facet Families

The exact schema admission belongs to Set 25 governance, but Set 27 is expected to require definitions/records for concepts such as:

- currency;
- economic commodity facet;
- market profile;
- market instance/runtime state;
- price/quote policy;
- enterprise;
- contract;
- employment agreement;
- account/treasury;
- debt/credit;
- insurance/risk agreement;
- tax/tariff/toll policy;
- trade-route economic facet;
- economic shock/event profile;
- settlement economic summary.

Where existing domains can be extended safely, use extension facets rather than new competing identities.

## 31.2 Required Relationship Families

Representative relationships include:

- actor OWNS account/enterprise/stock;
- enterprise OPERATES_AT structure;
- market SERVES settlement/region;
- market LISTS/ACCEPTS commodity family;
- settlement PRODUCES/CONSUMES commodity family;
- contract BINDS party;
- contract REQUIRES good/service/capability;
- debt OWED_BY / OWED_TO;
- tax PAYABLE_TO treasury;
- route CONNECTS market/logistics endpoint;
- enterprise EMPLOYS worker/service;
- cargo RESERVED_FOR contract;
- treasury FUNDS project/service.

Set 25C owns relationship semantics and kernel validation; Set 27 owns the economic meaning of its registered relationship types.

## 31.3 Package Completeness

An economic content package should not advance merely because a merchant name or market building exists. Depending on category, completeness may require:

- physical goods/services;
- producer source;
- consumer/demand source;
- market/service endpoint;
- ownership;
- pricing/value inputs;
- UI explanation;
- save/persistence state;
- LOD behaviour;
- validation tests;
- optional-pack fallback.

# 32. Godot/Summer Engine Technical Direction

This section provides architecture direction without replacing the rewritten Technical Plan.

## 32.1 Suggested Service Boundaries

Potential Godot services/components include:

- `EconomyRegistryService` - resolves economic definitions/facets through the canonical registry;
- `MarketService` - manages market state, offers, quotes and market updates;
- `TransactionService` - validates/commits economic transfers through existing authoritative inventory/account services;
- `ContractService` - manages economic obligations and state transitions;
- `EnterpriseService` - owns business/enterprise runtime state;
- `LabourEconomyService` - resolves wage/employment economics without owning NPC movement;
- `PublicFinanceService` - treasuries, revenue posting, budgets and public obligations;
- `CreditRiskService` - optional debt/credit/insurance systems;
- `TradeRouteEconomyService` - route profitability, regional flow and caravan economic missions;
- `EconomicLODService` - settlement/regional aggregation and reconciliation;
- `EconomyViewModelService` - presentation-ready explanations and summaries;
- `EconomyValidationService` - invariants, duplicate-spend and data checks.

Names are implementation guidance, not stable shipped IDs until admitted through the Technical Plan and Set 25 task contracts.

## 32.2 Command/Event Pattern

Representative commands:

- RequestPriceQuote
- SubmitPurchase
- SubmitSale
- SubmitBarterOffer
- CreateTradeOrder
- AcceptEconomicContract
- ReserveContractStock
- PayContract
- CreateEmploymentAgreement
- PayWages
- PostTaxRule
- AllocatePublicBudget
- CreateDebtAgreement
- MakeDebtPayment
- PurchaseRiskCoverage
- FileInsuranceClaim
- CreateCaravanEconomicMission

Representative committed events:

- PriceQuoteIssued
- EconomicTransactionCommitted
- MarketStockChanged
- ContractAccepted
- ContractCompleted
- ContractBreached
- WagePaid
- TaxCollected
- TreasurySpent
- DebtCreated
- DebtPaymentMissed
- InsuranceClaimResolved
- TradeRouteDisrupted
- CaravanEconomicOutcomeRecorded
- MarketShockStarted
- MarketShockResolved

Events describe committed facts. Commands express intent.

## 32.3 Summer Engine Boundary

Summer Engine may assist with:

- implementation planning;
- schema generation;
- validator/test creation;
- migration tooling;
- simulation test fixtures;
- balancing analysis;
- documentation synchronisation.

It may not become a shipped black-box AI deciding prices, merchant actions, taxes or contracts. Runtime economy must remain deterministic/reviewable enough for saves, multiplayer, debugging and player trust.

# 33. Validation Invariants, Reason Codes and Acceptance Scenarios

## 33.1 Hard Validation Invariants

1. No committed sale without valid item/service availability.
2. No committed purchase without valid payment/credit authority.
3. No double-spend of currency, goods or reserved contract stock.
4. No market quote treated as committed inventory transfer.
5. No duplicate contract payout after save/load/reconnect.
6. No public spending exceeding authorised funds unless explicit debt/overdraft policy exists.
7. No trade-route completion without authoritative transport outcome.
8. No distant simulation creating unbacked physical stock.
9. No ownership transfer without transaction/event provenance.
10. No economic definition/facet bypassing Set 25 ownership/schema validation.

## 33.2 Representative Acceptance Scenarios

### Scenario A - Local Food Shortage

- A settlement consumes more staple food than local production supplies.
- Reserve falls below target.
- Market demand rises within bounded rules.
- Price explanation cites shortage/reserve pressure.
- Merchants seek imports or contracts.
- A caravan opportunity appears if Set 30 provides a viable route.
- Delivery increases stock and relieves pressure.
- No hidden food is created during the process.

### Scenario B - Automated Iron Surplus

- Player automation increases iron output.
- Local stock rises and immediate shortage disappears.
- Local price softens rather than collapsing to zero.
- Construction/repair/export demand absorbs part of supply.
- Fuel/maintenance inputs may rise.
- Export route becomes more attractive.
- Old iron remains useful through ongoing system demand.

### Scenario C - Road Closure

- Set 30/world systems mark a route inaccessible.
- Expected caravan arrival becomes delayed/cancelled.
- Market information updates with confidence and reason.
- Import-dependent goods rise in scarcity.
- Alternative route may become viable at higher cost.
- When the road reopens, flow and prices recover gradually rather than instantly resetting.

### Scenario D - Contract Reservation

- Merchant accepts delivery contract for 100 grain.
- 100 grain is reserved from eligible stock or scheduled production.
- Reserved grain cannot be sold twice unless contract permits substitution/release.
- Delivery commits ownership/payment.
- Save/load mid-contract preserves reservation and state.

### Scenario E - Public Budget Crisis

- Raid damages roads and drains treasury reserves.
- Settlement cannot simultaneously fund full repairs, guard wages and new market expansion.
- Public-finance decision exposes trade-offs.
- Chosen spending changes actual service/project capacity.
- The unchosen need remains visible and may generate future events.

### Scenario F - Maritime Interface

- Set 27 identifies profitable import demand.
- 26K/26N provide port, vessel, cargo and voyage capability.
- Set 27 creates/values the economic obligation.
- Set 26 executes voyage/port processing.
- Loss/delay outcome returns to Set 27 and updates market/contract/insurance state.

# 34. Document Set 27 Map and Production Sequence

Document Set 27 is structured as ten documents. The map is now locked as the working authoring sequence; documents may be amended after cross-set review but should not casually transfer ownership.

| Document | Title | Primary Ownership |
| --- | --- | --- |
| **27A** | Economic Vision, Architecture and Ownership | Vision, scope, terminology, authority, architecture, interfaces, validation and set map. |
| **27B** | Currency, Barter, Value and Price Formation | Currency families, exchange, reference value, valuation, barter, quote formation and price safeguards. |
| **27C** | Markets, Merchants, Stock and Supply-Demand Simulation | Market instances, merchant economic behaviour, offers/orders, stock, information, supply/demand and market memory. |
| **27D** | Labour, Wages, Households, Businesses and Ownership | Employment economics, household aggregation, enterprise ownership, business operations, wages, profit and property/service rights. |
| **27E** | Contracts, Orders, Services, Breach and Enforcement | Universal economic contracts, procurement, delivery, service agreements, deposits, escrow, breach and economic remedies. |
| **27F** | Credit, Debt, Banking, Insurance and Financial Risk | Accounts, lending, debt, collateral, banks, exchange services, insurance, risk pools, defaults and optional depth settings. |
| **27G** | Taxation, Tariffs, Treasuries and Public Finance | Tax/toll/tariff systems, public revenue, treasury, budgets, reserves, procurement, relief, tribute and fiscal policy. |
| **27H** | Trade Routes, Caravans, Regional Exchange and Cross-Realm Commerce | Terrestrial route economics, caravan missions, imports/exports, regional specialisation, trade networks and realm exchange interfaces. |
| **27I** | Monopolies, Embargoes, Smuggling, Black Markets and Economic Conflict | Market power, concessions, restricted goods, embargoes, sanctions, illicit exchange economics, economic warfare and recovery. |
| **27J** | Economy UI, Simulation LOD, Multiplayer, Registries and Integration | Final runtime architecture, view models, accessibility, distant simulation, multiplayer authority, Set 25 schemas, migration, QA and cross-set reconciliation. |

## 34.1 Authoring Dependency Guidance

The documents may be drafted while Sets 28-30 are developed in parallel. Internal Set 27 dependencies are:

- 27B before final 27C pricing rules;
- 27B-27C before final wage/business valuation in 27D;
- 27B-27D before final contract/payment logic in 27E;
- 27E before final credit/insurance obligations in 27F;
- 27B/27E/27F before final public-finance accounting in 27G;
- 27B-27E plus Set 30 interfaces before final route economics in 27H;
- 27C/27E/27G/27H plus Set 28/legal interfaces before final illicit/economic-conflict rules in 27I;
- all prior documents before final integration in 27J.

This is an authoring dependency, not a requirement that the other document sets finish first.

# 35. Risks, Redesign Triggers and Scope Controls

| Risk | Consequence | Control / Redesign Trigger |
| --- | --- | --- |
| Economy becomes spreadsheet-heavy | Casual players disengage. | Progressive disclosure, automation/assist modes, reason summaries; remove bookkeeping with no gameplay value. |
| Prices feel random | Player cannot plan or trust trade. | Bounded modifiers, trend memory and visible reason codes. |
| Fixed prices create exploits | Infinite arbitrage/automation loops. | Contextual spreads, stock limits, transaction-cost testing and exploit validators. |
| Every NPC gets full accounting | Performance and save bloat. | Household/business aggregation with named-NPC exceptions. |
| Distant economy creates ghost goods | Breaks physical world promise. | Conservation ledgers and reconciliation gates. |
| Currency dominates barter/resources | Resource identity becomes cosmetic. | Preserve barter, in-kind obligations and physical scarcity. |
| Rich player trivialises civilisation | Money bypasses resources, labour and capability. | Projects still require real materials/services/permissions; money buys access, not impossible capability. |
| Public finance becomes city-sim micromanagement | Ruler gameplay overwhelms sandbox. | Policy presets, delegated budgets and staged depth. |
| Set 27 duplicates Set 26 | Conflicting maritime ownership. | Use explicit 26K/26N interface boundary and Set 25 facets. |
| Set 27 duplicates Set 28 social rules | Conflicting negotiation/trust. | Consume Set 28 outcomes only. |
| Set 27 duplicates Set 29 needs | Conflicting demand sources. | Demand reads Set 29/settlement needs rather than inventing hunger/health. |
| Set 27 duplicates Set 30 traversal | Trade route assumptions break vehicle physics. | Consume capacity/time/accessibility interfaces. |
| Optional finance becomes mandatory | Core game becomes too complex. | Gate advanced finance by capability/world setting/production tier. |
| Economic simulation becomes non-deterministic black box | Save, multiplayer and QA instability. | Bounded deterministic rules, seeded randomness where needed, logged decisions. |

# 36. Open Decisions for Documents 27B-27J

The following decisions are intentionally not locked in 27A because they require specialist analysis or Ash approval:

1. Exact base currency families and whether a cross-cultural/common currency exists.
2. Whether physical coin weight/slots matter or currency uses a simplified purse/account representation.
3. Exact barter UX and valuation tolerance.
4. Price formula shape, volatility bounds and update cadence.
5. Merchant spread/markup defaults and stock-reserve policy.
6. Whether settlement markets use continuous quotes, discrete daily clearing or hybrid updates.
7. Exact household income/consumption aggregation model.
8. Whether rent/land ownership is a universal system or conditional feature.
9. Wage payment cadence and treatment of non-currency compensation.
10. Contract escrow/deposit defaults.
11. Interest model and whether compound interest is ever used.
12. Banking availability by settlement stage/culture.
13. Insurance scope and Core Production tier.
14. Taxation granularity and player-facing control presets.
15. Whether inflation is modelled as an explicit monetary phenomenon or represented indirectly through local price levels and currency confidence.
16. Rules for currency debasement, counterfeiting or minting if included.
17. Trade-route profitability formula and route-risk pricing.
18. Caravan ownership/crew economic model pending Set 30 interfaces.
19. Cross-realm exchange and portal logistics fees.
20. Monopoly/market concentration thresholds.
21. Black-market discovery, liquidity and price premium models pending Set 28/legal interfaces.
22. Bankruptcy, insolvency and enterprise closure rules.
23. Player business automation limits.
24. Multiplayer shared-company/treasury permissions.
25. Which advanced financial systems enter Core, Early Access, Full Release or later expansion under Set 25.

# 37. Cross-Set Interface Amendments

The Set 27-30 Interface Register v1.0 remains valid. 27A records the following proposed additions for final integration review.

## Amendment 27-IFACE-001 - Set 26 Maritime Economy Interface

**Reason:** Set 26 is now complete and its maritime economy must be formally connected to Set 27 rather than treated as a future placeholder.

**Set 26 -> Set 27 required interface:**

- vessel cargo capacity and current usable capacity;
- voyage state and expected/actual duration;
- port access/processing availability;
- maritime route accessibility/risk;
- cargo loss/damage/delay outcome;
- customs inspection outcome;
- vessel/fleet readiness costs exposed by 26K/26N;
- maritime contract execution result.

**Set 27 -> Set 26 required interface:**

- universal price/value result;
- currency/payment terms;
- contract economic obligation;
- wage/compensation valuation;
- tariff/tax posting destination;
- insurance/claim economic state;
- regional supply/demand state;
- economic consequence of blockade/route disruption.

**Ownership transfer:** None.

## Amendment 27-IFACE-002 - Economic Information Confidence

**Reason:** Set 27 and Set 28 both require market rumours, negotiation and imperfect information.

**Set 28 supplies:** truth/lie/rumour/social provenance where communication creates the information.

**Set 27 supplies:** price/market observation timestamp, coverage, confidence and economic staleness.

**Ownership transfer:** None.

## Amendment 27-IFACE-003 - Survival Demand Batch

**Reason:** Set 29 will define survival consumption while Set 27 needs efficient settlement/household economic demand.

**Set 29 supplies:** authoritative per-profile or aggregated consumption requirement interfaces.

**Set 27 supplies:** affordability, purchasing, reserve and market-demand interpretation.

**Ownership transfer:** None.

## Amendment 27-IFACE-004 - Transport Operating Cost Interface

**Reason:** Set 27 needs the economic cost of movement without defining vehicle mechanics.

**Set 30 supplies:** exposed operating resource/service requirements, maintenance state, travel time, capacity and accessibility.

**Set 27 supplies:** valuation, budget, profitability and contract consequences.

**Ownership transfer:** None.

# Appendix A. Economic Record Family Map

| Family | Definition Examples | Runtime Examples | Primary Specialist Document |
| --- | --- | --- | --- |
| Currency | Currency family, denomination, issuer profile | Wallet/account holding, exchange transaction | 27B |
| Value / Price | Valuation profile, quote policy | Price quote, transaction price, trend | 27B |
| Market | Market profile, commodity facet | Market instance, offer/order, memory | 27C |
| Merchant / Enterprise | Merchant policy, enterprise profile | Business instance, owned stock/accounts | 27C/27D |
| Labour | Employment profile, compensation form | Employment agreement, wage cycle | 27D |
| Household | Household economic profile | Income/consumption/reserve summary | 27D |
| Contract | Contract template, obligation module | Contract instance, escrow, breach state | 27E |
| Finance | Credit/insurance service profile | Debt, loan, deposit, claim | 27F |
| Public Finance | Tax/tariff/toll rule, budget profile | Treasury, revenue posting, budget | 27G |
| Trade Route | Route economic profile | Route state, caravan economic mission | 27H |
| Economic Conflict | Embargo/monopoly/black-market profile | Restriction, illicit network, shock state | 27I |
| Integration | View-model/reason-code/LOD profiles | Reconciliation/audit records | 27J |

# Appendix B. Cross-System Interface Matrix

| Consumer / Provider | Data Set 27 Consumes | Data Set 27 Exposes |
| --- | --- | --- |
| Items / Resources | ID, quantity, quality, condition, tags, owner | value, demand, price, economic role |
| Recipes / Automation | inputs, outputs, time, fuel/power, throughput, faults | profitability, procurement demand, market consequence |
| NPC / Settlements | population, jobs, stock, needs, permissions, service capacity | wages, market state, contracts, wealth/resilience, budgets |
| Factions / Law | jurisdiction, rights, policy, relationships, restrictions | tariff/tax result, economic access, sanctions/embargo consequences |
| Quests / Events | objective/state/outcome | economic contract, payment, shortage, market event |
| Combat / Crime | losses, capture, theft, destruction, security state | replacement demand, claim value, shortage, risk premium |
| Set 28 | trust, negotiation, social access, personality modifier | price/contract/wage options and economic consequence |
| Set 29 | consumption, injury/illness availability, recovery needs | affordability, market availability, medical/food price |
| Set 30 | travel time, capacity, route access, vehicle condition | cargo mission, transport budget, route profit |
| Set 26 | vessel/port/voyage/fleet/cargo execution | universal economic values, obligations and market state |
| UI/UX | presentation architecture | view models, reason codes, histories, warnings |
| Set 25 | IDs, schemas, packs, relationships, validation | registered economy domains/facets and evidence |

# Appendix C. Initial Economic Reason-Code Catalogue

These codes are provisional semantic examples for later registration through Set 25.

| Reason Code | Meaning |
| --- | --- |
| `economy.quote.normal_market` | Quote is near ordinary local conditions. |
| `economy.quote.low_stock` | Accessible sell stock is low. |
| `economy.quote.high_surplus` | Accessible stock materially exceeds local demand/reserve. |
| `economy.quote.high_demand` | Current demand is elevated. |
| `economy.quote.project_demand` | Active construction/repair/project is consuming the good. |
| `economy.quote.route_disruption` | Expected imports are delayed or inaccessible. |
| `economy.quote.expected_arrival` | Known supply is expected soon. |
| `economy.quote.culture_preference` | Current culture/market preference raises demand. |
| `economy.quote.quality_modifier` | Quality/condition/freshness changes value. |
| `economy.quote.tax_or_tariff` | Public charge affects final cost. |
| `economy.quote.relationship_modifier` | External social/negotiation result changed the commercial terms. |
| `economy.quote.bulk_modifier` | Quantity band affects unit terms. |
| `economy.trade.insufficient_stock` | Seller lacks available unreserved stock. |
| `economy.trade.insufficient_payment` | Buyer lacks valid payment/credit authority. |
| `economy.trade.permission_denied` | Law, ownership or market access blocks trade. |
| `economy.trade.quote_expired` | Market conditions/quote lifetime require refresh. |
| `economy.contract.stock_reserved` | Goods are reserved for another obligation. |
| `economy.contract.deadline_missed` | Contract deadline/window failed. |
| `economy.contract.partial_delivery` | Obligation was only partly fulfilled. |
| `economy.route.capacity_insufficient` | Transport cannot carry required cargo/passengers. |
| `economy.route.inaccessible` | Provider reports no valid route. |
| `economy.route.unprofitable` | Expected costs exceed current economic return under policy. |
| `economy.treasury.insufficient_funds` | Public account cannot fund requested allocation. |
| `economy.credit.limit_exceeded` | Credit agreement does not permit additional debt. |
| `economy.insurance.not_covered` | Loss is outside policy scope or evidence requirements. |
| `economy.market.information_stale` | Market information is too old/uncertain for a confident estimate. |

# Appendix D. 27A Completion Checklist

Document 27A is complete when the following statements are true:

- [x] Universal economy ownership is assigned to Document Set 27.
- [x] Physical goods, labour and service capacity remain owned by their source systems.
- [x] The Set 27-30 Cross-Set Interface Register is adopted.
- [x] Maritime Set 26 ownership is preserved and connected through an explicit interface amendment.
- [x] Set 25 remains the registry/governance authority.
- [x] Global fixed-price and infinite-stock assumptions are rejected.
- [x] Conservation and no-ghost-economy invariants are defined.
- [x] Definition/instance separation is defined.
- [x] Local, settlement, regional and distant simulation layers are defined.
- [x] Currency/barter, markets, labour, contracts, finance, public finance and trade have clear specialist handoffs.
- [x] UI explainability and reason-code requirements are defined.
- [x] Multiplayer authority and economic auditability are defined.
- [x] Godot/Summer Engine boundaries are defined.
- [x] Acceptance scenarios cover shortage, automation, routes, contracts, public finance and maritime integration.
- [x] The 27A-27J document map is locked as the working sequence.
- [x] Open decisions are recorded for specialist documents instead of silently solved here.

---

**End of Document 27A - Economic Vision, Architecture and Ownership v0.1**
