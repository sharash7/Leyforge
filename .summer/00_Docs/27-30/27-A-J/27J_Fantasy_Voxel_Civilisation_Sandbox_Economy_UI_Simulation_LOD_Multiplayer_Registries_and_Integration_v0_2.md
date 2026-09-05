# FANTASY VOXEL CIVILISATION SANDBOX

## DOCUMENT SET 27

# 27J - Economy UI, Simulation LOD, Multiplayer, Registries and Integration

**Version 0.2 - Final Set Integration, Runtime Contract and Production Handoff Draft**

*Final integration document for Leyforge Document Set 27 - Economy, Trade and Commerce*

---

> **Set 27 Integration Statement**
>
> Leyforge's economy is complete as a design system only when the specialised rules in Documents 27A-27I can operate through one authoritative runtime, one conserved physical economy, one consistent player-facing explanation layer, one bounded distant-simulation model, one multiplayer authority model and one registry/migration contract. Document 27J therefore does not invent a new economic subsystem. It reconciles the entire set, resolves the remaining integration decisions, standardises the interfaces consumed by other Leyforge systems and defines the acceptance gates required before economic features may be treated as production-ready.

| Field | Locked Direction |
| --- | --- |
| Document Set | This is Document 27J, the final document in Document Set 27: Economy, Trade and Commerce. |
| Document Role | Final runtime architecture, UI/view-model contract, simulation LOD, multiplayer authority, persistence, Set 25 registry integration, migration, validation, cross-set reconciliation and production handoff for Documents 27A-27I. |
| Economic Truth | Physical goods, currency, labour capacity, services, ownership, rights, obligations, treasury balances, route capacity and authoritative external outcomes remain the sources of truth. Summaries never become duplicate inventories or duplicate money. |
| UI Direction | Economy UI is progressive, explainable and optional-depth. Normal players receive concise reasons and useful actions; specialist players can inspect ledgers, trends, margins, dependencies and histories. Document 17 remains the owner of shared UI architecture. |
| Simulation Direction | Detailed near simulation promotes into increasingly aggregated settlement and regional summaries with deterministic bounded catch-up and mandatory conservation reconciliation. |
| Multiplayer Direction | The authoritative world owns economic state. Clients request transactions; the server/host validates and commits them atomically. Shared enterprises and treasuries use explicit capability permissions and immutable audit history. |
| Registry Direction | Economic definitions use Set 25 qualified IDs, namespaces, field ownership, schema versions, relationships, capabilities, content packs, validation profiles and migrations. Set 27 defines economic semantics only. |
| Cross-Set Direction | The Sets 27-30 Cross-Set Interface Register v1.0 remains governing. Amendments proposed by 27A-27I are consolidated in this document as the Set 27 Final Interface Contract v1.0 for downstream reconciliation. |
| Engine Direction | Godot is the runtime/editor host. Summer Engine assists bounded implementation work but is never an autonomous runtime economic authority. |
| Production Direction | Core economic foundations are separable from optional advanced finance, illicit-economy and high-detail governance layers. Set 25 remains authoritative for production classification and release admission. |
| Final Authority | Ash retains final authority over canon, scope, feature tiers, defaults, implementation order, world presets and any ownership transfer between document sets. |
| Set Status After Approval | Documents 27A-27J form the complete design package for the universal Leyforge economy, subject to the final Sets 27-30 integration pass and later implementation/replacement-document governance. |

# Document Purpose

Document 27J closes Document Set 27 by converting the specialist systems defined in 27A-27I into one executable architectural contract. The previous documents intentionally separate ownership so that currency, markets, labour, contracts, finance, public finance, trade routes and restricted economies can each remain understandable. Runtime integration must now make those systems behave as one economy without duplicating truth, running every subsystem at full fidelity everywhere or exposing players to unnecessary bookkeeping.

This document therefore focuses on interfaces and execution rather than adding more content categories. It defines which records are authoritative, which services may mutate them, how economic time advances, how UI consumes economic state, how distant simulation aggregates and reconciles, how multiplayer transactions are made safe, how save/migration rules protect persistent worlds, how Set 25 identities and schemas are consumed, and how the final cross-set contracts with Sets 26 and 28-30 are represented.

The result must support two very different players at once. A player who only occasionally buys tools or sells surplus crops should be able to understand a price or refusal in seconds. A player who wants to run a trading company, regional transport network, bank, guild, public treasury or smuggling operation should be able to inspect deeper information and make meaningful strategic choices. Complexity exists underneath the world, but the interface reveals it only when it helps a decision.

# Design Sources, Authority and Supersession

| Source | Relevant Direction | Treatment in 27J |
| --- | --- | --- |
| 00 - Master Game Design Bible | Living civilisations, player freedom, trade, settlement growth, automation, magic and persistent world consequences. | Economy remains a support layer for the four core pillars rather than a detached spreadsheet game. |
| 01 - Core Gameplay Loop | Explore, gather, craft, build, interact, automate, defend, upgrade and expand. | Economic feedback must reinforce the main loop and allow several playstyles rather than require merchant progression. |
| 02 - Player Progression | Trading, leadership and engineering are progression paths; no class lock. | Economic achievements expose progression events but do not own overall levels, skills or perks. |
| 03-06 | Physical blocks, items, recipes and resources with stable identities and exact transformations. | These remain the physical substrate and cannot be replaced by economic summary quantities. |
| 07 - NPC Village System | Persistent NPCs, households, jobs, inventories, settlement state and LOD. | Economic actors reference existing identities and capacity instead of duplicating NPC simulation. |
| 08 - Automation | Physical logistics and production with exact transactions and bounded unloaded simulation. | Economic supply, contracts and markets consume automation output; economy does not invent throughput. |
| 09-16 | Magic, creatures, worldgen, structures, cultures/factions, dimensions, quests and combat. | Set 27 consumes authoritative events and exposes economic consequences without redefining their gameplay. |
| 17 - UI/UX System | World-first interface, progressive disclosure, accessibility, reason-first feedback, multiplayer/split-screen. | Owns presentation architecture. 27J defines economic view models, screen requirements, data freshness and reason payloads. |
| 18 - Technical Plan | Stable IDs, authoritative state, persistence, event-driven systems and LOD principles; earlier Unreal direction is superseded by current Godot/Summer direction. | General architecture principles are retained; engine-specific implementation in 27J is Godot-oriented. |
| 19-20 | Settlement planning, blueprints, facilities, activation contracts, real resources and construction. | Economy funds and values services but cannot make a non-functional building economically capable by appearance alone. |
| 21-23 | Forge and presentation authoring. | Economic assets and UI presentation reference Forge products; no new authoring stack is created here. |
| 24 | Atlas world content, cultures, regional resources and world history. | Supplies economic context; 27J defines runtime integration, not new Atlas lore. |
| 25A-25L | Canonical registry kernel, schemas, relationships, capabilities, packs, migration, validation, Core Production governance and task contracts. | Governs IDs, schema ownership, manifests, migrations, validation and release admission. 27J proposes economic schema families for registration under Set 25. |
| 26A-26O | Maritime vessels, ports, crews, routes, piracy, navies and maritime economy execution. | Set 26 remains authoritative for maritime physical execution. 27J consolidates Set 27's economic handoff. |
| 27A | Economic vision, ownership, physical conservation and set map. | Governing Set 27 architecture. |
| 27B | Currency, barter, valuation, exchange and price formation. | Supplies monetary/value services and quote formation. |
| 27C | Markets, merchant stock, supply-demand, information and merchant economic policy. | Supplies local/regional market state and merchant economic intentions. |
| 27D | Labour, wages, households, businesses and ownership. | Supplies household/business accounting and economic rights. |
| 27E | Contracts, orders, services, breach and economic remedies. | Supplies persistent economic obligations and evidence-driven settlement. |
| 27F | Credit, debt, banking, insurance and financial risk. | Supplies financial claims, institutions, policies and insolvency. |
| 27G | Taxes, tariffs, treasuries and public finance. | Supplies public revenue, funds, budgets and fiscal policy. |
| 27H | Trade routes, caravans, regional exchange and cross-realm commerce. | Supplies spatial commerce, shipments, route economics and intermodal handoffs. |
| 27I | Monopolies, embargoes, smuggling, black markets and economic conflict. | Supplies restricted-market and economic-conflict state. |
| 99 - Manual Testing Guide | Existing authoritative inventory transactions, settlement records, roads, automation, combat aftermath and save discipline. | Demonstrates that the implementation already contains several foundational state/transaction patterns that Set 27 can extend. |
| Sets 27-30 Cross-Set Interface Register v1.0 | Economy/social/survival/movement ownership boundary. | Remains governing. This document consolidates all Set 27 amendment proposals without transferring ownership. |

> **Supersession Rule**
>
> When Document Set 27 is approved, older documents that describe the economy as a future placeholder, assume unlimited merchant stock, permit non-conserved market inventory, or assign economic ownership to another system are superseded only for those economic fields. Their physical, social, survival, traversal, combat, quest, settlement, world and presentation ownership remains unchanged.

# Static Table of Contents

1. Locked Final Integration Identity  
2. Locked Decision Summary  
3. Scope and Explicit Non-Goals  
4. Canonical Integration Terminology  
5. Completed Set 27 Ownership Map  
6. Source-of-Truth Graph and Mutation Authority  
7. Economic Runtime Service Architecture  
8. Definition, Runtime, Summary and History Record Separation  
9. Economic Time, Scheduling and Update Cadence  
10. Economic Command, Validation, Commit and Event Pipeline  
11. UI/View-Model Architecture and Document 17 Boundary  
12. Economy HUD, Notifications and Contextual Feedback  
13. Trade, Barter, Currency and Market UI  
14. Merchant, Household, Labour and Enterprise UI  
15. Contract, Credit, Banking and Insurance UI  
16. Treasury, Tax, Budget and Public-Finance UI  
17. Trade Route, Shipment and Regional Commerce UI  
18. Restricted Economy, Embargo and Black-Market UI  
19. Progressive Disclosure, Accessibility and Player Trust  
20. Explainability, Reason Codes and Causal Traces  
21. Economic Knowledge, Freshness, Rumours and Confidence  
22. Simulation LOD Philosophy and Fidelity Tiers  
23. Tier Promotion, Demotion and Hysteresis  
24. Detailed Local Economic Simulation  
25. Settlement Economic Summary Simulation  
26. Regional Economic Summary Simulation  
27. Dormant/Unobserved Economic State  
28. Bounded Catch-Up and Offline/Unloaded Progress  
29. Conservation Ledgers and Reconciliation Gates  
30. Determinism, Seeded Randomness and Repeatability  
31. Performance Budgets and Work Scheduling  
32. Multiplayer Authority and Economic Ownership  
33. Atomic Transactions, Reservations and Concurrency  
34. Shared Enterprises, Treasuries and Permission Roles  
35. Replication, Relevance and Client View Models  
36. Disconnect, Rejoin, Failure and Transaction Recovery  
37. Multiplayer Anti-Exploit, Audit and Dispute Evidence  
38. Split-Screen and Local Multiplayer Economy  
39. Persistence, Save Boundaries and Economic Snapshots  
40. Journals, History, Recovery and Save Integrity  
41. Schema Versioning and Migration  
42. Set 25 Qualified IDs, Namespaces and Field Ownership  
43. Economic Schema Families and Registry Domains  
44. Relationships, Capabilities, Suitability and Fallbacks  
45. Content Packs, Overrides, Optional Modules and Removal  
46. Registry Import, Compilation and Validation  
47. Godot Runtime Architecture  
48. Core Economic Services  
49. Commands, Events, Queries and View-Model Adapters  
50. Summer Engine Development Boundary  
51. Integration with Physical Resources, Automation and Settlements  
52. Integration with Quests, Combat, Factions and World Events  
53. Document Set 26 Maritime Integration  
54. Final Sets 27-30 Interface Contract  
55. Cross-Set Interface Versioning and Reconciliation  
56. 27A Open-Decision Closure Register  
57. Difficulty, World Presets and Economic Complexity  
58. Delegation, Assistance and Economic Automation  
59. Set 25 Production Classification Recommendations  
60. Staged Implementation and Migration Roadmap  
61. Validation Strategy and Release Gates  
62. Universal Economic Invariants  
63. Deterministic Acceptance Scenario Suite  
64. Performance, LOD and Soak Testing  
65. UI, Accessibility and Localisation Testing  
66. Multiplayer, Concurrency and Security Testing  
67. Save, Migration and Recovery Testing  
68. Diagnostics, Debugging and Economic Observability  
69. Production Risks, Redesign Triggers and Scope Controls  
70. Deferred Decisions and Future Expansion Boundaries  
71. Final Document Set 27 Acceptance and Handoff  
72. Cross-Set Interface Amendments  
Appendix A. Economic Runtime Service Map  
Appendix B. Registry and Schema Family Map  
Appendix C. Economic View-Model Templates  
Appendix D. Simulation LOD Matrix  
Appendix E. Set 27 Final Cross-Set Interface Matrix  
Appendix F. Consolidated Economic Reason-Code Families  
Appendix G. Release Acceptance Matrix  
Appendix H. Document Set 27 Completion Checklist

# 1. Locked Final Integration Identity

Document 27J is the execution and integration authority for Document Set 27. It does not replace the specialist rules in 27B-27I. Instead, it defines how those systems cooperate and which architectural guarantees must hold when they run together.

> **Locked Rule**
>
> No economic result is authoritative merely because a UI displayed it, a distant summary predicted it, an AI wanted it, a quest requested it or a client submitted it. A result becomes authoritative only after the owning service validates the current world state, commits all required conserved mutations, records the resulting ownership/obligation changes and emits the factual event used by other systems.

## 1.1 Player-Facing Promise

A player should be able to understand the economy at the depth they choose:

- buy, sell and barter without opening advanced reports;
- inspect why a price moved if they care;
- run a business without manually posting every bookkeeping entry;
- opt into deeper finance, treasury or illicit-market tools when their playstyle needs them;
- trust that goods do not duplicate during travel or unloaded simulation;
- trust that shared-company and treasury actions are attributable in multiplayer;
- see whether information is current, stale, rumoured or incomplete;
- understand why an action failed and what can fix it;
- return to a world after a long absence without the economy exploding or silently losing value.

## 1.2 Final Integration Layers

| Layer | Owns | Does Not Own |
| --- | --- | --- |
| Economic Definitions | Set 27 semantics for currencies, market policies, enterprises, contracts, finance, fiscal policy, routes and restrictions. | Set 25 identity kernel or pack loader. |
| Economic Runtime | Mutable balances, obligations, summaries, market state, shipment economic state and financial/public records. | Physical item/world truth owned elsewhere. |
| Economic Services | Validation, valuation, accounting, settlement, aggregation and economic decisions. | Social, survival or movement simulation. |
| External Providers | Physical inventory, NPC identity, health, movement, vessels, structures, world events. | Economic valuation and accounting. |
| Presentation | Economic view models, reason payloads, histories and forecasts. | Shared screen/navigation architecture owned by Document 17. |
| Persistence | Economic records, journals, snapshots and migration payloads. | Global save framework owned by technical architecture/Set 25 contracts. |
| Validation | Economic invariants and domain fixtures. | Project-wide release-gate authority owned by Set 25. |

# 2. Locked Decision Summary

| Area | Final Decision |
| --- | --- |
| Runtime Model | Modular domain services communicating through commands, queries and factual events. No single EconomyGod object owns every rule. |
| Mutable Truth | Each mutable state family has one service owner and one authoritative mutation path. |
| Calculated State | Prices, pressure, risk, affordability and forecasts are derived from authoritative inputs and may be cached with dependency/version markers. |
| UI | UI consumes immutable/read-only view models and submits commands. It never directly changes balances, stock, contracts or policies. |
| Information Depth | Progressive disclosure with Basic, Standard and Advanced economic presentation presets. |
| Reasoning | Every important price, refusal, failure, shortage, restriction, default, tax assessment or route block exposes stable reason codes and plain-language explanations. |
| LOD | Five economic fidelity tiers: Interactive, Local Detailed, Settlement Summary, Regional Summary and Dormant/Derivable. |
| Catch-Up | Time advances in bounded batches with maximum work/consequence caps and no per-second replay of long absences. |
| Reconciliation | Promotion to more detailed simulation requires a conservation and ownership reconciliation gate. |
| Determinism | Same authoritative starting state + same ordered commands/events + same seeded random stream produces the same economic result. |
| Multiplayer | Authoritative host/server owns economic mutation; clients are untrusted requesters. |
| Shared Organisations | Capability-based roles for company, guild and treasury actions with per-action audit records. |
| Currency/Stock Duplication | Prohibited. Reservations lock existing value but never clone it. |
| Persistence | Snapshot + journal/history approach; large histories may compact without deleting required audit/provenance facts. |
| Migration | Schema migrations are explicit, versioned, reversible/tested where practical and routed through Set 25 pack/save governance. |
| Registry | Fully qualified IDs under approved namespace/domain rules. No new short-ID production truth. |
| Optional Depth | Advanced banking, bank runs, complex insolvency, deep economic conflict and high-detail public finance may be gated by world/profile/production tier. |
| Summer Engine | May generate bounded code/data/tests from approved task contracts; cannot decide canon or modify runtime economic state. |
| Final Cross-Set Boundary | Set 27 owns economic meaning; Sets 28, 29 and 30 own social willingness, survival/health and terrestrial movement respectively. Set 26 owns maritime execution. |
| Closure | 27A-27J are design-complete when their interfaces and invariants are reconciled; implementation readiness remains a separate Set 25 evidence state. |

# 3. Scope and Explicit Non-Goals

## 3.1 In Scope

- final runtime ownership architecture for all Set 27 systems;
- economic UI information contracts and view models;
- explanation/reason-code architecture;
- economic knowledge freshness;
- LOD, aggregation, catch-up and reconciliation;
- deterministic scheduling;
- multiplayer authority, permissions, concurrency and audit;
- persistence, snapshots, history and migration requirements;
- Set 25 identity/schema/capability/pack integration;
- Godot service architecture;
- Set 26 and Sets 28-30 interface consolidation;
- production-class recommendations and staged implementation;
- economic validation, QA, performance and acceptance criteria.

## 3.2 Explicit Non-Goals

27J does not:

- redefine price formulas owned by 27B;
- redefine market pressure or merchant stock rules owned by 27C;
- redefine household, employment or business rules owned by 27D;
- redefine contract obligations/remedies owned by 27E;
- redefine finance/insurance calculations owned by 27F;
- redefine public tax/budget rules owned by 27G;
- redefine physical trade movement owned by 27H plus Set 30/26 providers;
- redefine monopoly, embargo, smuggling or black-market economics owned by 27I;
- own dialogue, persuasion, relationship simulation or social memory;
- own hunger, illness, injury, fatigue or treatment;
- own terrestrial vehicle physics, route traversal or mount control;
- own maritime movement, vessel construction or naval conflict;
- replace Document 17's general UI framework;
- replace Set 25's registry kernel, pack loader, validation governance or release authority;
- turn Summer Engine into an in-game AI economy controller.

# 4. Canonical Integration Terminology

| Term | Meaning |
| --- | --- |
| Authoritative Record | Mutable record owned by exactly one runtime service and changed only by approved commands/transactions. |
| Derived Economic State | Calculated value such as price, pressure, risk or affordability produced from authoritative inputs. |
| Economic View Model | Read-only player-facing projection of one or more authoritative/derived records. |
| Economic Summary | Aggregated state used for distant simulation; it represents authoritative quantities at that fidelity and must reconcile when promoted. |
| Conservation Ledger | Audit structure proving legitimate sources, sinks, transfers, reservations and balances for conserved value. |
| Reconciliation Gate | Validation step when changing simulation fidelity or loading a region to ensure summary and detailed truth agree. |
| Economic Tick | Scheduled bounded update opportunity for one economic service; not a universal every-frame loop. |
| Settlement Cycle | Coarser scheduled update for household/business/market/public state within one settlement. |
| Regional Cycle | Coarser update for trade, aggregate production/consumption, major policy and inter-settlement flows. |
| Catch-Up Window | Bounded time interval processed after unloaded/inactive time. |
| Capability Permission | Explicit right to perform a category of organisation/treasury/company action. |
| Causal Trace | Ordered set of inputs/reasons explaining how an economic result was obtained. |
| Data Freshness | Age and validity horizon of an observation, quote, forecast or communicated market fact. |
| Relevance Scope | Which clients/players need a replicated economic state or view model. |
| Economic Journal | Ordered append-only or append-oriented history of important committed economic events. |
| Compaction | Replacing old high-volume history with validated summaries while retaining required audit/provenance records. |
| Migration Fixture | Saved/data example used to prove schema migration and compatibility. |

# 5. Completed Set 27 Ownership Map

| Document | Final Ownership | Integration Output Used by 27J |
| --- | --- | --- |
| 27A | Vision, architecture, ownership, physical conservation, set map. | Governing invariants and cross-system boundaries. |
| 27B | Currency, barter, value, exchange, quotes and price formation. | Value/quote/settlement services and price explanation. |
| 27C | Markets, stock, demand/supply pressure, merchant economic policy and information. | Market summaries, stock availability and expected-arrival interfaces. |
| 27D | Labour economics, wages, households, enterprises and economic rights. | Household/enterprise summaries and organisation ownership/permissions. |
| 27E | Contracts, orders, services, escrow, breach and economic remedies. | Obligation engine, evidence and settlement events. |
| 27F | Credit, debt, banking, insurance, financial risk and insolvency. | Financial claim/institution services. |
| 27G | Taxes, tariffs, treasuries, budgets, public spending and fiscal policy. | Fiscal services and public-account authority. |
| 27H | Spatial trade, shipments, regional exchange, caravans and cross-realm commerce. | Shipment economics and transport-provider interfaces. |
| 27I | Market power, restrictions, embargoes, black markets, smuggling economics and economic conflict. | Restriction/access service and illicit-market summaries. |
| 27J | Runtime integration, UI contracts, LOD, multiplayer, registry/migration, QA and final interfaces. | Production handoff for the whole set. |

# 6. Source-of-Truth Graph and Mutation Authority

The economy touches many existing systems. The runtime must be explicit about which system owns each truth.

| State | Authoritative Owner | Set 27 Use |
| --- | --- | --- |
| Physical item/block quantity | Inventory/world/storage/automation owners | Value, reserve, sellability, contract fulfilment, tax basis. |
| NPC identity/personality | NPC/Social owners | Party identity, merchant/employer role, willingness input. |
| Health/injury/needs | Set 29 / existing NPC needs owners | Demand, incapacity, relief eligibility, insurance evidence. |
| Terrestrial movement | Set 30 | Travel time, capacity, route/accessibility, loss/damage evidence. |
| Maritime movement/vessels | Set 26 | Voyage/cargo/port state and incident evidence. |
| Building/structure function | 19/20/12 | Market, bank, treasury, warehouse or workplace capability. |
| Currency balance | 27B-owned monetary/account authority | Payments, exchange, treasury and finance settlement. |
| Market state | 27C | Demand/supply pressure, sellable stock projection, liquidity. |
| Enterprise/household accounting | 27D | Income, expenses, reserves, ownership rights. |
| Contract obligation | 27E | Due work/payment/delivery and evidence state. |
| Loan/insurance claim | 27F | Financial rights/obligations and risk exposure. |
| Treasury/fiscal state | 27G | Public revenue, funds, appropriations and liabilities. |
| Shipment economic state | 27H | Commercial intent, custody references, costs and margin. |
| Restriction/black-market state | 27I | Access legality, scarcity/risk premium and illicit opportunity. |

> **Single-Mutation Rule**
>
> A service may read records from other systems but may not mutate another owner's record directly. Cross-domain changes occur through validated commands or committed transaction participants.

# 7. Economic Runtime Service Architecture

The recommended runtime is modular and service-oriented at the gameplay-domain level. This does not require distributed infrastructure; these are Godot-side domain services with clear APIs.

| Service Group | Primary Responsibilities |
| --- | --- |
| Identity/Definition Resolver | Resolve Set 25 IDs, schemas, aliases, packs and definitions. |
| Value and Currency | Reference/instance value, currency acceptance/exchange, barter valuation, quotes. |
| Market | Supply/demand, merchant policy, market memory, liquidity and observations. |
| Household/Labour/Enterprise | Employment economics, household budgets, business accounting and rights. |
| Contract | Offers, obligations, milestones, escrow, evidence, breach and remedies. |
| Finance | Loans, accounts, credit, collateral, insurance and insolvency. |
| Fiscal | Taxes, tariffs, treasury funds, budgets, public payments and reserves. |
| Trade | Routes, shipments, imports/exports, intermodal handoffs and commercial settlement. |
| Restriction/Economic Conflict | Participation restrictions, concentration, embargoes, black markets and smuggling economic missions. |
| Economic Scheduler | Timed work, LOD updates, catch-up budgeting and service ordering. |
| Economic Transaction Coordinator | Atomic multi-service commits, reservations and rollback. |
| Economic Knowledge | Observations, rumours, freshness, confidence and player-known economic facts. |
| Economic View-Model Adapter | Converts domain state into Document 17-compatible read models. |
| Economic Audit/Diagnostics | Reason traces, conservation ledgers, history, debug inspection and validation metrics. |

No service is allowed to bypass the transaction coordinator when a change spans more than one authoritative owner.

# 8. Definition, Runtime, Summary and History Record Separation

Every economic concept must declare which record class it uses.

| Record Class | Purpose | Example |
| --- | --- | --- |
| Definition | Immutable/versioned gameplay definition. | Currency family, tax policy template, contract profile. |
| Runtime Instance | Current authoritative mutable state. | Specific loan, enterprise, market instance, treasury fund. |
| External Reference | Stable reference to another owner's runtime object. | Warehouse, NPC, wagon, vessel, structure. |
| Summary Record | LOD-compatible aggregate state. | Settlement grain demand summary, regional trade balance. |
| Reservation | Temporary authorised claim against existing capacity/value. | Escrow hold, reserved cargo, committed treasury funds. |
| Observation | Knowledge record about state, possibly stale/partial. | Last-known iron price at a distant city. |
| Journal Event | Fact emitted after successful mutation. | Payment committed, shipment delivered, tax assessed. |
| Audit Trace | Diagnostic or governance evidence. | Quote reason trace, public treasury approval chain. |
| Planning Metadata | Documentation/production-only status. | Core Production, deferred, balance draft. |

Planning metadata must never silently enter shipped gameplay logic unless explicitly compiled into a production manifest for a defined purpose.

# 9. Economic Time, Scheduling and Update Cadence

The economy does not require every record to tick every frame.

## 9.1 Scheduling Classes

| Class | Typical Trigger | Examples |
| --- | --- | --- |
| Immediate | Player/NPC/machine command or authoritative event. | Buy, pay, reserve, accept contract. |
| Short Scheduled | Seconds/minutes when loaded and relevant. | Quote expiry, auction/order windows if used, route departure readiness. |
| Daily/Settlement Cycle | In-game day or bounded equivalent. | Household consumption summary, wage accrual, merchant policy refresh, market memory. |
| Periodic Fiscal/Financial | Multi-day/weekly/monthly or policy schedule. | Payroll settlement, rent, loan instalments, taxes, budgets. |
| Regional Cycle | Coarse interval based on LOD. | Trade-flow aggregation, regional shortage update. |
| Event-Driven | World/faction/route/health/combat event. | Embargo imposed, road closed, raid destroys stock. |

## 9.2 Update Ordering

Within a scheduled settlement cycle, recommended ordering is:

1. ingest external committed events since the prior cycle;
2. resolve physical stock/capability changes;
3. update protected requirements and demand intents;
4. update expected arrivals and supply forecasts;
5. update market summaries and price-pressure inputs;
6. update household/enterprise affordability and procurement intentions;
7. process due contracts and finance/fiscal schedules;
8. plan eligible trade/market actions within bounded budgets;
9. commit authorised economic transactions;
10. publish view-model invalidations and observations.

The order is deterministic and versioned so save/replay tests can detect accidental behavioural changes.

# 10. Economic Command, Validation, Commit and Event Pipeline

All economic mutations follow the same conceptual pipeline:

1. **Command** - caller expresses intent with actor, target, expected version and context.
2. **Resolve** - IDs, parties, rights, definitions and references are resolved.
3. **Validate** - current stock, funds, authority, restrictions, capacity, deadlines and dependencies are checked.
4. **Reserve** - temporary holds are created if a multi-step transaction requires them.
5. **Commit** - all participating records mutate atomically or none do.
6. **Journal** - committed facts and required audit entries are appended.
7. **Emit Event** - downstream systems receive facts, never uncommitted intent.
8. **Invalidate Views** - affected read models are refreshed.

Every failed command returns a stable reason code and optional corrective actions. Failure cannot partially consume currency, cargo, tax funds, collateral or escrow unless the owning rule explicitly defines a committed partial outcome.

# 11. UI/View-Model Architecture and Document 17 Boundary

Document 17 owns navigation, focus, common widgets, accessibility primitives, input and general screen architecture. Set 27 owns the economic information that those screens must expose.

## 11.1 Economic View-Model Rules

- view models are read-only;
- they contain player-visible values already filtered by knowledge/permission;
- they identify freshness and confidence where information is imperfect;
- they provide reason codes and plain-language explanation tokens;
- they expose allowed actions and blocked-action reasons;
- they never expose hidden simulation data merely because it exists;
- they are stable enough for controller/split-screen rendering;
- advanced diagnostic fields are separated from player-facing data.

## 11.2 Common Economic View-Model Envelope

| Field | Purpose |
| --- | --- |
| `view_id` | Stable view-model family/instance reference. |
| `subject_refs` | Economic/world subjects represented. |
| `knowledge_state` | Known, estimated, rumoured, stale or hidden. |
| `as_of_time` | Observation/evaluation time. |
| `confidence_band` | Confidence in non-authoritative knowledge. |
| `summary` | Short player-facing interpretation. |
| `metrics` | Allowed numeric/qualitative values. |
| `reason_codes` | Stable explanation categories. |
| `reason_tokens` | Localisable plain-language cause fragments. |
| `actions` | Available commands with permissions. |
| `blocked_actions` | Actions with reason and corrective hint. |
| `history_refs` | Optional drill-down into past committed events. |

# 12. Economy HUD, Notifications and Contextual Feedback

The open-world HUD should not become an economic dashboard by default.

Default contextual economic feedback includes:

- purchase/sale result;
- insufficient funds/stock/capacity message;
- major contract deadline or breach warning;
- shipment arrival/delay/loss alert if tracked;
- enterprise payroll/critical-shortage alert if the player owns/manages it;
- treasury crisis or policy alert for authorised rulers;
- major embargo/restriction change affecting tracked activity;
- optional profit/loss summary after a completed commercial journey.

Routine market noise, every NPC purchase, minor price movement and every background bookkeeping entry are suppressed or grouped.

# 13. Trade, Barter, Currency and Market UI

The default trade interaction should answer four questions immediately:

1. What can I buy/sell/barter here?
2. What will I receive/pay?
3. Why is this price/offer different from what I expected?
4. Is this transaction actually possible now?

## 13.1 Basic Trade View

Shows:

- item/service;
- available quantity;
- unit/total price or barter terms;
- accepted payment methods;
- key price trend icon/text;
- concise reason such as shortage, surplus, low confidence currency, bulk limit or restriction;
- confirm/counter/barter action where supported.

## 13.2 Advanced Market View

May expose:

- current/typical price band;
- supply-demand pressure;
- sellable stock vs protected reserve;
- known expected arrivals;
- liquidity/depth band;
- substitute pressure;
- historical observations;
- information freshness;
- regional comparisons known to the player.

The UI never displays invisible omniscient regional data unless the player's knowledge systems legitimately provide it.

# 14. Merchant, Household, Labour and Enterprise UI

## 14.1 Merchant

Merchant UI exposes policy as understandable behaviour rather than hidden multipliers: overstocked, seeking supply, low cash, reserved stock, restricted item, limited demand, etc.

## 14.2 Employment

Employment views show:

- role/site;
- compensation type and cadence;
- schedule/work coverage;
- term;
- known risks;
- benefits/in-kind components;
- current agreement state;
- reason for acceptance/refusal/counter only when Set 28 permits that knowledge.

## 14.3 Household

Household UI is intentionally limited unless the player owns/manages/has permission. Relevant summaries include affordability/stress bands, protected reserves and major unmet needs, not exhaustive private accounting for every NPC.

## 14.4 Enterprise

Enterprise views support:

- cash and available liquidity;
- current revenue/cost trend;
- payroll due;
- stock/protected stock;
- open contracts;
- production/market blockers;
- owned/leased sites and transport assets;
- profit/loss over selected period;
- permissions and audit history.

# 15. Contract, Credit, Banking and Insurance UI

## 15.1 Contract UI

Before acceptance, the player sees:

- parties and authority;
- obligations and milestones;
- deadlines;
- payment/consideration;
- quality/acceptance rules;
- deposits/escrow;
- cancellation/breach/remedy summary;
- risk warnings;
- current version identifier.

After acceptance, the view emphasises current obligations, evidence, next deadline and blockers rather than repeating legal-style prose.

## 15.2 Finance UI

Loans and credit show total scheduled cost where determinable, outstanding principal, due amount/date, rate/fee model, security/collateral and default consequences. Hidden compounding or surprise fee growth is prohibited.

Insurance shows covered risk, limit, deductible, exclusions, premium status and claim evidence. Claim denial must have explicit reason codes.

# 16. Treasury, Tax, Budget and Public-Finance UI

Public-finance UI scales by player authority.

Basic citizens/traders may see:

- applicable taxes/tolls/tariffs;
- assessment basis;
- amount due/paid;
- exemption/permit status;
- public receipt.

Authorised settlement/faction managers may additionally see:

- fund balances;
- restricted vs general funds;
- committed vs available budget;
- major revenue sources;
- payroll/procurement obligations;
- reserve state;
- projected deficit/surplus;
- debt service;
- high-level service funding.

Detailed ledgers remain optional drill-down rather than the default management surface.

# 17. Trade Route, Shipment and Regional Commerce UI

Trade-route tools should support both planning and tracking.

## 17.1 Route Planning

Shows known:

- origin/destination;
- commodity opportunity;
- available transport class/capacity;
- expected journey time;
- handling/storage costs;
- toll/tariff estimates;
- expected risk/insurance cost;
- expected purchase/sale value ranges;
- expected margin band;
- information freshness.

## 17.2 Shipment Tracking

Shows:

- cargo owner/custodian;
- current economic leg;
- departure/arrival status;
- expected/actual time;
- known delay/diversion;
- contract deadline;
- insurance/finance/fiscal references;
- delivered/lost/damaged quantity after authoritative report.

# 18. Restricted Economy, Embargo and Black-Market UI

Restricted-economy presentation must avoid revealing hidden enforcement or social information the player has not learned.

UI can show:

- known restriction/permit status;
- known embargo/sanction coverage;
- known legal economic consequences;
- underground-access availability if discovered;
- risk premium and handling premium where a black-market quote exists;
- known seizure/loss consequences from committed events;
- route restriction tags and known closures.

The interface must not display exact patrol detection odds, hidden informant state or an NPC's secret willingness unless those systems intentionally reveal it.

# 19. Progressive Disclosure, Accessibility and Player Trust

## 19.1 Information Presets

| Preset | Behaviour |
| --- | --- |
| Basic | Simple prices, balances, major blockers, trend words and contextual alerts. |
| Standard | Adds reason breakdowns, recent history, margins, contract detail and selected business summaries. |
| Advanced | Adds detailed market pressure, ledgers, portfolio exposure, regional comparisons and diagnostic-style economic breakdowns appropriate for gameplay. |

These are presentation presets, not different economic simulations unless the world-performance preset separately changes simulation depth.

## 19.2 Accessibility Requirements

- never communicate profit/loss or shortage only through colour;
- text scale and high contrast supported by Document 17;
- graphs have textual summaries;
- trends use arrows/labels plus optional colour;
- time-sensitive economic actions can use extended timing assistance where gameplay permits;
- dense tables support controller focus and readable column reduction;
- major warnings have captions/text and optional sound/haptic cues;
- numeric abbreviations can be expanded;
- currencies show unambiguous denomination names/symbols.

# 20. Explainability, Reason Codes and Causal Traces

Explainability is a production requirement, not a debugging luxury.

## 20.1 Reason Layers

| Layer | Example |
| --- | --- |
| Result | Merchant refuses to buy 100 more grain. |
| Primary Reason | Target stock exceeded. |
| Supporting Causes | Warehouse already over target; expected harvest arriving; cash reserve low. |
| Player Action | Try another market, wait, reduce quantity or barter for needed goods. |
| Technical Trace | Record IDs, versions, formula inputs and service decisions - developer only. |

## 20.2 Reason-Code Rules

- stable and namespaced;
- localisable text separated from code;
- one primary reason plus optional supporting reasons;
- codes may be grouped into families;
- no raw engine exception is shown as a normal gameplay reason;
- unknown failure is a defect path with diagnostic identifier;
- reason changes that affect player interpretation require migration/version notes if persisted.

# 21. Economic Knowledge, Freshness, Rumours and Confidence

Economic truth and player knowledge are separate.

| Knowledge State | Meaning |
| --- | --- |
| Direct Current | Player is at/connected to the authoritative market/service and may query current data. |
| Recent Observation | Verified observation within freshness horizon. |
| Estimated | Derived from older or partial observations. |
| Rumoured | Communicated claim with provenance from Set 28/social systems. |
| Contradicted | Multiple known observations disagree. |
| Stale | Observation age exceeds normal confidence window. |
| Unknown | Player has no valid knowledge. |

Remote trading or management may require communication infrastructure, delegated agents, magical links or other owning-system capability rather than providing omniscient access by default.

# 22. Simulation LOD Philosophy and Fidelity Tiers

The economic simulation uses fidelity tiers so distant civilisations can remain active without simulating every individual transaction.

| Tier | Name | Typical Scope | Economic Representation |
| --- | --- | --- | --- |
| E0 | Interactive | Player-facing shop, contract, enterprise, treasury or shipment. | Exact records, reservations and transactions. |
| E1 | Local Detailed | Loaded settlement/actors near relevant players. | Exact important stock, named actors, businesses and scheduled transactions; background activity can batch. |
| E2 | Settlement Summary | Unloaded/medium-distance settlement. | Household/business/market/fiscal aggregates with protected identities/obligations. |
| E3 | Regional Summary | Distant group of settlements/routes. | Bounded commodity/service flows, major trade, policy, crisis and financial exposure summaries. |
| E4 | Dormant/Derivable | Never visited, inactive or extremely distant content. | Seed/world definitions + sparse persistent deltas/events; no full economic ticking until relevant. |

Economic LOD is independent of visual LOD but should align with world simulation promotion/demotion where practical.

# 23. Tier Promotion, Demotion and Hysteresis

Promotion/demotion must not oscillate every time a player crosses a boundary.

## 23.1 Promotion Conditions

Promotion may occur when:

- player approaches/loads region;
- player opens a remote authorised management view requiring more detail;
- active quest/contract requires exact state;
- major event requires explicit actors/assets;
- multiplayer relevance expands;
- validation/debug mode pins detail.

## 23.2 Demotion Conditions

Demotion occurs only after:

- no exact interaction is pending;
- reservations/transactions are stable;
- required named identities are captured in summary records;
- obligations/deadlines remain representable;
- conservation snapshot succeeds;
- hysteresis/cooldown expires.

# 24. Detailed Local Economic Simulation

E0/E1 can represent:

- exact merchant inventory links;
- actual currency/account balances;
- named employment agreements;
- enterprise books;
- active contract milestones;
- individual loans/claims when relevant;
- exact treasury transactions;
- physical shipments;
- restrictions affecting specific transactions.

Even locally, routine NPC commerce does not need individual animations or transaction records for every bread purchase unless another system needs that fidelity. Batching is allowed if it still consumes authoritative stock/value and produces equivalent audited results.

# 25. Settlement Economic Summary Simulation

E2 represents a settlement through compact economic state such as:

- commodity availability/reserve bands and conserved aggregate quantities where allowed;
- household classes/requirement batches;
- active enterprises and business state;
- labour capacity by role/skill bands;
- market pressure/memory;
- public treasury/fund summary;
- major contracts/finance obligations preserved individually;
- incoming/outgoing shipments;
- active restrictions/policies;
- unresolved crisis/events.

Named player-linked enterprises, unique contracts, loans, properties or quest-relevant NPC economic records remain individual even when surrounding routine activity is aggregated.

# 26. Regional Economic Summary Simulation

E3 aggregates across settlements while preserving major flows.

Regional state may include:

- commodity production/consumption bands;
- trade surplus/deficit by commodity family;
- route throughput and reliability;
- regional price index observations for simulation use, not a universal player-visible price;
- labour availability trend;
- fiscal health bands;
- major institution exposure;
- embargo/blockade effects;
- strategic shortage/surplus;
- migration/economic pressure signals for owning systems.

Regional simulation cannot create detailed settlement stock from nothing. Any materialised stock on promotion must derive from conserved prior stock, production, imports and consumption represented in the summary.

# 27. Dormant/Unobserved Economic State

E4 exists to avoid simulating worlds the player has never interacted with.

Unvisited locations can remain derived from:

- world seed;
- Atlas/culture/economic definitions;
- generated settlement/resource/route data;
- sparse persistent world-event deltas.

When first activated, the economy initialises from generated authoritative world state rather than replaying fictional years of invisible transactions one by one.

# 28. Bounded Catch-Up and Offline/Unloaded Progress

Catch-up processes elapsed time in bounded windows.

## 28.1 Rules

- maximum cycles per frame/task;
- aggregate long windows instead of replaying every tick;
- cap cascading event generation;
- preserve contractual deadlines and major scheduled obligations;
- preserve stock/resource conservation;
- pause or abstract systems that require unavailable external detail;
- record catch-up version and elapsed period;
- surface major consequences when player returns.

A year of absence cannot generate billions of merchant trades. It produces a deterministic aggregate outcome constrained by capacity, inputs, demand, routes and policy.

# 29. Conservation Ledgers and Reconciliation Gates

## 29.1 Conserved Categories

At minimum, validation tracks:

- physical commodities represented by the economic summary;
- issued/custodied currency balances;
- escrow/reserved currency/goods;
- public funds;
- loan principal/financial claims and corresponding liabilities;
- shipment cargo custody;
- insured claims/payout sources where applicable.

## 29.2 Promotion Reconciliation

Before E2/E3 summary becomes detailed state:

1. validate definition/schema versions;
2. validate total conserved balances;
3. resolve outstanding transfers/reservations;
4. materialise detailed stock within valid containers/capacity or retain summary reservations until placement is possible;
5. restore unique/named obligations;
6. attach current ownership/custody rights;
7. compare expected vs materialised totals;
8. block promotion on unexplained discrepancy beyond approved rounding tolerance;
9. emit diagnostic evidence.

# 30. Determinism, Seeded Randomness and Repeatability

Economic decisions may use bounded seeded randomness for variation, but never uncontrolled frame-time randomness.

Random inputs must derive from stable context such as:

- world seed;
- economic event ID;
- actor/enterprise/market ID;
- scheduled cycle index;
- policy/profile ID.

Randomness is used for tie-breaking, variation or risk outcomes only where the owning design permits it. Core accounting, pricing inputs, tax arithmetic and conservation are deterministic calculations.

# 31. Performance Budgets and Work Scheduling

Exact numeric budgets remain implementation/profile data, but 27J locks the budget classes.

| Budget Class | Required Control |
| --- | --- |
| Active Market Evaluations | Limit merchants/markets updated per frame; dirty/event-driven updates preferred. |
| Enterprise Planning | Queue and stagger enterprise decisions. |
| Contract/Finance Schedules | Process due-time buckets rather than scan all records. |
| Regional Cycles | Bounded jobs with resumable progress. |
| View Models | Refresh only affected/relevant clients/screens. |
| Histories | Compact high-volume routine events. |
| Queries | Cache derived state with dependency/version invalidation. |
| Debug Traces | Disabled/reduced in shipping except bounded player-safe diagnostics. |

No production profile may improve frame rate by skipping authoritative transactions or changing conserved economic outcomes. Profiles may change update frequency, visual detail, forecast depth and aggregation granularity within validated equivalence bounds.

# 32. Multiplayer Authority and Economic Ownership

The host/server owns mutable economic truth.

Clients may request:

- quotes;
- purchases/sales/barter;
- contract offers/acceptance;
- enterprise actions;
- payments/transfers;
- treasury actions if permitted;
- shipment bookings;
- policy changes if authorised.

The server validates:

- actor identity;
- organisation role;
- current record version;
- funds/stock/capacity;
- ownership/custody;
- restrictions;
- rate/quote validity;
- duplicate request nonce;
- dependency availability.

# 33. Atomic Transactions, Reservations and Concurrency

Concurrent economic actions are expected in multiplayer and NPC simulation.

## 33.1 Required Controls

- optimistic version checks or equivalent conflict detection;
- stable transaction IDs/nonces;
- reservations with expiry and owner;
- atomic commit across participating records;
- idempotent retry for network/recovery scenarios;
- deterministic conflict reason;
- no double-spending from simultaneous clients;
- no negative inventory from racing withdrawals;
- no double-booked transport capacity.

## 33.2 Example

Two players try to buy the last iron ingot:

1. both clients display an earlier quote;
2. first validated transaction reserves and commits the ingot;
3. second request revalidates current stock/version;
4. second fails with stock-changed reason;
5. no currency is removed from the second player.

# 34. Shared Enterprises, Treasuries and Permission Roles

Shared organisations use capabilities, not one blanket owner flag.

Recommended capability families include:

- view accounts;
- trade routine goods;
- approve high-value trade;
- hire/fire workers;
- sign contracts;
- borrow/pledge collateral;
- issue insurance/finance actions where institution allows;
- move organisation funds;
- change pricing/procurement policy;
- authorise shipments;
- set taxes/budgets/public spending;
- manage embargo/restriction policy where politically authorised;
- delegate roles;
- close/liquidate organisation.

High-impact capabilities can require thresholds, multi-signature rules or policy configuration without making that complexity mandatory for ordinary play.

# 35. Replication, Relevance and Client View Models

Raw global economic state is not replicated to every client.

Replication prioritises:

- player's inventories/accounts/contracts;
- nearby/current market interactions;
- organisations the player can view/manage;
- tracked shipments/routes;
- public market observations the player has learned;
- active quest/event economic state;
- shared settlement/faction summaries when permitted.

Regional hidden state remains server-side and is exposed only through authorised knowledge/view-model queries.

# 36. Disconnect, Rejoin, Failure and Transaction Recovery

A client disconnect cannot leave half-completed trade.

- committed transactions remain committed;
- uncommitted client-side UI state is discarded;
- server reservations may expire or follow contract rules;
- reconnect rebuilds views from authoritative records;
- long-running actions use server-owned state IDs;
- duplicate retry requests are idempotently rejected/returned;
- save/crash recovery uses journals to identify incomplete transaction boundaries.

# 37. Multiplayer Anti-Exploit, Audit and Dispute Evidence

Required safeguards include:

- authoritative item/currency ownership;
- transaction IDs and actor IDs;
- signed/validated organisation authority state;
- quote version/expiry;
- transfer provenance;
- shipment custody history;
- treasury approval history;
- contract amendment versions;
- financial claim source/liability pairing;
- bounded rate limits for spam-sensitive commands;
- impossible-balance validators;
- optional administrator evidence views for private servers.

Audit history is for integrity and player trust; it is not a surveillance feature. Retain only gameplay-required data.

# 38. Split-Screen and Local Multiplayer Economy

Each local player has independent:

- focus/navigation;
- personal inventory/account views;
- private known information where applicable;
- contract offers requiring individual consent;
- notifications.

Shared organisation/settlement screens may be opened independently. A local player cannot approve another player's private transaction merely because both use the same device.

# 39. Persistence, Save Boundaries and Economic Snapshots

Economic persistence stores authoritative state, not presentation caches unless needed for user settings/history.

Persistent categories include:

- currency/account balances and issuance state;
- market memory required for continuity;
- enterprises, households and economic rights;
- contracts/obligations/evidence;
- loans, collateral, policies, claims and institutions;
- treasuries, budgets and fiscal policies;
- shipments and trade-route economic state;
- restrictions, concessions, black-market contexts and economic-conflict history;
- observations/knowledge important to the player;
- LOD summaries and reconciliation metadata;
- audit/journal data required for integrity.

# 40. Journals, History, Recovery and Save Integrity

High-value economic state should integrate with the project's atomic save/journal/recovery model.

## 40.1 Economic Journal Priorities

Always retain or safely compact:

- money issuance/destruction;
- major transfers;
- escrow changes;
- contract acceptance/amendment/settlement;
- loan creation/default/discharge;
- insurance claim payout/denial;
- treasury appropriation/high-value spending;
- shipment custody/loss;
- seizure/forfeiture economic result;
- organisation ownership/permission changes.

Routine NPC micro-commerce can compact into validated settlement summaries after the retention horizon.

# 41. Schema Versioning and Migration

Economic schemas evolve without rewriting stable identities.

Every persisted economic definition/runtime record declares:

- schema ID;
- schema version;
- definition revision where relevant;
- source pack/namespace;
- migration history or source version;
- unresolved/quarantine state if migration fails safely.

Migration rules:

1. never silently discard balances or obligations;
2. preserve ownership and party identities;
3. preserve due dates using canonical time conversion;
4. preserve currency denomination/value semantics or explicitly convert under approved rule;
5. maintain old aliases only as migration inputs;
6. generate validation evidence;
7. keep backups before destructive migration;
8. fail closed/quarantine records if conservation cannot be proven.

# 42. Set 25 Qualified IDs, Namespaces and Field Ownership

Set 27 uses Set 25's qualified identity grammar:

`<namespace>.<domain>.<identity_path>`

Official production economic definitions normally use `leyforge.core` namespace ownership unless Set 25 approves another namespace/pack.

Examples:

- `leyforge.core.currency.riverward.crown`
- `leyforge.core.market.policy.general_goods`
- `leyforge.core.contract.delivery.standard`
- `leyforge.core.finance.insurance.cargo_basic`
- `leyforge.core.fiscal.tax.market_sales_standard`
- `leyforge.core.trade.route_profile.road_standard`
- `leyforge.core.restriction.embargo.general_goods`

Runtime instance IDs remain separate from definition IDs.

# 43. Economic Schema Families and Registry Domains

27J recommends the following schema families for Set 25 registration/implementation. Exact domain allocation remains Set 25-governed.

| Family | Core Records |
| --- | --- |
| Value/Currency | currency_definition, denomination, acceptance_profile, exchange_profile, value_profile, quote_profile |
| Market | market_context, commodity_facet, merchant_policy, demand_profile, observation_profile |
| Enterprise/Labour | employment_profile, compensation_profile, enterprise_definition, ownership_right_profile, household_economic_profile |
| Contract | contract_profile, obligation_profile, acceptance_profile, escrow_profile, remedy_profile |
| Finance | loan_product, credit_profile, collateral_profile, financial_institution_profile, insurance_product, insolvency_profile |
| Fiscal | tax_policy, tariff_policy, charge_policy, treasury_policy, budget_profile, public_fund_profile |
| Trade | economic_route_profile, shipment_profile, handling_profile, trade_service_profile, intermodal_handoff_profile |
| Restricted Economy | restriction_definition, concession_profile, market_power_profile, black_market_profile, smuggling_economic_profile |
| Integration | economic_lod_profile, economic_authority_profile, economic_reason_definition, economic_view_profile, economic_validation_profile |

# 44. Relationships, Capabilities, Suitability and Fallbacks

Set 25C-style typed relationships should express economic dependencies instead of hardcoded references.

Examples:

- market `serves_settlement` settlement;
- merchant `operates_at` market;
- enterprise `owns_or_leases` structure/asset;
- contract `obligates_party` actor/organisation;
- loan `secured_by` economic right;
- treasury `funds` public project/service;
- route `connects` economic endpoint;
- shipment `uses_transport_provider` terrestrial/maritime/realm provider;
- restriction `applies_to` jurisdiction/commodity/party/route;
- view profile `requires_capability` economic permission.

Capability examples:

- `economy.market.trade`
- `economy.currency.exchange`
- `economy.enterprise.employ`
- `economy.contract.escrow`
- `economy.finance.lend`
- `economy.insurance.underwrite`
- `economy.fiscal.collect_tax`
- `economy.trade.handle_cargo`
- `economy.restriction.customs_clearance`

Fallbacks may identify alternate providers without creating goods. A missing bank capability may fall back to direct cash trade, not to invisible credit.

# 45. Content Packs, Overrides, Optional Modules and Removal

Economic content packs must declare:

- namespace/pack owner;
- required and optional dependencies;
- provided schema families/definitions;
- override/extension policy;
- migrations;
- save-removal behaviour;
- validation profiles;
- localisation/presentation dependencies;
- production classification.

Optional advanced-economy packs may add products or profiles, but may not replace core conservation/authority rules.

If a pack is removed from an existing world, persistent economic records referencing it must be migrated, frozen, substituted by an approved fallback or block world loading with a clear recovery path. They must never silently delete debt, currency, ownership or contracts.

# 46. Registry Import, Compilation and Validation

Authoring pipeline:

1. parse source definitions;
2. validate qualified IDs and namespace authority;
3. validate schema version and field ownership;
4. resolve relationships and capabilities;
5. validate references and optional dependencies;
6. detect circular/invalid economic dependency where prohibited;
7. compile deterministic runtime resources/caches;
8. generate localisation/view-model metadata;
9. run economic invariants and fixture tests;
10. emit manifest/content hashes/evidence.

Generated runtime resources are derived products, not new editable truth.

# 47. Godot Runtime Architecture

Recommended Godot organisation:

- autoload or top-level service container for stable domain services where justified;
- `Resource` definitions for immutable compiled economic definitions;
- lightweight runtime records/data objects for mutable state;
- explicit world/save service ownership;
- signals/event bus for factual post-commit events;
- command handlers for mutation;
- background `WorkerThreadPool`/task jobs only for thread-safe read/compute stages;
- main-thread commit where Godot object/world mutation requires it;
- deterministic integer/fixed precision for conserved money/value quantities where appropriate;
- no per-NPC economic `_process()` loops by default.

# 48. Core Economic Services

Recommended service split:

| Service | Owns |
| --- | --- |
| `EconomicDefinitionService` | Resolved definitions and Set 25 metadata. |
| `EconomicTransactionService` | Cross-domain atomic transaction orchestration. |
| `ValueCurrencyService` | 27B valuation/currency/exchange/quote logic. |
| `MarketService` | 27C market state and merchant economic policy. |
| `EnterpriseLabourService` | 27D economic household/business/employment state. |
| `ContractService` | 27E offers, obligations and remedies. |
| `FinanceService` | 27F financial records and institutions. |
| `FiscalService` | 27G public finance. |
| `TradeEconomyService` | 27H route/shipment economics. |
| `RestrictedEconomyService` | 27I restrictions/black markets/economic conflict. |
| `EconomicSimulationService` | LOD schedules, summary transitions and catch-up. |
| `EconomicKnowledgeService` | Observations, freshness and player knowledge. |
| `EconomicViewModelService` | UI-safe projections. |
| `EconomicAuditService` | Ledgers, causal traces, diagnostics and integrity checks. |

# 49. Commands, Events, Queries and View-Model Adapters

## 49.1 Commands

Examples:

- `RequestTradeQuote`
- `CommitTrade`
- `CreateBarterOffer`
- `PostEmploymentOffer`
- `AcceptEmploymentAgreement`
- `CreateContractOffer`
- `AcceptContractVersion`
- `MakeLoanPayment`
- `FileInsuranceClaim`
- `AssessTax`
- `AuthoriseTreasuryPayment`
- `CreateShipment`
- `BookTransportCapacity`
- `ApplyEconomicRestriction`

## 49.2 Events

Examples:

- `TradeCommitted`
- `CurrencyTransferred`
- `MarketPressureChanged`
- `EmploymentAgreementStarted`
- `ContractBreachRecorded`
- `LoanEnteredArrears`
- `InsuranceClaimResolved`
- `TaxCollected`
- `TreasuryCommitmentCreated`
- `ShipmentDeparted`
- `ShipmentDelivered`
- `EconomicRestrictionChanged`

## 49.3 Queries

Queries never mutate:

- market quote context;
- enterprise cashflow summary;
- contract status;
- debt schedule;
- treasury availability;
- route profitability estimate;
- restriction coverage;
- economic causal trace.

# 50. Summer Engine Development Boundary

Summer Engine may assist with:

- generating bounded Godot service scaffolding;
- producing schema/resource classes from approved contracts;
- writing validators and deterministic fixtures;
- converting registries;
- producing migration scripts under review;
- generating debug panels;
- writing unit/integration tests;
- documenting implementation evidence.

It may not:

- change canonical economic design without approval;
- invent new currency/market/finance rules to make tests pass;
- alter source-of-truth ownership;
- bypass Set 25 task-contract/change-file limits;
- act as runtime market AI;
- directly mutate player worlds outside normal authoritative game code.

# 51. Integration with Physical Resources, Automation and Settlements

Set 27 depends on physical simulation instead of replacing it.

## 51.1 Resources and Recipes

- market supply comes from existing stock/production;
- production cost can read recipes/resources but does not rewrite them;
- contract fulfilment references actual outputs;
- barter transfers real items/rights;
- taxes in kind transfer real goods;
- financial collateral references valid owned rights/assets.

## 51.2 Automation

Automation can:

- increase supply;
- reduce direct labour requirement;
- create maintenance/fuel demand;
- fulfil contracts and warehouse supply;
- influence market pressure.

Automation cannot mint sellable output without valid inputs and processing.

## 51.3 Settlements/Buildings

Economic capability requires valid functional services from Documents 19/20. A decorative market stall cannot activate a market merely because its shape resembles one.

# 52. Integration with Quests, Combat, Factions and World Events

## 52.1 Quests/Events

Quests reference economic records and outcomes. They do not own price, payment or contract truth.

## 52.2 Combat

Combat can produce:

- stock loss/theft;
- infrastructure damage;
- injury/incapacity;
- route disruption;
- seizure/capture evidence;
- increased risk/insurance cost.

Set 27 calculates economic consequences after authoritative combat/security events.

## 52.3 Factions/Cultures

Faction/culture systems supply:

- jurisdiction;
- trade access;
- laws/restrictions;
- preferences;
- diplomatic relationships;
- institutional availability.

Set 27 supplies economic effects without encoding ancestry-based behaviour.

# 53. Document Set 26 Maritime Integration

Set 26 remains authoritative for:

- vessels and vessel capacity;
- maritime movement and voyage state;
- ports/berths/shipyards as physical systems;
- crews as maritime execution roles;
- weather/current/wave/tide navigation effects;
- boarding/naval combat/piracy execution;
- cargo damage/loss caused by maritime events;
- port handling and customs inspection execution where Set 26 owns physical workflow.

Set 27 remains authoritative for:

- cargo economic value;
- contract/payment terms;
- wages/compensation valuation;
- finance/insurance policy and claim economics;
- tariffs/tax posting;
- market supply/demand impact;
- route profit/loss;
- embargo/black-market economic effects.

Intermodal handoff uses one consignment/custody history so cargo cannot exist simultaneously in port, vessel and destination stock.

# 54. Final Sets 27-30 Interface Contract

The following contract consolidates all Set 27 amendment proposals from 27A-27I. It is the Set 27 side of the final reconciliation; Sets 28-30 may refine field names but may not transfer ownership without explicit approval.

## 54.1 Set 28 Social Systems -> Set 27

Set 28 supplies, where applicable:

- social willingness to buy/sell/work/contract/guarantee/cooperate;
- accept/reject/counter result for negotiated economic proposals;
- bounded social concession result within Set 27-provided economic limits;
- trust/reliability modifier known to the economic actor;
- relationship consequence hooks;
- rumour speaker/source/provenance and truth/lie/mistaken state;
- willingness to keep secrecy or participate in underground markets/cartels/boycotts;
- inducement/bribe acceptance/refusal result;
- companion/agent authority and continued willingness;
- protest/strike/compliance outcome as social state.

Set 28 never directly edits:

- fair value;
- market pressure;
- currency balances;
- contract principal/obligations;
- debt balances;
- tax amounts;
- treasury balances;
- shipment quantities;
- black-market stock.

## 54.2 Set 27 -> Set 28

Set 27 supplies factual economic context/events:

- offered terms/value ranges and hard concession bounds;
- employment/business/contract facts;
- contract performance/breach/payment history;
- debt/default/guarantee/insolvency facts;
- tax/relief/public-wage/tribute events;
- trade/shipment outcomes;
- restriction/shortage/price observations;
- economic incentive/cost of participation/defection;
- underground transaction outcome;
- provenance/timestamp/confidence of economic observations.

## 54.3 Set 29 Survival/Health -> Set 27

Set 29 supplies:

- authoritative consumption/requirement batches;
- urgency/essentiality and valid substitutes;
- injury/illness/death events;
- work incapacity/recovery horizon;
- treatment/supply requirement;
- journey provision requirements where enabled;
- environmental preparation requirement references;
- settlement/household crisis severity.

Set 27 converts these into demand, affordability, funding, insurance or commercial consequences but never changes survival state.

## 54.4 Set 27 -> Set 29

Set 27 supplies:

- affordability/purchasing outcome;
- market availability/shortage band;
- public relief/funding eligibility;
- insurance/treatment funding status;
- purchased/reserved provisions;
- substitute-good availability;
- economic duration/confidence of shortage;
- wage-continuation/benefit financial result.

## 54.5 Set 30 Movement -> Set 27

Set 30 supplies:

- terrestrial transport/mount/vehicle identity;
- compatible usable capacity;
- route accessibility;
- expected/actual travel time;
- movement mode;
- operating resource/service requirements;
- condition/availability;
- departure/arrival/diversion;
- delay/breakdown;
- cargo/passenger loss/damage caused by transport execution;
- route/crossing passage event;
- work commute/travel burden;
- inspection/interception outcome references from the owning security system.

Set 27 never calculates terrestrial movement physics/pathfinding.

## 54.6 Set 27 -> Set 30

Set 27 supplies:

- shipment/caravan mission reference;
- origin/destination/waypoints;
- cargo/passenger class and required capacity;
- deadline/window;
- economic route preference/alternates;
- authorised owner/custodian/operator rights;
- toll/customs payment/permit state;
- budget/abort threshold;
- employment/service destination and arrival window;
- finance/insurance/security references where needed;
- restricted-economy exposure tags without hidden enforcement state.

# 55. Cross-Set Interface Versioning and Reconciliation

Interfaces are versioned semantic contracts.

Rules:

1. field meaning cannot change silently;
2. optional fields declare defaults/fallbacks;
3. new required fields increment interface version;
4. producer and consumer compatibility is validated;
5. save-persisted interface payloads use migration rules;
6. no set may reinterpret another set's enum/band without shared amendment;
7. ownership transfer requires explicit Ash approval;
8. final Sets 27-30 integration pass publishes one combined interface register.

# 56. 27A Open-Decision Closure Register

All 25 specialist decisions listed by 27A are now either resolved or explicitly deferred.

| 27A Decision | Resolution |
| --- | --- |
| Currency families/common currency | Resolved in 27B: multiple contextual currencies; no mandatory universal currency. |
| Physical coin weight/slots | Resolved in 27B: simplified authoritative purse/account abstraction by default; physical world forms remain possible. |
| Barter UX/tolerance | Resolved in 27B with receiver-side valuation, mixed payments and bounded acceptance policy. |
| Price formula/volatility/update | Resolved in 27B/27C: deterministic pressure/modifier model, caps, memory and event/scheduled updates. |
| Merchant spread/reserve | Resolved in 27C through merchant policy, target stock, reserves and bulk limits. |
| Market update style | Resolved as hybrid event-driven plus scheduled market cycles. |
| Household aggregation | Resolved in 27D: hybrid household aggregation with important individual property preserved. |
| Rent/land ownership | Resolved in 27D: conditional culture/law-specific rights; no universal private-land assumption. |
| Wage cadence/in-kind | Resolved in 27D: daily accrual/default periodic payroll plus in-kind/other compensation support. |
| Contract escrow/deposit | Resolved in 27E: profile-driven real-value deposit/escrow, not mandatory for every contract. |
| Interest/compound interest | Resolved in 27F: simple-interest baseline; bounded compounding optional by product/profile. |
| Banking availability | Resolved in 27F: capability/institution/culture/settlement dependent. |
| Insurance scope/Core tier | Mechanically resolved in 27F; production tier recommendation set in section 59. |
| Tax granularity | Resolved in 27G: hybrid detailed/aggregated with policy presets. |
| Inflation modelling | Resolved across 27B/27G: explicit currency confidence/issuance plus local price effects; no single magical global inflation scalar required. |
| Debasement/counterfeit/minting | Resolved as optional governed systems with issuer/confidence/provenance rules. |
| Route profitability/risk | Resolved in 27H. |
| Caravan ownership/crew model | Economic side resolved in 27D/27H; movement execution awaits Set 30 final interface. |
| Cross-realm fees | Resolved as provider/route costs in 27H, exact realm mechanics remain with realm owner. |
| Monopoly thresholds | Resolved in 27I as contextual concentration/contestability profiles rather than one universal number. |
| Black-market model | Resolved in 27I, social/security outcomes remain external. |
| Insolvency/closure | Resolved in 27F with 27D enterprise lifecycle handoff. |
| Player business automation limits | Resolved: no arbitrary count cap; constrained by capacity, permissions and performance budgets. |
| Multiplayer company/treasury permissions | Resolved in 27D/27G and finalised in 27J as capability-based roles. |
| Advanced-system production tiers | Resolved as recommendations in section 59; Set 25 retains final classification authority. |

# 57. Difficulty, World Presets and Economic Complexity

Economic depth should scale without creating incompatible worlds.

## 57.1 Economic Complexity Presets

| Preset | Direction |
| --- | --- |
| Relaxed | Stable prices, generous merchant liquidity, simplified taxes/finance, forgiving defaults, reduced illicit/economic-conflict pressure. |
| Standard | Full core economy with readable volatility, contracts, businesses, trade routes and optional deeper systems. |
| Advanced Economy | Greater regional variance, tighter liquidity, deeper finance/public policy, more active restrictions and detailed reporting. |
| Harsh Civilisation | Stronger shortages, route disruption, fiscal pressure, default risk and recovery challenges. |
| Creative/Builder | Economy may be largely optional/simplified while preserving compatibility for settlements and content. |

Simulation-performance presets may independently reduce update frequency/aggregation fidelity but must preserve validated economic equivalence.

# 58. Delegation, Assistance and Economic Automation

Deep economy should not require constant manual administration.

Players may delegate:

- routine merchant restocking;
- wage/payroll execution;
- recurring procurement;
- contract reminders;
- loan/insurance payment reminders or approved auto-pay;
- budget allocation within authorised limits;
- trade-route repeat schedules;
- price/shortage alerts;
- tax collection/payment where appropriate;
- enterprise policy targets.

Delegated systems obey explicit budgets, stock reserves, permissions and stop conditions. They cannot borrow, sell protected assets, change taxes or enter high-risk restricted trade unless authorised by the player's selected policy.

# 59. Set 25 Production Classification Recommendations

These are Set 27 recommendations only. Set 25 makes final production-class decisions.

## 59.1 Core Production Candidate

Recommended core foundations:

- authoritative value/currency/barter basics;
- local market/merchant stock and supply-demand pressure;
- enterprise/household/labour minimum model needed by settlements;
- universal contract/delivery/payment foundation;
- basic treasury/tax/toll interfaces needed by civilisation systems;
- basic trade-route/shipment economics;
- UI reason codes/view models;
- LOD, persistence, multiplayer authority and conservation validation.

## 59.2 Early/Expanded Production Candidate

- broader business ownership/leasing;
- advanced procurement/service contracts;
- simple loans/credit;
- basic cargo/property insurance;
- deeper public budgets/subsidies;
- regional trade networks;
- restricted goods/embargo fundamentals.

## 59.3 Full/Optional Advanced Candidate

- bank-run/institution distress simulation;
- complex insolvency/creditor priority;
- advanced insurance products;
- sophisticated public borrowing/backstops;
- cartel/monopoly strategy depth;
- detailed black-market/smuggling enterprise play;
- large-scale economic warfare and sanctions networks.

None of these tiers may bypass the same conservation, authority, persistence or validation foundation.

# 60. Staged Implementation and Migration Roadmap

## Stage E0 - Registry and Transaction Foundation

- Set 25 economic domains/schemas;
- stable IDs and compiled definitions;
- economic transaction coordinator;
- currency/value basics;
- conservation audit fixtures;
- save schema foundation.

## Stage E1 - Local Trade and Market

- merchant owned stock;
- quotes/barter;
- market pressure/memory;
- basic UI/reasons;
- multiplayer purchase race tests.

## Stage E2 - Households, Labour and Enterprises

- employment agreements/wages;
- household affordability;
- enterprise accounting;
- property/use rights;
- settlement demand integration.

## Stage E3 - Contracts and Trade Logistics

- obligations/escrow;
- shipment economic records;
- Set 30/26 provider interfaces;
- recurring procurement;
- delivery evidence.

## Stage E4 - Public and Financial Systems

- treasury/tax/tolls;
- loans/insurance basics;
- public procurement;
- crisis relief.

## Stage E5 - Regional LOD and Advanced Economy

- settlement/regional summary;
- catch-up/reconciliation;
- cross-region trade;
- restrictions/embargoes/black markets;
- advanced finance/policy if admitted.

Each stage requires migration fixtures and regression evidence before the next stage changes persistent economic schemas.

# 61. Validation Strategy and Release Gates

Economic validation integrates with Set 25E release-gate architecture.

Required suites include:

- schema/reference validation;
- conservation validation;
- transaction atomicity;
- price/market deterministic fixtures;
- contract/finance/fiscal schedule fixtures;
- LOD equivalence/reconciliation;
- multiplayer concurrency;
- migration/recovery;
- UI reason-code completeness;
- accessibility/localisation readiness;
- performance/soak;
- cross-set interface compatibility.

A feature described in these documents is not considered implemented until executable evidence exists.

# 62. Universal Economic Invariants

1. No economic stock exists independently of authoritative physical/storage state unless explicitly defined as a conserved abstract right/financial record.
2. Currency cannot be created or destroyed except through valid issuer/source/sink rules.
3. A transfer cannot both remain with the sender and appear with the receiver after commit.
4. Reservations reduce available capacity/value but do not duplicate ownership.
5. Expected arrivals are not destination stock.
6. Market summaries cannot spend protected reserves unless an authorised transaction releases them.
7. A quote does not reserve stock unless the quote profile explicitly creates a reservation.
8. Contract settlement cannot consume value twice.
9. Escrow cannot exceed the value actually placed into escrow.
10. Financial assets have corresponding liabilities/claims/authorised backing as defined by 27F.
11. Treasury spending cannot exceed available authorised funds unless a valid financed obligation is created.
12. Taxes/tariffs do not create revenue before assessment/collection rules commit it.
13. Shipments have one authoritative custody chain.
14. LOD transitions preserve conserved totals and named obligations.
15. Catch-up cannot process unlimited cycles or generate unlimited compounding events.
16. Client UI cannot mutate authoritative economic state.
17. Shared-organisation actions require current capability permission.
18. Failed transactions are atomic and reasoned.
19. Cross-set external outcomes are consumed as facts; Set 27 does not fabricate them.
20. All production economic definitions resolve through approved Set 25 IDs/schemas.

# 63. Deterministic Acceptance Scenario Suite

| ID | Scenario | Required Result |
| --- | --- | --- |
| ECO-INT-001 | Two clients buy last item simultaneously. | Exactly one succeeds; no double spend or negative stock. |
| ECO-INT-002 | Merchant stock reserved for settlement need. | Sellable stock excludes protected reserve and explains refusal. |
| ECO-INT-003 | Distant shipment listed as expected arrival. | Market pressure may anticipate it; physical stock remains unchanged until delivery. |
| ECO-INT-004 | Player unloads settlement for 90 days. | Bounded catch-up produces deterministic summary; no per-tick explosion. |
| ECO-INT-005 | Settlement promotes from E2 to E1. | Conservation reconciliation passes and materialised stock matches summary. |
| ECO-INT-006 | Contract payment and delivery commit together. | Ownership/payment change atomically or transaction fails. |
| ECO-INT-007 | Client retries timed-out payment request. | Idempotent result; payment occurs once. |
| ECO-INT-008 | Shared-company user without borrowing permission requests loan. | Server refuses with permission reason; no loan created. |
| ECO-INT-009 | Tax policy changes while UI open. | View invalidates/reloads; stale client cannot pay old invalid assessment unless policy preserves it. |
| ECO-INT-010 | Currency definition migrates denomination metadata. | Balances preserved exactly under migration rule. |
| ECO-INT-011 | Economic pack removed with active contract product reference. | World migration blocks/remaps/freeze path; contract is never silently deleted. |
| ECO-INT-012 | Set 29 reports severe medicine demand. | 27C/27D/27G can create demand/relief effects without altering health state. |
| ECO-INT-013 | Set 30 reports road inaccessible. | Trade/shipment profitability/access updates; no movement state invented by Set 27. |
| ECO-INT-014 | Set 28 rejects negotiated contract despite favourable price. | Economic terms remain valid offer data but contract is not accepted. |
| ECO-INT-015 | Set 26 reports maritime cargo loss. | Shipment/contract/insurance/market consequences update once; cargo not retained elsewhere. |
| ECO-INT-016 | Embargo active but hidden from player knowledge. | Server enforces restriction; UI reveals only knowledge-authorised reason detail. |
| ECO-INT-017 | Treasury has budget authority but no materials available. | Spending may reserve/pay valid suppliers but project capability is not conjured. |
| ECO-INT-018 | Crash occurs between reservation and commit. | Journal/recovery resolves transaction to one valid state without duplication. |
| ECO-INT-019 | Price query repeated from same state. | Same fair value/quote inputs produce deterministic result subject to profile-defined seeded variation. |
| ECO-INT-020 | Performance profile changes LOD update frequency. | Authoritative long-horizon economic result remains within validated equivalence bounds. |
| ECO-INT-021 | Bank loan default while player absent. | Due schedules advance through bounded catch-up; principal/interest obey product rules and caps. |
| ECO-INT-022 | Contract deadline passes during unloaded simulation. | Deadline consequence recorded; no need for detailed actor simulation. |
| ECO-INT-023 | Black-market shipment is seized by external security system. | 27I/27H update economic loss from evidence; Set 27 does not invent arrest/detection. |
| ECO-INT-024 | Old save contains legacy short economic IDs. | Migration resolves approved aliases to qualified IDs or blocks with clear repair evidence. |

# 64. Performance, LOD and Soak Testing

Required performance tests include:

- thousands of dormant economic definitions without runtime ticking;
- many settlements at E2/E3 summary;
- repeated promotion/demotion with no balance drift;
- long-duration catch-up;
- high merchant/enterprise counts with staggered planning;
- large contract/loan schedule buckets;
- regional trade network recalculation after route closure;
- history compaction;
- multiplayer trade spam/concurrency;
- split-screen view-model load.

Metrics include CPU time, allocation, save size, catch-up duration, queue backlog, transaction latency, reconciliation failures and reason-trace cost.

# 65. UI, Accessibility and Localisation Testing

Test at minimum:

- keyboard/mouse/controller navigation;
- split-screen independent focus;
- 150%+ UI scale;
- non-colour trend/shortage communication;
- long currency names and translated labels;
- large numbers and multiple denomination formats;
- table reduction on narrow layouts;
- screen-reader/narration-ready labels where supported by Document 17;
- reason text for every blocked core action;
- stale/rumour confidence shown non-visually;
- basic vs advanced information presets.

# 66. Multiplayer, Concurrency and Security Testing

Test:

- simultaneous purchase/sale;
- concurrent treasury payments;
- shared-company permission changes mid-action;
- duplicate network requests;
- reconnect during contract/escrow action;
- reservation expiry;
- client attempts to forge price/currency/stock;
- client sends stale quote version;
- malicious quantity overflow/negative values;
- unauthorised organisation role action;
- cross-player escrow and trade cancellation;
- server restart/recovery during transaction.

# 67. Save, Migration and Recovery Testing

Economic migration fixtures must include:

- old currency definitions;
- active contracts;
- enterprise ownership;
- loans in good standing and arrears;
- open insurance claims;
- treasury commitments;
- shipments in transit;
- market summaries/history;
- embargo/restriction state;
- black-market context;
- E2/E3 LOD summaries;
- corrupted/incomplete transaction journal cases;
- missing optional-pack definitions.

# 68. Diagnostics, Debugging and Economic Observability

Developer tools should answer:

- Why does this merchant think stock is low/high?
- Where did this currency balance come from?
- Which record owns this item/cargo right?
- Which obligations are due?
- Why did this price change?
- What did catch-up process?
- Did LOD reconciliation conserve totals?
- Which client/action changed this treasury?
- Which pack/schema created this definition?
- Why is this route unavailable?
- Why was this transaction blocked?

Recommended tools:

- economic actor inspector;
- market pressure trace;
- transaction/audit viewer;
- conservation ledger report;
- contract/finance timeline;
- treasury fund explorer;
- shipment custody tracer;
- LOD summary/promote/demote inspector;
- registry/schema dependency view;
- reason-code coverage report;
- deterministic scenario runner.

# 69. Production Risks, Redesign Triggers and Scope Controls

| Risk | Consequence | Control / Trigger |
| --- | --- | --- |
| Economy consumes too much CPU | Living world scales poorly. | Increase aggregation, event-driven invalidation and scheduling; never skip conservation. |
| UI overwhelms casual players | Economy feels like mandatory accounting. | Default Basic/Standard views; delegate routine administration. |
| LOD drifts from local truth | Ghost goods/money. | Reconciliation gates and equivalence tests; redesign summary model on repeated drift. |
| Cross-set ownership leaks | Conflicting systems. | Interface contract enforcement and dependency tests. |
| Multiplayer races duplicate value | Save/world corruption. | Atomic transaction coordinator, versions, nonces and reservations. |
| Save migrations lose obligations | Player trust failure. | Fail closed, backups, fixtures and conservation audits. |
| Every economic record persists forever | Save bloat. | Compaction policies with protected audit classes. |
| Advanced finance dominates game | Genre drift. | Optional production tiers/presets and capability gating. |
| Black markets reveal hidden AI state | Exploitable/unimmersive. | Knowledge-filtered view models. |
| Automatic managers make irreversible choices | Player loses agency. | Explicit policy bounds, confirmations for high-impact actions and audit history. |
| Summer Engine makes broad uncontrolled changes | Source-of-truth drift. | Set 25 task contracts, changed-file limits, validation and human approval. |

# 70. Deferred Decisions and Future Expansion Boundaries

The following remain deliberately future-facing rather than blockers for Set 27 design closure:

- exact numeric performance budgets by hardware profile;
- final production classification of every advanced finance/black-market feature;
- final Set 28 social interface field names after that set completes;
- final Set 29 survival requirement payload after that set completes;
- final Set 30 transport execution payload after that set completes;
- legal/justice interface consolidation if later governance documents revise enforcement ownership;
- final player-facing economic chart art/style;
- optional auction/exchange-house specialist mechanics if later approved;
- large-scale macroeconomic modelling beyond the bounded regional systems defined here;
- public mod API specifics;
- cross-server/global economy, which is not part of the current world architecture.

# 71. Final Document Set 27 Acceptance and Handoff

Document Set 27 is design-complete when:

- 27A-27J are approved as one ownership-consistent set;
- cross-document terminology conflicts are resolved;
- all Set 27 cross-set interface amendments are entered into the final Sets 27-30 register;
- Set 25 receives the required economic schema/domain/capability proposals;
- production classification is reviewed under Set 25 governance;
- no specialist document depends on an undefined economic owner;
- no economic system duplicates physical, social, survival or movement truth;
- validation invariants and acceptance scenarios are retained for implementation;
- future implementation tasks can be decomposed into bounded Set 25/Summer Engine task contracts.

After approval, the next work is not another Set 27 design document. It is either the final Sets 27-30 integration reconciliation or later source replacement/implementation work under the project's production roadmap.

# 72. Cross-Set Interface Amendments

27J does not introduce a new ownership transfer. It consolidates prior amendments and proposes three integration-level additions.

## Amendment 27J-A - Economic View-Model Interface

**Reason:** Sets 28-30 and Set 26 may contribute information to a shared economic screen without owning economic presentation state.

**External provider -> Set 27:** permitted, knowledge-filtered status fields plus stable source references.

**Set 27 -> Document 17:** economic view model, freshness, reason codes, actions and permissions.

**Constraint:** external providers do not write economic balances/price state; Set 27 does not own common UI navigation.

**Ownership transfer:** None.

## Amendment 27J-B - Cross-Set Time/LOD Compatibility

**Reason:** Distant economic simulation depends on external systems reporting compatible elapsed-time and state-summary semantics.

**Sets 28/29/30/26 -> Set 27:** elapsed-time compatible state summaries/events using the shared world-time reference, plus promotion/demotion-safe identifiers.

**Set 27 -> external sets:** economic catch-up horizon, due economic commitments and required exact-state promotion requests.

**Constraint:** each set remains owner of its own catch-up logic; Set 27 coordinates only economic dependencies.

**Ownership transfer:** None.

## Amendment 27J-C - Authoritative Cross-Set Transaction Evidence

**Reason:** A Set 27 economic transaction may depend on movement, social consent, survival capacity or maritime outcomes that must be proven without duplicate mutation.

**External owner -> Set 27:** stable factual event/evidence ID, actor/asset refs, outcome, time and integrity/version metadata.

**Set 27 -> external owner:** economic transaction/contract/shipment reference and expected callback/evidence requirement.

**Constraint:** evidence is referenced, not copied into a second mutable truth. Set 27 commits economic consequences once per evidence ID.

**Ownership transfer:** None.

# Appendix A. Economic Runtime Service Map

| Service | Specialist Authority | Key Inputs | Key Outputs |
| --- | --- | --- | --- |
| ValueCurrencyService | 27B | item/service/value defs, market/social/fiscal modifiers | fair value, currency exchange, quote/payment data |
| MarketService | 27C | stock, demand, arrivals, merchant policy | pressure, liquidity, merchant intent, observations |
| EnterpriseLabourService | 27D | NPC capacity, sites, household needs, market state | wages, agreements, business/household accounting |
| ContractService | 27E | parties, terms, evidence, payments | obligations, milestones, breach/remedies |
| FinanceService | 27F | contracts, claims, collateral, institutions | loans, accounts, policies, claims, insolvency |
| FiscalService | 27G | jurisdiction, tax bases, treasury authority | assessments, funds, budgets, public payments |
| TradeEconomyService | 27H | market opportunities, transport-provider results | shipments, costs, margins, regional flows |
| RestrictedEconomyService | 27I | policy, jurisdiction, market state, external enforcement/social results | access restrictions, illicit-market state, economic conflict |
| EconomicSimulationService | 27J | all summaries/events/time | LOD cycles, catch-up, reconcile |
| EconomicKnowledgeService | 27C/27J | observations/social provenance | player-known economic information |
| EconomicViewModelService | 27J + Doc17 contract | knowledge-filtered domain state | UI-ready models |
| EconomicAuditService | 27J | committed events/ledgers | causal traces, integrity evidence |

# Appendix B. Registry and Schema Family Map

| Schema Family | Definition Examples | Runtime Examples | Persistent? |
| --- | --- | --- | --- |
| Currency/Value | currency, exchange, acceptance, value profile | account balance, quote | yes where balance/quote reservation relevant |
| Market | market policy, commodity facet, merchant policy | market instance, demand summary, observation | yes for continuity/history |
| Enterprise/Labour | enterprise type, compensation/employment profile | enterprise, household economic record, agreement | yes |
| Contract | contract/obligation/escrow profile | contract instance, obligation, evidence | yes |
| Finance | loan/insurance/institution profile | debt, account, collateral, policy, claim | yes |
| Fiscal | tax/tariff/fund/budget profile | assessment, fund, appropriation, treasury | yes |
| Trade | route/shipment/handling profile | shipment, consignment, route summary | yes |
| Restricted Economy | restriction, market-power, black-market profile | restriction instance, black-market context, conflict summary | yes |
| Integration | LOD/authority/view/reason/validation profile | summary/reconciliation/audit state | selected fields |

# Appendix C. Economic View-Model Templates

## C.1 Trade Quote View

| Field | Example |
| --- | --- |
| Subject | Iron Ingot |
| Available | 23 |
| Buy Price | 14 crowns |
| Trend | High / rising |
| Primary Reason | Local construction demand |
| Supporting Reason | Expected caravan delayed |
| Freshness | Current |
| Actions | Buy, barter, inspect market |

## C.2 Enterprise Summary View

| Field | Example |
| --- | --- |
| Cash Available | 820 crowns |
| Protected Cash | 210 crowns payroll/tax |
| Revenue Trend | Stable |
| Cost Trend | Rising fuel cost |
| Payroll Due | 3 days |
| Critical Blocker | Iron stock below 2-day target |
| Open Contracts | 4 |
| Suggested Action | Procure iron / reduce batch target |

## C.3 Shipment Summary View

| Field | Example |
| --- | --- |
| Consignment | Grain 120 |
| Origin -> Destination | Hearthplain -> Stoneford |
| Custodian | Caravan Guild A |
| State | In transit |
| ETA | 1.5-2 days |
| Risk | Moderate |
| Known Delay | Bridge detour |
| Contract Deadline | 2.5 days |
| Expected Margin | Positive, confidence medium |

# Appendix D. Simulation LOD Matrix

| Feature | E0 Interactive | E1 Local Detailed | E2 Settlement Summary | E3 Regional Summary | E4 Dormant |
| --- | --- | --- | --- | --- | --- |
| Player trade | exact | exact | n/a until queried/promoted | observation only | unavailable |
| Merchant stock | exact refs | exact/aggregated background | aggregate sellable/reserve | commodity band | derived on activation |
| Household consumption | exact if relevant | batched/detail mix | requirement batches | aggregate demand | derived baseline |
| Enterprise | exact player/important | exact important + batched routine | per-enterprise summary | sector aggregate | dormant definition/delta |
| Contracts | exact | exact | important contracts exact | major contracts exact | persisted if created |
| Finance | exact | exact relevant | record schedules | exposure aggregate + key records | persisted if created |
| Treasury | exact authorised | exact | fund summary | fiscal health aggregate | derived if never created |
| Trade routes | exact tracked shipment | exact local legs | route/shipments summary | flow aggregate | derivable network |
| Restrictions | exact transaction coverage | exact | jurisdiction summary | regional policy | generated definition/delta |

# Appendix E. Set 27 Final Cross-Set Interface Matrix

| Provider | Supplies to Set 27 | Set 27 Supplies Back | Owner Retained By |
| --- | --- | --- | --- |
| Set 28 | willingness, persuasion outcome, trust modifier, social provenance, secrecy, protest/compliance | terms/value context, economic facts/outcomes, observations | Set 28 social; Set 27 economy |
| Set 29 | needs/consumption, health/injury/incapacity, treatment/provision requirements | affordability, funding, shortage, insurance/benefit result | Set 29 survival/health; Set 27 economy |
| Set 30 | land transport capacity, accessibility, time, condition, departure/arrival, damage/loss refs | mission, cargo, deadline, rights, budget, toll/permit state | Set 30 movement; Set 27 economy |
| Set 26 | vessel/voyage/port/cargo execution, maritime incident evidence | value, contract, finance, fiscal, market and restriction economics | Set 26 maritime; Set 27 economy |
| Legal/Security | inspection, seizure, fine/forfeiture, authority/case result | provenance, restriction coverage, value/economic consequence | legal/security owner |
| Documents 19/20 | structure/service capability | funding/value/business/public use | building/settlement owner |
| 07/08 | NPC/work/warehouse/automation physical state | wages, demand, business/market decisions | original owners |

# Appendix F. Consolidated Economic Reason-Code Families

| Family | Examples |
| --- | --- |
| `ECON_VALUE_*` | invalid valuation input, unknown quality, stale value basis |
| `ECON_CURRENCY_*` | unsupported currency, low confidence, insufficient balance |
| `ECON_QUOTE_*` | expired, stock changed, price context changed |
| `ECON_MARKET_*` | protected reserve, low liquidity, demand exceeded, market unavailable |
| `ECON_EMPLOYMENT_*` | no capacity, no authority, compensation invalid, social decision pending |
| `ECON_ENTERPRISE_*` | insufficient working capital, site unavailable, permission blocked |
| `ECON_CONTRACT_*` | offer expired, wrong version, obligation blocked, evidence missing, breach |
| `ECON_FINANCE_*` | credit unavailable, collateral invalid, arrears, claim excluded |
| `ECON_FISCAL_*` | no tax authority, assessment invalid, fund restricted, budget unavailable |
| `ECON_TRADE_*` | no capacity, route unavailable, shipment delayed, handoff failed |
| `ECON_RESTRICT_*` | embargoed, licence required, counterparty restricted, underground access unavailable |
| `ECON_AUTH_*` | permission denied, stale version, duplicate request |
| `ECON_LOD_*` | reconciliation failed, catch-up capped, promotion blocked |
| `ECON_SAVE_*` | migration required, unresolved definition, journal recovery needed |

# Appendix G. Release Acceptance Matrix

| Gate | Minimum Evidence |
| --- | --- |
| Identity/Schema | All production economic definitions resolve qualified IDs and schema versions. |
| Conservation | Automated invariant suite passes across stock, currency, escrow, shipments and financial/public records. |
| Local Economy | Buy/sell/barter/market/enterprise core flows pass deterministic tests. |
| Contracts | Offer -> accept -> fulfil/breach -> settle is atomic and persistent. |
| Finance/Fiscal | Admitted production subset passes schedules, balances and save tests. |
| Trade | Shipment handoff through external transport preserves custody and quantity. |
| LOD | E1/E2/E3 equivalence/reconciliation tests pass representative long runs. |
| Multiplayer | Concurrency/idempotency/permission suite passes. |
| UI | Every blocked core action has reason; basic/advanced views and accessibility pass. |
| Migration | Supported prior fixtures migrate without unexplained value loss/creation. |
| Performance | Target hardware/profile budgets pass packaged builds. |
| Cross-Set | Set 26/28/29/30 interface compatibility suite passes approved versions. |
| Human QA | Player can explain major price/shortage/payment/route outcomes from UI evidence. |

# Appendix H. Document Set 27 Completion Checklist

- [x] 27A locks economic vision, ownership and physical conservation.
- [x] 27B defines currency, barter, valuation and price formation.
- [x] 27C defines markets, merchants, stock and supply-demand simulation.
- [x] 27D defines labour, wages, households, businesses and ownership.
- [x] 27E defines contracts, services, breach and economic remedies.
- [x] 27F defines credit, debt, banking, insurance and financial risk.
- [x] 27G defines taxation, tariffs, treasuries and public finance.
- [x] 27H defines trade routes, caravans, regional and cross-realm commerce.
- [x] 27I defines monopolies, embargoes, smuggling, black markets and economic conflict.
- [x] 27J defines final UI, LOD, multiplayer, registry, migration, QA and integration contracts.
- [x] 27A's open specialist decisions are resolved or deliberately deferred.
- [x] Cross-set interfaces with Sets 28-30 and Set 26 are consolidated without ownership transfer.
- [x] Set 25 schema/capability/production recommendations are identified.
- [x] Deterministic invariants, acceptance scenarios and release evidence requirements are defined.
- [x] Godot/Summer Engine implementation boundaries are explicit.
- [x] Document Set 27 is ready for final cross-set reconciliation after approval.

# Final Cross-Set Reconciliation Addendum - v0.2

**Governing contract:** Leyforge Document Sets 27-30 Cross-Set Interface Register v1.1 - Final Reconciled Contract.

This addendum closes the "future final reconciliation" status retained in the original v0.1 text. Earlier specialist interface names remain valid historical aliases, but v1.1 supplies the canonical integration contracts.

## Final Set 27 Contract Mapping

- Economic/social negotiation, commercial willingness and market-information provenance use **XSET-002**.
- Population/household biological demand, workforce capacity and relief demand use **XSET-003**.
- Terrestrial caravan, delivery, commute, transport-asset and guided passenger/freight execution use **XSET-004**.
- Cross-set time, presence and idempotent evidence use **XSET-001**.
- Economic LOD promotion/demotion coordinates through **XSET-010**.
- Physical route truth remains Set 30-owned; actor rumour/belief about routes remains Set 28C-owned under **XSET-007**.

## Caravan Integration Freeze

27H's `Caravan Economic Mission` is now canonically represented by `TransportMissionRequest` to Set 30. Set 30 returns `TransportExecutionSnapshot`/authoritative arrival evidence. Set 27 continues to own route profit, freight value, contracts, tariffs, insurance and economic loss. Set 30 continues to own capacity, route accessibility, travel time, vehicle/mount condition and physical arrival.

## Final Status

There is no unresolved Set 27 ownership conflict with Sets 28-30. Set 27's remaining external integration items concern Set 26, Set 25, UI/technical owners and implementation details rather than four-set gameplay ownership.
