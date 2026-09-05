# FANTASY VOXEL CIVILISATION SANDBOX

## DOCUMENT SET 27

# 27B - Currency, Barter, Value and Price Formation

*Version 0.1 - Currency, Valuation and Transaction-Price Foundation Draft*

A governing economic document for Leyforge that defines how goods, services, currencies and barter acquire comparable value; how local prices are formed without becoming random or globally fixed; how money remains authoritative without bypassing physical resources; and how every player-facing quote can explain the causes behind it.

**Project Lead and Final Authority: Ash**

Architecture, systems planning, documentation and production support: GPT-5.6 Sol

---

> **Currency and Price Formation Statement**
>
> Leyforge must support money without allowing money to replace the physical world. Currency is a tool for settling value, not a universal measure that makes grain, iron, mana crystals, labour or cultural goods interchangeable everywhere. Barter remains valid, multiple currencies may coexist, and prices are contextual outcomes of real use, scarcity, stock, production, access, law, culture, information, timing and actor policy. A quoted price is an offer with provenance and expiry, not a permanent property of an item. A fair-value estimate is not a guaranteed transaction. A coin balance cannot appear without an authorised source. The system should be sophisticated enough to support regional trade and advanced economic play while remaining readable enough that ordinary buying and selling feels immediate rather than bureaucratic.

| Field | Locked Direction |
| --- | --- |
| Document Set | This is Document 27B in Document Set 27: Economy, Trade and Commerce. |
| Document Scope | Owns currency families, denominations, monetary representation, barter valuation, reference value, contextual fair value, price formation, currency acceptance, exchange, quote formation, rounding, volatility controls, value information and transaction-price safeguards. |
| Core Philosophy | Value is contextual; price is negotiated/executable context; reference value is a non-spendable balancing anchor. Currency simplifies settlement but does not create goods, labour, services or purchasing power by declaration alone. |
| Universal Currency Decision | No mandatory universal world currency exists. One or more currencies may become widely accepted through trade networks, political reach, trust or convertibility, but acceptance remains contextual and data-driven. |
| Physical Currency Decision | Default play uses a specialised currency purse/wallet view that aggregates recognised small denominations without consuming ordinary backpack slots. Currency remains conserved and may still exist physically in containers, loot, cargo or treasury stock. Large bullion and special monetary objects remain ordinary physical inventory/cargo. |
| Barter Decision | Barter is a first-class transaction form. Offers may combine goods, currency and later contract-backed obligations. The receiving party values offered goods using its own current buy valuation rather than a universal barter table. |
| Reference Value Decision | Use an internal non-spendable Reference Value Unit (RVU) for balancing, cross-currency normalisation and valuation calculations. RVU is not a lore currency, cannot be owned and is not shown by default. |
| Price Formula Direction | Use a layered deterministic price model: reference value -> instance value -> bounded contextual pressure -> actor quote spread/policy -> taxes/fees -> currency conversion -> deterministic rounding. |
| Price Stability Direction | Commodity families define normal and crisis volatility bands. Market pressure is bounded; ordinary prices cannot run to zero or infinity from one shortage/surplus signal. |
| Market Boundary | 27B maps market-pressure inputs into value/price. 27C owns how supply, demand, stock, merchants and market memory generate those inputs. |
| Social Boundary | Set 28 may supply trust, relationship and negotiation outcomes that alter concessions or access. Set 28 never changes canonical reference value or independently recalculates market fair value. |
| Public Finance Boundary | 27G owns taxes, tariffs, tolls and public rates. 27B defines how those charges are added to quotes and how assessed value is represented. |
| Illicit Economy Boundary | 27I owns black-market discovery, laundering, illicit liquidity and legal-evasion gameplay. 27B provides legality/risk valuation hooks and currency authenticity interfaces only. |
| Maritime Boundary | Set 26 retains maritime cargo, voyage, port and customs execution. 27B supplies universal value, currency and price results consumed by maritime trade. |
| Registry Direction | Stable IDs, field ownership, facets, packs, aliases, validation and migrations remain governed by Set 25. 27B registers economic definitions and runtime records through that spine. |
| Engine Direction | Runtime valuation uses deterministic fixed-point/integer arithmetic in Godot services. Summer Engine may assist authoring/testing but is not a runtime price oracle. |
| Production Direction | Simple currency, purse, barter, reference value, local quoting and safeguards are Core candidates. Debasement, counterfeiting and deeper monetary policy remain optional/advanced until Set 25 classification. |
| Final Authority | Ash retains final authority over currency canon, default currencies, production scope, balance values, difficulty settings and any later monetary-policy depth. |
| Next Deliverable | 27C - Markets, Merchants, Stock and Supply-Demand Simulation. |

# Document Purpose

Document 27B turns the economic architecture of 27A into an executable valuation and settlement foundation. Earlier Leyforge documents already establish physical item ownership, resource scarcity, trade goods, cultural preferences, merchant interaction, settlement warehouses, contracts, tariffs, cargo and authoritative transactions. They intentionally do not define one final currency or price model. This document closes that specific gap without absorbing the market simulation, labour, contract, finance, public-finance or transport systems owned by later Set 27 documents.

The design deliberately distinguishes **what an object is**, **what it is worth in a design/balancing sense**, **what it is worth in a particular economic context**, **what an actor is currently willing to pay or accept**, and **what was actually exchanged**. Those are separate states because collapsing them into one `base_value` number would undermine the living-world promise. An iron ingot may have one reference value, a high contextual fair value in a settlement rebuilding its walls, a lower bid from a merchant who already has excess stock, and a still different final transaction price after reputation concession, tax and currency conversion.

The document also resolves the major currency questions left open by 27A. Leyforge does not assume that every people or settlement uses the same money. It does not make barter a primitive phase that disappears. It does not require players to manually count individual copper pieces during ordinary commerce. It does not use inventory clutter as the primary monetary challenge. It does not permit money balances to appear from shop UI. Money, goods and ownership remain authoritative and auditable.

# Design Sources, Authority and Supersession

| Source | Relevant Direction | Treatment in 27B |
| --- | --- | --- |
| 00 - Master Game Design Bible | Living settlements trade, cultures differ, player roles include trader/ruler, and the world reacts to material conditions. | Currency and prices must serve civilisation play without forcing one economic culture or career. |
| 01 - Core Gameplay Loop | Trade supports gathering, crafting, building, settlement help, automation and expansion. | Buying/selling/barter remain optional solutions inside the wider sandbox loop. |
| 02 - Player Progression | Trading is a use-based skill path; no fixed classes; players may master all systems. | Appraisal and market-information precision may improve through progression without granting impossible knowledge or overriding stock truth. |
| 04 - Items Registry | Items include trade goods, rarity/quality/condition, physical currency candidates and a `base_value` planning field. | 27B supersedes `base_value` as a universal executable price; it becomes/reference-migrates to reference-value metadata. |
| 05 - Crafting and Recipe Registry | Real inputs, outputs, processing time, fuel/power, quality and by-products define transformations. | Reference-value authoring may use production-chain evidence but cannot override recipe truth. |
| 06 - Resource Progression | Scarcity, cultural preference and strategic use affect trade value; silver/gold can serve currency/trade roles. | Supplies economic value factors without making material tier equal price. |
| 07 - NPC Village System | Merchants, inventories, warehouses, reputation and settlement needs are persistent. | 27B values real stock and exposes quote interfaces; 07 remains NPC identity/storage truth. |
| 08 - Automation System | Production/logistics conserve resources and can feed warehouses. | Automation changes available supply; it cannot mint money or force a price directly. |
| 13 - Races, Peoples, Cultures and Factions | Culture, faction, law, government and territory are distinct. | Currency acceptance, preference and legal-tender status attach to culture/faction/jurisdiction, never ancestry. |
| 15 - Quest and Event System | Contracts, shortages, markets and rewards can be systemic and persistent. | Quests consume price/payment results; quest reward text cannot create unbacked currency outside authorised reward issuance. |
| 16 - Combat, Gear and Defence | Loss, theft, tribute, equipment demand and repairs affect world state. | Damage and conflict can alter item condition, risk and demand inputs; 27B does not resolve combat or theft. |
| 17 - UI/UX System | Trade UI must show stock, supply/demand, culture preference, legality, reputation prices and reasons; knowledge may be partial. | 27B exposes quote breakdowns, value confidence and price-observation states for the shared UI layer. |
| 19-20 - Settlement and Buildings | Markets, treasuries, customs and storage require real activation/services and resource transactions. | Currency/price services require valid providers; decorative market buildings do not create quotes or money. |
| 25B-25C | Stable IDs, one editing authority per field, typed relationships, capabilities and schema contracts. | 27B defines economic facets/records while preserving Set 25 source-of-truth rules. |
| 25I | Physical Currency Family is a Core item family; scarcity, quality, provenance, significance and value are separate; market value is contextual. | Direct foundation for currency item representation and separation of value dimensions. |
| 25J | Resource/recipe chains preserve provenance and do not assign final prices. | Reference values may consume chain metadata while executable prices remain 27B/27C-owned. |
| 26K | Maritime wealth must derive from physical cargo; market values respond to supply, demand, risk, access and culture; no universal market oracle. | Maritime commerce consumes 27B valuation/currency results while retaining voyage/cargo authority. |
| 26N | Value emerges from use, scarcity, condition, risk, law, distance, timing, culture, information and alternatives; currency does not replace goods. | Reinforces the universal valuation factors adopted here. |
| 27A | Establishes physical conservation, contextual local prices, no ghost currency, reference value not price, multiple exchange forms and bounded explainability. | Governing parent document. 27B resolves its currency/barter/price-formation open decisions. |
| Sets 27-30 Cross-Set Interface Register v1.0 | Set 27 owns economy and consumes social/survival/movement interfaces. | Adopted. Cross-set amendments appear near the end of this document. |
| 99 - POC Manual Testing Guide | Current runtime already proves authoritative inventories, transactions, persistent settlements and physical logistics. | Confirms that Set 27 can build on conserved state rather than designing an abstract disconnected economy. |

> **Supersession Rule**
>
> Once 27B is approved, earlier executable uses of `base_value`, fixed shop price, universal currency assumptions or price-as-an-item-property are superseded. Earlier content fields may remain as migration inputs or reference-value authoring metadata, but the runtime price must resolve through the 27B quote pipeline and 27C market context.

# Static Table of Contents

1. Locked Currency, Barter and Price Identity  
2. Locked Decision Summary  
3. Scope and Explicit Non-Goals  
4. Canonical Terminology  
5. Valuation Architecture and State Separation  
6. Reference Value Unit and Design-Time Value  
7. Reference-Value Authoring by Asset Type  
8. Instance Value: Quality, Condition, Freshness, Purity and Provenance  
9. Currency System Architecture  
10. Currency Families, Denominations and Issuers  
11. Physical Currency, Purse, Accounts and Bullion  
12. Issuance, Minting, Destruction and Monetary Conservation  
13. Currency Acceptance, Confidence and Legal-Tender Context  
14. Currency Exchange and Conversion  
15. Barter Architecture  
16. Mixed Payments, Change and Settlement Legs  
17. Fair Value, Quote Value and Transaction Price  
18. Price-Pressure Model and Formula  
19. Modifier Families, Precedence and Caps  
20. Market-Pressure Contract With 27C  
21. Merchant Spread, Negotiation and Actor-Policy Boundaries  
22. Quantity, Bulk, Packaging and Unit Pricing  
23. Taxes, Fees, Tariffs and Assessed Value Boundary  
24. Restricted, Contraband and Illicit-Value Boundary  
25. Price Information, Confidence, Observation and Forecasts  
26. Quote Lifecycle, Reservation and Commit  
27. Price Stability, Volatility and Anti-Exploit Safeguards  
28. Inflation, Debasement, Counterfeiting and Optional Monetary Depth  
29. Trading Skill, Appraisal and Player Knowledge  
30. UI/UX, Accessibility and Player Trust  
31. Difficulty and World Settings  
32. Simulation LOD, Persistence and Multiplayer Authority  
33. Set 25 Registry, Schema and Data Contracts  
34. Godot/Summer Engine Technical Direction  
35. Validation Invariants and Acceptance Scenarios  
36. Cross-System Integration  
37. Production Classification and Rollout Guidance  
38. Risks, Redesign Triggers and Scope Controls  
39. Open Decisions for 27C-27J  
40. Cross-Set Interface Amendments  
- Appendix A. Currency and Value Record Templates  
- Appendix B. Price Formula and Modifier Reference  
- Appendix C. Economic Reason-Code Additions  
- Appendix D. 27B Completion Checklist

# 1. Locked Currency, Barter and Price Identity

Currency and price formation are the **settlement-of-value layer** of Leyforge's economy. They let unlike goods, services, risks and obligations be compared and exchanged without pretending that all contexts are identical.

> **Locked Rule**
>
> No item, service or currency definition owns one permanent executable price. Definitions may own reference-value metadata and valuation policies. A current price exists only as a contextual quote or committed transaction produced from authoritative world state.

## 1.1 Player-Facing Promise

A normal player should be able to walk up to a trader, see what the trader has, understand the price, buy or barter quickly and leave. An economy-focused player should be able to inspect why the price differs from another settlement, identify whether the information is stale, compare currency exchange, plan bulk purchases and exploit legitimate regional opportunities. The same underlying rules support both depths.

## 1.2 Identity Layers

| Layer | Meaning | Example |
| --- | --- | --- |
| Reference Value | Internal balancing anchor in RVU. | Standard iron ingot has a reference value derived from its material/production role. |
| Instance Value | Reference value adjusted for the specific stack/item state. | Damaged tool, fresh fish, pure mana crystal. |
| Contextual Fair Value | Local economic value before actor spread and transaction charges. | Iron valued highly during reconstruction. |
| Bid/Ask Policy | Actor/business willingness to buy or sell. | Merchant bids below fair value and asks above it. |
| Currency Conversion | Fair/quote value expressed in accepted settlement medium. | Quote shown in a regional coin family. |
| Fees/Tax | External charges added or deducted by valid systems. | Market fee, tariff or sales levy from 27G. |
| Price Quote | Time-bounded executable offer. | Sell 12 iron ingots for 156 coins, valid until market refresh. |
| Transaction Price | Amount actually exchanged after commit. | 156 coins transferred and 12 ingots moved. |
| Historical Observation | Recorded past price/volume. | Yesterday's average observed grain price. |

# 2. Locked Decision Summary

| Decision Area | 27B Lock |
| --- | --- |
| Universal currency | No mandatory universal currency. Widely accepted trade currencies may emerge or be authored, but acceptance is contextual. |
| Currency representation | Hybrid. Small circulating currency normally lives in a specialised purse/wallet container with balance UI; physical stacks remain possible in world/storage. |
| Inventory friction | Currency does not consume ordinary backpack slots by default. Large bullion, unrecognised coin sacks, sealed reserves and special monetary objects do. |
| Currency weight | No default coin-weight simulation because the existing inventory model is slot/capacity based. Optional harsh rules may add monetary carrying limits later. |
| Common valuation unit | Use internal Reference Value Unit (RVU). It is non-spendable, non-lore and never an account balance. |
| Barter | First-class and always representable when the counterparty accepts the offered category. |
| Barter equality | No universal exact equivalence. Receiver values each offered leg using its current bid/service valuation. |
| Mixed payment | Supported: currency + goods + later contract-backed obligations/services where the relevant owner allows them. |
| Change | Recognised circulating currencies auto-settle exact account/minor-unit change by default. Physical denomination friction is optional, not standard. |
| Price structure | Reference -> instance -> context pressure -> actor spread/concession -> taxes/fees -> conversion -> rounding. |
| Supply/demand source | 27C supplies current market-pressure signals. 27B defines how signals affect fair value. |
| Price curve | Use bounded exponential/log-space pressure mapping rather than unrestricted linear multiplication. |
| Volatility | Data-driven by commodity family; staples are more stable than luxuries/strategic goods. Crisis bands may widen with explicit reason state. |
| Negative prices | Disallowed for goods by default. Disposal/waste services can have positive service fees rather than negative item price. |
| Zero prices | Only explicit gift/free/subsidised/no-market-value cases may resolve to zero. |
| Merchant spread | Data-driven and primarily 27C-owned. 27B defines invariant ordering and recommended balance bands. |
| Social concession | Set 28 supplies bounded concession/access inputs. It may reduce actor spread or change payment options, not rewrite market fair value. |
| Inflation | Core uses regional price-level and currency-confidence state rather than a heavy macro money-supply simulation. Advanced explicit monetary inflation is optional/deferred. |
| Debasement/counterfeit | Supported by data contracts but not required for Core Production. 27I/27G/27F supply legal/institutional behaviour if activated. |
| Calculation arithmetic | Fixed-point/integer, deterministic, audit-friendly. No gameplay price is stored as an uncontrolled float. |
| Price explanation | Every non-trivial quote exposes top causes and a machine-readable reason vector. |

# 3. Scope and Explicit Non-Goals

## 3.1 In Scope

27B owns:

- reference-value metadata and authoring methodology;
- internal RVU normalisation;
- item/stack instance-value adjustment;
- currency definition requirements;
- denomination relationships;
- recognised physical-currency and purse representation;
- monetary source/sink event requirements;
- currency acceptance and exchange valuation;
- barter offer valuation;
- mixed-payment value settlement;
- contextual fair-value transformation;
- price-pressure mapping and volatility bands;
- quote composition, expiry, rounding and commitment rules;
- price observations, confidence and staleness;
- price safeguards and exploit invariants;
- value/price-facing registry fields, commands, events and reason codes.

## 3.2 Explicit Non-Goals

27B does **not** own:

- generation of supply/demand signals, market clearing or merchant stock policy - 27C;
- household consumption, wages or business profit - 27D;
- contract enforcement, escrow or service obligation lifecycle - 27E;
- lending, bank balance-sheet behaviour or insurance - 27F;
- tax rates, tariff policy, treasury budgets or money issuance policy - 27G;
- route profitability, caravan movement or transport pricing - 27H/Set 30/Set 26;
- black-market liquidity, laundering or economic warfare - 27I;
- final UI screen architecture, save migration implementation or multiplayer role UI - 27J/17/18 replacement;
- social persuasion mechanics - Set 28;
- survival-need calculations - Set 29;
- vehicle or movement physics - Set 30;
- named lore currencies not already approved by Atlas/canon.

# 4. Canonical Terminology

| Term | Definition |
| --- | --- |
| Reference Value Unit (RVU) | Internal non-spendable fixed-point unit used to normalise value for balancing and conversion. Not a currency. |
| Reference Value | Definition-level standard value in RVU under neutral assumptions. |
| Instance Value Factor | Multipliers/curves derived from the specific item's quality, condition, freshness, purity, provenance or similar state. |
| Context Pressure | Bounded signed economic pressure from market, culture, urgency, risk, access or other contextual sources. |
| Contextual Fair Value | Value after instance state and allowed context pressure, before actor spread, fees and currency conversion. |
| Bid | Amount/value an actor is currently willing to pay to acquire a good/service. |
| Ask | Amount/value an actor is currently willing to accept to sell/provide a good/service. |
| Spread | Difference between bid and ask policy around contextual fair value. |
| Quote | Time-bounded executable economic offer with item/service, quantity, payment terms, expiry and reasons. |
| Transaction Price | Final committed amount actually exchanged. |
| Currency Family | Recognised monetary unit system with issuer/authority, accounting unit, denominations and acceptance rules. |
| Denomination | Physical/display unit representing an integer ratio of the currency family's accounting minor unit. |
| Currency Purse | Specialised authoritative container for circulating currency balances/stacks, normally presented as wallet values. |
| Bullion | Valuable material held primarily by weight/amount and provenance, not automatically equal to currency face value. |
| Commodity Money | Physical commodity used as exchange medium where value comes partly or mainly from the commodity itself. |
| Legal Tender | Currency a jurisdiction recognises for specified obligations; this does not force every private actor to accept every form under all circumstances. |
| Currency Confidence | Contextual trust in an issuer/unit's convertibility, authenticity, stability and future acceptance. |
| Exchange Quote | Offer to convert one currency into another at a stated rate, spread, fee, quantity and expiry. |
| Barter Offer | Proposed exchange whose settlement value includes one or more non-currency goods/services/obligations. |
| Assessed Value | Value basis used by another system, such as tax/customs/insurance, with source and timestamp. |
| Price Observation | Recorded historical price/volume fact from a known source/time/location. |
| Price Estimate | Non-binding value range inferred from incomplete or stale information. |

# 5. Valuation Architecture and State Separation

The system uses a pipeline rather than one price field.

## 5.1 Valuation Pipeline

1. Resolve the canonical item/service/currency definition.
2. Read its reference value or reference-value policy.
3. Resolve specific quantity and instance state.
4. Apply quality/condition/freshness/purity/provenance value curves.
5. Receive current contextual pressure inputs from owning systems.
6. Convert bounded pressure into contextual fair value.
7. Apply actor/business bid/ask spread and permitted concession.
8. Add taxes, fees, tariffs or service charges from owning systems.
9. Convert into selected accepted currency or barter settlement value.
10. Apply deterministic rounding/minor-unit rules.
11. Emit a quote with expiry, reasons and reservation requirements.
12. On acceptance, revalidate stock/payment/permissions and commit atomically.
13. Record transaction price and observation/history.

## 5.2 Why the Layers Stay Separate

A definition-level reference value is useful for:

- loot and reward authoring;
- cross-recipe sanity checks;
- migration from old `base_value` fields;
- AI fallback heuristics when no market evidence exists;
- barter approximation when market knowledge is poor;
- cross-currency normalisation;
- automated validators.

It must not become a permanent shop price because it does not know current stock, local demand, route disruption, quality, law, culture, urgency or information.

# 6. Reference Value Unit and Design-Time Value

## 6.1 RVU Identity

The **Reference Value Unit (RVU)** is a hidden economic measurement unit. It is deliberately not named as a coin, faction currency or lore commodity.

Locked properties:

- cannot be owned;
- cannot be transferred;
- cannot be minted;
- cannot be displayed as a wallet balance;
- cannot satisfy a contract directly;
- uses integer/fixed-point representation;
- exists only to compare values and perform deterministic conversion;
- may be exposed in developer tools and advanced economy-debug views;
- may be hidden entirely from normal player UI.

## 6.2 Reference-Value Precision

Recommended implementation uses integer **milli-RVU** internally:

- `1000 mRVU = 1 RVU`;
- definitions normally store whole/milli RVU as integers;
- currency conversion uses rational/fixed-point rates;
- final player-facing prices round only after all authoritative calculation stages.

This avoids floating-point drift in saves, multiplayer and repeated currency conversion.

## 6.3 Reference Value Is a Neutral Baseline

Reference value assumes a neutral standard context:

- standard quality/condition;
- ordinary lawful access;
- no acute shortage or surplus;
- ordinary transport/handling burden;
- no emergency or festival demand;
- no extraordinary cultural premium;
- no social concession;
- no taxes/fees;
- no currency-confidence shock.

The value is not meant to predict what every settlement will pay.

# 7. Reference-Value Authoring by Asset Type

27B needs a repeatable way to assign reference values without converting the entire game into one giant manual price spreadsheet.

## 7.1 Raw/Gathered Resources

Reference-value evidence may include:

- typical gathering time/effort under expected progression;
- tool requirement and wear;
- source abundance/scarcity class from 25J/world data;
- renewability/regrowth;
- hazard or preparation burden;
- direct survival/production utility;
- handling/spoilage burden;
- minimum progression role.

Raw resources should not automatically become expensive merely because they occur at a later material tier. A common late-game construction resource can have lower unit value than a small rare reagent.

## 7.2 Refined Materials

Recommended anchor:

`reference output value >= consumed input reference value + standard process value - recoverable by-product value`

Process value can include authoring-standard labour, station complexity, fuel/power and yield loss. This is a balancing relationship, not an executable wage or machine cost.

## 7.3 Crafted Goods

Reference value should consider:

- input reference values;
- expected recipe yield;
- station/capability tier;
- standard production labour points;
- consumable tool/fuel costs;
- quality opportunity;
- utility/durability/service life;
- reusable component recovery where relevant.

A recipe must not create guaranteed reference-value profit simply because multiple crafting steps exist. Value-add represents useful transformation, not arbitrary tier multiplication.

## 7.4 Food and Perishables

Food value considers:

- nutrition/meal contribution from owning systems;
- ingredient value;
- preservation duration;
- preparation complexity;
- culture demand potential;
- spoilage risk.

Freshness is handled at instance-value stage rather than baked into one permanent reference number.

## 7.5 Equipment

Equipment reference value separates:

- material value;
- standard craft complexity;
- durability/service life;
- functional capability;
- socket/enchantment capacity;
- recoverable/salvage value.

Rarity labels do not automatically multiply value. Named provenance, collector demand or significance may create contextual premiums where a valid buyer exists.

## 7.6 Magical/Dimensional Goods

Reference value may incorporate:

- stabilisation/containment burden;
- known hazard;
- rarity of safe access;
- ritual/machine utility;
- purity/stability requirements;
- replacement difficulty.

The magical power system owns actual effects. 27B only values the economic implications.

## 7.7 Services

Services do not require a physical item but still receive reference-value policy. Their neutral value can consider:

- standard labour time;
- skill/certification band;
- equipment/consumables;
- risk;
- facility requirement;
- opportunity cost.

Actual wages and enterprise pricing are finalised in 27D; service contracts in 27E.

## 7.8 Unique, Relic and Singular Objects

Unique objects may use:

- broad appraisal range rather than one standard reference;
- collector/culture-specific demand;
- historical significance;
- ownership/claim/legal restrictions;
- auction/negotiated sale rather than normal commodity quote.

A legendary/relic label is not itself a numeric multiplier.

# 8. Instance Value: Quality, Condition, Freshness, Purity and Provenance

Reference value applies to a standard definition. The actual object may be better, worse, dangerous or contextually special.

## 8.1 Instance Value Formula

`instance_value = reference_value × instance_factor`

`instance_factor` is derived from category-specific curves rather than one universal rarity multiplier.

## 8.2 Supported Value Dimensions

| Dimension | Typical Economic Effect | Authority |
| --- | --- | --- |
| Quality | Better workmanship may raise service life, performance or prestige value. | Item/crafting definitions + 27B valuation curve. |
| Condition | Damage lowers usable value toward repair/salvage floor. | Item/combat/maintenance state. |
| Freshness | Perishables lose consumption/market value as spoilage advances. | Item/survival/crafting state. |
| Purity | Ore, mana, reagents and precious material may command higher/lower value. | Resource/item state. |
| Charge | Stored magical/energy value may alter utility. | Magic/item state. |
| Provenance | Legal owner, culture, named maker or verified history may affect certain buyers. | Ownership/history/culture state. |
| Authenticity | Currency, relics, documents and branded goods may be accepted, discounted or refused. | Definition + verification state. |
| Contamination/Curse | Can reduce lawful value, add handling cost or create illicit demand. | Owning hazard/magic/legal systems. |

## 8.3 Category-Specific Curves

A worn hammer, bruised fruit and cracked mana crystal should not share one condition curve. Each family may provide:

- `value_curve_id`;
- usable threshold;
- salvage floor;
- repairable flag;
- freshness/purity weighting;
- special premium caps.

# 9. Currency System Architecture

A currency is a recognised means of settlement, not merely an item with a high `base_value`.

## 9.1 Currency Definition Minimum Fields

- stable ID;
- localisation/display family;
- accounting unit;
- smallest minor unit;
- issuer/issuing authority type;
- physical/ledger/commodity representation modes;
- denomination list;
- denomination ratios;
- legal-tender jurisdictions/tags where applicable;
- default acceptance profile;
- convertibility policy;
- authenticity/purity model;
- currency-confidence hooks;
- settlement/purse compatibility;
- source/sink audit classes;
- content-pack ownership;
- migration aliases.

## 9.2 No Mandatory Universal Currency

The default architecture permits:

- settlement/local coinage;
- faction or kingdom currency;
- merchant-guild trade currency;
- commodity money;
- realm-specific tender;
- ledger money where infrastructure permits;
- barter-only contexts;
- widely accepted trade currency without making it universally mandatory.

Whether Atlas canon introduces particular named currencies is an authored-content decision outside 27B.

# 10. Currency Families, Denominations and Issuers

## 10.1 Currency Family Types

| Family Type | Description | Typical Use |
| --- | --- | --- |
| Minted Currency | Coins/tokens issued to a defined denomination standard. | Everyday settlement and regional trade. |
| Commodity Currency | Material accepted directly by amount/purity. | Frontier, metal-based or special economies. |
| Scrip/Token | Limited issuer/settlement/guild claim with bounded acceptance. | Work camps, guilds, temporary settlements, ration systems. |
| Ledger Currency | Balance exists through authorised account infrastructure. | Advanced banks, guild houses, treasuries or magical networks. |
| Reserve/Bullion Medium | High-value material used for settlement/reserves but not everyday exact change. | Treasuries, long-distance settlement, diplomatic transfers. |
| Special/Realm Tender | Context-specific medium with unusual issuer or acceptance. | Dimensions, magical institutions, special factions. |

## 10.2 Denomination Rules

Denominations are convenience representations of one accounting family.

Required rules:

- each denomination has an exact integer minor-unit ratio;
- conversion inside a family is lossless;
- ordinary wallet arithmetic uses minor units, not repeated coin conversion;
- physical display can choose sensible denominations without changing balance;
- obsolete/foreign denominations may be retained as collectible or exchangeable assets;
- denomination names are localisation/canon content, not hard-coded arithmetic.

# 11. Physical Currency, Purse, Accounts and Bullion

## 11.1 Default Purse Model

Ordinary circulating currency goes into a specialised **Currency Purse** when picked up, paid or withdrawn, unless the player deliberately keeps it as sealed cargo/container stock.

The purse:

- is authoritative storage, not a UI-only number;
- tracks currency family and minor-unit balance;
- does not consume standard backpack slots by default;
- can be inspected, transferred, deposited or stolen according to ownership rules;
- can be capped only by an optional world/equipment rule, not by default coin weight;
- persists separately from general item stacks but reconciles with physical currency containers.

## 11.2 Physical Currency in the World

Physical representation remains important for:

- treasure caches;
- chests;
- dropped loot;
- treasury vaults;
- caravan cargo;
- sealed payments;
- evidence/contraband;
- historical/foreign coinage;
- theft/raid outcomes;
- ship cargo and prize claims.

Moving a physical currency stack into a purse is a custody conversion, not duplication.

## 11.3 Bullion and Precious Materials

Gold, silver or other valuable material can serve as:

- crafting input;
- ritual material;
- cultural good;
- bullion reserve;
- commodity money;
- minted currency material.

Face value and material value remain separate. A gold coin may be worth more, less or differently than the raw gold it contains depending on issuer trust, legal status, scarcity and convertibility.

## 11.4 Ledger Accounts

Ledger accounts are not assumed in every settlement. They require a valid provider capability from later banking/public-finance systems. 27B only defines that a ledger balance must still reference a currency family and authoritative account owner.

# 12. Issuance, Minting, Destruction and Monetary Conservation

27A prohibits ghost currency. 27B formalises the monetary ledger events.

## 12.1 Valid Currency Sources

Examples of authorised source classes:

- mint/issuer issuance approved by 27G policy;
- conversion of legitimate commodity/bullion into recognised currency under an issuing rule;
- quest/world reward explicitly backed by an approved economic source class;
- migration/import of a prior valid save balance;
- admin/debug grant marked non-diegetic and excluded from normal economy analytics.

## 12.2 Valid Currency Sinks

Examples:

- destruction/loss of physical currency;
- issuer redemption/burn;
- fees/taxes paid into an owner/treasury rather than disappearing;
- explicit system sink with declared balance purpose;
- migration correction;
- invalid/counterfeit seizure where the asset is removed through authoritative legal action.

## 12.3 Monetary Audit Event

Every issuance/destruction event should log:

- event ID;
- currency family;
- minor-unit amount;
- source/sink class;
- authority;
- owner/from/to;
- reason code;
- timestamp;
- world/settlement context;
- related quest/contract/policy if any.

# 13. Currency Acceptance, Confidence and Legal-Tender Context

A currency may exist without being equally useful everywhere.

## 13.1 Acceptance Inputs

Acceptance may depend on:

- issuer recognition;
- jurisdiction;
- legal-tender rules;
- merchant/business policy;
- political relations;
- currency confidence;
- convertibility/provider access;
- authenticity/purity;
- quantity/denomination practicality;
- cultural familiarity;
- current sanctions/embargoes;
- information confidence.

## 13.2 Acceptance Result

Possible results:

- accepted at face/conversion value;
- accepted with exchange spread;
- accepted only above minimum quantity;
- accepted only through exchange service;
- accepted as commodity value only;
- accepted with authenticity/purity discount;
- refused;
- illegal/restricted to possess or transact;
- unknown/unverified.

## 13.3 Currency Confidence

`currency_confidence` is a contextual index describing expected future acceptability and convertibility. It may react to:

- issuer stability;
- convertibility/reserves;
- debasement history;
- counterfeiting prevalence;
- war/occupation;
- sanctions;
- settlement/faction trust;
- recent acceptance failures;
- redemption reliability.

It does **not** require a full real-world macroeconomic simulation.

# 14. Currency Exchange and Conversion

## 14.1 Exchange Value

Currency exchange uses RVU-normalised purchasing value plus confidence and convertibility context.

Conceptually:

`gross_exchange_rate(A->B) = contextual_value_of_A / contextual_value_of_B`

The executable exchange quote then applies:

- exchange-provider spread;
- liquidity/quantity policy;
- fees;
- legality/restriction;
- rounding;
- quote expiry.

## 14.2 No Arbitrage From Rounding

Validation must ensure that immediate deterministic round trips through the same provider/context cannot increase value solely through denomination rounding.

## 14.3 No Universal Exchange Service

A settlement may:

- have no exchanger;
- accept only local currency;
- accept foreign money directly;
- value foreign coin as material;
- use a guild/bank/magical exchanger;
- require barter instead.

## 14.4 Exchange Information

Players may know:

- exact live rate from an accessible provider;
- recent observed rate;
- estimated range;
- rumoured rate;
- no rate.

# 15. Barter Architecture

Barter is not a fallback error state. It is a legitimate exchange mode.

## 15.1 Barter Offer Structure

A barter offer may contain multiple legs:

- item stacks;
- currency;
- service promise (resolved later through 27E);
- contract/obligation (27E);
- access/permission rights only where an owning system authorises transfer;
- mixed combinations.

Each leg has:

- owner/source;
- quantity;
- condition/state;
- valuation context;
- reservation status;
- legality/permission;
- expiry if applicable.

## 15.2 Receiver-Side Valuation

Offered goods are valued using the receiver's **current bid valuation**, not the seller's ask and not the definition reference value.

This prevents a player from satisfying a 100-value ask with goods that are theoretically worth 100 but unwanted by that merchant.

## 15.3 Barter Acceptance

A barter offer is economically sufficient when:

`accepted_offer_value >= required_settlement_value`

subject to:

- category acceptance;
- stock/reserve policy;
- legality;
- capacity/storage;
- quantity limits;
- social/negotiation outcome;
- exact contract requirements.

The counterparty may still refuse economically sufficient barter for non-economic reasons supplied by Set 28/law/quest systems.

## 15.4 Barter UX

Trade UI should support:

- add/remove item stacks;
- auto-fill from accepted goods;
- show current accepted value;
- show shortfall/surplus;
- switch currency on/off;
- counteroffer;
- lock/reserve offer;
- explain refused categories;
- show value confidence if appraisal knowledge is incomplete.

# 16. Mixed Payments, Change and Settlement Legs

## 16.1 Mixed Payment

A transaction may settle through:

- one currency;
- multiple currencies if accepted;
- currency + goods;
- goods only;
- currency/goods + later obligation where 27E permits it.

## 16.2 Exact Change

Default ordinary commerce abstracts denomination handling through the purse:

- balance is stored in minor units;
- accepted currency can settle exact minor-unit amounts;
- UI may display a convenient denomination decomposition;
- the player does not manually drag coin stacks for every purchase.

Optional denomination-friction settings may require exact physical change in remote/frontier contexts, but this is not the standard experience.

## 16.3 Overpayment

Overpayment requires explicit resolution:

- change returned;
- intentional tip/gift;
- store credit/obligation only if supported;
- donation;
- refusal if no valid resolution.

No silent value deletion.

# 17. Fair Value, Quote Value and Transaction Price

## 17.1 Value States

| State | Meaning | Persistent? |
| --- | --- | --- |
| Reference Value | Neutral definition anchor. | Definition data. |
| Instance Value | Value after item state. | Derived from persistent item state. |
| Contextual Fair Value | Local/context economic value before actor policy. | Recomputed/cached. |
| Bid/Ask Quote | Executable actor offer. | Short-lived record. |
| Transaction Price | Final committed payment. | Persistent history/audit. |
| Observed Price | Historical knowledge derived from transactions/quotes. | Persistent/knowledge state. |

## 17.2 Quote Is Not Fair Value

A merchant's quote may differ from fair value because of:

- spread;
- desired margin;
- stock target;
- liquidity;
- risk;
- service cost;
- trust concession;
- taxes/fees;
- quantity;
- accepted currency.

The UI should not label every ask as "value".

# 18. Price-Pressure Model and Formula

27B uses a bounded pressure model to prevent uncontrolled multiplication of many modifiers.

## 18.1 Core Formula

Conceptual fixed-point formula:

`instance_rvu = reference_rvu × instance_factor`

`pressure_score = clamp(sum(weight_i × signal_i), -pressure_cap, +pressure_cap)`

`context_factor = 2 ^ (pressure_score × volatility_band)`

`fair_value_rvu = instance_rvu × context_factor`

`quote_rvu = fair_value_rvu × actor_policy_factor`

`final_payment = convert_currency(quote_rvu) + taxes_fees`

All runtime implementations use deterministic fixed-point equivalents rather than floating point exponentiation if that would risk platform divergence. Lookup tables or fixed-point approximation are acceptable.

## 18.2 Pressure Signal Range

Standard pressure signals use a normalised range:

- `-1.0` = strong downward pressure;
- `0.0` = neutral;
- `+1.0` = strong upward pressure.

Owning systems may produce weaker values for minor effects. Signals outside the approved range are rejected or clamped with diagnostics.

## 18.3 Why Log/Exponential Mapping

This model provides:

- symmetric increases/decreases;
- bounded percentage movement;
- easier tuning across commodity classes;
- resistance to runaway multiplication;
- readable reason decomposition;
- stable comparative behaviour.

# 19. Modifier Families, Precedence and Caps

## 19.1 Modifier Stages

| Stage | Examples | Rule |
| --- | --- | --- |
| Definition | Reference value, commodity class, volatility band. | Stable authored metadata. |
| Instance | Quality, condition, freshness, purity, authenticity. | Applied before local market pressure. |
| Market Context | Supply/demand, reserves, expected arrivals, local substitutes. | Primarily 27C inputs. |
| Spatial/Risk Context | Route disruption, handling burden, danger, remoteness. | 27H/26 inputs. |
| Culture/Strategic Context | Cultural preference, project urgency, military/ritual importance. | Relevant owning systems provide signal. |
| Law/Restriction | Legal restriction, controlled pricing, licence burden. | 27G/27I/faction law. |
| Actor Policy | Bid/ask spread, stock target, desired margin. | 27C. |
| Social Concession | Trust/relationship negotiated concession. | Set 28 input, bounded. |
| Charges | Tax, tariff, toll, market fee. | 27G/26K. |
| Currency | Acceptance, exchange spread, conversion. | 27B. |
| Rounding | Minor-unit display/settlement. | Final stage only. |

## 19.2 Anti-Double-Counting Rule

The same cause may not be applied twice under different labels.

Examples:

- route danger should not appear both inside 27C scarcity and again as a separate risk multiplier unless the two represent different effects;
- quality must not be both reference-value tier and instance premium;
- cultural demand cannot be duplicated by a merchant personality modifier;
- tax is not also a market-pressure factor unless the tax genuinely changed supply/demand over time through 27C.

# 20. Market-Pressure Contract With 27C

27C will compute market state. 27B defines the input shape it must expose.

## 20.1 Required 27C Inputs

For a given commodity/service and market context:

- `market_pressure_signal` [-1,+1];
- supply-state reason list;
- demand-state reason list;
- observed transaction volume band;
- stock/availability confidence;
- expected-arrival confidence;
- substitution pressure;
- market-state timestamp;
- volatility override state, if a declared crisis/event permits it.

27B does not dictate how 27C calculates these values beyond validation and explainability requirements.

## 20.2 Market Pressure Must Be Explainable

A `+0.72` pressure must be accompanied by causes such as:

- low accessible stock;
- high settlement reserve target;
- active construction demand;
- delayed shipment;
- limited substitutes.

# 21. Merchant Spread, Negotiation and Actor-Policy Boundaries

## 21.1 Bid/Ask Spread

The market fair value is not automatically the transaction price. Merchant/business policies define spreads.

Recommended **balance-draft** bands:

| Context | Typical One-Sided Spread |
| --- | ---: |
| Highly liquid/common market | 5-10% |
| Standard settlement merchant | 8-15% |
| Specialist/low-volume trader | 10-20% |
| Frontier/remote/low-liquidity | 15-30% |
| Crisis/illicit/special case | Data-driven, requires reason code and caps. |

These are tuning guidance, not fixed universal values. 27C owns actual merchant policies.

## 21.2 Set 28 Concession Boundary

Set 28 may return a bounded result such as:

- no concession;
- small spread reduction;
- preferred-customer spread reduction;
- better payment flexibility;
- refusal despite economic sufficiency;
- worse terms due to distrust/hostility where justified.

Set 28 may not directly alter `reference_value_rvu`, `market_pressure_signal` or currency denomination ratios.

## 21.3 No Guaranteed Persuasion Profit

Social bonuses must not permit deterministic buy-low/sell-high loops at the same counterparty under unchanged state. Spread floors and transaction-direction rules remain validated.

# 22. Quantity, Bulk, Packaging and Unit Pricing

## 22.1 Quantity Matters

Large orders can change value because they:

- consume more of limited stock;
- exceed reserve targets;
- require packaging/handling;
- qualify for bulk efficiency;
- create commitment risk;
- alter market pressure after commit.

## 22.2 Quote Bands

A quote may state:

- first 10 units at one price;
- next 40 at another;
- remainder unavailable/commission-only.

This is preferable to pretending unlimited quantity is available at one unit price.

## 22.3 Bulk Discount Safeguard

Bulk discounts cannot reduce the effective buy price below the same actor's current sell-back valuation in a way that creates immediate risk-free profit absent an explicit subsidy or market movement.

## 22.4 Packaging

Crates, sealed lots, barrels and cargo containers may change handling/transport economics but cannot silently change underlying quantity. Packaging deposit/refund rules belong to later business/contract documents where used.

# 23. Taxes, Fees, Tariffs and Assessed Value Boundary

27G owns tax policy. 27B owns how price/value communicates with it.

## 23.1 Quote Breakdown

A final quote should be able to separate:

- goods/service subtotal;
- merchant spread/margin component where shown;
- tax;
- tariff/customs;
- market/service fee;
- exchange fee;
- discount/concession;
- final amount.

## 23.2 Assessed Value

When tax/customs/insurance needs a value basis, 27B exposes:

- reference value;
- current contextual fair value;
- transaction value;
- declared value;
- appraisal value;
- confidence/timestamp.

The owning system chooses which basis is lawful/appropriate. 27B does not choose tax rates.

# 24. Restricted, Contraband and Illicit-Value Boundary

Legality can affect lawful value through:

- restricted buyer pool;
- licence costs;
- seizure risk;
- handling/storage burden;
- authenticity/claim risk;
- sanctions/embargoes.

27B may calculate a legal-risk/value input supplied by owning systems, but **27I** owns:

- black-market discovery;
- fences;
- illicit liquidity;
- laundering;
- smuggling market premiums;
- criminal economic networks;
- sanction evasion.

A prohibited item does not automatically become more valuable. It may become worthless in one market and valuable in another.

# 25. Price Information, Confidence, Observation and Forecasts

Leyforge's economy must avoid a global omniscient price oracle.

## 25.1 Information States

| State | What Player Knows |
| --- | --- |
| Live Quote | Exact current executable terms from accessible counterparty/provider. |
| Current Market Observation | Recent local range/median based on valid observations. |
| Recent | Value from a known recent time with moderate confidence. |
| Stale | Old observation; UI warns that conditions may have changed. |
| Estimated | Appraisal range derived from partial knowledge/reference value. |
| Rumoured | Low-confidence reported value from NPC/quest/info source. |
| Unknown | No useful value knowledge. |

## 25.2 Observation Record

A price observation stores:

- commodity/service/currency;
- market/counterparty/location;
- direction (bid/ask/transaction/exchange);
- quantity band;
- value/currency;
- timestamp;
- source;
- confidence;
- legality/public/private status;
- reason summary if known.

## 25.3 Forecasts

Forecasts are estimates, not promises. They may use:

- known expected deliveries;
- seasonal patterns;
- current project demand;
- route closure/opening;
- known event schedule;
- merchant expertise.

Set 28/quest systems may introduce misinformation; 27B carries confidence/provenance rather than deciding who lies.

# 26. Quote Lifecycle, Reservation and Commit

## 26.1 Quote Lifecycle

1. Player/NPC requests a quote.
2. Economy resolves market context and counterparty access.
3. Stock/payment capacity is checked.
4. Value pipeline calculates bid/ask.
5. Taxes/fees/currency conversion are resolved.
6. Quote record is issued with expiry and reason codes.
7. If the user begins confirmation, required stock/payment may be short-reserved.
8. On accept, all authoritative preconditions are revalidated.
9. Goods/currency/payment legs commit atomically.
10. Transaction event records price/quantity/parties.
11. 27C receives transaction evidence and may update market memory/pressure.
12. UI receives success/failure and new state.

## 26.2 Quote Expiry

Quotes can expire because of:

- time/cadence;
- stock change;
- market state change;
- currency confidence/exchange change;
- tax/policy change;
- relationship/access change;
- item condition/quantity change;
- route/event shock.

Minor unrelated world events should not invalidate every open trade screen.

## 26.3 Atomic Commit

A transaction is either fully committed or not committed. Failure must not leave:

- deducted currency with retained goods;
- transferred goods without payment;
- duplicated barter legs;
- partially applied taxes;
- stale reservations.

# 27. Price Stability, Volatility and Anti-Exploit Safeguards

## 27.1 Commodity Volatility Bands

**Balance-draft defaults:**

| Commodity Family | Normal Fair-Value Band vs Reference | Declared Crisis Band |
| --- | ---: | ---: |
| Basic staple / common provision | 0.50x - 2.00x | 0.25x - 4.00x |
| Common construction/industrial input | 0.40x - 2.50x | 0.20x - 5.00x |
| Specialist crafted/magical input | 0.35x - 3.00x | 0.15x - 6.00x |
| Luxury/cultural good | 0.30x - 4.00x | 0.10x - 8.00x |
| Strategic/war/rare resource | 0.30x - 4.00x | 0.10x - 10.00x |
| Unique/relic | No automatic commodity band; negotiated/appraised. | Authored rules. |

These are safeguards, not promises that every item reaches the extremes.

## 27.2 Crisis State

Wider crisis bounds require explicit contextual evidence such as:

- siege/blockade;
- famine;
- mine collapse;
- dimensional closure;
- major festival/pilgrimage;
- disaster;
- wartime mobilisation;
- severe route failure.

A random market tick cannot silently activate crisis volatility.

## 27.3 Price Floor

Normal saleable goods use a minimum positive settlement value after rounding unless:

- explicitly free/gifted;
- worthless waste with no buyer;
- transaction is a disposal service where the player pays a fee;
- subsidy covers the price through a valid external payer.

## 27.4 Anti-Arbitrage Checks

Validators/test harnesses check:

- same-merchant immediate round trip;
- cross-currency round trip;
- barter self-cycles;
- bulk rounding exploits;
- denomination conversion loops;
- tax-refund loops;
- crafting-reference-value loops;
- tiny-volume market manipulation;
- stale-quote repeat purchase;
- multiplayer double-spend.

Legitimate regional arbitrage remains desirable when it consumes time, capacity, risk or information.

## 27.5 Market Manipulation Damping

27C must weight pressure changes by meaningful volume/liquidity so one tiny transaction cannot reprice a regional market dramatically.

# 28. Inflation, Debasement, Counterfeiting and Optional Monetary Depth

## 28.1 Core Inflation Model

Core Production should represent broad monetary stress through:

- `regional_price_level_index`;
- `currency_confidence_index`;
- issuer/market events;
- exchange-rate movement;
- category-specific price pressure.

This provides understandable effects without requiring a full macroeconomic money velocity/central-bank simulation.

## 28.2 Advanced Explicit Monetary Pressure

If later enabled, 27G/27F may provide:

- currency supply growth;
- redemption/reserve ratio;
- issuer debt/credit stress;
- monetary expansion/contraction events.

27B maps those into currency confidence/price-level inputs. It does not independently run monetary policy.

## 28.3 Debasement

Optional currency definitions may distinguish:

- face value;
- material purity;
- issuer standard;
- current confidence.

Debasement can lower material value or confidence while legal-tender policy may temporarily preserve face acceptance.

## 28.4 Counterfeiting

27B provides:

- authenticity state;
- detected/undetected appraisal result;
- acceptance discount/refusal hooks;
- audit reason codes.

Crime generation, investigation, witnesses and punishment belong to Set 28/27I/legal owners.

## 28.5 Production Recommendation

- Currency authenticity field: Core-ready schema.
- Actual counterfeit gameplay: Full Release/optional candidate.
- Debasement mechanics: optional advanced economy.
- Heavy macro monetary simulation: defer unless playtesting proves it adds meaningful gameplay.

# 29. Trading Skill, Appraisal and Player Knowledge

Document 02 already establishes Trading and exploration knowledge progression. 27B consumes that progression.

Possible progression effects:

- narrower value-estimate ranges;
- longer useful observation memory;
- better identification of unusual currency;
- more detailed quote explanations;
- access to historic local price charts;
- improved recognition of purity/authenticity;
- clearer bulk/fee breakdowns;
- better forecast confidence display.

Trading skill must **not**:

- create stock;
- reveal undiscovered remote markets perfectly;
- force acceptance;
- override law;
- change market fair value merely because the player levelled up.

# 30. UI/UX, Accessibility and Player Trust

27B declares information requirements for Document 17/27J.

## 30.1 Basic Trade Presentation

The default trade screen should show:

- item/service;
- quantity;
- buy/sell direction;
- current quote;
- selected currency;
- player funds;
- merchant stock/interest;
- legality/permission warning if relevant;
- short explanation for unusual price;
- confirm/cancel.

## 30.2 Advanced Detail

Optional drill-down may show:

- reference-value category, not necessarily raw RVU;
- local fair-value estimate;
- market trend;
- spread;
- taxes/fees;
- currency exchange;
- bulk tiers;
- observation age/confidence;
- top pressure factors;
- historical transactions/graph where knowledge permits.

## 30.3 Barter UX

Barter shows:

- requested value;
- accepted value of offered goods;
- shortfall/surplus;
- refused/low-interest items;
- mixed currency contribution;
- confidence range if uncertain;
- counteroffer response.

## 30.4 Non-Colour Communication

Price trends, accepted/refused state, good/bad deal and currency confidence must not rely on red/green alone. Use text, symbols, arrows, patterns and narration labels.

## 30.5 Trust Rule

The UI must distinguish:

- **Reference/estimated value**;
- **Current fair-value estimate**;
- **Executable quote**;
- **Historical price**.

# 31. Difficulty and World Settings

Recommended settings:

| Setting | Relaxed | Standard | Harsh/Advanced |
| --- | --- | --- | --- |
| Price volatility | Lower | Standard family bands | Wider normal bands |
| Quote detail | More explanation by default | Contextual | Player preference |
| Currency acceptance | More forgiving auto-conversion | Contextual | Strong regional restrictions |
| Barter assistance | Strong auto-fill/fair-offer aid | Standard | Reduced valuation precision |
| Coin denomination friction | Off | Off | Optional |
| Counterfeiting/debasement | Off | Usually off | Optional |
| Currency carrying limits | Off | Off | Optional |
| Information staleness | Slower | Standard | Stronger |
| Market knowledge | More generous | Knowledge-based | Strict provenance |

Peaceful/creative settings should retain meaningful trade, culture goods and settlement economy without requiring punishing scarcity.

# 32. Simulation LOD, Persistence and Multiplayer Authority

## 32.1 Persistence

Persist:

- currency holdings/accounts;
- physical currency lots where applicable;
- active quotes only when needed across save boundaries;
- transaction history/audit summaries;
- currency confidence/price-level state;
- price observations/discovered information;
- reference-value definition version/migration mapping.

## 32.2 Distant Simulation

Distant economy may aggregate transactions, but it must preserve:

- net conserved goods;
- net currency transfers/authorised issuance;
- owners/organisations;
- valid price basis;
- market-pressure inputs/outputs;
- time;
- major shocks.

It should not simulate every coin denomination or every stall quote.

## 32.3 Multiplayer Authority

Server/authoritative host owns:

- purse/account balances;
- quote issuance;
- quote reservations;
- accepted barter legs;
- currency conversion;
- transaction commit;
- price-observation updates that derive from authoritative events.

Clients may preview, filter and request but never directly mutate balances.

## 32.4 Shared Organisation Funds

Organisation/company/settlement funds require role permissions defined later in 27D/27G/27J. 27B only requires every spend to identify an authorised payer account/container.

# 33. Set 25 Registry, Schema and Data Contracts

27B proposes the following registrations through Set 25's canonical kernel.

## 33.1 Definition Families

- `economy.currency.family.*`
- `economy.currency.denomination.*`
- `economy.currency.acceptance_profile.*`
- `economy.value.reference_profile.*`
- `economy.value.instance_curve.*`
- `economy.price.volatility_profile.*`
- `economy.price.quote_policy.*`
- `economy.price.rounding_profile.*`
- `economy.barter.acceptance_profile.*`

## 33.2 Runtime Record Families

- CurrencyPurseRecord
- CurrencyPhysicalLotRecord
- CurrencyAccountRecord
- CurrencyIssueEvent
- CurrencyDestroyEvent
- CurrencyExchangeQuote
- BarterOfferRecord
- PriceQuoteRecord
- TransactionPriceRecord
- PriceObservationRecord
- CurrencyConfidenceState
- RegionalPriceLevelState

## 33.3 Item Economic Facet

Candidate fields on/through an economic facet rather than copied into every owning item schema:

- `reference_value_rvu`;
- `reference_value_profile_id`;
- `commodity_class_tags`;
- `volatility_profile_id`;
- `instance_value_curve_id`;
- `barter_acceptance_tags`;
- `currency_physical_representation_id` where applicable;
- `special_appraisal_profile_id`;
- `economic_significance_tags`.

## 33.4 Field-Ownership Rule

27B owns economic interpretation fields only. It references but does not copy-author:

- item quality/condition;
- resource purity;
- food freshness;
- owner;
- faction law;
- social trust;
- merchant stock;
- tax rate;
- route travel cost.

# 34. Godot/Summer Engine Technical Direction

## 34.1 Suggested Runtime Services

- `EconomicValueService`
- `CurrencyService`
- `CurrencyExchangeService`
- `BarterValuationService`
- `PriceQuoteService`
- `EconomicObservationService`
- `EconomicAuditService`

27C and later documents add market, merchant, labour, contract, finance and public-finance services rather than expanding one monolith.

## 34.2 Deterministic Numeric Representation

Recommended:

- monetary balances: signed 64-bit integer minor units with overflow guards;
- RVU: signed 64-bit milli-RVU/fixed point;
- pressure signals: bounded fixed-point integer, e.g. `-10000..+10000`;
- multipliers: fixed-point basis points or lookup-table outputs;
- rates: rational/fixed-point with declared precision;
- timestamps: authoritative world-time units;
- no unbounded binary floating-point accumulation in persistent transaction math.

## 34.3 Commands

Examples:

- `RequestPriceQuote`
- `RequestBarterQuote`
- `AcceptPriceQuote`
- `CancelPriceQuote`
- `RequestCurrencyExchangeQuote`
- `AcceptCurrencyExchange`
- `TransferCurrency`
- `DepositPhysicalCurrency`
- `WithdrawPhysicalCurrency`
- `RecordPriceObservation`

## 34.4 Events

Examples:

- `PriceQuoteIssued`
- `PriceQuoteExpired`
- `TradeCommitted`
- `TradeRejected`
- `BarterOfferAccepted`
- `BarterOfferRejected`
- `CurrencyTransferred`
- `CurrencyIssued`
- `CurrencyDestroyed`
- `CurrencyExchanged`
- `CurrencyConfidenceChanged`
- `PriceObservationLearned`

## 34.5 Summer Engine Boundary

Summer Engine may:

- generate data templates;
- run economic fixture tests;
- compare reference values across recipe chains;
- identify arbitrage loops;
- generate validation reports;
- propose tuning changes;
- create migration tasks.

It may not be a shipped runtime model deciding a price by opaque free-form inference.

# 35. Validation Invariants and Acceptance Scenarios

## 35.1 Hard Invariants

1. No transaction creates or destroys physical goods except through an authorised transformation/source/sink.
2. No currency balance changes without an auditable transfer, issuance or destruction event.
3. Reference value is never treated as an executable global price.
4. Currency family denomination conversion is exact and lossless internally.
5. Immediate same-context currency round trips cannot profit solely from rounding.
6. Same-counterparty buy/sell loops cannot generate free value under unchanged state unless an explicit subsidy pays the difference.
7. Quote acceptance revalidates current stock, payment and permissions.
8. Expired quotes cannot silently commit.
9. Barter cannot spend the same item stack twice.
10. Market pressure must be within declared bounds and carry reason evidence.
11. Crisis volatility cannot activate without a valid crisis/reason state.
12. Taxes/fees are separately attributable and cannot be silently included twice.
13. Social concession cannot rewrite market fair value.
14. Currency purse UI balance equals authoritative stored currency state.
15. Distant simulation reconciles goods and money before promotion to detailed state.

## 35.2 Acceptance Scenario - Ordinary Village Purchase

- Merchant has 20 bread in valid stock.
- Player requests 4.
- 27C supplies mild neutral market pressure.
- 27B forms ask quote in accepted local currency.
- Quote explains normal supply and standard merchant spread.
- Player accepts.
- Four bread and exact currency transfer atomically.
- Merchant stock becomes 16; transaction observation records.

## 35.3 Acceptance Scenario - Reconstruction Iron Shortage

- Raid damages settlement walls.
- Project demand and reserve policy increase iron pressure through 27C.
- 27B maps pressure into a higher contextual fair value within the industrial crisis band.
- UI shows "High: reconstruction demand + low local stock".
- Trader's quote changes, but reference value does not.
- When supply returns, market pressure decays through 27C and prices recover gradually.

## 35.4 Acceptance Scenario - Foreign Currency

- Player arrives with a recognised neighbouring currency.
- Merchant does not directly accept it.
- Local exchanger provides rate with confidence/spread/fee.
- Player converts part of balance.
- Currency amounts transfer without item duplication.
- If no exchanger exists, merchant may accept as commodity or require barter.

## 35.5 Acceptance Scenario - Barter

- Player wants a tool priced at 120 local minor units.
- Offers grain, leather and 30 currency.
- Merchant values offered goods at current bids, not reference value.
- Grain is discounted due to excess stock; leather is desired.
- UI shows accepted value and remaining shortfall.
- Player adds one additional leather stack.
- All legs reserve and commit atomically.

## 35.6 Acceptance Scenario - Stale Price Information

- Player observed mana crystal prices three days ago in another town.
- Route was later disrupted.
- Map/economy view labels old observation as stale rather than updating magically.
- Arrival/current quote reveals higher price with route-disruption explanation.

## 35.7 Acceptance Scenario - Bulk Purchase

- Player requests all 200 units from a merchant with reserve target 80.
- Quote service returns quantity tiers or refuses quantity above sellable stock.
- The first units do not imply unlimited same-price supply.
- On purchase, 27C updates stock/market state for subsequent quotes.

## 35.8 Acceptance Scenario - Multiplayer Race

- Two clients request quote for the same last rare item.
- Both may receive quotes while stock exists.
- First accepted transaction reserves/commits item.
- Second acceptance fails with `ECON_QUOTE_STOCK_CHANGED` and no currency loss.

# 36. Cross-System Integration

| System | Supplies to 27B | Receives from 27B |
| --- | --- | --- |
| Items/Resources | identity, quantity, quality, condition, purity, freshness, provenance | reference-value facet, appraisal/value result |
| Recipes/Automation | inputs, outputs, yields, processing requirements, actual supply | valuation sanity checks; transaction demand signals later through 27C |
| NPC/Settlement | merchant/owner identity, stock, permissions, services | quotes, currency/payment values, barter sufficiency |
| Factions/Law | jurisdiction, legal tender, restriction, sanctions | accepted currency/value basis, assessed value |
| Quests/Events | economic need, reward authority, event state | quote/payment values, price observations, reason codes |
| Set 28 | trust/relationship/negotiation result | economic concession bounds and visible economic terms |
| Set 29 | consumption/health demand via owning market systems | affordability/value information only |
| Set 30 | transport outputs consumed mainly by 27H | value basis for cargo/vehicle transactions |
| Set 26 | cargo/port/voyage state, maritime tariffs/risks | universal currency, fair value, quote/exchange interfaces |
| 27C | market pressure, stock policy, merchant spread | fair-value mapping, quote pipeline and price observations |
| 27G | tax/tariff/fee rates and policy | assessed value and quote subtotal |
| 27I | illicit legality/risk/liquidity state | lawful/illicit valuation interfaces |

# 37. Production Classification and Rollout Guidance

Final classification belongs to Set 25. 27B recommends:

## Core Production Candidate

- RVU/reference-value data;
- local currency family support;
- specialised purse;
- one or more authored currency definitions as content requires;
- barter;
- mixed currency+goods payment;
- contextual fair-value calculation;
- market-pressure mapping;
- quote lifecycle;
- price explanations;
- deterministic rounding;
- currency exchange interface;
- price observations;
- multiplayer transaction authority;
- anti-arbitrage validators.

## Core Conditional / Early Expansion

- multiple concurrent currencies;
- exchange-service buildings;
- richer appraisal progression;
- regional price charts;
- commodity/bullion settlement;
- ledger accounts.

## Full Release / Optional Advanced

- debasement;
- active counterfeiting gameplay;
- denomination-friction mode;
- advanced monetary inflation;
- complex currency crises/speculation.

# 38. Risks, Redesign Triggers and Scope Controls

| Risk | Consequence | Control / Trigger |
| --- | --- | --- |
| Reference value becomes hidden global price | Economy stops reacting to world state. | Validator checks quotes use contextual stages; UI labels estimates correctly. |
| Too many currencies create friction | Players avoid trade. | Purse aggregation, auto-conversion where service exists, widely accepted trade currencies allowed. |
| Currency removes resource identity | Everything becomes coin farming. | Physical demand, barter, stock limits, project consumption and no currency substitute for capability. |
| Barter becomes spreadsheet tedium | Normal trade feels slow. | Auto-fill, accepted-value meter, presets and simple default trade flow. |
| Price model becomes opaque | Player cannot plan. | Bounded reasons, top-factor explanations, stable bands and trend observations. |
| Price model too stable | Regional trade has no purpose. | Commodity-specific volatility and real route/shortage signals. |
| Price model too volatile | Arbitrage feels random. | Bounded pressure, crisis gating and market memory. |
| Merchant spread duplicates social modifiers | Unclear terms/exploits. | Social concession applies only at actor-policy stage. |
| Cross-currency rounding generates money | Infinite arbitrage. | Fixed-point conversion and round-trip validators. |
| Tiny trades manipulate market | Easy exploit. | 27C volume/liquidity weighting. |
| Counterfeit system bloats Core | Too much complexity before main loop works. | Schema support now; gameplay optional/later. |
| Purse abstraction breaks physical economy | Money becomes magic number. | Purse is authoritative container; physical deposit/withdrawal reconciles. |
| Advanced inflation becomes economics simulator | Scope drifts from sandbox. | Use confidence/price-level summaries; deeper macro model only if playtests justify. |

# 39. Open Decisions for 27C-27J

27B resolves 27A open decisions 1-4 and 15-16 at the architecture/default level. The following remain for later documents:

1. Exact merchant spread profiles, reserve policy and markup defaults - 27C.
2. Exact market clearing/update cadence - 27C.
3. Household income/consumption aggregation - 27D.
4. Rent/property-economy scope - 27D.
5. Wage cadence and non-currency compensation - 27D.
6. Contract escrow/deposit defaults - 27E.
7. Interest model/compound interest - 27F.
8. Banking availability/capability tiers - 27F.
9. Insurance launch scope - 27F.
10. Taxation granularity and player policy presets - 27G.
11. Exact issuer/minting policy and public monetary authority - 27G/27F.
12. Route-profit formula/risk pricing - 27H.
13. Caravan ownership/crew economics - 27H + Set 30.
14. Cross-realm exchange/portal fees - 27H.
15. Monopoly concentration thresholds - 27I.
16. Black-market liquidity/premiums - 27I + Set 28/legal interfaces.
17. Bankruptcy/enterprise closure - 27D/27F.
18. Shared-company/treasury permissions - 27J.
19. Final Core/Early Access/Full Release classification - Set 25 final integration.

# 40. Cross-Set Interface Amendments

The Sets 27-30 Cross-Set Interface Register v1.0 and amendments recorded in 27A remain governing. 27B proposes one clarification.

## Amendment 27B-IFACE-005 - Social Economic Concession Result

**Reason:** Price formation needs a clean boundary between economic fair value and Set 28 social negotiation.

**Set 28 supplies to Set 27:**

- `economic_concession_class`;
- bounded `spread_adjustment` or equivalent approved economic term;
- payment-option/access changes;
- refusal/acceptance social outcome;
- source/reason and confidence where relevant.

**Set 27 remains authoritative for:**

- reference value;
- instance value;
- market pressure;
- fair value;
- currency conversion;
- merchant spread policy;
- taxes/fees integration;
- executable quote and transaction price.

**Constraint:** Set 28 may change the negotiated terms offered by an actor but may not rewrite the market's underlying fair value or create stock/currency.

# Appendix A. Currency and Value Record Templates

## A.1 CurrencyDefinition

| Field | Type / Meaning |
| --- | --- |
| id | Stable Set 25 ID |
| display_key | Localisation key |
| issuer_ref | Issuer/policy owner reference |
| accounting_minor_unit | Integer accounting basis |
| representation_modes | physical / purse / ledger / commodity |
| denomination_refs | Ordered denomination definitions |
| legal_tender_tags | Jurisdiction/application tags |
| acceptance_profile_id | Default contextual acceptance policy |
| convertibility_profile_id | Exchange rules/provider requirements |
| authenticity_profile_id | Optional verification/purity model |
| confidence_profile_id | Currency-confidence behaviour |
| pack_id | Content package |
| schema_version | Migration/version |

## A.2 PriceQuoteRecord

| Field | Meaning |
| --- | --- |
| quote_id | Unique runtime ID |
| issuer_actor_or_business | Counterparty |
| direction | buy / sell / service / exchange |
| subject_ref | Item/service/currency |
| quantity | Quoted quantity |
| item_state_hash | State used for valuation |
| market_context_ref | Market scope/source |
| fair_value_rvu | Pre-spread contextual value |
| actor_policy_adjustment | Spread/margin/concession summary |
| tax_fee_lines | External charges |
| currency_id | Settlement currency |
| final_minor_units | Final executable amount |
| expires_at | World timestamp/invalidator |
| reservation_ref | Optional short reservation |
| reason_codes | Explainability vector |
| info_confidence | Confidence/source quality |

## A.3 BarterOfferRecord

| Field | Meaning |
| --- | --- |
| offer_id | Unique runtime ID |
| requesting_party | Party seeking good/service |
| receiving_party | Counterparty |
| requested_subjects | Goods/services being acquired |
| offered_legs | Currency/item/service/obligation legs |
| accepted_value_rvu | Receiver-side valuation |
| required_value_rvu | Required settlement threshold |
| shortfall_rvu | Remaining value gap |
| reservations | Source reservations |
| expires_at | Offer expiry |
| reason_codes | Refusal/discount/acceptance reasons |

# Appendix B. Price Formula and Modifier Reference

## B.1 Recommended Calculation Order

1. `reference_value_rvu`
2. `quantity`
3. item-instance curve
4. market pressure from 27C
5. spatial/risk/culture/law pressure inputs
6. pressure cap + volatility mapping
7. contextual fair value
8. actor bid/ask spread
9. Set 28 concession
10. quantity/bulk policy
11. taxes/tariffs/fees
12. currency acceptance/conversion
13. deterministic rounding
14. quote validity/reservation

## B.2 Reason-Factor Examples

Upward:

- `ECON_PRICE_LOW_STOCK`
- `ECON_PRICE_HIGH_DEMAND`
- `ECON_PRICE_PROJECT_URGENCY`
- `ECON_PRICE_ROUTE_DISRUPTION`
- `ECON_PRICE_CULTURE_PREFERENCE`
- `ECON_PRICE_STRATEGIC_RESERVE`
- `ECON_PRICE_LEGAL_RISK`
- `ECON_PRICE_HIGH_QUALITY`

Downward:

- `ECON_PRICE_SURPLUS`
- `ECON_PRICE_EXPECTED_ARRIVAL`
- `ECON_PRICE_LOW_DEMAND`
- `ECON_PRICE_POOR_CONDITION`
- `ECON_PRICE_LOW_FRESHNESS`
- `ECON_PRICE_SUBSTITUTE_AVAILABLE`
- `ECON_PRICE_BULK_EFFICIENCY`

# Appendix C. Economic Reason-Code Additions

| Code | Meaning |
| --- | --- |
| ECON_CURRENCY_NOT_ACCEPTED | Selected currency is not accepted in current context. |
| ECON_CURRENCY_EXCHANGE_REQUIRED | Currency must be converted through a valid provider. |
| ECON_CURRENCY_LOW_CONFIDENCE | Currency receives discounted/limited acceptance. |
| ECON_CURRENCY_AUTHENTICITY_UNKNOWN | Currency authenticity cannot be verified. |
| ECON_CURRENCY_INSUFFICIENT_FUNDS | Authoritative balance is too low. |
| ECON_QUOTE_EXPIRED | Quote is outside validity window. |
| ECON_QUOTE_STOCK_CHANGED | Required stock changed before commit. |
| ECON_QUOTE_PAYMENT_CHANGED | Payment source changed before commit. |
| ECON_QUOTE_CONTEXT_CHANGED | Material market/policy context invalidated quote. |
| ECON_BARTER_ITEM_REFUSED | Counterparty does not accept offered item/category. |
| ECON_BARTER_INSUFFICIENT_VALUE | Accepted receiver-side value is below required amount. |
| ECON_BARTER_CAPACITY_BLOCKED | Counterparty cannot store/use offered quantity. |
| ECON_PRICE_STALE_INFO | Displayed observation is no longer current. |
| ECON_PRICE_CRISIS_BAND | Quote uses declared crisis-volatility bounds. |
| ECON_PRICE_REFERENCE_ONLY | Value shown is an estimate/reference, not executable quote. |
| ECON_PRICE_SUBSIDY_APPLIED | External valid payer covers part of transaction. |
| ECON_PRICE_TAX_FEE_APPLIED | External charge contributes to final payment. |
| ECON_PRICE_CONCESSION_APPLIED | Set 28/actor concession altered spread/terms. |
| ECON_TRANSACTION_ATOMIC_RETRY | Transaction must retry due to concurrent state change. |

# Appendix D. 27B Completion Checklist

- [x] Adopted 27A and Sets 27-30 ownership contracts.
- [x] Resolved universal/common-currency architecture.
- [x] Resolved purse/physical-currency default.
- [x] Defined barter as first-class exchange.
- [x] Defined internal RVU without creating a hidden spendable currency.
- [x] Separated reference value, instance value, fair value, quote and transaction price.
- [x] Defined bounded deterministic price-pressure model.
- [x] Defined commodity volatility and crisis safeguards.
- [x] Preserved 27C ownership of supply/demand/merchant simulation.
- [x] Preserved Set 28 ownership of social negotiation.
- [x] Preserved 27G ownership of taxes/tariffs and 27I ownership of illicit markets.
- [x] Defined currency acceptance/exchange and anti-arbitrage rules.
- [x] Defined quote lifecycle and atomic settlement.
- [x] Defined information confidence and price-observation rules.
- [x] Defined Set 25 registry/data contracts.
- [x] Defined Godot deterministic arithmetic direction.
- [x] Added validation scenarios and reason codes.
- [x] Recorded cross-set interface amendment.
- [x] Handed off market simulation to 27C.
