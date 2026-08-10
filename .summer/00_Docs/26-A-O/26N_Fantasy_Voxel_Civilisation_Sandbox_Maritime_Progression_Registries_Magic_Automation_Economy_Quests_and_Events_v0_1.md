# FANTASY VOXEL CIVILISATION SANDBOX

## DOCUMENT SET 26

# 26N - Maritime Progression, Registries, Magic, Automation, Economy, Quests and Events

*Version 0.1 - Cross-System Progression, Content Admission and Living Maritime World Contract Draft*

A registry-first integration framework that converts the water, vessel, port, fleet, combat and ecology systems established by Documents 26A-26M into reachable player progression, governed content definitions, practical maritime magic, resource-conserving automation, physical regional economies, simulation-driven quests and persistent world events.

Working design document - maritime progression, registry population, magic, automation, economy, quest and event integration foundation

| Field | Locked Direction |
| --- | --- |
| Document Role | Cross-system gameplay and data-contract authority for maritime progression, registry admission, magic applications, automation links, economy, quests, events and expansion-package composition. Detailed specialist behaviour remains in 26A-26M. |
| Core Philosophy | Maritime play is a connected capability web rather than a linear ship tier. Players may enter through shore survival, fishing, diving, shipwright work, trade, navigation, ecology, rescue, piracy, naval service, magic or settlement development. |
| Progression | Unlocks arise from tools, materials, knowledge, use-based skill, teachers, research, reputation, licences, facilities, vessels, routes, preparation and world outcomes. Overall level cannot substitute for missing physical capability. |
| Registry | Every definition, facet, relationship, capability, dependency, migration and validator follows Set 25. Core definitions keep their IDs when maritime behaviour is optional; expansion-only concepts use an admitted expansion identity. |
| Magic | Maritime magic extends existing schools and infrastructure. It supports navigation, weather reading, breathing, pressure protection, propulsion, pumping, wards, preservation, rescue and realm travel without invalidating mundane seamanship. |
| Automation | Automation scales pumps, winches, cranes, cargo, shipyards, preservation, fisheries and port logistics while conserving items, fluids, energy, labour, ownership and work. |
| Economy | Markets and contracts use real cargo, catches, fuel, provisions, spares, vessels, crews, claims, tariffs, route state and risk. No abstract profit detached from world transactions. |
| Quests and Events | Quests express valid needs and opportunities. Events arise from real weather, ecology, economy, factions, ports, vessels, sites, bosses and history and leave persistent aftermath. |
| Atlas Boundary | Set 24 owns named cultures, creatures, sites, bosses, material ecology and history. 26N maps approved foundations into executable registries without changing canon. |
| Technical Boundary | 26O owns final UI/UX, multiplayer authority, Godot/Summer Engine architecture, persistence, performance, QA, migration execution and main-document amendment matrix. |
| Final Authority | Ash retains final authority over namespace admission, production tier, progression scope, roster, balance and release approval. |

# DOCUMENT SET 26 - OCEANS, MARITIME CIVILISATION, VESSELS AND NAVAL SYSTEMS EXPANSION

# Document Purpose

Documents 26A-26M define the maritime world and its specialist behaviours. Document 26N turns those systems into one playable progression network and one governed production catalogue. It defines what can be learned, which physical provider enables it, which relationships and facilities are required, what alternatives exist, how the world makes the capability relevant, what consequence follows and which document owns the truth.

The design rejects both a rigid raft-to-battleship ladder and an unstructured catalogue where every component, spell, profession and port service is visible immediately. Readable capability bands provide milestones while multiple professions and world contexts provide alternate routes. A fisher, diver, shipwright, trader, sailor, naturalist, pirate, naval recruit or mage-engineer can enter maritime play from a different direction and later combine paths.

Registry integration keeps the world coherent. An oak plank remains the same block in a cottage, dock or hull. Maritime suitability is attached through declared facets. A Vessel Instance stores local voxel and mutable state rather than duplicating the block registry. A catch is reserved from an authoritative ecology source before it becomes an item or cargo lot. A port service activates only when its structures, workers, stock, access, power and permissions are valid. Quests reference these records instead of inventing parallel counters.

The result supports shoreline survival, ports and fleets, underwater expeditions, peaceful stewardship, commerce, piracy, naval command, practical magic and realm travel while remaining seed-generated, physical, inspectable and scalable.

# Design Sources, Authority and Supersession

| Source | Authority Consumed | 26N Boundary |
| --- | --- | --- |
| 00-02 | Sandbox freedom, interconnected loop, overall level, skills, perks, knowledge and mastery. | Maps maritime capability; replacement 02 owns final skill names and curves. |
| 03-06 | Separate blocks/items/recipes/resources, materials, tools, transformations, provenance and long-term use. | Defines maritime extensions and candidate families, not duplicate registries. |
| 07-09 | NPC jobs, warehouses, permissions, LOD, automation, mana, runes and practical magic. | Adds maritime jobs, providers and applications while retaining owners. |
| 10-17 | Ecology, worldgen, structures, cultures, realms, quests, combat and UI. | Adds maritime requirements and relationships only. |
| 19-20 | Player blueprints, projects, seven needs, real-resource construction and activation. | Ports, shipyards and fisheries use the existing settlement model. |
| 21-23 | Forge source, semantic blueprints, presentation manifests, sockets and events. | Records asset requirements; 26I and Forge sets own authoring. |
| 24A-24L | World context, cultures, ecology, sites, bosses, resources, history and package roadmap. | Maps approved Atlas content into executable packages. |
| 25A-25L | Governance, IDs, schemas, relationships, packs, validation, catalogues, chains, assets and backlog. | 26N is the maritime admission layer under Set 25. |
| 26A-26E | Authority, fluids, world generation, marine climate and aquatic interaction. | Progression bindings only. |
| 26F-26I | Vessel architecture, movement, construction and Vessel Forge. | Components, research, recipes and gates only. |
| 26J-26K | Ports, crews, trade, fleets, piracy, navies, law and regional power. | Progression, economy and quest/event bindings. |
| 26L | Naval combat, damage, boarding, capture and siege. | Weapon/ammunition progression, contracts and aftermath. |
| 26M | Ecology, fisheries, creatures, sites and bosses. | Resources, research, gear, quests, events and progression. |
| 26O | Technical and player-trust consolidation. | Receives complete gameplay requirements and evidence needs. |

> **Supersession Rule**
>
> Older POC-specific IDs, fixed-world assumptions, Unreal paths and incomplete maritime rules are superseded where they conflict with Sets 24-26. Existing saves and production records are never silently reinterpreted.

# Static Table of Contents

1\. Locked Maritime Integration Identity

2\. Decision Status and Recommendation Boundary

3\. Scope, Non-Goals and Ownership

4\. Cross-System Integration Architecture

5\. Progression Principles and Player Promises

6\. Maritime Capability Bands

7\. Entry Paths and Early Maritime Onboarding

8\. Skills, Practice and Mastery

9\. Perks, Specialisation and Respec

10\. Knowledge, Research and Discovery

11\. Tool, Equipment and Environmental Preparation Progression

12\. Vessel, Shipwright and Commissioning Progression

13\. Port, Crew and Maritime Civilisation Progression

14\. Trade, Fleet, Piracy and Naval Progression

15\. Fishing, Ecology, Diving and Adventure Progression

16\. Combat, Rescue and Damage-Control Progression

17\. Realm and Extraordinary Maritime Progression

18\. Reputation, Licences, Law and Access

19\. Canonical Registry and Namespace Admission

20\. Maritime Domain and Extension-Facet Map

21\. Block and Component Family Admission

22\. Item and Equipment Family Admission

23\. Resource, Catch, Loot and Provenance Admission

24\. Recipe, Process and Project Chain Admission

25\. Vessel, Port, Fleet and Runtime Record Map

26\. Creature, Site, Boss and Ecology Package Map

27\. Relationships, Capabilities, Suitability and Fallbacks

28\. Content Packs, Dependencies and Optional-Expansion Behaviour

29\. Progression Reachability and Seed Independence

30\. Maritime Magic Integration

31\. Water, Weather, Navigation and Survival Magic

32\. Vessel, Port and Infrastructure Magic

33\. Ritual, Realm, Corruption and Forbidden Maritime Magic

34\. Maritime Automation Integration

35\. Vessel Automation and Service Networks

36\. Port, Shipyard, Fishery and Cargo Automation

37\. NPC, Golem and Distant Automation

38\. Maritime Economy Integration

39\. Commodities, Markets and Regional Supply

40\. Contracts, Freight, Claims, Tariffs and Risk

41\. Labour, Maintenance, Shipbuilding and Fleet Costs

42\. Salvage, Prize, Bounty and Recovery Economies

43\. Quest Architecture and Objective Modules

44\. Profession, Voyage, Port and Construction Quests

45\. Fishing, Ecology, Exploration and Dungeon Quests

46\. Piracy, Naval, Diplomatic and War Quests

47\. Event Architecture and Maritime Event Families

48\. Weather, Disaster, Rescue and Port-Crisis Events

49\. Ecology, Migration, Boss and Realm Events

50\. History, Aftermath and World-State Memory

51\. Example Player Progression Paths

52\. Difficulty, Accessibility and Peaceful Alternatives

53\. Multiplayer and Shared-Progression Requirements

54\. UI, Codex and Player-Trust Data Requirements

55\. Atlas, Main-Document and Forge Integration

56\. Production Classification and Candidate Roster

57\. Validation, Release Gates and Evidence

58\. Prototype Laboratories and Acceptance Scenarios

59\. Handoff to Document 26O

60\. Open Decisions and Deferred Balance

Appendix A. Illustrative Qualified-ID Register

Appendix B. Capability Provider Matrix

Appendix C. Initial Family and Chain Catalogue

Appendix D. Quest and Event Templates

Appendix E. Reason-Code Catalogue

Appendix F. Completion Checklist

# 1. Locked Maritime Integration Identity

Maritime progression connects environmental possibility to player capability. Water can exist everywhere, but meaningful maritime play appears only when the player can read conditions, survive exposure, operate equipment, obtain permission, access or build facilities, control a suitable vessel, manage supplies and understand consequences. The system evaluates a capability graph rather than one level or technology tier.

A registry entry is not production-ready because it has a name and icon. It needs a source, use, owner, relationships, capability contribution, progression placement, fallback, presentation requirements, save behaviour and evidence. Maritime content is admitted as coherent packages that can generate, be discovered, be used by NPCs, enter the economy, appear in quests and survive migration.

| Identity Layer | Meaning | Player-Facing Result |
| --- | --- | --- |
| Physical Capability | Tools, gear, vessels, facilities, resources and environmental compatibility enable actions. | Progress is grounded in what the player has built, learned and supplied. |
| Practical Knowledge | Charts, signs, techniques, ecology and law determine what can be understood and attempted. | Exploration and relationships matter without arbitrary level walls. |
| Personal Mastery | Use-based skills and perks improve control, efficiency, safety and options. | Low skill usually means greater cost or risk, not constant random failure. |
| Civilisation Access | Ports, shipyards, specialists, markets and licences provide regional capability. | Helping or founding settlements unlocks services beyond personal crafting. |
| World Progression | Routes, storms, bosses, sites, conflicts and realm links alter opportunity. | The world opens through consequence, not only menu unlocks. |
| Registry Coherence | Qualified IDs, facets, relationships, packs and migrations keep definitions stable. | Saves, procedural worlds and later expansion remain maintainable. |
| Moral Breadth | Trade, stewardship, rescue, research, piracy, conquest and diplomacy are supported. | The game does not assume one heroic maritime identity. |

# 2. Decision Status and Recommendation Boundary

| Decision Class | Status | Rule |
| --- | --- | --- |
| Set 25 and prior Set 26 authority | Locked dependency | 26N cannot silently change an owner document. |
| Capability graph and integration rules | Locked working direction | Active when approved by Ash. |
| Candidate family and chain roster | Planning candidate | Eligible for replacement registries after classification and validation. |
| Costs, XP curves, prices, timings and rates | Balance draft | Proved through 26O prototypes and later balancing. |
| Expansion namespace and installation model | Recommendation pending freeze | Recommend `leyforge.expansion.maritime`; Ash and 25D/26O freeze the decision. |
| Skill names and perk counts | Proposed mapping | Replacement Document 02 owns the global list. |
| Named cultures, species, bosses, sites and history | Atlas-owned | 26N cannot invent canon to close a gap. |
| Godot classes, save schema and network protocol | 26O-owned | 26N states obligations and acceptance results only. |
| First shipping roster and tier | Ash-approved | 26N supplies evidence, not unilateral scope. |

# 3. Scope, Non-Goals and Ownership

## 3.1 In Scope

- Capability bands, entry paths, skill/knowledge mappings and seed reachability.
- Candidate block, item, resource, recipe, component, job, service, quest, event and pack families.
- Maritime extension facets and relationships for existing definitions.
- Practical magic, automation, physical economy, contracts, provenance and claims.
- Quest/event modules grounded in simulation state.
- Production classification, validation evidence and 26O handoff.

## 3.2 Explicit Non-Goals

- Rewriting the detailed systems in 26B-26M.
- Creating a historical ship-class ladder that constrains freeform construction.
- Finalising all numerical balance or promising a launch roster.
- Duplicating every Core material as a maritime material.
- Replacing the seven settlement needs with maritime-only bars.
- Simulating full real-world law, insurance, naval doctrine, biology or meteorology.
- Allowing level, magic, automation or quests to bypass physical resources and authority.
- Procedurally inventing missing quest entities or consequences.

## 3.3 Ownership Rule

26N owns the relationship between progression and specialist systems. The specialist document still owns the action. For example, 26N defines providers for Bilge Operations; 26B and 26L still own fluid and damage-control resolution.

# 4. Cross-System Integration Architecture

| Layer | Records | Owner | 26N Function |
| --- | --- | --- | --- |
| Definition Kernel | Qualified IDs, domains, facets, relationships, capabilities and tags. | 25B-25C | Declare maritime identities and extension requirements. |
| Content Packs | Manifests, dependencies, status, migration and optionality. | 25D-25G | Define coherent maritime packages. |
| Physical Content | Blocks, items, resources, recipes, components and projects. | Replacement 03-06 and specialists | Map families, chains, providers and consumers. |
| Character Progression | Skills, perks, knowledge, research and access. | Replacement 02 | Declare maritime mappings and alternate routes. |
| Civilisation | Jobs, settlements, services, law and reputation. | 07, 13, 19-20, 26J-26K | Connect services to progression and economy. |
| World Simulation | Water, climate, ecology, routes, sites, bosses and history. | 24 and 26B-26M | Use authoritative state as requirements and event sources. |
| Runtime Instances | Vessels, ports, cargo, catches, fleets, quests and events. | Specialist services / 26O | Define references, conservation and view-data needs. |
| Presentation | UI, codex, map, audio/VFX, Forge and accessibility. | 17, 21-23, 26O | Declare information and manifest obligations. |
| Validation | Reachability, conservation, seed QA, migration, LOD and performance. | 25E, 26O | Define acceptance scenarios and reason codes. |

Capabilities resolve registered relationships, never display-name keywords. A hull material may provide sealing through a facet; a pump provides displacement and damage-control capabilities; a shipyard service requires a functioning structure, workers, stock, power and permission. Quests require resolved capabilities rather than hard-coded items.

# 5. Progression Principles and Player Promises

| Principle | Locked Rule |
| --- | --- |
| Sandbox First | Guidance suggests goals but does not force a campaign or profession. |
| Multiple Providers | Important capabilities normally have craft, trade, salvage, teaching, research, magic or settlement alternatives. |
| No Abstract Substitution | Level, currency and reputation cannot replace a missing tool, vessel, route, supply or safe environment. |
| Old Materials Remain Useful | Wood, fibre, stone, copper, iron, cloth, glass, leather and basic mana retain repair, construction and local-craft uses. |
| Skill Improves Reliability | Practice improves control, efficiency, information and recovery. |
| Knowledge Matters | Observation, books, NPCs, ruins, experiments and instruments reveal hazards and methods. |
| Civilisation Scales Capability | Large vessels, ports and fleets require facilities, labour, logistics and institutions. |
| Consequences Persist | Overfishing, piracy, rescue, blockade, restoration and boss outcomes alter later play. |
| Peaceful Access | Fishing, trade, building, ecology, rescue, research and exploration remain valid in low-threat settings. |
| One Character Can Master All | Specialisation shapes pacing but does not permanently class-lock content. |
| Explainable Gates | The UI states the missing capability, provider, permission, material, environment or knowledge. |
| Seed Independence | No required path depends on one named port, wreck, species, teacher or structure. |

# 6. Maritime Capability Bands

| Band | Capability Promise | Representative Providers | Not a Hard Requirement |
| --- | --- | --- | --- |
| M0 - Shore Readiness | Read water hazards, swim/wade, gather shoreline resources, use flotation and perform basic rescue. | Movement, simple craft, local knowledge and shelter. | No vessel ownership required. |
| M1 - Littoral Work | Fish, dive briefly, operate a raft/open boat, read local weather and perform simple repairs. | Basic tools, local knowledge, small craft and beach/landing access. | May enter through fishing, salvage or employment. |
| M2 - Coastal Seamanship | Travel between nearby ports, operate propulsion, manage cargo and survive ordinary coastal weather. | Commissioned vessel, stations, charts, supplies and maintenance. | No fixed vessel class. |
| M3 - Bluewater Capability | Plan multi-day voyages, handle storms, maintain watertight systems and coordinate crew. | Seaworthy vessel, trained crew, advanced navigation and reserves. | Mundane, magical or hybrid support allowed. |
| M4 - Maritime Industry | Build/refit larger vessels and operate shipyards, ports, fleets and regional trade. | Specialists, facilities, automation, materials, law and markets. | Not a personal recipe unlock. |
| M5 - Strategic Maritime Power | Command fleets, protect/disrupt routes and shape diplomacy. | Logistics, intelligence, bases, authority and relationships. | Commercial, piratical, diplomatic or naval. |
| M6 - Extraordinary Maritime | Operate in abyssal, corrupted, frozen, stormbound or dimensional waters. | Specialised hull/gear, rituals, realm knowledge and stabilisation. | Does not invalidate earlier oceans. |

Bands are readability labels, not a staircase. A diver may reach an M6 site through a faction while lacking M4 shipyard authority. A trader may own an M3 vessel without captain skill. Settlements and individuals store resolved capabilities, not one maritime level.

# 7. Entry Paths and Early Maritime Onboarding

| Entry Path | First Teachable Loop | Early Reward | Expansion |
| --- | --- | --- | --- |
| Shore Survivor | Craft flotation, read tide/wave signs and cross or rescue. | Safety knowledge and shoreline resources. | Raft, fishing, shelter or village contact. |
| Fisher | Read signs, choose gear/bait, catch and preserve. | Food, trade and ecology knowledge. | Boat fishing, aquaculture, markets or conservation. |
| Diver / Salvager | Use breath, tether, tools and recovery in shallow water. | Materials, maps, specimens and clues. | Deep diving, underwater sites and salvage. |
| Shipwright Apprentice | Survey, shape material, seal a seam, install a component and launch. | Recipes, skill and facility access. | Commissioning, refit, yard management and Vessel Forge. |
| Sailor | Moor, handle lines, work a station and complete a short voyage. | Wages, skill and route knowledge. | Navigation, officer, trade, rescue or naval paths. |
| Trader / Courier | Accept cargo, reserve stock, plan route and deliver. | Currency, reputation and market knowledge. | Merchant vessel, convoy, guild or smuggling. |
| Naturalist / Mage | Observe ecology/weather, sample and calibrate an instrument or ward. | Codex, research and practical magic. | Restoration, bosses and realm travel. |
| Guard / Naval Recruit | Patrol, inspect, rescue and train at stations. | Authority, equipment access and command path. | Coast guard, navy or privateering. |

Onboarding follows the seed. Shore signs, rivers, lakes, travelling workers, wreckage, routes, villages, ruins, books and salvage can each expose the first capability. UI guidance never invents an absent provider.

# 8. Skills, Practice and Mastery

| Proposed Skill Family | Training Actions | Benefits | Owner Note |
| --- | --- | --- | --- |
| Watermanship | Swimming, surf entry, rescue, towing and cold-water practice. | Efficiency, control, recovery and hazard reading. | May merge with Survival/Athletics. |
| Diving | Breath planning, underwater tools, pressure, navigation and rescue. | Task stability, perception and emergency recovery. | 26E owns action truth. |
| Seamanship | Lines, anchoring, mooring, rigging, deck work and watches. | Station effectiveness, response and wear reduction. | Foundational maritime skill. |
| Navigation | Charting, bearings, sounding, weather and route planning. | Confidence, alternatives, discovery and safety. | Knowledge/instruments remain separate. |
| Shipwrighting | Survey, framing, sealing, building, repair, refit and inspection. | Quality, efficiency, defect detection and advanced work. | 26H owns execution. |
| Maritime Engineering | Pumps, engines, mana drives, networks and automation. | Reliability, diagnosis and emergency operation. | May share Engineering tree. |
| Fishing and Aquaculture | Gear, stock location, selective catch, handling and managed production. | Control, quality, stewardship and yield. | 26M owns ecology. |
| Marine Naturalism | Observation, habitats, signs, disease and conservation. | Knowledge, safer interaction and alternatives. | May extend general Naturalism. |
| Salvage and Recovery | Survey, claims, lifting, dismantling and restoration. | Yield quality, hazard detection and provenance. | Uses 26H and law. |
| Naval Gunnery | Load, aim, fire, maintain and handle ammunition. | Accuracy, coordination and fault control. | 26L owns combat. |
| Maritime Command | Orders, watches, morale, formations and emergency priorities. | Coordination and delegation. | Requires real authority and relationships. |
| Maritime Trade | Appraisal, contracts, cargo, customs and market intelligence. | Information, terms and risk planning. | Physical economy remains authoritative. |

XP comes from valid meaningful action, milestones, difficult conditions, teaching, emergency recovery, quality work, voyages and discoveries. Repeated no-effect commands do not train skills. Delegation may train leadership or diagnosis but not grant manual mastery for work never performed.

# 9. Perks, Specialisation and Respec

| Branch | Example Effects | Boundary |
| --- | --- | --- |
| Water Safety | Recovery, rescue reach, surf timing and cold adaptation. | Does not erase all danger outside settings. |
| Diver | Efficient tasks, tether handling, stealth and salvage. | Gear and site requirements remain. |
| Sailor | Faster rig work, lower wear and better station handoff. | Does not replace wind or stations. |
| Navigator | Confidence estimates, annotations and route alternatives. | Does not reveal undiscovered exact locations. |
| Master Shipwright | Surveys, substitutions, defects, repair quality and refits. | Cannot bypass structural validation. |
| Engineer | Diagnostics, tuning, emergency operation and automation efficiency. | Power and conservation remain. |
| Fisher / Steward | Selective catch, humane release, handling and restoration. | Cannot create stock above ecology truth. |
| Captain / Admiral | Orders, morale, formations and logistics. | Needs crews, authority and communication. |
| Corsair / Smuggler | Concealment, evasion and underworld contacts. | Law and consequences remain. |
| Maritime Mage | Efficient wards, navigation, preservation, rescue and hybrid propulsion. | Existing schools and mana remain authoritative. |

Respec changes perks, not discovered routes, knowledge, legal history or completed world outcomes. One character may eventually master all paths.

# 10. Knowledge, Research and Discovery

| Domain | Sources | Unlocks / Information |
| --- | --- | --- |
| Local Waters | Observation, fishers, pilots, charts and travel. | Tides, shallows, hazards, anchorages and route confidence. |
| Weather and Ocean Signs | Clouds, swell, instruments, mages, logs and observatories. | Forecast confidence and preparation. |
| Vessel Construction | Shipwrights, blueprints, dismantling, books and experimentation. | Roles, materials, components, stages and defects. |
| Navigation Science | Teachers, instruments, stars, leylines and ruins. | Position methods, charting and long routes. |
| Marine Ecology | Observation, samples, catch logs, naturalists and aquaculture. | Habitats, migrations, protected states and restoration. |
| Maritime Law | Authorities, contracts, trials, guilds and captured documents. | Customs, salvage, prize, licences and passage. |
| Trade Intelligence | Markets, manifests, rumours, scouts and history. | Prices, shortages, risks and disruption confidence. |
| Naval Doctrine | Training, officers, records and captured plans. | Formation, signals, weapons and boarding options. |
| Underwater Sites | Maps, artefacts, dives, magic and evidence. | Access, hazards, lore and boss warnings. |
| Realm Maritime | Portals, native cultures, rituals and bosses. | Realm hull, survival, route and stabilisation requirements. |

Knowledge states include unknown, hinted, observed, recorded, taught, researched and mastered. Confidence is separate from truth. Damaged or old charts may be valuable but uncertain; research cannot reveal unseen world state without evidence.

# 11. Tool, Equipment and Environmental Preparation Progression

| Capability | Early Providers | Advanced Providers | Fallback |
| --- | --- | --- | --- |
| Flotation | Simple float, raft and life ring. | Rescue boat, magical buoyancy and vessel systems. | Assisted recovery or shore route. |
| Breathing | Personal breath and air pockets. | Air supply, bell, suit and water-breathing magic. | Shorter task or surface support. |
| Thermal Protection | Cloth, timing and warm shelter. | Oiled/insulated gear, heated vessel and ward. | Avoid season or use rescue support. |
| Pressure Protection | Depth limits and brief exposure. | Reinforced gear, habitat and magic. | Remote tools, shallow route or later return. |
| Navigation | Landmarks, sun and sounding line. | Compass, charts, celestial/arcane instruments and beacons. | Pilot, escort or wait. |
| Hull Work | Axe, hammer, fibre and pitch. | Shipwright kit, crane, dry dock and magic seal. | Patch or tow. |
| Fishing | Hand gathering, line, basket and spear. | Selective nets, vessel gear and aquaculture. | Trade or alternate food. |
| Salvage | Rope, pry tool and shallow dive. | Lift bags, cranes, pumps and restoration lab. | Mark and return or hire specialist. |
| Combat Safety | Personal gear, cover, escape and signal. | Vessel weapons, wards, damage-control gear and escort. | Surrender, evade or negotiate. |
| Cargo Preservation | Dry storage, salt, smoke and fast delivery. | Cold chain, sealed hold, alchemy and runes. | Process locally or accept quality loss. |

# 12. Vessel, Shipwright and Commissioning Progression

| Layer | Provider | Result | Authority |
| --- | --- | --- | --- |
| Improvised Float | Simple materials and water interaction. | Temporary flotation; not automatically a Vessel Instance. | 26E/26F. |
| Small Craft | Knowledge, tools, compatible blocks, site and Vessel Anchor. | Candidate craft and structural scan. | 26F/26H. |
| Commissioning | Valid structure, ownership, stations and transaction. | Persistent Vessel Instance. | 26F. |
| Movement Certification | Buoyancy, stability, propulsion, steering and envelope. | Sheltered/coastal/open-water restrictions. | 26G. |
| Repair / Refit | Facility, materials, work packages and permissions. | Condition recovery or configuration change. | 26H. |
| Blueprint Mastery | Workshop/Forge access and validated source. | Reusable vessel blueprints and variants. | 26I. |
| Industrial Shipbuilding | Shipyard, labour, cranes, supply and quality control. | Parallel projects, larger vessels and fleet replacement. | 26J/26H. |
| Specialised Vessels | Research, faction/culture knowledge and specialist components. | Fishing, salvage, combat, exploration, magical or pressure craft. | 26F-26N. |
| Extraordinary Vessel | Realm materials, rituals and advanced engineering. | Operation in exceptional waters. | 26N plus realm owners. |

Material tier does not define vessel size. Structural, movement, construction and service capabilities are evaluated separately. Owning a blueprint does not grant resources, skill, facilities or legal permission.

# 13. Port, Crew and Maritime Civilisation Progression

| Capability | Required Providers | Settlement Effect | Progression Use |
| --- | --- | --- | --- |
| Landing / Anchorage | Safe approach, shore access and mooring/anchor. | Basic route connection. | First contact and local fishing. |
| Working Waterfront | Cargo access, storage, labour, route, safety and permission. | Work, provisions, infrastructure and trade. | Freight, repairs, market and recruitment. |
| Port Services | Authority, berths, pilots, charts, rescue, customs and supplies. | Safety, infrastructure, work and morale. | Regional routes and larger vessels. |
| Shipyard | Sites, shipwrights, tools, stock, launch route and quality control. | Jobs, industry, defence and replacement. | M4 industry. |
| Fishing Harbour | Ecology access, fleet, processing, preservation and market. | Provisions, work and ecological pressure. | Commercial or stewardship path. |
| Naval / Security Base | Authority, crews, supplies, maintenance and intelligence. | Safety and political power. | Patrol, escort and naval/privateer progression. |
| Research Port | Chart house, naturalists, divers, laboratories and supplies. | Knowledge, morale and special trade. | Sites, bosses and realms. |
| Maritime Capital Network | Specialised districts, routes, fleets and diplomacy. | Regional power within existing settlement ladder. | Strategic play. |

Port capability comes from active services, not stage or appearance. A small island may have excellent pilotage and no shipyard; a capital can lose maritime capability after harbour damage. The seven settlement needs remain authoritative.

# 14. Trade, Fleet, Piracy and Naval Progression

| Path | Early | Middle | Late |
| --- | --- | --- | --- |
| Merchant | Courier work and local cargo. | Owned/chartered vessel, crew and coastal routes. | Company, convoy and regional agreements. |
| Fleet Operator | Coordinate multiple craft or escorts. | Persistent fleet and shared logistics. | Bases, reserves and regional missions. |
| Smuggler | Restricted cargo and evasive route. | Contacts, concealment and hidden ports. | Network influence and extraordinary cargo. |
| Pirate | Opportunistic theft or intimidation. | Crew, haven, prizes, fences and notoriety. | Pirate polity, tribute network or legitimacy. |
| Privateer | Earn a restricted commission. | Prize capture, patrol and political obligations. | Squadron command and changing commissions. |
| Coast Guard / Navy | Watch, inspection, rescue and patrol. | Escort, interdiction, command and bases. | Regional defence, blockade, war and treaties. |
| Diplomat / Official | Resolve access, fees, claims and customs. | Negotiate passage and mutual support. | Basing rights, ceasefires and maritime law. |

# 15. Fishing, Ecology, Diving and Adventure Progression

| Layer | Gate | Outcome |
| --- | --- | --- |
| Shore Harvest | Safe access, identification and hand tool. | Food, bait, fibre/samples and ecology knowledge. |
| Selective Fishing | Gear, habitat/time knowledge, handling and source cohort. | Reliable food/trade with lower bycatch. |
| Boat Fishery | Vessel, crew, storage, route and weather preparation. | Commercial lots and seasonal contracts. |
| Aquaculture | Suitable site, stock, feed, water quality and facility. | Managed production, jobs and health/escape risks. |
| Scientific Diving | Breath/pressure capability, instruments and return plan. | Research, codex and non-lethal progression. |
| Wreck / Dungeon Expedition | Knowledge, equipment, claim/permit and recovery capacity. | Loot, lore, restoration and persistent site change. |
| Boss Territory | Evidence, preparation, motive and alternatives. | Combat, rescue, bargaining, cleansing, redirection or protection. |
| Regional Stewardship | Monitoring, law, habitat works and diplomacy. | Recovery, trust, economy stability and stories. |

# 16. Combat, Rescue and Damage-Control Progression

| Capability | Sources | Upgrade Meaning |
| --- | --- | --- |
| Lookout / Threat Reading | Practice, instruments, intelligence and knowledge. | Earlier identification and more options, not omniscience. |
| Damage Control | Training, pumps, tools, access, crew and spares. | Faster prioritisation and survival. |
| Naval Weapons | Knowledge, station, ammunition, crew and authority. | Handling, accuracy, reload and fault control. |
| Boarding / Defence | Combat, seamanship, grapples, access and command. | Safer transitions and non-lethal capture. |
| Rescue | Flotation, boats, ropes, medics and signals. | Wider rescue window and better aftermath. |
| Surrender / Command | Authority, language, signals, reputation and law. | Negotiation, morale and prize procedure. |
| Coastal Siege | Fleet/fortification logistics, intelligence and authority. | Objective-led operations and persistent aftermath. |
| Recovery | Claims, repair, medicine and records. | Tow, restoration, restitution and legal resolution. |

# 17. Realm and Extraordinary Maritime Progression

| Context | Required Capabilities | Safeguards |
| --- | --- | --- |
| Abyssal Trenches | Pressure, darkness, navigation, life support and rescue. | No ordinary vessel silently certified; return plan required. |
| Icebound Waters | Cold, ice detection, reinforced movement and shelter. | Season and route alternatives. |
| Storm / Leyline Seas | Field reading, stabilisation, reserve propulsion and wards. | Warnings, abort paths and bounded magic. |
| Corrupted Waters | Containment, cleansing, handling, law and ecology. | No loot incentive that ignores harm. |
| Living / Sentient Seas | Personhood, territory, diplomacy, compatible materials and rituals. | Combat not assumed. |
| Dimensional Routes | Portal authority, anchor, fuel, destination confidence and return. | Persistent route; no UI-only teleport. |
| Ancient Infrastructure | Language, power, repair, ownership and stabilisation. | Restoration and exploitation outcomes explicit. |
| Titan Migration | Regional intelligence, fleets/ports, ecology and alternatives. | Observe, divert, protect, survive or confront. |

# 18. Reputation, Licences, Law and Access

| Layer | Examples | May Unlock | Cannot Replace |
| --- | --- | --- | --- |
| Individual Trust | Teacher, captain, shipwright, diver or official. | Training, contracts, warnings and workspace. | Physical skill or wider legal authority. |
| Settlement Reputation | Port, fishery, island, yard or enclave. | Berths, services, projects and recruitment. | Faction-wide trust. |
| Faction Reputation | Guild, navy, pirate network or conservation order. | Routes, licences, specialists and stories. | Universal legality. |
| Professional Licence | Pilot, salvage, fishery, privateer, research or weapons. | Permission within scope. | Capability or success. |
| Ownership / Claim | Vessel title, cargo custody, salvage or prize ruling. | Control and transaction rights. | Physical possession if contested. |
| Notoriety / Fear | Piracy, smuggling or naval action. | Intimidation, contacts and pursuit. | Positive trust. |
| Treaty / Passage | Trade, rescue, basing or protected-water agreement. | Route access and cooperation. | Permanent safety. |

# 19. Canonical Registry and Namespace Admission

Production records use `<namespace>.<domain>.<identity_path>`. 26N recommends `leyforge.expansion.maritime` for identities that exist only because Set 26 is installed. The token becomes locked only after Ash approves the installation model and 25D/26O record manifests, dependencies and removal behaviour.

Core identities retain `leyforge.core` when maritime behaviour is an extension facet. Oak planks do not become maritime oak planks; their Core definition may gain density, absorption, sealing, corrosion and role-suitability fields. A purpose-built capstan may receive an expansion identity. Shared rope remains Core if it already exists independently.

| Identity Case | Treatment | Example |
| --- | --- | --- |
| Core definition gains maritime behaviour | Keep Core ID; add admitted facet/relationship. | Core oak planks plus maritime material facet. |
| Concept unique to Set 26 | Expansion-owned identity. | `leyforge.expansion.maritime.component.vessel.capstan.basic`. |
| Atlas creature/site/boss | Keep Atlas identity; add executable facets. | Boss territory and encounter extensions. |
| Vessel blueprint | Blueprint ID separate from Vessel Instance. | Official/player source plus save ULID. |
| Generated route/port/fleet | Definition references plus persistent instance identity. | World save record. |
| Presentation asset | Presentation namespace/manifest reference. | Icon, animation, sound and VFX. |
| Prototype | `leyforge.test` or `leyforge.dev`. | Never a production fallback. |
| Retired POC | Archive namespace and tombstone. | Never production-generated. |

# 20. Maritime Domain and Extension-Facet Map

| Domain / Facet | Purpose | Primary Owner |
| --- | --- | --- |
| fluid / marine environment | Saltwater, brine, contamination and query compatibility. | 26B-26D. |
| block.maritime_material | Mass, sealing, absorption, corrosion, fouling, pressure and role suitability. | 03 replacement + 26F/26N. |
| item.maritime_use | Rigging, repair, diving, fishing, navigation, cargo and survival use. | 04 replacement + 26N. |
| recipe.maritime_process | Components, preservation, shipyard, fishery and salvage transformations. | 05 replacement + 26H/26N. |
| resource.maritime_provenance | Catch, habitat, salvage, claim, quality and renewability. | 06 replacement + 24J/26M/26N. |
| vessel / vessel_profile | Capability expectations, operating envelopes and roles. | 26F-26G/26N. |
| component_role | Structural, propulsion, control, cargo, station, rescue and service roles. | 26F-26I. |
| port_service | Berth, pilot, rescue, shipyard, customs, cargo and supply. | 26J/26N. |
| fleet / voyage / contract | Strategic groups, movement and obligations. | 26K/26N. |
| fishery / ecology extension | Methods, source cohorts, restrictions and aquaculture. | 26M/26N. |
| quest / event modules | Objectives, conditions, warnings and aftermath. | 15/26N. |
| capability.maritime.* | Provider/requirement vocabulary. | 25C/26N. |
| presentation manifest | Icons, overlays, poses, audio/VFX and warnings. | 23/25K/26O. |

# 21. Block and Component Family Admission

| Family | Canonical Treatment | Functions | Production Notes |
| --- | --- | --- | --- |
| Hull-Capable Materials | Existing blocks plus maritime-material facets. | Shell, frame, deck, bulkhead, ballast housing and repair. | No vessel-only duplicate unless physically distinct. |
| Watertight Closures | Expansion block/component families. | Hatch, watertight door, portlight, valve and closure state. | Bind to 26B/26F compartment truth. |
| Control Components | Expansion components. | Helm, tiller, linkage, telegraph and command station. | 26G owns movement response. |
| Propulsion Components | Components or assemblies. | Mast, sail attachment, oarlock, paddle drive, propeller/engine mount and mana drive. | 26F/26G/26I own architecture. |
| Anchoring / Mooring | Vessel and port blocks/components. | Anchor mount, windlass, capstan, bollard, cleat and ring. | Load and authority explicit. |
| Fluid / Damage Control | Functional families. | Bilge inlet, pump, valve, drain, sensor and emergency seal. | No fluid truth outside 26B. |
| Cargo / Provisioning | Storage and interfaces. | Tie-down, hold zone, cold store, water tank, feed bin and transfer hatch. | Capacity comes from real storage. |
| Navigation / Signalling | Functional components/structures. | Compass mount, chart table, sounding station, beacon and signal mast. | Knowledge confidence remains separate. |
| Shipyard / Harbour Works | Structure and functional families. | Slipway, cradle, dry-dock gate, caisson, crane, pump house and marker. | Document 20 function plus 26H/26J facets. |
| Fishing / Aquaculture | Functional blocks/structures. | Trap, net frame, hatchery tank, cage, processing table and cold store. | Link to 26M ecology. |
| Defence / Naval | Mounts, barriers and support. | Weapon station, ammunition locker, armour role, harbour chain and battery socket. | 26L owns tactical effects. |
| Diving / Underwater | Structures/components. | Air station, bell mount, tether reel, pressure hatch, beacon and habitat service. | 26E/26B own player and air/fluid truth. |
| Magical Maritime | Existing magic blocks plus variants/facets. | Ward mast, current reader, weather lens, preservation rune, mana pump and route anchor. | No new school by default. |

# 22. Item and Equipment Family Admission

| Item Family | Representative Entries | Progression / Use |
| --- | --- | --- |
| Shipwright Tools | Adze, caulking iron, mallet, auger, seam gauge, surveyor, rigging knife and repair kit. | Construction, sealing, inspection, repair and refit. |
| Cordage / Rigging | Line, rope, cable, chain, pulley block, shackle, hook and net twine. | Mooring, sails, cranes, rescue, towing, fishing and salvage. |
| Sail Materials | Sailcloth, treated cloth, reinforced/magical membrane and patch. | Wind propulsion and cultural variants. |
| Navigation Instruments | Compass, chart, sounding line, log, celestial instrument, weather glass and arcane reader. | Knowledge confidence and route planning. |
| Diving Equipment | Weights, fins, mask, air container, hose, helmet, suit, tether and lift bag. | Depth, pressure, visibility and salvage. |
| Safety / Rescue | Life ring, flotation vest, rescue line, signal, medical pack and emergency beacon. | Man-overboard and disaster response. |
| Fishing Gear | Rod, hook, lure, bait box, spear, hand net, selective net, trap and tagging kit. | Method, bycatch and research. |
| Catch / Seafood | Fresh catch lot, shellfish, seaweed, roe, oil and processed products. | Food, trade, bait, alchemy and culture goods. |
| Cargo / Documents | Manifest, seal, bill of lading, licence, claim, commission, chart and logbook. | Authority, custody and evidence. |
| Vessel Spares | Patch, fastener, sealant, rope, sail patch, pump part, bearing, rune core and fuse. | Maintenance and damage control. |
| Naval Stores | Bolts, stones, shot, fuel/charge, grapples and fire-control equipment. | 26L combat and logistics. |
| Research / Relics | Sample container, specimen, tag, tablet, lens, artefact and boss evidence. | Codex, research, restoration and realm progression. |
| Provisioning | Salt, barrel, dried/smoked fish, oil, ration, water container and cold charge. | Voyage endurance and quality. |
| Cultural Maritime Goods | Culture-owned craft, instruments, ceremony and specialist components. | Identity, trade and story; no biological determinism. |

# 23. Resource, Catch, Loot and Provenance Admission

| Resource Class | Source Truth | Required Provenance | Consequence |
| --- | --- | --- | --- |
| Shoreline Organics | Biome/ecology patch and harvest method. | Region, habitat, time, condition and harvester. | Seasonal recovery and habitat pressure. |
| Marine Catch | 26M cohort/stock reservation. | Family, source patch, method, class, condition, law and owner. | Population and bycatch effects. |
| Aquaculture Output | Facility, stock lineage, feed and health. | Facility, batch, inputs, treatment and time. | Renewable only with functioning management. |
| Salt / Brine | Fluid source and processing. | Water body, contamination and process. | Waste or local pressure. |
| Hull / Rig Materials | Core sources and refinement. | Material, quality, treatment and source. | Persistent maintenance demand. |
| Creature Materials | Creature interaction and welfare/personhood rules. | Individual/cohort, method, cause, claim and law. | Non-lethal alternatives where appropriate. |
| Wreck Salvage | Persistent wreck/site and removal transaction. | Wreck, component/cell, claim, condition and salvager. | Finite; site changes. |
| Prize Cargo / Vessel | Capture, surrender and legal resolution. | Prior owner, encounter, ruling, custody and restitution. | Cannot duplicate original inventory. |
| Site Loot | Persistent site grammar and source. | Site, room/source, history, owner, uniqueness and state. | No reset chest. |
| Boss Reward | Outcome and aftermath grammar. | Boss, resolution, participants, ecology and uniqueness. | Knowledge/access may replace physical loot. |
| Realm Materials | Realm source, stabilisation and return route. | Realm, source, contamination, custody and processing. | Extraction limits and realm consequences. |
| Recovered Knowledge | Logs, charts, artefacts, witnesses and research. | Source, confidence, language, owner and copy state. | Information copies do not duplicate unique artefacts. |

# 24. Recipe, Process and Project Chain Admission

| Chain | Inputs / Providers | Output / Capability | Fallback |
| --- | --- | --- | --- |
| Cordage / Sailmaking | Fibre/cloth, tools, station, skill and treatment. | Rope, nets, sailcloth and rigging. | Trade, salvage or culture provider. |
| Hull Preparation / Sealing | Compatible materials, fasteners, sealant, tools and worksite. | Hull parts, sealing quality and work packages. | Alternative family or temporary patch. |
| Fittings / Anchors | Refined metal, forge, patterns and labour. | Fasteners, chain, anchors, rudder parts and reinforcement. | Simple wood/stone alternatives within limits. |
| Pumps / Machinery | Frames, pipes, seals, moving parts, power and engineering. | Pumps, winches, cranes and service networks. | Manual pump, bucket chain or facility service. |
| Navigation / Charts | Materials, observations, knowledge, calibration and workstation. | Instruments, chart records and confidence. | Pilot, landmarks or escort. |
| Diving Equipment | Metal/leather/glass/cloth, seals, air source and testing. | Depth/task and rescue capability. | Shallow dive, bell or magic. |
| Fishing / Processing | Cordage, hooks, bait, catch, fuel/salt and station. | Method capability, preserved food and by-products. | Trade or alternate provisions. |
| Vessel Project | Plan/blueprint, site, materials, labour, tools and stages. | Commissionable vessel candidate. | Smaller craft, charter, purchase or delay. |
| Port / Shipyard Project | Universal function, blueprint, survey, stock and workers. | Active service and settlement contribution. | Regional port or temporary landing. |
| Repair / Refit / Salvage | State, claim, survey, tools, parts, facility and labour. | Condition recovery, change or recovered stock. | Jury repair, tow or decommission. |
| Ammunition / Defence | Materials, dangerous-process station, law and quality. | Weapon supply and readiness. | Avoidance, escort or non-lethal options. |
| Maritime Magic | School knowledge, focus/rune, mana, components and station/ritual. | Navigation, sealing, preservation, rescue, propulsion or realm capability. | Mundane provider. |
| Aquaculture / Habitat | Site, stock, water, feed, structures, labour and ecology knowledge. | Managed production or restoration. | Selective wild fishery, trade or alternate food. |
| Research / Restoration | Evidence, specialists, site/lab and time. | Knowledge, safer methods, restored site/habitat or new capability. | Teacher, alternate evidence or later return. |

A crafting grid never directly outputs a commissioned vessel, functioning port or restored ecosystem. Large outcomes use staged projects and authoritative completion transactions. Planning may estimate costs but does not reserve or consume resources.

# 25. Vessel, Port, Fleet and Runtime Record Map

| Runtime Record | Definition References | Mutable Owner | 26N Requirement |
| --- | --- | --- | --- |
| Vessel Instance | Blueprint, block/component definitions, profile and capabilities. | Vessel service/save. | Progression and quests use stable instance identity. |
| Crew Assignment | NPCs/jobs, stations, contract and authority. | NPC/crew service. | Training, wages, fatigue and contribution persist. |
| Port Call | Vessel, port, berth/service, cargo and permissions. | Port service. | Quests reference actual transactions. |
| Voyage | Vessel/fleet, route, cargo, crew, plan and environment. | Voyage/fleet service. | Risk, discovery and aftermath auditable. |
| Cargo Lot | Item/resource, owner, container and contract. | Inventory/economy service. | No abstract duplication; provenance/condition preserved. |
| Fleet | Member vessels, commander, mission, formation and logistics. | Fleet service. | Command access cannot invent vessels. |
| Fishery Operation | Method, vessel/facility, source cohort, crew and law. | Ecology/fishery service. | Catch and depletion reconcile. |
| Salvage Operation | Wreck/site, claim, workers, tools and plan. | Salvage/project service. | Recovered stock is one transaction. |
| Maritime Contract | Parties, obligations, route/cargo/service and consequences. | Economy/quest service. | Quest wrapper cannot contradict contract truth. |
| Maritime Event | Sources, region, participants, phases and aftermath. | Event service. | Continues without quest acceptance. |
| Research Record | Evidence, subject, confidence, owner and unlocks. | Knowledge service. | No spoiler without source. |
| Licence / Claim / Commission | Issuer, holder, scope, jurisdiction, dates and violations. | Law/faction service. | Access and legality explicit and revocable. |

# 26. Creature, Site, Boss and Ecology Package Map

| Package | Dependencies | Required Outputs |
| --- | --- | --- |
| Marine Habitat | Biome/water fields, substrate, depth, season and Atlas context. | Suitability, ecology patches, presentation and LOD. |
| Creature Family | Atlas identity, habitat, lifecycle, actions, senses, alternatives and personhood review. | Executable facets, knowledge, encounters and ecology links. |
| Fishery | Cohorts, methods, gear, catch, restrictions and consumers. | Selective loop, bycatch/law, processing and recovery. |
| Aquaculture | Stock, water/site requirements, feed, health, facility and outputs. | Lifecycle, disease/escape and harvest chain. |
| Marine Dungeon | Grammar, water/air/access, ecology, hazards, loot, history and restoration. | Seed-valid generation, persistence, hooks and return path. |
| Marine Boss | Identity, territory, evidence, ecology function, actions, alternatives and aftermath. | Encounter path, non-damage review and regional outcome. |
| Wreck Ecosystem | Vessel/wreck source, history, ecology, salvage and law. | Persistent site, finite salvage and habitat change. |
| Realm Maritime | Realm, route, environment, ecology/culture, materials and return. | Capability-complete access, survival, economy and aftermath. |

# 27. Relationships, Capabilities, Suitability and Fallbacks

| Relationship | Example | Validation |
| --- | --- | --- |
| provides_capability | Pump provides bilge displacement; chart house provides route intelligence. | Provider active and version admitted. |
| requires_capability | Voyage requires coastal navigation and seaworthy operation. | All hard requirements resolve. |
| suitable_for_role | Material suitable for hull shell or sail. | May be conditional by environment, scale or treatment. |
| excluded_from_role | Untreated absorbent material excluded from pressure bulkhead. | Generic substitution cannot bypass exclusion. |
| consumes / produces | Processing consumes catch and salt and creates food/by-products. | Quantity and ownership reconcile atomically. |
| operates_at_station | Crew operates helm, pump, weapon or crane. | Access, role and authority required. |
| teaches / unlocks | Pilot teaches route; ruin reveals instrument design. | Source and discovery recorded. |
| licensed_by / lawful_in | Fishery method licensed by harbour authority. | Jurisdiction, time and scope checked. |
| routes_to / serviced_by | Settlement routes to port; vessel serviced by yard. | Physical route/service exists. |
| harvests_from | Method harvests from cohort/stock. | Reservation and ecology consequence required. |
| restores / damages | Habitat project restores reef; pollution damages nursery. | Authoritative world/ecology state changes. |
| fallback_provider | Pilot substitutes for missing advanced chart. | Preserves essential capability and avoids cycles. |
| optional_extension_of | Maritime facet extends Core definition. | Base remains valid; unknown facet preserved/quarantined. |
| owned_by / claimed_by | Vessel, cargo, salvage and prize ownership. | Transfer is authoritative and historical. |
| located_in_frame | Component/actor in vessel-local frame. | Local reference persists; world transform derived. |

# 28. Content Packs, Dependencies and Optional-Expansion Behaviour

| Proposed Pack | Contents | Required Dependencies | Optional Links |
| --- | --- | --- | --- |
| maritime.foundation | Capabilities, facets, tags, common components and migration declarations. | Set 25 kernel, Core registries and 26A-26E. | Presentation. |
| maritime.small_craft | Rafts/open boats, basic components, shore tools and teaching. | Foundation, 26F-26G and physical registries. | Culture and fishing. |
| maritime.shipwright | Tools, work packages, yards, repair/refit/salvage and Forge definitions. | Foundation, 26F-26I, settlement/building. | Automation and culture. |
| maritime.ports_crews | Port services, jobs, crews and harbour structures. | Foundation, 26J, settlement/NPC. | Trade, navy and research. |
| maritime.trade_fleets | Cargo, contracts, voyages, fleets, markets, customs, piracy and power. | Ports/crews, economy/quests and 26K. | Combat and faction packs. |
| maritime.naval_combat | Weapons, stores, damage-control progression, boarding and siege. | Vessels, ports, combat and 26L. | Doctrine packs. |
| maritime.ecology_fisheries | Habitat extensions, fishing, aquaculture, catches and research. | World/ecology, physical registries and 26M. | Culture goods and trade. |
| maritime.sites_bosses | Marine dungeons, wrecks, boss territories and rewards. | Worldgen, ecology, combat/quest and Atlas. | Realm and fleet packs. |
| maritime.magic_automation | Spells/runes, pumps, cranes, preservation and hybrid systems. | Magic, automation and foundation. | Realm/culture technology. |
| maritime.realms | Extraordinary waters, routes, materials and native content. | Relevant realm and all declared providers. | Boss/site/culture packs. |

A build may promote maritime packs to required, but the world manifest records the choice. Core packs cannot hard-reference optional maritime IDs. Removing a pack with active vessels, cargo, creatures, quests or facets requires tested quarantine, substitution or read-only preservation; it never deletes records.

# 29. Progression Reachability and Seed Independence

| Requirement | Evidence |
| --- | --- |
| M0 | Every normal start reaches basic water safety through craft, environment, knowledge or NPC/trade fallback. |
| M1 | Seed corpus provides small craft, fishing/diving or employment without a fixed site. |
| M2 | A vessel/crew/route/knowledge path exists through build, purchase, charter, service or faction. |
| M3 | Multiple regional providers exist for charts, supplies, certification, crew and rescue. |
| M4 | At least one settlement/shipyard path can develop from generated resources or regional substitution. |
| M5 | Fleet/command arises from real vessels, logistics, authority and relationships. |
| M6 | Every realm/special-site package declares access, survival, return and recovery. |
| Non-Combat | Peaceful settings retain trade, fishing, building, ecology, rescue, research and exploration. |
| Failure Recovery | Vessel, crew, licence, port or route loss has recoverable alternatives where possible. |
| Pack Absence | Optional-pack tests preserve/quarantine active records. |
| Seed Variation | No test assumes Forest Hamlet, fixed ocean, fixed port, fixed wreck or fixed boss. |
| Multiplayer | Progression remains valid when specialists are offline. |

# 30. Maritime Magic Integration

Maritime magic uses existing schools. Water-related applications may draw from Elemental, Nature, Arcane, Rune, Alchemy, Enchanting, Summoning, Ritual, Space or other approved schools; 26N does not create an isolated Hydromancy tree unless the global Magic replacement approves it. Every spell, rune or ritual declares its capability, medium interaction, cost, limits, counterplay, risks, presentation and infrastructure.

Magic changes preparation and options rather than deleting the ocean. Current reading improves confidence; a sealing rune slows leakage but needs mana and anchors; water breathing may not protect from pressure, cold or contamination; a storm ward reduces exposure within a bounded area rather than erasing the regional field.

| Application | Capability | Required Limits |
| --- | --- | --- |
| Water Breathing / Air | Breath or supplied-air capability. | Duration, pressure/temperature exclusions, source and failure. |
| Pressure / Cold Ward | Environmental protection. | Rated envelope and overload warning. |
| Current / Tide Reading | Knowledge and routing. | Uses actual 26D fields and bounded confidence. |
| Wind Assistance | Propulsion support. | 26G force/energy, bounded output and weather risk. |
| Magical Pump / Seal | Flood control and temporary repair. | 26B fluid authority, cost, capacity and failure. |
| Beacon / Ley Compass | Position and route support. | Calibrated anchors/fields and disruption. |
| Preservation Rune | Slower spoilage/contamination. | Bounded storage and no retroactive restoration. |
| Rescue Magic | Flotation, signal, tow, stabilisation or bounded teleport. | Target, cost, cooldown and safe destination. |
| Creature Communication | Alternative encounter/research. | Personhood, motive, consent and no guaranteed control. |
| Realm Anchor | Dimensional access. | Realm authority, fuel, stabilisation, return and aftermath. |
| Combat Ward | Protection/tactical effect. | 26L, friendly-fire, counterplay and resources. |
| Cleansing / Containment | Pollution, corruption or curse handling. | Specific process and persistent by-products. |

# 31. Water, Weather, Navigation and Survival Magic

| Band | Mundane Baseline | Magical Extension | Fallback |
| --- | --- | --- | --- |
| M0-M1 | Observation, flotation, shelter and local knowledge. | Light, warmth, air charm or warning rune. | Avoid exposure or use support. |
| M2 | Charts, pilotage, compass, weather signs and coastal route. | Current reader, beacon attunement or wind aid. | Escort, wait or landmarks. |
| M3 | Advanced navigation, storm preparation and reserves. | Forecast ritual, stability ward, signal or mana pump. | Abort, seek harbour or heave-to. |
| M4-M5 | Beacon network, fleet communication and ports. | Ley navigation, warded harbour and hybrid logistics. | Conventional network. |
| M6 | Specialised suits/hulls, instruments and realm knowledge. | Pressure ward, route anchor and containment. | Defer or use faction/culture provider. |

# 32. Vessel, Port and Infrastructure Magic

| Infrastructure | Integration | Activation Contract |
| --- | --- | --- |
| Hull | Runic sealing, reinforcement, fouling resistance or realm adaptation. | Compatible material/anchors, mana, inspection, maintenance and structural limit. |
| Propulsion | Mana drive, wind shaping, current coupling or assist. | 26G provider, energy, controls, heat/risk and station. |
| Steering / Navigation | Attuned rudder, compass, chart table or beacon. | Known/calibrated references and active network. |
| Damage Control | Mana pump, emergency seal, suppression or stabilisation. | Capacity, energy, access and failure; no fluid duplication. |
| Cargo | Cold rune, dry ward, containment and anti-corruption. | Bounded storage, power and compatibility. |
| Harbour | Warded breakwater, storm barrier, beacon, cleansing or portal. | Functioning structure, specialists, maintenance and field limits. |
| Shipyard | Lift assist, shaping, diagnostics and commissioning ritual. | Physical project, resources, labour and validation remain. |
| Fishery | Water-quality ward, disease detection and habitat restoration. | Ecology limits, inputs and no stock creation. |
| Fleet | Signal, navigation or formation ward. | Communication, command, range and energy logistics. |
| Underwater Habitat | Air, pressure, light, cleansing and anchors. | 26B region, structure, power and rescue plan. |

# 33. Ritual, Realm, Corruption and Forbidden Maritime Magic

High-risk magic requires explicit source, victim/consent where applicable, contamination, legal status, counterplay and aftermath. Forbidden means physically or socially dangerous for defined reasons, not automatically superior.

| Risk Family | Possible Use | Consequence Contract |
| --- | --- | --- |
| Void / Space | Shortcut route, storage, pressure bypass or portal vessel. | Instability, loss, contamination, attention and recovery. |
| Blood / Life | Emergency power, binding, healing or control. | Consent/source, corruption, law, reputation and alternatives. |
| Necromantic Crew / Vessel | Tireless labour, haunted navigation or animated wreck. | Personhood, remains, control, reaction and release. |
| Storm Domination | Force weather for propulsion or warfare. | Regional effects, ecology, settlements, counteraction and blame. |
| Creature Compulsion | Control mounts, titans or schools. | Welfare, resistance, ecological harm and diplomacy. |
| Corrupted Preservation | Prevent decay or carry toxic cargo. | Contamination, handling, market/law and cleansing. |
| Cursed Salvage | Power from wrecks, relics or drowned sites. | Provenance, curse transmission, history and resolution. |

# 34. Maritime Automation Integration

Automation moves or transforms real items, fluids, energy and work. It reduces labour and improves reliability but cannot create cargo, catch, water removal, repairs or crew performance without valid source and transaction. Vessel systems are constrained by space, mass, power, heat, motion, damage and maintenance; port systems by routes, storage, permission and scheduling. Distant summaries reconcile conserved state when promoted.

| Capability | Manual Baseline | Automated Provider | Failure |
| --- | --- | --- | --- |
| Pumping | Bucket, hand pump and crew. | Mechanical, engine or mana pump. | Blocked intake, no power, insufficient capacity or broken route. |
| Anchoring / Mooring | Crew handles line/anchor. | Windlass, capstan and docking assist. | Overload, jam, no authority or unsafe condition. |
| Cargo Transfer | Carry/cart/crane crew. | Winch, crane, chute, conveyor, golem and warehouse interface. | Full destination, custody conflict, route block or unsafe motion. |
| Rig Handling | Crew pulls lines. | Powered winch or magical assist. | Rig damage, power loss or wind beyond envelope. |
| Engine / Mana Control | Engineer monitors and adjusts. | Governors, sensors and network. | Fault, heat, contamination or missing operator. |
| Navigation Assist | Human charting and lookout. | Route logic, beacons and sensors. | Stale knowledge, damaged sensor or authority limit. |
| Fish Processing | Hand clean, sort, salt and pack. | Sorter, cleaner, smoker and cold store. | Quality loss, contamination, blocked output or no fuel. |
| Aquaculture | Manual feed and inspection. | Feeders, pumps, sensors and harvest assist. | Disease, escape, low oxygen, overcapacity or supply fault. |
| Shipyard | Manual lifting, shaping and inspection. | Cranes, saws, presses, pumps, golems and diagnostics. | Reservation conflict, unsafe support or quality failure. |
| Signals / Customs | Flags, messengers and clerks. | Signal network, manifest reader and scheduler. | Identity mismatch, outage or manual review. |

# 35. Vessel Automation and Service Networks

| Network | Inputs | Outputs / State | Gate |
| --- | --- | --- | --- |
| Bilge / Drainage | Flooded compartments, power, pumps, valves and routes. | Moved fluid, capacity/fault and discharge. | Engineering, components and inspection. |
| Propulsion Support | Fuel/mana, drive, controls and cooling. | Thrust provider state and consumption. | 26G certification and operator. |
| Steering | Helm command, linkage/power and provider. | Steering response and fault reasons. | Commissioned controls and authority. |
| Rigging Assist | Wind, sails, winches, lines, power and controls. | Sail state and wear. | Seamanship/engineering and safe envelope. |
| Power Distribution | Source, storage, conductors and loads. | Available power, priority, heat and fault. | Knowledge and maintenance. |
| Cargo Monitoring | Storage, manifests, sensors and ownership. | Condition, shift, spoilage and alerts. | Trade/engineering and valid records. |
| Damage Alarm | Sensors, compartments, communication and power. | Warnings, crew tasks and events. | 26L authority/presentation. |
| Life Support | Air, heat, pressure, cleansing and occupancy. | Habitable state and consumables. | Extraordinary progression. |
| Navigation Network | Instruments, charts, beacons and environment. | Position/route confidence and warnings. | Knowledge, calibration and power. |
| Control Logic | Commands, permissions and local rules. | Bounded task scheduling. | No unrestricted shared-world user code by default. |

# 36. Port, Shipyard, Fishery and Cargo Automation

| Network | Physical Flow | Effect |
| --- | --- | --- |
| Harbour Pumps / Locks | Water through pumps, gates and channels. | Access and safety only while functional. |
| Cargo / Warehouse | Lots between vessel, quay, storage and transport. | Higher throughput, not free goods. |
| Cold Chain | Catch/food through ice, cold store, vessel and market. | Slower quality loss and wider range. |
| Shipyard Production | Materials, components, tools and work packages. | Parallel projects within labour/facility capacity. |
| Fish Processing | Catch to sorted, preserved, by-product and waste outputs. | Food, jobs, trade and pollution obligations. |
| Aquaculture Support | Feed, water, oxygen, waste and stock monitoring. | Stable output under health/ecology constraints. |
| Fuel / Mana Bunkering | Energy goods from storage to vessel. | Voyage readiness and price demand. |
| Customs / Manifests | Documents, cargo identity, inspection and fees. | Faster clearance; fraud still reviewed. |
| Beacon / Signal | Power/mana, observations and messages. | Route confidence, warnings and coordination. |
| Waste / Cleansing | Bilge, sewage, processing waste and contamination. | Health/ecology protection and compliance. |

# 37. NPC, Golem and Distant Automation

NPCs and golems use the same tasks and transactions as players. Automated shipyards resolve work packages, labour/machine capacity, stock, tools, access, quality and validation. Distant ports and fleets use bounded schedules and aggregate lots, then instantiate representative state consistent with summaries.

| Rule | Requirement |
| --- | --- |
| No Ghost Labour | Tasks require worker, golem, machine or declared service capacity. |
| No Ghost Inventory | Outputs require reserved inputs or approved renewable source. |
| Authority | Actions respect ownership, law, contract and settlement permissions. |
| Skill / Quality | Operator/service quality affects rate, waste and defects. |
| Scheduling | Watches, travel, loading, maintenance and emergencies compete for capacity. |
| LOD Reconciliation | Transitions preserve quantities, condition, progress, identities and incidents. |
| Failure Visibility | Faults create reason codes, work orders, events or degraded service. |
| Player Credit | Contribution distinguishes design, supply, command, repair and direct labour. |
| Safety | Dangerous work may require supervision, shutdown or evacuation. |
| No Shipped AI Dependency | Summer Engine is development tooling; shipped decisions are authored systems. |

# 38. Maritime Economy Integration

Value emerges from use, scarcity, condition, risk, law, distance, timing, culture, information and alternatives. A fish has value because it feeds people, supports recipes or fulfils demand, not because a rarity colour assigns a universal price. Vessels have construction, maintenance, crew, berth, fuel, cargo and opportunity costs. Blockades matter because they alter real routes and supply.

Currency simplifies exchange but does not replace goods and services. Contracts bind physical obligations. Market summaries derive from inventory, production, consumption, expected arrivals, losses, restrictions and confidence. Distant aggregated lots still reconcile to authoritative quantities.

# 39. Commodities, Markets and Regional Supply

| Commodity | Demand | Supply Risks | Maritime Value |
| --- | --- | --- | --- |
| Fresh Food / Catch | Households, crews, ports and festivals. | Spoilage, season, overfishing, storms and blockade. | Provisions and culture economy. |
| Preserved Food / Water | Voyages, fleets, remote settlements and relief. | Fuel/salt, contamination, storage and disruption. | Endurance and relief. |
| Timber / Fibre / Cloth | Hull work, buildings, rigging, nets and repair. | Resource pressure, fire and war demand. | Shipbuilding backbone. |
| Metals / Fittings | Anchors, engines, tools, armour and weapons. | Mining, refining, fuel and strategic control. | Industry and navy. |
| Fuel / Mana | Engines, pumps, lights, wards and processing. | Production, transport, purity, storage and hazard. | Range and infrastructure. |
| Salt / Oil / Processing | Preservation, cooking, alchemy and lamps. | Source ecology, contamination and capacity. | Fishery-wide economy link. |
| Luxury / Cultural | Morale, status, diplomacy and ritual. | Rare source, law, preference and piracy. | High-value routes and stories. |
| Charts / Knowledge | Navigation, fishing, exploration and military planning. | Freshness, secrecy and misinformation. | Information economy. |
| Components / Spares | Construction, repair, fleet readiness and salvage. | Yard capacity, quality and war losses. | Persistent maintenance demand. |
| Relics / Realm Materials | Research, magic, factions and advanced craft. | Access, stabilisation, law and uniqueness. | High-risk progression and politics. |

# 40. Contracts, Freight, Claims, Tariffs and Risk

| Record | Core Obligations | Outcomes |
| --- | --- | --- |
| Freight | Cargo identity/quantity/condition, origin, destination, deadline, custody and payment. | Delivery, partial, damage, loss, delay, theft or renegotiation. |
| Charter | Vessel/service, route, duration, capacity, crew and restrictions. | Completion, extension, breach, rescue or seizure. |
| Passenger / Migration | People, safety, destination, provisions, law and consent. | Arrival, delay, diversion, rescue or casualty. |
| Fishing Licence / Quota | Area, method, family, season, amount and reporting. | Lawful catch, violation, closure or appeal. |
| Salvage Claim | Site/wreck, claimant, scope, priority, owner/history and shares. | Award, dispute, restitution, protection or abandonment. |
| Escort / Convoy | Protected subjects, route, readiness, engagement rules and payment. | Arrival, separation, attack, rescue or breach. |
| Privateer Commission | Issuer, holder, targets, duration, prize procedure and prohibitions. | Lawful prize, abuse, revocation, incident or trial. |
| Patrol / Rescue | Area, time, response, authority and reporting. | Deterrence, rescue, interception or failure. |
| Research / Expedition | Objectives, evidence, ethics, access, ownership and publication. | Discovery, restoration, dispute or hazard. |
| Construction / Repair | Scope, stock, quality, site, deadline and acceptance. | Completion, defect, redesign, delay or cancellation. |
| Tariff / Customs | Cargo class, value basis, jurisdiction, fee and inspection. | Clearance, hold, seizure, appeal or smuggling. |
| Risk Agreement | Declared vessel/cargo, covered risks, contribution, evidence and exclusions. | Claim, partial settlement, fraud review or denial; advanced/optional. |

# 41. Labour, Maintenance, Shipbuilding and Fleet Costs

Maritime capability has continuing costs. A vessel is not permanently ready because it was built once, a port is not operational because a quay exists, and a fleet cannot remain deployed without people, provisions, maintenance, information and replacement parts. Costs are expressed through authoritative goods, services, labour schedules, condition and opportunity rather than a single upkeep tax.

| Cost Layer | Authoritative Inputs | Player-Facing Consequence |
| --- | --- | --- |
| Capital Construction | Blueprint, site, exact materials, components, facilities, labour, tools, power/mana and acceptance. | A vessel, dock or service exists only after its project completes and passes validation. |
| Routine Maintenance | Inspection time, consumables, lubricants, caulking, paint/coating, spare parts and skilled labour. | Condition degrades predictably; early maintenance is cheaper than major repair. |
| Crew Compensation | Wages, shares, provisions, accommodation, leave, promises, reputation and legal obligations. | Retention, morale, recruitment and contract willingness change. |
| Voyage Consumption | Food, water, fuel/mana, medicine, ammunition, bait, charts and repair stock. | Range and readiness are physical, inspectable and route dependent. |
| Berth and Port Services | Mooring, pilotage, customs, storage, pumping, repair, quarantine and security fees or duties. | Ports differ through real services, law and capacity. |
| Fleet Overhead | Command staff, tenders, depots, escorts, communication, reserves and replacement crews. | Large fleets require civilisation-scale support rather than multiplying free power. |
| Damage and Loss | Repair stock, dry-dock time, salvage, casualty care, replacement cargo and political compensation. | Conflict changes future readiness, prices, trust and routes. |
| Ecology and Compliance | Licences, monitoring, habitat protection, waste handling, restoration and seasonal limits. | Sustainable operations protect future yield and legal access. |
| Information | Charts, surveys, forecasts, intelligence, signals and interpreters. | Better knowledge reduces uncertainty but becomes stale. |
| Opportunity | Vessel, berth, crew, warehouse and route capacity committed elsewhere. | Choosing one voyage or project delays another. |

Maintenance intervals are definition-driven and condition-sensitive. Distant simulation may batch routine work, but it must debit the same stock and service capacity. Deferred maintenance produces explicit defects or risk rather than hidden probability inflation. World settings may reduce frequency and cost without changing ownership or conservation rules.

# 42. Salvage, Prize, Bounty and Recovery Economies

| Economy | Source of Value | Authority / Protection | Resolution |
| --- | --- | --- | --- |
| Ordinary Salvage | Recoverable cargo, components, material, information and restoration potential. | Claim, owner, jurisdiction, heritage/ecology flags and 26H survey. | Return, award, sale, dismantling, restoration or abandonment. |
| Rescue Reward | Lives saved, tow, emergency supplies, medical aid and prevented loss. | Consent, distress record, contract, custom and local law. | Payment, share, reputation, obligation or public service credit. |
| Prize Capture | Lawfully captured vessel/cargo under war or privateer authority. | 26K commission, rules of engagement, surrender record and adjudication. | Condemnation, restitution, shares, seizure or legal incident. |
| Pirate Plunder | Stolen cargo, ransom, extortion and seized craft. | Illegal unless later laundered, fenced, pardoned or politically protected. | Criminal market, retaliation, bounty and evidence trail. |
| Bounty | Verified target, threat reduction, rescue or evidence. | Issuer, validity, jurisdiction, proof and contribution. | Payment, dispute, fraud review or political consequence. |
| Wreck Restoration | Historic identity, blueprint knowledge, relics and functional recovery. | Ownership, culture, heritage, site and provenance. | Museum, service return, memorial, research or contested claim. |
| Boss / Site Recovery | Rare materials, knowledge, cures, trophies or regional service. | 26M outcome, ethical path, faction claim and Atlas canon. | Reward without requiring killing; persistent ecology/history. |
| Disaster Recovery | Recovered stock, repaired infrastructure, reopened routes and protected communities. | Event authority, contracts, public need and contribution ledger. | Relief, reconstruction, compensation and market stabilisation. |

Salvage does not duplicate resources. Every recovered stack, component and vessel section has one custody path. Prize, bounty and rescue shares use contribution records rather than last-hit ownership. Protected graves, sacred wrecks, living habitats and research sites may forbid extraction while still supporting rescue, documentation or restoration play.

# 43. Quest Architecture and Objective Modules

Maritime quests wrap authoritative simulation state; they do not invent cargo, shortages, people, vessels, sites, weather, creatures or political authority. A template may only bind subjects that exist, are reachable and remain valid. The quest record explains why the situation matters, what is known, which consequences are credible and which systemic solutions are recognised.

| Objective Module | Authoritative Subject | Example Solutions |
| --- | --- | --- |
| Observe / Survey | Water body, weather field, habitat, route, vessel, port, wreck or site. | Lookout, instrument, dive, chart, interview or magical sensing. |
| Gather / Catch | Registered resource, catch cohort, specimen or salvage lot. | Harvest, fish, trade, aquaculture, rescue recovery or lawful salvage. |
| Craft / Process | Recipe, station, input lot and output requirement. | Manual craft, NPC service, automation or cultural substitute. |
| Build / Repair | Project, work packages, site, vessel or infrastructure. | Supply, labour, shipyard, field repair, refit or restoration. |
| Deliver / Freight | Cargo Lot, custody, route, destination, deadline and condition. | Own vessel, charter, convoy, relay, portal boundary or negotiated delay. |
| Navigate / Explore | Route, destination, chart confidence, hazard and arrival state. | Pilotage, instruments, landmarks, guides, magic or safer season. |
| Operate / Crew | Station, role, watch, vessel and readiness. | Direct control, hired specialist, trained NPC, automation assist or reduced scope. |
| Rescue / Escort | Person, vessel, convoy, creature or settlement at risk. | Tow, flotation, medical aid, protection, route diversion or negotiation. |
| Negotiate / Inspect | Contract, authority, customs, faction, crew or claim. | Dialogue, evidence, reputation, payment, appeal, deception or refusal. |
| Defend / Intercept | Vessel, port, route, habitat, convoy or target. | Deterrence, escort, pursuit, combat, blockade running, warning or diplomacy. |
| Research / Restore | Knowledge record, ruin, species, relic, habitat or vessel. | Study, collect evidence, repair, cleanse, return, publish or conceal. |
| Track / Hunt / Calm | Creature, pirate, fugitive, anomaly or boss territory. | Signs, witnesses, sensors, bait, patrol, communication, ward or confrontation. |
| Command / Coordinate | Crew, fleet, rescue, port crisis or project. | Orders, delegation, schedules, signals, supplies and contingency planning. |
| Choose / Resolve | Branching outcome and consequence set. | Aid, ignore, redirect, expose, bargain, restore, capture, release or destroy. |

Each objective declares completion evidence, contribution scope, failure/expiry behaviour, delegation rules, automation eligibility, knowledge visibility and reconciliation if the subject changes. Failure normally produces altered state and follow-up content rather than a forced reload.

# 44. Profession, Voyage, Port and Construction Quests

| Quest Family | Simulation Trigger | Representative Arc | Persistent Result |
| --- | --- | --- | --- |
| Apprenticeship | Teacher, facility and learner capability gap. | Assist, practise, pass a real task and earn recognised knowledge. | Skill, recipe, licence, relationship and work access. |
| First Vessel | Player/community need plus blueprint, site and stock path. | Survey, choose design, supply work packages, launch and certify. | Named commissioned vessel and history. |
| Port Development | Service shortage, growth plan or route opportunity. | Survey harbour, construct service, staff it and pass activation. | New settlement capability and traffic pattern. |
| Freight Contract | Real market imbalance and available route. | Accept cargo, plan voyage, preserve custody and deliver. | Stock transfer, payment, reputation and price response. |
| Crew Story | Named NPC need, conflict, ambition, injury or obligation. | Investigate, choose support, resolve duty and consequence. | Relationship, role, availability and memory. |
| Repair / Refit | Condition, mission requirement or conversion need. | Inspect, source parts, schedule yard and certify. | Changed vessel state without identity loss. |
| Charting Voyage | Unknown route, hazard or destination confidence. | Survey legs, record evidence, survive conditions and publish/withhold. | Knowledge provider and changed navigation confidence. |
| Harbour Administration | Congestion, customs issue, disease, crime or service fault. | Inspect, schedule, negotiate, repair, enforce or reform. | Law/service state and port reputation. |
| Maritime Rescue | Distress event or overdue subject. | Find, stabilise, transfer survivors and recover/abandon vessel. | Lives, claims, wreck state, gratitude and investigation. |
| Fleet Commission | Faction strategy and available ships/crews. | Assemble, provision, train, deploy and review. | Persistent fleet, readiness and political consequence. |

# 45. Fishing, Ecology, Exploration and Dungeon Quests

| Quest Family | Valid Source | Systemic Solutions | Aftermath |
| --- | --- | --- | --- |
| Seasonal Fishery | 26M cohort, season, licence and market demand. | Selective catch, alternate species, aquaculture or trade. | Population, market, compliance and community memory. |
| Bycatch Crisis | Catch transaction and protected/unwanted organism. | Release, treatment, gear change, report, conceal or research. | Ecology, law, trust and method restrictions. |
| Habitat Restoration | Damaged reef, nursery, wetland or spawning route. | Remove hazard, rebuild habitat, cleanse, restrict harvest or guard. | Carrying capacity and settlement/ecology benefit. |
| Marine Research | Unknown species, behaviour, water state or anomaly. | Observe, sample, photograph/icon, communicate or non-lethal tag. | Codex, recipe, warning, policy or magic knowledge. |
| Wreck Expedition | Persistent 26M/26H wreck with claim and hazards. | Survey, rescue, salvage, restore, return relics or preserve. | Wreck/site state, custody and history. |
| Submerged Dungeon | Generated site, access window and active state. | Dive, vessel support, puzzle, combat, negotiation, repair or escape. | Persistent occupation, restoration, loot and route change. |
| Boss Territory | 26M territory clock, ecology and encounter conditions. | Study, avoid, calm, bargain, relocate, heal, bind, repel or defeat. | Regional ecology, faction response and new content. |
| Aquaculture Emergency | Disease, escape, feed, water or capacity fault. | Quarantine, diagnose, treat, release, reduce stock or redesign. | Facility, ecology, food and trust state. |
| Stranding / Migration | Environmental event and actual creature cohort. | Rescue, redirect, protect, study, harvest illegally or let nature proceed. | Population, law, culture and memory. |

# 46. Piracy, Naval, Diplomatic and War Quests

| Quest Family | Trigger | Non-Combat Paths | Combat / Command Paths |
| --- | --- | --- | --- |
| Pirate Threat | Real losses, sightings, haven support or extortion. | Negotiate, pay, expose sponsor, disrupt market, pardon or redirect. | Escort, patrol, intercept, board or siege haven. |
| Privateer Commission | War policy and lawful issuer. | Refuse, investigate targets, negotiate limits or expose abuse. | Take prizes under restrictions and submit adjudication. |
| Smuggling Network | Demand, prohibition, corruption and route opportunity. | Reform law, bribe, infiltrate, legalise supply or inform. | Search, chase, seize or protect shipment. |
| Convoy Crisis | Threat, shortage, weather or damaged escort. | Delay, reroute, hire aid, split cargo or bargain passage. | Escort, screen, rescue and fight through. |
| Blockade | Declared policy and enforcement capacity. | Diplomacy, neutral passage, alternate route, relief deal or sabotage. | Run, break, reinforce or capture chokepoint. |
| Passage Dispute | Overlapping claims, law and route need. | Evidence, treaty, fee, pilotage, mediation or route change. | Demonstration, escort or limited engagement. |
| Maritime Intelligence | Unknown fleet, haven, route or plan. | Scout, interview, decode, trade maps or counter misinformation. | Reconnaissance, capture messenger or force identification. |
| Fleet Readiness | Mission demand versus actual condition. | Reschedule, hire, repair, provision, train or reduce mission. | Mobilise, command exercises and deploy. |
| Coastal Siege | 26K strategic conflict plus 26L tactical sites. | Evacuate, negotiate, smuggle relief, sabotage logistics or mediate. | Assault, defend, blockade, bombard or relief fleet. |
| Post-War Recovery | Damage, displaced people, wrecks, mines and distrust. | Clear routes, return prizes, rebuild, compensate and reconcile. | Suppress holdouts, protect works and enforce peace. |

# 47. Event Architecture and Maritime Event Families

Events are authoritative world processes that may exist without a quest. Quests may expose, interpret or invite participation in an event, but ignoring the quest does not freeze the event unless its definition explicitly requires player consent. Events use the shared lifecycle: warning, preparation, onset, escalation, resolution, aftermath, memory and recurrence/cooldown.

| Scale | Examples | Required Truth |
| --- | --- | --- |
| Personal / Crew | Injury, dispute, fatigue, promotion, desertion, discovery and celebration. | Named identity, relationship, schedule and consequence. |
| Vessel | Grounding, fire, leak, mutiny, breakdown, infestation, distress and discovery. | Vessel instance, compartments, crew, cargo and location. |
| Port / Settlement | Congestion, quarantine, fire, strike, festival, shortage, wreck obstruction and raid. | Port capabilities, population, storage, law and services. |
| Route / Market | Storm closure, piracy wave, convoy, boom, embargo, bridge/lock failure and new chart. | Route graph, traffic, inventory, risk and information. |
| Ecological | Migration, bloom, disease, spawning, invasive spread, habitat collapse and recovery. | 26M population/habitat state and environmental fields. |
| Political / Military | Treaty, incident, mobilisation, blockade, war, ceasefire and succession. | Faction authority, fleets, claims, evidence and objectives. |
| Adventure / Site | Wreck exposure, tide window, dungeon activation, boss movement and relic signal. | Persistent site/territory and access conditions. |
| Realm / Cosmic | Planar tide, portal instability, impossible current and ancient awakening. | 14/24 canon, magic authority and bounded consequences. |

Compatibility rules prevent impossible overlaps, such as a harbour festival continuing normally during evacuation, while allowing meaningful combinations such as a storm complicating a rescue or a migration colliding with a fishing boom. Event selection is weighted by real state and settings, not by a universal random timer.

# 48. Weather, Disaster, Rescue and Port-Crisis Events

| Event | Warning / Preparation | Onset / Escalation | Aftermath |
| --- | --- | --- | --- |
| Severe Storm / Cyclone | 26D forecast, swell, pressure, port signals and shelter orders. | Route danger, damage, flooding, groundings and rescue calls. | Wrecks, repairs, shortages, habitat changes and investigations. |
| Tsunami / Extraordinary Surge | Rare authored/realm warning, withdrawal signs and magical instruments. | Rapid inundation and debris within bounded scenario rules. | Rebuilding, changed coastline markers and memorial history. |
| Sea Ice / Freeze | Temperature trend, navigation report and port plan. | Blocked route, hull pressure, stranded vessels and supply delay. | Thaw hazards, damage, changed market and rescue credit. |
| Harbour Fire | Smoke/alarm, stored hazards and response readiness. | Spread across vessels/warehouses under 26L and block rules. | Casualties, contamination, repairs, law and service outage. |
| Quarantine / Outbreak | Health reports, arriving vessel and inspection. | Restricted movement, treatment, shortage, evasion and distrust. | Immunity/knowledge, compensation, reputation and policy. |
| Grounding / Collision | Navigation failure, weather, congestion or damage. | Breach, obstruction, spill, trapped people and secondary impacts. | Salvage, liability, route clearance and regulation. |
| Mass Rescue | Storm, battle, ferry loss, migration or dungeon collapse. | Search areas, triage, capacity pressure and survivor transfer. | Claims, grief, gratitude, inquiry and changed safety investment. |
| Port Congestion | Arrival schedule, berth limits and delayed cargo. | Queues, spoilage, conflict, anchorage risk and market distortion. | Infrastructure project, tariff change or route diversion. |
| Pollution / Mana Spill | Fault, wreck, illegal discharge or damaged storage. | Water hazard, creature impact, closures and health risk. | Cleanup, sanctions, restoration, research and persistent ecology. |
| Lighthouse / Beacon Failure | Maintenance report or lost signal. | Navigation confidence falls and incidents become more likely. | Repair, investigation, sabotage hook and service upgrade. |

# 49. Ecology, Migration, Boss and Realm Events

| Event | Authoritative Driver | Player Choices | Persistent Change |
| --- | --- | --- | --- |
| Spawning Migration | Season, temperature, current, habitat and population. | Observe, fish lawfully, protect, reroute traffic or exploit illegally. | Recruitment, market and reputation. |
| Algal / Magical Bloom | Nutrients, temperature, pollution or realm influence. | Sample, close fishery, cleanse, harvest carefully or conceal. | Water quality, food web, health and knowledge. |
| Predator Shift | Prey, habitat loss, boss movement or fishing pressure. | Adapt methods, protect nursery, cull, relocate or restore habitat. | Population balance and vessel risk. |
| Invasive Spread | Transport, ballast, aquaculture escape or realm breach. | Contain, harvest, research, cleanse or ignore. | Habitat composition and economy. |
| Mass Stranding | Weather, sound, illness, magic or navigation disruption. | Rescue, study, protect, harvest or investigate cause. | Population, law and cultural memory. |
| Reef Recovery / Collapse | Damage, temperature, pollution, harvesting and restoration. | Build, protect, monitor, exploit or abandon. | Carrying capacity, hazards and site appearance. |
| Boss Territory Migration | 26M threat clock and environmental pressure. | Warn ports, track, communicate, guide, repel or confront. | New risk map, ecology, quests and faction response. |
| Living Dungeon Awakening | Site state, relic, season, boss or realm cycle. | Enter, seal, restore, negotiate or study from outside. | Site topology/state and regional effects. |
| Planar Tide | Realm alignment and magic network conditions. | Stabilise, navigate, harvest, evacuate or exploit. | Portal routes, materials, hazards and lore. |
| Ancient Maritime Signal | Atlas site/boss state and knowledge threshold. | Decode, suppress, broadcast, follow or bargain. | Faction race, exploration path and world history. |

# 50. History, Aftermath and World-State Memory

Maritime actions leave evidence. Voyages, rescues, wrecks, catches, commissions, treaties, blockades, boss outcomes, port disasters, discoveries and restorations produce history records linked to subjects and locations. Memory affects dialogue, reputation, law, markets, names, memorials, route confidence, faction strategy and procedural quest eligibility.

| Memory Layer | Stored Evidence | Uses |
| --- | --- | --- |
| Vessel Log | Voyages, captains, crews, refits, damage, captures, rescues and losses. | Identity, value, dialogue, museum/restoration and legal claims. |
| Crew Memory | Service, injuries, relationships, promises, fear, achievements and casualties. | Morale, recruitment, personal quests and command trust. |
| Port Chronicle | Projects, arrivals, disasters, rulers, strikes, battles and recoveries. | Settlement identity, festivals, laws and player reputation. |
| Route History | Discoveries, losses, hazards, patrols, closures and reliability. | Navigation confidence, insurance/risk, rumours and AI decisions. |
| Market History | Shortages, booms, fraud, seizures, arrivals and disruptions. | Trend explanation, contracts and policy. |
| Ecology Record | Population shifts, harvest, restoration, pollution and boss effects. | Management, codex, research and event generation. |
| Faction Maritime History | Treaties, prizes, incidents, wars, aid and betrayals. | Diplomacy, doctrine, claims and story arcs. |
| Site / Wreck History | Construction, sinking, occupation, salvage, restoration and discoveries. | Atlas continuity, provenance and persistent world evidence. |

History is bounded through summaries and significant-event retention. It must not become unlimited free text required for simulation. Player-facing prose is generated from approved templates and stored evidence; it may not invent unsupported facts.

# 51. Example Player Progression Paths

| Path | Early | Middle | Late |
| --- | --- | --- | --- |
| Coastal Survivor | Wade, gather shore resources, make flotation and read local weather. | Fish, dive, repair small craft and assist rescues. | Operate remote outpost, lead expeditions or master extreme waters. |
| Fisher / Aquaculturist | Hand line, traps, species knowledge and local sale. | Selective gear, preservation, licence and managed beds. | Fleet/aquaculture network, conservation leadership and rare ecology research. |
| Shipwright | Repairs, caulking, survey and simple boats. | Commission vessels, manage yard and perform refits. | Advanced hulls, restoration, realm adaptations and shipyard civilisation. |
| Navigator / Explorer | Landmarks, sounding, charts and safe coast routes. | Open-sea instruments, route surveys and dungeon access. | Planar navigation, expedition command and world atlas discoveries. |
| Merchant / Freight Captain | Small lots and local port calls. | Contracts, crew, preservation, convoy and regional markets. | Trade company, fleet network, diplomacy and crisis relief. |
| Sailor / Captain | Basic stations, watches and manoeuvres. | Crew leadership, weather judgement and vessel specialisation. | Fleet command, legendary voyages and political authority. |
| Diver / Salvager | Breath, hand tools and shallow recovery. | Gear, wreck claims, underwater work and restoration. | Abyssal sites, specialist submersible support and protected heritage. |
| Marine Scholar / Warden | Observe habitats and learn safe conduct. | Research, tagging, restoration and policy. | Boss communication, regional ecology recovery and realm anomalies. |
| Pirate / Smuggler | Illegal cargo, evasion and hidden contacts. | Crew/haven, prizes, ransom and political sponsors. | Pirate power, pardon/reform, regional conflict or downfall. |
| Naval / Coast Guard | Signals, patrol support and rescue. | Officer role, interception, convoy and law. | Fleet strategy, blockade, treaty enforcement and reconstruction. |
| Maritime Mage-Engineer | Basic water sensing, preservation and pumps. | Wards, mana drives, weather/navigation aids and port networks. | Realm-capable vessels, major rituals and civilisation infrastructure. |

These are paths, not classes. One character may combine or eventually master them. Early access remains seed-reachable through multiple providers, and peaceful worlds retain construction, navigation, ecology, trade, rescue, research and exploration progression.

# 52. Difficulty, Accessibility and Peaceful Alternatives

| Setting / Support | Adjustable Elements | Invariant |
| --- | --- | --- |
| Maritime Threat | Piracy, hostile creatures, naval conflict and lethal events. | Trade, navigation, building, ecology and discovery remain. |
| Weather Severity | Frequency, forecast window, force, damage and recovery time. | Warnings and authority remain consistent. |
| Survival / Diving | Breath, temperature, pressure, fatigue and rescue windows. | Environment truth and assistance explanations remain. |
| Economy Complexity | Price volatility, tariffs, wages, maintenance and contract strictness. | Physical inventory and conservation remain. |
| Ecology Pressure | Population sensitivity, closures, pollution and recovery. | Catch provenance and habitat relationships remain. |
| Crew Management | Fatigue, wages, schedules, morale detail and delegation. | Named identity and safe operation requirements remain. |
| Navigation Assistance | Route suggestions, auto-heading, hazard avoidance and chart confidence. | Unknown information is not silently revealed. |
| Quest Timing | Deadlines, event pace and consequence harshness. | World state and clear warnings remain. |
| Combat Assistance | Aim, timing, damage, tactical pause/command support and PvP. | Ownership, surrender and aftermath remain authoritative. |
| Accessibility Presets | Extended timings, simplified inputs, reduced motion/flashes, captions, patterns, narration-ready labels and one-hand modes. | No reward penalty by default. |
| Peaceful Resolution | Negotiation, avoidance, rescue, research, restoration, capture and deterrence. | Rewards remain equivalent by significance, not identical loot. |
| Creative / Builder | Construction costs and danger may be reduced or disabled by world rule. | Registry identities and saves still validate. |

# 53. Multiplayer and Shared-Progression Requirements

26O owns final network implementation. 26N defines the gameplay contract: personal knowledge, skill and reputation remain attributable; world discoveries, port capabilities, charts, projects, markets and events may be shared according to world rules. No player may spend another player's stock, command their vessel, accept their contract or alter their catch/claim without authority.

| Area | Default Scope | Conflict Rule |
| --- | --- | --- |
| Skill / Perks | Personal character. | No automatic cloning; training may be cooperative. |
| Knowledge / Charts | Personal discovery plus shareable copies/world records. | Sharing respects secrecy, spoiler and ownership rules. |
| Vessel Capability | Vessel instance and authorised crew. | Helm/station locks and captain/owner permissions. |
| Port / Settlement Capability | Shared world/settlement. | Projects and services use contribution and governance. |
| Contracts | Personal, party, organisation or world authority as declared. | One authoritative acceptance and contribution ledger. |
| Cargo / Catch / Claims | Owner/custodian and lot record. | Atomic transfers prevent duplication and theft ambiguity. |
| Quests | Personal, party, vessel, settlement, faction or world scope. | Objectives declare shared credit and branch authority. |
| Events | World authoritative. | Local presentation differs; state does not. |
| Fleet Command | Organisation role and mission. | Command hierarchy, voting/delegation setting and takeover rules. |
| Research / Codex | Personal and shareable institutional knowledge. | No forced spoiler reveal; evidence provenance retained. |
| PvP / Piracy | World and consent rules. | Law/ownership consequences remain; grief protections configurable. |
| Disconnect / Rejoin | Persistent subject remains authoritative. | Safe handover, station release and transaction recovery. |

# 54. UI, Codex and Player-Trust Data Requirements

26N does not design final screens; it declares the information 17 and 26O must expose. Every unlock, blockage, market change, contract, event and consequence needs a source and reason. The interface may simplify, but it may not invent completion, hide authoritative losses or imply a capability that has no provider.

| View / Feedback | Required Data |
| --- | --- |
| Maritime Progression | Known capability, providers, missing requirements, alternatives, next evidence and related paths. |
| Recipe / Registry Inspection | Definition ID, category, inputs, outputs, provider, unlock, substitutions, risks and provenance. |
| Vessel Readiness | Certification, crew, provisions, fuel/mana, maintenance, cargo, route and mission blockers. |
| Port Services | Available capability, queue, fee, permission, operating condition and alternatives. |
| Market | Current stock/demand summary, trend cause, confidence, known arrivals, restrictions and source age. |
| Contract | Parties, cargo/service, route, deadline, custody, payment, risk, breach and authority. |
| Quest / Event | Why it exists, known facts, affected subjects, timing, solutions, consequence confidence and history. |
| Ecology / Fishery | Habitat, knowledge confidence, season, method, catch condition, licence and observed trend. |
| Magic / Automation | Inputs, network, capacity, consumption, fault, operator/permission and environmental effect. |
| Codex / Atlas | Knowledge state, evidence, culture/source, map links, relationships and spoiler-safe unknowns. |
| Failure | Stable reason code, plain-language cause, affected subject, safe recovery and debug evidence where permitted. |
| Contribution / History | Who supplied, designed, operated, rescued, negotiated, fought or restored, and what changed. |

# 55. Atlas, Main-Document and Forge Integration

| Authority | Required 26N Integration |
| --- | --- |
| 00 / 01 | Add maritime player fantasies and loops without replacing sandbox freedom. |
| 02 | Add maritime skills, perks, knowledge and progression providers after Ash approves final grouping. |
| 03 / 04 / 05 / 06 | Admit maritime facets/families, items, recipes, resources, provenance and cross-references. |
| 07 / 08 | Add maritime jobs, crews, port services, networks, tasks and distant summaries. |
| 09 | Add maritime applications to existing magic schools and infrastructure. |
| 10 / 11 / 12 | Link marine creatures, habitats, world generation, sites, wrecks and structures. |
| 13 / 14 | Link culture/faction/realm variants, laws, progression and travel without ancestry determinism. |
| 15 / 16 / 17 | Add maritime quest/event modules, combat/defence contracts and required UI data. |
| 19 / 20 | Add port, shipyard, harbour and maritime project/function contracts. |
| 21 / 22 / 23 | Supply asset, entity, blueprint, animation, sound and VFX production requirements. |
| 24 Atlas | Consume canon foundations; add implementation IDs and relationships without silently rewriting lore. |
| 25 | Register namespaces, schemas, facets, relationships, capabilities, packs, candidates, migrations and evidence. |
| 26A-26M | Preserve each specialist ownership boundary; use references rather than duplicate truth. |
| 26O | Receive final integration matrix, technical plan, UI/UX, multiplayer, persistence, performance and QA closure. |

Forge content receives semantic contracts, not gameplay authority. A model, animation, icon, sound or VFX cannot create a capability by appearance. Every authoring product references admitted gameplay definitions and exposes validation evidence required by Set 25.

# 56. Production Classification and Candidate Roster

| Production Band | Purpose | Representative Content |
| --- | --- | --- |
| Foundation | Proves water access and a manual maritime loop. | Swimming support, shore gathering, hand line, raft/small boat, basic repair, local weather and rescue. |
| Coastal Operations | Proves vessel/crew/port integration. | Sailing/rowing craft, coastal navigation, berth, pilotage, cargo lots, fishery and shipwright services. |
| Regional Maritime Economy | Proves routes, markets, fleets and port growth. | Freight, preservation, shipyard, convoy, piracy pressure, patrol and ecological management. |
| Naval / Crisis Layer | Proves tactical conflict and persistent aftermath. | Mounted weapons, boarding, damage control, coastal defence, blockade and disaster response. |
| Deep-Sea Adventure | Proves diving, sites, rare ecology and boss territories. | Advanced dive gear, exploration vessel, submerged dungeon, research and non-lethal boss resolution. |
| Advanced Magitech | Proves hybrid automation and extraordinary capability. | Mana drive, life support, magical navigation, port networks and specialist construction. |
| Realm Maritime | Proves dimension-specific water/vessel content. | Realm adaptations, planar routes, unique resources, cultures, hazards and bosses. |
| Deferred / Optional | Isolated experiments or high-complexity features. | Full insurance simulation, unrestricted scripting, massive mobile cities, exact fluid/engineering and unbounded procedural content. |

The candidate roster is not a release promise. Set 25 classification assigns POC, Vertical Slice, Alpha, Beta, Full, Optional or Deferred status after dependency, evidence, cost and reachability review. Content families should be small, reusable and capability-led; palette, culture, damage and realm variations normally remain variants rather than separate universal definitions.

# 57. Validation, Release Gates and Evidence

| Gate | Pass Condition | Blocking Evidence |
| --- | --- | --- |
| Identity | Every definition has admitted qualified ID, owner, version and lifecycle. | Duplicate IDs, ambiguous owner or unapproved namespace. |
| Schema | Required fields and extension facets validate. | Unknown field, incompatible type or missing migration. |
| References | All referenced definitions and relationships resolve. | Dangling, wrong-domain or quarantined dependency. |
| Capability | Every required capability has suitable provider or declared deferral. | Missing provider, exclusion or fallback cycle. |
| Reachability | Required progression is seed-independent through approved alternatives. | Worlds can lack all providers without recovery path. |
| Conservation | Recipes, projects, cargo, catch, salvage and markets reconcile quantities. | Duplication, loss without reason or abstract reward stock. |
| Authority | Ownership, permissions, law, contracts and multiplayer scope are explicit. | Unauthorised mutation or conflicting command. |
| Persistence | Definitions, instances and summaries save/migrate/recover. | Data loss, identity drift or unresolved optional content. |
| LOD | Near/distant promotion and demotion preserve state. | Quantity, condition, history or identity mismatch. |
| Gameplay | Manual baseline and meaningful choices exist before automation. | Mandatory grind, single path or automation bypass. |
| Accessibility | Critical information has non-colour, configurable and readable channels. | Inaccessible blocker, timing or presentation-only truth. |
| Performance | Representative worst cases meet 26O budgets. | Unbounded updates, per-entity explosion or frame stalls. |
| Canon / Culture | Atlas and culture/faction boundaries are preserved. | Contradiction, biological morality or unsupported lore. |
| Evidence | Tests, screenshots/logs, manifests, audit results and sign-off are attached. | Incomplete release evidence or unreviewed generated content. |

# 58. Prototype Laboratories and Acceptance Scenarios

| Laboratory | Scenario | Acceptance Evidence |
| --- | --- | --- |
| Progression Reachability | Generate varied seeds and reach first water, fishing, craft, port and vessel paths. | No required dead ends; fallbacks explain provider source. |
| Registry Admission | Load core plus maritime packs, validate, remove optional pack and migrate. | Stable IDs, quarantine, no silent remap and clear report. |
| Manual to Automated | Run pump, cargo, fish processing and shipyard manually then automate. | Same conserved flows; automation only changes labour/rate. |
| Maritime Magic | Use mundane and magical navigation, pumping, preservation and protection. | Costs, counters, provider suitability and no invalidation of mundane play. |
| Regional Economy | Create supply/demand, ship cargo, suffer delay/loss and deliver. | Physical lots, explainable prices, contracts and market response. |
| Quest Binding | Generate quests from port shortage, wreck, fishery and rescue state. | Subjects exist; multiple solutions and aftermath persist. |
| Event Lifecycle | Run storm, migration, quarantine and blockade through lifecycle. | Warnings, escalation, resolution, history and compatibility. |
| Peaceful Path | Resolve pirate, creature/boss and ecological crisis without killing. | Equivalent-significance progression and persistent outcome. |
| Multiplayer | Share vessel, cargo, contract, quest and fleet roles with disconnects. | Authority, contribution, no duplication and safe handover. |
| LOD Reconciliation | Simulate distant voyage/fishery/shipyard then promote nearby. | Quantities, condition, crew, history and environment agree. |
| Failure Recovery | Interrupt save, project, cargo transfer, event and pack load. | Atomic rollback/recovery and stable reason codes. |
| Accessibility | Complete progression, contract and event flows with presets. | Readable alternatives, no colour-only truth and no reward penalty. |

# 59. Handoff to Document 26O

Document 26O receives the complete maritime gameplay contract and must close implementation and integration. It may select technical techniques and budgets, but it may not silently change the progression, ownership, conservation, authority or source-of-truth rules established here.

| 26O Must Define | 26N Handoff |
| --- | --- |
| UI/UX | Progression, vessel, port, market, contract, quest, event, ecology, magic and automation view-model requirements. |
| Multiplayer | Authority scopes, replication, prediction, station locks, contribution, reconnect and PvP settings. |
| Godot Architecture | Registry loading, Resources/records, services, commands/events, local/distant simulation and Forge/runtime boundaries. |
| Persistence | Save schemas, journaling, migration, quarantine, recovery and deterministic reconciliation. |
| Performance | Budgets for vessels, ports, fleets, markets, ecology, quests/events, networks, UI and streaming. |
| QA | Automated and manual test suites, laboratories, release gates, diagnostics and evidence bundles. |
| Accessibility | Final control, presentation, comfort and assistance matrices across every maritime system. |
| Main-Document Integration | Exact amendment list for 00-25, authority notes, supersession and implementation sequencing. |
| Set 25 Closure | Resolve namespace token, schema admission, candidate classification, relationship/capability matrices and production sign-off. |
| Rollout | Staged implementation from foundation through realm maritime content with redesign triggers. |

# 60. Open Decisions and Deferred Balance

| Decision ID | Question | Default / Owner |
| --- | --- | --- |
| DEC-26N-001 | Final official expansion namespace token. | Recommend `leyforge.expansion.maritime`; Ash and Set 25 closure. |
| DEC-26N-002 | Final maritime skill and perk grouping. | Use capability-led provisional groups; Ash, 02 and 26O. |
| DEC-26N-003 | Exact Foundation/Vertical Slice content roster. | Classify after 26O budgets and dependency evidence. |
| DEC-26N-004 | Default economy complexity and maintenance cadence. | Moderate, explainable and configurable; 26O prototype. |
| DEC-26N-005 | Catch granularity for ordinary versus notable organisms. | Aggregate cohorts/lots, promote notable individuals; 26M/26O. |
| DEC-26N-006 | Default crew automation and delegation depth. | Bounded roles and orders, no daily micromanagement; 26J/26O. |
| DEC-26N-007 | Earliest practical maritime magic access. | After manual baseline and discoverable provider; 09/26O. |
| DEC-26N-008 | Whether any maritime starting background grants capability. | Default no fixed background bonuses; use tutorial/knowledge options. |
| DEC-26N-009 | Default vessel-loss and recovery harshness. | Recoverable wreck/claim/rescue window; world settings and 26O. |
| DEC-26N-010 | Reward equivalence for peaceful boss outcomes. | Equivalent significance, outcome-specific rewards; Ash/26M. |
| DEC-26N-011 | Distant market/fleet/ecology cadence. | Evidence-based bounded ticks; 26O performance tests. |
| DEC-26N-012 | Final maritime accessibility preset defaults. | Ash, 17 and 26O after user testing. |
| DEC-26N-013 | Insurance/risk-pooling launch scope. | Optional/deferred unless regional economy testing proves value. |
| DEC-26N-014 | Extent of realm-specific vessel capability in first production wave. | Defer beyond core/coastal proof unless Atlas dependency requires earlier teaser. |
| DEC-26N-015 | Player-authored contract and event templates. | Restricted validated templates only; 15/25/26O security review. |

# Appendix A. Illustrative Qualified-ID Register

| Domain | Illustrative ID | Rule |
| --- | --- | --- |
| Capability | `leyforge.system.capability.maritime.navigation.coastal` | System-owned reusable capability identity. |
| Schema Extension | `leyforge.system.schema_extension.block.maritime_material.v1` | Set 25 admitted facet/schema extension. |
| Component | `leyforge.expansion.maritime.component.vessel.capstan.basic` | Expansion-owned physical component. |
| Tool Item | `leyforge.expansion.maritime.item.tool.shipwright_surveyor` | Expansion-only item definition. |
| Fishing Item | `leyforge.expansion.maritime.item.fishing.net.hand_selective` | Method and selectivity encoded by fields/tags, not name alone. |
| Recipe | `leyforge.expansion.maritime.recipe.machine.bilge_pump.basic` | References existing and maritime definitions. |
| Port Service | `leyforge.expansion.maritime.service.port.pilotage.local` | Capability provider with requirements and suitability. |
| Job | `leyforge.expansion.maritime.job.shipwright.general` | Culture-neutral job; culture variants remain overlays. |
| Quest Template | `leyforge.expansion.maritime.quest_template.contract.freight.coastal` | Binds only valid authoritative subjects. |
| Event Template | `leyforge.expansion.maritime.event_template.rescue.storm_vessel` | Condition-driven event/quest exposure. |
| Core Extension | Existing Core water/block/item IDs | Keep Core ID; add admitted maritime facet/relationship. |
| Runtime Vessel | `vessel_instance:<ULID>` | Persistent instance identity, never a content-definition ID. |

These IDs are illustrative until Set 25 closure approves namespace and grammar. Display names, localisation keys and aliases remain separate. Renaming a display label does not change identity.

# Appendix B. Capability Provider Matrix

| Capability | Early Provider | Advanced Provider | Alternative / Recovery |
| --- | --- | --- | --- |
| Water Access | Swimming, wading and flotation. | Dive equipment, vessel or mount. | Shore route, NPC service or safer water body. |
| Fishing | Hand line, trap or spear where legal. | Selective nets, vessel fishery or aquaculture. | Trade, hire fisher or gather non-fish provisions. |
| Vessel Construction | Freeform raft/boat and basic tools. | Shipyard, Vessel Forge blueprint and specialists. | Buy, charter, salvage or receive quest vessel. |
| Navigation | Landmarks, local chart and pilot. | Instruments, beacons, magic and expert navigator. | Escort, known route, wait for weather or hire service. |
| Propulsion | Paddle, oar or simple sail. | Engine, mana drive or hybrid. | Tow, current, port assistance or repair. |
| Pumping | Bucket and hand pump. | Powered/mana network. | Beach/ground safely, compartment isolation or rescue. |
| Cargo Transfer | Carry, cart and simple winch. | Crane, warehouse network and golem. | More labour, smaller lots or alternate berth. |
| Preservation | Cook, salt, dry and basic containers. | Cold chain, magic preservation and processing plant. | Short route, live sale or alternate commodity. |
| Diving | Breath and shallow tools. | Air supply, pressure protection and support vessel. | Wait for tide, drain/open site or hire specialist. |
| Rescue | Flotation, rope, tow and first aid. | Rescue vessel, magic, pumps and medical port. | Signal/contract NPC responders or safer recovery. |
| Maritime Combat | Personal weapons, evasion and surrender. | Mounted weapons, trained crew, wards and fleet command. | Diplomacy, escort, stealth, tribute or route change. |
| Ecology Research | Observation and local knowledge. | Instruments, tagging, laboratory and magical sensing. | Teacher, books, quest evidence or institutional service. |
| Realm Navigation | None required for core progression. | Realm vessel, ritual, portal route and specialist crew. | Faction transport, stable gate or later unlock. |

# Appendix C. Initial Family and Chain Catalogue

| Family / Chain | Core Records | Primary Owners |
| --- | --- | --- |
| Small Craft | Blocks/components, blueprint, recipe/project, vessel instance and certification. | 03-06, 26F-26I, 25. |
| Shipwright Tools | Items, recipes, skill/knowledge and work actions. | 02, 04-06, 26H, 25. |
| Rigging / Sail | Components, materials, recipes, propulsion provider and Forge assets. | 03-06, 21-23, 26F-26I. |
| Engine / Mana Drive | Components, fuel/mana, recipes, networks and certification. | 08-09, 26G, 26N, 25. |
| Port Services | Building/function, job, service, stock, permission and UI contract. | 07, 19-20, 26J, 26O. |
| Cargo / Freight | Items/lots, manifest, contract, route, market and custody. | 04, 15, 26J-26K, 26N. |
| Fishery | Gear, method, catch cohort/lot, licence, processing and ecology relationship. | 04-06, 10, 15, 26M-26N. |
| Diving | Equipment, capability, environment, action and site access. | 02, 04, 16-17, 26E, 26M. |
| Naval Weapon | Item/component, ammunition, station, action, damage and law. | 04-06, 16, 26K-26L. |
| Rescue | Equipment, service, quest/event, medical and claim records. | 07, 15-17, 26E, 26J-26N. |
| Marine Site | Worldgen/site, state, access, occupants, rewards, history and Atlas link. | 11-12, 24, 26C, 26M. |
| Marine Creature / Boss | Creature, cohort/territory, habitat, interactions, rewards and outcomes. | 10, 24, 26M-26N. |
| Maritime Magic | Spell/ritual/rune, provider, cost, network, counter and consequence. | 09, 26N, 25. |
| Maritime Event | Template, conditions, phases, subjects, consequences and history. | 15, 24, 26N. |
| Realm Maritime | Realm pack, adaptations, resources, routes, culture, hazards and site/creature content. | 13-14, 24-26. |

# Appendix D. Quest and Event Templates

| Record | Required Fields |
| --- | --- |
| Quest Template | Qualified ID, scope, authority, trigger/query, subject slots, knowledge visibility, stages, objective modules, solutions, delegation, contribution, rewards, consequences, failure/expiry, aftermath, tags and planning classification. |
| Quest Instance | Instance ID, template revision, bound subjects, owner/party/world scope, accepted time, current stage/objectives, contributions, branch decisions, evidence, state, history and migration. |
| Event Template | Qualified ID, scale, condition sources, compatibility/exclusion, warning, preparation, onset, escalation, resolution, aftermath, memory, recurrence/cooldown, settings and presentation contract. |
| Event Instance | Instance ID, template revision, region/subjects, authoritative phase, phase times, severity, contributions, generated quests, consequences, history and reconciliation state. |
| Objective Module | Module ID, target query, completion evidence, progress measure, authority, automation/delegation, failure reason and UI description. |
| Reward / Consequence | Physical transactions, knowledge, reputation, permission, relationship, world-state changes, obligations, unlocks, history and fallback if subject unavailable. |

# Appendix E. Reason-Code Catalogue

| Reason Code | Meaning |
| --- | --- |
| MARITIME_CAPABILITY_MISSING | Required maritime capability has no active provider. |
| MARITIME_PROVIDER_UNSUITABLE | Provider exists but is unsuitable for subject/environment. |
| MARITIME_KNOWLEDGE_INSUFFICIENT | Actor lacks required knowledge or verified instructions. |
| MARITIME_PERMISSION_DENIED | Ownership, law, licence or role prevents action. |
| MARITIME_ROUTE_UNREACHABLE | No valid route under current capability and conditions. |
| MARITIME_SEED_PROVIDER_GAP | Required progression provider is absent from generated reachability. |
| MARITIME_PACKAGE_DEPENDENCY_MISSING | Required content pack or admitted dependency is unavailable. |
| MARITIME_OPTIONAL_RECORD_ACTIVE | Optional definition is missing while an active instance depends on it. |
| MARITIME_REGISTRY_REFERENCE_INVALID | Qualified reference is missing, wrong-domain or incompatible. |
| MARITIME_FALLBACK_CYCLE | Capability/recipe/provider fallback graph contains a cycle. |
| MARITIME_RECIPE_CONSERVATION_FAILED | Input/output transaction cannot reconcile. |
| MARITIME_CARGO_CUSTODY_CONFLICT | Cargo ownership or custody state conflicts with requested transfer. |
| MARITIME_CATCH_SOURCE_INVALID | Catch lacks valid cohort, method, location or provenance. |
| MARITIME_PROJECT_REQUIREMENT_UNMET | Construction/repair work package lacks valid requirement. |
| MARITIME_MAGIC_COST_UNAVAILABLE | Mana, catalyst, focus, ritual or environmental cost is unavailable. |
| MARITIME_AUTOMATION_FAULT | Network, power, route, capacity, safety or operator fault blocks automation. |
| MARITIME_MARKET_SOURCE_STALE | Market information is too old or uncertain for requested decision. |
| MARITIME_CONTRACT_OBLIGATION_CONFLICT | Contract terms, custody, authority or state are contradictory. |
| MARITIME_QUEST_SUBJECT_INVALID | Quest subject no longer exists or fails binding constraints. |
| MARITIME_EVENT_CONDITION_INVALID | Event conditions cannot be resolved from authoritative state. |
| MARITIME_LOD_RECONCILIATION_FAILED | Near/distant state cannot reconcile safely. |
| MARITIME_SAVE_MIGRATION_UNRESOLVED | Persisted maritime record lacks approved migration/quarantine. |
| MARITIME_MULTIPLAYER_AUTHORITY_CONFLICT | Two commands or roles claim incompatible authority. |
| MARITIME_PRESENTATION_CONTRACT_MISSING | Critical state lacks required player-facing explanation. |
| MARITIME_RELEASE_EVIDENCE_INCOMPLETE | Production gate lacks required test/audit/sign-off evidence. |

# Appendix F. Completion Checklist

| Area | Completion Requirement |
| --- | --- |
| Progression | Every major maritime path has manual baseline, advanced providers, alternatives and meaningful outcomes. |
| Registry | IDs, schemas, facets, relationships, capabilities, packs and migrations pass Set 25. |
| Blocks / Items / Recipes / Resources | Families are admitted without duplicate truth and conserve physical state. |
| Magic | Applications extend existing schools with costs, counters and mundane relevance. |
| Automation | Networks conserve goods/energy/labour and expose faults and manual recovery. |
| Economy | Cargo, catch, markets, contracts, labour, maintenance, salvage and risk are physical and explainable. |
| Quests | Templates bind real subjects, support systemic solutions and preserve failure/aftermath. |
| Events | Lifecycle, compatibility, settings, memory and persistent consequences validate. |
| Atlas | Named content and culture/realm canon remain unchanged unless explicitly approved. |
| Worldgen | Required providers are seed-reachable or have approved recovery paths. |
| Multiplayer | Ownership, contribution, authority and reconnect boundaries are declared. |
| Accessibility | Critical actions and information have configurable, non-colour and reduced-input support. |
| LOD / Persistence | Near/distant summaries, saves, migrations and optional-pack quarantine reconcile. |
| Production | Candidate roster, dependencies, evidence, performance budgets and sign-off are recorded. |
| Handoff | 26O has all view-model, technical, QA and amendment requirements needed to close Set 26. |
