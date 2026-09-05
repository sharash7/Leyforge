# FANTASY VOXEL CIVILISATION SANDBOX

## DOCUMENT SET 27

# 27E - Contracts, Orders, Services, Breach and Enforcement

**Version 0.1 - Detailed Design Bible and Technical Foundation Draft**

*A persistent obligation framework for procurement, delivery, services, construction, leases, charters, employment interfaces, deposits, escrow, milestones, acceptance, cancellation, breach, disputes, economic remedies, legal handoffs, multiplayer authority, simulation LOD and auditable world consequence.*

**Working design document - economic contract lifecycle, obligation execution and enforcement foundation**

> **Contracts, Orders, Services, Breach and Enforcement System Statement**
>
> Leyforge contracts must represent real promises between real economic actors, backed by real goods, money, rights, labour, service capacity, routes, sites, time and authority. A contract is not a quest objective with decorative legal language and it is not a magical guarantee that resources will appear. It is a persistent agreement containing one or more obligations whose progress can be observed, reserved, fulfilled, delayed, amended, cancelled, disputed, breached or remedied. The economic system may reserve stock, hold deposits, release escrow, withhold payment, terminate access, post compensation claims and convert unresolved amounts into receivables, but it may not invent currency, teleport cargo, fabricate service completion, arrest characters, seize assets by force or decide social forgiveness. Those outcomes remain owned by their respective systems. Nearby execution is physical and visible; distant execution may batch deterministic milestones, but it must reconcile to the same parties, assets, evidence, obligations and history when promoted back into the loaded world.

| Field | Locked Direction |
| --- | --- |
| Document Set | This is Document 27E in Document Set 27: Economy, Trade and Commerce. |
| Document Role | 27E is the universal economic authority for persistent contracts, purchase/procurement orders that become obligations, service agreements, delivery obligations, deposits, retainers, escrow, milestones, acceptance, cancellation, breach classification, economic remedies, disputes and enforcement handoffs. |
| Contract Philosophy | A contract is a persistent agreement over explicit obligations. It records who promised what, to whom, under which conditions, by when, with which consideration, reservations, evidence, remedies and authority. |
| Contract/Quest Separation | Economic contracts exist independently of quest presentation. Document 15 may create, expose or track contract-related objectives, but contract truth remains in 27E. |
| Spot Order Boundary | 27C owns short-lived spot orders/offers and procurement intents. A request becomes a 27E contract when it creates persistent future obligations, deposits, milestones, delivery windows, escrow, penalties, acceptance criteria or breach consequences. |
| Employment Boundary | 27D owns employment economics, wages and specialised employment agreements. 27E supplies the universal obligation/deposit/breach framework used when an employment agreement requires persistent contractual enforcement. |
| Finance Boundary | 27E may create unpaid balances, receivables, compensation claims and secured escrow. 27F owns loans, formal debt instruments, interest, collateral finance, banking, guarantees, insolvency and insurance. |
| Public-Finance Boundary | Public buyers may use 27E contracts, but tax rates, public budgets, treasury authority, public procurement appropriations and fiscal policy remain 27G. |
| Transport Boundary | 27E owns origin/destination, delivery window and economic delivery obligation. 27H, Set 30 and Set 26 own route economics/movement/voyage execution. |
| Legal Boundary | 27E owns contract evidence, dispute state and economic remedies authorised by the agreement. Document 20C/governance-law systems own courts, judgments, warrants, fines, lawful seizure and imprisonment. |
| Social Boundary | Set 28 owns persuasion, trust, loyalty, social forgiveness, relationship response and dialogue. 27E exposes contract performance/breach facts and receives bounded negotiation/social results. |
| Survival Boundary | Set 29 owns health, fatigue, injury, illness and survival conditions. 27E can reference those states only as capacity, force-majeure or service evidence inputs. |
| Movement Boundary | Set 30 owns movement, mounts, carts, wagons and terrestrial physical transport. 27E records delivery/service requirements and consumes execution results. |
| Maritime Boundary | Set 26 owns vessels, ports, crews, voyages, cargo handling, maritime incidents and naval activity. 27E supplies universal contract terms, escrow and breach consequences for maritime commerce. |
| Deposit/Escrow Direction | Contracts do not require deposits by default. Profiles select none, deposit, staged escrow, retainer or fully funded escrow according to value, trust, custom, risk and service type. No escrow amount exists unless actually transferred or reserved. |
| Penalty Direction | Contract penalties are bounded economic obligations, not currency faucets. They transfer value, forfeit valid security, reduce unpaid consideration or create a claim; they never mint money. |
| Force-Majeure Direction | External events do not automatically erase obligations. Contracts declare whether qualifying events pause, extend, permit substitute performance, trigger renegotiation or terminate without ordinary breach. |
| Enforcement Direction | Prefer self-executing economic safeguards first: reservations, escrow, staged payment, retention, deposits, termination, loss of contractual access and auditable claims. Legal/social/physical enforcement is delegated to its owning system. |
| Multiplayer Direction | Contract offer, acceptance, amendment, fulfilment, escrow movement and remedy execution are authoritative transactions with explicit signer authority, version checks and audit records. |
| Registry Direction | Set 25 remains canonical for qualified IDs, schemas, extension ownership, relationships, content packs, migration and validation. |
| Engine Direction | Runtime implementation uses deterministic, event-driven Godot services and persistent records separate from scenes and UI. Summer Engine may assist authoring, validators and tests but cannot autonomously create or enforce hidden runtime obligations. |
| Production Direction | Core Production should support simple delivery/procurement contracts, service/work orders, deposits, milestone payments, acceptance, cancellation, common breach/remedy states and contract UI. Advanced arbitration, guarantees, complex assignment and institutional enforcement may stage later. |
| Final Authority | Ash retains final authority over contract complexity, escrow defaults, penalty severity, legal depth, player-business automation, production tier and any ownership transfer between Document Sets 27-30. |
| Next Deliverable | 27F - Credit, Debt, Banking, Insurance and Financial Risk. |

# Document Purpose

Document 27E turns Leyforge's local markets, enterprises, households, workers, settlements, quests and transport systems into a world where actors can make promises that persist beyond an immediate trade window. Documents 27B and 27C already establish contextual value, executable quotes, real stock and procurement intent. Document 27D establishes persistent enterprises, property rights, wages, leases and operating accounts. Earlier systems already support settlement projects, physical inventory reservations, NPC jobs, world events, maritime cargo, secure multiplayer authority and justice facilities. The remaining gap is the universal lifecycle that connects those systems when an exchange cannot or should not complete instantly.

The main problem 27E solves is the difference between **wanting something**, **offering something**, **promising something** and **actually completing it**. A market may know that a settlement needs 200 grain. A merchant may create a procurement intent. A player may accept a contract to deliver 200 grain within five days. The buyer may reserve funds or place a deposit in escrow. The player may deliver 80, lose a wagon in a storm, request an extension, substitute approved grain varieties, finish late, dispute a quality rejection or fail completely. Every stage needs persistent, explainable and auditable state without turning ordinary play into a legal-management simulator.

A 27E contract therefore consists of a stable agreement plus modular obligations. Obligations may require transferring goods, paying value, performing a service, providing access or custody, reaching a destination, completing a project stage, maintaining a condition, refraining from an action, or providing evidence. Contract templates choose only the modules they need. This keeps the system broad enough for a village delivery, building commission, caravan escort, workshop repair, ship charter, employment retainer, storage lease, recurring supply order or faction service agreement without hard-coding a completely separate runtime for every contract family.

27E also creates a strict boundary around enforcement. The economic system can automatically release or forfeit money that was validly placed in escrow, withhold unpaid consideration, terminate a contractual permission, create a compensation claim or mark an obligation breached. It cannot decide that guards break down a debtor's door, that a court rules against someone, that a friend forgives betrayal or that a player can steal property. Those outcomes consume 27E evidence but remain governed by justice, combat/crime, social or player-authority systems. This separation preserves Leyforge's source-of-truth architecture while still allowing meaningful consequences.

# Design Sources, Authority and Supersession

| Source | Authority Consumed by 27E | 27E Boundary |
| --- | --- | --- |
| 00 - Master Game Design Bible | Living civilisations, trade, player freedom, multiple moral paths and persistent world consequences. | Contracts create optional structured cooperation and conflict without forcing a linear economic career. |
| 01 - Core Gameplay Loop | Explore, gather, craft, build, interact, automate, defend, upgrade and expand. | Contracts may formalise any of these activities but cannot become the only route to progression. |
| 02 - Player Progression | Trading, leadership, diplomacy, engineering, reputation and multiple unlock paths. | 27E exposes contract completion/breach milestones but does not own XP, skills or perks. |
| 03-06 - Blocks, Items, Recipes and Resources | Stable physical goods, qualities, recipes, project inputs, ownership, resource conservation and substitutions. | Contract goods/services reference authoritative definitions and actual lots; no abstract fulfilment bypasses them. |
| 07 - NPC Village System | Persistent NPC identity, jobs, households, inventories, schedules, needs, requests, reputation and memories. | 27E binds parties and obligations to stable actors/organisations but does not own NPC decision AI or social memory. |
| 08 - Automation System | Real storage, reservations, logistics, permissions, transaction-safe item movement and distant summaries. | Automated fulfilment may satisfy contracts only through authorised transactions and traceable contract reservations. |
| 09 - Magic System | Rituals, services, wards, magical risks, permissions and world consequences. | Magical services may be contract obligations; magic execution/risk remains Document 09. |
| 10 - Creatures and Monsters | Threats, escorts, captures, livestock and event consequences. | Creature state may affect capacity/force majeure; creature AI remains external. |
| 11 - Biomes and World Generation | Routes, weather, hazards, regions and events. | Environmental state may alter feasibility/deadlines but 27E does not generate weather or terrain. |
| 12 - Structures | Ownership, activation, damage, repair and restoration states. | Construction/repair contracts reference structure/project states rather than inventing building completion. |
| 13 - Races, Peoples, Cultures and Factions | Law, government, culture, faction authority, territory and custom. | Contract profiles may be culture/law-conditioned; 27E does not define universal real-world-style law. |
| 15 - Quest and Event System | Contracts, requests, multiple solutions, failure, expiration, world events and persistent aftermath. | Quests can wrap contract state and events can trigger exceptions; contract truth stays in 27E. |
| 16 - Combat, Gear and Defence | Surrender, capture, structure damage, conflict and persistent aftermath. | 27E may record economic consequences of hostile interruption but never executes arrest, seizure or violence. |
| 17 - UI/UX System | Secure trade, contracts, permissions, progressive disclosure, reason-first errors, multiplayer and accessibility. | 27E exposes contract view models, states and reasons; UI owns presentation and controls. |
| 19-20 - Settlement Growth and Building Systems | Projects, exact resource requirements, reservations, activation contracts, construction labour, services, governance and justice buildings. | 27E can commission or procure project outcomes without duplicating project construction or court services. |
| 20C - Governance, Safety, Defence, Justice and Emergency Services | Courts/arbitration facilities, evidence, judgments, fines/restitution and legal escalation. | 27E creates disputes/evidence/claims; 20C and law/governance owners resolve formal legal process. |
| 25 - Post-Atlas Governance and Registries | Qualified IDs, schema ownership, relationships, validation, migrations and production classification. | All 27E definitions and runtime records register through Set 25. |
| 26J-26K | Port services, vessel orders, crew contracts, cargo manifests, maritime trade, convoy contribution and multiplayer authority. | 27E supplies generic obligations, escrow and breach; Set 26 owns maritime execution. |
| 27A | Economic architecture, physical conservation, persistent obligations, cross-set ownership and simulation rules. | Governing Set 27 architecture. |
| 27B | Currency, barter, fair value, quotes, transaction value and settlement media. | 27E values consideration, deposits, compensation and damages through 27B; it does not invent prices. |
| 27C | Market contexts, real stock, merchant policy, procurement intents, spot orders and supply-demand pressure. | Persistent procurement promotes into 27E; immediate spot commerce remains 27C. |
| 27D | Labour, wages, households, enterprises, property/lease rights and operating accounts. | 27E supplies universal contract lifecycle while 27D remains owner of employment/business/property economics. |
| Sets 28-30 Interface Register | Social, survival and movement ownership boundaries. | 27E consumes bounded interfaces and records amendments rather than redefining other sets. |
| 99 - Current Manual Testing Guide | Current Godot POC already proves physical inventory, settlement projects, multiplayer-ready authority, saves and audit-oriented transactions. | Used only as implementation baseline; it does not reduce final contract scope to the present POC. |

> **Supersession Rule**
>
> Any earlier executable rule that treats a persistent delivery, service or procurement promise as only a quest flag, assumes deposits/escrow are abstract numbers, allows a contract penalty to create money, permits completion without authoritative evidence, or lets an economic contract directly arrest/seize actors is superseded by 27E. Earlier quest, market, employment, lease and maritime references remain valid as domain-specific content that must now resolve through the 27E obligation lifecycle where persistent contractual enforcement is required.

# Static Table of Contents

1. Locked Contract and Obligation Identity  
2. Locked Decision Summary  
3. Scope and Explicit Non-Goals  
4. Canonical Terminology  
5. Source-of-Truth and Ownership Boundaries  
6. Contract Architecture and Record Separation  
7. Contract Families and Obligation Modules  
8. Parties, Roles, Capacity and Signing Authority  
9. Offer, Invitation, Negotiation and Formation  
10. Acceptance, Activation and Effective Time  
11. Consideration, Payment and Mixed Compensation  
12. Goods and Transfer Obligations  
13. Service and Work Obligations  
14. Procurement and Persistent Purchase Orders  
15. Delivery, Destination and Handover Obligations  
16. Construction, Repair and Project Contracts  
17. Employment, Retainers and 27D Integration  
18. Lease, Licence, Concession and Charter Integration  
19. Agency, Brokerage and Representation Contracts  
20. Standing Orders, Recurring Supply and Framework Agreements  
21. Specifications, Quality, Condition and Substitution  
22. Quantity, Lot, Packaging and Measurement Rules  
23. Deadlines, Windows, Schedules and Grace Periods  
24. Milestones, Partial Performance and Staged Completion  
25. Reservations, Deposits, Retainers and Performance Security  
26. Escrow, Custody and Conditional Release  
27. Evidence, Inspection, Certification and Proof of Performance  
28. Acceptance, Rejection and Cure  
29. Amendment, Variation, Extension and Renegotiation  
30. Assignment, Delegation, Novation and Transfer  
31. Cancellation, Withdrawal, Termination and Expiry  
32. Force Majeure, Impossibility and External Events  
33. Breach Classification and Materiality  
34. Economic Remedies and Remedy Ordering  
35. Compensation, Restitution, Forfeiture and Liquidated Amounts  
36. Claims, Receivables and 27F Debt Boundary  
37. Disputes, Contested Evidence and Resolution Paths  
38. Legal Enforcement and Governance Boundary  
39. Social Reputation, Trust and Set 28 Boundary  
40. Crime, Coercion, Seizure and Combat Boundary  
41. Quest, Event and Narrative Integration  
42. Settlement and Public Procurement Integration  
43. Market and Merchant Integration With 27B-27C  
44. Enterprise, Property and Labour Integration With 27D  
45. Credit, Banking, Insurance and 27F Handoff  
46. Tax, Treasury and 27G Handoff  
47. Trade Routes, Caravans and 27H Handoff  
48. Restricted/Illicit Contracts and 27I Handoff  
49. Maritime Contracts and Set 26 Integration  
50. Automation and Machine-Assisted Fulfilment  
51. Simulation LOD and Distant Contract Execution  
52. Persistence, History, Evidence and Audit Trails  
53. Multiplayer Authority, Shared Organisations and Signatures  
54. UI/UX, Explainability and Accessibility  
55. Set 25 Registry, Schema and Relationship Contracts  
56. Godot/Summer Engine Technical Architecture  
57. Validation Invariants and Reason Codes  
58. Representative Acceptance Scenarios  
59. Balance, Difficulty and Anti-Micromanagement  
60. Production Classification Guidance  
61. Open Decisions and Handoffs to 27F-27J  
62. Cross-Set Interface Amendments  
Appendix A. Contract and Obligation Record Templates  
Appendix B. Escrow, Deposit and Evidence Templates  
Appendix C. Contract State and Reason-Code Catalogue  
Appendix D. Cross-System Responsibility Matrix  
Appendix E. Suggested Contract Profiles  
Appendix F. Deterministic Validation Matrix  
Appendix G. 27E Completion Checklist

# 1. Locked Contract and Obligation Identity

The contract system is the persistent promise layer of Leyforge's economy. It begins where an immediate trade ends: when at least one party must do something later, do something repeatedly, meet a condition, preserve a right, deliver to another place, pass an inspection, wait for a milestone or face consequences for non-performance.

> **Locked Rule**
>
> A contract may record only obligations that can be evaluated against authoritative game state or an explicitly owned external decision. A contract cannot complete because a timer reached zero if the promised goods, service, payment, right or evidence never existed. It cannot penalise by minting value. It cannot directly perform legal arrest, physical seizure, social forgiveness or movement. It may only reserve, transfer, release, withhold, terminate or claim economic value and rights that it has valid authority to affect.

## 1.1 Player-Facing Promise

A player should be able to understand:

- what they promised;
- what the other party promised;
- when each promise is due;
- which resources or funds are already reserved;
- which parts are complete;
- what evidence the system accepted;
- whether substitutions are allowed;
- what happens if the route closes;
- whether a late delivery can still be cured;
- why a payment is being withheld;
- why a deposit was returned or forfeited;
- whether the contract is cancelled, terminated, breached, disputed or completed;
- which consequence is automatic and which requires a court, social decision or follow-up quest;
- who had authority to sign on behalf of a shared company or settlement;
- how to challenge a rejection or inspection result where the profile allows it.

## 1.2 Identity Layers

| Layer | Meaning | Player-Facing Result |
| --- | --- | --- |
| Agreement | Persistent relationship between parties. | The player can inspect the whole deal in one place. |
| Obligation | One required promise inside the agreement. | Progress can be evaluated independently. |
| Consideration | Value promised in exchange. | Payment, barter and benefits are explicit. |
| Reservation/Security | Value held to make performance credible. | The player sees what is locked and why. |
| Evidence | Authoritative proof that something occurred. | Completion is explainable rather than arbitrary. |
| Remedy | Economic response to valid failure. | Consequences follow declared terms. |
| Dispute | Contested performance/evidence/remedy. | The game can pause automatic finality and hand off correctly. |
| History | Immutable event sequence plus current state. | Save/load and multiplayer disputes can be audited. |
| Domain Adapter | Link to projects, transport, labour, maritime, law or quests. | One contract framework serves many systems without owning them. |

# 2. Locked Decision Summary

| Area | Locked Decision |
| --- | --- |
| Core Model | Use one `ContractInstance` containing typed parties, terms and modular `ObligationInstance` records. Contract families are templates, not separate hard-coded engines. |
| Formation | A persistent contract requires identifiable parties, authority, essential terms, acceptance and a versioned agreement snapshot. Some profiles may also require deposit/security before activation. |
| Negotiation | 27E owns economic term proposals and version history. Set 28 owns social willingness, persuasion and relationship-driven concessions. |
| Consideration | Currency, goods, services, rights, access, housing, shares, barter and mixed consideration are supported where the owning systems validate them. |
| Procurement | 27C procurement intents may promote into 27E persistent purchase/delivery contracts. A procurement intent itself is not a contract. |
| Services | Service completion requires service-capacity/execution evidence from the owning gameplay system, not just elapsed time. |
| Delivery | Delivery requires valid origin/destination, custody/ownership transfer terms, quantity/condition and authoritative handover evidence. Movement remains external. |
| Deposits | No universal mandatory deposit. Profile defaults: none for low-risk immediate/simple agreements; optional 10-25% balance-draft deposits for moderate bespoke work; larger/staged security for high-cost custom projects where useful. Exact percentages remain profile/balance data. |
| Escrow | Escrow must hold actual transferred/reserved value under a neutral/authorised custody record. Escrow cannot be an unfunded promise. |
| Milestones | Supported. Each milestone defines completion evidence, acceptance window, payment/release rule and dependencies. |
| Partial Performance | Supported when the contract says quantity/stage is divisible. Indivisible obligations cannot be auto-partially completed. |
| Substitution | Allowed only through explicit tags/rules and equivalent-quality bounds or approved amendment. |
| Acceptance | Objective goods can auto-accept when criteria are deterministic; subjective/bespoke services may require party acceptance, inspector certification or timeout policy. |
| Cure | Many breaches should permit a cure period such as replace defective goods, finish missing quantity or make late payment before escalation. |
| Force Majeure | Contract profile declares recognised external event categories and their effects. Event occurrence alone does not silently rewrite terms. |
| Breach | Breach is classified by obligation, severity, cause and cure state. Material breach can terminate broader obligations only when the agreement says so. |
| Remedies | Primary economic remedies: withheld consideration, refund, deposit/security release or forfeiture, replacement/cure, compensation claim, restitution, price reduction, access termination and contract termination. |
| Penalties | Bounded and declared. No punitive multiplication that creates impossible debt or free currency. Profiles should cap liquidated amounts relative to contract value/risk. |
| Debt Boundary | Unpaid final amounts can become receivables/claims. Formal debt instruments, interest and creditor finance are 27F. |
| Legal Enforcement | Courts, judgments, warrants, legal fines and forced seizure remain governance/law. 27E supplies the case/evidence/claim payload. |
| Social Consequence | 27E emits factual performance events. Set 28 decides trust, relationship and dialogue outcomes. |
| Quest Integration | Contract and quest may reference one another but maintain separate state. Completing a quest does not automatically complete a contract unless the contract's obligations are actually satisfied. |
| Public Procurement | Same contract engine; budget/appropriation/tax ownership remains 27G. |
| Maritime | Same contract engine for cargo, charters, port services, convoy/escort and vessel orders; Set 26 executes maritime activity. |
| Automation | Machines may fulfil goods/service obligations only when authorised, capable and linked to the contract/reservation. |
| LOD | Distant contract simulation advances by bounded obligation checkpoints, not by pretending every local interaction occurred. |
| Multiplayer | Contract mutations are authoritative and version checked. Shared organisations use explicit signatory capabilities and audit trails. |
| Accessibility | Players receive plain-language summaries, deadlines, blockers, consequences and reason codes; advanced legal/economic detail remains expandable. |

# 3. Scope and Explicit Non-Goals

## 3.1 In Scope

27E owns:

- persistent economic contract definitions and instances;
- obligation modules and dependencies;
- economic offer/version/acceptance lifecycle;
- signatory authority checks;
- procurement contract promotion;
- delivery and service obligation contracts;
- construction/repair commission contracts;
- lease/charter/retainer lifecycle integration;
- recurring and standing contractual supply;
- specifications, quality, condition and substitution terms;
- dates, windows, milestones and partial performance;
- deposits, retainers, reservations and escrow;
- evidence/inspection/acceptance contracts;
- amendment, cancellation, assignment and termination;
- force-majeure/external-event handling;
- breach classification and cure;
- economic remedies and compensation claims;
- dispute state and handoff payloads;
- economic enforcement that can be performed without legal force;
- contract persistence, LOD, multiplayer authority and audit;
- Set 25 schemas and Godot runtime-service direction.

## 3.2 Explicit Non-Goals

27E does not own:

- NPC personality, trust, romance, loyalty, persuasion or social forgiveness - Set 28;
- health, fatigue, illness, injury or medical treatment - Set 29;
- movement, pathfinding, mounts, carts, wagons or terrestrial travel physics - Set 30;
- vessel movement, port handling, maritime navigation or naval combat - Set 26;
- commodity price formation, currency exchange or barter valuation - 27B;
- market supply/demand, merchant stock policy or spot orders - 27C;
- wage formation, household economics, enterprise ownership or property-right definition - 27D;
- loans, interest, banking, collateral finance, guarantees, insurance or insolvency - 27F;
- taxes, tariffs, public budgets or treasury policy - 27G;
- terrestrial route profitability and caravan economic mission planning - 27H;
- smuggling, embargo/black-market network economics or economic warfare - 27I;
- final economy-wide UI/LOD/network integration - 27J;
- law definitions, criminal offences, court procedure, imprisonment or forcible confiscation - governance/law owners;
- quest/narrative writing or objective graph ownership - Document 15;
- item, recipe, structure or project execution truth - their owning documents;
- real-world legal simulation, procedural legal drafting or jurisdiction-specific law.

# 4. Canonical Terminology

| Term | Canonical Meaning |
| --- | --- |
| Contract Definition | Reusable data template describing allowed parties, modules, defaults, evidence and remedy profiles. |
| Contract Instance | Persistent accepted agreement with specific parties, terms, obligations and history. |
| Party | Actor, household, enterprise, settlement, faction or authorised organisation participating in a contract. |
| Role | Contract-specific function such as buyer, seller, client, provider, employer, worker, lessor, lessee, charterer or carrier. |
| Signatory | Actor/authority that validly binds a party to an agreement. |
| Offer | Versioned proposed terms capable of acceptance while valid. |
| Invitation | Non-binding request for offers, bids or interest. |
| Obligation | A required future action/state owed by one party to another. |
| Consideration | Value promised in exchange for obligations. |
| Deliverable | Goods, service output, project stage, document/certificate, access right or other accepted result. |
| Milestone | Named checkpoint containing one or more obligations and optional payment/release rules. |
| Reservation | Authoritative hold preventing specific value/capacity from being used inconsistently elsewhere. |
| Deposit | Value transferred/held to demonstrate commitment or secure a defined risk. |
| Retainer | Advance value securing future availability/service capacity, consumed or released according to terms. |
| Escrow | Value held under conditional custody until release conditions are met. |
| Performance Security | Deposit/escrow or other 27E-controlled reserved value exposed to agreed performance consequences. Formal guarantees remain 27F. |
| Evidence | Authoritative fact/reference used to evaluate performance. |
| Inspection | Evaluation of a deliverable against declared criteria. |
| Acceptance | Determination that a deliverable satisfies its contract criteria. |
| Cure | Allowed corrective action after deficient or late performance. |
| Breach | Failure to satisfy an enforceable obligation according to the agreement and current exception/cure state. |
| Material Breach | Breach severe enough, under the contract profile, to permit termination or broader remedies. |
| Remedy | Permitted economic consequence or corrective outcome after non-performance. |
| Claim | Recorded asserted entitlement to value/remedy that is not yet finally settled. |
| Receivable | Recognised unpaid amount owed to a party. Formal financing of it belongs to 27F. |
| Dispute | State in which performance, evidence, interpretation or remedy is contested. |
| Termination | Ending future obligations under defined conditions without deleting historical obligations/evidence. |
| Cancellation | Contract ending before or without ordinary completion under agreed cancellation rules. |
| Expiry | Automatic end of an unaccepted offer or time-bounded agreement/option when no extension applies. |
| Assignment | Transfer of a contractual right/benefit where permitted without replacing the obligated party. |
| Delegation | Authorised performance by another actor while responsibility remains with the original obligor unless novated. |
| Novation | Approved replacement of a party/obligation relationship, producing a new binding party configuration. |
| Force Majeure | Declared external event category that activates specific contract exception rules. |
| Economic Enforcement | Automatic/authorised economic actions such as escrow release, withholding, refund or contractual access termination that do not require physical/legal force. |
| Legal Enforcement | Court/governance process such as judgment, warrant or lawful seizure; outside 27E. |

# 5. Source-of-Truth and Ownership Boundaries

27E distinguishes five kinds of truth that must not be collapsed.

| Truth | Owning Source | 27E Use |
| --- | --- | --- |
| Contract truth | 27E | Parties, terms, obligations, state, reservations, evidence links, breach/remedies. |
| Physical goods/funds | Items/storage/27B/27D accounts | Referenced and reserved/transferred; never duplicated into contract state as independent stock. |
| Service/project execution | Owning gameplay system | Supplies evidence of performed work/result. |
| Social/legal outcome | Set 28 / governance-law | Consumes factual contract events and returns external decision where needed. |
| Movement/route execution | Set 30/27H/Set 26 | Supplies arrival, delay, loss and accessibility evidence. |

A contract record may cache readable snapshots such as `agreed_unit_value`, `accepted_quality_rule` or `destination_name`, but the authoritative target references remain stable IDs/records. Cached values exist to preserve the agreement as it was made; they do not overwrite current item definitions or ownership.

# 6. Contract Architecture and Record Separation

The runtime uses layered records rather than one giant mutable object.

| Record | Purpose |
| --- | --- |
| ContractDefinition | Reusable family/profile and allowed modules. |
| ContractOffer | Proposed versioned terms before binding acceptance. |
| ContractInstance | Binding agreement identity, parties, state and policy snapshot. |
| ObligationDefinition | Reusable obligation module type. |
| ObligationInstance | Specific owed action/state and progress. |
| MilestoneInstance | Groups obligations and release/acceptance rules. |
| ReservationLink | Points to stock/funds/capacity held elsewhere. |
| EscrowRecord | Conditional custody over actual economic value. |
| EvidenceRecord | Immutable/append-only proof references and confidence/issuer. |
| InspectionRecord | Evaluation of evidence/deliverable against criteria. |
| BreachRecord | Non-performance assessment, cause, materiality and cure state. |
| RemedyRecord | Authorised economic response and execution status. |
| DisputeRecord | Contested issue, parties, frozen actions and resolution path. |
| ContractHistoryEvent | Append-only important state transition/audit event. |

## 6.1 Contract State Model

Recommended top-level states:

1. `draft`
2. `invitation`
3. `offered`
4. `negotiating`
5. `accepted_pending_activation`
6. `active`
7. `suspended`
8. `disputed`
9. `completed`
10. `cancelled`
11. `terminated`
12. `expired`
13. `breached_closed`
14. `voided_by_external_authority` where a valid governance/law result requires it.

A contract should not jump from `offered` to `completed`. Each accepted agreement receives a stable instance and at least one obligation. `Disputed` does not erase existing performance; it changes which automatic transitions/remedies are permitted until resolution.

## 6.2 Obligation State Model

Suggested obligation states:

- planned;
- awaiting_prerequisite;
- ready;
- in_progress;
- tendered_for_acceptance;
- accepted;
- partially_accepted;
- deficient;
- overdue;
- cure_open;
- suspended;
- waived;
- cancelled;
- breached;
- satisfied.

# 7. Contract Families and Obligation Modules

Contract families compose modules rather than inventing bespoke runtime code.

## 7.1 Core Contract Families

- purchase/procurement;
- delivery/supply;
- service/work order;
- repair/maintenance;
- construction/project commission;
- recurring supply/standing order;
- employment/retainer adapter;
- lease/licence/concession adapter;
- charter/transport adapter;
- agency/brokerage;
- storage/custody;
- escort/guard/service mission;
- research/training/teaching where the owning progression/social system allows;
- settlement/public procurement;
- faction/cultural service agreement;
- maritime cargo/port/vessel service adapters.

## 7.2 Obligation Modules

Reusable modules include:

- `transfer_goods`;
- `transfer_currency_or_value`;
- `provide_service_capacity`;
- `complete_service_result`;
- `deliver_to_destination`;
- `maintain_stock_floor`;
- `complete_project_stage`;
- `grant_access_right`;
- `grant_use_or_operate_right`;
- `return_asset`;
- `preserve_condition`;
- `inspect_or_certify`;
- `provide_information_or_manifest`;
- `refrain_from_declared_action` where externally observable;
- `maintain_availability_window`;
- `accept_or_reject_within_window`;
- `pay_fee_or_share`;
- `return_deposit_or_security`;
- `record_handover`;
- `notify_exception`.

The system should prefer a small robust module library over hundreds of special contract scripts.

# 8. Parties, Roles, Capacity and Signing Authority

Every contract party resolves to a persistent actor or organisation record. The contract stores a role, not a new copy of identity.

Supported party classes include:

- player character;
- named NPC;
- household where household authority exists;
- enterprise;
- settlement;
- faction;
- guild/cooperative;
- public office;
- player organisation;
- other future organisation records that Set 25 recognises.

## 8.1 Signatory Authority

A party may be bound only by:

- itself, where an individual has capacity;
- a role holder with explicit `contract.sign` capability;
- a settlement/faction office whose policy permits the contract type/value;
- a multiplayer organisation role with matching authority;
- a delegated agent whose active agency contract permits that scope.

Authority can be constrained by:

- contract family;
- maximum value;
- asset/property category;
- region or site;
- duration;
- counterparty class;
- required co-approval;
- public budget reference;
- emergency state.

A forged UI click, stale role, removed manager or client-side permission cannot bind the organisation.

## 8.2 Party Capacity

27E can reject activation when a required domain states that the party lacks necessary economic/legal capacity, for example:

- dead or unavailable actor from Document 07;
- organisation dissolved or suspended under 27D;
- signer lacks authority;
- property/asset not owned or controllable;
- public office lacks budget authority from 27G;
- contract type prohibited by current law profile;
- required consent/guardian/representation rule supplied by the appropriate social/governance owner.

27E does not invent those external capacity rules.

# 9. Offer, Invitation, Negotiation and Formation

## 9.1 Invitations Are Not Offers

A request board, tender notice, procurement listing or NPC statement may be an **invitation** rather than an executable offer. It can solicit proposals without obligating the issuer to accept the first response.

Examples:

- village requests bids for 500 stone blocks;
- shipyard asks for repair estimates;
- merchant advertises desired weekly grain supply;
- settlement invites builders to propose a bridge project;
- faction seeks caravan guards.

The UI must identify whether the player is viewing:

- an informational need;
- an invitation to offer;
- a firm offer;
- a currently negotiable proposal;
- an accepted contract.

## 9.2 Offer Requirements

A binding-capable offer normally includes:

- offer ID/version;
- issuer and authorised role;
- intended counterparty or eligibility rule;
- contract definition/profile;
- essential obligations;
- consideration/payment;
- due dates/windows;
- acceptance expiry;
- major deposit/escrow requirements;
- material cancellation/breach rules;
- required legal/permission conditions;
- current quote/value snapshot where relevant.

A missing non-essential descriptive field may be filled later. A missing essential term cannot silently default after acceptance if doing so changes value or risk.

## 9.3 Negotiation Boundary With Set 28

27E owns the economic proposal surface:

- price/payment amount;
- quantity;
- deadline;
- milestone structure;
- deposit/security;
- substitution rules;
- cancellation terms;
- service scope;
- remedy profile.

Set 28 owns whether an NPC is socially willing to negotiate, how persuasion/intimidation/relationship affects their concession envelope, and how the conversation is presented.

The interface is:

**27E -> Set 28:** proposed terms, economic fairness/risk summary, hard policy limits, allowed concession ranges, authority and urgency.

**Set 28 -> 27E:** accept, reject, counter-proposal request, bounded concession modifier, refusal category and social consequence hook.

Set 28 cannot directly mutate funds or contract terms. 27E validates the returned proposal against economic policy and authority.

# 10. Acceptance, Activation and Effective Time

Acceptance creates a new binding contract instance from an immutable snapshot of the accepted offer version.

## 10.1 Acceptance Validation

Before commit, authority revalidates:

1. offer still exists and has not expired;
2. offer version still matches;
3. signer still has authority;
4. required funds/stock/security remain available;
5. referenced assets/rights still exist;
6. no conflicting exclusive contract/reservation was committed first;
7. required law/public-budget/permission checks still pass;
8. counterparty eligibility remains valid.

The system then atomically:

- creates the contract instance;
- creates obligation instances;
- creates/resolves required reservations;
- moves any activation deposit/escrow value;
- records accepted terms;
- emits `ContractActivated` or leaves `accepted_pending_activation` if a declared prerequisite remains.

## 10.2 Effective Time

Contracts may become effective:

- immediately on acceptance;
- when required security is funded;
- at a future in-game time;
- on delivery of an initial resource;
- when a site/asset becomes available;
- when a public/faction approval activates;
- when a preceding contract/milestone completes.

Wall-clock time is never authoritative for gameplay contracts. World/server simulation time is used.

# 11. Consideration, Payment and Mixed Compensation

27E reuses 27B valuation and 27D account/ownership records.

Consideration may include:

- currency;
- barter goods;
- staged currency + goods;
- service-for-service exchange;
- goods-for-service;
- housing/provision rights from 27D;
- production/profit share from 27D;
- access/use rights;
- settlement/faction permission where that permission is a valid external right;
- future payment obligation;
- combinations of the above.

## 11.1 Payment Timing Profiles

Common profiles:

- **on acceptance** - immediate payment;
- **deposit + completion**;
- **deposit + milestones + retention**;
- **on delivery/acceptance**;
- **periodic** - weekly/monthly/seasonal service;
- **per unit** - accepted quantity or service unit;
- **retainer drawdown**;
- **revenue/share settlement** through 27D;
- **post-completion invoice/receivable** with 27F handling if unpaid.

## 11.2 Payment Conservation

No obligation may mark `paid` unless:

- currency/value actually transferred;
- valid escrow release transferred it;
- authorised set-off reduced two real opposing obligations;
- another permitted consideration was actually delivered and accepted.

A UI reward, quest completion or contract state alone cannot create payment.

# 12. Goods and Transfer Obligations

A goods obligation references authoritative item/resource lots rather than abstract ownership.

Fields normally include:

- item/tag/family requirement;
- quantity and unit;
- quality/grade/purity/condition bounds;
- accepted substitutions;
- packaging/container requirement if relevant;
- source restrictions if relevant;
- destination or handover party;
- ownership transfer point;
- custody transfer point;
- reserved lot links;
- inspection method;
- partial delivery rule.

## 12.1 Ownership Transfer Point

The agreement declares when ownership changes, for example:

- when goods enter buyer-controlled storage;
- on verified handover at a market/warehouse;
- when loaded aboard a carrier under a specific sale term;
- after inspection/acceptance;
- progressively per accepted lot.

Custody and ownership can differ. A carrier may possess cargo without owning it.

# 13. Service and Work Obligations

Services are not inventory items and must not be faked as such. A service obligation points to a capability/execution owner.

Examples:

- repair 20 damaged wall blocks;
- inspect a bridge;
- escort a caravan;
- provide blacksmith labour for three work shifts;
- maintain a ward for seven days;
- train an apprentice to a declared milestone;
- transport cargo between two sites;
- perform a magical cleansing ritual;
- survey a construction parcel;
- provide storage capacity for a period.

## 13.1 Service Evidence

A service can be satisfied by:

- completed work-package records;
- authoritative recipe/repair events;
- route/escort outcome records;
- attendance/contribution records;
- structure-state transition;
- valid certification from an authorised inspector;
- time-bounded capacity evidence where the service is availability rather than output.

Elapsed time by itself is insufficient unless the contracted service is specifically an availability obligation and the provider remained validly available.

## 13.2 Service Capacity Reservation

Some services may reserve:

- worker time;
- machine slot/time;
- berth/workshop/stall capacity;
- warehouse space;
- specialist availability;
- vessel/vehicle capacity;
- magical network capacity.

27E stores the reservation reference; the owning system owns actual capacity.

# 14. Procurement and Persistent Purchase Orders

27C procurement intent becomes a 27E contract when future performance becomes binding.

## 14.1 Promotion Flow

1. 27C identifies residual demand or buyer procurement policy.
2. A buyer issues an invitation, firm procurement offer or standing-order proposal.
3. Supplier submits/accepts terms.
4. 27E validates funds/security/authority.
5. Persistent obligations are created.
6. Root requirement ID is preserved so market demand is not double-counted.
7. Deliveries reduce both contract obligation and associated unresolved demand only once.

## 14.2 Purchase Order Types

- fixed quantity, fixed destination;
- quantity range with maximum commitment;
- call-off order under framework agreement;
- periodic supply;
- emergency supply;
- project-linked procurement;
- buyer-pickup;
- seller-delivery;
- third-party carrier delivery.

## 14.3 No Infinite Procurement

A procurement contract requires:

- funded or authorised payment path;
- physical acceptance/storage capacity;
- valid demand/policy;
- maximum quantity/value;
- expiry/review horizon.

A merchant cannot issue unlimited purchase contracts because its stock fell below target.

# 15. Delivery, Destination and Handover Obligations

27E specifies **what must arrive and under what economic terms**. Set 30/27H/Set 26 determine physical movement.

Required delivery fields may include:

- origin and destination stable IDs;
- accepted destination alternatives;
- pickup versus delivered term;
- responsible transport party;
- required arrival window;
- handover/custody point;
- condition requirements;
- loss/damage allocation profile;
- loading/unloading responsibility;
- delivery evidence;
- route/realm restrictions;
- delay notification duty.

## 15.1 Delivery Outcome Interface

Transport owner -> 27E returns:

- departed/loaded time;
- current custody;
- arrival time;
- delivered quantity;
- lost/damaged quantity;
- condition change;
- delay cause categories;
- route exception/event IDs;
- handover success/failure;
- carrier fault/external event classification if that system owns it.

27E then applies contract terms; it does not reinterpret movement physics.

# 16. Construction, Repair and Project Contracts

Contracts may commission an existing project system; they do not replace the project.

Typical obligations:

- fund a project stage;
- deliver project materials;
- complete a structure blueprint to a validated state;
- repair damage to a threshold;
- clear/prepare a site;
- commission a machine/ward/utility;
- provide specialist labour;
- achieve functional activation criteria.

## 16.1 Project Truth

Completion evidence comes from Document 19/20/project systems:

- required work packages complete;
- materials consumed authoritatively;
- structure instance exists;
- activation contract passes;
- agreed defects list resolved or explicitly accepted.

A contractor cannot receive final completion merely by reporting 100%.

## 16.2 Change Orders

World conditions can force project change. A change order is a contract amendment containing:

- reason;
- revised scope;
- new materials/labour;
- price/value difference;
- deadline effect;
- approval requirements.

Unapproved scope expansion does not automatically become payable.

# 17. Employment, Retainers and 27D Integration

27D remains authority for wages, employment terms, labour markets and payroll. 27E supplies universal mechanisms where an employment arrangement needs them.

27D -> 27E may supply:

- employment agreement ID;
- compensation schedule;
- probation/term;
- role/site;
- benefits;
- notice/cancellation terms;
- required retainer/security if fiction supports it;
- accrued unpaid wage amount;
- performance evidence reference.

27E can provide:

- agreement versioning/acceptance;
- deposit/retainer handling;
- notice and termination timing;
- evidence/dispute record;
- unpaid compensation claim;
- remedy handoff.

27E does not calculate normal wages or decide worker social willingness.

# 18. Lease, Licence, Concession and Charter Integration

27D defines property/right economics. 27E controls the lifecycle of agreements that grant temporary rights.

Examples:

- market stall lease;
- workshop tenancy;
- mine concession;
- warehouse-space licence;
- farming-use agreement;
- vessel charter;
- cart/wagon lease;
- machinery rental;
- magical infrastructure access contract.

## 18.1 Required Rights Link

The contract identifies the underlying right instance/profile. Activation cannot grant a right the lessor does not possess or have authority to delegate.

## 18.2 Security Deposits

Lease/charter deposits may secure:

- damage;
- missing asset return;
- unpaid service fees;
- cleanup/restoration obligations.

Deposit deductions require evidence tied to defined categories. Ordinary wear must not be silently treated as damage if the contract profile excludes it.

# 19. Agency, Brokerage and Representation Contracts

Agency contracts allow one actor to negotiate, purchase, sell or sign within a bounded scope on behalf of another.

Scope can limit:

- contract families;
- maximum transaction/contract value;
- allowed goods/assets;
- region/market;
- time period;
- permitted counterparties;
- whether sub-agents are allowed;
- whether the agent may alter payment/deposit terms.

Agency creates authority, not ownership. A broker matching buyer and seller does not own their goods or funds unless a separate custody/escrow role exists.

# 20. Standing Orders, Recurring Supply and Framework Agreements

Recurring contracts reduce repetitive player administration while preserving physical economy.

## 20.1 Standing Supply Agreement

Fields include:

- review horizon;
- period/cadence;
- minimum/target/maximum quantity;
- price rule or quote reference method;
- delivery destination;
- funding cap;
- substitution policy;
- suspension conditions;
- renewal/expiry.

A standing contract does not guarantee supply. Each call-off still validates stock, capacity, funds, route and acceptance.

## 20.2 Framework Agreement

A framework establishes pre-approved terms without creating immediate quantity obligation. Future call-offs create specific obligations under the framework.

Useful for:

- settlement suppliers;
- recurring construction materials;
- shipyard component sourcing;
- guard ammunition;
- food provisions;
- repair contractors;
- multiplayer company procurement.

# 21. Specifications, Quality, Condition and Substitution

A contract may specify:

- exact item ID;
- material family/tag;
- minimum quality;
- purity/grade;
- durability/condition floor;
- freshness/spoilage bound;
- enchantment/rune state;
- cultural/origin requirement;
- prohibited variants;
- equivalent substitute tags;
- tolerance bands.

## 21.1 Substitution Hierarchy

1. exact item/variant;
2. explicitly listed equivalent;
3. compatible tag within declared quality/value tolerance;
4. substitute requiring counterparty approval;
5. no substitution.

The contract never silently substitutes a cheaper or strategically different good merely because a recipe tag would accept it.

# 22. Quantity, Lot, Packaging and Measurement Rules

Contracts use canonical units from Set 25/item systems.

Supported quantity models:

- discrete item count;
- stack/lot count;
- fluid volume where the liquid system exposes it;
- weight/mass only if the owning inventory/transport system supports a canonical measure;
- service hours/shifts where 27D/07 exposes them;
- project units/stages;
- capacity-time such as berth-hours/storage-days.

Packaging may matter economically through:

- sealed cargo lot;
- barrel/crate/container;
- reusable packaging deposit;
- hazardous containment;
- tamper evidence;
- manifest identity.

Packaging never changes underlying quantity without an actual conversion/packing transaction.

# 23. Deadlines, Windows, Schedules and Grace Periods

A deadline is evaluated against authoritative world time.

Types:

- exact due time;
- due before/after event;
- delivery window;
- recurring period;
- milestone-relative deadline;
- completion within N days after activation;
- availability window;
- season/event-dependent window.

## 23.1 Grace Periods

Profiles may allow:

- automatic grace period;
- grace only after notice;
- no grace for critical/emergency obligations;
- reduced payment during late-but-curable state;
- extension when qualified external event occurs.

The UI must distinguish `due soon`, `overdue but curable`, and `material breach`.

# 24. Milestones, Partial Performance and Staged Completion

Milestones make large projects readable.

Each milestone can define:

- obligations included;
- dependencies;
- due window;
- evidence requirements;
- acceptance authority;
- payment release;
- retained amount;
- cure window;
- consequence if missed.

## 24.1 Partial Quantity

Divisible obligations can track:

- contracted quantity;
- tendered quantity;
- accepted quantity;
- rejected quantity;
- remaining quantity.

Payment may be proportional to **accepted** quantity rather than delivered quantity.

## 24.2 Indivisible Performance

Examples such as one functioning bridge, one commissioned vessel or one completed ritual may be indivisible for final completion even though they contain staged milestones.

# 25. Reservations, Deposits, Retainers and Performance Security

## 25.1 Reservation Types

- stock reservation;
- funds reservation;
- capacity reservation;
- property/asset reservation;
- time-slot reservation;
- project-material reservation.

Reservations remain owned by the underlying system. 27E stores the purpose and release conditions.

## 25.2 Deposit Profiles

Recommended balance-draft defaults:

| Risk/Contract Type | Suggested Default |
| --- | --- |
| Routine low-value delivery between trusted parties | None or token deposit. |
| Moderate bespoke goods/service | Optional 10-25% value deposit. |
| Custom construction/repair | Deposit plus milestone funding. |
| Rare custom commission/high opportunity cost | 25-50% staged security where appropriate. |
| High-value public/enterprise procurement | Budget reservation or staged escrow rather than arbitrary personal deposit. |
| Lease/charter | Damage/security deposit determined by asset/risk profile. |

These are balancing profiles, not universal law. Culture, trust, scarcity, public policy and difficulty may alter them.

## 25.3 Performance Security Boundary

27E can secure actual funds/goods. A third-party promise to pay if another party defaults is a guarantee/financial-risk instrument and belongs to 27F.

# 26. Escrow, Custody and Conditional Release

Escrow is a neutral or contract-authorised custody arrangement over actual value.

## 26.1 Escrow Invariants

- escrowed value must already exist;
- owner/custodian/beneficiary are explicit;
- escrow cannot be spent by either party outside allowed release/refund paths;
- release conditions are deterministic or reference an authorised acceptance/legal decision;
- partial release is supported by milestones;
- save/load cannot duplicate or strand escrow;
- disputed escrow freezes only the contested portion unless terms require otherwise.

## 26.2 Escrow Release Paths

- milestone accepted -> provider release;
- contract cancelled under refund rule -> payer refund;
- valid deposit forfeiture -> named beneficiary release;
- split settlement -> defined proportions;
- external legal resolution -> release according to governance result;
- migration/recovery -> quarantine until integrity is restored.

# 27. Evidence, Inspection, Certification and Proof of Performance

Evidence prevents arbitrary completion and arbitrary rejection.

Evidence classes include:

- transaction record;
- item lot/handover record;
- storage receipt;
- project completion event;
- structure-state snapshot/hash;
- route arrival record;
- service contribution record;
- signed manifest;
- authorised inspection record;
- combat/escort outcome record;
- world-event record;
- witness/social evidence only when supplied by the appropriate external system;
- law/governance evidence record.

## 27.1 Evidence Confidence

Economic auto-resolution should prefer objective authoritative evidence. Subjective testimony belongs to social/legal systems. 27E can store confidence/source metadata but does not become a courtroom evidence engine.

## 27.2 Inspector Authority

An inspector may be:

- buyer/client for simple goods;
- qualified NPC role;
- settlement office;
- guild/faction certifier;
- project/building validation service;
- maritime port/shipyard authority;
- automated validator where criteria are objective.

Inspector identity, scope and conflicts are recorded.

# 28. Acceptance, Rejection and Cure

## 28.1 Acceptance Modes

- automatic objective acceptance;
- explicit client acceptance;
- authorised third-party certification;
- acceptance after inspection window expires with no valid rejection, if profile allows;
- staged acceptance;
- provisional acceptance with retained payment.

## 28.2 Rejection Requirements

A rejection must reference:

- obligation/deliverable;
- failed criterion;
- evidence;
- rejected quantity/scope;
- cure allowed/not allowed;
- deadline for cure;
- payment/security effect.

A party cannot reject a compliant delivery merely because market prices changed after agreement unless the contract contains a price/review clause.

## 28.3 Cure Options

- replace defective goods;
- repair damaged work;
- deliver missing quantity;
- reperform service;
- pay late balance;
- provide missing evidence;
- agree a price reduction;
- mutually amend scope.

# 29. Amendment, Variation, Extension and Renegotiation

Accepted terms cannot be silently edited.

Any amendment produces:

- amendment ID/version;
- initiating party;
- changed fields/obligations;
- economic impact;
- deadline/security impact;
- acceptance requirements;
- effective time;
- preserved prior version.

Mutual amendment is the normal path. Some profiles permit unilateral options already agreed in the original terms, such as exercising a renewal option within bounds.

# 30. Assignment, Delegation, Novation and Transfer

## 30.1 Assignment

Rights to receive payment/goods may be assignable if the contract permits and 27F/legal systems allow. Assignment does not automatically transfer the duty to perform.

## 30.2 Delegation

A contractor may delegate work where permitted. The original obligated party remains responsible unless a novation replaces them.

Set 28/07 controls companion/NPC willingness; Set 30 controls physical travel; 27E only records responsibility and accepted delegated performer.

## 30.3 Novation

Novation requires affected party approval and creates a new party configuration while preserving history. Useful when:

- business ownership changes;
- contractor dies/leaves;
- enterprise restructures;
- public office changes;
- voyage/transport responsibility transfers.

# 31. Cancellation, Withdrawal, Termination and Expiry

These states are distinct.

| Outcome | Meaning |
| --- | --- |
| Offer withdrawal | Issuer removes unaccepted offer if allowed. |
| Expiry | Offer/option/agreement ends by time rule. |
| Cancellation | Parties end agreement under cancellation terms, often before material breach. |
| Termination for cause | Agreement ends because a qualifying breach/event permits it. |
| Termination for convenience | Contract profile allows early termination with declared notice/compensation. |
| Completion | All required obligations satisfied/waived and final settlement done. |

Cancellation must settle:

- completed accepted work;
- reserved stock/funds;
- escrow/deposit;
- non-refundable costs if contract permits;
- return of custody assets;
- outstanding claims.

# 32. Force Majeure, Impossibility and External Events

External events can include, where the relevant systems confirm them:

- severe weather/disaster;
- route closure;
- siege/raid/blockade;
- portal/dimension failure;
- settlement evacuation;
- asset destruction;
- death/incapacity of uniquely required actor;
- lawful embargo/prohibition;
- world event that makes performance objectively impossible.

## 32.1 Contract Response Profiles

A qualifying event can trigger:

- temporary suspension;
- automatic deadline extension capped by profile;
- substitute route/good/service permission;
- required renegotiation;
- partial cancellation;
- termination without ordinary breach;
- insurance/claim opportunity through 27F;
- no exception, where the party explicitly accepted the risk.

The event owner supplies facts. 27E applies the previously agreed rule.

# 33. Breach Classification and Materiality

A breach belongs to a specific obligation first.

Common breach categories:

- non-delivery;
- short delivery;
- late delivery;
- non-payment;
- late payment;
- defective quality;
- damaged condition;
- unauthorised substitution;
- failure to provide service;
- inadequate service/result;
- failure to maintain availability;
- unauthorised asset use;
- failure to return asset;
- prohibited transfer/assignment;
- confidentiality/information-type breach only if such gameplay content is later explicitly implemented;
- cancellation without allowed right;
- failure to fund required security;
- refusal to accept compliant performance;
- failure to provide required handover/evidence.

## 33.1 Materiality

Materiality can depend on:

- percentage/critical quantity missing;
- essential milestone missed;
- risk/safety consequence;
- repeated uncured minor failures;
- strategic uniqueness of deliverable;
- declared `material_if_breached` flag;
- whether failure defeats the purpose of the agreement.

Minor breach should not automatically destroy a large contract when cure/price adjustment is reasonable.

# 34. Economic Remedies and Remedy Ordering

27E favours a predictable remedy ladder.

Recommended order where compatible:

1. **Cure / replacement / re-performance**;
2. **withhold affected payment**;
3. **partial acceptance and price adjustment**;
4. **refund/restitution of unearned consideration**;
5. **release or forfeit declared deposit/security**;
6. **compensation claim for defined direct loss**;
7. **terminate affected future obligations**;
8. **terminate whole contract for material breach**;
9. **create external dispute/legal/finance handoff** where unresolved.

Profiles may change the ordering, but players should usually receive a readable chance to cure ordinary mistakes before catastrophic escalation.

# 35. Compensation, Restitution, Forfeiture and Liquidated Amounts

## 35.1 Compensation

Compensation should be tied to contract facts such as:

- undelivered paid value;
- reasonable replacement-cost difference under declared policy;
- repair/rework cost;
- direct lost/damaged entrusted goods;
- agreed late-performance amount;
- unrecovered approved mobilisation/material cost;
- retained deposit/security.

27B provides value conversion. 27E records the claim.

## 35.2 Restitution

Restitution returns value that one party should no longer retain because the underlying obligation failed/cancelled.

Examples:

- refund advance for undelivered goods;
- return unused retainer;
- return leased asset/security after valid completion;
- return duplicate/erroneous transfer detected by audit.

## 35.3 Liquidated Amounts and Caps

Contracts may declare a predictable breach amount such as a late fee or forfeiture. To preserve game feel:

- it must be visible before acceptance;
- it must be bounded;
- it cannot compound endlessly under 27E;
- it cannot exceed configured maximum multiples of the affected obligation without explicit advanced-policy approval;
- it becomes a claim/transfer, not newly minted money.

Formal interest on overdue debt belongs to 27F.

# 36. Claims, Receivables and 27F Debt Boundary

27E may create:

- recognised unpaid balance;
- compensation claim;
- refund due;
- retained security claim;
- disputed claim;
- receivable/payable posting to a 27D operating account.

27E does **not** define:

- interest accrual;
- loan conversion;
- secured lending;
- collateral priority;
- collections finance;
- debt trading;
- bankruptcy ranking;
- insurance coverage.

Those move to 27F.

A simple unpaid claim can remain non-interest-bearing until paid, waived, legally resolved or converted by 27F policy.

# 37. Disputes, Contested Evidence and Resolution Paths

A dispute can concern:

- whether performance occurred;
- quantity/quality;
- cause of delay;
- validity of rejection;
- escrow release;
- deposit deduction;
- interpretation of substitution;
- whether force majeure applies;
- whether signer had authority;
- amount of compensation;
- whether a breach was material.

## 37.1 Dispute State

When disputed:

- disputed automatic remedies pause where necessary;
- undisputed obligations can continue;
- relevant funds may remain escrowed;
- parties can negotiate settlement through Set 28/27E term interface;
- authorised arbitration/justice services may receive the case;
- evidence remains append-only;
- multiplayer admins can inspect but should not silently rewrite history outside defined admin/recovery tools.

## 37.2 Informal Settlement

Parties may agree to:

- revised amount;
- replacement delivery;
- extension;
- partial refund;
- mutual cancellation;
- waiver of a remedy;
- new contract.

This creates an auditable amendment/settlement record.

# 38. Legal Enforcement and Governance Boundary

Document 20C already supports justice facilities, cases, evidence, hearings, judgments, fines/restitution and lawful escalation. 27E uses that capability without becoming the law system.

27E -> governance/law may provide:

- contract snapshot;
- parties and authority;
- obligation history;
- payment/escrow records;
- evidence/inspection records;
- breach assessment;
- claimed remedy/amount;
- dispute statements;
- relevant law/culture contract tags.

Governance/law -> 27E may return:

- contract upheld/void/modified result;
- restitution/compensation judgment;
- authorised release of disputed escrow;
- lawful fine/penalty destination;
- authorised seizure/termination/right change;
- appeal/pending state.

27E never executes guard arrest, imprisonment or forcible seizure by itself.

# 39. Social Reputation, Trust and Set 28 Boundary

Contract performance is socially meaningful, but social values remain Set 28.

27E emits facts such as:

- contract accepted;
- fulfilled early/on-time/late;
- quality exceeded/met/failed;
- repeated reliability;
- cancellation;
- unpaid balance;
- breach cured;
- breach uncured;
- dispute resolved;
- settlement honoured/violated.

Set 28 decides:

- trust change;
- loyalty/affection/fear effect;
- dialogue reaction;
- willingness to contract again;
- social forgiveness;
- personal resentment;
- rumours/social spread.

27E may consume the resulting `contract_social_trust_modifier` only as an input to deposit/concession/risk policy if that interface is approved.

# 40. Crime, Coercion, Seizure and Combat Boundary

A contract cannot make an otherwise prohibited violent or criminal action automatically legitimate.

Examples:

- `If unpaid, I may take any item from your house` is not self-executing unless law/property systems explicitly validate that remedy.
- A player cannot use a contract UI to bypass PvP/theft permissions.
- A forced agreement created by intimidation may have social/legal consequences; 27E stores the accepted contract only after the appropriate ownership/consent policy permits it.
- Mercenary/guard contracts may pay for combat services, but combat targeting and legality remain external.
- Bounty/collection work can be expressed economically, while arrest/capture authority must come from quest/law/combat systems.

# 41. Quest, Event and Narrative Integration

Contracts can be discovered through:

- NPC conversation;
- request boards;
- market/procurement boards;
- guild/faction halls;
- settlement offices;
- ports/shipyards;
- letters/messengers;
- quest/event chains;
- world-state shortage/crisis generation.

## 41.1 Contract vs Quest State

A quest may track `deliver 100 iron under contract X`, but:

- quest acceptance does not necessarily accept the contract;
- quest completion cannot mark contract quantity delivered;
- contract cancellation may cause quest branch/failure, not silent deletion;
- contract completion can trigger quest objective completion only through a validated event;
- contracts may exist with no quest at all.

## 41.2 Event Consequences

Events can:

- pause routes;
- create emergency procurement;
- trigger force-majeure checks;
- destroy entrusted goods;
- close sites;
- create renegotiation opportunities;
- generate follow-up claims/disputes.

The event system owns event truth. 27E owns the contractual interpretation.

# 42. Settlement and Public Procurement Integration

Settlements can use contracts for:

- staple supply;
- emergency food/medicine;
- construction materials;
- road/bridge work;
- guard equipment;
- specialist services;
- repair/cleanup;
- festival goods;
- transport;
- public works;
- maritime services.

## 42.1 Public Buyer Authority

A public contract requires:

- recognised public buyer/office;
- valid procurement policy;
- 27G budget/treasury authority where required;
- storage/project/service capacity;
- conflict/approval rules if the settlement uses them.

27E does not allow a clerk NPC to spend an unlimited settlement treasury merely because the contract template exists.

# 43. Market and Merchant Integration With 27B-27C

27B and 27C remain authoritative for value and market state.

27E consumes:

- reference/fair value;
- current quote where used;
- currency acceptance;
- barter valuation;
- market pressure;
- merchant procurement policy;
- available stock/funds;
- observed price information.

27E supplies back:

- committed future supply;
- reserved stock/funds;
- expected contractual arrivals;
- procurement obligations;
- completed contractual trade;
- cancelled/lost expected supply;
- contract price observations;
- root requirement IDs.

Expected contractual supply may affect 27C confidence but cannot become sellable stock before physical arrival/acceptance.

# 44. Enterprise, Property and Labour Integration With 27D

27D supplies:

- enterprise identity;
- accounts/funds;
- signatory roles;
- ownership/custody/right instances;
- employment agreement data;
- payroll obligations;
- lease/rent economics;
- operating state.

27E supplies:

- external supplier/customer contracts;
- persistent procurement;
- service obligations;
- deposit/escrow;
- contract receivables/payables;
- breach/claim status;
- lease/charter lifecycle events;
- contract commitments used in enterprise cashflow forecasting.

Business accounting should distinguish:

- signed commitment;
- reserved funds;
- accrued payable;
- paid expense;
- disputed claim.

# 45. Credit, Banking, Insurance and 27F Handoff

27E creates the events 27F needs.

27E -> 27F:

- unpaid receivable/payable;
- contract value;
- payment schedule;
- escrow/security;
- counterparty identity;
- breach/cure history;
- delivery/service risk tags;
- insured-contract reference;
- claim event/evidence.

27F -> 27E:

- approved financing/payment instrument;
- guarantee status;
- insurance coverage/claim decision;
- financed escrow funding;
- debt-conversion result;
- insolvency stay/creditor restriction where applicable.

27E does not pre-empt these rules.

# 46. Tax, Treasury and 27G Handoff

27G owns:

- taxes/tariffs/tolls;
- public fees;
- treasury accounts;
- appropriations/budgets;
- public procurement funding rules;
- subsidies/relief;
- tribute.

27E supplies:

- taxable/chargeable contract events;
- contract value/payment basis;
- public procurement obligation;
- supplier milestone/payment evidence;
- contract cancellation/refund state;
- authorised treasury payment request.

Tax/fee amounts are external obligations injected into the transaction/contract where policy requires; 27E does not invent rates.

# 47. Trade Routes, Caravans and 27H Handoff

27H owns route economics and caravan missions; Set 30 owns physical terrestrial movement.

27E supplies:

- cargo obligation;
- origin/destination;
- quantity/condition;
- deadline/window;
- declared carrier responsibility;
- freight/service consideration;
- loss/delay remedy profile;
- required insurance reference if any;
- handover criteria.

27H/Set 30 return:

- route plan/availability;
- estimated/actual travel time;
- transport cost/risk;
- arrival/delay/loss evidence;
- cargo capacity usage;
- carrier execution status.

# 48. Restricted/Illicit Contracts and 27I Handoff

27E can represent agreements involving restricted or illicit goods only if world settings/content permit them, but it does not define black-market discovery, smuggling networks or embargo economics.

27I owns:

- illicit market access;
- smuggling premiums;
- restricted-good network economics;
- embargo/sanction effects;
- monopoly coercion/economic conflict.

27E contributes:

- obligation terms;
- clandestine counterparty identifiers where knowledge rules allow;
- payment/escrow;
- delivery/service evidence;
- breach/remedy facts.

Legal enforceability may be absent or faction-specific; that is a law/governance outcome, not an assumption by 27E.

# 49. Maritime Contracts and Set 26 Integration

Set 26 maritime systems may use 27E for:

- cargo carriage contracts;
- voyage charters;
- vessel lease/charter adapters;
- shipbuilding commissions;
- ship repair/refit work orders;
- port service reservations;
- crew retainer/employment adapters;
- convoy escort agreements;
- salvage/service agreements;
- fishing/merchant supply contracts;
- naval/privateering economic agreements where law/faction systems authorise them.

Set 26 owns:

- berth allocation;
- loading/unloading execution;
- vessel readiness;
- voyage timing;
- crew execution;
- weather/navigation;
- damage/loss;
- capture/sinking;
- port incidents.

27E applies the agreed economic terms to those outcomes.

# 50. Automation and Machine-Assisted Fulfilment

Automation can satisfy recurring contractual obligations when:

- the contract permits automated source/fulfilment;
- required stock/capacity is authorised;
- machine/network access is valid;
- contract reservation/destination links are configured;
- physical outputs exist;
- destination accepts the goods/service;
- evidence is recorded.

## 50.1 Contract-Aware Logistics

Useful capabilities:

- route output to `contract:<id>` reservation;
- stop at contract quantity;
- separate accepted/rejected goods;
- prioritise urgent contract stock without stealing protected reserves;
- notify when input shortage threatens deadline;
- auto-create delivery-ready lot/manifest;
- suspend when contract is cancelled/disputed.

Automation must never continue consuming resources for a closed contract without an explicit fallback policy.

# 51. Simulation LOD and Distant Contract Execution

Contracts must survive large worlds without ticking every obligation every frame.

| LOD Tier | Contract Processing |
| --- | --- |
| Immediate Local | Physical handovers, visible workers, inspections, conversations, loading and service execution. |
| Local Summary | Batched work/production/delivery checkpoints with exact inventories/accounts. |
| Settlement Summary | Periodic obligation progress from authoritative project/market/business summaries. |
| Regional/Distant | Bounded next-decision-point advancement using route, production, stock, capacity and event summaries. |
| Dormant | Preserve identity, obligations, next evaluation time and unresolved claims without active processing. |

## 51.1 Distant Advancement Rules

A distant contract step may advance only when:

- required prerequisite state is authoritative;
- reserved/input resources exist;
- service/transport capacity exists;
- required time has elapsed in world simulation;
- no exception/dispute blocks the action;
- result can be reconciled to physical state later.

A year of absence does not process every hour. The simulation advances milestone/period batches within budgets and records aggregate evidence.

## 51.2 Promotion/Reconciliation

On promotion to local detail:

- current contract/obligation states remain unchanged;
- physical reserved lots/accounts match summary records;
- entrusted cargo/assets reconstruct from authoritative locations;
- pending inspections become visible tasks if required;
- discrepancies quarantine affected obligations rather than duplicating value.

# 52. Persistence, History, Evidence and Audit Trails

Persist at minimum:

- contract definition/version;
- parties/roles/signatories;
- accepted term snapshot;
- obligation/milestone state;
- reservations/security links;
- escrow record;
- evidence/inspection links;
- amendments;
- notices;
- breach/cure/remedy records;
- dispute state;
- receivable/payable references;
- major history events;
- next evaluation time;
- relevant root requirement/quest/project links.

## 52.1 History Policy

Important contract mutations are append-only events. Current state may be materialised for performance, but recovery/audit can reconstruct or verify it.

Examples:

- offer issued;
- counteroffer issued;
- accepted;
- security funded;
- obligation ready;
- lot reserved;
- delivery tendered;
- accepted/rejected;
- payment released;
- deadline extended;
- force majeure activated;
- breach recorded/cured;
- contract terminated/completed;
- dispute opened/resolved.

# 53. Multiplayer Authority, Shared Organisations and Signatures

## 53.1 Server/Host Authority

Authority owns:

- offer creation where it creates executable state;
- acceptance;
- organisation signatory checks;
- reservations;
- escrow transfers;
- obligation progress commits;
- acceptance/rejection;
- amendments;
- remedy execution;
- dispute state;
- contract history.

Clients can preview, negotiate through allowed commands and request actions but cannot directly mutate contract records.

## 53.2 Shared Organisation Roles

Example capabilities:

- `contract.view`;
- `contract.propose`;
- `contract.sign.low_value`;
- `contract.sign.high_value`;
- `contract.amend`;
- `contract.cancel`;
- `contract.accept_delivery`;
- `contract.release_escrow`;
- `contract.open_dispute`;
- `contract.assign_agent`;
- `contract.audit`.

High-value or irreversible contracts may require two-role approval if the organisation policy chooses it.

## 53.3 Concurrent Acceptance

If two suppliers try to accept the last exclusive procurement slot, optimistic version/lock validation ensures only one succeeds. The loser receives a reason without losing funds/security.

# 54. UI/UX, Explainability and Accessibility

The contract UI should feel like a readable promise tracker, not a legal document simulator.

## 54.1 Core Contract Card

Show:

- title/purpose;
- parties;
- status;
- what you owe;
- what you receive;
- next due obligation;
- time remaining;
- progress;
- reserved/deposited value;
- major risk/consequence;
- current blocker;
- actions: fulfil, deliver, inspect, request extension, renegotiate, cancel, dispute where allowed.

## 54.2 Expanded Detail

Optional tabs:

- obligations;
- milestones;
- payment/escrow;
- deliveries;
- evidence/inspection;
- amendments;
- history;
- dispute/remedies;
- linked quest/project/route.

## 54.3 Reason-First Messages

Examples:

- `Cannot accept: your company role cannot sign contracts above 2,000 RVU.`
- `Contract pending: 25% deposit has not been funded.`
- `Delivery rejected: 18 of 40 ingots are below the agreed Standard quality.`
- `Payment withheld: milestone 2 is awaiting inspection.`
- `Late but curable: deliver the remaining 30 grain within 2 days.`
- `Escrow frozen: acceptance is disputed.`
- `Cannot cancel without cost: custom materials have already been consumed.`
- `Contract suspended: the only valid route is closed by a world event.`

## 54.4 Accessibility

- deadlines never depend on colour alone;
- accepted versus required quantities use text and icons;
- screen-reader labels expose party/role/state/value;
- optional simplified contract summary hides legal/economic jargon;
- warnings can be pinned and replayed;
- timers can display exact world time plus relative duration;
- confirmation is required for high-impact forfeiture/cancellation where player-controlled;
- split-screen uses compact independent views.

# 55. Set 25 Registry, Schema and Relationship Contracts

## 55.1 Recommended Definition Families

- `economy.contract.definition.*`
- `economy.contract.family.*`
- `economy.contract.obligation_profile.*`
- `economy.contract.milestone_profile.*`
- `economy.contract.acceptance_profile.*`
- `economy.contract.deposit_profile.*`
- `economy.contract.escrow_profile.*`
- `economy.contract.breach_profile.*`
- `economy.contract.remedy_profile.*`
- `economy.contract.force_majeure_profile.*`
- `economy.contract.inspection_profile.*`
- `economy.contract.assignment_profile.*`
- `economy.contract.notice_profile.*`

## 55.2 Runtime Record Families

- ContractOfferRecord
- ContractInstanceRecord
- ContractPartyRecord
- ObligationInstanceRecord
- MilestoneInstanceRecord
- ContractReservationLink
- EscrowRecord
- DepositRecord
- ContractEvidenceRecord
- InspectionRecord
- ContractNoticeRecord
- ContractAmendmentRecord
- BreachRecord
- CureRecord
- RemedyRecord
- ContractClaimRecord
- DisputeRecord
- ContractHistoryEvent

## 55.3 Relationship Types

Suggested typed relationships:

- `contract_has_party`;
- `contract_has_obligation`;
- `contract_has_milestone`;
- `contract_references_quote`;
- `contract_references_market`;
- `contract_references_enterprise`;
- `contract_references_property_right`;
- `contract_references_project`;
- `contract_references_quest`;
- `contract_references_route`;
- `contract_references_vessel`;
- `contract_secured_by_escrow`;
- `contract_reserves_stock`;
- `contract_reserves_funds`;
- `obligation_satisfied_by_evidence`;
- `breach_affects_obligation`;
- `remedy_resolves_claim`;
- `contract_promoted_from_procurement_intent`;
- `contract_child_of_framework`;
- `contract_replaces_contract`.

Set 25 owns qualification, schema extension, aliases, package dependencies, migrations and completeness validation.

# 56. Godot/Summer Engine Technical Architecture

Recommended runtime services:

- `ContractService` - lifecycle and authoritative mutation;
- `ContractOfferService` - offers/versioning/acceptance;
- `ObligationService` - readiness/progress/state;
- `ContractReservationService` - links to stock/funds/capacity reservations;
- `EscrowService` - conditional custody/release;
- `ContractEvidenceService` - evidence registration/validation;
- `InspectionAcceptanceService` - objective/authorised acceptance;
- `BreachRemedyService` - breach/cure/remedy state;
- `ContractDisputeService` - contested state and handoffs;
- `ContractNoticeService` - deadline/cancellation/exception notices;
- `ContractLODService` - bounded scheduled advancement;
- `ContractAuditService` - history, diagnostics and recovery.

## 56.1 Event-Driven Inputs

Subscribe to authoritative events such as:

- `TransactionCommitted`;
- `StockReservationChanged`;
- `CurrencyTransferred`;
- `ProjectStageCompleted`;
- `StructureStateChanged`;
- `ServiceContributionCompleted`;
- `RouteStateChanged`;
- `CargoArrived`;
- `CargoDamagedOrLost`;
- `WorkerAvailabilityChanged`;
- `EnterpriseStateChanged`;
- `WorldEventStarted/Ended`;
- `LegalDecisionIssued`;
- `SocialNegotiationResolved`;
- `QuestStateChanged` only for linked presentation/conditions, never as sole proof of economic fulfilment.

## 56.2 Commands

Suggested commands:

- `CreateContractInvitation`;
- `CreateContractOffer`;
- `CounterContractOffer`;
- `WithdrawContractOffer`;
- `AcceptContractOffer`;
- `FundContractDeposit`;
- `ReserveContractStock`;
- `TenderContractDelivery`;
- `SubmitServiceEvidence`;
- `InspectContractDeliverable`;
- `AcceptContractMilestone`;
- `RejectContractMilestone`;
- `RequestContractExtension`;
- `ProposeContractAmendment`;
- `AcceptContractAmendment`;
- `CancelContract`;
- `TerminateContract`;
- `OpenContractDispute`;
- `ResolveContractDisputeFromExternalDecision`;
- `ExecuteContractRemedy`.

Every command returns structured success/failure reasons.

## 56.3 Determinism

- authoritative timestamps use world/server time;
- obligation iteration order uses stable IDs;
- financial rounding delegates to 27B profiles;
- simultaneous claims/reservations use deterministic locks/versioning;
- random contract generation, where any procedural template chooses values, derives from stable seeds plus context and never wall-clock randomness;
- catch-up processing is bounded by scheduled decision points.

## 56.4 Summer Engine Boundary

Summer Engine may:

- generate draft contract definitions;
- propose validators;
- produce test fixtures;
- inspect schema completeness;
- detect contradictory terms;
- create migration scripts under review;
- generate documentation/UI previews.

It must not:

- invent runtime contractual obligations without game-authorised systems;
- waive player/NPC obligations invisibly;
- alter escrow/funds outside authoritative commands;
- resolve ambiguous social/legal disputes autonomously in shipping gameplay unless a separately approved system explicitly owns that behaviour.

# 57. Validation Invariants and Reason Codes

## 57.1 Hard Invariants

1. A binding contract has at least two valid party-role endpoints unless a specialised unilateral profile is explicitly approved.
2. Every binding party was accepted by a valid signatory/authority at the accepted version.
3. Every obligation has an owner, beneficiary/recipient where required, evaluable condition and state.
4. No escrow/deposit/security value exists without an authoritative source transfer/reservation.
5. Escrow owner/custodian/beneficiary totals reconcile exactly.
6. Goods completion cannot exceed actual accepted transferred quantity.
7. Service completion requires owning-system evidence.
8. The same physical lot cannot satisfy two exclusive obligations unless quantity is explicitly split.
9. Contract/root-demand fulfilment cannot double-count the same requirement.
10. Expired or withdrawn offers cannot be accepted.
11. A stale offer version cannot bind new terms.
12. Contract amendment preserves prior accepted versions/history.
13. No penalty/remedy mints currency or goods.
14. Contract termination does not erase already-earned payment or existing claims unless an explicit settlement transfers/waives them.
15. Legal/physical enforcement actions require external authority; 27E cannot fake them.
16. Distant simulation cannot complete obligations beyond real stock, capacity or time.
17. Multiplayer clients cannot mutate authoritative contract state directly.
18. Save/load/migration cannot duplicate escrow, deposits, contract-reserved goods or payments.
19. Contract acceptance cannot grant property/use rights the grantor does not validly control.
20. Disputed value remains traceable and cannot disappear through state transition.

## 57.2 Initial Reason Codes

| Code | Meaning |
| --- | --- |
| ECON_CONTRACT_OFFER_EXPIRED | Offer expired before acceptance. |
| ECON_CONTRACT_OFFER_WITHDRAWN | Offer is no longer available. |
| ECON_CONTRACT_VERSION_STALE | Offer/contract version changed. |
| ECON_CONTRACT_SIGNER_UNAUTHORISED | Actor lacks authority to bind party. |
| ECON_CONTRACT_PARTY_INVALID | Referenced party no longer valid. |
| ECON_CONTRACT_PARTY_CAPACITY_INVALID | External system reports insufficient capacity/eligibility. |
| ECON_CONTRACT_TERMS_INCOMPLETE | Required binding terms are missing. |
| ECON_CONTRACT_SECURITY_UNFUNDED | Required deposit/escrow/security not funded. |
| ECON_CONTRACT_FUNDS_INSUFFICIENT | Payer lacks authorised funds. |
| ECON_CONTRACT_STOCK_INSUFFICIENT | Required reserved stock does not exist. |
| ECON_CONTRACT_STOCK_CONFLICT | Stock is already reserved/owned incompatibly. |
| ECON_CONTRACT_RIGHT_NOT_HELD | Grantor lacks required ownership/use right. |
| ECON_CONTRACT_OBLIGATION_NOT_READY | Prerequisite is incomplete. |
| ECON_CONTRACT_OBLIGATION_OVERDUE | Due time passed without accepted performance. |
| ECON_CONTRACT_DELIVERY_SHORT | Quantity below obligation. |
| ECON_CONTRACT_DELIVERY_QUALITY_FAIL | Goods fail accepted quality criteria. |
| ECON_CONTRACT_SUBSTITUTION_NOT_ALLOWED | Offered substitute is outside terms. |
| ECON_CONTRACT_SERVICE_EVIDENCE_MISSING | Service lacks valid proof. |
| ECON_CONTRACT_INSPECTION_REQUIRED | Deliverable awaits required inspection. |
| ECON_CONTRACT_REJECTED_WITH_CURE | Deliverable deficient but cure is open. |
| ECON_CONTRACT_CURE_EXPIRED | Cure window ended. |
| ECON_CONTRACT_FORCE_MAJEURE_REVIEW | External event may alter obligation. |
| ECON_CONTRACT_CANCEL_COST_APPLIES | Cancellation has declared settlement cost. |
| ECON_CONTRACT_ESCROW_FROZEN | Dispute/condition blocks release. |
| ECON_CONTRACT_ESCROW_RELEASE_INVALID | Release conditions are not met. |
| ECON_CONTRACT_REMEDY_NOT_AUTHORISED | Remedy is outside contract/external authority. |
| ECON_CONTRACT_EXTERNAL_ENFORCEMENT_REQUIRED | Legal/social/physical system must resolve next step. |
| ECON_CONTRACT_DISPUTE_ACTIVE | Automatic finalisation blocked by dispute. |
| ECON_CONTRACT_DUPLICATE_FULFILMENT | Evidence/lot already consumed by another obligation. |
| ECON_CONTRACT_ROOT_REQUIREMENT_DUPLICATE | Demand/fulfilment would double-count same root requirement. |
| ECON_CONTRACT_LOD_RECONCILIATION_REQUIRED | Distant/local contract state mismatch. |
| ECON_CONTRACT_MULTIPLAYER_CONFLICT | Concurrent authoritative mutation conflict. |

# 58. Representative Acceptance Scenarios

## Scenario A - Village Grain Procurement

1. Settlement has a real food-reserve shortfall from 07/20.
2. 27C creates one procurement intent with `root_requirement_id`.
3. Village issues a 27E offer for 200 grain, delivery within five days.
4. Player accepts; buyer funds are reserved.
5. Player delivers 120 acceptable grain.
6. Contract records 120 accepted, 80 remaining; market demand decreases only by 120.
7. Final 80 arrive on day four.
8. Payment releases for accepted total and contract completes.
9. No duplicate quest/market fulfilment occurs.

**Acceptance:** stock, funds, demand and contract progress reconcile exactly.

## Scenario B - Bespoke Sword Commission With Deposit

1. Player commissions masterwork sword from smith enterprise.
2. Contract requires 20% deposit, remaining 80% on accepted completion.
3. Deposit is actually transferred to escrow/contract custody.
4. Smith consumes real materials and labour through recipe systems.
5. Sword completes below Masterwork quality.
6. Client rejects under declared quality criterion; cure allows rework.
7. Smith reworks successfully; client accepts.
8. Final payment releases and deposit counts toward total consideration.

**Acceptance:** no double payment; no completion based on timer; rejected first sword remains a real item/state.

## Scenario C - Late Delivery With Cure

1. Merchant contract requires 50 iron by day 10.
2. Supplier arrives day 11 with all 50.
3. Profile gives two-day grace with 5% bounded late adjustment.
4. Delivery is accepted in cure window.
5. Payment releases minus declared adjustment.
6. Contract completes as `late_cured`, not material breach.

**Acceptance:** late fee transfers/offsets value; it does not mint value.

## Scenario D - Force-Majeure Route Closure

1. Caravan supply contract is active.
2. World event closes the only valid mountain pass.
3. Set 30/27H reports route inaccessible; event ID qualifies under contract profile.
4. 27E suspends delivery deadline for capped period and notifies parties.
5. Route reopens; deadline shifts accordingly.
6. Supplier completes without ordinary breach.

**Acceptance:** 27E does not simulate the landslide itself and does not erase obligations.

## Scenario E - Contract Dispute Over Quality

1. Supplier tenders 100 timber beams.
2. Buyer rejects 40 as below agreed condition.
3. Supplier disputes the inspection.
4. 40-beam payment remains escrowed; accepted 60 can settle if profile allows.
5. Authorised guild inspector evaluates evidence.
6. External inspection result finds 25 valid, 15 defective.
7. Contract updates accepted/rejected quantities and cure/compensation accordingly.

**Acceptance:** disputed portion freezes without locking unrelated accepted value.

## Scenario F - Multiplayer Company Signatory Limit

1. Player with `contract.sign.low_value` attempts to sign 10,000 RVU supply contract.
2. Authority checks organisation role/value cap.
3. Acceptance fails with `ECON_CONTRACT_SIGNER_UNAUTHORISED`.
4. No deposit/funds move.
5. Finance manager/co-owner can sign or co-approve according to policy.

**Acceptance:** client UI cannot bypass organisation authority.

## Scenario G - Construction Change Order

1. Enterprise is contracted to build a bridge from validated blueprint.
2. Terrain survey discovers protected ruin requiring longer span.
3. Project system reports scope conflict.
4. Contractor proposes change order with extra material/time/value.
5. Client approves amendment.
6. Original contract history remains; milestone requirements update prospectively.
7. Construction completes and activation validates.

**Acceptance:** extra work does not auto-charge without approved amendment.

## Scenario H - Lease Security Deposit

1. Player leases workshop and pays defined damage deposit.
2. Deposit enters escrow.
3. Player returns site with ordinary wear only.
4. Lessor attempts full deduction.
5. Contract inspection profile finds no qualifying damage.
6. Deposit returns to player.

**Acceptance:** lessor cannot unilaterally seize escrow outside agreed conditions.

## Scenario I - Maritime Cargo Loss

1. Merchant contracts carriage of 300 cloth to distant port.
2. Cargo loaded under Set 26 manifest and custody transfers to carrier.
3. Storm damages vessel; 80 cloth lost.
4. Set 26 supplies loss event/cause and delivered quantity.
5. 27E applies carriage terms and creates compensation claim if carrier bears declared risk.
6. 27F later determines insurance coverage where applicable.

**Acceptance:** 27E does not recreate lost cargo; claim remains economic only.

## Scenario J - Automated Standing Supply

1. Settlement signs recurring contract for 100 stone bricks every seven days.
2. Player factory is linked to contract reservation/output.
3. Each cycle validates stock, production, funds and storage.
4. First two cycles succeed automatically.
5. Third cycle lacks fuel; machine produces only 70.
6. Contract records 70 tendered, 30 shortage and warning/cure state.
7. No invisible stock is spawned to meet the standing order.

**Acceptance:** automation convenience preserves physical production.

## Scenario K - Public Procurement Without Budget

1. Town office tries to issue major wall-repair contract.
2. 27G reports no authorised procurement budget/reserve.
3. 27E refuses activation/funding.
4. Quest/event may create emergency funding objective.

**Acceptance:** public buyer cannot create unlimited purchasing power.

## Scenario L - Contract and Quest Divergence

1. Quest asks player to fulfil contract X.
2. Player abandons quest UI but keeps contract active.
3. Player later performs valid delivery.
4. 27E completes contract.
5. Quest system receives completion event and resolves according to its own branch.

**Acceptance:** deleting/untracking quest does not delete economic obligation.

# 59. Balance, Difficulty and Anti-Micromanagement

## 59.1 Balance Principles

- Contracts should create useful structure, not paperwork.
- Most ordinary local trade remains immediate 27C commerce.
- Use persistent contracts when future time, distance, custom work, risk or repeated supply makes them valuable.
- Deposits should reduce exploit risk without making every transaction expensive.
- Cure periods should prevent one small mistake destroying a long project.
- Penalties should be predictable and capped.
- Players should be able to automate recurring fulfilment once infrastructure is mature.
- NPC/public actors should use the same underlying conservation rules as players.
- Contract rewards should not outperform equivalent market/value paths without corresponding risk, service or strategic reason.
- Failure should create new decisions, claims or stories rather than always forcing reload.

## 59.2 Difficulty/World Settings

| Setting | Relaxed | Standard | Harsh/Advanced |
| --- | --- | --- | --- |
| Contract deadline leniency | Wider windows/grace | Profile standard | Tighter where content supports it |
| Deposit defaults | Lower/less frequent | Standard | Risk-sensitive/higher |
| Penalty severity | Reduced/capped lower | Standard caps | Full declared caps |
| Auto-renegotiation assistance | Strong | Suggested | Manual/limited |
| Information clarity | Full reasons and reminders | Contextual | Still truthful; less predictive guidance |
| Standing-order automation | Generous | Standard | Same conservation, potentially stricter capacity |
| Force-majeure relief | More forgiving | Profile-based | Narrower where fiction supports it |
| Contract spam limits | Strong UI filtering | Standard | Standard |

Peaceful/creative worlds may keep contracts for building, trade and roleplay while disabling punitive breach beyond refunds/cancellation if desired.

## 59.3 Anti-Micromanagement Defaults

- automatically group routine deliveries by contract;
- one-click tender from eligible inventory/storage;
- auto-reserve when player enables it;
- recurring contract templates;
- default acceptance for objective commodity criteria;
- reminder thresholds rather than constant notifications;
- dashboard shows only at-risk or next-due obligations by default;
- automated fulfilment hooks for mature factories/warehouses;
- batch amendment/cancellation tools for organisation managers where safe;
- no requirement to manually sign every routine NPC household purchase.

# 60. Production Classification Guidance

Suggested first-pass Set 25 production tiers:

| Feature | Suggested Tier | Notes |
| --- | --- | --- |
| Simple delivery/procurement contract | Core Production | Central to living settlement economy. |
| Contract offer/acceptance/versioning | Core Production | Required foundation. |
| Goods/service obligations | Core Production | Needed for diverse gameplay. |
| Deposits and simple escrow | Core Production | Useful anti-exploit/player-trust foundation. |
| Milestone payment/acceptance | Core Production | Required for construction/custom work. |
| Cure, cancellation and common breach | Core Production | Prevents brittle contracts. |
| Standing supply contracts | Early Access | Valuable for automation/civilisation scale. |
| Third-party inspection | Early Access | Needed for advanced trade/guilds. |
| Assignment/novation | Early Access/Full | Useful for enterprise persistence. |
| Formal arbitration/legal court integration | Full Release | Basic dispute records earlier; deep institutions later. |
| Complex agency/brokerage | Full Release | Optional depth. |
| Advanced liquidated damages profiles | Full Release | Keep Core simple. |
| Cross-realm/maritime contract families | Depends on Set 26/full-world package | Reuse same core runtime. |
| Illicit contract variants | Full Release/optional | Depends on 27I and world settings. |

# 61. Open Decisions and Handoffs to 27F-27J

The following remain intentionally deferred:

1. Exact interest/late-debt policy after unpaid contract claim - 27F.
2. Whether performance guarantees/sureties enter Core or later - 27F.
3. Insurance treatment of delivery/service contracts - 27F.
4. Public procurement budget controls, bid competition and emergency authority - 27G.
5. Whether public procurement uses sealed bids, scored tenders or simple offers by default - 27G/27J production review.
6. Final caravan freight-rate/route-risk formula - 27H.
7. Carrier liability profiles for terrestrial commercial transport after Set 30 integration - 27H.
8. Smuggling/illegal-contract enforceability and black-market contract discovery - 27I plus governance/Set 28.
9. Monopoly/exclusive-supply contract restrictions - 27I.
10. Final economy-wide contract dashboard, notifications and advanced organisation permissions - 27J.
11. Final replication/relevance budgets for thousands of distant contracts - 27J.
12. Exact default deposit percentages by contract family after balance testing.
13. Exact legal/court implementation tier and whether informal arbitration precedes court use universally or by culture.
14. Whether NPCs can independently negotiate bespoke amendment chains at distant LOD or must choose bounded templates.
15. Whether contract templates can be player-authored/mod-authored through a restricted creator at release; Set 25/Forge/27J review required.

# 62. Cross-Set Interface Amendments

The Leyforge Document Sets 27-30 Cross-Set Interface Register v1.0 remains governing. 27E proposes the following additions for final reconciliation.

## Amendment 27E-IFACE-001 - Economic Contract Negotiation

**Reason:** 27E owns contractual terms but Set 28 owns social willingness/persuasion.

**27E -> Set 28:** contract family, party identities, proposed economic terms, deadline, risk/security, fairness/value context, hard policy bounds and allowed concession ranges.

**Set 28 -> 27E:** accept/reject/counter request, bounded social concession result, refusal reason category and relationship consequence hook.

**Ownership transfer:** None.

## Amendment 27E-IFACE-002 - Contract Performance Social Memory

**Reason:** Contract reliability should affect people without 27E owning relationships.

**27E -> Set 28:** factual events for on-time completion, quality, early completion, cancellation, breach, cure, non-payment, dispute and settlement.

**Set 28 -> 27E:** optional trust/reliability modifier usable by future contract-risk/deposit profiles, never direct balance mutation.

**Ownership transfer:** None.

## Amendment 27E-IFACE-003 - Survival/Capacity Exception

**Reason:** Illness/injury/fatigue may affect service capability or exception handling.

**Set 29/07 -> 27E:** capability/unavailability fact, start/end horizon, severity category, whether externally classed as unavoidable under owning policy.

**27E -> Set 29/07:** contract-required service window, criticality and requested capacity only.

**Ownership transfer:** None.

## Amendment 27E-IFACE-004 - Terrestrial Delivery Execution

**Reason:** Delivery contracts require actual movement outcomes without owning traversal.

**27E -> Set 30/27H:** cargo/service identity, origin, destination, deadline/window, custody requirements, capacity class and authorised carrier/asset references.

**Set 30/27H -> 27E:** actual travel/arrival time, route accessibility, interruption, delivered quantity/condition and handover result.

**Ownership transfer:** None.

## Amendment 27E-IFACE-005 - Contracted Passenger/Companion Service

**Reason:** Escort, guide or hired-companion contracts may require both social consent and movement execution.

**27E -> Set 28/30:** accepted service obligation, destination/window, authorised participants and economic terms reference.

**Set 28 -> 27E:** continued willingness/valid social refusal result where allowed by contract/profile.

**Set 30 -> 27E:** travel execution/arrival result.

**Ownership transfer:** None.

# Appendix A. Contract and Obligation Record Templates

## A.1 ContractDefinition

```yaml
id: economy.contract.definition.procurement_delivery.standard
family_id: economy.contract.family.procurement_delivery
allowed_party_roles:
  - buyer
  - supplier
allowed_obligation_profiles:
  - transfer_goods
  - deliver_to_destination
  - transfer_currency_or_value
default_acceptance_profile_id: economy.contract.acceptance.objective_goods
default_deposit_profile_id: economy.contract.deposit.moderate_optional
default_breach_profile_id: economy.contract.breach.commercial_standard
default_force_majeure_profile_id: economy.contract.force_majeure.route_and_disaster
supports_partial_performance: true
supports_amendment: true
supports_assignment: conditional
supports_recurring: true
required_capabilities:
  - contract.sign
production_tier: core
```

## A.2 ContractOfferRecord

```yaml
offer_id: contract_offer:<ULID>
definition_id: economy.contract.definition.procurement_delivery.standard
issuer_party_id: enterprise:<ULID>
issuer_signatory_id: npc:<ULID>
intended_counterparty_rule: open_eligible_supplier
version: 3
created_world_time: 1083.5
expires_world_time: 1100.0
terms_snapshot:
  consideration:
    currency_family_id: currency.riverward_crown
    amount: 240
  delivery_window:
    earliest: 1088.0
    latest: 1095.0
  deposit_required: 0
obligation_drafts:
  - profile: transfer_goods
    item_tag: food.grain
    quantity: 200
  - profile: deliver_to_destination
    destination_id: storage:village_warehouse_A
status: offered
```

## A.3 ContractInstanceRecord

```yaml
contract_id: contract:<ULID>
definition_id: economy.contract.definition.procurement_delivery.standard
accepted_offer_id: contract_offer:<ULID>
accepted_offer_version: 3
state: active
activated_world_time: 1084.1
parties:
  - party_id: settlement:riverbend
    role: buyer
    signatory_id: npc:reeve_03
  - party_id: player:<ULID>
    role: supplier
obligation_ids:
  - obligation:<ULID>
  - obligation:<ULID>
milestone_ids: []
reservation_links:
  - reservation:<ULID>
escrow_id: null
root_requirement_id: village_need:<ULID>
linked_quest_ids: []
linked_project_ids: []
current_version: 1
next_evaluation_world_time: 1088.0
```

## A.4 ObligationInstanceRecord

```yaml
obligation_id: obligation:<ULID>
contract_id: contract:<ULID>
profile_id: economy.contract.obligation.transfer_goods
obligor_party_id: player:<ULID>
beneficiary_party_id: settlement:riverbend
state: in_progress
requirement:
  item_tag: food.grain
  quantity_required: 200
  quantity_tendered: 120
  quantity_accepted: 120
  minimum_quality: standard
  substitution_profile_id: economy.contract.substitution.grain_family
window:
  due_world_time: 1095.0
partial_performance: true
evidence_ids:
  - contract_evidence:<ULID>
```

# Appendix B. Escrow, Deposit and Evidence Templates

## B.1 EscrowRecord

```yaml
escrow_id: escrow:<ULID>
contract_id: contract:<ULID>
custodian_type: system_conditional_custody
source_owner_party_id: player:<ULID>
beneficiary_party_ids:
  - enterprise:<ULID>
asset_type: currency
currency_family_id: currency.riverward_crown
amount_total: 100
amount_released: 20
amount_refunded: 0
amount_frozen: 80
release_profile_id: economy.contract.escrow.milestone_standard
state: partially_released
transaction_refs:
  - transaction:<ULID>
```

## B.2 ContractEvidenceRecord

```yaml
evidence_id: contract_evidence:<ULID>
contract_id: contract:<ULID>
obligation_id: obligation:<ULID>
evidence_type: goods_handover
source_system: inventory_transaction
source_record_id: transaction:<ULID>
issuer_id: storage:village_warehouse_A
world_time: 1090.2
facts:
  item_id: item.food.grain
  quantity: 120
  accepted_quality: standard
integrity_hash: <hash>
```

## B.3 BreachRecord

```yaml
breach_id: contract_breach:<ULID>
contract_id: contract:<ULID>
obligation_id: obligation:<ULID>
category: late_delivery
first_detected_world_time: 1096.0
materiality: minor
cause_category: supplier_delay
cure_allowed: true
cure_deadline_world_time: 1098.0
state: cure_open
evidence_ids:
  - contract_evidence:<ULID>
```

# Appendix C. Contract State and Reason-Code Catalogue

## C.1 State Transition Summary

| From | Allowed Typical Next States |
| --- | --- |
| draft | invitation, offered, cancelled |
| invitation | offered, expired, cancelled |
| offered | negotiating, accepted_pending_activation, active, withdrawn, expired |
| negotiating | offered, cancelled, expired |
| accepted_pending_activation | active, cancelled, expired/security_failed |
| active | suspended, disputed, completed, cancelled, terminated, breached_closed |
| suspended | active, disputed, cancelled, terminated |
| disputed | active, completed, terminated, breached_closed, voided_by_external_authority |
| completed | terminal |
| cancelled | terminal except follow-up claim resolution |
| terminated | terminal except follow-up claim resolution |
| breached_closed | terminal except claim/legal/finance follow-up |

## C.2 Reason-Code Families

Reason-code prefixes:

- `ECON_CONTRACT_OFFER_*`
- `ECON_CONTRACT_SIGNER_*`
- `ECON_CONTRACT_SECURITY_*`
- `ECON_CONTRACT_OBLIGATION_*`
- `ECON_CONTRACT_DELIVERY_*`
- `ECON_CONTRACT_SERVICE_*`
- `ECON_CONTRACT_INSPECTION_*`
- `ECON_CONTRACT_ESCROW_*`
- `ECON_CONTRACT_BREACH_*`
- `ECON_CONTRACT_REMEDY_*`
- `ECON_CONTRACT_DISPUTE_*`
- `ECON_CONTRACT_LOD_*`
- `ECON_CONTRACT_MULTIPLAYER_*`

# Appendix D. Cross-System Responsibility Matrix

| System | Supplies to 27E | Receives from 27E |
| --- | --- | --- |
| 27B | values, currencies, barter, quote/payment settlement | contract price/payment observations, future payment obligations |
| 27C | stock, market pressure, procurement intents, merchant policy | contractual arrivals, reservations, completed/cancelled procurement |
| 27D | enterprises, accounts, rights, employment/lease economics | contracts, receivables/payables, deposits, service/procurement commitments |
| 27F | financing, guarantees, insurance, debt/insolvency decisions | claims, schedules, breach/loss evidence |
| 27G | public budgets, taxes/fees, treasury authority | public procurement/payment events |
| 27H/Set 30 | route/transport capacity and outcomes | delivery terms, cargo/service requirements |
| 27I | illicit/embargo network state | restricted-contract performance/evidence |
| Set 28 | negotiation/social response | factual contract performance and proposal context |
| Set 29 | health/capacity exceptions | service windows/criticality |
| Set 26 | maritime execution, cargo/vessel/port outcomes | universal maritime contract/escrow terms |
| 07 | actor/job/schedule identity and work execution | contractual party/obligation references |
| 15 | quest/event state and authored presentation | contract events, completion/breach facts |
| 19/20 | project/building truth | commission/payment/acceptance terms |
| 20C/law | legal decisions and enforcement authority | dispute case/evidence/claim package |
| 17 | UI/UX presentation | contract view models/reason codes |
| Set 25 | schemas/IDs/validation/migration | new contract definition/runtime families |

# Appendix E. Suggested Contract Profiles

## E.1 Simple Local Delivery

- no deposit by default;
- objective goods acceptance;
- one due window;
- partial delivery allowed;
- payment on accepted delivery;
- short cure window;
- cancellation before pickup with no penalty unless custom procurement cost exists.

## E.2 Custom Craft Commission

- moderate deposit;
- exact/quality-specific deliverable;
- provider may reserve specialist materials;
- client inspection;
- cure/rework allowed;
- deposit credited toward final price;
- cancellation compensates authorised consumed custom inputs within caps.

## E.3 Construction Commission

- deposit + milestone escrow;
- project-system evidence;
- change-order support;
- retention until activation/defect check;
- force-majeure route/site events;
- client cancellation settles completed stages and irreversible approved inputs.

## E.4 Recurring Settlement Supply

- framework + periodic call-offs;
- quantity range;
- budget cap;
- storage-capacity validation;
- physical delivery each period;
- auto-suspend on repeated shortfall/funding failure;
- market demand dedup by root requirement.

## E.5 Asset Lease/Charter

- right-instance reference;
- recurring fee;
- damage/security deposit;
- authorised users/operators;
- return condition;
- maintenance responsibility;
- usage restrictions supplied by asset/movement/maritime owner.

## E.6 Escort/Transport Service

- origin/destination;
- protected cargo/party;
- travel window;
- service payment;
- risk allocation;
- contribution/arrival evidence;
- combat/movement outcomes external;
- force-majeure and abandonment terms.

# Appendix F. Deterministic Validation Matrix

| Test ID | Test | Acceptance |
| --- | --- | --- |
| CTR-001 | Offer version race | Only acceptance of current authoritative version succeeds. |
| CTR-002 | Signatory authority | Unauthorised signer cannot bind organisation or move security. |
| CTR-003 | Escrow conservation | Escrow in = released + refunded + frozen; no duplicate value. |
| CTR-004 | Goods fulfilment | Accepted quantity cannot exceed actual handed-over quantity. |
| CTR-005 | Duplicate lot | Same lot cannot satisfy two exclusive contracts. |
| CTR-006 | Root demand dedup | Procurement contract does not double market demand. |
| CTR-007 | Service evidence | No service completion without owning-system evidence. |
| CTR-008 | Stale quote | Contract preserves accepted quote/value snapshot but current market does not rewrite signed price. |
| CTR-009 | Late cure | Curable late obligation does not become material breach before cure expiry. |
| CTR-010 | Penalty conservation | Late/forfeit amount transfers/creates claim only; no currency mint. |
| CTR-011 | Force majeure | Qualified event triggers declared rule only. |
| CTR-012 | Invalid force majeure | Unqualified delay remains ordinary performance issue. |
| CTR-013 | Cancellation settlement | Completed accepted work and unused security settle according to terms. |
| CTR-014 | Amendment history | Prior accepted version remains auditable after amendment. |
| CTR-015 | Property right | Lease contract cannot grant right not held by lessor. |
| CTR-016 | Public budget | Public procurement fails without valid 27G authority/funding. |
| CTR-017 | Multiplayer race | Exclusive contract slot accepted by only one concurrent client. |
| CTR-018 | Distant fulfilment | LOD cannot create output/cargo beyond real stock/capacity. |
| CTR-019 | Promotion reconciliation | Contract-reserved goods/funds match local state after promotion. |
| CTR-020 | Dispute freeze | Only disputed escrow/remedy portion freezes when profile allows split settlement. |
| CTR-021 | Quest separation | Quest completion alone cannot satisfy unmet economic obligation. |
| CTR-022 | Maritime loss | Lost cargo remains lost; contract generates only authorised claim/remedy. |
| CTR-023 | Automation standing order | Automated cycle stops at physical output/funds/storage limits. |
| CTR-024 | Save/load | Contract, escrow, amendments and obligations reproduce exactly after reload. |
| CTR-025 | Migration | Old contract version migrates without changing accepted economic meaning or duplicating security. |

# Appendix G. 27E Completion Checklist

- [x] Adopted 27A-27D and the Sets 27-30 Cross-Set Interface Register.
- [x] Defined persistent contract/obligation architecture.
- [x] Separated invitations, offers, spot orders and binding agreements.
- [x] Defined signatory authority and multiplayer validation.
- [x] Defined goods, service, delivery, project, lease and employment adapters.
- [x] Defined procurement promotion from 27C.
- [x] Defined consideration/payment without overriding 27B.
- [x] Defined deposits, retainers, reservations and funded escrow.
- [x] Defined milestones, partial performance and staged payment.
- [x] Defined quality, substitution, inspection and acceptance.
- [x] Defined amendment, assignment, delegation and novation boundaries.
- [x] Defined cancellation, termination and expiry.
- [x] Defined force-majeure handling from external world events.
- [x] Defined breach categories, cure and materiality.
- [x] Defined economic remedies without creating value.
- [x] Preserved 27F ownership of formal debt, finance and insurance.
- [x] Preserved governance ownership of courts, arrest and forced seizure.
- [x] Preserved Set 28 ownership of social relationships/negotiation willingness.
- [x] Preserved Sets 29-30 ownership of survival and movement.
- [x] Integrated Set 26 maritime contracts.
- [x] Defined automation-safe recurring fulfilment.
- [x] Defined LOD, persistence, audit and reconciliation.
- [x] Defined Set 25 schema/relationship requirements.
- [x] Defined Godot/Summer Engine service boundaries.
- [x] Added reason codes, deterministic tests and acceptance scenarios.
- [x] Recorded cross-set interface amendments.
- [x] Handed credit, banking, insurance and formal debt to 27F.
