# LEYFORGE

## 20C — Governance, Safety, Defence, Justice and Emergency Services

### Civic-Service Capacity, Justice Infrastructure, Protection Networks, Fortifications, Emergency Response, Refuge and Blueprint/Project Contracts

**Version 1.0 — Reconciled Production Companion Draft**  
**Date:** 8 August 2026  
**Production Status:** Active Document Set 20 v1.0 Reconciliation  
**Supersedes:** `20C_Fantasy_Voxel_Civilisation_Sandbox_Governance_Safety_Defence_Justice_and_Emergency_Services_v0_2` for active production direction  
**Master Authority:** Document 20 v1.0  
**Settlement Planning / Growth:** Document 19 v1.0  
**Persistent Structure State:** Document 12 v1.0  
**Official Blueprint Source:** Document 22I Blueprint Forge  
**Canonical Blocks / Items / Recipes / Resources:** Documents 03–06 v1.0  
**Persistent People / Guards / Officials / Responders:** Document 07 v1.0  
**Automation / Signals / Fixed Logistics:** Document 08 v1.0  
**Magic / Wards / Magical Detection:** Document 09 v1.0  
**Creatures / Threat Ecology:** Document 10 v1.0  
**World / Terrain / Hazard Context:** Document 11 v1.0  
**Government / Law / Jurisdiction / Citizenship / Territory / War / Political Authority:** Document 13 v1.0  
**Quest / Event / Incident Lifecycle:** Document 15 v1.0  
**Combat / Guard / Tactical Conflict:** Document 16 v1.0  
**UI / Player Trust:** Document 17 v1.0  
**Godot + Summer Engine Technical Authority:** Document 18 v1.0  
**Economy / Taxes / Fines / Treasury / Customs Transactions / Public Finance:** Set 27  
**Dialogue / Trust / Testimony / Persuasion / Willingness / Social Memory:** Set 28  
**Health / Stamina / Fatigue / Injury / Treatment / Biological Outcome:** Set 29  
**Movement / Patrol / Pursuit / Evacuation / Responder Travel:** Set 30, with Set 26 specialist aquatic/vessel movement  
**Ports / Maritime Customs / Rescue / Coastal Defence Specialist:** Set 26, especially 26J/26L/26O  
**Production Governance / Registry / Lifecycle:** Set 25  
**Project Lead and Final Authority:** Ash

A production companion for the civic, legal, protective and emergency-service side of Leyforge settlements. 20C defines **physical civic-service, justice-service, detection, readiness, fortification, access-control, emergency-response and refuge capacity** while preserving strict ownership boundaries with government, law, social process, economics, combat, biology, movement, people, events and maritime systems.

> **20C Functional Rule**
>
> **A 20C building provides a physical/service opportunity for governance, justice, protection, access control, response or refuge. It does not create lawful authority, guilt, loyalty, wages, taxes, combat victory, biological healing or movement success by existing. Those truths remain with their owners.**

> **Government / Building Separation Rule**
>
> **Document 13 owns recognised government, office authority, law, jurisdiction, citizenship, treaties, war/peace, territorial claims and formal political state. 20C owns the places, secure records, public interfaces, staffing positions and service capacity through which those systems can operate. A throne room cannot create sovereignty and an empty town hall cannot create a government.**

> **Justice / Social / Legal Separation Rule**
>
> **20C owns courthouse, evidence-storage, hearing, humane-holding and administrative case-service capacity. Document 13 owns the active law, jurisdiction and authorised legal outcome. Set 28 owns testimony as social/informational behaviour, persuasion, Trust, willingness and social memory. A court building cannot decide guilt from its floor plan.**

> **Defence / Combat Separation Rule**
>
> **20C owns detection positions, warning/signal capacity, guard posts, muster/training infrastructure, armoury service, physical fortifications, gates, refuge and readiness inputs. Document 16 owns actual tactical combat resolution. A wall can delay and channel attackers; it cannot guarantee victory.**

> **Emergency / Biology / Movement Separation Rule**
>
> **20C owns emergency-dispatch, rescue-equipment, refuge, muster, evacuation-route and incident-response facility capacity. Set 29 owns injury, Health, smoke/toxin/disease and treatment outcomes. Set 30 owns physical evacuation, patrol, pursuit and responder travel. Document 15 owns event/incident lifecycle and aftermath orchestration.**

> **Economy / Public Finance Separation Rule**
>
> **20C may host a tax/customs office, treasury counter, inspection lane or fine-payment interface. Document 13 owns who has lawful authority to levy or regulate; Set 27 owns assessment, amount, payment, treasury, tariffs, fines and public-finance consequences. The building never generates revenue merely because a ledger desk exists.**

> **Maritime Civic-Service Rule**
>
> **Port customs, harbour authority, maritime rescue and coastal protection consume 20C civic/protection facilities where appropriate, but Set 26 owns specialist port-call, vessel, naval, marine-rescue and maritime-movement execution. A customs office on a harbour does not become the PortNode owner.**

> **Canonical Construction Rule**
>
> **20C projects reference canonical Blocks directly when the placed and recovered identity is the same Block. Inventory/project logistics use generated Block Inventory Projections. Duplicate recoverable Block Items are forbidden under FR-00-20-006.**

> **POC Retirement Rule**
>
> **The Forest Hamlet watchtower/guard-post/palisade/gate raid chain remains Archived Validation only. Generic civic halls, watchtowers, guard posts, walls, gates, armouries, courts, fire/rescue and refuge functions survive. Legacy POC/Legacy Alpha Provenance/Legacy Beta Provenance labels are provenance, not current production lifecycle authority.**

---

# Revision 1.0 Summary

Version 1.0 is a targeted production reconciliation of the strong 20C v0.2 design.

It preserves:

- all **17 protected 20C stable building/project IDs** in the current 61–80 catalogue range;
- the seven-needs lock;
- the `Detection → Warning → Delay → Response → Sustainment → Refuge → Recovery` protection chain;
- fair, non-omniscient detection principles;
- civic/public/secure semantic separation;
- watchtower coverage and signal networks;
- patrol and guard-position contracts;
- modular perimeter/gate projects;
- armoury, barracks, justice, emergency-response and refuge functional design;
- Blueprint Forge source contracts;
- staged construction and commissioning;
- damage, occupation, repair and restoration;
- distant simulation and multiplayer authority;
- source/version/migration safety.

It changes or clarifies:

- **Document 13**, not 20C, owns recognised political authority, laws, jurisdiction, citizenship, diplomacy treaties, war/peace and political claims;
- **Set 27**, not 20C, owns tax/fine/tariff amounts, collection, treasury, public finance, customs transactions and economic consequence;
- **Set 28**, not 20C, owns Trust, social willingness, testimony as social/informational behaviour, persuasion and relationship consequences;
- **Set 29**, not 20C, owns Health, injury, Fatigue, treatment and biological emergency outcomes;
- **Set 30**, not 20C, owns patrol/pursuit/evacuation/responder movement, route accessibility and arrival;
- **Document 16**, not 20C, owns combat and tactical guard resolution;
- **Document 15**, not 20C, owns raid/disaster/event lifecycle and aftermath orchestration;
- **Document 07** owns persistent officials, guards, responders and schedules;
- **Document 19** owns settlement planner candidate selection and growth readiness;
- **Document 20** owns authoritative ConstructionProjects and function activation;
- **Document 12** owns persistent StructureInstances and physical damage/history;
- Set 26 owns specialist port, vessel, maritime rescue and naval execution;
- legacy milestone labels become provenance pending 20H v1.0.

---

# Document Purpose

Document 20C is the detailed functional specification for **Governance, Safety, Defence, Justice and Emergency Services** inside the Document-20 universal building system.

It answers:

1. What physical/service infrastructure is required for civic requests, records, administration and lawful public access?
2. How do justice facilities support reports, evidence, hearings and humane holding without owning law, guilt or social truth?
3. How do watchtowers, guard posts, walls, gates, armouries and training facilities contribute to Safety without becoming a duplicate combat system?
4. What must a fire/rescue or refuge facility provide before responders and civilians can use it?
5. How do taxation/customs and diplomatic buildings provide real civic interfaces without creating revenue, treaties or political legitimacy?
6. How do damage, occupation, contested authority, blocked routes and missing staff degrade only the functions that actually fail?

The design target remains **fair consequence without constant administrative micromanagement**.

NPCs and institutions should normally handle:

- routine requests;
- ordinary patrols;
- standard gate access;
- ordinary evidence intake;
- routine emergency dispatch;
- normal civic queues;
- ordinary tax/customs service

through their owning systems and policies.

The player becomes involved when:

- authority is contested;
- a law/policy matters;
- a major case or dispute escalates;
- a threat/raid creates strategic choices;
- a fortification is damaged;
- a district needs better emergency coverage;
- a treaty/customs dispute matters;
- occupation/rebellion/conquest changes civic control;
- a player proposes unusual civic/defence construction;
- an event creates meaningful emergency or recovery decisions.

---

# Design Sources and Dependencies

| Source | 20C Production Dependency |
|---|---|
| 03–06 v1.0 | Canonical Blocks/Items, real equipment/supplies, exact repairs/transformations and resource conservation. |
| 07 v1.0 | Persistent leaders, officials, guards, responders, jobs, schedules and local task execution. |
| 08 v1.0 | Alarm relays, automated gates, fixed logistics, stock routing and approved automated support. |
| 09 v1.0 | Wards, magical detection, cleansing, magical security and ritual/portal-related civic interfaces. |
| 10–11 v1.0 | Threat ecology, terrain, sightlines, hazards, strategic approaches and environmental context. |
| 12 v1.0 | StructureInstance, damage, occupation, restoration, physical route structures and history. |
| 13 v1.0 | Government, law, jurisdiction, citizenship, territory, treaties, war/peace, political office and formal authority. |
| 15 v1.0 | Incidents, raids, disasters, emergency events, warnings and aftermath orchestration. |
| 16 v1.0 | Guard/tactical combat, attacks, cover, siege resolution, casualties and combat outcome. |
| 17 v1.0 | Civic/readiness/service view models, reason codes, knowledge/freshness and accessible alerts. |
| 18 v1.0 | Godot/Summer services, save/LOD/authority, transactions/evidence and repository-honesty rules. |
| 19 v1.0 | Settlement planner, parcels/districts, project pools, growth readiness and player proposals. |
| 20 v1.0 | Master seven-needs, ConstructionProject and function activation authority. |
| 20H v0.2 baseline pending 20H v1.0 reconciliation baseline | Protected stable catalogue IDs pending final 20H v1.0 lifecycle/catalogue reconciliation. |
| 22I | Official Blueprint Forge source. |
| Set 25 | Registry, lifecycle, packs, validation, migrations and Archived Validation governance. |
| Set 26 | Port/customs/rescue/coastal-defence specialist interfaces and vessel/maritime movement. |
| Set 27 | Taxes, tariffs, fines, treasury, customs transactions and public finance. |
| Set 28 | Social willingness, testimony, persuasion, Trust/relationship memory and social response. |
| Set 29 | Health, injury, fatigue, treatment, smoke/toxin/disease and biological emergency outcomes. |
| Set 30 | Patrol/pursuit/evacuation/responder movement, route accessibility and arrival. |

---

# Static Table of Contents

1. Locked 20C Identity  
2. Scope Boundaries and Anti-Micromanagement Rules  
3. Source-of-Truth and Record Separation  
4. Seven-Needs Integration  
5. Shared Governance, Safety and Protection Model  
6. Shared Semantic Contracts and Network Layers  
7. Governance, Leadership, Laws and Permissions  
8. Records, Planning and Blueprint Administration  
9. Justice, Crime, Witnesses, Evidence and Legal Resolution  
10. Diplomacy, Taxation, Customs and External Authority  
11. Threat Detection, Patrols and Guard Readiness  
12. Fortifications, Gates, Sieges and Access  
13. Equipment, Training and Reserve Forces  
14. Fire, Rescue, Disaster and Civilian Refuge  
15. Settlement Planner Handoff  
16. Blueprint Forge Authoring and Official Source Validation  
17. Restricted Player-Creator Validation  
18. Construction Stages, Commissioning and Partial Activation  
19. Upgrade, Inheritance, Conversion and Replacement  
20. Damage, Occupation, Repair and Restoration  
21. Settlement-Stage Expectations  
22. Detailed Registry Summary  
23. Governance and Administration Entries  
24. Justice and External-Authority Entries  
25. Safety and Defence Entries  
26. Emergency-Service Entries  
27. Archived Validation Scope  
28. Simulation LOD, Persistence and Multiplayer Authority  
29. Godot + Summer Engine Implementation Direction  
30. Balancing, Diagnostics and Anti-Exploit Rules  
31. Open Questions for Later Balancing  
Appendices A–F

# 1. Locked 20C Identity

20C is the civic authority, protection and recovery layer of the universal settlement registry. Its definitions give laws, decisions, reports, patrols, barriers, equipment, alarms, refuge and response physical anchors. They do not replace NPC identity, political legitimacy, faction state, combat or player freedom; they make those systems inspectable and consequential.

> **Locked Rule**
>
> A 20C structure must expose a measurable civic, justice, defence, access, response or refuge function. A throne, tower, gate, wall, armour display, bunker-shaped room or court decoration does not provide the service unless its people, records, markers, routes, resources, permissions and operational state validate.

| **Identity Layer** | **Design Meaning** | **Player-Facing Result** |
|---|---|---|
| Visible Authority | Leaders, councils, officials, laws and permissions occupy real civic sites. | Players know where to request approval, challenge policy or submit a project. |
| Fair Consequence | Crime and disputes use witnesses, evidence, law profiles and recorded outcomes. | Guards are not omniscient and punishment is explainable. |
| Layered Protection | Detection, warning, delay, response, sustainment, refuge and recovery remain distinct. | Towers, walls, posts, stores and shelters each matter differently. |
| Physical Defence | Barriers, gates, routes and stores are damageable voxel structures. | Raids leave breaches, fires, casualties, theft and repair work. |
| Civic Variety | Government and military form comes from culture, faction, history and choice. | A council, chief, guild court or magical authority can use shared contracts. |
| Forge Authorship | Official layouts, stages and states are authored and validated in Blueprint Forge. | Many visual solutions can safely satisfy one stable function. |
| Scalable Simulation | Near incidents play visibly; distant ones preserve bounded outcomes. | Large worlds remain alive without simulating every patrol step. |

# 2. Scope Boundaries and Anti-Micromanagement Rules

| **Included in 20C** | **Handled through linked systems** | **Not routine player work** |
|---|---|---|
| Civic halls, records, courts, customs, diplomacy, guard facilities, fortifications, response and refuge. | NPC identity in 07; combat in 16; resources/logistics in 20B/20D; magic in 20E; complexes in 20F; styles in 20G. | Approving every patrol, hearing, fine, gate opening, drill, tax payment or rescue action. |
| Authority-facing capacity, permissions, cases, readiness, coverage, perimeter, equipment and response. | Legitimacy, faction politics, detailed economy, story and final balance data remain in linked records. | New top-level Governance, Crime, Justice, Readiness, Diplomacy, Fire or Refuge needs. |
| Official source validation, stages, dynamic states, damage and runtime contracts. | Exact visual form in Blueprint Forge and packs; runtime instancing in Godot. | One mandatory floor plan, omniscient detection or free defence from decoration. |

- The seven needs remain the only top-level settlement needs.
- Governance buildings host recognised roles and services but do not create authority or legitimacy.
- Guards detect through sight, hearing, witnesses, reports, alarms, evidence or investigation rather than global knowledge.
- Players may set laws, policies, priorities, patrol zones, access rules and emergency posture where authority allows; routine execution remains NPC-managed.
- Justice uses proportional responses and preserves the law, evidence and decision that produced each outcome.
- Fortifications delay, channel, warn and protect; they do not replace guards, supplies, maintenance, evacuation or recovery.
- Patrols use zones and priorities rather than manual waypoint scheduling for every shift.
- Emergency response is event-driven. Players prepare capacity and policy rather than issuing every bucket or stretcher order.
- Exact block/component costs compile from the resolved construction-stage graph.
- A complete shell may remain dormant when authority, staff, records, routes, equipment, source links or commissioning are missing.
- Culture, faction and realm variations resolve through packs and validated equivalents rather than duplicated universal definitions.
- Distant simulation batches activity but preserves important people, equipment, records, laws, damage, judgments and history.

> **Explicit Non-Goals**
>
> 20C does not require a full grand-strategy government simulator, courtroom dialogue for every offence, daily tax accounting for each NPC, manual guard rosters, realistic military logistics at all distances, perfect crime detection, one building for every possible office or walls that make settlements invulnerable.

# 3. Source-of-Truth and Record Separation

## 3.1 Record Chain

```text
20C Universal Definition
        -> Blueprint Forge Editable Source
        -> Validated Construction / State / Coverage Graph
        -> Deterministic Runtime Bake Products
        -> Construction or Network Project Instance
        -> Persistent Structure Instance
        -> Governance / Incident / Readiness / Response Records
```

## 3.2 Responsibility Boundaries

| Layer | Authority | 20C Relationship |
|---|---|---|
| Universal function | Document 20 / 20C detailed owner | Stable function identity, seven-needs contribution, service/capacity contract and semantic requirements. |
| Official source blueprint | 22I Blueprint Forge | Voxel composition, modules, semantic layers, stages, dynamic states, placement and dependencies. |
| Player-authored source | Document 19 | Restricted compatible source; cannot create law, legitimacy, invisible guard strength or arbitrary immunity. |
| Construction project | Document 20 | Site, source revision, reservations, work/stages, blockers, commissioning and project history. |
| Persistent structure | Document 12 | StructureInstance, condition, damage, occupation/restoration and physical history. |
| Government / law / jurisdiction | Document 13 | Recognised authority, office, laws, citizenship, territory, treaties, war/peace and political claims. |
| People / guard / responder | Document 07 | Persistent officials, guards, responders, jobs, schedules and local task execution. |
| Economy / public finance | Set 27 | Taxes, tariffs, fines, payments, treasury, budgets and customs economic transactions. |
| Social / testimony | Set 28 | Trust, willingness, persuasion, social testimony behaviour, relationships and social memory. |
| Biology | Set 29 | Health, injury, Stamina/Fatigue, treatment, smoke/toxin/disease and biological outcomes. |
| Movement | Set 30 / Set 26 | Patrol, pursuit, evacuation, responder travel, mover-specific accessibility and arrival. |
| Combat | Document 16 / Set 26L specialist | Tactical fighting, cover interaction, siege/naval combat and combat outcomes. |
| Event lifecycle | Document 15 | Raid/disaster/incident event lifecycle, warning/escalation/aftermath and quest consequences. |
| Maritime specialist | Set 26 | Port service, maritime customs context, rescue, vessels, naval/coastal execution. |
| Pack/culture resolution | 20G + 13 + Set 25 | Culture/faction/biome/realm expression and governed source resolution. |

## 3.3## 3.3 Non-Duplication Rules

- The universal definition never contains a complete voxel source or a named government.
- Blueprint source never creates authority, laws, people, stock or incident outcomes.
- Runtime bake products are disposable derivatives and can be regenerated.
- Structure identity persists through source revision, occupation, repair, pack changes and migration.
- Government, law, jurisdiction, permission and legitimacy records remain Document-13-owned and are referenced by civic buildings.
- Evidence, cases, patrols, threats and emergency incidents retain their own stable runtime identities.
- Player blueprints receive unique `blueprint.*` IDs but normally satisfy existing `building.*` or `project.*` definitions.
- One complex may host several services, but shared staff, routes, records, secure space and equipment are divided explicitly.
- A culture-specific council hall or gate remains a source/pack variant unless it changes universal planner or service behaviour.

# 4. Seven-Needs Integration

| **Need** | **20C Authority or Contribution** | **Important Drill-Down Causes** | **Not a Separate Main Need** |
|---|---|---|---|
| Housing | Emergency refuge and duty accommodation may provide temporary capacity; 20A owns normal housing. | Displacement, shelter occupancy, guard beds, unsafe homes and evacuation. | Refuge or barracks housing as separate needs. |
| Provisions | Armouries and shelters reserve real supplies; governance may set distribution policy. | Emergency food/water, ammunition, reserve access and blocked routes. | Military supply as a separate need. |
| Health | Rescue, safe evacuation, humane holding and reduced raid/disaster injuries support Health. | Casualties, smoke, collapse, detention conditions and treatment access. | Emergency medicine or detention health as separate needs. |
| Work | Officials, guards, clerks, trainers, quartermasters and responders create specialised jobs. | Vacancies, skill gaps, workload, equipment and travel. | Administration or military employment as separate needs. |
| Safety | Primary contribution through detection, access, patrol, barriers, equipment, law, response and refuge. | Threat pressure, warning time, readiness, breaches, crime and emergency coverage. | Defence, crime, fire or justice as separate needs. |
| Infrastructure | Records, roads, gates, alarms, walls, project approvals and response routes support settlement operation. | Backlogs, disconnected roads, broken signals, damaged walls and inaccessible offices. | Governance capacity as a separate need. |
| Morale | Fair law, visible leadership, successful defence, diplomacy and recovery can create Morale-facing conditions; Set 28 owns Trust/relationship outcomes. | Injustice, fear, casualties, corruption, defeat, exclusion and unresolved disputes. | Legitimacy, fear or public confidence as separate needs. |

# 5. Shared Governance, Safety and Protection Model

## 5.1 Protection Chain

```text
Detection -> Warning -> Delay -> Response -> Sustainment -> Refuge -> Recovery
```

No single component replaces the chain. A tower without a guard does not detect reliably. A wall without a route and defenders only delays. An armoury without stock does not improve readiness. A refuge without exits and supplies can become a trap.

## 5.2 Shared Calculations

| **Model** | **Calculation Direction** | **Player-Facing Example** |
|---|---|---|
| Governance capacity | Recognised authority + staffed civic stations + records + public access compared with population, districts, cases and projects. | Governance: Strained - 12 requests pending; clerk absent. |
| Administrative load | Requests, permits, policies, records, contracts, cases and active projects compared with service capacity. | Village Hall: Overloaded - approvals delayed. |
| Threat pressure | Known hostile sites, factions, creatures, wealth, routes, events and recent attacks. | Threat: High - scouts reported on northern road. |
| Detection/warning | Valid observers, coverage sectors, visibility, patrol reports, alarms and signal chain. | Warning time: 43 seconds - eastern ravine unseen. |
| Guard readiness | Derived from available guards, Set-29 biological availability, Set-28 social/morale factors, skill, equipment, command, warning and Set-30 route/access evidence. | Readiness: 63% - two guards lack armour. |
| Perimeter integrity | Connected barriers, gates, terrain, breaches, fire, patrol access and maintenance. | Palisade: 82% intact - livestock gap open. |
| Justice capacity | Reports/cases compared with evidence, staff, authority, hearing and holding capacity. | Justice: 3 cases pending - magistrate unavailable. |
| Emergency coverage | Responders, tools, water/medicine, routes, alarms, refuge and hazard preparation. | Fire response: Limited - well route blocked. |

## 5.3 Operational Bands

- **Prepared** - capacity, staff, stock, routes and records comfortably support current risk and load.
- **Stable** - normal service operates with minor weaknesses.
- **Strained** - service operates but one or more factors are near capacity.
- **Critical** - an active threat, backlog, breach or shortage is causing immediate risk.
- **Collapsed** - no safe or recognised service remains for the affected capability.## 5.4 Capacity Is Not Political, Tactical or Biological Outcome

20C may report:

- public-service capacity;
- justice-service backlog;
- guard positions staffed;
- armoury issue capacity;
- watch coverage;
- connected perimeter;
- fire/rescue coverage;
- refuge capacity.

That does **not** mean:

- a law is legitimate;
- a suspect is guilty;
- a fine has been paid;
- a guard wins a fight;
- an injured person is healed;
- an evacuee has physically reached safety;
- a treaty has been signed;
- a tax has entered the treasury.

Those outcomes remain with their owners.

# 6. Shared Semantic Contracts and Network Layers

## 6.1 Core Marker Families

| **Namespace** | **Examples** | **Purpose** |
|---|---|---|
| `marker.entrance.*` | public, staff, secure, emergency, prisoner, service | Authoritative route endpoints and access class. |
| `marker.authority.*` | leader, council, magistrate, clerk, herald | Recognised civic and decision positions. |
| `marker.request.*` | board, counter, hearing, appeal, blueprint submission | Player/NPC service and queue interfaces. |
| `marker.record.*` | public, secure, evidence, map, treaty, project | Typed record storage and retrieval. |
| `marker.guard.*` | duty, muster, lookout, gate, patrol, reserve, escort | Guard staffing and tactical/service positions. |
| `marker.signal.*` | bell, beacon, horn, relay, alarm, command | Warning and response-network nodes. |
| `marker.response.*` | dispatch, tool issue, triage, rescue, evacuation | Emergency-service tasks and staging. |
| `marker.refuge.*` | occupancy, household, supply, sanitation, command | Protected temporary-capacity contract. |
| `marker.repair.*` | wall, gate, signal, mechanism, emergency | Safe maintenance and damage-response access. |

## 6.2 Zone Families

- `zone.public.*` - public service, assembly, queue, audience and visitor circulation.
- `zone.private.*` - staff, leadership, household, consultation and restricted work.
- `zone.secure.*` - records, evidence, treasury, armoury, holding and command.
- `zone.guard.*` - patrol, muster, firing, response and controlled-access areas.
- `zone.perimeter.*` - inside, outside, breach, wall walk, gate approach and exclusion.
- `zone.hazard.*` - fire, collapse, smoke, riot, siege, contamination and unsafe holding.
- `zone.refuge.*` - protected occupancy, triage, sanitation, stores and evacuation.
- `zone.construction.*` - site, stage, scaffold, delivery and commissioning.

## 6.3 Typed Sockets and Graphs

| **Contract** | **Use** |
|---|---|
| Road and public-route sockets | Connect civic access, patrol travel, emergency response and evacuation. |
| Perimeter sockets | Connect walls, corners, towers, gates, terrain closures and breach sectors. |
| Patrol graph | Defines reachable zones, priorities, checkpoints and emergency redirection. |
| Signal graph | Carries alarms, warnings and command messages with source and failure state. |
| Access/permission graph | Resolves public, resident, official, guard, prisoner, ally and hostile access. |
| Storage/logistics sockets | Supply armouries, shelters, offices and response facilities with real stock. |
| Power/mana sockets | Support mechanisms, alarms, wards and later automated systems without making them mandatory. |
| Worldgen/terrain anchors | Bind towers, walls, gates and civic centres to terrain and settlement approaches. |

## 6.4 Material Roles

Common roles include `foundation_primary`, `wall_civic`, `wall_defensive`, `frame_structural`, `parapet`, `gate_leaf`, `gate_mechanism`, `secure_door`, `record_storage`, `guard_furnishing`, `signal_device`, `refuge_shell`, `fire_resistant`, `repair_patch` and `occupation_overlay`.

Material roles allow culture and biome packs to resolve appearance while preserving structural, fire, siege, access and containment requirements.

# 7. Governance, Leadership, Laws and Permissions

20C owns **civic-service infrastructure**.

Document 13 owns formal political/legal state.

## 7.1 Civic Service Contract

A civic building may provide:

- public request interface;
- secure/public record access;
- clerk/administrative positions;
- meeting/hearing space;
- office positions for authorised officials;
- notice/announcement interface;
- secure storage;
- map/planning access;
- project/permit interface;
- emergency command/muster positions.

## 7.2 Authority Does Not Come From Architecture

A building may be:

- complete;
- staffed;
- impressive;
- culturally prestigious

and still lack lawful authority if Document 13 reports:

- no recognised government;
- disputed office;
- occupation;
- rebellion;
- missing jurisdiction;
- dissolved institution;
- contested claim.

The structure remains physical.

The civic service may become:

- inactive;
- contested;
- provisional;
- occupied;
- advisory

according to the external authority snapshot.

## 7.3 Government Forms

20C remains neutral toward:

- council;
- monarchy;
- republic;
- clan/confederacy;
- guild government;
- temple compact;
- frontier march;
- cooperative federation;
- machine consensus;
- ancestor mandate;
- contract principality;
- customary network;
- player-founded charter

or another Document-13-recognised form.

Different forms can use the same universal civic function with different 20G/Blueprint Forge expressions.

## 7.4 Law and Permission

Document 13 owns:

- active law;
- jurisdiction;
- legal personhood;
- citizenship/legal status;
- property framework;
- public authority;
- access rights where political/legal.

20C exposes physical interfaces such as:

- permit desk;
- public records;
- controlled archive;
- secure office;
- gate/access-control station.

## 7.5 Policy Versus Execution

An authorised government can create:

- defence posture;
- emergency policy;
- access policy;
- project priority;
- reserve policy;
- customs policy

through its owning political/economic interfaces.

20C supplies the building/service capacity that supports routine administration.

It does not own policy truth.

## 7.6 Player-Founded Settlements

Player-founded settlements use the same Document-13 political records.

A player may have broad authority in a founded settlement where the political state grants it.

That authority does not come from placing a Village Hall.

# 8. Records, Planning and Blueprint Administration

20C owns **physical civic record-service capacity** and the gameplay-facing Blueprint/Construction Office function.

It does not own every record stored there.

## 8.1 Record Ownership

| Record | Authoritative Owner |
|---|---|
| Household / resident roster | Document 07 |
| Parcel / district / settlement plan | Document 19 |
| Player blueprint proposal | Document 19 |
| ConstructionProject | Document 20 |
| StructureInstance | Document 12 |
| Government / law / office / treaty | Document 13 |
| Contract / tax / treasury / payment | Set 27 |
| Social testimony / relationship memory | Set 28 |
| Biological injury/treatment | Set 29 |
| Movement route/journey | Set 30 |
| Quest / event / Chronicle | Document 15 |

20C may provide:

- archive room;
- public registry counter;
- secure cabinet;
- evidence storage;
- map table;
- planning desk;
- public notice/permit station.

## 8.2 Blueprint and Construction Office Boundary

The `building.governance.blueprint_construction_office` is a gameplay-facing civic function.

It may provide:

- local proposal intake;
- permit/review interface;
- planning map;
- authorised project administration;
- public/private review space;
- local record storage.

It is **not**:

- the developer Blueprint Forge;
- the canonical registry editor;
- a migration authority;
- a pack-signing tool;
- the owner of settlement planning;
- the ConstructionProject owner.

22I owns official source authoring.

Document 19 owns planning/proposals.

Document 20 owns projects.

## 8.3 Approval Flow

Conceptual:

```text
Proposal
→ political/legal authority check
→ settlement/site/planning check
→ functional/source validation
→ economic/social approvals where applicable
→ Document-20 project intake
→ authoritative ConstructionProject
```

The civic office provides the interface/capacity.

It does not silently commit another owner's decision.

## 8.4 Record Security

Secure civic/evidence/financial records may require:

- access control;
- custody history;
- backup/archive;
- tamper evidence;
- protected storage;
- authorised retrieval.

The owner of the record remains unchanged.

# 9. Justice, Crime, Witnesses, Evidence and Legal Resolution

20C owns **justice-service infrastructure and administrative case handling capacity**.

It does not own law, social truth or biological consequence.

## 9.1 Legal Incident Flow

Conceptually:

```text
World Action / Event
→ active law / jurisdiction evaluated by Document 13
→ observation / report / evidence arises
→ case intake through valid justice service if required
→ testimony / investigation / social information
→ authorised hearing / decision process
→ Document-13 legal resolution committed
→ Set-27 economic penalties/payments where applicable
→ Set-28 social consequences
→ Set-29 biological consequences where applicable
→ Document-15 history/event aftermath
```

20C provides the physical/service infrastructure that lets that process occur.

## 9.2 Fairness Rules

- **No omniscience.** An unseen action does not notify all guards.
- **Evidence has provenance.** Physical evidence, records and observations preserve source/time/integrity.
- **Testimony is not perfect truth.** Set 28/knowledge systems may represent uncertainty, bias, fear, memory and contradiction.
- **Law varies.** Document 13 determines what is unlawful in the active jurisdiction.
- **Authority matters.** A hearing requires an authorised decision-maker under the active legal structure.
- **Response is proportional.** Combat force remains Document-16-owned and subject to legal/policy rules.
- **Detention must remain physically and biologically real.** Unsafe confinement can create Set-29 and social/political consequences.
- **Distant simulation preserves the case.** It does not reroll guilt or evidence when promoted.

## 9.3 Justice Facility Capacity

A courthouse/magistrate facility may provide:

- public intake;
- clerk/case administration;
- authorised hearing space;
- witness/testimony positions;
- secure evidence storage;
- private consultation;
- record archive;
- humane temporary holding where enabled;
- protected route/access.

The building does not declare a verdict.

## 9.4 Evidence

Evidence records may originate from:

- physical items;
- structure damage;
- ownership logs;
- transaction logs;
- tracks;
- alarms;
- magical traces;
- witness statements;
- documents;
- recordings where available;
- confessions.

Ownership remains with the appropriate evidence/event/legal interface.

20C owns only compatible storage/intake/service where relevant.

## 9.5 Consequences

Possible legal outcomes may include:

- warning;
- restitution;
- fine;
- confiscation;
- service;
- restriction;
- detention;
- exile;
- pardon;
- no finding;
- escalation.

Document 13 commits the legal status/outcome.

Set 27 commits money/property transactions.

Set 28 commits social consequence.

Set 29 commits biological state.

Document 16 commits combat where resistance occurs.

# 10. Diplomacy, Taxation, Customs and External Authority

20C owns **physical civic interfaces** for diplomacy, customs and administration.

## 10.1 Diplomacy

An embassy/diplomatic hall may provide:

- secure envoy reception;
- negotiation room;
- treaty-record support;
- ceremonial/public interface;
- guest/guard access;
- secure correspondence;
- meeting/event capacity.

Document 13 owns:

- political recognition;
- authorised signatory;
- treaty;
- peace/war;
- alliance;
- protectorate/vassal/autonomy;
- diplomatic relationship state.

Set 28 owns:

- negotiation/persuasion;
- social reactions;
- interpersonal Trust;
- dialogue.

20C does not create a treaty because two NPCs met in an embassy.

## 10.2 Taxation

A tax/customs office may provide:

- assessment counter;
- records;
- secure payment interface;
- inspection lane;
- controlled storage;
- public information;
- official work positions.

Document 13 owns whether authority may lawfully levy.

Set 27 owns:

- tax base;
- rate;
- assessment;
- amount;
- collection;
- refund;
- treasury;
- expenditure/public finance.

## 10.3 Customs

Customs must bind to a real:

- road/border;
- gate;
- port;
- canal;
- portal;
- controlled route

and active jurisdiction.

Set 27 owns tariff/economic transaction.

Set 30/26 owns physical route/movement.

Set 26J owns specialist port-call/customs service integration.

A customs office cannot tax unrelated goods elsewhere in the world.

## 10.4 Fines and Confiscation

A court/office can provide collection/storage interfaces.

Set 27 commits:

- fine payment;
- debt;
- escrow;
- treasury transfer.

Item/ownership systems commit confiscated goods.

## 10.5 Occupation

Occupation can change:

- authorised office;
- banners;
- access;
- administration;
- tax/customs policy;
- guard alignment.

Document 13 owns occupation/political state.

Document 12 preserves structure history.

20C re-evaluates service availability under the new authority.

# 11. Threat Detection, Patrols and Guard Readiness

20C owns **protection infrastructure and readiness inputs**.

It does not own the guard as a person or the combat result.

## 11.1 Readiness Inputs

| Factor | Owner / Source |
|---|---|
| Guard availability | Document 07 |
| Health / injury / Stamina / Fatigue | Set 29 |
| Social willingness / loyalty / fear | Set 28 / Document 13 political context |
| Combat skill / tactical state | Document 16 / progression/person data |
| Weapons / armour / ammunition | Item/Inventory + Document 16 |
| Warning / signal infrastructure | 20C + Document 08 where automated |
| Command authority | Document 13 / Document 07 office/role |
| Physical route / position access | Set 30 |
| Supplies / repair stock | Inventory / 20D / 08 |
| Active threat/event | Document 15 / 10 / 13 / 16 |

20C may aggregate these into a **readiness view**.

It does not own the underlying values.

## 11.2 Patrol Infrastructure

20C may define:

- guard post;
- patrol-zone anchors;
- checkpoints;
- watch positions;
- alarm points;
- muster positions;
- reserve positions;
- secure access points.

Document 07 decides who is assigned/scheduled.

Set 30 decides whether/how the guard physically moves.

Document 16 resolves tactical contact.

## 11.3 Detection

Detection may consume:

- line of sight;
- hearing/report;
- watch coverage;
- terrain;
- foliage;
- weather;
- light;
- facing;
- alarm;
- known threat report.

A watchtower creates a valid detection position.

An empty tower does not become an omniscient sensor.

Automated/magical sensors remain Document 08/09 owned where used.

## 11.4 Warning

Signals can include:

- bell;
- beacon;
- horn;
- alarm relay;
- magical warning;
- messenger.

The signal network records:

- source;
- route;
- delay;
- failures;
- recipients.

It does not fabricate a responder.

## 11.5 Distant Readiness

Distant threat resolution consumes the same:

- named people;
- equipment;
- stock;
- access;
- warning;
- fortification state;
- biology;
- tactical capability.

Promotion cannot heal guards, restore ammunition or repair walls.

# 12. Fortifications, Gates, Sieges and Access

20C owns **physical defensive infrastructure function**.

Document 12 owns the persistent structure.

Document 16 owns tactical combat.

Set 30 owns mover-specific route/access.

## 12.1 Protection Contributions

```text
Detection
→ Warning
→ Delay
→ Channel
→ Position
→ Response
→ Sustainment
→ Refuge
→ Recovery
```

A fortification can contribute to several links.

No single link guarantees Safety.

## 12.2 Palisade / Wall Project

`project.defence.palisade_segment` and `project.defence.stone_wall_gatehouse` are project-family definitions rather than single decorative buildings.

They can represent networks of:

- wall segments;
- corners;
- towers;
- gates;
- ditches/terrain closure;
- repair access;
- wall walks;
- breach sectors.

## 12.3 Perimeter Graph

A perimeter graph may track:

- connected sectors;
- intended closures;
- gate openings;
- terrain closures;
- breach state;
- repair route;
- guard access;
- sector condition.

It does not own combat HP for every attacker.

## 12.4 Gate

A gate may provide:

- controlled opening;
- route chokepoint;
- inspection;
- guard station;
- emergency closure;
- access-policy interface.

Set 30 decides whether a mover can traverse it in its current state.

Document 08 may control approved automation.

Document 16 resolves forced breach/combat.

## 12.5 Access Control

Access policy may reference:

- public;
- resident;
- official;
- guard;
- ally;
- prisoner;
- restricted;
- hostile.

The political/legal permission comes from Document 13/other owners.

20C implements the physical interface.

## 12.6 Siege

During siege:

- Document 15 owns event lifecycle;
- Document 16 owns fighting/breach attacks;
- Document 12 owns physical damage;
- Set 29 owns casualties/injury;
- Set 30 owns movement/evacuation;
- Set 27 owns economic/stock consequences;
- Set 28 owns fear/grief/social memory;
- 20C updates protection-service/readiness state.

## 12.7 Repair

A wall/gate/tower does not auto-heal after combat.

Repair is an authoritative Document-20 ConstructionProject or approved direct repair transaction.

# 13. Equipment, Training and Reserve Forces

20C owns **armoury, barracks/training and muster infrastructure**.

## 13.1 Armoury

An armoury may provide:

- secure typed storage;
- issue/return interface;
- equipment inspection;
- maintenance/service position;
- guard-access control;
- ammunition/weapon/armour buffers.

Actual items remain Item/Inventory-owned.

A rack does not create equipment.

## 13.2 Barracks and Training Yard

A barracks/training yard may provide:

- guard duty/muster positions;
- training area;
- equipment issue interface;
- instruction positions;
- temporary duty accommodation;
- drill/event capacity.

Document 07 owns guards/jobs/schedules.

Document 02/16 own relevant training/progression/tactical outcomes where applicable.

Set 29 owns biological availability.

## 13.3 Reserve Forces

A settlement may have:

- full-time guards;
- militia/reserve;
- volunteers;
- allied responders;
- hired forces;
- magical/construct defenders where valid.

20C exposes muster/equipment/service capacity.

Document 13/07/28/27 own the political, person, social and economic basis of service.

## 13.4 Training Does Not Create Combat Power Directly

A training yard creates practice opportunity.

It does not set:

- combat skill;
- morale;
- loyalty;
- Health;
- equipment.

Those values must change through their owners.

# 14. Fire, Rescue, Disaster and Civilian Refuge

20C owns **emergency-service facility and refuge capacity**.

Document 15 owns event lifecycle.

Set 29 owns biological outcomes.

Set 30/26 owns physical movement/rescue travel.

## 14.1 Fire and Rescue Station

`building.emergency.fire_rescue_station` may provide:

- alarm intake;
- dispatch;
- responder muster;
- tool issue;
- water/agent connection;
- rescue equipment;
- triage handoff;
- decontamination/recovery space;
- emergency route/load-out.

The station does not put out a fire by existing.

## 14.2 Response Flow

```text
Incident recognised
→ Document-15 incident/event state
→ 20C dispatch/service availability
→ Document-07 responder assignment
→ Set-29 responder biological availability
→ Set-30/26 movement to scene
→ relevant owner performs rescue/fire/repair/treatment action
→ evidence returned
→ incident/service state updates
```

## 14.3 Refuge

`building.emergency.refuge_bunker` supplies temporary protected occupancy.

It may require:

- hazard-appropriate shell;
- multiple exits/routes;
- occupancy/muster;
- emergency supplies;
- sanitation;
- air/ventilation/ward;
- command;
- basic triage;
- protected storage.

20A remains owner of ordinary Housing.

Set 29 owns occupant biological state.

## 14.4 Evacuation

20C can define:

- muster points;
- refuge targets;
- evacuation-route requirements;
- signage/alarms;
- occupancy registration.

Set 30/26 determines whether individuals can physically reach safety.

Set 28/07 determines social/task behaviour.

## 14.5 Maritime Rescue

A coastal/port rescue profile may reuse the Fire/Rescue function where genuinely equivalent.

Set 26 owns specialist:

- vessel rescue;
- aquatic rescue execution;
- marine weather/current context;
- port-call/vessel service;
- naval hazards.

20H v1.0 will decide whether any distinct maritime-rescue universal function is required beyond this profile.

## 14.6 Disaster Types

Facility profiles may support:

- fire;
- flood;
- storm;
- collapse;
- raid;
- siege;
- magical incident;
- contamination;
- mine disaster;
- maritime incident.

The event/hazard owner remains authoritative.

# 15. Settlement Planner Handoff

Document 19 owns the settlement planner.

20C supplies **civic/protection/service pressures and opportunities**.

## 15.1 Planner Signals

20C may expose:

- civic-service overload;
- missing public/request access;
- justice-service backlog;
- deficient warning coverage;
- unstaffed critical guard position;
- perimeter breach/gap;
- insufficient controlled access;
- armoury/logistics weakness;
- emergency response gap;
- refuge deficit;
- damaged civic/defence infrastructure;
- expansion opportunity;
- upgrade/repair opportunity.

## 15.2 External Planner Inputs

Document 19 also consumes:

- political legitimacy/law/jurisdiction — Document 13;
- actual guards/officials/responders — Document 07;
- economy/public finance — Set 27;
- social willingness/conflict — Set 28;
- biological casualty/workforce pressure — Set 29;
- route/evacuation accessibility — Set 30/26;
- threat/event state — 10/13/15/16;
- stock/logistics — inventory/20D/08.

## 15.3 Anti-Spam

The planner should not build:

- more walls when the real failure is no guards;
- another court when cases are low and one magistrate is absent;
- another office when records/process can be improved;
- another tower when terrain already blocks the approach and patrol coverage is sufficient;
- another refuge when evacuation routes are the real blocker.

Prefer:

- staffing;
- repair;
- equipment;
- route improvement;
- signal link;
- training;
- policy change;
- stock;
- conversion

when those solve the actual weakness.

## 15.4 Planner Output

Document 19 creates a `SettlementProjectProposal`.

Document 20 validates and creates the authoritative ConstructionProject.

20C does not:

- allocate final settlement priority;
- collect tax;
- assign guards;
- move responders;
- convict suspects;
- resolve combat;
- apply injury/healing.

# 16. Blueprint Forge Authoring and Official Source Validation

## 16.1 Required Source Layers

An official 20C source may contain:

- Voxel structural and detail layers.
- Nested civic room, tower, wall, gate, post, armoury, response or refuge modules.
- Stable semantic markers, zones and typed sockets.
- Material roles and pack-exposed substitutions.
- Perimeter, patrol, access, signal, line-of-sight and emergency-route graphs.
- Construction-stage graph and partial activation rules.
- Functional, alert, damage, occupation, repair and restoration deltas.
- Upgrade, conversion, extension and replacement links.
- Collision, navigation, cover and Entity Forge envelope tests.
- Icon, thumbnail, map-symbol and inspection camera presets.
- Dependency, lifecycle, performance, package and migration metadata.

## 16.2 Validation Layers

| **Layer** | **Examples** |
|---|---|
| Structural | Foundations, support, safe openings, wall/gate connectivity and stage coherence. |
| Semantic | Correct authority, service, guard, record, evidence, signal, refuge and repair markers. |
| Access | Public/private/secure circulation, guard routes, emergency egress and freight/service access. |
| Coverage | Sightline sectors, signal links, patrol graph, perimeter sectors and response reach. |
| Safety | Fire, collapse, crowd, holding, armoury, mechanism, refuge and evacuation rules. |
| Network | Road, perimeter, signal, storage, power, mana, alarm and utility sockets. |
| Law/authority | Required recognised roles, permissions and secure/public boundaries. |
| Pack | Material-role resolution, silhouette, culture, biome, faction and occupation compatibility. |
| Runtime | Deterministic bake, stable element IDs, diagnostics, persistence references and budgets. |

## 16.3 Source Lifecycle

```text
Draft
-> Voxel Blockout
-> Semantic Pass
-> Access / Coverage / Perimeter Pass
-> Construction Staged
-> Dynamic and Damage States Complete
-> Pack Resolution Tested
-> Forge Validated
-> Runtime Baked
-> Gameplay Integrated
-> Raid / Incident Regression Tested
-> Shippable
```## 16.4 v1.0 External-Owner Validation

A Forge source may declare compatible anchors and zones for:

- authority;
- hearing;
- evidence;
- guard duty;
- patrol;
- signal;
- response;
- refuge.

Those markers do not create:

- political authority;
- legal guilt;
- social Trust;
- biological outcome;
- combat result;
- movement success.

Validation confirms the physical/service contract only.

# 17. Restricted Player-Creator Validation

## 17.1 Allowed Player Controls

- Voxel layout within declared bounds and budgets.
- Approved civic, guard, wall, gate, tower, response and refuge modules.
- Material roles and unlocked pack palettes.
- Entrance, route, room, patrol, signal and perimeter arrangement within profile limits.
- Supported construction stages and optional extensions.
- Compatible visual style, signage, banners, furnishing and decoration.
- Selected government/culture presentation only where authority and pack rules permit it.

## 17.2 Restricted Controls

- Stable-ID or universal-registry replacement.
- Creating authority, legitimacy, laws, immunity or ownership through source placement.
- Hidden guard, sightline, storage, refuge or capacity markers outside permitted profiles.
- Disabling evidence, permissions, access control, hazards, damage or resource conservation.
- Arbitrary script execution, unrestricted combat logic or invulnerable collision.
- Migration aliases, package trust, server authority or official source replacement.
- Placing sight/coverage origins outside reachable and visible voxel positions.

## 17.3 Validation Profiles

| **Profile** | **Blocking Requirements** |
|---|---|
| Civic hall/office | Public service, recognised-role stations, records, secure/public separation, safe crowd access and road connection. |
| Court/justice | Hearing, authority, clerk, witness/evidence, secure records, safe access and humane holding where enabled. |
| Guard post/barracks | Guard duty/muster, equipment, report, patrol, alarm, safe access and appropriate accommodation/training. |
| Watchtower | Reachable lookout, fall safety, valid coverage origin, signal, shelter and structural support. |
| Wall/perimeter | Valid modules, connection graph, terrain closure, repair route, breach groups and no unsupported gaps. |
| Gate | Road/perimeter sockets, mechanism, access policy, guard/inspection, emergency bypass and damage states. |
| Armoury | Typed secure storage, issue/return, fire/theft protection, route and restricted access. |
| Response/refuge | Alarm/dispatch, tools/supplies, routes, occupancy/triage, exits, sanitation and hazard profile. |

> **Player Creativity Rule**
>
> Validation protects function, fairness, navigation, security and save integrity without enforcing one visual style. An unusual but functional hall, gate, wall or watchtower should pass when its declared contracts, routes, coverage, stages and hazards are valid.

# 18. Construction Stages, Commissioning and Partial Activation

## 18.1 Shared Stage Foundation

```text
Planning
-> Site Preparation
-> Foundation / Supports
-> Structure / Perimeter
-> Enclosure / Access Mechanism
-> Functional Installation
-> Equipment / Records / Supplies
-> Commissioning
-> Operational
```

Small structures merge stages. Network projects repeat segment stages. Complex upgrades may commission by wing or sector.

## 18.2 Partial Activation

- A watchtower may provide warning after safe access, lookout and signal validate.
- A completed palisade segment provides local delay only for its covered sector.
- A gate provides physical passage before staffed inspection, but not full access-control service.
- A civic hall requires recognised authority/staff and records before governance capacity activates.
- An armoury may store secured stock before full issue/maintenance service is staffed.
- A shelter requires safe exits, supplies, occupancy and hazard-profile commissioning before refuge capacity counts.
- Partial activation must not bypass fire, collapse, access, security or containment checks.

## 18.3 Commissioning Checks

Commissioning validates source version, placement, structural safety, semantic contracts, staff/authority, equipment/records/supplies, routes, permissions, graph connections, pack resolution, diagnostics, runtime bake version and save registration.## 18.4 Authoritative Construction Ownership

Document 20 v1.0 owns the ConstructionProject.

20C defines commissioning requirements for the target civic/justice/defence/emergency function.

Construction consumes:

- canonical Blocks/Block Inventory Projections;
- genuine Items/components;
- labour from Document 07;
- Set-27 procurement/payment where applicable;
- Set-28 consent/assignment where applicable;
- Set-29 biological worker availability;
- Set-30/26 site access;
- Document-12 StructureInstance commits.

# 19. Upgrade, Inheritance, Conversion and Replacement

## 19.1 Upgrade Modes

- Parent source with child-source inheritance.
- Attached office, tower, gatehouse, wall, store or shelter module.
- Construction-stage delta that reinforces or expands an existing structure.
- State delta for alarm, occupation, corruption, siege or emergency use.
- Network extension adding perimeter, patrol, signal or response coverage.
- In-place conversion to another compatible profile.
- Full parcel replacement with continuity planning.

## 19.2 Continuity Rules

Upgrades protect active authority, records, cases, detainees, equipment, guards, residents, routes and emergency coverage. A replacement cannot silently delete law records, stock, evidence, people, projects or history. Temporary offices, stores, gates, patrols or refuge capacity are planned when service cannot continue safely.

## 19.3 Examples

- Village Hall -> Town Hall through inherited civic source plus new service/council modules.
- Guard Post -> expanded post or barracks link while patrol coverage remains active.
- Wooden Watchtower -> reinforced tower retaining coverage and signal ancestry.
- Palisade -> reinforced palisade or selected stone-wall replacement by sector.
- Village Gate -> fortified gatehouse while maintaining temporary controlled passage.
- Civic room -> Blueprint and Construction Office or Records Office attachment.
- Community hall -> temporary refuge profile during an emergency, then return to normal use.

# 20. Damage, Occupation, Repair and Restoration

## 20.1 Damage Families

- Structural breach, collapse and burned sections.
- Jammed, broken or destroyed gate mechanisms.
- Lost, stolen, burned or corrupted records/evidence.
- Looted, seized or contaminated armoury/refuge stock.
- Destroyed signals and blocked patrol/emergency routes.
- Unsafe holding, crowd, smoke, sanitation or refuge conditions.
- Occupied/contested authority, changed access and guard loyalty.
- Siege, sabotage, magical interference and terrain change.

## 20.2 Repair Priority

1. Save trapped or endangered people.
2. Restore emergency exits and safe access.
3. Control fire, collapse, contamination and active breach.
4. Restore warning, command and critical perimeter delay.
5. Secure evidence, records, armoury and refuge stock.
6. Restore public service and ordinary patrol coverage.
7. Reconstruct cosmetic, ceremonial and prestige details.

## 20.3 Occupation and Restoration

Occupation may change banners, authority, laws, access, taxes, staff and project priorities while preserving origin source, builders, previous owners and damage history. Restoration can remove occupation layers, preserve evidence, rebuild faithfully, convert adaptively or memorialise ruins. A structure can be physically repaired while political legitimacy remains contested.## 20.4 Cross-System Damage Consequences

One physical event can produce several owner-specific consequences.

Example: a gatehouse burns and collapses.

- Document 12 — records the physical damage/collapse;
- Document 16 — resolves any combat damage/attack source;
- Set 29 — resolves burns/smoke/injuries;
- Set 30 — recalculates blocked/available routes;
- Document 15 — updates the siege/disaster event;
- 20C — marks gate/access/defence service degraded;
- Document 19 — may propose repair/replacement;
- Document 20 — owns the repair ConstructionProject.

No duplicate “destroyed gate” truth is created.

# 21. Settlement-Stage Expectations

| **Stage** | **Minimum 20C Expectations** | **Typical Optional / Conditional Growth** |
|---|---|---|
| Camp | Informal leadership, visible centre and basic watch behaviour where danger applies. | Command tent, temporary barrier, muster and emergency assembly. |
| Hamlet | Recognised request access can share another structure; basic warning/patrol where justified. | Small guard shelter, signal post and communal refuge use. |
| Village | Village Hall plus organised warning, guard response and controlled access appropriate to threat. | Blueprint Office, local justice, pack-equivalent defences and additional posts. |
| Fortified Village | Repeated-threat readiness, stronger perimeter, training/reserve, equipment and repair capacity. | Barracks, Armoury, shelters, towers and ward links. |
| Town | Expanded civic administration, formal justice where needed, stronger walls/gates and hazard response. | Records Office, Court, Customs, Fire Station and Refuge Bunker. |
| City | Multiple districts, diplomacy, regional authority and large civic/defence complexes with 20F. | Embassy, Leader Residence, district posts and city-fort integrations. |
| Capital | Culture-defining authority, diplomacy and command through 20F/20G. | Palace/high council, national archive, grand court and capital fortifications. |
| Magical Metropolis | Realm-scale warning, ward, portal, disaster and civic networks without replacing core contracts. | Inter-realm embassy, arcane command, automated defence and magical refuge. |

# 22. Detailed Registry Summary

| **No.** | **Stable ID** | **Definition** | **Earliest Stage** | **Primary Need** | **Planner Class** | **Legacy Scope Provenance** |
|---:|---|---|---|---|---|---|
| 61 | `building.governance.village_hall` | Village Hall | Village | Infrastructure | Required | Legacy POC Raid Provenance |
| 62 | `building.governance.town_hall` | Town Hall or Council House | Town | Infrastructure | Upgrade | Legacy Legacy Beta Provenance Provenance |
| 64 | `building.governance.records_planning_office` | Records and Planning Office | Town | Infrastructure | Optional | Legacy Legacy Beta Provenance Provenance |
| 65 | `building.justice.courthouse_magistrate` | Courthouse or Magistrate House | Town | Safety | Conditional | Legacy Legacy Beta Provenance Provenance |
| 66 | `building.governance.tax_customs_office` | Tax or Customs Office | Town | Infrastructure | Conditional | Legacy Legacy Beta Provenance Provenance |
| 67 | `building.governance.embassy_diplomatic_hall` | Embassy or Diplomatic Hall | City | Morale | Conditional | Legacy Legacy Beta Provenance Provenance |
| 68 | `building.governance.leader_residence` | Governor or Leader Residence | City | Morale | Optional | Legacy Legacy Beta Provenance Provenance |
| 70 | `building.governance.blueprint_construction_office` | Blueprint and Construction Office | Village | Infrastructure | Optional | Legacy Legacy Alpha Provenance Provenance |
| 71 | `building.safety.guard_post` | Guard Post | Village | Safety | Required | Legacy POC Raid Provenance |
| 72 | `building.safety.wooden_watchtower` | Wooden Watchtower | Village | Safety | Required | Legacy POC Core Provenance |
| 73 | `project.defence.palisade_segment` | Palisade Segment | Village | Safety | Required | Legacy POC Raid Provenance |
| 74 | `building.safety.village_gate` | Village Gate | Village | Safety | Required | Legacy POC Raid Provenance |
| 75 | `building.safety.barracks_training_yard` | Barracks and Training Yard | Fortified Village | Safety | Optional | Legacy Legacy Alpha Provenance Provenance |
| 76 | `project.defence.stone_wall_gatehouse` | Stone Wall and Gatehouse System | Town | Safety | Upgrade | Legacy Legacy Beta Provenance Provenance |
| 77 | `building.safety.armoury` | Armoury | Fortified Village | Safety | Optional | Legacy Legacy Alpha Provenance Provenance |
| 79 | `building.emergency.fire_rescue_station` | Fire and Rescue Station | Town | Safety | Optional | Legacy Legacy Beta Provenance Provenance |
| 80 | `building.emergency.refuge_bunker` | Emergency Shelter or Refuge Bunker | Town | Safety | Conditional | Legacy Legacy Beta Provenance Provenance |

Catalogue numbers 63, 69 and 78 are intentionally absent. City Hall or Civic Complex, Palace or High Council Complex and Fort or Keep are owned by 20F because they are large multi-building or megaproject-scale complexes. Their lower-level civic and protection dependencies remain defined here.## 22.1 Production Lifecycle Note

All **17 20C stable IDs/catalogue identities** are protected.

The legacy scope-provenance field is not current Set-25 lifecycle authority.

20H v1.0 will freeze current classifications without renumbering/deleting valid functions because their old milestone was POC/Legacy Alpha Provenance/Legacy Beta Provenance.

## 22.2 Catalogue Range Boundary

Catalogue numbers 63, 69 and 78 remain intentionally outside 20C because their larger civic/fortress complex functions are owned by 20F.

# 23. Governance and Administration Entries

### 61. Village Hall

`building.governance.village_hall`

| **Catalogue role**                      | Governance / Civic \| Village \| Medium \| Required \| Legacy POC Raid Provenance                                                                                                                                                                    |
|-----------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Infrastructure \| Secondary: Morale, Work                                                                                                                                                                                     |
| **Purpose**                             | Provides the first dedicated civic centre for requests, permissions, leadership, public records, settlement decisions and stage administration.                                                                                        |
| **Capacity / service**                  | Draft one active leader or council profile, one clerk position, a public request and service counter, and an assembly area sized for a small village. Capacity is based on valid offices and public access, not decorative floor area. |
| **Jobs and users**                      | Elder, chief, mayor, council member, clerk, herald, planner, builder liaison and visiting petitioners.                                                                                                                                 |
| **Inputs**                              | Records, paper or writing materials, seals, light or fuel, maintenance supplies and optional treasury or notice-board stock.                                                                                                           |
| **Outputs / services**                  | Request board access, permissions, public decisions, basic laws summary, project approvals, settlement overview, meeting events and governance continuity.                                                                             |
| **Required semantic contract**          | Public entrance, request board, leader or council station, clerk desk, record storage, public assembly zone, secure office or chest, road or square socket.                                                                            |
| **Blueprint Forge source profile**          | Civic source with public entrance, request board, recognised-authority positions, clerk/record workstations, assembly zone, secure office, announcement point, road/square socket and open, meeting, alert, occupied, damaged and restored state deltas. |
| **Runtime products, persistence and LOD**   | Persist recognised authority links, officials, requests, permissions, laws summary, project approvals, public-service queue, records, access state, source version and civic history. Distant simulation retains decisions and named actors rather than simulating every meeting. |
| **Placement and utilities**             | Central or easily reached civic parcel with safe public access. It may connect to a square, market or blueprint office but must not require a fortification to function.                                                               |
| **Construction profile**                | 6 stages: site and foundation; civic shell; roof and entrances; desks and records; public board and assembly space; inspection and activation.                                                                                         |
| **Upgrade, inheritance and branch links**            | Town Hall or Council House; attached Records and Planning Office; attached Blueprint and Construction Office; culture-specific council, moot or clan-hall branch.                                                                      |
| **Planner triggers and failure states** | Required for normal Village-stage administration unless a validated culture-specific equivalent exists. Pauses services if no recognised leader or clerk, public access is blocked, records are destroyed or ownership is disputed.    |
| **Restricted player-creator validation**         | Must separate public and secure work areas, provide a valid request/permission interface, council or leader station, records and safe crowd access. A decorative grand hall cannot claim governance capacity without these markers.    |
| **Pack and style resolution**         | Elder lodge, roundhouse moot, open council pavilion, dwarven clan chamber, fae grove council, nomad banner court or arcane civic hall.                                                                                                 |

### 62. Town Hall or Council House

`building.governance.town_hall`

| **Catalogue role**                      | Governance / Administration \| Town \| Large \| Upgrade \| Legacy Legacy Beta Provenance Provenance                                                                                                                                                              |
|-----------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Infrastructure \| Secondary: Morale, Work                                                                                                                                                                           |
| **Purpose**                             | Coordinates multiple districts, laws, budgets, public services and larger project queues once village-scale administration is no longer sufficient.                                                                          |
| **Capacity / service**                  | Draft several council or office positions, public service counters, a formal assembly chamber and town-level planning capacity. Exact staff and room counts scale through blueprint profiles.                                |
| **Jobs and users**                      | Mayor, council members, chief clerk, treasurer, planner, service officers, herald, guards and public petitioners.                                                                                                            |
| **Inputs**                              | Records, reports, maps, treasury stock, office materials, maintenance, lighting and service information from districts.                                                                                                      |
| **Outputs / services**                  | Town policies, district priorities, budgets, contracts, service coordination, emergency declarations, elections or succession events where the governance profile supports them.                                             |
| **Required semantic contract**          | Council chamber, public lobby, service desks, leader office, treasury or secure records, map or planning table, announcement point, meeting and emergency-command positions.                                                 |
| **Blueprint Forge source profile**          | Nested civic source composed from public-service, council, leadership, records, treasury, emergency-command and ceremonial modules, with district-facing entrances, secure circulation, phased expansion and administration-overload, occupation and restoration states. |
| **Runtime products, persistence and LOD**   | Persist offices, officials, district/service load, policies, budgets/contracts, records, public queues, emergency orders, occupation and institutional history. Service capacity aggregates by functioning module and staff. |
| **Placement and utilities**             | Prominent and accessible civic centre connected to major roads and district services; should have emergency access and secure service circulation.                                                                           |
| **Construction profile**                | 8 stages, with public service and clerk functions activating before final ceremonial rooms or prestige decoration.                                                                                                           |
| **Upgrade, inheritance and branch links**            | City Hall or Civic Complex owned by 20F; attached court, records office, customs office, embassy wing or prestige civic square.                                                                                              |
| **Planner triggers and failure states** | Triggered when population, district count, project volume, laws or public services exceed Village Hall capacity. Underperforms when offices are vacant, records fragmented, treasury inaccessible or districts disconnected. |
| **Restricted player-creator validation**         | Must expose multiple service functions, accessible public circulation, secure records and valid council or authority stations. Oversized ceremonial space alone does not increase administrative capacity.                   |
| **Pack and style resolution**         | Republican council house, royal borough hall, clan senate, merchant council, temple-governed court, arcane administration tower or underground assembly vault.                                                               |

### 64. Records and Planning Office

`building.governance.records_planning_office`

| **Catalogue role**                      | Governance / Planning \| Town \| Medium \| Optional \| Legacy Legacy Beta Provenance Provenance                                                                                                                                                                                     |
|-----------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Infrastructure \| Secondary: Work                                                                                                                                                                                                      |
| **Purpose**                             | Maintains maps, census records, parcels, roads, project schedules and development history so expansion remains legible and save-safe.                                                                                                           |
| **Capacity / service**                  | Draft several clerk, survey and planning desks; supports a bounded number of active parcels, districts and project records according to blueprint and staffing profile.                                                                         |
| **Jobs and users**                      | Registrar, clerk, surveyor, architect, cartographer, census officer, archivist and messenger.                                                                                                                                                   |
| **Inputs**                              | Paper, ink, maps, survey reports, project records, census updates, building inspections and storage maintenance.                                                                                                                                |
| **Outputs / services**                  | Accurate parcels, site reservations, map updates, project queue efficiency, census summaries, heritage records and reduced planning conflicts.                                                                                                  |
| **Required semantic contract**          | Public counter, records stacks, secure archive, map table, survey-equipment rack, planning desks, project board and messenger access.                                                                                                           |
| **Blueprint Forge source profile**          | Administrative source with map and planning tables, parcel/road/project record stores, registrar and survey workstations, public consultation counter, restricted archive, blueprint review station and fire/flood/security protection. |
| **Runtime products, persistence and LOD**   | Persist census, parcel, road, project and blueprint records; staff; active reviews; archive condition; map revisions; permissions and planning backlog. Lost or damaged records create explicit recovery and migration tasks. |
| **Placement and utilities**             | Near Town Hall, Blueprint Office or a civic square; protected from fire, flood and uncontrolled public access.                                                                                                                                  |
| **Construction profile**                | 6 stages: protected shell; archive fittings; map/planning area; public counter; secure records; inspection and catalogue activation.                                                                                                            |
| **Upgrade, inheritance and branch links**            | City planning bureau, national archive or integrated civic complex through 20F; may absorb the Blueprint Office at higher stages.                                                                                                               |
| **Planner triggers and failure states** | Selected when parcel conflicts, project backlog, district complexity, census uncertainty or blueprint volume causes Infrastructure strain. Fails when records burn, staff are absent, ownership data conflicts or archive capacity is exceeded. |
| **Restricted player-creator validation**         | Must provide secure dry storage, working map and planning positions, controlled public access and a clear record workflow. Empty bookshelves do not create planning capacity.                                                                   |
| **Pack and style resolution**         | Wax-tablet archive, rune-record vault, oral-history chamber with scribes, living-tree memory hall, crystal map room or mechanical survey office.                                                                                                |

### 68. Governor or Leader Residence

`building.governance.leader_residence`

| **Catalogue role**                      | Governance / Residential Civic \| City \| Large \| Optional \| Legacy Legacy Beta Provenance Provenance                                                                                                                                  |
|-----------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Morale \| Secondary: Safety, Infrastructure                                                                                                                                                 |
| **Purpose**                             | Provides an official residence, reception space and visible authority symbol for a leader whose role has outgrown ordinary housing.                                                                  |
| **Capacity / service**                  | Draft one leader household, official office and reception profile, staff and guard points; prestige capacity depends on culture and events rather than raw luxury blocks.                            |
| **Jobs and users**                      | Governor, mayor, lord, elected leader, household members, secretary, steward, guards, servants and visiting petitioners.                                                                             |
| **Inputs**                              | Household provisions, public records, security, maintenance, ceremonial or cultural goods and hospitality stock.                                                                                     |
| **Outputs / services**                  | Official residence, receptions, leadership continuity, civic morale, emergency-command fallback and high-value political events.                                                                     |
| **Required semantic contract**          | Private household zone, official office, reception room, secure records, guard post, service access, public appointment point and evacuation route.                                                  |
| **Blueprint Forge source profile**          | Secure mixed civic-residential source with leader household, reception, council/briefing space, staff/service route, records, guards, refuge/escape option and public, private, ceremonial, occupied and contested state layers. |
| **Runtime products, persistence and LOD**   | Persist leader household and role separately, meetings, guards, visitors, private/public access, records, legitimacy links, damage, occupation and relocation. The residence never creates authority by itself. |
| **Placement and utilities**             | Protected civic parcel with controlled public access. It may adjoin Town Hall but should not block normal services or become the only command point.                                                 |
| **Construction profile**                | 8 stages, with residence and office activating before ceremonial halls, gardens or prestige elements.                                                                                                |
| **Upgrade, inheritance and branch links**            | Palace or High Council Complex owned by 20F; branch into modest civic residence, fortified keep residence or culture-specific leadership compound.                                                   |
| **Planner triggers and failure states** | Selected when governance profile, population, diplomacy or culture expects an official residence. Becomes a raid, coup or protest target if security, legitimacy or public access is poorly managed. |
| **Restricted player-creator validation**         | Must clearly separate private, official, public and guard circulation. Decorative luxury does not create authority; an active recognised leader and governance profile are required.                 |
| **Pack and style resolution**         | Mayor house, clan chief compound, elected speaker residence, royal governor manor, fae seasonal court, dwarven thane hall or mage-governor tower.                                                    |

### 70. Blueprint and Construction Office

`building.governance.blueprint_construction_office`

| **Catalogue role**                      | Governance / Construction \| Village \| Medium \| Optional \| Legacy Legacy Alpha Provenance Provenance                                                                                                                                           |
|-----------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Infrastructure \| Secondary: Work                                                                                                                                                                    |
| **Purpose**                             | Connects player and NPC blueprint creation to settlement permissions, parcel assignment, cost estimates, construction queues and project history.                                                             |
| **Capacity / service**                  | Draft several blueprint review, planning and survey positions and a bounded queue of proposed or active player/NPC projects.                                                                                  |
| **Jobs and users**                      | Architect, planner, surveyor, builder foreman, clerk, quartermaster, player proposer and visiting household or guild representative.                                                                          |
| **Inputs**                              | Blueprint files or plans, parcel maps, material estimates, project prerequisites, law and style rules, survey tools and records.                                                                              |
| **Outputs / services**                  | Validated blueprint alternatives, parcel reservations, construction estimates, rejection reasons, approved project records and builder task packages.                                                         |
| **Required semantic contract**          | Public submission counter, blueprint table or preview station, model/display area, project board, plan archive, survey-tool rack, secure approval desk and road/supply-yard sockets.                          |
| **Blueprint Forge source profile**          | Construction-administration source with public submission point, blueprint review table, material/sample library, parcel map, project ledger, builder liaison positions, secure source storage, Forge-preview terminal and approved/rejected/overloaded/damaged states. |
| **Runtime products, persistence and LOD**   | Persist submitted blueprint IDs, validation reports, parcel reservations, approvals/rejections, project ledgers, authorship, source versions and review queues. Runtime uses Forge-derived diagnostics but does not edit official source data. |
| **Placement and utilities**             | Near Village Hall, Records Office, Builder Supply Yard or warehouse access; requires enough public space to inspect designs without blocking builders.                                                        |
| **Construction profile**                | 6 stages: office shell; drafting area; records; public submission; project board and survey gear; validation commissioning.                                                                                   |
| **Upgrade, inheritance and branch links**            | Integrated planning bureau, civic blueprint library, district design office or automated/magical modelling branch through 20E/20F.                                                                            |
| **Planner triggers and failure states** | Selected when player blueprints, project count, parcel conflicts or construction backlog become meaningful. Pauses approvals if no planner, records, map data, permissions or validated submission interface. |
| **Restricted player-creator validation**         | Must support submission, preview/review, approval record, parcel link and project output. Decorative drawing tables do not grant settlement-wide blueprint authority.                                         |
| **Pack and style resolution**         | Architect guild lodge, builder moot, rune-model chamber, holographic map room, clay model court, dwarven survey vault or nomad route-planning tent.                                                           |## 23.1 v1.0 Governance Ownership Note

All governance/administration entries provide **physical civic-service capacity**.

Document 13 owns:

- recognised office;
- government;
- law;
- jurisdiction;
- political legitimacy;
- formal diplomacy/treaty state.

Set 27 owns financial/tax execution.

Document 19 owns settlement planning.

Document 20 owns ConstructionProjects.

Where a legacy entry says the building “provides laws,” “creates authority,” or similar, interpret this as **provides the authorised service interface and capacity for the owner system**.

# 24. Justice and External-Authority Entries

### 65. Courthouse or Magistrate House

`building.justice.courthouse_magistrate`

| **Catalogue role**                      | Justice / Civic \| Town \| Medium \| Conditional \| Legacy Legacy Beta Provenance Provenance                                                                                                                                               |
|-----------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Safety \| Secondary: Morale, Infrastructure                                                                                                                                                   |
| **Purpose**                             | Provides a visible process for disputes, reported crimes, evidence, hearings, fines, warrants and limited temporary detention without making guards omniscient.                                        |
| **Capacity / service**                  | Draft one hearing room, one magistrate or justice station, clerk and witness capacity, evidence storage and a small holding profile where laws permit.                                                 |
| **Jobs and users**                      | Magistrate, judge, law speaker, clerk, bailiff, guard, advocate, witness, victim, accused resident and interpreter.                                                                                    |
| **Inputs**                              | Law profile, case records, witness or evidence reports, seals, secure storage, guard support and basic detainee provisions where holding is used.                                                      |
| **Outputs / services**                  | Resolved disputes, judgments, fines or restitution, warrants, acquittals, case history, reputation effects and lawful escalation to exile, imprisonment or faction response.                           |
| **Required semantic contract**          | Public entrance, hearing room, authority station, clerk desk, witness/evidence position, secure records, guard point, private consultation and optional humane holding cell.                           |
| **Blueprint Forge source profile**          | Justice source with public hearing room, authority and clerk stations, witness/evidence positions, secure records, private consultation, humane temporary holding where enabled, guard route and active-case, closed, unrest, occupied and damaged states. |
| **Runtime products, persistence and LOD**   | Persist cases, accused/victim/witness links, evidence confidence, law profile, hearings, judgments, holding state, staff and history. Distant cases preserve facts and consequences without rendering every hearing. |
| **Placement and utilities**             | Accessible civic area with secure connection to guard routes; should not expose detainees or evidence to public traffic.                                                                               |
| **Construction profile**                | 7 stages including secure shell, public hearing area, records, evidence storage, guard access, optional holding and legal commissioning.                                                               |
| **Upgrade, inheritance and branch links**            | Higher court, appeals chamber, prison or justice complex only if later mechanics justify separate universal definitions; can attach to Town Hall or Fort.                                              |
| **Planner triggers and failure states** | Conditional on crime/dispute volume, formal laws, population and faction expectations. Does not operate without a recognised authority, law profile, staff, reports or valid evidence/witness process. |
| **Restricted player-creator validation**         | Must separate public, judicial, evidence and holding circulation; provide safe exits and humane detention where used. A throne room or prison cell alone cannot claim justice service.                 |
| **Pack and style resolution**         | Magistrate house, clan arbitration circle, oath court, merchant tribunal, spirit-witness shrine, dwarven law vault or mobile nomad judgment pavilion.                                                  |

### 66. Tax or Customs Office

`building.governance.tax_customs_office`

| **Catalogue role**                      | Governance / Trade Control \| Town \| Small-Medium \| Conditional \| Legacy Legacy Beta Provenance Provenance                                                                                                                  |
|-----------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Infrastructure \| Secondary: Work, Safety                                                                                                                                         |
| **Purpose**                             | Manages tolls, tariffs, tribute, declared goods, inspections and route permissions where the settlement law or political situation requires them.                                          |
| **Capacity / service**                  | Draft one or more inspection lanes or counters, a small secure treasury or evidence store and staff capacity matched to the connected gate, port or caravan route.                         |
| **Jobs and users**                      | Tax collector, customs officer, clerk, appraiser, guard, interpreter, caravan master and merchant.                                                                                         |
| **Inputs**                              | Trade manifests, scales, seals, law and tariff profiles, secure cash storage, inspection tools and route traffic.                                                                          |
| **Outputs / services**                  | Treasury revenue, legal declarations, permits, contraband cases, toll records, trade statistics and political or reputation consequences.                                                  |
| **Required semantic contract**          | Public counter, inspection zone, ledger desk, scales, secure money/evidence store, guard point, queue space and route socket.                                                              |
| **Blueprint Forge source profile**          | Route-bound customs/tax source with inspection lane, public counter, manifest/ledger stations, secure goods/evidence store, guard position, loading socket, queue and bypass checks plus open, restricted, embargoed, corrupt, looted and occupied states. |
| **Runtime products, persistence and LOD**   | Persist route/port binding, manifests, inspected stock, taxes/tolls, exemptions, confiscations, staff, queues, corruption or smuggling incidents and ownership transfers. No revenue or contraband is created without a transaction. |
| **Placement and utilities**             | At or near a gate, port, bridge, market route or customs boundary. Must preserve traffic flow and emergency access.                                                                        |
| **Construction profile**                | 5-6 stages, with inspection and ledger functions activating before prestige frontage or expanded storage.                                                                                  |
| **Upgrade, inheritance and branch links**            | Customs house, treasury complex, border administration or integrated trade exchange; occupation or tribute variant uses the same function with different laws and consequences.            |
| **Planner triggers and failure states** | Triggered by route value, taxation law, faction border, smuggling pressure, conquest or trade volume. Fails without authority, staff, route traffic, secure storage or clear tariff rules. |
| **Restricted player-creator validation**         | Must connect to a real route and provide safe inspection, queue and secure storage zones. Decorative toll booths cannot collect from unrelated distant trade.                              |
| **Pack and style resolution**         | Gate tax booth, harbour customs hall, merchant weigh house, tribute lodge, rune-seal checkpoint or caravan counting tent.                                                                  |

### 67. Embassy or Diplomatic Hall

`building.governance.embassy_diplomatic_hall`

| **Catalogue role**                      | Governance / Diplomacy \| City \| Large \| Conditional \| Legacy Legacy Beta Provenance Provenance                                                                                                                                              |
|-----------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Morale \| Secondary: Safety, Work                                                                                                                                                                  |
| **Purpose**                             | Supports resident or visiting envoys, formal negotiation, treaties, cultural exchange and secure faction contact.                                                                                           |
| **Capacity / service**                  | Draft one or more delegations, negotiation rooms, secure document storage and optional guest accommodation depending on the blueprint profile.                                                              |
| **Jobs and users**                      | Ambassador, envoy, diplomat, interpreter, clerk, cultural adviser, guard, servant and visiting faction representative.                                                                                      |
| **Inputs**                              | Diplomatic documents, hospitality provisions, gifts, security, interpreters, faction permissions and maintenance.                                                                                           |
| **Outputs / services**                  | Negotiations, treaties, ceasefires, trade access, cultural events, faction quests, warnings and diplomatic incidents remembered by the world.                                                               |
| **Required semantic contract**          | Reception, negotiation room, offices, secure archive, delegation waiting or guest area, flag or identity points, guard stations and discreet service access.                                                |
| **Blueprint Forge source profile**          | Diplomatic source with controlled public reception, envoy offices, neutral negotiation room, secure records, hospitality and guard routes, cultural display modules, protected communication point and summit, protest, siege, occupation and closure states. |
| **Runtime products, persistence and LOD**   | Persist diplomatic missions, envoys, treaty drafts, relations, hospitality/security state, meetings, incidents, protests and occupation. Distant diplomacy advances through bounded events with named participants and records. |
| **Placement and utilities**             | Civic or diplomatic district with safe road, port or portal access; must be defensible without resembling a prison.                                                                                         |
| **Construction profile**                | 8 stages; reception and negotiation can activate before full guest wing, gardens or prestige decoration.                                                                                                    |
| **Upgrade, inheritance and branch links**            | Diplomatic quarter, realm embassy, grand treaty hall or palace wing through 20F/20G.                                                                                                                        |
| **Planner triggers and failure states** | Conditional on sustained faction contact, treaties, visitors, regional importance or conflict mediation. Underperforms without envoys, interpreters, security, hospitality or recognised diplomatic status. |
| **Restricted player-creator validation**         | Must separate public reception, secure negotiation, archives and guest circulation. A decorative foreign-style building cannot claim diplomatic capacity without active faction links and staff.            |
| **Pack and style resolution**         | Shared neutral hall, foreign enclave, floating embassy, portal embassy, clan guesthouse, merchant legation or warded inter-realm mission.                                                                   |## 24.1 v1.0 Justice / External-Authority Ownership Note

For Courthouse/Magistrate:

- 20C owns hearing/evidence/record/holding capacity;
- Document 13 owns law/jurisdiction/legal outcome;
- Set 28 owns testimony/social response;
- Set 27 owns fines/payments;
- Set 29 owns detention/treatment biology.

For Tax/Customs:

- 20C owns physical office/inspection capacity;
- Document 13 owns levy/jurisdiction authority;
- Set 27 owns assessment/tariff/payment/treasury;
- Set 26J owns specialist port-call customs where applicable.

For Embassy/Diplomatic Hall:

- 20C owns diplomatic venue capacity;
- Document 13 owns treaty/recognition/political state;
- Set 28 owns negotiation/dialogue/social reaction.

# 25. Safety and Defence Entries

### 71. Guard Post

`building.safety.guard_post`

| **Catalogue role**                      | Safety / Patrol \| Village \| Small \| Required \| Legacy POC Raid Provenance                                                                                                                                                 |
|-----------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Safety \| Secondary: Work                                                                                                                                                                              |
| **Purpose**                             | Provides local patrol assignment, guard readiness, equipment access and rapid response coverage for a village area or route.                                                                                    |
| **Capacity / service**                  | Draft one to four active guards depending on valid stations, equipment and patrol network; extra decorative beds or chairs do not increase response capacity.                                                   |
| **Jobs and users**                      | Guard, watch officer, patrol captain, gatekeeper, militia member, messenger and temporary detainee escort.                                                                                                      |
| **Inputs**                              | Weapons, armour, light, signal tools, patrol orders, food through normal provisions, maintenance and optional ammunition.                                                                                       |
| **Outputs / services**                  | Patrol coverage, local response, crime deterrence, incident reporting, escort, gate support and visible security presence.                                                                                      |
| **Required semantic contract**          | Guard station, equipment rack, rest or briefing point, patrol route sockets, signal point, secure report box and road access.                                                                                   |
| **Blueprint Forge source profile**          | Compact guard-service source with muster and duty positions, equipment issue, report desk, holding/first-response point, patrol and alarm sockets, public/private separation and staffed, alert, engaged, damaged, abandoned and occupied states. |
| **Runtime products, persistence and LOD**   | Persist assigned guards, equipment, shifts/availability, patrol zones, reports, detainees where enabled, alarms, readiness, damage and response history. Nearby movement is visible; distant coverage uses the same personnel and equipment totals. |
| **Placement and utilities**             | At a village centre, gate, market, road junction or vulnerable facility. Coverage should overlap meaningfully rather than encouraging unlimited post spam.                                                      |
| **Construction profile**                | 5 stages: foundation; shell; guard station; equipment and signal; patrol-link inspection and activation.                                                                                                        |
| **Upgrade, inheritance and branch links**            | Expanded watch house, barracks, gatehouse post, mounted patrol station or culture-specific guard lodge.                                                                                                         |
| **Planner triggers and failure states** | Required at Village stage where threat settings are active. Fails with no guards, equipment, safe route, authority or patrol links; overloaded coverage creates slow response rather than invisible protection. |
| **Restricted player-creator validation**         | Must provide guard work positions, secure equipment, path sockets and a reachable response route. A decorative hut cannot claim patrol coverage.                                                                |
| **Pack and style resolution**         | Town watch booth, clan warrior lodge, ranger post, fae sentinel tree, dwarven gate alcove, nomad mounted post or magical scry-watch room.                                                                       |

### 72. Wooden Watchtower

`building.safety.wooden_watchtower`

| **Catalogue role**                      | Safety / Detection \| Village \| Medium \| Required \| Legacy POC Core Provenance                                                                                                                                                           |
|-----------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Safety \| Secondary: Infrastructure                                                                                                                                                                                  |
| **Purpose**                             | Provides elevated detection, warning, ranged defence and the core proof that preparation changes a raid outcome.                                                                                                              |
| **Capacity / service**                  | Draft one to three guards, a defined sight and signal profile and limited ammunition or emergency supply storage.                                                                                                             |
| **Jobs and users**                      | Watch guard, archer, signaler, patrol captain and relief guard.                                                                                                                                                               |
| **Inputs**                              | Guard staffing, weapons, ammunition, signal fuel or devices, light, maintenance materials and accessible patrol support.                                                                                                      |
| **Outputs / services**                  | Earlier warning, increased guard readiness time, visible threat coverage, ranged position, signal events and reduced surprise during raids.                                                                                   |
| **Required semantic contract**          | Safe stair or ladder, lookout deck, guard stations, sightline points, signal beacon or bell, cover or railing, equipment/ammunition point and ground patrol socket.                                                           |
| **Blueprint Forge source profile**          | Golden defence source with safe vertical access, lookout and ranged positions, line-of-sight sectors, signal device, shelter/equipment point, patrol link, collapse groups and construction, operational, obscured, burning, breached and repaired states. |
| **Runtime products, persistence and LOD**   | Persist observers, equipment, coverage sectors, obstruction/weather modifiers, signal links, warning state, damage groups and repairs. Cached sight sectors are rebuilt from Forge source when terrain or structure state changes. |
| **Placement and utilities**             | Perimeter, ridge or strategic approach with real line-of-sight and safe access. Overlapping towers give diminishing returns unless they cover distinct approaches.                                                            |
| **Construction profile**                | 7 stages: site; foundation; frame; upper platform; safe access; railing/cover and signal; inspection. Functional warning may activate before final decoration.                                                                |
| **Upgrade, inheritance and branch links**            | Stone watchtower, gatehouse tower, beacon chain, ward tower or integrated city wall tower.                                                                                                                                    |
| **Planner triggers and failure states** | Required in the POC defence loop and selected when scouting, raids or blind approaches create Safety pressure. Fails if sightlines are blocked, access is unsafe, no guard or signal exists, or damage disables the platform. |
| **Restricted player-creator validation**         | Must meet minimum height/coverage profile, safe climb, usable deck, signal marker and sightline checks. A tall decorative spire cannot grant detection without guard access and observation points.                           |
| **Pack and style resolution**         | Timber tower, treetop lookout, desert beacon, cliff perch, dwarven shaft tower, nomad signal mast or rune-lit sentinel platform.                                                                                              |

### 73. Palisade Segment

`project.defence.palisade_segment`

| **Catalogue role**                      | Defence / Perimeter Project \| Village \| Network \| Required \| Legacy POC Raid Provenance                                                                                                                                                                    |
|-----------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Safety \| Secondary: Infrastructure                                                                                                                                                                                                     |
| **Purpose**                             | Creates a modular early perimeter that delays, channels and reveals attackers without pretending to make a settlement invulnerable.                                                                                                              |
| **Capacity / service**                  | Coverage is calculated from connected segment length, height, collision, terrain fit, gates and breach state rather than a single building capacity.                                                                                             |
| **Jobs and users**                      | Builders, lumber workers, repair crews, guards and patrols.                                                                                                                                                                                      |
| **Inputs**                              | Logs or equivalent barriers, rope or fasteners, tools, gates or corner pieces, repair stock and labour.                                                                                                                                          |
| **Outputs / services**                  | Perimeter continuity, movement delay, channelled approaches, patrol boundary, livestock or civilian separation and visible breach points.                                                                                                        |
| **Required semantic contract**          | Segment sockets, corner and slope compatibility, gate sockets, ground seal, repair points, inside patrol clearance and collision profile.                                                                                                        |
| **Blueprint Forge source profile**          | Modular perimeter project source with repeatable segments, corner/end adapters, terrain-following supports, connection sockets, patrol/repair access, breach groups, material-role substitution and intact, damaged, burning, collapsed and patched deltas. |
| **Runtime products, persistence and LOD**   | Persist each placed segment and stable element IDs, connection graph, ownership, condition, breach groups, fire state, repair work and patrol access. Distant raids damage explicit sectors rather than an abstract wall percentage only. |
| **Placement and utilities**             | Along an approved perimeter plan that respects roads, water, terrain, future expansion and emergency exits. It should not trap residents or block essential work routes.                                                                         |
| **Construction profile**                | 4 stages per module: layout posts; structural barrier; bracing and connections; inspection/repair points. Large perimeters build by segments rather than one huge timer.                                                                         |
| **Upgrade, inheritance and branch links**            | Reinforced timber wall, stone wall and gatehouse system, ditch or earthwork attachment, warded palisade or culture-specific living barrier.                                                                                                      |
| **Planner triggers and failure states** | Required in the POC only where the village defence plan calls for a perimeter; otherwise equivalent terrain or cultural defences may validate. Fails through gaps, low terrain clearance, disconnected gates, fire damage or blocked evacuation. |
| **Restricted player-creator validation**         | Player modules must connect cleanly, provide real collision/delay, expose breach and repair states and preserve valid paths. Decorative fences cannot claim palisade defence.                                                                    |
| **Pack and style resolution**         | Sharpened logs, woven thorn wall, earthen rampart, giant bone fence, living hedge, rune stakes, ice barrier or portable wagon laager.                                                                                                            |

### 74. Village Gate

`building.safety.village_gate`

| **Catalogue role**                      | Safety / Access Control \| Village \| Medium \| Required \| Legacy POC Raid Provenance                                                                                                         |
|-----------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Safety \| Secondary: Infrastructure                                                                                                                                     |
| **Purpose**                             | Creates a controlled road opening, guard point and defensible connection through an early perimeter.                                                                             |
| **Capacity / service**                  | Draft one main road opening, one or more guard stations and a permission/lock profile. Throughput depends on clear width, mechanism, staffing and traffic.                       |
| **Jobs and users**                      | Gate guards, watch officer, customs or messenger support, patrols and builders or repair workers.                                                                                |
| **Inputs**                              | Gate mechanism, hinges or ropes, keys or permission state, guard equipment, signal/light supplies and repair materials.                                                          |
| **Outputs / services**                  | Controlled access, visitor checks, road continuity, raid chokepoint, curfew or permission enforcement and incident reporting.                                                    |
| **Required semantic contract**          | Gate opening, inside/outside road sockets, guard positions, gate mechanism, lock/permission point, signal, safe operating clearance and emergency release.                       |
| **Blueprint Forge source profile**          | Controlled-access source with road/perimeter sockets, gate mechanism, guard/inspection positions, queue and emergency bypass zones, lock/permission interface, signal link and open, closed, barred, jammed, breached, burning and repaired states. |
| **Runtime products, persistence and LOD**   | Persist gate mechanism and lock state, permissions, guard staff, queues, road/perimeter links, alarms, damage and access history. Gate visuals follow authoritative open/closed/jammed/breached state. |
| **Placement and utilities**             | At a connected palisade or equivalent boundary on a real road. Must allow daily traffic, carts where intended and emergency evacuation.                                          |
| **Construction profile**                | 6 stages: foundations/posts; frame; gate leaves or barrier; mechanism; guard/signal positions; road and perimeter inspection.                                                    |
| **Upgrade, inheritance and branch links**            | Stone gatehouse, customs gate, portcullis system, warded gate or ceremonial city entrance.                                                                                       |
| **Planner triggers and failure states** | Required with the POC palisade. Fails if no perimeter connection, road is blocked, mechanism cannot operate, guards cannot reach positions or permissions lock residents inside. |
| **Restricted player-creator validation**         | Must preserve road clearance, actual open/closed states, guard access, perimeter sockets and emergency operation. Decorative archways do not provide access control.             |
| **Pack and style resolution**         | Timber gate, wagon gate, thorn arch, dwarven stone door, desert portcullis, fae living arch or rune-sealed threshold.                                                            |

### 75. Barracks and Training Yard

`building.safety.barracks_training_yard`

| **Catalogue role**                      | Safety / Military \| Fortified Village \| Large \| Optional \| Legacy Legacy Alpha Provenance Provenance                                                                                                                       |
|-----------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Safety \| Secondary: Work, Morale                                                                                                                                                 |
| **Purpose**                             | Houses or musters guards, trains replacements and improves readiness for settlements facing repeated threats.                                                                              |
| **Capacity / service**                  | Draft six to twenty-four guard or militia places and several training stations, scaled by valid beds, muster space, instructors, gear and logistics.                                       |
| **Jobs and users**                      | Captain, trainer, guard, militia, recruit, quartermaster, healer support, cook or stable worker where extensions exist.                                                                    |
| **Inputs**                              | Weapons, armour, ammunition, training equipment, food from normal provisions, bedding, medicine, maintenance and orders.                                                                   |
| **Outputs / services**                  | Guard housing or duty accommodation, training, reserve force, faster mobilisation, improved skill/readiness and organised patrol shifts.                                                   |
| **Required semantic contract**          | Barracks beds or duty bunks, muster point, training zones, briefing station, equipment racks, secure store, sanitation access, road/patrol sockets and optional mess.                      |
| **Blueprint Forge source profile**          | Nested readiness source with barracks, muster, training yard, equipment issue, command, stores, recovery and optional stable/range modules, supporting drills, reserve mobilisation, partial-wing operation, occupation and damage states. |
| **Runtime products, persistence and LOD**   | Persist residents/guards, beds where applicable, training schedules, skills, equipment, stores, command links, reserve status, morale, damage and mobilisation history. Training outcomes remain tied to named NPCs. |
| **Placement and utilities**             | Inside a defended district with clear training space and rapid routes to gates, towers and vulnerable areas; noise and weapon clearances must be respected.                                |
| **Construction profile**                | 7-8 stages, allowing muster and training functions to activate before full dormitory or prestige completion.                                                                               |
| **Upgrade, inheritance and branch links**            | Military academy, cavalry barracks, fort complex, city guard headquarters or culture-specific warrior hall.                                                                                |
| **Planner triggers and failure states** | Selected after repeated raids, guard shortages, population growth or military policy. Underperforms without captain/trainer, gear, valid training space, provisions or patrol connections. |
| **Restricted player-creator validation**         | Must expose real safe training zones, muster capacity, equipment and duty accommodation. Decorative targets and beds alone do not increase readiness.                                      |
| **Pack and style resolution**         | Militia hall, warrior longhouse, ranger compound, knight barracks, dwarven shield hall, nomad mounted camp or battle-mage training court.                                                  |

### 76. Stone Wall and Gatehouse System

`project.defence.stone_wall_gatehouse`

| **Catalogue role**                      | Defence / Perimeter Network \| Town \| Network \| Upgrade \| Legacy Legacy Beta Provenance Provenance                                                                                                                                                                |
|-----------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Safety \| Secondary: Infrastructure                                                                                                                                                                                     |
| **Purpose**                             | Replaces or reinforces early barriers with durable connected walls, towers, patrol routes and controlled gates suited to siege and town-scale defence.                                                                           |
| **Capacity / service**                  | Coverage derives from connected wall modules, parapet access, towers, gates, foundations, terrain, damage and staffed patrol sectors.                                                                                            |
| **Jobs and users**                      | Masons, builders, engineers, gate crews, guards, archers, repair teams and siege specialists.                                                                                                                                    |
| **Inputs**                              | Stone or equivalent durable material, mortar, timber, metal fittings, mechanisms, scaffolding, tools, labour, guard supplies and repair stock.                                                                                   |
| **Outputs / services**                  | Durable perimeter, patrol walkway, controlled routes, siege delay, tower positions, civilian confidence and visible breach/repair state.                                                                                         |
| **Required semantic contract**          | Wall sockets, corner/tower sockets, walkable parapet where intended, stairs/access towers, gatehouse interfaces, drainage, foundations, repair anchors and inside/outside clearance.                                             |
| **Blueprint Forge source profile**          | Parametric wall-and-gatehouse system using wall, tower, corner, stair, parapet, gatehouse, postern and repair modules with terrain adaptation, patrol graph, siege groups, staged reinforcement and sector-level breach/restoration deltas. |
| **Runtime products, persistence and LOD**   | Persist connected sectors, towers, gates, patrol routes, siege damage, repair access, ownership and upgrade ancestry. Simulation may aggregate by sector while retaining exact breached and destroyed modules. |
| **Placement and utilities**             | Town perimeter plan respecting terrain, roads, rivers, expansion zones, utilities and evacuation. Walls should exploit geography rather than require a perfect circle.                                                           |
| **Construction profile**                | 8-stage modular profile: survey; foundations; lower wall; full wall; parapet/access; towers/gatehouse; mechanisms; inspection. Segments can activate independently.                                                              |
| **Upgrade, inheritance and branch links**            | City wall complex, layered fortress, warded wall, anti-siege additions, moat/earthworks or realm-specific defensive boundary.                                                                                                    |
| **Planner triggers and failure states** | Triggered by Fortified Village growth, strategic wealth, repeated siege threats or political borders. Fails through disconnected sectors, inaccessible patrols, unstable foundations, blocked gates or insufficient maintenance. |
| **Restricted player-creator validation**         | Modules must form a coherent network with real collision, access, height and repair states. Inaccessible decorative battlements cannot provide patrol or ranged capacity.                                                        |
| **Pack and style resolution**         | Ashlar curtain wall, dwarven mountain rampart, desert bastion, living-root wall, ice fortress, giant masonry, arcane barrier pylons or terraced cliff defence.                                                                   |

### 77. Armoury

`building.safety.armoury`

| **Catalogue role**                      | Safety / Equipment \| Fortified Village \| Medium \| Optional \| Legacy Legacy Alpha Provenance Provenance                                                                                                                                       |
|-----------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Safety \| Secondary: Infrastructure, Work                                                                                                                                                           |
| **Purpose**                             | Stores, maintains, issues and accounts for guard weapons, armour, ammunition and emergency equipment.                                                                                                        |
| **Capacity / service**                  | Draft equipment sets and secure storage slots based on real racks, containers, quartermaster stations, item condition and permissions.                                                                       |
| **Jobs and users**                      | Quartermaster, armourer or smith support, guard, fletcher, repair worker and commander.                                                                                                                      |
| **Inputs**                              | Weapons, armour, ammunition, shields, repair kits, oils, spare parts, records, locks and maintenance.                                                                                                        |
| **Outputs / services**                  | Guard readiness, rapid issue and return, secure reserves, equipment condition tracking and reduced loss or theft.                                                                                            |
| **Required semantic contract**          | Secure entrance, equipment racks, ammunition or hazardous store, issue counter, maintenance bench, records, guard access and logistics socket.                                                               |
| **Blueprint Forge source profile**          | Secure supply source with armour, weapon, ammunition and emergency-equipment categories, issue/return desk, maintenance stations, restricted access, loading route, fire/theft protection and stocked, depleted, looted, seized and damaged states. |
| **Runtime products, persistence and LOD**   | Persist exact owned stock, categories, issue/return transactions, reservations, staff, maintenance, access, theft, fire and seizure history. Readiness uses actual available and suitable equipment. |
| **Placement and utilities**             | Near barracks, gatehouse, fort or guard headquarters; protected from fire, theft, flooding and uncontrolled public access.                                                                                   |
| **Construction profile**                | 6 stages: secure shell; reinforced doors; racks/stores; maintenance/issue point; inventory records; inspection and activation.                                                                               |
| **Upgrade, inheritance and branch links**            | City arsenal, siege store, magical armoury, faction vault or integrated fort supply complex.                                                                                                                 |
| **Planner triggers and failure states** | Selected when guards exist but equipment readiness is low, stock is dispersed or raids justify reserves. Fails without quartermaster permissions, real stock, secure access, safe storage or repair support. |
| **Restricted player-creator validation**         | Capacity must map to real secured storage and item types. Decorative weapon displays do not count as available guard equipment.                                                                              |
| **Pack and style resolution**         | Shield hall, weapon vault, ranger cache, dwarven arsenal, nomad wagon armoury, rune-locked store or living-wood bow house.                                                                                   |## 25.1 v1.0 Safety / Combat / Movement Ownership Note

All guard/fortification entries provide **protection infrastructure and readiness inputs**.

- Document 07 owns guards and schedules.
- Document 16 owns tactical combat.
- Set 29 owns injuries/fatigue/Health.
- Set 30 owns patrol, pursuit, access and evacuation movement.
- Document 12 owns physical fortification damage.
- Document 15 owns raid/threat event lifecycle.
- Inventory systems own weapons/ammunition.
- Set 27 owns paid military employment/procurement where applicable.

A watchtower, wall or barracks cannot directly create abstract combat strength.

# 26. Emergency-Service Entries

### 79. Fire and Rescue Station

`building.emergency.fire_rescue_station`

| **Catalogue role**                      | Emergency / Response \| Town \| Medium \| Optional \| Legacy Legacy Beta Provenance Provenance                                                                                                                                             |
|-----------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Safety \| Secondary: Health, Infrastructure                                                                                                                                                   |
| **Purpose**                             | Provides trained response, equipment and dispatch for fires, collapses, floods, accidents and non-military rescue events.                                                                              |
| **Capacity / service**                  | Draft one or more response teams, equipment bays and service coverage based on staffing, water/tools, roads and travel time.                                                                           |
| **Jobs and users**                      | Firefighter, rescuer, engineer, medic, dispatcher, water carrier, animal handler and maintenance worker.                                                                                               |
| **Inputs**                              | Water access, pumps or buckets, ladders, ropes, axes, protective gear, carts or mounts, medicine, alarms and maintenance.                                                                              |
| **Outputs / services**                  | Fire suppression, rescue, inspections, faster emergency response, casualty reduction, road clearing and disaster reports.                                                                              |
| **Required semantic contract**          | Emergency entrance, equipment bay, water-fill point, dispatch or alarm station, maintenance/drying area, treatment point, crew ready area and priority road socket.                                    |
| **Blueprint Forge source profile**          | Emergency-response source with alarm intake, crew muster, tool and medical stores, water/freight sockets, vehicle/animal clearance where used, decontamination and recovery zones plus ready, dispatched, overloaded, contaminated, damaged and restored states. |
| **Runtime products, persistence and LOD**   | Persist responders, alarms, incident assignments, tools, water/medical supplies, routes, response times, casualties/rescues, contamination and damage. Distant events consume the same staff and supplies. |
| **Placement and utilities**             | Central to dense or high-risk districts with reliable water and unobstructed emergency routes; should not be isolated behind market queues or closed gates.                                            |
| **Construction profile**                | 6-7 stages, with equipment bay and dispatch activating before full crew quarters or training extensions.                                                                                               |
| **Upgrade, inheritance and branch links**            | City emergency headquarters, harbour rescue, mine rescue, magical disaster response or integrated hospital/emergency complex.                                                                          |
| **Planner triggers and failure states** | Selected when density, flammable materials, industry, disasters or incident travel time create Safety pressure. Fails without trained crew, water, tools, alarm, route access or maintained equipment. |
| **Restricted player-creator validation**         | Must support rapid exit, equipment loading, water access and safe return/maintenance. Decorative bell towers do not create rescue service.                                                             |
| **Pack and style resolution**         | Bucket brigade hall, water-cart house, dwarven mine rescue station, desert cistern brigade, fae growth-healing response or rune-powered fire ward depot.                                               |

### 80. Emergency Shelter or Refuge Bunker

`building.emergency.refuge_bunker`

| **Catalogue role**                      | Emergency / Civilian Protection \| Town \| Large \| Conditional \| Legacy Legacy Beta Provenance Provenance                                                                                                                                                     |
|-----------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Safety \| Secondary: Housing, Health                                                                                                                                                                               |
| **Purpose**                             | Protects civilians during raids, storms, fires, magical disasters or other temporary emergencies without replacing permanent housing.                                                                                       |
| **Capacity / service**                  | Draft twenty to one hundred or more emergency occupants according to protected volume, exits, air, water, sanitation, provisions and supervision profiles.                                                                  |
| **Jobs and users**                      | Shelter steward, guard, healer, quartermaster, messenger, engineer and temporary evacuees.                                                                                                                                  |
| **Inputs**                              | Emergency food and water, medicine, bedding or seating, lighting, air or ventilation, sanitation supplies, fuel or mana where required and maintenance.                                                                     |
| **Outputs / services**                  | Refuge capacity, organised evacuation, casualty reduction, temporary treatment, family reunification and disaster resilience.                                                                                               |
| **Required semantic contract**          | Protected occupied volume, multiple safe entrances/exits, muster/registration, sleeping or seating points, provisions, sanitation, treatment, ventilation, guard point and emergency route sockets.                         |
| **Blueprint Forge source profile**          | Protected refuge source with controlled entrances, evacuation and emergency-route sockets, occupancy zones, provisions/water/medicine stores, sanitation and air/ward options, command/triage points and sealed, occupied, overloaded, breached and cleared states. |
| **Runtime products, persistence and LOD**   | Persist protected capacity, occupants, household links, supplies, sanitation/air/ward state, access, hazard profile, triage, deaths/injuries, breach and release history. Refuge does not replace permanent housing after the event. |
| **Placement and utilities**             | Outside the most likely hazard footprint or engineered against it, reachable from populated districts by more than one route and not dependent on the failed utility it protects against.                                   |
| **Construction profile**                | 7-9 stages depending on earthworks or wards: survey; excavation/foundation; protected shell; exits; ventilation/utilities; stores; treatment/muster; inspection and stocking.                                               |
| **Upgrade, inheritance and branch links**            | Siege refuge, storm shelter, flood refuge, warded corruption bunker, mountain sanctuary or district shelter network.                                                                                                        |
| **Planner triggers and failure states** | Triggered by siege risk, storms, floods, magical instability, population density or prior casualties. Fails if the hazard profile is wrong, exits block, supplies expire, ventilation fails or capacity is falsely claimed. |
| **Restricted player-creator validation**         | Must prove protected capacity, evacuation routes, exits, utilities and stock positions under the intended hazard profile. A deep decorative room cannot count as a bunker by depth alone.                                   |
| **Pack and style resolution**         | Cellar refuge, hill fort shelter, cavern sanctuary, raised flood refuge, living-tree cocoon, rune ward vault, mobile evacuation caravan or underground district bunker.                                                     |## 26.1 v1.0 Emergency Ownership Note

Fire/Rescue and Refuge entries provide **response/refuge capacity**.

They do not own:

- event lifecycle — Document 15;
- responder person/job — Document 07;
- physical movement/rescue travel — Set 30/26;
- injury/treatment — Set 29;
- structure damage/repair — Document 12/20;
- maritime specialist rescue — Set 26.

A completed rescue station can remain constrained/offline if crew, routes, water/tools or specialist conditions are missing.

# 27. Archived Validation Scope

The former Legacy POC Provenance / Raid Extension / Legacy Alpha Provenance / Legacy Beta Provenance scope labels are no longer active production authority.

They remain provenance.

## 27.1 Archived Watchtower / Raid Fixture

The historical regression fixture may continue to test:

- 72 Wooden Watchtower;
- 61 Village Hall;
- 71 Guard Post;
- 73 Palisade Segment;
- 74 Village Gate;
- named guards;
- warning;
- route access;
- attack;
- breach;
- casualty;
- repair;
- save/LOD.

## 27.2 What Is Archived

Normal production does not require:

- Forest Hamlet;
- fixed watchtower site;
- fixed Goblin faction;
- fixed Day-4 raid;
- fixed guard roster;
- fixed wall/gate layout;
- fixed civic hall;
- fixed resource chain.

## 27.3 What Is Preserved

Preserve:

- physical tower access;
- real observation/warning;
- named guard staffing;
- real equipment/ammunition;
- physical perimeter/gates;
- combat consequences;
- injuries/casualties;
- evacuation/refuge;
- structure damage;
- repair;
- political/social/economic aftermath;
- save/LOD.

## 27.4 Golden Regression Cases

1. Empty watchtower versus staffed watchtower.
2. Obstructed versus clear sightline.
3. Connected versus breached perimeter.
4. Gate open, closed, jammed and destroyed.
5. Guard equipped, unequipped, injured, fatigued and absent.
6. Village Hall authorised, unstaffed and politically contested.
7. Save/load during alert, combat, evacuation, breach and repair.
8. Distant threat promoted locally without rerolling casualties, ammunition or damage.
9. Tax/customs office present without valid Set-27 economic service.
10. Court present without valid Document-13 legal authority.

# 28. Simulation LOD, Persistence and Multiplayer Authority

20C can simplify at distance without changing political, legal, combat, biological or physical truth.

## 28.1 Local Detail

Nearby simulation may show:

- officials/guards/responders;
- public queues;
- hearing/case interaction;
- gate operation;
- patrols;
- warning signals;
- combat;
- firefighting;
- rescue;
- evacuation;
- fortification repair.

## 28.2 Distant Summary

Distant simulation may aggregate:

- civic-service load;
- justice-service backlog;
- guard-position/readiness summary;
- perimeter/gate state;
- response coverage;
- refuge occupancy;
- event consequences.

External systems remain authoritative for their own state.

## 28.3 Persistent Minimum

Persist/reference as required:

- StructureInstance;
- 20C ServiceRecord;
- source blueprint/version;
- authority/legal refs;
- external tax/treasury/contract refs;
- case/evidence/legal outcome refs;
- guard/responder refs;
- equipment/storage refs;
- patrol/route refs;
- perimeter graph;
- signal graph;
- incident/event refs;
- refuge occupancy refs;
- damage/history;
- source revisions.

## 28.4 LOD Invariants

LOD cannot:

- create political legitimacy;
- change law;
- convict/acquit;
- pay/collect taxes;
- spawn a guard;
- heal/fatigue a guard;
- refill ammunition;
- repair a wall;
- change a gate route;
- teleport evacuees;
- win a battle;
- erase casualties;
- create a treaty.

## 28.5 Multiplayer

Host/server authority commits:

- ConstructionProjects;
- physical structure/gate/wall changes;
- public service activation;
- authoritative access-control state;
- project/repair/rescue reservations.

Document 13 owns political/legal authority.

Set 27 owns financial transactions.

Set 28 owns social state.

Set 29 owns biology.

Set 30/26 owns movement.

Document 16 owns combat.

Clients may predict presentation but cannot fabricate protection outcomes.

# 29. Godot + Summer Engine Implementation Direction

Document 18 v1.0 is the technical authority.

20C defines logical records/interfaces and does not invent exact repository paths.

## 29.1 Logical Definition / Record Types

Implementation may require equivalents of:

- `CivicFacilityProfile`
- `JusticeFacilityProfile`
- `GuardFacilityProfile`
- `DetectionCoverageProfile`
- `PerimeterGraph`
- `SignalGraph`
- `AccessControlProfile`
- `EmergencyResponseFacilityProfile`
- `RefugeProfile`
- `BuildingServiceRecord`
- `FacilityCaseQueueRecord`
- `ProtectionReadinessView`

Exact class/resource names require repository mapping.

## 29.2 Domain Boundaries

- 20C — facility/service capacity;
- Document 13 — government/law/politics;
- Document 07 — officials/guards/responders;
- Set 27 — public finance/tax/fines/customs economics;
- Set 28 — social/testimony/willingness;
- Set 29 — biology;
- Set 30/26 — movement;
- Document 16 — combat;
- Document 15 — event lifecycle;
- Document 12 — StructureInstance;
- Document 19 — planning;
- Document 20 — ConstructionProject;
- 22I — official source.

## 29.3 Event-Driven Re-Evaluation

Re-evaluate affected service when revisions change:

- authority/law/jurisdiction;
- staff;
- evidence/case load;
- stock/equipment;
- signal;
- perimeter;
- route;
- event/threat;
- structure damage;
- emergency occupancy;
- public-finance/customs service.

No settlement-wide per-frame government or defence simulation is required.

## 29.4 SceneTree Boundary

Godot Nodes may represent:

- guards;
- officials;
- gate leaves;
- bells;
- towers;
- wall pieces;
- evacuees;
- responders.

Persistent political/legal/protection truth survives Node unload.

## 29.5 Summer Engine

Summer Engine may assist with:

- schemas;
- validators;
- migration;
- tests;
- perimeter/coverage diagnostics;
- regression fixtures.

All work follows Document-18/Set-25 bounded task contracts.

# 30. Balancing, Diagnostics and Anti-Exploit Rules

## 30.1 Balance Principles

- Safety remains one need rather than many defence meters.
- Fortifications buy time/position rather than immunity.
- Staffing, equipment, routes and warning matter as much as wall quantity.
- Civic infrastructure supports government but does not create legitimacy.
- Justice is evidence/jurisdiction driven rather than omniscient.
- Emergency facilities reduce risk without erasing disaster consequence.
- Refuge remains temporary protection rather than free permanent Housing.
- Higher-security buildings create cost, maintenance and access trade-offs.
- Cultural/political equivalents remain valid where functional contracts match.

## 30.2 Anti-Exploit Rules

- Decorative throne/desk does not create authority.
- Courtroom markers do not create guilty verdicts.
- Tax desk does not generate currency.
- Embassy does not create treaty/peace.
- Watchtower without valid observer/sensor does not create omniscient detection.
- Guard markers do not spawn guards.
- Armoury shelves do not create equipment/ammunition.
- Wall quantity does not create abstract “defence power.”
- Gate permission does not override Set-30 physical accessibility.
- Refuge depth alone does not make it safe.
- Fire station does not extinguish incidents remotely without responders/resources/routes.
- Distant simulation does not heal casualties or repair fortifications.
- Player blueprints cannot hide invulnerable collision, secret coverage origins or untyped capacity.
- Construction follows canonical Block/Item identity.

## 30.3 v1.0 Diagnostic Additions

| Code | Severity | Meaning |
|---|---|---|
| `20C-POLITICS-OWNER-VIOLATION` | Fatal | 20C attempted to create/replace Document-13 political or legal state. |
| `20C-ECON-OWNER-VIOLATION` | Fatal | 20C attempted to commit tax/fine/treasury/customs economic state belonging to Set 27. |
| `20C-SOCIAL-OWNER-VIOLATION` | Fatal | 20C attempted to commit Trust/testimony/social outcome belonging to Set 28. |
| `20C-BIOLOGY-OWNER-VIOLATION` | Fatal | 20C attempted to commit Health/injury/Fatigue/treatment outcome. |
| `20C-COMBAT-OWNER-VIOLATION` | Fatal | Facility logic attempted to resolve tactical combat outside Document 16. |
| `20C-MOVE-OWNER-VIOLATION` | Fatal | Facility logic moved/pathed an actor outside Set 30/26. |
| `20C-LEGAL-AUTHORITY-MISSING` | Error | Civic/justice action lacks valid Document-13 authority/jurisdiction. |
| `20C-TAX-SERVICE-UNBOUND` | Error | Tax/customs facility has no valid Set-27/Document-13 service binding. |
| `20C-RESPONSE-ROUTE-STALE` | Warning/Error | Emergency/patrol route evidence is stale or invalid. |
| `20C-MARITIME-SPECIALIST-MISSING` | Error | Port/rescue/coastal function lacks required Set-26 specialist binding. |
| `20C-BLOCKITEM-DUPLICATE` | Fatal | Construction references a fake duplicate Item for a recoverable Block. |
| `20C-POC-LEAK` | Fatal | Active production depends on retired Forest-Hamlet/POC identity. |

# 31. Open Questions for Later Balancing

- final civic-service load/capacity curves;
- final guard-position requirements by settlement scale/threat profile;
- watchtower sight/coverage caching versus dynamic visibility cost;
- exact wall/gate structural-damage balance;
- militia/reserve training cadence;
- evidence-confidence and case-backlog presentation detail;
- humane-holding simulation depth;
- fine/restitution enforcement UX under Set 27/13;
- tax/customs staffing and inspection throughput;
- embassy event capacity and diplomatic protocol;
- fire/rescue staffing/tool/water ratios;
- refuge occupancy/supply/air/sanitation profiles;
- district evacuation travel thresholds;
- maritime-rescue reuse of #79 versus distinct future function;
- coastal customs/harbourmaster relationship to #66 and Set 26J;
- capital-scale command/governance composition with 20F;
- magical/automated detection and defence scaling with 20E;
- exact Set-25 Core Required/Core Conditional classification for all 17 20C identities during 20H v1.0.

These questions do not reopen the ownership boundaries locked above.

# Appendix A — 20C Functional Definition Field Template

| Field Group | Required Fields |
|---|---|
| Identity | `catalogue_no`, `stable_id`, `display_name_key`, category, owner, definition version, aliases. |
| Lifecycle | Set-25 production status, legacy provenance, prerequisites, branch/upgrade links and world/profile gates. |
| Needs / Service | Primary/secondary need, civic/protection/emergency capacity type, activation profile and planner-facing evidence. |
| Authority Interface | Required office/role refs, jurisdiction/permission refs, public/private/secure access and authority snapshot refs. |
| Justice | Intake/hearing/evidence/holding profiles and external legal/social/economic handoff refs. |
| Defence | Guard positions, coverage, signal, perimeter, gate/access, equipment and sustainment requirements. |
| Emergency | Dispatch, responder positions, tools, water/agent, refuge, evacuation and hazard profiles. |
| Source | Blueprint source profile, material roles, stages, dynamic/damage states and placement profile. |
| Construction | Stage requirements, Block/Item refs, labour, commissioning, repair/conversion/demolition continuity. |
| External Interfaces | 07 people, 13 politics/law, 27 economy, 28 social, 29 biology, 30 movement, 15 events, 16 combat, 26 maritime. |
| Runtime | Service record, graph refs, external record refs, revisions, LOD and evidence links. |
| Production | Bake/test/migration state, lifecycle classification and evidence. |

# Appendix B — Governance, Incident and Defence Matrix

| **Function** | **Primary Physical Anchor** | **Key Inputs** | **Key Output / Consequence** |
|---|---|---|---|
| Requests/permissions | Village Hall / Town Hall | Recognised authority, clerk, records, public access | Decisions, permissions, projects and visible reasons. |
| Blueprint approval | Blueprint/Planning Office | Source, parcel, validation, authority | Approved/rejected proposal with exact diagnostics. |
| Crime/dispute | Court or recognised authority | Report, people, evidence, law and staff | Judgment, consequence, reputation and history. |
| Diplomacy | Embassy or leader reception | Envoy, records, security and hospitality | Treaty, relation change, quest or incident. |
| Customs/tax | Route-bound office | Manifest, stock/value, law and staff | Transfer, inspection, confiscation and history. |
| Patrol response | Guard Post / Barracks | Guards, equipment, routes and orders | Coverage, deterrence, response and reports. |
| Warning | Watchtower / signal graph | Observer, visibility, signal | Earlier alert and mobilisation. |
| Perimeter delay | Palisade / wall / gate | Connected modules, condition and access | Delay, channel, controlled passage and breach. |
| Readiness supply | Armoury / Barracks | Stock, training, staff and provisions | Equipped guards and reserve force. |
| Fire/rescue | Response Station | Crew, tools, water/medicine, alarm and route | Suppression, rescue and reduced casualties. |
| Civilian refuge | Shelter/Bunker | Protected capacity, exits, supplies and staff | Evacuation, temporary safety and recovery. |## Appendix B.1 v1.0 Ownership Note

The matrix describes **facility participation**.

- Government/law/jurisdiction remain Document-13-owned.
- Financial/tax outcomes remain Set-27-owned.
- Social/testimony outcomes remain Set-28-owned.
- Biology remains Set-29-owned.
- Movement remains Set-30/26-owned.
- Combat remains Document-16-owned.
- Event lifecycle remains Document-15-owned.

# Appendix C — Production Acceptance Checklist

- [ ] All 17 protected 20C IDs remain resolvable.
- [ ] Civic buildings do not create recognised political authority.
- [ ] Laws/jurisdiction/legal outcomes come from Document 13.
- [ ] Tax/fine/customs/treasury amounts and transactions come from Set 27.
- [ ] Testimony/Trust/social consequences come from Set 28.
- [ ] Guard/responder people and schedules come from Document 07.
- [ ] Health/injury/Fatigue/treatment outcomes come from Set 29.
- [ ] Patrol/pursuit/evacuation/responder movement comes from Set 30/26.
- [ ] Tactical combat/siege outcomes come from Document 16/Set 26L specialist.
- [ ] Raid/disaster/event lifecycle comes from Document 15.
- [ ] Watchtower detection requires valid observer/sensor/coverage conditions.
- [ ] Perimeter/gate graphs preserve real breaches and route state.
- [ ] Armouries use real authoritative equipment/ammunition stock.
- [ ] Refuge capacity requires valid exits/supplies/hazard profile.
- [ ] Fire/rescue capacity requires responders/tools/routes/resources.
- [ ] Port/customs/maritime rescue consume Set-26 specialist interfaces where applicable.
- [ ] Construction uses canonical Blocks/Block Inventory Projections and genuine Items.
- [ ] LOD cannot create authority, verdicts, taxes, guards, healing, combat wins or repairs.
- [ ] Multiplayer authority prevents client-created protection outcomes.
- [ ] Retired POC identities are absent from normal production dependencies.

# Appendix D — Cross-System Dependency Matrix

| 20C Area | External Owners | Primary Exchange |
|---|---|---|
| Civic governance | 13, 07, 28 | Facility capacity ↔ authority/law, official people and social/public process. |
| Justice | 13, 28, 27, 29, 15 | Hearing/evidence capacity ↔ law/jurisdiction, testimony/social, fines/payments, biology and event history. |
| Tax/customs | 13, 27, 30/26 | Office/inspection capacity ↔ levy authority, economic transaction and route/port context. |
| Diplomacy | 13, 28 | Diplomatic venue ↔ political treaty/recognition and social negotiation. |
| Guard facilities | 07, 16, 29, 30 | Positions/readiness ↔ people, combat, biology and movement. |
| Fortifications | 12, 16, 30, 15 | Physical barrier ↔ structure state, combat, accessibility and event lifecycle. |
| Armoury | Items/Inventory, 07, 16 | Secure service ↔ real equipment, guard assignment and combat use. |
| Emergency response | 15, 07, 29, 30/26 | Dispatch/refuge ↔ incident, responders, biology and physical rescue movement. |
| Maritime civic/rescue | 26J/26L/26O, 27, 13 | Shared civic facility ↔ port/naval/rescue specialist, economic and political context. |
| Projects | 19, 20, 12 | Proposal → ConstructionProject → StructureInstance/service activation. |
| Official source | 22I, 25, 18 | Blueprint source/version, semantics, lifecycle, bake/validation. |

# Appendix E — Validation and Diagnostic Code Catalogue

| **Code** | **Severity** | **Meaning / Example Correction** |
|---|---|---|
| `CIVIC_NO_AUTHORITY_POSITION` | Blocker | Add an allowed leader/council/magistrate position for the selected profile. |
| `CIVIC_PUBLIC_ROUTE_BLOCKED` | Blocker | Connect a safe public entrance to the settlement route graph. |
| `CIVIC_SECURE_ZONE_EXPOSED` | Blocker | Separate secure records, treasury or evidence from unrestricted public access. |
| `CIVIC_RECORD_STORE_MISSING` | Blocker | Add the required typed record storage marker/module. |
| `PLAN_REVIEW_STATION_MISSING` | Blocker | Add blueprint review/parcel/project service positions. |
| `JUSTICE_EVIDENCE_ROUTE_INVALID` | Blocker | Provide secure evidence intake/storage and authorised staff access. |
| `JUSTICE_HOLDING_UNSAFE` | Blocker | Correct exits, occupancy, health, guard access or remove unsupported holding. |
| `GUARD_DUTY_POSITION_UNREACHABLE` | Blocker | Connect guard route to the duty/muster/lookout position. |
| `GUARD_EQUIPMENT_SERVICE_MISSING` | Warning | Add issue/storage or confirm guards supply equipment elsewhere. |
| `COVERAGE_ORIGIN_NOT_PHYSICAL` | Blocker | Move coverage origin to a reachable visible lookout position. |
| `COVERAGE_SECTOR_OBSTRUCTED` | Warning | Accept reduced coverage or alter position/terrain/structure. |
| `SIGNAL_GRAPH_DISCONNECTED` | Warning/Blocker | Connect the signal device to the required alarm/command network. |
| `PERIMETER_OPEN_GAP` | Warning/Blocker | Close the intended sector or mark the terrain/opening as deliberate. |
| `PERIMETER_SOCKET_MISMATCH` | Blocker | Use compatible segment/corner/gate socket types and orientation. |
| `PERIMETER_REPAIR_ROUTE_MISSING` | Warning | Add safe internal maintenance access to the sector. |
| `GATE_ROAD_SOCKET_MISSING` | Blocker | Connect the gate to valid inside/outside road endpoints. |
| `GATE_EMERGENCY_EGRESS_INVALID` | Blocker | Provide safe emergency opening or alternate evacuation route. |
| `ARMOURY_STORAGE_UNTYPED` | Blocker | Add secure category-capable storage and issue/return contract. |
| `REFUGE_EXIT_CAPACITY_LOW` | Blocker | Increase safe exits or reduce declared protected occupancy. |
| `REFUGE_SUPPLY_PROFILE_INCOMPLETE` | Warning/Blocker | Add required water, provisions, medicine, sanitation or air/ward support. |
| `RESPONSE_ROUTE_BLOCKED` | Warning/Blocker | Restore an emergency route from dispatch to the protected service area. |
| `STAGE_CRITICAL_ACCESS_MISSING` | Blocker | Reorder stages or add temporary access before partial activation. |
| `STATE_DELTA_ORPHAN_ELEMENT` | Blocker | Repair dynamic/damage delta references to stable source elements. |
| `BAKE_CONTENT_HASH_MISMATCH` | Blocker | Rebuild approved runtime products from matching source and registry versions. |
| `MIGRATION_AUTHORITY_LINK_LOST` | Blocker | Resolve the missing authority/permission reference before loading the instance. |

---

**End of Document 20C - Governance, Safety, Defence, Justice and Emergency Services - Version 0.2**Additional v1.0 codes are defined in Section 30.3 and are release-blocking where marked Fatal.

# Appendix F — v1.0 Ownership Quick Reference

```text
20C:
    civic-service facility capacity
    justice-service facility capacity
    detection / warning infrastructure
    guard / training / armoury service capacity
    physical fortification / gate / perimeter function
    emergency response / refuge facility capacity

Document 13:
    government
    lawful authority
    law / jurisdiction
    citizenship / legal status
    territory / occupation
    treaties
    war / peace
    political outcome

Document 07:
    officials
    guards
    responders
    jobs
    schedules
    local task execution

Set 27:
    taxes / tariffs
    fines
    payments
    treasury
    public finance
    customs economics

Set 28:
    Trust
    willingness
    testimony / persuasion
    social memory
    relationship consequence

Set 29:
    Health
    injury
    Stamina / Fatigue
    smoke / toxin / disease
    treatment
    biological outcome

Set 30 / Set 26:
    patrol / pursuit
    evacuation
    responder travel
    route access
    maritime/aquatic movement

Document 16:
    tactical combat
    guard fighting
    siege attack outcome

Document 15:
    raid / disaster / incident lifecycle
    warning / escalation / aftermath

Document 19:
    settlement planner
    project proposal

Document 20:
    function activation
    ConstructionProject

Document 12:
    persistent StructureInstance
    physical damage / occupation / restoration
```

---

# Supersession and Preservation Notes

## Preserved from v0.2

- all 17 protected 20C identities;
- seven-needs integration;
- non-omniscient detection;
- protection chain;
- civic/public/secure semantic contracts;
- watchtower coverage;
- guard positions/patrol anchors;
- signal graphs;
- perimeter/gate projects;
- armoury/barracks;
- courts/customs/embassy;
- fire/rescue/refuge;
- Blueprint Forge validation;
- staged construction;
- partial activation;
- upgrades/conversions;
- occupation/damage/repair/restoration;
- LOD/persistence/multiplayer principles.

## Reconciled in v1.0

- government/law/jurisdiction/political outcome → Document 13;
- tax/fine/customs/public finance → Set 27;
- social willingness/testimony/Trust → Set 28;
- biology/injury/treatment/Fatigue → Set 29;
- patrol/evacuation/responder movement → Set 30/26;
- combat/siege resolution → Document 16;
- event lifecycle → Document 15;
- officials/guards/responders → Document 07;
- planner → Document 19;
- ConstructionProject/function activation → Document 20;
- StructureInstance → Document 12;
- maritime specialist services → Set 26;
- canonical Block/Item handling → FR-00-20-006;
- lifecycle → Set 25 / 20H v1.0.

## Archived

- Forest Hamlet as mandatory civic/defence context;
- fixed Goblin raid;
- fixed watchtower/guard/palisade/gate production chain;
- active POC/Legacy Alpha Provenance/Legacy Beta Provenance milestone scope;
- any implication that a civic building creates government;
- any implication that a court owns guilt/law;
- any implication that 20C owns combat, Health or movement.

---

# Production Acceptance Criteria

Document 20C v1.0 is accepted when:

- [x] all 17 protected 20C IDs are retained;
- [x] Safety remains one of exactly seven main settlement needs;
- [x] civic-service capacity is separated from Document-13 political/legal authority;
- [x] justice facility is separated from law/social/economic/biological outcomes;
- [x] tax/customs facility is separated from Set-27 economic truth;
- [x] diplomacy venue is separated from treaty/political state;
- [x] guard facilities are separated from guard-person and combat ownership;
- [x] fortification function is separated from tactical combat and route execution;
- [x] emergency facility is separated from incident, biology and movement owners;
- [x] maritime customs/rescue/coastal interfaces consume Set 26;
- [x] planner ownership is handed to Document 19;
- [x] ConstructionProject/function activation remains Document-20-owned;
- [x] StructureInstance remains Document-12-owned;
- [x] canonical Block/Item identity is enforced;
- [x] LOD cannot fabricate authority, verdicts, tax, guards, Health, movement, combat or repair;
- [x] legacy POC/Legacy Alpha Provenance/Legacy Beta Provenance labels are provenance only;
- [x] Godot/Summer implementation consumes Document 18 v1.0.

---

# Completion Statement

**Document 20C v1.0 reconciles Leyforge's civic, justice, defence and emergency infrastructure with the completed political, economic, social, biological, movement, combat and event ownership contracts.**

A Town Hall can provide **civic-service capacity** without creating a government.

A Courthouse can provide **legal-service capacity** without declaring guilt.

A Tax Office can provide **assessment/payment infrastructure** without generating revenue.

An Embassy can provide **diplomatic capacity** without creating a treaty.

A Watchtower can provide **detection opportunity** without omniscience.

A Guard Post can support **response readiness** without spawning guards.

A Wall can provide **delay and position** without winning the battle.

A Fire/Rescue Station can provide **response capacity** without teleporting responders or healing casualties.

And a Refuge can protect civilians only when its real shell, exits, supplies, routes and hazard profile work.

**Next Document Set 20 reconciliation: 20D — Storage, Roads, Transport, Logistics and Utilities.**
