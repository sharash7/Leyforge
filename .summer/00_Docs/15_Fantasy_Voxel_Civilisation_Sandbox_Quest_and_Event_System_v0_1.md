**Fantasy Voxel Civilisation Sandbox**

**15 - Quest and Event System**

**Version 0.1 - Detailed Design Bible Draft**

*A database-ready quest and event system for authored stories, simulation-driven needs, NPC relationships, village projects, exploration mysteries, faction politics, raids, rituals, dimensions, multiplayer, consequences, and proof-of-concept world change.*

Working design document - quest, event, consequence, and narrative simulation foundation

| **Quest and Event System Statement**                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Quests are not detached errands layered over the sandbox. They are readable expressions of real needs, opportunities, relationships, discoveries, projects, conflicts, and world-state changes. Events are not random interruptions only; they are time-bounded or condition-driven changes that affect settlements, routes, factions, magic, ecology, infrastructure, and dimensions. The player may help, ignore, negotiate, automate, exploit, betray, conquer, restore, or redirect these situations, and the world should remember the outcome. |

| **Field**        | **Locked Direction**                                                                                                                                                                                                                                                                        |
|------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Document Scope   | Full design-bible document covering quest identity, categories, generation, discovery, objectives, branching, failure, rewards, world events, raids, social events, exploration, factions, magic, dimensions, UI, multiplayer, accessibility, data architecture, registries, and POC scope. |
| Core Philosophy  | Use a hybrid authored-and-simulated model. Quests support sandbox freedom and convert genuine world conditions into understandable goals without making the world wait passively for the player.                                                                                            |
| Event Philosophy | Events occur at personal, structure, settlement, regional, faction, world, dimensional, and cosmic scales. They may progress without the player, create quest chains, overlap under compatibility rules, and leave persistent evidence.                                                     |
| POC Direction    | Prove one connected Forest Hamlet Watchtower Arc: need discovery -\> resource gathering -\> real processing -\> warehouse delivery -\> NPC construction -\> warning and preparation -\> goblin raid -\> persistent aftermath.                                                               |
| Data Direction   | Use database/spreadsheet-ready IDs, parent templates, stages, conditions, objective modules, actors, locations, rewards, consequences, world-state links, ownership, contribution records, simulation LOD, and planning status.                                                             |
| Player Freedom   | Support heroic, neutral, commercial, political, peaceful, exploitative, criminal, conqueror, and forbidden-magic approaches with coherent consequences rather than a single assumed morality.                                                                                               |

# Document Purpose

This document defines how quests and world events work across the Fantasy Voxel Civilisation Sandbox. It turns the project’s living-world promise into concrete rules for how needs become requests, how discoveries become investigations, how projects become staged objectives, how factions create political conflicts, how events escalate and resolve, and how player choices become persistent world history.

The system is deliberately broader than a conventional RPG quest log. A food shortage may be solved through farming, trade, hunting, irrigation, storage, magical growth, rationing, diplomacy, or conquest. A raid may be prevented through scouting, fortification, camp clearance, tribute, misinformation, or alliance. A ruin may be looted, restored, cleansed, claimed, activated, sold, concealed, or surrendered to a culture that considers it sacred.

This document does not replace the detailed NPC Village System, Structures document, Magic System, Automation System, Creatures and Monsters document, Dimensions document, future Economy System, future Combat and Defence System, or future Player Settlement System. Instead, it defines the quest-facing and event-facing rules those systems must expose.

# Design Source

| **Source Document**                        | **Relevant Direction**                                                                                                                                   | **How This Document Uses It**                                                                                                                                     |
|--------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 00 - Master Game Design Bible              | The game is a sandbox-first hybrid where magic and factories build civilisations, unlock stories, power settlements, and reshape the world.              | Quests and events are designed as cross-system world changes rather than a separate linear campaign layer.                                                        |
| 01 - Core Gameplay Loop                    | Primary loop: explore -\> gather -\> craft -\> build -\> interact -\> automate -\> defend -\> upgrade -\> expand. Guidance is optional and configurable. | Quest objectives may formalise any loop step, while events create the world response that drives the next goal.                                                   |
| 02 - Player Progression System             | Progression is multi-track across tools, skills, knowledge, magic, automation, villages, reputation, factions, bosses, and dimensions.                   | Quest rewards and unlocks support multiple tracks without making quest completion the only viable progression source.                                             |
| 03-06 - Blocks, Items, Recipes, Resources  | Physical blocks, items, recipes, and resources have exact IDs, states, ownership, uses, and world-facing roles.                                          | Objectives reference real inventory, storage, construction, production, repair, ritual, and project state rather than abstract counters wherever practical.       |
| 07 - NPC Village System                    | Named NPCs, real needs, warehouses, requests, memories, staged projects, raids, families, migration, and persistent consequences.                        | Simulation conditions create contextual quests, and outcomes affect NPC memory, settlement history, population, morale, damage, and growth.                       |
| 08 - Automation System                     | Automation feeds warehouses, projects, defence, and trade through physical supply chains and permissions.                                                | Automation can satisfy repeatable contracts and ongoing project requirements, while sabotage, shortages, and failures can generate new quests.                    |
| 09 - Magic System                          | Magic is practical infrastructure with runes, wards, rituals, corruption, portals, and cultural consequences.                                            | Magic quests include discovery, teaching, research, containment, cleansing, ritual preparation, leyline events, forbidden practices, and dimensional instability. |
| 10 - Creatures and Monsters                | Creatures create ecology, raids, faction pressure, drops, boss gates, and settlement consequences.                                                       | Creature encounters can be prevented, investigated, negotiated, hunted, contained, redirected, or escalated into persistent events.                               |
| 11 - Biomes and World Generation           | Worldgen places villages, resources, structures, camps, roads, leylines, corruption, seasons, and dynamic regional state.                                | Event generation is grounded in actual regions, routes, weather, biomes, structures, danger, and simulation LOD.                                                  |
| 12 - Structures                            | Structures have ownership, damage, occupation, restoration, activation, and world-memory states.                                                         | Structure quests can discover, clear, restore, claim, defend, repair, cleanse, activate, or politically contest a site.                                           |
| 13 - Races, Peoples, Cultures and Factions | Cultures and factions have identities, laws, beliefs, territories, relationships, histories, and evolving goals.                                         | Cultural and faction arcs use values, taboos, laws, claims, diplomacy, war, reform, and internal conflict rather than generic reputation grinding.                |
| 14 - Dimensions                            | Dimensions are complete realm systems with access, societies, resources, hazards, politics, and cross-realm consequences.                                | Realm quests and events connect native conditions to Overworld portals, migration, trade, corruption, war, and world-scale progression.                           |

# Static Table of Contents

- 1\. Locked Quest and Event System Identity

- 2\. Player Answer Decision Summary

- 3\. Quest and Event System Architecture

- 4\. Parent Quest, Event, and Runtime Data Model

- 5\. Quest Categories, Families, and Tags

- 6\. Quest Generation and World-State Validation

- 7\. Discovery, Rumours, Acceptance, and Negotiation

- 8\. Objectives, Solutions, Delegation, and Automation

- 9\. Branching, Choice, Morality, and Allegiance

- 10\. Failure, Expiration, Recovery, and Persistent Consequences

- 11\. Rewards, Progression, Contribution, and Obligations

- 12\. World Event Architecture and Lifecycle

- 13\. Threats, Raids, Disasters, and Aftermath

- 14\. Social, Cultural, Legal, and Settlement Events

- 15\. Exploration, Mystery, Structures, and Environmental Story

- 16\. Factions, Politics, Territory, Espionage, and War

- 17\. Magic, Ritual, Leyline, Portal, and Dimensional Events

- 18\. Quest Journal, Map, Alerts, and Player-Created Objectives

- 19\. Multiplayer Ownership, Contribution, and Conflict

- 20\. Difficulty, Accessibility, and World Settings

- 21\. Technical Architecture, Validation, Modding, and Debugging

- 22\. Proof-of-Concept Quest and Event Scope

- 23\. Detailed Quest Registry v0.1

- 24\. Detailed Event Registry v0.1

- 25\. Core POC Scenario: Forest Hamlet Watchtower Arc

- 26\. Balancing and Pacing Rules

- 27\. Open Questions for Later Documents

- Appendix A. POC Quest and Event Checklist

- Appendix B. Quest Database Field Template

- Appendix C. Event Database Field Template

- Appendix D. Objective and Condition Module Library

- Appendix E. Cross-System Use Matrix

- Appendix F. Player Answer Lock 1-200

- Appendix G. Future Quest and Event Backlog

- Appendix H. POC Success Criteria

# 1. Locked Quest and Event System Identity

The Quest and Event System is the readable intention and consequence layer of the game. The simulation already contains needs, shortages, relationships, threats, opportunities, structures, factions, rituals, roads, resources, and changing settlements. Quests translate selected conditions into goals the player can understand and choose to engage with. Events move the world through time and state, whether or not the player is present.

| **Locked Rule**                                                                                                                                                                                                                                                                                           |
|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| A quest should represent a meaningful need, opportunity, relationship, discovery, conflict, project, or world change. An event should make the world feel alive while remaining readable, configurable, consequential, and respectful of the player’s chosen pace. Neither system should exist as filler. |

| **Identity Layer**      | **Design Meaning**                                                                                                                       | **Player-Facing Result**                                                                       |
|-------------------------|------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------|
| Sandbox Guidance        | Quests provide optional direction without replacing free building, exploration, automation, trade, or self-defined goals.                | Players can follow structured content, ignore it, or discover solutions through ordinary play. |
| Simulation Expression   | Real shortages, damage, relationships, faction pressure, structure states, and threats create contextual objectives.                     | Requests feel specific to actual people and places rather than randomly generated errands.     |
| Authored Story          | Handcrafted arcs provide characters, mysteries, cultural depth, major choices, and memorable set pieces.                                 | The world has deliberate stories without becoming a mandatory linear campaign.                 |
| Systemic Solutions      | Objectives can be solved through combat, diplomacy, construction, logistics, magic, automation, trade, stealth, research, or delegation. | Player identity and infrastructure matter.                                                     |
| Persistent Consequence  | Success, failure, delay, betrayal, neutrality, and absence alter NPCs, settlements, factions, structures, routes, biomes, and realms.    | The world remembers what happened and continues rather than resetting.                         |
| World Event Motion      | Events progress through warning, preparation, onset, escalation, resolution, aftermath, memory, and recurrence.                          | The world feels active beyond the player.                                                      |
| Data-Driven Scalability | Parent templates, reusable objectives, conditions, rewards, dialogue, and event phases support authored and procedural content.          | The system can grow into a large final game and remain moddable and testable.                  |

## 1.1 Quest Design Promise

A player should be able to understand why a quest exists, who is affected, what is currently known, what may happen if nothing changes, and which systems could provide a solution. Information can be incomplete or deceptive, but the quest should never feel disconnected from the world.

## 1.2 Event Design Promise

A player should be able to notice an event through environmental signs, NPC behaviour, trade disruption, reports, weather, magical instruments, or direct observation. Major events should leave evidence such as damage, graves, new buildings, changed leadership, migration, corruption, memorials, altered routes, or regional history.

## 1.3 What the System Is Not

- It is not a chain of generic kill, collect, and deliver tasks detached from simulation.

- It is not a mandatory campaign that blocks the sandbox until the player follows a marker.

- It is not a procedural text generator allowed to invent nonexistent people, locations, resources, or consequences.

- It is not a constant emergency feed that punishes players for building slowly or exploring at their own pace.

- It is not a morality meter that labels every choice good or evil without cultural, political, or material context.

- It is not a POC requirement to implement every faction war, dimension crisis, social system, or civilisation-scale project.

# 2. Player Answer Decision Summary

All 200 questionnaire answers selected option E. The following tables consolidate those choices into implementable design locks rather than repeating the wording of every question.

| **Area**             | **Locked Decision**                                                                                                                                                                                            |
|----------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Core Identity        | Hybrid authored, simulation-generated, procedural, exploratory, factional, structural, and event-driven quest system. Sandbox freedom remains primary.                                                         |
| Main Story           | Optional world-spanning mystery that may be followed, paused, ignored, redirected, failed, or completed without ending the sandbox.                                                                            |
| Quest Categories     | Main mystery, cultural arcs, faction arcs, village stories, personal NPC stories, projects, contracts, exploration, structures, rituals, dimensions, emergencies, tutorials, repeatables, and emergent quests. |
| Generation           | Contextual templates populated from valid NPC, settlement, faction, resource, structure, threat, relationship, and world-state data.                                                                           |
| Discovery            | NPC conversation, behaviour, rumours, boards, letters, messengers, maps, clues, dreams, world events, faction channels, and direct observation.                                                                |
| Objectives           | Modular objectives support inventory, storage, production, construction, maintenance, defence, diplomacy, investigation, escort, repair, teaching, rituals, and world-state conditions.                        |
| Solutions            | Multiple systemic solutions with readable suggestions; combat, diplomacy, stealth, trade, magic, building, automation, and delegation are all legitimate where plausible.                                      |
| Branching            | Branching scales with importance and reacts to dialogue, prior actions, reputation, infrastructure, timing, culture, law, casualties, discovery, and world state.                                              |
| Failure              | Failure usually creates altered world state and follow-up content rather than deleting the story or forcing reload.                                                                                            |
| Rewards              | Currency, items, recipes, knowledge, reputation, relationships, permissions, land, specialists, structures, services, titles, obligations, and world change.                                                   |
| Events               | Personal through cosmic scales; condition-driven, calendar-driven, random-weighted, or player-triggered; may overlap and persist.                                                                              |
| Raids and Disasters  | Threat selection uses value, defences, routes, factions, mana output, ecology, season, and settings. Preparation and prevention matter.                                                                        |
| Social Events        | Festivals, markets, births, weddings, funerals, trials, elections, succession, rituals, disputes, and project openings have simulation effects.                                                                |
| Exploration          | Mysteries use rumours, maps, environmental clues, structures, puzzles, restoration, claims, and contested discoveries.                                                                                         |
| Faction Politics     | War, espionage, logistics, territory, reform, alliance, conquest, neutrality, and player-founded factions are supported.                                                                                       |
| Magic and Dimensions | Rituals, magical weather, forbidden practices, terrain transformation, portal spread, realm politics, and cross-realm consequences.                                                                            |
| UI                   | Filterable journal, configurable tracking and markers, known-stakes display, event history, resource-source links, custom objectives, and spoiler protection.                                                  |
| Multiplayer          | Personal, party, settlement, faction, regional, and world quest ownership with contribution records, competing sides, contracts, and fair offline rules.                                                       |
| Accessibility        | Independent controls for markers, hints, timers, failure severity, event frequency, NPC death, procedural density, pause behaviour, and text presentation.                                                     |
| Technical            | Data-driven definitions, stable registry IDs, standard lifecycle states, modular objectives and conditions, validation, mod hooks, persistent history, and debug tools.                                        |
| POC                  | Forest Hamlet Watchtower Arc with real resources, optional automation, practical magic, staged NPC construction, flexible raid timing, graded outcomes, and persistent aftermath.                              |
| Long-Term            | Civilisation-scale projects, evolving cultures, player-issued quests, NPC refusal, leadership consequences, delayed callbacks, and emergent stories.                                                           |

# 3. Quest and Event System Architecture

The system is built as linked records rather than one monolithic script. A quest definition describes intended structure; runtime records track current actors, objectives, progress, branches, contributions, and consequences. Event definitions describe lifecycle phases and affected systems; regional simulation determines whether and how they progress at distance.

| **Layer**        | **Purpose**                                                                   | **Examples**                                                                                                         |
|------------------|-------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------|
| Quest Definition | Stable authored or templated content record.                                  | ID, title pattern, category, stages, objective modules, dialogue hooks, reward rules, consequence rules.             |
| Quest Runtime    | Save-specific mutable state.                                                  | Accepted, current stage, actor references, progress, discovered facts, deadlines, selected branch, contributors.     |
| Event Definition | Reusable event lifecycle and compatibility rules.                             | Raid, festival, storm, famine, corruption wave, caravan, election, dimensional breach.                               |
| Event Runtime    | Current phase, region, actors, severity, progress, and outcome.               | Warning at Forest Hamlet; raid force assembling; bridge damaged; recovery active.                                    |
| Objective Module | Reusable measurable requirement.                                              | Deliver items, maintain reserve, build structure, defend area, discover site, escort NPC, complete ritual.           |
| Condition Module | Reusable trigger or gate.                                                     | Village food below threshold; trust above level; structure occupied; eclipse active; portal unstable.                |
| Actor Reference  | Links persistent people, groups, creatures, or factions.                      | Named NPC, household, village, goblin warband, merchant guild, regional authority.                                   |
| World Target     | Links locations, structures, blocks, inventories, routes, regions, or realms. | Warehouse stock, watchtower blueprint, bridge state, rune ruin, portal anchor.                                       |
| Outcome Package  | Validated requests to underlying systems.                                     | Change ownership, reserve resources, damage blocks, adjust reputation, migrate NPCs, unlock recipe, create memorial. |
| History Record   | Compressed persistent record after resolution.                                | Who contributed, what changed, casualties, choices, rewards, site state, follow-up hooks.                            |

| **Authority Rule**                                                                                                                                                                                                                            |
|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Quests do not directly bypass world systems. A quest requests validated changes through village, structure, inventory, faction, reputation, creature, magic, automation, biome, and dimension systems. The world state remains authoritative. |

# 4. Parent Quest, Event, and Runtime Data Model

| **Parent Class / Record** | **Controls**                                                                                        | **Example Children**                                                            |
|---------------------------|-----------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------|
| BaseQuest                 | ID, display title, category, scope, visibility, ownership, lifecycle, tags, planning status.        | AuthoredQuest, GeneratedQuest, ContractQuest, ProjectQuest, InvestigationQuest. |
| AuthoredQuest             | Fixed narrative stages, custom dialogue, bespoke branches, major outcome packages.                  | Culture arc, personal NPC story, optional main mystery chapter.                 |
| GeneratedQuest            | Template, context requirements, variable bindings, repetition rules, validation and fallback.       | Food shortage request, broken tool request, road danger contract.               |
| ProjectQuest              | Project recipe, resource reserve, construction stages, labour, permissions, operation requirements. | Watchtower, bridge repair, mage tower, irrigation canal.                        |
| EventQuest                | Links to an event phase and may appear or expire as that event progresses.                          | Raid preparation, famine relief, festival supply, storm containment.            |
| InvestigationQuest        | Facts, clues, uncertainty, suspects, evidence, false leads, revelation thresholds.                  | Missing caravan, corrupted spring, sabotage inquiry.                            |
| FactionQuest              | Faction goals, ideology, law, territory, diplomacy, betrayal, allegiance, war contribution.         | Border fortification, peace summit, espionage, reform movement.                 |
| RitualQuest               | Participants, site, timing, components, purity, interruption, risk, outcome range.                  | Ward renewal, cleansing, portal opening, forbidden summoning.                   |
| BaseEvent                 | ID, scale, trigger model, phases, duration, compatibility, affected systems, severity, recurrence.  | RaidEvent, FestivalEvent, DisasterEvent, PoliticalEvent, DimensionalEvent.      |
| QuestRuntime              | Current stage, objective states, actors, targets, known facts, timers, choices, contributors.       | Player accepted watchtower project and delivered 60% iron.                      |
| EventRuntime              | Current phase, origin, region, spread, actors, severity, warnings, resolution state.                | Goblin raid in warning phase with two nights estimated.                         |
| HistoryRecord             | Compressed resolved state and callbacks.                                                            | Forest Hamlet defended; tower completed; Captain escaped; three NPCs injured.   |

# 5. Quest Categories, Families, and Tags

| **Category**           | **Primary Purpose**                                                                                                     | **Typical Sources**                                                           |
|------------------------|-------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------|
| Main Mystery           | Optional long-form world mystery connecting ancient history, dimensions, factions, and civilisation-scale consequences. | Ruins, archives, races, relics, bosses, realm gates, major events.            |
| Cultural Arc           | Explore culture, identity, tradition, history, taboos, specialists, and settlement growth.                              | Culture leaders, shrines, festivals, ancestral sites, migration, realm links. |
| Faction Arc            | Political goals, territory, law, trade, war, reform, espionage, alliance, or conquest.                                  | Faction leaders, outposts, treaties, conflicts, internal divisions.           |
| Village Story          | Settlement growth, shortage, project, defence, trade, leadership, disaster, migration, or recovery.                     | Village simulation, request board, leaders, warehouses, events.               |
| Personal NPC Story     | Named NPC profession, family, ambition, fear, belief, grief, relationship, legacy, or secret.                           | NPC memory, schedule, traits, household, world events.                        |
| Project                | Construct, restore, repair, operate, staff, maintain, or defend infrastructure.                                         | Village plans, player contracts, faction works, structure states.             |
| Contract               | Explicit agreement with negotiable payment, deadline, quality, ownership, and obligations.                              | Boards, merchants, guilds, factions, players.                                 |
| Emergency              | Immediate threat or need with escalation and possible independent resolution.                                           | Raids, fire, illness, missing person, broken ward, famine.                    |
| Exploration            | Locate, survey, map, reach, document, or survive a place.                                                               | Rumours, maps, landmarks, environmental clues.                                |
| Structure              | Investigate, clear, claim, restore, activate, cleanse, defend, or contest a site.                                       | Ruins, camps, mines, shrines, bridges, portals.                               |
| Research and Knowledge | Study resources, creatures, magic, machines, history, languages, or phenomena.                                          | Books, scholars, experiments, ruins, creature observation.                    |
| Magic and Ritual       | Learn, prepare, power, defend, interrupt, regulate, cleanse, or contain magic.                                          | Mages, shrines, leylines, corruption, portals, rituals.                       |
| Dimensional            | Open access, survive, negotiate, settle, repair portals, contain spread, or influence realm politics.                   | Realm gates, native factions, portal events, dimensional materials.           |
| Tutorial               | Optional contextual teaching attached to genuine early goals.                                                           | Player settings, first actions, first village, first station.                 |
| Repeatable             | Real recurring service or supply need with cooldown and context validation.                                             | Trade routes, maintenance, patrols, seasonal work, production contracts.      |
| Emergent               | Simulation-created story recognised and formalised after meaningful conditions arise.                                   | NPC conflict, unexpected migration, structure occupation, route collapse.     |

## 5.1 Tag Families

- Scope: personal, household, structure, settlement, route, regional, faction, world, dimensional, cosmic.

- Method: combat, diplomacy, stealth, trade, building, production, automation, magic, research, escort, repair, ritual, leadership.

- Urgency: persistent, opportunity, scheduled, warning, urgent, critical, aftermath.

- Ownership: personal, party, settlement, faction, public, world.

- Visibility: hidden, rumour, discovered, offered, accepted, active, tracked, archived.

- Morality and law: legal, disputed, criminal, forbidden, sacred, exploitative, reformist, conqueror.

- Planning status: POC Required, Alpha, Beta, Final Game, Placeholder, Deferred.

# 6. Quest Generation and World-State Validation

Generated quests use contextual templates, not unrestricted randomness. A generator first identifies a valid condition, then finds a suitable giver or communication channel, target, solution space, consequence, reward source, and fallback behaviour.

1.  Detect a meaningful world condition or opportunity, such as low food reserve, damaged bridge, missing worker, excessive mana leakage, occupied ruin, trade demand, or faction pressure.

2.  Confirm scope and importance. Trivial fluctuation should not create a formal quest unless the player has requested dense task guidance.

3.  Bind real entities: named NPCs, households, villages, factions, structures, routes, items, resources, creatures, regions, or dimensions.

4.  Validate that at least one plausible solution exists under current world settings and that the objective is reachable or can generate a safe target.

5.  Choose a template whose tone, culture, profession, urgency, and category match the condition.

6.  Populate dialogue and journal text from authored phrase sets and real context.

7.  Assign consequence and reward rules based on who benefits, who pays, what stock exists, and what could happen without intervention.

8.  Apply repetition memory, category cooldowns, diversity rules, and anti-farm limits.

9.  Revalidate at offer, acceptance, stage transition, and completion. If the world changes, adapt, transfer, resolve, or safely close the quest.

10. Archive outcome and feed significant results back into NPC memory, settlement history, faction state, and future generation.

| **Generation Input**               | **Example**                                         | **Generated Possibilities**                                                                  |
|------------------------------------|-----------------------------------------------------|----------------------------------------------------------------------------------------------|
| Food reserve below seasonal target | Forest Hamlet has eight days of food before winter. | Hunt, expand farms, build storage, negotiate caravan, use nature magic, ration supplies.     |
| Project lacks exact materials      | Watchtower requires iron fittings and timber.       | Delivery contract, production order, trade request, mine survey, automation tutorial.        |
| Worker unavailable                 | Village builder is injured.                         | Medicine, recruit apprentice, hire worker, use player labour, delay project.                 |
| Route state unsafe                 | Goblin patrols control bridge road.                 | Escort, patrol, negotiate toll, clear camp, build alternate route, conceal shipments.        |
| Magic instability rising           | Rune ruin is leaking mana into nearby fields.       | Research, containment, cleansing, exploitation, ritual, evacuation.                          |
| Faction claim conflict             | Two cultures claim an ancestral mine.               | Investigate records, mediate, support one side, joint venture, conceal evidence, seize site. |
| NPC relationship crisis            | Guard accuses merchant of supplying raiders.        | Evidence collection, trial, intimidation, bribery, surveillance, reconciliation.             |
| Structure discovered               | Dormant shrine found under the forest.              | Survey, restore, cleanse, activate, report, claim, loot, conceal.                            |

| **Generation Safety Rule**                                                                                                                                                                                                                                                 |
|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| A procedural quest must never depend on an actor who cannot exist, a location that cannot be reached, an item that has no source, or an outcome that bypasses ownership and simulation rules. Broken context must trigger adaptation or safe resolution, not player blame. |

# 7. Discovery, Rumours, Acceptance, and Negotiation

| **Discovery Channel**  | **Use**                                                                               | **Information Quality**                                       |
|------------------------|---------------------------------------------------------------------------------------|---------------------------------------------------------------|
| Direct Request         | NPC or faction openly asks for help.                                                  | Usually reliable but may omit motives or consequences.        |
| Request Board          | Settlement shortages, projects, warnings, contracts, missing people, trade needs.     | Official but may be outdated or politically filtered.         |
| Overheard Conversation | Arguments, concern, gossip, work complaints, family news.                             | Partial and socially biased.                                  |
| Behavioural Clue       | NPC schedule changes, empty workplace, mourning, guards mobilising.                   | Observed fact with uncertain cause.                           |
| Environmental Clue     | Tracks, smoke, broken carts, corrupted blocks, damaged roads, strange weather.        | Physical evidence requiring interpretation.                   |
| Rumour                 | Travellers, merchants, taverns, patrols, refugees.                                    | May be true, exaggerated, false, manipulated, or obsolete.    |
| Letter or Messenger    | Remote contract, warning, invitation, summons, plea, diplomatic communication.        | Source is known; contents may still deceive.                  |
| Map or Knowledge Item  | Treasure map, survey, archive record, coded report.                                   | Precision depends on age, quality, and player knowledge.      |
| Dream, Omen, or Magic  | Vision, spirit message, divination, leyline instrument.                               | Symbolic, incomplete, corruptible, or culturally interpreted. |
| Direct Action          | Player begins repairing, gathering, exploring, or defending before formal acceptance. | Valid actions may count retroactively where logical.          |

## 7.1 Acceptance States

| **State**         | **Meaning**                                                                           |
|-------------------|---------------------------------------------------------------------------------------|
| Unseen            | Condition exists but player has no awareness.                                         |
| Rumoured          | Lead exists without confirmed facts or formal commitment.                             |
| Discovered        | Player knows enough to record the opportunity or problem.                             |
| Offered           | A giver or board presents terms.                                                      |
| Negotiating       | Payment, method, deadline, authority, ownership, or obligations are under discussion. |
| Accepted          | Player or party makes a formal commitment.                                            |
| Observed Progress | Relevant actions count even without formal acceptance where logically valid.          |
| Rejected          | Player declines; the world may continue and another actor may intervene.              |
| Deferred          | Player delays; urgency and availability may change.                                   |
| Transferred       | Responsibility moves to another actor, party, successor, leader, or faction.          |

## 7.2 Negotiable Terms

- Payment, resource share, ownership of salvage, recognition, reputation credit, land, access, recipe teaching, future service, political concession, deadline, quality target, acceptable methods, secrecy, casualties, and liability.

- Negotiation uses relationship, leverage, reputation, culture, law, market conditions, evidence, and urgency rather than one universal persuasion roll.

- The player may reject, delay, barter, threaten, deceive, propose an alternative, delegate, betray, or accept under conditions.

# 8. Objectives, Solutions, Delegation, and Automation

| **Objective Module**  | **Core Measurement**                                                                                            | **Examples**                                           |
|-----------------------|-----------------------------------------------------------------------------------------------------------------|--------------------------------------------------------|
| Acquire               | Valid ownership or access to real items/resources.                                                              | Obtain medicine, acquire maps, secure ritual catalyst. |
| Deliver               | Move valid items to a defined person, inventory, warehouse, project reserve, machine, or site.                  | Supply watchtower iron to village warehouse.           |
| Produce               | Create output through valid recipe or production chain with source, quality, and delivery rules.                | Maintain 20 iron ingots per day for three days.        |
| Construct             | Reach required structure/project state through player building, blueprint, NPC labour, or hybrid contribution.  | Complete watchtower stage two.                         |
| Repair or Restore     | Change damage, contamination, occupancy, power, or historical state.                                            | Repair bridge, cleanse shrine, reactivate mine.        |
| Maintain              | Keep reserve, safety, throughput, morale, ward coverage, route security, or ecology inside thresholds for time. | Maintain food reserve above 30% through winter.        |
| Defend                | Prevent protected actors or structures from crossing damage, casualty, theft, or occupation thresholds.         | Defend village warehouse during raid.                  |
| Investigate           | Collect facts, evidence, testimony, observations, or analyses until conclusion threshold.                       | Identify saboteur or source of corruption.             |
| Discover or Survey    | Reach, map, observe, document, sample, or reveal a location or phenomenon.                                      | Survey cave deposit or dimensional breach.             |
| Interact or Negotiate | Reach a valid social, legal, diplomatic, or contractual state.                                                  | Secure alliance, negotiate toll, obtain testimony.     |
| Escort or Transport   | Move an actor, caravan, creature, item, or convoy along a route under constraints.                              | Escort refugees to allied village.                     |
| Teach or Train        | Transfer knowledge, improve skill, demonstrate process, or mentor an NPC.                                       | Train apprentice builder or teach ward maintenance.    |
| Ritual                | Prepare site, participants, components, timing, power, purity, and uninterrupted execution.                     | Renew settlement ward during eclipse.                  |
| Contain or Relocate   | Keep threat inside area, move it safely, redirect ecology, or close access.                                     | Relocate magical beast; seal unstable portal.          |
| Decide or Govern      | Select law, project, leader, policy, sentence, alliance, or response.                                           | Choose rationing policy or succession candidate.       |

## 8.1 Systemic Solution Rules

- Objectives define desired world states, not a single mandatory sequence of button presses.

- Suggested methods are guidance, not invisible requirements, unless the fiction demands a specific ritual, legal process, material, or cultural method.

- Hostile encounters may support combat, stealth, diplomacy, bribery, intimidation, traps, relocation, reform, alliance, cleansing, or avoidance depending on intelligence and context.

- Automation can satisfy repeatable supply, maintenance, and production requirements when the underlying flow is real and permitted.

- NPC followers, workers, specialists, hired parties, golems, or factions may be delegated objectives according to skill, loyalty, equipment, risk, cost, authority, and travel time.

- One real action may contribute to several quests where logical, but overlapping reward rules must prevent exploitative duplication.

# 9. Branching, Choice, Morality, and Allegiance

Branching depth scales with narrative importance. A minor repair request may have a small number of outcomes; a cultural arc, faction war, leadership crisis, or dimensional event may branch over many stages and return much later through world memory.

| **Branch Source**           | **Possible Effect**                                                                                                   |
|-----------------------------|-----------------------------------------------------------------------------------------------------------------------|
| Dialogue and Negotiation    | Terms, trust, secrecy, payment, commitment, or method changes.                                                        |
| Prior Actions               | Past rescues, theft, conquest, trade, forbidden magic, or neglect alter available choices.                            |
| Reputation and Relationship | Access, testimony, loyalty, prices, acceptance, betrayal risk, or refusal.                                            |
| Infrastructure              | Roads, factories, wards, farms, portals, watchtowers, hospitals, and storage open new solutions.                      |
| Timing                      | Early intervention, delay, missed warning, seasonal change, or event phase alters objectives.                         |
| Knowledge and Evidence      | New facts reveal motives, innocence, hidden sites, weaknesses, or legal claims.                                       |
| Culture and Law             | Taboos, sacred materials, ownership, burial, magic restrictions, inheritance, and justice change acceptable outcomes. |
| Casualties and Damage       | Deaths, injuries, ruined buildings, stolen stock, and displaced families alter later stages.                          |
| Faction Allegiance          | Support, neutrality, double dealing, reform, secession, conquest, or betrayal changes the arc.                        |
| World State                 | Biome corruption, dimension access, leadership, settlement stage, route ownership, or war status changes content.     |

| **Moral Design Rule**                                                                                                                                                                                                                                                                                                                                                                            |
|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| The game may contain choices with clear harm or cruelty, but it should not reduce every conflict to one colour-coded answer. Cultures, laws, material needs, relationships, and long-term consequences should create real trade-offs. Exploitative and conqueror paths are supported, but the world responds with fear, resistance, rebellion, legal action, hatred, dependence, or opportunism. |

# 10. Failure, Expiration, Recovery, and Persistent Consequences

| **Failure Type**                   | **Default Response**                                                                  | **Possible Follow-Up**                                                                   |
|------------------------------------|---------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------|
| Player declines                    | World continues; another actor may try or the condition may worsen.                   | Rival gains credit, settlement adapts, later plea, hostility, or independent resolution. |
| Deadline passes                    | Resolve from actual event and simulation state.                                       | Shortage, casualty, lost contract, altered route, reduced reward, emergency phase.       |
| Actor dies                         | Transfer, transform, or fail based on objective.                                      | Legacy quest, relative continues, leadership inherits, revenge, memorial.                |
| Target destroyed                   | Revalidate purpose and alternatives.                                                  | Rebuild elsewhere, salvage, recover survivors, accept permanent loss.                    |
| Wrong method or collateral damage  | Outcome records method and harm.                                                      | Reputation loss, legal action, altered reward, faction anger, recovery work.             |
| Major event lost                   | World moves into alternate state rather than stopping.                                | Occupation, migration, corruption, conquest, new leadership, resistance, rebuilding.     |
| Player abandons accepted contract  | Commitment and stakes determine response.                                             | Payment loss, debt, reputation damage, bounty, renegotiation, transfer.                  |
| Procedural context becomes invalid | Adapt, transfer, auto-resolve, or safely close.                                       | Compensation, explanation, generated fallback, no player penalty.                        |
| Settlement destroyed               | Persistent ruin and survivors replace old quest hub.                                  | Resettlement, liberation, cleansing, refugee support, historical recovery.               |
| Ritual fails                       | Outcome depends on materials, timing, participants, purity, interruption, and damage. | Corruption, summoned threat, unstable portal, injury, partial success, new research.     |

## 10.1 Irreversibility and Recovery

- Irreversible outcomes are allowed but should be proportionate, foreshadowed where reasonable, configurable by world settings, and supported by meaningful continuation.

- Destroyed settlements may become ruins, occupied sites, monster nests, haunted places, refugee sources, memorial locations, or restoration projects.

- Core gameplay systems should rarely be permanently locked behind one missed quest; alternative acquisition, another teacher, research path, faction, or later recovery should usually exist.

# 11. Rewards, Progression, Contribution, and Obligations

| **Reward Family** | **Examples**                                                                                       | **Design Rule**                                                                            |
|-------------------|----------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------|
| Material          | Currency, resources, tools, gear, components, food, relics.                                        | Must come from believable stock, crafting, salvage, faction treasury, or generated source. |
| Knowledge         | Recipe, map, language, enemy weakness, research, ritual, structure location.                       | Often more valuable than raw currency and should connect to discovery.                     |
| Social            | NPC relationship, village reputation, culture standing, faction rank, fear, trust.                 | Tracks who remembers the action and why.                                                   |
| Access            | Land, building permission, warehouse input, restricted district, archive, portal, specialist.      | Access can be conditional, revocable, or linked to law.                                    |
| Service           | Healing, transport, labour, protection, crafting, teaching, legal support.                         | May be immediate, scheduled, or owed.                                                      |
| Civilisation      | New structure, repaired route, market, trade route, guard unit, school, shrine, settlement growth. | World improvement is itself a major reward.                                                |
| Authority         | Title, office, vote, command, law-making, faction representation, settlement leadership.           | Creates responsibility and political consequences.                                         |
| Narrative         | Reconciliation, rescue, truth, safety, revenge, memorial, legacy, changed world history.           | Does not need extra loot to be meaningful.                                                 |
| Obligation        | Debt, duty, patronage, alliance, maintenance, secrecy, enemy attention, legal condition.           | Powerful rewards can create future expectations and quests.                                |

## 11.1 Contribution Records

The system records meaningful contribution by player, party, settlement, or faction: delivered materials, construction labour, production, combat, healing, scouting, diplomacy, discovery, ritual participation, transport, and leadership. This record influences multiplayer reward division, settlement memory, monuments, dialogue, titles, political claims, and future contracts.

# 12. World Event Architecture and Lifecycle

| **Lifecycle Phase** | **Function**                                                         | **Player-Facing Signals**                                                         |
|---------------------|----------------------------------------------------------------------|-----------------------------------------------------------------------------------|
| Condition           | Underlying requirements accumulate.                                  | Rising tension, low reserves, faction movement, unstable mana, seasonal pressure. |
| Foreshadowing       | Early clues exist before certainty.                                  | Rumours, tracks, weather anomalies, price shifts, missing caravans.               |
| Warning             | Event is likely enough to communicate.                               | Messenger, board notice, alarms, watchtower sighting, magical instrument.         |
| Preparation         | Actors gather resources, build, evacuate, negotiate, or investigate. | Preparation quests, schedule changes, stockpiling, patrols.                       |
| Onset               | Event becomes active.                                                | Raid arrives, festival begins, storm strikes, election opens.                     |
| Escalation          | Severity, spread, participation, or stakes increase.                 | Reinforcements, fire spread, corruption expansion, political unrest.              |
| Climax              | Critical decision or peak simulation state.                          | Boss assault, ritual moment, vote, bridge collapse, portal surge.                 |
| Resolution          | Active threat or activity concludes.                                 | Victory, defeat, agreement, dispersal, containment, postponement.                 |
| Aftermath           | Damage, shortages, injuries, celebration, mourning, repair, blame.   | Recovery quests, funerals, rebuilding, trade changes.                             |
| Memory              | Persistent history affects future behaviour.                         | Memorials, renamed sites, grudges, holidays, altered laws.                        |
| Recurrence          | Event can repeat or evolve under rules.                              | Annual festival, seasonal migration, retaliatory raid, recurring storm.           |

## 12.1 Event Scales

| **Scale**            | **Examples**                                               |
|----------------------|------------------------------------------------------------|
| Personal             | Illness, rivalry, apprenticeship, grief, accusation.       |
| Household            | Birth, marriage, inheritance, shortage, migration.         |
| Structure            | Fire, collapse, occupation, activation, sabotage.          |
| Settlement           | Festival, election, raid, famine, construction opening.    |
| Route                | Caravan, blockade, bridge failure, monster migration.      |
| Regional             | War front, drought, corruption wave, trade boom.           |
| Faction              | Coup, schism, mobilisation, treaty, reform.                |
| Continental or World | Eclipse, empire war, plague, ancient awakening.            |
| Dimensional          | Portal instability, realm migration, cross-realm invasion. |
| Cosmic               | Leyline convergence, celestial event, reality fracture.    |

# 13. Threats, Raids, Disasters, and Aftermath

Threat events are selected from world state rather than simple nightly randomness. Target wealth, food, stored magic, strategic location, defences, faction hostility, routes, noise, pollution, previous defeats, season, and world settings affect probability and scale.

| **Threat Family**  | **Preparation and Prevention**                                                                           | **Persistent Outcomes**                                                                           |
|--------------------|----------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------|
| Raid               | Scouting, watchtowers, guards, walls, diplomacy, tribute, camp clearance, route control, misinformation. | Deaths, stolen stock, damaged structures, retaliation, fear, captured attackers, political blame. |
| Fire               | Water access, spacing, materials, firebreaks, patrols, magic wards, maintenance.                         | Burnt blocks, homelessness, rebuilding, legal changes, memorial.                                  |
| Famine             | Farms, reserves, storage, trade, rationing, hunting, irrigation, nature magic.                           | Migration, illness, unrest, debt, changed prices, reform.                                         |
| Disease            | Medicine, sanitation, quarantine, healers, research, travel control.                                     | Deaths, immunity, stigma, medical institutions, faction response.                                 |
| Magical Storm      | Forecasting, grounding, wards, shutdown, mana storage, evacuation, ritual.                               | Corruption, mutations, charged resources, machine damage, new magical sites.                      |
| Corruption Wave    | Cleansing, containment, wards, source destruction, evacuation, controlled exploitation.                  | Altered biome, creatures, haunted structures, long recovery.                                      |
| Flood or Drought   | Dams, drainage, storage, canals, relocation, magic, crop change.                                         | Changed terrain, routes, harvests, settlement layout.                                             |
| Sabotage           | Security, audits, witnesses, redundancy, counterintelligence, diplomacy.                                 | Broken machines, distrust, trial, faction conflict, law changes.                                  |
| Dimensional Breach | Portal shutdown, containment, negotiation, defence, stabilisation, evacuation.                           | Realm creatures, refugees, resource change, cross-realm politics.                                 |

## 13.1 Raid Outcome Model

- Raid objectives may include theft, assassination, capture, sabotage, occupation, intimidation, destruction, rescue, or resource seizure rather than simple extermination.

- Warning quality depends on scouts, watchtowers, wards, patrols, spies, terrain, and faction intelligence.

- Intelligent attackers adapt targets, timing, equipment, routes, allies, and tactics after previous outcomes.

- Aftermath can include injuries, funerals, repairs, shortages, investigation, retaliation, migration, morale change, political blame, memorials, and new defensive doctrine.

# 14. Social, Cultural, Legal, and Settlement Events

| **Event**                     | **System Effects**                                                                | **Quest Hooks**                                                                       |
|-------------------------------|-----------------------------------------------------------------------------------|---------------------------------------------------------------------------------------|
| Festival                      | Schedules, visitors, trade, food use, morale, contests, rituals, temporary shops. | Supply goods, prepare venue, protect event, resolve dispute, participate in contest.  |
| Wedding or Bonding            | Households, relationships, inheritance, migration, alliances, culture rites.      | Gather materials, escort family, negotiate objections, officiate, defend ceremony.    |
| Birth or Adoption             | Household needs, population, succession, morale, care.                            | Medicine, supplies, guardianship, naming rite, family reconciliation.                 |
| Funeral or Memorial           | Mourning, inheritance, leadership, belief, morale, grave or monument.             | Recover body, investigate death, build memorial, settle inheritance, perform rite.    |
| Trial                         | Law, evidence, witnesses, punishment, reputation, political pressure.             | Investigate, testify, defend, prosecute, bribe, intimidate, expose corruption.        |
| Election or Succession        | Leadership, policy, faction alignment, jobs, projects, laws.                      | Campaign, investigate candidate, broker coalition, expose fraud, support coup.        |
| Market or Caravan Day         | Supply, demand, visitors, trade, crime, route safety.                             | Escort caravan, fill contract, stop theft, negotiate trade rights.                    |
| Project Opening               | New jobs, services, prestige, faction claim, maintenance.                         | Prepare ceremony, inspect safety, bless structure, respond to sabotage.               |
| Religious or Cultural Rite    | Belief, taboo, sacred resources, calendar, identity, magic.                       | Acquire acceptable materials, defend site, resolve doctrinal dispute, perform ritual. |
| Protest, Strike, or Rebellion | Labour, law, inequality, shortages, leadership, security.                         | Negotiate, suppress, investigate cause, reform policy, support resistance.            |

| **Cultural Integrity Rule**                                                                                                                                                                                                                                                                                                               |
|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Quest methods are interpreted through culture. A materially successful solution may still be offensive if it violates burial customs, sacred ownership, food taboos, magical law, architectural tradition, social rank, or accepted justice. These reactions must be foreshadowed through knowledge and dialogue, not hidden arbitrarily. |

# 15. Exploration, Mystery, Structures, and Environmental Story

Exploration content mixes direct landmarks, approximate areas, maps, clues, journals, environmental evidence, NPC knowledge, puzzles, procedural sites, and free discovery. The journal records what the player knows, not omniscient truth.

| **Mystery Component** | **Role**                                                                                  |
|-----------------------|-------------------------------------------------------------------------------------------|
| Lead                  | Rumour, map, witness, strange event, structure, item, or observation that begins inquiry. |
| Fact                  | Verified information supported by evidence or trusted source.                             |
| Clue                  | Information that narrows possibilities but may require interpretation.                    |
| False Lead            | Believable but incorrect, manipulated, outdated, or misread information.                  |
| Theory                | Player or journal inference, marked separately from confirmed fact.                       |
| Suspect or Claimant   | NPC, faction, creature, culture, or phenomenon connected to cause or ownership.           |
| Evidence              | Item, block state, testimony, record, magical trace, route data, or experiment result.    |
| Revelation Threshold  | Minimum evidence or action needed to unlock conclusion, accusation, ritual, or new site.  |
| Unresolved Ambiguity  | Deliberate uncertainty where records conflict or final truth is unknowable.               |
| Disclosure Choice     | Reveal, conceal, sell, destroy, forge, monopolise, or selectively share discovery.        |

## 15.1 Structure Quest States

- Discover -\> survey -\> investigate -\> clear or negotiate -\> loot or preserve -\> repair or cleanse -\> claim or return -\> activate or repurpose -\> defend or maintain.

- Not every structure uses every stage. A small cache may remain simple; major ruins, shrines, portals, mines, camps, roads, and settlements support deeper state changes.

- Restoration should often provide new jobs, trade, travel, knowledge, faction access, or settlement opportunities rather than only cosmetic repair.

# 16. Factions, Politics, Territory, Espionage, and War

| **Political Quest Family** | **Possible Activities**                                                                                     |
|----------------------------|-------------------------------------------------------------------------------------------------------------|
| Diplomacy                  | Treaties, reparations, mediation, recognition, trade rights, border agreements, hostage exchange.           |
| Territory                  | Survey, claim, fortify, patrol, settle, contest, liberate, occupy, administer.                              |
| War Logistics              | Produce supplies, repair routes, transport food, equip guards, build forts, treat wounded.                  |
| Espionage                  | Surveillance, infiltration, disguise, bribery, informants, coded messages, counterintelligence.             |
| Sabotage                   | Disable machines, poison supplies, disrupt roads, expose weaknesses, plant misinformation.                  |
| Reform                     | Gather support, expose abuse, replace leadership, change law, build institutions, negotiate transition.     |
| Conquest                   | Intimidate, siege, capture leadership, impose tribute, install authority, suppress or negotiate resistance. |
| Neutrality                 | Broker trade, protect civilians, refuse alliance, enforce borders, provide aid to both sides.               |
| Internal Conflict          | Succession, schism, corruption, labour unrest, regional secession, ideological dispute.                     |
| Player Faction             | Recruit, govern, set law, build identity, negotiate, expand, defend, manage succession.                     |

## 16.1 War Initiation and Progression

Wars emerge from accumulated ideology, territory, resources, historical grievances, leadership, trade, sabotage, events, and player actions. War stages may include tension, mobilisation, border incidents, declaration, campaigns, occupation, negotiation, ceasefire, settlement, insurgency, reconstruction, and historical memory.

# 17. Magic, Ritual, Leyline, Portal, and Dimensional Events

| **Quest/Event Family**  | **Core Variables**                                                               | **Possible Consequences**                                                         |
|-------------------------|----------------------------------------------------------------------------------|-----------------------------------------------------------------------------------|
| Spell or Rune Discovery | Knowledge source, teacher, ruin, experiment, components, school.                 | New capability, faction interest, risk, cultural reaction.                        |
| Ritual                  | Site, timing, participants, materials, purity, power, interruption, knowledge.   | Success, partial effect, corruption, summon, injury, portal, weather change.      |
| Leyline Surge           | Cycle, location, infrastructure, mana load, forecasting.                         | Power boost, overload, creature spawn, resource change, terrain mutation.         |
| Magical Weather         | Region, season, mana density, realm influence, wards.                            | Crop effects, machine instability, rare resources, mutations, hazards.            |
| Forbidden Practice      | Secrecy, law, sacrifice, corruption, faction ideology, witnesses.                | Persecution, power, cult growth, disaster, reform debate, rebellion.              |
| Portal Opening          | Anchor, frame, key, stabilisation, destination, politics.                        | Trade, invasion, refugees, contamination, stranded actors, realm access.          |
| Dimensional Spill       | Portal state, realm ecology, creatures, weather, resource flow.                  | Cross-realm migration, disease, faction conflict, altered biome.                  |
| Realm Crisis            | Native factions, survival rules, resources, settlements, bosses, portal network. | Overworld consequences, alliance, colonisation, closure, war, permanent exchange. |

| **Ritual System Rule**                                                                                                                                                                                                                                            |
|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Rituals are independent systemic activities that quests may discover, require, alter, interrupt, defend, regulate, or respond to. Quest completion does not automatically guarantee ritual success; the ritual evaluates its own physical and magical conditions. |

# 18. Quest Journal, Map, Alerts, and Player-Created Objectives

| **Interface Area**   | **Locked Direction**                                                                                                                                  |
|----------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------|
| Journal Organisation | Filter by story, settlement, NPC, faction, project, event, region, realm, urgency, status, objective type, and custom tags.                           |
| Tracking             | Many entries may exist, but visible HUD tracking is limited and configurable to prevent clutter.                                                      |
| Markers              | Precision depends on knowledge, maps, scouting, magic, landmarks, and accessibility settings; exact markers are not always granted.                   |
| Known Stakes         | Show confirmed or reasonably inferred consequences while preserving uncertainty and deception.                                                        |
| Difficulty Estimate  | Optional estimate based on threat, travel, survival, tools, logistics, magic, time, and political risk.                                               |
| Event Alerts         | Configurable sounds, banners, map alerts, messengers, environmental cues, or minimal mode.                                                            |
| Resource Links       | Known items, recipes, biomes, traders, storage, machines, codex entries, and rumours link from objectives without revealing undiscovered information. |
| Personal Objectives  | Players can add notes, map pins, construction plans, resource targets, reminders, routes, settlement goals, and shared objectives.                    |
| History              | Completed and failed quests retain searchable choices, contributors, outcomes, rewards, casualties, affected places, and follow-up consequences.      |
| Spoiler Protection   | Journal shows only currently known facts by default, with optional detailed previews and accessibility overrides.                                     |

# 19. Multiplayer Ownership, Contribution, and Conflict

| **Quest Scope**   | **Ownership and Consequence**                                                                                                   |
|-------------------|---------------------------------------------------------------------------------------------------------------------------------|
| Personal          | One player’s commitment, relationship, secret, training, or legal status.                                                       |
| Party             | Shared accepted objective with party-defined reward and dialogue authority.                                                     |
| Settlement        | Infrastructure, law, defence, shortages, projects, and population affect all members with rights.                               |
| Faction           | Members may receive shared goals while individual loyalty and reputation remain tracked.                                        |
| Regional or World | Event outcomes alter the shared world for everyone.                                                                             |
| Competing         | Different players may support opposing sides where world settings allow.                                                        |
| Player Contract   | Players create resource, construction, transport, exploration, defence, crafting, bounty, or service contracts.                 |
| Offline Progress  | World state may progress, but personal commitments and severe irreversible effects require fair server rules and notifications. |

## 19.1 Dialogue and Decision Authority

- Quest-specific authority may use accepting player, party leader, vote, settlement office, faction rank, affected-player consent, or host/server rule.

- One player cannot silently spend another player’s personal resources, transfer their land, or accept severe personal consequences without permission.

- Contribution records support fair rewards without reducing every role to damage dealt.

# 20. Difficulty, Accessibility, and World Settings

| **Setting Family**  | **Configurable Options**                                                                                                         |
|---------------------|----------------------------------------------------------------------------------------------------------------------------------|
| Guidance            | Markers, search areas, compass, hints, tutorial intensity, known resource links.                                                 |
| Quest Density       | Generated quest frequency, category filters, board density, NPC request frequency.                                               |
| Events              | Frequency, overlap, warning time, regional simulation, pause while offline.                                                      |
| Timers              | Strictness, visibility, grace period, pause rules, approximate vs exact information.                                             |
| Failure             | Consequence severity, irreversible outcomes, reward loss, recovery options.                                                      |
| Threat              | Raid frequency, size, intelligence, structure damage, NPC injury/death, corruption spread.                                       |
| NPC Consequences    | Death, injury, migration, replacement, resurrection possibilities, essential safeguards.                                         |
| Peaceful Adaptation | Convert violent pressure into rescue, preparation, diplomacy, relocation, containment, or non-lethal competition where possible. |
| Text and Interface  | Concise/detailed views, icons, audio, text size, colour-independent cues, simplified language.                                   |
| Puzzle Support      | Timed hints, companion hints, skill hints, environmental emphasis, direct accessibility solutions.                               |
| Spoilers            | Hide future objectives, rewards, branches, hidden facts, or allow detailed previews.                                             |
| World Pace          | Pause or slow distant simulation, major events, deadlines, or all time in single-player and supported servers.                   |

# 21. Technical Architecture, Validation, Modding, and Debugging

| **Technical Area**  | **Requirement**                                                                                                                                                                                  |
|---------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Stable IDs          | All quests, events, objectives, conditions, actors, locations, items, blocks, recipes, structures, biomes, factions, cultures, creatures, magic, machines, and realms use database-friendly IDs. |
| Lifecycle           | Standard states: unseen, rumoured, discovered, offered, negotiating, accepted, active, paused, resolved-success, resolved-failure, expired, abandoned, transferred, archived.                    |
| Nested Structure    | Arc -\> chapter -\> quest -\> stage -\> objective -\> sub-objective, with optional goals and linked events.                                                                                      |
| Condition Engine    | Composable AND, OR, NOT, threshold, time, relationship, ownership, inventory, location, structure, event, and world-state checks.                                                                |
| Outcome Engine      | Validated commands to underlying systems with transactional rollback or fallback on failure.                                                                                                     |
| Generation Logs     | Record condition source, template choice, entity bindings, validation results, cooldowns, and failures.                                                                                          |
| Debug Tools         | Inspect state, trace conditions, simulate objective progress, view actor references, preview outcomes, skip stages, repair broken references.                                                    |
| Modding             | Mods may add quest types, objective modules, conditions, rewards, dialogue, event families, factions, structures, and cross-system hooks.                                                        |
| Persistence         | Keep consequential history; archive low-value detail into compressed summaries.                                                                                                                  |
| Performance         | Detailed local evaluation; scheduled regional checks; abstract distant event progression; avoid evaluating every possible template every tick.                                                   |
| Authoring           | Support data files, spreadsheet import/export, visual graph editing, localisation keys, and automated validation reports.                                                                        |
| Procedural Dialogue | Use authored templates populated by real context. Advanced generative dialogue may be considered later under lore, tone, consistency, safety, and persistence controls.                          |

# 22. Proof-of-Concept Quest and Event Scope

| **POC Proof**                                                                                                                                                                                                                                   |
|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| The POC must prove that a real village need can become a readable quest, that resources and automation can satisfy that need, that NPCs physically construct a defence, that an event responds to preparation, and that the aftermath persists. |

| **POC Component**        | **Required Behaviour**                                                                                                                     |
|--------------------------|--------------------------------------------------------------------------------------------------------------------------------------------|
| Primary Arc              | Forest Hamlet Watchtower Arc connects village concern, project, supply, construction, warning, raid, and aftermath.                        |
| Discovery                | Player can notice incomplete defence plans, hear guard concerns, speak to elder, inspect request board, or observe goblin signs.           |
| Resources                | Wood, stone, iron, and a limited mana/rune component exist as real items and project stock.                                                |
| Production               | Manual processing works; copper/iron automation is introduced and strongly useful but not absolutely mandatory.                            |
| Warehouse                | Delivery goes to village warehouse/project reserve with permissions and contribution record.                                               |
| Construction             | Builder NPC visibly constructs watchtower in stages using reserved materials.                                                              |
| Magic                    | Basic rune, mana furnace, ward lantern/stone, or similar practical magic improves processing or defence.                                   |
| Threat Event             | Goblin raid uses warning and flexible event window tied to project state and POC pacing.                                                   |
| Outcomes                 | At least four graded outcomes based on tower progress, ward status, supplies, player participation, guard readiness, and enemy camp state. |
| Aftermath                | Persistent damage, injuries or safety, celebration or mourning, dialogue, reputation, repair needs, and event history.                     |
| Supporting Investigation | Small rune ruin chain links mage, mana resource, practical magic, and raid preparation.                                                    |
| Optional Prevention      | Clearing or disrupting goblin camp reduces raid strength; diplomacy/alternate solution can be placeholder if not implemented.              |
| UI                       | Dialogue, request board, quest tracker, project progress, raid warning, warehouse contribution, and aftermath summary.                     |
| Settings                 | POC exposes basic marker guidance, event warning, and consequence severity options.                                                        |

# 23. Detailed Quest Registry v0.1

| **Internal ID**                     | **Display Name**                  | **Category**             | **Context**             | **Status**   | **Core Design**                                                                                     |
|-------------------------------------|-----------------------------------|--------------------------|-------------------------|--------------|-----------------------------------------------------------------------------------------------------|
| quest.poc.watchtower_arc            | The Hamlet Needs Eyes             | Village Project Arc      | Forest Hamlet           | POC Required | Discover need -\> supply resources -\> build tower -\> prepare -\> survive raid -\> aftermath.      |
| quest.poc.watchtower_materials      | Stone, Timber, and Iron           | Project Supply           | Forest Hamlet Warehouse | POC Required | Deliver exact materials to reserved project stock; manual or automated supply.                      |
| quest.poc.rune_ruin_investigation   | Whispers Beneath the Moss         | Investigation / Magic    | Old Rune Ruin           | POC Required | Investigate mana leak, recover rune knowledge, choose restoration or extraction.                    |
| quest.poc.basic_rune_training       | Lines That Hold Power             | Teaching / Research      | Village Mage            | POC Required | Learn Basic Rune and use Rune Table with real materials.                                            |
| quest.poc.ward_preparation          | A Light Against the Dark          | Magic / Defence          | Forest Hamlet           | POC Required | Craft and power a ward lantern or ward stone before raid.                                           |
| quest.poc.goblin_scouting           | Tracks at the Eastern Ridge       | Exploration / Threat     | Goblin Camp Route       | POC Required | Locate camp, identify raid force, improve warning accuracy.                                         |
| quest.poc.raid_preparation          | Before the Horns Sound            | Emergency / Preparation  | Forest Hamlet           | POC Required | Equip guards, stock food, repair gate, complete tower, power ward.                                  |
| quest.poc.raid_defence              | The Night of Ash and Iron         | Event / Defence          | Forest Hamlet           | POC Required | Protect key actors and structures; outcome graded by preparation.                                   |
| quest.poc.raid_aftermath            | What We Keep Standing             | Aftermath / Recovery     | Forest Hamlet           | POC Required | Treat injuries, repair damage, mourn losses, celebrate survival, record history.                    |
| quest.village.food_shortage         | The Empty Granary                 | Generated Village Need   | Any settlement          | Alpha        | Resolve real food shortage through farming, trade, hunting, storage, magic, or rationing.           |
| quest.route.broken_bridge           | A Road Cut in Two                 | Structure / Route        | Bridge or crossing      | Alpha        | Repair, replace, reroute, or politically control a strategic crossing.                              |
| quest.npc.missing_worker            | The Empty Bed                     | Personal / Investigation | Named NPC household     | Alpha        | Find, rescue, confirm death, or discover migration/betrayal.                                        |
| quest.faction.contested_mine        | What Lies Beneath Belongs to Whom | Faction / Territory      | Strategic mine          | Final Game   | Investigate claims, mediate, seize, divide, conceal, or support one side.                           |
| quest.magic.failed_ritual           | The Circle Broke                  | Magic Emergency          | Ritual site             | Alpha        | Contain consequences, rescue participants, identify failure, repair or exploit result.              |
| quest.dimension.refugees            | Guests from a Broken Sky          | Dimensional / Social     | Portal settlement       | Final Game   | Shelter, return, exploit, recruit, or politically manage realm refugees.                            |
| quest.player.contract_supply        | Custom Supply Contract            | Player Contract          | Player-defined          | Alpha        | Deliver specified item tag, quantity, quality, destination, payment, and deadline.                  |
| quest.settlement.law_trial          | The Weight of Testimony           | Legal / Social           | Settlement court        | Final Game   | Gather evidence, testify, influence judgement, expose corruption, or manipulate trial.              |
| quest.culture.ancestral_shrine      | The Name Beneath the Stone        | Cultural / Structure     | Ancestral shrine        | Final Game   | Restore, return, conceal, loot, or reinterpret a sacred site.                                       |
| quest.faction.peace_summit          | A Table Between Swords            | Faction / Diplomacy      | Neutral meeting site    | Final Game   | Prepare security, negotiate terms, expose sabotage, sign or collapse peace.                         |
| quest.world.main_mystery_chapter_01 | The First Sleeping Gate           | Optional Main Mystery    | Ancient portal network  | Final Game   | Connect ruins, cultures, dimensions, and ancient civilisation without forcing campaign progression. |

# 24. Detailed Event Registry v0.1

| **Internal ID**                  | **Display Name**             | **Scale/Category**     | **Status**   | **Lifecycle**                                                                | **Primary Inputs**                                       |
|----------------------------------|------------------------------|------------------------|--------------|------------------------------------------------------------------------------|----------------------------------------------------------|
| event.poc.goblin_raid            | Goblin Raid on Forest Hamlet | Settlement Threat      | POC Required | Warning -\> preparation -\> assault -\> resolution -\> aftermath             | Threat, camp state, watchtower, ward, supplies, guards.  |
| event.settlement.festival        | Seasonal Village Festival    | Settlement Social      | Alpha        | Preparation -\> opening -\> celebration -\> closure -\> memory               | Season, culture, food, safety, visitors, morale.         |
| event.settlement.funeral         | Community Funeral            | Settlement Social      | Alpha        | Mourning -\> preparation -\> rite -\> aftermath -\> memory                   | NPC death, culture, family, belief, body recovery.       |
| event.route.caravan_arrival      | Merchant Caravan Arrival     | Route / Economy        | Alpha        | Travel -\> arrival -\> market -\> departure                                  | Route safety, demand, faction access, weather.           |
| event.region.mana_storm          | Mana Storm                   | Regional Magic         | Alpha        | Foreshadowing -\> warning -\> surge -\> dissipation -\> altered state        | Mana density, leylines, wards, machines, weather.        |
| event.region.corruption_wave     | Corruption Wave              | Regional Disaster      | Final Game   | Pressure -\> spread -\> climax -\> containment/expansion -\> recovery        | Source, biome, wards, creatures, rituals, player action. |
| event.settlement.election        | Settlement Election          | Political              | Final Game   | Nomination -\> campaign -\> vote -\> dispute -\> transition                  | Leadership rules, reputation, factions, law, evidence.   |
| event.faction.border_war         | Border War                   | Faction / Regional     | Final Game   | Tension -\> mobilisation -\> incidents -\> war -\> settlement/occupation     | Territory, resources, leaders, trade, player actions.    |
| event.dimension.breach           | Dimensional Breach           | Dimensional Threat     | Final Game   | Instability -\> opening -\> spread -\> climax -\> closure/stabilisation      | Portal, realm, creatures, wards, politics, resources.    |
| event.cosmic.eclipse             | The Blackglass Eclipse       | World / Cosmic         | Final Game   | Forecast -\> preparation -\> eclipse -\> magical climax -\> aftermath        | Calendar, rituals, undead, mana, culture, dimensions.    |
| event.settlement.project_opening | Civic Project Opening        | Settlement Growth      | Alpha        | Inspection -\> ceremony -\> operation -\> memory                             | Project completion, culture, safety, faction claim.      |
| event.region.drought             | Regional Drought             | Climate / Economy      | Final Game   | Drying -\> warning -\> scarcity -\> crisis -\> recovery                      | Weather, water, crops, storage, trade, magic.            |
| event.structure.mine_collapse    | Mine Collapse                | Structure Emergency    | Alpha        | Failure -\> rescue window -\> stabilisation -\> investigation -\> repair     | Support blocks, workers, geology, machines, sabotage.    |
| event.social.labour_strike       | Workshop Strike              | Social / Political     | Final Game   | Grievance -\> organisation -\> stoppage -\> negotiation/conflict -\> outcome | Pay, safety, laws, leaders, resources, player orders.    |
| event.realm.fae_bloom            | Fae Bloom                    | Regional / Dimensional | Final Game   | Signs -\> bloom -\> transformation -\> bargain/containment -\> memory        | Fae influence, season, leyline, culture, ecology.        |

# 25. Core POC Scenario: Forest Hamlet Watchtower Arc

11. Arrival and observation: the player discovers Forest Hamlet through road, smoke, or exploration. The eastern side has poor visibility, an unfinished defensive plan, and worried guard dialogue.

12. Need discovery: the elder, request board, builder, or direct observation creates the watchtower quest. The player learns the village lacks timber, stone, iron fittings, and a stable warning system.

13. Resource path: the player gathers wood and stone, finds iron ore, smelts iron, and may establish a basic miner, chute, furnace or mana furnace, storage, and warehouse delivery line.

14. Magic support: the mage points toward an old rune ruin. Investigation reveals mana crystal use and a Basic Rune. The player may craft a ward lantern or improve the mana furnace.

15. Project reservation: delivered materials enter the village warehouse and are reserved for the watchtower project. The contribution ledger updates, and the builder begins staged construction.

16. Threat intelligence: tracks, scouts, or camp investigation reveal goblin preparations. Better scouting increases warning precision and may reveal targets and raid route.

17. Preparation window: the player may finish the tower, equip guards, repair the gate, stock food and medicine, power the ward, set traps, attack the camp, or ignore the warning.

18. Raid event: goblins approach with objectives based on camp state and village value. The watchtower improves detection and guard positioning; the ward affects magical or night pressure; supplies affect endurance.

19. Graded resolution: outcomes range from decisive defence, costly defence, partial theft/damage, village defeat or evacuation. The goblin captain may die, flee, be captured, or become a future rival.

20. Aftermath: villagers repair, celebrate, mourn, accuse, reward, or migrate according to the outcome. Dialogue, reputation, project state, damage, injuries, graves, and settlement history persist.

21. Forward hook: successful defence may unlock a market, guard expansion, regional contract, faction attention, or future retaliation; failure may unlock rebuilding, rescue, occupation, or refugee content.

| **Outcome Tier**     | **Conditions**                                                               | **Persistent Result**                                                                      |
|----------------------|------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------|
| A - Prepared Victory | Tower complete, ward powered, guards supplied, camp weakened, player active. | Minimal damage; strong reputation; celebration; new defence and trade opportunities.       |
| B - Costly Victory   | Some preparation complete; player defends successfully.                      | Injuries, repairs, reduced stock, mixed morale, follow-up recovery quests.                 |
| C - Partial Loss     | Tower incomplete or supplies weak; key areas damaged or stock stolen.        | Visible destruction, shortages, blame, repair project, goblin escalation.                  |
| D - Village Defeat   | Poor preparation, player absent or defeated, strong raid force.              | Occupation, deaths, refugees, abandoned structures, liberation or rebuilding arc.          |
| E - Prevented Raid   | Camp neutralised, diplomacy succeeds, or attack redirected before onset.     | No assault; different reputation and faction consequences; prevention recorded as history. |

# 26. Balancing and Pacing Rules

- Quest quantity is not a quality metric. Generated content must pass meaningfulness, validity, diversity, and reward checks.

- Players should not be punished with constant crises for operating a larger settlement. Wealth and activity may attract pressure, but better infrastructure, diplomacy, and information should also improve control.

- Event overlap uses compatibility and priority rules. A festival may overlap with a market, but not every settlement should suffer famine, plague, raid, election, fire, and magical storm simultaneously unless a deliberate catastrophe is occurring.

- Warnings scale with available intelligence. Uncertainty is allowed, but the player should have a fair opportunity to notice severe danger when appropriate systems exist.

- Rewards scale with risk, effort, opportunity cost, contribution, and consequence, not player level alone.

- Automated repeatables should remain valuable without becoming infinite money or XP farms. Contracts use demand, capacity, cooldown, upkeep, and diminishing marginal value.

- Major arcs should recognise builders, engineers, traders, diplomats, researchers, leaders, mages, explorers, and combatants as legitimate contributors.

- Failure should create stories, not only remove rewards. Recovery must be possible often enough that players remain invested in a persistent world.

- POC values are balance drafts. Game feel, clarity, and proof of interconnection take priority over final numerical realism.

# 27. Open Questions for Later Documents

- Exact dialogue system, voice presentation, conversational memory, and localisation workflow.

- Full Economy System rules for payment, debt, contracts, insurance, market demand, and supply shocks.

- Combat and Defence System rules for escort, capture, surrender, non-lethal outcomes, siege, and raid objectives.

- Player Settlement System authority, laws, offices, taxes, public works, contracts, and player-issued quest interfaces.

- Crime and Justice System evidence, witnesses, detention, fines, exile, prison, appeals, and faction jurisdiction.

- Exact AI delegation planning, success probability, travel simulation, and companion autonomy.

- Full procedural authoring toolchain and whether advanced generative dialogue is ever appropriate.

- Detailed content rating and safety treatment for slavery, sacrifice, conquest, cults, persecution, and other dark paths.

- Endgame civilisation-scale event pacing, world-state compression, and server governance in long-running multiplayer worlds.

# Appendix A. POC Quest and Event Checklist

- [ ] Forest Hamlet quest discovery through at least three channels

- [ ] Request board entry linked to real project state

- [ ] Warehouse project reserve and contribution ledger

- [ ] Exact wood, stone, iron, and mana-related inputs

- [ ] Manual and automated supply paths

- [ ] Visible NPC watchtower construction stages

- [ ] Rune ruin investigation and Basic Rune unlock

- [ ] Practical magical defence or processing support

- [ ] Goblin camp and threat intelligence

- [ ] Raid warning and preparation phase

- [ ] Raid event with graded outcomes

- [ ] Persistent block damage and repair

- [ ] NPC injury/death settings respected

- [ ] Reputation and dialogue changes

- [ ] Aftermath quest and history record

- [ ] Journal, tracker, event alert, and project progress UI

- [ ] Save/load preservation of quest and event runtime state

- [ ] Debug tools for stage, objective, event, and outcome inspection

# Appendix B. Quest Database Field Template

| **Field Group** | **Suggested Fields**                                                                                    |
|-----------------|---------------------------------------------------------------------------------------------------------|
| Identity        | quest_id, localisation_key, display_name, subtitle, category, subcategory, tags, scope, planning_status |
| Authorship      | author_type, authored_template_id, generator_template_id, version, mod_source                           |
| Visibility      | initial_visibility, discovery_channels, marker_mode, spoiler_level, known_stakes_rules                  |
| Ownership       | ownership_scope, accepting_actor, party_id, settlement_id, faction_id, authority_rule                   |
| Actors          | giver_refs, target_actor_refs, participant_refs, successor_rules, death_fallbacks                       |
| World Targets   | region_id, location_refs, structure_refs, route_refs, inventory_refs, realm_refs                        |
| Lifecycle       | state, stage_id, start_time, deadline, expiry_policy, pause_rules, transfer_rules                       |
| Objectives      | objective_ids, required_flags, optional_flags, hidden_flags, shared_progress_rules                      |
| Conditions      | offer_conditions, acceptance_conditions, stage_conditions, completion_conditions, failure_conditions    |
| Dialogue        | offer_dialogue, negotiation_dialogue, stage_dialogue, reaction_dialogue, outcome_dialogue               |
| Rewards         | reward_package_ids, source_inventory, contribution_rules, negotiation_bounds, obligations               |
| Consequences    | success_outcomes, failure_outcomes, abandonment_outcomes, method_outcomes, aftermath_hooks              |
| Generation      | context_bindings, repetition_group, cooldown, uniqueness, validation_log, fallback_policy               |
| UI              | journal_summary, detailed_text, hints, warnings, map_data, difficulty_estimate, resource_links          |
| History         | contributors, choices, casualties, damage, rewards_given, reputation_changes, archival_summary          |

# Appendix C. Event Database Field Template

| **Field Group** | **Suggested Fields**                                                                                     |
|-----------------|----------------------------------------------------------------------------------------------------------|
| Identity        | event_id, localisation_key, display_name, category, scale, tags, planning_status                         |
| Trigger         | trigger_model, required_conditions, weighted_factors, calendar_rules, random_weight, player_triggers     |
| Location        | origin_ref, affected_regions, spread_rules, route_links, realm_links                                     |
| Actors          | initiator_refs, participant_refs, target_refs, responder_rules, faction_roles                            |
| Lifecycle       | phase_definitions, phase_durations, transition_conditions, escalation_rules, recurrence                  |
| Severity        | base_severity, modifiers, caps, difficulty_scaling, mitigation_inputs                                    |
| Warnings        | foreshadowing_channels, warning_channels, precision_rules, alert_settings                                |
| Compatibility   | allowed_overlaps, blocked_events, priority, suppression, merge rules                                     |
| Effects         | NPC schedules, settlement needs, structure states, creatures, economy, magic, automation, biome, portals |
| Quests          | generated_quest_templates, phase_quests, recovery_quests, prevention_quests                              |
| Resolution      | success_states, failure_states, independent_actor_resolution, outcome scoring                            |
| Aftermath       | damage, casualties, migration, morale, repairs, memorials, leadership, trade, history                    |
| Simulation      | local_detail_profile, distant_tick_rate, abstraction_rules, offline_progress                             |
| Debug           | force_phase, preview_outcomes, trace_inputs, repair_state, event_log                                     |

# Appendix D. Objective and Condition Module Library

| **Module Family** | **Initial Library**                                                                                                                                                                                                                          |
|-------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Objective         | Acquire, deliver, produce, consume, reserve, construct, repair, restore, maintain, defend, escort, discover, survey, investigate, negotiate, teach, ritual, contain, relocate, govern, survive, capture, rescue.                             |
| Condition         | Inventory amount, storage threshold, ownership, permission, reputation, relationship, NPC alive, NPC present, structure state, project stage, event phase, biome state, route safety, time, season, weather, faction control, world setting. |
| Scoring           | Quantity, quality, speed, cost, casualties, damage, secrecy, legality, sustainability, method, contributor share, cultural acceptance.                                                                                                       |
| Fallback          | Transfer actor, choose alternate target, generate safe site, convert objective, auto-resolve, compensate, close without penalty, create recovery quest.                                                                                      |

# Appendix E. Cross-System Use Matrix

| **System**            | **Quest/Event Connections**                                                                            |
|-----------------------|--------------------------------------------------------------------------------------------------------|
| Blocks                | Construction, damage, repair, corruption, activation, ownership, ritual patterns, environmental clues. |
| Items                 | Delivery, evidence, keys, maps, trade goods, ritual components, rewards, quest binding.                |
| Recipes               | Production objectives, project recipes, repairs, rituals, culture recipes, forbidden paths.            |
| Resources             | Shortages, strategic assets, supply contracts, project inputs, political conflict, dimension keys.     |
| NPC Villages          | Needs, requests, projects, relationships, schedules, leadership, families, raids, history.             |
| Automation            | Production contracts, warehouse supply, maintenance, troubleshooting, sabotage, throughput objectives. |
| Magic                 | Research, runes, rituals, wards, corruption, leylines, magical weather, portals.                       |
| Creatures             | Hunting, ecology, raids, taming, relocation, boss gates, faction enemies, magical threats.             |
| Biomes and Worldgen   | Event regions, weather, seasons, dynamic state, structures, routes, resource distribution.             |
| Structures            | Discovery, clearance, restoration, claiming, occupation, defence, activation, heritage.                |
| Cultures and Factions | Law, taboo, ideology, diplomacy, war, reform, allegiance, political consequence.                       |
| Dimensions            | Access, survival, native factions, portal events, migration, trade, cross-realm threats.               |
| Progression           | XP, skills, knowledge, reputation, permissions, settlement stages, bosses, dimension unlocks.          |
| Multiplayer           | Ownership, contribution, conflicting sides, player contracts, shared consequences, offline progress.   |

# Appendix F. Player Answer Lock 1-200

All questionnaire selections are locked as E. This means the broad hybrid, systemic, context-sensitive, configurable, persistent, and data-driven option is selected for every design question.

| **Question Range** | **Locked Answer**    |
|--------------------|----------------------|
| 1-20               | E for every question |
| 21-40              | E for every question |
| 41-60              | E for every question |
| 61-80              | E for every question |
| 81-100             | E for every question |
| 101-120            | E for every question |
| 121-140            | E for every question |
| 141-160            | E for every question |
| 161-180            | E for every question |
| 181-200            | E for every question |

# Appendix G. Future Quest and Event Backlog

- Full optional main mystery arc and ancient portal network.

- Culture-specific settlement stories for every major people and race.

- Faction war, reform, conquest, espionage, and diplomacy libraries.

- Dynamic family, inheritance, romance, rivalry, apprenticeship, and legacy stories.

- Player-founded settlement governance, law, public works, and contract systems.

- Regional economy events: booms, shortages, monopolies, caravan networks, guild disputes.

- Advanced magical weather, corruption, leyline, ritual, and dimensional event families.

- Civilisation wonders, floating cities, realm colonies, megaprojects, and world restoration arcs.

- Seasonal calendars, holidays, celestial cycles, and recurring cultural events.

- Long-term historical callbacks involving survivors, descendants, memorials, grudges, debts, and restored sites.

# Appendix H. POC Success Criteria

| **Success Test**       | **Pass Condition**                                                                                                       |
|------------------------|--------------------------------------------------------------------------------------------------------------------------|
| Meaningful Need        | Watchtower quest is visibly caused by real defensive weakness and goblin pressure.                                       |
| Physical Resources     | Project consumes exact items from warehouse/project reserve.                                                             |
| Multiple Paths         | Player can gather manually or use basic automation; at least one optional preparation path exists.                       |
| NPC Agency             | NPCs build, react, defend, suffer, celebrate, mourn, and remember.                                                       |
| Event Response         | Raid timing, strength, warning, and outcome respond to project and threat state.                                         |
| Persistent Consequence | Damage, injuries, reputation, dialogue, structure state, and history survive save/load.                                  |
| Readable UI            | Player can understand current goal, known stakes, project progress, warning, and aftermath.                              |
| System Integration     | Quest touches gathering, crafting, building, NPCs, automation, magic, creatures, structures, and progression.            |
| Technical Stability    | No objective can become permanently broken through actor death, target destruction, unload, or save/load.                |
| Scope Discipline       | Full faction wars, complex dimensions, complete social simulation, and advanced procedural generation remain beyond POC. |
