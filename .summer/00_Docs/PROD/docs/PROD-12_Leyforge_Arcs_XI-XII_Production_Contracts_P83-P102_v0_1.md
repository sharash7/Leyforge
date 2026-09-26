
# LEYFORGE PRODUCTION PROGRAMME

## PROD-12 — Arcs XI–XII Production Contracts: P83–P102

**Document ID:** PROD-12  
**Title:** Leyforge Arcs XI–XII Production Contracts — Roads of Gold & Dust / Crowns & Consequences  
**Version:** v0.1  
**Date:** 21 September 2026  
**Status:** **LOCKED — OWNER-APPROVED PRODUCTION AUTHORITY**  
**Project:** Leyforge  
**Product context:** Ley Realms / The Forge  
**Programme:** PROD — Detailed Production Plan & Implementation Handoff  
**Constitutional parent:** PROD-00 — Production Constitution, Authority & Scope  
**Source-routing parent:** PROD-01 — Legacy Canon & Source Crosswalk  
**Roadmap parent:** PROD-02 — Master Production Roadmap & Dependency Atlas  
**Runtime parent:** PROD-03 — Leyforge Runtime Engineering Architecture  
**Forge parent:** PROD-04 — The Forge Engineering & Creation Journey Architecture  
**Cross-system parent:** PROD-05 — Universal Simulation Primitives & Cross-System Contracts  
**Governance parent:** PROD-06 — Production Governance, Task Contracts & Evidence Standard  
**Previous executable volumes:** PROD-07 through PROD-11  
**Arc scope:** ARC XI — ROADS OF GOLD & DUST / ARC XII — CROWNS & CONSEQUENCES  
**Parent slices:** P83–P102  
**Programme gates:** PG-11 Regional Economy & Trade Foundation, PG-12 Society, Governance & Conflict Foundation  
**Primary downstream consumers:** ProductionRegistry, Project Brain, Task Contracts, Codex/coding agents, CI, runtime/Forge implementation, PROD-13 onward

---

# 00. Executive Arc Statement

PROD-12 takes Leyforge from a world of functioning local settlements into a world of interacting civilisations.

ARC XI gives settlements reasons to care about one another economically.

ARC XII gives them reasons to care about one another politically.

The central promise of ARC XI is:

> **Trade moves real goods through real routes between real settlements, and prices/shortages emerge from actual production, stock, demand, risk and access rather than invisible game-economy numbers.**

The central promise of ARC XII is:

> **Societies have persistent identities, governments, laws, claims, treaties, militaries and historical consequences without collapsing ancestry, culture, faction and morality into one label.**

The combined progression is:

```text
LOCAL STOCK
→ VALUE / EXCHANGE
→ COMMERCE FORGE
→ MARKETS
→ CARTS / MOUNTS
→ REGIONAL ROUTES
→ CARAVANS
→ ROUTE EVENTS
→ FREIGHT
→ REGIONAL ECONOMY
→ TRADE NETWORK
→ SOCIETY / CULTURE / FACTION CONTRACT
→ FACTION FORGE
→ GOVERNMENT / LAW FORGE
→ CIVIC RUNTIME
→ TERRITORY / JURISDICTION
→ DIPLOMACY
→ MUSTER / WAR LOGISTICS
→ WAR / RAID / SIEGE
→ OCCUPATION / RECONSTRUCTION
→ POLITICAL CONSEQUENCE
```

By the end of P92, settlements can exchange goods, specialise and affect one another through regional trade.

By the end of P102, settlements and factions can cooperate, compete, negotiate, fight, occupy, rebuild and remember why.

---

# 01. Governing Production Rules for P83–P102

## 01.1 Economy remains grounded in physical stock

Leyforge does not create a second abstract economy inventory.

Authoritative economic goods remain in:

- player inventories;
- merchant inventories;
- warehouses;
- caravan cargo;
- workplace buffers;
- settlement stock;
- trade depots.

Regional simulations may aggregate quantities while unloaded, but they must reconcile to authoritative stock/state.

## 01.2 Currency is a resource, not permission to print value

Where coin/currency is used:

- it has registered identity;
- ownership;
- quantity;
- source/sink;
- transaction history where required.

Currency does not bypass:

- availability;
- ownership;
- law;
- capacity;
- route access;
- trade permission.

## 01.3 Barter and currency share one exchange contract

An exchange is fundamentally:

```text
party A gives X
party B gives Y
conditions validate
→ commit atomically
```

Y may be:

- currency;
- goods;
- service entitlement;
- contract obligation;
- reputation/permission only where an owning system explicitly permits such a non-stock consequence.

Do not write separate incompatible barter and shop systems.

## 01.4 Prices are contextual, not universal truth

Price/valuation may consider:

- local stock;
- demand;
- scarcity;
- production cost;
- culture preference;
- relationship/reputation;
- law/tax;
- route risk;
- season/event;
- quality/condition.

A merchant price is an offer in context, not the universe declaring an item's objective value.

## 01.5 Markets do not create stock

A market stall with no goods has nothing to sell.

A “market capacity” number is not inventory.

Visual goods are presentation of real stock where practical.

## 01.6 Contracts reserve real capacity/resources

Trade/freight contracts must define:

- parties;
- goods/services;
- quantity;
- source;
- destination;
- price/reward;
- route/time window;
- ownership/permission;
- failure/cancellation;
- reservation.

Accepted contracts cannot silently reserve the same exclusive goods twice.

## 01.7 The Route primitive scales from local path to regional corridor

P87 builds the regional use of the shared Route primitive.

A route may represent:

- origin;
- destination;
- segments;
- mode;
- capacity;
- cost/time;
- danger;
- condition;
- ownership/access;
- current disruption.

Local physical navigation and regional abstract routing can differ in implementation while sharing semantic identity.

## 01.8 Vehicles and pack animals are not teleport capacity

Carts, wagons, mounts and pack animals are real:

- entities/vehicles;
- cargo carriers;
- equipment consumers;
- route users;
- maintenance/resource consumers.

Their visual presence may simplify at distance, but cargo capacity remains authoritative.

## 01.9 Caravan cargo stays real through LOD

A caravan summary may reduce:

- individual wheel motion;
- exact footstep paths;
- nearby steering.

It may not forget:

- people;
- cargo;
- ownership;
- route;
- danger;
- current event;
- damage;
- destination.

## 01.10 Route danger does not mean arbitrary random deletion

If goods are lost:

- a raid;
- accident;
- spoilage;
- weather event;
- abandonment;
- theft;
- explicit world-loss event

must own that outcome.

No `danger_roll = 0.2 → delete 30 grain` without a governed event/result record.

## 01.11 The regional economy is a bounded simulation

P91 does not simulate every hypothetical shopper transaction in every unloaded town.

It preserves meaningful quantities and pressures through:

- production;
- consumption;
- stock;
- contracts;
- trade flows;
- shortages;
- route capacity;
- price/offer summaries;
- events.

Detailed transactions occur where needed.

## 01.12 Ancestry, people, culture, faction, government and faith remain separate

P93 formalises distinct concepts.

A person can simultaneously have:

- ancestry/body heritage;
- cultural identity;
- settlement membership;
- faction membership;
- profession;
- faith/philosophy;
- legal status;
- government citizenship/subjecthood;
- household;
- personal relationships.

None automatically determines the others unless canon explicitly creates that relation.

## 01.13 Hostility is never inherited biologically

No ancestry or body family is inherently hostile because of appearance/species.

Hostility arises from:

- individual behaviour;
- faction relation;
- event;
- crime/law;
- war;
- creature ecology;
- scripted/canonical supernatural condition where appropriate.

## 01.14 Culture is not faction

A culture can contain:

- multiple factions;
- rival governments;
- peaceful/hostile subgroups;
- mixed settlements.

A faction can span multiple cultures.

## 01.15 Government is not culture

A culture may exist under:

- different governments;
- occupation;
- diaspora;
- reform;
- federation.

Government controls institutional authority, not cultural identity.

## 01.16 Permission and jurisdiction use one universal contract

The governing evaluation shape is:

```text
actor
+ requested action
+ target/object
+ location
+ current authority/jurisdiction
+ law/permission evidence
→ allowed / denied / conditional
```

This contract is reused by:

- warehouses;
- markets;
- roads;
- gates;
- settlements;
- factions;
- military;
- territory;
- portals later;
- multiplayer later.

## 01.17 Territory distinguishes claim, administration and control

These are not automatically identical.

A faction may:

- claim territory;
- legally administer it;
- physically control it;
- occupy it;
- dispute it;
- share access through treaty.

Political maps should be capable of showing uncertainty/dispute rather than painting every block one colour.

## 01.18 Reputation is evidence, not diplomacy itself

Diplomacy may consider standing/reputation, but treaty state and faction relations remain explicit.

A high reputation score cannot silently create a defence pact.

## 01.19 War requires logistics

Armies consume:

- food;
- equipment;
- ammunition where relevant;
- mounts/vehicles;
- medicine;
- repair supply;
- route capacity;
- labour.

A faction cannot project unlimited military force merely because a war flag is true.

## 01.20 War has objectives and aftermath

Conflict is not endless enemy spawning.

War/raid/siege objectives can include:

- territory;
- route;
- resource;
- leadership;
- fortification;
- warehouse;
- settlement;
- ritual/portal;
- liberation;
- defence.

Outcomes create persistent:

- casualties;
- damage;
- occupation;
- migration;
- shortages;
- treaties;
- resentment;
- reconstruction;
- history.

## 01.21 Occupation does not equal instant cultural assimilation

Occupation may change:

- public authority;
- law;
- checkpoints;
- taxes;
- banners;
- military access;
- public buildings.

It does not instantly change:

- ancestry;
- personal identity;
- culture;
- private ownership;
- memory;
- belief.

## 01.22 Private goods remain distinct under conquest

Capture of a settlement/government does not automatically transfer every private inventory.

Ownership and legal seizure/requisition are explicit consequences.

## 01.23 Reconstruction uses real work/resources

Post-war repair follows normal:

- Structure state;
- Project;
- Profession;
- Warehouse;
- Hauling;
- Resource;
- History

systems.

## 01.24 Historical memory survives the end of war

People and settlements can remember:

- attack;
- defence;
- occupation;
- aid;
- betrayal;
- treaty;
- liberation;
- reconstruction.

These records later feed P142+ memory/history systems rather than being discarded after the combat event ends.

---

# 02. Common Evidence Rules for This Volume

ARC XI requires strong evidence around:

- atomic exchange;
- merchant stock;
- price explanation;
- route identity;
- cargo conservation;
- caravan LOD;
- route disruption;
- freight commitments;
- market/regional economic reconciliation.

ARC XII requires strong evidence around:

- identity separation;
- faction/government/law authoring;
- permission/jurisdiction;
- claims/control;
- treaty state;
- military supply;
- siege/war consequences;
- occupation;
- reconstruction;
- history.

---

# 03. ARC XI — ROADS OF GOLD & DUST

---

# P83 — WHAT IS IT WORTH?

**Classification:** FOUNDATION  
**Arc:** ARC XI — ROADS OF GOLD & DUST  
**Player/creator payoff:** Goods gain contextual value and can be exchanged safely without creating a fake second economy.

## P83.1 Purpose

Create the Economy & Exchange Contract.

## P83.2 Authoritative source packet

- Set 27 Economy, Trade & Commerce;
- current Items/Resource registries;
- P13 Inventory;
- P53 Warehouse;
- P55/P63 settlement production;
- PROD-05 Transaction/Ownership/Permission;
- culture preference/economy hooks.

## P83.3 Entry gate

- PG-10 COMPLETE;
- settlement stock/production mature enough to create surplus/shortage.

## P83.4 Dependencies

P13, P53, P63, P82.

## P83.5 Universal primitives used

- Identity;
- Ownership;
- Transaction;
- Reservation;
- Permission;
- Knowledge;
- Result/Reason;
- History hook.

## P83.6 In scope

Economy/exchange base:

- trade-good identity;
- currency identity;
- ownership;
- quality/condition hook;
- exchange offer;
- requested consideration;
- quantity;
- price/valuation context;
- barter;
- currency purchase;
- tax/customs hook;
- relationship modifier hook;
- legal/illegal/contraband hook;
- reservation;
- atomic commit;
- cancellation;
- receipt/history hook;
- price/offer reason breakdown.

## P83.7 Explicit non-scope

- Commerce Forge;
- merchants;
- markets;
- regional market simulation;
- banking/loans;
- stock exchange;
- complex inflation modelling.

## P83.8 Implementation capability requirements

Exchange:

```text
validate both parties
→ validate ownership
→ validate permission
→ reserve goods/currency/capacity
→ commit both sides
→ record result
```

If one side fails, the transaction fails atomically.

## P83.9 Forge requirements

P84 consumes the contract.

## P83.10 Runtime requirements

Exchange service operates on authoritative inventory/warehouse stock.

## P83.11 Canonical content subset

- common resource;
- crafted good;
- food/trade good;
- silver trade coin or current canonical currency fixture.

## P83.12 Persistence implications

Committed transactions persist through resulting ownership/stock.

Optional receipts/history stored according to scope.

## P83.13 Multiplayer / authority implications

Exchange future server-authoritative.

## P83.14 Simulation-LOD implications

Detailed offers local; aggregate trade flow later.

## P83.15 Accessibility / localisation implications

Trade UI clearly distinguishes:

- owned;
- offered;
- requested;
- reserved;
- unavailable;
- legal restrictions.

## P83.16 Performance implications

Offer evaluation bounded.

## P83.17 Security / trust implications

Double-spend/replay/negative quantity tests mandatory.

## P83.18 Recommended child decomposition

- P83-A — economy/value context;
- P83-B — exchange offer;
- P83-C — barter/currency transaction;
- P83-D — permission/tax hooks;
- P83-E — reason/receipt/security tests;
- P83-F — reconciliation.

## P83.19 Acceptance matrix

| ID | Requirement | Evidence | Gate |
| --- | --- | --- | --- |
| P83-AC01 | Exchange moves real goods/currency atomically | EV-B | Required |
| P83-AC02 | Failed second-side commit does not lose first-side goods | EV-B negative | Required |
| P83-AC03 | Capacity does not create sale stock | EV-B | Required |
| P83-AC04 | Price/offer can expose contributing context | EV-C | Required |
| P83-AC05 | Barter and currency use shared exchange contract | EV-A / EV-B | Required |
| P83-AC06 | Permission/contraband hook can deny trade safely | EV-B | Required |
| P83-AC07 | Replayed transaction cannot double-spend | EV-B negative | Required |
| P83-AC08 | Final SHA/CI passes | EV-H | Required |

## P83.20 Negative tests

- seller lacks item;
- buyer lacks currency;
- buyer capacity full;
- duplicate transaction ID;
- illegal/contraband denial;
- price changes after reservation according to explicit policy.

## P83.21 Manual acceptance scenario

Trade common goods by barter.

Buy another item with currency.

Attempt insufficient funds/stock.

Inspect clear reason.

## P83.22 Rule-of-cool target

The first meaningful:

> **“This town has something I need, and I have something they value.”**

## P83.23 Exit gate

Safe contextual exchange exists.

## P83.24 Downstream unlock

P84/P85.

## P83.25 Known risks / ADR triggers

- price model;
- currency persistence/audit requirements.

---

# P84 — THE MERCHANT'S LEDGER

**Classification:** FORGE-FIRST  
**Arc:** ARC XI  
**Player/creator payoff:** Merchants, trade goods, contracts and commerce profiles can be authored through The Forge.

## P84.1 Purpose

Create Commerce Forge v1.

## P84.2 Authoritative source packet

- Set 27;
- P83;
- P49/P50 professions;
- P37 dialogue;
- P53 warehouses;
- ART-08 commerce UI.

## P84.3 Entry gate

- P83 COMPLETE.

## P84.4 Dependencies

P50/P53/P83.

## P84.5 Universal primitives used

- Identity;
- Transaction;
- Reservation;
- Permission;
- Knowledge;
- Provenance;
- Result/Reason.

## P84.6 In scope

Commerce Forge can author:

### Merchant profile

- identity/role;
- profession requirements;
- accepted goods;
- preferred goods;
- refused/contraband goods;
- stock source;
- buy/sell rules;
- price-context profile;
- relationship/reputation hooks;
- opening/availability;
- settlement/faction affiliation;
- dialogue profile;
- trade permission.

### Trade-good profile

- category;
- cultural demand hook;
- perishability hook;
- legal status hook;
- quality/condition value hook.

### Contract profile

- source/destination;
- quantity;
- deadline;
- reward/payment;
- penalty/failure;
- required route/mode;
- reputation/legal hooks;
- reservation policy.

## P84.7 Explicit non-scope

- final regional economy;
- banking;
- insurance;
- auction houses;
- arbitrary merchant scripting.

## P84.8 Implementation capability requirements

Merchant stock references real:

- personal inventory;
- stall/store inventory;
- warehouse allocation.

## P84.9 Forge requirements

Specialist workflow over Item/Profession/Dialogue/Structure/UI services.

## P84.10 Runtime requirements

P85 consumes profiles.

## P84.11 Canonical content subset

- general merchant;
- food merchant;
- material merchant;
- one delivery contract family.

## P84.12 Persistence implications

Merchant stock/profile affiliation/active contracts persist.

## P84.13 Multiplayer / authority implications

Authoritative transactions.

## P84.14 Simulation-LOD implications

Merchant profile persists; local display only when active.

## P84.15 Accessibility / localisation implications

Price reasons, unavailable/illegal states, contract conditions localisable.

## P84.16 Performance implications

Large catalogue filtering bounded.

## P84.17 Security / trust implications

No arbitrary expression/script.

## P84.18 Recommended child decomposition

- P84-A — merchant profile source;
- P84-B — trade-good/value profile;
- P84-C — contract profile;
- P84-D — Commerce Forge UI;
- P84-E — validation/Test Lab;
- P84-F — reconciliation.

## P84.19 Acceptance matrix

| ID | Requirement | Evidence | Gate |
| --- | --- | --- | --- |
| P84-AC01 | Merchant profile authored/validated in Forge | EV-B / EV-C | Required |
| P84-AC02 | Merchant stock source resolves real inventory | EV-B | Required |
| P84-AC03 | Contract profile creates explicit source/destination/quantity/terms | EV-B | Required |
| P84-AC04 | Cultural/faction preference remains data hook, not hard-coded ancestry rule | EV-A / review | Required |
| P84-AC05 | Contraband/legal profile can be represented without arbitrary code | EV-B | Required |
| P84-AC06 | Invalid stock/source/contract references fail validation | EV-B negative | Required |
| P84-AC07 | Final SHA/CI passes | EV-H | Required |

## P84.20 Negative tests

- missing stock source;
- invalid good;
- impossible contract destination;
- illegal price modifier reference;
- duplicate contract identity.

## P84.21 Manual acceptance scenario

Create merchant profile.

Assign real shop stock.

Author delivery contract.

Launch Commerce Test Lab.

## P84.22 Rule-of-cool target

The Forge can now author:

> **someone whose actual job is commerce.**

## P84.23 Exit gate

Commerce source pipeline exists.

## P84.24 Downstream unlock

P85/P88/P90.

## P84.25 Known risks / ADR triggers

- offer/pricing authoring complexity.

---

# P85 — MARKET DAY

**Classification:** COOL-PULL / INTEGRATION  
**Arc:** ARC XI  
**Player/creator payoff:** Settlements gain functioning merchants and markets whose visible activity reflects real stock, prices and demand.

## P85.1 Purpose

Create Merchant & Market Runtime v1.

## P85.2 Authoritative source packet

- P83/P84;
- 20B markets/trading posts;
- P40/P41 structures;
- P50 professions;
- P37 dialogue;
- settlement stock.

## P85.3 Entry gate

- P84 COMPLETE;
- valid market/trading-post structure.

## P85.4 Dependencies

P37/P41/P50/P53/P84.

## P85.5 Universal primitives used

- Transaction;
- Ownership;
- Permission;
- Knowledge;
- State;
- Result/Reason.

## P85.6 In scope

- market/stall operational state;
- merchant presence;
- shop inventory;
- buy/sell;
- barter;
- price contextualisation;
- merchant restock from warehouse/production;
- opening/closing schedule;
- customer/merchant interaction;
- trade dialogue;
- tax/customs hook;
- market stock UI;
- shortages/surplus presentation.

## P85.7 Explicit non-scope

- full regional price simulation;
- auctions;
- credit;
- merchant caravans;
- stock market.

## P85.8 Implementation capability requirements

A busy market cannot sell goods absent from authoritative stock.

## P85.9 Forge requirements

Uses Commerce/Structure/Character/Dialogues.

## P85.10 Runtime requirements

Restocking uses haul/warehouse transactions.

## P85.11 Canonical content subset

One small settlement market/trading post.

## P85.12 Persistence implications

Stock/merchant/transactions persist.

## P85.13 Multiplayer / authority implications

Trade authoritative.

## P85.14 Simulation-LOD implications

Market detailed locally; summary demand/stock later.

## P85.15 Accessibility / localisation implications

Trade UI and market state accessible.

## P85.16 Performance implications

Crowd/market presentation bounded.

## P85.17 Security / trust implications

Price/stock stale-state validation.

## P85.18 Recommended child decomposition

- P85-A — shop/market runtime;
- P85-B — merchant stock/restock;
- P85-C — trade interaction/UI;
- P85-D — schedule/tax hooks;
- P85-E — persistence/negative tests;
- P85-F — reconciliation.

## P85.19 Acceptance matrix

| ID | Requirement | Evidence | Gate |
| --- | --- | --- | --- |
| P85-AC01 | Merchant sells only owned/allocated stock | EV-B | Required |
| P85-AC02 | Purchase changes buyer/seller inventories/currency exactly | EV-B | Required |
| P85-AC03 | Restocking moves real warehouse goods | EV-B / EV-C | Required |
| P85-AC04 | Stock shortage changes availability/price context | EV-C | Required |
| P85-AC05 | Merchant closed/absent state is authoritative | EV-B / EV-C | Required |
| P85-AC06 | Save/reload preserves stock/state | EV-D | Required |
| P85-AC07 | Final SHA/CI passes | EV-H | Required |

## P85.20 Negative tests

- item sold out;
- warehouse unavailable;
- merchant absent;
- price/stock stale;
- buyer capacity full.

## P85.21 Manual acceptance scenario

Visit market.

Buy/sell goods.

Watch stock change.

Trigger restock from warehouse.

Return after stock shortage.

## P85.22 Rule-of-cool target

The settlement's marketplace finally feels like:

> **people are trading what the settlement actually has.**

## P85.23 Exit gate

Local commerce works.

## P85.24 Downstream unlock

P86–P92.

## P85.25 Known risks / ADR triggers

- merchant-stock allocation policy.

---

# P86 — PACK, CART & SADDLE

**Classification:** FORGE-FIRST / FOUNDATION  
**Arc:** ARC XI  
**Player/creator payoff:** Land transport gains pack animals, carts and wagons that materially change carrying capacity and route requirements.

## P86.1 Purpose

Create Land Transport foundation and authoring.

## P86.2 Authoritative source packet

- Set 30 Movement, Travel & Routes;
- 20D logistics;
- P28 entities/navigation;
- P54 hauling;
- P76 husbandry hooks;
- ART-04 vehicle/equipment modelling.

## P86.3 Entry gate

- local routes;
- entity/equipment systems;
- transport content authority.

## P86.4 Dependencies

P28/P46/P54/P76.

## P86.5 Universal primitives used

- Identity;
- Capability;
- Ownership;
- Route;
- State;
- Connection/Socket;
- Result/Reason.

## P86.6 In scope

Land transport definitions:

- pack animal;
- mount;
- cart;
- wagon;
- harness;
- hitch/socket;
- cargo capacity;
- passenger capacity hook;
- route/clearance requirement;
- speed;
- terrain/slope limits;
- condition/durability;
- repair;
- feed/fuel hook;
- ownership;
- loading/unloading;
- parking/stabling;
- presentation.

Authoring may be a specialist Transport surface orchestrating Entity/Equipment/Structure services rather than a new permanent top-level Forge if not needed.

## P86.7 Explicit non-scope

- rail;
- vessels;
- flying transport;
- regional caravan simulation;
- advanced vehicle physics.

## P86.8 Implementation capability requirements

Cargo quantity belongs to carrier inventory/cargo record, not visible crate count.

## P86.9 Forge requirements

Reuse Creature/Equipment/Structure/Animation services.

## P86.10 Runtime requirements

Transport movement uses route/navigation with appropriate clearance.

## P86.11 Canonical content subset

- pack animal;
- small cart;
- freight wagon.

## P86.12 Persistence implications

Vehicle/animal identity, cargo, condition persist.

## P86.13 Multiplayer / authority implications

Future vehicle/ride authority compatible.

## P86.14 Simulation-LOD implications

Distant transport may summary-move along route.

## P86.15 Accessibility / localisation implications

Mount/loading interaction clear.

## P86.16 Performance implications

Wagon/mount movement/nav cost measured.

## P86.17 Security / trust implications

Cargo duplication on attach/detach/load prevented.

## P86.18 Recommended child decomposition

- P86-A — transport profile/source;
- P86-B — cargo/hitch/loading;
- P86-C — movement/route compatibility;
- P86-D — condition/feed/repair;
- P86-E — persistence/performance;
- P86-F — reconciliation.

## P86.19 Acceptance matrix

| ID | Requirement | Evidence | Gate |
| --- | --- | --- | --- |
| P86-AC01 | Cart/pack animal has authoritative cargo capacity | EV-B | Required |
| P86-AC02 | Cargo transfers exactly via transactions | EV-B | Required |
| P86-AC03 | Route clearance/slope can reject incompatible vehicle | EV-B / EV-C | Required |
| P86-AC04 | Vehicle/animal persists with cargo | EV-D | Required |
| P86-AC05 | Distant simplified representation preserves cargo/state | EV-B | Required |
| P86-AC06 | Final SHA/CI passes | EV-H | Required |

## P86.20 Negative tests

- overload;
- invalid hitch;
- route too narrow;
- animal unavailable;
- save with loaded cart.

## P86.21 Manual acceptance scenario

Load wagon.

Travel settlement road.

Take narrow/steep invalid route.

Unload at destination.

## P86.22 Rule-of-cool target

The world gets its first proper:

> **wagon full of actual stuff.**

## P86.23 Exit gate

Land transport foundation exists.

## P86.24 Downstream unlock

P87/P88/P90.

## P86.25 Known risks / ADR triggers

- cart physics vs kinematic abstraction;
- mount/vehicle navigation provider.

---

# P87 — THE LONG ROAD

**Classification:** FOUNDATION  
**Arc:** ARC XI  
**Player/creator payoff:** Settlements become connected by persistent regional routes with travel time, risk, access and condition.

## P87.1 Purpose

Create Regional Route & Travel Runtime.

## P87.2 Authoritative source packet

- Set 30;
- PROD-05 Route primitive;
- P46 local roads;
- P73 world regions;
- P81 maps;
- P86 transport.

## P87.3 Entry gate

- region identity;
- local routes;
- transport.

## P87.4 Dependencies

P46/P73/P81/P86.

## P87.5 Universal primitives used

- Route;
- Identity;
- State;
- Permission;
- Knowledge;
- History;
- Result/Reason.

## P87.6 In scope

Regional route record:

- route ID;
- origin/destination;
- segment graph;
- route mode;
- distance;
- expected travel time;
- capacity;
- condition;
- ownership;
- access/tolls hook;
- danger;
- weather/season modifier;
- vehicle compatibility;
- maintenance;
- known/unknown status per observer;
- map integration;
- disruption state;
- history.

Travel runtime:

- route planning;
- ETA;
- travel progress;
- pause/disruption;
- reroute;
- arrival.

## P87.7 Explicit non-scope

- caravan economy;
- ocean routes;
- portals;
- detailed every-footstep simulation across unloaded region.

## P87.8 Implementation capability requirements

Regional route summary must reconcile with local path/road endpoints.

## P87.9 Forge requirements

World/Structure/Route authoring hooks.

## P87.10 Runtime requirements

Detailed local movement near player; bounded route progress far away.

## P87.11 Canonical content subset

Two settlements connected by one main route and one alternate/poor route.

## P87.12 Persistence implications

Route state/travel progress persist.

## P87.13 Multiplayer / authority implications

World route/traveller state authoritative.

## P87.14 Simulation-LOD implications

Core purpose.

## P87.15 Accessibility / localisation implications

Route condition/danger known only to extent player knowledge permits.

## P87.16 Performance implications

Regional route planning bounded/cached.

## P87.17 Security / trust implications

Unknown routes not leaked through UI.

## P87.18 Recommended child decomposition

- P87-A — regional route schema;
- P87-B — route graph/planning;
- P87-C — travel progress/LOD;
- P87-D — permission/condition/danger;
- P87-E — map/knowledge integration;
- P87-F — reconciliation.

## P87.19 Acceptance matrix

| ID | Requirement | Evidence | Gate |
| --- | --- | --- | --- |
| P87-AC01 | Route has stable origin/destination/segments/state | EV-B | Required |
| P87-AC02 | Vehicle mode compatibility affects planning | EV-B | Required |
| P87-AC03 | Far travel preserves traveller/cargo identity | EV-D | Required |
| P87-AC04 | Disruption can pause/reroute with reason | EV-C | Required |
| P87-AC05 | Unknown route/detail is not leaked to player map | EV-B negative | Required |
| P87-AC06 | Route planning remains bounded | EV-E | Required |
| P87-AC07 | Final SHA/CI passes | EV-H | Required |

## P87.20 Negative tests

- blocked segment;
- restricted border;
- vehicle incompatible;
- route removed while traveller active;
- reload mid-route.

## P87.21 Manual acceptance scenario

Travel between settlements using main route.

Block segment.

Take alternate route.

Compare ETA/condition.

## P87.22 Rule-of-cool target

The world starts feeling **far apart in a meaningful way**.

## P87.23 Exit gate

Regional travel works.

## P87.24 Downstream unlock

P88–P92.

## P87.25 Known risks / ADR triggers

- route-summary precision vs physical path.

---

# P88 — CARAVAN BELLS

**Classification:** COOL-PULL / INTEGRATION  
**Arc:** ARC XI  
**Player/creator payoff:** Real groups of traders, guards, animals and wagons travel between settlements carrying valuable cargo.

## P88.1 Purpose

Create Caravan Runtime v1.

## P88.2 Authoritative source packet

- Set 27/30;
- P32 NPC identity;
- P86 transport;
- P87 routes;
- P84 contracts;
- P31 combat;
- P55 LOD.

## P88.3 Entry gate

- P84/P86/P87.

## P88.4 Dependencies

P31/P32/P55/P84/P86/P87.

## P88.5 Universal primitives used

- Identity;
- Membership;
- Route;
- Ownership;
- Transaction;
- Reservation;
- State;
- History;
- Result/Reason.

## P88.6 In scope

Caravan record:

- caravan ID;
- members;
- leader;
- guards;
- merchants;
- mounts/vehicles;
- cargo;
- origin/destination;
- route;
- contract/mission;
- schedule/departure;
- food/feed/supply hook;
- condition;
- danger response;
- camp/rest state;
- local active representation;
- regional summary representation;
- event participation;
- arrival/unload;
- history.

## P88.7 Explicit non-scope

- every caravan type;
- complex merchant guild politics;
- ocean convoy;
- fully tactical escort formations.

## P88.8 Implementation capability requirements

Caravan summary preserves member/cargo identities.

## P88.9 Forge requirements

Composes existing person/transport/commerce source.

## P88.10 Runtime requirements

ACTIVE ↔ REGIONAL transitions.

## P88.11 Canonical content subset

One merchant caravan.

## P88.12 Persistence implications

Critical.

## P88.13 Multiplayer / authority implications

World-authoritative caravan.

## P88.14 Simulation-LOD implications

Primary requirement.

## P88.15 Accessibility / localisation implications

Caravan status/danger summary readable.

## P88.16 Performance implications

Distant caravan must be cheap.

## P88.17 Security / trust implications

Cargo remains unique across LOD.

## P88.18 Recommended child decomposition

- P88-A — caravan/group record;
- P88-B — cargo/vehicle composition;
- P88-C — regional travel;
- P88-D — active representation/encounter;
- P88-E — arrival/persistence/LOD;
- P88-F — reconciliation.

## P88.19 Acceptance matrix

| ID | Requirement | Evidence | Gate |
| --- | --- | --- | --- |
| P88-AC01 | Caravan preserves persistent members/vehicles/cargo | EV-B / EV-D | Required |
| P88-AC02 | Regional travel uses P87 route | EV-B | Required |
| P88-AC03 | Promotion to active scene preserves same identities/cargo | EV-D / EV-C | Required |
| P88-AC04 | Arrival transfers exact contracted cargo | EV-B | Required |
| P88-AC05 | Caravan event does not arbitrarily delete cargo without explicit outcome | EV-B negative | Required |
| P88-AC06 | Regional representation remains bounded | EV-E | Required |
| P88-AC07 | Final SHA/CI passes | EV-H | Required |

## P88.20 Negative tests

- route blocked;
- vehicle damaged;
- cargo full;
- member dies/leaves;
- save during promotion/demotion;
- destination unavailable.

## P88.21 Manual acceptance scenario

Watch caravan depart.

Leave region.

Intercept/rejoin later.

Inspect same cargo/members.

Escort to destination.

## P88.22 Rule-of-cool target

Hearing bells on a road and realising:

> **that caravan actually came from somewhere and is going somewhere.**

## P88.23 Exit gate

Caravan simulation works.

## P88.24 Downstream unlock

P89/P90/P91.

## P88.25 Known risks / ADR triggers

- group movement/formation when active.

---

# P89 — THE ROAD REMEMBERS

**Classification:** FOUNDATION / COOL-PULL  
**Arc:** ARC XI  
**Player/creator payoff:** Roads accumulate condition, danger and history; travel changes because of what happens along them.

## P89.1 Purpose

Create Route Events, Condition & Maintenance.

## P89.2 Authoritative source packet

- Set 30;
- Quest/Event;
- P77 weather;
- P87 routes;
- P88 caravans;
- P42 projects;
- P50 professions.

## P89.3 Entry gate

- P87/P88.

## P89.4 Dependencies

P42/P50/P77/P87/P88.

## P89.5 Universal primitives used

- Route;
- State;
- History;
- Knowledge;
- Transaction;
- Result/Reason.

## P89.6 In scope

Route state:

- wear/condition;
- blockage;
- bridge/segment damage;
- weather exposure;
- threat pressure;
- recent incidents;
- patrol/security hook;
- maintenance need;
- maintenance project;
- toll/checkpoint hook;
- event anchors;
- discovered danger;
- historical incidents;
- route reputation/safety summary.

Event families:

- breakdown;
- weather delay;
- attack/raid;
- fallen tree/landslide;
- damaged bridge;
- roadworks;
- customs/checkpoint;
- opportunity encounter.

## P89.7 Explicit non-scope

- procedural narrative engine;
- every encounter;
- final warfront routing.

## P89.8 Implementation capability requirements

Event consequences operate through normal systems.

If bridge breaks:

- route state changes;
- construction/repair project may be needed;
- freight changes.

## P89.9 Forge requirements

Quest/Event Forge later expands; current event definitions may use existing event authoring.

## P89.10 Runtime requirements

Events can resolve while active or through bounded regional summary.

## P89.11 Canonical content subset

Several route-event fixtures.

## P89.12 Persistence implications

Damage/history/disruption persist.

## P89.13 Multiplayer / authority implications

Shared world events authoritative.

## P89.14 Simulation-LOD implications

Core requirement.

## P89.15 Accessibility / localisation implications

Danger known only through valid reports/maps/observation.

## P89.16 Performance implications

Event generation cadence bounded.

## P89.17 Security / trust implications

No random resource loss without explicit recorded event.

## P89.18 Recommended child decomposition

- P89-A — route condition/history;
- P89-B — event trigger/profile;
- P89-C — maintenance project;
- P89-D — LOD event resolution;
- P89-E — knowledge/map reporting;
- P89-F — reconciliation.

## P89.19 Acceptance matrix

| ID | Requirement | Evidence | Gate |
| --- | --- | --- | --- |
| P89-AC01 | Route condition affects travel/capacity | EV-B / EV-C | Required |
| P89-AC02 | Route damage can create real repair project | EV-C | Required |
| P89-AC03 | Cargo/person losses require explicit event/result | EV-B | Required |
| P89-AC04 | Event/history survives reload | EV-D | Required |
| P89-AC05 | Unknown danger not automatically revealed | EV-B negative | Required |
| P89-AC06 | Regional event scheduler bounded | EV-E | Required |
| P89-AC07 | Final SHA/CI passes | EV-H | Required |

## P89.20 Negative tests

- repeated event resolution;
- road repaired while caravan rerouting;
- unknown hazard;
- destroyed segment;
- event expires.

## P89.21 Manual acceptance scenario

Damage/block a route.

Observe caravan delay/reroute.

Create repair project.

Restore.

Inspect route history/map report.

## P89.22 Rule-of-cool target

A road becomes:

> **a place with stories, not just a line between towns.**

## P89.23 Exit gate

Routes have persistent condition/events.

## P89.24 Downstream unlock

P90/P91/P92.

## P89.25 Known risks / ADR triggers

- route-event density/selection.

---

# P90 — WAREHOUSE TO WAREHOUSE

**Classification:** INTEGRATION / FOUNDATION  
**Arc:** ARC XI  
**Player/creator payoff:** Settlements can commit real stock to regional freight and receive it elsewhere without teleporting goods.

## P90.1 Purpose

Create Regional Freight Runtime.

## P90.2 Authoritative source packet

- Set 27/30;
- P53 warehousing;
- P84 contracts;
- P86–P89 transport/routes/caravans;
- 20D logistics.

## P90.3 Entry gate

- P53/P84/P87/P88.

## P90.4 Dependencies

P53/P54/P84/P86–P89.

## P90.5 Universal primitives used

- Transaction;
- Reservation;
- Route;
- Ownership;
- Permission;
- State;
- History;
- Result/Reason.

## P90.6 In scope

Freight commitment:

- source warehouse;
- destination warehouse;
- cargo manifest;
- reservation;
- packaging/loading hook;
- carrier assignment;
- route;
- capacity;
- departure;
- in-transit ownership;
- customs/toll hook;
- arrival;
- receiving capacity;
- partial delivery/loss record;
- cancellation/return;
- contract completion.

## P90.7 Explicit non-scope

- ocean freight;
- portal freight;
- global logistics AI;
- insurance.

## P90.8 Implementation capability requirements

During transit, goods have one authoritative owner/location state.

## P90.9 Forge requirements

Commerce/route profiles.

## P90.10 Runtime requirements

Warehouse and caravan services integrate transactionally.

## P90.11 Canonical content subset

Grain/tools/ore or similarly distinct freight classes.

## P90.12 Persistence implications

Manifest/in-transit state critical.

## P90.13 Multiplayer / authority implications

Authoritative.

## P90.14 Simulation-LOD implications

Core.

## P90.15 Accessibility / localisation implications

Manifest/blocked reason readable.

## P90.16 Performance implications

Batch goods, do not require entity per sack.

## P90.17 Security / trust implications

No duplication source+caravan+destination.

## P90.18 Recommended child decomposition

- P90-A — freight manifest/reservation;
- P90-B — loading/departure;
- P90-C — in-transit state;
- P90-D — arrival/customs/receiving;
- P90-E — partial failure/persistence;
- P90-F — reconciliation.

## P90.19 Acceptance matrix

| ID | Requirement | Evidence | Gate |
| --- | --- | --- | --- |
| P90-AC01 | Freight reservation reduces source available stock | EV-B | Required |
| P90-AC02 | Departure transfers cargo to carrier/in-transit once | EV-B | Required |
| P90-AC03 | Arrival transfers exact remaining cargo to destination | EV-B | Required |
| P90-AC04 | Partial loss/delivery reconciles manifest explicitly | EV-B | Required |
| P90-AC05 | Destination-full preserves cargo/creates blocker | EV-B negative | Required |
| P90-AC06 | Save/reload in transit preserves manifest | EV-D | Required |
| P90-AC07 | Batch freight stays bounded | EV-E | Required |
| P90-AC08 | Final SHA/CI passes | EV-H | Required |

## P90.20 Negative tests

- source shortage;
- carrier unavailable;
- route blocked;
- destination full;
- partial loss event;
- cancellation.

## P90.21 Manual acceptance scenario

Reserve grain in Town A.

Load caravan.

Leave it in regional simulation.

Receive in Town B.

Compare exact stock.

## P90.22 Rule-of-cool target

The first time one town's warehouse becomes another town's dinner.

## P90.23 Exit gate

Regional freight works.

## P90.24 Downstream unlock

P91/P92.

## P90.25 Known risks / ADR triggers

- in-transit ownership representation.

---

# P91 — THE LIVING MARKET

**Classification:** FOUNDATION / EXPANSION  
**Arc:** ARC XI  
**Player/creator payoff:** Regional shortages, surpluses and route disruptions begin changing what settlements produce, buy and sell.

## P91.1 Purpose

Create bounded Regional Economy Simulation v1.

## P91.2 Authoritative source packet

- Set 27;
- P55/P63 production;
- P83–P90;
- settlement needs;
- culture/faction preferences.

## P91.3 Entry gate

- real production/warehousing;
- functioning trade/freight.

## P91.4 Dependencies

P55/P63/P83–P90.

## P91.5 Universal primitives used

- State;
- Transaction;
- Route;
- Knowledge;
- History;
- Result/Reason.

## P91.6 In scope

Regional economy summary:

- settlement supply;
- settlement demand/consumption;
- strategic reserve;
- surplus;
- shortage;
- import demand;
- export availability;
- known route capacity;
- transport cost/risk;
- merchant offers;
- trade contracts;
- price tendency/context;
- production response hook;
- event/season modifier;
- cultural preference;
- legal restriction/tax hook;
- trade history;
- bounded update cadence.

## P91.7 Explicit non-scope

- full econometric simulation;
- banking;
- securities;
- per-NPC invisible shopping;
- perfect equilibrium;
- omniscient player price charts.

## P91.8 Implementation capability requirements

Regional summary must reconcile to actual settlement stock/production.

## P91.9 Forge requirements

Commerce profiles and dashboards.

## P91.10 Runtime requirements

Event/multi-day summary cadence.

## P91.11 Canonical content subset

Three settlements with differing production strengths.

## P91.12 Persistence implications

Economic history/shortage/contract state persists.

## P91.13 Multiplayer / authority implications

World economy authoritative.

## P91.14 Simulation-LOD implications

Core.

## P91.15 Accessibility / localisation implications

Player-facing information respects knowledge and avoids opaque unexplained price swings.

## P91.16 Performance implications

Regional update bounded.

## P91.17 Security / trust implications

No client-authoritative price/stock.

## P91.18 Recommended child decomposition

- P91-A — settlement supply/demand summary;
- P91-B — regional matching/contracts;
- P91-C — price/offer context;
- P91-D — production/shortage feedback;
- P91-E — history/knowledge/performance;
- P91-F — reconciliation.

## P91.19 Acceptance matrix

| ID | Requirement | Evidence | Gate |
| --- | --- | --- | --- |
| P91-AC01 | Supply/demand summary reconciles to real stock/production/consumption | EV-B | Required |
| P91-AC02 | Shortage/surplus can create/import/export opportunity | EV-C | Required |
| P91-AC03 | Route disruption changes viable trade | EV-B / EV-C | Required |
| P91-AC04 | Price/offer changes have explainable contributing causes | EV-C | Required |
| P91-AC05 | Player only sees market information legitimately known | EV-B negative | Required |
| P91-AC06 | Regional update stays within performance target | EV-E | Required |
| P91-AC07 | Save/reload preserves economic state/contracts | EV-D | Required |
| P91-AC08 | Final SHA/CI passes | EV-H | Required |

## P91.20 Negative tests

- settlement stock zero;
- route cut;
- huge surplus;
- destination no capacity;
- stale market knowledge.

## P91.21 Manual acceptance scenario

Create grain surplus in one settlement, tool shortage in another.

Observe offers/contracts.

Block route.

Observe market change.

Restore route.

## P91.22 Rule-of-cool target

The region begins to feel like:

> **towns need each other.**

## P91.23 Exit gate

Bounded regional economy works.

## P91.24 Downstream unlock

P92 and later politics.

## P91.25 Known risks / ADR triggers

- price stability/oscillation damping.

---

# P92 — ROADS OF GOLD & DUST

**Classification:** INTEGRATION / COOL-PULL  
**Arc:** ARC XI  
**Player/creator payoff:** A complete regional trade network physically and economically connects multiple settlements.

## P92.1 Purpose

Certify ARC XI.

## P92.2 Authoritative source packet

P83–P91 plus settlement/world systems.

## P92.3 Entry gate

- P83–P91 COMPLETE.

## P92.4 Dependencies

All ARC XI.

## P92.5 Universal primitives used

Broad economy/route set.

## P92.6 In scope

Golden regional trade fixture:

- at least three settlements;
- distinct production strengths;
- local markets;
- merchants;
- carts/wagons;
- regional routes;
- caravan;
- route event;
- freight contract;
- warehouse transfer;
- shortage/surplus;
- route disruption;
- recovery/reroute;
- player participation;
- map/knowledge;
- save/away-return.

## P92.7 Explicit non-scope

- government/diplomacy;
- ocean trade;
- portals;
- global economy.

## P92.8 Implementation capability requirements

No `RegionalEconomyDemoController`.

Normal systems compose.

## P92.9 Forge requirements

Commerce/transport/world/structure sources.

## P92.10 Runtime requirements

End-to-end conservation.

## P92.11 Canonical content subset

Compact three-settlement region.

## P92.12 Persistence implications

Full fixture persists.

## P92.13 Multiplayer / authority implications

Future-safe.

## P92.14 Simulation-LOD implications

Critical.

## P92.15 Accessibility / localisation implications

Trade/route causes understandable.

## P92.16 Performance implications

Combined regional load measured.

## P92.17 Security / trust implications

Long-run conservation soak.

## P92.18 Recommended child decomposition

- P92-A — three-settlement economy fixture;
- P92-B — commerce/routes/caravans;
- P92-C — event/freight integration;
- P92-D — living market feedback;
- P92-E — save/LOD/performance/human review;
- P92-F — PG-11 reconciliation.

## P92.19 Acceptance matrix

| ID | Requirement | Evidence | Gate |
| --- | --- | --- | --- |
| P92-AC01 | Three settlements exchange real goods through normal systems | EV-C / EV-B | Required |
| P92-AC02 | Freight quantities reconcile end to end | EV-B | Required |
| P92-AC03 | Route disruption causes visible economic/logistical consequence | EV-C | Required |
| P92-AC04 | Caravans preserve identities/cargo through LOD | EV-D | Required |
| P92-AC05 | Markets reflect real stock/surplus/shortage | EV-B / EV-C | Required |
| P92-AC06 | Player can trade/help/disrupt without bypassing economy | EV-C | Required |
| P92-AC07 | Regional economy remains bounded | EV-E | Required |
| P92-AC08 | Human review confirms region feels economically connected | EV-G | Required |
| P92-AC09 | No bespoke integration controller exists | EV-A / review | Required |
| P92-AC10 | Final SHA/CI passes | EV-H | Required |

## P92.20 Negative tests

- route destroyed;
- merchant stock exhausted;
- caravan attacked;
- freight cancelled;
- warehouse full;
- save mid-delivery.

## P92.21 Manual acceptance scenario

Trade locally.

Accept freight contract.

Travel beside caravan.

Trigger route disruption.

Help repair/reroute.

Reach destination.

Observe price/stock recovery.

## P92.22 Rule-of-cool target

Stand on a hill, see a caravan on the road, and know:

> **the economy underneath that little scene is real.**

## P92.23 Exit gate — PG-11 REGIONAL ECONOMY & TRADE FOUNDATION

PG-11 passes when P83–P92 are complete and real goods, routes and markets connect multiple settlements coherently.

## P92.24 Downstream unlock

ARC XII society/governance/conflict.

## P92.25 Known risks / ADR triggers

- cross-settlement economic oscillation;
- route/economy scheduler interaction.

---

# 04. ARC XII — CROWNS & CONSEQUENCES

ARC XII gives political identity and institutional consequence to the societies now interacting through trade and routes.

The goal is not to simulate every government bureaucracy.

The goal is to establish a reliable political/civic grammar that later realms, factions, wars and player-founded states can all use.

---

# P93 — THREADS OF IDENTITY

**Classification:** FOUNDATION  
**Arc:** ARC XII — CROWNS & CONSEQUENCES  
**Player/creator payoff:** Leyforge gains a trustworthy social identity model that separates who someone is from the organisations and governments they participate in.

## P93.1 Purpose

Create Society / Culture / Faction Contract.

## P93.2 Authoritative source packet

- current Races, Peoples, Cultures & Factions authority;
- FCC ancestry/culture/government canon;
- 20G culture/faction packs;
- P32 NPC identity;
- PROD-05 Membership/Relationship/Knowledge/History.

## P93.3 Entry gate

- persistent NPC identity;
- settlements/economy/world history available.

## P93.4 Dependencies

P32/P48/P92.

## P93.5 Universal primitives used

- Identity;
- Membership;
- Relationship;
- Knowledge;
- History;
- Permission hook;
- State;
- Result/Reason.

## P93.6 In scope

Distinct definitions/contracts for:

### Ancestry / body heritage
Physical/lineage identity where canon requires.

### People / population identity
Broader people-group identity where separate from ancestry/culture.

### Culture
Shared learned/social identity:

- customs;
- language hooks;
- architecture/style;
- values;
- practices;
- food/trade preferences;
- laws/tendencies only where culture explicitly informs, not dictates.

### Faction
Organised actor:

- membership;
- goals;
- leadership;
- territory claims;
- resources;
- relationships;
- policies;
- military/economic capabilities.

### Faith/philosophy hook
Separate from ancestry/culture/government.

### Government hook
Institutional authority, defined fully in P95.

### Personal identity links
NPC may hold multiple memberships/affiliations.

## P93.7 Explicit non-scope

- Faction Forge;
- Government Forge;
- full religion system;
- every culture;
- generated ideology simulator.

## P93.8 Implementation capability requirements

No implicit chain:

```text
ancestry → culture → faction → government → morality
```

unless a specific canonical source explicitly defines a relationship, and even then it remains data/evidence rather than universal law.

## P93.9 Forge requirements

P94/P95 consume contract.

## P93.10 Runtime requirements

NPC/settlement/faction records store stable IDs/memberships separately.

## P93.11 Canonical content subset

Several contrasting test profiles.

## P93.12 Persistence implications

Membership/identity/history persistent.

## P93.13 Multiplayer / authority implications

Social state shared world authority.

## P93.14 Simulation-LOD implications

Identity persists all LODs.

## P93.15 Accessibility / localisation implications

Names/labels localisable; culture/faction identity not colour-only.

## P93.16 Performance implications

Membership lookups/indexed.

## P93.17 Security / trust implications

None beyond data validity.

## P93.18 Recommended child decomposition

- P93-A — ancestry/people/culture separation;
- P93-B — faction base contract;
- P93-C — membership/relationship;
- P93-D — faith/government hooks;
- P93-E — migration/history;
- P93-F — reconciliation.

## P93.19 Acceptance matrix

| ID | Requirement | Evidence | Gate |
| --- | --- | --- | --- |
| P93-AC01 | Ancestry, culture, faction and government are separate stable identities | EV-A / EV-B | Required |
| P93-AC02 | Person can hold cross-cutting memberships | EV-B | Required |
| P93-AC03 | Hostility is not inferred from ancestry/body | EV-B negative/review | Required |
| P93-AC04 | Mixed settlement can contain multiple ancestries/cultures/factions | EV-C | Required |
| P93-AC05 | Occupation/government change does not rewrite ancestry/culture automatically | EV-B | Required |
| P93-AC06 | Membership/history survives save/reload | EV-D | Required |
| P93-AC07 | Final SHA/CI passes | EV-H | Required |

## P93.20 Negative tests

- culture removed while person remains;
- faction changes;
- occupied settlement;
- mixed household;
- multi-faction culture.

## P93.21 Manual acceptance scenario

Inspect several NPC identities.

Change faction membership/government jurisdiction.

Verify ancestry/culture remain correct.

## P93.22 Rule-of-cool target

This is mostly invisible plumbing, but it prevents years of future lore/simulation pain.

## P93.23 Exit gate

Social identity grammar stable.

## P93.24 Downstream unlock

P94–P102.

## P93.25 Known risks / ADR triggers

- membership multiplicity/priority;
- culture evolution representation.

---

# P94 — BANNERS IN THE WIND

**Classification:** FORGE-FIRST  
**Arc:** ARC XII  
**Player/creator payoff:** Factions can be authored as persistent organisations with motives, resources, relationships and visual/political identity.

## P94.1 Purpose

Create Faction Forge v1.

## P94.2 Authoritative source packet

- P93;
- current faction canon;
- 20G faction overlays;
- economy/settlement/military hooks;
- ART-03 faction/culture presentation;
- ART-08 political UI/maps.

## P94.3 Entry gate

- P93 COMPLETE.

## P94.4 Dependencies

P93, shared Forge services.

## P94.5 Universal primitives used

- Identity;
- Membership;
- Relationship;
- Ownership;
- Permission;
- History;
- Knowledge;
- Provenance;
- Result/Reason.

## P94.6 In scope

Faction source:

- faction identity;
- faction type;
- founding/history hook;
- goals;
- priorities;
- membership rules;
- leadership roles;
- settlement links;
- economic profile;
- preferred/forbidden trade hook;
- territory claim policy;
- diplomacy profile;
- military profile;
- law/government link;
- symbols/banner/presentation;
- culture relationships;
- internal subgroups hook;
- succession/reform hook;
- hostility/non-combat outcomes;
- validation.

Faction Forge journey:

```text
Identity
→ purpose/history
→ membership
→ leadership
→ settlements/resources
→ economy
→ claims
→ diplomacy
→ military
→ government/law links
→ visual identity
→ validate
→ simulation preview
```

## P94.7 Explicit non-scope

- full government/law authoring;
- full strategic faction AI;
- every faction;
- arbitrary scripts.

## P94.8 Implementation capability requirements

Faction definition does not duplicate culture definition.

## P94.9 Forge requirements

Uses Culture/Structure/Commerce/Character/UI shared services.

## P94.10 Runtime requirements

Faction record supports persistent relations/claims/assets.

## P94.11 Canonical content subset

At least three contrasting factions.

## P94.12 Persistence implications

Faction identity/relations/state persist.

## P94.13 Multiplayer / authority implications

World authority.

## P94.14 Simulation-LOD implications

Faction summaries regional.

## P94.15 Accessibility / localisation implications

Faction identity uses multiple cues; symbols/names localised.

## P94.16 Performance implications

Strategic updates bounded later.

## P94.17 Security / trust implications

Developer authority.

## P94.18 Recommended child decomposition

- P94-A — faction source;
- P94-B — membership/leadership;
- P94-C — economy/settlement/claim hooks;
- P94-D — relation/military/government hooks;
- P94-E — presentation/preview;
- P94-F — reconciliation.

## P94.19 Acceptance matrix

| ID | Requirement | Evidence | Gate |
| --- | --- | --- | --- |
| P94-AC01 | Faction source authored/validated in Forge | EV-B / EV-C | Required |
| P94-AC02 | Faction can span multiple cultures where configured | EV-B | Required |
| P94-AC03 | Culture does not silently grant faction membership | EV-B negative | Required |
| P94-AC04 | Goals/economic/military/diplomatic hooks are stable data | EV-B | Required |
| P94-AC05 | Visual identity remains separate from gameplay hostility | EV-A / review | Required |
| P94-AC06 | Faction state survives reload | EV-D | Required |
| P94-AC07 | Final SHA/CI passes | EV-H | Required |

## P94.20 Negative tests

- missing leader role;
- settlement affiliation conflict;
- culture changed;
- relation target missing;
- invalid claim profile.

## P94.21 Manual acceptance scenario

Author three factions.

Assign mixed members/settlements.

Preview banners/relations/goals.

## P94.22 Rule-of-cool target

The world finally has organisations worth recognising by name.

## P94.23 Exit gate

Faction authoring works.

## P94.24 Downstream unlock

P95–P102.

## P94.25 Known risks / ADR triggers

- strategic-goal representation.

---

# P95 — THE CIVIC FORGE

**Classification:** FORGE-FIRST / FOUNDATION  
**Arc:** ARC XII  
**Player/creator payoff:** Governments, laws and civic authority can be authored and inspected through one reusable system.

## P95.1 Purpose

Create Government & Law Forge v1 and formalise Permission/Jurisdiction.

## P95.2 Authoritative source packet

- current 14-government canon;
- 20C governance/safety/justice;
- P93/P94;
- PROD-05 Permission/Jurisdiction;
- P83 commerce/legal hooks;
- P40 civic structures.

## P95.3 Entry gate

- P93/P94;
- Permission primitive accepted.

## P95.4 Dependencies

P93–P94 plus settlement/governance supporting systems.

## P95.5 Universal primitives used

- Permission/Jurisdiction;
- Identity;
- Membership;
- Ownership;
- Relationship;
- History;
- Result/Reason.

## P95.6 In scope

Government definition:

- identity/type;
- authority source;
- offices/roles;
- appointment/election/succession hook;
- jurisdiction types;
- administrative levels;
- law profile;
- tax/customs policy;
- trade policy;
- public/private ownership rule hooks;
- military authority;
- emergency authority;
- protected/sacred/heritage rule hooks;
- construction approval hook;
- crime/justice hook;
- diplomacy/treaty authority;
- records;
- reform/succession/change hook.

Law definition:

- law identity;
- jurisdiction;
- subject/action/target categories;
- allowed/forbidden/conditional;
- exception/permit;
- enforcement priority;
- penalty/consequence hook;
- evidence/witness requirement hook;
- public knowledge/notification;
- effective dates;
- supersession/repeal.

Government & Law Forge journey:

```text
Government identity
→ authority/roles
→ jurisdiction
→ law set
→ taxes/customs
→ ownership/permissions
→ civic/military powers
→ succession/reform
→ presentation/records
→ validate
→ civic Test Lab
```

## P95.7 Explicit non-scope

- full court simulator;
- real-world legal modelling;
- every law;
- parliament micromanagement;
- political campaign simulation.

## P95.8 Implementation capability requirements

Permission evaluation:

```text
actor
+ action
+ target
+ location
+ authority
+ law/permit
→ result + reason
```

One shared evaluator feeds systems.

## P95.9 Forge requirements

Specialist source authoring over identity/permission/UI.

## P95.10 Runtime requirements

P96 consumes definitions.

## P95.11 Canonical content subset

Several government types and small law sets.

## P95.12 Persistence implications

Government/law revisions/effective state persist.

## P95.13 Multiplayer / authority implications

Permission model later reused for servers/player states.

## P95.14 Simulation-LOD implications

Jurisdiction/law always queryable without active civic NPCs.

## P95.15 Accessibility / localisation implications

Law/permission reasons player-readable/localised.

## P95.16 Performance implications

Permission queries indexed/cached safely.

## P95.17 Security / trust implications

Permission results authoritative; UI cannot grant access.

## P95.18 Recommended child decomposition

- P95-A — government schema;
- P95-B — law schema;
- P95-C — jurisdiction/permission evaluator;
- P95-D — Civic Forge UI;
- P95-E — tax/customs/justice hooks;
- P95-F — validation/reconciliation.

## P95.19 Acceptance matrix

| ID | Requirement | Evidence | Gate |
| --- | --- | --- | --- |
| P95-AC01 | Government/law source authored/validated in Forge | EV-B / EV-C | Required |
| P95-AC02 | Permission evaluator works across at least storage/market/gate action classes | EV-B | Required |
| P95-AC03 | Denial returns explicit jurisdiction/law reason | EV-C | Required |
| P95-AC04 | Law/government remains distinct from culture/ancestry | EV-A / review | Required |
| P95-AC05 | Permit/exception can override according to explicit authority | EV-B | Required |
| P95-AC06 | Law effective/repeal state survives reload | EV-D | Required |
| P95-AC07 | Performance of repeated permission checks bounded | EV-E | Required |
| P95-AC08 | Final SHA/CI passes | EV-H | Required |

## P95.20 Negative tests

- no jurisdiction;
- conflicting law;
- expired permit;
- wrong authority;
- law repealed mid-task.

## P95.21 Manual acceptance scenario

Author settlement government.

Create market/storage/access laws.

Test allowed/denied actors.

Change/repeal one law.

Observe runtime permissions update.

## P95.22 Rule-of-cool target

The world can now say:

> **“You can't do that here, and this is why.”**

## P95.23 Exit gate

Civic law/permission authoring exists.

## P95.24 Downstream unlock

P96–P102.

## P95.25 Known risks / ADR triggers

- law precedence/conflict model;
- jurisdiction hierarchy.

---

# P96 — THE SEAT OF POWER

**Classification:** FOUNDATION / INTEGRATION  
**Arc:** ARC XII  
**Player/creator payoff:** Governments actually operate through officials, civic buildings, policies and records instead of existing only as lore tags.

## P96.1 Purpose

Create Governance Runtime v1.

## P96.2 Authoritative source packet

- P95;
- 20C;
- P32 NPC identities;
- P35 planner;
- P40 civic structures;
- P53 warehouses;
- economy/trade.

## P96.3 Entry gate

- P95 COMPLETE;
- named NPC/offices/structures available.

## P96.4 Dependencies

P32/P35/P40/P53/P95.

## P96.5 Universal primitives used

- Identity;
- Membership;
- Permission;
- State;
- History;
- Transaction;
- Result/Reason.

## P96.6 In scope

- government instance;
- jurisdiction;
- offices;
- office holder;
- succession/vacancy hook;
- civic seat/building;
- current law set;
- tax/customs collection hook;
- permits;
- public records;
- routine policy state;
- construction approval hook;
- emergency state hook;
- routine civic NPC tasks;
- player interaction;
- bounded governance update.

## P96.7 Explicit non-scope

- election campaign simulation;
- detailed bureaucracy;
- every justice case;
- diplomacy;
- war command.

## P96.8 Implementation capability requirements

Government continues existing if office-holder actor unloads.

## P96.9 Forge requirements

Government definition from P95.

## P96.10 Runtime requirements

Routine administration handled through systems/NPC tasks.

## P96.11 Canonical content subset

One settlement government plus contrasting second fixture.

## P96.12 Persistence implications

Office holders/laws/records persist.

## P96.13 Multiplayer / authority implications

World authority.

## P96.14 Simulation-LOD implications

Distant governance summary.

## P96.15 Accessibility / localisation implications

Permissions/taxes/policies explainable.

## P96.16 Performance implications

Civic update cadence bounded.

## P96.17 Security / trust implications

Office permissions validated.

## P96.18 Recommended child decomposition

- P96-A — government instance/offices;
- P96-B — office-holder lifecycle;
- P96-C — policy/law runtime;
- P96-D — permits/tax/customs records;
- P96-E — civic NPC/LOD/persistence;
- P96-F — reconciliation.

## P96.19 Acceptance matrix

| ID | Requirement | Evidence | Gate |
| --- | --- | --- | --- |
| P96-AC01 | Government instance persists independently of active officials | EV-D | Required |
| P96-AC02 | Office holder receives only office-authorised permissions | EV-B | Required |
| P96-AC03 | Vacancy/succession hook can change holder without changing government identity | EV-B | Required |
| P96-AC04 | Tax/customs/permit changes operate through transactions/permissions | EV-B | Required |
| P96-AC05 | Civic state survives away simulation/reload | EV-D | Required |
| P96-AC06 | Routine governance remains bounded | EV-E | Required |
| P96-AC07 | Final SHA/CI passes | EV-H | Required |

## P96.20 Negative tests

- official dies/leaves;
- seat damaged;
- permit revoked;
- law changes;
- settlement unloads.

## P96.21 Manual acceptance scenario

Visit civic seat.

Inspect office/laws.

Obtain/lose permit.

Replace office holder.

Save/reload.

## P96.22 Rule-of-cool target

A town hall finally means more than architecture.

## P96.23 Exit gate

Governance operates.

## P96.24 Downstream unlock

P97/P98/P99.

## P96.25 Known risks / ADR triggers

- succession selection ownership.

---

# P97 — LINES UPON THE EARTH

**Classification:** FOUNDATION / COOL-PULL  
**Arc:** ARC XII  
**Player/creator payoff:** Claims, borders and disputed land become persistent world state that affects law, trade, building and conflict.

## P97.1 Purpose

Create Territory & Jurisdiction Runtime.

## P97.2 Authoritative source packet

- faction/government canon;
- 20C;
- P73 regions;
- P81 cartography;
- P93–P96.

## P97.3 Entry gate

- faction/government/jurisdiction definitions.

## P97.4 Dependencies

P73/P81/P93–P96.

## P97.5 Universal primitives used

- Identity;
- Permission/Jurisdiction;
- Ownership;
- State;
- Knowledge;
- History;
- Result/Reason.

## P97.6 In scope

Territory records:

- claim ID;
- claimant faction/government;
- spatial region;
- claim basis/history hook;
- administrative jurisdiction;
- physical control;
- occupation status;
- disputed status;
- treaty/shared access;
- protected area;
- border crossing/checkpoint hook;
- map presentation;
- knowledge/confidence;
- change history.

## P97.7 Explicit non-scope

- every land parcel property deed;
- global political simulation;
- perfect continuous front lines.

## P97.8 Implementation capability requirements

Keep distinct:

- private ownership;
- faction claim;
- government jurisdiction;
- military control.

## P97.9 Forge requirements

World/Faction/Civic tools author claim profiles/maps.

## P97.10 Runtime requirements

Permission evaluator consumes jurisdiction.

## P97.11 Canonical content subset

Two neighbouring factions with neutral/disputed border.

## P97.12 Persistence implications

Claims/control history persists.

## P97.13 Multiplayer / authority implications

World-authoritative.

## P97.14 Simulation-LOD implications

Territory regional summary.

## P97.15 Accessibility / localisation implications

Political maps show disputed/uncertain state beyond colour.

## P97.16 Performance implications

Spatial jurisdiction queries bounded/indexed.

## P97.17 Security / trust implications

Player map doesn't reveal unknown political truth automatically.

## P97.18 Recommended child decomposition

- P97-A — claim/jurisdiction schema;
- P97-B — control/occupation/dispute;
- P97-C — spatial query;
- P97-D — permission integration;
- P97-E — map/knowledge/history;
- P97-F — reconciliation.

## P97.19 Acceptance matrix

| ID | Requirement | Evidence | Gate |
| --- | --- | --- | --- |
| P97-AC01 | Claim, jurisdiction, control and ownership remain distinguishable | EV-A / EV-B | Required |
| P97-AC02 | Permission result changes across jurisdiction border | EV-B / EV-C | Required |
| P97-AC03 | Disputed territory supports multiple claims/state | EV-B | Required |
| P97-AC04 | Occupation can change control without erasing claim/history | EV-B / EV-D | Required |
| P97-AC05 | Political map respects player knowledge/uncertainty | EV-B / EV-F | Required |
| P97-AC06 | Spatial queries remain bounded | EV-E | Required |
| P97-AC07 | Final SHA/CI passes | EV-H | Required |

## P97.20 Negative tests

- overlapping claims;
- no administrator;
- border moves;
- unknown claim;
- private property under changed jurisdiction.

## P97.21 Manual acceptance scenario

Cross border.

Observe law/trade permission change.

Enter disputed zone.

Inspect map uncertainty.

## P97.22 Rule-of-cool target

A line on the map finally has real consequences in the world.

## P97.23 Exit gate

Territory/jurisdiction works.

## P97.24 Downstream unlock

P98–P102.

## P97.25 Known risks / ADR triggers

- spatial representation/resolution.

---

# P98 — WORDS BEFORE SWORDS

**Classification:** FOUNDATION / COOL-PULL  
**Arc:** ARC XII  
**Player/creator payoff:** Factions can negotiate treaties, trade rights, borders, reparations and peace instead of every conflict resolving through combat.

## P98.1 Purpose

Create Diplomacy Runtime v1.

## P98.2 Authoritative source packet

- faction/politics canon;
- Quest/Event political families;
- P37 dialogue;
- P91 economy;
- P93–P97.

## P98.3 Entry gate

- factions;
- governments;
- territory.

## P98.4 Dependencies

P37/P91/P93–P97.

## P98.5 Universal primitives used

- Relationship;
- Permission;
- Knowledge;
- History;
- Transaction hook;
- State;
- Result/Reason.

## P98.6 In scope

Faction relationship state:

- recognition;
- contact/knowledge;
- standing;
- trust/fear hooks;
- hostility;
- treaty set;
- grievance/history;
- border relation;
- trade relation;
- war/peace status.

Treaty types v1:

- peace;
- ceasefire;
- trade agreement;
- transit/access;
- border agreement;
- non-aggression;
- alliance/defence hook;
- reparations/payment;
- prisoner/hostage exchange hook;
- recognition.

Diplomatic interaction:

- offer;
- demands/terms;
- authority to negotiate;
- accept/reject;
- expiry;
- breach;
- consequence/history.

## P98.7 Explicit non-scope

- natural-language AI diplomats;
- full espionage;
- political campaign;
- every treaty class.

## P98.8 Implementation capability requirements

Treaty is explicit state, not inferred from reputation.

## P98.9 Forge requirements

Faction/Civic/Dialogue tooling may author diplomatic profiles/templates.

## P98.10 Runtime requirements

Treaties feed:

- permission;
- trade;
- route access;
- war eligibility;
- territory.

## P98.11 Canonical content subset

Two/three factions with contrasting relations.

## P98.12 Persistence implications

Treaties/grievances/breaches persistent.

## P98.13 Multiplayer / authority implications

Authority controls diplomatic actions later.

## P98.14 Simulation-LOD implications

Regional strategic updates bounded.

## P98.15 Accessibility / localisation implications

Terms clear before irreversible acceptance.

## P98.16 Performance implications

Relationship graph bounded.

## P98.17 Security / trust implications

Actor must have negotiating authority.

## P98.18 Recommended child decomposition

- P98-A — relation/treaty schema;
- P98-B — offer/accept/breach;
- P98-C — permission/trade/border integration;
- P98-D — dialogue/UI;
- P98-E — history/persistence;
- P98-F — reconciliation.

## P98.19 Acceptance matrix

| ID | Requirement | Evidence | Gate |
| --- | --- | --- | --- |
| P98-AC01 | Treaty state explicit and persistent | EV-B / EV-D | Required |
| P98-AC02 | Reputation alone cannot create treaty | EV-B negative | Required |
| P98-AC03 | Trade/transit treaty affects relevant permissions | EV-B / EV-C | Required |
| P98-AC04 | Breach records history and changes relationship according to contract | EV-B | Required |
| P98-AC05 | Unauthorised actor cannot bind faction | EV-B negative | Required |
| P98-AC06 | Terms UI clearly presents consequences | EV-F / EV-G | Required |
| P98-AC07 | Final SHA/CI passes | EV-H | Required |

## P98.20 Negative tests

- expired authority;
- contradictory treaties;
- breach;
- no contact;
- settlement actor tries to bind sovereign faction.

## P98.21 Manual acceptance scenario

Negotiate trade/transit.

Observe route/market permission change.

Breach/revoke controlled fixture.

Observe history/relation consequences.

## P98.22 Rule-of-cool target

The player can genuinely solve a regional problem **without drawing a sword**.

## P98.23 Exit gate

Diplomacy exists as real state.

## P98.24 Downstream unlock

P99–P102.

## P98.25 Known risks / ADR triggers

- treaty precedence/conflict resolution.

---

# P99 — THE MUSTER

**Classification:** FOUNDATION  
**Arc:** ARC XII  
**Player/creator payoff:** Military power becomes a logistical institution that must equip, feed and move real people.

## P99.1 Purpose

Create Military & War Logistics foundation.

## P99.2 Authoritative source packet

- Combat/Defence;
- 20C military/readiness;
- P50 professions;
- P53 warehouses;
- P86–P90 logistics;
- P93–P98 governance/factions.

## P99.3 Entry gate

- government/military authority;
- routes/logistics/equipment.

## P99.4 Dependencies

P30/P31/P50/P53/P86–P90/P93–P98.

## P99.5 Universal primitives used

- Identity;
- Membership;
- Permission;
- Transaction;
- Route;
- Reservation;
- State;
- Result/Reason.

## P99.6 In scope

Military formation/group:

- formation ID;
- faction/government;
- members;
- commander;
- role mix;
- equipment;
- ammunition hook;
- food/medicine;
- transport;
- muster point;
- supply source;
- route;
- readiness;
- morale hook;
- objective;
- reserve/reinforcement hook;
- camp/bivouac;
- casualty/replacement hook;
- demobilisation.

## P99.7 Explicit non-scope

- grand strategy;
- naval forces;
- magic armies at full depth;
- detailed formation tactics;
- mass-battle renderer.

## P99.8 Implementation capability requirements

Military strength is constrained by real people/equipment/supply.

## P99.9 Forge requirements

Faction/Profession/Equipment sources.

## P99.10 Runtime requirements

Near combat uses P31.

Far military groups use bounded summaries preserving people/cargo/state.

## P99.11 Canonical content subset

Small militia/guard force.

## P99.12 Persistence implications

Members/equipment/supply/casualties persist.

## P99.13 Multiplayer / authority implications

Authoritative.

## P99.14 Simulation-LOD implications

Core.

## P99.15 Accessibility / localisation implications

Readiness/supply reasons readable.

## P99.16 Performance implications

Group summary cheap.

## P99.17 Security / trust implications

No free equipment/troops.

## P99.18 Recommended child decomposition

- P99-A — military group record;
- P99-B — muster/member assignment;
- P99-C — equipment/supply;
- P99-D — route/camp/readiness;
- P99-E — LOD/casualty/persistence;
- P99-F — reconciliation.

## P99.19 Acceptance matrix

| ID | Requirement | Evidence | Gate |
| --- | --- | --- | --- |
| P99-AC01 | Force consists of persistent real members | EV-B / EV-D | Required |
| P99-AC02 | Equipment/supply drawn from real stock | EV-B | Required |
| P99-AC03 | Missing supply reduces readiness/blocks action appropriately | EV-C | Required |
| P99-AC04 | Regional movement uses routes/logistics | EV-B | Required |
| P99-AC05 | Casualty/death preserves person/history consequence | EV-D | Required |
| P99-AC06 | Distant group summary stays bounded | EV-E | Required |
| P99-AC07 | Final SHA/CI passes | EV-H | Required |

## P99.20 Negative tests

- no food;
- no weapon;
- commander unavailable;
- route blocked;
- demobilise with cargo.

## P99.21 Manual acceptance scenario

Muster militia.

Equip from warehouse.

Move to border.

Consume supply.

Return/demobilise.

## P99.22 Rule-of-cool target

Armies stop being spawn tables and start being:

> **people the civilisation had to support.**

## P99.23 Exit gate

Military logistics works.

## P99.24 Downstream unlock

P100.

## P99.25 Known risks / ADR triggers

- mass combat abstraction threshold.

---

# P100 — WHEN BANNERS BURN

**Classification:** COOL-PULL / INTEGRATION  
**Arc:** ARC XII  
**Player/creator payoff:** Raids, sieges and wars can damage, capture and disrupt real settlements with persistent consequences.

## P100.1 Purpose

Create War / Raid / Siege Runtime v1.

## P100.2 Authoritative source packet

- Combat/Defence;
- Quest/Event war stages;
- 20C fortifications/sieges;
- P42 construction/damage/repair;
- P97 territory;
- P98 diplomacy;
- P99 military logistics.

## P100.3 Entry gate

- P99;
- diplomacy/territory/governance stable.

## P100.4 Dependencies

P31/P42/P97–P99.

## P100.5 Universal primitives used

- State;
- Permission;
- Territory;
- History;
- Transaction;
- Route;
- Result/Reason.

## P100.6 In scope

Conflict record:

- conflict/war ID;
- participants;
- war/raid state;
- declaration/trigger;
- objectives;
- target sites/routes/resources;
- front/campaign hook;
- forces;
- supplies;
- civilian/settlement protection hooks;
- structure damage;
- gate/wall/siege interaction;
- surrender/retreat;
- capture;
- ceasefire;
- battle/event results;
- casualties;
- loot/requisition rules;
- route disruption;
- settlement need consequences;
- history.

Siege/raid v1:

- approach;
- warning/intelligence;
- readiness;
- assault;
- breach/capture/repel;
- aftermath.

## P100.7 Explicit non-scope

- massive thousands-unit simulation;
- every siege engine;
- naval war;
- total-war strategy layer;
- graphic atrocity simulation.

## P100.8 Implementation capability requirements

War uses normal:

- combat;
- structures;
- warehouses;
- routes;
- people;
- government;
- territory.

## P100.9 Forge requirements

Faction/Military/Structure content.

## P100.10 Runtime requirements

Difficulty/world settings can bound destructiveness according to canon.

## P100.11 Canonical content subset

One raid/siege fixture.

## P100.12 Persistence implications

Damage/casualties/control/history persist.

## P100.13 Multiplayer / authority implications

World/server authority.

## P100.14 Simulation-LOD implications

Far campaign summaries; active battle local.

## P100.15 Accessibility / localisation implications

Telegraphs/civilian danger/aftermath clear.

## P100.16 Performance implications

Battle population/effects bounded.

## P100.17 Security / trust implications

Loot/capture permissions explicit.

## P100.18 Recommended child decomposition

- P100-A — conflict/war record;
- P100-B — raid/siege phases;
- P100-C — military/route/supply integration;
- P100-D — structure/capture/damage;
- P100-E — casualties/aftermath/LOD;
- P100-F — reconciliation.

## P100.19 Acceptance matrix

| ID | Requirement | Evidence | Gate |
| --- | --- | --- | --- |
| P100-AC01 | Conflict has explicit participants/objectives/state | EV-B | Required |
| P100-AC02 | Attacking force depends on P99 members/supply | EV-B | Required |
| P100-AC03 | Structure damage/capture uses normal structure state | EV-B / EV-C | Required |
| P100-AC04 | Casualties persist as real entity/person consequences | EV-D | Required |
| P100-AC05 | Route/trade/settlement needs react to conflict | EV-C | Required |
| P100-AC06 | Ceasefire/surrender can terminate violence without annihilation | EV-C | Required |
| P100-AC07 | Difficulty settings bound destructive consequences as configured | EV-B / EV-C | Required |
| P100-AC08 | Large representative encounter stays bounded | EV-E | Required |
| P100-AC09 | Final SHA/CI passes | EV-H | Required |

## P100.20 Negative tests

- supply exhausted;
- ceasefire mid-assault;
- commander killed;
- wall already destroyed;
- settlement unloaded;
- surrender accepted.

## P100.21 Manual acceptance scenario

Prepare settlement defence.

Observe hostile muster/approach.

Raid/siege begins.

Damage structures.

Repel or surrender in separate fixture.

Inspect aftermath.

## P100.22 Rule-of-cool target

War should feel dangerous because:

> **the world you built can actually be changed by it.**

## P100.23 Exit gate

Conflict runtime works.

## P100.24 Downstream unlock

P101/P102.

## P100.25 Known risks / ADR triggers

- mass-combat abstraction;
- siege navigation/destruction.

---

# P101 — WHAT REMAINS

**Classification:** INTEGRATION / FOUNDATION  
**Arc:** ARC XII  
**Player/creator payoff:** After conquest or destruction, settlements retain scars, occupation layers, displaced people and reconstruction choices instead of resetting to normal.

## P101.1 Purpose

Create Occupation, Reconstruction & Conflict Memory.

## P101.2 Authoritative source packet

- 20G occupation/heritage/restoration;
- 20C aftermath;
- Quest/Event war history;
- P42 construction/repair;
- P44 households;
- P47 migration;
- P97 territory;
- P100 war.

## P101.3 Entry gate

- P100 COMPLETE.

## P101.4 Dependencies

P42/P44/P47/P93–P100.

## P101.5 Universal primitives used

- History;
- Identity;
- State;
- Ownership;
- Permission;
- Membership;
- Transaction;
- Result/Reason.

## P101.6 In scope

Occupation state:

- occupier;
- original authority;
- current control;
- law overlay;
- checkpoints;
- public-building control;
- tax/requisition hook;
- military presence;
- resistance/unrest hook;
- private ownership preservation/seizure record;
- faction/culture overlays;
- displaced/refugee/migration hook.

Reconstruction:

- damage survey;
- repair priorities;
- resource requirements;
- labour;
- restore/rebuild/adaptive reuse;
- remove occupation layers;
- memorial/ruin preservation;
- service restoration;
- route reopening;
- household return;
- history/provenance.

Conflict memory:

- deaths/casualties;
- aid;
- betrayal;
- occupation;
- liberation;
- destruction;
- reconstruction;
- treaty outcome.

## P101.7 Explicit non-scope

- full generational history;
- advanced insurgency simulation;
- cultural assimilation simulator;
- transitional justice depth.

## P101.8 Implementation capability requirements

Occupation may change control/permissions.

It does not rewrite origin history or culture instantly.

## P101.9 Forge requirements

Structure/culture overlays and reconstruction profiles.

## P101.10 Runtime requirements

Repair/rebuild uses normal projects/resources.

## P101.11 Canonical content subset

One occupied/damaged settlement fixture.

## P101.12 Persistence implications

Critical.

## P101.13 Multiplayer / authority implications

Shared world state.

## P101.14 Simulation-LOD implications

Occupation/reconstruction summaries regional.

## P101.15 Accessibility / localisation implications

Player-facing control/ownership/history distinctions clear.

## P101.16 Performance implications

State overlays not duplicate whole settlement content.

## P101.17 Security / trust implications

Private/public ownership transitions explicit.

## P101.18 Recommended child decomposition

- P101-A — occupation/control overlay;
- P101-B — ownership/law/public building effects;
- P101-C — displacement/household impacts;
- P101-D — reconstruction projects;
- P101-E — history/provenance;
- P101-F — reconciliation.

## P101.19 Acceptance matrix

| ID | Requirement | Evidence | Gate |
| --- | --- | --- | --- |
| P101-AC01 | Occupation changes control without erasing origin/culture/history | EV-B / EV-D | Required |
| P101-AC02 | Private goods do not automatically transfer without explicit seizure rule | EV-B negative | Required |
| P101-AC03 | Reconstruction consumes real labour/resources | EV-B / EV-C | Required |
| P101-AC04 | Households/migration react to damaged/occupied state | EV-C | Required |
| P101-AC05 | Structure origin/occupation/restoration layers remain traceable | EV-D | Required |
| P101-AC06 | Liberation/end occupation can remove authority overlay while preserving history | EV-B / EV-C | Required |
| P101-AC07 | Final SHA/CI passes | EV-H | Required |

## P101.20 Negative tests

- occupier withdraws;
- private warehouse;
- public building seized;
- residents return;
- structure restored with foreign material;
- save during reconstruction.

## P101.21 Manual acceptance scenario

Run controlled siege/capture.

Inspect occupation law/control.

Begin reconstruction.

Restore building/route.

End occupation.

Inspect preserved history.

## P101.22 Rule-of-cool target

The world should visibly answer:

> **“What happened here?”**

years after the battle ended.

## P101.23 Exit gate

Conflict aftermath persists and can recover.

## P101.24 Downstream unlock

P102 and later P138+ world history/memory.

## P101.25 Known risks / ADR triggers

- occupation overlay precedence;
- ownership restoration policy.

---

# P102 — CROWNS & CONSEQUENCES

**Classification:** INTEGRATION / COOL-PULL  
**Arc:** ARC XII  
**Player/creator payoff:** A regional political conflict can move from trade and border tension through diplomacy or war into occupation, reconstruction and remembered consequences.

## P102.1 Purpose

Certify ARC XII and the first complete civilisation-political loop.

## P102.2 Authoritative source packet

- P93–P101;
- P83–P92;
- settlement/world/combat/quest systems.

## P102.3 Entry gate

- P93–P101 COMPLETE.

## P102.4 Dependencies

All ARC XII plus relevant ARC XI systems.

## P102.5 Universal primitives used

Nearly all social/civic primitives.

## P102.6 In scope

Golden political region:

- multiple cultures/ancestries represented safely;
- at least three factions;
- at least two governments;
- border/jurisdiction;
- trade relationship;
- treaty;
- grievance/tension;
- military muster;
- optional peaceful resolution path;
- controlled conflict path;
- raid/siege;
- territory/control change;
- occupation;
- civilian/household/service effects;
- reconstruction;
- treaty/peace;
- map/knowledge;
- history.

Player can meaningfully:

- trade;
- negotiate;
- aid;
- defend;
- attack where allowed;
- repair;
- influence outcome.

## P102.7 Explicit non-scope

- global grand strategy;
- all factions/governments;
- naval war;
- realms;
- full espionage;
- procedural politics AI.

## P102.8 Implementation capability requirements

No bespoke `PoliticalArcController`.

State transitions arise through normal:

- trade;
- diplomacy;
- law;
- territory;
- military;
- combat;
- occupation;
- project;
- history.

## P102.9 Forge requirements

Faction/Civic/Commerce/Structure sources.

## P102.10 Runtime requirements

End-to-end persistent consequence.

## P102.11 Canonical content subset

One small regional conflict fixture.

## P102.12 Persistence implications

Critical across all systems.

## P102.13 Multiplayer / authority implications

Future-safe shared world authority.

## P102.14 Simulation-LOD implications

Regional strategic simulation must remain bounded.

## P102.15 Accessibility / localisation implications

Political state/reasons known only where appropriate, presented clearly and without colour-only maps.

## P102.16 Performance implications

Combined faction/route/economy/military updates measured.

## P102.17 Security / trust implications

Permission/treaty/ownership/cargo conservation negative tests.

## P102.18 Recommended child decomposition

- P102-A — political-region fixture;
- P102-B — identity/faction/government integration;
- P102-C — diplomacy/territory/economy;
- P102-D — muster/conflict/occupation;
- P102-E — reconstruction/history/map;
- P102-F — performance/human review;
- P102-G — PG-12 reconciliation.

## P102.19 Acceptance matrix

| ID | Requirement | Evidence | Gate |
| --- | --- | --- | --- |
| P102-AC01 | Factions/cultures/governments remain semantically distinct throughout scenario | EV-A / EV-B | Required |
| P102-AC02 | Trade/treaty/border permissions affect real gameplay | EV-C | Required |
| P102-AC03 | Peaceful negotiated path can resolve at least one major tension fixture | EV-C | Required |
| P102-AC04 | Conflict path uses real military supply/people/structures | EV-B / EV-C | Required |
| P102-AC05 | Territory/control changes persist without erasing history | EV-D | Required |
| P102-AC06 | Occupation affects law/access/public control without automatic cultural assimilation | EV-B | Required |
| P102-AC07 | Reconstruction consumes real resources and restores service incrementally | EV-C | Required |
| P102-AC08 | Political map respects knowledge/disputed state | EV-F / EV-B | Required |
| P102-AC09 | Regional simulation stays bounded | EV-E | Required |
| P102-AC10 | Human review confirms actions have understandable consequences | EV-G | Required |
| P102-AC11 | No bespoke political-arc controller exists | EV-A / review | Required |
| P102-AC12 | Final SHA/CI passes | EV-H | Required |

## P102.20 Negative tests

- treaty breached;
- leader/official dies;
- road/trade cut;
- army under-supplied;
- settlement occupied;
- occupation ends;
- reconstruction incomplete;
- unknown border claim;
- private/public ownership conflict.

## P102.21 Manual acceptance scenario

Begin in economically connected region.

Observe border/treaty tension.

Try negotiated solution.

Run alternate fixture into conflict.

Muster forces.

Fight/defend siege.

Inspect occupation/control.

Rebuild.

Sign/end conflict.

Return after time/reload.

Inspect changed maps, stock, residents, government and history.

## P102.22 Rule-of-cool target

The desired feeling is:

> **“This kingdom is not a backdrop. What happened between these people actually changed the world.”**

## P102.23 Exit gate — PG-12 SOCIETY, GOVERNANCE & CONFLICT FOUNDATION

PG-12 passes when:

- P93–P102 COMPLETE;
- identities remain properly separated;
- faction/government/law/territory/diplomacy operate through shared contracts;
- military power consumes real people/resources/logistics;
- conflict creates persistent damage/control/history;
- occupation/reconstruction preserve provenance and culture;
- peaceful and violent outcomes both exist where the scenario permits.

## P102.24 Downstream unlock

ARC XIII — CALL OF THE DEEP BLUE:

- production water/liquid runtime;
- Hydrology & Water Forge;
- tides/currents/storm seas;
- ports/docks/shipyards;
- vessel contract;
- Vessel Forge;
- moving vessel runtime;
- maritime professions/crew;
- maritime routes/trade;
- marine ecology/underwater exploration;
- naval combat/piracy/navies;
- Stormbound integration.

## P102.25 Known risks / ADR triggers

- interaction between economy/diplomacy/war feedback loops;
- faction strategic update scheduling;
- territory/control resolution after complex conflicts.

---

# 05. Arc XI Integration Gate — PG-11 Summary

PG-11 requires:

| Capability | Parent |
| --- | --- |
| Economy / Exchange Contract | P83 |
| Commerce Forge | P84 |
| Merchants / Markets | P85 |
| Land Transport | P86 |
| Regional Routes | P87 |
| Caravans | P88 |
| Route Events / Maintenance | P89 |
| Regional Freight | P90 |
| Living Regional Economy | P91 |
| Roads of Gold & Dust | P92 |

Minimum end-to-end:

```text
town A produces surplus
→ merchant/contract identifies demand
→ warehouse reserves goods
→ wagon/caravan loads
→ travels regional route
→ route event disrupts journey
→ reroute/repair
→ destination receives exact cargo
→ market stock/prices change
→ player knowledge/map updates legitimately
→ save/reload
```

---

# 06. Arc XII Integration Gate — PG-12 Summary

PG-12 requires:

| Capability | Parent |
| --- | --- |
| Society / Culture / Faction Contract | P93 |
| Faction Forge | P94 |
| Government & Law Forge | P95 |
| Governance Runtime | P96 |
| Territory / Jurisdiction | P97 |
| Diplomacy | P98 |
| Military / War Logistics | P99 |
| War / Raid / Siege | P100 |
| Occupation / Reconstruction / Memory | P101 |
| Crowns & Consequences | P102 |

Minimum end-to-end:

```text
distinct peoples/cultures/factions/governments
→ border/jurisdiction
→ trade/treaty
→ grievance/tension
→ diplomacy
→ peaceful resolution OR muster
→ conflict
→ damage/capture
→ occupation/control change
→ reconstruction
→ peace/treaty
→ persistent history
```

---

# 07. Recommended Production Concurrency

The numeric order remains the governing default.

## P83/P84/P85

Commerce Forge work can begin once the P83 exchange/value contracts are stable.

P85 must not invent merchant-only transaction semantics.

## P86/P87

Transport definition and regional route implementation can overlap around shared mode/clearance contracts.

## P88/P89/P90

Caravan, route-event and freight work may overlap after route/cargo authority stabilises.

P89 cannot directly delete cargo; it emits governed outcomes consumed by P88/P90.

## P93/P94/P95

Social identity contract must stabilise first.

Faction and Civic Forge can then develop partly in parallel as long as:

- P94 owns faction;
- P95 owns government/law;
- neither owns culture/ancestry.

## P97/P98/P99

Territory, diplomacy and military logistics can overlap against stable jurisdiction/faction/government interfaces.

## P100/P101

Aftermath architecture can begin during P100 fixture work so damage/control records already carry the history P101 needs.

---

# 08. What Must NOT Sneak Into Arcs XI–XII

## Economy

- banking simulator;
- stock market;
- modern financial derivatives;
- invisible infinite merchant stock;
- global omniscient market UI.

## Politics

- real-world political analogues as direct caricatures;
- ancestry-based morality;
- ancestry-based government assignment;
- culture = faction shortcuts;
- full grand-strategy AI;
- election campaigning simulation.

## Conflict

- mass armies with free equipment;
- settlement-reset-after-war;
- instant assimilation;
- private-goods auto-transfer;
- unlimited war spawning;
- naval war.

---

# 09. Cross-Arc Architectural Discoveries Locked Here

## 09.1 Regional economy builds directly on warehouse truth

P53 remains authoritative.

P91 is a summary/coordination layer, not a replacement economy database.

That prevents:

```text
warehouse says 20 grain
economy sim says 400 grain
```

drift.

## 09.2 Trade contract and freight manifest are distinct

Trade contract says:

> **what parties agreed should move and under what terms.**

Freight manifest says:

> **what physical cargo is currently committed/in transit.**

Keeping them separate supports:

- partial delivery;
- loss;
- cancellation;
- substitution where allowed;
- penalties;
- history.

## 09.3 Route becomes a civilisation-scale primitive

P46 local roads and P87 regional routes now share enough semantics to support later:

- caravans;
- military;
- maritime routes;
- portals.

## 09.4 Social identity separation is constitutional

P93 is not merely a content schema.

It protects the project from accidentally encoding:

- body = culture;
- culture = faction;
- faction = government;
- government = morality.

## 09.5 Permission/Jurisdiction becomes one of the most reused primitives

P95 formalises a contract that already existed conceptually in:

- storage;
- construction;
- logistics;
- markets.

It now extends coherently to:

- borders;
- law;
- military;
- diplomacy;
- future ports/ships/portals/multiplayer.

## 09.6 Territory is layered evidence

P97's separation of:

- claim;
- administration;
- physical control;
- occupation;
- private ownership

is necessary for meaningful war/occupation/history.

## 09.7 Diplomacy is not reputation

Reputation/standing can influence negotiation.

Only explicit treaty/relationship state changes legal and strategic relationships.

## 09.8 War is a civilisation stress test

P100 intentionally pressures:

- logistics;
- routes;
- stock;
- defence;
- people;
- structures;
- government;
- morale/needs;
- history.

If war is only combat, it has failed the civilisation fantasy.

## 09.9 Occupation overlays preserve provenance

P101 carries forward 20G's rule:

> new banners/checkpoints/law do not rewrite who built the place or who lived there.

This becomes foundational for later world-history systems.

---

# 10. Recommended Persistent Regression Fixtures

Retain:

- P83 atomic exchange fixture;
- P84 merchant/contract source pack;
- P85 local market;
- P86 loaded wagon/pack-animal fixture;
- P87 two-route regional network;
- P88 caravan LOD fixture;
- P89 damaged-route/event fixture;
- P90 warehouse-to-warehouse freight fixture;
- P91 three-settlement economy;
- P92 Roads of Gold & Dust integration region;
- P93 mixed social-identity fixture;
- P94 three-faction source pack;
- P95 government/law permission fixture;
- P96 office-holder succession fixture;
- P97 disputed border;
- P98 treaty/breach fixture;
- P99 militia supply/muster fixture;
- P100 raid/siege fixture;
- P101 occupation/reconstruction settlement;
- P102 Crowns & Consequences political-region fixture.

P92 and P102 should become long-term regression worlds.

---

# 11. ProductionRegistry Seed Entries

```text
P083 — What Is It Worth?
P084 — The Merchant's Ledger
P085 — Market Day
P086 — Pack, Cart & Saddle
P087 — The Long Road
P088 — Caravan Bells
P089 — The Road Remembers
P090 — Warehouse to Warehouse
P091 — The Living Market
P092 — Roads of Gold & Dust
P093 — Threads of Identity
P094 — Banners in the Wind
P095 — The Civic Forge
P096 — The Seat of Power
P097 — Lines Upon the Earth
P098 — Words Before Swords
P099 — The Muster
P100 — When Banners Burn
P101 — What Remains
P102 — Crowns & Consequences
```

No status becomes READY because this document exists.

---

# 12. Open Decisions Deliberately Deferred to Execution Evidence

PROD-12 does not silently decide:

- exact currency families/exchange rates;
- exact pricing equations;
- exact merchant margins;
- exact tax/customs rates;
- exact caravan speeds;
- exact wagon physics implementation;
- exact route danger formulas;
- exact contract penalty values;
- exact regional-economy update cadence;
- exact faction strategic-goal algorithm;
- exact government succession/election mechanics for every government type;
- exact law precedence model beyond required contract;
- exact territory spatial resolution;
- exact diplomacy scoring model;
- exact army size;
- exact battle abstraction threshold;
- exact siege duration;
- exact occupation policy catalogue;
- exact reconstruction cost multipliers.

These remain evidence/content/balance decisions.

---

# 13. PROD-12 Acceptance Gate

PROD-12 is ready for owner lock when the owner agrees that:

- [ ] P83–P102 retain PROD-02 names/order;
- [ ] economy remains anchored to real inventory/warehouse/production stock;
- [ ] barter and currency use one atomic exchange contract;
- [ ] price is contextual offer/value rather than universal objective truth;
- [ ] markets cannot create stock from stall/market capacity;
- [ ] contracts reserve real stock/capacity;
- [ ] land transport preserves real cargo capacity and identity;
- [ ] the Route primitive scales coherently from local to regional;
- [ ] caravan LOD preserves people, cargo, route and events;
- [ ] route danger cannot arbitrarily delete resources without explicit event/loss record;
- [ ] freight has exactly one authoritative cargo location/owner state at a time;
- [ ] regional economy is bounded and reconciles to settlement stock/production;
- [ ] ancestry, people, culture, faction, faith and government remain distinct;
- [ ] hostility is not biologically inherited;
- [ ] Faction Forge does not duplicate Culture;
- [ ] Government & Law Forge owns institutional authority, not cultural identity;
- [ ] one universal Permission/Jurisdiction evaluation contract is reused across domains;
- [ ] claim, administration, military control, occupation and private ownership remain distinguishable;
- [ ] diplomacy uses explicit treaties rather than treating reputation as treaty state;
- [ ] military force requires real people, equipment, supply and routes;
- [ ] raids/sieges/wars create persistent real consequences rather than enemy-wave resets;
- [ ] occupation does not instantly assimilate culture or transfer every private good;
- [ ] reconstruction consumes real resources/labour and preserves historical provenance;
- [ ] P92/P102 are composition tests rather than bespoke scenario controllers;
- [ ] exact balance/strategic algorithms remain evidence-driven.

---

# 14. Proposed Lock Statement

If owner-approved, lock the following:

> **PROD-12 — LEYFORGE ARCS XI–XII PRODUCTION CONTRACTS — v0.1**
>
> ARC XI establishes Leyforge's regional economy through a shared atomic exchange contract, Commerce Forge, real merchant and market stock, land transport, regional routes, persistent caravans, route condition/events, warehouse-to-warehouse freight and a bounded living-market simulation. Goods, currency and cargo remain authoritative inventory/warehouse resources; price is contextual; route risk produces explicit events rather than arbitrary stock deletion; and distant trade preserves cargo, people and commitments through simulation LOD. ARC XII then establishes a trustworthy society and political model that keeps ancestry, culture, faction, faith and government separate. Faction Forge and Government & Law Forge build on shared Membership, Relationship, Permission and Jurisdiction contracts. Territory distinguishes claims, administration, control, occupation and private ownership; diplomacy uses explicit treaty state; military strength consumes real people, equipment, supply and routes; war changes real settlements; and occupation/reconstruction preserve provenance, cultural identity and historical memory. By P102, trade, diplomacy, conflict and recovery can change a region persistently without bespoke political controllers or ancestry-based social shortcuts.

---

# 15. Next Document

After PROD-12 acceptance/reconciliation, continue to:

> **PROD-13 — Arcs XIII–XIV Production Contracts: P103–P126**

That volume will cover:

- production water/liquid runtime;
- Hydrology & Water Forge;
- waves, tides, currents and storm seas;
- ports, docks and shipyards;
- Vessel Contract;
- Vessel Forge;
- moving Vessel Runtime;
- maritime professions and crews;
- maritime trade/travel;
- marine ecology and underwater exploration;
- naval combat, piracy and navies;
- Stormbound integration;
- Realm & Portal Contract;
- Portal Forge;
- Realm Forge;
- first full realm crossing;
- Verdant Covenant;
- Ancestral Veil;
- Somnolent Expanse;
- Ascendant Reach;
- Impossible Deep;
- Ashen Lower Realms;
- cross-realm trade/logistics;
- Seven Worlds, One Ley integration.

---

**End of PROD-12 v0.1 — Arcs XI–XII Production Contracts Candidate**
