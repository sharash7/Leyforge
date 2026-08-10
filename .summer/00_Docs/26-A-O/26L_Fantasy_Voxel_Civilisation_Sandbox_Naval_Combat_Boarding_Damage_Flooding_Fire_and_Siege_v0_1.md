# FANTASY VOXEL CIVILISATION SANDBOX

## DOCUMENT SET 26

# 26L - Naval Combat, Boarding, Damage, Flooding, Fire and Siege

*Version 0.1 - Detailed Design Bible and Technical Foundation Draft*

A tactical maritime-conflict framework for encounter intent, ship-mounted weapons, firing solutions, ramming, structure-aware damage, compartment breaches, flooding, fire, smoke, explosions, damage control, boarding, surrender, capture, rescue, sinking, coastal batteries, harbour defence, fleet engagements, simulation LOD and persistent aftermath.

Working design document - naval combat, vessel damage, boarding, damage control and maritime siege foundation

| Field | Locked Direction |
| --- | --- |
| Document Role | Document 26L is the gameplay and data-contract authority for the physical resolution of maritime combat encounters involving vessels, crews, weapons, boarding, structure damage, flooding, fire, surrender, capture, sinking and coastal siege. |
| Core Philosophy | Naval combat must reward preparation, seamanship, positioning, crew organisation, vessel design, intelligence and objective choice. Destroying the opposing vessel is one valid result, not the universal objective. |
| Encounter Direction | Tactical encounters begin from valid strategic context supplied by 26K, environmental conditions supplied by 26D and operational vessel state supplied by 26F-26G. 26L resolves the physical encounter and returns authoritative outcomes. |
| Damage Direction | Damage resolves through impact location, damage type, material and shape properties, structural roles, components, compartments, occupants and current condition. It must not collapse into one abstract vessel health bar. |
| Flooding Direction | Breaches create compartment-local water ingress through 26B fluid interfaces. Flooding changes mass, trim, stability, access, machinery and survival while preserving bounded performance rules. |
| Fire Direction | Fire, smoke, heat and explosions use tagged propagation and compartment ventilation rather than unconstrained per-voxel simulation. Crew action, pumps, closures, suppression tools and weather matter. |
| Boarding Direction | Boarding is a transition from vessel manoeuvre into character combat across real decks, compartments, routes and control stations. Grappling or contact does not instantly transfer ownership. |
| Victory Direction | Escape, escort completion, blockade running, rescue, disabling, surrender, capture, objective denial, survival and negotiated withdrawal are first-class outcomes alongside destruction. |
| Repair Boundary | 26L owns emergency damage control during and immediately after combat. Document 26H owns proper repair, refit, restoration, salvage and long-term shipyard work. |
| Strategic Boundary | 26K owns interception intent, fleet mission, law, prize claims, economic effects and regional consequences. 26L returns evidence and physical results without independently deciding diplomacy or market outcomes. |
| Ecology Boundary | 26M owns sea-creature combat profiles, ecology, fishing and marine boss content. 26L provides vessel-combat interfaces those encounters may use. |
| Technical Direction | Implement in Godot using authoritative combat commands, sparse vessel-local damage records, bounded compartment simulation, deterministic abstract encounter resolution and promotion to physical combat near players. |
| Production Direction | All identities, capabilities, relationships, extension facets, reason codes, evidence, package dependencies and migration rules follow Document Set 25 governance. |

# DOCUMENT SET 26 - OCEANS, MARITIME CIVILISATION, VESSELS AND NAVAL SYSTEMS EXPANSION

# Document Purpose

Document 26L defines how Leyforge resolves maritime violence when strategy becomes physical. Documents 26F through 26K establish what a vessel is, how it moves, how it is built, where it is serviced, who crews it, why it travels and why two forces meet. Document 26L begins at the moment manoeuvre, warning, coercion, collision, weapons or boarding require an authoritative tactical outcome.

The system must preserve the project's voxel and civilisation identity. A cannonball, bolt, spell, ram or creature strike does not merely subtract points from a generic ship bar. It strikes a particular region, interacts with actual material and structural roles, may break a closure or component, may open a compartment to water, may injure crew, may start a fire and may alter propulsion, steering, visibility or morale. The result remains explainable and repairable because the world remembers what was damaged.

Naval combat is not designed as a compulsory destruction loop. A merchant may escape. An escort may hold attackers away until refugees reach harbour. A patrol may identify and compel surrender without firing. A pirate may take cargo and leave the vessel afloat. A player may disable propulsion, rescue survivors, capture an officer, break a blockade, defend a lighthouse or withdraw after completing a reconnaissance objective. The encounter system therefore evaluates declared objectives and persistent consequences rather than awarding victory only for sinking opponents.

This document also protects scale. Nearby combat uses physical vessels, projectiles, crew stations, compartments and character movement. Distant fleets use deterministic evidence-backed summaries based on the same definitions, readiness and tactical policies. Promotion and demotion preserve damage, ammunition, casualties, flooding, fire, prisoners, ownership claims and history. No distant abstraction may create a result that the physical model could not represent.

# Design Sources, Authority and Supersession

| Source | Authority Consumed by 26L | 26L Boundary |
| --- | --- | --- |
| 00-02 - Master, Loop and Progression | Sandbox freedom, multiple player roles, readable progression, consequences and scalable difficulty. | Combat supports fighters, captains, engineers, healers, rescuers, traders and peaceful players without becoming mandatory progression. |
| 03-06 - Blocks, Items, Recipes and Resources | Material properties, item identities, ammunition, tools, consumables, recipes, durability and conserved resources. | 26L defines combat-facing facets and transactions; it does not invent duplicate item or recipe systems. |
| 07-10 - NPCs, Automation, Magic and Creatures | Persistent NPC identity, work, morale, power, mana, spells, wards, creature actions and near/far simulation. | Crew and creatures use shared entity foundations; 26L adds maritime roles and tactical interactions only. |
| 11-16 - World, Structures, Factions, Dimensions, Quests and Combat | Terrain, structures, law, factions, realm hazards, event graphs and personal combat rules. | 26L extends the existing combat foundation into moving voxel vessels and maritime objectives without replacing land combat. |
| 17 - UI/UX | World-first presentation, progressive disclosure, accessibility, controller and split-screen requirements. | 26L declares maritime combat information and control requirements; final consolidation belongs to 26O. |
| 19-20 - Settlement and Building Systems | Structural instances, damage, services, defences, real resources and activation contracts. | Coastal batteries, harbour defences and damaged port structures use existing building truth. |
| 24 - World Content Atlas | Named factions, fleets, sea monsters, fortresses, wars, relic weapons and authored encounters. | 26L provides executable contracts and does not replace final authored content. |
| 25A-25L - Production Governance | Qualified IDs, schemas, packs, relationships, capabilities, migration, validation and release evidence. | Every 26L definition and extension enters through governed registries and release gates. |
| 26B - Water and Fluid Simulation | Water volumes, ingress, local flooding, pumps, drainage and liquid persistence. | 26L creates breaches and tactical requests; 26B performs bounded liquid behaviour. |
| 26C-26D - Marine World and Climate | Depth, shoreline, currents, waves, tides, storms, visibility, surge and ice. | 26L consumes the current environment and does not simulate a separate ocean. |
| 26E - Swimming and Diving | Character water movement, drowning, rescue, towing and underwater interaction. | Man-overboard, flooded-compartment and survivor actions call 26E capabilities. |
| 26F - Vessel Architecture | Vessel-local voxels, structural roles, compartments, components, identity and commissioning. | 26L applies damage to those records and cannot silently redefine structure. |
| 26G - Movement and Navigation | Buoyancy, stability, propulsion, steering, grounding, anchoring and movement authority. | 26L changes inputs such as mass, damage and component state; 26G resolves resulting motion. |
| 26H - Shipwright Work | Construction, repair, refit, salvage, tools and shipyard lifecycle. | 26L owns temporary patches and combat damage state; 26H owns permanent restoration. |
| 26I - Vessel Forge | Blueprint source, roles, components, damage variants and test laboratories. | 26L consumes authored combat markers and produces validation requirements. |
| 26J - Ports and Crews | Crew identity, stations, readiness, ports, rescue, firefighting and harbour services. | 26L uses operational crews and port defences; it does not duplicate port administration. |
| 26K - Trade and Regional Power | Missions, interception, fleet organisation, piracy, naval law, prizes and strategic aftermath. | 26L resolves tactical encounter evidence and returns results to 26K. |

# Static Table of Contents

1. Locked Naval Combat Identity  
2. Design Principles and Experience Targets  
3. Explicit Non-Goals  
4. Source-of-Truth and Ownership Boundaries  
5. Canonical Terminology  
6. Tactical Encounter Lifecycle  
7. Objectives, Victory, Defeat and Withdrawal  
8. Tactical Space, Promotion and Encounter Boundaries  
9. Detection, Identification, Warning and Engagement  
10. Command, Crew Stations and Tactical Orders  
11. Naval Weapon Architecture  
12. Projectile, Thrown and Mechanical Weapons  
13. Magical, Runic and Realm Weapons  
14. Ammunition, Loading, Power, Heat and Misfire  
15. Firing Arcs, Fire Control, Aiming and Ballistics  
16. Ramming, Collision and Contact Damage  
17. Impact Resolution and Damage Packets  
18. Structural Damage, Connectivity and Collapse  
19. Component, Network and Control Damage  
20. Breaches, Compartments and Water Ingress  
21. Flooding, Pumps, Counter-Flooding and Stability  
22. Fire, Smoke, Heat and Explosion  
23. Damage-Control Organisation and Emergency Work  
24. Crew Injury, Morale, Fatigue and Casualties  
25. Boarding Initiation and Contact  
26. Grappling, Breaching and Access Routes  
27. Boarding Combat, Control Zones and Ship Control  
28. Surrender, Capture, Prisoners and Prize Crews  
29. Rescue, Abandon Ship and Survivor Handling  
30. Capsizing, Sinking, Scuttling and Wreck Transition  
31. Coastal Batteries, Harbour Defence and Siege  
32. Mines, Booms, Barriers and Area Denial  
33. Fleet Combat, Formations and Command Coordination  
34. NPC Tactics, Doctrine and Rules of Engagement  
35. Weather, Sea State, Visibility and Environmental Hazards  
36. Magic, Automation, Wards and Countermeasures  
37. Law, Reputation, Friendly Fire and Atrocity Prevention  
38. Progression, Research, Training and Balance  
39. Quests, Events and Persistent World Consequences  
40. UI/UX, Controls and Accessibility  
41. Multiplayer, Authority and Split-Screen  
42. Simulation LOD and Abstract Encounter Resolution  
43. Persistence, Save Recovery and Migration  
44. Godot/Summer Engine Technical Architecture  
45. Set 25 Registry and Governance Integration  
46. Performance Budgets and Scalability  
47. Prototype Laboratories and Acceptance Tests  
48. Risks, Failure Modes and Redesign Triggers  
49. Production Classification and Main-Document Integration  
50. Decision Register  
51. Handoff to Document 26M  
Appendix A. Core Runtime Record Templates  
Appendix B. Weapon, Damage and Defence Facet Templates  
Appendix C. Reason-Code and Validation Catalogue  
Appendix D. Tactical Scenario Catalogue  
Appendix E. Acceptance Matrix  
Appendix F. Document Completion Checklist

# 1. Locked Naval Combat Identity

The Naval Combat, Boarding, Damage, Flooding, Fire and Siege System is the tactical consequence layer for Leyforge's maritime expansion. It converts strategic intent and physical vessel state into readable action, persistent damage, survival decisions and world history.

> **Locked Rule**
>
> A vessel is never defeated solely because an invisible universal health value reached zero. Defeat, disablement, capture, sinking and escape emerge from actual structure, systems, crew, environment, objectives and authority.

| Identity Layer | Design Meaning | Player-Facing Result |
| --- | --- | --- |
| Objective-Led Conflict | Encounters begin with missions, demands, risks and exit conditions. | The player may win by escorting, escaping, rescuing, disabling, capturing or surviving. |
| Physical Consequence | Hits affect real vessel regions, components, compartments and people. | Damage is understandable, visible, repairable and persistent. |
| Crew-Centred Operation | Weapons and damage control require stations, routes, supplies and trained people. | Preparation and organisation matter as much as raw weapon strength. |
| Maritime Environment | Wind, waves, currents, tide, visibility, depth and ice shape tactics. | The same vessels fight differently in a river, harbour, storm or open sea. |
| Combined Sandbox Systems | Crafting, automation, magic, NPCs, buildings, quests and law all participate. | Combat remains connected to the wider civilisation game. |
| Scalable Authority | Near encounters are physical; distant encounters use evidence-backed summaries. | Large worlds can sustain conflict without losing vessel identity. |
| Persistent Aftermath | Wrecks, prisoners, damage, shortages, memorials and political reactions remain. | Naval conflict changes the world rather than resetting after a battle. |

## 1.1 Combat Promise

A player looking at a damaged vessel should be able to answer: where was it hit, what failed, which compartment is flooding, what crew are doing, what supplies remain, which objective is still possible and what will happen if no action is taken. Uncertainty may exist because of smoke, darkness, poor reports or hidden damage, but the system must never conceal its rules behind arbitrary outcomes.

## 1.2 Role Freedom

Naval encounters support captain, helmsman, navigator, gunner, mage, engineer, damage-control leader, medic, marine, diver, rescuer, fleet commander and independent adventurer roles. Solo players may use NPC delegation and assistance; multiplayer groups may divide stations. No one role is required to enjoy maritime content on reduced-complexity settings.

# 2. Design Principles and Experience Targets

- **Objectives before annihilation:** each encounter defines what participants are trying to accomplish and when they should withdraw.
- **Location matters:** impact region, material, structural role, compartment and component determine consequences.
- **Crew action matters:** loading, aiming, pumping, firefighting, repair, medical care and boarding require time, routes and people.
- **Damage is persistent:** temporary combat abstraction must resolve into saved voxel, component, inventory and entity state.
- **Counterplay is readable:** weapons, magic, ramming, fire and boarding expose warnings, arcs, ranges, costs and counters.
- **Environment is tactical:** weather and sea conditions create opportunities without making outcomes random or unreadable.
- **Magic extends rather than erases:** wards, runic weapons and elemental effects use the same capability and consequence framework.
- **No ancestry doctrine:** tactics, courage and weapon skill belong to training, culture, faction, profession and individual state.
- **Peaceful play remains valid:** combat can be disabled or reduced while rescue, escort, hazards and maritime exploration remain.
- **Abstraction remains auditable:** distant outcomes record seeds, inputs, policies, modifiers, losses and evidence.

## 2.1 Experience Bands

| Band | Expected Experience |
| --- | --- |
| Personal Defence | Repel small attackers, protect a fishing boat, rescue crew and learn basic damage control. |
| Armed Voyage | Operate a few weapons, manage ammunition and choose between fighting, fleeing or surrendering. |
| Ship Combat | Coordinate helm, weapons, sails or engines, damage control and boarding on a commissioned vessel. |
| Convoy Defence | Protect multiple civilian ships, manage formation, signals and threat priorities. |
| Coastal Siege | Attack or defend batteries, harbour barriers, docks, lighthouses and supply routes. |
| Fleet Command | Coordinate squadrons, reserves, pursuit, withdrawal, rescue and strategic objectives. |
| Realm Conflict | Apply the same foundations to magical waters, dimensional hazards and authored high-tier threats. |

# 3. Explicit Non-Goals

- Simulating real-world naval architecture, ballistics, fluid dynamics or fire chemistry at engineering fidelity.
- Requiring one physics body, damage component or script per voxel.
- Turning every block into a destructible fragment during routine combat.
- Replacing existing character combat with a separate incompatible boarding combat game.
- Making all ships carry weapons or forcing peaceful players into naval warfare.
- Granting instant control of a vessel when one hostile character reaches the deck.
- Using random critical hits to bypass visible structure, armour, compartments and counterplay.
- Allowing fire or flooding to spread indefinitely through unloaded worlds without bounded simulation.
- Treating surrender, prisoners, rescue or civilian harm as consequence-free loot mechanics.
- Defining final named weapon rosters, faction doctrines or boss encounters before Atlas and 26N integration.
- Replacing 26H repair and salvage with combat-screen buttons that restore the vessel for free.
- Letting distant combat delete a player vessel without preserved evidence, world settings and recovery rules.

# 4. Source-of-Truth and Ownership Boundaries

| Question | Owning Authority | 26L Responsibility |
| --- | --- | --- |
| Why did forces meet and what is each side trying to do? | 26K and Quest/Event. | Consume encounter context and expose tactical objective state. |
| What blocks, materials and components form the vessel? | 26F and registries. | Apply damage through declared facets and local coordinates. |
| How does the vessel move after damage? | 26G. | Provide changed mass, thrust, steering, drag and stability inputs. |
| How does water enter or leave a compartment? | 26B. | Create breach, pump, seal and flooding requests with combat priority. |
| How do characters swim, drown or rescue others? | 26E. | Invoke aquatic capability and expose combat hazards. |
| How are permanent repairs completed? | 26H. | Record damage, temporary patches and required follow-up work. |
| Which weapon or defence definitions exist? | Core registries, 26N and approved packs. | Define combat extension facets and runtime use. |
| How are personal attacks and injuries resolved? | Document 16. | Reuse personal combat rules and add moving-vessel context. |
| Who owns a captured vessel and what law applies? | 26K/faction law. | Return control evidence, surrender terms and custody state. |
| How are ports, crews and rescue services organised? | 26J. | Consume operational stations and notify service consequences. |
| What named encounters, factions or creatures exist? | Atlas Set 24. | Provide contracts only. |
| What final UI/network architecture ships? | 26O. | Declare requirements and preliminary boundaries. |

# 5. Canonical Terminology

| Term | Definition |
| --- | --- |
| Tactical Encounter | Authoritative bounded conflict record linking participants, environment, objectives, authority and outcomes. |
| Engagement State | Current phase such as contact, warning, pursuit, exchange, boarding, withdrawal or aftermath. |
| Combatant | Vessel, structure, creature or entity authorised as an encounter participant. |
| Rules of Engagement | Data policy limiting targets, escalation, surrender response, civilian protection and weapon use. |
| Weapon Mount | Physical or semantic attachment with orientation, traverse, elevation, crew, ammunition, power and structural support. |
| Weapon Action | Versioned firing, striking, casting, launching or deploying behaviour. |
| Fire-Control Solution | Bounded estimate of aim, lead, range, target motion, environment and confidence. |
| Damage Packet | Authoritative description of delivered force/effect before target resolution. |
| Impact Record | Persistent evidence of contact location, target layers, absorbed energy/effect and resulting changes. |
| Damage Group | Sparse vessel-local set of affected voxels/components sharing cause, state and repair relationship. |
| Breach | Opening or failed boundary connecting a compartment to water, air, fire or another space. |
| Flooding State | Compartment-local water quantity, ingress rate, outflow, pump capacity and hazard state. |
| Fire Zone | Bounded area with fuel, heat, smoke, spread potential and suppression state. |
| Damage-Control Task | Authoritative emergency work order for sealing, bracing, pumping, firefighting, rescue or isolation. |
| Boarding Link | Temporary physical relationship enabling movement between vessels or vessel and structure. |
| Control Zone | Vessel region whose effective control depends on present forces, access, stations and resistance. |
| Surrender Record | Terms, authority, time, participants, restrictions and accepted obligations. |
| Prize Crew | Authorised personnel assigned to control and navigate a captured vessel. |
| Disablement | Loss of a declared capability such as propulsion, steering, weapon operation or command without necessarily sinking. |
| Foundering | Progressive loss of seaworthiness caused by flooding, stability loss, structural failure or environment. |
| Wreck Transition | Identity-preserving conversion from active Vessel Instance to disabled, sunk, grounded or salvageable world state. |
| Abstract Encounter | Distant deterministic combat summary using the same definitions and preserved evidence. |

# 6. Tactical Encounter Lifecycle

A Tactical Encounter is a persistent state machine rather than a temporary combat arena that vanishes after resolution.

| Phase | Purpose | Required Outputs |
| --- | --- | --- |
| Context Assembly | Bind mission, participants, law, environment, knowledge and objectives. | Encounter ID, authority, rules, initial readiness and confidence. |
| Contact | Detect or become aware of another force or threat. | Contact quality, identification confidence, warning options. |
| Escalation | Signal, challenge, pursue, threaten, manoeuvre or prepare weapons. | Intent changes, station assignments, readiness commitments. |
| Exchange | Resolve weapons, ramming, creature attacks or environmental effects. | Impact, damage, ammunition, crew and position records. |
| Boarding/Close Action | Create contact links and personal combat spaces. | Boarding links, control zones, prisoner and station state. |
| Decision | Continue, surrender, withdraw, rescue, scuttle or complete objective. | Orders, terms, abort conditions and pursuit state. |
| Resolution | Determine objective outcomes and participant end states. | Victory/defeat/neutral outcome, ownership evidence, casualties. |
| Immediate Aftermath | Rescue, firefighting, pumping, temporary repair and evidence capture. | Survivor groups, damage-control tasks, hazard state, loot custody. |
| Strategic Return | Hand evidence to 26K, quests, ports and world history. | Economic, legal, political and service consequences. |

## 6.1 Transaction Rule

Encounter creation, participant promotion, objective acceptance and final resolution must be atomic where they cross persistent systems. A crash cannot leave a vessel simultaneously inside a distant voyage and a physical encounter, duplicate ammunition between summaries and inventories, or lose prisoners because a boarding phase was interrupted.

# 7. Objectives, Victory, Defeat and Withdrawal

Each side enters with one or more declared objectives. Objectives may change when command, intelligence or world state changes, but the change must be recorded.

| Objective Family | Examples | Success Evidence |
| --- | --- | --- |
| Transit | Escape, blockade run, deliver cargo, reach harbour, cross a strait. | Protected entity passes a valid boundary or arrives. |
| Protection | Escort convoy, defend refugees, guard a port, protect a flagship. | Protected assets survive or complete their route. |
| Interdiction | Stop, inspect, delay, turn back, seize cargo or prevent landing. | Target halted, diverted, boarded, captured or deadline missed. |
| Combat | Disable propulsion, silence weapons, drive off attackers, sink a target. | Required capabilities lost or target withdraws/founders. |
| Capture | Take vessel, officer, cargo, documents, creature or position. | Control and custody requirements satisfied. |
| Rescue | Recover survivors, tow a vessel, extinguish fire or evacuate civilians. | Named/grouped persons reach safe custody. |
| Reconnaissance | Identify force, map defences, observe weapon use or survive contact. | Knowledge record reaches required confidence. |
| Siege | Break harbour access, destroy battery capability, protect a landing or deny supplies. | Structure/service or route condition met. |
| Survival | Endure a storm, monster attack or ambush until aid or daylight. | Time/condition threshold reached with required survivors. |

## 7.1 Outcome Classes

- **Decisive success:** primary objective achieved with sustainable control or safe withdrawal.
- **Qualified success:** objective achieved with losses, unresolved hazards or later obligations.
- **Mutual disengagement:** neither side completes a decisive objective and both withdraw.
- **Partial failure:** some protected assets or secondary goals are lost while the main force survives.
- **Defeat:** primary objective is denied and the force must withdraw, surrender or loses control.
- **Catastrophic loss:** widespread casualties, capture, sinking or strategic failure; never inferred only from one meter.

## 7.2 Withdrawal

Withdrawal is an active tactical process. It considers propulsion, steering, route, weather, pursuer capability, smoke, screening, tow links, wounded, abandoned craft and objective obligations. An order to withdraw may fail because the vessel cannot manoeuvre, but the UI must explain the blocker.

# 8. Tactical Space, Promotion and Encounter Boundaries

Physical encounters occur inside ordinary streamed world space whenever practical. The system avoids separate non-persistent battle maps for normal maritime conflict.

| Boundary | Rule |
| --- | --- |
| Promotion Radius | Vessels, crew and relevant structures promote from summaries before player interaction can affect them. |
| Encounter Envelope | Bounded by participant speed, sensor range, weapons, terrain, weather and objective; not a visible artificial wall. |
| Streaming Priority | Combat participants, projectiles, boarding links, damage-control compartments and escape routes receive priority. |
| Reinforcement Entry | Reinforcements enter through valid world routes and timing, not by spawning beside the player. |
| Disengagement | Participants may leave the physical envelope and return to route/fleet summaries only after reconciliation. |
| Persistence | Wrecks, debris, survivors, fires and damage remain in the world or bounded summaries after combat. |

## 8.1 No Safe Unload Exploit

Unloading, leaving render range or disconnecting cannot freeze flooding, fire, pursuit or boarding in a favourable state. Authority demotes the encounter only when all high-detail requirements are represented by deterministic summary records.

# 9. Detection, Identification, Warning and Engagement

Detection and identification build on 26D visibility, 26G navigation knowledge and 26K intelligence.

| Layer | Inputs | Result |
| --- | --- | --- |
| Presence Detection | Vision, sound, wakes, lights, smoke, magic signatures, reports. | Contact exists with position uncertainty. |
| Classification | Silhouette, speed, signal, flag, magic, known route, behaviour. | Probable vessel/creature/structure family. |
| Identification | Registry, recognised vessel, transponder/signal, documents, close observation. | Named identity and faction confidence. |
| Intent Assessment | Heading, weapon readiness, challenge response, mission context. | Threat confidence and recommended response. |
| Legal Authority | Jurisdiction, war state, commission, warrant, treaty and target status. | Permitted actions and warning obligations. |

Combat may begin through surprise, hostile contact, failed inspection, deliberate challenge, collision, creature attack, environmental crisis or mutual agreement such as training. Weapons can be readied without firing; readiness itself may alter morale, law and diplomacy.

# 10. Command, Crew Stations and Tactical Orders

The vessel remains operated through 26J crew stations. Combat adds urgency, command hierarchy and tactical order profiles.

| Station/Role | Core Combat Responsibilities |
| --- | --- |
| Captain/Commander | Objective, escalation, formation, withdrawal, surrender and priority decisions. |
| Helm | Heading, speed, manoeuvre, collision avoidance, ramming and boarding approach. |
| Navigator/Pilot | Depth, current, tide, hazards, escape routes and position confidence. |
| Gunnery/Weapon Lead | Target allocation, ammunition, fire-control policy and safety arcs. |
| Weapon Crew | Traverse, load, aim, fire, cool, clear faults and secure ammunition. |
| Engineer/Mechanist | Propulsion, power, steering, pumps, isolation and emergency rerouting. |
| Damage-Control Lead | Survey, prioritise, assign sealing, bracing, firefighting and rescue. |
| Mage/Runesmith | Wards, magical weapons, counters, mana allocation and instability control. |
| Medic | Triage, treatment, evacuation and casualty reporting. |
| Marines/Boarders | Repel or conduct boarding, protect stations and secure prisoners. |
| Signal Crew | Identification, warnings, fleet coordination and distress messages. |

## 10.1 Orders and Delegation

Orders are high-level intents such as `hold fire`, `target propulsion`, `brace for impact`, `seal lower compartments`, `prepare boarding`, `protect civilians`, `withdraw under smoke` or `abandon ship`. NPC execution depends on skill, morale, route access, station condition, tools and communication. Players may directly operate a station without erasing command authority for the rest of the vessel.

# 11. Naval Weapon Architecture

All naval weapons extend a shared Weapon Definition and Weapon Mount contract.

| Layer | Responsibility |
| --- | --- |
| Weapon Definition | Identity, action profile, damage packets, resource use, crew, cooldown, failure and capability tags. |
| Mount Definition | Attachment, support, traverse, elevation, firing arc, recoil path, access and maintenance. |
| Runtime Weapon Instance | Condition, loaded ammunition, heat, charge, faults, assigned crew and current target. |
| Fire-Control Policy | Targeting priority, permitted aim points, salvo logic, conservation and friendly-fire constraints. |
| Presentation Hooks | Animation, recoil, sound, flash, smoke, projectile and impact sockets. |

> **Weapon Capability Rule**
>
> A decorative cannon-like object, spell focus or launcher provides no combat capability unless it resolves an approved definition, valid mount, support, crew access, resources and current operational state.

## 11.1 Weapon Families

- Direct projectile weapons.
- Arcing projectile and bombardment weapons.
- Bolt, harpoon and tether launchers.
- Thrown, dropped or deployed devices.
- Ramming and contact weapons.
- Magical beams, bolts, waves and ritual batteries.
- Creature-mounted or summoned attacks where 26M authorises them.
- Defensive interceptors, wards and countermeasure launchers.

# 12. Projectile, Thrown and Mechanical Weapons

Projectile simulation is chosen by importance and range.

| Mode | Use | Authority |
| --- | --- | --- |
| Full Projectile | Near players, visible shots, important collisions and boarding weapons. | Authoritative trajectory with client prediction/presentation. |
| Segmented Trajectory | Medium range or high-volume exchange. | Deterministic sampled path with bounded collision checks. |
| Resolved Salvo | Distant or abstract encounter. | Fire-control confidence, environment, target defence and seeded outcome. |

Mechanical weapon definitions may include cannons, torsion engines, ballistae, bolt throwers, catapults, bombards, harpoon launchers, alchemical projectors and culture-specific equivalents. These are examples, not a final shipped roster.

## 12.1 Projectile Interaction

Projectiles may strike vessel voxels, components, crew, rigging, sails, water, terrain, structures, magical barriers or other projectiles where a supported counter exists. The first valid collision consumes or transforms the projectile according to its definition. Penetration may continue through bounded layers, but never performs unbounded voxel ray destruction.

# 13. Magical, Runic and Realm Weapons

Magic uses the same authority and consequence model as mechanical weapons.

| Magical Function | Required Contracts |
| --- | --- |
| Direct Attack | Spell/weapon definition, source, mana, aim, target, damage packet and counter tags. |
| Area Effect | Bounded volume, duration, falloff, friendly-fire policy and environmental interaction. |
| Ward | Protected region, capacity, damage filters, recharge, failure and visible feedback. |
| Control | Wind, water, visibility, movement or component effect with explicit limits and resistance. |
| Boarding Support | Bridge, teleport, grapple, concealment or breach action with access and counterplay. |
| Ritual Battery | Multiple stations, components, preparation, charge, risk and interruption conditions. |

Magic may create fire, ice, force, lightning, corrosion, shadow, light, spatial or realm-specific effects only through approved damage/status definitions. It cannot bypass ownership, structural identity, compartment truth or multiplayer authority because the presentation looks supernatural.

## 13.1 Anti-Magic and Instability

Anti-magic, ward interference, corrupted mana and dimensional instability are capability interactions, not universal shutdown switches. Their effects specify which systems are weakened, delayed, rerouted or made risky and how players can detect and counter them.

# 14. Ammunition, Loading, Power, Heat and Misfire

Weapons consume real resources from authorised inventories or networks.

| Resource | Examples of State |
| --- | --- |
| Ammunition | Type, quantity, quality, condition, fuse, payload and ownership. |
| Propellant/Fuel | Charge quantity, dryness, contamination and compatibility. |
| Mana/Power | Available energy, purity, network capacity, surge and reserve policy. |
| Crew Time | Loading stages, required hands, skill, fatigue and interruption. |
| Cooling | Heat, coolant, airflow, water access and safe threshold. |
| Maintenance | Fouling, alignment, cracked parts, rune drift and temporary faults. |

Loading is a staged task. Interruption preserves consumed and unconsumed inputs accurately. Unsafe loading, incompatible ammunition or poor condition may create a warning, reduced performance, jam, misfire or internal damage according to visible risk rules. Random failure is bounded by definition and never used to punish the player without prior readable cause.

# 15. Firing Arcs, Fire Control, Aiming and Ballistics

A weapon can fire only through a valid arc without blocked muzzle, unsafe recoil, forbidden friendly target or incompatible vessel state.

| Fire-Control Input | Effect |
| --- | --- |
| Target Position and Motion | Determines lead and predicted intercept. |
| Own-Vessel Motion | Adds translation, rotation, heel, pitch and vibration uncertainty. |
| Range and Elevation | Determines trajectory mode and confidence. |
| Wind and Weather | Alters exposed projectiles, visibility and crew performance. |
| Waves and Sea State | Changes aim window and mount stability. |
| Crew Skill and Station Quality | Improves estimate, timing, reload and fault handling. |
| Instruments and Magic | Improve range, tracking, prediction or target identification. |
| Damage and Smoke | Reduce traverse, visibility, communication and confidence. |

The UI may offer direct aiming, assisted lead indicators, target-relative arcs and delegated fire-control orders. Assistance never changes the authoritative projectile or target state; it changes presentation and input interpretation.

## 15.1 Targeting Policy

Target selection may use whole-vessel aim, broad regions or known components according to knowledge and weapon accuracy. Exact hidden component targeting is unavailable until the location is visible, known from blueprint intelligence or revealed through damage. This prevents omniscient precision attacks.
# 16. Ramming, Collision and Contact Damage

Ramming is an intentional or accidental collision resolved through 26G movement state and 26F structure.

| Input | Resolution Use |
| --- | --- |
| Relative velocity | Establishes available collision energy and direction. |
| Contact geometry | Determines local area, glancing angle and primary target region. |
| Ram/contact role | Applies approved reinforcement, penetration and recoil behaviour. |
| Vessel mass and stability | Influences momentum transfer, rotation, heel and separation. |
| Material and structure | Absorbs, redirects or transmits load through structural graphs. |
| Environment | Shallow water, waves, grounding and nearby structures constrain motion. |

A vessel cannot gain a perfect ram merely by attaching a decorative spike. The contact element requires valid structural support, attachment, clear approach and commissioning. Both vessels may be damaged. A successful ram may create entanglement, boarding access, flooding or loss of manoeuvrability rather than instant destruction.

## 16.1 Collision Safety

Friendly docking accidents, harbour collisions and grounding use the same underlying contact framework at lower severity. Difficulty and accessibility settings may reduce accidental damage without changing intentional combat impacts.

# 17. Impact Resolution and Damage Packets

A Damage Packet describes the delivered effect before target-specific resistance.

```yaml
damage_packet:
  id: damage_packet:<ULID>
  source_action_id: weapon_action.<qualified_id>
  source_entity_id: entity_or_vessel:<id>
  damage_channels:
    kinetic_piercing: 0.0
    kinetic_crushing: 0.0
    cutting: 0.0
    thermal: 0.0
    explosive: 0.0
    arcane: 0.0
    electrical: 0.0
    corrosive: 0.0
  impulse_vector: [0.0, 0.0, 0.0]
  penetration_budget: 0.0
  area_profile_id: damage_area.<id>
  status_payload_ids: []
  source_tags: []
  random_seed: 0
```

Target resolution proceeds through ordered layers:

1. Validate collision and authority.
2. Resolve barrier, ward or interceptor effects.
3. Identify impacted shape, material, role and current state.
4. Apply absorption, deflection, penetration and impulse.
5. Determine affected voxel/component neighbourhood within strict bounds.
6. Create or update Damage Groups.
7. Evaluate openings, closures, support and compartment boundary changes.
8. Apply occupant, inventory and network consequences where exposed.
9. Emit evidence and presentation events.
10. Recalculate only affected vessel services and 26G inputs.

## 17.1 Critical Consequences

Critical outcomes are produced by real conditions: a penetrated magazine, severed steering linkage, collapsed mast support, destroyed pump manifold, opened hull below the waterline or loss of command crew. Random critical multipliers may influence severity within approved ranges but cannot invent a critical location that was not struck.

# 18. Structural Damage, Connectivity and Collapse

26F structural graphs provide the target topology. 26L applies sparse state changes rather than recalculating the whole vessel after every hit.

| Structural State | Meaning | Immediate Effect |
| --- | --- | --- |
| Sound | Normal contribution. | Full role capability. |
| Stressed | Load or damage warning with no major loss yet. | Inspection and bracing may be recommended. |
| Damaged | Reduced support, seal, armour or attachment contribution. | Capability and failure risk reduced locally. |
| Failed | No valid contribution to the relevant role. | Connections, boundaries or mounted systems may be lost. |
| Detached | No longer connected to the commissioned vessel assembly. | Becomes debris, retained loose object or attached fragment. |
| Temporary Braced | Emergency support restores bounded capability. | Limited duration/load and requires 26H follow-up. |

## 18.1 Local Recalculation

Damage invalidates the impacted structural subgraph, neighbouring attachments, compartment boundary cells and mounted components. The system recomputes outward until a stable unchanged boundary is found or a configured budget is reached. Large uncertainty creates a `structural_assessment_required` state rather than freezing the game for a full vessel scan.

## 18.2 Collapse and Debris

Collapse is authored through role and connectivity rules. A mast may fall when support paths fail; a deck section may drop when its bounded support group fails; armour plates may detach from mounts. Routine decorative blocks do not trigger expensive chain-collapse simulation unless they participate in declared support groups.

Debris conserves material identity and may damage occupants or nearby structures through bounded contact events. Small fragments may become aggregated Debris Lots rather than individual physics bodies.

# 19. Component, Network and Control Damage

Functional systems reference real components and service networks.

| Component Family | Possible Combat Consequences |
| --- | --- |
| Propulsion | Reduced thrust, asymmetric thrust, fuel leak, sail loss, engine shutdown. |
| Steering | Slower response, restricted angle, jammed rudder, command link failure. |
| Pumps and Drainage | Reduced dewatering, inaccessible intake, network isolation. |
| Power and Mana | Lost generation, conduit break, overload, unstable reserve, ward collapse. |
| Weapons | Mount damage, traverse failure, loading obstruction, magazine disconnect. |
| Navigation | Reduced position, depth, weather or target confidence. |
| Communication | Delayed orders, failed signals, fleet coordination loss. |
| Closures | Door, hatch, port or valve cannot close or remain sealed. |
| Storage | Cargo exposure, ammunition hazard, contamination or ownership risk. |
| Life Support/Specialist | Breathable-space loss, realm stabilisation failure, temperature hazard. |

Component condition is not a second structure model. A component is damaged through its physical anchors, exposed volume, network links and declared vulnerable parts. A system can remain partially functional through redundant paths, manual operation or emergency rerouting.

## 19.1 Control Authority

Loss of a helm, command station or signal system does not automatically delete player control. Control may move to a backup station, local manual control or emergency command according to vessel design and crew access. The transition must be visible and may reduce capability.

# 20. Breaches, Compartments and Water Ingress

A breach is created when a valid compartment boundary becomes open or insufficiently sealed.

| Breach Property | Purpose |
| --- | --- |
| Boundary reference | Links to stable hull/closure element IDs. |
| Effective opening area | Drives bounded ingress rather than counting only whole blocks. |
| Height and orientation | Determines relation to waterline, heel and waves. |
| Edge condition | Sharp, crushed, burning, obstructed or magically unstable. |
| Seal compatibility | Lists patch, closure, magic and tool capabilities. |
| Access faces | Defines where crew or divers may work. |
| Dynamic state | Open, partially obstructed, patched, reopened or permanently repaired. |

26L requests water ingress from 26B using the vessel's current waterline and local environment. 26B returns compartment water state. 26L then evaluates tactical consequences such as loss of access, electrical/mana hazard, cargo damage, crew movement and urgency.

## 20.1 Above-Water Breaches

Openings above the calm waterline may still admit spray or wave water under 26D sea state and vessel motion. They can also ventilate smoke, expose crew and weaken weather protection without being an immediate flooding source.

## 20.2 Closure Damage

Doors, hatches, gun ports, valves and airlocks have closure states. A closure may be jammed open, jammed shut, leaking, destroyed, blocked by debris or manually held. Damage-control tasks must identify the actual closure problem instead of issuing a generic `seal compartment` order.

# 21. Flooding, Pumps, Counter-Flooding and Stability

Flooding is a coupled 26B/26G/26L process.

| State | Combat Meaning |
| --- | --- |
| Damp/Spray | Minor hazard, visibility and footing effect. |
| Shallow Flooding | Movement and item risk; low components may fail. |
| Working Depth | Crew speed, combat, repair and access significantly reduced. |
| Hazardous Depth | Swimming rules, drowning risk and equipment limits apply. |
| Full Compartment | Access may be lost; mass and free-surface effects are severe. |
| Pressurised/Special | Realm or sealed-system conditions require specialist handling. |

## 21.1 Ingress and Outflow

Net flooding considers opening area, outside water pressure approximation, wave exposure, internal water level, connected openings, pump output, drainage and temporary obstruction. The model uses bounded compartment quantities and transfer links, not full real-time CFD.

## 21.2 Pumping

Pumps require intact components, intake/outlet, power or labour, accessible controls and valid discharge. Pump capacity may be assigned by policy. A pump cannot remove water faster because the UI priority is high; the priority changes resource and crew allocation only.

## 21.3 Counter-Flooding and Ballast Transfer

Advanced crews may intentionally move water or ballast to correct list, preserve weapon arcs or support damaged structure. This creates real mass and compartment consequences and can worsen survival if mismanaged. Automated recommendations require known compartment state and player-authorised policy.

## 21.4 Stability Handoff

26L provides updated compartment water masses, loose cargo shifts and damaged watertight boundaries to 26G. 26G returns list, trim, righting response, capsize risk and movement restrictions. Neither document independently duplicates the other's calculation.

# 22. Fire, Smoke, Heat and Explosion

Fire uses bounded Fire Zones tied to voxels, components and compartments.

| Fire Input | Meaning |
| --- | --- |
| Ignition energy/effect | Weapon, lightning, machinery, explosion, spell or contact source. |
| Fuel availability | Material, cargo, liquid, gas, ammunition or magical fuel facets. |
| Oxygen/ventilation | Openings, fans, wind, closures and compartment state. |
| Moisture/water | Rain, spray, flooding, suppression and material saturation. |
| Heat transfer | Bounded neighbouring cells/components and network conduits. |
| Suppression | Water, foam, sand, magic, isolation, removal or smothering. |
| Crew access | Route, protection, tools, visibility and hazard tolerance. |

Fire spread is evaluated at scheduled intervals and within a strict active-zone budget. The system aggregates ordinary continuous fuel into zone values while retaining critical item/component identities such as magazines, mana batteries, fuel tanks and quest cargo.

## 22.1 Smoke

Smoke reduces visibility, causes respiratory/status effects, blocks target identification and influences evacuation. It follows compartment connectivity and ventilation summaries. Presentation density may be reduced independently for performance and accessibility while the authoritative hazard remains.

## 22.2 Heat

Heat damages materials, components and occupants according to facets. It may soften seals, ignite adjacent fuel, destabilise mana systems, cook ammunition or make a route unusable. Temperature remains zone-based rather than a universal per-voxel thermal simulation.

## 22.3 Explosion

Explosions create an origin, pressure/impulse profile, fragmentation or magical payload, obstruction interaction and secondary ignition. Magazines and volatile cargo require containment, handling and separation capabilities. Explosions do not automatically chain every nearby explosive item; each secondary event must satisfy exposure and threshold rules.

# 23. Damage-Control Organisation and Emergency Work

Damage control is a core tactical playstyle rather than a passive regeneration mechanic.

| Task Family | Example Actions |
| --- | --- |
| Survey | Inspect impact, trace flooding, test closure, assess support, locate fire. |
| Isolation | Close hatch, shut valve, cut power, disconnect mana, restrict access. |
| Sealing | Plug, patch, wedge, clamp, magically bind or externally cover breach. |
| Bracing | Shore deck, secure mast, reinforce mount, stabilise bulkhead. |
| Pumping | Start pump, clear intake, route discharge, bucket chain, repair power. |
| Firefighting | Cool, smother, remove fuel, flood magazine, vent smoke, suppress magic. |
| Rescue | Extract trapped crew, provide air, tow swimmer, open escape route. |
| Medical | Triage, stabilise, move casualty and establish treatment point. |
| Rerouting | Restore controls, power, mana, steering, communications or weapon supply. |

## 23.1 Priority System

The Damage-Control Lead or player sets policy priorities such as `prevent sinking`, `protect magazine`, `restore steering`, `contain fire`, `save trapped crew` or `maintain weapon`. AI evaluates urgency, task dependency, route safety, skill and available tools. It cannot silently choose to sacrifice people or flood occupied spaces unless the active policy explicitly permits the action and warnings are surfaced.

## 23.2 Temporary Repairs

Combat patches have capacity, duration, environment and load limits. A wooden plug may reduce ingress but fail under severe wave pressure; a rune seal may consume mana and become unstable; an emergency brace may forbid high-speed manoeuvre. 26H converts these records into proper repair requirements.

# 24. Crew Injury, Morale, Fatigue and Casualties

Crew use the existing entity combat, injury and needs systems. Naval context adds moving platforms, confinement, drowning, smoke, blast, station responsibility and command effects.

| Factor | Tactical Effect |
| --- | --- |
| Injury | Reduces action, movement or station capability according to actual condition. |
| Fatigue | Slows loading, repair, communication and decision execution. |
| Morale | Influences compliance, initiative, surrender, panic and rally. |
| Leadership | Improves order clarity and recovery but does not override impossible tasks. |
| Casualties | Remove labour and relationships and create persistent social consequences. |
| Trapped/Overboard | Creates rescue objectives and station shortages. |
| Medical Capacity | Changes survival and recovery, not whether a hit occurred. |

## 24.1 Morale Model

Morale is not a single courage stat. It evaluates cohesion, leadership, objective belief, losses, fire/flood state, escape options, faction doctrine, prior experience, promises, treatment and current orders. Individuals may differ; bounded crew cohorts may use aggregate distributions while preserving promoted named NPCs.

## 24.2 Civilian and Passenger Protection

Passengers and non-combatants have muster areas, evacuation routes and protection policies. Harm, abandonment or deliberate targeting creates evidence for 26K law and reputation. The system does not treat all occupants as interchangeable crew health.

# 25. Boarding Initiation and Contact

Boarding begins only after a valid access relationship is established.

| Boarding Method | Requirements and Risks |
| --- | --- |
| Alongside Contact | Relative speed controlled, collision/contact safe enough, route between decks. |
| Grappling | Valid projectile/contact, secure anchor, rope capacity and maintained tension. |
| Boarding Bridge/Gangway | Attachment points, alignment, support and deployment time. |
| Ram/Entanglement | Contact persists but may damage both vessels and create hazardous access. |
| Jump/Climb | Character movement capability, range, weather and fall/water risk. |
| Flight/Glider/Mount | Approved mobility capability and anti-air/ward context. |
| Magical Transfer | Source, destination, capacity, line/anchor, counter and authority rules. |
| Underwater Entry | 26E diving capability, submerged access, pressure and closure state. |

Boarding links store endpoints, capacity, stability, direction, ownership, obstruction and cut/release state. They are not decorative ropes. Breaking the link may strand characters or create man-overboard events.

## 25.1 Repelling Approach

Defenders may manoeuvre away, cut grapples, damage boarding craft, block access, use suppression, raise barriers or contest attachment points. The UI exposes why boarding is or is not possible without revealing undiscovered hidden routes.

# 26. Grappling, Breaching and Access Routes

Grapples attach only to compatible geometry or sockets and must withstand tension. Multiple links may stabilise contact. Ropes and chains are aggregated constraint records with visible segments rather than hundreds of simulated links.

Breaching uses the existing personal and structure damage framework. Doors, hatches, windows, hull openings and magical barriers have resistance, locks, permissions and damage states. A boarding action may exploit an existing combat breach but does not create free access through intact walls.

## 26.1 Route Graph Update

When boarding links or breaches appear, vessel-local navigation graphs add temporary edges. Hazard, width, one-way movement, climb, water, smoke and crowd capacity are recorded. Graph updates remain local to affected regions.

# 27. Boarding Combat, Control Zones and Ship Control

Boarding combat reuses Document 16 actions, gear, status, AI and accessibility. The moving-vessel frame, narrow routes, ladders, water, fire, smoke and control stations add environmental modifiers.

| Control Zone | Typical Meaning |
| --- | --- |
| Main Deck | Movement, weapon crews, access to superstructure and open combat. |
| Helm/Command | Orders, steering authority and communication. |
| Engineering/Power | Propulsion, pumps, mana and isolation controls. |
| Weapon Battery | Offensive capability and ammunition access. |
| Magazine/Stores | High-value supplies and explosive risk. |
| Crew Quarters/Passenger Area | Civilian protection, morale and prisoners. |
| Lower Compartments | Flooding, pumps, cargo, machinery and confined routes. |
| Anchor/Boarding Points | Ability to maintain or cut contact. |

Control is resolved from present forces, access, active resistance, station operation and command authority. Capturing one zone may disable or expose capability but does not instantly change the vessel owner.

## 27.1 Securing a Vessel

A vessel is tactically secured when resistance is ended or contained, command and critical stations are controlled, dangerous hazards are addressed, remaining occupants are accounted for and a valid authority accepts custody. Hidden or sealed resistance may keep the vessel contested.

# 28. Surrender, Capture, Prisoners and Prize Crews

Surrender can be offered, demanded, negotiated, refused, feigned or violated. The record includes terms such as ceasefire, weapon securing, cargo inspection, passenger protection, prisoner treatment, medical aid, parole, tow destination and scuttling prohibition.

| State | Meaning |
| --- | --- |
| Offer Pending | Terms transmitted but not accepted. |
| Conditional Ceasefire | Firing pauses while compliance is checked. |
| Surrender Accepted | Parties and obligations are authoritative. |
| Compliance Incomplete | Weapons, access, prisoners or command remain unresolved. |
| Secured | Captor has bounded control and custody. |
| Violated | Recorded breach reopens conflict and informs law/reputation. |

## 28.1 Ownership Boundary

Tactical capture produces control evidence, not final legal title. 26K resolves prize law, faction claims, ransom, return, condemnation or theft. Existing Vessel Instance identity, history, blueprint provenance, damage and inventory remain unchanged by the ownership dispute.

## 28.2 Prisoners

Prisoners retain identity, equipment custody, injuries, relationships, legal status and location. Capacity, food, security and medical care matter. Abstract prisoner numbers are permitted only for bounded cohorts with provenance and promotion rules.

## 28.3 Prize Crew

A captured vessel requires enough qualified personnel to control hazards, navigate and prevent recapture. An under-crewed prize may need tow, escort or abandonment. The system does not spawn a competent prize crew because capture succeeded.

# 29. Rescue, Abandon Ship and Survivor Handling

Rescue may occur during or after combat and can override hostile priorities under doctrine or player choice.

| Rescue Action | Systems Used |
| --- | --- |
| Recover Overboard | 26E swimming/towing, vessel ladders, small craft and crew tasks. |
| Launch Boats/Rafts | Vessel components, capacity, deployment routes and sea conditions. |
| Tow Survivors | Rope/tow capability, speed limits and hypothermia/exposure. |
| Extract Trapped Crew | Damage-control survey, breach/access and medical triage. |
| Transfer Wounded | Boarding links, stretchers, routes, capacity and custody. |
| Signal Distress | 26J/26K communication, range, weather and legal context. |

## 29.1 Abandon Ship

An abandon-ship order defines muster, emergency supplies, boat assignment, prisoner policy, navigation documents, scuttle policy and last-person responsibilities. Panic may cause unscheduled evacuation; training and morale influence order. Evacuation does not delete the vessel or automatically save occupants.

## 29.2 Survivor Groups

Distant survivors may form persistent groups with position, craft, supplies, injuries, morale, identity members, weather exposure and rescue deadline. These groups can generate quests and world evidence rather than vanishing after an encounter.

# 30. Capsizing, Sinking, Scuttling and Wreck Transition

26G determines stability and foundering state from 26L/26B damage and flooding inputs. 26L manages tactical consequences and the final Wreck Transition.

| End State | Definition |
| --- | --- |
| Disabled Afloat | Vessel cannot fulfil key operations but remains buoyant and recoverable. |
| Grounded | Vessel rests on terrain; may be stable, damaged, stranded or breaking up. |
| Capsized | Vessel orientation and stability prevent normal operation; survivors and air spaces may remain. |
| Foundering | Progressive sinking remains active and may be arrested. |
| Sunk Intact | Vessel settles underwater with much identity and structure retained. |
| Broken Wreck | Structural separation creates major sections and debris records. |
| Scuttled | Deliberate sinking/damage with authority, method and evidence. |
| Destroyed/Dispersed | Only bounded fragments, cargo, survivors and history remain. |

## 30.1 Identity Preservation

A sunk vessel keeps its Vessel Instance ID until governance rules intentionally archive or transform it. Its location, orientation, sections, cargo, bodies/survivors, ownership claims, hazards and history persist. 26H salvage and restoration reference this identity.

## 30.2 Wreck Generation

The runtime creates a Wreck Instance referencing surviving vessel-local voxel groups, components and inventories. Large intact sections remain voxel structures. Small detached matter may aggregate into Salvage Lots or Debris Fields. No valuable cargo is generated simply because a wreck exists.
# 31. Coastal Batteries, Harbour Defence and Siege

Coastal combat connects vessels to Document 20 structures and 26J port capabilities.

| Defence Element | Required Truth |
| --- | --- |
| Battery | Functional structure, weapon mounts, ammunition/power, crew, arcs and command. |
| Fort/Wall | Voxel structure, materials, openings, routes, damage groups and repair state. |
| Lighthouse/Beacon | Navigation/signalling capability, power/fuel, visibility and ownership. |
| Harbour Chain/Boom | Anchors, spans, deployment state, clearance and structural capacity. |
| Breakwater/Sea Wall | Physical terrain/structure affecting movement, cover and wave exposure. |
| Dockyard | Facilities, stock, workers, vessels under construction and fire/flood risk. |
| Landing Site | Depth, terrain, approach, defenders, capacity and route to objectives. |

## 31.1 Siege Objectives

Siege encounters may seek to suppress batteries, open or close harbour access, protect a landing, destroy a specific service, seize stores, rescue occupants, break a blockade or delay an attacker. Destruction of the whole settlement is never assumed.

## 31.2 Vessel-to-Structure Fire

The same Damage Packet resolves against structure definitions. Buildings expose semantic roles and critical services, but ordinary walls still derive resistance from materials and shape. Ship weapons cannot damage abstract port capability without affecting the structure/component that provides it.

## 31.3 Shore-to-Vessel Fire

Batteries use fixed or limited mounts with stronger foundations and potentially greater supplies, but their arcs, visibility, crew and communication remain physical. Terrain and building cover affect both sides.

# 32. Mines, Booms, Barriers and Area Denial

Area denial uses persistent placed devices and structures with ownership, deployment, trigger and clearance rules.

| Family | Behaviour Boundary |
| --- | --- |
| Anchored Mine/Charge | Fixed region, authorised trigger profiles, detectable/clearable and finite payload. |
| Drifting Hazard | Environment-driven movement, lifespan, ownership evidence and bounded population. |
| Magical Seal/Field | Anchors, mana source, protected region, allowed targets, counters and instability. |
| Harbour Boom/Chain | Physical obstruction with gates, tension, damage and vessel compatibility. |
| Nets/Entanglers | Movement/component effects with cutting, freeing and creature-safety rules. |
| Caltrops/Obstacles | Local shallow-water or landing denial, visible and removable. |

These are game-system definitions, not real-world construction instructions. Content entries specify gameplay capabilities and evidence rather than actionable weapon engineering detail.

## 32.1 Safe and Legal Use

Placement checks ownership, jurisdiction, civilian route risk, persistence budget and recovery method. Devices cannot remain as unlimited invisible hazards. Friendly identification and disarm policies are explicit, and accidental civilian harm creates evidence.

# 33. Fleet Combat, Formations and Command Coordination

26K Fleet Instances provide membership, missions and doctrine. 26L resolves tactical coordination.

| Fleet Layer | Tactical Responsibility |
| --- | --- |
| Formation | Relative positions, spacing, screen, protected centre, turning policy and collision avoidance. |
| Command Network | Orders, acknowledgement, delay, signal confidence and succession. |
| Target Allocation | Priority, overkill control, threat coverage and ammunition conservation. |
| Screening | Interpose, intercept, smoke/ward cover, rescue and pursuit denial. |
| Reserve | Held-back force with release conditions and route. |
| Withdrawal Plan | Rally points, damaged-vessel support, rear guard and survivor recovery. |
| Logistics Exposure | Ammunition, fuel, mana, repair craft and hospital/transport protection. |

## 33.1 Formation Is Not a Stat Bonus

A formation provides capability only while vessels can maintain relative positions and communication. Damage, weather, speed mismatch, terrain, panic or pursuit may break it. Benefits such as mutual defence and coordinated salvos are derived from actual coverage and timing.

## 33.2 Flagship and Command Loss

Loss of a commander, signal station or flagship triggers succession policy. A fleet may continue under subordinate command, split into groups, withdraw or become disorganised. The outcome depends on doctrine, leaders and communication rather than a universal morale collapse.

## 33.3 Friendly Collision and Fire

Dense fleet actions increase obstruction and friendly-fire risk. Fire-control and manoeuvre services identify unsafe arcs, but players may override according to permissions and world settings. The authoritative result remains physical.

# 34. NPC Tactics, Doctrine and Rules of Engagement

NPCs choose actions through bounded tactical policies informed by mission, doctrine, confidence, readiness and current evidence.

| Decision Layer | Examples |
| --- | --- |
| Strategic Intent | Escort, capture, delay, destroy, rescue, escape, protect civilians. |
| Escalation | Observe, warn, challenge, shadow, board, disable, use lethal force. |
| Manoeuvre | Keep range, close for boarding, cross target arc, screen, withdraw. |
| Target Priority | Weapons, propulsion, command, boarding links, specific cargo, creature weak point. |
| Resource Policy | Conserve ammunition, preserve mana, protect fuel, avoid magazine risk. |
| Damage Policy | Continue, isolate damage, abandon station, seek shelter, surrender. |
| Humanitarian Policy | Rescue enemies, protect passengers, avoid burning/sinking ships. |

## 34.1 Doctrine Is Learned and Authored

Doctrine belongs to factions, cultures, institutions, captains and training. It may favour boarding, long-range fire, coastal ambush, convoy protection, magical defence or avoidance. Ancestry does not assign doctrine.

## 34.2 AI Knowledge Limits

NPCs act from observed and reported information. They do not know hidden compartments, exact ammunition, unseen boarders or player intent without evidence. Difficulty may improve reaction and coordination, but does not grant omniscience.

## 34.3 Explainability

Major AI decisions store reason codes such as `objective_at_risk`, `fire_spreading_to_magazine`, `withdrawal_route_open`, `civilian_protection_policy` or `boarding_advantage_high`. Debug and post-battle views may expose these under developer or appropriate player information settings.

# 35. Weather, Sea State, Visibility and Environmental Hazards

26D supplies authoritative fields and events.

| Condition | Tactical Effect |
| --- | --- |
| Strong Wind | Sail handling, smoke direction, projectile drift, fire spread and communication. |
| High Waves/Swell | Aim windows, deck movement, boarding links, ingress and small-craft safety. |
| Current/Tide | Position, escape, grounding, harbour access, debris and survivor drift. |
| Fog/Heavy Rain | Detection, identification, fire-control confidence and collision risk. |
| Lightning | Ignition, equipment/mana disruption and exposed-mast hazard. |
| Ice | Movement restrictions, hull/contact damage, rescue difficulty and route closure. |
| Storm Surge | Coastal battery access, flooding and harbour defence state. |
| Magical Weather | Tagged effects with forecasts, counters and realm authority. |

## 35.1 Environmental Fairness

Current conditions must be discoverable through direct observation, instruments, forecasts or warnings appropriate to knowledge. Sudden authored events may surprise players, but should have world cues and must obey event definitions rather than arbitrary combat difficulty spikes.

## 35.2 Deck Movement

Character movement on pitching vessels may use reduced-motion presentation and assistance. Authoritative footing hazards are simplified into zones, impulses and timing windows instead of continuously displacing every character with raw physics.

# 36. Magic, Automation, Wards and Countermeasures

Maritime combat integrates practical magic and automation without replacing crew or physical structure.

| System | Combat Uses | Constraints |
| --- | --- | --- |
| Mana Network | Weapons, wards, pumps, sensors, stabilisation and emergency seals. | Capacity, purity, damage, heat/instability and priority. |
| Mechanical Automation | Loading assistance, pumps, traverse, fire suppression and doors. | Power, maintenance, access, jams and command permissions. |
| Golems/Constructs | Heavy work, firefighting, boarding defence, repair support. | Registry identity, control, environment and NPC/creature rules. |
| Wards | Projectile filtering, elemental defence, boarding denial, compartment protection. | Coverage, direction, capacity, recharge and counters. |
| Countermeasures | Smoke, decoys, flares, chaff-like fantasy media, dispels, interceptors. | Finite resources, target/effect compatibility and visibility. |
| Detection Magic | Range, identity, hidden damage, boarder or creature sensing. | Knowledge, false signals, anti-magic and uncertainty. |
| Spatial Magic | Boarding, escape, projectile redirection or storage protection. | Anchors, capacity, safeguards and multiplayer authority. |

## 36.1 Power Priority

Players and AI may set power/mana priorities: propulsion, pumps, wards, weapons, life support, communication or emergency reserve. Allocation changes real service state. A UI setting cannot create extra energy.

## 36.2 Magical Damage to Voxels

Spells reference material and defence facets. Fire may ignite fuel; frost may embrittle or seal temporarily; force may damage support; lightning may follow networks; corruption may alter states. Effects are explicit and bounded, avoiding generic `magic ignores armour` rules.

# 37. Law, Reputation, Friendly Fire and Atrocity Prevention

26L records what physically occurred. 26K, factions and quests interpret legality and consequence.

| Evidence | Examples |
| --- | --- |
| Target Identity Confidence | What the attacker reasonably knew at action time. |
| Weapon Order | Who authorised target, escalation and fire. |
| Impact/Casualty Records | Which object/person was hit and by what source. |
| Surrender State | Whether terms were offered, accepted or violated. |
| Civilian/Medical Status | Protected occupants, rescue craft or facilities. |
| Jurisdiction/War State | Relevant law and relationship at time of action. |
| Rescue Behaviour | Aid, abandonment, obstruction or deliberate harm. |

## 37.1 Friendly Fire

Friendly fire may be disabled, reduced or fully enabled by world/multiplayer settings. Even when damage is disabled, unsafe orders may produce warnings and AI refusal according to policy. Competitive PvP uses server settings and explicit consent/host authority.

## 37.2 Surrender and Survivor Protection

The system must not incentivise killing surrendered crews or survivors as the optimal default. Legal, reputation, morale, crew-trust, quest and faction consequences are available. Dark or villain play remains possible where settings allow, but actions are recorded and the world responds coherently.

## 37.3 Content Controls

Settings may reduce gore, drowning distress, fire intensity, civilian harm, prisoner themes and catastrophic vessel loss presentation without changing core resource or authority truth.

# 38. Progression, Research, Training and Balance

Detailed numeric balance and final unlock rosters belong to 26N, but 26L defines progression dimensions.

| Progression Area | Examples of Growth |
| --- | --- |
| Gunnery | Reload efficiency, range estimation, fault clearing and coordinated salvo options. |
| Seamanship | Manoeuvre under fire, boarding approach, storm control and collision recovery. |
| Damage Control | Survey confidence, task speed, patch options, fire/flood prioritisation. |
| Leadership | Order clarity, morale recovery, delegation and fleet coordination. |
| Marines/Boarding | Grapple use, close combat, station defence and prisoner control. |
| Engineering | Rerouting, emergency operation, pump/propulsion recovery and safe overload. |
| Battle Magic | Ward management, countermeasures, targeting and instability control. |
| Medicine/Rescue | Triage, smoke/water treatment, evacuation and survivor outcomes. |
| Knowledge | Vessel recognition, component location, weapon counters and doctrine. |

## 38.1 No Mandatory Combat Tier

Players can access maritime building, trade, fishing, exploration and civilisation without naval combat. Combat progression unlocks safer and deeper participation, not the right to use the ocean at all.

## 38.2 Material Identity

Higher materials are not simple universal armour upgrades. Wood may absorb or repair easily; iron may resist cutting but add mass; arcane materials may improve wards while risking instability. Facets express trade-offs and long-term uses.

## 38.3 Difficulty Axes

Difficulty settings may independently adjust enemy coordination, aim assistance, damage severity, fire/flood pace, surrender likelihood, repair generosity, casualty consequences, information clarity and strategic encounter frequency. These axes avoid one opaque `naval difficulty` multiplier.

# 39. Quests, Events and Persistent World Consequences

26L exposes event and objective modules to Document 15.

| Quest/Event Hook | Authoritative Condition |
| --- | --- |
| Protect a Convoy | Named vessels/cargo survive and reach a boundary. |
| Rescue Survivors | Identified survivor groups reach safe custody. |
| Capture Without Sinking | Target secured while specified systems/people survive. |
| Silence a Battery | Required weapon/service capabilities disabled. |
| Break a Blockade | Protected vessel crosses coverage and reaches destination. |
| Recover Documents | Item provenance and custody transfer completed. |
| Prevent Scuttling | Scuttle action interrupted and vessel secured. |
| Damage-Control Crisis | Fire/flood thresholds resolved before deadline. |
| Investigate a Wreck | Impact, cargo, bodies/survivors and ownership evidence studied. |
| Sea-Monster Defence | 26M creature objective resolved using vessel interfaces. |

## 39.1 Aftermath Records

Encounters create histories containing participants, objectives, shots/actions, major impacts, casualties, surrender, capture, rescue, wrecks, cargo change, law evidence and unresolved hazards. Summaries are concise for players while full evidence is available to systems and diagnostics.

## 39.2 World Memory

Persistent results may alter port capacity, crew relationships, faction confidence, trade routes, shortages, memorials, rumours, salvage fields, ship availability, war escalation and future quests. 26L emits facts; the owning systems calculate their consequences.

# 40. UI/UX, Controls and Accessibility

The interface follows world-first, progressive-disclosure rules.

| Context | Required Information |
| --- | --- |
| General Combat HUD | Objective, threat direction, vessel condition summary, critical alerts and current role. |
| Helm | Heading, speed, turn, hazards, target-relative bearing, propulsion/steering state. |
| Weapon Station | Arc, load/charge, heat, target confidence, friendly risk and fire authorisation. |
| Damage Control | Compartments, flooding, fire, closures, pumps, routes, tasks, crew and supplies. |
| Boarding | Boarding links, control zones, allies, hazards, escape and surrender state. |
| Fleet Command | Formation, orders, acknowledgements, readiness, contacts and withdrawal routes. |
| Aftermath | Objective outcome, damage causes, casualties, cargo, prisoners, legal evidence and next work. |

## 40.1 Alert Hierarchy

Alerts are prioritised: immediate life/sinking hazards, objective-critical state, capability loss, tactical opportunity, routine status. Duplicate notifications group by compartment/system. Every critical alert uses text/icon plus sound, pattern or vibration where practical; colour alone is insufficient.

## 40.2 Controls

- Direct station controls for helm, aim, loading interaction and repair work.
- Command wheel or menu for high-level orders and target priorities.
- Quick actions for brace, cease fire, distress, surrender response and emergency task.
- Full remapping, hold/toggle variants, controller focus and split-screen-safe layouts.
- Aim assistance, lead assistance and timing-window scaling.
- Reduced motion, camera shake, flashes, smoke density and audio dynamic range.
- Optional automation for loading, target selection, station delegation and damage-control prioritisation.

## 40.3 Information Confidence

Target identity, hidden damage, fire location and flooding estimates display confidence. The UI never presents guesses as exact authoritative facts unless a capability has established them.

# 41. Multiplayer, Authority and Split-Screen

The host/server owns encounter state, projectiles, impacts, damage, inventory transactions, control zones, surrender and Wreck Transition.

| Area | Authority Rule |
| --- | --- |
| Station Control | Explicit claim/assignment with permissions and handoff. |
| Helm/Command | One active authority per station; high-level command may remain separate. |
| Weapons | Client requests validated against arc, load, target, crew and rules of engagement. |
| Damage Control | Tasks use reservations to prevent duplicate resource consumption. |
| Boarding | Character positions remain server authoritative in moving local frames. |
| Surrender/Capture | Requires authorised party acceptance and transactional state change. |
| PvP | Governed by server/world settings, ownership and consent rules. |
| Reconnection | Player returns to valid vessel/crew/custody state without duplication. |

## 41.1 Moving Interiors

Characters and objects use vessel-local frames with authoritative reconciliation. Boarding between moving frames uses temporary link transforms. The system avoids parenting every loose item as a Node; inventories and aggregate cargo remain data records unless physically dropped.

## 41.2 Split-Screen

Each local player has independent HUD focus, station view and accessibility settings. Shared alerts may be consolidated. Camera effects, smoke presentation and audio cues must not make one player's settings override the authoritative encounter or another local player's preferences.

# 42. Simulation LOD and Abstract Encounter Resolution

The same encounter can operate at several detail levels.

| Level | Representation |
| --- | --- |
| Full Tactical | Physical vessels, projectiles, characters, compartments and boarding. |
| Reduced Tactical | Physical vessels and major weapons; crew/components aggregated by stations/zones. |
| Encounter Summary | Timed tactical rounds using readiness, position bands, policies and damage groups. |
| Strategic Resolution | Distant mission resolution with bounded phases and persistent evidence. |

## 42.1 Abstract Inputs

- Vessel structure/condition summaries derived from 26F.
- Movement, environment compatibility and manoeuvre from 26G/26D.
- Crew readiness, roles, morale and supplies from 26J.
- Mission, formation, intelligence, law and doctrine from 26K.
- Weapon, defence, ammunition, damage-control and objective definitions from 26L.
- Current fire, flooding, injuries, prisoners and cargo state.
- Deterministic encounter seed and decision policies.

## 42.2 Abstract Phase Loop

1. Update detection and position band.
2. Apply command and manoeuvre policy.
3. Allocate weapons, defence and resources.
4. Resolve bounded salvos/actions.
5. Create physical-compatible Damage Groups and casualties.
6. Resolve damage control, morale and objective progress.
7. Check surrender, withdrawal, rescue and reinforcement.
8. Repeat until resolution or budget limit.

## 42.3 Promotion

When players approach, the system materialises vessel positions, loaded weapons, compartment water, fire zones, damage groups, crew assignments and boarding state. Any uncertain abstract location is resolved deterministically into valid vessel-local regions with evidence. Promotion must not heal, worsen or reroll the encounter.

## 42.4 Demotion

Demotion captures projectiles of lasting significance, current actions, station state, hazards, survivors and links. Short-lived visual effects may be discarded only after their authoritative consequence has resolved.

# 43. Persistence, Save Recovery and Migration

Encounter state is journalled because combat crosses many authoritative systems.

| Persistent Record | Required Fields |
| --- | --- |
| Tactical Encounter | Participants, objectives, phase, law, environment, seed and history. |
| Weapon Runtime | Load, ammunition reservation, heat, faults, crew and target/order. |
| Impact/Damage Group | Source, location, affected elements, severity and repair state. |
| Breach/Flooding | Boundary, opening, water state, pumps, patches and access. |
| Fire Zone | Fuel, heat, smoke, spread links, suppression and critical contents. |
| Boarding Link | Endpoints, capacity, control, occupants and release state. |
| Surrender/Custody | Terms, parties, prisoners, weapons secured and violations. |
| Survivor Group | Members/cohort, position, supplies, injuries and rescue state. |
| Wreck Transition | Vessel identity, sections, inventories, ownership and hazards. |

## 43.1 Atomic Checkpoints

Critical checkpoints include weapon consumption/fire, impact commit, compartment boundary change, surrender acceptance, ownership/custody transfer, prisoner movement, abstract/physical transition and Wreck Transition. Recovery replays or rolls back incomplete transactions without duplicating items or entities.

## 43.2 Versioning

Definitions are immutable by qualified ID/revision for active evidence. Save migrations convert record schemas, not historical outcomes. If a weapon pack is missing, existing damage and ammunition remain quarantined through stable fallback records rather than disappearing or crashing the save.

# 44. Godot/Summer Engine Technical Architecture

The system is implemented as services and compact records rather than a scene tree mirroring every combat datum.

| Service | Responsibility |
| --- | --- |
| MaritimeEncounterService | Lifecycle, participants, objectives, phases and resolution. |
| VesselWeaponService | Mount validation, loading, firing, heat, faults and ammunition. |
| FireControlService | Arc, confidence, lead, target policy and delegated aiming. |
| VesselDamageService | Impact resolution, Damage Groups and structural/component invalidation. |
| CompartmentHazardService | Breach, flooding, fire, smoke, heat and local hazard queries. |
| DamageControlService | Tasks, reservations, crew assignment, temporary patches and evidence. |
| BoardingService | Links, temporary navigation edges, zones, surrender and custody interface. |
| FleetTacticalService | Formation, signals, target allocation and group policies. |
| AbstractEncounterService | Distant deterministic tactical resolution and promotion/demotion. |
| MaritimeCombatViewModelService | UI-safe summaries, confidence and reason text. |
| MaritimeCombatPersistenceService | Journals, save records, recovery and migration. |

## 44.1 GDScript-First Direction

Use typed GDScript Resources/services for definitions, commands, scheduling and ordinary simulation. Profile before moving bounded heavy calculations such as broad-phase projectile checks, large structural subgraph updates or bulk abstract battles into native extensions. Native code must preserve the same data contracts and evidence.

## 44.2 Scene Representation

- One scene root per promoted vessel or major structure, not per voxel.
- Chunk/section meshes and collision derived from vessel-local voxel storage.
- Sparse nodes only for interactive mounts, doors, machinery, important loose objects and presentation anchors.
- Projectiles pooled and budgeted.
- Fire/smoke presentation generated from authoritative zones.
- Crew actors promoted by relevance; distant station cohorts remain records.

## 44.3 Commands and Events

Example commands:

- `RequestEngagementAction`
- `AssignCombatStation`
- `SetRulesOfEngagement`
- `LoadWeapon`
- `FireWeapon`
- `CreateDamageControlTask`
- `AcceptSurrender`
- `CreateBoardingLink`
- `OrderAbandonShip`
- `CommitWreckTransition`

Example events:

- `WeaponFired`
- `ImpactResolved`
- `CompartmentBreached`
- `FloodingThresholdCrossed`
- `FireZoneChanged`
- `CombatStationDisabled`
- `BoardingEstablished`
- `SurrenderAccepted`
- `SurvivorGroupCreated`
- `VesselWrecked`

# 45. Set 25 Registry and Governance Integration

26L extends governed schemas rather than creating isolated combat databases.

| Set 25 Area | 26L Extension |
| --- | --- |
| Qualified Identity | Weapon actions, mounts, damage channels, defences, doctrines, tasks, zones and scenarios use qualified IDs. |
| Extension Facets | Blocks/items/components receive combat, armour, flammability, sealing, hazard and mount facets. |
| Relationship Registry | Weapon-mount, ammunition-weapon, component-anchor, task-capability, doctrine-action and scenario-participant relationships. |
| Capability Registry | Fire, load, aim, pump, seal, suppress, board, repel, rescue, capture and command queries. |
| Content Packs | Base naval combat remains recoverable without optional culture, realm or faction packs. |
| Validation | Definitions prove references, ranges, costs, counters, accessibility text and deterministic evidence. |
| Migration | Renames/retirements use aliases, converters, quarantine and preserved history. |
| Production Classification | POC/vertical slice/alpha/beta/final status remains planning metadata, not shipped gameplay truth. |

## 45.1 Required Extension Facets

- `block.combat_material`
- `block.structural_damage`
- `block.seal_and_breach`
- `block.fire_and_heat`
- `item.ammunition`
- `item.damage_control_tool`
- `item.fire_suppression`
- `component.weapon_mount`
- `component.weapon_system`
- `component.magazine`
- `component.combat_station`
- `vessel.combat_profile`
- `structure.coastal_defence`
- `entity.maritime_combat_role`
- `spell.maritime_combat_effect`

## 45.2 Capability Queries

| Capability | Example Query |
| --- | --- |
| Operate Weapon | Does entity/cohort satisfy role, station, access, skill and current condition? |
| Fire Safely | Does mount satisfy arc, obstruction, recoil, load, authority and friendly-risk policy? |
| Seal Breach | Do workers/tools/materials/access/environment satisfy patch definition? |
| Suppress Fire | Is compatible suppression available and can it reach the Fire Zone? |
| Board Target | Is there a valid link/mobility method and accessible destination? |
| Secure Vessel | Are resistance, command, critical stations, hazards and custody requirements satisfied? |
| Tow Disabled Vessel | Do tow provider, attachment, environment and target stability satisfy 26G/26H interfaces? |

# 46. Performance Budgets and Scalability

Initial budgets are prototype targets for 26O validation, not final platform promises.

| Area | Budget Direction |
| --- | --- |
| Projectiles | Pool by importance; aggregate distant salvos; cap full trajectories per encounter. |
| Damage Updates | Recompute local structural/component neighbourhoods only. |
| Compartments | Simulate active or connected hazardous compartments; summarise stable sealed spaces. |
| Fire Zones | Scheduled updates with bounded adjacency and critical-item exceptions. |
| Crew | Promote visible/critical actors; aggregate distant station cohorts. |
| Boarding | Update local navigation links/zones only when topology changes. |
| Fleet Battles | Limit full physical participants by relevance; use reduced/summary levels for outer groups. |
| Debris | Aggregate small fragments; retain only gameplay-significant objects. |
| Networking | Replicate commands, snapshots and sparse changes rather than full voxel state every frame. |
| Saves | Journal sparse encounter deltas and periodic checkpoints. |

## 46.1 Redesign Thresholds

Redesign is required if ordinary combat needs full-vessel scans every shot, fire/flooding grows linearly with every voxel, multiplayer requires per-frame full compartment replication, or distant resolution cannot materialise its outcomes without rerolling.

# 47. Prototype Laboratories and Acceptance Tests

## 47.1 Combat Gunnery Laboratory

Two small commissioned vessels exchange a limited number of visible projectiles under calm conditions. Tests verify arcs, ammunition, recoil, impact location, sparse damage and repair evidence.

## 47.2 Flooding Laboratory

A controlled below-waterline breach opens into one compartment, then into connected spaces under different closure and pump states. Tests verify 26B/26G handoff, water mass, list, routes, drowning hazards and save/load.

## 47.3 Fire and Magazine Laboratory

Ignite ordinary cargo, fuel and ammunition under varied ventilation, rain and suppression. Verify bounded Fire Zones, smoke, heat, secondary events, crew tasks and accessibility settings.

## 47.4 Boarding Laboratory

Bring two vessels alongside, establish several link types, move AI/players between local frames, cut a link, contest control zones and accept surrender. Verify no teleport, ownership shortcut or navigation corruption.

## 47.5 Fleet and LOD Laboratory

Resolve the same seeded engagement in full tactical, reduced and abstract modes. Outcomes need not be identical shot-for-shot, but must remain statistically and structurally compatible, conserve resources and preserve evidence.

## 47.6 Coastal Siege Laboratory

Attack a harbour battery protecting a boom and dockyard. Verify structure damage, arcs, civilian zones, objective alternatives, port service consequences and repair handoff.

## 47.7 Save-Recovery Laboratory

Interrupt during firing, impact commit, surrender, prisoner transfer, boarding, flooding and Wreck Transition. Verify atomic recovery and no duplication or lost identity.

# 48. Risks, Failure Modes and Redesign Triggers

| Risk | Failure Mode | Required Response |
| --- | --- | --- |
| Health-Bar Collapse | Detailed vessel model exists visually but combat ignores it. | Block release until impacts create location-specific state and service effects. |
| Excessive Simulation | Every voxel, flame and water cell updates constantly. | Aggregate into sparse groups/zones and schedule by relevance. |
| Unreadable Chaos | Players cannot tell why vessel failed or what to do. | Improve alerts, surveys, reason codes, objectives and role-specific views. |
| Boarding Desync | Characters fall, teleport or duplicate between moving vessels. | Reduce link complexity, strengthen local-frame authority and test latency. |
| Instant Capture | Touching deck changes ownership. | Enforce control, surrender, custody and legal boundaries. |
| AI Omniscience | NPCs target hidden components and react perfectly. | Enforce knowledge confidence and observation. |
| Magic Exception Creep | Magical content bypasses all physical contracts. | Require facets, costs, counters, authority and evidence for every effect. |
| Persistent Grief | Fire/mines/wrecks make worlds unusable without settings or recovery. | Add caps, cleanup, warnings, ownership and repair/salvage routes. |
| Distant Unfairness | Abstract combat destroys assets without inspectable cause. | Preserve phase logs, inputs, evidence and configurable loss protection. |
| Optional-Pack Loss | Missing content corrupts old damage or weapons. | Quarantine definitions and retain stable fallback state. |
| Casualty Tone Mismatch | Harsh outcomes undermine cosy settings. | Separate danger, casualty and presentation settings. |
| Scope Explosion | Final weapon catalogue is authored inside the framework document. | Defer rosters to 26N/Atlas and retain capability templates only. |

# 49. Production Classification and Main-Document Integration

## 49.1 Suggested Production Bands

| Band | Scope |
| --- | --- |
| Foundation Prototype | One small weapon, impact/damage group, one breach, one pump, one fire zone, basic surrender and save/load. |
| Maritime Vertical Slice | Armed voyage, boarding, rescue, coastal battery, persistent wreck and 26K aftermath. |
| Alpha | Multiple weapon/mount families, fleet summaries, AI doctrine, magic/automation and multiplayer stations. |
| Beta | Broad content packs, siege variants, realm integration, accessibility matrix and migration coverage. |
| Final Expansion | Full Atlas/registry rosters, tuned balance, extensive quests, bosses and platform optimisation. |

## 49.2 Main-Document Integration Matrix

| Main Document | Required Later Amendment |
| --- | --- |
| 00 Master Bible | Add maritime combat as optional connected civilisation/adventure path. |
| 01 Core Loop | Add prepare, engage/avoid, damage-control, rescue, repair and aftermath loops. |
| 02 Progression | Add gunnery, seamanship, command, boarding, damage control and rescue tracks. |
| 03 Blocks | Add combat material, sealing, armour, mount and fire/heat facets. |
| 04 Items | Add ammunition, suppression, repair, boarding and rescue item families. |
| 05 Recipes | Add ammunition, weapon, patch, suppression and coastal-defence processes. |
| 07 NPC Village | Add maritime combat roles, casualties, veterans, prisoners and memorial effects. |
| 08 Automation | Add loading, pumping, suppression, targeting support and combat priorities. |
| 09 Magic | Add maritime wards, weapons, counters and hazard interactions. |
| 10 Creatures | Add vessel attack interfaces, boarding creatures and sea-boss integration through 26M. |
| 12 Structures | Add batteries, booms, harbour damage and siege state. |
| 13 Factions | Add doctrine, surrender law, prizes, civilian protection and naval reputation. |
| 15 Quests/Events | Add tactical objective and aftermath modules. |
| 16 Combat | Add moving-vessel, naval weapon and boarding extensions. |
| 17 UI/UX | Add station, damage-control, fleet and aftermath views. |
| 18 Technical | Replace legacy engine assumptions with 26O consolidated Godot architecture. |
| 19-20 Settlement/Buildings | Add port defence and damaged maritime service consequences. |
| 21-23 Forge/Presentation | Add weapon/mount authoring, damage states, sockets, audio and VFX event hooks. |
| 24 Atlas | Bind named weapons, navies, fortresses, wars, encounters and bosses to these contracts. |
| 25 Governance | Register final facets, relationships, capabilities, schemas, validations and backlog. |

# 50. Decision Register

| ID | Locked Decision |
| --- | --- |
| 26L-001 | Naval victory is objective-based; sinking is not universal. |
| 26L-002 | No single vessel health bar owns defeat or sinking. |
| 26L-003 | Damage resolves through vessel-local structure, components, compartments and occupants. |
| 26L-004 | Flooding is a 26B/26G/26L cooperative model using bounded compartment state. |
| 26L-005 | Fire and smoke use scheduled zones, not unrestricted per-voxel simulation. |
| 26L-006 | Boarding requires a valid physical/magical access relationship. |
| 26L-007 | Reaching a deck does not automatically transfer control or ownership. |
| 26L-008 | Tactical capture and legal title remain separate. |
| 26L-009 | Emergency patches persist and hand off to 26H for proper repair. |
| 26L-010 | Abstract encounters use the same definitions and produce physical-compatible evidence. |
| 26L-011 | Magic and automation obey costs, capabilities, counters and authority. |
| 26L-012 | Civilian harm, surrender violations and rescue behaviour are recorded for other systems. |
| 26L-013 | Small debris may aggregate, while significant vessel sections preserve identity. |
| 26L-014 | Named content and final balance remain deferred to Atlas and 26N. |
| 26L-015 | Final cross-platform UI/network/performance consolidation belongs to 26O. |

# 51. Handoff to Document 26M

Document 26M - Marine Ecology, Fishing, Sea Creatures, Dungeons and Bosses - consumes the combat interfaces defined here for creature-to-vessel and vessel-to-creature encounters.

## 51.1 Inputs 26M May Use

- Tactical Encounter lifecycle and objective families.
- Vessel-local impact, Damage Packet and defence interfaces.
- Creature attack as a Weapon Action or approved contact action.
- Boarding Link alternatives for climbing, attaching, burrowing or entering compartments.
- Fire, flooding, poison, corrosion, webbing, ink, magic and other tagged hazards.
- Crew injury, morale, rescue and man-overboard systems.
- Wreck, debris and salvage aftermath interfaces.
- Abstract encounter and promotion/demotion framework.

## 51.2 Authority Retained by 26M

26M owns creature identities, habitats, behaviour ecology, population pressure, taming where applicable, fishing, drops, lairs, marine dungeons and boss content. A creature's authored anatomy, motives and ecology are not defined by 26L.

## 51.3 Required 26M Outputs Back to 26L/26N

- Creature combat capabilities and vulnerable regions.
- Valid vessel-contact and boarding behaviours.
- Environmental and ecological conditions for encounters.
- Creature-caused damage/status definitions and counters.
- Ethical, faction and conservation consequences.
- Final registry roster and production classification inputs.

# Appendix A. Core Runtime Record Templates

```yaml
tactical_maritime_encounter:
  id: maritime_encounter:<ULID>
  context_source_ids: []
  participant_records: []
  environment_snapshot_id: evidence:<id>
  rules_of_engagement_ids: []
  objective_records: []
  engagement_state: contact
  simulation_level: full_tactical
  random_seed: 0
  reinforcement_records: []
  surrender_records: []
  survivor_group_ids: []
  wreck_transition_ids: []
  unresolved_hazard_ids: []
  outcome_record_id: encounter_outcome:<id> | null
  history_ref: history:<id>
  save_version: 1
```

```yaml
vessel_damage_group:
  id: vessel_damage:<ULID>
  vessel_id: vessel_instance:<id>
  cause_impact_ids: []
  local_element_refs: []
  component_refs: []
  structural_role_tags: []
  damage_channels: {}
  severity: damaged
  connectivity_effects: []
  boundary_effects: []
  temporary_repair_ids: []
  required_work_profile_ids: []
  discovered_confidence: 1.0
  history_ref: history:<id>
  save_version: 1
```

```yaml
compartment_hazard_state:
  id: compartment_hazard:<ULID>
  vessel_id: vessel_instance:<id>
  compartment_id: vessel_compartment:<id>
  breach_ids: []
  water_volume: 0.0
  ingress_rate: 0.0
  pump_output: 0.0
  fire_zone_ids: []
  smoke_level: 0.0
  heat_level: 0.0
  access_state: passable
  occupant_refs: []
  critical_content_refs: []
  last_evaluated_at: world_time
  save_version: 1
```

```yaml
boarding_link_instance:
  id: boarding_link:<ULID>
  encounter_id: maritime_encounter:<id>
  endpoint_a:
    owner_id: vessel_or_structure:<id>
    local_anchor_id: semantic_anchor:<id>
  endpoint_b:
    owner_id: vessel_or_structure:<id>
    local_anchor_id: semantic_anchor:<id>
  link_type: grapple_line
  capacity: 1
  stability: 1.0
  direction_policy: bidirectional
  hazard_tags: []
  control_owner_id: entity_or_force:<id> | null
  state: establishing
  save_version: 1
```

# Appendix B. Weapon, Damage and Defence Facet Templates

```yaml
naval_weapon_facet:
  definition_id: item_or_component:<qualified_id>
  weapon_action_ids: []
  supported_mount_capability_ids: []
  required_crew_role_ids: []
  ammunition_capability_ids: []
  power_or_mana_requirements: []
  loading_stage_profile_id: loading_profile.<id>
  fire_control_profile_id: fire_control.<id>
  heat_profile_id: heat_profile.<id> | null
  fault_profile_id: fault_profile.<id>
  recoil_profile_id: recoil_profile.<id>
  safe_operation_constraints: []
  presentation_event_ids: []
```

```yaml
combat_material_facet:
  material_id: material:<qualified_id>
  resistance_channels: {}
  penetration_behaviour_id: penetration.<id>
  fragmentation_profile_id: fragmentation.<id>
  flammability_profile_id: flammability.<id>
  heat_profile_id: heat_response.<id>
  sealing_profile_id: sealing.<id>
  corrosion_profile_id: corrosion.<id>
  water_absorption_profile_id: absorption.<id>
  magical_interaction_tags: []
  repair_capability_ids: []
```

```yaml
coastal_defence_facet:
  structure_definition_id: building_or_structure:<qualified_id>
  weapon_mount_ids: []
  observation_capability_ids: []
  command_station_ids: []
  protected_arc_records: []
  ammunition_storage_refs: []
  harbour_barrier_refs: []
  civilian_protection_zone_refs: []
  siege_objective_tags: []
```

# Appendix C. Reason-Code and Validation Catalogue

| Namespace | Purpose | Examples |
| --- | --- | --- |
| naval.encounter.* | Encounter context and lifecycle. | participant_invalid, objective_unresolved, phase_transition_denied. |
| naval.weapon.* | Weapon definition and runtime. | mount_incompatible, unloaded, overheated, crew_missing, muzzle_blocked. |
| naval.fire_control.* | Aim and safety. | target_unidentified, arc_blocked, solution_low_confidence, friendly_risk. |
| naval.impact.* | Collision and damage resolution. | collision_stale, target_element_missing, budget_exceeded. |
| naval.structure.* | Structural damage. | support_path_failed, attachment_lost, assessment_required. |
| naval.component.* | Functional systems. | network_isolated, control_link_failed, backup_unavailable. |
| naval.breach.* | Hull/closure openings. | boundary_invalid, patch_incompatible, access_blocked. |
| naval.flooding.* | Water and pumps. | pump_unpowered, discharge_blocked, compartment_unknown. |
| naval.fire.* | Fire/smoke/heat. | fuel_absent, suppression_incompatible, ventilation_unknown. |
| naval.damage_control.* | Emergency tasks. | tools_missing, route_unsafe, reservation_conflict. |
| naval.boarding.* | Contact and movement. | anchor_invalid, relative_speed_high, link_unstable, destination_blocked. |
| naval.control.* | Vessel zones and capture. | resistance_active, critical_station_unsecured, custody_invalid. |
| naval.surrender.* | Terms and compliance. | authority_missing, terms_conflict, compliance_incomplete, violated. |
| naval.rescue.* | Survivors and evacuation. | capacity_insufficient, sea_state_unsafe, group_unlocated. |
| naval.wreck.* | End-state transition. | identity_conflict, section_unresolved, inventory_reconciliation_failed. |
| naval.lod.* | Abstract/physical transition. | snapshot_stale, promotion_conflict, evidence_incomplete. |
| naval.presentation.* | UI/accessibility. | reason_text_missing, colour_only_warning, confidence_unlabelled. |

# Appendix D. Tactical Scenario Catalogue

## D.1 The Disabled Merchant

A pirate cutter demands cargo from a slower merchant. The merchant can surrender selected Cargo Lots, attempt escape through shoals, signal a patrol, conceal passengers or resist. The pirate may seek a prize rather than sinking. Outcomes preserve cargo custody, injuries, law evidence, vessel damage and relationship history.

## D.2 The Burning Escort

An escort completes its mission but catches fire near the magazine. The player must choose whether to continue screening the convoy, break away, flood the magazine, transfer wounded or abandon ship. Success is measured by protected convoy arrival and survivor outcome, not whether the escort remains combat-capable.

## D.3 Harbour Chain at Dawn

Attackers must open a harbour barrier while batteries cover the approach. Options include suppressing mounts, landing a boarding party, cutting anchors underwater, using concealment, negotiating betrayal or drawing defenders away. The barrier and facilities are physical structures with repairable damage.

## D.4 The Captured Flagship

A flagship surrenders after command and steering are disabled, but fires continue below deck and a faction officer threatens scuttling. The captor must secure stations, rescue crew, prevent sabotage and provide a prize crew. 26K later decides legal title and political consequence.

## D.5 Storm Rescue Under Fire

Two hostile forces disengage when a storm capsizes smaller craft. Players may continue pursuit, rescue allies only, rescue everyone or exploit the disaster. Sea state, survivor drift, capacity and legal/reputation evidence shape the result.

## D.6 Peaceful/Reduced-Conflict World

Hostile naval encounters are disabled or rare. The same systems support storms, accidental collision, fire, grounding, rescue drills, creature defence, training, salvage and scripted non-lethal interception. Catastrophic loss and casualty settings may be reduced independently.

# Appendix E. Acceptance Matrix

| ID | Acceptance Requirement |
| --- | --- |
| 26L-ACC-001 | A weapon cannot fire without valid definition, mount, resources, arc and authority. |
| 26L-ACC-002 | A projectile hit creates a stable impact record and location-specific damage. |
| 26L-ACC-003 | Structural consequences recompute locally and preserve unaffected vessel state. |
| 26L-ACC-004 | A below-waterline breach creates bounded ingress through 26B and changes 26G stability inputs. |
| 26L-ACC-005 | Pumps, closures and patches conserve resources and require real access/capability. |
| 26L-ACC-006 | Fire and smoke remain bounded, persistent and suppressible after save/load. |
| 26L-ACC-007 | Boarding requires a valid link and works between moving local frames. |
| 26L-ACC-008 | Capturing one zone does not automatically transfer vessel ownership. |
| 26L-ACC-009 | Surrender terms and violations persist and are returned to 26K. |
| 26L-ACC-010 | Survivors remain persistent groups until rescued, dead or otherwise resolved. |
| 26L-ACC-011 | Wreck Transition preserves vessel identity, sections, inventories and history. |
| 26L-ACC-012 | The same seeded abstract encounter conserves ammunition, cargo, crew and damage state. |
| 26L-ACC-013 | Promotion from abstract to physical combat does not reroll or heal outcomes. |
| 26L-ACC-014 | Multiplayer station control and damage-control reservations prevent duplication. |
| 26L-ACC-015 | Critical warnings remain understandable without colour and under reduced effects. |
| 26L-ACC-016 | Peaceful settings retain rescue, hazard, training and creature-defence use cases. |
| 26L-ACC-017 | Missing optional packs quarantine definitions without corrupting saves. |
| 26L-ACC-018 | A coastal battery affects combat only while its structure, crew and supplies are functional. |
| 26L-ACC-019 | Emergency patches hand off to valid 26H repair requirements. |
| 26L-ACC-020 | Every encounter produces inspectable objectives, major causes and persistent aftermath. |

# Appendix F. Document Completion Checklist

- Naval combat is objective-led and does not require destruction.
- Tactical encounter lifecycle and phase transactions are defined.
- Detection, identification, law and escalation use confidence and evidence.
- Command, crew stations, delegation and role freedom are supported.
- Weapon definitions, mounts, loading, firing arcs and fire control are separated.
- Mechanical, magical, ramming and deployed weapon interfaces are covered.
- Damage packets resolve through material, structure, components and compartments.
- Sparse Damage Groups and local structural recalculation are defined.
- Breaches, flooding, pumps, counter-flooding and 26G stability handoff are defined.
- Fire, smoke, heat, explosions and bounded propagation are defined.
- Damage-control tasks, temporary repairs and 26H handoff are explicit.
- Crew injuries, morale, civilians and casualties use existing entity systems.
- Boarding links, routes, control zones, surrender and capture are defined.
- Tactical control and legal ownership remain separate.
- Rescue, abandon ship, survivors, capsizing, sinking and Wreck Transition are persistent.
- Coastal batteries, harbour defence, barriers and siege objectives are integrated.
- Fleet combat, formations, doctrine and non-omniscient AI are defined.
- Environment, magic, automation, law, quests and progression are connected.
- UI, accessibility, multiplayer and split-screen requirements are declared.
- Full, reduced and abstract simulation levels reconcile without resource loss.
- Save recovery, optional-pack quarantine and migration are defined.
- Godot/Summer services avoid Node-per-voxel and unbounded recalculation.
- Set 25 facets, relationships, capabilities, reason codes and release evidence are defined.
- Performance budgets, prototype laboratories, risks and acceptance tests are complete.
- Main-document integration and production classification are mapped.
- Formal 26M handoff is complete.

**End of Document 26L - Naval Combat, Boarding, Damage, Flooding, Fire and Siege - Version 0.1**
