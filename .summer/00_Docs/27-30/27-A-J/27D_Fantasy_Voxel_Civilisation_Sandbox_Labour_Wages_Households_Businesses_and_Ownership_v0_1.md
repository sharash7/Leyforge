# FANTASY VOXEL CIVILISATION SANDBOX

## DOCUMENT SET 27

# 27D - Labour, Wages, Households, Businesses and Ownership

**Version 0.1 - Detailed Design Bible and Technical Foundation Draft**

*A systemic labour-and-enterprise framework for persistent households, employment, compensation, workplace economics, enterprise ownership, property and service rights, operating accounts, profit and loss, player businesses, NPC enterprises, guild and public organisations, simulation LOD, multiplayer permissions and authoritative economic provenance.*

**Working design document - labour economics, household economics, enterprise operation and ownership foundation**

> **Labour, Household and Enterprise System Statement**
>
> Leyforge's economy must be powered by real people, real time, real places, real stock and real rights. A workshop does not become a business because a sign exists on the wall. A villager does not become productive because a job title was assigned. A wage does not exist because a UI says "paid". An enterprise operates only when its authorised owners or controllers can access a valid site, workers or service capacity, tools, inputs, utilities, routes, customers and funds. Households may share resources and obligations without erasing personal ownership. Labour may be compensated in currency, goods, housing, shares, privileges or other agreed consideration, but promised compensation must be backed by something the employer can actually deliver. Distant simulation may batch routine income and consumption, yet it must reconcile to the same households, businesses, inventories, accounts, rights and historical events used when the player is nearby.

| Field | Locked Direction |
| --- | --- |
| Document Set | This is Document 27D in Document Set 27: Economy, Trade and Commerce. |
| Document Role | 27D is the economic authority for labour supply and demand, employment terms, wages and compensation, household economic aggregation, enterprise identity and ownership, business operation, operating accounts, profit/loss, property and service rights, rent/lease economics, business continuity and player/NPC enterprise participation. |
| Core Philosophy | People and enterprises are economic actors with capacity and constraints, not passive multipliers. Labour consumes time and availability; property and stock retain provenance; business results come from authorised production, services and exchange. |
| Household Direction | A household is a persistent social/economic coordination unit owned by Document 07 for membership and social state. 27D owns household economic pooling, routine income/consumption aggregation, affordability and household economic summaries without erasing individual property. |
| Labour Direction | Document 07 owns jobs, worker identity, schedules, task selection and local labour execution. 27D owns economic labour demand, employment agreements, compensation valuation, payroll, labour-market pressure and employer-side affordability. |
| Wage Direction | Routine employment accrues compensation continuously or by completed work and normally settles on a configurable pay cycle. The recommended standard is daily accrual with a seven-day routine settlement cycle; casual/task work may settle immediately on completion. |
| Compensation Direction | Currency, barter/in-kind goods, housing/provision benefits, piece rates, production shares, profit shares and other lawful/authorised consideration are supported. In-kind compensation must be physically delivered or validly reserved; its value is evaluated through 27B. |
| Property Direction | Ownership, custody, control, access, use, lease, concession and beneficiary rights are separate. Private land ownership is not assumed universally; the system supports private property, tenancy, commons, guild tenure, settlement grants, faction control and other culture/law-defined regimes. |
| Enterprise Direction | The enterprise record is separate from its owner, workers, buildings, stock, accounts and contracts. A business may survive the loss of a site, and a site may change operators without becoming a new building definition. |
| Market Direction | 27C owns market state, merchant stock policy and supply-demand pressure. 27D owns enterprise budgets, operating costs, labour demand, business profit/loss and ownership of market-facing stock. |
| Finance Boundary | 27D records operating cashflow and unpaid operating obligations. 27F owns formal credit, debt instruments, collateral, banking, insolvency and insurance. |
| Public-Finance Boundary | Public employers and public enterprises use the same labour and enterprise contracts, but taxes, treasury policy and public budgets remain 27G. |
| Contract Boundary | Employment terms may exist as specialised agreements in 27D; universal procurement, delivery, service, escrow, breach and enforcement architecture is finalised in 27E. |
| Cross-Set Direction | The Leyforge Document Sets 27-30 Cross-Set Interface Register v1.0 remains governing. Set 27 consumes social outcomes from Set 28, survival/health availability from Set 29 and travel/transport capacity from Set 30 without redefining them. |
| Registry Direction | Set 25 remains canonical for qualified IDs, schemas, field ownership, extensions, relationships, packs, migration and validation. |
| Engine Direction | Runtime implementation is deterministic, event-driven Godot game logic with persistent records separated from scene actors. Summer Engine may assist authoring, test generation and review but is not a runtime employer, wage setter or business manager. |
| Production Direction | Core candidates are household economic summaries, simple employment agreements, wages, in-kind compensation, enterprise records, operating accounts, ownership/custody rights and readable business states. Complex corporate structures, securities and advanced insolvency remain later/optional unless separately approved. |
| Final Authority | Ash retains final authority over wage cadence, property depth, player-business scope, household abstraction, labour-conflict complexity, production tier and cross-set ownership changes. |
| Next Deliverable | 27E - Contracts, Orders, Services, Breach and Enforcement. |

# Document Purpose

Document 27D turns Leyforge's existing people, workplaces, inventories, markets and settlement services into a coherent labour-and-enterprise economy. Document 07 already establishes persistent named residents, households, jobs, schedules, personal inventories and authoritative labour. Document Set 20 already establishes real workplaces whose production depends on staffing, tools, routes, inputs and safety. Documents 27B and 27C now establish contextual value, currency, barter, real merchant stock and local market pressure. What remains is the layer that answers who owns productive activity, who is paid for work, how households afford ordinary life, how businesses account for revenue and costs, and how economic ownership persists across buildings, settlements and distance simulation.

This document does not redesign NPC pathfinding, social relationships, survival needs, item definitions, recipes, market pressure, public taxation or formal banking. Instead, it defines the economic contracts those systems expose to one another. The core distinction is deliberate: a **job assignment** is not the same thing as an **employment agreement**; a **building** is not the same thing as an **enterprise**; a **household** is not a single merged inventory; an **owner** is not always the **operator**; a **custodian** is not automatically the **beneficiary**; and a **profitable production cycle** is not automatically cash profit until actual sales, costs and obligations are posted.

27D also resolves several open questions carried forward from 27A-27C. Household economics uses a hybrid aggregate model rather than full accounting for every background NPC. Property and leasing are universal capabilities but not universal cultural institutions. Routine wages use daily accrual and a default seven-day settlement cycle, while task and casual work can settle immediately. Player enterprises have no arbitrary hard count cap; their practical scale is constrained by real sites, labour, inputs, logistics, management permissions and performance budgets. Business closure is defined here as an operating state, while formal insolvency and creditor proceedings remain 27F.

# Design Sources, Authority and Supersession

| Source | Authority Consumed by 27D | 27D Boundary |
| --- | --- | --- |
| 00 - Master Game Design Bible | Living civilisations, multiple player roles, trade, settlement growth, automation and world consequence. | Labour and enterprise support the four pillars rather than becoming a separate management game. |
| 01 - Core Gameplay Loop | Explore, gather, craft, build, interact, automate, defend, upgrade and expand. | Employment and business activity create reasons to gather, produce, trade, build and protect without becoming mandatory. |
| 02 - Player Progression | Trading, leadership, engineering and settlement roles; no class locks; eventual mastery. | 27D exposes labour/business milestones and skill hooks but does not own player levels or perk trees. |
| 03-06 - Blocks, Items, Recipes and Resources | Physical workplaces, item ownership, exact recipe inputs/outputs, trade goods, resource scarcity and long-term material utility. | Enterprises cannot create output or ownership without those authoritative systems. |
| 07 v0.2 - NPC Village System | Persistent people, households, jobs, schedules, skills, personal inventories, migration, social memory and labour execution. | 27D consumes worker/household state and supplies economic terms; it never takes over NPC identity or task AI. |
| 08 - Automation System | Machines, logistics, power, buffers, storage, permissions and bounded automation. | Automation may reduce labour demand or change skill mix; 27D values its operating and labour consequences without redefining machines. |
| 09 - Magic System | Magical services, golems, infrastructure, specialist labour and forbidden practices. | Magical labour is economically represented through the same enterprise/labour contracts while social/legal consequences remain external. |
| 11-12 - Worldgen and Structures | Sites, routes, ownership, damage, occupation and persistent structures. | 27D consumes site/structure rights and condition; it does not infer ownership from appearance. |
| 13 - Races, Peoples, Cultures and Factions | Culture, government, law, territory, custom and political identity are separate. | Property, labour and business regimes may vary by culture/law without ancestry determining economic behaviour. |
| 15 - Quest and Event System | Requests, contracts, labour disputes, shortages, crises and persistent consequences. | Quests may present opportunities or disputes; the economic source of truth remains 27D/27E. |
| 16 - Combat, Gear and Defence | Injury, danger, raids, confiscation/capture outcomes and persistent damage. | 27D consumes authoritative availability/loss outcomes; it does not simulate combat. |
| 17 - UI/UX System | World-first interaction, progressive disclosure, accessible explanation and authoritative view models. | 27D requires explainable wages, payroll, ownership and business states without creating a separate UI architecture. |
| 19 and Set 20 | Settlement growth, parcels, buildings, workplaces, services, staffing requirements, storage, trade facilities and culture packs. | Enterprises use valid sites and service capabilities; buildings remain owned by their source systems. |
| 25A-25L | Canonical IDs, schemas, field ownership, relationships, packs, validation, migrations and production governance. | 27D registers labour/enterprise facets through Set 25 rather than creating parallel identity systems. |
| 26J/26K/26N | Ports, crews, fleets, maritime organisations, cargo and voyage economics. | 27D supplies universal wages, enterprise ownership and operating accounts; maritime crew/vessel execution remains Set 26. |
| 27A | Economic ownership, physical truth, labour/household/business boundaries, interfaces and validation principles. | Governing economic architecture. |
| 27B | Currency, barter, reference value, service valuation, quotes and price formation. | Used to value compensation, benefits, rent and business costs. |
| 27C | Markets, merchant stock, market pressure, liquidity, procurement intents and market participation. | 27D supplies enterprise budgets, household demand, labour costs and ownership while leaving market-state calculation in 27C. |
| Sets 27-30 Cross-Set Interface Register v1.0 | Economy/social/survival/movement ownership split. | Adopted. New required fields appear in Cross-Set Interface Amendments. |
| 99 - Current Manual Testing Guide | Current implementation already persists households, jobs, personal inventories, carried stacks, equipment and transaction histories. | Confirms that 27D can extend existing persistent records rather than inventing a disconnected simulation. |

> **Supersession Rule**
>
> Any earlier economy-facing rule that assumes every worker is unpaid by default, every merchant personally owns all shop stock, every building is its own business, every household shares one undifferentiated inventory, or private land ownership exists identically in every culture is superseded by 27D once approved. Earlier documents retain ownership of NPC identity, settlement membership, building function, law, social relationships, health, movement and physical item state.

# Static Table of Contents

1. Locked Labour, Household and Enterprise Identity  
2. Locked Decision Summary  
3. Scope and Explicit Non-Goals  
4. Canonical Terminology  
5. Source-of-Truth and Ownership Boundaries  
6. System Architecture and Record Separation  
7. Economic Actors, Capacity and Authority  
8. Ownership, Custody, Control and Beneficial Rights  
9. Property, Access, Use, Lease and Concession Rights  
10. Household Economic Model  
11. Personal Property, Shared Property and Household Pools  
12. Household Income, Consumption and Affordability  
13. Household Reserves, Savings and Economic Stress  
14. Household Formation, Separation, Migration and Inheritance Boundary  
15. Labour Supply and Available Work Capacity  
16. Labour Demand and Employer Demand Intents  
17. Jobs, Employment and Service Relationship Boundary  
18. Employment Agreement Families  
19. Wage and Compensation Formation  
20. Wage Cadence, Accrual, Payroll and Settlement  
21. In-Kind Benefits, Housing, Food and Non-Currency Compensation  
22. Piece Rates, Shares, Bonuses and Variable Compensation  
23. Labour Scarcity, Unemployment and Underemployment  
24. Skills, Specialists, Apprenticeships and Guild Labour  
25. Worker Choice, Social Factors and Set 28 Boundary  
26. Health, Injury, Fatigue and Set 29 Boundary  
27. Travel, Commute, Remote Work and Set 30 Boundary  
28. Safety, Coercion, Forced Labour and Forbidden Labour Boundary  
29. Enterprise Definitions and Persistent Business Instances  
30. Enterprise Ownership Forms and Governance  
31. Starting, Registering, Operating, Suspending and Closing Enterprises  
32. Business Sites, Workplaces and Building Separation  
33. Operating Accounts, Cash, Stock and Asset Ledgers  
34. Revenue, Costs, Gross Margin, Profit and Cashflow  
35. Business Inventory, Capital Assets, Tools and Equipment  
36. Production, Services and Market Integration  
37. Staffing, Labour Budgets and Workforce Planning  
38. Rent, Lease, Licence and Property Economics  
39. Land, Parcel and Resource Rights  
40. Player-Owned Businesses and Management Depth  
41. NPC-Owned and Household Businesses  
42. Guilds, Cooperatives, Partnerships and Shared Enterprises  
43. Settlement, Faction and Public Enterprises  
44. Business Distress, Suspension, Closure and 27F Insolvency Boundary  
45. Automation, Golems and Labour Substitution  
46. Maritime Crews, Fleets and Set 26 Enterprise Integration  
47. Quests, Events, Reputation and World-History Integration  
48. Simulation LOD, Distant Households and Business Reconciliation  
49. Multiplayer Ownership, Roles, Shared Companies and Auditability  
50. UI/UX, Explainability and Player Trust  
51. Set 25 Registry, Schema and Relationship Contracts  
52. Godot/Summer Engine Technical Architecture  
53. Validation Invariants and Reason Codes  
54. Representative Acceptance Scenarios  
55. Balance, Difficulty, Accessibility and Anti-Micromanagement  
56. Open Decisions and Handoffs to 27E-27J  
57. Cross-Set Interface Amendments  
Appendix A. Labour and Employment Record Templates  
Appendix B. Household Economic Record Template  
Appendix C. Enterprise and Ownership Record Templates  
Appendix D. Business State and Reason-Code Catalogue  
Appendix E. Cross-System Responsibility Matrix  
Appendix F. 27D Completion Checklist

# 1. Locked Labour, Household and Enterprise Identity

The labour-and-enterprise economy is the people-and-ownership layer between Leyforge's physical production systems and its markets. It determines how work acquires economic terms, how households coordinate ordinary income and consumption, how productive organisations persist independently from their buildings, and how ownership changes remain traceable.

> **Locked Rule**
>
> No labour output, household purchase, wage payment, business profit or ownership change may exist solely as an unbacked summary number. Every economically meaningful result must reconcile to valid people or labour capacity, authoritative goods/services, authorised accounts or compensation stock, valid rights and a recorded mutation path. Aggregation may compress routine detail; it may not invent wealth, erase personal ownership or bypass physical constraints.

## 1.1 Player-Facing Promise

A player should be able to ask:

- Why are blacksmith wages high in this town?
- Why can the bakery not hire another worker?
- Why is this household struggling despite two adults having jobs?
- Who actually owns the grain in this shop?
- Why can I use this workshop but not sell it?
- Why did a merchant enterprise survive after its shop burned down?
- Why is this mine profitable but short on cash?
- Why did automation lower unskilled labour demand but increase demand for mechanics?
- Why can this culture lease a market stall but not privately own the town square?
- Why did my multiplayer company refuse a withdrawal?

The answer should be traceable to readable causes such as wage offers, skill scarcity, schedules, health availability, household size, prices, rent, ownership rights, cash reserves, stock, tools, utilities, route access, payroll obligations, permissions, law or social constraints supplied by their owning systems.

## 1.2 Identity Layers

| Layer | Design Meaning | Player-Facing Result |
| --- | --- | --- |
| Household Economy | Shared ordinary life can pool some income, stock and expenses without merging all personal property. | Families and shared homes feel economically connected without erasing individuals. |
| Labour Capacity | Work depends on real available people, time, skill, safety, tools and access. | A labour shortage has understandable causes. |
| Employment | Economic terms connect employers and workers without replacing job AI. | Work can be paid, provisioned, shared or otherwise compensated coherently. |
| Ownership | Owner, custodian, controller, user and beneficiary may be different actors. | Theft, leasing, public property and shared companies behave consistently. |
| Enterprise | A persistent organisation coordinates sites, stock, labour, accounts, contracts and policies. | Businesses survive site changes and have real operating histories. |
| Operating Accounts | Revenue and costs are posted from actual events. | Profit/loss reflects real activity instead of being an abstract bonus. |
| Property Rights | Access/use/lease/concession rights vary by law/culture. | Different civilisations can have distinct economies without hard-coded ancestry rules. |
| Scalable Simulation | Routine household and business activity is batchable at distance. | Large settlements stay performant while conserving state. |

# 2. Locked Decision Summary

| Area | Locked Decision |
| --- | --- |
| Household Model | Hybrid persistent household summary plus individual property. Routine income/consumption can batch at household level; named/unique property and important obligations remain individual. |
| Household Membership | Document 07 owns who belongs to a household and relationship state. 27D owns economic pooling rules and household affordability summaries. |
| Personal Property | Personal inventories, equipped items, unique possessions and specifically assigned balances remain individually owned unless transferred into a household/common pool. |
| Shared Household Property | Households may hold shared food, fuel, ordinary furnishings, common purse/account, savings or property rights according to household policy and culture/law. |
| Wage Cadence | Standard routine employment: compensation accrues daily and settles every seven in-game days by default. Worlds/cultures/agreements may use daily, task, weekly, seasonal or other valid cycles. |
| Casual Work | Piece/task/casual work may settle immediately after authoritative completion. |
| Unpaid Work | Voluntary, household, civic, guild, religious, reciprocal or coerced labour can exist only as explicitly typed relationships, not as the hidden default for all NPC work. |
| Wage Formation | Wage offers derive from occupation baseline, local labour scarcity, skill/specialist requirement, risk/conditions, schedule burden, employer affordability, non-currency benefits and legal/policy modifiers. 27B values compensation; 27D forms the employment offer. |
| Wage Floors | No universal moral wage floor is hard-coded. Laws, guild rules or settlement policies may impose minimum compensation; ordinary worker acceptance also depends on Set 28 preferences and household economics. |
| In-Kind Compensation | Valid and common where culturally/economically appropriate. Goods/housing/services must be reserved or delivered; promised benefits cannot be abstract. |
| Property Model | Rights are modular: own, possess/custody, control, access, use, lease, harvest/extract, operate, transfer, pledge and benefit. |
| Land Ownership | Private land ownership is optional by law/culture. The universal system supports private ownership, tenure, lease, commons, settlement grants, guild/faction control and occupancy rights. |
| Enterprise Identity | Enterprise is a persistent organisation record separate from building, owner and merchant actor. |
| Business Forms | Sole proprietor, household enterprise, partnership, cooperative, guild enterprise, settlement/public enterprise, faction enterprise and player multiplayer organisation are supported profiles. |
| Profit | Profit = recognised revenue minus recognised operating costs for the accounting horizon. Profit is not identical to cash balance or owner withdrawals. |
| Owner Draw | Owner withdrawals/dividends are explicit transfers and cannot exceed permitted funds/rights. |
| Operating Distress | 27D owns strained, suspended, dormant and closed operating states. Formal insolvency, secured-creditor priority and bankruptcy procedure remain 27F. |
| Player Business Scale | No arbitrary business-count cap. Scale is constrained by real sites, labour, stock, logistics, utilities, management permissions, performance budgets and optional world settings. |
| Automation | Automation can replace tasks or change skill demand but cannot create free labour value. Maintenance, power, inputs, ownership and operator requirements remain real. |
| Multiplayer Company | Shared enterprises use role-based permissions and auditable transactions. 27J finalises UI and networking details. |
| Simulation LOD | Distant routine payroll, household consumption and business cycles may batch deterministically; named people, unique assets, obligations and aggregate conservation remain persistent. |

# 3. Scope and Explicit Non-Goals

## 3.1 In Scope

- household economic pooling and summaries;
- personal-versus-shared ownership boundaries;
- worker economic availability and labour-market participation;
- employment agreements and compensation;
- wage formation, accrual and payroll;
- benefits and in-kind compensation;
- labour scarcity/unemployment summaries;
- enterprise identity, ownership and governance profiles;
- business sites, accounts, assets and operating states;
- profit/loss and cashflow summaries;
- rent, lease, licence and concession economics;
- player/NPC/shared businesses;
- distant household/business simulation;
- multiplayer enterprise roles and audit requirements;
- Set 25 data contracts and Godot implementation direction.

## 3.2 Explicit Non-Goals

27D does not own:

- detailed NPC schedules, utility AI or pathfinding - Document 07/Set 30;
- friendship, loyalty, romance, persuasion or social acceptance - Set 28;
- hunger, disease, fatigue or medical simulation - Set 29;
- item/resource definitions or recipe transformations - Documents 03-06;
- market pressure or merchant quote logic - 27B/27C;
- universal delivery/service contract enforcement - 27E;
- loans, collateral, banks, bankruptcy proceedings or insurance - 27F;
- tax rates, treasury budgets or public revenue - 27G;
- caravan/route movement - 27H/Set 30;
- law definitions, crime procedure or confiscation execution - governance/crime owners;
- complex real-world corporate law, securities markets, derivatives, payroll tax law or accounting compliance simulation.

# 4. Canonical Terminology

| Term | Canonical Meaning |
| --- | --- |
| Worker | Actor or authorised service capacity capable of supplying labour. |
| Labour Capacity | Available work time/capability after schedule, health, travel, skill and other owner-supplied constraints. |
| Job Definition | Gameplay role/site/task eligibility owned primarily by Document 07/20. |
| Employment Agreement | Economic relationship defining employer, worker/service, compensation and term. |
| Employer | Economic actor authorised to purchase/receive labour under an agreement. |
| Compensation | Currency, goods, services, rights, shares or other agreed consideration owed for labour. |
| Wage | Periodic or time-linked compensation, usually denominated in currency/value terms. |
| Piece Rate | Compensation tied to validated units/tasks/results rather than time. |
| Payroll Accrual | Compensation earned but not yet settled. |
| Payroll Settlement | Authoritative transfer of due compensation. |
| Household | Persistent social unit supplied by Document 07; may also act as an economic actor. |
| Household Pool | Shared authorised holdings available for household-defined uses. |
| Discretionary Funds | Funds available after protected/committed household obligations. |
| Enterprise Definition | Reusable profile for an enterprise form/policy family. |
| Enterprise Instance | Persistent business/organisation with owners, accounts, sites, stock, workers and history. |
| Operator | Actor/organisation authorised to run a site or enterprise activity. |
| Owner | Actor/organisation holding a recognised ownership right. |
| Custodian | Actor holding physical possession/control without necessarily owning the asset. |
| Beneficiary | Actor entitled to economic benefit without necessarily controlling the asset. |
| Property Right | Explicit right such as own, use, lease, harvest, operate, transfer or benefit. |
| Business Site | Structure/service endpoint used by an enterprise; not the enterprise itself. |
| Operating Account | Enterprise-held money/value account used for ordinary receipts and costs. |
| Operating Stock | Enterprise-owned/custodied inventory used for sale, production or services. |
| Revenue | Value recognised from completed economic activity. |
| Operating Cost | Value of consumed/owed inputs required for operation during the accounting horizon. |
| Gross Margin | Revenue minus direct cost of goods/services sold. |
| Operating Profit | Revenue minus recognised operating costs for the horizon. |
| Cashflow | Actual inflow/outflow of spendable funds over time; not identical to profit. |
| Owner Draw / Distribution | Authorised transfer from enterprise funds to owner/beneficiary. |
| Rent | Payment for time-bounded use/occupation rights. |
| Lease | Persistent agreement granting defined use/operation rights under conditions. |
| Concession | Granted right to operate/extract/trade in a place or domain. |
| Commons | Resource/property regime in which access/use follows shared/community rules rather than individual ownership. |

# 5. Source-of-Truth and Ownership Boundaries

A 27D record must point outward rather than copying mutable truth from other systems.

| Question | Source of Truth | 27D Use |
| --- | --- | --- |
| Who is this NPC and household member? | Document 07 | Economic participation and household pooling. |
| Is the NPC available to work now? | 07 + Set 29 + Set 30 | Labour capacity input. |
| What job/site exists? | 07/20/structure instance | Employment/job compatibility. |
| What does the work physically produce? | Recipe/automation/service owner | Revenue/cost recognition after authoritative result. |
| Who owns an item? | Inventory/ownership record | Business/household asset view. |
| What is the current market price? | 27B/27C | Wage comparisons, business decisions and valuation. |
| What social terms will a worker accept? | Set 28 | Employment acceptance modifier/result. |
| What survival goods are required? | Set 29/07/20 | Household demand and affordability. |
| Who owns the parcel/building? | Structure/settlement/property-right record | Lease/use/business-site rights. |
| Is a route reachable? | Set 30/26/world systems | Commute and operating access. |
| Is a tax due? | 27G | Operating liability input. |
| Is a debt/credit facility valid? | 27F | Funding/liability input. |

# 6. System Architecture and Record Separation

The architecture uses persistent records linked by stable IDs rather than one monolithic "economy component" on each NPC.

| Record | Owns | Does Not Own |
| --- | --- | --- |
| HouseholdEconomicRecord | pooling policy, shared accounts, routine budget, reserves, affordability summary | household membership/relationships |
| LabourOffer | employer intent, role, compensation range, term, required capacity | worker personality/acceptance |
| EmploymentAgreement | parties, economic terms, accrual, payroll state, economic obligations | job AI/task execution |
| EnterpriseInstance | identity, ownership shares, policies, accounts, site links, worker links, stock links, operating state | building geometry or recipe rules |
| PropertyRightRecord | right type, subject asset/site, holder, scope, duration, transferability | law content or physical asset definition |
| EnterpriseAccountSummary | revenue/cost/cashflow buckets and posting history | bank/credit rules |
| PayrollRecord | accrued compensation, paid amount, due date, arrears | social reaction to non-payment |
| OwnershipShareRecord | owner/beneficiary share and governance rights | social/faction membership |

# 7. Economic Actors, Capacity and Authority

Economic actors may be players, NPCs, households, enterprises, guilds, settlements, factions or public authorities. An actor may only perform an economic action if its owning systems expose required authority.

An actor's **economic capacity** is not a universal stat. It is a set of permissions and resources such as:

- ability to own property;
- ability to hold/transfer currency;
- ability to sign employment or lease agreements;
- access to a workplace;
- management permission;
- available funds;
- valid identity/organisation state;
- legal/cultural permission where relevant;
- required age/status eligibility supplied by NPC/law systems.

Children, prisoners, visitors, summoned entities, golems or temporary agents may have restricted capacities according to their owner systems. 27D consumes those restrictions and never infers them from creature type.

# 8. Ownership, Custody, Control and Beneficial Rights

Ownership must be decomposed because the same asset can be owned, held, used and economically benefited from by different actors.

## 8.1 Right Families

| Right | Meaning | Example |
| --- | --- | --- |
| Own | Residual property claim subject to law/contracts. | Player owns workshop building. |
| Custody | Physical possession/responsibility. | Caravan guard carries employer's cargo. |
| Control | Permission to configure/manage. | Manager sets shop stock policy. |
| Access | Permission to enter/open/use. | Employee accesses back room. |
| Operate | Permission to run a site/service. | Tenant runs forge. |
| Harvest/Extract | Permission to remove renewable/mineral resources. | Guild concession to quarry. |
| Transfer | Permission to sell/gift/assign rights. | Owner sells cart. |
| Benefit | Entitlement to income/output/share. | Investor/partner receives 25% distribution. |
| Pledge | Permission to use an asset as collateral. | Deferred to 27F execution. |

## 8.2 Provenance Rule

Every ownership/right mutation records:

- subject stable ID;
- previous holder/right;
- new holder/right;
- cause/event/transaction ID;
- time;
- authority;
- scope and duration;
- dispute/contested flag where supplied externally.

# 9. Property, Access, Use, Lease and Concession Rights

Property in Leyforge should support multiple civilisation models. The engine therefore implements rights as modular records rather than assuming one universal freehold system.

Possible regimes include:

- personal/private ownership;
- household ownership;
- settlement or crown/faction ownership;
- guild/church/institutional tenure;
- leasehold;
- occupancy/use-right only;
- communal/common land;
- seasonal grazing/harvest rights;
- extraction concessions;
- military requisition or occupation supplied by other systems;
- temporary project/site permits.

A culture pack or active law selects which rights may be created, transferred or inherited. 27D supplies the economic capability; it does not declare one regime morally or globally correct.

# 10. Household Economic Model

Households are persistent people-groups owned by Document 07. 27D adds an economic coordination layer.

A household record may expose:

- member references supplied by 07;
- economic policy profile;
- shared purse/account if used;
- shared pantry/fuel/common-stock references;
- protected reserve targets;
- housing/rent obligations;
- recurring service obligations;
- income channels;
- dependent-support requirements;
- savings target;
- discretionary spending band;
- debt references from 27F;
- recent economic stress reasons.

## 10.1 Hybrid Aggregation Rule

Routine bread, fuel, simple household goods and ordinary wage flows may be aggregated into a household batch. Unique equipment, quest items, named heirlooms, individually owned funds, business assets and important obligations remain explicit.

This keeps large settlements scalable without turning households into one magical inventory.

# 11. Personal Property, Shared Property and Household Pools

Household membership does not automatically transfer ownership.

Default categories:

- **Personal** - equipped gear, tools assigned to a person, personal purse, gifts, heirlooms, quest items.
- **Shared household** - food stores, common fuel, ordinary furnishings, pooled savings where household policy allows.
- **Workplace/enterprise** - business tools, sale stock, production inputs, cash till.
- **Settlement/public** - public warehouse reserves, civic tools, guard armour where policy says public.

Transfers between these pools are authoritative transactions with reason and permission.

# 12. Household Income, Consumption and Affordability

Household income may include:

- wages;
- piece/task pay;
- enterprise distributions;
- sale of household production;
- rent received;
- public support/relief from 27G;
- gifts/transfers;
- contract rewards;
- share-crop/production shares;
- pension/benefit systems only if later content defines them.

Household consumption demand comes from authoritative needs and policy, not from 27D inventing hunger values.

## 12.1 Affordability Calculation Direction

For a planning horizon:

**Available Household Spend = Liquid Funds + Confirmed Income + Releasable Shared Stock Value - Protected Obligations - Required Reserve**

This is a planning calculation, not a permission to sell all household assets. Protected obligations include food/heat minimums, rent due, medicine, existing contracts and other policy-defined necessities.

# 13. Household Reserves, Savings and Economic Stress

Households can hold:

- essential reserve;
- emergency savings;
- planned purchase reserve;
- discretionary savings;
- culturally protected goods.

Economic stress is a reason-coded summary, not a morality score.

Suggested states:

- Comfortable
- Stable
- Tight
- Strained
- Critical
- Destitute

Causes may include unemployment, low wages, high staple prices, rent burden, medical costs, theft, disaster, migration expense or debt servicing. Social/morale consequences remain external.

# 14. Household Formation, Separation, Migration and Inheritance Boundary

Document 07 owns household formation, partners, dependants, migration, births, deaths and social membership. 27D responds economically.

When household structure changes, 27D may need to:

- split or merge shared accounts according to policy/law;
- preserve personal property;
- reassign rent/lease obligations;
- update dependant-support demand;
- update enterprise shares if household-owned;
- process inheritance/estate transfer only according to law/content owner outputs.

27D does not invent inheritance law. It provides the property-transfer machinery that an inheritance decision can call.

# 15. Labour Supply and Available Work Capacity

Labour supply begins with worker capacity from Document 07 and connected sets.

A labour-capacity query may include:

- actor ID;
- skill/proficiency tags;
- available schedule window;
- current job commitments;
- health/injury availability from Set 29;
- travel/commute burden from Set 30/07;
- tool/licence requirements;
- maximum safe workload supplied by health/safety owners;
- legal/role restrictions;
- willingness/relationship modifiers from Set 28.

27D converts this into **economic availability**, not physical task execution.

# 16. Labour Demand and Employer Demand Intents

Employers create labour-demand intents when valid operation requires work that cannot be met by current staffing.

Minimum demand fields:

- employer/enterprise;
- job/role profile;
- site/service;
- skill tags;
- labour units or schedule coverage;
- start window;
- expected duration;
- compensation budget/range;
- risk/condition tags;
- supplied benefits;
- urgency;
- reason code.

Demand does not summon workers. It becomes information for settlement/NPC/social systems and labour-market summaries.

# 17. Jobs, Employment and Service Relationship Boundary

A **job assignment** says what role an NPC performs in the settlement simulation. An **employment agreement** says the economic terms under which labour is provided.

Possible combinations:

- household farmer with no separate wage but household share;
- public guard with wage and equipment provision;
- guild apprentice with training plus reduced wage;
- owner-operator blacksmith who earns enterprise residual profit rather than a wage;
- hired caravan guard paid per voyage;
- volunteer/civic worker with explicit unpaid/obligation type;
- golem labour with no wage but real fuel/maintenance/ownership costs;
- coerced labour under a political/legal state with explicit consequence hooks.

No system should assume "has job = receives standard wage" or "unpaid = free production".

# 18. Employment Agreement Families

| Family | Compensation Pattern | Typical Use |
| --- | --- | --- |
| Salaried/Periodic | Time-linked wage settled on pay cycle. | Guards, clerks, regular artisans. |
| Hour/Shift | Compensation by validated labour time. | Temporary labour, dock work. |
| Piece/Task | Pay per validated unit/task. | Harvest, hauling, repair job. |
| Contract Term | Fixed amount for a defined period/service. | Specialist engineer, mage consultant. |
| Production Share | Percentage/quantity of output. | Sharecropping, fishing crew, mine crew. |
| Profit Share | Share of enterprise distributable profit. | Partners, senior workers. |
| Apprenticeship | Training/service exchange plus optional wage/board. | Learners. |
| Household Labour | Work contributes to household/common pool. | Family farm/shop. |
| Civic/Obligation | Service obligation defined by law/custom. | Militia duty, communal work day. |
| Volunteer/Religious | Explicitly unpaid or provision-supported service. | Shrine/community role. |

27D provides the economic record; Set 28/law/culture systems determine acceptance and social meaning.

# 19. Wage and Compensation Formation

Wage formation should be understandable, bounded and local.

Recommended wage-offer model:

**Wage Offer = Occupation Baseline x Skill Modifier x Labour Scarcity Modifier x Risk/Condition Modifier x Schedule Burden Modifier x Policy/Law Modifier - Valued Guaranteed Benefits**

Employer affordability then constrains the executable offer.

Modifiers should normally be bounded. A labour shortage should raise wages meaningfully but not create absurd exponential escalation after one worker leaves.

## 19.1 Occupation Baseline

Occupation baselines are balancing anchors expressed in RVU/service value from 27B. They are not global mandatory pay rates. Cultures, settlements and enterprise profiles may differ.

## 19.2 Labour Scarcity

Scarcity may consider:

- open suitable roles;
- qualified available workers;
- recent unfilled duration;
- competing employers;
- migration availability;
- urgent reconstruction/war demand;
- specialist rarity.

# 20. Wage Cadence, Accrual, Payroll and Settlement

Routine employment uses **accrual plus settlement**.

Default recommendation:

- labour accrues economically each completed work day or validated work batch;
- standard routine payroll settles every 7 in-game days;
- casual/task work can settle at completion;
- voyage/seasonal work may settle by milestone;
- world/culture profiles may override cadence.

## 20.1 Payroll Lifecycle

1. Validate active agreement and worker/service capacity.
2. Receive validated labour contribution from job/service owner.
3. Accrue due compensation.
4. Reserve/earmark employer payment where policy requires.
5. On due date, attempt settlement.
6. Commit currency/goods/benefit transfer.
7. Record paid amount and remaining arrears.
8. Expose non-payment reason to Set 28/quest/law/27E as appropriate.

Payroll cannot silently disappear because the worker is unloaded.

# 21. In-Kind Benefits, Housing, Food and Non-Currency Compensation

Non-currency compensation is first-class because Leyforge includes villages, guilds, households and cultures at many monetary depths.

Examples:

- meals/rations;
- housing/bed rights;
- fuel allocation;
- clothing/tools;
- medical service entitlement;
- transport/passenger right;
- production output share;
- access to guild facilities;
- land-use rights;
- mana charging/service access.

Each benefit has quantity/capacity, duration and value estimate. A promised house benefit requires a valid housing/service right; it cannot be a text flag with no bed or building capacity.

# 22. Piece Rates, Shares, Bonuses and Variable Compensation

Variable compensation must bind to authoritative results.

- Piece rate pays only for validated output or task completion.
- Production share transfers a percentage/quantity of actual output.
- Profit share uses recognised distributable profit, not gross sales.
- Hazard bonus applies to validated risk/assignment windows.
- Completion bonus depends on contract milestone.
- Tip/gratuity systems are optional and must be real transfers.

This prevents automation or duplicate-event exploits from multiplying payroll.

# 23. Labour Scarcity, Unemployment and Underemployment

Labour-market summaries support settlement planning without becoming a separate top-level Need.

Suggested measures:

- working-age/eligible capacity supplied by 07;
- employed capacity;
- open suitable roles;
- skill mismatch;
- involuntary idle capacity;
- partial/seasonal underemployment;
- specialist shortage bands;
- average offered/accepted wage bands by occupation.

Document Set 20's **Work** need remains the player-facing settlement need. 27D supplies causes such as `labour_shortage`, `skill_mismatch` or `payroll_unaffordable`.

# 24. Skills, Specialists, Apprenticeships and Guild Labour

Skill affects labour value because it can affect speed, quality, waste, safety and eligibility. Exact skill progression remains Document 02/07.

Apprenticeships may combine:

- training service from teacher/workplace;
- reduced production capacity;
- lower wage or in-kind board;
- tuition/payment in some cultures;
- term/milestone;
- skill outcome supplied by progression owner.

Guilds may mediate labour through recommended rates, training, membership access, hall/workshop rights and contract pools. Guild politics and monopolies extend into 27I.

# 25. Worker Choice, Social Factors and Set 28 Boundary

27D forms economic offers. Set 28 determines social/relationship response.

27D may supply:

- offered compensation;
- job/site;
- risk;
- schedule;
- employer identity;
- benefits;
- term;
- household impact;
- competing offers.

Set 28 may return:

- accept/reject/negotiate intent;
- trust/loyalty modifier;
- relationship-based concession;
- cultural etiquette response;
- refusal due to values/relationship;
- social consequence of non-payment/exploitation.

27D must never encode "friendship = 10% cheaper labour" as a universal rule. Social systems may choose to expose a bounded economic modifier or decision result.

# 26. Health, Injury, Fatigue and Set 29 Boundary

Set 29 owns health and survival. 27D consumes labour-availability and cost impacts.

Possible inputs:

- temporarily unavailable;
- reduced work capacity;
- prohibited hazardous work;
- treatment/rest requirement;
- fatigue-limited shift capacity;
- medical leave state.

27D may calculate replacement labour demand, payroll policy consequences or household affordability impact. It does not define injury severity or healing.

# 27. Travel, Commute, Remote Work and Set 30 Boundary

Movement matters economically because time spent travelling is time/cost not available elsewhere.

Set 30/07 supplies:

- route accessibility;
- expected travel time;
- movement mode;
- passenger/vehicle availability where relevant;
- terrain/travel burden.

27D may use these to:

- reduce effective labour availability;
- classify a job as impractical;
- add travel allowance if agreement provides it;
- increase employer demand for local housing;
- value remote/field assignments.

27D does not define walk speed, mount controls or vehicle physics.

# 28. Safety, Coercion, Forced Labour and Forbidden Labour Boundary

Leyforge permits morally and politically diverse playstyles, including conquest and forbidden systems, but 27D must represent them explicitly rather than hiding them inside normal employment.

Economic relationship tags may include:

- voluntary employment;
- household obligation;
- civic duty;
- contractual service;
- bonded/indebted service where setting allows;
- prisoner labour;
- coerced/forced labour;
- magical/constructed labour;
- undead/forbidden labour.

Law, Set 28, faction and event systems determine legitimacy, fear, rebellion, reputation and enforcement. 27D records economic output, compensation/absence of compensation, ownership and operating risk. It never treats coercion as a neutral default efficiency bonus.

# 29. Enterprise Definitions and Persistent Business Instances

An **EnterpriseDefinition** describes a reusable business form/policy family. An **EnterpriseInstance** is a persistent organisation in the world.

EnterpriseInstance minimum fields:

- enterprise ID/name key;
- enterprise form;
- owner/share records;
- controller/manager roles;
- home settlement/faction references;
- operating accounts;
- stock/inventory references;
- business-site references;
- employee/service agreements;
- active contracts;
- market participation policies;
- production/service profiles;
- debt/insurance references;
- licence/property rights;
- operating state;
- history/provenance.

# 30. Enterprise Ownership Forms and Governance

Supported baseline profiles:

| Form | Ownership | Typical Governance |
| --- | --- | --- |
| Sole Proprietor | One actor | Owner manages/appoints manager. |
| Household Enterprise | Household or defined members | Household policy/lead. |
| Partnership | Multiple actors with shares | Share/role rules. |
| Cooperative | Worker/member group | Voting/role profile. |
| Guild Enterprise | Guild/institution | Office/charter rules. |
| Settlement/Public | Settlement/public authority | 27G budget/policy owner. |
| Faction Enterprise | Faction institution | Faction governance. |
| Player Company | One/multiple players | Role-based permissions. |

Complex securities, public stock exchanges and hostile takeovers are not Core assumptions.

# 31. Starting, Registering, Operating, Suspending and Closing Enterprises

Enterprise lifecycle states:

- Proposed
- Forming
- Active
- Strained
- Suspended
- Dormant
- Closing
- Closed
- Dissolved

Creation requires enough valid fields to identify ownership/control and at least one intended economic activity. Actual operation additionally requires sites/services, permissions, resources and workers as appropriate.

A business can remain **Active but site-blocked** if a shop burns down and another site could be acquired. It becomes **Suspended** when it intentionally/automatically stops economic activity due to critical blockers. Closure is a business decision/state; formal insolvency is 27F.

# 32. Business Sites, Workplaces and Building Separation

A building and an enterprise are different records.

Examples:

- one enterprise operates two market stalls;
- three artisan enterprises share one guild hall;
- player owns a workshop building but leases it to an NPC enterprise;
- public settlement owns a market building while private merchants rent stalls;
- a caravan enterprise operates without a permanent shop;
- a shipboard merchant uses Set 26 vessel/port endpoints.

Site capability comes from Document Set 20/structure instances. Enterprise records only reference valid capabilities and rights.

# 33. Operating Accounts, Cash, Stock and Asset Ledgers

A small business should not require real-world double-entry accounting UI, but the runtime needs clean provenance.

Minimum business economic views:

- liquid funds by currency/account;
- stock owned/custodied;
- reserved stock;
- payroll accrued/due;
- rent/lease due;
- input procurement commitments;
- maintenance/utility costs;
- tax liabilities from 27G;
- debt service from 27F;
- recent revenue;
- recent direct costs;
- operating profit/loss;
- cashflow trend;
- owner distributions.

Internally these can be event postings rather than thousands of persistent ledger rows forever. Summaries retain bounded history and important audit events.

# 34. Revenue, Costs, Gross Margin, Profit and Cashflow

Definitions:

**Revenue** is recognised when authorised goods/services are delivered/accepted or when the owning contract defines recognition.

**Direct Cost** includes consumed goods, direct labour compensation, direct service usage and attributable transport/market fees.

**Gross Margin = Revenue - Direct Cost of Goods/Services Sold**

**Operating Profit = Revenue - Direct Costs - Operating Overheads recognised in horizon**

**Cashflow = Actual Cash/Spendable Inflows - Actual Cash/Spendable Outflows**

A profitable business may still be cash-poor if customers have not paid or if inventory expansion consumes cash. A cash-rich business may be unprofitable if it is selling stored assets.

# 35. Business Inventory, Capital Assets, Tools and Equipment

Enterprise assets remain authoritative physical or rights-backed records.

Categories:

- sale stock;
- production inputs;
- work-in-progress where recipe owner supports it;
- finished goods;
- tools/equipment;
- machines;
- vehicles/mount rights from Set 30;
- vessels from Set 26;
- furniture/fixtures if economically tracked;
- currency/accounts;
- licences/concessions;
- property/lease rights.

Capital assets are not automatically consumed as operating costs. Maintenance, depreciation-like replacement planning may be approximated through actual condition/repair rather than an invisible accounting depreciation system.

# 36. Production, Services and Market Integration

Business output must originate from authoritative production/service completion.

Flow:

1. Enterprise holds/has custody of required inputs.
2. Valid site/workstation/service capability exists.
3. Labour/automation/power requirements are met.
4. Recipe/service owner completes work and posts output.
5. Output enters enterprise-authorised stock.
6. 27C decides market availability according to reserve/stock policy.
7. 27B/27C form executable price/quote.
8. Sale commits stock/payment/ownership.
9. 27D recognises revenue/cost.

No "business income per day" may bypass this chain unless a distant summary reconciles to the same capacity and stock rules.

# 37. Staffing, Labour Budgets and Workforce Planning

Enterprises should set high-level workforce policy rather than micro-scheduling every worker.

Policies may include:

- minimum/target/max staffing by role;
- wage budget;
- overtime/urgent-work allowance if setting supports it;
- apprenticeship slots;
- owner labour priority;
- contractor/casual fallback;
- pause hiring when cash reserve low;
- specialist retention premium;
- seasonal workforce profile.

The NPC planner resolves actual worker assignments. 27D only emits economic offers and budget constraints.

# 38. Rent, Lease, Licence and Property Economics

Rent/lease capability is universal but optional by culture and law.

Lease record may include:

- subject site/right;
- lessor;
- lessee;
- use scope;
- duration;
- rent/payment;
- deposit/escrow reference (27E/27F);
- maintenance responsibility;
- utility/service responsibility;
- transfer/sublet permission;
- termination conditions;
- access hours/areas;
- ownership of improvements.

A player should be able to rent a stall without buying the marketplace if local rules support it.

# 39. Land, Parcel and Resource Rights

Document 19 owns parcels and settlement planning. 27D attaches economic rights without assuming parcels are always privately saleable.

Possible rights:

- residence occupancy;
- building permit;
- leasehold;
- farm-use right;
- grazing right;
- forestry right;
- mineral/extraction concession;
- market-stall right;
- dock/berth commercial right;
- public easement/route right;
- temporary construction licence.

Transferability and duration come from law/culture/settlement policy.

# 40. Player-Owned Businesses and Management Depth

Players may found or acquire enterprises where permissions/progression allow.

Player management can range from light to deep:

**Light:** choose business type, fund stock, assign manager, receive summary.

**Standard:** set stock targets, hiring budget, sale/procurement policies, reserve levels and expansion goals.

**Advanced:** inspect labour bands, site profitability, route sourcing, leases, profit sharing, specialist contracts and multi-site operations.

There is no arbitrary hard cap on player businesses. Practical limits are:

- funds and stock;
- valid sites;
- staff/service capacity;
- routes/logistics;
- management roles;
- licences/rights;
- power/mana/maintenance;
- world performance/LOD budgets;
- optional server/world policy.

# 41. NPC-Owned and Household Businesses

NPC enterprises should emerge from valid world conditions, not random flavour labels.

A household bakery may be viable because:

- the household has members with baking skill;
- a valid kitchen/bakery site exists;
- grain/flour/fuel supply is accessible;
- local demand exists;
- the household has rights to operate/sell;
- funds or inputs support operation.

If the baker dies, the enterprise may continue if another worker/owner can operate it; otherwise it may become dormant, be sold, inherited or closed according to external systems.

# 42. Guilds, Cooperatives, Partnerships and Shared Enterprises

Shared enterprises use ownership shares plus governance roles.

Minimum supported concepts:

- ownership/economic share;
- voting/decision role where relevant;
- management authority;
- withdrawal/distribution rights;
- liability/debt responsibility deferred to 27F;
- member labour agreements;
- shared stock/property rights;
- entry/exit rules through contracts/law.

A cooperative may distribute surplus by labour contribution rather than capital share. A guild enterprise may retain profits for shared facilities. These are policy profiles, not hard-coded separate engines.

# 43. Settlement, Faction and Public Enterprises

Public enterprises use the same physical/business truth but connect to 27G.

Examples:

- public granary;
- municipal quarry;
- town ferry;
- public bath/healer service;
- guard armoury/workshop;
- faction caravan office;
- state shipyard/naval yard.

27D tracks labour, stock, operating costs and service revenue. 27G decides funding, subsidy, public pricing policy and treasury transfers.

# 44. Business Distress, Suspension, Closure and 27F Insolvency Boundary

27D owns operating distress signals:

- insufficient cash for payroll;
- chronic input shortage;
- no valid site;
- licence/permission lost;
- prolonged no-demand/unsold stock;
- owner/manager unavailable;
- critical maintenance failure;
- route isolation;
- workforce collapse.

Suggested states:

- **Strained** - still operating with material risk.
- **Suspended** - temporary stop; obligations persist.
- **Dormant** - no active production/trade but enterprise identity retained.
- **Closing** - controlled wind-down.
- **Closed** - no active operations; assets/obligations still may exist.
- **Dissolved** - legal/economic organisation ended after obligations resolved externally.

Formal insolvency, creditor ranking, collateral seizure and bankruptcy are 27F.

# 45. Automation, Golems and Labour Substitution

Automation changes labour composition rather than making labour irrelevant.

Automation may:

- reduce repetitive hauling/manual processing roles;
- increase mechanic/operator/maintenance demand;
- increase fuel/power/input demand;
- change accident/risk profiles;
- increase output and market supply;
- allow one worker to supervise more capacity.

Golems/constructed workers use ownership, fuel/charge, maintenance, task and social/legal interfaces from their systems. They do not receive wages unless fiction/policy explicitly creates such a compensation arrangement, but their operating costs remain real.

# 46. Maritime Crews, Fleets and Set 26 Enterprise Integration

Set 26 owns vessel crew execution, fleets, voyages and ports. 27D supplies universal economic terms.

27D may define:

- crew employment agreement;
- voyage wage or share agreement;
- enterprise ownership of vessel/fleet rights;
- operating account;
- payroll/provision budget;
- owner distribution;
- charter/lease economic right.

Set 26 supplies actual crew role, vessel capacity, voyage duration, damage/loss and port execution outcomes.

# 47. Quests, Events, Reputation and World-History Integration

27D exposes economic events such as:

- hired/fired/left employment;
- payroll missed;
- enterprise founded/closed;
- shop reopened after disaster;
- household lost income;
- guild strike/dispute trigger;
- business inherited/transferred;
- lease expired/evicted according to external law;
- automation displaced/retrained labour;
- public enterprise rescued/subsidised.

Quest/event systems decide which become player-facing stories. Set 28 supplies social memory/reputation consequences.

# 48. Simulation LOD, Distant Households and Business Reconciliation

## 48.1 LOD Tiers

| Tier | Household/Labour | Enterprise |
| --- | --- | --- |
| Immediate Local | Individual actors, visible work, transactions, personal inventories. | Physical site, workers, stock, customer transactions. |
| Local Summary | Batched work shifts, household consumption windows. | Daily production/sales/payroll batches backed by real capacity. |
| Settlement Summary | Household demand/income bands, labour pool, unemployment/shortages. | Business operating summaries, stock and account references. |
| Distant Region | Bounded deterministic daily/weekly flows with conserved totals. | Aggregated production/trade/payroll based on persistent enterprise capacity. |

## 48.2 Reconciliation Rules

- No distant payroll without valid agreement and contribution capacity.
- No distant household purchase without funds/stock and demand.
- No distant enterprise output beyond inputs/capacity.
- Named/unique assets do not collapse into anonymous value.
- Promotion back to local creates actors/scenes from persistent records rather than resetting them.
- Summary postings retain enough provenance to audit source/destination and reason.

# 49. Multiplayer Ownership, Roles, Shared Companies and Auditability

Shared enterprises need role permissions.

Suggested roles:

- Owner
- Co-owner/Partner
- Manager
- Finance Manager
- Stock/Procurement Manager
- Hiring Manager
- Worker/Operator
- Auditor/Viewer

Permissions may include:

- spend funds;
- withdraw owner distribution;
- transfer stock;
- change prices/market policy;
- hire/fire;
- sign leases/contracts;
- sell assets;
- change ownership shares;
- view detailed accounts.

All high-impact changes are server-authoritative and auditable. Role names are customisable by organisation/culture; capability flags are canonical.

# 50. UI/UX, Explainability and Player Trust

Normal play should not look like accounting software.

Core views:

- **Household:** income sources, essential costs, reserve/stress, protected stock, major obligations.
- **Worker:** job, compensation form, next pay date, arrears, major benefits.
- **Business:** operating status, cash, stock, revenue/cost trend, payroll, blockers, owner distribution.
- **Ownership:** owner/operator/custodian and relevant rights.
- **Labour Market:** open roles, qualified worker scarcity, wage band trend.

Reason-first examples:

- `Cannot hire: weekly payroll budget insufficient.`
- `Business suspended: no valid operating site.`
- `Household strained: staple food cost increased and one income source was lost.`
- `Cannot sell workshop: you hold a lease, not transfer ownership.`

# 51. Set 25 Registry, Schema and Relationship Contracts

Recommended definition/runtime families:

- `economy.labour.occupation_profile`
- `economy.labour.compensation_profile`
- `economy.labour.employment_agreement`
- `economy.household.policy_profile`
- `economy.household.runtime_summary`
- `economy.enterprise.definition`
- `economy.enterprise.instance`
- `economy.enterprise.policy`
- `economy.ownership.right_definition`
- `economy.ownership.right_instance`
- `economy.property.lease_profile`
- `economy.account.operating_summary`
- `economy.payroll.runtime_record`

Set 25 owns canonical qualification, schema extension, package ownership, aliases, migrations and validation.

# 52. Godot/Summer Engine Technical Architecture

Recommended services:

- `LabourEconomyService`
- `EmploymentAgreementService`
- `PayrollService`
- `HouseholdEconomyService`
- `EnterpriseService`
- `OwnershipRightsService`
- `OperatingAccountService`
- `BusinessLifecycleService`

## 52.1 Event-Driven Inputs

Subscribe to authoritative events such as:

- job assignment changed;
- worker unavailable/available;
- labour contribution completed;
- recipe/service completed;
- sale/purchase committed;
- stock ownership changed;
- structure/site damaged or restored;
- household membership changed;
- route accessibility changed;
- account transaction committed.

Runtime calculations should be deterministic for the same world state. Summer Engine may generate fixtures, validators, registry content or diagnostics under review but must not make opaque runtime employment or ownership decisions.

# 53. Validation Invariants and Reason Codes

## 53.1 Hard Invariants

1. No wage settlement without a valid agreement/accrual or authorised discretionary payment.
2. No in-kind compensation without physical stock/service capacity and transfer/reservation.
3. No household aggregation may erase individually owned unique property.
4. No enterprise sale may transfer stock it does not own/control.
5. No building shell may create an enterprise automatically without an enterprise/site relationship.
6. No enterprise profit may be recognised from uncommitted phantom revenue.
7. No owner withdrawal may bypass enterprise account permission and funds.
8. No lease may silently become ownership.
9. No distant labour/output may exceed authoritative worker/capacity inputs.
10. No ownership mutation without provenance.
11. No payroll may pay twice after save/load/reconnect.
12. No private-land assumption may override culture/law property regime.
13. No Set 28/29/30 field may be re-authored by 27D.
14. No economic definition may bypass Set 25 schema/ownership validation.

## 53.2 Initial Reason Codes

- `labour.no_available_worker`
- `labour.skill_shortage`
- `labour.schedule_unavailable`
- `labour.health_unavailable`
- `labour.route_impractical`
- `labour.offer_rejected_social`
- `payroll.insufficient_funds`
- `payroll.missing_compensation_stock`
- `payroll.overdue`
- `household.essential_cost_pressure`
- `household.income_loss`
- `household.reserve_below_target`
- `enterprise.no_valid_site`
- `enterprise.no_operating_permission`
- `enterprise.no_input_stock`
- `enterprise.payroll_unaffordable`
- `enterprise.cashflow_negative`
- `enterprise.suspended`
- `ownership.no_transfer_right`
- `ownership.custody_not_ownership`
- `property.lease_expired`
- `property.regime_disallows_transfer`
- `business.stock_not_owned`

# 54. Representative Acceptance Scenarios

## Scenario A - Labour Shortage Raises Wages

- Settlement has two smith roles and one qualified smith.
- 27D sees specialist shortage and competing employer demand.
- Wage offers rise within bounded scarcity modifiers.
- 27B values the compensation package.
- Set 28 decides which offer the smith accepts.
- No new smith is spawned and no job assignment changes until Document 07 authorises it.

## Scenario B - Household Economic Stress

- Two-adult household loses one wage after raid injury.
- Set 29 marks worker unavailable; 07 keeps household membership.
- 27D reduces confirmed income and preserves essential food/rent obligations.
- 27C sees household demand but lower purchasing capacity.
- Household stress becomes Strained with `income_loss` and `essential_cost_pressure`.
- No personal heirloom is auto-sold to fix the budget.

## Scenario C - Player Leases a Shop

- Settlement owns market building.
- Player enterprise receives time-bounded operating lease for one stall.
- Player can stock/sell through that stall but cannot sell/demolish the building without separate rights.
- Rent posts as enterprise operating cost.
- Lease expiry removes operating access but not ownership of player's remaining stock.

## Scenario D - Business Survives Burned Site

- NPC bakery enterprise owns stock/account but leases a bakery site.
- Fire destroys/invalidates site through structure systems.
- Enterprise becomes Suspended: `no_valid_site`.
- Stock/account/employee obligations persist.
- If another site is leased, enterprise resumes without being recreated.

## Scenario E - Weekly Payroll

- Worker accrues 7 days of wages.
- Employer has sufficient currency.
- Payroll settlement transfers funds atomically.
- Save/load after day 5 preserves accrual.
- Reconnect cannot pay days 1-5 twice.

## Scenario F - In-Kind Compensation

- Apprentice agreement promises meals + bed + reduced coin wage.
- Household/enterprise reserves real food and valid bed/service capacity.
- 27B values benefits for comparison.
- If food/bed cannot be supplied, benefit is not considered fulfilled and agreement exposes arrears/breach hook.

## Scenario G - Automated Workshop

- Player adds machines reducing three manual processing roles to one operator/mechanic role.
- 08 supplies actual throughput/power/maintenance.
- 27D reduces labour demand for old role and increases specialist demand.
- Output can rise only if inputs/power are real.
- Business profit changes from actual costs/sales; automation never creates free daily income.

## Scenario H - Multiplayer Company Permission

- Two players co-own enterprise; one has stock-manager role but no owner-draw permission.
- Player may transfer authorised sale stock but cannot withdraw treasury funds.
- Server rejects unauthorised withdrawal with `ownership.no_transfer_right`/permission reason.
- Audit log records attempt and successful stock transactions.

## Scenario I - Maritime Crew Share

- Merchant vessel voyage uses production-share/ voyage-pay agreement.
- 27D defines crew compensation terms.
- Set 26 executes voyage and returns delivered cargo/loss result.
- Crew share calculates only from actual eligible delivered/profit basis.
- No cargo means no phantom share, though guaranteed base pay may still accrue.

# 55. Balance, Difficulty, Accessibility and Anti-Micromanagement

## 55.1 Balance Principles

- Labour should matter without making every village permanently worker-starved.
- Wage changes should be gradual and explainable.
- Owner-operated and household businesses should remain viable alongside wage employment.
- Automation should shift labour needs, not trivially delete all operating costs.
- Rent/property systems should create options, not mandatory chores.
- Household poverty should create readable needs/opportunities rather than constant punitive death spirals.
- Business failure should usually degrade through Strained/Suspended states before irreversible dissolution.

## 55.2 Difficulty / World Settings

Possible controls:

- economic simulation depth;
- household essential-consumption pressure;
- wage scarcity sensitivity;
- payroll strictness/grace period;
- business failure speed;
- property/lease complexity;
- NPC enterprise autonomy;
- player business automation assistance.

Peaceful/relaxed modes may preserve prices, wages and businesses while reducing punitive arrears/closure pressure.

## 55.3 Anti-Micromanagement Defaults

- NPCs seek suitable work autonomously.
- Businesses use policy presets.
- Household routine spending batches automatically.
- Payroll runs automatically when funded.
- Player receives exception alerts rather than every transaction.
- Advanced accounting screens are opt-in drill-down.

# 56. Open Decisions and Handoffs to 27E-27J

The following remain intentionally deferred:

1. Exact universal contract object hierarchy for employment versus other service agreements - 27E.
2. Deposit/escrow rules for leases and employment retainers - 27E.
3. Formal debt conversion of unpaid wages/rent - 27F.
4. Insolvency thresholds, creditor priority and bankruptcy procedure - 27F.
5. Business insurance, worker compensation insurance and loss coverage - 27F.
6. Payroll taxes, employer levies, subsidies and public relief - 27G.
7. Public-enterprise budget controls and service subsidies - 27G.
8. Caravan business ownership and driver/guard compensation details after Set 30 interface review - 27H.
9. Labour monopolies, guild exclusion, strike/lockout economic conflict and black-market labour - 27I.
10. Final multiplayer organisation roles, UI and replication - 27J.
11. Exact Core/Early Access production tier for rent/property regimes and complex business forms - Set 25/27J.
12. Whether household enterprises may auto-form from repeated production/trade behaviour or require explicit authored policy - final integration review.

# 57. Cross-Set Interface Amendments

The Sets 27-30 Interface Register v1.0 remains valid. 27D adds the following proposed interfaces for final reconciliation.

## Amendment 27D-IFACE-001 - Worker Economic Availability

**Reason:** 27D needs labour capacity without owning NPC schedules, health or movement.

**07/Set 29/Set 30 -> 27D:** actor ID, role/skill tags, available work window/capacity, health-work modifier, travel/route burden, existing commitments, eligibility restrictions.

**27D -> 07:** employment offer/agreement ID, employer/site, compensation terms, required coverage, economic priority and accepted/rejected status once Set 28/social resolution completes.

**Ownership transfer:** None.

## Amendment 27D-IFACE-002 - Social Employment Decision

**Reason:** Economic offers and social willingness must remain separate.

**27D -> Set 28:** employer identity, job/site, compensation package, schedule, risk tags, term, household impact, competing offer summary.

**Set 28 -> 27D:** accept/reject/negotiate result, bounded social concession/modifier if applicable, refusal reason category, trust/loyalty consequence hooks.

**Ownership transfer:** None.

## Amendment 27D-IFACE-003 - Household Survival Requirement

**Reason:** Household affordability depends on real survival/service demand without 27D redefining needs.

**Set 29/07/20 -> 27D:** household/member requirement batches, horizon, urgency, valid substitutes, already fulfilled/shared-supply amount.

**27D -> 27C:** affordable demand intent, purchasing-capacity band, protected reserve and unmet economic demand.

**Ownership transfer:** None.

## Amendment 27D-IFACE-004 - Commute and Worksite Access

**Reason:** Job economic viability needs route burden.

**Set 30/07 -> 27D:** travel time, accessibility, movement mode availability, route reliability/cost inputs.

**27D -> Set 30/07:** job destination, required arrival window, optional employer-provided transport/service entitlement.

**Ownership transfer:** None.

## Amendment 27D-IFACE-005 - Enterprise/Transport Asset Right

**Reason:** Enterprises may own or lease carts, mounts and vessels without Set 27 owning movement mechanics.

**Set 30/26 -> 27D:** asset identity, current operator capability, capacity class, condition/availability, operating-resource requirements.

**27D -> Set 30/26:** owner/custodian/operator right, lease/charter term, authorised users and economic budget references.

**Ownership transfer:** None.

# Appendix A. Labour and Employment Record Templates

## A.1 LabourOffer

| Field | Direction |
| --- | --- |
| offer_id | Stable runtime ID |
| employer_ref | Enterprise/household/public actor |
| job_profile_id | External job definition |
| site_ref | Optional workplace/site |
| required_skill_tags | Eligibility inputs |
| schedule_or_capacity | Coverage needed |
| compensation_profile | Wage/benefit structure |
| offered_value_rvu | Comparison anchor only |
| currency_terms | Spendable wage terms |
| in_kind_terms | Goods/services/rights |
| start/end | Term |
| risk_tags | External risk categories |
| expiry | Offer validity |
| status | Open/accepted/rejected/withdrawn/expired |

## A.2 EmploymentAgreement

| Field | Direction |
| --- | --- |
| agreement_id | Stable ID |
| employer_ref / worker_ref | Parties |
| labour_relationship_type | Periodic/task/share/etc. |
| job/site refs | External execution context |
| compensation_terms | Currency/in-kind/share |
| accrual_rule | Daily/task/milestone |
| pay_cycle | Default 7 days if periodic profile |
| accrued_due | Runtime amount/value components |
| last_settlement | Timestamp |
| arrears | Outstanding compensation |
| term/status | Active/suspended/ended |
| provenance | Creation/change history |

# Appendix B. Household Economic Record Template

| Field Group | Fields |
| --- | --- |
| Identity | household_ref, economic_policy_id, home_settlement_ref |
| Shared Holdings | shared_account_refs, pantry/storage refs, common-property rights |
| Income | wage channels, business distributions, transfers, rent/other authorised sources |
| Obligations | essentials, rent, services, contracts, debt refs |
| Reserves | essential reserve, emergency reserve, savings target |
| Affordability | available spend, protected amount, stress state, reason codes |
| History | major income loss, displacement, relief, inheritance/transfer events |
| LOD | last processed time, batch horizon, reconciliation hash |

# Appendix C. Enterprise and Ownership Record Templates

## C.1 EnterpriseInstance

| Field Group | Fields |
| --- | --- |
| Identity | enterprise_id, definition_id, display_name_key, form, home settlement/faction |
| Ownership | share/right records, beneficiary refs, governance profile |
| Management | role assignments, capability permissions |
| Sites | business-site refs, leases/licences/concessions |
| Accounts | operating account refs, cash reserve targets |
| Stock | owned/custodied inventory refs, reserve policy |
| Labour | employment agreements, target staffing policies |
| Activity | production/service profiles, 27C merchant policy refs |
| Obligations | 27E contracts, 27F debt/insurance, 27G taxes |
| State | active/strained/suspended/dormant/closing/closed/dissolved |
| History | founding, ownership changes, site losses, closures, recoveries |

## C.2 PropertyRightRecord

| Field | Direction |
| --- | --- |
| right_id | Stable ID |
| right_type | own/custody/control/access/use/operate/lease/harvest/benefit/etc. |
| subject_ref | Asset/site/parcel/resource/service |
| holder_ref | Actor/household/enterprise/settlement/faction |
| grantor_ref | Source authority where applicable |
| scope | Area, quantity, capability or limits |
| start/end | Duration |
| transferability | Allowed/restricted/prohibited |
| conditions | External law/contract predicates |
| provenance | Event/transaction/contract source |

# Appendix D. Business State and Reason-Code Catalogue

| Domain | Example Codes |
| --- | --- |
| Labour | no_available_worker, skill_shortage, schedule_unavailable, route_impractical |
| Payroll | insufficient_funds, missing_compensation_stock, overdue, benefit_unavailable |
| Household | income_loss, essential_cost_pressure, reserve_below_target, housing_cost_pressure |
| Enterprise | no_valid_site, no_operating_permission, input_shortage, output_blocked, payroll_unaffordable, suspended |
| Ownership | no_transfer_right, custody_not_ownership, shared_permission_required, contested_right |
| Property | lease_expired, use_scope_violation, regime_disallows_transfer, concession_suspended |
| Accounting | revenue_unrecognised, cash_shortfall, operating_loss, distribution_not_permitted |

# Appendix E. Cross-System Responsibility Matrix

| Topic | 27D Owns | External Owner |
| --- | --- | --- |
| NPC identity/household membership | Economic pooling only | 07 |
| Job/task execution | Economic terms only | 07/20 |
| Wage/value | Employment offer and payroll | 27B provides valuation |
| Market stock/pressure | Enterprise budget/ownership | 27C |
| Social acceptance | Offer facts | Set 28 |
| Health/work capacity | Economic consequence | Set 29 |
| Commute/transport | Economic consequence | Set 30/26 |
| Universal contracts/breach | Employment-specific state | 27E |
| Debt/insolvency | Operating distress | 27F |
| Tax/public budget | Operating cost interface | 27G |
| Illicit/monopoly labour | Base labour economics | 27I |
| UI/network finalisation | Data/view requirements | 27J/17/18 |

# Appendix F. 27D Completion Checklist

- [x] Adopted 27A-27C and Sets 27-30 ownership contracts.
- [x] Preserved Document 07 ownership of NPC identity, households, jobs and task AI.
- [x] Resolved hybrid household economic aggregation.
- [x] Preserved personal property while allowing shared household pools.
- [x] Locked routine wage accrual and default seven-day settlement cycle.
- [x] Defined in-kind, task, share and apprenticeship compensation.
- [x] Defined labour supply/demand and wage formation boundaries.
- [x] Defined enterprise identity separate from buildings and owners.
- [x] Defined ownership/custody/control/access/use rights.
- [x] Made land/property regimes configurable by culture/law.
- [x] Defined business accounts, revenue, cost, profit and cashflow.
- [x] Defined player, NPC, guild, cooperative and public enterprise profiles.
- [x] Defined business distress/closure while preserving 27F insolvency ownership.
- [x] Integrated automation, maritime crews and shared enterprises.
- [x] Defined LOD/reconciliation and multiplayer permission principles.
- [x] Added Set 25 registry contracts, Godot service map and hard validation invariants.
- [x] Added cross-set interface amendments without transferring ownership.
- [x] Handed universal contract enforcement to 27E.

---

**End of Document 27D - Labour, Wages, Households, Businesses and Ownership - Version 0.1**
