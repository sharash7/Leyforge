**Fantasy Voxel Civilisation Sandbox**

**17 - UI/UX System**

**Version 0.1 - Detailed Design Bible Draft**

*A data-driven adaptive interface and player-experience system for world-first voxel play, survival, building, inventory, automation, magic, living NPC civilisations, quests, exploration, dimensions, combat, accessibility, multiplayer, and proof-of-concept validation.*

Working design document - interface, interaction, accessibility, and player-experience foundation

| **UI/UX System Statement**                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| The interface is not a decorative layer placed over the game after its systems are finished. It is the interpretation and control layer that lets players understand a living voxel world without losing immersion. Normal play should remain visually open and world-first, while deeper information appears contextually through inspection, physical interfaces, overlays, books, boards, maps, station panels, codex links, and expandable screens. Every critical action, risk, permission, shortage, unlock, and consequence must be understandable through more than one channel wherever practical. |

| **Field**               | **Locked Direction**                                                                                                                                                                                                                                                                           |
|-------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Document Scope          | Full design-bible document covering visual language, HUD, controls, camera, inventory, crafting, building, automation, magic, progression, NPCs, villages, trade, factions, quests, maps, combat, accessibility, multiplayer, menus, saves, technical architecture, registries, and POC scope. |
| Core Philosophy         | Use an adaptive hybrid interface: minimal and contextual during normal play, detailed and inspectable when the player needs system depth. World cues and physical interfaces support screen-space clarity rather than being replaced by it.                                                    |
| Visual Direction        | High-fidelity fantasy presentation combining clean modern readability with parchment, carved materials, metal fittings, subtle runes, cultural motifs, and realm-specific accents. Style never overrides legibility or accessibility.                                                          |
| Information Direction   | Use progressive disclosure, player-configurable information density, grouped alerts, searchable histories, and consistent cross-system links. Do not expose undiscovered systems or spoilers without knowledge-aware rules.                                                                    |
| Interaction Direction   | Shared interaction grammar across keyboard/mouse and controller, full remapping, hold/toggle options, contextual actions, radial support, predictable focus navigation, and strong placement/configuration previews.                                                                           |
| Accessibility Direction | Treat accessibility as architecture, not a late menu. Support scalable text, narration-ready labels, captions, non-colour cues, reduced motion/flashes, timing assistance, simplified inputs, UI presets, and modular difficulty.                                                              |
| POC Direction           | Prove the Forest Hamlet loop through HUD, inventory, crafting, dialogue, request board, warehouse, project progress, machine UI, mana/ward feedback, raid warning, reputation, aftermath, settings, and accessibility basics.                                                                  |
| Data Direction          | Use data-driven screen, widget, style, binding, notification, permission, localisation, accessibility, analytics, and planning records with stable IDs and reusable parent definitions.                                                                                                        |
| Platform Direction      | Design for keyboard/mouse, controller, solo, co-op, LAN, and split-screen from the foundation. Use responsive layouts and scalable simulation-facing summaries rather than separate incompatible interfaces.                                                                                   |

# Document Purpose

This document defines how players see, understand, control, customise, and learn the Fantasy Voxel Civilisation Sandbox. It converts the game's deep interconnected systems into a coherent player experience: the HUD communicates immediate survival and danger, menus expose detail without overwhelming the player, physical world interfaces preserve immersion, overlays explain automation and magic, village screens summarise living civilisations, maps reflect earned knowledge, and accessibility settings let different players engage with the same world.

The UI/UX System does not replace gameplay systems. It defines the information, interaction, feedback, accessibility, navigation, permission, and presentation requirements those systems must expose. Blocks, items, recipes, resources, NPCs, machines, spells, creatures, biomes, structures, cultures, dimensions, quests, combat actions, raids, and world settings remain owned by their respective data systems, while this document defines how their information reaches the player.

All 240 questionnaire answers were locked to option E. The resulting direction is deliberately hybrid: it rejects both an always-crowded strategy dashboard and an interface so minimal that complex failures become opaque. The player sees the world first, receives concise contextual information second, and can intentionally open deep inspection when desired.

# Design Source

| **Source Document**                        | **Relevant Direction**                                                                                                                                                                                                        | **How This UI/UX Document Uses It**                                                                                                                                                                  |
|--------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 00 - Master Game Design Bible              | Balanced survival, civilisation, automation, and fantasy RPG pillars; high-fidelity voxel presentation; solo, co-op, LAN, and split-screen; configurable cosy-to-harsh play.                                                  | UI must support all pillars without allowing one to dominate, preserve the world view, scale to different danger settings, and remain responsive across solo and shared-screen play.                 |
| 01 - Core Gameplay Loop                    | Sandbox-first loop: explore -\> gather -\> craft -\> build -\> interact -\> automate -\> defend -\> upgrade -\> expand. Guidance is optional through tutorials, requests, markers, dialogue, alerts, recipe books, and codex. | The interface prioritises player choice, configurable guidance, contextual goals, world clues, and a complete feedback loop from action to visible world response.                                   |
| 02 - Player Progression System             | Hybrid progression through tools, overall level, use-based skills, perks, knowledge, research, magic, automation, reputation, settlement growth, bosses, and dimensions; no fixed classes.                                    | Progression screens explain what improved, why, what unlocked, and which paths are open without becoming a linear level treadmill.                                                                   |
| 03 - Blocks Registry                       | Blocks have shapes, placement states, damage, ownership, permissions, automation ports, magic states, village roles, and data-driven families.                                                                                | Placement previews, inspection, building mode, shape selection, rotation, ownership, damage, repair, state, and contextual block information require consistent UI patterns.                         |
| 04 - Items Registry                        | Items use categories, tags, stack rules, rarity, quality, durability, backpacks, equipment, lore, trade, magic, automation, quests, and dimension links.                                                                      | Inventory, search, sorting, comparison, equipment, repair, lore, rarity/quality, stack transfer, and cross-links must be readable and scalable.                                                      |
| 05 - Crafting and Recipe Registry          | Recipes use known, hinted, hidden, discovered, NPC-taught, research-locked, and faction-locked states; timed queues, substitutions, risk, batch crafting, and station upgrades.                                               | Recipe book, station panels, unknown recipe presentation, alternatives, queues, missing requirements, risk previews, and grouped unlock notifications are first-class UX.                            |
| 06 - Resource Progression                  | Material ladder, side materials, grades, purity, prospecting, by-products, physical mana, village uses, automation deposits, and long-term material identity.                                                                 | Resource tooltips, codex links, prospecting feedback, purity/grade indicators, source information, village need summaries, and production-chain views must distinguish tier from rarity.             |
| 07 - NPC Village System                    | Named NPCs, jobs, schedules, needs, inventories, warehouses, permissions, projects, reputation, raids, families, migration, death, and simulation LOD.                                                                        | Dialogue, request boards, village overview, NPC lists, storage summaries, projects, trust/fear, crime warnings, permissions, event history, and drill-down information are required.                 |
| 08 - Automation System                     | Visible item flow, power, machines, ports, throughput, storage, warehouse supply, permissions, NPC labour, golems, risk, maintenance, and near/far simulation.                                                                | Machine panels and overlays must show what enters, exits, powers, blocks, owns, supplies, risks, and changes while avoiding routine production spam.                                                 |
| 09 - Magic System                          | Mana, spell loadouts, runes, rituals, alchemy, enchanting, magitech, wards, portals, cultures, forbidden risk, discovery, and codex.                                                                                          | Magic UI appears gradually, supports spell targeting and loadouts, explains rune compatibility and ward coverage, and communicates known risk before catastrophe.                                    |
| 10 - Creatures and Monsters                | Creatures use readable silhouettes, sound, behaviour, habitats, knowledge, drops, raids, nests, bosses, taming, and world-state interaction.                                                                                  | Creature feedback combines world cues, optional awareness, codex discovery, target information, weakness knowledge, raid alerts, and accessibility captions.                                         |
| 11 - Biomes and World Generation           | Large procedural worlds, regions, layered biomes, roads, rivers, structures, resources, dynamic corruption, seasons, leylines, and exploration readability.                                                                   | Maps, environmental indicators, discovery confidence, route knowledge, biome hazards, map layers, world settings, and performance-aware summaries must reflect earned knowledge.                     |
| 12 - Structures                            | Structures are exploration anchors with ownership, damage, repair, occupation, restoration, rewards, roads, camps, ruins, shrines, portals, and dynamic states.                                                               | Structure inspection, map markers, blueprint/project views, state icons, faction banners, danger ratings, restoration information, and history links use knowledge-sensitive presentation.           |
| 13 - Races, Peoples, Cultures and Factions | Culture is visible through architecture, materials, jobs, magic, laws, language, territory, trade, diplomacy, stories, and faction relationships.                                                                             | Shared navigation remains consistent while cultural motifs, terms, languages, law indicators, diplomacy graphs, territory layers, and accessibility-safe faction identity vary.                      |
| 14 - Dimensions                            | Realms use portals, anchors, stability, hazards, survival rules, mapping, ownership, trade, military logistics, and cross-realm consequences.                                                                                 | Portal inspection, preparation summaries, destination confidence, realm hazards, anchor state, cross-realm atlas layers, and emergency return information must be clear before commitment.           |
| 15 - Quest and Event System                | Handcrafted and generated quests, event alerts, contribution, authority, personal objectives, failures, aftermath, history, project integration, and spoiler-aware knowledge.                                                 | Journal, tracker, request boards, event warnings, objective authority, contribution summaries, custom goals, aftermath, and searchable history must support solo and multiplayer scope.              |
| 16 - Combat, Gear and Defence              | Adaptive combat HUD, configurable numbers, camera/aim assistance, status buildup, injuries, stealth, telegraphs, guards, fortifications, raids, aftermath, PvP, and accessibility.                                            | Combat information expands only when relevant, critical telegraphs use multiple channels, raid preparation and civilian danger are visible, and post-event outcomes explain persistent consequences. |

# Static Table of Contents

- 1\. Locked UI/UX System Identity

- 2\. Player Answer Decision Summary

- 3\. UI/UX System Architecture

- 4\. Information Hierarchy, Progressive Disclosure, and Knowledge State

- 5\. Visual Language, Typography, Iconography, and Style Tokens

- 6\. Core HUD and Adaptive Gameplay States

- 7\. Controls, Camera, Input, Focus, and Interaction Grammar

- 8\. Moment-to-Moment Feedback, Status, Risk, and World Cues

- 9\. Inventory, Equipment, Crafting, Items, and Repair UX

- 10\. Building, Placement, Shapes, Blueprints, and Construction UX

- 11\. Automation, Power, Logistics, Storage, and Warehouse UX

- 12\. Magic, Research, Skills, Perks, and Progression UX

- 13\. NPC Dialogue, Villages, Reputation, Trade, Crime, and Faction UX

- 14\. Quests, Events, Journal, Maps, Exploration, Portals, and Dimensions

- 15\. Combat, Defence, Raids, Threats, and Aftermath UX

- 16\. Main Menus, World Creation, Character Creation, Saves, and Loading

- 17\. Tutorials, Onboarding, Codex, Help, and Player Learning

- 18\. Accessibility, Difficulty, Content Warnings, and Inclusive Design

- 19\. Multiplayer, Co-op, Split-Screen, Permissions, and Communication

- 20\. Settings, HUD Customisation, Notifications, and Quiet Modes

- 21\. Errors, Confirmations, Recovery, History, and Trustworthy Feedback

- 22\. Technical UI Architecture, Data Binding, Performance, and Security

- 23\. Localisation, Modding, Testing, Analytics, and Debugging

- 24\. Proof-of-Concept UI/UX Scope

- 25\. Proof-of-Concept Player Flows

- 26\. Detailed Screen Registry v0.1

- 27\. HUD Widget Registry v0.1

- 28\. Notification and Alert Registry v0.1

- 29\. Interaction Pattern Registry v0.1

- 30\. Core POC Scenario: Forest Hamlet Interface Loop

- 31\. Balancing, Pacing, and Information-Load Rules

- 32\. Open Questions for Technical Implementation

- Appendix A. POC UI/UX Checklist

- Appendix B. Screen and Widget Database Field Templates

- Appendix C. Cross-System UI Requirement Matrix

- Appendix D. Player Answer Lock 1-240

- Appendix E. Future UI/UX Backlog

- Appendix F. POC Success Criteria

# 1. Locked UI/UX System Identity

The UI/UX System is the readability, interaction, and trust layer of the game. It must let a player move from an empty-handed survivor to a mage-engineer, settlement leader, dimensional explorer, defender, trader, conqueror, or cosy builder without requiring them to memorise undocumented rules or stare permanently at a crowded dashboard.

| **Locked Rule**                                                                                                                                                                                                                                                                                                                                     |
|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| The interface should reveal the minimum information needed for the current decision, provide stronger detail on demand, and always explain important failure, risk, ownership, permission, progress, and consequence states. World cues should teach and confirm wherever practical, but no critical information should depend on world cues alone. |

| **Identity Layer**             | **Design Meaning**                                                                                                                         | **Player-Facing Result**                                                                                                   |
|--------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------|
| World-First Immersion          | The voxel world, characters, machines, magic, structures, and environmental cues remain the primary presentation.                          | Normal play feels open, readable, and atmospheric rather than covered by permanent panels.                                 |
| Adaptive Readability           | HUD elements appear, expand, reduce, or reprioritise based on combat, building, automation, magic, dialogue, raids, and player preference. | The player receives relevant information without carrying every system on-screen at once.                                  |
| Progressive Disclosure         | Summaries lead to detail panels, advanced tabs, overlays, codex entries, histories, and technical breakdowns.                              | New players can act confidently while expert players can inspect and optimise deep systems.                                |
| Consistent Interaction Grammar | Shared patterns govern inspect, compare, transfer, configure, confirm, undo, pin, filter, search, and navigate.                            | Learning one system helps the player understand other systems.                                                             |
| Knowledge-Aware Presentation   | Unknown, hinted, rumoured, partially known, discovered, researched, and mastered states control visible information.                       | Exploration and learning remain meaningful without forcing frustrating secrecy.                                            |
| Accessibility by Architecture  | Critical information uses text, icons, sound, animation, vibration, patterns, and configurable assistance.                                 | Different visual, hearing, motor, cognitive, and motion needs can access the same underlying game.                         |
| Social and Political Clarity   | Ownership, laws, territory, reputation, trust, fear, contribution, and authority are visible before consequential actions.                 | The player understands why an action is allowed, criminal, dangerous, diplomatic, or irreversible.                         |
| Data-Driven Scalability        | Screens and widgets consume stable system data rather than hard-coded one-off rules.                                                       | Content registries, mods, future systems, localisation, and new platforms can expand without rebuilding the UI foundation. |

## 1.1 UI/UX Design Promise

A player should be able to answer: What am I looking at? What can I do? What will it cost? Why is it unavailable? What is dangerous? Who owns it? What is progressing? What changed? Where can I learn more? The answer may come first from the world and second from the interface, but it must be reliable.

## 1.2 What the Interface Is Not

- Not a permanently expanded strategy dashboard covering the voxel world.

- Not a deliberately opaque immersive interface that hides machine, magic, village, or combat failures.

- Not a collection of unrelated menus with different controls, terminology, filters, and back-navigation.

- Not dependent on colour, tiny text, rapid timing, flashing effects, or precise cursor control for critical play.

- Not a source of spoilers that exposes undiscovered dimensions, recipes, factions, creatures, or story outcomes.

- Not a POC requirement to implement every final dashboard, perk tree, realm atlas, faction graph, or server administration tool.

# 2. Player Answer Decision Summary

All 240 questions were answered E. This section translates the questionnaire into system-level locks. Appendix D preserves the answer ranges and the detailed decision groups.

| **Area**               | **Locked Decision**                                                                                                                                                    |
|------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Core identity          | Adaptive hybrid: minimal during normal play, detailed on inspection, unified across all gameplay pillars.                                                              |
| Visual style           | Clean high-fidelity fantasy UI with parchment, carved materials, metal, runes, culture and realm accents around a modern readable core.                                |
| Complexity growth      | Tabs, meters, and screens reveal when their systems become meaningful; unknown systems use knowledge-aware hints rather than full exposure.                            |
| Information density    | Progressive disclosure with summaries, expandable detail, filters, saved views, and player presets.                                                                    |
| Icons and rarity       | Distinct silhouettes, labels, tooltips, patterns, border/material variation, and no colour-only critical meaning.                                                      |
| HUD                    | Contextual hotbar and needs, combat, building, automation, magic, objective, and danger widgets with configurable persistence.                                         |
| Health and resources   | Clear health plus contextual stamina, mana, hunger, temperature, armour, effects, and long-term conditions.                                                            |
| World feedback         | Use animation, audio, particles, NPC behaviour, vibration, captions, and HUD confirmation together.                                                                    |
| Controls               | Full remapping, keyboard/mouse and controller parity, contextual interaction, hold/toggle options, radial support, and smart suggestions.                              |
| Camera                 | First/third person where practical, adjustable FOV, lock-on and aim assistance, collision handling, reduced motion, and granular shake settings.                       |
| Inventory              | Slot-based with stacks, backpacks, filters, search, favourites, locked slots, custom sorting, quick transfer, and connected storage progression.                       |
| Crafting               | Known/hinted/hidden recipe states, substitutions, batch crafting, queues, risk, resource preview, and grouped unlock history.                                          |
| Equipment and repair   | Readable slots, comparisons, durability, quality, rarity, lore/history, field and station repair, and specialist/automation options.                                   |
| Building               | Direct voxel placement plus construction mode, shape selector, rotation, replacement, short undo, copy tools, and resource-aware blueprints.                           |
| Village projects       | Shared blueprint foundation with NPC labour, cultural variants, project reserves, stages, permissions, blockers, and consequences.                                     |
| Machines               | Compact local panels with expandable detail for input, output, recipe, power, throughput, blockage, damage, ownership, and warnings.                                   |
| Overlays               | Optional automation, power, mana, ward, coverage, ports, routes, and bottleneck overlays layered over physical world feedback.                                         |
| Magic                  | Gradual mana reveal, configurable spell loadouts, target-specific previews, rune compatibility, ritual planning, risk, ward coverage, and spellbook filters.           |
| Progression            | Subtle milestones, recent unlock history, themed perk views, linked codex/research, respec preview, and endgame role dashboards.                                       |
| NPC dialogue           | Readable dialogue panel with optional focus camera, intent-based choices, known consequence indicators, interruption rules, and world continuity.                      |
| Village and reputation | Separate individual, village, culture, faction, trust, and fear layers with concise health summaries and drill-down.                                                   |
| Trade, law, and crime  | Supply/demand, culture preference, legality, ownership, witnesses, likely consequences, permits, and severe-action confirmation.                                       |
| Quests and events      | Searchable journal, configurable tracking, environmental guidance, custom objectives, authority, contribution, alerts, aftermath, and history.                         |
| Maps and dimensions    | Knowledge-based layered cartography, routes, confidence, elevation, underground layers, realm atlas, portals, anchors, hazards, and logistics.                         |
| Combat                 | Adaptive HUD, optional enemy information, configurable numbers, readable targeting, ammunition, cooldowns, buildup, weaknesses, allies, and telegraphs.                |
| Raids and defence      | Readiness, approach intelligence, guard/tower/ward state, civilian danger, surrender/retreat, defeat flow, and aftermath summaries.                                    |
| Tutorials              | Configurable contextual learning, replayable codex help, NPC teaching, practice, resettable hints, and no forced linear opening.                                       |
| Difficulty             | Named presets plus modular survival, combat, raids, NPC consequences, economy, magic risk, progression, and guidance controls.                                         |
| Accessibility          | Scalable/reflowing text, narration-ready data, captions, non-colour cues, reduced motion/flashes, timing/input assistance, and cognitive-load controls.                |
| Multiplayer            | Responsive solo foundation extended with party state, independent split-screen menus, shared objective scope, authority, contribution, communication, and permissions. |
| Menus and saves        | World cards, quick and advanced creation, classless character customisation, reliable save feedback, backups, safe mode, repair, and mod/version diagnostics.          |
| Technical foundation   | Reusable components, stable IDs, localisation keys, style tokens, focus order, cross-links, performance states, debug tools, and automated UI testing.                 |
| POC success            | A new player completes the connected Forest Hamlet supply, magic, watchtower, and raid loop without developer explanation.                                             |

# 3. UI/UX System Architecture

The UI architecture is layered. The player sees world cues first, contextual HUD second, local interaction panels third, and full management screens only when intentionally opened. Each layer consumes the same underlying data and must not invent contradictory values.

| **Presentation Layer**  | **Purpose**                                                                                      | **Examples**                                                                                                         |
|-------------------------|--------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------|
| World Presentation      | Communicate identity, function, ownership, danger, progress, and failure through the game world. | Block states, smoke, moving items, scaffolds, banners, NPC actions, ward glow, portal instability, creature posture. |
| Contextual HUD          | Present immediate decisions without leaving play.                                                | Health, hotbar, interaction prompt, stamina, mana cost preview, danger direction, objective update, raid warning.    |
| Local Interaction Panel | Handle common actions for the object directly in focus.                                          | Machine input/output, chest transfer, NPC quick dialogue, block rotation, rune slot, repair prompt.                  |
| Full System Screen      | Expose deeper management, history, comparison, and configuration.                                | Inventory, recipe book, village overview, research web, map, faction screen, settings.                               |
| Inspection Overlay      | Visualise spatial relationships over the world.                                                  | Automation flow, power, mana, ward coverage, ports, territory, build conflict, route safety.                         |
| Codex and Knowledge     | Store earned explanations, lore, sources, counters, recipes, and cross-links.                    | Creature entry, material source, rune theory, structure history, culture law, realm hazard.                          |
| History and Reports     | Explain what changed over time and support recovery or accountability.                           | Quest history, warehouse ledger, raid aftermath, save diagnostics, contribution report, event timeline.              |
| Platform Shell          | Provide world selection, multiplayer, saves, mods, accessibility, settings, and recovery.        | Main menu, world cards, join flow, safe mode, backup restore, server governance.                                     |

## 3.1 Core Runtime Records

| **Record**               | **Role**                                    | **Important Fields**                                                                                                 |
|--------------------------|---------------------------------------------|----------------------------------------------------------------------------------------------------------------------|
| UIScreenDefinition       | Defines one complete screen or major modal. | ID, route, title key, layout family, data sources, input contexts, permissions, breakpoints, scope, planning status. |
| UIWidgetDefinition       | Defines a reusable HUD or menu component.   | ID, widget type, value binding, visibility rule, priority, interaction, accessibility label, variants.               |
| UIStyleTokenSet          | Defines reusable visual presentation.       | Typography, spacing, border, material, icon size, focus, rarity, culture, realm, warning, contrast.                  |
| UIDataBinding            | Maps gameplay state to presentation.        | Source ID, field path, transform, fallback, permissions, knowledge requirement, refresh rate, LOD.                   |
| UIInteractionPattern     | Defines predictable player actions.         | Select, inspect, compare, transfer, split, pin, configure, confirm, undo, back, filter, search.                      |
| UINotificationDefinition | Defines one alert family.                   | Trigger, priority, channels, grouping, cooldown, duration, history, accessibility, multiplayer source.               |
| UIKnowledgeGate          | Controls discovery-sensitive information.   | Unknown, hinted, rumoured, partial, discovered, researched, mastered, spoiler class.                                 |
| UIInputContext           | Maps bindings and focus behaviour by state. | Gameplay, combat, build, dialogue, inventory, radial, photo, split-screen panel, accessibility alternatives.         |
| UIPermissionContext      | Explains access and consequences.           | Owner, player, party, village, faction, law, role, authority, allowed actions, request path, violation result.       |
| UIRuntimeState           | Stores temporary interface state.           | Open route, focus, scroll, selected tabs, filters, pins, dismissed hints, layout preset, notification queue.         |

## 3.2 Priority and Interruption Rules

- Life-threatening danger, irreversible social actions, save failure, accessibility-critical cues, and multiplayer authority conflicts outrank routine production or collection updates.

- Routine item production, repeated skill gains, and low-priority village consumption are grouped into summaries rather than displayed individually.

- Opening a local panel should not unexpectedly pause a shared world. Solo pause behaviour, multiplayer continuation, and split-screen independence are explicit settings.

- An interruption should preserve the player's previous focus, filters, comparison target, scroll position, and unsaved configuration wherever possible.

- No modal should trap the player without a visible back/cancel path, controller focus, keyboard escape, and screen-reader label.

# 4. Information Hierarchy, Progressive Disclosure, and Knowledge State

## 4.1 Three-Depth Information Pattern

| **Depth** | **What the Player Sees**                                                                                            | **Use**                                                                                  |
|-----------|---------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------|
| Glance    | Name, icon, current state, critical warning, next action.                                                           | Aiming at a block, reading hotbar, seeing a raid horn, checking a machine light.         |
| Inspect   | Requirements, costs, ownership, progress, inputs/outputs, reasons, counters, direct links.                          | Opening an interaction panel, hovering an item, checking a project, inspecting a portal. |
| Analyse   | History, trends, comparisons, network graphs, detailed statistics, filters, saved views, debug or expert breakdown. | Village dashboard, automation overlay, research web, aftermath report, server audit.     |

## 4.2 Knowledge States

| **State**       | **Presentation Rule**                                                                                 | **Examples**                                                               |
|-----------------|-------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------|
| Unknown         | Entry absent unless deliberate foreshadowing is useful.                                               | Unencountered creature family; undiscovered realm.                         |
| Foreshadowed    | Symbol, silhouette, inaccessible tab, environmental clue, or vague rumour.                            | Dormant portal frame; strange mana mark.                                   |
| Rumoured        | Approximate location, description, or effect with confidence language.                                | Merchant story about a ruin; faction report about raiders.                 |
| Partially Known | Some fields visible; unknown properties labelled rather than guessed.                                 | Unidentified enchantment; incomplete recipe; uncertain portal destination. |
| Discovered      | Core name, role, source, and practical interaction visible.                                           | First mana crystal; known village project.                                 |
| Researched      | Detailed mechanics, counters, recipes, values, and cross-links available.                             | Creature weakness; rune compatibility; machine throughput.                 |
| Mastered        | Optimisation, advanced variants, hidden interactions, build comparisons, and expert filters unlocked. | Specialist skill mastery; fully surveyed network.                          |

## 4.3 Spoiler and Uncertainty Rules

- Known facts, predictions, rumours, and designer-guaranteed rules use visibly different language and icons.

- Quest outcomes, faction reactions, hidden boss phases, undiscovered resources, and realm surprises are not exposed merely because a screen exists.

- Basic survival requirements and catastrophic portal, ritual, save, or law risks are not hidden behind trial-and-error death.

- Accessibility can increase clarity and guidance without requiring the player to reveal narrative spoilers.

# 5. Visual Language, Typography, Iconography, and Style Tokens

## 5.1 Shared Visual Foundation

The interface uses a clean modern layout foundation with fantasy material framing. Panels may resemble parchment, carved wood, forged metal, etched glass, crystal, rune stone, or culture-specific craft, but text fields, focus states, spacing, icons, and interaction locations remain predictable.

| **Token Family** | **Locked Direction**                                                                                                                                                                      |
|------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Typography       | A highly readable primary UI family with fantasy display accents reserved for headings, titles, and culture flavour. Never use decorative fonts for long text or critical numbers.        |
| Colour           | Use semantic palettes for status and system family, with patterns, shapes, labels, and contrast alternatives. Player accent and accessibility colours can override non-essential styling. |
| Spacing          | Use a consistent compact-to-comfortable spacing scale. Touch, controller, and accessibility modes increase target size without breaking layout.                                           |
| Materials        | Parchment, carved surfaces, metal, crystal, runes, cloth, and realm effects appear as restrained framing and texture, not visual noise behind text.                                       |
| Focus            | Keyboard/controller focus is high contrast, animated gently, narrated, and never represented by colour alone.                                                                             |
| Depth            | Use elevation, borders, shadows, and background separation sparingly to distinguish layers and modal priority.                                                                            |
| Motion           | Animations explain cause, destination, change, and hierarchy. Reduced-motion alternatives replace movement with fades, highlights, text, or sound.                                        |
| Audio/Haptics    | Confirm actions, errors, danger, magic charge, machine state, and navigation with optional, category-adjustable sound and vibration.                                                      |

## 5.2 Icon Rules

- Every major category has a distinctive silhouette and consistent family shape.

- Critical icons receive text labels or immediately available tooltips; icons never carry essential meaning alone.

- Rarity, quality, tier, condition, ownership, legality, quest state, and magical risk use separate visual channels.

- Icons scale cleanly from hotbar size to codex display and remain readable against culture and realm variants.

- Unknown icons use silhouettes or generic categories rather than misleading specific art.

## 5.3 Rarity, Quality, Tier, and Condition

| **Property**           | **Presentation**                                                                                         |
|------------------------|----------------------------------------------------------------------------------------------------------|
| Rarity                 | Restrained name/border/material/glow treatment with a symbol or pattern alternative.                     |
| Quality                | Craftsmanship marks, stars or notches, condition framing, naming, and comparison detail.                 |
| Tier                   | Material identity, progression band, required capability, and source context; not confused with rarity.  |
| Durability/Condition   | Hotbar threshold cues, repair icon, cracks/wear, percentage or descriptor, and escalating warning.       |
| Purity/Stability       | Crystal or rune pattern, descriptive label, risk band, and known effect on machines, spells, or rituals. |
| Legality/Sacred Status | Jurisdiction icon, known law/culture label, permit state, and consequence summary.                       |

## 5.4 Culture and Realm Variation

Cultures and dimensions may change frames, motifs, illustrations, ambient effects, terminology, sounds, and icon ornamentation. They do not relocate common controls, reverse familiar meanings, reduce contrast, or require a player to relearn the interface. Realm effects remain restrained and can be disabled independently.

# 6. Core HUD and Adaptive Gameplay States

## 6.1 Default HUD

| **HUD Area**      | **Default Content**                                                                                 | **Adaptive Behaviour**                                                                                     |
|-------------------|-----------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------|
| Centre            | Reticle, focus state, compact interaction prompt, placement ghost, targeting preview.               | Changes for mining, talking, building, repairing, configuring, spell targeting, combat, and inspection.    |
| Lower Centre      | Hotbar, selected item/tool/spell, ammunition or charge where relevant.                              | Can collapse, expand spell set, show durability, or switch to build shape palette.                         |
| Lower Left        | Health and context-sensitive stamina, hunger, temperature, long-term danger.                        | Stamina appears during exertion; hunger/temperature escalate as relevant; player can keep them persistent. |
| Lower Right       | Contextual mana, spell cost, ammunition, tool mode, building material, or machine configuration.    | System-specific slot with consistent placement and customisation.                                          |
| Upper Left        | Tracked objective, project, personal note, or contextual tutorial.                                  | Limited player-configurable count; grouped updates; hidden in immersive preset.                            |
| Upper Right       | Minimap/compass where enabled, location, event or raid state.                                       | Map guidance level follows world setting and player preset.                                                |
| Screen Edges      | Damage direction, sound captions, danger, ally/downed, objective direction, environmental exposure. | Prioritised, scalable, and replaceable with non-directional alternatives.                                  |
| Notification Feed | Grouped pickups, unlocks, deliveries, reputation changes, machine or village alerts.                | Cooldowns, quiet mode, priority escalation, and history inbox prevent overload.                            |

## 6.2 Adaptive HUD States

| **State**        | **Priority Information**                                                                              | **Reduced Information**                                                     |
|------------------|-------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------|
| Exploration      | Location, compass/map hint, temperature, stamina, discovered POI, sound/environmental cues.           | Routine objective and inventory details.                                    |
| Building         | Selected material, shape, rotation, validity, resources, nearby storage, blueprint stage, ownership.  | Combat widgets unless danger appears.                                       |
| Automation       | Tool mode, port direction, selected machine, power/flow warning, inspection overlay legend.           | Unrelated quest and exploration prompts.                                    |
| Magic            | Mana, spell slots, target preview, components, cooldown, stability, ward/ritual state.                | Routine resource notifications.                                             |
| Dialogue/Trade   | Speaker, relationship context, laws, choices, price/stock, interruption danger.                       | Normal interaction prompts and low-priority alerts.                         |
| Combat           | Health, stamina, mana, weapon/ammo, status, target, danger, ally state.                               | Building and routine settlement information.                                |
| Raid Preparation | Time/confidence, approach, readiness, project/defence shortages, civilians, tracked preparation task. | Routine crafting and exploration updates.                                   |
| Peaceful/Cosy    | Building, farming, village projects, exploration, decorative selection, low-stress status.            | Aggressive combat emphasis while optional threat clarity remains available. |

## 6.3 HUD Customisation

- Presets: Immersive, Standard, Builder, Automation, Adventurer, Accessibility, and Custom.

- Per-widget visibility: hidden, contextual, persistent, or auto.

- Position, scale, opacity, text size, icon size, timing, sound, vibration, and priority controls.

- Safe-area and split-screen layout profiles.

- Import/export or profile saving may be added after the POC; the architecture should not prevent it.

# 7. Controls, Camera, Input, Focus, and Interaction Grammar

## 7.1 Input Foundation

Keyboard/mouse and controller receive equal design attention. All gameplay actions are remappable, input conflicts are detected, and gameplay and menu contexts can use separate profiles. Touch and specialised accessibility devices can be layered later because actions are data-driven rather than hard-coded to one physical input.

| **Interaction**    | **Default Pattern**                                              | **Advanced/Accessible Alternatives**                                                                    |
|--------------------|------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------|
| Primary Interact   | Tap universal interact for the most likely safe action.          | Hold for details, radial when multiple actions exist, remap, auto-focus, longer hold, narrated options. |
| Alternate Use      | Secondary tool/item action or contextual configuration.          | Radial menu, combined simplified input, on-screen action list.                                          |
| Hotbar Selection   | Number keys, mouse wheel, controller shoulders.                  | Radial selection, direct bindings, smart tool suggestion, larger selection UI.                          |
| Sprint/Crouch      | Player-selected hold or toggle.                                  | Auto-sprint, reduced stamina strain, double-tap optional, simplified movement.                          |
| Build Controls     | Place/remove, rotate, shape cycle, replace, sample, mode switch. | Construction panel, radial shape wheel, sticky mode, longer confirmation for destructive actions.       |
| Menu Navigation    | Mouse pointer or predictable focus navigation.                   | Virtual cursor where useful, shoulder tab switching, search shortcut, narration, large targets.         |
| Combat Targeting   | Free aim with optional soft/hard lock-on.                        | Aim magnetism, slowdown, projectile assistance, auto-facing, target cycling.                            |
| Repetitive Actions | Normal manual input.                                             | Hold-to-repeat, toggle continuous action, contextual automation, no mandatory rapid tapping.            |

## 7.2 Camera

- First-person and third-person are supported where technically practical, with perspective-specific reticle, placement, interaction, and animation adjustments.

- Third-person collision uses smooth zoom, shoulder swap, fade options, and optional temporary first-person transition in tight spaces.

- Base and sprint FOV, first/third-person FOV, head bob, camera shake categories, motion blur, hit stop, and screen effects are independently adjustable.

- Photo mode is separated from gameplay visibility and respects multiplayer permissions.

## 7.3 Focus and Modal Rules

- Opening a screen establishes a clear focus target, announces the title when narration is enabled, and provides a predictable back path.

- Modals are reserved for important decisions, not every item transfer or minor warning.

- Split-screen players retain independent focus; one player opening inventory does not steal another player's input.

- When danger interrupts a screen, the system can warn, partially close, pause in solo, or keep running according to world and platform rules.

# 8. Moment-to-Moment Feedback, Status, Risk, and World Cues

## 8.1 Resource and Condition Feedback

| **System**           | **Glance Feedback**                                                 | **Detailed Feedback**                                                               |
|----------------------|---------------------------------------------------------------------|-------------------------------------------------------------------------------------|
| Health               | Readable bar/segments, injury cue, damage direction.                | Exact value optional, wounds, resistances, recent damage, treatment links.          |
| Stamina              | Appears during sprint, block, dodge, climb, or strenuous action.    | Recovery modifiers, load, hunger/temperature influence, accessibility assistance.   |
| Mana                 | Reveals after discovery; shows cost preview and insufficient state. | Regeneration, sources, purity, equipment, school modifiers, component requirements. |
| Hunger               | Contextual state and escalating warning.                            | Meal quality, buffs, spoilage, expected duration, village-food comparison.          |
| Temperature          | Environmental cues plus hot/cold trend.                             | Protection sources, exposure rate, biome/weather cause, safe options.               |
| Statuses             | Prioritised icon, timer or buildup, source.                         | Stacks, threshold, resistance, cure, cleanse category, codex link.                  |
| Long-Term Conditions | Persistent area or character screen marker.                         | Cause, progression, treatment, work/combat effect, NPC or specialist options.       |
| Durability           | Threshold indicator on hotbar/equipment.                            | Exact condition, repair materials, quality impact, specialist and automation paths. |

## 8.2 Risk Communication

Normal systems warn and fail safely where practical. Catastrophic consequences are reserved for knowingly risky, unstable, forbidden, harsh-setting, boss, siege, or realm systems. Warning uses multiple channels and explains what the player knows, what remains uncertain, and how risk can be reduced.

| **Risk Type**      | **Required Feedback**                                                                                             |
|--------------------|-------------------------------------------------------------------------------------------------------------------|
| Machine Blockage   | Physical idle/overflow state, local icon, cause text, overlay trace, optional alert.                              |
| Power Overload     | Movement/sound/heat or mana instability, capacity trend, affected network, shutdown or danger state.              |
| Ritual Instability | Misaligned components, purity, participant, location, timing, stability band, known outcomes, mitigation.         |
| Forbidden Action   | Law/culture warning, witnesses, ownership, reputation/faction consequence, confirmation proportional to severity. |
| Portal Travel      | Destination confidence, stability, power, cargo rules, hazards, return route, ownership, equipment check.         |
| Raid Threat        | Source/confidence, likely route, time window, objectives, readiness, civilian danger, preparation actions.        |
| Save/Version Risk  | Preserve original, clear explanation, backup state, safe mode, repair/restore choices, diagnostic detail.         |

## 8.3 World Cues

- Environmental clues include roads, smoke, tracks, broken structures, sound, lighting, magical residue, banners, NPC schedules, guard posture, machine motion, and creature behaviour.

- World cues are reinforced by optional captions, inspection, map confidence, codex knowledge, and accessibility alternatives.

- No critical warning is communicated by a subtle colour shift or sound alone.

# 9. Inventory, Equipment, Crafting, Items, and Repair UX

## 9.1 Inventory Structure

The player uses a slot-based inventory with category stacks, craftable backpacks, capacity upgrades, equipment, hotbar, favourites, locked slots, search, filters, sorting presets, and custom organisation. Bulk logistics belongs to storage and automation rather than an unlimited personal inventory.

| **Feature**        | **Locked UX**                                                                                                                 |
|--------------------|-------------------------------------------------------------------------------------------------------------------------------|
| Navigation         | Unified inventory with category tabs, search, filters, equipment, hotbar, favourites, recent items, and collapsible details.  |
| Search             | Names, tags, descriptions, material, use, recipe, source, culture, rarity, tier, system, and discovered knowledge.            |
| Sorting            | Quick presets plus favourites, locked slots, custom rules, and manual organisation.                                           |
| Stack Control      | Quick single/half, slider, exact input, controller increments, and sensible default transfer amount.                          |
| Container Transfer | Drag/drop, quick transfer, transfer-all, matching items, locked/filter slots, permission reason, and connected-storage rules. |
| Nearby Crafting    | Limited local access early; expands through linked storage, settlement permissions, logistics, and magic networks.            |
| Backpacks          | Visible equipped carry items provide capacity, specialised pockets, restrictions, upgrades, and cosmetic identity.            |
| Quest Items        | Critical items protected, restrictions explained, recovery supported, and post-quest conversion used where appropriate.       |

## 9.2 Item Tooltip and Comparison

- Glance: item name, icon, count, category, tier, rarity, quality, condition, primary use.

- Inspect: statistics, traits, sockets, source, recipe links, village use, automation use, magic role, legality, repair, value.

- History: crafter, culture, owner, enchantments, quest history, trophies, discovered lore.

- Comparison: side-by-side values, trade-offs, repair cost, load, durability, resistances, and no green/red-only meaning.

## 9.3 Recipe Book and Crafting

| **Area**      | **Locked UX**                                                                                                                              |
|---------------|--------------------------------------------------------------------------------------------------------------------------------------------|
| Organisation  | Categories, station, progression, known/hinted/hidden, favourites, recent, project, culture, quest, dimension, and production-chain views. |
| Substitutions | Accepted tags, chosen ingredient, available alternatives, quality/culture effects, and manual locks.                                       |
| Batching      | Quick amounts, custom quantity, craft-all, timed queue, resource/time/power preview.                                                       |
| Queue         | Progress, priority, pause/cancel, missing input, blocked output, fuel/power, and optional network summary.                                 |
| Risk          | Known risk factors, stability, likely failure categories, protection options, and proportionate confirmation.                              |
| Unlocks       | Major capability notification; grouped minor recipes; searchable recently learned history.                                                 |
| Repair        | Field repair where allowed, station repair, cost and quality impact, specialist options, and automation support.                           |

# 10. Building, Placement, Shapes, Blueprints, and Construction UX

## 10.1 Direct Building

| **Function**      | **Player Feedback**                                                                                                             |
|-------------------|---------------------------------------------------------------------------------------------------------------------------------|
| Placement Preview | Material ghost, orientation, collision, support rule, ownership, obstruction, cost, valid/invalid reason.                       |
| Snapping          | Voxel grid default, face/edge alignment, modular snaps, controlled free placement for eligible objects.                         |
| Shapes            | Shape-family selector with quick cycling/radial, inventory count, automatic suggestion, and explicit override.                  |
| Rotation          | Ghost model, orientation marker, port direction, doorway/path arrow, and quick rotate input.                                    |
| Replace           | Optional replace mode with refund rule, ownership, structural/damage warning, and important-object confirmation.                |
| Undo              | Short local construction history for accidental placement/removal with resource, ownership, damage, and multiplayer safeguards. |
| Copy/Sample       | Progression-based palette, shape, settings, room, and blueprint copying that still consumes resources and respects permissions. |
| Inspection        | Block name/state by default; hardness, tool, damage, magic, machine, village, and codex detail on demand.                       |

## 10.2 Blueprints and Projects

Blueprints exist both in the world and in a planner. The world view shows footprint, stages, conflicts, orientation, access routes, and physical scaffolds. The planner shows material totals, stage breakdown, nearby/warehouse/reserved/automated stock, workers, jobs, terrain conflicts, permissions, variants, time, and expected effect.

| **Blueprint Type** | **Special Rules**                                                                                                                 |
|--------------------|-----------------------------------------------------------------------------------------------------------------------------------|
| Player Blueprint   | Player controls location, palette, variants, phase, priority, and eligible automation supply.                                     |
| Village Project    | Village ownership, cultural design, request/permission, exact reserves, NPC builders, public effect, reputation, and event links. |
| Repair Project     | Damage-state comparison, urgent safety, material substitution, NPC approval, and restoration history.                             |
| Restoration/Claim  | Existing identity and history preserved; ownership, faction reaction, conversion choices, and discovered bonuses visible.         |
| Megaproject        | District/stage summaries, dependencies, workforce, routes, power/mana, politics, risk, and delegation dashboards.                 |

# 11. Automation, Power, Logistics, Storage, and Warehouse UX

## 11.1 Machine Panel

Interacting with a machine opens a compact local panel for common actions. An expandable view adds recipe selection, rates, upgrades, logs, permissions, network tracing, maintenance, and technical breakdown.

| **Field**       | **Required Presentation**                                                                                     |
|-----------------|---------------------------------------------------------------------------------------------------------------|
| Input/Output    | Slots or tanks, accepted tags, current amount, capacity, blocked/full state, import/export sides.             |
| Process         | Current recipe, batch, progress, actual/potential rate, time remaining, by-products.                          |
| Power/Fuel      | Type, source, consumption, available supply, capacity, stability, overload, disconnected reason.              |
| Ports/Direction | World-facing arrows, auto-connect state, wrench override, filters, priority, compact routing.                 |
| Condition       | Durability, maintenance need, damage, contamination/corruption, repair cost.                                  |
| Ownership       | Owner, party/settlement/village/faction access, output rights, dismantle rights, linked contract.             |
| Warnings        | Blocked output, missing input, no power, invalid recipe, permission, dangerous material, full storage.        |
| Impact          | Linked warehouse/project, items delivered, village reserve, defence effect, trade contract, current consumer. |

## 11.2 Inspection Overlays

| **Overlay**         | **Shows**                                                                                                 |
|---------------------|-----------------------------------------------------------------------------------------------------------|
| Item Flow           | Routes, direction, item family, actual/potential throughput, buffers, bottlenecks, overflow, destination. |
| Mechanical Power    | Sources, shafts/wheels, capacity, demand, losses, disconnected components, stalled sections.              |
| Electrical/Magitech | Wires/coils, generation, storage, demand, overload, instability, ownership.                               |
| Mana                | Sources, conduits, purity, storage, flow, consumers, leakage, corruption risk, ward links.                |
| Ports and Filters   | Input/output faces, accepted tags, priorities, manual overrides, blocked reasons.                         |
| Village Supply      | Warehouse route, permission, donation/sale/contract status, categories, project reserves, contribution.   |
| Maintenance/Risk    | Damage, wear, unsafe heat/pressure, pollution, magical instability, sabotage or raid vulnerability.       |

## 11.3 Warehouse Interface

Warehouses combine a physical inventory with civilisation summaries. The player can inspect category stock, daily use, projected shortages, project reserves, incoming automation, contracts, exports, ownership, access, delivery history, and multiplayer contribution without treating villagers as abstract numbers only.

# 12. Magic, Research, Skills, Perks, and Progression UX

## 12.1 Gradual Magic Reveal

1.  Before discovery, magic appears through world clues, unknown symbols, NPC behaviour, ruins, and unusual resources rather than a full mana dashboard.

2.  Collecting or studying mana creates a contextual explanation and codex clue.

3.  Learning a usable spell or rune reveals personal mana and the relevant spell/rune interface.

4.  Research, NPC teaching, books, cultures, and structures reveal additional schools, rituals, enchanting, alchemy, and infrastructure tabs.

5.  Advanced overlays, risk details, and optimisation appear as the player gains knowledge rather than at first contact.

## 12.2 Spell and Rune UX

| **System**      | **Locked UX**                                                                                                                        |
|-----------------|--------------------------------------------------------------------------------------------------------------------------------------|
| Spell Loadouts  | Manageable active set using hotbar, radial wheel, direct bindings, focuses, gear, and safe quick swapping.                           |
| Targeting       | Direct aim, lock-on, area preview, block face, structure, machine, ally, or ritual site according to spell.                          |
| Cost            | Icon value, mana-bar preview, cooldown, components, focus, range, and insufficient-state explanation.                                |
| Spellbook       | School, role, cost, target, risk, culture, discovery, favourite, loadout, and search filters.                                        |
| Runes           | Slot-based readable configuration with physical identity, compatibility, power, effect, purity, and advanced pattern support later.  |
| Incompatibility | Conflict explanation, likely effect, missing research/adapter, risk, and deliberate unstable-use option where allowed.               |
| Ward Coverage   | World effects plus optional coverage overlay, charge, strength, gaps, threats blocked, linked power, and failure state.              |
| Rituals         | Physical structure plus planning screen for components, participants, timing, location, power, progress, stability, and consequence. |

## 12.3 Research, Skills, and Perks

- Research uses an interconnected knowledge web linking subjects, evidence, recipes, NPCs, books, ruins, experiments, factions, and unresolved clues.

- The codex records knowledge and lore; research converts evidence into practical understanding and unlocks.

- Overall level is optional on the HUD, with milestone-focused feedback rather than constant XP spam.

- Use-based skills provide subtle contextual improvement and major milestone notices; detailed progress remains available in the skill screen.

- Perk trees or constellations are grouped by playstyle, searchable, previewable, and cross-linked to systems.

- Respec occurs through world fiction and shows full cost, affected perks, resulting build, confirmation, and saved loadouts where supported.

- Late-game dashboards use favourites, roles, delegation, alerts, and saved views instead of exposing every system at once.

# 13. NPC Dialogue, Villages, Reputation, Trade, Crime, and Faction UX

## 13.1 NPC Dialogue

Dialogue uses a readable panel that can focus the camera without freezing the world by default. The player sees speaker identity, job, known relationship, tone, laws or stakes when relevant, and clear response intent. Multiplayer interruptions, danger, authority, and voting are explicit rather than silently resolved.

| **Dialogue Element** | **Locked Rule**                                                                                                                          |
|----------------------|------------------------------------------------------------------------------------------------------------------------------------------|
| Choices              | Clear response list grouped by tone or intent; controller wheel may be used without reducing text clarity.                               |
| Consequences         | Show known intent and major irreversible stakes; preserve uncertainty in social and political outcomes.                                  |
| NPC Information      | Name and role by default; home, family, schedule, skill, needs, memories, faction, and relationship reveal as learned.                   |
| Generated Requests   | Use consistent need/project/contract language and display real resources, urgency, reward, deadline, and failure rule.                   |
| Interruption         | Danger, NPC schedule, player movement, multiplayer authority, and quest scope determine whether dialogue pauses, suspends, or continues. |
| Language             | Configurable from cosmetic flavour to partial translation with vocabulary, interpreters, context, and accessibility override.            |

## 13.2 Village Overview

The first view is a concise settlement health summary: stage, population, shortages, safety, projects, alerts, reputation, and recent events. Every summary links to NPCs, storage, jobs, households, projects, threats, trade, permissions, and history.

| **Tab**          | **Primary Information**                                                                                            |
|------------------|--------------------------------------------------------------------------------------------------------------------|
| Overview         | Stage, population, morale, needs, safety, projects, shortages, reputation, recent changes.                         |
| People           | Search/filter by name, job, household, need, skill, relationship, location, injury, alert.                         |
| Needs            | Category summary with affected people/jobs, cause, urgency, projected duration, and possible actions.              |
| Storage          | Physical item view, category stock, daily use, reserves, incoming supply, projected shortages, permissions.        |
| Projects         | Stages, materials, workers, location, blockers, priority, purpose, consequences, contribution.                     |
| Threats          | Known camps, raid confidence, defence readiness, unsafe routes, corruption, disease, weather, law pressure.        |
| Trade            | Stock, supply/demand, culture preference, contracts, routes, shortages, legality, reputation prices.               |
| Permissions/Laws | Building, storage, automation, weapons, magic, theft, access, offices, fines, permits, request path.               |
| History          | Deliveries, constructions, attacks, deaths, repairs, leadership, migration, conquest, restoration, player actions. |

## 13.3 Reputation and Factions

- Individual, village, culture, faction, trust, fear, respect, and legal standing are separate but linked.

- Descriptive states appear first; optional detailed values explain recent changes and access effects.

- Faction screens combine relationship summary, goals, territory, leaders, laws, trade, conflicts, treaties, player history, and confidence.

- Diplomacy uses graph and map views with treaties, grievances, wars, influence, disputed claims, and historical change.

- Territory is supported by physical banners, patrols, forts, roads, settlements, borders, influence, and uncertainty rather than solid colour alone.

## 13.4 Trade and Crime

Trade supports buy, sell, barter, contracts, stock, route context, culture preference, legality, reputation pricing, and supply/demand. Crime warnings identify ownership, jurisdiction, witnesses, classification, likely consequence, and request/permit alternatives. Reversible minor actions favour undo or warning; severe social consequences require deliberate confirmation.

# 14. Quests, Events, Journal, Maps, Exploration, Portals, and Dimensions

## 14.1 Journal and Tracking

| **Feature**        | **Locked UX**                                                                                                                    |
|--------------------|----------------------------------------------------------------------------------------------------------------------------------|
| Categories         | Personal, village, faction, project, contract, exploration, event, story, world, and completed history.                          |
| HUD Tracking       | Player-configurable limited objectives with priority, concise progress, and unobtrusive grouped updates.                         |
| Guidance           | Exact marker, search area, route, compass, rumour, environmental clue, or discovery-only according to settings and quest design. |
| Custom Objectives  | Notes, pins, routes, resource targets, build plans, reminders, contracts, and shareable goals.                                   |
| History            | Choices, contributors, outcomes, casualties, locations, rewards, structures, relationships, and later consequences.              |
| Spoiler Protection | Known facts by default, configurable hints and reward detail, accessibility clarity without automatic story reveal.              |

## 14.2 Map and Atlas

The map is layered fantasy cartography built from exploration, surveying, maps, roads, NPC knowledge, rumours, faction reports, and magic. It distinguishes exact observation from estimated or disputed knowledge.

| **Layer**    | **Information**                                                                                                     |
|--------------|---------------------------------------------------------------------------------------------------------------------|
| Surface      | Terrain, elevation, water, biomes, roads, structures, settlements, custom pins.                                     |
| Underground  | Cave levels, entrances, mines, ruins, hazards, surveyed routes, uncertain gaps.                                     |
| Civilisation | Villages, territories, roads, trade routes, patrols, danger, bridge/route condition.                                |
| Events       | Location confidence, area, movement, severity, duration, source, known objective.                                   |
| Resources    | Player-discovered clues, surveyed deposits, renewable nodes, depletion, ownership, route.                           |
| Magic        | Leylines, mana density, wards, corruption, shrines, ruins, anchors, portal routes.                                  |
| Realm Atlas  | Separate realm layers with portal connections, anchors, hazards, settlements, logistics, confidence, return routes. |

## 14.3 Portals and Realm Preparation

| **Portal Information** | **Required Fields**                                                                                |
|------------------------|----------------------------------------------------------------------------------------------------|
| Identity               | Frame, anchor, owner, culture/faction, damage, activation state.                                   |
| Destination            | Known realm/location, confidence, attunement, available anchors, route history.                    |
| Power                  | Fuel/mana source, current charge, required cost, stability, throughput, linked network.            |
| Travel Rules           | Player/cargo limits, party permissions, cooldown, return route, emergency return.                  |
| Hazards                | Environmental rules, protection, safe zone, known threats, corruption, time or gravity exceptions. |
| Preparation            | Equipment check, consumables, companions, quest warnings, unresolved unknowns, specialist advice.  |

# 15. Combat, Defence, Raids, Threats, and Aftermath UX

## 15.1 Adaptive Combat HUD

| **Element**    | **Locked Direction**                                                                                         |
|----------------|--------------------------------------------------------------------------------------------------------------|
| Enemy Health   | Configurable; targeted/damaged enemies show health, and earned knowledge can reveal detail.                  |
| Boss Display   | Readable phase/objective/mechanic display with optional component health and accessibility settings.         |
| Damage Numbers | Off, minimal, standard, detailed, or testing; healing and statuses separately configurable.                  |
| Hit Feedback   | Animation, sound, particles, optional reticle, vibration, and readable reaction without excessive clutter.   |
| Defence        | Guard strength, stamina cost, break risk, direction, and timing through animation, sound, and optional cues. |
| Ammunition     | Loaded/reserve, type, special effect, recoverability, and low-ammo state.                                    |
| Cooldowns      | Icon recharge, optional numbers, ready cue, mana/component distinction, and loadout visibility.              |
| Buildup        | Contextual meter, source, resistance, threshold, applied state, duration, and treatment.                     |
| Weaknesses     | World behaviour, effects, research, NPCs, loot, and codex; contextual reminders only after discovery.        |
| Allies         | Compact nearby health/downed/role/command/objective status with expanded party or defence view.              |

## 15.2 Raid and Defence Readiness

Raid UX combines uncertain intelligence with actionable preparation. It should not reveal exact attackers when the village has no scout, road report, watchtower, captive intelligence, or magic. Better infrastructure improves information quality as well as defence.

| **Area**           | **Required Feedback**                                                                                               |
|--------------------|---------------------------------------------------------------------------------------------------------------------|
| Readiness          | Guards, gear, ammunition, food, medicine, towers, walls, wards, traps, warning, morale, shelters.                   |
| Approach           | Confidence-based direction, route, timing, source, scouts, towers, patrols, roads, magic.                           |
| Watchtower         | Detection range, line of sight, staffing, ammunition, condition, warning improvement, raid contribution.            |
| Ward               | Coverage, charge, threat categories, gaps, linked source, instability, breach, defence contribution.                |
| Civilians          | Warning state, evacuation, shelters, unsafe zones, missing/injured alerts, optional individual tracking.            |
| Alternate Outcomes | Surrender, retreat, capture, negotiation, non-lethal options, morale, faction culture, objectives.                  |
| Defeat             | Downed/death flow, world continuation, losses, capture/recovery, tombstone, village outcome.                        |
| Aftermath          | Objectives, casualties, injuries, damage, theft, prisoners, contributions, reputation, history, repairs, follow-up. |

# 16. Main Menus, World Creation, Character Creation, Saves, and Loading

## 16.1 Main Menu and World Cards

The main menu prioritises Continue, Worlds, Multiplayer, New World, Settings, Accessibility, and Mods. The latest safe continuation is clear, but the game never hides the world list, backup state, version mismatch, or mod status behind a single continue button.

| **World Card Field**     | **Purpose**                                                            |
|--------------------------|------------------------------------------------------------------------|
| Screenshot and Name      | Immediate recognition.                                                 |
| Last Played and Playtime | Recency and investment.                                                |
| Character and Location   | Where the player will resume.                                          |
| World Version/Mods       | Compatibility and safe-mode context.                                   |
| World Settings           | Difficulty/preset and major consequence rules.                         |
| Settlement/Event State   | Concise optional reminder of active project, threat, or recent change. |
| Backup Health            | Last successful backup and recovery status.                            |
| Multiplayer State        | Host/server, last party, permissions, or join availability.            |

## 16.2 World Creation

New World offers fast presets and expandable guided categories. Presets describe the intended experience - Balanced, Cosy Builder, Harsh Survival, Civilisation Focus, Automation Focus, Exploration Focus, and Custom - rather than hiding consequences behind vague difficulty words.

- Worldgen: seed, size, density, terrain drama, biome/structure/resource presets.

- Survival and threat: needs, combat, raids, NPC permanence, structure damage, fire, corruption.

- Civilisation: village density, independent growth, economy, faction aggression, event pacing.

- Progression: guidance, recipe discovery, research pace, resource abundance, automation costs.

- Multiplayer: PvP, sharing, permissions, offline progression, host authority, split-screen.

- Accessibility: recommended preset can be applied before first play and edited later.

## 16.3 Character Creation

Character creation supports appearance, body, identity, voice, name, accessibility, and cosmetic preferences without classes, traditional attributes, backgrounds, or permanent power advantages. Culture/race choices, if later playable, require their own design lock and cannot contradict the equal-start progression foundation without revision.

## 16.4 Saves, Recovery, and Loading

- Subtle autosave indicator, clear manual-save confirmation, unsafe-exit warning, and no false success state.

- Corrupted or incompatible saves preserve the original and offer repair, safe mode, backup restore, mod/version review, and diagnostic export.

- Loading screens may show artwork, lore, tips, current objectives, and world changes, but never require reading or conceal errors.

- Save operations, backups, imports, and migrations use plain-language status and preserve player trust.

# 17. Tutorials, Onboarding, Codex, Help, and Player Learning

## 17.1 Tutorial Model

Tutorials are contextual, optional, replayable, and system-specific. Players may choose Minimal, Contextual, Guided, Full, or Custom. A veteran can disable prompts without losing codex/help access, while a new player can receive objectives, demonstrations, NPC teaching, practice, and reminders without being locked into a linear opening.

| **Learning Channel** | **Use**                                                                                             |
|----------------------|-----------------------------------------------------------------------------------------------------|
| Context Hint         | Brief first-use explanation near the relevant action.                                               |
| Optional Objective   | Teaches through real gameplay without blocking sandbox freedom.                                     |
| NPC Teaching         | Connects culture, village growth, relationship, recipes, magic, and jobs.                           |
| World Example        | Scaffold, damaged object, active machine, ward, road, ruin, or creature demonstrates function.      |
| Practice             | Safe combat, building, automation, magic, or control exercise with adjustable assistance.           |
| Codex Help           | Permanent searchable explanation, replay, controls, examples, related entries, and troubleshooting. |
| Resettable Hint      | Allows players to restore individual tutorials after a break or profile change.                     |

## 17.2 Codex Structure

The codex links blocks, items, recipes, resources, creatures, biomes, structures, cultures, factions, dimensions, quests, combat, laws, systems, tutorials, and discovered history. Entries respect knowledge state, contain practical information and lore separately, and support back-navigation and controller focus.

# 18. Accessibility, Difficulty, Content Warnings, and Inclusive Design

## 18.1 Accessibility Foundation

| **Area**                | **Requirements**                                                                                                                                                |
|-------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Vision                  | Text/UI scaling, reflow, contrast, filters, custom colours, patterns, labels, target outlines, reticle controls, no colour-only information.                    |
| Hearing                 | Dialogue subtitles, sound captions, source/direction/distance/urgency, visual alerts, vibration alternatives, speaker identity.                                 |
| Motor                   | Full remapping, hold/toggle, adjustable holds, timing windows, aim/lock assistance, repeated input alternatives, simplified input, no mandatory rapid tapping.  |
| Cognitive               | Progressive disclosure, plain-language summaries, grouped alerts, priorities, presets, favourites, search, reduced notification mode, repeatable tutorials.     |
| Motion/Photosensitivity | Shake, bob, FOV shift, blur, hit stop, particles, animated backgrounds, flashes, chromatic effects, camera transitions, and vibration independently adjustable. |
| Narration               | Labels, roles, values, focus order, control names, state changes, errors, and dynamic content exposed for screen-reader or platform narration.                  |
| Split-Screen            | Readable responsive layouts, independent scale, safe areas, identity patterns, and no requirement to read another player's panel.                               |

## 18.2 Difficulty

Difficulty is modular. Named presets provide a quick start, then the player or host can adjust survival, combat, enemy AI, telegraphs, raids, NPC death, structure damage, economy, magic risk, progression, guidance, death recovery, and automation consequences. Most settings can change after creation with clear warnings where exploit, generation, or irreversible world state is involved.

## 18.3 Content Warnings

Content warnings use spoiler-safe category descriptions and configurable presentation. Dark themes may include NPC death, injury, conquest, imprisonment, corruption, forbidden magic, family loss, or settlement destruction. Where practical, intensity or presentation can be adjusted without pretending the underlying world consequence did not occur.

# 19. Multiplayer, Co-op, Split-Screen, Permissions, and Communication

## 19.1 Multiplayer UI Extension

The solo interface remains the foundation. Multiplayer adds party status, player identity, pings, objective scope, authority, contribution, communication, ownership, permissions, PvP state, join/leave information, and offline change summaries without replacing the core controls.

| **Feature**        | **Locked Direction**                                                                                                                                   |
|--------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------|
| Party Status       | Health, downed, distance, realm, major condition, objective, communication; configurable compactness.                                                  |
| Shared Objectives  | Personal, party, settlement, faction, regional, or world scope with clear participants and authority.                                                  |
| Dialogue Authority | Quest owner, affected player, party role, settlement office, vote, faction rank, or host rule.                                                         |
| Contribution       | Gathering, crafting, building, supply, healing, defence, negotiation, research, transport, and leadership; cooperative rather than forced leaderboard. |
| Pings              | Danger, resource, destination, help, building, machine problem, NPC, project, portal, and custom.                                                      |
| Chat               | Local, party, settlement, faction, direct, server, and system filters; moderation and accessibility.                                                   |
| Voice              | Optional proximity, party, settlement, private; mute/volume/safety and captions where supported.                                                       |
| Trading            | Ground exchange, secure trade, contracts, shared storage, settlement logistics, later mail/delivery.                                                   |
| PvP                | World rules for damage, theft, sabotage, war, claims, duels, safe zones, consent, and consequence.                                                     |
| Drop-In/Out        | Safe join at last location, settlement, party portal, nearest safe point, or host-approved arrival.                                                    |
| Offline Summary    | Projects, production, attacks, shortages, diplomacy, contributions, and drill-down history.                                                            |
| Governance         | Permissions, difficulty, players, claims, moderation, backups, events, and audit history.                                                              |

## 19.2 Split-Screen

- Responsive layouts support horizontal and vertical splits and selected information density.

- Each player has independent menus and focus; pause behaviour is configurable and platform-aware.

- Identity uses colour plus pattern/icon/nameplate and remains accessibility-safe.

- Heavy dashboards may use simplified summaries in split view with an option to expand when the other player permits or the game is paused.

- Performance limits are visible and never silently remove critical information.

# 20. Settings, HUD Customisation, Notifications, and Quiet Modes

## 20.1 Settings Organisation

| **Category**     | **Examples**                                                                                       |
|------------------|----------------------------------------------------------------------------------------------------|
| Gameplay         | Interaction holds, auto-run, sprint/crouch, smart tools, aim, lock-on, pause rules.                |
| HUD              | Preset, scale, position, opacity, persistence, reticle, bars, numbers, map, tracker.               |
| Notifications    | System, priority, sound, banner, duration, marker, grouping, history, quiet mode.                  |
| Accessibility    | Vision, hearing, motor, cognition, motion, flashes, narration, captions, timing.                   |
| Audio/Haptics    | Master, music, dialogue, environment, machines, magic, combat, UI, captions, vibration categories. |
| Graphics/Camera  | FOV, shake, bob, blur, depth, particles, flashes, effects, third-person collision.                 |
| Difficulty/World | Modular survival, threat, raids, NPC, economy, magic, progression, guidance.                       |
| Multiplayer      | Chat, voice, pings, privacy, permissions, PvP visibility, split-screen.                            |
| Interface        | Language, text, localisation, controller glyphs, colour/pattern, culture/realm effects.            |
| Testing/Debug    | Only in development or authorised builds: overlays, logs, simulation, UI validation.               |

## 20.2 Notification Priority

| **Priority**  | **Examples**                                                                                          | **Behaviour**                                                        |
|---------------|-------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------|
| Critical      | Save failure, imminent death, catastrophic ritual, portal return failure, severe permission conflict. | Immediate multi-channel alert; cannot be buried by routine messages. |
| Urgent        | Raid arrival, civilian danger, machine hazardous overload, ally downed, settlement emergency.         | Prominent contextual alert with history and action link.             |
| Important     | Project stage, major unlock, reputation rank, quest outcome, shortage threshold.                      | Banner or summary with grouping and optional map/objective link.     |
| Routine       | Item pickup, repeated skill XP, normal production, minor delivery.                                    | Compact grouped feed or quiet summary.                               |
| Informational | Lore update, optional tip, background simulation.                                                     | Inbox/codex history; may remain silent.                              |

# 21. Errors, Confirmations, Recovery, History, and Trustworthy Feedback

## 21.1 Error Writing Pattern

| **Plain-Language Error Rule**                                                                                                                                                                                                                 |
|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| State what happened, why it happened if known, what data or progress is safe, what the player can do next, and where optional technical detail can be found. Never use a generic failure message when the system can identify the real cause. |

| **Situation**      | **Good Response Pattern**                                                                                                                |
|--------------------|------------------------------------------------------------------------------------------------------------------------------------------|
| Placement Failed   | Cannot place here: the doorway overlaps protected village land. Request building permission or move outside the boundary.                |
| Machine Stopped    | Iron Furnace stopped: output crate is full. Transfer ingots, connect another route, or enable overflow.                                  |
| Recipe Unavailable | Mana Furnace recipe is hinted but not learned. Study the rune ruin, ask a village mage, or research basic rune heat.                     |
| Trade Refused      | The merchant will not buy corrupted bone under Riverward law. A permit, different jurisdiction, or black-market contact may change this. |
| Portal Unsafe      | Return anchor is unpowered and destination stability is low. Travel may strand the party.                                                |
| Save Problem       | Autosave failed; the current session remains active. Manual save and last backup are available. No existing save was overwritten.        |

## 21.2 Confirmation and Undo

- Use undo for reversible placement, sorting, transfer, filter, pin, and layout actions.

- Use confirmation or hold for dismantling important machines, abandoning quests, spending rare resources, committing rituals, destroying unique items, declaring war, or changing irreversible world settings.

- Confirmation explains the exact object, quantity, ownership, dependent systems, and known consequence.

- Repeated safe actions can remember a preference; severe actions cannot be permanently silenced without an advanced setting.

## 21.3 History and Audit

Quest history, warehouse ledgers, raid records, contribution, permissions, ownership, law, save recovery, and server moderation use persistent records. History is searchable and human-readable first, with technical identifiers available for debugging rather than exposed as the primary explanation.

# 22. Technical UI Architecture, Data Binding, Performance, and Security

## 22.1 Data-Driven Requirements

- UI reads stable IDs and tagged data from system registries rather than parsing display text.

- Localisation keys, accessibility labels, icons, categories, knowledge gates, permission reasons, and planning status are separate fields.

- System data owns facts; UI transforms and formats but does not calculate hidden gameplay truth independently.

- Every screen defines loading, empty, stale, permission-denied, offline, error, and reduced-LOD states.

- Cross-links use stable routes and preserve back history, focus, filters, and knowledge checks.

## 22.2 Update Rates and LOD

| **UI Data**            | **Recommended Behaviour**                                                                             |
|------------------------|-------------------------------------------------------------------------------------------------------|
| Immediate Player State | Health, action, target, interaction, placement, damage, and input update at presentation frame rate.  |
| Local Machine State    | Progress and visible flow update smoothly; exact summary can update at a lower data tick.             |
| Network Summary        | Throughput, power, mana, warehouse, and bottleneck aggregate at controlled intervals.                 |
| Village Simulation     | Nearby detail updates frequently; distant settlements use event/state summaries and projected values. |
| Map/World Events       | Update on discovery, movement threshold, report, or event tick rather than every frame.               |
| History/Analytics      | Buffered and written asynchronously; never block critical gameplay or save confirmation.              |

## 22.3 Permissions and Security

- Server-authoritative actions validate transfers, crafting, damage, building, machine configuration, trade, dialogue authority, project contributions, and permissions.

- Client UI may predict presentation but must reconcile visibly and safely if the authoritative result differs.

- Permission-denied states explain the governing owner, role, law, or server rule without exposing private data.

- Admin/debug controls are role-gated, logged, and visually distinct from normal player actions.

# 23. Localisation, Modding, Testing, Analytics, and Debugging

## 23.1 Localisation

- All player-facing text uses localisation keys from the beginning.

- Layouts support text expansion, wrapping, pluralisation, grammatical gender where needed, right-to-left readiness, controller glyph substitution, and font fallback.

- Fantasy terminology uses clear functional headings and optional flavour subtitles; translation does not depend on English word length or word order.

- Culture-specific language mechanics are separate from product localisation.

## 23.2 Modding and Extensibility

Mods may add screens, tabs, widgets, icons, codex categories, notifications, interaction actions, style variants, or registry fields through documented extension points. Core navigation, accessibility labels, focus, permissions, and error states remain mandatory.

## 23.3 Testing and Analytics

| **Tool**              | **Purpose**                                                                                                                        |
|-----------------------|------------------------------------------------------------------------------------------------------------------------------------|
| UI Validation         | Missing localisation, inaccessible labels, invalid bindings, unsupported state, broken route, focus trap, contrast issue.          |
| Automated Flow Tests  | Inventory transfer, recipe craft, blueprint supply, machine blockage, warehouse permission, dialogue, raid warning, save recovery. |
| Screenshot Regression | Compare responsive layouts, culture/realm variants, font sizes, colour modes, and split-screen breakpoints.                        |
| Accessibility Audit   | Focus order, narration, captions, target size, colour independence, motion/flashes, reflow.                                        |
| Usability Metrics     | Optional privacy-conscious time-to-understand, repeated error, abandoned flow, notification dismissal, tutorial use.               |
| Debug Overlays        | Bindings, widget priority, safe area, update rate, network source, permissions, knowledge state, LOD, localisation key.            |

# 24. Proof-of-Concept UI/UX Scope

The POC interface must prove the connected game hook, not merely provide an inventory and health bar. It should let a first-time player gather, craft, understand a village need, deliver resources, configure a basic production chain, discover mana, support a ward, prepare for a raid, fight or assist, and understand the aftermath.

| **POC Area**            | **Required Components**                                                                                                      |
|-------------------------|------------------------------------------------------------------------------------------------------------------------------|
| Gameplay HUD            | Health, hotbar, contextual stamina/hunger/temperature, interaction prompt, pickups, objective, basic danger and status.      |
| Inventory/Equipment     | Slots, stacks, hotbar, search/filter-lite, transfer, equipment, durability, comparison.                                      |
| Crafting                | Hand/workbench/furnace/rune recipes, known/hinted states, batch quantity, missing inputs, basic queue/progress.              |
| Dialogue                | Named NPC, role, relationship state, response choices, request acceptance, interruption-safe flow.                           |
| Request Board           | Watchtower need, material totals, reward/consequence, accept/track, warehouse link.                                          |
| Warehouse               | Item grid, construction/magic/guard categories, project reserves, delivery ledger, permission state.                         |
| Project Progress        | Watchtower stages, resources, workers, blockers, physical construction link, completion effect.                              |
| Machine UI              | Input, output, recipe, power/fuel, progress, blocked state, ports, linked storage.                                           |
| Automation Overlay Lite | Direction, flow, blocked connection, basic throughput, warehouse destination.                                                |
| Magic                   | Mana reveal, one utility and one combat spell, rune table, mana furnace, ward charge and coverage.                           |
| Village/Reputation      | Compact settlement summary, trust/reputation, project and shortage, recent delivery.                                         |
| Map Lite                | Village, road, cave, ruin, goblin camp when discovered, custom pin, objective area.                                          |
| Raid                    | Warning, confidence/direction, preparation list, defence readiness, civilian danger, active objective.                       |
| Combat                  | Health/stamina/mana, weapon/ammo, target/attack cues, status, ally/guard state.                                              |
| Aftermath               | Outcome, casualties/injuries, structure damage, resources lost, contribution, reputation, follow-up.                         |
| Settings/Accessibility  | UI/text scale, subtitles/captions, colour/pattern, motion/shake/flash, input holds/toggles, aim/timing, notification preset. |
| Save/Pause              | Reliable save indicator, pause/settings, safe exit, death/tombstone recovery if included.                                    |

## 24.1 Explicitly Deferred Beyond POC

- Full perk forests and advanced build-loadout management.

- Complete faction diplomacy graph, ruler dashboard, laws, taxes, offices, and player-issued quest authoring.

- Full world and cross-realm atlas, advanced portals, realm logistics, and ritual planning.

- Large factory control rooms, train/portal routing, golem management, and region-scale production analytics.

- Complete multiplayer server administration, mail, auction systems, voice captioning, and mod browser.

- Full photo mode, advanced HUD drag editor, analytics platform, and every accessibility integration.

# 25. Proof-of-Concept Player Flows

| **Flow**                      | **Expected UX**                                                                                                                                      |
|-------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------|
| Flow 1 - First Survival       | Spawn -\> gather -\> contextual prompts -\> craft crude tool -\> equip hotbar -\> understand health/needs -\> create shelter.                        |
| Flow 2 - Village Discovery    | Follow road/smoke -\> village location appears -\> speak to elder -\> request board -\> track watchtower need -\> inspect warehouse permission.      |
| Flow 3 - Iron Supply          | Mine iron -\> recipe hint -\> furnace interface -\> process ingots -\> transfer/deliver -\> warehouse reserve -\> project stage updates.             |
| Flow 4 - Basic Automation     | Craft copper mechanism/chute -\> place and rotate -\> configure miner/furnace -\> diagnose power/blockage -\> route output -\> warehouse ledger.     |
| Flow 5 - Mana Discovery       | Find crystal/ruin -\> unknown clue -\> mage dialogue -\> mana UI reveal -\> rune table -\> mana furnace -\> ward charge/coverage.                    |
| Flow 6 - Raid Preparation     | Receive warning -\> readiness view -\> identify shortages -\> supply guards/ward/watchtower -\> pin tasks -\> see improved intelligence.             |
| Flow 7 - Raid                 | Adaptive combat HUD -\> defend objectives -\> guard/ward/tower feedback -\> civilians/shelters -\> captain threat -\> surrender/retreat where valid. |
| Flow 8 - Aftermath            | Outcome summary -\> casualties/damage -\> reputation/contribution -\> repair project -\> history record -\> next quest or sandbox choice.            |
| Flow 9 - Failure Recovery     | Machine error/save warning/player death -\> plain explanation -\> remedy/recovery -\> preserved state -\> return to previous task.                   |
| Flow 10 - Accessibility Setup | Preset at start or pause -\> live preview -\> apply scale/captions/motion/input -\> tutorial replay -\> continue without lost progress.              |

# 26. Detailed Screen Registry v0.1

| **Internal ID**               | **Screen**            | **Status**   | **Primary Purpose**                                                      |
|-------------------------------|-----------------------|--------------|--------------------------------------------------------------------------|
| ui.screen.gameplay_hud        | Gameplay HUD          | POC Required | Contextual player state, hotbar, prompts, objectives, danger, statuses.  |
| ui.screen.pause               | Pause and Session     | POC Required | Resume, save, settings, controls, help, exit, multiplayer/session state. |
| ui.screen.inventory           | Inventory             | POC Required | Items, stacks, search/filter, hotbar, transfer, details.                 |
| ui.screen.equipment           | Equipment             | POC Required | Armour, weapons, tools, accessories, backpack, stats, comparison.        |
| ui.screen.crafting_hand       | Hand Crafting         | POC Required | Basic recipes, amount, missing resources, unlock state.                  |
| ui.screen.crafting_station    | Station Crafting      | POC Required | Recipe, queue, input/output, time, fuel/power, risk.                     |
| ui.screen.recipe_book         | Recipe Book           | POC Required | Known/hinted recipes, search, station/category, favourites, links.       |
| ui.screen.dialogue            | NPC Dialogue          | POC Required | Speaker, choices, relationship, quest/trade actions, authority.          |
| ui.screen.request_board       | Village Request Board | POC Required | Needs, projects, contracts, alerts, rewards, consequences.               |
| ui.screen.quest_journal_lite  | Quest Journal Lite    | POC Required | Active/completed, tracking, objective, history summary.                  |
| ui.screen.warehouse           | Village Warehouse     | POC Required | Inventory, categories, reserves, permissions, ledger, shortages.         |
| ui.screen.project             | Project Detail        | POC Required | Stages, materials, workers, location, blockers, effect.                  |
| ui.screen.machine_compact     | Machine Compact Panel | POC Required | Input/output, process, power, blockage, ownership.                       |
| ui.screen.machine_detail      | Machine Detail        | Alpha        | Rates, modules, ports, maintenance, logs, network links.                 |
| ui.screen.automation_overlay  | Automation Overlay    | POC Required | Flow, direction, power, blocked state, destination.                      |
| ui.screen.spell_loadout       | Spell Loadout         | POC Required | Equipped spells, costs, bindings, focus, cooldown.                       |
| ui.screen.rune_table          | Rune Table            | POC Required | Rune slots, compatibility, cost, output, risk.                           |
| ui.screen.ward_inspection     | Ward Inspection       | POC Required | Coverage, charge, linked source, gaps, threats.                          |
| ui.screen.research            | Research Web          | Alpha        | Evidence, topics, unlocks, unresolved clues, cross-links.                |
| ui.screen.skills              | Skills                | Alpha        | Use-based progress, milestones, benefits, related perks.                 |
| ui.screen.perks               | Perk Trees            | Alpha        | Trees/constellations, prerequisites, preview, respec.                    |
| ui.screen.village_overview    | Village Overview      | POC Required | Health summary, shortages, projects, threats, reputation.                |
| ui.screen.village_people      | Village People        | Alpha        | NPC list, jobs, households, needs, skills, relationships.                |
| ui.screen.trade               | Trade                 | POC Required | Buy/sell/barter, price, stock, legality, culture preference.             |
| ui.screen.faction             | Faction Overview      | Beta         | Goals, territory, leaders, laws, relationships, history.                 |
| ui.screen.diplomacy           | Diplomacy Graph       | Final Game   | Treaties, grievances, wars, influence, confidence.                       |
| ui.screen.map_local           | Local Map             | POC Required | Terrain, POIs, routes, pins, objectives, discovery.                      |
| ui.screen.atlas               | World and Realm Atlas | Beta         | Regions, underground, realms, portals, routes, hazards.                  |
| ui.screen.portal              | Portal Inspection     | Alpha        | Anchor, destination, stability, power, cargo, return.                    |
| ui.screen.raid_preparation    | Raid Preparation      | POC Required | Warning, route, readiness, shortages, civilians, tasks.                  |
| ui.screen.raid_aftermath      | Raid Aftermath        | POC Required | Outcome, casualties, damage, contribution, reputation, repairs.          |
| ui.screen.codex               | Codex                 | Alpha        | Knowledge entries, lore, practical data, tutorials, links.               |
| ui.screen.settings            | Settings              | POC Required | Gameplay, HUD, accessibility, audio, camera, notifications.              |
| ui.screen.accessibility_setup | Accessibility Setup   | POC Required | Presets, live preview, text, captions, motion, input.                    |
| ui.screen.world_list          | World List            | POC Required | World cards, version, mods, backups, state, recovery.                    |
| ui.screen.world_creation      | World Creation        | POC Required | Presets, seed, difficulty, civilisation, multiplayer, accessibility.     |
| ui.screen.character_creation  | Character Creation    | POC Required | Appearance, identity, voice, cosmetics, accessibility.                   |
| ui.screen.multiplayer_lobby   | Multiplayer Lobby     | Alpha        | Players, world, permissions, chat, readiness, join.                      |
| ui.screen.server_governance   | Server Governance     | Beta         | Players, claims, rules, moderation, backups, audit.                      |
| ui.screen.save_recovery       | Save Recovery         | POC Required | Repair, safe mode, backup restore, version/mod diagnostics.              |

# 27. HUD Widget Registry v0.1

| **Internal ID**              | **Widget**         | **Purpose**                                           |
|------------------------------|--------------------|-------------------------------------------------------|
| ui.widget.reticle            | Reticle/Focus      | Contextual target and interaction state.              |
| ui.widget.hotbar             | Hotbar             | Selected item/tool/spell, count, durability, mode.    |
| ui.widget.health             | Health             | Current/max, damage, injury, healing.                 |
| ui.widget.stamina            | Stamina            | Exertion, guard, sprint, recovery.                    |
| ui.widget.mana               | Mana               | Current/max, cost preview, regen, insufficient state. |
| ui.widget.hunger             | Hunger             | State, escalation, meal buff.                         |
| ui.widget.temperature        | Temperature        | Exposure trend, hot/cold danger.                      |
| ui.widget.status             | Status Effects     | Buildup, duration, stack, severity.                   |
| ui.widget.objective          | Objective Tracker  | Limited tracked goals and progress.                   |
| ui.widget.pickup_feed        | Pickup Feed        | Grouped items and quantities.                         |
| ui.widget.unlock_feed        | Unlock Feed        | Major unlock and grouped learned content.             |
| ui.widget.interaction_prompt | Interaction Prompt | Action, input glyph, hold/radial hint.                |
| ui.widget.block_inspect      | Block Inspect      | Name, state, tool, ownership, damage.                 |
| ui.widget.placement          | Placement Preview  | Validity, orientation, resources, conflict.           |
| ui.widget.spell_slots        | Spell Slots        | Loadout, cooldown, cost, components.                  |
| ui.widget.ammunition         | Ammunition         | Loaded/reserve/type/low state.                        |
| ui.widget.target             | Target             | Enemy or object health/state/knowledge.               |
| ui.widget.damage_direction   | Damage Direction   | Source direction and type.                            |
| ui.widget.sound_caption      | Sound Caption      | Source, direction, distance, urgency.                 |
| ui.widget.party              | Party Status       | Health, downed, distance, realm, condition.           |
| ui.widget.raid_warning       | Raid Warning       | Confidence, time, direction, severity.                |
| ui.widget.raid_objective     | Raid Objective     | Active phases, protected targets, civilians.          |
| ui.widget.machine_state      | Machine State      | Process, power, blockage, warning.                    |
| ui.widget.flow_legend        | Overlay Legend     | Item/power/mana/port symbols and filters.             |
| ui.widget.ward               | Ward Status        | Charge, coverage, breach, linked source.              |
| ui.widget.reputation_change  | Reputation Change  | Layer, cause, direction, rank.                        |
| ui.widget.save_state         | Save State         | Saving, success, failure, backup.                     |
| ui.widget.location           | Location/Region    | Place, biome, territory, realm.                       |
| ui.widget.minimap            | Minimap/Compass    | Routes, discovered markers, guidance.                 |
| ui.widget.notification_inbox | Notification Inbox | Grouped history and unresolved alerts.                |

# 28. Notification and Alert Registry v0.1

| **Internal ID**                 | **Priority**  | **Purpose**                                        |
|---------------------------------|---------------|----------------------------------------------------|
| ui.notice.item_pickup           | Routine       | Grouped item pickup; quantity and rarity emphasis. |
| ui.notice.inventory_full        | Important     | Capacity reached; transfer/storage options.        |
| ui.notice.durability_low        | Important     | Condition threshold and repair link.               |
| ui.notice.recipe_learned        | Important     | Major recipe immediate; minor group summary.       |
| ui.notice.skill_milestone       | Important     | Meaningful skill improvement and benefit.          |
| ui.notice.reputation_changed    | Important     | Layer, cause, direction, access effect.            |
| ui.notice.village_shortage      | Important     | Category, urgency, projection, affected system.    |
| ui.notice.project_stage         | Important     | Stage complete, next needs, effect.                |
| ui.notice.machine_blocked       | Important     | Machine, cause, network trace.                     |
| ui.notice.machine_hazard        | Urgent        | Overload/instability/damage; immediate action.     |
| ui.notice.warehouse_permission  | Important     | Access granted/denied and reason.                  |
| ui.notice.raid_rumour           | Important     | Uncertain threat and source.                       |
| ui.notice.raid_imminent         | Urgent        | Approach, time/confidence, readiness link.         |
| ui.notice.civilian_danger       | Urgent        | Unsafe zone/shelter/missing NPC.                   |
| ui.notice.ally_downed           | Urgent        | Player/NPC, direction, revive or objective.        |
| ui.notice.ward_breach           | Urgent        | Coverage gap, charge, threat.                      |
| ui.notice.portal_unstable       | Critical      | Travel/return risk and mitigation.                 |
| ui.notice.ritual_catastrophic   | Critical      | Known catastrophic risk before commit.             |
| ui.notice.save_failed           | Critical      | Data safety, retry, manual save, backup.           |
| ui.notice.event_aftermath       | Important     | Outcome summary and follow-up.                     |
| ui.notice.offline_summary       | Informational | Layered changes since last session.                |
| ui.notice.tutorial_available    | Informational | Optional contextual help.                          |
| ui.notice.permission_violation  | Urgent        | Action, owner/law, consequence, cancel/request.    |
| ui.notice.world_setting_changed | Important     | Who changed it and gameplay effect.                |

# 29. Interaction Pattern Registry v0.1

| **Internal ID**               | **Pattern**     | **Purpose**                                                            |
|-------------------------------|-----------------|------------------------------------------------------------------------|
| ui.pattern.inspect            | Inspect         | Open detail without performing the primary action.                     |
| ui.pattern.quick_use          | Quick Use       | Safe common action from world or inventory.                            |
| ui.pattern.radial_actions     | Context Radial  | Resolve multiple valid actions consistently.                           |
| ui.pattern.compare            | Compare         | Side-by-side item, block, machine, spell, or project.                  |
| ui.pattern.transfer           | Transfer        | Move item with permissions and capacity feedback.                      |
| ui.pattern.split_stack        | Split Stack     | Single/half/custom quantity.                                           |
| ui.pattern.favourite          | Favourite/Lock  | Protect organisation and quick access.                                 |
| ui.pattern.search_filter      | Search/Filter   | Consistent query chips and saved views.                                |
| ui.pattern.pin                | Pin/Track       | Add objective, item, recipe, location, project, or alert.              |
| ui.pattern.configure          | Configure       | Edit ports, filters, permissions, loadouts, priorities.                |
| ui.pattern.preview_commit     | Preview/Commit  | Show cost, validity, risk, consequence before action.                  |
| ui.pattern.undo               | Undo            | Reverse safe recent local action.                                      |
| ui.pattern.hold_confirm       | Hold Confirm    | Deliberate destructive or severe action.                               |
| ui.pattern.permission_request | Request Access  | Explain owner/law and submit/request path.                             |
| ui.pattern.cross_link         | Cross-Link      | Open related codex, recipe, map, NPC, project, system.                 |
| ui.pattern.history            | View History    | Open ledger, event, contribution, save, or reputation record.          |
| ui.pattern.batch              | Batch/Queue     | Select quantity, time, priority, pause/cancel.                         |
| ui.pattern.drag_drop          | Drag and Drop   | Mouse/touch transfer with controller equivalents.                      |
| ui.pattern.back_breadcrumb    | Back/Breadcrumb | Preserve route, focus, scroll, filters.                                |
| ui.pattern.live_preview       | Live Preview    | Apply UI, accessibility, graphics, placement, or build preview safely. |

# 30. Core POC Scenario: Forest Hamlet Interface Loop

The player begins near the Riverward forest hamlet with the Standard HUD preset. Contextual prompts teach gathering and crude tools without forcing a fixed route. A road and smoke guide the player toward the settlement. Dialogue with the elder identifies the watchtower need, and the request board converts that need into a trackable project tied to real warehouse resources.

The player mines iron, opens the recipe book, operates a furnace, and transfers ingots. The warehouse shows delivery type, project reservation, contribution, and remaining shortage. The project screen and physical scaffolds show that builders consume the stock. The player then crafts copper mechanisms and a chute. Placement and machine panels explain orientation, power, input, output, blockage, and connection to the warehouse.

A rune ruin and village mage reveal mana gradually. The player learns a basic rune, uses the rune table, powers the mana furnace, and charges a ward. The ward is visible in the world, while inspection explains coverage, fuel, gaps, and threats. Later raid intelligence appears through NPCs, bells, the watchtower, map confidence, and a preparation screen rather than a disconnected countdown.

During the raid, the HUD reprioritises combat, defence objectives, civilians, guards, tower, and ward state. After the raid, the interface explains the graded outcome: casualties, injuries, structure damage, consumed supplies, contribution, reputation, and follow-up repairs. The world and history record match the summary. At no point should the player require developer debug text to understand why the result changed.

# 31. Balancing, Pacing, and Information-Load Rules

- Information is a progression reward, but basic safety and critical cause-and-effect remain readable from the start.

- Every persistent HUD element must justify its normal-play presence; otherwise it becomes contextual, collapsible, or menu-based.

- New systems reveal one useful action and one reason to care before exposing optimisation detail.

- Routine production and repeated XP use summaries; urgent changes escalate only when consequence or player action is required.

- Physical world feedback and UI values must agree. A glowing active ward cannot be empty; a visibly moving belt cannot report zero flow without explanation.

- Exact numbers are optional where possible, but the interface must still communicate relative state, trend, threshold, and cause.

- Difficulty and accessibility may change guidance, timing, display, and risk clarity without changing the underlying identity of systems.

- Expert views should never make the default experience dependent on spreadsheets, external notes, or hidden debug tools.

- POC UI polish focuses on clarity and connected flows before final art, animation, and every advanced screen.

# 32. Open Questions for Technical Implementation

- Which engine/UI framework will own responsive layout, input routing, narration metadata, and style tokens?

- How will first-person, third-person, controller, split-screen, and safe-area layouts share components without excessive branching?

- What data-binding and event model will prevent HUD polling from harming performance?

- How will system registries expose localisation, icons, knowledge gates, permission reasons, and UI formatting metadata?

- What screen-reader or platform narration support is practical for the first target platform?

- How will map data, world uncertainty, underground layers, and cross-realm atlas information be stored and streamed?

- How will multiplayer authority, contribution, dialogue voting, and permission changes be reflected without latency confusion?

- What is the save-safe representation for dismissed tutorials, custom HUD layouts, filters, pins, and recent history?

- How will modded screens and widgets be sandboxed, validated, localised, and prevented from creating focus/accessibility failures?

- Which POC usability tests and success metrics determine whether the interface is understandable without developer explanation?

# Appendix A. POC UI/UX Checklist

**☐** Gameplay HUD supports health, hotbar, contextual prompts, statuses, objectives, and warnings.

**☐** Keyboard/mouse and controller actions are remappable and menu navigation requires no mouse.

**☐** Inventory supports stacks, transfer, hotbar, equipment, durability, tooltip, and basic search/filter.

**☐** Crafting supports known/hinted recipes, missing requirements, quantities, station process, and progress.

**☐** NPC dialogue identifies speaker, role, relationship context, choices, and request result.

**☐** Request board shows the watchtower project, resources, reward/consequence, and tracking.

**☐** Warehouse shows physical stock, categories, project reserve, permission, and contribution.

**☐** Project screen shows stages, materials, workers, blocker, location, and completion effect.

**☐** Machine panel shows input, output, recipe, power, progress, blockage, ports, and linked destination.

**☐** Automation overlay shows direction, active flow, blockage, and warehouse route.

**☐** Mana UI reveals through discovery rather than at spawn.

**☐** Spell loadout, rune table, mana furnace, and ward feedback are understandable.

**☐** Village overview shows reputation, shortages, project, threat, and recent change.

**☐** Local map shows discovered village, road, cave, ruin, camp, objective, and custom pin.

**☐** Raid warning and preparation show confidence, route, readiness, shortages, and civilians.

**☐** Combat HUD shows immediate health/stamina/mana, weapon/ammo, target, status, and guard/ally information.

**☐** Aftermath explains outcome, casualties, damage, resources, contribution, reputation, and repair.

**☐** Settings provide UI/text scale, captions, colour/pattern, motion/flash, input/timing, aim, and notification presets.

**☐** Save/pause/recovery flows never claim success falsely and preserve data after error.

**☐** A first-time test player completes the loop without developer debug explanation.

# Appendix B. Screen and Widget Database Field Templates

## B.1 Screen Definition

| **Field**                  | **Purpose**                                                    |
|----------------------------|----------------------------------------------------------------|
| screen_id                  | Stable internal ID.                                            |
| display_name_key           | Localised screen title.                                        |
| route                      | Navigation route or modal key.                                 |
| screen_family              | HUD, inventory, management, map, dialogue, settings, platform. |
| layout_template            | Reusable layout definition.                                    |
| data_sources               | Registry/runtime records consumed.                             |
| knowledge_gate             | Minimum knowledge state.                                       |
| permission_gate            | Ownership, role, law, party, host, or world requirement.       |
| input_context              | Bindings and focus rules.                                      |
| pause_policy               | Solo, multiplayer, split-screen behaviour.                     |
| responsive_breakpoints     | Resolution, aspect, split orientation, text scale.             |
| accessibility_labels       | Narration title, regions, controls, dynamic values.            |
| empty_loading_error_states | Required non-happy states.                                     |
| cross_links                | Related screens and codex routes.                              |
| scope                      | Player, party, settlement, faction, world, server.             |
| planning_status            | POC Required, Alpha, Beta, Final Game, Placeholder, Deferred.  |

## B.2 Widget Definition

| **Field**       | **Purpose**                                                   |
|-----------------|---------------------------------------------------------------|
| widget_id       | Stable internal ID.                                           |
| widget_type     | Bar, icon, list, prompt, marker, panel, graph, feed.          |
| value_binding   | Source record and field path.                                 |
| transform       | Formatting, ranges, descriptor mapping, trend.                |
| visibility_rule | Context, priority, player setting, knowledge, permission.     |
| priority        | Critical, urgent, important, routine, informational.          |
| layout_slot     | Default HUD/screen region.                                    |
| variants        | Culture, realm, platform, accessibility, compact/full.        |
| interaction     | Hover, inspect, click, radial, pin, dismiss.                  |
| accessibility   | Label, value, role, state, alternative channel.               |
| animation       | Transition and reduced-motion alternative.                    |
| update_rate     | Frame, tick, event, summary.                                  |
| history_policy  | Whether changes enter notification/history.                   |
| planning_status | POC Required, Alpha, Beta, Final Game, Placeholder, Deferred. |

# Appendix C. Cross-System UI Requirement Matrix

| **System**         | **UI/UX Requirements**                                                                                  |
|--------------------|---------------------------------------------------------------------------------------------------------|
| Blocks             | Placement, shapes, state, hardness/tool, ownership, damage, repair, magic, machine ports, village role. |
| Items              | Inventory, stack, rarity, quality, tier, condition, equipment, lore, trade, legality, links.            |
| Recipes            | Discovery, station, inputs, substitutions, outputs, time, queue, power, risk, unlock, project.          |
| Resources          | Source, grade, purity, refinement, by-products, uses, prospecting, village need, automation.            |
| Player Progression | Level, skills, perks, research, mastery, unlocks, paths, respec, recent change.                         |
| NPC/Village        | Dialogue, people, needs, jobs, storage, projects, trust/fear, law, raids, history.                      |
| Automation         | Machine panel, ports, power, flow, throughput, blockage, storage, permissions, risk, LOD.               |
| Magic              | Mana, spell loadout, targeting, runes, rituals, wards, risk, codex, research, culture.                  |
| Creatures          | Target, awareness, health knowledge, behaviour, drops, weakness, nest/camp, codex, raid.                |
| Biomes/Worldgen    | Location, biome, climate, hazard, map, routes, resources, events, dynamic state.                        |
| Structures         | Discovery, ownership, state, danger, rewards, restoration, blueprint, map, history.                     |
| Cultures/Factions  | Identity, language, law, trade, territory, relationships, diplomacy, conflict, confidence.              |
| Dimensions         | Portal, anchor, destination, stability, hazards, protection, map, route, logistics, return.             |
| Quests/Events      | Journal, tracker, authority, contribution, alerts, personal goals, history, aftermath.                  |
| Combat/Defence     | Adaptive HUD, targeting, status, telegraph, allies, readiness, raids, civilians, aftermath.             |
| Technical/Save     | Loading, stale/offline, error, recovery, version, mods, permissions, debug, accessibility.              |

# Appendix D. Player Answer Lock 1-240

All questionnaire answers are locked to option E. The following range summary is the authoritative answer record for this version; Sections 1-23 translate those options into detailed design rules.

| **Questions** | **Answer** | **Locked Direction**                                                                                                                                                                                                                                                                        |
|---------------|------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 1-20          | E          | Adaptive hybrid identity, unified fantasy visual language, progressive disclosure, cultural/realm variants, readability-first, custom presets, full design-bible scope.                                                                                                                     |
| 21-40         | E          | Contextual HUD, resource/status feedback, interaction prompts, grouped notifications, risk and raid cues, peaceful building reprioritisation.                                                                                                                                               |
| 41-60         | E          | Full remapping, keyboard/controller support, contextual actions, hold/toggle, radial and smart tools, first/third person, aim/camera/accessibility controls, split-screen focus.                                                                                                            |
| 61-80         | E          | Slot inventory, search/filter/sort, stack and transfer tools, connected storage, knowledge-aware recipes, batch/queues/risk, equipment, backpacks, repair, lore, quest-item protection.                                                                                                     |
| 81-100        | E          | Rich placement previews, snapping/shapes/rotation, replace/copy/undo, world and planner blueprints, project stages, machine panels, overlays, throughput, blockage, warehouses, permissions.                                                                                                |
| 101-120       | E          | Gradual mana reveal, spell loadouts and targeting, spellbook, rune compatibility, rituals, risk, wards, knowledge web, codex links, levels/skills/perks/respec, endgame dashboards.                                                                                                         |
| 121-140       | E          | Hybrid dialogue, intent choices, learned NPC detail, layered reputation/trust/fear, village health, people/needs/projects/storage, trade/law/crime, faction/diplomacy/territory, language settings.                                                                                         |
| 141-160       | E          | Searchable journal, configurable tracking/guidance, environmental clues, custom goals, layered map, events, history/spoilers, portal inspection, realm preparation and cross-realm atlas.                                                                                                   |
| 161-180       | E          | Adaptive combat HUD, knowledge-based enemy information, boss phases, configurable numbers, multimodal hits/defence, ammunition/cooldowns/statuses, allies, raid readiness, civilians, surrender, defeat, aftermath.                                                                         |
| 181-200       | E          | Contextual repeatable tutorials, guided system introductions, named plus custom difficulty, accessibility presets, scalable text, non-colour cues, narration, captions, reduced motion/flashes, input/cognitive support, content warnings, live previews.                                   |
| 201-220       | E          | Multiplayer extension, responsive split-screen, independent menus, accessible identity, shared scope/authority, broad contribution, pings/chat/voice, secure trade, ownership/build permissions, PvP rules, drop-in/out, offline summaries, governance.                                     |
| 221-240       | E          | Main/world menus, detailed save cards, quick and advanced world creation, classless character customisation, reliable saves/recovery/loading, photo/controller/localisation/data architecture, cross-links/errors/confirmations/notifications/testing, complete POC scope and success test. |

# Appendix E. Future UI/UX Backlog

- Advanced drag-and-drop HUD layout editor and shareable layout profiles.

- Full settlement ruler dashboard: districts, laws, offices, taxes, public works, population, diplomacy.

- Region-scale logistics control rooms for roads, rails, portals, caravans, and golem workforces.

- Complete faction relationship simulation graph and historical political timeline.

- Advanced cross-realm atlas with dimensional route capacity, stability, trade, and military movement.

- Ritual planner for multi-site, multi-participant, astronomical, seasonal, and world-scale magic.

- Full companion command, squad formation, guard deployment, siege command, and tactical pause options where allowed.

- In-game blueprint library, tagging, sharing, versioning, culture conversion, and collaborative editing.

- Mod browser, content dependency viewer, UI extension permissions, and compatibility diagnostics.

- Photo mode, replay, settlement time-lapse, before/after world comparison, and event chronicle presentation.

- Advanced screen-reader support, voice control, eye-tracking hooks, alternative input device profiles, and automated accessibility testing.

- Optional AI-assisted search, help, and troubleshooting constrained to discovered knowledge and player privacy.

# Appendix F. POC Success Criteria

| **Criterion**            | **Pass Condition**                                                                                                                                            |
|--------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Discoverability          | New players identify interaction, inventory, crafting, village requests, warehouse, machines, mana, ward, and raid preparation without external instructions. |
| Cause and Effect         | Players can explain why the watchtower progresses, why a machine stops, why the warehouse accepts or rejects supply, and how preparation changes the raid.    |
| Information Load         | The default HUD remains visually open during exploration and building; deeper information is available within one or two intentional actions.                 |
| Input Parity             | The complete POC loop is playable with keyboard/mouse and controller without cursor-only blockers.                                                            |
| Accessibility            | Core information remains available with colour filters, larger text, captions, reduced motion/flashes, and alternative timing/input settings.                 |
| Error Recovery           | Players recover from inventory capacity, placement failure, machine blockage, permission denial, death, and save warning without losing unexplained progress. |
| World/UI Agreement       | Physical machine, ward, project, raid, damage, and NPC states match interface summaries.                                                                      |
| Multiplayer Readiness    | Data and layouts can represent owner, party, contribution, permissions, and split-screen focus even if full online systems are deferred.                      |
| Performance              | HUD and local panels remain responsive; network/village summaries do not require high-frequency full simulation.                                              |
| No Developer Explanation | A representative test player completes the Forest Hamlet connected loop and accurately describes the outcome without debug text or live developer coaching.   |

*End of 17 - UI/UX System - Version 0.1*
