# FANTASY VOXEL CIVILISATION SANDBOX

## DOCUMENT SET 27

# 27G - Taxation, Tariffs, Treasuries and Public Finance

**Version 0.1 - Detailed Economic Design Bible and Public-Finance Architecture Draft**

*A data-driven public-finance system for legitimate revenue, taxes, tolls, tariffs, customs, treasuries, budgets, reserves, public procurement, subsidies, aid, tribute, public borrowing and accountable civilisation-scale expenditure in Leyforge.*

> **Public-Finance System Statement**
>
> Leyforge's governments, settlements, councils, guild authorities, occupying powers and other recognised public institutions may collect and spend value only through explicit authority, valid policy and authoritative transactions. A tax office does not generate money by existing. A customs post cannot charge trade that never crossed its boundary. A treasury cannot fund a wall without both money and the physical materials, labour and capability required to build it. Public finance should create understandable civilisation trade-offs: higher revenue can support roads, guards, hospitals, schools, relief and reserves, but collection can also alter household affordability, business margins, route choice, trust, evasion pressure and faction politics. The system must be deep enough to support a player ruler or merchant empire while remaining largely delegable for players who only want to build, explore, trade or help settlements.

| Field | Locked Direction |
| --- | --- |
| Document Set | This is Document 27G in Document Set 27: Economy, Markets, Contracts, Trade and Public Finance. |
| Primary Ownership | Tax and charge policy, assessment, fiscal posting, treasury state, public budgets/appropriations, reserves, public transfers, subsidies, grants, public borrowing authority, guarantees/backstops and fiscal reporting. |
| Physical-Economy Rule | Revenue and expenditure move authoritative value. Taxes, tariffs, fees, grants, subsidies and public payments never duplicate items, currency, services or project inputs. |
| Taxation Granularity | Hybrid. Important player-facing and enterprise transactions may be assessed explicitly; routine household/background taxation is aggregated by period at settlement LOD. No daily tax paperwork for every NPC. |
| Default Player Experience | Standard worlds use moderate, legible public finance with delegated routine administration. Players see material fiscal choices only when they matter. Advanced accounting controls can be enabled for ruler/economy-focused play. |
| Treasury Rule | Public funds are held in authoritative treasury accounts/funds with ownership, restrictions, commitments, reserves and audit history. A public building provides capability but is not itself a balance. |
| Budget Rule | Budgets authorise and reserve spending; they do not create resources. A funded project still needs valid contracts, labour, inventory, routes, tools, power/mana and construction capability from owning systems. |
| Tax Design | Taxes are modular policies defined by authority, jurisdiction, basis, rate/form, thresholds, exemptions, destination, cadence and enforcement hooks. Avoid one universal tax system. |
| Tariff/Customs Rule | Tariffs/customs apply only to valid cross-boundary trade events or route checkpoints. Set 26 owns maritime inspection execution; Set 30 owns terrestrial traversal; 27G owns the fiscal charge and treasury posting. |
| Public Borrowing | 27G authorises public borrowing, limits, purposes, guarantees and repayment funding. 27F owns the generic debt instrument, creditor claims, schedules and default mechanics. |
| Monetary Boundary | 27G owns public mint/issuance authority and fiscal issuance decisions; 27B owns currency definitions, denomination mechanics, exchange and value/confidence response. Core Production does not require an active central-bank macro simulator. |
| Social/Law Boundary | Law, legitimacy, social reaction, corruption, evasion investigation, detention, confiscation and force remain owned by governance/social/crime systems. 27G exposes fiscal obligations and evidence. |
| Maritime Boundary | Ports, vessels, voyages, cargo handling, inspections and naval execution remain Set 26. 27G supplies tariff, customs, port-charge and public-finance economic postings. |
| Cross-Set Contract | The Leyforge Document Sets 27-30 Cross-Set Interface Register v1.0 remains governing. New required interfaces are recorded in Section 56 for final integration. |
| Engine Direction | Godot runtime with Summer Engine-assisted development under Set 25 and the rewritten Technical Plan. Services remain authoritative, event-driven, persistent and simulation-LOD aware. |
| Next Deliverable | 27H - Trade Routes, Caravans, Regional Exchange and Cross-Realm Commerce. |

# Document Purpose

Document 27G defines how public institutions acquire, hold, allocate and spend economic value. Earlier Leyforge documents already establish civic halls, tax/customs offices, treasuries, route-bound inspection facilities, laws, settlement projects, public services, physical warehouses and persistent world consequences. Documents 27A-27F establish the universal economic contracts beneath those systems: value and currency, markets, labour and enterprises, contracts, debt and insurance. 27G turns those foundations into an accountable public-finance layer.

The document is deliberately broader than a list of tax rates. Public finance in Leyforge must explain how a settlement pays guards after a raid, funds a road repair, accumulates famine reserves, grants emergency relief, subsidises a strategic workshop, repays public debt, charges a caravan crossing a maintained bridge, collects customs at a faction border, receives tribute after conquest, or chooses between a new hospital and a larger defence project.

The system must also preserve sandbox freedom. A player who does not govern a settlement should rarely need to interact with detailed fiscal controls. Routine NPC taxation and budgeting can run under cultural/government policy profiles. A player who becomes mayor, ruler, guild leader, conqueror or treasury officer can deliberately inspect and alter policy within the permissions of that government and world state.

27G does not own law, government legitimacy, social trust, merchant pricing, enterprise accounting, construction, movement, naval inspection, combat or crime enforcement. It consumes those systems through explicit interfaces and records the economic consequences.

# Design Sources, Authority and Supersession

| Source | Existing Direction | 27G Use / Boundary |
| --- | --- | --- |
| 00 - Master Game Design Bible | Living civilisations, trade, politics, player freedom, rulers/conquerors and real resource consequences. | Public finance serves civilisation growth without becoming mandatory grand strategy. |
| 01 - Core Gameplay Loop | Trade, settlement support, construction, defence and expansion connect to the physical loop. | Fiscal choices must create world-facing goals and consequences, not detached accounting. |
| 02 - Player Progression | Trade and leadership are legitimate progression paths; no class lock. | Governance/economic roles can unlock better information and delegated controls without hard-gating ordinary trade. |
| 04 - Items Registry | Currency/trade goods, ownership, physical stock, culture goods and item values. | Revenue involving items must reference valid item/currency identities and ownership. |
| 05 - Crafting and Recipe Registry | Project recipes conserve inputs; timed work and village projects require real resources. | Public funding cannot bypass recipe/project requirements. |
| 06 - Resource Progression | Strategic resources, scarcity, culture demand and exact village consumption. | Tax/tribute/resource levies may reference real goods while preserving long-term resource identity. |
| 07 - NPC Village System | Named NPCs, jobs, households, needs, warehouses, reputation, policies and persistent consequences. | Supplies taxpayers, public staff, settlement state and routine simulation summaries. 27G does not own NPC behaviour. |
| 08 - Automation System | Physical logistics, storage, permissions and authoritative resource transfers. | Public warehouses and automated public supply use existing logistics; fiscal records do not teleport goods. |
| 09 - Magic System | Magical infrastructure, licences/risks and culture-specific practices. | Public policy may tax, subsidise or fund magic services but never defines magic behaviour. |
| 11 - Biomes and World Generation | Regions, roads, resources, settlements and boundaries shape access. | Jurisdiction and route context may constrain where taxes/tolls/customs can apply. |
| 13 - Races, Peoples, Cultures and Factions | Governments, laws, territory, diplomacy, customs, legitimacy and conquest are separate layered systems. | Defines who may lawfully impose a fiscal policy and which jurisdiction is active. 27G does not invent government legitimacy. |
| 15 - Quest and Event System | Shortages, contracts, disasters, politics and persistent world history create goals. | Fiscal crises, relief, public works and policy disputes expose quest/event hooks. |
| 16 - Combat, Gear and Defence | Raids, losses, tribute, supplies, defence and aftermath affect settlements. | Defence costs and losses affect budgets; combat resolution remains external. |
| 17 - UI/UX System | Trade/governance screens require reason-first, accessible and knowledge-aware presentation. | 27G exposes fiscal view models, histories, warnings and explanations. |
| 19 - Settlement Growth | Roads, projects, player-founded settlements, warehouses, growth and permissions. | Public budgets can fund or prioritise projects but do not own construction execution. |
| 20 / 20C | Civic halls, courts, customs/tax offices, secure treasury spaces, laws and route-bound authority. Taxes/tolls/tribute are policies and transactions, not free resources. Customs requires a real gate, port, border or portal. | 27G defines the fiscal mechanics enabled by these civic capabilities. Decorative offices do not collect revenue. |
| 20D | Roads, bridges, storage, public water, route ownership and optional toll/customs links. | Route charges require valid infrastructure/service or authority context. |
| 25A-25L | Canonical IDs, schemas, ownership, relationships, validation, migration, production scope and task contracts. | All 27G definitions and runtime record families register through Set 25; no parallel schema kernel. |
| 26J/26K/26N | Ports, customs, maritime cargo, port services, tariffs, manifests and route/fleet economics. | Set 26 executes maritime movement/inspection; 27G owns universal tariff/customs fiscal obligations and treasury posting. |
| 27A | Public finance must connect revenue to visible services/reserves; taxes and spending use accountable records. | Governing economic rules. |
| 27B | Currency, barter, reference value, exchange, price/value basis and currency confidence. | Supplies monetary units, valuation and exchange. 27G may authorise issuance but does not redefine currency mechanics. |
| 27C | Market stock, supply/demand, market information and quotes. | Taxes/tariffs/subsidies may alter market costs and pressure through explicit policy outputs. |
| 27D | Households, enterprises, wages, ownership, operating budgets and public-enterprise boundary. | Provides tax bases and public employer/enterprise state; 27G owns public policy and treasury flows. |
| 27E | Contracts, procurement, services, escrow, claims and evidence. | Public procurement uses the same contract engine with 27G budget/authority checks. |
| 27F | Debt, banking, guarantees, insurance, distress and creditor claims. | 27G authorises public debt/guarantees/backstops; 27F executes finance instruments. |
| Sets 27-30 Interface Register | Economy owns economic rules; social/survival/movement systems expose required inputs. | Governing ownership contract for parallel authoring. |

> **Supersession Rule**
>
> Earlier statements that imply a tax office passively generates revenue, that settlement wealth is a free abstract statistic, that a toll can be collected without a valid route/boundary event, or that public spending can create project resources are superseded by 27G. Earlier government, settlement, building, law, movement and maritime documents retain ownership of their own systems.

# Static Table of Contents

1. Locked Public-Finance Identity  
2. Locked Decision Summary  
3. Scope and Explicit Non-Goals  
4. Canonical Fiscal Terminology  
5. Source-of-Truth and Ownership Boundaries  
6. Public Authorities, Jurisdictions and Fiscal Capability  
7. Treasury Architecture and Public Accounts  
8. Public Funds, Restrictions, Reserves and Commitments  
9. Revenue Conservation and Posting Architecture  
10. Tax Policy Definition Model  
11. Tax Bases, Assessment and Valuation  
12. Tax Rates, Thresholds, Bands and Non-Currency Forms  
13. Collection Events, Withholding and Periodic Settlement  
14. Taxation Granularity and NPC/Household Aggregation  
15. Fees, Licences, Permits and Service Charges  
16. Tolls, Road/Bridge Charges and Route Services  
17. Tariff and Customs Identity  
18. Customs Classification, Origin and Value Basis  
19. Customs Clearance, Payment and Treasury Posting  
20. Exemptions, Reliefs, Drawbacks, Waivers and Treaties  
21. Tribute, Tithes, Dues and Politically Imposed Transfers  
22. Public Rents, Leases, Concessions and Resource Rights  
23. Public Enterprises, Dividends and Service Revenue  
24. Fines, Forfeitures, Confiscation and Justice Boundary  
25. Donations, Grants, Aid and Intergovernmental Transfers  
26. Earmarked Revenue and Restricted Funds  
27. Public Budget and Appropriation Architecture  
28. Budget Cycle, Forecasts and Delegated Administration  
29. Public Wages, Staffing and Payroll Funding  
30. Public Procurement and Contract Integration  
31. Infrastructure, Construction and Capital Projects  
32. Public Services, Operations and Maintenance Funding  
33. Subsidies, Rebates, Incentives and Price Support  
34. Relief, Welfare, Emergency Aid and Crisis Spending  
35. Reserves, Contingency Funds and Strategic Stock  
36. Deficit, Surplus and Fiscal Balance  
37. Public Borrowing, Debt Service and 27F Integration  
38. Public Guarantees, Backstops and Deposit Protection  
39. Currency Minting, Issuance and 27B Boundary  
40. Inflation, Currency Confidence and Fiscal Feedback  
41. Public Asset Sales, Privatisation and Concessions  
42. Occupation, Conquest, Tribute and Fiscal Transition  
43. Cross-Jurisdiction Revenue, Treaties and Revenue Sharing  
44. Maritime Customs, Port Charges and Set 26 Integration  
45. Terrestrial Customs, Tolls and Set 30 Integration  
46. Market, Enterprise and Labour Feedback  
47. Social, Reputation, Legitimacy and Set 28 Boundary  
48. Survival, Health, Food Security and Set 29 Boundary  
49. Fiscal Events, Quests and World History  
50. Simulation LOD, Distant Public Finance and Reconciliation  
51. Multiplayer Authority, Roles and Auditability  
52. UI/UX, Difficulty, Accessibility and Player Trust  
53. Set 25 Schemas, Godot Services and Validation  
54. Representative Acceptance Scenarios  
55. Production Scope, Balance and Open Decisions  
56. Cross-Set Interface Amendments  
- Appendix A. Public-Finance Definition and Runtime Templates  
- Appendix B. Tax, Tariff and Charge Templates  
- Appendix C. Treasury, Budget and Fund Templates  
- Appendix D. Initial Fiscal Reason-Code Catalogue  
- Appendix E. Cross-System Interface Matrix  
- Appendix F. 27G Completion Checklist

# 1. Locked Public-Finance Identity

Public finance is the authorised civilisation-resource-allocation layer of Leyforge. It converts lawful or otherwise recognised public claims into treasury state, and converts treasury authority into bounded spending decisions. It must remain subordinate to physical truth: money can purchase or reserve capability, but it cannot create stock, labour, travel time, safe roads, hospital beds, guards, mana, ships or building materials that do not exist.

> **Locked Rule**
>
> Every public receipt must identify where value came from, every public expenditure must identify where value went, every commitment must reserve against a valid source, and every fiscal policy must have a recognised authority and jurisdiction. Public finance may aggregate routine activity for performance, but the aggregate must reconcile to legitimate sources and sinks.

## 1.1 Player-Facing Promise

A player should be able to inspect a settlement or public organisation and understand questions such as:

- What is the treasury balance and how much is already committed?
- Which services are costing the most?
- Why did guard payroll fail?
- Why did this bridge toll increase?
- Which trade routes are generating customs revenue?
- Why is a hospital underfunded despite a treasury surplus?
- How much famine/emergency reserve exists?
- Why did taxes rise after a siege?
- Is a project blocked by money, materials, labour or authority?
- Why did a tariff reduce imports but increase local prices?
- Is public debt affordable under current revenue?
- Who authorised a subsidy or emergency withdrawal?

The explanation should use concrete causes and reason codes rather than an opaque prosperity number.

## 1.2 Public-Finance Identity Layers

| Layer | Meaning | Example |
| --- | --- | --- |
| Authority | Recognised actor/body allowed to adopt policy or spend public funds. | Village council, governor, guild charter, occupying authority. |
| Jurisdiction | Territory, route, port, market, institution or subject scope where authority applies. | Town boundary, bridge crossing, harbour customs zone. |
| Policy | Rule creating a public obligation, exemption, allocation or permission. | 2% market levy, bridge toll, grain-import relief. |
| Assessment | Calculation of a specific amount/quantity due under a policy. | 4 silver due on a caravan declaration. |
| Treasury | Authoritative public account/fund structure. | Settlement general treasury. |
| Commitment | Reserved budget capacity for an approved obligation. | Guard payroll for next seven days. |
| Expenditure | Authorised transfer to worker, supplier, claimant, project, service or other treasury. | Pay road-repair contractor. |
| Reserve | Funds or physical stock intentionally protected for defined risks. | Famine reserve, emergency cash fund. |
| Fiscal Memory | History of revenue, spending, decisions, deficits, defaults and emergency actions. | Post-raid emergency budget record. |

# 2. Locked Decision Summary

| Area | Locked Decision |
| --- | --- |
| Tax Complexity | Hybrid and configurable. Default uses a small number of understandable policy families; advanced worlds may enable more granular taxes/fees. |
| Routine NPC Taxation | Aggregate at household/enterprise settlement periods unless an individual transaction is important, disputed or player-facing. |
| Player Taxes | Show before commitment when predictable; provide a receipt/reason after assessment. Avoid surprise hidden deductions. |
| Tax Bases | Support transaction, income/wage, enterprise profit/surplus, property/tenure, production/resource, head/household, customs/import/export and special/event bases, but not every culture uses every base. |
| Default Core Tax Mix | Prefer simple market/transaction fees, route tolls/customs, public rents/concessions and optional household/enterprise contributions before complex income/profit taxation. |
| Progressive Tax | Supported as a policy profile but not universally required. |
| In-Kind Tax | Supported where culture/government permits: grain, labour-days, materials, livestock, magical resources or other accepted goods. Must be physically delivered/reserved. |
| Withholding | Supported for public payroll and formal enterprises if policy enables it; otherwise assessment may be periodic. |
| Tax Evasion | 27G records unpaid/avoided obligations and discrepancy evidence. Discovery, deception, corruption and enforcement belong to Set 28/justice/27I. |
| Tax Refunds | Supported through adjustment/refund claims and budgeted treasury payment. Refunds cannot exceed paid/credited amounts except explicit subsidy/relief policy. |
| Customs | Requires valid border/port/route/portal crossing, declaration and applicable jurisdiction. No global remote customs collection. |
| Tariff Basis | Quantity, declared/appraised value, cargo class, origin/destination or specific schedule; exact form is policy-defined. |
| Toll Basis | Per passage, vehicle/vessel class, cargo class, usage period or service tier. |
| Treasury Model | General fund plus restricted/earmarked funds and physical strategic-stock ledgers where required. |
| Budget Model | Periodic operating budget plus project/event appropriations and emergency authority. |
| Budget Period | Default settlement planning period is configurable; recommended seven-day operational forecast plus longer seasonal/project outlook. No mandatory real-world fiscal-year bookkeeping. |
| Public Payroll | Uses 27D wage accrual/agreements; 27G reserves and authorises public funding. |
| Procurement | Uses 27E contracts. No public purchase without valid spending authority/funding reservation unless a defined emergency rule applies. |
| Subsidies | Real treasury transfer, rebate, procurement support, price support or in-kind grant. Never an invisible production multiplier without cost. |
| Public Debt | Optional/advanced by capability. 27G authorises borrowing; 27F owns instrument mechanics. |
| Bankruptcy | Public fiscal crisis is distinct from ordinary enterprise insolvency. Default Core uses service cuts, emergency revenue, aid, restructuring and project delay before any hard public insolvency state. |
| Minting/Issuance | Public authority may authorise issuance only through defined currency rules. Default physical coin minting requires valid material/denomination conversion; abstract issuance is advanced and explicit. |
| Inflation | 27B owns currency confidence/value response. 27G emits fiscal/issuance/shortage signals; no hidden universal inflation tax. |
| Difficulty | Peaceful/relaxed modes can reduce or disable taxes on the player while NPC/public budgets still use simplified internal flows. |
| Player Governance | Policy presets and delegation are default. Advanced manual schedules, exemptions and appropriations are optional. |
| Audit | Every player-meaningful treasury mutation records actor, authority, source/destination, amount, purpose and related policy/contract/event. |

# 3. Scope and Explicit Non-Goals

## 3.1 In Scope

27G owns:

- fiscal authority/capability checks supplied by governance systems;
- tax, tariff, toll, duty, levy and public-charge definitions;
- assessment and posting of public obligations;
- treasury accounts, funds, restrictions and reserves;
- public revenue classification;
- budgets, appropriations and commitments;
- public payroll funding;
- public procurement funding gates;
- project/service funding;
- subsidies, rebates, grants and public aid;
- emergency spending authority;
- public borrowing authorisation and limits;
- public guarantees/backstops/deposit protection policy;
- public mint/issuance authority handoff;
- fiscal reporting, history, LOD and reconciliation;
- fiscal reason codes and validation.

## 3.2 Explicit Non-Goals

27G does not own:

- constitutional design, elections, succession or legitimacy - Documents 13/20C and later governance work;
- NPC persuasion, resentment, compliance personality or corruption - Set 28/social systems;
- arrest, search, detention, seizure or court judgments - justice/combat/governance systems;
- criminal smuggling/evasion networks - 27I plus social/legal systems;
- currency exchange/value formula - 27B;
- market supply/demand simulation - 27C;
- enterprise profit/labour/ownership - 27D;
- contract execution - 27E;
- debt/insurance mechanics - 27F;
- vehicle/vessel movement or customs inspection animation - Sets 30/26;
- construction or public-service functional rules - 19/20;
- a modern real-world tax-code simulator;
- mandatory annual returns for every NPC;
- full central-bank monetary policy, securities markets or macroeconomic forecasting in Core Production;
- infinite compounding penalties or debt traps that make ordinary play unrecoverable.

# 4. Canonical Fiscal Terminology

| Term | Definition |
| --- | --- |
| Public Authority | Recognised settlement/faction/government/guild/occupation body permitted by another system to adopt fiscal policy or control public funds. |
| Fiscal Authority | Specific permission/capability to assess, collect, allocate, borrow, guarantee, mint or spend. |
| Jurisdiction | Spatial/institutional scope in which a policy can apply. |
| Tax | Compulsory public revenue obligation based on an authorised policy. |
| Levy | Broad term for a compulsory charge; may be tax, assessment or special contribution. |
| Duty | Charge attached to a defined good, transaction, privilege or customs event. |
| Tariff | Import/export/cross-boundary duty or schedule affecting trade. |
| Toll | Charge for passage, route use or infrastructure access. |
| Fee | Charge for an identifiable public service, licence, permit or processing action. |
| Tribute | Politically imposed transfer associated with treaty, conquest, protection, subordination or coercive relationship. |
| Tithe/Due | Culture/institution-specific compulsory or customary contribution; only used where the owning culture/government system supports it. |
| Assessment | Authoritative calculation of amount/quantity due. |
| Taxable Event | World/economic event that may create an assessment. |
| Tax Base | Quantity/value/status upon which a fiscal rule operates. |
| Exemption | Rule excluding an otherwise applicable subject/event. |
| Relief | Reduction or suspension due to policy condition. |
| Credit | Amount applied against a public obligation, not necessarily a cash payment. |
| Refund | Return of previously overpaid/credited public revenue. |
| Treasury | Public financial account structure owned by a recognised authority. |
| General Fund | Unrestricted treasury pool available within current budget authority. |
| Restricted Fund | Treasury amount usable only for a defined purpose/source condition. |
| Appropriation | Authorised spending ceiling/purpose from a treasury/fund. |
| Commitment | Amount reserved against an appropriation for an expected obligation. |
| Expenditure | Committed public transfer or authorised spending event. |
| Reserve | Funds/stock deliberately protected from routine spending. |
| Deficit | Period obligations/spending exceed recognised revenue/funding for the measured scope. |
| Surplus | Revenue exceeds expenditures/commitments for the measured scope. |
| Subsidy | Public support that reduces a cost or increases an eligible recipient's resources through a real transfer/benefit. |
| Grant | Public transfer for a defined purpose not structured as repayment-bearing debt. |
| Public Debt | Liability entered by a public authority under 27G authorisation and 27F instrument rules. |
| Fiscal Exposure | Expected public payment risk from debt, guarantee, backstop, claim or commitment. |
| Revenue Posting | Authoritative movement/classification of collected value into a treasury/fund. |
| Fiscal Reason Code | Stable explanation of why an assessment, refusal, allocation or fiscal state occurred. |

# 5. Source-of-Truth and Ownership Boundaries

| Question | Owner | 27G Interaction |
| --- | --- | --- |
| Who is the current ruler/government? | 13/20C/governance | Consume authority identity. |
| Is a tax law valid? | Governance/law | Consume policy authorisation and effective dates. |
| How much is due? | 27G | Assess using valid base/value/circumstance. |
| What is an item worth? | 27B/27C | Consume reference/contextual value where the policy requires value. |
| Does a business have profit/cash? | 27D | Consume enterprise accounting summaries and accounts. |
| Does a contract require payment? | 27E | Consume payable event; 27G may add public charges. |
| Can a settlement borrow? | 27G | Authorise amount/purpose/limit. |
| How does the loan amortise/default? | 27F | Consume debt-service and exposure events. |
| Was cargo physically moved? | Set 30/26 | Consume route/crossing event. |
| Was cargo inspected/seized? | 20C/26/justice | Consume inspection/legal outcome. |
| How does a player feel about taxes? | Set 28/social | Consume/emit economic causes, never social result. |
| Does a hospital function? | 20A/Set 29 | Funding is one input; service capacity remains external. |
| Does a road exist/work? | 20D/Set 30 | Toll can reference valid route/service state. |
| Can a project build? | 19/20/05 | Budget authorises payment; construction still needs actual inputs. |

# 6. Public Authorities, Jurisdictions and Fiscal Capability

A settlement does not automatically gain every fiscal power when it reaches a stage. Capability depends on government/culture/law, administrative buildings, staff, records, authority and current control.

## 6.1 Fiscal Capability Types

- assess tax;
- collect public charges;
- operate customs;
- impose tolls;
- hold public treasury;
- approve ordinary expenditure;
- approve capital projects;
- create restricted funds;
- grant subsidies/aid;
- borrow publicly;
- issue guarantees/backstops;
- authorise currency mint/issuance;
- write off/refund public claims;
- invoke emergency fiscal authority.

## 6.2 Capability Activation

A capability may require:

- recognised authority identity;
- jurisdiction;
- enabling law/policy;
- required civic building capability from 20C/20;
- staff role/capability;
- secure records/treasury access;
- route/border/port binding for customs/tolls;
- multiplayer permission role;
- sufficient simulation tier for detailed execution.

A decorative tax office without staff, jurisdiction or policy grants no revenue.

# 7. Treasury Architecture and Public Accounts

A treasury is not simply a wallet named “town money.” It is a public financial record with controlled sources, purposes and obligations.

## 7.1 Treasury Structure

Recommended hierarchy:

1. Public Authority Treasury
2. Fund
3. Account/holding by currency or accepted value type
4. Commitment/reservation ledger
5. Revenue/expenditure history
6. Optional linked physical reserve stores

## 7.2 Treasury Balance Views

| View | Meaning |
| --- | --- |
| Gross Balance | Total recognised value currently held. |
| Restricted Balance | Amount unavailable for general spending. |
| Committed Balance | Amount reserved for accepted obligations/projects/payroll. |
| Emergency Reserve | Protected contingency amount. |
| Available Balance | Spendable amount after restrictions/commitments/reserves. |
| Near-Term Payables | Expected authorised payments before next budget review. |
| Debt Service Due | 27F schedule due within selected horizon. |
| Fiscal Exposure | Potential calls from guarantees/backstops and unresolved claims. |

**Available Balance = Gross Balance - Restricted - Committed - Protected Reserve**, subject to currency/asset usability and policy.

# 8. Public Funds, Restrictions, Reserves and Commitments

Funds allow the game to represent “we have money, but not money we are permitted to spend on this” without requiring full real-world accounting.

Supported fund categories may include:

- General Fund;
- Defence Fund;
- Infrastructure Fund;
- Relief/Health Fund;
- Education/Knowledge Fund;
- Reconstruction Fund;
- Famine/Food Security Fund;
- Port/Customs Fund;
- Debt Service Fund;
- Culture/Festival Fund;
- Project-specific grant fund;
- externally restricted aid fund.

Restrictions are optional and should remain readable. Most small settlements may use General + Emergency + Project reserves only.

## 8.1 Commitment Rule

An approved contract/project reserves treasury capacity when the spending obligation becomes sufficiently firm. This prevents multiple officials from promising the same money.

Commitments must release or convert when:

- obligation is paid;
- contract is cancelled;
- project stage is abandoned;
- reservation expires;
- appropriation is amended;
- funding source legally changes.

# 9. Revenue Conservation and Posting Architecture

Every revenue event follows a bounded sequence:

1. Identify authorised policy/source.
2. Validate taxable/chargeable event and jurisdiction.
3. Resolve payer/liable party where known.
4. Resolve base quantity/value.
5. Apply rate/form, thresholds, exemptions and credits.
6. Create assessment or immediate charge.
7. Reserve/collect authoritative value.
8. Commit transfer.
9. Post revenue to destination treasury/fund.
10. Emit receipt/history/reason codes.

If a payment fails, the assessment may become payable/arrears state. It does not silently disappear or fabricate collection.

## 9.1 Revenue Categories

- tax revenue;
- tariff/duty revenue;
- toll/fee/service revenue;
- rents/concessions;
- public enterprise transfer/dividend;
- fine/forfeiture receipt from justice owner;
- tribute/tithe/due;
- donation/grant/aid;
- borrowing proceeds;
- mint/issuance proceeds where valid;
- asset-sale proceeds;
- reimbursement/refund recovery;
- other registered public transfer.

# 10. Tax Policy Definition Model

A tax policy is data, not custom code for every settlement.

Minimum fields:

- stable policy ID;
- owning authority;
- jurisdiction/scope;
- tax family;
- effective start/end;
- liable actor categories;
- taxable event/base;
- valuation method;
- rate/form;
- thresholds/bands;
- minimum/maximum where used;
- exemptions/reliefs;
- accepted payment forms;
- collection method/cadence;
- destination treasury/fund;
- arrears treatment hook;
- UI description and reason codes;
- simulation LOD profile.

# 11. Tax Bases, Assessment and Valuation

Supported bases include:

| Tax Base | Example | Source |
| --- | --- | --- |
| Transaction Value | Market sale levy. | 27B/27C committed transaction. |
| Quantity | 1 coin per crate crossing. | Inventory/cargo quantity. |
| Wage/Income | Percentage of formal wage. | 27D wage accrual/payment. |
| Enterprise Profit/Surplus | Period contribution from profitable enterprise. | 27D enterprise accounting. |
| Property/Tenure | Period charge for defined property/tenure right. | 27D ownership/lease + law. |
| Production/Extraction | Share/fee on extracted strategic resource. | Resource/enterprise production evidence. |
| Household/Head | Fixed periodic civic contribution. | Household/public law profile. |
| Import/Export | Duty on goods crossing boundary. | Set 30/26 crossing + 27B value. |
| Resource Rent/Royalty | Share for use of public deposit/land/resource right. | 27D rights/concession. |
| Special Assessment | Temporary charge tied to project/emergency. | 27G policy/event. |

A culture may rely on grain tithe and road tolls while another relies on market fees and public workshop income. The engine must not assume modern income tax is universal.

# 12. Tax Rates, Thresholds, Bands and Non-Currency Forms

Supported rate forms:

- flat percentage;
- progressive bands;
- regressive/declining bands if deliberately authored;
- fixed amount;
- per-unit amount;
- minimum charge;
- capped percentage;
- schedule by commodity/category;
- share-in-kind;
- labour/service-days;
- hybrid amount + percentage.

## 12.1 Recommended Default Complexity

Core/standard settlement profiles should generally expose no more than a few active major charges simultaneously. Examples:

- modest market transaction fee;
- route/customs duty where jurisdiction supports it;
- public rent/concession;
- simple household or enterprise contribution only at mature settlement stages.

Advanced fiscal presets may add progressive brackets, extraction royalties, luxury duties or other specialist policies.

## 12.2 In-Kind Assessment

An in-kind levy may require:

- accepted item/resource tags;
- quality/condition floor;
- quantity or share;
- delivery destination;
- due window;
- substitution rules;
- transport responsibility;
- spoilage/condition rules;
- treasury/public-stock posting.

A grain tithe becomes real grain in a public store. It may then feed relief, guards or markets and can be stolen, spoiled or consumed.

# 13. Collection Events, Withholding and Periodic Settlement

## 13.1 Immediate Collection

Suitable for:

- market transaction fees;
- customs duties;
- bridge/road tolls;
- licence/permit fees;
- selected public services.

The transaction should show the expected charge before confirmation when knowledge is available.

## 13.2 Withholding

Formal employers/public payroll may withhold authorised contributions at payment time. 27D supplies gross compensation; 27G calculates public deduction; the remainder is paid to the worker and the deducted amount is posted to treasury.

## 13.3 Periodic Assessment

Suitable for:

- household dues;
- property/tenure charges;
- enterprise profit contributions;
- concessions/royalties;
- guild/faction public obligations.

Periodic obligations use bounded settlement-time windows rather than real-world filing paperwork.

# 14. Taxation Granularity and NPC/Household Aggregation

27G locks a **hybrid taxation granularity**.

### Detailed mode is used when:

- the player is party to the transaction;
- a named enterprise/public office is inspected;
- a disputed obligation matters to a quest/event;
- customs/route charge must be physically settled;
- a public contract/payroll event occurs;
- multiplayer auditability requires attribution.

### Aggregated mode is used when:

- background households perform routine consumption/income;
- distant enterprises settle ordinary period contributions;
- thousands of tiny transactions would produce no meaningful player decision.

Aggregate settlement must preserve:

- total tax base;
- effective policy/rate;
- exemptions/relief;
- amount due/paid/unpaid;
- treasury destination;
- representative distribution impacts where required;
- deterministic reconciliation when entities promote into detailed simulation.

# 15. Fees, Licences, Permits and Service Charges

A fee is linked to a definable public service, permission or processing action.

Examples:

- building permit/inspection;
- market stall licence;
- guild/professional licence where government owns it;
- land/parcel registration;
- customs processing;
- port pilotage/berth administration when public;
- document/seal service;
- public storage fee;
- magical-practice permit where law allows;
- vehicle/vessel registration where later systems support it.

A fee should normally be explainable as cost recovery, access control, policy or revenue. Excessive fees may create social/market consequences through other systems.

# 16. Tolls, Road/Bridge Charges and Route Services

Tolls are route-bound. A toll policy must reference:

- route/bridge/gate/corridor ID;
- collecting authority;
- valid passage event;
- payer/vehicle/cargo category;
- charge schedule;
- exemption/permit rules;
- payment point or account mechanism;
- destination fund;
- closure/bypass state;
- evidence/audit record.

A settlement cannot collect a bridge toll from a caravan that used another road. If a toll road is damaged or unavailable, the route system may expose no eligible passage event.

# 17. Tariff and Customs Identity

Tariffs are economic charges or schedules attached to cross-jurisdiction trade. Customs is the broader administrative process of declaration, inspection, classification, charge assessment, restriction and clearance.

27G owns:

- fiscal tariff schedule;
- applicable duty amount;
- public fee posting;
- exemption/drawback/relief;
- revenue destination;
- unpaid duty state.

External systems own:

- physical border/port/portal crossing;
- inspection animation/path;
- cargo opening/search;
- seizure/confiscation authority;
- smuggling/deception;
- combat response.

# 18. Customs Classification, Origin and Value Basis

A customs declaration may include:

- cargo lot/manifest ID;
- owner/custodian;
- origin region/faction/realm;
- destination;
- commodity/category tags;
- quantity;
- quality/condition;
- declared value;
- appraised/reference value where policy permits;
- contract purpose;
- exemption/licence/treaty claims;
- restricted/contraband flags supplied by law;
- previous customs/warehouse seals.

## 18.1 Valuation

Tariff valuation may use:

- actual transaction price;
- 27B contextual fair/reference value;
- specific per-unit schedule;
- appraised value;
- whichever rule the policy explicitly defines.

The system must display when assessed value differs materially from declared transaction value.

# 19. Customs Clearance, Payment and Treasury Posting

Recommended flow:

1. crossing/arrival event from Set 30/26;
2. customs jurisdiction resolved;
3. declaration/manifest presented or inferred where permitted;
4. law/restriction checks requested from owning system;
5. tariff/fee assessment by 27G;
6. exemption/treaty/permit applied;
7. payment/reservation committed;
8. treasury posting;
9. clearance/hold decision returned to customs execution owner;
10. history/event emitted.

A fiscal payment does not itself grant clearance if a separate legal restriction still blocks the cargo.

# 20. Exemptions, Reliefs, Drawbacks, Waivers and Treaties

Policy can reduce obligations without rewriting the tax engine.

Supported mechanisms:

- actor exemption;
- commodity exemption;
- minimum threshold;
- relief percentage;
- temporary disaster waiver;
- diplomatic/treaty exemption;
- public-service exemption;
- internal-transit exemption;
- re-export drawback/refund;
- strategic import subsidy;
- hardship relief;
- quest/event-specific waiver with authority.

Every exemption must identify the granting authority/policy and effective scope. Hidden designer exceptions are discouraged because they make the economy impossible to explain.

# 21. Tribute, Tithes, Dues and Politically Imposed Transfers

These are policy profiles for worlds whose cultures/governments use non-market public obligations.

Possible forms:

- periodic coin tribute;
- grain/livestock/material share;
- labour/service days;
- military supply quota;
- protection payment;
- vassal contribution;
- temple/cultural tithe where the relevant institution has recognised authority;
- occupation tribute;
- treaty reparations.

27G records the obligation and transfer. Whether the demand is legitimate, coercive, resisted, feared or politically destabilising belongs to social/faction/governance systems.

# 22. Public Rents, Leases, Concessions and Resource Rights

Public authorities may receive revenue from rights they validly own/control:

- market stalls;
- public farmland;
- workshops;
- docks/berths;
- warehouses;
- mining concessions;
- forests;
- fishing rights;
- mana/leyline extraction rights;
- inns/service spaces;
- public housing where appropriate.

27D owns the underlying ownership/lease/enterprise agreement. 27G classifies authorised receipts into public funds and may define concession policy.

# 23. Public Enterprises, Dividends and Service Revenue

A public enterprise is still an enterprise under 27D. It has real:

- workers;
- stock;
- costs;
- revenue;
- assets;
- capacity;
- profit/loss.

27G owns:

- capital contribution from treasury;
- service-pricing policy where publicly set;
- required dividend/surplus transfer;
- operating subsidy;
- public-service mandate funding;
- recapitalisation authority;
- fiscal reporting/exposure.

A public mine cannot magically finance a city if it does not produce and sell output.

# 24. Fines, Forfeitures, Confiscation and Justice Boundary

Justice/governance systems decide whether a fine, restitution, forfeiture or confiscation is lawful and what is ordered.

27G only accepts a committed public-revenue instruction containing:

- case/order ID;
- authority;
- liable party;
- amount/item;
- destination public fund;
- due/collected status;
- reversal/appeal hook.

27G must not infer guilt from nonpayment or command guards to seize assets.

# 25. Donations, Grants, Aid and Intergovernmental Transfers

Public treasuries may receive or send voluntary/authorised transfers.

Supported categories:

- private donation;
- faction grant;
- disaster aid;
- development grant;
- culture/religious grant where applicable;
- military support;
- reconstruction aid;
- inter-settlement transfer;
- cross-realm aid;
- player donation.

Transfers may be unrestricted or purpose-restricted. In-kind aid must post to physical public stock, not only to a currency ledger.

# 26. Earmarked Revenue and Restricted Funds

Some revenue may be legally/politically bound to a purpose.

Examples:

- bridge toll -> road maintenance fund;
- harbour duty -> port infrastructure;
- emergency levy -> reconstruction;
- temple tithe -> specified institution/service where world law supports it;
- grant -> hospital construction;
- bond proceeds -> named capital project.

Earmarking creates strategy but should be used sparingly. Too many tiny funds become bookkeeping noise.

# 27. Public Budget and Appropriation Architecture

A public budget is an authorised plan, not a prediction that automatically spends money.

## 27.1 Budget Categories

- public payroll;
- routine service operations;
- infrastructure maintenance;
- defence/security;
- health/relief;
- education/knowledge;
- utilities/sanitation;
- culture/morale;
- public procurement;
- capital projects;
- debt service;
- subsidies/grants;
- emergency reserve contribution;
- strategic stock purchase.

## 27.2 Appropriation Rule

An appropriation contains:

- authority;
- budget/fund;
- category/purpose;
- spending ceiling;
- period/project;
- eligible payees/items/services;
- delegation limits;
- emergency override rule;
- current committed/spent balance.

A treasury clerk cannot spend beyond delegated authority simply because the treasury has money.

# 28. Budget Cycle, Forecasts and Delegated Administration

Leyforge should avoid forcing a real-world fiscal year on every settlement.

Recommended planning horizons:

- **Immediate:** current obligations and emergency cash/stock.
- **Operational:** roughly 7-day forecast for payroll, food/service procurement and maintenance.
- **Seasonal/Regional:** crop cycles, winter, storms, migration, trade seasons, festivals.
- **Project:** construction/repair/military campaign duration.
- **Long-term:** debt, megaprojects and capital planning.

Routine budgets can be generated from policy presets and historical demand. Player rulers may adjust priorities rather than line-item every candle.

## 28.1 Delegation Presets

- Balanced;
- Growth/Infrastructure;
- Defence;
- Relief/Recovery;
- Trade/Commerce;
- Magic/Research;
- Austerity/Reserve-Building;
- Custom.

Presets change allocation targets, not system ownership or free output.

# 29. Public Wages, Staffing and Payroll Funding

27D owns employment agreements and wage accrual. 27G owns public funding authority.

Public payroll requires:

- valid employment/job relationship;
- approved payroll appropriation;
- available/committed funds or authorised in-kind compensation;
- payment cadence;
- optional withholding policy;
- transaction commit;
- payroll history.

If funding fails, 27D/07 may expose unpaid wage/worker consequences while 27G records arrears and fiscal cause.

# 30. Public Procurement and Contract Integration

Public buying uses 27E.

Before a public contract can become binding, 27G should validate:

- signatory spending authority;
- appropriation/purpose;
- available balance;
- commitment capacity;
- procurement policy if enabled;
- emergency authority if bypassing normal procedure.

After acceptance:

- 27G holds commitment;
- 27E tracks obligation/performance;
- 27G pays against valid acceptance/milestone events;
- unused commitment releases on cancellation/completion.

No contract should reserve the same public money twice.

# 31. Infrastructure, Construction and Capital Projects

Public capital spending connects to Documents 19/20 and Recipe/Project systems.

A capital project may need:

- budget appropriation;
- site/parcel permission;
- blueprint/project definition;
- material procurement/reservation;
- labour;
- tools;
- routes;
- power/mana;
- staged construction;
- maintenance budget after completion.

**Funding completeness is not construction completeness.** A fully funded bridge can still be blocked by missing stone, flooded foundations or unavailable builders.

# 32. Public Services, Operations and Maintenance Funding

Operational services may include:

- guards/patrols;
- healthcare;
- emergency response;
- sanitation;
- roads;
- water;
- education;
- administration;
- customs;
- public markets;
- wards/magic infrastructure;
- rescue;
- public storage.

27G supplies money/stock budgets. Set 20 and owning gameplay systems determine service capacity. Cutting funding may reduce staffing, procurement or maintenance, which then affects actual service state through those systems.

# 33. Subsidies, Rebates, Incentives and Price Support

Public support must have a real fiscal cost or foregone revenue.

Supported forms:

- direct payment grant;
- per-unit production subsidy;
- purchase/procurement guarantee;
- tax credit/rebate;
- tariff exemption;
- wage support;
- interest support via 27F;
- public input provision;
- infrastructure/service discount;
- emergency price support.

A subsidy never directly multiplies output. It changes recipient resources/costs and may make real production economically viable.

## 33.1 Anti-Exploit Rules

- no subsidy loop that pays more than eligible economic activity without caps/verification;
- no repeated refund on the same tax payment;
- no public procurement and subsidy double-credit unless policy permits and validation accounts for it;
- output-linked support requires provenance/evidence;
- related-party public transactions remain auditable in multiplayer.

# 34. Relief, Welfare, Emergency Aid and Crisis Spending

Leyforge may support public relief without becoming a detailed welfare bureaucracy.

Possible programmes:

- food relief;
- temporary housing support;
- medical treatment funding;
- disaster reconstruction grants;
- burial/family support after raids;
- unemployment/work relief;
- refugee/migration aid;
- livestock/crop recovery;
- emergency transport/evacuation;
- business recovery loans/grants through 27F/27D.

Set 29/20A determines health/needs; 27G determines funding eligibility/payout policy where public aid exists.

# 35. Reserves, Contingency Funds and Strategic Stock

Public resilience uses both financial and physical reserves.

## 35.1 Financial Reserves

- emergency cash/liquid currency;
- debt-service reserve;
- payroll reserve;
- disaster reserve;
- guarantee reserve.

## 35.2 Physical Strategic Stock

- grain/food;
- medicine;
- fuel;
- repair materials;
- weapons/ammunition where law permits;
- mana crystals/ward components;
- ship/vehicle spares;
- construction materials.

Physical reserve ownership remains inventory/logistics truth. Treasury dashboards may value it, but cannot spend the same stock as currency.

# 36. Deficit, Surplus and Fiscal Balance

Fiscal balance is a summary, not a universal punishment meter.

For a period:

**Fiscal Balance = Recognised Revenue + Authorised Financing - Expenditure - Net Reserve Contribution**, with commitments/exposures shown separately.

A deficit may be resolved through:

- drawing reserves;
- delaying/cancelling projects;
- reducing discretionary spending;
- raising revenue;
- receiving aid;
- selling valid public assets/rights;
- borrowing if authorised;
- restructuring obligations;
- accepting temporary arrears and consequences.

A surplus may fund:

- reserves;
- debt repayment;
- capital projects;
- tax relief;
- grants/subsidies;
- service expansion;
- strategic stock.

No automatic “surplus disappears at period end” rule.

# 37. Public Borrowing, Debt Service and 27F Integration

27G authorises whether a public body may borrow.

Authorisation fields include:

- borrowing authority;
- maximum principal/exposure;
- purpose;
- permitted creditor/instrument families;
- currency;
- maturity bounds;
- security/pledge restrictions;
- repayment revenue/fund;
- required reserve/coverage;
- approval role;
- emergency exception.

27F then owns:

- loan/bond instrument;
- lender funding;
- interest/fees;
- payment schedule;
- creditor claims;
- delinquency/default/restructuring mechanics.

27G consumes debt-service events and treats them as public obligations.

# 38. Public Guarantees, Backstops and Deposit Protection

A guarantee is not free safety. It is a contingent fiscal exposure.

Possible public guarantees:

- strategic enterprise loan guarantee;
- disaster reconstruction guarantee;
- deposit protection for eligible financial institutions;
- trade/route guarantee;
- public-service contractor guarantee;
- emergency insurer/backstop support.

Every guarantee needs:

- beneficiary;
- covered obligation;
- limit;
- trigger;
- duration;
- reserve/funding source;
- approval;
- claim history.

A guarantee call creates a real treasury payable through 27F/27E; it cannot vanish because the institution is public.

# 39. Currency Minting, Issuance and 27B Boundary

27G owns the authority/policy decision to mint or issue public currency. 27B owns the currency itself.

## 39.1 Default Physical Coin Model

When a currency uses physical commodity-backed coinage, minting should normally require:

- authorised mint capability;
- valid metal/material input;
- denomination recipe/weight rule;
- minting cost/wastage if applicable;
- conversion of input into currency holdings;
- treasury/mint provenance.

This preserves material conservation.

## 39.2 Abstract/Fiduciary Issuance

If a later culture/era uses account currency or fiduciary notes, issuance must be an explicit policy-controlled monetary event. It should be optional/advanced and expose consequences to 27B currency confidence and 27C markets.

Core Production does not require central-bank open-market operations, interest-rate targeting or modern money-supply modelling.

# 40. Inflation, Currency Confidence and Fiscal Feedback

27G does not own the price engine. It supplies fiscal causes such as:

- large issuance/mint debasement;
- sudden tax burden;
- deficit financing;
- public procurement surge;
- subsidy surge;
- reserve depletion;
- debt distress;
- payment arrears;
- confiscatory policy signal supplied by law/world state.

27B/27C translate these into currency confidence, price and market effects according to their rules.

A player-facing explanation might say:

> “Local coin confidence fell after emergency issuance and missed public debt payments; imported goods now demand a larger exchange premium.”

# 41. Public Asset Sales, Privatisation and Concessions

Public authorities may sell or lease valid assets/rights they own.

Possible transactions:

- land parcel;
- building;
- enterprise stake/enterprise asset;
- resource concession;
- market stall rights;
- toll concession;
- port/warehouse lease;
- salvage rights;
- public equipment.

27D owns ownership transfer/lease rights. 27E owns sale/lease contract. 27G records public proceeds and policy authority.

Player governance must not allow sale of assets the settlement does not own.

# 42. Occupation, Conquest, Tribute and Fiscal Transition

Occupation can change fiscal authority without rewriting historical ownership.

Possible effects:

- new tax schedule;
- tribute obligation;
- altered customs/toll destination;
- occupation administration costs;
- garrison funding;
- confiscation orders from justice/war systems;
- resistance/evasion pressure from Set 28/27I;
- disrupted revenue collection;
- preserved pre-occupation debts/contracts subject to law/treaty decisions.

Fiscal history records previous and current authorities. A conqueror does not automatically inherit every private asset.

# 43. Cross-Jurisdiction Revenue, Treaties and Revenue Sharing

Some routes/services span multiple authorities.

Supported arrangements:

- shared bridge toll;
- port-city/faction customs split;
- regional infrastructure contribution;
- vassal tribute share;
- federation grant;
- joint defence fund;
- cross-realm portal fee sharing;
- customs union/no-tariff treaty;
- revenue rebate between allies.

Treaty/diplomatic validity comes from faction/governance systems. 27G executes the fiscal split after a valid arrangement exists.

# 44. Maritime Customs, Port Charges and Set 26 Integration

Set 26 owns the physical maritime layer:

- vessel approach/arrival;
- harbour access;
- berth capacity;
- manifests/cargo lots;
- customs inspection execution;
- pilotage/port services;
- maritime route risk;
- naval blockade/piracy outcomes.

27G owns universal public-finance postings for:

- import/export duties;
- customs processing charges;
- public berth/harbour fees where policy says public;
- pilotage/service revenue where public;
- fines/forfeitures only after external lawful order;
- port infrastructure earmarks;
- maritime subsidy/aid;
- public naval/port budget.

The same cargo lot may not be charged twice for the same jurisdictional crossing unless policy explicitly defines separate fees with different bases.

# 45. Terrestrial Customs, Tolls and Set 30 Integration

Set 30 will expose:

- route/path used;
- crossing event;
- mount/vehicle class;
- cargo capacity/load summary;
- travel state;
- route accessibility;
- checkpoint interaction context.

27G returns:

- applicable toll/duty/fee;
- payer/payment state;
- permit/exemption outcome;
- treasury destination;
- clearance fiscal component.

Set 30 must not calculate tax policy. 27G must not decide vehicle physics or force a route to be traversable.

# 46. Market, Enterprise and Labour Feedback

Fiscal policy affects other economic systems through explicit signals.

## 46.1 27G -> 27C Market

- transaction-cost modifier;
- import/export cost;
- subsidy/relief effect;
- public procurement demand;
- public stock release/purchase;
- expected policy-change signal if known.

## 46.2 27G -> 27D Enterprises/Households

- tax/fee payable;
- wage withholding amount;
- subsidy/grant payment;
- public contract/payment;
- public rent/concession obligation;
- public-enterprise transfer policy.

27C/27D own behavioural/economic responses. 27G does not directly set merchant prices or worker decisions.

# 47. Social, Reputation, Legitimacy and Set 28 Boundary

Fiscal actions can create social causes but 27G does not calculate emotion or legitimacy.

27G may emit:

- tax burden changed;
- tax collection failed;
- exemption granted/denied;
- aid received/denied;
- public wage unpaid;
- public service cut;
- corrupt/suspicious fiscal event flag supplied by evidence;
- tribute demanded;
- debt default;
- emergency levy imposed.

Set 28/social/governance systems decide:

- trust;
- resentment;
- loyalty;
- fear;
- protest;
- persuasion;
- compliance willingness;
- political legitimacy.

# 48. Survival, Health, Food Security and Set 29 Boundary

27G may fund:

- public food purchases;
- medicine;
- healer wages;
- shelters;
- sanitation;
- emergency heating/fuel;
- recovery grants;
- famine reserves.

Set 29 owns actual player/NPC survival and health state. 27G consumes aggregate need/shortage/capacity data and returns funding/affordability outcomes.

No amount of relief funding heals an injury until a valid treatment/service occurs.

# 49. Fiscal Events, Quests and World History

Public finance should generate readable world stories.

Potential events:

- treasury shortfall;
- payroll crisis;
- famine reserve drawdown;
- emergency levy;
- tax revolt/protest hook from social systems;
- customs dispute;
- tariff war;
- public debt restructuring;
- grant-funded construction;
- corruption investigation hook;
- public enterprise bailout debate;
- disaster relief appeal;
- occupation tribute;
- surplus festival/public project;
- unpaid contractor dispute;
- road-toll abolition campaign.

The Quest/Event system may wrap these states into objectives but cannot overwrite treasury truth.

# 50. Simulation LOD, Distant Public Finance and Reconciliation

Public finance must scale from a camp to many distant cities.

| Simulation Tier | Fiscal Detail |
| --- | --- |
| Near/Interactive | Individual taxable transactions, toll/customs events, public contract payments, visible treasury interactions. |
| Settlement Detail | Batched household/enterprise assessments, payroll, service budgets, procurement and reserve changes. |
| Regional Summary | Aggregate revenue/expenditure categories, public debt service, major project funding, tariff flow, reserve stress. |
| Distant/Inactive | Deterministic period summaries using stored policies, population/business aggregates and bounded event impacts. |

## 50.1 Distant Reconciliation Invariants

Distant simulation must preserve:

- opening and closing treasury balances;
- legitimate revenue sources;
- spending destinations/categories;
- commitments;
- debt-service events;
- reserve changes;
- public stock changes where modelled;
- no double-tax/double-spend;
- deterministic catch-up limits.

When a settlement promotes to detailed simulation, named actors may receive reconstructed obligations/receipts only when needed. The system must not invent personal tax histories unrelated to aggregate truth.

# 51. Multiplayer Authority, Roles and Auditability

Shared settlements/public organisations require explicit roles.

Possible permissions:

- view treasury;
- view restricted funds;
- propose budget;
- approve budget;
- set tax policy;
- grant exemption;
- approve ordinary expenditure;
- approve major project;
- sign public contract;
- borrow publicly;
- issue guarantee;
- invoke emergency spending;
- authorise mint/issuance;
- transfer treasury funds.

High-risk actions should support configurable approval thresholds or multiple signatures for large player organisations, without forcing bureaucracy on solo worlds.

Every committed player-facing fiscal mutation records:

- actor;
- role/authority;
- timestamp/world time;
- policy/budget/contract reference;
- amount/item;
- source/destination;
- reason;
- result;
- reversal/adjustment link where relevant.

# 52. UI/UX, Difficulty, Accessibility and Player Trust

## 52.1 Player-Facing Fiscal Summary

A normal settlement overview should show:

- available treasury;
- protected reserve;
- expected near-term revenue;
- expected near-term obligations;
- major service/project allocations;
- warnings;
- public debt service if relevant;
- active taxes/fees most likely to affect the player.

Deep tabs may expose:

- revenue by category;
- expenditure by category;
- budget vs actual;
- commitments;
- fund restrictions;
- tax schedules;
- customs/toll policies;
- subsidies/grants;
- debt/guarantees;
- transaction history;
- reason-code explanations.

## 52.2 Pre-Transaction Clarity

When possible, show:

- base price/value;
- tax/duty/toll/fee;
- exemption/discount;
- total payable;
- destination authority;
- why the charge applies.

## 52.3 Difficulty/World Settings

Possible controls:

- public-finance complexity: simplified / standard / advanced;
- player tax burden multiplier;
- NPC/background fiscal detail;
- tariff/customs complexity;
- public debt enabled;
- tax evasion/corruption pressure enabled;
- emergency levy frequency/caps;
- public-service generosity;
- ruler micromanagement: delegated / hybrid / manual;
- harsh fiscal consequences vs recovery assistance.

Peaceful worlds may set player-facing taxes to zero while retaining internal treasury flows needed for settlement simulation.

# 53. Set 25 Schemas, Godot Services and Validation

## 53.1 Proposed Canonical Definition Families

Subject to Set 25 admission:

- `economy.public_authority_profile.*`
- `economy.tax_policy.*`
- `economy.public_charge.*`
- `economy.tariff_schedule.*`
- `economy.customs_policy.*`
- `economy.toll_schedule.*`
- `economy.fiscal_exemption.*`
- `economy.public_fund_profile.*`
- `economy.budget_profile.*`
- `economy.subsidy_policy.*`
- `economy.grant_policy.*`
- `economy.public_borrowing_policy.*`
- `economy.guarantee_policy.*`
- `economy.mint_issuance_policy.*`
- `economy.fiscal_lod_profile.*`

## 53.2 Runtime Record Families

- PublicTreasuryRecord
- PublicFundRecord
- FiscalPolicyInstance
- TaxAssessmentRecord
- PublicChargeRecord
- CustomsAssessmentRecord
- RevenuePostingRecord
- BudgetRecord
- AppropriationRecord
- CommitmentRecord
- PublicExpenditureRecord
- SubsidyGrantRecord
- PublicDebtAuthorityRecord
- PublicGuaranteeRecord
- FiscalPeriodSummary
- FiscalAuditRecord

## 53.3 Suggested Godot Services

- `PublicFinanceService` - treasury/fund state and fiscal orchestration;
- `FiscalPolicyService` - resolves active tax/charge policies;
- `AssessmentService` - calculates obligations from valid events;
- `TreasuryTransactionService` - authoritative public receipts/payments;
- `BudgetService` - budgets, appropriations, commitments and authority;
- `CustomsFiscalService` - tariff/duty/fee assessment only;
- `PublicFundingService` - payroll, procurement, project and service funding gates;
- `FiscalExposureService` - debt/guarantee/backstop interface to 27F;
- `FiscalLODService` - distant summaries and reconciliation;
- `FiscalViewModelService` - UI explanations/history;
- `FiscalValidationService` - invariants and scenario tests.

Names are implementation guidance until admitted through the rewritten Technical Plan/Set 25 task contracts.

## 53.4 Representative Commands

- CreateTaxPolicy
- AmendTaxPolicy
- AssessTaxEvent
- PayPublicObligation
- PostPublicRevenue
- CreatePublicBudget
- AllocateAppropriation
- ReservePublicCommitment
- ReleasePublicCommitment
- AuthorisePublicPayment
- GrantFiscalRelief
- IssuePublicGrant
- AuthorisePublicBorrowing
- AuthorisePublicGuarantee
- AuthoriseCurrencyIssuance
- CloseFiscalPeriod

## 53.5 Representative Events

- TaxPolicyActivated
- TaxAssessmentCreated
- PublicObligationPaid
- RevenuePosted
- CustomsDutyAssessed
- TollCollected
- BudgetApproved
- AppropriationCommitted
- PublicPaymentMade
- PublicPaymentFailed
- ReserveDrawn
- SubsidyPaid
- GrantReceived
- PublicDebtAuthorised
- GuaranteeCalled
- TreasuryShortfallDetected
- FiscalPeriodClosed

## 53.6 Hard Validation Invariants

1. No revenue posting without a valid source transaction/assessment/transfer.
2. No expenditure exceeding available appropriation unless a valid emergency/override rule commits it.
3. No double collection from the same taxable event under the same policy instance.
4. No double spending of committed treasury value.
5. Customs/tolls require valid jurisdictional passage/service events.
6. Refund cannot exceed eligible prior payment/credit unless an explicit subsidy/grant policy provides the excess.
7. Public debt cannot be created without 27G authority and 27F-funded instrument.
8. Guarantee call creates a real treasury obligation.
9. Physical in-kind taxes/reserves reconcile to inventory/logistics records.
10. Distant simulation conserves opening/closing balances and categories.
11. Fiscal policies must identify authority, scope, destination and effective dates.
12. Public asset sale requires externally valid ownership/right.
13. Mint/issuance event must reference a valid 27B currency and authorised 27G policy.
14. A building/capability never generates revenue by presence alone.
15. Multiplayer treasury mutations require role/permission validation.

# 54. Representative Acceptance Scenarios

## FIS-001 - Market Transaction Levy

1. Player buys goods through a taxed market.
2. 27C/27B provide committed transaction value.
3. 27G applies the active market levy.
4. Player sees fee before final confirmation.
5. Transaction commits value to seller and levy to treasury.
6. No value is duplicated.

## FIS-002 - Untaxed Market

1. Same trade occurs in a jurisdiction with no market levy.
2. 27G returns no applicable assessment.
3. No hidden deduction occurs.

## FIS-003 - Bridge Toll Bypass

1. Caravan chooses a longer road that does not cross the tolled bridge.
2. Set 30 reports no passage event for the toll asset.
3. 27G collects no bridge toll.

## FIS-004 - Maritime Customs Duty

1. Cargo vessel enters a foreign port under Set 26.
2. Manifest has 40 taxable ingots.
3. 27G assesses duty from cargo class/value and treaty rules.
4. Payment posts to port/faction treasury.
5. Set 26 receives fiscal clearance component.

## FIS-005 - Treaty Exemption

1. Allied caravan crosses a border.
2. Valid treaty exemption is supplied by faction/governance system.
3. 27G reduces duty to zero or defined preference rate.
4. Receipt explains treaty basis.

## FIS-006 - In-Kind Grain Tithe

1. Settlement policy requires 10% of eligible grain harvest contribution.
2. Background farm produces eligible grain.
3. 27G creates in-kind obligation.
4. Real grain transfers to public granary.
5. Treasury/public reserve summary records quantity/value without duplicating stock.

## FIS-007 - Public Payroll Shortfall

1. Guard payroll is due under 27D agreements.
2. 27G payroll appropriation has insufficient available funds.
3. Payment fails/partially pays according to policy.
4. 27G records arrears and reason.
5. 27D/Set 28 may react socially; 27G does not invent morale.

## FIS-008 - Public Procurement Commitment

1. Town accepts road-repair contract under 27E.
2. 27G validates budget and reserves funds.
3. A second contract cannot reserve the same money.
4. Payment occurs only after accepted milestone.

## FIS-009 - Fully Funded but Material-Blocked Project

1. Bridge project has full public appropriation.
2. Required stone is unavailable.
3. Construction remains blocked by 19/20/05.
4. Treasury funding remains committed but does not create stone.

## FIS-010 - Emergency Reserve Draw

1. Raid destroys food stores.
2. Emergency authority permits reserve draw.
3. 27G transfers authorised money to food procurement and/or releases public food stock through logistics.
4. Reserve decreases and history records event.

## FIS-011 - Subsidised Medicine

1. Public policy covers part of eligible medicine purchase.
2. Treasury has budget.
3. Player/NPC pays reduced amount; treasury pays provider difference.
4. Provider receives full authorised price.
5. No invisible price mutation occurs.

## FIS-012 - Public Borrowing

1. City has authorised infrastructure debt limit.
2. 27G authorises borrowing for aqueduct project.
3. 27F creates funded instrument and schedule.
4. 27G records proceeds and future debt-service exposure.

## FIS-013 - Guarantee Call

1. Public authority guarantees part of a strategic workshop loan.
2. Borrower defaults under 27F.
3. Valid guarantee trigger occurs.
4. 27G records treasury payable and pays only up to guarantee limit/funding.

## FIS-014 - Currency Minting

1. Authorised mint receives valid metal input.
2. 27G validates mint authority and policy.
3. 27B/recipe/currency system converts permitted material to coin units.
4. Material input is consumed; currency output is conserved and provenance recorded.

## FIS-015 - Occupation Tribute

1. Faction occupation becomes valid external world state.
2. Tribute policy activates for occupied settlement.
3. Real periodic transfer occurs to occupying treasury.
4. Social/political resistance is handled externally.

## FIS-016 - Distant Fiscal Catch-Up

1. Player leaves town for 40 days.
2. Fiscal LOD processes bounded periods, not every individual purchase.
3. Revenue, payroll, service costs, reserves and debt service reconcile.
4. Returning player sees a readable summary with no ghost wealth.

## FIS-017 - Multiplayer Treasury Permission

1. Player with “view” permission attempts to transfer public funds.
2. Authority check fails.
3. No balance changes.
4. Audit records denied attempt if configured.

## FIS-018 - Tax Refund Adjustment

1. Customs assessment used wrong cargo category due to corrected evidence.
2. Authorised adjustment reduces duty.
3. Refund equals eligible overpayment.
4. Treasury debit and payer credit are committed once.

# 55. Production Scope, Balance and Open Decisions

## 55.1 Recommended Core Production

Core should include:

- one treasury per relevant settlement/public authority;
- General Fund + Emergency/Reserve + project commitments;
- simple market fee/transaction levy capability;
- route toll capability;
- customs/tariff capability for valid borders/ports;
- public rents/fees;
- public payroll funding;
- public procurement funding;
- project/service budgets;
- emergency reserve spending;
- basic subsidies/grants;
- fiscal UI summaries/reason codes;
- distant settlement fiscal aggregation;
- authoritative multiplayer permissions.

## 55.2 Early Access / Mature-System Candidates

- household/enterprise periodic taxes;
- progressive tax bands;
- extraction royalties;
- detailed public-enterprise transfers;
- intergovernmental revenue sharing;
- advanced earmarking;
- public borrowing;
- guarantees/backstops;
- occupation/tribute profiles;
- treaty preference schedules;
- advanced fiscal presets.

## 55.3 Explicitly Deferred Unless Approved

- modern central bank simulation;
- securities markets for public bonds;
- quantitative easing/open-market operations;
- highly detailed tax filing/compliance forms;
- inheritance/estate-tax simulation;
- dozens of overlapping micro-taxes by default;
- actuarial public pension simulation;
- complex sovereign ratings agency mechanics;
- unrestricted money creation;
- detailed real-world accounting standards.

## 55.4 Balance Principles

- Taxes should change decisions, not constantly punish ordinary play.
- Public services should have visible costs and benefits.
- High taxes can fund capability but should not automatically create prosperity.
- Low taxes can encourage private activity but may reduce public capacity.
- Essential public-service failure should create recoverable gameplay before irreversible collapse.
- Small settlements should have simple fiscal systems.
- Mature cities can support deeper budgets without requiring manual management.
- Player wealth should not let them buy impossible resources/capability.
- A ruler should be able to delegate routine fiscal administration.
- Fiscal exploits must be tested against automation, refunds, subsidies, customs and multiplayer transfers.

## 55.5 Open Decisions for Final Integration

1. Exact default market levy/toll/tariff percentages remain balance data, not locked here.
2. Which cultures/governments use household/income/profit/property taxes is content design, not universal law.
3. Whether Core includes public borrowing depends on implementation scope and 27F testing.
4. Exact emergency-spending cap and approval thresholds remain world/government profiles.
5. Whether public currency issuance beyond commodity minting enters launch scope is deferred.
6. Exact tax-evasion/corruption simulation belongs to 27I + Set 28/legal integration.
7. Public insolvency beyond debt restructuring remains a later integration decision.
8. Final world-creation settings for fiscal complexity should be reconciled with the planned world-simulation scalability/settings programme.

# 56. Cross-Set Interface Amendments

The Cross-Set Interface Register remains authoritative. The following additions are proposed for final reconciliation.

## Amendment 27G-A - Set 28 Fiscal Social-Response Interface

**27G -> Set 28:**

- tax burden/change event;
- relief/subsidy/aid event;
- unpaid public wage;
- exemption granted/denied;
- tribute demand/payment;
- public-service funding cut/expansion;
- fiscal transparency/audit evidence;
- treasury crisis/default event.

**Set 28 -> 27G:**

- negotiated exemption/settlement result only after valid authority;
- social compliance/protest/strike outcome as external state;
- trust/reputation/legitimacy modifiers for UI/decision inputs where permitted.

**Ownership transfer:** None. 27G never calculates relationship values or persuasion.

## Amendment 27G-B - Set 29 Public Relief and Survival-Demand Interface

**Set 29 -> 27G:**

- aggregate health/food/exposure crisis severity;
- eligible treatment/supply need;
- workforce incapacity summary;
- emergency survival resource requirement.

**27G -> Set 29:**

- public funding eligibility;
- subsidy/relief amount;
- authorised public stock release request;
- affordability/public payment result.

**Ownership transfer:** None. Funding never directly changes health/needs.

## Amendment 27G-C - Set 30 Terrestrial Toll/Customs Interface

**Set 30 -> 27G:** route/crossing ID, actual passage event, vehicle/mount/cargo class, route service state.  
**27G -> Set 30:** toll/duty/fee assessment, paid/unpaid state, fiscal permit/exemption result and receipt reference.

**Ownership transfer:** None.

## Amendment 27G-D - Set 26 Maritime Public-Finance Interface

**Set 26 -> 27G:** port/jurisdiction arrival, cargo manifest, vessel/service class, customs inspection status, public port-service completion.  
**27G -> Set 26:** tariff/duty/port-charge assessment, payment result, treasury posting reference, subsidy/public-budget support where applicable.

**Ownership transfer:** None.

## Amendment 27G-E - 27F Public Borrowing/Guarantee Interface Confirmation

**27G -> 27F:** authorised borrowing limit/purpose, treasury source, guarantee/backstop/deposit-protection policy.  
**27F -> 27G:** funded debt instrument, debt-service schedule, arrears/default, guarantee call and financial-institution distress exposure.

This confirms Amendment 27F-E without changing ownership.

# Appendix A. Public-Finance Definition and Runtime Templates

## A.1 Public Authority Fiscal Profile

| Field | Description |
| --- | --- |
| fiscal_profile_id | Qualified stable ID. |
| authority_ref | External government/settlement/faction identity. |
| jurisdiction_refs | Territories/routes/ports/institutions covered. |
| capabilities | tax, toll, customs, spend, borrow, guarantee, mint, emergency etc. |
| required_building_capabilities | 20C/20 functional requirements. |
| staff_roles | Required administration roles. |
| default_funds | General/reserve/project etc. |
| delegation | Role limits and approval thresholds. |
| complexity_profile | simplified/standard/advanced. |
| dependencies | Set 25/13/20/27 etc. |

## A.2 Public Treasury Runtime

| Field | Description |
| --- | --- |
| treasury_id | Persistent ID. |
| owner_authority | Public authority. |
| funds | Fund IDs and balances. |
| currency_holdings | Authoritative monetary holdings. |
| restricted_amounts | Legally/policy restricted amounts. |
| commitments | Active reservations. |
| protected_reserves | Emergency/debt/payroll reserves. |
| linked_public_stock | References only; physical stock remains inventory truth. |
| receivables | Assessed unpaid public claims. |
| payables | Authorised unpaid obligations. |
| debt_exposure | 27F references. |
| guarantee_exposure | Contingent claims. |
| history | Revenue/expenditure/audit summaries. |
| last_simulated_time | LOD/catch-up anchor. |

# Appendix B. Tax, Tariff and Charge Templates

## B.1 Tax Policy Definition

| Field | Description |
| --- | --- |
| policy_id | Stable ID. |
| authority_required | Fiscal capability/authority. |
| jurisdiction | Scope rule. |
| tax_family | transaction, wage, enterprise, property, extraction, household, special. |
| taxable_event | Event/period condition. |
| liable_party | Actor category/resolution rule. |
| base | quantity/value/profit/wage/property/etc. |
| valuation | 27B/27D/source method. |
| rate_form | percentage, fixed, banded, per-unit, in-kind, hybrid. |
| thresholds | Exempt/min/max/bands. |
| exemptions | Registered relief rules. |
| payment_forms | Currency/item/service as permitted. |
| cadence | immediate/withheld/periodic. |
| destination_fund | Treasury fund. |
| arrears_profile | Handoff rule. |
| ui | Name, description, examples, reason codes. |

## B.2 Tariff Schedule

| Field | Description |
| --- | --- |
| tariff_id | Stable ID. |
| authority/jurisdiction | Border/port/route/portal scope. |
| direction | import/export/transit. |
| commodity_classes | Eligible tags/categories. |
| origin/destination rules | Region/faction/realm conditions. |
| basis | value/quantity/specific schedule. |
| rate | Charge schedule. |
| exemptions | Treaty, relief, threshold, permit. |
| customs_fee | Optional separate processing charge. |
| destination_fund | Treasury fund. |
| inspection_dependency | External customs execution interface. |

# Appendix C. Treasury, Budget and Fund Templates

## C.1 Public Fund

| Field | Description |
| --- | --- |
| fund_id | Persistent/definition-linked ID. |
| treasury | Parent treasury. |
| category | general, emergency, infrastructure, debt, grant, etc. |
| restrictions | Permitted purposes/payees/categories. |
| balance | Current holdings by currency/value type. |
| protected_floor | Optional reserve floor. |
| commitments | Reserved amount. |
| inflow_rules | Revenue sources/transfer permissions. |
| outflow_rules | Spending authority. |

## C.2 Budget / Appropriation

| Field | Description |
| --- | --- |
| budget_id | Persistent budget ID. |
| authority | Approving body/role. |
| period/project | Time or project scope. |
| fund_source | Funding source. |
| category | Payroll/service/project/debt/etc. |
| ceiling | Maximum authorised spending. |
| committed | Reserved obligations. |
| spent | Settled expenditure. |
| delegation | Who may commit/spend. |
| emergency_rule | Override if any. |
| status | draft/approved/active/frozen/closed. |

# Appendix D. Initial Fiscal Reason-Code Catalogue

| Reason Code | Meaning |
| --- | --- |
| `fiscal.tax.applies` | Active tax policy applies to this event. |
| `fiscal.tax.exempt` | Event/actor is exempt under valid policy. |
| `fiscal.tax.below_threshold` | Base is below assessment threshold. |
| `fiscal.tax.insufficient_payment` | Amount due cannot be fully paid. |
| `fiscal.customs.no_crossing` | No valid customs crossing event exists. |
| `fiscal.customs.treaty_exemption` | Treaty/preference reduces duty. |
| `fiscal.customs.value_adjusted` | Customs valuation differs from declared value. |
| `fiscal.toll.route_not_used` | Charge does not apply because route/service was not used. |
| `fiscal.toll.applies` | Valid passage created toll obligation. |
| `fiscal.treasury.insufficient_available` | Gross funds exist but available funds are insufficient after restrictions/commitments/reserves. |
| `fiscal.treasury.restricted_fund` | Requested purpose is not permitted by fund restriction. |
| `fiscal.budget.no_appropriation` | No valid spending authority exists. |
| `fiscal.budget.limit_exceeded` | Proposed commitment exceeds appropriation ceiling. |
| `fiscal.commitment.duplicate` | Same funds/obligation already reserved. |
| `fiscal.payment.authorised` | Public payment is within authority and funding. |
| `fiscal.payment.failed` | Public payment could not commit. |
| `fiscal.reserve.protected` | Reserve cannot be used for routine expenditure. |
| `fiscal.reserve.emergency_draw` | Valid emergency authority allowed reserve draw. |
| `fiscal.subsidy.ineligible` | Recipient/activity does not meet policy. |
| `fiscal.subsidy.budget_exhausted` | Eligible but programme funding is exhausted. |
| `fiscal.refund.exceeds_paid` | Refund request exceeds eligible prior payment/credit. |
| `fiscal.borrowing.not_authorised` | Public entity lacks borrowing authority/limit. |
| `fiscal.guarantee.limit_exceeded` | Proposed public guarantee exceeds permitted exposure. |
| `fiscal.mint.no_authority` | Currency issuance/minting not authorised. |
| `fiscal.mint.missing_input` | Physical minting lacks required material/capability. |
| `fiscal.public_asset.not_owned` | Authority cannot sell/lease an asset it does not own/control. |
| `fiscal.multiplayer.permission_denied` | Player role cannot perform requested treasury action. |
| `fiscal.lod.reconciled` | Distant fiscal period reconciled successfully. |
| `fiscal.lod.conservation_failure` | Fiscal catch-up failed conservation/invariant checks. |

# Appendix E. Cross-System Interface Matrix

| Provider | 27G Consumes | 27G Exposes |
| --- | --- | --- |
| 13/20C Governance | authority, jurisdiction, law, treaty, legitimacy, occupation | fiscal policy/economic consequence, treasury state |
| 27B | currency, valuation, exchange, confidence interface | issuance/debasement/fiscal signals |
| 27C | committed trade values, market state | taxes/fees/public demand/subsidy signals |
| 27D | wages, households, enterprises, ownership/leases | tax liabilities, public payroll, grants, public-enterprise transfers |
| 27E | contracts, acceptance, procurement evidence | budget authority, public payment, public charges |
| 27F | debt/guarantee instruments and claims | borrowing/guarantee/backstop authority, debt-service funding |
| 19/20 | projects, services, functional buildings, stock needs | budget/funding/commitment, public procurement |
| Set 26 | maritime arrival/cargo/service/customs execution | duties/fees/payment/treasury posting |
| Set 30 | terrestrial passage/route/vehicle class | tolls/customs fiscal state |
| Set 28 | social compliance/negotiated outcomes | fiscal burden/aid/wage/tribute causes |
| Set 29 | survival/health crisis need | public relief funding/stock release authorisation |
| 15 | event/quest state | fiscal crisis/opportunity/history events |
| UI/UX | presentation architecture | fiscal view models/reason codes/history |
| Set 25 | IDs/schemas/relationships/validation | public-finance definitions/runtime evidence |

# Appendix F. 27G Completion Checklist

- [x] Preserved physical-economy conservation.
- [x] Locked hybrid taxation granularity rather than per-NPC tax micromanagement.
- [x] Separated authority, policy, assessment, treasury, budget and physical service state.
- [x] Defined taxes, fees, tolls, tariffs, customs and in-kind contributions.
- [x] Defined treasuries, funds, restrictions, reserves, budgets and commitments.
- [x] Defined public payroll, procurement, capital projects and service funding.
- [x] Defined subsidies, grants, relief and strategic reserves.
- [x] Defined deficit/surplus and recovery options without automatic collapse.
- [x] Preserved 27F ownership of debt mechanics while owning public borrowing authority.
- [x] Defined public guarantees/backstops as real contingent exposure.
- [x] Defined mint/issuance authority boundary with 27B.
- [x] Integrated maritime customs/port public finance with Set 26.
- [x] Defined terrestrial toll/customs interface for Set 30.
- [x] Preserved Set 28 social-response ownership.
- [x] Preserved Set 29 health/survival ownership.
- [x] Added simulation LOD and reconciliation requirements.
- [x] Added multiplayer authority/audit requirements.
- [x] Added Set 25 schema/service/invariant direction.
- [x] Added representative fiscal acceptance scenarios.
- [x] Recorded cross-set interface amendments for final reconciliation.

**Document 27G v0.1 complete.**

**Next Document:** **27H - Trade Routes, Caravans, Regional Exchange and Cross-Realm Commerce**
