**Fantasy Voxel Civilisation Sandbox**

**16 - Combat, Gear and Defence System**

**Version 0.1 - Detailed Design Bible Draft**

*A database-ready action-survival combat system for melee, ranged weapons, magic, armour, shields, status effects, injuries, stealth, enemy AI, bosses, NPC guards, fortifications, raids, siege, multiplayer, accessibility, and proof-of-concept village defence.*

Working design document - combat, equipment, threat, and civilisation defence foundation

| **Combat, Gear and Defence System Statement**                                                                                                                                                                                                                                                                                                                                                                                         |
|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Combat is not a detached minigame or a constant interruption layered over the sandbox. It is a readable action-survival layer that connects player skill, equipment, magic, NPC defence, raids, structures, laws, injuries, supplies, repairs, and world memory. Players may fight, evade, negotiate, intimidate, prepare, command, fortify, surrender, capture, conquer, or avoid threats, and the world should remember the result. |

| **Field**               | **Locked Direction**                                                                                                                                                                                                                                                                  |
|-------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Document Scope          | Full design-bible document covering combat feel, controls, resources, damage, melee, ranged weapons, magic, gear, durability, status effects, healing, stealth, AI, bosses, guards, fortifications, raids, siege, multiplayer, UI, technical architecture, registries, and POC scope. |
| Core Philosophy         | Use deep but readable action-survival combat. Player skill, preparation, gear, terrain, allies, supplies, knowledge, magic, and progression combine; no single stat or level should decide every outcome.                                                                             |
| Combat Feel             | Support first-person and third-person play, free aim, optional lock-on, light/heavy attacks, blocking, parrying, dodging, weapon-specific moves, readable animation commitment, and configurable assistance.                                                                          |
| Gear Philosophy         | Equipment uses material tier, quality, rarity, durability, repair, culture identity, runes, enchantments, modules, cosmetic variation, and specialised long-term roles. Older materials remain useful.                                                                                |
| Defence Philosophy      | Preparation changes outcomes through guards, watchtowers, walls, gates, lighting, wards, traps, ammunition, medicine, food, repair stock, scouting, diplomacy, and camp disruption.                                                                                                   |
| POC Direction           | Prove a compact Forest Hamlet raid: basic melee, bow, shield, armour, stamina, blocking, dodge, healing, apprentice magic, guard AI, watchtower, ward support, goblin roles, raid captain, damage, injuries, repairs, and persistent aftermath.                                       |
| Data Direction          | Use database/spreadsheet-ready IDs, parent definitions, actions, damage packets, equipment records, status effects, AI roles, defence structures, encounter templates, raid stages, permissions, simulation LOD, and planning status.                                                 |
| Accessibility Direction | Provide aim assistance, lock-on options, timing-window scaling, stamina support, damage settings, stronger telegraphs, simplified inputs, camera controls, reduced flashes, audio cues, optional numbers, and peaceful/custom world presets.                                          |

# Document Purpose

This document defines how combat, equipment, personal defence, NPC defence, raids, and siege work across the Fantasy Voxel Civilisation Sandbox. It translates the project's living-world promise into concrete rules for moment-to-moment fighting, weapon identity, stamina and stability, damage and resistance, gear progression, magical combat, injuries, stealth, enemy tactics, guard behaviour, fortifications, and persistent aftermath.

The system is deliberately broader than a conventional weapon list. A raid may be won through direct combat, scouting, watchtower construction, camp sabotage, guard equipment, medicine, walls, wards, negotiated tribute, evacuation, or alliance. A dungeon enemy may be defeated, bypassed, trapped, frightened, cleansed, captured, or studied. A powerful boss may be killed, healed, negotiated with, released, bound, restored, or used to shift a faction conflict when the fiction supports those outcomes.

Combat must remain a legitimate major playstyle without becoming the only meaningful way to progress. Builders, engineers, village leaders, healers, scouts, traders, mages, diplomats, and automation specialists should all be able to contribute to dangerous situations. Combat-focused players receive depth and mastery, while peaceful and support-focused players retain viable routes through world settings and systemic alternatives.

This document does not replace the Items Registry, Crafting and Recipe Registry, Magic System, Creatures and Monsters document, NPC Village System, Structures document, Races/Peoples/Cultures/Factions document, Quest and Event System, future Economy System, future Player Settlement System, future Crime and Justice System, or technical animation/network implementation plans. Instead, it defines the combat-facing, gear-facing, and defence-facing rules those systems must expose.

# Design Source

| **Source Document**                        | **Relevant Direction**                                                                                                                                                                                                                | **How This Document Uses It**                                                                                                                                                          |
|--------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 00 - Master Game Design Bible              | The game balances survival sandbox, civilisation simulation, automation, and fantasy RPG play. Difficulty ranges from peaceful cosy building to harsh civilisation survival.                                                          | Combat supports role freedom, meaningful consequences, adjustable danger, and the core hook that preparation changes living settlements.                                               |
| 01 - Core Gameplay Loop                    | The primary loop is explore -\> gather -\> craft -\> build -\> interact -\> automate -\> defend -\> upgrade -\> expand. Watchtowers improve warning, archery, and guard response.                                                     | Combat and defence are designed as one stage of a wider loop. Raids connect camps, supplies, construction, magic, and aftermath rather than acting as isolated waves.                  |
| 02 - Player Progression System             | Players use overall level, use-based skills, perks, knowledge, research, equipment, magic, reputation, and world progression without fixed classes or traditional attributes.                                                         | Combat mastery uses weapon families, defence, ranged skill, magic, healing, tactics, and leadership while allowing one character to eventually learn everything.                       |
| 03 - Blocks Registry                       | Blocks include damage states, hazards, walls, gates, towers, traps, wards, machines, repair scaffolds, and world-state evidence.                                                                                                      | Combat uses tagged structure damage, selected collapse states, fire, repair, fortification permissions, and readable material resistance rather than universal voxel destruction.      |
| 04 - Items Registry                        | Weapons, armour, tools, accessories, quality, rarity, durability, repairs, runes, monster drops, and culture goods already belong to a data-driven item foundation.                                                                   | Gear entries extend Item definitions with handling, attack profiles, coverage, defence, sockets, condition, combat tags, and equipment-load properties.                                |
| 05 - Crafting and Recipe Registry          | Recipes support visible components, repair, maintenance, magic, village supplies, culture variants, risky processes, and NPC project recipes.                                                                                         | Weapons, armour, ammunition, traps, medicine, siege equipment, repairs, enchantments, and guard-supply packages use shared recipe and project structures.                              |
| 06 - Resource Progression                  | The material ladder is Wood -\> Stone -\> Copper -\> Iron -\> Steel -\> Mana Crystal -\> Arcane Alloy -\> Mythril -\> Voidstone -\> Celestial Metal, with Bronze, Silver, Gold, gems, fibre, leather, cloth, and other side branches. | Combat tiers follow this ladder without making every later material a simple damage increase. Materials gain distinct handling, resistance, magic, repair, culture, and defence roles. |
| 07 - NPC Village System                    | Named NPCs have skills, inventories, tools, guard equipment, injuries, schedules, morale, permanent death, raids, repairs, warehouses, and reputation.                                                                                | Guards consume real weapons, armour, ammunition, food, medicine, and repair stock. Casualties, injuries, mourning, rebuilding, fear, and settlement history persist.                   |
| 08 - Automation System                     | Automation supplies warehouses, projects, guards, repairs, ammunition, wards, and trade. Routine monsters should not randomly grief factories, while raiders, siege forces, sabotage, and major events may target infrastructure.     | Defence can be supplied automatically after permission. Enemy objectives identify strategic machines and routes only when faction, raid, or event logic supports it.                   |
| 09 - Magic System                          | Magic uses mana, focuses, loadouts, schools, runes, wards, status effects, infrastructure, counterplay, friendly-fire settings, and world consequences.                                                                               | Combat magic supports damage, control, protection, support, terrain interactions, spellblades, counterspells, wards, and social responses without replacing mundane gear.              |
| 10 - Creatures and Monsters                | Creatures have roles, senses, morale, weak points, drops, faction logic, camp sources, boss phases, village interaction, and POC goblin/cave/wisp threats.                                                                            | Enemy actions inherit creature and faction data. Combat defines how roles attack, defend, surrender, damage structures, use terrain, and react to gear, wards, and status effects.     |
| 11 - Biomes and World Generation           | Danger depends on biome, depth, time, weather, corruption, structures, territory, and events. The POC uses a compact valley with a hamlet, cave, ruin, river, and goblin camp.                                                        | Terrain, weather, visibility, routes, light, wind, hazards, and buildable defence positions influence combat without making procedural terrain unfair or unreadable.                   |
| 12 - Structures                            | Camps generate raid pressure; watchtowers, roads, gates, warehouses, shrines, bridges, and ruins have ownership, damage, repair, occupation, and restoration states.                                                                  | Combat can change structures through tagged damage, capture, sabotage, defence, occupation, repair, and conversion. Camps expose supplies and objectives before raids.                 |
| 13 - Races, Peoples, Cultures and Factions | Culture and faction are separate from ancestry. The POC uses Riverward Frontier Folk and the Briarhook Clan as working culture/faction profiles, with motives, laws, visual identity, supplies, and possible non-combat outcomes.     | Weapons, armour, formations, surrender rules, guard law, intimidation, banners, tactics, and raid objectives reflect culture and faction rather than biological morality.              |
| 14 - Dimensions                            | Realms introduce survival conditions, specialised equipment, native factions, bosses, materials, hazards, portals, and military logistics without invalidating Overworld systems.                                                     | Dimension combat extends the same foundation through realm resistances, movement, stabilisation gear, environmental hazards, specialised enemies, and portal defence.                  |
| 15 - Quest and Event System                | The Forest Hamlet Watchtower Arc uses need discovery, real supply, rune support, threat intelligence, preparation, a graded goblin raid, persistent damage, casualties, reputation, and follow-up hooks.                              | The Combat POC is the execution layer for that arc. Raid objectives, capture, surrender, repair, contribution, and aftermath must expose clear quest and event state.                  |

# Static Table of Contents

- 1\. Locked Combat, Gear and Defence Identity

- 2\. Player Answer Decision Summary

- 3\. Combat System Architecture

- 4\. Parent Combat, Gear, Defence and Runtime Data Model

- 5\. Combat Categories, Families and Tags

- 6\. Perspective, Inputs, Combat State and Feedback

- 7\. Health, Stamina, Mana, Stability and Equipment Load

- 8\. Damage, Armour, Resistance, Criticals and Weak Points

- 9\. Melee Weapons, Movesets and Mastery

- 10\. Ranged Weapons, Ammunition and Projectiles

- 11\. Combat Magic, Wards and Hybrid Equipment

- 12\. Gear Slots, Armour Classes, Shields and Accessories

- 13\. Durability, Repair, Upgrades, Enchanting and Curses

- 14\. Status Effects, Injuries, Healing, Downing and Death

- 15\. Stealth, Detection, Crime, Surrender and Capture

- 16\. Enemy AI, Roles, Morale, Coordination and Structure Targets

- 17\. Elites, Bosses, Arenas and Major Threats

- 18\. NPC Guards, Militia, Formations and Player Orders

- 19\. Village Defences, Fortifications, Traps and Siege

- 20\. Raids, Warning, Objectives, Outcomes and Aftermath

- 21\. Multiplayer, PvP, Contribution and Permissions

- 22\. Difficulty, Accessibility and World Settings

- 23\. Combat UI, Readability, Codex and Player Feedback

- 24\. Technical Architecture, Simulation LOD, Modding and Debugging

- 25\. Proof-of-Concept Combat and Defence Scope

- 26\. Detailed Combat Action Registry v0.1

- 27\. Detailed Gear Registry v0.1

- 28\. Detailed Defence and Raid Registry v0.1

- 29\. Detailed Status and Injury Registry v0.1

- 30\. Core POC Scenario: Forest Hamlet Defence

- 31\. Balancing and Pacing Rules

- 32\. Open Questions for Later Documents

- Appendix A. POC Combat and Defence Checklist

- Appendix B. Combat Action and Damage Database Templates

- Appendix C. Weapon, Armour and Gear Database Templates

- Appendix D. Defence, Encounter and Raid Database Templates

- Appendix E. Damage, Status and Counter Tag Library

- Appendix F. Cross-System Use Matrix

- Appendix G. Player Answer Lock 1-220

- Appendix H. Future Combat, Gear and Defence Backlog

- Appendix I. POC Success Criteria

# 1. Locked Combat, Gear and Defence Identity

The Combat, Gear and Defence System is the personal danger and civilisation protection layer of the game. It governs how players, NPCs, creatures, factions, structures, equipment, magic, supplies, and terrain interact when conflict becomes physical. The system must feel tactile and readable at close range while scaling into village raids, faction warfare, boss encounters, siege, and dimensional threats.

| **Locked Rule**                                                                                                                                                                                                                                                                                                 |
|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Combat should never be reduced to trading health bars, and defence should never be reduced to a single wall statistic. Every major feature should answer at least one question: what can the player read, prepare, counter, protect, supply, repair, command, capture, avoid, negotiate, or permanently change? |

| **Identity Layer**   | **Design Meaning**                                                                                                                                        | **Player-Facing Result**                                                                       |
|----------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------|
| Player Agency        | Melee, ranged, magic, stealth, support, command, escape, surrender, capture, diplomacy, traps, and preparation are legitimate approaches.                 | Players can express a combat-focused identity without every other playstyle becoming inferior. |
| Readable Action      | Attacks, defence, status effects, weak points, terrain hazards, guard breaks, and enemy objectives use strong audiovisual tells.                          | Failure feels understandable and improvement feels learnable rather than arbitrary.            |
| Equipment Craft      | Weapons, armour, shields, ammunition, medicine, tools, runes, and accessories are physical items with material, quality, condition, culture, and history. | Gathering, crafting, trade, loot, NPC specialists, and repair remain connected to combat.      |
| Magic Hybrid         | Magic supports damage, control, healing, wards, counterplay, mobility, infrastructure, and hybrid weapons.                                                | Mages and non-mages remain viable, while magical infrastructure matters to villages and raids. |
| Civilisation Defence | Guards, towers, walls, gates, traps, wards, supplies, warning systems, repairs, morale, and civilian safety change settlement outcomes.                   | The player sees factories, villages, and construction become real strategic power.             |
| Social Consequence   | Weapons drawn in public, forbidden spells, killing, capture, surrender, theft, conquest, rescue, and collateral damage affect laws and reputation.        | Combat remains part of a living political world rather than a consequence-free arena.          |
| Scalable Simulation  | Nearby combat uses detailed hit, projectile, supply, injury, and structure states. Distant battles use abstract force and resource summaries.             | Large worlds and faction conflicts remain feasible without sacrificing local detail.           |
| Accessible Depth     | Assistance and difficulty settings change aim, timing, resource pressure, damage, telegraphs, camera, and consequences without removing core systems.     | Players can choose cosy, standard, tactical, harsh, or customised danger.                      |

## 1.1 Combat Design Promise

A player should be able to look at a threat and make useful decisions before the first strike. Silhouette, equipment, stance, formation, sound, tracks, camp state, spell effects, terrain, weather, faction banners, and nearby structures should reveal likely roles and objectives. During a fight, players should understand why an attack hit, why a block failed, which resistance mattered, what status is building, whether an enemy is panicking, and what object or person the attackers are targeting.

## 1.2 Defence Design Promise

A defended settlement should visibly fight better than an unprepared one. A completed watchtower should improve warning and ranged coverage. An armory should place better gear in guard hands. Food and medicine should extend endurance and recovery. Walls and gates should redirect attackers. Wards should reveal or weaken matching threats. An exposed warehouse, broken bridge, empty ammunition crate, or damaged gate should create readable vulnerabilities.

## 1.3 What the System Is Not

- Not a mandatory combat treadmill that forces peaceful builders to fight constantly.

- Not a pure Soulslike, shooter, MMO, colony battle simulator, or competitive PvP system copied without adapting it to voxel survival and living villages.

- Not a random-stat loot shower where rarity automatically invalidates crafted, cultural, or older equipment.

- Not universal block destruction where ordinary attacks erase buildings or factories without counterplay.

- Not a full medical simulator, full limb model, or realistic physics system that overwhelms readable play.

- Not a POC requirement to implement mass war, mounted combat, naval combat, all weapon families, every status effect, or final siege engineering.

# 2. Player Answer Decision Summary

All 220 questionnaire answers were selected as E, locking the broad hybrid direction. The system therefore aims for deep but readable combat, systemic alternatives, strong gear identity, civilisation-scale defence, persistent consequences, and extensive world settings. The table consolidates the answers into implementation rules rather than repeating every question verbatim.

| **Area**                 | **Locked Decision**                                                                                                                                                                                                                              |
|--------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Scope and Identity       | Full combat, gear, NPC defence, raids, siege, progression, UI, data architecture, and POC scope. Combat is contextual, purposeful, world-connected, and avoidable through appropriate systems.                                                   |
| Balance Philosophy       | Game feel and readability first. Outcomes combine player skill, equipment, preparation, terrain, allies, supplies, knowledge, progression, and difficulty rather than level or raw stats alone.                                                  |
| Perspective and Controls | First-person and third-person support, free aim, optional soft/hard lock-on, light/heavy attacks, block, parry, dodge, contextual actions, weapon abilities, short input buffering, and limited cancellation.                                    |
| Combat Feedback          | Animation, sound, particles, hit-stop, material response, controller feedback, optional damage numbers, readable hit volumes, mild aim correction, and social weapon-ready states.                                                               |
| Player Resources         | Health, stamina, mana, stability, and equipment load are separate. Stamina focuses on sprinting and combat. Hunger and temperature affect endurance and recovery rather than producing constant combat penalties.                                |
| Damage Model             | Slash, pierce, blunt, impact, siege, elemental, spirit, shadow, corruption, and void tags. Hybrid armour reduction, penetration, coverage, weak points, earned criticals, status buildup, and diminishing resistance returns.                    |
| Melee                    | Broad weapon families with distinct reach, speed, stamina, stability, structure, formation, stealth, and magic roles. Movesets use light/heavy branches, sprint/jump/context actions, limited dual wielding, and family mastery.                 |
| Ranged                   | Bows, crossbows, slings, thrown weapons, siege weapons, cultural launchers, and rare magitech ranged gear. Physical ammunition, quivers, recovery, trajectories, movement accuracy, specialised payloads, and supply-aware NPCs.                 |
| Combat Magic             | Damage, control, defence, support, counters, terrain interaction, wards, hybrid weapons, focuses, loadouts, casting movement, interruption, charge/channel rules, friendly-fire controls, and cultural/legal consequences.                       |
| Equipment                | Detailed slots, light/medium/heavy/robe/work/environmental classes, shield families, functional cloaks, backpacks, quivers, belts, accessories, material tiers, rarity, quality, durability, sockets, curses, dyes, and transmog safeguards.     |
| Status and Healing       | Source-specific buildup, limited elemental interactions, injuries on severe events, readable treatment categories, food preparation, potions, poultices, spells, downed multiplayer states, tombstone recovery, and persistent NPC wounds/death. |
| Stealth and Law          | Detection uses light, sound, movement, cover, weather, scent/tracks where relevant, magic, reputation, disguise, and faction senses. Drawing weapons, forbidden magic, surrender, capture, witnesses, and collateral damage affect response.     |
| Enemy AI                 | Role-driven behaviour, perception, cover, coordination, morale, surrender, retreat, target priorities, structure objectives, limited adaptation, elite traits, readable commanders, and detailed-near/abstract-far simulation.                   |
| Bosses                   | Contextual multi-phase encounters with weak points, components, terrain, preparation, alternative resolutions, multiplayer scaling, and persistent world outcomes rather than larger health bars only.                                           |
| NPC Defence              | Equipment- and supply-driven guards, formations, posts, morale, leadership, contextual player orders, civilians with shelters/emergency jobs, injuries, repair labour, and watchtower integration.                                               |
| Fortifications and Siege | Walls, gates, towers, traps, alarms, wards, turrets, siege engines, tagged structure damage, limited collapse, fire response, exact repair resources, and objective-driven raid phases.                                                          |
| Raids and Aftermath      | Scouts, warnings, preparation windows, supply-based attackers, camp disruption, multiple objectives, graded outcomes, capture/retreat, damage, casualties, repair, mourning, rewards, reputation, and future retaliation or diplomacy.           |
| Multiplayer and PvP      | World-setting-controlled PvP, contribution beyond damage, revive support, shared and individual reputation, friendly-fire settings, ownership/permissions, latency tolerance, and server-authoritative outcomes.                                 |
| Accessibility            | Aim assist, lock-on, timing windows, stamina support, damage scaling, stronger telegraphs, camera options, reduced flashes, audio cues, simplified inputs, optional numbers, and peaceful/custom presets.                                        |
| POC                      | A small functional vertical slice proving sword/spear, bow, shield, leather armour, healing, apprentice magic, stamina, block/dodge, status, guards, watchtower, ward, goblin roles, raid captain, repairs, and a changed village outcome.       |

# 3. Combat System Architecture

The combat system should be data-driven from the beginning. The player sees weapons, armour, attacks, spells, guards, enemies, structures, and raid warnings. Internally, combat is assembled from linked definitions rather than one monolithic character class. An Iron Arming Sword references a weapon family, material profile, moveset, damage profile, repair recipe, animation set, quality rules, and item record. A Briarhook Raider references a creature profile, faction, AI role, equipment loadout, senses, morale, objectives, and encounter state.

| **Layer**             | **Purpose**                                                                               | **Examples**                                                                                       |
|-----------------------|-------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------|
| Base Combat Actor     | Shared combat properties for players, NPCs, creatures, constructs, and bosses.            | Health, stamina/mana support, stability, movement, resistances, faction, senses, status container. |
| Combat Action         | A player- or AI-triggered action with timing and costs.                                   | Light strike, heavy thrust, block, dodge, bow draw, heal, rally, shield bash.                      |
| Attack Profile        | Defines hit generation and damage delivery.                                               | Damage packet, reach, arc, projectile, hit count, knockback, weak-point rules, structure tags.     |
| Defence Profile       | Defines blocks, parries, barriers, armour, evasion, and counter windows.                  | Coverage, angle, stability, stamina cost, resist tags, perfect timing, penetration response.       |
| Equipment Record      | Extends the Items Registry for combat use.                                                | Weapon family, armour class, slot, load, durability, sockets, quality, rarity, culture, repair.    |
| Moveset               | Links inputs and AI intents to actions.                                                   | Idle, ready, light chain, heavy branch, sprint attack, parry response, two-hand stance.            |
| Damage Packet         | Runtime payload produced by an attack or hazard.                                          | Source, amount, types, penetration, buildup, impulse, ownership, friendly-fire, structure flags.   |
| Status Definition     | Persistent or threshold-based combat condition.                                           | Burn, bleed, shock, poisoned, staggered, warded, inspired, corrupted, fractured.                   |
| Projectile Definition | Physical or magical travelling attack.                                                    | Speed, gravity, drag, collision, recovery, penetration, payload, lifetime, visual and audio.       |
| AI Combat Role        | Tactical intent and decision weights.                                                     | Skirmisher, shield bearer, archer, support, caster, sapper, commander, healer, siege operator.     |
| Encounter Template    | Local battle composition and objective logic.                                             | Patrol, ambush, cave pack, camp defence, boss arena, escort attack, ritual disruption.             |
| Raid Definition       | Settlement-scale event with warning, phases, objectives, forces, resources, and outcomes. | Scout phase, approach, breach, theft, captain arrival, retreat, occupation, aftermath.             |
| Defence Structure     | Combat-facing extension of a block/structure.                                             | Watchtower, gate, wall, barricade, trap, ward, turret, armory, shelter, alarm bell.                |
| Runtime Combat State  | Mutable save or replication state.                                                        | Current health, stamina, guard, active action, status meters, aggro, injuries, ammunition, damage. |
| Planning Metadata     | Documentation-only fields.                                                                | POC Required, Alpha, Beta, Final Game, Placeholder, Deferred, owner document, balance status.      |

| **Data separation rule:** Static definitions describe what an action, weapon, status, or raid can do. Runtime records describe what is happening in the current save. Planning labels must not be inherited as shipped gameplay properties. |
|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

# 4. Parent Combat, Gear, Defence and Runtime Data Model

| **Parent Class / Record** | **Controls**                                                                                                       | **Example Children / Use**                                             |
|---------------------------|--------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------|
| CombatActorDefinition     | Identity, faction, base resources, movement support, senses, resistance profile, status immunity tags.             | Player, villager guard, goblin raider, cave spider, wisp, golem, boss. |
| CombatActorRuntime        | Current resources, active action, target, statuses, injuries, equipment state, morale, alertness, command state.   | Save/replication state for one actor.                                  |
| ActionDefinition          | Input/AI trigger, phases, stamina/mana/item costs, movement modifiers, cancel windows, cooldown, animation events. | Sword light attack, dodge step, poultice use.                          |
| AttackDefinition          | Hit shape, timing, damage profile, impulse, weak-point support, friendly fire, block/terrain rules.                | Spear thrust, axe sweep, fire bolt.                                    |
| WeaponDefinition          | Item link, family, grip, moveset, handling, base attack profiles, load, range, durability, repair, sockets.        | Iron Arming Sword, Hunter Bow.                                         |
| ArmourDefinition          | Item link, slot, class, coverage, armour values, resistances, stability, movement/noise/mana modifiers, condition. | Riverward Leather Tunic, Iron Guard Helm.                              |
| ShieldDefinition          | Coverage, block angle, stability, parry, bash, projectile rules, movement, durability, culture style.              | Wooden Heater Shield, Rune Buckler.                                    |
| AccessoryDefinition       | Slot, passive/active effects, conditions, charges, attunement, social identity, repair or recharge.                | Ward Token, Mana Charm, Guard Badge.                                   |
| StatusEffectDefinition    | Application tags, buildup, threshold, stack model, duration, periodic effects, visuals, counters, immunity.        | Burning, Bleeding, Inspired.                                           |
| InjuryDefinition          | Trigger severity, category, penalties, treatment, recovery, persistence, NPC work effects.                         | Fractured, Severe Burn, Deep Wound.                                    |
| ProjectileDefinition      | Trajectory, collision, penetration, embed/recovery, payload, source ownership, replication policy.                 | Arrow, bolt, thrown axe, mana bolt.                                    |
| AICombatRoleDefinition    | Range preference, target weights, cover, formation, morale, support, retreat, objective behaviour.                 | Raider Skirmisher, Guard Archer.                                       |
| FormationDefinition       | Slots, spacing, leader, movement, weapon requirements, morale and visibility effects.                              | Shield line, spear brace, tower firing team.                           |
| DefenceDefinition         | Block/structure link, defence role, health/state, operators, supply inputs, coverage, warning, attack actions.     | Watchtower, palisade, ward lantern.                                    |
| EncounterDefinition       | Actors, spawn/arrival, objectives, terrain anchors, rewards, failure, escalation, compatibility.                   | Goblin patrol, wisp disturbance.                                       |
| RaidDefinition            | Faction, origin camp, intelligence, warning, phases, force budget, objectives, routes, supply state, outcomes.     | Briarhook Watchtower Raid.                                             |
| DamagePacketRuntime       | Amount, type tags, penetration, status buildup, impulse, source, target, hit location, structure flag.             | One resolved hit event.                                                |
| CombatContributionRuntime | Damage, healing, blocking, scouting, supplies, repairs, command, rescue, objectives, construction.                 | Quest rewards and multiplayer credit.                                  |

## 4.1 Runtime Resolution Order

1\. Validate action ownership, equipment, costs, permissions, cooldown, and actor state.

2\. Enter action phases: startup, active, recovery, channel, or hold as defined.

3\. Generate hit volume, projectile, field, interaction, or support target.

4\. Validate target faction, friendly-fire setting, ownership, line of sight, block state, and invulnerability rules.

5\. Build the damage or effect packet with source, tags, penetration, impulse, buildup, and contribution data.

6\. Resolve parry, dodge, barrier, block, armour, resistance, weak point, critical opening, stability, and health effects.

7\. Apply statuses, injuries, knockback, structure damage, sounds, alerts, witnesses, reputation hooks, and AI reactions.

8\. Update durability, ammunition, mana/stamina, combat logs, quest/event state, and network replication.

9\. Resolve defeat, downed, surrender, capture, death, loot, retreat, objective state, or encounter transition.

# 5. Combat Categories, Families and Tags

| **Category** | **Subcategories**                                                      | **Example Tags / IDs**                                  |
|--------------|------------------------------------------------------------------------|---------------------------------------------------------|
| Action       | Attack, defence, movement, utility, healing, command, interaction.     | light_attack, parry, dodge, bandage, rally, surrender   |
| Weapon       | Melee, ranged, thrown, magic focus, hybrid, siege, tool-weapon.        | sword, spear, bow, staff, sling, ballista               |
| Armour       | Light, medium, heavy, robe, workwear, environmental, ritual.           | leather, mail, plate, mage_robe, heat_suit              |
| Damage       | Physical, elemental, magical, environmental, structure, non-lethal.    | slash, pierce, blunt, fire, spirit, siege, fatigue      |
| Defence      | Block, parry, barrier, dodge, armour, cover, ward, fortification.      | shield_block, perfect_parry, stone_wall, anti_wisp_ward |
| Status       | Damage-over-time, control, debuff, buff, injury, morality/corruption.  | burn, shock, rooted, inspired, fractured, corrupted     |
| AI Role      | Frontline, ranged, support, control, siege, command, retreat.          | shieldbearer, archer, sapper, healer, captain           |
| Encounter    | Patrol, ambush, raid, siege, boss, hunt, rescue, duel, arrest.         | camp_scouts, cave_pack, watchtower_raid                 |
| Objective    | Kill, capture, steal, breach, protect, escort, disrupt, survive, flee. | warehouse_theft, gate_breach, civilian_rescue           |
| Environment  | Terrain, weather, light, height, cover, fluid, hazard, realm.          | mud, rain, darkness, tower, smoke, void_exposure        |

## 5.1 Required Tag Families

| **Tag Family**   | **Examples**                                                                                         |
|------------------|------------------------------------------------------------------------------------------------------|
| Material         | wood, stone, bronze, iron, steel, silver, mana_crystal, arcane_alloy, mythril, voidstone, celestial  |
| Weapon handling  | one_handed, two_handed, dual_compatible, reach_short, reach_long, heavy, precise, braceable, mounted |
| Attack shape     | thrust, sweep, overhead, projectile, beam, cone, area, ground_target, shockwave, contact             |
| Defence response | blockable, parryable, dodgeable, guard_break, unblockable, projectile, magical, siege, environmental |
| Target anatomy   | humanoid, beast, chitin, armour_plate, construct, spirit, undead, flying, large, weak_core           |
| Structure        | soft_cover, door, gate, wall, glass, rope, machine, ward, bridge, tower, siege_target, protected     |
| Social/legal     | civilian, guard, outlaw, surrendering, prisoner, forbidden_magic, witnessed, trespass, war_target    |
| Simulation       | near_detail, distant_abstract, server_authority, client_predict, persistent, temporary, POC_required |

# 6. Perspective, Inputs, Combat State and Feedback

Combat supports both first-person and third-person play without creating two separate rule sets. Hit timing, reach, costs, damage, status application, and defensive windows remain consistent; cameras, animation presentation, targeting assistance, and field of view adapt to the selected perspective. Free aim is always viable, while optional soft and hard lock-on can assist controller users, accessibility needs, boss encounters, and close third-person combat.

| **Area**          | **Locked Rule**                                                                                                              | **Player-Facing Result**                                                                       |
|-------------------|------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------|
| Perspective       | Full first-person and third-person support with one shared simulation.                                                       | Players can choose their preferred view without gaining fundamentally different combat rules.  |
| Combat state      | No hard combat mode. Drawing a weapon, receiving a threat, blocking, aiming, or using a combat action transitions naturally. | Building and exploration remain fluid; the player is not trapped inside a separate arena mode. |
| Basic inputs      | Light attack, heavy attack, block/alternate use, dodge, contextual action, aim, quick item, ability, and weapon swap.        | The input vocabulary is readable while movesets provide depth.                                 |
| Action phases     | Startup, active, recovery, hold/channel, and optional follow-up windows.                                                     | Attacks feel committed enough to read without becoming sluggish.                               |
| Movement          | Attack movement, turn rate, sprint attacks, crouch actions, jump/plunge actions, and momentum vary by family.                | A dagger, spear, hammer, bow, and staff feel physically distinct.                              |
| Target assistance | Optional aim correction, soft lock, hard lock, projectile lead assistance, and target cycling.                               | Accessibility improves without removing free aiming or manual positioning.                     |
| Input buffering   | Short configurable buffers for attacks, defence, item use, and abilities.                                                    | Inputs feel responsive under animation timing and latency.                                     |
| Cancellation      | Limited by action phase, family, perks, stamina, and accessibility settings.                                                 | Players can recover from readable situations but cannot erase every commitment.                |
| Terrain collision | Large weapons and confined spaces use limited collision/deflection rules.                                                    | Tight voxel interiors matter without making normal combat frustrating.                         |
| Weapon states     | Idle, carried, sheathed, ready, aiming, guarding, disabled, and broken.                                                      | Animation, first-strike timing, NPC reactions, and social laws can respond to posture.         |
| Social reaction   | Drawing, aiming, casting, or threatening can trigger warnings, fear, guards, surrender, or intimidation.                     | Combat posture is part of the living social world.                                             |
| Feedback          | Impact sound, material sound, particles, animation response, hit-stop, vibration, optional numbers, and UI states.           | Hits are readable through multiple senses and configurable presentation.                       |

## 6.1 Core Input Map

| **Input Intent**          | **Default Behaviour**                                   | **Contextual Variants**                                                   |
|---------------------------|---------------------------------------------------------|---------------------------------------------------------------------------|
| Primary attack            | Light attack or quick ranged release.                   | Combo branch, tool strike, staff cast, mounted strike, siege fire.        |
| Secondary attack          | Heavy attack, aim, or family alternate.                 | Charged strike, precision thrust, bow draw, shield bash, rune channel.    |
| Guard / alternate use     | Block or defensive stance.                              | Parry, brace, focus barrier, off-hand tool, two-hand toggle.              |
| Dodge / evade             | Load-dependent step, roll, dash, or magical evade.      | Perfect-evade window, mounted evade, aerial correction.                   |
| Context action            | Interact with target or environment.                    | Backstab, finisher, rescue, arrest, revive, disarm trap, operate defence. |
| Quick item                | Uses selected belt or utility item.                     | Potion, poultice, bomb, food ration, ammunition swap, repair kit.         |
| Ability                   | Uses equipped weapon, school, perk, or command ability. | Rally, spell, formation order, weapon art, ward pulse.                    |
| Swap / stance             | Changes weapon set, ammunition, grip, or spell loadout. | Two-hand, dual wield, shield ready, staff focus, tool mode.               |
| Surrender / command wheel | Opens social/tactical options when valid.               | Yield, intimidate, order retreat, hold position, protect civilians.       |

## 6.2 Responsiveness and Animation Rules

- Hit volumes closely match the visible weapon path, with small tolerances for latency, camera perspective, accessibility, and very fast targets.

- Light actions have shorter startup and recovery. Heavy actions have stronger commitment, stability damage, reach, or special properties.

- Authoritative damage events are emitted from explicit animation markers or deterministic action timing rather than arbitrary visual frames.

- Subtle hit-stop is used for strong impacts, guard breaks, critical openings, armour breaks, and boss components; it is reduced or disabled through settings.

- Players may queue one short follow-up action. The queue clears when the action becomes invalid, the actor is staggered, or the player deliberately changes intent.

- Camera shake, flashes, chromatic effects, vibration, and floating damage numbers are individually configurable.

# 7. Health, Stamina, Mana, Stability and Equipment Load

Combat resources are deliberately separated. Health represents broad survivability; stamina pays for physical exertion and defensive timing; mana pays for personal spellcasting and selected magical equipment; stability determines resistance to stagger and guard break; equipment load changes mobility rather than replacing the slot-based inventory. This supports non-mage, mage, lightly equipped, heavily armoured, builder-support, and guard-command playstyles without traditional Strength or Agility attributes.

| **Resource**   | **Primary Use**                                                                                          | **Recovery and Modifiers**                                                                                                                         | **Failure State**                                                                                                                         |
|----------------|----------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------|
| Health         | Surviving damage, hazards, injuries, and defeat.                                                         | Modest growth through level, perks, blessings, food quality, gear, and special progression. Healing uses items, magic, rest, NPCs, and structures. | At zero: death or configured downed state; NPCs may surrender, fall, or die depending on role and rules.                                  |
| Stamina        | Sprinting, attacks, dodges, blocks on impact, climbing/swimming strain, and selected physical abilities. | Regenerates after a short delay; movement, guarding, load, hunger, temperature, injury, food, perks, and gear modify recovery.                     | Emergency weak actions remain possible, but strong attacks, sprinting, perfect defence, and rapid recovery are restricted.                |
| Mana           | Spells, barriers, magical weapon abilities, active enchantments, and personal magical support.           | Slow natural recovery, improved by rest, meals, gear, shrines, mage support, potions, batteries, and environment.                                  | Low mana disables or weakens costly magic; overcasting may use health, corruption, catalysts, or exhaustion only when explicitly allowed. |
| Stability      | Resistance to stagger, knockback, guard break, interruption, and some knockdowns.                        | Armour, shield, stance, weapon, formation, perks, morale, terrain, and buffs modify current and maximum stability.                                 | Break causes contextual flinch, stagger, guard break, knockback, knockdown, disarm risk, or critical opening.                             |
| Equipment load | Total worn/carried combat equipment, not the entire slot inventory.                                      | Load bands use item mass class, armour, backpack, shield, quiver, tools, and magical compensation.                                                 | Heavier bands reduce dodge, acceleration, stamina recovery, climbing/swimming, stealth, and mana efficiency while improving stability.    |
| Barrier / ward | Temporary magical protection separate from health and armour.                                            | Recharged by mana, ward sources, time, active channel, or infrastructure depending on type.                                                        | When depleted it collapses, may trigger cooldown or stability loss, and can expose the protected target or area.                          |
| Morale         | AI and settlement combat confidence; players receive feedback rather than forced loss of control.        | Leadership, casualties, supplies, formation, shelter, victory, fear effects, commanders, and culture change morale.                                | NPCs may flee, surrender, panic, frenzy, regroup, or become inspired.                                                                     |

## 7.1 Default Resource Behaviour

| **Rule**              | **Locked Direction**                                                                                                                        |
|-----------------------|---------------------------------------------------------------------------------------------------------------------------------------------|
| Walking and gathering | Normal walking and basic gathering do not drain stamina by default. Only strenuous, combat, traversal, or harsh-setting actions do.         |
| Stamina floor         | At zero stamina, the actor is not helpless. Weak attacks, basic walking, and emergency guard attempts remain, but carry clear penalties.    |
| Block cost            | Blocking reserves little or no stamina per second; impact cost depends on attack force, angle, shield/weapon, skill, and defence quality.   |
| Exhaustion            | Repeated full depletion, injuries, extreme travel, rituals, hunger, temperature, or special enemy effects can create temporary exhaustion.  |
| Mana-stamina hybrids  | Resources remain distinct. Specific battle-mage, monk, ritual, or magitech actions may exchange or jointly consume them.                    |
| Health regeneration   | No fast universal combat regeneration. Recovery is slow or conditional unless supported by gear, blessing, spell, food, or a world setting. |
| Equipment-load bands  | Suggested bands: Unburdened, Light, Standard, Heavy, Overloaded. Exact thresholds are derived from equipped item load values.               |
| POC defaults          | Player draft baseline: 100 Health, 100 Stamina, 60 Mana, 100 Stability reference scale before equipment and effects.                        |

## 7.2 Equipment Load Effects

| **Band**   | **Mobility**                                                        | **Defence / Stability**                              | **Other Effects**                                                                                |
|------------|---------------------------------------------------------------------|------------------------------------------------------|--------------------------------------------------------------------------------------------------|
| Unburdened | Fast step/dash, strongest acceleration, easiest climbing/swimming.  | Lowest passive stability and physical protection.    | Quiet, efficient casting, vulnerable to knockback.                                               |
| Light      | Long dodge, fast recovery, strong stealth and ranged mobility.      | Low-moderate stability.                              | Good scouting, climbing, temperature comfort.                                                    |
| Standard   | Balanced step/roll, baseline recovery.                              | Moderate stability and broad gear flexibility.       | Default target for mixed builds.                                                                 |
| Heavy      | Shorter/slower dodge, reduced acceleration and recovery.            | High stability, block support, knockback resistance. | Louder, harder swimming/climbing, some casting inefficiency.                                     |
| Overloaded | No normal dodge; slow movement and severe stamina recovery penalty. | High static mass but poor combat readiness.          | Warning state intended for hauling, not a viable permanent combat build without special support. |

# 8. Damage, Armour, Resistances, Criticals and Weak Points

Damage resolution must be expressive enough to distinguish weapon families, armour, magical schools, structures, creatures, and realm hazards, but readable enough that players can predict outcomes. The UI shows concise attack, defence, penetration, resistance, status, and stability information; training targets and codex pages can expose expanded breakdowns.

| **Damage Family** | **Core Types**                                                  | **Typical Strengths / Targets**                                                                                                                          | **Typical Counters**                                                                    |
|-------------------|-----------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------|
| Physical          | Slash, pierce, blunt, impact.                                   | Slash against unarmoured flesh and fibres; pierce against gaps/precision; blunt against armour, bone, chitin, and stability; impact for falls and force. | Armour material, coverage, shield, angle, stability, mobility.                          |
| Elemental         | Fire, frost/chill, lightning, earth/force, wind, water, nature. | Environment interaction, creature weakness, control, terrain/hazard creation.                                                                            | Resistant gear, shelter, wards, grounding, drying, warming, cleansing.                  |
| Spirit / divine   | Spirit, radiant, sanctified, soul pressure.                     | Undead, curses, spirits, corruption, morale support.                                                                                                     | Spirit wards, culture protections, shadow resistance, line-of-effect rules.             |
| Shadow / blood    | Shadow, curse, life-drain, blood catalyst.                      | Stealth, debilitation, sacrifice, forbidden effects.                                                                                                     | Cleansing, silver, divine wards, law/reputation consequences.                           |
| Corruption / void | Corruption, void, instability, dimensional shear.               | Realm beings, barriers, structures, long-term status and world-state effects.                                                                            | Stabilisation, warding, purity, specialised dimension gear, cleansing.                  |
| Siege / structure | Siege, breaching, cutting, burning, mining, overload.           | Tagged walls, gates, machines, wards, bridges, siege components.                                                                                         | Material hardness, reinforcement, repair, fireproofing, warding, protected-block rules. |
| Non-lethal        | Fatigue, restraint, stun, morale pressure, training damage.     | Capture, arrest, duels, animal handling, riot control, surrender.                                                                                        | Resolve, armour, stability, escape tools, allies.                                       |

## 8.1 Damage Resolution

1\. Confirm the attack hit, projectile collision, area overlap, hazard contact, or support target.

2\. Resolve dodge, invulnerability window, cover, barrier, shield angle, parry, and special negation in that order where applicable.

3\. Build raw damage by action profile, weapon/material/quality, skill/mastery, effects, charge, range, weak point, and situational modifiers.

4\. Apply penetration against armour, shield, barrier, and material-specific resistance. Penetration never makes every defence irrelevant.

5\. Apply armour and resistance with diminishing returns. Coverage is simplified for routine attacks; explicitly aimed, weak-point, boss, or special attacks can target slots/components.

6\. Apply health damage, stability damage, status buildup, impulse, injury check, durability damage, structure state change, and contribution credit.

7\. Generate readable feedback and log the key reasons for unusually high, low, blocked, immune, or critical results.

| **Draft formula direction:** Use a hybrid armour model rather than a single flat or percentage rule. A possible implementation is: effective armour = relevant armour x coverage x condition; mitigated damage uses a diminishing-return curve against attack power, after penetration. Exact coefficients remain a balancing task and must be tested against POC time-to-defeat targets. |
|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

## 8.2 Critical Openings

| **Opening**           | **How It Is Earned**                                                                                                       | **Effect**                                                                                               |
|-----------------------|----------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------|
| Weak point            | Precise hit to a marked or physically readable component, exposed area, head, core, joint, rune, eye, wing, or armour gap. | Higher damage, penetration, status, component damage, or unique reaction.                                |
| Stagger opening       | Stability is broken by pressure, parry, heavy strike, shield bash, explosive, formation, or terrain.                       | Contextual critical attack, disarm, knockdown, capture, or interruption.                                 |
| Unaware strike        | Target has not detected the attacker and is eligible.                                                                      | Precision/critical bonus; not an automatic kill against armoured, large, magical, or boss targets.       |
| Back attack           | Eligible target is struck from a vulnerable rear arc or during recovery.                                                   | Moderate positional bonus; contextual backstab only when anatomy and weapon allow.                       |
| Elemental state       | Target is wet, frozen/brittle, burning, grounded, corrupted, exposed, or marked.                                           | Limited readable interaction rather than unrestricted damage multiplication.                             |
| Boss component        | Arena objective or component is broken.                                                                                    | Phase transition, disabled ability, new weak point, reduced defence, altered loot, or safer arena state. |
| Random trait critical | Small gear/perk/culture trait chance.                                                                                      | Supplementary bonus only; most critical power comes from earned openings.                                |

## 8.3 Armour and Resistance Rules

- Routine attacks use aggregate armour plus relevant slot contribution; explicit headshots, armour-break moves, boss mechanics, traps, and precision attacks may query a body slot or component.

- Heavy armour generally improves physical mitigation and stability but increases load, noise, temperature strain, stamina costs, and selected mana inefficiencies.

- Resistance stacking uses diminishing returns. Rare conditional immunity can exist through specialised wards, forms, culture gear, or story artefacts.

- Headshots apply only to eligible anatomy and are influenced by helmets, projectile penetration, range, alertness, and difficulty.

- Enemy difficulty should not primarily inflate health. Higher settings improve coordination, aggression, mechanics, raid pressure, injuries, and resource scarcity with limited stat scaling.

- Damage display is configurable: full numbers, simplified indicators, bars only, or immersive minimal feedback.

# 9. Melee Weapons, Movesets and Mastery

Melee families share a consistent input language but have distinct tactical identities. A material upgrade changes capability, durability, and handling, yet family role, culture technique, enchantment, quality, and mastery remain important. Older gear can stay useful through specialised damage, repair economy, culture bonuses, enchantments, NPC supply, and upgrade paths.

| **Family**         | **Combat Identity**                                                            | **Signature Actions**                                                        | **Trade-offs / World Use**                                               |
|--------------------|--------------------------------------------------------------------------------|------------------------------------------------------------------------------|--------------------------------------------------------------------------|
| Sword              | Versatile reach, timing, defence, counters, and cultural variety.              | Cuts, thrusts, guard counters, quick heavy, half-sword or two-hand variants. | Rarely best at one extreme; broad repair and guard use.                  |
| Axe                | Powerful chops, guard pressure, shield/wood effectiveness.                     | Overhead chop, hook, cleave, shield break, charged strike.                   | Slower recovery; tool crossover for timber and structures.               |
| Hammer / mace      | Blunt force, armour break, stability damage, construct and bone effectiveness. | Crushing overhead, shove, ground impact, armour-break combo.                 | High stamina/load, slower attacks; useful in smithing/building themes.   |
| Dagger             | Speed, low stamina, concealment, critical openings, utility.                   | Quick chain, backstab, parry, throw, poison/coating application.             | Short reach and weak guard pressure.                                     |
| Spear              | Reach, thrust precision, hunting, brace, formation, mounted use.               | Thrust chain, sweep, brace, charge stop, throw on eligible variants.         | Poor in very close quarters and tight interiors.                         |
| Polearm            | Space control, sweeps, hooks, anti-large and anti-mounted tactics.             | Wide sweep, hook/pull, overhead, formation attack.                           | High space and handling requirements.                                    |
| Staff              | Defensive reach and magical focus hybrid.                                      | Sweep, thrust, block, channel, ward strike, spell branch.                    | Lower physical lethality unless reinforced or specialised.               |
| Scythe / sickle    | Harvest/tool crossover, hooking, sweeping, culture and forbidden variants.     | Hook, pull, reaping sweep, status application.                               | Specialised handling and weaker conventional defence.                    |
| Unarmed / gauntlet | Emergency combat expanding through training, culture, perks, forms, and magic. | Punch, kick, grapple, shove, counter, restraint.                             | Low reach and material scaling without specialised gear.                 |
| Tool weapon        | Axe, hammer, pick, shovel, wrench, rune chisel, and similar emergency use.     | Context strike and system-specific interaction.                              | Inferior combat handling/durability but may exploit material weaknesses. |
| Cultural weapon    | Race/culture-specific family or moveset using the shared rules.                | Unique stance, formation, magic link, crafting method, or social role.       | Requires teaching, reputation, discovery, or specialist crafting.        |

## 9.1 Melee Action Vocabulary

| **Action**             | **Rule**                                                                                                                                |
|------------------------|-----------------------------------------------------------------------------------------------------------------------------------------|
| Light chain            | Short authored sequences with timing and directional influence; chains do not create universal exponential damage.                      |
| Heavy action           | Higher stamina/commitment with improved reach, penetration, stability, status, charge, or special property.                             |
| Charged action         | Only selected moves charge; risk is visible through longer startup, movement restriction, sound, or resource use.                       |
| Sprint attack          | Family-specific momentum action; strong initiation but costs stamina and has readable recovery.                                         |
| Jump / plunge          | Limited to suitable weapons and heights; uses falling momentum with safeguards against repeated low-risk spam.                          |
| Weapon block           | Most weapons can block poorly to moderately. Shields and dedicated defensive weapons remain superior.                                   |
| Parry                  | Family- and equipment-specific timing action. Success negates/reduces damage and creates an opening scaled by attack and target.        |
| Dodge                  | Load-dependent step, roll, dash, or magical evade. Positioning matters more than long universal invulnerability.                        |
| Two-hand grip          | Selected weapons gain power, control, reach, brace, or stability at the cost of the off-hand.                                           |
| Dual wield             | Compatible one-handed pairs gain dedicated movesets, higher pressure, and reduced defensive efficiency; training/perks may be required. |
| Context critical       | Available against eligible unaware, staggered, restrained, downed, or component-exposed targets.                                        |
| Non-lethal / restraint | Selected attacks, weapons, grapples, commands, and status effects support capture and surrender.                                        |

## 9.2 Weapon Mastery

Mastery is primarily tracked by weapon family, with optional style branches and culture techniques. It rewards meaningful use, training, defence, objectives, and milestones rather than only final blows. Mastery improves handling, stamina efficiency, recovery, moves, tactical options, maintenance, teaching, and special interactions more than raw damage inflation.

| **Mastery Source** | **Examples**                                                                       | **Anti-Exploit Rule**                                                            |
|--------------------|------------------------------------------------------------------------------------|----------------------------------------------------------------------------------|
| Use                | Hits, blocks, parries, dodges, hunting, structure defence.                         | Repeated harmless hits, captive targets, or invalid targets rapidly lose reward. |
| Milestone          | Defeat role enemies, defend a settlement, complete a hunt, break a boss component. | One-time or diminishing rewards per milestone tier.                              |
| Training           | Sparring, NPC lessons, culture schools, manuals, practice targets.                 | Time, cost, reputation, fatigue, and training caps prevent instant mastery.      |
| Craft and maintain | Forge, repair, tune, inspect, or supply the family.                                | Supports smith/engineer builds but cannot fully replace practical use.           |
| Leadership         | Train guards, command formations, equip militia, plan defence.                     | Credit depends on actual combat outcomes and contribution.                       |
| Discovery          | Find a technique, culture style, relic weapon, boss lesson, or dimension form.     | Requires knowledge or story state, not repetitive grinding.                      |

# 10. Ranged Weapons, Ammunition and Projectiles

Ranged combat is physical and supply-aware. Arrows, bolts, stones, javelins, bombs, potions, runes, and siege ammunition are inventory objects by default; quivers and containers support quick selection. Detailed nearby NPCs consume real ammunition, while distant battles use abstract defence stock from armories and warehouses.

| **Family**         | **Identity**                                                        | **Ammunition / Handling**                                                            | **Distinct Uses**                                                      |
|--------------------|---------------------------------------------------------------------|--------------------------------------------------------------------------------------|------------------------------------------------------------------------|
| Bow                | Mobile draw-based precision with high skill ceiling.                | Arrows, variable draw, physical arc, recovery chance, movement accuracy.             | Hunting, stealth, flexible ammunition, rapid fire through skill.       |
| Crossbow           | Strong prepared shot with lower aim burden and slower reload.       | Bolts, mechanical reload, can remain loaded, high penetration variants.              | Guard towers, armour pressure, trap integration, mechanical upgrades.  |
| Sling              | Cheap early ranged and utility weapon.                              | Stones, clay bullets, alchemical payloads; circular wind-up or simplified animation. | Hunting small creatures, blunt impact, distraction, culture variants.  |
| Thrown             | Quick flexible physical payloads.                                   | Knives, axes, javelins, nets, stones, bombs, potions, runes.                         | Opening attacks, utility, restraint, elemental/status delivery.        |
| Siege              | Crew- or structure-operated long-range force.                       | Bolts, stones, incendiary pots, magical charges, culture ammunition.                 | Walls, gates, monsters, formations, regional conflict.                 |
| Magitech launcher  | Rare late-game hybrid rather than conventional firearm replacement. | Crystal cells, rune cartridges, alchemical capsules, mana charges.                   | Faction identity, special effects, anti-magic, automation integration. |
| Magical projectile | Spell or focus-generated attack.                                    | Mana, charge, catalyst, focus durability, or infrastructure power.                   | Beams, bolts, homing, ward interaction, elemental and spirit roles.    |

## 10.1 Projectile Rules

| **Property**       | **Locked Direction**                                                                                                                                |
|--------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------|
| Trajectory         | Arrows, bolts, thrown objects, and physical magical bolts use readable speed and gravity. Beams and selected hitscan-like magic use separate rules. |
| Range              | Velocity, arc, accuracy, penetration, and damage falloff are source-specific. There is no arbitrary universal range wall.                           |
| Movement accuracy  | Stance, movement speed, draw state, weapon, skill, injury, load, weather, and magic influence accuracy.                                             |
| Wind and weather   | Mild in common ranges; meaningful at long range, storms, high altitude, special biomes, and configurable difficulty.                                |
| Collision          | Projectiles can strike actors, shields, barriers, cover, tagged blocks, devices, ropes, explosives, windows, and boss components.                   |
| Recovery           | Depends on projectile quality, impact material, penetration, break chance, perks, and world setting.                                                |
| Friendly fire      | World/server setting with separate player, NPC, pet, structure, and area-effect controls where practical.                                           |
| Ammunition supply  | Players use quivers/containers; local guards draw from personal inventory or armory; distant battles spend abstract defence stock.                  |
| Special ammunition | Hunting, broadhead, armour-piercing, blunt, rope, fire, frost, shock, ward, alchemical, signal, and culture variants.                               |
| Structure damage   | Only ammunition with appropriate tags damages tagged blocks, wards, ropes, devices, siege targets, or weak structures.                              |
| Stealth            | Sound, projectile trail, impact, witnesses, target alertness, and weapon type influence whether the attacker is revealed.                           |
| Networking         | Server-authoritative hit and damage; optional local prediction for drawing, release, trails, and non-authoritative feedback.                        |

## 10.2 Quivers and Ammunition Containers

- Back-slot, belt-slot, integrated backpack, magical, and culture-specific ammunition containers may exist; back-slot conflicts create meaningful loadout choices.

- Containers define capacity, permitted tags, quick-cycle order, protection from weather, retrieval speed, recovery bonuses, and automation/NPC resupply behaviour.

- An empty quiver does not delete the ranged weapon. The player can manually load compatible loose ammunition or switch to another action.

- NPC towers, armories, and siege engines expose visible low-ammunition states so automation and village supply remain relevant.

# 11. Combat Magic, Wards and Hybrid Equipment

Combat magic follows the Magic System: mana is world energy, spells are learned through knowledge and culture, and magic remains infrastructure as well as personal power. Mundane weapons stay viable. Combat magic supplies damage, control, defence, support, terrain interaction, healing, counters, and hybrid equipment without becoming a universally stronger replacement.

| **Combat Magic Role**  | **Examples**                                                                         | **Costs / Counterplay**                                                    |
|------------------------|--------------------------------------------------------------------------------------|----------------------------------------------------------------------------|
| Direct damage          | Bolt, beam, cone, burst, weapon infusion.                                            | Mana, focus, charge, catalyst, cast time, range, resistance, cover.        |
| Control                | Slow, root, push, wall, silence, blind, reveal, bind.                                | Buildup, duration, immunity, dispel, stability, terrain escape.            |
| Defence                | Personal barrier, projected shield, directional wall, ward pulse, absorption.        | Mana drain, capacity, angle, school counter, collapse cooldown.            |
| Support                | Heal, cleanse, inspire, haste, armour, vision, rescue, stabilise.                    | Resource cost, channel, cooldown, target rules, corruption/overuse risk.   |
| Terrain / structure    | Ignite, freeze water, create cover, repair, reinforce, reveal rune, disrupt machine. | Tagged-block permissions, world settings, ownership, material resistance.  |
| Countermagic           | Dispel, interrupt, ground, absorb, redirect, silence, cleanse, destabilise.          | Timing, school, tool, target knowledge, line of effect, mana contest.      |
| Hybrid weapon          | Rune strike, spellblade infusion, staff moveset, focus bow, ward shield.             | Mana/charge/durability/catalyst; physical handling remains relevant.       |
| Infrastructure support | Ward lantern, mana conduit, village field, ritual anchor, tower rune.                | Stored mana, maintenance, damage, supply, operator or ritual requirements. |

## 11.1 Casting Rules

| **Area**               | **Locked Direction**                                                                                                                                 |
|------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------|
| Movement               | Simple spells allow reduced movement; stronger spells may slow, root, channel, require a stance, or use a ritual/infrastructure anchor.              |
| Focus                  | Simple known magic may be cast directly. Advanced spells use a wand, staff, book, relic, rune, weapon, component, or structure.                      |
| Loadout                | Limited active loadout plus full known library, gear-granted abilities, quick swapping, and accessibility options.                                   |
| Targeting              | Free projectiles, lock-assisted targets, beams, cones, self-casts, ally targets, ground areas, block/structure targets, and ritual anchors.          |
| Interruption           | Damage, stability loss, silence, line break, focus damage, or movement may interrupt based on cast profile. Armour and wards can improve stability.  |
| Charging / overcasting | Selected spells charge or channel. Optional overcasting increases effect by consuming extra mana, catalysts, health, durability, or corruption risk. |
| Area effects           | Powerful but costly and clearly telegraphed; friendly-fire and block-damage settings prevent accidental village destruction.                         |
| Armour interaction     | Heavy armour does not forbid magic. It may alter movement, focus, mana efficiency, ward capacity, heat, noise, and stability.                        |
| Enemy rules            | Enemies share damage types, effects, schools, telegraphs, counters, and barriers, but may use simplified resource logic for AI/performance.          |
| Social consequences    | Culture, law, witnesses, school, target, location, ownership, corruption, and collateral damage affect reputation and crime.                         |
| POC spell set          | One direct combat spell, one utility spell, apprentice staff/focus, ward lantern interaction, and a wisp/raid defence counter.                       |

## 11.2 Magical and Hybrid Equipment

| **Item Family**         | **Passive Role**                                                | **Active Role**                                                                         |
|-------------------------|-----------------------------------------------------------------|-----------------------------------------------------------------------------------------|
| Wand                    | Low load, quick casting, school affinity, precision.            | Bolt, quick counter, targeted utility, rune trigger.                                    |
| Staff                   | Melee reach, block, mana handling, ritual authority.            | Channel, barrier, wide cast, ward link, infused strike.                                 |
| Spellbook / tome        | Knowledge slots, cast options, research bonuses.                | Prepared spell, page ritual, counter formula, summon/construct command.                 |
| Rune weapon             | Physical weapon with patterned effects.                         | Triggered strike, mode switch, status burst, machine/ward interaction.                  |
| Ward shield             | Physical block plus magical resistance/capacity.                | Barrier pulse, projectile absorption, dispel bash, ally cover.                          |
| Focus bow / launcher    | Projectile handling with magical conversion or guidance.        | Elemental shot, ward arrow, mark, spirit projectile.                                    |
| Mana charm / battery    | Capacity, regeneration, stabilisation.                          | Emergency restore, barrier recharge, machine/ward transfer.                             |
| Cursed / forbidden gear | Strong conditional traits, unusual schools, fear or corruption. | Powerful active effect with risk, witness, faction, cleansing, or binding consequences. |

# 12. Gear Slots, Armour Classes, Shields and Accessories

Equipment is an inventory-facing extension of the Items Registry. Every combat item keeps its item ID, rarity, quality, material family, durability, repair recipe, value, culture, and planning status, while the combat extension defines handling, defence, load, movesets, resistances, effects, sockets, and runtime condition.

| **Slot**       | **Typical Equipment**                                                     | **Key Rules**                                                                                                 |
|----------------|---------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------|
| Head           | Helm, hood, hat, circlet, mask, respirator.                               | Defence, environmental protection, perception, social identity, magic; visibility can be hidden cosmetically. |
| Chest          | Tunic, mail, cuirass, robe, coat, harness.                                | Primary armour, stability, resistances, pockets/modules, culture silhouette.                                  |
| Hands          | Gloves, gauntlets, wraps, focus gloves.                                   | Grip, tool use, casting, block, harvesting, climbing, status resistance.                                      |
| Legs           | Trousers, greaves, robe lower, work gear.                                 | Protection, movement, temperature, stealth, carrying support.                                                 |
| Feet           | Boots, sabatons, sandals, realm shoes.                                    | Traction, noise, terrain, fall, heat/cold, movement and realm adaptation.                                     |
| Main hand      | Weapon, tool, focus, utility.                                             | Primary moveset/action source.                                                                                |
| Off-hand       | Shield, weapon, torch, focus, book, tool, lantern, bomb, charm.           | Defence, utility, dual wield, casting, light, contextual actions.                                             |
| Back           | Backpack, quiver, cloak, shield, glider, tank, magical storage.           | Mutual conflicts, load, capacity, travel, defence, logistics.                                                 |
| Belt / utility | Pouches, tool belt, medicine roll, bomb rack, ammo pouch.                 | Quick-access slots and specialist support.                                                                    |
| Cloak          | Cloak, cape, mantle.                                                      | Weather, stealth, faction, gliding, warding, resistance, cosmetics.                                           |
| Accessories    | Rings, amulets, charms, badges, trophies, talismans.                      | Conditional traits, reputation identity, mana, resistance, utility.                                           |
| Specialised    | Mount tack, diving gear, realm stabiliser, siege harness, ritual regalia. | Context systems and late-game/environmental progression.                                                      |

## 12.1 Armour Classes

| **Class**         | **Strengths**                                                                              | **Trade-offs**                                                                  | **Common Roles**                                  |
|-------------------|--------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------|---------------------------------------------------|
| Light             | Mobility, stealth, stamina recovery, climbing, scouting, ranged handling.                  | Low physical mitigation and stability.                                          | Scout, hunter, archer, rogue, traveller.          |
| Medium            | Balanced mitigation, mobility, culture flexibility, broad resistances.                     | No extreme strengths; moderate load.                                            | Adventurer, militia, ranger, mixed fighter.       |
| Heavy             | Physical defence, stability, guard/formation use, knockback resistance.                    | High load, noise, stamina, heat, swimming/climbing, selected casting penalties. | Guard, defender, siege fighter, frontline.        |
| Robe / ritual     | Mana, casting, wards, school affinity, ritual, light load.                                 | Low conventional armour and environmental vulnerability unless specialised.     | Mage, healer, ritualist, support.                 |
| Workwear          | Tool efficiency, pockets, hazard protection, repair, industry.                             | Limited direct combat defence.                                                  | Builder, miner, engineer, alchemist, firefighter. |
| Environmental     | Heat, cold, poison, underwater, storm, corruption, realm protection.                       | May sacrifice general combat performance.                                       | Explorer, dimension traveller, hazard specialist. |
| Hybrid / cultural | Culture-specific combinations of plates, cloth, chitin, runes, living materials, or magic. | Requires unique resources, teaching, repair, or reputation.                     | Faction and race identities.                      |

## 12.2 Shield Families

| **Shield Type**    | **Coverage / Handling**                                   | **Strengths**                                                | **Weaknesses**                                                               |
|--------------------|-----------------------------------------------------------|--------------------------------------------------------------|------------------------------------------------------------------------------|
| Buckler            | Low coverage, low load, fast parry.                       | Precision defence, mobility, counters, off-hand flexibility. | Poor projectile and area coverage; low stability.                            |
| Light shield       | Moderate coverage and speed.                              | General-purpose blocking and bash.                           | Limited against siege/heavy attacks.                                         |
| Heater / medium    | Strong frontal coverage and stability.                    | Guard use, arrows, formation, balanced defence.              | Moderate load and stamina.                                                   |
| Tower / heavy      | Very high coverage and stability.                         | Shield line, projectile protection, doorway/tower defence.   | Slow, heavy, low visibility/mobility, vulnerable to flanks and guard breaks. |
| Rune / ward shield | Physical shield with mana capacity and school resistance. | Magic defence, barrier pulse, dispel/absorb options.         | Mana supply, overload, specialised repair, culture/legal restrictions.       |
| Improvised         | Wood board, tool plate, pot lid, scrap.                   | Early emergency protection and crafting accessibility.       | Low durability, coverage, stability, and social quality.                     |

## 12.3 Rarity, Quality, Sets and Appearance

| **System**     | **Locked Direction**                                                                                                                                           |
|----------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Rarity         | Common, Uncommon, Rare, Epic, Legendary, Mythic, Relic. Rarity communicates unusual origin/effects more than a simple damage multiplier.                       |
| Quality        | Crude, Standard, Refined, Masterwork, Legendary. Quality influences handling, efficiency, reliability, durability, defence, value, repair, and trait capacity. |
| Set effects    | Limited thematic partial/full bonuses may exist, but mixed equipment must remain viable.                                                                       |
| Sockets        | Capacity depends on material, quality, item family, crafting, specialist, runes, gems, wards, and magitech modules.                                            |
| Appearance     | Dyes and engine-driven variants can reflect material, rarity, quality, culture, biome, seed, age, weathering, damage, magic, corruption, and ownership.        |
| Transmog       | Appearance customisation is supported with silhouette, armour-class, faction, PvP readability, and discovery safeguards.                                       |
| Helmet display | Player-controlled cosmetic hide, including dialogue preferences; mechanical equipment remains equipped.                                                        |
| Old gear       | Can serve NPCs, culture roles, specialised resistances, enchantment bases, repair economy, dismantling, museum/trophy, or backup loadouts.                     |

# 13. Durability, Repair, Upgrades, Enchanting and Curses

Weapons, armour, shields, focuses, siege equipment, and defensive structures use condition and durability because maintenance links combat to resources, crafting, village jobs, automation, and world consequences. Durability must create planning and repair gameplay without turning every expedition into maintenance spam. World settings control wear rates, zero-condition outcomes, and whether harsh destruction is possible.

| **Area**           | **Locked Direction**                                                                                                                                                     |
|--------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Wear sources       | Weapon impacts, blocked force, armour absorption, corrosive hazards, fire, realm exposure, overload, siege damage, poor storage, and selected failed actions.            |
| Wear avoidance     | Misses do not normally consume full durability; trivial contacts, practice targets, and invalid hits use reduced or no wear. Quality and maintenance reduce loss.        |
| Condition feedback | Icon state, item appearance, material sound, attack/defence feel, tooltip, repair estimate, and NPC comments communicate condition.                                      |
| Low condition      | Gradually affects handling, protection, reliability, appearance, special traits, mana efficiency, or stability depending on item type.                                   |
| Zero durability    | Default item becomes broken and repairable rather than disappearing. Harsh settings may allow loss, scrap conversion, degraded reconstruction, or permanent destruction. |
| Field repair       | Simple kits restore limited condition and stabilise damage. Full repair, quality recovery, socket work, and curse treatment use stations or specialists.                 |
| Repair inputs      | Material family, parts, leather/cloth, bindings, oils, runes, mana dust, replacement components, cleansing agents, and labour.                                           |
| Repair quality     | Poor repair can cap restored condition or add a temporary flaw; skilled player/NPC, better station, and correct material preserve quality.                               |
| NPC maintenance    | Guards and workers use armouries, smiths, stores, schedules, and exact repair supplies. Distant settlements abstract wear against defence stock.                         |
| Automation         | Repair benches, part production, armory restocking, inspection stations, and golem maintenance can be automated later.                                                   |
| Structure repair   | Walls, gates, towers, wards, traps, and siege devices use block/structure damage states, exact resources, builders, and priority projects.                               |
| Salvage            | Broken gear can be dismantled for partial materials, parts, runes, knowledge, trophies, or culture-specific recovery.                                                    |

## 13.1 Upgrade Paths

| **Upgrade Layer**     | **Examples**                                                                      | **Rules**                                                                                           |
|-----------------------|-----------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------|
| Material rebuild      | Wood to bronze/iron/steel or culture/realm material variant.                      | Usually a new recipe or specialist reforging; family identity remains.                              |
| Quality improvement   | Crude to Standard, Refined, Masterwork.                                           | Requires skill, station, materials, time, and sometimes disassembly; not guaranteed for every item. |
| Physical modification | Grip, balance, edge, reinforcement, plate, string, sight, quiver, shield rim.     | Visible components with handling/load/durability trade-offs.                                        |
| Rune / enchantment    | Element, ward, mana capacity, trigger, status, utility, machine link.             | Uses sockets, school compatibility, power source, stability, and legal/cultural tags.               |
| Magitech module       | Battery, conduit port, targeting rune, repeater, stabiliser, sensor.              | Advanced tier; can add maintenance, overload, noise, or faction attention.                          |
| Culture technique     | Moveset branch, formation use, social recognition, unique repair or crafting.     | Requires teacher, faction trust, knowledge, or recovered tradition.                                 |
| Relic awakening       | Story, boss, dimension, settlement, ritual, or moral condition.                   | Rare bespoke progression; may alter world/faction reactions.                                        |
| Cleansing / binding   | Remove or control curse, corruption, possession, instability, or forbidden trait. | May reduce power, change the item, require a ritual, or create a new story state.                   |

## 13.2 Enchantment Models

| **Model**              | **Duration / Power**                                                                | **Examples**                                                    |
|------------------------|-------------------------------------------------------------------------------------|-----------------------------------------------------------------|
| Permanent              | Long-term effect attached to item; repair and recharge may still apply.             | Elemental edge, warded plate, mana-efficient focus.             |
| Temporary coating      | Minutes or limited hits; crafted, applied, and consumed.                            | Oil, poison, frost resin, sanctified ash.                       |
| Charged                | Stored uses or energy, rechargeable through item, shrine, machine, or resource.     | Rune burst, ward shield pulse, crystal repeater.                |
| Conditional            | Activates under stated terrain, health, time, faction, spell, status, or formation. | Night hunter, tower guard, wet-lightning, village defender.     |
| Infrastructure-powered | Works inside a ward, mana network, settlement, vehicle, or ritual field.            | Armory-linked gear, watchtower sight rune, city barrier armour. |
| Bound / cursed         | High power with corruption, obligation, legal, social, health, or behavioural risk. | Blood blade, whispering helm, void buckler.                     |
| Living / evolving      | Changes through use, story, feeding, bond, settlement, or realm exposure.           | Fae bow, ancestral shield, golem gauntlet.                      |

# 14. Status Effects, Injuries, Healing, Downing and Death

Status effects provide tactical identity and counterplay; injuries provide persistent consequence when enabled. They are not the same system. A burning status may last seconds, while a severe burn injury may require treatment after combat. All effects define source tags, buildup, threshold, stack behaviour, duration, feedback, resistance, cleansing, immunity, and AI/NPC consequences.

| **Status Family** | **Examples**                                                           | **Core Behaviour / Counter**                                                            |
|-------------------|------------------------------------------------------------------------|-----------------------------------------------------------------------------------------|
| Damage over time  | Burning, bleeding, poisoned, cursed decay, corruption.                 | Periodic damage or resource loss; extinguish, bandage, antidote, cleanse, ward, rest.   |
| Elemental control | Chilled, frozen/brittle, shocked, wet, scorched.                       | Movement/stability/interaction changes; heat, grounding, drying, resistance, timing.    |
| Movement control  | Slowed, rooted, entangled, knocked down, levitated.                    | Position restriction; cut free, dodge before threshold, stability, dispel, ally rescue. |
| Action control    | Stunned, silenced, disarmed, blinded, interrupted.                     | Short readable denial; immunity windows and diminishing returns prevent lock chains.    |
| Mental / morale   | Frightened, panicked, enraged, inspired, rallied, charmed.             | AI decision and selected player feedback; resolve, leadership, distance, cleanse.       |
| Defensive         | Warded, armoured, braced, covered, concealed, barriered.               | Temporary protection with capacity, duration, angle, source, or positioning.            |
| Mark / exposure   | Revealed, hunted, vulnerable, armour-broken, weak-point exposed.       | Enables target tracking, precision, faction pursuit, or tactical opening.               |
| Forbidden / realm | Corrupted, void-touched, blood-bound, dream-lost, cursed.              | Persistent risk, social reaction, magic changes, specialised cleansing/stabilisation.   |
| Recovery          | Regenerating, rested, nourished, treated, stabilised.                  | Supports recovery without universal fast regeneration.                                  |
| Environmental     | Cold, heat strain, suffocating, drowning, smoke, toxic, unstable mana. | Gear, shelter, movement, item, magic, infrastructure, and extraction consequences.      |

## 14.1 Status Application and Stacking

| **Rule**            | **Locked Direction**                                                                                                                                                        |
|---------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Application         | Some effects apply immediately; stronger control and persistent effects usually build toward a threshold.                                                                   |
| Visibility          | Buildup meters can be full, simplified, target-only, warning-only, or hidden by UI settings.                                                                                |
| Stacking            | Each status defines whether applications refresh duration, add intensity, add independent stacks, transform, or do nothing.                                                 |
| Diminishing control | Repeated hard-control effects within a short window grant resistance or immunity to prevent permanent stun chains.                                                          |
| Interactions        | Use a limited readable set: fire thaws frost, wet increases shock risk, heat dries wet, frozen becomes brittle, rain suppresses fire, cleansing removes corruption buildup. |
| Immunity            | Anatomy, creature family, state, boss phase, ward, culture, realm, or specialised gear may grant conditional immunity.                                                      |
| Friendly effects    | Buffs identify source and stacking group so multiple players/NPCs do not create uncontrolled multiplication.                                                                |
| World effect        | Fire, poison, corruption, smoke, frost, and mana instability may also affect tagged blocks, crops, machines, or areas under permissions/settings.                           |

## 14.2 Injury Categories

| **Injury**            | **Typical Trigger**                                               | **Effects**                                                            | **Treatment**                                               |
|-----------------------|-------------------------------------------------------------------|------------------------------------------------------------------------|-------------------------------------------------------------|
| Bruised / strained    | Heavy blunt hit, fall, repeated guard break.                      | Temporary stamina/stability or movement penalty.                       | Rest, food, poultice, healer.                               |
| Deep wound            | Severe slash/pierce, trap, boss strike.                           | Bleeding risk, reduced action efficiency, infection on harsh settings. | Bandage, medicine, stitching/healing magic.                 |
| Fracture              | Major fall, crushing, siege, large creature.                      | Movement, attack, block, work, or load penalty.                        | Splint, healer, rest, magic, specialist.                    |
| Severe burn / frost   | High elemental exposure or repeated buildup.                      | Health recovery, equipment, movement, or resistance penalty.           | Cooling/warming, salve, medicine, cleanse.                  |
| Poisoned / diseased   | Venom, toxin, food, swamp, creature, weapon.                      | Periodic damage, stamina/mana/recovery impairment.                     | Antidote, alchemy, healer, rest.                            |
| Corrupted / cursed    | Forbidden magic, void, relic, ritual failure.                     | Magic, social, health, perception, or world-state changes.             | Ward, cleansing ritual, specialist, faction, story choice.  |
| Exhausted             | Repeated resource depletion, ritual, temperature, hunger, travel. | Reduced max stamina/mana and slower recovery.                          | Rest, meal, shelter, treatment, shrine.                     |
| Trauma / morale wound | NPC loss, terror, defeat, magical fear, village destruction.      | NPC morale, work, dialogue, migration, or combat response.             | Safety, leadership, time, culture, memorial, healer/priest. |

## 14.3 Healing and Recovery

| **Method**                  | **Combat Use**                                                                             | **Long-Term Use**                                                                |
|-----------------------------|--------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------|
| Food / meals                | Mainly preparation and slow recovery; rare magical meals offer limited combat effects.     | Restoration, max-resource preparation, morale, temperature, culture.             |
| Poultice / bandage          | Short interruptible application; stops bleed or restores modest health over time.          | Treats minor injuries and stabilises severe ones.                                |
| Potion                      | Consumption time, category cooldown, inventory limit, toxicity/diminishing return by type. | Strong recovery, antidote, resistance, status cleansing.                         |
| Spell                       | Quick heal, channel, barrier, cleanse, rescue; mana and interruption matter.               | Injury treatment, corruption cleansing, ritual healing.                          |
| NPC healer                  | Requires safety, medicine, skill, schedule, building, payment/reputation.                  | Diagnosis, injury recovery, village health, rare treatment.                      |
| Shrine / ward               | Area recovery, blessing, stabilisation, revival exception, mana support.                   | Village resilience, long-term treatment, culture story.                          |
| Rest / shelter              | Not usable as an instant combat reset.                                                     | Core health/stamina/mana/injury recovery, improved by bed, food, safety, warmth. |
| Automation / infrastructure | Medicine production, clean water, ward power, hospital stock, supply routing.              | Civilisation-scale recovery and raid preparedness.                               |

## 14.4 Downed, Defeat, Death and Revival

- Solo default: reaching zero health causes death unless a companion, ward, perk, item, or configured rescue system intervenes. Multiplayer and selected settings use a downed state.

- Multiplayer revival is a timed vulnerable interaction supported by medicine, magic, perks, NPCs, or nearby structures; repeated downs can shorten the window or add injury.

- Player death uses tombstone/inventory recovery by default and does not remove levels or skills. World settings may change inventory, item condition, recovery markers, or permadeath.

- Named NPC death is permanent by default. Softer settings may provide incapacitation, rescue windows, evacuation, rare revival, or story protection categories.

- Persistent NPC injuries consume medicine, reduce work/combat capacity, affect morale, and create dialogue, succession, migration, mourning, memorial, and quest consequences.

- Defeat can also resolve through surrender, capture, retreat, ransom, rescue, imprisonment, exile, faction terms, or occupation where the encounter supports it.

# 15. Stealth, Detection, Crime, Surrender and Capture

Stealth is a combat-avoidance and tactical layer rather than a binary crouch switch. Detection combines sight, light, sound, movement, cover, weather, stance, equipment noise, scent/tracks for relevant creatures, magic, faction knowledge, disguise, witnesses, and alert state. Hostility also depends on law, territory, reputation, trespass, weapon posture, and encounter objectives.

| **Detection Channel** | **Key Inputs**                                                                     | **Examples / Counters**                                                        |
|-----------------------|------------------------------------------------------------------------------------|--------------------------------------------------------------------------------|
| Sight                 | Distance, light, contrast, movement, cover, posture, facing, weather, target size. | Darkness, foliage, crouch, cloak, smoke, illusion, elevation, disguise.        |
| Sound                 | Action loudness, material, weapon, armour, speed, impact, echo, weather.           | Slow movement, soft boots, silence magic, rain, distance, closed doors.        |
| Scent / tracks        | Creature senses, blood, food, wind, terrain, time, trail.                          | Wash, mask scent, change route, weather, ward, terrain, decoy.                 |
| Magic sense           | Mana use, corruption, ward crossing, spirit presence, magical item.                | Concealment rune, grounding, low-power casting, dispel, specialist gear.       |
| Social recognition    | Faction, clothing, weapon, badge, race/culture, wanted state, prior memory.        | Disguise, permit, reputation, escort, surrender, bribe, diplomacy.             |
| Network alert         | Bell, horn, scout, witness, camp signal, ward alarm, messenger.                    | Disable alarm, intercept scout, jam ward, close route, intimidate witness.     |
| Evidence              | Bodies, broken doors, stolen goods, tracks, damaged machines, missing patrol.      | Clean up, repair, return goods, frame faction, leave area, accept consequence. |

## 15.1 Alert States

| **State**               | **Behaviour**                                                                                              |
|-------------------------|------------------------------------------------------------------------------------------------------------|
| Unaware                 | Performs normal schedule or patrol; can be surprised if eligible.                                          |
| Suspicious              | Investigates sound, tracks, missing object, movement, light, or magical anomaly; may call nearby ally.     |
| Alert                   | Weapon ready, seeks cover/allies, protects objective, checks routes, uses warning systems.                 |
| Engaged                 | Selects combat role, target, formation, objective, and communication actions.                              |
| Searching               | Last-known position, tracks, sound zones, exits, hiding places, witness reports.                           |
| Retreating / regrouping | Moves to leader, camp, fortification, healer, reinforcement, or escape route.                              |
| Surrendering            | Drops/lowers weapon, follows conditions, may bargain, flee, deceive, or await capture depending on traits. |
| Resolved                | Returns to schedule, raises security, reports crime, repairs, mourns, relocates, or updates world state.   |

## 15.2 Crime and Legal Combat

| **Action**                      | **Possible World Response**                                                                                                  |
|---------------------------------|------------------------------------------------------------------------------------------------------------------------------|
| Weapon drawn in protected space | Warning, refusal of service, guard attention, fear, fine, escalation if ignored.                                             |
| Assault / murder                | Witness memory, individual/village/faction reputation, arrest, bounty, exile, retaliation, war, mourning.                    |
| Theft / warehouse raid          | Ownership evidence, project shortage, guard response, ledger discrepancy, quest, scarcity, distrust.                         |
| Forbidden magic                 | Culture/law-specific warning, fear, specialist response, cleansing demand, confiscation, faction hostility.                  |
| Self-defence                    | Witnesses, first aggressor, faction, trespass, proportional response, surrender handling, legal status.                      |
| Duel / training                 | Consent and arena/training tags prevent normal crime and death outcomes when rules are followed.                             |
| Capture / prisoner treatment    | Reputation and morality respond to release, ransom, recruitment, interrogation, labour, execution, or abuse.                 |
| War / conquest                  | Faction and settlement war state changes legal targets, occupation, resistance, surrender terms, tribute, and later stories. |

## 15.3 Non-Combat Resolution

- Eligible encounters may allow stealth, avoidance, negotiation, bribery, intimidation, disguise, trade, quest fulfilment, ritual cleansing, trap bypass, faction alliance, relocation, surrender, or escape.

- Enemy surrender uses morale, leadership, losses, objective status, reputation, cruelty, escape route, and faction culture. It is not guaranteed for mindless or fanatical enemies.

- Player surrender can prevent death and create capture, ransom, prison, rescue, confiscation, forced labour, reputation, or story consequences.

- Non-lethal damage, restraint items, grapples, nets, sleep/status effects, and commands support arrest or capture. Bosses and unusual anatomies define exceptions.

- Violence against surrendering or captured targets is remembered separately from normal combat.

# 16. Enemy AI, Tactical Roles, Morale and Structure Targets

Enemy AI is role- and objective-driven. Creatures, intelligent factions, undead, constructs, spirits, and bosses share perception, action, damage, status, and navigation foundations but use different needs, morale, communication, terrain rules, and objectives. Intelligent groups can coordinate; mindless creatures may swarm, hunt, guard nests, flee fire, or follow magical control instead.

| **Role**                 | **Primary Behaviour**                                                       | **Typical Targets / Actions**                                           |
|--------------------------|-----------------------------------------------------------------------------|-------------------------------------------------------------------------|
| Frontliner               | Closes distance, pressures, protects allies, holds route.                   | Player, guard line, doorway; basic strikes, block, shove.               |
| Skirmisher               | Moves between range bands, flanks, disengages, tests defence.               | Exposed target, supply carrier, isolated guard; quick attacks, retreat. |
| Shield bearer            | Provides cover, holds formation, advances safely.                           | Archers/casters behind line; block projectiles, bash, guard objective.  |
| Archer / ranged          | Uses elevation, cover, target priority, ammunition.                         | Mage, healer, tower operator, exposed civilian, weak structure device.  |
| Caster / controller      | Applies area denial, support, barrier, status, counter.                     | Groups, wards, machines, defenders, ritual target.                      |
| Support / healer         | Restores, cleanses, buffs, supplies, repairs, revives.                      | Commander, elite, wounded ally, siege device, ritual.                   |
| Ambusher                 | Waits in cover, ceiling, darkness, burrow, disguise, trap route.            | Rear target, scout, miner, lone player, caravan.                        |
| Sapper / saboteur        | Avoids direct fight to damage objective.                                    | Gate, wall, bridge, ward, power line, machine, warehouse.               |
| Thief / raider           | Steals and withdraws rather than fighting to death.                         | Food, tools, mana, livestock, project stock, trade goods.               |
| Siege operator           | Uses ram, ladder, ballista, explosive, large creature.                      | Gate, wall, tower, barricade, defender formation.                       |
| Commander                | Coordinates roles, rallies morale, changes objective, calls reinforcements. | Formation, priority target, retreat, phase transition.                  |
| Summoner / spawner       | Creates units, hazards, nests, spirits, constructs.                         | Protected position, ritual anchor, corpses, mana source.                |
| Civilian / non-combatant | Avoids combat and follows emergency role.                                   | Shelter, family, healer, fire bucket, evacuation, supplies.             |
| Fleeing / surrendering   | Seeks route, leader, bargain, concealment, or safe state.                   | Exit, camp, patrol, cover, captor interaction.                          |

## 16.1 Target Selection

| **Factor**        | **Examples**                                                                                                                     |
|-------------------|----------------------------------------------------------------------------------------------------------------------------------|
| Objective         | Breach gate, steal project stock, kill leader, disrupt ritual, rescue captive, defend nest, survive.                             |
| Threat            | Recent damage, control, healing, command, siege operation, ward disruption, repeated aggression.                                 |
| Vulnerability     | Low health/stability, exposed position, weak armour, isolated target, broken barrier, vulnerable component.                      |
| Role match        | Sapper prefers structure, archer prefers exposed support, shield bearer protects line, healer seeks wounded ally.                |
| Faction memory    | Revenge, bounty, reputation, prior raid, feared spell, stolen relic, captured leader.                                            |
| Terrain and route | Line of sight, cover, height, doorway, hazard, water, wall, path cost, escape route.                                             |
| Social / legal    | Civilian protection, surrender state, war target, guard authority, prisoner, forbidden target.                                   |
| Performance       | Nearby actors use detailed scoring; distant engagements resolve from role composition, supply, defence, morale, and event state. |

## 16.2 Morale and Adaptation

- Intelligent enemies and selected animals track morale from casualties, commander state, supplies, formation, isolation, fire, magic, boss presence, objective progress, escape, and reputation.

- Possible reactions include press, hold, rally, frenzy, retreat, surrender, scatter, protect wounded, call reinforcements, steal what is available, or occupy the objective.

- AI adapts in limited readable ways: blocked routes trigger alternate path or sapper action; repeated ranged pressure encourages cover/shields; active wards encourage disruption; weak gates attract breach units.

- Adaptation is constrained by faction knowledge, senses, communication, role, leader, and available equipment. Enemies do not magically know hidden player systems.

- Elites gain new roles, gear, tactics, magic, leadership, and visual tells rather than only health multipliers.

# 17. Bosses and Major Threat Encounters

Bosses are contextual major threats, not enlarged normal enemies. They connect to a biome, structure, faction, dimension, village crisis, ritual, ancient history, or world event. Preparation may include knowledge, equipment, wards, terrain, NPC allies, settlement projects, supply lines, and alternate objectives. Defeat can change spawns, territory, faction power, resources, dimensions, structures, and stories.

| **Boss Layer** | **Required Design Questions**                                                                                                                    |
|----------------|--------------------------------------------------------------------------------------------------------------------------------------------------|
| Identity       | What is it, where did it come from, what faction/realm/culture is connected, and why is it a major threat?                                       |
| Arena          | What terrain, structure, hazards, cover, height, resources, escape, and preparation can change the fight?                                        |
| Mechanics      | What attacks, telegraphs, roles, counters, weak points, summons, phases, and objective interactions distinguish it?                              |
| Components     | Which armour, weapon, limb, rune, wing, core, focus, anchor, or environment piece can be damaged?                                                |
| Phases         | Health, component break, ritual progress, arena state, reinforcements, weather, objective, dialogue, surrender, or player choice can transition. |
| Preparation    | Which codex knowledge, culture teaching, resistance, item, ward, trap, NPC, structure, or supply gives an advantage?                             |
| Failure        | Death, retreat, village damage, corruption, occupation, resource loss, boss escape, stronger later state, or alternate story.                    |
| Reward         | Materials, recipe, knowledge, faction outcome, structure, dimension, relic, trophy, settlement unlock, world-state change.                       |
| Multiplayer    | Moderate health/stability scaling plus target pressure, adds, mechanics, role checks, and contribution-aware rewards.                            |
| Repeatability  | Unique, respawning family, world-event return, rematch, summoned, seasonal, or altered state must be explicit.                                   |

## 17.1 Boss Rules

- Boss telegraphs are recognisable through animation, sound, VFX, arena cues, dialogue, codex clues, or component state. Higher difficulty shortens or layers telegraphs rather than removing fairness.

- Not every boss attack is blockable, parryable, or dodgeable in the same way. The attack profile clearly tags viable responses.

- Bosses receive control resistance and diminishing returns, but player status builds and support roles remain meaningful.

- Arena modification is selective: traps, cover, ritual anchors, defences, tagged blocks, hazards, and prepared structures can matter without enabling trivial full excavation.

- Loot and story state should respond to how the boss was resolved: killed, cleansed, captured, bargained with, banished, stripped of a component, or allowed to escape.

# 18. NPC Guards, Militia, Formations and Player Orders

Village combatants are named NPCs with skills, equipment, injuries, morale, schedules, jobs, relationships, and memories. Their ability depends on real armory stock, food, medicine, ammunition, tools, repair materials, mana, buildings, training, commanders, patrol routes, watch coverage, and local threats. They are not free defensive turrets.

| **NPC Defence Role**      | **Requirements**                                                     | **Behaviour / Contribution**                                                      |
|---------------------------|----------------------------------------------------------------------|-----------------------------------------------------------------------------------|
| Watch guard               | Watchtower/post, ranged weapon, ammunition, line of sight, schedule. | Early warning, patrol coverage, range advantage, target marking, bell/horn.       |
| Gate guard                | Gate/post, shield/melee gear, authority.                             | Controls access, questions strangers, holds choke point, sounds alarm.            |
| Patrol                    | Route, light, equipment, partner/team, schedule.                     | Finds camps/tracks, deters spawns, escorts roads, reports threats.                |
| Militia                   | Emergency law, basic weapon/armour, rally point, leadership.         | Temporary defence with lower skill/morale; returns to civilian work after crisis. |
| Archer / crossbow guard   | Ranged gear, ammo, tower/wall/cover.                                 | Focuses exposed or priority targets; needs resupply and clear line of fire.       |
| Shield / spear line       | Compatible gear, training, formation leader, space.                  | Holds gate/road, protects ranged units, braces against charge.                    |
| Mage / warder             | Mana, focus, school knowledge, legal permission, ward network.       | Barrier, healing, counter, alarm, ward maintenance, spirit/corruption defence.    |
| Healer                    | Medicine, healer skill, safe post, beds, escort.                     | Stabilises wounded, treats status/injury, supports revival or evacuation.         |
| Engineer / builder        | Tools, repair materials, blueprint permission.                       | Repairs gate/wall, resets trap, extinguishes fire, operates siege/automation.     |
| Commander                 | Authority, leadership skill, visibility/communication.               | Rally, formation, retreat, target priority, civilian evacuation, reserve release. |
| Scout / hunter            | Stealth/ranged/tracking gear, route knowledge.                       | Detects raid source, delays scouts, reports composition, marks routes.            |
| Civilian emergency worker | Shelter/route/task assignment.                                       | Carries water, medicine, ammo, repairs, evacuates children/livestock, or hides.   |

## 18.1 Orders and Authority

| **Order**            | **Effect**                                                                         | **Authority Requirement**                                                           |
|----------------------|------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------|
| Hold / defend        | Maintain position, objective, formation, or structure.                             | Trusted helper for temporary defence; stronger authority for permanent assignments. |
| Patrol route         | Follow waypoints, timing, threat rules, and reporting.                             | Village permission, guard leadership, or player settlement control.                 |
| Escort               | Protect player, caravan, NPC, prisoner, builder, healer, or supplies.              | Quest, contract, reputation, command, or employment.                                |
| Retreat / rally      | Withdraw to safe point, reform, restore morale, receive supplies.                  | Recognised commander, leader, guard captain, emergency authority.                   |
| Focus target         | Prioritise boss component, siege unit, sapper, caster, commander, or marked enemy. | Line of communication and leadership/party permission.                              |
| Man defence          | Operate tower, gate, ballista, ward, alarm, barricade, or healing post.            | Job, skill, equipment, permission, and available station.                           |
| Protect civilians    | Shift targeting and formation toward shelters, routes, homes, or evacuation.       | Emergency law, guard role, leader, or quest event.                                  |
| Non-lethal / capture | Use compatible actions and accept surrender.                                       | Law, faction objective, equipment, morale, and target eligibility.                  |
| Do not engage        | Avoid pursuit, hold fire, remain concealed, or allow diplomacy.                    | Leader/quest/faction authority; may be disobeyed under panic or direct attack.      |

## 18.2 Formation Framework

| **Formation**              | **Requirements**                            | **Benefits / Risks**                                                                      |
|----------------------------|---------------------------------------------|-------------------------------------------------------------------------------------------|
| Shield line                | Shields, spacing, leader, suitable terrain. | Projectile/charge protection and stability; weak to flanks, area effects, broken terrain. |
| Spear brace                | Spears/polearms, facing, preparation.       | Stops charge/large targets; vulnerable if bypassed or attacked from range.                |
| Tower firing team          | Tower, ranged gear, ammo, visibility.       | Range, warning, safe firing; vulnerable to fire, siege, ladders, ammo shortage.           |
| Skirmish screen            | Mobile ranged/light gear, retreat route.    | Harass and delay; low staying power.                                                      |
| Mage ward circle           | Mage/warders, mana, anchor, protected area. | Barrier/counter/cleanse; vulnerable to disruption, overload, silence, component damage.   |
| Civilian evacuation column | Route, guards, shelter/camp, timing.        | Reduces civilian deaths; slows defenders and exposes route to ambush.                     |
| Repair team                | Builders, materials, cover, priority.       | Restores gate/wall/trap during battle; vulnerable while working.                          |
| Reserve                    | Uncommitted militia/guards and rally point. | Responds to breach or flank; contributes nothing until committed.                         |

# 19. Village Defences, Fortifications, Traps and Siege

Defence converts resources, blocks, projects, automation, magic, jobs, and preparation into changed threat outcomes. A defence should communicate what it protects, who operates it, what supply it consumes, what enemies counter it, what damage state it is in, and how it changes warning, routes, morale, casualties, or repair cost.

| **Defence Family**     | **Functions**                                                              | **Inputs / Vulnerabilities**                                                     |
|------------------------|----------------------------------------------------------------------------|----------------------------------------------------------------------------------|
| Lighting               | Reduces basic local spawns, improves sight, routes, morale.                | Fuel/power, placement, weather, sabotage; magical threats may need wards.        |
| Watchtower             | Line of sight, warning, ranged range, patrol coverage, command visibility. | Guards, ammo, stairs/access, fire/siege/ladders, blind spots.                    |
| Wall / palisade        | Route control, cover, delay, settlement boundary.                          | Material, height, repair; breach, fire, climbing, sapper, terrain bypass.        |
| Gate                   | Controlled access, choke point, law, trade route, breach target.           | Operator, lock, reinforcement, repair; ram, explosive, infiltration, open state. |
| Barricade              | Fast temporary route delay and cover.                                      | Wood/stone/scrap, builders; low health, fire, bypass.                            |
| Ditch / terrain        | Slows approach, redirects, exposes attackers.                              | Labour, bridges, weather; flying, ranged, alternate path.                        |
| Trap                   | Damage, control, alarm, mark, capture, route denial.                       | Trigger, reset, ownership, friendly safety; detection, disarm, immune targets.   |
| Ward                   | Repels/reveals/weakens tagged magical threats, protects area or structure. | Mana, rune, maintenance, purity; overload, disruption, wrong category.           |
| Armory / supply post   | Equipment, ammunition, medicine, repair stock, reserve tracking.           | Real stored items; theft, fire, blockage, permission.                            |
| Shelter / safe room    | Civilian protection, healing, rally, emergency storage.                    | Capacity, food, medicine, route, structural/fire protection.                     |
| Turret / siege defence | Mechanical, NPC-operated, rune, golem, or magical ranged defence.          | Operator/power/ammo/maintenance; blind arc, sabotage, overload, siege.           |
| Alarm network          | Bell, horn, signal fire, runner, rune alarm, tower relay.                  | Detection and operator; silence, destruction, distance, weather.                 |
| Road / bridge control  | Travel, reinforcement, trade, patrol, retreat, invasion route.             | Repair and ownership; blockade, collapse, occupation, toll, ambush.              |

## 19.1 Trap Rules

| **Trap Type** | **Examples**                                                    | **Rules**                                                                     |
|---------------|-----------------------------------------------------------------|-------------------------------------------------------------------------------|
| Alarm         | Bell tripwire, rune pulse, signal flare, noise trap.            | Low damage, high information; ownership and friendly recognition matter.      |
| Restraint     | Snare, net, cage, glue, root rune.                              | Capture/control; anatomy and strength determine effectiveness.                |
| Damage        | Spike, blade, falling block, fire pot, shock rune.              | Clear trigger area, friendly safety, reset/consumption, material/status tags. |
| Route denial  | Barricade trigger, caltrops, oil, ice, smoke, thorn growth.     | Temporary terrain state; AI and weather respond.                              |
| Decoy         | Noise source, false supplies, illusion, bait, scent.            | Redirects role-appropriate enemies; intelligent factions may learn.           |
| Anti-siege    | Pit, brace, explosive, collapse point, ward overload sink.      | Targets tagged large/siege units; expensive and dangerous.                    |
| Culture trap  | Faction/race material, magic, ecology, architecture, or ritual. | Requires knowledge, specialist, reputation, or discovery.                     |

## 19.2 Siege Framework

| **Siege System**           | **Attacker Use**                                                         | **Defender Counterplay**                                                       |
|----------------------------|--------------------------------------------------------------------------|--------------------------------------------------------------------------------|
| Ram                        | Breach gates and weak reinforced doors.                                  | Brace, fire, ranged focus, ditch, repair, countercharge.                       |
| Ladder / climbing          | Bypass wall route restriction.                                           | Push/cut, tower fire, patrol, height, oil/fire where settings allow.           |
| Siege tower                | Protected wall access and ranged platform.                               | Terrain denial, fire, siege weapon, sabotage, sortie.                          |
| Ballista                   | Anti-personnel, anti-large, anti-structure component.                    | Cover, shield, mobility, sabotage, counter-battery.                            |
| Catapult / thrower         | Area pressure, walls, fire, morale, supply disruption.                   | Disperse, roof/ward, counter-siege, raid engine, repair/fire response.         |
| Sapper / explosive         | Target foundations, gates, wards, machines, bridge.                      | Detection, patrol, trap, repair team, counter-rune, disable charge.            |
| Large creature / construct | Break line, climb, carry units, fear.                                    | Special ammo, weak point, ward, formation, terrain, boss mechanic.             |
| Magical siege              | Barrier break, corruption, summon, portal, weather, ritual.              | Counterspell, ward, destroy anchor, interrupt ritual, specialised gear.        |
| Defensive siege            | Tower ballista, catapult, rune turret, golem, boiling/elemental defence. | Real ammo/power/operator, arcs, permissions, maintenance and collateral rules. |

## 19.3 Structure Damage and Collapse

- Only attacks with appropriate structure tags damage protected construction. Routine sword swings should not accidentally demolish a village.

- Blocks and structures use material resistance, reinforcement, condition, damage stages, fire state, ward state, and ownership/world settings.

- Limited authored/tagged collapse supports gates, bridges, towers, ruins, siege targets, cave supports, and special encounters; there is no default full structural-integrity simulation for every block.

- Fire spread depends on material, fuel, weather, ventilation, warding, response, difficulty, and world settings. NPCs can fight fire using water, tools, magic, and emergency jobs.

- Post-battle damage remains visible until repaired. Temporary emergency repairs can restore function before full cosmetic/structural restoration.

# 20. Raids, Warning, Objectives, Outcomes and Aftermath

Raids are settlement-scale objective events sourced from a faction, camp, nest, corruption zone, war, story, wealth, threat, or world event. They do not exist only to spawn enemies around the player. A raid tracks intelligence, warning, route, force roles, objectives, supply, defender preparation, phases, retreat, occupation, casualties, damage, theft, reputation, story state, and future pressure.

| **Raid Phase**   | **System Activity**                                                                                    | **Player / Village Choices**                                                         |
|------------------|--------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------|
| Pressure / cause | Camp strength, faction hostility, wealth, prior action, route, event, story, corruption.               | Clear camp, negotiate, pay tribute, hide wealth, improve relations, prepare defence. |
| Intelligence     | Scouts, tracks, rumours, patrol reports, captured raider, merchant warning, ward reading.              | Scout, interrogate, bribe, track, use tower, build alarm, ignore.                    |
| Warning          | Bell, horn, smoke, tower, runner, ward, visible approach, timer.                                       | Rally, equip, assign posts, move supplies, evacuate, set traps, seek allies.         |
| Preparation      | Reserve resources, arm guards, load tower, power ward, repair gate, place barricades.                  | Choose priorities and accept trade-offs; not every defence can be perfect.           |
| Approach         | Raid selects route, formation, stealth, diversion, siege, camp arrival.                                | Ambush, skirmish, block bridge, alter terrain, delay scouts.                         |
| Assault          | Objective-driven waves/phases: probe, breach, theft, leader, ritual, retreat.                          | Fight, command, repair, heal, resupply, negotiate, surrender, pursue.                |
| Resolution       | Raiders defeated, withdraw, steal, capture, occupy, bargain, or complete objective.                    | Pursue, rescue, recover goods, accept terms, counterattack camp.                     |
| Aftermath        | Deaths, injuries, damage, fire, stock loss, morale, reputation, refugees, prisoners, memorial, repair. | Heal, bury, repair, rebuild, celebrate, retaliate, negotiate, change law/defence.    |
| Future state     | Camp pressure, faction memory, stronger variant, peace, occupation, story branch, village growth.      | Destroy/convert camp, establish patrol, trade, ransom, alliance, conquest.           |

## 20.1 Raid Objectives

| **Objective**          | **Attacker Behaviour**                                                                | **Defender Success Condition**                                                |
|------------------------|---------------------------------------------------------------------------------------|-------------------------------------------------------------------------------|
| Theft                  | Raiders target food, tools, mana, livestock, trade goods, project stock and withdraw. | Protect stock, recover carriers, close routes, accept limited loss.           |
| Breach / damage        | Destroy gate, tower, ward, bridge, warehouse, machine, shrine.                        | Prevent destruction, keep function, repair under pressure, defeat siege role. |
| Capture / rescue       | Take leader, mage, specialist, child, prisoner, relic bearer.                         | Protect/evacuate target, interrupt capture, rescue before withdrawal.         |
| Assassination          | Target leader, player, guard captain, healer, witness.                                | Keep target alive, expose infiltrator, control line of sight and routes.      |
| Occupation             | Hold square, gate, fort, road, warehouse, shrine.                                     | Prevent hold timer/state, counterattack, evacuate, negotiate terms.           |
| Ritual / corruption    | Reach anchor, place object, corrupt ward, summon, spread blight.                      | Disrupt actors/anchor, cleanse, maintain ward, counter ritual.                |
| Punishment / terror    | Burn, kill, destroy morale, display strength.                                         | Protect civilians, fight fire, break commander/morale, force retreat.         |
| Test / scout           | Probe defences, reveal routes, mark targets, escape with information.                 | Catch scouts, hide capacity, misdirect, improve future security.              |
| Counter-siege / relief | Break player blockade or rescue allied camp/structure.                                | Control route, maintain siege objective, defeat relief force or negotiate.    |

## 20.2 Defender Preparation Model

| **Preparation Layer** | **Examples**                                                         | **Raid Effects**                                                                           |
|-----------------------|----------------------------------------------------------------------|--------------------------------------------------------------------------------------------|
| Warning               | Tower, patrol, scout, ward, road, intelligence.                      | More preparation time, correct route information, civilian evacuation.                     |
| Physical defence      | Wall, gate, tower, barricade, ditch, bridge control, trap.           | Path, delay, cover, range, breach requirement, objective protection.                       |
| Personnel             | Guard count, skill, health, equipment, formation, commander, allies. | Combat strength, coordination, morale, posts, recovery.                                    |
| Supply                | Food, ammo, weapons, armour, medicine, repair, mana, fuel.           | Sustained defence, healing, tower fire, repairs, ward uptime.                              |
| Magic                 | Ward category, mage, mana purity, barrier, cleansing, counter.       | Reduces magical threats, supports guards, protects structures and civilians.               |
| Automation            | Warehouse routing, ammo production, alarm, repair parts, power.      | Preparation speed and sustained supply; also creates sabotage targets.                     |
| Civilian plan         | Shelter, route, capacity, emergency roles, livestock, fire response. | Casualty and morale reduction; preserves population and economy.                           |
| Knowledge             | Enemy roles, objective, weakness, route, captain, camp.              | Target priority, trap selection, equipment, dialogue, non-combat options.                  |
| Diplomacy / morality  | Reputation, tribute, hostage, prisoner, alliance, faction state.     | Raid prevention, reduced force, alternate objective, surrender terms, future consequences. |

## 20.3 Persistent Aftermath

- Every raid writes an event record containing source, warning, preparation, participants, contribution, casualties, injuries, damage, theft, prisoners, objective outcome, reputation, and follow-up hooks.

- Buildings retain damaged, burned, broken, corrupted, occupied, repaired, restored, or memorial states. NPC schedules and jobs change during recovery.

- Guard deaths can create vacancies, mourning, inheritance, migration, fear, leadership changes, memorials, and story branches. Softer settings reduce permanent consequences.

- Automated and village stock is actually consumed: ammunition fired, medicine used, armour damaged, mana spent, repair resources reserved, food distributed.

- Victories may increase confidence, wealth, reputation, recruitment, trade, faction retaliation, or threat. Defeats may cause refugees, occupation, tribute, shortages, ruins, rescue quests, or rebuilding.

- Players receive contribution credit for combat, healing, blocking, scouting, supplies, repairs, defence construction, command, rescue, objectives, and diplomacy - not only kills.

# 21. Multiplayer, PvP, Contribution and Permissions

Combat must remain understandable in solo play while supporting co-op, LAN, split-screen, followers, guards, and optional PvP. The simulation is server-authoritative for damage, status, inventory, project stock, death, structure state, and reputation. Clients may predict presentation and low-risk movement/action state to preserve responsiveness.

| **Area**         | **Locked Direction**                                                                                                                                                               |
|------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Co-op foundation | Shared actors, factions, encounters, raid state, structures, project stock, and world events; individual equipment, skills, loadouts, injuries, and selected reputation modifiers. |
| Scaling          | Moderate health/stability scaling plus roles, mechanics, adds, target pressure, objectives, and supplies rather than large health multiplication.                                  |
| Contribution     | Credit damage, healing, barriers, blocking, tanking, status support, scouting, warnings, supplies, repairs, construction, command, rescue, objectives, diplomacy, and capture.     |
| Loot             | Encounter definition chooses personal, shared, rolled, need/greed, contribution, owner, village stock, quest, or server-rule distribution.                                         |
| Friendly fire    | Separate world/server controls where practical for player direct damage, area effects, pets/followers, NPCs, structures, fire, traps, and siege.                                   |
| Revival          | Timed vulnerable revival using medicine, magic, perk, NPC, or structure support; configurable down limits and injury.                                                              |
| PvP              | World-setting controlled: off, duel only, consent, faction war, settlement war, open conflict, or custom protected zones.                                                          |
| Duels            | Consent, boundary, non-lethal/training option, wager, spectators, law, and interruption rules.                                                                                     |
| Ownership        | Weapons, stations, traps, defences, stock, project contribution, prisoners, loot, and structures respect owner/party/village/faction permissions.                                  |
| Reputation       | Shared world/faction consequences plus individual responsibility and witness memory where practical.                                                                               |
| Split-screen     | UI, lock-on, camera, damage feedback, quick items, and target readability remain independently configurable.                                                                       |
| Latency          | Server validates action timing and hit; client predicts animation, draw, trails, audio, UI, and selected movement. Reconciliation should avoid repeated visible hits.              |
| Pause            | Single-player may pause through menus by setting. Multiplayer uses real-time menus, safe interfaces, or server pause permissions.                                                  |
| Grief protection | Protected zones, structure-damage permissions, trap ownership, fire settings, PvP consent, raid/admin logs, and restoration tools.                                                 |
| Disconnect       | Safe handling for downed players, active duels, raid contribution, controlled NPCs, mounts, project stock, and dropped items.                                                      |

## 21.1 Contribution Categories

| **Category** | **Examples**                                                                    | **Reward / Record Use**                                |
|--------------|---------------------------------------------------------------------------------|--------------------------------------------------------|
| Offence      | Damage, weak point, stagger, interruption, siege component, commander defeat.   | XP, mastery, loot, quest, event summary.               |
| Defence      | Blocking, barrier, taunt/threat, guard line, civilian cover, trap interception. | Defence skill, leadership, raid credit, reputation.    |
| Support      | Healing, cleansing, revive, buff, ammo, mana, repair, fire response.            | Support skill, supplies consumed, NPC memory, rewards. |
| Preparation  | Wall, watchtower, ward, trap, ammunition, medicine, armour, scouting.           | Pre-raid contribution and changed outcome credit.      |
| Objective    | Protect, escort, rescue, capture, recover goods, stop ritual, operate gate.     | Quest/event success and role-weighted rewards.         |
| Command      | Rally, formation, retreat, post assignment, target marking, evacuation.         | Leadership progression and NPC trust.                  |
| Non-combat   | Negotiation, intimidation, surrender terms, bribe, camp conversion.             | Reputation, economy, story, reduced casualties.        |
| Recovery     | Post-battle healing, burial, repair, rebuilding, stock replacement.             | Village reputation, recovery speed, memorial/story.    |

## 21.2 PvP and Protected-World Rules

- PvP is disabled by default for cooperative worlds unless explicitly selected. Duels can remain available without enabling settlement destruction.

- World owners can separately configure direct player damage, area effects, traps, fire, structure damage, theft, inventory drop, downing, NPC collateral, and faction-war consequences.

- PvP-readable silhouettes must not be obscured by unrestricted transmog; servers can require armour-class, faction colour, nameplate, or loadout indicators.

- Player-built wards, turrets, traps, and siege devices check permissions and war state before targeting. Neutral mistakes can warn, disable, or trigger law rather than instantly kill.

- Logs should record combat source, owner, permission, structure damage, fire source, trap trigger, theft, death, and restoration-relevant state for moderation.

# 22. Difficulty, Accessibility and World Settings

Difficulty is modular rather than a single damage slider. Players can choose a named preset and then adjust threat frequency, enemy AI, telegraphs, damage, injuries, death, NPC permanence, raids, structure damage, fire, resource pressure, friendly fire, stamina, aiming, and assistance independently. Peaceful and cosy play retains building, village growth, automation, magic, exploration, stories, and non-hostile encounters.

| **Setting Group**    | **Example Options**                                                                                         | **Design Purpose**                                          |
|----------------------|-------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------|
| Enemy pressure       | Spawn rate, patrols, camp growth, raid frequency, pursuit, reinforcements.                                  | Controls how often combat interrupts the sandbox.           |
| Enemy capability     | Aggression, coordination, cover, role use, adaptation, boss mechanics, projectile accuracy.                 | Adds tactical challenge without relying only on health.     |
| Damage / durability  | Player damage taken/dealt, guard damage, gear wear, structure damage, fire, siege.                          | Controls lethality and repair burden.                       |
| Resources            | Stamina assistance, mana recovery, healing amount, ammunition, potion limits, food/temperature effects.     | Changes survival pressure and combat tempo.                 |
| Injuries / death     | Injuries off/simple/full, downed state, inventory recovery, NPC permanence, rescue window, permadeath.      | Controls consequence severity.                              |
| Village consequences | Civilian danger, NPC death, theft, occupation, settlement destruction, automatic repair, refugee effects.   | Controls civilisation-risk intensity.                       |
| Raid information     | Warning time, route markers, composition preview, objectives, pause during preparation.                     | Supports strategic planning and accessibility.              |
| Friendly fire        | Players, NPCs, pets, structures, traps, fire, area spells, siege.                                           | Prevents accidental harm or enables high-risk coordination. |
| Aim / targeting      | Aim assist, projectile lead, target lock, target cycling, weak-point assistance, snap strength.             | Supports input devices and accessibility.                   |
| Timing               | Parry/dodge windows, input buffer, action cancellation, revive time, item use.                              | Supports different reaction and motor needs.                |
| Presentation         | Telegraph intensity, colour alternatives, flashes, shake, vibration, hit-stop, damage numbers, health bars. | Improves comfort and readability.                           |
| Controls             | Hold/toggle, simplified combos, auto-sprint, sticky aim, remapping, one-handed layouts.                     | Reduces physical input burden.                              |
| Simulation           | Detailed NPC ammunition/injuries, distant abstraction, max raid size, fire spread, corpses, physics.        | Performance and complexity control.                         |
| Peaceful mode        | No hostile attacks by default; optional story battles, training, environmental danger, and opt-in raids.    | Preserves all non-combat pillars and progression routes.    |

## 22.1 Recommended Presets

| **Preset**          | **Combat Direction**                                                                                      | **Civilisation Consequences**                                                              |
|---------------------|-----------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------|
| Peaceful Builder    | Hostile spawns/raids off or opt-in; generous resources; combat training remains.                          | No involuntary NPC death/destruction; settlement stories and defence projects still exist. |
| Cosy Adventure      | Low pressure, strong warnings, forgiving damage, simple injuries, generous recovery.                      | Raids are rare and recoverable; named NPCs usually incapacitated rather than killed.       |
| Standard            | Moderate pressure/lethality, full roles, readable telegraphs, tombstone recovery, NPC permanence default. | Preparation matters; settlements can be damaged, injured, robbed, or rarely destroyed.     |
| Harsh Frontier      | Higher pressure, coordination, injuries, scarcity, structure/fire risk, shorter warnings.                 | Deaths, refugees, occupation, long repairs, and faction retaliation are more likely.       |
| Civilisation Crisis | Raid/faction/world-event focus with strong siege, supply, politics, and settlement loss.                  | Regional wars and civilisation survival dominate while personal combat remains bounded.    |
| Custom              | Every subsystem adjustable.                                                                               | Players define desired combination without losing access to content where practical.       |

## 22.2 Accessibility Requirements

- Every critical telegraph should use at least two channels where practical: visual plus sound, vibration, UI, animation, or environmental cue.

- Colour-coded damage, status, faction, and weak-point information needs colourblind-safe palettes, symbols, patterns, labels, or audio alternatives.

- Camera shake, head bob, hit-stop, motion blur, depth of field, flashes, chromatic effects, screen blood, and vibration are individually adjustable.

- Parry and dodge windows, aim assistance, stamina assistance, enemy speed, damage, telegraph time, and input buffering can be adjusted without disabling progression rewards by default.

- Simplified input mode may combine heavy/alternate actions contextually, automate repeated basic attacks, or reduce simultaneous button requirements.

- Subtitles identify speaker/source and important combat sounds such as alarm, reload, spell charge, weak-point break, surrender, and off-screen attack.

- UI scale, reticle, lock-on indicator, damage direction, status size, health bars, and target outlines are adjustable independently.

# 23. UI, Readability, Codex and Player Feedback

Combat UI should communicate immediate danger and decisions without permanently covering the voxel world. Information expands when relevant: drawing a weapon, aiming, receiving damage, locking a target, entering a raid, opening a gear screen, inspecting an enemy, or requesting an advanced breakdown.

| **UI Element**     | **Required Information**                                                                         | **Display Rules**                                                                              |
|--------------------|--------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------|
| Player resources   | Health, stamina, mana, barrier, critical status, injury warning.                                 | Contextual fading; accessibility can keep persistent.                                          |
| Target information | Name/type, hostility, health, stability/guard, important status, boss component.                 | Configurable: always, first hit, lock-on, discovered, boss only, minimal.                      |
| Reticle / aim      | Spread, draw/charge, trajectory hint, range, valid target, friendly/structure warning.           | Weapon- and setting-dependent; no misleading universal crosshair.                              |
| Action feedback    | Stamina/mana cost, cooldown, unavailable reason, combo branch, parry/dodge cue.                  | Concise icons and optional expanded tooltip/training mode.                                     |
| Damage feedback    | Direction, type, blocked/parried/resisted/immune/critical, status buildup.                       | Multiple channels; numbers optional.                                                           |
| Equipment HUD      | Current sets, grip, ammunition, quiver, quick item, durability warning, focus charge.            | Shows only relevant slots during combat.                                                       |
| Raid HUD           | Warning, source, route confidence, time, phase, objectives, civilians, key defences, supplies.   | Compact default plus village/command overview.                                                 |
| Guard command UI   | Selected group, order, post, morale, ammo/health, route, authority.                              | Context wheel and map/overview for authorised players.                                         |
| Structure feedback | Health/state, operator, ammo/power, coverage, repair need, ownership.                            | Visible on inspection, command overlay, or when damaged.                                       |
| Contribution       | Optional summary of combat, support, supplies, repairs, objectives, rescue.                      | After encounter/raid, not constant score spam.                                                 |
| Death / downed     | Timer, revive options, attacker, recoverable inventory, map marker.                              | Clear and accessible; avoids obscuring nearby rescue context.                                  |
| Crime / social     | Warning, law, witness, surrender, trespass, forbidden magic, reputation consequence.             | Before irreversible action where the character would reasonably know.                          |
| Codex              | Weapon family, enemy role, weakness, status, defence, boss, faction tactics, source uncertainty. | Information unlocks through observation, combat, books, NPC teaching, research, or dissection. |
| Combat log         | Optional detailed source, calculation summary, status, durability, friendly fire, objective.     | Off by default for immersive play; useful for debugging and advanced players.                  |

## 23.1 Inspection and Comparison

| **View**        | **Key Fields**                                                                                                                                                        |
|-----------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Weapon card     | Family, material, tier, rarity, quality, damage profile, attack speed/commitment, reach, stamina, penetration, stability, load, durability, sockets, moveset, repair. |
| Armour card     | Slot/class, armour by family, resistance, stability, load, movement/noise/mana/temperature, durability, set, sockets, repair.                                         |
| Shield card     | Coverage, block angle, stability, stamina efficiency, parry, bash, projectile/magic, load, durability, special.                                                       |
| Ammunition card | Compatible weapons, damage/status/penetration, speed/arc, recovery, structure tags, stack, crafting, quiver rules.                                                    |
| Spell card      | School, tier, mana, focus/component, cast time, movement, targeting, damage/effect, buildup, interruption, terrain, legal risk.                                       |
| Enemy codex     | Habitat, role, senses, armour, resistance, weak points, statuses, morale, drops, village/ward/automation interaction, confidence level.                               |
| Defence card    | Role, block/structure ID, coverage/range, operators, ammunition/power, warning, health/state, counters, repair, permissions.                                          |
| Raid overview   | Known source, confidence, route, objectives, force roles, time, defence readiness, supply, civilians, commands, missing intelligence.                                 |

## 23.2 Feedback Vocabulary

| **Outcome**       | **Feedback Examples**                                                                        |
|-------------------|----------------------------------------------------------------------------------------------|
| Blocked           | Shield/weapon impact, stamina pulse, reduced damage colour/icon, stability shake.            |
| Parried           | Distinct sound/flash, attacker recoil, critical-opening icon, short hit-stop.                |
| Dodged            | Near-miss audio, optional perfect-evade cue, projectile trail, no false hit response.        |
| Armour resisted   | Material impact, glancing effect, resisted label/icon, armour condition tick.                |
| Weak point        | Distinct hit effect, component response, codex marker, higher-impact audio.                  |
| Immune            | Clear immunity symbol and reason hint when known; no misleading damage number.               |
| Status threshold  | Body/environment effect, meter burst, icon, voice/audio, treatment suggestion if discovered. |
| Structure damage  | Cracks, debris, smoke/fire, state label, alarm, repair marker, NPC reaction.                 |
| Low supplies      | Quiver/armory/ward/tower warning, NPC callout, ledger alert, reduced firing behaviour.       |
| Morale change     | Banner/voice/formation response, retreat/surrender cues, command UI.                         |
| Raid phase        | Bell, banner, objective update, environmental cue, commander callout, map change.            |
| Legal consequence | Witness indicator, guard warning, law text, reputation preview, surrender option.            |

# 24. Technical Architecture, Simulation LOD, Modding and Debugging

The combat system should be modular and data-driven from the POC. Unreal Engine or another future implementation may use components, data assets, gameplay tags, interfaces, ability/action definitions, event buses, and subsystem registries, but this document remains engine-agnostic. The design priority is clean relationships between Blocks, Items, Recipes, Creatures, NPCs, Magic, Structures, Quests, Factions, Dimensions, and Combat records.

| **Technical Layer**      | **Responsibilities**                                                                                                                  |
|--------------------------|---------------------------------------------------------------------------------------------------------------------------------------|
| Combat actor component   | Resources, faction, equipment interface, status container, damage receiver, stability, death/downed/surrender, replication.           |
| Action/ability component | Action validation, costs, phases, input/AI activation, cooldown, animation events, cancel/buffer, prediction.                         |
| Equipment component      | Slots, load, grip, weapon sets, item instances, durability, sockets, modifiers, visuals, permissions.                                 |
| Damage service           | Build/resolve packets, defence order, armour/resistance, weak points, friendly fire, structure tags, contribution, logs.              |
| Status service           | Buildup, threshold, stacking, duration, immunity, cleanse, periodic ticks, persistence, LOD.                                          |
| Projectile service       | Spawn/pool, trajectory, collision, ownership, recovery/embed, payload, networking, distant abstraction.                               |
| AI combat controller     | Perception, role, target scoring, objective, formation, morale, cover, communication, retreat/surrender.                              |
| Encounter director       | Composition, spawn/arrival, objective, escalation, rewards, cleanup, save state, quest/event link.                                    |
| Raid director            | Pressure, source, intelligence, warning, routes, force budget, phases, objectives, supply, settlement state, aftermath.               |
| Defence network          | Towers, gates, wards, traps, alarms, armories, operators, range/coverage, supply, ownership, damage/repair.                           |
| Reputation/crime hook    | Witnesses, laws, aggression, surrender, casualties, theft, forbidden magic, faction/individual memory.                                |
| Contribution ledger      | Combat, support, supply, construction, repairs, command, objective, rescue, diplomacy.                                                |
| Save data                | Persistent actor injuries/death, gear state, structures, traps, raid/event records, prisoners, stock, reputation.                     |
| LOD manager              | Near detailed actions/projectiles/items/NPCs; mid simplified combat groups; distant strategic resolution.                             |
| Debug tools              | Damage inspector, AI role/target overlay, perception cones, action state, tags, projectile path, raid route, supply, structure state. |
| Modding/data import      | Stable IDs, schemas, tags, parent definitions, validation, compatibility rules, spreadsheet/JSON import, version migration.           |

## 24.1 Simulation Levels of Detail

| **LOD**             | **Simulation**                                                                                                                      | **Preserved State**                                                                                   |
|---------------------|-------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------|
| Near / visible      | Full actions, hit volumes, projectiles, statuses, inventory ammunition, formations, structure blocks, animation, physics.           | Exact health/resources, injuries, item condition, position, action state, damage, ownership.          |
| Local / off-screen  | Simplified action cycles, role scoring, reduced projectile simulation, grouped navigation, real key supplies.                       | Actor health/injury, equipment state, objectives, structures, important NPC death, stock.             |
| Regional            | Squad/settlement combat strength using roles, gear bands, supply, morale, defence, leaders, magic, route, event rolls.              | Named participants, casualties/injuries, resources, damage states, objective, event record.           |
| Distant / strategic | Event progression ticks and risk resolution; no per-swing simulation.                                                               | Settlement/faction state, pressure, stock categories, project/defence state, key NPCs, world history. |
| Rehydration         | Abstract results instantiate damaged structures, missing/returned actors, injuries, loot, prisoners, fire/corruption, repair tasks. | Consistency between strategic result and visible world.                                               |

## 24.2 Registry Validation Rules

- Every weapon references a valid item, family, material/quality model, moveset, damage profile, repair method, and animation/visual category.

- Every attack specifies costs, phases, target rules, hit method, damage/effect packet, defence tags, feedback, and AI usability where applicable.

- Every status specifies buildup/application, stack model, duration, tick, counters, immunity tags, UI, VFX/audio, persistence, and dispel category.

- Every defence references its block/structure, operator requirements, supply/power, coverage/range, attack/ward functions, damage states, repair, ownership, and LOD.

- Every encounter and raid has an origin/context, objectives, eligible actors, failure/success, world-state output, rewards, cleanup, and save policy.

- Cross-registry references use stable internal IDs. Display names can change without breaking saves or recipes.

- Planning status, draft balance, notes, and document ownership remain authoring metadata rather than inherited runtime properties.

# 25. Proof-of-Concept Combat, Gear and Defence Scope

The POC must prove the minimum connected combat promise: a player can gather and craft basic gear, learn readable melee/ranged/magic actions, supply and prepare named village defenders, build the watchtower and ward support, receive warning, survive an objective-driven Briarhook goblin raid, and see different casualties, structure damage, resource use, reputation, and village history based on preparation. It does not need the full final combat catalogue.

| **POC Layer**     | **Required Content**                                                                                                                                 | **Deferred Beyond POC**                                                        |
|-------------------|------------------------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------|
| Player actions    | Light/heavy melee, block, shield bash, basic parry, load-based dodge, sprint, aim/draw/release, quick poultice, one combat spell, one utility spell. | Large combo trees, mounted/aerial combat, advanced grappling, all weapon arts. |
| Resources         | Health, stamina, mana, stability, equipment load, barrier/ward interaction.                                                                          | Deep exhaustion, many injury tiers, complex mana forms.                        |
| Melee gear        | Iron arming sword or spear, wooden shield, apprentice staff; simple family mastery.                                                                  | Full material ladder, dual wield, polearms, cultural schools.                  |
| Ranged gear       | Hunter bow, simple arrows, optional fire/ward arrow teaser, quiver.                                                                                  | Crossbows, slings, magitech launchers, full special ammunition.                |
| Armour            | Leather/light set and one guard/iron piece or loadout; durability and repair.                                                                        | All armour classes, transmog, deep sets, full socket ecosystem.                |
| Healing/status    | Poultice/bandage, healing item, burning or bleeding, stagger, inspired/warded, simple injury toggle.                                                 | Full alchemy, disease, limb injuries, many interactions.                       |
| Enemies           | Briarhook goblin raider, skirmisher/archer, brute or shield role, captain mini-boss; cave threat and wisp use existing creature scope.               | Full faction roster, siege engines, major bosses.                              |
| NPC defenders     | Named guard, tower archer or guard role, mage/ward support, builder repair/emergency behaviour.                                                      | Full formations, militia recruitment, large command hierarchy.                 |
| Defences          | Watchtower, basic gate/barricade, alarm, one trap, ward lantern/stone, village warehouse/armory supply.                                              | Walls around full settlement, siege weapons, golem turrets.                    |
| Raid              | Warning, approach, assault, theft/breach objective, captain arrival, retreat/resolution, persistent aftermath.                                       | Regional war, occupation system, multi-settlement siege.                       |
| World consequence | Real ammo/medicine/mana/repair stock, injuries/death setting, damaged structures, stolen stock, reputation and event record.                         | Generational aftermath, refugees, faction war escalation.                      |
| UI                | Resource HUD, target feedback, ammunition, durability warning, raid alert/objective, defence readiness, aftermath summary.                           | Full commander map, complex codex and analytics.                               |
| Technical         | Data definitions, stable IDs, action/damage/status flow, basic AI roles, save/restore, near simulation.                                              | Regional strategic resolution and full multiplayer optimisation.               |

## 25.1 POC Required Gear Set

| **ID**                         | **Display Name**      | **Role**                                | **POC Notes**                                                  |
|--------------------------------|-----------------------|-----------------------------------------|----------------------------------------------------------------|
| gear.weapon.iron_arming_sword  | Iron Arming Sword     | Versatile one-handed melee.             | Light chain, thrust/heavy, weapon block, repair with iron.     |
| gear.weapon.iron_hunting_spear | Iron Hunting Spear    | Reach, thrust, brace.                   | May replace or complement sword depending production capacity. |
| gear.shield.wooden_heater      | Wooden Heater Shield  | Basic block, bash, projectile coverage. | Readable durability and guard break.                           |
| gear.ranged.hunter_bow         | Hunter Bow            | Physical ranged weapon.                 | Draw, arc, movement accuracy, ammo recovery.                   |
| gear.ammo.simple_arrow         | Simple Arrow          | Standard ammunition.                    | Crafted in batches; physical inventory and quiver.             |
| gear.container.simple_quiver   | Simple Quiver         | Ammunition capacity/selection.          | Back or integrated POC slot.                                   |
| gear.focus.apprentice_staff    | Apprentice Rune Staff | Melee/focus hybrid.                     | One combat spell, one utility interaction, ward link.          |
| gear.armour.leather_tunic      | Leather Tunic         | Light chest armour.                     | Movement/noise/load and durability demonstration.              |
| gear.armour.leather_cap        | Leather Cap           | Light head protection.                  | Headshot/slot demonstration if included.                       |
| gear.armour.leather_boots      | Leather Boots         | Light mobility gear.                    | Terrain/noise field, simple POC effect.                        |
| item.medicine.healing_poultice | Healing Poultice      | Interruptible recovery.                 | Restores health over time and stops simple bleed.              |
| item.tool.field_repair_kit     | Field Repair Kit      | Limited repair.                         | Stabilises weapon/shield/armour; full repair at station.       |
| item.magic.basic_ward_token    | Basic Ward Token      | Defence/magic support.                  | Optional accessory or village contribution.                    |
| gear.guard.iron_guard_kit      | Iron Guard Kit        | NPC guard supply bundle.                | Weapon/armour condition and armory stock demonstration.        |

## 25.2 POC Combatants and Roles

| **Combatant**                 | **Role**                             | **Core Behaviours**                                                                                | **Outcome Links**                                   |
|-------------------------------|--------------------------------------|----------------------------------------------------------------------------------------------------|-----------------------------------------------------|
| Player                        | Flexible fighter/support.            | Melee, block/dodge, bow, staff spell, heal, repair, command/context.                               | Skill, gear, contribution, death/recovery.          |
| Riverward Guard               | Frontline defender.                  | Hold gate/barricade, block, strike, protect civilians, retreat when injured.                       | Equipment, food, medicine, morale, death/injury.    |
| Tower Guard / Archer          | Warning and ranged defence.          | Detect approach, sound alarm, fire from tower, request ammo.                                       | Watchtower project and ammunition stock.            |
| Village Mage                  | Ward/support.                        | Power ward, barrier or combat spell, heal/cleanse, retreat if mana low.                            | Mana stock, rune discovery, village trust.          |
| Village Builder               | Emergency repair.                    | Repair barricade/gate/watchtower, carry materials, flee when threatened.                           | Repair stock and project completion.                |
| Briarhook Raider              | Melee thief/assault.                 | Skirmish, target stock/isolated actors, retreat with goods.                                        | Warehouse loss and camp pressure.                   |
| Briarhook Archer              | Ranged pressure.                     | Use cover, target tower/mage/exposed defenders, limited ammo abstraction.                          | Tower cover and target priority.                    |
| Briarhook Brute / Shield      | Breach/frontline.                    | Pressure barricade/gate, high stability, protect captain/raiders.                                  | Structure condition and blunt/penetration test.     |
| Briarhook Captain             | Mini-boss/commander.                 | Rally, objective shift, strong telegraphs, phase on losses/objective, retreat/surrender condition. | Raid resolution, trophy, faction memory.            |
| Wisp                          | Magical threat/supporting encounter. | Mana attraction, ward response, spirit damage/visibility.                                          | Proves magic defence category.                      |
| Cave Spider / Crystal Crawler | Exploration combat.                  | Ambush or armour/weak-point test.                                                                  | Proves non-raid combat and creature resource drops. |

## 25.3 POC Draft Balance Values

| **Balance draft:** The following values are testing targets only. They are not final promises and must be tuned through time-to-defeat, stamina, animation, AI, multiplayer, and raid outcome tests. |
|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

| **Entry**             | **Draft Value / Range**                                   | **Testing Intent**                                                              |
|-----------------------|-----------------------------------------------------------|---------------------------------------------------------------------------------|
| Player health         | 100                                                       | Readable baseline for all POC attacks and healing.                              |
| Player stamina        | 100                                                       | Supports 4-7 meaningful combat actions before full depletion depending on load. |
| Player mana           | 60                                                        | Supports several basic casts but not continuous spell replacement.              |
| Light sword hit       | 20-24 physical                                            | Basic raider defeated in roughly 3-4 clean hits before armour/quality.          |
| Heavy sword/thrust    | 30-38 physical + stability                                | Clear commitment and opening value.                                             |
| Spear light thrust    | 16-20 physical                                            | Range advantage with lower close pressure.                                      |
| Bow body hit          | 17-22 physical                                            | Physical ammo and precision; weak point increases value.                        |
| Basic combat spell    | 18-26 magical                                             | Comparable to ranged weapon with mana/status/ward advantages.                   |
| Wooden shield         | 30-40 stability support                                   | Can block basic raider chain but breaks under brute/captain pressure.           |
| Leather armour        | 10-15 aggregate physical armour                           | Noticeable but does not erase damage.                                           |
| Healing poultice      | 20-30 health over 3-5 seconds                             | Useful under cover or after disengage, interruptible.                           |
| Goblin raider health  | 45-65                                                     | Quick readable common enemy with role variation.                                |
| Goblin brute health   | 90-130 + armour/stability                                 | Requires penetration, blunt, focus fire, or control.                            |
| Goblin captain health | 180-260 + phase/stability                                 | Mini-boss duration comes from mechanics/leadership, not health alone.           |
| POC raid force        | 4-8 raiders plus captain depending preparation/difficulty | Enough to show roles and village support without full siege scale.              |
| Watchtower warning    | 45-120 seconds or equivalent preparation phase            | Clearly changes readiness compared with no tower.                               |
| Tower range bonus     | 25-50% effective sight/fire range                         | Visible benefit subject to terrain and ammunition.                              |
| Ward duration         | Powered through stored mana during raid                   | Supply chain directly affects magical defence uptime.                           |

## 25.4 POC Success Metrics

| **Metric**              | **Success Condition**                                                                                                                         |
|-------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------|
| Responsiveness          | Players understand input timing, attacks connect visibly, defensive actions feel reliable, and camera options remain usable.                  |
| Weapon identity         | Sword/spear, bow, shield, and staff require meaningfully different positioning, resources, and decisions.                                     |
| Preparation impact      | At least three preparation layers - watchtower, supplies, ward/defence, guard gear, traps or repairs - measurably change raid outcome.        |
| Civilisation connection | Village stock is consumed, NPCs use real gear/ammo/medicine/mana, and post-battle needs appear.                                               |
| World consequence       | Structures retain damage; NPC injuries/death follow settings; theft, reputation, and event history persist.                                   |
| Alternative play        | Player can contribute through fighting, ranged support, magic, supply, repair, command, rescue, or prevention.                                |
| Readability             | Enemy role, telegraph, status, guard state, defence state, and raid objective can be understood without reading debug data.                   |
| Balance                 | Standard raid is tense but winnable with reasonable preparation; unprepared victory is possible through high skill but produces greater cost. |
| Performance             | The compact village raid maintains the target frame/network budget while simulating visible actors, projectiles, structures, and effects.     |
| Data scalability        | New weapon, enemy role, status, defence, and raid variant can be added primarily through data rather than rewriting core systems.             |

# 26. Detailed Combat Action Registry v0.1

This registry is the combat-facing action foundation. IDs are database-friendly planning IDs. Costs and values are first-pass draft bands; implementation should reference shared damage, effect, movement, animation, input, AI, and item records rather than duplicate them.

| **ID**                                   | **Display Name**           | **Type / Family**     | **Cost / Timing**       | **Core Result**                                                    | **Scope**      |
|------------------------------------------|----------------------------|-----------------------|-------------------------|--------------------------------------------------------------------|----------------|
| combat.action.unarmed_jab                | Unarmed Jab                | Melee / unarmed       | Low stamina; fast       | Short blunt strike; low stability damage.                          | POC            |
| combat.action.unarmed_shove              | Shove                      | Control / unarmed     | Low-moderate; fast      | Pushes light targets; interrupts weak actions; non-lethal support. | POC            |
| combat.action.sword_light_1              | Arming Sword Cut I         | Melee / sword         | Low; fast               | Balanced slash and first combo branch.                             | POC            |
| combat.action.sword_light_2              | Arming Sword Cut II        | Melee / sword         | Low; fast               | Follow-up cut with lateral movement.                               | POC            |
| combat.action.sword_heavy_thrust         | Committed Thrust           | Melee / sword         | Moderate; committed     | Pierce, penetration and weak-point focus.                          | POC            |
| combat.action.sword_guard_counter        | Sword Guard Counter        | Defence / sword       | Block impact + moderate | Counter after successful guarded impact.                           | Alpha          |
| combat.action.axe_light_chop             | Axe Chop                   | Melee / axe           | Moderate; medium        | Slash/chop, wood/guard pressure.                                   | Alpha          |
| combat.action.axe_heavy_split            | Splitting Blow             | Melee / axe           | High; slow              | High stability and shield/structure tag.                           | Alpha          |
| combat.action.hammer_crush               | Hammer Crush               | Melee / hammer        | High; slow              | Blunt, armour and stability damage.                                | Alpha          |
| combat.action.dagger_quick_chain         | Dagger Quick Chain         | Melee / dagger        | Very low; fast          | Short fast chain; coating/status support.                          | Alpha          |
| combat.action.dagger_context_backstab    | Dagger Backstab            | Critical / dagger     | Moderate; contextual    | High critical against eligible unaware/staggered target.           | Alpha          |
| combat.action.spear_light_thrust         | Spear Thrust               | Melee / spear         | Low-moderate; medium    | Long precision pierce; poor at point-blank range.                  | POC            |
| combat.action.spear_sweep                | Spear Sweep                | Melee / spear         | Moderate; medium        | Wide low-impact control and spacing.                               | POC optional   |
| combat.action.spear_brace                | Brace Spear                | Defence / spear       | Stamina reserve; hold   | Counters charge/large target from prepared facing.                 | Alpha          |
| combat.action.staff_sweep                | Staff Sweep                | Melee / staff         | Low-moderate; medium    | Blunt control, spacing, focus-compatible.                          | POC            |
| combat.action.staff_channel_bolt         | Rune Bolt                  | Magic / staff         | Mana; short cast        | Basic magic projectile and ward/spirit tag.                        | POC            |
| combat.action.staff_ward_pulse           | Ward Pulse                 | Magic / staff         | Mana; cooldown          | Short defensive pulse against tagged threats.                      | POC            |
| combat.action.weapon_block               | Weapon Block               | Defence / weapon      | Impact stamina          | Partial angle/coverage defence; family efficiency.                 | POC            |
| combat.action.shield_block               | Shield Guard               | Defence / shield      | Impact stamina          | High frontal mitigation and stability response.                    | POC            |
| combat.action.shield_bash                | Shield Bash                | Melee / shield        | Moderate; fast          | Blunt/stability, short reach, can interrupt.                       | POC            |
| combat.action.shield_parry               | Shield Parry               | Defence / shield      | Low + timing            | Negates/reduces eligible attack and opens counter.                 | POC            |
| combat.action.weapon_parry               | Weapon Parry               | Defence / weapon      | Low + tight timing      | Family-specific precision defence.                                 | Alpha          |
| combat.action.dodge_step_light           | Light Evade Step           | Movement / evade      | Moderate stamina        | Fast positional evade for light load.                              | POC            |
| combat.action.dodge_roll_standard        | Standard Combat Roll       | Movement / evade      | Moderate-high           | Balanced evade for standard load.                                  | POC            |
| combat.action.dodge_heavy_step           | Heavy Guard Step           | Movement / evade      | High; short             | Short displacement for heavy load.                                 | Alpha          |
| combat.action.sprint_attack              | Momentum Attack            | Melee / family        | Moderate-high           | Family-specific initiation using sprint momentum.                  | Alpha          |
| combat.action.bow_draw                   | Draw Hunter Bow            | Ranged / bow          | Stamina hold            | Builds draw, accuracy and projectile force.                        | POC            |
| combat.action.bow_release                | Release Arrow              | Ranged / bow          | Ammo + draw             | Spawns physical projectile using draw state.                       | POC            |
| combat.action.bow_quick_shot             | Quick Shot                 | Ranged / bow          | Ammo + higher spread    | Low-draw emergency release.                                        | POC            |
| combat.action.throw_item                 | Throw Compatible Item      | Thrown / utility      | Item + stamina          | Throws knife, stone, bomb, potion, net or rune by profile.         | Alpha          |
| combat.action.use_poultice               | Apply Healing Poultice     | Healing / item        | Item; 3-5 sec           | Interruptible health-over-time and simple bleed treatment.         | POC            |
| combat.action.field_repair               | Field Stabilise Gear       | Utility / repair      | Kit; 4-8 sec            | Restores limited condition; no full quality restoration.           | POC            |
| combat.action.revive_ally                | Revive Downed Ally         | Support / multiplayer | Item/mana; timed        | Returns eligible ally with partial health and injury risk.         | Alpha          |
| combat.action.rally                      | Rally Nearby Defenders     | Command / leadership  | Cooldown / authority    | Improves NPC morale and formation response.                        | POC simplified |
| combat.action.order_hold                 | Order: Hold Position       | Command               | Authority               | Assigns guard/group to defend post/objective.                      | POC simplified |
| combat.action.order_retreat              | Order: Retreat and Rally   | Command               | Authority               | Withdraws eligible defenders to rally point.                       | Alpha          |
| combat.action.surrender                  | Yield / Surrender          | Social / defeat       | Contextual              | Requests non-lethal resolution, capture or terms.                  | POC optional   |
| combat.action.capture                    | Restrain Defeated Target   | Interaction           | Restraint + context     | Creates prisoner/captive state for eligible target.                | Alpha          |
| combat.action.context_critical           | Context Critical           | Critical / contextual | Moderate; opening       | Weapon-specific critical against eligible opening.                 | Alpha          |
| combat.action.operate_watchtower         | Man Watchtower             | Defence operation     | Post + ammo             | Uses tower range, warning and firing position.                     | POC            |
| combat.action.emergency_repair_structure | Emergency Structure Repair | Defence / builder     | Materials + time        | Restores function/health to tagged defence under pressure.         | POC NPC        |
| combat.action.extinguish_fire            | Extinguish Local Fire      | Defence / utility     | Water/tool/magic        | Reduces fire state and spread on target blocks.                    | Alpha          |

## 26.1 Combat Action Database Fields

| **Field Group** | **Required Fields**                                                                                               |
|-----------------|-------------------------------------------------------------------------------------------------------------------|
| Identity        | action_id, display_name, description, category, family, tags, scope, version, owner_document.                     |
| Activation      | input_intent, AI_intent, required_item_tags, required_state, forbidden_state, authority, target_mode.             |
| Timing          | startup, active, recovery, hold, channel, follow_up_windows, buffer_window, cancel_rules, cooldown.               |
| Costs           | stamina, mana, item/ammunition, durability, charge, health, corruption, reserved_resource.                        |
| Movement        | root/slow, displacement, turn_rate, aim, gravity, step, sprint/jump/mounted support.                              |
| Attack / effect | attack_profile_ids, effect_ids, projectile_id, status_ids, structure_tags, friendly_fire, hit_limit.              |
| Defence         | block/parry/dodge tags, armour/stability modifiers, invulnerability window, barrier use.                          |
| Feedback        | animation, montage/event, camera, sound, VFX, hit-stop, vibration, UI icon, warning, subtitle cue.                |
| AI              | range preference, role weights, target conditions, risk, coordination, interrupt priority, retreat/surrender use. |
| Networking      | authority, prediction, reconciliation, replication events, rollback tolerance, anti-cheat validation.             |
| Balance         | tier, draft damage/effect, expected use, time-to-action, counters, difficulty modifiers, test cases.              |

# 27. Detailed Gear Registry v0.1

The following entries define a representative v0.1 combat catalogue and POC subset. They link to the Items Registry and use the locked resource ladder. Exact recipes remain in the Crafting and Recipe Registry; combat fields define handling and defence.

| **ID**                              | **Display Name**        | **Category**        | **Tier / Material**  | **Primary Identity**                                    | **Scope**    |
|-------------------------------------|-------------------------|---------------------|----------------------|---------------------------------------------------------|--------------|
| gear.weapon.crude_club              | Crude Wooden Club       | Melee / mace        | Wood                 | Cheap blunt/stability; poor durability.                 | POC optional |
| gear.weapon.stone_knife             | Stone Utility Knife     | Melee / dagger/tool | Stone                | Early cutting, stealth utility, low reach.              | POC optional |
| gear.weapon.copper_hatchet          | Copper Hatchet          | Melee / axe/tool    | Copper               | Early axe, wood pressure, soft metal wear.              | POC optional |
| gear.weapon.bronze_spear            | Bronze Spear            | Melee / spear       | Bronze side tier     | Durable reach/hunting and militia use.                  | Alpha        |
| gear.weapon.iron_arming_sword       | Iron Arming Sword       | Melee / sword       | Iron                 | Balanced one-handed combat and guard weapon.            | POC          |
| gear.weapon.iron_hunting_spear      | Iron Hunting Spear      | Melee / spear       | Iron                 | Reach, precision, hunting, brace teaser.                | POC          |
| gear.weapon.iron_war_axe            | Iron War Axe            | Melee / axe         | Iron                 | Guard pressure, wood/structure effectiveness.           | Alpha        |
| gear.weapon.iron_mace               | Iron Mace               | Melee / mace        | Iron                 | Armour/stability and construct pressure.                | Alpha        |
| gear.weapon.steel_long_sword        | Steel Longsword         | Melee / sword       | Steel                | Two-hand option, high durability and control.           | Alpha        |
| gear.weapon.steel_warhammer         | Steel Warhammer         | Melee / hammer      | Steel                | Heavy armour/structure/stability specialist.            | Alpha        |
| gear.weapon.silver_ritual_blade     | Silver Ritual Blade     | Melee / dagger      | Silver side material | Spirit/undead/ritual utility; lower mundane durability. | Alpha        |
| gear.weapon.mana_crystal_staff      | Mana Crystal Staff      | Focus / staff       | Mana Crystal         | Casting capacity, warding and physical sweep.           | Alpha        |
| gear.weapon.arcane_alloy_spellblade | Arcane Alloy Spellblade | Hybrid / sword      | Arcane Alloy         | Rune modes, physical/magical hybrid.                    | Final        |
| gear.weapon.mythril_glaive          | Mythril Glaive          | Melee / polearm     | Mythril              | Lightweight reach, precision and enchantment.           | Final        |
| gear.weapon.voidstone_cleaver       | Voidstone Rift Cleaver  | Melee / axe         | Voidstone            | Dimensional shear, corruption/stability risk.           | Final        |
| gear.ranged.simple_sling            | Simple Sling            | Ranged / sling      | Fibre/leather        | Cheap stones and alchemical payloads.                   | Alpha        |
| gear.ranged.hunter_bow              | Hunter Bow              | Ranged / bow        | Wood/fibre           | Mobile draw precision, hunting and special arrows.      | POC          |
| gear.ranged.iron_crossbow           | Iron Crossbow           | Ranged / crossbow   | Iron/copper          | Prepared penetration shot; guard/tower use.             | Alpha        |
| gear.ranged.arcane_repeater         | Arcane Crystal Repeater | Ranged / magitech   | Arcane Alloy         | Charged rune projectiles and module slots.              | Final        |
| gear.ammo.simple_arrow              | Simple Arrow            | Ammunition          | Wood/stone/iron tip  | Standard recoverable arrow.                             | POC          |
| gear.ammo.iron_broadhead            | Iron Broadhead Arrow    | Ammunition          | Iron                 | High unarmoured damage and bleeding buildup.            | Alpha        |
| gear.ammo.armour_piercing_bolt      | Armour-Piercing Bolt    | Ammunition          | Steel                | Crossbow penetration and component damage.              | Alpha        |
| gear.ammo.ward_arrow                | Basic Ward Arrow        | Ammunition / magic  | Mana/rune            | Spirit/ward interaction; low direct physical role.      | POC teaser   |
| gear.container.simple_quiver        | Simple Quiver           | Back / ammunition   | Leather/fibre        | Arrow capacity and quick cycle.                         | POC          |
| gear.shield.improvised_board        | Improvised Board Shield | Shield              | Wood                 | Emergency low durability defence.                       | POC optional |
| gear.shield.wooden_heater           | Wooden Heater Shield    | Shield              | Wood/iron rim        | Basic coverage, block, bash and projectile test.        | POC          |
| gear.shield.iron_guard              | Iron Guard Shield       | Shield              | Iron                 | Higher stability and formation use.                     | Alpha        |
| gear.shield.rune_buckler            | Rune Buckler            | Shield / magic      | Mana/iron            | Fast parry and limited magical barrier.                 | Alpha        |
| gear.shield.steel_tower             | Steel Tower Shield      | Shield              | Steel                | Maximum frontal coverage and formation defence.         | Final        |
| gear.focus.apprentice_staff         | Apprentice Rune Staff   | Focus / staff       | Wood/mana shard      | POC combat/utility spells and ward interaction.         | POC          |
| gear.focus.copper_wand              | Copper Conduit Wand     | Focus               | Copper/mana          | Fast precise rune/arcane casting.                       | Alpha        |
| gear.focus.riverward_tome           | Riverward Ward Tome     | Focus / book        | Culture knowledge    | Prepared ward/support formulae.                         | Alpha        |
| gear.armour.leather_cap             | Leather Cap             | Armour / head       | Leather / light      | Basic head protection and low load.                     | POC          |
| gear.armour.leather_tunic           | Leather Tunic           | Armour / chest      | Leather / light      | Basic mitigation, mobility and durability.              | POC          |
| gear.armour.leather_boots           | Leather Boots           | Armour / feet       | Leather / light      | Noise/terrain/mobility demonstration.                   | POC          |
| gear.armour.padded_coat             | Padded Frontier Coat    | Armour / chest      | Cloth / light-medium | Warmth, blunt padding and village style.                | Alpha        |
| gear.armour.iron_guard_helm         | Iron Guard Helm         | Armour / head       | Iron / medium-heavy  | Guard protection and social identity.                   | POC NPC      |
| gear.armour.iron_mail_shirt         | Iron Mail Shirt         | Armour / chest      | Iron / medium        | Slash protection with flexible movement.                | Alpha        |
| gear.armour.steel_cuirass           | Steel Cuirass           | Armour / chest      | Steel / heavy        | High physical armour/stability and load.                | Final        |
| gear.armour.apprentice_robe         | Apprentice Mage Robe    | Armour / robe       | Cloth/rune           | Mana and ward support, low physical defence.            | POC mage     |
| gear.armour.mythril_weave           | Mythril Weave Mantle    | Armour / hybrid     | Mythril              | Light magical defence and high enchantment capacity.    | Final        |
| gear.back.frontier_backpack         | Frontier Backpack       | Back / storage      | Leather/cloth        | Inventory expansion with load and back-slot trade-off.  | POC optional |
| gear.cloak.riverward_watchcloak     | Riverward Watchcloak    | Cloak               | Cloth/culture        | Weather, faction identity and watch duty.               | Alpha        |
| gear.belt.field_medic_roll          | Field Medic Roll        | Belt / utility      | Cloth/leather        | Quick bandage/poultice and healer support.              | POC optional |
| gear.belt.engineer_toolbelt         | Engineer Tool Belt      | Belt / utility      | Leather/copper       | Fast repair, trap and defence operation.                | Alpha        |
| gear.accessory.basic_ward_token     | Basic Ward Token        | Accessory           | Mana/rune            | Minor spirit resistance or ward link.                   | POC          |
| gear.accessory.guard_badge          | Riverward Guard Badge   | Accessory / social  | Culture metal        | Authority, guard identity and command permissions.      | POC NPC      |
| gear.accessory.briarhook_trophy     | Briarhook Captain Token | Trophy / accessory  | Faction trophy       | Raid memory, trade/reputation and intimidation hooks.   | POC reward   |
| gear.cursed.whispering_iron_mask    | Whispering Iron Mask    | Cursed headgear     | Iron/shadow          | Fear/stealth benefit with corruption and social risk.   | Final        |

## 27.1 Gear Database Fields

| **Record Type**    | **Combat Extension Fields**                                                                                                                                                             |
|--------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Weapon             | weapon_id, item_id, family, grip, moveset_ids, attack_profile_ids, reach, handling, load, stamina modifiers, penetration, stability, block/parry, durability, repair, sockets, culture. |
| Ranged weapon      | draw/reload, compatible_ammo_tags, projectile modifiers, accuracy, spread, recovery, quiver/container, movement, range, sound, structure compatibility.                                 |
| Ammunition         | ammo_id, projectile_id, damage/effect, penetration, speed, gravity, break/recovery, stack, payload, structure tags, visual trail, craft batch.                                          |
| Armour             | armour_id, item_id, slot, class, coverage, armour_by_type, resistances, stability, load, movement/noise/mana/temperature, condition, set, sockets.                                      |
| Shield             | shield_id, item_id, coverage, block angle, stability, impact cost, parry, bash action, projectile/magic response, load, durability, formation tags.                                     |
| Focus              | focus_id, item_id, school tags, spell slots/bonuses, mana capacity/efficiency, cast stability, active actions, melee profile, durability, charge.                                       |
| Accessory          | slot, attunement, passive/active effects, condition, charges, social/faction tags, restrictions, curse/binding, recharge/repair.                                                        |
| Instance state     | unique_item_id, quality, rarity, durability, max durability, sockets, enchantments, owner, history, bound state, curse, corruption, cosmetic variant.                                   |
| Planning / balance | scope, status, tier, expected acquisition, cost, repair burden, NPC use, counter role, test target, notes.                                                                              |

# 28. Detailed Defence and Raid Registry v0.1

| **ID**                             | **Display Name**             | **Type**            | **Function / Inputs**                                               | **Counter / Failure**                                   | **Scope**       |
|------------------------------------|------------------------------|---------------------|---------------------------------------------------------------------|---------------------------------------------------------|-----------------|
| defence.light.torch_network        | Village Torch Network        | Lighting            | Fuel/light coverage; reduces basic local danger and improves sight. | Fuel loss, weather, sabotage; not a magical ward.       | POC             |
| defence.alarm.village_bell         | Village Alarm Bell           | Alarm               | Operator or trigger; rallies NPCs and starts warning phase.         | Silence, destroyed access, no observer.                 | POC             |
| defence.tower.riverward_watchtower | Riverward Watchtower         | Tower               | Guard, ammo, stairs; warning, range, patrol and command visibility. | Fire, ladders, siege, blind terrain, empty ammo.        | POC             |
| defence.barricade.wooden           | Wooden Barricade             | Temporary barrier   | Wood/repair; delays route and gives cover.                          | Fire, brute, bypass, low durability.                    | POC             |
| defence.gate.hamlet_wood           | Hamlet Wooden Gate           | Gate                | Access control and choke point; repair materials/guard.             | Breach, open state, fire, infiltration.                 | POC             |
| defence.trap.bell_tripwire         | Bell Tripwire                | Alarm trap          | String/bell; detects route and alerts.                              | Detection, disarm, alternate path.                      | POC             |
| defence.trap.snare                 | Frontier Snare               | Restraint trap      | Fibre/wood; roots eligible small humanoid/beast.                    | Large/aware target, disarm, friendly trigger.           | POC optional    |
| defence.ward.lantern_basic         | Basic Ward Lantern           | Magic defence       | Mana/rune; reveals/weakens wisps and tagged magic threats.          | No mana, wrong ward category, overload, destroyed.      | POC             |
| defence.storage.armory_crate       | Guard Armory Crate           | Supply              | Stores weapons, ammo, medicine and repair stock with permission.    | Theft, fire, empty stock, blocked access.               | POC             |
| defence.shelter.longhouse          | Emergency Longhouse Shelter  | Civilian shelter    | Capacity, route, food/medicine; protects non-combatants.            | Breach, fire, overcrowding, route cut.                  | Alpha           |
| defence.wall.wood_palisade         | Wood Palisade                | Wall                | Route control, cover and delay.                                     | Fire, ladders, sappers, terrain bypass.                 | Alpha           |
| defence.turret.crossbow_post       | Manned Crossbow Post         | Operated turret     | Guard + bolts; high penetration firing arc.                         | Ammo/operator, blind arc, sabotage.                     | Alpha           |
| defence.siege.ballista_iron        | Iron Ballista                | Siege defence       | Crew + heavy bolts + repair; anti-large/structure.                  | Slow traverse, ammo, crew, counter-fire.                | Final           |
| defence.ward.riverward_field       | Riverward Ward Field         | Village ward        | Mage + mana network; barrier/reveal/cleanse by rune mode.           | Anchor damage, overload, corruption, mana shortage.     | Final           |
| raid.briarhook.scout_probe         | Briarhook Scout Probe        | Raid / intelligence | 2-3 scouts assess tower, gate and stock.                            | Capture, misdirection, patrol, stealth response.        | POC pre-event   |
| raid.briarhook.watchtower_assault  | Briarhook Watchtower Assault | Raid / assault      | 4-8 raiders + captain; theft/breach and tower pressure.             | Warning, guard gear, tower, ward, traps, player action. | POC             |
| raid.briarhook.supply_theft        | Briarhook Supply Theft       | Raid / theft        | Fast raiders target warehouse/project stock and withdraw.           | Lockdown, route control, recovery, patrol.              | Alpha           |
| raid.goblin.camp_relief            | Briarhook Camp Relief Force  | Raid / relief       | Reinforces camp if player attacks/occupies.                         | Road intelligence, ambush, negotiation.                 | Alpha           |
| raid.corruption.wisp_surge         | Wisp Surge                   | Magical event       | Mana density draws wisps to ward/mana stock.                        | Correct ward, mage, stabilisation, reduce leakage.      | POC magic event |
| raid.undead.grave_rise             | Grave-Rise Incursion         | Undead raid         | Spirit/undead breach objectives and fear.                           | Spirit ward, light, silver, priest/mage, burial state.  | Final           |
| raid.faction.regional_siege        | Regional Faction Siege       | Siege event         | Army, siege roles, blockade, occupation and diplomacy.              | Regional supply, allies, fortifications, counter-siege. | Final           |

## 28.1 Raid Database Fields

| **Field Group**    | **Fields**                                                                                             |
|--------------------|--------------------------------------------------------------------------------------------------------|
| Identity           | raid_id, display_name, faction, culture, source_structure/camp, category, rarity, scope, tags.         |
| Trigger / pressure | wealth, hostility, story, camp_strength, prior_actions, time, biome, route, difficulty, cooldown.      |
| Intelligence       | clues, scout events, discovery methods, confidence levels, false/missing information, codex links.     |
| Warning            | minimum/maximum time, tower/patrol/ward modifiers, alarm methods, UI, pause/slow options.              |
| Force              | budget, unit roles, elites, commander, siege, reinforcements, scaling, multiplayer, supply.            |
| Objectives         | primary, secondary, priorities, target tags, success/failure thresholds, alternate resolution.         |
| Routes / arrival   | origin, staging, approach paths, stealth, formation, weather/time, blocked-route behaviour.            |
| Phases             | phase IDs, transitions, waves, commander state, objective state, retreat, surrender, occupation.       |
| Defence evaluation | warning, structures, guards, gear, supplies, wards, traps, allies, civilians, automation.              |
| Outcomes           | casualties, injuries, damage, fire, theft, prisoners, reputation, faction, project, settlement, story. |
| Rewards            | loot, trophy, knowledge, reputation, recovery, camp changes, quest links, contribution model.          |
| Persistence / LOD  | save state, distant simulation, rehydration, event history, recurrence, cleanup, follow-ups.           |

# 29. Detailed Status and Injury Registry v0.1

| **ID**                | **Display Name**   | **Class**              | **Application / Effect**                                                          | **Counter / Recovery**                              | **Scope**    |
|-----------------------|--------------------|------------------------|-----------------------------------------------------------------------------------|-----------------------------------------------------|--------------|
| status.burning        | Burning            | Damage / elemental     | Fire buildup; periodic damage, light/smoke, possible flammable-block interaction. | Water, roll, rain, extinguish, resistance, cleanse. | POC          |
| status.bleeding       | Bleeding           | Damage / physical      | Slash/pierce buildup; periodic health loss and track/scent hooks.                 | Bandage, poultice, heal, rest, resistance.          | POC          |
| status.chilled        | Chilled            | Control / elemental    | Frost buildup reduces movement/stamina recovery.                                  | Heat, shelter, dry gear, cleanse.                   | Alpha        |
| status.frozen_brittle | Frozen / Brittle   | Control / elemental    | Threshold state; strong slow/root and blunt/impact interaction.                   | Heat, break free, resistance, duration.             | Alpha        |
| status.shocked        | Shocked            | Control / elemental    | Lightning buildup; interruption/stability and wet interaction.                    | Grounding, dry, resistance, ward.                   | Alpha        |
| status.poisoned       | Poisoned           | Damage / toxin         | Periodic damage and recovery penalty.                                             | Antidote, alchemy, healer, resistance.              | Alpha        |
| status.staggered      | Staggered          | Control / stability    | Short opening after stability loss.                                               | Recovery, ally cover, stability immunity window.    | POC          |
| status.guard_broken   | Guard Broken       | Control / defence      | Shield/weapon guard collapses; critical opening.                                  | Time, retreat, perk, ally cover.                    | POC          |
| status.rooted         | Rooted             | Control / movement     | Cannot translate; can act depending source.                                       | Cut/dispel/break, duration, immunity.               | Alpha        |
| status.silenced       | Silenced           | Control / magic        | Prevents selected spell actions.                                                  | Dispel, range, ward, duration, non-verbal magic.    | Alpha        |
| status.frightened     | Frightened         | Morale / mental        | AI retreat/panic weights; player feedback/penalty by settings.                    | Rally, leader, distance, resolve, cleanse.          | Alpha        |
| status.inspired       | Inspired           | Buff / morale          | Improves morale, stability recovery or action confidence.                         | Duration, commander loss, fear counter.             | POC NPC      |
| status.warded         | Warded             | Buff / magic           | Resistance/reveal/barrier by ward category.                                       | Mana depletion, dispel, anchor destruction.         | POC          |
| status.revealed       | Revealed           | Mark / detection       | Negates selected stealth/concealment and enables tracking.                        | Break line, cleanse, range, duration.               | Alpha        |
| status.armour_broken  | Armour Broken      | Debuff / defence       | Temporary reduced relevant armour after break action/component.                   | Repair, duration, stance/gear swap.                 | Alpha        |
| status.corrupted      | Corrupted          | Forbidden / persistent | Buildup affects health, magic, perception, social/world state.                    | Cleansing, ward, specialist, ritual, story choice.  | Final        |
| status.exhausted      | Exhausted          | Recovery / survival    | Reduced max stamina/mana and recovery after severe strain.                        | Rest, meal, shelter, treatment.                     | Alpha        |
| injury.bruised        | Bruised / Strained | Injury                 | Severe blunt/fall; temporary stamina/stability penalty.                           | Rest, poultice, healer.                             | POC optional |
| injury.deep_wound     | Deep Wound         | Injury                 | Severe slash/pierce; bleed and action penalty.                                    | Bandage, medicine, healer, magic.                   | Alpha        |
| injury.fracture       | Fracture           | Injury                 | Crushing/fall; movement/attack/work/load penalty.                                 | Splint, rest, healer, magic.                        | Final        |
| injury.severe_burn    | Severe Burn        | Injury                 | High fire/element exposure; recovery and armour discomfort.                       | Salve, healer, cooling, magic.                      | Final        |
| injury.trauma         | Combat Trauma      | Injury / morale        | NPC severe defeat/loss; morale, work and dialogue effects.                        | Safety, time, leadership, culture, memorial.        | Final        |

## 29.1 Status Database Fields

| **Field Group**            | **Fields**                                                                                                          |
|----------------------------|---------------------------------------------------------------------------------------------------------------------|
| Identity                   | status_id, display_name, class, tags, description, icon, colour/symbol, scope.                                      |
| Application                | instant/buildup, buildup_type, threshold, decay, sources, target eligibility, anatomy/realm/faction tags.           |
| Stack model                | max_stacks, refresh, add_intensity, independent instances, transform/interact, control diminishing returns.         |
| Effects                    | health/resource ticks, movement, action, armour/resistance, stability, perception, AI, social, block/world effects. |
| Duration                   | base, source scaling, tick rate, persistence out of combat, save state, LOD behaviour.                              |
| Counters                   | resistances, items, spells, blocks, environment, action, NPC, immunity, cleanse category.                           |
| Feedback                   | VFX, material variation, audio, animation, UI, subtitle cue, buildup warning, codex hint.                           |
| Difficulty / accessibility | intensity, visibility, control duration, player-only options, injury conversion, peaceful behaviour.                |
| Balance                    | expected uptime, damage/control budget, target roles, counters, test scenario, exploit risks.                       |

# 30. Core POC Scenario: Forest Hamlet Watchtower Defence Loop

The POC scenario joins every existing source document. The player begins near the Riverward forest hamlet, gathers and refines iron and mana resources, supplies the warehouse, supports the staged watchtower project, discovers basic rune knowledge, prepares guard equipment and ward power, receives intelligence about the Briarhook camp, and faces a raid whose result becomes persistent village history.

## 30.1 Preconditions and World State

| **Element**        | **Required POC State**                                                                                                         |
|--------------------|--------------------------------------------------------------------------------------------------------------------------------|
| World              | Compact valley with meadow/forest, river or lake, cave, rune ruin, Riverward hamlet, road/crossing and Briarhook camp.         |
| Village            | Named elder, builder, farmer, merchant, mage, miner, lumberjack and guard; warehouse, request board and unfinished watchtower. |
| Resources          | Wood, stone, fibre, food, copper, iron, coal/fuel, mana crystal/shard/dust, repair and medicine inputs.                        |
| Automation         | Miner or extraction source -\> chute/transport -\> furnace/mana furnace -\> storage -\> village warehouse after permission.    |
| Magic              | Rune Table, Basic Rune, Apprentice Staff, Mana Furnace, Ward Lantern/Stone, one combat and one utility spell.                  |
| Threat             | Briarhook camp produces scout pressure and raid state; wisp/magical encounter demonstrates ward category.                      |
| Player progression | Basic level/skills, crafting unlock, village reputation/trust, combat use, magic discovery and automation contribution.        |
| Settings           | Standard preset for reference; player can test peaceful/cosy/harsh variants and NPC permanence options.                        |

## 30.2 Scenario Sequence

| **Stage**                   | **Player Experience**                                                                                               | **Combat / Gear / Defence Proof**                                                 |
|-----------------------------|---------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------|
| 1\. Arrival and need        | Village request board identifies watchtower, guard equipment, ammo, medicine and ward needs.                        | Preparation is visible before combat; exact stock and permissions matter.         |
| 2\. Basic combat learning   | Player encounters a small night/cave threat or controlled training with guard.                                      | Light/heavy, block, dodge, stamina, health, simple status and healing.            |
| 3\. Gear production         | Player gathers/refines iron, fibre/leather and wood; crafts/receives sword or spear, bow, shield, armour, poultice. | Items, recipes, tier, durability, repair and load connect.                        |
| 4\. Village supply          | Player donates/sells/contracts resources and guard supplies through warehouse ledger.                               | NPCs equip real gear and project/armory reserves are separate.                    |
| 5\. Watchtower construction | Builders consume exact staged materials and place visible scaffolds/blocks.                                         | Defence is a civilisation project, not an abstract buff.                          |
| 6\. Rune discovery          | Old rune ruin or village mage unlocks ward/rune knowledge and apprentice staff.                                     | Magic supports combat and village infrastructure.                                 |
| 7\. Wisp pressure           | Mana activity attracts or reveals a wisp encounter.                                                                 | Ward category, magical damage/counter and mana supply are demonstrated.           |
| 8\. Intelligence            | Patrol, tracks, camp observation, captured scout or tower detects Briarhook preparation.                            | Stealth, warning, codex, route and non-combat choice.                             |
| 9\. Final preparation       | Player chooses tower ammo, guard gear, barricade, trap, ward power, medicine, repair stock and civilian plan.       | Resources create tactical trade-offs.                                             |
| 10\. Approach               | Raiders use road/forest route and role composition based on known defences.                                         | Warning and terrain change readiness.                                             |
| 11\. Assault                | Raiders probe, breach or steal; tower guard fires; frontline holds; mage wards; builder repairs.                    | Player action, NPC AI, roles, structures, supplies and commands combine.          |
| 12\. Captain phase          | Captain rallies/changes objective after losses or breach state.                                                     | Mini-boss telegraphs, stability, target priority and alternate retreat/surrender. |
| 13\. Resolution             | Raiders are defeated, withdraw with/without goods, surrender, or achieve objective.                                 | More than a kill-all condition.                                                   |
| 14\. Aftermath              | Injuries/deaths, stock use, damage, theft, prisoners, reputation and event summary persist.                         | World memory and recovery loop are proven.                                        |
| 15\. Follow-up              | Village repairs, celebrates/mourns, changes patrols, requests stock; camp/faction state updates.                    | Combat creates the next civilisation, quest and automation goals.                 |

## 30.3 Preparation Outcome Matrix

| **Preparation State**     | **Warning**                                                                                | **Defender State**                                                     | **Likely Outcome**                                                                                                    |
|---------------------------|--------------------------------------------------------------------------------------------|------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------|
| Minimal                   | Late visual contact; no reliable route.                                                    | Guard under-equipped, low ammo/medicine, no ward, unfinished tower.    | High player pressure, warehouse theft/damage likely, NPC injury/death risk, major repairs and reputation opportunity. |
| Watchtower only           | Early warning and ranged line of sight.                                                    | Tower guard gains range but may exhaust ammo; frontline remains weak.  | Raid delayed and scouts exposed; outcome still depends on supplies and gate/barricade.                                |
| Supplies only             | Normal warning.                                                                            | Guard has weapon/armour, ammo, medicine and repair stock.              | Stronger sustained defence but poor route intelligence may cause civilian/structure exposure.                         |
| Ward only                 | Normal warning plus magical protection.                                                    | Mage/ward reduces wisp/magic threat; physical defence remains limited. | Protects mana/people from magical pressure but raiders can still breach/steal.                                        |
| Balanced preparation      | Tower, guard kit, ammo, medicine, barricade/trap, ward and repair stock.                   | Named defenders fill roles; player can choose support/offence/command. | Standard intended victory with lower casualties/damage and strong reputation, but resource use remains meaningful.    |
| Strong automation support | Balanced plus continuous or pre-stocked supply.                                            | Warehouse/armory full; repair and ward uptime reliable.                | Best defence and rapid recovery; factory becomes sabotage/raid target and increases future wealth/threat.             |
| Diplomatic / preventive   | Intelligence, reputation, prisoner, trade or camp interaction.                             | Combat force may be reduced, delayed, redirected or cancelled.         | Alternative resolution with political/economic consequences and different story state.                                |
| Harsh difficulty          | Any preparation with stronger roles, shorter warnings, injuries and fire/structure danger. | Requires deliberate priorities and retreat/rescue decisions.           | Victory possible but expensive; world consequence is the focus rather than enemy health inflation.                    |

## 30.4 Persistent Records Written by the POC

| **Record**        | **Example Fields**                                                                                                             |
|-------------------|--------------------------------------------------------------------------------------------------------------------------------|
| Raid event        | raid_id, time, source camp, route, objectives, phases, difficulty, result, future pressure.                                    |
| Participant       | actor_id, faction, role, equipment, contribution, injury/death/surrender/capture, relationship memory.                         |
| Supply ledger     | ammo, medicine, food, mana, repair, gear issued, project stock protected/stolen/consumed.                                      |
| Structure state   | watchtower, gate, barricade, ward, warehouse: health, fire, corruption, operator, repair stage.                                |
| Reputation        | village trust/fear, individual memory, faction hostility, guard authority, reward and follow-up.                               |
| Quest/event       | watchtower project completion, raid warning choices, optional camp objective, recovery quests.                                 |
| World history     | Named summary shown in village/event history and later dialogue: who defended, who fell, what was lost, how the raid ended.    |
| Balance telemetry | time to warning, time to defeat, hits, blocks, dodges, ammo, healing, guard performance, structure damage, CPU/network budget. |

# 31. Balancing and Pacing Rules

Combat balance must protect the wider sandbox. Fighting should be satisfying and meaningful, but it must not make villages, automation, building, diplomacy, magic infrastructure, exploration, and preparation irrelevant. Balance values are data, not lore; they should be changed rapidly during testing while family identity and cross-system promises remain stable.

| **Rule**                 | **Locked Direction**                                                                                                                                            |
|--------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Readable time-to-defeat  | Common enemies should be resolved quickly when correctly engaged, while elites, roles, armour, formations and bosses add mechanics rather than only health.     |
| Bounded personal power   | Levels and mastery improve options, handling and efficiency more than infinite damage. Regional danger, equipment, knowledge and preparation remain meaningful. |
| Preparation value        | Watchtowers, routes, supplies, guards, wards, traps, knowledge and repairs must produce measurable outcome changes.                                             |
| No dominant pillar       | A pure combat build gains power but still benefits from crafting, supplies, knowledge, NPCs and infrastructure. Non-combat players can contribute meaningfully. |
| Weapon identity          | Each family has a positioning, stamina, reach, defence, material or target role. No family should be a universally superior skin.                               |
| Magic parity             | Magic provides unique control, defence and infrastructure, but mundane weapons, tools, shields and tactics remain viable.                                       |
| Armour trade-offs        | Protection and stability are paid for through load, stamina, noise, heat, mobility, maintenance and selected magic/traversal costs.                             |
| Status budget            | Control and damage-over-time effects have visible counters, diminishing returns and immunity windows. Permanent lock chains are invalid.                        |
| Resource economy         | Ammunition, medicine, mana and repair matter at settlement scale without making ordinary exploration tedious. Difficulty controls pressure.                     |
| NPC value                | Prepared guards are capable but not invincible. The player accelerates and changes outcomes without being the only entity who can fight.                        |
| Raid fairness            | Sources, warning, routes, objectives and counters are discoverable. Surprise exists, but unavoidable settlement loss should be rare outside selected settings.  |
| Consequences, not chores | Damage, injury and repair create stories and decisions; frequency and burden must not create constant restoration work.                                         |
| Older gear               | Old materials remain useful through NPC supply, resistances, enchantment bases, repairs, culture techniques and specialised use.                                |
| Boss preparation         | Knowledge and environment should reduce risk or open strategies without trivialising the encounter through one mandatory item.                                  |
| Difficulty quality       | Increase role use, coordination, objectives, warnings, injuries, supply and mechanics before multiplying health.                                                |
| Accessibility parity     | Assistance settings should preserve content, progression and rewards by default rather than treating accessibility as cheating.                                 |
| Telemetry                | Measure action use, stamina, hit/miss, block/parry/dodge, damage source, healing, deaths, status uptime, ammo, supplies, raid objectives and structure damage.  |
| Draft labels             | All numeric values in v0.1 are balance drafts and should be marked as such in data and test reports.                                                            |

## 31.1 POC Test Matrix

| **Test**          | **Variables**                                                     | **Pass Criteria**                                                                |
|-------------------|-------------------------------------------------------------------|----------------------------------------------------------------------------------|
| Basic duel        | Sword/spear, no armour vs leather, light/heavy/block/dodge.       | Inputs are clear; armour matters; stamina does not create helpless dead time.    |
| Shield pressure   | Raider chain, brute strike, arrow, spell against wooden shield.   | Different attacks produce readable stamina/stability/coverage results.           |
| Ranged handling   | Standing/moving/crouched, short/long range, weather, weak point.  | Arc and accuracy are learnable; bow remains useful but supply-aware.             |
| Magic parity      | Staff bolt/ward vs weapon/bow against raider and wisp.            | Magic has unique value without universally outperforming physical options.       |
| Healing           | Poultice under cover, while pressured, after retreat, NPC healer. | Combat healing has risk; post-combat recovery is not tedious.                    |
| Durability        | Normal expedition, raid, blocking, field repair, station repair.  | Condition is noticeable but not constant; broken item is recoverable.            |
| AI roles          | Raider, archer, brute, captain in open field and village route.   | Roles are visually/tactically distinct and coordinate without psychic knowledge. |
| Watchtower        | No tower vs completed tower with/without ammo.                    | Warning/range change is measurable and understandable.                           |
| Supply            | Empty vs stocked armory/medicine/mana/repair.                     | NPC behaviour and raid endurance change through real items.                      |
| Ward              | No ward, unpowered ward, powered correct ward.                    | Magical threat and defence result are visibly different.                         |
| Raid preparation  | Minimal, tower-only, supply-only, balanced, automated.            | Casualties, damage, theft, time and recovery differ for explainable reasons.     |
| Non-combat        | Scout, negotiate, surrender/capture, camp pressure reduction.     | At least one meaningful alternative resolution is functional.                    |
| Difficulty        | Peaceful/cosy/standard/harsh.                                     | Same systems remain coherent while pressure and consequences change.             |
| Accessibility     | Aim assist, wider timing, simplified input, reduced effects.      | Actions remain viable and understandable without content loss.                   |
| Multiplayer smoke | Two players with melee/ranged/support contribution.               | Damage authoritative; rewards credit non-damage contribution; no duplicate hits. |
| Save/restore      | Save during project, warning, raid phase and aftermath.           | Persistent state rehydrates consistently with no lost stock, actors or damage.   |

# 32. Open Questions for Later Documents and Prototypes

The 220 selected answers lock the direction of this document. The following questions are implementation, balancing or future-system dependencies that should be answered through prototypes or later dedicated documents rather than reopening the combat identity.

| **Future Question**                                                                            | **Best Owner / Resolution**                                        |
|------------------------------------------------------------------------------------------------|--------------------------------------------------------------------|
| Exact damage and armour curve coefficients, attack-speed bands and time-to-defeat targets?     | Combat balancing prototype and telemetry.                          |
| Final animation scope for first/third person and how many unique family movesets at Alpha?     | Animation/production plan.                                         |
| Whether the POC ships sword, spear or both as player melee options?                            | POC production capacity test; both preferred if animations permit. |
| Final body-slot hit rules and whether routine headshots are enabled on all humanoids?          | Combat prototype and accessibility/difficulty testing.             |
| How much structural damage and fire simulation fits performance and griefing goals?            | Blocks/structures technical prototype and world settings.          |
| Full inventory/back-slot conflict rules for backpack, quiver, cloak, shield, glider and tanks? | Inventory/equipment UI and traversal documents.                    |
| Exact NPC command authority progression and player-founded settlement controls?                | Future Settlement/Leadership System.                               |
| Prisoners, arrest, jail, ransom, interrogation, labour and war-crime boundaries?               | Future Law, Crime, Diplomacy and Settlement documents.             |
| Full PvP modes, faction war declarations, protected zones and competitive balance?             | Multiplayer/PvP technical design.                                  |
| Mounted, naval, aerial and vehicle combat?                                                     | Travel/Mounts/Vehicles and Dimensions documents.                   |
| Full siege logistics, regional armies, occupation, tribute and rebellion?                      | Faction War, Settlement and Economy systems.                       |
| Complete weapon/armour catalogue for every race and culture?                                   | Culture content registries after v0.1 systems are locked.          |
| Full enchanting, alchemy coatings, curses, relic awakening and magitech modules?               | Magic/Enchanting/Alchemy expansion documents.                      |
| Creature-specific weak points, limb breakage, harvesting and gore representation?              | Creature family entries, art direction and content settings.       |
| Boss roster, arenas, world-state rewards and alternate resolutions?                            | Boss/Adventure content plan.                                       |
| Regional/distant battle equations and rehydration fidelity?                                    | Simulation LOD technical prototype.                                |
| Anti-cheat, rollback, latency budget and split-screen performance limits?                      | Multiplayer and technical architecture plan.                       |
| Audio propagation, stealth sound budgets and accessibility cue catalogue?                      | Audio and accessibility implementation guide.                      |
| Final UI layout, controller radial menus and command overlay?                                  | UI/UX document and playable test.                                  |
| Final naming for the world, cultures, materials, skills and POC gear?                          | Lore/name lock pass; IDs remain stable where possible.             |

# Appendix A. POC Combat, Gear and Defence Checklist

| **Area**          | **Checklist**                                                                                                                      |
|-------------------|------------------------------------------------------------------------------------------------------------------------------------|
| Player resources  | \[ \] Health \[ \] Stamina \[ \] Mana \[ \] Stability \[ \] Load bands \[ \] Barrier/ward state                                    |
| Core actions      | \[ \] Light \[ \] Heavy \[ \] Block \[ \] Bash \[ \] Parry \[ \] Dodge \[ \] Aim/draw/release \[ \] Quick heal                     |
| Gear              | \[ \] Sword/spear \[ \] Bow \[ \] Arrows \[ \] Quiver \[ \] Wooden shield \[ \] Staff \[ \] Leather armour \[ \] Guard kit         |
| Condition         | \[ \] Durability \[ \] Visual warning \[ \] Broken state \[ \] Field repair \[ \] Station/NPC repair                               |
| Damage            | \[ \] Slash/pierce/blunt \[ \] Magic \[ \] Armour \[ \] Penetration \[ \] Stability \[ \] Weak point/critical opening              |
| Status / recovery | \[ \] Burning or bleed \[ \] Stagger/guard break \[ \] Warded/inspired \[ \] Poultice \[ \] Optional injury                        |
| Enemies           | \[ \] Raider \[ \] Archer \[ \] Brute/shield \[ \] Captain \[ \] Wisp \[ \] Cave combatant                                         |
| NPC defence       | \[ \] Front guard \[ \] Tower guard \[ \] Mage \[ \] Builder repair \[ \] Civilian shelter behaviour                               |
| Defences          | \[ \] Watchtower \[ \] Alarm \[ \] Gate/barricade \[ \] Trap \[ \] Ward \[ \] Armory/warehouse supply                              |
| Raid              | \[ \] Source/camp \[ \] Scout/intelligence \[ \] Warning \[ \] Preparation \[ \] Objectives \[ \] Captain \[ \] Retreat/resolution |
| Consequence       | \[ \] Real stock use \[ \] Damage states \[ \] Injuries/death settings \[ \] Theft \[ \] Reputation \[ \] Event history            |
| UI                | \[ \] Resource HUD \[ \] Target/status \[ \] Ammo \[ \] Durability \[ \] Raid warning/objective \[ \] Aftermath summary            |
| Accessibility     | \[ \] Aim/lock \[ \] Timing \[ \] Stamina assist \[ \] Telegraphed cues \[ \] Effects controls \[ \] Remapping                     |
| Save/performance  | \[ \] Save mid-state \[ \] Rehydrate \[ \] Target FPS \[ \] Network smoke test \[ \] Data validation                               |

# Appendix B. Combat and Damage Data Templates

## B.1 Combat Action Template

| **Field**           | **Description / Example**                                                              |
|---------------------|----------------------------------------------------------------------------------------|
| action_id           | Stable ID, e.g. combat.action.sword_heavy_thrust.                                      |
| display_name        | Localised player-facing name.                                                          |
| category / family   | Attack, defence, movement, healing, command; sword, shield, bow, staff.                |
| tags                | light/heavy, thrust/sweep, blockable/parryable, melee/ranged/magic, POC status.        |
| activation          | Input intent, AI intent, target mode, equipment/state/authority requirements.          |
| timing              | Startup, active, recovery, hold/channel, follow-ups, buffer and cancel rules.          |
| costs               | Stamina, mana, ammunition/item, durability, charge, health/corruption where allowed.   |
| movement            | Translation, turn, root/slow, aim, sprint/jump/mounted support.                        |
| attack/effect       | Attack profile, projectile, status, healing, command, interaction or structure effect. |
| defence interaction | Block, parry, dodge, barrier, armour, weak point and structure tags.                   |
| feedback            | Animation, event markers, VFX, sound, camera, vibration, UI and subtitle cue.          |
| AI/network          | Role weights, range, risk, authority, prediction, replication and validation.          |
| balance             | Tier, expected outcome, counters, draft values, telemetry and test case.               |

## B.2 Damage Packet Template

| **Field**            | **Description**                                                                             |
|----------------------|---------------------------------------------------------------------------------------------|
| packet_id / event_id | Unique runtime event and optional source definition.                                        |
| source / owner       | Actor, item, action, projectile, hazard, structure, faction and player owner.               |
| target               | Actor/component/block/structure and resolved hit location.                                  |
| raw_amount           | Pre-defence amount and scaling snapshot.                                                    |
| damage_tags          | Slash, pierce, blunt, elemental, spirit, corruption, siege, non-lethal and special tags.    |
| penetration          | Armour, shield, barrier, resistance or structure penetration by family.                     |
| stability / impulse  | Stability damage, knockback, launch, pull, stagger class.                                   |
| status buildup       | Status IDs, amount, source purity/intensity and application rules.                          |
| critical/opening     | Weak point, unaware, back attack, stagger, component, random trait and multiplier/effect.   |
| friendly/ownership   | Friendly-fire group, permission, law, protected-zone and structure flags.                   |
| durability           | Attacker and defender wear, projectile break/recovery and structure condition.              |
| contribution         | Damage/support/objective ledger credit and encounter/quest link.                            |
| result               | Blocked, parried, dodged, resisted, immune, health/stability damage, status, injury, death. |
| feedback/log         | Player-facing reason and optional advanced calculation breakdown.                           |

## B.3 Resistance Profile Template

| **Field**  | **Description**                                                                         |
|------------|-----------------------------------------------------------------------------------------|
| profile_id | Stable resistance definition ID.                                                        |
| physical   | Slash, pierce, blunt and impact values/tags.                                            |
| elemental  | Fire, frost, lightning, earth/force, wind, water, nature.                               |
| mystical   | Spirit/divine, shadow/blood, corruption, void and culture/realm tags.                   |
| status     | Buildup multipliers, decay, threshold, immunity and control diminishing returns.        |
| structure  | Material, hardness, reinforcement, fire, siege and protected-block properties.          |
| conditions | Wet, burning, frozen, warded, armour broken, phase, environment and equipment.          |
| source     | Anatomy/creature, armour, shield, ward, spell, structure, difficulty and world setting. |
| UI         | Simple rating, discovered detail, codex confidence and feedback vocabulary.             |

# Appendix C. Weapon, Armour and Equipment Data Templates

## C.1 Weapon Template

| **Field Group** | **Fields**                                                                                               |
|-----------------|----------------------------------------------------------------------------------------------------------|
| Identity        | weapon_id, item_id, display_name, family, culture, material, tier, rarity, quality, scope.               |
| Handling        | grip, handedness, load, reach, speed/commitment, turn/movement, stamina, noise, readiness.               |
| Moveset         | moveset_id, light chain, heavy branches, sprint/jump, block, parry, critical, dual/two-hand, ability.    |
| Damage          | attack profile IDs, types, penetration, stability, status, structure/tool interactions, weak-point role. |
| Defence         | block value, angle, stamina efficiency, parry, brace, cover and projectile/magic response.               |
| Condition       | durability, wear, zero state, repair recipe/material/station/NPC, field repair, salvage.                 |
| Magic/upgrades  | sockets, enchantments, runes, charge, focus, module, curse, attunement, infrastructure link.             |
| Visual/audio    | model, first/third animation set, icon, material variation, damage states, sound and VFX.                |
| NPC/AI          | eligible roles, culture loadouts, value, training, formation, guard/raider use, supply category.         |
| Balance/testing | acquisition, cost, expected targets, counters, time-to-defeat, telemetry, notes.                         |

## C.2 Armour Template

| **Field Group** | **Fields**                                                                                               |
|-----------------|----------------------------------------------------------------------------------------------------------|
| Identity        | armour_id, item_id, slot, class, culture, material, tier, rarity, quality, set and scope.                |
| Protection      | coverage, armour by type, penetration response, resistances, status buildup, headshot/component rules.   |
| Handling        | load, stability, movement, dodge, stamina, climbing/swimming, noise, stealth, temperature, mana/casting. |
| Condition       | durability, absorbed-wear, visual states, broken state, repair, salvage and NPC maintenance.             |
| Special         | sockets, enchantment, ward, module, environment/realm, pockets, social identity and law.                 |
| Appearance      | model pieces, hide option, dye/material/culture/age/damage/magic/corruption variation.                   |
| AI/NPC          | job/role, guard supply, culture outfit, replacement priority, equipment evaluation.                      |
| Balance         | defence-load trade, acquisition, repair burden, counters, test scenarios.                                |

## C.3 Shield / Focus / Accessory Extensions

| **Record**           | **Additional Fields**                                                                                                                 |
|----------------------|---------------------------------------------------------------------------------------------------------------------------------------|
| Shield               | coverage, block angle, impact stamina, stability, parry window, bash, projectile/magic response, formation, carried/back state.       |
| Focus                | school affinity, spell loadout, mana capacity/efficiency, channel stability, cast movement, direct actions, ritual authority, charge. |
| Ammunition container | compatible tags, capacity, quick-cycle, retrieval, weather protection, recovery, back/belt conflicts, automation resupply.            |
| Accessory            | slot, attunement, passive/active effects, conditions, charges, recharge, social/faction identity, binding, curse and cleanse.         |
| Tool belt            | quick slots, compatible items, use speed, repair/trap/healing modifiers, load and visual modules.                                     |
| Cloak/back item      | weather, stealth, faction, gliding, ward, storage, shield/quiver/backpack conflicts and animation.                                    |

# Appendix D. Defence, Encounter and Raid Data Templates

## D.1 Defence Template

| **Field Group** | **Fields**                                                                                                |
|-----------------|-----------------------------------------------------------------------------------------------------------|
| Identity        | defence_id, block_id/structure_id, display_name, family, culture/faction, tier, scope, tags.              |
| Function        | warning, coverage, range, route, block, attack, ward, trap, storage, shelter, command or repair role.     |
| Operation       | operator jobs/skills, actions, stations, permissions, schedule, autonomy, target rules, friendly safety.  |
| Supply/power    | ammo, fuel, mana, medicine, repair, stock category, input port, reserve, low/empty state.                 |
| Physical        | health/condition, material, armour/resistance, damage states, fire/corruption, collapse, access and path. |
| Counters        | blind spots, breach, ladders, fire, sabotage, dispel, overload, route bypass, supply loss.                |
| Effects         | NPC morale, range, warning, spawn safety, raid budget/path, civilian safety, trade/road and story.        |
| Repair          | resource, builder, stage, emergency function, full restoration, automation and distant simulation.        |
| Feedback        | visual state, coverage overlay, sound, UI, alarm, operator callout, map marker.                           |
| Persistence     | ownership, event history, damage/repair, operator, supply, LOD and save state.                            |

## D.2 Encounter Template

| **Field Group**     | **Fields**                                                                                    |
|---------------------|-----------------------------------------------------------------------------------------------|
| Context             | encounter_id, location/biome/structure, faction/creature family, story/event, scope.          |
| Composition         | roles, count/budget, elite, commander, reinforcements, multiplayer/difficulty scaling.        |
| Objectives          | actor/structure/item/route targets, success/failure, alternate resolution, surrender/capture. |
| Arrival             | spawn/approach, patrol, ambush, nest/camp, time/weather/light, route and warning.             |
| Terrain             | cover, height, hazards, tagged blocks, arena preparation, escape and civilian presence.       |
| Rewards/consequence | loot, resources, knowledge, reputation, structures, camps, spawns, world state, follow-up.    |
| Persistence/cleanup | save state, corpses/loot, prisoners, retreat, recurrence, LOD, event history.                 |

## D.3 Raid Template

| **Field Group**      | **Fields**                                                                                                |
|----------------------|-----------------------------------------------------------------------------------------------------------|
| Identity/source      | raid_id, faction, culture, source camp/territory, category, tags, recurrence and scope.                   |
| Pressure/trigger     | wealth, hostility, project, story, route, time, prior actions, world event, cooldown.                     |
| Intelligence/warning | clues, confidence, scouts, tower/patrol/ward modifiers, warning time and UI.                              |
| Force                | role budget, units, elite, captain, siege, magic, supply, morale, reinforcements and scaling.             |
| Objectives/routes    | primary/secondary, target tags, approach, diversion, retreat, occupation and alternate resolution.        |
| Phases               | start/end conditions, transitions, waves/roles, commander/objective state and timer.                      |
| Defender inputs      | structures, guards, gear, ammo, medicine, mana, repair, traps, allies, civilians, automation.             |
| Outcome              | casualties, injuries, damage, theft, prisoners, reputation, settlement/faction/story and future pressure. |
| Contribution/reward  | combat/support/preparation/objective/diplomacy credit, loot, trophy, quest and recovery.                  |
| Persistence/LOD      | event record, distant resolution, rehydration, damage states, follow-ups and cleanup.                     |

# Appendix E. Tag Library v0.1

| **Tag Family**   | **Representative Tags**                                                                                                               |
|------------------|---------------------------------------------------------------------------------------------------------------------------------------|
| Action           | attack.light, attack.heavy, attack.charged, defence.block, defence.parry, movement.dodge, healing, command, surrender, capture.       |
| Weapon           | weapon.sword, axe, hammer, mace, dagger, spear, polearm, staff, scythe, unarmed, tool, bow, crossbow, sling, thrown, siege, magitech. |
| Grip/handling    | one_handed, two_handed, dual_compatible, braceable, mounted, concealed, reach_short/medium/long, load_light/medium/heavy.             |
| Attack shape     | thrust, sweep, overhead, contact, projectile, beam, cone, area, ground_target, shockwave, chain, field.                               |
| Defence response | blockable, parryable, dodgeable, guard_break, unblockable, projectile, spell, siege, environmental, nonlethal.                        |
| Damage           | slash, pierce, blunt, impact, fire, frost, lightning, earth, wind, water, nature, spirit, shadow, blood, corruption, void, siege.     |
| Status           | burning, bleeding, chilled, frozen, shocked, poisoned, staggered, rooted, silenced, frightened, inspired, warded, corrupted.          |
| Anatomy/target   | humanoid, beast, chitin, armour_plate, construct, spirit, undead, fae, flying, large, weak_core, boss_component.                      |
| AI role          | frontliner, skirmisher, shieldbearer, archer, caster, support, healer, ambusher, sapper, thief, siege, commander, summoner.           |
| Objective        | kill, protect, escort, rescue, capture, steal, breach, damage, occupy, ritual, survive, flee, scout, negotiate.                       |
| Defence          | light, alarm, tower, wall, gate, barricade, trap, ward, armory, shelter, turret, siege, road, bridge.                                 |
| Structure target | soft_cover, door, gate, wall, glass, rope, machine, warehouse, ward, bridge, tower, siege_target, protected.                          |
| Social/legal     | civilian, guard, outlaw, trespass, surrendering, prisoner, forbidden_magic, witnessed, duel, war_target, protected_zone.              |
| Material         | wood, stone, copper, bronze, iron, steel, silver, gold, mana_crystal, arcane_alloy, mythril, voidstone, celestial.                    |
| World/realm      | overworld, cave, village, road, camp, ruin, fae, dream, infernal, deep, void, celestial, corrupted, leyline.                          |
| Simulation       | near_detail, local_simplified, regional_abstract, distant_strategic, persistent, temporary, server_authority, client_predict.         |
| Planning         | poc_required, poc_optional, alpha, beta, final_game, placeholder, deferred, balance_draft.                                            |

# Appendix F. Cross-System Use Matrix

| **Combat Element** | **Blocks**                                 | **Items / Recipes**                            | **NPC / Village**                            | **Automation**                               | **Magic**                             | **World / Creatures / Factions**                    |
|--------------------|--------------------------------------------|------------------------------------------------|----------------------------------------------|----------------------------------------------|---------------------------------------|-----------------------------------------------------|
| Weapon/armour      | Storage, displays, damage/repair stations. | Materials, crafting, quality, repair, salvage. | Guard kit, jobs, culture, trade, law.        | Part production, armory supply, maintenance. | Enchant, rune, curse, focus, ward.    | Drops, weak points, faction styles, realm gear.     |
| Ammunition         | Crates, towers, siege blocks.              | Batch recipes, quiver, special payload.        | Guard stock and consumption.                 | Production and routing.                      | Ward/elemental projectiles.           | Hunting, siege, culture and resource pressure.      |
| Status/injury      | Fire, poison, frost, corruption blocks.    | Medicine, food, potion, gear.                  | Healer, work/morale, death/memory.           | Medicine supply and hazard control.          | Cleanse, barrier, curse, ward.        | Creature venom, weather, realm exposure.            |
| Defence            | Walls, gates, towers, traps, wards.        | Exact project/repair supplies.                 | Builders, guards, civilians, permissions.    | Armory, ammo, alarm, repair and power.       | Ward network and magical turret.      | Raid path, spawn safety, faction territory.         |
| Raid               | Structure damage and repair states.        | Stock consumed/stolen and rewards.             | Casualties, reputation, migration, projects. | Supply helps and becomes target.             | Magic threats and counters.           | Camp source, roads, biome, faction memory, quests.  |
| Stealth/crime      | Cover, light, doors, alarms.               | Disguise, tools, stolen goods.                 | Witness, guard, law and dialogue.            | Sensors/alarms and sabotage.                 | Conceal/reveal and forbidden casting. | Senses, weather, territory and faction response.    |
| Boss               | Arena blocks/components.                   | Preparation, relic, trophy and recipe.         | Allies, village consequence and story.       | Supply/defence preparation.                  | School, ritual, ward and counter.     | Biome, structure, dimension and world-state reward. |
| POC loop           | Watchtower/gate/ward damage.               | Gear, poultice, ammo, repair.                  | Riverward defenders and history.             | Iron/mana supply to warehouse.               | Staff, ward and wisp counter.         | Briarhook camp/raid, cave threat and valley routes. |

# Appendix G. Player Answer Lock

| **Locked Selection**                                                                                                                                                                                                                                                                                       |
|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| The player selected option E for every question in the 220-question Combat, Gear and Defence questionnaire. This locks the broad hybrid direction: deep but readable action-survival combat, full system interconnection, extensive configurability, a focused POC subset, and database-ready scalability. |

| **Question Range** | **Selected Answer** | **Locked Theme**                                                                                  |
|--------------------|---------------------|---------------------------------------------------------------------------------------------------|
| 1-20               | E                   | Full scope, hybrid identity, preparation, world consequence and sandbox freedom.                  |
| 21-40              | E                   | First/third-person controls, optional targeting, responsive committed actions and social posture. |
| 41-60              | E                   | Health, stamina, mana, stability, load, injuries and survival interaction.                        |
| 61-80              | E                   | Hybrid damage/armour, resistances, weak points, critical openings and readable difficulty.        |
| 81-100             | E                   | Broad melee families, movesets, block, parry, dodge, grips and mastery.                           |
| 101-120            | E                   | Physical ranged combat, real ammunition, trajectories, containers and structure interactions.     |
| 121-140            | E                   | Combat magic, focuses, wards, hybrid gear, counters, terrain and social consequences.             |
| 141-160            | E                   | Detailed slots, armour classes, shields, accessories, rarity, quality, durability and repair.     |
| 161-180            | E                   | Sockets, enchantments, curses, status effects, healing, downing and persistent NPC consequence.   |
| 181-200            | E                   | Tactical AI roles, stealth, morale, surrender, bosses, guards and player orders.                  |
| 201-220            | E                   | Fortifications, traps, siege, raids, supplies, progression, multiplayer, accessibility and POC.   |

# Appendix H. Future Combat Content Backlog

| **Backlog Family** | **Examples**                                                                                                                          |
|--------------------|---------------------------------------------------------------------------------------------------------------------------------------|
| Weapon expansions  | Culture swords, axes, polearms, chain weapons, scythes, gauntlets, whips, exotic foci, realm weapons, living weapons.                 |
| Ranged expansions  | Crossbow families, slings, javelins, nets, bombs, alchemical launchers, rune repeaters, mounted and naval weapons.                    |
| Armour expansions  | Culture sets, profession workwear, environmental suits, ritual regalia, chitin/bone/living armour, realm stabilisers.                 |
| Magic combat       | Full school action sets, counterspell families, summons, transformations, terrain spells, battle rituals, city wards.                 |
| Status/injuries    | Disease, infection settings, dream/fate effects, possession, advanced corruption, prosthetics, scars and recovery stories.            |
| AI/factions        | Bandits, orcs, undead cults, demons, corrupted villages, construct armies, fae courts, dimension factions and culture tactics.        |
| Bosses             | Biome apex, faction warlord, ancient construct, corrupted guardian, dimension sovereign, civilisation-scale titan.                    |
| Defences           | Full walls/gates, arrow slits, siege engines, rune turrets, golem sentries, patrol systems, city barriers, naval and aerial defence.  |
| War/siege          | Regional armies, logistics, camps, blockades, occupation, tribute, rebellion, alliances, diplomacy, relief forces and reconstruction. |
| Player roles       | Mounted combat, naval combat, aerial combat, commander mode, guard career, bounty hunter, healer, engineer and pacifist support.      |
| Multiplayer        | Faction warfare, arenas, tournaments, duel rules, server presets, spectator tools, moderation logs and competitive readability.       |
| Content tools      | Moveset editor, damage/status inspector, encounter composer, raid editor, defence coverage overlay and automated balance tests.       |

# Appendix I. POC Success Criteria

| **Success Area**       | **Required Proof**                                                                                                                        |
|------------------------|-------------------------------------------------------------------------------------------------------------------------------------------|
| Combat feel            | Melee, shield, bow and staff are responsive, readable and tactically distinct in first and third person.                                  |
| Resource model         | Health, stamina, mana, stability and load each create understandable decisions without excessive complexity.                              |
| Damage/defence         | Armour, penetration, block, parry, dodge, weak point and status produce explainable outcomes.                                             |
| Gear lifecycle         | Craft, equip, compare, damage, field-repair, station-repair and NPC-supply loops work with stable IDs.                                    |
| NPC defence            | Named guards use real equipment/ammo/medicine, perform roles, become injured or die by settings and remember outcomes.                    |
| Civilisation defence   | Watchtower, alarm, barricade/gate, trap, ward and armory visibly change raid warning, path, endurance or casualties.                      |
| Magic integration      | Staff spell and ward prove that magic supports personal combat and village infrastructure.                                                |
| Automation integration | Iron/mana/ammunition/repair supply reaches village storage and changes defender readiness.                                                |
| Raid structure         | Briarhook raid has source, warning, route, objectives, roles, captain, retreat/resolution and persistent aftermath.                       |
| World memory           | Damage, stock use, theft, injuries/death, reputation, faction/camp and village history persist after save/reload.                         |
| Player freedom         | At least fighting, ranged/magic support, supply/repair and one preventive/non-combat contribution path work.                              |
| Accessibility          | Targeting, timing, stamina, telegraph and presentation settings meaningfully broaden playability.                                         |
| Scalability            | One new weapon, status, enemy role, defence and raid can be added through data with minimal core-code change.                             |
| Performance            | POC raid meets target performance with visible projectiles, NPCs, damage states, ward effects and inventory consumption.                  |
| Vision                 | Players can state the core hook after playing: preparation, magic, gear and production protected a living village and changed its future. |

| **Document Lock Summary**                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Combat is a configurable, data-driven action-survival system embedded in a living civilisation sandbox. It supports first- and third-person play, melee, ranged weapons, magic, equipment, status effects, injuries, stealth, AI roles, bosses, guards, fortifications, raids, siege, multiplayer, accessibility and persistent world consequences. The POC remains deliberately focused on the Riverward watchtower, real defence supplies, basic gear and magic, and the Briarhook raid outcome. |
