# FANTASY VOXEL CIVILISATION SANDBOX

## DOCUMENT SET 27

# 27F - Credit, Debt, Banking, Insurance and Financial Risk

**Version 0.1 - Detailed Design Bible and Technical Foundation Draft**

*A bounded financial-risk framework for loans, receivables, credit lines, deposits, banking capabilities, collateral, guarantees, letters of credit, insurance, claims, insolvency, defaults, liquidity, settlement-scale finance, multiplayer authority, simulation LOD and auditable economic consequence.*

**Working design document - finance, banking, risk transfer and insolvency foundation**

> **Credit, Debt, Banking, Insurance and Financial Risk System Statement**
>
> Leyforge finance must move risk and payment through time without creating free wealth, erasing physical loss or replacing the game's material economy. Credit allows a valid actor to receive value now in exchange for a persistent obligation later. Banking provides capabilities such as secure custody, account transfer, lending, exchange, escrow support and financial intermediation only when a real institution, staff, reserves, permissions and infrastructure can support them. Insurance redistributes defined loss risk in return for consideration; it does not undo a destroyed wagon, resurrect dead livestock, restore spoiled grain or magically refill a burned warehouse. Defaults, insolvency and institutional failure must leave persistent economic history, but the system must remain bounded, readable and configurable so ordinary survival, building and village play never requires the player to become an accountant.

| Field | Locked Direction |
| --- | --- |
| Document Set | This is Document 27F in Document Set 27: Economy, Markets, Contracts, Trade and Public Finance. |
| Document Role | 27F is the universal economic authority for formal credit, debt instruments, lending, interest/finance charges, bank-like financial capabilities, deposits, account transfer, collateral, guarantees, letters of credit, receivables finance, insurance, risk pools, default, restructuring and insolvency. |
| Physical-Economy Rule | Finance may change timing, ownership of claims and distribution of risk. It may not create goods, complete services, teleport cargo or erase physical losses. |
| Monetary Conservation | Loan proceeds must come from an authorised funding source or explicitly authorised monetary-issuance rule. Repayment transfers value; interest and fees are claims against real value, not automatic currency creation. |
| Contract Boundary | 27E owns general contract formation, obligations, deposits, escrow, breach evidence and economic remedies. 27F adds finance-specific instruments and converts valid receivables/claims into debt where permitted. |
| Market Boundary | 27B owns currency/value/price formation. 27C owns market state, merchant stock and purchasing capacity. 27F may provide credit-backed purchasing capacity but does not calculate commodity demand or prices. |
| Enterprise Boundary | 27D owns enterprises, operating accounts, wages, households, ownership rights and business operating distress. 27F owns financing, secured claims, insolvency and creditor treatment. |
| Public-Finance Boundary | 27G owns taxes, treasuries, public budgets, monetary/public issuance policy, public borrowing authority and fiscal policy. 27F defines generic debt instruments that public actors may use when 27G authorises them. |
| Trade-Route Boundary | 27H owns route economics, caravans and land-trade missions. Set 30 owns terrestrial movement. Set 26 owns maritime voyages. 27F consumes route/voyage risk and loss evidence for finance/insurance decisions. |
| Illicit-Finance Boundary | 27I owns black markets, smuggling, illicit trade institutions and intentional circumvention of lawful restrictions. 27F exposes legitimate financial records, suspicious-event hooks and instrument states without defining criminal laundering gameplay. |
| Social Boundary | Set 28 owns trust, persuasion, loyalty, relationship reaction and social forgiveness. 27F may consume bounded trust/reputation signals for credit willingness but never decides social outcomes. |
| Survival Boundary | Set 29 owns injury, illness, death, treatment and survival conditions. 27F can insure or finance resulting economic costs only when an eligible policy/loan exists. |
| Movement Boundary | Set 30 owns mounts, carts, wagons and terrestrial movement. 27F may finance or insure them but cannot determine whether a journey succeeds. |
| Maritime Boundary | Set 26 owns vessels, ports, crews, cargo handling, voyages, piracy and marine loss events. 27F owns generic marine-credit and insurance instruments that consume Set 26 evidence. |
| Banking Direction | A bank is a capability-bearing institution, not a decorative building. Financial services activate only if the owning enterprise/public body, functional building, staff, security, liquidity and permission contracts are valid. |
| Deposit Direction | Deposits are liabilities of the receiving institution unless the product is explicitly segregated custody. A displayed account balance must be backed by an authoritative account record and institution state. |
| Interest Direction | Simple and scheduled interest are supported. Compound interest is optional advanced depth and may be disabled/capped by world settings. Interest cannot accrue past configured bounds without explicit advanced rules. |
| Collateral Direction | Collateral remains a real asset/right with owner, location, condition, existing claims and priority. Pledging an asset does not automatically transfer possession or permit physical seizure. |
| Insurance Direction | Policies specify subject, insurable interest, covered risks, exclusions, valuation basis, premium, deductible/excess, limits, evidence and insurer capacity. Claims pay only from authorised capacity. |
| Insolvency Direction | Insolvency is a structured economic state, not instant deletion. It can trigger payment freezes, restructuring, creditor ranking, liquidation plans, ownership transfer proposals and legal handoffs. |
| Multiplayer Direction | Loans, transfers, collateral pledges, guarantees, claims, insolvency actions and institutional withdrawals are authoritative, permissioned and auditable. |
| Registry Direction | Set 25 owns canonical IDs, schemas, relationship vocabulary, pack ownership, migration and validators. 27F adds finance-specific facets/records through those contracts. |
| Engine Direction | Runtime finance uses deterministic Godot services and persistent records independent from scenes/UI. Summer Engine may assist authoring, scenario generation and validation but cannot silently alter balances, debt or claims. |
| Production Direction | Core Production should support simple loans, receivables, credit limits, secure deposit accounts, account transfers, collateral, basic insurance, claims, default and simple enterprise insolvency. Advanced securities, derivatives, central banking and complex reinsurance are deferred unless explicitly approved. |
| Final Authority | Ash retains final authority over finance depth, compounding, insolvency severity, collateral consequences, insurance availability, public banking and production scope. |
| Next Deliverable | 27G - Taxation, Tariffs, Treasuries and Public Finance. |

# Document Purpose

Document 27F gives Leyforge a financial layer that can support traders, households, workshops, guilds, settlements, merchant fleets and player businesses without breaking the physical-economy rules established earlier in Set 27. Documents 27B and 27C already establish contextual value, currency, market liquidity and merchant purchasing capacity. Document 27D establishes persistent households, enterprises, operating accounts and ownership rights. Document 27E establishes the general lifecycle for obligations, escrow, evidence, breach, claims and receivables. 27F begins where those systems need to move value through time or redistribute risk.

The central design problem is that **credit is useful only if it remains a promise, not a faucet**. A blacksmith may need an iron shipment before the next market day. A caravan company may need working capital to buy cargo. A household may need emergency funds after a fire. A settlement may want a secure depository. A shipowner may want insurance against storm loss. These features deepen the civilisation sandbox only if every amount has a source, every debt has a creditor and debtor, every pledged asset remains traceable, every insurance payout is funded by actual or explicitly authorised institutional capacity, and every failure produces understandable world consequences.

27F therefore models finance as persistent claims and capabilities rather than as an invisible global spreadsheet. A loan is a funded transfer plus a repayment obligation. A bank account is an authoritative ledger relationship with a provider, currency family, owner and access rules. A guarantee is a contingent obligation held by a third party. Insurance is a conditional transfer of economic loss. Insolvency is a state in which obligations cannot be met normally and must be restructured, resolved or legally escalated.

The system deliberately avoids requiring every village to run modern banking. A small frontier settlement may rely on physical coin, barter, personal loans, guild tabs and simple mutual-aid funds. A developed town may support guild deposits, merchant credit and cargo insurance. A wealthy city or magical metropolis may support full ledger accounts, letters of credit, specialised insurers and interregional settlement. This keeps financial depth as progression and civilisation capability rather than an unavoidable starting chore.

# Design Sources, Authority and Supersession

| Source | Relevant Direction | 27F Use |
| --- | --- | --- |
| 00 - Master Game Design Bible | Living civilisations, trade, player freedom and system interconnection. | Finance supports multiple playstyles and visible civilisation growth rather than becoming an isolated minigame. |
| 01 - Core Gameplay Loop | Explore, gather, craft, build, interact, automate, defend, upgrade and expand. | Credit/insurance support expansion, risk management and recovery while physical loops still provide real value. |
| 02 - Player Progression | Trading, leadership and civilisation are legitimate progression paths. | Financial literacy may reveal information/efficiency but does not lock basic borrowing/insurance behind arbitrary level gates. |
| 04-06 - Items, Recipes and Resources | Physical goods, value, quality, spoilage and strategic materials are authoritative elsewhere. | Finance references actual assets and valuation; it never invents their physical state. |
| 07 - NPC Village System | Named NPCs, households, jobs, needs, inventories and persistent consequences. | Households/NPCs can borrow, save or suffer default without 27F owning their identity or daily behaviour. |
| 08 - Automation | Real flows, warehouses, machines and permissions. | Financed assets remain physical systems and loan covenants cannot manufacture throughput. |
| 11-12 - Worldgen and Structures | Settlements, roads, damage, ownership, institutions and physical sites. | Banks/insurers depend on valid activated facilities and world context. |
| 13 - Races, Peoples, Cultures and Factions | Governments, cultures, law and institutions vary by society. | Financial products and norms may vary by culture/faction without ancestry determining creditworthiness. |
| 15 - Quest and Event System | Shortages, crises, contracts, disasters and persistent world history. | Finance reacts to actual events and can create optional quests without quest flags becoming financial truth. |
| 16 - Combat, Gear and Defence | Theft, destruction, injury, raids and persistent loss. | Loss events may create claims or defaults; combat/legal resolution remains external. |
| 17 - UI/UX | Progressive disclosure, reason-first feedback, accessibility and authoritative view models. | Credit cost, claim decisions, collateral and risk must be explainable before commitment. |
| 19 and Set 20 | Settlement growth, public facilities, banks/guild halls/markets, project activation and real staffing. | Financial capability requires functioning institutions rather than visual labels. |
| Set 25 | Qualified IDs, schemas, relationships, content packs, migration and validation. | Governing registry/data contract for all 27F definitions and runtime records. |
| Set 26 | Ports, crews, vessels, cargo, voyages, piracy, naval loss and maritime economy. | Supplies marine risk/loss events; 27F owns generic financing/insurance terms. |
| 27A | Economic ownership, conservation, finance boundaries and high-level risk rules. | Governing finance architecture. |
| 27B | Currency, barter, value, exchange and assessed value. | Supplies currency families, valuation bases and exchange results. |
| 27C | Markets, merchant liquidity, procurement and stock. | Supplies demand/liquidity context and consumes approved merchant credit capacity. |
| 27D | Households, wages, businesses, accounts and ownership rights. | Supplies borrowers, lenders, operating accounts and asset ownership. |
| 27E | Contracts, claims, receivables, escrow, evidence and breach. | Supplies the base obligation lifecycle and unpaid claims that may become financed debt. |
| Sets 27-30 Cross-Set Interface Register v1.0 | Economy/social/survival/movement ownership boundaries. | Adopted in full. New interfaces are recorded in Section 63. |
| 99 - Current Manual Testing Guide | Current Godot build proves persistent transaction histories, households, jobs, inventories and audit-oriented state. | Implementation baseline only; 27F defines future authoritative finance beyond the current POC. |

> **Supersession Rule**
>
> Any earlier rule that allows an account balance to exist without an owner/provider/source, treats a loan as free spawned money, assumes every settlement automatically has banking, lets collateral be seized without external authority, pays insurance without covered loss/evidence/capacity, compounds debt without bounds, or deletes an insolvent enterprise without reconciling assets and claims is superseded by 27F once approved.

# Static Table of Contents

1. Locked Finance Identity  
2. Locked Decision Summary  
3. Scope and Explicit Non-Goals  
4. Canonical Terminology  
5. Source-of-Truth and Ownership Boundaries  
6. Finance Architecture and Record Separation  
7. Financial Actors, Roles and Capacity  
8. Financial Capability Profiles and Institutional Activation  
9. Accounts, Holdings, Custody and Ledger Truth  
10. Deposits, Withdrawals and Segregated Custody  
11. Account Transfers, Clearing and Settlement  
12. Credit Identity and Borrowing Capacity  
13. Loan Formation and Funding  
14. Principal, Finance Charges, Fees and Interest  
15. Interest Models, Compounding and Caps  
16. Repayment Schedules and Amortisation  
17. Early Repayment, Prepayment and Refinancing  
18. Credit Lines, Tabs, Overdrafts and Revolving Facilities  
19. Trade Credit, Merchant Credit and 27C Integration  
20. Working Capital and Enterprise Finance  
21. Receivables, Factoring and Invoice Finance  
22. Asset Finance, Hire Purchase and Conditional Ownership  
23. Collateral, Security Interests and Pledges  
24. Collateral Valuation, Haircuts and Condition Changes  
25. Multiple Claims, Priority and Encumbrances  
26. Guarantees, Sureties and Third-Party Support  
27. Letters of Credit and Documented Trade Finance  
28. Savings Products and Interest-Bearing Deposits  
29. Bank Balance Sheet, Liquidity and Reserve Capacity  
30. Lending Capacity, Concentration and Institutional Risk  
31. Withdrawals, Liquidity Stress and Bank Runs  
32. Financial-Institution Distress, Failure and Resolution  
33. Currency Exchange and 27B Boundary  
34. Insurance Identity and Insurable Interest  
35. Policy Formation, Premiums and Coverage Periods  
36. Covered Risks, Exclusions and Conditions  
37. Deductibles, Limits, Coinsurance and Underinsurance  
38. Claims, Evidence, Adjustment and Settlement  
39. Claim Denial, Partial Settlement, Dispute and Appeal  
40. Insurer Reserves, Capacity and Risk Pools  
41. Reinsurance and Catastrophe Capacity - Advanced  
42. Property, Inventory and Equipment Insurance  
43. Cargo, Caravan and Route Insurance  
44. Maritime Insurance and Set 26 Integration  
45. Business Interruption and Loss-of-Income Cover  
46. Health, Injury and Worker-Cost Insurance Boundaries  
47. Credit Insurance, Guarantees and Contract-Risk Cover  
48. Fraud, Moral Hazard and Adverse-Incentive Controls  
49. Financial Risk Profiles, Creditworthiness and Explainability  
50. Default, Delinquency and Arrears  
51. Restructuring, Forbearance and Renegotiation  
52. Insolvency Entry and Financial Distress  
53. Insolvency Stay, Claim Freeze and Business Continuity  
54. Creditor Ranking, Secured and Unsecured Claims  
55. Restructuring Plans, Liquidation and Exit  
56. Household Debt and Personal Insolvency Boundary  
57. Legal Enforcement, Seizure and Governance Boundary  
58. Public Finance, Sovereign/Public Borrowing and 27G Boundary  
59. Restricted Finance, Black Markets and 27I Boundary  
60. Simulation LOD, Distant Finance and Reconciliation  
61. Multiplayer Authority, Permissions and Auditability  
62. UI/UX, Difficulty, Accessibility and Player Trust  
63. Set 25 Schemas, Godot Services and Validation  
64. Representative Acceptance Scenarios  
65. Production Scope, Balance and Open Decisions  
66. Cross-Set Interface Amendments  
Appendix A. Finance Definition and Runtime Record Templates  
Appendix B. Loan, Credit and Collateral Templates  
Appendix C. Banking and Institution Templates  
Appendix D. Insurance Policy and Claim Templates  
Appendix E. Insolvency and Creditor Templates  
Appendix F. Reason-Code Catalogue  
Appendix G. Cross-System Responsibility Matrix  
Appendix H. 27F Completion Checklist

# 1. Locked Finance Identity

Finance is the economic-time-and-risk layer of Leyforge. It lets value be advanced, delayed, pooled, guaranteed or conditionally redistributed without changing who owns the underlying physical systems.

> **Locked Rule**
>
> Every financial asset is somebody else's valid liability, claim, custody relationship or authorised institutional obligation unless it is direct ownership of an already-existing physical/currency asset. Finance may transform timing and risk; it may not duplicate the economic world.

## 1.1 Player-Facing Promise

A player should be able to understand:

- why a lender approved or rejected a loan;
- how much will be repaid and when;
- whether an interest rate is fixed, variable or capped;
- what property is pledged and what that actually means;
- why a merchant can buy more stock using working capital;
- why a bank is refusing a large withdrawal during a liquidity crisis;
- what an insurance policy actually covers before the player pays for it;
- why a storm-damaged caravan created a partial claim rather than a full payout;
- why a profitable business can still become insolvent if it cannot meet payments;
- why secured creditors have different claims from ordinary suppliers;
- how a default changed future credit availability without automatically making every NPC hate the player.

## 1.2 Identity Layers

| Layer | Meaning | Player Result |
| --- | --- | --- |
| Credit | Permission/capacity to receive funded value now against future obligation. | Expansion can happen before all cash is accumulated. |
| Debt | Persistent owed value with terms and history. | Obligations survive sessions and world distance. |
| Banking | Institutional custody, transfer and intermediation capabilities. | Developed settlements gain safer and more scalable commerce. |
| Security | Claims against specific assets/rights under defined priority. | Collateral changes risk without erasing ownership. |
| Guarantee | Third party assumes contingent payment responsibility. | Trust networks and institutions can support otherwise risky trade. |
| Insurance | Defined losses are redistributed according to policy terms. | Players can manage catastrophic risk without making danger meaningless. |
| Insolvency | Actor cannot meet obligations normally. | Failure creates restructuring/history rather than silent deletion. |
| Financial Risk | Liquidity, credit, concentration and catastrophe exposure become visible state. | Advanced economic play rewards preparation and diversification. |

# 2. Locked Decision Summary

| Area | Locked Decision |
| --- | --- |
| Default Availability | Finance is capability-gated by settlement/institution development. Small settlements can use personal credit and simple mutual funds without full banks. |
| Loan Funding | Loan proceeds must debit lender funds/capacity or use an explicitly authorised issuance source. No untracked money creation. |
| Default Interest | Simple scheduled interest is the standard baseline. Compound interest is optional advanced depth and bounded. |
| Interest Frequency | Accrual uses discrete schedule ticks, not per-frame simulation. Daily or per-payment-period granularity is sufficient. |
| Negative Interest | Supported by schema but not required for Core Production. |
| Credit Scores | No opaque universal real-world-style score. Use explainable risk factors and lender-specific policy bands. |
| Reputation | Commercial repayment history can be an input, but Set 28 owns social trust/relationships. |
| Collateral | Ownership remains with pledgor until an external authorised transfer occurs. Security claims are separate records. |
| Multiple Liens | Supported with explicit priority and encumbrance validation. Core may limit complexity to one primary secured claim per asset family. |
| Guarantees | Supported. Guarantor liability activates only under declared trigger/evidence. |
| Bank Deposits | Default bank deposits are institutional liabilities to depositors; segregated custody products may remain directly reserved. |
| Fractional Intermediation | Supported abstractly through lending/liquidity capacity, but not required to simulate real-world reserve ratios or money multipliers. |
| Bank Failure | Possible in advanced settings; must reconcile deposits, claims and resolution rather than deleting balances. |
| Insurance | Policies require insurable interest, defined covered subject, risk list, exclusions, premiums and funded capacity. |
| Insurance Payout | Cannot exceed policy limits/covered loss basis and cannot create value beyond authorised insurer/public capacity. |
| Reinsurance | Advanced optional capability for large insurers/cities; not Core-required. |
| Claim Fraud | Fraud hooks supported; 27I/governance systems own criminal/legal consequences. |
| Default | Missed payment produces arrears/default state, not instant asset loss. Cure/restructure paths precede severe consequences where policy allows. |
| Insolvency | Separate from simple lateness. Uses inability-to-pay/overdue/material-liability conditions and actor type. |
| Household Bankruptcy | Supported as optional world/legal setting; default Core focus is enterprise insolvency and negotiated household debt relief. |
| Public Borrowing | Generic debt instrument supported; 27G decides whether and how public authorities may borrow. |
| Financial Complexity | Core remains readable. Advanced derivatives, securities markets, speculative leverage and central-bank simulation are deferred. |

# 3. Scope and Explicit Non-Goals

27F owns formal finance after an economic relationship becomes more than immediate payment or an ordinary unpaid claim.

## 3.1 In Scope

- loan agreements and funded advances;
- debts created from loans or converted receivables;
- interest/finance charges and schedules;
- credit limits, tabs and overdrafts;
- working-capital facilities;
- receivables/invoice finance;
- asset finance;
- deposits and financial accounts;
- transfers between financial accounts;
- collateral and security interests;
- guarantees/sureties;
- letters of credit;
- bank/institution liquidity and lending capacity;
- insurance policies, premiums and claims;
- risk pools and insurer capacity;
- default, restructuring and insolvency;
- financial risk/exposure summaries;
- multiplayer permissions and audit records;
- distant-simulation summaries;
- registry schemas and validators.

## 3.2 Explicit Non-Goals

27F does **not** own:

- commodity price formation - 27B/27C;
- general contract formation/evidence - 27E;
- wages/business operations/ownership - 27D;
- tax rates, budgets and treasury policy - 27G;
- route movement and caravan execution - 27H/Set 30;
- black-market/illicit institution design - 27I;
- social forgiveness, affection, intimidation or dialogue - Set 28;
- injuries/medical treatment - Set 29;
- seizure, arrest, court judgments or violent repossession - governance/combat/crime systems;
- vessel physics or maritime incidents - Set 26;
- securities exchanges, derivatives, options/futures, hedge funds, high-frequency speculation or central-bank macroeconomics in Core Production.

# 4. Canonical Terminology

| Term | Meaning |
| --- | --- |
| Principal | Funded amount/value advanced and still outstanding, excluding separate charges. |
| Interest | Time/risk-based finance charge calculated from an agreed base and schedule. |
| Fee | Declared non-interest financial charge for origination, service, transfer, custody or another capability. |
| Debt | Persistent obligation to transfer value later under finance terms. |
| Creditor | Actor entitled to receive repayment/performance under a debt. |
| Debtor | Actor obligated to repay. |
| Lender | Actor that funds a loan/credit advance. |
| Borrower | Actor receiving funded credit. |
| Credit Limit | Maximum authorised outstanding exposure under a facility. |
| Available Credit | Limit minus committed/outstanding exposure and relevant holds. |
| Arrears | Past-due amount not yet resolved. |
| Delinquency | State where scheduled payment obligations are overdue. |
| Default | Declared finance state after configured trigger, cure rules and evidence. |
| Collateral | Asset/right pledged to secure performance. |
| Security Interest | Creditor's financial claim against pledged collateral. |
| Encumbrance | Existing claim/restriction affecting an asset/right. |
| Guarantee | Third-party contingent promise to satisfy defined debt/performance after trigger. |
| Deposit | Value placed with an institution under a deposit/custody product. |
| Custody | Holding/administration of assets without beneficial ownership necessarily transferring. |
| Liquidity | Ability to meet near-term authorised withdrawals/payments. |
| Solvency | Ability to meet obligations under the applicable financial test over time. |
| Insurance Policy | Contract transferring defined economic loss risk subject to terms. |
| Premium | Consideration paid for insurance coverage. |
| Deductible/Excess | Covered loss portion retained by insured before payout. |
| Policy Limit | Maximum insurer obligation under declared scope. |
| Claim | Request for policy performance based on a covered loss event. |
| Insurable Interest | Valid economic exposure to the covered subject/loss. |
| Insolvency | Financial state requiring extraordinary resolution because obligations cannot be met normally. |
| Restructuring | Agreed/legal modification of debts to restore viable payment. |
| Liquidation | Orderly conversion/transfer of eligible assets to resolve claims and close an insolvent economic actor where permitted. |

# 5. Source-of-Truth and Ownership Boundaries

The finance service never becomes the owner of the physical asset it references merely because that asset is financed or insured.

| Question | Owner | 27F Consumption |
| --- | --- | --- |
| What item/block/vessel exists and its condition? | Item/structure/Set 26 systems | asset reference, condition event |
| Who owns/controls the asset? | 27D + domain owner | current owner/right state |
| What is it worth now? | 27B + market evidence | assessed value with timestamp/confidence |
| What contract created the obligation? | 27E | contract/claim reference |
| Does a bank building function? | Set 20 + 27D enterprise | capability activation |
| Is payment social forgiveness appropriate? | Set 28 | bounded negotiation outcome only |
| Is borrower injured/unavailable? | Set 29 | capacity/force-majeure input |
| Did caravan/vessel arrive or get destroyed? | 27H/Set 30/Set 26 | authoritative event/evidence |
| Can guards seize collateral? | law/combat/governance | legal enforcement result |
| How are taxes/public budgets handled? | 27G | tax/treasury payable or public authority input |

# 6. Finance Architecture and Record Separation

27F uses definitions, persistent instruments, accounts, events and derived views.

| Record Family | Purpose | Authority |
| --- | --- | --- |
| FinancialCapabilityDefinition | Defines what a provider can offer. | Versioned definition. |
| FinancialInstitutionInstance | Provider enterprise/public body, sites, staff, liquidity and policy. | Persistent runtime. |
| FinancialAccount | Owner/provider/currency/balance/holds/permissions/history. | Persistent runtime. |
| DepositProductDefinition | Custody/deposit terms, withdrawal rules, interest/fees. | Versioned definition. |
| CreditFacilityDefinition | Reusable loan/line/overdraft rules. | Versioned definition. |
| CreditFacilityInstance | Lender, borrower, limit, pricing, security, status. | Persistent runtime. |
| DebtInstrument | Principal, charges, schedule, creditor, debtor, status and history. | Persistent runtime. |
| SecurityInterest | Collateral reference, secured amount, priority, status. | Persistent runtime. |
| GuaranteeRecord | Guarantor, beneficiary, trigger, cap and status. | Persistent runtime. |
| InsurancePolicy | Insured, insurer, subject, coverage, premium, limits, period. | Persistent runtime. |
| InsuranceClaim | Loss event, evidence, assessed covered loss, decision and payout. | Persistent runtime. |
| InsolvencyCase | Debtor, trigger, claims, stay, plan, resolution and history. | Persistent runtime. |
| FinancialRiskSnapshot | Derived exposures/ratios/risk bands and reasons. | Derived/cache. |
| FinanceEvent | Immutable fact after successful authoritative change. | Immutable history. |

## 6.1 Core Mutation Order

1. Validate actor, authority, provider capability and instrument state.  
2. Validate funding/liquidity/collateral/coverage prerequisites.  
3. Reserve or debit any required real value.  
4. Apply authoritative financial mutation.  
5. Post corresponding account/debt/policy state.  
6. Emit immutable event.  
7. Update derived risk and UI views.  
8. Notify dependent systems by stable references.

A failed mutation changes no authoritative balance.

# 7. Financial Actors, Roles and Capacity

Financial actors may be players, NPCs, households, enterprises, guilds, settlements, factions or public institutions when their owning systems grant legal/economic capacity.

## 7.1 Roles

- depositor;
- account holder;
- authorised signer;
- lender;
- borrower;
- creditor;
- debtor;
- pledgor;
- secured creditor;
- guarantor;
- beneficiary;
- insurer;
- insured;
- policy beneficiary;
- claims adjuster/service role;
- insolvency administrator where enabled;
- public guarantor/backstop where 27G authorises.

Capacity is role- and permission-specific. Owning a company does not automatically give every multiplayer member permission to borrow against it.

# 8. Financial Capability Profiles and Institutional Activation

A bank, guild house, moneychanger or insurer is not a single hard-coded class. It resolves a set of capabilities.

| Capability | Requirements | Example |
| --- | --- | --- |
| Deposit Custody | secure storage/ledger, authorised staff, accounting | guild vault |
| Account Transfer | ledger connectivity, settlement process | city bank |
| Lending | funding capacity, credit policy, account service | merchant bank |
| Secured Lending | asset registry/rights checks | craft guild lender |
| Currency Exchange | 27B exchange capability/liquidity | moneychanger |
| Escrow Support | 27E integration, segregated holds | trade house |
| Letter of Credit | verified counterparties, settlement channels | regional merchant bank |
| Insurance Underwriting | risk pool/reserves, policy registry | caravan mutual |
| Claims Adjustment | evidence access and policy authority | insurer office |
| Insolvency Administration | lawful/authorised case role | court-appointed guild officer |

If the required building loses security, staff or authority, capabilities may become **degraded**, **suspended** or **unavailable** without destroying existing account/debt records.

# 9. Accounts, Holdings, Custody and Ledger Truth

Financial accounts are relationships between an owner and provider. They are not free-floating universal wallets.

Minimum fields:

- account_id;
- owner/beneficial owner;
- provider;
- currency family;
- product type;
- available balance;
- held/reserved balance;
- pending settlements;
- overdraft/credit reference if enabled;
- permissions/signers;
- withdrawal rules;
- interest/fee rules;
- status;
- transaction history;
- migration/version.

## 9.1 Balance Invariant

`available + held + pending_outgoing - pending_incoming` must reconcile to the authoritative provider/account ledger according to the product's settlement rules.

No UI panel may invent spendable balance from an expected transfer.

# 10. Deposits, Withdrawals and Segregated Custody

27F distinguishes two major products.

### Depository Liability

The institution owes the depositor the account balance. The institution may use pooled funding if its product/policy permits. Liquidity risk exists.

### Segregated Custody

Specific funds/assets remain reserved/segregated for the owner. They cannot be lent or used by the provider unless explicitly authorised. This is safer but may cost more and provide less return.

Withdrawals validate:

- account status;
- signer permission;
- available balance;
- provider liquidity/custody availability;
- withdrawal limits;
- destination capacity;
- security/legal holds supplied externally.

# 11. Account Transfers, Clearing and Settlement

Transfers can be immediate inside one provider or require clearing between providers/regions.

| Transfer Type | Default Behaviour |
| --- | --- |
| Same-account provider | Atomic debit/credit. |
| Same settlement network | Short pending state then final settlement. |
| Interregional | May require courier, magical ledger network or correspondent capability. |
| Cross-currency | Uses 27B exchange quote plus transfer service. |
| Cross-realm | Requires valid dimensional financial/communication infrastructure. |

Pending transfers are not spendable at both ends. Failure must reverse holds without duplication.

# 12. Credit Identity and Borrowing Capacity

Credit is not a universal number attached to an actor. Every lender decides willingness under a policy using explainable factors.

Potential factors:

- verified income/cashflow;
- existing obligations;
- available reserves;
- asset/security quality;
- repayment history known to lender;
- contract history from 27E;
- business continuity;
- market/route concentration;
- social/reputation signal supplied by Set 28 when legitimately known;
- public/faction guarantees;
- world risk and recent losses;
- requested term and purpose.

The UI should expose a reason band such as **Strong**, **Acceptable**, **High Risk**, **Insufficient Evidence** or **Declined**, followed by actual causes. No hidden score should punish the player without explanation.

# 13. Loan Formation and Funding

A loan requires:

1. valid lender/borrower capacity;
2. approved terms;
3. funding source;
4. currency/value definition;
5. disbursement destination;
6. repayment schedule;
7. finance-charge method;
8. security/guarantee if any;
9. default/cure rules;
10. authority and signatures through 27E-compatible formation;
11. immutable activation event.

Loan activation is atomic: either the funded amount is transferred and debt created together, or neither occurs.

# 14. Principal, Finance Charges, Fees and Interest

The debt balance separates categories so players can understand what they owe.

| Component | Treatment |
| --- | --- |
| Principal | Funded value outstanding. |
| Accrued Interest | Time-based finance charge under agreed model. |
| Fixed Fee | Declared service/origination cost. |
| Usage Fee | Charge linked to draw/transfer/capability. |
| Late Fee | Bounded charge after defined lateness; not automatic compounding. |
| Legal/Recovery Cost | Only when external authority/policy validly posts it. |
| Credits/Refunds | Reduce valid components with provenance. |

Fees may not be disguised infinite interest. The player-facing summary shows total scheduled cost before acceptance where determinable.

# 15. Interest Models, Compounding and Caps

## 15.1 Supported Models

- zero-interest loan;
- simple fixed-rate interest;
- declining-principal simple interest;
- fixed instalment schedule;
- variable rate linked to declared benchmark/policy;
- capped variable rate;
- compound interest - advanced optional;
- profit/revenue share financing - advanced, if treated as a finance instrument rather than 27D ownership share.

## 15.2 Default Recommendation

Core Production uses **simple interest on outstanding principal** with discrete daily or payment-period accrual. This is transparent, easy to simulate at distance and resistant to runaway debt.

Compound interest, if enabled, must have:

- explicit compounding interval;
- clear disclosure;
- configurable maximum effective rate;
- world-setting toggle;
- arrears cap or conversion rule;
- no per-frame accumulation.

# 16. Repayment Schedules and Amortisation

Supported schedules include:

- single maturity payment;
- equal principal instalments;
- fixed total instalments;
- interest-only then principal;
- seasonal/harvest schedule;
- contract-linked repayment;
- revenue-share repayment;
- flexible credit-line minimum payment.

Each scheduled payment is an obligation with due time, grace period, paid amount, source account and status.

## 16.1 Payment Allocation

Default ordering:

1. authorised fees currently due;
2. accrued interest currently due;
3. principal;
4. future/prepaid amount if product allows.

World settings or product definitions may change order, but it must be disclosed.

# 17. Early Repayment, Prepayment and Refinancing

Early repayment is allowed by default unless a specialised product declares a bounded prepayment condition.

Refinancing creates a new or amended facility that:

- pays/settles the old debt from real funding;
- closes or reduces the old instrument;
- transfers/recreates security interests deliberately;
- records fees and new schedule;
- preserves full history.

Refinancing never silently resets default history or duplicates collateral.

# 18. Credit Lines, Tabs, Overdrafts and Revolving Facilities

A revolving facility has:

- authorised limit;
- current drawn amount;
- reserved amount;
- available credit;
- draw conditions;
- repayment minimums;
- pricing/fees;
- expiration/review date;
- security/guarantee;
- suspension conditions.

Merchant tabs can be simplified facilities between known actors. They remain debts, not invisible reputation points.

# 19. Trade Credit, Merchant Credit and 27C Integration

27C may ask 27F for **approved purchasing capacity** when a merchant lacks immediate liquid funds but has a valid credit facility.

27F returns:

- approved draw amount;
- currency;
- provider;
- expiration/conditions;
- resulting debt reference.

27C then performs the market purchase using normal stock/payment transactions. If the purchase fails, unused credit reservation releases. 27F does not create commodity stock or demand.

# 20. Working Capital and Enterprise Finance

Enterprises may finance:

- payroll timing gaps;
- raw-material purchases;
- seasonal stock;
- contract mobilization;
- equipment repair;
- caravan loading;
- emergency recovery.

Working-capital limits should derive from expected operating cashflow, contract evidence, stock/assets and risk rather than from enterprise level alone.

A profitable enterprise can still experience liquidity stress if cash arrives after wages, rent or supplier payments are due.

# 21. Receivables, Factoring and Invoice Finance

A valid 27E receivable may be financed if assignment is allowed.

### Factoring Flow

1. 27E confirms receivable identity, amount, debtor, due date and dispute state.  
2. Financier values expected recovery and risk.  
3. Financier pays seller a discounted amount from real funds.  
4. Receivable ownership/collection right changes according to permitted assignment.  
5. Debtor's total obligation does not increase merely because the claim was sold.  
6. Final payment closes the receivable and financier's exposure.

Disputed/conditional receivables may be ineligible or heavily discounted.

# 22. Asset Finance, Hire Purchase and Conditional Ownership

Asset finance supports expensive tools, wagons, machines and similar capital goods.

Possible structures:

- secured purchase loan;
- instalment sale;
- hire purchase/conditional transfer;
- lease-to-own interface with 27D/27E.

Physical possession, legal/economic ownership and security interest remain separate. The item/vehicle system owns the actual asset instance.

# 23. Collateral, Security Interests and Pledges

Collateral reduces creditor risk by creating a financial claim against an asset/right.

Requirements:

- valid asset/right reference;
- pledgor has authority to pledge;
- asset is eligible;
- existing encumbrances known;
- secured amount/cap;
- priority rule;
- condition/value basis;
- release conditions;
- enforcement owner;
- history.

> **No Automatic Seizure Rule**
>
> Default does not instantly teleport collateral to the lender. 27F may mark the security enforceable and request a lawful/contractual transfer. Physical repossession, seizure or contested access is resolved by the owning legal/world systems.

# 24. Collateral Valuation, Haircuts and Condition Changes

Collateral valuation uses 27B assessed value plus risk reduction.

**Eligible Secured Value = Assessed Value x Liquidity Factor x Condition Factor x Volatility Factor x Legal/Access Factor**

This is a finance-risk estimate, not a guaranteed sale price.

If collateral is damaged, destroyed, sold, moved, enchanted, depleted or becomes inaccessible:

- 27F receives the authoritative event;
- secured value updates;
- lender may request additional collateral or reduce available credit if terms permit;
- existing debt does not vanish;
- insurance may offset covered loss separately.

# 25. Multiple Claims, Priority and Encumbrances

An asset can support more than one claim only when the product/rules allow it.

Priority sources may include:

- explicit first/second security rank;
- date/order of perfected claim where legal system supports it;
- public/legal priority from 27G/governance;
- purchase-money/security-specific rules if enabled;
- consensual inter-creditor agreement.

Core Production may simplify to **one primary secured claim plus disclosed subordinate claims**. Advanced priority systems remain optional.

# 26. Guarantees, Sureties and Third-Party Support

A guarantee is a contingent finance obligation.

Minimum terms:

- guaranteed debt/contract;
- guarantor;
- beneficiary;
- trigger;
- maximum liability;
- expiration;
- evidence requirements;
- recourse against principal debtor if applicable;
- security supporting the guarantee if any.

A guarantor must have capacity. A guarantee cannot be infinite merely because the guarantor is wealthy or public.

# 27. Letters of Credit and Documented Trade Finance

Letters of credit support long-distance trade where buyer and seller do not fully trust one another.

Typical flow:

1. buyer obtains approved credit/funds from issuing institution;
2. institution creates a bounded payment undertaking;
3. seller ships under a 27E/27H/Set 26 contract;
4. required evidence is presented;
5. institution pays if conditions are satisfied;
6. buyer owes the issuing institution according to facility terms.

27F verifies documentary/evidence conditions but does not decide whether cargo physically moved.

# 28. Savings Products and Interest-Bearing Deposits

Financial institutions may offer:

- demand deposits;
- notice deposits;
- fixed-term deposits;
- guild savings pools;
- magical escrow/custody vaults;
- profit-sharing cooperative deposits where culture permits.

Interest-bearing deposits create an institution liability expense and require provider capacity. Interest cannot be credited without posting the corresponding institutional obligation/cost.

# 29. Bank Balance Sheet, Liquidity and Reserve Capacity

Leyforge does not need full real-world bank accounting, but providers require enough state to prevent impossible withdrawals and infinite lending.

Minimum institutional summary:

- liquid funds by currency;
- segregated custody/reserves;
- deposit liabilities;
- loan assets/outstanding principal;
- expected repayments;
- insurance reserves if combined institution;
- guarantees/contingent exposure;
- delinquent/defaulted assets;
- capital/resilience buffer abstraction;
- concentration exposures;
- restricted/public backstop references.

## 29.1 Lending Capacity

A provider cannot approve new loans if doing so violates its configured liquidity/risk policy. Exact ratios are balance settings, not hard-coded universal economics.

# 30. Lending Capacity, Concentration and Institutional Risk

Risk concentration matters when one institution is exposed to the same mine, route, faction, currency or disaster.

Examples:

- too many loans secured by one volatile metal;
- most merchant credit depends on one caravan road;
- insurer covers nearly every warehouse in one floodplain;
- lender has heavy exposure to one faction at war;
- bank holds liabilities in a currency losing confidence.

The system uses concentration bands rather than complex portfolio mathematics in Core.

# 31. Withdrawals, Liquidity Stress and Bank Runs

If many depositors withdraw at once, a provider may enter:

- Normal;
- Tight Liquidity;
- Withdrawal Delays;
- Restricted Withdrawals;
- Emergency Funding;
- Suspended Payments;
- Resolution.

Restrictions must be visible and reasoned. The game should avoid arbitrary theft of player balances. World/difficulty settings can disable severe institutional failure for relaxed play.

# 32. Financial-Institution Distress, Failure and Resolution

Institution failure is distinct from an ordinary enterprise closing.

Possible resolution tools:

- owner recapitalisation;
- emergency loan;
- asset sale;
- merger/transfer to another provider;
- temporary withdrawal limits;
- public backstop if 27G authorises;
- depositor loss allocation in harsh/advanced settings;
- orderly wind-down and claim registration.

Existing accounts/debts remain records through resolution. A bank building being destroyed does not automatically erase financial records if alternative record/custody infrastructure survives.

# 33. Currency Exchange and 27B Boundary

27B owns:

- currency families;
- denomination/value;
- exchange quotes;
- currency confidence;
- assessed value.

27F owns only finance-side usage:

- bank exchange service capability;
- settlement account conversion;
- FX exposure on loans/insurance;
- collateral valuation currency;
- cross-currency repayment obligations.

An exchange-rate movement can affect debt burden but 27F does not calculate the rate.

# 34. Insurance Identity and Insurable Interest

Insurance exists to redistribute defined economic loss, not to create profit from destruction.

An insured must have a legitimate economic interest in the subject at relevant time. Examples:

- owner of a wagon;
- enterprise owning cargo;
- lender with secured interest;
- household responsible for a home;
- employer bearing covered worker-cost obligations;
- contract party carrying declared risk of loss.

A player cannot insure a stranger's warehouse and profit by burning it.

# 35. Policy Formation, Premiums and Coverage Periods

A policy requires:

- insurer;
- insured/beneficiary;
- covered subject or exposure;
- valuation basis;
- covered risks;
- exclusions;
- coverage start/end;
- premium amount/form;
- payment cadence;
- deductible/excess;
- limits/sub-limits;
- conditions/warranties;
- claim evidence requirements;
- cancellation/non-renewal rules;
- insurer capacity reservation.

Premium payment is a real transaction. Non-payment may suspend or cancel coverage according to disclosed grace rules.

# 36. Covered Risks, Exclusions and Conditions

Potential covered risk tags include:

- fire;
- theft;
- raid damage;
- storm;
- flood;
- caravan loss;
- vessel loss;
- cargo spoilage under specified causes;
- creature attack;
- magical accident;
- portal loss;
- business interruption;
- credit default;
- worker injury cost where enabled.

Exclusions may include intentional destruction by insured, undeclared forbidden cargo, ordinary wear, known pre-existing damage, war/catastrophe classes unless specifically included, or losses outside declared route/period.

# 37. Deductibles, Limits, Coinsurance and Underinsurance

Insurance should not make preparation irrelevant.

Supported controls:

- fixed deductible/excess;
- percentage deductible;
- per-event limit;
- aggregate policy limit;
- sub-limit by risk/cargo;
- underinsurance proportional payout;
- coinsurance/shared-loss percentage;
- salvage/recovery offset.

The final payout is bounded by actual covered economic loss, policy terms and insurer capacity/backstop.

# 38. Claims, Evidence, Adjustment and Settlement

Claim lifecycle:

1. loss event occurs in authoritative world system;
2. insured submits claim/reference;
3. policy/coverage state is validated;
4. evidence is gathered from 27E, item/structure, Set 26/30, combat/event records;
5. covered loss is assessed using 27B value basis and policy terms;
6. deductible/limits/exclusions apply;
7. fraud/conflict flags may request further review;
8. insurer approves, partially approves, rejects or disputes;
9. payout/reserve transaction occurs atomically;
10. claim closes with reason and history.

No evidence is fabricated merely because the player says the cargo vanished.

# 39. Claim Denial, Partial Settlement, Dispute and Appeal

Every negative claim decision requires one or more reason codes such as:

- policy inactive;
- premium unpaid beyond grace;
- subject not covered;
- risk excluded;
- event outside coverage period;
- insufficient evidence;
- loss below deductible;
- value above policy limit;
- duplicate claim;
- intentional loss suspected;
- ownership/insurable interest invalid;
- external dispute pending.

Disputes use 27E evidence and governance/legal systems where applicable. Set 28 handles social persuasion; it cannot rewrite policy facts.

# 40. Insurer Reserves, Capacity and Risk Pools

Insurers must have bounded capacity.

Capacity may come from:

- pooled premiums/reserves;
- enterprise capital;
- mutual-association member contributions;
- public guarantee authorised by 27G;
- reinsurance;
- magical/faction institutional reserve if explicitly modelled.

Policies consume exposure capacity even before claims occur. One small insurer cannot safely underwrite every city warehouse unless backed by a larger pool.

# 41. Reinsurance and Catastrophe Capacity - Advanced

Reinsurance is optional advanced depth. It lets one insurer transfer part of its portfolio risk to another provider.

Core needs only:

- ceded risk fraction/cap;
- covered catastrophe classes;
- premium/contribution;
- trigger;
- recoverable amount;
- provider capacity.

No complex treaty accounting is required unless later approved.

# 42. Property, Inventory and Equipment Insurance

Property policies can cover:

- buildings/structure instances;
- machines;
- tools/equipment;
- stored inventory;
- livestock where content supports it;
- magical infrastructure.

Condition and valuation are snapshot-based. A damaged building cannot be insured at full undamaged value without disclosure/accepted underwriting.

# 43. Cargo, Caravan and Route Insurance

27F covers economic loss terms; 27H/Set 30 owns the journey.

Policy inputs may include:

- cargo manifest/value;
- origin/destination;
- route class;
- expected duration;
- vehicle/mount profile;
- escort/security profile;
- weather/event risk;
- declared dangerous/forbidden cargo;
- deductible/limit.

If route risk changes after policy formation, coverage changes only if the policy explicitly contains an adjustment/cancellation clause.

# 44. Maritime Insurance and Set 26 Integration

Set 26 supplies:

- vessel identity/condition;
- voyage plan/status;
- cargo manifest;
- crew state;
- weather/sea incidents;
- piracy/combat loss;
- port departure/arrival evidence;
- salvage/recovery.

27F supplies:

- hull/cargo/liability-style economic policy terms;
- premium and coverage;
- insured value basis;
- claim decision;
- payout/reserve posting;
- lender security/insurance requirements.

27F never decides buoyancy, storm damage, boarding or sinking.

# 45. Business Interruption and Loss-of-Income Cover

Business-interruption insurance covers declared lost operating income/continuing costs after a covered physical event. It does not guarantee expected speculative profit.

Assessment may use:

- historical revenue/cost data from 27D;
- active contracts from 27E;
- expected downtime from owning structure/repair system;
- policy waiting period;
- coverage cap;
- mitigation/reopening actions.

# 46. Health, Injury and Worker-Cost Insurance Boundaries

Set 29 owns actual health, injury, treatment, recovery and death.

27F may define financial cover for:

- treatment cost;
- wage-continuation obligation;
- employer liability/cost;
- death benefit where culturally/legal appropriate;
- expedition medical cover.

Eligibility never changes the health outcome. It only changes who bears declared economic cost.

# 47. Credit Insurance, Guarantees and Contract-Risk Cover

Credit insurance can cover a creditor against specified debtor default. Contract-risk cover can protect against a narrow insured event but must not replace 27E performance evidence.

Coverage must avoid circular risk loops where the same institution lends, guarantees and insures itself without adequate capital/reserve separation.

# 48. Fraud, Moral Hazard and Adverse-Incentive Controls

27F supports risk-control hooks without becoming a crime simulator.

Controls include:

- insurable-interest validation;
- duplicate-claim detection;
- asset condition snapshots;
- ownership/manifest provenance;
- deductible/coinsurance;
- claim history;
- suspicious timing flags;
- policy exclusions;
- independent evidence where available;
- exposure caps.

Intentional fraud determination and punishment remain 27I/governance/social systems.

# 49. Financial Risk Profiles, Creditworthiness and Explainability

No universal opaque credit score is required.

A lender/insurer produces a **Risk Assessment Snapshot** containing:

- requested exposure;
- income/cashflow strength;
- obligations/debt service;
- liquidity/reserves;
- security quality;
- repayment/claim history;
- concentration exposure;
- route/market/world risk;
- known social/commercial reliability input;
- information confidence;
- resulting risk band;
- top positive/negative reasons.

Risk assessment may be incomplete when information is unknown. The system must distinguish **unknown** from **bad**.

# 50. Default, Delinquency and Arrears

Default progression should be staged.

| Stage | Meaning | Typical Response |
| --- | --- | --- |
| Current | Payments up to date. | Normal. |
| Due | Payment due now. | Reminder/payment attempt. |
| Grace | Payment missed but cure window active. | Warning, optional fee. |
| Arrears | Past-due balance recorded. | Restrict new draws, negotiate. |
| Delinquent | Repeated/material arrears. | Risk downgrade, cure demand. |
| Default | Declared trigger satisfied. | Security/guarantee/insolvency options become available. |
| Restructuring | Terms modified under plan. | New schedule/conditions. |
| Resolved | Paid, settled, written down under authorised plan or legally closed. | Archive history. |

No stage alone authorises violence or physical seizure.

# 51. Restructuring, Forbearance and Renegotiation

A viable debtor may avoid destructive collapse through:

- payment extension;
- temporary interest freeze;
- reduced instalments;
- maturity extension;
- collateral substitution;
- partial settlement;
- debt consolidation;
- equity/ownership conversion only if 27D/27E and owner authority permit;
- creditor standstill;
- public relief under 27G.

Restructuring must preserve economic provenance. Written-down debt is an explicit loss to the creditor or authorised backstop, not value disappearing invisibly.

# 52. Insolvency Entry and Financial Distress

Insolvency is triggered by policy/legal conditions such as:

- inability to meet material obligations as due;
- persistent arrears beyond thresholds;
- negative liquid-reserve position with no valid funding;
- enterprise closure with unpaid creditors;
- creditor/debtor voluntary filing where enabled;
- governance/legal declaration.

27D operating states such as Strained/Suspended may exist before insolvency.

# 53. Insolvency Stay, Claim Freeze and Business Continuity

An insolvency case may impose an economic **stay** that prevents uncontrolled parallel enforcement while claims are reconciled.

Possible effects:

- freeze new unsecured borrowing;
- freeze creditor enforcement requests;
- preserve essential payroll/food/service payments if policy allows;
- require administrator approval for asset sales;
- suspend dividends/owner withdrawals;
- keep viable operations running;
- register claims and priorities.

The stay is a finance/legal state. It does not physically prevent theft or violence; those systems enforce their own rules.

# 54. Creditor Ranking, Secured and Unsecured Claims

Core ranking can remain simple and configurable.

Suggested default categories:

1. specifically segregated custody assets returned to owners;
2. externally defined legal/public priority claims if applicable;
3. valid secured claims against their collateral value;
4. essential employee wage claims where governance rules grant priority;
5. ordinary unsecured creditors;
6. subordinated/owner-related debt;
7. residual ownership interests.

27G/governance may alter legal priority by polity/culture. 27F provides the framework and consumes the policy.

# 55. Restructuring Plans, Liquidation and Exit

Resolution modes:

- full cure;
- consensual restructuring;
- creditor-approved restructuring;
- public rescue/backstop;
- sale as going concern;
- asset sale/liquidation;
- merger/transfer;
- closure with partial creditor recovery;
- debt forgiveness/write-down;
- historical ruin/abandoned enterprise state.

Liquidation uses authoritative ownership-transfer/sale processes. Assets do not vanish into an abstract recovery percentage.

# 56. Household Debt and Personal Insolvency Boundary

Households may hold:

- personal loans;
- emergency debt;
- rent/service arrears converted to debt;
- secured housing/equipment debt where content supports it;
- medical-cost finance;
- merchant tabs.

To avoid punishing cosy play, default household resolution emphasises repayment plans, assistance, restructuring and limited garnishment/claim systems rather than permanent debt spirals. Harsh/legal simulation settings may enable deeper personal insolvency.

Set 29 supplies health cost events; Set 28 supplies household/social response; 27D owns household economic state.

# 57. Legal Enforcement, Seizure and Governance Boundary

27F may declare:

- amount due;
- default;
- enforceable security interest;
- creditor priority;
- guarantee call;
- insolvency case;
- proposed asset transfer/recovery.

27F may **not** independently:

- arrest or imprison;
- break locks;
- confiscate contested property;
- issue court judgments;
- fine crimes;
- command guards;
- decide cultural legality.

Those actions require the relevant governance/law/combat systems.

# 58. Public Finance, Sovereign/Public Borrowing and 27G Boundary

27F defines generic finance instruments that a settlement treasury may use if 27G authorises them.

27G owns:

- who may borrow publicly;
- borrowing limits;
- bond/public-debt issuance policy;
- taxes and repayment revenue;
- treasury accounts;
- public guarantees;
- deposit guarantees;
- bailouts/relief;
- monetary issuance/mint policy;
- fiscal consequences.

27F owns the instrument mechanics, schedule, creditor claim and default state after authorisation.

# 59. Restricted Finance, Black Markets and 27I Boundary

27F records legitimate/declared financial instruments and can expose:

- unusual transfer volume;
- prohibited counterparty flags supplied externally;
- suspicious claim patterns;
- undeclared asset mismatch;
- forged-document/evidence suspicion from owning systems;
- policy/permission breaches.

27I owns illicit money networks, smuggling finance, fencing, hidden markets and intentional avoidance of restrictions. 27F must not become a step-by-step criminal laundering simulator.

# 60. Simulation LOD, Distant Finance and Reconciliation

Finance is naturally event-driven and is well suited to distant simulation.

| LOD | Finance Behaviour |
| --- | --- |
| Local Detailed | UI, physical institutions, tellers/merchants, immediate transfers and claim evidence. |
| Loaded Summary | Full records, event-driven accrual/payment/claim processing. |
| Settlement Aggregate | Scheduled debt service, deposit flows, institution liquidity and insurance exposure processed in bounded batches. |
| Regional Abstract | Major credit availability, institution distress, large defaults, insurer catastrophe events and public backstops. |

Rules:

- interest accrues by bounded time slices;
- no millions of per-day micro-events after long absence;
- scheduled payments aggregate while preserving due/paid totals;
- unique debts/policies remain individually identifiable;
- catastrophe claims are not randomly invented during catch-up without an authoritative event source;
- promotion reconciles exact balances, arrears, claims and institution state.

# 61. Multiplayer Authority, Permissions and Auditability

Multiplayer finance requires explicit capability permissions.

Examples:

- view account;
- deposit;
- withdraw;
- transfer;
- borrow;
- increase credit limit;
- pledge collateral;
- release collateral;
- guarantee another actor;
- purchase/cancel insurance;
- file claim;
- approve claim as insurer;
- enter insolvency/restructure;
- administer institution.

High-impact actions require current version checks and may use confirmation thresholds. Every successful mutation writes actor, authority, time, source/destination and resulting record IDs.

# 62. UI/UX, Difficulty, Accessibility and Player Trust

## 62.1 Player-Facing Finance Summary

The default view should answer **what, why, when and worst case** without exposing every formula.

A loan offer displays:

- amount received;
- total expected repayment;
- payment cadence;
- rate/fees;
- collateral/guarantee;
- missed-payment consequences;
- early repayment rule;
- lender;
- risk reasons.

An insurance policy displays:

- covered subject;
- top covered risks;
- major exclusions;
- premium;
- deductible;
- maximum payout;
- coverage period;
- current status.

## 62.2 Difficulty/World Settings

Recommended finance settings:

- finance depth: Off / Basic / Standard / Advanced;
- interest: Off / Simple / Advanced;
- compounding: Off by default;
- bank failure: Off / Rare / Standard;
- household severe insolvency: Off by default;
- insurance availability: Basic / Standard / Advanced;
- claim strictness/evidence assistance;
- default grace length;
- public deposit guarantee if 27G supports;
- tutorial/detail level.

Accessibility includes scalable text, plain-language summaries, non-colour risk cues, confirmation for high-risk commitments, readable timelines and optional automatic payment scheduling.

# 63. Set 25 Schemas, Godot Services and Validation

## 63.1 Proposed Canonical Definition Families

- `economy.finance.capability.*`
- `economy.finance.deposit_product.*`
- `economy.finance.credit_product.*`
- `economy.finance.interest_model.*`
- `economy.finance.collateral_profile.*`
- `economy.finance.guarantee_profile.*`
- `economy.finance.insurance_product.*`
- `economy.finance.risk_model.*`
- `economy.finance.insolvency_profile.*`

## 63.2 Runtime Services

Recommended Godot services:

- `FinancialAccountService`
- `CreditFacilityService`
- `DebtScheduleService`
- `CollateralService`
- `GuaranteeService`
- `FinancialInstitutionService`
- `InsurancePolicyService`
- `InsuranceClaimService`
- `FinancialRiskService`
- `InsolvencyService`
- `FinanceReconciliationService`

Services operate on Resources/data records and authoritative transaction commands, not scene-node ownership.

## 63.3 Core Commands

- `OpenFinancialAccount`
- `DepositFunds`
- `WithdrawFunds`
- `TransferFunds`
- `RequestCredit`
- `ActivateCreditFacility`
- `DrawCredit`
- `MakeDebtPayment`
- `PledgeCollateral`
- `ReleaseCollateral`
- `CreateGuarantee`
- `CallGuarantee`
- `PurchaseInsurance`
- `FileInsuranceClaim`
- `ResolveInsuranceClaim`
- `BeginRestructuring`
- `OpenInsolvencyCase`
- `ApproveInsolvencyPlan`

## 63.4 Core Events

- `FinancialAccountOpened`
- `FundsDeposited`
- `FundsWithdrawn`
- `FundsTransferred`
- `CreditApproved`
- `CreditDrawn`
- `DebtPaymentPosted`
- `DebtPaymentMissed`
- `DebtDefaulted`
- `CollateralPledged`
- `CollateralReleased`
- `GuaranteeCalled`
- `InsurancePolicyActivated`
- `InsuranceClaimFiled`
- `InsuranceClaimResolved`
- `InstitutionLiquidityChanged`
- `InsolvencyOpened`
- `InsolvencyResolved`

## 63.5 Hard Validation Invariants

1. No loan disbursement without simultaneous debt creation and funding source.  
2. No debt principal below zero.  
3. No account withdrawal exceeding available balance plus valid overdraft.  
4. No spendable balance at both ends of a pending transfer.  
5. No collateral pledge without pledgor authority and valid asset reference.  
6. No collateral value above authoritative assessed basis after configured haircut rules.  
7. No insurance claim without active policy and loss event/evidence.  
8. No payout above covered loss/policy limit/authorised capacity.  
9. No interest accrual outside instrument period/model.  
10. No unbounded compounding where caps/settings forbid it.  
11. No creditor claim duplicated during assignment/refinance.  
12. No insolvency resolution that deletes unmatched assets/liabilities.  
13. No multiplayer financial action without signer permission.  
14. No distant catch-up producing different net balances than equivalent bounded detailed processing.  
15. Every failed finance command returns a stable reason code.

# 64. Representative Acceptance Scenarios

## FIN-001 - Simple Loan

A player borrows 100 silver from a guild lender. The lender has 500 available funds. Activation transfers 100 to the player and creates a 100-principal debt. Reload preserves both states exactly.

**Pass:** no duplicate funds; lender capacity decreases appropriately; schedule is readable.

## FIN-002 - Insufficient Lender Liquidity

A lender approves terms but has only 30 available liquidity for a 100 loan.

**Pass:** activation fails or funds partially only if product explicitly supports staged draw. No debt is created for unfunded value.

## FIN-003 - Merchant Working Capital

A merchant has insufficient cash to buy iron but a valid 200 credit line. 27C requests 60 credit purchasing capacity, sale completes and a 60 draw is posted.

**Pass:** merchant stock/payment, lender exposure and debt reconcile.

## FIN-004 - Collateral Damage

A 300-value wagon secures a loan. Set 30 reports wagon destroyed in a raid. Collateral value falls; debt remains; lender may request cure/additional security; insurance claim can proceed separately.

**Pass:** wagon is not duplicated/recreated; debt does not vanish.

## FIN-005 - Insurance Covered Fire

A warehouse insured for fire suffers authoritative fire damage. Covered loss is 400, deductible 50, policy limit 500.

**Pass:** maximum payout basis is 350 subject to insurer capacity/other conditions; structure stays physically damaged until repaired.

## FIN-006 - Excluded Loss

Cargo policy excludes intentional abandonment. Player discards cargo voluntarily.

**Pass:** claim rejects with clear exclusion/evidence reason; no payout.

## FIN-007 - Double Claim Prevention

Same loss event is submitted twice under one policy.

**Pass:** duplicate claim detected; second cannot create payout.

## FIN-008 - Loan Missed Payment

Borrower misses instalment but remains inside grace period.

**Pass:** arrears warning appears; collateral does not teleport; default not declared prematurely.

## FIN-009 - Restructuring

A viable bakery loses access for seven days after a flood. Lender approves maturity extension and temporary interest pause.

**Pass:** new terms are versioned; old history remains; no duplicated principal.

## FIN-010 - Enterprise Insolvency

Enterprise closes with unpaid secured and unsecured creditors.

**Pass:** insolvency case registers claims, applies policy priority, preserves asset ownership until authorised transfers, and records partial recovery.

## FIN-011 - Bank Liquidity Stress

Many depositors request withdrawals after a trade shock. Provider liquidity falls below configured threshold.

**Pass:** provider enters visible stress state; withdrawals follow policy; balances are not arbitrarily deleted.

## FIN-012 - Multiplayer Company Loan

Player without `borrow` permission attempts to pledge company warehouse and draw a loan.

**Pass:** denied with permission reason; no collateral/debt mutation.

## FIN-013 - Maritime Claim

Set 26 records vessel loss in covered storm with cargo manifest and voyage evidence.

**Pass:** 27F assesses policy; no vessel respawn occurs; payout follows terms.

## FIN-014 - Distant Accrual

Player leaves a region for 90 days. Several scheduled debt payments/interest periods occur.

**Pass:** bounded catch-up matches aggregated expected balance without 90 per-day scene events or duplicate payments.

# 65. Production Scope, Balance and Open Decisions

## 65.1 Recommended Core Production

Core candidates:

- personal/business simple loans;
- non-interest and simple-interest debt;
- fixed schedules;
- merchant tabs/credit lines;
- secure deposit accounts;
- same-provider account transfers;
- basic collateral;
- guarantees where useful to contracts;
- basic property/cargo insurance;
- claim lifecycle;
- default/grace/restructure;
- simple enterprise insolvency;
- risk reasons and UI;
- multiplayer permissions;
- LOD/persistence/validation.

## 65.2 Alpha/Later Candidates

- cross-provider clearing networks;
- letters of credit;
- factoring/invoice finance;
- asset finance variants;
- advanced variable rates;
- compound interest;
- multiple collateral priority layers;
- bank runs/failure;
- reinsurance;
- catastrophe pools;
- household formal bankruptcy;
- advanced public guarantees;
- complex interrealm finance.

## 65.3 Explicitly Deferred Unless Approved

- derivatives;
- futures/options markets;
- short selling;
- leveraged securities speculation;
- tradable equity exchanges;
- central-bank policy simulation;
- algorithmic/high-frequency trading;
- complex structured finance.

## 65.4 Open Decisions for Later Integration

1. Exact Core interest-rate ranges and caps.  
2. Whether basic bank deposits earn interest by default.  
3. Minimum settlement stage for formal banking capability.  
4. Whether guild credit appears before bank institutions.  
5. Core insurance product list.  
6. Whether bank failure is enabled in Standard worlds or only Advanced/Harsh.  
7. Default grace periods by debt family.  
8. How strongly commercial default history affects future credit.  
9. Whether household debt relief is automatic in relaxed modes.  
10. Which collateral families are eligible in Core.  
11. Whether guarantees/sureties ship in Core or Alpha.  
12. Whether public deposit guarantees exist by default - 27G decision.  
13. Exact creditor priority policy by culture/government - 27G/governance input.  
14. Maritime insurance launch tier with Set 26.  
15. Finance skill/perk effects on information versus raw pricing.  
16. Whether magical instant ledger transfer exists and which infrastructure gates it.  
17. Cross-realm settlement restrictions.  
18. How aggressive NPC lenders should be in offering unsolicited credit.  
19. Whether players can operate their own bank/insurer in final game.  
20. Which institutional-risk systems are visible to ordinary depositors.

# 66. Cross-Set Interface Amendments

The following amendments supplement the governing Sets 27-30 Cross-Set Interface Register. They do not transfer ownership.

## Amendment 27F-A - Set 28 Social/Commercial Reliability Interface

**27F -> Set 28**

- debt current/arrears/default fact;
- guarantee honoured/defaulted fact;
- claim fraud suspicion/result fact where externally resolved;
- commercial repayment milestone;
- insolvency event.

**Set 28 -> 27F**

- bounded trust/reliability modifier known to lender;
- willingness to guarantee/extend informal credit;
- relationship-based concession result;
- social forgiveness/waiver intent routed through 27E amendment authority.

Set 28 never directly changes debt principal or claim state.

## Amendment 27F-B - Set 29 Health/Capacity Financial Interface

**Set 29 -> 27F**

- authoritative injury/illness/death event ID;
- treatment-cost/economic consequence reference supplied by owning system;
- work incapacity period;
- recovery state.

**27F -> Set 29**

- coverage status;
- authorised treatment funding/payment reference;
- wage-continuation/benefit financial result.

Finance never changes health state.

## Amendment 27F-C - Set 30 Transport Asset/Risk Interface

**Set 30 -> 27F**

- vehicle/mount asset identity;
- condition/damage/loss event;
- route completion/failure evidence;
- cargo custody handoff where relevant;
- travel-risk classification consumed as input.

**27F -> Set 30**

- financing/security reference;
- insurance coverage reference;
- repossession/transfer request only after external authority;
- claim evidence request.

Set 30 never calculates finance balances.

## Amendment 27F-D - Set 26 Maritime Finance Interface

**Set 26 -> 27F** voyage/vessel/cargo/incident/salvage evidence.  
**27F -> Set 26** finance/security/policy/claim references only.

## Amendment 27F-E - 27G Public Guarantee and Borrowing Interface

**27G -> 27F** public borrowing authority, treasury funding source, guarantee/backstop authority, deposit-protection rule.  
**27F -> 27G** debt service schedule, public exposure, guarantee calls, institution distress and fiscal claim events.

# Appendix A. Finance Definition and Runtime Record Templates

## A.1 Financial Capability Definition

| Field | Description |
| --- | --- |
| capability_id | Qualified stable ID. |
| service_type | deposit, transfer, loan, exchange, escrow, guarantee, insurance, insolvency, etc. |
| provider_types | enterprise/public/guild/faction eligibility. |
| building_capabilities | Required Set 20 functional services. |
| staff_roles | Required NPC/job capabilities. |
| currencies | Supported currency families. |
| permissions | Access/signing requirements. |
| limits | Default transaction/exposure bounds. |
| dependencies | 27B/27E/27G/Set 26 etc. |
| simulation | LOD/catch-up profile. |
| ui | Player-facing category/help. |

## A.2 Financial Account Runtime

| Field | Description |
| --- | --- |
| account_id | Stable runtime ID. |
| provider_id | Financial institution. |
| owner_id | Beneficial/account owner. |
| currency_id | 27B currency family. |
| product_id | Deposit/custody/current account definition. |
| available | Spendable balance. |
| held | Reserved/blocked amount. |
| pending_in/out | Settlement amounts. |
| overdraft_ref | Optional credit facility. |
| signers | Authorised actors/roles. |
| status | active/restricted/frozen/closed/resolution. |
| history_ref | Transaction journal. |
| schema_version | Migration version. |

# Appendix B. Loan, Credit and Collateral Templates

## B.1 Debt Instrument

| Field | Description |
| --- | --- |
| debt_id | Stable runtime ID. |
| creditor/debtor | Parties. |
| facility_id | Parent credit facility if any. |
| currency | Debt currency/value basis. |
| original_principal | Funded amount. |
| outstanding_principal | Current principal. |
| accrued_interest | Current accrued interest. |
| fees_due | Declared charges. |
| interest_model | Definition reference. |
| schedule | Payment schedule reference. |
| security_refs | Collateral/security. |
| guarantee_refs | Third-party support. |
| contract_ref | 27E formation/source. |
| status | current/arrears/default/restructured/resolved. |
| next_due | Due time/amount. |
| history | Payment/default/amendment events. |

## B.2 Security Interest

| Field | Description |
| --- | --- |
| security_id | Stable ID. |
| creditor | Secured party. |
| pledgor | Actor granting security. |
| collateral_ref | Asset/right instance. |
| secured_debt_ref | Debt/facility. |
| secured_cap | Maximum secured amount. |
| priority | Rank/policy reference. |
| assessed_value | Current finance valuation snapshot. |
| status | active/released/enforceable/disputed/terminated. |
| external_enforcement_ref | Legal/world result if used. |

# Appendix C. Banking and Institution Templates

## C.1 Financial Institution Runtime

| Field | Description |
| --- | --- |
| institution_id | Enterprise/public/faction financial provider. |
| capability_ids | Enabled financial capabilities. |
| site_refs | Active facilities. |
| staff_capacity | Current validated staffing. |
| liquid_funds | Available liquid balances. |
| deposit_liabilities | Customer balances by currency. |
| loan_assets | Outstanding credit exposure. |
| insurance_reserves | If underwriting. |
| guarantees | Contingent exposure. |
| risk_concentrations | Route/currency/faction/asset bands. |
| status | normal/tight/restricted/suspended/resolution. |
| public_backstop_ref | Optional 27G support. |
| audit/history | Immutable event links. |

# Appendix D. Insurance Policy and Claim Templates

## D.1 Insurance Policy

| Field | Description |
| --- | --- |
| policy_id | Stable runtime ID. |
| insurer | Provider. |
| insured | Policyholder. |
| beneficiary | Payout recipient if different. |
| subject_ref | Asset/exposure/contract/route. |
| insurable_interest | Basis/reference. |
| covered_risks | Risk tags. |
| exclusions | Excluded causes/conditions. |
| valuation_basis | 27B assessed value method. |
| premium | Amount/cadence. |
| deductible | Retained loss. |
| limit | Maximum payout. |
| coverage_period | Start/end. |
| capacity_hold | Insurer exposure reservation. |
| status | pending/active/suspended/expired/cancelled. |

## D.2 Insurance Claim

| Field | Description |
| --- | --- |
| claim_id | Stable runtime ID. |
| policy_id | Source policy. |
| loss_event_ref | Authoritative event. |
| filed_by | Authorised actor. |
| evidence_refs | World/contract/manifest records. |
| gross_loss | Assessed economic loss. |
| covered_loss | After exclusions/eligibility. |
| deductible | Applied retained amount. |
| limit_effect | Applied cap/sub-limit. |
| approved_payout | Final authorised amount. |
| decision | approved/partial/rejected/disputed. |
| reason_codes | Explainable outcome. |
| payment_ref | Authoritative transaction. |

# Appendix E. Insolvency and Creditor Templates

## E.1 Insolvency Case

| Field | Description |
| --- | --- |
| case_id | Stable runtime ID. |
| debtor_id | Household/enterprise/institution/public actor where allowed. |
| trigger | Entry condition/evidence. |
| opened_at | World time. |
| administrator | Authorised role if any. |
| stay_state | Enforcement/payment restrictions. |
| asset_snapshot | Authoritative assets/rights references. |
| claim_register | Creditor claims. |
| priority_policy | Governance/27F rule reference. |
| operating_plan | Continue/suspend/sell/liquidate. |
| restructuring_plan | Approved modifications if any. |
| resolution | outcome. |
| history | Events/decisions. |

# Appendix F. Reason-Code Catalogue

| Reason Code | Meaning |
| --- | --- |
| `economy.finance.provider_unavailable` | Required financial capability is not active. |
| `economy.finance.insufficient_liquidity` | Provider cannot fund/settle requested amount. |
| `economy.finance.account_insufficient_funds` | Account lacks available balance. |
| `economy.finance.account_restricted` | Account cannot perform requested action. |
| `economy.finance.credit_declined` | Lender policy declined requested exposure. |
| `economy.finance.credit_limit_exceeded` | Draw exceeds authorised limit. |
| `economy.finance.debt_in_arrears` | Instrument has overdue obligations. |
| `economy.finance.collateral_invalid` | Asset/right cannot validly secure this debt. |
| `economy.finance.collateral_encumbered` | Existing claim prevents requested pledge/priority. |
| `economy.finance.collateral_value_insufficient` | Eligible secured value does not meet policy. |
| `economy.finance.guarantee_invalid` | Guarantee capacity/trigger/authority invalid. |
| `economy.finance.policy_inactive` | Insurance coverage not active for event time. |
| `economy.finance.loss_not_covered` | Loss cause/subject falls outside coverage. |
| `economy.finance.loss_below_deductible` | Covered amount does not exceed deductible. |
| `economy.finance.claim_duplicate` | Same loss already claimed/resolved under policy rules. |
| `economy.finance.claim_insufficient_evidence` | Required authoritative evidence unavailable. |
| `economy.finance.insurer_capacity_insufficient` | Payout requires resolution/backstop/partial handling. |
| `economy.finance.insolvency_stay_active` | Action blocked by active insolvency stay. |
| `economy.finance.permission_denied` | Actor lacks authority for financial action. |
| `economy.finance.version_conflict` | Instrument changed before command committed. |
| `economy.finance.transfer_pending` | Funds are committed but not yet finally settled. |

# Appendix G. Cross-System Responsibility Matrix

| System | Owns | 27F Exchanges |
| --- | --- | --- |
| 27B | currency/value/exchange | valuation, exchange quote, assessed value |
| 27C | markets/merchant stock/liquidity | credit-backed purchase capacity, market risk evidence |
| 27D | household/business/ownership | borrower/lender/asset/account ownership, cashflow |
| 27E | contracts/claims/evidence | formation, receivable conversion, breach/loss evidence |
| 27G | tax/treasury/public finance | public borrowing, guarantees, backstops, debt service |
| 27H | route/caravan economics | route risk, trade finance, cargo loss evidence |
| 27I | illicit/black markets | suspicious event references, legal restriction inputs |
| Set 26 | vessels/voyages/marine incidents | marine finance/insurance references |
| Set 28 | social relationships | bounded reliability/willingness signals, social consequences |
| Set 29 | health/survival | insured cost/event references only |
| Set 30 | movement/land vehicles | asset condition, route success/loss, finance/security refs |
| Set 25 | schemas/IDs/validation | canonical definitions and migration |

# Appendix H. 27F Completion Checklist

- [x] Adopted 27A-27E and the Sets 27-30 Cross-Set Interface Register.  
- [x] Defined finance as timing/risk transformation without free value.  
- [x] Defined financial accounts, deposits, withdrawals and transfers.  
- [x] Defined funded loans and debt instruments.  
- [x] Defined simple interest baseline and optional bounded compounding.  
- [x] Defined repayment, prepayment, refinancing and revolving credit.  
- [x] Defined merchant/working-capital integration with 27C.  
- [x] Defined receivables finance and asset finance.  
- [x] Defined collateral, valuation, priority and guarantees.  
- [x] Defined bank capability activation, liquidity and institutional risk.  
- [x] Defined insurance policies, premiums, coverage, claims and reserves.  
- [x] Defined caravan and maritime insurance interfaces.  
- [x] Defined business interruption and health-cost insurance boundaries.  
- [x] Defined fraud-control hooks without taking crime-system ownership.  
- [x] Defined explainable credit/risk assessment without opaque universal scoring.  
- [x] Defined arrears, default, restructuring and insolvency.  
- [x] Preserved governance ownership of seizure, courts and criminal enforcement.  
- [x] Preserved 27G ownership of taxes, treasuries, public borrowing authority and backstops.  
- [x] Preserved Sets 28-30 ownership boundaries and recorded interface amendments.  
- [x] Defined simulation LOD, multiplayer authority and auditability.  
- [x] Defined Set 25 schema families and Godot/Summer services.  
- [x] Added validation invariants, reason codes and representative acceptance scenarios.  
- [x] Defined Core/Alpha/deferred finance scope.  
- [x] Handed taxation, treasuries and public finance to 27G.

**End of Document 27F - Credit, Debt, Banking, Insurance and Financial Risk v0.1**
