**Fantasy Voxel Civilisation Sandbox**

**20C - Governance, Safety, Defence, Justice and Emergency Services**

**Version 0.1 - Detailed Building Family and Civic Protection Registry Draft**

*A controlled registry for settlement authority, laws, permissions, planning, diplomacy, guards, fortifications, emergency response and civilian protection, preserving meaningful consequences without turning the player into a full-time mayor or tactical commander.*

| **Field**                  | **Locked Direction**                                                                                                                                                                                                                     |
|----------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Document Scope             | Detailed rules and registry entries for catalogue definitions 61-62, 64-68, 70-77 and 79-80 from Document 20H, plus cross-document civic, law, defence and emergency dependencies.                                                       |
| Needs Lock                 | Housing, Provisions, Health, Work, Safety, Infrastructure and Morale remain the only main settlement needs. Governance, law, crime, readiness, diplomacy and emergency response are systems and sub-calculations, not extra need meters. |
| Primary Focus              | Settlement authority, permissions, records, planning, justice, taxation/customs, diplomacy, patrols, detection, fortifications, guard equipment, fire/rescue and civilian refuge.                                                        |
| Authority Rule             | Buildings host civic functions but do not create legitimacy, laws or ownership by themselves. Governance profiles, recognised roles, faction state, reputation and permissions remain separate records.                                  |
| Player Blueprint Direction | Eligible player-made blueprints may replace developer layouts after public/secure circulation, access, coverage, sightline, perimeter, evacuation, holding and hazard rules validate.                                                    |
| NPC Growth Direction       | Settlements select projects using stage, population, administration load, incidents, threat pressure, routes, diplomacy, terrain, staffing, resources, maintenance and player or faction permissions.                                    |
| Simulation Direction       | Nearby guards, officials and responders act visibly; distant settlements process bounded civic, incident, readiness and damage summaries while preserving people, resources, laws, judgments and history.                                |
| POC Direction              | Prove Village Hall requests and permissions plus Guard Post, Wooden Watchtower, Palisade and Village Gate in the Forest Hamlet raid loop, including damage, repair and changed outcomes.                                                 |
| Balance Direction          | Show readable causes such as warning time, guard readiness, perimeter integrity and response coverage. Avoid daily patrol micromanagement, omniscient crime detection and wall-spam as the dominant strategy.                            |

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr class="header">
<th><p><strong>Locked Scope Rule</strong></p>
<p>Safety is one main need, not a bundle of separate defence bars. Threat pressure, detection, patrols, equipment, fortifications, justice, emergency response, refuge and recovery are causes and operational systems beneath Safety, Infrastructure, Health and Morale.</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

# Document Purpose

Document 20C turns the governance and protection portion of the universal building catalogue into implementable family rules. It defines where settlement decisions happen, how laws and permissions connect to people and records, how crime and disputes are processed, how guards and fortifications provide readable protection, and how emergencies create response and refuge projects.

The document deliberately avoids making the player approve every patrol, court case, tax payment or fire bucket. NPCs handle routine civic life under policies and priorities. The player becomes involved when shortages, laws, threats, political choices, blueprint permissions, major incidents, war, conquest or emergencies create meaningful decisions.

# Design Sources and Dependencies

| **Source**                                               | **20C Dependency**                                                                                                                                |
|----------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------|
| 03 - Blocks Registry                                     | Defence blocks, gates, doors, damage states, repair states, ownership, access, lighting, hazards and blueprint material families.                 |
| 04 - Items Registry                                      | Guard gear, ammunition, keys, records, evidence, tools, emergency supplies, banners, seals, medicine and owned or contraband goods.               |
| 05 - Crafting and Recipe Registry                        | Project recipes, repair, equipment supply, staged construction, exact resource reservation and emergency production.                              |
| 07 - NPC Village System                                  | Named leaders and guards, jobs, schedules, permissions, reputation, witnesses, raids, damage, memories, death and simulation LOD.                 |
| 08 - Automation System                                   | Warehouse permissions, alarms, logistics, gate mechanisms, later defence automation and emergency network support.                                |
| 09 - Magic System                                        | Wards, magical laws, corruption risk, magical emergency response, forbidden magic consequences and later warded upgrades.                         |
| 10 - Creatures and Monsters                              | Raid factions, threat sources, sabotage, camps, creature pressure, morale and settlement target selection.                                        |
| 12 - Structures                                          | Blueprint volumes, markers, ownership, dynamic states, fortifications, damage, repair, restoration and structure LOD.                             |
| 13 - Races, Peoples, Cultures and Factions               | Governments, laws, diplomacy, customs, military traditions, conquest, faction control and culture-specific civic forms.                           |
| 15 - Quest and Event System                              | Incidents, hearings, diplomatic events, emergency events, raid stages, failure, persistent evidence and story consequences.                       |
| 16 - Combat, Gear and Defence                            | Guard combat, readiness, walls, gates, cover, siege, damage, shelters, raid outcomes and persistent aftermath.                                    |
| 17 - UI/UX System                                        | Village overview, Safety causes, permissions, laws, incident history, defence coverage and readable warnings.                                     |
| 19 - Settlement Growth and Player Voxel Blueprint System | Shared editors, validation, material tokens, parcels, construction stages, player submissions, project records and planner scoring.               |
| 20 / 20H                                                 | Seven-needs lock, stable IDs, catalogue ownership, project classes, stage mapping, POC roster and anti-bloat rules.                               |
| 20A / 20B / 20D / 20E / 20F / 20G                        | Households and health; staffing and equipment production; roads/storage/utilities; magic/automation; large complexes; culture and realm variants. |

# Static Table of Contents

- 1\. Locked 20C Identity

- 2\. Scope Boundaries and Anti-Micromanagement Rules

- 3\. Seven-Needs Integration

- 4\. Shared Governance and Safety Model

- 5\. Runtime, Service and Incident States

- 6\. Governance, Leadership, Laws and Permissions

- 7\. Records, Planning and Blueprint Administration

- 8\. Justice, Crime, Witnesses and Consequences

- 9\. Diplomacy, Taxation, Customs and External Authority

- 10\. Threat Detection, Patrols and Guard Readiness

- 11\. Fortifications, Gates, Sieges and Access

- 12\. Equipment, Training and Reserve Forces

- 13\. Fire, Rescue, Disaster and Civilian Refuge

- 14\. NPC Planner and Project Selection

- 15\. Player Blueprint Validation

- 16\. Construction, Damage, Repair, Upgrade and Conversion

- 17\. Settlement-Stage Expectations

- 18\. Detailed Registry Summary

- 19\. Governance and Administration Entries

- 20\. Justice and External-Authority Entries

- 21\. Safety and Defence Entries

- 22\. Emergency-Service Entries

- 23\. POC Implementation Scope

- 24\. Balancing and Simulation LOD

- 25\. Open Questions for Later Balancing

- Appendix A. 20C Data Field Template

- Appendix B. Governance, Incident and Defence Matrix

- Appendix C. POC Acceptance Checklist

- Appendix D. Cross-System Dependency Matrix

# 1. Locked 20C Identity

Document 20C is the civic authority, protection and recovery layer of the building registry. Its facilities make decisions, laws, permissions, warnings, patrols, barriers, equipment and emergency response visible in the voxel world. They do not replace NPC identity, faction politics, combat or player freedom; they give those systems physical places, capacities, routes and consequences.

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr class="header">
<th><p><strong>Locked Rule</strong></p>
<p>A 20C structure must expose a measurable civic, justice, defence, access, response or refuge function. A throne, tower, wall, gate, armour display or bunker-shaped room does not provide the service unless the required people, markers, routes, resources, permissions and operational states are valid.</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

| **Identity Layer**  | **Design Meaning**                                                                         | **Player-Facing Result**                                                                                                                       |
|---------------------|--------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------|
| Visible Authority   | Leaders, councils, clerks, laws, records and permissions occupy real civic sites.          | Players know where to request approval, challenge a decision, submit a blueprint or negotiate settlement policy.                               |
| Fair Consequence    | Crime and disputes use witnesses, evidence, reports, law profiles and remembered outcomes. | The player is not punished by omniscient guards; actions create readable social and legal responses.                                           |
| Layered Protection  | Detection, delay, response, equipment, refuge and recovery are separate contributions.     | A watchtower, wall, guard post and shelter each matter for a different reason.                                                                 |
| Physical Defence    | Walls, gates, routes, stores and warning points exist as damageable voxel structures.      | Raids create breaches, fires, injuries, stolen goods and repair projects rather than an abstract combat result.                                |
| Civic Freedom       | Government, law and military style come from culture, faction and player choices.          | Settlements can use councils, chiefs, elected leaders, merchant courts, clan law or magical authority without duplicating universal functions. |
| Scalable Simulation | Nearby incidents play out visibly; distant settlements use preserved summaries.            | The world remains alive without simulating every guard footstep or court hearing at all times.                                                 |

# 2. Scope Boundaries and Anti-Micromanagement Rules

- The seven needs remain the only top-level settlement needs. Governance, crime, law, diplomacy, guard readiness and emergency coverage are systems, causes and statistics.

- The player may set laws, access policies, defence priorities, patrol zones, tax direction, emergency policy or blueprint permissions where authority allows, but routine shifts and cases remain NPC-managed.

- A governance building hosts authority; it does not automatically create legitimacy, loyalty or a specific political system.

- Guards are not omniscient. Crimes require witnesses, evidence, alarms, reports or later investigation unless the action occurs inside direct protected observation.

- Fortifications delay, channel, warn and protect. They do not make a settlement invulnerable or erase the need for guards, supplies, maintenance and refuge.

- Patrols use zone and priority profiles rather than manual waypoint scheduling for every guard.

- Justice should create understandable outcomes such as warning, restitution, fine, confiscation, jail, exile, pardon or faction escalation according to law and evidence.

- Taxation and customs affect economy, trade, reputation and politics but do not become a separate taxation need bar.

- Emergency response is event-driven. Players should prepare systems and supplies, not manually order each bucket, ladder or evacuation step.

- Culture and faction variants can change law, ceremony, military tradition and architecture without duplicating the universal building definition.

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr class="header">
<th><p><strong>Explicit Non-Goals</strong></p>
<p>20C does not require a full grand-strategy government simulator, courtroom dialogue for every offence, daily tax accounting for each NPC, manual guard rosters, real-time pathfinding for distant patrols, or a separate building for every possible law office in Version 0.1.</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

# 3. Seven-Needs Integration

| **Need**       | **20C Contribution**                                                                                                                                    | **Typical Failure Causes**                                                                                          |
|----------------|---------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------|
| Housing        | Emergency shelters provide temporary refuge; barracks provide duty accommodation where defined but do not replace civilian housing.                     | Insufficient refuge, unsafe shelters, guards occupying civilian homes, disaster displacement.                       |
| Provisions     | Armouries and emergency shelters reserve real supplies; customs and leadership can influence distribution policy.                                       | No emergency food/water, ammunition shortage, blocked supply route, confiscation or corruption.                     |
| Health         | Fire/rescue, humane holding, safe evacuation, reduced raid injuries and disaster treatment support Health.                                              | Injuries, smoke, collapse, overcrowded refuge, unsafe detention, no medicine or healer link.                        |
| Work           | Officials, guards, trainers, quartermasters, responders and planners create jobs and require specialists.                                               | Vacant offices, no guards, no magistrate, missing trainer, no quartermaster or responder crew.                      |
| Safety         | Detection, patrol, access control, barriers, equipment, justice, emergency response and refuge directly support Safety.                                 | Unknown threats, slow warning, weak readiness, perimeter gaps, crime, fire, disaster or no refuge.                  |
| Infrastructure | Governance records, roads, gates, project approvals, walls, alarms, response routes and civic services depend on physical networks.                     | Blocked gates, poor records, disconnected roads, broken signals, damaged walls or inaccessible offices.             |
| Morale         | Fair law, visible leadership, successful defence, diplomacy and recovery can improve trust; oppression, corruption, defeat and injustice can reduce it. | Arbitrary punishment, high fear, casualties, breached homes, corrupt taxes, poor leadership or unresolved disputes. |

# 4. Shared Governance and Safety Model

The settlement overview should show the causes that matter rather than compressing every civic and defence system into one opaque percentage. Safety remains the visible need; supporting screens expose readiness, incidents, laws, coverage and project blockers.

| **Model**             | **Calculation Direction**                                                                                                                            | **Player-Facing Example**                                         |
|-----------------------|------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------|
| Governance capacity   | Recognised authority + staffed civic stations + records + public access + valid permissions compared with population, districts and active projects. | Governance: Strained - 14 unresolved requests; no planning clerk. |
| Administrative load   | Requests, permits, records, laws, districts, contracts, cases and active projects compared with staffed office capacity.                             | Village Hall: Overloaded - blueprint approvals delayed.           |
| Threat pressure       | Known camps, hostile factions, creature activity, wealth, route exposure, world events and recent attacks.                                           | Threat: High - goblin scouts on the northern road.                |
| Detection and warning | Sight, light, patrol reports, alarms, signals and line-of-sight coverage compared with likely approaches.                                            | Warning time: 42 seconds - eastern ravine unobserved.             |
| Guard readiness       | Active guards modified by health, morale, skill, equipment, ammunition, training, command, warning time and travel route.                            | Guard readiness: 61% - 2 guards lack armour.                      |
| Perimeter integrity   | Connected barriers, gates, terrain, breaches, fire state, patrol access and maintenance.                                                             | Palisade: 84% intact - south livestock gap open.                  |
| Emergency coverage    | Response staff, equipment, water, alarms, routes, refuge and hazard-specific readiness.                                                              | Fire response: Limited - river fill point blocked.                |
| Justice capacity      | Reported cases, evidence, staff, law profile, guards, hearing space and backlog.                                                                     | Justice: 3 pending cases - magistrate absent.                     |

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr class="header">
<th><p><strong>Protection Chain</strong></p>
<p>A useful defence plan normally combines Detection -&gt; Warning -&gt; Delay -&gt; Response -&gt; Sustainment -&gt; Refuge -&gt; Recovery. No single tower, wall or guard count should replace the whole chain.</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

# 5. Runtime, Service and Incident States

| **State**               | **Meaning**                                                                    | **Settlement Effect**                                                          |
|-------------------------|--------------------------------------------------------------------------------|--------------------------------------------------------------------------------|
| Planned                 | Approved site or network; resources may be reserved.                           | No service yet; project appears in civic/defence plan.                         |
| Under Construction      | Visible stages are supplied and built.                                         | Only explicit partial functions activate.                                      |
| Commissioning           | Staff, permissions, routes, records, equipment and safety are checked.         | May accept assignments but does not provide full capacity.                     |
| Operational             | Minimum function passes and staff are available.                               | Provides civic, patrol, defence or emergency service.                          |
| Alert                   | Threat or incident has raised readiness or restricted access.                  | Guards mobilise, gates change policy, shelters prepare, UI warns player.       |
| Engaged                 | Raid, fire, crime response, rescue or hearing is actively using the service.   | Consumes supplies and staff; normal service may be reduced.                    |
| Overloaded              | Demand exceeds staff, route, room, equipment or record capacity.               | Backlog, slower response, reduced coverage or planner pressure.                |
| Breached or Compromised | Access, perimeter, records, evidence, stores or authority security has failed. | Safety loss, theft, escape, sabotage, misinformation or rapid repair need.     |
| Damaged                 | Some function remains but capacity falls.                                      | Partial contribution and repair project.                                       |
| Disabled                | Critical marker, route, staff, authority or utility is missing.                | No normal contribution until corrected.                                        |
| Captured or Contested   | Ownership or authority is disputed.                                            | Permissions, banners, laws and access may change; rebellion or faction events. |
| Abandoned or Ruined     | No maintained use or critical structure destroyed.                             | No normal service; restoration, salvage, occupation or landmark state.         |

| **Incident Phase**   | **Required Record**                                                                    |
|----------------------|----------------------------------------------------------------------------------------|
| Detection            | Source, time, location, witnesses/sensors, confidence and initial threat type.         |
| Report               | Reporter, responsible authority, evidence links, affected people/property and urgency. |
| Response             | Assigned guards/responders, route, equipment, orders and status.                       |
| Resolution           | Outcome, casualties, damage, arrests, escape, fire control, rescue or treaty result.   |
| Judgment/Consequence | Law, evidence, decision, restitution/fine/penalty, reputation and faction effects.     |
| Aftermath            | Repairs, mourning, relief, security change, project request, history and story hooks.  |

# 6. Governance, Leadership, Laws and Permissions

- Settlement governance is stored as a governance profile separate from any building: authority type, leaders, succession, council rules, faction control, legitimacy, laws, permissions and public policies.

- Village Hall and Town Hall provide physical capacity for that profile: offices, records, public access, meetings and decisions.

- Leadership can be individual, council-based, hereditary, elected, clan-based, religious, merchant, military, magical, player-led or conquered without changing the universal hall function.

- Routine decisions can run from policy and priority settings. Major laws, conquest, taxes, diplomacy, exile, forbidden magic and settlement-stage changes should produce explicit events and records.

- Permissions apply to building, breaking, warehouse access, automated delivery, restricted areas, gates, records, armouries, magic, trade and player-blueprint submission.

- Laws should show their intended effect and likely consequences. Hidden arbitrary rules damage trust.

- A building can be physically complete but politically inactive if no authority is recognised or ownership is contested.

- Player-founded settlements reuse the same governance and permission records rather than using a separate simplified mode.

| **Governance Record**    | **Examples**                                                                                                                       |
|--------------------------|------------------------------------------------------------------------------------------------------------------------------------|
| Authority                | Elder, chief, council, mayor, lord, elected assembly, guild council, mage conclave, occupying governor, player ruler.              |
| Law profile              | Theft, assault, trespass, building, trade, tax, contraband, magic, weapons, curfew, wildlife, labour and emergency powers.         |
| Permission profile       | Resident, guest, ally, guild, faction, player, guard, official, prisoner, enemy and public access levels.                          |
| Policy profile           | Project priorities, food reserve, defence posture, trade openness, migration, patrol focus, emergency readiness and tax direction. |
| Legitimacy and stability | Trust, fear, tradition, election, conquest, faction support, prosperity, corruption, rebellion and recent outcomes.                |
| History                  | Major laws, leaders, votes, coups, conquests, pardons, treaties, disasters and stage changes.                                      |

# 7. Records, Planning and Blueprint Administration

1.  A player or NPC proposes a project or blueprint through an allowed civic interface.

2.  The system resolves the universal building definition, functional markers, style/culture rules and contributor identity.

3.  Planning checks stage, parcel, terrain, roads, utilities, ownership, laws, overlaps, heritage, danger and future network sockets.

4.  The blueprint office or settlement planner reports exact approval or rejection reasons.

5.  Approved projects receive a stable record, site reservation, material estimate, stages and construction queue priority.

6.  Builders and warehouses reserve real resources and complete visible stages.

7.  Inspection validates activation; completed records preserve author, palette, ownership, capacity and future upgrade links.

| **Record Type**  | **Purpose**                                                                                     |
|------------------|-------------------------------------------------------------------------------------------------|
| Census/household | Population, households, residency, labour and emergency accountability.                         |
| Parcel/site      | Ownership, permitted function, bounds, terrain, access, sockets, heritage and future expansion. |
| Blueprint        | Definition, creator, variant, material tokens, markers, stages, capacity and validation result. |
| Project          | Resources, reservations, labour, progress, blockers, approvals, contributors and completion.    |
| Structure        | Runtime condition, staff, service, ownership, permissions, damage and history.                  |
| Road/perimeter   | Connected nodes, gates, coverage, breaches, patrol access and emergency routes.                 |
| Civic decision   | Authority, law/policy, vote or order, date, reason, affected systems and consequences.          |

# 8. Justice, Crime, Witnesses and Consequences

Crime should be event-driven and legible. It is not a constant background roll that randomly brands residents as criminals. Incidents arise from actual actions, needs, faction behaviour, traits, laws, witnesses, ownership and opportunity.

8.  An action occurs and is compared with the active law and ownership profiles.

9.  Witnesses, guards, alarms or evidence may detect it. Detection stores confidence rather than perfect knowledge.

10. A report or active pursuit is created if the incident is recognised and relevant.

11. Guards respond according to urgency, authority, routes, staffing and risk.

12. Evidence, testimony, reputation, confession or investigation determine whether a case proceeds.

13. A magistrate, council, leader or culture-specific authority resolves the case under the current law.

14. Consequences apply: warning, apology, restitution, fine, confiscation, service, jail, exile, pardon, faction escalation or no finding.

15. The outcome is remembered by NPCs, settlement history, reputation, fear, law confidence and possible quests.

| **Rule**              | **Direction**                                                                                                                                      |
|-----------------------|----------------------------------------------------------------------------------------------------------------------------------------------------|
| No omniscience        | Unseen actions do not instantly alert every guard. Evidence can still be discovered later.                                                         |
| Witness credibility   | Distance, lighting, disguise, relationship, fear, traits and magical effects can modify confidence.                                                |
| Proportional response | Minor property disputes should not trigger lethal force; severe violence or active raid threats can.                                               |
| Culture and faction   | Definitions of contraband, trespass, forbidden magic, duel, debt and punishment vary by law profile.                                               |
| Player freedom        | Players can obey, negotiate, bribe, flee, appeal, conquer or resist, but the world responds persistently.                                          |
| Humane baseline       | Where detention is simulated, food, health, exits, capacity and safety remain real concerns; harsh regimes can violate this and face consequences. |
| Distant abstraction   | Cases preserve accused, victim, evidence strength, law, resolution and consequence without simulating every hearing.                               |

# 9. Diplomacy, Taxation, Customs and External Authority

- Diplomacy can occur without an embassy; an embassy increases capacity, security, continuity and available events for sustained relations.

- Taxes, tolls and tribute are policy and economy systems. Offices provide collection, records, inspection and accountability capacity.

- Customs requires a real route, port, gate or border. It cannot collect from unrelated trade elsewhere in the world.

- High taxes may fund services but affect trade, morale, evasion, corruption and faction politics. Exact rates remain later balance data.

- Conquered settlements may convert civic buildings to occupation administration, tribute or resistance targets while retaining stable function IDs.

- Embassies and customs offices should create both opportunities and risks: treaties, visitors, cultural exchange, espionage, contraband, protests and diplomatic incidents.

- Player-created civic buildings must obey faction ownership, public access and restricted-space rules before entering a project pool.

| **External System**  | **20C Physical Anchor**                                                             |
|----------------------|-------------------------------------------------------------------------------------|
| Faction relationship | Embassy, diplomatic hall, leader reception or neutral meeting site.                 |
| Treaty/ceasefire     | Negotiation room, records, witnesses, seals and public announcement.                |
| Trade border         | Customs lane, manifest records, guard inspection and secure goods/evidence.         |
| Tax/tribute          | Ledger, treasury transfer, collection route and public policy record.               |
| Conquest/occupation  | Changed ownership, banners, authority, access, tribute and resistance risk.         |
| Rebellion/resistance | Contested civic sites, sabotage, hidden networks, guard loyalty and public support. |

# 10. Threat Detection, Patrols and Guard Readiness

| **Readiness Factor** | **Calculation Direction**                                                                          |
|----------------------|----------------------------------------------------------------------------------------------------|
| Staffing             | Available guards compared with required patrol, gate, tower and reserve positions.                 |
| Health and morale    | Wounds, fatigue, fear, loyalty, recent losses, leadership confidence and household safety.         |
| Skill and training   | Combat skill, weapon familiarity, formation, alert drills, terrain knowledge and specialist roles. |
| Equipment            | Weapons, armour, shields, ammunition, light, healing supplies, mounts and condition.               |
| Warning time         | Tower/patrol detection, scouts, alarms, line of sight, weather, darkness and surprise.             |
| Command              | Captain or leader, rally point, orders, communication, signal chain and faction loyalty.           |
| Routes and positions | Reachable walls, gates, towers, streets, cover, chokepoints and blocked paths.                     |
| Sustainment          | Food, ammunition, repair materials, medical aid, relief staff and secure stores.                   |

- Patrol profiles specify zones, priorities, time bands and emergency behaviours. They do not require manual waypoint orders for each shift.

- Guard AI should respond to alarms, reports, visible threats, protected targets, commander orders and civilian danger.

- Guards can flee, surrender, rally, call for help or protect civilians based on morale, orders, threat and culture.

- Watchtowers improve warning and ranged position; guard posts improve local response; barracks improve readiness and reserve; armouries improve equipment supply.

- Unstaffed or inaccessible defences provide only their physical collision or cover, not full service bonuses.

- Near and distant simulations use the same readiness factors, with distant raids resolving in bounded stages and preserving casualties, stock, damage and history.

# 11. Fortifications, Gates, Sieges and Access

| **Defence Contribution** | **Examples**                                               | **What It Does Not Replace**                     |
|--------------------------|------------------------------------------------------------|--------------------------------------------------|
| Detection                | Towers, beacons, patrols, road scouts, alarms.             | Guards, equipment, response routes.              |
| Delay                    | Palisades, walls, ditches, terrain, doors, gates.          | Damage immunity or infinite time.                |
| Channel                  | Gates, streets, bridges, chokepoints, controlled openings. | Safe evacuation and alternate routes.            |
| Position                 | Parapets, towers, cover, firing platforms, rally points.   | Skill, ammunition or command.                    |
| Access control           | Locks, permissions, inspection, curfew and guard posts.    | Perfect detection of disguised or hidden actors. |
| Sustainment              | Armouries, stores, wells, repair points, healer links.     | Food, Health and Infrastructure systems.         |
| Refuge                   | Bunkers, keeps, safe halls, evacuation routes.             | Permanent housing or victory.                    |

- Perimeter networks are modular. Each segment stores material, condition, sockets, collision, ownership, patrol access and breach state.

- Gates are daily infrastructure as well as defence. Traffic, trade, visitors, livestock, carts and emergency evacuation must remain usable.

- Siege attackers can breach, burn, climb, tunnel, sabotage, bypass or assault gates depending on faction, difficulty and technology.

- Walls require foundations and terrain fit but the default game does not need a global structural-integrity simulation for every block.

- Repairs are visible projects using exact materials. Emergency patching can restore delay or access before full cosmetic repair.

- Fortification spam receives diminishing coverage value, maintenance cost, route friction, morale/political consequences and attacker adaptation.

- Magical wards and advanced defence belong primarily to 20E but connect to the same coverage, warning, damage and ownership contracts.

# 12. Equipment, Training and Reserve Forces

- Guard jobs require actual equipment appropriate to role and threat. A guard without a weapon may still warn, evacuate or assist but should not count as fully ready.

- Armouries reserve, issue, recover, repair and account for equipment. Items remain owned and can be lost, stolen or damaged.

- Barracks support duty accommodation, training, muster and reserve forces; they do not create trained soldiers from empty beds.

- Training improves readiness over time using instructors, equipment, safe space and schedules. Low skill means weaker performance, not constant random failure.

- Militia can be mobilised from suitable residents under emergency policy, with effects on normal work, households and morale.

- Specialist branches may include archers, cavalry, engineers, battle mages or monster hunters through later documents and culture packs.

- After combat, equipment, wounds, deaths, missing NPCs, prisoners and destroyed stores remain persistent world state.

| **Supply Category** | **Examples**                                        | **Failure Result**                            |
|---------------------|-----------------------------------------------------|-----------------------------------------------|
| Personal gear       | Weapon, shield, armour, helmet, light, medicine.    | Reduced role effectiveness and survivability. |
| Ammunition          | Arrows, bolts, thrown weapons, magical charges.     | Ranged positions lose sustained value.        |
| Signal              | Bell, horn, beacon fuel, messenger kit, rune alarm. | Reduced warning spread and command.           |
| Repair              | Timber, stone, fittings, tools, fire-control stock. | Breaches and damaged gates persist.           |
| Medical             | Bandages, medicine, stretchers, healer access.      | Higher casualties and slower recovery.        |
| Reserve provisions  | Food, water, bedding, fuel.                         | Reduced siege duration and refuge safety.     |

# 13. Fire, Rescue, Disaster and Civilian Refuge

16. Hazard systems identify a real source and footprint: fire, collapse, flood, storm, avalanche, industrial accident, corruption, mana overload or siege.

17. Alarms and witnesses create an incident with location, severity and confidence.

18. The settlement selects a response plan based on staff, tools, water, routes, weather, threat and affected population.

19. Responders travel, suppress, rescue, evacuate, triage or isolate using visible tasks near the player.

20. Shelters open according to hazard profile, capacity, stock and access permissions.

21. The event resolves with persistent casualties, damage, consumed supplies, displaced households and repair or relief projects.

22. Aftermath updates laws, readiness, morale, reputation, history and possible story events.

| **Hazard**             | **Key Preparedness**                                                                                    |
|------------------------|---------------------------------------------------------------------------------------------------------|
| Fire                   | Alarms, water, firebreaks, material risk, response crew, ladders, evacuation and fuel-store separation. |
| Flood                  | Elevation, drainage, gates, boats, raised refuge, warning and route redundancy.                         |
| Storm/temperature      | Shelter integrity, heating/cooling, supplies, safe routes and repair stock.                             |
| Collapse/mine accident | Engineering tools, shoring, rescue access, medics and specialist responders.                            |
| Raid/siege             | Warning, perimeter, guards, armoury, refuge, healer, reserves and evacuation.                           |
| Corruption/magic       | Detection, containment, wards, cleansing, specialised refuge, healer/mage and controlled access.        |

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr class="header">
<th><p><strong>Emergency Capacity Rule</strong></p>
<p>A refuge is temporary protected capacity. It does not satisfy normal Housing after the emergency, and it only protects against hazards included in its validated profile.</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

# 14. NPC Planner and Project Selection

| **Scoring Input**      | **Examples**                                                                                           |
|------------------------|--------------------------------------------------------------------------------------------------------|
| Stage requirement      | Village Hall, guard post, warning and controlled access for the POC Village profile.                   |
| Safety deficit         | Known threat, warning gap, response delay, perimeter breach, equipment shortage or refuge shortfall.   |
| Administrative load    | Request backlog, parcel conflict, law cases, blueprint volume, district count and record loss.         |
| Incident history       | Repeated theft, raids, fires, casualties, smuggling, diplomatic conflict or unresolved disputes.       |
| Population and traffic | Residents, visitors, market crowds, caravans, gates and district density.                              |
| Strategic value        | Warehouse, mines, portal, trade route, faction border, rare resource or story site.                    |
| Culture and law        | Preferred governance, military tradition, forbidden structures, public-space and justice expectations. |
| Resources and staffing | Materials, builders, guards, officials, specialists, tools, equipment and maintenance.                 |
| Terrain and network    | Sightlines, perimeter, roads, water, slope, expansion, evacuation and utility access.                  |
| Cost and opportunity   | Construction cost, maintenance, labour taken from food/work, redundancy and player support.            |

23. Repair damaged access, fire control, shelters, gates and active breaches before prestige expansion.

24. Meet immediate life-safety and severe shortage projects before optional military or civic prestige unless an imminent threat overrides normal order.

25. Prefer a coverage or capacity gap over duplicate buildings with no distinct service area.

26. Use culture-specific equivalents and player-approved blueprints when they satisfy the same universal definition.

27. Reject sites that create trapped districts, blocked roads, unusable sightlines, unsafe crowds or impossible response routes.

28. Reserve resources by project stage and expose shortages through the request board or village overview.

29. Allow the player, leader or council to alter priorities, but record consequences when critical warnings are ignored.

# 15. Player Blueprint Validation

| **Validation Layer** | **Required Check**                                                                                                        |
|----------------------|---------------------------------------------------------------------------------------------------------------------------|
| Definition           | Blueprint declares one or more compatible universal definitions and does not invent capacity from decoration.             |
| Public/secure zones  | Public services, private offices, evidence, treasury, armoury, detention and leadership spaces are separated as required. |
| Access               | Residents, officials, guards, carts, visitors, responders and evacuees can use valid routes.                              |
| Coverage             | Guard, watch, wall, gate, response or service radius is calculated from real markers and terrain.                         |
| Sightlines           | Watch or ranged positions have actual observation/firing arcs and safe access.                                            |
| Perimeter sockets    | Walls, corners, towers and gates connect without exploitable gaps or terrain clipping.                                    |
| Emergency egress     | Crowds, detainees, officials and shelter occupants have sufficient exits and evacuation routes.                           |
| Hazards              | Fire, ammunition, machinery, height, crowding, collapse, flood and magical risks meet the intended profile.               |
| Permissions          | Ownership, law, faction, restricted areas and player submission rights allow construction and operation.                  |
| Capacity             | Staff, desks, guard positions, storage, shelter spots and routes remain within approved functional bands.                 |
| Construction         | Stages are reachable, resources resolve from material tokens and partial activation cannot bypass critical checks.        |
| Save/LOD             | Markers and network links serialize cleanly and distant simulation has all required summary fields.                       |

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr class="header">
<th><p><strong>Player Creativity Rule</strong></p>
<p>Validation should protect function, fairness, navigation and save integrity without forcing one visual style. A strange but functional gate, council hall or watchtower should pass if its required zones, sockets, routes, coverage and hazards are valid.</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

# 16. Construction, Damage, Repair, Upgrade and Conversion

| **Rule**              | **20C Direction**                                                                                                                                                                                      |
|-----------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Material tokens       | Use semantic roles such as foundation_primary, wall_defensive, frame_structural, gate_mechanism, parapet, secure_door, record_storage, guard_station, signal_device and refuge_supply.                 |
| Exact resources       | Calculated from approved blueprint cells and components per stage; network projects calculate by connected modules and fittings.                                                                       |
| Construction stages   | Use Planning, Site Preparation, Foundation, Frame, Shell, Access/Mechanism, Functional Installation, Equipment/Records and Inspection; small structures merge stages.                                  |
| Partial activation    | Watchtower warning can activate after safe platform and signal; palisade segments provide local delay when complete; halls require staff/records; shelters require exits, stock and hazard validation. |
| Damage                | Track breaches, burned sections, jammed gates, destroyed signals, lost records, looted armoury stock, unsafe holding and blocked shelter exits.                                                        |
| Emergency repair      | Restore access, fire control, warning, perimeter delay, secure stores and refuge before cosmetic reconstruction.                                                                                       |
| Upgrade               | In-place reinforcement, attached office, replacement, network conversion and prestige upgrade are supported when access and service continuity remain safe.                                            |
| Capture/conquest      | Ownership, banners, permissions, law and staff may change without changing the stable functional definition; resistance and legitimacy remain separate state.                                          |
| Demolition/relocation | Evacuate occupants, detainees, records, armoury stock, civic services and emergency routes before project approval.                                                                                    |

# 17. Settlement-Stage Expectations

| **Stage**          | **20C Minimum Expectations**                                                                                                                                                       | **Typical Optional / Conditional Growth**                                                  |
|--------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------|
| Camp               | Informal leadership, visible settlement centre, basic warning or watch behaviour where danger applies.                                                                             | Temporary palisade, command tent, emergency muster.                                        |
| Hamlet             | Recognised leader/request access can share another building; basic patrol or warning if local threats justify it.                                                                  | Small guard shelter, signal post, refuge use of communal structures.                       |
| Village            | Village Hall plus organised guard response, warning and controlled access appropriate to threat/world settings. POC uses Guard Post, Wooden Watchtower, Palisade and Village Gate. | Blueprint Office, culture-equivalent defences, local justice through leader/council.       |
| Fortified Village  | Repeated-threat readiness, stronger perimeter, training/reserve, equipment stores and repair capacity.                                                                             | Barracks, Armoury, expanded shelters, towers, ward links.                                  |
| Town               | Town Hall/council capacity, planning records, formal justice where law complexity requires it, stronger gates/walls and hazard response appropriate to density.                    | Court, Customs, Fire/Rescue, Refuge Bunker, specialist guard branches.                     |
| City               | Multiple districts, diplomacy, regional authority and major defence/emergency complexes owned partly by 20F.                                                                       | Embassy, Leader Residence, district posts, city wall/fort integrations.                    |
| Capital            | Culture-defining authority, diplomacy and military command through 20F/20G.                                                                                                        | Palace/high council, grand court, national archive, capital fortifications.                |
| Magical Metropolis | Realm-scale warning, ward, portal, disaster and civic networks without replacing core governance contracts.                                                                        | Arcane command, inter-realm embassy, magical refuge and automated defence through 20E/20F. |

# 18. Detailed Registry Summary

| **No.** | **Stable ID**                                     | **Definition**                     | **Earliest Stage** | **Primary Need** | **Class**   | **Status**   |
|---------|---------------------------------------------------|------------------------------------|--------------------|------------------|-------------|--------------|
| 61      | building.governance.village_hall                  | Village Hall                       | Village            | Infrastructure   | Required    | POC Required |
| 62      | building.governance.town_hall                     | Town Hall or Council House         | Town               | Infrastructure   | Upgrade     | Beta         |
| 64      | building.governance.records_planning_office       | Records and Planning Office        | Town               | Infrastructure   | Optional    | Beta         |
| 65      | building.justice.courthouse_magistrate            | Courthouse or Magistrate House     | Town               | Safety           | Conditional | Beta         |
| 66      | building.governance.tax_customs_office            | Tax or Customs Office              | Town               | Infrastructure   | Conditional | Beta         |
| 67      | building.governance.embassy_diplomatic_hall       | Embassy or Diplomatic Hall         | City               | Morale           | Conditional | Beta         |
| 68      | building.governance.leader_residence              | Governor or Leader Residence       | City               | Morale           | Optional    | Beta         |
| 70      | building.governance.blueprint_construction_office | Blueprint and Construction Office  | Village            | Infrastructure   | Optional    | Alpha        |
| 71      | building.safety.guard_post                        | Guard Post                         | Village            | Safety           | Required    | POC Required |
| 72      | building.safety.wooden_watchtower                 | Wooden Watchtower                  | Village            | Safety           | Required    | POC Required |
| 73      | project.defence.palisade_segment                  | Palisade Segment                   | Village            | Safety           | Required    | POC Required |
| 74      | building.safety.village_gate                      | Village Gate                       | Village            | Safety           | Required    | POC Required |
| 75      | building.safety.barracks_training_yard            | Barracks and Training Yard         | Fortified Village  | Safety           | Optional    | Alpha        |
| 76      | project.defence.stone_wall_gatehouse              | Stone Wall and Gatehouse System    | Town               | Safety           | Upgrade     | Beta         |
| 77      | building.safety.armoury                           | Armoury                            | Fortified Village  | Safety           | Optional    | Alpha        |
| 79      | building.emergency.fire_rescue_station            | Fire and Rescue Station            | Town               | Safety           | Optional    | Beta         |
| 80      | building.emergency.refuge_bunker                  | Emergency Shelter or Refuge Bunker | Town               | Safety           | Conditional | Beta         |

Catalogue numbers 63, 69 and 78 are intentionally absent: City Hall/Civic Complex, Palace/High Council Complex and Fort/Keep are owned by 20F because they are large complexes. Their dependencies remain referenced here.

# 19. Governance and Administration Entries

### 61. Village Hall

building.governance.village_hall

| **Catalogue role**                      | Governance / Civic \| Village \| Medium \| Required \| POC Required                                                                                                                                                                    |
|-----------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Infrastructure \| Secondary: Morale, Work                                                                                                                                                                                     |
| **Purpose**                             | Provides the first dedicated civic centre for requests, permissions, leadership, public records, settlement decisions and stage administration.                                                                                        |
| **Capacity / service**                  | Draft one active leader or council profile, one clerk position, a public request and service counter, and an assembly area sized for a small village. Capacity is based on valid offices and public access, not decorative floor area. |
| **Jobs and users**                      | Elder, chief, mayor, council member, clerk, herald, planner, builder liaison and visiting petitioners.                                                                                                                                 |
| **Inputs**                              | Records, paper or writing materials, seals, light or fuel, maintenance supplies and optional treasury or notice-board stock.                                                                                                           |
| **Outputs / services**                  | Request board access, permissions, public decisions, basic laws summary, project approvals, settlement overview, meeting events and governance continuity.                                                                             |
| **Required blueprint markers**          | Public entrance, request board, leader or council station, clerk desk, record storage, public assembly zone, secure office or chest, road or square socket.                                                                            |
| **Placement and utilities**             | Central or easily reached civic parcel with safe public access. It may connect to a square, market or blueprint office but must not require a fortification to function.                                                               |
| **Construction profile**                | 6 stages: site and foundation; civic shell; roof and entrances; desks and records; public board and assembly space; inspection and activation.                                                                                         |
| **Upgrade and branch links**            | Town Hall or Council House; attached Records and Planning Office; attached Blueprint and Construction Office; culture-specific council, moot or clan-hall branch.                                                                      |
| **Planner triggers and failure states** | Required for normal Village-stage administration unless a validated culture-specific equivalent exists. Pauses services if no recognised leader or clerk, public access is blocked, records are destroyed or ownership is disputed.    |
| **Player-blueprint validation**         | Must separate public and secure work areas, provide a valid request/permission interface, council or leader station, records and safe crowd access. A decorative grand hall cannot claim governance capacity without these markers.    |
| **Culture and style variation**         | Elder lodge, roundhouse moot, open council pavilion, dwarven clan chamber, fae grove council, nomad banner court or arcane civic hall.                                                                                                 |

### 62. Town Hall or Council House

building.governance.town_hall

| **Catalogue role**                      | Governance / Administration \| Town \| Large \| Upgrade \| Beta                                                                                                                                                              |
|-----------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Infrastructure \| Secondary: Morale, Work                                                                                                                                                                           |
| **Purpose**                             | Coordinates multiple districts, laws, budgets, public services and larger project queues once village-scale administration is no longer sufficient.                                                                          |
| **Capacity / service**                  | Draft several council or office positions, public service counters, a formal assembly chamber and town-level planning capacity. Exact staff and room counts scale through blueprint profiles.                                |
| **Jobs and users**                      | Mayor, council members, chief clerk, treasurer, planner, service officers, herald, guards and public petitioners.                                                                                                            |
| **Inputs**                              | Records, reports, maps, treasury stock, office materials, maintenance, lighting and service information from districts.                                                                                                      |
| **Outputs / services**                  | Town policies, district priorities, budgets, contracts, service coordination, emergency declarations, elections or succession events where the governance profile supports them.                                             |
| **Required blueprint markers**          | Council chamber, public lobby, service desks, leader office, treasury or secure records, map or planning table, announcement point, meeting and emergency-command positions.                                                 |
| **Placement and utilities**             | Prominent and accessible civic centre connected to major roads and district services; should have emergency access and secure service circulation.                                                                           |
| **Construction profile**                | 8 stages, with public service and clerk functions activating before final ceremonial rooms or prestige decoration.                                                                                                           |
| **Upgrade and branch links**            | City Hall or Civic Complex owned by 20F; attached court, records office, customs office, embassy wing or prestige civic square.                                                                                              |
| **Planner triggers and failure states** | Triggered when population, district count, project volume, laws or public services exceed Village Hall capacity. Underperforms when offices are vacant, records fragmented, treasury inaccessible or districts disconnected. |
| **Player-blueprint validation**         | Must expose multiple service functions, accessible public circulation, secure records and valid council or authority stations. Oversized ceremonial space alone does not increase administrative capacity.                   |
| **Culture and style variation**         | Republican council house, royal borough hall, clan senate, merchant council, temple-governed court, arcane administration tower or underground assembly vault.                                                               |

### 64. Records and Planning Office

building.governance.records_planning_office

| **Catalogue role**                      | Governance / Planning \| Town \| Medium \| Optional \| Beta                                                                                                                                                                                     |
|-----------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Infrastructure \| Secondary: Work                                                                                                                                                                                                      |
| **Purpose**                             | Maintains maps, census records, parcels, roads, project schedules and development history so expansion remains legible and save-safe.                                                                                                           |
| **Capacity / service**                  | Draft several clerk, survey and planning desks; supports a bounded number of active parcels, districts and project records according to blueprint and staffing profile.                                                                         |
| **Jobs and users**                      | Registrar, clerk, surveyor, architect, cartographer, census officer, archivist and messenger.                                                                                                                                                   |
| **Inputs**                              | Paper, ink, maps, survey reports, project records, census updates, building inspections and storage maintenance.                                                                                                                                |
| **Outputs / services**                  | Accurate parcels, site reservations, map updates, project queue efficiency, census summaries, heritage records and reduced planning conflicts.                                                                                                  |
| **Required blueprint markers**          | Public counter, records stacks, secure archive, map table, survey-equipment rack, planning desks, project board and messenger access.                                                                                                           |
| **Placement and utilities**             | Near Town Hall, Blueprint Office or a civic square; protected from fire, flood and uncontrolled public access.                                                                                                                                  |
| **Construction profile**                | 6 stages: protected shell; archive fittings; map/planning area; public counter; secure records; inspection and catalogue activation.                                                                                                            |
| **Upgrade and branch links**            | City planning bureau, national archive or integrated civic complex through 20F; may absorb the Blueprint Office at higher stages.                                                                                                               |
| **Planner triggers and failure states** | Selected when parcel conflicts, project backlog, district complexity, census uncertainty or blueprint volume causes Infrastructure strain. Fails when records burn, staff are absent, ownership data conflicts or archive capacity is exceeded. |
| **Player-blueprint validation**         | Must provide secure dry storage, working map and planning positions, controlled public access and a clear record workflow. Empty bookshelves do not create planning capacity.                                                                   |
| **Culture and style variation**         | Wax-tablet archive, rune-record vault, oral-history chamber with scribes, living-tree memory hall, crystal map room or mechanical survey office.                                                                                                |

### 68. Governor or Leader Residence

building.governance.leader_residence

| **Catalogue role**                      | Governance / Residential Civic \| City \| Large \| Optional \| Beta                                                                                                                                  |
|-----------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Morale \| Secondary: Safety, Infrastructure                                                                                                                                                 |
| **Purpose**                             | Provides an official residence, reception space and visible authority symbol for a leader whose role has outgrown ordinary housing.                                                                  |
| **Capacity / service**                  | Draft one leader household, official office and reception profile, staff and guard points; prestige capacity depends on culture and events rather than raw luxury blocks.                            |
| **Jobs and users**                      | Governor, mayor, lord, elected leader, household members, secretary, steward, guards, servants and visiting petitioners.                                                                             |
| **Inputs**                              | Household provisions, public records, security, maintenance, ceremonial or cultural goods and hospitality stock.                                                                                     |
| **Outputs / services**                  | Official residence, receptions, leadership continuity, civic morale, emergency-command fallback and high-value political events.                                                                     |
| **Required blueprint markers**          | Private household zone, official office, reception room, secure records, guard post, service access, public appointment point and evacuation route.                                                  |
| **Placement and utilities**             | Protected civic parcel with controlled public access. It may adjoin Town Hall but should not block normal services or become the only command point.                                                 |
| **Construction profile**                | 8 stages, with residence and office activating before ceremonial halls, gardens or prestige elements.                                                                                                |
| **Upgrade and branch links**            | Palace or High Council Complex owned by 20F; branch into modest civic residence, fortified keep residence or culture-specific leadership compound.                                                   |
| **Planner triggers and failure states** | Selected when governance profile, population, diplomacy or culture expects an official residence. Becomes a raid, coup or protest target if security, legitimacy or public access is poorly managed. |
| **Player-blueprint validation**         | Must clearly separate private, official, public and guard circulation. Decorative luxury does not create authority; an active recognised leader and governance profile are required.                 |
| **Culture and style variation**         | Mayor house, clan chief compound, elected speaker residence, royal governor manor, fae seasonal court, dwarven thane hall or mage-governor tower.                                                    |

### 70. Blueprint and Construction Office

building.governance.blueprint_construction_office

| **Catalogue role**                      | Governance / Construction \| Village \| Medium \| Optional \| Alpha                                                                                                                                           |
|-----------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Infrastructure \| Secondary: Work                                                                                                                                                                    |
| **Purpose**                             | Connects player and NPC blueprint creation to settlement permissions, parcel assignment, cost estimates, construction queues and project history.                                                             |
| **Capacity / service**                  | Draft several blueprint review, planning and survey positions and a bounded queue of proposed or active player/NPC projects.                                                                                  |
| **Jobs and users**                      | Architect, planner, surveyor, builder foreman, clerk, quartermaster, player proposer and visiting household or guild representative.                                                                          |
| **Inputs**                              | Blueprint files or plans, parcel maps, material estimates, project prerequisites, law and style rules, survey tools and records.                                                                              |
| **Outputs / services**                  | Validated blueprint alternatives, parcel reservations, construction estimates, rejection reasons, approved project records and builder task packages.                                                         |
| **Required blueprint markers**          | Public submission counter, blueprint table or preview station, model/display area, project board, plan archive, survey-tool rack, secure approval desk and road/supply-yard sockets.                          |
| **Placement and utilities**             | Near Village Hall, Records Office, Builder Supply Yard or warehouse access; requires enough public space to inspect designs without blocking builders.                                                        |
| **Construction profile**                | 6 stages: office shell; drafting area; records; public submission; project board and survey gear; validation commissioning.                                                                                   |
| **Upgrade and branch links**            | Integrated planning bureau, civic blueprint library, district design office or automated/magical modelling branch through 20E/20F.                                                                            |
| **Planner triggers and failure states** | Selected when player blueprints, project count, parcel conflicts or construction backlog become meaningful. Pauses approvals if no planner, records, map data, permissions or validated submission interface. |
| **Player-blueprint validation**         | Must support submission, preview/review, approval record, parcel link and project output. Decorative drawing tables do not grant settlement-wide blueprint authority.                                         |
| **Culture and style variation**         | Architect guild lodge, builder moot, rune-model chamber, holographic map room, clay model court, dwarven survey vault or nomad route-planning tent.                                                           |

# 20. Justice and External-Authority Entries

### 65. Courthouse or Magistrate House

building.justice.courthouse_magistrate

| **Catalogue role**                      | Justice / Civic \| Town \| Medium \| Conditional \| Beta                                                                                                                                               |
|-----------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Safety \| Secondary: Morale, Infrastructure                                                                                                                                                   |
| **Purpose**                             | Provides a visible process for disputes, reported crimes, evidence, hearings, fines, warrants and limited temporary detention without making guards omniscient.                                        |
| **Capacity / service**                  | Draft one hearing room, one magistrate or justice station, clerk and witness capacity, evidence storage and a small holding profile where laws permit.                                                 |
| **Jobs and users**                      | Magistrate, judge, law speaker, clerk, bailiff, guard, advocate, witness, victim, accused resident and interpreter.                                                                                    |
| **Inputs**                              | Law profile, case records, witness or evidence reports, seals, secure storage, guard support and basic detainee provisions where holding is used.                                                      |
| **Outputs / services**                  | Resolved disputes, judgments, fines or restitution, warrants, acquittals, case history, reputation effects and lawful escalation to exile, imprisonment or faction response.                           |
| **Required blueprint markers**          | Public entrance, hearing room, authority station, clerk desk, witness/evidence position, secure records, guard point, private consultation and optional humane holding cell.                           |
| **Placement and utilities**             | Accessible civic area with secure connection to guard routes; should not expose detainees or evidence to public traffic.                                                                               |
| **Construction profile**                | 7 stages including secure shell, public hearing area, records, evidence storage, guard access, optional holding and legal commissioning.                                                               |
| **Upgrade and branch links**            | Higher court, appeals chamber, prison or justice complex only if later mechanics justify separate universal definitions; can attach to Town Hall or Fort.                                              |
| **Planner triggers and failure states** | Conditional on crime/dispute volume, formal laws, population and faction expectations. Does not operate without a recognised authority, law profile, staff, reports or valid evidence/witness process. |
| **Player-blueprint validation**         | Must separate public, judicial, evidence and holding circulation; provide safe exits and humane detention where used. A throne room or prison cell alone cannot claim justice service.                 |
| **Culture and style variation**         | Magistrate house, clan arbitration circle, oath court, merchant tribunal, spirit-witness shrine, dwarven law vault or mobile nomad judgment pavilion.                                                  |

### 66. Tax or Customs Office

building.governance.tax_customs_office

| **Catalogue role**                      | Governance / Trade Control \| Town \| Small-Medium \| Conditional \| Beta                                                                                                                  |
|-----------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Infrastructure \| Secondary: Work, Safety                                                                                                                                         |
| **Purpose**                             | Manages tolls, tariffs, tribute, declared goods, inspections and route permissions where the settlement law or political situation requires them.                                          |
| **Capacity / service**                  | Draft one or more inspection lanes or counters, a small secure treasury or evidence store and staff capacity matched to the connected gate, port or caravan route.                         |
| **Jobs and users**                      | Tax collector, customs officer, clerk, appraiser, guard, interpreter, caravan master and merchant.                                                                                         |
| **Inputs**                              | Trade manifests, scales, seals, law and tariff profiles, secure cash storage, inspection tools and route traffic.                                                                          |
| **Outputs / services**                  | Treasury revenue, legal declarations, permits, contraband cases, toll records, trade statistics and political or reputation consequences.                                                  |
| **Required blueprint markers**          | Public counter, inspection zone, ledger desk, scales, secure money/evidence store, guard point, queue space and route socket.                                                              |
| **Placement and utilities**             | At or near a gate, port, bridge, market route or customs boundary. Must preserve traffic flow and emergency access.                                                                        |
| **Construction profile**                | 5-6 stages, with inspection and ledger functions activating before prestige frontage or expanded storage.                                                                                  |
| **Upgrade and branch links**            | Customs house, treasury complex, border administration or integrated trade exchange; occupation or tribute variant uses the same function with different laws and consequences.            |
| **Planner triggers and failure states** | Triggered by route value, taxation law, faction border, smuggling pressure, conquest or trade volume. Fails without authority, staff, route traffic, secure storage or clear tariff rules. |
| **Player-blueprint validation**         | Must connect to a real route and provide safe inspection, queue and secure storage zones. Decorative toll booths cannot collect from unrelated distant trade.                              |
| **Culture and style variation**         | Gate tax booth, harbour customs hall, merchant weigh house, tribute lodge, rune-seal checkpoint or caravan counting tent.                                                                  |

### 67. Embassy or Diplomatic Hall

building.governance.embassy_diplomatic_hall

| **Catalogue role**                      | Governance / Diplomacy \| City \| Large \| Conditional \| Beta                                                                                                                                              |
|-----------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Morale \| Secondary: Safety, Work                                                                                                                                                                  |
| **Purpose**                             | Supports resident or visiting envoys, formal negotiation, treaties, cultural exchange and secure faction contact.                                                                                           |
| **Capacity / service**                  | Draft one or more delegations, negotiation rooms, secure document storage and optional guest accommodation depending on the blueprint profile.                                                              |
| **Jobs and users**                      | Ambassador, envoy, diplomat, interpreter, clerk, cultural adviser, guard, servant and visiting faction representative.                                                                                      |
| **Inputs**                              | Diplomatic documents, hospitality provisions, gifts, security, interpreters, faction permissions and maintenance.                                                                                           |
| **Outputs / services**                  | Negotiations, treaties, ceasefires, trade access, cultural events, faction quests, warnings and diplomatic incidents remembered by the world.                                                               |
| **Required blueprint markers**          | Reception, negotiation room, offices, secure archive, delegation waiting or guest area, flag or identity points, guard stations and discreet service access.                                                |
| **Placement and utilities**             | Civic or diplomatic district with safe road, port or portal access; must be defensible without resembling a prison.                                                                                         |
| **Construction profile**                | 8 stages; reception and negotiation can activate before full guest wing, gardens or prestige decoration.                                                                                                    |
| **Upgrade and branch links**            | Diplomatic quarter, realm embassy, grand treaty hall or palace wing through 20F/20G.                                                                                                                        |
| **Planner triggers and failure states** | Conditional on sustained faction contact, treaties, visitors, regional importance or conflict mediation. Underperforms without envoys, interpreters, security, hospitality or recognised diplomatic status. |
| **Player-blueprint validation**         | Must separate public reception, secure negotiation, archives and guest circulation. A decorative foreign-style building cannot claim diplomatic capacity without active faction links and staff.            |
| **Culture and style variation**         | Shared neutral hall, foreign enclave, floating embassy, portal embassy, clan guesthouse, merchant legation or warded inter-realm mission.                                                                   |

# 21. Safety and Defence Entries

### 71. Guard Post

building.safety.guard_post

| **Catalogue role**                      | Safety / Patrol \| Village \| Small \| Required \| POC Required                                                                                                                                                 |
|-----------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Safety \| Secondary: Work                                                                                                                                                                              |
| **Purpose**                             | Provides local patrol assignment, guard readiness, equipment access and rapid response coverage for a village area or route.                                                                                    |
| **Capacity / service**                  | Draft one to four active guards depending on valid stations, equipment and patrol network; extra decorative beds or chairs do not increase response capacity.                                                   |
| **Jobs and users**                      | Guard, watch officer, patrol captain, gatekeeper, militia member, messenger and temporary detainee escort.                                                                                                      |
| **Inputs**                              | Weapons, armour, light, signal tools, patrol orders, food through normal provisions, maintenance and optional ammunition.                                                                                       |
| **Outputs / services**                  | Patrol coverage, local response, crime deterrence, incident reporting, escort, gate support and visible security presence.                                                                                      |
| **Required blueprint markers**          | Guard station, equipment rack, rest or briefing point, patrol route sockets, signal point, secure report box and road access.                                                                                   |
| **Placement and utilities**             | At a village centre, gate, market, road junction or vulnerable facility. Coverage should overlap meaningfully rather than encouraging unlimited post spam.                                                      |
| **Construction profile**                | 5 stages: foundation; shell; guard station; equipment and signal; patrol-link inspection and activation.                                                                                                        |
| **Upgrade and branch links**            | Expanded watch house, barracks, gatehouse post, mounted patrol station or culture-specific guard lodge.                                                                                                         |
| **Planner triggers and failure states** | Required at Village stage where threat settings are active. Fails with no guards, equipment, safe route, authority or patrol links; overloaded coverage creates slow response rather than invisible protection. |
| **Player-blueprint validation**         | Must provide guard work positions, secure equipment, path sockets and a reachable response route. A decorative hut cannot claim patrol coverage.                                                                |
| **Culture and style variation**         | Town watch booth, clan warrior lodge, ranger post, fae sentinel tree, dwarven gate alcove, nomad mounted post or magical scry-watch room.                                                                       |

### 72. Wooden Watchtower

building.safety.wooden_watchtower

| **Catalogue role**                      | Safety / Detection \| Village \| Medium \| Required \| POC Required                                                                                                                                                           |
|-----------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Safety \| Secondary: Infrastructure                                                                                                                                                                                  |
| **Purpose**                             | Provides elevated detection, warning, ranged defence and the core proof that preparation changes a raid outcome.                                                                                                              |
| **Capacity / service**                  | Draft one to three guards, a defined sight and signal profile and limited ammunition or emergency supply storage.                                                                                                             |
| **Jobs and users**                      | Watch guard, archer, signaler, patrol captain and relief guard.                                                                                                                                                               |
| **Inputs**                              | Guard staffing, weapons, ammunition, signal fuel or devices, light, maintenance materials and accessible patrol support.                                                                                                      |
| **Outputs / services**                  | Earlier warning, increased guard readiness time, visible threat coverage, ranged position, signal events and reduced surprise during raids.                                                                                   |
| **Required blueprint markers**          | Safe stair or ladder, lookout deck, guard stations, sightline points, signal beacon or bell, cover or railing, equipment/ammunition point and ground patrol socket.                                                           |
| **Placement and utilities**             | Perimeter, ridge or strategic approach with real line-of-sight and safe access. Overlapping towers give diminishing returns unless they cover distinct approaches.                                                            |
| **Construction profile**                | 7 stages: site; foundation; frame; upper platform; safe access; railing/cover and signal; inspection. Functional warning may activate before final decoration.                                                                |
| **Upgrade and branch links**            | Stone watchtower, gatehouse tower, beacon chain, ward tower or integrated city wall tower.                                                                                                                                    |
| **Planner triggers and failure states** | Required in the POC defence loop and selected when scouting, raids or blind approaches create Safety pressure. Fails if sightlines are blocked, access is unsafe, no guard or signal exists, or damage disables the platform. |
| **Player-blueprint validation**         | Must meet minimum height/coverage profile, safe climb, usable deck, signal marker and sightline checks. A tall decorative spire cannot grant detection without guard access and observation points.                           |
| **Culture and style variation**         | Timber tower, treetop lookout, desert beacon, cliff perch, dwarven shaft tower, nomad signal mast or rune-lit sentinel platform.                                                                                              |

### 73. Palisade Segment

project.defence.palisade_segment

| **Catalogue role**                      | Defence / Perimeter Project \| Village \| Network \| Required \| POC Required                                                                                                                                                                    |
|-----------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Safety \| Secondary: Infrastructure                                                                                                                                                                                                     |
| **Purpose**                             | Creates a modular early perimeter that delays, channels and reveals attackers without pretending to make a settlement invulnerable.                                                                                                              |
| **Capacity / service**                  | Coverage is calculated from connected segment length, height, collision, terrain fit, gates and breach state rather than a single building capacity.                                                                                             |
| **Jobs and users**                      | Builders, lumber workers, repair crews, guards and patrols.                                                                                                                                                                                      |
| **Inputs**                              | Logs or equivalent barriers, rope or fasteners, tools, gates or corner pieces, repair stock and labour.                                                                                                                                          |
| **Outputs / services**                  | Perimeter continuity, movement delay, channelled approaches, patrol boundary, livestock or civilian separation and visible breach points.                                                                                                        |
| **Required blueprint markers**          | Segment sockets, corner and slope compatibility, gate sockets, ground seal, repair points, inside patrol clearance and collision profile.                                                                                                        |
| **Placement and utilities**             | Along an approved perimeter plan that respects roads, water, terrain, future expansion and emergency exits. It should not trap residents or block essential work routes.                                                                         |
| **Construction profile**                | 4 stages per module: layout posts; structural barrier; bracing and connections; inspection/repair points. Large perimeters build by segments rather than one huge timer.                                                                         |
| **Upgrade and branch links**            | Reinforced timber wall, stone wall and gatehouse system, ditch or earthwork attachment, warded palisade or culture-specific living barrier.                                                                                                      |
| **Planner triggers and failure states** | Required in the POC only where the village defence plan calls for a perimeter; otherwise equivalent terrain or cultural defences may validate. Fails through gaps, low terrain clearance, disconnected gates, fire damage or blocked evacuation. |
| **Player-blueprint validation**         | Player modules must connect cleanly, provide real collision/delay, expose breach and repair states and preserve valid paths. Decorative fences cannot claim palisade defence.                                                                    |
| **Culture and style variation**         | Sharpened logs, woven thorn wall, earthen rampart, giant bone fence, living hedge, rune stakes, ice barrier or portable wagon laager.                                                                                                            |

### 74. Village Gate

building.safety.village_gate

| **Catalogue role**                      | Safety / Access Control \| Village \| Medium \| Required \| POC Required                                                                                                         |
|-----------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Safety \| Secondary: Infrastructure                                                                                                                                     |
| **Purpose**                             | Creates a controlled road opening, guard point and defensible connection through an early perimeter.                                                                             |
| **Capacity / service**                  | Draft one main road opening, one or more guard stations and a permission/lock profile. Throughput depends on clear width, mechanism, staffing and traffic.                       |
| **Jobs and users**                      | Gate guards, watch officer, customs or messenger support, patrols and builders or repair workers.                                                                                |
| **Inputs**                              | Gate mechanism, hinges or ropes, keys or permission state, guard equipment, signal/light supplies and repair materials.                                                          |
| **Outputs / services**                  | Controlled access, visitor checks, road continuity, raid chokepoint, curfew or permission enforcement and incident reporting.                                                    |
| **Required blueprint markers**          | Gate opening, inside/outside road sockets, guard positions, gate mechanism, lock/permission point, signal, safe operating clearance and emergency release.                       |
| **Placement and utilities**             | At a connected palisade or equivalent boundary on a real road. Must allow daily traffic, carts where intended and emergency evacuation.                                          |
| **Construction profile**                | 6 stages: foundations/posts; frame; gate leaves or barrier; mechanism; guard/signal positions; road and perimeter inspection.                                                    |
| **Upgrade and branch links**            | Stone gatehouse, customs gate, portcullis system, warded gate or ceremonial city entrance.                                                                                       |
| **Planner triggers and failure states** | Required with the POC palisade. Fails if no perimeter connection, road is blocked, mechanism cannot operate, guards cannot reach positions or permissions lock residents inside. |
| **Player-blueprint validation**         | Must preserve road clearance, actual open/closed states, guard access, perimeter sockets and emergency operation. Decorative archways do not provide access control.             |
| **Culture and style variation**         | Timber gate, wagon gate, thorn arch, dwarven stone door, desert portcullis, fae living arch or rune-sealed threshold.                                                            |

### 75. Barracks and Training Yard

building.safety.barracks_training_yard

| **Catalogue role**                      | Safety / Military \| Fortified Village \| Large \| Optional \| Alpha                                                                                                                       |
|-----------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Safety \| Secondary: Work, Morale                                                                                                                                                 |
| **Purpose**                             | Houses or musters guards, trains replacements and improves readiness for settlements facing repeated threats.                                                                              |
| **Capacity / service**                  | Draft six to twenty-four guard or militia places and several training stations, scaled by valid beds, muster space, instructors, gear and logistics.                                       |
| **Jobs and users**                      | Captain, trainer, guard, militia, recruit, quartermaster, healer support, cook or stable worker where extensions exist.                                                                    |
| **Inputs**                              | Weapons, armour, ammunition, training equipment, food from normal provisions, bedding, medicine, maintenance and orders.                                                                   |
| **Outputs / services**                  | Guard housing or duty accommodation, training, reserve force, faster mobilisation, improved skill/readiness and organised patrol shifts.                                                   |
| **Required blueprint markers**          | Barracks beds or duty bunks, muster point, training zones, briefing station, equipment racks, secure store, sanitation access, road/patrol sockets and optional mess.                      |
| **Placement and utilities**             | Inside a defended district with clear training space and rapid routes to gates, towers and vulnerable areas; noise and weapon clearances must be respected.                                |
| **Construction profile**                | 7-8 stages, allowing muster and training functions to activate before full dormitory or prestige completion.                                                                               |
| **Upgrade and branch links**            | Military academy, cavalry barracks, fort complex, city guard headquarters or culture-specific warrior hall.                                                                                |
| **Planner triggers and failure states** | Selected after repeated raids, guard shortages, population growth or military policy. Underperforms without captain/trainer, gear, valid training space, provisions or patrol connections. |
| **Player-blueprint validation**         | Must expose real safe training zones, muster capacity, equipment and duty accommodation. Decorative targets and beds alone do not increase readiness.                                      |
| **Culture and style variation**         | Militia hall, warrior longhouse, ranger compound, knight barracks, dwarven shield hall, nomad mounted camp or battle-mage training court.                                                  |

### 76. Stone Wall and Gatehouse System

project.defence.stone_wall_gatehouse

| **Catalogue role**                      | Defence / Perimeter Network \| Town \| Network \| Upgrade \| Beta                                                                                                                                                                |
|-----------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Safety \| Secondary: Infrastructure                                                                                                                                                                                     |
| **Purpose**                             | Replaces or reinforces early barriers with durable connected walls, towers, patrol routes and controlled gates suited to siege and town-scale defence.                                                                           |
| **Capacity / service**                  | Coverage derives from connected wall modules, parapet access, towers, gates, foundations, terrain, damage and staffed patrol sectors.                                                                                            |
| **Jobs and users**                      | Masons, builders, engineers, gate crews, guards, archers, repair teams and siege specialists.                                                                                                                                    |
| **Inputs**                              | Stone or equivalent durable material, mortar, timber, metal fittings, mechanisms, scaffolding, tools, labour, guard supplies and repair stock.                                                                                   |
| **Outputs / services**                  | Durable perimeter, patrol walkway, controlled routes, siege delay, tower positions, civilian confidence and visible breach/repair state.                                                                                         |
| **Required blueprint markers**          | Wall sockets, corner/tower sockets, walkable parapet where intended, stairs/access towers, gatehouse interfaces, drainage, foundations, repair anchors and inside/outside clearance.                                             |
| **Placement and utilities**             | Town perimeter plan respecting terrain, roads, rivers, expansion zones, utilities and evacuation. Walls should exploit geography rather than require a perfect circle.                                                           |
| **Construction profile**                | 8-stage modular profile: survey; foundations; lower wall; full wall; parapet/access; towers/gatehouse; mechanisms; inspection. Segments can activate independently.                                                              |
| **Upgrade and branch links**            | City wall complex, layered fortress, warded wall, anti-siege additions, moat/earthworks or realm-specific defensive boundary.                                                                                                    |
| **Planner triggers and failure states** | Triggered by Fortified Village growth, strategic wealth, repeated siege threats or political borders. Fails through disconnected sectors, inaccessible patrols, unstable foundations, blocked gates or insufficient maintenance. |
| **Player-blueprint validation**         | Modules must form a coherent network with real collision, access, height and repair states. Inaccessible decorative battlements cannot provide patrol or ranged capacity.                                                        |
| **Culture and style variation**         | Ashlar curtain wall, dwarven mountain rampart, desert bastion, living-root wall, ice fortress, giant masonry, arcane barrier pylons or terraced cliff defence.                                                                   |

### 77. Armoury

building.safety.armoury

| **Catalogue role**                      | Safety / Equipment \| Fortified Village \| Medium \| Optional \| Alpha                                                                                                                                       |
|-----------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Safety \| Secondary: Infrastructure, Work                                                                                                                                                           |
| **Purpose**                             | Stores, maintains, issues and accounts for guard weapons, armour, ammunition and emergency equipment.                                                                                                        |
| **Capacity / service**                  | Draft equipment sets and secure storage slots based on real racks, containers, quartermaster stations, item condition and permissions.                                                                       |
| **Jobs and users**                      | Quartermaster, armourer or smith support, guard, fletcher, repair worker and commander.                                                                                                                      |
| **Inputs**                              | Weapons, armour, ammunition, shields, repair kits, oils, spare parts, records, locks and maintenance.                                                                                                        |
| **Outputs / services**                  | Guard readiness, rapid issue and return, secure reserves, equipment condition tracking and reduced loss or theft.                                                                                            |
| **Required blueprint markers**          | Secure entrance, equipment racks, ammunition or hazardous store, issue counter, maintenance bench, records, guard access and logistics socket.                                                               |
| **Placement and utilities**             | Near barracks, gatehouse, fort or guard headquarters; protected from fire, theft, flooding and uncontrolled public access.                                                                                   |
| **Construction profile**                | 6 stages: secure shell; reinforced doors; racks/stores; maintenance/issue point; inventory records; inspection and activation.                                                                               |
| **Upgrade and branch links**            | City arsenal, siege store, magical armoury, faction vault or integrated fort supply complex.                                                                                                                 |
| **Planner triggers and failure states** | Selected when guards exist but equipment readiness is low, stock is dispersed or raids justify reserves. Fails without quartermaster permissions, real stock, secure access, safe storage or repair support. |
| **Player-blueprint validation**         | Capacity must map to real secured storage and item types. Decorative weapon displays do not count as available guard equipment.                                                                              |
| **Culture and style variation**         | Shield hall, weapon vault, ranger cache, dwarven arsenal, nomad wagon armoury, rune-locked store or living-wood bow house.                                                                                   |

# 22. Emergency-Service Entries

### 79. Fire and Rescue Station

building.emergency.fire_rescue_station

| **Catalogue role**                      | Emergency / Response \| Town \| Medium \| Optional \| Beta                                                                                                                                             |
|-----------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Safety \| Secondary: Health, Infrastructure                                                                                                                                                   |
| **Purpose**                             | Provides trained response, equipment and dispatch for fires, collapses, floods, accidents and non-military rescue events.                                                                              |
| **Capacity / service**                  | Draft one or more response teams, equipment bays and service coverage based on staffing, water/tools, roads and travel time.                                                                           |
| **Jobs and users**                      | Firefighter, rescuer, engineer, medic, dispatcher, water carrier, animal handler and maintenance worker.                                                                                               |
| **Inputs**                              | Water access, pumps or buckets, ladders, ropes, axes, protective gear, carts or mounts, medicine, alarms and maintenance.                                                                              |
| **Outputs / services**                  | Fire suppression, rescue, inspections, faster emergency response, casualty reduction, road clearing and disaster reports.                                                                              |
| **Required blueprint markers**          | Emergency entrance, equipment bay, water-fill point, dispatch or alarm station, maintenance/drying area, treatment point, crew ready area and priority road socket.                                    |
| **Placement and utilities**             | Central to dense or high-risk districts with reliable water and unobstructed emergency routes; should not be isolated behind market queues or closed gates.                                            |
| **Construction profile**                | 6-7 stages, with equipment bay and dispatch activating before full crew quarters or training extensions.                                                                                               |
| **Upgrade and branch links**            | City emergency headquarters, harbour rescue, mine rescue, magical disaster response or integrated hospital/emergency complex.                                                                          |
| **Planner triggers and failure states** | Selected when density, flammable materials, industry, disasters or incident travel time create Safety pressure. Fails without trained crew, water, tools, alarm, route access or maintained equipment. |
| **Player-blueprint validation**         | Must support rapid exit, equipment loading, water access and safe return/maintenance. Decorative bell towers do not create rescue service.                                                             |
| **Culture and style variation**         | Bucket brigade hall, water-cart house, dwarven mine rescue station, desert cistern brigade, fae growth-healing response or rune-powered fire ward depot.                                               |

### 80. Emergency Shelter or Refuge Bunker

building.emergency.refuge_bunker

| **Catalogue role**                      | Emergency / Civilian Protection \| Town \| Large \| Conditional \| Beta                                                                                                                                                     |
|-----------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Need contribution**                   | Primary: Safety \| Secondary: Housing, Health                                                                                                                                                                               |
| **Purpose**                             | Protects civilians during raids, storms, fires, magical disasters or other temporary emergencies without replacing permanent housing.                                                                                       |
| **Capacity / service**                  | Draft twenty to one hundred or more emergency occupants according to protected volume, exits, air, water, sanitation, provisions and supervision profiles.                                                                  |
| **Jobs and users**                      | Shelter steward, guard, healer, quartermaster, messenger, engineer and temporary evacuees.                                                                                                                                  |
| **Inputs**                              | Emergency food and water, medicine, bedding or seating, lighting, air or ventilation, sanitation supplies, fuel or mana where required and maintenance.                                                                     |
| **Outputs / services**                  | Refuge capacity, organised evacuation, casualty reduction, temporary treatment, family reunification and disaster resilience.                                                                                               |
| **Required blueprint markers**          | Protected occupied volume, multiple safe entrances/exits, muster/registration, sleeping or seating points, provisions, sanitation, treatment, ventilation, guard point and emergency route sockets.                         |
| **Placement and utilities**             | Outside the most likely hazard footprint or engineered against it, reachable from populated districts by more than one route and not dependent on the failed utility it protects against.                                   |
| **Construction profile**                | 7-9 stages depending on earthworks or wards: survey; excavation/foundation; protected shell; exits; ventilation/utilities; stores; treatment/muster; inspection and stocking.                                               |
| **Upgrade and branch links**            | Siege refuge, storm shelter, flood refuge, warded corruption bunker, mountain sanctuary or district shelter network.                                                                                                        |
| **Planner triggers and failure states** | Triggered by siege risk, storms, floods, magical instability, population density or prior casualties. Fails if the hazard profile is wrong, exits block, supplies expire, ventilation fails or capacity is falsely claimed. |
| **Player-blueprint validation**         | Must prove protected capacity, evacuation routes, exits, utilities and stock positions under the intended hazard profile. A deep decorative room cannot count as a bunker by depth alone.                                   |
| **Culture and style variation**         | Cellar refuge, hill fort shelter, cavern sanctuary, raised flood refuge, living-tree cocoon, rune ward vault, mobile evacuation caravan or underground district bunker.                                                     |

# 23. POC Implementation Scope

| **No.** | **Definition**    | **POC Proof**                                                       | **Required Dependencies**                                           |
|---------|-------------------|---------------------------------------------------------------------|---------------------------------------------------------------------|
| 61      | Village Hall      | Request board, permissions, leadership and project approval.        | Leader, clerk/elder role, public access, warehouse/project records. |
| 71      | Guard Post        | Patrol and local response with real guards and equipment.           | Guard NPC, weapon/armour, route and authority.                      |
| 72      | Wooden Watchtower | Visible staged project, early warning and changed raid outcome.     | Builder, resources, guard, signal, sightline and raid event.        |
| 73      | Palisade Segment  | Modular connected perimeter, breaches and repair.                   | Logs/fittings, segment sockets, terrain and builder tasks.          |
| 74      | Village Gate      | Road access, open/closed state, guard position and raid chokepoint. | Palisade connection, road, mechanism, guard and permissions.        |

30. Use the Village Hall to expose the watchtower request, stock requirements, permissions and project benefits.

31. Deliver exact resources to the village warehouse and reserve them by watchtower construction stage.

32. Build the watchtower visibly with NPC builders; activate warning only after the platform, safe access and signal markers pass.

33. Assign the guard from the Guard Post to patrol and use the completed tower.

34. Build connected Palisade Segments and a Village Gate while preserving roads, work access and evacuation.

35. Trigger the goblin raid once with the defence incomplete and once with it complete or repaired.

36. Compare warning time, guard mobilisation, injuries, stolen goods, breaches and building damage.

37. Create persistent repair projects, village history, dialogue, morale and reputation changes after the raid.

38. Save, unload, abstract-resolve or advance time, reload and verify resources, NPC identity, damage, guard state, project history and permissions remain correct.

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr class="header">
<th><p><strong>POC Success</strong></p>
<p>The POC succeeds only if the same goblin threat creates visibly different preparation, combat and aftermath outcomes while conserving resources and preserving named NPCs, damage and history.</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

# 24. Balancing and Simulation LOD

| **Range**                   | **Simulation**                                                                                                                                                |
|-----------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Near player                 | Visible officials, guards, witnesses, gates, alarms, construction, firefighting, evacuation and combat. Expensive senses/pathfinding are budgeted.            |
| Local loaded settlement     | Patrol zones, service queues, readiness, incidents, wall/gate states and emergency routes update at bounded intervals or events.                              |
| Distant settlement          | Threat and incident stages resolve from staffing, gear, warning, perimeter, supplies, law and risk summaries; named casualties, judgments and damage persist. |
| Very distant/inactive realm | Multi-hour or daily event summaries with resource conservation, bounded risk and explicit promotion when the settlement becomes relevant.                     |

- Safety summaries update on relevant state changes and slow settlement ticks, not every frame.

- Line-of-sight, crowd routing and detailed guard senses run only where needed; distant coverage uses validated markers and cached sectors.

- Patrol frequency and incident probability should create readable risk without constant random interruptions.

- Walls and towers use diminishing returns, maintenance and coverage sectors to prevent brute-force spam.

- Crime generation should be low enough that cases feel like world events or meaningful local problems rather than daily paperwork.

- Emergency services should matter most in dense, hazardous or high-difficulty settlements and remain optional or simplified in peaceful settings.

- Any abstraction that invents or deletes people, equipment, stock, damage or legal outcomes is a redesign trigger.

# 25. Open Questions for Later Balancing

- Final guard-to-population and patrol-coverage bands by difficulty, settlement stage and culture.

- Default warning-time, sightline and tower-overlap values after voxel terrain tests.

- How often ordinary crime should occur and which incidents are simulated versus generated as quests/events.

- Law severity, fines, restitution, detention and exile defaults by culture without forcing modern or universal assumptions.

- Tax, toll and customs rates after the economy and trade simulation is playable.

- Wall, gate, fire and siege damage values after combat, creature and voxel destruction tests.

- Emergency shelter occupancy, supply duration and hazard-specific protection bands.

- Whether dedicated prisons, police/watch houses, military hospitals or national courts justify new universal definitions after the 120-entry cap review.

- How player rulership, elections, coups, rebellion and occupation interfaces should expand beyond the shared governance foundation.

- Which automated alarms, turrets, wards and magical emergency systems belong in 20E versus culture/realm variants in 20G.

# Appendix A. 20C Data Field Template

| **Field Group**  | **Required Fields**                                                                                                                 |
|------------------|-------------------------------------------------------------------------------------------------------------------------------------|
| Identity         | catalogue_no, stable_id, display_name_key, family, category, owner_document, version, scope/design status                           |
| Progression      | earliest_stage, project_class, prerequisites, unlocks, upgrade_from/to, branch_tags, culture/faction gates                          |
| Needs            | primary_need, secondary_needs, safety contribution tags, morale/health/infrastructure effects                                       |
| Governance       | authority requirements, office roles, law_profile links, permission_profile, public/private zones, legitimacy/faction links         |
| Justice/incident | report types, witness/evidence hooks, case capacity, response authority, holding profile, resolution outputs, history fields        |
| Defence          | coverage profile, warning/signal, guard stations, patrol sockets, perimeter sockets, breach states, gate/lock rules, refuge profile |
| Operation        | staff min/target/max, tools/equipment, inputs, outputs/services, queues, routes, service radius, blockers                           |
| Blueprint        | size class, bounds, required/optional markers, public/secure zones, sockets, sightline/egress/terrain rules, palette tokens         |
| Construction     | stage profile, resource calculation, labour roles, partial activation, damage, capture, repair and conversion                       |
| Simulation       | near events, distant summary fields, readiness cache, incident history, save records, promotion/demotion rules                      |
| Presentation     | icon, UI category, warnings, inspection text, map overlay, codex links and planning notes                                           |

# Appendix B. Governance, Incident and Defence Matrix

| **Function**             | **Primary Physical Anchor**        | **Key Inputs**                             | **Key Output / Consequence**                           |
|--------------------------|------------------------------------|--------------------------------------------|--------------------------------------------------------|
| Requests and permissions | Village Hall / Town Hall           | Leader, clerk, records, public access      | Approved services, laws, projects and visible reasons. |
| Blueprint approval       | Blueprint Office / Planning Office | Plan, parcel, validation, authority        | Approved or rejected project with exact blockers.      |
| Dispute or crime         | Court / recognised authority       | Report, witness/evidence, law, staff       | Judgment, restitution/fine/penalty and history.        |
| Diplomacy                | Embassy / leader reception         | Envoy, documents, security, hospitality    | Treaty, relation change, quest or incident.            |
| Patrol response          | Guard Post                         | Guards, gear, route, orders                | Coverage, deterrence, response and reports.            |
| Warning                  | Watchtower / signal chain          | Guard, sightline, signal                   | Earlier alert and mobilisation.                        |
| Perimeter delay          | Palisade / wall / gate             | Materials, connections, condition, guards  | Delay, channel, access and visible breach.             |
| Readiness supply         | Armoury / Barracks                 | Equipment, training, staff, provisions     | Prepared guards and reserve force.                     |
| Fire/rescue              | Response Station                   | Crew, water, tools, route, alarm           | Suppression, rescue and reduced casualties.            |
| Civilian refuge          | Shelter/Bunker                     | Protected capacity, exits, supplies, staff | Evacuation, temporary safety and recovery.             |

# Appendix C. POC Acceptance Checklist

- Village Hall request and permission state is visible and authoritative.

- Watchtower blueprint exposes stage resources, builders, progress and blockers.

- Guard Post assigns a named guard with actual equipment and patrol route.

- Watchtower line-of-sight and signal validation changes warning time.

- Palisade modules connect, take damage, create breaches and can be repaired.

- Village Gate opens/closes, preserves road access and connects to guard/perimeter logic.

- Incomplete and complete defence produce different raid mobilisation, casualties, theft and damage.

- No defence service is credited from decoration alone or from an unstaffed/inaccessible structure.

- Raid aftermath creates persistent injuries, deaths where applicable, damage, repair, morale, dialogue, reputation and history.

- Save/load and distant simulation preserve exact project stock, guard identity, equipment, structure condition and event result.

# Appendix D. Cross-System Dependency Matrix

| **20C Area**      | **Primary Dependencies**                             | **Required Contract**                                                                     |
|-------------------|------------------------------------------------------|-------------------------------------------------------------------------------------------|
| Governance        | 07 NPC, 13 Factions, 15 Quests, 17 UI, 19 Blueprints | Stable authority, laws, permissions, decisions, records and player-facing reasons.        |
| Justice           | 07 NPC, 13 Factions, 15 Events, 16 Combat            | Witness/evidence, law, response, proportional consequence and persistent history.         |
| Guard readiness   | 04 Items, 07 NPC, 10 Creatures, 16 Combat            | Named guards, real equipment, threat targets, orders, casualties and aftermath.           |
| Fortifications    | 03 Blocks, 12 Structures, 16 Combat, 19 Blueprints   | Connected modules, collision, damage, gates, access, repair and terrain fit.              |
| Customs/diplomacy | 07 NPC, 13 Factions, economy/trade, 15 Events        | Routes, manifests, envoys, treaties, ownership and consequences.                          |
| Fire/rescue       | 03 Blocks, 07 NPC, 11 Worldgen, 16 Combat/Defence    | Hazard source, alarms, tools, routes, water, injuries, damage and recovery.               |
| Refuge            | 20A Health/Housing, 20D Utilities/Routes, 20E Magic  | Protected temporary capacity, supplies, exits, sanitation, hazard profile and evacuation. |
| Player blueprints | 19 Blueprint System, 20 Master, 20H Catalogue        | Definition validation, markers, parcels, resources, construction, ownership and saves.    |
