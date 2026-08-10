# Fantasy Voxel Civilisation Sandbox

## 20C - Governance, Safety, Defence, Justice and Emergency Services

### Detailed Functional Registry, Blueprint Forge Contracts and Civic Protection Rules

**Version 0.2 - Unified Forge and Runtime Integration Revision**

*A controlled registry for authority, laws, permissions, records, planning, justice, diplomacy, guards, fortifications, emergency response and civilian protection. Version 0.2 preserves fair consequences and NPC autonomy while integrating official Blueprint Forge source authoring, semantic contracts, deterministic Godot runtime baking and the revised Technical POC raid scope.*

| **Field** | **Locked Direction** |
|---|---|
| Document Scope | Detailed rules and registry entries for catalogue definitions 61-62, 64-68, 70-77 and 79-80 from Document 20H v0.2. Definitions 63, 69 and 78 remain 20F complexes. |
| Needs Lock | Housing, Provisions, Health, Work, Safety, Infrastructure and Morale remain the only main settlement needs. Governance, law, crime, readiness, diplomacy and emergency response remain systems and drill-down causes. |
| Primary Focus | Authority, permissions, civic records, planning, justice, taxation/customs, diplomacy, detection, patrols, guard readiness, fortifications, access, equipment, fire/rescue and refuge. |
| Authority Rule | Buildings host civic functions but never create legitimacy, laws, ownership or faction authority by appearance alone. Those remain separate recognised records. |
| Official Authoring | Blueprint Forge owns editable official voxel sources, semantic layers, modules, material roles, construction stages, dynamic states, placement, validation and dependency data. |
| Player Creator | Document 19 exposes a restricted compatible creator. Player designs may satisfy approved definitions but cannot replace laws, registries, migrations, source trust or authoritative security rules. |
| NPC Growth | Settlements select projects using stage, population, administration load, incidents, threats, routes, terrain, diplomacy, staffing, resources, maintenance, laws and authority. |
| Simulation | Nearby officials, guards, witnesses and responders act visibly. Distant settlements process bounded civic, incident, readiness and damage summaries while preserving named people, resources, laws, judgments and history. |
| POC Direction | 20C contributes one Technical POC Core definition - Wooden Watchtower - and four Raid Extension definitions - Village Hall, Guard Post, Palisade Segment and Village Gate. |
| Engine Direction | Godot/Summer Engine runtime products are deterministic derivatives of Forge source and registry data; they are never the editable source of truth. |

> **Locked Scope Rule**
>
> Safety is one main need, not a bundle of separate defence bars. Threat pressure, detection, warning, patrols, equipment, perimeter delay, access control, justice, emergency response, refuge and recovery are operational systems beneath Safety, Infrastructure, Health and Morale. A wall, tower, throne room or armour display provides no service merely because it looks convincing.

## Revision 0.2 Summary

Version 0.2 is an integration and clarification pass rather than a redesign of governance or defence gameplay. It preserves all 17 approved 20C definitions while connecting them to Documents 20 v0.2, 20H v0.2, Blueprint Forge and the Godot/Summer Engine runtime.

Key changes are:

- Official developer building and fortification source authoring is assigned to 22I Blueprint Forge.
- Universal definitions, editable Forge source, runtime bake products, projects and persistent structure instances are explicitly separated.
- Shared civic, authority, evidence, guard, perimeter, alarm, refuge, route and access contracts replace ad hoc marker wording.
- Buildings host governance but never create recognised authority, law, legitimacy or ownership by themselves.
- Justice retains witnesses, evidence confidence, reports, proportional consequences and persistent case history.
- Defence is formalised as Detection -> Warning -> Delay -> Response -> Sustainment -> Refuge -> Recovery.
- Modular walls, gates and towers use stable element IDs, connection graphs, damage groups, repair access and sector-level runtime state.
- Guard readiness uses named NPCs, real equipment, routes, morale, training and warning time rather than a decorative guard count.
- Construction, inheritance, upgrades, occupation, damage, repair, restoration and pack resolution align with Blueprint Forge deltas.
- The former five-entry POC block is divided into one Technical POC Core source and four Raid Extension sources.
- Godot/Summer Engine services, deterministic baking, diagnostics, persistence, simulation LOD and regression fixtures are made explicit.

# Document Purpose

Document 20C defines the physical civic and protection systems that make settlement authority, laws, warnings, barriers, response and recovery visible in the voxel world. It explains where requests and decisions are handled, how permissions and records remain authoritative, how crimes and disputes are reported and resolved, how guards and fortifications change threat outcomes and how emergencies produce real response, evacuation and repair work.

The document deliberately separates function from art. 20C defines what a Village Hall, court, guard post, watchtower, gate, wall, armoury or refuge must accomplish. Blueprint Forge defines the official editable voxel source. Document 19 provides restricted player-compatible authoring. The runtime owns placed state, staff, records, equipment, incidents, damage and history.

The goal remains meaningful civic life without forcing the player to approve every patrol, tax payment, court case or rescue action. NPCs handle routine administration and protection under policies, laws and priorities. The player becomes involved when permissions, political choices, major crimes, diplomatic pressure, threats, construction, siege, conquest, disaster or recovery create decisions worth making.

# Design Sources and Dependencies

| **Source** | **20C Dependency** |
|---|---|
| 03 - Blocks Registry | Defence blocks, gates, locks, barriers, signals, hazards, access states, damage groups, repair states and material roles. |
| 04 - Items Registry | Guard gear, ammunition, keys, records, evidence, seals, banners, rescue tools, medicine, emergency supplies and contraband. |
| 05 - Crafting and Recipe Registry | Project recipes, equipment supply, emergency production, repair, staged construction and exact reservations. |
| 07 - NPC Village System | Named leaders, officials, guards, responders, jobs, schedules, authority, permissions, witnesses, memories, raids, injuries, death and simulation LOD. |
| 08 - Automation System | Alarm relays, gates, warehouse permissions, logistics, signals and later automated defence/emergency support. |
| 09 - Magic System | Wards, magical law, forbidden practices, corruption, magical detection, emergency response and warded upgrades. |
| 10 - Creatures and Monsters | Threat sources, raid factions, scouting, siege capability, sabotage, creature pressure and target selection. |
| 11 - Biomes and World Generation | Terrain, sightlines, settlement approaches, fire/flood/storm hazards, strategic sites and route exposure. |
| 12 - Structures | Persistent structure identity, dynamic state, damage, repair, occupation, restoration, world evidence and structure LOD. |
| 13 - Races, Peoples, Cultures and Factions | Governments, law profiles, diplomacy, customs, military traditions, legitimacy, conquest and faction control. |
| 15 - Quest and Event System | Incidents, hearings, diplomacy, emergencies, raids, failure, evidence, aftermath and story consequences. |
| 16 - Combat, Gear and Defence | Guard combat, walls, gates, cover, siege, equipment, casualties, shelters and persistent aftermath. |
| 17 - UI/UX System | Settlement overview, permissions, laws, incident history, readiness, coverage, alerts, diagnostics and planning overlays. |
| 19 - Settlement Growth and Player Voxel Blueprint System | Settlement projects, parcels, player proposals, player-founded settlements and restricted player-facing creator flows. |
| 20 / 20H v0.2 | Seven-needs lock, shared lifecycles, stable IDs, catalogue ownership, stage mapping, delivery scope and change control. |
| 20A / 20B / 20D / 20E / 20F / 20G | Households/health; staffing/equipment; routes/storage/utilities; magic/automation; large complexes; culture/biome/realm packs. |
| 22I - Blueprint Forge | Official editable voxel source, semantic layers, modules, stages, dynamic states, placement, validation and packaging. |
| 22K - Forge Technical Plan | Deterministic bake products, dependency invalidation, runtime registries, migration and CI validation. |

# Static Table of Contents

- 1. Locked 20C Identity
- 2. Scope Boundaries and Anti-Micromanagement Rules
- 3. Source-of-Truth and Record Separation
- 4. Seven-Needs Integration
- 5. Shared Governance, Safety and Protection Model
- 6. Shared Semantic Contracts and Network Layers
- 7. Governance, Leadership, Laws and Permissions
- 8. Records, Planning and Blueprint Administration
- 9. Justice, Crime, Witnesses, Evidence and Consequences
- 10. Diplomacy, Taxation, Customs and External Authority
- 11. Threat Detection, Patrols and Guard Readiness
- 12. Fortifications, Gates, Sieges and Access
- 13. Equipment, Training and Reserve Forces
- 14. Fire, Rescue, Disaster and Civilian Refuge
- 15. NPC Planner and Project Selection
- 16. Blueprint Forge Authoring and Official Source Validation
- 17. Restricted Player-Creator Validation
- 18. Construction Stages, Commissioning and Partial Activation
- 19. Upgrade, Inheritance, Conversion and Replacement
- 20. Damage, Occupation, Repair and Restoration
- 21. Settlement-Stage Expectations
- 22. Detailed Registry Summary
- 23. Governance and Administration Entries
- 24. Justice and External-Authority Entries
- 25. Safety and Defence Entries
- 26. Emergency-Service Entries
- 27. Technical POC and Raid Extension Scope
- 28. Simulation LOD, Persistence and Multiplayer Authority
- 29. Godot/Summer Engine Implementation Direction
- 30. Balancing, Diagnostics and Anti-Exploit Rules
- 31. Open Questions for Later Balancing
- Appendix A. 20C Functional Definition Field Template
- Appendix B. Governance, Incident and Defence Matrix
- Appendix C. POC Acceptance Checklist
- Appendix D. Cross-System Dependency Matrix
- Appendix E. Validation and Diagnostic Code Catalogue

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

| **Layer** | **Authority** | **20C Relationship** |
|---|---|---|
| Universal function | 20C and 20H | Stable ID, needs, planner class, capacity logic, stage and validation profile. |
| Official source blueprint | 22I Blueprint Forge | Voxel composition, nested modules, semantic layers, stages, states, placement and dependencies. |
| Runtime bake | 22K Forge pipeline | Collision, navigation, line-of-sight proxies, marker tables, access/perimeter graphs, damage groups, LOD and diagnostics. |
| Player-authored source | Document 19 restricted creator | Compatible source using permitted profiles; no registry, law, migration or trust authority. |
| Authority and faction | 07 and 13 | Recognised leaders, legitimacy, government, laws, permissions, diplomacy and ownership. |
| Items and combat | 04 and 16 | Equipment, ammunition, damage, cover, siege, injuries and combat outcomes. |
| Pack resolution | 20G | Culture, biome, faction, realm, occupation and history composition. |
| Construction project | 20 runtime | Site, source, resolved materials, stages, labour, reservations, blockers and contributors. |
| Structure instance | Runtime/save system | Ownership, staff, condition, source version, permissions, network links and history. |
| Domain records | Governance, justice, defence and emergency services | Requests, laws, cases, incidents, patrols, readiness, response and aftermath. |

## 3.3 Non-Duplication Rules

- The universal definition never contains a complete voxel source or a named government.
- Blueprint source never creates authority, laws, people, stock or incident outcomes.
- Runtime bake products are disposable derivatives and can be regenerated.
- Structure identity persists through source revision, occupation, repair, pack changes and migration.
- Government, law, permission and legitimacy records remain separate and are referenced by civic buildings.
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
| Morale | Fair law, visible leadership, successful defence, diplomacy and recovery can build trust. | Injustice, fear, casualties, corruption, defeat, exclusion and unresolved disputes. | Legitimacy, fear or public confidence as separate needs. |

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
| Guard readiness | Available guards x health x morale x skill x equipment x command x warning x route. | Readiness: 63% - two guards lack armour. |
| Perimeter integrity | Connected barriers, gates, terrain, breaches, fire, patrol access and maintenance. | Palisade: 82% intact - livestock gap open. |
| Justice capacity | Reports/cases compared with evidence, staff, authority, hearing and holding capacity. | Justice: 3 cases pending - magistrate unavailable. |
| Emergency coverage | Responders, tools, water/medicine, routes, alarms, refuge and hazard preparation. | Fire response: Limited - well route blocked. |

## 5.3 Operational Bands

- **Prepared** - capacity, staff, stock, routes and records comfortably support current risk and load.
- **Stable** - normal service operates with minor weaknesses.
- **Strained** - service operates but one or more factors are near capacity.
- **Critical** - an active threat, backlog, breach or shortage is causing immediate risk.
- **Collapsed** - no safe or recognised service remains for the affected capability.

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

- Governance is stored as a recognised governance profile separate from any structure.
- A civic building provides places, staff capacity, records and public access for that profile.
- Authority may be individual, council, hereditary, elected, clan-based, guild, military, magical, player-led, occupied or another approved form.
- Laws cover theft, violence, trespass, building, trade, tax, contraband, magic, weapons, curfew, labour, emergency powers and other selected domains.
- Permissions cover building/breaking, public/private/secure spaces, warehouse stock, gates, records, armouries, magic, trade and blueprint submission.
- Routine administration runs from policies and priorities. Major laws, conquest, exile, treaties, forbidden magic and stage changes create explicit decisions and records.
- A civic building can be complete but inactive when no authority is recognised or control is contested.
- Player-founded settlements use the same governance and permission records rather than a separate simplified simulation.

| **Governance Record** | **Examples** |
|---|---|
| Authority | Elder, chief, council, mayor, lord, guild council, mage conclave, governor or player ruler. |
| Law profile | Theft, assault, trespass, building, trade, tax, contraband, magic, weapons and emergency powers. |
| Permission profile | Resident, guest, ally, guild, faction, player, guard, official, prisoner and enemy. |
| Policy profile | Project priorities, defence posture, reserves, migration, patrol focus, trade and emergency readiness. |
| Legitimacy/stability | Trust, fear, tradition, election, conquest, faction support, corruption, rebellion and outcomes. |
| History | Leaders, votes, laws, coups, pardons, conquests, treaties, disasters and institutional changes. |

# 8. Records, Planning and Blueprint Administration

## 8.1 Approval Pipeline

1. A player or NPC proposes a project, policy, permission change or blueprint through an allowed civic interface.
2. The system resolves the universal definition, source blueprint, creator, pack layers and required authority.
3. Planning checks stage, parcel, terrain, routes, utilities, ownership, law, overlaps, protected sites, danger and future sockets.
4. Forge-derived validation reports exact blocking and warning diagnostics.
5. The authorised office approves, rejects, requests revision or defers the proposal.
6. Approved projects receive a stable project record, site reservation, resolved materials, stages, labour and priority.
7. Builders and logistics reserve real stock and complete visible stages.
8. Commissioning validates service activation and records author, source version, capacity, ownership and upgrade links.

## 8.2 Core Record Types

| **Record** | **Purpose** |
|---|---|
| Census/household | Residents, households, labour, emergency accountability and service demand. |
| Parcel/site | Ownership, role, bounds, terrain, access, sockets, protected status and future expansion. |
| Blueprint review | Source ID/version, author, definition, packs, material roles, diagnostics and decision. |
| Project | Resources, reservations, labour, stages, blockers, approvals, contributors and completion. |
| Structure | Runtime condition, staff, service, ownership, permissions, damage and history. |
| Road/perimeter | Connected nodes, gates, coverage, breaches, patrol access and emergency routes. |
| Civic decision | Authority, law/policy/order, date, reason, affected systems and consequences. |

## 8.3 Blueprint and Construction Office Boundary

The Blueprint and Construction Office is a gameplay-facing civic service, not the developer Forge itself. It receives and reviews permitted player/NPC proposals, exposes validation diagnostics, manages local project records and coordinates construction. Official source creation, registry editing, bake configuration, migration and package trust remain Blueprint Forge responsibilities.

# 9. Justice, Crime, Witnesses, Evidence and Consequences

## 9.1 Incident Pipeline

1. An action occurs and is evaluated against active law, ownership and permission profiles.
2. Witnesses, guards, alarms or physical evidence may detect it with confidence rather than perfect certainty.
3. A report or immediate response begins when the incident is recognised.
4. Guards respond according to urgency, authority, routes, staffing, risk and proportional-force policy.
5. Evidence, testimony, reputation, confession or investigation determine whether a case proceeds.
6. A recognised authority resolves the case under current law.
7. Consequences apply: warning, apology, restitution, fine, confiscation, service, detention, exile, pardon, escalation or no finding.
8. NPC memories, reputation, settlement history, fear, law confidence and quests update from the outcome.

## 9.2 Fairness Rules

| **Rule** | **Direction** |
|---|---|
| No omniscience | Unseen actions do not notify every guard. Evidence can be found later. |
| Confidence | Witness distance, light, disguise, fear, relation and magic affect certainty. |
| Proportional response | Minor disputes do not automatically justify lethal force. |
| Law variation | Contraband, trespass, duel, debt, magic and punishment vary by recognised profile. |
| Player agency | Players may comply, appeal, negotiate, flee, resist, bribe where supported or change authority through play. |
| Humane capacity | Where detention is simulated, food, health, exits and safety remain real; harsh regimes create consequences. |
| Distant abstraction | Cases preserve people, law, evidence, resolution and consequence without rendering each hearing. |

## 9.3 Evidence Contract

Evidence may be physical items, damage, ownership logs, witness statements, alarms, tracks, magical traces, records or confessions. Each evidence record stores source, location, time, integrity, chain of custody, confidence and links to affected people/property. Evidence can be lost, tampered with, stolen, corrupted or challenged through explicit events.

# 10. Diplomacy, Taxation, Customs and External Authority

- Diplomacy can occur anywhere suitable; an embassy increases continuity, security, records and event capacity.
- Tax, toll and tribute are policies and transactions, not free resources generated by an office.
- Customs requires a real route, gate, port, border or portal and cannot collect from unrelated trade elsewhere.
- High taxes may fund services but affect trade, evasion, corruption, morale and faction politics.
- Conquest may change banners, authority, access and tribute without deleting private ownership or structure history.
- Diplomatic and customs facilities create opportunity and risk: treaties, visitors, espionage, contraband, protest, sanctions and incidents.
- Important transfers preserve payer, receiver, goods/currency, reason, law, exemptions and ownership history.

| **External System** | **Physical Anchor** |
|---|---|
| Faction relations | Embassy, leader reception, neutral meeting site or recognised envoy route. |
| Treaty/ceasefire | Negotiation room, records, witnesses, seals and announcement point. |
| Customs/trade border | Inspection lane, manifests, guards, secure goods and route binding. |
| Tax/tribute | Ledger, treasury transfer, collection authority and policy record. |
| Occupation | Changed authority, banners, access, tribute, guard loyalty and resistance risk. |
| Rebellion/resistance | Contested civic sites, sabotage, hidden networks and public support. |

# 11. Threat Detection, Patrols and Guard Readiness

## 11.1 Readiness Factors

| **Factor** | **Direction** |
|---|---|
| Staffing | Available guards compared with required patrol, gate, tower and reserve positions. |
| Health/morale | Wounds, fatigue, fear, loyalty, losses, leadership confidence and household safety. |
| Skill/training | Combat skill, weapon use, formation, alert drills, terrain knowledge and specialist roles. |
| Equipment | Weapons, armour, shields, ammunition, light, medicine, mounts and condition. |
| Warning | Observers, patrol reports, signals, darkness, weather, surprise and approach coverage. |
| Command | Captain/leader, rally point, orders, communication and faction loyalty. |
| Routes/positions | Reachable walls, gates, towers, streets, cover, chokepoints and blocked paths. |
| Sustainment | Food, ammunition, repair stock, medical aid, relief staff and secure stores. |

## 11.2 Patrol Rules

- Patrol profiles define zones, priorities, time bands and emergency behaviour.
- NPC schedules allocate actual guards rather than spawning abstract patrol strength.
- Guard AI responds to alarms, reports, visible threats, protected targets, commander orders and civilian danger.
- Guards may retreat, surrender, rally, escort, call for help or protect civilians according to morale, law, culture and threat.
- Unstaffed/inaccessible posts and towers provide only their physical collision, cover or barrier properties.
- Distant raids resolve from the same readiness inputs and preserve named casualties, stock loss, damage and history.

## 11.3 Detection Fairness

Coverage sectors are authored and baked from watch positions, but runtime visibility also depends on terrain, foliage, weather, light, obstruction, facing and personnel. The system may use cached visibility sectors for performance, but it must invalidate or adjust them when terrain, source state or major obstruction changes.

# 12. Fortifications, Gates, Sieges and Access

## 12.1 Defence Contributions

| **Contribution** | **Examples** | **Does Not Replace** |
|---|---|---|
| Detection | Towers, scouts, patrols, beacons and alarms. | Guards, equipment and response routes. |
| Delay | Palisades, walls, ditches, doors and terrain. | Damage immunity or unlimited time. |
| Channel | Gates, streets, bridges and controlled openings. | Safe evacuation and alternative routes. |
| Position | Parapets, towers, cover and rally points. | Skill, ammunition or command. |
| Access control | Locks, permissions, inspection, curfew and guards. | Perfect detection of disguised/hidden actors. |
| Sustainment | Armouries, stores, wells, repair and healer links. | Provisions, Health and Infrastructure systems. |
| Refuge | Bunkers, keeps and protected halls. | Permanent housing or active defence. |

## 12.2 Perimeter Graph

A perimeter is a connected graph of segments, terrain closures, gates, towers, wall walks, patrol links and breach groups. It can be open, partial, layered or culture-specific. The runtime records which approach sectors are delayed, controlled or exposed rather than granting one global wall bonus.

## 12.3 Gate and Access Rules

- Gates have authoritative mechanism, lock, permission, queue and damage states.
- Public, resident, official, guard, freight, emergency, prisoner and hostile access may differ.
- A closed gate cannot silently block emergency evacuation without a policy or alternate route.
- Gates and walls must expose safe repair access and cannot receive full service if unreachable.
- Siege damage targets actual groups and can create breaches, fire, collapse, jammed mechanisms and blocked roads.
- Terrain exploitation is valid, but inaccessible cliff gaps, water routes, tunnels and air approaches remain real threats where relevant.

## 12.4 Anti-Spam Rules

Wall and tower spam faces material/labour cost, maintenance, route burden, staffing, sightline overlap, diminishing coverage, terrain and repair requirements. A dense ring of unstaffed towers does not produce unlimited warning or ranged power.

# 13. Equipment, Training and Reserve Forces

- Guard readiness uses real suitable equipment from personal, post, barracks or armoury inventories.
- Armouries store and issue stock but do not create weapons or trained guards.
- Barracks and training yards provide duty accommodation where defined, training, muster and reserve coordination.
- Training consumes instructor time, learner time, equipment and safe space and produces named skill progression.
- Culture and faction profiles may prefer militia, professional guards, clan levies, mounted patrols, magical warders or other branches.
- Reserve mobilisation affects other Work roles because named NPCs leave ordinary jobs temporarily.
- Equipment suitability, condition and ammunition matter; decorative racks do not count as stock.
- Emergency requisition may draw from private or trade stock only under recognised law and with persistent consequences.

| **Readiness Source** | **Contribution** |
|---|---|
| Guard Post | Local staffing, reports, patrol launch and first response. |
| Watchtower | Detection, signal and defensive position. |
| Barracks/Training Yard | Training, muster, reserve coordination and duty support. |
| Armoury | Secure suitable equipment, ammunition and issue records. |
| Civic Command | Orders, posture, emergency declaration and strategic priority. |
| Roads/Gates/Walls | Reachability, delay, controlled access and tactical positions. |

# 14. Fire, Rescue, Disaster and Civilian Refuge

## 14.1 Incident Types

- Fire and smoke.
- Collapse and entrapment.
- Flood, storm, drought and extreme weather.
- Raid, siege and civilian evacuation.
- Mine/industrial accident.
- Magical, corruption or portal incident.
- Disease/quarantine support.
- Missing person, animal rescue or hazardous recovery where enabled.

## 14.2 Response Pipeline

1. Detect or report the incident.
2. Classify hazard, location, people/property at risk and confidence.
3. Assign responders, tools, route, command and support.
4. Evacuate, isolate, suppress, rescue, treat or contain.
5. Track resource use, injuries, deaths, damage and unresolved hazards.
6. Release areas when safe and create repair, relief, investigation or memorial projects.

## 14.3 Refuge Rules

- Refuge is temporary protected capacity, not permanent housing.
- Occupancy can be household-aware so families and dependants remain traceable.
- Supplies, water, sanitation, air/ward protection and exits determine effective capacity.
- Overcrowding, contamination, blocked exits and missing staff reduce protection.
- Shelters support several hazard profiles but are never universally immune.
- After the event, residents return, relocate or enter recovery/housing projects rather than remaining abstract shelter population.

# 15. NPC Planner and Project Selection

## 15.1 Planner Pipeline

1. Measure governance load, unresolved requests/cases, threat pressure, warning gaps, readiness, perimeter gaps, incidents, emergency coverage and repair backlog.
2. Filter definitions by stage, authority, law, terrain, routes, population, threats, resources, staff, equipment, maintenance and pack compatibility.
3. Score benefit against cost, staffing feasibility, travel, logistics, coverage overlap, risk, future expansion and opportunity cost.
4. Select a compatible official, settlement or approved player source.
5. Reserve site/network path and construction stock.
6. Build through visible stages and commission the service.
7. Re-evaluate laws, patrols, access, readiness, projects and emergency posture.

## 15.2 Project Classes

| **Class** | **Examples** | **Selection Direction** |
|---|---|---|
| Required | Village Hall, Guard Post, Watchtower, Palisade and Gate in the protected raid slice. | Fill stage/threat-critical gaps with approved equivalents. |
| Optional | Blueprint Office, Barracks, Armoury, Records Office and Fire Station. | Score workload, density, risk, specialists and cost. |
| Conditional | Court, Customs, Embassy and Refuge Bunker. | Require law, route, diplomacy, hazard or story conditions. |
| Upgrade | Town Hall, stone wall/gatehouse, reinforced tower or expanded post. | Prefer repair or improvement where continuity and cost support it. |
| Player proposal | Approved hall, tower, gate, wall, office or shelter source. | Must pass function, law, site, pack, performance and security validation. |

## 15.3 Planner Anti-Spam Rules

- Do not build walls when the real weakness is staffing, equipment, warning, routes or supplies.
- Do not create formal courts without enough cases, authority or law complexity.
- Do not add offices when workload can be solved by staffing, records, policy or conversion.
- Prefer repair, reinforcement, better patrol links, alarms, training or supply when they solve the actual weakness.
- Account for maintenance, public access, civilian disruption, emergency routes and cultural acceptance.

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
```

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

Commissioning validates source version, placement, structural safety, semantic contracts, staff/authority, equipment/records/supplies, routes, permissions, graph connections, pack resolution, diagnostics, runtime bake version and save registration.

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

Occupation may change banners, authority, laws, access, taxes, staff and project priorities while preserving origin source, builders, previous owners and damage history. Restoration can remove occupation layers, preserve evidence, rebuild faithfully, convert adaptively or memorialise ruins. A structure can be physically repaired while political legitimacy remains contested.

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

| **No.** | **Stable ID** | **Definition** | **Earliest Stage** | **Primary Need** | **Planner Class** | **Delivery Scope** |
|---:|---|---|---|---|---|---|
| 61 | `building.governance.village_hall` | Village Hall | Village | Infrastructure | Required | Technical POC - Raid |
| 62 | `building.governance.town_hall` | Town Hall or Council House | Town | Infrastructure | Upgrade | Beta |
| 64 | `building.governance.records_planning_office` | Records and Planning Office | Town | Infrastructure | Optional | Beta |
| 65 | `building.justice.courthouse_magistrate` | Courthouse or Magistrate House | Town | Safety | Conditional | Beta |
| 66 | `building.governance.tax_customs_office` | Tax or Customs Office | Town | Infrastructure | Conditional | Beta |
| 67 | `building.governance.embassy_diplomatic_hall` | Embassy or Diplomatic Hall | City | Morale | Conditional | Beta |
| 68 | `building.governance.leader_residence` | Governor or Leader Residence | City | Morale | Optional | Beta |
| 70 | `building.governance.blueprint_construction_office` | Blueprint and Construction Office | Village | Infrastructure | Optional | Alpha |
| 71 | `building.safety.guard_post` | Guard Post | Village | Safety | Required | Technical POC - Raid |
| 72 | `building.safety.wooden_watchtower` | Wooden Watchtower | Village | Safety | Required | Technical POC - Core |
| 73 | `project.defence.palisade_segment` | Palisade Segment | Village | Safety | Required | Technical POC - Raid |
| 74 | `building.safety.village_gate` | Village Gate | Village | Safety | Required | Technical POC - Raid |
| 75 | `building.safety.barracks_training_yard` | Barracks and Training Yard | Fortified Village | Safety | Optional | Alpha |
| 76 | `project.defence.stone_wall_gatehouse` | Stone Wall and Gatehouse System | Town | Safety | Upgrade | Beta |
| 77 | `building.safety.armoury` | Armoury | Fortified Village | Safety | Optional | Alpha |
| 79 | `building.emergency.fire_rescue_station` | Fire and Rescue Station | Town | Safety | Optional | Beta |
| 80 | `building.emergency.refuge_bunker` | Emergency Shelter or Refuge Bunker | Town | Safety | Conditional | Beta |

Catalogue numbers 63, 69 and 78 are intentionally absent. City Hall or Civic Complex, Palace or High Council Complex and Fort or Keep are owned by 20F because they are large multi-building or megaproject-scale complexes. Their lower-level civic and protection dependencies remain defined here.

# 23. Governance and Administration Entries

### 61. Village Hall

`building.governance.village_hall`

| **Catalogue role**                      | Governance / Civic \| Village \| Medium \| Required \| Technical POC - Raid                                                                                                                                                                    |
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

| **Catalogue role**                      | Governance / Administration \| Town \| Large \| Upgrade \| Beta                                                                                                                                                              |
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

| **Catalogue role**                      | Governance / Planning \| Town \| Medium \| Optional \| Beta                                                                                                                                                                                     |
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

| **Catalogue role**                      | Governance / Residential Civic \| City \| Large \| Optional \| Beta                                                                                                                                  |
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

| **Catalogue role**                      | Governance / Construction \| Village \| Medium \| Optional \| Alpha                                                                                                                                           |
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
| **Pack and style resolution**         | Architect guild lodge, builder moot, rune-model chamber, holographic map room, clay model court, dwarven survey vault or nomad route-planning tent.                                                           |

# 24. Justice and External-Authority Entries

### 65. Courthouse or Magistrate House

`building.justice.courthouse_magistrate`

| **Catalogue role**                      | Justice / Civic \| Town \| Medium \| Conditional \| Beta                                                                                                                                               |
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

| **Catalogue role**                      | Governance / Trade Control \| Town \| Small-Medium \| Conditional \| Beta                                                                                                                  |
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

| **Catalogue role**                      | Governance / Diplomacy \| City \| Large \| Conditional \| Beta                                                                                                                                              |
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
| **Pack and style resolution**         | Shared neutral hall, foreign enclave, floating embassy, portal embassy, clan guesthouse, merchant legation or warded inter-realm mission.                                                                   |

# 25. Safety and Defence Entries

### 71. Guard Post

`building.safety.guard_post`

| **Catalogue role**                      | Safety / Patrol \| Village \| Small \| Required \| Technical POC - Raid                                                                                                                                                 |
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

| **Catalogue role**                      | Safety / Detection \| Village \| Medium \| Required \| Technical POC - Core                                                                                                                                                           |
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

| **Catalogue role**                      | Defence / Perimeter Project \| Village \| Network \| Required \| Technical POC - Raid                                                                                                                                                                    |
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

| **Catalogue role**                      | Safety / Access Control \| Village \| Medium \| Required \| Technical POC - Raid                                                                                                         |
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

| **Catalogue role**                      | Safety / Military \| Fortified Village \| Large \| Optional \| Alpha                                                                                                                       |
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

| **Catalogue role**                      | Defence / Perimeter Network \| Town \| Network \| Upgrade \| Beta                                                                                                                                                                |
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

| **Catalogue role**                      | Safety / Equipment \| Fortified Village \| Medium \| Optional \| Alpha                                                                                                                                       |
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
| **Pack and style resolution**         | Shield hall, weapon vault, ranger cache, dwarven arsenal, nomad wagon armoury, rune-locked store or living-wood bow house.                                                                                   |

# 26. Emergency-Service Entries

### 79. Fire and Rescue Station

`building.emergency.fire_rescue_station`

| **Catalogue role**                      | Emergency / Response \| Town \| Medium \| Optional \| Beta                                                                                                                                             |
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

| **Catalogue role**                      | Emergency / Civilian Protection \| Town \| Large \| Conditional \| Beta                                                                                                                                                     |
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
| **Pack and style resolution**         | Cellar refuge, hill fort shelter, cavern sanctuary, raised flood refuge, living-tree cocoon, rune ward vault, mobile evacuation caravan or underground district bunker.                                                     |


# 27. Technical POC and Raid Extension Scope

## 27.1 Scope Split

| **Scope** | **20C Definitions** | **Purpose** |
|---|---|---|
| Technical POC - Core | 72 Wooden Watchtower | Prove vertical voxel source, safe access, coverage sectors, signal, staged construction, damage and deterministic runtime bake before the raid loop is complete. |
| Technical POC - Raid | 61 Village Hall; 71 Guard Post; 73 Palisade Segment; 74 Village Gate | Add civic requests/permissions, named guard response, modular perimeter and controlled access so infrastructure changes raid outcomes. |
| Alpha | 70 Blueprint and Construction Office; 75 Barracks and Training Yard; 77 Armoury | Expand project administration, training, reserve and equipment continuity. |
| Beta | 62, 64-68, 76, 79-80 | Add town/city governance, formal justice, customs/diplomacy, stone fortification and mature emergency services. |

## 27.2 Technical POC - Core Acceptance

- Wooden Watchtower source is authored entirely in Blueprint Forge.
- Safe access, lookout position, coverage sectors and signal marker validate.
- Construction stages consume resolved real materials and produce visible progress.
- Terrain and foliage can obstruct coverage and trigger cache invalidation.
- An assigned named guard changes warning capability; an empty tower does not.
- Damage can disable access, signal or coverage independently and repairs restore them.
- Runtime bake is deterministic and survives save/load, source rebake and migration tests.

## 27.3 Raid Extension Acceptance

- Village Hall exposes requests, permissions, authority and project decisions through authoritative records.
- Guard Post assigns a named guard with actual suitable equipment and patrol links.
- Palisade modules connect through stable sockets, create covered sectors, take damage, form breaches and accept repair work.
- Village Gate opens/closes authoritatively, preserves route/access rules and connects to perimeter, guards and alarms.
- Raid mobilisation, warning time, approach path, casualties, theft and structure damage differ between incomplete, complete, damaged and unstaffed defence states.
- Raid aftermath persists injuries, deaths where enabled, stock loss, breaches, repair projects, morale, reputation, dialogue and settlement history.

## 27.4 Golden Regression Fixtures

1. Empty watchtower versus staffed watchtower.
2. Obstructed sightline versus clear sightline.
3. Open palisade gap versus connected perimeter.
4. Gate open, closed, jammed and breached.
5. Guard equipped, unequipped, injured and absent.
6. Village Hall available, overloaded and authority-contested.
7. Save/load during alert, combat, breach and repair.
8. Distant raid resolution promoted into near simulation without changed totals.

# 28. Simulation LOD, Persistence and Multiplayer Authority

| **Range** | **Simulation Direction** |
|---|---|
| Near player | Visible officials, guards, witnesses, gates, signals, construction, combat, firefighting, evacuation and repairs. Detailed senses/pathfinding are budgeted. |
| Loaded settlement | Patrol zones, queues, cases, readiness, incidents, wall/gate state and emergency routes update on bounded intervals or events. |
| Distant settlement | Threat and incident stages resolve from staff, gear, warning, perimeter, supplies, law and risk summaries; named people, judgments, stock and damage persist. |
| Inactive realm | Multi-hour/daily summaries preserve authority, people, resources, cases, readiness, structure sectors and history, with explicit promotion when relevant. |

## 28.1 Persistence Lock

Persistent structure records store source ID/version, stable element IDs, pack resolution, ownership, permissions, authority links, staff, equipment/stock references, graph connections, condition, damage groups, projects, incidents and history. Runtime bake data may be regenerated, but authoritative state cannot be inferred only from visuals.

## 28.2 Multiplayer Authority

- The server or host is authoritative for law, permissions, access, case state, guard assignment, equipment transactions, gate state, damage, refuge occupancy and incident outcomes.
- Clients may predict doors, alarms and animation, but authoritative correction must be safe and visible.
- Blueprint submissions are validated against server-approved definitions, packs, budgets and versions.
- Multiplayer contribution, damage, confiscation, fines, evidence and project ledgers retain actor attribution.
- Content hashes prevent incompatible official source or bake products from silently joining authoritative sessions.

# 29. Godot/Summer Engine Implementation Direction

## 29.1 Suggested Definition Resources

- `CivicFacilityDefinition`
- `JusticeFacilityDefinition`
- `GuardFacilityDefinition`
- `FortificationProjectDefinition`
- `EmergencyFacilityDefinition`
- `AuthorityRequirementProfile`
- `PermissionProfile`
- `CoverageProfile`
- `PerimeterProfile`
- `IncidentResponseProfile`
- `RefugeProfile`

These extend the common Set 20 definition contract rather than forming isolated frameworks.

## 29.2 Suggested Runtime Services

| **Service** | **Responsibility** |
|---|---|
| Governance Service | Authority, requests, policies, permissions, civic load and decision history. |
| Record/Planning Service | Census, parcels, projects, blueprint reviews, archives and recovery. |
| Justice/Incident Service | Reports, witnesses, evidence, cases, response, judgment and consequences. |
| Threat/Readiness Service | Threat pressure, guard availability, equipment, command and readiness summaries. |
| Coverage Service | Sightline sectors, alarms, signals, patrol reach and invalidation. |
| Perimeter/Access Service | Wall/gate graph, permissions, breach sectors, route control and repair access. |
| Emergency Service | Dispatch, responder tasks, hazard control, evacuation, refuge and aftermath. |
| Structure Runtime Service | Source/bake resolution, stages, damage, occupation, repair, persistence and LOD. |

## 29.3 Deterministic Bake Products

Blueprint Forge should bake:

- Voxel render and collision chunks.
- Navigation, vertical access and emergency-route links.
- Semantic marker tables and typed zone volumes.
- Coverage origins, sector samples and obstruction-query metadata.
- Perimeter connections, breach groups, gate mechanisms and repair access.
- Patrol, signal, public/private/secure and evacuation graphs.
- Construction-stage products and dynamic/damage deltas.
- LOD proxies, map symbols, thumbnails and diagnostic manifests.

Bake keys include source version, definition version, resolved packs/material roles, modules, stage/state graph, engine schema and relevant project settings. Identical inputs must produce identical runtime products.

## 29.4 Summer Engine AI Controls

AI assistance may propose layouts, markers, patrol sectors, stages, diagnostics and test cases, but every generated source must pass deterministic validators and human review. AI cannot silently create laws, authority, hidden coverage, invulnerable geometry, unsupported scripts or migration aliases.

# 30. Balancing, Diagnostics and Anti-Exploit Rules

## 30.1 Balance Direction

- Warning time should be valuable but not make all raids trivial.
- Guards need equipment, health, morale, training, routes and command; raw headcount is insufficient.
- Walls delay and channel rather than multiplying defence without limit.
- Formal justice should appear when population, law and incident complexity justify it.
- Emergency services matter most in dense, hazardous or high-difficulty settlements and can remain simplified elsewhere.
- Taxes and customs must move real value and show effects on trade, morale and politics.
- Refuge capacity reduces harm but creates supply, sanitation and recovery demands.
- Player-built designs can be efficient but cannot hide markers, eliminate access or gain capacity from inaccessible spaces.

## 30.2 Anti-Exploit Rules

- No coverage marker may sit outside reachable structure geometry.
- Overlapping towers use diminishing detection benefit and still require separate staff.
- Perimeter closure checks include terrain, water, caves, gates and supported movement types.
- A gate cannot alternate state faster than mechanism/network rules allow to trap or duplicate entities.
- Armoury displays do not count as stock; issued equipment cannot remain simultaneously in storage.
- Refuge occupants cannot also count as present in ordinary homes/workplaces during evacuation.
- Civic buildings cannot grant authority or project approval without a recognised role and permission.
- Cases and taxes cannot generate currency/items without recorded transfers.
- Distant simulation cannot invent, duplicate or silently delete people, stock, evidence or damage.

## 30.3 Diagnostic Principles

Diagnostics identify the blocking contract, affected marker/zone/socket, structure element, severity and recommended correction. Warnings distinguish design-time, commissioning, runtime, incident and migration issues.

# 31. Open Questions for Later Balancing

- Final guard-to-population and patrol-coverage bands by difficulty, stage and culture.
- Warning-time, sightline, signal delay and tower-overlap values after voxel terrain tests.
- How often ordinary crime should occur and which incidents become quests/events.
- Default force, detention, fine, restitution and exile policies without assuming one modern legal model.
- Tax, toll and customs values after trade/economy simulation is playable.
- Wall, gate, fire and siege damage values after combat and destruction testing.
- Refuge occupancy, supply duration and hazard-specific protection bands.
- Whether prison, military hospital, police/watch house or national court later justify new definitions after cap review.
- How elections, coups, rebellion, occupation and player rulership expand beyond the shared governance foundation.
- Which automated alarms, turrets, wards and magical emergency systems belong to 20E versus 20G packs.
- How air, underground, aquatic and dimensional threats alter perimeter and coverage without making ordinary defences obsolete.
- Which evidence types and investigation depth create meaningful play without excessive case simulation.

# Appendix A. 20C Functional Definition Field Template

| **Field Group** | **Required Fields** |
|---|---|
| Identity | catalogue_no, stable_id, display/localisation keys, family, owner_document, schema/version and delivery status. |
| Progression | earliest_stage, project_class, prerequisites, unlocks, upgrade/inheritance links, branch and pack gates. |
| Needs | primary_need, secondary_needs, civic/safety contribution tags and drill-down causes. |
| Authority | role requirements, governance/law/permission links, legitimacy/faction references and public/private/secure profiles. |
| Incident/justice | report types, witness/evidence hooks, case capacity, response authority, holding profile, outputs and history. |
| Defence | coverage, signal, guard positions, patrol/perimeter sockets, breach states, gate/access, sustainment and refuge. |
| Operation | staff min/target/max, equipment, inputs, outputs/services, queues, routes, blockers and commissioning. |
| Forge source | bounds, modules, markers, zones, sockets, material roles, stages, states, damage groups, placement and dependencies. |
| Runtime bake | collision/nav, coverage/perimeter/access graphs, stable element IDs, LOD, diagnostics and content hash. |
| Construction | stage profile, resource compilation, labour, partial activation, damage, occupation, repair and conversion. |
| Simulation | near events, distant summaries, persistence, multiplayer authority and promotion/demotion rules. |
| Presentation | icon, map symbol, warnings, inspection text, overlays, codex and planning notes. |

# Appendix B. Governance, Incident and Defence Matrix

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
| Civilian refuge | Shelter/Bunker | Protected capacity, exits, supplies and staff | Evacuation, temporary safety and recovery. |

# Appendix C. POC Acceptance Checklist

- [ ] Wooden Watchtower official source is created in Blueprint Forge and passes structural, semantic, coverage, stage and state validation.
- [ ] A named assigned guard and actual signal equipment are required for full warning service.
- [ ] Terrain, foliage, weather and damage can alter coverage and rebuild cached sectors.
- [ ] Village Hall exposes authoritative requests, permissions, decisions and project links.
- [ ] Guard Post assigns real guards, equipment and patrol zones.
- [ ] Palisade modules connect, form sectors, take damage, create breaches and accept repair.
- [ ] Village Gate has authoritative road, perimeter, permission, mechanism and damage state.
- [ ] Incomplete, complete, damaged, unstaffed and breached defences produce different raid outcomes.
- [ ] No service is credited from inaccessible decoration or hidden invalid markers.
- [ ] Raid aftermath preserves casualties, stock loss, damage, repairs, morale, dialogue, reputation and history.
- [ ] Save/load and distant simulation preserve exact guard identity, equipment, structure sectors, projects and outcome.
- [ ] Deterministic rebake and migration do not change authoritative runtime totals or stable references.

# Appendix D. Cross-System Dependency Matrix

| **20C Area** | **Primary Dependencies** | **Required Contract** |
|---|---|---|
| Governance | 07 NPC, 13 Factions, 15 Events, 17 UI | Stable authority, laws, permissions, decisions, records and reasons. |
| Planning | 19 player creator, 20 runtime, 22I/22K Forge | Source review, diagnostics, parcel, resources, stages, project and migration. |
| Justice | 07 NPC, 13 Factions, 15 Events, 16 Combat | Witness/evidence, law, response, proportional consequence and history. |
| Guard readiness | 04 Items, 07 NPC, 10 Creatures, 16 Combat | Named guards, real equipment, threats, orders, casualties and aftermath. |
| Fortifications | 03 Blocks, 11 Worldgen, 12 Structures, 16 Combat | Connected modules, terrain fit, collision, damage, access, repair and LOD. |
| Customs/diplomacy | 07 NPC, 13 Factions, 15 Events, 20B/20D trade | Routes, manifests, envoys, treaties, ownership and consequences. |
| Fire/rescue | 03 Blocks, 07 NPC, 11 Worldgen, 16 Combat | Hazard, alarms, tools, routes, water/medicine, injuries, damage and recovery. |
| Refuge | 20A Health/Housing, 20D Utilities, 20E Magic | Protected temporary capacity, supplies, exits, sanitation and hazard profile. |
| Packs/occupation | 13 Factions, 20G Packs | Origin, culture, faction, authority, law, banners, occupation and restoration. |

# Appendix E. Validation and Diagnostic Code Catalogue

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

**End of Document 20C - Governance, Safety, Defence, Justice and Emergency Services - Version 0.2**
